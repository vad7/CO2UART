/*
 * nRF24L01.c
 *
 Created: 01.11.2013 15:09:29
 *  Author: Vadim Kulakov, vad7@yahoo.com
 */ 
#define NRF24_PORT				PORTA
#define NRF24_DDR				DDRA
#define NRF24_IN				PINA
#define NRF24_CE				(1<<PORTA2)
#define NRF24_SET_CE_HI			NRF24_PORT |= NRF24_CE
#define NRF24_SET_CE_LOW		NRF24_PORT &= ~NRF24_CE
#define NRF24_CSN				(1<<PORTA3)
#define NRF24_SET_CSN_HI		NRF24_PORT |= NRF24_CSN
#define NRF24_SET_CSN_LOW		NRF24_PORT &= ~NRF24_CSN
#define NRF24_SCK				(1<<PORTA4)
#define NRF24_MOSI				(1<<PORTA5) // USI DO
#define NRF24_MISO				(1<<PORTA6) // USI DI
//#define NRF24_IRQ				(1<<PORTA1)

#define NRF24_RF_CHANNEL		2 // default
#define NRF24_ADDRESS_LEN		3 // 3..5 bytes
#define NRF24_PAYLOAD_LEN		sizeof(master_data) // MUST be EQUAL or GREATER than Address field width!!
#define NRF24_CONFIG			(1<<NRF24_BIT_EN_CRC) | (1<<NRF24_BIT_CRCO) | (1<<NRF24_BIT_MASK_RX_DR)|(1<<NRF24_BIT_MASK_TX_DS)|(1<<NRF24_BIT_MASK_MAX_RT) // Enable CRC, CRC 2 bytes, IRQs disabled

uint8_t NRF24_Buffer[NRF24_PAYLOAD_LEN]; // MUST be EQUAL or GREATER than Address field width!!! 

/* Register map table */
#define NRF24_REG_CONFIG		0x00
#define NRF24_REG_EN_AA			0x01
#define NRF24_REG_EN_RXADDR		0x02
#define NRF24_REG_SETUP_AW		0x03
#define NRF24_REG_SETUP_RETR	0x04
#define NRF24_REG_RF_CH			0x05
#define NRF24_REG_RF_SETUP		0x06
#define NRF24_REG_STATUS		0x07
#define NRF24_REG_OBSERVE_TX	0x08
#define NRF24_REG_RPD			0x09
#define NRF24_REG_RX_ADDR_P0	0x0A
#define NRF24_REG_RX_ADDR_P1	0x0B
#define NRF24_REG_RX_ADDR_P2	0x0C
#define NRF24_REG_RX_ADDR_P3	0x0D
#define NRF24_REG_RX_ADDR_P4	0x0E
#define NRF24_REG_RX_ADDR_P5	0x0F
#define NRF24_REG_TX_ADDR		0x10
#define NRF24_REG_RX_PW_P0		0x11
#define NRF24_REG_RX_PW_P1		0x12
#define NRF24_REG_RX_PW_P2		0x13
#define NRF24_REG_RX_PW_P3		0x14
#define NRF24_REG_RX_PW_P4		0x15
#define NRF24_REG_RX_PW_P5		0x16
#define NRF24_REG_FIFO_STATUS	0x17
#define NRF24_REG_DYNPD			0x1C
#define NRF24_REG_FEATURE		0x1D

/* Bit Mnemonics */
#define NRF24_BIT_MASK_RX_DR	6
#define NRF24_BIT_MASK_TX_DS	5
#define NRF24_BIT_MASK_MAX_RT	4
#define NRF24_BIT_EN_CRC		3
#define NRF24_BIT_CRCO			2
#define NRF24_BIT_PWR_UP		1
#define NRF24_BIT_PRIM_RX		0
#define NRF24_BIT_ARD			4
#define NRF24_BIT_ARC			0
#define NRF24_BIT_CONT_WAVE		7
#define NRF24_BIT_RF_DR_LOW		5
#define NRF24_BIT_PLL_LOCK		4
#define NRF24_BIT_RF_DR_HIGH	3
#define NRF24_BIT_RX_DR			6
#define NRF24_BIT_TX_DS			5
#define NRF24_BIT_MAX_RT		4
#define NRF24_BIT_RX_P_NO		1
#define NRF24_BIT_F_TX_FULL		0
#define NRF24_BIT_PLOS_CNT		4
#define NRF24_BIT_ARC_CNT		0
#define NRF24_BIT_TX_REUSE		6
#define NRF24_BIT_TX_FULL		5
#define NRF24_BIT_TX_EMPTY		4
#define NRF24_BIT_RX_FULL		1
#define NRF24_BIT_RX_EMPTY		0
#define NRF24_BIT_EN_DPL		2
#define NRF24_BIT_EN_ACK_PAY	1
#define NRF24_BIT_EN_DYN_ACK	0

/* SPI commands */
#define NRF24_CMD_R_REGISTER         0x00
#define NRF24_CMD_W_REGISTER         0x20
#define NRF24_CMD_REGISTER_MASK      0x1F
#define NRF24_CMD_R_RX_PAYLOAD       0x61
#define NRF24_CMD_W_TX_PAYLOAD       0xA0
#define NRF24_CMD_FLUSH_TX           0xE1
#define NRF24_CMD_FLUSH_RX           0xE2
#define NRF24_CMD_REUSE_TX_PL        0xE3
#define NRF24_CMD_R_RX_PL_WID        0x60
#define NRF24_CMD_W_ACK_PAYLOAD      0xA8
#define NRF24_CMD_W_TX_PAYLOAD_NOACK 0xB0
#define NRF24_CMD_NOP                0xFF

#define NRF24_ReceiveMode			(1<<NRF24_BIT_PRIM_RX)
#define NRF24_TransmitMode			0

const uint8_t NRF24_INIT_DATA[] PROGMEM = { // Enhanced	ShockBurst config
	NRF24_CMD_W_REGISTER | NRF24_REG_FEATURE,	(1<<NRF24_BIT_EN_DPL) | (1<<NRF24_BIT_EN_ACK_PAY), // Dynamic Payload Length, Enables Payload with ACK
	NRF24_CMD_W_REGISTER | NRF24_REG_DYNPD,		0b000001, // Dynamic payload
	NRF24_CMD_W_REGISTER | NRF24_REG_RF_SETUP,	(0<<NRF24_BIT_RF_DR_LOW) | (0<<NRF24_BIT_RF_DR_HIGH) | 0b111, // Data rate: 1Mbps, Max power (0b111)
	NRF24_CMD_W_REGISTER | NRF24_REG_SETUP_AW,	NRF24_ADDRESS_LEN - 2, // address length
	NRF24_CMD_W_REGISTER | NRF24_REG_SETUP_RETR,(0b0100<<NRF24_BIT_ARD) | (0b0001<<NRF24_BIT_ARC), // Auto Retransmit Delay = 1000uS, 2 Re-Transmit on fail (must be > 0 for ACK)
//	NRF24_CMD_W_REGISTER | NRF24_REG_RF_CH,		NRF24_RF_CHANNEL, // RF channel
	NRF24_CMD_W_REGISTER | NRF24_REG_EN_AA,		0b000001, // Enable Auto Acknowledgment for pipes 0
	NRF24_CMD_W_REGISTER | NRF24_REG_EN_RXADDR,	0b000001, // Enable data pipes: 0
	NRF24_CMD_W_REGISTER | NRF24_REG_RX_PW_P0,	NRF24_PAYLOAD_LEN
};
const uint8_t NRF24_BASE_ADDR[] PROGMEM = { 0xC8, 0xC8 }; // Address MSBs: 2..3

uint8_t SPI_WriteReadByte(uint8_t data) {
	USIDR = data;
	USISR = (1<<USIOIF); // clear overflow flag
	do {
		USICR = (1<<USIWM0) | (1<<USICS1) | (1<<USICLK) | (1<<USITC);
	} while((USISR & (1<<USIOIF)) == 0);
	return USIDR;
}

uint8_t NRF24_ReadRegister(uint8_t reg)
{
	NRF24_SET_CSN_LOW;
	SPI_WriteReadByte(NRF24_CMD_R_REGISTER | (NRF24_CMD_REGISTER_MASK & reg));
	uint8_t result = SPI_WriteReadByte(NRF24_CMD_NOP);
	NRF24_SET_CSN_HI;
	return result;
}

void NRF24_ReadArray(uint8_t cmd, uint8_t *array, uint8_t len)
{
	NRF24_SET_CSN_LOW;
	SPI_WriteReadByte(cmd);
	while(len-- > 0) *array++ = SPI_WriteReadByte(NRF24_CMD_NOP);
	NRF24_SET_CSN_HI;
}

void NRF24_WriteByte(uint8_t cmd, uint8_t value)
{
	NRF24_SET_CSN_LOW;
	SPI_WriteReadByte(cmd);
	SPI_WriteReadByte(value);
	NRF24_SET_CSN_HI;
}

void NRF24_WriteArray(int8_t cmd, uint8_t *array, uint8_t len)
{
	NRF24_SET_CSN_LOW;
	SPI_WriteReadByte(cmd);
	while(len-- > 0) SPI_WriteReadByte(*array++);
	NRF24_SET_CSN_HI;
}

uint8_t NRF24_SendCommand(uint8_t cmd) // Send command & receive status
{
	NRF24_SET_CSN_LOW;
	uint8_t result = SPI_WriteReadByte(cmd);
	NRF24_SET_CSN_HI;
	return result;
}

void NRF24_SetMode(uint8_t mode) // Set mode in CONFIG reg
{
	NRF24_WriteByte(NRF24_CMD_W_REGISTER | NRF24_REG_CONFIG, NRF24_CONFIG | (1<<NRF24_BIT_PWR_UP) | mode);
	if(mode & NRF24_ReceiveMode) { // Receive mode
		//NRF24_SendCommand(NRF24_CMD_FLUSH_RX);
		NRF24_WriteByte(NRF24_CMD_W_REGISTER | NRF24_REG_STATUS, (1<<NRF24_BIT_RX_DR) | (1<<NRF24_BIT_TX_DS) | (1<<NRF24_BIT_MAX_RT)); // clear status
		NRF24_SET_CE_HI; // start receiving
	}
}

uint8_t NRF24_Receive(uint8_t *payload) // Receive in payload, return data pipe number + 1 if success
{
	uint8_t pipe = 0, st;
	if((st = NRF24_SendCommand(NRF24_CMD_NOP)) & (1<<NRF24_BIT_RX_DR))
	{
		NRF24_ReadArray(NRF24_CMD_R_RX_PAYLOAD, payload, NRF24_PAYLOAD_LEN);
		NRF24_WriteByte(NRF24_CMD_W_REGISTER | NRF24_REG_STATUS, (1<<NRF24_BIT_RX_DR) | (1<<NRF24_BIT_TX_DS) | (1<<NRF24_BIT_MAX_RT)); // clear status
		pipe = ((st >> NRF24_BIT_RX_P_NO) & 0b111) + 1;
	}
	return pipe;
}

uint8_t NRF24_Transmit(uint8_t *payload) // Transmit payload, return 0 if success, 1 - max retransmit count reached, 2 - module not response.
{
	NRF24_SET_CE_LOW;
	NRF24_WriteByte(NRF24_CMD_W_REGISTER | NRF24_REG_STATUS, (1<<NRF24_BIT_RX_DR) | (1<<NRF24_BIT_TX_DS) | (1<<NRF24_BIT_MAX_RT)); // clear status
	NRF24_SendCommand(NRF24_CMD_FLUSH_TX);
	NRF24_WriteArray(NRF24_CMD_W_TX_PAYLOAD, payload, NRF24_PAYLOAD_LEN);
	NRF24_SET_CE_HI; // Start transmission
	uint8_t st = 0, i;
	for(i = 1; i != 0; i++)
	{
		Delay10us(10);
		st = NRF24_SendCommand(NRF24_CMD_NOP);
		if(st & ((1<<NRF24_BIT_MAX_RT) | (1<<NRF24_BIT_TX_DS))) break; // stop if sent or max retransmit reached
	}
	return i == 0 ? 2 : !(st & (1<<NRF24_BIT_TX_DS));
}

// Transmit payload, than receive payload.
// return 0 if success, 1 - Payload not returned, 2 - Max retransmit reached, 3 - return payload len error, 4 - module not responding.
uint8_t NRF24_TransmitShockBurst(uint8_t send_len, uint8_t receive_len)
{
	NRF24_WriteByte(NRF24_CMD_W_REGISTER | NRF24_REG_STATUS, (1<<NRF24_BIT_RX_DR) | (1<<NRF24_BIT_TX_DS) | (1<<NRF24_BIT_MAX_RT)); // clear status
	NRF24_SendCommand(NRF24_CMD_FLUSH_TX);
	NRF24_WriteArray(NRF24_CMD_W_TX_PAYLOAD, NRF24_Buffer, send_len);
	NRF24_SET_CE_HI; // Start transmission
	uint8_t st = 0, i;
	for(i = 1; i != 0; i++)
	{
		Delay10us(10);
		st = NRF24_SendCommand(NRF24_CMD_NOP);
		if(st & ((1<<NRF24_BIT_MAX_RT) | (1<<NRF24_BIT_TX_DS))) break; // stop if sent or max retransmit reached
	}
	NRF24_SET_CE_LOW;
	if(i == 0) return 4;
	if(st & (1<<NRF24_BIT_RX_DR)) {
		NRF24_Buffer[0] = 0xFF;
		NRF24_ReadArray(NRF24_CMD_R_RX_PL_WID, NRF24_Buffer, 1); // get RX payload len
		if(NRF24_Buffer[0] > 32 || NRF24_Buffer[0] < receive_len) return 3;
		NRF24_ReadArray(NRF24_CMD_R_RX_PAYLOAD, NRF24_Buffer, receive_len); // get RX payload len
		return  0;
	} else return (st & (1<<NRF24_BIT_MAX_RT)) ? 2 : 1;
}

uint8_t NRF24_SetAddresses(uint8_t addr_LSB) // Set addresses: NRF24_BASE_ADDR + addr_LSB, return 1 if success
{
	NRF24_Buffer[0] = addr_LSB;
	memcpy_P(NRF24_Buffer + 1, NRF24_BASE_ADDR, sizeof(NRF24_BASE_ADDR)/sizeof(NRF24_BASE_ADDR[0]));
	NRF24_WriteArray(NRF24_CMD_W_REGISTER | NRF24_REG_RX_ADDR_P0, NRF24_Buffer, NRF24_ADDRESS_LEN);
	NRF24_WriteArray(NRF24_CMD_W_REGISTER | NRF24_REG_TX_ADDR, NRF24_Buffer, NRF24_ADDRESS_LEN);
	NRF24_ReadArray(NRF24_CMD_R_REGISTER | NRF24_REG_TX_ADDR, NRF24_Buffer, NRF24_ADDRESS_LEN);
	return NRF24_Buffer[0] == addr_LSB;
}

void NRF24_Powerdown(void)
{
	NRF24_SET_CE_LOW;
	NRF24_WriteByte(NRF24_CMD_W_REGISTER | NRF24_REG_CONFIG, NRF24_CONFIG); // Power down
}

void NRF24_init(uint8_t channel) // After init transmit must be delayed
{
	NRF24_SET_CSN_HI;
	uint8_t i = 0, c, v;
	do {
		c = pgm_read_byte(&NRF24_INIT_DATA[i++]);
		v = pgm_read_byte(&NRF24_INIT_DATA[i++]);
		NRF24_WriteByte(c, v); 
	} while(i < sizeof(NRF24_INIT_DATA));
	NRF24_WriteByte(NRF24_CMD_W_REGISTER | NRF24_REG_RF_CH,	channel);
}
