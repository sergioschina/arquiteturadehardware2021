;  /===============================================================================\
; | Projeto:  TP08_186766															|	
; |																					|
; | Autor: Gustavo Gouveia Alvarez													|
; | Idioma: Assembly																|
; |	Compilado com: Microchip Studio IDE												|
; | Solução: TP08_186766															|
; |																					|																				
; | SO: Windows 10																	|
; |																					|
; | Plataforma: Microchip Studio IDE												|
; |																					|
; | Professor: Sérgio Schina de Andrade												|
; |																					|
; | Data de vencimento: 08/05/21													|
; |																					|
; + --------------------------------------------------------------------------------+
; |																					|
; | Descrição: com uma variável,  começando pelo endereço 0x0100 com o valor 0, com |
; | passo de  1 ( ou seja,  "registro + 1"), preencha os espaços de memórias até o  | 
; | endereço 0x0164. Em seguida transporte todos os números impares a partir do     |
; | endereço de memória 0x0200.														|
; |																					|
; | Entrada: Atribuição de valores em código (sem input)							|
; |																					|
; | Saída: ---																		|
;  \===============================================================================/

.INCLUDE "atmega328p.inc"
.DEVICE atmega328P
.nolist
.list

										;   As quatro labels declaradas em sequência foram utilizadas para as seguintes finalidades:
.equ val_atr = 0x0						; - Contador que será incrementado para ser utilizado na atribuição dos valores no preenchimento a seguir.
.equ geral_inicio = 0x0100				; - Endereços de início/fim dos espaços relativos as atribuições iniciais (1, ..., 100).
.equ geral_fim = 0x0164					; -	"""
.equ impar_inicio = 0x0200				; - Endereço de início dos novos espaços dedicados aos valores ímpares.


;================================
.ORG 0x000 

	ldi yl, impar_inicio % 0x0100		;  Inicialização dos dados referentes ao destino nas duas linhas seguintes.
	ldi yh, impar_inicio / 0x0100

preencher:								
	ldi r17, val_atr					
	ldi xl, geral_inicio % 0x0100		;  No segmento "preencher", primeiramente o valor da label val_atr vai ser carregado em r17, e logo em seguida
	ldi xh, geral_inicio / 0x0100		; os dados de origem serão devidamente inicializados em xl e xh, para então seguir para a parte "guardar".
guardar:
	st x+, r17
	inc r17								;  Neste 'loop' será feita a atribuição do valor contido em r17 para o endereço na qual está o ponteiro. Logo
	cpi xl, (geral_fim+1) % 0x0100		; em seguida o endereço atual será comparado com o endereço final (0x0164), e caso sejam iguais será entendido
	brne guardar						; que todos os valores foram preenchidos e a execução avançará para o transporte dos valores.
	cpi xh, (geral_fim+1) / 0x0100
	brne guardar



ldi xl, geral_inicio % 0x0100			;  Como os endereços de início foram manipulados nas atribuições iniciais, será necessário carregar novamente
ldi xh, geral_inicio / 0x0100			; os endereços iniciais em xl e xh.

transloc:								;  Em "transloc" r18 receberá o valor contido no endereço apontado por x (em pós incremento), e em seguida será
	ld r18, x+							; realizada a instrução SBRS, que testa um único bit de um valor armazenado dentro de um registrador, caso o
	sbrs r18, 0							; o mesmo esteja setado, a instrução seguinte (rjmp transloc) será ignorada. Isso é feito para que somente os
	rjmp transloc						; valores ímpares sejam selecionados para a movimentação, sabendo que estes números, em bínario, sempre possuem 
	rjmp num_impar						; seu bit 0 setado.
num_impar:
	st y+, r18
	cpi xl, (geral_fim+1) % 0x0100		;  Por fim, assim que um número ímpar for computado a execução será dirigida a seção "num_impar", que por sua 
	brne transloc						; vez vai armazenar esse valor nos endereços a partir daquele setado na label inicial impar_inicio
	cpi xh, (geral_fim+1) / 0x0100
	brne transloc

nop										; 'nop' usado a fim de facilitar a visualização do resultado.
.EXIT