;  /===============================================================================\
; | Projeto:  TPSubstituto (TPsub) - FIFO											|	
; |																					|
; | Autor: Gustavo Gouveia Alvarez													|
; | Idioma: Assembly																|
; |	Compilado com: Microchip Studio IDE												|
; | Solução: TPExtra																|
; |																					|																				
; | SO: Windows 10																	|
; |																					|
; | Plataforma: Microchip Studio IDE												|
; |																					|
; | Professor: Sérgio Schina de Andrade												|
; |																					|
; | Data de vencimento: 28/05/2021													|
; |																					|
; + --------------------------------------------------------------------------------+
; |																					|
; | Descrição: Utilizando conceitos de stacks, programar uma stack do tipo FIFO		|
; |																					|
; | Observações: Devem ser realizadas checagens para que:							|
; |		- O espaço de memória disponível não é excedido (a cabeça corre na cauda).	|
; |		- Não são retirados muitos itens da pilha (a cauda passa pela cabeça).		|
; |		- Quando um ponteiro atinge o final do intervalo de memória linear, ele		|
; |		precisa envolver o outro extremo da memória. Isso faz uma região linear		| 
; |		parecer uma região circular.												|
; |																					|
; | Entrada: Atribuição de valores em código (sem input)							|
; |																					|
; | Saída: ---																		|
;  \===============================================================================/


;	Observações:
;
;	Professor, tive dificuldade quanto ao uso do pop e do push para a aplicação do conceito de pilha FIFO, pois
;  não consegui fazer funcionarem com ponteiros diferentes do StackPointer, então decidi criar macros para
;  substituir essas funções.


.INCLUDE "atmega328p.inc"
.DEVICE atmega328P
.nolist
.list

.equ val_inicio = 0x08FF						; Label que armazena o endereço do início da pilha
.equ val_fim = 0x08F5							; Label com o endereço limite estabelecido para a pilha (10 valores)
												; Obs.: A pilha vai de 0x08FE até 0x08F5 (decrescendo)

;=============== MACROS ===============

.macro pushFIFO									; A macro pushFIFO tem a função de inserir o valor de val_entrada na pilha com
	st -x, @0									;pré decremento, indo do maior endereço disponível para o menor. A partir
	inc val_pushes								;do momento em que um dado é colocado, um incremento no valor de val_pushes
.endmacro										;é chamado, para assim ganharmos controle da quantidade de pushes atuais.

.macro popFIFO									; Já na macro popFIFO, o valor que está no endereço y (tail) é carregado em
	ld @0, -y									;val_saida, e em seguida o valor no endereço é substituído pelo valor zero.
	st y, val_zero								;Assim como na macro anterior, ao fim temos outro incremento, agora em
	inc val_pops								;val_pops, para armazenar a quantidade de pushes.
.endmacro

.macro checagem									; Nesta última macro, checagem, os contadores val_pushes e val_pops são chamados 
	cpi @0, 11									;conforme necessários para que sejam verificados casos de overflow ou underflow.
	brne valido									;Vale ressaltar que, como a quantidade de dados sendo inseridos foram previamente
	invalido:									;estipulados, não teremos esse problema.
		jmp erro
	valido:
		nop
.endmacro

;======================================			; Nas linhas a seguir temos as definições dos nomes referentes aos registradores
.ORG 0x000										;que serão usados no código, segue uma breve descrição de cada:

	.def val_entrada = r16						; val_entrada	-> armazena o valor que será inserido na cabeça (head) da pilha 
	.def val_saida = r19						; val_saida		-> armazena o valor que é recebido na macro popFIFO
	.def val_pushes = r17						; val_pushes	-> contador que armazena a quantidade de pushes já realizados
	.def val_pops = r18							; val_pops		->    "      "     "     "      "     de pops já realizados
	.def val_zero = r23							; val_zero		-> armazena o valor 0 para ser utilizado dentro da macro.
;======================================

	inicio:
		ldi xl, val_inicio % 0x0100				; Inicialização dos dados referentes a cabeça (head) e a cauda (tail), respectivamente,
		ldi xh, val_inicio / 0x0100				;nas linhas a seguir.
		ldi yl, val_inicio % 0x0100	
		ldi yh, val_inicio / 0x0100 
	
		ldi val_entrada, 1
		ldi val_zero, 0
		ldi val_pops, 0
		ldi val_pushes, 0

	adicionaValores:							; No loop adicionaValores será realizada a inserção dos dados na pilha, e assim que a
		pushFIFO val_entrada					;execução da macro pushFIFO for finalizada o valor do contador val_entrada será
		inc val_entrada							;incrementado.

		checagem val_pushes						; Chamada da macro checagem, passando como argumento o contador val_pushes.

		cpi xl, val_fim % 0x0100				; Nesta passagem o endereço atual de x será comparado com o endereço final (0x08F5), e caso
		brne adicionaValores					;sejam iguais será entendido que todos os valores foram preenchidos e a execução avançará 
		cpi xh, val_fim / 0x0100				;para a retirada dos valores com o popFIFO.
		brne adicionaValores


	removeValores:								; Este loop, removeValores, se assemelha muito nas instruções utilizadas no loop anterior,
		cpi val_pushes, 0						;porém neste momento os valores serão retirados com o uso da macro popFIFO, mas antes será
		brlt erro								;checado o contador val_pushes, caso o mesmo seja 0 será entendido que não existem valores
												;para serem retirados, sendo assim será lançado um erro (no caso, encerrará a execução).
		popFIFO val_saida

		checagem val_pops						; Macro checagem sendo chamada novamente, desta vez passando como argumento val_pops.

		cpi yl, val_fim % 0x0100				; O endereço atual de y será comparado, também, com o endereço final (0x08F5). Caso sejam
		brne removeValores						;iguais a execução irá prosseguir.
		cpi yh, val_fim / 0x0100	
		brne removeValores


	rjmp inicio									; Fim da execução. Ao chegar aqui, a execução será reiniciada.

	erro:										; Caso algum erro nas checagens seja detectado, a execução virá até este loop, encerrando
		nop										;a mesma.

	nop											; Usado para facilitar a visualização (breakpoint)