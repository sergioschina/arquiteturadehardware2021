;  /===============================================================================\
; | Projeto:  TP06_186766															|	
; |																					|
; | Autor: Gustavo Gouveia Alvarez													|
; | Idioma: Assembly																|
; |	Compilado com: Microchip Studio IDE												|
; | Solução: TP06_186766															|
; |																					|																				
; | SO: Windows 10																	|
; |																					|
; | Plataforma: Microchip Studio IDE												|
; |																					|
; | Professor: Sérgio Schina de Andrade												|
; |																					|
; | Data de vencimento: 23/04/21													|
; |																					|
; + --------------------------------------------------------------------------------+
; |																					|
; | Descrição: Resolver a equação      ( 0x37 + 45) - ( 0b00111000 + 0x2B)			|
; |																					|
; | Entrada: Valores contidos na equação.											|
; |																					|
; | Saída: Resultado da equação exposta acima.										|
;  \===============================================================================/

.INCLUDE "atmega328p.inc"
.DEVICE atmega328P
.nolist
.list

;=============================
.ORG 0x000 
	rjmp INICIO
	.def temp = r16
;=============================

INICIO:

	ldi temp, 0b00001111 
	out ddrb, temp
	ldi r17, 55					; Valor convertido de hexadecimal para decimal     0x37       -> 55
	ldi r18, 45
	ldi r19, 56					; Convertido de binário para decimal			   0b00111000 -> 56
	ldi r20, 43					; Convertido de hexadecimal para decimal		   0x2B		  -> 43

	add r17, r18				; Separei a solução em duas partes, o 1o parênteses e o 2o. Para cada um deles, fiz a conversão 
	sub r19, r20				; para os valores ficarem em valores decimais e após isso efetuei a última operação (subtração).

	sub r17, r19

	nop

LOOP:
	rjmp LOOP

.EXIT
