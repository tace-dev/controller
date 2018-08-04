   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  75                     ; 9 _LPRCINFO	get_rcInfo(void)
  75                     ; 10 {
  77                     .text:	section	.text,new
  78  0000               _get_rcInfo:
  82                     ; 11 	return &_rcInfo;
  84  0000 ae000c        	ldw	x,#__rcInfo
  87  0003 81            	ret	
 139                     ; 14 void	rcInfoSet(uint8_t id, uint8_t temp)
 139                     ; 15 {
 140                     .text:	section	.text,new
 141  0000               _rcInfoSet:
 143  0000 89            	pushw	x
 144  0001 89            	pushw	x
 145       00000002      OFST:	set	2
 148                     ; 16 	_LPRCINFO	p = get_rcInfo();
 150  0002 cd0000        	call	_get_rcInfo
 152  0005 1f01          	ldw	(OFST-1,sp),x
 153                     ; 18 	p->out_temp = temp;
 155  0007 7b04          	ld	a,(OFST+2,sp)
 156  0009 e701          	ld	(1,x),a
 157                     ; 19 	p->type = id;
 159  000b 7b03          	ld	a,(OFST+1,sp)
 160  000d f7            	ld	(x),a
 161                     ; 20 }
 164  000e 5b04          	addw	sp,#4
 165  0010 81            	ret	
 168                     	switch	.data
 169  0000               _debug_hn:
 170  0000 00            	dc.b	0
 171  0001               _debug_br:
 172  0001 00            	dc.b	0
 173  0002               _dr_mode_out:
 174  0002 01            	dc.b	1
 175  0003               _only_one:
 176  0003 00            	dc.b	0
 220                     ; 85 uint8_t getHexToBin(uint8_t hex, uint8_t idx)
 220                     ; 86 {
 221                     .text:	section	.text,new
 222  0000               _getHexToBin:
 224  0000 89            	pushw	x
 225  0001 88            	push	a
 226       00000001      OFST:	set	1
 229                     ; 87 	uint8_t p = 0x80;
 231                     ; 88 	p = p >> (0x08 - (idx + 0x01));
 233  0002 9f            	ld	a,xl
 234  0003 a007          	sub	a,#7
 235  0005 40            	neg	a
 236  0006 5f            	clrw	x
 237  0007 97            	ld	xl,a
 238  0008 a680          	ld	a,#128
 239  000a 5d            	tnzw	x
 240  000b 2704          	jreq	L41
 241  000d               L61:
 242  000d 44            	srl	a
 243  000e 5a            	decw	x
 244  000f 26fc          	jrne	L61
 245  0011               L41:
 246  0011 6b01          	ld	(OFST+0,sp),a
 247                     ; 90 	if (hex & p)
 249  0013 7b02          	ld	a,(OFST+1,sp)
 250  0015 1501          	bcp	a,(OFST+0,sp)
 251  0017 2704          	jreq	L77
 252                     ; 92 		return 1;
 254  0019 a601          	ld	a,#1
 256  001b 2001          	jra	L02
 257  001d               L77:
 258                     ; 96 		return 0;
 260  001d 4f            	clr	a
 262  001e               L02:
 264  001e 5b03          	addw	sp,#3
 265  0020 81            	ret	
 300                     ; 100 void rc_ptc_baseSet(void) {
 301                     .text:	section	.text,new
 302  0000               _rc_ptc_baseSet:
 304  0000 88            	push	a
 305       00000001      OFST:	set	1
 308                     ; 102 	state_check = RC_STATE_NORMAL;
 310  0001 3501000b      	mov	_state_check,#1
 311                     ; 103 	set_changed = 0;
 313  0005 725f000e      	clr	_set_changed
 314                     ; 105 	for (i = 0 ; i < 8 ; i++) {
 316  0009 4f            	clr	a
 317  000a 6b01          	ld	(OFST+0,sp),a
 318  000c               L711:
 319                     ; 106 		rcSubDataInfo.mode_heat[i] = 0xAA;
 321  000c 5f            	clrw	x
 322  000d 97            	ld	xl,a
 323  000e a6aa          	ld	a,#170
 324  0010 d70027        	ld	(_rcSubDataInfo+16,x),a
 325                     ; 107 		rcSubDataInfo.cur_temp[i] = 0xAA;
 327  0013 5f            	clrw	x
 328  0014 7b01          	ld	a,(OFST+0,sp)
 329  0016 97            	ld	xl,a
 330  0017 a6aa          	ld	a,#170
 331  0019 d70017        	ld	(_rcSubDataInfo,x),a
 332                     ; 108 		rcSubDataInfo.set_temp[i] = 0xAA;
 334  001c 5f            	clrw	x
 335  001d 7b01          	ld	a,(OFST+0,sp)
 336  001f 97            	ld	xl,a
 337  0020 a6aa          	ld	a,#170
 338  0022 d7001f        	ld	(_rcSubDataInfo+8,x),a
 339                     ; 109 		rcSubDataInfo.time[i] = 0xAA;
 341  0025 5f            	clrw	x
 342  0026 7b01          	ld	a,(OFST+0,sp)
 343  0028 97            	ld	xl,a
 344  0029 a6aa          	ld	a,#170
 345  002b d70037        	ld	(_rcSubDataInfo+32,x),a
 346                     ; 110 		rcSubDataInfo.banb[i] = 0xAA;
 348  002e 5f            	clrw	x
 349  002f 7b01          	ld	a,(OFST+0,sp)
 350  0031 97            	ld	xl,a
 351  0032 a6aa          	ld	a,#170
 352  0034 d7003f        	ld	(_rcSubDataInfo+40,x),a
 353                     ; 105 	for (i = 0 ; i < 8 ; i++) {
 355  0037 0c01          	inc	(OFST+0,sp)
 358  0039 7b01          	ld	a,(OFST+0,sp)
 359  003b a108          	cp	a,#8
 360  003d 25cd          	jrult	L711
 361                     ; 112 }
 364  003f 84            	pop	a
 365  0040 81            	ret	
 405                     ; 114 void rc_ptc_check_master(uint8_t *buf) {
 406                     .text:	section	.text,new
 407  0000               _rc_ptc_check_master:
 409  0000 89            	pushw	x
 410       00000000      OFST:	set	0
 413                     ; 115 	if (buf[1] != 0x00) {
 415  0001 e601          	ld	a,(1,x)
 416  0003 260f          	jrne	L23
 417                     ; 116 		return;
 419                     ; 123 	if (getHexToBin(buf[6], 7) == 1) {  // H/N 패킷
 421  0005 1601          	ldw	y,(OFST+1,sp)
 422  0007 ae0007        	ldw	x,#7
 423  000a 90e606        	ld	a,(6,y)
 424  000d 95            	ld	xh,a
 425  000e cd0000        	call	_getHexToBin
 427  0011 4a            	dec	a
 428  0012 2602          	jrne	L541
 429                     ; 124 		return;
 430  0014               L23:
 433  0014 85            	popw	x
 434  0015 81            	ret	
 435  0016               L541:
 436                     ; 127 	boiler_info.state = buf[4] & 0x03;
 438  0016 1e01          	ldw	x,(OFST+1,sp)
 439  0018 e604          	ld	a,(4,x)
 440  001a a403          	and	a,#3
 441  001c c70014        	ld	_boiler_info,a
 442                     ; 128 	boiler_info.hotwater = buf[2];
 444  001f e602          	ld	a,(2,x)
 445  0021 c70015        	ld	_boiler_info+1,a
 446                     ; 129 	boiler_info.heatwater = buf[3];
 448  0024 e603          	ld	a,(3,x)
 449  0026 c70016        	ld	_boiler_info+2,a
 450                     ; 131 	uiInfo.cntlMode = getHexToBin(buf[4], 7);
 452  0029 1601          	ldw	y,(OFST+1,sp)
 453  002b ae0007        	ldw	x,#7
 454  002e 90e604        	ld	a,(4,y)
 455  0031 95            	ld	xh,a
 456  0032 cd0000        	call	_getHexToBin
 458  0035 c70003        	ld	_uiInfo+3,a
 459                     ; 133 	_boiler_fire = boiler_info.state;
 461  0038 5500140000    	mov	__boiler_fire,_boiler_info
 462                     ; 135 }
 464  003d 20d5          	jra	L23
 533                     ; 138 void rc_ptc_check_homenet(uint8_t *buf) {
 534                     .text:	section	.text,new
 535  0000               _rc_ptc_check_homenet:
 537  0000 89            	pushw	x
 538  0001 5203          	subw	sp,#3
 539       00000003      OFST:	set	3
 542                     ; 139 	_LPRCINFO	p = get_rcInfo();
 544  0003 cd0000        	call	_get_rcInfo
 546  0006 1f01          	ldw	(OFST-2,sp),x
 547                     ; 143 	if (getHexToBin(buf[6], 7) == 0) { // 일반 패킷
 549  0008 1604          	ldw	y,(OFST+1,sp)
 550  000a ae0007        	ldw	x,#7
 551  000d 90e606        	ld	a,(6,y)
 552  0010 95            	ld	xh,a
 553  0011 cd0000        	call	_getHexToBin
 555  0014 4d            	tnz	a
 556  0015 270d          	jreq	L24
 557                     ; 144 		return;
 559                     ; 147 	id = buf[1] & 0x0F;
 561  0017 1e04          	ldw	x,(OFST+1,sp)
 562  0019 e601          	ld	a,(1,x)
 563  001b a40f          	and	a,#15
 564  001d 6b03          	ld	(OFST+0,sp),a
 565                     ; 149 	if (id != uiInfo.id) {
 567  001f c10004        	cp	a,_uiInfo+4
 568  0022 2703          	jreq	L102
 569                     ; 150 		return;
 570  0024               L24:
 573  0024 5b05          	addw	sp,#5
 574  0026 81            	ret	
 575  0027               L102:
 576                     ; 153 	packet_changed = 1;
 578  0027 35010005      	mov	_packet_changed,#1
 579                     ; 155 	if (_remote == 0) {
 581  002b c60000        	ld	a,__remote
 582  002e 26f4          	jrne	L24
 583                     ; 156 		_disp_mode2 = buf[2];
 585  0030 e602          	ld	a,(2,x)
 586  0032 c70000        	ld	__disp_mode2,a
 587                     ; 158 		if (buf[2] == RC_MODE_HEAT) {
 589  0035 a101          	cp	a,#1
 590  0037 260b          	jrne	L502
 591                     ; 159 			if (buf[3] != 0xFF) {
 593  0039 e603          	ld	a,(3,x)
 594  003b a1ff          	cp	a,#255
 595  003d 27e5          	jreq	L24
 596                     ; 160 				uiInfo.tSetup = buf[3];
 598  003f c7000e        	ld	_uiInfo+14,a
 599  0042 20e0          	jra	L24
 600  0044               L502:
 601                     ; 162 		} else if (buf[2] == RC_MODE_OUT) {
 603  0044 a102          	cp	a,#2
 604  0046 26dc          	jrne	L24
 605                     ; 163 			out_mode = (buf[4] & 0xF0) >> 7;
 607  0048 e604          	ld	a,(4,x)
 608  004a 49            	rlc	a
 609  004b 4f            	clr	a
 610  004c 49            	rlc	a
 611  004d 6b03          	ld	(OFST+0,sp),a
 612                     ; 164 			uiInfo.tSetup = /*buf[3];//20*/p->out_temp;
 614  004f 1e01          	ldw	x,(OFST-2,sp)
 615  0051 e601          	ld	a,(1,x)
 616  0053 c7000e        	ld	_uiInfo+14,a
 617                     ; 165 			if (out_mode == 1) {
 619  0056 7b03          	ld	a,(OFST+0,sp)
 620  0058 4a            	dec	a
 621  0059 2606          	jrne	L512
 622                     ; 166 				dr_mode_out = 1;   // 개별외출
 624  005b 35010002      	mov	_dr_mode_out,#1
 626  005f 20c3          	jra	L24
 627  0061               L512:
 628                     ; 168 				dr_mode_out = 0;   // 전체 외출
 630  0061 725f0002      	clr	_dr_mode_out
 631                     ; 171 		else if( buf[2] == RC_MODE_STOP )
 633                     ; 173 			out_mode = 1;
 635                     ; 176 }
 637  0065 20bd          	jra	L24
 640                     	switch	.data
 641  0004               ___rc_max:
 642  0004 01            	dc.b	1
 702                     ; 181 void rc_ptc_check_normal(uint8_t *buf) {
 703                     .text:	section	.text,new
 704  0000               _rc_ptc_check_normal:
 706  0000 89            	pushw	x
 707  0001 88            	push	a
 708       00000001      OFST:	set	1
 711                     ; 182 	uint8_t start = buf[0] & 0x0F;
 713  0002 f6            	ld	a,(x)
 714  0003 a40f          	and	a,#15
 715  0005 6b01          	ld	(OFST+0,sp),a
 716                     ; 184 	if (start == 0x0F) {
 718  0007 a10f          	cp	a,#15
 719  0009 2606          	jrne	L542
 720                     ; 185 		state_check = RC_STATE_FACTORY;
 722  000b 3505000b      	mov	_state_check,#5
 723                     ; 186 		return;
 725  000f 203e          	jra	L67
 726  0011               L542:
 727                     ; 189 	if (start == 0x01 || start == 0x09) {
 729  0011 a101          	cp	a,#1
 730  0013 2704          	jreq	L152
 732  0015 a109          	cp	a,#9
 733  0017 2604          	jrne	L742
 734  0019               L152:
 735                     ; 190 		only_one = 0;
 737  0019 725f0003      	clr	_only_one
 738  001d               L742:
 739                     ; 193 	if( start <= 0x08 )
 741  001d a109          	cp	a,#9
 742  001f 2408          	jruge	L352
 743                     ; 195 		if( start > __rc_max )
 745  0021 c10004        	cp	a,___rc_max
 746  0024 2303          	jrule	L352
 747                     ; 196 			__rc_max = start;
 749  0026 c70004        	ld	___rc_max,a
 750  0029               L352:
 751                     ; 199 	if (start == uiInfo.id) {
 753  0029 c10004        	cp	a,_uiInfo+4
 754  002c 260d          	jrne	L752
 755                     ; 200 		packet_buf[start - 1] = 0;
 757  002e 5f            	clrw	x
 758  002f 97            	ld	xl,a
 759  0030 5a            	decw	x
 760                     ; 201 		state_check = RC_STATE_NORMAL;
 762  0031 3501000b      	mov	_state_check,#1
 763  0035 724f0000      	clr	(_packet_buf,x)
 765  0039 2004          	jra	L162
 766  003b               L752:
 767                     ; 203 		state_check = RC_STATE_NONE;
 769  003b 725f000b      	clr	_state_check
 770  003f               L162:
 771                     ; 206 	if (start == 0x09 ) {
 773  003f a109          	cp	a,#9
 774  0041 260f          	jrne	L362
 775                     ; 207 		debug_hn = buf[2];
 777  0043 1e02          	ldw	x,(OFST+1,sp)
 778  0045 e602          	ld	a,(2,x)
 779  0047 c70000        	ld	_debug_hn,a
 780                     ; 208 		debug_br = buf[1];
 782  004a e601          	ld	a,(1,x)
 783  004c c70001        	ld	_debug_br,a
 784                     ; 209 		return;
 785  004f               L67:
 788  004f 5b03          	addw	sp,#3
 789  0051 81            	ret	
 790  0052               L362:
 791                     ; 212 	if (uiInfo.mode == SETTING_MODE_MASTER) {
 793  0052 c60008        	ld	a,_uiInfo+8
 794  0055 4a            	dec	a
 795  0056 2605          	jrne	L562
 796                     ; 213 		rc_ptc_check_master(buf);
 798  0058 1e02          	ldw	x,(OFST+1,sp)
 799  005a cd0000        	call	_rc_ptc_check_master
 801  005d               L562:
 802                     ; 216 	if ( _remote == 0 && _backup_backlight == 0) {
 804  005d c60000        	ld	a,__remote
 805  0060 2662          	jrne	L762
 807  0062 c60000        	ld	a,__backup_backlight
 808  0065 265d          	jrne	L762
 809                     ; 217 		if (getHexToBin(buf[6], 7) == 0) {
 811  0067 1602          	ldw	y,(OFST+1,sp)
 812  0069 ae0007        	ldw	x,#7
 813  006c 90e606        	ld	a,(6,y)
 814  006f 95            	ld	xh,a
 815  0070 cd0000        	call	_getHexToBin
 817  0073 4d            	tnz	a
 818  0074 264e          	jrne	L762
 819                     ; 218 			_rcLED = buf[1];
 821  0076 1e02          	ldw	x,(OFST+1,sp)
 822  0078 e601          	ld	a,(1,x)
 823  007a c70003        	ld	__rcLED,a
 824                     ; 220 			if (getHexToBin(buf[1], uiInfo.id - 1) == 1) {
 826  007d c60004        	ld	a,_uiInfo+4
 827  0080 4a            	dec	a
 828  0081 1602          	ldw	y,(OFST+1,sp)
 829  0083 97            	ld	xl,a
 830  0084 90e601        	ld	a,(1,y)
 831  0087 95            	ld	xh,a
 832  0088 cd0000        	call	_getHexToBin
 834  008b 4a            	dec	a
 835  008c 261a          	jrne	L372
 836                     ; 225 				lcd_disp_rid(uiInfo.id, 1, (uiInfo.mode == SETTING_MODE_MASTER) ? 1 : 0);
 838  008e c60008        	ld	a,_uiInfo+8
 839  0091 4a            	dec	a
 840  0092 2603          	jrne	L65
 841  0094 4c            	inc	a
 842  0095 2001          	jra	L06
 843  0097               L65:
 844  0097 4f            	clr	a
 845  0098               L06:
 846  0098 88            	push	a
 847  0099 ae0001        	ldw	x,#1
 848  009c c60004        	ld	a,_uiInfo+4
 849  009f 95            	ld	xh,a
 850  00a0 cd0000        	call	_lcd_disp_rid
 852  00a3 ae0001        	ldw	x,#1
 853                     ; 229 				lcd_disp_rid_hw(uiInfo.id, 1);
 856  00a6 2014          	jp	LC002
 857  00a8               L372:
 858                     ; 236 				lcd_disp_rid(uiInfo.id, 0, (uiInfo.mode == SETTING_MODE_MASTER) ? 1 : 0);
 860  00a8 c60008        	ld	a,_uiInfo+8
 861  00ab 4a            	dec	a
 862  00ac 2603          	jrne	L66
 863  00ae 4c            	inc	a
 864  00af 2001          	jra	L07
 865  00b1               L66:
 866  00b1 4f            	clr	a
 867  00b2               L07:
 868  00b2 88            	push	a
 869  00b3 5f            	clrw	x
 870  00b4 c60004        	ld	a,_uiInfo+4
 871  00b7 95            	ld	xh,a
 872  00b8 cd0000        	call	_lcd_disp_rid
 874  00bb 5f            	clrw	x
 875                     ; 240 				lcd_disp_rid_hw(uiInfo.id, 0);
 877  00bc               LC002:
 878  00bc 84            	pop	a
 880  00bd c60004        	ld	a,_uiInfo+4
 881  00c0 95            	ld	xh,a
 882  00c1 cd0000        	call	_lcd_disp_rid_hw
 884  00c4               L762:
 885                     ; 246 	rc_ptc_check_homenet(buf);
 887  00c4 1e02          	ldw	x,(OFST+1,sp)
 888  00c6 cd0000        	call	_rc_ptc_check_homenet
 890                     ; 248 	_version = buf[6] >> 1;
 892  00c9 1e02          	ldw	x,(OFST+1,sp)
 893  00cb e606          	ld	a,(6,x)
 894  00cd 44            	srl	a
 895  00ce c70008        	ld	__version,a
 896                     ; 250 	if (mode_recover == 0) {
 898  00d1 c60011        	ld	a,_mode_recover
 899  00d4 2613          	jrne	L772
 900                     ; 251 		error_type = (buf[4] & 0x0F) >> 2;
 902  00d6 e604          	ld	a,(4,x)
 903  00d8 a40c          	and	a,#12
 904  00da 44            	srl	a
 905  00db 44            	srl	a
 906  00dc c70009        	ld	_error_type,a
 907                     ; 253 		if (error_type != 0) {
 909  00df 2702          	jreq	L103
 910                     ; 254 			error = buf[5];
 912  00e1 e605          	ld	a,(5,x)
 914  00e3               L103:
 915                     ; 256 			error = 0;
 917  00e3 c7000a        	ld	_error,a
 918  00e6 cc004f        	jra	L67
 919  00e9               L772:
 920                     ; 259 		if (((buf[4]& 0x0F) >> 2) == 0 && buf[5] == 0) {
 922  00e9 e604          	ld	a,(4,x)
 923  00eb a40c          	and	a,#12
 924  00ed 44            	srl	a
 925  00ee 44            	srl	a
 926  00ef 5f            	clrw	x
 927  00f0 97            	ld	xl,a
 928  00f1 5d            	tnzw	x
 929  00f2 26f2          	jrne	L67
 931  00f4 1e02          	ldw	x,(OFST+1,sp)
 932  00f6 e605          	ld	a,(5,x)
 933  00f8 26ec          	jrne	L67
 934                     ; 260 			error_type = 0;
 936  00fa c70009        	ld	_error_type,a
 937                     ; 261 			error = 0;
 939  00fd c7000a        	ld	_error,a
 940                     ; 262 			mode_recover = 0;
 942  0100 c70011        	ld	_mode_recover,a
 943                     ; 269 }
 945  0103 cc004f        	jra	L67
 993                     ; 272 void rc_ptc_check_setting(uint8_t *buf) {
 994                     .text:	section	.text,new
 995  0000               _rc_ptc_check_setting:
 997  0000 88            	push	a
 998       00000001      OFST:	set	1
1001                     ; 273 	uint8_t page = buf[0] & 0x0F;
1003  0001 f6            	ld	a,(x)
1004  0002 a40f          	and	a,#15
1005  0004 6b01          	ld	(OFST+0,sp),a
1006                     ; 275 	if (uiInfo.mode != SETTING_MODE_MASTER) {
1008  0006 c60008        	ld	a,_uiInfo+8
1009  0009 4a            	dec	a
1010  000a 2702          	jreq	L133
1011                     ; 276 		return;
1014  000c 84            	pop	a
1015  000d 81            	ret	
1016  000e               L133:
1017                     ; 279 	state_check = RC_STATE_SETTING;
1019  000e 3502000b      	mov	_state_check,#2
1020                     ; 281 	if (cur_set_page == page) {
1022  0012 c60007        	ld	a,_cur_set_page
1023  0015 1101          	cp	a,(OFST+0,sp)
1024  0017 2607          	jrne	L333
1025                     ; 282 		cur_set_page++;
1027  0019 725c0007      	inc	_cur_set_page
1028  001d c60007        	ld	a,_cur_set_page
1029  0020               L333:
1030                     ; 285 	if (cur_set_page == MAX_SETTING_PAGE) { 
1032  0020 a103          	cp	a,#3
1033  0022 2613          	jrne	L533
1034                     ; 286 		set_changed = 0;
1036  0024 725f000e      	clr	_set_changed
1037                     ; 287 		cur_set_page = 0;
1039  0028 725f0007      	clr	_cur_set_page
1040                     ; 289 		func_rc_settingCb(1);
1042  002c a601          	ld	a,#1
1043  002e cd0000        	call	_func_rc_settingCb
1045                     ; 290 		state_check = RC_STATE_NORMAL;
1047  0031 3501000b      	mov	_state_check,#1
1049  0035 2004          	jra	L733
1050  0037               L533:
1051                     ; 292 		func_rc_settingCb(0);
1053  0037 4f            	clr	a
1054  0038 cd0000        	call	_func_rc_settingCb
1056  003b               L733:
1057                     ; 294 }
1060  003b 84            	pop	a
1061  003c 81            	ret	
1119                     ; 297 void rc_ptc_check_rc(uint8_t *buf) {
1120                     .text:	section	.text,new
1121  0000               _rc_ptc_check_rc:
1123  0000 89            	pushw	x
1124  0001 89            	pushw	x
1125       00000002      OFST:	set	2
1128                     ; 301 	st = (buf[0] & 0x0F) - 1;
1130  0002 f6            	ld	a,(x)
1131  0003 a40f          	and	a,#15
1132  0005 4a            	dec	a
1133  0006 6b02          	ld	(OFST+0,sp),a
1134                     ; 303 	if (uiInfo.mode != SETTING_MODE_MASTER) {
1136  0008 c60008        	ld	a,_uiInfo+8
1137  000b 4a            	dec	a
1138  000c 273f          	jreq	L704
1139                     ; 304 		if (st == 0) {
1141  000e 7b02          	ld	a,(OFST+0,sp)
1142  0010 2703cc00b0    	jrne	L611
1143                     ; 305 			if (buf[1] == RC_MODE_OUT && (buf[5] & 0x01)  == 0) {
1145  0015 e601          	ld	a,(1,x)
1146  0017 a102          	cp	a,#2
1147  0019 260e          	jrne	L314
1149  001b e605          	ld	a,(5,x)
1150  001d a501          	bcp	a,#1
1151  001f 2608          	jrne	L314
1152                     ; 306 				_disp_mode2 = RC_MODE_OUT;
1154  0021 35020000      	mov	__disp_mode2,#2
1155                     ; 307 				dr_mode_out = 0;
1157  0025 725f0002      	clr	_dr_mode_out
1158  0029               L314:
1159                     ; 315 			if (dr_mode_out == 0) {
1161  0029 c60002        	ld	a,_dr_mode_out
1162  002c 26e4          	jrne	L611
1163                     ; 316 				if (_disp_mode2 == RC_MODE_OUT) {
1165  002e c60000        	ld	a,__disp_mode2
1166  0031 a102          	cp	a,#2
1167  0033 267b          	jrne	L611
1168                     ; 317 					if (buf[1] != RC_MODE_OUT) {
1170  0035 1e03          	ldw	x,(OFST+1,sp)
1171  0037 e601          	ld	a,(1,x)
1172  0039 a102          	cp	a,#2
1173  003b 2705          	jreq	L124
1174                     ; 318 						packet_changed = 1;
1176  003d cd016c        	call	LC006
1177                     ; 320 						_disp_mode2 = FW_GET_DISPMODE;
1178  0040 206e          	jra	L611
1179  0042               L124:
1180                     ; 322 						if((buf[5] & 0x01) != 0)  {
1182  0042 e605          	ld	a,(5,x)
1183  0044 a501          	bcp	a,#1
1184  0046 2768          	jreq	L611
1185                     ; 323 							packet_changed = 1;
1187  0048 cd016c        	call	LC006
1188                     ; 331 		return;
1190  004b 2063          	jra	L611
1191  004d               L704:
1192                     ; 334 	k = 0;
1194  004d 6b01          	ld	(OFST-1,sp),a
1195                     ; 336 	packet_buf[st] = 0;
1197  004f 5f            	clrw	x
1198  0050 7b02          	ld	a,(OFST+0,sp)
1199  0052 97            	ld	xl,a
1200  0053 724f0000      	clr	(_packet_buf,x)
1201                     ; 338 	if (_remote == 0) {
1203  0057 725d0000      	tnz	__remote
1204  005b 2703cc013b    	jrne	L724
1205                     ; 339 		if (rcSubDataInfo.mode_heat[st] == 0xFF) {
1207  0060 5f            	clrw	x
1208  0061 97            	ld	xl,a
1209  0062 d60027        	ld	a,(_rcSubDataInfo+16,x)
1210  0065 4c            	inc	a
1211  0066 264b          	jrne	L134
1212                     ; 340 			if (uiInfo.remote_mode[st] != buf[1]) {
1214  0068 7b02          	ld	a,(OFST+0,sp)
1215  006a 5f            	clrw	x
1216  006b 97            	ld	xl,a
1217  006c d60045        	ld	a,(_uiInfo+69,x)
1218  006f 1e03          	ldw	x,(OFST+1,sp)
1219  0071 e101          	cp	a,(1,x)
1220                     ; 341 				k = 1;
1222  0073 2632          	jrne	LC003
1223                     ; 344 				switch (buf[1]) {
1225  0075 e601          	ld	a,(1,x)
1227                     ; 363 						break;
1228  0077 4a            	dec	a
1229  0078 270a          	jreq	L143
1230  007a a007          	sub	a,#7
1231  007c 2713          	jreq	L743
1232  007e a008          	sub	a,#8
1233  0080 2718          	jreq	L153
1234  0082 2027          	jra	L534
1235  0084               L143:
1236                     ; 345 					case RC_MODE_HEAT:
1236                     ; 346 						if (uiInfo.tempSetup[st] != buf[3]) {
1238  0084 7b02          	ld	a,(OFST+0,sp)
1239  0086 5f            	clrw	x
1240  0087 97            	ld	xl,a
1241  0088 d6003d        	ld	a,(_uiInfo+61,x)
1242  008b 1e03          	ldw	x,(OFST+1,sp)
1243  008d e103          	cp	a,(3,x)
1244                     ; 347 							k = 1;
1245  008f 2014          	jp	LC004
1246                     ; 350 					case RC_MODE_OUT:
1246                     ; 351 						break;
1248                     ; 352 					case RC_MODE_STOP:
1248                     ; 353 						break;
1250  0091               L743:
1251                     ; 354 					case RC_MODE_RESERVE:
1251                     ; 355 						if (uiInfo.remote_time[st] != buf[5]) {
1253  0091 7b02          	ld	a,(OFST+0,sp)
1254  0093 5f            	clrw	x
1255  0094 97            	ld	xl,a
1256  0095 d6004d        	ld	a,(_uiInfo+77,x)
1257                     ; 356 							k = 1;
1258  0098 2007          	jp	LC005
1259  009a               L153:
1260                     ; 359 					case RC_MODE_REPEAT:
1260                     ; 360 						if (uiInfo.remote_banb[st] != buf[5]) {
1262  009a 7b02          	ld	a,(OFST+0,sp)
1263  009c 5f            	clrw	x
1264  009d 97            	ld	xl,a
1265  009e d60055        	ld	a,(_uiInfo+85,x)
1266  00a1               LC005:
1267  00a1 1e03          	ldw	x,(OFST+1,sp)
1268  00a3 e105          	cp	a,(5,x)
1269  00a5               LC004:
1270  00a5 2704          	jreq	L534
1271                     ; 361 							k = 1;
1273  00a7               LC003:
1277  00a7 a601          	ld	a,#1
1278  00a9 6b01          	ld	(OFST-1,sp),a
1279  00ab               L534:
1280                     ; 367 			if (k == 1) {
1282  00ab 7b01          	ld	a,(OFST-1,sp)
1283  00ad 4a            	dec	a
1284  00ae 2603          	jrne	L134
1285                     ; 368 				return;
1286  00b0               L611:
1289  00b0 5b04          	addw	sp,#4
1290  00b2 81            	ret	
1291  00b3               L134:
1292                     ; 372 		rcSubDataInfo.mode_heat[st] = buf[1];
1294  00b3 7b02          	ld	a,(OFST+0,sp)
1295  00b5 5f            	clrw	x
1296  00b6 1603          	ldw	y,(OFST+1,sp)
1297  00b8 97            	ld	xl,a
1298  00b9 90e601        	ld	a,(1,y)
1299  00bc d70027        	ld	(_rcSubDataInfo+16,x),a
1300                     ; 373 		rcSubDataInfo.cur_temp[st] = buf[2];
1302  00bf 5f            	clrw	x
1303  00c0 7b02          	ld	a,(OFST+0,sp)
1304  00c2 97            	ld	xl,a
1305  00c3 90e602        	ld	a,(2,y)
1306  00c6 d70017        	ld	(_rcSubDataInfo,x),a
1307                     ; 375 		uiInfo.remote_mode[st] = buf[1];
1309  00c9 5f            	clrw	x
1310  00ca 7b02          	ld	a,(OFST+0,sp)
1311  00cc 97            	ld	xl,a
1312  00cd 90e601        	ld	a,(1,y)
1313  00d0 d70045        	ld	(_uiInfo+69,x),a
1314                     ; 376 		uiInfo.tempCurr[st] = buf[2];
1316  00d3 5f            	clrw	x
1317  00d4 7b02          	ld	a,(OFST+0,sp)
1318  00d6 97            	ld	xl,a
1319  00d7 90e602        	ld	a,(2,y)
1320  00da d70035        	ld	(_uiInfo+53,x),a
1321                     ; 378 		switch (buf[1]) {
1323  00dd 1e03          	ldw	x,(OFST+1,sp)
1324  00df e601          	ld	a,(1,x)
1326                     ; 394 				break;
1327  00e1 4a            	dec	a
1328  00e2 270a          	jreq	L353
1329  00e4 a007          	sub	a,#7
1330  00e6 271c          	jreq	L163
1331  00e8 a008          	sub	a,#8
1332  00ea 272e          	jreq	L363
1333  00ec 2040          	jra	L554
1334  00ee               L353:
1335                     ; 379 			case RC_MODE_HEAT:
1335                     ; 380 				rcSubDataInfo.set_temp[st] = buf[3];
1337  00ee 7b02          	ld	a,(OFST+0,sp)
1338  00f0 5f            	clrw	x
1339  00f1 97            	ld	xl,a
1340  00f2 90e603        	ld	a,(3,y)
1341  00f5 d7001f        	ld	(_rcSubDataInfo+8,x),a
1342                     ; 381 				uiInfo.tempSetup[st] = buf[3];
1344  00f8 5f            	clrw	x
1345  00f9 7b02          	ld	a,(OFST+0,sp)
1346  00fb 97            	ld	xl,a
1347  00fc 90e603        	ld	a,(3,y)
1348  00ff d7003d        	ld	(_uiInfo+61,x),a
1349                     ; 382 				break;
1351  0102 202a          	jra	L554
1352                     ; 383 			case RC_MODE_OUT:
1352                     ; 384 				break;
1354                     ; 385 			case RC_MODE_STOP:
1354                     ; 386 				break;
1356  0104               L163:
1357                     ; 387 			case RC_MODE_RESERVE:
1357                     ; 388 				rcSubDataInfo.time[st] = buf[5];
1359  0104 7b02          	ld	a,(OFST+0,sp)
1360  0106 5f            	clrw	x
1361  0107 97            	ld	xl,a
1362  0108 90e605        	ld	a,(5,y)
1363  010b d70037        	ld	(_rcSubDataInfo+32,x),a
1364                     ; 389 				uiInfo.remote_time[st] = buf[5];
1366  010e 5f            	clrw	x
1367  010f 7b02          	ld	a,(OFST+0,sp)
1368  0111 97            	ld	xl,a
1369  0112 90e605        	ld	a,(5,y)
1370  0115 d7004d        	ld	(_uiInfo+77,x),a
1371                     ; 390 				break;
1373  0118 2014          	jra	L554
1374  011a               L363:
1375                     ; 391 			case RC_MODE_REPEAT:
1375                     ; 392 				rcSubDataInfo.banb[st] = buf[5];
1377  011a 7b02          	ld	a,(OFST+0,sp)
1378  011c 5f            	clrw	x
1379  011d 97            	ld	xl,a
1380  011e 90e605        	ld	a,(5,y)
1381  0121 d7003f        	ld	(_rcSubDataInfo+40,x),a
1382                     ; 393 				uiInfo.remote_banb[st] = buf[5];
1384  0124 5f            	clrw	x
1385  0125 7b02          	ld	a,(OFST+0,sp)
1386  0127 97            	ld	xl,a
1387  0128 90e605        	ld	a,(5,y)
1388  012b d70055        	ld	(_uiInfo+85,x),a
1389                     ; 394 				break;
1391  012e               L554:
1392                     ; 397 		disp_char(uiInfo.remote_mode[st]);
1394  012e 7b02          	ld	a,(OFST+0,sp)
1395  0130 5f            	clrw	x
1396  0131 97            	ld	xl,a
1397  0132 d60045        	ld	a,(_uiInfo+69,x)
1398  0135 cd0000        	call	_disp_char
1401  0138 cc00b0        	jra	L611
1402  013b               L724:
1403                     ; 401 		rcSubDataInfo.mode_heat[st] = 0xFF;
1405  013b 5f            	clrw	x
1406  013c 97            	ld	xl,a
1407  013d a6ff          	ld	a,#255
1408  013f d70027        	ld	(_rcSubDataInfo+16,x),a
1409                     ; 402 		rcSubDataInfo.cur_temp[st] = buf[2];
1411  0142 5f            	clrw	x
1412  0143 7b02          	ld	a,(OFST+0,sp)
1413  0145 1603          	ldw	y,(OFST+1,sp)
1414  0147 97            	ld	xl,a
1415  0148 90e602        	ld	a,(2,y)
1416  014b d70017        	ld	(_rcSubDataInfo,x),a
1417                     ; 403 		rcSubDataInfo.set_temp[st] = 0xFF;
1419  014e 5f            	clrw	x
1420  014f 7b02          	ld	a,(OFST+0,sp)
1421  0151 97            	ld	xl,a
1422  0152 a6ff          	ld	a,#255
1423  0154 d7001f        	ld	(_rcSubDataInfo+8,x),a
1424                     ; 404 		rcSubDataInfo.time[st] = 0xFF;
1426  0157 5f            	clrw	x
1427  0158 7b02          	ld	a,(OFST+0,sp)
1428  015a 97            	ld	xl,a
1429  015b a6ff          	ld	a,#255
1430  015d d70037        	ld	(_rcSubDataInfo+32,x),a
1431                     ; 405 		rcSubDataInfo.banb[st] = 0xFF;
1433  0160 5f            	clrw	x
1434  0161 7b02          	ld	a,(OFST+0,sp)
1435  0163 97            	ld	xl,a
1436  0164 a6ff          	ld	a,#255
1437  0166 d7003f        	ld	(_rcSubDataInfo+40,x),a
1438                     ; 407 }
1440  0169 cc00b0        	jra	L611
1441  016c               LC006:
1442  016c 35010005      	mov	_packet_changed,#1
1443                     ; 324 							dr_mode_out = 1;
1445  0170 35010002      	mov	_dr_mode_out,#1
1446                     ; 325 							_disp_mode2 = FW_GET_DISPMODE;
1448  0174 a629          	ld	a,#41
1449  0176 cd0000        	call	_file_read
1451  0179 c70000        	ld	__disp_mode2,a
1452  017c 81            	ret	
1498                     ; 410 void rc_ptc_check_subrc(uint8_t *buf) {
1499                     .text:	section	.text,new
1500  0000               _rc_ptc_check_subrc:
1502  0000 89            	pushw	x
1503  0001 88            	push	a
1504       00000001      OFST:	set	1
1507                     ; 411 	uint8_t start = buf[0] & 0x0F;
1509  0002 f6            	ld	a,(x)
1510  0003 a40f          	and	a,#15
1511  0005 6b01          	ld	(OFST+0,sp),a
1512                     ; 413 	state_check = RC_STATE_NONE;
1514  0007 725f000b      	clr	_state_check
1515                     ; 415 	if (uiInfo.mode == SETTING_MODE_MASTER) {
1517  000b c60008        	ld	a,_uiInfo+8
1518  000e 4a            	dec	a
1519  000f 2707          	jreq	L221
1520                     ; 416 		return;
1522                     ; 419 	if (start != uiInfo.id) {
1524  0011 7b01          	ld	a,(OFST+0,sp)
1525  0013 c10004        	cp	a,_uiInfo+4
1526  0016 2703          	jreq	L115
1527                     ; 420 		return;
1528  0018               L221:
1531  0018 5b03          	addw	sp,#3
1532  001a 81            	ret	
1533  001b               L115:
1534                     ; 423 	packet_changed = 1;	
1536  001b 35010005      	mov	_packet_changed,#1
1537                     ; 424 	_disp_mode2 = buf[1];
1539  001f 1e02          	ldw	x,(OFST+1,sp)
1540  0021 e601          	ld	a,(1,x)
1541  0023 c70000        	ld	__disp_mode2,a
1542                     ; 426 	switch(_disp_mode2)
1545                     ; 430 	case RC_MODE_REPEAT:	uiInfo.repeat = buf[5];	break;
1546  0026 4a            	dec	a
1547  0027 270a          	jreq	L164
1548  0029 a007          	sub	a,#7
1549  002b 270d          	jreq	L364
1550  002d a008          	sub	a,#8
1551  002f 2710          	jreq	L564
1552  0031 20e5          	jra	L221
1553  0033               L164:
1554                     ; 428 	case RC_MODE_HEAT:		uiInfo.tSetup = buf[3];	break;
1556  0033 e603          	ld	a,(3,x)
1557  0035 c7000e        	ld	_uiInfo+14,a
1560  0038 20de          	jra	L221
1561  003a               L364:
1562                     ; 429 	case RC_MODE_RESERVE:	uiInfo.reserve = buf[5];	break;
1564  003a e605          	ld	a,(5,x)
1565  003c c7000d        	ld	_uiInfo+13,a
1568  003f 20d7          	jra	L221
1569  0041               L564:
1570                     ; 430 	case RC_MODE_REPEAT:	uiInfo.repeat = buf[5];	break;
1572  0041 e605          	ld	a,(5,x)
1573  0043 c7000c        	ld	_uiInfo+12,a
1576                     ; 432 }
1578  0046 20d0          	jra	L221
1641                     ; 434 void rc_ptc_check_mirror(uint8_t *buf) {
1642                     .text:	section	.text,new
1643  0000               _rc_ptc_check_mirror:
1645  0000 89            	pushw	x
1646       00000001      OFST:	set	1
1649                     ; 439 	state_check = RC_STATE_NONE;
1651  0001 725f000b      	clr	_state_check
1652  0005 88            	push	a
1653                     ; 441 	if (uiInfo.mode != SETTING_MODE_MASTER) {
1655  0006 c60008        	ld	a,_uiInfo+8
1656  0009 a101          	cp	a,#1
1657  000b 2703cc01b5    	jrne	L555
1658                     ; 442 		return;
1660                     ; 445 	page = buf[0] & 0x0F;
1662  0010 1e02          	ldw	x,(OFST+1,sp)
1663  0012 f6            	ld	a,(x)
1664  0013 a40f          	and	a,#15
1665  0015 6b01          	ld	(OFST+0,sp),a
1666                     ; 446 	cur_mirror_page = page;
1668  0017 c70006        	ld	_cur_mirror_page,a
1669                     ; 447 	state_check = RC_STATE_MIRROR;
1671  001a 3506000b      	mov	_state_check,#6
1672                     ; 449 	switch(page) {
1675                     ; 530 			break;
1676  001e 270f          	jreq	L715
1677  0020 4a            	dec	a
1678  0021 2603cc00a5    	jreq	L125
1679  0026 4a            	dec	a
1680  0027 2603cc0130    	jreq	L325
1681  002c cc01b5        	jra	L555
1682  002f               L715:
1683                     ; 450 		case 0:
1683                     ; 451 			mode = (buf[6] & 0x80) >> 7;
1685  002f e606          	ld	a,(6,x)
1686  0031 49            	rlc	a
1687  0032 4f            	clr	a
1688  0033 49            	rlc	a
1689  0034 6b01          	ld	(OFST+0,sp),a
1690                     ; 452 			if (mode == CNT_MODE_MAIN) {
1692  0036 2654          	jrne	L755
1693                     ; 453 				_boiler_type = (buf[1] & 0x80) >> 7;
1695  0038 cd01c4        	call	LC009
1696  003b c70000        	ld	__boiler_type,a
1697                     ; 454 				uiInfo.lpmType = (buf[1] & 0x0F);
1699  003e e601          	ld	a,(1,x)
1700  0040 a40f          	and	a,#15
1701  0042 c70013        	ld	_uiInfo+19,a
1702                     ; 455 				uiInfo.cnt = (buf[2] & 0x70) >> 4;
1704  0045 cd01b8        	call	LC007
1705  0048 c70005        	ld	_uiInfo+5,a
1706                     ; 456 				uiInfo.valve = buf[2] & 0x0F;
1708  004b e602          	ld	a,(2,x)
1709  004d a40f          	and	a,#15
1710  004f c7000a        	ld	_uiInfo+10,a
1711                     ; 457 				_boiler_water_shower = buf[3];
1713  0052 e603          	ld	a,(3,x)
1714  0054 c70000        	ld	__boiler_water_shower,a
1715                     ; 458 				uiInfo.houseCapa = buf[4];
1717  0057 e604          	ld	a,(4,x)
1718  0059 c70010        	ld	_uiInfo+16,a
1719                     ; 459 				_boiler_water_heat = buf[5] ;
1721  005c e605          	ld	a,(5,x)
1722  005e c70000        	ld	__boiler_water_heat,a
1723                     ; 460 				uiInfo.controlMode = mode;
1725  0061 7b01          	ld	a,(OFST+0,sp)
1726  0063 c70009        	ld	_uiInfo+9,a
1727                     ; 461 				uiInfo.subRCLock = (buf[6] & 0x40) >> 6 ;
1729  0066 e606          	ld	a,(6,x)
1730  0068 4e            	swap	a
1731  0069 a404          	and	a,#4
1732  006b 44            	srl	a
1733  006c 44            	srl	a
1734  006d c7005d        	ld	_uiInfo+93,a
1735                     ; 462 				uiInfo.poType = (buf[6] & 0x30) >> 4;
1737  0070 e606          	ld	a,(6,x)
1738  0072 4e            	swap	a
1739  0073 a403          	and	a,#3
1740  0075 c7000f        	ld	_uiInfo+15,a
1741                     ; 463 				uiInfo.cntlMode = (buf[6] & 0x08) >> 3;
1743  0078 e606          	ld	a,(6,x)
1744  007a a408          	and	a,#8
1745  007c 44            	srl	a
1746  007d 44            	srl	a
1747  007e 44            	srl	a
1748  007f c70003        	ld	_uiInfo+3,a
1749                     ; 464 				uiInfo.opMode = buf[6] & 0x07;
1751  0082 e606          	ld	a,(6,x)
1752  0084 a407          	and	a,#7
1753  0086 c70007        	ld	_uiInfo+7,a
1755  0089 cc01b5        	jra	L555
1756  008c               L755:
1757                     ; 466 				uiInfo.lpmType_sub = (buf[1] & 0x0F);
1759  008c e601          	ld	a,(1,x)
1760  008e a40f          	and	a,#15
1761  0090 c70014        	ld	_uiInfo+20,a
1762                     ; 467 				uiInfo.cnt_sub = (buf[2] & 0xF0) >> 4;
1764  0093 e602          	ld	a,(2,x)
1765  0095 4e            	swap	a
1766  0096 a40f          	and	a,#15
1767  0098 c70006        	ld	_uiInfo+6,a
1768                     ; 468 				uiInfo.valve_sub = buf[2] & 0x0F;
1770  009b e602          	ld	a,(2,x)
1771  009d a40f          	and	a,#15
1772  009f c7000b        	ld	_uiInfo+11,a
1773  00a2 cc01b5        	jra	L555
1774  00a5               L125:
1775                     ; 471 		case 1:
1775                     ; 472 			mode = (buf[1] & 0x80) >> 7;
1777  00a5 cd01c4        	call	LC009
1778  00a8 6b01          	ld	(OFST+0,sp),a
1779                     ; 473 			if (mode == CNT_MODE_MAIN) {
1781  00aa 2631          	jrne	L365
1782                     ; 474 				uiInfo.valve_rc[0] = (buf[1] & 0x70) >> 4;
1784  00ac cd01be        	call	LC008
1785  00af c7001d        	ld	_uiInfo+29,a
1786                     ; 475 				uiInfo.valve_rc[1] = buf[1] & 0x07;
1788  00b2 e601          	ld	a,(1,x)
1789  00b4 a407          	and	a,#7
1790  00b6 c7001e        	ld	_uiInfo+30,a
1791                     ; 476 				uiInfo.valve_rc[2] = (buf[2] & 0x70) >> 4;
1793  00b9 cd01b8        	call	LC007
1794  00bc c7001f        	ld	_uiInfo+31,a
1795                     ; 477 				uiInfo.valve_rc[3] = buf[2] & 0x07;
1797  00bf e602          	ld	a,(2,x)
1798  00c1 a407          	and	a,#7
1799  00c3 c70020        	ld	_uiInfo+32,a
1800                     ; 479 				uiInfo.valve_len[0] = buf[3];
1802  00c6 e603          	ld	a,(3,x)
1803  00c8 c70015        	ld	_uiInfo+21,a
1804                     ; 480 				uiInfo.valve_len[1] = buf[4];
1806  00cb e604          	ld	a,(4,x)
1807  00cd c70016        	ld	_uiInfo+22,a
1808                     ; 481 				uiInfo.valve_len[2] = buf[5];
1810  00d0 e605          	ld	a,(5,x)
1811  00d2 c70017        	ld	_uiInfo+23,a
1812                     ; 482 				uiInfo.valve_len[3] = buf[6];
1814  00d5 e606          	ld	a,(6,x)
1815  00d7 c70018        	ld	_uiInfo+24,a
1817  00da cc01b5        	jra	L555
1818  00dd               L365:
1819                     ; 484 				uiInfo.valve_sub_rc[0] = (buf[1] & 0x70) >> 4;
1821  00dd cd01be        	call	LC008
1822  00e0 c7002d        	ld	_uiInfo+45,a
1823                     ; 485 				uiInfo.valve_sub_rc[1] = buf[1] & 0x07;
1825  00e3 e601          	ld	a,(1,x)
1826  00e5 a407          	and	a,#7
1827  00e7 c7002e        	ld	_uiInfo+46,a
1828                     ; 486 				uiInfo.valve_sub_rc[2] = (buf[2] & 0x70) >> 4;
1830  00ea cd01b8        	call	LC007
1831  00ed c7002f        	ld	_uiInfo+47,a
1832                     ; 487 				uiInfo.valve_sub_rc[3] = buf[2] & 0x07;
1834  00f0 e602          	ld	a,(2,x)
1835  00f2 a407          	and	a,#7
1836  00f4 c70030        	ld	_uiInfo+48,a
1837                     ; 489 				uiInfo.valve_sub_len[0] = buf[3];
1839  00f7 e603          	ld	a,(3,x)
1840  00f9 c70025        	ld	_uiInfo+37,a
1841                     ; 490 				uiInfo.valve_sub_len[1] = buf[4];
1843  00fc e604          	ld	a,(4,x)
1844  00fe c70026        	ld	_uiInfo+38,a
1845                     ; 491 				uiInfo.valve_sub_len[2] = buf[5];
1847  0101 e605          	ld	a,(5,x)
1848  0103 c70027        	ld	_uiInfo+39,a
1849                     ; 492 				uiInfo.valve_sub_len[3] = buf[6];
1851  0106 e606          	ld	a,(6,x)
1852  0108 c70028        	ld	_uiInfo+40,a
1853                     ; 494 				for (i = 0 ; i < 4 ; i++) {
1855  010b 4f            	clr	a
1856  010c 6b01          	ld	(OFST+0,sp),a
1857  010e               L765:
1858                     ; 495 					if (uiInfo.valve_sub_rc[i] == 0 && uiInfo.valve_sub_len[i] != 0) {
1860  010e 5f            	clrw	x
1861  010f 97            	ld	xl,a
1862  0110 724d002d      	tnz	(_uiInfo+45,x)
1863  0114 260f          	jrne	L575
1865  0116 5f            	clrw	x
1866  0117 97            	ld	xl,a
1867  0118 724d0025      	tnz	(_uiInfo+37,x)
1868  011c 2707          	jreq	L575
1869                     ; 496 						uiInfo.valve_sub_rc[i] = 8;
1871  011e 5f            	clrw	x
1872  011f 97            	ld	xl,a
1873  0120 a608          	ld	a,#8
1874  0122 d7002d        	ld	(_uiInfo+45,x),a
1875  0125               L575:
1876                     ; 494 				for (i = 0 ; i < 4 ; i++) {
1878  0125 0c01          	inc	(OFST+0,sp)
1881  0127 7b01          	ld	a,(OFST+0,sp)
1882  0129 a104          	cp	a,#4
1883  012b 25e1          	jrult	L765
1884  012d cc01b5        	jra	L555
1885  0130               L325:
1886                     ; 501 		case 2:
1886                     ; 502 			mode = (buf[1] & 0x80) >> 7;
1888  0130 cd01c4        	call	LC009
1889  0133 6b01          	ld	(OFST+0,sp),a
1890                     ; 503 			if (mode == CNT_MODE_MAIN) {
1892  0135 262f          	jrne	L775
1893                     ; 504 				uiInfo.valve_rc[4] = (buf[1] & 0x70) >> 4;
1895  0137 cd01be        	call	LC008
1896  013a c70021        	ld	_uiInfo+33,a
1897                     ; 505 				uiInfo.valve_rc[5] = buf[1] & 0x07;
1899  013d e601          	ld	a,(1,x)
1900  013f a407          	and	a,#7
1901  0141 c70022        	ld	_uiInfo+34,a
1902                     ; 506 				uiInfo.valve_rc[6] = (buf[2] & 0x70) >> 4;
1904  0144 ad72          	call	LC007
1905  0146 c70023        	ld	_uiInfo+35,a
1906                     ; 507 				uiInfo.valve_rc[7] = buf[2] & 0x07;
1908  0149 e602          	ld	a,(2,x)
1909  014b a407          	and	a,#7
1910  014d c70024        	ld	_uiInfo+36,a
1911                     ; 509 				uiInfo.valve_len[4] = buf[3];
1913  0150 e603          	ld	a,(3,x)
1914  0152 c70019        	ld	_uiInfo+25,a
1915                     ; 510 				uiInfo.valve_len[5] = buf[4];
1917  0155 e604          	ld	a,(4,x)
1918  0157 c7001a        	ld	_uiInfo+26,a
1919                     ; 511 				uiInfo.valve_len[6] = buf[5];
1921  015a e605          	ld	a,(5,x)
1922  015c c7001b        	ld	_uiInfo+27,a
1923                     ; 512 				uiInfo.valve_len[7] = buf[6];
1925  015f e606          	ld	a,(6,x)
1926  0161 c7001c        	ld	_uiInfo+28,a
1928  0164 204f          	jra	L555
1929  0166               L775:
1930                     ; 514 				uiInfo.valve_sub_rc[4] = (buf[1] & 0x70) >> 4;
1932  0166 ad56          	call	LC008
1933  0168 c70031        	ld	_uiInfo+49,a
1934                     ; 515 				uiInfo.valve_sub_rc[5] = buf[1] & 0x07;
1936  016b e601          	ld	a,(1,x)
1937  016d a407          	and	a,#7
1938  016f c70032        	ld	_uiInfo+50,a
1939                     ; 516 				uiInfo.valve_sub_rc[6] = (buf[2] & 0x70) >> 4;
1941  0172 ad44          	call	LC007
1942  0174 c70033        	ld	_uiInfo+51,a
1943                     ; 517 				uiInfo.valve_sub_rc[7] = buf[2] & 0x07;
1945  0177 e602          	ld	a,(2,x)
1946  0179 a407          	and	a,#7
1947  017b c70034        	ld	_uiInfo+52,a
1948                     ; 519 				uiInfo.valve_sub_len[4] = buf[3];
1950  017e e603          	ld	a,(3,x)
1951  0180 c70029        	ld	_uiInfo+41,a
1952                     ; 520 				uiInfo.valve_sub_len[5] = buf[4];
1954  0183 e604          	ld	a,(4,x)
1955  0185 c7002a        	ld	_uiInfo+42,a
1956                     ; 521 				uiInfo.valve_sub_len[6] = buf[5];
1958  0188 e605          	ld	a,(5,x)
1959  018a c7002b        	ld	_uiInfo+43,a
1960                     ; 522 				uiInfo.valve_sub_len[7] = buf[6];
1962  018d e606          	ld	a,(6,x)
1963  018f c7002c        	ld	_uiInfo+44,a
1964                     ; 524 				for (i = 4 ; i < 8 ; i++) {
1966  0192 a604          	ld	a,#4
1967  0194 6b01          	ld	(OFST+0,sp),a
1968  0196               L306:
1969                     ; 525 					if (uiInfo.valve_sub_rc[i] == 0 && uiInfo.valve_sub_len[i] != 0) {
1971  0196 5f            	clrw	x
1972  0197 97            	ld	xl,a
1973  0198 724d002d      	tnz	(_uiInfo+45,x)
1974  019c 260f          	jrne	L116
1976  019e 5f            	clrw	x
1977  019f 97            	ld	xl,a
1978  01a0 724d0025      	tnz	(_uiInfo+37,x)
1979  01a4 2707          	jreq	L116
1980                     ; 526 						uiInfo.valve_sub_rc[i] = 8;
1982  01a6 5f            	clrw	x
1983  01a7 97            	ld	xl,a
1984  01a8 a608          	ld	a,#8
1985  01aa d7002d        	ld	(_uiInfo+45,x),a
1986  01ad               L116:
1987                     ; 524 				for (i = 4 ; i < 8 ; i++) {
1989  01ad 0c01          	inc	(OFST+0,sp)
1992  01af 7b01          	ld	a,(OFST+0,sp)
1993  01b1 a108          	cp	a,#8
1994  01b3 25e1          	jrult	L306
1995  01b5               L555:
1996                     ; 532 }
1999  01b5 5b03          	addw	sp,#3
2000  01b7 81            	ret	
2001  01b8               LC007:
2002  01b8 e602          	ld	a,(2,x)
2003  01ba 4e            	swap	a
2004  01bb a407          	and	a,#7
2005  01bd 81            	ret	
2006  01be               LC008:
2007  01be e601          	ld	a,(1,x)
2008  01c0 4e            	swap	a
2009  01c1 a407          	and	a,#7
2010  01c3 81            	ret	
2011  01c4               LC009:
2012  01c4 e601          	ld	a,(1,x)
2013  01c6 49            	rlc	a
2014  01c7 4f            	clr	a
2015  01c8 49            	rlc	a
2016  01c9 81            	ret	
2065                     ; 534 void rc_ptc_check(uint8_t *buf) {
2066                     .text:	section	.text,new
2067  0000               _rc_ptc_check:
2069  0000 89            	pushw	x
2070  0001 88            	push	a
2071       00000001      OFST:	set	1
2074                     ; 536 	start = buf[0] & 0xF0;
2076  0002 f6            	ld	a,(x)
2077  0003 a4f0          	and	a,#240
2078  0005 6b01          	ld	(OFST+0,sp),a
2079                     ; 538 	switch(start) {
2082                     ; 558 			break;
2083  0007 a020          	sub	a,#32
2084  0009 2738          	jreq	L326
2085  000b a010          	sub	a,#16
2086  000d 271f          	jreq	L516
2087  000f a030          	sub	a,#48
2088  0011 2729          	jreq	L126
2089  0013 a010          	sub	a,#16
2090  0015 2710          	jreq	L316
2091  0017 a080          	sub	a,#128
2092  0019 271a          	jreq	L716
2093                     ; 554 		default:
2093                     ; 555 			state_check = RC_STATE_ERROR;
2095  001b 3504000b      	mov	_state_check,#4
2096                     ; 556 			disp_char(buf[0]);
2098  001f 1e02          	ldw	x,(OFST+1,sp)
2099  0021 f6            	ld	a,(x)
2100  0022 cd0000        	call	_disp_char
2102                     ; 558 			break;
2104  0025 2021          	jra	L156
2105  0027               L316:
2106                     ; 539 		case BYTE_START_CNT_NORMAL:
2106                     ; 540 			rc_ptc_check_normal(buf);
2108  0027 1e02          	ldw	x,(OFST+1,sp)
2109  0029 cd0000        	call	_rc_ptc_check_normal
2111                     ; 541 			break;
2113  002c 201a          	jra	L156
2114  002e               L516:
2115                     ; 542 		case BYTE_START_CNT_SETTING:
2115                     ; 543 			rc_ptc_check_setting(buf);
2117  002e 1e02          	ldw	x,(OFST+1,sp)
2118  0030 cd0000        	call	_rc_ptc_check_setting
2120                     ; 544 			break;
2122  0033 2013          	jra	L156
2123  0035               L716:
2124                     ; 545 		case BYTE_START_RC_NORMAL:
2124                     ; 546 			rc_ptc_check_rc(buf);
2126  0035 1e02          	ldw	x,(OFST+1,sp)
2127  0037 cd0000        	call	_rc_ptc_check_rc
2129                     ; 547 			break;
2131  003a 200c          	jra	L156
2132  003c               L126:
2133                     ; 548 		case BYTE_START_RC_SUBRC:
2133                     ; 549 			rc_ptc_check_subrc(buf);
2135  003c 1e02          	ldw	x,(OFST+1,sp)
2136  003e cd0000        	call	_rc_ptc_check_subrc
2138                     ; 550 			break;
2140  0041 2005          	jra	L156
2141  0043               L326:
2142                     ; 551 		case BYTE_START_CNT_MIRROR:
2142                     ; 552 			rc_ptc_check_mirror(buf);
2144  0043 1e02          	ldw	x,(OFST+1,sp)
2145  0045 cd0000        	call	_rc_ptc_check_mirror
2147                     ; 553 			break;
2149  0048               L156:
2150                     ; 560 }
2153  0048 5b03          	addw	sp,#3
2154  004a 81            	ret	
2187                     ; 562 void setSettingChange(uint8_t ch) {
2188                     .text:	section	.text,new
2189  0000               _setSettingChange:
2193                     ; 563 	set_changed = ch;
2195  0000 c7000e        	ld	_set_changed,a
2196                     ; 564 }
2199  0003 81            	ret	
2223                     ; 566 uint8_t getSettingChange(void) {
2224                     .text:	section	.text,new
2225  0000               _getSettingChange:
2229                     ; 567 	return set_changed;
2231  0000 c6000e        	ld	a,_set_changed
2234  0003 81            	ret	
2258                     ; 570 uint8_t getState_check(void) {
2259                     .text:	section	.text,new
2260  0000               _getState_check:
2264                     ; 571 	return state_check;
2266  0000 c6000b        	ld	a,_state_check
2269  0003 81            	ret	
2302                     ; 574 void setState_check(uint8_t st) {
2303                     .text:	section	.text,new
2304  0000               _setState_check:
2308                     ; 575 	state_check = st;
2310  0000 c7000b        	ld	_state_check,a
2311                     ; 576 }
2314  0003 81            	ret	
2363                     ; 578 void makeChecksum(uint8_t *buf) {
2364                     .text:	section	.text,new
2365  0000               _makeChecksum:
2367  0000 89            	pushw	x
2368  0001 89            	pushw	x
2369       00000002      OFST:	set	2
2372                     ; 583 	s = 0;
2374  0002 0f01          	clr	(OFST-1,sp)
2375                     ; 584 	for (i = 0 ; i < 7 ; i++) {
2377  0004 0f02          	clr	(OFST+0,sp)
2378  0006               L547:
2379                     ; 585 		s += buf[i];
2381  0006 7b03          	ld	a,(OFST+1,sp)
2382  0008 97            	ld	xl,a
2383  0009 7b04          	ld	a,(OFST+2,sp)
2384  000b 1b02          	add	a,(OFST+0,sp)
2385  000d 2401          	jrnc	L061
2386  000f 5c            	incw	x
2387  0010               L061:
2388  0010 02            	rlwa	x,a
2389  0011 7b01          	ld	a,(OFST-1,sp)
2390  0013 fb            	add	a,(x)
2391  0014 6b01          	ld	(OFST-1,sp),a
2392                     ; 584 	for (i = 0 ; i < 7 ; i++) {
2394  0016 0c02          	inc	(OFST+0,sp)
2397  0018 7b02          	ld	a,(OFST+0,sp)
2398  001a a107          	cp	a,#7
2399  001c 25e8          	jrult	L547
2400                     ; 587 	buf[7] = s;
2402  001e 1e03          	ldw	x,(OFST+1,sp)
2403  0020 7b01          	ld	a,(OFST-1,sp)
2404  0022 e707          	ld	(7,x),a
2405                     ; 593 }
2408  0024 5b04          	addw	sp,#4
2409  0026 81            	ret	
2463                     ; 595 void rc_ptc_make_baseSetting(uint8_t *buf, uint8_t page, uint8_t mode) {
2464                     .text:	section	.text,new
2465  0000               _rc_ptc_make_baseSetting:
2467  0000 89            	pushw	x
2468  0001 5203          	subw	sp,#3
2469       00000003      OFST:	set	3
2472                     ; 596 	switch (page) {
2474  0003 7b08          	ld	a,(OFST+5,sp)
2476                     ; 687 		break;
2477  0005 270f          	jreq	L357
2478  0007 4a            	dec	a
2479  0008 2603cc00ad    	jreq	L557
2480  000d 4a            	dec	a
2481  000e 2603cc0153    	jreq	L757
2482  0013 cc01f1        	jra	L5001
2483  0016               L357:
2484                     ; 597 		case 0:
2484                     ; 598 			if (mode == CNT_MODE_MAIN) {
2486  0016 7b09          	ld	a,(OFST+6,sp)
2487  0018 2625          	jrne	L7001
2488                     ; 599 				buf[1] = (_boiler_type << 7)
2488                     ; 600 									| ((uiInfo.plc & 0x07) << 4)
2488                     ; 601 									| (uiInfo.lpmType);
2490  001a c60064        	ld	a,_uiInfo+100
2491  001d a407          	and	a,#7
2492  001f cd01fa        	call	LC013
2493  0022 6b03          	ld	(OFST+0,sp),a
2494  0024 c60000        	ld	a,__boiler_type
2495  0027 cd01f4        	call	LC012
2496  002a 1a03          	or	a,(OFST+0,sp)
2497  002c 1e04          	ldw	x,(OFST+1,sp)
2498  002e ca0013        	or	a,_uiInfo+19
2499  0031 e701          	ld	(1,x),a
2500                     ; 602 				buf[2] = ((uiInfo.relay & 0x01) << 7) 
2500                     ; 603 									| ((uiInfo.cnt & 0x07) << 4) 
2500                     ; 604 									| (uiInfo.valve & 0x0F);
2502  0033 c6000a        	ld	a,_uiInfo+10
2503  0036 a40f          	and	a,#15
2504  0038 6b03          	ld	(OFST+0,sp),a
2505  003a c60005        	ld	a,_uiInfo+5
2506                     ; 605 				buf[3] = _boiler_water_shower;
2507                     ; 606 				buf[4] = uiInfo.houseCapa;
2508                     ; 607 				buf[5] = _boiler_water_heat;
2509                     ; 608 				buf[6] = 	(mode << 7) 
2509                     ; 609 									| (uiInfo.subRCLock << 6) 
2509                     ; 610 									| ((uiInfo.poType & 0x01) << 4) 
2509                     ; 611 									| ((uiInfo.cntlMode & 0x01) << 3) 
2509                     ; 612 									| uiInfo.opMode;
2511  003d 2017          	jp	LC011
2512  003f               L7001:
2513                     ; 614 				buf[1] = (_boiler_type << 7) 
2513                     ; 615 									| (uiInfo.lpmType_sub);
2515  003f c60000        	ld	a,__boiler_type
2516  0042 cd01f4        	call	LC012
2517  0045 1e04          	ldw	x,(OFST+1,sp)
2518  0047 ca0014        	or	a,_uiInfo+20
2519  004a e701          	ld	(1,x),a
2520                     ; 616 				buf[2] = ((uiInfo.relay & 0x01) << 7) 
2520                     ; 617 									| ((uiInfo.cnt_sub & 0x07) << 4) 
2520                     ; 618 									| (uiInfo.valve_sub & 0x0F);
2522  004c c6000b        	ld	a,_uiInfo+11
2523  004f a40f          	and	a,#15
2524  0051 6b03          	ld	(OFST+0,sp),a
2525  0053 c60006        	ld	a,_uiInfo+6
2526                     ; 619 				buf[3] = _boiler_water_shower;
2528                     ; 620 				buf[4] = uiInfo.houseCapa;
2530                     ; 621 				buf[5] = _boiler_water_heat;
2532                     ; 622 				buf[6] = 	(mode << 7) 
2532                     ; 623 									| (uiInfo.subRCLock << 6) 
2532                     ; 624 									| ((uiInfo.poType & 0x01) << 4) 
2532                     ; 625 									| ((uiInfo.cntlMode & 0x01) << 3) 
2532                     ; 626 									| uiInfo.opMode;
2534  0056               LC011:
2535  0056 a407          	and	a,#7
2536  0058 cd01fa        	call	LC013
2537  005b 6b02          	ld	(OFST-1,sp),a
2538  005d c6005e        	ld	a,_uiInfo+94
2539  0060 a401          	and	a,#1
2540  0062 cd01f4        	call	LC012
2541  0065 1a02          	or	a,(OFST-1,sp)
2542  0067 1e04          	ldw	x,(OFST+1,sp)
2543  0069 1a03          	or	a,(OFST+0,sp)
2544  006b e702          	ld	(2,x),a
2546  006d c60000        	ld	a,__boiler_water_shower
2547  0070 e703          	ld	(3,x),a
2549  0072 c60010        	ld	a,_uiInfo+16
2550  0075 e704          	ld	(4,x),a
2552  0077 c60000        	ld	a,__boiler_water_heat
2553  007a e705          	ld	(5,x),a
2555  007c c60003        	ld	a,_uiInfo+3
2556  007f a401          	and	a,#1
2557  0081 48            	sll	a
2558  0082 48            	sll	a
2559  0083 48            	sll	a
2560  0084 6b03          	ld	(OFST+0,sp),a
2561  0086 c6000f        	ld	a,_uiInfo+15
2562  0089 a401          	and	a,#1
2563  008b cd01fa        	call	LC013
2564  008e 6b02          	ld	(OFST-1,sp),a
2565  0090 c6005d        	ld	a,_uiInfo+93
2566  0093 97            	ld	xl,a
2567  0094 a640          	ld	a,#64
2568  0096 42            	mul	x,a
2569  0097 9f            	ld	a,xl
2570  0098 6b01          	ld	(OFST-2,sp),a
2571  009a 7b09          	ld	a,(OFST+6,sp)
2572  009c cd01f4        	call	LC012
2573  009f 1a01          	or	a,(OFST-2,sp)
2574  00a1 1a02          	or	a,(OFST-1,sp)
2575  00a3 1a03          	or	a,(OFST+0,sp)
2576  00a5 ca0007        	or	a,_uiInfo+7
2577  00a8 1e04          	ldw	x,(OFST+1,sp)
2578  00aa cc01ef        	jp	LC010
2579  00ad               L557:
2580                     ; 629 		case 1:
2580                     ; 630 			if (mode == CNT_MODE_MAIN) {
2582  00ad 7b09          	ld	a,(OFST+6,sp)
2583  00af 2651          	jrne	L3101
2584                     ; 631 				buf[1] = mode << 7 
2584                     ; 632 							 | (uiInfo.valve_rc[0] << 4)
2584                     ; 633 							 | mode << 3 
2584                     ; 634 							 | uiInfo.valve_rc[1];
2586  00b1 48            	sll	a
2587  00b2 48            	sll	a
2588  00b3 48            	sll	a
2589  00b4 6b03          	ld	(OFST+0,sp),a
2590  00b6 c6001d        	ld	a,_uiInfo+29
2591  00b9 cd01fa        	call	LC013
2592  00bc 6b02          	ld	(OFST-1,sp),a
2593  00be 7b09          	ld	a,(OFST+6,sp)
2594  00c0 cd01f4        	call	LC012
2595  00c3 1a02          	or	a,(OFST-1,sp)
2596  00c5 1a03          	or	a,(OFST+0,sp)
2597  00c7 1e04          	ldw	x,(OFST+1,sp)
2598  00c9 ca001e        	or	a,_uiInfo+30
2599  00cc e701          	ld	(1,x),a
2600                     ; 635 				buf[2] = mode << 7 
2600                     ; 636 							 | (uiInfo.valve_rc[2] << 4)
2600                     ; 637 							 | mode << 3 
2600                     ; 638 							 | uiInfo.valve_rc[3];
2602  00ce 7b09          	ld	a,(OFST+6,sp)
2603  00d0 48            	sll	a
2604  00d1 48            	sll	a
2605  00d2 48            	sll	a
2606  00d3 6b03          	ld	(OFST+0,sp),a
2607  00d5 c6001f        	ld	a,_uiInfo+31
2608  00d8 cd01fa        	call	LC013
2609  00db 6b02          	ld	(OFST-1,sp),a
2610  00dd 7b09          	ld	a,(OFST+6,sp)
2611  00df cd01f4        	call	LC012
2612  00e2 1a02          	or	a,(OFST-1,sp)
2613  00e4 1a03          	or	a,(OFST+0,sp)
2614  00e6 1e04          	ldw	x,(OFST+1,sp)
2615  00e8 ca0020        	or	a,_uiInfo+32
2616  00eb e702          	ld	(2,x),a
2617                     ; 639 				buf[3] = uiInfo.valve_len[0];
2619  00ed c60015        	ld	a,_uiInfo+21
2620  00f0 e703          	ld	(3,x),a
2621                     ; 640 				buf[4] = uiInfo.valve_len[1];
2623  00f2 c60016        	ld	a,_uiInfo+22
2624  00f5 e704          	ld	(4,x),a
2625                     ; 641 				buf[5] = uiInfo.valve_len[2];
2627  00f7 c60017        	ld	a,_uiInfo+23
2628  00fa e705          	ld	(5,x),a
2629                     ; 642 				buf[6] = uiInfo.valve_len[3];
2631  00fc c60018        	ld	a,_uiInfo+24
2633  00ff cc01ef        	jp	LC010
2634  0102               L3101:
2635                     ; 644 				buf[1] = mode << 7 
2635                     ; 645 							 | (uiInfo.valve_sub_rc[0] << 4)
2635                     ; 646 							 | mode << 3 
2635                     ; 647 							 | uiInfo.valve_sub_rc[1];
2637  0102 48            	sll	a
2638  0103 48            	sll	a
2639  0104 48            	sll	a
2640  0105 6b03          	ld	(OFST+0,sp),a
2641  0107 c6002d        	ld	a,_uiInfo+45
2642  010a cd01fa        	call	LC013
2643  010d 6b02          	ld	(OFST-1,sp),a
2644  010f 7b09          	ld	a,(OFST+6,sp)
2645  0111 cd01f4        	call	LC012
2646  0114 1a02          	or	a,(OFST-1,sp)
2647  0116 1a03          	or	a,(OFST+0,sp)
2648  0118 1e04          	ldw	x,(OFST+1,sp)
2649  011a ca002e        	or	a,_uiInfo+46
2650  011d e701          	ld	(1,x),a
2651                     ; 648 				buf[2] = mode << 7 
2651                     ; 649 							 | (uiInfo.valve_sub_rc[2] << 4)
2651                     ; 650 							 | mode << 3 
2651                     ; 651 							 | uiInfo.valve_sub_rc[3];
2653  011f 7b09          	ld	a,(OFST+6,sp)
2654  0121 48            	sll	a
2655  0122 48            	sll	a
2656  0123 48            	sll	a
2657  0124 6b03          	ld	(OFST+0,sp),a
2658  0126 c6002f        	ld	a,_uiInfo+47
2659  0129 cd01fa        	call	LC013
2660  012c 6b02          	ld	(OFST-1,sp),a
2661  012e 7b09          	ld	a,(OFST+6,sp)
2662  0130 cd01f4        	call	LC012
2663  0133 1a02          	or	a,(OFST-1,sp)
2664  0135 1a03          	or	a,(OFST+0,sp)
2665  0137 1e04          	ldw	x,(OFST+1,sp)
2666  0139 ca0030        	or	a,_uiInfo+48
2667  013c e702          	ld	(2,x),a
2668                     ; 652 				buf[3] = uiInfo.valve_sub_len[0];
2670  013e c60025        	ld	a,_uiInfo+37
2671  0141 e703          	ld	(3,x),a
2672                     ; 653 				buf[4] = uiInfo.valve_sub_len[1];
2674  0143 c60026        	ld	a,_uiInfo+38
2675  0146 e704          	ld	(4,x),a
2676                     ; 654 				buf[5] = uiInfo.valve_sub_len[2];
2678  0148 c60027        	ld	a,_uiInfo+39
2679  014b e705          	ld	(5,x),a
2680                     ; 655 				buf[6] = uiInfo.valve_sub_len[3];
2682  014d c60028        	ld	a,_uiInfo+40
2683  0150 cc01ef        	jp	LC010
2684  0153               L757:
2685                     ; 658 		case 2:
2685                     ; 659 			if (mode == CNT_MODE_MAIN) {
2687  0153 7b09          	ld	a,(OFST+6,sp)
2688  0155 264e          	jrne	L7101
2689                     ; 660 				buf[1] = mode << 7 
2689                     ; 661 							 | (uiInfo.valve_rc[4] << 4) 
2689                     ; 662 							 | mode << 3 
2689                     ; 663 							 | uiInfo.valve_rc[5];
2691  0157 48            	sll	a
2692  0158 48            	sll	a
2693  0159 48            	sll	a
2694  015a 6b03          	ld	(OFST+0,sp),a
2695  015c c60021        	ld	a,_uiInfo+33
2696  015f cd01fa        	call	LC013
2697  0162 6b02          	ld	(OFST-1,sp),a
2698  0164 7b09          	ld	a,(OFST+6,sp)
2699  0166 cd01f4        	call	LC012
2700  0169 1a02          	or	a,(OFST-1,sp)
2701  016b 1a03          	or	a,(OFST+0,sp)
2702  016d 1e04          	ldw	x,(OFST+1,sp)
2703  016f ca0022        	or	a,_uiInfo+34
2704  0172 e701          	ld	(1,x),a
2705                     ; 664 				buf[2] = mode << 7 
2705                     ; 665 							 | (uiInfo.valve_rc[6] << 4) 
2705                     ; 666 							 | mode << 3 
2705                     ; 667 							 | uiInfo.valve_rc[7];
2707  0174 7b09          	ld	a,(OFST+6,sp)
2708  0176 48            	sll	a
2709  0177 48            	sll	a
2710  0178 48            	sll	a
2711  0179 6b03          	ld	(OFST+0,sp),a
2712  017b c60023        	ld	a,_uiInfo+35
2713  017e ad7a          	call	LC013
2714  0180 6b02          	ld	(OFST-1,sp),a
2715  0182 7b09          	ld	a,(OFST+6,sp)
2716  0184 ad6e          	call	LC012
2717  0186 1a02          	or	a,(OFST-1,sp)
2718  0188 1a03          	or	a,(OFST+0,sp)
2719  018a 1e04          	ldw	x,(OFST+1,sp)
2720  018c ca0024        	or	a,_uiInfo+36
2721  018f e702          	ld	(2,x),a
2722                     ; 668 				buf[3] = uiInfo.valve_len[4];
2724  0191 c60019        	ld	a,_uiInfo+25
2725  0194 e703          	ld	(3,x),a
2726                     ; 669 				buf[4] = uiInfo.valve_len[5];
2728  0196 c6001a        	ld	a,_uiInfo+26
2729  0199 e704          	ld	(4,x),a
2730                     ; 670 				buf[5] = uiInfo.valve_len[6];
2732  019b c6001b        	ld	a,_uiInfo+27
2733  019e e705          	ld	(5,x),a
2734                     ; 671 				buf[6] = uiInfo.valve_len[7];
2736  01a0 c6001c        	ld	a,_uiInfo+28
2738  01a3 204a          	jp	LC010
2739  01a5               L7101:
2740                     ; 673 				buf[1] = mode << 7 
2740                     ; 674 							 | (uiInfo.valve_sub_rc[4] << 4) 
2740                     ; 675 							 | mode << 3 
2740                     ; 676 							 | uiInfo.valve_sub_rc[5];
2742  01a5 48            	sll	a
2743  01a6 48            	sll	a
2744  01a7 48            	sll	a
2745  01a8 6b03          	ld	(OFST+0,sp),a
2746  01aa c60031        	ld	a,_uiInfo+49
2747  01ad ad4b          	call	LC013
2748  01af 6b02          	ld	(OFST-1,sp),a
2749  01b1 7b09          	ld	a,(OFST+6,sp)
2750  01b3 ad3f          	call	LC012
2751  01b5 1a02          	or	a,(OFST-1,sp)
2752  01b7 1a03          	or	a,(OFST+0,sp)
2753  01b9 1e04          	ldw	x,(OFST+1,sp)
2754  01bb ca0032        	or	a,_uiInfo+50
2755  01be e701          	ld	(1,x),a
2756                     ; 677 				buf[2] = mode << 7 
2756                     ; 678 							 | (uiInfo.valve_sub_rc[6] << 4) 
2756                     ; 679 							 | mode << 3 
2756                     ; 680 							 | uiInfo.valve_sub_rc[7];
2758  01c0 7b09          	ld	a,(OFST+6,sp)
2759  01c2 48            	sll	a
2760  01c3 48            	sll	a
2761  01c4 48            	sll	a
2762  01c5 6b03          	ld	(OFST+0,sp),a
2763  01c7 c60033        	ld	a,_uiInfo+51
2764  01ca ad2e          	call	LC013
2765  01cc 6b02          	ld	(OFST-1,sp),a
2766  01ce 7b09          	ld	a,(OFST+6,sp)
2767  01d0 ad22          	call	LC012
2768  01d2 1a02          	or	a,(OFST-1,sp)
2769  01d4 1a03          	or	a,(OFST+0,sp)
2770  01d6 1e04          	ldw	x,(OFST+1,sp)
2771  01d8 ca0034        	or	a,_uiInfo+52
2772  01db e702          	ld	(2,x),a
2773                     ; 681 				buf[3] = uiInfo.valve_sub_len[4];
2775  01dd c60029        	ld	a,_uiInfo+41
2776  01e0 e703          	ld	(3,x),a
2777                     ; 682 				buf[4] = uiInfo.valve_sub_len[5];
2779  01e2 c6002a        	ld	a,_uiInfo+42
2780  01e5 e704          	ld	(4,x),a
2781                     ; 683 				buf[5] = uiInfo.valve_sub_len[6];
2783  01e7 c6002b        	ld	a,_uiInfo+43
2784  01ea e705          	ld	(5,x),a
2785                     ; 684 				buf[6] = uiInfo.valve_sub_len[7];
2787  01ec c6002c        	ld	a,_uiInfo+44
2788  01ef               LC010:
2789  01ef e706          	ld	(6,x),a
2790  01f1               L5001:
2791                     ; 689 }
2794  01f1 5b05          	addw	sp,#5
2795  01f3 81            	ret	
2796  01f4               LC012:
2797  01f4 97            	ld	xl,a
2798  01f5 a680          	ld	a,#128
2799  01f7 42            	mul	x,a
2800  01f8 9f            	ld	a,xl
2801  01f9 81            	ret	
2802  01fa               LC013:
2803  01fa 97            	ld	xl,a
2804  01fb a610          	ld	a,#16
2805  01fd 42            	mul	x,a
2806  01fe 9f            	ld	a,xl
2807  01ff 81            	ret	
2854                     ; 692 void rc_ptc_make_setting(uint8_t *buf) {
2855                     .text:	section	.text,new
2856  0000               _rc_ptc_make_setting:
2858  0000 89            	pushw	x
2859  0001 88            	push	a
2860       00000001      OFST:	set	1
2863                     ; 694 	uint8_t mode = uiInfo.controlMode;
2865  0002 c60009        	ld	a,_uiInfo+9
2866  0005 6b01          	ld	(OFST+0,sp),a
2867                     ; 696 	buf[0] = BYTE_START_RC_SETTING | cur_set_page;
2869  0007 c60007        	ld	a,_cur_set_page
2870  000a 1e02          	ldw	x,(OFST+1,sp)
2871  000c aa50          	or	a,#80
2872  000e f7            	ld	(x),a
2873                     ; 698 	rc_ptc_make_baseSetting(buf, cur_set_page, mode);
2875  000f 7b01          	ld	a,(OFST+0,sp)
2876  0011 88            	push	a
2877  0012 3b0007        	push	_cur_set_page
2878  0015 1e04          	ldw	x,(OFST+3,sp)
2879  0017 cd0000        	call	_rc_ptc_make_baseSetting
2881  001a 85            	popw	x
2882                     ; 700 	makeChecksum(buf);
2884  001b 1e02          	ldw	x,(OFST+1,sp)
2885  001d cd0000        	call	_makeChecksum
2887                     ; 701 }
2890  0020 5b03          	addw	sp,#3
2891  0022 81            	ret	
2894                     	switch	.data
2895  0005               _dr_out_count:
2896  0005 01            	dc.b	1
2943                     ; 707 void rc_ptc_make_normal(uint8_t *buf) {
2944                     .text:	section	.text,new
2945  0000               _rc_ptc_make_normal:
2947  0000 89            	pushw	x
2948       00000000      OFST:	set	0
2951                     ; 709 	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
2953  0001 c60004        	ld	a,_uiInfo+4
2954  0004 1e01          	ldw	x,(OFST+1,sp)
2955  0006 aaf0          	or	a,#240
2956  0008 f7            	ld	(x),a
2957                     ; 710 	buf[1] = _disp_mode2;
2959  0009 c60000        	ld	a,__disp_mode2
2960  000c e701          	ld	(1,x),a
2961                     ; 711 	buf[2] = uiInfo.tCurr;
2963  000e c60002        	ld	a,_uiInfo+2
2964  0011 e702          	ld	(2,x),a
2965                     ; 712 	buf[3] = 0x00;
2967  0013 6f03          	clr	(3,x)
2968                     ; 713 	buf[4] = 0x00;
2970  0015 6f04          	clr	(4,x)
2971                     ; 714 	buf[5] = 0x00;
2973  0017 6f05          	clr	(5,x)
2974                     ; 715 	buf[6] = 0x00;
2976  0019 6f06          	clr	(6,x)
2977                     ; 717 	if (uiInfo.mode == SETTING_MODE_MASTER) {
2979  001b c60008        	ld	a,_uiInfo+8
2980  001e 4a            	dec	a
2981  001f 2619          	jrne	L5701
2982                     ; 718 		buf[4] = _boiler_water_heat;
2984  0021 c60000        	ld	a,__boiler_water_heat
2985  0024 e704          	ld	(4,x),a
2986                     ; 719 		buf[6] = __boiler_shower[5] == 1 ? 1 : 0; // 온수모드   
2988  0026 c60005        	ld	a,___boiler_shower+5
2989  0029 4a            	dec	a
2990  002a 2603          	jrne	L471
2991  002c 4c            	inc	a
2992  002d 2001          	jra	L671
2993  002f               L471:
2994  002f 4f            	clr	a
2995  0030               L671:
2996  0030 e706          	ld	(6,x),a
2997                     ; 720 		buf[6] |= (_boiler_water_shower << 1);					// 온수
2999  0032 c60000        	ld	a,__boiler_water_shower
3000  0035 48            	sll	a
3001  0036 ea06          	or	a,(6,x)
3002  0038 e706          	ld	(6,x),a
3003  003a               L5701:
3004                     ; 723 	switch(buf[1]) {
3006  003a e601          	ld	a,(1,x)
3008                     ; 760 		default:
3008                     ; 761 			break;
3009  003c 4a            	dec	a
3010  003d 270d          	jreq	L3401
3011  003f 4a            	dec	a
3012  0040 270f          	jreq	L5401
3013  0042 a006          	sub	a,#6
3014  0044 2724          	jreq	L3501
3015  0046 a008          	sub	a,#8
3016  0048 2712          	jreq	L1501
3017  004a 2023          	jra	L1011
3018  004c               L3401:
3019                     ; 724 		case RC_MODE_HEAT:
3019                     ; 725 			buf[3] = uiInfo.tSetup;
3021  004c c6000e        	ld	a,_uiInfo+14
3022                     ; 726 			break;
3024  004f 2007          	jp	LC015
3025  0051               L5401:
3026                     ; 727 		case RC_MODE_OUT:
3026                     ; 728 			buf[5] = dr_mode_out;
3028  0051 c60002        	ld	a,_dr_mode_out
3029  0054 e705          	ld	(5,x),a
3030                     ; 743 			buf[3] = 0x14;				//	10'
3032  0056 a614          	ld	a,#20
3033  0058               LC015:
3034  0058 e703          	ld	(3,x),a
3035                     ; 746 			break;
3037  005a 2013          	jra	L1011
3038                     ; 747 		case RC_MODE_STOP:
3038                     ; 748 			break;
3040  005c               L1501:
3041                     ; 749 		case RC_MODE_REPEAT:
3041                     ; 750 			if(_timFlag == 0) {
3043  005c c60000        	ld	a,__timFlag
3044  005f 2604          	jrne	L3011
3045                     ; 751 				buf[3] = MAX_REPEAT_TEMP;
3047  0061 a650          	ld	a,#80
3048  0063 e703          	ld	(3,x),a
3049  0065               L3011:
3050                     ; 754 			buf[5] = uiInfo.repeat;
3052  0065 c6000c        	ld	a,_uiInfo+12
3053                     ; 756 			break;
3055  0068 2003          	jp	LC014
3056  006a               L3501:
3057                     ; 757 		case RC_MODE_RESERVE:
3057                     ; 758 			buf[5] = uiInfo.reserve;
3059  006a c6000d        	ld	a,_uiInfo+13
3060  006d               LC014:
3061  006d e705          	ld	(5,x),a
3062                     ; 759 			break;
3064                     ; 760 		default:
3064                     ; 761 			break;
3066  006f               L1011:
3067                     ; 764 	makeChecksum(buf);
3069  006f 1e01          	ldw	x,(OFST+1,sp)
3070  0071 cd0000        	call	_makeChecksum
3072                     ; 766 	if (disp_mode_preview != _disp_mode2){
3074  0074 c60002        	ld	a,_disp_mode_preview
3075  0077 c10000        	cp	a,__disp_mode2
3076  007a 2712          	jreq	L5011
3077                     ; 767 		if (uiInfo.mode == SETTING_MODE_SUB) {
3079                     ; 769 				UPDATE_BIT(BIT_DISPMODE);
3082                     ; 770 				disp_mode_preview = _disp_mode2;
3085                     ; 773 			UPDATE_BIT(BIT_DISPMODE);
3091                     ; 774 			disp_mode_preview = _disp_mode2;
3095  007c 72160000      	bset	__updateBit,#3
3097  0080 5500000000    	mov	__updateTimer,___timer1s
3099  0085 35050000      	mov	__updateCount,#5
3101  0089 5500000002    	mov	_disp_mode_preview,__disp_mode2
3102  008e               L5011:
3103                     ; 778 	only_one++;
3105  008e 725c0003      	inc	_only_one
3106                     ; 779 }
3109  0092 85            	popw	x
3110  0093 81            	ret	
3162                     ; 782 uint8_t rc_ptc_check_subRC(void) {
3163                     .text:	section	.text,new
3164  0000               _rc_ptc_check_subRC:
3166  0000 89            	pushw	x
3167       00000002      OFST:	set	2
3170                     ; 787 	if (_remote == 1) {
3172  0001 c60000        	ld	a,__remote
3173  0004 4a            	dec	a
3174  0005 2603          	jrne	L3411
3175                     ; 788 		return 0xFF;
3177  0007 4a            	dec	a
3180  0008 85            	popw	x
3181  0009 81            	ret	
3182  000a               L3411:
3183                     ; 791 	ch = 0;
3185  000a 0f01          	clr	(OFST-1,sp)
3186                     ; 792 	if (rcSubDataInfo.mode_heat[uiInfo.id - 1] != 0xFF) {
3188  000c cd0151        	call	LC018
3189  000f d60027        	ld	a,(_rcSubDataInfo+16,x)
3190  0012 4c            	inc	a
3191  0013 2704          	jreq	L5411
3192                     ; 793 		ch = 1;
3194  0015 a601          	ld	a,#1
3195  0017 6b01          	ld	(OFST-1,sp),a
3196  0019               L5411:
3197                     ; 796 	rcSubDataInfo.mode_heat[uiInfo.id - 1] = _disp_mode2;
3199  0019 c60004        	ld	a,_uiInfo+4
3200  001c 5f            	clrw	x
3201  001d 97            	ld	xl,a
3202  001e 5a            	decw	x
3203  001f c60000        	ld	a,__disp_mode2
3204  0022 d70027        	ld	(_rcSubDataInfo+16,x),a
3205                     ; 797 	rcSubDataInfo.cur_temp[uiInfo.id - 1] = uiInfo.tCurr;
3207  0025 cd0151        	call	LC018
3208  0028 c60002        	ld	a,_uiInfo+2
3209  002b d70017        	ld	(_rcSubDataInfo,x),a
3210                     ; 798 	rcSubDataInfo.set_temp[uiInfo.id - 1] = uiInfo.tSetup;
3212  002e cd0151        	call	LC018
3213  0031 c6000e        	ld	a,_uiInfo+14
3214  0034 d7001f        	ld	(_rcSubDataInfo+8,x),a
3215                     ; 799 	rcSubDataInfo.time[uiInfo.id - 1] = uiInfo.reserve;
3217  0037 cd0151        	call	LC018
3218  003a c6000d        	ld	a,_uiInfo+13
3219  003d d70037        	ld	(_rcSubDataInfo+32,x),a
3220                     ; 800 	rcSubDataInfo.banb[uiInfo.id - 1] = uiInfo.repeat;
3222  0040 cd0151        	call	LC018
3223  0043 c6000c        	ld	a,_uiInfo+12
3224  0046 d7003f        	ld	(_rcSubDataInfo+40,x),a
3225                     ; 802 	uiInfo.remote_mode[uiInfo.id - 1] = _disp_mode2;
3227  0049 cd0151        	call	LC018
3228  004c c60000        	ld	a,__disp_mode2
3229  004f d70045        	ld	(_uiInfo+69,x),a
3230                     ; 803 	uiInfo.tempCurr[uiInfo.id - 1] = uiInfo.tCurr;
3232  0052 cd0151        	call	LC018
3233  0055 c60002        	ld	a,_uiInfo+2
3234  0058 d70035        	ld	(_uiInfo+53,x),a
3235                     ; 804 	uiInfo.tempSetup[uiInfo.id - 1] = uiInfo.tSetup;
3237  005b cd0151        	call	LC018
3238  005e c6000e        	ld	a,_uiInfo+14
3239  0061 d7003d        	ld	(_uiInfo+61,x),a
3240                     ; 805 	uiInfo.remote_time[uiInfo.id - 1] = uiInfo.reserve;
3242  0064 cd0151        	call	LC018
3243  0067 c6000d        	ld	a,_uiInfo+13
3244  006a d7004d        	ld	(_uiInfo+77,x),a
3245                     ; 806 	uiInfo.remote_banb[uiInfo.id - 1] = uiInfo.repeat;
3247  006d cd0151        	call	LC018
3248  0070 c6000c        	ld	a,_uiInfo+12
3249  0073 d70055        	ld	(_uiInfo+85,x),a
3250                     ; 808 	if (ch == 0) {
3252  0076 7b01          	ld	a,(OFST-1,sp)
3253  0078 2603          	jrne	L7411
3254                     ; 810 		return 0xFF;
3256  007a 4a            	dec	a
3259  007b 85            	popw	x
3260  007c 81            	ret	
3261  007d               L7411:
3262                     ; 813 	num = 0xFF;
3264  007d a6ff          	ld	a,#255
3265  007f 6b01          	ld	(OFST-1,sp),a
3266                     ; 814 	for (i = 0 ; i < 8 ; i++) {
3268  0081 4f            	clr	a
3269  0082 6b02          	ld	(OFST+0,sp),a
3270  0084               L1511:
3271                     ; 815 		if (rcSubDataInfo.set_temp[i] == 0xAA) {
3273  0084 5f            	clrw	x
3274  0085 97            	ld	xl,a
3275  0086 d6001f        	ld	a,(_rcSubDataInfo+8,x)
3276  0089 a1aa          	cp	a,#170
3277  008b 2756          	jreq	L3511
3278                     ; 816 			continue;
3280                     ; 819 		if (uiInfo.remote_mode[i] != rcSubDataInfo.mode_heat[i]) {
3282  008d 7b02          	ld	a,(OFST+0,sp)
3283  008f cd0158        	call	LC019
3284  0092 90d60045      	ld	a,(_uiInfo+69,y)
3285  0096 d10027        	cp	a,(_rcSubDataInfo+16,x)
3286  0099 2706          	jreq	L1611
3287                     ; 820 			num = i;
3289  009b 7b02          	ld	a,(OFST+0,sp)
3290  009d 6b01          	ld	(OFST-1,sp),a
3291                     ; 821 			break;
3293  009f 204c          	jra	L5511
3294  00a1               L1611:
3295                     ; 824 		switch (rcSubDataInfo.mode_heat[i]) {
3297  00a1 7b02          	ld	a,(OFST+0,sp)
3298  00a3 5f            	clrw	x
3299  00a4 97            	ld	xl,a
3300  00a5 d60027        	ld	a,(_rcSubDataInfo+16,x)
3302                     ; 842 				break;
3303  00a8 4a            	dec	a
3304  00a9 270a          	jreq	L3111
3305  00ab a007          	sub	a,#7
3306  00ad 2722          	jreq	L1211
3307  00af a008          	sub	a,#8
3308  00b1 2710          	jreq	L7111
3309  00b3 202e          	jra	L3511
3310  00b5               L3111:
3311                     ; 825 			case RC_MODE_HEAT:
3311                     ; 826 				if (uiInfo.tempSetup[i] != rcSubDataInfo.set_temp[i]) {
3313  00b5 7b02          	ld	a,(OFST+0,sp)
3314  00b7 cd0158        	call	LC019
3315  00ba 90d6003d      	ld	a,(_uiInfo+61,y)
3316  00be d1001f        	cp	a,(_rcSubDataInfo+8,x)
3317                     ; 827 					num = i;
3318  00c1 201a          	jp	LC017
3319                     ; 830 			case RC_MODE_OUT:
3319                     ; 831 			case RC_MODE_STOP:
3319                     ; 832 				break;
3321  00c3               L7111:
3322                     ; 833 			case RC_MODE_REPEAT:
3322                     ; 834 				if (uiInfo.remote_banb[i] != rcSubDataInfo.banb[i]) {
3324  00c3 7b02          	ld	a,(OFST+0,sp)
3325  00c5 cd0158        	call	LC019
3326  00c8 90d60055      	ld	a,(_uiInfo+85,y)
3327  00cc d1003f        	cp	a,(_rcSubDataInfo+40,x)
3328                     ; 835 					num = i;
3329  00cf 200c          	jp	LC017
3330  00d1               L1211:
3331                     ; 838 			case RC_MODE_RESERVE:
3331                     ; 839 				if (uiInfo.remote_time[i] != rcSubDataInfo.time[i]) {
3333  00d1 7b02          	ld	a,(OFST+0,sp)
3334  00d3 cd0158        	call	LC019
3335  00d6 90d6004d      	ld	a,(_uiInfo+77,y)
3336  00da d10037        	cp	a,(_rcSubDataInfo+32,x)
3337                     ; 840 					num = i;
3339  00dd               LC017:
3340  00dd 2704          	jreq	L3511
3343  00df 7b02          	ld	a,(OFST+0,sp)
3344  00e1 6b01          	ld	(OFST-1,sp),a
3345  00e3               L3511:
3346                     ; 814 	for (i = 0 ; i < 8 ; i++) {
3348  00e3 0c02          	inc	(OFST+0,sp)
3351  00e5 7b02          	ld	a,(OFST+0,sp)
3352  00e7 a108          	cp	a,#8
3353  00e9 2599          	jrult	L1511
3354  00eb 7b01          	ld	a,(OFST-1,sp)
3355  00ed               L5511:
3356                     ; 846 	if (num == 0xFF) {
3358  00ed a1ff          	cp	a,#255
3359  00ef 260a          	jrne	L5711
3360                     ; 847 		ret_count = MAX_REPEAT_ERROR_COUNT;
3362  00f1 35050001      	mov	_ret_count,#5
3363                     ; 848 		cur_src = 0;
3365  00f5 725f0000      	clr	_cur_src
3366                     ; 849 		return num;
3369  00f9 2054          	jra	L402
3370  00fb               L5711:
3371                     ; 852 	if (cur_src == num) {
3373  00fb c60000        	ld	a,_cur_src
3374  00fe 1101          	cp	a,(OFST-1,sp)
3375  0100 2642          	jrne	L7711
3376                     ; 853 		ret_count--;
3378  0102 725a0001      	dec	_ret_count
3379                     ; 855 		if (ret_count == 0) {
3381  0106 2645          	jrne	L3021
3382                     ; 856 			rcSubDataInfo.mode_heat[num] = uiInfo.remote_mode[num];
3384  0108 7b01          	ld	a,(OFST-1,sp)
3385  010a 5f            	clrw	x
3386  010b 97            	ld	xl,a
3387  010c d60045        	ld	a,(_uiInfo+69,x)
3388  010f d70027        	ld	(_rcSubDataInfo+16,x),a
3389                     ; 857 			rcSubDataInfo.cur_temp[num] = uiInfo.tempCurr[num];
3391  0112 5f            	clrw	x
3392  0113 7b01          	ld	a,(OFST-1,sp)
3393  0115 97            	ld	xl,a
3394  0116 d60035        	ld	a,(_uiInfo+53,x)
3395  0119 d70017        	ld	(_rcSubDataInfo,x),a
3396                     ; 858 			rcSubDataInfo.set_temp[num] = uiInfo.tempSetup[num];
3398  011c 5f            	clrw	x
3399  011d 7b01          	ld	a,(OFST-1,sp)
3400  011f 97            	ld	xl,a
3401  0120 d6003d        	ld	a,(_uiInfo+61,x)
3402  0123 d7001f        	ld	(_rcSubDataInfo+8,x),a
3403                     ; 859 			rcSubDataInfo.time[num] = uiInfo.remote_time[num];
3405  0126 5f            	clrw	x
3406  0127 7b01          	ld	a,(OFST-1,sp)
3407  0129 97            	ld	xl,a
3408  012a d6004d        	ld	a,(_uiInfo+77,x)
3409  012d d70037        	ld	(_rcSubDataInfo+32,x),a
3410                     ; 860 			rcSubDataInfo.banb[num] = uiInfo.remote_banb[num];
3412  0130 5f            	clrw	x
3413  0131 7b01          	ld	a,(OFST-1,sp)
3414  0133 97            	ld	xl,a
3415  0134 d60055        	ld	a,(_uiInfo+85,x)
3416  0137 d7003f        	ld	(_rcSubDataInfo+40,x),a
3417                     ; 862 			ret_count = MAX_REPEAT_ERROR_COUNT;
3419  013a 35050001      	mov	_ret_count,#5
3420                     ; 863 			num = 0xFF;
3422  013e a6ff          	ld	a,#255
3423  0140 6b01          	ld	(OFST-1,sp),a
3424  0142 2009          	jra	L3021
3425  0144               L7711:
3426                     ; 866 		cur_src = num;
3428  0144 7b01          	ld	a,(OFST-1,sp)
3429  0146 c70000        	ld	_cur_src,a
3430                     ; 867 		ret_count = MAX_REPEAT_ERROR_COUNT;
3432  0149 35050001      	mov	_ret_count,#5
3433  014d               L3021:
3434                     ; 870 	return num;
3436  014d 7b01          	ld	a,(OFST-1,sp)
3438  014f               L402:
3440  014f 85            	popw	x
3441  0150 81            	ret	
3442  0151               LC018:
3443  0151 5f            	clrw	x
3444  0152 c60004        	ld	a,_uiInfo+4
3445  0155 97            	ld	xl,a
3446  0156 5a            	decw	x
3447  0157 81            	ret	
3448  0158               LC019:
3449  0158 5f            	clrw	x
3450  0159 97            	ld	xl,a
3451  015a 905f          	clrw	y
3452  015c 9097          	ld	yl,a
3453  015e 81            	ret	
3497                     ; 874 void rc_ptc_make_subRC(uint8_t *buf, uint8_t num) {
3498                     .text:	section	.text,new
3499  0000               _rc_ptc_make_subRC:
3501  0000 89            	pushw	x
3502       00000000      OFST:	set	0
3505                     ; 875 	buf[0] = BYTE_START_RC_SUBRC | num + 1;
3507  0001 7b05          	ld	a,(OFST+5,sp)
3508  0003 4c            	inc	a
3509  0004 1e01          	ldw	x,(OFST+1,sp)
3510  0006 aa60          	or	a,#96
3511  0008 f7            	ld	(x),a
3512                     ; 876 	buf[1] = uiInfo.remote_mode[num];
3514  0009 5f            	clrw	x
3515  000a 7b05          	ld	a,(OFST+5,sp)
3516  000c 97            	ld	xl,a
3517  000d d60045        	ld	a,(_uiInfo+69,x)
3518  0010 1e01          	ldw	x,(OFST+1,sp)
3519                     ; 877 	buf[2] = 0x00;
3521  0012 6f02          	clr	(2,x)
3522  0014 e701          	ld	(1,x),a
3523                     ; 878 	if (uiInfo.remote_mode[num] == RC_MODE_HEAT) {
3525  0016 5f            	clrw	x
3526  0017 7b05          	ld	a,(OFST+5,sp)
3527  0019 97            	ld	xl,a
3528  001a d60045        	ld	a,(_uiInfo+69,x)
3529  001d 4a            	dec	a
3530  001e 260d          	jrne	L5221
3531                     ; 879 		buf[3] = uiInfo.tempSetup[num];
3533  0020 7b05          	ld	a,(OFST+5,sp)
3534  0022 5f            	clrw	x
3535  0023 97            	ld	xl,a
3536  0024 d6003d        	ld	a,(_uiInfo+61,x)
3537  0027 1e01          	ldw	x,(OFST+1,sp)
3538  0029 e703          	ld	(3,x),a
3540  002b 2004          	jra	L7221
3541  002d               L5221:
3542                     ; 881 		buf[3] = 0x00;
3544  002d 1e01          	ldw	x,(OFST+1,sp)
3545  002f 6f03          	clr	(3,x)
3546  0031               L7221:
3547                     ; 884 	buf[4] = 0x00;
3549  0031 6f04          	clr	(4,x)
3550                     ; 886 	if (uiInfo.remote_mode[num] == RC_MODE_REPEAT) {
3552  0033 5f            	clrw	x
3553  0034 7b05          	ld	a,(OFST+5,sp)
3554  0036 97            	ld	xl,a
3555  0037 d60045        	ld	a,(_uiInfo+69,x)
3556  003a a110          	cp	a,#16
3557  003c 2609          	jrne	L1321
3558                     ; 887 		buf[5] = uiInfo.remote_banb[num];
3560  003e 7b05          	ld	a,(OFST+5,sp)
3561  0040 5f            	clrw	x
3562  0041 97            	ld	xl,a
3563  0042 d60055        	ld	a,(_uiInfo+85,x)
3565  0045 2012          	jp	LC020
3566  0047               L1321:
3567                     ; 888 	} else if(uiInfo.remote_mode[num] == RC_MODE_RESERVE){
3569  0047 7b05          	ld	a,(OFST+5,sp)
3570  0049 5f            	clrw	x
3571  004a 97            	ld	xl,a
3572  004b d60045        	ld	a,(_uiInfo+69,x)
3573  004e a108          	cp	a,#8
3574  0050 260d          	jrne	L5321
3575                     ; 889 		buf[5] = uiInfo.remote_time[num];
3577  0052 7b05          	ld	a,(OFST+5,sp)
3578  0054 5f            	clrw	x
3579  0055 97            	ld	xl,a
3580  0056 d6004d        	ld	a,(_uiInfo+77,x)
3581  0059               LC020:
3582  0059 1e01          	ldw	x,(OFST+1,sp)
3583  005b e705          	ld	(5,x),a
3585  005d 2004          	jra	L3321
3586  005f               L5321:
3587                     ; 891 		buf[5] = 0x00;
3589  005f 1e01          	ldw	x,(OFST+1,sp)
3590  0061 6f05          	clr	(5,x)
3591  0063               L3321:
3592                     ; 894 	buf[6] = 0x00;
3594  0063 6f06          	clr	(6,x)
3595                     ; 896 	makeChecksum(buf);
3597  0065 cd0000        	call	_makeChecksum
3599                     ; 897 }
3602  0068 85            	popw	x
3603  0069 81            	ret	
3642                     ; 899 void rc_ptc_make_error(uint8_t *buf) {
3643                     .text:	section	.text,new
3644  0000               _rc_ptc_make_error:
3646  0000 89            	pushw	x
3647       00000000      OFST:	set	0
3650                     ; 900 	buf[0] = BYTE_START_RC_ERROR | uiInfo.id;
3652  0001 c60004        	ld	a,_uiInfo+4
3653  0004 1e01          	ldw	x,(OFST+1,sp)
3654  0006 aae0          	or	a,#224
3655  0008 f7            	ld	(x),a
3656                     ; 901 	buf[1] = error;
3658  0009 c6000a        	ld	a,_error
3659  000c e701          	ld	(1,x),a
3660                     ; 902 	buf[2] = mode_recover;
3662  000e c60011        	ld	a,_mode_recover
3663  0011 e702          	ld	(2,x),a
3664                     ; 903 	buf[3] = 0x00;
3666  0013 6f03          	clr	(3,x)
3667                     ; 904 	buf[4] = 0x00;
3669  0015 6f04          	clr	(4,x)
3670                     ; 905 	buf[5] = 0x00;
3672  0017 6f05          	clr	(5,x)
3673                     ; 906 	buf[6] = 0x00;
3675  0019 6f06          	clr	(6,x)
3676                     ; 908 	makeChecksum(buf);
3678  001b cd0000        	call	_makeChecksum
3680                     ; 909 }
3683  001e 85            	popw	x
3684  001f 81            	ret	
3721                     ; 911 void rc_ptc_make_command(uint8_t *buf) {
3722                     .text:	section	.text,new
3723  0000               _rc_ptc_make_command:
3725  0000 89            	pushw	x
3726       00000000      OFST:	set	0
3729                     ; 912 	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
3731  0001 c60004        	ld	a,_uiInfo+4
3732  0004 1e01          	ldw	x,(OFST+1,sp)
3733  0006 aaf0          	or	a,#240
3734  0008 f7            	ld	(x),a
3735                     ; 913 	buf[1] = 0x20;
3737  0009 a620          	ld	a,#32
3738  000b e701          	ld	(1,x),a
3739                     ; 914 	buf[2] = 0x00;
3741  000d 6f02          	clr	(2,x)
3742                     ; 915 	buf[3] = 0x00;
3744  000f 6f03          	clr	(3,x)
3745                     ; 916 	buf[4] = 0x00;
3747  0011 6f04          	clr	(4,x)
3748                     ; 917 	buf[5] = 0x00;
3750  0013 6f05          	clr	(5,x)
3751                     ; 918 	buf[6] = 0x00;
3753  0015 6f06          	clr	(6,x)
3754                     ; 919 }
3757  0017 85            	popw	x
3758  0018 81            	ret	
3810                     ; 929 void rc_ptc_make_command_packet(uint8_t *buf, uint8_t cmd, uint8_t p1)
3810                     ; 930 {
3811                     .text:	section	.text,new
3812  0000               _rc_ptc_make_command_packet:
3814  0000 89            	pushw	x
3815       00000000      OFST:	set	0
3818                     ; 931 	rc_ptc_make_command(buf);
3820  0001 cd0000        	call	_rc_ptc_make_command
3822                     ; 932 	switch( cmd )
3824  0004 7b05          	ld	a,(OFST+5,sp)
3826                     ; 959 		break;
3827  0006 4a            	dec	a
3828  0007 270c          	jreq	L5721
3829  0009 a003          	sub	a,#3
3830  000b 270d          	jreq	L7721
3831  000d 4a            	dec	a
3832  000e 2710          	jreq	L1031
3833  0010 4a            	dec	a
3834  0011 2713          	jreq	L3031
3835  0013 201b          	jra	L1331
3836  0015               L5721:
3837                     ; 934 	case PKT_CMD_MIRROR:
3837                     ; 935 		buf[2] = COMMAND_MODE_MIRROR;
3839  0015 1e01          	ldw	x,(OFST+1,sp)
3840  0017 4c            	inc	a
3841                     ; 936 		buf[3] = p1;
3842                     ; 937 		break;
3844  0018 2010          	jp	LC021
3845  001a               L7721:
3846                     ; 948 	case PKT_CMD_FACTORY:
3846                     ; 949 		buf[2] = COMMAND_MODE_FACTORY;
3848  001a 1e01          	ldw	x,(OFST+1,sp)
3849  001c a608          	ld	a,#8
3850                     ; 950 		buf[3] = p1;
3851                     ; 951 		break;
3853  001e 200a          	jp	LC021
3854  0020               L1031:
3855                     ; 952 	case PKT_CMD_RESET:
3855                     ; 953 		buf[2] = COMMAND_MODE_RESET;
3857  0020 1e01          	ldw	x,(OFST+1,sp)
3858  0022 a604          	ld	a,#4
3859                     ; 954 		buf[3] = p1;
3860                     ; 955 		break;
3862  0024 2004          	jp	LC021
3863  0026               L3031:
3864                     ; 956 	case PKT_CMD_BOILER_HOT_MODE:
3864                     ; 957 		buf[2] = COMMAND_MODE_HOTWATER;
3866  0026 1e01          	ldw	x,(OFST+1,sp)
3867  0028 a602          	ld	a,#2
3868                     ; 958 		buf[3] = p1;
3870  002a               LC021:
3871  002a e702          	ld	(2,x),a
3875  002c 7b06          	ld	a,(OFST+6,sp)
3876  002e e703          	ld	(3,x),a
3877                     ; 959 		break;
3879  0030               L1331:
3880                     ; 962 	makeChecksum(buf);
3882  0030 1e01          	ldw	x,(OFST+1,sp)
3883  0032 cd0000        	call	_makeChecksum
3885                     ; 963 }
3888  0035 85            	popw	x
3889  0036 81            	ret	
3935                     ; 999 void rc_ptc_make_mirror(uint8_t *buf) {
3936                     .text:	section	.text,new
3937  0000               _rc_ptc_make_mirror:
3939  0000 89            	pushw	x
3940  0001 88            	push	a
3941       00000001      OFST:	set	1
3944                     ; 1001 	buf[0] = BYTE_START_RC_MIRROR | cur_mirror_page;
3946  0002 c60006        	ld	a,_cur_mirror_page
3947  0005 1e02          	ldw	x,(OFST+1,sp)
3948  0007 aa40          	or	a,#64
3949  0009 f7            	ld	(x),a
3950                     ; 1003 	mode = mode_mirror == 1 ? CNT_MODE_MAIN : CNT_MODE_SUB;
3952  000a c60013        	ld	a,_mode_mirror
3953  000d 4a            	dec	a
3954  000e 2702          	jreq	L232
3955  0010 a601          	ld	a,#1
3956  0012               L232:
3957  0012 6b01          	ld	(OFST+0,sp),a
3958                     ; 1004 	rc_ptc_make_baseSetting(buf, cur_mirror_page, mode);
3960  0014 88            	push	a
3961  0015 3b0006        	push	_cur_mirror_page
3962  0018 1e04          	ldw	x,(OFST+3,sp)
3963  001a cd0000        	call	_rc_ptc_make_baseSetting
3965  001d 85            	popw	x
3966                     ; 1006 	makeChecksum(buf);
3968  001e 1e02          	ldw	x,(OFST+1,sp)
3969  0020 cd0000        	call	_makeChecksum
3971                     ; 1008 	if (cur_mirror_page == 2) {
3973  0023 c60006        	ld	a,_cur_mirror_page
3974  0026 a102          	cp	a,#2
3975  0028 2608          	jrne	L3531
3976                     ; 1009 		cur_mirror_page = 0;
3978  002a 725f0006      	clr	_cur_mirror_page
3979                     ; 1010 		mode_mirror = 0;
3981  002e 725f0013      	clr	_mode_mirror
3982  0032               L3531:
3983                     ; 1012 }
3986  0032 5b03          	addw	sp,#3
3987  0034 81            	ret	
4045                     ; 1014 void rc_ptc_make(uint8_t *buf) {
4046                     .text:	section	.text,new
4047  0000               _rc_ptc_make:
4049  0000 89            	pushw	x
4050  0001 88            	push	a
4051       00000001      OFST:	set	1
4054                     ; 1018 	if (error != 0 && error_type != 0) {
4056  0002 c6000a        	ld	a,_error
4057  0005 2705          	jreq	L1041
4059  0007 c60009        	ld	a,_error_type
4060                     ; 1019 		rc_ptc_make_error(buf);
4062                     ; 1020 		return;
4064  000a 2608          	jrne	LC022
4065  000c               L1041:
4066                     ; 1022 		if (mode_recover == 1) {
4068  000c c60011        	ld	a,_mode_recover
4069  000f 4a            	dec	a
4070  0010 2608          	jrne	L3041
4071                     ; 1023 			rc_ptc_make_error(buf);
4073  0012 1e02          	ldw	x,(OFST+1,sp)
4074  0014               LC022:
4076  0014 cd0000        	call	_rc_ptc_make_error
4078                     ; 1024 			return;
4079  0017               L472:
4082  0017 5b03          	addw	sp,#3
4083  0019 81            	ret	
4084  001a               L3041:
4085                     ; 1028 	switch (uiInfo.mode) {
4087  001a c60008        	ld	a,_uiInfo+8
4089                     ; 1076 			break;
4090  001d 276a          	jreq	LC023
4091  001f 4a            	dec	a
4092  0020 26f5          	jrne	L472
4093                     ; 1029 		case SETTING_MODE_MASTER:
4093                     ; 1030 			
4093                     ; 1031 			if (getSettingChange() == 1) {
4095  0022 cd0000        	call	_getSettingChange
4097  0025 4a            	dec	a
4098  0026 2607          	jrne	L3141
4099                     ; 1032 				rc_ptc_make_setting(buf);
4101  0028 1e02          	ldw	x,(OFST+1,sp)
4102  002a cd0000        	call	_rc_ptc_make_setting
4104                     ; 1033 				return;
4106  002d 20e8          	jra	L472
4107  002f               L3141:
4108                     ; 1037 			if (mode_mirror != 0) {
4110  002f c60013        	ld	a,_mode_mirror
4111  0032 270d          	jreq	L5141
4112                     ; 1038 				rc_ptc_make_command_packet(buf, PKT_CMD_MIRROR, mode_mirror);
4114  0034 3b0013        	push	_mode_mirror
4115  0037 4b01          	push	#1
4116  0039 1e04          	ldw	x,(OFST+3,sp)
4117  003b cd0000        	call	_rc_ptc_make_command_packet
4119  003e 85            	popw	x
4120                     ; 1039 				return;
4122  003f 20d6          	jra	L472
4123  0041               L5141:
4124                     ; 1042 			if (mode_factory != 0) {
4126  0041 c60012        	ld	a,_mode_factory
4127  0044 2711          	jreq	L7141
4128                     ; 1044 				rc_ptc_make_command_packet(buf, PKT_CMD_FACTORY, mode_factory);
4130  0046 3b0012        	push	_mode_factory
4131  0049 4b04          	push	#4
4132  004b 1e04          	ldw	x,(OFST+3,sp)
4133  004d cd0000        	call	_rc_ptc_make_command_packet
4135  0050 725f0012      	clr	_mode_factory
4136  0054 85            	popw	x
4137                     ; 1045 				mode_factory = 0;
4139                     ; 1046 				return;
4141  0055 20c0          	jra	L472
4142  0057               L7141:
4143                     ; 1049 			if (mode_hotwater != 0) {
4145  0057 c60010        	ld	a,_mode_hotwater
4146  005a 270d          	jreq	L1241
4147                     ; 1051 				rc_ptc_make_command_packet(buf, PKT_CMD_BOILER_HOT_MODE, mode_hotwater);
4149  005c 3b0010        	push	_mode_hotwater
4150  005f 4b06          	push	#6
4151  0061 1e04          	ldw	x,(OFST+3,sp)
4152  0063 cd0000        	call	_rc_ptc_make_command_packet
4154  0066 85            	popw	x
4155                     ; 1052 				return;
4157  0067 20ae          	jra	L472
4158  0069               L1241:
4159                     ; 1055 			if (mode_reset != 0) {
4161  0069 c6000f        	ld	a,_mode_reset
4162  006c 270d          	jreq	L3241
4163                     ; 1057 				rc_ptc_make_command_packet(buf, PKT_CMD_RESET, mode_reset);
4165  006e 3b000f        	push	_mode_reset
4166  0071 4b05          	push	#5
4167  0073 1e04          	ldw	x,(OFST+3,sp)
4168  0075 cd0000        	call	_rc_ptc_make_command_packet
4170  0078 85            	popw	x
4171                     ; 1058 				return;
4173  0079 209c          	jra	L472
4174  007b               L3241:
4175                     ; 1062 			num = rc_ptc_check_subRC();
4177  007b cd0000        	call	_rc_ptc_check_subRC
4179  007e 6b01          	ld	(OFST+0,sp),a
4180                     ; 1063 			if ( num == 0xFF) {
4182  0080 4c            	inc	a
4183                     ; 1064 				rc_ptc_make_normal(buf);
4185                     ; 1065 				return;
4187  0081 2706          	jreq	LC023
4188                     ; 1068 			if (_remote == 1) {
4190  0083 c60000        	ld	a,__remote
4191  0086 4a            	dec	a
4192  0087 2607          	jrne	L7241
4193                     ; 1069 				rc_ptc_make_normal(buf);
4195  0089               LC023:
4198  0089 1e02          	ldw	x,(OFST+1,sp)
4199  008b cd0000        	call	_rc_ptc_make_normal
4202  008e 2087          	jra	L472
4203  0090               L7241:
4204                     ; 1071 				rc_ptc_make_subRC(buf, num);
4206  0090 7b01          	ld	a,(OFST+0,sp)
4207  0092 88            	push	a
4208  0093 1e03          	ldw	x,(OFST+2,sp)
4209  0095 cd0000        	call	_rc_ptc_make_subRC
4211  0098 84            	pop	a
4212  0099 cc0017        	jra	L472
4213                     ; 1074 		case SETTING_MODE_SUB:
4213                     ; 1075 			rc_ptc_make_normal(buf);
4215                     ; 1076 			break;
4217                     ; 1078 }
4261                     ; 1081 void func_rc_command(uint8_t com1, uint8_t com2) {
4262                     .text:	section	.text,new
4263  0000               _func_rc_command:
4265  0000 89            	pushw	x
4266       00000000      OFST:	set	0
4269                     ; 1082 	mode_mirror = 0;
4271  0001 725f0013      	clr	_mode_mirror
4272                     ; 1083 	mode_factory = 0;
4274  0005 725f0012      	clr	_mode_factory
4275                     ; 1084 	mode_hotwater = 0;
4277  0009 725f0010      	clr	_mode_hotwater
4278                     ; 1085 	mode_reset = 0;
4280  000d 725f000f      	clr	_mode_reset
4281                     ; 1087 	switch(com1) {
4283  0011 9e            	ld	a,xh
4285                     ; 1099 			break;
4286  0012 4a            	dec	a
4287  0013 270d          	jreq	L3341
4288  0015 4a            	dec	a
4289  0016 2711          	jreq	L5341
4290  0018 a002          	sub	a,#2
4291  001a 2714          	jreq	L7341
4292  001c a004          	sub	a,#4
4293  001e 2717          	jreq	L1441
4294  0020 201a          	jra	L3641
4295  0022               L3341:
4296                     ; 1088 		case COMMAND_MODE_MIRROR:
4296                     ; 1089 			mode_mirror = com2;
4298  0022 7b02          	ld	a,(OFST+2,sp)
4299  0024 c70013        	ld	_mode_mirror,a
4300                     ; 1090 			break;
4302  0027 2013          	jra	L3641
4303  0029               L5341:
4304                     ; 1091 		case COMMAND_MODE_HOTWATER:
4304                     ; 1092 			mode_hotwater = com2;
4306  0029 7b02          	ld	a,(OFST+2,sp)
4307  002b c70010        	ld	_mode_hotwater,a
4308                     ; 1093 			break;
4310  002e 200c          	jra	L3641
4311  0030               L7341:
4312                     ; 1094 		case COMMAND_MODE_RESET:
4312                     ; 1095 			mode_reset = com2;
4314  0030 7b02          	ld	a,(OFST+2,sp)
4315  0032 c7000f        	ld	_mode_reset,a
4316                     ; 1096 			break;
4318  0035 2005          	jra	L3641
4319  0037               L1441:
4320                     ; 1097 		case COMMAND_MODE_FACTORY:
4320                     ; 1098 			mode_factory = com2;
4322  0037 7b02          	ld	a,(OFST+2,sp)
4323  0039 c70012        	ld	_mode_factory,a
4324                     ; 1099 			break;
4326  003c               L3641:
4327                     ; 1101 }
4330  003c 85            	popw	x
4331  003d 81            	ret	
4364                     ; 1103 void func_rc_recover(uint8_t com) {
4365                     .text:	section	.text,new
4366  0000               _func_rc_recover:
4370                     ; 1104 	mode_recover = com;
4372  0000 c70011        	ld	_mode_recover,a
4373                     ; 1105 }
4376  0003 81            	ret	
4400                     ; 1107 void func_rc_setting(void) {
4401                     .text:	section	.text,new
4402  0000               _func_rc_setting:
4406                     ; 1108 	setSettingChange(1);
4408  0000 a601          	ld	a,#1
4410                     ; 1109 }
4413  0002 cc0000        	jp	_setSettingChange
4416                     	switch	.data
4417  0006               ___func_rc_settingCb:
4418  0006 00            	dc.b	0
4449                     ; 1113 void func_rc_settingCb(uint8_t ch) {
4450                     .text:	section	.text,new
4451  0000               _func_rc_settingCb:
4455                     ; 1114 	__func_rc_settingCb = ch;
4457  0000 c70006        	ld	___func_rc_settingCb,a
4458                     ; 1115 }
4461  0003 81            	ret	
4777                     	xdef	___func_rc_settingCb
4778                     	xdef	_rc_ptc_make_command_packet
4779                     	xdef	_rc_ptc_make_command
4780                     	xdef	_rc_ptc_make_error
4781                     	xdef	_rc_ptc_check_subRC
4782                     	xdef	_dr_out_count
4783                     	xdef	_rc_ptc_make_baseSetting
4784                     	xdef	_makeChecksum
4785                     	xdef	_rc_ptc_check_mirror
4786                     	xdef	_rc_ptc_check_subrc
4787                     	xdef	_rc_ptc_check_rc
4788                     	xdef	_rc_ptc_check_setting
4789                     	xdef	_rc_ptc_check_normal
4790                     	xdef	_rc_ptc_check_homenet
4791                     	xdef	_rc_ptc_check_master
4792                     	xdef	_only_one
4793                     	xdef	_dr_mode_out
4794                     	switch	.bss
4795  0000               _cur_src:
4796  0000 00            	ds.b	1
4797                     	xdef	_cur_src
4798  0001               _ret_count:
4799  0001 00            	ds.b	1
4800                     	xdef	_ret_count
4801  0002               _disp_mode_preview:
4802  0002 00            	ds.b	1
4803                     	xdef	_disp_mode_preview
4804  0003               __rcLED:
4805  0003 00            	ds.b	1
4806                     	xdef	__rcLED
4807  0004               _test_count:
4808  0004 00            	ds.b	1
4809                     	xdef	_test_count
4810  0005               _packet_changed:
4811  0005 00            	ds.b	1
4812                     	xdef	_packet_changed
4813  0006               _cur_mirror_page:
4814  0006 00            	ds.b	1
4815                     	xdef	_cur_mirror_page
4816  0007               _cur_set_page:
4817  0007 00            	ds.b	1
4818                     	xdef	_cur_set_page
4819  0008               __version:
4820  0008 00            	ds.b	1
4821                     	xdef	__version
4822  0009               _error_type:
4823  0009 00            	ds.b	1
4824                     	xdef	_error_type
4825  000a               _error:
4826  000a 00            	ds.b	1
4827                     	xdef	_error
4828                     	xdef	_debug_br
4829                     	xdef	_debug_hn
4830  000b               _state_check:
4831  000b 00            	ds.b	1
4832                     	xdef	_state_check
4833                     	xref	__backup_backlight
4834                     	xref	_packet_buf
4835                     	xref	__boiler_fire
4836                     	xref	__boiler_type
4837                     	xref	__timFlag
4838                     	xref	__remote
4839  000c               __rcInfo:
4840  000c 0000          	ds.b	2
4841                     	xdef	__rcInfo
4842                     	xref	_lcd_disp_rid_hw
4843                     	xref	__boiler_water_heat
4844                     	xref	__boiler_water_shower
4845                     	xref	___boiler_shower
4846                     	xref	__updateCount
4847                     	xref	__updateBit
4848                     	xref	__updateTimer
4849                     	xref	__disp_mode2
4850                     	xref	_lcd_disp_rid
4851                     	xref	_uiInfo
4852                     	xdef	_rcInfoSet
4853                     	xdef	_get_rcInfo
4854                     	xdef	___rc_max
4855                     	xdef	_func_rc_settingCb
4856                     	xdef	_func_rc_setting
4857                     	xdef	_func_rc_recover
4858                     	xdef	_func_rc_command
4859                     	xdef	_rc_ptc_make_mirror
4860                     	xdef	_rc_ptc_make
4861                     	xdef	_rc_ptc_make_subRC
4862                     	xdef	_rc_ptc_make_setting
4863                     	xdef	_rc_ptc_make_normal
4864                     	xdef	_setState_check
4865                     	xdef	_getState_check
4866                     	xdef	_getSettingChange
4867                     	xdef	_setSettingChange
4868                     	xdef	_rc_ptc_check
4869                     	xdef	_rc_ptc_baseSet
4870                     	xdef	_getHexToBin
4871  000e               _set_changed:
4872  000e 00            	ds.b	1
4873                     	xdef	_set_changed
4874  000f               _mode_reset:
4875  000f 00            	ds.b	1
4876                     	xdef	_mode_reset
4877  0010               _mode_hotwater:
4878  0010 00            	ds.b	1
4879                     	xdef	_mode_hotwater
4880  0011               _mode_recover:
4881  0011 00            	ds.b	1
4882                     	xdef	_mode_recover
4883  0012               _mode_factory:
4884  0012 00            	ds.b	1
4885                     	xdef	_mode_factory
4886  0013               _mode_mirror:
4887  0013 00            	ds.b	1
4888                     	xdef	_mode_mirror
4889  0014               _boiler_info:
4890  0014 000000        	ds.b	3
4891                     	xdef	_boiler_info
4892  0017               _rcSubDataInfo:
4893  0017 000000000000  	ds.b	48
4894                     	xdef	_rcSubDataInfo
4895                     	xref	_file_read
4896                     	xref	_disp_char
4897                     	xref	___timer1s
4917                     	end
