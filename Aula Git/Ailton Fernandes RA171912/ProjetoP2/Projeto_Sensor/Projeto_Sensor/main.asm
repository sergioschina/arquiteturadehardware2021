;
; Projeto_Sensor.asm
;
; Created: 29/05/2021 11:37:51
; Author : Ailton
;

; Replace with your application code

.INCLUDE "m328Pdef.inc"
.device atmega328P
.nolist
.list

.ORG 0x000	
	rjmp Inicio

Inicio:
	ldi r16, 0b00000000 ; entrada
	out DDRD, r16 ; configura os pinos/portas D como entrada
	out DDRB, r16 ; configura os pinos/portas B como entrada

	ldi r16, 0b11111111 ; saída
	out DDRC, r16 ; configura os pinos/portas C como saída

Compara:
	rcall delay_1ms
	in r19, PINB
	cpi r19, 0
	breq Compara

verifica:
	in r17, PIND ; r17 recebe o valor da Pino/Porta D
	cpi r17, 0 ; compara se o valor recebido da Porta D é igual a 0, caso verdadeiro seta flag Z
	breq Acende_Lamp  ; se flag Z setada, chama a função Acende Lâmpada, caso contrário, permanecerá em Loop. 
	rjmp Compara

Acende_Lamp:
	ldi r18, 255
	out PORTC, r18 ; Acende a Lâmpada
	rcall delay_10s ; Delay de aproximadamente 10s
	ldi r18, 0
	out PORTC, r18 ; Apaga a Lâmpada
	rjmp Compara 

	#include "delay.asm"
.EXIT