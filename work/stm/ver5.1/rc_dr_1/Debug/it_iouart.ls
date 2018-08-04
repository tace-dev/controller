   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
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
 241                     ; 110 	indiIOUartSendReady = 1;
 243  0001 35010003      	mov	_indiIOUartSendReady,#1
 244                     ; 116 	indiIOUartSendWait = wait + 1540; // 160ms
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
 256                     ; 118 }
 259  0016 84            	pop	a
 260  0017 81            	ret	
 287                     ; 120 void	iouart_Pkt_Start(void)
 287                     ; 121 {
 288                     .text:	section	.text,new
 289  0000               _iouart_Pkt_Start:
 293                     ; 122 	indiIOUartIdle = 1;	//	Busy
 295  0000 35010004      	mov	_indiIOUartIdle,#1
 296                     ; 123 	rcStatus = 1;
 298  0004 35010007      	mov	_rcStatus,#1
 299                     ; 124 	indiIOUartSendReady = 0;
 301  0008 725f0003      	clr	_indiIOUartSendReady
 302                     ; 125 	IOUART(DISABLE);
 304  000c 4f            	clr	a
 306                     ; 126 }
 309  000d cc0000        	jp	_timer2Cntl
 312                     	switch	.data
 313  000b               __iouart_50ms_high:
 314  000b 00            	dc.b	0
 336                     ; 130 void	_iouart_50ms(void)
 336                     ; 131 {
 337                     .text:	section	.text,new
 338  0000               __iouart_50ms:
 342                     ; 133 	if( _iouart_50ms_high == 1 )
 344  0000 c6000b        	ld	a,__iouart_50ms_high
 345  0003 4a            	dec	a
 346  0004 2607          	jrne	L57
 347                     ; 135 		_iouart_50ms_high = 0;
 349  0006 c7000b        	ld	__iouart_50ms_high,a
 350                     ; 136 		D_IOUART_LOW;
 352  0009 72115019      	bres	20505,#0
 353  000d               L57:
 354                     ; 139 }
 357  000d 81            	ret	
 399                     ; 141 uint8_t	iouart_Write(void)
 399                     ; 142 {
 400                     .text:	section	.text,new
 401  0000               _iouart_Write:
 403  0000 88            	push	a
 404       00000001      OFST:	set	1
 407                     ; 144 	if( rci1 != 0 )
 409  0001 725d0005      	tnz	_rci1
 410  0005 270a          	jreq	L311
 411                     ; 146 		rci1 -= 1;
 413  0007 725a0005      	dec	_rci1
 414                     ; 147 		D_IOUART_LOW;
 416  000b 72115019      	bres	20505,#0
 418  000f 206f          	jra	L511
 419  0011               L311:
 420                     ; 151 		if( rcStatus == 0 )
 422  0011 725d0007      	tnz	_rcStatus
 423  0015 2609          	jrne	L711
 424                     ; 154 			D_IOUART_LOW;
 426  0017 72115019      	bres	20505,#0
 427                     ; 155 			return 1;
 429  001b a601          	ld	a,#1
 432  001d 5b01          	addw	sp,#1
 433  001f 81            	ret	
 434  0020               L711:
 435                     ; 157 		if( rcStatus <= 21 )
 437  0020 c60007        	ld	a,_rcStatus
 438  0023 a116          	cp	a,#22
 439  0025 2412          	jruge	L121
 440                     ; 159 			if( __rcCntl_Start[rcStatus-1] == 1 )
 442  0027 c60007        	ld	a,_rcStatus
 443  002a 5f            	clrw	x
 444  002b 97            	ld	xl,a
 445  002c 5a            	decw	x
 446  002d d60000        	ld	a,(___rcCntl_Start,x)
 447  0030 4a            	dec	a
 448                     ; 161 				_iouart_50ms_high = 1;
 449                     ; 162 				D_IOUART_HIGH;
 451  0031 2741          	jreq	LC001
 452                     ; 166 				D_IOUART_LOW;
 454  0033 72115019      	bres	20505,#0
 455  0037 2043          	jra	L721
 456  0039               L121:
 457                     ; 169 		else if( rcStatus <= 85 )	//	21+64
 459  0039 c60007        	ld	a,_rcStatus
 460  003c a156          	cp	a,#86
 461  003e 242d          	jruge	L131
 462                     ; 171 			t = rcIOUartTxBuffer[(uint8_t)(rci2>>3)];
 464  0040 c60006        	ld	a,_rci2
 465  0043 44            	srl	a
 466  0044 44            	srl	a
 467  0045 44            	srl	a
 468  0046 5f            	clrw	x
 469  0047 97            	ld	xl,a
 470  0048 d60008        	ld	a,(_rcIOUartTxBuffer,x)
 471  004b 6b01          	ld	(OFST+0,sp),a
 473                     ; 172 			t = (uint8_t)(t & __iBitTable[(uint8_t)(rci2&0x07)]);
 475  004d c60006        	ld	a,_rci2
 476  0050 a407          	and	a,#7
 477  0052 5f            	clrw	x
 478  0053 97            	ld	xl,a
 479  0054 7b01          	ld	a,(OFST+0,sp)
 480  0056 d40017        	and	a,(___iBitTable,x)
 482                     ; 173 			if( t != 0 )
 484  0059 2702          	jreq	L331
 485                     ; 174 				t = 1;
 487  005b a601          	ld	a,#1
 489  005d               L331:
 490  005d 6b01          	ld	(OFST+0,sp),a
 491                     ; 175 			rci1 = __rcCntl_Port[t];
 493  005f 5f            	clrw	x
 494  0060 97            	ld	xl,a
 495  0061 d60015        	ld	a,(___rcCntl_Port,x)
 496  0064 c70005        	ld	_rci1,a
 497                     ; 176 			rci2 += 1;
 499  0067 725c0006      	inc	_rci2
 500                     ; 177 			_iouart_50ms_high = 1;
 501                     ; 178 			D_IOUART_HIGH;
 503  006b 2007          	jp	LC001
 504  006d               L131:
 505                     ; 180 		else if( rcStatus <= 87 )	//	(21+64)+2
 507  006d c60007        	ld	a,_rcStatus
 508  0070 a158          	cp	a,#88
 509  0072 2410          	jruge	L731
 510                     ; 182 			_iouart_50ms_high = 1;
 512                     ; 183 			D_IOUART_HIGH;
 514  0074               LC001:
 517  0074 3501000b      	mov	__iouart_50ms_high,#1
 520  0078 72105019      	bset	20505,#0
 522  007c               L721:
 523                     ; 195 		rcStatus += 1;
 525  007c 725c0007      	inc	_rcStatus
 526  0080               L511:
 527                     ; 197 	return 0;
 529  0080 4f            	clr	a
 532  0081 5b01          	addw	sp,#1
 533  0083 81            	ret	
 534  0084               L731:
 535                     ; 187 			D_IOUART_LOW;
 537  0084 72115019      	bres	20505,#0
 538                     ; 188 			rcStatus = 0;
 540  0088 725f0007      	clr	_rcStatus
 541                     ; 189 			rci1 = 0;
 543  008c 725f0005      	clr	_rci1
 544                     ; 190 			rci2 = 0;
 546  0090 725f0006      	clr	_rci2
 547                     ; 191 			indiIOUartIdle = 0;	//	Not Busy
 549  0094 725f0004      	clr	_indiIOUartIdle
 550                     ; 192 			IOUART(ENABLE);
 552  0098 a601          	ld	a,#1
 553  009a cd0000        	call	_timer2Cntl
 555                     ; 193 			return 2;
 557  009d a602          	ld	a,#2
 560  009f 5b01          	addw	sp,#1
 561  00a1 81            	ret	
 564                     	switch	.data
 565  000c               __is:
 566  000c 00            	dc.b	0
 611                     ; 202 uint8_t		iouart_Ready(void)
 611                     ; 203 {	
 612                     .text:	section	.text,new
 613  0000               _iouart_Ready:
 615  0000 89            	pushw	x
 616       00000002      OFST:	set	2
 619                     ; 209 	cs = _io_tail;
 621  0001 c60000        	ld	a,__io_tail
 622  0004 6b01          	ld	(OFST-1,sp),a
 624                     ; 210 	i = (_io_buf[_io_tail]+1)/2;
 626  0006 5f            	clrw	x
 627  0007 97            	ld	xl,a
 628  0008 d60000        	ld	a,(__io_buf,x)
 629  000b 5f            	clrw	x
 630  000c 97            	ld	xl,a
 631  000d 5c            	incw	x
 632  000e a602          	ld	a,#2
 633  0010 cd0000        	call	c_sdivx
 635  0013 01            	rrwa	x,a
 636  0014 6b02          	ld	(OFST+0,sp),a
 638                     ; 211 	_io_tail += 1;
 640  0016 725c0000      	inc	__io_tail
 641                     ; 212 	if( _io_tail == _IO_BUF_SIZE )
 643  001a c60000        	ld	a,__io_tail
 644  001d a130          	cp	a,#48
 645  001f 2604          	jrne	L161
 646                     ; 213 		_io_tail = 0;
 648  0021 725f0000      	clr	__io_tail
 649  0025               L161:
 650                     ; 217 	if( _is == 0 )
 652  0025 725d000c      	tnz	__is
 653  0029 261c          	jrne	L361
 654                     ; 219 		iBit = 0;
 656  002b 725f0008      	clr	_iBit
 657                     ; 220 		iByte = 0;
 659  002f 725f0009      	clr	_iByte
 660                     ; 221 		iData = 0;
 662  0033 725f000a      	clr	_iData
 663                     ; 222 		if( i == 12 )
 665  0037 7b02          	ld	a,(OFST+0,sp)
 666  0039 a10c          	cp	a,#12
 667  003b 2703cc00da    	jrne	L761
 668                     ; 223 			_is = 1;
 670  0040 3501000c      	mov	__is,#1
 671  0044 cc00da        	jra	L761
 672  0047               L361:
 673                     ; 225 	else if( _is == 1 )
 675  0047 c6000c        	ld	a,__is
 676  004a 4a            	dec	a
 677  004b 2620          	jrne	L171
 678                     ; 227 		_io_buf[cs] = 0;
 680  004d 7b01          	ld	a,(OFST-1,sp)
 681  004f 5f            	clrw	x
 682  0050 97            	ld	xl,a
 683  0051 724f0000      	clr	(__io_buf,x)
 684                     ; 228 		_is = i == 8 || i == 9 || i == 10? 2 : 0;
 686  0055 7b02          	ld	a,(OFST+0,sp)
 687  0057 a108          	cp	a,#8
 688  0059 2708          	jreq	L63
 689  005b a109          	cp	a,#9
 690  005d 2704          	jreq	L63
 691  005f a10a          	cp	a,#10
 692  0061 2604          	jrne	L43
 693  0063               L63:
 694  0063 a602          	ld	a,#2
 695  0065 2001          	jra	L04
 696  0067               L43:
 697  0067 4f            	clr	a
 698  0068               L04:
 699  0068 c7000c        	ld	__is,a
 701  006b 206d          	jra	L761
 702  006d               L171:
 703                     ; 230 	else if( _is == 2 )
 705  006d c6000c        	ld	a,__is
 706  0070 a102          	cp	a,#2
 707  0072 2666          	jrne	L761
 708                     ; 232 		if( i > 5 )
 710  0074 7b02          	ld	a,(OFST+0,sp)
 711  0076 a106          	cp	a,#6
 712  0078 250e          	jrult	L771
 713                     ; 233 			iData |= __iBitTable[iBit];
 715  007a c60008        	ld	a,_iBit
 716  007d 5f            	clrw	x
 717  007e 97            	ld	xl,a
 718  007f c6000a        	ld	a,_iData
 719  0082 da0017        	or	a,(___iBitTable,x)
 720  0085 c7000a        	ld	_iData,a
 721  0088               L771:
 722                     ; 235 		iBit++;
 724  0088 725c0008      	inc	_iBit
 725                     ; 236 		if( iBit == 8 )
 727  008c c60008        	ld	a,_iBit
 728  008f a108          	cp	a,#8
 729  0091 2647          	jrne	L761
 730                     ; 238 			iBit = 0;
 732  0093 725f0008      	clr	_iBit
 733                     ; 239 			iBuf[iByte++] = iData;
 735  0097 c60009        	ld	a,_iByte
 736  009a 725c0009      	inc	_iByte
 737  009e 5f            	clrw	x
 738  009f 97            	ld	xl,a
 739  00a0 c6000a        	ld	a,_iData
 740  00a3 d70000        	ld	(_iBuf,x),a
 741                     ; 240 			if( iByte == 8 )
 743  00a6 c60009        	ld	a,_iByte
 744  00a9 a108          	cp	a,#8
 745  00ab 2629          	jrne	L302
 746                     ; 242 				_is = 0;
 748  00ad 725f000c      	clr	__is
 749                     ; 243 				cs = 0;
 751  00b1 0f01          	clr	(OFST-1,sp)
 753                     ; 244 				for( i=0; i<7; i++ )
 755  00b3 4f            	clr	a
 756  00b4 6b02          	ld	(OFST+0,sp),a
 758  00b6               L502:
 759                     ; 245 					cs += iBuf[i];
 761  00b6 5f            	clrw	x
 762  00b7 97            	ld	xl,a
 763  00b8 7b01          	ld	a,(OFST-1,sp)
 764  00ba db0000        	add	a,(_iBuf,x)
 765  00bd 6b01          	ld	(OFST-1,sp),a
 767                     ; 244 				for( i=0; i<7; i++ )
 769  00bf 0c02          	inc	(OFST+0,sp)
 773  00c1 7b02          	ld	a,(OFST+0,sp)
 774  00c3 a107          	cp	a,#7
 775  00c5 25ef          	jrult	L502
 776                     ; 256 				if( cs != iData )
 778  00c7 7b01          	ld	a,(OFST-1,sp)
 779  00c9 c1000a        	cp	a,_iData
 780  00cc 2704          	jreq	L312
 781                     ; 257 					return 2;
 783  00ce a602          	ld	a,#2
 785  00d0 2002          	jra	L24
 786  00d2               L312:
 787                     ; 258 				return 1;
 789  00d2 a601          	ld	a,#1
 791  00d4               L24:
 793  00d4 85            	popw	x
 794  00d5 81            	ret	
 795  00d6               L302:
 796                     ; 260 			iData = 0;
 798  00d6 725f000a      	clr	_iData
 799  00da               L761:
 800                     ; 263 	return 0;
 802  00da 4f            	clr	a
 804  00db 20f7          	jra	L24
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
