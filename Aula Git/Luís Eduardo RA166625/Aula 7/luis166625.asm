.INCLUDE "atmega328p.inc"  ; seu arquivo principal de mapeamento das vari�veis   
.device        atmega328P
.nolist
.list

;============
;Declara��es:



.ORG 0x0000              ; instru��o inicial, � onde se inicia a mem�ria de programa
    rjmp INICIO           ; O vetor de rein�cio: pula para �main�
      ;**coloque suas vari�veis e declara��es aqui**   
    ;Exemplo: 
    .def    temp    =r16
 
INICIO:
      ;**c�digo principal vai aqui, inicializa��es e etc...**
      ldi temp,0b11111111
      out DDRB, temp

      ldi temp,0b11111111
      out DDRC, temp

      ldi temp,0b11111111
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

      ;* rotinas de repeti��o *
   rjmp LOOP                 
      ;**seus procedimentos de atua��o finitas v�o aqui aqui o  programa vai finalizar no final**
.EXIT