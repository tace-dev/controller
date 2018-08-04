   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  52                     ; 151 uint8_t	uart1_Ready(void)	
  52                     ; 152 { 
  53                     .text:	section	.text,new
  54  0000               f_uart1_Ready:
  58                     ; 153 	return (uint8_t)(_uart1_rx_head != _uart1_rx_tail ? 1 : 0); 
  60  0000 c60001        	ld	a,__uart1_rx_head
  61  0003 c10000        	cp	a,__uart1_rx_tail
  62  0006 2703          	jreq	L6
  63  0008 a601          	ld	a,#1
  65  000a 87            	retf	
  66  000b               L6:
  67  000b 4f            	clr	a
  70  000c 87            	retf	
 102                     ; 156 void	uart1_tx_485(uint8_t s)
 102                     ; 157 {
 103                     .text:	section	.text,new
 104  0000               f_uart1_tx_485:
 108                     ; 168 	COM1_ITConfig(COM1, COM1_IT_TXE, ENABLE);
 110  0000 4b01          	push	#1
 111  0002 ae0277        	ldw	x,#631
 112  0005 89            	pushw	x
 113  0006 ae5230        	ldw	x,#21040
 114  0009 8d000000      	callf	f_USART_ITConfig
 116  000d 5b03          	addw	sp,#3
 117                     ; 172 }
 120  000f 87            	retf	
 178                     ; 190 void	uart1_tx_put(uint8_t *buf, uint8_t size)
 178                     ; 191 {
 179                     .text:	section	.text,new
 180  0000               f_uart1_tx_put:
 182  0000 89            	pushw	x
 183  0001 89            	pushw	x
 184       00000002      OFST:	set	2
 187                     ; 193 	uint8_t s = 0;
 189  0002 0f01          	clr	(OFST-1,sp)
 190                     ; 195 	for( i=0; i<size; i++ )
 192  0004 0f02          	clr	(OFST+0,sp)
 194  0006 202a          	jra	L56
 195  0008               L16:
 196                     ; 197 		TxBuffer1[_uart1_tx_head] = buf[i];
 198  0008 c60003        	ld	a,__uart1_tx_head
 199  000b 5f            	clrw	x
 200  000c 97            	ld	xl,a
 201  000d 89            	pushw	x
 202  000e 7b05          	ld	a,(OFST+3,sp)
 203  0010 97            	ld	xl,a
 204  0011 7b06          	ld	a,(OFST+4,sp)
 205  0013 1b04          	add	a,(OFST+2,sp)
 206  0015 2401          	jrnc	L02
 207  0017 5c            	incw	x
 208  0018               L02:
 209  0018 02            	rlwa	x,a
 210  0019 f6            	ld	a,(x)
 211  001a 85            	popw	x
 212  001b d70008        	ld	(_TxBuffer1,x),a
 213                     ; 198 		_uart1_tx_head = (uint8_t)((_uart1_tx_head + 1) % TX1_BUFFER_SIZE);
 215  001e c60003        	ld	a,__uart1_tx_head
 216  0021 5f            	clrw	x
 217  0022 97            	ld	xl,a
 218  0023 5c            	incw	x
 219  0024 a608          	ld	a,#8
 220  0026 8d000000      	callf	d_smodx
 222  002a 9f            	ld	a,xl
 223  002b c70003        	ld	__uart1_tx_head,a
 224                     ; 199 		s += 1;
 226  002e 0c01          	inc	(OFST-1,sp)
 227                     ; 195 	for( i=0; i<size; i++ )
 229  0030 0c02          	inc	(OFST+0,sp)
 230  0032               L56:
 233  0032 7b02          	ld	a,(OFST+0,sp)
 234  0034 1108          	cp	a,(OFST+6,sp)
 235  0036 25d0          	jrult	L16
 236                     ; 201 	uart1_tx_485(s);
 238  0038 7b01          	ld	a,(OFST-1,sp)
 239  003a 8d000000      	callf	f_uart1_tx_485
 241                     ; 202 }
 244  003e 5b04          	addw	sp,#4
 245  0040 87            	retf	
 280                     ; 204 void	uart1_tx_irq(void)
 280                     ; 205 {
 281                     .text:	section	.text,new
 282  0000               f_uart1_tx_irq:
 284  0000 88            	push	a
 285       00000001      OFST:	set	1
 288                     ; 211 	if( _uart1_tx_head == _uart1_tx_tail )
 290  0001 c60003        	ld	a,__uart1_tx_head
 291  0004 c10002        	cp	a,__uart1_tx_tail
 292  0007 2611          	jrne	L501
 293                     ; 216 		COM1_ITConfig(COM1, COM1_IT_TXE, DISABLE);
 295  0009 4b00          	push	#0
 296  000b ae0277        	ldw	x,#631
 297  000e 89            	pushw	x
 298  000f ae5230        	ldw	x,#21040
 299  0012 8d000000      	callf	f_USART_ITConfig
 301  0016 5b03          	addw	sp,#3
 302                     ; 220 		return;
 305  0018 84            	pop	a
 306  0019 87            	retf	
 307  001a               L501:
 308                     ; 222 	i = TxBuffer1[_uart1_tx_tail];
 310  001a c60002        	ld	a,__uart1_tx_tail
 311  001d 5f            	clrw	x
 312  001e 97            	ld	xl,a
 313  001f d60008        	ld	a,(_TxBuffer1,x)
 314  0022 6b01          	ld	(OFST+0,sp),a
 315                     ; 223 	_uart1_tx_tail = (uint8_t)((_uart1_tx_tail + 1) % TX1_BUFFER_SIZE);
 317  0024 c60002        	ld	a,__uart1_tx_tail
 318  0027 5f            	clrw	x
 319  0028 97            	ld	xl,a
 320  0029 5c            	incw	x
 321  002a a608          	ld	a,#8
 322  002c 8d000000      	callf	d_smodx
 324  0030 9f            	ld	a,xl
 325  0031 c70002        	ld	__uart1_tx_tail,a
 326                     ; 224     COM1_DR = i;
 328  0034 7b01          	ld	a,(OFST+0,sp)
 329  0036 c75231        	ld	21041,a
 330                     ; 225 }
 333  0039 84            	pop	a
 334  003a 87            	retf	
 358                     ; 227 void	uart1_rx_irq(void)
 358                     ; 228 {
 359                     .text:	section	.text,new
 360  0000               f_uart1_rx_irq:
 364                     ; 229     RxBuffer1[_uart1_rx_head] = ((uint8_t)COM1_DR);
 366  0000 c60001        	ld	a,__uart1_rx_head
 367  0003 5f            	clrw	x
 368  0004 97            	ld	xl,a
 369  0005 c65231        	ld	a,21041
 370  0008 d70004        	ld	(_RxBuffer1,x),a
 371                     ; 230 	_uart1_rx_head = (uint8_t)((_uart1_rx_head + 1) % RX1_BUFFER_SIZE);
 373  000b c60001        	ld	a,__uart1_rx_head
 374  000e 5f            	clrw	x
 375  000f 97            	ld	xl,a
 376  0010 5c            	incw	x
 377  0011 a604          	ld	a,#4
 378  0013 8d000000      	callf	d_smodx
 380  0017 9f            	ld	a,xl
 381  0018 c70001        	ld	__uart1_rx_head,a
 382                     ; 231 }
 385  001b 87            	retf	
 418                     ; 233 uint8_t	uart1_get(void)
 418                     ; 234 {
 419                     .text:	section	.text,new
 420  0000               f_uart1_get:
 422  0000 88            	push	a
 423       00000001      OFST:	set	1
 426                     ; 235 	uint8_t	t = RxBuffer1[_uart1_rx_tail];
 428  0001 c60000        	ld	a,__uart1_rx_tail
 429  0004 5f            	clrw	x
 430  0005 97            	ld	xl,a
 431  0006 d60004        	ld	a,(_RxBuffer1,x)
 432  0009 6b01          	ld	(OFST+0,sp),a
 433                     ; 236 	_uart1_rx_tail = (uint8_t)((_uart1_rx_tail + 1) % RX1_BUFFER_SIZE);
 435  000b c60000        	ld	a,__uart1_rx_tail
 436  000e 5f            	clrw	x
 437  000f 97            	ld	xl,a
 438  0010 5c            	incw	x
 439  0011 a604          	ld	a,#4
 440  0013 8d000000      	callf	d_smodx
 442  0017 9f            	ld	a,xl
 443  0018 c70000        	ld	__uart1_rx_tail,a
 444                     ; 237 	return t;
 446  001b 7b01          	ld	a,(OFST+0,sp)
 449  001d 5b01          	addw	sp,#1
 450  001f 87            	retf	
 483                     ; 240 uint8_t	uart1_pkt_ready(void)
 483                     ; 241 {
 484                     .text:	section	.text,new
 485  0000               f_uart1_pkt_ready:
 487  0000 88            	push	a
 488       00000001      OFST:	set	1
 491                     ; 242 	uint8_t	i = (uint8_t)((_uart1_rx_head - 1 + RX1_BUFFER_SIZE) % RX1_BUFFER_SIZE);
 493  0001 c60001        	ld	a,__uart1_rx_head
 494  0004 5f            	clrw	x
 495  0005 97            	ld	xl,a
 496  0006 1c0003        	addw	x,#3
 497  0009 a604          	ld	a,#4
 498  000b 8d000000      	callf	d_smodx
 500  000f 9f            	ld	a,xl
 501  0010 6b01          	ld	(OFST+0,sp),a
 502                     ; 243 	return (uint8_t)(RxBuffer1[i]==/*PKT_485_ETX*/0 ? 1 : 0);
 504  0012 5f            	clrw	x
 505  0013 97            	ld	xl,a
 506  0014 724d0004      	tnz	(_RxBuffer1,x)
 507  0018 2604          	jrne	L63
 508  001a a601          	ld	a,#1
 509  001c 2001          	jra	L04
 510  001e               L63:
 511  001e 4f            	clr	a
 512  001f               L04:
 515  001f 5b01          	addw	sp,#1
 516  0021 87            	retf	
 547                     ; 246 void	systemUart(void)
 547                     ; 247 {
 548                     .text:	section	.text,new
 549  0000               f_systemUart:
 553                     ; 273 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
 555  0000 ae0501        	ldw	x,#1281
 556  0003 8d000000      	callf	f_CLK_PeripheralClockConfig
 558                     ; 274 	GPIO_ExternalPullUpConfig(D_USART_TX_PORT, D_USART_TX_PIN, ENABLE);
 560  0007 4b01          	push	#1
 561  0009 4b08          	push	#8
 562  000b ae500a        	ldw	x,#20490
 563  000e 8d000000      	callf	f_GPIO_ExternalPullUpConfig
 565  0012 85            	popw	x
 566                     ; 275 	GPIO_ExternalPullUpConfig(D_USART_RX_PORT, D_USART_RX_PIN, ENABLE);
 568  0013 4b01          	push	#1
 569  0015 4b04          	push	#4
 570  0017 ae500a        	ldw	x,#20490
 571  001a 8d000000      	callf	f_GPIO_ExternalPullUpConfig
 573  001e 85            	popw	x
 574                     ; 277 	USART_Init(COM1, 
 574                     ; 278 		9600, 
 574                     ; 279 		USART_WordLength_8b, 
 574                     ; 280 		USART_StopBits_1,
 574                     ; 281 		USART_Parity_No, 
 574                     ; 282 		(USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx
 574                     ; 283 		)
 574                     ; 284 	);
 576  001f 4b0c          	push	#12
 577  0021 4b00          	push	#0
 578  0023 4b00          	push	#0
 579  0025 4b00          	push	#0
 580  0027 ae2580        	ldw	x,#9600
 581  002a 89            	pushw	x
 582  002b 5f            	clrw	x
 583  002c 89            	pushw	x
 584  002d ae5230        	ldw	x,#21040
 585  0030 8d000000      	callf	f_USART_Init
 587  0034 5b08          	addw	sp,#8
 588                     ; 285 	COM1_ITConfig(COM1, COM1_IT_RXNE, ENABLE);
 590  0036 4b01          	push	#1
 591  0038 ae0255        	ldw	x,#597
 592  003b 89            	pushw	x
 593  003c ae5230        	ldw	x,#21040
 594  003f 8d000000      	callf	f_USART_ITConfig
 596  0043 5b03          	addw	sp,#3
 597                     ; 286 	COM1_ITConfig(COM1, COM1_IT_TC, ENABLE);
 599  0045 4b01          	push	#1
 600  0047 ae0266        	ldw	x,#614
 601  004a 89            	pushw	x
 602  004b ae5230        	ldw	x,#21040
 603  004e 8d000000      	callf	f_USART_ITConfig
 605  0052 5b03          	addw	sp,#3
 606                     ; 287 	COM1_Cmd(USART1, ENABLE);
 608  0054 4b01          	push	#1
 609  0056 ae5230        	ldw	x,#21040
 610  0059 8d000000      	callf	f_USART_Cmd
 612  005d 725f0001      	clr	__uart1_rx_head
 613  0061 725f0000      	clr	__uart1_rx_tail
 614  0065 725f0003      	clr	__uart1_tx_head
 615  0069 725f0002      	clr	__uart1_tx_tail
 616  006d 84            	pop	a
 617                     ; 311 	_uart1_rx_head = 0;
 619                     ; 312 	_uart1_rx_tail = 0;
 621                     ; 313 	_uart1_tx_head = 0;
 623                     ; 314 	_uart1_tx_tail = 0;
 625                     ; 346 }
 628  006e 87            	retf	
 651                     ; 348 void	systemUart3ChangeEvenParity(void)
 651                     ; 349 {
 652                     .text:	section	.text,new
 653  0000               f_systemUart3ChangeEvenParity:
 657                     ; 375 }
 660  0000 87            	retf	
 683                     ; 377 void	systemUart3ChangeNoneParity(void)
 683                     ; 378 {
 684                     .text:	section	.text,new
 685  0000               f_systemUart3ChangeNoneParity:
 689                     ; 404 }
 692  0000 87            	retf	
 762                     	xdef	f_uart1_tx_485
 763                     	switch	.bss
 764  0000               __uart1_rx_tail:
 765  0000 00            	ds.b	1
 766                     	xdef	__uart1_rx_tail
 767  0001               __uart1_rx_head:
 768  0001 00            	ds.b	1
 769                     	xdef	__uart1_rx_head
 770  0002               __uart1_tx_tail:
 771  0002 00            	ds.b	1
 772                     	xdef	__uart1_tx_tail
 773  0003               __uart1_tx_head:
 774  0003 00            	ds.b	1
 775                     	xdef	__uart1_tx_head
 776  0004               _RxBuffer1:
 777  0004 00000000      	ds.b	4
 778                     	xdef	_RxBuffer1
 779  0008               _TxBuffer1:
 780  0008 000000000000  	ds.b	8
 781                     	xdef	_TxBuffer1
 782                     	xdef	f_systemUart3ChangeNoneParity
 783                     	xdef	f_systemUart3ChangeEvenParity
 784                     	xdef	f_systemUart
 785                     	xdef	f_uart1_pkt_ready
 786                     	xdef	f_uart1_get
 787                     	xdef	f_uart1_rx_irq
 788                     	xdef	f_uart1_tx_irq
 789                     	xdef	f_uart1_tx_put
 790                     	xdef	f_uart1_Ready
 791                     	xref	f_USART_ITConfig
 792                     	xref	f_USART_Cmd
 793                     	xref	f_USART_Init
 794                     	xref	f_GPIO_ExternalPullUpConfig
 795                     	xref	f_CLK_PeripheralClockConfig
 796                     	xref.b	c_x
 816                     	xref	d_smodx
 817                     	end
