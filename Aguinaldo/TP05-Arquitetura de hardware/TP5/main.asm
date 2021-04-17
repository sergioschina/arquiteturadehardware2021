.device atmega328P
.nolist
.list

;Declarações

.ORG 0x000
	.def temp = r17
	rjmp INICIO ;indica a posição de memória inicial

INICIO:
		ldi temp, 0b00001111 ;carreguei os primeiros bits como 1 e os ultimos como 0
		out ddrd, temp ;carreguei o registro de configuração de direção (data direction register) 4 primeiros como saída e 4 últimos como entrada

LOOP: ;rotinas de repetição
		sbi portd,0
		rcall delay_1s
		cbi portd,0
		rcall delay_1s

	rjmp LOOP

	#include "delay.asm"

.EXIT