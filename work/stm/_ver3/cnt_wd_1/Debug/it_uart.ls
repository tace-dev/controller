   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     	switch	.data
  24  0000               _indi485Ready:
  25  0000 00            	dc.b	0
  26  0001               _indi485bReady:
  27  0001 00            	dc.b	0
  58                     ; 40 uint8_t	uart3_Ready(void)	
  58                     ; 41 { 
  60                     .text:	section	.text,new
  61  0000               _uart3_Ready:
  65                     ; 42 	return (uint8_t)(_uart3_rx_head != _uart3_rx_tail ? 1 : 0); 
  67  0000 c60001        	ld	a,__uart3_rx_head
  68  0003 c10000        	cp	a,__uart3_rx_tail
  69  0006 2703          	jreq	L6
  70  0008 a601          	ld	a,#1
  72  000a 81            	ret	
  73  000b               L6:
  74  000b 4f            	clr	a
  77  000c 81            	ret	
  80                     	switch	.data
  81  0002               _enableSamsungHomeNet:
  82  0002 00            	dc.b	0
 114                     ; 52 void	uart3_tx_485(uint8_t s)
 114                     ; 53 {
 115                     .text:	section	.text,new
 116  0000               _uart3_tx_485:
 120                     ; 56 	D_485b_WRITE_ON;
 122  0000 721e500f      	bset	20495,#7
 123                     ; 61 	indi485bReady += s+1;
 125  0004 4c            	inc	a
 126  0005 cb0001        	add	a,_indi485bReady
 127  0008 c70001        	ld	_indi485bReady,a
 128                     ; 62 	enableSamsungHomeNet = 2;
 130  000b 35020002      	mov	_enableSamsungHomeNet,#2
 131                     ; 76 }
 134  000f 81            	ret	
 193                     ; 93 void	uart3_tx_put(uint8_t *buf, uint8_t size)
 193                     ; 94 {
 194                     .text:	section	.text,new
 195  0000               _uart3_tx_put:
 197  0000 89            	pushw	x
 198  0001 89            	pushw	x
 199       00000002      OFST:	set	2
 202                     ; 96 	uint8_t s = 0;
 204  0002 0f01          	clr	(OFST-1,sp)
 205                     ; 98 	for( i=0; i<size; i++ )
 207  0004 0f02          	clr	(OFST+0,sp)
 209  0006 2029          	jra	L56
 210  0008               L16:
 211                     ; 100 		TxBuffer3[_uart3_tx_head] = buf[i];
 213  0008 c60003        	ld	a,__uart3_tx_head
 214  000b 5f            	clrw	x
 215  000c 97            	ld	xl,a
 216  000d 89            	pushw	x
 217  000e 7b05          	ld	a,(OFST+3,sp)
 218  0010 97            	ld	xl,a
 219  0011 7b06          	ld	a,(OFST+4,sp)
 220  0013 1b04          	add	a,(OFST+2,sp)
 221  0015 2401          	jrnc	L61
 222  0017 5c            	incw	x
 223  0018               L61:
 224  0018 02            	rlwa	x,a
 225  0019 f6            	ld	a,(x)
 226  001a 85            	popw	x
 227  001b d70034        	ld	(_TxBuffer3,x),a
 228                     ; 101 		_uart3_tx_head = (uint8_t)((_uart3_tx_head + 1) % TX3_BUFFER_SIZE);
 230  001e c60003        	ld	a,__uart3_tx_head
 231  0021 5f            	clrw	x
 232  0022 97            	ld	xl,a
 233  0023 5c            	incw	x
 234  0024 a630          	ld	a,#48
 235  0026 cd0000        	call	c_smodx
 237  0029 9f            	ld	a,xl
 238  002a c70003        	ld	__uart3_tx_head,a
 239                     ; 102 		s += 1;
 241  002d 0c01          	inc	(OFST-1,sp)
 242                     ; 98 	for( i=0; i<size; i++ )
 244  002f 0c02          	inc	(OFST+0,sp)
 245  0031               L56:
 248  0031 7b02          	ld	a,(OFST+0,sp)
 249  0033 1107          	cp	a,(OFST+5,sp)
 250  0035 25d1          	jrult	L16
 251                     ; 104 	uart3_tx_485(s);
 253  0037 7b01          	ld	a,(OFST-1,sp)
 254  0039 cd0000        	call	_uart3_tx_485
 256                     ; 105 }
 259  003c 5b04          	addw	sp,#4
 260  003e 81            	ret	
 287                     ; 107 void	uart3_tx_irq(void)
 287                     ; 108 {
 288                     .text:	section	.text,new
 289  0000               _uart3_tx_irq:
 293                     ; 111 	if( _uart3_tx_head == _uart3_tx_tail )
 295  0000 c60003        	ld	a,__uart3_tx_head
 296  0003 c10002        	cp	a,__uart3_tx_tail
 297  0006 260a          	jrne	L101
 298                     ; 114 		COM3_ITConfig(COM3_IT_TXE, DISABLE);
 300  0008 4b00          	push	#0
 301  000a ae0277        	ldw	x,#631
 302  000d cd0000        	call	_UART3_ITConfig
 304  0010 84            	pop	a
 305                     ; 115 		return;
 308  0011 81            	ret	
 309  0012               L101:
 310                     ; 117 	COM3_DR = TxBuffer3[_uart3_tx_tail++];
 312  0012 c60002        	ld	a,__uart3_tx_tail
 313  0015 725c0002      	inc	__uart3_tx_tail
 314  0019 5f            	clrw	x
 315  001a 97            	ld	xl,a
 316  001b d60034        	ld	a,(_TxBuffer3,x)
 317  001e c75241        	ld	21057,a
 318                     ; 118 	if( _uart3_tx_tail == TX3_BUFFER_SIZE )
 320  0021 c60002        	ld	a,__uart3_tx_tail
 321  0024 a130          	cp	a,#48
 322  0026 2604          	jrne	L301
 323                     ; 119 		_uart3_tx_tail = 0;
 325  0028 725f0002      	clr	__uart3_tx_tail
 326  002c               L301:
 327                     ; 122 }
 330  002c 81            	ret	
 356                     ; 124 void	uart3_rx_irq(void)
 356                     ; 125 {
 357                     .text:	section	.text,new
 358  0000               _uart3_rx_irq:
 362                     ; 126     RxBuffer3[_uart3_rx_head++] = COM3_DR;
 364  0000 c60001        	ld	a,__uart3_rx_head
 365  0003 725c0001      	inc	__uart3_rx_head
 366  0007 5f            	clrw	x
 367  0008 97            	ld	xl,a
 368  0009 c65241        	ld	a,21057
 369  000c d70004        	ld	(_RxBuffer3,x),a
 370                     ; 127 	if( _uart3_rx_head == RX3_BUFFER_SIZE )
 372  000f c60001        	ld	a,__uart3_rx_head
 373  0012 a130          	cp	a,#48
 374  0014 2604          	jrne	L511
 375                     ; 128 		_uart3_rx_head = 0;
 377  0016 725f0001      	clr	__uart3_rx_head
 378  001a               L511:
 379                     ; 131 	UART3_ClearITPendingBit(UART3_IT_RXNE);
 381  001a ae0255        	ldw	x,#597
 383                     ; 132 }
 386  001d cc0000        	jp	_UART3_ClearITPendingBit
 420                     ; 134 uint8_t	uart3_get(void)
 420                     ; 135 {
 421                     .text:	section	.text,new
 422  0000               _uart3_get:
 424  0000 88            	push	a
 425       00000001      OFST:	set	1
 428                     ; 136 	uint8_t	t = RxBuffer3[_uart3_rx_tail];
 430  0001 c60000        	ld	a,__uart3_rx_tail
 431  0004 5f            	clrw	x
 432  0005 97            	ld	xl,a
 433  0006 d60004        	ld	a,(_RxBuffer3,x)
 434  0009 6b01          	ld	(OFST+0,sp),a
 435                     ; 140 	_uart3_rx_tail = (uint8_t)((_uart3_rx_tail + 1) % RX3_BUFFER_SIZE);
 437  000b c60000        	ld	a,__uart3_rx_tail
 438  000e 5f            	clrw	x
 439  000f 97            	ld	xl,a
 440  0010 5c            	incw	x
 441  0011 a630          	ld	a,#48
 442  0013 cd0000        	call	c_smodx
 444  0016 9f            	ld	a,xl
 445  0017 c70000        	ld	__uart3_rx_tail,a
 446                     ; 141 	return t;
 448  001a 7b01          	ld	a,(OFST+0,sp)
 451  001c 5b01          	addw	sp,#1
 452  001e 81            	ret	
 486                     ; 144 uint8_t	uart3_pkt_ready(void)
 486                     ; 145 {
 487                     .text:	section	.text,new
 488  0000               _uart3_pkt_ready:
 490  0000 88            	push	a
 491       00000001      OFST:	set	1
 494                     ; 146 	uint8_t	i = (uint8_t)((_uart3_rx_head - 1 + RX3_BUFFER_SIZE) % RX3_BUFFER_SIZE);
 496  0001 c60001        	ld	a,__uart3_rx_head
 497  0004 5f            	clrw	x
 498  0005 97            	ld	xl,a
 499  0006 1c002f        	addw	x,#47
 500  0009 a630          	ld	a,#48
 501  000b cd0000        	call	c_smodx
 503  000e 9f            	ld	a,xl
 504  000f 6b01          	ld	(OFST+0,sp),a
 505                     ; 147 	return (uint8_t)(RxBuffer3[i]==/*PKT_485_ETX*/0 ? 1 : 0);
 507  0011 5f            	clrw	x
 508  0012 97            	ld	xl,a
 509  0013 724d0004      	tnz	(_RxBuffer3,x)
 510  0017 2604          	jrne	L63
 511  0019 a601          	ld	a,#1
 512  001b 2001          	jra	L04
 513  001d               L63:
 514  001d 4f            	clr	a
 515  001e               L04:
 518  001e 5b01          	addw	sp,#1
 519  0020 81            	ret	
 544                     ; 151 uint8_t	uart1_Ready(void)	
 544                     ; 152 { 
 545                     .text:	section	.text,new
 546  0000               _uart1_Ready:
 550                     ; 153 	return (uint8_t)(_uart1_rx_head != _uart1_rx_tail ? 1 : 0); 
 552  0000 c60065        	ld	a,__uart1_rx_head
 553  0003 c10064        	cp	a,__uart1_rx_tail
 554  0006 2703          	jreq	L44
 555  0008 a601          	ld	a,#1
 557  000a 81            	ret	
 558  000b               L44:
 559  000b 4f            	clr	a
 562  000c 81            	ret	
 596                     ; 156 void	uart1_tx_485(uint8_t s)
 596                     ; 157 {
 597                     .text:	section	.text,new
 598  0000               _uart1_tx_485:
 602                     ; 160 	D_485_WRITE_ON;
 604  0000 721c5000      	bset	20480,#6
 605                     ; 162 	indi485Ready += s+1;
 607  0004 4c            	inc	a
 608  0005 cb0000        	add	a,_indi485Ready
 609  0008 c70000        	ld	_indi485Ready,a
 610                     ; 168 	COM1_ITConfig(COM1_IT_TXE, ENABLE);
 612  000b 4b01          	push	#1
 613  000d ae0277        	ldw	x,#631
 614  0010 cd0000        	call	_UART1_ITConfig
 616  0013 84            	pop	a
 617                     ; 170 }
 620  0014 81            	ret	
 679                     ; 188 void	uart1_tx_put(uint8_t *buf, uint8_t size)
 679                     ; 189 {
 680                     .text:	section	.text,new
 681  0000               _uart1_tx_put:
 683  0000 89            	pushw	x
 684  0001 89            	pushw	x
 685       00000002      OFST:	set	2
 688                     ; 191 	uint8_t s = 0;
 690  0002 0f01          	clr	(OFST-1,sp)
 691                     ; 193 	for( i=0; i<size; i++ )
 693  0004 0f02          	clr	(OFST+0,sp)
 695  0006 2029          	jra	L322
 696  0008               L712:
 697                     ; 195 		TxBuffer1[_uart1_tx_head] = buf[i];
 699  0008 c60067        	ld	a,__uart1_tx_head
 700  000b 5f            	clrw	x
 701  000c 97            	ld	xl,a
 702  000d 89            	pushw	x
 703  000e 7b05          	ld	a,(OFST+3,sp)
 704  0010 97            	ld	xl,a
 705  0011 7b06          	ld	a,(OFST+4,sp)
 706  0013 1b04          	add	a,(OFST+2,sp)
 707  0015 2401          	jrnc	L65
 708  0017 5c            	incw	x
 709  0018               L65:
 710  0018 02            	rlwa	x,a
 711  0019 f6            	ld	a,(x)
 712  001a 85            	popw	x
 713  001b d70098        	ld	(_TxBuffer1,x),a
 714                     ; 196 		_uart1_tx_head = (uint8_t)((_uart1_tx_head + 1) % TX1_BUFFER_SIZE);
 716  001e c60067        	ld	a,__uart1_tx_head
 717  0021 5f            	clrw	x
 718  0022 97            	ld	xl,a
 719  0023 5c            	incw	x
 720  0024 a630          	ld	a,#48
 721  0026 cd0000        	call	c_smodx
 723  0029 9f            	ld	a,xl
 724  002a c70067        	ld	__uart1_tx_head,a
 725                     ; 197 		s += 1;
 727  002d 0c01          	inc	(OFST-1,sp)
 728                     ; 193 	for( i=0; i<size; i++ )
 730  002f 0c02          	inc	(OFST+0,sp)
 731  0031               L322:
 734  0031 7b02          	ld	a,(OFST+0,sp)
 735  0033 1107          	cp	a,(OFST+5,sp)
 736  0035 25d1          	jrult	L712
 737                     ; 199 	uart1_tx_485(s);
 739  0037 7b01          	ld	a,(OFST-1,sp)
 740  0039 cd0000        	call	_uart1_tx_485
 742                     ; 200 }
 745  003c 5b04          	addw	sp,#4
 746  003e 81            	ret	
 782                     ; 202 void	uart1_tx_irq(void)
 782                     ; 203 {
 783                     .text:	section	.text,new
 784  0000               _uart1_tx_irq:
 786  0000 88            	push	a
 787       00000001      OFST:	set	1
 790                     ; 209 	if( _uart1_tx_head == _uart1_tx_tail )
 792  0001 c60067        	ld	a,__uart1_tx_head
 793  0004 c10066        	cp	a,__uart1_tx_tail
 794  0007 260b          	jrne	L342
 795                     ; 214 		COM1_ITConfig(COM1_IT_TXE, DISABLE);
 797  0009 4b00          	push	#0
 798  000b ae0277        	ldw	x,#631
 799  000e cd0000        	call	_UART1_ITConfig
 801  0011 84            	pop	a
 802                     ; 216 		return;
 805  0012 84            	pop	a
 806  0013 81            	ret	
 807  0014               L342:
 808                     ; 218 	i = TxBuffer1[_uart1_tx_tail];
 810  0014 c60066        	ld	a,__uart1_tx_tail
 811  0017 5f            	clrw	x
 812  0018 97            	ld	xl,a
 813  0019 d60098        	ld	a,(_TxBuffer1,x)
 814  001c 6b01          	ld	(OFST+0,sp),a
 815                     ; 219 	_uart1_tx_tail = (uint8_t)((_uart1_tx_tail + 1) % TX1_BUFFER_SIZE);
 817  001e c60066        	ld	a,__uart1_tx_tail
 818  0021 5f            	clrw	x
 819  0022 97            	ld	xl,a
 820  0023 5c            	incw	x
 821  0024 a630          	ld	a,#48
 822  0026 cd0000        	call	c_smodx
 824  0029 9f            	ld	a,xl
 825  002a c70066        	ld	__uart1_tx_tail,a
 826                     ; 220     COM1_DR = i;
 828  002d 7b01          	ld	a,(OFST+0,sp)
 829  002f c75231        	ld	21041,a
 830                     ; 221 }
 833  0032 84            	pop	a
 834  0033 81            	ret	
 859                     ; 223 void	uart1_rx_irq(void)
 859                     ; 224 {
 860                     .text:	section	.text,new
 861  0000               _uart1_rx_irq:
 865                     ; 225     RxBuffer1[_uart1_rx_head] = ((uint8_t)COM1_DR);
 867  0000 c60065        	ld	a,__uart1_rx_head
 868  0003 5f            	clrw	x
 869  0004 97            	ld	xl,a
 870  0005 c65231        	ld	a,21041
 871  0008 d70068        	ld	(_RxBuffer1,x),a
 872                     ; 226 	_uart1_rx_head = (uint8_t)((_uart1_rx_head + 1) % RX1_BUFFER_SIZE);
 874  000b c60065        	ld	a,__uart1_rx_head
 875  000e 5f            	clrw	x
 876  000f 97            	ld	xl,a
 877  0010 5c            	incw	x
 878  0011 a630          	ld	a,#48
 879  0013 cd0000        	call	c_smodx
 881  0016 9f            	ld	a,xl
 882  0017 c70065        	ld	__uart1_rx_head,a
 883                     ; 227 }
 886  001a 81            	ret	
 920                     ; 229 uint8_t	uart1_get(void)
 920                     ; 230 {
 921                     .text:	section	.text,new
 922  0000               _uart1_get:
 924  0000 88            	push	a
 925       00000001      OFST:	set	1
 928                     ; 231 	uint8_t	t = RxBuffer1[_uart1_rx_tail];
 930  0001 c60064        	ld	a,__uart1_rx_tail
 931  0004 5f            	clrw	x
 932  0005 97            	ld	xl,a
 933  0006 d60068        	ld	a,(_RxBuffer1,x)
 934  0009 6b01          	ld	(OFST+0,sp),a
 935                     ; 232 	_uart1_rx_tail = (uint8_t)((_uart1_rx_tail + 1) % RX1_BUFFER_SIZE);
 937  000b c60064        	ld	a,__uart1_rx_tail
 938  000e 5f            	clrw	x
 939  000f 97            	ld	xl,a
 940  0010 5c            	incw	x
 941  0011 a630          	ld	a,#48
 942  0013 cd0000        	call	c_smodx
 944  0016 9f            	ld	a,xl
 945  0017 c70064        	ld	__uart1_rx_tail,a
 946                     ; 233 	return t;
 948  001a 7b01          	ld	a,(OFST+0,sp)
 951  001c 5b01          	addw	sp,#1
 952  001e 81            	ret	
 986                     ; 236 uint8_t	uart1_pkt_ready(void)
 986                     ; 237 {
 987                     .text:	section	.text,new
 988  0000               _uart1_pkt_ready:
 990  0000 88            	push	a
 991       00000001      OFST:	set	1
 994                     ; 238 	uint8_t	i = (uint8_t)((_uart1_rx_head - 1 + RX1_BUFFER_SIZE) % RX1_BUFFER_SIZE);
 996  0001 c60065        	ld	a,__uart1_rx_head
 997  0004 5f            	clrw	x
 998  0005 97            	ld	xl,a
 999  0006 1c002f        	addw	x,#47
1000  0009 a630          	ld	a,#48
1001  000b cd0000        	call	c_smodx
1003  000e 9f            	ld	a,xl
1004  000f 6b01          	ld	(OFST+0,sp),a
1005                     ; 239 	return (uint8_t)(RxBuffer1[i]==/*PKT_485_ETX*/0 ? 1 : 0);
1007  0011 5f            	clrw	x
1008  0012 97            	ld	xl,a
1009  0013 724d0068      	tnz	(_RxBuffer1,x)
1010  0017 2604          	jrne	L47
1011  0019 a601          	ld	a,#1
1012  001b 2001          	jra	L67
1013  001d               L47:
1014  001d 4f            	clr	a
1015  001e               L67:
1018  001e 5b01          	addw	sp,#1
1019  0020 81            	ret	
1059                     ; 242 void	systemUart(void)
1059                     ; 243 {
1060                     .text:	section	.text,new
1061  0000               _systemUart:
1065                     ; 270 	UART1_Init( 
1065                     ; 271 		(uint32_t)9600, 
1065                     ; 272 		UART1_WORDLENGTH_8D, 
1065                     ; 273 		UART1_STOPBITS_1, 
1065                     ; 274 		UART1_PARITY_NO,
1065                     ; 275 		UART1_SYNCMODE_CLOCK_DISABLE, 
1065                     ; 276 		UART1_MODE_TXRX_ENABLE
1065                     ; 277 		);
1067  0000 4b0c          	push	#12
1068  0002 4b80          	push	#128
1069  0004 4b00          	push	#0
1070  0006 4b00          	push	#0
1071  0008 4b00          	push	#0
1072  000a ae2580        	ldw	x,#9600
1073  000d 89            	pushw	x
1074  000e 5f            	clrw	x
1075  000f 89            	pushw	x
1076  0010 cd0000        	call	_UART1_Init
1078  0013 5b09          	addw	sp,#9
1079                     ; 278 	COM1_ITConfig(COM1_IT_RXNE_OR, ENABLE);
1081  0015 4b01          	push	#1
1082  0017 ae0205        	ldw	x,#517
1083  001a cd0000        	call	_UART1_ITConfig
1085  001d 84            	pop	a
1086                     ; 279 	COM1_ITConfig(COM1_IT_TXE, ENABLE);
1088  001e 4b01          	push	#1
1089  0020 ae0277        	ldw	x,#631
1090  0023 cd0000        	call	_UART1_ITConfig
1092  0026 84            	pop	a
1093                     ; 280 	COM1_Cmd(ENABLE);
1095  0027 a601          	ld	a,#1
1096  0029 cd0000        	call	_UART1_Cmd
1098                     ; 284 	GPIO_Init(D_485_PORT, D_485_READ_PIN, D_IO_OUT_TRIGER);
1100  002c 4be0          	push	#224
1101  002e 4b40          	push	#64
1102  0030 ae5000        	ldw	x,#20480
1103  0033 cd0000        	call	_GPIO_Init
1105  0036 85            	popw	x
1106                     ; 285 	GPIO_ExternalPullUpConfig(D_485_PORT, D_485_READ_PIN, ENABLE);
1108  0037 4b01          	push	#1
1109  0039 4b40          	push	#64
1110  003b ae5000        	ldw	x,#20480
1111  003e cd0000        	call	_GPIO_ExternalPullUpConfig
1113  0041 721d5000      	bres	20480,#6
1114  0045 725f0065      	clr	__uart1_rx_head
1115  0049 725f0064      	clr	__uart1_rx_tail
1116  004d 725f0067      	clr	__uart1_tx_head
1117  0051 725f0066      	clr	__uart1_tx_tail
1118  0055 85            	popw	x
1119                     ; 286 	D_485_READ_ON;
1121                     ; 290 	_uart1_rx_head = 0;
1123                     ; 291 	_uart1_rx_tail = 0;
1125                     ; 292 	_uart1_tx_head = 0;
1127                     ; 293 	_uart1_tx_tail = 0;
1129                     ; 296 	UART3_DeInit();
1131  0056 cd0000        	call	_UART3_DeInit
1133                     ; 297 	UART3_Init( 
1133                     ; 298 		(uint32_t)9600, 
1133                     ; 299 		UART3_WORDLENGTH_8D, 
1133                     ; 300 		UART3_STOPBITS_1,
1133                     ; 301 		UART3_PARITY_NO,
1133                     ; 302 		UART3_MODE_RX_ENABLE | UART3_MODE_TX_ENABLE
1133                     ; 303 //		UART3_MODE_TXRX_ENABLE
1133                     ; 304 	);
1135  0059 4b0c          	push	#12
1136  005b 4b00          	push	#0
1137  005d 4b00          	push	#0
1138  005f 4b00          	push	#0
1139  0061 ae2580        	ldw	x,#9600
1140  0064 89            	pushw	x
1141  0065 5f            	clrw	x
1142  0066 89            	pushw	x
1143  0067 cd0000        	call	_UART3_Init
1145  006a 5b08          	addw	sp,#8
1146                     ; 305 	COM3_ITConfig(COM3_IT_RXNE_OR, ENABLE);
1148  006c 4b01          	push	#1
1149  006e ae0205        	ldw	x,#517
1150  0071 cd0000        	call	_UART3_ITConfig
1152  0074 84            	pop	a
1153                     ; 306 	COM3_ITConfig(COM3_IT_TXE, ENABLE);
1155  0075 4b01          	push	#1
1156  0077 ae0277        	ldw	x,#631
1157  007a cd0000        	call	_UART3_ITConfig
1159  007d 84            	pop	a
1160                     ; 309 	COM3_Cmd(ENABLE);
1162  007e a601          	ld	a,#1
1163  0080 cd0000        	call	_UART3_Cmd
1165                     ; 311 	_uart3_rx_head = 0;
1167  0083 725f0001      	clr	__uart3_rx_head
1168                     ; 312 	_uart3_rx_tail = 0;
1170  0087 725f0000      	clr	__uart3_rx_tail
1171                     ; 313 	_uart3_tx_head = 0;
1173  008b 725f0003      	clr	__uart3_tx_head
1174                     ; 314 	_uart3_tx_tail = 0;	
1176  008f 725f0002      	clr	__uart3_tx_tail
1177                     ; 317 	GPIO_Init(D_485b_PORT, D_485b_READ_PIN, D_IO_OUT_TRIGER);
1179  0093 4be0          	push	#224
1180  0095 4b80          	push	#128
1181  0097 ae500f        	ldw	x,#20495
1182  009a cd0000        	call	_GPIO_Init
1184  009d 85            	popw	x
1185                     ; 318 	GPIO_ExternalPullUpConfig(D_485b_PORT, D_485b_READ_PIN, ENABLE);
1187  009e 4b01          	push	#1
1188  00a0 4b80          	push	#128
1189  00a2 ae500f        	ldw	x,#20495
1190  00a5 cd0000        	call	_GPIO_ExternalPullUpConfig
1192  00a8 721f500f      	bres	20495,#7
1193  00ac 85            	popw	x
1194                     ; 319 	D_485b_READ_ON;
1196                     ; 325 }
1199  00ad 81            	ret	
1233                     ; 327 void	systemUart3ChangeEvenParity(void)
1233                     ; 328 {
1234                     .text:	section	.text,new
1235  0000               _systemUart3ChangeEvenParity:
1239                     ; 330 	UART3_DeInit();
1241  0000 cd0000        	call	_UART3_DeInit
1243                     ; 331 	UART3_Init( 
1243                     ; 332 		(uint32_t)9600, 
1243                     ; 333 		UART3_WORDLENGTH_9D, 
1243                     ; 334 		UART3_STOPBITS_1,
1243                     ; 335 		UART3_PARITY_EVEN,
1243                     ; 336 		UART3_MODE_RX_ENABLE | UART3_MODE_TX_ENABLE
1243                     ; 337 	);
1245  0003 4b0c          	push	#12
1246  0005 4b04          	push	#4
1247  0007 4b00          	push	#0
1248  0009 4b10          	push	#16
1249  000b ae2580        	ldw	x,#9600
1250  000e 89            	pushw	x
1251  000f 5f            	clrw	x
1252  0010 89            	pushw	x
1253  0011 cd0000        	call	_UART3_Init
1255  0014 5b08          	addw	sp,#8
1256                     ; 338 	COM3_ITConfig(COM3_IT_RXNE_OR, ENABLE);
1258  0016 4b01          	push	#1
1259  0018 ae0205        	ldw	x,#517
1260  001b cd0000        	call	_UART3_ITConfig
1262  001e 84            	pop	a
1263                     ; 339 	COM3_ITConfig(COM3_IT_TXE, ENABLE);
1265  001f 4b01          	push	#1
1266  0021 ae0277        	ldw	x,#631
1267  0024 cd0000        	call	_UART3_ITConfig
1269  0027 84            	pop	a
1270                     ; 340 	COM3_Cmd(ENABLE);
1272  0028 a601          	ld	a,#1
1273  002a cd0000        	call	_UART3_Cmd
1275                     ; 342 	_uart3_rx_head = 0;
1277  002d 725f0001      	clr	__uart3_rx_head
1278                     ; 343 	_uart3_rx_tail = 0;
1280  0031 725f0000      	clr	__uart3_rx_tail
1281                     ; 344 	_uart3_tx_head = 0;
1283  0035 725f0003      	clr	__uart3_tx_head
1284                     ; 345 	_uart3_tx_tail = 0;	
1286  0039 725f0002      	clr	__uart3_tx_tail
1287                     ; 348 	GPIO_Init(D_485b_PORT, D_485b_READ_PIN, D_IO_OUT_TRIGER);
1289  003d 4be0          	push	#224
1290  003f 4b80          	push	#128
1291  0041 ae500f        	ldw	x,#20495
1292  0044 cd0000        	call	_GPIO_Init
1294  0047 85            	popw	x
1295                     ; 349 	GPIO_ExternalPullUpConfig(D_485b_PORT, D_485b_READ_PIN, ENABLE);
1297  0048 4b01          	push	#1
1298  004a 4b80          	push	#128
1299  004c ae500f        	ldw	x,#20495
1300  004f cd0000        	call	_GPIO_ExternalPullUpConfig
1302  0052 721f500f      	bres	20495,#7
1303  0056 85            	popw	x
1304                     ; 350 	D_485b_READ_ON;
1306                     ; 354 }
1309  0057 81            	ret	
1343                     ; 356 void	systemUart3ChangeNoneParity(void)
1343                     ; 357 {
1344                     .text:	section	.text,new
1345  0000               _systemUart3ChangeNoneParity:
1349                     ; 359 	UART3_DeInit();
1351  0000 cd0000        	call	_UART3_DeInit
1353                     ; 360 	UART3_Init( 
1353                     ; 361 		(uint32_t)9600, 
1353                     ; 362 		UART3_WORDLENGTH_8D, 
1353                     ; 363 		UART3_STOPBITS_1,
1353                     ; 364 		UART3_PARITY_NO,
1353                     ; 365 		UART3_MODE_RX_ENABLE | UART3_MODE_TX_ENABLE
1353                     ; 366 	);
1355  0003 4b0c          	push	#12
1356  0005 4b00          	push	#0
1357  0007 4b00          	push	#0
1358  0009 4b00          	push	#0
1359  000b ae2580        	ldw	x,#9600
1360  000e 89            	pushw	x
1361  000f 5f            	clrw	x
1362  0010 89            	pushw	x
1363  0011 cd0000        	call	_UART3_Init
1365  0014 5b08          	addw	sp,#8
1366                     ; 367 	COM3_ITConfig(COM3_IT_RXNE_OR, ENABLE);
1368  0016 4b01          	push	#1
1369  0018 ae0205        	ldw	x,#517
1370  001b cd0000        	call	_UART3_ITConfig
1372  001e 84            	pop	a
1373                     ; 368 	COM3_ITConfig(COM3_IT_TXE, ENABLE);
1375  001f 4b01          	push	#1
1376  0021 ae0277        	ldw	x,#631
1377  0024 cd0000        	call	_UART3_ITConfig
1379  0027 84            	pop	a
1380                     ; 369 	COM3_Cmd(ENABLE);
1382  0028 a601          	ld	a,#1
1383  002a cd0000        	call	_UART3_Cmd
1385                     ; 371 	_uart3_rx_head = 0;
1387  002d 725f0001      	clr	__uart3_rx_head
1388                     ; 372 	_uart3_rx_tail = 0;
1390  0031 725f0000      	clr	__uart3_rx_tail
1391                     ; 373 	_uart3_tx_head = 0;
1393  0035 725f0003      	clr	__uart3_tx_head
1394                     ; 374 	_uart3_tx_tail = 0;	
1396  0039 725f0002      	clr	__uart3_tx_tail
1397                     ; 377 	GPIO_Init(D_485b_PORT, D_485b_READ_PIN, D_IO_OUT_TRIGER);
1399  003d 4be0          	push	#224
1400  003f 4b80          	push	#128
1401  0041 ae500f        	ldw	x,#20495
1402  0044 cd0000        	call	_GPIO_Init
1404  0047 85            	popw	x
1405                     ; 378 	GPIO_ExternalPullUpConfig(D_485b_PORT, D_485b_READ_PIN, ENABLE);
1407  0048 4b01          	push	#1
1408  004a 4b80          	push	#128
1409  004c ae500f        	ldw	x,#20495
1410  004f cd0000        	call	_GPIO_ExternalPullUpConfig
1412  0052 721f500f      	bres	20495,#7
1413  0056 85            	popw	x
1414                     ; 379 	D_485b_READ_ON;
1416                     ; 383 }
1419  0057 81            	ret	
1628                     	xdef	_uart1_tx_485
1629                     	xdef	_uart3_tx_485
1630                     	xdef	_enableSamsungHomeNet
1631                     	switch	.bss
1632  0000               __uart3_rx_tail:
1633  0000 00            	ds.b	1
1634                     	xdef	__uart3_rx_tail
1635  0001               __uart3_rx_head:
1636  0001 00            	ds.b	1
1637                     	xdef	__uart3_rx_head
1638  0002               __uart3_tx_tail:
1639  0002 00            	ds.b	1
1640                     	xdef	__uart3_tx_tail
1641  0003               __uart3_tx_head:
1642  0003 00            	ds.b	1
1643                     	xdef	__uart3_tx_head
1644  0004               _RxBuffer3:
1645  0004 000000000000  	ds.b	48
1646                     	xdef	_RxBuffer3
1647  0034               _TxBuffer3:
1648  0034 000000000000  	ds.b	48
1649                     	xdef	_TxBuffer3
1650  0064               __uart1_rx_tail:
1651  0064 00            	ds.b	1
1652                     	xdef	__uart1_rx_tail
1653  0065               __uart1_rx_head:
1654  0065 00            	ds.b	1
1655                     	xdef	__uart1_rx_head
1656  0066               __uart1_tx_tail:
1657  0066 00            	ds.b	1
1658                     	xdef	__uart1_tx_tail
1659  0067               __uart1_tx_head:
1660  0067 00            	ds.b	1
1661                     	xdef	__uart1_tx_head
1662  0068               _RxBuffer1:
1663  0068 000000000000  	ds.b	48
1664                     	xdef	_RxBuffer1
1665  0098               _TxBuffer1:
1666  0098 000000000000  	ds.b	48
1667                     	xdef	_TxBuffer1
1668  00c8               _indi485bSendSize:
1669  00c8 00            	ds.b	1
1670                     	xdef	_indi485bSendSize
1671  00c9               _indi485bSendReady:
1672  00c9 00            	ds.b	1
1673                     	xdef	_indi485bSendReady
1674  00ca               _indi485bSendWait:
1675  00ca 00            	ds.b	1
1676                     	xdef	_indi485bSendWait
1677                     	xdef	_indi485bReady
1678  00cb               _indi485SendSize:
1679  00cb 00            	ds.b	1
1680                     	xdef	_indi485SendSize
1681  00cc               _indi485SendReady:
1682  00cc 00            	ds.b	1
1683                     	xdef	_indi485SendReady
1684  00cd               _indi485SendWait:
1685  00cd 00            	ds.b	1
1686                     	xdef	_indi485SendWait
1687                     	xdef	_indi485Ready
1688                     	xdef	_systemUart3ChangeNoneParity
1689                     	xdef	_systemUart3ChangeEvenParity
1690                     	xdef	_systemUart
1691                     	xdef	_uart3_pkt_ready
1692                     	xdef	_uart3_get
1693                     	xdef	_uart3_rx_irq
1694                     	xdef	_uart3_tx_irq
1695                     	xdef	_uart3_tx_put
1696                     	xdef	_uart3_Ready
1697                     	xdef	_uart1_pkt_ready
1698                     	xdef	_uart1_get
1699                     	xdef	_uart1_rx_irq
1700                     	xdef	_uart1_tx_irq
1701                     	xdef	_uart1_tx_put
1702                     	xdef	_uart1_Ready
1703                     	xref	_UART3_ClearITPendingBit
1704                     	xref	_UART3_ITConfig
1705                     	xref	_UART3_Cmd
1706                     	xref	_UART3_Init
1707                     	xref	_UART3_DeInit
1708                     	xref	_UART1_ITConfig
1709                     	xref	_UART1_Cmd
1710                     	xref	_UART1_Init
1711                     	xref	_GPIO_ExternalPullUpConfig
1712                     	xref	_GPIO_Init
1713                     	xref.b	c_x
1733                     	xref	c_smodx
1734                     	end
