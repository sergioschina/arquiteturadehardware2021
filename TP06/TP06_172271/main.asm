;  /===============================================================================\
; | Projeto:  TP 06																	|	
; |																					|
; | Autor: GABRIEL NASCIMENTO DA SILVA												|
; | Idioma: ASSEMBLER - MICROSHIP STUDIO											|
; |																					|
; | Solu��o: TP06_172271															|
; |																					|
; | Projetos: TP06_172271															|
; |																					|
; | Para compilar: APERTE O BOT�O DE PLAY				                            |
; |																					|
; |Exemplo: Para compilar este c�digo, dever� ter o compilador AVRASM2.exe (windows)|
; | no prompt de comando (MS-DOS):													|
; |																					|
; |      avrasm2.exe -fI -o "TP06_172271.hex"										|
; |						 -m "TP06_172271.map"										|
; | 					 -l "TP06_172271.lss"										|	
; |						 -e "TP06_172271.eep"										|  
; |						 -S "TP06_172271.tmp"										|	  
; |						 -W+ie  -d "Debug\TP06_172271.obj"							|
; |						 main.asm													|
; |																					|
; | Software: MAIN																	|
; |																					|
; | Vers�o do SO: 7.0.2542															|
; |																					|
; | Plataforma: MICROSHIP STUDIO													|
; |																					|
; | Instrutor: SERGIO SCHINA DE ANDRADE												|
; |																					|
; | Data de vencimento: 23/04/2021													|
; |																					|
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

.ORG 0x000 
	
	rjmp INICIO

INICIO:
	ldi r16, 0x37
	ldi r18, 45
	ldi r19, 0b00111000
	ldi r20, 0x2B
	add r16, r18
	add r19, r20
	sub R16, r19
	nop
LOOP:
	rjmp LOOP
.EXIT