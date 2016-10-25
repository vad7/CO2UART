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

char AZ_7798_Command_Info[] = 		{ 'I', 0x0D };
char AZ_7798_Command_GetValues[] = 	{ ':', 0x0D };
// : T20.4C:C1753ppm:H47.5%
#define MIN_Reponse_length 			20
#define AZ_7798_TempStart 			'T'
#define AZ_7798_TempEnd 			'C'
#define AZ_7798_CO2End				'p'
char AZ_7798_ResponseEnd[] = 		{ '%', 0x0D, 0 };
#define AZ_7798_ResponseTimeout		2 // sec

uint8 CO2_work_flag = 0; // 0 - not inited, 1 - wait incoming, 2 - send
uint8 CO2_send_flag;		// 0 - ready to send, 1 - sending
uint8 CO2_send_fan_idx;
uint8 nrf_last_rf_channel = 255;
uint16 receive_timeout; // sec
#define CO2LevelAverageArrayLength 6
uint16_t CO2LevelAverageIdx = CO2LevelAverageArrayLength;
uint16_t CO2LevelAverageArray[CO2LevelAverageArrayLength];

/*
void dump_NRF_registers(void)
{
	uint8 i;
	uint8 buf[4];
	dbg_printf("\nNR: ");
	#if DEBUGSOO > 4
	os_printf("\nNR: ");
	#endif
	for(i = 0; i <= 0x1D; i++) {
		NRF24_ReadArray(NRF24_CMD_R_REGISTER + i, buf, 1);
		dbg_printf("%X=%2x ", i, buf[0]);
		#if DEBUGSOO > 4
		os_printf("%X=%2x ", i, buf[0]);
		#endif
	}
	dbg_printf("\n");
	#if DEBUGSOO > 4
	os_printf("\n");
	#endif
}
*/

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
	if(CO2LevelAverageIdx >= CO2LevelAverageArrayLength) CO2LevelAverageIdx = 0;
	CO2LevelAverageArray[CO2LevelAverageIdx++] = CO2level;
}

// fan = 255 - all
void ICACHE_FLASH_ATTR CO2_set_fans_speed_current(uint8 nfan)
{
	uint32_t average = 0;
	uint16_t i;
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
	if((fanspeed += global_vars.fans_speed_override) > FAN_SPEED_MAX) fanspeed = FAN_SPEED_MAX;
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
		CFG_FAN *f = &cfg_fans[fan];
		if(f->flags & (1<<FAN_SPEED_FORCED_BIT)) continue;
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
		f->speed_current = fsp;
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
		if(Debug_RAM_addr != NULL && CO2level > 1100) {
			struct tm tm;
			_localtime(&CO2_last_time, &tm);
			dbg_printf("%d.%d %d:%d:%d=%u\n", tm.tm_mday, 1+tm.tm_mon, tm.tm_hour, tm.tm_min, tm.tm_sec, co2_send_data.CO2level);
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
    		uint8 *p = web_strnstr(UART_Buffer, AZ_7798_ResponseEnd, UART_Buffer_idx);
    		if(p == NULL) return;
   			*p = 0;
   			if((p = os_strchr(UART_Buffer, AZ_7798_TempStart)) == NULL) return;
			uint8 *p2 = os_strchr(p, AZ_7798_TempEnd);
			if(p2 == NULL) return;
			*p2 = 0;
			Temperature = ahextoul(p);
			p = p2 + 3;
			if((p2 = os_strchr(p, AZ_7798_CO2End)) != NULL) {
				*p2 = 0;
				CO2level = ahextoul(p);
				p = p2 + 5;
				Humidity = ahextoul(p);
				ProcessIncomingValues();
				receive_timeout = 0;
			}
    	}
    }
}

void ICACHE_FLASH_ATTR user_loop(void) // call every 1 sec
{
	uint8 fan;
	for(fan = 0; fan < cfg_glo.fans; fan++) {
		if(cfg_fans[fan].flags & (1<<FAN_SPEED_FORCED_BIT)) {
			if(cfg_fans[fan].forced_speed_timeout) if(--cfg_fans[fan].forced_speed_timeout == 0) cfg_fans[fan].flags &= ~(1<<FAN_SPEED_FORCED_BIT);
		}
	}
	if(receive_timeout) receive_timeout--;
	if(CO2_work_flag == 0) { // init
		if(receive_timeout == 0) {
			os_memset(UART_Buffer, 0, UART_Buffer_size);
			UART_Buffer_idx = 0;
			uart_drv_start();
			uart_tx_buf(AZ_7798_Command_GetValues, sizeof(AZ_7798_Command_GetValues));
			CO2_work_flag = 1;
			receive_timeout = AZ_7798_ResponseTimeout;
		}
	} else if(CO2_work_flag == 1) { // wait incoming
		if(receive_timeout == 0) {
			if(CO2level) {
				uint8 fan;
				for(fan = 0; fan < cfg_glo.fans; fan++) {
					CFG_FAN *f = &cfg_fans[fan];
					if(f->flags & (1<<FAN_SKIP_BIT)) continue;
					co2_send_data.FanSpeed = f->speed_current;
					co2_send_data.CO2level = CO2level;
					co2_send_data.Pause = global_vars.pause;
					NRF24_WriteArray(NRF24_CMD_W_ACK_PAYLOAD + fan, (uint8 *)&co2_send_data, sizeof(co2_send_data));
				}
			}
			CO2_work_flag = 0;
			receive_timeout = global_vars.receive_timeout;
		}
	}
	if(CO2level) {
		//dbg_printf(" %x", NRF24_SendCommand(NRF24_CMD_NOP));
		if(NRF24_Receive((uint8 *)&co2_send_data)) { // check request
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
				if(idxt) history_co2[idx] = ((co2_send_data.CO2level & 0xF00) >> 8) | (history_co2[idx] & 0xF0);
				else history_co2[idx] = (co2_send_data.CO2level & 0xFF0) >> 4;
				if(idxt) history_co2[idx+1] = co2_send_data.CO2level & 0x0FF;
				else history_co2[idx+1] = (co2_send_data.CO2level & 0x00F) << 4;
			}
			CO2_last_time = t;
			#if DEBUGSOO > 4
				os_printf("NRF Received at %u, CO2: %u, F: %d (%d)\n", CO2_last_time, co2_send_data.CO2level, co2_send_data.FanSpeed, co2_send_data.Flags);
			#endif
			#ifdef DEBUG_TO_RAM
				if(Debug_RAM_addr != NULL && co2_send_data.CO2level > 1100) {
					struct tm tm;
					_localtime(&CO2_last_time, &tm);
					dbg_printf("%d.%d %d:%d:%d=%u\n", tm.tm_mday, 1+tm.tm_mon, tm.tm_hour, tm.tm_min, tm.tm_sec, co2_send_data.CO2level);
				}
			#endif
			NRF24_Standby();
			CO2_set_fans_speed_current(255);
			iot_cloud_send(1);
xStartSending:
			CO2_send_fan_idx = 0;
			CO2_work_flag = 2;
			CO2_send_flag = 0;
		} else if(receive_timeout) {
			if(--receive_timeout == 0) goto xStartSending;
		}
//	} else if(CO2_work_flag == 2) { // send
//		if(cfg_glo.fans == 0) goto xNextFAN; // skip
//		CFG_FAN *f = &cfg_fans[CO2_send_fan_idx];
//		if(CO2_send_flag == 0) { // start
//			if(f->flags & (1<<FAN_SKIP_BIT)) goto xNextFAN; // skip
//			NRF24_SetMode(NRF24_TransmitMode);
//			set_new_rf_channel(f->rf_channel);
//			if(NRF24_SetAddresses(f->address_LSB)) {
//				co2_send_data.FanSpeed = f->speed_current;
//				NRF24_Transmit((uint8 *)&co2_send_data);
//				CO2_send_flag = 1;
//				#if DEBUGSOO > 4
//					os_printf("NRF-Transmit %d <= %d (%u)\n", CO2_send_fan_idx, f->speed_current, system_get_time());
//				#endif
//			} else {
//				#if DEBUGSOO > 4
//					os_printf("NRF-SetAddr error: %d\n", CO2_send_fan_idx);
//				#endif
//			}
//		} else { // sending..
//			if(NRF24_transmit_status >= NRF24_Transmit_Ok) {
//				f->transmit_last_status = NRF24_transmit_status;
//				#if DEBUGSOO > 4
//					os_printf("NRF-Transmit end: %d, %u\n", NRF24_transmit_status, system_get_time());
//				#endif
//				if(NRF24_transmit_status == NRF24_Transmit_Ok) {
//					f->transmit_ok_last_time = get_sntp_localtime();
//				}
//				//dump_NRF_registers();
//xNextFAN:
//				if(++CO2_send_fan_idx >= cfg_glo.fans) CO2_work_flag = 0;
//				CO2_send_flag = 0;
//				NRF24_Standby();
//			}
//		}
	}
}

void  ICACHE_FLASH_ATTR send_fans_speed_now(uint8 fan, uint8 calc_speed)
{
	//dump_NRF_registers();
	if(calc_speed) CO2_set_fans_speed_current(fan);
	CO2_send_fan_idx = fan;
	CO2_work_flag = 2;
	CO2_send_flag = 0;
	NRF24_Standby();
}

void ICACHE_FLASH_ATTR wireless_co2_init(uint8 index)
{
	if(flash_read_cfg(&cfg_glo, ID_CFG_CO2, sizeof(cfg_glo)) <= 0) {
		// defaults
		os_memset(&cfg_glo, 0, sizeof(cfg_glo));
		cfg_glo.page_refresh_time = 5000;
		cfg_glo.csv_delimiter = ',';
		cfg_glo.sensor_rf_channel = 2;
		cfg_glo.address_LSB = 0xC0;
		cfg_glo.fans = 0;
		cfg_glo.fans_speed_threshold[0] = 530;
		cfg_glo.fans_speed_threshold[1] = 590;
		cfg_glo.fans_speed_threshold[2] = 650;
		cfg_glo.fans_speed_threshold[3] = 725;
		cfg_glo.fans_speed_threshold[4] = 800;
		cfg_glo.fans_speed_threshold[5] = 900;
		cfg_glo.fans_speed_delta = 30;
	}
	if(cfg_glo.history_size <= 9) cfg_glo.history_size = 9999; // bytes
	if(flash_read_cfg(&cfg_fans, ID_CFG_FANS, sizeof(cfg_fans)) != sizeof(cfg_fans)) {
		os_memset(&cfg_fans, 0, sizeof(cfg_fans));
	}
	uint8 i;
	for(i = 0; i < cfg_glo.fans; i++) {
		cfg_fans[i].transmit_last_status = 0;
		cfg_fans[i].transmit_ok_last_time = 0;
	}
	if(flash_read_cfg(&global_vars, ID_CFG_VARS, sizeof(global_vars)) <= 0) {
		os_memset(&global_vars, 0, sizeof(global_vars));
		global_vars.receive_timeout = 5;
		global_vars.pause = 10;
	}
	receive_timeout = global_vars.receive_timeout;
	fan_speed_previous = 0;
	//ets_timer_disarm(&user_loop_timer);
	os_timer_setfn(&user_loop_timer, (os_timer_func_t *)user_loop, NULL);
	ets_timer_arm_new(&user_loop_timer, 1000, 1, 1); // 1s, repeat
	receive_timeout = 1;
	NRF24_init(); // After init transmit must be delayed
	set_new_rf_channel(cfg_glo.sensor_rf_channel);
	if(NRF24_SetAddresses(cfg_glo.address_LSB)) {
		NRF24_SetMode(NRF24_ReceiveMode);
		#if DEBUGSOO > 4
	} else {
			os_printf("NRF-SetAddr error\n");
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

bool ICACHE_FLASH_ATTR write_wireless_co2_cfg(void) {
	return flash_save_cfg(&cfg_glo, ID_CFG_CO2, sizeof(cfg_glo));
}

bool ICACHE_FLASH_ATTR write_wireless_fans_cfg(void) {
	return flash_save_cfg(&cfg_fans, ID_CFG_FANS, sizeof(cfg_fans));
}

bool ICACHE_FLASH_ATTR write_global_vars_cfg(void) {
	return flash_save_cfg(&global_vars, ID_CFG_VARS, sizeof(global_vars));
}
