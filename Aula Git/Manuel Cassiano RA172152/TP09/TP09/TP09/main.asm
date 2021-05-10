;
; TP09.asm
;
; Created: 10/05/2021 11:25:21
; Author : Manuel
;


; Replace with your application code
.INCLUDE "m328Pdef.inc"
.device atmega328P
.nolist
.list

.ORG 0x000

	rjmp INICIO

INICIO:
	ldi r16, 0
	ldi r17, 0b11111111
	out ddrb, r17

Codigo:
	cpi r16, 60
	breq fim
	out portb, r16
	inc r16
	rjmp Codigo

fim:
	rjmp inicio
	rjmp fim

.EXIT
