;  /===============================================================================\
; | Projeto:  TP 07  																|	
; |																					|
; | Autor: Vinicius Franceschi  													|
; | Idioma: ASSEMBLER - MICROCHIP STUDIO                   							|
; |					                                                               	|
; | Solu��o: TP07 - 152921                                                			|
; |																					|
; | Projetos: TP07 - 152921           												|
; |																					|
; | Para compilar: Marcar o 'NOP' com BreakPoint selecionar o No Tool e EXECUTAR    |
; |																					|
; |Exemplo: Para compilar este c�digo, dever� ter o compilador AVRASM2.exe (windows)|
; | no prompt de comando (MS-DOS):													|
; |																					|
; |      avrasm2.exe -fI -o "TP07 - 152921.hex"										|
; |						 -m "TP07 - 152921.map"		     							|
; | 					 -l "TP06 - 152921.lss"										|	
; |						 -e "TP07 - 152921.eep"										|  
; |						 -S "TP07 - 152921.tmp"					                 	|	  
; |						 -W+ie  -d "Debug\TP07 - 152921.obj"            			|
; |						 main.asm													|
; |																					|
; | Software: MAIN	                                                          		|
; |																					|
; | Vers�o do SO: 7.0.2542                                      					|
; |																					|
; | Plataforma: MICROCHIP STUDIO        											|
; |																					|
; | Instrutor: SERGIO SCHINA DE ANDRADE     										|
; |																					|
; | Data de vencimento: 29/04/2021				                                    |
; |																		            |
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
;

.INCLUDE "m328Pdef.inc"
.device atmega328P
.nolist
.list

.ORG 0x000 

INICIO:

    ldi r18, 0b00101011
    ldi r19, 0b00110111
    ldi r20, 0x2D

	add r18, r18
	rcall div1

	sub r18, r19

	nop

LOOP:
    rjmp LOOP

	div1:
		mov r0, r19
		mov r1, r20
		rcall div2
		ret

	div2:
		sub r0, r1
		brlo div3
		inc r2
		rjmp div2

	div3:
		mov r19, r2
		ret

.EXIT