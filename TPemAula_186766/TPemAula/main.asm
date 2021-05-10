;  /===============================================================================\
; | Projeto:  TPemAula																|	
; |																					|
; | Autor: Gustavo Gouveia Alvarez													|
; | Idioma: Assembly																|
; |	Compilado com: Microchip Studio IDE												|
; | Solu��o: TPemAula																|
; |																					|																				
; | SO: Windows 10																	|
; |																					|
; | Plataforma: Microchip Studio IDE												|
; |																					|
; | Professor: S�rgio Schina de Andrade												|
; |																					|
; | Data de vencimento: 10/05/21													|
; |																					|
; + --------------------------------------------------------------------------------+
; |																					|
; | Descri��o: Tornar a porta B uma porta de sa�da. Em seguida, envie para a porta b|
; | os n�meros de 0 a 59 (decimal) e repita. Simule no SIMULIDE atrav�s do uC		|
; |																					|
; | Entrada: Valores de 0 at� 59.													|
; |																					|
; | Sa�da: Output dos valores de entrada pela porta B.								|
;  \===============================================================================/


.INCLUDE "atmega328p.inc"
.DEVICE atmega328P
.nolist
.list

.equ val_atr = 0						; Contador a ser incrementado
.equ val_loop = 60						; Contador a ser decrementado (controle de loop)

;================================
.ORG 0x000 

atribuicao:

	ldi r16, 0b11111111
	out DDRB, r16						; A PORTB est� sendo setada para todos seus pins serem considerados outputs 
	ldi r17, val_atr
	ldi r18, val_loop

	loop:
		out PORTB, r17					; Faz um 'output' da label/vari�vel val_atr na porta B

		inc r17							; Incrementa r17 para a pr�xima execu��o do loop
		dec r18							; Decrementa val_loop para atualizar a quantidade de outputs restantes
		brne loop

jmp atribuicao

nop										; 'nop' usado a fim de facilitar a visualiza��o do resultado.
.EXIT
