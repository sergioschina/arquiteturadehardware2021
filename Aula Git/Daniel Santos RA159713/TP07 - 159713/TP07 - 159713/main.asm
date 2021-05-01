
.device atmega328P
.nolist
.list


.org 0x0000
	rjmp INICIO


INICIO:

	clr r16;
	ldi r16,0b00101011;
	lsl r16 ;A multiplicação por 2 é feita deslocando todos os bits à esquerda e escrevendo um zero no bit menos significativo
	ldi r18,0b00110111
	ldi r19,0x2D
	
	sub r16,r18


.EXIT
