;
; TP06-EX2.asm
;
; Created: 23/04/2021 17:14:37
; Author : unisanta
;


; Replace with your application code
start:
    ldi r16,0b00101011
	lsl r16
	ldi r19,0
	ldi r17,0b00110111
	ldi r18,0x2d
	rcall divisao


divisao:
	sub r17,r18
	brcs final
	inc r19
	brne divisao
	
final:
	sub r16,r19
    
