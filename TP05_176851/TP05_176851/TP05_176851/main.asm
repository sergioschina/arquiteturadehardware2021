;  /===============================================================================\
; | Projeto: Pisca LED de 1 em 1 segundo											|
; |																					|
; | Autor: João Paulo Cardoso D`Oliveira											|
; |																					|
; | Idioma: Assembly																|
; |																					|
; | Solução: TP05_176851															|
; |																					|
; | Projetos: TP05_176851															|
; |																					|
; |      avrasm2.exe -fI -o "TP05_176851.hex"										|
; |						 -m "TP05_176851.map"										|
; | 					 -l "TP05_176851.lss"										|
; |						 -e "TP05_176851.eep"										|
; |						 -S "TP05_176851.tmp"										|
; |						 -W+ie  -d "Debug\TP05_176851.obj"							|
; |						 main.asm													|
; |																					|
; |																					|
; | Instrutor: Sergio Schina De Andrade												|
; |																					|
; + --------------------------------------------------------------------------------+
; |																					|
; | Descrição: Liga e desliga um LEG ligado ao microcontrolador ATMEGA328P com um 	|
; | intervalo de 1 segundo entre as ações.                                          |
; |																					|
; | Entrada: Nenhuma.																|
; |																					|
; | Saída: LED acende e apaga														|
; |																					|
; | Algoritmo: Delay feito através do comando nop que faz com que o processador não	|
; | execute comandos durante um ciclo. O número de ciclos necessários para criar um |
; | intervalo de um segundo foi calculado considerando um clock de 1 MHz.           |
; |																					|
; | Recursos necessários não incluídos: Circuito que foi feito no SimulIde			|
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
	
	rjmp INICIO ; indica a posicao de memoria inicial
	.def temp =r17

INICIO:

		ldi temp, 0b00001111 ;carreguei  os primeiro bits como 1, e 0 os 4 ultimos
		out ddrd, temp ; carreguei no registro de configuracao de direcao (data direction register) 4 primeiros pinos como saida, e o 4 ultimos como entrada

LOOP:
		;subrotinas de repeticao
		sbi portd,0  ; seria equivalente a isso portd = 0xXXXXXXX1
		rcall delay_1000ms;Chama subrotina
		cbi portd,0 ;seria equivalente a isso portb = 0xXXXXXXX0
		rcall delay_1000ms;Chama subrotina
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
		ret

;Considerando clock de 1  MHz
;1 ciclo = 1 us
;1 s = 1000000 us
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

;=============================
;Finalização do programa