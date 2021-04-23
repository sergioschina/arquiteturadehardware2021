;
; TP-06.asm
;
; Created: 23/04/2021 16:51:45
; Author : unisanta
;


; Replace with your application code
start:
    ldi r16,0x37
	ldi r17,45
	add r16,r17
	ldi r17,0b00111000
	ldi r18,0x2b
	add r17,r18
	sub r16,r17
    rjmp start
