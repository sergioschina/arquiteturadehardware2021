;  /================================================================================\
; | Projeto: Resolução de uma equação matemática (TP07)								 |	
; |																					 |
; | Autor: João Paulo Cardoso D'Oliveira											 |
; | Idioma: ASSEMBLER																 |
; |																					 |
; | Solução: TP07_176851															 |
; |																					 |
; | Projetos: TP07_176851															 |
; |																					 |
; | Para compilar: Coloque um breakpoint em "nop" e observe na aba processor status  |
; |	para conseguir ver os resultados das operações e execute o programa no			 |
; |	microchip studio.																 |
; |																					 |
; |Exemplo: Para compilar este código, deverá ter o compilador AVRASM2.exe (windows) |
; | no prompt de comando (MS-DOS):													 |
; |																					 |
; |      avrasm2.exe -fI -o "TP07_176851.hex"										 |
; |						 -m "TP07_176851.map"										 |
; | 					 -l "TP07_176851.lss"										 |	
; |						 -e "TP07_176851.eep"										 |  
; |						 -S "TP07_176851.tmp"										 |	  
; |						 -W+ie  -d "Debug\TP07_176851.obj"							 |
; |						 main.asm													 |
; |																					 |
; | Software: TP07_176851/main.asm													 |
; |																					 |
; | Versão do SO: 7.0.2542															 |
; |																					 |
; | Plataforma: MICROSHIP STUDIO/Windows 10											 |
; |																					 |
; | Instrutor: SERGIO SCHINA DE ANDRADE												 |
; |																					 |
; | Data de vencimento: 30/04/2021													 |
; |																					 |
; |																					 |
; + ---------------------------------------------------------------------------------+
; |																					 |
; | Descrição: Resolver operações matématicas com valores binários, decimais e hexa. |
; |																					 |
; | Entrada: Valores da equação nos registradores r16 = 2, r17 = 0b00101011, 		 |
; |	r18 = 0b00110111 e r19 = 0x2D.													 |
; |																					 |
; | Saída: Resultado da equação (2*0b00101011)-( 0b00110111/0x2D) no registrador r17.|
; |																					 |
; | Algoritmo: Atribuição dos valores nos registradores e execução de operações 	 |
; |	matemáticas.																	 |
; |																					 |
; | Recursos necessários não incluídos: Nenhum.   									 |
; |																					 |
; | Erros conhecidos: Só é possível efetuar divisões com resultados inteiros.        |
; |																					 |
;  \================================================================================/



.INCLUDE "m328Pdef.inc"
.device atmega328P
.nolist
.list

.ORG 0x000 
	
	rjmp INICIO

INICIO:

	; ============Atribuição dos valores================
	ldi r16, 2
	ldi r17, 0b00101011
	ldi r18, 0b00110111
	ldi r19, 0x2D 

	; ============Operações Matemáticas==================
	; OBS: Decidi criar métodos genéricos para multiplicação e divisão 
	;	   (que funcionam pra quaisquer valores que forem colocados)

	rcall prepara_multiplicacao ; Método de multiplicação
	rcall prepara_divisao ; Método de divisão
	sub r17, r18 ; Resultado no r17
	nop

LOOP:
	rjmp LOOP

; ============Método que faz a divisão============
prepara_divisao:
	mov r0, r18 ; Atribui valor de r18 em r0
	mov r1, r19 ; Atribui valor de r19 em r1
	rcall divisao
	ret

divisao:
	sub r0, r1
	brlo fim_divisao ; Se r1 < r0 chama fim_divisao
	inc r2 ; Resultado da divisão é gerado em r2
	rjmp divisao
	ret

fim_divisao:
	mov r18, r2 ; Atribui valor de r2 em r18
	ret

; ============Método que faz a multiplicação============
prepara_multiplicacao:
	dec r16
	mov r3, r17
	multiplicacao:
		add r17,r3
		dec r16
		brne multiplicacao
	ret

; ============Fim do programa============
.EXIT
