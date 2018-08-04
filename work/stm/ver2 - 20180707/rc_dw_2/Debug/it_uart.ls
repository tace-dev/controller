   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
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
 193                     ; 287 	for( i=0; i<size; i++ )
 195  0004 0f02          	clr	(OFST+0,sp)
 197  0006 2029          	jra	L56
 198  0008               L16:
 199                     ; 289 		TxBuffer1[_uart1_tx_head] = buf[i];
 201  0008 c60003        	ld	a,__uart1_tx_head
 202  000b 5f            	clrw	x
 203  000c 97            	ld	xl,a
 204  000d 89            	pushw	x
 205  000e 7b05          	ld	a,(OFST+3,sp)
 206  0010 97            	ld	xl,a
 207  0011 7b06          	ld	a,(OFST+4,sp)
 208  0013 1b04          	add	a,(OFST+2,sp)
 209  0015 2401          	jrnc	L02
 210  0017 5c            	incw	x
 211  0018               L02:
 212  0018 02            	rlwa	x,a
 213  0019 f6            	ld	a,(x)
 214  001a 85            	popw	x
 215  001b d70008        	ld	(_TxBuffer1,x),a
 216                     ; 290 		_uart1_tx_head = (uint8_t)((_uart1_tx_head + 1) % TX1_BUFFER_SIZE);
 218  001e c60003        	ld	a,__uart1_tx_head
 219  0021 5f            	clrw	x
 220  0022 97            	ld	xl,a
 221  0023 5c            	incw	x
 222  0024 a608          	ld	a,#8
 223  0026 cd0000        	call	c_smodx
 225  0029 9f            	ld	a,xl
 226  002a c70003        	ld	__uart1_tx_head,a
 227                     ; 291 		s += 1;
 229  002d 0c01          	inc	(OFST-1,sp)
 230                     ; 287 	for( i=0; i<size; i++ )
 232  002f 0c02          	inc	(OFST+0,sp)
 233  0031               L56:
 236  0031 7b02          	ld	a,(OFST+0,sp)
 237  0033 1107          	cp	a,(OFST+5,sp)
 238  0035 25d1          	jrult	L16
 239                     ; 293 	uart1_tx_485(s);
 241  0037 7b01          	ld	a,(OFST-1,sp)
 242  0039 cd0000        	call	_uart1_tx_485
 244                     ; 294 }
 247  003c 5b04          	addw	sp,#4
 248  003e 81            	ret	
 285                     ; 296 void	uart1_tx_irq(void)
 285                     ; 297 {
 286                     .text:	section	.text,new
 287  0000               _uart1_tx_irq:
 289  0000 88            	push	a
 290       00000001      OFST:	set	1
 293                     ; 301 	COM1_ClearITPendingBit(COM1, COM1_IT_TC);
 295  0001 ae0266        	ldw	x,#614
 296  0004 89            	pushw	x
 297  0005 ae5230        	ldw	x,#21040
 298  0008 cd0000        	call	_USART_ClearITPendingBit
 300  000b c60003        	ld	a,__uart1_tx_head
 301  000e c10002        	cp	a,__uart1_tx_tail
 302  0011 85            	popw	x
 303                     ; 303 	if( _uart1_tx_head == _uart1_tx_tail )
 305  0012 2610          	jrne	L501
 306                     ; 306 		COM1_ITConfig(COM1, COM1_IT_TXE, DISABLE);
 308  0014 4b00          	push	#0
 309  0016 ae0277        	ldw	x,#631
 310  0019 89            	pushw	x
 311  001a ae5230        	ldw	x,#21040
 312  001d cd0000        	call	_USART_ITConfig
 314  0020 5b03          	addw	sp,#3
 315                     ; 312 		return;
 318  0022 84            	pop	a
 319  0023 81            	ret	
 320  0024               L501:
 321                     ; 314 	i = TxBuffer1[_uart1_tx_tail];
 323  0024 c60002        	ld	a,__uart1_tx_tail
 324  0027 5f            	clrw	x
 325  0028 97            	ld	xl,a
 326  0029 d60008        	ld	a,(_TxBuffer1,x)
 327  002c 6b01          	ld	(OFST+0,sp),a
 328                     ; 315 	_uart1_tx_tail = (uint8_t)((_uart1_tx_tail + 1) % TX1_BUFFER_SIZE);
 330  002e c60002        	ld	a,__uart1_tx_tail
 331  0031 5f            	clrw	x
 332  0032 97            	ld	xl,a
 333  0033 5c            	incw	x
 334  0034 a608          	ld	a,#8
 335  0036 cd0000        	call	c_smodx
 337  0039 9f            	ld	a,xl
 338  003a c70002        	ld	__uart1_tx_tail,a
 339                     ; 316     COM1_DR = i;
 341  003d 7b01          	ld	a,(OFST+0,sp)
 342  003f c75231        	ld	21041,a
 343                     ; 317 }
 346  0042 84            	pop	a
 347  0043 81            	ret	
 372                     ; 319 void	uart1_rx_irq(void)
 372                     ; 320 {
 373                     .text:	section	.text,new
 374  0000               _uart1_rx_irq:
 378                     ; 321     RxBuffer1[_uart1_rx_head] = ((uint8_t)COM1_DR);
 380  0000 c60001        	ld	a,__uart1_rx_head
 381  0003 5f            	clrw	x
 382  0004 97            	ld	xl,a
 383  0005 c65231        	ld	a,21041
 384  0008 d70004        	ld	(_RxBuffer1,x),a
 385                     ; 322 	_uart1_rx_head = (uint8_t)((_uart1_rx_head + 1) % RX1_BUFFER_SIZE);
 387  000b c60001        	ld	a,__uart1_rx_head
 388  000e 5f            	clrw	x
 389  000f 97            	ld	xl,a
 390  0010 5c            	incw	x
 391  0011 a604          	ld	a,#4
 392  0013 cd0000        	call	c_smodx
 394  0016 9f            	ld	a,xl
 395  0017 c70001        	ld	__uart1_rx_head,a
 396                     ; 323 }
 399  001a 81            	ret	
 433                     ; 325 uint8_t	uart1_get(void)
 433                     ; 326 {
 434                     .text:	section	.text,new
 435  0000               _uart1_get:
 437  0000 88            	push	a
 438       00000001      OFST:	set	1
 441                     ; 327 	uint8_t	t = RxBuffer1[_uart1_rx_tail];
 443  0001 c60000        	ld	a,__uart1_rx_tail
 444  0004 5f            	clrw	x
 445  0005 97            	ld	xl,a
 446  0006 d60004        	ld	a,(_RxBuffer1,x)
 447  0009 6b01          	ld	(OFST+0,sp),a
 448                     ; 328 	_uart1_rx_tail = (uint8_t)((_uart1_rx_tail + 1) % RX1_BUFFER_SIZE);
 450  000b c60000        	ld	a,__uart1_rx_tail
 451  000e 5f            	clrw	x
 452  000f 97            	ld	xl,a
 453  0010 5c            	incw	x
 454  0011 a604          	ld	a,#4
 455  0013 cd0000        	call	c_smodx
 457  0016 9f            	ld	a,xl
 458  0017 c70000        	ld	__uart1_rx_tail,a
 459                     ; 329 	return t;
 461  001a 7b01          	ld	a,(OFST+0,sp)
 464  001c 5b01          	addw	sp,#1
 465  001e 81            	ret	
 499                     ; 332 uint8_t	uart1_pkt_ready(void)
 499                     ; 333 {
 500                     .text:	section	.text,new
 501  0000               _uart1_pkt_ready:
 503  0000 88            	push	a
 504       00000001      OFST:	set	1
 507                     ; 334 	uint8_t	i = (uint8_t)((_uart1_rx_head - 1 + RX1_BUFFER_SIZE) % RX1_BUFFER_SIZE);
 509  0001 c60001        	ld	a,__uart1_rx_head
 510  0004 5f            	clrw	x
 511  0005 97            	ld	xl,a
 512  0006 1c0003        	addw	x,#3
 513  0009 a604          	ld	a,#4
 514  000b cd0000        	call	c_smodx
 516  000e 9f            	ld	a,xl
 517  000f 6b01          	ld	(OFST+0,sp),a
 518                     ; 335 	return (uint8_t)(RxBuffer1[i]==/*PKT_485_ETX*/0 ? 1 : 0);
 520  0011 5f            	clrw	x
 521  0012 97            	ld	xl,a
 522  0013 724d0004      	tnz	(_RxBuffer1,x)
 523  0017 2604          	jrne	L04
 524  0019 a601          	ld	a,#1
 525  001b 2001          	jra	L24
 526  001d               L04:
 527  001d 4f            	clr	a
 528  001e               L24:
 531  001e 5b01          	addw	sp,#1
 532  0020 81            	ret	
 564                     ; 338 void	systemUart(void)
 564                     ; 339 {
 565                     .text:	section	.text,new
 566  0000               _systemUart:
 570                     ; 343 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
 572  0000 ae0501        	ldw	x,#1281
 573  0003 cd0000        	call	_CLK_PeripheralClockConfig
 575                     ; 346 	GPIO_ExternalPullUpConfig(D_USART_TX_PORT, D_USART_TX_PIN, ENABLE);
 577  0006 4b01          	push	#1
 578  0008 4b08          	push	#8
 579  000a ae500a        	ldw	x,#20490
 580  000d cd0000        	call	_GPIO_ExternalPullUpConfig
 582  0010 85            	popw	x
 583                     ; 350 	GPIO_ExternalPullUpConfig(D_USART_RX_PORT, D_USART_RX_PIN, ENABLE);
 585  0011 4b01          	push	#1
 586  0013 4b04          	push	#4
 587  0015 ae500a        	ldw	x,#20490
 588  0018 cd0000        	call	_GPIO_ExternalPullUpConfig
 590  001b 85            	popw	x
 591                     ; 352 	USART_Init(COM1, 
 591                     ; 353 		9600, 
 591                     ; 354 		USART_WordLength_8b, 
 591                     ; 355 		USART_StopBits_1,
 591                     ; 356 		USART_Parity_No, 
 591                     ; 357 		(USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx
 591                     ; 358 		)
 591                     ; 359 	);
 593  001c 4b0c          	push	#12
 594  001e 4b00          	push	#0
 595  0020 4b00          	push	#0
 596  0022 4b00          	push	#0
 597  0024 ae2580        	ldw	x,#9600
 598  0027 89            	pushw	x
 599  0028 5f            	clrw	x
 600  0029 89            	pushw	x
 601  002a ae5230        	ldw	x,#21040
 602  002d cd0000        	call	_USART_Init
 604  0030 5b08          	addw	sp,#8
 605                     ; 360 	COM1_ITConfig(COM1, COM1_IT_RXNE, ENABLE);
 607  0032 4b01          	push	#1
 608  0034 ae0255        	ldw	x,#597
 609  0037 89            	pushw	x
 610  0038 ae5230        	ldw	x,#21040
 611  003b cd0000        	call	_USART_ITConfig
 613  003e 5b03          	addw	sp,#3
 614                     ; 361 	COM1_ITConfig(COM1, COM1_IT_TC, ENABLE);
 616  0040 4b01          	push	#1
 617  0042 ae0266        	ldw	x,#614
 618  0045 89            	pushw	x
 619  0046 ae5230        	ldw	x,#21040
 620  0049 cd0000        	call	_USART_ITConfig
 622  004c 5b03          	addw	sp,#3
 623                     ; 362 	COM1_Cmd(USART1, ENABLE);
 625  004e 4b01          	push	#1
 626  0050 ae5230        	ldw	x,#21040
 627  0053 cd0000        	call	_USART_Cmd
 629  0056 725f0001      	clr	__uart1_rx_head
 630  005a 725f0000      	clr	__uart1_rx_tail
 631  005e 725f0003      	clr	__uart1_tx_head
 632  0062 725f0002      	clr	__uart1_tx_tail
 633  0066 84            	pop	a
 634                     ; 425 	_uart1_rx_head = 0;
 636                     ; 426 	_uart1_rx_tail = 0;
 638                     ; 427 	_uart1_tx_head = 0;
 640                     ; 428 	_uart1_tx_tail = 0;
 642                     ; 460 }
 645  0067 81            	ret	
 669                     ; 462 void	systemUart3ChangeEvenParity(void)
 669                     ; 463 {
 670                     .text:	section	.text,new
 671  0000               _systemUart3ChangeEvenParity:
 675                     ; 489 }
 678  0000 81            	ret	
 702                     ; 491 void	systemUart3ChangeNoneParity(void)
 702                     ; 492 {
 703                     .text:	section	.text,new
 704  0000               _systemUart3ChangeNoneParity:
 708                     ; 518 }
 711  0000 81            	ret	
 782                     	xdef	_uart1_tx_485
 783                     	switch	.bss
 784  0000               __uart1_rx_tail:
 785  0000 00            	ds.b	1
 786                     	xdef	__uart1_rx_tail
 787  0001               __uart1_rx_head:
 788  0001 00            	ds.b	1
 789                     	xdef	__uart1_rx_head
 790  0002               __uart1_tx_tail:
 791  0002 00            	ds.b	1
 792                     	xdef	__uart1_tx_tail
 793  0003               __uart1_tx_head:
 794  0003 00            	ds.b	1
 795                     	xdef	__uart1_tx_head
 796  0004               _RxBuffer1:
 797  0004 00000000      	ds.b	4
 798                     	xdef	_RxBuffer1
 799  0008               _TxBuffer1:
 800  0008 000000000000  	ds.b	8
 801                     	xdef	_TxBuffer1
 802                     	xdef	_systemUart3ChangeNoneParity
 803                     	xdef	_systemUart3ChangeEvenParity
 804                     	xdef	_systemUart
 805                     	xdef	_uart1_pkt_ready
 806                     	xdef	_uart1_get
 807                     	xdef	_uart1_rx_irq
 808                     	xdef	_uart1_tx_irq
 809                     	xdef	_uart1_tx_put
 810                     	xdef	_uart1_Ready
 811                     	xref	_USART_ClearITPendingBit
 812                     	xref	_USART_ITConfig
 813                     	xref	_USART_Cmd
 814                     	xref	_USART_Init
 815                     	xref	_GPIO_ExternalPullUpConfig
 816                     	xref	_CLK_PeripheralClockConfig
 817                     	xref.b	c_x
 837                     	xref	c_smodx
 838                     	end
