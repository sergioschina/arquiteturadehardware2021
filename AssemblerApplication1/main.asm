;
; AssemblerApplication1.asm
;
; Created: 17/04/2021 13:28:04
; Author : Marcos Rigueiral
;


; Replace with your application code
; Arquivos de Defini��es 
	#INCLUDE <P16F877A.INC>
 
; Bits de Configura��o 
 	__CONFIG _CP_OFF&_WDT_OFF&_PWRTE_ON&_XT_OSC 
 
; Pagina��o da Mem�ria 
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
 
; Defini��o de vari�veis 
 	CBLOCK 0x20 ; Endere�o inicial do bloco de vari�veis 
 	W_TEMP ;Registrador para salvar w 
 	STATUS_TEMP ;Registrador para salvar STATUS 
 	COUNTER ;Registrador para contador 
 	ENDC ; Fim do bloco de vari�veis 
 
; Defini��o de constantes 
 	;MINIMO EQU .0 ; Valor da constante MINIMO 
 	 
; Entradas 
 	#DEFINE CHAVE PORTB,1 
 
; Sa�das 
 	#DEFINE LED PORTD,7 
 	 
; Vetor de Reset 
 	ORG 0x00 	 	 	 	 
 	GOTO SETUP 
 
; Vetor de Interrup��o 
 	ORG 0X04 
 	;Salvamento de Contexto 
 	MOVWF W_TEMP ;Salva w para W_TEMP 
 	SWAPF STATUS,W ;Salva STATUS com invers�o de nibbles... evitar mudan�a em Z 
 	MOVWF STATUS_TEMP ;Envia para STATUS_TEMP 
 
 	;Tratamento da Interrup��o 
 	BTFSS INTCON,TMR0IF ;Verifica se ocorreu estouro do Timer0 
 	GOTO FIM_INT ;N�o, sai da interrup��o 
 	BCF INTCON,TMR0IF ;Sim, limpa a flag 
 	 	 	 	 	 
 	MOVLW D'0' 	 	 	 	 	 	 
 	MOVWF TMR0 ;Timer0 = 256 - 0 = 256 
 	DECFSZ COUNTER,F ;Decrementa COUNTER. Chegou em zero? 
 	GOTO FIM_INT ;N�o, desvia para sa�da da interrup��o 
 
 	MOVLW D'76'  	 	 	 	 	 
 	MOVWF COUNTER ;COUNTER = 76 em decimal 
 	BCF INTCON,TMR0IE ; Desabilita interrup��o 
 
 	BCF LED 
 
; -- Recupera Contexto (Sa�da da Interrup��o) -- FIM_INT: 
 	SWAPF STATUS_TEMP,W ;Troca nibbles de STATUS_TEMP 
 	MOVWF STATUS ; Salva STATUS 
 	SWAPF W_TEMP,F ;Salva W_TEMP com nibbles invertidos  
 	SWAPF W_TEMP,W ;Salva W 
 	RETFIE ;Fim da interrup��o 
 	 
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
 	BSF INTCON,TMR0IE ;HABILITA INTERRUP��O DO TIMER0 
 	GOTO MAIN 
 
 	END 

