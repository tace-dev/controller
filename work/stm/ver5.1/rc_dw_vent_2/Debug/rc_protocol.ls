   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  75                     ; 9 _LPRCINFO	get_rcInfo(void)
  75                     ; 10 {
  76                     .text:	section	.text,new
  77  0000               f_get_rcInfo:
  81                     ; 11 	return &_rcInfo;
  83  0000 ae000c        	ldw	x,#__rcInfo
  86  0003 87            	retf	
 137                     ; 14 void	rcInfoSet(uint8_t id, uint8_t temp)
 137                     ; 15 {
 138                     .text:	section	.text,new
 139  0000               f_rcInfoSet:
 141  0000 89            	pushw	x
 142  0001 89            	pushw	x
 143       00000002      OFST:	set	2
 146                     ; 16 	_LPRCINFO	p = get_rcInfo();
 148  0002 8d000000      	callf	f_get_rcInfo
 150  0006 1f01          	ldw	(OFST-1,sp),x
 151                     ; 18 	p->out_temp = temp;
 153  0008 7b04          	ld	a,(OFST+2,sp)
 154  000a e701          	ld	(1,x),a
 155                     ; 19 	p->type = id;
 157  000c 7b03          	ld	a,(OFST+1,sp)
 158  000e f7            	ld	(x),a
 159                     ; 20 }
 162  000f 5b04          	addw	sp,#4
 163  0011 87            	retf	
 165                     	switch	.data
 166  0000               _debug_hn:
 167  0000 00            	dc.b	0
 168  0001               _debug_br:
 169  0001 00            	dc.b	0
 170  0002               _dr_mode_out:
 171  0002 01            	dc.b	1
 172  0003               _only_one:
 173  0003 00            	dc.b	0
 217                     ; 85 uint8_t getHexToBin(uint8_t hex, uint8_t idx)
 217                     ; 86 {
 218                     .text:	section	.text,new
 219  0000               f_getHexToBin:
 221  0000 89            	pushw	x
 222  0001 88            	push	a
 223       00000001      OFST:	set	1
 226                     ; 87 	uint8_t p = 0x80;
 228                     ; 88 	p = p >> (0x08 - (idx + 0x01));
 230  0002 9f            	ld	a,xl
 231  0003 a007          	sub	a,#7
 232  0005 40            	neg	a
 233  0006 5f            	clrw	x
 234  0007 97            	ld	xl,a
 235  0008 a680          	ld	a,#128
 236  000a 5d            	tnzw	x
 237  000b 2704          	jreq	L41
 238  000d               L61:
 239  000d 44            	srl	a
 240  000e 5a            	decw	x
 241  000f 26fc          	jrne	L61
 242  0011               L41:
 243  0011 6b01          	ld	(OFST+0,sp),a
 244                     ; 90 	if (hex & p)
 246  0013 7b02          	ld	a,(OFST+1,sp)
 247  0015 1501          	bcp	a,(OFST+0,sp)
 248  0017 2704          	jreq	L77
 249                     ; 92 		return 1;
 251  0019 a601          	ld	a,#1
 253  001b 2001          	jra	L02
 254  001d               L77:
 255                     ; 96 		return 0;
 257  001d 4f            	clr	a
 259  001e               L02:
 261  001e 5b03          	addw	sp,#3
 262  0020 87            	retf	
 296                     ; 100 void rc_ptc_baseSet(void) {
 297                     .text:	section	.text,new
 298  0000               f_rc_ptc_baseSet:
 300  0000 88            	push	a
 301       00000001      OFST:	set	1
 304                     ; 102 	state_check = RC_STATE_NORMAL;
 306  0001 3501000b      	mov	_state_check,#1
 307                     ; 103 	set_changed = 0;
 309  0005 725f000e      	clr	_set_changed
 310                     ; 105 	for (i = 0 ; i < 8 ; i++) {
 312  0009 4f            	clr	a
 313  000a 6b01          	ld	(OFST+0,sp),a
 314  000c               L711:
 315                     ; 106 		rcSubDataInfo.mode_heat[i] = 0xAA;
 317  000c 5f            	clrw	x
 318  000d 97            	ld	xl,a
 319  000e a6aa          	ld	a,#170
 320  0010 d70027        	ld	(_rcSubDataInfo+16,x),a
 321                     ; 107 		rcSubDataInfo.cur_temp[i] = 0xAA;
 323  0013 5f            	clrw	x
 324  0014 7b01          	ld	a,(OFST+0,sp)
 325  0016 97            	ld	xl,a
 326  0017 a6aa          	ld	a,#170
 327  0019 d70017        	ld	(_rcSubDataInfo,x),a
 328                     ; 108 		rcSubDataInfo.set_temp[i] = 0xAA;
 330  001c 5f            	clrw	x
 331  001d 7b01          	ld	a,(OFST+0,sp)
 332  001f 97            	ld	xl,a
 333  0020 a6aa          	ld	a,#170
 334  0022 d7001f        	ld	(_rcSubDataInfo+8,x),a
 335                     ; 109 		rcSubDataInfo.time[i] = 0xAA;
 337  0025 5f            	clrw	x
 338  0026 7b01          	ld	a,(OFST+0,sp)
 339  0028 97            	ld	xl,a
 340  0029 a6aa          	ld	a,#170
 341  002b d70037        	ld	(_rcSubDataInfo+32,x),a
 342                     ; 110 		rcSubDataInfo.banb[i] = 0xAA;
 344  002e 5f            	clrw	x
 345  002f 7b01          	ld	a,(OFST+0,sp)
 346  0031 97            	ld	xl,a
 347  0032 a6aa          	ld	a,#170
 348  0034 d7003f        	ld	(_rcSubDataInfo+40,x),a
 349                     ; 105 	for (i = 0 ; i < 8 ; i++) {
 351  0037 0c01          	inc	(OFST+0,sp)
 354  0039 7b01          	ld	a,(OFST+0,sp)
 355  003b a108          	cp	a,#8
 356  003d 25cd          	jrult	L711
 357                     ; 112 }
 360  003f 84            	pop	a
 361  0040 87            	retf	
 400                     ; 114 void rc_ptc_check_master(uint8_t *buf) {
 401                     .text:	section	.text,new
 402  0000               f_rc_ptc_check_master:
 404  0000 89            	pushw	x
 405       00000000      OFST:	set	0
 408                     ; 115 	if (buf[1] != 0x00) {
 410  0001 e601          	ld	a,(1,x)
 411  0003 2610          	jrne	L23
 412                     ; 116 		return;
 414                     ; 123 	if (getHexToBin(buf[6], 7) == 1) {  // H/N 패킷
 416  0005 1601          	ldw	y,(OFST+1,sp)
 417  0007 ae0007        	ldw	x,#7
 418  000a 90e606        	ld	a,(6,y)
 419  000d 95            	ld	xh,a
 420  000e 8d000000      	callf	f_getHexToBin
 422  0012 4a            	dec	a
 423  0013 2602          	jrne	L541
 424                     ; 124 		return;
 425  0015               L23:
 428  0015 85            	popw	x
 429  0016 87            	retf	
 430  0017               L541:
 431                     ; 127 	boiler_info.state = buf[4] & 0x03;
 433  0017 1e01          	ldw	x,(OFST+1,sp)
 434  0019 e604          	ld	a,(4,x)
 435  001b a403          	and	a,#3
 436  001d c70014        	ld	_boiler_info,a
 437                     ; 128 	boiler_info.hotwater = buf[2];
 439  0020 e602          	ld	a,(2,x)
 440  0022 c70015        	ld	_boiler_info+1,a
 441                     ; 129 	boiler_info.heatwater = buf[3];
 443  0025 e603          	ld	a,(3,x)
 444  0027 c70016        	ld	_boiler_info+2,a
 445                     ; 131 	uiInfo.cntlMode = getHexToBin(buf[4], 7);
 447  002a 1601          	ldw	y,(OFST+1,sp)
 448  002c ae0007        	ldw	x,#7
 449  002f 90e604        	ld	a,(4,y)
 450  0032 95            	ld	xh,a
 451  0033 8d000000      	callf	f_getHexToBin
 453  0037 c70003        	ld	_uiInfo+3,a
 454                     ; 133 	_boiler_fire = boiler_info.state;
 456  003a 5500140000    	mov	__boiler_fire,_boiler_info
 457                     ; 135 }
 459  003f 20d4          	jra	L23
 527                     ; 138 void rc_ptc_check_homenet(uint8_t *buf) {
 528                     .text:	section	.text,new
 529  0000               f_rc_ptc_check_homenet:
 531  0000 89            	pushw	x
 532  0001 5203          	subw	sp,#3
 533       00000003      OFST:	set	3
 536                     ; 139 	_LPRCINFO	p = get_rcInfo();
 538  0003 8d000000      	callf	f_get_rcInfo
 540  0007 1f01          	ldw	(OFST-2,sp),x
 541                     ; 143 	if (getHexToBin(buf[6], 7) == 0) { // 일반 패킷
 543  0009 1604          	ldw	y,(OFST+1,sp)
 544  000b ae0007        	ldw	x,#7
 545  000e 90e606        	ld	a,(6,y)
 546  0011 95            	ld	xh,a
 547  0012 8d000000      	callf	f_getHexToBin
 549  0016 4d            	tnz	a
 550  0017 270d          	jreq	L24
 551                     ; 144 		return;
 553                     ; 147 	id = buf[1] & 0x0F;
 555  0019 1e04          	ldw	x,(OFST+1,sp)
 556  001b e601          	ld	a,(1,x)
 557  001d a40f          	and	a,#15
 558  001f 6b03          	ld	(OFST+0,sp),a
 559                     ; 149 	if (id != uiInfo.id) {
 561  0021 c10004        	cp	a,_uiInfo+4
 562  0024 2703          	jreq	L102
 563                     ; 150 		return;
 564  0026               L24:
 567  0026 5b05          	addw	sp,#5
 568  0028 87            	retf	
 569  0029               L102:
 570                     ; 153 	packet_changed = 1;
 572  0029 35010005      	mov	_packet_changed,#1
 573                     ; 155 	if (_remote == 0) {
 575  002d c60000        	ld	a,__remote
 576  0030 26f4          	jrne	L24
 577                     ; 156 		_disp_mode2 = buf[2];
 579  0032 e602          	ld	a,(2,x)
 580  0034 c70000        	ld	__disp_mode2,a
 581                     ; 158 		if (buf[2] == RC_MODE_HEAT) {
 583  0037 a101          	cp	a,#1
 584  0039 260b          	jrne	L502
 585                     ; 159 			if (buf[3] != 0xFF) {
 587  003b e603          	ld	a,(3,x)
 588  003d a1ff          	cp	a,#255
 589  003f 27e5          	jreq	L24
 590                     ; 160 				uiInfo.tSetup = buf[3];
 592  0041 c7000e        	ld	_uiInfo+14,a
 593  0044 20e0          	jra	L24
 594  0046               L502:
 595                     ; 162 		} else if (buf[2] == RC_MODE_OUT) {
 597  0046 a102          	cp	a,#2
 598  0048 26dc          	jrne	L24
 599                     ; 163 			out_mode = (buf[4] & 0xF0) >> 7;
 601  004a e604          	ld	a,(4,x)
 602  004c 49            	rlc	a
 603  004d 4f            	clr	a
 604  004e 49            	rlc	a
 605  004f 6b03          	ld	(OFST+0,sp),a
 606                     ; 164 			uiInfo.tSetup = /*buf[3];//20*/p->out_temp;
 608  0051 1e01          	ldw	x,(OFST-2,sp)
 609  0053 e601          	ld	a,(1,x)
 610  0055 c7000e        	ld	_uiInfo+14,a
 611                     ; 165 			if (out_mode == 1) {
 613  0058 7b03          	ld	a,(OFST+0,sp)
 614  005a 4a            	dec	a
 615  005b 2606          	jrne	L512
 616                     ; 166 				dr_mode_out = 1;   // 개별외출
 618  005d 35010002      	mov	_dr_mode_out,#1
 620  0061 20c3          	jra	L24
 621  0063               L512:
 622                     ; 168 				dr_mode_out = 0;   // 전체 외출
 624  0063 725f0002      	clr	_dr_mode_out
 625                     ; 171 		else if( buf[2] == RC_MODE_STOP )
 627                     ; 173 			out_mode = 1;
 629                     ; 176 }
 631  0067 20bd          	jra	L24
 633                     	switch	.data
 634  0004               ___rc_max:
 635  0004 01            	dc.b	1
 694                     ; 181 void rc_ptc_check_normal(uint8_t *buf) {
 695                     .text:	section	.text,new
 696  0000               f_rc_ptc_check_normal:
 698  0000 89            	pushw	x
 699  0001 88            	push	a
 700       00000001      OFST:	set	1
 703                     ; 182 	uint8_t start = buf[0] & 0x0F;
 705  0002 f6            	ld	a,(x)
 706  0003 a40f          	and	a,#15
 707  0005 6b01          	ld	(OFST+0,sp),a
 708                     ; 184 	if (start == 0x0F) {
 710  0007 a10f          	cp	a,#15
 711  0009 2606          	jrne	L542
 712                     ; 185 		state_check = RC_STATE_FACTORY;
 714  000b 3505000b      	mov	_state_check,#5
 715                     ; 186 		return;
 717  000f 203e          	jra	L27
 718  0011               L542:
 719                     ; 189 	if (start == 0x01 || start == 0x09) {
 721  0011 a101          	cp	a,#1
 722  0013 2704          	jreq	L152
 724  0015 a109          	cp	a,#9
 725  0017 2604          	jrne	L742
 726  0019               L152:
 727                     ; 190 		only_one = 0;
 729  0019 725f0003      	clr	_only_one
 730  001d               L742:
 731                     ; 193 	if( start <= 0x08 )
 733  001d a109          	cp	a,#9
 734  001f 2408          	jruge	L352
 735                     ; 195 		if( start > __rc_max )
 737  0021 c10004        	cp	a,___rc_max
 738  0024 2303          	jrule	L352
 739                     ; 196 			__rc_max = start;
 741  0026 c70004        	ld	___rc_max,a
 742  0029               L352:
 743                     ; 199 	if (start == uiInfo.id) {
 745  0029 c10004        	cp	a,_uiInfo+4
 746  002c 260d          	jrne	L752
 747                     ; 200 		packet_buf[start - 1] = 0;
 749  002e 5f            	clrw	x
 750  002f 97            	ld	xl,a
 751  0030 5a            	decw	x
 752                     ; 201 		state_check = RC_STATE_NORMAL;
 754  0031 3501000b      	mov	_state_check,#1
 755  0035 724f0000      	clr	(_packet_buf,x)
 757  0039 2004          	jra	L162
 758  003b               L752:
 759                     ; 203 		state_check = RC_STATE_NONE;
 761  003b 725f000b      	clr	_state_check
 762  003f               L162:
 763                     ; 206 	if (start == 0x09 ) {
 765  003f a109          	cp	a,#9
 766  0041 260f          	jrne	L362
 767                     ; 207 		debug_hn = buf[2];
 769  0043 1e02          	ldw	x,(OFST+1,sp)
 770  0045 e602          	ld	a,(2,x)
 771  0047 c70000        	ld	_debug_hn,a
 772                     ; 208 		debug_br = buf[1];
 774  004a e601          	ld	a,(1,x)
 775  004c c70001        	ld	_debug_br,a
 776                     ; 209 		return;
 777  004f               L27:
 780  004f 5b03          	addw	sp,#3
 781  0051 87            	retf	
 782  0052               L362:
 783                     ; 212 	if (uiInfo.mode == SETTING_MODE_MASTER) {
 785  0052 c60008        	ld	a,_uiInfo+8
 786  0055 4a            	dec	a
 787  0056 2606          	jrne	L562
 788                     ; 213 		rc_ptc_check_master(buf);
 790  0058 1e02          	ldw	x,(OFST+1,sp)
 791  005a 8d000000      	callf	f_rc_ptc_check_master
 793  005e               L562:
 794                     ; 216 	if ( _remote == 0 && _backup_backlight == 0) {
 796  005e c60000        	ld	a,__remote
 797  0061 2653          	jrne	L762
 799  0063 c60000        	ld	a,__backup_backlight
 800  0066 264e          	jrne	L762
 801                     ; 217 		if (getHexToBin(buf[6], 7) == 0) {
 803  0068 1602          	ldw	y,(OFST+1,sp)
 804  006a ae0007        	ldw	x,#7
 805  006d 90e606        	ld	a,(6,y)
 806  0070 95            	ld	xh,a
 807  0071 8d000000      	callf	f_getHexToBin
 809  0075 4d            	tnz	a
 810  0076 263e          	jrne	L762
 811                     ; 218 			_rcLED = buf[1];
 813  0078 1e02          	ldw	x,(OFST+1,sp)
 814  007a e601          	ld	a,(1,x)
 815  007c c70003        	ld	__rcLED,a
 816                     ; 220 			if (getHexToBin(buf[1], uiInfo.id - 1) == 1) {
 818  007f c60004        	ld	a,_uiInfo+4
 819  0082 4a            	dec	a
 820  0083 1602          	ldw	y,(OFST+1,sp)
 821  0085 97            	ld	xl,a
 822  0086 90e601        	ld	a,(1,y)
 823  0089 95            	ld	xh,a
 824  008a 8d000000      	callf	f_getHexToBin
 826  008e 4a            	dec	a
 827  008f 2610          	jrne	L372
 828                     ; 225 				lcd_disp_rid(uiInfo.id, 1, (uiInfo.mode == SETTING_MODE_MASTER) ? 1 : 0);
 830  0091 c60008        	ld	a,_uiInfo+8
 831  0094 4a            	dec	a
 832  0095 2603          	jrne	L65
 833  0097 4c            	inc	a
 834  0098 2001          	jra	L06
 835  009a               L65:
 836  009a 4f            	clr	a
 837  009b               L06:
 838  009b 88            	push	a
 839  009c ae0001        	ldw	x,#1
 842  009f 200c          	jpf	LC002
 843  00a1               L372:
 844                     ; 236 				lcd_disp_rid(uiInfo.id, 0, (uiInfo.mode == SETTING_MODE_MASTER) ? 1 : 0);
 846  00a1 c60008        	ld	a,_uiInfo+8
 847  00a4 4a            	dec	a
 848  00a5 2603          	jrne	L46
 849  00a7 4c            	inc	a
 850  00a8 2001          	jra	L66
 851  00aa               L46:
 852  00aa 4f            	clr	a
 853  00ab               L66:
 854  00ab 88            	push	a
 855  00ac 5f            	clrw	x
 857  00ad               LC002:
 858  00ad c60004        	ld	a,_uiInfo+4
 859  00b0 95            	ld	xh,a
 860  00b1 8d000000      	callf	f_lcd_disp_rid
 861  00b5 84            	pop	a
 862  00b6               L762:
 863                     ; 246 	rc_ptc_check_homenet(buf);
 865  00b6 1e02          	ldw	x,(OFST+1,sp)
 866  00b8 8d000000      	callf	f_rc_ptc_check_homenet
 868                     ; 248 	_version = buf[6] >> 1;
 870  00bc 1e02          	ldw	x,(OFST+1,sp)
 871  00be e606          	ld	a,(6,x)
 872  00c0 44            	srl	a
 873  00c1 c70008        	ld	__version,a
 874                     ; 250 	if (mode_recover == 0) {
 876  00c4 c60011        	ld	a,_mode_recover
 877  00c7 2614          	jrne	L772
 878                     ; 251 		error_type = (buf[4] & 0x0F) >> 2;
 880  00c9 e604          	ld	a,(4,x)
 881  00cb a40c          	and	a,#12
 882  00cd 44            	srl	a
 883  00ce 44            	srl	a
 884  00cf c70009        	ld	_error_type,a
 885                     ; 253 		if (error_type != 0) {
 887  00d2 2702          	jreq	L103
 888                     ; 254 			error = buf[5];
 890  00d4 e605          	ld	a,(5,x)
 892  00d6               L103:
 893                     ; 256 			error = 0;
 895  00d6 c7000a        	ld	_error,a
 896  00d9 ac4f004f      	jra	L27
 897  00dd               L772:
 898                     ; 259 		if (((buf[4]& 0x0F) >> 2) == 0 && buf[5] == 0) {
 900  00dd e604          	ld	a,(4,x)
 901  00df a40c          	and	a,#12
 902  00e1 44            	srl	a
 903  00e2 44            	srl	a
 904  00e3 5f            	clrw	x
 905  00e4 97            	ld	xl,a
 906  00e5 5d            	tnzw	x
 907  00e6 26f1          	jrne	L27
 909  00e8 1e02          	ldw	x,(OFST+1,sp)
 910  00ea e605          	ld	a,(5,x)
 911  00ec 26eb          	jrne	L27
 912                     ; 260 			error_type = 0;
 914  00ee c70009        	ld	_error_type,a
 915                     ; 261 			error = 0;
 917  00f1 c7000a        	ld	_error,a
 918                     ; 262 			mode_recover = 0;
 920  00f4 c70011        	ld	_mode_recover,a
 921                     ; 269 }
 923  00f7 ac4f004f      	jra	L27
 970                     ; 272 void rc_ptc_check_setting(uint8_t *buf) {
 971                     .text:	section	.text,new
 972  0000               f_rc_ptc_check_setting:
 974  0000 88            	push	a
 975       00000001      OFST:	set	1
 978                     ; 273 	uint8_t page = buf[0] & 0x0F;
 980  0001 f6            	ld	a,(x)
 981  0002 a40f          	and	a,#15
 982  0004 6b01          	ld	(OFST+0,sp),a
 983                     ; 275 	if (uiInfo.mode != SETTING_MODE_MASTER) {
 985  0006 c60008        	ld	a,_uiInfo+8
 986  0009 4a            	dec	a
 987  000a 2702          	jreq	L133
 988                     ; 276 		return;
 991  000c 84            	pop	a
 992  000d 87            	retf	
 993  000e               L133:
 994                     ; 279 	state_check = RC_STATE_SETTING;
 996  000e 3502000b      	mov	_state_check,#2
 997                     ; 281 	if (cur_set_page == page) {
 999  0012 c60007        	ld	a,_cur_set_page
1000  0015 1101          	cp	a,(OFST+0,sp)
1001  0017 2607          	jrne	L333
1002                     ; 282 		cur_set_page++;
1004  0019 725c0007      	inc	_cur_set_page
1005  001d c60007        	ld	a,_cur_set_page
1006  0020               L333:
1007                     ; 285 	if (cur_set_page == MAX_SETTING_PAGE) { 
1009  0020 a103          	cp	a,#3
1010  0022 2614          	jrne	L533
1011                     ; 286 		set_changed = 0;
1013  0024 725f000e      	clr	_set_changed
1014                     ; 287 		cur_set_page = 0;
1016  0028 725f0007      	clr	_cur_set_page
1017                     ; 289 		func_rc_settingCb(1);
1019  002c a601          	ld	a,#1
1020  002e 8d000000      	callf	f_func_rc_settingCb
1022                     ; 290 		state_check = RC_STATE_NORMAL;
1024  0032 3501000b      	mov	_state_check,#1
1026  0036 2005          	jra	L733
1027  0038               L533:
1028                     ; 292 		func_rc_settingCb(0);
1030  0038 4f            	clr	a
1031  0039 8d000000      	callf	f_func_rc_settingCb
1033  003d               L733:
1034                     ; 294 }
1037  003d 84            	pop	a
1038  003e 87            	retf	
1095                     ; 297 void rc_ptc_check_rc(uint8_t *buf) {
1096                     .text:	section	.text,new
1097  0000               f_rc_ptc_check_rc:
1099  0000 89            	pushw	x
1100  0001 89            	pushw	x
1101       00000002      OFST:	set	2
1104                     ; 301 	st = (buf[0] & 0x0F) - 1;
1106  0002 f6            	ld	a,(x)
1107  0003 a40f          	and	a,#15
1108  0005 4a            	dec	a
1109  0006 6b02          	ld	(OFST+0,sp),a
1110                     ; 303 	if (uiInfo.mode != SETTING_MODE_MASTER) {
1112  0008 c60008        	ld	a,_uiInfo+8
1113  000b 4a            	dec	a
1114  000c 2742          	jreq	L704
1115                     ; 304 		if (st == 0) {
1117  000e 7b02          	ld	a,(OFST+0,sp)
1118  0010 2704acb400b4  	jrne	L211
1119                     ; 305 			if (buf[1] == RC_MODE_OUT && (buf[5] & 0x01)  == 0) {
1121  0016 e601          	ld	a,(1,x)
1122  0018 a102          	cp	a,#2
1123  001a 260e          	jrne	L314
1125  001c e605          	ld	a,(5,x)
1126  001e a501          	bcp	a,#1
1127  0020 2608          	jrne	L314
1128                     ; 306 				_disp_mode2 = RC_MODE_OUT;
1130  0022 35020000      	mov	__disp_mode2,#2
1131                     ; 307 				dr_mode_out = 0;
1133  0026 725f0002      	clr	_dr_mode_out
1134  002a               L314:
1135                     ; 315 			if (dr_mode_out == 0) {
1137  002a c60002        	ld	a,_dr_mode_out
1138  002d 26e3          	jrne	L211
1139                     ; 316 				if (_disp_mode2 == RC_MODE_OUT) {
1141  002f c60000        	ld	a,__disp_mode2
1142  0032 a102          	cp	a,#2
1143  0034 267e          	jrne	L211
1144                     ; 317 					if (buf[1] != RC_MODE_OUT) {
1146  0036 1e03          	ldw	x,(OFST+1,sp)
1147  0038 e601          	ld	a,(1,x)
1148  003a a102          	cp	a,#2
1149  003c 2706          	jreq	L124
1150                     ; 318 						packet_changed = 1;
1152  003e 8d730173      	callf	LC006
1153                     ; 320 						_disp_mode2 = FW_GET_DISPMODE;
1154  0042 2070          	jra	L211
1155  0044               L124:
1156                     ; 322 						if((buf[5] & 0x01) != 0)  {
1158  0044 e605          	ld	a,(5,x)
1159  0046 a501          	bcp	a,#1
1160  0048 276a          	jreq	L211
1161                     ; 323 							packet_changed = 1;
1163  004a 8d730173      	callf	LC006
1164                     ; 331 		return;
1166  004e 2064          	jra	L211
1167  0050               L704:
1168                     ; 334 	k = 0;
1170  0050 6b01          	ld	(OFST-1,sp),a
1171                     ; 336 	packet_buf[st] = 0;
1173  0052 5f            	clrw	x
1174  0053 7b02          	ld	a,(OFST+0,sp)
1175  0055 97            	ld	xl,a
1176  0056 724f0000      	clr	(_packet_buf,x)
1177                     ; 338 	if (_remote == 0) {
1179  005a 725d0000      	tnz	__remote
1180  005e 2704ac410141  	jrne	L724
1181                     ; 339 		if (rcSubDataInfo.mode_heat[st] == 0xFF) {
1183  0064 5f            	clrw	x
1184  0065 97            	ld	xl,a
1185  0066 d60027        	ld	a,(_rcSubDataInfo+16,x)
1186  0069 4c            	inc	a
1187  006a 264b          	jrne	L134
1188                     ; 340 			if (uiInfo.remote_mode[st] != buf[1]) {
1190  006c 7b02          	ld	a,(OFST+0,sp)
1191  006e 5f            	clrw	x
1192  006f 97            	ld	xl,a
1193  0070 d60045        	ld	a,(_uiInfo+69,x)
1194  0073 1e03          	ldw	x,(OFST+1,sp)
1195  0075 e101          	cp	a,(1,x)
1196                     ; 341 				k = 1;
1198  0077 2632          	jrne	LC003
1199                     ; 344 				switch (buf[1]) {
1201  0079 e601          	ld	a,(1,x)
1203                     ; 363 						break;
1204  007b 4a            	dec	a
1205  007c 270a          	jreq	L143
1206  007e a007          	sub	a,#7
1207  0080 2713          	jreq	L743
1208  0082 a008          	sub	a,#8
1209  0084 2718          	jreq	L153
1210  0086 2027          	jra	L534
1211  0088               L143:
1212                     ; 345 					case RC_MODE_HEAT:
1212                     ; 346 						if (uiInfo.tempSetup[st] != buf[3]) {
1214  0088 7b02          	ld	a,(OFST+0,sp)
1215  008a 5f            	clrw	x
1216  008b 97            	ld	xl,a
1217  008c d6003d        	ld	a,(_uiInfo+61,x)
1218  008f 1e03          	ldw	x,(OFST+1,sp)
1219  0091 e103          	cp	a,(3,x)
1220                     ; 347 							k = 1;
1221  0093 2014          	jpf	LC004
1222                     ; 350 					case RC_MODE_OUT:
1222                     ; 351 						break;
1224                     ; 352 					case RC_MODE_STOP:
1224                     ; 353 						break;
1226  0095               L743:
1227                     ; 354 					case RC_MODE_RESERVE:
1227                     ; 355 						if (uiInfo.remote_time[st] != buf[5]) {
1229  0095 7b02          	ld	a,(OFST+0,sp)
1230  0097 5f            	clrw	x
1231  0098 97            	ld	xl,a
1232  0099 d6004d        	ld	a,(_uiInfo+77,x)
1233                     ; 356 							k = 1;
1234  009c 2007          	jpf	LC005
1235  009e               L153:
1236                     ; 359 					case RC_MODE_REPEAT:
1236                     ; 360 						if (uiInfo.remote_banb[st] != buf[5]) {
1238  009e 7b02          	ld	a,(OFST+0,sp)
1239  00a0 5f            	clrw	x
1240  00a1 97            	ld	xl,a
1241  00a2 d60055        	ld	a,(_uiInfo+85,x)
1242  00a5               LC005:
1243  00a5 1e03          	ldw	x,(OFST+1,sp)
1244  00a7 e105          	cp	a,(5,x)
1245  00a9               LC004:
1246  00a9 2704          	jreq	L534
1247                     ; 361 							k = 1;
1249  00ab               LC003:
1253  00ab a601          	ld	a,#1
1254  00ad 6b01          	ld	(OFST-1,sp),a
1255  00af               L534:
1256                     ; 367 			if (k == 1) {
1258  00af 7b01          	ld	a,(OFST-1,sp)
1259  00b1 4a            	dec	a
1260  00b2 2603          	jrne	L134
1261                     ; 368 				return;
1262  00b4               L211:
1265  00b4 5b04          	addw	sp,#4
1266  00b6 87            	retf	
1267  00b7               L134:
1268                     ; 372 		rcSubDataInfo.mode_heat[st] = buf[1];
1270  00b7 7b02          	ld	a,(OFST+0,sp)
1271  00b9 5f            	clrw	x
1272  00ba 1603          	ldw	y,(OFST+1,sp)
1273  00bc 97            	ld	xl,a
1274  00bd 90e601        	ld	a,(1,y)
1275  00c0 d70027        	ld	(_rcSubDataInfo+16,x),a
1276                     ; 373 		rcSubDataInfo.cur_temp[st] = buf[2];
1278  00c3 5f            	clrw	x
1279  00c4 7b02          	ld	a,(OFST+0,sp)
1280  00c6 97            	ld	xl,a
1281  00c7 90e602        	ld	a,(2,y)
1282  00ca d70017        	ld	(_rcSubDataInfo,x),a
1283                     ; 375 		uiInfo.remote_mode[st] = buf[1];
1285  00cd 5f            	clrw	x
1286  00ce 7b02          	ld	a,(OFST+0,sp)
1287  00d0 97            	ld	xl,a
1288  00d1 90e601        	ld	a,(1,y)
1289  00d4 d70045        	ld	(_uiInfo+69,x),a
1290                     ; 376 		uiInfo.tempCurr[st] = buf[2];
1292  00d7 5f            	clrw	x
1293  00d8 7b02          	ld	a,(OFST+0,sp)
1294  00da 97            	ld	xl,a
1295  00db 90e602        	ld	a,(2,y)
1296  00de d70035        	ld	(_uiInfo+53,x),a
1297                     ; 378 		switch (buf[1]) {
1299  00e1 1e03          	ldw	x,(OFST+1,sp)
1300  00e3 e601          	ld	a,(1,x)
1302                     ; 394 				break;
1303  00e5 4a            	dec	a
1304  00e6 270a          	jreq	L353
1305  00e8 a007          	sub	a,#7
1306  00ea 271c          	jreq	L163
1307  00ec a008          	sub	a,#8
1308  00ee 272e          	jreq	L363
1309  00f0 2040          	jra	L554
1310  00f2               L353:
1311                     ; 379 			case RC_MODE_HEAT:
1311                     ; 380 				rcSubDataInfo.set_temp[st] = buf[3];
1313  00f2 7b02          	ld	a,(OFST+0,sp)
1314  00f4 5f            	clrw	x
1315  00f5 97            	ld	xl,a
1316  00f6 90e603        	ld	a,(3,y)
1317  00f9 d7001f        	ld	(_rcSubDataInfo+8,x),a
1318                     ; 381 				uiInfo.tempSetup[st] = buf[3];
1320  00fc 5f            	clrw	x
1321  00fd 7b02          	ld	a,(OFST+0,sp)
1322  00ff 97            	ld	xl,a
1323  0100 90e603        	ld	a,(3,y)
1324  0103 d7003d        	ld	(_uiInfo+61,x),a
1325                     ; 382 				break;
1327  0106 202a          	jra	L554
1328                     ; 383 			case RC_MODE_OUT:
1328                     ; 384 				break;
1330                     ; 385 			case RC_MODE_STOP:
1330                     ; 386 				break;
1332  0108               L163:
1333                     ; 387 			case RC_MODE_RESERVE:
1333                     ; 388 				rcSubDataInfo.time[st] = buf[5];
1335  0108 7b02          	ld	a,(OFST+0,sp)
1336  010a 5f            	clrw	x
1337  010b 97            	ld	xl,a
1338  010c 90e605        	ld	a,(5,y)
1339  010f d70037        	ld	(_rcSubDataInfo+32,x),a
1340                     ; 389 				uiInfo.remote_time[st] = buf[5];
1342  0112 5f            	clrw	x
1343  0113 7b02          	ld	a,(OFST+0,sp)
1344  0115 97            	ld	xl,a
1345  0116 90e605        	ld	a,(5,y)
1346  0119 d7004d        	ld	(_uiInfo+77,x),a
1347                     ; 390 				break;
1349  011c 2014          	jra	L554
1350  011e               L363:
1351                     ; 391 			case RC_MODE_REPEAT:
1351                     ; 392 				rcSubDataInfo.banb[st] = buf[5];
1353  011e 7b02          	ld	a,(OFST+0,sp)
1354  0120 5f            	clrw	x
1355  0121 97            	ld	xl,a
1356  0122 90e605        	ld	a,(5,y)
1357  0125 d7003f        	ld	(_rcSubDataInfo+40,x),a
1358                     ; 393 				uiInfo.remote_banb[st] = buf[5];
1360  0128 5f            	clrw	x
1361  0129 7b02          	ld	a,(OFST+0,sp)
1362  012b 97            	ld	xl,a
1363  012c 90e605        	ld	a,(5,y)
1364  012f d70055        	ld	(_uiInfo+85,x),a
1365                     ; 394 				break;
1367  0132               L554:
1368                     ; 397 		disp_char(uiInfo.remote_mode[st]);
1370  0132 7b02          	ld	a,(OFST+0,sp)
1371  0134 5f            	clrw	x
1372  0135 97            	ld	xl,a
1373  0136 d60045        	ld	a,(_uiInfo+69,x)
1374  0139 8d000000      	callf	f_disp_char
1377  013d acb400b4      	jra	L211
1378  0141               L724:
1379                     ; 401 		rcSubDataInfo.mode_heat[st] = 0xFF;
1381  0141 5f            	clrw	x
1382  0142 97            	ld	xl,a
1383  0143 a6ff          	ld	a,#255
1384  0145 d70027        	ld	(_rcSubDataInfo+16,x),a
1385                     ; 402 		rcSubDataInfo.cur_temp[st] = buf[2];
1387  0148 5f            	clrw	x
1388  0149 7b02          	ld	a,(OFST+0,sp)
1389  014b 1603          	ldw	y,(OFST+1,sp)
1390  014d 97            	ld	xl,a
1391  014e 90e602        	ld	a,(2,y)
1392  0151 d70017        	ld	(_rcSubDataInfo,x),a
1393                     ; 403 		rcSubDataInfo.set_temp[st] = 0xFF;
1395  0154 5f            	clrw	x
1396  0155 7b02          	ld	a,(OFST+0,sp)
1397  0157 97            	ld	xl,a
1398  0158 a6ff          	ld	a,#255
1399  015a d7001f        	ld	(_rcSubDataInfo+8,x),a
1400                     ; 404 		rcSubDataInfo.time[st] = 0xFF;
1402  015d 5f            	clrw	x
1403  015e 7b02          	ld	a,(OFST+0,sp)
1404  0160 97            	ld	xl,a
1405  0161 a6ff          	ld	a,#255
1406  0163 d70037        	ld	(_rcSubDataInfo+32,x),a
1407                     ; 405 		rcSubDataInfo.banb[st] = 0xFF;
1409  0166 5f            	clrw	x
1410  0167 7b02          	ld	a,(OFST+0,sp)
1411  0169 97            	ld	xl,a
1412  016a a6ff          	ld	a,#255
1413  016c d7003f        	ld	(_rcSubDataInfo+40,x),a
1414                     ; 407 }
1416  016f acb400b4      	jra	L211
1417  0173               LC006:
1418  0173 35010005      	mov	_packet_changed,#1
1419                     ; 324 							dr_mode_out = 1;
1421  0177 35010002      	mov	_dr_mode_out,#1
1422                     ; 325 							_disp_mode2 = FW_GET_DISPMODE;
1424  017b a629          	ld	a,#41
1425  017d 8d000000      	callf	f_file_read
1427  0181 c70000        	ld	__disp_mode2,a
1428  0184 87            	retf	
1473                     ; 410 void rc_ptc_check_subrc(uint8_t *buf) {
1474                     .text:	section	.text,new
1475  0000               f_rc_ptc_check_subrc:
1477  0000 89            	pushw	x
1478  0001 88            	push	a
1479       00000001      OFST:	set	1
1482                     ; 411 	uint8_t start = buf[0] & 0x0F;
1484  0002 f6            	ld	a,(x)
1485  0003 a40f          	and	a,#15
1486  0005 6b01          	ld	(OFST+0,sp),a
1487                     ; 413 	state_check = RC_STATE_NONE;
1489  0007 725f000b      	clr	_state_check
1490                     ; 415 	if (uiInfo.mode == SETTING_MODE_MASTER) {
1492  000b c60008        	ld	a,_uiInfo+8
1493  000e 4a            	dec	a
1494  000f 2707          	jreq	L611
1495                     ; 416 		return;
1497                     ; 419 	if (start != uiInfo.id) {
1499  0011 7b01          	ld	a,(OFST+0,sp)
1500  0013 c10004        	cp	a,_uiInfo+4
1501  0016 2703          	jreq	L115
1502                     ; 420 		return;
1503  0018               L611:
1506  0018 5b03          	addw	sp,#3
1507  001a 87            	retf	
1508  001b               L115:
1509                     ; 423 	packet_changed = 1;	
1511  001b 35010005      	mov	_packet_changed,#1
1512                     ; 424 	_disp_mode2 = buf[1];
1514  001f 1e02          	ldw	x,(OFST+1,sp)
1515  0021 e601          	ld	a,(1,x)
1516  0023 c70000        	ld	__disp_mode2,a
1517                     ; 426 	switch(_disp_mode2)
1520                     ; 430 	case RC_MODE_REPEAT:	uiInfo.repeat = buf[5];	break;
1521  0026 4a            	dec	a
1522  0027 270a          	jreq	L164
1523  0029 a007          	sub	a,#7
1524  002b 270d          	jreq	L364
1525  002d a008          	sub	a,#8
1526  002f 2710          	jreq	L564
1527  0031 20e5          	jra	L611
1528  0033               L164:
1529                     ; 428 	case RC_MODE_HEAT:		uiInfo.tSetup = buf[3];	break;
1531  0033 e603          	ld	a,(3,x)
1532  0035 c7000e        	ld	_uiInfo+14,a
1535  0038 20de          	jra	L611
1536  003a               L364:
1537                     ; 429 	case RC_MODE_RESERVE:	uiInfo.reserve = buf[5];	break;
1539  003a e605          	ld	a,(5,x)
1540  003c c7000d        	ld	_uiInfo+13,a
1543  003f 20d7          	jra	L611
1544  0041               L564:
1545                     ; 430 	case RC_MODE_REPEAT:	uiInfo.repeat = buf[5];	break;
1547  0041 e605          	ld	a,(5,x)
1548  0043 c7000c        	ld	_uiInfo+12,a
1551                     ; 432 }
1553  0046 20d0          	jra	L611
1615                     ; 434 void rc_ptc_check_mirror(uint8_t *buf) {
1616                     .text:	section	.text,new
1617  0000               f_rc_ptc_check_mirror:
1619  0000 89            	pushw	x
1620       00000001      OFST:	set	1
1623                     ; 439 	state_check = RC_STATE_NONE;
1625  0001 725f000b      	clr	_state_check
1626  0005 88            	push	a
1627                     ; 441 	if (uiInfo.mode != SETTING_MODE_MASTER) {
1629  0006 c60008        	ld	a,_uiInfo+8
1630  0009 a101          	cp	a,#1
1631  000b 2704accf01cf  	jrne	L555
1632                     ; 442 		return;
1634                     ; 445 	page = buf[0] & 0x0F;
1636  0011 1e02          	ldw	x,(OFST+1,sp)
1637  0013 f6            	ld	a,(x)
1638  0014 a40f          	and	a,#15
1639  0016 6b01          	ld	(OFST+0,sp),a
1640                     ; 446 	cur_mirror_page = page;
1642  0018 c70006        	ld	_cur_mirror_page,a
1643                     ; 447 	state_check = RC_STATE_MIRROR;
1645  001b 3506000b      	mov	_state_check,#6
1646                     ; 449 	switch(page) {
1649                     ; 530 			break;
1650  001f 2712          	jreq	L715
1651  0021 4a            	dec	a
1652  0022 2604acae00ae  	jreq	L125
1653  0028 4a            	dec	a
1654  0029 2604ac410141  	jreq	L325
1655  002f accf01cf      	jra	L555
1656  0033               L715:
1657                     ; 450 		case 0:
1657                     ; 451 			mode = (buf[6] & 0x80) >> 7;
1659  0033 e606          	ld	a,(6,x)
1660  0035 49            	rlc	a
1661  0036 4f            	clr	a
1662  0037 49            	rlc	a
1663  0038 6b01          	ld	(OFST+0,sp),a
1664                     ; 452 			if (mode == CNT_MODE_MAIN) {
1666  003a 2658          	jrne	L755
1667                     ; 453 				_boiler_type = (buf[1] & 0x80) >> 7;
1669  003c e601          	ld	a,(1,x)
1670  003e 49            	rlc	a
1671  003f 4f            	clr	a
1672  0040 49            	rlc	a
1673  0041 c70000        	ld	__boiler_type,a
1674                     ; 454 				uiInfo.lpmType = (buf[1] & 0x0F);
1676  0044 e601          	ld	a,(1,x)
1677  0046 a40f          	and	a,#15
1678  0048 c70013        	ld	_uiInfo+19,a
1679                     ; 455 				uiInfo.cnt = (buf[2] & 0x70) >> 4;
1681  004b 8dd201d2      	callf	LC007
1682  004f c70005        	ld	_uiInfo+5,a
1683                     ; 456 				uiInfo.valve = buf[2] & 0x0F;
1685  0052 e602          	ld	a,(2,x)
1686  0054 a40f          	and	a,#15
1687  0056 c7000a        	ld	_uiInfo+10,a
1688                     ; 457 				_boiler_water_shower = buf[3];
1690  0059 e603          	ld	a,(3,x)
1691  005b c70000        	ld	__boiler_water_shower,a
1692                     ; 458 				uiInfo.houseCapa = buf[4];
1694  005e e604          	ld	a,(4,x)
1695  0060 c70010        	ld	_uiInfo+16,a
1696                     ; 459 				_boiler_water_heat = buf[5] ;
1698  0063 e605          	ld	a,(5,x)
1699  0065 c70000        	ld	__boiler_water_heat,a
1700                     ; 460 				uiInfo.controlMode = mode;
1702  0068 7b01          	ld	a,(OFST+0,sp)
1703  006a c70009        	ld	_uiInfo+9,a
1704                     ; 461 				uiInfo.subRCLock = (buf[6] & 0x40) >> 6 ;
1706  006d e606          	ld	a,(6,x)
1707  006f 4e            	swap	a
1708  0070 a404          	and	a,#4
1709  0072 44            	srl	a
1710  0073 44            	srl	a
1711  0074 c7005d        	ld	_uiInfo+93,a
1712                     ; 462 				uiInfo.poType = (buf[6] & 0x30) >> 4;
1714  0077 e606          	ld	a,(6,x)
1715  0079 4e            	swap	a
1716  007a a403          	and	a,#3
1717  007c c7000f        	ld	_uiInfo+15,a
1718                     ; 463 				uiInfo.cntlMode = (buf[6] & 0x08) >> 3;
1720  007f e606          	ld	a,(6,x)
1721  0081 a408          	and	a,#8
1722  0083 44            	srl	a
1723  0084 44            	srl	a
1724  0085 44            	srl	a
1725  0086 c70003        	ld	_uiInfo+3,a
1726                     ; 464 				uiInfo.opMode = buf[6] & 0x07;
1728  0089 e606          	ld	a,(6,x)
1729  008b a407          	and	a,#7
1730  008d c70007        	ld	_uiInfo+7,a
1732  0090 accf01cf      	jra	L555
1733  0094               L755:
1734                     ; 466 				uiInfo.lpmType_sub = (buf[1] & 0x0F);
1736  0094 e601          	ld	a,(1,x)
1737  0096 a40f          	and	a,#15
1738  0098 c70014        	ld	_uiInfo+20,a
1739                     ; 467 				uiInfo.cnt_sub = (buf[2] & 0xF0) >> 4;
1741  009b e602          	ld	a,(2,x)
1742  009d 4e            	swap	a
1743  009e a40f          	and	a,#15
1744  00a0 c70006        	ld	_uiInfo+6,a
1745                     ; 468 				uiInfo.valve_sub = buf[2] & 0x0F;
1747  00a3 e602          	ld	a,(2,x)
1748  00a5 a40f          	and	a,#15
1749  00a7 c7000b        	ld	_uiInfo+11,a
1750  00aa accf01cf      	jra	L555
1751  00ae               L125:
1752                     ; 471 		case 1:
1752                     ; 472 			mode = (buf[1] & 0x80) >> 7;
1754  00ae e601          	ld	a,(1,x)
1755  00b0 49            	rlc	a
1756  00b1 4f            	clr	a
1757  00b2 49            	rlc	a
1758  00b3 6b01          	ld	(OFST+0,sp),a
1759                     ; 473 			if (mode == CNT_MODE_MAIN) {
1761  00b5 2634          	jrne	L365
1762                     ; 474 				uiInfo.valve_rc[0] = (buf[1] & 0x70) >> 4;
1764  00b7 8dd801d8      	callf	LC008
1765  00bb c7001d        	ld	_uiInfo+29,a
1766                     ; 475 				uiInfo.valve_rc[1] = buf[1] & 0x07;
1768  00be e601          	ld	a,(1,x)
1769  00c0 a407          	and	a,#7
1770  00c2 c7001e        	ld	_uiInfo+30,a
1771                     ; 476 				uiInfo.valve_rc[2] = (buf[2] & 0x70) >> 4;
1773  00c5 8dd201d2      	callf	LC007
1774  00c9 c7001f        	ld	_uiInfo+31,a
1775                     ; 477 				uiInfo.valve_rc[3] = buf[2] & 0x07;
1777  00cc e602          	ld	a,(2,x)
1778  00ce a407          	and	a,#7
1779  00d0 c70020        	ld	_uiInfo+32,a
1780                     ; 479 				uiInfo.valve_len[0] = buf[3];
1782  00d3 e603          	ld	a,(3,x)
1783  00d5 c70015        	ld	_uiInfo+21,a
1784                     ; 480 				uiInfo.valve_len[1] = buf[4];
1786  00d8 e604          	ld	a,(4,x)
1787  00da c70016        	ld	_uiInfo+22,a
1788                     ; 481 				uiInfo.valve_len[2] = buf[5];
1790  00dd e605          	ld	a,(5,x)
1791  00df c70017        	ld	_uiInfo+23,a
1792                     ; 482 				uiInfo.valve_len[3] = buf[6];
1794  00e2 e606          	ld	a,(6,x)
1795  00e4 c70018        	ld	_uiInfo+24,a
1797  00e7 accf01cf      	jra	L555
1798  00eb               L365:
1799                     ; 484 				uiInfo.valve_sub_rc[0] = (buf[1] & 0x70) >> 4;
1801  00eb 8dd801d8      	callf	LC008
1802  00ef c7002d        	ld	_uiInfo+45,a
1803                     ; 485 				uiInfo.valve_sub_rc[1] = buf[1] & 0x07;
1805  00f2 e601          	ld	a,(1,x)
1806  00f4 a407          	and	a,#7
1807  00f6 c7002e        	ld	_uiInfo+46,a
1808                     ; 486 				uiInfo.valve_sub_rc[2] = (buf[2] & 0x70) >> 4;
1810  00f9 8dd201d2      	callf	LC007
1811  00fd c7002f        	ld	_uiInfo+47,a
1812                     ; 487 				uiInfo.valve_sub_rc[3] = buf[2] & 0x07;
1814  0100 e602          	ld	a,(2,x)
1815  0102 a407          	and	a,#7
1816  0104 c70030        	ld	_uiInfo+48,a
1817                     ; 489 				uiInfo.valve_sub_len[0] = buf[3];
1819  0107 e603          	ld	a,(3,x)
1820  0109 c70025        	ld	_uiInfo+37,a
1821                     ; 490 				uiInfo.valve_sub_len[1] = buf[4];
1823  010c e604          	ld	a,(4,x)
1824  010e c70026        	ld	_uiInfo+38,a
1825                     ; 491 				uiInfo.valve_sub_len[2] = buf[5];
1827  0111 e605          	ld	a,(5,x)
1828  0113 c70027        	ld	_uiInfo+39,a
1829                     ; 492 				uiInfo.valve_sub_len[3] = buf[6];
1831  0116 e606          	ld	a,(6,x)
1832  0118 c70028        	ld	_uiInfo+40,a
1833                     ; 494 				for (i = 0 ; i < 4 ; i++) {
1835  011b 4f            	clr	a
1836  011c 6b01          	ld	(OFST+0,sp),a
1837  011e               L765:
1838                     ; 495 					if (uiInfo.valve_sub_rc[i] == 0 && uiInfo.valve_sub_len[i] != 0) {
1840  011e 5f            	clrw	x
1841  011f 97            	ld	xl,a
1842  0120 724d002d      	tnz	(_uiInfo+45,x)
1843  0124 260f          	jrne	L575
1845  0126 5f            	clrw	x
1846  0127 97            	ld	xl,a
1847  0128 724d0025      	tnz	(_uiInfo+37,x)
1848  012c 2707          	jreq	L575
1849                     ; 496 						uiInfo.valve_sub_rc[i] = 8;
1851  012e 5f            	clrw	x
1852  012f 97            	ld	xl,a
1853  0130 a608          	ld	a,#8
1854  0132 d7002d        	ld	(_uiInfo+45,x),a
1855  0135               L575:
1856                     ; 494 				for (i = 0 ; i < 4 ; i++) {
1858  0135 0c01          	inc	(OFST+0,sp)
1861  0137 7b01          	ld	a,(OFST+0,sp)
1862  0139 a104          	cp	a,#4
1863  013b 25e1          	jrult	L765
1864  013d accf01cf      	jra	L555
1865  0141               L325:
1866                     ; 501 		case 2:
1866                     ; 502 			mode = (buf[1] & 0x80) >> 7;
1868  0141 e601          	ld	a,(1,x)
1869  0143 49            	rlc	a
1870  0144 4f            	clr	a
1871  0145 49            	rlc	a
1872  0146 6b01          	ld	(OFST+0,sp),a
1873                     ; 503 			if (mode == CNT_MODE_MAIN) {
1875  0148 2632          	jrne	L775
1876                     ; 504 				uiInfo.valve_rc[4] = (buf[1] & 0x70) >> 4;
1878  014a 8dd801d8      	callf	LC008
1879  014e c70021        	ld	_uiInfo+33,a
1880                     ; 505 				uiInfo.valve_rc[5] = buf[1] & 0x07;
1882  0151 e601          	ld	a,(1,x)
1883  0153 a407          	and	a,#7
1884  0155 c70022        	ld	_uiInfo+34,a
1885                     ; 506 				uiInfo.valve_rc[6] = (buf[2] & 0x70) >> 4;
1887  0158 8dd201d2      	callf	LC007
1888  015c c70023        	ld	_uiInfo+35,a
1889                     ; 507 				uiInfo.valve_rc[7] = buf[2] & 0x07;
1891  015f e602          	ld	a,(2,x)
1892  0161 a407          	and	a,#7
1893  0163 c70024        	ld	_uiInfo+36,a
1894                     ; 509 				uiInfo.valve_len[4] = buf[3];
1896  0166 e603          	ld	a,(3,x)
1897  0168 c70019        	ld	_uiInfo+25,a
1898                     ; 510 				uiInfo.valve_len[5] = buf[4];
1900  016b e604          	ld	a,(4,x)
1901  016d c7001a        	ld	_uiInfo+26,a
1902                     ; 511 				uiInfo.valve_len[6] = buf[5];
1904  0170 e605          	ld	a,(5,x)
1905  0172 c7001b        	ld	_uiInfo+27,a
1906                     ; 512 				uiInfo.valve_len[7] = buf[6];
1908  0175 e606          	ld	a,(6,x)
1909  0177 c7001c        	ld	_uiInfo+28,a
1911  017a 2053          	jra	L555
1912  017c               L775:
1913                     ; 514 				uiInfo.valve_sub_rc[4] = (buf[1] & 0x70) >> 4;
1915  017c 8dd801d8      	callf	LC008
1916  0180 c70031        	ld	_uiInfo+49,a
1917                     ; 515 				uiInfo.valve_sub_rc[5] = buf[1] & 0x07;
1919  0183 e601          	ld	a,(1,x)
1920  0185 a407          	and	a,#7
1921  0187 c70032        	ld	_uiInfo+50,a
1922                     ; 516 				uiInfo.valve_sub_rc[6] = (buf[2] & 0x70) >> 4;
1924  018a 8dd201d2      	callf	LC007
1925  018e c70033        	ld	_uiInfo+51,a
1926                     ; 517 				uiInfo.valve_sub_rc[7] = buf[2] & 0x07;
1928  0191 e602          	ld	a,(2,x)
1929  0193 a407          	and	a,#7
1930  0195 c70034        	ld	_uiInfo+52,a
1931                     ; 519 				uiInfo.valve_sub_len[4] = buf[3];
1933  0198 e603          	ld	a,(3,x)
1934  019a c70029        	ld	_uiInfo+41,a
1935                     ; 520 				uiInfo.valve_sub_len[5] = buf[4];
1937  019d e604          	ld	a,(4,x)
1938  019f c7002a        	ld	_uiInfo+42,a
1939                     ; 521 				uiInfo.valve_sub_len[6] = buf[5];
1941  01a2 e605          	ld	a,(5,x)
1942  01a4 c7002b        	ld	_uiInfo+43,a
1943                     ; 522 				uiInfo.valve_sub_len[7] = buf[6];
1945  01a7 e606          	ld	a,(6,x)
1946  01a9 c7002c        	ld	_uiInfo+44,a
1947                     ; 524 				for (i = 4 ; i < 8 ; i++) {
1949  01ac a604          	ld	a,#4
1950  01ae 6b01          	ld	(OFST+0,sp),a
1951  01b0               L306:
1952                     ; 525 					if (uiInfo.valve_sub_rc[i] == 0 && uiInfo.valve_sub_len[i] != 0) {
1954  01b0 5f            	clrw	x
1955  01b1 97            	ld	xl,a
1956  01b2 724d002d      	tnz	(_uiInfo+45,x)
1957  01b6 260f          	jrne	L116
1959  01b8 5f            	clrw	x
1960  01b9 97            	ld	xl,a
1961  01ba 724d0025      	tnz	(_uiInfo+37,x)
1962  01be 2707          	jreq	L116
1963                     ; 526 						uiInfo.valve_sub_rc[i] = 8;
1965  01c0 5f            	clrw	x
1966  01c1 97            	ld	xl,a
1967  01c2 a608          	ld	a,#8
1968  01c4 d7002d        	ld	(_uiInfo+45,x),a
1969  01c7               L116:
1970                     ; 524 				for (i = 4 ; i < 8 ; i++) {
1972  01c7 0c01          	inc	(OFST+0,sp)
1975  01c9 7b01          	ld	a,(OFST+0,sp)
1976  01cb a108          	cp	a,#8
1977  01cd 25e1          	jrult	L306
1978  01cf               L555:
1979                     ; 532 }
1982  01cf 5b03          	addw	sp,#3
1983  01d1 87            	retf	
1984  01d2               LC007:
1985  01d2 e602          	ld	a,(2,x)
1986  01d4 4e            	swap	a
1987  01d5 a407          	and	a,#7
1988  01d7 87            	retf	
1989  01d8               LC008:
1990  01d8 e601          	ld	a,(1,x)
1991  01da 4e            	swap	a
1992  01db a407          	and	a,#7
1993  01dd 87            	retf	
2041                     ; 534 void rc_ptc_check(uint8_t *buf) {
2042                     .text:	section	.text,new
2043  0000               f_rc_ptc_check:
2045  0000 89            	pushw	x
2046  0001 88            	push	a
2047       00000001      OFST:	set	1
2050                     ; 536 	start = buf[0] & 0xF0;
2052  0002 f6            	ld	a,(x)
2053  0003 a4f0          	and	a,#240
2054  0005 6b01          	ld	(OFST+0,sp),a
2055                     ; 538 	switch(start) {
2058                     ; 558 			break;
2059  0007 a020          	sub	a,#32
2060  0009 273d          	jreq	L326
2061  000b a010          	sub	a,#16
2062  000d 2721          	jreq	L516
2063  000f a030          	sub	a,#48
2064  0011 272d          	jreq	L126
2065  0013 a010          	sub	a,#16
2066  0015 2711          	jreq	L316
2067  0017 a080          	sub	a,#128
2068  0019 271d          	jreq	L716
2069                     ; 554 		default:
2069                     ; 555 			state_check = RC_STATE_ERROR;
2071  001b 3504000b      	mov	_state_check,#4
2072                     ; 556 			disp_char(buf[0]);
2074  001f 1e02          	ldw	x,(OFST+1,sp)
2075  0021 f6            	ld	a,(x)
2076  0022 8d000000      	callf	f_disp_char
2078                     ; 558 			break;
2080  0026 2026          	jra	L156
2081  0028               L316:
2082                     ; 539 		case BYTE_START_CNT_NORMAL:
2082                     ; 540 			rc_ptc_check_normal(buf);
2084  0028 1e02          	ldw	x,(OFST+1,sp)
2085  002a 8d000000      	callf	f_rc_ptc_check_normal
2087                     ; 541 			break;
2089  002e 201e          	jra	L156
2090  0030               L516:
2091                     ; 542 		case BYTE_START_CNT_SETTING:
2091                     ; 543 			rc_ptc_check_setting(buf);
2093  0030 1e02          	ldw	x,(OFST+1,sp)
2094  0032 8d000000      	callf	f_rc_ptc_check_setting
2096                     ; 544 			break;
2098  0036 2016          	jra	L156
2099  0038               L716:
2100                     ; 545 		case BYTE_START_RC_NORMAL:
2100                     ; 546 			rc_ptc_check_rc(buf);
2102  0038 1e02          	ldw	x,(OFST+1,sp)
2103  003a 8d000000      	callf	f_rc_ptc_check_rc
2105                     ; 547 			break;
2107  003e 200e          	jra	L156
2108  0040               L126:
2109                     ; 548 		case BYTE_START_RC_SUBRC:
2109                     ; 549 			rc_ptc_check_subrc(buf);
2111  0040 1e02          	ldw	x,(OFST+1,sp)
2112  0042 8d000000      	callf	f_rc_ptc_check_subrc
2114                     ; 550 			break;
2116  0046 2006          	jra	L156
2117  0048               L326:
2118                     ; 551 		case BYTE_START_CNT_MIRROR:
2118                     ; 552 			rc_ptc_check_mirror(buf);
2120  0048 1e02          	ldw	x,(OFST+1,sp)
2121  004a 8d000000      	callf	f_rc_ptc_check_mirror
2123                     ; 553 			break;
2125  004e               L156:
2126                     ; 560 }
2129  004e 5b03          	addw	sp,#3
2130  0050 87            	retf	
2162                     ; 562 void setSettingChange(uint8_t ch) {
2163                     .text:	section	.text,new
2164  0000               f_setSettingChange:
2168                     ; 563 	set_changed = ch;
2170  0000 c7000e        	ld	_set_changed,a
2171                     ; 564 }
2174  0003 87            	retf	
2197                     ; 566 uint8_t getSettingChange(void) {
2198                     .text:	section	.text,new
2199  0000               f_getSettingChange:
2203                     ; 567 	return set_changed;
2205  0000 c6000e        	ld	a,_set_changed
2208  0003 87            	retf	
2231                     ; 570 uint8_t getState_check(void) {
2232                     .text:	section	.text,new
2233  0000               f_getState_check:
2237                     ; 571 	return state_check;
2239  0000 c6000b        	ld	a,_state_check
2242  0003 87            	retf	
2274                     ; 574 void setState_check(uint8_t st) {
2275                     .text:	section	.text,new
2276  0000               f_setState_check:
2280                     ; 575 	state_check = st;
2282  0000 c7000b        	ld	_state_check,a
2283                     ; 576 }
2286  0003 87            	retf	
2334                     ; 578 void makeChecksum(uint8_t *buf) {
2335                     .text:	section	.text,new
2336  0000               f_makeChecksum:
2338  0000 89            	pushw	x
2339  0001 89            	pushw	x
2340       00000002      OFST:	set	2
2343                     ; 583 	s = 0;
2345  0002 0f01          	clr	(OFST-1,sp)
2346                     ; 584 	for (i = 0 ; i < 7 ; i++) {
2348  0004 0f02          	clr	(OFST+0,sp)
2349  0006               L547:
2350                     ; 585 		s += buf[i];
2352  0006 7b03          	ld	a,(OFST+1,sp)
2353  0008 97            	ld	xl,a
2354  0009 7b04          	ld	a,(OFST+2,sp)
2355  000b 1b02          	add	a,(OFST+0,sp)
2356  000d 2401          	jrnc	L451
2357  000f 5c            	incw	x
2358  0010               L451:
2359  0010 02            	rlwa	x,a
2360  0011 7b01          	ld	a,(OFST-1,sp)
2361  0013 fb            	add	a,(x)
2362  0014 6b01          	ld	(OFST-1,sp),a
2363                     ; 584 	for (i = 0 ; i < 7 ; i++) {
2365  0016 0c02          	inc	(OFST+0,sp)
2368  0018 7b02          	ld	a,(OFST+0,sp)
2369  001a a107          	cp	a,#7
2370  001c 25e8          	jrult	L547
2371                     ; 587 	buf[7] = s;
2373  001e 1e03          	ldw	x,(OFST+1,sp)
2374  0020 7b01          	ld	a,(OFST-1,sp)
2375  0022 e707          	ld	(7,x),a
2376                     ; 593 }
2379  0024 5b04          	addw	sp,#4
2380  0026 87            	retf	
2433                     ; 595 void rc_ptc_make_baseSetting(uint8_t *buf, uint8_t page, uint8_t mode) {
2434                     .text:	section	.text,new
2435  0000               f_rc_ptc_make_baseSetting:
2437  0000 89            	pushw	x
2438  0001 5203          	subw	sp,#3
2439       00000003      OFST:	set	3
2442                     ; 596 	switch (page) {
2444  0003 7b09          	ld	a,(OFST+6,sp)
2446                     ; 687 		break;
2447  0005 2712          	jreq	L357
2448  0007 4a            	dec	a
2449  0008 2604acb800b8  	jreq	L557
2450  000e 4a            	dec	a
2451  000f 2604ac680168  	jreq	L757
2452  0015 ac140214      	jra	L5001
2453  0019               L357:
2454                     ; 597 		case 0:
2454                     ; 598 			if (mode == CNT_MODE_MAIN) {
2456  0019 7b0a          	ld	a,(OFST+7,sp)
2457  001b 2627          	jrne	L7001
2458                     ; 599 				buf[1] = (_boiler_type << 7)
2458                     ; 600 									| ((uiInfo.plc & 0x07) << 4)
2458                     ; 601 									| (uiInfo.lpmType);
2460  001d c60064        	ld	a,_uiInfo+100
2461  0020 a407          	and	a,#7
2462  0022 8d1d021d      	callf	LC012
2463  0026 6b03          	ld	(OFST+0,sp),a
2464  0028 c60000        	ld	a,__boiler_type
2465  002b 8d170217      	callf	LC011
2466  002f 1a03          	or	a,(OFST+0,sp)
2467  0031 1e04          	ldw	x,(OFST+1,sp)
2468  0033 ca0013        	or	a,_uiInfo+19
2469  0036 e701          	ld	(1,x),a
2470                     ; 602 				buf[2] = ((uiInfo.relay & 0x01) << 7) 
2470                     ; 603 									| ((uiInfo.cnt & 0x07) << 4) 
2470                     ; 604 									| (uiInfo.valve & 0x0F);
2472  0038 c6000a        	ld	a,_uiInfo+10
2473  003b a40f          	and	a,#15
2474  003d 6b03          	ld	(OFST+0,sp),a
2475  003f c60005        	ld	a,_uiInfo+5
2476                     ; 605 				buf[3] = _boiler_water_shower;
2477                     ; 606 				buf[4] = uiInfo.houseCapa;
2478                     ; 607 				buf[5] = _boiler_water_heat;
2479                     ; 608 				buf[6] = 	(mode << 7) 
2479                     ; 609 									| (uiInfo.subRCLock << 6) 
2479                     ; 610 									| ((uiInfo.poType & 0x01) << 4) 
2479                     ; 611 									| ((uiInfo.cntlMode & 0x01) << 3) 
2479                     ; 612 									| uiInfo.opMode;
2481  0042 2018          	jpf	LC010
2482  0044               L7001:
2483                     ; 614 				buf[1] = (_boiler_type << 7) 
2483                     ; 615 									| (uiInfo.lpmType_sub);
2485  0044 c60000        	ld	a,__boiler_type
2486  0047 8d170217      	callf	LC011
2487  004b 1e04          	ldw	x,(OFST+1,sp)
2488  004d ca0014        	or	a,_uiInfo+20
2489  0050 e701          	ld	(1,x),a
2490                     ; 616 				buf[2] = ((uiInfo.relay & 0x01) << 7) 
2490                     ; 617 									| ((uiInfo.cnt_sub & 0x07) << 4) 
2490                     ; 618 									| (uiInfo.valve_sub & 0x0F);
2492  0052 c6000b        	ld	a,_uiInfo+11
2493  0055 a40f          	and	a,#15
2494  0057 6b03          	ld	(OFST+0,sp),a
2495  0059 c60006        	ld	a,_uiInfo+6
2496                     ; 619 				buf[3] = _boiler_water_shower;
2498                     ; 620 				buf[4] = uiInfo.houseCapa;
2500                     ; 621 				buf[5] = _boiler_water_heat;
2502                     ; 622 				buf[6] = 	(mode << 7) 
2502                     ; 623 									| (uiInfo.subRCLock << 6) 
2502                     ; 624 									| ((uiInfo.poType & 0x01) << 4) 
2502                     ; 625 									| ((uiInfo.cntlMode & 0x01) << 3) 
2502                     ; 626 									| uiInfo.opMode;
2504  005c               LC010:
2505  005c a407          	and	a,#7
2506  005e 8d1d021d      	callf	LC012
2507  0062 6b02          	ld	(OFST-1,sp),a
2508  0064 c6005e        	ld	a,_uiInfo+94
2509  0067 a401          	and	a,#1
2510  0069 8d170217      	callf	LC011
2511  006d 1a02          	or	a,(OFST-1,sp)
2512  006f 1e04          	ldw	x,(OFST+1,sp)
2513  0071 1a03          	or	a,(OFST+0,sp)
2514  0073 e702          	ld	(2,x),a
2516  0075 c60000        	ld	a,__boiler_water_shower
2517  0078 e703          	ld	(3,x),a
2519  007a c60010        	ld	a,_uiInfo+16
2520  007d e704          	ld	(4,x),a
2522  007f c60000        	ld	a,__boiler_water_heat
2523  0082 e705          	ld	(5,x),a
2525  0084 c60003        	ld	a,_uiInfo+3
2526  0087 a401          	and	a,#1
2527  0089 48            	sll	a
2528  008a 48            	sll	a
2529  008b 48            	sll	a
2530  008c 6b03          	ld	(OFST+0,sp),a
2531  008e c6000f        	ld	a,_uiInfo+15
2532  0091 a401          	and	a,#1
2533  0093 8d1d021d      	callf	LC012
2534  0097 6b02          	ld	(OFST-1,sp),a
2535  0099 c6005d        	ld	a,_uiInfo+93
2536  009c 97            	ld	xl,a
2537  009d a640          	ld	a,#64
2538  009f 42            	mul	x,a
2539  00a0 9f            	ld	a,xl
2540  00a1 6b01          	ld	(OFST-2,sp),a
2541  00a3 7b0a          	ld	a,(OFST+7,sp)
2542  00a5 8d170217      	callf	LC011
2543  00a9 1a01          	or	a,(OFST-2,sp)
2544  00ab 1a02          	or	a,(OFST-1,sp)
2545  00ad 1a03          	or	a,(OFST+0,sp)
2546  00af ca0007        	or	a,_uiInfo+7
2547  00b2 1e04          	ldw	x,(OFST+1,sp)
2548  00b4 ac120212      	jpf	LC009
2549  00b8               L557:
2550                     ; 629 		case 1:
2550                     ; 630 			if (mode == CNT_MODE_MAIN) {
2552  00b8 7b0a          	ld	a,(OFST+7,sp)
2553  00ba 2656          	jrne	L3101
2554                     ; 631 				buf[1] = mode << 7 
2554                     ; 632 							 | (uiInfo.valve_rc[0] << 4)
2554                     ; 633 							 | mode << 3 
2554                     ; 634 							 | uiInfo.valve_rc[1];
2556  00bc 48            	sll	a
2557  00bd 48            	sll	a
2558  00be 48            	sll	a
2559  00bf 6b03          	ld	(OFST+0,sp),a
2560  00c1 c6001d        	ld	a,_uiInfo+29
2561  00c4 8d1d021d      	callf	LC012
2562  00c8 6b02          	ld	(OFST-1,sp),a
2563  00ca 7b0a          	ld	a,(OFST+7,sp)
2564  00cc 8d170217      	callf	LC011
2565  00d0 1a02          	or	a,(OFST-1,sp)
2566  00d2 1a03          	or	a,(OFST+0,sp)
2567  00d4 1e04          	ldw	x,(OFST+1,sp)
2568  00d6 ca001e        	or	a,_uiInfo+30
2569  00d9 e701          	ld	(1,x),a
2570                     ; 635 				buf[2] = mode << 7 
2570                     ; 636 							 | (uiInfo.valve_rc[2] << 4)
2570                     ; 637 							 | mode << 3 
2570                     ; 638 							 | uiInfo.valve_rc[3];
2572  00db 7b0a          	ld	a,(OFST+7,sp)
2573  00dd 48            	sll	a
2574  00de 48            	sll	a
2575  00df 48            	sll	a
2576  00e0 6b03          	ld	(OFST+0,sp),a
2577  00e2 c6001f        	ld	a,_uiInfo+31
2578  00e5 8d1d021d      	callf	LC012
2579  00e9 6b02          	ld	(OFST-1,sp),a
2580  00eb 7b0a          	ld	a,(OFST+7,sp)
2581  00ed 8d170217      	callf	LC011
2582  00f1 1a02          	or	a,(OFST-1,sp)
2583  00f3 1a03          	or	a,(OFST+0,sp)
2584  00f5 1e04          	ldw	x,(OFST+1,sp)
2585  00f7 ca0020        	or	a,_uiInfo+32
2586  00fa e702          	ld	(2,x),a
2587                     ; 639 				buf[3] = uiInfo.valve_len[0];
2589  00fc c60015        	ld	a,_uiInfo+21
2590  00ff e703          	ld	(3,x),a
2591                     ; 640 				buf[4] = uiInfo.valve_len[1];
2593  0101 c60016        	ld	a,_uiInfo+22
2594  0104 e704          	ld	(4,x),a
2595                     ; 641 				buf[5] = uiInfo.valve_len[2];
2597  0106 c60017        	ld	a,_uiInfo+23
2598  0109 e705          	ld	(5,x),a
2599                     ; 642 				buf[6] = uiInfo.valve_len[3];
2601  010b c60018        	ld	a,_uiInfo+24
2603  010e ac120212      	jpf	LC009
2604  0112               L3101:
2605                     ; 644 				buf[1] = mode << 7 
2605                     ; 645 							 | (uiInfo.valve_sub_rc[0] << 4)
2605                     ; 646 							 | mode << 3 
2605                     ; 647 							 | uiInfo.valve_sub_rc[1];
2607  0112 48            	sll	a
2608  0113 48            	sll	a
2609  0114 48            	sll	a
2610  0115 6b03          	ld	(OFST+0,sp),a
2611  0117 c6002d        	ld	a,_uiInfo+45
2612  011a 8d1d021d      	callf	LC012
2613  011e 6b02          	ld	(OFST-1,sp),a
2614  0120 7b0a          	ld	a,(OFST+7,sp)
2615  0122 8d170217      	callf	LC011
2616  0126 1a02          	or	a,(OFST-1,sp)
2617  0128 1a03          	or	a,(OFST+0,sp)
2618  012a 1e04          	ldw	x,(OFST+1,sp)
2619  012c ca002e        	or	a,_uiInfo+46
2620  012f e701          	ld	(1,x),a
2621                     ; 648 				buf[2] = mode << 7 
2621                     ; 649 							 | (uiInfo.valve_sub_rc[2] << 4)
2621                     ; 650 							 | mode << 3 
2621                     ; 651 							 | uiInfo.valve_sub_rc[3];
2623  0131 7b0a          	ld	a,(OFST+7,sp)
2624  0133 48            	sll	a
2625  0134 48            	sll	a
2626  0135 48            	sll	a
2627  0136 6b03          	ld	(OFST+0,sp),a
2628  0138 c6002f        	ld	a,_uiInfo+47
2629  013b 8d1d021d      	callf	LC012
2630  013f 6b02          	ld	(OFST-1,sp),a
2631  0141 7b0a          	ld	a,(OFST+7,sp)
2632  0143 8d170217      	callf	LC011
2633  0147 1a02          	or	a,(OFST-1,sp)
2634  0149 1a03          	or	a,(OFST+0,sp)
2635  014b 1e04          	ldw	x,(OFST+1,sp)
2636  014d ca0030        	or	a,_uiInfo+48
2637  0150 e702          	ld	(2,x),a
2638                     ; 652 				buf[3] = uiInfo.valve_sub_len[0];
2640  0152 c60025        	ld	a,_uiInfo+37
2641  0155 e703          	ld	(3,x),a
2642                     ; 653 				buf[4] = uiInfo.valve_sub_len[1];
2644  0157 c60026        	ld	a,_uiInfo+38
2645  015a e704          	ld	(4,x),a
2646                     ; 654 				buf[5] = uiInfo.valve_sub_len[2];
2648  015c c60027        	ld	a,_uiInfo+39
2649  015f e705          	ld	(5,x),a
2650                     ; 655 				buf[6] = uiInfo.valve_sub_len[3];
2652  0161 c60028        	ld	a,_uiInfo+40
2653  0164 ac120212      	jpf	LC009
2654  0168               L757:
2655                     ; 658 		case 2:
2655                     ; 659 			if (mode == CNT_MODE_MAIN) {
2657  0168 7b0a          	ld	a,(OFST+7,sp)
2658  016a 2654          	jrne	L7101
2659                     ; 660 				buf[1] = mode << 7 
2659                     ; 661 							 | (uiInfo.valve_rc[4] << 4) 
2659                     ; 662 							 | mode << 3 
2659                     ; 663 							 | uiInfo.valve_rc[5];
2661  016c 48            	sll	a
2662  016d 48            	sll	a
2663  016e 48            	sll	a
2664  016f 6b03          	ld	(OFST+0,sp),a
2665  0171 c60021        	ld	a,_uiInfo+33
2666  0174 8d1d021d      	callf	LC012
2667  0178 6b02          	ld	(OFST-1,sp),a
2668  017a 7b0a          	ld	a,(OFST+7,sp)
2669  017c 8d170217      	callf	LC011
2670  0180 1a02          	or	a,(OFST-1,sp)
2671  0182 1a03          	or	a,(OFST+0,sp)
2672  0184 1e04          	ldw	x,(OFST+1,sp)
2673  0186 ca0022        	or	a,_uiInfo+34
2674  0189 e701          	ld	(1,x),a
2675                     ; 664 				buf[2] = mode << 7 
2675                     ; 665 							 | (uiInfo.valve_rc[6] << 4) 
2675                     ; 666 							 | mode << 3 
2675                     ; 667 							 | uiInfo.valve_rc[7];
2677  018b 7b0a          	ld	a,(OFST+7,sp)
2678  018d 48            	sll	a
2679  018e 48            	sll	a
2680  018f 48            	sll	a
2681  0190 6b03          	ld	(OFST+0,sp),a
2682  0192 c60023        	ld	a,_uiInfo+35
2683  0195 8d1d021d      	callf	LC012
2684  0199 6b02          	ld	(OFST-1,sp),a
2685  019b 7b0a          	ld	a,(OFST+7,sp)
2686  019d 8d170217      	callf	LC011
2687  01a1 1a02          	or	a,(OFST-1,sp)
2688  01a3 1a03          	or	a,(OFST+0,sp)
2689  01a5 1e04          	ldw	x,(OFST+1,sp)
2690  01a7 ca0024        	or	a,_uiInfo+36
2691  01aa e702          	ld	(2,x),a
2692                     ; 668 				buf[3] = uiInfo.valve_len[4];
2694  01ac c60019        	ld	a,_uiInfo+25
2695  01af e703          	ld	(3,x),a
2696                     ; 669 				buf[4] = uiInfo.valve_len[5];
2698  01b1 c6001a        	ld	a,_uiInfo+26
2699  01b4 e704          	ld	(4,x),a
2700                     ; 670 				buf[5] = uiInfo.valve_len[6];
2702  01b6 c6001b        	ld	a,_uiInfo+27
2703  01b9 e705          	ld	(5,x),a
2704                     ; 671 				buf[6] = uiInfo.valve_len[7];
2706  01bb c6001c        	ld	a,_uiInfo+28
2708  01be 2052          	jpf	LC009
2709  01c0               L7101:
2710                     ; 673 				buf[1] = mode << 7 
2710                     ; 674 							 | (uiInfo.valve_sub_rc[4] << 4) 
2710                     ; 675 							 | mode << 3 
2710                     ; 676 							 | uiInfo.valve_sub_rc[5];
2712  01c0 48            	sll	a
2713  01c1 48            	sll	a
2714  01c2 48            	sll	a
2715  01c3 6b03          	ld	(OFST+0,sp),a
2716  01c5 c60031        	ld	a,_uiInfo+49
2717  01c8 8d1d021d      	callf	LC012
2718  01cc 6b02          	ld	(OFST-1,sp),a
2719  01ce 7b0a          	ld	a,(OFST+7,sp)
2720  01d0 8d170217      	callf	LC011
2721  01d4 1a02          	or	a,(OFST-1,sp)
2722  01d6 1a03          	or	a,(OFST+0,sp)
2723  01d8 1e04          	ldw	x,(OFST+1,sp)
2724  01da ca0032        	or	a,_uiInfo+50
2725  01dd e701          	ld	(1,x),a
2726                     ; 677 				buf[2] = mode << 7 
2726                     ; 678 							 | (uiInfo.valve_sub_rc[6] << 4) 
2726                     ; 679 							 | mode << 3 
2726                     ; 680 							 | uiInfo.valve_sub_rc[7];
2728  01df 7b0a          	ld	a,(OFST+7,sp)
2729  01e1 48            	sll	a
2730  01e2 48            	sll	a
2731  01e3 48            	sll	a
2732  01e4 6b03          	ld	(OFST+0,sp),a
2733  01e6 c60033        	ld	a,_uiInfo+51
2734  01e9 8d1d021d      	callf	LC012
2735  01ed 6b02          	ld	(OFST-1,sp),a
2736  01ef 7b0a          	ld	a,(OFST+7,sp)
2737  01f1 8d170217      	callf	LC011
2738  01f5 1a02          	or	a,(OFST-1,sp)
2739  01f7 1a03          	or	a,(OFST+0,sp)
2740  01f9 1e04          	ldw	x,(OFST+1,sp)
2741  01fb ca0034        	or	a,_uiInfo+52
2742  01fe e702          	ld	(2,x),a
2743                     ; 681 				buf[3] = uiInfo.valve_sub_len[4];
2745  0200 c60029        	ld	a,_uiInfo+41
2746  0203 e703          	ld	(3,x),a
2747                     ; 682 				buf[4] = uiInfo.valve_sub_len[5];
2749  0205 c6002a        	ld	a,_uiInfo+42
2750  0208 e704          	ld	(4,x),a
2751                     ; 683 				buf[5] = uiInfo.valve_sub_len[6];
2753  020a c6002b        	ld	a,_uiInfo+43
2754  020d e705          	ld	(5,x),a
2755                     ; 684 				buf[6] = uiInfo.valve_sub_len[7];
2757  020f c6002c        	ld	a,_uiInfo+44
2758  0212               LC009:
2759  0212 e706          	ld	(6,x),a
2760  0214               L5001:
2761                     ; 689 }
2764  0214 5b05          	addw	sp,#5
2765  0216 87            	retf	
2766  0217               LC011:
2767  0217 97            	ld	xl,a
2768  0218 a680          	ld	a,#128
2769  021a 42            	mul	x,a
2770  021b 9f            	ld	a,xl
2771  021c 87            	retf	
2772  021d               LC012:
2773  021d 97            	ld	xl,a
2774  021e a610          	ld	a,#16
2775  0220 42            	mul	x,a
2776  0221 9f            	ld	a,xl
2777  0222 87            	retf	
2823                     ; 692 void rc_ptc_make_setting(uint8_t *buf) {
2824                     .text:	section	.text,new
2825  0000               f_rc_ptc_make_setting:
2827  0000 89            	pushw	x
2828  0001 88            	push	a
2829       00000001      OFST:	set	1
2832                     ; 694 	uint8_t mode = uiInfo.controlMode;
2834  0002 c60009        	ld	a,_uiInfo+9
2835  0005 6b01          	ld	(OFST+0,sp),a
2836                     ; 696 	buf[0] = BYTE_START_RC_SETTING | cur_set_page;
2838  0007 c60007        	ld	a,_cur_set_page
2839  000a 1e02          	ldw	x,(OFST+1,sp)
2840  000c aa50          	or	a,#80
2841  000e f7            	ld	(x),a
2842                     ; 698 	rc_ptc_make_baseSetting(buf, cur_set_page, mode);
2844  000f 7b01          	ld	a,(OFST+0,sp)
2845  0011 88            	push	a
2846  0012 3b0007        	push	_cur_set_page
2847  0015 1e04          	ldw	x,(OFST+3,sp)
2848  0017 8d000000      	callf	f_rc_ptc_make_baseSetting
2850  001b 85            	popw	x
2851                     ; 700 	makeChecksum(buf);
2853  001c 1e02          	ldw	x,(OFST+1,sp)
2854  001e 8d000000      	callf	f_makeChecksum
2856                     ; 701 }
2859  0022 5b03          	addw	sp,#3
2860  0024 87            	retf	
2862                     	switch	.data
2863  0005               _dr_out_count:
2864  0005 01            	dc.b	1
2911                     ; 707 void rc_ptc_make_normal(uint8_t *buf) {
2912                     .text:	section	.text,new
2913  0000               f_rc_ptc_make_normal:
2915  0000 89            	pushw	x
2916       00000000      OFST:	set	0
2919                     ; 709 	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
2921  0001 c60004        	ld	a,_uiInfo+4
2922  0004 1e01          	ldw	x,(OFST+1,sp)
2923  0006 aaf0          	or	a,#240
2924  0008 f7            	ld	(x),a
2925                     ; 710 	buf[1] = _disp_mode2;
2927  0009 c60000        	ld	a,__disp_mode2
2928  000c e701          	ld	(1,x),a
2929                     ; 711 	buf[2] = uiInfo.tCurr;
2931  000e c60002        	ld	a,_uiInfo+2
2932  0011 e702          	ld	(2,x),a
2933                     ; 712 	buf[3] = 0x00;
2935  0013 6f03          	clr	(3,x)
2936                     ; 713 	buf[4] = 0x00;
2938  0015 6f04          	clr	(4,x)
2939                     ; 714 	buf[5] = 0x00;
2941  0017 6f05          	clr	(5,x)
2942                     ; 715 	buf[6] = 0x00;
2944  0019 6f06          	clr	(6,x)
2945                     ; 717 	if (uiInfo.mode == SETTING_MODE_MASTER) {
2947  001b c60008        	ld	a,_uiInfo+8
2948  001e 4a            	dec	a
2949  001f 2619          	jrne	L5701
2950                     ; 718 		buf[4] = _boiler_water_heat;
2952  0021 c60000        	ld	a,__boiler_water_heat
2953  0024 e704          	ld	(4,x),a
2954                     ; 719 		buf[6] = __boiler_shower[5] == 1 ? 1 : 0; // 온수모드   
2956  0026 c60005        	ld	a,___boiler_shower+5
2957  0029 4a            	dec	a
2958  002a 2603          	jrne	L071
2959  002c 4c            	inc	a
2960  002d 2001          	jra	L271
2961  002f               L071:
2962  002f 4f            	clr	a
2963  0030               L271:
2964  0030 e706          	ld	(6,x),a
2965                     ; 720 		buf[6] |= (_boiler_water_shower << 1);					// 온수
2967  0032 c60000        	ld	a,__boiler_water_shower
2968  0035 48            	sll	a
2969  0036 ea06          	or	a,(6,x)
2970  0038 e706          	ld	(6,x),a
2971  003a               L5701:
2972                     ; 723 	switch(buf[1]) {
2974  003a e601          	ld	a,(1,x)
2976                     ; 760 		default:
2976                     ; 761 			break;
2977  003c 4a            	dec	a
2978  003d 270d          	jreq	L3401
2979  003f 4a            	dec	a
2980  0040 2711          	jreq	L5401
2981  0042 a006          	sub	a,#6
2982  0044 2720          	jreq	L3501
2983  0046 a008          	sub	a,#8
2984  0048 270e          	jreq	L1501
2985  004a 201f          	jra	L1011
2986  004c               L3401:
2987                     ; 724 		case RC_MODE_HEAT:
2987                     ; 725 			buf[3] = uiInfo.tSetup;
2989  004c c6000e        	ld	a,_uiInfo+14
2990  004f e703          	ld	(3,x),a
2991                     ; 726 			break;
2993  0051 2018          	jra	L1011
2994  0053               L5401:
2995                     ; 727 		case RC_MODE_OUT:
2995                     ; 728 			buf[5] = dr_mode_out;
2997  0053 c60002        	ld	a,_dr_mode_out
2998                     ; 746 			break;
3000  0056 2011          	jpf	LC013
3001                     ; 747 		case RC_MODE_STOP:
3001                     ; 748 			break;
3003  0058               L1501:
3004                     ; 749 		case RC_MODE_REPEAT:
3004                     ; 750 			if(_timFlag == 0) {
3006  0058 c60000        	ld	a,__timFlag
3007  005b 2604          	jrne	L3011
3008                     ; 751 				buf[3] = MAX_REPEAT_TEMP;
3010  005d a650          	ld	a,#80
3011  005f e703          	ld	(3,x),a
3012  0061               L3011:
3013                     ; 754 			buf[5] = uiInfo.repeat;
3015  0061 c6000c        	ld	a,_uiInfo+12
3016                     ; 756 			break;
3018  0064 2003          	jpf	LC013
3019  0066               L3501:
3020                     ; 757 		case RC_MODE_RESERVE:
3020                     ; 758 			buf[5] = uiInfo.reserve;
3022  0066 c6000d        	ld	a,_uiInfo+13
3023  0069               LC013:
3024  0069 e705          	ld	(5,x),a
3025                     ; 759 			break;
3027                     ; 760 		default:
3027                     ; 761 			break;
3029  006b               L1011:
3030                     ; 764 	makeChecksum(buf);
3032  006b 1e01          	ldw	x,(OFST+1,sp)
3033  006d 8d000000      	callf	f_makeChecksum
3035                     ; 766 	if (disp_mode_preview != _disp_mode2){
3037  0071 c60002        	ld	a,_disp_mode_preview
3038  0074 c10000        	cp	a,__disp_mode2
3039  0077 2712          	jreq	L5011
3040                     ; 767 		if (uiInfo.mode == SETTING_MODE_SUB) {
3042                     ; 769 				UPDATE_BIT(BIT_DISPMODE);
3045                     ; 770 				disp_mode_preview = _disp_mode2;
3048                     ; 773 			UPDATE_BIT(BIT_DISPMODE);
3054                     ; 774 			disp_mode_preview = _disp_mode2;
3058  0079 72160000      	bset	__updateBit,#3
3060  007d 5500000000    	mov	__updateTimer,___timer1s
3062  0082 35050000      	mov	__updateCount,#5
3064  0086 5500000002    	mov	_disp_mode_preview,__disp_mode2
3065  008b               L5011:
3066                     ; 778 	only_one++;
3068  008b 725c0003      	inc	_only_one
3069                     ; 779 }
3072  008f 85            	popw	x
3073  0090 87            	retf	
3124                     ; 782 uint8_t rc_ptc_check_subRC(void) {
3125                     .text:	section	.text,new
3126  0000               f_rc_ptc_check_subRC:
3128  0000 89            	pushw	x
3129       00000002      OFST:	set	2
3132                     ; 787 	if (_remote == 1) {
3134  0001 c60000        	ld	a,__remote
3135  0004 4a            	dec	a
3136  0005 2603          	jrne	L3411
3137                     ; 788 		return 0xFF;
3139  0007 4a            	dec	a
3142  0008 85            	popw	x
3143  0009 87            	retf	
3144  000a               L3411:
3145                     ; 791 	ch = 0;
3147  000a 0f01          	clr	(OFST-1,sp)
3148                     ; 792 	if (rcSubDataInfo.mode_heat[uiInfo.id - 1] != 0xFF) {
3150  000c 8d5f015f      	callf	LC016
3151  0010 d60027        	ld	a,(_rcSubDataInfo+16,x)
3152  0013 4c            	inc	a
3153  0014 2704          	jreq	L5411
3154                     ; 793 		ch = 1;
3156  0016 a601          	ld	a,#1
3157  0018 6b01          	ld	(OFST-1,sp),a
3158  001a               L5411:
3159                     ; 796 	rcSubDataInfo.mode_heat[uiInfo.id - 1] = _disp_mode2;
3161  001a c60004        	ld	a,_uiInfo+4
3162  001d 5f            	clrw	x
3163  001e 97            	ld	xl,a
3164  001f 5a            	decw	x
3165  0020 c60000        	ld	a,__disp_mode2
3166  0023 d70027        	ld	(_rcSubDataInfo+16,x),a
3167                     ; 797 	rcSubDataInfo.cur_temp[uiInfo.id - 1] = uiInfo.tCurr;
3169  0026 8d5f015f      	callf	LC016
3170  002a c60002        	ld	a,_uiInfo+2
3171  002d d70017        	ld	(_rcSubDataInfo,x),a
3172                     ; 798 	rcSubDataInfo.set_temp[uiInfo.id - 1] = uiInfo.tSetup;
3174  0030 8d5f015f      	callf	LC016
3175  0034 c6000e        	ld	a,_uiInfo+14
3176  0037 d7001f        	ld	(_rcSubDataInfo+8,x),a
3177                     ; 799 	rcSubDataInfo.time[uiInfo.id - 1] = uiInfo.reserve;
3179  003a 8d5f015f      	callf	LC016
3180  003e c6000d        	ld	a,_uiInfo+13
3181  0041 d70037        	ld	(_rcSubDataInfo+32,x),a
3182                     ; 800 	rcSubDataInfo.banb[uiInfo.id - 1] = uiInfo.repeat;
3184  0044 8d5f015f      	callf	LC016
3185  0048 c6000c        	ld	a,_uiInfo+12
3186  004b d7003f        	ld	(_rcSubDataInfo+40,x),a
3187                     ; 802 	uiInfo.remote_mode[uiInfo.id - 1] = _disp_mode2;
3189  004e 8d5f015f      	callf	LC016
3190  0052 c60000        	ld	a,__disp_mode2
3191  0055 d70045        	ld	(_uiInfo+69,x),a
3192                     ; 803 	uiInfo.tempCurr[uiInfo.id - 1] = uiInfo.tCurr;
3194  0058 8d5f015f      	callf	LC016
3195  005c c60002        	ld	a,_uiInfo+2
3196  005f d70035        	ld	(_uiInfo+53,x),a
3197                     ; 804 	uiInfo.tempSetup[uiInfo.id - 1] = uiInfo.tSetup;
3199  0062 8d5f015f      	callf	LC016
3200  0066 c6000e        	ld	a,_uiInfo+14
3201  0069 d7003d        	ld	(_uiInfo+61,x),a
3202                     ; 805 	uiInfo.remote_time[uiInfo.id - 1] = uiInfo.reserve;
3204  006c 8d5f015f      	callf	LC016
3205  0070 c6000d        	ld	a,_uiInfo+13
3206  0073 d7004d        	ld	(_uiInfo+77,x),a
3207                     ; 806 	uiInfo.remote_banb[uiInfo.id - 1] = uiInfo.repeat;
3209  0076 8d5f015f      	callf	LC016
3210  007a c6000c        	ld	a,_uiInfo+12
3211  007d d70055        	ld	(_uiInfo+85,x),a
3212                     ; 808 	if (ch == 0) {
3214  0080 7b01          	ld	a,(OFST-1,sp)
3215  0082 2603          	jrne	L7411
3216                     ; 810 		return 0xFF;
3218  0084 4a            	dec	a
3221  0085 85            	popw	x
3222  0086 87            	retf	
3223  0087               L7411:
3224                     ; 813 	num = 0xFF;
3226  0087 a6ff          	ld	a,#255
3227  0089 6b01          	ld	(OFST-1,sp),a
3228                     ; 814 	for (i = 0 ; i < 8 ; i++) {
3230  008b 4f            	clr	a
3231  008c 6b02          	ld	(OFST+0,sp),a
3232  008e               L1511:
3233                     ; 815 		if (rcSubDataInfo.set_temp[i] == 0xAA) {
3235  008e 5f            	clrw	x
3236  008f 97            	ld	xl,a
3237  0090 d6001f        	ld	a,(_rcSubDataInfo+8,x)
3238  0093 a1aa          	cp	a,#170
3239  0095 275a          	jreq	L3511
3240                     ; 816 			continue;
3242                     ; 819 		if (uiInfo.remote_mode[i] != rcSubDataInfo.mode_heat[i]) {
3244  0097 7b02          	ld	a,(OFST+0,sp)
3245  0099 8d660166      	callf	LC017
3246  009d 90d60045      	ld	a,(_uiInfo+69,y)
3247  00a1 d10027        	cp	a,(_rcSubDataInfo+16,x)
3248  00a4 2706          	jreq	L1611
3249                     ; 820 			num = i;
3251  00a6 7b02          	ld	a,(OFST+0,sp)
3252  00a8 6b01          	ld	(OFST-1,sp),a
3253                     ; 821 			break;
3255  00aa 204f          	jra	L5511
3256  00ac               L1611:
3257                     ; 824 		switch (rcSubDataInfo.mode_heat[i]) {
3259  00ac 7b02          	ld	a,(OFST+0,sp)
3260  00ae 5f            	clrw	x
3261  00af 97            	ld	xl,a
3262  00b0 d60027        	ld	a,(_rcSubDataInfo+16,x)
3264                     ; 842 				break;
3265  00b3 4a            	dec	a
3266  00b4 270a          	jreq	L3111
3267  00b6 a007          	sub	a,#7
3268  00b8 2724          	jreq	L1211
3269  00ba a008          	sub	a,#8
3270  00bc 2711          	jreq	L7111
3271  00be 2031          	jra	L3511
3272  00c0               L3111:
3273                     ; 825 			case RC_MODE_HEAT:
3273                     ; 826 				if (uiInfo.tempSetup[i] != rcSubDataInfo.set_temp[i]) {
3275  00c0 7b02          	ld	a,(OFST+0,sp)
3276  00c2 8d660166      	callf	LC017
3277  00c6 90d6003d      	ld	a,(_uiInfo+61,y)
3278  00ca d1001f        	cp	a,(_rcSubDataInfo+8,x)
3279                     ; 827 					num = i;
3280  00cd 201c          	jpf	LC015
3281                     ; 830 			case RC_MODE_OUT:
3281                     ; 831 			case RC_MODE_STOP:
3281                     ; 832 				break;
3283  00cf               L7111:
3284                     ; 833 			case RC_MODE_REPEAT:
3284                     ; 834 				if (uiInfo.remote_banb[i] != rcSubDataInfo.banb[i]) {
3286  00cf 7b02          	ld	a,(OFST+0,sp)
3287  00d1 8d660166      	callf	LC017
3288  00d5 90d60055      	ld	a,(_uiInfo+85,y)
3289  00d9 d1003f        	cp	a,(_rcSubDataInfo+40,x)
3290                     ; 835 					num = i;
3291  00dc 200d          	jpf	LC015
3292  00de               L1211:
3293                     ; 838 			case RC_MODE_RESERVE:
3293                     ; 839 				if (uiInfo.remote_time[i] != rcSubDataInfo.time[i]) {
3295  00de 7b02          	ld	a,(OFST+0,sp)
3296  00e0 8d660166      	callf	LC017
3297  00e4 90d6004d      	ld	a,(_uiInfo+77,y)
3298  00e8 d10037        	cp	a,(_rcSubDataInfo+32,x)
3299                     ; 840 					num = i;
3301  00eb               LC015:
3302  00eb 2704          	jreq	L3511
3305  00ed 7b02          	ld	a,(OFST+0,sp)
3306  00ef 6b01          	ld	(OFST-1,sp),a
3307  00f1               L3511:
3308                     ; 814 	for (i = 0 ; i < 8 ; i++) {
3310  00f1 0c02          	inc	(OFST+0,sp)
3313  00f3 7b02          	ld	a,(OFST+0,sp)
3314  00f5 a108          	cp	a,#8
3315  00f7 2595          	jrult	L1511
3316  00f9 7b01          	ld	a,(OFST-1,sp)
3317  00fb               L5511:
3318                     ; 846 	if (num == 0xFF) {
3320  00fb a1ff          	cp	a,#255
3321  00fd 260a          	jrne	L5711
3322                     ; 847 		ret_count = MAX_REPEAT_ERROR_COUNT;
3324  00ff 35050001      	mov	_ret_count,#5
3325                     ; 848 		cur_src = 0;
3327  0103 725f0000      	clr	_cur_src
3328                     ; 849 		return num;
3331  0107 2054          	jra	L002
3332  0109               L5711:
3333                     ; 852 	if (cur_src == num) {
3335  0109 c60000        	ld	a,_cur_src
3336  010c 1101          	cp	a,(OFST-1,sp)
3337  010e 2642          	jrne	L7711
3338                     ; 853 		ret_count--;
3340  0110 725a0001      	dec	_ret_count
3341                     ; 855 		if (ret_count == 0) {
3343  0114 2645          	jrne	L3021
3344                     ; 856 			rcSubDataInfo.mode_heat[num] = uiInfo.remote_mode[num];
3346  0116 7b01          	ld	a,(OFST-1,sp)
3347  0118 5f            	clrw	x
3348  0119 97            	ld	xl,a
3349  011a d60045        	ld	a,(_uiInfo+69,x)
3350  011d d70027        	ld	(_rcSubDataInfo+16,x),a
3351                     ; 857 			rcSubDataInfo.cur_temp[num] = uiInfo.tempCurr[num];
3353  0120 5f            	clrw	x
3354  0121 7b01          	ld	a,(OFST-1,sp)
3355  0123 97            	ld	xl,a
3356  0124 d60035        	ld	a,(_uiInfo+53,x)
3357  0127 d70017        	ld	(_rcSubDataInfo,x),a
3358                     ; 858 			rcSubDataInfo.set_temp[num] = uiInfo.tempSetup[num];
3360  012a 5f            	clrw	x
3361  012b 7b01          	ld	a,(OFST-1,sp)
3362  012d 97            	ld	xl,a
3363  012e d6003d        	ld	a,(_uiInfo+61,x)
3364  0131 d7001f        	ld	(_rcSubDataInfo+8,x),a
3365                     ; 859 			rcSubDataInfo.time[num] = uiInfo.remote_time[num];
3367  0134 5f            	clrw	x
3368  0135 7b01          	ld	a,(OFST-1,sp)
3369  0137 97            	ld	xl,a
3370  0138 d6004d        	ld	a,(_uiInfo+77,x)
3371  013b d70037        	ld	(_rcSubDataInfo+32,x),a
3372                     ; 860 			rcSubDataInfo.banb[num] = uiInfo.remote_banb[num];
3374  013e 5f            	clrw	x
3375  013f 7b01          	ld	a,(OFST-1,sp)
3376  0141 97            	ld	xl,a
3377  0142 d60055        	ld	a,(_uiInfo+85,x)
3378  0145 d7003f        	ld	(_rcSubDataInfo+40,x),a
3379                     ; 862 			ret_count = MAX_REPEAT_ERROR_COUNT;
3381  0148 35050001      	mov	_ret_count,#5
3382                     ; 863 			num = 0xFF;
3384  014c a6ff          	ld	a,#255
3385  014e 6b01          	ld	(OFST-1,sp),a
3386  0150 2009          	jra	L3021
3387  0152               L7711:
3388                     ; 866 		cur_src = num;
3390  0152 7b01          	ld	a,(OFST-1,sp)
3391  0154 c70000        	ld	_cur_src,a
3392                     ; 867 		ret_count = MAX_REPEAT_ERROR_COUNT;
3394  0157 35050001      	mov	_ret_count,#5
3395  015b               L3021:
3396                     ; 870 	return num;
3398  015b 7b01          	ld	a,(OFST-1,sp)
3400  015d               L002:
3402  015d 85            	popw	x
3403  015e 87            	retf	
3404  015f               LC016:
3405  015f 5f            	clrw	x
3406  0160 c60004        	ld	a,_uiInfo+4
3407  0163 97            	ld	xl,a
3408  0164 5a            	decw	x
3409  0165 87            	retf	
3410  0166               LC017:
3411  0166 5f            	clrw	x
3412  0167 97            	ld	xl,a
3413  0168 905f          	clrw	y
3414  016a 9097          	ld	yl,a
3415  016c 87            	retf	
3458                     ; 874 void rc_ptc_make_subRC(uint8_t *buf, uint8_t num) {
3459                     .text:	section	.text,new
3460  0000               f_rc_ptc_make_subRC:
3462  0000 89            	pushw	x
3463       00000000      OFST:	set	0
3466                     ; 875 	buf[0] = BYTE_START_RC_SUBRC | num + 1;
3468  0001 7b06          	ld	a,(OFST+6,sp)
3469  0003 4c            	inc	a
3470  0004 1e01          	ldw	x,(OFST+1,sp)
3471  0006 aa60          	or	a,#96
3472  0008 f7            	ld	(x),a
3473                     ; 876 	buf[1] = uiInfo.remote_mode[num];
3475  0009 5f            	clrw	x
3476  000a 7b06          	ld	a,(OFST+6,sp)
3477  000c 97            	ld	xl,a
3478  000d d60045        	ld	a,(_uiInfo+69,x)
3479  0010 1e01          	ldw	x,(OFST+1,sp)
3480                     ; 877 	buf[2] = 0x00;
3482  0012 6f02          	clr	(2,x)
3483  0014 e701          	ld	(1,x),a
3484                     ; 878 	if (uiInfo.remote_mode[num] == RC_MODE_HEAT) {
3486  0016 5f            	clrw	x
3487  0017 7b06          	ld	a,(OFST+6,sp)
3488  0019 97            	ld	xl,a
3489  001a d60045        	ld	a,(_uiInfo+69,x)
3490  001d 4a            	dec	a
3491  001e 260d          	jrne	L5221
3492                     ; 879 		buf[3] = uiInfo.tempSetup[num];
3494  0020 7b06          	ld	a,(OFST+6,sp)
3495  0022 5f            	clrw	x
3496  0023 97            	ld	xl,a
3497  0024 d6003d        	ld	a,(_uiInfo+61,x)
3498  0027 1e01          	ldw	x,(OFST+1,sp)
3499  0029 e703          	ld	(3,x),a
3501  002b 2004          	jra	L7221
3502  002d               L5221:
3503                     ; 881 		buf[3] = 0x00;
3505  002d 1e01          	ldw	x,(OFST+1,sp)
3506  002f 6f03          	clr	(3,x)
3507  0031               L7221:
3508                     ; 884 	buf[4] = 0x00;
3510  0031 6f04          	clr	(4,x)
3511                     ; 886 	if (uiInfo.remote_mode[num] == RC_MODE_REPEAT) {
3513  0033 5f            	clrw	x
3514  0034 7b06          	ld	a,(OFST+6,sp)
3515  0036 97            	ld	xl,a
3516  0037 d60045        	ld	a,(_uiInfo+69,x)
3517  003a a110          	cp	a,#16
3518  003c 2609          	jrne	L1321
3519                     ; 887 		buf[5] = uiInfo.remote_banb[num];
3521  003e 7b06          	ld	a,(OFST+6,sp)
3522  0040 5f            	clrw	x
3523  0041 97            	ld	xl,a
3524  0042 d60055        	ld	a,(_uiInfo+85,x)
3526  0045 2012          	jpf	LC018
3527  0047               L1321:
3528                     ; 888 	} else if(uiInfo.remote_mode[num] == RC_MODE_RESERVE){
3530  0047 7b06          	ld	a,(OFST+6,sp)
3531  0049 5f            	clrw	x
3532  004a 97            	ld	xl,a
3533  004b d60045        	ld	a,(_uiInfo+69,x)
3534  004e a108          	cp	a,#8
3535  0050 260d          	jrne	L5321
3536                     ; 889 		buf[5] = uiInfo.remote_time[num];
3538  0052 7b06          	ld	a,(OFST+6,sp)
3539  0054 5f            	clrw	x
3540  0055 97            	ld	xl,a
3541  0056 d6004d        	ld	a,(_uiInfo+77,x)
3542  0059               LC018:
3543  0059 1e01          	ldw	x,(OFST+1,sp)
3544  005b e705          	ld	(5,x),a
3546  005d 2004          	jra	L3321
3547  005f               L5321:
3548                     ; 891 		buf[5] = 0x00;
3550  005f 1e01          	ldw	x,(OFST+1,sp)
3551  0061 6f05          	clr	(5,x)
3552  0063               L3321:
3553                     ; 894 	buf[6] = 0x00;
3555  0063 6f06          	clr	(6,x)
3556                     ; 896 	makeChecksum(buf);
3558  0065 8d000000      	callf	f_makeChecksum
3560                     ; 897 }
3563  0069 85            	popw	x
3564  006a 87            	retf	
3602                     ; 899 void rc_ptc_make_error(uint8_t *buf) {
3603                     .text:	section	.text,new
3604  0000               f_rc_ptc_make_error:
3606  0000 89            	pushw	x
3607       00000000      OFST:	set	0
3610                     ; 900 	buf[0] = BYTE_START_RC_ERROR | uiInfo.id;
3612  0001 c60004        	ld	a,_uiInfo+4
3613  0004 1e01          	ldw	x,(OFST+1,sp)
3614  0006 aae0          	or	a,#224
3615  0008 f7            	ld	(x),a
3616                     ; 901 	buf[1] = error;
3618  0009 c6000a        	ld	a,_error
3619  000c e701          	ld	(1,x),a
3620                     ; 902 	buf[2] = mode_recover;
3622  000e c60011        	ld	a,_mode_recover
3623  0011 e702          	ld	(2,x),a
3624                     ; 903 	buf[3] = 0x00;
3626  0013 6f03          	clr	(3,x)
3627                     ; 904 	buf[4] = 0x00;
3629  0015 6f04          	clr	(4,x)
3630                     ; 905 	buf[5] = 0x00;
3632  0017 6f05          	clr	(5,x)
3633                     ; 906 	buf[6] = 0x00;
3635  0019 6f06          	clr	(6,x)
3636                     ; 908 	makeChecksum(buf);
3638  001b 8d000000      	callf	f_makeChecksum
3640                     ; 909 }
3643  001f 85            	popw	x
3644  0020 87            	retf	
3680                     ; 911 void rc_ptc_make_command(uint8_t *buf) {
3681                     .text:	section	.text,new
3682  0000               f_rc_ptc_make_command:
3684  0000 89            	pushw	x
3685       00000000      OFST:	set	0
3688                     ; 912 	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
3690  0001 c60004        	ld	a,_uiInfo+4
3691  0004 1e01          	ldw	x,(OFST+1,sp)
3692  0006 aaf0          	or	a,#240
3693  0008 f7            	ld	(x),a
3694                     ; 913 	buf[1] = 0x20;
3696  0009 a620          	ld	a,#32
3697  000b e701          	ld	(1,x),a
3698                     ; 914 	buf[2] = 0x00;
3700  000d 6f02          	clr	(2,x)
3701                     ; 915 	buf[3] = 0x00;
3703  000f 6f03          	clr	(3,x)
3704                     ; 916 	buf[4] = 0x00;
3706  0011 6f04          	clr	(4,x)
3707                     ; 917 	buf[5] = 0x00;
3709  0013 6f05          	clr	(5,x)
3710                     ; 918 	buf[6] = 0x00;
3712  0015 6f06          	clr	(6,x)
3713                     ; 919 }
3716  0017 85            	popw	x
3717  0018 87            	retf	
3768                     ; 929 void rc_ptc_make_command_packet(uint8_t *buf, uint8_t cmd, uint8_t p1)
3768                     ; 930 {
3769                     .text:	section	.text,new
3770  0000               f_rc_ptc_make_command_packet:
3772  0000 89            	pushw	x
3773       00000000      OFST:	set	0
3776                     ; 931 	rc_ptc_make_command(buf);
3778  0001 8d000000      	callf	f_rc_ptc_make_command
3780                     ; 932 	switch( cmd )
3782  0005 7b06          	ld	a,(OFST+6,sp)
3784                     ; 959 		break;
3785  0007 4a            	dec	a
3786  0008 270c          	jreq	L5721
3787  000a a003          	sub	a,#3
3788  000c 270d          	jreq	L7721
3789  000e 4a            	dec	a
3790  000f 2710          	jreq	L1031
3791  0011 4a            	dec	a
3792  0012 2713          	jreq	L3031
3793  0014 201b          	jra	L1331
3794  0016               L5721:
3795                     ; 934 	case PKT_CMD_MIRROR:
3795                     ; 935 		buf[2] = COMMAND_MODE_MIRROR;
3797  0016 1e01          	ldw	x,(OFST+1,sp)
3798  0018 4c            	inc	a
3799                     ; 936 		buf[3] = p1;
3800                     ; 937 		break;
3802  0019 2010          	jpf	LC019
3803  001b               L7721:
3804                     ; 948 	case PKT_CMD_FACTORY:
3804                     ; 949 		buf[2] = COMMAND_MODE_FACTORY;
3806  001b 1e01          	ldw	x,(OFST+1,sp)
3807  001d a608          	ld	a,#8
3808                     ; 950 		buf[3] = p1;
3809                     ; 951 		break;
3811  001f 200a          	jpf	LC019
3812  0021               L1031:
3813                     ; 952 	case PKT_CMD_RESET:
3813                     ; 953 		buf[2] = COMMAND_MODE_RESET;
3815  0021 1e01          	ldw	x,(OFST+1,sp)
3816  0023 a604          	ld	a,#4
3817                     ; 954 		buf[3] = p1;
3818                     ; 955 		break;
3820  0025 2004          	jpf	LC019
3821  0027               L3031:
3822                     ; 956 	case PKT_CMD_BOILER_HOT_MODE:
3822                     ; 957 		buf[2] = COMMAND_MODE_HOTWATER;
3824  0027 1e01          	ldw	x,(OFST+1,sp)
3825  0029 a602          	ld	a,#2
3826                     ; 958 		buf[3] = p1;
3828  002b               LC019:
3829  002b e702          	ld	(2,x),a
3833  002d 7b07          	ld	a,(OFST+7,sp)
3834  002f e703          	ld	(3,x),a
3835                     ; 959 		break;
3837  0031               L1331:
3838                     ; 962 	makeChecksum(buf);
3840  0031 1e01          	ldw	x,(OFST+1,sp)
3841  0033 8d000000      	callf	f_makeChecksum
3843                     ; 963 }
3846  0037 85            	popw	x
3847  0038 87            	retf	
3892                     ; 999 void rc_ptc_make_mirror(uint8_t *buf) {
3893                     .text:	section	.text,new
3894  0000               f_rc_ptc_make_mirror:
3896  0000 89            	pushw	x
3897  0001 88            	push	a
3898       00000001      OFST:	set	1
3901                     ; 1001 	buf[0] = BYTE_START_RC_MIRROR | cur_mirror_page;
3903  0002 c60006        	ld	a,_cur_mirror_page
3904  0005 1e02          	ldw	x,(OFST+1,sp)
3905  0007 aa40          	or	a,#64
3906  0009 f7            	ld	(x),a
3907                     ; 1003 	mode = mode_mirror == 1 ? CNT_MODE_MAIN : CNT_MODE_SUB;
3909  000a c60013        	ld	a,_mode_mirror
3910  000d 4a            	dec	a
3911  000e 2702          	jreq	L622
3912  0010 a601          	ld	a,#1
3913  0012               L622:
3914  0012 6b01          	ld	(OFST+0,sp),a
3915                     ; 1004 	rc_ptc_make_baseSetting(buf, cur_mirror_page, mode);
3917  0014 88            	push	a
3918  0015 3b0006        	push	_cur_mirror_page
3919  0018 1e04          	ldw	x,(OFST+3,sp)
3920  001a 8d000000      	callf	f_rc_ptc_make_baseSetting
3922  001e 85            	popw	x
3923                     ; 1006 	makeChecksum(buf);
3925  001f 1e02          	ldw	x,(OFST+1,sp)
3926  0021 8d000000      	callf	f_makeChecksum
3928                     ; 1008 	if (cur_mirror_page == 2) {
3930  0025 c60006        	ld	a,_cur_mirror_page
3931  0028 a102          	cp	a,#2
3932  002a 2608          	jrne	L3531
3933                     ; 1009 		cur_mirror_page = 0;
3935  002c 725f0006      	clr	_cur_mirror_page
3936                     ; 1010 		mode_mirror = 0;
3938  0030 725f0013      	clr	_mode_mirror
3939  0034               L3531:
3940                     ; 1012 }
3943  0034 5b03          	addw	sp,#3
3944  0036 87            	retf	
4001                     ; 1014 void rc_ptc_make(uint8_t *buf) {
4002                     .text:	section	.text,new
4003  0000               f_rc_ptc_make:
4005  0000 89            	pushw	x
4006  0001 88            	push	a
4007       00000001      OFST:	set	1
4010                     ; 1018 	if (error != 0 && error_type != 0) {
4012  0002 c6000a        	ld	a,_error
4013  0005 2705          	jreq	L1041
4015  0007 c60009        	ld	a,_error_type
4016                     ; 1019 		rc_ptc_make_error(buf);
4018                     ; 1020 		return;
4020  000a 2608          	jrne	LC020
4021  000c               L1041:
4022                     ; 1022 		if (mode_recover == 1) {
4024  000c c60011        	ld	a,_mode_recover
4025  000f 4a            	dec	a
4026  0010 2609          	jrne	L3041
4027                     ; 1023 			rc_ptc_make_error(buf);
4029  0012 1e02          	ldw	x,(OFST+1,sp)
4030  0014               LC020:
4032  0014 8d000000      	callf	f_rc_ptc_make_error
4034                     ; 1024 			return;
4035  0018               L072:
4038  0018 5b03          	addw	sp,#3
4039  001a 87            	retf	
4040  001b               L3041:
4041                     ; 1028 	switch (uiInfo.mode) {
4043  001b c60008        	ld	a,_uiInfo+8
4045                     ; 1076 			break;
4046  001e 2771          	jreq	LC021
4047  0020 4a            	dec	a
4048  0021 26f5          	jrne	L072
4049                     ; 1029 		case SETTING_MODE_MASTER:
4049                     ; 1030 			
4049                     ; 1031 			if (getSettingChange() == 1) {
4051  0023 8d000000      	callf	f_getSettingChange
4053  0027 4a            	dec	a
4054  0028 2608          	jrne	L3141
4055                     ; 1032 				rc_ptc_make_setting(buf);
4057  002a 1e02          	ldw	x,(OFST+1,sp)
4058  002c 8d000000      	callf	f_rc_ptc_make_setting
4060                     ; 1033 				return;
4062  0030 20e6          	jra	L072
4063  0032               L3141:
4064                     ; 1037 			if (mode_mirror != 0) {
4066  0032 c60013        	ld	a,_mode_mirror
4067  0035 270e          	jreq	L5141
4068                     ; 1038 				rc_ptc_make_command_packet(buf, PKT_CMD_MIRROR, mode_mirror);
4070  0037 3b0013        	push	_mode_mirror
4071  003a 4b01          	push	#1
4072  003c 1e04          	ldw	x,(OFST+3,sp)
4073  003e 8d000000      	callf	f_rc_ptc_make_command_packet
4075  0042 85            	popw	x
4076                     ; 1039 				return;
4078  0043 20d3          	jra	L072
4079  0045               L5141:
4080                     ; 1042 			if (mode_factory != 0) {
4082  0045 c60012        	ld	a,_mode_factory
4083  0048 2712          	jreq	L7141
4084                     ; 1044 				rc_ptc_make_command_packet(buf, PKT_CMD_FACTORY, mode_factory);
4086  004a 3b0012        	push	_mode_factory
4087  004d 4b04          	push	#4
4088  004f 1e04          	ldw	x,(OFST+3,sp)
4089  0051 8d000000      	callf	f_rc_ptc_make_command_packet
4091  0055 725f0012      	clr	_mode_factory
4092  0059 85            	popw	x
4093                     ; 1045 				mode_factory = 0;
4095                     ; 1046 				return;
4097  005a 20bc          	jra	L072
4098  005c               L7141:
4099                     ; 1049 			if (mode_hotwater != 0) {
4101  005c c60010        	ld	a,_mode_hotwater
4102  005f 270e          	jreq	L1241
4103                     ; 1051 				rc_ptc_make_command_packet(buf, PKT_CMD_BOILER_HOT_MODE, mode_hotwater);
4105  0061 3b0010        	push	_mode_hotwater
4106  0064 4b06          	push	#6
4107  0066 1e04          	ldw	x,(OFST+3,sp)
4108  0068 8d000000      	callf	f_rc_ptc_make_command_packet
4110  006c 85            	popw	x
4111                     ; 1052 				return;
4113  006d 20a9          	jra	L072
4114  006f               L1241:
4115                     ; 1055 			if (mode_reset != 0) {
4117  006f c6000f        	ld	a,_mode_reset
4118  0072 270e          	jreq	L3241
4119                     ; 1057 				rc_ptc_make_command_packet(buf, PKT_CMD_RESET, mode_reset);
4121  0074 3b000f        	push	_mode_reset
4122  0077 4b05          	push	#5
4123  0079 1e04          	ldw	x,(OFST+3,sp)
4124  007b 8d000000      	callf	f_rc_ptc_make_command_packet
4126  007f 85            	popw	x
4127                     ; 1058 				return;
4129  0080 2096          	jra	L072
4130  0082               L3241:
4131                     ; 1062 			num = rc_ptc_check_subRC();
4133  0082 8d000000      	callf	f_rc_ptc_check_subRC
4135  0086 6b01          	ld	(OFST+0,sp),a
4136                     ; 1063 			if ( num == 0xFF) {
4138  0088 4c            	inc	a
4139                     ; 1064 				rc_ptc_make_normal(buf);
4141                     ; 1065 				return;
4143  0089 2706          	jreq	LC021
4144                     ; 1068 			if (_remote == 1) {
4146  008b c60000        	ld	a,__remote
4147  008e 4a            	dec	a
4148  008f 260a          	jrne	L7241
4149                     ; 1069 				rc_ptc_make_normal(buf);
4151  0091               LC021:
4154  0091 1e02          	ldw	x,(OFST+1,sp)
4155  0093 8d000000      	callf	f_rc_ptc_make_normal
4158  0097 ac180018      	jra	L072
4159  009b               L7241:
4160                     ; 1071 				rc_ptc_make_subRC(buf, num);
4162  009b 7b01          	ld	a,(OFST+0,sp)
4163  009d 88            	push	a
4164  009e 1e03          	ldw	x,(OFST+2,sp)
4165  00a0 8d000000      	callf	f_rc_ptc_make_subRC
4167  00a4 84            	pop	a
4168  00a5 ac180018      	jra	L072
4169                     ; 1074 		case SETTING_MODE_SUB:
4169                     ; 1075 			rc_ptc_make_normal(buf);
4171                     ; 1076 			break;
4173                     ; 1078 }
4216                     ; 1081 void func_rc_command(uint8_t com1, uint8_t com2) {
4217                     .text:	section	.text,new
4218  0000               f_func_rc_command:
4220  0000 89            	pushw	x
4221       00000000      OFST:	set	0
4224                     ; 1082 	mode_mirror = 0;
4226  0001 725f0013      	clr	_mode_mirror
4227                     ; 1083 	mode_factory = 0;
4229  0005 725f0012      	clr	_mode_factory
4230                     ; 1084 	mode_hotwater = 0;
4232  0009 725f0010      	clr	_mode_hotwater
4233                     ; 1085 	mode_reset = 0;
4235  000d 725f000f      	clr	_mode_reset
4236                     ; 1087 	switch(com1) {
4238  0011 9e            	ld	a,xh
4240                     ; 1099 			break;
4241  0012 4a            	dec	a
4242  0013 270d          	jreq	L3341
4243  0015 4a            	dec	a
4244  0016 2711          	jreq	L5341
4245  0018 a002          	sub	a,#2
4246  001a 2714          	jreq	L7341
4247  001c a004          	sub	a,#4
4248  001e 2717          	jreq	L1441
4249  0020 201a          	jra	L3641
4250  0022               L3341:
4251                     ; 1088 		case COMMAND_MODE_MIRROR:
4251                     ; 1089 			mode_mirror = com2;
4253  0022 7b02          	ld	a,(OFST+2,sp)
4254  0024 c70013        	ld	_mode_mirror,a
4255                     ; 1090 			break;
4257  0027 2013          	jra	L3641
4258  0029               L5341:
4259                     ; 1091 		case COMMAND_MODE_HOTWATER:
4259                     ; 1092 			mode_hotwater = com2;
4261  0029 7b02          	ld	a,(OFST+2,sp)
4262  002b c70010        	ld	_mode_hotwater,a
4263                     ; 1093 			break;
4265  002e 200c          	jra	L3641
4266  0030               L7341:
4267                     ; 1094 		case COMMAND_MODE_RESET:
4267                     ; 1095 			mode_reset = com2;
4269  0030 7b02          	ld	a,(OFST+2,sp)
4270  0032 c7000f        	ld	_mode_reset,a
4271                     ; 1096 			break;
4273  0035 2005          	jra	L3641
4274  0037               L1441:
4275                     ; 1097 		case COMMAND_MODE_FACTORY:
4275                     ; 1098 			mode_factory = com2;
4277  0037 7b02          	ld	a,(OFST+2,sp)
4278  0039 c70012        	ld	_mode_factory,a
4279                     ; 1099 			break;
4281  003c               L3641:
4282                     ; 1101 }
4285  003c 85            	popw	x
4286  003d 87            	retf	
4318                     ; 1103 void func_rc_recover(uint8_t com) {
4319                     .text:	section	.text,new
4320  0000               f_func_rc_recover:
4324                     ; 1104 	mode_recover = com;
4326  0000 c70011        	ld	_mode_recover,a
4327                     ; 1105 }
4330  0003 87            	retf	
4353                     ; 1107 void func_rc_setting(void) {
4354                     .text:	section	.text,new
4355  0000               f_func_rc_setting:
4359                     ; 1108 	setSettingChange(1);
4361  0000 a601          	ld	a,#1
4363                     ; 1109 }
4366  0002 ac000000      	jpf	f_setSettingChange
4368                     	switch	.data
4369  0006               ___func_rc_settingCb:
4370  0006 00            	dc.b	0
4401                     ; 1113 void func_rc_settingCb(uint8_t ch) {
4402                     .text:	section	.text,new
4403  0000               f_func_rc_settingCb:
4407                     ; 1114 	__func_rc_settingCb = ch;
4409  0000 c70006        	ld	___func_rc_settingCb,a
4410                     ; 1115 }
4413  0003 87            	retf	
4728                     	xdef	___func_rc_settingCb
4729                     	xdef	f_rc_ptc_make_command_packet
4730                     	xdef	f_rc_ptc_make_command
4731                     	xdef	f_rc_ptc_make_error
4732                     	xdef	f_rc_ptc_check_subRC
4733                     	xdef	_dr_out_count
4734                     	xdef	f_rc_ptc_make_baseSetting
4735                     	xdef	f_makeChecksum
4736                     	xdef	f_rc_ptc_check_mirror
4737                     	xdef	f_rc_ptc_check_subrc
4738                     	xdef	f_rc_ptc_check_rc
4739                     	xdef	f_rc_ptc_check_setting
4740                     	xdef	f_rc_ptc_check_normal
4741                     	xdef	f_rc_ptc_check_homenet
4742                     	xdef	f_rc_ptc_check_master
4743                     	xdef	_only_one
4744                     	xdef	_dr_mode_out
4745                     	switch	.bss
4746  0000               _cur_src:
4747  0000 00            	ds.b	1
4748                     	xdef	_cur_src
4749  0001               _ret_count:
4750  0001 00            	ds.b	1
4751                     	xdef	_ret_count
4752  0002               _disp_mode_preview:
4753  0002 00            	ds.b	1
4754                     	xdef	_disp_mode_preview
4755  0003               __rcLED:
4756  0003 00            	ds.b	1
4757                     	xdef	__rcLED
4758  0004               _test_count:
4759  0004 00            	ds.b	1
4760                     	xdef	_test_count
4761  0005               _packet_changed:
4762  0005 00            	ds.b	1
4763                     	xdef	_packet_changed
4764  0006               _cur_mirror_page:
4765  0006 00            	ds.b	1
4766                     	xdef	_cur_mirror_page
4767  0007               _cur_set_page:
4768  0007 00            	ds.b	1
4769                     	xdef	_cur_set_page
4770  0008               __version:
4771  0008 00            	ds.b	1
4772                     	xdef	__version
4773  0009               _error_type:
4774  0009 00            	ds.b	1
4775                     	xdef	_error_type
4776  000a               _error:
4777  000a 00            	ds.b	1
4778                     	xdef	_error
4779                     	xdef	_debug_br
4780                     	xdef	_debug_hn
4781  000b               _state_check:
4782  000b 00            	ds.b	1
4783                     	xdef	_state_check
4784                     	xref	__backup_backlight
4785                     	xref	_packet_buf
4786                     	xref	__boiler_fire
4787                     	xref	__boiler_type
4788                     	xref	__timFlag
4789                     	xref	__remote
4790  000c               __rcInfo:
4791  000c 0000          	ds.b	2
4792                     	xdef	__rcInfo
4793                     	xref	__boiler_water_heat
4794                     	xref	__boiler_water_shower
4795                     	xref	___boiler_shower
4796                     	xref	__updateCount
4797                     	xref	__updateBit
4798                     	xref	__updateTimer
4799                     	xref	__disp_mode2
4800                     	xref	f_lcd_disp_rid
4801                     	xref	_uiInfo
4802                     	xdef	f_rcInfoSet
4803                     	xdef	f_get_rcInfo
4804                     	xdef	___rc_max
4805                     	xdef	f_func_rc_settingCb
4806                     	xdef	f_func_rc_setting
4807                     	xdef	f_func_rc_recover
4808                     	xdef	f_func_rc_command
4809                     	xdef	f_rc_ptc_make_mirror
4810                     	xdef	f_rc_ptc_make
4811                     	xdef	f_rc_ptc_make_subRC
4812                     	xdef	f_rc_ptc_make_setting
4813                     	xdef	f_rc_ptc_make_normal
4814                     	xdef	f_setState_check
4815                     	xdef	f_getState_check
4816                     	xdef	f_getSettingChange
4817                     	xdef	f_setSettingChange
4818                     	xdef	f_rc_ptc_check
4819                     	xdef	f_rc_ptc_baseSet
4820                     	xdef	f_getHexToBin
4821  000e               _set_changed:
4822  000e 00            	ds.b	1
4823                     	xdef	_set_changed
4824  000f               _mode_reset:
4825  000f 00            	ds.b	1
4826                     	xdef	_mode_reset
4827  0010               _mode_hotwater:
4828  0010 00            	ds.b	1
4829                     	xdef	_mode_hotwater
4830  0011               _mode_recover:
4831  0011 00            	ds.b	1
4832                     	xdef	_mode_recover
4833  0012               _mode_factory:
4834  0012 00            	ds.b	1
4835                     	xdef	_mode_factory
4836  0013               _mode_mirror:
4837  0013 00            	ds.b	1
4838                     	xdef	_mode_mirror
4839  0014               _boiler_info:
4840  0014 000000        	ds.b	3
4841                     	xdef	_boiler_info
4842  0017               _rcSubDataInfo:
4843  0017 000000000000  	ds.b	48
4844                     	xdef	_rcSubDataInfo
4845                     	xref	f_file_read
4846                     	xref	f_disp_char
4847                     	xref	___timer1s
4867                     	end
