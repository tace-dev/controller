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
 110                     .text:	section	.text,new
 111  0000               _iouart_Open:
 115                     ; 46 	GPIO_Init(D_IOUART_TX_PORT, D_IOUART_TX_PIN, D_IO_OUT_TRIGER);
 117  0000 4be0          	push	#224
 118  0002 4b01          	push	#1
 119  0004 ae5019        	ldw	x,#20505
 120  0007 cd0000        	call	_GPIO_Init
 122  000a 85            	popw	x
 123                     ; 74 }
 126  000b 81            	ret	
 151                     ; 76 uint8_t	*iouart_getBuffer(void)
 151                     ; 77 {
 152                     .text:	section	.text,new
 153  0000               _iouart_getBuffer:
 157                     ; 78 	return rcIOUartTxBuffer;
 159  0000 ae0008        	ldw	x,#_rcIOUartTxBuffer
 162  0003 81            	ret	
 188                     ; 81 uint8_t	*iouart_getReadBuffer(void)
 188                     ; 82 {
 189                     .text:	section	.text,new
 190  0000               _iouart_getReadBuffer:
 194                     ; 83 	return iBuf;
 196  0000 ae0000        	ldw	x,#_iBuf
 199  0003 81            	ret	
 233                     ; 96 void	iouart_Set_Packet(uint8_t wait)
 233                     ; 97 {
 234                     .text:	section	.text,new
 235  0000               _iouart_Set_Packet:
 237  0000 88            	push	a
 238       00000000      OFST:	set	0
 241                     ; 98 	indiIOUartSendReady = 1;
 243  0001 35010003      	mov	_indiIOUartSendReady,#1
 244                     ; 104 	indiIOUartSendWait = wait + 1540; // 160ms
 246  0005 a606          	ld	a,#6
 247  0007 97            	ld	xl,a
 248  0008 a604          	ld	a,#4
 249  000a 1b01          	add	a,(OFST+1,sp)
 250  000c 2401          	jrnc	L61
 251  000e 5c            	incw	x
 252  000f               L61:
 253  000f c70002        	ld	_indiIOUartSendWait+1,a
 254  0012 9f            	ld	a,xl
 255  0013 c70001        	ld	_indiIOUartSendWait,a
 256                     ; 106 }
 259  0016 84            	pop	a
 260  0017 81            	ret	
 287                     ; 108 void	iouart_Pkt_Start(void)
 287                     ; 109 {
 288                     .text:	section	.text,new
 289  0000               _iouart_Pkt_Start:
 293                     ; 110 	indiIOUartIdle = 1;	//	Busy
 295  0000 35010004      	mov	_indiIOUartIdle,#1
 296                     ; 111 	rcStatus = 1;
 298  0004 35010007      	mov	_rcStatus,#1
 299                     ; 112 	indiIOUartSendReady = 0;
 301  0008 725f0003      	clr	_indiIOUartSendReady
 302                     ; 113 	IOUART(DISABLE);
 304  000c 4f            	clr	a
 306                     ; 114 }
 309  000d cc0000        	jp	_timer2Cntl
 312                     	switch	.data
 313  000b               __iouart_50ms_high:
 314  000b 00            	dc.b	0
 336                     ; 118 void	_iouart_50ms(void)
 336                     ; 119 {
 337                     .text:	section	.text,new
 338  0000               __iouart_50ms:
 342                     ; 121 	if( _iouart_50ms_high == 1 )
 344  0000 c6000b        	ld	a,__iouart_50ms_high
 345  0003 4a            	dec	a
 346  0004 2607          	jrne	L57
 347                     ; 123 		_iouart_50ms_high = 0;
 349  0006 c7000b        	ld	__iouart_50ms_high,a
 350                     ; 124 		D_IOUART_LOW;
 352  0009 72115019      	bres	20505,#0
 353  000d               L57:
 354                     ; 127 }
 357  000d 81            	ret	
 399                     ; 129 uint8_t	iouart_Write(void)
 399                     ; 130 {
 400                     .text:	section	.text,new
 401  0000               _iouart_Write:
 403  0000 88            	push	a
 404       00000001      OFST:	set	1
 407                     ; 132 	if( rci1 != 0 )
 409  0001 725d0005      	tnz	_rci1
 410  0005 270a          	jreq	L311
 411                     ; 134 		rci1 -= 1;
 413  0007 725a0005      	dec	_rci1
 414                     ; 135 		D_IOUART_LOW;
 416  000b 72115019      	bres	20505,#0
 418  000f 206f          	jra	L511
 419  0011               L311:
 420                     ; 139 		if( rcStatus == 0 )
 422  0011 725d0007      	tnz	_rcStatus
 423  0015 2609          	jrne	L711
 424                     ; 142 			D_IOUART_LOW;
 426  0017 72115019      	bres	20505,#0
 427                     ; 143 			return 1;
 429  001b a601          	ld	a,#1
 432  001d 5b01          	addw	sp,#1
 433  001f 81            	ret	
 434  0020               L711:
 435                     ; 145 		if( rcStatus <= 21 )
 437  0020 c60007        	ld	a,_rcStatus
 438  0023 a116          	cp	a,#22
 439  0025 2412          	jruge	L121
 440                     ; 147 			if( __rcCntl_Start[rcStatus-1] == 1 )
 442  0027 c60007        	ld	a,_rcStatus
 443  002a 5f            	clrw	x
 444  002b 97            	ld	xl,a
 445  002c 5a            	decw	x
 446  002d d60000        	ld	a,(___rcCntl_Start,x)
 447  0030 4a            	dec	a
 448                     ; 149 				_iouart_50ms_high = 1;
 449                     ; 150 				D_IOUART_HIGH;
 451  0031 2741          	jreq	LC001
 452                     ; 154 				D_IOUART_LOW;
 454  0033 72115019      	bres	20505,#0
 455  0037 2043          	jra	L721
 456  0039               L121:
 457                     ; 157 		else if( rcStatus <= 85 )	//	21+64
 459  0039 c60007        	ld	a,_rcStatus
 460  003c a156          	cp	a,#86
 461  003e 242d          	jruge	L131
 462                     ; 159 			t = rcIOUartTxBuffer[(uint8_t)(rci2>>3)];
 464  0040 c60006        	ld	a,_rci2
 465  0043 44            	srl	a
 466  0044 44            	srl	a
 467  0045 44            	srl	a
 468  0046 5f            	clrw	x
 469  0047 97            	ld	xl,a
 470  0048 d60008        	ld	a,(_rcIOUartTxBuffer,x)
 471  004b 6b01          	ld	(OFST+0,sp),a
 472                     ; 160 			t = (uint8_t)(t & __iBitTable[(uint8_t)(rci2&0x07)]);
 474  004d c60006        	ld	a,_rci2
 475  0050 a407          	and	a,#7
 476  0052 5f            	clrw	x
 477  0053 97            	ld	xl,a
 478  0054 7b01          	ld	a,(OFST+0,sp)
 479  0056 d40017        	and	a,(___iBitTable,x)
 480                     ; 161 			if( t != 0 )
 482  0059 2702          	jreq	L331
 483                     ; 162 				t = 1;
 485  005b a601          	ld	a,#1
 486  005d               L331:
 487  005d 6b01          	ld	(OFST+0,sp),a
 488                     ; 163 			rci1 = __rcCntl_Port[t];
 490  005f 5f            	clrw	x
 491  0060 97            	ld	xl,a
 492  0061 d60015        	ld	a,(___rcCntl_Port,x)
 493  0064 c70005        	ld	_rci1,a
 494                     ; 164 			rci2 += 1;
 496  0067 725c0006      	inc	_rci2
 497                     ; 165 			_iouart_50ms_high = 1;
 498                     ; 166 			D_IOUART_HIGH;
 500  006b 2007          	jp	LC001
 501  006d               L131:
 502                     ; 168 		else if( rcStatus <= 87 )	//	(21+64)+2
 504  006d c60007        	ld	a,_rcStatus
 505  0070 a158          	cp	a,#88
 506  0072 2410          	jruge	L731
 507                     ; 170 			_iouart_50ms_high = 1;
 509                     ; 171 			D_IOUART_HIGH;
 511  0074               LC001:
 514  0074 3501000b      	mov	__iouart_50ms_high,#1
 517  0078 72105019      	bset	20505,#0
 519  007c               L721:
 520                     ; 183 		rcStatus += 1;
 522  007c 725c0007      	inc	_rcStatus
 523  0080               L511:
 524                     ; 185 	return 0;
 526  0080 4f            	clr	a
 529  0081 5b01          	addw	sp,#1
 530  0083 81            	ret	
 531  0084               L731:
 532                     ; 175 			D_IOUART_LOW;
 534  0084 72115019      	bres	20505,#0
 535                     ; 176 			rcStatus = 0;
 537  0088 725f0007      	clr	_rcStatus
 538                     ; 177 			rci1 = 0;
 540  008c 725f0005      	clr	_rci1
 541                     ; 178 			rci2 = 0;
 543  0090 725f0006      	clr	_rci2
 544                     ; 179 			indiIOUartIdle = 0;	//	Not Busy
 546  0094 725f0004      	clr	_indiIOUartIdle
 547                     ; 180 			IOUART(ENABLE);
 549  0098 a601          	ld	a,#1
 550  009a cd0000        	call	_timer2Cntl
 552                     ; 181 			return 2;
 554  009d a602          	ld	a,#2
 557  009f 5b01          	addw	sp,#1
 558  00a1 81            	ret	
 561                     	switch	.data
 562  000c               __is:
 563  000c 00            	dc.b	0
 608                     ; 190 uint8_t		iouart_Ready(void)
 608                     ; 191 {	
 609                     .text:	section	.text,new
 610  0000               _iouart_Ready:
 612  0000 89            	pushw	x
 613       00000002      OFST:	set	2
 616                     ; 195 	cs = _io_tail;
 618  0001 c60000        	ld	a,__io_tail
 619  0004 6b01          	ld	(OFST-1,sp),a
 620                     ; 196 	i = (_io_buf[_io_tail]+1)/2;
 622  0006 5f            	clrw	x
 623  0007 97            	ld	xl,a
 624  0008 d60000        	ld	a,(__io_buf,x)
 625  000b 5f            	clrw	x
 626  000c 97            	ld	xl,a
 627  000d 5c            	incw	x
 628  000e a602          	ld	a,#2
 629  0010 cd0000        	call	c_sdivx
 631  0013 01            	rrwa	x,a
 632  0014 6b02          	ld	(OFST+0,sp),a
 633                     ; 197 	_io_tail += 1;
 635  0016 725c0000      	inc	__io_tail
 636                     ; 198 	if( _io_tail == _IO_BUF_SIZE )
 638  001a c60000        	ld	a,__io_tail
 639  001d a130          	cp	a,#48
 640  001f 2604          	jrne	L161
 641                     ; 199 		_io_tail = 0;
 643  0021 725f0000      	clr	__io_tail
 644  0025               L161:
 645                     ; 203 	if( _is == 0 )
 647  0025 725d000c      	tnz	__is
 648  0029 261c          	jrne	L361
 649                     ; 205 		iBit = 0;
 651  002b 725f0008      	clr	_iBit
 652                     ; 206 		iByte = 0;
 654  002f 725f0009      	clr	_iByte
 655                     ; 207 		iData = 0;
 657  0033 725f000a      	clr	_iData
 658                     ; 208 		if( i == 12 )
 660  0037 7b02          	ld	a,(OFST+0,sp)
 661  0039 a10c          	cp	a,#12
 662  003b 2703cc00da    	jrne	L761
 663                     ; 209 			_is = 1;
 665  0040 3501000c      	mov	__is,#1
 666  0044 cc00da        	jra	L761
 667  0047               L361:
 668                     ; 211 	else if( _is == 1 )
 670  0047 c6000c        	ld	a,__is
 671  004a 4a            	dec	a
 672  004b 2620          	jrne	L171
 673                     ; 213 		_io_buf[cs] = 0;
 675  004d 7b01          	ld	a,(OFST-1,sp)
 676  004f 5f            	clrw	x
 677  0050 97            	ld	xl,a
 678  0051 724f0000      	clr	(__io_buf,x)
 679                     ; 214 		_is = i == 8 || i == 9 || i == 10? 2 : 0;
 681  0055 7b02          	ld	a,(OFST+0,sp)
 682  0057 a108          	cp	a,#8
 683  0059 2708          	jreq	L63
 684  005b a109          	cp	a,#9
 685  005d 2704          	jreq	L63
 686  005f a10a          	cp	a,#10
 687  0061 2604          	jrne	L43
 688  0063               L63:
 689  0063 a602          	ld	a,#2
 690  0065 2001          	jra	L04
 691  0067               L43:
 692  0067 4f            	clr	a
 693  0068               L04:
 694  0068 c7000c        	ld	__is,a
 696  006b 206d          	jra	L761
 697  006d               L171:
 698                     ; 216 	else if( _is == 2 )
 700  006d c6000c        	ld	a,__is
 701  0070 a102          	cp	a,#2
 702  0072 2666          	jrne	L761
 703                     ; 218 		if( i > 5 )
 705  0074 7b02          	ld	a,(OFST+0,sp)
 706  0076 a106          	cp	a,#6
 707  0078 250e          	jrult	L771
 708                     ; 219 			iData |= __iBitTable[iBit];
 710  007a c60008        	ld	a,_iBit
 711  007d 5f            	clrw	x
 712  007e 97            	ld	xl,a
 713  007f c6000a        	ld	a,_iData
 714  0082 da0017        	or	a,(___iBitTable,x)
 715  0085 c7000a        	ld	_iData,a
 716  0088               L771:
 717                     ; 221 		iBit++;
 719  0088 725c0008      	inc	_iBit
 720                     ; 222 		if( iBit == 8 )
 722  008c c60008        	ld	a,_iBit
 723  008f a108          	cp	a,#8
 724  0091 2647          	jrne	L761
 725                     ; 224 			iBit = 0;
 727  0093 725f0008      	clr	_iBit
 728                     ; 225 			iBuf[iByte++] = iData;
 730  0097 c60009        	ld	a,_iByte
 731  009a 725c0009      	inc	_iByte
 732  009e 5f            	clrw	x
 733  009f 97            	ld	xl,a
 734  00a0 c6000a        	ld	a,_iData
 735  00a3 d70000        	ld	(_iBuf,x),a
 736                     ; 226 			if( iByte == 8 )
 738  00a6 c60009        	ld	a,_iByte
 739  00a9 a108          	cp	a,#8
 740  00ab 2629          	jrne	L302
 741                     ; 228 				_is = 0;
 743  00ad 725f000c      	clr	__is
 744                     ; 229 				cs = 0;
 746  00b1 0f01          	clr	(OFST-1,sp)
 747                     ; 230 				for( i=0; i<7; i++ )
 749  00b3 4f            	clr	a
 750  00b4 6b02          	ld	(OFST+0,sp),a
 751  00b6               L502:
 752                     ; 231 					cs += iBuf[i];
 754  00b6 5f            	clrw	x
 755  00b7 97            	ld	xl,a
 756  00b8 7b01          	ld	a,(OFST-1,sp)
 757  00ba db0000        	add	a,(_iBuf,x)
 758  00bd 6b01          	ld	(OFST-1,sp),a
 759                     ; 230 				for( i=0; i<7; i++ )
 761  00bf 0c02          	inc	(OFST+0,sp)
 764  00c1 7b02          	ld	a,(OFST+0,sp)
 765  00c3 a107          	cp	a,#7
 766  00c5 25ef          	jrult	L502
 767                     ; 233 				if( cs != iData )
 769  00c7 7b01          	ld	a,(OFST-1,sp)
 770  00c9 c1000a        	cp	a,_iData
 771  00cc 2704          	jreq	L312
 772                     ; 234 					return 2;
 774  00ce a602          	ld	a,#2
 776  00d0 2002          	jra	L24
 777  00d2               L312:
 778                     ; 235 				return 1;
 780  00d2 a601          	ld	a,#1
 782  00d4               L24:
 784  00d4 85            	popw	x
 785  00d5 81            	ret	
 786  00d6               L302:
 787                     ; 237 			iData = 0;
 789  00d6 725f000a      	clr	_iData
 790  00da               L761:
 791                     ; 240 	return 0;
 793  00da 4f            	clr	a
 795  00db 20f7          	jra	L24
 972                     	xdef	__is
 973                     	xdef	__iouart_50ms
 974                     	xdef	__iouart_50ms_high
 975                     	switch	.bss
 976  0000               _iBuf:
 977  0000 000000000000  	ds.b	8
 978                     	xdef	_iBuf
 979                     	xdef	_iData
 980                     	xdef	_iByte
 981                     	xdef	_iBit
 982                     	xdef	___iBitTable
 983                     	xdef	___rcCntl_Port
 984                     	xdef	___rcCntl_Start
 985                     	xdef	_rcStatus
 986                     	xdef	_rci2
 987                     	xdef	_rci1
 988  0008               _rcIOUartTxBuffer:
 989  0008 000000000000  	ds.b	8
 990                     	xdef	_rcIOUartTxBuffer
 991  0010               _pktIOUartWriteBuffer:
 992  0010 000000000000  	ds.b	8
 993                     	xdef	_pktIOUartWriteBuffer
 994                     	xdef	_indiIOUartSendReady
 995                     	xdef	_iouart_getReadBuffer
 996                     	xdef	_iouart_getBuffer
 997                     	xdef	_iouart_Ready
 998                     	xref	__io_buf
 999                     	xref	__io_tail
1000                     	xdef	_iouart_Write
1001                     	xdef	_iouart_Pkt_Start
1002                     	xdef	_iouart_Set_Packet
1003                     	xdef	_iouart_Open
1004                     	xref	_timer2Cntl
1005                     	xdef	_indiIOUartIdle
1006                     	xdef	_indiIOUartSendWait
1007                     	xdef	_indiIOUartWrite
1008                     	xref	_GPIO_Init
1009                     	xref.b	c_x
1029                     	xref	c_sdivx
1030                     	end
