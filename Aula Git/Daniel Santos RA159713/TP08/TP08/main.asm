start:

.equ cria = 0x0100
.equ fim = 0x0164
.equ rose = 0x0200
 
.org 0x0000
    ldi 	xl , cria % 256     ;   dados de origem
	ldi 	xh , cria / 256
	ldi 	yl , rose % 256     ; inicio dos dados de destino
	ldi 	yh , rose / 256
	

top: 
	 ld      r16,x+
	 ld      r18,x+
	 andi    r18,01
	 st      y+, r18
	 cpi     xl,(fim+1) % 256
	 brne    top
	 cpi     xh, (fim+1) / 256
	 brne    top


    rjmp start

	.EXIT