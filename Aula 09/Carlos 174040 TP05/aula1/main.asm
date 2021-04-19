;
; aula1.asm
;
; Created: 12/04/2021 10:27:55
; Author : cadus
;


; Replace with your application code
;.INCLUDE " atmega328p
.device atmega328p
.nolist
.list

	.ORG 0x000
		
		rjmp INICIO
		.def temp =r17

INICIO:
	ldi temp,0b00001111	
	out ddrd, temp

LOOP:
	sbi portd,0
	rcall delay_1s
	cbi portd,0
	rcall delay_1s
	rjmp LOOP

#include "delay.asm"

.EXIT
