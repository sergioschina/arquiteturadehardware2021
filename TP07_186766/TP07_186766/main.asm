;  /===============================================================================\
; | Projeto:  TP07_186766															|	
; |																					|
; | Autor: Gustavo Gouveia Alvarez													|
; | Idioma: Assembly																|
; |	Compilado com: Microchip Studio IDE												|
; | Solução: TP07_186766															|
; |																					|																				
; | SO: Windows 10																	|
; |																					|
; | Plataforma: Microchip Studio IDE												|
; |																					|
; | Professor: Sérgio Schina de Andrade												|
; |																					|
; | Data de vencimento: 30/04/21													|
; |																					|
; + --------------------------------------------------------------------------------+
; |																					|
; | Descrição: Resolver a equação    ( 2 * 0b00101011) - ( 0b00110111 / 0x2D)		|
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
;=============================

INICIO:

	ldi r17, 0b00101011				; Separei a solução em duas partes, o 1o parênteses e o 2o. Para cada um deles, realizei as devidas operações e após isso efetuei a 
	ldi r18, 0b00110111				; última operação (subtração entre as duas partes).
	ldi r19, 0x2D					
	ldi r20, 0b00000000				; R20 foi usado como um contador, para que pudesse armazenar o resultado da divisão a ser feita.
	ldi r21, 0b00000000				; R21 terá a função de auxiliar no manuseio de valores na hora da divisão, para que assim nenhum dado seja sobrescrito indevidamente.

	add r17, r17					; Como a multiplicação da equação era 2 * 0b00101011, era necessário somar somente uma vez o valor binário a ele mesmo para chegar ao
									; resultado correto, dispensando uso de loops para esta etapa da resolução.

	loop_div:						; Para esta parte, que é necessária uma divisão, foram usadas operações de subtração para que fosse possível realizar a divisão, já que
	sub r18, r19					; não é possível dividir dois valores de uma única vez devido a inexistência de uma função dedicada pra a mesma, com exceção de divisões
	inc r20							; cujo divisor seja múltiplo de 2 (usando 'lsr').

	add r21, r18					; Nesta linha o R21 recebe a soma do seu valor com o valor de R18, para que na próxima linha seja possível subtrair R21 pelo divisor da
	sub r21, r19					; equação (R19). No caso desta equação, assim que esta operação for realizada, o bit 0 do SREG (Carry Flag) será setado, podendo assim 
									; acionar a função 'brcs', que faz a checagem do bio 0 do SREG.

	brcs val_zerado
	val_n_zero:						; Caso a Carry Flag não estivesse setada o loop para divisão seria reiniciado, mantendo o valor do divisor e do contador.
		brne loop_div
	val_zerado:						; Caso a Carry Flag esteja setada, a divisão chegou ao fim, então um 'jmp' foi usado para dar sequência a execução do código.
		jmp fim_div
	fim_div:


	sub r17, r20					; Operação final, a subtração de R17 (Resultado do 1o parenteses) e R20 (Resultado do 2o)

	nop								; 'nop' usado a fim de facilitar a visualização do resultado.

.EXIT