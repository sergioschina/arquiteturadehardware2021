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



;.INCLUDE "m328Pdef.inc"
.device atmega328P
.nolist
.list


;=============================
;Declaracoes


.ORG 0x000 
	
	rjmp INICIO ; indica a posicao de memoria inicial
	.def temp =r17

INICIO:

		ldi temp, 0b00001111 ;carreguei  os primeiro bits como 1, e 0 os 4 ultimos
		out ddrb, temp ; carreguei no registro de configuracao de direcao (data direction register) 4 primeiros pinos como saida, e o 4 ultimos como entrada

LOOP:
		;subtonias de repeticao
		sbi portd,0  ; seria equivalente a isso portb = 0xXXXXXXX1
		rcall delay_1s;Chama subtorina
		cbi portd,0 ;seria equivalente a isso portb = 0xXXXXXXX0
		rcall delay_1s;Chama subtorina
	rjmp LOOP



delay_1s:
		push r17
		ldi r17,99
			delay1s1:
			rcall delay_1ms
			rcall delay_1ms
			rcall delay_1ms
			rcall delay_1ms
			rcall delay_1ms
			rcall delay_1ms
			rcall delay_1ms
			rcall delay_1ms
			rcall delay_1ms
			rcall delay_1ms
		dec r17
		brne delay1s1
		pop r17
		ret

delay_1ms:
		push r16;salva o valor em r16
		ldi r16,99;determina o valor de r16, que seriam quantas vezes ele vai ter que fazer o loop
		delay_1ms1: ;10us/loop
			nop; gasta 1 ciclo
			nop; gasta 1 ciclo
			nop; gasta 1 ciclo
			nop; gasta 1 ciclo
			nop; gasta 1 ciclo
			nop; gasta 1 ciclo
			nop; gasta 1 ciclo
			nop; gasta 1 ciclo
			nop; gasta 1 ciclo
			nop; gasta 1 ciclo
		dec r16
		brne delay_1ms1
		pop r16; retore value no r16
		ret


.EXIT

