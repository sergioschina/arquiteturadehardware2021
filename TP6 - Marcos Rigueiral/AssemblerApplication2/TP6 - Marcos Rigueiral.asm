;
; AssemblerApplication2.asm
;
; Created: 21/04/2021 16:10:49
; Author : Marcos Rigueiral
;


; Replace with your application code
;start:
;   inc r16
;  rjmp start

.INCLUDE "atmega328p.inc" 
.device	 atmega328P
.nolist
.list

; Declarações


.ORG 0x0000              ; inicialização de memória
    rjmp INICIO           
    ; variáveis. exemplo:
	;.def temp = r16
 
INICIO:
	  ldi r16,0x37 ; carregando valor $37 = 0x37 no registro r16 
	  ldi r17,45 ; carregando o valor $45 no registro r17 
	  ldi r18,0b00111000 ; carregando valor ob00111000 no registro r18 
	  ldi r19,0x2B

LOOP:
	  add r16,r17
	  add r18,r19
	  subi r16,r18

	  rcall delay

   rjmp LOOP                 

delay:
	  nop
	  ret
.EXIT 
