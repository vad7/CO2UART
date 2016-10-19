#ifndef _power_meter_
#define _power_meter_

#include "sntp.h"
#include "debug_ram.h"

#define FANS_MAX 					1
#define FAN_SPEED_MAX				7

typedef struct __attribute__((packed)) {
	uint16	fans_speed_threshold[FAN_SPEED_MAX]; //  Fan speed: CO2 < 500 ppm = 0; < 550 ppm = 1; < 600 ppm = 2; < 800 ppm = 3; < 900 ppm = 4; < 1100 ppm = 5; > = 6 (max)
	uint16	fans_speed_delta;		// delta CO2 for lowering speed, ppm
	uint16	night_start;			// hh,mm
	uint16	night_end;				// hh,mm
	uint16	night_start_wd;			// hh,mm at weekend
	uint16	night_end_wd;			// hh,mm at weekend
	uint8	fans;					// numbers of fans
	uint8 	sensor_rf_channel;		// 0..126 nrf24l01 channel
	uint8	address_LSB;			// Address LSB for receiving
	uint8	iot_cloud_enable;		// use "protect/iot_cloud.ini" to send data to IoT cloud
	char	csv_delimiter; 			// ','
	uint8	fans_speed_night_max;	// speed max at night
	uint16	page_refresh_time;		// ms
	uint16	history_size;			// CO2 store RAM buffer size, must be divided by 3 without remains!
//	char sntp_server[20];
} CFG_GLO;
CFG_GLO __attribute__((aligned(4))) cfg_glo;

typedef enum
{
	FAN_SKIP_BIT = 0,
	FAN_SPEED_FORCED_BIT
} CFG_FAN_FLAGS;

typedef struct __attribute__((packed)) {
	char name[16];
	time_t transmit_ok_last_time;
	uint32 forced_speed_timeout; // sec
	uint8 transmit_last_status;	// NRF24_transmit_status
	uint8 flags;				// CFG_FAN_FLAGS enum
	uint8 rf_channel;
	uint8 address_LSB;
	int8  speed_min;
	int8  speed_max;
	uint8 override_day;			// 0 - no, 1 - set =speed_override, 2 - set +speed_override
	int8  speed_day;			// day
	uint8 override_night;		// 0 - no, 1 - set =speed_night, 2 - set +speed_night
	int8  speed_night;
	uint8 speed_current;
} CFG_FAN;
CFG_FAN __attribute__((aligned(4))) cfg_fans[FANS_MAX]; // Actual number of fans stored in cfg_co2.fans

typedef struct __attribute__ ((packed)) {
	uint16_t CO2level;
	uint8_t FanSpeed;
	uint8_t Flags; // Mask: 0x80 - Setup command, 0x01 - Lowlight
	uint8_t Pause; // sec, between next scan
} CO2_SEND_DATA;
CO2_SEND_DATA __attribute__((aligned(4))) co2_send_data;

typedef struct __attribute__ ((packed)) {
	uint16 receive_timeout;		// sec, timeout before get CO2
	int8   fans_speed_override;	// +- total speed
	uint32 UART_speed; // 9600
} GLOBAL_VARS;
GLOBAL_VARS __attribute__((aligned(4))) global_vars;

uint8  *history_co2;		// history buffer in the RAM
uint16	history_co2_pos;	// current pos (by 1.5 byte)
uint8	history_co2_full;	// buffer full - overwriting old values
uint16  average_period; 	// between receiving (sec), for charts

time_t CO2_last_time;
int8_t fan_speed_previous;
uint8  now_night;
uint8  now_night_override; // 0 - use now_night, 1 - not night, 2 - night
// Cookies:
uint32 Web_ChartMaxDays; 	// ~ChartMaxDays~
uint32 Web_ShowByDay; 		// ~ShowByDay~
uint32 Web_cfg_fan_;		// fan idx for change setting

//

void send_fans_speed_now(uint8 fan, uint8 calc_speed) ICACHE_FLASH_ATTR;
void wireless_co2_init(uint8 index) ICACHE_FLASH_ATTR;
void user_loop(void) ICACHE_FLASH_ATTR;
bool write_wireless_co2_cfg(void) ICACHE_FLASH_ATTR;
bool write_wireless_fans_cfg(void) ICACHE_FLASH_ATTR;
bool write_global_vars_cfg(void) ICACHE_FLASH_ATTR;
uint8_t iot_cloud_init(void) ICACHE_FLASH_ATTR;
void iot_data_clear(void) ICACHE_FLASH_ATTR;
void iot_cloud_send(uint8 fwork) ICACHE_FLASH_ATTR;

void uart_wait_tx_fifo_empty(void) ICACHE_FLASH_ATTR;
void _localtime(time_t * tim_p, struct tm * res) ICACHE_FLASH_ATTR;

#endif
