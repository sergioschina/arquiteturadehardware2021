;
; TP-Aula1.asm
;
; Created: 10/05/2021 10:39:18
; Author : Aguinaldo e Giovana
;


; Replace with your application code

zera:
ldi r16,0xff
out DDRB, r16
ldi r17,0
start:
    
	out portb,r17
	inc r17
	cpi r16,59
	breq zera


    rjmp start
