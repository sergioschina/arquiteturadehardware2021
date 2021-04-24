.device atmega328P
.nolist
.list

.ORG 0x0000
	rjmp INICIO


INICIO:

	clr r16;
	ldi r16,45
	ldi r17,0b00110111
	add r16, r17
	ldi r18,0b00111000
	ldi r19,0b00101011
	add r18, r19
	sub r16,r18


.EXIT