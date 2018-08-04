   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  22                     .const:	section	.text
  23  0000               _ver:
  24  0000 686565646f70  	dc.b	"heedop=151026",0
  25                     	switch	.data
  26  0000               _currTemp:
  27  0000 00            	dc.b	0
  28  0001               _ui_error:
  29  0001 00            	dc.b	0
  30  0002               _ui_error_type:
  31  0002 00            	dc.b	0
  32  0003               _rc_type:
  33  0003 00            	dc.b	0
  34  0004               _ui_timeout:
  35  0004 0a            	dc.b	10
  65                     ; 49 uint8_t	getCurrTemp(void)
  65                     ; 50 {
  67                     .text:	section	.text,new
  68  0000               _getCurrTemp:
  72                     ; 51 	return currTemp;
  74  0000 c60000        	ld	a,_currTemp
  77  0003 81            	ret	
 109                     ; 54 uint8_t	_msgLoop(uint8_t mode)
 109                     ; 55 {
 110                     .text:	section	.text,new
 111  0000               __msgLoop:
 115                     ; 56 	return 0;
 117  0000 4f            	clr	a
 120  0001 81            	ret	
 153                     ; 61 uint8_t _call_ptc_woodang(void) {
 154                     .text:	section	.text,new
 155  0000               __call_ptc_woodang:
 159                     ; 62 	rc_ptc_check(iouart_getReadBuffer());
 161  0000 cd0000        	call	_iouart_getReadBuffer
 163  0003 cd0000        	call	_rc_ptc_check
 165                     ; 64 	switch (getState_check()) {
 167  0006 cd0000        	call	_getState_check
 170                     ; 86 			break;
 172  0009 4a            	dec	a
 173  000a 270c          	jreq	L53
 174  000c 4a            	dec	a
 175  000d 2718          	jreq	L73
 176  000f a003          	sub	a,#3
 177  0011 272c          	jreq	L34
 178  0013 4a            	dec	a
 179  0014 2719          	jreq	L14
 180  0016 202a          	jra	L75
 181  0018               L53:
 182                     ; 65 		case RC_STATE_NORMAL:
 182                     ; 66 			if (only_one != 0) {
 184  0018 725d0000      	tnz	_only_one
 185  001c 2701          	jreq	L16
 186                     ; 67 				return;
 189  001e 81            	ret	
 190  001f               L16:
 191                     ; 70 			rc_ptc_make(iouart_getBuffer());
 193  001f cd0000        	call	_iouart_getBuffer
 195  0022 cd0000        	call	_rc_ptc_make
 197                     ; 71 			iouart_Set_Packet(_IO_PACKET_TIMER);
 199                     ; 72 			iouart_Pkt_Start();
 201                     ; 73 			break;
 203  0025 200e          	jp	LC001
 204  0027               L73:
 205                     ; 74 		case RC_STATE_SETTING:
 205                     ; 75 			rc_ptc_make_setting(iouart_getBuffer());
 207  0027 cd0000        	call	_iouart_getBuffer
 209  002a cd0000        	call	_rc_ptc_make_setting
 211                     ; 76 			iouart_Set_Packet(_IO_PACKET_TIMER);
 213                     ; 77 			iouart_Pkt_Start();
 215                     ; 78 			break;
 217  002d 2006          	jp	LC001
 218  002f               L14:
 219                     ; 79 		case RC_STATE_MIRROR:
 219                     ; 80 			rc_ptc_make_mirror(iouart_getBuffer());
 221  002f cd0000        	call	_iouart_getBuffer
 223  0032 cd0000        	call	_rc_ptc_make_mirror
 225                     ; 81 			iouart_Set_Packet(_IO_PACKET_TIMER);
 228                     ; 82 			iouart_Pkt_Start();
 230  0035               LC001:
 233  0035 a6c8          	ld	a,#200
 234  0037 cd0000        	call	_iouart_Set_Packet
 237  003a cd0000        	call	_iouart_Pkt_Start
 239                     ; 83 			break;
 241  003d 2003          	jra	L75
 242  003f               L34:
 243                     ; 84 		case RC_STATE_FACTORY:
 243                     ; 85 			return 3;
 245  003f a603          	ld	a,#3
 248  0041 81            	ret	
 249  0042               L75:
 250                     ; 88 	return 0;
 252  0042 4f            	clr	a
 255  0043 81            	ret	
 278                     ; 91 uint8_t _call_ptc_lse(void) {
 279                     .text:	section	.text,new
 280  0000               __call_ptc_lse:
 284                     ; 103 	return 0;
 286  0000 4f            	clr	a
 289  0001 81            	ret	
 339                     ; 106 uint8_t	_iouartLoop(void)
 339                     ; 107 {
 340                     .text:	section	.text,new
 341  0000               __iouartLoop:
 343  0000 5203          	subw	sp,#3
 344       00000003      OFST:	set	3
 347                     ; 108 	uint8_t	i = 0;
 350  0002 2064          	jra	L511
 351  0004               L311:
 352                     ; 113 		i = iouart_Ready();
 354  0004 cd0000        	call	_iouart_Ready
 356  0007 6b01          	ld	(OFST-2,sp),a
 358                     ; 114 		if( i != 0 )
 360  0009 2705          	jreq	L121
 361                     ; 116 			p = iouart_getReadBuffer();
 363  000b cd0000        	call	_iouart_getReadBuffer
 365  000e 7b01          	ld	a,(OFST-2,sp)
 366  0010               L121:
 367                     ; 123 		if( i == 2 )	
 369  0010 a102          	cp	a,#2
 370  0012 260b          	jrne	L321
 371                     ; 125 			DISP("e", 1);
 373  0014 4b01          	push	#1
 374  0016 ae000e        	ldw	x,#L521
 375  0019 cd0000        	call	_uart1_tx_put
 377  001c 84            	pop	a
 378  001d 7b01          	ld	a,(OFST-2,sp)
 379  001f               L321:
 380                     ; 127 		if( i == 1 )
 382  001f 4a            	dec	a
 383  0020 2646          	jrne	L511
 384                     ; 130 			p = iouart_getReadBuffer();
 386  0022 cd0000        	call	_iouart_getReadBuffer
 388  0025 1f02          	ldw	(OFST-1,sp),x
 390                     ; 134 			if (rc_type == RC_TYPE_NONE) {
 392  0027 c60003        	ld	a,_rc_type
 393  002a 2637          	jrne	L131
 394                     ; 135 				if ((p[0] & 0xF0) == 0x00) 
 396  002c f6            	ld	a,(x)
 397  002d a5f0          	bcp	a,#240
 398                     ; 138 					rc_type = RC_TYPE_LSE;
 399                     ; 139 					return _call_ptc_lse();
 402  002f 2704          	jreq	LC003
 403                     ; 143 					if ((p[0] & 0x0F) == 0x00) {
 405  0031 a50f          	bcp	a,#15
 406  0033 260a          	jrne	L731
 407                     ; 145 						rc_type = RC_TYPE_LSE;
 409  0035               LC003:
 412  0035 35020003      	mov	_rc_type,#2
 413                     ; 146 						return _call_ptc_lse();
 415  0039               LC002:
 419  0039 cd0000        	call	__call_ptc_lse
 422  003c               L001:
 424  003c 5b03          	addw	sp,#3
 425  003e 81            	ret	
 426  003f               L731:
 427                     ; 149 						if ((p[0] & 0xF0) == 0x80 || 
 427                     ; 150 								(p[0] & 0xF0) == 0x90 || 
 427                     ; 151 								(p[0] & 0xF0) == 0xB0 ||
 427                     ; 152 								(p[0] & 0xF0) == 0xC0) {
 429  003f a4f0          	and	a,#240
 430  0041 a180          	cp	a,#128
 431  0043 27f0          	jreq	LC003
 433  0045 f6            	ld	a,(x)
 434  0046 a4f0          	and	a,#240
 435  0048 a190          	cp	a,#144
 436  004a 27e9          	jreq	LC003
 438  004c f6            	ld	a,(x)
 439  004d a4f0          	and	a,#240
 440  004f a1b0          	cp	a,#176
 441  0051 27e2          	jreq	LC003
 443  0053 f6            	ld	a,(x)
 444  0054 a4f0          	and	a,#240
 445  0056 a1c0          	cp	a,#192
 446                     ; 153 							rc_type = RC_TYPE_LSE;
 447                     ; 154 							return _call_ptc_lse();
 450  0058 27db          	jreq	LC003
 451                     ; 156 							rc_type = RC_TYPE_WOODANG;
 453  005a 35010003      	mov	_rc_type,#1
 454                     ; 157 						  return _call_ptc_woodang();
 456  005e               LC004:
 458  005e cd0000        	call	__call_ptc_woodang
 461  0061 20d9          	jra	L001
 462  0063               L131:
 463                     ; 161 			}else if (rc_type == RC_TYPE_WOODANG) {
 465  0063 4a            	dec	a
 466  0064 26d3          	jrne	LC002
 467                     ; 162 				return _call_ptc_woodang();
 470  0066 20f6          	jp	LC004
 471                     ; 164 				return _call_ptc_lse();
 474  0068               L511:
 475                     ; 111 	while( _io_head != _io_tail )
 477  0068 c60000        	ld	a,__io_head
 478  006b c10000        	cp	a,__io_tail
 479  006e 2694          	jrne	L311
 480                     ; 168 	return 0;
 482  0070 4f            	clr	a
 484  0071 20c9          	jra	L001
 528                     ; 176 void	disp_key(uint8_t k)
 528                     ; 177 {
 529                     .text:	section	.text,new
 530  0000               _disp_key:
 532  0000 88            	push	a
 533  0001 5205          	subw	sp,#5
 534       00000005      OFST:	set	5
 537                     ; 179 	buf[0] = '<';
 539  0003 a63c          	ld	a,#60
 540  0005 6b01          	ld	(OFST-4,sp),a
 542                     ; 180 	buf[2] = ':';
 544  0007 a63a          	ld	a,#58
 545  0009 6b03          	ld	(OFST-2,sp),a
 547                     ; 181 	buf[3] = '0' + _key_continue;
 549  000b c60000        	ld	a,__key_continue
 550  000e ab30          	add	a,#48
 551  0010 6b04          	ld	(OFST-1,sp),a
 553                     ; 182 	buf[4] = '>';
 555  0012 a63e          	ld	a,#62
 556  0014 6b05          	ld	(OFST+0,sp),a
 558                     ; 183 	if( k == 4 )		buf[1] = '4';
 560  0016 7b06          	ld	a,(OFST+1,sp)
 561  0018 a104          	cp	a,#4
 562  001a 2604          	jrne	L302
 565  001c a634          	ld	a,#52
 567  001e 2015          	jp	LC005
 568  0020               L302:
 569                     ; 184 	else if( k == 3 )	buf[1] = '3';
 571  0020 a103          	cp	a,#3
 572  0022 2604          	jrne	L702
 575  0024 a633          	ld	a,#51
 577  0026 200d          	jp	LC005
 578  0028               L702:
 579                     ; 185 	else if( k == 2 )	buf[1] = '2';
 581  0028 a102          	cp	a,#2
 582  002a 2604          	jrne	L312
 585  002c a632          	ld	a,#50
 587  002e 2005          	jp	LC005
 588  0030               L312:
 589                     ; 186 	else if( k == 1 )	buf[1] = '1';
 591  0030 4a            	dec	a
 592  0031 2606          	jrne	L712
 595  0033 a631          	ld	a,#49
 596  0035               LC005:
 597  0035 6b02          	ld	(OFST-3,sp),a
 600  0037 2004          	jra	L502
 601  0039               L712:
 602                     ; 188 		buf[2] = '?';
 604  0039 a63f          	ld	a,#63
 605  003b 6b03          	ld	(OFST-2,sp),a
 607  003d               L502:
 608                     ; 189 	DISP(buf, 5);
 610  003d 4b05          	push	#5
 611  003f 96            	ldw	x,sp
 612  0040 1c0002        	addw	x,#OFST-3
 613  0043 cd0000        	call	_uart1_tx_put
 615  0046 84            	pop	a
 616                     ; 190 }
 619  0047 5b06          	addw	sp,#6
 620  0049 81            	ret	
 670                     ; 192 void	disp_enc(uint8_t enc)
 670                     ; 193 {
 671                     .text:	section	.text,new
 672  0000               _disp_enc:
 674  0000 88            	push	a
 675  0001 5204          	subw	sp,#4
 676       00000004      OFST:	set	4
 679                     ; 196 	if( (enc & 0x40) != 0 )
 681  0003 a540          	bcp	a,#64
 682  0005 2704          	jreq	L542
 683                     ; 197 		buf[0] = '+';
 685  0007 a62b          	ld	a,#43
 687  0009 2002          	jra	L742
 688  000b               L542:
 689                     ; 199 		buf[0] = '-';
 691  000b a62d          	ld	a,#45
 692  000d               L742:
 693  000d 6b02          	ld	(OFST-2,sp),a
 695                     ; 201 	i = enc&0x0f;
 697  000f 7b05          	ld	a,(OFST+1,sp)
 698  0011 a40f          	and	a,#15
 699  0013 6b01          	ld	(OFST-3,sp),a
 701                     ; 202 	buf[1] = '0' + i/10;
 703  0015 5f            	clrw	x
 704  0016 97            	ld	xl,a
 705  0017 a60a          	ld	a,#10
 706  0019 62            	div	x,a
 707  001a 9f            	ld	a,xl
 708  001b ab30          	add	a,#48
 709  001d 6b03          	ld	(OFST-1,sp),a
 711                     ; 203 	buf[2] = '0' + i%10;
 713  001f 5f            	clrw	x
 714  0020 7b01          	ld	a,(OFST-3,sp)
 715  0022 97            	ld	xl,a
 716  0023 a60a          	ld	a,#10
 717  0025 62            	div	x,a
 718  0026 ab30          	add	a,#48
 719  0028 6b04          	ld	(OFST+0,sp),a
 721                     ; 204 	DISP(buf, 3);
 723  002a 4b03          	push	#3
 724  002c 96            	ldw	x,sp
 725  002d 1c0003        	addw	x,#OFST-1
 726  0030 cd0000        	call	_uart1_tx_put
 728  0033 84            	pop	a
 729                     ; 205 }
 732  0034 5b05          	addw	sp,#5
 733  0036 81            	ret	
 765                     ; 207 void	disp_adc(uint8_t i)
 765                     ; 208 {
 766                     .text:	section	.text,new
 767  0000               _disp_adc:
 771                     ; 218 }
 774  0000 81            	ret	
 777                     	switch	.data
 778  0005               _tci:
 779  0005 00            	dc.b	0
 780  0006               __tcKeyPrev:
 781  0006 ff            	dc.b	255
 782  0007               __i0Prev:
 783  0007 ff            	dc.b	255
 784  0008               __mkey:
 785  0008 ff            	dc.b	255
 833                     ; 252 uint8_t	_touchKey(uint8_t i, uint8_t mask, uint8_t key)
 833                     ; 253 {
 834                     .text:	section	.text,new
 835  0000               __touchKey:
 837  0000 89            	pushw	x
 838       00000000      OFST:	set	0
 841                     ; 254 	if( tc[0] & mask )
 843  0001 9f            	ld	a,xl
 844  0002 c40001        	and	a,_tc
 845  0005 272e          	jreq	L503
 846                     ; 256 		if( tct[i] == 0 )
 848  0007 7b01          	ld	a,(OFST+1,sp)
 849  0009 5f            	clrw	x
 850  000a 97            	ld	xl,a
 851  000b 724d0011      	tnz	(_tct,x)
 852  000f 260f          	jrne	L703
 853                     ; 258 			tct[i] = 1;
 855  0011 5f            	clrw	x
 856  0012 97            	ld	xl,a
 857  0013 a601          	ld	a,#1
 858  0015 d70011        	ld	(_tct,x),a
 859                     ; 259 			_tctimer[i] = 0;
 861  0018 7b01          	ld	a,(OFST+1,sp)
 862  001a ad2a          	call	LC006
 863  001c 724f0005      	clr	(__tctimer100ms,x)
 864  0020               L703:
 865                     ; 262 		if( _tctimer[i] >= 10 )
 867  0020 5f            	clrw	x
 868  0021 97            	ld	xl,a
 869  0022 d6000b        	ld	a,(__tctimer,x)
 870  0025 a10a          	cp	a,#10
 871  0027 2508          	jrult	L113
 872                     ; 264 			_tctimer[i] = 0;
 874  0029 7b01          	ld	a,(OFST+1,sp)
 875  002b ad19          	call	LC006
 876  002d 724c0005      	inc	(__tctimer100ms,x)
 877  0031               L113:
 878                     ; 267 		return key;
 880  0031 7b05          	ld	a,(OFST+5,sp)
 882  0033 200f          	jra	L611
 883  0035               L503:
 884                     ; 271 		tct[i] = 0;
 886  0035 7b01          	ld	a,(OFST+1,sp)
 887  0037 5f            	clrw	x
 888  0038 97            	ld	xl,a
 889  0039 724f0011      	clr	(_tct,x)
 890                     ; 272 		_tctimer[i] = 0;
 892  003d ad07          	call	LC006
 893  003f 724f0005      	clr	(__tctimer100ms,x)
 894                     ; 275 	return 0;
 896  0043 4f            	clr	a
 898  0044               L611:
 900  0044 85            	popw	x
 901  0045 81            	ret	
 902  0046               LC006:
 903  0046 5f            	clrw	x
 904  0047 97            	ld	xl,a
 905  0048 724f000b      	clr	(__tctimer,x)
 906                     ; 273 		_tctimer100ms[i] = 0;
 908  004c 5f            	clrw	x
 909  004d 97            	ld	xl,a
 910  004e 81            	ret	
 913                     	switch	.data
 914  0009               __p:
 915  0009 00            	dc.b	0
 949                     ; 331 void	__b(uint8_t k)
 949                     ; 332 {
 950                     .text:	section	.text,new
 951  0000               ___b:
 955                     ; 333 	lcd_clear(0);
 957  0000 4f            	clr	a
 958  0001 cd0000        	call	_lcd_clear
 960                     ; 341 LCD_BIT_SET(_p);
 962  0004 c60009        	ld	a,__p
 963  0007 5f            	clrw	x
 964  0008 97            	ld	xl,a
 965  0009 d60000        	ld	a,(_iLF_DEF,x)
 966  000c 5f            	clrw	x
 967  000d 97            	ld	xl,a
 968  000e c60009        	ld	a,__p
 969  0011 905f          	clrw	y
 970  0013 9097          	ld	yl,a
 971  0015 d6540c        	ld	a,(21516,x)
 972  0018 90da0000      	or	a,(_bLF_DEF,y)
 973  001c d7540c        	ld	(21516,x),a
 974                     ; 342 	_p++;
 976  001f 725c0009      	inc	__p
 977                     ; 343 }
 980  0023 81            	ret	
1056                     ; 345 void	deviceCb(void)
1056                     ; 346 {
1057                     .text:	section	.text,new
1058  0000               _deviceCb:
1060  0000 5204          	subw	sp,#4
1061       00000004      OFST:	set	4
1064                     ; 347 	uint8_t	lcd = 0;
1066                     ; 422 	if( _tct0 == _t20ms )
1068  0002 c60004        	ld	a,__tct0
1069  0005 c10000        	cp	a,__t20ms
1070  0008 2603cc02b2    	jreq	L471
1071                     ; 423 		return;
1073                     ; 425 	_tct0 = _t20ms;
1075  000d 5500000004    	mov	__tct0,__t20ms
1076                     ; 426 	for( i=0; i<6; i++ )
1078  0012 4f            	clr	a
1079  0013 6b04          	ld	(OFST+0,sp),a
1081  0015               L363:
1082                     ; 428 		if( tct[i]==1 )
1084  0015 5f            	clrw	x
1085  0016 97            	ld	xl,a
1086  0017 d60011        	ld	a,(_tct,x)
1087  001a 4a            	dec	a
1088  001b 2608          	jrne	L173
1089                     ; 429 			_tctimer[i]++;
1091  001d 7b04          	ld	a,(OFST+0,sp)
1092  001f 5f            	clrw	x
1093  0020 97            	ld	xl,a
1094  0021 724c000b      	inc	(__tctimer,x)
1095  0025               L173:
1096                     ; 426 	for( i=0; i<6; i++ )
1098  0025 0c04          	inc	(OFST+0,sp)
1102  0027 7b04          	ld	a,(OFST+0,sp)
1103  0029 a106          	cp	a,#6
1104  002b 25e8          	jrult	L363
1105                     ; 432 	if( _uart1_rx_tail == _uart1_rx_head )
1107  002d c60000        	ld	a,__uart1_rx_tail
1108  0030 c10000        	cp	a,__uart1_rx_head
1109  0033 2703cc0271    	jrne	L704
1110                     ; 434 		_tct10++;
1112  0038 725c0003      	inc	__tct10
1113                     ; 435 		if( _tct10 >= 5 )
1115  003c c60003        	ld	a,__tct10
1116  003f a105          	cp	a,#5
1117  0041 25f2          	jrult	L704
1118                     ; 437 			for( i=0; i<6; i++ )
1120  0043 4f            	clr	a
1121  0044 6b04          	ld	(OFST+0,sp),a
1123  0046               L773:
1124                     ; 438 				tct[i] = 0;
1126  0046 5f            	clrw	x
1127  0047 97            	ld	xl,a
1128  0048 724f0011      	clr	(_tct,x)
1129                     ; 437 			for( i=0; i<6; i++ )
1131  004c 0c04          	inc	(OFST+0,sp)
1135  004e 7b04          	ld	a,(OFST+0,sp)
1136  0050 a106          	cp	a,#6
1137  0052 25f2          	jrult	L773
1138                     ; 439 			_tct10 = 0;
1140  0054 725f0003      	clr	__tct10
1141                     ; 440 			_tcKeyPrev = 0xff;
1143  0058 35ff0006      	mov	__tcKeyPrev,#255
1144                     ; 441 			_mkey = 0xff;
1146  005c 35ff0008      	mov	__mkey,#255
1147  0060 cc0271        	jra	L704
1148  0063               L504:
1149                     ; 448 		i = uart1_get();
1151  0063 cd0000        	call	_uart1_get
1153  0066 6b04          	ld	(OFST+0,sp),a
1155                     ; 449 		if( i != 0xff )
1157  0068 4c            	inc	a
1158  0069 2603cc026e    	jreq	L314
1159                     ; 451 			tc[tci] = i;
1161  006e c60005        	ld	a,_tci
1162  0071 5f            	clrw	x
1163  0072 97            	ld	xl,a
1164  0073 7b04          	ld	a,(OFST+0,sp)
1165  0075 d70001        	ld	(_tc,x),a
1166                     ; 452 			tci = tci==0 ? 1 : 0;
1168  0078 725d0005      	tnz	_tci
1169  007c 2604          	jrne	L031
1170  007e a601          	ld	a,#1
1171  0080 2001          	jra	L231
1172  0082               L031:
1173  0082 4f            	clr	a
1174  0083               L231:
1175  0083 c70005        	ld	_tci,a
1176                     ; 453 			if( tci != 0 )
1178  0086 725d0005      	tnz	_tci
1179  008a 26d4          	jrne	L704
1180                     ; 454 				continue;
1182                     ; 456 			i = tc[0] + tc[1];
1184  008c c60002        	ld	a,_tc+1
1185  008f cb0001        	add	a,_tc
1186  0092 6b04          	ld	(OFST+0,sp),a
1188                     ; 457 			if( i != 0xff )
1190  0094 4c            	inc	a
1191  0095 26c9          	jrne	L704
1192                     ; 458 				continue;
1194                     ; 460 			_tct10 = 0;
1196  0097 c70003        	ld	__tct10,a
1197                     ; 462 			_tcKey = _touchKey(0, 0x01, 0x20);
1199  009a 4b20          	push	#32
1200  009c ae0001        	ldw	x,#1
1201  009f cd0000        	call	__touchKey
1203  00a2 5b01          	addw	sp,#1
1204  00a4 c70000        	ld	__tcKey,a
1205                     ; 463 			_tcKey |= _touchKey(1, 0x02, 0x02);
1207  00a7 4b02          	push	#2
1208  00a9 ae0102        	ldw	x,#258
1209  00ac cd0000        	call	__touchKey
1211  00af 5b01          	addw	sp,#1
1212  00b1 ca0000        	or	a,__tcKey
1213  00b4 c70000        	ld	__tcKey,a
1214                     ; 464 			_tcKey |= _touchKey(2, 0x04, 0x08);
1216  00b7 4b08          	push	#8
1217  00b9 ae0204        	ldw	x,#516
1218  00bc cd0000        	call	__touchKey
1220  00bf 5b01          	addw	sp,#1
1221  00c1 ca0000        	or	a,__tcKey
1222  00c4 c70000        	ld	__tcKey,a
1223                     ; 465 			_tcKey |= _touchKey(3, 0x08, 0x04);
1225  00c7 4b04          	push	#4
1226  00c9 ae0308        	ldw	x,#776
1227  00cc cd0000        	call	__touchKey
1229  00cf 5b01          	addw	sp,#1
1230  00d1 ca0000        	or	a,__tcKey
1231  00d4 c70000        	ld	__tcKey,a
1232                     ; 466 			_tcKey |= _touchKey(4, 0x10, 0x10);
1234  00d7 4b10          	push	#16
1235  00d9 ae0410        	ldw	x,#1040
1236  00dc cd0000        	call	__touchKey
1238  00df 5b01          	addw	sp,#1
1239  00e1 ca0000        	or	a,__tcKey
1240  00e4 c70000        	ld	__tcKey,a
1241                     ; 467 			_tcKey |= _touchKey(5, 0x20, 0x01);
1243  00e7 4b01          	push	#1
1244  00e9 ae0520        	ldw	x,#1312
1245  00ec cd0000        	call	__touchKey
1247  00ef 5b01          	addw	sp,#1
1248  00f1 ca0000        	or	a,__tcKey
1249  00f4 c70000        	ld	__tcKey,a
1250                     ; 469 			if( _tcKey == 0 )
1252  00f7 725d0000      	tnz	__tcKey
1253  00fb 2607          	jrne	L124
1254                     ; 471 				_tcKeyPrev = 0xff;
1256  00fd 35ff0006      	mov	__tcKeyPrev,#255
1257                     ; 472 				continue;
1259  0101 cc0271        	jra	L704
1260  0104               L124:
1261                     ; 475 			j = 0;
1263  0104 0f03          	clr	(OFST-1,sp)
1265                     ; 476 			i0 = 0xff;
1267  0106 a6ff          	ld	a,#255
1268  0108 6b02          	ld	(OFST-2,sp),a
1270                     ; 477 			for( i=0; i<6; i++ )
1272  010a 4f            	clr	a
1273  010b 6b04          	ld	(OFST+0,sp),a
1275  010d               L324:
1276                     ; 479 				if( tct[i]==1 )
1278  010d 5f            	clrw	x
1279  010e 97            	ld	xl,a
1280  010f d60011        	ld	a,(_tct,x)
1281  0112 4a            	dec	a
1282  0113 2606          	jrne	L134
1283                     ; 481 					j++;
1285  0115 0c03          	inc	(OFST-1,sp)
1287                     ; 482 					i0 = i;
1289  0117 7b04          	ld	a,(OFST+0,sp)
1290  0119 6b02          	ld	(OFST-2,sp),a
1292  011b               L134:
1293                     ; 477 			for( i=0; i<6; i++ )
1295  011b 0c04          	inc	(OFST+0,sp)
1299  011d 7b04          	ld	a,(OFST+0,sp)
1300  011f a106          	cp	a,#6
1301  0121 25ea          	jrult	L324
1302                     ; 487 			if( j >= 3 && _mkey != 0xff )
1304  0123 7b03          	ld	a,(OFST-1,sp)
1305  0125 a103          	cp	a,#3
1306  0127 2516          	jrult	L334
1308  0129 c60008        	ld	a,__mkey
1309  012c 4c            	inc	a
1310  012d 2710          	jreq	L334
1311                     ; 489 				if( _tcKey == 0x55 )		goto K_55;
1313  012f c60000        	ld	a,__tcKey
1314  0132 a155          	cp	a,#85
1315  0134 2736          	jreq	L133
1318                     ; 490 				if( _tcKey == 0x53 )		goto K_53;
1320  0136 c60000        	ld	a,__tcKey
1321  0139 a153          	cp	a,#83
1322  013b 26c4          	jrne	L704
1325  013d 2060          	jra	L333
1326  013f               L334:
1327                     ; 493 			if( j == 1 && _mkey != 0xff )
1329  013f 7b03          	ld	a,(OFST-1,sp)
1330  0141 4a            	dec	a
1331  0142 2616          	jrne	L144
1333  0144 c60008        	ld	a,__mkey
1334  0147 4c            	inc	a
1335  0148 2710          	jreq	L144
1336                     ; 495 				if( _tcKey == 0x55 )		goto K_55;
1338  014a c60000        	ld	a,__tcKey
1339  014d a155          	cp	a,#85
1340  014f 271b          	jreq	L133
1343                     ; 496 				if( _tcKey == 0x53 )		goto K_53;
1345  0151 c60000        	ld	a,__tcKey
1346  0154 a153          	cp	a,#83
1347  0156 26a9          	jrne	L704
1350  0158 2045          	jra	L333
1351  015a               L144:
1352                     ; 499 			if( j == 2 )
1354  015a 7b03          	ld	a,(OFST-1,sp)
1355  015c a102          	cp	a,#2
1356  015e 266c          	jrne	L744
1357                     ; 503 				if( tct[2] == 1 )
1359  0160 c60013        	ld	a,_tct+2
1360  0163 4a            	dec	a
1361  0164 2669          	jrne	L533
1362                     ; 505 					if( tct[5] == 1 )
1364  0166 c60016        	ld	a,_tct+5
1365  0169 4a            	dec	a
1366  016a 262d          	jrne	L354
1367  016c               L133:
1368                     ; 507 K_55:						
1368                     ; 508 						//	ID
1368                     ; 509 						_tcKey = 0x55;
1370  016c 35550000      	mov	__tcKey,#85
1371                     ; 510 						_mkey = 0x24;
1373  0170 35240008      	mov	__mkey,#36
1374                     ; 511 						if( _tcKey != _tcKeyPrev )
1376  0174 c60000        	ld	a,__tcKey
1377  0177 c10006        	cp	a,__tcKeyPrev
1378  017a 270d          	jreq	L554
1379                     ; 513 							_tcKeyPrev = _tcKey;
1381  017c 5500000006    	mov	__tcKeyPrev,__tcKey
1382                     ; 514 							_i0Prev = i0;
1384  0181 7b02          	ld	a,(OFST-2,sp)
1385  0183 cd02be        	call	LC011
1386                     ; 516 							_key_continue = 0;
1387  0186 cc0271        	jra	L704
1388  0189               L554:
1389                     ; 521 							if( _tctimer100ms[_i0Prev] > 35 )//TIME_LONG_TOUCH )
1391  0189 cd02b5        	call	LC010
1392  018c a124          	cp	a,#36
1393  018e 25f6          	jrult	L704
1394                     ; 523 								_key_continue = 1;
1396  0190 35010000      	mov	__key_continue,#1
1397                     ; 524 								disp_status(0x55);
1399  0194 a655          	ld	a,#85
1401                     ; 525 								_tctimer100ms[_i0Prev] = 0;
1402  0196 cc0260        	jp	LC007
1403  0199               L354:
1404                     ; 531 					else if( tct[1] == 1 )
1406  0199 c60012        	ld	a,_tct+1
1407  019c 4a            	dec	a
1408  019d 2630          	jrne	L533
1409  019f               L333:
1410                     ; 533 K_53:						
1410                     ; 534 						//	Option
1410                     ; 535 						_tcKey = 0x53;
1412  019f 35530000      	mov	__tcKey,#83
1413                     ; 536 						_mkey = 0x60;
1415  01a3 35600008      	mov	__mkey,#96
1416                     ; 537 						if( _tcKey != _tcKeyPrev )
1418  01a7 c60000        	ld	a,__tcKey
1419  01aa c10006        	cp	a,__tcKeyPrev
1420  01ad 270d          	jreq	L764
1421                     ; 539 							_tcKeyPrev = _tcKey;
1423  01af 5500000006    	mov	__tcKeyPrev,__tcKey
1424                     ; 540 							_i0Prev = i0;
1426  01b4 7b02          	ld	a,(OFST-2,sp)
1427  01b6 cd02be        	call	LC011
1428                     ; 542 							_key_continue = 0;
1429  01b9 cc0271        	jra	L704
1430  01bc               L764:
1431                     ; 547 							if( _tctimer100ms[_i0Prev] > 35 )//TIME_LONG_TOUCH )
1433  01bc cd02b5        	call	LC010
1434  01bf a124          	cp	a,#36
1435  01c1 25f6          	jrult	L704
1436                     ; 549 								_key_continue = 1;
1438  01c3 35010000      	mov	__key_continue,#1
1439                     ; 550 								disp_status(0x53);
1441  01c7 a653          	ld	a,#83
1443                     ; 551 								_tctimer100ms[_i0Prev] = 0;
1444  01c9 cc0260        	jp	LC007
1445  01cc               L744:
1446                     ; 560 			if( j != 1 )
1448  01cc 4a            	dec	a
1449  01cd 2714          	jreq	L574
1450  01cf               L533:
1451                     ; 562 CLEAR_KEY_ENTRY:
1451                     ; 563 				for( i=0; i<6; i++ )
1453  01cf 4f            	clr	a
1454  01d0 6b04          	ld	(OFST+0,sp),a
1456  01d2               L774:
1457                     ; 564 					tct[i] = 0;
1459  01d2 5f            	clrw	x
1460  01d3 97            	ld	xl,a
1461  01d4 724f0011      	clr	(_tct,x)
1462                     ; 563 				for( i=0; i<6; i++ )
1464  01d8 0c04          	inc	(OFST+0,sp)
1468  01da 7b04          	ld	a,(OFST+0,sp)
1469  01dc a106          	cp	a,#6
1470  01de 25f2          	jrult	L774
1471                     ; 565 				continue;
1473  01e0 cc0271        	jra	L704
1474  01e3               L574:
1475                     ; 568 			if( _tcKeyPrev != _tcKey )
1477  01e3 c60006        	ld	a,__tcKeyPrev
1478  01e6 c10000        	cp	a,__tcKey
1479  01e9 2745          	jreq	L505
1480                     ; 570 				_tcKeyPrev = _tcKey;
1482  01eb 5500000006    	mov	__tcKeyPrev,__tcKey
1483                     ; 571 				_i0Prev = i0;
1485  01f0 7b02          	ld	a,(OFST-2,sp)
1486  01f2 cd02be        	call	LC011
1487                     ; 575 					_lcdTimer[0] = 0;
1489  01f5 725f0000      	clr	__lcdTimer
1490                     ; 576 					_lcdTimer[2] = __timer1s;
1492  01f9 5500000002    	mov	__lcdTimer+2,___timer1s
1493                     ; 577 					if( _lcdTimer[1] == 2 )
1495  01fe c60001        	ld	a,__lcdTimer+1
1496  0201 a102          	cp	a,#2
1497  0203 260a          	jrne	L705
1498                     ; 580 						_lcdTimer[1] = 3;
1500  0205 cd02cb        	call	LC012
1501                     ; 584 						_uart1_rx_tail = _uart1_rx_head;
1503  0208 5500000000    	mov	__uart1_rx_tail,__uart1_rx_head
1505  020d 2062          	jra	L704
1506  020f               L705:
1507                     ; 587 					else if( _lcdTimer[1] == 3 )
1509  020f a103          	cp	a,#3
1510  0211 2612          	jrne	L315
1511                     ; 589 						_tcKeyPrev = 0xff;
1513  0213 35ff0006      	mov	__tcKeyPrev,#255
1514                     ; 590 						if( _lcdTimer[3] == __timer100ms )
1516  0217 c60003        	ld	a,__lcdTimer+3
1517  021a c10000        	cp	a,___timer100ms
1518  021d 2752          	jreq	L704
1520                     ; 595 							_lcdTimer[1] = 0;
1522  021f 725f0001      	clr	__lcdTimer+1
1523  0223 204c          	jra	L704
1524  0225               L315:
1525                     ; 612 						_lcdTimer[1] = 3;
1527  0225 cd02cb        	call	LC012
1528                     ; 616 						disp_status(_tcKey);
1530  0228 c60000        	ld	a,__tcKey
1531  022b cd0000        	call	_disp_status
1533  022e 2041          	jra	L704
1534  0230               L505:
1535                     ; 621 				if (_tcKeyPrev == 0x10 || _tcKeyPrev == 0x20) {
1537  0230 c60006        	ld	a,__tcKeyPrev
1538  0233 a110          	cp	a,#16
1539  0235 2707          	jreq	L725
1541  0237 c60006        	ld	a,__tcKeyPrev
1542  023a a120          	cp	a,#32
1543  023c 2608          	jrne	L525
1544  023e               L725:
1545                     ; 622 					if( _tctimer100ms[_i0Prev] > 2 )
1547  023e ad75          	call	LC010
1548  0240 a103          	cp	a,#3
1549  0242 252d          	jrult	L704
1550                     ; 624 						disp_status(_tcKeyPrev);
1552                     ; 625 						_tctimer100ms[_i0Prev] = 0;
1553  0244 2017          	jp	LC008
1554  0246               L525:
1555                     ; 628 					if( _tcKeyPrev == 0x04 )
1557  0246 c60006        	ld	a,__tcKeyPrev
1558  0249 a104          	cp	a,#4
1559  024b 2606          	jrne	L535
1560                     ; 631 						if( _tctimer100ms[_i0Prev] > 30 /*TIME_LONG_TOUCH*/ )
1562  024d ad66          	call	LC010
1563  024f a11f          	cp	a,#31
1564                     ; 633 							_key_continue = 1;
1565                     ; 634 							disp_status(_tcKeyPrev);
1567                     ; 635 							_tctimer100ms[_i0Prev] = 0;
1568  0251 2004          	jp	LC009
1569  0253               L535:
1570                     ; 640 						if( _tctimer100ms[_i0Prev] > TIME_LONG_TOUCH )
1572  0253 ad60          	call	LC010
1573  0255 a129          	cp	a,#41
1574                     ; 642 							_key_continue = 1;
1576  0257               LC009:
1577  0257 2518          	jrult	L704
1579  0259 35010000      	mov	__key_continue,#1
1580                     ; 643 							disp_status(_tcKeyPrev);
1582  025d               LC008:
1585  025d c60006        	ld	a,__tcKeyPrev
1587                     ; 644 							_tctimer100ms[_i0Prev] = 0;
1589  0260               LC007:
1590  0260 cd0000        	call	_disp_status
1595  0263 c60007        	ld	a,__i0Prev
1596  0266 5f            	clrw	x
1597  0267 97            	ld	xl,a
1598  0268 724f0005      	clr	(__tctimer100ms,x)
1599  026c 2003          	jra	L704
1600  026e               L314:
1601                     ; 651 			tci = 0;
1603  026e c70005        	ld	_tci,a
1604  0271               L704:
1605                     ; 446 	while( _uart1_rx_tail != _uart1_rx_head )
1607  0271 c60000        	ld	a,__uart1_rx_tail
1608  0274 c10000        	cp	a,__uart1_rx_head
1609  0277 2703cc0063    	jrne	L504
1610                     ; 653 	if( _lcdTimer[2] != __timer1s )
1612  027c c60002        	ld	a,__lcdTimer+2
1613  027f c10000        	cp	a,___timer1s
1614  0282 272a          	jreq	L745
1615                     ; 655 		_lcdTimer[2] = __timer1s;
1617  0284 5500000002    	mov	__lcdTimer+2,___timer1s
1618                     ; 656 		_lcdTimer[0]++;
1620  0289 725c0000      	inc	__lcdTimer
1621                     ; 657 		if( _lcdTimer[0] >= 8 )
1623  028d c60000        	ld	a,__lcdTimer
1624  0290 a108          	cp	a,#8
1625  0292 251a          	jrult	L745
1626                     ; 659 			if( _lcdTimer[1] == 0 || _lcdTimer[1] == 3 )
1628  0294 c60001        	ld	a,__lcdTimer+1
1629  0297 2704          	jreq	L555
1631  0299 a103          	cp	a,#3
1632  029b 2608          	jrne	L355
1633  029d               L555:
1634                     ; 662 				_lcdTimer[1] = 2;
1636  029d 35020001      	mov	__lcdTimer+1,#2
1637                     ; 663 				_backup_backlight2 = 0;
1639  02a1 725f0000      	clr	__backup_backlight2
1640  02a5               L355:
1641                     ; 666 			_lcdTimer[0] = 0;
1643  02a5 725f0000      	clr	__lcdTimer
1644                     ; 667 			_lcdTimer[3] = __timer100ms;
1646  02a9 5500000003    	mov	__lcdTimer+3,___timer100ms
1647  02ae               L745:
1648                     ; 671 	disp_status(0);
1650  02ae 4f            	clr	a
1651  02af cd0000        	call	_disp_status
1653                     ; 673 }
1654  02b2               L471:
1657  02b2 5b04          	addw	sp,#4
1658  02b4 81            	ret	
1659  02b5               LC010:
1660  02b5 c60007        	ld	a,__i0Prev
1661  02b8 5f            	clrw	x
1662  02b9 97            	ld	xl,a
1663  02ba d60005        	ld	a,(__tctimer100ms,x)
1664  02bd 81            	ret	
1665  02be               LC011:
1666  02be c70007        	ld	__i0Prev,a
1667                     ; 515 							beepSet(4);			
1669  02c1 a604          	ld	a,#4
1670  02c3 cd0000        	call	_beepSet
1672                     ; 516 							_key_continue = 0;
1674  02c6 725f0000      	clr	__key_continue
1675  02ca 81            	ret	
1676  02cb               LC012:
1677  02cb 35030001      	mov	__lcdTimer+1,#3
1678                     ; 613 						_lcdTimer[3] = __timer100ms;
1680  02cf 5500000003    	mov	__lcdTimer+3,___timer100ms
1681                     ; 614 						_backup_backlight2 = BACKLIGHT_MAX_LEVEL;
1683  02d4 35600000      	mov	__backup_backlight2,#96
1684  02d8 81            	ret	
1719                     ; 675 void	device_adc(void)
1719                     ; 676 {
1720                     .text:	section	.text,new
1721  0000               _device_adc:
1723  0000 88            	push	a
1724       00000001      OFST:	set	1
1727                     ; 678 	i = adcGet(0);
1729  0001 4f            	clr	a
1730  0002 cd0000        	call	_adcGet
1732  0005 6b01          	ld	(OFST+0,sp),a
1734                     ; 679 	if( i != currTemp )
1736  0007 c10000        	cp	a,_currTemp
1737  000a 2706          	jreq	L375
1738                     ; 681 		currTemp = i;
1740  000c c70000        	ld	_currTemp,a
1741                     ; 682 		disp_adc(i);
1743  000f cd0000        	call	_disp_adc
1745  0012               L375:
1746                     ; 684 }
1749  0012 84            	pop	a
1750  0013 81            	ret	
1753                     	switch	.data
1754  000a               ___tim30min_reset:
1755  000a 00            	dc.b	0
1779                     ; 693 uint8_t timerEventClear(void) {
1780                     .text:	section	.text,new
1781  0000               _timerEventClear:
1785                     ; 694 	__timer1sa = 0;
1787  0000 725f0000      	clr	___timer1sa
1788                     ; 695 	__timer1min = 0;
1790  0004 725f0000      	clr	___timer1min
1791                     ; 696 	__timer1h = 0 ;
1793  0008 725f0000      	clr	___timer1h
1794                     ; 697 }
1797  000c 81            	ret	
1830                     ; 708 void	timerEvent(void)
1830                     ; 709 {
1831                     .text:	section	.text,new
1832  0000               _timerEvent:
1834       00000002      OFST:	set	2
1837                     ; 710 	_tim1min++;
1839  0000 725c0000      	inc	__tim1min
1840  0004 89            	pushw	x
1841                     ; 711 	if( (_tim1min%30) == 0 )
1843  0005 c60000        	ld	a,__tim1min
1844  0008 5f            	clrw	x
1845  0009 97            	ld	xl,a
1846  000a a61e          	ld	a,#30
1847  000c cd0000        	call	c_smodx
1849  000f 5d            	tnzw	x
1850  0010 2615          	jrne	L516
1851                     ; 713 		if( _tim30min != 0xff )
1853  0012 c60000        	ld	a,__tim30min
1854  0015 4c            	inc	a
1855  0016 2713          	jreq	L326
1856                     ; 715 			if( __tim30min_reset == 0 )
1858  0018 c6000a        	ld	a,___tim30min_reset
1859  001b 260e          	jrne	L326
1860                     ; 717 				__tim30min_reset = 1;
1862  001d 3501000a      	mov	___tim30min_reset,#1
1863                     ; 718 				_tim30min++;
1865  0021 725c0000      	inc	__tim30min
1866  0025 2004          	jra	L326
1867  0027               L516:
1868                     ; 723 		__tim30min_reset = 0;
1870  0027 725f000a      	clr	___tim30min_reset
1871  002b               L326:
1872                     ; 725 	if( __boiler_shower[5] == 1 )
1874  002b c60005        	ld	a,___boiler_shower+5
1875  002e 4a            	dec	a
1876  002f 260f          	jrne	L526
1877                     ; 727 		__boiler_shower[4]++;
1879  0031 725c0004      	inc	___boiler_shower+4
1880                     ; 728 		if( __boiler_shower[4] >= /*21*/90 )
1882  0035 c60004        	ld	a,___boiler_shower+4
1883  0038 a15a          	cp	a,#90
1884  003a 2504          	jrult	L526
1885                     ; 731 			__boiler_shower[5] = 0x80;
1887  003c 35800005      	mov	___boiler_shower+5,#128
1888  0040               L526:
1889                     ; 735 	if( _disp_mode == 0x10 )
1891  0040 c60000        	ld	a,__disp_mode
1892  0043 a110          	cp	a,#16
1893  0045 2635          	jrne	L136
1894                     ; 758 		if( _timFlag == 0 )
1896  0047 c60000        	ld	a,__timFlag
1897  004a 2612          	jrne	L336
1898                     ; 760 			if( uiInfo.repeat == _tim1min )
1900  004c c6000c        	ld	a,_uiInfo+12
1901  004f c10000        	cp	a,__tim1min
1902  0052 2628          	jrne	L136
1903                     ; 762 				_tim1min = 0;
1905  0054 725f0000      	clr	__tim1min
1906                     ; 764 				_timFlag = 1;
1908  0058 35010000      	mov	__timFlag,#1
1909  005c 201e          	jra	L136
1910  005e               L336:
1911                     ; 769 			if( (_TIME_REPEAT_BASE-uiInfo.repeat) == _tim1min )
1913  005e c60000        	ld	a,__tim1min
1914  0061 5f            	clrw	x
1915  0062 97            	ld	xl,a
1916  0063 1f01          	ldw	(OFST-1,sp),x
1918  0065 4f            	clr	a
1919  0066 97            	ld	xl,a
1920  0067 a63c          	ld	a,#60
1921  0069 c0000c        	sub	a,_uiInfo+12
1922  006c 2401          	jrnc	L012
1923  006e 5a            	decw	x
1924  006f               L012:
1925  006f 02            	rlwa	x,a
1926  0070 1301          	cpw	x,(OFST-1,sp)
1927  0072 2608          	jrne	L136
1928                     ; 771 				_tim1min = 0;
1930  0074 725f0000      	clr	__tim1min
1931                     ; 773 				_timFlag = 0;
1933  0078 725f0000      	clr	__timFlag
1934  007c               L136:
1935                     ; 778 	if( _disp_mode == 0x08 )
1937  007c c60000        	ld	a,__disp_mode
1938  007f a108          	cp	a,#8
1939  0081 2618          	jrne	L346
1940                     ; 781 		if( uiInfo.reserve == _tim30min )
1942  0083 c6000d        	ld	a,_uiInfo+13
1943  0086 c10000        	cp	a,__tim30min
1944  0089 2610          	jrne	L346
1945                     ; 783 			_tim30min = 0xff;
1947  008b 35ff0000      	mov	__tim30min,#255
1948                     ; 784 			__s = 0;
1950  008f 725f0000      	clr	___s
1951                     ; 785 			_dsCount = 0;
1953  0093 725f0000      	clr	__dsCount
1954                     ; 786 			_key_blink = 0;
1956  0097 725f0000      	clr	__key_blink
1957  009b               L346:
1958                     ; 789 }
1961  009b 85            	popw	x
1962  009c 81            	ret	
2060                     ; 821 int		main()
2060                     ; 822 {
2061                     .text:	section	.text,new
2062  0000               _main:
2064  0000 5207          	subw	sp,#7
2065       00000007      OFST:	set	7
2068                     ; 823 	uint8_t	logo = 0;
2070  0002 0f01          	clr	(OFST-6,sp)
2072                     ; 827 	uint8_t	_loopStatus = 0;
2074  0004 0f02          	clr	(OFST-5,sp)
2076                     ; 831 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
2078  0006 4f            	clr	a
2079  0007 cd0000        	call	_CLK_SYSCLKDivConfig
2081                     ; 832 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
2083  000a a601          	ld	a,#1
2084  000c cd0000        	call	_CLK_SYSCLKSourceConfig
2087  000f               L776:
2088                     ; 834 	while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI)
2090  000f cd0000        	call	_CLK_GetSYSCLKSource
2092  0012 4a            	dec	a
2093  0013 26fa          	jrne	L776
2094                     ; 842 	CFG-> GCR |= CFG_GCR_SWD;
2096  0015 72107f60      	bset	32608,#0
2097                     ; 843 	CLK_PeripheralClockConfig(CLK_Peripheral_BEEP, ENABLE);
2099  0019 ae0601        	ldw	x,#1537
2100  001c cd0000        	call	_CLK_PeripheralClockConfig
2102                     ; 844 	CLK_BEEPClockConfig(CLK_BEEPCLKSource_LSI);
2104  001f a602          	ld	a,#2
2105  0021 cd0000        	call	_CLK_BEEPClockConfig
2107                     ; 847 BEEP_LSICalibrationConfig( 38000+801+801  );
2109  0024 ae9ab2        	ldw	x,#39602
2110  0027 89            	pushw	x
2111  0028 5f            	clrw	x
2112  0029 89            	pushw	x
2113  002a cd0000        	call	_BEEP_LSICalibrationConfig
2115  002d 5b04          	addw	sp,#4
2116                     ; 850 	BEEP_Init(BEEP_Frequency_1KHz);
2118  002f 4f            	clr	a
2119  0030 cd0000        	call	_BEEP_Init
2121                     ; 851 	BEEP_Cmd(DISABLE);
2123  0033 4f            	clr	a
2124  0034 cd0000        	call	_BEEP_Cmd
2126                     ; 853 	GPIO_Init(GPIOC, GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Fast);
2128  0037 4be0          	push	#224
2129  0039 4b20          	push	#32
2130  003b ae500a        	ldw	x,#20490
2131  003e cd0000        	call	_GPIO_Init
2133  0041 721a500a      	bset	20490,#5
2134  0045 35600000      	mov	__backlight,#96
2135  0049 85            	popw	x
2136                     ; 854 	D_IO_HIGH(GPIOC, GPIO_Pin_5);
2138                     ; 856 	_backlight = BACKLIGHT_MAX_LEVEL;
2140                     ; 869 	systemTimer();
2142  004a cd0000        	call	_systemTimer
2144                     ; 871 	iouart_Open();
2146  004d cd0000        	call	_iouart_Open
2148                     ; 872 	encoder_Open();
2150  0050 cd0000        	call	_encoder_Open
2152                     ; 873 	systemADC();
2154  0053 cd0000        	call	_systemADC
2156                     ; 874 	systemLcd();
2158  0056 cd0000        	call	_systemLcd
2160                     ; 877 	GPIO_Init(D_BL_PORT, D_BL_PIN, GPIO_Mode_Out_PP_Low_Fast);
2162  0059 4be0          	push	#224
2163  005b 4b40          	push	#64
2164  005d ae5014        	ldw	x,#20500
2165  0060 cd0000        	call	_GPIO_Init
2167  0063 721c5014      	bset	20500,#6
2168  0067 725f0000      	clr	__lcdTimer
2169  006b 725f0001      	clr	__lcdTimer+1
2170  006f 85            	popw	x
2171  0070 5500000002    	mov	__lcdTimer+2,___timer1s
2172                     ; 878 	D_IO_HIGH(D_BL_PORT, D_BL_PIN);
2174                     ; 880 	_lcdTimer[0] = 0;
2176                     ; 881 	_lcdTimer[1] = 0;
2178                     ; 882 	_lcdTimer[2] = __timer1s;
2180                     ; 890 	systemUart();
2182  0075 cd0000        	call	_systemUart
2184                     ; 894 	lcd_clear(0);
2186  0078 4f            	clr	a
2187  0079 cd0000        	call	_lcd_clear
2189                     ; 901 	lcd_disp_n(0, 6);
2191  007c ae0006        	ldw	x,#6
2192  007f cd0000        	call	_lcd_disp_n
2194                     ; 902 	LCD_BIT_SET(b2A);
2196  0082 c60035        	ld	a,_iLF_DEF+53
2197  0085 cd01db        	call	LC013
2198  0088 ca0035        	or	a,_bLF_DEF+53
2199  008b d7540c        	ld	(21516,x),a
2200                     ; 903 	LCD_BIT_SET(b2D);
2202  008e c60005        	ld	a,_iLF_DEF+5
2203  0091 cd01db        	call	LC013
2204  0094 ca0005        	or	a,_bLF_DEF+5
2205  0097 d7540c        	ld	(21516,x),a
2206                     ; 904 	LCD_BIT_SET(b2E);
2208  009a c60016        	ld	a,_iLF_DEF+22
2209  009d cd01db        	call	LC013
2210  00a0 ca0016        	or	a,_bLF_DEF+22
2211  00a3 d7540c        	ld	(21516,x),a
2212                     ; 905 	LCD_BIT_SET(b2F);
2214  00a6 c60036        	ld	a,_iLF_DEF+54
2215  00a9 cd01db        	call	LC013
2216  00ac ca0036        	or	a,_bLF_DEF+54
2217  00af d7540c        	ld	(21516,x),a
2218                     ; 925 	lcd_disp_n(2, 1);
2220  00b2 ae0201        	ldw	x,#513
2221  00b5 cd0000        	call	_lcd_disp_n
2223                     ; 926 	lcd_disp_n(3, 4);
2225  00b8 ae0304        	ldw	x,#772
2226  00bb cd0000        	call	_lcd_disp_n
2228                     ; 929 	indiIOUartIdle = 0;
2230  00be 725f0000      	clr	_indiIOUartIdle
2231                     ; 931 	rc_ptc_baseSet();
2233  00c2 cd0000        	call	_rc_ptc_baseSet
2235                     ; 932 	ui_Open();
2237  00c5 cd0000        	call	_ui_Open
2239                     ; 940 	if( uiInfo.id == 0 )
2241  00c8 c60004        	ld	a,_uiInfo+4
2242  00cb 2604          	jrne	L307
2243                     ; 944 		_ds = 220;
2245  00cd 35dc0000      	mov	__ds,#220
2246  00d1               L307:
2247                     ; 946 	enableInterrupts();
2250  00d1 9a            	rim	
2252                     ; 948 	for( i=0; i<24; i++ )	
2255  00d2 4f            	clr	a
2256  00d3 6b07          	ld	(OFST+0,sp),a
2258  00d5               L507:
2259                     ; 949 		_add[i%12] = adcGet(1);
2261  00d5 5f            	clrw	x
2262  00d6 97            	ld	xl,a
2263  00d7 a60c          	ld	a,#12
2264  00d9 cd0000        	call	c_smodx
2266  00dc 89            	pushw	x
2267  00dd a601          	ld	a,#1
2268  00df cd0000        	call	_adcGet
2270  00e2 85            	popw	x
2271  00e3 d70000        	ld	(__add,x),a
2272                     ; 948 	for( i=0; i<24; i++ )	
2274  00e6 0c07          	inc	(OFST+0,sp)
2278  00e8 7b07          	ld	a,(OFST+0,sp)
2279  00ea a118          	cp	a,#24
2280  00ec 25e7          	jrult	L507
2281  00ee               L746:
2282                     ; 953 Entry:		
2282                     ; 954 #if	defined(WATCHDOG_ENABLE)
2282                     ; 955 		while(1)
2282                     ; 956 		{
2282                     ; 957 			for(i=0; i<200; i++ )
2282                     ; 958 			{
2282                     ; 959 				for( j=0; j<250; j++);
2282                     ; 960 			}
2282                     ; 961 			break;
2282                     ; 962 		}
2282                     ; 963 		IWDG_ReloadCounter();
2282                     ; 964 #endif
2282                     ; 965 		i = 0;
2284                     ; 966 		if (timerCalc() == 1) 
2286  00ee cd0000        	call	_timerCalc
2288  00f1 4a            	dec	a
2289  00f2 2603          	jrne	L717
2290                     ; 969 			timerEvent();
2292  00f4 cd0000        	call	_timerEvent
2294  00f7               L717:
2295                     ; 973 		if( _loopStatus == 0 )
2297  00f7 7b02          	ld	a,(OFST-5,sp)
2298  00f9 270b          	jreq	L327
2300                     ; 976 		else if( _loopStatus == 3 )
2302  00fb a103          	cp	a,#3
2303  00fd 2607          	jrne	L327
2304                     ; 978 			factory(1);
2306  00ff a601          	ld	a,#1
2307  0101 cd0000        	call	_factory
2309                     ; 979 			goto Entry;
2311  0104 20e8          	jra	L746
2312  0106               L327:
2313                     ; 982 		if( logo < 4 )
2315  0106 7b01          	ld	a,(OFST-6,sp)
2316  0108 a104          	cp	a,#4
2317  010a 2419          	jruge	L727
2318                     ; 984 			if( __timer1s != pp[1] )
2320  010c c60000        	ld	a,___timer1s
2321  010f 1104          	cp	a,(OFST-3,sp)
2322  0111 27db          	jreq	L746
2323                     ; 986 				pp[1] = __timer1s;
2325  0113 6b04          	ld	(OFST-3,sp),a
2327                     ; 987 				if( logo == 2 )
2329  0115 7b01          	ld	a,(OFST-6,sp)
2330  0117 a102          	cp	a,#2
2331  0119 2606          	jrne	L337
2332                     ; 989 					logo = 100;
2334  011b a664          	ld	a,#100
2335  011d 6b01          	ld	(OFST-6,sp),a
2338  011f 20cd          	jra	L746
2339  0121               L337:
2340                     ; 993 					logo++;
2342  0121 0c01          	inc	(OFST-6,sp)
2344  0123 20c9          	jra	L746
2345  0125               L727:
2346                     ; 999 		i = _iouartLoop();
2348  0125 cd0000        	call	__iouartLoop
2350  0128 6b07          	ld	(OFST+0,sp),a
2352                     ; 1000 		if( i == 3 )		{	_loopStatus = 3;	}//	factory mode
2354  012a a103          	cp	a,#3
2355  012c 2606          	jrne	L737
2358  012e a603          	ld	a,#3
2359  0130 6b02          	ld	(OFST-5,sp),a
2362  0132 2006          	jra	L147
2363  0134               L737:
2364                     ; 1001 		else if( i == 99 )	{	_loopStatus = 0;	}//	normal mode	
2366  0134 a163          	cp	a,#99
2367  0136 2602          	jrne	L147
2370  0138 0f02          	clr	(OFST-5,sp)
2372  013a               L147:
2373                     ; 1003 		deviceCb();
2375  013a cd0000        	call	_deviceCb
2377                     ; 1005 		if( (__timer1s%2) != pp[3] )
2379  013d c60000        	ld	a,___timer1s
2380  0140 a401          	and	a,#1
2381  0142 1106          	cp	a,(OFST-1,sp)
2382  0144 2713          	jreq	L547
2383                     ; 1007 			pp[3] = __timer1s%2;
2385  0146 c60000        	ld	a,___timer1s
2386  0149 a401          	and	a,#1
2387  014b 6b06          	ld	(OFST-1,sp),a
2389                     ; 1008 			if( pp[2] == 0 )
2391  014d 7b05          	ld	a,(OFST-2,sp)
2392  014f 260a          	jrne	L157
2393                     ; 1010 				pp[2] = 1;
2395  0151 4c            	inc	a
2396  0152 6b05          	ld	(OFST-2,sp),a
2398                     ; 1011 				device_adc();
2400  0154 cd0000        	call	_device_adc
2402  0157 2002          	jra	L157
2403  0159               L547:
2404                     ; 1015 			pp[2] = 0;
2406  0159 0f05          	clr	(OFST-2,sp)
2408  015b               L157:
2409                     ; 1017 		if( (__timer1s) != pp[1] )
2411  015b c60000        	ld	a,___timer1s
2412  015e 1104          	cp	a,(OFST-3,sp)
2413  0160 278c          	jreq	L746
2414                     ; 1019 			pp[1] = __timer1s;
2416  0162 6b04          	ld	(OFST-3,sp),a
2418                     ; 1021 			for( i=0; i<PACKET_SIZE; i++ )
2420  0164 4f            	clr	a
2421  0165 6b07          	ld	(OFST+0,sp),a
2423  0167               L557:
2424                     ; 1023 				if( packet_buf[i] != ui_timeout )
2426  0167 5f            	clrw	x
2427  0168 97            	ld	xl,a
2428  0169 d60017        	ld	a,(_packet_buf,x)
2429  016c c10004        	cp	a,_ui_timeout
2430  016f 2708          	jreq	L367
2431                     ; 1025 					packet_buf[i] += 1;
2433  0171 7b07          	ld	a,(OFST+0,sp)
2434  0173 5f            	clrw	x
2435  0174 97            	ld	xl,a
2436  0175 724c0017      	inc	(_packet_buf,x)
2437  0179               L367:
2438                     ; 1021 			for( i=0; i<PACKET_SIZE; i++ )
2440  0179 0c07          	inc	(OFST+0,sp)
2444  017b 7b07          	ld	a,(OFST+0,sp)
2445  017d a108          	cp	a,#8
2446  017f 25e6          	jrult	L557
2447                     ; 1028 			if( ui_error == 30 && ui_error_type == ERROR_TYPE_CNT )
2449  0181 c60001        	ld	a,_ui_error
2450  0184 a11e          	cp	a,#30
2451  0186 262d          	jrne	L567
2453  0188 c60002        	ld	a,_ui_error_type
2454  018b a102          	cp	a,#2
2455  018d 2626          	jrne	L567
2456                     ; 1030 				if( packet_buf[uiInfo.id - 1] < ui_timeout-1 )
2458  018f ad50          	call	LC014
2459  0191 5f            	clrw	x
2460  0192 97            	ld	xl,a
2461  0193 c60004        	ld	a,_ui_timeout
2462  0196 905f          	clrw	y
2463  0198 9097          	ld	yl,a
2464  019a 905a          	decw	y
2465  019c 90bf00        	ldw	c_y,y
2466  019f b300          	cpw	x,c_y
2467  01a1 2f03cc00ee    	jrsge	L746
2468                     ; 1032 					error_display_mode = 0;
2470  01a6 725f0000      	clr	_error_display_mode
2471                     ; 1033 					ui_error = 0;
2473  01aa 725f0001      	clr	_ui_error
2474                     ; 1034 					ui_error_type = 0;
2476  01ae 725f0002      	clr	_ui_error_type
2477  01b2 cc00ee        	jra	L746
2478  01b5               L567:
2479                     ; 1039 				if( packet_buf[uiInfo.id - 1] == ui_timeout )
2481  01b5 ad2a          	call	LC014
2482  01b7 c10004        	cp	a,_ui_timeout
2483  01ba 26f6          	jrne	L746
2484                     ; 1041 					error_display(ERROR_TYPE_CNT, 30);
2486  01bc ae021e        	ldw	x,#542
2487  01bf cd0000        	call	_error_display
2489                     ; 1042 					ui_timeout = 60;//PACKET_ERROR_COUNT;
2491  01c2 353c0004      	mov	_ui_timeout,#60
2492                     ; 1044 					for( i=0; i<PACKET_SIZE; i++ )
2494  01c6 4f            	clr	a
2495  01c7 6b07          	ld	(OFST+0,sp),a
2497  01c9               L577:
2498                     ; 1046 						packet_buf[i] = 60;//PACKET_ERROR_COUNT;
2500  01c9 5f            	clrw	x
2501  01ca 97            	ld	xl,a
2502  01cb a63c          	ld	a,#60
2503  01cd d70017        	ld	(_packet_buf,x),a
2504                     ; 1044 					for( i=0; i<PACKET_SIZE; i++ )
2506  01d0 0c07          	inc	(OFST+0,sp)
2510  01d2 7b07          	ld	a,(OFST+0,sp)
2511  01d4 a108          	cp	a,#8
2512  01d6 25f1          	jrult	L577
2513  01d8 cc00ee        	jra	L746
2514  01db               LC013:
2515  01db 5f            	clrw	x
2516  01dc 97            	ld	xl,a
2517  01dd d6540c        	ld	a,(21516,x)
2518  01e0 81            	ret	
2519  01e1               LC014:
2520  01e1 c60004        	ld	a,_uiInfo+4
2521  01e4 5f            	clrw	x
2522  01e5 97            	ld	xl,a
2523  01e6 5a            	decw	x
2524  01e7 d60017        	ld	a,(_packet_buf,x)
2525  01ea 81            	ret	
2712                     	xdef	_main
2713                     	xref	__add
2714                     	xdef	_timerEvent
2715                     	xdef	_timerEventClear
2716                     	xdef	___tim30min_reset
2717                     	xref	___timer1sa
2718                     	xref	__timFlag
2719                     	xref	__tim1min
2720                     	xref	__tim30min
2721                     	xdef	_device_adc
2722                     	xdef	_deviceCb
2723                     	xdef	___b
2724                     	xdef	__p
2725                     	xdef	__touchKey
2726                     	xref	_beepSet
2727                     	xref	__uart1_rx_tail
2728                     	xref	__uart1_rx_head
2729                     	xdef	__mkey
2730                     	xdef	__i0Prev
2731                     	xdef	__tcKeyPrev
2732                     	switch	.bss
2733  0000               __tcKey:
2734  0000 00            	ds.b	1
2735                     	xdef	__tcKey
2736  0001               _tc:
2737  0001 0000          	ds.b	2
2738                     	xdef	_tc
2739  0003               __tct10:
2740  0003 00            	ds.b	1
2741                     	xdef	__tct10
2742  0004               __tct0:
2743  0004 00            	ds.b	1
2744                     	xdef	__tct0
2745  0005               __tctimer100ms:
2746  0005 000000000000  	ds.b	6
2747                     	xdef	__tctimer100ms
2748  000b               __tctimer:
2749  000b 000000000000  	ds.b	6
2750                     	xdef	__tctimer
2751  0011               _tct:
2752  0011 000000000000  	ds.b	6
2753                     	xdef	_tct
2754                     	xdef	_tci
2755                     	xdef	_disp_key
2756                     	xref	__key_continue
2757                     	xdef	__iouartLoop
2758                     	xdef	__call_ptc_lse
2759                     	xdef	__call_ptc_woodang
2760                     	xdef	__msgLoop
2761                     	xdef	_getCurrTemp
2762                     	xdef	_ui_timeout
2763                     	xdef	_ui_error_type
2764                     	xdef	_ui_error
2765  0017               _packet_buf:
2766  0017 000000000000  	ds.b	8
2767                     	xdef	_packet_buf
2768                     	xdef	_currTemp
2769                     	xref	_error_display_mode
2770                     	xref	_only_one
2771                     	xref	__backup_backlight2
2772                     	xref	__backlight
2773                     	xref	__lcdTimer
2774                     	xdef	_ver
2775                     	xdef	_rc_type
2776                     	xref	_rc_ptc_make_mirror
2777                     	xref	_rc_ptc_make
2778                     	xref	_rc_ptc_make_setting
2779                     	xref	_getState_check
2780                     	xref	_rc_ptc_check
2781                     	xref	_rc_ptc_baseSet
2782                     	xref	_factory
2783                     	xref	___boiler_shower
2784                     	xref	__key_blink
2785                     	xref	__disp_mode
2786                     	xref	__dsCount
2787                     	xref	__ds
2788                     	xref	_ui_Open
2789                     	xref	___s
2790                     	xref	_disp_status
2791                     	xref	_lcd_disp_n
2792                     	xref	_lcd_clear
2793                     	xref	_iLF_DEF
2794                     	xref	_bLF_DEF
2795                     	xref	_uiInfo
2796                     	xref	_timerCalc
2797                     	xref	_systemTimer
2798                     	xref	___timer1h
2799                     	xref	___timer1min
2800                     	xref	___timer1s
2801                     	xref	___timer100ms
2802                     	xref	__t20ms
2803                     	xref	_systemUart
2804                     	xref	_uart1_get
2805                     	xref	_uart1_tx_put
2806                     	xref	_iouart_getReadBuffer
2807                     	xref	_iouart_getBuffer
2808                     	xref	_iouart_Ready
2809                     	xref	__io_tail
2810                     	xref	__io_head
2811                     	xref	_iouart_Pkt_Start
2812                     	xref	_iouart_Set_Packet
2813                     	xref	_iouart_Open
2814                     	xref	_indiIOUartIdle
2815                     	xref	_error_display
2816                     	xref	_systemLcd
2817                     	xref	_encoder_Open
2818                     	xdef	_disp_enc
2819                     	xdef	_disp_adc
2820                     	xref	_adcGet
2821                     	xref	_systemADC
2822                     	xref	_GPIO_Init
2823                     	xref	_CLK_PeripheralClockConfig
2824                     	xref	_CLK_BEEPClockConfig
2825                     	xref	_CLK_SYSCLKDivConfig
2826                     	xref	_CLK_GetSYSCLKSource
2827                     	xref	_CLK_SYSCLKSourceConfig
2828                     	xref	_BEEP_LSICalibrationConfig
2829                     	xref	_BEEP_Cmd
2830                     	xref	_BEEP_Init
2831                     	switch	.const
2832  000e               L521:
2833  000e 6500          	dc.b	"e",0
2834                     	xref.b	c_x
2835                     	xref.b	c_y
2855                     	xref	c_smodx
2856                     	end
