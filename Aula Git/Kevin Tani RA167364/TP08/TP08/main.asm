;Este TP foi realizado em grupo com os integrantes: Ailton, Giovanna, Kevin, Lucas Komatsu e Manuel

.device atmega328P
.nolist
.list

.equ source_start = 0x0100
.equ source_end = 0x0164
.equ source_destination = 0x0200

.ORG 0x0000

	ldi xl, source_start % 0x0100 ;Origem
	ldi xh, source_start / 0x0100
	ldi yl, source_destination % 0x0100 ;Destino
	ldi yh, source_destination / 0x0100

	ldi r16, 0
	ldi r19, 0

	preenche:
		st x+, r16
		inc r16 ; valores preenchidos
		cpi xl, 0x64
		brne preenche
		cpi xh, 0x01
		brne preenche

	limpa:
		ldi xl, source_start % 0x0100 ;Reseta Origem
		ldi xh, source_start / 0x0100

	limite:
		ld r17, x+
		cpi xl, 0x65
		breq final
		mov r18, r17
		andi r18, 1
		breq limite
		st y+,r17
		inc r19 ;Valores ímpares movidos
		rjmp limite
	
	final:
		cpi xh, 0x01
		brne limite

Fim:
	nop
	rjmp Fim

.EXIT
