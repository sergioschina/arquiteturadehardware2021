;  /===============================================================================\
; | Projeto:  TP 06																	|	
; |																					|
; | Autor: Vinicius Franceschi								        				|
; | Idioma: ASSEMBLER - MICROSHIP STUDIO											|
; |																					|
; | Solução: TP06_152921															|
; |																					|
; | Projetos: TP06_152921															|
; |																					|
; | Para compilar: Colocar o BreaK Point no NOP e apertar o PLAY                    |
; |																					|
; |Exemplo: Para compilar este código, deverá ter o compilador AVRASM2.exe (windows)|
; | no prompt de comando (MS-DOS):													|
; |																					|
; |      avrasm2.exe -fI -o "TP06_152921.hex"										|
; |						 -m "TP06_152921.map"										|
; | 					 -l "TP06_152921.lss"										|	
; |						 -e "TP06_152921.eep"										|  
; |						 -S "TP06_152921.tmp"										|	  
; |						 -W+ie  -d "Debug\TP06_152921.obj"							|
; |						 main.asm													|
; |																					|
; | Software: MAIN																	|
; |																					|
; | Versão do SO: 7.0.2542															|
; |																					|
; | Plataforma: MICROCHIP STUDIO													|
; |																					|
; | Instrutor: SERGIO SCHINA DE ANDRADE												|
; |																					|
; | Data de vencimento: 23/04/2021													|
; |																					|
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