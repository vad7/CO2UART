/*
 * WirelessCO2Fan.c
 *
 * Created: 09.08.2016 16:06:02
 *  Author: Vadim Kulakov, vad7@yahoo.com
 *
 * ATtiny44A
 * 
 */ 
#define F_CPU 8000000UL
// Fuses: BODLEVEL = 1V8

#include <stdlib.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <avr/wdt.h>
#include <avr/pgmspace.h>
#include <avr/eeprom.h>
#include <util/delay.h>
#include <util/atomic.h>
//#include <util/crc16.h>

#define LED1_PORT					PORTA	// Info led
#define LED1						(1<<PORTA1)
#define LED1_ON						LED1_PORT |= LED1
#define LED1_OFF					LED1_PORT &= ~LED1

#define KEYS_PORT					PORTB
#define KEYS_PIN					PINB
#define KEYS_DDR					DDRB
#define KEY_PWR						(1<<PORTB0)
#define KEY_MINUS					(1<<PORTB1)
#define KEY_PLUS					(1<<PORTB2)
#define KEYS_INTR_INIT				GIMSK |= (1<<PCIE1); PCMSK1 |= (1<<PCINT10) | (1<<PCINT9) | (1<<PCINT8)  // PCINT8..10
uint8_t keys						= 0;
uint8_t PressKey					= 0;
uint8_t PressKeyOffTime				= 0; // *0.125 sec
uint8_t PressKeyOnTime				= 0; // *0.125 sec
ISR(PCINT1_vect) {
	if(PressKeyOnTime == 0 || PressKeyOffTime != 0) { // not in changing process
		keys = KEYS_PIN & (KEY_PWR | KEY_MINUS | KEY_PLUS);
	}
}

uint8_t FanSpeedMax;
int8_t  FanSpeed					= 0; // 0 = off, 1..FanSpeedMax
int8_t  SpeedSet;
uint8_t SpeedSetChanged				= 0;
int8_t  FanSpeedOverride			= 0; // +-
uint8_t FanSpeedOverrideOff			= 0; // off/on state
uint8_t FanSpeedChange				= 0;
uint8_t HaltSetFanSpeed				= 0;
//uint16_t FanSpeedOverrideTimer		= 0;

uint8_t TimerCntSec					= 0;
uint8_t RequestCountdown			= 1; // sec
uint8_t RequestStatus				= 0; // 0 - pause, 1 - need send request, 2 - waiting response
uint8_t SendOffStasus				= 0;
uint8_t nrf_last_status				= 0;

#define EPROM_OSCCAL				0x00
#define EPROM_RFAddress				0x01 // = 0xE5, Enhanced ShockBurst address LSB
#define EPROM_RF_Channel			0x02 // 120
#define EPROM_FanSpeedMax			0x03 // 7, max value = 127
#define EPROM_CurrentSpeedAddr		0x80 // 0x81 until end
//                                  0xFF


uint8_t request_data = 0; // send: (Previous error << 5) + (Off/On << 4) + active speed

typedef struct {
	uint16_t CO2level;
	uint8_t FanSpeed; // 0 = off, Speed = 1..FanSpeedMax
	uint8_t Flags; // Mask: 0x80 - Setup command, 0x01 - Lowlight
	uint8_t Pause; // sec, between next scan
} __attribute__ ((packed)) master_data; // = 5 bytes

#define FLAG_LowLight				0x01

#if(1)
void Delay10us(uint8_t ms) {
	while(ms-- > 0) _delay_us(10); //wdt_reset();
}
void Delay1ms(uint8_t ms) {
	while(ms-- > 0) {
		_delay_ms(1); //wdt_reset();
	}
}
void Delay100ms(unsigned int ms) {
	while(ms-- > 0) {
		_delay_ms(100); //wdt_reset();
	}
}

void FlashLED(uint8_t num, uint8_t toff, uint8_t ton) {
	while (num-- > 0) {
		LED1_OFF;
		Delay100ms(toff);
		LED1_ON;
		Delay100ms(ton);
	}
	LED1_OFF;
}

void FlashNumber(uint8_t Number)
{ // HEX
	FlashLED(Number / 16, 5, 15);
	Delay100ms(20);
	FlashLED(Number % 16, 5, 5);
	Delay100ms(20);
}

static uint8_t EEPROM_read(uint8_t ucAddress) // ATtiny24A/44A only!
{
	while(EECR & (1<<EEPE)) ; // EEWE
	EEAR = ucAddress;
	EECR |= (1<<EERE);
	return EEDR;
}
static void EEPROM_write(uint8_t ucAddress, uint8_t ucData) // ATtiny24A/44A only!
{
	while(EECR & (1<<EEPE)) ; // EEWE
	cli();
	EECR = (0<<EEPM1)|(0<<EEPM0);
	EEAR = ucAddress;
	EEDR = ucData;
	EECR |= (1<<EEMPE); //(1<<EEMWE);
	EECR |= (1<<EEPE); //(1<<EEWE);
	sei();
}

#endif

#include "..\nRF24L01.h"

#define SETUP_WATCHDOG WDTCSR = (1<<WDCE) | (1<<WDE); WDTCSR = (1<<WDE) | (1<<WDIE) | (0<<WDP3) | (0<<WDP2) | (1<<WDP1) | (1<<WDP0); //  Watchdog 0.125 s
//uint8_t LED_Warning = 0, LED_WarningOnCnt = 0, LED_WarningOffCnt = 0;

ISR(WATCHDOG_vect)
{
	SETUP_WATCHDOG;
	if(++TimerCntSec == 8) { // 1 sec
		TimerCntSec = 0;
		if(RequestCountdown) RequestCountdown--;
	}
	if(HaltSetFanSpeed == 0 && FanSpeed != SpeedSet) {
		if(PressKeyOffTime) {
			if(--PressKeyOffTime == 0) {
				KEYS_DDR |= PressKey; // set Out, level 0
			}
		} else if(PressKeyOnTime) {
			if(--PressKeyOnTime == 0) {
				KEYS_DDR &= ~PressKey; // set In
				if(PressKey == KEY_PWR) SpeedSet = FanSpeed;
				else if(PressKey == KEY_MINUS) SpeedSet--;
				else if(PressKey == KEY_PLUS) SpeedSet++;
				request_data = SpeedSet;
				SpeedSetChanged = 1;
			}
		} else {
			if(FanSpeed == 0) { // off
				PressKey = KEY_PWR;
			} else if(FanSpeed < SpeedSet) { // less
				PressKey = KEY_MINUS;
			} else {
				PressKey = KEY_PLUS;
			}
			PressKeyOffTime = 2;
			PressKeyOnTime = 2;
		}
	}
	
// 	if(LED_WarningOnCnt) {
// 		LED1_ON;
// 		LED_WarningOnCnt--;
// 	} else if(LED_WarningOffCnt) {
// 		LED1_OFF;
// 		LED_WarningOffCnt--;
// 	} else if(LED_Warning) { // short flashes
// 		LED_WarningOffCnt = 2;
// 		LED_WarningOnCnt = 2;
// 		if(--LED_Warning == 0) LED_WarningOffCnt = 15;
// 	}
}

int main(void)
{
	CLKPR = (1<<CLKPCE); CLKPR = (0<<CLKPS3) | (0<<CLKPS2) | (0<<CLKPS1) | (0<<CLKPS0); // Clock prescaler division factor: 1
	MCUCR = (1<<SE) | (0<<SM1) | (0<<SM0); // Idle sleep enable
	KEYS_DDR &= ~(KEY_PWR | KEY_MINUS | KEY_PLUS); // In
	KEYS_PORT &= ~(KEY_PWR | KEY_MINUS | KEY_PLUS); // = 0
	DDRA = LED1; // Out
	PORTA = (1<<PORTA7) | (1<<PORTA0); // pullup not used pins
	NRF24_DDR |= NRF24_CE | NRF24_CSN | NRF24_SCK | NRF24_MOSI; // Out
//	// Timer 8 bit
// 	TCCR0A = (1<<WGM01) | (1<<WGM00);  // Timer0: Fast PWM OCRA
// 	TCCR0B = (1<<WGM02) | (0 << CS02) | (1 << CS01) | (0 << CS00); // Timer0 prescaller: 8
// 	TIMSK0 |= (1<<TOIE0); // Timer/Counter0 Overflow Interrupt Enable
// 	OCR0A = PWM_MAX; // OC0A - Fclk/(prescaller*(1+TOP)) 
// 	OCR0B = 0; // Half Duty cycle ((TOP+1)/2-1)
	FanSpeedMax = EEPROM_read(EPROM_FanSpeedMax);
	if(FanSpeedMax == 0xFF) {
		EEPROM_write(EPROM_OSCCAL, OSCCAL);
		EEPROM_write(EPROM_CurrentSpeedAddr, EPROM_CurrentSpeedAddr + 1);
		EEPROM_write(EPROM_CurrentSpeedAddr + 1, 0);
		EEPROM_write(EPROM_FanSpeedMax, 7);
		EEPROM_write(EPROM_RFAddress, 0xE5);
		EEPROM_write(EPROM_RF_Channel, 120);
	}
	//OSCCAL = EEPROM_read(EPROM_OSCCAL);
	SpeedSet = EEPROM_read(EEPROM_read(EPROM_CurrentSpeedAddr));
	NRF24_init(EEPROM_read(EPROM_RF_Channel)); // After init transmit must be delayed
	KEYS_INTR_INIT;
	SETUP_WATCHDOG;
	sei();
 	while(!NRF24_SetAddresses(EEPROM_read(EPROM_RFAddress))) {
 		FlashLED(1, 50, 20);
 	}
	NRF24_SetMode(NRF24_TransmitMode);
	while(1)
	{
		__asm__ volatile ("" ::: "memory"); // Need memory barrier
		sleep_cpu();
		if(SpeedSetChanged) {
			uint8_t addr = EEPROM_read(EPROM_CurrentSpeedAddr);
x_save_speed:			
			EEPROM_write(addr, SpeedSet);
			if(EEPROM_read(addr) != SpeedSet) { // EEPROM cell broken
				FlashLED(10, 2, 2);
				request_data = 0x88;
				if(++addr == 0) { // memory ends
					EEPROM_write(addr, 0);
				} else {
					EEPROM_write(EPROM_CurrentSpeedAddr, addr);
					goto x_save_speed;
				}
			}
			SpeedSetChanged = 0;
		}
		if(keys) {
			if(keys | KEY_PWR) {
				FanSpeedOverrideOff ^= 1;
				SendOffStasus = 1;
				ATOMIC_BLOCK(ATOMIC_FORCEON) keys &= ~KEY_PWR;
			}
			if(FanSpeedOverrideOff == 0) {
				if(keys | KEY_MINUS) {
					if(FanSpeedOverride > -8) {
						FanSpeedOverride--;
						HaltSetFanSpeed = 1;
						if(FanSpeed > 0) FanSpeed--;
						if(SpeedSet > 0) SpeedSet--;
						HaltSetFanSpeed = 0;
					}
					ATOMIC_BLOCK(ATOMIC_FORCEON) keys &= ~KEY_MINUS;
				}
				if(keys | KEY_PLUS) {
					if(FanSpeedOverride < 7) {
						FanSpeedOverride++;
						HaltSetFanSpeed = 1;
						if(FanSpeed < FanSpeedMax) FanSpeed++;
						if(SpeedSet < FanSpeedMax) SpeedSet++;
						HaltSetFanSpeed = 0;
					}
					ATOMIC_BLOCK(ATOMIC_FORCEON) keys &= ~KEY_PLUS;
				}
			}
			_delay_ms(30);
		}
		if(RequestCountdown) {
			if(FanSpeedOverrideOff == 0 || SendOffStasus == 1) {
				request_data = (nrf_last_status << 5) | (FanSpeedOverrideOff << 4) | (FanSpeedOverride & 0x0F);
				nrf_last_status = NRF24_TransmitShockBurst(&request_data, 1, sizeof(master_data)); // Enhanced ShockBurst, ACK with payload
				if(nrf_last_status) { // some problem
					FlashLED(nrf_last_status, 3, 3);
					RequestCountdown = 10; // sec
				} else {
					HaltSetFanSpeed = 1;
					FanSpeed = ((master_data*) &NRF24_Buffer)->FanSpeed + FanSpeedOverride;
					if(FanSpeed < 0) FanSpeed = 0;
					else if(FanSpeed > FanSpeedMax) FanSpeed = FanSpeedMax;
					HaltSetFanSpeed = 0;
					RequestCountdown = ((master_data*) &NRF24_Buffer)->Pause;
					SendOffStasus = 0;
				}
			} else {
				RequestCountdown = 3; // sec
			}
		}
	}
}


