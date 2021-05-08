.INCLUDE "atmega328p.inc" 
.device		atmega328P
.nolist
.list

.ORG 0x0000              
    rjmp INICIO          
       
INICIO:
	  ldi r16,2 
	  ldi r17,0b00101011 
	  ldi r18, 0b00110111 
	  ldi r19, 0x2D
LOOP:
	  mul r16,r17
	  div r18,r19
	  subi r16,r18

	  rcall delay

   rjmp LOOP         
   
   delay:
		nop
		ret        
.EXIT 
