   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  51                     ; 151 uint8_t	uart1_Ready(void)	
  51                     ; 152 { 
  53                     	switch	.text
  54  0000               _uart1_Ready:
  58                     ; 153 	return (uint8_t)(_uart1_rx_head != _uart1_rx_tail ? 1 : 0); 
  60  0000 c60001        	ld	a,__uart1_rx_head
  61  0003 c10000        	cp	a,__uart1_rx_tail
  62  0006 2703          	jreq	L6
  63  0008 a601          	ld	a,#1
  65  000a 81            	ret	
  66  000b               L6:
  67  000b 4f            	clr	a
  70  000c 81            	ret	
 103                     ; 156 void	uart1_tx_485(uint8_t s)
 103                     ; 157 {
 104                     	switch	.text
 105  000d               _uart1_tx_485:
 109                     ; 166 	COM1_ITConfig(COM1, COM1_IT_TXE, ENABLE);
 111  000d 4b01          	push	#1
 112  000f ae0277        	ldw	x,#631
 113  0012 89            	pushw	x
 114  0013 ae5230        	ldw	x,#21040
 115  0016 cd0000        	call	_USART_ITConfig
 117  0019 5b03          	addw	sp,#3
 118                     ; 170 }
 121  001b 81            	ret	
 180                     ; 188 void	uart1_tx_put(uint8_t *buf, uint8_t size)
 180                     ; 189 {
 181                     	switch	.text
 182  001c               _uart1_tx_put:
 184  001c 89            	pushw	x
 185  001d 89            	pushw	x
 186       00000002      OFST:	set	2
 189                     ; 191 	uint8_t s = 0;
 191  001e 0f01          	clr	(OFST-1,sp)
 192                     ; 193 	for( i=0; i<size; i++ )
 194  0020 0f02          	clr	(OFST+0,sp)
 196  0022 2029          	jra	L56
 197  0024               L16:
 198                     ; 195 		TxBuffer1[_uart1_tx_head] = buf[i];
 200  0024 c60003        	ld	a,__uart1_tx_head
 201  0027 5f            	clrw	x
 202  0028 97            	ld	xl,a
 203  0029 89            	pushw	x
 204  002a 7b05          	ld	a,(OFST+3,sp)
 205  002c 97            	ld	xl,a
 206  002d 7b06          	ld	a,(OFST+4,sp)
 207  002f 1b04          	add	a,(OFST+2,sp)
 208  0031 2401          	jrnc	L02
 209  0033 5c            	incw	x
 210  0034               L02:
 211  0034 02            	rlwa	x,a
 212  0035 f6            	ld	a,(x)
 213  0036 85            	popw	x
 214  0037 d70008        	ld	(_TxBuffer1,x),a
 215                     ; 196 		_uart1_tx_head = (uint8_t)((_uart1_tx_head + 1) % TX1_BUFFER_SIZE);
 217  003a c60003        	ld	a,__uart1_tx_head
 218  003d 5f            	clrw	x
 219  003e 97            	ld	xl,a
 220  003f 5c            	incw	x
 221  0040 a608          	ld	a,#8
 222  0042 cd0000        	call	c_smodx
 224  0045 9f            	ld	a,xl
 225  0046 c70003        	ld	__uart1_tx_head,a
 226                     ; 197 		s += 1;
 228  0049 0c01          	inc	(OFST-1,sp)
 229                     ; 193 	for( i=0; i<size; i++ )
 231  004b 0c02          	inc	(OFST+0,sp)
 232  004d               L56:
 235  004d 7b02          	ld	a,(OFST+0,sp)
 236  004f 1107          	cp	a,(OFST+5,sp)
 237  0051 25d1          	jrult	L16
 238                     ; 199 	uart1_tx_485(s);
 240  0053 7b01          	ld	a,(OFST-1,sp)
 241  0055 adb6          	call	_uart1_tx_485
 243                     ; 200 }
 246  0057 5b04          	addw	sp,#4
 247  0059 81            	ret	
 284                     ; 202 void	uart1_tx_irq(void)
 284                     ; 203 {
 285                     	switch	.text
 286  005a               _uart1_tx_irq:
 288  005a 88            	push	a
 289       00000001      OFST:	set	1
 292                     ; 207 	COM1_ClearITPendingBit(COM1, COM1_IT_TC);
 294  005b ae0266        	ldw	x,#614
 295  005e 89            	pushw	x
 296  005f ae5230        	ldw	x,#21040
 297  0062 cd0000        	call	_USART_ClearITPendingBit
 299  0065 c60003        	ld	a,__uart1_tx_head
 300  0068 c10002        	cp	a,__uart1_tx_tail
 301  006b 85            	popw	x
 302                     ; 209 	if( _uart1_tx_head == _uart1_tx_tail )
 304  006c 2610          	jrne	L501
 305                     ; 212 		COM1_ITConfig(COM1, COM1_IT_TXE, DISABLE);
 307  006e 4b00          	push	#0
 308  0070 ae0277        	ldw	x,#631
 309  0073 89            	pushw	x
 310  0074 ae5230        	ldw	x,#21040
 311  0077 cd0000        	call	_USART_ITConfig
 313  007a 5b03          	addw	sp,#3
 314                     ; 216 		return;
 317  007c 84            	pop	a
 318  007d 81            	ret	
 319  007e               L501:
 320                     ; 218 	i = TxBuffer1[_uart1_tx_tail];
 322  007e c60002        	ld	a,__uart1_tx_tail
 323  0081 5f            	clrw	x
 324  0082 97            	ld	xl,a
 325  0083 d60008        	ld	a,(_TxBuffer1,x)
 326  0086 6b01          	ld	(OFST+0,sp),a
 327                     ; 219 	_uart1_tx_tail = (uint8_t)((_uart1_tx_tail + 1) % TX1_BUFFER_SIZE);
 329  0088 c60002        	ld	a,__uart1_tx_tail
 330  008b 5f            	clrw	x
 331  008c 97            	ld	xl,a
 332  008d 5c            	incw	x
 333  008e a608          	ld	a,#8
 334  0090 cd0000        	call	c_smodx
 336  0093 9f            	ld	a,xl
 337  0094 c70002        	ld	__uart1_tx_tail,a
 338                     ; 220     COM1_DR = i;
 340  0097 7b01          	ld	a,(OFST+0,sp)
 341  0099 c75231        	ld	21041,a
 342                     ; 221 }
 345  009c 84            	pop	a
 346  009d 81            	ret	
 371                     ; 223 void	uart1_rx_irq(void)
 371                     ; 224 {
 372                     	switch	.text
 373  009e               _uart1_rx_irq:
 377                     ; 225     RxBuffer1[_uart1_rx_head] = ((uint8_t)COM1_DR);
 379  009e c60001        	ld	a,__uart1_rx_head
 380  00a1 5f            	clrw	x
 381  00a2 97            	ld	xl,a
 382  00a3 c65231        	ld	a,21041
 383  00a6 d70004        	ld	(_RxBuffer1,x),a
 384                     ; 226 	_uart1_rx_head = (uint8_t)((_uart1_rx_head + 1) % RX1_BUFFER_SIZE);
 386  00a9 c60001        	ld	a,__uart1_rx_head
 387  00ac 5f            	clrw	x
 388  00ad 97            	ld	xl,a
 389  00ae 5c            	incw	x
 390  00af a604          	ld	a,#4
 391  00b1 cd0000        	call	c_smodx
 393  00b4 9f            	ld	a,xl
 394  00b5 c70001        	ld	__uart1_rx_head,a
 395                     ; 227 }
 398  00b8 81            	ret	
 432                     ; 229 uint8_t	uart1_get(void)
 432                     ; 230 {
 433                     	switch	.text
 434  00b9               _uart1_get:
 436  00b9 88            	push	a
 437       00000001      OFST:	set	1
 440                     ; 231 	uint8_t	t = RxBuffer1[_uart1_rx_tail];
 442  00ba c60000        	ld	a,__uart1_rx_tail
 443  00bd 5f            	clrw	x
 444  00be 97            	ld	xl,a
 445  00bf d60004        	ld	a,(_RxBuffer1,x)
 446  00c2 6b01          	ld	(OFST+0,sp),a
 447                     ; 232 	_uart1_rx_tail = (uint8_t)((_uart1_rx_tail + 1) % RX1_BUFFER_SIZE);
 449  00c4 c60000        	ld	a,__uart1_rx_tail
 450  00c7 5f            	clrw	x
 451  00c8 97            	ld	xl,a
 452  00c9 5c            	incw	x
 453  00ca a604          	ld	a,#4
 454  00cc cd0000        	call	c_smodx
 456  00cf 9f            	ld	a,xl
 457  00d0 c70000        	ld	__uart1_rx_tail,a
 458                     ; 233 	return t;
 460  00d3 7b01          	ld	a,(OFST+0,sp)
 463  00d5 5b01          	addw	sp,#1
 464  00d7 81            	ret	
 498                     ; 236 uint8_t	uart1_pkt_ready(void)
 498                     ; 237 {
 499                     	switch	.text
 500  00d8               _uart1_pkt_ready:
 502  00d8 88            	push	a
 503       00000001      OFST:	set	1
 506                     ; 238 	uint8_t	i = (uint8_t)((_uart1_rx_head - 1 + RX1_BUFFER_SIZE) % RX1_BUFFER_SIZE);
 508  00d9 c60001        	ld	a,__uart1_rx_head
 509  00dc 5f            	clrw	x
 510  00dd 97            	ld	xl,a
 511  00de 1c0003        	addw	x,#3
 512  00e1 a604          	ld	a,#4
 513  00e3 cd0000        	call	c_smodx
 515  00e6 9f            	ld	a,xl
 516  00e7 6b01          	ld	(OFST+0,sp),a
 517                     ; 239 	return (uint8_t)(RxBuffer1[i]==/*PKT_485_ETX*/0 ? 1 : 0);
 519  00e9 5f            	clrw	x
 520  00ea 97            	ld	xl,a
 521  00eb 724d0004      	tnz	(_RxBuffer1,x)
 522  00ef 2604          	jrne	L04
 523  00f1 a601          	ld	a,#1
 524  00f3 2001          	jra	L24
 525  00f5               L04:
 526  00f5 4f            	clr	a
 527  00f6               L24:
 530  00f6 5b01          	addw	sp,#1
 531  00f8 81            	ret	
 563                     ; 242 void	systemUart(void)
 563                     ; 243 {
 564                     	switch	.text
 565  00f9               _systemUart:
 569                     ; 247 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
 571  00f9 ae0501        	ldw	x,#1281
 572  00fc cd0000        	call	_CLK_PeripheralClockConfig
 574                     ; 250 	GPIO_ExternalPullUpConfig(D_USART_TX_PORT, D_USART_TX_PIN, ENABLE);
 576  00ff 4b01          	push	#1
 577  0101 4b08          	push	#8
 578  0103 ae500a        	ldw	x,#20490
 579  0106 cd0000        	call	_GPIO_ExternalPullUpConfig
 581  0109 85            	popw	x
 582                     ; 254 	GPIO_ExternalPullUpConfig(D_USART_RX_PORT, D_USART_RX_PIN, ENABLE);
 584  010a 4b01          	push	#1
 585  010c 4b04          	push	#4
 586  010e ae500a        	ldw	x,#20490
 587  0111 cd0000        	call	_GPIO_ExternalPullUpConfig
 589  0114 85            	popw	x
 590                     ; 256 	USART_Init(COM1, 
 590                     ; 257 		9600, 
 590                     ; 258 		USART_WordLength_8b, 
 590                     ; 259 		USART_StopBits_1,
 590                     ; 260 		USART_Parity_No, 
 590                     ; 261 		(USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx
 590                     ; 262 		)
 590                     ; 263 	);
 592  0115 4b0c          	push	#12
 593  0117 4b00          	push	#0
 594  0119 4b00          	push	#0
 595  011b 4b00          	push	#0
 596  011d ae2580        	ldw	x,#9600
 597  0120 89            	pushw	x
 598  0121 5f            	clrw	x
 599  0122 89            	pushw	x
 600  0123 ae5230        	ldw	x,#21040
 601  0126 cd0000        	call	_USART_Init
 603  0129 5b08          	addw	sp,#8
 604                     ; 264 	COM1_ITConfig(COM1, COM1_IT_RXNE, ENABLE);
 606  012b 4b01          	push	#1
 607  012d ae0255        	ldw	x,#597
 608  0130 89            	pushw	x
 609  0131 ae5230        	ldw	x,#21040
 610  0134 cd0000        	call	_USART_ITConfig
 612  0137 5b03          	addw	sp,#3
 613                     ; 265 	COM1_ITConfig(COM1, COM1_IT_TC, ENABLE);
 615  0139 4b01          	push	#1
 616  013b ae0266        	ldw	x,#614
 617  013e 89            	pushw	x
 618  013f ae5230        	ldw	x,#21040
 619  0142 cd0000        	call	_USART_ITConfig
 621  0145 5b03          	addw	sp,#3
 622                     ; 266 	COM1_Cmd(USART1, ENABLE);
 624  0147 4b01          	push	#1
 625  0149 ae5230        	ldw	x,#21040
 626  014c cd0000        	call	_USART_Cmd
 628  014f 725f0001      	clr	__uart1_rx_head
 629  0153 725f0000      	clr	__uart1_rx_tail
 630  0157 725f0003      	clr	__uart1_tx_head
 631  015b 725f0002      	clr	__uart1_tx_tail
 632  015f 84            	pop	a
 633                     ; 290 	_uart1_rx_head = 0;
 635                     ; 291 	_uart1_rx_tail = 0;
 637                     ; 292 	_uart1_tx_head = 0;
 639                     ; 293 	_uart1_tx_tail = 0;
 641                     ; 325 }
 644  0160 81            	ret	
 668                     ; 327 void	systemUart3ChangeEvenParity(void)
 668                     ; 328 {
 669                     	switch	.text
 670  0161               _systemUart3ChangeEvenParity:
 674                     ; 354 }
 677  0161 81            	ret	
 701                     ; 356 void	systemUart3ChangeNoneParity(void)
 701                     ; 357 {
 702                     	switch	.text
 703  0162               _systemUart3ChangeNoneParity:
 707                     ; 383 }
 710  0162 81            	ret	
 781                     	xdef	_uart1_tx_485
 782                     	switch	.bss
 783  0000               __uart1_rx_tail:
 784  0000 00            	ds.b	1
 785                     	xdef	__uart1_rx_tail
 786  0001               __uart1_rx_head:
 787  0001 00            	ds.b	1
 788                     	xdef	__uart1_rx_head
 789  0002               __uart1_tx_tail:
 790  0002 00            	ds.b	1
 791                     	xdef	__uart1_tx_tail
 792  0003               __uart1_tx_head:
 793  0003 00            	ds.b	1
 794                     	xdef	__uart1_tx_head
 795  0004               _RxBuffer1:
 796  0004 00000000      	ds.b	4
 797                     	xdef	_RxBuffer1
 798  0008               _TxBuffer1:
 799  0008 000000000000  	ds.b	8
 800                     	xdef	_TxBuffer1
 801                     	xdef	_systemUart3ChangeNoneParity
 802                     	xdef	_systemUart3ChangeEvenParity
 803                     	xdef	_systemUart
 804                     	xdef	_uart1_pkt_ready
 805                     	xdef	_uart1_get
 806                     	xdef	_uart1_rx_irq
 807                     	xdef	_uart1_tx_irq
 808                     	xdef	_uart1_tx_put
 809                     	xdef	_uart1_Ready
 810                     	xref	_USART_ClearITPendingBit
 811                     	xref	_USART_ITConfig
 812                     	xref	_USART_Cmd
 813                     	xref	_USART_Init
 814                     	xref	_GPIO_ExternalPullUpConfig
 815                     	xref	_CLK_PeripheralClockConfig
 816                     	xref.b	c_x
 836                     	xref	c_smodx
 837                     	end
