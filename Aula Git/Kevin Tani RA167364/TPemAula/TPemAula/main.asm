.INCLUDE "m328Pdef.inc"
.device atmega328P
.nolist
.list

.ORG 0x000 
	
	rjmp inicio 

inicio:
    ldi r16, 0
    ldi r17, 0b00001111
    out ddrb, r17 

start:
    cpi r16, 60
    breq fim
    out portb, r16
    inc r16
    rjmp start

fim:
    rjmp inicio
    rjmp fim

.EXIT
