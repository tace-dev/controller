   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  22                     	switch	.data
  23  0000               _indiIOUartWrite:
  24  0000 00            	dc.b	0
  25  0001               _indiIOUartSendWait:
  26  0001 0000          	dc.w	0
  27  0003               _indiIOUartSendReady:
  28  0003 00            	dc.b	0
  29  0004               _indiIOUartIdle:
  30  0004 01            	dc.b	1
  31  0005               _rci1:
  32  0005 00            	dc.b	0
  33  0006               _rci2:
  34  0006 00            	dc.b	0
  35  0007               _rcStatus:
  36  0007 00            	dc.b	0
  37                     .const:	section	.text
  38  0000               ___rcCntl_Start:
  39  0000 01            	dc.b	1
  40  0001 01            	dc.b	1
  41  0002 00            	dc.b	0
  42  0003 00            	dc.b	0
  43  0004 00            	dc.b	0
  44  0005 00            	dc.b	0
  45  0006 00            	dc.b	0
  46  0007 00            	dc.b	0
  47  0008 00            	dc.b	0
  48  0009 00            	dc.b	0
  49  000a 00            	dc.b	0
  50  000b 00            	dc.b	0
  51  000c 01            	dc.b	1
  52  000d 01            	dc.b	1
  53  000e 00            	dc.b	0
  54  000f 00            	dc.b	0
  55  0010 00            	dc.b	0
  56  0011 00            	dc.b	0
  57  0012 00            	dc.b	0
  58  0013 00            	dc.b	0
  59  0014 00            	dc.b	0
  60  0015               ___rcCntl_Port:
  61  0015 03            	dc.b	3
  62  0016 05            	dc.b	5
  63  0017               ___iBitTable:
  64  0017 80            	dc.b	128
  65  0018 40            	dc.b	64
  66  0019 20            	dc.b	32
  67  001a 10            	dc.b	16
  68  001b 08            	dc.b	8
  69  001c 04            	dc.b	4
  70  001d 02            	dc.b	2
  71  001e 01            	dc.b	1
  72                     	switch	.data
  73  0008               _iBit:
  74  0008 00            	dc.b	0
  75  0009               _iByte:
  76  0009 00            	dc.b	0
  77  000a               _iData:
  78  000a 00            	dc.b	0
 108                     ; 44 void	iouart_Open(void)
 108                     ; 45 {
 109                     .text:	section	.text,new
 110  0000               f_iouart_Open:
 114                     ; 46 	GPIO_Init(D_IOUART_TX_PORT, D_IOUART_TX_PIN, D_IO_OUT_TRIGER);
 116  0000 4be0          	push	#224
 117  0002 4b01          	push	#1
 118  0004 ae5019        	ldw	x,#20505
 119  0007 8d000000      	callf	f_GPIO_Init
 121  000b 85            	popw	x
 122                     ; 74 }
 125  000c 87            	retf	
 149                     ; 76 uint8_t	*iouart_getBuffer(void)
 149                     ; 77 {
 150                     .text:	section	.text,new
 151  0000               f_iouart_getBuffer:
 155                     ; 78 	return rcIOUartTxBuffer;
 157  0000 ae0008        	ldw	x,#_rcIOUartTxBuffer
 160  0003 87            	retf	
 185                     ; 81 uint8_t	*iouart_getReadBuffer(void)
 185                     ; 82 {
 186                     .text:	section	.text,new
 187  0000               f_iouart_getReadBuffer:
 191                     ; 83 	return iBuf;
 193  0000 ae0000        	ldw	x,#_iBuf
 196  0003 87            	retf	
 229                     ; 96 void	iouart_Set_Packet(uint8_t wait)
 229                     ; 97 {
 230                     .text:	section	.text,new
 231  0000               f_iouart_Set_Packet:
 233  0000 88            	push	a
 234       00000000      OFST:	set	0
 237                     ; 98 	indiIOUartSendReady = 1;
 239  0001 35010003      	mov	_indiIOUartSendReady,#1
 240                     ; 104 	indiIOUartSendWait = wait + 1540; // 160ms
 242  0005 a606          	ld	a,#6
 243  0007 97            	ld	xl,a
 244  0008 a604          	ld	a,#4
 245  000a 1b01          	add	a,(OFST+1,sp)
 246  000c 2401          	jrnc	L61
 247  000e 5c            	incw	x
 248  000f               L61:
 249  000f c70002        	ld	_indiIOUartSendWait+1,a
 250  0012 9f            	ld	a,xl
 251  0013 c70001        	ld	_indiIOUartSendWait,a
 252                     ; 106 }
 255  0016 84            	pop	a
 256  0017 87            	retf	
 282                     ; 108 void	iouart_Pkt_Start(void)
 282                     ; 109 {
 283                     .text:	section	.text,new
 284  0000               f_iouart_Pkt_Start:
 288                     ; 110 	indiIOUartIdle = 1;	//	Busy
 290  0000 35010004      	mov	_indiIOUartIdle,#1
 291                     ; 111 	rcStatus = 1;
 293  0004 35010007      	mov	_rcStatus,#1
 294                     ; 112 	indiIOUartSendReady = 0;
 296  0008 725f0003      	clr	_indiIOUartSendReady
 297                     ; 113 	IOUART(DISABLE);
 299  000c 4f            	clr	a
 301                     ; 114 }
 304  000d ac000000      	jpf	f_timer2Cntl
 306                     	switch	.data
 307  000b               __iouart_50ms_high:
 308  000b 00            	dc.b	0
 330                     ; 118 void	_iouart_50ms(void)
 330                     ; 119 {
 331                     .text:	section	.text,new
 332  0000               f__iouart_50ms:
 336                     ; 121 	if( _iouart_50ms_high == 1 )
 338  0000 c6000b        	ld	a,__iouart_50ms_high
 339  0003 4a            	dec	a
 340  0004 2607          	jrne	L57
 341                     ; 123 		_iouart_50ms_high = 0;
 343  0006 c7000b        	ld	__iouart_50ms_high,a
 344                     ; 124 		D_IOUART_LOW;
 346  0009 72115019      	bres	20505,#0
 347  000d               L57:
 348                     ; 127 }
 351  000d 87            	retf	
 392                     ; 129 uint8_t	iouart_Write(void)
 392                     ; 130 {
 393                     .text:	section	.text,new
 394  0000               f_iouart_Write:
 396  0000 88            	push	a
 397       00000001      OFST:	set	1
 400                     ; 132 	if( rci1 != 0 )
 402  0001 725d0005      	tnz	_rci1
 403  0005 270a          	jreq	L311
 404                     ; 134 		rci1 -= 1;
 406  0007 725a0005      	dec	_rci1
 407                     ; 135 		D_IOUART_LOW;
 409  000b 72115019      	bres	20505,#0
 411  000f 206f          	jra	L511
 412  0011               L311:
 413                     ; 139 		if( rcStatus == 0 )
 415  0011 725d0007      	tnz	_rcStatus
 416  0015 2609          	jrne	L711
 417                     ; 142 			D_IOUART_LOW;
 419  0017 72115019      	bres	20505,#0
 420                     ; 143 			return 1;
 422  001b a601          	ld	a,#1
 425  001d 5b01          	addw	sp,#1
 426  001f 87            	retf	
 427  0020               L711:
 428                     ; 145 		if( rcStatus <= 21 )
 430  0020 c60007        	ld	a,_rcStatus
 431  0023 a116          	cp	a,#22
 432  0025 2412          	jruge	L121
 433                     ; 147 			if( __rcCntl_Start[rcStatus-1] == 1 )
 435  0027 c60007        	ld	a,_rcStatus
 436  002a 5f            	clrw	x
 437  002b 97            	ld	xl,a
 438  002c 5a            	decw	x
 439  002d d60000        	ld	a,(___rcCntl_Start,x)
 440  0030 4a            	dec	a
 441                     ; 149 				_iouart_50ms_high = 1;
 442                     ; 150 				D_IOUART_HIGH;
 444  0031 2741          	jreq	LC001
 445                     ; 154 				D_IOUART_LOW;
 447  0033 72115019      	bres	20505,#0
 448  0037 2043          	jra	L721
 449  0039               L121:
 450                     ; 157 		else if( rcStatus <= 85 )	//	21+64
 452  0039 c60007        	ld	a,_rcStatus
 453  003c a156          	cp	a,#86
 454  003e 242d          	jruge	L131
 455                     ; 159 			t = rcIOUartTxBuffer[(uint8_t)(rci2>>3)];
 457  0040 c60006        	ld	a,_rci2
 458  0043 44            	srl	a
 459  0044 44            	srl	a
 460  0045 44            	srl	a
 461  0046 5f            	clrw	x
 462  0047 97            	ld	xl,a
 463  0048 d60008        	ld	a,(_rcIOUartTxBuffer,x)
 464  004b 6b01          	ld	(OFST+0,sp),a
 465                     ; 160 			t = (uint8_t)(t & __iBitTable[(uint8_t)(rci2&0x07)]);
 467  004d c60006        	ld	a,_rci2
 468  0050 a407          	and	a,#7
 469  0052 5f            	clrw	x
 470  0053 97            	ld	xl,a
 471  0054 7b01          	ld	a,(OFST+0,sp)
 472  0056 d40017        	and	a,(___iBitTable,x)
 473                     ; 161 			if( t != 0 )
 475  0059 2702          	jreq	L331
 476                     ; 162 				t = 1;
 478  005b a601          	ld	a,#1
 479  005d               L331:
 480  005d 6b01          	ld	(OFST+0,sp),a
 481                     ; 163 			rci1 = __rcCntl_Port[t];
 483  005f 5f            	clrw	x
 484  0060 97            	ld	xl,a
 485  0061 d60015        	ld	a,(___rcCntl_Port,x)
 486  0064 c70005        	ld	_rci1,a
 487                     ; 164 			rci2 += 1;
 489  0067 725c0006      	inc	_rci2
 490                     ; 165 			_iouart_50ms_high = 1;
 491                     ; 166 			D_IOUART_HIGH;
 493  006b 2007          	jpf	LC001
 494  006d               L131:
 495                     ; 168 		else if( rcStatus <= 87 )	//	(21+64)+2
 497  006d c60007        	ld	a,_rcStatus
 498  0070 a158          	cp	a,#88
 499  0072 2410          	jruge	L731
 500                     ; 170 			_iouart_50ms_high = 1;
 502                     ; 171 			D_IOUART_HIGH;
 504  0074               LC001:
 507  0074 3501000b      	mov	__iouart_50ms_high,#1
 510  0078 72105019      	bset	20505,#0
 512  007c               L721:
 513                     ; 183 		rcStatus += 1;
 515  007c 725c0007      	inc	_rcStatus
 516  0080               L511:
 517                     ; 185 	return 0;
 519  0080 4f            	clr	a
 522  0081 5b01          	addw	sp,#1
 523  0083 87            	retf	
 524  0084               L731:
 525                     ; 175 			D_IOUART_LOW;
 527  0084 72115019      	bres	20505,#0
 528                     ; 176 			rcStatus = 0;
 530  0088 725f0007      	clr	_rcStatus
 531                     ; 177 			rci1 = 0;
 533  008c 725f0005      	clr	_rci1
 534                     ; 178 			rci2 = 0;
 536  0090 725f0006      	clr	_rci2
 537                     ; 179 			indiIOUartIdle = 0;	//	Not Busy
 539  0094 725f0004      	clr	_indiIOUartIdle
 540                     ; 180 			IOUART(ENABLE);
 542  0098 a601          	ld	a,#1
 543  009a 8d000000      	callf	f_timer2Cntl
 545                     ; 181 			return 2;
 547  009e a602          	ld	a,#2
 550  00a0 5b01          	addw	sp,#1
 551  00a2 87            	retf	
 553                     	switch	.data
 554  000c               __is:
 555  000c 00            	dc.b	0
 600                     ; 190 uint8_t		iouart_Ready(void)
 600                     ; 191 {	
 601                     .text:	section	.text,new
 602  0000               f_iouart_Ready:
 604  0000 89            	pushw	x
 605       00000002      OFST:	set	2
 608                     ; 195 	cs = _io_tail;
 610  0001 c60000        	ld	a,__io_tail
 611  0004 6b01          	ld	(OFST-1,sp),a
 612                     ; 196 	i = (_io_buf[_io_tail]+1)/2;
 614  0006 5f            	clrw	x
 615  0007 97            	ld	xl,a
 616  0008 d60000        	ld	a,(__io_buf,x)
 617  000b 5f            	clrw	x
 618  000c 97            	ld	xl,a
 619  000d 5c            	incw	x
 620  000e a602          	ld	a,#2
 621  0010 8d000000      	callf	d_sdivx
 623  0014 01            	rrwa	x,a
 624  0015 6b02          	ld	(OFST+0,sp),a
 625                     ; 197 	_io_tail += 1;
 627  0017 725c0000      	inc	__io_tail
 628                     ; 198 	if( _io_tail == _IO_BUF_SIZE )
 630  001b c60000        	ld	a,__io_tail
 631  001e a130          	cp	a,#48
 632  0020 2604          	jrne	L161
 633                     ; 199 		_io_tail = 0;
 635  0022 725f0000      	clr	__io_tail
 636  0026               L161:
 637                     ; 203 	if( _is == 0 )
 639  0026 725d000c      	tnz	__is
 640  002a 261e          	jrne	L361
 641                     ; 205 		iBit = 0;
 643  002c 725f0008      	clr	_iBit
 644                     ; 206 		iByte = 0;
 646  0030 725f0009      	clr	_iByte
 647                     ; 207 		iData = 0;
 649  0034 725f000a      	clr	_iData
 650                     ; 208 		if( i == 12 )
 652  0038 7b02          	ld	a,(OFST+0,sp)
 653  003a a10c          	cp	a,#12
 654  003c 2704acdd00dd  	jrne	L761
 655                     ; 209 			_is = 1;
 657  0042 3501000c      	mov	__is,#1
 658  0046 acdd00dd      	jra	L761
 659  004a               L361:
 660                     ; 211 	else if( _is == 1 )
 662  004a c6000c        	ld	a,__is
 663  004d 4a            	dec	a
 664  004e 2620          	jrne	L171
 665                     ; 213 		_io_buf[cs] = 0;
 667  0050 7b01          	ld	a,(OFST-1,sp)
 668  0052 5f            	clrw	x
 669  0053 97            	ld	xl,a
 670  0054 724f0000      	clr	(__io_buf,x)
 671                     ; 214 		_is = i == 8 || i == 9 || i == 10? 2 : 0;
 673  0058 7b02          	ld	a,(OFST+0,sp)
 674  005a a108          	cp	a,#8
 675  005c 2708          	jreq	L63
 676  005e a109          	cp	a,#9
 677  0060 2704          	jreq	L63
 678  0062 a10a          	cp	a,#10
 679  0064 2604          	jrne	L43
 680  0066               L63:
 681  0066 a602          	ld	a,#2
 682  0068 2001          	jra	L04
 683  006a               L43:
 684  006a 4f            	clr	a
 685  006b               L04:
 686  006b c7000c        	ld	__is,a
 688  006e 206d          	jra	L761
 689  0070               L171:
 690                     ; 216 	else if( _is == 2 )
 692  0070 c6000c        	ld	a,__is
 693  0073 a102          	cp	a,#2
 694  0075 2666          	jrne	L761
 695                     ; 218 		if( i > 5 )
 697  0077 7b02          	ld	a,(OFST+0,sp)
 698  0079 a106          	cp	a,#6
 699  007b 250e          	jrult	L771
 700                     ; 219 			iData |= __iBitTable[iBit];
 702  007d c60008        	ld	a,_iBit
 703  0080 5f            	clrw	x
 704  0081 97            	ld	xl,a
 705  0082 c6000a        	ld	a,_iData
 706  0085 da0017        	or	a,(___iBitTable,x)
 707  0088 c7000a        	ld	_iData,a
 708  008b               L771:
 709                     ; 221 		iBit++;
 711  008b 725c0008      	inc	_iBit
 712                     ; 222 		if( iBit == 8 )
 714  008f c60008        	ld	a,_iBit
 715  0092 a108          	cp	a,#8
 716  0094 2647          	jrne	L761
 717                     ; 224 			iBit = 0;
 719  0096 725f0008      	clr	_iBit
 720                     ; 225 			iBuf[iByte++] = iData;
 722  009a c60009        	ld	a,_iByte
 723  009d 725c0009      	inc	_iByte
 724  00a1 5f            	clrw	x
 725  00a2 97            	ld	xl,a
 726  00a3 c6000a        	ld	a,_iData
 727  00a6 d70000        	ld	(_iBuf,x),a
 728                     ; 226 			if( iByte == 8 )
 730  00a9 c60009        	ld	a,_iByte
 731  00ac a108          	cp	a,#8
 732  00ae 2629          	jrne	L302
 733                     ; 228 				_is = 0;
 735  00b0 725f000c      	clr	__is
 736                     ; 229 				cs = 0;
 738  00b4 0f01          	clr	(OFST-1,sp)
 739                     ; 230 				for( i=0; i<7; i++ )
 741  00b6 4f            	clr	a
 742  00b7 6b02          	ld	(OFST+0,sp),a
 743  00b9               L502:
 744                     ; 231 					cs += iBuf[i];
 746  00b9 5f            	clrw	x
 747  00ba 97            	ld	xl,a
 748  00bb 7b01          	ld	a,(OFST-1,sp)
 749  00bd db0000        	add	a,(_iBuf,x)
 750  00c0 6b01          	ld	(OFST-1,sp),a
 751                     ; 230 				for( i=0; i<7; i++ )
 753  00c2 0c02          	inc	(OFST+0,sp)
 756  00c4 7b02          	ld	a,(OFST+0,sp)
 757  00c6 a107          	cp	a,#7
 758  00c8 25ef          	jrult	L502
 759                     ; 233 				if( cs != iData )
 761  00ca 7b01          	ld	a,(OFST-1,sp)
 762  00cc c1000a        	cp	a,_iData
 763  00cf 2704          	jreq	L312
 764                     ; 234 					return 2;
 766  00d1 a602          	ld	a,#2
 768  00d3 2002          	jra	L24
 769  00d5               L312:
 770                     ; 235 				return 1;
 772  00d5 a601          	ld	a,#1
 774  00d7               L24:
 776  00d7 85            	popw	x
 777  00d8 87            	retf	
 778  00d9               L302:
 779                     ; 237 			iData = 0;
 781  00d9 725f000a      	clr	_iData
 782  00dd               L761:
 783                     ; 240 	return 0;
 785  00dd 4f            	clr	a
 787  00de 20f7          	jra	L24
 963                     	xdef	__is
 964                     	xdef	f__iouart_50ms
 965                     	xdef	__iouart_50ms_high
 966                     	switch	.bss
 967  0000               _iBuf:
 968  0000 000000000000  	ds.b	8
 969                     	xdef	_iBuf
 970                     	xdef	_iData
 971                     	xdef	_iByte
 972                     	xdef	_iBit
 973                     	xdef	___iBitTable
 974                     	xdef	___rcCntl_Port
 975                     	xdef	___rcCntl_Start
 976                     	xdef	_rcStatus
 977                     	xdef	_rci2
 978                     	xdef	_rci1
 979  0008               _rcIOUartTxBuffer:
 980  0008 000000000000  	ds.b	8
 981                     	xdef	_rcIOUartTxBuffer
 982  0010               _pktIOUartWriteBuffer:
 983  0010 000000000000  	ds.b	8
 984                     	xdef	_pktIOUartWriteBuffer
 985                     	xdef	_indiIOUartSendReady
 986                     	xdef	f_iouart_getReadBuffer
 987                     	xdef	f_iouart_getBuffer
 988                     	xdef	f_iouart_Ready
 989                     	xref	__io_buf
 990                     	xref	__io_tail
 991                     	xdef	f_iouart_Write
 992                     	xdef	f_iouart_Pkt_Start
 993                     	xdef	f_iouart_Set_Packet
 994                     	xdef	f_iouart_Open
 995                     	xref	f_timer2Cntl
 996                     	xdef	_indiIOUartIdle
 997                     	xdef	_indiIOUartSendWait
 998                     	xdef	_indiIOUartWrite
 999                     	xref	f_GPIO_Init
1000                     	xref.b	c_x
1020                     	xref	d_sdivx
1021                     	end
