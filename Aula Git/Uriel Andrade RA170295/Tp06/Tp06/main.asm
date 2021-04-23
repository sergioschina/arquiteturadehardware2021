.device atmega328
.nolist
.list

.ORG 0x000 
	
	rjmp INICIO 

INICIO:

		ldi r17, 0x37
		ldi r18, 45
 		ldi r19, 0b00111000
		ldi r20, 0x2B
		add r17,r18 ; r17 = r17 + r18 = 100
		add r19,r20 ; r19 = r19 + r20 = 99
		sub r17,r19 ; r17 = r17 - r19 = 1
		nop ; 1 ciclo

LOOP:

	rjmp LOOP
	
.EXIT