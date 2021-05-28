;  /===============================================================================\
; | Projeto:  TPSubstituto (TPsub) - FIFO											|	
; |																					|
; | Autor: Gustavo Gouveia Alvarez													|
; | Idioma: Assembly																|
; |	Compilado com: Microchip Studio IDE												|
; | Solu��o: TPExtra																|
; |																					|																				
; | SO: Windows 10																	|
; |																					|
; | Plataforma: Microchip Studio IDE												|
; |																					|
; | Professor: S�rgio Schina de Andrade												|
; |																					|
; | Data de vencimento: 28/05/2021													|
; |																					|
; + --------------------------------------------------------------------------------+
; |																					|
; | Descri��o: Utilizando conceitos de stacks, programar uma stack do tipo FIFO		|
; |																					|
; | Observa��es: Devem ser realizadas checagens para que:							|
; |		- O espa�o de mem�ria dispon�vel n�o � excedido (a cabe�a corre na cauda).	|
; |		- N�o s�o retirados muitos itens da pilha (a cauda passa pela cabe�a).		|
; |		- Quando um ponteiro atinge o final do intervalo de mem�ria linear, ele		|
; |		precisa envolver o outro extremo da mem�ria. Isso faz uma regi�o linear		| 
; |		parecer uma regi�o circular.												|
; |																					|
; | Entrada: Atribui��o de valores em c�digo (sem input)							|
; |																					|
; | Sa�da: ---																		|
;  \===============================================================================/


;	Observa��es:
;
;	Professor, tive dificuldade quanto ao uso do pop e do push para a aplica��o do conceito de pilha FIFO, pois
;  n�o consegui fazer funcionarem com ponteiros diferentes do StackPointer, ent�o decidi criar macros para
;  substituir essas fun��es.


.INCLUDE "atmega328p.inc"
.DEVICE atmega328P
.nolist
.list

.equ val_inicio = 0x08FF						; Label que armazena o endere�o do in�cio da pilha
.equ val_fim = 0x08F5							; Label com o endere�o limite estabelecido para a pilha (10 valores)
												; Obs.: A pilha vai de 0x08FE at� 0x08F5 (decrescendo)

;=============== MACROS ===============

.macro pushFIFO									; A macro pushFIFO tem a fun��o de inserir o valor de val_entrada na pilha com
	st -x, @0									;pr� decremento, indo do maior endere�o dispon�vel para o menor. A partir
	inc val_pushes								;do momento em que um dado � colocado, um incremento no valor de val_pushes
.endmacro										;� chamado, para assim ganharmos controle da quantidade de pushes atuais.

.macro popFIFO									; J� na macro popFIFO, o valor que est� no endere�o y (tail) � carregado em
	ld @0, -y									;val_saida, e em seguida o valor no endere�o � substitu�do pelo valor zero.
	st y, val_zero								;Assim como na macro anterior, ao fim temos outro incremento, agora em
	inc val_pops								;val_pops, para armazenar a quantidade de pushes.
.endmacro

.macro checagem									; Nesta �ltima macro, checagem, os contadores val_pushes e val_pops s�o chamados 
	cpi @0, 11									;conforme necess�rios para que sejam verificados casos de overflow ou underflow.
	brne valido									;Vale ressaltar que, como a quantidade de dados sendo inseridos foram previamente
	invalido:									;estipulados, n�o teremos esse problema.
		jmp erro
	valido:
		nop
.endmacro

;======================================			; Nas linhas a seguir temos as defini��es dos nomes referentes aos registradores
.ORG 0x000										;que ser�o usados no c�digo, segue uma breve descri��o de cada:

	.def val_entrada = r16						; val_entrada	-> armazena o valor que ser� inserido na cabe�a (head) da pilha 
	.def val_saida = r19						; val_saida		-> armazena o valor que � recebido na macro popFIFO
	.def val_pushes = r17						; val_pushes	-> contador que armazena a quantidade de pushes j� realizados
	.def val_pops = r18							; val_pops		->    "      "     "     "      "     de pops j� realizados
	.def val_zero = r23							; val_zero		-> armazena o valor 0 para ser utilizado dentro da macro.
;======================================

	inicio:
		ldi xl, val_inicio % 0x0100				; Inicializa��o dos dados referentes a cabe�a (head) e a cauda (tail), respectivamente,
		ldi xh, val_inicio / 0x0100				;nas linhas a seguir.
		ldi yl, val_inicio % 0x0100	
		ldi yh, val_inicio / 0x0100 
	
		ldi val_entrada, 1
		ldi val_zero, 0
		ldi val_pops, 0
		ldi val_pushes, 0

	adicionaValores:							; No loop adicionaValores ser� realizada a inser��o dos dados na pilha, e assim que a
		pushFIFO val_entrada					;execu��o da macro pushFIFO for finalizada o valor do contador val_entrada ser�
		inc val_entrada							;incrementado.

		checagem val_pushes						; Chamada da macro checagem, passando como argumento o contador val_pushes.

		cpi xl, val_fim % 0x0100				; Nesta passagem o endere�o atual de x ser� comparado com o endere�o final (0x08F5), e caso
		brne adicionaValores					;sejam iguais ser� entendido que todos os valores foram preenchidos e a execu��o avan�ar� 
		cpi xh, val_fim / 0x0100				;para a retirada dos valores com o popFIFO.
		brne adicionaValores


	removeValores:								; Este loop, removeValores, se assemelha muito nas instru��es utilizadas no loop anterior,
		cpi val_pushes, 0						;por�m neste momento os valores ser�o retirados com o uso da macro popFIFO, mas antes ser�
		brlt erro								;checado o contador val_pushes, caso o mesmo seja 0 ser� entendido que n�o existem valores
												;para serem retirados, sendo assim ser� lan�ado um erro (no caso, encerrar� a execu��o).
		popFIFO val_saida

		checagem val_pops						; Macro checagem sendo chamada novamente, desta vez passando como argumento val_pops.

		cpi yl, val_fim % 0x0100				; O endere�o atual de y ser� comparado, tamb�m, com o endere�o final (0x08F5). Caso sejam
		brne removeValores						;iguais a execu��o ir� prosseguir.
		cpi yh, val_fim / 0x0100	
		brne removeValores


	rjmp inicio									; Fim da execu��o. Ao chegar aqui, a execu��o ser� reiniciada.

	erro:										; Caso algum erro nas checagens seja detectado, a execu��o vir� at� este loop, encerrando
		nop										;a mesma.

	nop											; Usado para facilitar a visualiza��o (breakpoint)