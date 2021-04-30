;  /===============================================================================\
; | Projeto:  TP07 (Favor ignorar os arquivos, eu sou um idiota :P)					|
; |																					|
; | Autor: GUILHERME RAFAEL FARINHA SANTANA											|
; | Idioma: LNGUAGEM ASSEMBLER E COMPILADOR AVRASM									|
; | Solu��o: tp8.atsln (de novo, ignorar o erro no nome, � pro TP07 mesmo)			|
; |																					|
; | Para compilar: Para compilar este c�digo, dever� ter o compilador AVRASM2.exe   |
; |	(windows) no prompt de comando (MS-DOS):										|
; |																					|
; |      avrasm2.exe -fI -o "tp8.hex"												|
; |						 -m "tp8.map"												|
; | 					 -l "tp8.lss"												|
; |						 -S "tp8.tmp"												|
; |						 -W+ie -I													|
; |																					|
; | Vers�o do SO: Atmel Studio 7.0													|
; |																					|
; | Plataforma: Windows 8.0															|
; |																					|
; | Instrutor: S�rgio Schina de Andrade												|
; |																					|
; | Data de vencimento: 30/04/2021 23:59											|
; |																					|
; + --------------------------------------------------------------------------------+
; |																					|
; | Descri��o: O progama resolve uma conta de matem�tica b�sica: (2*43)-(55/45).	|
; |																					|
; | Entrada: Nenhuma.																|
; |																					|
; | Sa�da: Os registros de mem�ria 16 e 17 d�o a resposta 84 e 35 respectivamente.  |
; |	(Obs: o resultado de 35 do resgistro 17 deve ser interpretado como 35/45, ou	|
; |	 seja, como resto de uma divis�o)												|
; |																					|
; | Algoritmo: Para realizar multiplica��o, foi-se usado a fun��o LSL. Para a		|
; |	divis�o foi usado um loop com cont�nua subtra��o e contagem. Depois,			|
; |	foi decrementado 1 do n�mero sem parte fracional e copiou-se o divisor num rgs. |
; |	n�o antes usado. Assim, por �ltimo, subtrai-se os n�meros inteiros dos n�meros	|
; |	fracionais.																		|
; |																					|
; | Recursos necess�rios n�o inclu�dos: C�lculos com n�meros fracionados (resto).	|
; |																					|
; | Erros conhecidos: N�o achei um jeito de implentar n�meros fracion�rios na		|
; |	solu��o.																		|
; |																					|
;  \===============================================================================/

.INCLUDE "m328Pdef.inc"
.device atmega328p
.nolist
.list

.ORG 0x0000
	
	rjmp start

start:

	clr r16
	clr r17
	clr r18
	clr r19
	clr r20
	ldi r16,43
	ldi r18,55
	ldi r19,45

	lsl r16
	startdiv:
		inc r20
		sub r18,r19
		 cp r18,r19
	brge startdiv
	dec r16
	mov r17,r19
	sub r16,r20
	sub r17,r18
	clr r18
	clr r19
	clr r20

	nop

loop:
	
	rjmp loop

.EXIT