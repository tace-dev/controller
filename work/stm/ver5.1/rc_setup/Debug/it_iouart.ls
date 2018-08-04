   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  19                     	switch	.data
  20  0000               _indiIOUartWrite:
  21  0000 00            	dc.b	0
  22  0001               _indiIOUartSendWait:
  23  0001 0000          	dc.w	0
  24  0003               _indiIOUartSendReady:
  25  0003 00            	dc.b	0
  26  0004               _indiIOUartIdle:
  27  0004 01            	dc.b	1
  28  0005               _rci1:
  29  0005 00            	dc.b	0
  30  0006               _rci2:
  31  0006 00            	dc.b	0
  32  0007               _rcStatus:
  33  0007 00            	dc.b	0
  34                     .const:	section	.text
  35  0000               ___rcCntl_Start:
  36  0000 01            	dc.b	1
  37  0001 01            	dc.b	1
  38  0002 00            	dc.b	0
  39  0003 00            	dc.b	0
  40  0004 00            	dc.b	0
  41  0005 00            	dc.b	0
  42  0006 00            	dc.b	0
  43  0007 00            	dc.b	0
  44  0008 00            	dc.b	0
  45  0009 00            	dc.b	0
  46  000a 00            	dc.b	0
  47  000b 00            	dc.b	0
  48  000c 01            	dc.b	1
  49  000d 01            	dc.b	1
  50  000e 00            	dc.b	0
  51  000f 00            	dc.b	0
  52  0010 00            	dc.b	0
  53  0011 00            	dc.b	0
  54  0012 00            	dc.b	0
  55  0013 00            	dc.b	0
  56  0014 00            	dc.b	0
  57  0015               ___rcCntl_Port:
  58  0015 03            	dc.b	3
  59  0016 05            	dc.b	5
  60  0017               ___iBitTable:
  61  0017 80            	dc.b	128
  62  0018 40            	dc.b	64
  63  0019 20            	dc.b	32
  64  001a 10            	dc.b	16
  65  001b 08            	dc.b	8
  66  001c 04            	dc.b	4
  67  001d 02            	dc.b	2
  68  001e 01            	dc.b	1
  69                     	switch	.data
  70  0008               _iBit:
  71  0008 00            	dc.b	0
  72  0009               _iByte:
  73  0009 00            	dc.b	0
  74  000a               _iData:
  75  000a 00            	dc.b	0
 105                     ; 44 void	iouart_Open(void)
 105                     ; 45 {
 107                     .text:	section	.text,new
 108  0000               _iouart_Open:
 112                     ; 46 	GPIO_Init(D_IOUART_TX_PORT, D_IOUART_TX_PIN, D_IO_OUT_TRIGER);
 114  0000 4be0          	push	#224
 115  0002 4b01          	push	#1
 116  0004 ae5019        	ldw	x,#20505
 117  0007 cd0000        	call	_GPIO_Init
 119  000a 85            	popw	x
 120                     ; 74 }
 123  000b 81            	ret
 148                     ; 76 uint8_t	*iouart_getBuffer(void)
 148                     ; 77 {
 149                     .text:	section	.text,new
 150  0000               _iouart_getBuffer:
 154                     ; 78 	return rcIOUartTxBuffer;
 156  0000 ae0008        	ldw	x,#_rcIOUartTxBuffer
 159  0003 81            	ret
 185                     ; 81 uint8_t	*iouart_getReadBuffer(void)
 185                     ; 82 {
 186                     .text:	section	.text,new
 187  0000               _iouart_getReadBuffer:
 191                     ; 83 	return iBuf;
 193  0000 ae0000        	ldw	x,#_iBuf
 196  0003 81            	ret
 230                     ; 96 void	iouart_Set_Packet(uint8_t wait)
 230                     ; 97 {
 231                     .text:	section	.text,new
 232  0000               _iouart_Set_Packet:
 234  0000 88            	push	a
 235       00000000      OFST:	set	0
 238                     ; 98 	indiIOUartSendReady = 1;
 240  0001 35010003      	mov	_indiIOUartSendReady,#1
 241                     ; 100 	indiIOUartSendWait = wait + 540; // 60ms
 243  0005 a602          	ld	a,#2
 244  0007 97            	ld	xl,a
 245  0008 a61c          	ld	a,#28
 246  000a 1b01          	add	a,(OFST+1,sp)
 247  000c 2401          	jrnc	L41
 248  000e 5c            	incw	x
 249  000f               L41:
 250  000f c70002        	ld	_indiIOUartSendWait+1,a
 251  0012 9f            	ld	a,xl
 252  0013 c70001        	ld	_indiIOUartSendWait,a
 253                     ; 106 }
 256  0016 84            	pop	a
 257  0017 81            	ret
 284                     ; 108 void	iouart_Pkt_Start(void)
 284                     ; 109 {
 285                     .text:	section	.text,new
 286  0000               _iouart_Pkt_Start:
 290                     ; 110 	indiIOUartIdle = 1;	//	Busy
 292  0000 35010004      	mov	_indiIOUartIdle,#1
 293                     ; 111 	rcStatus = 1;
 295  0004 35010007      	mov	_rcStatus,#1
 296                     ; 112 	indiIOUartSendReady = 0;
 298  0008 725f0003      	clr	_indiIOUartSendReady
 299                     ; 113 	IOUART(DISABLE);
 301  000c 4f            	clr	a
 302  000d cd0000        	call	_timer2Cntl
 304                     ; 114 }
 307  0010 81            	ret
 310                     	switch	.data
 311  000b               __iouart_50ms_high:
 312  000b 00            	dc.b	0
 334                     ; 118 void	_iouart_50ms(void)
 334                     ; 119 {
 335                     .text:	section	.text,new
 336  0000               __iouart_50ms:
 340                     ; 121 	if( _iouart_50ms_high == 1 )
 342  0000 c6000b        	ld	a,__iouart_50ms_high
 343  0003 a101          	cp	a,#1
 344  0005 2608          	jrne	L57
 345                     ; 123 		_iouart_50ms_high = 0;
 347  0007 725f000b      	clr	__iouart_50ms_high
 348                     ; 124 		D_IOUART_LOW;
 350  000b 72115019      	bres	20505,#0
 351  000f               L57:
 352                     ; 127 }
 355  000f 81            	ret
 397                     ; 129 uint8_t	iouart_Write(void)
 397                     ; 130 {
 398                     .text:	section	.text,new
 399  0000               _iouart_Write:
 401  0000 88            	push	a
 402       00000001      OFST:	set	1
 405                     ; 132 	if( rci1 != 0 )
 407  0001 725d0005      	tnz	_rci1
 408  0005 270b          	jreq	L311
 409                     ; 134 		rci1 -= 1;
 411  0007 725a0005      	dec	_rci1
 412                     ; 135 		D_IOUART_LOW;
 414  000b 72115019      	bres	20505,#0
 416  000f cc009a        	jra	L511
 417  0012               L311:
 418                     ; 139 		if( rcStatus == 0 )
 420  0012 725d0007      	tnz	_rcStatus
 421  0016 2609          	jrne	L711
 422                     ; 142 			D_IOUART_LOW;
 424  0018 72115019      	bres	20505,#0
 425                     ; 143 			return 1;
 427  001c a601          	ld	a,#1
 430  001e 5b01          	addw	sp,#1
 431  0020 81            	ret
 432  0021               L711:
 433                     ; 145 		if( rcStatus <= 21 )
 435  0021 c60007        	ld	a,_rcStatus
 436  0024 a116          	cp	a,#22
 437  0026 241d          	jruge	L121
 438                     ; 147 			if( __rcCntl_Start[rcStatus-1] == 1 )
 440  0028 c60007        	ld	a,_rcStatus
 441  002b 5f            	clrw	x
 442  002c 97            	ld	xl,a
 443  002d 5a            	decw	x
 444  002e d60000        	ld	a,(___rcCntl_Start,x)
 445  0031 a101          	cp	a,#1
 446  0033 260a          	jrne	L321
 447                     ; 149 				_iouart_50ms_high = 1;
 449  0035 3501000b      	mov	__iouart_50ms_high,#1
 450                     ; 150 				D_IOUART_HIGH;
 452  0039 72105019      	bset	20505,#0
 454  003d 2057          	jra	L721
 455  003f               L321:
 456                     ; 154 				D_IOUART_LOW;
 458  003f 72115019      	bres	20505,#0
 459  0043 2051          	jra	L721
 460  0045               L121:
 461                     ; 157 		else if( rcStatus <= 85 )	//	21+64
 463  0045 c60007        	ld	a,_rcStatus
 464  0048 a156          	cp	a,#86
 465  004a 243b          	jruge	L131
 466                     ; 159 			t = rcIOUartTxBuffer[(uint8_t)(rci2>>3)];
 468  004c c60006        	ld	a,_rci2
 469  004f 44            	srl	a
 470  0050 44            	srl	a
 471  0051 44            	srl	a
 472  0052 5f            	clrw	x
 473  0053 97            	ld	xl,a
 474  0054 d60008        	ld	a,(_rcIOUartTxBuffer,x)
 475  0057 6b01          	ld	(OFST+0,sp),a
 476                     ; 160 			t = (uint8_t)(t & __iBitTable[(uint8_t)(rci2&0x07)]);
 478  0059 c60006        	ld	a,_rci2
 479  005c a407          	and	a,#7
 480  005e 5f            	clrw	x
 481  005f 97            	ld	xl,a
 482  0060 7b01          	ld	a,(OFST+0,sp)
 483  0062 d40017        	and	a,(___iBitTable,x)
 484  0065 6b01          	ld	(OFST+0,sp),a
 485                     ; 161 			if( t != 0 )
 487  0067 0d01          	tnz	(OFST+0,sp)
 488  0069 2704          	jreq	L331
 489                     ; 162 				t = 1;
 491  006b a601          	ld	a,#1
 492  006d 6b01          	ld	(OFST+0,sp),a
 493  006f               L331:
 494                     ; 163 			rci1 = __rcCntl_Port[t];
 496  006f 7b01          	ld	a,(OFST+0,sp)
 497  0071 5f            	clrw	x
 498  0072 97            	ld	xl,a
 499  0073 d60015        	ld	a,(___rcCntl_Port,x)
 500  0076 c70005        	ld	_rci1,a
 501                     ; 164 			rci2 += 1;
 503  0079 725c0006      	inc	_rci2
 504                     ; 165 			_iouart_50ms_high = 1;
 506  007d 3501000b      	mov	__iouart_50ms_high,#1
 507                     ; 166 			D_IOUART_HIGH;
 509  0081 72105019      	bset	20505,#0
 511  0085 200f          	jra	L721
 512  0087               L131:
 513                     ; 168 		else if( rcStatus <= 87 )	//	(21+64)+2
 515  0087 c60007        	ld	a,_rcStatus
 516  008a a158          	cp	a,#88
 517  008c 2410          	jruge	L731
 518                     ; 170 			_iouart_50ms_high = 1;
 520  008e 3501000b      	mov	__iouart_50ms_high,#1
 521                     ; 171 			D_IOUART_HIGH;
 523  0092 72105019      	bset	20505,#0
 525  0096               L721:
 526                     ; 183 		rcStatus += 1;
 528  0096 725c0007      	inc	_rcStatus
 529  009a               L511:
 530                     ; 185 	return 0;
 532  009a 4f            	clr	a
 535  009b 5b01          	addw	sp,#1
 536  009d 81            	ret
 537  009e               L731:
 538                     ; 175 			D_IOUART_LOW;
 540  009e 72115019      	bres	20505,#0
 541                     ; 176 			rcStatus = 0;
 543  00a2 725f0007      	clr	_rcStatus
 544                     ; 177 			rci1 = 0;
 546  00a6 725f0005      	clr	_rci1
 547                     ; 178 			rci2 = 0;
 549  00aa 725f0006      	clr	_rci2
 550                     ; 179 			indiIOUartIdle = 0;	//	Not Busy
 552  00ae 725f0004      	clr	_indiIOUartIdle
 553                     ; 180 			IOUART(ENABLE);
 555  00b2 a601          	ld	a,#1
 556  00b4 cd0000        	call	_timer2Cntl
 558                     ; 181 			return 2;
 560  00b7 a602          	ld	a,#2
 563  00b9 5b01          	addw	sp,#1
 564  00bb 81            	ret
 567                     	switch	.data
 568  000c               __is:
 569  000c 00            	dc.b	0
 614                     ; 190 uint8_t		iouart_Ready(void)
 614                     ; 191 {	
 615                     .text:	section	.text,new
 616  0000               _iouart_Ready:
 618  0000 89            	pushw	x
 619       00000002      OFST:	set	2
 622                     ; 195 	cs = _io_tail;
 624  0001 c60000        	ld	a,__io_tail
 625  0004 6b01          	ld	(OFST-1,sp),a
 626                     ; 196 	i = (_io_buf[_io_tail]+1)/2;
 628  0006 c60000        	ld	a,__io_tail
 629  0009 5f            	clrw	x
 630  000a 97            	ld	xl,a
 631  000b d60000        	ld	a,(__io_buf,x)
 632  000e 5f            	clrw	x
 633  000f 97            	ld	xl,a
 634  0010 5c            	incw	x
 635  0011 a602          	ld	a,#2
 636  0013 cd0000        	call	c_sdivx
 638  0016 01            	rrwa	x,a
 639  0017 6b02          	ld	(OFST+0,sp),a
 640  0019 02            	rlwa	x,a
 641                     ; 197 	_io_tail += 1;
 643  001a 725c0000      	inc	__io_tail
 644                     ; 198 	if( _io_tail == _IO_BUF_SIZE )
 646  001e c60000        	ld	a,__io_tail
 647  0021 a130          	cp	a,#48
 648  0023 2604          	jrne	L161
 649                     ; 199 		_io_tail = 0;
 651  0025 725f0000      	clr	__io_tail
 652  0029               L161:
 653                     ; 203 	if( _is == 0 )
 655  0029 725d000c      	tnz	__is
 656  002d 261d          	jrne	L361
 657                     ; 205 		iBit = 0;
 659  002f 725f0008      	clr	_iBit
 660                     ; 206 		iByte = 0;
 662  0033 725f0009      	clr	_iByte
 663                     ; 207 		iData = 0;
 665  0037 725f000a      	clr	_iData
 666                     ; 208 		if( i == 12 )
 668  003b 7b02          	ld	a,(OFST+0,sp)
 669  003d a10c          	cp	a,#12
 670  003f 2703          	jreq	L63
 671  0041 cc00e7        	jp	L761
 672  0044               L63:
 673                     ; 209 			_is = 1;
 675  0044 3501000c      	mov	__is,#1
 676  0048 ace700e7      	jpf	L761
 677  004c               L361:
 678                     ; 211 	else if( _is == 1 )
 680  004c c6000c        	ld	a,__is
 681  004f a101          	cp	a,#1
 682  0051 2624          	jrne	L171
 683                     ; 213 		_io_buf[cs] = 0;
 685  0053 7b01          	ld	a,(OFST-1,sp)
 686  0055 5f            	clrw	x
 687  0056 97            	ld	xl,a
 688  0057 724f0000      	clr	(__io_buf,x)
 689                     ; 214 		_is = i == 8 || i == 9 || i == 10? 2 : 0;
 691  005b 7b02          	ld	a,(OFST+0,sp)
 692  005d a108          	cp	a,#8
 693  005f 270c          	jreq	L03
 694  0061 7b02          	ld	a,(OFST+0,sp)
 695  0063 a109          	cp	a,#9
 696  0065 2706          	jreq	L03
 697  0067 7b02          	ld	a,(OFST+0,sp)
 698  0069 a10a          	cp	a,#10
 699  006b 2604          	jrne	L62
 700  006d               L03:
 701  006d a602          	ld	a,#2
 702  006f 2001          	jra	L23
 703  0071               L62:
 704  0071 4f            	clr	a
 705  0072               L23:
 706  0072 c7000c        	ld	__is,a
 708  0075 2070          	jra	L761
 709  0077               L171:
 710                     ; 216 	else if( _is == 2 )
 712  0077 c6000c        	ld	a,__is
 713  007a a102          	cp	a,#2
 714  007c 2669          	jrne	L761
 715                     ; 218 		if( i > 5 )
 717  007e 7b02          	ld	a,(OFST+0,sp)
 718  0080 a106          	cp	a,#6
 719  0082 250e          	jrult	L771
 720                     ; 219 			iData |= __iBitTable[iBit];
 722  0084 c60008        	ld	a,_iBit
 723  0087 5f            	clrw	x
 724  0088 97            	ld	xl,a
 725  0089 c6000a        	ld	a,_iData
 726  008c da0017        	or	a,(___iBitTable,x)
 727  008f c7000a        	ld	_iData,a
 728  0092               L771:
 729                     ; 221 		iBit++;
 731  0092 725c0008      	inc	_iBit
 732                     ; 222 		if( iBit == 8 )
 734  0096 c60008        	ld	a,_iBit
 735  0099 a108          	cp	a,#8
 736  009b 264a          	jrne	L761
 737                     ; 224 			iBit = 0;
 739  009d 725f0008      	clr	_iBit
 740                     ; 225 			iBuf[iByte++] = iData;
 742  00a1 c60009        	ld	a,_iByte
 743  00a4 97            	ld	xl,a
 744  00a5 725c0009      	inc	_iByte
 745  00a9 9f            	ld	a,xl
 746  00aa 5f            	clrw	x
 747  00ab 97            	ld	xl,a
 748  00ac c6000a        	ld	a,_iData
 749  00af d70000        	ld	(_iBuf,x),a
 750                     ; 226 			if( iByte == 8 )
 752  00b2 c60009        	ld	a,_iByte
 753  00b5 a108          	cp	a,#8
 754  00b7 262a          	jrne	L302
 755                     ; 228 				_is = 0;
 757  00b9 725f000c      	clr	__is
 758                     ; 229 				cs = 0;
 760  00bd 0f01          	clr	(OFST-1,sp)
 761                     ; 230 				for( i=0; i<7; i++ )
 763  00bf 0f02          	clr	(OFST+0,sp)
 764  00c1               L502:
 765                     ; 231 					cs += iBuf[i];
 767  00c1 7b02          	ld	a,(OFST+0,sp)
 768  00c3 5f            	clrw	x
 769  00c4 97            	ld	xl,a
 770  00c5 7b01          	ld	a,(OFST-1,sp)
 771  00c7 db0000        	add	a,(_iBuf,x)
 772  00ca 6b01          	ld	(OFST-1,sp),a
 773                     ; 230 				for( i=0; i<7; i++ )
 775  00cc 0c02          	inc	(OFST+0,sp)
 778  00ce 7b02          	ld	a,(OFST+0,sp)
 779  00d0 a107          	cp	a,#7
 780  00d2 25ed          	jrult	L502
 781                     ; 233 				if( cs != iData )
 783  00d4 7b01          	ld	a,(OFST-1,sp)
 784  00d6 c1000a        	cp	a,_iData
 785  00d9 2704          	jreq	L312
 786                     ; 234 					return 2;
 788  00db a602          	ld	a,#2
 790  00dd 2002          	jra	L43
 791  00df               L312:
 792                     ; 235 				return 1;
 794  00df a601          	ld	a,#1
 796  00e1               L43:
 798  00e1 85            	popw	x
 799  00e2 81            	ret
 800  00e3               L302:
 801                     ; 237 			iData = 0;
 803  00e3 725f000a      	clr	_iData
 804  00e7               L761:
 805                     ; 240 	return 0;
 807  00e7 4f            	clr	a
 809  00e8 20f7          	jra	L43
 986                     	xdef	__is
 987                     	xdef	__iouart_50ms
 988                     	xdef	__iouart_50ms_high
 989                     	switch	.bss
 990  0000               _iBuf:
 991  0000 000000000000  	ds.b	8
 992                     	xdef	_iBuf
 993                     	xdef	_iData
 994                     	xdef	_iByte
 995                     	xdef	_iBit
 996                     	xdef	___iBitTable
 997                     	xdef	___rcCntl_Port
 998                     	xdef	___rcCntl_Start
 999                     	xdef	_rcStatus
1000                     	xdef	_rci2
1001                     	xdef	_rci1
1002  0008               _rcIOUartTxBuffer:
1003  0008 000000000000  	ds.b	8
1004                     	xdef	_rcIOUartTxBuffer
1005  0010               _pktIOUartWriteBuffer:
1006  0010 000000000000  	ds.b	8
1007                     	xdef	_pktIOUartWriteBuffer
1008                     	xdef	_indiIOUartSendReady
1009                     	xdef	_iouart_getReadBuffer
1010                     	xdef	_iouart_getBuffer
1011                     	xdef	_iouart_Ready
1012                     	xref	__io_buf
1013                     	xref	__io_tail
1014                     	xdef	_iouart_Write
1015                     	xdef	_iouart_Pkt_Start
1016                     	xdef	_iouart_Set_Packet
1017                     	xdef	_iouart_Open
1018                     	xref	_timer2Cntl
1019                     	xdef	_indiIOUartIdle
1020                     	xdef	_indiIOUartSendWait
1021                     	xdef	_indiIOUartWrite
1022                     	xref	_GPIO_Init
1023                     	xref.b	c_x
1043                     	xref	c_sdivx
1044                     	end
