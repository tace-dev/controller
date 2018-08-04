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
  65                     ; 51 uint8_t	getCurrTemp(void)
  65                     ; 52 {
  67                     .text:	section	.text,new
  68  0000               _getCurrTemp:
  72                     ; 53 	return currTemp;
  74  0000 c60000        	ld	a,_currTemp
  77  0003 81            	ret	
 109                     ; 56 uint8_t	_msgLoop(uint8_t mode)
 109                     ; 57 {
 110                     .text:	section	.text,new
 111  0000               __msgLoop:
 115                     ; 58 	return 0;
 117  0000 4f            	clr	a
 120  0001 81            	ret	
 153                     ; 63 uint8_t _call_ptc_woodang(void) {
 154                     .text:	section	.text,new
 155  0000               __call_ptc_woodang:
 159                     ; 64 	rc_ptc_check(iouart_getReadBuffer());
 161  0000 cd0000        	call	_iouart_getReadBuffer
 163  0003 cd0000        	call	_rc_ptc_check
 165                     ; 66 	switch (getState_check()) {
 167  0006 cd0000        	call	_getState_check
 170                     ; 88 			break;
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
 182                     ; 67 		case RC_STATE_NORMAL:
 182                     ; 68 			if (only_one != 0) {
 184  0018 725d0000      	tnz	_only_one
 185  001c 2701          	jreq	L16
 186                     ; 69 				return;
 189  001e 81            	ret	
 190  001f               L16:
 191                     ; 72 			rc_ptc_make(iouart_getBuffer());
 193  001f cd0000        	call	_iouart_getBuffer
 195  0022 cd0000        	call	_rc_ptc_make
 197                     ; 73 			iouart_Set_Packet(_IO_PACKET_TIMER);
 199                     ; 74 			iouart_Pkt_Start();
 201                     ; 75 			break;
 203  0025 200e          	jp	LC001
 204  0027               L73:
 205                     ; 76 		case RC_STATE_SETTING:
 205                     ; 77 			rc_ptc_make_setting(iouart_getBuffer());
 207  0027 cd0000        	call	_iouart_getBuffer
 209  002a cd0000        	call	_rc_ptc_make_setting
 211                     ; 78 			iouart_Set_Packet(_IO_PACKET_TIMER);
 213                     ; 79 			iouart_Pkt_Start();
 215                     ; 80 			break;
 217  002d 2006          	jp	LC001
 218  002f               L14:
 219                     ; 81 		case RC_STATE_MIRROR:
 219                     ; 82 			rc_ptc_make_mirror(iouart_getBuffer());
 221  002f cd0000        	call	_iouart_getBuffer
 223  0032 cd0000        	call	_rc_ptc_make_mirror
 225                     ; 83 			iouart_Set_Packet(_IO_PACKET_TIMER);
 228                     ; 84 			iouart_Pkt_Start();
 230  0035               LC001:
 233  0035 a6c8          	ld	a,#200
 234  0037 cd0000        	call	_iouart_Set_Packet
 237  003a cd0000        	call	_iouart_Pkt_Start
 239                     ; 85 			break;
 241  003d 2003          	jra	L75
 242  003f               L34:
 243                     ; 86 		case RC_STATE_FACTORY:
 243                     ; 87 			return 3;
 245  003f a603          	ld	a,#3
 248  0041 81            	ret	
 249  0042               L75:
 250                     ; 90 	return 0;
 252  0042 4f            	clr	a
 255  0043 81            	ret	
 278                     ; 93 uint8_t _call_ptc_lse(void) {
 279                     .text:	section	.text,new
 280  0000               __call_ptc_lse:
 284                     ; 105 	return 0;
 286  0000 4f            	clr	a
 289  0001 81            	ret	
 339                     ; 108 uint8_t	_iouartLoop(void)
 339                     ; 109 {
 340                     .text:	section	.text,new
 341  0000               __iouartLoop:
 343  0000 5203          	subw	sp,#3
 344       00000003      OFST:	set	3
 347                     ; 110 	uint8_t	i = 0;
 350  0002 2064          	jra	L511
 351  0004               L311:
 352                     ; 115 		i = iouart_Ready();
 354  0004 cd0000        	call	_iouart_Ready
 356  0007 6b01          	ld	(OFST-2,sp),a
 357                     ; 116 		if( i != 0 )
 359  0009 2705          	jreq	L121
 360                     ; 118 			p = iouart_getReadBuffer();
 362  000b cd0000        	call	_iouart_getReadBuffer
 364  000e 7b01          	ld	a,(OFST-2,sp)
 365  0010               L121:
 366                     ; 125 		if( i == 2 )	
 368  0010 a102          	cp	a,#2
 369  0012 260b          	jrne	L321
 370                     ; 127 			DISP("e", 1);
 372  0014 4b01          	push	#1
 373  0016 ae000e        	ldw	x,#L521
 374  0019 cd0000        	call	_uart1_tx_put
 376  001c 84            	pop	a
 377  001d 7b01          	ld	a,(OFST-2,sp)
 378  001f               L321:
 379                     ; 129 		if( i == 1 )
 381  001f 4a            	dec	a
 382  0020 2646          	jrne	L511
 383                     ; 132 			p = iouart_getReadBuffer();
 385  0022 cd0000        	call	_iouart_getReadBuffer
 387  0025 1f02          	ldw	(OFST-1,sp),x
 388                     ; 136 			if (rc_type == RC_TYPE_NONE) {
 390  0027 c60003        	ld	a,_rc_type
 391  002a 2637          	jrne	L131
 392                     ; 137 				if ((p[0] & 0xF0) == 0x00) 
 394  002c f6            	ld	a,(x)
 395  002d a5f0          	bcp	a,#240
 396                     ; 140 					rc_type = RC_TYPE_LSE;
 397                     ; 141 					return _call_ptc_lse();
 400  002f 2704          	jreq	LC003
 401                     ; 145 					if ((p[0] & 0x0F) == 0x00) {
 403  0031 a50f          	bcp	a,#15
 404  0033 260a          	jrne	L731
 405                     ; 147 						rc_type = RC_TYPE_LSE;
 407  0035               LC003:
 410  0035 35020003      	mov	_rc_type,#2
 411                     ; 148 						return _call_ptc_lse();
 413  0039               LC002:
 417  0039 cd0000        	call	__call_ptc_lse
 420  003c               L001:
 422  003c 5b03          	addw	sp,#3
 423  003e 81            	ret	
 424  003f               L731:
 425                     ; 151 						if ((p[0] & 0xF0) == 0x80 || 
 425                     ; 152 								(p[0] & 0xF0) == 0x90 || 
 425                     ; 153 								(p[0] & 0xF0) == 0xB0 ||
 425                     ; 154 								(p[0] & 0xF0) == 0xC0) {
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
 444                     ; 155 							rc_type = RC_TYPE_LSE;
 445                     ; 156 							return _call_ptc_lse();
 448  0058 27db          	jreq	LC003
 449                     ; 158 							rc_type = RC_TYPE_WOODANG;
 451  005a 35010003      	mov	_rc_type,#1
 452                     ; 159 						  return _call_ptc_woodang();
 454  005e               LC004:
 456  005e cd0000        	call	__call_ptc_woodang
 459  0061 20d9          	jra	L001
 460  0063               L131:
 461                     ; 163 			}else if (rc_type == RC_TYPE_WOODANG) {
 463  0063 4a            	dec	a
 464  0064 26d3          	jrne	LC002
 465                     ; 164 				return _call_ptc_woodang();
 468  0066 20f6          	jp	LC004
 469                     ; 166 				return _call_ptc_lse();
 472  0068               L511:
 473                     ; 113 	while( _io_head != _io_tail )
 475  0068 c60000        	ld	a,__io_head
 476  006b c10000        	cp	a,__io_tail
 477  006e 2694          	jrne	L311
 478                     ; 170 	return 0;
 480  0070 4f            	clr	a
 482  0071 20c9          	jra	L001
 526                     ; 178 void	disp_key(uint8_t k)
 526                     ; 179 {
 527                     .text:	section	.text,new
 528  0000               _disp_key:
 530  0000 88            	push	a
 531  0001 5205          	subw	sp,#5
 532       00000005      OFST:	set	5
 535                     ; 181 	buf[0] = '<';
 537  0003 a63c          	ld	a,#60
 538  0005 6b01          	ld	(OFST-4,sp),a
 539                     ; 182 	buf[2] = ':';
 541  0007 a63a          	ld	a,#58
 542  0009 6b03          	ld	(OFST-2,sp),a
 543                     ; 183 	buf[3] = '0' + _key_continue;
 545  000b c60000        	ld	a,__key_continue
 546  000e ab30          	add	a,#48
 547  0010 6b04          	ld	(OFST-1,sp),a
 548                     ; 184 	buf[4] = '>';
 550  0012 a63e          	ld	a,#62
 551  0014 6b05          	ld	(OFST+0,sp),a
 552                     ; 185 	if( k == 4 )		buf[1] = '4';
 554  0016 7b06          	ld	a,(OFST+1,sp)
 555  0018 a104          	cp	a,#4
 556  001a 2604          	jrne	L302
 559  001c a634          	ld	a,#52
 561  001e 2015          	jp	LC005
 562  0020               L302:
 563                     ; 186 	else if( k == 3 )	buf[1] = '3';
 565  0020 a103          	cp	a,#3
 566  0022 2604          	jrne	L702
 569  0024 a633          	ld	a,#51
 571  0026 200d          	jp	LC005
 572  0028               L702:
 573                     ; 187 	else if( k == 2 )	buf[1] = '2';
 575  0028 a102          	cp	a,#2
 576  002a 2604          	jrne	L312
 579  002c a632          	ld	a,#50
 581  002e 2005          	jp	LC005
 582  0030               L312:
 583                     ; 188 	else if( k == 1 )	buf[1] = '1';
 585  0030 4a            	dec	a
 586  0031 2606          	jrne	L712
 589  0033 a631          	ld	a,#49
 590  0035               LC005:
 591  0035 6b02          	ld	(OFST-3,sp),a
 593  0037 2004          	jra	L502
 594  0039               L712:
 595                     ; 190 		buf[2] = '?';
 597  0039 a63f          	ld	a,#63
 598  003b 6b03          	ld	(OFST-2,sp),a
 599  003d               L502:
 600                     ; 191 	DISP(buf, 5);
 602  003d 4b05          	push	#5
 603  003f 96            	ldw	x,sp
 604  0040 1c0002        	addw	x,#OFST-3
 605  0043 cd0000        	call	_uart1_tx_put
 607  0046 84            	pop	a
 608                     ; 192 }
 611  0047 5b06          	addw	sp,#6
 612  0049 81            	ret	
 662                     ; 194 void	disp_enc(uint8_t enc)
 662                     ; 195 {
 663                     .text:	section	.text,new
 664  0000               _disp_enc:
 666  0000 88            	push	a
 667  0001 5204          	subw	sp,#4
 668       00000004      OFST:	set	4
 671                     ; 198 	if( (enc & 0x40) != 0 )
 673  0003 a540          	bcp	a,#64
 674  0005 2704          	jreq	L542
 675                     ; 199 		buf[0] = '+';
 677  0007 a62b          	ld	a,#43
 679  0009 2002          	jra	L742
 680  000b               L542:
 681                     ; 201 		buf[0] = '-';
 683  000b a62d          	ld	a,#45
 684  000d               L742:
 685  000d 6b02          	ld	(OFST-2,sp),a
 686                     ; 203 	i = enc&0x0f;
 688  000f 7b05          	ld	a,(OFST+1,sp)
 689  0011 a40f          	and	a,#15
 690  0013 6b01          	ld	(OFST-3,sp),a
 691                     ; 204 	buf[1] = '0' + i/10;
 693  0015 5f            	clrw	x
 694  0016 97            	ld	xl,a
 695  0017 a60a          	ld	a,#10
 696  0019 62            	div	x,a
 697  001a 9f            	ld	a,xl
 698  001b ab30          	add	a,#48
 699  001d 6b03          	ld	(OFST-1,sp),a
 700                     ; 205 	buf[2] = '0' + i%10;
 702  001f 5f            	clrw	x
 703  0020 7b01          	ld	a,(OFST-3,sp)
 704  0022 97            	ld	xl,a
 705  0023 a60a          	ld	a,#10
 706  0025 62            	div	x,a
 707  0026 ab30          	add	a,#48
 708  0028 6b04          	ld	(OFST+0,sp),a
 709                     ; 206 	DISP(buf, 3);
 711  002a 4b03          	push	#3
 712  002c 96            	ldw	x,sp
 713  002d 1c0003        	addw	x,#OFST-1
 714  0030 cd0000        	call	_uart1_tx_put
 716  0033 84            	pop	a
 717                     ; 207 }
 720  0034 5b05          	addw	sp,#5
 721  0036 81            	ret	
 753                     ; 209 void	disp_adc(uint8_t i)
 753                     ; 210 {
 754                     .text:	section	.text,new
 755  0000               _disp_adc:
 759                     ; 220 }
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
 821                     ; 254 uint8_t	_touchKey(uint8_t i, uint8_t mask, uint8_t key)
 821                     ; 255 {
 822                     .text:	section	.text,new
 823  0000               __touchKey:
 825  0000 89            	pushw	x
 826       00000000      OFST:	set	0
 829                     ; 256 	if( tc[0] & mask )
 831  0001 9f            	ld	a,xl
 832  0002 c40001        	and	a,_tc
 833  0005 272e          	jreq	L503
 834                     ; 258 		if( tct[i] == 0 )
 836  0007 7b01          	ld	a,(OFST+1,sp)
 837  0009 5f            	clrw	x
 838  000a 97            	ld	xl,a
 839  000b 724d0011      	tnz	(_tct,x)
 840  000f 260f          	jrne	L703
 841                     ; 260 			tct[i] = 1;
 843  0011 5f            	clrw	x
 844  0012 97            	ld	xl,a
 845  0013 a601          	ld	a,#1
 846  0015 d70011        	ld	(_tct,x),a
 847                     ; 261 			_tctimer[i] = 0;
 849  0018 7b01          	ld	a,(OFST+1,sp)
 850  001a ad2a          	call	LC006
 851  001c 724f0005      	clr	(__tctimer100ms,x)
 852  0020               L703:
 853                     ; 264 		if( _tctimer[i] >= 10 )
 855  0020 5f            	clrw	x
 856  0021 97            	ld	xl,a
 857  0022 d6000b        	ld	a,(__tctimer,x)
 858  0025 a10a          	cp	a,#10
 859  0027 2508          	jrult	L113
 860                     ; 266 			_tctimer[i] = 0;
 862  0029 7b01          	ld	a,(OFST+1,sp)
 863  002b ad19          	call	LC006
 864  002d 724c0005      	inc	(__tctimer100ms,x)
 865  0031               L113:
 866                     ; 269 		return key;
 868  0031 7b05          	ld	a,(OFST+5,sp)
 870  0033 200f          	jra	L611
 871  0035               L503:
 872                     ; 273 		tct[i] = 0;
 874  0035 7b01          	ld	a,(OFST+1,sp)
 875  0037 5f            	clrw	x
 876  0038 97            	ld	xl,a
 877  0039 724f0011      	clr	(_tct,x)
 878                     ; 274 		_tctimer[i] = 0;
 880  003d ad07          	call	LC006
 881  003f 724f0005      	clr	(__tctimer100ms,x)
 882                     ; 277 	return 0;
 884  0043 4f            	clr	a
 886  0044               L611:
 888  0044 85            	popw	x
 889  0045 81            	ret	
 890  0046               LC006:
 891  0046 5f            	clrw	x
 892  0047 97            	ld	xl,a
 893  0048 724f000b      	clr	(__tctimer,x)
 894                     ; 275 		_tctimer100ms[i] = 0;
 896  004c 5f            	clrw	x
 897  004d 97            	ld	xl,a
 898  004e 81            	ret	
 901                     	switch	.data
 902  0009               __led_key_onOff:
 903  0009 00            	dc.b	0
1004                     ; 283 void	_touchCntl(GPIO_TypeDef* port, uint8_t pin, uint8_t i)
1004                     ; 284 {
1005                     .text:	section	.text,new
1006  0000               __touchCntl:
1008  0000 89            	pushw	x
1009       00000000      OFST:	set	0
1012                     ; 285 	if( i == 0 )
1014  0001 7b06          	ld	a,(OFST+6,sp)
1015  0003 2606          	jrne	L173
1016                     ; 287 		D_IO_LOW(port, pin);
1018  0005 7b05          	ld	a,(OFST+5,sp)
1019  0007 43            	cpl	a
1020  0008 f4            	and	a,(x)
1022  0009 2005          	jra	L373
1023  000b               L173:
1024                     ; 291 		D_IO_HIGH(port, pin);
1026  000b 1e01          	ldw	x,(OFST+1,sp)
1027  000d f6            	ld	a,(x)
1028  000e 1a05          	or	a,(OFST+5,sp)
1029  0010               L373:
1030  0010 f7            	ld	(x),a
1031                     ; 293 }
1034  0011 85            	popw	x
1035  0012 81            	ret	
1060                     ; 305 void	_touchOn(void)
1060                     ; 306 {
1061                     .text:	section	.text,new
1062  0000               __touchOn:
1066                     ; 307 	_led_key_onOff = 0;
1068  0000 725f0009      	clr	__led_key_onOff
1069                     ; 309 	_touchCntl(GPIOE, GPIO_Pin_7, 0);
1071  0004 4b00          	push	#0
1072  0006 4b80          	push	#128
1073  0008 ae5014        	ldw	x,#20500
1074  000b cd0000        	call	__touchCntl
1076  000e 85            	popw	x
1077                     ; 310 	_touchCntl(GPIOC, GPIO_Pin_6, 0);
1079  000f 4b00          	push	#0
1080  0011 4b40          	push	#64
1081  0013 ae500a        	ldw	x,#20490
1082  0016 cd0000        	call	__touchCntl
1084  0019 85            	popw	x
1085                     ; 311 	_touchCntl(GPIOC, GPIO_Pin_5, 0);
1087  001a 4b00          	push	#0
1088  001c 4b20          	push	#32
1089  001e ae500a        	ldw	x,#20490
1090  0021 cd0000        	call	__touchCntl
1092  0024 85            	popw	x
1093                     ; 313 	_touchCntl(GPIOC, GPIO_Pin_1, 0);
1095  0025 4b00          	push	#0
1096  0027 4b02          	push	#2
1097  0029 ae500a        	ldw	x,#20490
1098  002c cd0000        	call	__touchCntl
1100  002f 85            	popw	x
1101                     ; 314 	_touchCntl(GPIOA, GPIO_Pin_2, 0);
1103  0030 4b00          	push	#0
1104  0032 4b04          	push	#4
1105  0034 ae5000        	ldw	x,#20480
1106  0037 cd0000        	call	__touchCntl
1108  003a 85            	popw	x
1109                     ; 315 }
1112  003b 81            	ret	
1137                     ; 317 void	_touchOff(void)
1137                     ; 318 {
1138                     .text:	section	.text,new
1139  0000               __touchOff:
1143                     ; 319 	_led_key_onOff = 1;
1145  0000 35010009      	mov	__led_key_onOff,#1
1146                     ; 321 	_touchCntl(GPIOE, GPIO_Pin_7, 1);
1148  0004 4b01          	push	#1
1149  0006 4b80          	push	#128
1150  0008 ae5014        	ldw	x,#20500
1151  000b cd0000        	call	__touchCntl
1153  000e 85            	popw	x
1154                     ; 322 	_touchCntl(GPIOC, GPIO_Pin_6, 1);
1156  000f 4b01          	push	#1
1157  0011 4b40          	push	#64
1158  0013 ae500a        	ldw	x,#20490
1159  0016 cd0000        	call	__touchCntl
1161  0019 85            	popw	x
1162                     ; 323 	_touchCntl(GPIOC, GPIO_Pin_5, 1);
1164  001a 4b01          	push	#1
1165  001c 4b20          	push	#32
1166  001e ae500a        	ldw	x,#20490
1167  0021 cd0000        	call	__touchCntl
1169  0024 85            	popw	x
1170                     ; 325 	_touchCntl(GPIOC, GPIO_Pin_1, 1);
1172  0025 4b01          	push	#1
1173  0027 4b02          	push	#2
1174  0029 ae500a        	ldw	x,#20490
1175  002c cd0000        	call	__touchCntl
1177  002f 85            	popw	x
1178                     ; 326 	_touchCntl(GPIOA, GPIO_Pin_2, 1);
1180  0030 4b01          	push	#1
1181  0032 4b04          	push	#4
1182  0034 ae5000        	ldw	x,#20480
1183  0037 cd0000        	call	__touchCntl
1185  003a 85            	popw	x
1186                     ; 327 }
1189  003b 81            	ret	
1192                     	switch	.data
1193  000a               __p:
1194  000a 00            	dc.b	0
1228                     ; 333 void	__b(uint8_t k)
1228                     ; 334 {
1229                     .text:	section	.text,new
1230  0000               ___b:
1234                     ; 335 	lcd_clear(0);
1236  0000 4f            	clr	a
1237  0001 cd0000        	call	_lcd_clear
1239                     ; 343 LCD_BIT_SET(_p);
1241  0004 c6000a        	ld	a,__p
1242  0007 5f            	clrw	x
1243  0008 97            	ld	xl,a
1244  0009 d60000        	ld	a,(_iLF_DEF,x)
1245  000c 5f            	clrw	x
1246  000d 97            	ld	xl,a
1247  000e c6000a        	ld	a,__p
1248  0011 905f          	clrw	y
1249  0013 9097          	ld	yl,a
1250  0015 d6540c        	ld	a,(21516,x)
1251  0018 90da0000      	or	a,(_bLF_DEF,y)
1252  001c d7540c        	ld	(21516,x),a
1253                     ; 344 	_p++;
1255  001f 725c000a      	inc	__p
1256                     ; 345 }
1259  0023 81            	ret	
1337                     ; 347 void	deviceCb(void)
1337                     ; 348 {
1338                     .text:	section	.text,new
1339  0000               _deviceCb:
1341  0000 5204          	subw	sp,#4
1342       00000004      OFST:	set	4
1345                     ; 349 	uint8_t	lcd = 0;
1347                     ; 424 	if( _tct0 == _t20ms )
1349  0002 c60004        	ld	a,__tct0
1350  0005 c10000        	cp	a,__t20ms
1351  0008 2603cc02b6    	jreq	L232
1352                     ; 425 		return;
1354                     ; 427 	_tct0 = _t20ms;
1356  000d 5500000004    	mov	__tct0,__t20ms
1357                     ; 428 	for( i=0; i<6; i++ )
1359  0012 4f            	clr	a
1360  0013 6b04          	ld	(OFST+0,sp),a
1361  0015               L364:
1362                     ; 430 		if( tct[i]==1 )
1364  0015 5f            	clrw	x
1365  0016 97            	ld	xl,a
1366  0017 d60011        	ld	a,(_tct,x)
1367  001a 4a            	dec	a
1368  001b 2608          	jrne	L174
1369                     ; 431 			_tctimer[i]++;
1371  001d 7b04          	ld	a,(OFST+0,sp)
1372  001f 5f            	clrw	x
1373  0020 97            	ld	xl,a
1374  0021 724c000b      	inc	(__tctimer,x)
1375  0025               L174:
1376                     ; 428 	for( i=0; i<6; i++ )
1378  0025 0c04          	inc	(OFST+0,sp)
1381  0027 7b04          	ld	a,(OFST+0,sp)
1382  0029 a106          	cp	a,#6
1383  002b 25e8          	jrult	L364
1384                     ; 434 	if( _uart1_rx_tail == _uart1_rx_head )
1386  002d c60000        	ld	a,__uart1_rx_tail
1387  0030 c10000        	cp	a,__uart1_rx_head
1388  0033 2703cc0272    	jrne	L705
1389                     ; 436 		_tct10++;
1391  0038 725c0003      	inc	__tct10
1392                     ; 437 		if( _tct10 >= 5 )
1394  003c c60003        	ld	a,__tct10
1395  003f a105          	cp	a,#5
1396  0041 25f2          	jrult	L705
1397                     ; 439 			for( i=0; i<6; i++ )
1399  0043 4f            	clr	a
1400  0044 6b04          	ld	(OFST+0,sp),a
1401  0046               L774:
1402                     ; 440 				tct[i] = 0;
1404  0046 5f            	clrw	x
1405  0047 97            	ld	xl,a
1406  0048 724f0011      	clr	(_tct,x)
1407                     ; 439 			for( i=0; i<6; i++ )
1409  004c 0c04          	inc	(OFST+0,sp)
1412  004e 7b04          	ld	a,(OFST+0,sp)
1413  0050 a106          	cp	a,#6
1414  0052 25f2          	jrult	L774
1415                     ; 441 			_tct10 = 0;
1417  0054 725f0003      	clr	__tct10
1418                     ; 442 			_tcKeyPrev = 0xff;
1420  0058 35ff0006      	mov	__tcKeyPrev,#255
1421                     ; 443 			_mkey = 0xff;
1423  005c 35ff0008      	mov	__mkey,#255
1424  0060 cc0272        	jra	L705
1425  0063               L505:
1426                     ; 450 		i = uart1_get();
1428  0063 cd0000        	call	_uart1_get
1430  0066 6b04          	ld	(OFST+0,sp),a
1431                     ; 451 		if( i == 0xff )
1433  0068 4c            	inc	a
1434  0069 2606          	jrne	L315
1435                     ; 453 			tci = 0;
1437  006b c70005        	ld	_tci,a
1438                     ; 454 			continue;
1440  006e cc0272        	jra	L705
1441  0071               L315:
1442                     ; 456 			tc[tci] = i;
1444  0071 c60005        	ld	a,_tci
1445  0074 5f            	clrw	x
1446  0075 97            	ld	xl,a
1447  0076 7b04          	ld	a,(OFST+0,sp)
1448  0078 d70001        	ld	(_tc,x),a
1449                     ; 457 			tci = tci==0 ? 1 : 0;
1451  007b 725d0005      	tnz	_tci
1452  007f 2604          	jrne	L261
1453  0081 a601          	ld	a,#1
1454  0083 2001          	jra	L461
1455  0085               L261:
1456  0085 4f            	clr	a
1457  0086               L461:
1458  0086 c70005        	ld	_tci,a
1459                     ; 458 			if( tci != 0 )
1461  0089 725d0005      	tnz	_tci
1462  008d 26df          	jrne	L705
1463                     ; 459 				continue;
1465                     ; 461 			i = tc[0] + tc[1];
1467  008f c60002        	ld	a,_tc+1
1468  0092 cb0001        	add	a,_tc
1469  0095 6b04          	ld	(OFST+0,sp),a
1470                     ; 462 			if( i != 0xff )
1472  0097 4c            	inc	a
1473  0098 26d4          	jrne	L705
1474                     ; 463 				continue;
1476                     ; 465 			_tct10 = 0;
1478  009a c70003        	ld	__tct10,a
1479                     ; 467 			_tcKey = _touchKey(0, 0x01, 0x01);
1481  009d 4b01          	push	#1
1482  009f ae0001        	ldw	x,#1
1483  00a2 cd0000        	call	__touchKey
1485  00a5 5b01          	addw	sp,#1
1486  00a7 c70000        	ld	__tcKey,a
1487                     ; 468 			_tcKey |= _touchKey(1, 0x02, 0x04);
1489  00aa 4b04          	push	#4
1490  00ac ae0102        	ldw	x,#258
1491  00af cd0000        	call	__touchKey
1493  00b2 5b01          	addw	sp,#1
1494  00b4 ca0000        	or	a,__tcKey
1495  00b7 c70000        	ld	__tcKey,a
1496                     ; 469 			_tcKey |= _touchKey(2, 0x04, 0x10);
1498  00ba 4b10          	push	#16
1499  00bc ae0204        	ldw	x,#516
1500  00bf cd0000        	call	__touchKey
1502  00c2 5b01          	addw	sp,#1
1503  00c4 ca0000        	or	a,__tcKey
1504  00c7 c70000        	ld	__tcKey,a
1505                     ; 470 			_tcKey |= _touchKey(3, 0x08, 0x02);
1507  00ca 4b02          	push	#2
1508  00cc ae0308        	ldw	x,#776
1509  00cf cd0000        	call	__touchKey
1511  00d2 5b01          	addw	sp,#1
1512  00d4 ca0000        	or	a,__tcKey
1513  00d7 c70000        	ld	__tcKey,a
1514                     ; 471 			_tcKey |= _touchKey(4, 0x10, 0x08);
1516  00da 4b08          	push	#8
1517  00dc ae0410        	ldw	x,#1040
1518  00df cd0000        	call	__touchKey
1520  00e2 5b01          	addw	sp,#1
1521  00e4 ca0000        	or	a,__tcKey
1522  00e7 c70000        	ld	__tcKey,a
1523                     ; 472 			_tcKey |= _touchKey(5, 0x20, 0x20);
1525  00ea 4b20          	push	#32
1526  00ec ae0520        	ldw	x,#1312
1527  00ef cd0000        	call	__touchKey
1529  00f2 5b01          	addw	sp,#1
1530  00f4 ca0000        	or	a,__tcKey
1531  00f7 c70000        	ld	__tcKey,a
1532                     ; 482 			if( _tcKey == 0 )
1534  00fa 725d0000      	tnz	__tcKey
1535  00fe 2607          	jrne	L125
1536                     ; 484 				_tcKeyPrev = 0xff;
1538  0100 35ff0006      	mov	__tcKeyPrev,#255
1539                     ; 485 				continue;
1541  0104 cc0272        	jra	L705
1542  0107               L125:
1543                     ; 488 			lcd = 1;
1545                     ; 489 			j = 0;
1547  0107 0f03          	clr	(OFST-1,sp)
1548                     ; 490 			i0 = 0xff;
1550  0109 a6ff          	ld	a,#255
1551  010b 6b02          	ld	(OFST-2,sp),a
1552                     ; 491 			for( i=0; i<6; i++ )
1554  010d 4f            	clr	a
1555  010e 6b04          	ld	(OFST+0,sp),a
1556  0110               L325:
1557                     ; 493 				if( tct[i]==1 )
1559  0110 5f            	clrw	x
1560  0111 97            	ld	xl,a
1561  0112 d60011        	ld	a,(_tct,x)
1562  0115 4a            	dec	a
1563  0116 2606          	jrne	L135
1564                     ; 495 					j++;
1566  0118 0c03          	inc	(OFST-1,sp)
1567                     ; 496 					i0 = i;
1569  011a 7b04          	ld	a,(OFST+0,sp)
1570  011c 6b02          	ld	(OFST-2,sp),a
1571  011e               L135:
1572                     ; 491 			for( i=0; i<6; i++ )
1574  011e 0c04          	inc	(OFST+0,sp)
1577  0120 7b04          	ld	a,(OFST+0,sp)
1578  0122 a106          	cp	a,#6
1579  0124 25ea          	jrult	L325
1580                     ; 501 			if( j >= 3 && _mkey != 0xff )
1582  0126 7b03          	ld	a,(OFST-1,sp)
1583  0128 a103          	cp	a,#3
1584  012a 2516          	jrult	L335
1586  012c c60008        	ld	a,__mkey
1587  012f 4c            	inc	a
1588  0130 2710          	jreq	L335
1589                     ; 503 				if( _tcKey == 0x55 )		goto K_55;
1591  0132 c60000        	ld	a,__tcKey
1592  0135 a155          	cp	a,#85
1593  0137 2736          	jreq	L134
1596                     ; 504 				if( _tcKey == 0x53 )		goto K_53;
1598  0139 c60000        	ld	a,__tcKey
1599  013c a153          	cp	a,#83
1600  013e 26c4          	jrne	L705
1603  0140 2060          	jra	L334
1604  0142               L335:
1605                     ; 507 			if( j == 1 && _mkey != 0xff )
1607  0142 7b03          	ld	a,(OFST-1,sp)
1608  0144 4a            	dec	a
1609  0145 2616          	jrne	L145
1611  0147 c60008        	ld	a,__mkey
1612  014a 4c            	inc	a
1613  014b 2710          	jreq	L145
1614                     ; 509 				if( _tcKey == 0x55 )		goto K_55;
1616  014d c60000        	ld	a,__tcKey
1617  0150 a155          	cp	a,#85
1618  0152 271b          	jreq	L134
1621                     ; 510 				if( _tcKey == 0x53 )		goto K_53;
1623  0154 c60000        	ld	a,__tcKey
1624  0157 a153          	cp	a,#83
1625  0159 26a9          	jrne	L705
1628  015b 2045          	jra	L334
1629  015d               L145:
1630                     ; 513 			if( j == 2 )
1632  015d 7b03          	ld	a,(OFST-1,sp)
1633  015f a102          	cp	a,#2
1634  0161 266c          	jrne	L745
1635                     ; 517 				if( tct[2] == 1 )
1637  0163 c60013        	ld	a,_tct+2
1638  0166 4a            	dec	a
1639  0167 2669          	jrne	L534
1640                     ; 519 					if( tct[5] == 1 )
1642  0169 c60016        	ld	a,_tct+5
1643  016c 4a            	dec	a
1644  016d 262d          	jrne	L355
1645  016f               L134:
1646                     ; 521 K_55:						
1646                     ; 522 						//	ID
1646                     ; 523 						_tcKey = 0x55;
1648  016f 35550000      	mov	__tcKey,#85
1649                     ; 524 						_mkey = 0x24;
1651  0173 35240008      	mov	__mkey,#36
1652                     ; 525 						if( _tcKey != _tcKeyPrev )
1654  0177 c60000        	ld	a,__tcKey
1655  017a c10006        	cp	a,__tcKeyPrev
1656  017d 270d          	jreq	L555
1657                     ; 527 							_tcKeyPrev = _tcKey;
1659  017f 5500000006    	mov	__tcKeyPrev,__tcKey
1660                     ; 528 							_i0Prev = i0;
1662  0184 7b02          	ld	a,(OFST-2,sp)
1663  0186 cd02c2        	call	LC011
1664                     ; 530 							_key_continue = 0;
1665  0189 cc0272        	jra	L705
1666  018c               L555:
1667                     ; 535 							if( _tctimer100ms[_i0Prev] > 35 )//TIME_LONG_TOUCH )
1669  018c cd02b9        	call	LC010
1670  018f a124          	cp	a,#36
1671  0191 25f6          	jrult	L705
1672                     ; 537 								_key_continue = 1;
1674  0193 35010000      	mov	__key_continue,#1
1675                     ; 538 								disp_status(0x55);
1677  0197 a655          	ld	a,#85
1679                     ; 539 								_tctimer100ms[_i0Prev] = 0;
1680  0199 cc0266        	jp	LC007
1681  019c               L355:
1682                     ; 545 					else if( tct[1] == 1 )
1684  019c c60012        	ld	a,_tct+1
1685  019f 4a            	dec	a
1686  01a0 2630          	jrne	L534
1687  01a2               L334:
1688                     ; 547 K_53:						
1688                     ; 548 						//	Option
1688                     ; 549 						_tcKey = 0x53;
1690  01a2 35530000      	mov	__tcKey,#83
1691                     ; 550 						_mkey = 0x60;
1693  01a6 35600008      	mov	__mkey,#96
1694                     ; 551 						if( _tcKey != _tcKeyPrev )
1696  01aa c60000        	ld	a,__tcKey
1697  01ad c10006        	cp	a,__tcKeyPrev
1698  01b0 270d          	jreq	L765
1699                     ; 553 							_tcKeyPrev = _tcKey;
1701  01b2 5500000006    	mov	__tcKeyPrev,__tcKey
1702                     ; 554 							_i0Prev = i0;
1704  01b7 7b02          	ld	a,(OFST-2,sp)
1705  01b9 cd02c2        	call	LC011
1706                     ; 556 							_key_continue = 0;
1707  01bc cc0272        	jra	L705
1708  01bf               L765:
1709                     ; 561 							if( _tctimer100ms[_i0Prev] > 35 )//TIME_LONG_TOUCH )
1711  01bf cd02b9        	call	LC010
1712  01c2 a124          	cp	a,#36
1713  01c4 25f6          	jrult	L705
1714                     ; 563 								_key_continue = 1;
1716  01c6 35010000      	mov	__key_continue,#1
1717                     ; 564 								disp_status(0x53);
1719  01ca a653          	ld	a,#83
1721                     ; 565 								_tctimer100ms[_i0Prev] = 0;
1722  01cc cc0266        	jp	LC007
1723  01cf               L745:
1724                     ; 574 			if( j != 1 )
1726  01cf 4a            	dec	a
1727  01d0 2714          	jreq	L575
1728  01d2               L534:
1729                     ; 576 CLEAR_KEY_ENTRY:
1729                     ; 577 				for( i=0; i<6; i++ )
1731  01d2 4f            	clr	a
1732  01d3 6b04          	ld	(OFST+0,sp),a
1733  01d5               L775:
1734                     ; 578 					tct[i] = 0;
1736  01d5 5f            	clrw	x
1737  01d6 97            	ld	xl,a
1738  01d7 724f0011      	clr	(_tct,x)
1739                     ; 577 				for( i=0; i<6; i++ )
1741  01db 0c04          	inc	(OFST+0,sp)
1744  01dd 7b04          	ld	a,(OFST+0,sp)
1745  01df a106          	cp	a,#6
1746  01e1 25f2          	jrult	L775
1747                     ; 579 				continue;
1749  01e3 cc0272        	jra	L705
1750  01e6               L575:
1751                     ; 582 			if( _tcKeyPrev != _tcKey )
1753  01e6 c60006        	ld	a,__tcKeyPrev
1754  01e9 c10000        	cp	a,__tcKey
1755  01ec 2748          	jreq	L506
1756                     ; 584 				_tcKeyPrev = _tcKey;
1758  01ee 5500000006    	mov	__tcKeyPrev,__tcKey
1759                     ; 585 				_i0Prev = i0;
1761  01f3 7b02          	ld	a,(OFST-2,sp)
1762  01f5 cd02c2        	call	LC011
1763                     ; 589 					_lcdTimer[0] = 0;
1765  01f8 725f0000      	clr	__lcdTimer
1766                     ; 590 					_lcdTimer[2] = __timer1s;
1768  01fc 5500000002    	mov	__lcdTimer+2,___timer1s
1769                     ; 591 					if( _lcdTimer[1] == 2 )
1771  0201 c60001        	ld	a,__lcdTimer+1
1772  0204 a102          	cp	a,#2
1773  0206 260d          	jrne	L706
1774                     ; 594 						_lcdTimer[1] = 3;
1776  0208 cd02cf        	call	LC012
1777                     ; 598 						_touchOn();
1779  020b cd0000        	call	__touchOn
1781                     ; 601 						_uart1_rx_tail = _uart1_rx_head;
1783  020e 5500000000    	mov	__uart1_rx_tail,__uart1_rx_head
1785  0213 205d          	jra	L705
1786  0215               L706:
1787                     ; 604 					else if( _lcdTimer[1] == 3 )
1789  0215 a103          	cp	a,#3
1790  0217 2612          	jrne	L316
1791                     ; 606 						_tcKeyPrev = 0xff;
1793  0219 35ff0006      	mov	__tcKeyPrev,#255
1794                     ; 607 						if( _lcdTimer[3] == __timer100ms )
1796  021d c60003        	ld	a,__lcdTimer+3
1797  0220 c10000        	cp	a,___timer100ms
1798  0223 274d          	jreq	L705
1800                     ; 612 							_lcdTimer[1] = 0;
1802  0225 725f0001      	clr	__lcdTimer+1
1803  0229 2047          	jra	L705
1804  022b               L316:
1805                     ; 629 						_lcdTimer[1] = 3;
1807  022b cd02cf        	call	LC012
1808                     ; 633 						disp_status(_tcKey);
1810  022e c60000        	ld	a,__tcKey
1811  0231 cd0000        	call	_disp_status
1813  0234 203c          	jra	L705
1814  0236               L506:
1815                     ; 638 				if (_tcKeyPrev == 0x10 || _tcKeyPrev == 0x20) {
1817  0236 c60006        	ld	a,__tcKeyPrev
1818  0239 a110          	cp	a,#16
1819  023b 2707          	jreq	L726
1821  023d c60006        	ld	a,__tcKeyPrev
1822  0240 a120          	cp	a,#32
1823  0242 2608          	jrne	L526
1824  0244               L726:
1825                     ; 639 					if( _tctimer100ms[_i0Prev] > 2 )
1827  0244 ad73          	call	LC010
1828  0246 a103          	cp	a,#3
1829  0248 2528          	jrult	L705
1830                     ; 641 						disp_status(_tcKeyPrev);
1832                     ; 642 						_tctimer100ms[_i0Prev] = 0;
1833  024a 2017          	jp	LC008
1834  024c               L526:
1835                     ; 645 					if( _tcKeyPrev == 0x04 )
1837  024c c60006        	ld	a,__tcKeyPrev
1838  024f a104          	cp	a,#4
1839  0251 2606          	jrne	L536
1840                     ; 648 						if( _tctimer100ms[_i0Prev] > 30 /*TIME_LONG_TOUCH*/ )
1842  0253 ad64          	call	LC010
1843  0255 a11f          	cp	a,#31
1844                     ; 650 							_key_continue = 1;
1845                     ; 651 							disp_status(_tcKeyPrev);
1847                     ; 652 							_tctimer100ms[_i0Prev] = 0;
1848  0257 2004          	jp	LC009
1849  0259               L536:
1850                     ; 657 						if( _tctimer100ms[_i0Prev] > TIME_LONG_TOUCH )
1852  0259 ad5e          	call	LC010
1853  025b a129          	cp	a,#41
1854                     ; 659 							_key_continue = 1;
1856  025d               LC009:
1857  025d 2513          	jrult	L705
1859  025f 35010000      	mov	__key_continue,#1
1860                     ; 660 							disp_status(_tcKeyPrev);
1862  0263               LC008:
1865  0263 c60006        	ld	a,__tcKeyPrev
1867                     ; 661 							_tctimer100ms[_i0Prev] = 0;
1869  0266               LC007:
1870  0266 cd0000        	call	_disp_status
1875  0269 c60007        	ld	a,__i0Prev
1876  026c 5f            	clrw	x
1877  026d 97            	ld	xl,a
1878  026e 724f0005      	clr	(__tctimer100ms,x)
1879  0272               L705:
1880                     ; 448 	while( _uart1_rx_tail != _uart1_rx_head )
1882  0272 c60000        	ld	a,__uart1_rx_tail
1883  0275 c10000        	cp	a,__uart1_rx_head
1884  0278 2703cc0063    	jrne	L505
1885                     ; 667 	if( _lcdTimer[2] != __timer1s )
1887  027d c60002        	ld	a,__lcdTimer+2
1888  0280 c10000        	cp	a,___timer1s
1889  0283 272d          	jreq	L546
1890                     ; 669 		_lcdTimer[2] = __timer1s;
1892  0285 5500000002    	mov	__lcdTimer+2,___timer1s
1893                     ; 670 		_lcdTimer[0]++;
1895  028a 725c0000      	inc	__lcdTimer
1896                     ; 671 		if( _lcdTimer[0] >= /*8*/15 )
1898  028e c60000        	ld	a,__lcdTimer
1899  0291 a10f          	cp	a,#15
1900  0293 251d          	jrult	L546
1901                     ; 673 			if( _lcdTimer[1] == 0 || _lcdTimer[1] == 3 )
1903  0295 c60001        	ld	a,__lcdTimer+1
1904  0298 2704          	jreq	L356
1906  029a a103          	cp	a,#3
1907  029c 260b          	jrne	L156
1908  029e               L356:
1909                     ; 676 				_lcdTimer[1] = 2;
1911  029e 35020001      	mov	__lcdTimer+1,#2
1912                     ; 677 				_backup_backlight2 = 0;
1914  02a2 725f0000      	clr	__backup_backlight2
1915                     ; 681 				_touchOff();
1917  02a6 cd0000        	call	__touchOff
1919  02a9               L156:
1920                     ; 684 			_lcdTimer[0] = 0;
1922  02a9 725f0000      	clr	__lcdTimer
1923                     ; 685 			_lcdTimer[3] = __timer100ms;
1925  02ad 5500000003    	mov	__lcdTimer+3,___timer100ms
1926  02b2               L546:
1927                     ; 689 	disp_status(0);
1929  02b2 4f            	clr	a
1930  02b3 cd0000        	call	_disp_status
1932                     ; 691 }
1933  02b6               L232:
1936  02b6 5b04          	addw	sp,#4
1937  02b8 81            	ret	
1938  02b9               LC010:
1939  02b9 c60007        	ld	a,__i0Prev
1940  02bc 5f            	clrw	x
1941  02bd 97            	ld	xl,a
1942  02be d60005        	ld	a,(__tctimer100ms,x)
1943  02c1 81            	ret	
1944  02c2               LC011:
1945  02c2 c70007        	ld	__i0Prev,a
1946                     ; 529 							beepSet(4);			
1948  02c5 a604          	ld	a,#4
1949  02c7 cd0000        	call	_beepSet
1951                     ; 530 							_key_continue = 0;
1953  02ca 725f0000      	clr	__key_continue
1954  02ce 81            	ret	
1955  02cf               LC012:
1956  02cf 35030001      	mov	__lcdTimer+1,#3
1957                     ; 630 						_lcdTimer[3] = __timer100ms;
1959  02d3 5500000003    	mov	__lcdTimer+3,___timer100ms
1960                     ; 631 						_backup_backlight2 = BACKLIGHT_MAX_LEVEL;
1962  02d8 35600000      	mov	__backup_backlight2,#96
1963  02dc 81            	ret	
1998                     ; 693 void	device_adc(void)
1998                     ; 694 {
1999                     .text:	section	.text,new
2000  0000               _device_adc:
2002  0000 88            	push	a
2003       00000001      OFST:	set	1
2006                     ; 696 	i = adcGet(0);
2008  0001 4f            	clr	a
2009  0002 cd0000        	call	_adcGet
2011  0005 6b01          	ld	(OFST+0,sp),a
2012                     ; 697 	if( i != currTemp )
2014  0007 c10000        	cp	a,_currTemp
2015  000a 2706          	jreq	L176
2016                     ; 699 		currTemp = i;
2018  000c c70000        	ld	_currTemp,a
2019                     ; 700 		disp_adc(i);
2021  000f cd0000        	call	_disp_adc
2023  0012               L176:
2024                     ; 702 }
2027  0012 84            	pop	a
2028  0013 81            	ret	
2031                     	switch	.data
2032  000b               ___tim30min_reset:
2033  000b 00            	dc.b	0
2057                     ; 711 uint8_t timerEventClear(void) {
2058                     .text:	section	.text,new
2059  0000               _timerEventClear:
2063                     ; 712 	__timer1sa = 0;
2065  0000 725f0000      	clr	___timer1sa
2066                     ; 713 	__timer1min = 0;
2068  0004 725f0000      	clr	___timer1min
2069                     ; 714 	__timer1h = 0 ;
2071  0008 725f0000      	clr	___timer1h
2072                     ; 715 }
2075  000c 81            	ret	
2108                     ; 726 void	timerEvent(void)
2108                     ; 727 {
2109                     .text:	section	.text,new
2110  0000               _timerEvent:
2112       00000002      OFST:	set	2
2115                     ; 728 	_tim1min++;
2117  0000 725c0000      	inc	__tim1min
2118  0004 89            	pushw	x
2119                     ; 729 	if( (_tim1min%30) == 0 )
2121  0005 c60000        	ld	a,__tim1min
2122  0008 5f            	clrw	x
2123  0009 97            	ld	xl,a
2124  000a a61e          	ld	a,#30
2125  000c cd0000        	call	c_smodx
2127  000f 5d            	tnzw	x
2128  0010 2615          	jrne	L317
2129                     ; 731 		if( _tim30min != 0xff )
2131  0012 c60000        	ld	a,__tim30min
2132  0015 4c            	inc	a
2133  0016 2713          	jreq	L127
2134                     ; 733 			if( __tim30min_reset == 0 )
2136  0018 c6000b        	ld	a,___tim30min_reset
2137  001b 260e          	jrne	L127
2138                     ; 735 				__tim30min_reset = 1;
2140  001d 3501000b      	mov	___tim30min_reset,#1
2141                     ; 736 				_tim30min++;
2143  0021 725c0000      	inc	__tim30min
2144  0025 2004          	jra	L127
2145  0027               L317:
2146                     ; 741 		__tim30min_reset = 0;
2148  0027 725f000b      	clr	___tim30min_reset
2149  002b               L127:
2150                     ; 743 	if( __boiler_shower[5] == 1 )
2152  002b c60005        	ld	a,___boiler_shower+5
2153  002e 4a            	dec	a
2154  002f 260f          	jrne	L327
2155                     ; 745 		__boiler_shower[4]++;
2157  0031 725c0004      	inc	___boiler_shower+4
2158                     ; 746 		if( __boiler_shower[4] >= /*21*/90 )
2160  0035 c60004        	ld	a,___boiler_shower+4
2161  0038 a15a          	cp	a,#90
2162  003a 2504          	jrult	L327
2163                     ; 749 			__boiler_shower[5] = 0x80;
2165  003c 35800005      	mov	___boiler_shower+5,#128
2166  0040               L327:
2167                     ; 753 	if( _disp_mode == 0x10 )
2169  0040 c60000        	ld	a,__disp_mode
2170  0043 a110          	cp	a,#16
2171  0045 2635          	jrne	L727
2172                     ; 776 		if( _timFlag == 0 )
2174  0047 c60000        	ld	a,__timFlag
2175  004a 2612          	jrne	L137
2176                     ; 778 			if( uiInfo.repeat == _tim1min )
2178  004c c6000c        	ld	a,_uiInfo+12
2179  004f c10000        	cp	a,__tim1min
2180  0052 2628          	jrne	L727
2181                     ; 780 				_tim1min = 0;
2183  0054 725f0000      	clr	__tim1min
2184                     ; 782 				_timFlag = 1;
2186  0058 35010000      	mov	__timFlag,#1
2187  005c 201e          	jra	L727
2188  005e               L137:
2189                     ; 787 			if( (_TIME_REPEAT_BASE-uiInfo.repeat) == _tim1min )
2191  005e c60000        	ld	a,__tim1min
2192  0061 5f            	clrw	x
2193  0062 97            	ld	xl,a
2194  0063 1f01          	ldw	(OFST-1,sp),x
2195  0065 4f            	clr	a
2196  0066 97            	ld	xl,a
2197  0067 a65a          	ld	a,#90
2198  0069 c0000c        	sub	a,_uiInfo+12
2199  006c 2401          	jrnc	L642
2200  006e 5a            	decw	x
2201  006f               L642:
2202  006f 02            	rlwa	x,a
2203  0070 1301          	cpw	x,(OFST-1,sp)
2204  0072 2608          	jrne	L727
2205                     ; 789 				_tim1min = 0;
2207  0074 725f0000      	clr	__tim1min
2208                     ; 791 				_timFlag = 0;
2210  0078 725f0000      	clr	__timFlag
2211  007c               L727:
2212                     ; 796 	if( _disp_mode == 0x08 )
2214  007c c60000        	ld	a,__disp_mode
2215  007f a108          	cp	a,#8
2216  0081 2618          	jrne	L147
2217                     ; 799 		if( uiInfo.reserve == _tim30min )
2219  0083 c6000d        	ld	a,_uiInfo+13
2220  0086 c10000        	cp	a,__tim30min
2221  0089 2610          	jrne	L147
2222                     ; 801 			_tim30min = 0xff;
2224  008b 35ff0000      	mov	__tim30min,#255
2225                     ; 802 			__s = 0;
2227  008f 725f0000      	clr	___s
2228                     ; 803 			_dsCount = 0;
2230  0093 725f0000      	clr	__dsCount
2231                     ; 804 			_key_blink = 0;
2233  0097 725f0000      	clr	__key_blink
2234  009b               L147:
2235                     ; 807 }
2238  009b 85            	popw	x
2239  009c 81            	ret	
2333                     ; 839 int		main()
2333                     ; 840 {
2334                     .text:	section	.text,new
2335  0000               _main:
2337  0000 5207          	subw	sp,#7
2338       00000007      OFST:	set	7
2341                     ; 841 	uint8_t	logo = 0;
2343  0002 0f01          	clr	(OFST-6,sp)
2344                     ; 845 	uint8_t	_loopStatus = 0;
2346  0004 0f02          	clr	(OFST-5,sp)
2347                     ; 849 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
2349  0006 4f            	clr	a
2350  0007 cd0000        	call	_CLK_SYSCLKDivConfig
2352                     ; 850 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
2354  000a a601          	ld	a,#1
2355  000c cd0000        	call	_CLK_SYSCLKSourceConfig
2358  000f               L577:
2359                     ; 852 	while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI)
2361  000f cd0000        	call	_CLK_GetSYSCLKSource
2363  0012 4a            	dec	a
2364  0013 26fa          	jrne	L577
2365                     ; 877 	GPIO_Init(GPIOC, GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Fast);
2367  0015 4be0          	push	#224
2368  0017 4b20          	push	#32
2369  0019 ae500a        	ldw	x,#20490
2370  001c cd0000        	call	_GPIO_Init
2372  001f 721a500a      	bset	20490,#5
2373  0023 85            	popw	x
2374                     ; 878 	D_IO_HIGH(GPIOC, GPIO_Pin_5);
2376                     ; 882 	GPIO_Init(GPIOE, GPIO_Pin_7, GPIO_Mode_Out_PP_Low_Fast);
2378  0024 4be0          	push	#224
2379  0026 4b80          	push	#128
2380  0028 ae5014        	ldw	x,#20500
2381  002b cd0000        	call	_GPIO_Init
2383  002e 85            	popw	x
2384                     ; 883 	GPIO_Init(GPIOC, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Fast);
2386  002f 4be0          	push	#224
2387  0031 4b40          	push	#64
2388  0033 ae500a        	ldw	x,#20490
2389  0036 cd0000        	call	_GPIO_Init
2391  0039 85            	popw	x
2392                     ; 884 	GPIO_Init(GPIOC, GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Fast);
2394  003a 4be0          	push	#224
2395  003c 4b20          	push	#32
2396  003e ae500a        	ldw	x,#20490
2397  0041 cd0000        	call	_GPIO_Init
2399  0044 85            	popw	x
2400                     ; 886 	GPIO_Init(GPIOD, GPIO_Pin_7, GPIO_Mode_Out_PP_Low_Fast);
2402  0045 4be0          	push	#224
2403  0047 4b80          	push	#128
2404  0049 ae500f        	ldw	x,#20495
2405  004c cd0000        	call	_GPIO_Init
2407  004f 85            	popw	x
2408                     ; 887 	GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_PP_Low_Fast);
2410  0050 4be0          	push	#224
2411  0052 4b02          	push	#2
2412  0054 ae500a        	ldw	x,#20490
2413  0057 cd0000        	call	_GPIO_Init
2415  005a 85            	popw	x
2416                     ; 888 	GPIO_Init(GPIOA, GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Fast);
2418  005b 4be0          	push	#224
2419  005d 4b04          	push	#4
2420  005f ae5000        	ldw	x,#20480
2421  0062 cd0000        	call	_GPIO_Init
2423  0065 35600000      	mov	__backlight,#96
2424  0069 85            	popw	x
2425                     ; 889 	_backlight = BACKLIGHT_MAX_LEVEL;//20;
2427                     ; 892 	systemTimer();
2429  006a cd0000        	call	_systemTimer
2431                     ; 894 	iouart_Open();
2433  006d cd0000        	call	_iouart_Open
2435                     ; 895 	encoder_Open();
2437  0070 cd0000        	call	_encoder_Open
2439                     ; 896 	systemADC();
2441  0073 cd0000        	call	_systemADC
2443                     ; 897 	systemLcd();
2445  0076 cd0000        	call	_systemLcd
2447                     ; 900 	GPIO_Init(D_BL_PORT, D_BL_PIN, GPIO_Mode_Out_PP_Low_Fast);
2449  0079 4be0          	push	#224
2450  007b 4b40          	push	#64
2451  007d ae5014        	ldw	x,#20500
2452  0080 cd0000        	call	_GPIO_Init
2454  0083 721c5014      	bset	20500,#6
2455  0087 725f0000      	clr	__lcdTimer
2456  008b 725f0001      	clr	__lcdTimer+1
2457  008f 85            	popw	x
2458  0090 5500000002    	mov	__lcdTimer+2,___timer1s
2459                     ; 901 	D_IO_HIGH(D_BL_PORT, D_BL_PIN);
2461                     ; 903 	_lcdTimer[0] = 0;
2463                     ; 904 	_lcdTimer[1] = 0;
2465                     ; 905 	_lcdTimer[2] = __timer1s;
2467                     ; 913 	systemUart();
2469  0095 cd0000        	call	_systemUart
2471                     ; 917 	lcd_clear(0);
2473  0098 4f            	clr	a
2474  0099 cd0000        	call	_lcd_clear
2476                     ; 924 	lcd_disp_n(0, 6);
2478  009c ae0006        	ldw	x,#6
2479  009f cd0000        	call	_lcd_disp_n
2481                     ; 926 		LCD_BIT_SET(b2A);
2483  00a2 c60003        	ld	a,_iLF_DEF+3
2484  00a5 cd0201        	call	LC013
2485  00a8 ca0003        	or	a,_bLF_DEF+3
2486  00ab d7540c        	ld	(21516,x),a
2487                     ; 927 		LCD_BIT_SET(b2D);
2489  00ae c6003c        	ld	a,_iLF_DEF+60
2490  00b1 cd0201        	call	LC013
2491  00b4 ca003c        	or	a,_bLF_DEF+60
2492  00b7 d7540c        	ld	(21516,x),a
2493                     ; 928 		LCD_BIT_SET(b2E);
2495  00ba c60029        	ld	a,_iLF_DEF+41
2496  00bd cd0201        	call	LC013
2497  00c0 ca0029        	or	a,_bLF_DEF+41
2498  00c3 d7540c        	ld	(21516,x),a
2499                     ; 929 		LCD_BIT_SET(b2F);
2501  00c6 c60016        	ld	a,_iLF_DEF+22
2502  00c9 cd0201        	call	LC013
2503  00cc ca0016        	or	a,_bLF_DEF+22
2504  00cf d7540c        	ld	(21516,x),a
2505                     ; 931 	lcd_disp_n(2, 2);
2507  00d2 ae0202        	ldw	x,#514
2508  00d5 cd0000        	call	_lcd_disp_n
2510                     ; 932 	lcd_disp_n(3, 7);
2512  00d8 ae0307        	ldw	x,#775
2513  00db cd0000        	call	_lcd_disp_n
2515                     ; 935 	indiIOUartIdle = 0;
2517  00de 725f0000      	clr	_indiIOUartIdle
2518                     ; 937 	rc_ptc_baseSet();
2520  00e2 cd0000        	call	_rc_ptc_baseSet
2522                     ; 938 	ui_Open();
2524  00e5 cd0000        	call	_ui_Open
2526                     ; 946 	if( uiInfo.id == 0 )
2528  00e8 c60004        	ld	a,_uiInfo+4
2529  00eb 2604          	jrne	L1001
2530                     ; 950 		_ds = 220;
2532  00ed 35dc0000      	mov	__ds,#220
2533  00f1               L1001:
2534                     ; 952 	enableInterrupts();
2537  00f1 9a            	rim	
2539                     ; 954 	for( i=0; i<24; i++ )	
2542  00f2 4f            	clr	a
2543  00f3 6b07          	ld	(OFST+0,sp),a
2544  00f5               L3001:
2545                     ; 955 		_add[i%12] = adcGet(1);
2547  00f5 5f            	clrw	x
2548  00f6 97            	ld	xl,a
2549  00f7 a60c          	ld	a,#12
2550  00f9 cd0000        	call	c_smodx
2552  00fc 89            	pushw	x
2553  00fd a601          	ld	a,#1
2554  00ff cd0000        	call	_adcGet
2556  0102 85            	popw	x
2557  0103 d70000        	ld	(__add,x),a
2558                     ; 954 	for( i=0; i<24; i++ )	
2560  0106 0c07          	inc	(OFST+0,sp)
2563  0108 7b07          	ld	a,(OFST+0,sp)
2564  010a a118          	cp	a,#24
2565  010c 25e7          	jrult	L3001
2566                     ; 958 	rcInfoSet(2, 20);	
2568  010e ae0214        	ldw	x,#532
2569  0111 cd0000        	call	_rcInfoSet
2571  0114               L547:
2572                     ; 961 Entry:		
2572                     ; 962 #if	defined(WATCHDOG_ENABLE)
2572                     ; 963 		while(1)
2572                     ; 964 		{
2572                     ; 965 			for(i=0; i<200; i++ )
2572                     ; 966 			{
2572                     ; 967 				for( j=0; j<250; j++);
2572                     ; 968 			}
2572                     ; 969 			break;
2572                     ; 970 		}
2572                     ; 971 		IWDG_ReloadCounter();
2572                     ; 972 #endif
2572                     ; 973 		i = 0;
2574                     ; 974 		if (timerCalc() == 1) 
2576  0114 cd0000        	call	_timerCalc
2578  0117 4a            	dec	a
2579  0118 2603          	jrne	L5101
2580                     ; 977 			timerEvent();
2582  011a cd0000        	call	_timerEvent
2584  011d               L5101:
2585                     ; 981 		if( _loopStatus == 0 )
2587  011d 7b02          	ld	a,(OFST-5,sp)
2588  011f 270b          	jreq	L1201
2590                     ; 984 		else if( _loopStatus == 3 )
2592  0121 a103          	cp	a,#3
2593  0123 2607          	jrne	L1201
2594                     ; 986 			factory(1);
2596  0125 a601          	ld	a,#1
2597  0127 cd0000        	call	_factory
2599                     ; 987 			goto Entry;
2601  012a 20e8          	jra	L547
2602  012c               L1201:
2603                     ; 990 		if( logo < 4 )
2605  012c 7b01          	ld	a,(OFST-6,sp)
2606  012e a104          	cp	a,#4
2607  0130 2419          	jruge	L5201
2608                     ; 992 			if( __timer1s != pp[1] )
2610  0132 c60000        	ld	a,___timer1s
2611  0135 1104          	cp	a,(OFST-3,sp)
2612  0137 27db          	jreq	L547
2613                     ; 994 				pp[1] = __timer1s;
2615  0139 6b04          	ld	(OFST-3,sp),a
2616                     ; 995 				if( logo == 2 )
2618  013b 7b01          	ld	a,(OFST-6,sp)
2619  013d a102          	cp	a,#2
2620  013f 2606          	jrne	L1301
2621                     ; 997 					logo = 100;
2623  0141 a664          	ld	a,#100
2624  0143 6b01          	ld	(OFST-6,sp),a
2626  0145 20cd          	jra	L547
2627  0147               L1301:
2628                     ; 1001 					logo++;
2630  0147 0c01          	inc	(OFST-6,sp)
2631  0149 20c9          	jra	L547
2632  014b               L5201:
2633                     ; 1007 		i = _iouartLoop();
2635  014b cd0000        	call	__iouartLoop
2637  014e 6b07          	ld	(OFST+0,sp),a
2638                     ; 1008 		if( i == 3 )		{	_loopStatus = 3;	}//	factory mode
2640  0150 a103          	cp	a,#3
2641  0152 2606          	jrne	L5301
2644  0154 a603          	ld	a,#3
2645  0156 6b02          	ld	(OFST-5,sp),a
2647  0158 2006          	jra	L7301
2648  015a               L5301:
2649                     ; 1009 		else if( i == 99 )	{	_loopStatus = 0;	}//	normal mode	
2651  015a a163          	cp	a,#99
2652  015c 2602          	jrne	L7301
2655  015e 0f02          	clr	(OFST-5,sp)
2656  0160               L7301:
2657                     ; 1011 		deviceCb();
2659  0160 cd0000        	call	_deviceCb
2661                     ; 1013 		if( (__timer1s%2) != pp[3] )
2663  0163 c60000        	ld	a,___timer1s
2664  0166 a401          	and	a,#1
2665  0168 1106          	cp	a,(OFST-1,sp)
2666  016a 2713          	jreq	L3401
2667                     ; 1015 			pp[3] = __timer1s%2;
2669  016c c60000        	ld	a,___timer1s
2670  016f a401          	and	a,#1
2671  0171 6b06          	ld	(OFST-1,sp),a
2672                     ; 1016 			if( pp[2] == 0 )
2674  0173 7b05          	ld	a,(OFST-2,sp)
2675  0175 260a          	jrne	L7401
2676                     ; 1018 				pp[2] = 1;
2678  0177 4c            	inc	a
2679  0178 6b05          	ld	(OFST-2,sp),a
2680                     ; 1019 				device_adc();
2682  017a cd0000        	call	_device_adc
2684  017d 2002          	jra	L7401
2685  017f               L3401:
2686                     ; 1023 			pp[2] = 0;
2688  017f 0f05          	clr	(OFST-2,sp)
2689  0181               L7401:
2690                     ; 1025 		if( (__timer1s) != pp[1] )
2692  0181 c60000        	ld	a,___timer1s
2693  0184 1104          	cp	a,(OFST-3,sp)
2694  0186 278c          	jreq	L547
2695                     ; 1027 			pp[1] = __timer1s;
2697  0188 6b04          	ld	(OFST-3,sp),a
2698                     ; 1029 			for( i=0; i<PACKET_SIZE; i++ )
2700  018a 4f            	clr	a
2701  018b 6b07          	ld	(OFST+0,sp),a
2702  018d               L3501:
2703                     ; 1031 				if( packet_buf[i] != ui_timeout )
2705  018d 5f            	clrw	x
2706  018e 97            	ld	xl,a
2707  018f d60017        	ld	a,(_packet_buf,x)
2708  0192 c10004        	cp	a,_ui_timeout
2709  0195 2708          	jreq	L1601
2710                     ; 1033 					packet_buf[i] += 1;
2712  0197 7b07          	ld	a,(OFST+0,sp)
2713  0199 5f            	clrw	x
2714  019a 97            	ld	xl,a
2715  019b 724c0017      	inc	(_packet_buf,x)
2716  019f               L1601:
2717                     ; 1029 			for( i=0; i<PACKET_SIZE; i++ )
2719  019f 0c07          	inc	(OFST+0,sp)
2722  01a1 7b07          	ld	a,(OFST+0,sp)
2723  01a3 a108          	cp	a,#8
2724  01a5 25e6          	jrult	L3501
2725                     ; 1036 			if( ui_error == 30 && ui_error_type == ERROR_TYPE_CNT )
2727  01a7 c60001        	ld	a,_ui_error
2728  01aa a11e          	cp	a,#30
2729  01ac 262d          	jrne	L3601
2731  01ae c60002        	ld	a,_ui_error_type
2732  01b1 a102          	cp	a,#2
2733  01b3 2626          	jrne	L3601
2734                     ; 1038 				if( packet_buf[uiInfo.id - 1] < ui_timeout-1 )
2736  01b5 ad50          	call	LC014
2737  01b7 5f            	clrw	x
2738  01b8 97            	ld	xl,a
2739  01b9 c60004        	ld	a,_ui_timeout
2740  01bc 905f          	clrw	y
2741  01be 9097          	ld	yl,a
2742  01c0 905a          	decw	y
2743  01c2 90bf00        	ldw	c_y,y
2744  01c5 b300          	cpw	x,c_y
2745  01c7 2f03cc0114    	jrsge	L547
2746                     ; 1040 					error_display_mode = 0;
2748  01cc 725f0000      	clr	_error_display_mode
2749                     ; 1041 					ui_error = 0;
2751  01d0 725f0001      	clr	_ui_error
2752                     ; 1042 					ui_error_type = 0;
2754  01d4 725f0002      	clr	_ui_error_type
2755  01d8 cc0114        	jra	L547
2756  01db               L3601:
2757                     ; 1047 				if( packet_buf[uiInfo.id - 1] == ui_timeout )
2759  01db ad2a          	call	LC014
2760  01dd c10004        	cp	a,_ui_timeout
2761  01e0 26f6          	jrne	L547
2762                     ; 1049 					error_display(ERROR_TYPE_CNT, 30);
2764  01e2 ae021e        	ldw	x,#542
2765  01e5 cd0000        	call	_error_display
2767                     ; 1050 					ui_timeout = PACKET_ERROR_COUNT_60;
2769  01e8 353c0004      	mov	_ui_timeout,#60
2770                     ; 1052 					for( i=0; i<PACKET_SIZE; i++ )
2772  01ec 4f            	clr	a
2773  01ed 6b07          	ld	(OFST+0,sp),a
2774  01ef               L3701:
2775                     ; 1054 						packet_buf[i] = PACKET_ERROR_COUNT_60;
2777  01ef 5f            	clrw	x
2778  01f0 97            	ld	xl,a
2779  01f1 a63c          	ld	a,#60
2780  01f3 d70017        	ld	(_packet_buf,x),a
2781                     ; 1052 					for( i=0; i<PACKET_SIZE; i++ )
2783  01f6 0c07          	inc	(OFST+0,sp)
2786  01f8 7b07          	ld	a,(OFST+0,sp)
2787  01fa a108          	cp	a,#8
2788  01fc 25f1          	jrult	L3701
2789  01fe cc0114        	jra	L547
2790  0201               LC013:
2791  0201 5f            	clrw	x
2792  0202 97            	ld	xl,a
2793  0203 d6540c        	ld	a,(21516,x)
2794  0206 81            	ret	
2795  0207               LC014:
2796  0207 c60004        	ld	a,_uiInfo+4
2797  020a 5f            	clrw	x
2798  020b 97            	ld	xl,a
2799  020c 5a            	decw	x
2800  020d d60017        	ld	a,(_packet_buf,x)
2801  0210 81            	ret	
2995                     	xdef	_main
2996                     	xref	__add
2997                     	xdef	_timerEvent
2998                     	xdef	_timerEventClear
2999                     	xdef	___tim30min_reset
3000                     	xref	___timer1sa
3001                     	xref	__timFlag
3002                     	xref	__tim1min
3003                     	xref	__tim30min
3004                     	xdef	_device_adc
3005                     	xdef	_deviceCb
3006                     	xdef	___b
3007                     	xdef	__p
3008                     	xdef	__touchOff
3009                     	xdef	__touchOn
3010                     	xdef	__touchCntl
3011                     	xdef	__led_key_onOff
3012                     	xdef	__touchKey
3013                     	xref	_beepSet
3014                     	xref	__uart1_rx_tail
3015                     	xref	__uart1_rx_head
3016                     	xdef	__mkey
3017                     	xdef	__i0Prev
3018                     	xdef	__tcKeyPrev
3019                     	switch	.bss
3020  0000               __tcKey:
3021  0000 00            	ds.b	1
3022                     	xdef	__tcKey
3023  0001               _tc:
3024  0001 0000          	ds.b	2
3025                     	xdef	_tc
3026  0003               __tct10:
3027  0003 00            	ds.b	1
3028                     	xdef	__tct10
3029  0004               __tct0:
3030  0004 00            	ds.b	1
3031                     	xdef	__tct0
3032  0005               __tctimer100ms:
3033  0005 000000000000  	ds.b	6
3034                     	xdef	__tctimer100ms
3035  000b               __tctimer:
3036  000b 000000000000  	ds.b	6
3037                     	xdef	__tctimer
3038  0011               _tct:
3039  0011 000000000000  	ds.b	6
3040                     	xdef	_tct
3041                     	xdef	_tci
3042                     	xdef	_disp_key
3043                     	xref	__key_continue
3044                     	xdef	__iouartLoop
3045                     	xdef	__call_ptc_lse
3046                     	xdef	__call_ptc_woodang
3047                     	xdef	__msgLoop
3048                     	xdef	_getCurrTemp
3049                     	xdef	_ui_timeout
3050                     	xdef	_ui_error_type
3051                     	xdef	_ui_error
3052  0017               _packet_buf:
3053  0017 000000000000  	ds.b	8
3054                     	xdef	_packet_buf
3055                     	xdef	_currTemp
3056                     	xref	_error_display_mode
3057                     	xref	_only_one
3058                     	xref	__backup_backlight2
3059                     	xref	__backlight
3060                     	xref	__lcdTimer
3061                     	xdef	_ver
3062                     	xdef	_rc_type
3063                     	xref	_rcInfoSet
3064                     	xref	_rc_ptc_make_mirror
3065                     	xref	_rc_ptc_make
3066                     	xref	_rc_ptc_make_setting
3067                     	xref	_getState_check
3068                     	xref	_rc_ptc_check
3069                     	xref	_rc_ptc_baseSet
3070                     	xref	_factory
3071                     	xref	___boiler_shower
3072                     	xref	__key_blink
3073                     	xref	__disp_mode
3074                     	xref	__dsCount
3075                     	xref	__ds
3076                     	xref	_ui_Open
3077                     	xref	___s
3078                     	xref	_disp_status
3079                     	xref	_lcd_disp_n
3080                     	xref	_lcd_clear
3081                     	xref	_iLF_DEF
3082                     	xref	_bLF_DEF
3083                     	xref	_uiInfo
3084                     	xref	_timerCalc
3085                     	xref	_systemTimer
3086                     	xref	___timer1h
3087                     	xref	___timer1min
3088                     	xref	___timer1s
3089                     	xref	___timer100ms
3090                     	xref	__t20ms
3091                     	xref	_systemUart
3092                     	xref	_uart1_get
3093                     	xref	_uart1_tx_put
3094                     	xref	_iouart_getReadBuffer
3095                     	xref	_iouart_getBuffer
3096                     	xref	_iouart_Ready
3097                     	xref	__io_tail
3098                     	xref	__io_head
3099                     	xref	_iouart_Pkt_Start
3100                     	xref	_iouart_Set_Packet
3101                     	xref	_iouart_Open
3102                     	xref	_indiIOUartIdle
3103                     	xref	_error_display
3104                     	xref	_systemLcd
3105                     	xref	_encoder_Open
3106                     	xdef	_disp_enc
3107                     	xdef	_disp_adc
3108                     	xref	_adcGet
3109                     	xref	_systemADC
3110                     	xref	_GPIO_Init
3111                     	xref	_CLK_SYSCLKDivConfig
3112                     	xref	_CLK_GetSYSCLKSource
3113                     	xref	_CLK_SYSCLKSourceConfig
3114                     	switch	.const
3115  000e               L521:
3116  000e 6500          	dc.b	"e",0
3117                     	xref.b	c_x
3118                     	xref.b	c_y
3138                     	xref	c_smodx
3139                     	end
