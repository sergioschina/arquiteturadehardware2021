;  /===============================================================================\
; | Projeto:  TP05																	|	
; |																					|
; | Autor: Luís Eduardo Rodrigues													|
; | Idioma: NOME DA LÍNGUA EM QUE O PROGRAMA ESTÁ ESCRITO E							|
; |			O NOME DO COMPILADOR USADO PARA COMPILÁ-LO QUANDO FOI TESTADO			|
; | Solução: NOME DA SUA SOLUÇÃO ATMEL STUDIO 7 (Template neste exemplo)			|
; |																					|
; | Projetos: AssemblerTargetTeamplate												|
; |																					|
; | Para compilar: Explique como compilar este programa	                            |
; |																					|
; |Exemplo: Para compilar este código, deverá ter o compilador AVRASM2.exe (windows)|
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
; | Software: NOME E TÍTULO DA CLASSE PARA QUE ESTE PROGRAMA FOI ESCRITO			|
; |																					|
; | Versão do SO: SEU NÚMERO DE VERSÃO DO PROGRAMA DE COMPUTADOR					|
; |																					|
; | Plataforma: SEU PROGRAMA DE COMPUTADOR											|
; |																					|
; | Instrutor: NOME DO INSTRUTOR DO SEU CURSO										|
; |																					|
; | Data de vencimento: DATA E HORA EM QUE ESTE PROGRAMA É / DEVIA SER				|
; | SUBMETIDO																		|
; |																					|
; + --------------------------------------------------------------------------------+
; |																					|
; | Descrição: Pisca LED.															|
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


.INCLUDE "m328Pdef.inc"
.device atmega328P
.nolist
.list

;Declarações 
.ORG 0x000
    .def temp =r17
    rjmp INICIO

INICIO: 
        ldi temp, 0b00001111
        out ddrd, temp
    
LOOP:
        sbi portd,0
        rcall delay_1000ms
        cbi portd,0
        rcall delay_1000ms
        
    rjmp LOOP
    
    #include "delay1s.asm"
    
.EXIT 