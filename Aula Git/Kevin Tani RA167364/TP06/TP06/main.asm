.device atmega328P
.nolist
.list

.ORG 0X000


    rjmp INICIO

INICIO:
	ldi r16, 0x37
	ldi r17, 45
	ldi r18, 0b00111000
	ldi r19, 0x2B
	add r16, r17
	add r18, r19
	sub r16, r18
	nop
LOOP:
    rjmp LOOP
.EXIT
