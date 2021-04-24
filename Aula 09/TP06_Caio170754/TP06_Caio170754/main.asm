;
; TP06_Caio170754.asm
;
; Created: 23/04/2021 20:52:47
; Author : caiof
;


; Replace with your application code


.device atmega328
.nolist
.list




.ORG 0x000 
	
	rjmp INICIO 

INICIO:

		ldi r17, 0x37 ; carrega em r17 o valor 0x37
		ldi r18, 45 ; carrega em r18 o valor 45
 		ldi r19, 0b00111000 ; carrega em r19 o valor 0b00111000
		ldi r20, 0x2B ; carrega em r20 o valor 0x2B
		add r17,r18 ; r17 = r17 + r18 = 100
		add r19,r20 ; r19 = r19 + r20 = 99
		sub r17,r19 ; r17 = r17 - r19 = 1 (Resposta da equação em r17)
		nop ; Gasta 1 ciclo

LOOP:

	rjmp LOOP
	
.EXIT