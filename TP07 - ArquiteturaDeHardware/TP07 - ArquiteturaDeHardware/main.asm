;  /===============================================================================\
; | Projeto:  TP 07  																|	
; |																					|
; | Autor: Álvaro Gochi de Sousa													|
; | Idioma: ASSEMBLER - MICROCHIP STUDIO                   							|
; |					                                                               	|
; | Solução: TP07_172158                                                			|
; |																					|
; | Projetos: TP07_172158           												|
; |																					|
; | Para compilar: Marcar o 'NOP' com BreakPoint selecionar o No Tool e EXECUTAR    |
; |																					|
; |Exemplo: Para compilar este código, deverá ter o compilador AVRASM2.exe (windows)|
; | no prompt de comando (MS-DOS):													|
; |																					|
; |      avrasm2.exe -fI -o "TP07 - ArquiteturaDeHardware.hex"						|
; |						 -m "TP07 - ArquiteturaDeHardware.map"		     			|
; | 					 -l "TP06 - ArquiteturaDeHardware.lss"						|	
; |						 -e "TP07 - ArquiteturaDeHardware.eep"						|  
; |						 -S "TP07 - ArquiteturaDeHardware.tmp"						|	  
; |						 -W+ie  -d "Debug\TP07 - ArquiteturaDeHardware.obj"			|
; |						 main.asm													|
; |																					|
; | Software: MAIN	                                                          		|
; |																					|
; | Versão do SO: 7.0.2542                                      					|
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
; | Descrição: DESCREVA O PROBLEMA DE QUE ESTE PROGRAMA FOI ESCRITO RESOLVER.		|
; |																					|
; | Entrada: DESCREVA A ENTRADA QUE O PROGRAMA EXIGE.								|
; |																					|
; | Saída: DESCREVA A SAÍDA QUE O PROGRAMA PRODUZ.									|
; |																					|
; | Algoritmo: ESBOÇO DA ABORDAGEM USADA PELO PROGRAMA PARA RESOLVER O PROBLEMA.	|
; |																					|
; | Recursos necessários não incluídos: DESCREVA AQUI QUALQUER REQUISITO DE			|
; | A tarefa que o programa não tenta resolver.										|
; |																					|
; | Erros conhecidos: SE O PROGRAMA NÃO FUNCIONAR CORRETAMENTE EM ALGUNS			|
; |					  SITUAÇÕES, DESCREVA AS SITUAÇÕES E PROBLEMAS AQUI.			|
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

	divisao1:
		mov r0, r19
		mov r1, r20
		rcall divisao2

	divisao2:
		sub r0, r1
		brlo divisao3
		inc r2
		rjmp divisao2

	divisao3:
		mov r19, r2

		sub r18, r19

		nop

LOOP:
    rjmp LOOP



.EXIT