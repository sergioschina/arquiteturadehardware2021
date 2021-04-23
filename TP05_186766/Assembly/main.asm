;  /===============================================================================\
; | Projeto:  TP05_186766															|	
; |																					|
; | Autor: Gustavo Gouveia Alvarez													|
; | Idioma: Assembly																|
; |	Compilado com: Microchip Studio IDE												|
; | Solução: TP05_186766															|
; |																					|
; + --------------------------------------------------------------------------------+
; |																					|
; | Descrição: Piscar um LED (PORTD0), com um intervalo de tempo de 1 segundo.		|
; |																					|
;  \===============================================================================/

.INCLUDE "atmega328p.inc"
.DEVICE atmega328P
.nolist
.list

;=============================
;Declarações

.ORG 0x000 
	rjmp INICIO
	.def temp =r18
;=============================

INICIO:

	ldi temp, 0b00001111 
	out ddrb, temp

LOOP:
	sbi portd,0				; seria equivalente a isso portb = 0xXXXXXXX1
	rcall sleep_1s
	cbi portd,0				;seria equivalente a isso portb = 0xXXXXXXX0
	rcall sleep_1s
	rjmp LOOP

sleep_1ms:
	push r16
	ldi r16, 99
	sleep_1ms1:					; 1 ciclo no ATmega328P -> 1MHz
		nop						; logo, 100 ciclos		-> 1ms
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
	dec r16
	brne sleep_1ms1
	pop r16
	ret

sleep_1s:
	push r17
	ldi r17, 99
	sleep_1s1:
		rcall sleep_1ms
	dec r17
	brne sleep_1s1
	pop r17
	ret

.EXIT
