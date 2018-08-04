   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  49                     ; 57 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  49                     ; 58 {
  50                     	switch	.text
  51  0000               f_NonHandledInterrupt:
  55                     ; 62 }
  58  0000 80            	iret	
  80                     ; 70 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  80                     ; 71 {
  81                     	switch	.text
  82  0001               f_TRAP_IRQHandler:
  86                     ; 75 }
  89  0001 80            	iret	
 111                     ; 82 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 111                     ; 83 
 111                     ; 84 {
 112                     	switch	.text
 113  0002               f_TLI_IRQHandler:
 117                     ; 88 }
 120  0002 80            	iret	
 142                     ; 95 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 142                     ; 96 {
 143                     	switch	.text
 144  0003               f_AWU_IRQHandler:
 148                     ; 100 }
 151  0003 80            	iret	
 173                     ; 107 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 173                     ; 108 {
 174                     	switch	.text
 175  0004               f_CLK_IRQHandler:
 179                     ; 112 }
 182  0004 80            	iret	
 205                     ; 119 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 205                     ; 120 {
 206                     	switch	.text
 207  0005               f_EXTI_PORTA_IRQHandler:
 211                     ; 124 }
 214  0005 80            	iret	
 237                     ; 131 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 237                     ; 132 {
 238                     	switch	.text
 239  0006               f_EXTI_PORTB_IRQHandler:
 243                     ; 136 }
 246  0006 80            	iret	
 269                     ; 143 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 269                     ; 144 {
 270                     	switch	.text
 271  0007               f_EXTI_PORTC_IRQHandler:
 275                     ; 148 }
 278  0007 80            	iret	
 301                     ; 155 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 301                     ; 156 {
 302                     	switch	.text
 303  0008               f_EXTI_PORTD_IRQHandler:
 307                     ; 160 }
 310  0008 80            	iret	
 333                     ; 167 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 333                     ; 168 {
 334                     	switch	.text
 335  0009               f_EXTI_PORTE_IRQHandler:
 339                     ; 172 }
 342  0009 80            	iret	
 364                     ; 219 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 364                     ; 220 {
 365                     	switch	.text
 366  000a               f_SPI_IRQHandler:
 370                     ; 224 }
 373  000a 80            	iret	
 396                     ; 231 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 396                     ; 232 {
 397                     	switch	.text
 398  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 402                     ; 236 }
 405  000b 80            	iret	
 428                     ; 243 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 428                     ; 244 {
 429                     	switch	.text
 430  000c               f_TIM1_CAP_COM_IRQHandler:
 434                     ; 248 }
 437  000c 80            	iret	
 460                     ; 281 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 460                     ; 282 {
 461                     	switch	.text
 462  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 466                     ; 286 }
 469  000d 80            	iret	
 492                     ; 293 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 492                     ; 294 {
 493                     	switch	.text
 494  000e               f_TIM2_CAP_COM_IRQHandler:
 498                     ; 298 }
 501  000e 80            	iret	
 524                     ; 335 INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 524                     ; 336 {
 525                     	switch	.text
 526  000f               f_UART1_TX_IRQHandler:
 530                     ; 340 }
 533  000f 80            	iret	
 556                     ; 347 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 556                     ; 348 {
 557                     	switch	.text
 558  0010               f_UART1_RX_IRQHandler:
 562                     ; 352 }
 565  0010 80            	iret	
 587                     ; 360 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 587                     ; 361 {
 588                     	switch	.text
 589  0011               f_I2C_IRQHandler:
 593                     ; 365 }
 596  0011 80            	iret	
 618                     ; 439 INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 618                     ; 440 {
 619                     	switch	.text
 620  0012               f_ADC1_IRQHandler:
 624                     ; 444 }
 627  0012 80            	iret	
 652                     ; 469 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 652                     ; 470 {
 653                     	switch	.text
 654  0013               f_TIM4_UPD_OVF_IRQHandler:
 656  0013 8a            	push	cc
 657  0014 84            	pop	a
 658  0015 a4bf          	and	a,#191
 659  0017 88            	push	a
 660  0018 86            	pop	cc
 661  0019 3b0002        	push	c_x+2
 662  001c be00          	ldw	x,c_x
 663  001e 89            	pushw	x
 664  001f 3b0002        	push	c_y+2
 665  0022 be00          	ldw	x,c_y
 666  0024 89            	pushw	x
 667  0025 be02          	ldw	x,c_lreg+2
 668  0027 89            	pushw	x
 669  0028 be00          	ldw	x,c_lreg
 670  002a 89            	pushw	x
 673                     ; 475 	OnTimer4();
 675  002b cd0000        	call	_OnTimer4
 677                     ; 477   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 679  002e a601          	ld	a,#1
 680  0030 cd0000        	call	_TIM4_ClearITPendingBit
 682                     ; 479 }
 685  0033 85            	popw	x
 686  0034 bf00          	ldw	c_lreg,x
 687  0036 85            	popw	x
 688  0037 bf02          	ldw	c_lreg+2,x
 689  0039 85            	popw	x
 690  003a bf00          	ldw	c_y,x
 691  003c 320002        	pop	c_y+2
 692  003f 85            	popw	x
 693  0040 bf00          	ldw	c_x,x
 694  0042 320002        	pop	c_x+2
 695  0045 80            	iret	
 718                     ; 487 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 718                     ; 488 {
 719                     	switch	.text
 720  0046               f_EEPROM_EEC_IRQHandler:
 724                     ; 492 }
 727  0046 80            	iret	
 739                     	xref	_OnTimer4
 740                     	xdef	f_EEPROM_EEC_IRQHandler
 741                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 742                     	xdef	f_ADC1_IRQHandler
 743                     	xdef	f_I2C_IRQHandler
 744                     	xdef	f_UART1_RX_IRQHandler
 745                     	xdef	f_UART1_TX_IRQHandler
 746                     	xdef	f_TIM2_CAP_COM_IRQHandler
 747                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 748                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 749                     	xdef	f_TIM1_CAP_COM_IRQHandler
 750                     	xdef	f_SPI_IRQHandler
 751                     	xdef	f_EXTI_PORTE_IRQHandler
 752                     	xdef	f_EXTI_PORTD_IRQHandler
 753                     	xdef	f_EXTI_PORTC_IRQHandler
 754                     	xdef	f_EXTI_PORTB_IRQHandler
 755                     	xdef	f_EXTI_PORTA_IRQHandler
 756                     	xdef	f_CLK_IRQHandler
 757                     	xdef	f_AWU_IRQHandler
 758                     	xdef	f_TLI_IRQHandler
 759                     	xdef	f_TRAP_IRQHandler
 760                     	xdef	f_NonHandledInterrupt
 761                     	xref	_TIM4_ClearITPendingBit
 762                     	xref.b	c_lreg
 763                     	xref.b	c_x
 764                     	xref.b	c_y
 783                     	end
