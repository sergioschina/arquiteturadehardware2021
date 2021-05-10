;
; tp9.asm
;
; Created: 10/05/2021 11:06:33
; Author : gabriel
;


; Replace with your application code
.INCLUDE "m328pdef.inc"
.nolist
.list

.ORG 0x0000
	
	rljmp INICIO

	.def temp = r16

INICIO:
	ldi r16, 0xff
	out ddrb, r16

restart:
	ldi r17,0x00

main:
	out portb. r17
	inc r17
	cpi r17,60
	breq restart
	rjmp
