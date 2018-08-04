   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
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
 357                     ; 114 		if( i != 0 )
 359  0009 2705          	jreq	L121
 360                     ; 116 			p = iouart_getReadBuffer();
 362  000b cd0000        	call	_iouart_getReadBuffer
 364  000e 7b01          	ld	a,(OFST-2,sp)
 365  0010               L121:
 366                     ; 123 		if( i == 2 )	
 368  0010 a102          	cp	a,#2
 369  0012 260b          	jrne	L321
 370                     ; 125 			DISP("e", 1);
 372  0014 4b01          	push	#1
 373  0016 ae000e        	ldw	x,#L521
 374  0019 cd0000        	call	_uart1_tx_put
 376  001c 84            	pop	a
 377  001d 7b01          	ld	a,(OFST-2,sp)
 378  001f               L321:
 379                     ; 127 		if( i == 1 )
 381  001f 4a            	dec	a
 382  0020 2646          	jrne	L511
 383                     ; 130 			p = iouart_getReadBuffer();
 385  0022 cd0000        	call	_iouart_getReadBuffer
 387  0025 1f02          	ldw	(OFST-1,sp),x
 388                     ; 134 			if (rc_type == RC_TYPE_NONE) {
 390  0027 c60003        	ld	a,_rc_type
 391  002a 2637          	jrne	L131
 392                     ; 135 				if ((p[0] & 0xF0) == 0x00) 
 394  002c f6            	ld	a,(x)
 395  002d a5f0          	bcp	a,#240
 396                     ; 138 					rc_type = RC_TYPE_LSE;
 397                     ; 139 					return _call_ptc_lse();
 400  002f 2704          	jreq	LC003
 401                     ; 143 					if ((p[0] & 0x0F) == 0x00) {
 403  0031 a50f          	bcp	a,#15
 404  0033 260a          	jrne	L731
 405                     ; 145 						rc_type = RC_TYPE_LSE;
 407  0035               LC003:
 410  0035 35020003      	mov	_rc_type,#2
 411                     ; 146 						return _call_ptc_lse();
 413  0039               LC002:
 417  0039 cd0000        	call	__call_ptc_lse
 420  003c               L001:
 422  003c 5b03          	addw	sp,#3
 423  003e 81            	ret	
 424  003f               L731:
 425                     ; 149 						if ((p[0] & 0xF0) == 0x80 || 
 425                     ; 150 								(p[0] & 0xF0) == 0x90 || 
 425                     ; 151 								(p[0] & 0xF0) == 0xB0 ||
 425                     ; 152 								(p[0] & 0xF0) == 0xC0) {
 427  003f a4f0          	and	a,#240
 428  0041 a180          	cp	a,#128
 429  0043 27f0          	jreq	LC003
 431  0045 f6            	ld	a,(x)
 432  0046 a4f0          	and	a,#240
 433  0048 a190          	cp	a,#144
 434  004a 27e9          	jreq	LC003
 436  004c f6            	ld	a,(x)
 437  004d a4f0          	and	a,#240
 438  004f a1b0          	cp	a,#176
 439  0051 27e2          	jreq	LC003
 441  0053 f6            	ld	a,(x)
 442  0054 a4f0          	and	a,#240
 443  0056 a1c0          	cp	a,#192
 444                     ; 153 							rc_type = RC_TYPE_LSE;
 445                     ; 154 							return _call_ptc_lse();
 448  0058 27db          	jreq	LC003
 449                     ; 156 							rc_type = RC_TYPE_WOODANG;
 451  005a 35010003      	mov	_rc_type,#1
 452                     ; 157 						  return _call_ptc_woodang();
 454  005e               LC004:
 456  005e cd0000        	call	__call_ptc_woodang
 459  0061 20d9          	jra	L001
 460  0063               L131:
 461                     ; 161 			}else if (rc_type == RC_TYPE_WOODANG) {
 463  0063 4a            	dec	a
 464  0064 26d3          	jrne	LC002
 465                     ; 162 				return _call_ptc_woodang();
 468  0066 20f6          	jp	LC004
 469                     ; 164 				return _call_ptc_lse();
 472  0068               L511:
 473                     ; 111 	while( _io_head != _io_tail )
 475  0068 c60000        	ld	a,__io_head
 476  006b c10000        	cp	a,__io_tail
 477  006e 2694          	jrne	L311
 478                     ; 168 	return 0;
 480  0070 4f            	clr	a
 482  0071 20c9          	jra	L001
 526                     ; 176 void	disp_key(uint8_t k)
 526                     ; 177 {
 527                     .text:	section	.text,new
 528  0000               _disp_key:
 530  0000 88            	push	a
 531  0001 5205          	subw	sp,#5
 532       00000005      OFST:	set	5
 535                     ; 179 	buf[0] = '<';
 537  0003 a63c          	ld	a,#60
 538  0005 6b01          	ld	(OFST-4,sp),a
 539                     ; 180 	buf[2] = ':';
 541  0007 a63a          	ld	a,#58
 542  0009 6b03          	ld	(OFST-2,sp),a
 543                     ; 181 	buf[3] = '0' + _key_continue;
 545  000b c60000        	ld	a,__key_continue
 546  000e ab30          	add	a,#48
 547  0010 6b04          	ld	(OFST-1,sp),a
 548                     ; 182 	buf[4] = '>';
 550  0012 a63e          	ld	a,#62
 551  0014 6b05          	ld	(OFST+0,sp),a
 552                     ; 183 	if( k == 4 )		buf[1] = '4';
 554  0016 7b06          	ld	a,(OFST+1,sp)
 555  0018 a104          	cp	a,#4
 556  001a 2604          	jrne	L302
 559  001c a634          	ld	a,#52
 561  001e 2015          	jp	LC005
 562  0020               L302:
 563                     ; 184 	else if( k == 3 )	buf[1] = '3';
 565  0020 a103          	cp	a,#3
 566  0022 2604          	jrne	L702
 569  0024 a633          	ld	a,#51
 571  0026 200d          	jp	LC005
 572  0028               L702:
 573                     ; 185 	else if( k == 2 )	buf[1] = '2';
 575  0028 a102          	cp	a,#2
 576  002a 2604          	jrne	L312
 579  002c a632          	ld	a,#50
 581  002e 2005          	jp	LC005
 582  0030               L312:
 583                     ; 186 	else if( k == 1 )	buf[1] = '1';
 585  0030 4a            	dec	a
 586  0031 2606          	jrne	L712
 589  0033 a631          	ld	a,#49
 590  0035               LC005:
 591  0035 6b02          	ld	(OFST-3,sp),a
 593  0037 2004          	jra	L502
 594  0039               L712:
 595                     ; 188 		buf[2] = '?';
 597  0039 a63f          	ld	a,#63
 598  003b 6b03          	ld	(OFST-2,sp),a
 599  003d               L502:
 600                     ; 189 	DISP(buf, 5);
 602  003d 4b05          	push	#5
 603  003f 96            	ldw	x,sp
 604  0040 1c0002        	addw	x,#OFST-3
 605  0043 cd0000        	call	_uart1_tx_put
 607  0046 84            	pop	a
 608                     ; 190 }
 611  0047 5b06          	addw	sp,#6
 612  0049 81            	ret	
 662                     ; 192 void	disp_enc(uint8_t enc)
 662                     ; 193 {
 663                     .text:	section	.text,new
 664  0000               _disp_enc:
 666  0000 88            	push	a
 667  0001 5204          	subw	sp,#4
 668       00000004      OFST:	set	4
 671                     ; 196 	if( (enc & 0x40) != 0 )
 673  0003 a540          	bcp	a,#64
 674  0005 2704          	jreq	L542
 675                     ; 197 		buf[0] = '+';
 677  0007 a62b          	ld	a,#43
 679  0009 2002          	jra	L742
 680  000b               L542:
 681                     ; 199 		buf[0] = '-';
 683  000b a62d          	ld	a,#45
 684  000d               L742:
 685  000d 6b02          	ld	(OFST-2,sp),a
 686                     ; 201 	i = enc&0x0f;
 688  000f 7b05          	ld	a,(OFST+1,sp)
 689  0011 a40f          	and	a,#15
 690  0013 6b01          	ld	(OFST-3,sp),a
 691                     ; 202 	buf[1] = '0' + i/10;
 693  0015 5f            	clrw	x
 694  0016 97            	ld	xl,a
 695  0017 a60a          	ld	a,#10
 696  0019 62            	div	x,a
 697  001a 9f            	ld	a,xl
 698  001b ab30          	add	a,#48
 699  001d 6b03          	ld	(OFST-1,sp),a
 700                     ; 203 	buf[2] = '0' + i%10;
 702  001f 5f            	clrw	x
 703  0020 7b01          	ld	a,(OFST-3,sp)
 704  0022 97            	ld	xl,a
 705  0023 a60a          	ld	a,#10
 706  0025 62            	div	x,a
 707  0026 ab30          	add	a,#48
 708  0028 6b04          	ld	(OFST+0,sp),a
 709                     ; 204 	DISP(buf, 3);
 711  002a 4b03          	push	#3
 712  002c 96            	ldw	x,sp
 713  002d 1c0003        	addw	x,#OFST-1
 714  0030 cd0000        	call	_uart1_tx_put
 716  0033 84            	pop	a
 717                     ; 205 }
 720  0034 5b05          	addw	sp,#5
 721  0036 81            	ret	
 753                     ; 207 void	disp_adc(uint8_t i)
 753                     ; 208 {
 754                     .text:	section	.text,new
 755  0000               _disp_adc:
 759                     ; 218 }
 762  0000 81            	ret	
 765                     	switch	.data
 766  0005               _tci:
 767  0005 00            	dc.b	0
 768  0006               __tcKeyPrev:
 769  0006 ff            	dc.b	255
 770  0007               __i0Prev:
 771  0007 ff            	dc.b	255
 772  0008               __mkey:
 773  0008 ff            	dc.b	255
 821                     ; 252 uint8_t	_touchKey(uint8_t i, uint8_t mask, uint8_t key)
 821                     ; 253 {
 822                     .text:	section	.text,new
 823  0000               __touchKey:
 825  0000 89            	pushw	x
 826       00000000      OFST:	set	0
 829                     ; 254 	if( tc[0] & mask )
 831  0001 9f            	ld	a,xl
 832  0002 c40001        	and	a,_tc
 833  0005 272e          	jreq	L503
 834                     ; 256 		if( tct[i] == 0 )
 836  0007 7b01          	ld	a,(OFST+1,sp)
 837  0009 5f            	clrw	x
 838  000a 97            	ld	xl,a
 839  000b 724d0011      	tnz	(_tct,x)
 840  000f 260f          	jrne	L703
 841                     ; 258 			tct[i] = 1;
 843  0011 5f            	clrw	x
 844  0012 97            	ld	xl,a
 845  0013 a601          	ld	a,#1
 846  0015 d70011        	ld	(_tct,x),a
 847                     ; 259 			_tctimer[i] = 0;
 849  0018 7b01          	ld	a,(OFST+1,sp)
 850  001a ad2a          	call	LC006
 851  001c 724f0005      	clr	(__tctimer100ms,x)
 852  0020               L703:
 853                     ; 262 		if( _tctimer[i] >= 10 )
 855  0020 5f            	clrw	x
 856  0021 97            	ld	xl,a
 857  0022 d6000b        	ld	a,(__tctimer,x)
 858  0025 a10a          	cp	a,#10
 859  0027 2508          	jrult	L113
 860                     ; 264 			_tctimer[i] = 0;
 862  0029 7b01          	ld	a,(OFST+1,sp)
 863  002b ad19          	call	LC006
 864  002d 724c0005      	inc	(__tctimer100ms,x)
 865  0031               L113:
 866                     ; 267 		return key;
 868  0031 7b05          	ld	a,(OFST+5,sp)
 870  0033 200f          	jra	L611
 871  0035               L503:
 872                     ; 271 		tct[i] = 0;
 874  0035 7b01          	ld	a,(OFST+1,sp)
 875  0037 5f            	clrw	x
 876  0038 97            	ld	xl,a
 877  0039 724f0011      	clr	(_tct,x)
 878                     ; 272 		_tctimer[i] = 0;
 880  003d ad07          	call	LC006
 881  003f 724f0005      	clr	(__tctimer100ms,x)
 882                     ; 275 	return 0;
 884  0043 4f            	clr	a
 886  0044               L611:
 888  0044 85            	popw	x
 889  0045 81            	ret	
 890  0046               LC006:
 891  0046 5f            	clrw	x
 892  0047 97            	ld	xl,a
 893  0048 724f000b      	clr	(__tctimer,x)
 894                     ; 273 		_tctimer100ms[i] = 0;
 896  004c 5f            	clrw	x
 897  004d 97            	ld	xl,a
 898  004e 81            	ret	
 901                     	switch	.data
 902  0009               __p:
 903  0009 00            	dc.b	0
 937                     ; 331 void	__b(uint8_t k)
 937                     ; 332 {
 938                     .text:	section	.text,new
 939  0000               ___b:
 943                     ; 333 	lcd_clear(0);
 945  0000 4f            	clr	a
 946  0001 cd0000        	call	_lcd_clear
 948                     ; 341 LCD_BIT_SET(_p);
 950  0004 c60009        	ld	a,__p
 951  0007 5f            	clrw	x
 952  0008 97            	ld	xl,a
 953  0009 d60000        	ld	a,(_iLF_DEF,x)
 954  000c 5f            	clrw	x
 955  000d 97            	ld	xl,a
 956  000e c60009        	ld	a,__p
 957  0011 905f          	clrw	y
 958  0013 9097          	ld	yl,a
 959  0015 d6540c        	ld	a,(21516,x)
 960  0018 90da0000      	or	a,(_bLF_DEF,y)
 961  001c d7540c        	ld	(21516,x),a
 962                     ; 342 	_p++;
 964  001f 725c0009      	inc	__p
 965                     ; 343 }
 968  0023 81            	ret	
1044                     ; 345 void	deviceCb(void)
1044                     ; 346 {
1045                     .text:	section	.text,new
1046  0000               _deviceCb:
1048  0000 5204          	subw	sp,#4
1049       00000004      OFST:	set	4
1052                     ; 347 	uint8_t	lcd = 0;
1054  0002 0f01          	clr	(OFST-3,sp)
1055                     ; 422 	if( _tct0 == _t20ms )
1057  0004 c60004        	ld	a,__tct0
1058  0007 c10000        	cp	a,__t20ms
1059  000a 2603cc02b4    	jreq	L471
1060                     ; 423 		return;
1062                     ; 425 	_tct0 = _t20ms;
1064  000f 5500000004    	mov	__tct0,__t20ms
1065                     ; 426 	for( i=0; i<6; i++ )
1067  0014 4f            	clr	a
1068  0015 6b04          	ld	(OFST+0,sp),a
1069  0017               L363:
1070                     ; 428 		if( tct[i]==1 )
1072  0017 5f            	clrw	x
1073  0018 97            	ld	xl,a
1074  0019 d60011        	ld	a,(_tct,x)
1075  001c 4a            	dec	a
1076  001d 2608          	jrne	L173
1077                     ; 429 			_tctimer[i]++;
1079  001f 7b04          	ld	a,(OFST+0,sp)
1080  0021 5f            	clrw	x
1081  0022 97            	ld	xl,a
1082  0023 724c000b      	inc	(__tctimer,x)
1083  0027               L173:
1084                     ; 426 	for( i=0; i<6; i++ )
1086  0027 0c04          	inc	(OFST+0,sp)
1089  0029 7b04          	ld	a,(OFST+0,sp)
1090  002b a106          	cp	a,#6
1091  002d 25e8          	jrult	L363
1092                     ; 432 	if( _uart1_rx_tail == _uart1_rx_head )
1094  002f c60000        	ld	a,__uart1_rx_tail
1095  0032 c10000        	cp	a,__uart1_rx_head
1096  0035 2703cc0273    	jrne	L704
1097                     ; 434 		_tct10++;
1099  003a 725c0003      	inc	__tct10
1100                     ; 435 		if( _tct10 >= 5 )
1102  003e c60003        	ld	a,__tct10
1103  0041 a105          	cp	a,#5
1104  0043 25f2          	jrult	L704
1105                     ; 437 			for( i=0; i<6; i++ )
1107  0045 4f            	clr	a
1108  0046 6b04          	ld	(OFST+0,sp),a
1109  0048               L773:
1110                     ; 438 				tct[i] = 0;
1112  0048 5f            	clrw	x
1113  0049 97            	ld	xl,a
1114  004a 724f0011      	clr	(_tct,x)
1115                     ; 437 			for( i=0; i<6; i++ )
1117  004e 0c04          	inc	(OFST+0,sp)
1120  0050 7b04          	ld	a,(OFST+0,sp)
1121  0052 a106          	cp	a,#6
1122  0054 25f2          	jrult	L773
1123                     ; 439 			_tct10 = 0;
1125  0056 725f0003      	clr	__tct10
1126                     ; 440 			_tcKeyPrev = 0xff;
1128  005a 35ff0006      	mov	__tcKeyPrev,#255
1129                     ; 441 			_mkey = 0xff;
1131  005e 35ff0008      	mov	__mkey,#255
1132  0062 cc0273        	jra	L704
1133  0065               L504:
1134                     ; 448 		i = uart1_get();
1136  0065 cd0000        	call	_uart1_get
1138  0068 6b04          	ld	(OFST+0,sp),a
1139                     ; 449 		if( i != 0xff )
1141  006a 4c            	inc	a
1142  006b 2603cc0270    	jreq	L314
1143                     ; 451 			tc[tci] = i;
1145  0070 c60005        	ld	a,_tci
1146  0073 5f            	clrw	x
1147  0074 97            	ld	xl,a
1148  0075 7b04          	ld	a,(OFST+0,sp)
1149  0077 d70001        	ld	(_tc,x),a
1150                     ; 452 			tci = tci==0 ? 1 : 0;
1152  007a 725d0005      	tnz	_tci
1153  007e 2604          	jrne	L031
1154  0080 a601          	ld	a,#1
1155  0082 2001          	jra	L231
1156  0084               L031:
1157  0084 4f            	clr	a
1158  0085               L231:
1159  0085 c70005        	ld	_tci,a
1160                     ; 453 			if( tci != 0 )
1162  0088 725d0005      	tnz	_tci
1163  008c 26d4          	jrne	L704
1164                     ; 454 				continue;
1166                     ; 456 			i = tc[0] + tc[1];
1168  008e c60002        	ld	a,_tc+1
1169  0091 cb0001        	add	a,_tc
1170  0094 6b04          	ld	(OFST+0,sp),a
1171                     ; 457 			if( i != 0xff )
1173  0096 4c            	inc	a
1174  0097 26c9          	jrne	L704
1175                     ; 458 				continue;
1177                     ; 460 			_tct10 = 0;
1179  0099 c70003        	ld	__tct10,a
1180                     ; 462 			_tcKey = _touchKey(0, 0x01, 0x20);
1182  009c 4b20          	push	#32
1183  009e ae0001        	ldw	x,#1
1184  00a1 cd0000        	call	__touchKey
1186  00a4 5b01          	addw	sp,#1
1187  00a6 c70000        	ld	__tcKey,a
1188                     ; 463 			_tcKey |= _touchKey(1, 0x02, 0x02);
1190  00a9 4b02          	push	#2
1191  00ab ae0102        	ldw	x,#258
1192  00ae cd0000        	call	__touchKey
1194  00b1 5b01          	addw	sp,#1
1195  00b3 ca0000        	or	a,__tcKey
1196  00b6 c70000        	ld	__tcKey,a
1197                     ; 464 			_tcKey |= _touchKey(2, 0x04, 0x08);
1199  00b9 4b08          	push	#8
1200  00bb ae0204        	ldw	x,#516
1201  00be cd0000        	call	__touchKey
1203  00c1 5b01          	addw	sp,#1
1204  00c3 ca0000        	or	a,__tcKey
1205  00c6 c70000        	ld	__tcKey,a
1206                     ; 465 			_tcKey |= _touchKey(3, 0x08, 0x04);
1208  00c9 4b04          	push	#4
1209  00cb ae0308        	ldw	x,#776
1210  00ce cd0000        	call	__touchKey
1212  00d1 5b01          	addw	sp,#1
1213  00d3 ca0000        	or	a,__tcKey
1214  00d6 c70000        	ld	__tcKey,a
1215                     ; 466 			_tcKey |= _touchKey(4, 0x10, 0x10);
1217  00d9 4b10          	push	#16
1218  00db ae0410        	ldw	x,#1040
1219  00de cd0000        	call	__touchKey
1221  00e1 5b01          	addw	sp,#1
1222  00e3 ca0000        	or	a,__tcKey
1223  00e6 c70000        	ld	__tcKey,a
1224                     ; 467 			_tcKey |= _touchKey(5, 0x20, 0x01);
1226  00e9 4b01          	push	#1
1227  00eb ae0520        	ldw	x,#1312
1228  00ee cd0000        	call	__touchKey
1230  00f1 5b01          	addw	sp,#1
1231  00f3 ca0000        	or	a,__tcKey
1232  00f6 c70000        	ld	__tcKey,a
1233                     ; 469 			if( _tcKey == 0 )
1235  00f9 725d0000      	tnz	__tcKey
1236  00fd 2607          	jrne	L124
1237                     ; 471 				_tcKeyPrev = 0xff;
1239  00ff 35ff0006      	mov	__tcKeyPrev,#255
1240                     ; 472 				continue;
1242  0103 cc0273        	jra	L704
1243  0106               L124:
1244                     ; 475 			j = 0;
1246  0106 0f03          	clr	(OFST-1,sp)
1247                     ; 476 			i0 = 0xff;
1249  0108 a6ff          	ld	a,#255
1250  010a 6b02          	ld	(OFST-2,sp),a
1251                     ; 477 			for( i=0; i<6; i++ )
1253  010c 4f            	clr	a
1254  010d 6b04          	ld	(OFST+0,sp),a
1255  010f               L324:
1256                     ; 479 				if( tct[i]==1 )
1258  010f 5f            	clrw	x
1259  0110 97            	ld	xl,a
1260  0111 d60011        	ld	a,(_tct,x)
1261  0114 4a            	dec	a
1262  0115 2606          	jrne	L134
1263                     ; 481 					j++;
1265  0117 0c03          	inc	(OFST-1,sp)
1266                     ; 482 					i0 = i;
1268  0119 7b04          	ld	a,(OFST+0,sp)
1269  011b 6b02          	ld	(OFST-2,sp),a
1270  011d               L134:
1271                     ; 477 			for( i=0; i<6; i++ )
1273  011d 0c04          	inc	(OFST+0,sp)
1276  011f 7b04          	ld	a,(OFST+0,sp)
1277  0121 a106          	cp	a,#6
1278  0123 25ea          	jrult	L324
1279                     ; 487 			if( j >= 3 && _mkey != 0xff )
1281  0125 7b03          	ld	a,(OFST-1,sp)
1282  0127 a103          	cp	a,#3
1283  0129 2516          	jrult	L334
1285  012b c60008        	ld	a,__mkey
1286  012e 4c            	inc	a
1287  012f 2710          	jreq	L334
1288                     ; 489 				if( _tcKey == 0x55 )		goto K_55;
1290  0131 c60000        	ld	a,__tcKey
1291  0134 a155          	cp	a,#85
1292  0136 2736          	jreq	L133
1295                     ; 490 				if( _tcKey == 0x53 )		goto K_53;
1297  0138 c60000        	ld	a,__tcKey
1298  013b a153          	cp	a,#83
1299  013d 26c4          	jrne	L704
1302  013f 2060          	jra	L333
1303  0141               L334:
1304                     ; 493 			if( j == 1 && _mkey != 0xff )
1306  0141 7b03          	ld	a,(OFST-1,sp)
1307  0143 4a            	dec	a
1308  0144 2616          	jrne	L144
1310  0146 c60008        	ld	a,__mkey
1311  0149 4c            	inc	a
1312  014a 2710          	jreq	L144
1313                     ; 495 				if( _tcKey == 0x55 )		goto K_55;
1315  014c c60000        	ld	a,__tcKey
1316  014f a155          	cp	a,#85
1317  0151 271b          	jreq	L133
1320                     ; 496 				if( _tcKey == 0x53 )		goto K_53;
1322  0153 c60000        	ld	a,__tcKey
1323  0156 a153          	cp	a,#83
1324  0158 26a9          	jrne	L704
1327  015a 2045          	jra	L333
1328  015c               L144:
1329                     ; 499 			if( j == 2 )
1331  015c 7b03          	ld	a,(OFST-1,sp)
1332  015e a102          	cp	a,#2
1333  0160 266c          	jrne	L744
1334                     ; 503 				if( tct[2] == 1 )
1336  0162 c60013        	ld	a,_tct+2
1337  0165 4a            	dec	a
1338  0166 2669          	jrne	L533
1339                     ; 505 					if( tct[5] == 1 )
1341  0168 c60016        	ld	a,_tct+5
1342  016b 4a            	dec	a
1343  016c 262d          	jrne	L354
1344  016e               L133:
1345                     ; 507 K_55:						
1345                     ; 508 						//	ID
1345                     ; 509 						_tcKey = 0x55;
1347  016e 35550000      	mov	__tcKey,#85
1348                     ; 510 						_mkey = 0x24;
1350  0172 35240008      	mov	__mkey,#36
1351                     ; 511 						if( _tcKey != _tcKeyPrev )
1353  0176 c60000        	ld	a,__tcKey
1354  0179 c10006        	cp	a,__tcKeyPrev
1355  017c 270d          	jreq	L554
1356                     ; 513 							_tcKeyPrev = _tcKey;
1358  017e 5500000006    	mov	__tcKeyPrev,__tcKey
1359                     ; 514 							_i0Prev = i0;
1361  0183 7b02          	ld	a,(OFST-2,sp)
1362  0185 cd02c0        	call	LC011
1363                     ; 516 							_key_continue = 0;
1364  0188 cc0273        	jra	L704
1365  018b               L554:
1366                     ; 521 							if( _tctimer100ms[_i0Prev] > 35 )//TIME_LONG_TOUCH )
1368  018b cd02b7        	call	LC010
1369  018e a124          	cp	a,#36
1370  0190 25f6          	jrult	L704
1371                     ; 523 								_key_continue = 1;
1373  0192 35010000      	mov	__key_continue,#1
1374                     ; 524 								disp_status(0x55);
1376  0196 a655          	ld	a,#85
1378                     ; 525 								_tctimer100ms[_i0Prev] = 0;
1379  0198 cc0262        	jp	LC007
1380  019b               L354:
1381                     ; 531 					else if( tct[1] == 1 )
1383  019b c60012        	ld	a,_tct+1
1384  019e 4a            	dec	a
1385  019f 2630          	jrne	L533
1386  01a1               L333:
1387                     ; 533 K_53:						
1387                     ; 534 						//	Option
1387                     ; 535 						_tcKey = 0x53;
1389  01a1 35530000      	mov	__tcKey,#83
1390                     ; 536 						_mkey = 0x60;
1392  01a5 35600008      	mov	__mkey,#96
1393                     ; 537 						if( _tcKey != _tcKeyPrev )
1395  01a9 c60000        	ld	a,__tcKey
1396  01ac c10006        	cp	a,__tcKeyPrev
1397  01af 270d          	jreq	L764
1398                     ; 539 							_tcKeyPrev = _tcKey;
1400  01b1 5500000006    	mov	__tcKeyPrev,__tcKey
1401                     ; 540 							_i0Prev = i0;
1403  01b6 7b02          	ld	a,(OFST-2,sp)
1404  01b8 cd02c0        	call	LC011
1405                     ; 542 							_key_continue = 0;
1406  01bb cc0273        	jra	L704
1407  01be               L764:
1408                     ; 547 							if( _tctimer100ms[_i0Prev] > 35 )//TIME_LONG_TOUCH )
1410  01be cd02b7        	call	LC010
1411  01c1 a124          	cp	a,#36
1412  01c3 25f6          	jrult	L704
1413                     ; 549 								_key_continue = 1;
1415  01c5 35010000      	mov	__key_continue,#1
1416                     ; 550 								disp_status(0x53);
1418  01c9 a653          	ld	a,#83
1420                     ; 551 								_tctimer100ms[_i0Prev] = 0;
1421  01cb cc0262        	jp	LC007
1422  01ce               L744:
1423                     ; 560 			if( j != 1 )
1425  01ce 4a            	dec	a
1426  01cf 2714          	jreq	L574
1427  01d1               L533:
1428                     ; 562 CLEAR_KEY_ENTRY:
1428                     ; 563 				for( i=0; i<6; i++ )
1430  01d1 4f            	clr	a
1431  01d2 6b04          	ld	(OFST+0,sp),a
1432  01d4               L774:
1433                     ; 564 					tct[i] = 0;
1435  01d4 5f            	clrw	x
1436  01d5 97            	ld	xl,a
1437  01d6 724f0011      	clr	(_tct,x)
1438                     ; 563 				for( i=0; i<6; i++ )
1440  01da 0c04          	inc	(OFST+0,sp)
1443  01dc 7b04          	ld	a,(OFST+0,sp)
1444  01de a106          	cp	a,#6
1445  01e0 25f2          	jrult	L774
1446                     ; 565 				continue;
1448  01e2 cc0273        	jra	L704
1449  01e5               L574:
1450                     ; 568 			if( _tcKeyPrev != _tcKey )
1452  01e5 c60006        	ld	a,__tcKeyPrev
1453  01e8 c10000        	cp	a,__tcKey
1454  01eb 2745          	jreq	L505
1455                     ; 570 				_tcKeyPrev = _tcKey;
1457  01ed 5500000006    	mov	__tcKeyPrev,__tcKey
1458                     ; 571 				_i0Prev = i0;
1460  01f2 7b02          	ld	a,(OFST-2,sp)
1461  01f4 cd02c0        	call	LC011
1462                     ; 575 					_lcdTimer[0] = 0;
1464  01f7 725f0000      	clr	__lcdTimer
1465                     ; 576 					_lcdTimer[2] = __timer1s;
1467  01fb 5500000002    	mov	__lcdTimer+2,___timer1s
1468                     ; 577 					if( _lcdTimer[1] == 2 )
1470  0200 c60001        	ld	a,__lcdTimer+1
1471  0203 a102          	cp	a,#2
1472  0205 260a          	jrne	L705
1473                     ; 580 						_lcdTimer[1] = 3;
1475  0207 cd02cd        	call	LC012
1476                     ; 584 						_uart1_rx_tail = _uart1_rx_head;
1478  020a 5500000000    	mov	__uart1_rx_tail,__uart1_rx_head
1480  020f 2062          	jra	L704
1481  0211               L705:
1482                     ; 587 					else if( _lcdTimer[1] == 3 )
1484  0211 a103          	cp	a,#3
1485  0213 2612          	jrne	L315
1486                     ; 589 						_tcKeyPrev = 0xff;
1488  0215 35ff0006      	mov	__tcKeyPrev,#255
1489                     ; 590 						if( _lcdTimer[3] == __timer100ms )
1491  0219 c60003        	ld	a,__lcdTimer+3
1492  021c c10000        	cp	a,___timer100ms
1493  021f 2752          	jreq	L704
1495                     ; 595 							_lcdTimer[1] = 0;
1497  0221 725f0001      	clr	__lcdTimer+1
1498  0225 204c          	jra	L704
1499  0227               L315:
1500                     ; 612 						_lcdTimer[1] = 3;
1502  0227 cd02cd        	call	LC012
1503                     ; 616 						disp_status(_tcKey);
1505  022a c60000        	ld	a,__tcKey
1506  022d cd0000        	call	_disp_status
1508  0230 2041          	jra	L704
1509  0232               L505:
1510                     ; 621 				if (_tcKeyPrev == 0x10 || _tcKeyPrev == 0x20) {
1512  0232 c60006        	ld	a,__tcKeyPrev
1513  0235 a110          	cp	a,#16
1514  0237 2707          	jreq	L725
1516  0239 c60006        	ld	a,__tcKeyPrev
1517  023c a120          	cp	a,#32
1518  023e 2608          	jrne	L525
1519  0240               L725:
1520                     ; 622 					if( _tctimer100ms[_i0Prev] > 2 )
1522  0240 ad75          	call	LC010
1523  0242 a103          	cp	a,#3
1524  0244 252d          	jrult	L704
1525                     ; 624 						disp_status(_tcKeyPrev);
1527                     ; 625 						_tctimer100ms[_i0Prev] = 0;
1528  0246 2017          	jp	LC008
1529  0248               L525:
1530                     ; 628 					if( _tcKeyPrev == 0x04 )
1532  0248 c60006        	ld	a,__tcKeyPrev
1533  024b a104          	cp	a,#4
1534  024d 2606          	jrne	L535
1535                     ; 631 						if( _tctimer100ms[_i0Prev] > 30 /*TIME_LONG_TOUCH*/ )
1537  024f ad66          	call	LC010
1538  0251 a11f          	cp	a,#31
1539                     ; 633 							_key_continue = 1;
1540                     ; 634 							disp_status(_tcKeyPrev);
1542                     ; 635 							_tctimer100ms[_i0Prev] = 0;
1543  0253 2004          	jp	LC009
1544  0255               L535:
1545                     ; 640 						if( _tctimer100ms[_i0Prev] > TIME_LONG_TOUCH )
1547  0255 ad60          	call	LC010
1548  0257 a129          	cp	a,#41
1549                     ; 642 							_key_continue = 1;
1551  0259               LC009:
1552  0259 2518          	jrult	L704
1554  025b 35010000      	mov	__key_continue,#1
1555                     ; 643 							disp_status(_tcKeyPrev);
1557  025f               LC008:
1560  025f c60006        	ld	a,__tcKeyPrev
1562                     ; 644 							_tctimer100ms[_i0Prev] = 0;
1564  0262               LC007:
1565  0262 cd0000        	call	_disp_status
1570  0265 c60007        	ld	a,__i0Prev
1571  0268 5f            	clrw	x
1572  0269 97            	ld	xl,a
1573  026a 724f0005      	clr	(__tctimer100ms,x)
1574  026e 2003          	jra	L704
1575  0270               L314:
1576                     ; 651 			tci = 0;
1578  0270 c70005        	ld	_tci,a
1579  0273               L704:
1580                     ; 446 	while( _uart1_rx_tail != _uart1_rx_head )
1582  0273 c60000        	ld	a,__uart1_rx_tail
1583  0276 c10000        	cp	a,__uart1_rx_head
1584  0279 2703cc0065    	jrne	L504
1585                     ; 653 	if( _lcdTimer[2] != __timer1s )
1587  027e c60002        	ld	a,__lcdTimer+2
1588  0281 c10000        	cp	a,___timer1s
1589  0284 272a          	jreq	L745
1590                     ; 655 		_lcdTimer[2] = __timer1s;
1592  0286 5500000002    	mov	__lcdTimer+2,___timer1s
1593                     ; 656 		_lcdTimer[0]++;
1595  028b 725c0000      	inc	__lcdTimer
1596                     ; 657 		if( _lcdTimer[0] >= 8 )
1598  028f c60000        	ld	a,__lcdTimer
1599  0292 a108          	cp	a,#8
1600  0294 251a          	jrult	L745
1601                     ; 659 			if( _lcdTimer[1] == 0 || _lcdTimer[1] == 3 )
1603  0296 c60001        	ld	a,__lcdTimer+1
1604  0299 2704          	jreq	L555
1606  029b a103          	cp	a,#3
1607  029d 2608          	jrne	L355
1608  029f               L555:
1609                     ; 662 				_lcdTimer[1] = 2;
1611  029f 35020001      	mov	__lcdTimer+1,#2
1612                     ; 663 				_backup_backlight2 = 0;
1614  02a3 725f0000      	clr	__backup_backlight2
1615  02a7               L355:
1616                     ; 666 			_lcdTimer[0] = 0;
1618  02a7 725f0000      	clr	__lcdTimer
1619                     ; 667 			_lcdTimer[3] = __timer100ms;
1621  02ab 5500000003    	mov	__lcdTimer+3,___timer100ms
1622  02b0               L745:
1623                     ; 671 	disp_status(0);
1625  02b0 4f            	clr	a
1626  02b1 cd0000        	call	_disp_status
1628                     ; 673 }
1629  02b4               L471:
1632  02b4 5b04          	addw	sp,#4
1633  02b6 81            	ret	
1634  02b7               LC010:
1635  02b7 c60007        	ld	a,__i0Prev
1636  02ba 5f            	clrw	x
1637  02bb 97            	ld	xl,a
1638  02bc d60005        	ld	a,(__tctimer100ms,x)
1639  02bf 81            	ret	
1640  02c0               LC011:
1641  02c0 c70007        	ld	__i0Prev,a
1642                     ; 515 							beepSet(4);			
1644  02c3 a604          	ld	a,#4
1645  02c5 cd0000        	call	_beepSet
1647                     ; 516 							_key_continue = 0;
1649  02c8 725f0000      	clr	__key_continue
1650  02cc 81            	ret	
1651  02cd               LC012:
1652  02cd 35030001      	mov	__lcdTimer+1,#3
1653                     ; 613 						_lcdTimer[3] = __timer100ms;
1655  02d1 5500000003    	mov	__lcdTimer+3,___timer100ms
1656                     ; 614 						_backup_backlight2 = BACKLIGHT_MAX_LEVEL;
1658  02d6 35600000      	mov	__backup_backlight2,#96
1659  02da 81            	ret	
1694                     ; 675 void	device_adc(void)
1694                     ; 676 {
1695                     .text:	section	.text,new
1696  0000               _device_adc:
1698  0000 88            	push	a
1699       00000001      OFST:	set	1
1702                     ; 678 	i = adcGet(0);
1704  0001 4f            	clr	a
1705  0002 cd0000        	call	_adcGet
1707  0005 6b01          	ld	(OFST+0,sp),a
1708                     ; 679 	if( i != currTemp )
1710  0007 c10000        	cp	a,_currTemp
1711  000a 2706          	jreq	L375
1712                     ; 681 		currTemp = i;
1714  000c c70000        	ld	_currTemp,a
1715                     ; 682 		disp_adc(i);
1717  000f cd0000        	call	_disp_adc
1719  0012               L375:
1720                     ; 684 }
1723  0012 84            	pop	a
1724  0013 81            	ret	
1727                     	switch	.data
1728  000a               ___tim30min_reset:
1729  000a 00            	dc.b	0
1753                     ; 693 uint8_t timerEventClear(void) {
1754                     .text:	section	.text,new
1755  0000               _timerEventClear:
1759                     ; 694 	__timer1sa = 0;
1761  0000 725f0000      	clr	___timer1sa
1762                     ; 695 	__timer1min = 0;
1764  0004 725f0000      	clr	___timer1min
1765                     ; 696 	__timer1h = 0 ;
1767  0008 725f0000      	clr	___timer1h
1768                     ; 697 }
1771  000c 81            	ret	
1804                     ; 708 void	timerEvent(void)
1804                     ; 709 {
1805                     .text:	section	.text,new
1806  0000               _timerEvent:
1808       00000002      OFST:	set	2
1811                     ; 710 	_tim1min++;
1813  0000 725c0000      	inc	__tim1min
1814  0004 89            	pushw	x
1815                     ; 711 	if( (_tim1min%30) == 0 )
1817  0005 c60000        	ld	a,__tim1min
1818  0008 5f            	clrw	x
1819  0009 97            	ld	xl,a
1820  000a a61e          	ld	a,#30
1821  000c cd0000        	call	c_smodx
1823  000f 5d            	tnzw	x
1824  0010 2615          	jrne	L516
1825                     ; 713 		if( _tim30min != 0xff )
1827  0012 c60000        	ld	a,__tim30min
1828  0015 4c            	inc	a
1829  0016 2713          	jreq	L326
1830                     ; 715 			if( __tim30min_reset == 0 )
1832  0018 c6000a        	ld	a,___tim30min_reset
1833  001b 260e          	jrne	L326
1834                     ; 717 				__tim30min_reset = 1;
1836  001d 3501000a      	mov	___tim30min_reset,#1
1837                     ; 718 				_tim30min++;
1839  0021 725c0000      	inc	__tim30min
1840  0025 2004          	jra	L326
1841  0027               L516:
1842                     ; 723 		__tim30min_reset = 0;
1844  0027 725f000a      	clr	___tim30min_reset
1845  002b               L326:
1846                     ; 725 	if( __boiler_shower[5] == 1 )
1848  002b c60005        	ld	a,___boiler_shower+5
1849  002e 4a            	dec	a
1850  002f 260f          	jrne	L526
1851                     ; 727 		__boiler_shower[4]++;
1853  0031 725c0004      	inc	___boiler_shower+4
1854                     ; 728 		if( __boiler_shower[4] >= /*21*/90 )
1856  0035 c60004        	ld	a,___boiler_shower+4
1857  0038 a15a          	cp	a,#90
1858  003a 2504          	jrult	L526
1859                     ; 731 			__boiler_shower[5] = 0x80;
1861  003c 35800005      	mov	___boiler_shower+5,#128
1862  0040               L526:
1863                     ; 735 	if( _disp_mode == 0x10 )
1865  0040 c60000        	ld	a,__disp_mode
1866  0043 a110          	cp	a,#16
1867  0045 2635          	jrne	L136
1868                     ; 758 		if( _timFlag == 0 )
1870  0047 c60000        	ld	a,__timFlag
1871  004a 2612          	jrne	L336
1872                     ; 760 			if( uiInfo.repeat == _tim1min )
1874  004c c6000c        	ld	a,_uiInfo+12
1875  004f c10000        	cp	a,__tim1min
1876  0052 2628          	jrne	L136
1877                     ; 762 				_tim1min = 0;
1879  0054 725f0000      	clr	__tim1min
1880                     ; 764 				_timFlag = 1;
1882  0058 35010000      	mov	__timFlag,#1
1883  005c 201e          	jra	L136
1884  005e               L336:
1885                     ; 769 			if( (_TIME_REPEAT_BASE-uiInfo.repeat) == _tim1min )
1887  005e c60000        	ld	a,__tim1min
1888  0061 5f            	clrw	x
1889  0062 97            	ld	xl,a
1890  0063 1f01          	ldw	(OFST-1,sp),x
1891  0065 4f            	clr	a
1892  0066 97            	ld	xl,a
1893  0067 a63c          	ld	a,#60
1894  0069 c0000c        	sub	a,_uiInfo+12
1895  006c 2401          	jrnc	L012
1896  006e 5a            	decw	x
1897  006f               L012:
1898  006f 02            	rlwa	x,a
1899  0070 1301          	cpw	x,(OFST-1,sp)
1900  0072 2608          	jrne	L136
1901                     ; 771 				_tim1min = 0;
1903  0074 725f0000      	clr	__tim1min
1904                     ; 773 				_timFlag = 0;
1906  0078 725f0000      	clr	__timFlag
1907  007c               L136:
1908                     ; 778 	if( _disp_mode == 0x08 )
1910  007c c60000        	ld	a,__disp_mode
1911  007f a108          	cp	a,#8
1912  0081 2618          	jrne	L346
1913                     ; 781 		if( uiInfo.reserve == _tim30min )
1915  0083 c6000d        	ld	a,_uiInfo+13
1916  0086 c10000        	cp	a,__tim30min
1917  0089 2610          	jrne	L346
1918                     ; 783 			_tim30min = 0xff;
1920  008b 35ff0000      	mov	__tim30min,#255
1921                     ; 784 			__s = 0;
1923  008f 725f0000      	clr	___s
1924                     ; 785 			_dsCount = 0;
1926  0093 725f0000      	clr	__dsCount
1927                     ; 786 			_key_blink = 0;
1929  0097 725f0000      	clr	__key_blink
1930  009b               L346:
1931                     ; 789 }
1934  009b 85            	popw	x
1935  009c 81            	ret	
2033                     ; 821 int		main()
2033                     ; 822 {
2034                     .text:	section	.text,new
2035  0000               _main:
2037  0000 5207          	subw	sp,#7
2038       00000007      OFST:	set	7
2041                     ; 823 	uint8_t	logo = 0;
2043  0002 0f01          	clr	(OFST-6,sp)
2044                     ; 827 	uint8_t	_loopStatus = 0;
2046  0004 0f02          	clr	(OFST-5,sp)
2047                     ; 831 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
2049  0006 4f            	clr	a
2050  0007 cd0000        	call	_CLK_SYSCLKDivConfig
2052                     ; 832 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
2054  000a a601          	ld	a,#1
2055  000c cd0000        	call	_CLK_SYSCLKSourceConfig
2058  000f               L776:
2059                     ; 834 	while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI)
2061  000f cd0000        	call	_CLK_GetSYSCLKSource
2063  0012 4a            	dec	a
2064  0013 26fa          	jrne	L776
2065                     ; 842 	CFG-> GCR |= CFG_GCR_SWD;
2067  0015 72107f60      	bset	32608,#0
2068                     ; 843 	CLK_PeripheralClockConfig(CLK_Peripheral_BEEP, ENABLE);
2070  0019 ae0601        	ldw	x,#1537
2071  001c cd0000        	call	_CLK_PeripheralClockConfig
2073                     ; 844 	CLK_BEEPClockConfig(CLK_BEEPCLKSource_LSI);
2075  001f a602          	ld	a,#2
2076  0021 cd0000        	call	_CLK_BEEPClockConfig
2078                     ; 847 BEEP_LSICalibrationConfig( 38000+801+801  );
2080  0024 ae9ab2        	ldw	x,#39602
2081  0027 89            	pushw	x
2082  0028 5f            	clrw	x
2083  0029 89            	pushw	x
2084  002a cd0000        	call	_BEEP_LSICalibrationConfig
2086  002d 5b04          	addw	sp,#4
2087                     ; 850 	BEEP_Init(BEEP_Frequency_1KHz);
2089  002f 4f            	clr	a
2090  0030 cd0000        	call	_BEEP_Init
2092                     ; 851 	BEEP_Cmd(DISABLE);
2094  0033 4f            	clr	a
2095  0034 cd0000        	call	_BEEP_Cmd
2097                     ; 853 	GPIO_Init(GPIOC, GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Fast);
2099  0037 4be0          	push	#224
2100  0039 4b20          	push	#32
2101  003b ae500a        	ldw	x,#20490
2102  003e cd0000        	call	_GPIO_Init
2104  0041 721a500a      	bset	20490,#5
2105  0045 35600000      	mov	__backlight,#96
2106  0049 85            	popw	x
2107                     ; 854 	D_IO_HIGH(GPIOC, GPIO_Pin_5);
2109                     ; 856 	_backlight = BACKLIGHT_MAX_LEVEL;
2111                     ; 869 	systemTimer();
2113  004a cd0000        	call	_systemTimer
2115                     ; 871 	iouart_Open();
2117  004d cd0000        	call	_iouart_Open
2119                     ; 872 	encoder_Open();
2121  0050 cd0000        	call	_encoder_Open
2123                     ; 873 	systemADC();
2125  0053 cd0000        	call	_systemADC
2127                     ; 874 	systemLcd();
2129  0056 cd0000        	call	_systemLcd
2131                     ; 877 	GPIO_Init(D_BL_PORT, D_BL_PIN, GPIO_Mode_Out_PP_Low_Fast);
2133  0059 4be0          	push	#224
2134  005b 4b40          	push	#64
2135  005d ae5014        	ldw	x,#20500
2136  0060 cd0000        	call	_GPIO_Init
2138  0063 721c5014      	bset	20500,#6
2139  0067 725f0000      	clr	__lcdTimer
2140  006b 725f0001      	clr	__lcdTimer+1
2141  006f 85            	popw	x
2142  0070 5500000002    	mov	__lcdTimer+2,___timer1s
2143                     ; 878 	D_IO_HIGH(D_BL_PORT, D_BL_PIN);
2145                     ; 880 	_lcdTimer[0] = 0;
2147                     ; 881 	_lcdTimer[1] = 0;
2149                     ; 882 	_lcdTimer[2] = __timer1s;
2151                     ; 890 	systemUart();
2153  0075 cd0000        	call	_systemUart
2155                     ; 894 	lcd_clear(0);
2157  0078 4f            	clr	a
2158  0079 cd0000        	call	_lcd_clear
2160                     ; 901 	lcd_disp_n(0, 6);
2162  007c ae0006        	ldw	x,#6
2163  007f cd0000        	call	_lcd_disp_n
2165                     ; 902 	LCD_BIT_SET(b2A);
2167  0082 c60035        	ld	a,_iLF_DEF+53
2168  0085 cd01db        	call	LC013
2169  0088 ca0035        	or	a,_bLF_DEF+53
2170  008b d7540c        	ld	(21516,x),a
2171                     ; 903 	LCD_BIT_SET(b2D);
2173  008e c60005        	ld	a,_iLF_DEF+5
2174  0091 cd01db        	call	LC013
2175  0094 ca0005        	or	a,_bLF_DEF+5
2176  0097 d7540c        	ld	(21516,x),a
2177                     ; 904 	LCD_BIT_SET(b2E);
2179  009a c60016        	ld	a,_iLF_DEF+22
2180  009d cd01db        	call	LC013
2181  00a0 ca0016        	or	a,_bLF_DEF+22
2182  00a3 d7540c        	ld	(21516,x),a
2183                     ; 905 	LCD_BIT_SET(b2F);
2185  00a6 c60036        	ld	a,_iLF_DEF+54
2186  00a9 cd01db        	call	LC013
2187  00ac ca0036        	or	a,_bLF_DEF+54
2188  00af d7540c        	ld	(21516,x),a
2189                     ; 925 	lcd_disp_n(2, 1);
2191  00b2 ae0201        	ldw	x,#513
2192  00b5 cd0000        	call	_lcd_disp_n
2194                     ; 926 	lcd_disp_n(3, 4);
2196  00b8 ae0304        	ldw	x,#772
2197  00bb cd0000        	call	_lcd_disp_n
2199                     ; 929 	indiIOUartIdle = 0;
2201  00be 725f0000      	clr	_indiIOUartIdle
2202                     ; 931 	rc_ptc_baseSet();
2204  00c2 cd0000        	call	_rc_ptc_baseSet
2206                     ; 932 	ui_Open();
2208  00c5 cd0000        	call	_ui_Open
2210                     ; 940 	if( uiInfo.id == 0 )
2212  00c8 c60004        	ld	a,_uiInfo+4
2213  00cb 2604          	jrne	L307
2214                     ; 944 		_ds = 220;
2216  00cd 35dc0000      	mov	__ds,#220
2217  00d1               L307:
2218                     ; 946 	enableInterrupts();
2221  00d1 9a            	rim	
2223                     ; 948 	for( i=0; i<24; i++ )	
2226  00d2 4f            	clr	a
2227  00d3 6b07          	ld	(OFST+0,sp),a
2228  00d5               L507:
2229                     ; 949 		_add[i%12] = adcGet(1);
2231  00d5 5f            	clrw	x
2232  00d6 97            	ld	xl,a
2233  00d7 a60c          	ld	a,#12
2234  00d9 cd0000        	call	c_smodx
2236  00dc 89            	pushw	x
2237  00dd a601          	ld	a,#1
2238  00df cd0000        	call	_adcGet
2240  00e2 85            	popw	x
2241  00e3 d70000        	ld	(__add,x),a
2242                     ; 948 	for( i=0; i<24; i++ )	
2244  00e6 0c07          	inc	(OFST+0,sp)
2247  00e8 7b07          	ld	a,(OFST+0,sp)
2248  00ea a118          	cp	a,#24
2249  00ec 25e7          	jrult	L507
2250  00ee               L746:
2251                     ; 953 Entry:		
2251                     ; 954 #if	defined(WATCHDOG_ENABLE)
2251                     ; 955 		while(1)
2251                     ; 956 		{
2251                     ; 957 			for(i=0; i<200; i++ )
2251                     ; 958 			{
2251                     ; 959 				for( j=0; j<250; j++);
2251                     ; 960 			}
2251                     ; 961 			break;
2251                     ; 962 		}
2251                     ; 963 		IWDG_ReloadCounter();
2251                     ; 964 #endif
2251                     ; 965 		i = 0;
2253                     ; 966 		if (timerCalc() == 1) 
2255  00ee cd0000        	call	_timerCalc
2257  00f1 4a            	dec	a
2258  00f2 2603          	jrne	L717
2259                     ; 969 			timerEvent();
2261  00f4 cd0000        	call	_timerEvent
2263  00f7               L717:
2264                     ; 973 		if( _loopStatus == 0 )
2266  00f7 7b02          	ld	a,(OFST-5,sp)
2267  00f9 270b          	jreq	L327
2269                     ; 976 		else if( _loopStatus == 3 )
2271  00fb a103          	cp	a,#3
2272  00fd 2607          	jrne	L327
2273                     ; 978 			factory(1);
2275  00ff a601          	ld	a,#1
2276  0101 cd0000        	call	_factory
2278                     ; 979 			goto Entry;
2280  0104 20e8          	jra	L746
2281  0106               L327:
2282                     ; 982 		if( logo < 4 )
2284  0106 7b01          	ld	a,(OFST-6,sp)
2285  0108 a104          	cp	a,#4
2286  010a 2419          	jruge	L727
2287                     ; 984 			if( __timer1s != pp[1] )
2289  010c c60000        	ld	a,___timer1s
2290  010f 1104          	cp	a,(OFST-3,sp)
2291  0111 27db          	jreq	L746
2292                     ; 986 				pp[1] = __timer1s;
2294  0113 6b04          	ld	(OFST-3,sp),a
2295                     ; 987 				if( logo == 2 )
2297  0115 7b01          	ld	a,(OFST-6,sp)
2298  0117 a102          	cp	a,#2
2299  0119 2606          	jrne	L337
2300                     ; 989 					logo = 100;
2302  011b a664          	ld	a,#100
2303  011d 6b01          	ld	(OFST-6,sp),a
2305  011f 20cd          	jra	L746
2306  0121               L337:
2307                     ; 993 					logo++;
2309  0121 0c01          	inc	(OFST-6,sp)
2310  0123 20c9          	jra	L746
2311  0125               L727:
2312                     ; 999 		i = _iouartLoop();
2314  0125 cd0000        	call	__iouartLoop
2316  0128 6b07          	ld	(OFST+0,sp),a
2317                     ; 1000 		if( i == 3 )		{	_loopStatus = 3;	}//	factory mode
2319  012a a103          	cp	a,#3
2320  012c 2606          	jrne	L737
2323  012e a603          	ld	a,#3
2324  0130 6b02          	ld	(OFST-5,sp),a
2326  0132 2006          	jra	L147
2327  0134               L737:
2328                     ; 1001 		else if( i == 99 )	{	_loopStatus = 0;	}//	normal mode	
2330  0134 a163          	cp	a,#99
2331  0136 2602          	jrne	L147
2334  0138 0f02          	clr	(OFST-5,sp)
2335  013a               L147:
2336                     ; 1003 		deviceCb();
2338  013a cd0000        	call	_deviceCb
2340                     ; 1005 		if( (__timer1s%2) != pp[3] )
2342  013d c60000        	ld	a,___timer1s
2343  0140 a401          	and	a,#1
2344  0142 1106          	cp	a,(OFST-1,sp)
2345  0144 2713          	jreq	L547
2346                     ; 1007 			pp[3] = __timer1s%2;
2348  0146 c60000        	ld	a,___timer1s
2349  0149 a401          	and	a,#1
2350  014b 6b06          	ld	(OFST-1,sp),a
2351                     ; 1008 			if( pp[2] == 0 )
2353  014d 7b05          	ld	a,(OFST-2,sp)
2354  014f 260a          	jrne	L157
2355                     ; 1010 				pp[2] = 1;
2357  0151 4c            	inc	a
2358  0152 6b05          	ld	(OFST-2,sp),a
2359                     ; 1011 				device_adc();
2361  0154 cd0000        	call	_device_adc
2363  0157 2002          	jra	L157
2364  0159               L547:
2365                     ; 1015 			pp[2] = 0;
2367  0159 0f05          	clr	(OFST-2,sp)
2368  015b               L157:
2369                     ; 1017 		if( (__timer1s) != pp[1] )
2371  015b c60000        	ld	a,___timer1s
2372  015e 1104          	cp	a,(OFST-3,sp)
2373  0160 278c          	jreq	L746
2374                     ; 1019 			pp[1] = __timer1s;
2376  0162 6b04          	ld	(OFST-3,sp),a
2377                     ; 1021 			for( i=0; i<PACKET_SIZE; i++ )
2379  0164 4f            	clr	a
2380  0165 6b07          	ld	(OFST+0,sp),a
2381  0167               L557:
2382                     ; 1023 				if( packet_buf[i] != ui_timeout )
2384  0167 5f            	clrw	x
2385  0168 97            	ld	xl,a
2386  0169 d60017        	ld	a,(_packet_buf,x)
2387  016c c10004        	cp	a,_ui_timeout
2388  016f 2708          	jreq	L367
2389                     ; 1025 					packet_buf[i] += 1;
2391  0171 7b07          	ld	a,(OFST+0,sp)
2392  0173 5f            	clrw	x
2393  0174 97            	ld	xl,a
2394  0175 724c0017      	inc	(_packet_buf,x)
2395  0179               L367:
2396                     ; 1021 			for( i=0; i<PACKET_SIZE; i++ )
2398  0179 0c07          	inc	(OFST+0,sp)
2401  017b 7b07          	ld	a,(OFST+0,sp)
2402  017d a108          	cp	a,#8
2403  017f 25e6          	jrult	L557
2404                     ; 1028 			if( ui_error == 30 && ui_error_type == ERROR_TYPE_CNT )
2406  0181 c60001        	ld	a,_ui_error
2407  0184 a11e          	cp	a,#30
2408  0186 262d          	jrne	L567
2410  0188 c60002        	ld	a,_ui_error_type
2411  018b a102          	cp	a,#2
2412  018d 2626          	jrne	L567
2413                     ; 1030 				if( packet_buf[uiInfo.id - 1] < ui_timeout-1 )
2415  018f ad50          	call	LC014
2416  0191 5f            	clrw	x
2417  0192 97            	ld	xl,a
2418  0193 c60004        	ld	a,_ui_timeout
2419  0196 905f          	clrw	y
2420  0198 9097          	ld	yl,a
2421  019a 905a          	decw	y
2422  019c 90bf00        	ldw	c_y,y
2423  019f b300          	cpw	x,c_y
2424  01a1 2f03cc00ee    	jrsge	L746
2425                     ; 1032 					error_display_mode = 0;
2427  01a6 725f0000      	clr	_error_display_mode
2428                     ; 1033 					ui_error = 0;
2430  01aa 725f0001      	clr	_ui_error
2431                     ; 1034 					ui_error_type = 0;
2433  01ae 725f0002      	clr	_ui_error_type
2434  01b2 cc00ee        	jra	L746
2435  01b5               L567:
2436                     ; 1039 				if( packet_buf[uiInfo.id - 1] == ui_timeout )
2438  01b5 ad2a          	call	LC014
2439  01b7 c10004        	cp	a,_ui_timeout
2440  01ba 26f6          	jrne	L746
2441                     ; 1041 					error_display(ERROR_TYPE_CNT, 30);
2443  01bc ae021e        	ldw	x,#542
2444  01bf cd0000        	call	_error_display
2446                     ; 1042 					ui_timeout = 60;//PACKET_ERROR_COUNT;
2448  01c2 353c0004      	mov	_ui_timeout,#60
2449                     ; 1044 					for( i=0; i<PACKET_SIZE; i++ )
2451  01c6 4f            	clr	a
2452  01c7 6b07          	ld	(OFST+0,sp),a
2453  01c9               L577:
2454                     ; 1046 						packet_buf[i] = 60;//PACKET_ERROR_COUNT;
2456  01c9 5f            	clrw	x
2457  01ca 97            	ld	xl,a
2458  01cb a63c          	ld	a,#60
2459  01cd d70017        	ld	(_packet_buf,x),a
2460                     ; 1044 					for( i=0; i<PACKET_SIZE; i++ )
2462  01d0 0c07          	inc	(OFST+0,sp)
2465  01d2 7b07          	ld	a,(OFST+0,sp)
2466  01d4 a108          	cp	a,#8
2467  01d6 25f1          	jrult	L577
2468  01d8 cc00ee        	jra	L746
2469  01db               LC013:
2470  01db 5f            	clrw	x
2471  01dc 97            	ld	xl,a
2472  01dd d6540c        	ld	a,(21516,x)
2473  01e0 81            	ret	
2474  01e1               LC014:
2475  01e1 c60004        	ld	a,_uiInfo+4
2476  01e4 5f            	clrw	x
2477  01e5 97            	ld	xl,a
2478  01e6 5a            	decw	x
2479  01e7 d60017        	ld	a,(_packet_buf,x)
2480  01ea 81            	ret	
2667                     	xdef	_main
2668                     	xref	__add
2669                     	xdef	_timerEvent
2670                     	xdef	_timerEventClear
2671                     	xdef	___tim30min_reset
2672                     	xref	___timer1sa
2673                     	xref	__timFlag
2674                     	xref	__tim1min
2675                     	xref	__tim30min
2676                     	xdef	_device_adc
2677                     	xdef	_deviceCb
2678                     	xdef	___b
2679                     	xdef	__p
2680                     	xdef	__touchKey
2681                     	xref	_beepSet
2682                     	xref	__uart1_rx_tail
2683                     	xref	__uart1_rx_head
2684                     	xdef	__mkey
2685                     	xdef	__i0Prev
2686                     	xdef	__tcKeyPrev
2687                     	switch	.bss
2688  0000               __tcKey:
2689  0000 00            	ds.b	1
2690                     	xdef	__tcKey
2691  0001               _tc:
2692  0001 0000          	ds.b	2
2693                     	xdef	_tc
2694  0003               __tct10:
2695  0003 00            	ds.b	1
2696                     	xdef	__tct10
2697  0004               __tct0:
2698  0004 00            	ds.b	1
2699                     	xdef	__tct0
2700  0005               __tctimer100ms:
2701  0005 000000000000  	ds.b	6
2702                     	xdef	__tctimer100ms
2703  000b               __tctimer:
2704  000b 000000000000  	ds.b	6
2705                     	xdef	__tctimer
2706  0011               _tct:
2707  0011 000000000000  	ds.b	6
2708                     	xdef	_tct
2709                     	xdef	_tci
2710                     	xdef	_disp_key
2711                     	xref	__key_continue
2712                     	xdef	__iouartLoop
2713                     	xdef	__call_ptc_lse
2714                     	xdef	__call_ptc_woodang
2715                     	xdef	__msgLoop
2716                     	xdef	_getCurrTemp
2717                     	xdef	_ui_timeout
2718                     	xdef	_ui_error_type
2719                     	xdef	_ui_error
2720  0017               _packet_buf:
2721  0017 000000000000  	ds.b	8
2722                     	xdef	_packet_buf
2723                     	xdef	_currTemp
2724                     	xref	_error_display_mode
2725                     	xref	_only_one
2726                     	xref	__backup_backlight2
2727                     	xref	__backlight
2728                     	xref	__lcdTimer
2729                     	xdef	_ver
2730                     	xdef	_rc_type
2731                     	xref	_rc_ptc_make_mirror
2732                     	xref	_rc_ptc_make
2733                     	xref	_rc_ptc_make_setting
2734                     	xref	_getState_check
2735                     	xref	_rc_ptc_check
2736                     	xref	_rc_ptc_baseSet
2737                     	xref	_factory
2738                     	xref	___boiler_shower
2739                     	xref	__key_blink
2740                     	xref	__disp_mode
2741                     	xref	__dsCount
2742                     	xref	__ds
2743                     	xref	_ui_Open
2744                     	xref	___s
2745                     	xref	_disp_status
2746                     	xref	_lcd_disp_n
2747                     	xref	_lcd_clear
2748                     	xref	_iLF_DEF
2749                     	xref	_bLF_DEF
2750                     	xref	_uiInfo
2751                     	xref	_timerCalc
2752                     	xref	_systemTimer
2753                     	xref	___timer1h
2754                     	xref	___timer1min
2755                     	xref	___timer1s
2756                     	xref	___timer100ms
2757                     	xref	__t20ms
2758                     	xref	_systemUart
2759                     	xref	_uart1_get
2760                     	xref	_uart1_tx_put
2761                     	xref	_iouart_getReadBuffer
2762                     	xref	_iouart_getBuffer
2763                     	xref	_iouart_Ready
2764                     	xref	__io_tail
2765                     	xref	__io_head
2766                     	xref	_iouart_Pkt_Start
2767                     	xref	_iouart_Set_Packet
2768                     	xref	_iouart_Open
2769                     	xref	_indiIOUartIdle
2770                     	xref	_error_display
2771                     	xref	_systemLcd
2772                     	xref	_encoder_Open
2773                     	xdef	_disp_enc
2774                     	xdef	_disp_adc
2775                     	xref	_adcGet
2776                     	xref	_systemADC
2777                     	xref	_GPIO_Init
2778                     	xref	_CLK_PeripheralClockConfig
2779                     	xref	_CLK_BEEPClockConfig
2780                     	xref	_CLK_SYSCLKDivConfig
2781                     	xref	_CLK_GetSYSCLKSource
2782                     	xref	_CLK_SYSCLKSourceConfig
2783                     	xref	_BEEP_LSICalibrationConfig
2784                     	xref	_BEEP_Cmd
2785                     	xref	_BEEP_Init
2786                     	switch	.const
2787  000e               L521:
2788  000e 6500          	dc.b	"e",0
2789                     	xref.b	c_x
2790                     	xref.b	c_y
2810                     	xref	c_smodx
2811                     	end
