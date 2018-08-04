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
 232                     ; 96 void	iouart_Set_Packet(uint8_t wait)
 232                     ; 97 {
 233                     	switch	.text
 234  0014               _iouart_Set_Packet:
 236  0014 88            	push	a
 237       00000000      OFST:	set	0
 240                     ; 98 	indiIOUartSendReady = 1;
 242  0015 35010003      	mov	_indiIOUartSendReady,#1
 243                     ; 100 	indiIOUartSendWait = wait + 540; // 60ms
 245  0019 a602          	ld	a,#2
 246  001b 97            	ld	xl,a
 247  001c a61c          	ld	a,#28
 248  001e 1b01          	add	a,(OFST+1,sp)
 249  0020 2401          	jrnc	L61
 250  0022 5c            	incw	x
 251  0023               L61:
 252  0023 c70002        	ld	_indiIOUartSendWait+1,a
 253  0026 9f            	ld	a,xl
 254  0027 c70001        	ld	_indiIOUartSendWait,a
 255                     ; 106 }
 258  002a 84            	pop	a
 259  002b 81            	ret	
 286                     ; 108 void	iouart_Pkt_Start(void)
 286                     ; 109 {
 287                     	switch	.text
 288  002c               _iouart_Pkt_Start:
 292                     ; 110 	indiIOUartIdle = 1;	//	Busy
 294  002c 35010004      	mov	_indiIOUartIdle,#1
 295                     ; 111 	rcStatus = 1;
 297  0030 35010007      	mov	_rcStatus,#1
 298                     ; 112 	indiIOUartSendReady = 0;
 300  0034 725f0003      	clr	_indiIOUartSendReady
 301                     ; 113 	IOUART(DISABLE);
 303  0038 4f            	clr	a
 305                     ; 114 }
 308  0039 cc0000        	jp	_timer2Cntl
 311                     	switch	.data
 312  000b               __iouart_50ms_high:
 313  000b 00            	dc.b	0
 335                     ; 118 void	_iouart_50ms(void)
 335                     ; 119 {
 336                     	switch	.text
 337  003c               __iouart_50ms:
 341                     ; 121 	if( _iouart_50ms_high == 1 )
 343  003c c6000b        	ld	a,__iouart_50ms_high
 344  003f 4a            	dec	a
 345  0040 2607          	jrne	L57
 346                     ; 123 		_iouart_50ms_high = 0;
 348  0042 c7000b        	ld	__iouart_50ms_high,a
 349                     ; 124 		D_IOUART_LOW;
 351  0045 72115019      	bres	20505,#0
 352  0049               L57:
 353                     ; 127 }
 356  0049 81            	ret	
 398                     ; 129 uint8_t	iouart_Write(void)
 398                     ; 130 {
 399                     	switch	.text
 400  004a               _iouart_Write:
 402  004a 88            	push	a
 403       00000001      OFST:	set	1
 406                     ; 132 	if( rci1 != 0 )
 408  004b 725d0005      	tnz	_rci1
 409  004f 270a          	jreq	L311
 410                     ; 134 		rci1 -= 1;
 412  0051 725a0005      	dec	_rci1
 413                     ; 135 		D_IOUART_LOW;
 415  0055 72115019      	bres	20505,#0
 417  0059 206f          	jra	L511
 418  005b               L311:
 419                     ; 139 		if( rcStatus == 0 )
 421  005b 725d0007      	tnz	_rcStatus
 422  005f 2609          	jrne	L711
 423                     ; 142 			D_IOUART_LOW;
 425  0061 72115019      	bres	20505,#0
 426                     ; 143 			return 1;
 428  0065 a601          	ld	a,#1
 431  0067 5b01          	addw	sp,#1
 432  0069 81            	ret	
 433  006a               L711:
 434                     ; 145 		if( rcStatus <= 21 )
 436  006a c60007        	ld	a,_rcStatus
 437  006d a116          	cp	a,#22
 438  006f 2412          	jruge	L121
 439                     ; 147 			if( __rcCntl_Start[rcStatus-1] == 1 )
 441  0071 c60007        	ld	a,_rcStatus
 442  0074 5f            	clrw	x
 443  0075 97            	ld	xl,a
 444  0076 5a            	decw	x
 445  0077 d60000        	ld	a,(___rcCntl_Start,x)
 446  007a 4a            	dec	a
 447                     ; 149 				_iouart_50ms_high = 1;
 448                     ; 150 				D_IOUART_HIGH;
 450  007b 2741          	jreq	LC001
 451                     ; 154 				D_IOUART_LOW;
 453  007d 72115019      	bres	20505,#0
 454  0081 2043          	jra	L721
 455  0083               L121:
 456                     ; 157 		else if( rcStatus <= 85 )	//	21+64
 458  0083 c60007        	ld	a,_rcStatus
 459  0086 a156          	cp	a,#86
 460  0088 242d          	jruge	L131
 461                     ; 159 			t = rcIOUartTxBuffer[(uint8_t)(rci2>>3)];
 463  008a c60006        	ld	a,_rci2
 464  008d 44            	srl	a
 465  008e 44            	srl	a
 466  008f 44            	srl	a
 467  0090 5f            	clrw	x
 468  0091 97            	ld	xl,a
 469  0092 d60008        	ld	a,(_rcIOUartTxBuffer,x)
 470  0095 6b01          	ld	(OFST+0,sp),a
 471                     ; 160 			t = (uint8_t)(t & __iBitTable[(uint8_t)(rci2&0x07)]);
 473  0097 c60006        	ld	a,_rci2
 474  009a a407          	and	a,#7
 475  009c 5f            	clrw	x
 476  009d 97            	ld	xl,a
 477  009e 7b01          	ld	a,(OFST+0,sp)
 478  00a0 d40017        	and	a,(___iBitTable,x)
 479                     ; 161 			if( t != 0 )
 481  00a3 2702          	jreq	L331
 482                     ; 162 				t = 1;
 484  00a5 a601          	ld	a,#1
 485  00a7               L331:
 486  00a7 6b01          	ld	(OFST+0,sp),a
 487                     ; 163 			rci1 = __rcCntl_Port[t];
 489  00a9 5f            	clrw	x
 490  00aa 97            	ld	xl,a
 491  00ab d60015        	ld	a,(___rcCntl_Port,x)
 492  00ae c70005        	ld	_rci1,a
 493                     ; 164 			rci2 += 1;
 495  00b1 725c0006      	inc	_rci2
 496                     ; 165 			_iouart_50ms_high = 1;
 497                     ; 166 			D_IOUART_HIGH;
 499  00b5 2007          	jp	LC001
 500  00b7               L131:
 501                     ; 168 		else if( rcStatus <= 87 )	//	(21+64)+2
 503  00b7 c60007        	ld	a,_rcStatus
 504  00ba a158          	cp	a,#88
 505  00bc 2410          	jruge	L731
 506                     ; 170 			_iouart_50ms_high = 1;
 508                     ; 171 			D_IOUART_HIGH;
 510  00be               LC001:
 513  00be 3501000b      	mov	__iouart_50ms_high,#1
 516  00c2 72105019      	bset	20505,#0
 518  00c6               L721:
 519                     ; 183 		rcStatus += 1;
 521  00c6 725c0007      	inc	_rcStatus
 522  00ca               L511:
 523                     ; 185 	return 0;
 525  00ca 4f            	clr	a
 528  00cb 5b01          	addw	sp,#1
 529  00cd 81            	ret	
 530  00ce               L731:
 531                     ; 175 			D_IOUART_LOW;
 533  00ce 72115019      	bres	20505,#0
 534                     ; 176 			rcStatus = 0;
 536  00d2 725f0007      	clr	_rcStatus
 537                     ; 177 			rci1 = 0;
 539  00d6 725f0005      	clr	_rci1
 540                     ; 178 			rci2 = 0;
 542  00da 725f0006      	clr	_rci2
 543                     ; 179 			indiIOUartIdle = 0;	//	Not Busy
 545  00de 725f0004      	clr	_indiIOUartIdle
 546                     ; 180 			IOUART(ENABLE);
 548  00e2 a601          	ld	a,#1
 549  00e4 cd0000        	call	_timer2Cntl
 551                     ; 181 			return 2;
 553  00e7 a602          	ld	a,#2
 556  00e9 5b01          	addw	sp,#1
 557  00eb 81            	ret	
 560                     	switch	.data
 561  000c               __is:
 562  000c 00            	dc.b	0
 607                     ; 190 uint8_t		iouart_Ready(void)
 607                     ; 191 {	
 608                     	switch	.text
 609  00ec               _iouart_Ready:
 611  00ec 89            	pushw	x
 612       00000002      OFST:	set	2
 615                     ; 195 	cs = _io_tail;
 617  00ed c60000        	ld	a,__io_tail
 618  00f0 6b01          	ld	(OFST-1,sp),a
 619                     ; 196 	i = (_io_buf[_io_tail]+1)/2;
 621  00f2 5f            	clrw	x
 622  00f3 97            	ld	xl,a
 623  00f4 d60000        	ld	a,(__io_buf,x)
 624  00f7 5f            	clrw	x
 625  00f8 97            	ld	xl,a
 626  00f9 5c            	incw	x
 627  00fa a602          	ld	a,#2
 628  00fc cd0000        	call	c_sdivx
 630  00ff 01            	rrwa	x,a
 631  0100 6b02          	ld	(OFST+0,sp),a
 632                     ; 197 	_io_tail += 1;
 634  0102 725c0000      	inc	__io_tail
 635                     ; 198 	if( _io_tail == _IO_BUF_SIZE )
 637  0106 c60000        	ld	a,__io_tail
 638  0109 a130          	cp	a,#48
 639  010b 2604          	jrne	L161
 640                     ; 199 		_io_tail = 0;
 642  010d 725f0000      	clr	__io_tail
 643  0111               L161:
 644                     ; 203 	if( _is == 0 )
 646  0111 725d000c      	tnz	__is
 647  0115 261c          	jrne	L361
 648                     ; 205 		iBit = 0;
 650  0117 725f0008      	clr	_iBit
 651                     ; 206 		iByte = 0;
 653  011b 725f0009      	clr	_iByte
 654                     ; 207 		iData = 0;
 656  011f 725f000a      	clr	_iData
 657                     ; 208 		if( i == 12 )
 659  0123 7b02          	ld	a,(OFST+0,sp)
 660  0125 a10c          	cp	a,#12
 661  0127 2703cc01c6    	jrne	L761
 662                     ; 209 			_is = 1;
 664  012c 3501000c      	mov	__is,#1
 665  0130 cc01c6        	jra	L761
 666  0133               L361:
 667                     ; 211 	else if( _is == 1 )
 669  0133 c6000c        	ld	a,__is
 670  0136 4a            	dec	a
 671  0137 2620          	jrne	L171
 672                     ; 213 		_io_buf[cs] = 0;
 674  0139 7b01          	ld	a,(OFST-1,sp)
 675  013b 5f            	clrw	x
 676  013c 97            	ld	xl,a
 677  013d 724f0000      	clr	(__io_buf,x)
 678                     ; 214 		_is = i == 8 || i == 9 || i == 10? 2 : 0;
 680  0141 7b02          	ld	a,(OFST+0,sp)
 681  0143 a108          	cp	a,#8
 682  0145 2708          	jreq	L63
 683  0147 a109          	cp	a,#9
 684  0149 2704          	jreq	L63
 685  014b a10a          	cp	a,#10
 686  014d 2604          	jrne	L43
 687  014f               L63:
 688  014f a602          	ld	a,#2
 689  0151 2001          	jra	L04
 690  0153               L43:
 691  0153 4f            	clr	a
 692  0154               L04:
 693  0154 c7000c        	ld	__is,a
 695  0157 206d          	jra	L761
 696  0159               L171:
 697                     ; 216 	else if( _is == 2 )
 699  0159 c6000c        	ld	a,__is
 700  015c a102          	cp	a,#2
 701  015e 2666          	jrne	L761
 702                     ; 218 		if( i > 5 )
 704  0160 7b02          	ld	a,(OFST+0,sp)
 705  0162 a106          	cp	a,#6
 706  0164 250e          	jrult	L771
 707                     ; 219 			iData |= __iBitTable[iBit];
 709  0166 c60008        	ld	a,_iBit
 710  0169 5f            	clrw	x
 711  016a 97            	ld	xl,a
 712  016b c6000a        	ld	a,_iData
 713  016e da0017        	or	a,(___iBitTable,x)
 714  0171 c7000a        	ld	_iData,a
 715  0174               L771:
 716                     ; 221 		iBit++;
 718  0174 725c0008      	inc	_iBit
 719                     ; 222 		if( iBit == 8 )
 721  0178 c60008        	ld	a,_iBit
 722  017b a108          	cp	a,#8
 723  017d 2647          	jrne	L761
 724                     ; 224 			iBit = 0;
 726  017f 725f0008      	clr	_iBit
 727                     ; 225 			iBuf[iByte++] = iData;
 729  0183 c60009        	ld	a,_iByte
 730  0186 725c0009      	inc	_iByte
 731  018a 5f            	clrw	x
 732  018b 97            	ld	xl,a
 733  018c c6000a        	ld	a,_iData
 734  018f d70000        	ld	(_iBuf,x),a
 735                     ; 226 			if( iByte == 8 )
 737  0192 c60009        	ld	a,_iByte
 738  0195 a108          	cp	a,#8
 739  0197 2629          	jrne	L302
 740                     ; 228 				_is = 0;
 742  0199 725f000c      	clr	__is
 743                     ; 229 				cs = 0;
 745  019d 0f01          	clr	(OFST-1,sp)
 746                     ; 230 				for( i=0; i<7; i++ )
 748  019f 4f            	clr	a
 749  01a0 6b02          	ld	(OFST+0,sp),a
 750  01a2               L502:
 751                     ; 231 					cs += iBuf[i];
 753  01a2 5f            	clrw	x
 754  01a3 97            	ld	xl,a
 755  01a4 7b01          	ld	a,(OFST-1,sp)
 756  01a6 db0000        	add	a,(_iBuf,x)
 757  01a9 6b01          	ld	(OFST-1,sp),a
 758                     ; 230 				for( i=0; i<7; i++ )
 760  01ab 0c02          	inc	(OFST+0,sp)
 763  01ad 7b02          	ld	a,(OFST+0,sp)
 764  01af a107          	cp	a,#7
 765  01b1 25ef          	jrult	L502
 766                     ; 233 				if( cs != iData )
 768  01b3 7b01          	ld	a,(OFST-1,sp)
 769  01b5 c1000a        	cp	a,_iData
 770  01b8 2704          	jreq	L312
 771                     ; 234 					return 2;
 773  01ba a602          	ld	a,#2
 775  01bc 2002          	jra	L24
 776  01be               L312:
 777                     ; 235 				return 1;
 779  01be a601          	ld	a,#1
 781  01c0               L24:
 783  01c0 85            	popw	x
 784  01c1 81            	ret	
 785  01c2               L302:
 786                     ; 237 			iData = 0;
 788  01c2 725f000a      	clr	_iData
 789  01c6               L761:
 790                     ; 240 	return 0;
 792  01c6 4f            	clr	a
 794  01c7 20f7          	jra	L24
 971                     	xdef	__is
 972                     	xdef	__iouart_50ms
 973                     	xdef	__iouart_50ms_high
 974                     	switch	.bss
 975  0000               _iBuf:
 976  0000 000000000000  	ds.b	8
 977                     	xdef	_iBuf
 978                     	xdef	_iData
 979                     	xdef	_iByte
 980                     	xdef	_iBit
 981                     	xdef	___iBitTable
 982                     	xdef	___rcCntl_Port
 983                     	xdef	___rcCntl_Start
 984                     	xdef	_rcStatus
 985                     	xdef	_rci2
 986                     	xdef	_rci1
 987  0008               _rcIOUartTxBuffer:
 988  0008 000000000000  	ds.b	8
 989                     	xdef	_rcIOUartTxBuffer
 990  0010               _pktIOUartWriteBuffer:
 991  0010 000000000000  	ds.b	8
 992                     	xdef	_pktIOUartWriteBuffer
 993                     	xdef	_indiIOUartSendReady
 994                     	xdef	_iouart_getReadBuffer
 995                     	xdef	_iouart_getBuffer
 996                     	xdef	_iouart_Ready
 997                     	xref	__io_buf
 998                     	xref	__io_tail
 999                     	xdef	_iouart_Write
1000                     	xdef	_iouart_Pkt_Start
1001                     	xdef	_iouart_Set_Packet
1002                     	xdef	_iouart_Open
1003                     	xref	_timer2Cntl
1004                     	xdef	_indiIOUartIdle
1005                     	xdef	_indiIOUartSendWait
1006                     	xdef	_indiIOUartWrite
1007                     	xref	_GPIO_Init
1008                     	xref.b	c_x
1028                     	xref	c_sdivx
1029                     	end
