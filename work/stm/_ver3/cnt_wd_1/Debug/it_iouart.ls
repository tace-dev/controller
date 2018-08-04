   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     	switch	.data
  24  0000               _indiIOUartWrite:
  25  0000 00            	dc.b	0
  26  0001               _indiIOUartSendWait:
  27  0001 0000          	dc.w	0
  28  0003               _indiIOUartSendReady:
  29  0003 00            	dc.b	0
  30  0004               _indiIOUartIdle:
  31  0004 01            	dc.b	1
  32  0005               _rci1:
  33  0005 00            	dc.b	0
  34  0006               _rci2:
  35  0006 00            	dc.b	0
  36  0007               _rcStatus:
  37  0007 00            	dc.b	0
  38                     .const:	section	.text
  39  0000               ___rcCntl_Start:
  40  0000 01            	dc.b	1
  41  0001 01            	dc.b	1
  42  0002 00            	dc.b	0
  43  0003 00            	dc.b	0
  44  0004 00            	dc.b	0
  45  0005 00            	dc.b	0
  46  0006 00            	dc.b	0
  47  0007 00            	dc.b	0
  48  0008 00            	dc.b	0
  49  0009 00            	dc.b	0
  50  000a 00            	dc.b	0
  51  000b 00            	dc.b	0
  52  000c 01            	dc.b	1
  53  000d 01            	dc.b	1
  54  000e 00            	dc.b	0
  55  000f 00            	dc.b	0
  56  0010 00            	dc.b	0
  57  0011 00            	dc.b	0
  58  0012 00            	dc.b	0
  59  0013 00            	dc.b	0
  60  0014 00            	dc.b	0
  61  0015               ___rcCntl_Port:
  62  0015 03            	dc.b	3
  63  0016 05            	dc.b	5
  64  0017               ___iBitTable:
  65  0017 80            	dc.b	128
  66  0018 40            	dc.b	64
  67  0019 20            	dc.b	32
  68  001a 10            	dc.b	16
  69  001b 08            	dc.b	8
  70  001c 04            	dc.b	4
  71  001d 02            	dc.b	2
  72  001e 01            	dc.b	1
  73                     	switch	.data
  74  0008               _iBit:
  75  0008 00            	dc.b	0
  76  0009               _iByte:
  77  0009 00            	dc.b	0
  78  000a               _iData:
  79  000a 00            	dc.b	0
 109                     ; 44 void	iouart_Open(void)
 109                     ; 45 {
 111                     .text:	section	.text,new
 112  0000               _iouart_Open:
 116                     ; 46 	GPIO_Init(D_IOUART_TX_PORT, D_IOUART_TX_PIN, D_IO_OUT_TRIGER);
 118  0000 4be0          	push	#224
 119  0002 4b10          	push	#16
 120  0004 ae500f        	ldw	x,#20495
 121  0007 cd0000        	call	_GPIO_Init
 123  000a 85            	popw	x
 124                     ; 71 	GPIO_Init(D_IOUART3_TX_PORT, D_IOUART3_TX_PIN, D_IO_OUT_TRIGER);
 126  000b 4be0          	push	#224
 127  000d 4b02          	push	#2
 128  000f ae500a        	ldw	x,#20490
 129  0012 cd0000        	call	_GPIO_Init
 131  0015 85            	popw	x
 132                     ; 74 }
 135  0016 81            	ret	
 160                     ; 76 uint8_t	*iouart_getBuffer(void)
 160                     ; 77 {
 161                     .text:	section	.text,new
 162  0000               _iouart_getBuffer:
 166                     ; 78 	return rcIOUartTxBuffer;
 168  0000 ae0008        	ldw	x,#_rcIOUartTxBuffer
 171  0003 81            	ret	
 197                     ; 81 uint8_t	*iouart_getReadBuffer(void)
 197                     ; 82 {
 198                     .text:	section	.text,new
 199  0000               _iouart_getReadBuffer:
 203                     ; 83 	return iBuf;
 205  0000 ae0000        	ldw	x,#_iBuf
 208  0003 81            	ret	
 242                     ; 96 void	iouart_Set_Packet(uint8_t wait)
 242                     ; 97 {
 243                     .text:	section	.text,new
 244  0000               _iouart_Set_Packet:
 246  0000 88            	push	a
 247       00000000      OFST:	set	0
 250                     ; 98 	indiIOUartSendReady = 1;
 252  0001 35010003      	mov	_indiIOUartSendReady,#1
 253                     ; 104 	indiIOUartSendWait = wait + 1540; // 160ms
 255  0005 a606          	ld	a,#6
 256  0007 97            	ld	xl,a
 257  0008 a604          	ld	a,#4
 258  000a 1b01          	add	a,(OFST+1,sp)
 259  000c 2401          	jrnc	L02
 260  000e 5c            	incw	x
 261  000f               L02:
 262  000f c70002        	ld	_indiIOUartSendWait+1,a
 263  0012 9f            	ld	a,xl
 264  0013 c70001        	ld	_indiIOUartSendWait,a
 265                     ; 106 }
 268  0016 84            	pop	a
 269  0017 81            	ret	
 296                     ; 108 void	iouart_Pkt_Start(void)
 296                     ; 109 {
 297                     .text:	section	.text,new
 298  0000               _iouart_Pkt_Start:
 302                     ; 110 	indiIOUartIdle = 1;	//	Busy
 304  0000 35010004      	mov	_indiIOUartIdle,#1
 305                     ; 111 	rcStatus = 1;
 307  0004 35010007      	mov	_rcStatus,#1
 308                     ; 112 	indiIOUartSendReady = 0;
 310  0008 725f0003      	clr	_indiIOUartSendReady
 311                     ; 113 	IOUART(DISABLE);
 313  000c 4f            	clr	a
 315                     ; 114 }
 318  000d cc0000        	jp	_timer2Cntl
 321                     	switch	.data
 322  000b               __iouart_50ms_high:
 323  000b 00            	dc.b	0
 345                     ; 118 void	_iouart_50ms(void)
 345                     ; 119 {
 346                     .text:	section	.text,new
 347  0000               __iouart_50ms:
 351                     ; 121 	if( _iouart_50ms_high == 1 )
 353  0000 c6000b        	ld	a,__iouart_50ms_high
 354  0003 4a            	dec	a
 355  0004 2607          	jrne	L57
 356                     ; 123 		_iouart_50ms_high = 0;
 358  0006 c7000b        	ld	__iouart_50ms_high,a
 359                     ; 124 		D_IOUART_LOW;
 361  0009 7219500f      	bres	20495,#4
 362  000d               L57:
 363                     ; 127 }
 366  000d 81            	ret	
 408                     ; 129 uint8_t	iouart_Write(void)
 408                     ; 130 {
 409                     .text:	section	.text,new
 410  0000               _iouart_Write:
 412  0000 88            	push	a
 413       00000001      OFST:	set	1
 416                     ; 132 	if( rci1 != 0 )
 418  0001 725d0005      	tnz	_rci1
 419  0005 270a          	jreq	L311
 420                     ; 134 		rci1 -= 1;
 422  0007 725a0005      	dec	_rci1
 423                     ; 135 		D_IOUART_LOW;
 425  000b 7219500f      	bres	20495,#4
 427  000f 206f          	jra	L511
 428  0011               L311:
 429                     ; 139 		if( rcStatus == 0 )
 431  0011 725d0007      	tnz	_rcStatus
 432  0015 2609          	jrne	L711
 433                     ; 142 			D_IOUART_LOW;
 435  0017 7219500f      	bres	20495,#4
 436                     ; 143 			return 1;
 438  001b a601          	ld	a,#1
 441  001d 5b01          	addw	sp,#1
 442  001f 81            	ret	
 443  0020               L711:
 444                     ; 145 		if( rcStatus <= 21 )
 446  0020 c60007        	ld	a,_rcStatus
 447  0023 a116          	cp	a,#22
 448  0025 2412          	jruge	L121
 449                     ; 147 			if( __rcCntl_Start[rcStatus-1] == 1 )
 451  0027 c60007        	ld	a,_rcStatus
 452  002a 5f            	clrw	x
 453  002b 97            	ld	xl,a
 454  002c 5a            	decw	x
 455  002d d60000        	ld	a,(___rcCntl_Start,x)
 456  0030 4a            	dec	a
 457                     ; 149 				_iouart_50ms_high = 1;
 458                     ; 150 				D_IOUART_HIGH;
 460  0031 2741          	jreq	LC001
 461                     ; 154 				D_IOUART_LOW;
 463  0033 7219500f      	bres	20495,#4
 464  0037 2043          	jra	L721
 465  0039               L121:
 466                     ; 157 		else if( rcStatus <= 85 )	//	21+64
 468  0039 c60007        	ld	a,_rcStatus
 469  003c a156          	cp	a,#86
 470  003e 242d          	jruge	L131
 471                     ; 159 			t = rcIOUartTxBuffer[(uint8_t)(rci2>>3)];
 473  0040 c60006        	ld	a,_rci2
 474  0043 44            	srl	a
 475  0044 44            	srl	a
 476  0045 44            	srl	a
 477  0046 5f            	clrw	x
 478  0047 97            	ld	xl,a
 479  0048 d60008        	ld	a,(_rcIOUartTxBuffer,x)
 480  004b 6b01          	ld	(OFST+0,sp),a
 481                     ; 160 			t = (uint8_t)(t & __iBitTable[(uint8_t)(rci2&0x07)]);
 483  004d c60006        	ld	a,_rci2
 484  0050 a407          	and	a,#7
 485  0052 5f            	clrw	x
 486  0053 97            	ld	xl,a
 487  0054 7b01          	ld	a,(OFST+0,sp)
 488  0056 d40017        	and	a,(___iBitTable,x)
 489                     ; 161 			if( t != 0 )
 491  0059 2702          	jreq	L331
 492                     ; 162 				t = 1;
 494  005b a601          	ld	a,#1
 495  005d               L331:
 496  005d 6b01          	ld	(OFST+0,sp),a
 497                     ; 163 			rci1 = __rcCntl_Port[t];
 499  005f 5f            	clrw	x
 500  0060 97            	ld	xl,a
 501  0061 d60015        	ld	a,(___rcCntl_Port,x)
 502  0064 c70005        	ld	_rci1,a
 503                     ; 164 			rci2 += 1;
 505  0067 725c0006      	inc	_rci2
 506                     ; 165 			_iouart_50ms_high = 1;
 507                     ; 166 			D_IOUART_HIGH;
 509  006b 2007          	jp	LC001
 510  006d               L131:
 511                     ; 168 		else if( rcStatus <= 87 )	//	(21+64)+2
 513  006d c60007        	ld	a,_rcStatus
 514  0070 a158          	cp	a,#88
 515  0072 2410          	jruge	L731
 516                     ; 170 			_iouart_50ms_high = 1;
 518                     ; 171 			D_IOUART_HIGH;
 520  0074               LC001:
 523  0074 3501000b      	mov	__iouart_50ms_high,#1
 526  0078 7218500f      	bset	20495,#4
 528  007c               L721:
 529                     ; 183 		rcStatus += 1;
 531  007c 725c0007      	inc	_rcStatus
 532  0080               L511:
 533                     ; 185 	return 0;
 535  0080 4f            	clr	a
 538  0081 5b01          	addw	sp,#1
 539  0083 81            	ret	
 540  0084               L731:
 541                     ; 175 			D_IOUART_LOW;
 543  0084 7219500f      	bres	20495,#4
 544                     ; 176 			rcStatus = 0;
 546  0088 725f0007      	clr	_rcStatus
 547                     ; 177 			rci1 = 0;
 549  008c 725f0005      	clr	_rci1
 550                     ; 178 			rci2 = 0;
 552  0090 725f0006      	clr	_rci2
 553                     ; 179 			indiIOUartIdle = 0;	//	Not Busy
 555  0094 725f0004      	clr	_indiIOUartIdle
 556                     ; 180 			IOUART(ENABLE);
 558  0098 a601          	ld	a,#1
 559  009a cd0000        	call	_timer2Cntl
 561                     ; 181 			return 2;
 563  009d a602          	ld	a,#2
 566  009f 5b01          	addw	sp,#1
 567  00a1 81            	ret	
 570                     	switch	.data
 571  000c               __is:
 572  000c 00            	dc.b	0
 617                     ; 190 uint8_t		iouart_Ready(void)
 617                     ; 191 {	
 618                     .text:	section	.text,new
 619  0000               _iouart_Ready:
 621  0000 89            	pushw	x
 622       00000002      OFST:	set	2
 625                     ; 195 	cs = _io_tail;
 627  0001 c60000        	ld	a,__io_tail
 628  0004 6b01          	ld	(OFST-1,sp),a
 629                     ; 196 	i = (_io_buf[_io_tail]+1)/2;
 631  0006 5f            	clrw	x
 632  0007 97            	ld	xl,a
 633  0008 d60000        	ld	a,(__io_buf,x)
 634  000b 5f            	clrw	x
 635  000c 97            	ld	xl,a
 636  000d 5c            	incw	x
 637  000e a602          	ld	a,#2
 638  0010 cd0000        	call	c_sdivx
 640  0013 01            	rrwa	x,a
 641  0014 6b02          	ld	(OFST+0,sp),a
 642                     ; 197 	_io_tail += 1;
 644  0016 725c0000      	inc	__io_tail
 645                     ; 198 	if( _io_tail == _IO_BUF_SIZE )
 647  001a c60000        	ld	a,__io_tail
 648  001d a130          	cp	a,#48
 649  001f 2604          	jrne	L161
 650                     ; 199 		_io_tail = 0;
 652  0021 725f0000      	clr	__io_tail
 653  0025               L161:
 654                     ; 203 	if( _is == 0 )
 656  0025 725d000c      	tnz	__is
 657  0029 261c          	jrne	L361
 658                     ; 205 		iBit = 0;
 660  002b 725f0008      	clr	_iBit
 661                     ; 206 		iByte = 0;
 663  002f 725f0009      	clr	_iByte
 664                     ; 207 		iData = 0;
 666  0033 725f000a      	clr	_iData
 667                     ; 208 		if( i == 12 )
 669  0037 7b02          	ld	a,(OFST+0,sp)
 670  0039 a10c          	cp	a,#12
 671  003b 2703cc00da    	jrne	L761
 672                     ; 209 			_is = 1;
 674  0040 3501000c      	mov	__is,#1
 675  0044 cc00da        	jra	L761
 676  0047               L361:
 677                     ; 211 	else if( _is == 1 )
 679  0047 c6000c        	ld	a,__is
 680  004a 4a            	dec	a
 681  004b 2620          	jrne	L171
 682                     ; 213 		_io_buf[cs] = 0;
 684  004d 7b01          	ld	a,(OFST-1,sp)
 685  004f 5f            	clrw	x
 686  0050 97            	ld	xl,a
 687  0051 724f0000      	clr	(__io_buf,x)
 688                     ; 214 		_is = i == 8 || i == 9 || i == 10? 2 : 0;
 690  0055 7b02          	ld	a,(OFST+0,sp)
 691  0057 a108          	cp	a,#8
 692  0059 2708          	jreq	L04
 693  005b a109          	cp	a,#9
 694  005d 2704          	jreq	L04
 695  005f a10a          	cp	a,#10
 696  0061 2604          	jrne	L63
 697  0063               L04:
 698  0063 a602          	ld	a,#2
 699  0065 2001          	jra	L24
 700  0067               L63:
 701  0067 4f            	clr	a
 702  0068               L24:
 703  0068 c7000c        	ld	__is,a
 705  006b 206d          	jra	L761
 706  006d               L171:
 707                     ; 216 	else if( _is == 2 )
 709  006d c6000c        	ld	a,__is
 710  0070 a102          	cp	a,#2
 711  0072 2666          	jrne	L761
 712                     ; 218 		if( i > 5 )
 714  0074 7b02          	ld	a,(OFST+0,sp)
 715  0076 a106          	cp	a,#6
 716  0078 250e          	jrult	L771
 717                     ; 219 			iData |= __iBitTable[iBit];
 719  007a c60008        	ld	a,_iBit
 720  007d 5f            	clrw	x
 721  007e 97            	ld	xl,a
 722  007f c6000a        	ld	a,_iData
 723  0082 da0017        	or	a,(___iBitTable,x)
 724  0085 c7000a        	ld	_iData,a
 725  0088               L771:
 726                     ; 221 		iBit++;
 728  0088 725c0008      	inc	_iBit
 729                     ; 222 		if( iBit == 8 )
 731  008c c60008        	ld	a,_iBit
 732  008f a108          	cp	a,#8
 733  0091 2647          	jrne	L761
 734                     ; 224 			iBit = 0;
 736  0093 725f0008      	clr	_iBit
 737                     ; 225 			iBuf[iByte++] = iData;
 739  0097 c60009        	ld	a,_iByte
 740  009a 725c0009      	inc	_iByte
 741  009e 5f            	clrw	x
 742  009f 97            	ld	xl,a
 743  00a0 c6000a        	ld	a,_iData
 744  00a3 d70000        	ld	(_iBuf,x),a
 745                     ; 226 			if( iByte == 8 )
 747  00a6 c60009        	ld	a,_iByte
 748  00a9 a108          	cp	a,#8
 749  00ab 2629          	jrne	L302
 750                     ; 228 				_is = 0;
 752  00ad 725f000c      	clr	__is
 753                     ; 229 				cs = 0;
 755  00b1 0f01          	clr	(OFST-1,sp)
 756                     ; 230 				for( i=0; i<7; i++ )
 758  00b3 4f            	clr	a
 759  00b4 6b02          	ld	(OFST+0,sp),a
 760  00b6               L502:
 761                     ; 231 					cs += iBuf[i];
 763  00b6 5f            	clrw	x
 764  00b7 97            	ld	xl,a
 765  00b8 7b01          	ld	a,(OFST-1,sp)
 766  00ba db0000        	add	a,(_iBuf,x)
 767  00bd 6b01          	ld	(OFST-1,sp),a
 768                     ; 230 				for( i=0; i<7; i++ )
 770  00bf 0c02          	inc	(OFST+0,sp)
 773  00c1 7b02          	ld	a,(OFST+0,sp)
 774  00c3 a107          	cp	a,#7
 775  00c5 25ef          	jrult	L502
 776                     ; 233 				if( cs != iData )
 778  00c7 7b01          	ld	a,(OFST-1,sp)
 779  00c9 c1000a        	cp	a,_iData
 780  00cc 2704          	jreq	L312
 781                     ; 234 					return 2;
 783  00ce a602          	ld	a,#2
 785  00d0 2002          	jra	L44
 786  00d2               L312:
 787                     ; 235 				return 1;
 789  00d2 a601          	ld	a,#1
 791  00d4               L44:
 793  00d4 85            	popw	x
 794  00d5 81            	ret	
 795  00d6               L302:
 796                     ; 237 			iData = 0;
 798  00d6 725f000a      	clr	_iData
 799  00da               L761:
 800                     ; 240 	return 0;
 802  00da 4f            	clr	a
 804  00db 20f7          	jra	L44
 981                     	xdef	__is
 982                     	xdef	__iouart_50ms
 983                     	xdef	__iouart_50ms_high
 984                     	switch	.bss
 985  0000               _iBuf:
 986  0000 000000000000  	ds.b	8
 987                     	xdef	_iBuf
 988                     	xdef	_iData
 989                     	xdef	_iByte
 990                     	xdef	_iBit
 991                     	xdef	___iBitTable
 992                     	xdef	___rcCntl_Port
 993                     	xdef	___rcCntl_Start
 994                     	xdef	_rcStatus
 995                     	xdef	_rci2
 996                     	xdef	_rci1
 997  0008               _rcIOUartTxBuffer:
 998  0008 000000000000  	ds.b	8
 999                     	xdef	_rcIOUartTxBuffer
1000  0010               _pktIOUartWriteBuffer:
1001  0010 000000000000  	ds.b	8
1002                     	xdef	_pktIOUartWriteBuffer
1003                     	xdef	_indiIOUartSendReady
1004                     	xdef	_iouart_getReadBuffer
1005                     	xdef	_iouart_getBuffer
1006                     	xdef	_iouart_Ready
1007                     	xref	__io_buf
1008                     	xref	__io_tail
1009                     	xdef	_iouart_Write
1010                     	xdef	_iouart_Pkt_Start
1011                     	xdef	_iouart_Set_Packet
1012                     	xdef	_iouart_Open
1013                     	xref	_timer2Cntl
1014                     	xdef	_indiIOUartIdle
1015                     	xdef	_indiIOUartSendWait
1016                     	xdef	_indiIOUartWrite
1017                     	xref	_GPIO_Init
1018                     	xref.b	c_x
1038                     	xref	c_sdivx
1039                     	end
