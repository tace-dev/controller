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
1075                     ; 295 void	_touchCntli(uint8_t j, uint8_t i)
1075                     ; 296 {
1076                     .text:	section	.text,new
1077  0000               __touchCntli:
1079  0000 89            	pushw	x
1080       00000000      OFST:	set	0
1083                     ; 297 	if( j == 1 )	_touchCntl(GPIOE, GPIO_Pin_7, i);
1085  0001 9e            	ld	a,xh
1086  0002 4a            	dec	a
1087  0003 260b          	jrne	L314
1090  0005 9f            	ld	a,xl
1091  0006 88            	push	a
1092  0007 4b80          	push	#128
1093  0009 ae5014        	ldw	x,#20500
1094  000c cd0000        	call	__touchCntl
1096  000f 85            	popw	x
1097  0010               L314:
1098                     ; 298 	if( j == 2 )	_touchCntl(GPIOC, GPIO_Pin_6, i);
1100  0010 7b01          	ld	a,(OFST+1,sp)
1101  0012 a102          	cp	a,#2
1102  0014 260e          	jrne	L514
1105  0016 7b02          	ld	a,(OFST+2,sp)
1106  0018 88            	push	a
1107  0019 4b40          	push	#64
1108  001b ae500a        	ldw	x,#20490
1109  001e cd0000        	call	__touchCntl
1111  0021 85            	popw	x
1112  0022 7b01          	ld	a,(OFST+1,sp)
1113  0024               L514:
1114                     ; 299 	if( j == 3 )	_touchCntl(GPIOC, GPIO_Pin_5, i);
1116  0024 a103          	cp	a,#3
1117  0026 260e          	jrne	L714
1120  0028 7b02          	ld	a,(OFST+2,sp)
1121  002a 88            	push	a
1122  002b 4b20          	push	#32
1123  002d ae500a        	ldw	x,#20490
1124  0030 cd0000        	call	__touchCntl
1126  0033 85            	popw	x
1127  0034 7b01          	ld	a,(OFST+1,sp)
1128  0036               L714:
1129                     ; 300 	if( j == 4 )	_touchCntl(GPIOD, GPIO_Pin_7, i);
1131  0036 a104          	cp	a,#4
1132  0038 260e          	jrne	L124
1135  003a 7b02          	ld	a,(OFST+2,sp)
1136  003c 88            	push	a
1137  003d 4b80          	push	#128
1138  003f ae500f        	ldw	x,#20495
1139  0042 cd0000        	call	__touchCntl
1141  0045 85            	popw	x
1142  0046 7b01          	ld	a,(OFST+1,sp)
1143  0048               L124:
1144                     ; 301 	if( j == 5 )	_touchCntl(GPIOC, GPIO_Pin_1, i);
1146  0048 a105          	cp	a,#5
1147  004a 260e          	jrne	L324
1150  004c 7b02          	ld	a,(OFST+2,sp)
1151  004e 88            	push	a
1152  004f 4b02          	push	#2
1153  0051 ae500a        	ldw	x,#20490
1154  0054 cd0000        	call	__touchCntl
1156  0057 85            	popw	x
1157  0058 7b01          	ld	a,(OFST+1,sp)
1158  005a               L324:
1159                     ; 302 	if( j == 6 )	_touchCntl(GPIOA, GPIO_Pin_2, i);
1161  005a a106          	cp	a,#6
1162  005c 260c          	jrne	L524
1165  005e 7b02          	ld	a,(OFST+2,sp)
1166  0060 88            	push	a
1167  0061 4b04          	push	#4
1168  0063 ae5000        	ldw	x,#20480
1169  0066 cd0000        	call	__touchCntl
1171  0069 85            	popw	x
1172  006a               L524:
1173                     ; 303 }
1176  006a 85            	popw	x
1177  006b 81            	ret	
1202                     ; 305 void	_touchOn(void)
1202                     ; 306 {
1203                     .text:	section	.text,new
1204  0000               __touchOn:
1208                     ; 307 	_led_key_onOff = 0;
1210  0000 725f0009      	clr	__led_key_onOff
1211                     ; 309 	_touchCntl(GPIOE, GPIO_Pin_7, 0);
1213  0004 4b00          	push	#0
1214  0006 4b80          	push	#128
1215  0008 ae5014        	ldw	x,#20500
1216  000b cd0000        	call	__touchCntl
1218  000e 85            	popw	x
1219                     ; 310 	_touchCntl(GPIOC, GPIO_Pin_6, 0);
1221  000f 4b00          	push	#0
1222  0011 4b40          	push	#64
1223  0013 ae500a        	ldw	x,#20490
1224  0016 cd0000        	call	__touchCntl
1226  0019 85            	popw	x
1227                     ; 311 	_touchCntl(GPIOC, GPIO_Pin_5, 0);
1229  001a 4b00          	push	#0
1230  001c 4b20          	push	#32
1231  001e ae500a        	ldw	x,#20490
1232  0021 cd0000        	call	__touchCntl
1234  0024 85            	popw	x
1235                     ; 313 	_touchCntl(GPIOC, GPIO_Pin_1, 0);
1237  0025 4b00          	push	#0
1238  0027 4b02          	push	#2
1239  0029 ae500a        	ldw	x,#20490
1240  002c cd0000        	call	__touchCntl
1242  002f 85            	popw	x
1243                     ; 314 	_touchCntl(GPIOA, GPIO_Pin_2, 0);
1245  0030 4b00          	push	#0
1246  0032 4b04          	push	#4
1247  0034 ae5000        	ldw	x,#20480
1248  0037 cd0000        	call	__touchCntl
1250  003a 85            	popw	x
1251                     ; 315 }
1254  003b 81            	ret	
1279                     ; 317 void	_touchOff(void)
1279                     ; 318 {
1280                     .text:	section	.text,new
1281  0000               __touchOff:
1285                     ; 319 	_led_key_onOff = 1;
1287  0000 35010009      	mov	__led_key_onOff,#1
1288                     ; 321 	_touchCntl(GPIOE, GPIO_Pin_7, 1);
1290  0004 4b01          	push	#1
1291  0006 4b80          	push	#128
1292  0008 ae5014        	ldw	x,#20500
1293  000b cd0000        	call	__touchCntl
1295  000e 85            	popw	x
1296                     ; 322 	_touchCntl(GPIOC, GPIO_Pin_6, 1);
1298  000f 4b01          	push	#1
1299  0011 4b40          	push	#64
1300  0013 ae500a        	ldw	x,#20490
1301  0016 cd0000        	call	__touchCntl
1303  0019 85            	popw	x
1304                     ; 323 	_touchCntl(GPIOC, GPIO_Pin_5, 1);
1306  001a 4b01          	push	#1
1307  001c 4b20          	push	#32
1308  001e ae500a        	ldw	x,#20490
1309  0021 cd0000        	call	__touchCntl
1311  0024 85            	popw	x
1312                     ; 325 	_touchCntl(GPIOC, GPIO_Pin_1, 1);
1314  0025 4b01          	push	#1
1315  0027 4b02          	push	#2
1316  0029 ae500a        	ldw	x,#20490
1317  002c cd0000        	call	__touchCntl
1319  002f 85            	popw	x
1320                     ; 326 	_touchCntl(GPIOA, GPIO_Pin_2, 1);
1322  0030 4b01          	push	#1
1323  0032 4b04          	push	#4
1324  0034 ae5000        	ldw	x,#20480
1325  0037 cd0000        	call	__touchCntl
1327  003a 85            	popw	x
1328                     ; 327 }
1331  003b 81            	ret	
1334                     	switch	.data
1335  000a               __p:
1336  000a 00            	dc.b	0
1370                     ; 333 void	__b(uint8_t k)
1370                     ; 334 {
1371                     .text:	section	.text,new
1372  0000               ___b:
1376                     ; 335 	lcd_clear(0);
1378  0000 4f            	clr	a
1379  0001 cd0000        	call	_lcd_clear
1381                     ; 343 LCD_BIT_SET(_p);
1383  0004 c6000a        	ld	a,__p
1384  0007 5f            	clrw	x
1385  0008 97            	ld	xl,a
1386  0009 d60000        	ld	a,(_iLF_DEF,x)
1387  000c 5f            	clrw	x
1388  000d 97            	ld	xl,a
1389  000e c6000a        	ld	a,__p
1390  0011 905f          	clrw	y
1391  0013 9097          	ld	yl,a
1392  0015 d6540c        	ld	a,(21516,x)
1393  0018 90da0000      	or	a,(_bLF_DEF,y)
1394  001c d7540c        	ld	(21516,x),a
1395                     ; 344 	_p++;
1397  001f 725c000a      	inc	__p
1398                     ; 345 }
1401  0023 81            	ret	
1479                     ; 347 void	deviceCb(void)
1479                     ; 348 {
1480                     .text:	section	.text,new
1481  0000               _deviceCb:
1483  0000 5204          	subw	sp,#4
1484       00000004      OFST:	set	4
1487                     ; 349 	uint8_t	lcd = 0;
1489                     ; 424 	if( _tct0 == _t20ms )
1491  0002 c60004        	ld	a,__tct0
1492  0005 c10000        	cp	a,__t20ms
1493  0008 2603cc02b6    	jreq	L052
1494                     ; 425 		return;
1496                     ; 427 	_tct0 = _t20ms;
1498  000d 5500000004    	mov	__tct0,__t20ms
1499                     ; 428 	for( i=0; i<6; i++ )
1501  0012 4f            	clr	a
1502  0013 6b04          	ld	(OFST+0,sp),a
1503  0015               L515:
1504                     ; 430 		if( tct[i]==1 )
1506  0015 5f            	clrw	x
1507  0016 97            	ld	xl,a
1508  0017 d60011        	ld	a,(_tct,x)
1509  001a 4a            	dec	a
1510  001b 2608          	jrne	L325
1511                     ; 431 			_tctimer[i]++;
1513  001d 7b04          	ld	a,(OFST+0,sp)
1514  001f 5f            	clrw	x
1515  0020 97            	ld	xl,a
1516  0021 724c000b      	inc	(__tctimer,x)
1517  0025               L325:
1518                     ; 428 	for( i=0; i<6; i++ )
1520  0025 0c04          	inc	(OFST+0,sp)
1523  0027 7b04          	ld	a,(OFST+0,sp)
1524  0029 a106          	cp	a,#6
1525  002b 25e8          	jrult	L515
1526                     ; 434 	if( _uart1_rx_tail == _uart1_rx_head )
1528  002d c60000        	ld	a,__uart1_rx_tail
1529  0030 c10000        	cp	a,__uart1_rx_head
1530  0033 2703cc0272    	jrne	L145
1531                     ; 436 		_tct10++;
1533  0038 725c0003      	inc	__tct10
1534                     ; 437 		if( _tct10 >= 5 )
1536  003c c60003        	ld	a,__tct10
1537  003f a105          	cp	a,#5
1538  0041 25f2          	jrult	L145
1539                     ; 439 			for( i=0; i<6; i++ )
1541  0043 4f            	clr	a
1542  0044 6b04          	ld	(OFST+0,sp),a
1543  0046               L135:
1544                     ; 440 				tct[i] = 0;
1546  0046 5f            	clrw	x
1547  0047 97            	ld	xl,a
1548  0048 724f0011      	clr	(_tct,x)
1549                     ; 439 			for( i=0; i<6; i++ )
1551  004c 0c04          	inc	(OFST+0,sp)
1554  004e 7b04          	ld	a,(OFST+0,sp)
1555  0050 a106          	cp	a,#6
1556  0052 25f2          	jrult	L135
1557                     ; 441 			_tct10 = 0;
1559  0054 725f0003      	clr	__tct10
1560                     ; 442 			_tcKeyPrev = 0xff;
1562  0058 35ff0006      	mov	__tcKeyPrev,#255
1563                     ; 443 			_mkey = 0xff;
1565  005c 35ff0008      	mov	__mkey,#255
1566  0060 cc0272        	jra	L145
1567  0063               L735:
1568                     ; 450 		i = uart1_get();
1570  0063 cd0000        	call	_uart1_get
1572  0066 6b04          	ld	(OFST+0,sp),a
1573                     ; 451 		if( i == 0xff )
1575  0068 4c            	inc	a
1576  0069 2606          	jrne	L545
1577                     ; 453 			tci = 0;
1579  006b c70005        	ld	_tci,a
1580                     ; 454 			continue;
1582  006e cc0272        	jra	L145
1583  0071               L545:
1584                     ; 456 			tc[tci] = i;
1586  0071 c60005        	ld	a,_tci
1587  0074 5f            	clrw	x
1588  0075 97            	ld	xl,a
1589  0076 7b04          	ld	a,(OFST+0,sp)
1590  0078 d70001        	ld	(_tc,x),a
1591                     ; 457 			tci = tci==0 ? 1 : 0;
1593  007b 725d0005      	tnz	_tci
1594  007f 2604          	jrne	L002
1595  0081 a601          	ld	a,#1
1596  0083 2001          	jra	L202
1597  0085               L002:
1598  0085 4f            	clr	a
1599  0086               L202:
1600  0086 c70005        	ld	_tci,a
1601                     ; 458 			if( tci != 0 )
1603  0089 725d0005      	tnz	_tci
1604  008d 26df          	jrne	L145
1605                     ; 459 				continue;
1607                     ; 461 			i = tc[0] + tc[1];
1609  008f c60002        	ld	a,_tc+1
1610  0092 cb0001        	add	a,_tc
1611  0095 6b04          	ld	(OFST+0,sp),a
1612                     ; 462 			if( i != 0xff )
1614  0097 4c            	inc	a
1615  0098 26d4          	jrne	L145
1616                     ; 463 				continue;
1618                     ; 465 			_tct10 = 0;
1620  009a c70003        	ld	__tct10,a
1621                     ; 467 			_tcKey = _touchKey(0, 0x01, 0x01);
1623  009d 4b01          	push	#1
1624  009f ae0001        	ldw	x,#1
1625  00a2 cd0000        	call	__touchKey
1627  00a5 5b01          	addw	sp,#1
1628  00a7 c70000        	ld	__tcKey,a
1629                     ; 468 			_tcKey |= _touchKey(1, 0x02, 0x04);
1631  00aa 4b04          	push	#4
1632  00ac ae0102        	ldw	x,#258
1633  00af cd0000        	call	__touchKey
1635  00b2 5b01          	addw	sp,#1
1636  00b4 ca0000        	or	a,__tcKey
1637  00b7 c70000        	ld	__tcKey,a
1638                     ; 469 			_tcKey |= _touchKey(2, 0x04, 0x10);
1640  00ba 4b10          	push	#16
1641  00bc ae0204        	ldw	x,#516
1642  00bf cd0000        	call	__touchKey
1644  00c2 5b01          	addw	sp,#1
1645  00c4 ca0000        	or	a,__tcKey
1646  00c7 c70000        	ld	__tcKey,a
1647                     ; 470 			_tcKey |= _touchKey(3, 0x08, 0x02);
1649  00ca 4b02          	push	#2
1650  00cc ae0308        	ldw	x,#776
1651  00cf cd0000        	call	__touchKey
1653  00d2 5b01          	addw	sp,#1
1654  00d4 ca0000        	or	a,__tcKey
1655  00d7 c70000        	ld	__tcKey,a
1656                     ; 471 			_tcKey |= _touchKey(4, 0x10, 0x08);
1658  00da 4b08          	push	#8
1659  00dc ae0410        	ldw	x,#1040
1660  00df cd0000        	call	__touchKey
1662  00e2 5b01          	addw	sp,#1
1663  00e4 ca0000        	or	a,__tcKey
1664  00e7 c70000        	ld	__tcKey,a
1665                     ; 472 			_tcKey |= _touchKey(5, 0x20, 0x20);
1667  00ea 4b20          	push	#32
1668  00ec ae0520        	ldw	x,#1312
1669  00ef cd0000        	call	__touchKey
1671  00f2 5b01          	addw	sp,#1
1672  00f4 ca0000        	or	a,__tcKey
1673  00f7 c70000        	ld	__tcKey,a
1674                     ; 482 			if( _tcKey == 0 )
1676  00fa 725d0000      	tnz	__tcKey
1677  00fe 2607          	jrne	L355
1678                     ; 484 				_tcKeyPrev = 0xff;
1680  0100 35ff0006      	mov	__tcKeyPrev,#255
1681                     ; 485 				continue;
1683  0104 cc0272        	jra	L145
1684  0107               L355:
1685                     ; 488 			lcd = 1;
1687                     ; 489 			j = 0;
1689  0107 0f03          	clr	(OFST-1,sp)
1690                     ; 490 			i0 = 0xff;
1692  0109 a6ff          	ld	a,#255
1693  010b 6b02          	ld	(OFST-2,sp),a
1694                     ; 491 			for( i=0; i<6; i++ )
1696  010d 4f            	clr	a
1697  010e 6b04          	ld	(OFST+0,sp),a
1698  0110               L555:
1699                     ; 493 				if( tct[i]==1 )
1701  0110 5f            	clrw	x
1702  0111 97            	ld	xl,a
1703  0112 d60011        	ld	a,(_tct,x)
1704  0115 4a            	dec	a
1705  0116 2606          	jrne	L365
1706                     ; 495 					j++;
1708  0118 0c03          	inc	(OFST-1,sp)
1709                     ; 496 					i0 = i;
1711  011a 7b04          	ld	a,(OFST+0,sp)
1712  011c 6b02          	ld	(OFST-2,sp),a
1713  011e               L365:
1714                     ; 491 			for( i=0; i<6; i++ )
1716  011e 0c04          	inc	(OFST+0,sp)
1719  0120 7b04          	ld	a,(OFST+0,sp)
1720  0122 a106          	cp	a,#6
1721  0124 25ea          	jrult	L555
1722                     ; 501 			if( j >= 3 && _mkey != 0xff )
1724  0126 7b03          	ld	a,(OFST-1,sp)
1725  0128 a103          	cp	a,#3
1726  012a 2516          	jrult	L565
1728  012c c60008        	ld	a,__mkey
1729  012f 4c            	inc	a
1730  0130 2710          	jreq	L565
1731                     ; 503 				if( _tcKey == 0x55 )		goto K_55;
1733  0132 c60000        	ld	a,__tcKey
1734  0135 a155          	cp	a,#85
1735  0137 2736          	jreq	L364
1738                     ; 504 				if( _tcKey == 0x53 )		goto K_53;
1740  0139 c60000        	ld	a,__tcKey
1741  013c a153          	cp	a,#83
1742  013e 26c4          	jrne	L145
1745  0140 2060          	jra	L564
1746  0142               L565:
1747                     ; 507 			if( j == 1 && _mkey != 0xff )
1749  0142 7b03          	ld	a,(OFST-1,sp)
1750  0144 4a            	dec	a
1751  0145 2616          	jrne	L375
1753  0147 c60008        	ld	a,__mkey
1754  014a 4c            	inc	a
1755  014b 2710          	jreq	L375
1756                     ; 509 				if( _tcKey == 0x55 )		goto K_55;
1758  014d c60000        	ld	a,__tcKey
1759  0150 a155          	cp	a,#85
1760  0152 271b          	jreq	L364
1763                     ; 510 				if( _tcKey == 0x53 )		goto K_53;
1765  0154 c60000        	ld	a,__tcKey
1766  0157 a153          	cp	a,#83
1767  0159 26a9          	jrne	L145
1770  015b 2045          	jra	L564
1771  015d               L375:
1772                     ; 513 			if( j == 2 )
1774  015d 7b03          	ld	a,(OFST-1,sp)
1775  015f a102          	cp	a,#2
1776  0161 266c          	jrne	L106
1777                     ; 517 				if( tct[2] == 1 )
1779  0163 c60013        	ld	a,_tct+2
1780  0166 4a            	dec	a
1781  0167 2669          	jrne	L764
1782                     ; 519 					if( tct[5] == 1 )
1784  0169 c60016        	ld	a,_tct+5
1785  016c 4a            	dec	a
1786  016d 262d          	jrne	L506
1787  016f               L364:
1788                     ; 521 K_55:						
1788                     ; 522 						//	ID
1788                     ; 523 						_tcKey = 0x55;
1790  016f 35550000      	mov	__tcKey,#85
1791                     ; 524 						_mkey = 0x24;
1793  0173 35240008      	mov	__mkey,#36
1794                     ; 525 						if( _tcKey != _tcKeyPrev )
1796  0177 c60000        	ld	a,__tcKey
1797  017a c10006        	cp	a,__tcKeyPrev
1798  017d 270d          	jreq	L706
1799                     ; 527 							_tcKeyPrev = _tcKey;
1801  017f 5500000006    	mov	__tcKeyPrev,__tcKey
1802                     ; 528 							_i0Prev = i0;
1804  0184 7b02          	ld	a,(OFST-2,sp)
1805  0186 cd02c2        	call	LC011
1806                     ; 530 							_key_continue = 0;
1807  0189 cc0272        	jra	L145
1808  018c               L706:
1809                     ; 535 							if( _tctimer100ms[_i0Prev] > 35 )//TIME_LONG_TOUCH )
1811  018c cd02b9        	call	LC010
1812  018f a124          	cp	a,#36
1813  0191 25f6          	jrult	L145
1814                     ; 537 								_key_continue = 1;
1816  0193 35010000      	mov	__key_continue,#1
1817                     ; 538 								disp_status(0x55);
1819  0197 a655          	ld	a,#85
1821                     ; 539 								_tctimer100ms[_i0Prev] = 0;
1822  0199 cc0266        	jp	LC007
1823  019c               L506:
1824                     ; 545 					else if( tct[1] == 1 )
1826  019c c60012        	ld	a,_tct+1
1827  019f 4a            	dec	a
1828  01a0 2630          	jrne	L764
1829  01a2               L564:
1830                     ; 547 K_53:						
1830                     ; 548 						//	Option
1830                     ; 549 						_tcKey = 0x53;
1832  01a2 35530000      	mov	__tcKey,#83
1833                     ; 550 						_mkey = 0x60;
1835  01a6 35600008      	mov	__mkey,#96
1836                     ; 551 						if( _tcKey != _tcKeyPrev )
1838  01aa c60000        	ld	a,__tcKey
1839  01ad c10006        	cp	a,__tcKeyPrev
1840  01b0 270d          	jreq	L126
1841                     ; 553 							_tcKeyPrev = _tcKey;
1843  01b2 5500000006    	mov	__tcKeyPrev,__tcKey
1844                     ; 554 							_i0Prev = i0;
1846  01b7 7b02          	ld	a,(OFST-2,sp)
1847  01b9 cd02c2        	call	LC011
1848                     ; 556 							_key_continue = 0;
1849  01bc cc0272        	jra	L145
1850  01bf               L126:
1851                     ; 561 							if( _tctimer100ms[_i0Prev] > 35 )//TIME_LONG_TOUCH )
1853  01bf cd02b9        	call	LC010
1854  01c2 a124          	cp	a,#36
1855  01c4 25f6          	jrult	L145
1856                     ; 563 								_key_continue = 1;
1858  01c6 35010000      	mov	__key_continue,#1
1859                     ; 564 								disp_status(0x53);
1861  01ca a653          	ld	a,#83
1863                     ; 565 								_tctimer100ms[_i0Prev] = 0;
1864  01cc cc0266        	jp	LC007
1865  01cf               L106:
1866                     ; 574 			if( j != 1 )
1868  01cf 4a            	dec	a
1869  01d0 2714          	jreq	L726
1870  01d2               L764:
1871                     ; 576 CLEAR_KEY_ENTRY:
1871                     ; 577 				for( i=0; i<6; i++ )
1873  01d2 4f            	clr	a
1874  01d3 6b04          	ld	(OFST+0,sp),a
1875  01d5               L136:
1876                     ; 578 					tct[i] = 0;
1878  01d5 5f            	clrw	x
1879  01d6 97            	ld	xl,a
1880  01d7 724f0011      	clr	(_tct,x)
1881                     ; 577 				for( i=0; i<6; i++ )
1883  01db 0c04          	inc	(OFST+0,sp)
1886  01dd 7b04          	ld	a,(OFST+0,sp)
1887  01df a106          	cp	a,#6
1888  01e1 25f2          	jrult	L136
1889                     ; 579 				continue;
1891  01e3 cc0272        	jra	L145
1892  01e6               L726:
1893                     ; 582 			if( _tcKeyPrev != _tcKey )
1895  01e6 c60006        	ld	a,__tcKeyPrev
1896  01e9 c10000        	cp	a,__tcKey
1897  01ec 2748          	jreq	L736
1898                     ; 584 				_tcKeyPrev = _tcKey;
1900  01ee 5500000006    	mov	__tcKeyPrev,__tcKey
1901                     ; 585 				_i0Prev = i0;
1903  01f3 7b02          	ld	a,(OFST-2,sp)
1904  01f5 cd02c2        	call	LC011
1905                     ; 589 					_lcdTimer[0] = 0;
1907  01f8 725f0000      	clr	__lcdTimer
1908                     ; 590 					_lcdTimer[2] = __timer1s;
1910  01fc 5500000002    	mov	__lcdTimer+2,___timer1s
1911                     ; 591 					if( _lcdTimer[1] == 2 )
1913  0201 c60001        	ld	a,__lcdTimer+1
1914  0204 a102          	cp	a,#2
1915  0206 260d          	jrne	L146
1916                     ; 594 						_lcdTimer[1] = 3;
1918  0208 cd02cf        	call	LC012
1919                     ; 598 						_touchOn();
1921  020b cd0000        	call	__touchOn
1923                     ; 601 						_uart1_rx_tail = _uart1_rx_head;
1925  020e 5500000000    	mov	__uart1_rx_tail,__uart1_rx_head
1927  0213 205d          	jra	L145
1928  0215               L146:
1929                     ; 604 					else if( _lcdTimer[1] == 3 )
1931  0215 a103          	cp	a,#3
1932  0217 2612          	jrne	L546
1933                     ; 606 						_tcKeyPrev = 0xff;
1935  0219 35ff0006      	mov	__tcKeyPrev,#255
1936                     ; 607 						if( _lcdTimer[3] == __timer100ms )
1938  021d c60003        	ld	a,__lcdTimer+3
1939  0220 c10000        	cp	a,___timer100ms
1940  0223 274d          	jreq	L145
1942                     ; 612 							_lcdTimer[1] = 0;
1944  0225 725f0001      	clr	__lcdTimer+1
1945  0229 2047          	jra	L145
1946  022b               L546:
1947                     ; 629 						_lcdTimer[1] = 3;
1949  022b cd02cf        	call	LC012
1950                     ; 633 						disp_status(_tcKey);
1952  022e c60000        	ld	a,__tcKey
1953  0231 cd0000        	call	_disp_status
1955  0234 203c          	jra	L145
1956  0236               L736:
1957                     ; 638 				if (_tcKeyPrev == 0x10 || _tcKeyPrev == 0x20) {
1959  0236 c60006        	ld	a,__tcKeyPrev
1960  0239 a110          	cp	a,#16
1961  023b 2707          	jreq	L166
1963  023d c60006        	ld	a,__tcKeyPrev
1964  0240 a120          	cp	a,#32
1965  0242 2608          	jrne	L756
1966  0244               L166:
1967                     ; 639 					if( _tctimer100ms[_i0Prev] > 2 )
1969  0244 ad73          	call	LC010
1970  0246 a103          	cp	a,#3
1971  0248 2528          	jrult	L145
1972                     ; 641 						disp_status(_tcKeyPrev);
1974                     ; 642 						_tctimer100ms[_i0Prev] = 0;
1975  024a 2017          	jp	LC008
1976  024c               L756:
1977                     ; 645 					if( _tcKeyPrev == 0x04 )
1979  024c c60006        	ld	a,__tcKeyPrev
1980  024f a104          	cp	a,#4
1981  0251 2606          	jrne	L766
1982                     ; 648 						if( _tctimer100ms[_i0Prev] > 30 /*TIME_LONG_TOUCH*/ )
1984  0253 ad64          	call	LC010
1985  0255 a11f          	cp	a,#31
1986                     ; 650 							_key_continue = 1;
1987                     ; 651 							disp_status(_tcKeyPrev);
1989                     ; 652 							_tctimer100ms[_i0Prev] = 0;
1990  0257 2004          	jp	LC009
1991  0259               L766:
1992                     ; 657 						if( _tctimer100ms[_i0Prev] > TIME_LONG_TOUCH )
1994  0259 ad5e          	call	LC010
1995  025b a129          	cp	a,#41
1996                     ; 659 							_key_continue = 1;
1998  025d               LC009:
1999  025d 2513          	jrult	L145
2001  025f 35010000      	mov	__key_continue,#1
2002                     ; 660 							disp_status(_tcKeyPrev);
2004  0263               LC008:
2007  0263 c60006        	ld	a,__tcKeyPrev
2009                     ; 661 							_tctimer100ms[_i0Prev] = 0;
2011  0266               LC007:
2012  0266 cd0000        	call	_disp_status
2017  0269 c60007        	ld	a,__i0Prev
2018  026c 5f            	clrw	x
2019  026d 97            	ld	xl,a
2020  026e 724f0005      	clr	(__tctimer100ms,x)
2021  0272               L145:
2022                     ; 448 	while( _uart1_rx_tail != _uart1_rx_head )
2024  0272 c60000        	ld	a,__uart1_rx_tail
2025  0275 c10000        	cp	a,__uart1_rx_head
2026  0278 2703cc0063    	jrne	L735
2027                     ; 667 	if( _lcdTimer[2] != __timer1s )
2029  027d c60002        	ld	a,__lcdTimer+2
2030  0280 c10000        	cp	a,___timer1s
2031  0283 272d          	jreq	L776
2032                     ; 669 		_lcdTimer[2] = __timer1s;
2034  0285 5500000002    	mov	__lcdTimer+2,___timer1s
2035                     ; 670 		_lcdTimer[0]++;
2037  028a 725c0000      	inc	__lcdTimer
2038                     ; 671 		if( _lcdTimer[0] >= /*8*/15 )
2040  028e c60000        	ld	a,__lcdTimer
2041  0291 a10f          	cp	a,#15
2042  0293 251d          	jrult	L776
2043                     ; 673 			if( _lcdTimer[1] == 0 || _lcdTimer[1] == 3 )
2045  0295 c60001        	ld	a,__lcdTimer+1
2046  0298 2704          	jreq	L507
2048  029a a103          	cp	a,#3
2049  029c 260b          	jrne	L307
2050  029e               L507:
2051                     ; 676 				_lcdTimer[1] = 2;
2053  029e 35020001      	mov	__lcdTimer+1,#2
2054                     ; 677 				_backup_backlight2 = 0;
2056  02a2 725f0000      	clr	__backup_backlight2
2057                     ; 681 				_touchOff();
2059  02a6 cd0000        	call	__touchOff
2061  02a9               L307:
2062                     ; 684 			_lcdTimer[0] = 0;
2064  02a9 725f0000      	clr	__lcdTimer
2065                     ; 685 			_lcdTimer[3] = __timer100ms;
2067  02ad 5500000003    	mov	__lcdTimer+3,___timer100ms
2068  02b2               L776:
2069                     ; 689 	disp_status(0);
2071  02b2 4f            	clr	a
2072  02b3 cd0000        	call	_disp_status
2074                     ; 691 }
2075  02b6               L052:
2078  02b6 5b04          	addw	sp,#4
2079  02b8 81            	ret	
2080  02b9               LC010:
2081  02b9 c60007        	ld	a,__i0Prev
2082  02bc 5f            	clrw	x
2083  02bd 97            	ld	xl,a
2084  02be d60005        	ld	a,(__tctimer100ms,x)
2085  02c1 81            	ret	
2086  02c2               LC011:
2087  02c2 c70007        	ld	__i0Prev,a
2088                     ; 529 							beepSet(4);			
2090  02c5 a604          	ld	a,#4
2091  02c7 cd0000        	call	_beepSet
2093                     ; 530 							_key_continue = 0;
2095  02ca 725f0000      	clr	__key_continue
2096  02ce 81            	ret	
2097  02cf               LC012:
2098  02cf 35030001      	mov	__lcdTimer+1,#3
2099                     ; 630 						_lcdTimer[3] = __timer100ms;
2101  02d3 5500000003    	mov	__lcdTimer+3,___timer100ms
2102                     ; 631 						_backup_backlight2 = BACKLIGHT_MAX_LEVEL;
2104  02d8 35600000      	mov	__backup_backlight2,#96
2105  02dc 81            	ret	
2140                     ; 693 void	device_adc(void)
2140                     ; 694 {
2141                     .text:	section	.text,new
2142  0000               _device_adc:
2144  0000 88            	push	a
2145       00000001      OFST:	set	1
2148                     ; 696 	i = adcGet(0);
2150  0001 4f            	clr	a
2151  0002 cd0000        	call	_adcGet
2153  0005 6b01          	ld	(OFST+0,sp),a
2154                     ; 697 	if( i != currTemp )
2156  0007 c10000        	cp	a,_currTemp
2157  000a 2706          	jreq	L327
2158                     ; 699 		currTemp = i;
2160  000c c70000        	ld	_currTemp,a
2161                     ; 700 		disp_adc(i);
2163  000f cd0000        	call	_disp_adc
2165  0012               L327:
2166                     ; 702 }
2169  0012 84            	pop	a
2170  0013 81            	ret	
2173                     	switch	.data
2174  000b               ___tim30min_reset:
2175  000b 00            	dc.b	0
2199                     ; 711 uint8_t timerEventClear(void) {
2200                     .text:	section	.text,new
2201  0000               _timerEventClear:
2205                     ; 712 	__timer1sa = 0;
2207  0000 725f0000      	clr	___timer1sa
2208                     ; 713 	__timer1min = 0;
2210  0004 725f0000      	clr	___timer1min
2211                     ; 714 	__timer1h = 0 ;
2213  0008 725f0000      	clr	___timer1h
2214                     ; 715 }
2217  000c 81            	ret	
2250                     ; 726 void	timerEvent(void)
2250                     ; 727 {
2251                     .text:	section	.text,new
2252  0000               _timerEvent:
2254       00000002      OFST:	set	2
2257                     ; 728 	_tim1min++;
2259  0000 725c0000      	inc	__tim1min
2260  0004 89            	pushw	x
2261                     ; 729 	if( (_tim1min%30) == 0 )
2263  0005 c60000        	ld	a,__tim1min
2264  0008 5f            	clrw	x
2265  0009 97            	ld	xl,a
2266  000a a61e          	ld	a,#30
2267  000c cd0000        	call	c_smodx
2269  000f 5d            	tnzw	x
2270  0010 2615          	jrne	L547
2271                     ; 731 		if( _tim30min != 0xff )
2273  0012 c60000        	ld	a,__tim30min
2274  0015 4c            	inc	a
2275  0016 2713          	jreq	L357
2276                     ; 733 			if( __tim30min_reset == 0 )
2278  0018 c6000b        	ld	a,___tim30min_reset
2279  001b 260e          	jrne	L357
2280                     ; 735 				__tim30min_reset = 1;
2282  001d 3501000b      	mov	___tim30min_reset,#1
2283                     ; 736 				_tim30min++;
2285  0021 725c0000      	inc	__tim30min
2286  0025 2004          	jra	L357
2287  0027               L547:
2288                     ; 741 		__tim30min_reset = 0;
2290  0027 725f000b      	clr	___tim30min_reset
2291  002b               L357:
2292                     ; 743 	if( __boiler_shower[5] == 1 )
2294  002b c60005        	ld	a,___boiler_shower+5
2295  002e 4a            	dec	a
2296  002f 260f          	jrne	L557
2297                     ; 745 		__boiler_shower[4]++;
2299  0031 725c0004      	inc	___boiler_shower+4
2300                     ; 746 		if( __boiler_shower[4] >= /*21*/90 )
2302  0035 c60004        	ld	a,___boiler_shower+4
2303  0038 a15a          	cp	a,#90
2304  003a 2504          	jrult	L557
2305                     ; 749 			__boiler_shower[5] = 0x80;
2307  003c 35800005      	mov	___boiler_shower+5,#128
2308  0040               L557:
2309                     ; 753 	if( _disp_mode == 0x10 )
2311  0040 c60000        	ld	a,__disp_mode
2312  0043 a110          	cp	a,#16
2313  0045 2635          	jrne	L167
2314                     ; 776 		if( _timFlag == 0 )
2316  0047 c60000        	ld	a,__timFlag
2317  004a 2612          	jrne	L367
2318                     ; 778 			if( uiInfo.repeat == _tim1min )
2320  004c c6000c        	ld	a,_uiInfo+12
2321  004f c10000        	cp	a,__tim1min
2322  0052 2628          	jrne	L167
2323                     ; 780 				_tim1min = 0;
2325  0054 725f0000      	clr	__tim1min
2326                     ; 782 				_timFlag = 1;
2328  0058 35010000      	mov	__timFlag,#1
2329  005c 201e          	jra	L167
2330  005e               L367:
2331                     ; 787 			if( (_TIME_REPEAT_BASE-uiInfo.repeat) == _tim1min )
2333  005e c60000        	ld	a,__tim1min
2334  0061 5f            	clrw	x
2335  0062 97            	ld	xl,a
2336  0063 1f01          	ldw	(OFST-1,sp),x
2337  0065 4f            	clr	a
2338  0066 97            	ld	xl,a
2339  0067 a65a          	ld	a,#90
2340  0069 c0000c        	sub	a,_uiInfo+12
2341  006c 2401          	jrnc	L462
2342  006e 5a            	decw	x
2343  006f               L462:
2344  006f 02            	rlwa	x,a
2345  0070 1301          	cpw	x,(OFST-1,sp)
2346  0072 2608          	jrne	L167
2347                     ; 789 				_tim1min = 0;
2349  0074 725f0000      	clr	__tim1min
2350                     ; 791 				_timFlag = 0;
2352  0078 725f0000      	clr	__timFlag
2353  007c               L167:
2354                     ; 796 	if( _disp_mode == 0x08 )
2356  007c c60000        	ld	a,__disp_mode
2357  007f a108          	cp	a,#8
2358  0081 2618          	jrne	L377
2359                     ; 799 		if( uiInfo.reserve == _tim30min )
2361  0083 c6000d        	ld	a,_uiInfo+13
2362  0086 c10000        	cp	a,__tim30min
2363  0089 2610          	jrne	L377
2364                     ; 801 			_tim30min = 0xff;
2366  008b 35ff0000      	mov	__tim30min,#255
2367                     ; 802 			__s = 0;
2369  008f 725f0000      	clr	___s
2370                     ; 803 			_dsCount = 0;
2372  0093 725f0000      	clr	__dsCount
2373                     ; 804 			_key_blink = 0;
2375  0097 725f0000      	clr	__key_blink
2376  009b               L377:
2377                     ; 807 }
2380  009b 85            	popw	x
2381  009c 81            	ret	
2475                     ; 839 int		main()
2475                     ; 840 {
2476                     .text:	section	.text,new
2477  0000               _main:
2479  0000 5207          	subw	sp,#7
2480       00000007      OFST:	set	7
2483                     ; 841 	uint8_t	logo = 0;
2485  0002 0f01          	clr	(OFST-6,sp)
2486                     ; 845 	uint8_t	_loopStatus = 0;
2488  0004 0f02          	clr	(OFST-5,sp)
2489                     ; 849 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
2491  0006 4f            	clr	a
2492  0007 cd0000        	call	_CLK_SYSCLKDivConfig
2494                     ; 850 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
2496  000a a601          	ld	a,#1
2497  000c cd0000        	call	_CLK_SYSCLKSourceConfig
2500  000f               L7201:
2501                     ; 852 	while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI)
2503  000f cd0000        	call	_CLK_GetSYSCLKSource
2505  0012 4a            	dec	a
2506  0013 26fa          	jrne	L7201
2507                     ; 877 	GPIO_Init(GPIOC, GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Fast);
2509  0015 4be0          	push	#224
2510  0017 4b20          	push	#32
2511  0019 ae500a        	ldw	x,#20490
2512  001c cd0000        	call	_GPIO_Init
2514  001f 721a500a      	bset	20490,#5
2515  0023 85            	popw	x
2516                     ; 878 	D_IO_HIGH(GPIOC, GPIO_Pin_5);
2518                     ; 882 	GPIO_Init(GPIOE, GPIO_Pin_7, GPIO_Mode_Out_PP_Low_Fast);
2520  0024 4be0          	push	#224
2521  0026 4b80          	push	#128
2522  0028 ae5014        	ldw	x,#20500
2523  002b cd0000        	call	_GPIO_Init
2525  002e 85            	popw	x
2526                     ; 883 	GPIO_Init(GPIOC, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Fast);
2528  002f 4be0          	push	#224
2529  0031 4b40          	push	#64
2530  0033 ae500a        	ldw	x,#20490
2531  0036 cd0000        	call	_GPIO_Init
2533  0039 85            	popw	x
2534                     ; 884 	GPIO_Init(GPIOC, GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Fast);
2536  003a 4be0          	push	#224
2537  003c 4b20          	push	#32
2538  003e ae500a        	ldw	x,#20490
2539  0041 cd0000        	call	_GPIO_Init
2541  0044 85            	popw	x
2542                     ; 886 	GPIO_Init(GPIOD, GPIO_Pin_7, GPIO_Mode_Out_PP_Low_Fast);
2544  0045 4be0          	push	#224
2545  0047 4b80          	push	#128
2546  0049 ae500f        	ldw	x,#20495
2547  004c cd0000        	call	_GPIO_Init
2549  004f 85            	popw	x
2550                     ; 887 	GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_PP_Low_Fast);
2552  0050 4be0          	push	#224
2553  0052 4b02          	push	#2
2554  0054 ae500a        	ldw	x,#20490
2555  0057 cd0000        	call	_GPIO_Init
2557  005a 85            	popw	x
2558                     ; 888 	GPIO_Init(GPIOA, GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Fast);
2560  005b 4be0          	push	#224
2561  005d 4b04          	push	#4
2562  005f ae5000        	ldw	x,#20480
2563  0062 cd0000        	call	_GPIO_Init
2565  0065 35600000      	mov	__backlight,#96
2566  0069 85            	popw	x
2567                     ; 889 	_backlight = BACKLIGHT_MAX_LEVEL;//20;
2569                     ; 892 	systemTimer();
2571  006a cd0000        	call	_systemTimer
2573                     ; 894 	iouart_Open();
2575  006d cd0000        	call	_iouart_Open
2577                     ; 895 	encoder_Open();
2579  0070 cd0000        	call	_encoder_Open
2581                     ; 896 	systemADC();
2583  0073 cd0000        	call	_systemADC
2585                     ; 897 	systemLcd();
2587  0076 cd0000        	call	_systemLcd
2589                     ; 900 	GPIO_Init(D_BL_PORT, D_BL_PIN, GPIO_Mode_Out_PP_Low_Fast);
2591  0079 4be0          	push	#224
2592  007b 4b40          	push	#64
2593  007d ae5014        	ldw	x,#20500
2594  0080 cd0000        	call	_GPIO_Init
2596  0083 721c5014      	bset	20500,#6
2597  0087 725f0000      	clr	__lcdTimer
2598  008b 725f0001      	clr	__lcdTimer+1
2599  008f 85            	popw	x
2600  0090 5500000002    	mov	__lcdTimer+2,___timer1s
2601                     ; 901 	D_IO_HIGH(D_BL_PORT, D_BL_PIN);
2603                     ; 903 	_lcdTimer[0] = 0;
2605                     ; 904 	_lcdTimer[1] = 0;
2607                     ; 905 	_lcdTimer[2] = __timer1s;
2609                     ; 913 	systemUart();
2611  0095 cd0000        	call	_systemUart
2613                     ; 917 	lcd_clear(0);
2615  0098 4f            	clr	a
2616  0099 cd0000        	call	_lcd_clear
2618                     ; 924 	lcd_disp_n(0, 6);
2620  009c ae0006        	ldw	x,#6
2621  009f cd0000        	call	_lcd_disp_n
2623                     ; 926 		LCD_BIT_SET(b2A);
2625  00a2 c60003        	ld	a,_iLF_DEF+3
2626  00a5 cd0201        	call	LC013
2627  00a8 ca0003        	or	a,_bLF_DEF+3
2628  00ab d7540c        	ld	(21516,x),a
2629                     ; 927 		LCD_BIT_SET(b2D);
2631  00ae c6003c        	ld	a,_iLF_DEF+60
2632  00b1 cd0201        	call	LC013
2633  00b4 ca003c        	or	a,_bLF_DEF+60
2634  00b7 d7540c        	ld	(21516,x),a
2635                     ; 928 		LCD_BIT_SET(b2E);
2637  00ba c60029        	ld	a,_iLF_DEF+41
2638  00bd cd0201        	call	LC013
2639  00c0 ca0029        	or	a,_bLF_DEF+41
2640  00c3 d7540c        	ld	(21516,x),a
2641                     ; 929 		LCD_BIT_SET(b2F);
2643  00c6 c60016        	ld	a,_iLF_DEF+22
2644  00c9 cd0201        	call	LC013
2645  00cc ca0016        	or	a,_bLF_DEF+22
2646  00cf d7540c        	ld	(21516,x),a
2647                     ; 931 	lcd_disp_n(2, 2);
2649  00d2 ae0202        	ldw	x,#514
2650  00d5 cd0000        	call	_lcd_disp_n
2652                     ; 932 	lcd_disp_n(3, 2);
2654  00d8 ae0302        	ldw	x,#770
2655  00db cd0000        	call	_lcd_disp_n
2657                     ; 935 	indiIOUartIdle = 0;
2659  00de 725f0000      	clr	_indiIOUartIdle
2660                     ; 937 	rc_ptc_baseSet();
2662  00e2 cd0000        	call	_rc_ptc_baseSet
2664                     ; 938 	ui_Open();
2666  00e5 cd0000        	call	_ui_Open
2668                     ; 946 	if( uiInfo.id == 0 )
2670  00e8 c60004        	ld	a,_uiInfo+4
2671  00eb 2604          	jrne	L3301
2672                     ; 950 		_ds = 220;
2674  00ed 35dc0000      	mov	__ds,#220
2675  00f1               L3301:
2676                     ; 952 	enableInterrupts();
2679  00f1 9a            	rim	
2681                     ; 954 	for( i=0; i<24; i++ )	
2684  00f2 4f            	clr	a
2685  00f3 6b07          	ld	(OFST+0,sp),a
2686  00f5               L5301:
2687                     ; 955 		_add[i%12] = adcGet(1);
2689  00f5 5f            	clrw	x
2690  00f6 97            	ld	xl,a
2691  00f7 a60c          	ld	a,#12
2692  00f9 cd0000        	call	c_smodx
2694  00fc 89            	pushw	x
2695  00fd a601          	ld	a,#1
2696  00ff cd0000        	call	_adcGet
2698  0102 85            	popw	x
2699  0103 d70000        	ld	(__add,x),a
2700                     ; 954 	for( i=0; i<24; i++ )	
2702  0106 0c07          	inc	(OFST+0,sp)
2705  0108 7b07          	ld	a,(OFST+0,sp)
2706  010a a118          	cp	a,#24
2707  010c 25e7          	jrult	L5301
2708                     ; 958 	rcInfoSet(2, 20);	
2710  010e ae0214        	ldw	x,#532
2711  0111 cd0000        	call	_rcInfoSet
2713  0114               L777:
2714                     ; 961 Entry:		
2714                     ; 962 #if	defined(WATCHDOG_ENABLE)
2714                     ; 963 		while(1)
2714                     ; 964 		{
2714                     ; 965 			for(i=0; i<200; i++ )
2714                     ; 966 			{
2714                     ; 967 				for( j=0; j<250; j++);
2714                     ; 968 			}
2714                     ; 969 			break;
2714                     ; 970 		}
2714                     ; 971 		IWDG_ReloadCounter();
2714                     ; 972 #endif
2714                     ; 973 		i = 0;
2716                     ; 974 		if (timerCalc() == 1) 
2718  0114 cd0000        	call	_timerCalc
2720  0117 4a            	dec	a
2721  0118 2603          	jrne	L7401
2722                     ; 977 			timerEvent();
2724  011a cd0000        	call	_timerEvent
2726  011d               L7401:
2727                     ; 981 		if( _loopStatus == 0 )
2729  011d 7b02          	ld	a,(OFST-5,sp)
2730  011f 270b          	jreq	L3501
2732                     ; 984 		else if( _loopStatus == 3 )
2734  0121 a103          	cp	a,#3
2735  0123 2607          	jrne	L3501
2736                     ; 986 			factory(1);
2738  0125 a601          	ld	a,#1
2739  0127 cd0000        	call	_factory
2741                     ; 987 			goto Entry;
2743  012a 20e8          	jra	L777
2744  012c               L3501:
2745                     ; 990 		if( logo < 4 )
2747  012c 7b01          	ld	a,(OFST-6,sp)
2748  012e a104          	cp	a,#4
2749  0130 2419          	jruge	L7501
2750                     ; 992 			if( __timer1s != pp[1] )
2752  0132 c60000        	ld	a,___timer1s
2753  0135 1104          	cp	a,(OFST-3,sp)
2754  0137 27db          	jreq	L777
2755                     ; 994 				pp[1] = __timer1s;
2757  0139 6b04          	ld	(OFST-3,sp),a
2758                     ; 995 				if( logo == 2 )
2760  013b 7b01          	ld	a,(OFST-6,sp)
2761  013d a102          	cp	a,#2
2762  013f 2606          	jrne	L3601
2763                     ; 997 					logo = 100;
2765  0141 a664          	ld	a,#100
2766  0143 6b01          	ld	(OFST-6,sp),a
2768  0145 20cd          	jra	L777
2769  0147               L3601:
2770                     ; 1001 					logo++;
2772  0147 0c01          	inc	(OFST-6,sp)
2773  0149 20c9          	jra	L777
2774  014b               L7501:
2775                     ; 1007 		i = _iouartLoop();
2777  014b cd0000        	call	__iouartLoop
2779  014e 6b07          	ld	(OFST+0,sp),a
2780                     ; 1008 		if( i == 3 )		{	_loopStatus = 3;	}//	factory mode
2782  0150 a103          	cp	a,#3
2783  0152 2606          	jrne	L7601
2786  0154 a603          	ld	a,#3
2787  0156 6b02          	ld	(OFST-5,sp),a
2789  0158 2006          	jra	L1701
2790  015a               L7601:
2791                     ; 1009 		else if( i == 99 )	{	_loopStatus = 0;	}//	normal mode	
2793  015a a163          	cp	a,#99
2794  015c 2602          	jrne	L1701
2797  015e 0f02          	clr	(OFST-5,sp)
2798  0160               L1701:
2799                     ; 1011 		deviceCb();
2801  0160 cd0000        	call	_deviceCb
2803                     ; 1013 		if( (__timer1s%2) != pp[3] )
2805  0163 c60000        	ld	a,___timer1s
2806  0166 a401          	and	a,#1
2807  0168 1106          	cp	a,(OFST-1,sp)
2808  016a 2713          	jreq	L5701
2809                     ; 1015 			pp[3] = __timer1s%2;
2811  016c c60000        	ld	a,___timer1s
2812  016f a401          	and	a,#1
2813  0171 6b06          	ld	(OFST-1,sp),a
2814                     ; 1016 			if( pp[2] == 0 )
2816  0173 7b05          	ld	a,(OFST-2,sp)
2817  0175 260a          	jrne	L1011
2818                     ; 1018 				pp[2] = 1;
2820  0177 4c            	inc	a
2821  0178 6b05          	ld	(OFST-2,sp),a
2822                     ; 1019 				device_adc();
2824  017a cd0000        	call	_device_adc
2826  017d 2002          	jra	L1011
2827  017f               L5701:
2828                     ; 1023 			pp[2] = 0;
2830  017f 0f05          	clr	(OFST-2,sp)
2831  0181               L1011:
2832                     ; 1025 		if( (__timer1s) != pp[1] )
2834  0181 c60000        	ld	a,___timer1s
2835  0184 1104          	cp	a,(OFST-3,sp)
2836  0186 278c          	jreq	L777
2837                     ; 1027 			pp[1] = __timer1s;
2839  0188 6b04          	ld	(OFST-3,sp),a
2840                     ; 1029 			for( i=0; i<PACKET_SIZE; i++ )
2842  018a 4f            	clr	a
2843  018b 6b07          	ld	(OFST+0,sp),a
2844  018d               L5011:
2845                     ; 1031 				if( packet_buf[i] != ui_timeout )
2847  018d 5f            	clrw	x
2848  018e 97            	ld	xl,a
2849  018f d60017        	ld	a,(_packet_buf,x)
2850  0192 c10004        	cp	a,_ui_timeout
2851  0195 2708          	jreq	L3111
2852                     ; 1033 					packet_buf[i] += 1;
2854  0197 7b07          	ld	a,(OFST+0,sp)
2855  0199 5f            	clrw	x
2856  019a 97            	ld	xl,a
2857  019b 724c0017      	inc	(_packet_buf,x)
2858  019f               L3111:
2859                     ; 1029 			for( i=0; i<PACKET_SIZE; i++ )
2861  019f 0c07          	inc	(OFST+0,sp)
2864  01a1 7b07          	ld	a,(OFST+0,sp)
2865  01a3 a108          	cp	a,#8
2866  01a5 25e6          	jrult	L5011
2867                     ; 1036 			if( ui_error == 30 && ui_error_type == ERROR_TYPE_CNT )
2869  01a7 c60001        	ld	a,_ui_error
2870  01aa a11e          	cp	a,#30
2871  01ac 262d          	jrne	L5111
2873  01ae c60002        	ld	a,_ui_error_type
2874  01b1 a102          	cp	a,#2
2875  01b3 2626          	jrne	L5111
2876                     ; 1038 				if( packet_buf[uiInfo.id - 1] < ui_timeout-1 )
2878  01b5 ad50          	call	LC014
2879  01b7 5f            	clrw	x
2880  01b8 97            	ld	xl,a
2881  01b9 c60004        	ld	a,_ui_timeout
2882  01bc 905f          	clrw	y
2883  01be 9097          	ld	yl,a
2884  01c0 905a          	decw	y
2885  01c2 90bf00        	ldw	c_y,y
2886  01c5 b300          	cpw	x,c_y
2887  01c7 2f03cc0114    	jrsge	L777
2888                     ; 1040 					error_display_mode = 0;
2890  01cc 725f0000      	clr	_error_display_mode
2891                     ; 1041 					ui_error = 0;
2893  01d0 725f0001      	clr	_ui_error
2894                     ; 1042 					ui_error_type = 0;
2896  01d4 725f0002      	clr	_ui_error_type
2897  01d8 cc0114        	jra	L777
2898  01db               L5111:
2899                     ; 1047 				if( packet_buf[uiInfo.id - 1] == ui_timeout )
2901  01db ad2a          	call	LC014
2902  01dd c10004        	cp	a,_ui_timeout
2903  01e0 26f6          	jrne	L777
2904                     ; 1049 					error_display(ERROR_TYPE_CNT, 30);
2906  01e2 ae021e        	ldw	x,#542
2907  01e5 cd0000        	call	_error_display
2909                     ; 1050 					ui_timeout = PACKET_ERROR_COUNT_60;
2911  01e8 353c0004      	mov	_ui_timeout,#60
2912                     ; 1052 					for( i=0; i<PACKET_SIZE; i++ )
2914  01ec 4f            	clr	a
2915  01ed 6b07          	ld	(OFST+0,sp),a
2916  01ef               L5211:
2917                     ; 1054 						packet_buf[i] = PACKET_ERROR_COUNT_60;
2919  01ef 5f            	clrw	x
2920  01f0 97            	ld	xl,a
2921  01f1 a63c          	ld	a,#60
2922  01f3 d70017        	ld	(_packet_buf,x),a
2923                     ; 1052 					for( i=0; i<PACKET_SIZE; i++ )
2925  01f6 0c07          	inc	(OFST+0,sp)
2928  01f8 7b07          	ld	a,(OFST+0,sp)
2929  01fa a108          	cp	a,#8
2930  01fc 25f1          	jrult	L5211
2931  01fe cc0114        	jra	L777
2932  0201               LC013:
2933  0201 5f            	clrw	x
2934  0202 97            	ld	xl,a
2935  0203 d6540c        	ld	a,(21516,x)
2936  0206 81            	ret	
2937  0207               LC014:
2938  0207 c60004        	ld	a,_uiInfo+4
2939  020a 5f            	clrw	x
2940  020b 97            	ld	xl,a
2941  020c 5a            	decw	x
2942  020d d60017        	ld	a,(_packet_buf,x)
2943  0210 81            	ret	
3137                     	xdef	_main
3138                     	xref	__add
3139                     	xdef	_timerEvent
3140                     	xdef	_timerEventClear
3141                     	xdef	___tim30min_reset
3142                     	xref	___timer1sa
3143                     	xref	__timFlag
3144                     	xref	__tim1min
3145                     	xref	__tim30min
3146                     	xdef	_device_adc
3147                     	xdef	_deviceCb
3148                     	xdef	___b
3149                     	xdef	__p
3150                     	xdef	__touchOff
3151                     	xdef	__touchOn
3152                     	xdef	__touchCntli
3153                     	xdef	__touchCntl
3154                     	xdef	__led_key_onOff
3155                     	xdef	__touchKey
3156                     	xref	_beepSet
3157                     	xref	__uart1_rx_tail
3158                     	xref	__uart1_rx_head
3159                     	xdef	__mkey
3160                     	xdef	__i0Prev
3161                     	xdef	__tcKeyPrev
3162                     	switch	.bss
3163  0000               __tcKey:
3164  0000 00            	ds.b	1
3165                     	xdef	__tcKey
3166  0001               _tc:
3167  0001 0000          	ds.b	2
3168                     	xdef	_tc
3169  0003               __tct10:
3170  0003 00            	ds.b	1
3171                     	xdef	__tct10
3172  0004               __tct0:
3173  0004 00            	ds.b	1
3174                     	xdef	__tct0
3175  0005               __tctimer100ms:
3176  0005 000000000000  	ds.b	6
3177                     	xdef	__tctimer100ms
3178  000b               __tctimer:
3179  000b 000000000000  	ds.b	6
3180                     	xdef	__tctimer
3181  0011               _tct:
3182  0011 000000000000  	ds.b	6
3183                     	xdef	_tct
3184                     	xdef	_tci
3185                     	xdef	_disp_key
3186                     	xref	__key_continue
3187                     	xdef	__iouartLoop
3188                     	xdef	__call_ptc_lse
3189                     	xdef	__call_ptc_woodang
3190                     	xdef	__msgLoop
3191                     	xdef	_getCurrTemp
3192                     	xdef	_ui_timeout
3193                     	xdef	_ui_error_type
3194                     	xdef	_ui_error
3195  0017               _packet_buf:
3196  0017 000000000000  	ds.b	8
3197                     	xdef	_packet_buf
3198                     	xdef	_currTemp
3199                     	xref	_error_display_mode
3200                     	xref	_only_one
3201                     	xref	__backup_backlight2
3202                     	xref	__backlight
3203                     	xref	__lcdTimer
3204                     	xdef	_ver
3205                     	xdef	_rc_type
3206                     	xref	_rcInfoSet
3207                     	xref	_rc_ptc_make_mirror
3208                     	xref	_rc_ptc_make
3209                     	xref	_rc_ptc_make_setting
3210                     	xref	_getState_check
3211                     	xref	_rc_ptc_check
3212                     	xref	_rc_ptc_baseSet
3213                     	xref	_factory
3214                     	xref	___boiler_shower
3215                     	xref	__key_blink
3216                     	xref	__disp_mode
3217                     	xref	__dsCount
3218                     	xref	__ds
3219                     	xref	_ui_Open
3220                     	xref	___s
3221                     	xref	_disp_status
3222                     	xref	_lcd_disp_n
3223                     	xref	_lcd_clear
3224                     	xref	_iLF_DEF
3225                     	xref	_bLF_DEF
3226                     	xref	_uiInfo
3227                     	xref	_timerCalc
3228                     	xref	_systemTimer
3229                     	xref	___timer1h
3230                     	xref	___timer1min
3231                     	xref	___timer1s
3232                     	xref	___timer100ms
3233                     	xref	__t20ms
3234                     	xref	_systemUart
3235                     	xref	_uart1_get
3236                     	xref	_uart1_tx_put
3237                     	xref	_iouart_getReadBuffer
3238                     	xref	_iouart_getBuffer
3239                     	xref	_iouart_Ready
3240                     	xref	__io_tail
3241                     	xref	__io_head
3242                     	xref	_iouart_Pkt_Start
3243                     	xref	_iouart_Set_Packet
3244                     	xref	_iouart_Open
3245                     	xref	_indiIOUartIdle
3246                     	xref	_error_display
3247                     	xref	_systemLcd
3248                     	xref	_encoder_Open
3249                     	xdef	_disp_enc
3250                     	xdef	_disp_adc
3251                     	xref	_adcGet
3252                     	xref	_systemADC
3253                     	xref	_GPIO_Init
3254                     	xref	_CLK_SYSCLKDivConfig
3255                     	xref	_CLK_GetSYSCLKSource
3256                     	xref	_CLK_SYSCLKSourceConfig
3257                     	switch	.const
3258  000e               L521:
3259  000e 6500          	dc.b	"e",0
3260                     	xref.b	c_x
3261                     	xref.b	c_y
3281                     	xref	c_smodx
3282                     	end
