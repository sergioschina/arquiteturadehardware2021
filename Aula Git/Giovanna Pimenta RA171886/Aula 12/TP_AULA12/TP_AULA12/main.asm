;  /===============================================================================\
; | Projeto:  Exemplo Delay 1																|	
; |																					|
; | Autor: NOME DO ESTUDANTE AQUI													|
; | Idioma: NOME DA L�NGUA EM QUE O PROGRAMA EST� ESCRITO E							|
; |			O NOME DO COMPILADOR USADO PARA COMPIL�-LO QUANDO FOI TESTADO			|
; | Solu��o: NOME DA SUA SOLU��O ATMEL STUDIO 7 (Template neste exemplo)			|
; |																					|
; | Projetos: AssemblerTargetTeamplate												|
; |																					|
; | Para compilar: Explique como compilar este programa	                            |
; |																					|
; |Exemplo: Para compilar este c�digo, dever� ter o compilador AVRASM2.exe (windows)|
; | no prompt de comando (MS-DOS):													|
; |																					|
; |      avrasm2.exe -fI -o "Teamplate.hex"											|
; |						 -m "Teamplate.map"											|
; | 					 -l "Teamplate.lss"											|	
; |						 -e "Teamplate.eep"											|  
; |						 -S "Teamplate.tmp"											|	  
; |						 -W+ie  -d "Debug\Teamplate.obj"							|
; |						 main.asm													|
; |																					|
; | Software: NOME E T�TULO DA CLASSE PARA QUE ESTE PROGRAMA FOI ESCRITO			|
; |																					|
; | Vers�o do SO: SEU N�MERO DE VERS�O DO PROGRAMA DE COMPUTADOR					|
; |																					|
; | Plataforma: SEU PROGRAMA DE COMPUTADOR											|
; |																					|
; | Instrutor: NOME DO INSTRUTOR DO SEU CURSO										|
; |																					|
; | Data de vencimento: DATA E HORA EM QUE ESTE PROGRAMA � / DEVIA SER				|
; | SUBMETIDO																		|
; |																					|
; + --------------------------------------------------------------------------------+
; |																					|
; | Descri��o: DESCREVA O PROBLEMA DE QUE ESTE PROGRAMA FOI ESCRITO RESOLVER.		|
; |																					|
; | Entrada: DESCREVA A ENTRADA QUE O PROGRAMA EXIGE.								|
; |																					|
; | Sa�da: DESCREVA A SA�DA QUE O PROGRAMA PRODUZ.									|
; |																					|
; | Algoritmo: ESBO�O DA ABORDAGEM USADA PELO PROGRAMA PARA RESOLVER O PROBLEMA.	|
; |																					|
; | Recursos necess�rios n�o inclu�dos: DESCREVA AQUI QUALQUER REQUISITO DE			|
; | A tarefa que o programa n�o tenta resolver.										|
; |																					|
; | Erros conhecidos: SE O PROGRAMA N�O FUNCIONAR CORRETAMENTE EM ALGUNS			|
; |					  SITUA��ES, DESCREVA AS SITUA��ES E PROBLEMAS AQUI.			|
; |																					|
;  \===============================================================================/



.device atmega328P
.nolist
.list


;=============================
;Declaracoes
;Comece por 0x0100

.equ source_start = 0x0100
.equ source_end = 0x0164
.equ source_destination = 0x0200

.ORG 0x0000

	ldi xl, source_start % 0x0100 ; Origem
	ldi xh, source_start / 0x0100
	ldi yl, source_destination % 0x0100 ; Destino
	ldi yh, source_destination / 0x0100

	ldi r16, 0
	ldi r19, 0

	preencher:
		st x+, r16
		inc r16 ; valores preenchidos
		cpi xl, 0x64
		brne preencher
		cpi xh, 0x01
		brne preencher

	limpa:
		ldi xl, source_start % 0x0100 ; Reseta Origem
		ldi xh, source_start / 0x0100

	limite:
		ld r17, x+
		cpi xl, 0x65
		breq final
		mov r18, r17
		andi r18, 1
		breq limite
		st y+,r17
		inc r19 ; valores impares movidos
		rjmp limite
	
	final:
		cpi xh, 0x01
		brne limite

Fim:
	nop
	rjmp Fim

	
.EXIT

;PS: Professor, esse TP foi quase impossivel
;Este TP foi realizado em grupo com os integrantes: Ailton, Giovanna, Kevin, Lucas Komatsu e Manuel
