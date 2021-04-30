;  /===============================================================================\
; | Projeto:  TP07_186766															|	
; |																					|
; | Autor: Gustavo Gouveia Alvarez													|
; | Idioma: Assembly																|
; |	Compilado com: Microchip Studio IDE												|
; | Solu��o: TP07_186766															|
; |																					|																				
; | SO: Windows 10																	|
; |																					|
; | Plataforma: Microchip Studio IDE												|
; |																					|
; | Professor: S�rgio Schina de Andrade												|
; |																					|
; | Data de vencimento: 30/04/21													|
; |																					|
; + --------------------------------------------------------------------------------+
; |																					|
; | Descri��o: Resolver a equa��o    ( 2 * 0b00101011) - ( 0b00110111 / 0x2D)		|
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
;=============================

INICIO:

	ldi r17, 0b00101011				; Separei a solu��o em duas partes, o 1o par�nteses e o 2o. Para cada um deles, realizei as devidas opera��es e ap�s isso efetuei a 
	ldi r18, 0b00110111				; �ltima opera��o (subtra��o entre as duas partes).
	ldi r19, 0x2D					
	ldi r20, 0b00000000				; R20 foi usado como um contador, para que pudesse armazenar o resultado da divis�o a ser feita.
	ldi r21, 0b00000000				; R21 ter� a fun��o de auxiliar no manuseio de valores na hora da divis�o, para que assim nenhum dado seja sobrescrito indevidamente.

	add r17, r17					; Como a multiplica��o da equa��o era 2 * 0b00101011, era necess�rio somar somente uma vez o valor bin�rio a ele mesmo para chegar ao
									; resultado correto, dispensando uso de loops para esta etapa da resolu��o.

	loop_div:						; Para esta parte, que � necess�ria uma divis�o, foram usadas opera��es de subtra��o para que fosse poss�vel realizar a divis�o, j� que
	sub r18, r19					; n�o � poss�vel dividir dois valores de uma �nica vez devido a inexist�ncia de uma fun��o dedicada pra a mesma, com exce��o de divis�es
	inc r20							; cujo divisor seja m�ltiplo de 2 (usando 'lsr').

	add r21, r18					; Nesta linha o R21 recebe a soma do seu valor com o valor de R18, para que na pr�xima linha seja poss�vel subtrair R21 pelo divisor da
	sub r21, r19					; equa��o (R19). No caso desta equa��o, assim que esta opera��o for realizada, o bit 0 do SREG (Carry Flag) ser� setado, podendo assim 
									; acionar a fun��o 'brcs', que faz a checagem do bio 0 do SREG.

	brcs val_zerado
	val_n_zero:						; Caso a Carry Flag n�o estivesse setada o loop para divis�o seria reiniciado, mantendo o valor do divisor e do contador.
		brne loop_div
	val_zerado:						; Caso a Carry Flag esteja setada, a divis�o chegou ao fim, ent�o um 'jmp' foi usado para dar sequ�ncia a execu��o do c�digo.
		jmp fim_div
	fim_div:


	sub r17, r20					; Opera��o final, a subtra��o de R17 (Resultado do 1o parenteses) e R20 (Resultado do 2o)

	nop								; 'nop' usado a fim de facilitar a visualiza��o do resultado.

.EXIT