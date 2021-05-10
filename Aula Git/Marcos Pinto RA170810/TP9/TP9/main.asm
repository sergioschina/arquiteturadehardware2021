;
; TP9.asm
;
; Created: 10/05/2021 11:44:15
; Author : marca
;


; Replace with your application code
;.INCLUDE "m328pdef.inc"
.nolist
.list

start:
    rjmp INICIO
    .def temp = r16

    INICIO:
        ldi temp, 0b11111111
        out ddrb, r16

    restart:
        ldi r17, 0x00

    main:
        out portb, r17
        inc r17
        cpi r17,60
        breq restart
        rjmp main 
