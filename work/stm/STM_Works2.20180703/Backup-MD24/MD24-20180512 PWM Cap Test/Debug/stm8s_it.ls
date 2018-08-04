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
 397                     ; 233 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 397                     ; 234 {
 398                     .text:	section	.text,new
 399  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 403                     ; 238 }
 406  0000 80            	iret	
 429                     ; 245 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 429                     ; 246 {
 430                     .text:	section	.text,new
 431  0000               f_TIM1_CAP_COM_IRQHandler:
 435                     ; 250 }
 438  0000 80            	iret	
 462                     ; 283 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 462                     ; 284 {
 463                     .text:	section	.text,new
 464  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 466  0000 8a            	push	cc
 467  0001 84            	pop	a
 468  0002 a4bf          	and	a,#191
 469  0004 88            	push	a
 470  0005 86            	pop	cc
 471  0006 3b0002        	push	c_x+2
 472  0009 be00          	ldw	x,c_x
 473  000b 89            	pushw	x
 474  000c 3b0002        	push	c_y+2
 475  000f be00          	ldw	x,c_y
 476  0011 89            	pushw	x
 479                     ; 288 	OnCaptureOVTim2();
 481  0012 cd0000        	call	_OnCaptureOVTim2
 483                     ; 289 }
 486  0015 85            	popw	x
 487  0016 bf00          	ldw	c_y,x
 488  0018 320002        	pop	c_y+2
 489  001b 85            	popw	x
 490  001c bf00          	ldw	c_x,x
 491  001e 320002        	pop	c_x+2
 492  0021 80            	iret	
 516                     ; 301 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 516                     ; 302 {
 517                     .text:	section	.text,new
 518  0000               f_TIM2_CAP_COM_IRQHandler:
 520  0000 8a            	push	cc
 521  0001 84            	pop	a
 522  0002 a4bf          	and	a,#191
 523  0004 88            	push	a
 524  0005 86            	pop	cc
 525  0006 3b0002        	push	c_x+2
 526  0009 be00          	ldw	x,c_x
 527  000b 89            	pushw	x
 528  000c 3b0002        	push	c_y+2
 529  000f be00          	ldw	x,c_y
 530  0011 89            	pushw	x
 533                     ; 306 	OnCaptureTim2();
 535  0012 cd0000        	call	_OnCaptureTim2
 537                     ; 308 }
 540  0015 85            	popw	x
 541  0016 bf00          	ldw	c_y,x
 542  0018 320002        	pop	c_y+2
 543  001b 85            	popw	x
 544  001c bf00          	ldw	c_x,x
 545  001e 320002        	pop	c_x+2
 546  0021 80            	iret	
 569                     ; 345 INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 569                     ; 346 {
 570                     .text:	section	.text,new
 571  0000               f_UART1_TX_IRQHandler:
 575                     ; 350 }
 578  0000 80            	iret	
 601                     ; 357 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 601                     ; 358 {
 602                     .text:	section	.text,new
 603  0000               f_UART1_RX_IRQHandler:
 607                     ; 362 }
 610  0000 80            	iret	
 632                     ; 370 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 632                     ; 371 {
 633                     .text:	section	.text,new
 634  0000               f_I2C_IRQHandler:
 638                     ; 375 }
 641  0000 80            	iret	
 663                     ; 449 INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 663                     ; 450 {
 664                     .text:	section	.text,new
 665  0000               f_ADC1_IRQHandler:
 669                     ; 454 }
 672  0000 80            	iret	
 696                     ; 476 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 696                     ; 477 {
 697                     .text:	section	.text,new
 698  0000               f_TIM4_UPD_OVF_IRQHandler:
 700  0000 8a            	push	cc
 701  0001 84            	pop	a
 702  0002 a4bf          	and	a,#191
 703  0004 88            	push	a
 704  0005 86            	pop	cc
 705  0006 3b0002        	push	c_x+2
 706  0009 be00          	ldw	x,c_x
 707  000b 89            	pushw	x
 708  000c 3b0002        	push	c_y+2
 709  000f be00          	ldw	x,c_y
 710  0011 89            	pushw	x
 713                     ; 481 	OnTimer4();
 715  0012 cd0000        	call	_OnTimer4
 717                     ; 482 }
 720  0015 85            	popw	x
 721  0016 bf00          	ldw	c_y,x
 722  0018 320002        	pop	c_y+2
 723  001b 85            	popw	x
 724  001c bf00          	ldw	c_x,x
 725  001e 320002        	pop	c_x+2
 726  0021 80            	iret	
 749                     ; 490 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 749                     ; 491 {
 750                     .text:	section	.text,new
 751  0000               f_EEPROM_EEC_IRQHandler:
 755                     ; 495 }
 758  0000 80            	iret	
 770                     	xref	_OnCaptureOVTim2
 771                     	xref	_OnCaptureTim2
 772                     	xref	_OnTimer4
 773                     	xdef	f_EEPROM_EEC_IRQHandler
 774                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 775                     	xdef	f_ADC1_IRQHandler
 776                     	xdef	f_I2C_IRQHandler
 777                     	xdef	f_UART1_RX_IRQHandler
 778                     	xdef	f_UART1_TX_IRQHandler
 779                     	xdef	f_TIM2_CAP_COM_IRQHandler
 780                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 781                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 782                     	xdef	f_TIM1_CAP_COM_IRQHandler
 783                     	xdef	f_SPI_IRQHandler
 784                     	xdef	f_EXTI_PORTE_IRQHandler
 785                     	xdef	f_EXTI_PORTD_IRQHandler
 786                     	xdef	f_EXTI_PORTC_IRQHandler
 787                     	xdef	f_EXTI_PORTB_IRQHandler
 788                     	xdef	f_EXTI_PORTA_IRQHandler
 789                     	xdef	f_CLK_IRQHandler
 790                     	xdef	f_AWU_IRQHandler
 791                     	xdef	f_TLI_IRQHandler
 792                     	xdef	f_TRAP_IRQHandler
 793                     	xdef	f_NonHandledInterrupt
 794                     	xref.b	c_x
 795                     	xref.b	c_y
 814                     	end
