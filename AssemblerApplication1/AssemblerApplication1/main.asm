;
; AssemblerApplication1.asm
;
; Created: 17/04/2021 13:28:04
; Author : Marcos Rigueiral
;


; Replace with your application code
; Arquivos de Definições 
	#INCLUDE <P16F877A.INC>
 
; Bits de Configuração 
 	__CONFIG _CP_OFF&_WDT_OFF&_PWRTE_ON&_XT_OSC 
 
; Paginação da Memória 
BANK0 MACRO ; Macro para selecionar o Banco 0 
 	BCF STATUS,RP0 
 	BCF STATUS,RP1 
 	ENDM ; Fim da macro 
BANK1 MACRO  
 	BSF STATUS,RP0 
 	BCF STATUS,RP1 
 	ENDM  
BANK2 MACRO 
 	BCF STATUS,RP0 
 	BSF STATUS,RP1 
 	ENDM 
BANK3 MACRO  
 	BSF STATUS,RP0 
 	BSF STATUS,RP1 
 	ENDM 
 
; Definição de variáveis 
 	CBLOCK 0x20 ; Endereço inicial do bloco de variáveis 
 	W_TEMP ;Registrador para salvar w 
 	STATUS_TEMP ;Registrador para salvar STATUS 
 	COUNTER ;Registrador para contador 
 	ENDC ; Fim do bloco de variáveis 
 
; Definição de constantes 
 	;MINIMO EQU .0 ; Valor da constante MINIMO 
 	 
; Entradas 
 	#DEFINE CHAVE PORTB,1 
 
; Saídas 
 	#DEFINE LED PORTD,7 
 	 
; Vetor de Reset 
 	ORG 0x00 	 	 	 	 
 	GOTO SETUP 
 
; Vetor de Interrupção 
 	ORG 0X04 
 	;Salvamento de Contexto 
 	MOVWF W_TEMP ;Salva w para W_TEMP 
 	SWAPF STATUS,W ;Salva STATUS com inversão de nibbles... evitar mudança em Z 
 	MOVWF STATUS_TEMP ;Envia para STATUS_TEMP 
 
 	;Tratamento da Interrupção 
 	BTFSS INTCON,TMR0IF ;Verifica se ocorreu estouro do Timer0 
 	GOTO FIM_INT ;Não, sai da interrupção 
 	BCF INTCON,TMR0IF ;Sim, limpa a flag 
 	 	 	 	 	 
 	MOVLW D'0' 	 	 	 	 	 	 
 	MOVWF TMR0 ;Timer0 = 256 - 0 = 256 
 	DECFSZ COUNTER,F ;Decrementa COUNTER. Chegou em zero? 
 	GOTO FIM_INT ;Não, desvia para saída da interrupção 
 
 	MOVLW D'76'  	 	 	 	 	 
 	MOVWF COUNTER ;COUNTER = 76 em decimal 
 	BCF INTCON,TMR0IE ; Desabilita interrupção 
 
 	BCF LED 
 
; -- Recupera Contexto (Saída da Interrupção) -- FIM_INT: 
 	SWAPF STATUS_TEMP,W ;Troca nibbles de STATUS_TEMP 
 	MOVWF STATUS ; Salva STATUS 
 	SWAPF W_TEMP,F ;Salva W_TEMP com nibbles invertidos  
 	SWAPF W_TEMP,W ;Salva W 
 	RETFIE ;Fim da interrupção 
 	 
SETUP: 
 	BANK1 ; Seleciona Banco1 
 	BCF TRISD,7 ;PORTD,7 output 
 	BSF TRISB,1 ;PORTB,1 input 
 	MOVLW B'10000111'  	 	 	 	 
 	MOVWF OPTION_REG ;Timer0 com clock interno. Prescaler 1:256 
 	MOVLW B'10000000'  	 	 	 	 
 	MOVWF INTCON ;Habilita GIE. Desabilita Timer0. A chave vai habilitar. 
 
 	BANK0 ; Seleciona Banco0 
 	MOVLW D'0' 	 	 	 	 	 	 
 	MOVWF TMR0 ;TMR0 = 256 - 0 = 256 em decimal 
 	MOVLW D'76'  	 	 	 	 	 
 	MOVWF COUNTER ;inicializa COUNTER em 76 decimal 
 	BCF LED 	 	 	 	 	 	 
 
MAIN: 
 	BTFSC CHAVE ;VERIFICA CHAVE 
 	GOTO MAIN 	 
 	GOTO TEMPORIZADOR;DESVIA PARA TEMPORIZADOR 
 
TEMPORIZADOR: 
 	BSF LED ;LIGA O LED 
 	BSF INTCON,TMR0IE ;HABILITA INTERRUPÇÃO DO TIMER0 
 	GOTO MAIN 
 
 	END 

