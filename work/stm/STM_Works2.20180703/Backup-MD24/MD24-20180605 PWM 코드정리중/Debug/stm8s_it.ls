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
 516                     ; 296 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 516                     ; 297 {
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
 533                     ; 301 	OnCaptureTim2();
 535  0012 cd0000        	call	_OnCaptureTim2
 537                     ; 302 }
 540  0015 85            	popw	x
 541  0016 bf00          	ldw	c_y,x
 542  0018 320002        	pop	c_y+2
 543  001b 85            	popw	x
 544  001c bf00          	ldw	c_x,x
 545  001e 320002        	pop	c_x+2
 546  0021 80            	iret	
 569                     ; 339 INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 569                     ; 340 {
 570                     .text:	section	.text,new
 571  0000               f_UART1_TX_IRQHandler:
 575                     ; 344 }
 578  0000 80            	iret	
 601                     ; 351 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 601                     ; 352 {
 602                     .text:	section	.text,new
 603  0000               f_UART1_RX_IRQHandler:
 607                     ; 356 }
 610  0000 80            	iret	
 632                     ; 364 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 632                     ; 365 {
 633                     .text:	section	.text,new
 634  0000               f_I2C_IRQHandler:
 638                     ; 369 }
 641  0000 80            	iret	
 663                     ; 443 INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 663                     ; 444 {
 664                     .text:	section	.text,new
 665  0000               f_ADC1_IRQHandler:
 669                     ; 448 }
 672  0000 80            	iret	
 697                     ; 473 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 697                     ; 474 {
 698                     .text:	section	.text,new
 699  0000               f_TIM4_UPD_OVF_IRQHandler:
 701  0000 8a            	push	cc
 702  0001 84            	pop	a
 703  0002 a4bf          	and	a,#191
 704  0004 88            	push	a
 705  0005 86            	pop	cc
 706  0006 3b0002        	push	c_x+2
 707  0009 be00          	ldw	x,c_x
 708  000b 89            	pushw	x
 709  000c 3b0002        	push	c_y+2
 710  000f be00          	ldw	x,c_y
 711  0011 89            	pushw	x
 712  0012 be02          	ldw	x,c_lreg+2
 713  0014 89            	pushw	x
 714  0015 be00          	ldw	x,c_lreg
 715  0017 89            	pushw	x
 718                     ; 479 	OnTimer4();
 720  0018 cd0000        	call	_OnTimer4
 722                     ; 481   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 724  001b a601          	ld	a,#1
 725  001d cd0000        	call	_TIM4_ClearITPendingBit
 727                     ; 483 }
 730  0020 85            	popw	x
 731  0021 bf00          	ldw	c_lreg,x
 732  0023 85            	popw	x
 733  0024 bf02          	ldw	c_lreg+2,x
 734  0026 85            	popw	x
 735  0027 bf00          	ldw	c_y,x
 736  0029 320002        	pop	c_y+2
 737  002c 85            	popw	x
 738  002d bf00          	ldw	c_x,x
 739  002f 320002        	pop	c_x+2
 740  0032 80            	iret	
 763                     ; 491 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 763                     ; 492 {
 764                     .text:	section	.text,new
 765  0000               f_EEPROM_EEC_IRQHandler:
 769                     ; 496 }
 772  0000 80            	iret	
 784                     	xref	_OnCaptureTim2
 785                     	xref	_OnCaptureOVTim2
 786                     	xref	_OnTimer4
 787                     	xdef	f_EEPROM_EEC_IRQHandler
 788                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 789                     	xdef	f_ADC1_IRQHandler
 790                     	xdef	f_I2C_IRQHandler
 791                     	xdef	f_UART1_RX_IRQHandler
 792                     	xdef	f_UART1_TX_IRQHandler
 793                     	xdef	f_TIM2_CAP_COM_IRQHandler
 794                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 795                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 796                     	xdef	f_TIM1_CAP_COM_IRQHandler
 797                     	xdef	f_SPI_IRQHandler
 798                     	xdef	f_EXTI_PORTE_IRQHandler
 799                     	xdef	f_EXTI_PORTD_IRQHandler
 800                     	xdef	f_EXTI_PORTC_IRQHandler
 801                     	xdef	f_EXTI_PORTB_IRQHandler
 802                     	xdef	f_EXTI_PORTA_IRQHandler
 803                     	xdef	f_CLK_IRQHandler
 804                     	xdef	f_AWU_IRQHandler
 805                     	xdef	f_TLI_IRQHandler
 806                     	xdef	f_TRAP_IRQHandler
 807                     	xdef	f_NonHandledInterrupt
 808                     	xref	_TIM4_ClearITPendingBit
 809                     	xref.b	c_lreg
 810                     	xref.b	c_x
 811                     	xref.b	c_y
 830                     	end
