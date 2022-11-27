#include "user_config.h"
#include "bios.h"
#include "sdk/add_func.h"
#include "hw/esp8266.h"
#include "user_interface.h"
#include "web_iohw.h"
#include "flash_eep.h"
#include "webfs.h"
#include "sdk/libmain.h"
#include "driver/eeprom.h"
#include "hw/gpio_register.h"
#include "wireless_co2.h"
#include "iot_cloud.h"
#include "driver/spi.h"
#include "driver/nrf24l01.h"
#include "tcp2uart.h"
#include "web_utils.h"

os_timer_t user_loop_timer DATA_IRAM_ATTR;

char AZ_7798_Command_Info[] = 		{ "I\r" };
char AZ_7798_Command_SetTime[] =	{ "C 1234567890\r" }; // number of seconds from 1 jan 2000 (946674000)
#define AZ_7798_Command_SetTimeOffset 946684800
//char AZ_7798_Command_SetTimeOk =	'>';
char AZ_7798_Command_GetValues[] = 	{ ":\r" };
// : T20.4C:C1753ppm:H47.5%
#define MIN_Reponse_length 			20
#define AZ_7798_TempStart 			'T'
#define AZ_7798_TempEnd 			'C'
#define AZ_7798_CO2End				'p'
char AZ_7798_ResponseEnd[] = 		{ "%\r\0" };

uint8 CO2_work_flag = 0; // 0 - not inited, 1 - wait incoming, 2 - send
uint8 CO2_send_flag;		// 0 - ready to send, 1 - sending
uint8 CO2_send_fan_idx;
uint8 nrf_last_rf_channel = 255;
uint16 receive_timeout; // sec
#define CO2LevelAverageArrayLength 10
uint16_t CO2LevelAverageIdx = CO2LevelAverageArrayLength;
uint16_t CO2LevelAverageArray[CO2LevelAverageArrayLength];

void dump_NRF_registers(void) ICACHE_FLASH_ATTR;
//#define dump_NRF_registers()

void ICACHE_FLASH_ATTR set_new_rf_channel(uint8 ch)
{
	if(nrf_last_rf_channel != ch) {
		#if DEBUGSOO > 4
			os_printf("NRF-New ch %d\n", ch);
		#endif
		NRF24_WriteByte(NRF24_CMD_W_REGISTER | NRF24_REG_RF_CH,	ch);
		nrf_last_rf_channel = ch;
	}
}

void ICACHE_FLASH_ATTR CO2_Averaging(void)
{
	int16_t i;
	if(CO2LevelAverageIdx == CO2LevelAverageArrayLength) { // First time
		for(i = 1; i < CO2LevelAverageArrayLength; i++)	CO2LevelAverageArray[i] = CO2level;
	}
	if(++CO2LevelAverageIdx >= CO2LevelAverageArrayLength) CO2LevelAverageIdx = 0;
	CO2LevelAverageArray[CO2LevelAverageIdx] = CO2level;
}

// fan = 255 - all
void ICACHE_FLASH_ATTR CO2_set_fans_speed_current(uint8 nfan)
{
	uint32_t average = 0;
	int16_t i;
	for(i = 0; i < CO2LevelAverageArrayLength; i++) average += CO2LevelAverageArray[i];
	average /= CO2LevelAverageArrayLength;
	int8_t fanspeed;
	for(fanspeed = 0; fanspeed < FAN_SPEED_MAX; fanspeed++) {
		uint16_t tr = cfg_glo.fans_speed_threshold[fanspeed];
		if(average < tr) {
			// if there is a decrease of CO2 level - check delta
			if(fan_speed_previous <= fanspeed || (tr - average) >= cfg_glo.fans_speed_delta) break;
		}
	}
	fan_speed_previous = fanspeed;
	fanspeed += global_vars.fans_speed_override;
	for(i = sizeof(cfg_glo.temp_threshold_dec)/sizeof(cfg_glo.temp_threshold_dec[0]) - 1; i >= 0 ; i--) {
		if(Temperature < cfg_glo.temp_threshold_dec[i]) {
			fanspeed -= i + 1;
			break;
		}
	}
	if(fanspeed > FAN_SPEED_MAX) fanspeed = FAN_SPEED_MAX;
	if(fanspeed < 0) fanspeed = 0;
	struct tm tm;
	time_t t = get_sntp_localtime();
	_localtime(&t, &tm);
	uint16 st, end, tt = tm.tm_hour * 60 + tm.tm_min; // min
	if(tm.tm_wday == 0 || tm.tm_wday == 6) { // Weekend?
		st = cfg_glo.night_start_wd;
		end = cfg_glo.night_end_wd;
	} else {
		st = cfg_glo.night_start;
		end = cfg_glo.night_end;
	}
	st = (st / 100) * 60 + st % 100;
	end = (end / 100) * 60 + end % 100;
	now_night = ((end > st && tt >= st && tt <= end) || (end < st && (tt >= st || tt <= end)));
	uint8 night = now_night_override == 2 ? 1 : now_night_override == 1 ? 0 : now_night;
	if(night && fanspeed > cfg_glo.fans_speed_night_max) fanspeed = cfg_glo.fans_speed_night_max;
	uint8 fan;
	if(nfan == 255) {
		fan = 0;
		nfan = cfg_glo.fans;
	} else fan = nfan++;
	for(; fan < nfan; fan++) {
		if(fans[fan].forced_speed_timeout) continue;
		CFG_FAN *f = &cfg_fans[fan];
		int8_t fsp = fanspeed;
		if(night) {
			if(f->override_night == 1) fsp = f->speed_night; // =
			else if(f->override_night == 2) fsp += f->speed_night; // +
		} else {
			if(f->override_day == 1) fsp = f->speed_day; // =
			else if(f->override_day == 2) fsp += f->speed_day; // +
		}
		if(fsp < f->speed_min) fsp = f->speed_min;
		if(fsp > f->speed_max) fsp = f->speed_max;
		fans[fan].speed_current = fsp;
	}
}

void ICACHE_FLASH_ATTR ProcessIncomingValues(void)
{
	time_t t = get_sntp_localtime();
	CO2_Averaging();
	if(CO2_last_time) {
		uint16 d = t - CO2_last_time;
		if(average_period == 0) average_period = d;
		else average_period = (average_period + d) / 2;
	}
	if(history_co2 != NULL) { // store history co2
		uint32 idx = history_co2_pos * 15;
		uint8  idxt = idx % 10;
		idx /= 10;
		if(idx >= cfg_glo.history_size - 2) { // (history_glo_size / 1.5 - 1) * 1.5
			history_co2_full = 1;
			history_co2_pos = 0;
		} else history_co2_pos++;
		// MSB(32 13 21 ...)
		if(idxt) history_co2[idx] = ((CO2level & 0xF00) >> 8) | (history_co2[idx] & 0xF0);
		else history_co2[idx] = (CO2level & 0xFF0) >> 4;
		if(idxt) history_co2[idx+1] = CO2level & 0x0FF;
		else history_co2[idx+1] = (CO2level & 0x00F) << 4;
	}
	CO2_last_time = t;
	#if DEBUGSOO > 4
		os_printf("Received at %u, CO2: %u, T: %d, H: %u\n", CO2_last_time, CO2level, Temperature, Humidity);
	#endif
	#ifdef DEBUG_TO_RAM
		if(Debug_RAM_addr != NULL && CO2level > 1200) {
			struct tm tm;
			_localtime(&CO2_last_time, &tm);
			dbg_printf("%d %d:%d:%d=%u\n", tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec, CO2level);
		}
	#endif
	CO2_set_fans_speed_current(255);
	iot_cloud_send(1);
}

void ICACHE_FLASH_ATTR uart_recvTask(os_event_t *events)
{
    if(events->sig == 0){
		#if DEBUGSOO > 4
    		os_printf("%s\n", UART_Buffer);
		#endif
    	if(UART_Buffer_idx >= MIN_Reponse_length) {
    		UART_Buffer[UART_Buffer_size-1] = 0;
    		uint8 *p = web_strnstr(UART_Buffer, AZ_7798_ResponseEnd, UART_Buffer_idx);
    		if(p == NULL) return;
   			*p = 0;
   			if((p = os_strchr(UART_Buffer, AZ_7798_TempStart)) == NULL) return;
   			p++;
			uint8 *p2 = os_strchr(p, AZ_7798_TempEnd);
			if(p2 == NULL) return;
			*p2 = 0;
			Temperature = atoi_z(p, 1);
			p = p2 + 3;
			if((p2 = os_strchr(p, AZ_7798_CO2End)) != NULL) {
				*p2 = 0;
				CO2level = atoi_z(p, 1);
				p = p2 + 5;
				Humidity = atoi_z(p, 1);
				ProcessIncomingValues();
				CO2_work_flag = 1;
				receive_timeout = 0;
			}
    	}
    }
}

void ICACHE_FLASH_ATTR user_loop(void) // call every 1 sec
{
#if DEBUGSOO > 5
	os_printf("UL: %u\n", system_get_time());
	if(receive_timeout == 0) return;
#endif
	uint8 fan;
	for(fan = 0; fan < cfg_glo.fans; fan++) {
		FAN *f = &fans[fan];
		if(f->forced_speed_timeout) f->forced_speed_timeout--;
		if(!f->powered_off && get_sntp_localtime() - f->transmit_ok_last_time > cfg_fans[fan].timeout) f->transmit_last_status |= 8;
	}
	if(sntp_status == 1) { // New time - send it to CO2 meter
		sntp_status = 2;
		uart_drv_start();
		uart_tx_buf(AZ_7798_Command_SetTime, 2 + ets_sprintf(&AZ_7798_Command_SetTime[2], "%u\r", get_sntp_localtime() - AZ_7798_Command_SetTimeOffset));
		return;
	}
	if(receive_timeout)	receive_timeout--;
	if(receive_timeout == 0) {
		if(CO2_work_flag == 0) { // Send request to CO2 meter
			os_memset(UART_Buffer, 0, UART_Buffer_size);
			UART_Buffer_idx = 0;
			uart_drv_start();
			uart_tx_buf(AZ_7798_Command_GetValues, sizeof(AZ_7798_Command_GetValues));
		} else if(CO2_work_flag == 1) { // New CO2
			if(CO2level) {
				dump_NRF_registers();
				NRF24_SendCommand(NRF24_CMD_FLUSH_TX); // Received and ACK was received by TX device
				NRF24_WriteByte(NRF24_CMD_W_REGISTER | NRF24_REG_STATUS, (1<<NRF24_BIT_TX_DS));
				uint8 fan;
				for(fan = 0; fan < cfg_glo.fans; fan++) {
					CFG_FAN *f = &cfg_fans[fan];
					if(f->flags & (1<<FAN_SKIP_BIT)) continue;
					if(WriteFanEEPROM && (WriteFanEEPROM-1) == fan) {
						co2_send_data.CO2level = 0xFDEF;
						co2_send_data.FanSpeed = WriteFanEEPROM_addr;
						co2_send_data.Pause = WriteFanEEPROM_value;
						WriteFanEEPROM = 0;
					} else {
						co2_send_data.CO2level = CO2level;
						co2_send_data.FanSpeed = fans[fan].speed_current;
						co2_send_data.Pause = f->pause;
					}
					NRF24_WriteArray(NRF24_CMD_W_ACK_PAYLOAD + fan, (uint8 *)&co2_send_data, sizeof(co2_send_data));
					#if DEBUGSOO > 4
						os_printf("NRF%d->%d, %d\n", fan, co2_send_data.FanSpeed, co2_send_data.Pause);
					#endif
				}
				//dump_NRF_registers();
			}
			CO2_work_flag = 0;
		}
		receive_timeout = global_vars.receive_timeout;
	}
	//if(CO2level) {
		//dbg_printf(" %x", NRF24_SendCommand(NRF24_CMD_NOP));
		uint8 pipe;
		if((pipe = NRF24_Receive(NRF24_Buffer)) != NRF24_RX_FIFO_EMPTY) { // check request
			#if DEBUGSOO > 4
				os_printf("NRF read pipe %d: %X\n", pipe, NRF24_Buffer[0]);
			#endif
			dump_NRF_registers();
			if(pipe < cfg_glo.fans) {
				FAN *f = &fans[pipe];
				uint8_t st = NRF24_Buffer[0];
				f->transmit_ok_last_time = get_sntp_localtime();
				if(st == 0xEE) { // broken EEPROM cell
					cfg_fans[pipe].broken_cell_last_time = f->transmit_ok_last_time;
					write_wireless_fans_cfg();
				} else {
					f->transmit_last_status = (st >> 5) & 0b111;
					f->adjust_speed = st & 0b1111;
					if(f->adjust_speed & 0b1000) f->adjust_speed |= 0xF0; // negative number
					f->powered_off = (st & 0b10000) != 0;
				}
				#ifdef DEBUG_TO_RAM
					if(Debug_RAM_addr != NULL && f->transmit_last_status) {
						struct tm tm;
						_localtime(&CO2_last_time, &tm);
						dbg_printf("%02d:%02d:%02d NRF%d=%X\n", tm.tm_hour, tm.tm_min, tm.tm_sec, pipe, st);
					}
				#endif
			}
		}
	//}
}

void  ICACHE_FLASH_ATTR send_fans_speed_now(uint8 fan, uint8 calc_speed)
{
	//dump_NRF_registers();
	if(calc_speed) CO2_set_fans_speed_current(fan);
	CO2_work_flag = 1;
}

// 1 - first stage (in app_main), 2 - second
void ICACHE_FLASH_ATTR user_initialize(uint8 index)
{
	if(index == 1) {
		// Set GPIO0
		//SET_PIN_FUNC_IOPORT(0); // Set func GPIOx in port i/o
		//SET_PIN_PULLUP_DIS(0);	// PULLUP_DIS
		//GPIO_ENABLE_W1TS = (1<<0); // Configure GPIO port to output
		//GPIO_OUT_W1TS = (1<<0); // Set hi
		//
	} else {
		if(flash_read_cfg(&cfg_glo, ID_CFG_CO2, sizeof(cfg_glo)) <= 0) {
			// defaults
			os_memset(&cfg_glo, 0, sizeof(cfg_glo));
			cfg_glo.page_refresh_time = 2000;
			cfg_glo.csv_delimiter = ',';
			cfg_glo.sensor_rf_channel = 120;
			cfg_glo.fans = 0;
			cfg_glo.fans_speed_threshold[0] = 530;
			cfg_glo.fans_speed_threshold[1] = 590;
			cfg_glo.fans_speed_threshold[2] = 650;
			cfg_glo.fans_speed_threshold[3] = 725;
			cfg_glo.fans_speed_threshold[4] = 800;
			cfg_glo.fans_speed_threshold[5] = 900;
			cfg_glo.fans_speed_delta = 30;
			uint8 i;
			for(i = 0; i < sizeof(cfg_glo.temp_threshold_dec)/sizeof(cfg_glo.temp_threshold_dec[0]); i++) {
				cfg_glo.temp_threshold_dec[i] = -50 - i;
			}
		}
		if(cfg_glo.history_size <= 9) cfg_glo.history_size = 9999; // bytes
		if(flash_read_cfg(&cfg_fans, ID_CFG_FANS, sizeof(cfg_fans)) != sizeof(cfg_fans)) {
			os_memset(&cfg_fans, 0, sizeof(cfg_fans));
		}
		if(flash_read_cfg(&global_vars, ID_CFG_VARS, sizeof(global_vars)) <= 0) {
			os_memset(&global_vars, 0, sizeof(global_vars));
			global_vars.receive_timeout = 20;
		}
		receive_timeout = global_vars.receive_timeout * 2;
		fan_speed_previous = 0;
		os_memset(&fans, 0, sizeof(fans));
		ets_timer_disarm(&user_loop_timer);
		os_timer_setfn(&user_loop_timer, (os_timer_func_t *)user_loop, NULL);
		ets_timer_arm_new(&user_loop_timer, 1000, 1, 1); // 1s, repeat
		NRF24_init(); // After init transmit must be delayed
		set_new_rf_channel(cfg_glo.sensor_rf_channel);
		uint8 fan, ok = 0;
		for(fan = 0; fan < cfg_glo.fans; fan++) {
			CFG_FAN *f = &cfg_fans[fan];
			if(f->address_LSB == 0 || f->flags & (1<<FAN_SKIP_BIT)) continue;
			if((ok = NRF24_SetRXAddress(fan, f->address_LSB)) == 0) break;
		}
		if(ok) {
			NRF24_SetMode(NRF24_ReceiveMode);
			#if DEBUGSOO > 4
		} else {
				os_printf("NRF-SetAddr failed\n");
			#endif
		}
		iot_cloud_init();
		if(history_co2 == NULL) {
			history_co2 = os_malloc(cfg_glo.history_size);
			history_co2_full = 0;
		}
		uarts_init();
		//dump_NRF_registers();

	//	#if DEBUGSOO > 4
	//		os_printf("\n");
	//		for(; history_co2_len < 256; history_co2_len++) {
	//			history_co2[history_co2_len] = 300 + (os_random() & 0x7FF);
	//			os_printf("%d, ", history_co2[history_co2_len / 2]);
	//		}
	//		CO2_last_time = 1465995660;
	//		average_period = 10;
	//		os_printf("\n");
	//	#endif
	}
}

bool ICACHE_FLASH_ATTR write_wireless_co2_cfg(void) {
	return flash_save_cfg(&cfg_glo, ID_CFG_CO2, sizeof(cfg_glo));
}

bool ICACHE_FLASH_ATTR write_wireless_fans_cfg(void) {
	return flash_save_cfg(&cfg_fans, ID_CFG_FANS, sizeof(cfg_fans));
}

bool ICACHE_FLASH_ATTR write_global_vars_cfg(void) {
	return flash_save_cfg(&global_vars, ID_CFG_VARS, sizeof(global_vars));
}

///*
void ICACHE_FLASH_ATTR dump_NRF_registers(void)
{
	#if DEBUGSOO == 0
		if(Debug_level != 2) return;
	#endif
	uint8 i;
	uint8 buf[4];
	dbg_printf("\nNR: ");
	#if DEBUGSOO > 4
	os_printf("\nNR: ");
	#endif
	for(i = 0; i <= 0x17; i++) {
		NRF24_ReadArray(NRF24_CMD_R_REGISTER + i, buf, 1);
		dbg_printf("%X:%02x ", i, buf[0]);
		#if DEBUGSOO > 4
		os_printf("%X=%02x ", i, buf[0]);
		#endif
	}
	NRF24_ReadArray(NRF24_CMD_R_REGISTER + 0x1C, buf, 1);
	NRF24_ReadArray(NRF24_CMD_R_REGISTER + 0x1D, buf+1, 1);
	dbg_printf("1C:%02x 1D:%02x\n", buf[0], buf[1]);
	#if DEBUGSOO > 4
	os_printf("1C=%2x 1D=%02x\n", buf[0], buf[1]);
	#endif
}
//*/
