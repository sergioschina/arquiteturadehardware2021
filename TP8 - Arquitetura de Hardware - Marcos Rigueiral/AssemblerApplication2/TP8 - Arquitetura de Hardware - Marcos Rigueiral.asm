
.equ source_start = 0x0100 ; posiçao inicial 256
.equ source_end = 0x164    ; posição final 320

.equ destination_start = 0x0200 ; posição inicial 512
.org 0x0000 

ldi xl,source_start % 0x0100 ; inicio dos dados de origem Xl=0x00
ldi xh,source_start / 0x0100 ;inicio dos dados de origem  Xh=0x01
ldi yl,destination_start % 0x0100 ; inicio dos dados de destino Yl=0x00
ldi yh,destination_start / 0x0100 ; inicio dos dados de destino Yh=0x02

ldi r16,0           ;carrega o r16 como zero


preenchimento:
st X+,r16 ;Guarda em X high o que tiver no r16 e move o X para o proximo endereço
inc r16   ;Incrementa r16
cpi xl,0x64 ;Compara se o valor 0x64 é igual a xl
brne preenchimento
cpi xh,0x01 ;Compara se o valor 0x01 é igual a xh
brne preenchimento


ldi xl,source_start % 0x0100 ; inicio dos dados de origem Xl=0x00
ldi xh,source_start / 0x0100 ;inicio dos dados de origem  Xh=0x01
  ;X = 0x0100 ==> forma de 16 bits


comparativo:
cpi xl,0x64 ;Compara se o valor 0x64 é igual a xl
brne validacao ;Vai pra rotina de gravar apenas se for impar
cpi xh,0x01 ;Compara se o valor 0x01 é igual a xh ; Compara se o valor 0x01 é igual a xh
breq fim ;Quando acabar os valores, pula ao fim do programa, caso contrario fara isso até o fim da memoria


validacao:

ld r16,X+ ;Coloco no r16 o endereço que esta no X
mov r17,r16 ; Copia r16 em r17, assim preservo r16 e uso r17 pro AND
andi r17,1 ; Comparo o r16 com 1, se for impar a flag zero ficara apagada, se nao ativara a flag zero
breq comparativo ;Se for par, sobe antes de gravar
st Y+,r16 ;Se for impar grava
brne comparativo ; Volta para verificar novamente


fim:
nop
rjmp fim
.exit