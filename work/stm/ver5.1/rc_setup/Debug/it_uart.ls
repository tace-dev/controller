   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  49                     ; 151 uint8_t	uart1_Ready(void)	
  49                     ; 152 { 
  51                     .text:	section	.text,new
  52  0000               _uart1_Ready:
  56                     ; 153 	return (uint8_t)(_uart1_rx_head != _uart1_rx_tail ? 1 : 0); 
  58  0000 c60001        	ld	a,__uart1_rx_head
  59  0003 c10000        	cp	a,__uart1_rx_tail
  60  0006 2704          	jreq	L6
  61  0008 a601          	ld	a,#1
  62  000a 2001          	jra	L01
  63  000c               L6:
  64  000c 4f            	clr	a
  65  000d               L01:
  68  000d 81            	ret
 101                     ; 156 void	uart1_tx_485(uint8_t s)
 101                     ; 157 {
 102                     .text:	section	.text,new
 103  0000               _uart1_tx_485:
 107                     ; 166 	COM1_ITConfig(COM1, COM1_IT_TXE, ENABLE);
 109  0000 4b01          	push	#1
 110  0002 ae0277        	ldw	x,#631
 111  0005 89            	pushw	x
 112  0006 ae5230        	ldw	x,#21040
 113  0009 cd0000        	call	_USART_ITConfig
 115  000c 5b03          	addw	sp,#3
 116                     ; 170 }
 119  000e 81            	ret
 178                     ; 188 void	uart1_tx_put(uint8_t *buf, uint8_t size)
 178                     ; 189 {
 179                     .text:	section	.text,new
 180  0000               _uart1_tx_put:
 182  0000 89            	pushw	x
 183  0001 89            	pushw	x
 184       00000002      OFST:	set	2
 187                     ; 191 	uint8_t s = 0;
 189  0002 0f01          	clr	(OFST-1,sp)
 190                     ; 193 	for( i=0; i<size; i++ )
 192  0004 0f02          	clr	(OFST+0,sp)
 194  0006 2029          	jra	L56
 195  0008               L16:
 196                     ; 195 		TxBuffer1[_uart1_tx_head] = buf[i];
 198  0008 c60003        	ld	a,__uart1_tx_head
 199  000b 5f            	clrw	x
 200  000c 97            	ld	xl,a
 201  000d 89            	pushw	x
 202  000e 7b05          	ld	a,(OFST+3,sp)
 203  0010 97            	ld	xl,a
 204  0011 7b06          	ld	a,(OFST+4,sp)
 205  0013 1b04          	add	a,(OFST+2,sp)
 206  0015 2401          	jrnc	L61
 207  0017 5c            	incw	x
 208  0018               L61:
 209  0018 02            	rlwa	x,a
 210  0019 f6            	ld	a,(x)
 211  001a 85            	popw	x
 212  001b d70008        	ld	(_TxBuffer1,x),a
 213                     ; 196 		_uart1_tx_head = (uint8_t)((_uart1_tx_head + 1) % TX1_BUFFER_SIZE);
 215  001e c60003        	ld	a,__uart1_tx_head
 216  0021 5f            	clrw	x
 217  0022 97            	ld	xl,a
 218  0023 5c            	incw	x
 219  0024 a608          	ld	a,#8
 220  0026 cd0000        	call	c_smodx
 222  0029 9f            	ld	a,xl
 223  002a c70003        	ld	__uart1_tx_head,a
 224                     ; 197 		s += 1;
 226  002d 0c01          	inc	(OFST-1,sp)
 227                     ; 193 	for( i=0; i<size; i++ )
 229  002f 0c02          	inc	(OFST+0,sp)
 230  0031               L56:
 233  0031 7b02          	ld	a,(OFST+0,sp)
 234  0033 1107          	cp	a,(OFST+5,sp)
 235  0035 25d1          	jrult	L16
 236                     ; 199 	uart1_tx_485(s);
 238  0037 7b01          	ld	a,(OFST-1,sp)
 239  0039 cd0000        	call	_uart1_tx_485
 241                     ; 200 }
 244  003c 5b04          	addw	sp,#4
 245  003e 81            	ret
 282                     ; 202 void	uart1_tx_irq(void)
 282                     ; 203 {
 283                     .text:	section	.text,new
 284  0000               _uart1_tx_irq:
 286  0000 88            	push	a
 287       00000001      OFST:	set	1
 290                     ; 207 	COM1_ClearITPendingBit(COM1, COM1_IT_TC);
 292  0001 ae0266        	ldw	x,#614
 293  0004 89            	pushw	x
 294  0005 ae5230        	ldw	x,#21040
 295  0008 cd0000        	call	_USART_ClearITPendingBit
 297  000b 85            	popw	x
 298                     ; 209 	if( _uart1_tx_head == _uart1_tx_tail )
 300  000c c60003        	ld	a,__uart1_tx_head
 301  000f c10002        	cp	a,__uart1_tx_tail
 302  0012 2610          	jrne	L501
 303                     ; 212 		COM1_ITConfig(COM1, COM1_IT_TXE, DISABLE);
 305  0014 4b00          	push	#0
 306  0016 ae0277        	ldw	x,#631
 307  0019 89            	pushw	x
 308  001a ae5230        	ldw	x,#21040
 309  001d cd0000        	call	_USART_ITConfig
 311  0020 5b03          	addw	sp,#3
 312                     ; 216 		return;
 315  0022 84            	pop	a
 316  0023 81            	ret
 317  0024               L501:
 318                     ; 218 	i = TxBuffer1[_uart1_tx_tail];
 320  0024 c60002        	ld	a,__uart1_tx_tail
 321  0027 5f            	clrw	x
 322  0028 97            	ld	xl,a
 323  0029 d60008        	ld	a,(_TxBuffer1,x)
 324  002c 6b01          	ld	(OFST+0,sp),a
 325                     ; 219 	_uart1_tx_tail = (uint8_t)((_uart1_tx_tail + 1) % TX1_BUFFER_SIZE);
 327  002e c60002        	ld	a,__uart1_tx_tail
 328  0031 5f            	clrw	x
 329  0032 97            	ld	xl,a
 330  0033 5c            	incw	x
 331  0034 a608          	ld	a,#8
 332  0036 cd0000        	call	c_smodx
 334  0039 9f            	ld	a,xl
 335  003a c70002        	ld	__uart1_tx_tail,a
 336                     ; 220     COM1_DR = i;
 338  003d 7b01          	ld	a,(OFST+0,sp)
 339  003f c75231        	ld	21041,a
 340                     ; 221 }
 343  0042 84            	pop	a
 344  0043 81            	ret
 369                     ; 223 void	uart1_rx_irq(void)
 369                     ; 224 {
 370                     .text:	section	.text,new
 371  0000               _uart1_rx_irq:
 375                     ; 225     RxBuffer1[_uart1_rx_head] = ((uint8_t)COM1_DR);
 377  0000 c60001        	ld	a,__uart1_rx_head
 378  0003 5f            	clrw	x
 379  0004 97            	ld	xl,a
 380  0005 c65231        	ld	a,21041
 381  0008 d70004        	ld	(_RxBuffer1,x),a
 382                     ; 226 	_uart1_rx_head = (uint8_t)((_uart1_rx_head + 1) % RX1_BUFFER_SIZE);
 384  000b c60001        	ld	a,__uart1_rx_head
 385  000e 5f            	clrw	x
 386  000f 97            	ld	xl,a
 387  0010 5c            	incw	x
 388  0011 a604          	ld	a,#4
 389  0013 cd0000        	call	c_smodx
 391  0016 9f            	ld	a,xl
 392  0017 c70001        	ld	__uart1_rx_head,a
 393                     ; 227 }
 396  001a 81            	ret
 430                     ; 229 uint8_t	uart1_get(void)
 430                     ; 230 {
 431                     .text:	section	.text,new
 432  0000               _uart1_get:
 434  0000 88            	push	a
 435       00000001      OFST:	set	1
 438                     ; 231 	uint8_t	t = RxBuffer1[_uart1_rx_tail];
 440  0001 c60000        	ld	a,__uart1_rx_tail
 441  0004 5f            	clrw	x
 442  0005 97            	ld	xl,a
 443  0006 d60004        	ld	a,(_RxBuffer1,x)
 444  0009 6b01          	ld	(OFST+0,sp),a
 445                     ; 232 	_uart1_rx_tail = (uint8_t)((_uart1_rx_tail + 1) % RX1_BUFFER_SIZE);
 447  000b c60000        	ld	a,__uart1_rx_tail
 448  000e 5f            	clrw	x
 449  000f 97            	ld	xl,a
 450  0010 5c            	incw	x
 451  0011 a604          	ld	a,#4
 452  0013 cd0000        	call	c_smodx
 454  0016 9f            	ld	a,xl
 455  0017 c70000        	ld	__uart1_rx_tail,a
 456                     ; 233 	return t;
 458  001a 7b01          	ld	a,(OFST+0,sp)
 461  001c 5b01          	addw	sp,#1
 462  001e 81            	ret
 496                     ; 236 uint8_t	uart1_pkt_ready(void)
 496                     ; 237 {
 497                     .text:	section	.text,new
 498  0000               _uart1_pkt_ready:
 500  0000 88            	push	a
 501       00000001      OFST:	set	1
 504                     ; 238 	uint8_t	i = (uint8_t)((_uart1_rx_head - 1 + RX1_BUFFER_SIZE) % RX1_BUFFER_SIZE);
 506  0001 c60001        	ld	a,__uart1_rx_head
 507  0004 5f            	clrw	x
 508  0005 97            	ld	xl,a
 509  0006 1c0003        	addw	x,#3
 510  0009 a604          	ld	a,#4
 511  000b cd0000        	call	c_smodx
 513  000e 9f            	ld	a,xl
 514  000f 6b01          	ld	(OFST+0,sp),a
 515                     ; 239 	return (uint8_t)(RxBuffer1[i]==/*PKT_485_ETX*/0 ? 1 : 0);
 517  0011 7b01          	ld	a,(OFST+0,sp)
 518  0013 5f            	clrw	x
 519  0014 97            	ld	xl,a
 520  0015 724d0004      	tnz	(_RxBuffer1,x)
 521  0019 2604          	jrne	L03
 522  001b a601          	ld	a,#1
 523  001d 2001          	jra	L23
 524  001f               L03:
 525  001f 4f            	clr	a
 526  0020               L23:
 529  0020 5b01          	addw	sp,#1
 530  0022 81            	ret
 562                     ; 242 void	systemUart(void)
 562                     ; 243 {
 563                     .text:	section	.text,new
 564  0000               _systemUart:
 568                     ; 247 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
 570  0000 ae0501        	ldw	x,#1281
 571  0003 cd0000        	call	_CLK_PeripheralClockConfig
 573                     ; 250 	GPIO_ExternalPullUpConfig(D_USART_TX_PORT, D_USART_TX_PIN, ENABLE);
 575  0006 4b01          	push	#1
 576  0008 4b08          	push	#8
 577  000a ae500a        	ldw	x,#20490
 578  000d cd0000        	call	_GPIO_ExternalPullUpConfig
 580  0010 85            	popw	x
 581                     ; 254 	GPIO_ExternalPullUpConfig(D_USART_RX_PORT, D_USART_RX_PIN, ENABLE);
 583  0011 4b01          	push	#1
 584  0013 4b04          	push	#4
 585  0015 ae500a        	ldw	x,#20490
 586  0018 cd0000        	call	_GPIO_ExternalPullUpConfig
 588  001b 85            	popw	x
 589                     ; 256 	USART_Init(COM1, 
 589                     ; 257 		9600, 
 589                     ; 258 		USART_WordLength_8b, 
 589                     ; 259 		USART_StopBits_1,
 589                     ; 260 		USART_Parity_No, 
 589                     ; 261 		(USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx
 589                     ; 262 		)
 589                     ; 263 	);
 591  001c 4b0c          	push	#12
 592  001e 4b00          	push	#0
 593  0020 4b00          	push	#0
 594  0022 4b00          	push	#0
 595  0024 ae2580        	ldw	x,#9600
 596  0027 89            	pushw	x
 597  0028 ae0000        	ldw	x,#0
 598  002b 89            	pushw	x
 599  002c ae5230        	ldw	x,#21040
 600  002f cd0000        	call	_USART_Init
 602  0032 5b08          	addw	sp,#8
 603                     ; 264 	COM1_ITConfig(COM1, COM1_IT_RXNE, ENABLE);
 605  0034 4b01          	push	#1
 606  0036 ae0255        	ldw	x,#597
 607  0039 89            	pushw	x
 608  003a ae5230        	ldw	x,#21040
 609  003d cd0000        	call	_USART_ITConfig
 611  0040 5b03          	addw	sp,#3
 612                     ; 265 	COM1_ITConfig(COM1, COM1_IT_TC, ENABLE);
 614  0042 4b01          	push	#1
 615  0044 ae0266        	ldw	x,#614
 616  0047 89            	pushw	x
 617  0048 ae5230        	ldw	x,#21040
 618  004b cd0000        	call	_USART_ITConfig
 620  004e 5b03          	addw	sp,#3
 621                     ; 266 	COM1_Cmd(USART1, ENABLE);
 623  0050 4b01          	push	#1
 624  0052 ae5230        	ldw	x,#21040
 625  0055 cd0000        	call	_USART_Cmd
 627  0058 84            	pop	a
 628                     ; 290 	_uart1_rx_head = 0;
 630  0059 725f0001      	clr	__uart1_rx_head
 631                     ; 291 	_uart1_rx_tail = 0;
 633  005d 725f0000      	clr	__uart1_rx_tail
 634                     ; 292 	_uart1_tx_head = 0;
 636  0061 725f0003      	clr	__uart1_tx_head
 637                     ; 293 	_uart1_tx_tail = 0;
 639  0065 725f0002      	clr	__uart1_tx_tail
 640                     ; 325 }
 643  0069 81            	ret
 667                     ; 327 void	systemUart3ChangeEvenParity(void)
 667                     ; 328 {
 668                     .text:	section	.text,new
 669  0000               _systemUart3ChangeEvenParity:
 673                     ; 354 }
 676  0000 81            	ret
 700                     ; 356 void	systemUart3ChangeNoneParity(void)
 700                     ; 357 {
 701                     .text:	section	.text,new
 702  0000               _systemUart3ChangeNoneParity:
 706                     ; 383 }
 709  0000 81            	ret
 780                     	xdef	_uart1_tx_485
 781                     	switch	.bss
 782  0000               __uart1_rx_tail:
 783  0000 00            	ds.b	1
 784                     	xdef	__uart1_rx_tail
 785  0001               __uart1_rx_head:
 786  0001 00            	ds.b	1
 787                     	xdef	__uart1_rx_head
 788  0002               __uart1_tx_tail:
 789  0002 00            	ds.b	1
 790                     	xdef	__uart1_tx_tail
 791  0003               __uart1_tx_head:
 792  0003 00            	ds.b	1
 793                     	xdef	__uart1_tx_head
 794  0004               _RxBuffer1:
 795  0004 00000000      	ds.b	4
 796                     	xdef	_RxBuffer1
 797  0008               _TxBuffer1:
 798  0008 000000000000  	ds.b	8
 799                     	xdef	_TxBuffer1
 800                     	xdef	_systemUart3ChangeNoneParity
 801                     	xdef	_systemUart3ChangeEvenParity
 802                     	xdef	_systemUart
 803                     	xdef	_uart1_pkt_ready
 804                     	xdef	_uart1_get
 805                     	xdef	_uart1_rx_irq
 806                     	xdef	_uart1_tx_irq
 807                     	xdef	_uart1_tx_put
 808                     	xdef	_uart1_Ready
 809                     	xref	_USART_ClearITPendingBit
 810                     	xref	_USART_ITConfig
 811                     	xref	_USART_Cmd
 812                     	xref	_USART_Init
 813                     	xref	_GPIO_ExternalPullUpConfig
 814                     	xref	_CLK_PeripheralClockConfig
 815                     	xref.b	c_x
 835                     	xref	c_smodx
 836                     	end
