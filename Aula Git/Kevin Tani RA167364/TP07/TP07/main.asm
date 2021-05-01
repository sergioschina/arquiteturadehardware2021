.device atmega328P
.nolist
.list

.ORG 0X000


    rjmp INICIO

INICIO:
	LDI r17, 0b00101011
	MOV r5, r17
	LSL r5
    LDI r16, 0b00110111
    MOV r0, r16
    LDI r16, 0x2D
    MOV r1, r16
    RCALL DIVIDE
	SUB r5, r2
LOOP:
    rjmp LOOP
DIVIDE:
    CLR r2 
    MOV r4,r0 
DIV_LOOP:
    SUB r4,r1
    BRLO DIV_SAIR
    INC r2 
    RJMP DIV_LOOP
DIV_SAIR:
    ADD r4, r1
    MOV r3, r4
    RET
