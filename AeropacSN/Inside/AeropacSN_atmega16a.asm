; File Name   :	G:\Electric\ESP8266\CO2UART\AeropacSN\Inside\AeropacSN_atmega16a.BIN
; Format      :	Binary file
; Base Address:	0000h Range: 0000h - 2000h Loaded length: 00002000h

; Processor	  : AVR	[ATmega16_L]
; Target assembler: AVR	Assembler

; ===========================================================================

; Segment type:	Pure code
.CSEG ;	ROM
		.org 0

; =============== S U B	R O U T	I N E =======================================

; Store	Program	Memory Ready

		; public SPM_RDY
SPM_RDY:				; CODE XREF: ROM:0006j	ROM:000Aj ...
		jmp	__RESET		; TIMER2_COMP
; End of function SPM_RDY		; TIMER1_CAPT
					; TIMER1_COMPA
					; TIMER1_COMPB
					; TIMER1_OVF
					; SPI_STC
					; USART_RXC
					; USART_UDRE
					; USART_TXC
					; ADC_
					; EE_RDY
					; ANA_COMP
					; INT2
					; TIMER0_COMP
; ---------------------------------------------------------------------------
		.org 2
		jmp	INT0_		; External Interrupt Request 0
; ---------------------------------------------------------------------------
		.org 4
		jmp	INT1_		; External Interrupt Request 1
; ---------------------------------------------------------------------------
		.org 6
		jmp	SPM_RDY		; Store	Program	Memory Ready
; ---------------------------------------------------------------------------
		.org 8
		jmp	TIMER2_OVF	; Timer/Counter2 Overflow
; ---------------------------------------------------------------------------
		.org 0xA
		jmp	SPM_RDY		; Store	Program	Memory Ready
; ---------------------------------------------------------------------------
		.org 0xC
		jmp	SPM_RDY		; Store	Program	Memory Ready
; ---------------------------------------------------------------------------
		.org 0xE
		jmp	SPM_RDY		; Store	Program	Memory Ready
; ---------------------------------------------------------------------------
		.org 0x10
		jmp	SPM_RDY		; Store	Program	Memory Ready
; ---------------------------------------------------------------------------
		.org 0x12
		jmp	TIMER0_OVF	; Timer/Counter0 Overflow
; ---------------------------------------------------------------------------
		.org 0x14
		jmp	SPM_RDY		; Store	Program	Memory Ready
; ---------------------------------------------------------------------------
		.org 0x16
		jmp	SPM_RDY		; Store	Program	Memory Ready
; ---------------------------------------------------------------------------
		.org 0x18
		jmp	SPM_RDY		; Store	Program	Memory Ready
; ---------------------------------------------------------------------------
		.org 0x1A
		jmp	SPM_RDY		; Store	Program	Memory Ready
; ---------------------------------------------------------------------------
		.org 0x1C
		jmp	SPM_RDY		; Store	Program	Memory Ready
; ---------------------------------------------------------------------------
		.org 0x1E
		jmp	SPM_RDY		; Store	Program	Memory Ready
; ---------------------------------------------------------------------------
		.org 0x20
		jmp	SPM_RDY		; Store	Program	Memory Ready
; ---------------------------------------------------------------------------
		.org 0x22
		jmp	TWI_		; Two-wire Serial Interface
; ---------------------------------------------------------------------------
		.org 0x24
		jmp	SPM_RDY		; Store	Program	Memory Ready
; ---------------------------------------------------------------------------
		.org 0x26
		jmp	SPM_RDY		; Store	Program	Memory Ready
; ---------------------------------------------------------------------------
		.org 0x28
		jmp	SPM_RDY		; Store	Program	Memory Ready
; ---------------------------------------------------------------------------
		.dw 0x2710 ;  '
		.dw 0x3E8, 0x64, 0xA, 1, 0x1000, 0x100,	0x10, 1, 0, 0x4000
		.dw 1, 1, 0x4E2D, 0x4E41, 0x4900, 0x464E, 0, 4,	2, 0x66
		.dw 1, 0x167, 0x6A, 1, 0x197, 0x6C, 0

; =============== S U B	R O U T	I N E =======================================

; Hardware Pin,	Power-on Reset and Watchdog Reset

		; public __RESET
__RESET:				; CODE XREF: SPM_RDYj

; FUNCTION CHUNK AT 0790 SIZE 0000008A BYTES

		cli			; Global Interrupt Disable
		clr	r30		; Clear	Register
		out	EECR, r30	; EEPROM Control Register
		ldi	r31, 1		; Load Immediate
		out	GICR, r31	; General Interrupt Control Register
		out	GICR, r30	; General Interrupt Control Register
		out	MCUCR, r30	; MCU Control Register
		ldi	r31, 0x18	; Load Immediate
		out	WDTCR, r31	; Watchdog Timer Control Register
		out	WDTCR, r30	; Watchdog Timer Control Register
		ldi	r24, 0xD	; Load Immediate
		ldi	r26, 2		; Load Immediate
		clr	r27		; Clear	Register

loc_53:					; CODE XREF: __RESET+Fj
		st	X+, r30		; Store	Indirect
		dec	r24		; Decrement
		brne	loc_53		; Branch if Not	Equal
		ldi	r24, 0		; Load Immediate
		ldi	r25, 4		; Load Immediate
		ldi	r26, 0x60 ; '`' ; Load Immediate

loc_59:					; CODE XREF: __RESET+15j
		st	X+, r30		; Store	Indirect
		sbiw	r24, 1		; Subtract Immediate from Word
		brne	loc_59		; Branch if Not	Equal
		ldi	r30, 0x78 ; 'x' ; Load Immediate
		ldi	r31, 0		; Load Immediate

loc_5E:					; CODE XREF: __RESET+27j
		lpm	r24, Z+		; Load Program Memory
		lpm	r25, Z+		; Load Program Memory
		sbiw	r24, 0		; Subtract Immediate from Word
		breq	loc_6E		; Branch if Equal
		lpm	r26, Z+		; Load Program Memory
		lpm	r27, Z+		; Load Program Memory
		lpm	r0, Z+		; Load Program Memory
		lpm	r1, Z+		; Load Program Memory
		movw	r22, r30	; Copy Register	Word
		movw	r30, r0		; Copy Register	Word

loc_68:					; CODE XREF: __RESET+25j
		lpm	r0, Z+		; Load Program Memory
		st	X+, r0		; Store	Indirect
		sbiw	r24, 1		; Subtract Immediate from Word
		brne	loc_68		; Branch if Not	Equal
		movw	r30, r22	; Copy Register	Word
		rjmp	loc_5E		; Relative Jump
; ---------------------------------------------------------------------------

loc_6E:					; CODE XREF: __RESET+1Bj
		ldi	r30, 0x5F ; '_' ; Load Immediate
		out	SPL, r30	; Stack	Pointer	Low
		ldi	r30, 4		; Load Immediate
		out	SPH, r30	; Stack	Pointer	High
		ldi	r28, 0x60 ; '`' ; Load Immediate
		ldi	r29, 1		; Load Immediate
		jmp	START		; Jump
; End of function __RESET


; =============== S U B	R O U T	I N E =======================================

; External Interrupt Request 1

		; public INT1_
INT1_:					; CODE XREF: ROM:0004j
		call	sub_81B		; Call Subroutine
		ldi	r30, 3		; Load Immediate
		out	TCCR0, r30	; Timer/Counter	Control	Register
		ldi	r30, 0xEC ; 'ì' ; Load Immediate
		out	TCNT0, r30	; Timer/Counter	Register
		in	r30, TIFR	; Timer/Counter	Interrupt Flag Register
		ori	r30, 1		; Logical OR with Immediate
		out	TIFR, r30	; Timer/Counter	Interrupt Flag Register
		in	r30, TIMSK	; Timer/Counter	Interrupt Mask Register
		ori	r30, 1		; Logical OR with Immediate
		out	TIMSK, r30	; Timer/Counter	Interrupt Mask Register
		in	r30, GICR	; General Interrupt Control Register
		andi	r30, 0x7F	; Logical AND with Immediate
		out	GICR, r30	; General Interrupt Control Register
		clt			; Clear	T in SREG
		bld	r2, 0		; Bit load from	T to Register
		ldi	r26, 0		; Load Immediate
		sbrc	r2, 1		; Skip if Bit in Register Cleared
		ldi	r26, 1		; Load Immediate
		ldi	r30, 0		; Load Immediate
		sbic	PIND, PIND3	; Port D Input Pins Address
		ldi	r30, 1		; Load Immediate
		cp	r30, r26	; Compare
		brne	loc_90		; Branch if Not	Equal
		rcall	sub_99		; Relative Call	Subroutine

loc_90:					; CODE XREF: INT1_+18j
		rjmp	loc_119		; Relative Jump
; End of function INT1_


; =============== S U B	R O U T	I N E =======================================

; Timer/Counter0 Overflow

		; public TIMER0_OVF
TIMER0_OVF:				; CODE XREF: ROM:0012j
		call	sub_81B		; Call Subroutine
		sbrs	r2, 0		; Skip if Bit in Register Set
		rjmp	loc_97		; Relative Jump
		rcall	sub_99		; Relative Call	Subroutine
		rjmp	loc_98		; Relative Jump
; ---------------------------------------------------------------------------

loc_97:					; CODE XREF: TIMER0_OVF+3j
		rcall	sub_A6		; Relative Call	Subroutine

loc_98:					; CODE XREF: TIMER0_OVF+5j
		rjmp	loc_119		; Relative Jump
; End of function TIMER0_OVF


; =============== S U B	R O U T	I N E =======================================


sub_99:					; CODE XREF: INT1_+19p	TIMER0_OVF+4p ...
		ldi	r30, 1		; Load Immediate
		ldi	r31, 0		; Load Immediate
		movw	r8, r30		; Copy Register	Word
		mov	r7, r30		; Copy Register
		set			; Set T	in SREG
		bld	r2, 1		; Bit load from	T to Register
		in	r30, MCUCR	; MCU Control Register
		andi	r30, 0xFB	; Logical AND with Immediate
		out	MCUCR, r30	; MCU Control Register
		in	r30, TIMSK	; Timer/Counter	Interrupt Mask Register
		andi	r30, 0xFE	; Logical AND with Immediate
		out	TIMSK, r30	; Timer/Counter	Interrupt Mask Register
		rjmp	loc_D8		; Relative Jump
; End of function sub_99


; =============== S U B	R O U T	I N E =======================================


sub_A6:					; CODE XREF: TIMER0_OVF:loc_97p
		clt			; Clear	T in SREG
		sbic	PIND, PIND3	; Port D Input Pins Address
		set			; Set T	in SREG
		bld	r2, 1		; Bit load from	T to Register
		sbis	PIND, PIND3	; Port D Input Pins Address
		rjmp	loc_AF		; Relative Jump
		in	r30, MCUCR	; MCU Control Register
		andi	r30, 0xFB	; Logical AND with Immediate
		rjmp	loc_B1		; Relative Jump
; ---------------------------------------------------------------------------

loc_AF:					; CODE XREF: sub_A6+5j
		in	r30, MCUCR	; MCU Control Register
		ori	r30, 4		; Logical OR with Immediate

loc_B1:					; CODE XREF: sub_A6+8j
		out	MCUCR, r30	; MCU Control Register
		ldi	r30, 3		; Load Immediate
		cp	r30, r7		; Compare
		brcc	loc_BE		; Branch if Carry Cleared
		sbis	PIND, PIND3	; Port D Input Pins Address
		rjmp	loc_BA		; Relative Jump
		movw	r30, r8		; Copy Register	Word
		ori	r30, 1		; Logical OR with Immediate
		rjmp	loc_BD		; Relative Jump
; ---------------------------------------------------------------------------

loc_BA:					; CODE XREF: sub_A6+10j
		movw	r30, r8		; Copy Register	Word
		andi	r30, 0xFE	; Logical AND with Immediate
		andi	r31, 0		; Logical AND with Immediate

loc_BD:					; CODE XREF: sub_A6+13j
		movw	r8, r30		; Copy Register	Word

loc_BE:					; CODE XREF: sub_A6+Ej
		ldi	r30, 9		; Load Immediate
		cp	r30, r7		; Compare
		brne	loc_C2		; Branch if Not	Equal
		movw	r10, r8		; Copy Register	Word

loc_C2:					; CODE XREF: sub_A6+1Aj
		inc	r7		; Increment
		ldi	r30, 0xE	; Load Immediate
		cp	r30, r7		; Compare
		brne	loc_D2		; Branch if Not	Equal
		mov	r6, r8		; Copy Register
		ldi	r30, 0xF	; Load Immediate
		and	r6, r30		; Logical AND
		ldi	r30, 0x3C ; '<' ; Load Immediate
		ldi	r31, 0		; Load Immediate
		cp	r30, r10	; Compare
		cpc	r31, r11	; Compare with Carry
		breq	loc_CF		; Branch if Equal
		clr	r6		; Clear	Register

loc_CF:					; CODE XREF: sub_A6+27j
		rcall	sub_3C6		; Relative Call	Subroutine
		rcall	sub_99		; Relative Call	Subroutine
		ret			; Subroutine Return
; ---------------------------------------------------------------------------

loc_D2:					; CODE XREF: sub_A6+1Fj
		lsl	r8		; Logical Shift	Left
		rol	r9		; Rotate Left Through Carry
		ldi	r30, 0xDF ; 'ß' ; Load Immediate
		out	TCNT0, r30	; Timer/Counter	Register
		set			; Set T	in SREG
		bld	r2, 0		; Bit load from	T to Register

loc_D8:					; CODE XREF: sub_99+Cj
		in	r30, GIFR	; General Interrupt Flag Register
		ori	r30, 0x80	; Logical OR with Immediate
		out	GIFR, r30	; General Interrupt Flag Register
		in	r30, GICR	; General Interrupt Control Register
		ori	r30, 0x80	; Logical OR with Immediate
		out	GICR, r30	; General Interrupt Control Register
		ret			; Subroutine Return
; End of function sub_A6


; =============== S U B	R O U T	I N E =======================================

; External Interrupt Request 0

		; public INT0_
INT0_:					; CODE XREF: ROM:0002j
		call	sub_81B		; Call Subroutine
		ldi	r30, 7		; Load Immediate
		cp	r30, r12	; Compare
		brcc	loc_E7		; Branch if Carry Cleared
		ldi	r30, 0x18	; Load Immediate
		out	TCNT2, r30	; Timer/Counter	Register
		sbi	PORTB, PORTB7	; Port B Data Register

loc_E7:					; CODE XREF: INT0_+4j
		clr	r12		; Clear	Register
		rcall	sub_344		; Relative Call	Subroutine
		rjmp	loc_119		; Relative Jump
; End of function INT0_


; =============== S U B	R O U T	I N E =======================================

; Timer/Counter2 Overflow

		; public TIMER2_OVF
TIMER2_OVF:				; CODE XREF: ROM:0008j
		call	sub_81B		; Call Subroutine
		ldi	r30, 0x18	; Load Immediate
		out	TCNT2, r30	; Timer/Counter	Register
		ldi	r30, 0		; Load Immediate
		sbic	PINB, PINB6	; Port B Input Pins Address
		ldi	r30, 1		; Load Immediate
		call	sub_829		; Call Subroutine
		brne	loc_F6		; Branch if Not	Equal
		cbi	PORTB, PORTB6	; Port B Data Register
		rjmp	loc_F7		; Relative Jump
; ---------------------------------------------------------------------------

loc_F6:					; CODE XREF: TIMER2_OVF+9j
		sbi	PORTB, PORTB6	; Port B Data Register

loc_F7:					; CODE XREF: TIMER2_OVF+Bj
		cbi	PORTB, PORTB7	; Port B Data Register
		inc	r12		; Increment
		ldi	r26, 0x7F ; '' ; Load Immediate
		ldi	r27, 1		; Load Immediate
		call	sub_974		; Call Subroutine
		subi	r30, -1		; Subtract Immediate
		sbci	r31, -1		; Subtract Immediate with Carry
		sbci	r22, -1		; Subtract Immediate with Carry
		sbci	r23, -1		; Subtract Immediate with Carry
		call	sub_979		; Call Subroutine
		ldi	r26, 0x7D ; '}' ; Load Immediate
		ldi	r27, 1		; Load Immediate
		ld	r30, X+		; Load Indirect
		ld	r31, X+		; Load Indirect
		adiw	r30, 1		; Add Immediate	to Word
		st	-X, r31		; Store	Indirect
		st	-X, r30		; Store	Indirect
		lds	r30, unk_200175	; Load Direct
		subi	r30, -1		; Subtract Immediate
		sts	unk_200175, r30	; Store	Direct to SRAM
		lds	r26, unk_200175	; Load Direct
		cpi	r26, 0xA	; Compare with Immediate
		brne	loc_117		; Branch if Not	Equal
		ldi	r30, 0		; Load Immediate
		sts	unk_200175, r30	; Store	Direct to SRAM
		rcall	sub_26D		; Relative Call	Subroutine

loc_117:				; CODE XREF: TIMER2_OVF+28j
		set			; Set T	in SREG
		bld	r5, 7		; Bit load from	T to Register

loc_119:				; CODE XREF: INT1_:loc_90j
					; TIMER0_OVF:loc_98j ...
		ld	r30, Y+		; Load Indirect
		out	SREG, r30	; Status Register
		ld	r31, Y+		; Load Indirect
		ld	r30, Y+		; Load Indirect
		ld	r27, Y+		; Load Indirect
		ld	r26, Y+		; Load Indirect
		ld	r25, Y+		; Load Indirect
		ld	r24, Y+		; Load Indirect
		ld	r23, Y+		; Load Indirect
		ld	r22, Y+		; Load Indirect
		ld	r15, Y+		; Load Indirect
		ld	r1, Y+		; Load Indirect
		ld	r0, Y+		; Load Indirect
		reti			; Interrupt Return
; End of function TIMER2_OVF


; =============== S U B	R O U T	I N E =======================================


main_loop_every_2ms:			; CODE XREF: __RESET+7D1p
		clt			; Clear	T in SREG
		bld	r5, 7		; Bit load from	T to Register
		sbic	PINC, PINC1	; Port C Input Pins Address
		rjmp	loc_133		; Relative Jump
		ldi	r26, 0x77 ; 'w' ; Load Immediate
		ldi	r27, 1		; Load Immediate
		ld	r30, X+		; Load Indirect
		ld	r31, X+		; Load Indirect
		adiw	r30, 1		; Add Immediate	to Word
		st	-X, r31		; Store	Indirect
		st	-X, r30		; Store	Indirect
		rjmp	loc_138		; Relative Jump
; ---------------------------------------------------------------------------

loc_133:				; CODE XREF: main_loop_every_2ms+3j
		ldi	r30, 0		; Load Immediate
		sts	counter_word_177, r30 ;	Store Direct to	SRAM
		sts	counter_word_177+1, r30	; Store	Direct to SRAM

loc_138:				; CODE XREF: main_loop_every_2ms+Bj
		lds	r26, counter_word_177 ;	Load Direct
		lds	r27, counter_word_177+1	; Load Direct
		cpi	r26, 0xE9	; Compare with Immediate
		ldi	r30, 3		; Load Immediate
		cpc	r27, r30	; > 1000 (1.89 sec)
		brlt	loc_146		; Branch if Less Than
		ldi	r30, 0		; Load Immediate
		out	TWCR, r30	; TWI Control Register
		ldi	r30, 0x10	; (1<<TWSTO) TWI STOP Condition	Bit
		out	TWCR, r30	; TWI Control Register
		ldi	r30, 0xC5 ; 'Å' ; TWINT (TWI Interrupt Flag),
					; TWEA (TWI Enable Acknowledge Bit),
					; TWIE,	TWEN
		out	TWCR, r30	; TWI Control Register

loc_146:				; CODE XREF: main_loop_every_2ms+18j
		lds	r26, unk_20017D	; Load Direct
		lds	r27, unk_20017E	; Load Direct
		sbiw	r26, 3		; Subtract Immediate from Word
		brne	loc_14D		; Branch if Not	Equal
		rcall	sub_576		; Relative Call	Subroutine

loc_14D:				; CODE XREF: main_loop_every_2ms+24j
		lds	r26, unk_20017D	; Load Direct
		lds	r27, unk_20017E	; Load Direct
		sbiw	r26, 4		; Subtract Immediate from Word
		brcs	loc_17A		; Branch if Carry Set
		ldi	r30, 0		; Load Immediate
		sts	unk_20017D, r30	; Store	Direct to SRAM
		sts	unk_20017E, r30	; Store	Direct to SRAM
		rcall	sub_576		; Relative Call	Subroutine
		rcall	sub_65D		; Relative Call	Subroutine
		lds	r26, unk_20016C	; Load Direct
		cpi	r26, 1		; Compare with Immediate
		brcs	loc_164		; Branch if Carry Set
		lds	r30, unk_20016C	; Load Direct
		subi	r30, 1		; Subtract Immediate
		sts	unk_20016C, r30	; Store	Direct to SRAM
		rjmp	loc_169		; Relative Jump
; ---------------------------------------------------------------------------

loc_164:				; CODE XREF: main_loop_every_2ms+36j
		ldi	r30, 0		; Load Immediate
		sts	unk_20016B, r30	; Store	Direct to SRAM
		clt			; Clear	T in SREG
		bld	r5, 4		; Bit load from	T to Register

loc_169:				; CODE XREF: main_loop_every_2ms+3Cj
		lds	r26, unk_20016D	; Load Direct
		cpi	r26, 1		; Compare with Immediate
		brcs	loc_173		; Branch if Carry Set
		rcall	sub_554		; Relative Call	Subroutine
		lds	r30, unk_20016D	; Load Direct
		subi	r30, -1		; Subtract Immediate
		sts	unk_20016D, r30	; Store	Direct to SRAM

loc_173:				; CODE XREF: main_loop_every_2ms+45j
		lds	r26, unk_20016D	; Load Direct
		cpi	r26, 8		; Compare with Immediate
		brcs	loc_17A		; Branch if Carry Set
		ldi	r30, 1		; Load Immediate
		sts	unk_20016D, r30	; Store	Direct to SRAM

loc_17A:				; CODE XREF: main_loop_every_2ms+2Bj
					; main_loop_every_2ms+4Fj
		lds	r26, unk_200164	; Load Direct
		cpi	r26, 1		; Compare with Immediate
		brcs	loc_183		; Branch if Carry Set
		lds	r30, unk_200164	; Load Direct
		subi	r30, 1		; Subtract Immediate
		sts	unk_200164, r30	; Store	Direct to SRAM

loc_183:				; CODE XREF: main_loop_every_2ms+56j
		lds	r26, unk_20017F	; Load Direct
		lds	r27, unk_200180	; Load Direct
		lds	r24, unk_200181	; Load Direct
		lds	r25, unk_200182	; Load Direct
		cpi	r26, 0xF4 ; 'ô' ; Compare with Immediate
		ldi	r30, 1		; Load Immediate
		cpc	r27, r30	; Compare with Carry
		ldi	r30, 0		; Load Immediate
		cpc	r24, r30	; Compare with Carry
		ldi	r30, 0		; Load Immediate
		cpc	r25, r30	; Compare with Carry
		brcc	loc_195		; Branch if Carry Cleared
		jmp	loc_26A		; Jump
; ---------------------------------------------------------------------------

loc_195:				; CODE XREF: main_loop_every_2ms+6Bj
		ldi	r30, 0		; Load Immediate
		sts	unk_20017F, r30	; Store	Direct to SRAM
		sts	unk_200180, r30	; Store	Direct to SRAM
		sts	unk_200181, r30	; Store	Direct to SRAM
		sts	unk_200182, r30	; Store	Direct to SRAM
		ldi	r30, 0		; Load Immediate
		sbrc	r4, 6		; Skip if Bit in Register Cleared
		ldi	r30, 1		; Load Immediate
		call	sub_829		; Call Subroutine
		call	sub_9C1		; Call Subroutine
		bld	r4, 6		; Bit load from	T to Register
		sbrs	r5, 6		; Skip if Bit in Register Set
		rjmp	loc_1AC		; Relative Jump
		lds	r30, unk_20016F	; Load Direct
		ori	r30, 4		; Logical OR with Immediate
		rjmp	loc_1AF		; Relative Jump
; ---------------------------------------------------------------------------

loc_1AC:				; CODE XREF: main_loop_every_2ms+80j
		lds	r30, unk_20016F	; Load Direct
		andi	r30, 0xFB	; Logical AND with Immediate

loc_1AF:				; CODE XREF: main_loop_every_2ms+84j
		sts	unk_20016F, r30	; Store	Direct to SRAM
		sbrs	r2, 3		; Skip if Bit in Register Set
		rjmp	loc_1B7		; Relative Jump
		lds	r30, unk_20016F	; Load Direct
		ori	r30, 8		; Logical OR with Immediate
		rjmp	loc_1BA		; Relative Jump
; ---------------------------------------------------------------------------

loc_1B7:				; CODE XREF: main_loop_every_2ms+8Bj
		lds	r30, unk_20016F	; Load Direct
		andi	r30, 0xF7	; Logical AND with Immediate

loc_1BA:				; CODE XREF: main_loop_every_2ms+8Fj
		sts	unk_20016F, r30	; Store	Direct to SRAM
		lds	r26, unk_200162	; Load Direct
		cpi	r26, 1		; Compare with Immediate
		brcs	loc_1D0		; Branch if Carry Set
		lds	r30, unk_200162	; Load Direct
		subi	r30, 1		; Subtract Immediate
		sts	unk_200162, r30	; Store	Direct to SRAM
		sbrs	r5, 5		; Skip if Bit in Register Set
		rjmp	loc_1D0		; Relative Jump
		ldi	r30, 0		; Load Immediate
		sbic	PORTB, PORTB4	; Port B Data Register
		ldi	r30, 1		; Load Immediate
		call	sub_829		; Call Subroutine
		brne	loc_1CF		; Branch if Not	Equal
		cbi	PORTB, PORTB4	; Port B Data Register
		rjmp	loc_1D0		; Relative Jump
; ---------------------------------------------------------------------------

loc_1CF:				; CODE XREF: main_loop_every_2ms+A5j
		sbi	PORTB, PORTB4	; Port B Data Register

loc_1D0:				; CODE XREF: main_loop_every_2ms+98j
					; main_loop_every_2ms+9Fj ...
		lds	r26, unk_200162	; Load Direct
		cpi	r26, 2		; Compare with Immediate
		brcc	loc_1DB		; Branch if Carry Cleared
		cbi	PORTB, PORTB4	; Port B Data Register
		clt			; Clear	T in SREG
		bld	r5, 5		; Bit load from	T to Register
		bld	r5, 1		; Bit load from	T to Register
		ldi	r30, 0		; Load Immediate
		sts	unk_20016D, r30	; Store	Direct to SRAM

loc_1DB:				; CODE XREF: main_loop_every_2ms+ACj
		lds	r26, unk_20016A	; Load Direct
		cpi	r26, 1		; Compare with Immediate
		brcs	loc_1E4		; Branch if Carry Set
		lds	r30, unk_20016A	; Load Direct
		subi	r30, 1		; Subtract Immediate
		sts	unk_20016A, r30	; Store	Direct to SRAM

loc_1E4:				; CODE XREF: main_loop_every_2ms+B7j
		sbrs	r2, 3		; Skip if Bit in Register Set
		rjmp	loc_1E8		; Relative Jump
		bst	r4, 6		; Bit Store from Register to T
		rjmp	loc_1E9		; Relative Jump
; ---------------------------------------------------------------------------

loc_1E8:				; CODE XREF: main_loop_every_2ms+BEj
		clt			; Clear	T in SREG

loc_1E9:				; CODE XREF: main_loop_every_2ms+C0j
		bld	r3, 4		; Bit load from	T to Register
		lds	r26, unk_200162	; Load Direct
		cpi	r26, 2		; Compare with Immediate
		brcc	loc_1F2		; Branch if Carry Cleared
		lds	r26, unk_200165	; Load Direct
		cpi	r26, 0		; Compare with Immediate
		breq	loc_1F3		; Branch if Equal

loc_1F2:				; CODE XREF: main_loop_every_2ms+C6j
		rjmp	loc_1F7		; Relative Jump
; ---------------------------------------------------------------------------

loc_1F3:				; CODE XREF: main_loop_every_2ms+CAj
		call	sub_82E		; Call Subroutine
		call	sub_837		; Call Subroutine

loc_1F7:				; CODE XREF: main_loop_every_2ms:loc_1F2j
		lds	r30, unk_200183	; Load Direct
		lds	r31, unk_200184	; Load Direct
		lds	r22, unk_200185	; Load Direct
		lds	r23, unk_200186	; Load Direct
		call	sub_9B7		; Call Subroutine
		brne	loc_205		; Branch if Not	Equal
		ldi	r30, 0x14	; Load Immediate
		sts	byte_200161, r30 ; Store Direct	to SRAM

loc_205:				; CODE XREF: main_loop_every_2ms+DAj
		lds	r26, unk_200165	; Load Direct
		cpi	r26, 1		; Compare with Immediate
		brcs	loc_20E		; Branch if Carry Set
		lds	r30, unk_200165	; Load Direct
		subi	r30, -1		; Subtract Immediate
		sts	unk_200165, r30	; Store	Direct to SRAM

loc_20E:				; CODE XREF: main_loop_every_2ms+E1j
		lds	r26, unk_200165	; Load Direct
		cpi	r26, 5		; Compare with Immediate
		brne	loc_217		; Branch if Not	Equal
		ldi	r30, 7		; Load Immediate
		sts	unk_200168, r30	; Store	Direct to SRAM
		set			; Set T	in SREG
		bld	r5, 3		; Bit load from	T to Register

loc_217:				; CODE XREF: main_loop_every_2ms+EAj
		lds	r26, unk_200165	; Load Direct
		cpi	r26, 6		; Compare with Immediate
		brcs	loc_21D		; Branch if Carry Set
		sbrc	r5, 3		; Skip if Bit in Register Cleared
		rjmp	loc_21E		; Relative Jump

loc_21D:				; CODE XREF: main_loop_every_2ms+F3j
		rjmp	loc_21F		; Relative Jump
; ---------------------------------------------------------------------------

loc_21E:				; CODE XREF: main_loop_every_2ms+F5j
		rcall	sub_734		; Relative Call	Subroutine

loc_21F:				; CODE XREF: main_loop_every_2ms:loc_21Dj
		ldi	r26, 0		; Load Immediate
		sbrc	r5, 3		; Skip if Bit in Register Cleared
		ldi	r26, 1		; Load Immediate
		cpi	r26, 0		; Compare with Immediate
		brne	loc_228		; Branch if Not	Equal
		lds	r26, unk_200165	; Load Direct
		cpi	r26, 6		; Compare with Immediate
		brcc	loc_229		; Branch if Carry Cleared

loc_228:				; CODE XREF: main_loop_every_2ms+FCj
		rjmp	loc_22C		; Relative Jump
; ---------------------------------------------------------------------------

loc_229:				; CODE XREF: main_loop_every_2ms+100j
		ldi	r30, 0x14	; Load Immediate
		sts	byte_200161, r30 ; Store Direct	to SRAM

loc_22C:				; CODE XREF: main_loop_every_2ms:loc_228j
		ldi	r26, 0		; Load Immediate
		sbrc	r5, 3		; Skip if Bit in Register Cleared
		ldi	r26, 1		; Load Immediate
		ldi	r30, 1		; Load Immediate
		call	sub_97E		; Call Subroutine
		sub	r30, r26	; Subtract without Carry
		call	sub_9C1		; Call Subroutine
		bld	r5, 3		; Bit load from	T to Register
		lds	r26, unk_200166	; Load Direct
		cpi	r26, 1		; Compare with Immediate
		brcs	loc_23F		; Branch if Carry Set
		lds	r30, unk_200166	; Load Direct
		subi	r30, -1		; Subtract Immediate
		sts	unk_200166, r30	; Store	Direct to SRAM

loc_23F:				; CODE XREF: main_loop_every_2ms+112j
		lds	r26, unk_200166	; Load Direct
		cpi	r26, 5		; Compare with Immediate
		brne	loc_24D		; Branch if Not	Equal
		clt			; Clear	T in SREG
		bld	r5, 2		; Bit load from	T to Register
		ldi	r26, 9		; Load Immediate
		ldi	r27, 0		; Load Immediate
		ldi	r30, 0		; Load Immediate
		ldi	r31, 0		; Load Immediate
		ldi	r22, 0		; Load Immediate
		ldi	r23, 0		; Load Immediate
		call	EEPROM_CHK_WRITE_LONG ;	Call Subroutine

loc_24D:				; CODE XREF: main_loop_every_2ms+11Bj
		lds	r26, unk_200167	; Load Direct
		cpi	r26, 1		; Compare with Immediate
		brcs	loc_256		; Branch if Carry Set
		lds	r30, unk_200167	; Load Direct
		subi	r30, -1		; Subtract Immediate
		sts	unk_200167, r30	; Store	Direct to SRAM

loc_256:				; CODE XREF: main_loop_every_2ms+129j
		lds	r26, unk_200167	; Load Direct
		cpi	r26, 6		; Compare with Immediate
		brne	loc_26A		; Branch if Not	Equal
		ldi	r30, 2		; Load Immediate
		sts	unk_20016F, r30	; Store	Direct to SRAM
		ldi	r26, 0xD	; Load Immediate
		ldi	r27, 0		; Load Immediate
		ldi	r30, 0		; Load Immediate
		call	EEPROM_CHECK_WRITE ; Call Subroutine
		ldi	r30, 0x32 ; '2' ; Load Immediate
		sts	unk_20016E, r30	; Store	Direct to SRAM
		ldi	r30, 0		; Load Immediate
		sts	unk_200167, r30	; Store	Direct to SRAM
		clt			; Clear	T in SREG
		bld	r5, 4		; Bit load from	T to Register

loc_26A:				; CODE XREF: main_loop_every_2ms+6Cj
					; main_loop_every_2ms+132j
		rcall	CheckKeys_420_	; Relative Call	Subroutine
		ret			; Subroutine Return
; End of function main_loop_every_2ms


; =============== S U B	R O U T	I N E =======================================

; Two-wire Serial Interface

		; public TWI_
TWI_:					; CODE XREF: ROM:0022j
		reti			; Interrupt Return
; End of function TWI_


; =============== S U B	R O U T	I N E =======================================


sub_26D:				; CODE XREF: TIMER2_OVF+2Cp
		lds	r30, unk_200193	; Load Direct
		subi	r30, -1		; Subtract Immediate
		sts	unk_200193, r30	; Store	Direct to SRAM
		lds	r26, unk_200193	; Load Direct
		cpi	r26, 0x32 ; '2' ; Compare with Immediate
		brcc	loc_278		; Branch if Carry Cleared
		jmp	loc_2C9		; Jump
; ---------------------------------------------------------------------------

loc_278:				; CODE XREF: sub_26D+8j
		ldi	r30, 0		; Load Immediate
		sts	unk_200193, r30	; Store	Direct to SRAM
		lds	r30, unk_200194	; Load Direct
		subi	r30, -1		; Subtract Immediate
		sts	unk_200194, r30	; Store	Direct to SRAM
		subi	r30, 1		; Subtract Immediate
		call	sub_82E		; Call Subroutine
		call	sub_9BB		; Call Subroutine
		brcc	loc_28F		; Branch if Carry Cleared
		ldi	r26, 0x83 ; 'ƒ' ; Load Immediate
		ldi	r27, 1		; Load Immediate
		call	sub_974		; Call Subroutine
		sbiw	r30, 1		; Subtract Immediate from Word
		sbci	r22, 0		; Subtract Immediate with Carry
		sbci	r23, 0		; Subtract Immediate with Carry
		call	sub_979		; Call Subroutine

loc_28F:				; CODE XREF: sub_26D+18j
		call	sub_82E		; Call Subroutine
		cpi	r26, 1		; Compare with Immediate
		ldi	r30, 0		; Load Immediate
		cpc	r27, r30	; Compare with Carry
		ldi	r30, 0		; Load Immediate
		cpc	r24, r30	; Compare with Carry
		ldi	r30, 0		; Load Immediate
		cpc	r25, r30	; Compare with Carry
		brne	loc_2A6		; Branch if Not	Equal
		call	Save_SPEED	; Call Subroutine
		clt			; Clear	T in SREG
		bld	r4, 7		; Bit load from	T to Register
		ldi	r30, 0		; Load Immediate
		sts	byte_200160, r30 ; Store Direct	to SRAM
		ldi	r30, 1		; Load Immediate
		sts	unk_200176, r30	; Store	Direct to SRAM
		sbrc	r5, 6		; Skip if Bit in Register Cleared
		rjmp	loc_2A6		; Relative Jump
		bld	r2, 3		; Bit load from	T to Register

loc_2A6:				; CODE XREF: sub_26D+2Bj sub_26D+37j
		call	sub_82E		; Call Subroutine
		ldi	r30, 0x3C ; '<' ; Load Immediate
		ldi	r31, 0		; Load Immediate
		ldi	r22, 0		; Load Immediate
		ldi	r23, 0		; Load Immediate
		call	sub_94F		; Call Subroutine
		sts	unk_20018B, r30	; Store	Direct to SRAM
		sts	unk_20018C, r31	; Store	Direct to SRAM
		sts	unk_20018D, r22	; Store	Direct to SRAM
		sts	unk_20018E, r23	; Store	Direct to SRAM
		lds	r26, unk_20018B	; Load Direct
		lds	r27, unk_20018C	; Load Direct
		lds	r24, unk_20018D	; Load Direct
		lds	r25, unk_20018E	; Load Direct
		ldi	r30, 8		; Load Immediate
		call	sub_923		; Call Subroutine
		sts	unk_20018F, r30	; Store	Direct to SRAM
		sts	unk_200190, r31	; Store	Direct to SRAM
		sts	unk_200191, r22	; Store	Direct to SRAM
		sts	unk_200192, r23	; Store	Direct to SRAM

loc_2C9:				; CODE XREF: sub_26D+9j
		lds	r26, unk_200194	; Load Direct
		cpi	r26, 0x3C ; '<' ; Compare with Immediate
		brcs	loc_2D6		; Branch if Carry Set
		ldi	r30, 0		; Load Immediate
		sts	unk_200194, r30	; Store	Direct to SRAM
		lds	r30, unk_200195	; Load Direct
		subi	r30, -1		; Subtract Immediate
		sts	unk_200195, r30	; Store	Direct to SRAM
		subi	r30, 1		; Subtract Immediate

loc_2D6:				; CODE XREF: sub_26D+5Fj
		lds	r26, unk_200195	; Load Direct
		cpi	r26, 0x3C ; '<' ; Compare with Immediate
		brcs	loc_30A		; Branch if Carry Set
		ldi	r30, 0		; Load Immediate
		sts	unk_200195, r30	; Store	Direct to SRAM
		lds	r30, unk_200196	; Load Direct
		subi	r30, -1		; Subtract Immediate
		sts	unk_200196, r30	; Store	Direct to SRAM
		subi	r30, 1		; Subtract Immediate
		lds	r26, byte_200160 ; Load	Direct
		cpi	r26, 0		; Compare with Immediate
		brne	loc_2EB		; Branch if Not	Equal
		lds	r26, unk_200176	; Load Direct
		cpi	r26, 1		; Compare with Immediate
		brne	loc_30A		; Branch if Not	Equal

loc_2EB:				; CODE XREF: sub_26D+79j
		lds	r30, unk_200169	; Load Direct
		subi	r30, -1		; Subtract Immediate
		sts	unk_200169, r30	; Store	Direct to SRAM
		lds	r26, unk_200169	; Load Direct
		cpi	r26, 3		; Compare with Immediate
		brcs	loc_301		; Branch if Carry Set
		call	sub_847		; Call Subroutine
		subi	r30, -3	; 'ý'   ; Subtract Immediate
		sbci	r31, -1		; Subtract Immediate with Carry
		sbci	r22, -1		; Subtract Immediate with Carry
		sbci	r23, -1		; Subtract Immediate with Carry
		ldi	r26, 5		; Load Immediate
		ldi	r27, 0		; Load Immediate
		call	EEPROM_CHK_WRITE_LONG ;	Call Subroutine
		ldi	r30, 0		; Load Immediate
		sts	unk_200169, r30	; Store	Direct to SRAM

loc_301:				; CODE XREF: sub_26D+86j
		call	sub_847		; Call Subroutine
		call	sub_84C		; Call Subroutine
		call	sub_85E		; Call Subroutine
		ldi	r30, 0		; Load Immediate
		sts	unk_200176, r30	; Store	Direct to SRAM

loc_30A:				; CODE XREF: sub_26D+6Cj sub_26D+7Dj
		lds	r26, unk_200196	; Load Direct
		cpi	r26, 0x18	; Compare with Immediate
		brcs	locret_343	; Branch if Carry Set
		ldi	r30, 0		; Load Immediate
		sts	unk_200196, r30	; Store	Direct to SRAM
		lds	r26, unk_200196	; Load Direct
		lds	r30, unk_200195	; Load Direct
		add	r26, r30	; Add without Carry
		lds	r30, unk_200194	; Load Direct
		add	r30, r26	; Add without Carry
		brne	loc_328		; Branch if Not	Equal
		sbrs	r2, 3		; Skip if Bit in Register Set
		rjmp	loc_31E		; Relative Jump
		sbrc	r5, 6		; Skip if Bit in Register Cleared
		rjmp	loc_31F		; Relative Jump

loc_31E:				; CODE XREF: sub_26D+AEj
		rjmp	loc_328		; Relative Jump
; ---------------------------------------------------------------------------

loc_31F:				; CODE XREF: sub_26D+B0j
		call	sub_875		; Call Subroutine
		set			; Set T	in SREG
		bld	r4, 7		; Bit load from	T to Register
		ldi	r30, 0xA	; Load Immediate
		sts	unk_20016A, r30	; Store	Direct to SRAM
		call	sub_87C		; Call Subroutine

loc_328:				; CODE XREF: sub_26D+ACj
					; sub_26D:loc_31Ej
		ldi	r26, 9		; Load Immediate
		ldi	r27, 0		; Load Immediate
		call	sub_982		; Call Subroutine
		subi	r30, -1		; Subtract Immediate
		sbci	r31, -1		; Subtract Immediate with Carry
		sbci	r22, -1		; Subtract Immediate with Carry
		sbci	r23, -1		; Subtract Immediate with Carry
		call	EEPROM_CHK_WRITE_LONG ;	Call Subroutine
		sbiw	r30, 1		; Subtract Immediate from Word
		sbci	r22, 0		; Subtract Immediate with Carry
		sbci	r23, 0		; Subtract Immediate with Carry
		ldi	r26, 9		; Load Immediate
		ldi	r27, 0		; Load Immediate
		call	sub_982		; Call Subroutine
		cpi	r30, 0xB8 ; '¸' ; Compare with Immediate
		ldi	r26, 0		; Load Immediate
		cpc	r31, r26	; Compare with Carry
		ldi	r26, 0		; Load Immediate
		cpc	r22, r26	; Compare with Carry
		ldi	r26, 0		; Load Immediate
		cpc	r23, r26	; Compare with Carry
		brcs	locret_343	; Branch if Carry Set
		set			; Set T	in SREG
		bld	r5, 2		; Bit load from	T to Register

locret_343:				; CODE XREF: sub_26D+A0j sub_26D+D3j
		ret			; Subroutine Return
; End of function sub_26D


; =============== S U B	R O U T	I N E =======================================


sub_344:				; CODE XREF: INT0_+9p
		st	-Y, r17		; Store	Indirect
		lds	r17, byte_200160 ; Load	Direct
		lds	r30, byte_200160 ; Load	Direct
		ldi	r26, 0x10	; Load Immediate
		mul	r30, r26	; Multiply
		movw	r30, r0		; Copy Register	Word
		sts	unk_200170, r30	; Store	Direct to SRAM
		lds	r26, byte_200160 ; Load	Direct
		cpi	r26, 7		; Compare with Immediate
		brne	loc_355		; Branch if Not	Equal
		ldi	r30, 0x63 ; 'c' ; Load Immediate
		sts	unk_200170, r30	; Store	Direct to SRAM

loc_355:				; CODE XREF: sub_344+Dj
		sbi	PORTD, PORTD0	; Port D Data Register
		lds	r30, unk_200163	; Load Direct
		subi	r30, -1		; Subtract Immediate
		sts	unk_200163, r30	; Store	Direct to SRAM
		lds	r26, unk_20016A	; Load Direct
		cpi	r26, 2		; Compare with Immediate
		brcs	loc_363		; Branch if Carry Set
		lds	r26, byte_200160 ; Load	Direct
		cpi	r26, 6		; Compare with Immediate
		brcs	loc_364		; Branch if Carry Set

loc_363:				; CODE XREF: sub_344+1Aj
		rjmp	loc_365		; Relative Jump
; ---------------------------------------------------------------------------

loc_364:				; CODE XREF: sub_344+1Ej
		ldi	r17, 6		; Load Immediate

loc_365:				; CODE XREF: sub_344:loc_363j
		ldi	r30, 0xF	; Load Immediate
		sts	unk_200174, r30	; Store	Direct to SRAM
		mov	r30, r17	; Copy Register
		cpi	r30, 0		; Compare with Immediate
		brne	loc_36D		; Branch if Not	Equal
		sbi	PORTD, PORTD1	; Port D Data Register
		rjmp	loc_3BD		; Relative Jump
; ---------------------------------------------------------------------------

loc_36D:				; CODE XREF: sub_344+26j
		cpi	r30, 1		; Compare with Immediate
		brne	loc_378		; Branch if Not	Equal
		lds	r26, unk_200163	; Load Direct
		cpi	r26, 5		; Compare with Immediate
		brcs	loc_376		; Branch if Carry Set
		call	sub_88D		; Call Subroutine
		rjmp	loc_377		; Relative Jump
; ---------------------------------------------------------------------------

loc_376:				; CODE XREF: sub_344+2Ej
		sbi	PORTD, PORTD1	; Port D Data Register

loc_377:				; CODE XREF: sub_344+31j
		rjmp	loc_3BD		; Relative Jump
; ---------------------------------------------------------------------------

loc_378:				; CODE XREF: sub_344+2Aj
		cpi	r30, 2		; Compare with Immediate
		brne	loc_383		; Branch if Not	Equal
		lds	r26, unk_200163	; Load Direct
		cpi	r26, 4		; Compare with Immediate
		brcs	loc_381		; Branch if Carry Set
		call	sub_88D		; Call Subroutine
		rjmp	loc_382		; Relative Jump
; ---------------------------------------------------------------------------

loc_381:				; CODE XREF: sub_344+39j
		sbi	PORTD, PORTD1	; Port D Data Register

loc_382:				; CODE XREF: sub_344+3Cj
		rjmp	loc_3BD		; Relative Jump
; ---------------------------------------------------------------------------

loc_383:				; CODE XREF: sub_344+35j
		cpi	r30, 3		; Compare with Immediate
		brne	loc_39D		; Branch if Not	Equal
		lds	r26, unk_200163	; Load Direct
		cpi	r26, 3		; Compare with Immediate
		brcs	loc_39B		; Branch if Carry Set
		ldi	r30, 0		; Load Immediate
		sbrc	r5, 0		; Skip if Bit in Register Cleared
		ldi	r30, 1		; Load Immediate
		call	sub_829		; Call Subroutine
		call	sub_9C1		; Call Subroutine
		bld	r5, 0		; Bit load from	T to Register
		ldi	r30, 0		; Load Immediate
		sts	unk_200163, r30	; Store	Direct to SRAM
		sbrs	r5, 0		; Skip if Bit in Register Set
		rjmp	loc_399		; Relative Jump
		ldi	r30, 1		; Load Immediate
		sts	unk_200163, r30	; Store	Direct to SRAM

loc_399:				; CODE XREF: sub_344+51j
		cbi	PORTD, PORTD1	; Port D Data Register
		rjmp	loc_39C		; Relative Jump
; ---------------------------------------------------------------------------

loc_39B:				; CODE XREF: sub_344+44j
		sbi	PORTD, PORTD1	; Port D Data Register

loc_39C:				; CODE XREF: sub_344+56j
		rjmp	loc_3BD		; Relative Jump
; ---------------------------------------------------------------------------

loc_39D:				; CODE XREF: sub_344+40j
		cpi	r30, 4		; Compare with Immediate
		brne	loc_3A8		; Branch if Not	Equal
		lds	r26, unk_200163	; Load Direct
		cpi	r26, 2		; Compare with Immediate
		brcs	loc_3A6		; Branch if Carry Set
		call	sub_88D		; Call Subroutine
		rjmp	loc_3A7		; Relative Jump
; ---------------------------------------------------------------------------

loc_3A6:				; CODE XREF: sub_344+5Ej
		sbi	PORTD, PORTD1	; Port D Data Register

loc_3A7:				; CODE XREF: sub_344+61j
		rjmp	loc_3BD		; Relative Jump
; ---------------------------------------------------------------------------

loc_3A8:				; CODE XREF: sub_344+5Aj
		cpi	r30, 5		; Compare with Immediate
		brne	loc_3B5		; Branch if Not	Equal
		lds	r26, unk_200163	; Load Direct
		cpi	r26, 6		; Compare with Immediate
		brcs	loc_3B3		; Branch if Carry Set
		ldi	r30, 0		; Load Immediate
		sts	unk_200163, r30	; Store	Direct to SRAM
		sbi	PORTD, PORTD1	; Port D Data Register
		rjmp	loc_3B4		; Relative Jump
; ---------------------------------------------------------------------------

loc_3B3:				; CODE XREF: sub_344+69j
		cbi	PORTD, PORTD1	; Port D Data Register

loc_3B4:				; CODE XREF: sub_344+6Ej
		rjmp	loc_3BD		; Relative Jump
; ---------------------------------------------------------------------------

loc_3B5:				; CODE XREF: sub_344+65j
		cpi	r30, 6		; Compare with Immediate
		brne	loc_3B9		; Branch if Not	Equal
		cbi	PORTD, PORTD1	; Port D Data Register
		rjmp	loc_3BD		; Relative Jump
; ---------------------------------------------------------------------------

loc_3B9:				; CODE XREF: sub_344+72j
		cpi	r30, 7		; Compare with Immediate
		brne	loc_3BD		; Branch if Not	Equal
		sbi	PORTD, PORTD1	; Port D Data Register
		cbi	PORTD, PORTD0	; Port D Data Register

loc_3BD:				; CODE XREF: sub_344+28j
					; sub_344:loc_377j ...
		lds	r26, unk_200162	; Load Direct
		cpi	r26, 1		; Compare with Immediate
		brcs	loc_3C3		; Branch if Carry Set
		sbi	PORTD, PORTD1	; Port D Data Register
		sbi	PORTD, PORTD0	; Port D Data Register

loc_3C3:				; CODE XREF: sub_344+7Cj
		rjmp	loc_732		; Relative Jump
; End of function sub_344


; =============== S U B	R O U T	I N E =======================================


sub_3C4:				; CODE XREF: CheckKeys_420_+5Cp
		adiw	r28, 1		; Add Immediate	to Word
		ret			; Subroutine Return
; End of function sub_3C4


; =============== S U B	R O U T	I N E =======================================


sub_3C6:				; CODE XREF: sub_A6:loc_CFp
		mov	r30, r6		; Copy Register
		cpi	r30, 2		; Compare with Immediate
		brne	loc_3D9		; Branch if Not	Equal
		sbrc	r4, 7		; Skip if Bit in Register Cleared
		rjmp	loc_3D8		; Relative Jump
		call	sub_875		; Call Subroutine
		lds	r26, byte_200160 ; Load	Direct
		cpi	r26, 0		; Compare with Immediate
		breq	loc_3D3		; Branch if Equal
		cpi	r26, 8		; Compare with Immediate
		brcs	loc_3D6		; Branch if Carry Set

loc_3D3:				; CODE XREF: sub_3C6+Aj
		ldi	r30, 1		; Load Immediate
		sts	byte_200160, r30 ; Store Direct	to SRAM

loc_3D6:				; CODE XREF: sub_3C6+Cj
		set			; Set T	in SREG
		bld	r4, 7		; Bit load from	T to Register

loc_3D8:				; CODE XREF: sub_3C6+4j
		rjmp	loc_41E		; Relative Jump
; ---------------------------------------------------------------------------

loc_3D9:				; CODE XREF: sub_3C6+2j
		cpi	r30, 3		; Compare with Immediate
		brne	loc_3E2		; Branch if Not	Equal
		sbrs	r4, 7		; Skip if Bit in Register Set
		rjmp	loc_3E1		; Relative Jump
		call	Save_SPEED	; Call Subroutine
		call	sub_892		; Call Subroutine

loc_3E1:				; CODE XREF: sub_3C6+16j
		rjmp	loc_3E4		; Relative Jump
; ---------------------------------------------------------------------------

loc_3E2:				; CODE XREF: sub_3C6+14j
		cpi	r30, 1		; Compare with Immediate
		brne	loc_3F9		; Branch if Not	Equal

loc_3E4:				; CODE XREF: sub_3C6:loc_3E1j
		sbi	PORTB, PORTB4	; Port B Data Register
		ldi	r30, 5		; Load Immediate
		sts	unk_200162, r30	; Store	Direct to SRAM
		sbrc	r2, 3		; Skip if Bit in Register Cleared
		rjmp	loc_3F6		; Relative Jump
		set			; Set T	in SREG
		bld	r2, 3		; Bit load from	T to Register
		call	sub_87C		; Call Subroutine
		call	sub_8A1		; Call Subroutine
		brne	loc_3F3		; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r3, 4		; Bit load from	T to Register

loc_3F3:				; CODE XREF: sub_3C6+2Aj
		clt			; Clear	T in SREG
		bld	r4, 6		; Bit load from	T to Register
		rjmp	loc_3F8		; Relative Jump
; ---------------------------------------------------------------------------

loc_3F6:				; CODE XREF: sub_3C6+23j
		call	sub_8AC		; Call Subroutine

loc_3F8:				; CODE XREF: sub_3C6+2Fj
		rjmp	loc_41E		; Relative Jump
; ---------------------------------------------------------------------------

loc_3F9:				; CODE XREF: sub_3C6+1Dj
		cpi	r30, 5		; Compare with Immediate
		brne	loc_3FD		; Branch if Not	Equal
		ldi	r30, 6		; Load Immediate
		rjmp	loc_41C		; Relative Jump
; ---------------------------------------------------------------------------

loc_3FD:				; CODE XREF: sub_3C6+34j
		cpi	r30, 4		; Compare with Immediate
		brne	loc_401		; Branch if Not	Equal
		ldi	r30, 7		; Load Immediate
		rjmp	loc_41C		; Relative Jump
; ---------------------------------------------------------------------------

loc_401:				; CODE XREF: sub_3C6+38j
		cpi	r30, 7		; Compare with Immediate
		brne	loc_410		; Branch if Not	Equal
		lds	r26, byte_200160 ; Load	Direct
		cpi	r26, 3		; Compare with Immediate
		brcs	loc_409		; Branch if Carry Set
		sbrc	r4, 7		; Skip if Bit in Register Cleared
		rjmp	loc_40A		; Relative Jump

loc_409:				; CODE XREF: sub_3C6+40j
		rjmp	loc_40F		; Relative Jump
; ---------------------------------------------------------------------------

loc_40A:				; CODE XREF: sub_3C6+42j
		lds	r30, byte_200160 ; Load	Direct
		subi	r30, 1		; Subtract Immediate
		sts	byte_200160, r30 ; Store Direct	to SRAM

loc_40F:				; CODE XREF: sub_3C6:loc_409j
		rjmp	loc_41E		; Relative Jump
; ---------------------------------------------------------------------------

loc_410:				; CODE XREF: sub_3C6+3Cj
		cpi	r30, 8		; Compare with Immediate
		brne	loc_41E		; Branch if Not	Equal
		lds	r26, byte_200160 ; Load	Direct
		cpi	r26, 6		; Compare with Immediate
		brcc	loc_418		; Branch if Carry Cleared
		sbrc	r4, 7		; Skip if Bit in Register Cleared
		rjmp	loc_419		; Relative Jump

loc_418:				; CODE XREF: sub_3C6+4Fj
		rjmp	loc_41E		; Relative Jump
; ---------------------------------------------------------------------------

loc_419:				; CODE XREF: sub_3C6+51j
		lds	r30, byte_200160 ; Load	Direct
		subi	r30, -1		; Subtract Immediate

loc_41C:				; CODE XREF: sub_3C6+36j sub_3C6+3Aj
		sts	byte_200160, r30 ; Store Direct	to SRAM

loc_41E:				; CODE XREF: sub_3C6:loc_3D8j
					; sub_3C6:loc_3F8j ...
		clr	r6		; Clear	Register
		ret			; Subroutine Return
; End of function sub_3C6


; =============== S U B	R O U T	I N E =======================================


CheckKeys_420_:				; CODE XREF: main_loop_every_2ms:loc_26Ap
		ldi	r26, 0		; Load Immediate
		sbic	PINB, PINB2	; Port B Input Pins Address
		ldi	r26, 1		; Load Immediate
		cpi	r26, 0		; Compare with Immediate
		brne	loc_42B		; Branch if Not	Equal
		lds	r26, unk_200167	; Load Direct
		cpi	r26, 0		; Compare with Immediate
		brne	loc_42B		; Branch if Not	Equal
		sbrc	r5, 4		; Skip if Bit in Register Cleared
		rjmp	loc_42C		; Relative Jump

loc_42B:				; CODE XREF: CheckKeys_420_+4j
					; CheckKeys_420_+8j
		rjmp	loc_42F		; Relative Jump
; ---------------------------------------------------------------------------

loc_42C:				; CODE XREF: CheckKeys_420_+Aj
		ldi	r30, 1		; Load Immediate
		sts	unk_200167, r30	; Store	Direct to SRAM

loc_42F:				; CODE XREF: CheckKeys_420_:loc_42Bj
		ldi	r26, 0xD	; Load Immediate
		ldi	r27, 0		; Load Immediate
		call	EEPROM_READ	; Call Subroutine
		cpi	r30, 2		; Compare with Immediate
		brcs	loc_437		; Branch if Carry Set
		jmp	loc_53A		; Jump
; ---------------------------------------------------------------------------

loc_437:				; CODE XREF: CheckKeys_420_+14j
		ldi	r26, 0		; Load Immediate
		sbic	PINB, PINB2	; Port B Input Pins Address
		ldi	r26, 1		; Load Immediate
		cpi	r26, 0		; Compare with Immediate
		brne	loc_43E		; Branch if Not	Equal
		sbrc	r4, 5		; Skip if Bit in Register Cleared
		rjmp	loc_43F		; Relative Jump

loc_43E:				; CODE XREF: CheckKeys_420_+1Bj
		rjmp	loc_480		; Relative Jump
; ---------------------------------------------------------------------------

loc_43F:				; CODE XREF: CheckKeys_420_+1Dj
		call	Light_ON	; Call Subroutine
		lds	r26, unk_20016C	; Load Direct
		cpi	r26, 0		; Compare with Immediate
		brne	loc_449		; Branch if Not	Equal
		lds	r26, unk_20016B	; Load Direct
		cpi	r26, 0		; Compare with Immediate
		breq	loc_44A		; Branch if Equal

loc_449:				; CODE XREF: CheckKeys_420_+24j
		rjmp	loc_44D		; Relative Jump
; ---------------------------------------------------------------------------

loc_44A:				; CODE XREF: CheckKeys_420_+28j
		ldi	r30, 0xC8 ; 'È' ; Load Immediate
		sts	unk_20016C, r30	; Store	Direct to SRAM

loc_44D:				; CODE XREF: CheckKeys_420_:loc_449j
		lds	r30, unk_20016B	; Load Direct
		subi	r30, -1		; Subtract Immediate
		sts	unk_20016B, r30	; Store	Direct to SRAM
		sbrc	r4, 7		; Skip if Bit in Register Cleared
		rjmp	loc_467		; power	off - save
		call	sub_875		; Call Subroutine
		lds	r26, byte_200160 ; Load	Direct
		cpi	r26, 0		; Compare with Immediate
		breq	loc_45C		; Branch if Equal
		cpi	r26, 8		; Compare with Immediate
		brcs	loc_45F		; Branch if Carry Set

loc_45C:				; CODE XREF: CheckKeys_420_+39j
		ldi	r30, 1		; Load Immediate
		sts	byte_200160, r30 ; Store Direct	to SRAM

loc_45F:				; CODE XREF: CheckKeys_420_+3Bj
		set			; Set T	in SREG
		bld	r4, 7		; Bit load from	T to Register
		ldi	r30, 0xA	; Load Immediate
		sts	unk_20016A, r30	; Store	Direct to SRAM
		clt			; Clear	T in SREG
		bld	r4, 5		; Bit load from	T to Register
		rjmp	loc_480		; Relative Jump
; ---------------------------------------------------------------------------

loc_467:				; CODE XREF: CheckKeys_420_+33j
		call	Save_SPEED	; power	off - save
		call	sub_892		; Call Subroutine
		clt			; Clear	T in SREG
		bld	r5, 6		; Bit load from	T to Register
		bld	r4, 5		; Bit load from	T to Register
		ldi	r30, 0x90 ; '' ; Load Immediate
		ldi	r31, 1		; = 400
		ldi	r22, 0		; Load Immediate
		ldi	r23, 0		; Load Immediate
		sts	unk_20017F, r30	; Store	Direct to SRAM
		sts	unk_200180, r31	; Store	Direct to SRAM
		sts	unk_200181, r22	; Store	Direct to SRAM
		sts	unk_200182, r23	; Store	Direct to SRAM
		ldi	r30, 0x14	; Load Immediate
		st	-Y, r30		; Store	Indirect
		rcall	sub_3C4		; Relative Call	Subroutine
		ldi	r30, 2		; Load Immediate
		sts	unk_200162, r30	; Store	Direct to SRAM

loc_480:				; CODE XREF: CheckKeys_420_:loc_43Ej
					; CheckKeys_420_+46j
		ldi	r26, 0		; Load Immediate
		sbic	PINB, PINB5	; Port B Input Pins Address
		ldi	r26, 1		; Load Immediate
		cpi	r26, 0		; Compare with Immediate
		brne	loc_489		; Branch if Not	Equal
		sbrs	r4, 5		; Skip if Bit in Register Set
		rjmp	loc_489		; Relative Jump
		sbrc	r4, 7		; Skip if Bit in Register Cleared
		rjmp	loc_48A		; Relative Jump

loc_489:				; CODE XREF: CheckKeys_420_+64j
					; CheckKeys_420_+66j
		rjmp	loc_4C0		; Relative Jump
; ---------------------------------------------------------------------------

loc_48A:				; CODE XREF: CheckKeys_420_+68j
		sbrc	r5, 1		; Skip if Bit in Register Cleared
		rjmp	loc_4A6		; Relative Jump
		call	Light_ON	; Call Subroutine
		lds	r26, byte_200160 ; Load	Direct
		cpi	r26, 7		; Compare with Immediate
		brcc	increase_speed	; was call Save_SPEED
		lds	r30, byte_200160 ; Load	Direct
		subi	r30, -1		; Subtract Immediate
		sts	byte_200160, r30 ; Store Direct	to SRAM

increase_speed:				; CODE XREF: CheckKeys_420_+71j
		nop			; was call Save_SPEED
		nop			; No Operation
		lds	r26, byte_200160 ; Load	Direct
		cpi	r26, 7		; Compare with Immediate
		brne	loc_49F		; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r3, 3		; Bit load from	T to Register

loc_49F:				; CODE XREF: CheckKeys_420_+7Cj
		clt			; Clear	T in SREG
		bld	r4, 6		; Bit load from	T to Register
		bld	r4, 5		; Bit load from	T to Register
		ldi	r30, 1		; Load Immediate
		sts	unk_200165, r30	; Store	Direct to SRAM
		rjmp	loc_4C0		; Relative Jump
; ---------------------------------------------------------------------------

loc_4A6:				; CODE XREF: CheckKeys_420_+6Bj
		call	sub_8C0		; Call Subroutine
		cpi	r26, 0x20 ; ' ' ; Compare with Immediate
		ldi	r30, 0xFD ; 'ý' ; Load Immediate
		cpc	r27, r30	; Compare with Carry
		ldi	r30, 0		; Load Immediate
		cpc	r24, r30	; Compare with Carry
		ldi	r30, 0		; Load Immediate
		cpc	r25, r30	; Compare with Carry
		brcc	loc_4B8		; Branch if Carry Cleared
		call	sub_8CC		; Call Subroutine
		subi	r30, -0x10 ; 'ð' ; Subtract Immediate
		sbci	r31, -0xF ; 'ñ' ; Subtract Immediate with Carry
		sbci	r22, -1		; Subtract Immediate with Carry
		sbci	r23, -1		; Subtract Immediate with Carry
		call	sub_8D5		; Call Subroutine

loc_4B8:				; CODE XREF: CheckKeys_420_+8Fj
		call	sub_8DE		; Call Subroutine
		call	sub_87C		; Call Subroutine
		call	sub_8E4		; Call Subroutine
		clt			; Clear	T in SREG
		bld	r4, 5		; Bit load from	T to Register

loc_4C0:				; CODE XREF: CheckKeys_420_:loc_489j
					; CheckKeys_420_+85j
		ldi	r26, 0		; Load Immediate
		sbic	PINB, PINB0	; Port B Input Pins Address
		ldi	r26, 1		; Load Immediate
		cpi	r26, 0		; Compare with Immediate
		brne	loc_4C9		; Branch if Not	Equal
		sbrs	r4, 5		; Skip if Bit in Register Set
		rjmp	loc_4C9		; Relative Jump
		sbrc	r4, 7		; Skip if Bit in Register Cleared
		rjmp	loc_4CA		; Relative Jump

loc_4C9:				; CODE XREF: CheckKeys_420_+A4j
					; CheckKeys_420_+A6j
		rjmp	loc_4F9		; Relative Jump
; ---------------------------------------------------------------------------

loc_4CA:				; CODE XREF: CheckKeys_420_+A8j
		sbrc	r5, 1		; Skip if Bit in Register Cleared
		rjmp	loc_4DF		; Relative Jump
		call	Light_ON	; Call Subroutine
		lds	r26, byte_200160 ; Load	Direct
		cpi	r26, 2		; Compare with Immediate
		brcs	Decrease_speed_1 ; was call Save_SPEED
		lds	r30, byte_200160 ; Load	Direct
		subi	r30, 1		; Subtract Immediate
		sts	byte_200160, r30 ; Store Direct	to SRAM

Decrease_speed_1:			; CODE XREF: CheckKeys_420_+B1j
		nop			; was call Save_SPEED
		nop			; No Operation
		clt			; Clear	T in SREG
		bld	r4, 5		; Bit load from	T to Register
		ldi	r30, 1		; Load Immediate
		sts	unk_200166, r30	; Store	Direct to SRAM
		rjmp	loc_4F9		; Relative Jump
; ---------------------------------------------------------------------------

loc_4DF:				; CODE XREF: CheckKeys_420_+ABj
		call	sub_8C0		; Call Subroutine
		cpi	r26, 0x11	; Compare with Immediate
		ldi	r30, 0xE	; Load Immediate
		cpc	r27, r30	; Compare with Carry
		ldi	r30, 0		; Load Immediate
		cpc	r24, r30	; Compare with Carry
		ldi	r30, 0		; Load Immediate
		cpc	r25, r30	; Compare with Carry
		brcs	loc_4F1		; Branch if Carry Set
		call	sub_8CC		; Call Subroutine
		subi	r30, 0x10	; Subtract Immediate
		sbci	r31, 0xE	; Subtract Immediate with Carry
		sbci	r22, 0		; Subtract Immediate with Carry
		sbci	r23, 0		; Subtract Immediate with Carry
		call	sub_8D5		; Call Subroutine

loc_4F1:				; CODE XREF: CheckKeys_420_+C8j
		call	sub_87C		; Call Subroutine
		call	sub_8DE		; Call Subroutine
		call	sub_8E4		; Call Subroutine
		clt			; Clear	T in SREG
		bld	r4, 5		; Bit load from	T to Register

loc_4F9:				; CODE XREF: CheckKeys_420_:loc_4C9j
					; CheckKeys_420_+BEj
		ldi	r26, 0		; Load Immediate
		sbic	PINB, PINB1	; Port B Input Pins Address
		ldi	r26, 1		; Load Immediate
		cpi	r26, 0		; Compare with Immediate
		brne	loc_502		; Branch if Not	Equal
		sbrs	r4, 5		; Skip if Bit in Register Set
		rjmp	loc_502		; Relative Jump
		sbrc	r4, 7		; Skip if Bit in Register Cleared
		rjmp	loc_503		; Relative Jump

loc_502:				; CODE XREF: CheckKeys_420_+DDj
					; CheckKeys_420_+DFj
		rjmp	loc_526		; Relative Jump
; ---------------------------------------------------------------------------

loc_503:				; CODE XREF: CheckKeys_420_+E1j
		sbi	PORTB, PORTB4	; Port B Data Register
		ldi	r30, 8		; Load Immediate
		sts	unk_200162, r30	; Store	Direct to SRAM
		ldi	r30, 0x14	; Load Immediate
		sts	unk_200164, r30	; Store	Direct to SRAM
		sbrc	r2, 3		; Skip if Bit in Register Cleared
		rjmp	loc_520		; Relative Jump
		set			; Set T	in SREG
		bld	r2, 3		; Bit load from	T to Register
		call	sub_87C		; Call Subroutine
		call	sub_8A1		; Call Subroutine
		brne	loc_515		; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r3, 4		; Bit load from	T to Register

loc_515:				; CODE XREF: CheckKeys_420_+F2j
		clt			; Clear	T in SREG
		bld	r4, 6		; Bit load from	T to Register
		bld	r4, 5		; Bit load from	T to Register
		set			; Set T	in SREG
		bld	r5, 1		; Bit load from	T to Register
		call	sub_82E		; Call Subroutine
		call	sub_837		; Call Subroutine
		set			; Set T	in SREG
		rjmp	loc_525		; Relative Jump
; ---------------------------------------------------------------------------

loc_520:				; CODE XREF: CheckKeys_420_+EBj
		call	sub_8AC		; Call Subroutine
		clt			; Clear	T in SREG
		bld	r5, 1		; Bit load from	T to Register
		bld	r4, 5		; Bit load from	T to Register

loc_525:				; CODE XREF: CheckKeys_420_+FFj
		bld	r5, 6		; Bit load from	T to Register

loc_526:				; CODE XREF: CheckKeys_420_:loc_502j
		sbis	PINB, PINB5	; Port B Input Pins Address
		rjmp	loc_52C		; Relative Jump
		lds	r26, unk_200165	; Load Direct
		cpi	r26, 5		; Compare with Immediate
		brcs	loc_52D		; Branch if Carry Set

loc_52C:				; CODE XREF: CheckKeys_420_+107j
		rjmp	loc_530		; Relative Jump
; ---------------------------------------------------------------------------

loc_52D:				; CODE XREF: CheckKeys_420_+10Bj
		ldi	r30, 0		; Load Immediate
		sts	unk_200165, r30	; Store	Direct to SRAM

loc_530:				; CODE XREF: CheckKeys_420_:loc_52Cj
		sbis	PINB, PINB0	; Port B Input Pins Address
		rjmp	loc_536		; Relative Jump
		lds	r26, unk_200166	; Load Direct
		cpi	r26, 5		; Compare with Immediate
		brcs	loc_537		; Branch if Carry Set

loc_536:				; CODE XREF: CheckKeys_420_+111j
		rjmp	loc_53A		; Relative Jump
; ---------------------------------------------------------------------------

loc_537:				; CODE XREF: CheckKeys_420_+115j
		ldi	r30, 0		; Load Immediate
		sts	unk_200166, r30	; Store	Direct to SRAM

loc_53A:				; CODE XREF: CheckKeys_420_+15j
					; CheckKeys_420_:loc_536j
		sbis	PINB, PINB5	; Port B Input Pins Address
		rjmp	loc_546		; Relative Jump
		sbis	PINB, PINB0	; Port B Input Pins Address
		rjmp	loc_546		; Relative Jump
		sbis	PINB, PINB2	; Port B Input Pins Address
		rjmp	loc_546		; Relative Jump
		sbis	PINB, PINB1	; Port B Input Pins Address
		rjmp	loc_546		; Relative Jump
		lds	r26, unk_200164	; Load Direct
		cpi	r26, 0		; Compare with Immediate
		breq	loc_547		; Branch if Equal

loc_546:				; CODE XREF: CheckKeys_420_+11Bj
					; CheckKeys_420_+11Dj ...
		rjmp	loc_549		; Relative Jump
; ---------------------------------------------------------------------------

loc_547:				; CODE XREF: CheckKeys_420_+125j
		set			; Set T	in SREG
		bld	r4, 5		; Bit load from	T to Register

loc_549:				; CODE XREF: CheckKeys_420_:loc_546j
		sbis	PINB, PINB2	; Port B Input Pins Address
		rjmp	loc_54F		; Relative Jump
		lds	r26, unk_200167	; Load Direct
		cpi	r26, 5		; Compare with Immediate
		brcs	loc_550		; Branch if Carry Set

loc_54F:				; CODE XREF: CheckKeys_420_+12Aj
		rjmp	locret_553	; Relative Jump
; ---------------------------------------------------------------------------

loc_550:				; CODE XREF: CheckKeys_420_+12Ej
		ldi	r30, 0		; Load Immediate
		sts	unk_200167, r30	; Store	Direct to SRAM

locret_553:				; CODE XREF: CheckKeys_420_:loc_54Fj
		ret			; Subroutine Return
; End of function CheckKeys_420_


; =============== S U B	R O U T	I N E =======================================


sub_554:				; CODE XREF: main_loop_every_2ms+46p
		call	sub_8E8		; Call Subroutine
		lds	r30, unk_20016D	; Load Direct
		cpi	r30, 1		; Compare with Immediate
		brne	loc_55D		; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r2, 4		; Bit load from	T to Register
		rjmp	locret_575	; Relative Jump
; ---------------------------------------------------------------------------

loc_55D:				; CODE XREF: sub_554+5j
		cpi	r30, 2		; Compare with Immediate
		brne	loc_562		; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r2, 5		; Bit load from	T to Register
		rjmp	locret_575	; Relative Jump
; ---------------------------------------------------------------------------

loc_562:				; CODE XREF: sub_554+Aj
		cpi	r30, 3		; Compare with Immediate
		brne	loc_567		; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r2, 6		; Bit load from	T to Register
		rjmp	locret_575	; Relative Jump
; ---------------------------------------------------------------------------

loc_567:				; CODE XREF: sub_554+Fj
		cpi	r30, 4		; Compare with Immediate
		brne	loc_56C		; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r2, 7		; Bit load from	T to Register
		rjmp	locret_575	; Relative Jump
; ---------------------------------------------------------------------------

loc_56C:				; CODE XREF: sub_554+14j
		cpi	r30, 5		; Compare with Immediate
		brne	loc_571		; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r3, 0		; Bit load from	T to Register
		rjmp	locret_575	; Relative Jump
; ---------------------------------------------------------------------------

loc_571:				; CODE XREF: sub_554+19j
		cpi	r30, 6		; Compare with Immediate
		brne	locret_575	; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r3, 1		; Bit load from	T to Register

locret_575:				; CODE XREF: sub_554+8j sub_554+Dj ...
		ret			; Subroutine Return
; End of function sub_554


; =============== S U B	R O U T	I N E =======================================


sub_576:				; CODE XREF: main_loop_every_2ms+25p
					; main_loop_every_2ms+31p
		ldi	r30, 0		; Load Immediate
		sbic	PORTA, PORTA7	; Port A Data Register
		ldi	r30, 1		; Load Immediate
		call	sub_829		; Call Subroutine
		brne	loc_57E		; Branch if Not	Equal
		cbi	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_57F		; Relative Jump
; ---------------------------------------------------------------------------

loc_57E:				; CODE XREF: sub_576+5j
		sbi	PORTA, PORTA7	; Port A Data Register

loc_57F:				; CODE XREF: sub_576+7j
		sbrs	r2, 4		; Skip if Bit in Register Set
		rjmp	loc_587		; Relative Jump
		sbis	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_585		; Relative Jump
		cbi	PORTA, PORTA5	; Port A Data Register
		rjmp	loc_586		; Relative Jump
; ---------------------------------------------------------------------------

loc_585:				; CODE XREF: sub_576+Cj
		sbi	PORTA, PORTA5	; Port A Data Register

loc_586:				; CODE XREF: sub_576+Ej
		rjmp	loc_58C		; Relative Jump
; ---------------------------------------------------------------------------

loc_587:				; CODE XREF: sub_576+Aj
		sbic	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_58B		; Relative Jump
		cbi	PORTA, PORTA5	; Port A Data Register
		rjmp	loc_58C		; Relative Jump
; ---------------------------------------------------------------------------

loc_58B:				; CODE XREF: sub_576+12j
		sbi	PORTA, PORTA5	; Port A Data Register

loc_58C:				; CODE XREF: sub_576:loc_586j
					; sub_576+14j
		sbrs	r2, 5		; Skip if Bit in Register Set
		rjmp	loc_594		; Relative Jump
		sbis	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_592		; Relative Jump
		cbi	PORTA, PORTA4	; Port A Data Register
		rjmp	loc_593		; Relative Jump
; ---------------------------------------------------------------------------

loc_592:				; CODE XREF: sub_576+19j
		sbi	PORTA, PORTA4	; Port A Data Register

loc_593:				; CODE XREF: sub_576+1Bj
		rjmp	loc_599		; Relative Jump
; ---------------------------------------------------------------------------

loc_594:				; CODE XREF: sub_576+17j
		sbic	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_598		; Relative Jump
		cbi	PORTA, PORTA4	; Port A Data Register
		rjmp	loc_599		; Relative Jump
; ---------------------------------------------------------------------------

loc_598:				; CODE XREF: sub_576+1Fj
		sbi	PORTA, PORTA4	; Port A Data Register

loc_599:				; CODE XREF: sub_576:loc_593j
					; sub_576+21j
		sbrs	r2, 6		; Skip if Bit in Register Set
		rjmp	loc_5A1		; Relative Jump
		sbis	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_59F		; Relative Jump
		cbi	PORTA, PORTA2	; Port A Data Register
		rjmp	loc_5A0		; Relative Jump
; ---------------------------------------------------------------------------

loc_59F:				; CODE XREF: sub_576+26j
		sbi	PORTA, PORTA2	; Port A Data Register

loc_5A0:				; CODE XREF: sub_576+28j
		rjmp	loc_5A6		; Relative Jump
; ---------------------------------------------------------------------------

loc_5A1:				; CODE XREF: sub_576+24j
		sbic	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_5A5		; Relative Jump
		cbi	PORTA, PORTA2	; Port A Data Register
		rjmp	loc_5A6		; Relative Jump
; ---------------------------------------------------------------------------

loc_5A5:				; CODE XREF: sub_576+2Cj
		sbi	PORTA, PORTA2	; Port A Data Register

loc_5A6:				; CODE XREF: sub_576:loc_5A0j
					; sub_576+2Ej
		sbrs	r2, 7		; Skip if Bit in Register Set
		rjmp	loc_5AE		; Relative Jump
		sbis	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_5AC		; Relative Jump
		cbi	PORTA, PORTA1	; Port A Data Register
		rjmp	loc_5AD		; Relative Jump
; ---------------------------------------------------------------------------

loc_5AC:				; CODE XREF: sub_576+33j
		sbi	PORTA, PORTA1	; Port A Data Register

loc_5AD:				; CODE XREF: sub_576+35j
		rjmp	loc_5B3		; Relative Jump
; ---------------------------------------------------------------------------

loc_5AE:				; CODE XREF: sub_576+31j
		sbic	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_5B2		; Relative Jump
		cbi	PORTA, PORTA1	; Port A Data Register
		rjmp	loc_5B3		; Relative Jump
; ---------------------------------------------------------------------------

loc_5B2:				; CODE XREF: sub_576+39j
		sbi	PORTA, PORTA1	; Port A Data Register

loc_5B3:				; CODE XREF: sub_576:loc_5ADj
					; sub_576+3Bj
		sbrs	r3, 0		; Skip if Bit in Register Set
		rjmp	loc_5BB		; Relative Jump
		sbis	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_5B9		; Relative Jump
		cbi	PORTA, PORTA0	; Port A Data Register
		rjmp	loc_5BA		; Relative Jump
; ---------------------------------------------------------------------------

loc_5B9:				; CODE XREF: sub_576+40j
		sbi	PORTA, PORTA0	; Port A Data Register

loc_5BA:				; CODE XREF: sub_576+42j
		rjmp	loc_5C0		; Relative Jump
; ---------------------------------------------------------------------------

loc_5BB:				; CODE XREF: sub_576+3Ej
		sbic	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_5BF		; Relative Jump
		cbi	PORTA, PORTA0	; Port A Data Register
		rjmp	loc_5C0		; Relative Jump
; ---------------------------------------------------------------------------

loc_5BF:				; CODE XREF: sub_576+46j
		sbi	PORTA, PORTA0	; Port A Data Register

loc_5C0:				; CODE XREF: sub_576:loc_5BAj
					; sub_576+48j
		sbrs	r3, 1		; Skip if Bit in Register Set
		rjmp	loc_5C8		; Relative Jump
		sbis	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_5C6		; Relative Jump
		cbi	PORTB, PORTB3	; Port B Data Register
		rjmp	loc_5C7		; Relative Jump
; ---------------------------------------------------------------------------

loc_5C6:				; CODE XREF: sub_576+4Dj
		sbi	PORTB, PORTB3	; Port B Data Register

loc_5C7:				; CODE XREF: sub_576+4Fj
		rjmp	loc_5CD		; Relative Jump
; ---------------------------------------------------------------------------

loc_5C8:				; CODE XREF: sub_576+4Bj
		sbic	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_5CC		; Relative Jump
		cbi	PORTB, PORTB3	; Port B Data Register
		rjmp	loc_5CD		; Relative Jump
; ---------------------------------------------------------------------------

loc_5CC:				; CODE XREF: sub_576+53j
		sbi	PORTB, PORTB3	; Port B Data Register

loc_5CD:				; CODE XREF: sub_576:loc_5C7j
					; sub_576+55j
		sbrs	r3, 2		; Skip if Bit in Register Set
		rjmp	loc_5D5		; Relative Jump
		sbis	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_5D3		; Relative Jump
		cbi	PORTA, PORTA3	; Port A Data Register
		rjmp	loc_5D4		; Relative Jump
; ---------------------------------------------------------------------------

loc_5D3:				; CODE XREF: sub_576+5Aj
		sbi	PORTA, PORTA3	; Port A Data Register

loc_5D4:				; CODE XREF: sub_576+5Cj
		rjmp	loc_5DA		; Relative Jump
; ---------------------------------------------------------------------------

loc_5D5:				; CODE XREF: sub_576+58j
		sbic	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_5D9		; Relative Jump
		cbi	PORTA, PORTA3	; Port A Data Register
		rjmp	loc_5DA		; Relative Jump
; ---------------------------------------------------------------------------

loc_5D9:				; CODE XREF: sub_576+60j
		sbi	PORTA, PORTA3	; Port A Data Register

loc_5DA:				; CODE XREF: sub_576:loc_5D4j
					; sub_576+62j
		sbrs	r3, 3		; Skip if Bit in Register Set
		rjmp	loc_5E2		; Relative Jump
		sbis	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_5E0		; Relative Jump
		cbi	PORTD, PORTD5	; Port D Data Register
		rjmp	loc_5E1		; Relative Jump
; ---------------------------------------------------------------------------

loc_5E0:				; CODE XREF: sub_576+67j
		sbi	PORTD, PORTD5	; Port D Data Register

loc_5E1:				; CODE XREF: sub_576+69j
		rjmp	loc_5E7		; Relative Jump
; ---------------------------------------------------------------------------

loc_5E2:				; CODE XREF: sub_576+65j
		sbic	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_5E6		; Relative Jump
		cbi	PORTD, PORTD5	; Port D Data Register
		rjmp	loc_5E7		; Relative Jump
; ---------------------------------------------------------------------------

loc_5E6:				; CODE XREF: sub_576+6Dj
		sbi	PORTD, PORTD5	; Port D Data Register

loc_5E7:				; CODE XREF: sub_576:loc_5E1j
					; sub_576+6Fj
		sbrs	r3, 4		; Skip if Bit in Register Set
		rjmp	loc_5EF		; Relative Jump
		sbis	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_5ED		; Relative Jump
		cbi	PORTA, PORTA6	; Port A Data Register
		rjmp	loc_5EE		; Relative Jump
; ---------------------------------------------------------------------------

loc_5ED:				; CODE XREF: sub_576+74j
		sbi	PORTA, PORTA6	; Port A Data Register

loc_5EE:				; CODE XREF: sub_576+76j
		rjmp	loc_5F4		; Relative Jump
; ---------------------------------------------------------------------------

loc_5EF:				; CODE XREF: sub_576+72j
		sbic	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_5F3		; Relative Jump
		cbi	PORTA, PORTA6	; Port A Data Register
		rjmp	loc_5F4		; Relative Jump
; ---------------------------------------------------------------------------

loc_5F3:				; CODE XREF: sub_576+7Aj
		sbi	PORTA, PORTA6	; Port A Data Register

loc_5F4:				; CODE XREF: sub_576:loc_5EEj
					; sub_576+7Cj
		sbrs	r3, 5		; Skip if Bit in Register Set
		rjmp	loc_5FC		; Relative Jump
		sbis	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_5FA		; Relative Jump
		cbi	PORTC, PORTC7	; Port C Data Register
		rjmp	loc_5FB		; Relative Jump
; ---------------------------------------------------------------------------

loc_5FA:				; CODE XREF: sub_576+81j
		sbi	PORTC, PORTC7	; Port C Data Register

loc_5FB:				; CODE XREF: sub_576+83j
		rjmp	loc_601		; Relative Jump
; ---------------------------------------------------------------------------

loc_5FC:				; CODE XREF: sub_576+7Fj
		sbic	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_600		; Relative Jump
		cbi	PORTC, PORTC7	; Port C Data Register
		rjmp	loc_601		; Relative Jump
; ---------------------------------------------------------------------------

loc_600:				; CODE XREF: sub_576+87j
		sbi	PORTC, PORTC7	; Port C Data Register

loc_601:				; CODE XREF: sub_576:loc_5FBj
					; sub_576+89j
		sbrs	r3, 6		; Skip if Bit in Register Set
		rjmp	loc_609		; Relative Jump
		sbis	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_607		; Relative Jump
		cbi	PORTD, PORTD6	; Port D Data Register
		rjmp	loc_608		; Relative Jump
; ---------------------------------------------------------------------------

loc_607:				; CODE XREF: sub_576+8Ej
		sbi	PORTD, PORTD6	; Port D Data Register

loc_608:				; CODE XREF: sub_576+90j
		rjmp	loc_60E		; Relative Jump
; ---------------------------------------------------------------------------

loc_609:				; CODE XREF: sub_576+8Cj
		sbic	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_60D		; Relative Jump
		cbi	PORTD, PORTD6	; Port D Data Register
		rjmp	loc_60E		; Relative Jump
; ---------------------------------------------------------------------------

loc_60D:				; CODE XREF: sub_576+94j
		sbi	PORTD, PORTD6	; Port D Data Register

loc_60E:				; CODE XREF: sub_576:loc_608j
					; sub_576+96j
		sbrs	r3, 7		; Skip if Bit in Register Set
		rjmp	loc_616		; Relative Jump
		sbis	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_614		; Relative Jump
		cbi	PORTD, PORTD7	; Port D Data Register
		rjmp	loc_615		; Relative Jump
; ---------------------------------------------------------------------------

loc_614:				; CODE XREF: sub_576+9Bj
		sbi	PORTD, PORTD7	; Port D Data Register

loc_615:				; CODE XREF: sub_576+9Dj
		rjmp	loc_61B		; Relative Jump
; ---------------------------------------------------------------------------

loc_616:				; CODE XREF: sub_576+99j
		sbic	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_61A		; Relative Jump
		cbi	PORTD, PORTD7	; Port D Data Register
		rjmp	loc_61B		; Relative Jump
; ---------------------------------------------------------------------------

loc_61A:				; CODE XREF: sub_576+A1j
		sbi	PORTD, PORTD7	; Port D Data Register

loc_61B:				; CODE XREF: sub_576:loc_615j
					; sub_576+A3j
		sbrs	r4, 0		; Skip if Bit in Register Set
		rjmp	loc_623		; Relative Jump
		sbis	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_621		; Relative Jump
		cbi	PORTC, PORTC2	; Port C Data Register
		rjmp	loc_622		; Relative Jump
; ---------------------------------------------------------------------------

loc_621:				; CODE XREF: sub_576+A8j
		sbi	PORTC, PORTC2	; Port C Data Register

loc_622:				; CODE XREF: sub_576+AAj
		rjmp	loc_628		; Relative Jump
; ---------------------------------------------------------------------------

loc_623:				; CODE XREF: sub_576+A6j
		sbic	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_627		; Relative Jump
		cbi	PORTC, PORTC2	; Port C Data Register
		rjmp	loc_628		; Relative Jump
; ---------------------------------------------------------------------------

loc_627:				; CODE XREF: sub_576+AEj
		sbi	PORTC, PORTC2	; Port C Data Register

loc_628:				; CODE XREF: sub_576:loc_622j
					; sub_576+B0j
		sbrs	r4, 1		; Skip if Bit in Register Set
		rjmp	loc_630		; Relative Jump
		sbis	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_62E		; Relative Jump
		cbi	PORTC, PORTC3	; Port C Data Register
		rjmp	loc_62F		; Relative Jump
; ---------------------------------------------------------------------------

loc_62E:				; CODE XREF: sub_576+B5j
		sbi	PORTC, PORTC3	; Port C Data Register

loc_62F:				; CODE XREF: sub_576+B7j
		rjmp	loc_635		; Relative Jump
; ---------------------------------------------------------------------------

loc_630:				; CODE XREF: sub_576+B3j
		sbic	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_634		; Relative Jump
		cbi	PORTC, PORTC3	; Port C Data Register
		rjmp	loc_635		; Relative Jump
; ---------------------------------------------------------------------------

loc_634:				; CODE XREF: sub_576+BBj
		sbi	PORTC, PORTC3	; Port C Data Register

loc_635:				; CODE XREF: sub_576:loc_62Fj
					; sub_576+BDj
		sbrs	r4, 2		; Skip if Bit in Register Set
		rjmp	loc_63D		; Relative Jump
		sbis	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_63B		; Relative Jump
		cbi	PORTC, PORTC4	; Port C Data Register
		rjmp	loc_63C		; Relative Jump
; ---------------------------------------------------------------------------

loc_63B:				; CODE XREF: sub_576+C2j
		sbi	PORTC, PORTC4	; Port C Data Register

loc_63C:				; CODE XREF: sub_576+C4j
		rjmp	loc_642		; Relative Jump
; ---------------------------------------------------------------------------

loc_63D:				; CODE XREF: sub_576+C0j
		sbic	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_641		; Relative Jump
		cbi	PORTC, PORTC4	; Port C Data Register
		rjmp	loc_642		; Relative Jump
; ---------------------------------------------------------------------------

loc_641:				; CODE XREF: sub_576+C8j
		sbi	PORTC, PORTC4	; Port C Data Register

loc_642:				; CODE XREF: sub_576:loc_63Cj
					; sub_576+CAj
		sbrs	r4, 3		; Skip if Bit in Register Set
		rjmp	loc_64A		; Relative Jump
		sbis	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_648		; Relative Jump
		cbi	PORTC, PORTC6	; Port C Data Register
		rjmp	loc_649		; Relative Jump
; ---------------------------------------------------------------------------

loc_648:				; CODE XREF: sub_576+CFj
		sbi	PORTC, PORTC6	; Port C Data Register

loc_649:				; CODE XREF: sub_576+D1j
		rjmp	loc_64F		; Relative Jump
; ---------------------------------------------------------------------------

loc_64A:				; CODE XREF: sub_576+CDj
		sbic	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_64E		; Relative Jump
		cbi	PORTC, PORTC6	; Port C Data Register
		rjmp	loc_64F		; Relative Jump
; ---------------------------------------------------------------------------

loc_64E:				; CODE XREF: sub_576+D5j
		sbi	PORTC, PORTC6	; Port C Data Register

loc_64F:				; CODE XREF: sub_576:loc_649j
					; sub_576+D7j
		sbrs	r4, 4		; Skip if Bit in Register Set
		rjmp	loc_657		; Relative Jump
		sbis	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_655		; Relative Jump
		cbi	PORTC, PORTC5	; Port C Data Register
		rjmp	loc_656		; Relative Jump
; ---------------------------------------------------------------------------

loc_655:				; CODE XREF: sub_576+DCj
		sbi	PORTC, PORTC5	; Port C Data Register

loc_656:				; CODE XREF: sub_576+DEj
		rjmp	locret_65C	; Relative Jump
; ---------------------------------------------------------------------------

loc_657:				; CODE XREF: sub_576+DAj
		sbic	PORTA, PORTA7	; Port A Data Register
		rjmp	loc_65B		; Relative Jump
		cbi	PORTC, PORTC5	; Port C Data Register
		rjmp	locret_65C	; Relative Jump
; ---------------------------------------------------------------------------

loc_65B:				; CODE XREF: sub_576+E2j
		sbi	PORTC, PORTC5	; Port C Data Register

locret_65C:				; CODE XREF: sub_576:loc_656j
					; sub_576+E4j
		ret			; Subroutine Return
; End of function sub_576


; =============== S U B	R O U T	I N E =======================================


sub_65D:				; CODE XREF: main_loop_every_2ms+32p
					; sub_734:loc_785p ...
		st	-Y, r17		; Store	Indirect
		lds	r26, byte_200160 ; Load	Direct
		cpi	r26, 7		; Compare with Immediate
		breq	loc_666		; Branch if Equal
		call	sub_8E8		; Call Subroutine
		clt			; Clear	T in SREG
		bld	r3, 3		; Bit load from	T to Register

loc_666:				; CODE XREF: sub_65D+4j
		lds	r30, byte_200160 ; Load	Direct
		cpi	r30, 0		; Compare with Immediate
		brne	loc_66D		; Branch if Not	Equal
		clt			; Clear	T in SREG
		bld	r2, 4		; Bit load from	T to Register
		rjmp	loc_696		; Relative Jump
; ---------------------------------------------------------------------------

loc_66D:				; CODE XREF: sub_65D+Cj
		cpi	r30, 1		; Compare with Immediate
		brne	loc_672		; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r2, 4		; Bit load from	T to Register
		rjmp	loc_696		; Relative Jump
; ---------------------------------------------------------------------------

loc_672:				; CODE XREF: sub_65D+11j
		cpi	r30, 2		; Compare with Immediate
		brne	loc_677		; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r2, 5		; Bit load from	T to Register
		rjmp	loc_696		; Relative Jump
; ---------------------------------------------------------------------------

loc_677:				; CODE XREF: sub_65D+16j
		cpi	r30, 3		; Compare with Immediate
		brne	loc_67C		; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r2, 6		; Bit load from	T to Register
		rjmp	loc_696		; Relative Jump
; ---------------------------------------------------------------------------

loc_67C:				; CODE XREF: sub_65D+1Bj
		cpi	r30, 4		; Compare with Immediate
		brne	loc_681		; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r2, 7		; Bit load from	T to Register
		rjmp	loc_696		; Relative Jump
; ---------------------------------------------------------------------------

loc_681:				; CODE XREF: sub_65D+20j
		cpi	r30, 5		; Compare with Immediate
		brne	loc_686		; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r3, 0		; Bit load from	T to Register
		rjmp	loc_696		; Relative Jump
; ---------------------------------------------------------------------------

loc_686:				; CODE XREF: sub_65D+25j
		cpi	r30, 6		; Compare with Immediate
		brne	loc_68B		; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r3, 1		; Bit load from	T to Register
		rjmp	loc_696		; Relative Jump
; ---------------------------------------------------------------------------

loc_68B:				; CODE XREF: sub_65D+2Aj
		cpi	r30, 7		; Compare with Immediate
		brne	loc_696		; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r2, 4		; Bit load from	T to Register
		bld	r2, 5		; Bit load from	T to Register
		bld	r2, 6		; Bit load from	T to Register
		bld	r2, 7		; Bit load from	T to Register
		bld	r3, 0		; Bit load from	T to Register
		bld	r3, 1		; Bit load from	T to Register
		bst	r4, 6		; Bit Store from Register to T
		bld	r3, 3		; Bit load from	T to Register

loc_696:				; CODE XREF: sub_65D+Fj sub_65D+14j ...
		sbrs	r3, 1		; Skip if Bit in Register Set
		rjmp	loc_69A		; Relative Jump
		set			; Set T	in SREG
		bld	r3, 0		; Bit load from	T to Register

loc_69A:				; CODE XREF: sub_65D+3Aj
		sbrs	r3, 0		; Skip if Bit in Register Set
		rjmp	loc_69E		; Relative Jump
		set			; Set T	in SREG
		bld	r2, 7		; Bit load from	T to Register

loc_69E:				; CODE XREF: sub_65D+3Ej
		sbrs	r2, 7		; Skip if Bit in Register Set
		rjmp	loc_6A2		; Relative Jump
		set			; Set T	in SREG
		bld	r2, 6		; Bit load from	T to Register

loc_6A2:				; CODE XREF: sub_65D+42j
		sbrs	r2, 6		; Skip if Bit in Register Set
		rjmp	loc_6A6		; Relative Jump
		set			; Set T	in SREG
		bld	r2, 5		; Bit load from	T to Register

loc_6A6:				; CODE XREF: sub_65D+46j
		sbrs	r2, 5		; Skip if Bit in Register Set
		rjmp	loc_6AA		; Relative Jump
		set			; Set T	in SREG
		bld	r2, 4		; Bit load from	T to Register

loc_6AA:				; CODE XREF: sub_65D+4Aj
		lds	r26, byte_200160 ; Load	Direct
		cpi	r26, 3		; Compare with Immediate
		breq	loc_6B0		; Branch if Equal
		cpi	r26, 7		; Compare with Immediate
		brne	loc_6B2		; Branch if Not	Equal

loc_6B0:				; CODE XREF: sub_65D+50j
		set			; Set T	in SREG
		rjmp	loc_6B3		; Relative Jump
; ---------------------------------------------------------------------------

loc_6B2:				; CODE XREF: sub_65D+52j
		clt			; Clear	T in SREG

loc_6B3:				; CODE XREF: sub_65D+54j
		bld	r3, 2		; Bit load from	T to Register
		clt			; Clear	T in SREG
		bld	r3, 6		; Bit load from	T to Register
		bld	r3, 7		; Bit load from	T to Register
		bld	r4, 0		; Bit load from	T to Register
		bld	r4, 1		; Bit load from	T to Register
		bld	r4, 2		; Bit load from	T to Register
		bld	r4, 3		; Bit load from	T to Register
		bld	r4, 4		; Bit load from	T to Register
		bld	r3, 5		; Bit load from	T to Register
		lds	r17, byte_200161 ; Load	Direct
		ldi	r26, 0		; Load Immediate
		sbrc	r2, 3		; Skip if Bit in Register Cleared
		ldi	r26, 1		; Load Immediate
		cpi	r26, 0		; Compare with Immediate
		brne	loc_6C8		; Branch if Not	Equal
		lds	r26, unk_200165	; Load Direct
		cpi	r26, 5		; Compare with Immediate
		brcs	loc_6C9		; Branch if Carry Set

loc_6C8:				; CODE XREF: sub_65D+66j
		rjmp	loc_6CA		; Relative Jump
; ---------------------------------------------------------------------------

loc_6C9:				; CODE XREF: sub_65D+6Aj
		ldi	r17, 0x14	; Load Immediate

loc_6CA:				; CODE XREF: sub_65D:loc_6C8j
		sbrs	r5, 2		; Skip if Bit in Register Set
		rjmp	loc_6D0		; Relative Jump
		sbrs	r4, 7		; Skip if Bit in Register Set
		rjmp	loc_6D0		; Relative Jump
		sbrc	r4, 6		; Skip if Bit in Register Cleared
		rjmp	loc_6D1		; Relative Jump

loc_6D0:				; CODE XREF: sub_65D+6Ej sub_65D+70j
		rjmp	loc_6D2		; Relative Jump
; ---------------------------------------------------------------------------

loc_6D1:				; CODE XREF: sub_65D+72j
		ldi	r17, 0x15	; Load Immediate

loc_6D2:				; CODE XREF: sub_65D:loc_6D0j
		lds	r26, byte_200161 ; Load	Direct
		cpi	r26, 0xA	; Compare with Immediate
		brcs	loc_6D8		; Branch if Carry Set
		cpi	r26, 0x14	; Compare with Immediate
		brcs	loc_6D9		; Branch if Carry Set

loc_6D8:				; CODE XREF: sub_65D+78j
		rjmp	loc_6DF		; Relative Jump
; ---------------------------------------------------------------------------

loc_6D9:				; CODE XREF: sub_65D+7Aj
		set			; Set T	in SREG
		bld	r3, 5		; Bit load from	T to Register
		lds	r30, byte_200161 ; Load	Direct
		subi	r30, 0xA	; Subtract Immediate
		mov	r17, r30	; Copy Register

loc_6DF:				; CODE XREF: sub_65D:loc_6D8j
		mov	r30, r17	; Copy Register
		cpi	r30, 1		; Compare with Immediate
		brne	loc_6E5		; Branch if Not	Equal
		call	sub_8F0		; Call Subroutine
		rjmp	loc_732		; Relative Jump
; ---------------------------------------------------------------------------

loc_6E5:				; CODE XREF: sub_65D+84j
		cpi	r30, 2		; Compare with Immediate
		brne	loc_6EE		; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r3, 6		; Bit load from	T to Register
		bld	r3, 7		; Bit load from	T to Register
		bld	r4, 4		; Bit load from	T to Register
		call	sub_8F4		; Call Subroutine
		rjmp	loc_732		; Relative Jump
; ---------------------------------------------------------------------------

loc_6EE:				; CODE XREF: sub_65D+89j
		cpi	r30, 3		; Compare with Immediate
		brne	loc_6F6		; Branch if Not	Equal
		call	sub_8F8		; Call Subroutine
		set			; Set T	in SREG
		bld	r4, 4		; Bit load from	T to Register
		bld	r4, 1		; Bit load from	T to Register
		rjmp	loc_732		; Relative Jump
; ---------------------------------------------------------------------------

loc_6F6:				; CODE XREF: sub_65D+92j
		cpi	r30, 4		; Compare with Immediate
		brne	loc_6FD		; Branch if Not	Equal
		call	sub_8F0		; Call Subroutine
		call	sub_8FB		; Call Subroutine
		rjmp	loc_732		; Relative Jump
; ---------------------------------------------------------------------------

loc_6FD:				; CODE XREF: sub_65D+9Aj
		cpi	r30, 5		; Compare with Immediate
		brne	loc_706		; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r3, 6		; Bit load from	T to Register
		bld	r4, 0		; Bit load from	T to Register
		bld	r4, 1		; Bit load from	T to Register
		call	sub_8FB		; Call Subroutine
		rjmp	loc_732		; Relative Jump
; ---------------------------------------------------------------------------

loc_706:				; CODE XREF: sub_65D+A1j
		cpi	r30, 6		; Compare with Immediate
		brne	loc_710		; Branch if Not	Equal
		set			; Set T	in SREG
		bld	r3, 6		; Bit load from	T to Register
		bld	r4, 0		; Bit load from	T to Register
		call	sub_8F4		; Call Subroutine
		call	sub_8FB		; Call Subroutine
		rjmp	loc_732		; Relative Jump
; ---------------------------------------------------------------------------

loc_710:				; CODE XREF: sub_65D+AAj
		cpi	r30, 7		; Compare with Immediate
		brne	loc_715		; Branch if Not	Equal
		call	sub_8F8		; Call Subroutine
		rjmp	loc_732		; Relative Jump
; ---------------------------------------------------------------------------

loc_715:				; CODE XREF: sub_65D+B4j
		cpi	r30, 8		; Compare with Immediate
		brne	loc_71E		; Branch if Not	Equal
		call	sub_8F8		; Call Subroutine
		call	sub_8F4		; Call Subroutine
		call	sub_8FB		; Call Subroutine
		rjmp	loc_732		; Relative Jump
; ---------------------------------------------------------------------------

loc_71E:				; CODE XREF: sub_65D+B9j
		cpi	r30, 9		; Compare with Immediate
		brne	loc_727		; Branch if Not	Equal
		call	sub_8F8		; Call Subroutine
		set			; Set T	in SREG
		bld	r4, 1		; Bit load from	T to Register
		call	sub_8FB		; Call Subroutine
		rjmp	loc_732		; Relative Jump
; ---------------------------------------------------------------------------

loc_727:				; CODE XREF: sub_65D+C2j
		cpi	r30, 0		; Compare with Immediate
		brne	loc_72C		; Branch if Not	Equal
		call	sub_8F8		; Call Subroutine
		rjmp	loc_72E		; Relative Jump
; ---------------------------------------------------------------------------

loc_72C:				; CODE XREF: sub_65D+CBj
		cpi	r30, 0x15	; Compare with Immediate
		brne	loc_732		; Branch if Not	Equal

loc_72E:				; CODE XREF: sub_65D+CEj
		set			; Set T	in SREG
		bld	r4, 1		; Bit load from	T to Register
		bld	r4, 2		; Bit load from	T to Register
		bld	r4, 3		; Bit load from	T to Register

loc_732:				; CODE XREF: sub_344:loc_3C3j
					; sub_65D+87j ...
		ld	r17, Y+		; Load Indirect
		ret			; Subroutine Return
; End of function sub_65D


; =============== S U B	R O U T	I N E =======================================


sub_734:				; CODE XREF: main_loop_every_2ms:loc_21Ep
		sbiw	r28, 4		; Subtract Immediate from Word
		ldi	r30, 1		; Load Immediate
		st	Y, r30		; Store	Indirect
		ldi	r30, 0		; Load Immediate
		std	Y+1, r30	; Store	Indirect with Displacement
		std	Y+2, r30	; Store	Indirect with Displacement
		std	Y+3, r30	; Store	Indirect with Displacement
		st	-Y, r17		; Store	Indirect
		ldi	r17, 1		; Load Immediate

loc_73D:				; CODE XREF: sub_734+1Bj
		lds	r30, unk_200168	; Load Direct
		subi	r30, 1		; Subtract Immediate
		cp	r17, r30	; Compare
		brcc	loc_750		; Branch if Carry Cleared
		call	sub_8FF		; Call Subroutine
		ldi	r26, 0xA	; Load Immediate
		ldi	r27, 0		; Load Immediate
		ldi	r24, 0		; Load Immediate
		ldi	r25, 0		; Load Immediate
		call	sub_92F		; Call Subroutine
		std	Y+1, r30	; Store	Indirect with Displacement
		std	Y+2, r31	; Store	Indirect with Displacement
		std	Y+3, r22	; Store	Indirect with Displacement
		std	Y+4, r23	; Store	Indirect with Displacement
		subi	r17, -1		; Subtract Immediate
		rjmp	loc_73D		; Relative Jump
; ---------------------------------------------------------------------------

loc_750:				; CODE XREF: sub_734+Dj
		lds	r26, unk_200168	; Load Direct
		cpi	r26, 7		; Compare with Immediate
		brne	loc_758		; Branch if Not	Equal
		call	sub_847		; Call Subroutine
		call	sub_84C		; Call Subroutine

loc_758:				; CODE XREF: sub_734+1Fj
		lds	r26, unk_200168	; Load Direct
		cpi	r26, 1		; Compare with Immediate
		brcs	loc_761		; Branch if Carry Set
		lds	r30, unk_200168	; Load Direct
		subi	r30, 1		; Subtract Immediate
		sts	unk_200168, r30	; Store	Direct to SRAM

loc_761:				; CODE XREF: sub_734+27j
		call	sub_8FF		; Call Subroutine
		call	sub_904		; Call Subroutine
		call	sub_94F		; Call Subroutine
		sts	byte_200161, r30 ; Store Direct	to SRAM
		call	sub_8FF		; Call Subroutine
		lds	r26, byte_200161 ; Load	Direct
		clr	r27		; Clear	Register
		clr	r24		; Clear	Register
		clr	r25		; Clear	Register
		call	sub_92F		; Call Subroutine
		call	sub_904		; Call Subroutine
		call	sub_912		; Call Subroutine
		sts	unk_200179, r26	; Store	Direct to SRAM
		sts	unk_20017A, r27	; Store	Direct to SRAM
		sts	unk_20017B, r24	; Store	Direct to SRAM
		sts	unk_20017C, r25	; Store	Direct to SRAM
		lds	r30, unk_200168	; Load Direct
		cpi	r30, 0		; Compare with Immediate
		brne	loc_785		; Branch if Not	Equal
		ldi	r30, 0x14	; Load Immediate
		sts	byte_200161, r30 ; Store Direct	to SRAM

loc_785:				; CODE XREF: sub_734+4Dj
		rcall	sub_65D		; Relative Call	Subroutine
		lds	r30, unk_200168	; Load Direct
		cpi	r30, 0		; Compare with Immediate
		brne	loc_78D		; Branch if Not	Equal
		ldi	r30, 0		; Load Immediate
		sts	unk_200165, r30	; Store	Direct to SRAM

loc_78D:				; CODE XREF: sub_734+55j
		ld	r17, Y		; Load Indirect
		adiw	r28, 5		; Add Immediate	to Word
		ret			; Subroutine Return
; End of function sub_734

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR __RESET

START:					; CODE XREF: __RESET+2Ej
		ldi	r30, 0		; Load Immediate
		out	PORTA, r30	; Port A Data Register
		sbi	DDRA, DDA0	; Port A Data Direction	Register
		sbi	DDRA, DDA1	; Port A Data Direction	Register
		sbi	DDRA, DDA2	; Port A Data Direction	Register
		sbi	DDRA, DDA3	; Port A Data Direction	Register
		sbi	DDRA, DDA4	; Port A Data Direction	Register
		sbi	DDRA, DDA5	; Port A Data Direction	Register
		sbi	DDRA, DDA6	; Port A Data Direction	Register
		sbi	DDRA, DDA7	; Port A Data Direction	Register
		out	PORTB, r30	; Port B Data Register
		ldi	r30, 0xC0 ; 'À' ; Load Immediate
		out	DDRB, r30	; Port B Data Direction	Register
		sbi	DDRB, DDB3	; Port B Data Direction	Register
		sbi	DDRB, DDB4	; Port B Data Direction	Register
		sbi	DDRB, DDB6	; Port B Data Direction	Register
		sbi	DDRB, DDB7	; Port B Data Direction	Register
		sbi	PORTB, PORTB0	; Port B Data Register
		sbi	PORTB, PORTB1	; Port B Data Register
		sbi	PORTB, PORTB2	; Port B Data Register
		sbi	PORTB, PORTB5	; Port B Data Register
		ldi	r30, 0		; Load Immediate
		out	PORTC, r30	; Port C Data Register
		sbi	DDRC, DDC2	; Port C Data Direction	Register
		sbi	DDRC, DDC3	; Port C Data Direction	Register
		sbi	DDRC, DDC4	; Port C Data Direction	Register
		sbi	DDRC, DDC5	; Port C Data Direction	Register
		sbi	DDRC, DDC6	; Port C Data Direction	Register
		sbi	DDRC, DDC7	; Port C Data Direction	Register
		out	PORTD, r30	; Port D Data Register
		sbi	DDRD, DDD0	; Port D Data Direction	Register
		sbi	DDRD, DDD1	; Port D Data Direction	Register
		cbi	DDRD, DDD3	; Port D Data Direction	Register
		sbi	DDRD, DDD4	; Port D Data Direction	Register
		sbi	DDRD, DDD5	; Port D Data Direction	Register
		sbi	DDRD, DDD6	; Port D Data Direction	Register
		sbi	DDRD, DDD7	; Port D Data Direction	Register
		sbi	PORTD, PORTD4	; Port D Data Register
		sbi	PORTD, PORTD2	; Port D Data Register
		sbi	PORTD, PORTD1	; Port D Data Register
		sbi	PORTD, PORTD0	; Port D Data Register
		ldi	r31, 0x1F	; Load Immediate
		ser	r30		; Set Register
		lpm			; Load Program Memory
		ldi	r30, 0		; Load Immediate
		out	TIMSK, r30	; Timer/Counter	Interrupt Mask Register
		ldi	r30, 3		; Load Immediate
		out	TCCR0, r30	; Timer/Counter	Control	Register
		ldi	r30, 0		; Load Immediate
		out	TCNT0, r30	; Timer/Counter	Register
		ser	r30		; Set Register
		out	TCNT1H,	r30	; Counter Register High	Byte
		ldi	r30, 0x83 ; 'ƒ' ; Load Immediate
		out	TCNT1L,	r30	; Counter Register Low Byte
		ldi	r30, 2		; Load Immediate
		out	TCCR1B,	r30	; Timer/Counter1 Control Register B
		ldi	r30, 0		; Load Immediate
		out	ASSR, r30	; Asynchronous Status Register
		ldi	r30, 6		; Load Immediate
		out	TCNT2, r30	; Timer/Counter	Register
		ldi	r30, 2		; Load Immediate
		out	TCCR2, r30	; Timer/Counter	Control	Register

loc_7CE:				; CODE XREF: __RESET+78Aj
		in	r30, ASSR	; Asynchronous Status Register
		andi	r30, 7		; Logical AND with Immediate
		brne	loc_7CE		; Branch if Not	Equal
		in	r30, TIMSK	; Timer/Counter	Interrupt Mask Register
		ori	r30, 0x40	; Logical OR with Immediate
		out	TIMSK, r30	; Timer/Counter	Interrupt Mask Register
		ldi	r30, 0		; Load Immediate
		out	ICR1H, r30	; Input	Capture	Register High Byte
		out	ICR1L, r30	; Input	Capture	Register Low Byte
		out	OCR1AH,	r30	; Output Compare Register A High Byte
		out	OCR1AL,	r30	; Output Compare Register A Low	Byte
		out	OCR1BH,	r30	; Output Compare Register B High Byte
		out	OCR1BL,	r30	; Output Compare Register B Low	Byte
		ldi	r30, 0xB	; Load Immediate
		out	MCUCR, r30	; MCU Control Register
		ser	r30		; Set Register
		out	GIFR, r30	; General Interrupt Flag Register
		ldi	r30, 0xC0 ; 'À' ; Load Immediate
		out	GICR, r30	; General Interrupt Control Register
		ldi	r30, 0x80 ; '€' ; Load Immediate
		out	ACSR, r30	; Analog Comparator Control and	Status Register
		ldi	r30, 0		; Load Immediate
		out	SFIOR, r30	; Special Function I/O Register
		set			; Set T	in SREG
		bld	r2, 6		; Bit load from	T to Register
		bld	r3, 2		; Bit load from	T to Register
		call	sub_875		; Call Subroutine
		lds	r26, byte_200160 ; Load	Direct
		cpi	r26, 1		; Compare with Immediate
		brcs	loc_7F0		; Branch if Carry Set
		set			; Set T	in SREG
		bld	r4, 7		; Bit load from	T to Register

loc_7F0:				; CODE XREF: __RESET+7A7j
		ldi	r30, 0xA	; Load Immediate
		sts	unk_20016A, r30	; Store	Direct to SRAM
		sbi	PORTC, PORTC0	; Port C Data Register
		sbi	PORTC, PORTC1	; Port C Data Register
		ldi	r30, 0xC5 ; 'Å' ; TWINT (TWI Interrupt Flag),
					; TWEA (TWI Enable Acknowledge Bit),
					; TWIE,	TWEN
		out	TWCR, r30	; TWI Control Register
		ldi	r30, 0x80 ; '€' ; I2C address = 0x40
		out	TWAR, r30	; TWI (Slave) Address Register
		ldi	r30, 0x32 ; '2' ; Load Immediate
		sts	unk_20016E, r30	; Store	Direct to SRAM
		ldi	r30, 0		; Load Immediate
		sts	unk_20016D, r30	; Store	Direct to SRAM
		call	sub_847		; Call Subroutine
		sts	unk_200179, r30	; Store	Direct to SRAM
		sts	unk_20017A, r31	; Store	Direct to SRAM
		sts	unk_20017B, r22	; Store	Direct to SRAM
		sts	unk_20017C, r23	; Store	Direct to SRAM
		call	sub_85E		; Call Subroutine
		ldi	r26, 1		; Load Immediate
		ldi	r27, 0		; Load Immediate
		call	sub_982		; Call Subroutine
		call	sub_8D5		; Call Subroutine
		ldi	r30, 0xA	; Load Immediate
		sts	unk_200175, r30	; Store	Direct to SRAM
		sei			; Global Interrupt Enable

main_loop:				; CODE XREF: __RESET:main_loop_x1j
		sbrs	r5, 7		; Skip if Bit in Register Set
		rjmp	main_loop_x1	; Relative Jump
		call	main_loop_every_2ms ; Call Subroutine

main_loop_x1:				; CODE XREF: __RESET+7D0j
		rjmp	main_loop	; Relative Jump
; END OF FUNCTION CHUNK	FOR __RESET
; ---------------------------------------------------------------------------

loc_81A:				; CODE XREF: ROM:loc_81Aj
		rjmp	loc_81A		; Relative Jump

; =============== S U B	R O U T	I N E =======================================


sub_81B:				; CODE XREF: INT1_p TIMER0_OVFp ...
		st	-Y, r0		; Store	Indirect
		st	-Y, r1		; Store	Indirect
		st	-Y, r15		; Store	Indirect
		st	-Y, r22		; Store	Indirect
		st	-Y, r23		; Store	Indirect
		st	-Y, r24		; Store	Indirect
		st	-Y, r25		; Store	Indirect
		st	-Y, r26		; Store	Indirect
		st	-Y, r27		; Store	Indirect
		st	-Y, r30		; Store	Indirect
		st	-Y, r31		; Store	Indirect
		in	r30, SREG	; Status Register
		st	-Y, r30		; Store	Indirect
		ret			; Subroutine Return
; End of function sub_81B


; =============== S U B	R O U T	I N E =======================================


sub_829:				; CODE XREF: TIMER2_OVF+7p
					; main_loop_every_2ms+7Ap ...
		ldi	r26, 1		; Load Immediate
		call	sub_97E		; Call Subroutine
		sub	r30, r26	; Subtract without Carry
		ret			; Subroutine Return
; End of function sub_829


; =============== S U B	R O U T	I N E =======================================


sub_82E:				; CODE XREF: main_loop_every_2ms:loc_1F3p
					; sub_26D+14p ...
		lds	r26, unk_200183	; Load Direct
		lds	r27, unk_200184	; Load Direct
		lds	r24, unk_200185	; Load Direct
		lds	r25, unk_200186	; Load Direct
		ret			; Subroutine Return
; End of function sub_82E


; =============== S U B	R O U T	I N E =======================================


sub_837:				; CODE XREF: main_loop_every_2ms+CEp
					; CheckKeys_420_+FCp ...
		ldi	r30, 0x10	; Load Immediate
		ldi	r31, 0xE	; Load Immediate
		ldi	r22, 0		; Load Immediate
		ldi	r23, 0		; Load Immediate
		call	sub_94F		; Call Subroutine
		sts	byte_200161, r30 ; Store Direct	to SRAM
		ret			; Subroutine Return
; End of function sub_837


; =============== S U B	R O U T	I N E =======================================


Save_SPEED:				; CODE XREF: sub_26D+2Cp sub_3C6+17p ...
		lds	r30, byte_200160 ; Load	Direct
		ldi	r26, 0		; Load Immediate
		ldi	r27, 0		; Load Immediate
		call	EEPROM_CHECK_WRITE ; Call Subroutine
		ret			; Subroutine Return
; End of function Save_SPEED


; =============== S U B	R O U T	I N E =======================================


sub_847:				; CODE XREF: sub_26D+87p
					; sub_26D:loc_301p ...
		ldi	r26, 5		; Load Immediate
		ldi	r27, 0		; Load Immediate
		call	sub_982		; Call Subroutine
		ret			; Subroutine Return
; End of function sub_847


; =============== S U B	R O U T	I N E =======================================


sub_84C:				; CODE XREF: sub_26D+96p sub_734+22p
		movw	r26, r30	; Copy Register	Word
		movw	r24, r22	; Copy Register	Word
		lds	r30, unk_200169	; Load Direct
		clr	r31		; Clear	Register
		clr	r22		; Clear	Register
		clr	r23		; Clear	Register
		call	sub_90D		; Call Subroutine
		sts	unk_200179, r30	; Store	Direct to SRAM
		sts	unk_20017A, r31	; Store	Direct to SRAM
		sts	unk_20017B, r22	; Store	Direct to SRAM
		sts	unk_20017C, r23	; Store	Direct to SRAM
		ret			; Subroutine Return
; End of function sub_84C


; =============== S U B	R O U T	I N E =======================================


sub_85E:				; CODE XREF: sub_26D+98p __RESET+7C3p
		lds	r30, unk_200179	; Load Direct
		sts	unk_200171, r30	; Store	Direct to SRAM
		lds	r26, unk_200179	; Load Direct
		lds	r27, unk_20017A	; Load Direct
		lds	r24, unk_20017B	; Load Direct
		lds	r25, unk_20017C	; Load Direct
		ldi	r30, 8		; Load Immediate
		call	sub_917		; Call Subroutine
		sts	unk_200172, r30	; Store	Direct to SRAM
		ldi	r30, 0x10	; Load Immediate
		call	sub_917		; Call Subroutine
		sts	unk_200173, r30	; Store	Direct to SRAM
		ret			; Subroutine Return
; End of function sub_85E


; =============== S U B	R O U T	I N E =======================================


sub_875:				; CODE XREF: sub_26D:loc_31Fp
					; sub_3C6+5p ...
		ldi	r26, 0		; Load Immediate
		ldi	r27, 0		; Load Immediate
		call	EEPROM_READ	; Call Subroutine
		sts	byte_200160, r30 ; Store Direct	to SRAM
		ret			; Subroutine Return
; End of function sub_875


; =============== S U B	R O U T	I N E =======================================


sub_87C:				; CODE XREF: sub_26D+B9p sub_3C6+26p ...
		lds	r30, unk_200187	; Load Direct
		lds	r31, unk_200188	; Load Direct
		lds	r22, unk_200189	; Load Direct
		lds	r23, unk_20018A	; Load Direct
		sts	unk_200183, r30	; Store	Direct to SRAM
		sts	unk_200184, r31	; Store	Direct to SRAM
		sts	unk_200185, r22	; Store	Direct to SRAM
		sts	unk_200186, r23	; Store	Direct to SRAM
		ret			; Subroutine Return
; End of function sub_87C


; =============== S U B	R O U T	I N E =======================================


sub_88D:				; CODE XREF: sub_344+2Fp sub_344+3Ap ...
		ldi	r30, 0		; Load Immediate
		sts	unk_200163, r30	; Store	Direct to SRAM
		cbi	PORTD, PORTD1	; Port D Data Register
		ret			; Subroutine Return
; End of function sub_88D


; =============== S U B	R O U T	I N E =======================================


sub_892:				; CODE XREF: sub_3C6+19p
					; CheckKeys_420_+49p
		ldi	r30, 0		; Load Immediate
		sts	byte_200160, r30 ; Store Direct	to SRAM
		clt			; Clear	T in SREG
		bld	r2, 3		; Bit load from	T to Register
		sts	unk_200183, r30	; Store	Direct to SRAM
		sts	unk_200184, r30	; Store	Direct to SRAM
		sts	unk_200185, r30	; Store	Direct to SRAM
		sts	unk_200186, r30	; Store	Direct to SRAM
		bld	r4, 7		; Bit load from	T to Register
		ret			; Subroutine Return
; End of function sub_892


; =============== S U B	R O U T	I N E =======================================


sub_8A1:				; CODE XREF: sub_3C6+28p
					; CheckKeys_420_+F0p
		ldi	r30, 0		; Load Immediate
		sts	unk_200194, r30	; Store	Direct to SRAM
		sts	unk_200195, r30	; Store	Direct to SRAM
		sts	unk_200196, r30	; Store	Direct to SRAM
		lds	r26, byte_200160 ; Load	Direct
		cpi	r26, 7		; Compare with Immediate
		ret			; Subroutine Return
; End of function sub_8A1


; =============== S U B	R O U T	I N E =======================================


sub_8AC:				; CODE XREF: sub_3C6:loc_3F6p
					; CheckKeys_420_:loc_520p
		clt			; Clear	T in SREG
		bld	r2, 3		; Bit load from	T to Register
		ldi	r30, 0		; Load Immediate
		sts	unk_200183, r30	; Store	Direct to SRAM
		sts	unk_200184, r30	; Store	Direct to SRAM
		sts	unk_200185, r30	; Store	Direct to SRAM
		sts	unk_200186, r30	; Store	Direct to SRAM
		ret			; Subroutine Return
; End of function sub_8AC


; =============== S U B	R O U T	I N E =======================================


Light_ON:				; CODE XREF: CheckKeys_420_:loc_43Fp
					; CheckKeys_420_+6Cp ...
		sbi	PORTB, PORTB4	; Port B Data Register
		ldi	r30, 6		; Load Immediate
		sts	unk_200162, r30	; Store	Direct to SRAM
		ldi	r30, 0x14	; Load Immediate
		sts	unk_200164, r30	; Store	Direct to SRAM
		ret			; Subroutine Return
; End of function Light_ON


; =============== S U B	R O U T	I N E =======================================


sub_8C0:				; CODE XREF: CheckKeys_420_:loc_4A6p
					; CheckKeys_420_:loc_4DFp
		ldi	r30, 6		; Load Immediate
		sts	unk_200162, r30	; Store	Direct to SRAM
		lds	r26, unk_200187	; Load Direct
		lds	r27, unk_200188	; Load Direct
		lds	r24, unk_200189	; Load Direct
		lds	r25, unk_20018A	; Load Direct
		ret			; Subroutine Return
; End of function sub_8C0


; =============== S U B	R O U T	I N E =======================================


sub_8CC:				; CODE XREF: CheckKeys_420_+90p
					; CheckKeys_420_+C9p ...
		lds	r30, unk_200187	; Load Direct
		lds	r31, unk_200188	; Load Direct
		lds	r22, unk_200189	; Load Direct
		lds	r23, unk_20018A	; Load Direct
		ret			; Subroutine Return
; End of function sub_8CC


; =============== S U B	R O U T	I N E =======================================


sub_8D5:				; CODE XREF: CheckKeys_420_+96p
					; CheckKeys_420_+CFp ...
		sts	unk_200187, r30	; Store	Direct to SRAM
		sts	unk_200188, r31	; Store	Direct to SRAM
		sts	unk_200189, r22	; Store	Direct to SRAM
		sts	unk_20018A, r23	; Store	Direct to SRAM
		ret			; Subroutine Return
; End of function sub_8D5


; =============== S U B	R O U T	I N E =======================================


sub_8DE:				; CODE XREF: CheckKeys_420_:loc_4B8p
					; CheckKeys_420_+D3p
		rcall	sub_8CC		; Relative Call	Subroutine
		ldi	r26, 1		; Load Immediate
		ldi	r27, 0		; Load Immediate
		call	EEPROM_CHK_WRITE_LONG ;	Call Subroutine
		ret			; Subroutine Return
; End of function sub_8DE


; =============== S U B	R O U T	I N E =======================================


sub_8E4:				; CODE XREF: CheckKeys_420_+9Cp
					; CheckKeys_420_+D5p
		call	sub_65D		; Call Subroutine
		rcall	sub_82E		; Relative Call	Subroutine
		rjmp	sub_837		; Relative Jump
; End of function sub_8E4


; =============== S U B	R O U T	I N E =======================================


sub_8E8:				; CODE XREF: sub_554p sub_65D+5p
		clt			; Clear	T in SREG
		bld	r2, 4		; Bit load from	T to Register
		bld	r2, 5		; Bit load from	T to Register
		bld	r2, 6		; Bit load from	T to Register
		bld	r2, 7		; Bit load from	T to Register
		bld	r3, 0		; Bit load from	T to Register
		bld	r3, 1		; Bit load from	T to Register
		ret			; Subroutine Return
; End of function sub_8E8


; =============== S U B	R O U T	I N E =======================================


sub_8F0:				; CODE XREF: sub_65D+85p sub_65D+9Bp ...
		set			; Set T	in SREG
		bld	r3, 7		; Bit load from	T to Register
		bld	r4, 0		; Bit load from	T to Register
		ret			; Subroutine Return
; End of function sub_8F0


; =============== S U B	R O U T	I N E =======================================


sub_8F4:				; CODE XREF: sub_65D+8Ep sub_65D+AEp ...
		set			; Set T	in SREG
		bld	r4, 1		; Bit load from	T to Register
		bld	r4, 2		; Bit load from	T to Register
		ret			; Subroutine Return
; End of function sub_8F4


; =============== S U B	R O U T	I N E =======================================


sub_8F8:				; CODE XREF: sub_65D+93p sub_65D+B5p ...
		set			; Set T	in SREG
		bld	r3, 6		; Bit load from	T to Register
		rjmp	sub_8F0		; Relative Jump
; End of function sub_8F8


; =============== S U B	R O U T	I N E =======================================


sub_8FB:				; CODE XREF: sub_65D+9Dp sub_65D+A6p ...
		set			; Set T	in SREG
		bld	r4, 3		; Bit load from	T to Register
		bld	r4, 4		; Bit load from	T to Register
		ret			; Subroutine Return
; End of function sub_8FB


; =============== S U B	R O U T	I N E =======================================


sub_8FF:				; CODE XREF: sub_734+Ep
					; sub_734:loc_761p ...
		ldd	r30, Y+1	; Load Indirect	with Displacement
		ldd	r31, Y+2	; Load Indirect	with Displacement
		ldd	r22, Y+3	; Load Indirect	with Displacement
		ldd	r23, Y+4	; Load Indirect	with Displacement
		ret			; Subroutine Return
; End of function sub_8FF


; =============== S U B	R O U T	I N E =======================================


sub_904:				; CODE XREF: sub_734+2Fp sub_734+3Ep
		lds	r26, unk_200179	; Load Direct
		lds	r27, unk_20017A	; Load Direct
		lds	r24, unk_20017B	; Load Direct
		lds	r25, unk_20017C	; Load Direct
		ret			; Subroutine Return
; End of function sub_904


; =============== S U B	R O U T	I N E =======================================


sub_90D:				; CODE XREF: sub_84C+7p
		add	r30, r26	; Add without Carry
		adc	r31, r27	; Add with Carry
		adc	r22, r24	; Add with Carry
		adc	r23, r25	; Add with Carry
		ret			; Subroutine Return
; End of function sub_90D


; =============== S U B	R O U T	I N E =======================================


sub_912:				; CODE XREF: sub_734+40p
		sub	r26, r30	; Subtract without Carry
		sbc	r27, r31	; Subtract with	Carry
		sbc	r24, r22	; Subtract with	Carry
		sbc	r25, r23	; Subtract with	Carry
		ret			; Subroutine Return
; End of function sub_912


; =============== S U B	R O U T	I N E =======================================


sub_917:				; CODE XREF: sub_85E+Dp sub_85E+12p
		tst	r30		; Test for Zero	or Minus
		mov	r0, r30		; Copy Register
		movw	r30, r26	; Copy Register	Word
		movw	r22, r24	; Copy Register	Word
		breq	locret_922	; Branch if Equal

loc_91C:				; CODE XREF: sub_917+Aj
		asr	r23		; Arithmetic Shift Right
		ror	r22		; Rotate Right Through Carry
		ror	r31		; Rotate Right Through Carry
		ror	r30		; Rotate Right Through Carry
		dec	r0		; Decrement
		brne	loc_91C		; Branch if Not	Equal

locret_922:				; CODE XREF: sub_917+4j
		ret			; Subroutine Return
; End of function sub_917


; =============== S U B	R O U T	I N E =======================================


sub_923:				; CODE XREF: sub_26D+52p
		tst	r30		; Test for Zero	or Minus
		mov	r0, r30		; Copy Register
		movw	r30, r26	; Copy Register	Word
		movw	r22, r24	; Copy Register	Word
		breq	locret_92E	; Branch if Equal

loc_928:				; CODE XREF: sub_923+Aj
		lsr	r23		; Logical Shift	Right
		ror	r22		; Rotate Right Through Carry
		ror	r31		; Rotate Right Through Carry
		ror	r30		; Rotate Right Through Carry
		dec	r0		; Decrement
		brne	loc_928		; Branch if Not	Equal

locret_92E:				; CODE XREF: sub_923+4j
		ret			; Subroutine Return
; End of function sub_923


; =============== S U B	R O U T	I N E =======================================


sub_92F:				; CODE XREF: sub_734+14p sub_734+3Cp
		mul	r23, r26	; Multiply
		mov	r23, r0		; Copy Register
		mul	r22, r27	; Multiply
		add	r23, r0		; Add without Carry
		mul	r31, r24	; Multiply
		add	r23, r0		; Add without Carry
		mul	r30, r25	; Multiply
		add	r23, r0		; Add without Carry
		mul	r22, r26	; Multiply
		mov	r22, r0		; Copy Register
		add	r23, r1		; Add without Carry
		mul	r31, r27	; Multiply
		add	r22, r0		; Add without Carry
		adc	r23, r1		; Add with Carry
		mul	r30, r24	; Multiply
		add	r22, r0		; Add without Carry
		adc	r23, r1		; Add with Carry
		clr	r24		; Clear	Register
		mul	r31, r26	; Multiply
		mov	r31, r0		; Copy Register
		add	r22, r1		; Add without Carry
		adc	r23, r24	; Add with Carry
		mul	r30, r27	; Multiply
		add	r31, r0		; Add without Carry
		adc	r22, r1		; Add with Carry
		adc	r23, r24	; Add with Carry
		mul	r30, r26	; Multiply
		mov	r30, r0		; Copy Register
		add	r31, r1		; Add without Carry
		adc	r22, r24	; Add with Carry
		adc	r23, r24	; Add with Carry
		ret			; Subroutine Return
; End of function sub_92F


; =============== S U B	R O U T	I N E =======================================


sub_94F:				; CODE XREF: sub_26D+3Fp sub_734+31p ...
		push	r19		; Push Register	on Stack
		push	r20		; Push Register	on Stack
		push	r21		; Push Register	on Stack
		clr	r0		; Clear	Register
		clr	r1		; Clear	Register
		clr	r20		; Clear	Register
		clr	r21		; Clear	Register
		ldi	r19, 0x20 ; ' ' ; Load Immediate

loc_957:				; CODE XREF: sub_94F+1Cj
		lsl	r26		; Logical Shift	Left
		rol	r27		; Rotate Left Through Carry
		rol	r24		; Rotate Left Through Carry
		rol	r25		; Rotate Left Through Carry
		rol	r0		; Rotate Left Through Carry
		rol	r1		; Rotate Left Through Carry
		rol	r20		; Rotate Left Through Carry
		rol	r21		; Rotate Left Through Carry
		sub	r0, r30		; Subtract without Carry
		sbc	r1, r31		; Subtract with	Carry
		sbc	r20, r22	; Subtract with	Carry
		sbc	r21, r23	; Subtract with	Carry
		brcc	loc_969		; Branch if Carry Cleared
		add	r0, r30		; Add without Carry
		adc	r1, r31		; Add with Carry
		adc	r20, r22	; Add with Carry
		adc	r21, r23	; Add with Carry
		rjmp	loc_96A		; Relative Jump
; ---------------------------------------------------------------------------

loc_969:				; CODE XREF: sub_94F+14j
		ori	r26, 1		; Logical OR with Immediate

loc_96A:				; CODE XREF: sub_94F+19j
		dec	r19		; Decrement
		brne	loc_957		; Branch if Not	Equal
		movw	r30, r26	; Copy Register	Word
		movw	r22, r24	; Copy Register	Word
		movw	r26, r0		; Copy Register	Word
		movw	r24, r20	; Copy Register	Word
		pop	r21		; Pop Register from Stack
		pop	r20		; Pop Register from Stack
		pop	r19		; Pop Register from Stack
		ret			; Subroutine Return
; End of function sub_94F


; =============== S U B	R O U T	I N E =======================================


sub_974:				; CODE XREF: TIMER2_OVF+11p
					; sub_26D+1Bp
		ld	r30, X+		; Load Indirect
		ld	r31, X+		; Load Indirect
		ld	r22, X+		; Load Indirect
		ld	r23, X+		; Load Indirect
		ret			; Subroutine Return
; End of function sub_974


; =============== S U B	R O U T	I N E =======================================


sub_979:				; CODE XREF: TIMER2_OVF+17p
					; sub_26D+20p
		st	-X, r23		; Store	Indirect
		st	-X, r22		; Store	Indirect
		st	-X, r31		; Store	Indirect
		st	-X, r30		; Store	Indirect
		ret			; Subroutine Return
; End of function sub_979


; =============== S U B	R O U T	I N E =======================================


sub_97E:				; CODE XREF: main_loop_every_2ms+109p
					; sub_829+1p
		mov	r1, r26		; Copy Register
		mov	r26, r30	; Copy Register
		mov	r30, r1		; Copy Register
		ret			; Subroutine Return
; End of function sub_97E


; =============== S U B	R O U T	I N E =======================================


sub_982:				; CODE XREF: sub_26D+BDp sub_26D+CAp ...
		adiw	r26, 2		; Add Immediate	to Word
		rcall	sub_986		; Relative Call	Subroutine
		movw	r22, r30	; Copy Register	Word
		sbiw	r26, 2		; Subtract Immediate from Word
; End of function sub_982


; =============== S U B	R O U T	I N E =======================================


sub_986:				; CODE XREF: sub_982+1p
		adiw	r26, 1		; Add Immediate	to Word
		rcall	EEPROM_READ	; Relative Call	Subroutine
		mov	r31, r30	; Copy Register
		sbiw	r26, 1		; Subtract Immediate from Word
; End of function sub_986


; =============== S U B	R O U T	I N E =======================================


EEPROM_READ:				; CODE XREF: CheckKeys_420_+11p
					; sub_875+2p ...
		sbic	EECR, EEWE	; EEPROM Control Register
		rjmp	EEPROM_READ	; Relative Jump
		push	r31		; Push Register	on Stack
		in	r31, SREG	; Status Register
		cli			; Global Interrupt Disable
		out	EEARL, r26	; EEPROM Address Register Low
		out	EEARH, r27	; EEPROM Address Register High
		sbi	EECR, EERE	; EEPROM Control Register
		in	r30, EEDR	; EEPROM Data Register
		out	SREG, r31	; Status Register
		pop	r31		; Pop Register from Stack
		ret			; Subroutine Return
; End of function EEPROM_READ


; =============== S U B	R O U T	I N E =======================================


EEPROM_CHK_WRITE_LONG:			; CODE XREF: main_loop_every_2ms+124p
					; sub_26D+8Fp ...
		rcall	EEPROM_CHECK_WRITE_WORD	; Relative Call	Subroutine
		adiw	r26, 2		; Add Immediate	to Word
		movw	r0, r30		; Copy Register	Word
		movw	r30, r22	; Copy Register	Word
		rcall	EEPROM_CHECK_WRITE_WORD	; Relative Call	Subroutine
		movw	r30, r0		; Copy Register	Word
		sbiw	r26, 2		; Subtract Immediate from Word
		ret			; Subroutine Return
; End of function EEPROM_CHK_WRITE_LONG


; =============== S U B	R O U T	I N E =======================================


EEPROM_CHECK_WRITE_WORD:		; CODE XREF: EEPROM_CHK_WRITE_LONGp
					; EEPROM_CHK_WRITE_LONG+4p
		rcall	EEPROM_CHECK_WRITE ; Relative Call Subroutine
		adiw	r26, 1		; Add Immediate	to Word
		push	r30		; Push Register	on Stack
		mov	r30, r31	; Copy Register
		rcall	EEPROM_CHECK_WRITE ; Relative Call Subroutine
		pop	r30		; Pop Register from Stack
		sbiw	r26, 1		; Subtract Immediate from Word
		ret			; Subroutine Return
; End of function EEPROM_CHECK_WRITE_WORD


; =============== S U B	R O U T	I N E =======================================


EEPROM_CHECK_WRITE:			; CODE XREF: main_loop_every_2ms+139p
					; Save_SPEED+4p ...
		sbis	EECR, EEWE	; EEPROM Control Register
		rjmp	loc_9AA		; Relative Jump
		wdr			; Watchdog Reset
		rjmp	EEPROM_CHECK_WRITE ; Relative Jump
; ---------------------------------------------------------------------------

loc_9AA:				; CODE XREF: EEPROM_CHECK_WRITE+1j
		in	r25, SREG	; Status Register
		cli			; Global Interrupt Disable
		out	EEARL, r26	; EEPROM Address Register Low
		out	EEARH, r27	; EEPROM Address Register High
		sbi	EECR, EERE	; EEPROM Control Register
		in	r24, EEDR	; EEPROM Data Register
		cp	r30, r24	; Compare
		breq	loc_9B5		; Branch if Equal
		out	EEDR, r30	; EEPROM Data Register
		sbi	EECR, EEMWE	; EEPROM Control Register
		sbi	EECR, EEWE	; EEPROM Control Register

loc_9B5:				; CODE XREF: EEPROM_CHECK_WRITE+Bj
		out	SREG, r25	; Status Register
		ret			; Subroutine Return
; End of function EEPROM_CHECK_WRITE


; =============== S U B	R O U T	I N E =======================================


sub_9B7:				; CODE XREF: main_loop_every_2ms+D8p
		sbiw	r30, 0		; Subtract Immediate from Word
		sbci	r22, 0		; Subtract Immediate with Carry
		sbci	r23, 0		; Subtract Immediate with Carry
		ret			; Subroutine Return
; End of function sub_9B7


; =============== S U B	R O U T	I N E =======================================


sub_9BB:				; CODE XREF: sub_26D+16p
		clr	r0		; Clear	Register
		cp	r0, r26		; Compare
		cpc	r0, r27		; Compare with Carry
		cpc	r0, r24		; Compare with Carry
		cpc	r0, r25		; Compare with Carry
		ret			; Subroutine Return
; End of function sub_9BB


; =============== S U B	R O U T	I N E =======================================


sub_9C1:				; CODE XREF: main_loop_every_2ms+7Cp
					; main_loop_every_2ms+10Cp ...
		clt			; Clear	T in SREG
		tst	r30		; Test for Zero	or Minus
		breq	locret_9C5	; Branch if Equal
		set			; Set T	in SREG

locret_9C5:				; CODE XREF: sub_9C1+2j
		ret			; Subroutine Return
; End of function sub_9C1

; ---------------------------------------------------------------------------
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set
		sbrs	r31, 7		; Skip if Bit in Register Set

; ===========================================================================

; Segment type:	Pure data
.DSEG ;	RAM
r0:		.byte 1
r1:		.byte 1
r2:		.byte 1
r3:		.byte 1
r4:		.byte 1
r5:		.byte 1
r6:		.byte 1
r7:		.byte 1
r8:		.byte 1
r9:		.byte 1
r10:		.byte 1
r11:		.byte 1
r12:		.byte 1
r13:		.byte 1
r14:		.byte 1
r15:		.byte 1
r16:		.byte 1
r17:		.byte 1
r18:		.byte 1
r19:		.byte 1
r20:		.byte 1
r21:		.byte 1
r22:		.byte 1
r23:		.byte 1
r24:		.byte 1
r25:		.byte 1
r26:		.byte 1
r27:		.byte 1
r28:		.byte 1
r29:		.byte 1
r30:		.byte 1
r31:		.byte 1
TWBR:		.byte 1			; TWI Bit Rate Register
TWSR:		.byte 1			; TWI Status Register
TWAR:		.byte 1			; DATA XREF: __RESET+7B2r
					; TWI (Slave) Address Register
TWDR:		.byte 1			; TWI Data Register
ADCL:		.byte 1			; The ADC Data Register	Low (ADLAR = 0)
ADCH:		.byte 1			; The ADC Data Register	High (ADLAR = 0)
ADCSRA:		.byte 1			; ADC Control and Status Register A
ADMUX:		.byte 1			; ADC Multiplexer Selection Register
ACSR:		.byte 1			; DATA XREF: __RESET+79Cr
					; Analog Comparator Control and	Status Register
UBRRL:		.byte 1			; USART	Baud Rate Register Low Byte
UCSRB:		.byte 1			; USART	Control	and Status Register B
UCSRA:		.byte 1			; USART	Control	and Status Register A
UDR:		.byte 1			; USART	I/O Data Register
SPCR:		.byte 1			; SPI Control Register
SPSR:		.byte 1			; SPI Status Register
SPDR:		.byte 1			; SPI Data Register
PIND:		.byte 1			; DATA XREF: INT1_+15r	sub_A6+1r ...
					; Port D Input Pins Address
DDRD:		.byte 1			; DATA XREF: __RESET+768r __RESET+769r ...
					; Port D Data Direction	Register
PORTD:		.byte 1			; DATA XREF: sub_344:loc_355r
					; sub_344+27r ...
					; Port D Data Register
PINC:		.byte 1			; DATA XREF: main_loop_every_2ms+2r
					; Port C Input Pins Address
DDRC:		.byte 1			; DATA XREF: __RESET+761r __RESET+762r ...
					; Port C Data Direction	Register
PORTC:		.byte 1			; DATA XREF: sub_576+82r
					; sub_576:loc_5FAr ...
					; Port C Data Register
PINB:		.byte 1			; DATA XREF: TIMER2_OVF+5r
					; CheckKeys_420_+1r ...
					; Port B Input Pins Address
DDRB:		.byte 1			; DATA XREF: __RESET+756r __RESET+757r ...
					; Port B Data Direction	Register
PORTB:		.byte 1			; DATA XREF: INT0_+7r TIMER2_OVF+Ar ...
					; Port B Data Register
PINA:		.byte 1			; Port A Input Pins Address
DDRA:		.byte 1			; DATA XREF: __RESET+74Cr __RESET+74Dr ...
					; Port A Data Direction	Register
PORTA:		.byte 1			; DATA XREF: sub_576+1r sub_576+6r ...
					; Port A Data Register
EECR:		.byte 1			; DATA XREF: __RESET+2r EEPROM_READr ...
					; EEPROM Control Register
EEDR:		.byte 1			; DATA XREF: EEPROM_READ+8r
					; EEPROM_CHECK_WRITE+9r ...
					; EEPROM Data Register
EEARL:		.byte 1			; DATA XREF: EEPROM_READ+5r
					; EEPROM_CHECK_WRITE+6r
					; EEPROM Address Register Low
EEARH:		.byte 1			; DATA XREF: EEPROM_READ+6r
					; EEPROM_CHECK_WRITE+7r
					; EEPROM Address Register High
UCSRC:		.byte 1			; USART	Control	and Status Register C (page 155)
WDTCR:		.byte 1			; DATA XREF: __RESET+8r __RESET+9r
					; Watchdog Timer Control Register
ASSR:		.byte 1			; DATA XREF: __RESET+783r
					; __RESET:loc_7CEr
					; Asynchronous Status Register
OCR2:		.byte 1			; Output Compare Register
TCNT2:		.byte 1			; DATA XREF: INT0_+6r TIMER2_OVF+3r ...
					; Timer/Counter	Register
TCCR2:		.byte 1			; DATA XREF: __RESET+787r
					; Timer/Counter	Control	Register
ICR1L:		.byte 1			; DATA XREF: __RESET+790r
					; Input	Capture	Register Low Byte
ICR1H:		.byte 1			; DATA XREF: __RESET+78Fr
					; Input	Capture	Register High Byte
OCR1BL:		.byte 1			; DATA XREF: __RESET+794r
					; Output Compare Register B Low	Byte
OCR1BH:		.byte 1			; DATA XREF: __RESET+793r
					; Output Compare Register B High Byte
OCR1AL:		.byte 1			; DATA XREF: __RESET+792r
					; Output Compare Register A Low	Byte
OCR1AH:		.byte 1			; DATA XREF: __RESET+791r
					; Output Compare Register A High Byte
TCNT1L:		.byte 1			; DATA XREF: __RESET+77Fr
					; Counter Register Low Byte
TCNT1H:		.byte 1			; DATA XREF: __RESET+77Dr
					; Counter Register High	Byte
TCCR1B:		.byte 1			; DATA XREF: __RESET+781r
					; Timer/Counter1 Control Register B
TCCR1A:		.byte 1			; Timer/Counter1 Control Register A
SFIOR:		.byte 1			; DATA XREF: __RESET+79Er
					; Special Function I/O Register
OCDR:		.byte 1			; On-chip Debug	Register
TCNT0:		.byte 1			; DATA XREF: INT1_+5r sub_A6+2Fr ...
					; Timer/Counter	Register
TCCR0:		.byte 1			; DATA XREF: INT1_+3r __RESET+779r
					; Timer/Counter	Control	Register
MCUCSR:		.byte 1			; MCU Control and Status Register
MCUCR:		.byte 1			; DATA XREF: __RESET+6r sub_99+6r ...
					; MCU Control Register
TWCR:		.byte 1			; DATA XREF: main_loop_every_2ms+1Ar
					; main_loop_every_2ms+1Cr ...
					; TWI Control Register
SPMCR:		.byte 1			; Store	Program	Memory Control Register
TIFR:		.byte 1			; DATA XREF: INT1_+6r INT1_+8r
					; Timer/Counter	Interrupt Flag Register
TIMSK:		.byte 1			; DATA XREF: INT1_+9r INT1_+Br ...
					; Timer/Counter	Interrupt Mask Register
GIFR:		.byte 1			; DATA XREF: sub_A6:loc_D8r sub_A6+34r ...
					; General Interrupt Flag Register
GICR:		.byte 1			; DATA XREF: __RESET+4r __RESET+5r ...
					; General Interrupt Control Register
OCR0:		.byte 1			; Output Compare Register
SPL:		.byte 1			; DATA XREF: __RESET+29r
					; Stack	Pointer	Low
SPH:		.byte 1			; DATA XREF: __RESET+2Br
					; Stack	Pointer	High
SREG:		.byte 1			; DATA XREF: TIMER2_OVF+30r sub_81B+Br ...
					; Status Register
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1
		.byte 1

; ===========================================================================

; Segment type:	Pure data
.DSEG ;	EEPROM
		.db    1
		.db 0x10
		.db  0xE
		.db    0
		.db    0
		.db 0xDE ; Þ
		.db    1
		.db    0
		.db    0
		.db  0xE
		.db    0
		.db    0
		.db    0
		.db    0
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
byte_200160:	.db 0xFF		; DATA XREF: sub_26D+31w sub_26D+76r ...
byte_200161:	.db 0xFF		; DATA XREF: main_loop_every_2ms+DCw
					; main_loop_every_2ms+103w ...
unk_200162:	.db 0xFF		; DATA XREF: main_loop_every_2ms+95r
					; main_loop_every_2ms+99r ...
unk_200163:	.db 0xFF		; DATA XREF: sub_344+12r sub_344+15w ...
unk_200164:	.db 0xFF		; DATA XREF: main_loop_every_2ms:loc_17Ar
					; main_loop_every_2ms+57r ...
unk_200165:	.db 0xFF		; DATA XREF: main_loop_every_2ms+C7r
					; main_loop_every_2ms:loc_205r	...
unk_200166:	.db 0xFF		; DATA XREF: main_loop_every_2ms+10Fr
					; main_loop_every_2ms+113r ...
unk_200167:	.db 0xFF		; DATA XREF: main_loop_every_2ms:loc_24Dr
					; main_loop_every_2ms+12Ar ...
unk_200168:	.db 0xFF		; DATA XREF: main_loop_every_2ms+ECw
					; sub_734:loc_73Dr ...
unk_200169:	.db 0xFF		; DATA XREF: sub_26D:loc_2EBr
					; sub_26D+81w ...
unk_20016A:	.db 0xFF		; DATA XREF: main_loop_every_2ms:loc_1DBr
					; main_loop_every_2ms+B8r ...
unk_20016B:	.db 0xFF		; DATA XREF: main_loop_every_2ms+3Ew
					; CheckKeys_420_+25r ...
unk_20016C:	.db 0xFF		; DATA XREF: main_loop_every_2ms+33r
					; main_loop_every_2ms+37r ...
unk_20016D:	.db 0xFF		; DATA XREF: main_loop_every_2ms:loc_169r
					; main_loop_every_2ms+47r ...
unk_20016E:	.db 0xFF		; DATA XREF: main_loop_every_2ms+13Cw
					; __RESET+7B4w
unk_20016F:	.db 0xFF		; DATA XREF: main_loop_every_2ms+81r
					; main_loop_every_2ms:loc_1ACr	...
unk_200170:	.db 0xFF		; DATA XREF: sub_344+8w sub_344+Fw
unk_200171:	.db 0xFF		; DATA XREF: sub_85E+2w
unk_200172:	.db 0xFF		; DATA XREF: sub_85E+Fw
unk_200173:	.db 0xFF		; DATA XREF: sub_85E+14w
unk_200174:	.db 0xFF		; DATA XREF: sub_344+22w
unk_200175:	.db 0xFF		; DATA XREF: TIMER2_OVF+20r
					; TIMER2_OVF+23w ...
unk_200176:	.db 0xFF		; DATA XREF: sub_26D+34w sub_26D+7Ar ...
counter_word_177:.dw 0xFFFF		; DATA XREF: main_loop_every_2ms+Dw
					; main_loop_every_2ms:loc_138r	...
unk_200179:	.db 0xFF		; DATA XREF: sub_734+42w __RESET+7BBw	...
unk_20017A:	.db 0xFF		; DATA XREF: sub_734+44w __RESET+7BDw	...
unk_20017B:	.db 0xFF		; DATA XREF: sub_734+46w __RESET+7BFw	...
unk_20017C:	.db 0xFF		; DATA XREF: sub_734+48w __RESET+7C1w	...
unk_20017D:	.db 0xFF		; DATA XREF: main_loop_every_2ms:loc_146r
					; main_loop_every_2ms:loc_14Dr	...
unk_20017E:	.db 0xFF		; DATA XREF: main_loop_every_2ms+21r
					; main_loop_every_2ms+28r ...
unk_20017F:	.db 0xFF		; DATA XREF: main_loop_every_2ms:loc_183r
					; main_loop_every_2ms+6Fw ...
unk_200180:	.db 0xFF		; DATA XREF: main_loop_every_2ms+5Er
					; main_loop_every_2ms+71w ...
unk_200181:	.db 0xFF		; DATA XREF: main_loop_every_2ms+60r
					; main_loop_every_2ms+73w ...
unk_200182:	.db 0xFF		; DATA XREF: main_loop_every_2ms+62r
					; main_loop_every_2ms+75w ...
unk_200183:	.db 0xFF		; DATA XREF: main_loop_every_2ms:loc_1F7r
					; sub_82Er ...
unk_200184:	.db 0xFF		; DATA XREF: main_loop_every_2ms+D2r
					; sub_82E+2r ...
unk_200185:	.db 0xFF		; DATA XREF: main_loop_every_2ms+D4r
					; sub_82E+4r ...
unk_200186:	.db 0xFF		; DATA XREF: main_loop_every_2ms+D6r
					; sub_82E+6r ...
unk_200187:	.db 0xFF		; DATA XREF: sub_87Cr sub_8C0+3r ...
unk_200188:	.db 0xFF		; DATA XREF: sub_87C+2r sub_8C0+5r ...
unk_200189:	.db 0xFF		; DATA XREF: sub_87C+4r sub_8C0+7r ...
unk_20018A:	.db 0xFF		; DATA XREF: sub_87C+6r sub_8C0+9r ...
unk_20018B:	.db 0xFF		; DATA XREF: sub_26D+41w sub_26D+49r
unk_20018C:	.db 0xFF		; DATA XREF: sub_26D+43w sub_26D+4Br
unk_20018D:	.db 0xFF		; DATA XREF: sub_26D+45w sub_26D+4Dr
unk_20018E:	.db 0xFF		; DATA XREF: sub_26D+47w sub_26D+4Fr
unk_20018F:	.db 0xFF		; DATA XREF: sub_26D+54w
unk_200190:	.db 0xFF		; DATA XREF: sub_26D+56w
unk_200191:	.db 0xFF		; DATA XREF: sub_26D+58w
unk_200192:	.db 0xFF		; DATA XREF: sub_26D+5Aw
unk_200193:	.db 0xFF		; DATA XREF: sub_26Dr sub_26D+3w ...
unk_200194:	.db 0xFF		; DATA XREF: sub_26D+Er sub_26D+11w ...
unk_200195:	.db 0xFF		; DATA XREF: sub_26D+63r sub_26D+66w ...
unk_200196:	.db 0xFF		; DATA XREF: sub_26D+70r sub_26D+73w ...
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF
		.db 0xFF

		.exit ;
