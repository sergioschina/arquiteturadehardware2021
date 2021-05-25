;
; TP10_AD.asm
;
; Created: 23/05/2021 20:05:14
; Author : Aguinaldo Parreira,Giovana Pimenta, Vinicius Mazziteli, João Vitor Barros
;


; Replace with your application code

	.DEF A       = r16
	.DEF B      = r17
	.DEF C       = r18


	LDI C, 255		;SET PB AS OUTPUT
	OUT DDRB, C




	START_CONVERSION:
		LDI A, 0b00100000			;REFS1 REFS0 ADLAR – MUX3 MUX2 MUX1 MUX0 -> Use MUX 0000 for ADC0
		STS ADMUX, A				;Write one to ADLAR to left adjust the result (results in 8-bit conversion, read only ADCH)

		LDI A, 0b11000110			;ADEN ADSC ADATE ADIF ADIE ADPS2 ADPS1 ADPS0
		STS ADCSRA, A				;and writing a logical one to the ADC Start Conversion bit, ADSC. Writing ADEN to one enables the ADC. ADPS 011 meaning 8 MHz, prescaler 64, 125 KHz ADC clock frequency

	CONVERSION_IN_PROGRESS:
		LDI A, ADCSRA				;ADSC stays high as long as the conversion is in progress and will be cleared by hardware when the conversion is completed.
		SBRC A, 6					;Test if bit is cleared already (is conversion done?)
		//SBRS A,6

		RJMP SET_OUTPUT				;Wen bit is cleared, move on to set output (meaning conversion is done)
		RJMP CONVERSION_IN_PROGRESS	;When bit is not cleared, test again (meaning conversion is not done)

	SET_OUTPUT:

		LDI A, ADCH				;Pega o valor de ADC-HIGH



		ANDI A,3
		cpi A,0b00000011
		breq VerificaLow

		cpi A,0
		breq Verifica30
		RJMP START_CONVERSION


		




	ApagaLed:
		LDI A,0b00000000
		OUT PORTB,A
		RJMP START_CONVERSION

	AcendeLed:
		LDI A,0b01000000
		OUT PORTB,A
		RJMP START_CONVERSION

	VerificaLow:
		LDI A,ADCL
		cpi A,132
		BRSH AcendeLed
		RJMP START_CONVERSION

	Verifica30:
		LDI A,ADCL
		cpi A,30
		brlo ApagaLed
		RJMP START_CONVERSION


		
