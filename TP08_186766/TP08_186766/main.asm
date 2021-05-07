;  /===============================================================================\
; | Projeto:  TP08_186766															|	
; |																					|
; | Autor: Gustavo Gouveia Alvarez													|
; | Idioma: Assembly																|
; |	Compilado com: Microchip Studio IDE												|
; | Solu��o: TP08_186766															|
; |																					|																				
; | SO: Windows 10																	|
; |																					|
; | Plataforma: Microchip Studio IDE												|
; |																					|
; | Professor: S�rgio Schina de Andrade												|
; |																					|
; | Data de vencimento: 08/05/21													|
; |																					|
; + --------------------------------------------------------------------------------+
; |																					|
; | Descri��o: com uma vari�vel,  come�ando pelo endere�o 0x0100 com o valor 0, com |
; | passo de  1 ( ou seja,  "registro + 1"), preencha os espa�os de mem�rias at� o  | 
; | endere�o 0x0164. Em seguida transporte todos os n�meros impares a partir do     |
; | endere�o de mem�ria 0x0200.														|
; |																					|
; | Entrada: Atribui��o de valores em c�digo (sem input)							|
; |																					|
; | Sa�da: ---																		|
;  \===============================================================================/

.INCLUDE "atmega328p.inc"
.DEVICE atmega328P
.nolist
.list

										;   As quatro labels declaradas em sequ�ncia foram utilizadas para as seguintes finalidades:
.equ val_atr = 0x0						; - Contador que ser� incrementado para ser utilizado na atribui��o dos valores no preenchimento a seguir.
.equ geral_inicio = 0x0100				; - Endere�os de in�cio/fim dos espa�os relativos as atribui��es iniciais (1, ..., 100).
.equ geral_fim = 0x0164					; -	"""
.equ impar_inicio = 0x0200				; - Endere�o de in�cio dos novos espa�os dedicados aos valores �mpares.


;================================
.ORG 0x000 

	ldi yl, impar_inicio % 0x0100		;  Inicializa��o dos dados referentes ao destino nas duas linhas seguintes.
	ldi yh, impar_inicio / 0x0100

preencher:								
	ldi r17, val_atr					
	ldi xl, geral_inicio % 0x0100		;  No segmento "preencher", primeiramente o valor da label val_atr vai ser carregado em r17, e logo em seguida
	ldi xh, geral_inicio / 0x0100		; os dados de origem ser�o devidamente inicializados em xl e xh, para ent�o seguir para a parte "guardar".
guardar:
	st x+, r17
	inc r17								;  Neste 'loop' ser� feita a atribui��o do valor contido em r17 para o endere�o na qual est� o ponteiro. Logo
	cpi xl, (geral_fim+1) % 0x0100		; em seguida o endere�o atual ser� comparado com o endere�o final (0x0164), e caso sejam iguais ser� entendido
	brne guardar						; que todos os valores foram preenchidos e a execu��o avan�ar� para o transporte dos valores.
	cpi xh, (geral_fim+1) / 0x0100
	brne guardar



ldi xl, geral_inicio % 0x0100			;  Como os endere�os de in�cio foram manipulados nas atribui��es iniciais, ser� necess�rio carregar novamente
ldi xh, geral_inicio / 0x0100			; os endere�os iniciais em xl e xh.

transloc:								;  Em "transloc" r18 receber� o valor contido no endere�o apontado por x (em p�s incremento), e em seguida ser�
	ld r18, x+							; realizada a instru��o SBRS, que testa um �nico bit de um valor armazenado dentro de um registrador, caso o
	sbrs r18, 0							; o mesmo esteja setado, a instru��o seguinte (rjmp transloc) ser� ignorada. Isso � feito para que somente os
	rjmp transloc						; valores �mpares sejam selecionados para a movimenta��o, sabendo que estes n�meros, em b�nario, sempre possuem 
	rjmp num_impar						; seu bit 0 setado.
num_impar:
	st y+, r18
	cpi xl, (geral_fim+1) % 0x0100		;  Por fim, assim que um n�mero �mpar for computado a execu��o ser� dirigida a se��o "num_impar", que por sua 
	brne transloc						; vez vai armazenar esse valor nos endere�os a partir daquele setado na label inicial impar_inicio
	cpi xh, (geral_fim+1) / 0x0100
	brne transloc

nop										; 'nop' usado a fim de facilitar a visualiza��o do resultado.
.EXIT