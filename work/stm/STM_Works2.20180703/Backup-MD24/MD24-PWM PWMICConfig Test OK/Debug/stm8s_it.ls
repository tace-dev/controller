   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  50                     ; 59 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  50                     ; 60 {
  51                     .text:	section	.text,new
  52  0000               f_NonHandledInterrupt:
  56                     ; 64 }
  59  0000 80            	iret	
  81                     ; 72 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  81                     ; 73 {
  82                     .text:	section	.text,new
  83  0000               f_TRAP_IRQHandler:
  87                     ; 77 }
  90  0000 80            	iret	
 112                     ; 84 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 112                     ; 85 
 112                     ; 86 {
 113                     .text:	section	.text,new
 114  0000               f_TLI_IRQHandler:
 118                     ; 90 }
 121  0000 80            	iret	
 143                     ; 97 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 143                     ; 98 {
 144                     .text:	section	.text,new
 145  0000               f_AWU_IRQHandler:
 149                     ; 102 }
 152  0000 80            	iret	
 174                     ; 109 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 174                     ; 110 {
 175                     .text:	section	.text,new
 176  0000               f_CLK_IRQHandler:
 180                     ; 114 }
 183  0000 80            	iret	
 206                     ; 121 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 206                     ; 122 {
 207                     .text:	section	.text,new
 208  0000               f_EXTI_PORTA_IRQHandler:
 212                     ; 126 }
 215  0000 80            	iret	
 238                     ; 133 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 238                     ; 134 {
 239                     .text:	section	.text,new
 240  0000               f_EXTI_PORTB_IRQHandler:
 244                     ; 138 }
 247  0000 80            	iret	
 270                     ; 145 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 270                     ; 146 {
 271                     .text:	section	.text,new
 272  0000               f_EXTI_PORTC_IRQHandler:
 276                     ; 150 }
 279  0000 80            	iret	
 302                     ; 157 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 302                     ; 158 {
 303                     .text:	section	.text,new
 304  0000               f_EXTI_PORTD_IRQHandler:
 308                     ; 162 }
 311  0000 80            	iret	
 334                     ; 169 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 334                     ; 170 {
 335                     .text:	section	.text,new
 336  0000               f_EXTI_PORTE_IRQHandler:
 340                     ; 174 }
 343  0000 80            	iret	
 365                     ; 221 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 365                     ; 222 {
 366                     .text:	section	.text,new
 367  0000               f_SPI_IRQHandler:
 371                     ; 226 }
 374  0000 80            	iret	
 398                     ; 233 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 398                     ; 234 {
 399                     .text:	section	.text,new
 400  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 402  0000 8a            	push	cc
 403  0001 84            	pop	a
 404  0002 a4bf          	and	a,#191
 405  0004 88            	push	a
 406  0005 86            	pop	cc
 407  0006 3b0002        	push	c_x+2
 408  0009 be00          	ldw	x,c_x
 409  000b 89            	pushw	x
 410  000c 3b0002        	push	c_y+2
 411  000f be00          	ldw	x,c_y
 412  0011 89            	pushw	x
 415                     ; 238 	OnCaptureOVTim2();
 417  0012 cd0000        	call	_OnCaptureOVTim2
 419                     ; 239 }
 422  0015 85            	popw	x
 423  0016 bf00          	ldw	c_y,x
 424  0018 320002        	pop	c_y+2
 425  001b 85            	popw	x
 426  001c bf00          	ldw	c_x,x
 427  001e 320002        	pop	c_x+2
 428  0021 80            	iret	
 452                     ; 246 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 452                     ; 247 {
 453                     .text:	section	.text,new
 454  0000               f_TIM1_CAP_COM_IRQHandler:
 456  0000 8a            	push	cc
 457  0001 84            	pop	a
 458  0002 a4bf          	and	a,#191
 459  0004 88            	push	a
 460  0005 86            	pop	cc
 461  0006 3b0002        	push	c_x+2
 462  0009 be00          	ldw	x,c_x
 463  000b 89            	pushw	x
 464  000c 3b0002        	push	c_y+2
 465  000f be00          	ldw	x,c_y
 466  0011 89            	pushw	x
 469                     ; 251 	OnCaptureTim2();
 471  0012 cd0000        	call	_OnCaptureTim2
 473                     ; 253 }
 476  0015 85            	popw	x
 477  0016 bf00          	ldw	c_y,x
 478  0018 320002        	pop	c_y+2
 479  001b 85            	popw	x
 480  001c bf00          	ldw	c_x,x
 481  001e 320002        	pop	c_x+2
 482  0021 80            	iret	
 506                     ; 286 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 506                     ; 287 {
 507                     .text:	section	.text,new
 508  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 510  0000 8a            	push	cc
 511  0001 84            	pop	a
 512  0002 a4bf          	and	a,#191
 513  0004 88            	push	a
 514  0005 86            	pop	cc
 515  0006 3b0002        	push	c_x+2
 516  0009 be00          	ldw	x,c_x
 517  000b 89            	pushw	x
 518  000c 3b0002        	push	c_y+2
 519  000f be00          	ldw	x,c_y
 520  0011 89            	pushw	x
 523                     ; 291 	OnCaptureOVTim2();
 525  0012 cd0000        	call	_OnCaptureOVTim2
 527                     ; 292 }
 530  0015 85            	popw	x
 531  0016 bf00          	ldw	c_y,x
 532  0018 320002        	pop	c_y+2
 533  001b 85            	popw	x
 534  001c bf00          	ldw	c_x,x
 535  001e 320002        	pop	c_x+2
 536  0021 80            	iret	
 560                     ; 304 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 560                     ; 305 {
 561                     .text:	section	.text,new
 562  0000               f_TIM2_CAP_COM_IRQHandler:
 564  0000 8a            	push	cc
 565  0001 84            	pop	a
 566  0002 a4bf          	and	a,#191
 567  0004 88            	push	a
 568  0005 86            	pop	cc
 569  0006 3b0002        	push	c_x+2
 570  0009 be00          	ldw	x,c_x
 571  000b 89            	pushw	x
 572  000c 3b0002        	push	c_y+2
 573  000f be00          	ldw	x,c_y
 574  0011 89            	pushw	x
 577                     ; 309 	OnCaptureTim2();
 579  0012 cd0000        	call	_OnCaptureTim2
 581                     ; 311 }
 584  0015 85            	popw	x
 585  0016 bf00          	ldw	c_y,x
 586  0018 320002        	pop	c_y+2
 587  001b 85            	popw	x
 588  001c bf00          	ldw	c_x,x
 589  001e 320002        	pop	c_x+2
 590  0021 80            	iret	
 613                     ; 348 INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 613                     ; 349 {
 614                     .text:	section	.text,new
 615  0000               f_UART1_TX_IRQHandler:
 619                     ; 353 }
 622  0000 80            	iret	
 645                     ; 360 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 645                     ; 361 {
 646                     .text:	section	.text,new
 647  0000               f_UART1_RX_IRQHandler:
 651                     ; 365 }
 654  0000 80            	iret	
 676                     ; 373 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 676                     ; 374 {
 677                     .text:	section	.text,new
 678  0000               f_I2C_IRQHandler:
 682                     ; 378 }
 685  0000 80            	iret	
 707                     ; 452 INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 707                     ; 453 {
 708                     .text:	section	.text,new
 709  0000               f_ADC1_IRQHandler:
 713                     ; 457 }
 716  0000 80            	iret	
 740                     ; 479 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 740                     ; 480 {
 741                     .text:	section	.text,new
 742  0000               f_TIM4_UPD_OVF_IRQHandler:
 744  0000 8a            	push	cc
 745  0001 84            	pop	a
 746  0002 a4bf          	and	a,#191
 747  0004 88            	push	a
 748  0005 86            	pop	cc
 749  0006 3b0002        	push	c_x+2
 750  0009 be00          	ldw	x,c_x
 751  000b 89            	pushw	x
 752  000c 3b0002        	push	c_y+2
 753  000f be00          	ldw	x,c_y
 754  0011 89            	pushw	x
 757                     ; 484 	OnTimer4();
 759  0012 cd0000        	call	_OnTimer4
 761                     ; 485 }
 764  0015 85            	popw	x
 765  0016 bf00          	ldw	c_y,x
 766  0018 320002        	pop	c_y+2
 767  001b 85            	popw	x
 768  001c bf00          	ldw	c_x,x
 769  001e 320002        	pop	c_x+2
 770  0021 80            	iret	
 804                     ; 493 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 804                     ; 494 {
 805                     .text:	section	.text,new
 806  0000               f_EEPROM_EEC_IRQHandler:
 808       00000001      OFST:	set	1
 811                     ; 499 	i = 0;
 813                     ; 500 }
 816  0000 80            	iret	
 828                     	xref	_OnCaptureOVTim2
 829                     	xref	_OnCaptureTim2
 830                     	xref	_OnTimer4
 831                     	xdef	f_EEPROM_EEC_IRQHandler
 832                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 833                     	xdef	f_ADC1_IRQHandler
 834                     	xdef	f_I2C_IRQHandler
 835                     	xdef	f_UART1_RX_IRQHandler
 836                     	xdef	f_UART1_TX_IRQHandler
 837                     	xdef	f_TIM2_CAP_COM_IRQHandler
 838                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 839                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 840                     	xdef	f_TIM1_CAP_COM_IRQHandler
 841                     	xdef	f_SPI_IRQHandler
 842                     	xdef	f_EXTI_PORTE_IRQHandler
 843                     	xdef	f_EXTI_PORTD_IRQHandler
 844                     	xdef	f_EXTI_PORTC_IRQHandler
 845                     	xdef	f_EXTI_PORTB_IRQHandler
 846                     	xdef	f_EXTI_PORTA_IRQHandler
 847                     	xdef	f_CLK_IRQHandler
 848                     	xdef	f_AWU_IRQHandler
 849                     	xdef	f_TLI_IRQHandler
 850                     	xdef	f_TRAP_IRQHandler
 851                     	xdef	f_NonHandledInterrupt
 852                     	xref.b	c_x
 853                     	xref.b	c_y
 872                     	end
