;  /===============================================================================\
; | Projeto:  Exemplo Delay 1																|	
; |																					|
; | Autor: NOME DO ESTUDANTE AQUI													|
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



.device atmega328P
.nolist
.list


;=============================
;Declaracoes


.ORG 0x000 
	
	rjmp INICIO
	

INICIO:
		ldi r16, 0b00101011 ; 43
		mov r5, r16
		ldi r17, 0b00110111 ; 55
		ldi r18, 0x2D ; 45
		mov r0, r17
		mov r1, r18
		rcall divide
		lsl r5 ; multiplicação (43*2) = 86
		mov r19, r2 ; inteiro da divisão (55/45) = 1
		mov r20, r3 ; resto da divisão (55/45) = 10
		sub r5, r19 ; 86 - 1 = 85 (Resultado dos inteiros)
		; inteiros = 85
		; resto da divisão por 45 = 10
		; OBS: Resultado = inteiro - (resto/45) = 84.7778

LOOP:

	rjmp LOOP

divide:
	clr r2
	mov r4, r0
div_loop:
	sub r4,r1
	brlo div_sair
	inc r2
	rjmp div_loop
div_sair:
	add r4,r1
	mov r3,r4
	ret
	
.EXIT