.device atmega328P
.nolist
.list

;Declara��es

.ORG 0x000
	.def temp = r17
	rjmp INICIO ;indica a posi��o de mem�ria inicial

INICIO:
		ldi temp, 0b00001111 ;carreguei os primeiros bits como 1 e os ultimos como 0
		out ddrd, temp ;carreguei o registro de configura��o de dire��o (data direction register) 4 primeiros como sa�da e 4 �ltimos como entrada

LOOP: ;rotinas de repeti��o
		sbi portd,0
		rcall delay_1s
		cbi portd,0
		rcall delay_1s

	rjmp LOOP

	#include "delay.asm"

.EXIT