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
 643  0005               ___rc_s:
 644  0005 00            	dc.b	0
 705                     ; 183 void rc_ptc_check_normal(uint8_t *buf) {
 706                     .text:	section	.text,new
 707  0000               _rc_ptc_check_normal:
 709  0000 89            	pushw	x
 710  0001 88            	push	a
 711       00000001      OFST:	set	1
 714                     ; 184 	uint8_t start = buf[0] & 0x0F;
 716  0002 f6            	ld	a,(x)
 717  0003 a40f          	and	a,#15
 718  0005 6b01          	ld	(OFST+0,sp),a
 719                     ; 186 	if (start == 0x0F) {
 721  0007 a10f          	cp	a,#15
 722  0009 2607          	jrne	L542
 723                     ; 187 		state_check = RC_STATE_FACTORY;
 725  000b 3505000b      	mov	_state_check,#5
 726                     ; 188 		return;
 728  000f cc0147        	jra	L631
 729  0012               L542:
 730                     ; 191 	if (start == 0x01 || start == 0x09) {
 732  0012 a101          	cp	a,#1
 733  0014 2704          	jreq	L152
 735  0016 a109          	cp	a,#9
 736  0018 2604          	jrne	L742
 737  001a               L152:
 738                     ; 192 		only_one = 0;
 740  001a 725f0003      	clr	_only_one
 741  001e               L742:
 742                     ; 200 	if( __rc_s == 0 )
 744  001e c60005        	ld	a,___rc_s
 745  0021 261c          	jrne	L352
 746                     ; 202 		__rc_s = start==1 ? 1 : 0;
 748  0023 7b01          	ld	a,(OFST+0,sp)
 749  0025 4a            	dec	a
 750  0026 2603          	jrne	L64
 751  0028 4c            	inc	a
 752  0029 2001          	jra	L05
 753  002b               L64:
 754  002b 4f            	clr	a
 755  002c               L05:
 756  002c c70005        	ld	___rc_s,a
 757                     ; 203 		if( start==9 )	__rc_max = 1;
 759  002f 7b01          	ld	a,(OFST+0,sp)
 760  0031 a109          	cp	a,#9
 761  0033 2703cc0117    	jrne	L752
 764  0038 35010004      	mov	___rc_max,#1
 765  003c cc0117        	jra	L752
 766  003f               L352:
 767                     ; 205 	else if( __rc_s == 1 )
 769  003f a101          	cp	a,#1
 770  0041 261b          	jrne	L162
 771                     ; 207 		__rc_s = start==2 ? 2 : 0;
 773  0043 7b01          	ld	a,(OFST+0,sp)
 774  0045 a102          	cp	a,#2
 775  0047 2604          	jrne	L25
 776  0049 a602          	ld	a,#2
 777  004b 2001          	jra	L45
 778  004d               L25:
 779  004d 4f            	clr	a
 780  004e               L45:
 781  004e c70005        	ld	___rc_s,a
 782                     ; 208 		if( start==9 )	__rc_max = 1;
 784  0051 7b01          	ld	a,(OFST+0,sp)
 785  0053 a109          	cp	a,#9
 786  0055 26e5          	jrne	L752
 789  0057 35010004      	mov	___rc_max,#1
 790  005b cc0117        	jra	L752
 791  005e               L162:
 792                     ; 210 	else if( __rc_s == 2 )
 794  005e a102          	cp	a,#2
 795  0060 261b          	jrne	L762
 796                     ; 212 		__rc_s = start==3 ? 3 : 0;
 798  0062 7b01          	ld	a,(OFST+0,sp)
 799  0064 a103          	cp	a,#3
 800  0066 2604          	jrne	L65
 801  0068 a603          	ld	a,#3
 802  006a 2001          	jra	L06
 803  006c               L65:
 804  006c 4f            	clr	a
 805  006d               L06:
 806  006d c70005        	ld	___rc_s,a
 807                     ; 213 		if( start==9 )	__rc_max = 2;
 809  0070 7b01          	ld	a,(OFST+0,sp)
 810  0072 a109          	cp	a,#9
 811  0074 26e5          	jrne	L752
 814  0076 35020004      	mov	___rc_max,#2
 815  007a cc0117        	jra	L752
 816  007d               L762:
 817                     ; 215 	else if( __rc_s == 3 )
 819  007d a103          	cp	a,#3
 820  007f 261a          	jrne	L572
 821                     ; 217 		__rc_s = start==4 ? 4 : 0;
 823  0081 7b01          	ld	a,(OFST+0,sp)
 824  0083 a104          	cp	a,#4
 825  0085 2604          	jrne	L26
 826  0087 a604          	ld	a,#4
 827  0089 2001          	jra	L46
 828  008b               L26:
 829  008b 4f            	clr	a
 830  008c               L46:
 831  008c c70005        	ld	___rc_s,a
 832                     ; 218 		if( start==9 )	__rc_max = 3;
 834  008f 7b01          	ld	a,(OFST+0,sp)
 835  0091 a109          	cp	a,#9
 836  0093 26e5          	jrne	L752
 839  0095 35030004      	mov	___rc_max,#3
 840  0099 207c          	jra	L752
 841  009b               L572:
 842                     ; 220 	else if( __rc_s == 4 )
 844  009b a104          	cp	a,#4
 845  009d 261a          	jrne	L303
 846                     ; 222 		__rc_s = start==5 ? 5 : 0;
 848  009f 7b01          	ld	a,(OFST+0,sp)
 849  00a1 a105          	cp	a,#5
 850  00a3 2604          	jrne	L66
 851  00a5 a605          	ld	a,#5
 852  00a7 2001          	jra	L07
 853  00a9               L66:
 854  00a9 4f            	clr	a
 855  00aa               L07:
 856  00aa c70005        	ld	___rc_s,a
 857                     ; 223 		if( start==9 )	__rc_max = 4;
 859  00ad 7b01          	ld	a,(OFST+0,sp)
 860  00af a109          	cp	a,#9
 861  00b1 2664          	jrne	L752
 864  00b3 35040004      	mov	___rc_max,#4
 865  00b7 205e          	jra	L752
 866  00b9               L303:
 867                     ; 225 	else if( __rc_s == 5 )
 869  00b9 a105          	cp	a,#5
 870  00bb 261a          	jrne	L113
 871                     ; 227 		__rc_s = start==6 ? 6 : 0;
 873  00bd 7b01          	ld	a,(OFST+0,sp)
 874  00bf a106          	cp	a,#6
 875  00c1 2604          	jrne	L27
 876  00c3 a606          	ld	a,#6
 877  00c5 2001          	jra	L47
 878  00c7               L27:
 879  00c7 4f            	clr	a
 880  00c8               L47:
 881  00c8 c70005        	ld	___rc_s,a
 882                     ; 228 		if( start==9 )	__rc_max = 5;
 884  00cb 7b01          	ld	a,(OFST+0,sp)
 885  00cd a109          	cp	a,#9
 886  00cf 2646          	jrne	L752
 889  00d1 35050004      	mov	___rc_max,#5
 890  00d5 2040          	jra	L752
 891  00d7               L113:
 892                     ; 230 	else if( __rc_s == 6 )
 894  00d7 a106          	cp	a,#6
 895  00d9 261a          	jrne	L713
 896                     ; 232 		__rc_s = start==7 ? 7 : 0;
 898  00db 7b01          	ld	a,(OFST+0,sp)
 899  00dd a107          	cp	a,#7
 900  00df 2604          	jrne	L67
 901  00e1 a607          	ld	a,#7
 902  00e3 2001          	jra	L001
 903  00e5               L67:
 904  00e5 4f            	clr	a
 905  00e6               L001:
 906  00e6 c70005        	ld	___rc_s,a
 907                     ; 233 		if( start==9 )	__rc_max = 6;
 909  00e9 7b01          	ld	a,(OFST+0,sp)
 910  00eb a109          	cp	a,#9
 911  00ed 2628          	jrne	L752
 914  00ef 35060004      	mov	___rc_max,#6
 915  00f3 2022          	jra	L752
 916  00f5               L713:
 917                     ; 235 	else if( __rc_s == 7 )
 919  00f5 a107          	cp	a,#7
 920  00f7 2610          	jrne	L523
 921                     ; 237 		__rc_s = start==8 ? 8 : 0;
 923  00f9 7b01          	ld	a,(OFST+0,sp)
 924  00fb a108          	cp	a,#8
 925  00fd 2604          	jrne	L201
 926  00ff a608          	ld	a,#8
 927  0101 2001          	jra	L401
 928  0103               L201:
 929  0103 4f            	clr	a
 930  0104               L401:
 931  0104 c70005        	ld	___rc_s,a
 932                     ; 238 		if( start==9 )	__rc_max = 7;
 934  0107 2004          	jp	LC001
 935  0109               L523:
 936                     ; 240 	else if( __rc_s == 8 )
 938  0109 a108          	cp	a,#8
 939  010b 260a          	jrne	L752
 940                     ; 243 		if( start==9 )	__rc_max = 7;
 944  010d               LC001:
 946  010d 7b01          	ld	a,(OFST+0,sp)
 947  010f a109          	cp	a,#9
 948  0111 2604          	jrne	L752
 950  0113 35070004      	mov	___rc_max,#7
 951  0117               L752:
 952                     ; 246 	if( start==9 )
 954  0117 7b01          	ld	a,(OFST+0,sp)
 955  0119 a109          	cp	a,#9
 956  011b 2604          	jrne	L733
 957                     ; 248 		__rc_s = 0;
 959  011d 725f0005      	clr	___rc_s
 960  0121               L733:
 961                     ; 251 	if (start == uiInfo.id) {
 963  0121 c10004        	cp	a,_uiInfo+4
 964  0124 260d          	jrne	L143
 965                     ; 252 		packet_buf[start - 1] = 0;
 967  0126 5f            	clrw	x
 968  0127 97            	ld	xl,a
 969  0128 5a            	decw	x
 970                     ; 253 		state_check = RC_STATE_NORMAL;
 972  0129 3501000b      	mov	_state_check,#1
 973  012d 724f0000      	clr	(_packet_buf,x)
 975  0131 2004          	jra	L343
 976  0133               L143:
 977                     ; 255 		state_check = RC_STATE_NONE;
 979  0133 725f000b      	clr	_state_check
 980  0137               L343:
 981                     ; 258 	if (start == 0x09 ) {
 983  0137 a109          	cp	a,#9
 984  0139 260f          	jrne	L543
 985                     ; 259 		debug_hn = buf[2];
 987  013b 1e02          	ldw	x,(OFST+1,sp)
 988  013d e602          	ld	a,(2,x)
 989  013f c70000        	ld	_debug_hn,a
 990                     ; 260 		debug_br = buf[1];
 992  0142 e601          	ld	a,(1,x)
 993  0144 c70001        	ld	_debug_br,a
 994                     ; 261 		return;
 995  0147               L631:
 998  0147 5b03          	addw	sp,#3
 999  0149 81            	ret	
1000  014a               L543:
1001                     ; 264 	if (uiInfo.mode == SETTING_MODE_MASTER) {
1003  014a c60008        	ld	a,_uiInfo+8
1004  014d 4a            	dec	a
1005  014e 2605          	jrne	L743
1006                     ; 265 		rc_ptc_check_master(buf);
1008  0150 1e02          	ldw	x,(OFST+1,sp)
1009  0152 cd0000        	call	_rc_ptc_check_master
1011  0155               L743:
1012                     ; 268 	if ( _remote == 0 && _backup_backlight == 0) {
1014  0155 c60000        	ld	a,__remote
1015  0158 2662          	jrne	L153
1017  015a c60000        	ld	a,__backup_backlight
1018  015d 265d          	jrne	L153
1019                     ; 269 		if (getHexToBin(buf[6], 7) == 0) {
1021  015f 1602          	ldw	y,(OFST+1,sp)
1022  0161 ae0007        	ldw	x,#7
1023  0164 90e606        	ld	a,(6,y)
1024  0167 95            	ld	xh,a
1025  0168 cd0000        	call	_getHexToBin
1027  016b 4d            	tnz	a
1028  016c 264e          	jrne	L153
1029                     ; 270 			_rcLED = buf[1];
1031  016e 1e02          	ldw	x,(OFST+1,sp)
1032  0170 e601          	ld	a,(1,x)
1033  0172 c70003        	ld	__rcLED,a
1034                     ; 272 			if (getHexToBin(buf[1], uiInfo.id - 1) == 1) {
1036  0175 c60004        	ld	a,_uiInfo+4
1037  0178 4a            	dec	a
1038  0179 1602          	ldw	y,(OFST+1,sp)
1039  017b 97            	ld	xl,a
1040  017c 90e601        	ld	a,(1,y)
1041  017f 95            	ld	xh,a
1042  0180 cd0000        	call	_getHexToBin
1044  0183 4a            	dec	a
1045  0184 261a          	jrne	L553
1046                     ; 277 				lcd_disp_rid(uiInfo.id, 1, (uiInfo.mode == SETTING_MODE_MASTER) ? 1 : 0);
1048  0186 c60008        	ld	a,_uiInfo+8
1049  0189 4a            	dec	a
1050  018a 2603          	jrne	L611
1051  018c 4c            	inc	a
1052  018d 2001          	jra	L021
1053  018f               L611:
1054  018f 4f            	clr	a
1055  0190               L021:
1056  0190 88            	push	a
1057  0191 ae0001        	ldw	x,#1
1058  0194 c60004        	ld	a,_uiInfo+4
1059  0197 95            	ld	xh,a
1060  0198 cd0000        	call	_lcd_disp_rid
1062  019b ae0001        	ldw	x,#1
1063                     ; 281 				lcd_disp_rid_hw(uiInfo.id, 1);
1066  019e 2014          	jp	LC003
1067  01a0               L553:
1068                     ; 288 				lcd_disp_rid(uiInfo.id, 0, (uiInfo.mode == SETTING_MODE_MASTER) ? 1 : 0);
1070  01a0 c60008        	ld	a,_uiInfo+8
1071  01a3 4a            	dec	a
1072  01a4 2603          	jrne	L621
1073  01a6 4c            	inc	a
1074  01a7 2001          	jra	L031
1075  01a9               L621:
1076  01a9 4f            	clr	a
1077  01aa               L031:
1078  01aa 88            	push	a
1079  01ab 5f            	clrw	x
1080  01ac c60004        	ld	a,_uiInfo+4
1081  01af 95            	ld	xh,a
1082  01b0 cd0000        	call	_lcd_disp_rid
1084  01b3 5f            	clrw	x
1085                     ; 292 				lcd_disp_rid_hw(uiInfo.id, 0);
1087  01b4               LC003:
1088  01b4 84            	pop	a
1090  01b5 c60004        	ld	a,_uiInfo+4
1091  01b8 95            	ld	xh,a
1092  01b9 cd0000        	call	_lcd_disp_rid_hw
1094  01bc               L153:
1095                     ; 298 	rc_ptc_check_homenet(buf);
1097  01bc 1e02          	ldw	x,(OFST+1,sp)
1098  01be cd0000        	call	_rc_ptc_check_homenet
1100                     ; 300 	_version = buf[6] >> 1;
1102  01c1 1e02          	ldw	x,(OFST+1,sp)
1103  01c3 e606          	ld	a,(6,x)
1104  01c5 44            	srl	a
1105  01c6 c70008        	ld	__version,a
1106                     ; 302 	if (mode_recover == 0) {
1108  01c9 c60011        	ld	a,_mode_recover
1109  01cc 2613          	jrne	L163
1110                     ; 303 		error_type = (buf[4] & 0x0F) >> 2;
1112  01ce e604          	ld	a,(4,x)
1113  01d0 a40c          	and	a,#12
1114  01d2 44            	srl	a
1115  01d3 44            	srl	a
1116  01d4 c70009        	ld	_error_type,a
1117                     ; 305 		if (error_type != 0) {
1119  01d7 2702          	jreq	L363
1120                     ; 306 			error = buf[5];
1122  01d9 e605          	ld	a,(5,x)
1124  01db               L363:
1125                     ; 308 			error = 0;
1127  01db c7000a        	ld	_error,a
1128  01de cc0147        	jra	L631
1129  01e1               L163:
1130                     ; 311 		if (((buf[4]& 0x0F) >> 2) == 0 && buf[5] == 0) {
1132  01e1 e604          	ld	a,(4,x)
1133  01e3 a40c          	and	a,#12
1134  01e5 44            	srl	a
1135  01e6 44            	srl	a
1136  01e7 5f            	clrw	x
1137  01e8 97            	ld	xl,a
1138  01e9 5d            	tnzw	x
1139  01ea 26f2          	jrne	L631
1141  01ec 1e02          	ldw	x,(OFST+1,sp)
1142  01ee e605          	ld	a,(5,x)
1143  01f0 26ec          	jrne	L631
1144                     ; 312 			error_type = 0;
1146  01f2 c70009        	ld	_error_type,a
1147                     ; 313 			error = 0;
1149  01f5 c7000a        	ld	_error,a
1150                     ; 314 			mode_recover = 0;
1152  01f8 c70011        	ld	_mode_recover,a
1153                     ; 321 }
1155  01fb cc0147        	jra	L631
1203                     ; 324 void rc_ptc_check_setting(uint8_t *buf) {
1204                     .text:	section	.text,new
1205  0000               _rc_ptc_check_setting:
1207  0000 88            	push	a
1208       00000001      OFST:	set	1
1211                     ; 325 	uint8_t page = buf[0] & 0x0F;
1213  0001 f6            	ld	a,(x)
1214  0002 a40f          	and	a,#15
1215  0004 6b01          	ld	(OFST+0,sp),a
1216                     ; 327 	if (uiInfo.mode != SETTING_MODE_MASTER) {
1218  0006 c60008        	ld	a,_uiInfo+8
1219  0009 4a            	dec	a
1220  000a 2702          	jreq	L314
1221                     ; 328 		return;
1224  000c 84            	pop	a
1225  000d 81            	ret	
1226  000e               L314:
1227                     ; 331 	state_check = RC_STATE_SETTING;
1229  000e 3502000b      	mov	_state_check,#2
1230                     ; 333 	if (cur_set_page == page) {
1232  0012 c60007        	ld	a,_cur_set_page
1233  0015 1101          	cp	a,(OFST+0,sp)
1234  0017 2607          	jrne	L514
1235                     ; 334 		cur_set_page++;
1237  0019 725c0007      	inc	_cur_set_page
1238  001d c60007        	ld	a,_cur_set_page
1239  0020               L514:
1240                     ; 337 	if (cur_set_page == MAX_SETTING_PAGE) { 
1242  0020 a103          	cp	a,#3
1243  0022 2613          	jrne	L714
1244                     ; 338 		set_changed = 0;
1246  0024 725f000e      	clr	_set_changed
1247                     ; 339 		cur_set_page = 0;
1249  0028 725f0007      	clr	_cur_set_page
1250                     ; 341 		func_rc_settingCb(1);
1252  002c a601          	ld	a,#1
1253  002e cd0000        	call	_func_rc_settingCb
1255                     ; 342 		state_check = RC_STATE_NORMAL;
1257  0031 3501000b      	mov	_state_check,#1
1259  0035 2004          	jra	L124
1260  0037               L714:
1261                     ; 344 		func_rc_settingCb(0);
1263  0037 4f            	clr	a
1264  0038 cd0000        	call	_func_rc_settingCb
1266  003b               L124:
1267                     ; 346 }
1270  003b 84            	pop	a
1271  003c 81            	ret	
1329                     ; 349 void rc_ptc_check_rc(uint8_t *buf) {
1330                     .text:	section	.text,new
1331  0000               _rc_ptc_check_rc:
1333  0000 89            	pushw	x
1334  0001 89            	pushw	x
1335       00000002      OFST:	set	2
1338                     ; 353 	st = (buf[0] & 0x0F) - 1;
1340  0002 f6            	ld	a,(x)
1341  0003 a40f          	and	a,#15
1342  0005 4a            	dec	a
1343  0006 6b02          	ld	(OFST+0,sp),a
1344                     ; 355 	if (uiInfo.mode != SETTING_MODE_MASTER) {
1346  0008 c60008        	ld	a,_uiInfo+8
1347  000b 4a            	dec	a
1348  000c 273f          	jreq	L174
1349                     ; 356 		if (st == 0) {
1351  000e 7b02          	ld	a,(OFST+0,sp)
1352  0010 2703cc00b0    	jrne	L651
1353                     ; 357 			if (buf[1] == RC_MODE_OUT && (buf[5] & 0x01)  == 0) {
1355  0015 e601          	ld	a,(1,x)
1356  0017 a102          	cp	a,#2
1357  0019 260e          	jrne	L574
1359  001b e605          	ld	a,(5,x)
1360  001d a501          	bcp	a,#1
1361  001f 2608          	jrne	L574
1362                     ; 358 				_disp_mode2 = RC_MODE_OUT;
1364  0021 35020000      	mov	__disp_mode2,#2
1365                     ; 359 				dr_mode_out = 0;
1367  0025 725f0002      	clr	_dr_mode_out
1368  0029               L574:
1369                     ; 367 			if (dr_mode_out == 0) {
1371  0029 c60002        	ld	a,_dr_mode_out
1372  002c 26e4          	jrne	L651
1373                     ; 368 				if (_disp_mode2 == RC_MODE_OUT) {
1375  002e c60000        	ld	a,__disp_mode2
1376  0031 a102          	cp	a,#2
1377  0033 267b          	jrne	L651
1378                     ; 369 					if (buf[1] != RC_MODE_OUT) {
1380  0035 1e03          	ldw	x,(OFST+1,sp)
1381  0037 e601          	ld	a,(1,x)
1382  0039 a102          	cp	a,#2
1383  003b 2705          	jreq	L305
1384                     ; 370 						packet_changed = 1;
1386  003d cd016c        	call	LC007
1387                     ; 372 						_disp_mode2 = FW_GET_DISPMODE;
1388  0040 206e          	jra	L651
1389  0042               L305:
1390                     ; 374 						if((buf[5] & 0x01) != 0)  {
1392  0042 e605          	ld	a,(5,x)
1393  0044 a501          	bcp	a,#1
1394  0046 2768          	jreq	L651
1395                     ; 375 							packet_changed = 1;
1397  0048 cd016c        	call	LC007
1398                     ; 383 		return;
1400  004b 2063          	jra	L651
1401  004d               L174:
1402                     ; 386 	k = 0;
1404  004d 6b01          	ld	(OFST-1,sp),a
1405                     ; 388 	packet_buf[st] = 0;
1407  004f 5f            	clrw	x
1408  0050 7b02          	ld	a,(OFST+0,sp)
1409  0052 97            	ld	xl,a
1410  0053 724f0000      	clr	(_packet_buf,x)
1411                     ; 390 	if (_remote == 0) {
1413  0057 725d0000      	tnz	__remote
1414  005b 2703cc013b    	jrne	L115
1415                     ; 391 		if (rcSubDataInfo.mode_heat[st] == 0xFF) {
1417  0060 5f            	clrw	x
1418  0061 97            	ld	xl,a
1419  0062 d60027        	ld	a,(_rcSubDataInfo+16,x)
1420  0065 4c            	inc	a
1421  0066 264b          	jrne	L315
1422                     ; 392 			if (uiInfo.remote_mode[st] != buf[1]) {
1424  0068 7b02          	ld	a,(OFST+0,sp)
1425  006a 5f            	clrw	x
1426  006b 97            	ld	xl,a
1427  006c d60045        	ld	a,(_uiInfo+69,x)
1428  006f 1e03          	ldw	x,(OFST+1,sp)
1429  0071 e101          	cp	a,(1,x)
1430                     ; 393 				k = 1;
1432  0073 2632          	jrne	LC004
1433                     ; 396 				switch (buf[1]) {
1435  0075 e601          	ld	a,(1,x)
1437                     ; 415 						break;
1438  0077 4a            	dec	a
1439  0078 270a          	jreq	L324
1440  007a a007          	sub	a,#7
1441  007c 2713          	jreq	L134
1442  007e a008          	sub	a,#8
1443  0080 2718          	jreq	L334
1444  0082 2027          	jra	L715
1445  0084               L324:
1446                     ; 397 					case RC_MODE_HEAT:
1446                     ; 398 						if (uiInfo.tempSetup[st] != buf[3]) {
1448  0084 7b02          	ld	a,(OFST+0,sp)
1449  0086 5f            	clrw	x
1450  0087 97            	ld	xl,a
1451  0088 d6003d        	ld	a,(_uiInfo+61,x)
1452  008b 1e03          	ldw	x,(OFST+1,sp)
1453  008d e103          	cp	a,(3,x)
1454                     ; 399 							k = 1;
1455  008f 2014          	jp	LC005
1456                     ; 402 					case RC_MODE_OUT:
1456                     ; 403 						break;
1458                     ; 404 					case RC_MODE_STOP:
1458                     ; 405 						break;
1460  0091               L134:
1461                     ; 406 					case RC_MODE_RESERVE:
1461                     ; 407 						if (uiInfo.remote_time[st] != buf[5]) {
1463  0091 7b02          	ld	a,(OFST+0,sp)
1464  0093 5f            	clrw	x
1465  0094 97            	ld	xl,a
1466  0095 d6004d        	ld	a,(_uiInfo+77,x)
1467                     ; 408 							k = 1;
1468  0098 2007          	jp	LC006
1469  009a               L334:
1470                     ; 411 					case RC_MODE_REPEAT:
1470                     ; 412 						if (uiInfo.remote_banb[st] != buf[5]) {
1472  009a 7b02          	ld	a,(OFST+0,sp)
1473  009c 5f            	clrw	x
1474  009d 97            	ld	xl,a
1475  009e d60055        	ld	a,(_uiInfo+85,x)
1476  00a1               LC006:
1477  00a1 1e03          	ldw	x,(OFST+1,sp)
1478  00a3 e105          	cp	a,(5,x)
1479  00a5               LC005:
1480  00a5 2704          	jreq	L715
1481                     ; 413 							k = 1;
1483  00a7               LC004:
1487  00a7 a601          	ld	a,#1
1488  00a9 6b01          	ld	(OFST-1,sp),a
1489  00ab               L715:
1490                     ; 419 			if (k == 1) {
1492  00ab 7b01          	ld	a,(OFST-1,sp)
1493  00ad 4a            	dec	a
1494  00ae 2603          	jrne	L315
1495                     ; 420 				return;
1496  00b0               L651:
1499  00b0 5b04          	addw	sp,#4
1500  00b2 81            	ret	
1501  00b3               L315:
1502                     ; 424 		rcSubDataInfo.mode_heat[st] = buf[1];
1504  00b3 7b02          	ld	a,(OFST+0,sp)
1505  00b5 5f            	clrw	x
1506  00b6 1603          	ldw	y,(OFST+1,sp)
1507  00b8 97            	ld	xl,a
1508  00b9 90e601        	ld	a,(1,y)
1509  00bc d70027        	ld	(_rcSubDataInfo+16,x),a
1510                     ; 425 		rcSubDataInfo.cur_temp[st] = buf[2];
1512  00bf 5f            	clrw	x
1513  00c0 7b02          	ld	a,(OFST+0,sp)
1514  00c2 97            	ld	xl,a
1515  00c3 90e602        	ld	a,(2,y)
1516  00c6 d70017        	ld	(_rcSubDataInfo,x),a
1517                     ; 427 		uiInfo.remote_mode[st] = buf[1];
1519  00c9 5f            	clrw	x
1520  00ca 7b02          	ld	a,(OFST+0,sp)
1521  00cc 97            	ld	xl,a
1522  00cd 90e601        	ld	a,(1,y)
1523  00d0 d70045        	ld	(_uiInfo+69,x),a
1524                     ; 428 		uiInfo.tempCurr[st] = buf[2];
1526  00d3 5f            	clrw	x
1527  00d4 7b02          	ld	a,(OFST+0,sp)
1528  00d6 97            	ld	xl,a
1529  00d7 90e602        	ld	a,(2,y)
1530  00da d70035        	ld	(_uiInfo+53,x),a
1531                     ; 430 		switch (buf[1]) {
1533  00dd 1e03          	ldw	x,(OFST+1,sp)
1534  00df e601          	ld	a,(1,x)
1536                     ; 446 				break;
1537  00e1 4a            	dec	a
1538  00e2 270a          	jreq	L534
1539  00e4 a007          	sub	a,#7
1540  00e6 271c          	jreq	L344
1541  00e8 a008          	sub	a,#8
1542  00ea 272e          	jreq	L544
1543  00ec 2040          	jra	L735
1544  00ee               L534:
1545                     ; 431 			case RC_MODE_HEAT:
1545                     ; 432 				rcSubDataInfo.set_temp[st] = buf[3];
1547  00ee 7b02          	ld	a,(OFST+0,sp)
1548  00f0 5f            	clrw	x
1549  00f1 97            	ld	xl,a
1550  00f2 90e603        	ld	a,(3,y)
1551  00f5 d7001f        	ld	(_rcSubDataInfo+8,x),a
1552                     ; 433 				uiInfo.tempSetup[st] = buf[3];
1554  00f8 5f            	clrw	x
1555  00f9 7b02          	ld	a,(OFST+0,sp)
1556  00fb 97            	ld	xl,a
1557  00fc 90e603        	ld	a,(3,y)
1558  00ff d7003d        	ld	(_uiInfo+61,x),a
1559                     ; 434 				break;
1561  0102 202a          	jra	L735
1562                     ; 435 			case RC_MODE_OUT:
1562                     ; 436 				break;
1564                     ; 437 			case RC_MODE_STOP:
1564                     ; 438 				break;
1566  0104               L344:
1567                     ; 439 			case RC_MODE_RESERVE:
1567                     ; 440 				rcSubDataInfo.time[st] = buf[5];
1569  0104 7b02          	ld	a,(OFST+0,sp)
1570  0106 5f            	clrw	x
1571  0107 97            	ld	xl,a
1572  0108 90e605        	ld	a,(5,y)
1573  010b d70037        	ld	(_rcSubDataInfo+32,x),a
1574                     ; 441 				uiInfo.remote_time[st] = buf[5];
1576  010e 5f            	clrw	x
1577  010f 7b02          	ld	a,(OFST+0,sp)
1578  0111 97            	ld	xl,a
1579  0112 90e605        	ld	a,(5,y)
1580  0115 d7004d        	ld	(_uiInfo+77,x),a
1581                     ; 442 				break;
1583  0118 2014          	jra	L735
1584  011a               L544:
1585                     ; 443 			case RC_MODE_REPEAT:
1585                     ; 444 				rcSubDataInfo.banb[st] = buf[5];
1587  011a 7b02          	ld	a,(OFST+0,sp)
1588  011c 5f            	clrw	x
1589  011d 97            	ld	xl,a
1590  011e 90e605        	ld	a,(5,y)
1591  0121 d7003f        	ld	(_rcSubDataInfo+40,x),a
1592                     ; 445 				uiInfo.remote_banb[st] = buf[5];
1594  0124 5f            	clrw	x
1595  0125 7b02          	ld	a,(OFST+0,sp)
1596  0127 97            	ld	xl,a
1597  0128 90e605        	ld	a,(5,y)
1598  012b d70055        	ld	(_uiInfo+85,x),a
1599                     ; 446 				break;
1601  012e               L735:
1602                     ; 449 		disp_char(uiInfo.remote_mode[st]);
1604  012e 7b02          	ld	a,(OFST+0,sp)
1605  0130 5f            	clrw	x
1606  0131 97            	ld	xl,a
1607  0132 d60045        	ld	a,(_uiInfo+69,x)
1608  0135 cd0000        	call	_disp_char
1611  0138 cc00b0        	jra	L651
1612  013b               L115:
1613                     ; 453 		rcSubDataInfo.mode_heat[st] = 0xFF;
1615  013b 5f            	clrw	x
1616  013c 97            	ld	xl,a
1617  013d a6ff          	ld	a,#255
1618  013f d70027        	ld	(_rcSubDataInfo+16,x),a
1619                     ; 454 		rcSubDataInfo.cur_temp[st] = buf[2];
1621  0142 5f            	clrw	x
1622  0143 7b02          	ld	a,(OFST+0,sp)
1623  0145 1603          	ldw	y,(OFST+1,sp)
1624  0147 97            	ld	xl,a
1625  0148 90e602        	ld	a,(2,y)
1626  014b d70017        	ld	(_rcSubDataInfo,x),a
1627                     ; 455 		rcSubDataInfo.set_temp[st] = 0xFF;
1629  014e 5f            	clrw	x
1630  014f 7b02          	ld	a,(OFST+0,sp)
1631  0151 97            	ld	xl,a
1632  0152 a6ff          	ld	a,#255
1633  0154 d7001f        	ld	(_rcSubDataInfo+8,x),a
1634                     ; 456 		rcSubDataInfo.time[st] = 0xFF;
1636  0157 5f            	clrw	x
1637  0158 7b02          	ld	a,(OFST+0,sp)
1638  015a 97            	ld	xl,a
1639  015b a6ff          	ld	a,#255
1640  015d d70037        	ld	(_rcSubDataInfo+32,x),a
1641                     ; 457 		rcSubDataInfo.banb[st] = 0xFF;
1643  0160 5f            	clrw	x
1644  0161 7b02          	ld	a,(OFST+0,sp)
1645  0163 97            	ld	xl,a
1646  0164 a6ff          	ld	a,#255
1647  0166 d7003f        	ld	(_rcSubDataInfo+40,x),a
1648                     ; 459 }
1650  0169 cc00b0        	jra	L651
1651  016c               LC007:
1652  016c 35010005      	mov	_packet_changed,#1
1653                     ; 376 							dr_mode_out = 1;
1655  0170 35010002      	mov	_dr_mode_out,#1
1656                     ; 377 							_disp_mode2 = FW_GET_DISPMODE;
1658  0174 a629          	ld	a,#41
1659  0176 cd0000        	call	_file_read
1661  0179 c70000        	ld	__disp_mode2,a
1662  017c 81            	ret	
1708                     ; 462 void rc_ptc_check_subrc(uint8_t *buf) {
1709                     .text:	section	.text,new
1710  0000               _rc_ptc_check_subrc:
1712  0000 89            	pushw	x
1713  0001 88            	push	a
1714       00000001      OFST:	set	1
1717                     ; 463 	uint8_t start = buf[0] & 0x0F;
1719  0002 f6            	ld	a,(x)
1720  0003 a40f          	and	a,#15
1721  0005 6b01          	ld	(OFST+0,sp),a
1722                     ; 465 	state_check = RC_STATE_NONE;
1724  0007 725f000b      	clr	_state_check
1725                     ; 467 	if (uiInfo.mode == SETTING_MODE_MASTER) {
1727  000b c60008        	ld	a,_uiInfo+8
1728  000e 4a            	dec	a
1729  000f 2707          	jreq	L261
1730                     ; 468 		return;
1732                     ; 471 	if (start != uiInfo.id) {
1734  0011 7b01          	ld	a,(OFST+0,sp)
1735  0013 c10004        	cp	a,_uiInfo+4
1736  0016 2703          	jreq	L375
1737                     ; 472 		return;
1738  0018               L261:
1741  0018 5b03          	addw	sp,#3
1742  001a 81            	ret	
1743  001b               L375:
1744                     ; 475 	packet_changed = 1;	
1746  001b 35010005      	mov	_packet_changed,#1
1747                     ; 476 	_disp_mode2 = buf[1];
1749  001f 1e02          	ldw	x,(OFST+1,sp)
1750  0021 e601          	ld	a,(1,x)
1751  0023 c70000        	ld	__disp_mode2,a
1752                     ; 478 	switch(_disp_mode2)
1755                     ; 482 	case RC_MODE_REPEAT:	uiInfo.repeat = buf[5];	break;
1756  0026 4a            	dec	a
1757  0027 270a          	jreq	L345
1758  0029 a007          	sub	a,#7
1759  002b 270d          	jreq	L545
1760  002d a008          	sub	a,#8
1761  002f 2710          	jreq	L745
1762  0031 20e5          	jra	L261
1763  0033               L345:
1764                     ; 480 	case RC_MODE_HEAT:		uiInfo.tSetup = buf[3];	break;
1766  0033 e603          	ld	a,(3,x)
1767  0035 c7000e        	ld	_uiInfo+14,a
1770  0038 20de          	jra	L261
1771  003a               L545:
1772                     ; 481 	case RC_MODE_RESERVE:	uiInfo.reserve = buf[5];	break;
1774  003a e605          	ld	a,(5,x)
1775  003c c7000d        	ld	_uiInfo+13,a
1778  003f 20d7          	jra	L261
1779  0041               L745:
1780                     ; 482 	case RC_MODE_REPEAT:	uiInfo.repeat = buf[5];	break;
1782  0041 e605          	ld	a,(5,x)
1783  0043 c7000c        	ld	_uiInfo+12,a
1786                     ; 484 }
1788  0046 20d0          	jra	L261
1851                     ; 486 void rc_ptc_check_mirror(uint8_t *buf) {
1852                     .text:	section	.text,new
1853  0000               _rc_ptc_check_mirror:
1855  0000 89            	pushw	x
1856       00000001      OFST:	set	1
1859                     ; 491 	state_check = RC_STATE_NONE;
1861  0001 725f000b      	clr	_state_check
1862  0005 88            	push	a
1863                     ; 493 	if (uiInfo.mode != SETTING_MODE_MASTER) {
1865  0006 c60008        	ld	a,_uiInfo+8
1866  0009 a101          	cp	a,#1
1867  000b 2703cc01b5    	jrne	L736
1868                     ; 494 		return;
1870                     ; 497 	page = buf[0] & 0x0F;
1872  0010 1e02          	ldw	x,(OFST+1,sp)
1873  0012 f6            	ld	a,(x)
1874  0013 a40f          	and	a,#15
1875  0015 6b01          	ld	(OFST+0,sp),a
1876                     ; 498 	cur_mirror_page = page;
1878  0017 c70006        	ld	_cur_mirror_page,a
1879                     ; 499 	state_check = RC_STATE_MIRROR;
1881  001a 3506000b      	mov	_state_check,#6
1882                     ; 501 	switch(page) {
1885                     ; 582 			break;
1886  001e 270f          	jreq	L106
1887  0020 4a            	dec	a
1888  0021 2603cc00a5    	jreq	L306
1889  0026 4a            	dec	a
1890  0027 2603cc0130    	jreq	L506
1891  002c cc01b5        	jra	L736
1892  002f               L106:
1893                     ; 502 		case 0:
1893                     ; 503 			mode = (buf[6] & 0x80) >> 7;
1895  002f e606          	ld	a,(6,x)
1896  0031 49            	rlc	a
1897  0032 4f            	clr	a
1898  0033 49            	rlc	a
1899  0034 6b01          	ld	(OFST+0,sp),a
1900                     ; 504 			if (mode == CNT_MODE_MAIN) {
1902  0036 2654          	jrne	L146
1903                     ; 505 				_boiler_type = (buf[1] & 0x80) >> 7;
1905  0038 cd01c4        	call	LC010
1906  003b c70000        	ld	__boiler_type,a
1907                     ; 506 				uiInfo.lpmType = (buf[1] & 0x0F);
1909  003e e601          	ld	a,(1,x)
1910  0040 a40f          	and	a,#15
1911  0042 c70013        	ld	_uiInfo+19,a
1912                     ; 507 				uiInfo.cnt = (buf[2] & 0x70) >> 4;
1914  0045 cd01b8        	call	LC008
1915  0048 c70005        	ld	_uiInfo+5,a
1916                     ; 508 				uiInfo.valve = buf[2] & 0x0F;
1918  004b e602          	ld	a,(2,x)
1919  004d a40f          	and	a,#15
1920  004f c7000a        	ld	_uiInfo+10,a
1921                     ; 509 				_boiler_water_shower = buf[3];
1923  0052 e603          	ld	a,(3,x)
1924  0054 c70000        	ld	__boiler_water_shower,a
1925                     ; 510 				uiInfo.houseCapa = buf[4];
1927  0057 e604          	ld	a,(4,x)
1928  0059 c70010        	ld	_uiInfo+16,a
1929                     ; 511 				_boiler_water_heat = buf[5] ;
1931  005c e605          	ld	a,(5,x)
1932  005e c70000        	ld	__boiler_water_heat,a
1933                     ; 512 				uiInfo.controlMode = mode;
1935  0061 7b01          	ld	a,(OFST+0,sp)
1936  0063 c70009        	ld	_uiInfo+9,a
1937                     ; 513 				uiInfo.subRCLock = (buf[6] & 0x40) >> 6 ;
1939  0066 e606          	ld	a,(6,x)
1940  0068 4e            	swap	a
1941  0069 a404          	and	a,#4
1942  006b 44            	srl	a
1943  006c 44            	srl	a
1944  006d c7005d        	ld	_uiInfo+93,a
1945                     ; 514 				uiInfo.poType = (buf[6] & 0x30) >> 4;
1947  0070 e606          	ld	a,(6,x)
1948  0072 4e            	swap	a
1949  0073 a403          	and	a,#3
1950  0075 c7000f        	ld	_uiInfo+15,a
1951                     ; 515 				uiInfo.cntlMode = (buf[6] & 0x08) >> 3;
1953  0078 e606          	ld	a,(6,x)
1954  007a a408          	and	a,#8
1955  007c 44            	srl	a
1956  007d 44            	srl	a
1957  007e 44            	srl	a
1958  007f c70003        	ld	_uiInfo+3,a
1959                     ; 516 				uiInfo.opMode = buf[6] & 0x07;
1961  0082 e606          	ld	a,(6,x)
1962  0084 a407          	and	a,#7
1963  0086 c70007        	ld	_uiInfo+7,a
1965  0089 cc01b5        	jra	L736
1966  008c               L146:
1967                     ; 518 				uiInfo.lpmType_sub = (buf[1] & 0x0F);
1969  008c e601          	ld	a,(1,x)
1970  008e a40f          	and	a,#15
1971  0090 c70014        	ld	_uiInfo+20,a
1972                     ; 519 				uiInfo.cnt_sub = (buf[2] & 0xF0) >> 4;
1974  0093 e602          	ld	a,(2,x)
1975  0095 4e            	swap	a
1976  0096 a40f          	and	a,#15
1977  0098 c70006        	ld	_uiInfo+6,a
1978                     ; 520 				uiInfo.valve_sub = buf[2] & 0x0F;
1980  009b e602          	ld	a,(2,x)
1981  009d a40f          	and	a,#15
1982  009f c7000b        	ld	_uiInfo+11,a
1983  00a2 cc01b5        	jra	L736
1984  00a5               L306:
1985                     ; 523 		case 1:
1985                     ; 524 			mode = (buf[1] & 0x80) >> 7;
1987  00a5 cd01c4        	call	LC010
1988  00a8 6b01          	ld	(OFST+0,sp),a
1989                     ; 525 			if (mode == CNT_MODE_MAIN) {
1991  00aa 2631          	jrne	L546
1992                     ; 526 				uiInfo.valve_rc[0] = (buf[1] & 0x70) >> 4;
1994  00ac cd01be        	call	LC009
1995  00af c7001d        	ld	_uiInfo+29,a
1996                     ; 527 				uiInfo.valve_rc[1] = buf[1] & 0x07;
1998  00b2 e601          	ld	a,(1,x)
1999  00b4 a407          	and	a,#7
2000  00b6 c7001e        	ld	_uiInfo+30,a
2001                     ; 528 				uiInfo.valve_rc[2] = (buf[2] & 0x70) >> 4;
2003  00b9 cd01b8        	call	LC008
2004  00bc c7001f        	ld	_uiInfo+31,a
2005                     ; 529 				uiInfo.valve_rc[3] = buf[2] & 0x07;
2007  00bf e602          	ld	a,(2,x)
2008  00c1 a407          	and	a,#7
2009  00c3 c70020        	ld	_uiInfo+32,a
2010                     ; 531 				uiInfo.valve_len[0] = buf[3];
2012  00c6 e603          	ld	a,(3,x)
2013  00c8 c70015        	ld	_uiInfo+21,a
2014                     ; 532 				uiInfo.valve_len[1] = buf[4];
2016  00cb e604          	ld	a,(4,x)
2017  00cd c70016        	ld	_uiInfo+22,a
2018                     ; 533 				uiInfo.valve_len[2] = buf[5];
2020  00d0 e605          	ld	a,(5,x)
2021  00d2 c70017        	ld	_uiInfo+23,a
2022                     ; 534 				uiInfo.valve_len[3] = buf[6];
2024  00d5 e606          	ld	a,(6,x)
2025  00d7 c70018        	ld	_uiInfo+24,a
2027  00da cc01b5        	jra	L736
2028  00dd               L546:
2029                     ; 536 				uiInfo.valve_sub_rc[0] = (buf[1] & 0x70) >> 4;
2031  00dd cd01be        	call	LC009
2032  00e0 c7002d        	ld	_uiInfo+45,a
2033                     ; 537 				uiInfo.valve_sub_rc[1] = buf[1] & 0x07;
2035  00e3 e601          	ld	a,(1,x)
2036  00e5 a407          	and	a,#7
2037  00e7 c7002e        	ld	_uiInfo+46,a
2038                     ; 538 				uiInfo.valve_sub_rc[2] = (buf[2] & 0x70) >> 4;
2040  00ea cd01b8        	call	LC008
2041  00ed c7002f        	ld	_uiInfo+47,a
2042                     ; 539 				uiInfo.valve_sub_rc[3] = buf[2] & 0x07;
2044  00f0 e602          	ld	a,(2,x)
2045  00f2 a407          	and	a,#7
2046  00f4 c70030        	ld	_uiInfo+48,a
2047                     ; 541 				uiInfo.valve_sub_len[0] = buf[3];
2049  00f7 e603          	ld	a,(3,x)
2050  00f9 c70025        	ld	_uiInfo+37,a
2051                     ; 542 				uiInfo.valve_sub_len[1] = buf[4];
2053  00fc e604          	ld	a,(4,x)
2054  00fe c70026        	ld	_uiInfo+38,a
2055                     ; 543 				uiInfo.valve_sub_len[2] = buf[5];
2057  0101 e605          	ld	a,(5,x)
2058  0103 c70027        	ld	_uiInfo+39,a
2059                     ; 544 				uiInfo.valve_sub_len[3] = buf[6];
2061  0106 e606          	ld	a,(6,x)
2062  0108 c70028        	ld	_uiInfo+40,a
2063                     ; 546 				for (i = 0 ; i < 4 ; i++) {
2065  010b 4f            	clr	a
2066  010c 6b01          	ld	(OFST+0,sp),a
2067  010e               L156:
2068                     ; 547 					if (uiInfo.valve_sub_rc[i] == 0 && uiInfo.valve_sub_len[i] != 0) {
2070  010e 5f            	clrw	x
2071  010f 97            	ld	xl,a
2072  0110 724d002d      	tnz	(_uiInfo+45,x)
2073  0114 260f          	jrne	L756
2075  0116 5f            	clrw	x
2076  0117 97            	ld	xl,a
2077  0118 724d0025      	tnz	(_uiInfo+37,x)
2078  011c 2707          	jreq	L756
2079                     ; 548 						uiInfo.valve_sub_rc[i] = 8;
2081  011e 5f            	clrw	x
2082  011f 97            	ld	xl,a
2083  0120 a608          	ld	a,#8
2084  0122 d7002d        	ld	(_uiInfo+45,x),a
2085  0125               L756:
2086                     ; 546 				for (i = 0 ; i < 4 ; i++) {
2088  0125 0c01          	inc	(OFST+0,sp)
2091  0127 7b01          	ld	a,(OFST+0,sp)
2092  0129 a104          	cp	a,#4
2093  012b 25e1          	jrult	L156
2094  012d cc01b5        	jra	L736
2095  0130               L506:
2096                     ; 553 		case 2:
2096                     ; 554 			mode = (buf[1] & 0x80) >> 7;
2098  0130 cd01c4        	call	LC010
2099  0133 6b01          	ld	(OFST+0,sp),a
2100                     ; 555 			if (mode == CNT_MODE_MAIN) {
2102  0135 262f          	jrne	L166
2103                     ; 556 				uiInfo.valve_rc[4] = (buf[1] & 0x70) >> 4;
2105  0137 cd01be        	call	LC009
2106  013a c70021        	ld	_uiInfo+33,a
2107                     ; 557 				uiInfo.valve_rc[5] = buf[1] & 0x07;
2109  013d e601          	ld	a,(1,x)
2110  013f a407          	and	a,#7
2111  0141 c70022        	ld	_uiInfo+34,a
2112                     ; 558 				uiInfo.valve_rc[6] = (buf[2] & 0x70) >> 4;
2114  0144 ad72          	call	LC008
2115  0146 c70023        	ld	_uiInfo+35,a
2116                     ; 559 				uiInfo.valve_rc[7] = buf[2] & 0x07;
2118  0149 e602          	ld	a,(2,x)
2119  014b a407          	and	a,#7
2120  014d c70024        	ld	_uiInfo+36,a
2121                     ; 561 				uiInfo.valve_len[4] = buf[3];
2123  0150 e603          	ld	a,(3,x)
2124  0152 c70019        	ld	_uiInfo+25,a
2125                     ; 562 				uiInfo.valve_len[5] = buf[4];
2127  0155 e604          	ld	a,(4,x)
2128  0157 c7001a        	ld	_uiInfo+26,a
2129                     ; 563 				uiInfo.valve_len[6] = buf[5];
2131  015a e605          	ld	a,(5,x)
2132  015c c7001b        	ld	_uiInfo+27,a
2133                     ; 564 				uiInfo.valve_len[7] = buf[6];
2135  015f e606          	ld	a,(6,x)
2136  0161 c7001c        	ld	_uiInfo+28,a
2138  0164 204f          	jra	L736
2139  0166               L166:
2140                     ; 566 				uiInfo.valve_sub_rc[4] = (buf[1] & 0x70) >> 4;
2142  0166 ad56          	call	LC009
2143  0168 c70031        	ld	_uiInfo+49,a
2144                     ; 567 				uiInfo.valve_sub_rc[5] = buf[1] & 0x07;
2146  016b e601          	ld	a,(1,x)
2147  016d a407          	and	a,#7
2148  016f c70032        	ld	_uiInfo+50,a
2149                     ; 568 				uiInfo.valve_sub_rc[6] = (buf[2] & 0x70) >> 4;
2151  0172 ad44          	call	LC008
2152  0174 c70033        	ld	_uiInfo+51,a
2153                     ; 569 				uiInfo.valve_sub_rc[7] = buf[2] & 0x07;
2155  0177 e602          	ld	a,(2,x)
2156  0179 a407          	and	a,#7
2157  017b c70034        	ld	_uiInfo+52,a
2158                     ; 571 				uiInfo.valve_sub_len[4] = buf[3];
2160  017e e603          	ld	a,(3,x)
2161  0180 c70029        	ld	_uiInfo+41,a
2162                     ; 572 				uiInfo.valve_sub_len[5] = buf[4];
2164  0183 e604          	ld	a,(4,x)
2165  0185 c7002a        	ld	_uiInfo+42,a
2166                     ; 573 				uiInfo.valve_sub_len[6] = buf[5];
2168  0188 e605          	ld	a,(5,x)
2169  018a c7002b        	ld	_uiInfo+43,a
2170                     ; 574 				uiInfo.valve_sub_len[7] = buf[6];
2172  018d e606          	ld	a,(6,x)
2173  018f c7002c        	ld	_uiInfo+44,a
2174                     ; 576 				for (i = 4 ; i < 8 ; i++) {
2176  0192 a604          	ld	a,#4
2177  0194 6b01          	ld	(OFST+0,sp),a
2178  0196               L566:
2179                     ; 577 					if (uiInfo.valve_sub_rc[i] == 0 && uiInfo.valve_sub_len[i] != 0) {
2181  0196 5f            	clrw	x
2182  0197 97            	ld	xl,a
2183  0198 724d002d      	tnz	(_uiInfo+45,x)
2184  019c 260f          	jrne	L376
2186  019e 5f            	clrw	x
2187  019f 97            	ld	xl,a
2188  01a0 724d0025      	tnz	(_uiInfo+37,x)
2189  01a4 2707          	jreq	L376
2190                     ; 578 						uiInfo.valve_sub_rc[i] = 8;
2192  01a6 5f            	clrw	x
2193  01a7 97            	ld	xl,a
2194  01a8 a608          	ld	a,#8
2195  01aa d7002d        	ld	(_uiInfo+45,x),a
2196  01ad               L376:
2197                     ; 576 				for (i = 4 ; i < 8 ; i++) {
2199  01ad 0c01          	inc	(OFST+0,sp)
2202  01af 7b01          	ld	a,(OFST+0,sp)
2203  01b1 a108          	cp	a,#8
2204  01b3 25e1          	jrult	L566
2205  01b5               L736:
2206                     ; 584 }
2209  01b5 5b03          	addw	sp,#3
2210  01b7 81            	ret	
2211  01b8               LC008:
2212  01b8 e602          	ld	a,(2,x)
2213  01ba 4e            	swap	a
2214  01bb a407          	and	a,#7
2215  01bd 81            	ret	
2216  01be               LC009:
2217  01be e601          	ld	a,(1,x)
2218  01c0 4e            	swap	a
2219  01c1 a407          	and	a,#7
2220  01c3 81            	ret	
2221  01c4               LC010:
2222  01c4 e601          	ld	a,(1,x)
2223  01c6 49            	rlc	a
2224  01c7 4f            	clr	a
2225  01c8 49            	rlc	a
2226  01c9 81            	ret	
2275                     ; 586 void rc_ptc_check(uint8_t *buf) {
2276                     .text:	section	.text,new
2277  0000               _rc_ptc_check:
2279  0000 89            	pushw	x
2280  0001 88            	push	a
2281       00000001      OFST:	set	1
2284                     ; 588 	start = buf[0] & 0xF0;
2286  0002 f6            	ld	a,(x)
2287  0003 a4f0          	and	a,#240
2288  0005 6b01          	ld	(OFST+0,sp),a
2289                     ; 590 	switch(start) {
2292                     ; 610 			break;
2293  0007 a020          	sub	a,#32
2294  0009 2738          	jreq	L507
2295  000b a010          	sub	a,#16
2296  000d 271f          	jreq	L776
2297  000f a030          	sub	a,#48
2298  0011 2729          	jreq	L307
2299  0013 a010          	sub	a,#16
2300  0015 2710          	jreq	L576
2301  0017 a080          	sub	a,#128
2302  0019 271a          	jreq	L107
2303                     ; 606 		default:
2303                     ; 607 			state_check = RC_STATE_ERROR;
2305  001b 3504000b      	mov	_state_check,#4
2306                     ; 608 			disp_char(buf[0]);
2308  001f 1e02          	ldw	x,(OFST+1,sp)
2309  0021 f6            	ld	a,(x)
2310  0022 cd0000        	call	_disp_char
2312                     ; 610 			break;
2314  0025 2021          	jra	L337
2315  0027               L576:
2316                     ; 591 		case BYTE_START_CNT_NORMAL:
2316                     ; 592 			rc_ptc_check_normal(buf);
2318  0027 1e02          	ldw	x,(OFST+1,sp)
2319  0029 cd0000        	call	_rc_ptc_check_normal
2321                     ; 593 			break;
2323  002c 201a          	jra	L337
2324  002e               L776:
2325                     ; 594 		case BYTE_START_CNT_SETTING:
2325                     ; 595 			rc_ptc_check_setting(buf);
2327  002e 1e02          	ldw	x,(OFST+1,sp)
2328  0030 cd0000        	call	_rc_ptc_check_setting
2330                     ; 596 			break;
2332  0033 2013          	jra	L337
2333  0035               L107:
2334                     ; 597 		case BYTE_START_RC_NORMAL:
2334                     ; 598 			rc_ptc_check_rc(buf);
2336  0035 1e02          	ldw	x,(OFST+1,sp)
2337  0037 cd0000        	call	_rc_ptc_check_rc
2339                     ; 599 			break;
2341  003a 200c          	jra	L337
2342  003c               L307:
2343                     ; 600 		case BYTE_START_RC_SUBRC:
2343                     ; 601 			rc_ptc_check_subrc(buf);
2345  003c 1e02          	ldw	x,(OFST+1,sp)
2346  003e cd0000        	call	_rc_ptc_check_subrc
2348                     ; 602 			break;
2350  0041 2005          	jra	L337
2351  0043               L507:
2352                     ; 603 		case BYTE_START_CNT_MIRROR:
2352                     ; 604 			rc_ptc_check_mirror(buf);
2354  0043 1e02          	ldw	x,(OFST+1,sp)
2355  0045 cd0000        	call	_rc_ptc_check_mirror
2357                     ; 605 			break;
2359  0048               L337:
2360                     ; 612 }
2363  0048 5b03          	addw	sp,#3
2364  004a 81            	ret	
2397                     ; 614 void setSettingChange(uint8_t ch) {
2398                     .text:	section	.text,new
2399  0000               _setSettingChange:
2403                     ; 615 	set_changed = ch;
2405  0000 c7000e        	ld	_set_changed,a
2406                     ; 616 }
2409  0003 81            	ret	
2433                     ; 618 uint8_t getSettingChange(void) {
2434                     .text:	section	.text,new
2435  0000               _getSettingChange:
2439                     ; 619 	return set_changed;
2441  0000 c6000e        	ld	a,_set_changed
2444  0003 81            	ret	
2468                     ; 622 uint8_t getState_check(void) {
2469                     .text:	section	.text,new
2470  0000               _getState_check:
2474                     ; 623 	return state_check;
2476  0000 c6000b        	ld	a,_state_check
2479  0003 81            	ret	
2512                     ; 626 void setState_check(uint8_t st) {
2513                     .text:	section	.text,new
2514  0000               _setState_check:
2518                     ; 627 	state_check = st;
2520  0000 c7000b        	ld	_state_check,a
2521                     ; 628 }
2524  0003 81            	ret	
2573                     ; 630 void makeChecksum(uint8_t *buf) {
2574                     .text:	section	.text,new
2575  0000               _makeChecksum:
2577  0000 89            	pushw	x
2578  0001 89            	pushw	x
2579       00000002      OFST:	set	2
2582                     ; 635 	s = 0;
2584  0002 0f01          	clr	(OFST-1,sp)
2585                     ; 636 	for (i = 0 ; i < 7 ; i++) {
2587  0004 0f02          	clr	(OFST+0,sp)
2588  0006               L7201:
2589                     ; 637 		s += buf[i];
2591  0006 7b03          	ld	a,(OFST+1,sp)
2592  0008 97            	ld	xl,a
2593  0009 7b04          	ld	a,(OFST+2,sp)
2594  000b 1b02          	add	a,(OFST+0,sp)
2595  000d 2401          	jrnc	L022
2596  000f 5c            	incw	x
2597  0010               L022:
2598  0010 02            	rlwa	x,a
2599  0011 7b01          	ld	a,(OFST-1,sp)
2600  0013 fb            	add	a,(x)
2601  0014 6b01          	ld	(OFST-1,sp),a
2602                     ; 636 	for (i = 0 ; i < 7 ; i++) {
2604  0016 0c02          	inc	(OFST+0,sp)
2607  0018 7b02          	ld	a,(OFST+0,sp)
2608  001a a107          	cp	a,#7
2609  001c 25e8          	jrult	L7201
2610                     ; 639 	buf[7] = s;
2612  001e 1e03          	ldw	x,(OFST+1,sp)
2613  0020 7b01          	ld	a,(OFST-1,sp)
2614  0022 e707          	ld	(7,x),a
2615                     ; 645 }
2618  0024 5b04          	addw	sp,#4
2619  0026 81            	ret	
2673                     ; 647 void rc_ptc_make_baseSetting(uint8_t *buf, uint8_t page, uint8_t mode) {
2674                     .text:	section	.text,new
2675  0000               _rc_ptc_make_baseSetting:
2677  0000 89            	pushw	x
2678  0001 5203          	subw	sp,#3
2679       00000003      OFST:	set	3
2682                     ; 648 	switch (page) {
2684  0003 7b08          	ld	a,(OFST+5,sp)
2686                     ; 739 		break;
2687  0005 270f          	jreq	L5301
2688  0007 4a            	dec	a
2689  0008 2603cc00ad    	jreq	L7301
2690  000d 4a            	dec	a
2691  000e 2603cc0153    	jreq	L1401
2692  0013 cc01f1        	jra	L7601
2693  0016               L5301:
2694                     ; 649 		case 0:
2694                     ; 650 			if (mode == CNT_MODE_MAIN) {
2696  0016 7b09          	ld	a,(OFST+6,sp)
2697  0018 2625          	jrne	L1701
2698                     ; 651 				buf[1] = (_boiler_type << 7)
2698                     ; 652 									| ((uiInfo.plc & 0x07) << 4)
2698                     ; 653 									| (uiInfo.lpmType);
2700  001a c60064        	ld	a,_uiInfo+100
2701  001d a407          	and	a,#7
2702  001f cd01fa        	call	LC014
2703  0022 6b03          	ld	(OFST+0,sp),a
2704  0024 c60000        	ld	a,__boiler_type
2705  0027 cd01f4        	call	LC013
2706  002a 1a03          	or	a,(OFST+0,sp)
2707  002c 1e04          	ldw	x,(OFST+1,sp)
2708  002e ca0013        	or	a,_uiInfo+19
2709  0031 e701          	ld	(1,x),a
2710                     ; 654 				buf[2] = ((uiInfo.relay & 0x01) << 7) 
2710                     ; 655 									| ((uiInfo.cnt & 0x07) << 4) 
2710                     ; 656 									| (uiInfo.valve & 0x0F);
2712  0033 c6000a        	ld	a,_uiInfo+10
2713  0036 a40f          	and	a,#15
2714  0038 6b03          	ld	(OFST+0,sp),a
2715  003a c60005        	ld	a,_uiInfo+5
2716                     ; 657 				buf[3] = _boiler_water_shower;
2717                     ; 658 				buf[4] = uiInfo.houseCapa;
2718                     ; 659 				buf[5] = _boiler_water_heat;
2719                     ; 660 				buf[6] = 	(mode << 7) 
2719                     ; 661 									| (uiInfo.subRCLock << 6) 
2719                     ; 662 									| ((uiInfo.poType & 0x01) << 4) 
2719                     ; 663 									| ((uiInfo.cntlMode & 0x01) << 3) 
2719                     ; 664 									| uiInfo.opMode;
2721  003d 2017          	jp	LC012
2722  003f               L1701:
2723                     ; 666 				buf[1] = (_boiler_type << 7) 
2723                     ; 667 									| (uiInfo.lpmType_sub);
2725  003f c60000        	ld	a,__boiler_type
2726  0042 cd01f4        	call	LC013
2727  0045 1e04          	ldw	x,(OFST+1,sp)
2728  0047 ca0014        	or	a,_uiInfo+20
2729  004a e701          	ld	(1,x),a
2730                     ; 668 				buf[2] = ((uiInfo.relay & 0x01) << 7) 
2730                     ; 669 									| ((uiInfo.cnt_sub & 0x07) << 4) 
2730                     ; 670 									| (uiInfo.valve_sub & 0x0F);
2732  004c c6000b        	ld	a,_uiInfo+11
2733  004f a40f          	and	a,#15
2734  0051 6b03          	ld	(OFST+0,sp),a
2735  0053 c60006        	ld	a,_uiInfo+6
2736                     ; 671 				buf[3] = _boiler_water_shower;
2738                     ; 672 				buf[4] = uiInfo.houseCapa;
2740                     ; 673 				buf[5] = _boiler_water_heat;
2742                     ; 674 				buf[6] = 	(mode << 7) 
2742                     ; 675 									| (uiInfo.subRCLock << 6) 
2742                     ; 676 									| ((uiInfo.poType & 0x01) << 4) 
2742                     ; 677 									| ((uiInfo.cntlMode & 0x01) << 3) 
2742                     ; 678 									| uiInfo.opMode;
2744  0056               LC012:
2745  0056 a407          	and	a,#7
2746  0058 cd01fa        	call	LC014
2747  005b 6b02          	ld	(OFST-1,sp),a
2748  005d c6005e        	ld	a,_uiInfo+94
2749  0060 a401          	and	a,#1
2750  0062 cd01f4        	call	LC013
2751  0065 1a02          	or	a,(OFST-1,sp)
2752  0067 1e04          	ldw	x,(OFST+1,sp)
2753  0069 1a03          	or	a,(OFST+0,sp)
2754  006b e702          	ld	(2,x),a
2756  006d c60000        	ld	a,__boiler_water_shower
2757  0070 e703          	ld	(3,x),a
2759  0072 c60010        	ld	a,_uiInfo+16
2760  0075 e704          	ld	(4,x),a
2762  0077 c60000        	ld	a,__boiler_water_heat
2763  007a e705          	ld	(5,x),a
2765  007c c60003        	ld	a,_uiInfo+3
2766  007f a401          	and	a,#1
2767  0081 48            	sll	a
2768  0082 48            	sll	a
2769  0083 48            	sll	a
2770  0084 6b03          	ld	(OFST+0,sp),a
2771  0086 c6000f        	ld	a,_uiInfo+15
2772  0089 a401          	and	a,#1
2773  008b cd01fa        	call	LC014
2774  008e 6b02          	ld	(OFST-1,sp),a
2775  0090 c6005d        	ld	a,_uiInfo+93
2776  0093 97            	ld	xl,a
2777  0094 a640          	ld	a,#64
2778  0096 42            	mul	x,a
2779  0097 9f            	ld	a,xl
2780  0098 6b01          	ld	(OFST-2,sp),a
2781  009a 7b09          	ld	a,(OFST+6,sp)
2782  009c cd01f4        	call	LC013
2783  009f 1a01          	or	a,(OFST-2,sp)
2784  00a1 1a02          	or	a,(OFST-1,sp)
2785  00a3 1a03          	or	a,(OFST+0,sp)
2786  00a5 ca0007        	or	a,_uiInfo+7
2787  00a8 1e04          	ldw	x,(OFST+1,sp)
2788  00aa cc01ef        	jp	LC011
2789  00ad               L7301:
2790                     ; 681 		case 1:
2790                     ; 682 			if (mode == CNT_MODE_MAIN) {
2792  00ad 7b09          	ld	a,(OFST+6,sp)
2793  00af 2651          	jrne	L5701
2794                     ; 683 				buf[1] = mode << 7 
2794                     ; 684 							 | (uiInfo.valve_rc[0] << 4)
2794                     ; 685 							 | mode << 3 
2794                     ; 686 							 | uiInfo.valve_rc[1];
2796  00b1 48            	sll	a
2797  00b2 48            	sll	a
2798  00b3 48            	sll	a
2799  00b4 6b03          	ld	(OFST+0,sp),a
2800  00b6 c6001d        	ld	a,_uiInfo+29
2801  00b9 cd01fa        	call	LC014
2802  00bc 6b02          	ld	(OFST-1,sp),a
2803  00be 7b09          	ld	a,(OFST+6,sp)
2804  00c0 cd01f4        	call	LC013
2805  00c3 1a02          	or	a,(OFST-1,sp)
2806  00c5 1a03          	or	a,(OFST+0,sp)
2807  00c7 1e04          	ldw	x,(OFST+1,sp)
2808  00c9 ca001e        	or	a,_uiInfo+30
2809  00cc e701          	ld	(1,x),a
2810                     ; 687 				buf[2] = mode << 7 
2810                     ; 688 							 | (uiInfo.valve_rc[2] << 4)
2810                     ; 689 							 | mode << 3 
2810                     ; 690 							 | uiInfo.valve_rc[3];
2812  00ce 7b09          	ld	a,(OFST+6,sp)
2813  00d0 48            	sll	a
2814  00d1 48            	sll	a
2815  00d2 48            	sll	a
2816  00d3 6b03          	ld	(OFST+0,sp),a
2817  00d5 c6001f        	ld	a,_uiInfo+31
2818  00d8 cd01fa        	call	LC014
2819  00db 6b02          	ld	(OFST-1,sp),a
2820  00dd 7b09          	ld	a,(OFST+6,sp)
2821  00df cd01f4        	call	LC013
2822  00e2 1a02          	or	a,(OFST-1,sp)
2823  00e4 1a03          	or	a,(OFST+0,sp)
2824  00e6 1e04          	ldw	x,(OFST+1,sp)
2825  00e8 ca0020        	or	a,_uiInfo+32
2826  00eb e702          	ld	(2,x),a
2827                     ; 691 				buf[3] = uiInfo.valve_len[0];
2829  00ed c60015        	ld	a,_uiInfo+21
2830  00f0 e703          	ld	(3,x),a
2831                     ; 692 				buf[4] = uiInfo.valve_len[1];
2833  00f2 c60016        	ld	a,_uiInfo+22
2834  00f5 e704          	ld	(4,x),a
2835                     ; 693 				buf[5] = uiInfo.valve_len[2];
2837  00f7 c60017        	ld	a,_uiInfo+23
2838  00fa e705          	ld	(5,x),a
2839                     ; 694 				buf[6] = uiInfo.valve_len[3];
2841  00fc c60018        	ld	a,_uiInfo+24
2843  00ff cc01ef        	jp	LC011
2844  0102               L5701:
2845                     ; 696 				buf[1] = mode << 7 
2845                     ; 697 							 | (uiInfo.valve_sub_rc[0] << 4)
2845                     ; 698 							 | mode << 3 
2845                     ; 699 							 | uiInfo.valve_sub_rc[1];
2847  0102 48            	sll	a
2848  0103 48            	sll	a
2849  0104 48            	sll	a
2850  0105 6b03          	ld	(OFST+0,sp),a
2851  0107 c6002d        	ld	a,_uiInfo+45
2852  010a cd01fa        	call	LC014
2853  010d 6b02          	ld	(OFST-1,sp),a
2854  010f 7b09          	ld	a,(OFST+6,sp)
2855  0111 cd01f4        	call	LC013
2856  0114 1a02          	or	a,(OFST-1,sp)
2857  0116 1a03          	or	a,(OFST+0,sp)
2858  0118 1e04          	ldw	x,(OFST+1,sp)
2859  011a ca002e        	or	a,_uiInfo+46
2860  011d e701          	ld	(1,x),a
2861                     ; 700 				buf[2] = mode << 7 
2861                     ; 701 							 | (uiInfo.valve_sub_rc[2] << 4)
2861                     ; 702 							 | mode << 3 
2861                     ; 703 							 | uiInfo.valve_sub_rc[3];
2863  011f 7b09          	ld	a,(OFST+6,sp)
2864  0121 48            	sll	a
2865  0122 48            	sll	a
2866  0123 48            	sll	a
2867  0124 6b03          	ld	(OFST+0,sp),a
2868  0126 c6002f        	ld	a,_uiInfo+47
2869  0129 cd01fa        	call	LC014
2870  012c 6b02          	ld	(OFST-1,sp),a
2871  012e 7b09          	ld	a,(OFST+6,sp)
2872  0130 cd01f4        	call	LC013
2873  0133 1a02          	or	a,(OFST-1,sp)
2874  0135 1a03          	or	a,(OFST+0,sp)
2875  0137 1e04          	ldw	x,(OFST+1,sp)
2876  0139 ca0030        	or	a,_uiInfo+48
2877  013c e702          	ld	(2,x),a
2878                     ; 704 				buf[3] = uiInfo.valve_sub_len[0];
2880  013e c60025        	ld	a,_uiInfo+37
2881  0141 e703          	ld	(3,x),a
2882                     ; 705 				buf[4] = uiInfo.valve_sub_len[1];
2884  0143 c60026        	ld	a,_uiInfo+38
2885  0146 e704          	ld	(4,x),a
2886                     ; 706 				buf[5] = uiInfo.valve_sub_len[2];
2888  0148 c60027        	ld	a,_uiInfo+39
2889  014b e705          	ld	(5,x),a
2890                     ; 707 				buf[6] = uiInfo.valve_sub_len[3];
2892  014d c60028        	ld	a,_uiInfo+40
2893  0150 cc01ef        	jp	LC011
2894  0153               L1401:
2895                     ; 710 		case 2:
2895                     ; 711 			if (mode == CNT_MODE_MAIN) {
2897  0153 7b09          	ld	a,(OFST+6,sp)
2898  0155 264e          	jrne	L1011
2899                     ; 712 				buf[1] = mode << 7 
2899                     ; 713 							 | (uiInfo.valve_rc[4] << 4) 
2899                     ; 714 							 | mode << 3 
2899                     ; 715 							 | uiInfo.valve_rc[5];
2901  0157 48            	sll	a
2902  0158 48            	sll	a
2903  0159 48            	sll	a
2904  015a 6b03          	ld	(OFST+0,sp),a
2905  015c c60021        	ld	a,_uiInfo+33
2906  015f cd01fa        	call	LC014
2907  0162 6b02          	ld	(OFST-1,sp),a
2908  0164 7b09          	ld	a,(OFST+6,sp)
2909  0166 cd01f4        	call	LC013
2910  0169 1a02          	or	a,(OFST-1,sp)
2911  016b 1a03          	or	a,(OFST+0,sp)
2912  016d 1e04          	ldw	x,(OFST+1,sp)
2913  016f ca0022        	or	a,_uiInfo+34
2914  0172 e701          	ld	(1,x),a
2915                     ; 716 				buf[2] = mode << 7 
2915                     ; 717 							 | (uiInfo.valve_rc[6] << 4) 
2915                     ; 718 							 | mode << 3 
2915                     ; 719 							 | uiInfo.valve_rc[7];
2917  0174 7b09          	ld	a,(OFST+6,sp)
2918  0176 48            	sll	a
2919  0177 48            	sll	a
2920  0178 48            	sll	a
2921  0179 6b03          	ld	(OFST+0,sp),a
2922  017b c60023        	ld	a,_uiInfo+35
2923  017e ad7a          	call	LC014
2924  0180 6b02          	ld	(OFST-1,sp),a
2925  0182 7b09          	ld	a,(OFST+6,sp)
2926  0184 ad6e          	call	LC013
2927  0186 1a02          	or	a,(OFST-1,sp)
2928  0188 1a03          	or	a,(OFST+0,sp)
2929  018a 1e04          	ldw	x,(OFST+1,sp)
2930  018c ca0024        	or	a,_uiInfo+36
2931  018f e702          	ld	(2,x),a
2932                     ; 720 				buf[3] = uiInfo.valve_len[4];
2934  0191 c60019        	ld	a,_uiInfo+25
2935  0194 e703          	ld	(3,x),a
2936                     ; 721 				buf[4] = uiInfo.valve_len[5];
2938  0196 c6001a        	ld	a,_uiInfo+26
2939  0199 e704          	ld	(4,x),a
2940                     ; 722 				buf[5] = uiInfo.valve_len[6];
2942  019b c6001b        	ld	a,_uiInfo+27
2943  019e e705          	ld	(5,x),a
2944                     ; 723 				buf[6] = uiInfo.valve_len[7];
2946  01a0 c6001c        	ld	a,_uiInfo+28
2948  01a3 204a          	jp	LC011
2949  01a5               L1011:
2950                     ; 725 				buf[1] = mode << 7 
2950                     ; 726 							 | (uiInfo.valve_sub_rc[4] << 4) 
2950                     ; 727 							 | mode << 3 
2950                     ; 728 							 | uiInfo.valve_sub_rc[5];
2952  01a5 48            	sll	a
2953  01a6 48            	sll	a
2954  01a7 48            	sll	a
2955  01a8 6b03          	ld	(OFST+0,sp),a
2956  01aa c60031        	ld	a,_uiInfo+49
2957  01ad ad4b          	call	LC014
2958  01af 6b02          	ld	(OFST-1,sp),a
2959  01b1 7b09          	ld	a,(OFST+6,sp)
2960  01b3 ad3f          	call	LC013
2961  01b5 1a02          	or	a,(OFST-1,sp)
2962  01b7 1a03          	or	a,(OFST+0,sp)
2963  01b9 1e04          	ldw	x,(OFST+1,sp)
2964  01bb ca0032        	or	a,_uiInfo+50
2965  01be e701          	ld	(1,x),a
2966                     ; 729 				buf[2] = mode << 7 
2966                     ; 730 							 | (uiInfo.valve_sub_rc[6] << 4) 
2966                     ; 731 							 | mode << 3 
2966                     ; 732 							 | uiInfo.valve_sub_rc[7];
2968  01c0 7b09          	ld	a,(OFST+6,sp)
2969  01c2 48            	sll	a
2970  01c3 48            	sll	a
2971  01c4 48            	sll	a
2972  01c5 6b03          	ld	(OFST+0,sp),a
2973  01c7 c60033        	ld	a,_uiInfo+51
2974  01ca ad2e          	call	LC014
2975  01cc 6b02          	ld	(OFST-1,sp),a
2976  01ce 7b09          	ld	a,(OFST+6,sp)
2977  01d0 ad22          	call	LC013
2978  01d2 1a02          	or	a,(OFST-1,sp)
2979  01d4 1a03          	or	a,(OFST+0,sp)
2980  01d6 1e04          	ldw	x,(OFST+1,sp)
2981  01d8 ca0034        	or	a,_uiInfo+52
2982  01db e702          	ld	(2,x),a
2983                     ; 733 				buf[3] = uiInfo.valve_sub_len[4];
2985  01dd c60029        	ld	a,_uiInfo+41
2986  01e0 e703          	ld	(3,x),a
2987                     ; 734 				buf[4] = uiInfo.valve_sub_len[5];
2989  01e2 c6002a        	ld	a,_uiInfo+42
2990  01e5 e704          	ld	(4,x),a
2991                     ; 735 				buf[5] = uiInfo.valve_sub_len[6];
2993  01e7 c6002b        	ld	a,_uiInfo+43
2994  01ea e705          	ld	(5,x),a
2995                     ; 736 				buf[6] = uiInfo.valve_sub_len[7];
2997  01ec c6002c        	ld	a,_uiInfo+44
2998  01ef               LC011:
2999  01ef e706          	ld	(6,x),a
3000  01f1               L7601:
3001                     ; 741 }
3004  01f1 5b05          	addw	sp,#5
3005  01f3 81            	ret	
3006  01f4               LC013:
3007  01f4 97            	ld	xl,a
3008  01f5 a680          	ld	a,#128
3009  01f7 42            	mul	x,a
3010  01f8 9f            	ld	a,xl
3011  01f9 81            	ret	
3012  01fa               LC014:
3013  01fa 97            	ld	xl,a
3014  01fb a610          	ld	a,#16
3015  01fd 42            	mul	x,a
3016  01fe 9f            	ld	a,xl
3017  01ff 81            	ret	
3064                     ; 744 void rc_ptc_make_setting(uint8_t *buf) {
3065                     .text:	section	.text,new
3066  0000               _rc_ptc_make_setting:
3068  0000 89            	pushw	x
3069  0001 88            	push	a
3070       00000001      OFST:	set	1
3073                     ; 746 	uint8_t mode = uiInfo.controlMode;
3075  0002 c60009        	ld	a,_uiInfo+9
3076  0005 6b01          	ld	(OFST+0,sp),a
3077                     ; 748 	buf[0] = BYTE_START_RC_SETTING | cur_set_page;
3079  0007 c60007        	ld	a,_cur_set_page
3080  000a 1e02          	ldw	x,(OFST+1,sp)
3081  000c aa50          	or	a,#80
3082  000e f7            	ld	(x),a
3083                     ; 750 	rc_ptc_make_baseSetting(buf, cur_set_page, mode);
3085  000f 7b01          	ld	a,(OFST+0,sp)
3086  0011 88            	push	a
3087  0012 3b0007        	push	_cur_set_page
3088  0015 1e04          	ldw	x,(OFST+3,sp)
3089  0017 cd0000        	call	_rc_ptc_make_baseSetting
3091  001a 85            	popw	x
3092                     ; 752 	makeChecksum(buf);
3094  001b 1e02          	ldw	x,(OFST+1,sp)
3095  001d cd0000        	call	_makeChecksum
3097                     ; 753 }
3100  0020 5b03          	addw	sp,#3
3101  0022 81            	ret	
3104                     	switch	.data
3105  0006               _dr_out_count:
3106  0006 01            	dc.b	1
3153                     ; 759 void rc_ptc_make_normal(uint8_t *buf) {
3154                     .text:	section	.text,new
3155  0000               _rc_ptc_make_normal:
3157  0000 89            	pushw	x
3158       00000000      OFST:	set	0
3161                     ; 761 	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
3163  0001 c60004        	ld	a,_uiInfo+4
3164  0004 1e01          	ldw	x,(OFST+1,sp)
3165  0006 aaf0          	or	a,#240
3166  0008 f7            	ld	(x),a
3167                     ; 762 	buf[1] = _disp_mode2;
3169  0009 c60000        	ld	a,__disp_mode2
3170  000c e701          	ld	(1,x),a
3171                     ; 763 	buf[2] = uiInfo.tCurr;
3173  000e c60002        	ld	a,_uiInfo+2
3174  0011 e702          	ld	(2,x),a
3175                     ; 764 	buf[3] = 0x00;
3177  0013 6f03          	clr	(3,x)
3178                     ; 765 	buf[4] = 0x00;
3180  0015 6f04          	clr	(4,x)
3181                     ; 766 	buf[5] = 0x00;
3183  0017 6f05          	clr	(5,x)
3184                     ; 767 	buf[6] = 0x00;
3186  0019 6f06          	clr	(6,x)
3187                     ; 769 	if (uiInfo.mode == SETTING_MODE_MASTER) {
3189  001b c60008        	ld	a,_uiInfo+8
3190  001e 4a            	dec	a
3191  001f 2619          	jrne	L7511
3192                     ; 770 		buf[4] = _boiler_water_heat;
3194  0021 c60000        	ld	a,__boiler_water_heat
3195  0024 e704          	ld	(4,x),a
3196                     ; 771 		buf[6] = __boiler_shower[5] == 1 ? 1 : 0; // 온수모드   
3198  0026 c60005        	ld	a,___boiler_shower+5
3199  0029 4a            	dec	a
3200  002a 2603          	jrne	L432
3201  002c 4c            	inc	a
3202  002d 2001          	jra	L632
3203  002f               L432:
3204  002f 4f            	clr	a
3205  0030               L632:
3206  0030 e706          	ld	(6,x),a
3207                     ; 772 		buf[6] |= (_boiler_water_shower << 1);					// 온수
3209  0032 c60000        	ld	a,__boiler_water_shower
3210  0035 48            	sll	a
3211  0036 ea06          	or	a,(6,x)
3212  0038 e706          	ld	(6,x),a
3213  003a               L7511:
3214                     ; 775 	switch(buf[1]) {
3216  003a e601          	ld	a,(1,x)
3218                     ; 812 		default:
3218                     ; 813 			break;
3219  003c 4a            	dec	a
3220  003d 270d          	jreq	L5211
3221  003f 4a            	dec	a
3222  0040 270f          	jreq	L7211
3223  0042 a006          	sub	a,#6
3224  0044 2724          	jreq	L5311
3225  0046 a008          	sub	a,#8
3226  0048 2712          	jreq	L3311
3227  004a 2023          	jra	L3611
3228  004c               L5211:
3229                     ; 776 		case RC_MODE_HEAT:
3229                     ; 777 			buf[3] = uiInfo.tSetup;
3231  004c c6000e        	ld	a,_uiInfo+14
3232                     ; 778 			break;
3234  004f 2007          	jp	LC016
3235  0051               L7211:
3236                     ; 779 		case RC_MODE_OUT:
3236                     ; 780 			buf[5] = dr_mode_out;
3238  0051 c60002        	ld	a,_dr_mode_out
3239  0054 e705          	ld	(5,x),a
3240                     ; 795 			buf[3] = 0x14;				//	10'
3242  0056 a614          	ld	a,#20
3243  0058               LC016:
3244  0058 e703          	ld	(3,x),a
3245                     ; 798 			break;
3247  005a 2013          	jra	L3611
3248                     ; 799 		case RC_MODE_STOP:
3248                     ; 800 			break;
3250  005c               L3311:
3251                     ; 801 		case RC_MODE_REPEAT:
3251                     ; 802 			if(_timFlag == 0) {
3253  005c c60000        	ld	a,__timFlag
3254  005f 2604          	jrne	L5611
3255                     ; 803 				buf[3] = MAX_REPEAT_TEMP;
3257  0061 a650          	ld	a,#80
3258  0063 e703          	ld	(3,x),a
3259  0065               L5611:
3260                     ; 806 			buf[5] = uiInfo.repeat;
3262  0065 c6000c        	ld	a,_uiInfo+12
3263                     ; 808 			break;
3265  0068 2003          	jp	LC015
3266  006a               L5311:
3267                     ; 809 		case RC_MODE_RESERVE:
3267                     ; 810 			buf[5] = uiInfo.reserve;
3269  006a c6000d        	ld	a,_uiInfo+13
3270  006d               LC015:
3271  006d e705          	ld	(5,x),a
3272                     ; 811 			break;
3274                     ; 812 		default:
3274                     ; 813 			break;
3276  006f               L3611:
3277                     ; 816 	makeChecksum(buf);
3279  006f 1e01          	ldw	x,(OFST+1,sp)
3280  0071 cd0000        	call	_makeChecksum
3282                     ; 818 	if (disp_mode_preview != _disp_mode2){
3284  0074 c60002        	ld	a,_disp_mode_preview
3285  0077 c10000        	cp	a,__disp_mode2
3286  007a 2712          	jreq	L7611
3287                     ; 819 		if (uiInfo.mode == SETTING_MODE_SUB) {
3289                     ; 821 				UPDATE_BIT(BIT_DISPMODE);
3292                     ; 822 				disp_mode_preview = _disp_mode2;
3295                     ; 825 			UPDATE_BIT(BIT_DISPMODE);
3301                     ; 826 			disp_mode_preview = _disp_mode2;
3305  007c 72160000      	bset	__updateBit,#3
3307  0080 5500000000    	mov	__updateTimer,___timer1s
3309  0085 35050000      	mov	__updateCount,#5
3311  0089 5500000002    	mov	_disp_mode_preview,__disp_mode2
3312  008e               L7611:
3313                     ; 830 	only_one++;
3315  008e 725c0003      	inc	_only_one
3316                     ; 831 }
3319  0092 85            	popw	x
3320  0093 81            	ret	
3372                     ; 834 uint8_t rc_ptc_check_subRC(void) {
3373                     .text:	section	.text,new
3374  0000               _rc_ptc_check_subRC:
3376  0000 89            	pushw	x
3377       00000002      OFST:	set	2
3380                     ; 839 	if (_remote == 1) {
3382  0001 c60000        	ld	a,__remote
3383  0004 4a            	dec	a
3384  0005 2603          	jrne	L5221
3385                     ; 840 		return 0xFF;
3387  0007 4a            	dec	a
3390  0008 85            	popw	x
3391  0009 81            	ret	
3392  000a               L5221:
3393                     ; 843 	ch = 0;
3395  000a 0f01          	clr	(OFST-1,sp)
3396                     ; 844 	if (rcSubDataInfo.mode_heat[uiInfo.id - 1] != 0xFF) {
3398  000c cd0151        	call	LC019
3399  000f d60027        	ld	a,(_rcSubDataInfo+16,x)
3400  0012 4c            	inc	a
3401  0013 2704          	jreq	L7221
3402                     ; 845 		ch = 1;
3404  0015 a601          	ld	a,#1
3405  0017 6b01          	ld	(OFST-1,sp),a
3406  0019               L7221:
3407                     ; 848 	rcSubDataInfo.mode_heat[uiInfo.id - 1] = _disp_mode2;
3409  0019 c60004        	ld	a,_uiInfo+4
3410  001c 5f            	clrw	x
3411  001d 97            	ld	xl,a
3412  001e 5a            	decw	x
3413  001f c60000        	ld	a,__disp_mode2
3414  0022 d70027        	ld	(_rcSubDataInfo+16,x),a
3415                     ; 849 	rcSubDataInfo.cur_temp[uiInfo.id - 1] = uiInfo.tCurr;
3417  0025 cd0151        	call	LC019
3418  0028 c60002        	ld	a,_uiInfo+2
3419  002b d70017        	ld	(_rcSubDataInfo,x),a
3420                     ; 850 	rcSubDataInfo.set_temp[uiInfo.id - 1] = uiInfo.tSetup;
3422  002e cd0151        	call	LC019
3423  0031 c6000e        	ld	a,_uiInfo+14
3424  0034 d7001f        	ld	(_rcSubDataInfo+8,x),a
3425                     ; 851 	rcSubDataInfo.time[uiInfo.id - 1] = uiInfo.reserve;
3427  0037 cd0151        	call	LC019
3428  003a c6000d        	ld	a,_uiInfo+13
3429  003d d70037        	ld	(_rcSubDataInfo+32,x),a
3430                     ; 852 	rcSubDataInfo.banb[uiInfo.id - 1] = uiInfo.repeat;
3432  0040 cd0151        	call	LC019
3433  0043 c6000c        	ld	a,_uiInfo+12
3434  0046 d7003f        	ld	(_rcSubDataInfo+40,x),a
3435                     ; 854 	uiInfo.remote_mode[uiInfo.id - 1] = _disp_mode2;
3437  0049 cd0151        	call	LC019
3438  004c c60000        	ld	a,__disp_mode2
3439  004f d70045        	ld	(_uiInfo+69,x),a
3440                     ; 855 	uiInfo.tempCurr[uiInfo.id - 1] = uiInfo.tCurr;
3442  0052 cd0151        	call	LC019
3443  0055 c60002        	ld	a,_uiInfo+2
3444  0058 d70035        	ld	(_uiInfo+53,x),a
3445                     ; 856 	uiInfo.tempSetup[uiInfo.id - 1] = uiInfo.tSetup;
3447  005b cd0151        	call	LC019
3448  005e c6000e        	ld	a,_uiInfo+14
3449  0061 d7003d        	ld	(_uiInfo+61,x),a
3450                     ; 857 	uiInfo.remote_time[uiInfo.id - 1] = uiInfo.reserve;
3452  0064 cd0151        	call	LC019
3453  0067 c6000d        	ld	a,_uiInfo+13
3454  006a d7004d        	ld	(_uiInfo+77,x),a
3455                     ; 858 	uiInfo.remote_banb[uiInfo.id - 1] = uiInfo.repeat;
3457  006d cd0151        	call	LC019
3458  0070 c6000c        	ld	a,_uiInfo+12
3459  0073 d70055        	ld	(_uiInfo+85,x),a
3460                     ; 860 	if (ch == 0) {
3462  0076 7b01          	ld	a,(OFST-1,sp)
3463  0078 2603          	jrne	L1321
3464                     ; 862 		return 0xFF;
3466  007a 4a            	dec	a
3469  007b 85            	popw	x
3470  007c 81            	ret	
3471  007d               L1321:
3472                     ; 865 	num = 0xFF;
3474  007d a6ff          	ld	a,#255
3475  007f 6b01          	ld	(OFST-1,sp),a
3476                     ; 866 	for (i = 0 ; i < 8 ; i++) {
3478  0081 4f            	clr	a
3479  0082 6b02          	ld	(OFST+0,sp),a
3480  0084               L3321:
3481                     ; 867 		if (rcSubDataInfo.set_temp[i] == 0xAA) {
3483  0084 5f            	clrw	x
3484  0085 97            	ld	xl,a
3485  0086 d6001f        	ld	a,(_rcSubDataInfo+8,x)
3486  0089 a1aa          	cp	a,#170
3487  008b 2756          	jreq	L5321
3488                     ; 868 			continue;
3490                     ; 871 		if (uiInfo.remote_mode[i] != rcSubDataInfo.mode_heat[i]) {
3492  008d 7b02          	ld	a,(OFST+0,sp)
3493  008f cd0158        	call	LC020
3494  0092 90d60045      	ld	a,(_uiInfo+69,y)
3495  0096 d10027        	cp	a,(_rcSubDataInfo+16,x)
3496  0099 2706          	jreq	L3421
3497                     ; 872 			num = i;
3499  009b 7b02          	ld	a,(OFST+0,sp)
3500  009d 6b01          	ld	(OFST-1,sp),a
3501                     ; 873 			break;
3503  009f 204c          	jra	L7321
3504  00a1               L3421:
3505                     ; 876 		switch (rcSubDataInfo.mode_heat[i]) {
3507  00a1 7b02          	ld	a,(OFST+0,sp)
3508  00a3 5f            	clrw	x
3509  00a4 97            	ld	xl,a
3510  00a5 d60027        	ld	a,(_rcSubDataInfo+16,x)
3512                     ; 894 				break;
3513  00a8 4a            	dec	a
3514  00a9 270a          	jreq	L5711
3515  00ab a007          	sub	a,#7
3516  00ad 2722          	jreq	L3021
3517  00af a008          	sub	a,#8
3518  00b1 2710          	jreq	L1021
3519  00b3 202e          	jra	L5321
3520  00b5               L5711:
3521                     ; 877 			case RC_MODE_HEAT:
3521                     ; 878 				if (uiInfo.tempSetup[i] != rcSubDataInfo.set_temp[i]) {
3523  00b5 7b02          	ld	a,(OFST+0,sp)
3524  00b7 cd0158        	call	LC020
3525  00ba 90d6003d      	ld	a,(_uiInfo+61,y)
3526  00be d1001f        	cp	a,(_rcSubDataInfo+8,x)
3527                     ; 879 					num = i;
3528  00c1 201a          	jp	LC018
3529                     ; 882 			case RC_MODE_OUT:
3529                     ; 883 			case RC_MODE_STOP:
3529                     ; 884 				break;
3531  00c3               L1021:
3532                     ; 885 			case RC_MODE_REPEAT:
3532                     ; 886 				if (uiInfo.remote_banb[i] != rcSubDataInfo.banb[i]) {
3534  00c3 7b02          	ld	a,(OFST+0,sp)
3535  00c5 cd0158        	call	LC020
3536  00c8 90d60055      	ld	a,(_uiInfo+85,y)
3537  00cc d1003f        	cp	a,(_rcSubDataInfo+40,x)
3538                     ; 887 					num = i;
3539  00cf 200c          	jp	LC018
3540  00d1               L3021:
3541                     ; 890 			case RC_MODE_RESERVE:
3541                     ; 891 				if (uiInfo.remote_time[i] != rcSubDataInfo.time[i]) {
3543  00d1 7b02          	ld	a,(OFST+0,sp)
3544  00d3 cd0158        	call	LC020
3545  00d6 90d6004d      	ld	a,(_uiInfo+77,y)
3546  00da d10037        	cp	a,(_rcSubDataInfo+32,x)
3547                     ; 892 					num = i;
3549  00dd               LC018:
3550  00dd 2704          	jreq	L5321
3553  00df 7b02          	ld	a,(OFST+0,sp)
3554  00e1 6b01          	ld	(OFST-1,sp),a
3555  00e3               L5321:
3556                     ; 866 	for (i = 0 ; i < 8 ; i++) {
3558  00e3 0c02          	inc	(OFST+0,sp)
3561  00e5 7b02          	ld	a,(OFST+0,sp)
3562  00e7 a108          	cp	a,#8
3563  00e9 2599          	jrult	L3321
3564  00eb 7b01          	ld	a,(OFST-1,sp)
3565  00ed               L7321:
3566                     ; 898 	if (num == 0xFF) {
3568  00ed a1ff          	cp	a,#255
3569  00ef 260a          	jrne	L7521
3570                     ; 899 		ret_count = MAX_REPEAT_ERROR_COUNT;
3572  00f1 35050001      	mov	_ret_count,#5
3573                     ; 900 		cur_src = 0;
3575  00f5 725f0000      	clr	_cur_src
3576                     ; 901 		return num;
3579  00f9 2054          	jra	L442
3580  00fb               L7521:
3581                     ; 904 	if (cur_src == num) {
3583  00fb c60000        	ld	a,_cur_src
3584  00fe 1101          	cp	a,(OFST-1,sp)
3585  0100 2642          	jrne	L1621
3586                     ; 905 		ret_count--;
3588  0102 725a0001      	dec	_ret_count
3589                     ; 907 		if (ret_count == 0) {
3591  0106 2645          	jrne	L5621
3592                     ; 908 			rcSubDataInfo.mode_heat[num] = uiInfo.remote_mode[num];
3594  0108 7b01          	ld	a,(OFST-1,sp)
3595  010a 5f            	clrw	x
3596  010b 97            	ld	xl,a
3597  010c d60045        	ld	a,(_uiInfo+69,x)
3598  010f d70027        	ld	(_rcSubDataInfo+16,x),a
3599                     ; 909 			rcSubDataInfo.cur_temp[num] = uiInfo.tempCurr[num];
3601  0112 5f            	clrw	x
3602  0113 7b01          	ld	a,(OFST-1,sp)
3603  0115 97            	ld	xl,a
3604  0116 d60035        	ld	a,(_uiInfo+53,x)
3605  0119 d70017        	ld	(_rcSubDataInfo,x),a
3606                     ; 910 			rcSubDataInfo.set_temp[num] = uiInfo.tempSetup[num];
3608  011c 5f            	clrw	x
3609  011d 7b01          	ld	a,(OFST-1,sp)
3610  011f 97            	ld	xl,a
3611  0120 d6003d        	ld	a,(_uiInfo+61,x)
3612  0123 d7001f        	ld	(_rcSubDataInfo+8,x),a
3613                     ; 911 			rcSubDataInfo.time[num] = uiInfo.remote_time[num];
3615  0126 5f            	clrw	x
3616  0127 7b01          	ld	a,(OFST-1,sp)
3617  0129 97            	ld	xl,a
3618  012a d6004d        	ld	a,(_uiInfo+77,x)
3619  012d d70037        	ld	(_rcSubDataInfo+32,x),a
3620                     ; 912 			rcSubDataInfo.banb[num] = uiInfo.remote_banb[num];
3622  0130 5f            	clrw	x
3623  0131 7b01          	ld	a,(OFST-1,sp)
3624  0133 97            	ld	xl,a
3625  0134 d60055        	ld	a,(_uiInfo+85,x)
3626  0137 d7003f        	ld	(_rcSubDataInfo+40,x),a
3627                     ; 914 			ret_count = MAX_REPEAT_ERROR_COUNT;
3629  013a 35050001      	mov	_ret_count,#5
3630                     ; 915 			num = 0xFF;
3632  013e a6ff          	ld	a,#255
3633  0140 6b01          	ld	(OFST-1,sp),a
3634  0142 2009          	jra	L5621
3635  0144               L1621:
3636                     ; 918 		cur_src = num;
3638  0144 7b01          	ld	a,(OFST-1,sp)
3639  0146 c70000        	ld	_cur_src,a
3640                     ; 919 		ret_count = MAX_REPEAT_ERROR_COUNT;
3642  0149 35050001      	mov	_ret_count,#5
3643  014d               L5621:
3644                     ; 922 	return num;
3646  014d 7b01          	ld	a,(OFST-1,sp)
3648  014f               L442:
3650  014f 85            	popw	x
3651  0150 81            	ret	
3652  0151               LC019:
3653  0151 5f            	clrw	x
3654  0152 c60004        	ld	a,_uiInfo+4
3655  0155 97            	ld	xl,a
3656  0156 5a            	decw	x
3657  0157 81            	ret	
3658  0158               LC020:
3659  0158 5f            	clrw	x
3660  0159 97            	ld	xl,a
3661  015a 905f          	clrw	y
3662  015c 9097          	ld	yl,a
3663  015e 81            	ret	
3707                     ; 926 void rc_ptc_make_subRC(uint8_t *buf, uint8_t num) {
3708                     .text:	section	.text,new
3709  0000               _rc_ptc_make_subRC:
3711  0000 89            	pushw	x
3712       00000000      OFST:	set	0
3715                     ; 927 	buf[0] = BYTE_START_RC_SUBRC | num + 1;
3717  0001 7b05          	ld	a,(OFST+5,sp)
3718  0003 4c            	inc	a
3719  0004 1e01          	ldw	x,(OFST+1,sp)
3720  0006 aa60          	or	a,#96
3721  0008 f7            	ld	(x),a
3722                     ; 928 	buf[1] = uiInfo.remote_mode[num];
3724  0009 5f            	clrw	x
3725  000a 7b05          	ld	a,(OFST+5,sp)
3726  000c 97            	ld	xl,a
3727  000d d60045        	ld	a,(_uiInfo+69,x)
3728  0010 1e01          	ldw	x,(OFST+1,sp)
3729                     ; 929 	buf[2] = 0x00;
3731  0012 6f02          	clr	(2,x)
3732  0014 e701          	ld	(1,x),a
3733                     ; 930 	if (uiInfo.remote_mode[num] == RC_MODE_HEAT) {
3735  0016 5f            	clrw	x
3736  0017 7b05          	ld	a,(OFST+5,sp)
3737  0019 97            	ld	xl,a
3738  001a d60045        	ld	a,(_uiInfo+69,x)
3739  001d 4a            	dec	a
3740  001e 260d          	jrne	L7031
3741                     ; 931 		buf[3] = uiInfo.tempSetup[num];
3743  0020 7b05          	ld	a,(OFST+5,sp)
3744  0022 5f            	clrw	x
3745  0023 97            	ld	xl,a
3746  0024 d6003d        	ld	a,(_uiInfo+61,x)
3747  0027 1e01          	ldw	x,(OFST+1,sp)
3748  0029 e703          	ld	(3,x),a
3750  002b 2004          	jra	L1131
3751  002d               L7031:
3752                     ; 933 		buf[3] = 0x00;
3754  002d 1e01          	ldw	x,(OFST+1,sp)
3755  002f 6f03          	clr	(3,x)
3756  0031               L1131:
3757                     ; 936 	buf[4] = 0x00;
3759  0031 6f04          	clr	(4,x)
3760                     ; 938 	if (uiInfo.remote_mode[num] == RC_MODE_REPEAT) {
3762  0033 5f            	clrw	x
3763  0034 7b05          	ld	a,(OFST+5,sp)
3764  0036 97            	ld	xl,a
3765  0037 d60045        	ld	a,(_uiInfo+69,x)
3766  003a a110          	cp	a,#16
3767  003c 2609          	jrne	L3131
3768                     ; 939 		buf[5] = uiInfo.remote_banb[num];
3770  003e 7b05          	ld	a,(OFST+5,sp)
3771  0040 5f            	clrw	x
3772  0041 97            	ld	xl,a
3773  0042 d60055        	ld	a,(_uiInfo+85,x)
3775  0045 2012          	jp	LC021
3776  0047               L3131:
3777                     ; 940 	} else if(uiInfo.remote_mode[num] == RC_MODE_RESERVE){
3779  0047 7b05          	ld	a,(OFST+5,sp)
3780  0049 5f            	clrw	x
3781  004a 97            	ld	xl,a
3782  004b d60045        	ld	a,(_uiInfo+69,x)
3783  004e a108          	cp	a,#8
3784  0050 260d          	jrne	L7131
3785                     ; 941 		buf[5] = uiInfo.remote_time[num];
3787  0052 7b05          	ld	a,(OFST+5,sp)
3788  0054 5f            	clrw	x
3789  0055 97            	ld	xl,a
3790  0056 d6004d        	ld	a,(_uiInfo+77,x)
3791  0059               LC021:
3792  0059 1e01          	ldw	x,(OFST+1,sp)
3793  005b e705          	ld	(5,x),a
3795  005d 2004          	jra	L5131
3796  005f               L7131:
3797                     ; 943 		buf[5] = 0x00;
3799  005f 1e01          	ldw	x,(OFST+1,sp)
3800  0061 6f05          	clr	(5,x)
3801  0063               L5131:
3802                     ; 946 	buf[6] = 0x00;
3804  0063 6f06          	clr	(6,x)
3805                     ; 948 	makeChecksum(buf);
3807  0065 cd0000        	call	_makeChecksum
3809                     ; 949 }
3812  0068 85            	popw	x
3813  0069 81            	ret	
3852                     ; 951 void rc_ptc_make_error(uint8_t *buf) {
3853                     .text:	section	.text,new
3854  0000               _rc_ptc_make_error:
3856  0000 89            	pushw	x
3857       00000000      OFST:	set	0
3860                     ; 952 	buf[0] = BYTE_START_RC_ERROR | uiInfo.id;
3862  0001 c60004        	ld	a,_uiInfo+4
3863  0004 1e01          	ldw	x,(OFST+1,sp)
3864  0006 aae0          	or	a,#224
3865  0008 f7            	ld	(x),a
3866                     ; 953 	buf[1] = error;
3868  0009 c6000a        	ld	a,_error
3869  000c e701          	ld	(1,x),a
3870                     ; 954 	buf[2] = mode_recover;
3872  000e c60011        	ld	a,_mode_recover
3873  0011 e702          	ld	(2,x),a
3874                     ; 955 	buf[3] = 0x00;
3876  0013 6f03          	clr	(3,x)
3877                     ; 956 	buf[4] = 0x00;
3879  0015 6f04          	clr	(4,x)
3880                     ; 957 	buf[5] = 0x00;
3882  0017 6f05          	clr	(5,x)
3883                     ; 958 	buf[6] = 0x00;
3885  0019 6f06          	clr	(6,x)
3886                     ; 960 	makeChecksum(buf);
3888  001b cd0000        	call	_makeChecksum
3890                     ; 961 }
3893  001e 85            	popw	x
3894  001f 81            	ret	
3931                     ; 963 void rc_ptc_make_command(uint8_t *buf) {
3932                     .text:	section	.text,new
3933  0000               _rc_ptc_make_command:
3935  0000 89            	pushw	x
3936       00000000      OFST:	set	0
3939                     ; 964 	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
3941  0001 c60004        	ld	a,_uiInfo+4
3942  0004 1e01          	ldw	x,(OFST+1,sp)
3943  0006 aaf0          	or	a,#240
3944  0008 f7            	ld	(x),a
3945                     ; 965 	buf[1] = 0x20;
3947  0009 a620          	ld	a,#32
3948  000b e701          	ld	(1,x),a
3949                     ; 966 	buf[2] = 0x00;
3951  000d 6f02          	clr	(2,x)
3952                     ; 967 	buf[3] = 0x00;
3954  000f 6f03          	clr	(3,x)
3955                     ; 968 	buf[4] = 0x00;
3957  0011 6f04          	clr	(4,x)
3958                     ; 969 	buf[5] = 0x00;
3960  0013 6f05          	clr	(5,x)
3961                     ; 970 	buf[6] = 0x00;
3963  0015 6f06          	clr	(6,x)
3964                     ; 971 }
3967  0017 85            	popw	x
3968  0018 81            	ret	
4020                     ; 981 void rc_ptc_make_command_packet(uint8_t *buf, uint8_t cmd, uint8_t p1)
4020                     ; 982 {
4021                     .text:	section	.text,new
4022  0000               _rc_ptc_make_command_packet:
4024  0000 89            	pushw	x
4025       00000000      OFST:	set	0
4028                     ; 983 	rc_ptc_make_command(buf);
4030  0001 cd0000        	call	_rc_ptc_make_command
4032                     ; 984 	switch( cmd )
4034  0004 7b05          	ld	a,(OFST+5,sp)
4036                     ; 1011 		break;
4037  0006 4a            	dec	a
4038  0007 270c          	jreq	L7531
4039  0009 a003          	sub	a,#3
4040  000b 270d          	jreq	L1631
4041  000d 4a            	dec	a
4042  000e 2710          	jreq	L3631
4043  0010 4a            	dec	a
4044  0011 2713          	jreq	L5631
4045  0013 201b          	jra	L3141
4046  0015               L7531:
4047                     ; 986 	case PKT_CMD_MIRROR:
4047                     ; 987 		buf[2] = COMMAND_MODE_MIRROR;
4049  0015 1e01          	ldw	x,(OFST+1,sp)
4050  0017 4c            	inc	a
4051                     ; 988 		buf[3] = p1;
4052                     ; 989 		break;
4054  0018 2010          	jp	LC022
4055  001a               L1631:
4056                     ; 1000 	case PKT_CMD_FACTORY:
4056                     ; 1001 		buf[2] = COMMAND_MODE_FACTORY;
4058  001a 1e01          	ldw	x,(OFST+1,sp)
4059  001c a608          	ld	a,#8
4060                     ; 1002 		buf[3] = p1;
4061                     ; 1003 		break;
4063  001e 200a          	jp	LC022
4064  0020               L3631:
4065                     ; 1004 	case PKT_CMD_RESET:
4065                     ; 1005 		buf[2] = COMMAND_MODE_RESET;
4067  0020 1e01          	ldw	x,(OFST+1,sp)
4068  0022 a604          	ld	a,#4
4069                     ; 1006 		buf[3] = p1;
4070                     ; 1007 		break;
4072  0024 2004          	jp	LC022
4073  0026               L5631:
4074                     ; 1008 	case PKT_CMD_BOILER_HOT_MODE:
4074                     ; 1009 		buf[2] = COMMAND_MODE_HOTWATER;
4076  0026 1e01          	ldw	x,(OFST+1,sp)
4077  0028 a602          	ld	a,#2
4078                     ; 1010 		buf[3] = p1;
4080  002a               LC022:
4081  002a e702          	ld	(2,x),a
4085  002c 7b06          	ld	a,(OFST+6,sp)
4086  002e e703          	ld	(3,x),a
4087                     ; 1011 		break;
4089  0030               L3141:
4090                     ; 1014 	makeChecksum(buf);
4092  0030 1e01          	ldw	x,(OFST+1,sp)
4093  0032 cd0000        	call	_makeChecksum
4095                     ; 1015 }
4098  0035 85            	popw	x
4099  0036 81            	ret	
4145                     ; 1051 void rc_ptc_make_mirror(uint8_t *buf) {
4146                     .text:	section	.text,new
4147  0000               _rc_ptc_make_mirror:
4149  0000 89            	pushw	x
4150  0001 88            	push	a
4151       00000001      OFST:	set	1
4154                     ; 1053 	buf[0] = BYTE_START_RC_MIRROR | cur_mirror_page;
4156  0002 c60006        	ld	a,_cur_mirror_page
4157  0005 1e02          	ldw	x,(OFST+1,sp)
4158  0007 aa40          	or	a,#64
4159  0009 f7            	ld	(x),a
4160                     ; 1055 	mode = mode_mirror == 1 ? CNT_MODE_MAIN : CNT_MODE_SUB;
4162  000a c60013        	ld	a,_mode_mirror
4163  000d 4a            	dec	a
4164  000e 2702          	jreq	L272
4165  0010 a601          	ld	a,#1
4166  0012               L272:
4167  0012 6b01          	ld	(OFST+0,sp),a
4168                     ; 1056 	rc_ptc_make_baseSetting(buf, cur_mirror_page, mode);
4170  0014 88            	push	a
4171  0015 3b0006        	push	_cur_mirror_page
4172  0018 1e04          	ldw	x,(OFST+3,sp)
4173  001a cd0000        	call	_rc_ptc_make_baseSetting
4175  001d 85            	popw	x
4176                     ; 1058 	makeChecksum(buf);
4178  001e 1e02          	ldw	x,(OFST+1,sp)
4179  0020 cd0000        	call	_makeChecksum
4181                     ; 1060 	if (cur_mirror_page == 2) {
4183  0023 c60006        	ld	a,_cur_mirror_page
4184  0026 a102          	cp	a,#2
4185  0028 2608          	jrne	L5341
4186                     ; 1061 		cur_mirror_page = 0;
4188  002a 725f0006      	clr	_cur_mirror_page
4189                     ; 1062 		mode_mirror = 0;
4191  002e 725f0013      	clr	_mode_mirror
4192  0032               L5341:
4193                     ; 1064 }
4196  0032 5b03          	addw	sp,#3
4197  0034 81            	ret	
4255                     ; 1066 void rc_ptc_make(uint8_t *buf) {
4256                     .text:	section	.text,new
4257  0000               _rc_ptc_make:
4259  0000 89            	pushw	x
4260  0001 88            	push	a
4261       00000001      OFST:	set	1
4264                     ; 1070 	if (error != 0 && error_type != 0) {
4266  0002 c6000a        	ld	a,_error
4267  0005 2705          	jreq	L3641
4269  0007 c60009        	ld	a,_error_type
4270                     ; 1071 		rc_ptc_make_error(buf);
4272                     ; 1072 		return;
4274  000a 2608          	jrne	LC023
4275  000c               L3641:
4276                     ; 1074 		if (mode_recover == 1) {
4278  000c c60011        	ld	a,_mode_recover
4279  000f 4a            	dec	a
4280  0010 2608          	jrne	L5641
4281                     ; 1075 			rc_ptc_make_error(buf);
4283  0012 1e02          	ldw	x,(OFST+1,sp)
4284  0014               LC023:
4286  0014 cd0000        	call	_rc_ptc_make_error
4288                     ; 1076 			return;
4289  0017               L433:
4292  0017 5b03          	addw	sp,#3
4293  0019 81            	ret	
4294  001a               L5641:
4295                     ; 1080 	switch (uiInfo.mode) {
4297  001a c60008        	ld	a,_uiInfo+8
4299                     ; 1128 			break;
4300  001d 276a          	jreq	LC024
4301  001f 4a            	dec	a
4302  0020 26f5          	jrne	L433
4303                     ; 1081 		case SETTING_MODE_MASTER:
4303                     ; 1082 			
4303                     ; 1083 			if (getSettingChange() == 1) {
4305  0022 cd0000        	call	_getSettingChange
4307  0025 4a            	dec	a
4308  0026 2607          	jrne	L5741
4309                     ; 1084 				rc_ptc_make_setting(buf);
4311  0028 1e02          	ldw	x,(OFST+1,sp)
4312  002a cd0000        	call	_rc_ptc_make_setting
4314                     ; 1085 				return;
4316  002d 20e8          	jra	L433
4317  002f               L5741:
4318                     ; 1089 			if (mode_mirror != 0) {
4320  002f c60013        	ld	a,_mode_mirror
4321  0032 270d          	jreq	L7741
4322                     ; 1090 				rc_ptc_make_command_packet(buf, PKT_CMD_MIRROR, mode_mirror);
4324  0034 3b0013        	push	_mode_mirror
4325  0037 4b01          	push	#1
4326  0039 1e04          	ldw	x,(OFST+3,sp)
4327  003b cd0000        	call	_rc_ptc_make_command_packet
4329  003e 85            	popw	x
4330                     ; 1091 				return;
4332  003f 20d6          	jra	L433
4333  0041               L7741:
4334                     ; 1094 			if (mode_factory != 0) {
4336  0041 c60012        	ld	a,_mode_factory
4337  0044 2711          	jreq	L1051
4338                     ; 1096 				rc_ptc_make_command_packet(buf, PKT_CMD_FACTORY, mode_factory);
4340  0046 3b0012        	push	_mode_factory
4341  0049 4b04          	push	#4
4342  004b 1e04          	ldw	x,(OFST+3,sp)
4343  004d cd0000        	call	_rc_ptc_make_command_packet
4345  0050 725f0012      	clr	_mode_factory
4346  0054 85            	popw	x
4347                     ; 1097 				mode_factory = 0;
4349                     ; 1098 				return;
4351  0055 20c0          	jra	L433
4352  0057               L1051:
4353                     ; 1101 			if (mode_hotwater != 0) {
4355  0057 c60010        	ld	a,_mode_hotwater
4356  005a 270d          	jreq	L3051
4357                     ; 1103 				rc_ptc_make_command_packet(buf, PKT_CMD_BOILER_HOT_MODE, mode_hotwater);
4359  005c 3b0010        	push	_mode_hotwater
4360  005f 4b06          	push	#6
4361  0061 1e04          	ldw	x,(OFST+3,sp)
4362  0063 cd0000        	call	_rc_ptc_make_command_packet
4364  0066 85            	popw	x
4365                     ; 1104 				return;
4367  0067 20ae          	jra	L433
4368  0069               L3051:
4369                     ; 1107 			if (mode_reset != 0) {
4371  0069 c6000f        	ld	a,_mode_reset
4372  006c 270d          	jreq	L5051
4373                     ; 1109 				rc_ptc_make_command_packet(buf, PKT_CMD_RESET, mode_reset);
4375  006e 3b000f        	push	_mode_reset
4376  0071 4b05          	push	#5
4377  0073 1e04          	ldw	x,(OFST+3,sp)
4378  0075 cd0000        	call	_rc_ptc_make_command_packet
4380  0078 85            	popw	x
4381                     ; 1110 				return;
4383  0079 209c          	jra	L433
4384  007b               L5051:
4385                     ; 1114 			num = rc_ptc_check_subRC();
4387  007b cd0000        	call	_rc_ptc_check_subRC
4389  007e 6b01          	ld	(OFST+0,sp),a
4390                     ; 1115 			if ( num == 0xFF) {
4392  0080 4c            	inc	a
4393                     ; 1116 				rc_ptc_make_normal(buf);
4395                     ; 1117 				return;
4397  0081 2706          	jreq	LC024
4398                     ; 1120 			if (_remote == 1) {
4400  0083 c60000        	ld	a,__remote
4401  0086 4a            	dec	a
4402  0087 2607          	jrne	L1151
4403                     ; 1121 				rc_ptc_make_normal(buf);
4405  0089               LC024:
4408  0089 1e02          	ldw	x,(OFST+1,sp)
4409  008b cd0000        	call	_rc_ptc_make_normal
4412  008e 2087          	jra	L433
4413  0090               L1151:
4414                     ; 1123 				rc_ptc_make_subRC(buf, num);
4416  0090 7b01          	ld	a,(OFST+0,sp)
4417  0092 88            	push	a
4418  0093 1e03          	ldw	x,(OFST+2,sp)
4419  0095 cd0000        	call	_rc_ptc_make_subRC
4421  0098 84            	pop	a
4422  0099 cc0017        	jra	L433
4423                     ; 1126 		case SETTING_MODE_SUB:
4423                     ; 1127 			rc_ptc_make_normal(buf);
4425                     ; 1128 			break;
4427                     ; 1130 }
4471                     ; 1133 void func_rc_command(uint8_t com1, uint8_t com2) {
4472                     .text:	section	.text,new
4473  0000               _func_rc_command:
4475  0000 89            	pushw	x
4476       00000000      OFST:	set	0
4479                     ; 1134 	mode_mirror = 0;
4481  0001 725f0013      	clr	_mode_mirror
4482                     ; 1135 	mode_factory = 0;
4484  0005 725f0012      	clr	_mode_factory
4485                     ; 1136 	mode_hotwater = 0;
4487  0009 725f0010      	clr	_mode_hotwater
4488                     ; 1137 	mode_reset = 0;
4490  000d 725f000f      	clr	_mode_reset
4491                     ; 1139 	switch(com1) {
4493  0011 9e            	ld	a,xh
4495                     ; 1151 			break;
4496  0012 4a            	dec	a
4497  0013 270d          	jreq	L5151
4498  0015 4a            	dec	a
4499  0016 2711          	jreq	L7151
4500  0018 a002          	sub	a,#2
4501  001a 2714          	jreq	L1251
4502  001c a004          	sub	a,#4
4503  001e 2717          	jreq	L3251
4504  0020 201a          	jra	L5451
4505  0022               L5151:
4506                     ; 1140 		case COMMAND_MODE_MIRROR:
4506                     ; 1141 			mode_mirror = com2;
4508  0022 7b02          	ld	a,(OFST+2,sp)
4509  0024 c70013        	ld	_mode_mirror,a
4510                     ; 1142 			break;
4512  0027 2013          	jra	L5451
4513  0029               L7151:
4514                     ; 1143 		case COMMAND_MODE_HOTWATER:
4514                     ; 1144 			mode_hotwater = com2;
4516  0029 7b02          	ld	a,(OFST+2,sp)
4517  002b c70010        	ld	_mode_hotwater,a
4518                     ; 1145 			break;
4520  002e 200c          	jra	L5451
4521  0030               L1251:
4522                     ; 1146 		case COMMAND_MODE_RESET:
4522                     ; 1147 			mode_reset = com2;
4524  0030 7b02          	ld	a,(OFST+2,sp)
4525  0032 c7000f        	ld	_mode_reset,a
4526                     ; 1148 			break;
4528  0035 2005          	jra	L5451
4529  0037               L3251:
4530                     ; 1149 		case COMMAND_MODE_FACTORY:
4530                     ; 1150 			mode_factory = com2;
4532  0037 7b02          	ld	a,(OFST+2,sp)
4533  0039 c70012        	ld	_mode_factory,a
4534                     ; 1151 			break;
4536  003c               L5451:
4537                     ; 1153 }
4540  003c 85            	popw	x
4541  003d 81            	ret	
4574                     ; 1155 void func_rc_recover(uint8_t com) {
4575                     .text:	section	.text,new
4576  0000               _func_rc_recover:
4580                     ; 1156 	mode_recover = com;
4582  0000 c70011        	ld	_mode_recover,a
4583                     ; 1157 }
4586  0003 81            	ret	
4610                     ; 1159 void func_rc_setting(void) {
4611                     .text:	section	.text,new
4612  0000               _func_rc_setting:
4616                     ; 1160 	setSettingChange(1);
4618  0000 a601          	ld	a,#1
4620                     ; 1161 }
4623  0002 cc0000        	jp	_setSettingChange
4626                     	switch	.data
4627  0007               ___func_rc_settingCb:
4628  0007 00            	dc.b	0
4659                     ; 1165 void func_rc_settingCb(uint8_t ch) {
4660                     .text:	section	.text,new
4661  0000               _func_rc_settingCb:
4665                     ; 1166 	__func_rc_settingCb = ch;
4667  0000 c70007        	ld	___func_rc_settingCb,a
4668                     ; 1167 }
4671  0003 81            	ret	
4994                     	xdef	___func_rc_settingCb
4995                     	xdef	_rc_ptc_make_command_packet
4996                     	xdef	_rc_ptc_make_command
4997                     	xdef	_rc_ptc_make_error
4998                     	xdef	_rc_ptc_check_subRC
4999                     	xdef	_dr_out_count
5000                     	xdef	_rc_ptc_make_baseSetting
5001                     	xdef	_makeChecksum
5002                     	xdef	_rc_ptc_check_mirror
5003                     	xdef	_rc_ptc_check_subrc
5004                     	xdef	_rc_ptc_check_rc
5005                     	xdef	_rc_ptc_check_setting
5006                     	xdef	_rc_ptc_check_normal
5007                     	xdef	___rc_s
5008                     	xdef	_rc_ptc_check_homenet
5009                     	xdef	_rc_ptc_check_master
5010                     	xdef	_only_one
5011                     	xdef	_dr_mode_out
5012                     	switch	.bss
5013  0000               _cur_src:
5014  0000 00            	ds.b	1
5015                     	xdef	_cur_src
5016  0001               _ret_count:
5017  0001 00            	ds.b	1
5018                     	xdef	_ret_count
5019  0002               _disp_mode_preview:
5020  0002 00            	ds.b	1
5021                     	xdef	_disp_mode_preview
5022  0003               __rcLED:
5023  0003 00            	ds.b	1
5024                     	xdef	__rcLED
5025  0004               _test_count:
5026  0004 00            	ds.b	1
5027                     	xdef	_test_count
5028  0005               _packet_changed:
5029  0005 00            	ds.b	1
5030                     	xdef	_packet_changed
5031  0006               _cur_mirror_page:
5032  0006 00            	ds.b	1
5033                     	xdef	_cur_mirror_page
5034  0007               _cur_set_page:
5035  0007 00            	ds.b	1
5036                     	xdef	_cur_set_page
5037  0008               __version:
5038  0008 00            	ds.b	1
5039                     	xdef	__version
5040  0009               _error_type:
5041  0009 00            	ds.b	1
5042                     	xdef	_error_type
5043  000a               _error:
5044  000a 00            	ds.b	1
5045                     	xdef	_error
5046                     	xdef	_debug_br
5047                     	xdef	_debug_hn
5048  000b               _state_check:
5049  000b 00            	ds.b	1
5050                     	xdef	_state_check
5051                     	xref	__backup_backlight
5052                     	xref	_packet_buf
5053                     	xref	__boiler_fire
5054                     	xref	__boiler_type
5055                     	xref	__timFlag
5056                     	xref	__remote
5057  000c               __rcInfo:
5058  000c 0000          	ds.b	2
5059                     	xdef	__rcInfo
5060                     	xref	_lcd_disp_rid_hw
5061                     	xref	__boiler_water_heat
5062                     	xref	__boiler_water_shower
5063                     	xref	___boiler_shower
5064                     	xref	__updateCount
5065                     	xref	__updateBit
5066                     	xref	__updateTimer
5067                     	xref	__disp_mode2
5068                     	xref	_lcd_disp_rid
5069                     	xref	_uiInfo
5070                     	xdef	_rcInfoSet
5071                     	xdef	_get_rcInfo
5072                     	xdef	___rc_max
5073                     	xdef	_func_rc_settingCb
5074                     	xdef	_func_rc_setting
5075                     	xdef	_func_rc_recover
5076                     	xdef	_func_rc_command
5077                     	xdef	_rc_ptc_make_mirror
5078                     	xdef	_rc_ptc_make
5079                     	xdef	_rc_ptc_make_subRC
5080                     	xdef	_rc_ptc_make_setting
5081                     	xdef	_rc_ptc_make_normal
5082                     	xdef	_setState_check
5083                     	xdef	_getState_check
5084                     	xdef	_getSettingChange
5085                     	xdef	_setSettingChange
5086                     	xdef	_rc_ptc_check
5087                     	xdef	_rc_ptc_baseSet
5088                     	xdef	_getHexToBin
5089  000e               _set_changed:
5090  000e 00            	ds.b	1
5091                     	xdef	_set_changed
5092  000f               _mode_reset:
5093  000f 00            	ds.b	1
5094                     	xdef	_mode_reset
5095  0010               _mode_hotwater:
5096  0010 00            	ds.b	1
5097                     	xdef	_mode_hotwater
5098  0011               _mode_recover:
5099  0011 00            	ds.b	1
5100                     	xdef	_mode_recover
5101  0012               _mode_factory:
5102  0012 00            	ds.b	1
5103                     	xdef	_mode_factory
5104  0013               _mode_mirror:
5105  0013 00            	ds.b	1
5106                     	xdef	_mode_mirror
5107  0014               _boiler_info:
5108  0014 000000        	ds.b	3
5109                     	xdef	_boiler_info
5110  0017               _rcSubDataInfo:
5111  0017 000000000000  	ds.b	48
5112                     	xdef	_rcSubDataInfo
5113                     	xref	_file_read
5114                     	xref	_disp_char
5115                     	xref	___timer1s
5135                     	end
