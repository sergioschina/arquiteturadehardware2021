;
; TP8.asm
; Author : Hammer Horror - Komatsu's PC.
; trabalho feito em grupo, pois estava bem dif�cil hehe 
; Ailton, Giovanna, Kevin, Lucas Komatsu e Manuel



 
;/////////////////    /////	       /////    //////////////////    //////////////////    //////////////////    ////    ////////////////    ///////		  ////	
;/////////////////    /////	 	   /////    //////////////////    //////////////////    //////////////////    ////    ////////////////    //// ///		  ////							
;/////		 /////    /////	 	   /////    /////			      /////						   ////		      ////    /////	     /////    ////  ///	      ////
;/////		 /////    /////		   /////    /////				  /////						   ////		      ////    /////	     /////    ////   ///      ////
;/////		 /////    /////	 	   /////    //////////////////	  //////////////////		   ////			  ////    /////	     /////    ////    ///	  ////
;/////		 /////    /////		   /////    //////////////////	  //////////////////		   ////			  ////    /////	     /////    ////     ///    ////
;/////		 /////    /////	 	   /////    /////					     	   /////		   ////			  ////    /////	     /////    ////      ///	  ////
;/////	///  /////    /////		   /////    /////							   /////		   ////			  ////    /////	     /////    ////	    ///   ////   
;/////	  ////////    /////		   /////    /////							   /////		   ////			  ////    /////	     /////    ////	     ///  ////	
;/////////////////    //////////////////    //////////////////	  //////////////////		   ////			  ////	  ////////////////    ////	      ////////
;/////////////////    //////////////////    //////////////////	  //////////////////		   ////			  ////	  ////////////////    ////		   ///////	


.device atmega328P
.nolist
.list



.equ source_start = 0x0100 // inicio do preenchimento
.equ source_end = 0x0164 // fim do preenchimento
.equ source_destination = 0x0200 // inicio do preenchimento dos valores �mpares

.ORG 0x0000

	ldi xl, source_start % 0x0100 
	ldi xh, source_start / 0x0100
	ldi yl, source_destination % 0x0100 
	ldi yh, source_destination / 0x0100

	ldi r16, 0 // quantidade de valores (todos)
	ldi r19, 0 // quantidade de valores (�mpares)

	preencher: //preencher� valores a partir do 0x0100
		st x+, r16 
		inc r16 // incrementar� r16 para termos a quantidade de valores (todos)
		cpi xl, 0x64
		brne preencher
		cpi xh, 0x01
		brne preencher

	limpa: // basicamente ir� declarar a vari�vel novamente para termos o valor inicial dela.
		ldi xl, source_start % 0x0100 
		ldi xh, source_start / 0x0100

	limite: // preencher� valores �mpares a partir do 0x0200
		ld r17, x+ 
		cpi xl, 0x65 // 1 n�mero a mais para podermos armazenar todos os valores �mpares.
		breq final 
		mov r18, r17 // preservar� o valor de r17
		andi r18, 1 // ver� se h� 1 no primeiro digito (ex: 0001), pois s� se tiver este digito o valor poder� ser �mpar.
		breq limite // se for par, rodar� novamente limite desde o in�cio. se for �mpar continuar� para a proxima linha
		st y+,r17 // armazena valor �mpar
		inc r19 // incrementar� r19 para termos a quantidade de valores (�mpares)
		rjmp limite // rodar� novamente limite para comparar os outros valores
	
	final:
		cpi xh, 0x01
		brne limite

Fim:
	nop
	rjmp Fim

	
.EXIT

