;
; TP9.asm
;
; Created: 11/05/2021 20:40:48
; Author :Luís Eduardo
;

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
