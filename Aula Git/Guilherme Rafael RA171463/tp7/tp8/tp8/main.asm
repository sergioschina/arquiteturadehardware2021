;  /===============================================================================\
; | Projeto:  TP07 (Favor ignorar os arquivos, eu sou um idiota :P)					|
; |																					|
; | Autor: GUILHERME RAFAEL FARINHA SANTANA											|
; | Idioma: LNGUAGEM ASSEMBLER E COMPILADOR AVRASM									|
; | Solução: tp8.atsln (de novo, ignorar o erro no nome, é pro TP07 mesmo)			|
; |																					|
; | Para compilar: Para compilar este código, deverá ter o compilador AVRASM2.exe   |
; |	(windows) no prompt de comando (MS-DOS):										|
; |																					|
; |      avrasm2.exe -fI -o "tp8.hex"												|
; |						 -m "tp8.map"												|
; | 					 -l "tp8.lss"												|
; |						 -S "tp8.tmp"												|
; |						 -W+ie -I													|
; |																					|
; | Versão do SO: Atmel Studio 7.0													|
; |																					|
; | Plataforma: Windows 8.0															|
; |																					|
; | Instrutor: Sérgio Schina de Andrade												|
; |																					|
; | Data de vencimento: 30/04/2021 23:59											|
; |																					|
; + --------------------------------------------------------------------------------+
; |																					|
; | Descrição: O progama resolve uma conta de matemática básica: (2*43)-(55/45).	|
; |																					|
; | Entrada: Nenhuma.																|
; |																					|
; | Saída: Os registros de memória 16 e 17 dão a resposta 84 e 35 respectivamente.  |
; |	(Obs: o resultado de 35 do resgistro 17 deve ser interpretado como 35/45, ou	|
; |	 seja, como resto de uma divisão)												|
; |																					|
; | Algoritmo: Para realizar multiplicação, foi-se usado a função LSL. Para a		|
; |	divisão foi usado um loop com contínua subtração e contagem. Depois,			|
; |	foi decrementado 1 do número sem parte fracional e copiou-se o divisor num rgs. |
; |	não antes usado. Assim, por último, subtrai-se os números inteiros dos números	|
; |	fracionais.																		|
; |																					|
; | Recursos necessários não incluídos: Cálculos com números fracionados (resto).	|
; |																					|
; | Erros conhecidos: Não achei um jeito de implentar números fracionários na		|
; |	solução.																		|
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