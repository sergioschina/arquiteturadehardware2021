;
; TPemAula.asm
;
; Created: 10/05/2021 10:31:44
; Author : Aguinaldo e Giovanna
;

zerar:

    ldi r16,0xff
	out ddrb,r16
	ldi r17,0

start:

	out portb,r17
	inc r17
	cpi r16,59
	brne zerar
	rjmp start


