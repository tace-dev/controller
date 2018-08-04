   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  49                     ; 59 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  49                     ; 60 {
  50                     	switch	.text
  51  0000               f_NonHandledInterrupt:
  55                     ; 64 }
  58  0000 80            	iret	
  80                     ; 72 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  80                     ; 73 {
  81                     	switch	.text
  82  0001               f_TRAP_IRQHandler:
  86                     ; 77 }
  89  0001 80            	iret	
 111                     ; 84 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 111                     ; 85 
 111                     ; 86 {
 112                     	switch	.text
 113  0002               f_TLI_IRQHandler:
 117                     ; 90 }
 120  0002 80            	iret	
 142                     ; 97 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 142                     ; 98 {
 143                     	switch	.text
 144  0003               f_AWU_IRQHandler:
 148                     ; 102 }
 151  0003 80            	iret	
 173                     ; 109 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 173                     ; 110 {
 174                     	switch	.text
 175  0004               f_CLK_IRQHandler:
 179                     ; 114 }
 182  0004 80            	iret	
 205                     ; 121 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 205                     ; 122 {
 206                     	switch	.text
 207  0005               f_EXTI_PORTA_IRQHandler:
 211                     ; 126 }
 214  0005 80            	iret	
 237                     ; 133 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 237                     ; 134 {
 238                     	switch	.text
 239  0006               f_EXTI_PORTB_IRQHandler:
 243                     ; 138 }
 246  0006 80            	iret	
 269                     ; 145 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 269                     ; 146 {
 270                     	switch	.text
 271  0007               f_EXTI_PORTC_IRQHandler:
 275                     ; 150 }
 278  0007 80            	iret	
 301                     ; 157 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 301                     ; 158 {
 302                     	switch	.text
 303  0008               f_EXTI_PORTD_IRQHandler:
 307                     ; 162 }
 310  0008 80            	iret	
 333                     ; 169 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 333                     ; 170 {
 334                     	switch	.text
 335  0009               f_EXTI_PORTE_IRQHandler:
 339                     ; 174 }
 342  0009 80            	iret	
 364                     ; 221 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 364                     ; 222 {
 365                     	switch	.text
 366  000a               f_SPI_IRQHandler:
 370                     ; 226 }
 373  000a 80            	iret	
 396                     ; 233 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 396                     ; 234 {
 397                     	switch	.text
 398  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 402                     ; 238 }
 405  000b 80            	iret	
 428                     ; 245 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 428                     ; 246 {
 429                     	switch	.text
 430  000c               f_TIM1_CAP_COM_IRQHandler:
 434                     ; 250 }
 437  000c 80            	iret	
 461                     ; 283 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 461                     ; 284 {
 462                     	switch	.text
 463  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 465  000d 8a            	push	cc
 466  000e 84            	pop	a
 467  000f a4bf          	and	a,#191
 468  0011 88            	push	a
 469  0012 86            	pop	cc
 470  0013 3b0002        	push	c_x+2
 471  0016 be00          	ldw	x,c_x
 472  0018 89            	pushw	x
 473  0019 3b0002        	push	c_y+2
 474  001c be00          	ldw	x,c_y
 475  001e 89            	pushw	x
 478                     ; 288 	OnCaptureOVTim2();
 480  001f cd0000        	call	_OnCaptureOVTim2
 482                     ; 289 }
 485  0022 85            	popw	x
 486  0023 bf00          	ldw	c_y,x
 487  0025 320002        	pop	c_y+2
 488  0028 85            	popw	x
 489  0029 bf00          	ldw	c_x,x
 490  002b 320002        	pop	c_x+2
 491  002e 80            	iret	
 515                     ; 301 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 515                     ; 302 {
 516                     	switch	.text
 517  002f               f_TIM2_CAP_COM_IRQHandler:
 519  002f 8a            	push	cc
 520  0030 84            	pop	a
 521  0031 a4bf          	and	a,#191
 522  0033 88            	push	a
 523  0034 86            	pop	cc
 524  0035 3b0002        	push	c_x+2
 525  0038 be00          	ldw	x,c_x
 526  003a 89            	pushw	x
 527  003b 3b0002        	push	c_y+2
 528  003e be00          	ldw	x,c_y
 529  0040 89            	pushw	x
 532                     ; 306 	OnCaptureTim2();
 534  0041 cd0000        	call	_OnCaptureTim2
 536                     ; 308 }
 539  0044 85            	popw	x
 540  0045 bf00          	ldw	c_y,x
 541  0047 320002        	pop	c_y+2
 542  004a 85            	popw	x
 543  004b bf00          	ldw	c_x,x
 544  004d 320002        	pop	c_x+2
 545  0050 80            	iret	
 568                     ; 345 INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 568                     ; 346 {
 569                     	switch	.text
 570  0051               f_UART1_TX_IRQHandler:
 574                     ; 350 }
 577  0051 80            	iret	
 600                     ; 357 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 600                     ; 358 {
 601                     	switch	.text
 602  0052               f_UART1_RX_IRQHandler:
 606                     ; 362 }
 609  0052 80            	iret	
 631                     ; 370 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 631                     ; 371 {
 632                     	switch	.text
 633  0053               f_I2C_IRQHandler:
 637                     ; 375 }
 640  0053 80            	iret	
 662                     ; 449 INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 662                     ; 450 {
 663                     	switch	.text
 664  0054               f_ADC1_IRQHandler:
 668                     ; 454 }
 671  0054 80            	iret	
 695                     ; 476 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 695                     ; 477 {
 696                     	switch	.text
 697  0055               f_TIM4_UPD_OVF_IRQHandler:
 699  0055 8a            	push	cc
 700  0056 84            	pop	a
 701  0057 a4bf          	and	a,#191
 702  0059 88            	push	a
 703  005a 86            	pop	cc
 704  005b 3b0002        	push	c_x+2
 705  005e be00          	ldw	x,c_x
 706  0060 89            	pushw	x
 707  0061 3b0002        	push	c_y+2
 708  0064 be00          	ldw	x,c_y
 709  0066 89            	pushw	x
 712                     ; 481 	OnTimer4();
 714  0067 cd0000        	call	_OnTimer4
 716                     ; 482 }
 719  006a 85            	popw	x
 720  006b bf00          	ldw	c_y,x
 721  006d 320002        	pop	c_y+2
 722  0070 85            	popw	x
 723  0071 bf00          	ldw	c_x,x
 724  0073 320002        	pop	c_x+2
 725  0076 80            	iret	
 748                     ; 490 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 748                     ; 491 {
 749                     	switch	.text
 750  0077               f_EEPROM_EEC_IRQHandler:
 754                     ; 495 }
 757  0077 80            	iret	
 769                     	xref	_OnCaptureOVTim2
 770                     	xref	_OnCaptureTim2
 771                     	xref	_OnTimer4
 772                     	xdef	f_EEPROM_EEC_IRQHandler
 773                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 774                     	xdef	f_ADC1_IRQHandler
 775                     	xdef	f_I2C_IRQHandler
 776                     	xdef	f_UART1_RX_IRQHandler
 777                     	xdef	f_UART1_TX_IRQHandler
 778                     	xdef	f_TIM2_CAP_COM_IRQHandler
 779                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 780                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 781                     	xdef	f_TIM1_CAP_COM_IRQHandler
 782                     	xdef	f_SPI_IRQHandler
 783                     	xdef	f_EXTI_PORTE_IRQHandler
 784                     	xdef	f_EXTI_PORTD_IRQHandler
 785                     	xdef	f_EXTI_PORTC_IRQHandler
 786                     	xdef	f_EXTI_PORTB_IRQHandler
 787                     	xdef	f_EXTI_PORTA_IRQHandler
 788                     	xdef	f_CLK_IRQHandler
 789                     	xdef	f_AWU_IRQHandler
 790                     	xdef	f_TLI_IRQHandler
 791                     	xdef	f_TRAP_IRQHandler
 792                     	xdef	f_NonHandledInterrupt
 793                     	xref.b	c_x
 794                     	xref.b	c_y
 813                     	end
