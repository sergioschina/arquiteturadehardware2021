.INCLUDE "m328Pdef.inc"
.device atmega328P
.nolist
.list


.ORG 0x0000
	jmp INICIO

INICIO:
   ;( 0x37 + 45) - ( 0b00111000 + 0x2B)

	 ldi r18,0x37 ; INSERE NO R18
	 ldi r19,45 ; INSERE NO R19
	 ldi r20,0b00111000 ; INSERE NO R20
	 ldi r21,0x2B ; INSERE NO R21

	 add r18,r19 ; SOMA R18 + R19
	 add r20,r21 ; SOMA R20 + R21
	 sub r18,r20 ; SUBTRAI R18 - R20
	 nop
	 ;R18 = 0X01
