;
; CAIO170754_TP05.asm
;
; Created: 17/04/2021 11:46:59
; Author : caiof
;


; Replace with your application code

.device atmega328P
.nolist
.list

; Comentário

;Declarações 
.ORG 0x000
    .def temp =r17
    rjmp INICIO

INICIO: 
        ldi temp, 0b00001111
        out ddrd, temp
    
LOOP:
        sbi portd,0
        rcall delay_1s
        cbi portd,0
        rcall delay_1s
        
    rjmp LOOP
    
    #include "delay.asm"
    
.EXIT
