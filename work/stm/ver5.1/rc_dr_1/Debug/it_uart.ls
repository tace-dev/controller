   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  52                     ; 243 uint8_t	uart1_Ready(void)	
  52                     ; 244 { 
  54                     .text:	section	.text,new
  55  0000               _uart1_Ready:
  59                     ; 245 	return (uint8_t)(_uart1_rx_head != _uart1_rx_tail ? 1 : 0); 
  61  0000 c60001        	ld	a,__uart1_rx_head
  62  0003 c10000        	cp	a,__uart1_rx_tail
  63  0006 2703          	jreq	L6
  64  0008 a601          	ld	a,#1
  66  000a 81            	ret	
  67  000b               L6:
  68  000b 4f            	clr	a
  71  000c 81            	ret	
 104                     ; 248 void	uart1_tx_485(uint8_t s)
 104                     ; 249 {
 105                     .text:	section	.text,new
 106  0000               _uart1_tx_485:
 110                     ; 258 	COM1_ITConfig(COM1, COM1_IT_TXE, ENABLE);
 112  0000 4b01          	push	#1
 113  0002 ae0277        	ldw	x,#631
 114  0005 89            	pushw	x
 115  0006 ae5230        	ldw	x,#21040
 116  0009 cd0000        	call	_USART_ITConfig
 118  000c 5b03          	addw	sp,#3
 119                     ; 264 }
 122  000e 81            	ret	
 181                     ; 282 void	uart1_tx_put(uint8_t *buf, uint8_t size)
 181                     ; 283 {
 182                     .text:	section	.text,new
 183  0000               _uart1_tx_put:
 185  0000 89            	pushw	x
 186  0001 89            	pushw	x
 187       00000002      OFST:	set	2
 190                     ; 285 	uint8_t s = 0;
 192  0002 0f01          	clr	(OFST-1,sp)
 194                     ; 287 	for( i=0; i<size; i++ )
 196  0004 0f02          	clr	(OFST+0,sp)
 199  0006 2029          	jra	L56
 200  0008               L16:
 201                     ; 289 		TxBuffer1[_uart1_tx_head] = buf[i];
 203  0008 c60003        	ld	a,__uart1_tx_head
 204  000b 5f            	clrw	x
 205  000c 97            	ld	xl,a
 206  000d 89            	pushw	x
 207  000e 7b05          	ld	a,(OFST+3,sp)
 208  0010 97            	ld	xl,a
 209  0011 7b06          	ld	a,(OFST+4,sp)
 210  0013 1b04          	add	a,(OFST+2,sp)
 211  0015 2401          	jrnc	L02
 212  0017 5c            	incw	x
 213  0018               L02:
 214  0018 02            	rlwa	x,a
 215  0019 f6            	ld	a,(x)
 216  001a 85            	popw	x
 217  001b d70014        	ld	(_TxBuffer1,x),a
 218                     ; 290 		_uart1_tx_head = (uint8_t)((_uart1_tx_head + 1) % TX1_BUFFER_SIZE);
 220  001e c60003        	ld	a,__uart1_tx_head
 221  0021 5f            	clrw	x
 222  0022 97            	ld	xl,a
 223  0023 5c            	incw	x
 224  0024 a608          	ld	a,#8
 225  0026 cd0000        	call	c_smodx
 227  0029 9f            	ld	a,xl
 228  002a c70003        	ld	__uart1_tx_head,a
 229                     ; 291 		s += 1;
 231  002d 0c01          	inc	(OFST-1,sp)
 233                     ; 287 	for( i=0; i<size; i++ )
 235  002f 0c02          	inc	(OFST+0,sp)
 237  0031               L56:
 240  0031 7b02          	ld	a,(OFST+0,sp)
 241  0033 1107          	cp	a,(OFST+5,sp)
 242  0035 25d1          	jrult	L16
 243                     ; 293 	uart1_tx_485(s);
 245  0037 7b01          	ld	a,(OFST-1,sp)
 246  0039 cd0000        	call	_uart1_tx_485
 248                     ; 294 }
 251  003c 5b04          	addw	sp,#4
 252  003e 81            	ret	
 289                     ; 296 void	uart1_tx_irq(void)
 289                     ; 297 {
 290                     .text:	section	.text,new
 291  0000               _uart1_tx_irq:
 293  0000 88            	push	a
 294       00000001      OFST:	set	1
 297                     ; 301 	COM1_ClearITPendingBit(COM1, COM1_IT_TC);
 299  0001 ae0266        	ldw	x,#614
 300  0004 89            	pushw	x
 301  0005 ae5230        	ldw	x,#21040
 302  0008 cd0000        	call	_USART_ClearITPendingBit
 304  000b c60003        	ld	a,__uart1_tx_head
 305  000e c10002        	cp	a,__uart1_tx_tail
 306  0011 85            	popw	x
 307                     ; 303 	if( _uart1_tx_head == _uart1_tx_tail )
 309  0012 260f          	jrne	L501
 310                     ; 306 		COM1_ITConfig(COM1, COM1_IT_TXE, DISABLE);
 312  0014 4b00          	push	#0
 313  0016 ae0277        	ldw	x,#631
 314  0019 89            	pushw	x
 315  001a ae5230        	ldw	x,#21040
 316  001d cd0000        	call	_USART_ITConfig
 318                     ; 312 		return;
 321  0020 5b04          	addw	sp,#4
 322  0022 81            	ret	
 323  0023               L501:
 324                     ; 314 	i = TxBuffer1[_uart1_tx_tail];
 326  0023 c60002        	ld	a,__uart1_tx_tail
 327  0026 5f            	clrw	x
 328  0027 97            	ld	xl,a
 329  0028 d60014        	ld	a,(_TxBuffer1,x)
 330  002b 6b01          	ld	(OFST+0,sp),a
 332                     ; 315 	_uart1_tx_tail = (uint8_t)((_uart1_tx_tail + 1) % TX1_BUFFER_SIZE);
 334  002d c60002        	ld	a,__uart1_tx_tail
 335  0030 5f            	clrw	x
 336  0031 97            	ld	xl,a
 337  0032 5c            	incw	x
 338  0033 a608          	ld	a,#8
 339  0035 cd0000        	call	c_smodx
 341  0038 9f            	ld	a,xl
 342  0039 c70002        	ld	__uart1_tx_tail,a
 343                     ; 316     COM1_DR = i;
 345  003c 7b01          	ld	a,(OFST+0,sp)
 346  003e c75231        	ld	21041,a
 347                     ; 317 }
 350  0041 84            	pop	a
 351  0042 81            	ret	
 376                     ; 319 void	uart1_rx_irq(void)
 376                     ; 320 {
 377                     .text:	section	.text,new
 378  0000               _uart1_rx_irq:
 382                     ; 321     RxBuffer1[_uart1_rx_head] = ((uint8_t)COM1_DR);
 384  0000 c60001        	ld	a,__uart1_rx_head
 385  0003 5f            	clrw	x
 386  0004 97            	ld	xl,a
 387  0005 c65231        	ld	a,21041
 388  0008 d70004        	ld	(_RxBuffer1,x),a
 389                     ; 322 	_uart1_rx_head = (uint8_t)((_uart1_rx_head + 1) % RX1_BUFFER_SIZE);
 391  000b c60001        	ld	a,__uart1_rx_head
 392  000e 5f            	clrw	x
 393  000f 97            	ld	xl,a
 394  0010 5c            	incw	x
 395  0011 a610          	ld	a,#16
 396  0013 cd0000        	call	c_smodx
 398  0016 9f            	ld	a,xl
 399  0017 c70001        	ld	__uart1_rx_head,a
 400                     ; 323 }
 403  001a 81            	ret	
 437                     ; 325 uint8_t	uart1_get(void)
 437                     ; 326 {
 438                     .text:	section	.text,new
 439  0000               _uart1_get:
 441  0000 88            	push	a
 442       00000001      OFST:	set	1
 445                     ; 327 	uint8_t	t = RxBuffer1[_uart1_rx_tail];
 447  0001 c60000        	ld	a,__uart1_rx_tail
 448  0004 5f            	clrw	x
 449  0005 97            	ld	xl,a
 450  0006 d60004        	ld	a,(_RxBuffer1,x)
 451  0009 6b01          	ld	(OFST+0,sp),a
 453                     ; 328 	_uart1_rx_tail = (uint8_t)((_uart1_rx_tail + 1) % RX1_BUFFER_SIZE);
 455  000b c60000        	ld	a,__uart1_rx_tail
 456  000e 5f            	clrw	x
 457  000f 97            	ld	xl,a
 458  0010 5c            	incw	x
 459  0011 a610          	ld	a,#16
 460  0013 cd0000        	call	c_smodx
 462  0016 9f            	ld	a,xl
 463  0017 c70000        	ld	__uart1_rx_tail,a
 464                     ; 329 	return t;
 466  001a 7b01          	ld	a,(OFST+0,sp)
 469  001c 5b01          	addw	sp,#1
 470  001e 81            	ret	
 504                     ; 332 uint8_t	uart1_pkt_ready(void)
 504                     ; 333 {
 505                     .text:	section	.text,new
 506  0000               _uart1_pkt_ready:
 508       00000001      OFST:	set	1
 511                     ; 334 	uint8_t	i = (uint8_t)((_uart1_rx_head - 1 + RX1_BUFFER_SIZE) % RX1_BUFFER_SIZE);
 513  0000 c60001        	ld	a,__uart1_rx_head
 514  0003 5f            	clrw	x
 515  0004 97            	ld	xl,a
 516  0005 1c000f        	addw	x,#15
 517  0008 a610          	ld	a,#16
 518  000a cd0000        	call	c_smodx
 520  000d 9f            	ld	a,xl
 522                     ; 335 	return (uint8_t)(RxBuffer1[i]==/*PKT_485_ETX*/0 ? 1 : 0);
 524  000e 5f            	clrw	x
 525  000f 97            	ld	xl,a
 526  0010 724d0004      	tnz	(_RxBuffer1,x)
 527  0014 2603          	jrne	L04
 528  0016 a601          	ld	a,#1
 530  0018 81            	ret	
 531  0019               L04:
 532  0019 4f            	clr	a
 535  001a 81            	ret	
 567                     ; 338 void	systemUart(void)
 567                     ; 339 {
 568                     .text:	section	.text,new
 569  0000               _systemUart:
 573                     ; 343 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
 575  0000 ae0501        	ldw	x,#1281
 576  0003 cd0000        	call	_CLK_PeripheralClockConfig
 578                     ; 346 	GPIO_ExternalPullUpConfig(D_USART_TX_PORT, D_USART_TX_PIN, ENABLE);
 580  0006 4b01          	push	#1
 581  0008 4b08          	push	#8
 582  000a ae500a        	ldw	x,#20490
 583  000d cd0000        	call	_GPIO_ExternalPullUpConfig
 585  0010 85            	popw	x
 586                     ; 350 	GPIO_ExternalPullUpConfig(D_USART_RX_PORT, D_USART_RX_PIN, ENABLE);
 588  0011 4b01          	push	#1
 589  0013 4b04          	push	#4
 590  0015 ae500a        	ldw	x,#20490
 591  0018 cd0000        	call	_GPIO_ExternalPullUpConfig
 593  001b 85            	popw	x
 594                     ; 352 	USART_Init(COM1, 
 594                     ; 353 		9600, 
 594                     ; 354 		USART_WordLength_8b, 
 594                     ; 355 		USART_StopBits_1,
 594                     ; 356 		USART_Parity_No, 
 594                     ; 357 		(USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx
 594                     ; 358 		)
 594                     ; 359 	);
 596  001c 4b0c          	push	#12
 597  001e 4b00          	push	#0
 598  0020 4b00          	push	#0
 599  0022 4b00          	push	#0
 600  0024 ae2580        	ldw	x,#9600
 601  0027 89            	pushw	x
 602  0028 5f            	clrw	x
 603  0029 89            	pushw	x
 604  002a ae5230        	ldw	x,#21040
 605  002d cd0000        	call	_USART_Init
 607  0030 5b08          	addw	sp,#8
 608                     ; 360 	COM1_ITConfig(COM1, COM1_IT_RXNE, ENABLE);
 610  0032 4b01          	push	#1
 611  0034 ae0255        	ldw	x,#597
 612  0037 89            	pushw	x
 613  0038 ae5230        	ldw	x,#21040
 614  003b cd0000        	call	_USART_ITConfig
 616  003e 5b03          	addw	sp,#3
 617                     ; 361 	COM1_ITConfig(COM1, COM1_IT_TC, ENABLE);
 619  0040 4b01          	push	#1
 620  0042 ae0266        	ldw	x,#614
 621  0045 89            	pushw	x
 622  0046 ae5230        	ldw	x,#21040
 623  0049 cd0000        	call	_USART_ITConfig
 625  004c 5b03          	addw	sp,#3
 626                     ; 362 	COM1_Cmd(USART1, ENABLE);
 628  004e 4b01          	push	#1
 629  0050 ae5230        	ldw	x,#21040
 630  0053 cd0000        	call	_USART_Cmd
 632  0056 725f0001      	clr	__uart1_rx_head
 633  005a 725f0000      	clr	__uart1_rx_tail
 634  005e 725f0003      	clr	__uart1_tx_head
 635  0062 725f0002      	clr	__uart1_tx_tail
 636  0066 84            	pop	a
 637                     ; 425 	_uart1_rx_head = 0;
 639                     ; 426 	_uart1_rx_tail = 0;
 641                     ; 427 	_uart1_tx_head = 0;
 643                     ; 428 	_uart1_tx_tail = 0;
 645                     ; 460 }
 648  0067 81            	ret	
 672                     ; 462 void	systemUart3ChangeEvenParity(void)
 672                     ; 463 {
 673                     .text:	section	.text,new
 674  0000               _systemUart3ChangeEvenParity:
 678                     ; 489 }
 681  0000 81            	ret	
 705                     ; 491 void	systemUart3ChangeNoneParity(void)
 705                     ; 492 {
 706                     .text:	section	.text,new
 707  0000               _systemUart3ChangeNoneParity:
 711                     ; 518 }
 714  0000 81            	ret	
 785                     	xdef	_uart1_tx_485
 786                     	switch	.bss
 787  0000               __uart1_rx_tail:
 788  0000 00            	ds.b	1
 789                     	xdef	__uart1_rx_tail
 790  0001               __uart1_rx_head:
 791  0001 00            	ds.b	1
 792                     	xdef	__uart1_rx_head
 793  0002               __uart1_tx_tail:
 794  0002 00            	ds.b	1
 795                     	xdef	__uart1_tx_tail
 796  0003               __uart1_tx_head:
 797  0003 00            	ds.b	1
 798                     	xdef	__uart1_tx_head
 799  0004               _RxBuffer1:
 800  0004 000000000000  	ds.b	16
 801                     	xdef	_RxBuffer1
 802  0014               _TxBuffer1:
 803  0014 000000000000  	ds.b	8
 804                     	xdef	_TxBuffer1
 805                     	xdef	_systemUart3ChangeNoneParity
 806                     	xdef	_systemUart3ChangeEvenParity
 807                     	xdef	_systemUart
 808                     	xdef	_uart1_pkt_ready
 809                     	xdef	_uart1_get
 810                     	xdef	_uart1_rx_irq
 811                     	xdef	_uart1_tx_irq
 812                     	xdef	_uart1_tx_put
 813                     	xdef	_uart1_Ready
 814                     	xref	_USART_ClearITPendingBit
 815                     	xref	_USART_ITConfig
 816                     	xref	_USART_Cmd
 817                     	xref	_USART_Init
 818                     	xref	_GPIO_ExternalPullUpConfig
 819                     	xref	_CLK_PeripheralClockConfig
 820                     	xref.b	c_x
 840                     	xref	c_smodx
 841                     	end
