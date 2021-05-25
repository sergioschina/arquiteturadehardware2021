;
; TP10_172912.asm
;
; Created: 24/05/2021 21:40:24
; Author : Ailton Fernandes (171912), Lucas Komatsu (170958), Manuel Cassiano (172152), Kevin Tani (167364)

	.def temp = r16
	.def temp2 = r17
	.def temp3 = r18

	ldi temp, 0xff
	out ddrb, temp

	configADC:
		ldi temp, 0x00			
		sts ADMUX, temp			

		ldi temp, (1<<ADEN)|(1<<ADPS0)|(1<<ADPS1)|(1<<ADPS2) 	
		sts ADCSRA, temp

	loop:
		lds temp, ADCSRA	
		ori temp, (1<<ADSC)
		sts	ADCSRA, temp

	adc_read_loop:
		lds temp, ADCSRA
		sbrc temp, ADSC
		rjmp adc_read_loop

	read_adc_value:
		lds temp2, ADCL				
		lds temp3, ADCH
	
	Comp_High:
		andi temp3, 0b00000011
		cpi temp3, 0b00000011
		breq Comp_Low

		cpi temp3, 0
		breq Comp_30
		RJMP configADC

	Comp_30:
		cpi temp2, 30
		brlo Apaga_Led
		rjmp loop

	Apaga_Led:
		ldi temp,0b00000000
		out PORTB7,temp
		rjmp loop
	
	Comp_Low:
		cpi temp2, 132
		brsh Acende_Led
		rjmp loop

	Acende_Led:
		ldi temp,0b01000000
		out PORTB7,temp
		rjmp loop






		
