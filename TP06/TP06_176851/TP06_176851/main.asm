;  /================================================================================\
; | Projeto: Resolu��o de uma equa��o matem�tica (TP06)								 |	
; |																					 |
; | Autor: Jo�o Paulo Cardoso D'Oliveira											 |
; | Idioma: ASSEMBLER																 |
; |																					 |
; | Solu��o: TP06_176851															 |
; |																					 |
; | Projetos: TP06_176851															 |
; |																					 |
; | Para compilar: Coloque um breakpoint em "nop" e observe na aba processor status  |
; |	para conseguir ver os resultados das opera��es e execute o programa no			 |
; |	microchip studio.																 |
; |																					 |
; |Exemplo: Para compilar este c�digo, dever� ter o compilador AVRASM2.exe (windows) |
; | no prompt de comando (MS-DOS):													 |
; |																					 |
; |      avrasm2.exe -fI -o "TP06_176851.hex"										 |
; |						 -m "TP06_176851.map"										 |
; | 					 -l "TP06_176851.lss"										 |	
; |						 -e "TP06_176851.eep"										 |  
; |						 -S "TP06_176851.tmp"										 |	  
; |						 -W+ie  -d "Debug\TP06_176851.obj"							 |
; |						 main.asm													 |
; |																					 |
; | Software: TP06_176851/main.asm													 |
; |																					 |
; | Vers�o do SO: 7.0.2542															 |
; |																					 |
; | Plataforma: MICROSHIP STUDIO/Windows 10											 |
; |																					 |
; | Instrutor: SERGIO SCHINA DE ANDRADE												 |
; |																					 |
; | Data de vencimento: 23/04/2021													 |
; |																					 |
; |																					 |
; + ---------------------------------------------------------------------------------+
; |																					 |
; | Descri��o: Resolver opera��es mat�maticas com valores bin�rios, decimais e hexa. |
; |																					 |
; | Entrada: Valores da equa��o nos registradores r16 = 0x37, r16 = 45, 			 |
; |	r17 = 0b00111000 e r18 = 0x2B.													 |
; |																					 |
; | Sa�da: Resultado da equa��o (0x37 + 45) - (0b00111000 + 0x2B) no registrador r16.|
; |																					 |
; | Algoritmo: Atribui��o dos valores nos registradores e execu��o de opera��es 	 |
; |	matem�ticas.																	 |
; |																					 |
; | Recursos necess�rios n�o inclu�dos: Nenhum.   									 |
; |																					 |
; | Erros conhecidos: Nenhum.														 |
; |																					 |
;  \================================================================================/



.INCLUDE "m328Pdef.inc"
.device atmega328P
.nolist
.list

.ORG 0x000 
	
	rjmp INICIO

INICIO:

	; ============Atribui��o dos valores================

	ldi r16, 0x37 ; r16 = 0x37(Hexadecimal) = 55(Decimal)
	ldi r17, 45 ; r17 = 45(Decimal)
	ldi r18, 0b00111000 ; r18 = 0b00111000(Bin�rio) = 56(Decimal)
	ldi r19, 0x2B ; r19 = 0x2B(Hexadecimal) = 43(Decimal)

	; ============Opera��es Matem�ticas==================

	add r16, r17 ; r16 = r16 + r17
	add r18, r19 ; r18 = r18 + r19

	; Resultado Final
	sub r16, r18 ; r16 = r16 - r18 = 0x01(Hexadecimal) = 1(Decimal)

	nop

LOOP:
	rjmp LOOP

.EXIT

