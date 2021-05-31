;
; ProjetoP2.asm
;
;Nome: Manuel Cassiano Ferreira da Silva -- RA: 172152
;Projeto P2 -- Arquitetura de Hardware
; ?????????????, ?????? ?????????? ??ã?? ????????...

.INCLUDE "m328pdef.inc"

.def  temp =r16

    .org 0x000
    rjmp start

start:
    eor r1, r1
    out SREG, r1
    ldi temp, HIGH(RAMEND)
    out SPH, r16
    ldi temp, LOW(RAMEND)
    out SPL, r16

setup:
	ldi r17, 0b00000000
	out DDRC, r17
	ldi r17, 0b11111111
    out DDRD, r17
	ldi r17, 255
	out PORTD, r17

configADC0:
    LDI temp, 0x00
    STS ADMUX, temp

    LDI temp, (1<<ADEN)|(1<<ADPS0)|(1<<ADPS1)|(1<<ADPS2)
    STS ADCSRA, temp 

LOOP:
    LDS temp, ADCSRA
    ori temp, (1<<ADSC)
    STS ADCSRA, temp

adc_read_loop:
    lds temp, ADCSRA
    sbrc temp, ADSC   
    rjmp adc_read_loop

read_ADC_value: 
    lds r18, ADCL
    lds r19, ADCH

display_ADC_value:
	cpi r18, 5
	brne desliga
    rjmp acende

desliga:
	ldi r20, 0
	out portd, r20
	rjmp LOOP

acende:
	ldi r20, 255
	out portd, r20
	rjmp LOOP

; ?????????????, ?????? ?????????? ??ã?? ????????...