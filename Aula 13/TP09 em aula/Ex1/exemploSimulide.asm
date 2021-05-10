;.INCLUDE "atmega328p.inc"  ; seu arquivo principal de mapeamento das vari�veis   
;.device		atmega328p

.INCLUDE "m328pdef.inc"
.nolist
.list

;============
;Declarações:

;Exercicio1

.ORG 0x0000             
    rjmp INICIO           
        
	;Exemplo: 
	.def 	temp	=r16
 
INICIO:


	ldi r16,0xff
	out ddrb,r16
restart:
	ldi r17,0x00
top: 
	out portb,r17
	;rcall delay_sec
	inc r17
	cpi r17,60
	breq restart
	rjmp top