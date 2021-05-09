;
; TP8.asm
; Author : Hammer Horror - Komatsu's PC.
; trabalho feito em grupo, pois estava bem difícil hehe 
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
.equ source_destination = 0x0200 // inicio do preenchimento dos valores ímpares

.ORG 0x0000

	ldi xl, source_start % 0x0100 
	ldi xh, source_start / 0x0100
	ldi yl, source_destination % 0x0100 
	ldi yh, source_destination / 0x0100

	ldi r16, 0 // quantidade de valores (todos)
	ldi r19, 0 // quantidade de valores (ímpares)

	preencher: //preencherá valores a partir do 0x0100
		st x+, r16 
		inc r16 // incrementará r16 para termos a quantidade de valores (todos)
		cpi xl, 0x64
		brne preencher
		cpi xh, 0x01
		brne preencher

	limpa: // basicamente irá declarar a variável novamente para termos o valor inicial dela.
		ldi xl, source_start % 0x0100 
		ldi xh, source_start / 0x0100

	limite: // preencherá valores ímpares a partir do 0x0200
		ld r17, x+ 
		cpi xl, 0x65 // 1 número a mais para podermos armazenar todos os valores ímpares.
		breq final 
		mov r18, r17 // preservará o valor de r17
		andi r18, 1 // verá se há 1 no primeiro digito (ex: 0001), pois só se tiver este digito o valor poderá ser ímpar.
		breq limite // se for par, rodará novamente limite desde o início. se for ímpar continuará para a proxima linha
		st y+,r17 // armazena valor ímpar
		inc r19 // incrementará r19 para termos a quantidade de valores (ímpares)
		rjmp limite // rodará novamente limite para comparar os outros valores
	
	final:
		cpi xh, 0x01
		brne limite

Fim:
	nop
	rjmp Fim

	
.EXIT

