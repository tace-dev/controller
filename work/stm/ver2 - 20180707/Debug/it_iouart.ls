   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  21                     	switch	.data
  22  0000               _indiIOUartWrite:
  23  0000 00            	dc.b	0
  24  0001               _indiIOUartSendWait:
  25  0001 0000          	dc.w	0
  26  0003               _indiIOUartSendReady:
  27  0003 00            	dc.b	0
  28  0004               _indiIOUartIdle:
  29  0004 01            	dc.b	1
  30  0005               _rci1:
  31  0005 00            	dc.b	0
  32  0006               _rci2:
  33  0006 00            	dc.b	0
  34  0007               _rcStatus:
  35  0007 00            	dc.b	0
  36                     .const:	section	.text
  37  0000               ___rcCntl_Start:
  38  0000 01            	dc.b	1
  39  0001 01            	dc.b	1
  40  0002 00            	dc.b	0
  41  0003 00            	dc.b	0
  42  0004 00            	dc.b	0
  43  0005 00            	dc.b	0
  44  0006 00            	dc.b	0
  45  0007 00            	dc.b	0
  46  0008 00            	dc.b	0
  47  0009 00            	dc.b	0
  48  000a 00            	dc.b	0
  49  000b 00            	dc.b	0
  50  000c 01            	dc.b	1
  51  000d 01            	dc.b	1
  52  000e 00            	dc.b	0
  53  000f 00            	dc.b	0
  54  0010 00            	dc.b	0
  55  0011 00            	dc.b	0
  56  0012 00            	dc.b	0
  57  0013 00            	dc.b	0
  58  0014 00            	dc.b	0
  59  0015               ___rcCntl_Port:
  60  0015 03            	dc.b	3
  61  0016 05            	dc.b	5
  62  0017               ___iBitTable:
  63  0017 80            	dc.b	128
  64  0018 40            	dc.b	64
  65  0019 20            	dc.b	32
  66  001a 10            	dc.b	16
  67  001b 08            	dc.b	8
  68  001c 04            	dc.b	4
  69  001d 02            	dc.b	2
  70  001e 01            	dc.b	1
  71                     	switch	.data
  72  0008               _iBit:
  73  0008 00            	dc.b	0
  74  0009               _iByte:
  75  0009 00            	dc.b	0
  76  000a               _iData:
  77  000a 00            	dc.b	0
 107                     ; 44 void	iouart_Open(void)
 107                     ; 45 {
 109                     	switch	.text
 110  0000               _iouart_Open:
 114                     ; 46 	GPIO_Init(D_IOUART_TX_PORT, D_IOUART_TX_PIN, D_IO_OUT_TRIGER);
 116  0000 4be0          	push	#224
 117  0002 4b01          	push	#1
 118  0004 ae5019        	ldw	x,#20505
 119  0007 cd0000        	call	_GPIO_Init
 121  000a 85            	popw	x
 122                     ; 74 }
 125  000b 81            	ret	
 150                     ; 76 uint8_t	*iouart_getBuffer(void)
 150                     ; 77 {
 151                     	switch	.text
 152  000c               _iouart_getBuffer:
 156                     ; 78 	return rcIOUartTxBuffer;
 158  000c ae0008        	ldw	x,#_rcIOUartTxBuffer
 161  000f 81            	ret	
 187                     ; 81 uint8_t	*iouart_getReadBuffer(void)
 187                     ; 82 {
 188                     	switch	.text
 189  0010               _iouart_getReadBuffer:
 193                     ; 83 	return iBuf;
 195  0010 ae0000        	ldw	x,#_iBuf
 198  0013 81            	ret	
 224                     ; 86 uint8_t	iouart_Get_WriteEnable()
 224                     ; 87 {
 225                     	switch	.text
 226  0014               _iouart_Get_WriteEnable:
 230                     ; 88 	if( indiIOUartSendReady == 1 && indiIOUartSendWait == 0 )
 232  0014 c60003        	ld	a,_indiIOUartSendReady
 233  0017 4a            	dec	a
 234  0018 260a          	jrne	L15
 236  001a ce0001        	ldw	x,_indiIOUartSendWait
 237  001d 2605          	jrne	L15
 238                     ; 90 		indiIOUartSendReady = 0;
 240  001f c70003        	ld	_indiIOUartSendReady,a
 241                     ; 91 		return 1;
 243  0022 4c            	inc	a
 246  0023 81            	ret	
 247  0024               L15:
 248                     ; 93 	return 0;
 250  0024 4f            	clr	a
 253  0025 81            	ret	
 287                     ; 96 void	iouart_Set_Packet(uint8_t wait)
 287                     ; 97 {
 288                     	switch	.text
 289  0026               _iouart_Set_Packet:
 291  0026 88            	push	a
 292       00000000      OFST:	set	0
 295                     ; 98 	indiIOUartSendReady = 1;
 297  0027 35010003      	mov	_indiIOUartSendReady,#1
 298                     ; 99 	indiIOUartSendWait = wait + 1540; // 1600ms
 300  002b a606          	ld	a,#6
 301  002d 97            	ld	xl,a
 302  002e a604          	ld	a,#4
 303  0030 1b01          	add	a,(OFST+1,sp)
 304  0032 2401          	jrnc	L02
 305  0034 5c            	incw	x
 306  0035               L02:
 307  0035 c70002        	ld	_indiIOUartSendWait+1,a
 308  0038 9f            	ld	a,xl
 309  0039 c70001        	ld	_indiIOUartSendWait,a
 310                     ; 100 }
 313  003c 84            	pop	a
 314  003d 81            	ret	
 341                     ; 102 void	iouart_Pkt_Start(void)
 341                     ; 103 {
 342                     	switch	.text
 343  003e               _iouart_Pkt_Start:
 347                     ; 104 	indiIOUartIdle = 1;	//	Busy
 349  003e 35010004      	mov	_indiIOUartIdle,#1
 350                     ; 105 	rcStatus = 1;
 352  0042 35010007      	mov	_rcStatus,#1
 353                     ; 106 	indiIOUartSendReady = 0;
 355  0046 725f0003      	clr	_indiIOUartSendReady
 356                     ; 107 	IOUART(DISABLE);
 358  004a 4f            	clr	a
 360                     ; 108 }
 363  004b cc0000        	jp	_timer2Cntl
 404                     ; 110 uint8_t	iouart_Write(void)
 404                     ; 111 {
 405                     	switch	.text
 406  004e               _iouart_Write:
 408  004e 88            	push	a
 409       00000001      OFST:	set	1
 412                     ; 113 	if( rci1 != 0 )
 414  004f 725d0005      	tnz	_rci1
 415  0053 270a          	jreq	L311
 416                     ; 115 		rci1 -= 1;
 418  0055 725a0005      	dec	_rci1
 419                     ; 116 		D_IOUART_LOW;
 421  0059 72115019      	bres	20505,#0
 423  005d 206b          	jra	L511
 424  005f               L311:
 425                     ; 120 		if( rcStatus == 0 )
 427  005f 725d0007      	tnz	_rcStatus
 428  0063 2609          	jrne	L711
 429                     ; 123 			D_IOUART_LOW;
 431  0065 72115019      	bres	20505,#0
 432                     ; 124 			return 1;
 434  0069 a601          	ld	a,#1
 437  006b 5b01          	addw	sp,#1
 438  006d 81            	ret	
 439  006e               L711:
 440                     ; 126 		if( rcStatus <= 21 )
 442  006e c60007        	ld	a,_rcStatus
 443  0071 a116          	cp	a,#22
 444  0073 2412          	jruge	L121
 445                     ; 128 			if( __rcCntl_Start[rcStatus-1] == 1 )
 447  0075 c60007        	ld	a,_rcStatus
 448  0078 5f            	clrw	x
 449  0079 97            	ld	xl,a
 450  007a 5a            	decw	x
 451  007b d60000        	ld	a,(___rcCntl_Start,x)
 452  007e 4a            	dec	a
 453                     ; 130 				D_IOUART_HIGH;
 455  007f 2741          	jreq	LC001
 456                     ; 134 				D_IOUART_LOW;
 458  0081 72115019      	bres	20505,#0
 459  0085 203f          	jra	L721
 460  0087               L121:
 461                     ; 137 		else if( rcStatus <= 85 )	//	21+64
 463  0087 c60007        	ld	a,_rcStatus
 464  008a a156          	cp	a,#86
 465  008c 242d          	jruge	L131
 466                     ; 139 			t = rcIOUartTxBuffer[(uint8_t)(rci2>>3)];
 468  008e c60006        	ld	a,_rci2
 469  0091 44            	srl	a
 470  0092 44            	srl	a
 471  0093 44            	srl	a
 472  0094 5f            	clrw	x
 473  0095 97            	ld	xl,a
 474  0096 d60008        	ld	a,(_rcIOUartTxBuffer,x)
 475  0099 6b01          	ld	(OFST+0,sp),a
 476                     ; 140 			t = (uint8_t)(t & __iBitTable[(uint8_t)(rci2&0x07)]);
 478  009b c60006        	ld	a,_rci2
 479  009e a407          	and	a,#7
 480  00a0 5f            	clrw	x
 481  00a1 97            	ld	xl,a
 482  00a2 7b01          	ld	a,(OFST+0,sp)
 483  00a4 d40017        	and	a,(___iBitTable,x)
 484                     ; 141 			if( t != 0 )
 486  00a7 2702          	jreq	L331
 487                     ; 142 				t = 1;
 489  00a9 a601          	ld	a,#1
 490  00ab               L331:
 491  00ab 6b01          	ld	(OFST+0,sp),a
 492                     ; 143 			rci1 = __rcCntl_Port[t];
 494  00ad 5f            	clrw	x
 495  00ae 97            	ld	xl,a
 496  00af d60015        	ld	a,(___rcCntl_Port,x)
 497  00b2 c70005        	ld	_rci1,a
 498                     ; 144 			rci2 += 1;
 500  00b5 725c0006      	inc	_rci2
 501                     ; 145 			D_IOUART_HIGH;
 503  00b9 2007          	jp	LC001
 504  00bb               L131:
 505                     ; 147 		else if( rcStatus <= 87 )	//	(21+64)+2
 507  00bb c60007        	ld	a,_rcStatus
 508  00be a158          	cp	a,#88
 509  00c0 240c          	jruge	L731
 510                     ; 149 			D_IOUART_HIGH;
 512  00c2               LC001:
 515  00c2 72105019      	bset	20505,#0
 517  00c6               L721:
 518                     ; 161 		rcStatus += 1;
 520  00c6 725c0007      	inc	_rcStatus
 521  00ca               L511:
 522                     ; 163 	return 0;
 524  00ca 4f            	clr	a
 527  00cb 5b01          	addw	sp,#1
 528  00cd 81            	ret	
 529  00ce               L731:
 530                     ; 153 			D_IOUART_LOW;
 532  00ce 72115019      	bres	20505,#0
 533                     ; 154 			rcStatus = 0;
 535  00d2 725f0007      	clr	_rcStatus
 536                     ; 155 			rci1 = 0;
 538  00d6 725f0005      	clr	_rci1
 539                     ; 156 			rci2 = 0;
 541  00da 725f0006      	clr	_rci2
 542                     ; 157 			indiIOUartIdle = 0;	//	Not Busy
 544  00de 725f0004      	clr	_indiIOUartIdle
 545                     ; 158 			IOUART(ENABLE);
 547  00e2 a601          	ld	a,#1
 548  00e4 cd0000        	call	_timer2Cntl
 550                     ; 159 			return 2;
 552  00e7 a602          	ld	a,#2
 555  00e9 5b01          	addw	sp,#1
 556  00eb 81            	ret	
 559                     	switch	.data
 560  000b               __is:
 561  000b 00            	dc.b	0
 606                     ; 200 uint8_t		iouart_Ready(void)
 606                     ; 201 {	
 607                     	switch	.text
 608  00ec               _iouart_Ready:
 610  00ec 89            	pushw	x
 611       00000002      OFST:	set	2
 614                     ; 205 	cs = _io_tail;
 616  00ed c60000        	ld	a,__io_tail
 617  00f0 6b01          	ld	(OFST-1,sp),a
 618                     ; 206 	i = (_io_buf[_io_tail]+1)/2;
 620  00f2 5f            	clrw	x
 621  00f3 97            	ld	xl,a
 622  00f4 d60000        	ld	a,(__io_buf,x)
 623  00f7 5f            	clrw	x
 624  00f8 97            	ld	xl,a
 625  00f9 5c            	incw	x
 626  00fa a602          	ld	a,#2
 627  00fc cd0000        	call	c_sdivx
 629  00ff 01            	rrwa	x,a
 630  0100 6b02          	ld	(OFST+0,sp),a
 631                     ; 207 	_io_tail += 1;
 633  0102 725c0000      	inc	__io_tail
 634                     ; 208 	if( _io_tail == _IO_BUF_SIZE )
 636  0106 c60000        	ld	a,__io_tail
 637  0109 a130          	cp	a,#48
 638  010b 2604          	jrne	L161
 639                     ; 209 		_io_tail = 0;
 641  010d 725f0000      	clr	__io_tail
 642  0111               L161:
 643                     ; 213 	if( _is == 0 )
 645  0111 725d000b      	tnz	__is
 646  0115 261c          	jrne	L361
 647                     ; 215 		iBit = 0;
 649  0117 725f0008      	clr	_iBit
 650                     ; 216 		iByte = 0;
 652  011b 725f0009      	clr	_iByte
 653                     ; 217 		iData = 0;
 655  011f 725f000a      	clr	_iData
 656                     ; 218 		if( i == 12 )
 658  0123 7b02          	ld	a,(OFST+0,sp)
 659  0125 a10c          	cp	a,#12
 660  0127 2703cc01c6    	jrne	L761
 661                     ; 219 			_is = 1;
 663  012c 3501000b      	mov	__is,#1
 664  0130 cc01c6        	jra	L761
 665  0133               L361:
 666                     ; 221 	else if( _is == 1 )
 668  0133 c6000b        	ld	a,__is
 669  0136 4a            	dec	a
 670  0137 2620          	jrne	L171
 671                     ; 223 		_io_buf[cs] = 0;
 673  0139 7b01          	ld	a,(OFST-1,sp)
 674  013b 5f            	clrw	x
 675  013c 97            	ld	xl,a
 676  013d 724f0000      	clr	(__io_buf,x)
 677                     ; 224 		_is = i == 8 || i == 9 || i == 10? 2 : 0;
 679  0141 7b02          	ld	a,(OFST+0,sp)
 680  0143 a108          	cp	a,#8
 681  0145 2708          	jreq	L63
 682  0147 a109          	cp	a,#9
 683  0149 2704          	jreq	L63
 684  014b a10a          	cp	a,#10
 685  014d 2604          	jrne	L43
 686  014f               L63:
 687  014f a602          	ld	a,#2
 688  0151 2001          	jra	L04
 689  0153               L43:
 690  0153 4f            	clr	a
 691  0154               L04:
 692  0154 c7000b        	ld	__is,a
 694  0157 206d          	jra	L761
 695  0159               L171:
 696                     ; 226 	else if( _is == 2 )
 698  0159 c6000b        	ld	a,__is
 699  015c a102          	cp	a,#2
 700  015e 2666          	jrne	L761
 701                     ; 228 		if( i > 5 )
 703  0160 7b02          	ld	a,(OFST+0,sp)
 704  0162 a106          	cp	a,#6
 705  0164 250e          	jrult	L771
 706                     ; 229 			iData |= __iBitTable[iBit];
 708  0166 c60008        	ld	a,_iBit
 709  0169 5f            	clrw	x
 710  016a 97            	ld	xl,a
 711  016b c6000a        	ld	a,_iData
 712  016e da0017        	or	a,(___iBitTable,x)
 713  0171 c7000a        	ld	_iData,a
 714  0174               L771:
 715                     ; 231 		iBit++;
 717  0174 725c0008      	inc	_iBit
 718                     ; 232 		if( iBit == 8 )
 720  0178 c60008        	ld	a,_iBit
 721  017b a108          	cp	a,#8
 722  017d 2647          	jrne	L761
 723                     ; 234 			iBit = 0;
 725  017f 725f0008      	clr	_iBit
 726                     ; 235 			iBuf[iByte++] = iData;
 728  0183 c60009        	ld	a,_iByte
 729  0186 725c0009      	inc	_iByte
 730  018a 5f            	clrw	x
 731  018b 97            	ld	xl,a
 732  018c c6000a        	ld	a,_iData
 733  018f d70000        	ld	(_iBuf,x),a
 734                     ; 236 			if( iByte == 8 )
 736  0192 c60009        	ld	a,_iByte
 737  0195 a108          	cp	a,#8
 738  0197 2629          	jrne	L302
 739                     ; 238 				_is = 0;
 741  0199 725f000b      	clr	__is
 742                     ; 239 				cs = 0;
 744  019d 0f01          	clr	(OFST-1,sp)
 745                     ; 240 				for( i=0; i<7; i++ )
 747  019f 4f            	clr	a
 748  01a0 6b02          	ld	(OFST+0,sp),a
 749  01a2               L502:
 750                     ; 241 					cs += iBuf[i];
 752  01a2 5f            	clrw	x
 753  01a3 97            	ld	xl,a
 754  01a4 7b01          	ld	a,(OFST-1,sp)
 755  01a6 db0000        	add	a,(_iBuf,x)
 756  01a9 6b01          	ld	(OFST-1,sp),a
 757                     ; 240 				for( i=0; i<7; i++ )
 759  01ab 0c02          	inc	(OFST+0,sp)
 762  01ad 7b02          	ld	a,(OFST+0,sp)
 763  01af a107          	cp	a,#7
 764  01b1 25ef          	jrult	L502
 765                     ; 243 				if( cs != iData )
 767  01b3 7b01          	ld	a,(OFST-1,sp)
 768  01b5 c1000a        	cp	a,_iData
 769  01b8 2704          	jreq	L312
 770                     ; 244 					return 2;
 772  01ba a602          	ld	a,#2
 774  01bc 2002          	jra	L24
 775  01be               L312:
 776                     ; 245 				return 1;
 778  01be a601          	ld	a,#1
 780  01c0               L24:
 782  01c0 85            	popw	x
 783  01c1 81            	ret	
 784  01c2               L302:
 785                     ; 247 			iData = 0;
 787  01c2 725f000a      	clr	_iData
 788  01c6               L761:
 789                     ; 250 	return 0;
 791  01c6 4f            	clr	a
 793  01c7 20f7          	jra	L24
 963                     	xdef	__is
 964                     	switch	.bss
 965  0000               _iBuf:
 966  0000 000000000000  	ds.b	8
 967                     	xdef	_iBuf
 968                     	xdef	_iData
 969                     	xdef	_iByte
 970                     	xdef	_iBit
 971                     	xdef	___iBitTable
 972                     	xdef	___rcCntl_Port
 973                     	xdef	___rcCntl_Start
 974                     	xdef	_rcStatus
 975                     	xdef	_rci2
 976                     	xdef	_rci1
 977  0008               _rcIOUartTxBuffer:
 978  0008 000000000000  	ds.b	8
 979                     	xdef	_rcIOUartTxBuffer
 980  0010               _pktIOUartWriteBuffer:
 981  0010 000000000000  	ds.b	8
 982                     	xdef	_pktIOUartWriteBuffer
 983                     	xdef	_indiIOUartSendReady
 984                     	xdef	_iouart_getReadBuffer
 985                     	xdef	_iouart_getBuffer
 986                     	xdef	_iouart_Ready
 987                     	xref	__io_buf
 988                     	xref	__io_tail
 989                     	xdef	_iouart_Write
 990                     	xdef	_iouart_Pkt_Start
 991                     	xdef	_iouart_Set_Packet
 992                     	xdef	_iouart_Get_WriteEnable
 993                     	xdef	_iouart_Open
 994                     	xref	_timer2Cntl
 995                     	xdef	_indiIOUartIdle
 996                     	xdef	_indiIOUartSendWait
 997                     	xdef	_indiIOUartWrite
 998                     	xref	_GPIO_Init
 999                     	xref.b	c_x
1019                     	xref	c_sdivx
1020                     	end
