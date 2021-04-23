.INCLUDE "m328Pdef.inc"
.device atmega328P
.nolist
.list


.ORG 0x0000
	jmp INICIO

INICIO:
	
	 ; (2 * 0b00101011)  - ( 0b00110111 / 0x2D)

	 ldi r20,0b00101011 ; INSERE NO R20
	 add r20,r20 ; DOBRA R20
	 ldi r21,0b00110111 ; INSERE NO R21
	 ldi r22,0x2D; INSERE NO R22
	 mov r23,r21; DUPLICA O R21
	 clr r2 ; LIMPA R2
	 rcall divide ; FUNÇÃO DIVIDE
divide:
	
	sub r23,r22 ; SUBTRAI DIVIDENDO PELO DIVISOR
	brlo resto ; VERIFICA SE R23<R22 SE SIM ELE SAI
	inc r2 ; RESULTADO DA DIVISÃO +1
	jmp divide ; VOLTA EM LOOP
	
resto:
	sub r20,r2 ; SUBTRAI R20 - R2
	NOP
	;R20 = 0x55


