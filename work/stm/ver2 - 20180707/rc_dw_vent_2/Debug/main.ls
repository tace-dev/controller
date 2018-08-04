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
  66                     .text:	section	.text,new
  67  0000               f_getCurrTemp:
  71                     ; 53 	return currTemp;
  73  0000 c60000        	ld	a,_currTemp
  76  0003 87            	retf	
 107                     ; 56 uint8_t	_msgLoop(uint8_t mode)
 107                     ; 57 {
 108                     .text:	section	.text,new
 109  0000               f__msgLoop:
 113                     ; 58 	return 0;
 115  0000 4f            	clr	a
 118  0001 87            	retf	
 150                     ; 63 uint8_t _call_ptc_woodang(void) {
 151                     .text:	section	.text,new
 152  0000               f__call_ptc_woodang:
 156                     ; 64 	rc_ptc_check(iouart_getReadBuffer());
 158  0000 8d000000      	callf	f_iouart_getReadBuffer
 160  0004 8d000000      	callf	f_rc_ptc_check
 162                     ; 66 	switch (getState_check()) {
 164  0008 8d000000      	callf	f_getState_check
 167                     ; 88 			break;
 169  000c 4a            	dec	a
 170  000d 270c          	jreq	L53
 171  000f 4a            	dec	a
 172  0010 271a          	jreq	L73
 173  0012 a003          	sub	a,#3
 174  0014 2734          	jreq	L34
 175  0016 4a            	dec	a
 176  0017 271d          	jreq	L14
 177  0019 2032          	jra	L75
 178  001b               L53:
 179                     ; 67 		case RC_STATE_NORMAL:
 179                     ; 68 			if (only_one != 0) {
 181  001b 725d0000      	tnz	_only_one
 182  001f 2701          	jreq	L16
 183                     ; 69 				return;
 186  0021 87            	retf	
 187  0022               L16:
 188                     ; 72 			rc_ptc_make(iouart_getBuffer());
 190  0022 8d000000      	callf	f_iouart_getBuffer
 192  0026 8d000000      	callf	f_rc_ptc_make
 194                     ; 73 			iouart_Set_Packet(_IO_PACKET_TIMER);
 196                     ; 74 			iouart_Pkt_Start();
 198                     ; 75 			break;
 200  002a 2012          	jpf	LC001
 201  002c               L73:
 202                     ; 76 		case RC_STATE_SETTING:
 202                     ; 77 			rc_ptc_make_setting(iouart_getBuffer());
 204  002c 8d000000      	callf	f_iouart_getBuffer
 206  0030 8d000000      	callf	f_rc_ptc_make_setting
 208                     ; 78 			iouart_Set_Packet(_IO_PACKET_TIMER);
 210                     ; 79 			iouart_Pkt_Start();
 212                     ; 80 			break;
 214  0034 2008          	jpf	LC001
 215  0036               L14:
 216                     ; 81 		case RC_STATE_MIRROR:
 216                     ; 82 			rc_ptc_make_mirror(iouart_getBuffer());
 218  0036 8d000000      	callf	f_iouart_getBuffer
 220  003a 8d000000      	callf	f_rc_ptc_make_mirror
 222                     ; 83 			iouart_Set_Packet(_IO_PACKET_TIMER);
 225                     ; 84 			iouart_Pkt_Start();
 227  003e               LC001:
 230  003e a6c8          	ld	a,#200
 231  0040 8d000000      	callf	f_iouart_Set_Packet
 234  0044 8d000000      	callf	f_iouart_Pkt_Start
 236                     ; 85 			break;
 238  0048 2003          	jra	L75
 239  004a               L34:
 240                     ; 86 		case RC_STATE_FACTORY:
 240                     ; 87 			return 3;
 242  004a a603          	ld	a,#3
 245  004c 87            	retf	
 246  004d               L75:
 247                     ; 90 	return 0;
 249  004d 4f            	clr	a
 252  004e 87            	retf	
 274                     ; 93 uint8_t _call_ptc_lse(void) {
 275                     .text:	section	.text,new
 276  0000               f__call_ptc_lse:
 280                     ; 105 	return 0;
 282  0000 4f            	clr	a
 285  0001 87            	retf	
 334                     ; 108 uint8_t	_iouartLoop(void)
 334                     ; 109 {
 335                     .text:	section	.text,new
 336  0000               f__iouartLoop:
 338  0000 5203          	subw	sp,#3
 339       00000003      OFST:	set	3
 342                     ; 110 	uint8_t	i = 0;
 345  0002 206a          	jra	L511
 346  0004               L311:
 347                     ; 115 		i = iouart_Ready();
 349  0004 8d000000      	callf	f_iouart_Ready
 351  0008 6b01          	ld	(OFST-2,sp),a
 352                     ; 116 		if( i != 0 )
 354  000a 2706          	jreq	L121
 355                     ; 118 			p = iouart_getReadBuffer();
 357  000c 8d000000      	callf	f_iouart_getReadBuffer
 359  0010 7b01          	ld	a,(OFST-2,sp)
 360  0012               L121:
 361                     ; 125 		if( i == 2 )	
 363  0012 a102          	cp	a,#2
 364  0014 260c          	jrne	L321
 365                     ; 127 			DISP("e", 1);
 367  0016 4b01          	push	#1
 368  0018 ae000e        	ldw	x,#L521
 369  001b 8d000000      	callf	f_uart1_tx_put
 371  001f 84            	pop	a
 372  0020 7b01          	ld	a,(OFST-2,sp)
 373  0022               L321:
 374                     ; 129 		if( i == 1 )
 376  0022 4a            	dec	a
 377  0023 2649          	jrne	L511
 378                     ; 132 			p = iouart_getReadBuffer();
 380  0025 8d000000      	callf	f_iouart_getReadBuffer
 382  0029 1f02          	ldw	(OFST-1,sp),x
 383                     ; 136 			if (rc_type == RC_TYPE_NONE) {
 385  002b c60003        	ld	a,_rc_type
 386  002e 2639          	jrne	L131
 387                     ; 137 				if ((p[0] & 0xF0) == 0x00) 
 389  0030 f6            	ld	a,(x)
 390  0031 a5f0          	bcp	a,#240
 391                     ; 140 					rc_type = RC_TYPE_LSE;
 392                     ; 141 					return _call_ptc_lse();
 395  0033 2704          	jreq	LC003
 396                     ; 145 					if ((p[0] & 0x0F) == 0x00) {
 398  0035 a50f          	bcp	a,#15
 399  0037 260b          	jrne	L731
 400                     ; 147 						rc_type = RC_TYPE_LSE;
 402  0039               LC003:
 405  0039 35020003      	mov	_rc_type,#2
 406                     ; 148 						return _call_ptc_lse();
 408  003d               LC002:
 412  003d 8d000000      	callf	f__call_ptc_lse
 415  0041               L001:
 417  0041 5b03          	addw	sp,#3
 418  0043 87            	retf	
 419  0044               L731:
 420                     ; 151 						if ((p[0] & 0xF0) == 0x80 || 
 420                     ; 152 								(p[0] & 0xF0) == 0x90 || 
 420                     ; 153 								(p[0] & 0xF0) == 0xB0 ||
 420                     ; 154 								(p[0] & 0xF0) == 0xC0) {
 422  0044 a4f0          	and	a,#240
 423  0046 a180          	cp	a,#128
 424  0048 27ef          	jreq	LC003
 426  004a f6            	ld	a,(x)
 427  004b a4f0          	and	a,#240
 428  004d a190          	cp	a,#144
 429  004f 27e8          	jreq	LC003
 431  0051 f6            	ld	a,(x)
 432  0052 a4f0          	and	a,#240
 433  0054 a1b0          	cp	a,#176
 434  0056 27e1          	jreq	LC003
 436  0058 f6            	ld	a,(x)
 437  0059 a4f0          	and	a,#240
 438  005b a1c0          	cp	a,#192
 439                     ; 155 							rc_type = RC_TYPE_LSE;
 440                     ; 156 							return _call_ptc_lse();
 443  005d 27da          	jreq	LC003
 444                     ; 158 							rc_type = RC_TYPE_WOODANG;
 446  005f 35010003      	mov	_rc_type,#1
 447                     ; 159 						  return _call_ptc_woodang();
 449  0063               LC004:
 451  0063 8d000000      	callf	f__call_ptc_woodang
 454  0067 20d8          	jra	L001
 455  0069               L131:
 456                     ; 163 			}else if (rc_type == RC_TYPE_WOODANG) {
 458  0069 4a            	dec	a
 459  006a 26d1          	jrne	LC002
 460                     ; 164 				return _call_ptc_woodang();
 463  006c 20f5          	jpf	LC004
 464                     ; 166 				return _call_ptc_lse();
 467  006e               L511:
 468                     ; 113 	while( _io_head != _io_tail )
 470  006e c60000        	ld	a,__io_head
 471  0071 c10000        	cp	a,__io_tail
 472  0074 268e          	jrne	L311
 473                     ; 170 	return 0;
 475  0076 4f            	clr	a
 477  0077 20c8          	jra	L001
 520                     ; 178 void	disp_key(uint8_t k)
 520                     ; 179 {
 521                     .text:	section	.text,new
 522  0000               f_disp_key:
 524  0000 88            	push	a
 525  0001 5205          	subw	sp,#5
 526       00000005      OFST:	set	5
 529                     ; 181 	buf[0] = '<';
 531  0003 a63c          	ld	a,#60
 532  0005 6b01          	ld	(OFST-4,sp),a
 533                     ; 182 	buf[2] = ':';
 535  0007 a63a          	ld	a,#58
 536  0009 6b03          	ld	(OFST-2,sp),a
 537                     ; 183 	buf[3] = '0' + _key_continue;
 539  000b c60000        	ld	a,__key_continue
 540  000e ab30          	add	a,#48
 541  0010 6b04          	ld	(OFST-1,sp),a
 542                     ; 184 	buf[4] = '>';
 544  0012 a63e          	ld	a,#62
 545  0014 6b05          	ld	(OFST+0,sp),a
 546                     ; 185 	if( k == 4 )		buf[1] = '4';
 548  0016 7b06          	ld	a,(OFST+1,sp)
 549  0018 a104          	cp	a,#4
 550  001a 2604          	jrne	L302
 553  001c a634          	ld	a,#52
 555  001e 2015          	jpf	LC005
 556  0020               L302:
 557                     ; 186 	else if( k == 3 )	buf[1] = '3';
 559  0020 a103          	cp	a,#3
 560  0022 2604          	jrne	L702
 563  0024 a633          	ld	a,#51
 565  0026 200d          	jpf	LC005
 566  0028               L702:
 567                     ; 187 	else if( k == 2 )	buf[1] = '2';
 569  0028 a102          	cp	a,#2
 570  002a 2604          	jrne	L312
 573  002c a632          	ld	a,#50
 575  002e 2005          	jpf	LC005
 576  0030               L312:
 577                     ; 188 	else if( k == 1 )	buf[1] = '1';
 579  0030 4a            	dec	a
 580  0031 2606          	jrne	L712
 583  0033 a631          	ld	a,#49
 584  0035               LC005:
 585  0035 6b02          	ld	(OFST-3,sp),a
 587  0037 2004          	jra	L502
 588  0039               L712:
 589                     ; 190 		buf[2] = '?';
 591  0039 a63f          	ld	a,#63
 592  003b 6b03          	ld	(OFST-2,sp),a
 593  003d               L502:
 594                     ; 191 	DISP(buf, 5);
 596  003d 4b05          	push	#5
 597  003f 96            	ldw	x,sp
 598  0040 1c0002        	addw	x,#OFST-3
 599  0043 8d000000      	callf	f_uart1_tx_put
 601  0047 84            	pop	a
 602                     ; 192 }
 605  0048 5b06          	addw	sp,#6
 606  004a 87            	retf	
 655                     ; 194 void	disp_enc(uint8_t enc)
 655                     ; 195 {
 656                     .text:	section	.text,new
 657  0000               f_disp_enc:
 659  0000 88            	push	a
 660  0001 5204          	subw	sp,#4
 661       00000004      OFST:	set	4
 664                     ; 198 	if( (enc & 0x40) != 0 )
 666  0003 a540          	bcp	a,#64
 667  0005 2704          	jreq	L542
 668                     ; 199 		buf[0] = '+';
 670  0007 a62b          	ld	a,#43
 672  0009 2002          	jra	L742
 673  000b               L542:
 674                     ; 201 		buf[0] = '-';
 676  000b a62d          	ld	a,#45
 677  000d               L742:
 678  000d 6b02          	ld	(OFST-2,sp),a
 679                     ; 203 	i = enc&0x0f;
 681  000f 7b05          	ld	a,(OFST+1,sp)
 682  0011 a40f          	and	a,#15
 683  0013 6b01          	ld	(OFST-3,sp),a
 684                     ; 204 	buf[1] = '0' + i/10;
 686  0015 5f            	clrw	x
 687  0016 97            	ld	xl,a
 688  0017 a60a          	ld	a,#10
 689  0019 62            	div	x,a
 690  001a 9f            	ld	a,xl
 691  001b ab30          	add	a,#48
 692  001d 6b03          	ld	(OFST-1,sp),a
 693                     ; 205 	buf[2] = '0' + i%10;
 695  001f 5f            	clrw	x
 696  0020 7b01          	ld	a,(OFST-3,sp)
 697  0022 97            	ld	xl,a
 698  0023 a60a          	ld	a,#10
 699  0025 62            	div	x,a
 700  0026 ab30          	add	a,#48
 701  0028 6b04          	ld	(OFST+0,sp),a
 702                     ; 206 	DISP(buf, 3);
 704  002a 4b03          	push	#3
 705  002c 96            	ldw	x,sp
 706  002d 1c0003        	addw	x,#OFST-1
 707  0030 8d000000      	callf	f_uart1_tx_put
 709  0034 84            	pop	a
 710                     ; 207 }
 713  0035 5b05          	addw	sp,#5
 714  0037 87            	retf	
 745                     ; 209 void	disp_adc(uint8_t i)
 745                     ; 210 {
 746                     .text:	section	.text,new
 747  0000               f_disp_adc:
 751                     ; 220 }
 754  0000 87            	retf	
 756                     	switch	.data
 757  0005               _tci:
 758  0005 00            	dc.b	0
 759  0006               __tcKeyPrev:
 760  0006 ff            	dc.b	255
 761  0007               __i0Prev:
 762  0007 ff            	dc.b	255
 763  0008               __mkey:
 764  0008 ff            	dc.b	255
 812                     ; 254 uint8_t	_touchKey(uint8_t i, uint8_t mask, uint8_t key)
 812                     ; 255 {
 813                     .text:	section	.text,new
 814  0000               f__touchKey:
 816  0000 89            	pushw	x
 817       00000000      OFST:	set	0
 820                     ; 256 	if( tc[0] & mask )
 822  0001 9f            	ld	a,xl
 823  0002 c40001        	and	a,_tc
 824  0005 273a          	jreq	L503
 825                     ; 258 		if( tct[i] == 0 )
 827  0007 7b01          	ld	a,(OFST+1,sp)
 828  0009 5f            	clrw	x
 829  000a 97            	ld	xl,a
 830  000b 724d0011      	tnz	(_tct,x)
 831  000f 2615          	jrne	L703
 832                     ; 260 			tct[i] = 1;
 834  0011 5f            	clrw	x
 835  0012 97            	ld	xl,a
 836  0013 a601          	ld	a,#1
 837  0015 d70011        	ld	(_tct,x),a
 838                     ; 261 			_tctimer[i] = 0;
 840  0018 7b01          	ld	a,(OFST+1,sp)
 841  001a 5f            	clrw	x
 842  001b 97            	ld	xl,a
 843  001c 724f000b      	clr	(__tctimer,x)
 844                     ; 262 			_tctimer100ms[i] = 0;
 846  0020 5f            	clrw	x
 847  0021 97            	ld	xl,a
 848  0022 724f0005      	clr	(__tctimer100ms,x)
 849  0026               L703:
 850                     ; 264 		if( _tctimer[i] >= 10 )
 852  0026 5f            	clrw	x
 853  0027 97            	ld	xl,a
 854  0028 d6000b        	ld	a,(__tctimer,x)
 855  002b a10a          	cp	a,#10
 856  002d 250e          	jrult	L113
 857                     ; 266 			_tctimer[i] = 0;
 859  002f 7b01          	ld	a,(OFST+1,sp)
 860  0031 5f            	clrw	x
 861  0032 97            	ld	xl,a
 862  0033 724f000b      	clr	(__tctimer,x)
 863                     ; 267 			_tctimer100ms[i]++;
 865  0037 5f            	clrw	x
 866  0038 97            	ld	xl,a
 867  0039 724c0005      	inc	(__tctimer100ms,x)
 868  003d               L113:
 869                     ; 269 		return key;
 871  003d 7b06          	ld	a,(OFST+6,sp)
 873  003f 2015          	jra	L611
 874  0041               L503:
 875                     ; 273 		tct[i] = 0;
 877  0041 7b01          	ld	a,(OFST+1,sp)
 878  0043 5f            	clrw	x
 879  0044 97            	ld	xl,a
 880  0045 724f0011      	clr	(_tct,x)
 881                     ; 274 		_tctimer[i] = 0;
 883  0049 5f            	clrw	x
 884  004a 97            	ld	xl,a
 885  004b 724f000b      	clr	(__tctimer,x)
 886                     ; 275 		_tctimer100ms[i] = 0;
 888  004f 5f            	clrw	x
 889  0050 97            	ld	xl,a
 890  0051 724f0005      	clr	(__tctimer100ms,x)
 891                     ; 277 	return 0;
 893  0055 4f            	clr	a
 895  0056               L611:
 897  0056 85            	popw	x
 898  0057 87            	retf	
 900                     	switch	.data
 901  0009               __led_key_onOff:
 902  0009 00            	dc.b	0
1003                     ; 283 void	_touchCntl(GPIO_TypeDef* port, uint8_t pin, uint8_t i)
1003                     ; 284 {
1004                     .text:	section	.text,new
1005  0000               f__touchCntl:
1007  0000 89            	pushw	x
1008       00000000      OFST:	set	0
1011                     ; 285 	if( i == 0 )
1013  0001 7b07          	ld	a,(OFST+7,sp)
1014  0003 2606          	jrne	L173
1015                     ; 287 		D_IO_LOW(port, pin);
1017  0005 7b06          	ld	a,(OFST+6,sp)
1018  0007 43            	cpl	a
1019  0008 f4            	and	a,(x)
1021  0009 2005          	jra	L373
1022  000b               L173:
1023                     ; 291 		D_IO_HIGH(port, pin);
1025  000b 1e01          	ldw	x,(OFST+1,sp)
1026  000d f6            	ld	a,(x)
1027  000e 1a06          	or	a,(OFST+6,sp)
1028  0010               L373:
1029  0010 f7            	ld	(x),a
1030                     ; 293 }
1033  0011 85            	popw	x
1034  0012 87            	retf	
1073                     ; 295 void	_touchCntli(uint8_t j, uint8_t i)
1073                     ; 296 {
1074                     .text:	section	.text,new
1075  0000               f__touchCntli:
1077  0000 89            	pushw	x
1078       00000000      OFST:	set	0
1081                     ; 297 	if( j == 1 )	_touchCntl(GPIOE, GPIO_Pin_7, i);
1083  0001 9e            	ld	a,xh
1084  0002 4a            	dec	a
1085  0003 260c          	jrne	L314
1088  0005 9f            	ld	a,xl
1089  0006 88            	push	a
1090  0007 4b80          	push	#128
1091  0009 ae5014        	ldw	x,#20500
1092  000c 8d000000      	callf	f__touchCntl
1094  0010 85            	popw	x
1095  0011               L314:
1096                     ; 298 	if( j == 2 )	_touchCntl(GPIOC, GPIO_Pin_6, i);
1098  0011 7b01          	ld	a,(OFST+1,sp)
1099  0013 a102          	cp	a,#2
1100  0015 260f          	jrne	L514
1103  0017 7b02          	ld	a,(OFST+2,sp)
1104  0019 88            	push	a
1105  001a 4b40          	push	#64
1106  001c ae500a        	ldw	x,#20490
1107  001f 8d000000      	callf	f__touchCntl
1109  0023 85            	popw	x
1110  0024 7b01          	ld	a,(OFST+1,sp)
1111  0026               L514:
1112                     ; 299 	if( j == 3 )	_touchCntl(GPIOC, GPIO_Pin_5, i);
1114  0026 a103          	cp	a,#3
1115  0028 260f          	jrne	L714
1118  002a 7b02          	ld	a,(OFST+2,sp)
1119  002c 88            	push	a
1120  002d 4b20          	push	#32
1121  002f ae500a        	ldw	x,#20490
1122  0032 8d000000      	callf	f__touchCntl
1124  0036 85            	popw	x
1125  0037 7b01          	ld	a,(OFST+1,sp)
1126  0039               L714:
1127                     ; 300 	if( j == 4 )	_touchCntl(GPIOD, GPIO_Pin_7, i);
1129  0039 a104          	cp	a,#4
1130  003b 260f          	jrne	L124
1133  003d 7b02          	ld	a,(OFST+2,sp)
1134  003f 88            	push	a
1135  0040 4b80          	push	#128
1136  0042 ae500f        	ldw	x,#20495
1137  0045 8d000000      	callf	f__touchCntl
1139  0049 85            	popw	x
1140  004a 7b01          	ld	a,(OFST+1,sp)
1141  004c               L124:
1142                     ; 301 	if( j == 5 )	_touchCntl(GPIOC, GPIO_Pin_1, i);
1144  004c a105          	cp	a,#5
1145  004e 260f          	jrne	L324
1148  0050 7b02          	ld	a,(OFST+2,sp)
1149  0052 88            	push	a
1150  0053 4b02          	push	#2
1151  0055 ae500a        	ldw	x,#20490
1152  0058 8d000000      	callf	f__touchCntl
1154  005c 85            	popw	x
1155  005d 7b01          	ld	a,(OFST+1,sp)
1156  005f               L324:
1157                     ; 302 	if( j == 6 )	_touchCntl(GPIOA, GPIO_Pin_2, i);
1159  005f a106          	cp	a,#6
1160  0061 260d          	jrne	L524
1163  0063 7b02          	ld	a,(OFST+2,sp)
1164  0065 88            	push	a
1165  0066 4b04          	push	#4
1166  0068 ae5000        	ldw	x,#20480
1167  006b 8d000000      	callf	f__touchCntl
1169  006f 85            	popw	x
1170  0070               L524:
1171                     ; 303 }
1174  0070 85            	popw	x
1175  0071 87            	retf	
1199                     ; 305 void	_touchOn(void)
1199                     ; 306 {
1200                     .text:	section	.text,new
1201  0000               f__touchOn:
1205                     ; 307 	_led_key_onOff = 0;
1207  0000 725f0009      	clr	__led_key_onOff
1208                     ; 309 	_touchCntl(GPIOE, GPIO_Pin_7, 0);
1210  0004 4b00          	push	#0
1211  0006 4b80          	push	#128
1212  0008 ae5014        	ldw	x,#20500
1213  000b 8d000000      	callf	f__touchCntl
1215  000f 85            	popw	x
1216                     ; 310 	_touchCntl(GPIOC, GPIO_Pin_6, 0);
1218  0010 4b00          	push	#0
1219  0012 4b40          	push	#64
1220  0014 ae500a        	ldw	x,#20490
1221  0017 8d000000      	callf	f__touchCntl
1223  001b 85            	popw	x
1224                     ; 311 	_touchCntl(GPIOC, GPIO_Pin_5, 0);
1226  001c 4b00          	push	#0
1227  001e 4b20          	push	#32
1228  0020 ae500a        	ldw	x,#20490
1229  0023 8d000000      	callf	f__touchCntl
1231  0027 85            	popw	x
1232                     ; 313 	_touchCntl(GPIOC, GPIO_Pin_1, 0);
1234  0028 4b00          	push	#0
1235  002a 4b02          	push	#2
1236  002c ae500a        	ldw	x,#20490
1237  002f 8d000000      	callf	f__touchCntl
1239  0033 85            	popw	x
1240                     ; 314 	_touchCntl(GPIOA, GPIO_Pin_2, 0);
1242  0034 4b00          	push	#0
1243  0036 4b04          	push	#4
1244  0038 ae5000        	ldw	x,#20480
1245  003b 8d000000      	callf	f__touchCntl
1247  003f 85            	popw	x
1248                     ; 315 }
1251  0040 87            	retf	
1275                     ; 317 void	_touchOff(void)
1275                     ; 318 {
1276                     .text:	section	.text,new
1277  0000               f__touchOff:
1281                     ; 319 	_led_key_onOff = 1;
1283  0000 35010009      	mov	__led_key_onOff,#1
1284                     ; 321 	_touchCntl(GPIOE, GPIO_Pin_7, 1);
1286  0004 4b01          	push	#1
1287  0006 4b80          	push	#128
1288  0008 ae5014        	ldw	x,#20500
1289  000b 8d000000      	callf	f__touchCntl
1291  000f 85            	popw	x
1292                     ; 322 	_touchCntl(GPIOC, GPIO_Pin_6, 1);
1294  0010 4b01          	push	#1
1295  0012 4b40          	push	#64
1296  0014 ae500a        	ldw	x,#20490
1297  0017 8d000000      	callf	f__touchCntl
1299  001b 85            	popw	x
1300                     ; 323 	_touchCntl(GPIOC, GPIO_Pin_5, 1);
1302  001c 4b01          	push	#1
1303  001e 4b20          	push	#32
1304  0020 ae500a        	ldw	x,#20490
1305  0023 8d000000      	callf	f__touchCntl
1307  0027 85            	popw	x
1308                     ; 325 	_touchCntl(GPIOC, GPIO_Pin_1, 1);
1310  0028 4b01          	push	#1
1311  002a 4b02          	push	#2
1312  002c ae500a        	ldw	x,#20490
1313  002f 8d000000      	callf	f__touchCntl
1315  0033 85            	popw	x
1316                     ; 326 	_touchCntl(GPIOA, GPIO_Pin_2, 1);
1318  0034 4b01          	push	#1
1319  0036 4b04          	push	#4
1320  0038 ae5000        	ldw	x,#20480
1321  003b 8d000000      	callf	f__touchCntl
1323  003f 85            	popw	x
1324                     ; 327 }
1327  0040 87            	retf	
1329                     	switch	.data
1330  000a               __p:
1331  000a 00            	dc.b	0
1365                     ; 333 void	__b(uint8_t k)
1365                     ; 334 {
1366                     .text:	section	.text,new
1367  0000               f___b:
1371                     ; 335 	lcd_clear(0);
1373  0000 4f            	clr	a
1374  0001 8d000000      	callf	f_lcd_clear
1376                     ; 343 LCD_BIT_SET(_p);
1378  0005 c6000a        	ld	a,__p
1379  0008 5f            	clrw	x
1380  0009 97            	ld	xl,a
1381  000a d60000        	ld	a,(_iLF_DEF,x)
1382  000d 5f            	clrw	x
1383  000e 97            	ld	xl,a
1384  000f c6000a        	ld	a,__p
1385  0012 905f          	clrw	y
1386  0014 9097          	ld	yl,a
1387  0016 d6540c        	ld	a,(21516,x)
1388  0019 90da0000      	or	a,(_bLF_DEF,y)
1389  001d d7540c        	ld	(21516,x),a
1390                     ; 344 	_p++;
1392  0020 725c000a      	inc	__p
1393                     ; 345 }
1396  0024 87            	retf	
1473                     ; 347 void	deviceCb(void)
1473                     ; 348 {
1474                     .text:	section	.text,new
1475  0000               f_deviceCb:
1477  0000 5204          	subw	sp,#4
1478       00000004      OFST:	set	4
1481                     ; 349 	uint8_t	lcd = 0;
1483                     ; 424 	if( _tct0 == _t20ms )
1485  0002 c60004        	ld	a,__tct0
1486  0005 c10000        	cp	a,__t20ms
1487  0008 2604acda02da  	jreq	L052
1488                     ; 425 		return;
1490                     ; 427 	_tct0 = _t20ms;
1492  000e 5500000004    	mov	__tct0,__t20ms
1493                     ; 428 	for( i=0; i<6; i++ )
1495  0013 4f            	clr	a
1496  0014 6b04          	ld	(OFST+0,sp),a
1497  0016               L515:
1498                     ; 430 		if( tct[i]==1 )
1500  0016 5f            	clrw	x
1501  0017 97            	ld	xl,a
1502  0018 d60011        	ld	a,(_tct,x)
1503  001b 4a            	dec	a
1504  001c 2608          	jrne	L325
1505                     ; 431 			_tctimer[i]++;
1507  001e 7b04          	ld	a,(OFST+0,sp)
1508  0020 5f            	clrw	x
1509  0021 97            	ld	xl,a
1510  0022 724c000b      	inc	(__tctimer,x)
1511  0026               L325:
1512                     ; 428 	for( i=0; i<6; i++ )
1514  0026 0c04          	inc	(OFST+0,sp)
1517  0028 7b04          	ld	a,(OFST+0,sp)
1518  002a a106          	cp	a,#6
1519  002c 25e8          	jrult	L515
1520                     ; 434 	if( _uart1_rx_tail == _uart1_rx_head )
1522  002e c60000        	ld	a,__uart1_rx_tail
1523  0031 c10000        	cp	a,__uart1_rx_head
1524  0034 2704ac930293  	jrne	L145
1525                     ; 436 		_tct10++;
1527  003a 725c0003      	inc	__tct10
1528                     ; 437 		if( _tct10 >= 5 )
1530  003e c60003        	ld	a,__tct10
1531  0041 a105          	cp	a,#5
1532  0043 25f1          	jrult	L145
1533                     ; 439 			for( i=0; i<6; i++ )
1535  0045 4f            	clr	a
1536  0046 6b04          	ld	(OFST+0,sp),a
1537  0048               L135:
1538                     ; 440 				tct[i] = 0;
1540  0048 5f            	clrw	x
1541  0049 97            	ld	xl,a
1542  004a 724f0011      	clr	(_tct,x)
1543                     ; 439 			for( i=0; i<6; i++ )
1545  004e 0c04          	inc	(OFST+0,sp)
1548  0050 7b04          	ld	a,(OFST+0,sp)
1549  0052 a106          	cp	a,#6
1550  0054 25f2          	jrult	L135
1551                     ; 441 			_tct10 = 0;
1553  0056 725f0003      	clr	__tct10
1554                     ; 442 			_tcKeyPrev = 0xff;
1556  005a 35ff0006      	mov	__tcKeyPrev,#255
1557                     ; 443 			_mkey = 0xff;
1559  005e 35ff0008      	mov	__mkey,#255
1560  0062 ac930293      	jra	L145
1561  0066               L735:
1562                     ; 450 		i = uart1_get();
1564  0066 8d000000      	callf	f_uart1_get
1566  006a 6b04          	ld	(OFST+0,sp),a
1567                     ; 451 		if( i == 0xff )
1569  006c 4c            	inc	a
1570  006d 2607          	jrne	L545
1571                     ; 453 			tci = 0;
1573  006f c70005        	ld	_tci,a
1574                     ; 454 			continue;
1576  0072 ac930293      	jra	L145
1577  0076               L545:
1578                     ; 456 			tc[tci] = i;
1580  0076 c60005        	ld	a,_tci
1581  0079 5f            	clrw	x
1582  007a 97            	ld	xl,a
1583  007b 7b04          	ld	a,(OFST+0,sp)
1584  007d d70001        	ld	(_tc,x),a
1585                     ; 457 			tci = tci==0 ? 1 : 0;
1587  0080 725d0005      	tnz	_tci
1588  0084 2604          	jrne	L002
1589  0086 a601          	ld	a,#1
1590  0088 2001          	jra	L202
1591  008a               L002:
1592  008a 4f            	clr	a
1593  008b               L202:
1594  008b c70005        	ld	_tci,a
1595                     ; 458 			if( tci != 0 )
1597  008e 725d0005      	tnz	_tci
1598  0092 26de          	jrne	L145
1599                     ; 459 				continue;
1601                     ; 461 			i = tc[0] + tc[1];
1603  0094 c60002        	ld	a,_tc+1
1604  0097 cb0001        	add	a,_tc
1605  009a 6b04          	ld	(OFST+0,sp),a
1606                     ; 462 			if( i != 0xff )
1608  009c 4c            	inc	a
1609  009d 26d3          	jrne	L145
1610                     ; 463 				continue;
1612                     ; 465 			_tct10 = 0;
1614  009f c70003        	ld	__tct10,a
1615                     ; 483 			_tcKey = _touchKey(0, 0x01, 0x01);
1617  00a2 4b01          	push	#1
1618  00a4 ae0001        	ldw	x,#1
1619  00a7 8d000000      	callf	f__touchKey
1621  00ab 5b01          	addw	sp,#1
1622  00ad c70000        	ld	__tcKey,a
1623                     ; 484 			_tcKey |= _touchKey(1, 0x02, 0x04);
1625  00b0 4b04          	push	#4
1626  00b2 ae0102        	ldw	x,#258
1627  00b5 8d000000      	callf	f__touchKey
1629  00b9 5b01          	addw	sp,#1
1630  00bb ca0000        	or	a,__tcKey
1631  00be c70000        	ld	__tcKey,a
1632                     ; 485 			_tcKey |= _touchKey(2, 0x04, 0x10);
1634  00c1 4b10          	push	#16
1635  00c3 ae0204        	ldw	x,#516
1636  00c6 8d000000      	callf	f__touchKey
1638  00ca 5b01          	addw	sp,#1
1639  00cc ca0000        	or	a,__tcKey
1640  00cf c70000        	ld	__tcKey,a
1641                     ; 486 			_tcKey |= _touchKey(3, 0x08, 0x02);
1643  00d2 4b02          	push	#2
1644  00d4 ae0308        	ldw	x,#776
1645  00d7 8d000000      	callf	f__touchKey
1647  00db 5b01          	addw	sp,#1
1648  00dd ca0000        	or	a,__tcKey
1649  00e0 c70000        	ld	__tcKey,a
1650                     ; 487 			_tcKey |= _touchKey(4, 0x10, 0x08);
1652  00e3 4b08          	push	#8
1653  00e5 ae0410        	ldw	x,#1040
1654  00e8 8d000000      	callf	f__touchKey
1656  00ec 5b01          	addw	sp,#1
1657  00ee ca0000        	or	a,__tcKey
1658  00f1 c70000        	ld	__tcKey,a
1659                     ; 488 			_tcKey |= _touchKey(5, 0x20, 0x20);
1661  00f4 4b20          	push	#32
1662  00f6 ae0520        	ldw	x,#1312
1663  00f9 8d000000      	callf	f__touchKey
1665  00fd 5b01          	addw	sp,#1
1666  00ff ca0000        	or	a,__tcKey
1667  0102 c70000        	ld	__tcKey,a
1668                     ; 490 			if( _tcKey == 0 )
1670  0105 725d0000      	tnz	__tcKey
1671  0109 2608          	jrne	L355
1672                     ; 492 				_tcKeyPrev = 0xff;
1674  010b 35ff0006      	mov	__tcKeyPrev,#255
1675                     ; 493 				continue;
1677  010f ac930293      	jra	L145
1678  0113               L355:
1679                     ; 496 			lcd = 1;
1681                     ; 497 			j = 0;
1683  0113 0f03          	clr	(OFST-1,sp)
1684                     ; 498 			i0 = 0xff;
1686  0115 a6ff          	ld	a,#255
1687  0117 6b02          	ld	(OFST-2,sp),a
1688                     ; 499 			for( i=0; i<6; i++ )
1690  0119 4f            	clr	a
1691  011a 6b04          	ld	(OFST+0,sp),a
1692  011c               L555:
1693                     ; 501 				if( tct[i]==1 )
1695  011c 5f            	clrw	x
1696  011d 97            	ld	xl,a
1697  011e d60011        	ld	a,(_tct,x)
1698  0121 4a            	dec	a
1699  0122 2606          	jrne	L365
1700                     ; 503 					j++;
1702  0124 0c03          	inc	(OFST-1,sp)
1703                     ; 504 					i0 = i;
1705  0126 7b04          	ld	a,(OFST+0,sp)
1706  0128 6b02          	ld	(OFST-2,sp),a
1707  012a               L365:
1708                     ; 499 			for( i=0; i<6; i++ )
1710  012a 0c04          	inc	(OFST+0,sp)
1713  012c 7b04          	ld	a,(OFST+0,sp)
1714  012e a106          	cp	a,#6
1715  0130 25ea          	jrult	L555
1716                     ; 509 			if( j >= 3 && _mkey != 0xff )
1718  0132 7b03          	ld	a,(OFST-1,sp)
1719  0134 a103          	cp	a,#3
1720  0136 2516          	jrult	L565
1722  0138 c60008        	ld	a,__mkey
1723  013b 4c            	inc	a
1724  013c 2710          	jreq	L565
1725                     ; 511 				if( _tcKey == 0x55 )		goto K_55;
1727  013e c60000        	ld	a,__tcKey
1728  0141 a155          	cp	a,#85
1729  0143 2736          	jreq	L364
1732                     ; 512 				if( _tcKey == 0x53 )		goto K_53;
1734  0145 c60000        	ld	a,__tcKey
1735  0148 a153          	cp	a,#83
1736  014a 26c3          	jrne	L145
1739  014c 2064          	jra	L564
1740  014e               L565:
1741                     ; 515 			if( j == 1 && _mkey != 0xff )
1743  014e 7b03          	ld	a,(OFST-1,sp)
1744  0150 4a            	dec	a
1745  0151 2616          	jrne	L375
1747  0153 c60008        	ld	a,__mkey
1748  0156 4c            	inc	a
1749  0157 2710          	jreq	L375
1750                     ; 517 				if( _tcKey == 0x55 )		goto K_55;
1752  0159 c60000        	ld	a,__tcKey
1753  015c a155          	cp	a,#85
1754  015e 271b          	jreq	L364
1757                     ; 518 				if( _tcKey == 0x53 )		goto K_53;
1759  0160 c60000        	ld	a,__tcKey
1760  0163 a153          	cp	a,#83
1761  0165 26a8          	jrne	L145
1764  0167 2049          	jra	L564
1765  0169               L375:
1766                     ; 521 			if( j == 2 )
1768  0169 7b03          	ld	a,(OFST-1,sp)
1769  016b a102          	cp	a,#2
1770  016d 2674          	jrne	L106
1771                     ; 525 				if( tct[2] == 1 )
1773  016f c60013        	ld	a,_tct+2
1774  0172 4a            	dec	a
1775  0173 2671          	jrne	L764
1776                     ; 527 					if( tct[5] == 1 )
1778  0175 c60016        	ld	a,_tct+5
1779  0178 4a            	dec	a
1780  0179 2631          	jrne	L506
1781  017b               L364:
1782                     ; 529 K_55:						
1782                     ; 530 						//	ID
1782                     ; 531 						_tcKey = 0x55;
1784  017b 35550000      	mov	__tcKey,#85
1785                     ; 532 						_mkey = 0x24;
1787  017f 35240008      	mov	__mkey,#36
1788                     ; 533 						if( _tcKey != _tcKeyPrev )
1790  0183 c60000        	ld	a,__tcKey
1791  0186 c10006        	cp	a,__tcKeyPrev
1792  0189 270f          	jreq	L706
1793                     ; 535 							_tcKeyPrev = _tcKey;
1795  018b 5500000006    	mov	__tcKeyPrev,__tcKey
1796                     ; 536 							_i0Prev = i0;
1798  0190 7b02          	ld	a,(OFST-2,sp)
1799  0192 8de602e6      	callf	LC010
1800                     ; 538 							_key_continue = 0;
1801  0196 ac930293      	jra	L145
1802  019a               L706:
1803                     ; 543 							if( _tctimer100ms[_i0Prev] > 35 )//TIME_LONG_TOUCH )
1805  019a 8ddd02dd      	callf	LC009
1806  019e a124          	cp	a,#36
1807  01a0 25f4          	jrult	L145
1808                     ; 545 								_key_continue = 1;
1810  01a2 35010000      	mov	__key_continue,#1
1811                     ; 546 								disp_status(0x55);
1813  01a6 a655          	ld	a,#85
1815                     ; 547 								_tctimer100ms[_i0Prev] = 0;
1816  01a8 ac860286      	jpf	LC006
1817  01ac               L506:
1818                     ; 553 					else if( tct[1] == 1 )
1820  01ac c60012        	ld	a,_tct+1
1821  01af 4a            	dec	a
1822  01b0 2634          	jrne	L764
1823  01b2               L564:
1824                     ; 555 K_53:						
1824                     ; 556 						//	Option
1824                     ; 557 						_tcKey = 0x53;
1826  01b2 35530000      	mov	__tcKey,#83
1827                     ; 558 						_mkey = 0x60;
1829  01b6 35600008      	mov	__mkey,#96
1830                     ; 559 						if( _tcKey != _tcKeyPrev )
1832  01ba c60000        	ld	a,__tcKey
1833  01bd c10006        	cp	a,__tcKeyPrev
1834  01c0 270f          	jreq	L126
1835                     ; 561 							_tcKeyPrev = _tcKey;
1837  01c2 5500000006    	mov	__tcKeyPrev,__tcKey
1838                     ; 562 							_i0Prev = i0;
1840  01c7 7b02          	ld	a,(OFST-2,sp)
1841  01c9 8de602e6      	callf	LC010
1842                     ; 564 							_key_continue = 0;
1843  01cd ac930293      	jra	L145
1844  01d1               L126:
1845                     ; 569 							if( _tctimer100ms[_i0Prev] > 35 )//TIME_LONG_TOUCH )
1847  01d1 8ddd02dd      	callf	LC009
1848  01d5 a124          	cp	a,#36
1849  01d7 25f4          	jrult	L145
1850                     ; 571 								_key_continue = 1;
1852  01d9 35010000      	mov	__key_continue,#1
1853                     ; 572 								disp_status(0x53);
1855  01dd a653          	ld	a,#83
1857                     ; 573 								_tctimer100ms[_i0Prev] = 0;
1858  01df ac860286      	jpf	LC006
1859  01e3               L106:
1860                     ; 582 			if( j != 1 )
1862  01e3 4a            	dec	a
1863  01e4 2715          	jreq	L726
1864  01e6               L764:
1865                     ; 584 CLEAR_KEY_ENTRY:
1865                     ; 585 				for( i=0; i<6; i++ )
1867  01e6 4f            	clr	a
1868  01e7 6b04          	ld	(OFST+0,sp),a
1869  01e9               L136:
1870                     ; 586 					tct[i] = 0;
1872  01e9 5f            	clrw	x
1873  01ea 97            	ld	xl,a
1874  01eb 724f0011      	clr	(_tct,x)
1875                     ; 585 				for( i=0; i<6; i++ )
1877  01ef 0c04          	inc	(OFST+0,sp)
1880  01f1 7b04          	ld	a,(OFST+0,sp)
1881  01f3 a106          	cp	a,#6
1882  01f5 25f2          	jrult	L136
1883                     ; 587 				continue;
1885  01f7 ac930293      	jra	L145
1886  01fb               L726:
1887                     ; 590 			if( _tcKeyPrev != _tcKey )
1889  01fb c60006        	ld	a,__tcKeyPrev
1890  01fe c10000        	cp	a,__tcKey
1891  0201 274d          	jreq	L736
1892                     ; 592 				_tcKeyPrev = _tcKey;
1894  0203 5500000006    	mov	__tcKeyPrev,__tcKey
1895                     ; 593 				_i0Prev = i0;
1897  0208 7b02          	ld	a,(OFST-2,sp)
1898  020a 8de602e6      	callf	LC010
1899                     ; 597 					_lcdTimer[0] = 0;
1901  020e 725f0000      	clr	__lcdTimer
1902                     ; 598 					_lcdTimer[2] = __timer1s;
1904  0212 5500000002    	mov	__lcdTimer+2,___timer1s
1905                     ; 599 					if( _lcdTimer[1] == 2 )
1907  0217 c60001        	ld	a,__lcdTimer+1
1908  021a a102          	cp	a,#2
1909  021c 260f          	jrne	L146
1910                     ; 602 						_lcdTimer[1] = 3;
1912  021e 8df402f4      	callf	LC011
1913                     ; 606 						_touchOn();
1915  0222 8d000000      	callf	f__touchOn
1917                     ; 609 						_uart1_rx_tail = _uart1_rx_head;
1919  0226 5500000000    	mov	__uart1_rx_tail,__uart1_rx_head
1921  022b 2066          	jra	L145
1922  022d               L146:
1923                     ; 612 					else if( _lcdTimer[1] == 3 )
1925  022d a103          	cp	a,#3
1926  022f 2612          	jrne	L546
1927                     ; 614 						_tcKeyPrev = 0xff;
1929  0231 35ff0006      	mov	__tcKeyPrev,#255
1930                     ; 615 						if( _lcdTimer[3] == __timer100ms )
1932  0235 c60003        	ld	a,__lcdTimer+3
1933  0238 c10000        	cp	a,___timer100ms
1934  023b 2756          	jreq	L145
1936                     ; 620 							_lcdTimer[1] = 0;
1938  023d 725f0001      	clr	__lcdTimer+1
1939  0241 2050          	jra	L145
1940  0243               L546:
1941                     ; 637 						_lcdTimer[1] = 3;
1943  0243 8df402f4      	callf	LC011
1944                     ; 641 						disp_status(_tcKey);
1946  0247 c60000        	ld	a,__tcKey
1947  024a 8d000000      	callf	f_disp_status
1949  024e 2043          	jra	L145
1950  0250               L736:
1951                     ; 646 				if (_tcKeyPrev == 0x10 || _tcKeyPrev == 0x20) {
1953  0250 c60006        	ld	a,__tcKeyPrev
1954  0253 a110          	cp	a,#16
1955  0255 2707          	jreq	L166
1957  0257 c60006        	ld	a,__tcKeyPrev
1958  025a a120          	cp	a,#32
1959  025c 260a          	jrne	L756
1960  025e               L166:
1961                     ; 647 					if( _tctimer100ms[_i0Prev] > 2 )
1963  025e 8ddd02dd      	callf	LC009
1964  0262 a103          	cp	a,#3
1965  0264 252d          	jrult	L145
1966                     ; 649 						disp_status(_tcKeyPrev);
1968                     ; 650 						_tctimer100ms[_i0Prev] = 0;
1969  0266 201b          	jpf	LC007
1970  0268               L756:
1971                     ; 653 					if( _tcKeyPrev == 0x04 )
1973  0268 c60006        	ld	a,__tcKeyPrev
1974  026b a104          	cp	a,#4
1975  026d 2608          	jrne	L766
1976                     ; 656 						if( _tctimer100ms[_i0Prev] > 30 /*TIME_LONG_TOUCH*/ )
1978  026f 8ddd02dd      	callf	LC009
1979  0273 a11f          	cp	a,#31
1980                     ; 658 							_key_continue = 1;
1981                     ; 659 							disp_status(_tcKeyPrev);
1983                     ; 660 							_tctimer100ms[_i0Prev] = 0;
1984  0275 2006          	jpf	LC008
1985  0277               L766:
1986                     ; 665 						if( _tctimer100ms[_i0Prev] > TIME_LONG_TOUCH )
1988  0277 8ddd02dd      	callf	LC009
1989  027b a129          	cp	a,#41
1990                     ; 667 							_key_continue = 1;
1992  027d               LC008:
1993  027d 2514          	jrult	L145
1995  027f 35010000      	mov	__key_continue,#1
1996                     ; 668 							disp_status(_tcKeyPrev);
1998  0283               LC007:
2001  0283 c60006        	ld	a,__tcKeyPrev
2003                     ; 669 							_tctimer100ms[_i0Prev] = 0;
2005  0286               LC006:
2006  0286 8d000000      	callf	f_disp_status
2011  028a c60007        	ld	a,__i0Prev
2012  028d 5f            	clrw	x
2013  028e 97            	ld	xl,a
2014  028f 724f0005      	clr	(__tctimer100ms,x)
2015  0293               L145:
2016                     ; 448 	while( _uart1_rx_tail != _uart1_rx_head )
2018  0293 c60000        	ld	a,__uart1_rx_tail
2019  0296 c10000        	cp	a,__uart1_rx_head
2020  0299 2704ac660066  	jrne	L735
2021                     ; 675 	if( _lcdTimer[2] != __timer1s )
2023  029f c60002        	ld	a,__lcdTimer+2
2024  02a2 c10000        	cp	a,___timer1s
2025  02a5 272e          	jreq	L776
2026                     ; 677 		_lcdTimer[2] = __timer1s;
2028  02a7 5500000002    	mov	__lcdTimer+2,___timer1s
2029                     ; 678 		_lcdTimer[0]++;
2031  02ac 725c0000      	inc	__lcdTimer
2032                     ; 679 		if( _lcdTimer[0] >= /*8*/15 )
2034  02b0 c60000        	ld	a,__lcdTimer
2035  02b3 a10f          	cp	a,#15
2036  02b5 251e          	jrult	L776
2037                     ; 681 			if( _lcdTimer[1] == 0 || _lcdTimer[1] == 3 )
2039  02b7 c60001        	ld	a,__lcdTimer+1
2040  02ba 2704          	jreq	L507
2042  02bc a103          	cp	a,#3
2043  02be 260c          	jrne	L307
2044  02c0               L507:
2045                     ; 684 				_lcdTimer[1] = 2;
2047  02c0 35020001      	mov	__lcdTimer+1,#2
2048                     ; 685 				_backup_backlight2 = 0;
2050  02c4 725f0000      	clr	__backup_backlight2
2051                     ; 689 				_touchOff();
2053  02c8 8d000000      	callf	f__touchOff
2055  02cc               L307:
2056                     ; 692 			_lcdTimer[0] = 0;
2058  02cc 725f0000      	clr	__lcdTimer
2059                     ; 693 			_lcdTimer[3] = __timer100ms;
2061  02d0 5500000003    	mov	__lcdTimer+3,___timer100ms
2062  02d5               L776:
2063                     ; 697 	disp_status(0);
2065  02d5 4f            	clr	a
2066  02d6 8d000000      	callf	f_disp_status
2068                     ; 699 }
2069  02da               L052:
2072  02da 5b04          	addw	sp,#4
2073  02dc 87            	retf	
2074  02dd               LC009:
2075  02dd c60007        	ld	a,__i0Prev
2076  02e0 5f            	clrw	x
2077  02e1 97            	ld	xl,a
2078  02e2 d60005        	ld	a,(__tctimer100ms,x)
2079  02e5 87            	retf	
2080  02e6               LC010:
2081  02e6 c70007        	ld	__i0Prev,a
2082                     ; 537 							beepSet(4);			
2084  02e9 a604          	ld	a,#4
2085  02eb 8d000000      	callf	f_beepSet
2087                     ; 538 							_key_continue = 0;
2089  02ef 725f0000      	clr	__key_continue
2090  02f3 87            	retf	
2091  02f4               LC011:
2092  02f4 35030001      	mov	__lcdTimer+1,#3
2093                     ; 638 						_lcdTimer[3] = __timer100ms;
2095  02f8 5500000003    	mov	__lcdTimer+3,___timer100ms
2096                     ; 639 						_backup_backlight2 = BACKLIGHT_MAX_LEVEL;
2098  02fd 35600000      	mov	__backup_backlight2,#96
2099  0301 87            	retf	
2133                     ; 701 void	device_adc(void)
2133                     ; 702 {
2134                     .text:	section	.text,new
2135  0000               f_device_adc:
2137  0000 88            	push	a
2138       00000001      OFST:	set	1
2141                     ; 704 	i = adcGet(0);
2143  0001 4f            	clr	a
2144  0002 8d000000      	callf	f_adcGet
2146  0006 6b01          	ld	(OFST+0,sp),a
2147                     ; 705 	if( i != currTemp )
2149  0008 c10000        	cp	a,_currTemp
2150  000b 2707          	jreq	L327
2151                     ; 707 		currTemp = i;
2153  000d c70000        	ld	_currTemp,a
2154                     ; 708 		disp_adc(i);
2156  0010 8d000000      	callf	f_disp_adc
2158  0014               L327:
2159                     ; 710 }
2162  0014 84            	pop	a
2163  0015 87            	retf	
2165                     	switch	.data
2166  000b               ___tim30min_reset:
2167  000b 00            	dc.b	0
2191                     ; 719 uint8_t timerEventClear(void) {
2192                     .text:	section	.text,new
2193  0000               f_timerEventClear:
2197                     ; 720 	__timer1sa = 0;
2199  0000 725f0000      	clr	___timer1sa
2200                     ; 721 	__timer1min = 0;
2202  0004 725f0000      	clr	___timer1min
2203                     ; 722 	__timer1h = 0 ;
2205  0008 725f0000      	clr	___timer1h
2206                     ; 723 }
2209  000c 87            	retf	
2241                     ; 734 void	timerEvent(void)
2241                     ; 735 {
2242                     .text:	section	.text,new
2243  0000               f_timerEvent:
2245       00000002      OFST:	set	2
2248                     ; 736 	_tim1min++;
2250  0000 725c0000      	inc	__tim1min
2251  0004 89            	pushw	x
2252                     ; 737 	if( (_tim1min%30) == 0 )
2254  0005 c60000        	ld	a,__tim1min
2255  0008 5f            	clrw	x
2256  0009 97            	ld	xl,a
2257  000a a61e          	ld	a,#30
2258  000c 8d000000      	callf	d_smodx
2260  0010 5d            	tnzw	x
2261  0011 2615          	jrne	L547
2262                     ; 739 		if( _tim30min != 0xff )
2264  0013 c60000        	ld	a,__tim30min
2265  0016 4c            	inc	a
2266  0017 2713          	jreq	L357
2267                     ; 741 			if( __tim30min_reset == 0 )
2269  0019 c6000b        	ld	a,___tim30min_reset
2270  001c 260e          	jrne	L357
2271                     ; 743 				__tim30min_reset = 1;
2273  001e 3501000b      	mov	___tim30min_reset,#1
2274                     ; 744 				_tim30min++;
2276  0022 725c0000      	inc	__tim30min
2277  0026 2004          	jra	L357
2278  0028               L547:
2279                     ; 749 		__tim30min_reset = 0;
2281  0028 725f000b      	clr	___tim30min_reset
2282  002c               L357:
2283                     ; 751 	if( __boiler_shower[5] == 1 )
2285  002c c60005        	ld	a,___boiler_shower+5
2286  002f 4a            	dec	a
2287  0030 260f          	jrne	L557
2288                     ; 753 		__boiler_shower[4]++;
2290  0032 725c0004      	inc	___boiler_shower+4
2291                     ; 754 		if( __boiler_shower[4] >= /*21*/90 )
2293  0036 c60004        	ld	a,___boiler_shower+4
2294  0039 a15a          	cp	a,#90
2295  003b 2504          	jrult	L557
2296                     ; 757 			__boiler_shower[5] = 0x80;
2298  003d 35800005      	mov	___boiler_shower+5,#128
2299  0041               L557:
2300                     ; 761 	if( _disp_mode == 0x10 )
2302  0041 c60000        	ld	a,__disp_mode
2303  0044 a110          	cp	a,#16
2304  0046 2635          	jrne	L167
2305                     ; 784 		if( _timFlag == 0 )
2307  0048 c60000        	ld	a,__timFlag
2308  004b 2612          	jrne	L367
2309                     ; 786 			if( uiInfo.repeat == _tim1min )
2311  004d c6000c        	ld	a,_uiInfo+12
2312  0050 c10000        	cp	a,__tim1min
2313  0053 2628          	jrne	L167
2314                     ; 788 				_tim1min = 0;
2316  0055 725f0000      	clr	__tim1min
2317                     ; 790 				_timFlag = 1;
2319  0059 35010000      	mov	__timFlag,#1
2320  005d 201e          	jra	L167
2321  005f               L367:
2322                     ; 795 			if( (_TIME_REPEAT_BASE-uiInfo.repeat) == _tim1min )
2324  005f c60000        	ld	a,__tim1min
2325  0062 5f            	clrw	x
2326  0063 97            	ld	xl,a
2327  0064 1f01          	ldw	(OFST-1,sp),x
2328  0066 4f            	clr	a
2329  0067 97            	ld	xl,a
2330  0068 a65a          	ld	a,#90
2331  006a c0000c        	sub	a,_uiInfo+12
2332  006d 2401          	jrnc	L462
2333  006f 5a            	decw	x
2334  0070               L462:
2335  0070 02            	rlwa	x,a
2336  0071 1301          	cpw	x,(OFST-1,sp)
2337  0073 2608          	jrne	L167
2338                     ; 797 				_tim1min = 0;
2340  0075 725f0000      	clr	__tim1min
2341                     ; 799 				_timFlag = 0;
2343  0079 725f0000      	clr	__timFlag
2344  007d               L167:
2345                     ; 804 	if( _disp_mode == 0x08 )
2347  007d c60000        	ld	a,__disp_mode
2348  0080 a108          	cp	a,#8
2349  0082 2618          	jrne	L377
2350                     ; 807 		if( uiInfo.reserve == _tim30min )
2352  0084 c6000d        	ld	a,_uiInfo+13
2353  0087 c10000        	cp	a,__tim30min
2354  008a 2610          	jrne	L377
2355                     ; 809 			_tim30min = 0xff;
2357  008c 35ff0000      	mov	__tim30min,#255
2358                     ; 810 			__s = 0;
2360  0090 725f0000      	clr	___s
2361                     ; 811 			_dsCount = 0;
2363  0094 725f0000      	clr	__dsCount
2364                     ; 812 			_key_blink = 0;
2366  0098 725f0000      	clr	__key_blink
2367  009c               L377:
2368                     ; 815 }
2371  009c 85            	popw	x
2372  009d 87            	retf	
2464                     ; 847 int		main()
2464                     ; 848 {
2465                     .text:	section	.text,new
2466  0000               f_main:
2468  0000 5207          	subw	sp,#7
2469       00000007      OFST:	set	7
2472                     ; 849 	uint8_t	logo = 0;
2474  0002 0f01          	clr	(OFST-6,sp)
2475                     ; 853 	uint8_t	_loopStatus = 0;
2477  0004 0f02          	clr	(OFST-5,sp)
2478                     ; 857 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
2480  0006 4f            	clr	a
2481  0007 8d000000      	callf	f_CLK_SYSCLKDivConfig
2483                     ; 858 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
2485  000b a601          	ld	a,#1
2486  000d 8d000000      	callf	f_CLK_SYSCLKSourceConfig
2489  0011               L7201:
2490                     ; 860 	while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI)
2492  0011 8d000000      	callf	f_CLK_GetSYSCLKSource
2494  0015 4a            	dec	a
2495  0016 26f9          	jrne	L7201
2496                     ; 900 	GPIO_Init(GPIOC, GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Fast);
2498  0018 4be0          	push	#224
2499  001a 4b20          	push	#32
2500  001c ae500a        	ldw	x,#20490
2501  001f 8d000000      	callf	f_GPIO_Init
2503  0023 721a500a      	bset	20490,#5
2504  0027 85            	popw	x
2505                     ; 901 	D_IO_HIGH(GPIOC, GPIO_Pin_5);
2507                     ; 905 	GPIO_Init(GPIOE, GPIO_Pin_7, GPIO_Mode_Out_PP_Low_Fast);
2509  0028 4be0          	push	#224
2510  002a 4b80          	push	#128
2511  002c ae5014        	ldw	x,#20500
2512  002f 8d000000      	callf	f_GPIO_Init
2514  0033 85            	popw	x
2515                     ; 906 	GPIO_Init(GPIOC, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Fast);
2517  0034 4be0          	push	#224
2518  0036 4b40          	push	#64
2519  0038 ae500a        	ldw	x,#20490
2520  003b 8d000000      	callf	f_GPIO_Init
2522  003f 85            	popw	x
2523                     ; 907 	GPIO_Init(GPIOC, GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Fast);
2525  0040 4be0          	push	#224
2526  0042 4b20          	push	#32
2527  0044 ae500a        	ldw	x,#20490
2528  0047 8d000000      	callf	f_GPIO_Init
2530  004b 85            	popw	x
2531                     ; 909 	GPIO_Init(GPIOD, GPIO_Pin_7, GPIO_Mode_Out_PP_Low_Fast);
2533  004c 4be0          	push	#224
2534  004e 4b80          	push	#128
2535  0050 ae500f        	ldw	x,#20495
2536  0053 8d000000      	callf	f_GPIO_Init
2538  0057 85            	popw	x
2539                     ; 910 	GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_PP_Low_Fast);
2541  0058 4be0          	push	#224
2542  005a 4b02          	push	#2
2543  005c ae500a        	ldw	x,#20490
2544  005f 8d000000      	callf	f_GPIO_Init
2546  0063 85            	popw	x
2547                     ; 911 	GPIO_Init(GPIOA, GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Fast);
2549  0064 4be0          	push	#224
2550  0066 4b04          	push	#4
2551  0068 ae5000        	ldw	x,#20480
2552  006b 8d000000      	callf	f_GPIO_Init
2554  006f 35600000      	mov	__backlight,#96
2555  0073 85            	popw	x
2556                     ; 912 	_backlight = BACKLIGHT_MAX_LEVEL;//20;
2558                     ; 916 	systemTimer();
2560  0074 8d000000      	callf	f_systemTimer
2562                     ; 918 	iouart_Open();
2564  0078 8d000000      	callf	f_iouart_Open
2566                     ; 922 	systemADC();
2568  007c 8d000000      	callf	f_systemADC
2570                     ; 923 	systemLcd();
2572  0080 8d000000      	callf	f_systemLcd
2574                     ; 926 	GPIO_Init(D_BL_PORT, D_BL_PIN, GPIO_Mode_Out_PP_Low_Fast);
2576  0084 4be0          	push	#224
2577  0086 4b80          	push	#128
2578  0088 ae500f        	ldw	x,#20495
2579  008b 8d000000      	callf	f_GPIO_Init
2581  008f 721e500f      	bset	20495,#7
2582  0093 725f0000      	clr	__lcdTimer
2583  0097 725f0001      	clr	__lcdTimer+1
2584  009b 85            	popw	x
2585  009c 5500000002    	mov	__lcdTimer+2,___timer1s
2586                     ; 927 	D_IO_HIGH(D_BL_PORT, D_BL_PIN);
2588                     ; 929 	_lcdTimer[0] = 0;
2590                     ; 930 	_lcdTimer[1] = 0;
2592                     ; 931 	_lcdTimer[2] = __timer1s;
2594                     ; 939 	systemUart();
2596  00a1 8d000000      	callf	f_systemUart
2598                     ; 943 	lcd_clear(0);
2600  00a5 4f            	clr	a
2601  00a6 8d000000      	callf	f_lcd_clear
2603                     ; 950 	lcd_disp_n(0, 6);
2605  00aa ae0006        	ldw	x,#6
2606  00ad 8d000000      	callf	f_lcd_disp_n
2608                     ; 952 		LCD_BIT_SET(b2A);
2610  00b1 c60003        	ld	a,_iLF_DEF+3
2611  00b4 8d330233      	callf	LC012
2612  00b8 ca0003        	or	a,_bLF_DEF+3
2613  00bb d7540c        	ld	(21516,x),a
2614                     ; 953 		LCD_BIT_SET(b2D);
2616  00be c6003c        	ld	a,_iLF_DEF+60
2617  00c1 8d330233      	callf	LC012
2618  00c5 ca003c        	or	a,_bLF_DEF+60
2619  00c8 d7540c        	ld	(21516,x),a
2620                     ; 954 		LCD_BIT_SET(b2E);
2622  00cb c60029        	ld	a,_iLF_DEF+41
2623  00ce 8d330233      	callf	LC012
2624  00d2 ca0029        	or	a,_bLF_DEF+41
2625  00d5 d7540c        	ld	(21516,x),a
2626                     ; 955 		LCD_BIT_SET(b2F);
2628  00d8 c60016        	ld	a,_iLF_DEF+22
2629  00db 8d330233      	callf	LC012
2630  00df ca0016        	or	a,_bLF_DEF+22
2631  00e2 d7540c        	ld	(21516,x),a
2632                     ; 957 	lcd_disp_n(2, 2);
2634  00e5 ae0202        	ldw	x,#514
2635  00e8 8d000000      	callf	f_lcd_disp_n
2637                     ; 958 	lcd_disp_n(3, 2);
2639  00ec ae0302        	ldw	x,#770
2640  00ef 8d000000      	callf	f_lcd_disp_n
2642                     ; 961 	indiIOUartIdle = 0;
2644  00f3 725f0000      	clr	_indiIOUartIdle
2645                     ; 963 	rc_ptc_baseSet();
2647  00f7 8d000000      	callf	f_rc_ptc_baseSet
2649                     ; 964 	ui_Open();
2651  00fb 8d000000      	callf	f_ui_Open
2653                     ; 972 	if( uiInfo.id == 0 )
2655  00ff c60004        	ld	a,_uiInfo+4
2656  0102 2604          	jrne	L3301
2657                     ; 976 		_ds = 220;
2659  0104 35dc0000      	mov	__ds,#220
2660  0108               L3301:
2661                     ; 978 	enableInterrupts();
2664  0108 9a            	rim	
2666                     ; 980 	for( i=0; i<24; i++ )	
2669  0109 4f            	clr	a
2670  010a 6b07          	ld	(OFST+0,sp),a
2671  010c               L5301:
2672                     ; 981 		_add[i%12] = adcGet(1);
2674  010c 5f            	clrw	x
2675  010d 97            	ld	xl,a
2676  010e a60c          	ld	a,#12
2677  0110 8d000000      	callf	d_smodx
2679  0114 89            	pushw	x
2680  0115 a601          	ld	a,#1
2681  0117 8d000000      	callf	f_adcGet
2683  011b 85            	popw	x
2684  011c d70000        	ld	(__add,x),a
2685                     ; 980 	for( i=0; i<24; i++ )	
2687  011f 0c07          	inc	(OFST+0,sp)
2690  0121 7b07          	ld	a,(OFST+0,sp)
2691  0123 a118          	cp	a,#24
2692  0125 25e5          	jrult	L5301
2693                     ; 984 	rcInfoSet(2, 20);	
2695  0127 ae0214        	ldw	x,#532
2696  012a 8d000000      	callf	f_rcInfoSet
2698  012e               L777:
2699                     ; 987 Entry:		
2699                     ; 988 #if	defined(WATCHDOG_ENABLE)
2699                     ; 989 		while(1)
2699                     ; 990 		{
2699                     ; 991 			for(i=0; i<200; i++ )
2699                     ; 992 			{
2699                     ; 993 				for( j=0; j<250; j++);
2699                     ; 994 			}
2699                     ; 995 			break;
2699                     ; 996 		}
2699                     ; 997 		IWDG_ReloadCounter();
2699                     ; 998 #endif
2699                     ; 999 		i = 0;
2701                     ; 1000 		if (timerCalc() == 1) 
2703  012e 8d000000      	callf	f_timerCalc
2705  0132 4a            	dec	a
2706  0133 2604          	jrne	L7401
2707                     ; 1003 			timerEvent();
2709  0135 8d000000      	callf	f_timerEvent
2711  0139               L7401:
2712                     ; 1007 		if( _loopStatus == 0 )
2714  0139 7b02          	ld	a,(OFST-5,sp)
2715  013b 270c          	jreq	L3501
2717                     ; 1010 		else if( _loopStatus == 3 )
2719  013d a103          	cp	a,#3
2720  013f 2608          	jrne	L3501
2721                     ; 1012 			factory(1);
2723  0141 a601          	ld	a,#1
2724  0143 8d000000      	callf	f_factory
2726                     ; 1013 			goto Entry;
2728  0147 20e5          	jra	L777
2729  0149               L3501:
2730                     ; 1016 		if( logo < 4 )
2732  0149 7b01          	ld	a,(OFST-6,sp)
2733  014b a104          	cp	a,#4
2734  014d 2419          	jruge	L7501
2735                     ; 1018 			if( __timer1s != pp[1] )
2737  014f c60000        	ld	a,___timer1s
2738  0152 1104          	cp	a,(OFST-3,sp)
2739  0154 27d8          	jreq	L777
2740                     ; 1020 				pp[1] = __timer1s;
2742  0156 6b04          	ld	(OFST-3,sp),a
2743                     ; 1021 				if( logo == 2 )
2745  0158 7b01          	ld	a,(OFST-6,sp)
2746  015a a102          	cp	a,#2
2747  015c 2606          	jrne	L3601
2748                     ; 1023 					logo = 100;
2750  015e a664          	ld	a,#100
2751  0160 6b01          	ld	(OFST-6,sp),a
2753  0162 20ca          	jra	L777
2754  0164               L3601:
2755                     ; 1027 					logo++;
2757  0164 0c01          	inc	(OFST-6,sp)
2758  0166 20c6          	jra	L777
2759  0168               L7501:
2760                     ; 1033 		i = _iouartLoop();
2762  0168 8d000000      	callf	f__iouartLoop
2764  016c 6b07          	ld	(OFST+0,sp),a
2765                     ; 1034 		if( i == 3 )		{	_loopStatus = 3;	}//	factory mode
2767  016e a103          	cp	a,#3
2768  0170 2606          	jrne	L7601
2771  0172 a603          	ld	a,#3
2772  0174 6b02          	ld	(OFST-5,sp),a
2774  0176 2006          	jra	L1701
2775  0178               L7601:
2776                     ; 1035 		else if( i == 99 )	{	_loopStatus = 0;	}//	normal mode	
2778  0178 a163          	cp	a,#99
2779  017a 2602          	jrne	L1701
2782  017c 0f02          	clr	(OFST-5,sp)
2783  017e               L1701:
2784                     ; 1037 		deviceCb();
2786  017e 8d000000      	callf	f_deviceCb
2788                     ; 1039 		if( (__timer1s%2) != pp[3] )
2790  0182 c60000        	ld	a,___timer1s
2791  0185 a401          	and	a,#1
2792  0187 1106          	cp	a,(OFST-1,sp)
2793  0189 2714          	jreq	L5701
2794                     ; 1041 			pp[3] = __timer1s%2;
2796  018b c60000        	ld	a,___timer1s
2797  018e a401          	and	a,#1
2798  0190 6b06          	ld	(OFST-1,sp),a
2799                     ; 1042 			if( pp[2] == 0 )
2801  0192 7b05          	ld	a,(OFST-2,sp)
2802  0194 260b          	jrne	L1011
2803                     ; 1044 				pp[2] = 1;
2805  0196 4c            	inc	a
2806  0197 6b05          	ld	(OFST-2,sp),a
2807                     ; 1045 				device_adc();
2809  0199 8d000000      	callf	f_device_adc
2811  019d 2002          	jra	L1011
2812  019f               L5701:
2813                     ; 1049 			pp[2] = 0;
2815  019f 0f05          	clr	(OFST-2,sp)
2816  01a1               L1011:
2817                     ; 1051 		if( (__timer1s) != pp[1] )
2819  01a1 c60000        	ld	a,___timer1s
2820  01a4 1104          	cp	a,(OFST-3,sp)
2821  01a6 2786          	jreq	L777
2822                     ; 1053 			pp[1] = __timer1s;
2824  01a8 6b04          	ld	(OFST-3,sp),a
2825                     ; 1055 			for( i=0; i<PACKET_SIZE; i++ )
2827  01aa 4f            	clr	a
2828  01ab 6b07          	ld	(OFST+0,sp),a
2829  01ad               L5011:
2830                     ; 1057 				if( packet_buf[i] != ui_timeout )
2832  01ad 5f            	clrw	x
2833  01ae 97            	ld	xl,a
2834  01af d60017        	ld	a,(_packet_buf,x)
2835  01b2 c10004        	cp	a,_ui_timeout
2836  01b5 2708          	jreq	L3111
2837                     ; 1059 					packet_buf[i] += 1;
2839  01b7 7b07          	ld	a,(OFST+0,sp)
2840  01b9 5f            	clrw	x
2841  01ba 97            	ld	xl,a
2842  01bb 724c0017      	inc	(_packet_buf,x)
2843  01bf               L3111:
2844                     ; 1055 			for( i=0; i<PACKET_SIZE; i++ )
2846  01bf 0c07          	inc	(OFST+0,sp)
2849  01c1 7b07          	ld	a,(OFST+0,sp)
2850  01c3 a108          	cp	a,#8
2851  01c5 25e6          	jrult	L5011
2852                     ; 1062 			if( ui_error == 30 && ui_error_type == ERROR_TYPE_CNT )
2854  01c7 c60001        	ld	a,_ui_error
2855  01ca a11e          	cp	a,#30
2856  01cc 2636          	jrne	L5111
2858  01ce c60002        	ld	a,_ui_error_type
2859  01d1 a102          	cp	a,#2
2860  01d3 262f          	jrne	L5111
2861                     ; 1064 				if( packet_buf[uiInfo.id - 1] < ui_timeout-1 )
2863  01d5 c60004        	ld	a,_uiInfo+4
2864  01d8 5f            	clrw	x
2865  01d9 97            	ld	xl,a
2866  01da 5a            	decw	x
2867  01db d60017        	ld	a,(_packet_buf,x)
2868  01de 5f            	clrw	x
2869  01df 97            	ld	xl,a
2870  01e0 c60004        	ld	a,_ui_timeout
2871  01e3 905f          	clrw	y
2872  01e5 9097          	ld	yl,a
2873  01e7 905a          	decw	y
2874  01e9 90bf00        	ldw	c_y,y
2875  01ec b300          	cpw	x,c_y
2876  01ee 2f04ac2e012e  	jrsge	L777
2877                     ; 1066 					error_display_mode = 0;
2879  01f4 725f0000      	clr	_error_display_mode
2880                     ; 1067 					ui_error = 0;
2882  01f8 725f0001      	clr	_ui_error
2883                     ; 1068 					ui_error_type = 0;
2885  01fc 725f0002      	clr	_ui_error_type
2886  0200 ac2e012e      	jra	L777
2887  0204               L5111:
2888                     ; 1073 				if( packet_buf[uiInfo.id - 1] == ui_timeout )
2890  0204 c60004        	ld	a,_uiInfo+4
2891  0207 5f            	clrw	x
2892  0208 97            	ld	xl,a
2893  0209 5a            	decw	x
2894  020a d60017        	ld	a,(_packet_buf,x)
2895  020d c10004        	cp	a,_ui_timeout
2896  0210 26ee          	jrne	L777
2897                     ; 1075 					error_display(ERROR_TYPE_CNT, 30);
2899  0212 ae021e        	ldw	x,#542
2900  0215 8d000000      	callf	f_error_display
2902                     ; 1076 					ui_timeout = PACKET_ERROR_COUNT_60;
2904  0219 353c0004      	mov	_ui_timeout,#60
2905                     ; 1078 					for( i=0; i<PACKET_SIZE; i++ )
2907  021d 4f            	clr	a
2908  021e 6b07          	ld	(OFST+0,sp),a
2909  0220               L5211:
2910                     ; 1080 						packet_buf[i] = PACKET_ERROR_COUNT_60;
2912  0220 5f            	clrw	x
2913  0221 97            	ld	xl,a
2914  0222 a63c          	ld	a,#60
2915  0224 d70017        	ld	(_packet_buf,x),a
2916                     ; 1078 					for( i=0; i<PACKET_SIZE; i++ )
2918  0227 0c07          	inc	(OFST+0,sp)
2921  0229 7b07          	ld	a,(OFST+0,sp)
2922  022b a108          	cp	a,#8
2923  022d 25f1          	jrult	L5211
2924  022f ac2e012e      	jra	L777
2925  0233               LC012:
2926  0233 5f            	clrw	x
2927  0234 97            	ld	xl,a
2928  0235 d6540c        	ld	a,(21516,x)
2929  0238 87            	retf	
3122                     	xdef	f_main
3123                     	xref	__add
3124                     	xdef	f_timerEvent
3125                     	xdef	f_timerEventClear
3126                     	xdef	___tim30min_reset
3127                     	xref	___timer1sa
3128                     	xref	__timFlag
3129                     	xref	__tim1min
3130                     	xref	__tim30min
3131                     	xdef	f_device_adc
3132                     	xdef	f_deviceCb
3133                     	xdef	f___b
3134                     	xdef	__p
3135                     	xdef	f__touchOff
3136                     	xdef	f__touchOn
3137                     	xdef	f__touchCntli
3138                     	xdef	f__touchCntl
3139                     	xdef	__led_key_onOff
3140                     	xdef	f__touchKey
3141                     	xref	f_beepSet
3142                     	xref	__uart1_rx_tail
3143                     	xref	__uart1_rx_head
3144                     	xdef	__mkey
3145                     	xdef	__i0Prev
3146                     	xdef	__tcKeyPrev
3147                     	switch	.bss
3148  0000               __tcKey:
3149  0000 00            	ds.b	1
3150                     	xdef	__tcKey
3151  0001               _tc:
3152  0001 0000          	ds.b	2
3153                     	xdef	_tc
3154  0003               __tct10:
3155  0003 00            	ds.b	1
3156                     	xdef	__tct10
3157  0004               __tct0:
3158  0004 00            	ds.b	1
3159                     	xdef	__tct0
3160  0005               __tctimer100ms:
3161  0005 000000000000  	ds.b	6
3162                     	xdef	__tctimer100ms
3163  000b               __tctimer:
3164  000b 000000000000  	ds.b	6
3165                     	xdef	__tctimer
3166  0011               _tct:
3167  0011 000000000000  	ds.b	6
3168                     	xdef	_tct
3169                     	xdef	_tci
3170                     	xdef	f_disp_key
3171                     	xref	__key_continue
3172                     	xdef	f__iouartLoop
3173                     	xdef	f__call_ptc_lse
3174                     	xdef	f__call_ptc_woodang
3175                     	xdef	f__msgLoop
3176                     	xdef	f_getCurrTemp
3177                     	xdef	_ui_timeout
3178                     	xdef	_ui_error_type
3179                     	xdef	_ui_error
3180  0017               _packet_buf:
3181  0017 000000000000  	ds.b	8
3182                     	xdef	_packet_buf
3183                     	xdef	_currTemp
3184                     	xref	_error_display_mode
3185                     	xref	_only_one
3186                     	xref	__backup_backlight2
3187                     	xref	__backlight
3188                     	xref	__lcdTimer
3189                     	xdef	_ver
3190                     	xdef	_rc_type
3191                     	xref	f_rcInfoSet
3192                     	xref	f_rc_ptc_make_mirror
3193                     	xref	f_rc_ptc_make
3194                     	xref	f_rc_ptc_make_setting
3195                     	xref	f_getState_check
3196                     	xref	f_rc_ptc_check
3197                     	xref	f_rc_ptc_baseSet
3198                     	xref	f_factory
3199                     	xref	___boiler_shower
3200                     	xref	__key_blink
3201                     	xref	__disp_mode
3202                     	xref	__dsCount
3203                     	xref	__ds
3204                     	xref	f_ui_Open
3205                     	xref	___s
3206                     	xref	f_disp_status
3207                     	xref	f_lcd_disp_n
3208                     	xref	f_lcd_clear
3209                     	xref	_iLF_DEF
3210                     	xref	_bLF_DEF
3211                     	xref	_uiInfo
3212                     	xref	f_timerCalc
3213                     	xref	f_systemTimer
3214                     	xref	___timer1h
3215                     	xref	___timer1min
3216                     	xref	___timer1s
3217                     	xref	___timer100ms
3218                     	xref	__t20ms
3219                     	xref	f_systemUart
3220                     	xref	f_uart1_get
3221                     	xref	f_uart1_tx_put
3222                     	xref	f_iouart_getReadBuffer
3223                     	xref	f_iouart_getBuffer
3224                     	xref	f_iouart_Ready
3225                     	xref	__io_tail
3226                     	xref	__io_head
3227                     	xref	f_iouart_Pkt_Start
3228                     	xref	f_iouart_Set_Packet
3229                     	xref	f_iouart_Open
3230                     	xref	_indiIOUartIdle
3231                     	xref	f_error_display
3232                     	xref	f_systemLcd
3233                     	xdef	f_disp_enc
3234                     	xdef	f_disp_adc
3235                     	xref	f_adcGet
3236                     	xref	f_systemADC
3237                     	xref	f_GPIO_Init
3238                     	xref	f_CLK_SYSCLKDivConfig
3239                     	xref	f_CLK_GetSYSCLKSource
3240                     	xref	f_CLK_SYSCLKSourceConfig
3241                     	switch	.const
3242  000e               L521:
3243  000e 6500          	dc.b	"e",0
3244                     	xref.b	c_x
3245                     	xref.b	c_y
3265                     	xref	d_smodx
3266                     	end
