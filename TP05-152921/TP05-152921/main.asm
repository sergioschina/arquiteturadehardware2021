;  /===============================================================================\
; | Projeto: Pisca LED de 1 em 1 segundo											|	
; |																					|
; | Autor: Vinicius Franceschi          											|
; |																					|
; | Idioma: Assembly																|
; |																					|
; | Solução: TP05																	|
; |																					|
; | Projetos: TP05-152921           												|
; |																					|
; |      avrasm2.exe -fI -o "TP05-152921.hex"										|
; |						 -m "TP05-152921.map"										|
; | 					 -l "TP05-152921.lss"										|	
; |						 -e "TP05-152921.eep"										|  
; |						 -S "TP05-152921.tmp"										|	  
; |						 -W+ie  -d "Debug\TP05-152921.obj"							|
; |						 main.asm													|
; |																					|
; |																					|
; | Instrutor: Sergio Schina														|
; |																					|
; + --------------------------------------------------------------------------------+
; |																					|
; | Descrição: Liga e desliga um LEG ligado ao microcontrolador ATMEGA328P com um 	|
; | delay de 1 segundo.                                                             |
; |																					|
; | Entrada: Nenhuma.																|
; |																					|
; | Saída: LED acende e apaga														|
; |																					|
; | Algoritmo: Delay feito através do comando nop que faz com que o processador não	|
; | execute comandos durante um ciclo. O número de ciclos necessários para criar um |
; | intervalo de um segundo foi calculado considerando um clock de 1 MHz.           |
; |																					|
; | Recursos necessários não incluídos: Circuito que foi feito no SimulIde			|							|
; |																					|
; | Erros conhecidos: A mudança de clock causa alteração no intervalo e é um des-   |
; | -perdício manter o processador inutilizado para criar o delay com o comando nop.|
; |																					|
;  \===============================================================================/



.INCLUDE "m328Pdef.inc"
.device atmega328P
.nolist
.list


;=============================
;Declaracoes


.ORG 0x000 
	
	rjmp INICIO 
	.def temp =r17

INICIO:

		ldi temp, 0b00001111 
		out ddrd, temp 

LOOP:
		sbi portd,0  
		rcall delay_1000ms
		cbi portd,0 
		rcall delay_1000ms
	rjmp LOOP


;=============================
;Funções de delay


delay_1000ms:
		rcall delay_100ms
		rcall delay_100ms
		rcall delay_100ms
		rcall delay_100ms
		rcall delay_100ms
		rcall delay_100ms
		rcall delay_100ms
		rcall delay_100ms
		rcall delay_100ms
		rcall delay_100ms
		ret

delay_100ms:
		rcall delay_10ms
		rcall delay_10ms
		rcall delay_10ms
		rcall delay_10ms
		rcall delay_10ms
		rcall delay_10ms
		rcall delay_10ms
		rcall delay_10ms
		rcall delay_10ms
		rcall delay_10ms
		ret

delay_10ms:
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