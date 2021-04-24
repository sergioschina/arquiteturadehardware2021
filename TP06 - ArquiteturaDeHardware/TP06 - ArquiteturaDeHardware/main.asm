;  /===============================================================================\
; | Projeto:  TP 06  																|	
; |																					|
; | Autor: Álvaro Gochi de Sousa													|
; | Idioma: ASSEMBLER - MICROCHIP STUDIO                   							|
; |					                                                               	|
; | Solução: TP06_172158                                                			|
; |																					|
; | Projetos: TP06_172158           												|
; |																					|
; | Para compilar: Marcar o 'NOP' com BreakPoint selecionar o No Tool e EXECUTAR    |
; |																					|
; |Exemplo: Para compilar este código, deverá ter o compilador AVRASM2.exe (windows)|
; | no prompt de comando (MS-DOS):													|
; |																					|
; |      avrasm2.exe -fI -o "TP06 - ArquiteturaDeHardware.hex"						|
; |						 -m "TP06 - ArquiteturaDeHardware.map"		     			|
; | 					 -l "TP06 - ArquiteturaDeHardware.lss"						|	
; |						 -e "TP06 - ArquiteturaDeHardware.eep"						|  
; |						 -S "TP06 - ArquiteturaDeHardware.tmp"						|	  
; |						 -W+ie  -d "Debug\TP06 - ArquiteturaDeHardware.obj"			|
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
; | Data de vencimento: DATA E HORA EM QUE ESTE PROGRAMA É / DEVIA SER				|
; | SUBMETIDO																		|
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
	
	rjmp INICIO

INICIO:

	ldi r17, 0x37
    ldi r18, 45
    ldi r19, 0b00111000
    ldi r20, 0x2B
    add r17, r18
    add r19, r20
    sub r17, r19

    nop

LOOP:
    rjmp LOOP

.EXIT