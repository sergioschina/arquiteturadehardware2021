;
; Tp10.asm
;
; Created: 24/05/2021 21:33:01
; Author : Luis
;


; Replace with your application code

	.def Porta1       =r16
	.def Porta2       =r18

	ldi Porta2, 255		
	out DDRB, Porta2

	Inicializacao:
		ldi Porta1, 0b00100000			
		sts ADMUX, Porta1				
		ldi Porta1, 0b11000110			
		sts ADCSRA, Porta1				

	Coversao:
		ldi Porta1, ADCSRA				
		sbrc Porta1, 6					
		rjmp SET_OUTPUT				
		rjmp Coversao	

	SET_OUTPUT:
		ldi Porta1, ADCH				
		andi Porta1,3
		cpi Porta1,0b00000011
		breq Verifica
		cpi Porta1,0
		breq Verifica30
		rjmp Inicializacao

	Acender:
		ldi Porta1,0b01000000
		out PORTB,Porta1
		rjmp Inicializacao

    Apagar:
		ldi Porta1,0b00000000
		out PORTB,Porta1
		rjmp Inicializacao

	Verifica:
		ldi Porta1,ADCL
		cpi Porta1,132
		brsh Acender
		rjmp Inicializacao

	Verifica30:
		ldi Porta1,ADCL
		cpi Porta1,30
		brlo Apagar
		rjmp Inicializacao
