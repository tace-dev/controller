   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  90                     ; 20 LPKM2INFO	get_km2Info(void)
  90                     ; 21 {
  92                     .text:	section	.text,new
  93  0000               _get_km2Info:
  97                     ; 22 	return &km2Info;
  99  0000 ae0028        	ldw	x,#_km2Info
 102  0003 81            	ret	
 140                     ; 25 void	km2Check(void)
 140                     ; 26 {
 141                     .text:	section	.text,new
 142  0000               _km2Check:
 144  0000 89            	pushw	x
 145       00000002      OFST:	set	2
 148                     ; 27 	LPKM2INFO	p = get_km2Info();
 150  0001 cd0000        	call	_get_km2Info
 152                     ; 28 	if( p->type == 0 )
 154  0004 e602          	ld	a,(2,x)
 155  0006 260b          	jrne	L75
 156                     ; 37 		p->up = 40;
 158  0008 a628          	ld	a,#40
 159  000a f7            	ld	(x),a
 160                     ; 38 		p->dn = 10;
 162  000b a60a          	ld	a,#10
 163  000d e701          	ld	(1,x),a
 164                     ; 39 		p->type = 2;	
 166  000f a602          	ld	a,#2
 167  0011 e702          	ld	(2,x),a
 168  0013               L75:
 169                     ; 41 }
 172  0013 85            	popw	x
 173  0014 81            	ret	
 221                     ; 43 void	km2CheckRange(uint8_t *b)
 221                     ; 44 {
 222                     .text:	section	.text,new
 223  0000               _km2CheckRange:
 225  0000 89            	pushw	x
 226  0001 89            	pushw	x
 227       00000002      OFST:	set	2
 230                     ; 45 	LPKM2INFO	p = get_km2Info();
 232  0002 cd0000        	call	_get_km2Info
 234  0005 1f01          	ldw	(OFST-1,sp),x
 235                     ; 46 	if( b[11] == 0x01 )	
 237  0007 1e03          	ldw	x,(OFST+1,sp)
 238  0009 e60b          	ld	a,(11,x)
 239  000b 4a            	dec	a
 240  000c 2608          	jrne	L501
 241                     ; 47 		b[12] = p->dn;
 243  000e 1e01          	ldw	x,(OFST-1,sp)
 244  0010 e601          	ld	a,(1,x)
 245  0012 1e03          	ldw	x,(OFST+1,sp)
 246  0014 e70c          	ld	(12,x),a
 247  0016               L501:
 248                     ; 49 	if( b[12] > p->up )		b[12] = p->up;
 250  0016 e60c          	ld	a,(12,x)
 251  0018 1e01          	ldw	x,(OFST-1,sp)
 252  001a f1            	cp	a,(x)
 253  001b 2303          	jrule	L701
 256  001d f6            	ld	a,(x)
 258  001e 200c          	jp	LC001
 259  0020               L701:
 260                     ; 50 	else if( b[12] < p->dn )	b[12] = p->dn;
 262  0020 1e03          	ldw	x,(OFST+1,sp)
 263  0022 e60c          	ld	a,(12,x)
 264  0024 1e01          	ldw	x,(OFST-1,sp)
 265  0026 e101          	cp	a,(1,x)
 266  0028 2406          	jruge	L111
 269  002a e601          	ld	a,(1,x)
 270  002c               LC001:
 271  002c 1e03          	ldw	x,(OFST+1,sp)
 272  002e e70c          	ld	(12,x),a
 273  0030               L111:
 274                     ; 52 }
 277  0030 5b04          	addw	sp,#4
 278  0032 81            	ret	
 281                     	switch	.data
 282  0000               _kocom_retry_count:
 283  0000 00            	dc.b	0
 284  0001               _kocom_curr_room:
 285  0001 00            	dc.b	0
 286  0002               __isFirstCall:
 287  0002 00            	dc.b	0
 288  0003               _kocom_write:
 289  0003 00            	dc.b	0
 313                     ; 142 uint8_t	timer10msCb(void)
 313                     ; 143 {
 314                     .text:	section	.text,new
 315  0000               _timer10msCb:
 319                     ; 144 	__kretry[4] = 0;
 321  0000 725f0004      	clr	___kretry+4
 322                     ; 145 	if( __kretry[0] == 0 )
 324  0004 725d0000      	tnz	___kretry
 325  0008 2602          	jrne	L521
 326                     ; 146 		return 0;
 328  000a 4f            	clr	a
 331  000b 81            	ret	
 332  000c               L521:
 333                     ; 148 	if( __kretry[1] != 0 )
 335  000c 725d0001      	tnz	___kretry+1
 336  0010 2706          	jreq	L721
 337                     ; 150 		__kretry[1]--;
 339  0012 725a0001      	dec	___kretry+1
 340                     ; 151 		return 0;
 342  0016 4f            	clr	a
 345  0017 81            	ret	
 346  0018               L721:
 347                     ; 153 	__kretry[1] = KOCOM_RETRY_TIME;
 349  0018 35140001      	mov	___kretry+1,#20
 350                     ; 155 	kocom_retry_count++;
 352  001c 725c0000      	inc	_kocom_retry_count
 353                     ; 156 	__kretry[4] = 1;
 355  0020 35010004      	mov	___kretry+4,#1
 356                     ; 157 	__kretry[2]--;
 358  0024 725a0002      	dec	___kretry+2
 359                     ; 158 	if( __kretry[2] == 0 )
 361  0028 2614          	jrne	L131
 362                     ; 160 		if( _k2[6] == 1 )
 364  002a c60024        	ld	a,__k2+6
 365  002d 4a            	dec	a
 366  002e 2605          	jrne	L331
 367                     ; 162 			_k2[0] = 54;
 369  0030 3536001e      	mov	__k2,#54
 370                     ; 163 			return 0;
 374  0034 81            	ret	
 375  0035               L331:
 376                     ; 167 			__kretry[0] = 0;
 378  0035 725f0000      	clr	___kretry
 379                     ; 168 			__kretry[4] = 0;
 381  0039 725f0004      	clr	___kretry+4
 382                     ; 170 		return 0;
 384  003d 4f            	clr	a
 387  003e               L131:
 388                     ; 172 }
 391  003e 81            	ret	
 432                     ; 174 void hn_kocom2_make_checkSum(void) {
 433                     .text:	section	.text,new
 434  0000               _hn_kocom2_make_checkSum:
 436  0000 89            	pushw	x
 437       00000002      OFST:	set	2
 440                     ; 176 	uint8_t s = 0;
 442  0001 0f01          	clr	(OFST-1,sp)
 443                     ; 177 	for ( i = 2; i < 18; i++ )
 445  0003 a602          	ld	a,#2
 446  0005 6b02          	ld	(OFST+0,sp),a
 447  0007               L551:
 448                     ; 178 		s += _ua.r[i];
 450  0007 5f            	clrw	x
 451  0008 97            	ld	xl,a
 452  0009 7b01          	ld	a,(OFST-1,sp)
 453  000b db0054        	add	a,(__ua+84,x)
 454  000e 6b01          	ld	(OFST-1,sp),a
 455                     ; 177 	for ( i = 2; i < 18; i++ )
 457  0010 0c02          	inc	(OFST+0,sp)
 460  0012 7b02          	ld	a,(OFST+0,sp)
 461  0014 a112          	cp	a,#18
 462  0016 25ef          	jrult	L551
 463                     ; 179 	_ua.r[18] = s;
 465  0018 7b01          	ld	a,(OFST-1,sp)
 466  001a c70066        	ld	__ua+102,a
 467                     ; 180 }
 470  001d 85            	popw	x
 471  001e 81            	ret	
 513                     ; 182 uint8_t hn_kocom2_check_room_state(uint8_t room) {
 514                     .text:	section	.text,new
 515  0000               _hn_kocom2_check_room_state:
 517  0000 88            	push	a
 518  0001 88            	push	a
 519       00000001      OFST:	set	1
 522                     ; 183 	uint8_t temp = (funcInfo.rcLED | funcInfo.sub_rcLED);
 524  0002 c60012        	ld	a,_funcInfo+18
 525  0005 ca0013        	or	a,_funcInfo+19
 526  0008 6b01          	ld	(OFST+0,sp),a
 527                     ; 184 	return getHexToBin(temp , room);
 529  000a 7b02          	ld	a,(OFST+1,sp)
 530  000c 97            	ld	xl,a
 531  000d 7b01          	ld	a,(OFST+0,sp)
 532  000f 95            	ld	xh,a
 533  0010 cd0000        	call	_getHexToBin
 537  0013 85            	popw	x
 538  0014 81            	ret	
 593                     ; 187 uint8_t hn_kocom_change_temp(uint8_t t, uint8_t min, uint8_t max) {
 594                     .text:	section	.text,new
 595  0000               _hn_kocom_change_temp:
 597  0000 89            	pushw	x
 598  0001 88            	push	a
 599       00000001      OFST:	set	1
 602                     ; 190 	if (getHexToBin(t, 7) == 1) {
 604  0002 ae0007        	ldw	x,#7
 605  0005 7b02          	ld	a,(OFST+1,sp)
 606  0007 95            	ld	xh,a
 607  0008 cd0000        	call	_getHexToBin
 609  000b 4a            	dec	a
 610                     ; 191 		temp = min;
 612  000c 270f          	jreq	LC003
 613                     ; 192 	} else if (min > max) {
 615  000e 7b03          	ld	a,(OFST+2,sp)
 616  0010 1106          	cp	a,(OFST+5,sp)
 617                     ; 193 		temp = max;
 619  0012 2211          	jrugt	LC002
 620                     ; 195 		temp = t *2;
 622  0014 7b02          	ld	a,(OFST+1,sp)
 623  0016 48            	sll	a
 624  0017 6b01          	ld	(OFST+0,sp),a
 625                     ; 196 		if( temp < min )	temp = min;
 627  0019 1103          	cp	a,(OFST+2,sp)
 628  001b 2404          	jruge	L332
 631  001d               LC003:
 633  001d 7b03          	ld	a,(OFST+2,sp)
 635  001f 2006          	jra	L522
 636  0021               L332:
 637                     ; 197 		else if( temp > max )	temp = max;
 639  0021 1106          	cp	a,(OFST+5,sp)
 640  0023 2302          	jrule	L522
 643  0025               LC002:
 645  0025 7b06          	ld	a,(OFST+5,sp)
 646  0027               L522:
 647                     ; 200 	return temp;
 651  0027 5b03          	addw	sp,#3
 652  0029 81            	ret	
 699                     ; 203 uint8_t hn_kocom2_ptc_base_check(void) {
 700                     .text:	section	.text,new
 701  0000               _hn_kocom2_ptc_base_check:
 703  0000 89            	pushw	x
 704       00000002      OFST:	set	2
 707                     ; 205 	uint8_t s = 0;
 709  0001 0f01          	clr	(OFST-1,sp)
 710                     ; 206 	if (hn_buf_count == 15) {
 712  0003 c60000        	ld	a,_hn_buf_count
 713  0006 a10f          	cp	a,#15
 714  0008 2604          	jrne	L752
 715                     ; 207 		hn_buf_count = 0;
 717  000a 725f0000      	clr	_hn_buf_count
 718  000e               L752:
 719                     ; 209 	if (_ua.b[0] != 0xAA) {	return 0;	}
 721  000e c60004        	ld	a,__ua+4
 722  0011 a1aa          	cp	a,#170
 725  0013 2607          	jrne	LC004
 726                     ; 210 	if (_ua.b[1] != 0x55) {	return 0;	}
 728  0015 c60005        	ld	a,__ua+5
 729  0018 a155          	cp	a,#85
 730  001a 2703          	jreq	L362
 733  001c               LC004:
 739  001c 4f            	clr	a
 741  001d               L43:
 743  001d 85            	popw	x
 744  001e 81            	ret	
 745  001f               L362:
 746                     ; 211 	if (_ua.b[5] != 0x36) {	return 0;}
 748  001f c60009        	ld	a,__ua+9
 749  0022 a136          	cp	a,#54
 752  0024 26f6          	jrne	LC004
 753                     ; 212 	if (_ua.b[19] != 0X0D) {return 0;	}
 755  0026 c60017        	ld	a,__ua+23
 756  0029 a10d          	cp	a,#13
 759  002b 26ef          	jrne	LC004
 760                     ; 213 	if (_ua.b[20] != 0X0D) {return 0;	}
 762  002d c60018        	ld	a,__ua+24
 763  0030 a10d          	cp	a,#13
 766  0032 26e8          	jrne	LC004
 767                     ; 215 	for( i=2; i<18; i++ )
 769  0034 a602          	ld	a,#2
 770  0036 6b02          	ld	(OFST+0,sp),a
 771  0038               L372:
 772                     ; 216 		s += _ua.b[i];
 774  0038 5f            	clrw	x
 775  0039 97            	ld	xl,a
 776  003a 7b01          	ld	a,(OFST-1,sp)
 777  003c db0004        	add	a,(__ua+4,x)
 778  003f 6b01          	ld	(OFST-1,sp),a
 779                     ; 215 	for( i=2; i<18; i++ )
 781  0041 0c02          	inc	(OFST+0,sp)
 784  0043 7b02          	ld	a,(OFST+0,sp)
 785  0045 a112          	cp	a,#18
 786  0047 25ef          	jrult	L372
 787                     ; 217 	if( s != _ua.b[18] )
 789  0049 7b01          	ld	a,(OFST-1,sp)
 790  004b c10016        	cp	a,__ua+22
 791  004e 270b          	jreq	L103
 792                     ; 219 		hn_error_checksum = 1;
 794  0050 35010000      	mov	_hn_error_checksum,#1
 795                     ; 220 		hn_buf_error[hn_buf_count++] = 1;
 797  0054 ad1c          	call	LC005
 798  0056 d70000        	ld	(_hn_buf_error,x),a
 799                     ; 221 		return 0;
 801  0059 20c1          	jp	LC004
 802  005b               L103:
 803                     ; 224 	hn_error_checksum = 0;
 805  005b 725f0000      	clr	_hn_error_checksum
 806                     ; 225 	hn_type = HN_TYPE_KOCOM;
 808  005f 35040000      	mov	_hn_type,#4
 809                     ; 226 	hn_connect = 0;
 811  0063 725f0000      	clr	_hn_connect
 812                     ; 227 	hn_buf_error[hn_buf_count++] = 0;
 814  0067 ad09          	call	LC005
 815  0069 724f0000      	clr	(_hn_buf_error,x)
 816  006d c70000        	ld	_ext_hn_error,a
 817                     ; 238 	return 1;
 820  0070 20ab          	jra	L43
 821  0072               LC005:
 822  0072 c60000        	ld	a,_hn_buf_count
 823  0075 725c0000      	inc	_hn_buf_count
 824  0079 5f            	clrw	x
 825  007a 97            	ld	xl,a
 826                     ; 229 	ext_hn_error = 1;                             
 828  007b a601          	ld	a,#1
 829  007d 81            	ret	
 869                     ; 241 void hn_kocom2_prepare(uint8_t b3)
 869                     ; 242 {
 870                     .text:	section	.text,new
 871  0000               _hn_kocom2_prepare:
 873  0000 88            	push	a
 874       00000001      OFST:	set	1
 877                     ; 244 	_ua.r[0] = KOCOM_START;
 879  0001 35aa0054      	mov	__ua+84,#170
 880                     ; 245 	_ua.r[1] = KOCOM_START2;
 882  0005 35550055      	mov	__ua+85,#85
 883                     ; 246 	_ua.r[2] = _ua.b[2];
 885  0009 5500060056    	mov	__ua+86,__ua+6
 886                     ; 247 	_ua.r[3] = b3;//	 0xD0 | (_ua.b[3] & 0x0F);
 888  000e c70057        	ld	__ua+87,a
 889                     ; 248 	_ua.r[4] = _ua.b[4]; 
 891  0011 5500080058    	mov	__ua+88,__ua+8
 892                     ; 249 	_ua.r[5] = _ua.b[7]; 
 894  0016 55000b0059    	mov	__ua+89,__ua+11
 895                     ; 250 	_ua.r[6] = _ua.b[8]; 
 897  001b 55000c005a    	mov	__ua+90,__ua+12
 898                     ; 251 	_ua.r[7] = _ua.b[5]; 
 900  0020 550009005b    	mov	__ua+91,__ua+9
 901                     ; 252 	_ua.r[8] = _ua.b[6];
 903                     ; 253 	for( i=9; i<18; i++ )
 905  0025 a609          	ld	a,#9
 906  0027 55000a005c    	mov	__ua+92,__ua+10
 907  002c 6b01          	ld	(OFST+0,sp),a
 908  002e               L123:
 909                     ; 254 		_ua.r[i] = _ua.b[i];
 911  002e 5f            	clrw	x
 912  002f 97            	ld	xl,a
 913  0030 d60004        	ld	a,(__ua+4,x)
 914  0033 d70054        	ld	(__ua+84,x),a
 915                     ; 253 	for( i=9; i<18; i++ )
 917  0036 0c01          	inc	(OFST+0,sp)
 920  0038 7b01          	ld	a,(OFST+0,sp)
 921  003a a112          	cp	a,#18
 922  003c 25f0          	jrult	L123
 923                     ; 255 	_ua.r[18] = 0x00;
 925  003e 725f0066      	clr	__ua+102
 926                     ; 256 	_ua.r[19] = KOCOM_END;
 928  0042 350d0067      	mov	__ua+103,#13
 929                     ; 257 	_ua.r[20] = KOCOM_END;
 931  0046 350d0068      	mov	__ua+104,#13
 932                     ; 258 }
 935  004a 84            	pop	a
 936  004b 81            	ret	
 962                     ; 260 void hn_kocom2_ack(void) 
 962                     ; 261 {
 963                     .text:	section	.text,new
 964  0000               _hn_kocom2_ack:
 968                     ; 262 	hn_kocom2_prepare(0xD0|(_ua.b[3] & 0x0F));
 970  0000 c60007        	ld	a,__ua+7
 971  0003 a40f          	and	a,#15
 972  0005 aad0          	or	a,#208
 973  0007 cd0000        	call	_hn_kocom2_prepare
 975                     ; 263 	hn_kocom2_make_checkSum();
 977  000a cd0000        	call	_hn_kocom2_make_checkSum
 979                     ; 264 	KOCOM_SEND
 981  000d 35150003      	mov	__ua+3,#21
 984  0011 350100a4      	mov	__ua+164,#1
 987  0015 356400a5      	mov	__ua+165,#100
 988                     ; 265 }
 991  0019 81            	ret	
1047                     ; 267 void hn_kocom2_make_response_packet(uint8_t count, uint8_t rid) 
1047                     ; 268 {
1048                     .text:	section	.text,new
1049  0000               _hn_kocom2_make_response_packet:
1051  0000 89            	pushw	x
1052  0001 88            	push	a
1053       00000001      OFST:	set	1
1056                     ; 270 	for( r=0; r<21; r++ )
1058  0002 4f            	clr	a
1059  0003 6b01          	ld	(OFST+0,sp),a
1060  0005               L753:
1061                     ; 271 		_ua.r[r] = _k2buf[r];
1063  0005 5f            	clrw	x
1064  0006 97            	ld	xl,a
1065  0007 d60008        	ld	a,(__k2buf,x)
1066  000a d70054        	ld	(__ua+84,x),a
1067                     ; 270 	for( r=0; r<21; r++ )
1069  000d 0c01          	inc	(OFST+0,sp)
1072  000f 7b01          	ld	a,(OFST+0,sp)
1073  0011 a115          	cp	a,#21
1074  0013 25f0          	jrult	L753
1075                     ; 272 	hn_kocom2_prepare(0xBC + count);
1077  0015 7b02          	ld	a,(OFST+1,sp)
1078  0017 abbc          	add	a,#188
1079  0019 cd0000        	call	_hn_kocom2_prepare
1081                     ; 273 	_ua.r[8] = rid;
1083  001c 7b03          	ld	a,(OFST+2,sp)
1084  001e c7005c        	ld	__ua+92,a
1085                     ; 274 	_ua.r[9] = 0x00;
1087  0021 725f005d      	clr	__ua+93
1088                     ; 275 	r = rcInfo.mode[rid];
1090  0025 5f            	clrw	x
1091  0026 97            	ld	xl,a
1092  0027 d60010        	ld	a,(_rcInfo+16,x)
1093  002a 6b01          	ld	(OFST+0,sp),a
1094                     ; 276 	_ua.r[10] = (r == MODE_STOP) ? 0x00 : 0x10;
1096  002c a104          	cp	a,#4
1097  002e 2603          	jrne	L25
1098  0030 4f            	clr	a
1099  0031 2002          	jra	L45
1100  0033               L25:
1101  0033 a610          	ld	a,#16
1102  0035               L45:
1103  0035 c7005e        	ld	__ua+94,a
1104                     ; 277 	_ua.r[10] |= (_is_shower == 1 ) ? 0x04 : 0x01;
1106  0038 c60000        	ld	a,__is_shower
1107  003b 4a            	dec	a
1108  003c 2604          	jrne	L65
1109  003e a604          	ld	a,#4
1110  0040 2002          	jra	L06
1111  0042               L65:
1112  0042 a601          	ld	a,#1
1113  0044               L06:
1114  0044 ca005e        	or	a,__ua+94
1115  0047 c7005e        	ld	__ua+94,a
1116                     ; 278 	_ua.r[11] = (r == MODE_OUT) ? 0x01 : 0x00;
1118  004a 7b01          	ld	a,(OFST+0,sp)
1119  004c a102          	cp	a,#2
1120  004e 2604          	jrne	L26
1121  0050 a601          	ld	a,#1
1122  0052 2001          	jra	L46
1123  0054               L26:
1124  0054 4f            	clr	a
1125  0055               L46:
1126  0055 c7005f        	ld	__ua+95,a
1127                     ; 279 	_ua.r[12] = (rcInfo.setup_temp[rid] / 2);
1129  0058 5f            	clrw	x
1130  0059 7b03          	ld	a,(OFST+2,sp)
1131  005b 97            	ld	xl,a
1132  005c d60008        	ld	a,(_rcInfo+8,x)
1133  005f 5f            	clrw	x
1134  0060 97            	ld	xl,a
1135  0061 57            	sraw	x
1136  0062 01            	rrwa	x,a
1137  0063 c70060        	ld	__ua+96,a
1138                     ; 281 	km2CheckRange(_ua.r);
1140  0066 ae0054        	ldw	x,#__ua+84
1141  0069 cd0000        	call	_km2CheckRange
1143                     ; 283 	_ua.r[13] = 0x00; //funcInfo.boiler_set_water_shower;
1145  006c 725f0061      	clr	__ua+97
1146                     ; 284 	_ua.r[14] = (rcInfo.curr_temp[rid] / 2);
1148  0070 5f            	clrw	x
1149  0071 7b03          	ld	a,(OFST+2,sp)
1150  0073 97            	ld	xl,a
1151  0074 d60000        	ld	a,(_rcInfo,x)
1152  0077 5f            	clrw	x
1153  0078 97            	ld	xl,a
1154  0079 57            	sraw	x
1155  007a 01            	rrwa	x,a
1156  007b c70062        	ld	__ua+98,a
1157                     ; 285 	_ua.r[15] = 0x00; // 추후 지원 (난방수 현재 온도)
1159  007e 725f0063      	clr	__ua+99
1160                     ; 286 	_ua.r[16] = funcInfo.error;
1162  0082 5500080064    	mov	__ua+100,_funcInfo+8
1163                     ; 287 	_ua.r[17] = (hn_kocom2_check_room_state(rid) == 1) ? 0x01 : 0x02;
1165  0087 7b03          	ld	a,(OFST+2,sp)
1166  0089 cd0000        	call	_hn_kocom2_check_room_state
1168  008c 4a            	dec	a
1169  008d 2603          	jrne	L07
1170  008f 4c            	inc	a
1171  0090 2002          	jra	L47
1172  0092               L07:
1173  0092 a602          	ld	a,#2
1174  0094               L47:
1175  0094 c70065        	ld	__ua+101,a
1176                     ; 288 	hn_kocom2_make_checkSum();
1178  0097 cd0000        	call	_hn_kocom2_make_checkSum
1180                     ; 289 	KOCOM_SEND
1182  009a 35150003      	mov	__ua+3,#21
1185  009e 350100a4      	mov	__ua+164,#1
1188  00a2 356400a5      	mov	__ua+165,#100
1189                     ; 290 }
1192  00a6 5b03          	addw	sp,#3
1193  00a8 81            	ret	
1248                     ; 292 void hn_kocom2_make_set_packet(uint8_t count, uint8_t rid) 
1248                     ; 293 {
1249                     .text:	section	.text,new
1250  0000               _hn_kocom2_make_set_packet:
1252  0000 89            	pushw	x
1253  0001 88            	push	a
1254       00000001      OFST:	set	1
1257                     ; 295 	for( r=0; r<21; r++ )
1259  0002 4f            	clr	a
1260  0003 6b01          	ld	(OFST+0,sp),a
1261  0005               L504:
1262                     ; 296 		_ua.r[r] = _k2buf[r];
1264  0005 5f            	clrw	x
1265  0006 97            	ld	xl,a
1266  0007 d60008        	ld	a,(__k2buf,x)
1267  000a d70054        	ld	(__ua+84,x),a
1268                     ; 295 	for( r=0; r<21; r++ )
1270  000d 0c01          	inc	(OFST+0,sp)
1273  000f 7b01          	ld	a,(OFST+0,sp)
1274  0011 a115          	cp	a,#21
1275  0013 25f0          	jrult	L504
1276                     ; 297 	hn_kocom2_prepare(0xBC + count);
1278  0015 7b02          	ld	a,(OFST+1,sp)
1279  0017 abbc          	add	a,#188
1280  0019 cd0000        	call	_hn_kocom2_prepare
1282                     ; 298 	_ua.r[8] = rid;
1284  001c 7b03          	ld	a,(OFST+2,sp)
1285  001e c7005c        	ld	__ua+92,a
1286                     ; 299 	_ua.r[9] = 0x00;
1288  0021 725f005d      	clr	__ua+93
1289                     ; 300 	r = rcInfo.mode[rid];
1291                     ; 306 	km2CheckRange(_ua.r);
1293  0025 ae0054        	ldw	x,#__ua+84
1294  0028 cd0000        	call	_km2CheckRange
1296                     ; 308 	_ua.r[13] = 0x00; //funcInfo.boiler_set_water_shower;
1298  002b 725f0061      	clr	__ua+97
1299                     ; 309 	_ua.r[14] = (rcInfo.curr_temp[rid] / 2);
1301  002f 5f            	clrw	x
1302  0030 7b03          	ld	a,(OFST+2,sp)
1303  0032 97            	ld	xl,a
1304  0033 d60000        	ld	a,(_rcInfo,x)
1305  0036 5f            	clrw	x
1306  0037 97            	ld	xl,a
1307  0038 57            	sraw	x
1308  0039 01            	rrwa	x,a
1309  003a c70062        	ld	__ua+98,a
1310                     ; 310 	_ua.r[15] = 0x00; // 추후 지원 (난방수 현재 온도)
1312  003d 725f0063      	clr	__ua+99
1313                     ; 311 	_ua.r[16] = funcInfo.error;
1315  0041 5500080064    	mov	__ua+100,_funcInfo+8
1316                     ; 312 	_ua.r[17] = /*(hn_kocom2_check_room_state(rid) == 1)*/_uc.r[14]>_uc.r[12] ? 0x02 : 0x01;
1318  0046 c60052        	ld	a,__uc+82
1319  0049 c10050        	cp	a,__uc+80
1320  004c 2304          	jrule	L601
1321  004e a602          	ld	a,#2
1322  0050 2002          	jra	L011
1323  0052               L601:
1324  0052 a601          	ld	a,#1
1325  0054               L011:
1326  0054 c70065        	ld	__ua+101,a
1327                     ; 313 	hn_kocom2_make_checkSum();
1329  0057 cd0000        	call	_hn_kocom2_make_checkSum
1331                     ; 314 	KOCOM_SEND
1333  005a 35150003      	mov	__ua+3,#21
1336  005e 350100a4      	mov	__ua+164,#1
1339  0062 356400a5      	mov	__ua+165,#100
1340                     ; 315 }
1343  0066 5b03          	addw	sp,#3
1344  0068 81            	ret	
1402                     ; 317 void hn_kocom2_make_send_packet(uint8_t count, uint8_t rid) 
1402                     ; 318 {
1403                     .text:	section	.text,new
1404  0000               _hn_kocom2_make_send_packet:
1406  0000 89            	pushw	x
1407  0001 89            	pushw	x
1408       00000002      OFST:	set	2
1411                     ; 321 	_uc.r[0] = KOCOM_START;
1413  0002 35aa0044      	mov	__uc+68,#170
1414                     ; 322 	_uc.r[1] = KOCOM_START2;
1416  0006 35550045      	mov	__uc+69,#85
1417                     ; 323 	_uc.r[2] = 0x30;//_ua.b[2];
1419  000a 35300046      	mov	__uc+70,#48
1420                     ; 324 	_uc.r[3] = 0xBC + count;//	 0xD0 | (_ua.b[3] & 0x0F);
1422  000e 9e            	ld	a,xh
1423  000f abbc          	add	a,#188
1424  0011 c70047        	ld	__uc+71,a
1425                     ; 325 	_uc.r[4] = 0x00;
1427  0014 725f0048      	clr	__uc+72
1428                     ; 326 	_uc.r[5] = 0x01;
1430  0018 35010049      	mov	__uc+73,#1
1431                     ; 327 	_uc.r[6] = 0x00;
1433  001c 725f004a      	clr	__uc+74
1434                     ; 328 	_uc.r[7] = 0x36;
1436  0020 3536004b      	mov	__uc+75,#54
1437                     ; 329 	_uc.r[8] = rid==0xff ? _uc.r[8] : rid;
1439  0024 7b04          	ld	a,(OFST+2,sp)
1440  0026 a1ff          	cp	a,#255
1441  0028 2603          	jrne	L611
1442  002a c6004c        	ld	a,__uc+76
1443  002d               L611:
1444  002d c7004c        	ld	__uc+76,a
1445                     ; 330 	_uc.r[9] = 0x00;
1447  0030 725f004d      	clr	__uc+77
1448                     ; 332 	r = _uc.r[60];	//rcInfo.mode[rid];
1450  0034 c60080        	ld	a,__uc+128
1451  0037 6b01          	ld	(OFST-1,sp),a
1452                     ; 333 	if( r == MODE_STOP )
1454  0039 a104          	cp	a,#4
1455  003b 2606          	jrne	L534
1456                     ; 335 		_uc.r[10] = 0x00;
1458  003d 725f004e      	clr	__uc+78
1459                     ; 336 		_uc.r[11] = 0x01;
1461  0041 2008          	jp	LC007
1462  0043               L534:
1463                     ; 338 	else if( r == MODE_OUT )
1465  0043 a102          	cp	a,#2
1466  0045 260a          	jrne	L144
1467                     ; 340 		_uc.r[10] = 0x11;
1469  0047 3511004e      	mov	__uc+78,#17
1470                     ; 341 		_uc.r[11] = 0x01;
1472  004b               LC007:
1474  004b 3501004f      	mov	__uc+79,#1
1476  004f 2012          	jra	L734
1477  0051               L144:
1478                     ; 343 	else if( r == MODE_OFF )
1480  0051 a140          	cp	a,#64
1481  0053 2606          	jrne	L544
1482                     ; 345 		_uc.r[10] = 0x01;
1484  0055 3501004e      	mov	__uc+78,#1
1485                     ; 346 		_uc.r[11] = 0x00;
1487  0059 2004          	jp	LC006
1488  005b               L544:
1489                     ; 350 		_uc.r[10] = 0x11;
1491  005b 3511004e      	mov	__uc+78,#17
1492                     ; 351 		_uc.r[11] = 0x00;
1494  005f               LC006:
1496  005f 725f004f      	clr	__uc+79
1497  0063               L734:
1498                     ; 354 	_uc.r[12] = r!=MODE_HOT ? rcInfo._t[rid] : _uc.r[62]/2;
1500  0063 7b01          	ld	a,(OFST-1,sp)
1501  0065 4a            	dec	a
1502  0066 270b          	jreq	L221
1503  0068 7b04          	ld	a,(OFST+2,sp)
1504  006a 5f            	clrw	x
1505  006b 97            	ld	xl,a
1506  006c d60018        	ld	a,(_rcInfo+24,x)
1507  006f 5f            	clrw	x
1508  0070 97            	ld	xl,a
1509  0071 2006          	jra	L421
1510  0073               L221:
1511  0073 c60082        	ld	a,__uc+130
1512  0076 5f            	clrw	x
1513  0077 97            	ld	xl,a
1514  0078 57            	sraw	x
1515  0079               L421:
1516  0079 01            	rrwa	x,a
1517  007a c70050        	ld	__uc+80,a
1518                     ; 356 	if( _uc.r[12] == 0 )
1520  007d 2604          	jrne	L154
1521                     ; 357 		_uc.r[12] = 10;
1523  007f 350a0050      	mov	__uc+80,#10
1524  0083               L154:
1525                     ; 359 	km2CheckRange(_uc.r);
1527  0083 ae0044        	ldw	x,#__uc+68
1528  0086 cd0000        	call	_km2CheckRange
1530                     ; 361 	_uc.r[14] = _uc.r[61]/2;
1532  0089 c60081        	ld	a,__uc+129
1533  008c 5f            	clrw	x
1534  008d 97            	ld	xl,a
1535  008e 57            	sraw	x
1536  008f 01            	rrwa	x,a
1537  0090 c70052        	ld	__uc+82,a
1538                     ; 362 	_uc.r[13] = 0x00; //funcInfo.boiler_set_water_shower;
1540  0093 725f0051      	clr	__uc+81
1541                     ; 363 	_uc.r[15] = 0x00; // 추후 지원 (난방수 현재 온도)
1543  0097 725f0053      	clr	__uc+83
1544                     ; 364 	_uc.r[16] = funcInfo.error;
1546  009b 5500080054    	mov	__uc+84,_funcInfo+8
1547                     ; 365 	_uc.r[17] = /*(hn_kocom2_check_room_state(rid) == 1)*/_uc.r[14]>_uc.r[12] ? 0x02 : 0x01;
1549  00a0 c10050        	cp	a,__uc+80
1550  00a3 2304          	jrule	L031
1551  00a5 a602          	ld	a,#2
1552  00a7 2002          	jra	L231
1553  00a9               L031:
1554  00a9 a601          	ld	a,#1
1555  00ab               L231:
1556  00ab c70055        	ld	__uc+85,a
1557                     ; 367 	_uc.r[18] = 0x00;
1559  00ae 725f0056      	clr	__uc+86
1560                     ; 368 	_uc.r[19] = KOCOM_END;
1562  00b2 350d0057      	mov	__uc+87,#13
1563                     ; 369 	_uc.r[20] = KOCOM_END;
1565  00b6 350d0058      	mov	__uc+88,#13
1566                     ; 371 	_uc.ir = 21;
1568  00ba 35150003      	mov	__uc+3,#21
1569                     ; 372 	r = 0;
1571  00be 0f01          	clr	(OFST-1,sp)
1572                     ; 373 	for ( i = 2; i < 18; i++ )
1574  00c0 a602          	ld	a,#2
1575  00c2 6b02          	ld	(OFST+0,sp),a
1576  00c4               L354:
1577                     ; 374 		r += _uc.r[i];
1579  00c4 5f            	clrw	x
1580  00c5 97            	ld	xl,a
1581  00c6 7b01          	ld	a,(OFST-1,sp)
1582  00c8 db0044        	add	a,(__uc+68,x)
1583  00cb 6b01          	ld	(OFST-1,sp),a
1584                     ; 373 	for ( i = 2; i < 18; i++ )
1586  00cd 0c02          	inc	(OFST+0,sp)
1589  00cf 7b02          	ld	a,(OFST+0,sp)
1590  00d1 a112          	cp	a,#18
1591  00d3 25ef          	jrult	L354
1592                     ; 375 	_uc.r[18] = r;
1594  00d5 7b01          	ld	a,(OFST-1,sp)
1595  00d7 c70056        	ld	__uc+86,a
1596                     ; 376 }
1599  00da 5b04          	addw	sp,#4
1600  00dc 81            	ret	
1646                     ; 378 void	hn_kocom_cb(uint8_t mode)
1646                     ; 379 {
1647                     .text:	section	.text,new
1648  0000               _hn_kocom_cb:
1650  0000 88            	push	a
1651  0001 89            	pushw	x
1652       00000002      OFST:	set	2
1655                     ; 380 	if( mode >= 100 )
1657  0002 a164          	cp	a,#100
1658  0004 2530          	jrult	L774
1659                     ; 382 		if( kocom_write != 0 )
1661  0006 725d0003      	tnz	_kocom_write
1662  000a 271c          	jreq	L105
1663                     ; 384 			if( mode-100 == kocom_write-1 )
1665  000c 5f            	clrw	x
1666  000d 97            	ld	xl,a
1667  000e 1d0064        	subw	x,#100
1668  0011 c60003        	ld	a,_kocom_write
1669  0014 905f          	clrw	y
1670  0016 9097          	ld	yl,a
1671  0018 905a          	decw	y
1672  001a 90bf00        	ldw	c_y,y
1673  001d b300          	cpw	x,c_y
1674  001f 2607          	jrne	L105
1675                     ; 386 				kocom_write = 0;
1677  0021 725f0003      	clr	_kocom_write
1678                     ; 387 				return;
1680  0025 cc00bb        	jra	L022
1681  0028               L105:
1682                     ; 390 		hn_kocom2_make_send_packet(0, mode-100);
1684  0028 7b03          	ld	a,(OFST+1,sp)
1685  002a a064          	sub	a,#100
1686  002c 97            	ld	xl,a
1687  002d 4f            	clr	a
1688  002e 95            	ld	xh,a
1689  002f cd0000        	call	_hn_kocom2_make_send_packet
1691                     ; 391 		_k2[4] = 100;
1693  0032 35640022      	mov	__k2+4,#100
1694  0036               L774:
1695                     ; 394 	if( _k2[0] == 4 )
1697  0036 c6001e        	ld	a,__k2
1698  0039 a104          	cp	a,#4
1699  003b 2606          	jrne	L505
1700                     ; 396 		KOCOM_RETRY_CLEAR
1702  003d 725f0000      	clr	___kretry
1703                     ; 397 		_k2[0] = 0;
1705  0041 2074          	jp	LC008
1706  0043               L505:
1707                     ; 399 	else if( _k2[0] == 0 )
1709  0043 c6001e        	ld	a,__k2
1710  0046 2651          	jrne	L115
1711                     ; 401 		if( _k2[4] == 100 )
1713  0048 c60022        	ld	a,__k2+4
1714  004b a164          	cp	a,#100
1715  004d 2617          	jrne	L315
1716                     ; 403 			uart3_tx_put(_uc.r, _uc.ir);
1718  004f 3b0003        	push	__uc+3
1719  0052 ae0044        	ldw	x,#__uc+68
1720  0055 cd0000        	call	_uart3_tx_put
1722  0058 35650022      	mov	__k2+4,#101
1723  005c cd0264        	call	LC009
1724  005f 725f0000      	clr	_kocom_retry_count
1725  0063 84            	pop	a
1726                     ; 404 			_k2[4] = 101;
1728                     ; 405 			KOCOM_RETRY
1737  0064 2055          	jra	L022
1738  0066               L315:
1739                     ; 407 		else if( _k2[4] == 101 )
1741  0066 a165          	cp	a,#101
1742  0068 2651          	jrne	L022
1743                     ; 409 			if( _k2[1] == 1 )		{	_k2[0] = 0;			}
1745  006a c6001f        	ld	a,__k2+1
1746  006d 4a            	dec	a
1747  006e 2603          	jrne	L125
1750  0070 c7001e        	ld	__k2,a
1751  0073               L125:
1752                     ; 410 			if( __kretry[4] == 1 )
1754  0073 c60004        	ld	a,___kretry+4
1755  0076 4a            	dec	a
1756  0077 2642          	jrne	L022
1757                     ; 412 				__kretry[4] = 0;
1759  0079 c70004        	ld	___kretry+4,a
1760                     ; 413 				hn_kocom2_make_send_packet(kocom_retry_count, 0xff);		
1762  007c ae00ff        	ldw	x,#255
1763  007f c60000        	ld	a,_kocom_retry_count
1764  0082 95            	ld	xh,a
1765  0083 cd0000        	call	_hn_kocom2_make_send_packet
1767                     ; 414 				uart3_tx_put(_uc.r, _uc.ir);
1769  0086 3b0003        	push	__uc+3
1770  0089 ae0044        	ldw	x,#__uc+68
1771  008c cd0000        	call	_uart3_tx_put
1773  008f 84            	pop	a
1774                     ; 415 				if( kocom_retry_count >= 3 )
1776  0090 c60000        	ld	a,_kocom_retry_count
1777  0093 a103          	cp	a,#3
1778  0095 2524          	jrult	L022
1779                     ; 416 					_k2[0] = 0;
1780  0097 201e          	jp	LC008
1781  0099               L115:
1782                     ; 420 	else if( _k2[0] == 1 )
1784  0099 a101          	cp	a,#1
1785  009b 2634          	jrne	L135
1786                     ; 423 		if( _ua.b[6]+1 > funcInfo.cnt+funcInfo2.cnt )
1788  009d c6000b        	ld	a,_funcInfo+11
1789  00a0 5f            	clrw	x
1790  00a1 cb000b        	add	a,_funcInfo2+11
1791  00a4 59            	rlcw	x
1792  00a5 02            	rlwa	x,a
1793  00a6 1f01          	ldw	(OFST-1,sp),x
1794  00a8 01            	rrwa	x,a
1795  00a9 4f            	clr	a
1796  00aa 97            	ld	xl,a
1797  00ab 4c            	inc	a
1798  00ac cb000a        	add	a,__ua+10
1799  00af 2401          	jrnc	L051
1800  00b1 5c            	incw	x
1801  00b2               L051:
1802  00b2 02            	rlwa	x,a
1803  00b3 1301          	cpw	x,(OFST-1,sp)
1804  00b5 2d07          	jrsle	L335
1805                     ; 425 			_k2[0] = 0;
1807  00b7               LC008:
1811  00b7 725f001e      	clr	__k2
1812                     ; 426 			return;
1813  00bb               L022:
1816  00bb 5b03          	addw	sp,#3
1817  00bd 81            	ret	
1818  00be               L335:
1819                     ; 428 		hn_kocom2_make_response_packet(0, _ua.b[6]);
1821  00be c6000a        	ld	a,__ua+10
1822  00c1 cd0295        	call	LC013
1824                     ; 429 		_k2[0] = 11;
1826  00c4 350b001e      	mov	__k2,#11
1827                     ; 430 		KOCOM_RETRY
1829  00c8 cd0264        	call	LC009
1832  00cb 725f0000      	clr	_kocom_retry_count
1834  00cf 20ea          	jra	L022
1835  00d1               L135:
1836                     ; 432 	else if( _k2[0] == 11 )
1838  00d1 a10b          	cp	a,#11
1839  00d3 261a          	jrne	L735
1840                     ; 434 		if( _k2[1] == 1 )		{	_k2[0] = _k2[1] = 0;	}
1842  00d5 c6001f        	ld	a,__k2+1
1843  00d8 4a            	dec	a
1844  00d9 2606          	jrne	L145
1847  00db c7001f        	ld	__k2+1,a
1848  00de c7001e        	ld	__k2,a
1849  00e1               L145:
1850                     ; 435 		if( __kretry[4] == 1 )
1852  00e1 c60004        	ld	a,___kretry+4
1853  00e4 4a            	dec	a
1854  00e5 26d4          	jrne	L022
1855                     ; 437 			__kretry[4] = 0;
1857  00e7 cd0271        	call	LC010
1858  00ea cd0000        	call	_hn_kocom2_make_response_packet
1860  00ed 20cc          	jra	L022
1861  00ef               L735:
1862                     ; 441 	else if( _k2[0] == 2 )
1864  00ef a102          	cp	a,#2
1865  00f1 2609          	jrne	L745
1866                     ; 443 		hn_kocom2_ack();
1868  00f3 cd0000        	call	_hn_kocom2_ack
1870                     ; 444 		_k2[0] = 21;
1872  00f6 3515001e      	mov	__k2,#21
1874  00fa 20bf          	jra	L022
1875  00fc               L745:
1876                     ; 446 	else if( _k2[0] == 21 )
1878  00fc a115          	cp	a,#21
1879  00fe 2621          	jrne	L355
1880                     ; 448 		if( _ua.sendReady == 0 )
1882  0100 c600a4        	ld	a,__ua+164
1883  0103 26b6          	jrne	L022
1884                     ; 450 			KOCOM_RETRY
1886  0105 cd0264        	call	LC009
1889  0108 c70000        	ld	_kocom_retry_count,a
1890                     ; 451 			hn_kocom2_make_set_packet(0, kocom_curr_room);
1892  010b c60001        	ld	a,_kocom_curr_room
1893  010e 97            	ld	xl,a
1894  010f 4f            	clr	a
1895  0110 95            	ld	xh,a
1896  0111 cd0000        	call	_hn_kocom2_make_set_packet
1898                     ; 452 			_k2[0] = 25;
1900  0114 3519001e      	mov	__k2,#25
1901                     ; 453 			kocom_write = kocom_curr_room+1;
1903  0118 c60001        	ld	a,_kocom_curr_room
1904  011b 4c            	inc	a
1905  011c c70003        	ld	_kocom_write,a
1906  011f 209a          	jra	L022
1907  0121               L355:
1908                     ; 456 	else if( _k2[0] == 25 )
1910  0121 a119          	cp	a,#25
1911  0123 261b          	jrne	L165
1912                     ; 458 		if( _k2[1] == 1 )		{	_k2[0] = _k2[1] = 0;	}
1914  0125 c6001f        	ld	a,__k2+1
1915  0128 4a            	dec	a
1916  0129 2606          	jrne	L365
1919  012b c7001f        	ld	__k2+1,a
1920  012e c7001e        	ld	__k2,a
1921  0131               L365:
1922                     ; 459 		if( __kretry[4] == 1 )
1924  0131 c60004        	ld	a,___kretry+4
1925  0134 4a            	dec	a
1926  0135 2684          	jrne	L022
1927                     ; 461 			__kretry[4] = 0;
1929  0137 cd0271        	call	LC010
1930  013a cd0000        	call	_hn_kocom2_make_set_packet
1932  013d cc00bb        	jra	L022
1933  0140               L165:
1934                     ; 465 	else if( _k2[0] == 22 )
1936  0140 a116          	cp	a,#22
1937  0142 261b          	jrne	L175
1938                     ; 467 		if( _k2[1] == 1 )		{	_k2[0] = _k2[1] = 0;		}
1940  0144 c6001f        	ld	a,__k2+1
1941  0147 4a            	dec	a
1942  0148 2606          	jrne	L375
1945  014a c7001f        	ld	__k2+1,a
1946  014d c7001e        	ld	__k2,a
1947  0150               L375:
1948                     ; 468 		if( __kretry[4] == 1 )
1950  0150 c60004        	ld	a,___kretry+4
1951  0153 4a            	dec	a
1952  0154 26e7          	jrne	L022
1953                     ; 470 			__kretry[4] = 0;
1955  0156 cd0271        	call	LC010
1956  0159 cd0000        	call	_hn_kocom2_make_response_packet
1958  015c cc00bb        	jra	L022
1959  015f               L175:
1960                     ; 474 	else if( _k2[0] == 5 )
1962  015f a105          	cp	a,#5
1963  0161 260d          	jrne	L106
1964                     ; 476 		KOCOM_RETRY
1966  0163 cd0264        	call	LC009
1969  0166 cd027d        	call	LC011
1970                     ; 479 		_k2[6] = 1;	//	ff : continue if not ack ready
1972  0169 35010024      	mov	__k2+6,#1
1974  016d cc00bb        	jra	L022
1975  0170               L106:
1976                     ; 481 	else if( _k2[0] == 55 )
1978  0170 a137          	cp	a,#55
1979  0172 266a          	jrne	L506
1980                     ; 483 		if( _k2[1] == 1 )
1982  0174 c6001f        	ld	a,__k2+1
1983  0177 4a            	dec	a
1984  0178 262e          	jrne	L706
1985                     ; 485 FF_RETRY:
1985                     ; 486 			kocom_curr_room++;
1987  017a 725c0001      	inc	_kocom_curr_room
1988                     ; 487 			KOCOM_IF_CURR_ROOM_OVER_EXIT
1990  017e cd029b        	call	LC014
1991  0181 2401          	jrnc	L071
1992  0183 5c            	incw	x
1993  0184               L071:
1994  0184 02            	rlwa	x,a
1995  0185 1f01          	ldw	(OFST-1,sp),x
1996  0187 cd028b        	call	LC012
1997  018a 1301          	cpw	x,(OFST-1,sp)
1998  018c 2e0f          	jrsge	L116
2001  018e 725f001e      	clr	__k2
2002  0192 725f0024      	clr	__k2+6
2005  0196 725f0000      	clr	___kretry
2008  019a cc00bb        	jra	L022
2009  019d               L116:
2010                     ; 488 			_k2[0] = 56;
2012  019d 3538001e      	mov	__k2,#56
2013                     ; 489 			_k2[1] = 0;
2015  01a1 725f001f      	clr	__k2+1
2016                     ; 490 			return;
2018  01a5 cc00bb        	jra	L022
2019  01a8               L706:
2020                     ; 492 		if( __kretry[4] != 1 )
2022  01a8 c60004        	ld	a,___kretry+4
2023  01ab 4a            	dec	a
2024  01ac 26f7          	jrne	L022
2025                     ; 493 			return;
2027                     ; 494 		__kretry[4] = 0;
2029  01ae c70004        	ld	___kretry+4,a
2030                     ; 495 		KOCOM_IF_CURR_ROOM_OVER_EXIT
2032  01b1 cd029b        	call	LC014
2033  01b4 2401          	jrnc	L471
2034  01b6 5c            	incw	x
2035  01b7               L471:
2036  01b7 02            	rlwa	x,a
2037  01b8 1f01          	ldw	(OFST-1,sp),x
2038  01ba cd028b        	call	LC012
2039  01bd 1301          	cpw	x,(OFST-1,sp)
2040  01bf 2e0f          	jrsge	L516
2043  01c1 725f001e      	clr	__k2
2044  01c5 725f0024      	clr	__k2+6
2047  01c9 725f0000      	clr	___kretry
2050  01cd cc00bb        	jra	L022
2051  01d0               L516:
2052                     ; 496 		hn_kocom2_make_response_packet(kocom_retry_count, kocom_curr_room);			
2054  01d0 c60001        	ld	a,_kocom_curr_room
2055  01d3 97            	ld	xl,a
2056  01d4 c60000        	ld	a,_kocom_retry_count
2057  01d7 95            	ld	xh,a
2058  01d8 cd0000        	call	_hn_kocom2_make_response_packet
2061  01db cc00bb        	jra	L022
2062  01de               L506:
2063                     ; 498 	else if( _k2[0] == 56 )
2065  01de a138          	cp	a,#56
2066  01e0 2606          	jrne	L126
2067                     ; 503 		kocom_retry_count = 0;
2069  01e2 cd027d        	call	LC011
2070                     ; 505 		_k2[0] = 55;
2071  01e5 cc00bb        	jra	L022
2072  01e8               L126:
2073                     ; 507 	else if( _k2[0] == 54 )
2075  01e8 a136          	cp	a,#54
2076  01ea 262b          	jrne	L526
2077                     ; 509 		kocom_curr_room++;
2079  01ec 725c0001      	inc	_kocom_curr_room
2080                     ; 510 		KOCOM_IF_CURR_ROOM_OVER_EXIT
2082  01f0 4f            	clr	a
2083  01f1 cd029b        	call	LC014
2084  01f4 2401          	jrnc	L402
2085  01f6 5c            	incw	x
2086  01f7               L402:
2087  01f7 02            	rlwa	x,a
2088  01f8 1f01          	ldw	(OFST-1,sp),x
2089  01fa cd028b        	call	LC012
2090  01fd 1301          	cpw	x,(OFST-1,sp)
2091  01ff 2e0f          	jrsge	L726
2094  0201 725f001e      	clr	__k2
2095  0205 725f0024      	clr	__k2+6
2098  0209 725f0000      	clr	___kretry
2101  020d cc00bb        	jra	L022
2102  0210               L726:
2103                     ; 511 		KOCOM_RETRY
2105  0210 ad52          	call	LC009
2108  0212 ad69          	call	LC011
2109                     ; 513 		_k2[0] = 55;
2110  0214 cc00bb        	jra	L022
2111  0217               L526:
2112                     ; 515 	else if( _k2[0] == 7 )
2114  0217 a107          	cp	a,#7
2115  0219 260a          	jrne	L336
2116                     ; 517 		hn_kocom2_ack();
2118  021b cd0000        	call	_hn_kocom2_ack
2120                     ; 518 		_k2[0] = 71;
2122  021e 3547001e      	mov	__k2,#71
2124  0222 cc00bb        	jra	L022
2125  0225               L336:
2126                     ; 520 	else if( _k2[0] == 71 )
2128  0225 a147          	cp	a,#71
2129  0227 2616          	jrne	L736
2130                     ; 522 		if( _ua.sendReady == 0 )
2132  0229 c600a4        	ld	a,__ua+164
2133  022c 26f4          	jrne	L022
2134                     ; 524 			KOCOM_RETRY
2136  022e ad34          	call	LC009
2139  0230 c70000        	ld	_kocom_retry_count,a
2140                     ; 525 			hn_kocom2_make_response_packet(0, kocom_curr_room);
2142  0233 c60001        	ld	a,_kocom_curr_room
2143  0236 ad5d          	call	LC013
2145                     ; 526 			_k2[0] = 72;
2147  0238 3548001e      	mov	__k2,#72
2148  023c cc00bb        	jra	L022
2149  023f               L736:
2150                     ; 529 	else if( _k2[0] == 72 )
2152  023f a148          	cp	a,#72
2153  0241 261a          	jrne	L546
2154                     ; 531 		if( _k2[1] == 1 )	{		_k2[0] = _k2[1] = 0;		}
2156  0243 c6001f        	ld	a,__k2+1
2157  0246 4a            	dec	a
2158  0247 2606          	jrne	L746
2161  0249 c7001f        	ld	__k2+1,a
2162  024c c7001e        	ld	__k2,a
2163  024f               L746:
2164                     ; 532 		if( __kretry[4] == 1 )
2166  024f c60004        	ld	a,___kretry+4
2167  0252 4a            	dec	a
2168  0253 26e7          	jrne	L022
2169                     ; 534 			__kretry[4] = 0;
2171  0255 ad1a          	call	LC010
2172  0257 cd0000        	call	_hn_kocom2_make_response_packet
2174  025a cc00bb        	jra	L022
2175  025d               L546:
2176                     ; 538 	else if( _k2[0] == 8 )	{		_k2[0] = 0;	}
2178  025d a108          	cp	a,#8
2179  025f 26f9          	jrne	L022
2181                     ; 539 }
2183  0261 cc00b7        	jp	LC008
2184  0264               LC009:
2185  0264 35030002      	mov	___kretry+2,#3
2186                     ; 524 			KOCOM_RETRY
2188  0268 35140001      	mov	___kretry+1,#20
2191  026c 35010000      	mov	___kretry,#1
2192  0270 81            	ret	
2193  0271               LC010:
2194  0271 c70004        	ld	___kretry+4,a
2195                     ; 535 			hn_kocom2_make_response_packet(kocom_retry_count, kocom_curr_room);			
2197  0274 c60001        	ld	a,_kocom_curr_room
2198  0277 97            	ld	xl,a
2199  0278 c60000        	ld	a,_kocom_retry_count
2200  027b 95            	ld	xh,a
2201  027c 81            	ret	
2202  027d               LC011:
2203  027d 725f0000      	clr	_kocom_retry_count
2204                     ; 512 		hn_kocom2_make_response_packet(kocom_retry_count, kocom_curr_room);
2206  0281 c60001        	ld	a,_kocom_curr_room
2207  0284 ad0f          	call	LC013
2209                     ; 513 		_k2[0] = 55;
2211  0286 3537001e      	mov	__k2,#55
2212  028a 81            	ret	
2213  028b               LC012:
2214  028b 5f            	clrw	x
2215  028c c6000b        	ld	a,_funcInfo+11
2216  028f cb000b        	add	a,_funcInfo2+11
2217  0292 59            	rlcw	x
2218  0293 02            	rlwa	x,a
2219  0294 81            	ret	
2220  0295               LC013:
2221  0295 97            	ld	xl,a
2222  0296 4f            	clr	a
2223  0297 95            	ld	xh,a
2224  0298 cc0000        	jp	_hn_kocom2_make_response_packet
2225  029b               LC014:
2226  029b 97            	ld	xl,a
2227  029c 4c            	inc	a
2228  029d cb0001        	add	a,_kocom_curr_room
2229  02a0 81            	ret	
2282                     ; 541 void	hn_kocom_ptc_check(void)
2282                     ; 542 {
2283                     .text:	section	.text,new
2284  0000               _hn_kocom_ptc_check:
2286  0000 5203          	subw	sp,#3
2287       00000003      OFST:	set	3
2290                     ; 547 	if (hn_kocom2_ptc_base_check() == 0)
2292  0002 cd0000        	call	_hn_kocom2_ptc_base_check
2294  0005 4d            	tnz	a
2295  0006 2777          	jreq	L472
2296                     ; 548 		return;
2298                     ; 550 	km2Check();
2300  0008 cd0000        	call	_km2Check
2302                     ; 551 	__kretry[0] = 0;
2304  000b 725f0000      	clr	___kretry
2305                     ; 553 	i = _ua.b[3] & 0xf0;
2307  000f c60007        	ld	a,__ua+7
2308  0012 a4f0          	and	a,#240
2309  0014 6b03          	ld	(OFST+0,sp),a
2310                     ; 554 	_k2[1] = 0;
2312  0016 725f001f      	clr	__k2+1
2313                     ; 555 	if( i == 0xD0 )
2315  001a a1d0          	cp	a,#208
2316  001c 2607          	jrne	L776
2317                     ; 557 		_k2[1] = 1;
2319  001e 3501001f      	mov	__k2+1,#1
2321  0022 cc0138        	jra	L107
2322  0025               L776:
2323                     ; 559 	else if( i == 0x90 )
2325  0025 a190          	cp	a,#144
2326  0027 2624          	jrne	L307
2327                     ; 561 		if( _ua.b[9] == 0x3a )
2329  0029 c6000d        	ld	a,__ua+13
2330  002c a13a          	cp	a,#58
2331  002e 26f2          	jrne	L107
2332                     ; 563 			_k2[0] = _ua.b[6] == 0xff ? 5 : 1;
2334  0030 c6000a        	ld	a,__ua+10
2335  0033 4c            	inc	a
2336  0034 2604          	jrne	L032
2337  0036 a605          	ld	a,#5
2338  0038 2002          	jra	L232
2339  003a               L032:
2340  003a a601          	ld	a,#1
2341  003c               L232:
2342  003c c7001e        	ld	__k2,a
2343                     ; 564 			kocom_curr_room = _ua.b[6] == 0xff ? 0 : _ua.b[6];
2345  003f c6000a        	ld	a,__ua+10
2346  0042 a1ff          	cp	a,#255
2347  0044 2601          	jrne	L432
2348  0046 4f            	clr	a
2349  0047               L432:
2350  0047 c70001        	ld	_kocom_curr_room,a
2351  004a cc0138        	jra	L107
2352  004d               L307:
2353                     ; 570 		kocom_curr_room = _ua.b[6];
2355  004d c6000a        	ld	a,__ua+10
2356  0050 c70001        	ld	_kocom_curr_room,a
2357                     ; 571 		if( _ua.b[9] == 0x00 )
2359  0053 725d000d      	tnz	__ua+13
2360  0057 2703cc010a    	jrne	L117
2361                     ; 573 			if( kocom_curr_room != 0xff )
2363  005c 4c            	inc	a
2364  005d 2723          	jreq	L317
2365                     ; 575 				_k2[0] = funcInfo.cnt+funcInfo2.cnt < kocom_curr_room+1 ? 4 : 2;
2367  005f 4f            	clr	a
2368  0060 97            	ld	xl,a
2369  0061 4c            	inc	a
2370  0062 cb0001        	add	a,_kocom_curr_room
2371  0065 2401          	jrnc	L242
2372  0067 5c            	incw	x
2373  0068               L242:
2374  0068 02            	rlwa	x,a
2375  0069 1f01          	ldw	(OFST-2,sp),x
2376  006b cd0155        	call	LC015
2377  006e 1301          	cpw	x,(OFST-2,sp)
2378  0070 2e04          	jrsge	L042
2379  0072 a604          	ld	a,#4
2380  0074 2002          	jra	L642
2381  0076               L042:
2382  0076 a602          	ld	a,#2
2383  0078               L642:
2384  0078 c7001e        	ld	__k2,a
2385                     ; 576 				if( _k2[0] == 4 )
2387  007b a104          	cp	a,#4
2388  007d 2603          	jrne	L317
2389                     ; 577 					return;
2390  007f               L472:
2393  007f 5b03          	addw	sp,#3
2394  0081 81            	ret	
2395  0082               L317:
2396                     ; 579 			hnInfo_kocom.on_off = (_ua.b[10] & 0x10) ? 1 : 0;
2398  0082 7209000e04    	btjf	__ua+14,#4,L052
2399  0087 a601          	ld	a,#1
2400  0089 2001          	jra	L252
2401  008b               L052:
2402  008b 4f            	clr	a
2403  008c               L252:
2404  008c c7002c        	ld	_hnInfo_kocom,a
2405                     ; 580 			t = _ua.b[10] & 0x0F;
2407  008f c6000e        	ld	a,__ua+14
2408  0092 a40f          	and	a,#15
2409  0094 6b03          	ld	(OFST+0,sp),a
2410                     ; 581 			hnInfo_kocom.mode_heat = getHexToBin(t, 0);
2412  0096 5f            	clrw	x
2413  0097 95            	ld	xh,a
2414  0098 cd0000        	call	_getHexToBin
2416  009b c7002d        	ld	_hnInfo_kocom+1,a
2417                     ; 582 			hnInfo_kocom.mode_heat_water = getHexToBin(t, 1);
2419  009e ae0001        	ldw	x,#1
2420  00a1 7b03          	ld	a,(OFST+0,sp)
2421  00a3 95            	ld	xh,a
2422  00a4 cd0000        	call	_getHexToBin
2424  00a7 c7002e        	ld	_hnInfo_kocom+2,a
2425                     ; 583 			hnInfo_kocom.mode_shower_water = getHexToBin(t, 2);
2427  00aa ae0002        	ldw	x,#2
2428  00ad 7b03          	ld	a,(OFST+0,sp)
2429  00af 95            	ld	xh,a
2430  00b0 cd0000        	call	_getHexToBin
2432  00b3 c7002f        	ld	_hnInfo_kocom+3,a
2433                     ; 584 			hnInfo_kocom.mode_sub = _ua.b[11];
2435                     ; 586 			hnInfo_kocom.temp_set_heat = hn_kocom_change_temp(_ua.b[12], 0x0A, 0x50);
2437  00b6 4b50          	push	#80
2438  00b8 55000f0030    	mov	_hnInfo_kocom+4,__ua+15
2439  00bd ae000a        	ldw	x,#10
2440  00c0 c60010        	ld	a,__ua+16
2441  00c3 95            	ld	xh,a
2442  00c4 cd0000        	call	_hn_kocom_change_temp
2444  00c7 c70031        	ld	_hnInfo_kocom+5,a
2445                     ; 587 			hnInfo_kocom.temp_set_shower_water = _ua.b[13];
2447  00ca 5500110032    	mov	_hnInfo_kocom+6,__ua+17
2448  00cf 5b01          	addw	sp,#1
2449                     ; 589 			hnCnt.id = kocom_curr_room + 1;
2451  00d1 c60001        	ld	a,_kocom_curr_room
2452  00d4 4c            	inc	a
2453  00d5 c70000        	ld	_hnCnt,a
2454                     ; 592 			msg_hn = 1;
2456  00d8 35010000      	mov	_msg_hn,#1
2457                     ; 593 			hnCnt.comm = 1;
2459  00dc 35010003      	mov	_hnCnt+3,#1
2460                     ; 594 			if( hnInfo_kocom.on_off == 0x00 )
2462  00e0 c6002c        	ld	a,_hnInfo_kocom
2463  00e3 260a          	jrne	L717
2464                     ; 596 				hnCnt.mode = MODE_STOP;//OUT;
2466  00e5 35040001      	mov	_hnCnt+1,#4
2467                     ; 597 				hnCnt.setup_temp = 0xff;
2469  00e9 35ff0002      	mov	_hnCnt+2,#255
2471  00ed 2049          	jra	L107
2472  00ef               L717:
2473                     ; 601 				if( hnInfo_kocom.mode_sub == 0x01 )
2475  00ef c60030        	ld	a,_hnInfo_kocom+4
2476  00f2 4a            	dec	a
2477  00f3 260a          	jrne	L327
2478                     ; 603 					hnCnt.mode = MODE_OUT;
2480  00f5 35020001      	mov	_hnCnt+1,#2
2481                     ; 604 					hnCnt.setup_temp = 0xff;
2483  00f9 35ff0002      	mov	_hnCnt+2,#255
2485  00fd 2039          	jra	L107
2486  00ff               L327:
2487                     ; 608 					hnCnt.mode = MODE_HOT;
2489  00ff 35010001      	mov	_hnCnt+1,#1
2490                     ; 609 					hnCnt.setup_temp = hnInfo_kocom.temp_set_heat;	
2492  0103 5500310002    	mov	_hnCnt+2,_hnInfo_kocom+5
2493  0108 202e          	jra	L107
2494  010a               L117:
2495                     ; 613 		else if( _ua.b[9] == 0x3a )
2497  010a c6000d        	ld	a,__ua+13
2498  010d a13a          	cp	a,#58
2499  010f 2627          	jrne	L107
2500                     ; 615 			if( kocom_curr_room != 0xff )
2502  0111 c60001        	ld	a,_kocom_curr_room
2503  0114 4c            	inc	a
2504  0115 271d          	jreq	L337
2505                     ; 617 				_k2[0] = funcInfo.cnt+funcInfo2.cnt < kocom_curr_room+1 ? 4 : 7;
2507  0117 4f            	clr	a
2508  0118 97            	ld	xl,a
2509  0119 4c            	inc	a
2510  011a cb0001        	add	a,_kocom_curr_room
2511  011d 2401          	jrnc	L662
2512  011f 5c            	incw	x
2513  0120               L662:
2514  0120 02            	rlwa	x,a
2515  0121 1f01          	ldw	(OFST-2,sp),x
2516  0123 ad30          	call	LC015
2517  0125 1301          	cpw	x,(OFST-2,sp)
2518  0127 2e04          	jrsge	L462
2519  0129 a604          	ld	a,#4
2520  012b 2002          	jra	L272
2521  012d               L462:
2522  012d a607          	ld	a,#7
2523  012f               L272:
2524  012f c7001e        	ld	__k2,a
2526  0132 2004          	jra	L107
2527  0134               L337:
2528                     ; 620 				_k2[0] = 8;
2530  0134 3508001e      	mov	__k2,#8
2531  0138               L107:
2532                     ; 623 	if( _k2[1] == 0 )
2534  0138 c6001f        	ld	a,__k2+1
2535  013b 2703cc007f    	jrne	L472
2536                     ; 625 		for( i=0; i<21; i++ )
2538  0140 6b03          	ld	(OFST+0,sp),a
2539  0142               L147:
2540                     ; 626 			_k2buf[i] = _ua.b[i];
2542  0142 5f            	clrw	x
2543  0143 97            	ld	xl,a
2544  0144 d60004        	ld	a,(__ua+4,x)
2545  0147 d70008        	ld	(__k2buf,x),a
2546                     ; 625 		for( i=0; i<21; i++ )
2548  014a 0c03          	inc	(OFST+0,sp)
2551  014c 7b03          	ld	a,(OFST+0,sp)
2552  014e a115          	cp	a,#21
2553  0150 25f0          	jrult	L147
2554                     ; 628 }
2556  0152 cc007f        	jra	L472
2557  0155               LC015:
2558  0155 5f            	clrw	x
2559  0156 c6000b        	ld	a,_funcInfo+11
2560  0159 cb000b        	add	a,_funcInfo2+11
2561  015c 59            	rlcw	x
2562  015d 02            	rlwa	x,a
2563  015e 81            	ret	
2713                     	xdef	_hn_kocom2_make_send_packet
2714                     	xdef	_hn_kocom2_make_set_packet
2715                     	xdef	_hn_kocom2_make_response_packet
2716                     	xdef	_hn_kocom2_ack
2717                     	xdef	_hn_kocom2_prepare
2718                     	xdef	_hn_kocom2_ptc_base_check
2719                     	xdef	_hn_kocom_change_temp
2720                     	xdef	_hn_kocom2_check_room_state
2721                     	xdef	_hn_kocom2_make_checkSum
2722                     	xdef	_timer10msCb
2723                     	xdef	_kocom_write
2724                     	xdef	__isFirstCall
2725                     	xdef	_kocom_curr_room
2726                     	xdef	_kocom_retry_count
2727                     	xref	__is_shower
2728                     	xref	_msg_hn
2729                     	switch	.bss
2730  0000               ___kretry:
2731  0000 000000000000  	ds.b	8
2732                     	xdef	___kretry
2733  0008               __k2buf:
2734  0008 000000000000  	ds.b	22
2735                     	xdef	__k2buf
2736  001e               __k2:
2737  001e 000000000000  	ds.b	10
2738                     	xdef	__k2
2739                     	xdef	_km2CheckRange
2740                     	xdef	_km2Check
2741                     	xdef	_get_km2Info
2742  0028               _km2Info:
2743  0028 00000000      	ds.b	4
2744                     	xdef	_km2Info
2745                     	xref	_hnCnt
2746                     	xref	_rcInfo
2747                     	xref	_funcInfo2
2748                     	xref	_funcInfo
2749                     	xref	__uc
2750                     	xref	__ua
2751                     	xdef	_hn_kocom_cb
2752                     	xdef	_hn_kocom_ptc_check
2753                     	xref	_getHexToBin
2754  002c               _hnInfo_kocom:
2755  002c 000000000000  	ds.b	7
2756                     	xdef	_hnInfo_kocom
2757                     	xref	_hn_buf_count
2758                     	xref	_hn_buf_error
2759                     	xref	_hn_error_checksum
2760                     	xref	_hn_type
2761                     	xref	_hn_connect
2762                     	xref	_ext_hn_error
2763                     	xref	_uart3_tx_put
2764                     	xref.b	c_y
2784                     	end
