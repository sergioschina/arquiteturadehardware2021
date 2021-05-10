;  /===============================================================================\
; | Projeto:  TP06_186766															|	
; |																					|
; | Autor: Gustavo Gouveia Alvarez													|
; | Idioma: Assembly																|
; |	Compilado com: Microchip Studio IDE												|
; | Solu��o: TP06_186766															|
; |																					|																				
; | SO: Windows 10																	|
; |																					|
; | Plataforma: Microchip Studio IDE												|
; |																					|
; | Professor: S�rgio Schina de Andrade												|
; |																					|
; | Data de vencimento: 23/04/21													|
; |																					|
; + --------------------------------------------------------------------------------+
; |																					|
; | Descri��o: Resolver a equa��o      ( 0x37 + 45) - ( 0b00111000 + 0x2B)			|
; |																					|
; | Entrada: Valores contidos na equa��o.											|
; |																					|
; | Sa�da: Resultado da equa��o exposta acima.										|
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
	ldi r19, 56					; Convertido de bin�rio para decimal			   0b00111000 -> 56
	ldi r20, 43					; Convertido de hexadecimal para decimal		   0x2B		  -> 43

	add r17, r18				; Separei a solu��o em duas partes, o 1o par�nteses e o 2o. Para cada um deles, fiz a convers�o 
	sub r19, r20				; para os valores ficarem em valores decimais e ap�s isso efetuei a �ltima opera��o (subtra��o).

	sub r17, r19

	nop

LOOP:
	rjmp LOOP

.EXIT
