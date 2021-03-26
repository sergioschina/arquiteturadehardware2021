.INCLUDE "atmega328p.inc"   
.device		atmega328P
.nolist
.list




.ORG 0x0000   
    rjmp INICIO   
	.def	temp	=r16
 
INICIO:
      ldi temp, 0b11111111
	  out DDRB, temp
      ldi temp, 0b11111111
	  out DDRC, temp
	  ldi temp, 0b11111111
	  out DDRD, temp
LOOP:
      ldi temp, 0b00001111
	  out PORTB, temp
	  ldi temp, 0b11110000
	  out PORTB, temp
	  ldi temp, 0b00001111
	  out PORTC, temp
	  ldi temp, 0b11110000
	  out PORTC, temp
	  ldi temp, 0b00001111
	  out PORTD, temp
	  ldi temp, 0b11110000
	  out PORTD, temp
   rjmp LOOP                 
      
.EXIT 