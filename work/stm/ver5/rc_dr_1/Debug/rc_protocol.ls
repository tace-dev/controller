   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
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
 154                     ; 18 	p->out_temp = temp;
 156  0007 7b04          	ld	a,(OFST+2,sp)
 157  0009 e701          	ld	(1,x),a
 158                     ; 19 	p->type = id;
 160  000b 7b03          	ld	a,(OFST+1,sp)
 161  000d f7            	ld	(x),a
 162                     ; 20 }
 165  000e 5b04          	addw	sp,#4
 166  0010 81            	ret	
 169                     	switch	.data
 170  0000               _debug_hn:
 171  0000 00            	dc.b	0
 172  0001               _debug_br:
 173  0001 00            	dc.b	0
 174  0002               _dr_mode_out:
 175  0002 01            	dc.b	1
 176  0003               _only_one:
 177  0003 00            	dc.b	0
 221                     ; 85 uint8_t getHexToBin(uint8_t hex, uint8_t idx)
 221                     ; 86 {
 222                     .text:	section	.text,new
 223  0000               _getHexToBin:
 225  0000 89            	pushw	x
 226  0001 88            	push	a
 227       00000001      OFST:	set	1
 230                     ; 87 	uint8_t p = 0x80;
 232                     ; 88 	p = p >> (0x08 - (idx + 0x01));
 234  0002 9f            	ld	a,xl
 235  0003 a007          	sub	a,#7
 236  0005 40            	neg	a
 237  0006 5f            	clrw	x
 238  0007 97            	ld	xl,a
 239  0008 a680          	ld	a,#128
 240  000a 5d            	tnzw	x
 241  000b 2704          	jreq	L41
 242  000d               L61:
 243  000d 44            	srl	a
 244  000e 5a            	decw	x
 245  000f 26fc          	jrne	L61
 246  0011               L41:
 247  0011 6b01          	ld	(OFST+0,sp),a
 249                     ; 90 	if (hex & p)
 251  0013 7b02          	ld	a,(OFST+1,sp)
 252  0015 1501          	bcp	a,(OFST+0,sp)
 253  0017 2704          	jreq	L77
 254                     ; 92 		return 1;
 256  0019 a601          	ld	a,#1
 258  001b 2001          	jra	L02
 259  001d               L77:
 260                     ; 96 		return 0;
 262  001d 4f            	clr	a
 264  001e               L02:
 266  001e 5b03          	addw	sp,#3
 267  0020 81            	ret	
 302                     ; 100 void rc_ptc_baseSet(void) {
 303                     .text:	section	.text,new
 304  0000               _rc_ptc_baseSet:
 306  0000 88            	push	a
 307       00000001      OFST:	set	1
 310                     ; 102 	state_check = RC_STATE_NORMAL;
 312  0001 3501000b      	mov	_state_check,#1
 313                     ; 103 	set_changed = 0;
 315  0005 725f000e      	clr	_set_changed
 316                     ; 105 	for (i = 0 ; i < 8 ; i++) {
 318  0009 4f            	clr	a
 319  000a 6b01          	ld	(OFST+0,sp),a
 321  000c               L711:
 322                     ; 106 		rcSubDataInfo.mode_heat[i] = 0xAA;
 324  000c 5f            	clrw	x
 325  000d 97            	ld	xl,a
 326  000e a6aa          	ld	a,#170
 327  0010 d70027        	ld	(_rcSubDataInfo+16,x),a
 328                     ; 107 		rcSubDataInfo.cur_temp[i] = 0xAA;
 330  0013 5f            	clrw	x
 331  0014 7b01          	ld	a,(OFST+0,sp)
 332  0016 97            	ld	xl,a
 333  0017 a6aa          	ld	a,#170
 334  0019 d70017        	ld	(_rcSubDataInfo,x),a
 335                     ; 108 		rcSubDataInfo.set_temp[i] = 0xAA;
 337  001c 5f            	clrw	x
 338  001d 7b01          	ld	a,(OFST+0,sp)
 339  001f 97            	ld	xl,a
 340  0020 a6aa          	ld	a,#170
 341  0022 d7001f        	ld	(_rcSubDataInfo+8,x),a
 342                     ; 109 		rcSubDataInfo.time[i] = 0xAA;
 344  0025 5f            	clrw	x
 345  0026 7b01          	ld	a,(OFST+0,sp)
 346  0028 97            	ld	xl,a
 347  0029 a6aa          	ld	a,#170
 348  002b d70037        	ld	(_rcSubDataInfo+32,x),a
 349                     ; 110 		rcSubDataInfo.banb[i] = 0xAA;
 351  002e 5f            	clrw	x
 352  002f 7b01          	ld	a,(OFST+0,sp)
 353  0031 97            	ld	xl,a
 354  0032 a6aa          	ld	a,#170
 355  0034 d7003f        	ld	(_rcSubDataInfo+40,x),a
 356                     ; 105 	for (i = 0 ; i < 8 ; i++) {
 358  0037 0c01          	inc	(OFST+0,sp)
 362  0039 7b01          	ld	a,(OFST+0,sp)
 363  003b a108          	cp	a,#8
 364  003d 25cd          	jrult	L711
 365                     ; 112 }
 368  003f 84            	pop	a
 369  0040 81            	ret	
 409                     ; 114 void rc_ptc_check_master(uint8_t *buf) {
 410                     .text:	section	.text,new
 411  0000               _rc_ptc_check_master:
 413  0000 89            	pushw	x
 414       00000000      OFST:	set	0
 417                     ; 115 	if (buf[1] != 0x00) {
 419  0001 e601          	ld	a,(1,x)
 420  0003 260c          	jrne	L23
 421                     ; 116 		return;
 423                     ; 123 	if (getHexToBin(buf[6], 7) == 1) {  // H/N 패킷
 425  0005 e606          	ld	a,(6,x)
 426  0007 ae0007        	ldw	x,#7
 427  000a 95            	ld	xh,a
 428  000b cd0000        	call	_getHexToBin
 430  000e 4a            	dec	a
 431  000f 2602          	jrne	L541
 432                     ; 124 		return;
 433  0011               L23:
 436  0011 85            	popw	x
 437  0012 81            	ret	
 438  0013               L541:
 439                     ; 127 	boiler_info.state = buf[4] & 0x03;
 441  0013 1e01          	ldw	x,(OFST+1,sp)
 442  0015 e604          	ld	a,(4,x)
 443  0017 a403          	and	a,#3
 444  0019 c70014        	ld	_boiler_info,a
 445                     ; 128 	boiler_info.hotwater = buf[2];
 447  001c e602          	ld	a,(2,x)
 448  001e c70015        	ld	_boiler_info+1,a
 449                     ; 129 	boiler_info.heatwater = buf[3];
 451  0021 e603          	ld	a,(3,x)
 452  0023 c70016        	ld	_boiler_info+2,a
 453                     ; 131 	uiInfo.cntlMode = getHexToBin(buf[4], 7);
 455  0026 e604          	ld	a,(4,x)
 456  0028 ae0007        	ldw	x,#7
 457  002b 95            	ld	xh,a
 458  002c cd0000        	call	_getHexToBin
 460  002f c70003        	ld	_uiInfo+3,a
 461                     ; 133 	_boiler_fire = boiler_info.state;
 463  0032 5500140000    	mov	__boiler_fire,_boiler_info
 464                     ; 135 }
 466  0037 20d8          	jra	L23
 535                     ; 138 void rc_ptc_check_homenet(uint8_t *buf) {
 536                     .text:	section	.text,new
 537  0000               _rc_ptc_check_homenet:
 539  0000 89            	pushw	x
 540  0001 5203          	subw	sp,#3
 541       00000003      OFST:	set	3
 544                     ; 139 	_LPRCINFO	p = get_rcInfo();
 546  0003 cd0000        	call	_get_rcInfo
 548  0006 1f01          	ldw	(OFST-2,sp),x
 550                     ; 143 	if (getHexToBin(buf[6], 7) == 0) { // 일반 패킷
 552  0008 1e04          	ldw	x,(OFST+1,sp)
 553  000a e606          	ld	a,(6,x)
 554  000c ae0007        	ldw	x,#7
 555  000f 95            	ld	xh,a
 556  0010 cd0000        	call	_getHexToBin
 558  0013 4d            	tnz	a
 559  0014 270d          	jreq	L24
 560                     ; 144 		return;
 562                     ; 147 	id = buf[1] & 0x0F;
 564  0016 1e04          	ldw	x,(OFST+1,sp)
 565  0018 e601          	ld	a,(1,x)
 566  001a a40f          	and	a,#15
 567  001c 6b03          	ld	(OFST+0,sp),a
 569                     ; 149 	if (id != uiInfo.id) {
 571  001e c10004        	cp	a,_uiInfo+4
 572  0021 2703          	jreq	L102
 573                     ; 150 		return;
 574  0023               L24:
 577  0023 5b05          	addw	sp,#5
 578  0025 81            	ret	
 579  0026               L102:
 580                     ; 153 	packet_changed = 1;
 582  0026 35010005      	mov	_packet_changed,#1
 583                     ; 155 	if (_remote == 0) {
 585  002a c60000        	ld	a,__remote
 586  002d 26f4          	jrne	L24
 587                     ; 156 		_disp_mode2 = buf[2];
 589  002f e602          	ld	a,(2,x)
 590  0031 c70000        	ld	__disp_mode2,a
 591                     ; 158 		if (buf[2] == RC_MODE_HEAT) {
 593  0034 a101          	cp	a,#1
 594  0036 260b          	jrne	L502
 595                     ; 159 			if (buf[3] != 0xFF) {
 597  0038 e603          	ld	a,(3,x)
 598  003a a1ff          	cp	a,#255
 599  003c 27e5          	jreq	L24
 600                     ; 160 				uiInfo.tSetup = buf[3];
 602  003e c7000e        	ld	_uiInfo+14,a
 603  0041 20e0          	jra	L24
 604  0043               L502:
 605                     ; 162 		} else if (buf[2] == RC_MODE_OUT) {
 607  0043 a102          	cp	a,#2
 608  0045 26dc          	jrne	L24
 609                     ; 163 			out_mode = (buf[4] & 0xF0) >> 7;
 611  0047 e604          	ld	a,(4,x)
 612  0049 49            	rlc	a
 613  004a 4f            	clr	a
 614  004b 49            	rlc	a
 615  004c 6b03          	ld	(OFST+0,sp),a
 617                     ; 164 			uiInfo.tSetup = /*buf[3];//20*/p->out_temp;
 619  004e 1e01          	ldw	x,(OFST-2,sp)
 620  0050 e601          	ld	a,(1,x)
 621  0052 c7000e        	ld	_uiInfo+14,a
 622                     ; 165 			if (out_mode == 1) {
 624  0055 7b03          	ld	a,(OFST+0,sp)
 625  0057 4a            	dec	a
 626  0058 2606          	jrne	L512
 627                     ; 166 				dr_mode_out = 1;   // 개별외출
 629  005a 35010002      	mov	_dr_mode_out,#1
 631  005e 20c3          	jra	L24
 632  0060               L512:
 633                     ; 168 				dr_mode_out = 0;   // 전체 외출
 635  0060 725f0002      	clr	_dr_mode_out
 636                     ; 171 		else if( buf[2] == RC_MODE_STOP )
 638                     ; 173 			out_mode = 1;
 640                     ; 176 }
 642  0064 20bd          	jra	L24
 645                     	switch	.data
 646  0004               ___rc_max:
 647  0004 01            	dc.b	1
 648  0005               ___rc_s:
 649  0005 00            	dc.b	0
 709                     ; 183 void rc_ptc_check_normal(uint8_t *buf) {
 710                     .text:	section	.text,new
 711  0000               _rc_ptc_check_normal:
 713  0000 89            	pushw	x
 714  0001 88            	push	a
 715       00000001      OFST:	set	1
 718                     ; 184 	uint8_t start = buf[0] & 0x0F;
 720  0002 f6            	ld	a,(x)
 721  0003 a40f          	and	a,#15
 722  0005 6b01          	ld	(OFST+0,sp),a
 724                     ; 190 	if (start == 0x0F) {
 726  0007 a10f          	cp	a,#15
 727  0009 2607          	jrne	L542
 728                     ; 191 		state_check = RC_STATE_FACTORY;
 730  000b 3505000b      	mov	_state_check,#5
 731                     ; 192 		return;
 733  000f cc0147        	jra	L231
 734  0012               L542:
 735                     ; 195 	if (start == 0x01 || start == 0x09) {
 737  0012 a101          	cp	a,#1
 738  0014 2704          	jreq	L152
 740  0016 a109          	cp	a,#9
 741  0018 2604          	jrne	L742
 742  001a               L152:
 743                     ; 196 		only_one = 0;
 745  001a 725f0003      	clr	_only_one
 746  001e               L742:
 747                     ; 204 	if( __rc_s == 0 )
 749  001e c60005        	ld	a,___rc_s
 750  0021 261c          	jrne	L352
 751                     ; 206 		__rc_s = start==1 ? 1 : 0;
 753  0023 7b01          	ld	a,(OFST+0,sp)
 754  0025 4a            	dec	a
 755  0026 2603          	jrne	L64
 756  0028 4c            	inc	a
 757  0029 2001          	jra	L05
 758  002b               L64:
 759  002b 4f            	clr	a
 760  002c               L05:
 761  002c c70005        	ld	___rc_s,a
 762                     ; 207 		if( start==9 )	__rc_max = 1;
 764  002f 7b01          	ld	a,(OFST+0,sp)
 765  0031 a109          	cp	a,#9
 766  0033 2703cc0117    	jrne	L752
 769  0038 35010004      	mov	___rc_max,#1
 770  003c cc0117        	jra	L752
 771  003f               L352:
 772                     ; 209 	else if( __rc_s == 1 )
 774  003f a101          	cp	a,#1
 775  0041 261b          	jrne	L162
 776                     ; 211 		__rc_s = start==2 ? 2 : 0;
 778  0043 7b01          	ld	a,(OFST+0,sp)
 779  0045 a102          	cp	a,#2
 780  0047 2604          	jrne	L25
 781  0049 a602          	ld	a,#2
 782  004b 2001          	jra	L45
 783  004d               L25:
 784  004d 4f            	clr	a
 785  004e               L45:
 786  004e c70005        	ld	___rc_s,a
 787                     ; 212 		if( start==9 )	__rc_max = 1;
 789  0051 7b01          	ld	a,(OFST+0,sp)
 790  0053 a109          	cp	a,#9
 791  0055 26e5          	jrne	L752
 794  0057 35010004      	mov	___rc_max,#1
 795  005b cc0117        	jra	L752
 796  005e               L162:
 797                     ; 214 	else if( __rc_s == 2 )
 799  005e a102          	cp	a,#2
 800  0060 261b          	jrne	L762
 801                     ; 216 		__rc_s = start==3 ? 3 : 0;
 803  0062 7b01          	ld	a,(OFST+0,sp)
 804  0064 a103          	cp	a,#3
 805  0066 2604          	jrne	L65
 806  0068 a603          	ld	a,#3
 807  006a 2001          	jra	L06
 808  006c               L65:
 809  006c 4f            	clr	a
 810  006d               L06:
 811  006d c70005        	ld	___rc_s,a
 812                     ; 217 		if( start==9 )	__rc_max = 2;
 814  0070 7b01          	ld	a,(OFST+0,sp)
 815  0072 a109          	cp	a,#9
 816  0074 26e5          	jrne	L752
 819  0076 35020004      	mov	___rc_max,#2
 820  007a cc0117        	jra	L752
 821  007d               L762:
 822                     ; 219 	else if( __rc_s == 3 )
 824  007d a103          	cp	a,#3
 825  007f 261a          	jrne	L572
 826                     ; 221 		__rc_s = start==4 ? 4 : 0;
 828  0081 7b01          	ld	a,(OFST+0,sp)
 829  0083 a104          	cp	a,#4
 830  0085 2604          	jrne	L26
 831  0087 a604          	ld	a,#4
 832  0089 2001          	jra	L46
 833  008b               L26:
 834  008b 4f            	clr	a
 835  008c               L46:
 836  008c c70005        	ld	___rc_s,a
 837                     ; 222 		if( start==9 )	__rc_max = 3;
 839  008f 7b01          	ld	a,(OFST+0,sp)
 840  0091 a109          	cp	a,#9
 841  0093 26e5          	jrne	L752
 844  0095 35030004      	mov	___rc_max,#3
 845  0099 207c          	jra	L752
 846  009b               L572:
 847                     ; 224 	else if( __rc_s == 4 )
 849  009b a104          	cp	a,#4
 850  009d 261a          	jrne	L303
 851                     ; 226 		__rc_s = start==5 ? 5 : 0;
 853  009f 7b01          	ld	a,(OFST+0,sp)
 854  00a1 a105          	cp	a,#5
 855  00a3 2604          	jrne	L66
 856  00a5 a605          	ld	a,#5
 857  00a7 2001          	jra	L07
 858  00a9               L66:
 859  00a9 4f            	clr	a
 860  00aa               L07:
 861  00aa c70005        	ld	___rc_s,a
 862                     ; 227 		if( start==9 )	__rc_max = 4;
 864  00ad 7b01          	ld	a,(OFST+0,sp)
 865  00af a109          	cp	a,#9
 866  00b1 2664          	jrne	L752
 869  00b3 35040004      	mov	___rc_max,#4
 870  00b7 205e          	jra	L752
 871  00b9               L303:
 872                     ; 229 	else if( __rc_s == 5 )
 874  00b9 a105          	cp	a,#5
 875  00bb 261a          	jrne	L113
 876                     ; 231 		__rc_s = start==6 ? 6 : 0;
 878  00bd 7b01          	ld	a,(OFST+0,sp)
 879  00bf a106          	cp	a,#6
 880  00c1 2604          	jrne	L27
 881  00c3 a606          	ld	a,#6
 882  00c5 2001          	jra	L47
 883  00c7               L27:
 884  00c7 4f            	clr	a
 885  00c8               L47:
 886  00c8 c70005        	ld	___rc_s,a
 887                     ; 232 		if( start==9 )	__rc_max = 5;
 889  00cb 7b01          	ld	a,(OFST+0,sp)
 890  00cd a109          	cp	a,#9
 891  00cf 2646          	jrne	L752
 894  00d1 35050004      	mov	___rc_max,#5
 895  00d5 2040          	jra	L752
 896  00d7               L113:
 897                     ; 234 	else if( __rc_s == 6 )
 899  00d7 a106          	cp	a,#6
 900  00d9 261a          	jrne	L713
 901                     ; 236 		__rc_s = start==7 ? 7 : 0;
 903  00db 7b01          	ld	a,(OFST+0,sp)
 904  00dd a107          	cp	a,#7
 905  00df 2604          	jrne	L67
 906  00e1 a607          	ld	a,#7
 907  00e3 2001          	jra	L001
 908  00e5               L67:
 909  00e5 4f            	clr	a
 910  00e6               L001:
 911  00e6 c70005        	ld	___rc_s,a
 912                     ; 237 		if( start==9 )	__rc_max = 6;
 914  00e9 7b01          	ld	a,(OFST+0,sp)
 915  00eb a109          	cp	a,#9
 916  00ed 2628          	jrne	L752
 919  00ef 35060004      	mov	___rc_max,#6
 920  00f3 2022          	jra	L752
 921  00f5               L713:
 922                     ; 239 	else if( __rc_s == 7 )
 924  00f5 a107          	cp	a,#7
 925  00f7 2610          	jrne	L523
 926                     ; 241 		__rc_s = start==8 ? 8 : 0;
 928  00f9 7b01          	ld	a,(OFST+0,sp)
 929  00fb a108          	cp	a,#8
 930  00fd 2604          	jrne	L201
 931  00ff a608          	ld	a,#8
 932  0101 2001          	jra	L401
 933  0103               L201:
 934  0103 4f            	clr	a
 935  0104               L401:
 936  0104 c70005        	ld	___rc_s,a
 937                     ; 242 		if( start==9 )	__rc_max = 7;
 939  0107 2004          	jp	LC001
 940  0109               L523:
 941                     ; 244 	else if( __rc_s == 8 )
 943  0109 a108          	cp	a,#8
 944  010b 260a          	jrne	L752
 945                     ; 247 		if( start==9 )	__rc_max = 7;
 949  010d               LC001:
 951  010d 7b01          	ld	a,(OFST+0,sp)
 952  010f a109          	cp	a,#9
 953  0111 2604          	jrne	L752
 955  0113 35070004      	mov	___rc_max,#7
 956  0117               L752:
 957                     ; 250 	if( start==9 )
 959  0117 7b01          	ld	a,(OFST+0,sp)
 960  0119 a109          	cp	a,#9
 961  011b 2604          	jrne	L733
 962                     ; 252 		__rc_s = 0;
 964  011d 725f0005      	clr	___rc_s
 965  0121               L733:
 966                     ; 255 	if (start == uiInfo.id) {
 968  0121 c10004        	cp	a,_uiInfo+4
 969  0124 260d          	jrne	L143
 970                     ; 256 		packet_buf[start - 1] = 0;
 972  0126 5f            	clrw	x
 973  0127 97            	ld	xl,a
 974  0128 5a            	decw	x
 975                     ; 257 		state_check = RC_STATE_NORMAL;
 977  0129 3501000b      	mov	_state_check,#1
 978  012d 724f0000      	clr	(_packet_buf,x)
 980  0131 2004          	jra	L343
 981  0133               L143:
 982                     ; 259 		state_check = RC_STATE_NONE;
 984  0133 725f000b      	clr	_state_check
 985  0137               L343:
 986                     ; 262 	if (start == 0x09 ) {
 988  0137 a109          	cp	a,#9
 989  0139 260f          	jrne	L543
 990                     ; 263 		debug_hn = buf[2];
 992  013b 1e02          	ldw	x,(OFST+1,sp)
 993  013d e602          	ld	a,(2,x)
 994  013f c70000        	ld	_debug_hn,a
 995                     ; 264 		debug_br = buf[1];
 997  0142 e601          	ld	a,(1,x)
 998  0144 c70001        	ld	_debug_br,a
 999                     ; 281 		return;
1000  0147               L231:
1003  0147 5b03          	addw	sp,#3
1004  0149 81            	ret	
1005  014a               L543:
1006                     ; 284 	if (uiInfo.mode == SETTING_MODE_MASTER) {
1008  014a c60008        	ld	a,_uiInfo+8
1009  014d 4a            	dec	a
1010  014e 2605          	jrne	L743
1011                     ; 285 		rc_ptc_check_master(buf);
1013  0150 1e02          	ldw	x,(OFST+1,sp)
1014  0152 cd0000        	call	_rc_ptc_check_master
1016  0155               L743:
1017                     ; 288 	if ( _remote == 0 && _backup_backlight == 0) {
1019  0155 c60000        	ld	a,__remote
1020  0158 2652          	jrne	L153
1022  015a c60000        	ld	a,__backup_backlight
1023  015d 264d          	jrne	L153
1024                     ; 289 		if (getHexToBin(buf[6], 7) == 0) {
1026  015f 1e02          	ldw	x,(OFST+1,sp)
1027  0161 e606          	ld	a,(6,x)
1028  0163 ae0007        	ldw	x,#7
1029  0166 95            	ld	xh,a
1030  0167 cd0000        	call	_getHexToBin
1032  016a 4d            	tnz	a
1033  016b 263f          	jrne	L153
1034                     ; 290 			_rcLED = buf[1];
1036  016d 1e02          	ldw	x,(OFST+1,sp)
1037  016f e601          	ld	a,(1,x)
1038  0171 c70003        	ld	__rcLED,a
1039                     ; 292 			if (getHexToBin(buf[1], uiInfo.id - 1) == 1) {
1041  0174 c60004        	ld	a,_uiInfo+4
1042  0177 4a            	dec	a
1043  0178 1602          	ldw	y,(OFST+1,sp)
1044  017a 97            	ld	xl,a
1045  017b 90e601        	ld	a,(1,y)
1046  017e 95            	ld	xh,a
1047  017f cd0000        	call	_getHexToBin
1049  0182 4a            	dec	a
1050  0183 2613          	jrne	L553
1051                     ; 297 				lcd_disp_rid(uiInfo.id, 1, (uiInfo.mode == SETTING_MODE_MASTER) ? 1 : 0);
1053  0185 c60008        	ld	a,_uiInfo+8
1054  0188 4a            	dec	a
1055  0189 2603          	jrne	L611
1056  018b 4c            	inc	a
1057  018c 2001          	jra	L021
1058  018e               L611:
1059  018e 4f            	clr	a
1060  018f               L021:
1061  018f 88            	push	a
1062  0190 c60004        	ld	a,_uiInfo+4
1063  0193 ae0001        	ldw	x,#1
1066  0196 200f          	jp	LC003
1067  0198               L553:
1068                     ; 308 				lcd_disp_rid(uiInfo.id, 0, (uiInfo.mode == SETTING_MODE_MASTER) ? 1 : 0);
1070  0198 c60008        	ld	a,_uiInfo+8
1071  019b 4a            	dec	a
1072  019c 2603          	jrne	L421
1073  019e 4c            	inc	a
1074  019f 2001          	jra	L621
1075  01a1               L421:
1076  01a1 4f            	clr	a
1077  01a2               L621:
1078  01a2 88            	push	a
1079  01a3 c60004        	ld	a,_uiInfo+4
1080  01a6 5f            	clrw	x
1082  01a7               LC003:
1083  01a7 95            	ld	xh,a
1084  01a8 cd0000        	call	_lcd_disp_rid
1085  01ab 84            	pop	a
1086  01ac               L153:
1087                     ; 318 	rc_ptc_check_homenet(buf);
1089  01ac 1e02          	ldw	x,(OFST+1,sp)
1090  01ae cd0000        	call	_rc_ptc_check_homenet
1092                     ; 320 	_version = buf[6] >> 1;
1094  01b1 1e02          	ldw	x,(OFST+1,sp)
1095  01b3 e606          	ld	a,(6,x)
1096  01b5 44            	srl	a
1097  01b6 c70008        	ld	__version,a
1098                     ; 322 	if (mode_recover == 0) {
1100  01b9 c60011        	ld	a,_mode_recover
1101  01bc 2613          	jrne	L163
1102                     ; 323 		error_type = (buf[4] & 0x0F) >> 2;
1104  01be e604          	ld	a,(4,x)
1105  01c0 a40c          	and	a,#12
1106  01c2 44            	srl	a
1107  01c3 44            	srl	a
1108  01c4 c70009        	ld	_error_type,a
1109                     ; 325 		if (error_type != 0) {
1111  01c7 2702          	jreq	L363
1112                     ; 326 			error = buf[5];
1114  01c9 e605          	ld	a,(5,x)
1116  01cb               L363:
1117                     ; 328 			error = 0;
1119  01cb c7000a        	ld	_error,a
1120  01ce cc0147        	jra	L231
1121  01d1               L163:
1122                     ; 331 		if (((buf[4]& 0x0F) >> 2) == 0 && buf[5] == 0) {
1124  01d1 e604          	ld	a,(4,x)
1125  01d3 a40c          	and	a,#12
1126  01d5 44            	srl	a
1127  01d6 44            	srl	a
1128  01d7 5f            	clrw	x
1129  01d8 97            	ld	xl,a
1130  01d9 5d            	tnzw	x
1131  01da 26f2          	jrne	L231
1133  01dc 1e02          	ldw	x,(OFST+1,sp)
1134  01de e605          	ld	a,(5,x)
1135  01e0 26ec          	jrne	L231
1136                     ; 332 			error_type = 0;
1138  01e2 c70009        	ld	_error_type,a
1139                     ; 333 			error = 0;
1141  01e5 c7000a        	ld	_error,a
1142                     ; 334 			mode_recover = 0;
1144  01e8 c70011        	ld	_mode_recover,a
1145                     ; 341 }
1147  01eb cc0147        	jra	L231
1195                     ; 344 void rc_ptc_check_setting(uint8_t *buf) {
1196                     .text:	section	.text,new
1197  0000               _rc_ptc_check_setting:
1199  0000 88            	push	a
1200       00000001      OFST:	set	1
1203                     ; 345 	uint8_t page = buf[0] & 0x0F;
1205  0001 f6            	ld	a,(x)
1206  0002 a40f          	and	a,#15
1207  0004 6b01          	ld	(OFST+0,sp),a
1209                     ; 347 	if (uiInfo.mode != SETTING_MODE_MASTER) {
1211  0006 c60008        	ld	a,_uiInfo+8
1212  0009 4a            	dec	a
1213  000a 2702          	jreq	L314
1214                     ; 348 		return;
1217  000c 84            	pop	a
1218  000d 81            	ret	
1219  000e               L314:
1220                     ; 351 	state_check = RC_STATE_SETTING;
1222  000e 3502000b      	mov	_state_check,#2
1223                     ; 353 	if (cur_set_page == page) {
1225  0012 c60007        	ld	a,_cur_set_page
1226  0015 1101          	cp	a,(OFST+0,sp)
1227  0017 2607          	jrne	L514
1228                     ; 354 		cur_set_page++;
1230  0019 725c0007      	inc	_cur_set_page
1231  001d c60007        	ld	a,_cur_set_page
1232  0020               L514:
1233                     ; 357 	if (cur_set_page == MAX_SETTING_PAGE) { 
1235  0020 a103          	cp	a,#3
1236  0022 2613          	jrne	L714
1237                     ; 358 		set_changed = 0;
1239  0024 725f000e      	clr	_set_changed
1240                     ; 359 		cur_set_page = 0;
1242  0028 725f0007      	clr	_cur_set_page
1243                     ; 361 		func_rc_settingCb(1);
1245  002c a601          	ld	a,#1
1246  002e cd0000        	call	_func_rc_settingCb
1248                     ; 362 		state_check = RC_STATE_NORMAL;
1250  0031 3501000b      	mov	_state_check,#1
1252  0035 2004          	jra	L124
1253  0037               L714:
1254                     ; 364 		func_rc_settingCb(0);
1256  0037 4f            	clr	a
1257  0038 cd0000        	call	_func_rc_settingCb
1259  003b               L124:
1260                     ; 366 }
1263  003b 84            	pop	a
1264  003c 81            	ret	
1322                     ; 369 void rc_ptc_check_rc(uint8_t *buf) {
1323                     .text:	section	.text,new
1324  0000               _rc_ptc_check_rc:
1326  0000 89            	pushw	x
1327  0001 89            	pushw	x
1328       00000002      OFST:	set	2
1331                     ; 373 	st = (buf[0] & 0x0F) - 1;
1333  0002 f6            	ld	a,(x)
1334  0003 a40f          	and	a,#15
1335  0005 4a            	dec	a
1336  0006 6b02          	ld	(OFST+0,sp),a
1338                     ; 375 	if (uiInfo.mode != SETTING_MODE_MASTER) {
1340  0008 c60008        	ld	a,_uiInfo+8
1341  000b 4a            	dec	a
1342  000c 2743          	jreq	L174
1343                     ; 376 		if (st == 0) {
1345  000e 7b02          	ld	a,(OFST+0,sp)
1346  0010 2703cc00b4    	jrne	L251
1347                     ; 377 			if (buf[1] == RC_MODE_OUT && (buf[5] & 0x01)  == 0) {
1349  0015 e601          	ld	a,(1,x)
1350  0017 a102          	cp	a,#2
1351  0019 2612          	jrne	L574
1353  001b e605          	ld	a,(5,x)
1354  001d a501          	bcp	a,#1
1355  001f 260c          	jrne	L574
1356                     ; 378 				_disp_mode2 = RC_MODE_OUT;
1358  0021 35020000      	mov	__disp_mode2,#2
1359                     ; 379 				dr_mode_out = 0;
1361  0025 725f0002      	clr	_dr_mode_out
1362                     ; 383 				dr_mode_out = 1;
1364  0029 35010002      	mov	_dr_mode_out,#1
1365  002d               L574:
1366                     ; 387 			if (dr_mode_out == 0) {
1368  002d c60002        	ld	a,_dr_mode_out
1369  0030 26e0          	jrne	L251
1370                     ; 388 				if (_disp_mode2 == RC_MODE_OUT) {
1372  0032 c60000        	ld	a,__disp_mode2
1373  0035 a102          	cp	a,#2
1374  0037 267b          	jrne	L251
1375                     ; 389 					if (buf[1] != RC_MODE_OUT) {
1377  0039 1e03          	ldw	x,(OFST+1,sp)
1378  003b e601          	ld	a,(1,x)
1379  003d a102          	cp	a,#2
1380  003f 2705          	jreq	L305
1381                     ; 390 						packet_changed = 1;
1383  0041 cd016f        	call	LC007
1384                     ; 392 						_disp_mode2 = FW_GET_DISPMODE;
1385  0044 206e          	jra	L251
1386  0046               L305:
1387                     ; 394 						if((buf[5] & 0x01) != 0)  {
1389  0046 e605          	ld	a,(5,x)
1390  0048 a501          	bcp	a,#1
1391  004a 2768          	jreq	L251
1392                     ; 395 							packet_changed = 1;
1394  004c cd016f        	call	LC007
1395                     ; 403 		return;
1397  004f 2063          	jra	L251
1398  0051               L174:
1399                     ; 406 	k = 0;
1401  0051 6b01          	ld	(OFST-1,sp),a
1403                     ; 408 	packet_buf[st] = 0;
1405  0053 5f            	clrw	x
1406  0054 7b02          	ld	a,(OFST+0,sp)
1407  0056 97            	ld	xl,a
1408  0057 724f0000      	clr	(_packet_buf,x)
1409                     ; 410 	if (_remote == 0) {
1411  005b 725d0000      	tnz	__remote
1412  005f 2703cc013e    	jrne	L115
1413                     ; 411 		if (rcSubDataInfo.mode_heat[st] == 0xFF) {
1415  0064 5f            	clrw	x
1416  0065 97            	ld	xl,a
1417  0066 d60027        	ld	a,(_rcSubDataInfo+16,x)
1418  0069 4c            	inc	a
1419  006a 264b          	jrne	L315
1420                     ; 412 			if (uiInfo.remote_mode[st] != buf[1]) {
1422  006c 7b02          	ld	a,(OFST+0,sp)
1423  006e 5f            	clrw	x
1424  006f 97            	ld	xl,a
1425  0070 d60045        	ld	a,(_uiInfo+69,x)
1426  0073 1e03          	ldw	x,(OFST+1,sp)
1427  0075 e101          	cp	a,(1,x)
1428                     ; 413 				k = 1;
1430  0077 2632          	jrne	LC004
1431                     ; 416 				switch (buf[1]) {
1433  0079 e601          	ld	a,(1,x)
1435                     ; 435 						break;
1436  007b 4a            	dec	a
1437  007c 270a          	jreq	L324
1438  007e a007          	sub	a,#7
1439  0080 2713          	jreq	L134
1440  0082 a008          	sub	a,#8
1441  0084 2718          	jreq	L334
1442  0086 2027          	jra	L715
1443  0088               L324:
1444                     ; 417 					case RC_MODE_HEAT:
1444                     ; 418 						if (uiInfo.tempSetup[st] != buf[3]) {
1446  0088 7b02          	ld	a,(OFST+0,sp)
1447  008a 5f            	clrw	x
1448  008b 97            	ld	xl,a
1449  008c d6003d        	ld	a,(_uiInfo+61,x)
1450  008f 1e03          	ldw	x,(OFST+1,sp)
1451  0091 e103          	cp	a,(3,x)
1452                     ; 419 							k = 1;
1453  0093 2014          	jp	LC005
1454                     ; 422 					case RC_MODE_OUT:
1454                     ; 423 						break;
1456                     ; 424 					case RC_MODE_STOP:
1456                     ; 425 						break;
1458  0095               L134:
1459                     ; 426 					case RC_MODE_RESERVE:
1459                     ; 427 						if (uiInfo.remote_time[st] != buf[5]) {
1461  0095 7b02          	ld	a,(OFST+0,sp)
1462  0097 5f            	clrw	x
1463  0098 97            	ld	xl,a
1464  0099 d6004d        	ld	a,(_uiInfo+77,x)
1465                     ; 428 							k = 1;
1466  009c 2007          	jp	LC006
1467  009e               L334:
1468                     ; 431 					case RC_MODE_REPEAT:
1468                     ; 432 						if (uiInfo.remote_banb[st] != buf[5]) {
1470  009e 7b02          	ld	a,(OFST+0,sp)
1471  00a0 5f            	clrw	x
1472  00a1 97            	ld	xl,a
1473  00a2 d60055        	ld	a,(_uiInfo+85,x)
1474  00a5               LC006:
1475  00a5 1e03          	ldw	x,(OFST+1,sp)
1476  00a7 e105          	cp	a,(5,x)
1477  00a9               LC005:
1478  00a9 2704          	jreq	L715
1479                     ; 433 							k = 1;
1481  00ab               LC004:
1485  00ab a601          	ld	a,#1
1486  00ad 6b01          	ld	(OFST-1,sp),a
1488  00af               L715:
1489                     ; 439 			if (k == 1) {
1491  00af 7b01          	ld	a,(OFST-1,sp)
1492  00b1 4a            	dec	a
1493  00b2 2603          	jrne	L315
1494                     ; 440 				return;
1495  00b4               L251:
1498  00b4 5b04          	addw	sp,#4
1499  00b6 81            	ret	
1500  00b7               L315:
1501                     ; 444 		rcSubDataInfo.mode_heat[st] = buf[1];
1503  00b7 7b02          	ld	a,(OFST+0,sp)
1504  00b9 5f            	clrw	x
1505  00ba 1603          	ldw	y,(OFST+1,sp)
1506  00bc 97            	ld	xl,a
1507  00bd 90e601        	ld	a,(1,y)
1508  00c0 d70027        	ld	(_rcSubDataInfo+16,x),a
1509                     ; 445 		rcSubDataInfo.cur_temp[st] = buf[2];
1511  00c3 5f            	clrw	x
1512  00c4 7b02          	ld	a,(OFST+0,sp)
1513  00c6 97            	ld	xl,a
1514  00c7 90e602        	ld	a,(2,y)
1515  00ca d70017        	ld	(_rcSubDataInfo,x),a
1516                     ; 447 		uiInfo.remote_mode[st] = buf[1];
1518  00cd 5f            	clrw	x
1519  00ce 7b02          	ld	a,(OFST+0,sp)
1520  00d0 97            	ld	xl,a
1521  00d1 90e601        	ld	a,(1,y)
1522  00d4 d70045        	ld	(_uiInfo+69,x),a
1523                     ; 448 		uiInfo.tempCurr[st] = buf[2];
1525  00d7 5f            	clrw	x
1526  00d8 7b02          	ld	a,(OFST+0,sp)
1527  00da 97            	ld	xl,a
1528  00db 90e602        	ld	a,(2,y)
1529  00de d70035        	ld	(_uiInfo+53,x),a
1530                     ; 450 		switch (buf[1]) {
1532  00e1 93            	ldw	x,y
1533  00e2 e601          	ld	a,(1,x)
1535                     ; 466 				break;
1536  00e4 4a            	dec	a
1537  00e5 270a          	jreq	L534
1538  00e7 a007          	sub	a,#7
1539  00e9 271c          	jreq	L344
1540  00eb a008          	sub	a,#8
1541  00ed 272e          	jreq	L544
1542  00ef 2040          	jra	L735
1543  00f1               L534:
1544                     ; 451 			case RC_MODE_HEAT:
1544                     ; 452 				rcSubDataInfo.set_temp[st] = buf[3];
1546  00f1 7b02          	ld	a,(OFST+0,sp)
1547  00f3 5f            	clrw	x
1548  00f4 97            	ld	xl,a
1549  00f5 90e603        	ld	a,(3,y)
1550  00f8 d7001f        	ld	(_rcSubDataInfo+8,x),a
1551                     ; 453 				uiInfo.tempSetup[st] = buf[3];
1553  00fb 5f            	clrw	x
1554  00fc 7b02          	ld	a,(OFST+0,sp)
1555  00fe 97            	ld	xl,a
1556  00ff 90e603        	ld	a,(3,y)
1557  0102 d7003d        	ld	(_uiInfo+61,x),a
1558                     ; 454 				break;
1560  0105 202a          	jra	L735
1561                     ; 455 			case RC_MODE_OUT:
1561                     ; 456 				break;
1563                     ; 457 			case RC_MODE_STOP:
1563                     ; 458 				break;
1565  0107               L344:
1566                     ; 459 			case RC_MODE_RESERVE:
1566                     ; 460 				rcSubDataInfo.time[st] = buf[5];
1568  0107 7b02          	ld	a,(OFST+0,sp)
1569  0109 5f            	clrw	x
1570  010a 97            	ld	xl,a
1571  010b 90e605        	ld	a,(5,y)
1572  010e d70037        	ld	(_rcSubDataInfo+32,x),a
1573                     ; 461 				uiInfo.remote_time[st] = buf[5];
1575  0111 5f            	clrw	x
1576  0112 7b02          	ld	a,(OFST+0,sp)
1577  0114 97            	ld	xl,a
1578  0115 90e605        	ld	a,(5,y)
1579  0118 d7004d        	ld	(_uiInfo+77,x),a
1580                     ; 462 				break;
1582  011b 2014          	jra	L735
1583  011d               L544:
1584                     ; 463 			case RC_MODE_REPEAT:
1584                     ; 464 				rcSubDataInfo.banb[st] = buf[5];
1586  011d 7b02          	ld	a,(OFST+0,sp)
1587  011f 5f            	clrw	x
1588  0120 97            	ld	xl,a
1589  0121 90e605        	ld	a,(5,y)
1590  0124 d7003f        	ld	(_rcSubDataInfo+40,x),a
1591                     ; 465 				uiInfo.remote_banb[st] = buf[5];
1593  0127 5f            	clrw	x
1594  0128 7b02          	ld	a,(OFST+0,sp)
1595  012a 97            	ld	xl,a
1596  012b 90e605        	ld	a,(5,y)
1597  012e d70055        	ld	(_uiInfo+85,x),a
1598                     ; 466 				break;
1600  0131               L735:
1601                     ; 469 		disp_char(uiInfo.remote_mode[st]);
1603  0131 7b02          	ld	a,(OFST+0,sp)
1604  0133 5f            	clrw	x
1605  0134 97            	ld	xl,a
1606  0135 d60045        	ld	a,(_uiInfo+69,x)
1607  0138 cd0000        	call	_disp_char
1610  013b cc00b4        	jra	L251
1611  013e               L115:
1612                     ; 473 		rcSubDataInfo.mode_heat[st] = 0xFF;
1614  013e 5f            	clrw	x
1615  013f 97            	ld	xl,a
1616  0140 a6ff          	ld	a,#255
1617  0142 d70027        	ld	(_rcSubDataInfo+16,x),a
1618                     ; 474 		rcSubDataInfo.cur_temp[st] = buf[2];
1620  0145 5f            	clrw	x
1621  0146 7b02          	ld	a,(OFST+0,sp)
1622  0148 1603          	ldw	y,(OFST+1,sp)
1623  014a 97            	ld	xl,a
1624  014b 90e602        	ld	a,(2,y)
1625  014e d70017        	ld	(_rcSubDataInfo,x),a
1626                     ; 475 		rcSubDataInfo.set_temp[st] = 0xFF;
1628  0151 5f            	clrw	x
1629  0152 7b02          	ld	a,(OFST+0,sp)
1630  0154 97            	ld	xl,a
1631  0155 a6ff          	ld	a,#255
1632  0157 d7001f        	ld	(_rcSubDataInfo+8,x),a
1633                     ; 476 		rcSubDataInfo.time[st] = 0xFF;
1635  015a 5f            	clrw	x
1636  015b 7b02          	ld	a,(OFST+0,sp)
1637  015d 97            	ld	xl,a
1638  015e a6ff          	ld	a,#255
1639  0160 d70037        	ld	(_rcSubDataInfo+32,x),a
1640                     ; 477 		rcSubDataInfo.banb[st] = 0xFF;
1642  0163 5f            	clrw	x
1643  0164 7b02          	ld	a,(OFST+0,sp)
1644  0166 97            	ld	xl,a
1645  0167 a6ff          	ld	a,#255
1646  0169 d7003f        	ld	(_rcSubDataInfo+40,x),a
1647                     ; 479 }
1649  016c cc00b4        	jra	L251
1650  016f               LC007:
1651  016f 35010005      	mov	_packet_changed,#1
1652                     ; 396 							dr_mode_out = 1;
1654  0173 35010002      	mov	_dr_mode_out,#1
1655                     ; 397 							_disp_mode2 = FW_GET_DISPMODE;
1657  0177 a629          	ld	a,#41
1658  0179 cd0000        	call	_file_read
1660  017c c70000        	ld	__disp_mode2,a
1661  017f 81            	ret	
1707                     ; 482 void rc_ptc_check_subrc(uint8_t *buf) {
1708                     .text:	section	.text,new
1709  0000               _rc_ptc_check_subrc:
1711  0000 89            	pushw	x
1712  0001 88            	push	a
1713       00000001      OFST:	set	1
1716                     ; 483 	uint8_t start = buf[0] & 0x0F;
1718  0002 f6            	ld	a,(x)
1719  0003 a40f          	and	a,#15
1720  0005 6b01          	ld	(OFST+0,sp),a
1722                     ; 485 	state_check = RC_STATE_NONE;
1724  0007 725f000b      	clr	_state_check
1725                     ; 487 	if (uiInfo.mode == SETTING_MODE_MASTER) {
1727  000b c60008        	ld	a,_uiInfo+8
1728  000e 4a            	dec	a
1729  000f 2707          	jreq	L651
1730                     ; 488 		return;
1732                     ; 491 	if (start != uiInfo.id) {
1734  0011 7b01          	ld	a,(OFST+0,sp)
1735  0013 c10004        	cp	a,_uiInfo+4
1736  0016 2703          	jreq	L375
1737                     ; 492 		return;
1738  0018               L651:
1741  0018 5b03          	addw	sp,#3
1742  001a 81            	ret	
1743  001b               L375:
1744                     ; 495 	packet_changed = 1;	
1746  001b 35010005      	mov	_packet_changed,#1
1747                     ; 496 	_disp_mode2 = buf[1];
1749  001f 1e02          	ldw	x,(OFST+1,sp)
1750  0021 e601          	ld	a,(1,x)
1751  0023 c70000        	ld	__disp_mode2,a
1752                     ; 498 	switch(_disp_mode2)
1755                     ; 502 	case RC_MODE_REPEAT:	uiInfo.repeat = buf[5];	break;
1756  0026 4a            	dec	a
1757  0027 270a          	jreq	L345
1758  0029 a007          	sub	a,#7
1759  002b 270d          	jreq	L545
1760  002d a008          	sub	a,#8
1761  002f 2710          	jreq	L745
1762  0031 20e5          	jra	L651
1763  0033               L345:
1764                     ; 500 	case RC_MODE_HEAT:		uiInfo.tSetup = buf[3];	break;
1766  0033 e603          	ld	a,(3,x)
1767  0035 c7000e        	ld	_uiInfo+14,a
1770  0038 20de          	jra	L651
1771  003a               L545:
1772                     ; 501 	case RC_MODE_RESERVE:	uiInfo.reserve = buf[5];	break;
1774  003a e605          	ld	a,(5,x)
1775  003c c7000d        	ld	_uiInfo+13,a
1778  003f 20d7          	jra	L651
1779  0041               L745:
1780                     ; 502 	case RC_MODE_REPEAT:	uiInfo.repeat = buf[5];	break;
1782  0041 e605          	ld	a,(5,x)
1783  0043 c7000c        	ld	_uiInfo+12,a
1786                     ; 504 }
1788  0046 20d0          	jra	L651
1851                     ; 506 void rc_ptc_check_mirror(uint8_t *buf) {
1852                     .text:	section	.text,new
1853  0000               _rc_ptc_check_mirror:
1855  0000 89            	pushw	x
1856       00000001      OFST:	set	1
1859                     ; 511 	state_check = RC_STATE_NONE;
1861  0001 725f000b      	clr	_state_check
1862  0005 88            	push	a
1863                     ; 513 	if (uiInfo.mode != SETTING_MODE_MASTER) {
1865  0006 c60008        	ld	a,_uiInfo+8
1866  0009 a101          	cp	a,#1
1867  000b 2703cc01b3    	jrne	L736
1868                     ; 514 		return;
1870                     ; 517 	page = buf[0] & 0x0F;
1872  0010 f6            	ld	a,(x)
1873  0011 a40f          	and	a,#15
1874  0013 6b01          	ld	(OFST+0,sp),a
1876                     ; 518 	cur_mirror_page = page;
1878  0015 c70006        	ld	_cur_mirror_page,a
1879                     ; 519 	state_check = RC_STATE_MIRROR;
1881  0018 3506000b      	mov	_state_check,#6
1882                     ; 521 	switch(page) {
1885                     ; 602 			break;
1886  001c 270f          	jreq	L106
1887  001e 4a            	dec	a
1888  001f 2603cc00a3    	jreq	L306
1889  0024 4a            	dec	a
1890  0025 2603cc012e    	jreq	L506
1891  002a cc01b3        	jra	L736
1892  002d               L106:
1893                     ; 522 		case 0:
1893                     ; 523 			mode = (buf[6] & 0x80) >> 7;
1895  002d e606          	ld	a,(6,x)
1896  002f 49            	rlc	a
1897  0030 4f            	clr	a
1898  0031 49            	rlc	a
1899  0032 6b01          	ld	(OFST+0,sp),a
1901                     ; 524 			if (mode == CNT_MODE_MAIN) {
1903  0034 2654          	jrne	L146
1904                     ; 525 				_boiler_type = (buf[1] & 0x80) >> 7;
1906  0036 cd01c2        	call	LC010
1907  0039 c70000        	ld	__boiler_type,a
1908                     ; 526 				uiInfo.lpmType = (buf[1] & 0x0F);
1910  003c e601          	ld	a,(1,x)
1911  003e a40f          	and	a,#15
1912  0040 c70013        	ld	_uiInfo+19,a
1913                     ; 527 				uiInfo.cnt = (buf[2] & 0x70) >> 4;
1915  0043 cd01b6        	call	LC008
1916  0046 c70005        	ld	_uiInfo+5,a
1917                     ; 528 				uiInfo.valve = buf[2] & 0x0F;
1919  0049 e602          	ld	a,(2,x)
1920  004b a40f          	and	a,#15
1921  004d c7000a        	ld	_uiInfo+10,a
1922                     ; 529 				_boiler_water_shower = buf[3];
1924  0050 e603          	ld	a,(3,x)
1925  0052 c70000        	ld	__boiler_water_shower,a
1926                     ; 530 				uiInfo.houseCapa = buf[4];
1928  0055 e604          	ld	a,(4,x)
1929  0057 c70010        	ld	_uiInfo+16,a
1930                     ; 531 				_boiler_water_heat = buf[5] ;
1932  005a e605          	ld	a,(5,x)
1933  005c c70000        	ld	__boiler_water_heat,a
1934                     ; 532 				uiInfo.controlMode = mode;
1936  005f 7b01          	ld	a,(OFST+0,sp)
1937  0061 c70009        	ld	_uiInfo+9,a
1938                     ; 533 				uiInfo.subRCLock = (buf[6] & 0x40) >> 6 ;
1940  0064 e606          	ld	a,(6,x)
1941  0066 4e            	swap	a
1942  0067 a404          	and	a,#4
1943  0069 44            	srl	a
1944  006a 44            	srl	a
1945  006b c7005d        	ld	_uiInfo+93,a
1946                     ; 534 				uiInfo.poType = (buf[6] & 0x30) >> 4;
1948  006e e606          	ld	a,(6,x)
1949  0070 4e            	swap	a
1950  0071 a403          	and	a,#3
1951  0073 c7000f        	ld	_uiInfo+15,a
1952                     ; 535 				uiInfo.cntlMode = (buf[6] & 0x08) >> 3;
1954  0076 e606          	ld	a,(6,x)
1955  0078 a408          	and	a,#8
1956  007a 44            	srl	a
1957  007b 44            	srl	a
1958  007c 44            	srl	a
1959  007d c70003        	ld	_uiInfo+3,a
1960                     ; 536 				uiInfo.opMode = buf[6] & 0x07;
1962  0080 e606          	ld	a,(6,x)
1963  0082 a407          	and	a,#7
1964  0084 c70007        	ld	_uiInfo+7,a
1966  0087 cc01b3        	jra	L736
1967  008a               L146:
1968                     ; 538 				uiInfo.lpmType_sub = (buf[1] & 0x0F);
1970  008a e601          	ld	a,(1,x)
1971  008c a40f          	and	a,#15
1972  008e c70014        	ld	_uiInfo+20,a
1973                     ; 539 				uiInfo.cnt_sub = (buf[2] & 0xF0) >> 4;
1975  0091 e602          	ld	a,(2,x)
1976  0093 4e            	swap	a
1977  0094 a40f          	and	a,#15
1978  0096 c70006        	ld	_uiInfo+6,a
1979                     ; 540 				uiInfo.valve_sub = buf[2] & 0x0F;
1981  0099 e602          	ld	a,(2,x)
1982  009b a40f          	and	a,#15
1983  009d c7000b        	ld	_uiInfo+11,a
1984  00a0 cc01b3        	jra	L736
1985  00a3               L306:
1986                     ; 543 		case 1:
1986                     ; 544 			mode = (buf[1] & 0x80) >> 7;
1988  00a3 cd01c2        	call	LC010
1989  00a6 6b01          	ld	(OFST+0,sp),a
1991                     ; 545 			if (mode == CNT_MODE_MAIN) {
1993  00a8 2631          	jrne	L546
1994                     ; 546 				uiInfo.valve_rc[0] = (buf[1] & 0x70) >> 4;
1996  00aa cd01bc        	call	LC009
1997  00ad c7001d        	ld	_uiInfo+29,a
1998                     ; 547 				uiInfo.valve_rc[1] = buf[1] & 0x07;
2000  00b0 e601          	ld	a,(1,x)
2001  00b2 a407          	and	a,#7
2002  00b4 c7001e        	ld	_uiInfo+30,a
2003                     ; 548 				uiInfo.valve_rc[2] = (buf[2] & 0x70) >> 4;
2005  00b7 cd01b6        	call	LC008
2006  00ba c7001f        	ld	_uiInfo+31,a
2007                     ; 549 				uiInfo.valve_rc[3] = buf[2] & 0x07;
2009  00bd e602          	ld	a,(2,x)
2010  00bf a407          	and	a,#7
2011  00c1 c70020        	ld	_uiInfo+32,a
2012                     ; 551 				uiInfo.valve_len[0] = buf[3];
2014  00c4 e603          	ld	a,(3,x)
2015  00c6 c70015        	ld	_uiInfo+21,a
2016                     ; 552 				uiInfo.valve_len[1] = buf[4];
2018  00c9 e604          	ld	a,(4,x)
2019  00cb c70016        	ld	_uiInfo+22,a
2020                     ; 553 				uiInfo.valve_len[2] = buf[5];
2022  00ce e605          	ld	a,(5,x)
2023  00d0 c70017        	ld	_uiInfo+23,a
2024                     ; 554 				uiInfo.valve_len[3] = buf[6];
2026  00d3 e606          	ld	a,(6,x)
2027  00d5 c70018        	ld	_uiInfo+24,a
2029  00d8 cc01b3        	jra	L736
2030  00db               L546:
2031                     ; 556 				uiInfo.valve_sub_rc[0] = (buf[1] & 0x70) >> 4;
2033  00db cd01bc        	call	LC009
2034  00de c7002d        	ld	_uiInfo+45,a
2035                     ; 557 				uiInfo.valve_sub_rc[1] = buf[1] & 0x07;
2037  00e1 e601          	ld	a,(1,x)
2038  00e3 a407          	and	a,#7
2039  00e5 c7002e        	ld	_uiInfo+46,a
2040                     ; 558 				uiInfo.valve_sub_rc[2] = (buf[2] & 0x70) >> 4;
2042  00e8 cd01b6        	call	LC008
2043  00eb c7002f        	ld	_uiInfo+47,a
2044                     ; 559 				uiInfo.valve_sub_rc[3] = buf[2] & 0x07;
2046  00ee e602          	ld	a,(2,x)
2047  00f0 a407          	and	a,#7
2048  00f2 c70030        	ld	_uiInfo+48,a
2049                     ; 561 				uiInfo.valve_sub_len[0] = buf[3];
2051  00f5 e603          	ld	a,(3,x)
2052  00f7 c70025        	ld	_uiInfo+37,a
2053                     ; 562 				uiInfo.valve_sub_len[1] = buf[4];
2055  00fa e604          	ld	a,(4,x)
2056  00fc c70026        	ld	_uiInfo+38,a
2057                     ; 563 				uiInfo.valve_sub_len[2] = buf[5];
2059  00ff e605          	ld	a,(5,x)
2060  0101 c70027        	ld	_uiInfo+39,a
2061                     ; 564 				uiInfo.valve_sub_len[3] = buf[6];
2063  0104 e606          	ld	a,(6,x)
2064  0106 c70028        	ld	_uiInfo+40,a
2065                     ; 566 				for (i = 0 ; i < 4 ; i++) {
2067  0109 4f            	clr	a
2068  010a 6b01          	ld	(OFST+0,sp),a
2070  010c               L156:
2071                     ; 567 					if (uiInfo.valve_sub_rc[i] == 0 && uiInfo.valve_sub_len[i] != 0) {
2073  010c 5f            	clrw	x
2074  010d 97            	ld	xl,a
2075  010e 724d002d      	tnz	(_uiInfo+45,x)
2076  0112 260f          	jrne	L756
2078  0114 5f            	clrw	x
2079  0115 97            	ld	xl,a
2080  0116 724d0025      	tnz	(_uiInfo+37,x)
2081  011a 2707          	jreq	L756
2082                     ; 568 						uiInfo.valve_sub_rc[i] = 8;
2084  011c 5f            	clrw	x
2085  011d 97            	ld	xl,a
2086  011e a608          	ld	a,#8
2087  0120 d7002d        	ld	(_uiInfo+45,x),a
2088  0123               L756:
2089                     ; 566 				for (i = 0 ; i < 4 ; i++) {
2091  0123 0c01          	inc	(OFST+0,sp)
2095  0125 7b01          	ld	a,(OFST+0,sp)
2096  0127 a104          	cp	a,#4
2097  0129 25e1          	jrult	L156
2098  012b cc01b3        	jra	L736
2099  012e               L506:
2100                     ; 573 		case 2:
2100                     ; 574 			mode = (buf[1] & 0x80) >> 7;
2102  012e cd01c2        	call	LC010
2103  0131 6b01          	ld	(OFST+0,sp),a
2105                     ; 575 			if (mode == CNT_MODE_MAIN) {
2107  0133 262f          	jrne	L166
2108                     ; 576 				uiInfo.valve_rc[4] = (buf[1] & 0x70) >> 4;
2110  0135 cd01bc        	call	LC009
2111  0138 c70021        	ld	_uiInfo+33,a
2112                     ; 577 				uiInfo.valve_rc[5] = buf[1] & 0x07;
2114  013b e601          	ld	a,(1,x)
2115  013d a407          	and	a,#7
2116  013f c70022        	ld	_uiInfo+34,a
2117                     ; 578 				uiInfo.valve_rc[6] = (buf[2] & 0x70) >> 4;
2119  0142 ad72          	call	LC008
2120  0144 c70023        	ld	_uiInfo+35,a
2121                     ; 579 				uiInfo.valve_rc[7] = buf[2] & 0x07;
2123  0147 e602          	ld	a,(2,x)
2124  0149 a407          	and	a,#7
2125  014b c70024        	ld	_uiInfo+36,a
2126                     ; 581 				uiInfo.valve_len[4] = buf[3];
2128  014e e603          	ld	a,(3,x)
2129  0150 c70019        	ld	_uiInfo+25,a
2130                     ; 582 				uiInfo.valve_len[5] = buf[4];
2132  0153 e604          	ld	a,(4,x)
2133  0155 c7001a        	ld	_uiInfo+26,a
2134                     ; 583 				uiInfo.valve_len[6] = buf[5];
2136  0158 e605          	ld	a,(5,x)
2137  015a c7001b        	ld	_uiInfo+27,a
2138                     ; 584 				uiInfo.valve_len[7] = buf[6];
2140  015d e606          	ld	a,(6,x)
2141  015f c7001c        	ld	_uiInfo+28,a
2143  0162 204f          	jra	L736
2144  0164               L166:
2145                     ; 586 				uiInfo.valve_sub_rc[4] = (buf[1] & 0x70) >> 4;
2147  0164 ad56          	call	LC009
2148  0166 c70031        	ld	_uiInfo+49,a
2149                     ; 587 				uiInfo.valve_sub_rc[5] = buf[1] & 0x07;
2151  0169 e601          	ld	a,(1,x)
2152  016b a407          	and	a,#7
2153  016d c70032        	ld	_uiInfo+50,a
2154                     ; 588 				uiInfo.valve_sub_rc[6] = (buf[2] & 0x70) >> 4;
2156  0170 ad44          	call	LC008
2157  0172 c70033        	ld	_uiInfo+51,a
2158                     ; 589 				uiInfo.valve_sub_rc[7] = buf[2] & 0x07;
2160  0175 e602          	ld	a,(2,x)
2161  0177 a407          	and	a,#7
2162  0179 c70034        	ld	_uiInfo+52,a
2163                     ; 591 				uiInfo.valve_sub_len[4] = buf[3];
2165  017c e603          	ld	a,(3,x)
2166  017e c70029        	ld	_uiInfo+41,a
2167                     ; 592 				uiInfo.valve_sub_len[5] = buf[4];
2169  0181 e604          	ld	a,(4,x)
2170  0183 c7002a        	ld	_uiInfo+42,a
2171                     ; 593 				uiInfo.valve_sub_len[6] = buf[5];
2173  0186 e605          	ld	a,(5,x)
2174  0188 c7002b        	ld	_uiInfo+43,a
2175                     ; 594 				uiInfo.valve_sub_len[7] = buf[6];
2177  018b e606          	ld	a,(6,x)
2178  018d c7002c        	ld	_uiInfo+44,a
2179                     ; 596 				for (i = 4 ; i < 8 ; i++) {
2181  0190 a604          	ld	a,#4
2182  0192 6b01          	ld	(OFST+0,sp),a
2184  0194               L566:
2185                     ; 597 					if (uiInfo.valve_sub_rc[i] == 0 && uiInfo.valve_sub_len[i] != 0) {
2187  0194 5f            	clrw	x
2188  0195 97            	ld	xl,a
2189  0196 724d002d      	tnz	(_uiInfo+45,x)
2190  019a 260f          	jrne	L376
2192  019c 5f            	clrw	x
2193  019d 97            	ld	xl,a
2194  019e 724d0025      	tnz	(_uiInfo+37,x)
2195  01a2 2707          	jreq	L376
2196                     ; 598 						uiInfo.valve_sub_rc[i] = 8;
2198  01a4 5f            	clrw	x
2199  01a5 97            	ld	xl,a
2200  01a6 a608          	ld	a,#8
2201  01a8 d7002d        	ld	(_uiInfo+45,x),a
2202  01ab               L376:
2203                     ; 596 				for (i = 4 ; i < 8 ; i++) {
2205  01ab 0c01          	inc	(OFST+0,sp)
2209  01ad 7b01          	ld	a,(OFST+0,sp)
2210  01af a108          	cp	a,#8
2211  01b1 25e1          	jrult	L566
2212  01b3               L736:
2213                     ; 604 }
2216  01b3 5b03          	addw	sp,#3
2217  01b5 81            	ret	
2218  01b6               LC008:
2219  01b6 e602          	ld	a,(2,x)
2220  01b8 4e            	swap	a
2221  01b9 a407          	and	a,#7
2222  01bb 81            	ret	
2223  01bc               LC009:
2224  01bc e601          	ld	a,(1,x)
2225  01be 4e            	swap	a
2226  01bf a407          	and	a,#7
2227  01c1 81            	ret	
2228  01c2               LC010:
2229  01c2 e601          	ld	a,(1,x)
2230  01c4 49            	rlc	a
2231  01c5 4f            	clr	a
2232  01c6 49            	rlc	a
2233  01c7 81            	ret	
2282                     ; 606 void rc_ptc_check(uint8_t *buf) {
2283                     .text:	section	.text,new
2284  0000               _rc_ptc_check:
2286  0000 89            	pushw	x
2287  0001 88            	push	a
2288       00000001      OFST:	set	1
2291                     ; 608 	start = buf[0] & 0xF0;
2293  0002 f6            	ld	a,(x)
2294  0003 a4f0          	and	a,#240
2295  0005 6b01          	ld	(OFST+0,sp),a
2297                     ; 610 	switch(start) {
2300                     ; 630 			break;
2301  0007 a020          	sub	a,#32
2302  0009 2738          	jreq	L507
2303  000b a010          	sub	a,#16
2304  000d 271f          	jreq	L776
2305  000f a030          	sub	a,#48
2306  0011 2729          	jreq	L307
2307  0013 a010          	sub	a,#16
2308  0015 2710          	jreq	L576
2309  0017 a080          	sub	a,#128
2310  0019 271a          	jreq	L107
2311                     ; 626 		default:
2311                     ; 627 			state_check = RC_STATE_ERROR;
2313  001b 3504000b      	mov	_state_check,#4
2314                     ; 628 			disp_char(buf[0]);
2316  001f 1e02          	ldw	x,(OFST+1,sp)
2317  0021 f6            	ld	a,(x)
2318  0022 cd0000        	call	_disp_char
2320                     ; 630 			break;
2322  0025 2021          	jra	L337
2323  0027               L576:
2324                     ; 611 		case BYTE_START_CNT_NORMAL:
2324                     ; 612 			rc_ptc_check_normal(buf);
2326  0027 1e02          	ldw	x,(OFST+1,sp)
2327  0029 cd0000        	call	_rc_ptc_check_normal
2329                     ; 613 			break;
2331  002c 201a          	jra	L337
2332  002e               L776:
2333                     ; 614 		case BYTE_START_CNT_SETTING:
2333                     ; 615 			rc_ptc_check_setting(buf);
2335  002e 1e02          	ldw	x,(OFST+1,sp)
2336  0030 cd0000        	call	_rc_ptc_check_setting
2338                     ; 616 			break;
2340  0033 2013          	jra	L337
2341  0035               L107:
2342                     ; 617 		case BYTE_START_RC_NORMAL:
2342                     ; 618 			rc_ptc_check_rc(buf);
2344  0035 1e02          	ldw	x,(OFST+1,sp)
2345  0037 cd0000        	call	_rc_ptc_check_rc
2347                     ; 619 			break;
2349  003a 200c          	jra	L337
2350  003c               L307:
2351                     ; 620 		case BYTE_START_RC_SUBRC:
2351                     ; 621 			rc_ptc_check_subrc(buf);
2353  003c 1e02          	ldw	x,(OFST+1,sp)
2354  003e cd0000        	call	_rc_ptc_check_subrc
2356                     ; 622 			break;
2358  0041 2005          	jra	L337
2359  0043               L507:
2360                     ; 623 		case BYTE_START_CNT_MIRROR:
2360                     ; 624 			rc_ptc_check_mirror(buf);
2362  0043 1e02          	ldw	x,(OFST+1,sp)
2363  0045 cd0000        	call	_rc_ptc_check_mirror
2365                     ; 625 			break;
2367  0048               L337:
2368                     ; 632 }
2371  0048 5b03          	addw	sp,#3
2372  004a 81            	ret	
2405                     ; 634 void setSettingChange(uint8_t ch) {
2406                     .text:	section	.text,new
2407  0000               _setSettingChange:
2411                     ; 635 	set_changed = ch;
2413  0000 c7000e        	ld	_set_changed,a
2414                     ; 636 }
2417  0003 81            	ret	
2441                     ; 638 uint8_t getSettingChange(void) {
2442                     .text:	section	.text,new
2443  0000               _getSettingChange:
2447                     ; 639 	return set_changed;
2449  0000 c6000e        	ld	a,_set_changed
2452  0003 81            	ret	
2476                     ; 642 uint8_t getState_check(void) {
2477                     .text:	section	.text,new
2478  0000               _getState_check:
2482                     ; 643 	return state_check;
2484  0000 c6000b        	ld	a,_state_check
2487  0003 81            	ret	
2520                     ; 646 void setState_check(uint8_t st) {
2521                     .text:	section	.text,new
2522  0000               _setState_check:
2526                     ; 647 	state_check = st;
2528  0000 c7000b        	ld	_state_check,a
2529                     ; 648 }
2532  0003 81            	ret	
2581                     ; 650 void makeChecksum(uint8_t *buf) {
2582                     .text:	section	.text,new
2583  0000               _makeChecksum:
2585  0000 89            	pushw	x
2586  0001 89            	pushw	x
2587       00000002      OFST:	set	2
2590                     ; 655 	s = 0;
2592  0002 0f01          	clr	(OFST-1,sp)
2594                     ; 656 	for (i = 0 ; i < 7 ; i++) {
2596  0004 0f02          	clr	(OFST+0,sp)
2598  0006               L7201:
2599                     ; 657 		s += buf[i];
2601  0006 7b03          	ld	a,(OFST+1,sp)
2602  0008 97            	ld	xl,a
2603  0009 7b04          	ld	a,(OFST+2,sp)
2604  000b 1b02          	add	a,(OFST+0,sp)
2605  000d 2401          	jrnc	L412
2606  000f 5c            	incw	x
2607  0010               L412:
2608  0010 02            	rlwa	x,a
2609  0011 7b01          	ld	a,(OFST-1,sp)
2610  0013 fb            	add	a,(x)
2611  0014 6b01          	ld	(OFST-1,sp),a
2613                     ; 656 	for (i = 0 ; i < 7 ; i++) {
2615  0016 0c02          	inc	(OFST+0,sp)
2619  0018 7b02          	ld	a,(OFST+0,sp)
2620  001a a107          	cp	a,#7
2621  001c 25e8          	jrult	L7201
2622                     ; 659 	buf[7] = s;
2624  001e 1e03          	ldw	x,(OFST+1,sp)
2625  0020 7b01          	ld	a,(OFST-1,sp)
2626  0022 e707          	ld	(7,x),a
2627                     ; 665 }
2630  0024 5b04          	addw	sp,#4
2631  0026 81            	ret	
2685                     ; 667 void rc_ptc_make_baseSetting(uint8_t *buf, uint8_t page, uint8_t mode) {
2686                     .text:	section	.text,new
2687  0000               _rc_ptc_make_baseSetting:
2689  0000 89            	pushw	x
2690  0001 5203          	subw	sp,#3
2691       00000003      OFST:	set	3
2694                     ; 668 	switch (page) {
2696  0003 7b08          	ld	a,(OFST+5,sp)
2698                     ; 759 		break;
2699  0005 270f          	jreq	L5301
2700  0007 4a            	dec	a
2701  0008 2603cc00ad    	jreq	L7301
2702  000d 4a            	dec	a
2703  000e 2603cc0153    	jreq	L1401
2704  0013 cc01f1        	jra	L7601
2705  0016               L5301:
2706                     ; 669 		case 0:
2706                     ; 670 			if (mode == CNT_MODE_MAIN) {
2708  0016 7b09          	ld	a,(OFST+6,sp)
2709  0018 2625          	jrne	L1701
2710                     ; 671 				buf[1] = (_boiler_type << 7)
2710                     ; 672 									| ((uiInfo.plc & 0x07) << 4)
2710                     ; 673 									| (uiInfo.lpmType);
2712  001a c60064        	ld	a,_uiInfo+100
2713  001d a407          	and	a,#7
2714  001f cd01fa        	call	LC014
2715  0022 6b03          	ld	(OFST+0,sp),a
2717  0024 c60000        	ld	a,__boiler_type
2718  0027 cd01f4        	call	LC013
2719  002a 1a03          	or	a,(OFST+0,sp)
2720  002c 1e04          	ldw	x,(OFST+1,sp)
2721  002e ca0013        	or	a,_uiInfo+19
2722  0031 e701          	ld	(1,x),a
2723                     ; 674 				buf[2] = ((uiInfo.relay & 0x01) << 7) 
2723                     ; 675 									| ((uiInfo.cnt & 0x07) << 4) 
2723                     ; 676 									| (uiInfo.valve & 0x0F);
2725  0033 c6000a        	ld	a,_uiInfo+10
2726  0036 a40f          	and	a,#15
2727  0038 6b03          	ld	(OFST+0,sp),a
2729  003a c60005        	ld	a,_uiInfo+5
2730                     ; 677 				buf[3] = _boiler_water_shower;
2731                     ; 678 				buf[4] = uiInfo.houseCapa;
2732                     ; 679 				buf[5] = _boiler_water_heat;
2733                     ; 680 				buf[6] = 	(mode << 7) 
2733                     ; 681 									| (uiInfo.subRCLock << 6) 
2733                     ; 682 									| ((uiInfo.poType & 0x01) << 4) 
2733                     ; 683 									| ((uiInfo.cntlMode & 0x01) << 3) 
2733                     ; 684 									| uiInfo.opMode;
2735  003d 2017          	jp	LC012
2736  003f               L1701:
2737                     ; 686 				buf[1] = (_boiler_type << 7) 
2737                     ; 687 									| (uiInfo.lpmType_sub);
2739  003f c60000        	ld	a,__boiler_type
2740  0042 cd01f4        	call	LC013
2741  0045 1e04          	ldw	x,(OFST+1,sp)
2742  0047 ca0014        	or	a,_uiInfo+20
2743  004a e701          	ld	(1,x),a
2744                     ; 688 				buf[2] = ((uiInfo.relay & 0x01) << 7) 
2744                     ; 689 									| ((uiInfo.cnt_sub & 0x07) << 4) 
2744                     ; 690 									| (uiInfo.valve_sub & 0x0F);
2746  004c c6000b        	ld	a,_uiInfo+11
2747  004f a40f          	and	a,#15
2748  0051 6b03          	ld	(OFST+0,sp),a
2750  0053 c60006        	ld	a,_uiInfo+6
2751                     ; 691 				buf[3] = _boiler_water_shower;
2753                     ; 692 				buf[4] = uiInfo.houseCapa;
2755                     ; 693 				buf[5] = _boiler_water_heat;
2757                     ; 694 				buf[6] = 	(mode << 7) 
2757                     ; 695 									| (uiInfo.subRCLock << 6) 
2757                     ; 696 									| ((uiInfo.poType & 0x01) << 4) 
2757                     ; 697 									| ((uiInfo.cntlMode & 0x01) << 3) 
2757                     ; 698 									| uiInfo.opMode;
2759  0056               LC012:
2760  0056 a407          	and	a,#7
2761  0058 cd01fa        	call	LC014
2762  005b 6b02          	ld	(OFST-1,sp),a
2764  005d c6005e        	ld	a,_uiInfo+94
2765  0060 a401          	and	a,#1
2766  0062 cd01f4        	call	LC013
2767  0065 1a02          	or	a,(OFST-1,sp)
2768  0067 1e04          	ldw	x,(OFST+1,sp)
2769  0069 1a03          	or	a,(OFST+0,sp)
2770  006b e702          	ld	(2,x),a
2772  006d c60000        	ld	a,__boiler_water_shower
2773  0070 e703          	ld	(3,x),a
2775  0072 c60010        	ld	a,_uiInfo+16
2776  0075 e704          	ld	(4,x),a
2778  0077 c60000        	ld	a,__boiler_water_heat
2779  007a e705          	ld	(5,x),a
2781  007c c60003        	ld	a,_uiInfo+3
2782  007f a401          	and	a,#1
2783  0081 48            	sll	a
2784  0082 48            	sll	a
2785  0083 48            	sll	a
2786  0084 6b03          	ld	(OFST+0,sp),a
2788  0086 c6000f        	ld	a,_uiInfo+15
2789  0089 a401          	and	a,#1
2790  008b cd01fa        	call	LC014
2791  008e 6b02          	ld	(OFST-1,sp),a
2793  0090 c6005d        	ld	a,_uiInfo+93
2794  0093 97            	ld	xl,a
2795  0094 a640          	ld	a,#64
2796  0096 42            	mul	x,a
2797  0097 9f            	ld	a,xl
2798  0098 6b01          	ld	(OFST-2,sp),a
2800  009a 7b09          	ld	a,(OFST+6,sp)
2801  009c cd01f4        	call	LC013
2802  009f 1a01          	or	a,(OFST-2,sp)
2803  00a1 1a02          	or	a,(OFST-1,sp)
2804  00a3 1a03          	or	a,(OFST+0,sp)
2805  00a5 ca0007        	or	a,_uiInfo+7
2806  00a8 1e04          	ldw	x,(OFST+1,sp)
2807  00aa cc01ef        	jp	LC011
2808  00ad               L7301:
2809                     ; 701 		case 1:
2809                     ; 702 			if (mode == CNT_MODE_MAIN) {
2811  00ad 7b09          	ld	a,(OFST+6,sp)
2812  00af 2651          	jrne	L5701
2813                     ; 703 				buf[1] = mode << 7 
2813                     ; 704 							 | (uiInfo.valve_rc[0] << 4)
2813                     ; 705 							 | mode << 3 
2813                     ; 706 							 | uiInfo.valve_rc[1];
2815  00b1 48            	sll	a
2816  00b2 48            	sll	a
2817  00b3 48            	sll	a
2818  00b4 6b03          	ld	(OFST+0,sp),a
2820  00b6 c6001d        	ld	a,_uiInfo+29
2821  00b9 cd01fa        	call	LC014
2822  00bc 6b02          	ld	(OFST-1,sp),a
2824  00be 7b09          	ld	a,(OFST+6,sp)
2825  00c0 cd01f4        	call	LC013
2826  00c3 1a02          	or	a,(OFST-1,sp)
2827  00c5 1a03          	or	a,(OFST+0,sp)
2828  00c7 1e04          	ldw	x,(OFST+1,sp)
2829  00c9 ca001e        	or	a,_uiInfo+30
2830  00cc e701          	ld	(1,x),a
2831                     ; 707 				buf[2] = mode << 7 
2831                     ; 708 							 | (uiInfo.valve_rc[2] << 4)
2831                     ; 709 							 | mode << 3 
2831                     ; 710 							 | uiInfo.valve_rc[3];
2833  00ce 7b09          	ld	a,(OFST+6,sp)
2834  00d0 48            	sll	a
2835  00d1 48            	sll	a
2836  00d2 48            	sll	a
2837  00d3 6b03          	ld	(OFST+0,sp),a
2839  00d5 c6001f        	ld	a,_uiInfo+31
2840  00d8 cd01fa        	call	LC014
2841  00db 6b02          	ld	(OFST-1,sp),a
2843  00dd 7b09          	ld	a,(OFST+6,sp)
2844  00df cd01f4        	call	LC013
2845  00e2 1a02          	or	a,(OFST-1,sp)
2846  00e4 1a03          	or	a,(OFST+0,sp)
2847  00e6 1e04          	ldw	x,(OFST+1,sp)
2848  00e8 ca0020        	or	a,_uiInfo+32
2849  00eb e702          	ld	(2,x),a
2850                     ; 711 				buf[3] = uiInfo.valve_len[0];
2852  00ed c60015        	ld	a,_uiInfo+21
2853  00f0 e703          	ld	(3,x),a
2854                     ; 712 				buf[4] = uiInfo.valve_len[1];
2856  00f2 c60016        	ld	a,_uiInfo+22
2857  00f5 e704          	ld	(4,x),a
2858                     ; 713 				buf[5] = uiInfo.valve_len[2];
2860  00f7 c60017        	ld	a,_uiInfo+23
2861  00fa e705          	ld	(5,x),a
2862                     ; 714 				buf[6] = uiInfo.valve_len[3];
2864  00fc c60018        	ld	a,_uiInfo+24
2866  00ff cc01ef        	jp	LC011
2867  0102               L5701:
2868                     ; 716 				buf[1] = mode << 7 
2868                     ; 717 							 | (uiInfo.valve_sub_rc[0] << 4)
2868                     ; 718 							 | mode << 3 
2868                     ; 719 							 | uiInfo.valve_sub_rc[1];
2870  0102 48            	sll	a
2871  0103 48            	sll	a
2872  0104 48            	sll	a
2873  0105 6b03          	ld	(OFST+0,sp),a
2875  0107 c6002d        	ld	a,_uiInfo+45
2876  010a cd01fa        	call	LC014
2877  010d 6b02          	ld	(OFST-1,sp),a
2879  010f 7b09          	ld	a,(OFST+6,sp)
2880  0111 cd01f4        	call	LC013
2881  0114 1a02          	or	a,(OFST-1,sp)
2882  0116 1a03          	or	a,(OFST+0,sp)
2883  0118 1e04          	ldw	x,(OFST+1,sp)
2884  011a ca002e        	or	a,_uiInfo+46
2885  011d e701          	ld	(1,x),a
2886                     ; 720 				buf[2] = mode << 7 
2886                     ; 721 							 | (uiInfo.valve_sub_rc[2] << 4)
2886                     ; 722 							 | mode << 3 
2886                     ; 723 							 | uiInfo.valve_sub_rc[3];
2888  011f 7b09          	ld	a,(OFST+6,sp)
2889  0121 48            	sll	a
2890  0122 48            	sll	a
2891  0123 48            	sll	a
2892  0124 6b03          	ld	(OFST+0,sp),a
2894  0126 c6002f        	ld	a,_uiInfo+47
2895  0129 cd01fa        	call	LC014
2896  012c 6b02          	ld	(OFST-1,sp),a
2898  012e 7b09          	ld	a,(OFST+6,sp)
2899  0130 cd01f4        	call	LC013
2900  0133 1a02          	or	a,(OFST-1,sp)
2901  0135 1a03          	or	a,(OFST+0,sp)
2902  0137 1e04          	ldw	x,(OFST+1,sp)
2903  0139 ca0030        	or	a,_uiInfo+48
2904  013c e702          	ld	(2,x),a
2905                     ; 724 				buf[3] = uiInfo.valve_sub_len[0];
2907  013e c60025        	ld	a,_uiInfo+37
2908  0141 e703          	ld	(3,x),a
2909                     ; 725 				buf[4] = uiInfo.valve_sub_len[1];
2911  0143 c60026        	ld	a,_uiInfo+38
2912  0146 e704          	ld	(4,x),a
2913                     ; 726 				buf[5] = uiInfo.valve_sub_len[2];
2915  0148 c60027        	ld	a,_uiInfo+39
2916  014b e705          	ld	(5,x),a
2917                     ; 727 				buf[6] = uiInfo.valve_sub_len[3];
2919  014d c60028        	ld	a,_uiInfo+40
2920  0150 cc01ef        	jp	LC011
2921  0153               L1401:
2922                     ; 730 		case 2:
2922                     ; 731 			if (mode == CNT_MODE_MAIN) {
2924  0153 7b09          	ld	a,(OFST+6,sp)
2925  0155 264e          	jrne	L1011
2926                     ; 732 				buf[1] = mode << 7 
2926                     ; 733 							 | (uiInfo.valve_rc[4] << 4) 
2926                     ; 734 							 | mode << 3 
2926                     ; 735 							 | uiInfo.valve_rc[5];
2928  0157 48            	sll	a
2929  0158 48            	sll	a
2930  0159 48            	sll	a
2931  015a 6b03          	ld	(OFST+0,sp),a
2933  015c c60021        	ld	a,_uiInfo+33
2934  015f cd01fa        	call	LC014
2935  0162 6b02          	ld	(OFST-1,sp),a
2937  0164 7b09          	ld	a,(OFST+6,sp)
2938  0166 cd01f4        	call	LC013
2939  0169 1a02          	or	a,(OFST-1,sp)
2940  016b 1a03          	or	a,(OFST+0,sp)
2941  016d 1e04          	ldw	x,(OFST+1,sp)
2942  016f ca0022        	or	a,_uiInfo+34
2943  0172 e701          	ld	(1,x),a
2944                     ; 736 				buf[2] = mode << 7 
2944                     ; 737 							 | (uiInfo.valve_rc[6] << 4) 
2944                     ; 738 							 | mode << 3 
2944                     ; 739 							 | uiInfo.valve_rc[7];
2946  0174 7b09          	ld	a,(OFST+6,sp)
2947  0176 48            	sll	a
2948  0177 48            	sll	a
2949  0178 48            	sll	a
2950  0179 6b03          	ld	(OFST+0,sp),a
2952  017b c60023        	ld	a,_uiInfo+35
2953  017e ad7a          	call	LC014
2954  0180 6b02          	ld	(OFST-1,sp),a
2956  0182 7b09          	ld	a,(OFST+6,sp)
2957  0184 ad6e          	call	LC013
2958  0186 1a02          	or	a,(OFST-1,sp)
2959  0188 1a03          	or	a,(OFST+0,sp)
2960  018a 1e04          	ldw	x,(OFST+1,sp)
2961  018c ca0024        	or	a,_uiInfo+36
2962  018f e702          	ld	(2,x),a
2963                     ; 740 				buf[3] = uiInfo.valve_len[4];
2965  0191 c60019        	ld	a,_uiInfo+25
2966  0194 e703          	ld	(3,x),a
2967                     ; 741 				buf[4] = uiInfo.valve_len[5];
2969  0196 c6001a        	ld	a,_uiInfo+26
2970  0199 e704          	ld	(4,x),a
2971                     ; 742 				buf[5] = uiInfo.valve_len[6];
2973  019b c6001b        	ld	a,_uiInfo+27
2974  019e e705          	ld	(5,x),a
2975                     ; 743 				buf[6] = uiInfo.valve_len[7];
2977  01a0 c6001c        	ld	a,_uiInfo+28
2979  01a3 204a          	jp	LC011
2980  01a5               L1011:
2981                     ; 745 				buf[1] = mode << 7 
2981                     ; 746 							 | (uiInfo.valve_sub_rc[4] << 4) 
2981                     ; 747 							 | mode << 3 
2981                     ; 748 							 | uiInfo.valve_sub_rc[5];
2983  01a5 48            	sll	a
2984  01a6 48            	sll	a
2985  01a7 48            	sll	a
2986  01a8 6b03          	ld	(OFST+0,sp),a
2988  01aa c60031        	ld	a,_uiInfo+49
2989  01ad ad4b          	call	LC014
2990  01af 6b02          	ld	(OFST-1,sp),a
2992  01b1 7b09          	ld	a,(OFST+6,sp)
2993  01b3 ad3f          	call	LC013
2994  01b5 1a02          	or	a,(OFST-1,sp)
2995  01b7 1a03          	or	a,(OFST+0,sp)
2996  01b9 1e04          	ldw	x,(OFST+1,sp)
2997  01bb ca0032        	or	a,_uiInfo+50
2998  01be e701          	ld	(1,x),a
2999                     ; 749 				buf[2] = mode << 7 
2999                     ; 750 							 | (uiInfo.valve_sub_rc[6] << 4) 
2999                     ; 751 							 | mode << 3 
2999                     ; 752 							 | uiInfo.valve_sub_rc[7];
3001  01c0 7b09          	ld	a,(OFST+6,sp)
3002  01c2 48            	sll	a
3003  01c3 48            	sll	a
3004  01c4 48            	sll	a
3005  01c5 6b03          	ld	(OFST+0,sp),a
3007  01c7 c60033        	ld	a,_uiInfo+51
3008  01ca ad2e          	call	LC014
3009  01cc 6b02          	ld	(OFST-1,sp),a
3011  01ce 7b09          	ld	a,(OFST+6,sp)
3012  01d0 ad22          	call	LC013
3013  01d2 1a02          	or	a,(OFST-1,sp)
3014  01d4 1a03          	or	a,(OFST+0,sp)
3015  01d6 1e04          	ldw	x,(OFST+1,sp)
3016  01d8 ca0034        	or	a,_uiInfo+52
3017  01db e702          	ld	(2,x),a
3018                     ; 753 				buf[3] = uiInfo.valve_sub_len[4];
3020  01dd c60029        	ld	a,_uiInfo+41
3021  01e0 e703          	ld	(3,x),a
3022                     ; 754 				buf[4] = uiInfo.valve_sub_len[5];
3024  01e2 c6002a        	ld	a,_uiInfo+42
3025  01e5 e704          	ld	(4,x),a
3026                     ; 755 				buf[5] = uiInfo.valve_sub_len[6];
3028  01e7 c6002b        	ld	a,_uiInfo+43
3029  01ea e705          	ld	(5,x),a
3030                     ; 756 				buf[6] = uiInfo.valve_sub_len[7];
3032  01ec c6002c        	ld	a,_uiInfo+44
3033  01ef               LC011:
3034  01ef e706          	ld	(6,x),a
3035  01f1               L7601:
3036                     ; 761 }
3039  01f1 5b05          	addw	sp,#5
3040  01f3 81            	ret	
3041  01f4               LC013:
3042  01f4 97            	ld	xl,a
3043  01f5 a680          	ld	a,#128
3044  01f7 42            	mul	x,a
3045  01f8 9f            	ld	a,xl
3046  01f9 81            	ret	
3047  01fa               LC014:
3048  01fa 97            	ld	xl,a
3049  01fb a610          	ld	a,#16
3050  01fd 42            	mul	x,a
3051  01fe 9f            	ld	a,xl
3052  01ff 81            	ret	
3099                     ; 764 void rc_ptc_make_setting(uint8_t *buf) {
3100                     .text:	section	.text,new
3101  0000               _rc_ptc_make_setting:
3103  0000 89            	pushw	x
3104  0001 88            	push	a
3105       00000001      OFST:	set	1
3108                     ; 766 	uint8_t mode = uiInfo.controlMode;
3110  0002 c60009        	ld	a,_uiInfo+9
3111  0005 6b01          	ld	(OFST+0,sp),a
3113                     ; 768 	buf[0] = BYTE_START_RC_SETTING | cur_set_page;
3115  0007 c60007        	ld	a,_cur_set_page
3116  000a 1e02          	ldw	x,(OFST+1,sp)
3117  000c aa50          	or	a,#80
3118  000e f7            	ld	(x),a
3119                     ; 770 	rc_ptc_make_baseSetting(buf, cur_set_page, mode);
3121  000f 7b01          	ld	a,(OFST+0,sp)
3122  0011 88            	push	a
3123  0012 3b0007        	push	_cur_set_page
3124  0015 1e04          	ldw	x,(OFST+3,sp)
3125  0017 cd0000        	call	_rc_ptc_make_baseSetting
3127  001a 85            	popw	x
3128                     ; 772 	makeChecksum(buf);
3130  001b 1e02          	ldw	x,(OFST+1,sp)
3131  001d cd0000        	call	_makeChecksum
3133                     ; 773 }
3136  0020 5b03          	addw	sp,#3
3137  0022 81            	ret	
3140                     	switch	.data
3141  0006               _dr_out_count:
3142  0006 01            	dc.b	1
3190                     ; 779 void rc_ptc_make_normal(uint8_t *buf) {
3191                     .text:	section	.text,new
3192  0000               _rc_ptc_make_normal:
3194  0000 89            	pushw	x
3195       00000000      OFST:	set	0
3198                     ; 781 	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
3200  0001 c60004        	ld	a,_uiInfo+4
3201  0004 aaf0          	or	a,#240
3202  0006 f7            	ld	(x),a
3203                     ; 782 	buf[1] = _disp_mode2;
3205  0007 c60000        	ld	a,__disp_mode2
3206  000a e701          	ld	(1,x),a
3207                     ; 783 	buf[2] = uiInfo.tCurr;
3209  000c c60002        	ld	a,_uiInfo+2
3210  000f e702          	ld	(2,x),a
3211                     ; 784 	buf[3] = 0x00;
3213  0011 6f03          	clr	(3,x)
3214                     ; 785 	buf[4] = 0x00;
3216  0013 6f04          	clr	(4,x)
3217                     ; 786 	buf[5] = 0x00;
3219  0015 6f05          	clr	(5,x)
3220                     ; 787 	buf[6] = 0x00;
3222  0017 6f06          	clr	(6,x)
3223                     ; 789 	if (uiInfo.mode == SETTING_MODE_MASTER) {
3225  0019 c60008        	ld	a,_uiInfo+8
3226  001c 4a            	dec	a
3227  001d 2619          	jrne	L7511
3228                     ; 790 		buf[4] = _boiler_water_heat;
3230  001f c60000        	ld	a,__boiler_water_heat
3231  0022 e704          	ld	(4,x),a
3232                     ; 791 		buf[6] = __boiler_shower[5] == 1 ? 1 : 0; // 온수모드   
3234  0024 c60005        	ld	a,___boiler_shower+5
3235  0027 4a            	dec	a
3236  0028 2603          	jrne	L032
3237  002a 4c            	inc	a
3238  002b 2001          	jra	L232
3239  002d               L032:
3240  002d 4f            	clr	a
3241  002e               L232:
3242  002e e706          	ld	(6,x),a
3243                     ; 792 		buf[6] |= (_boiler_water_shower << 1);					// 온수
3245  0030 c60000        	ld	a,__boiler_water_shower
3246  0033 48            	sll	a
3247  0034 ea06          	or	a,(6,x)
3248  0036 e706          	ld	(6,x),a
3249  0038               L7511:
3250                     ; 795 	switch(buf[1]) {
3252  0038 e601          	ld	a,(1,x)
3254                     ; 832 		default:
3254                     ; 833 			break;
3255  003a 4a            	dec	a
3256  003b 270d          	jreq	L5211
3257  003d 4a            	dec	a
3258  003e 2711          	jreq	L7211
3259  0040 a006          	sub	a,#6
3260  0042 2740          	jreq	L5311
3261  0044 a008          	sub	a,#8
3262  0046 272e          	jreq	L3311
3263  0048 203f          	jra	L3611
3264  004a               L5211:
3265                     ; 796 		case RC_MODE_HEAT:
3265                     ; 797 			buf[3] = uiInfo.tSetup;
3267  004a c6000e        	ld	a,_uiInfo+14
3268  004d e703          	ld	(3,x),a
3269                     ; 798 			break;
3271  004f 2038          	jra	L3611
3272  0051               L7211:
3273                     ; 799 		case RC_MODE_OUT:
3273                     ; 800 			buf[5] = dr_mode_out;
3275  0051 c60002        	ld	a,_dr_mode_out
3276  0054 e705          	ld	(5,x),a
3277                     ; 803 			buf[3] = 0x1E;					// 외출 온도 15도
3279  0056 a61e          	ld	a,#30
3280  0058 e703          	ld	(3,x),a
3281                     ; 805 			if (dr_mode_out == 0) {
3283  005a c60002        	ld	a,_dr_mode_out
3284  005d 2611          	jrne	L5611
3285                     ; 806 				if (dr_out_count != 0) {
3287  005f c60006        	ld	a,_dr_out_count
3288  0062 2706          	jreq	L7611
3289                     ; 807 					dr_out_count--;
3291  0064 725a0006      	dec	_dr_out_count
3293  0068 201f          	jra	L3611
3294  006a               L7611:
3295                     ; 809 					dr_mode_out = 1;
3297  006a 35010002      	mov	_dr_mode_out,#1
3298  006e 2019          	jra	L3611
3299  0070               L5611:
3300                     ; 812 				dr_out_count = DR_ALL_OUT_COUNT;
3302  0070 35010006      	mov	_dr_out_count,#1
3303  0074 2013          	jra	L3611
3304                     ; 819 		case RC_MODE_STOP:
3304                     ; 820 			break;
3306  0076               L3311:
3307                     ; 821 		case RC_MODE_REPEAT:
3307                     ; 822 			if(_timFlag == 0) {
3309  0076 c60000        	ld	a,__timFlag
3310  0079 2604          	jrne	L5711
3311                     ; 823 				buf[3] = MAX_REPEAT_TEMP;
3313  007b a650          	ld	a,#80
3314  007d e703          	ld	(3,x),a
3315  007f               L5711:
3316                     ; 826 			buf[5] = uiInfo.repeat;
3318  007f c6000c        	ld	a,_uiInfo+12
3319                     ; 828 			break;
3321  0082 2003          	jp	LC015
3322  0084               L5311:
3323                     ; 829 		case RC_MODE_RESERVE:
3323                     ; 830 			buf[5] = uiInfo.reserve;
3325  0084 c6000d        	ld	a,_uiInfo+13
3326  0087               LC015:
3327  0087 e705          	ld	(5,x),a
3328                     ; 831 			break;
3330                     ; 832 		default:
3330                     ; 833 			break;
3332  0089               L3611:
3333                     ; 836 	makeChecksum(buf);
3335  0089 1e01          	ldw	x,(OFST+1,sp)
3336  008b cd0000        	call	_makeChecksum
3338                     ; 838 	if (disp_mode_preview != _disp_mode2){
3340  008e c60002        	ld	a,_disp_mode_preview
3341  0091 c10000        	cp	a,__disp_mode2
3342  0094 2712          	jreq	L7711
3343                     ; 839 		if (uiInfo.mode == SETTING_MODE_SUB) {
3345                     ; 841 				UPDATE_BIT(BIT_DISPMODE);
3348                     ; 842 				disp_mode_preview = _disp_mode2;
3351                     ; 845 			UPDATE_BIT(BIT_DISPMODE);
3357                     ; 846 			disp_mode_preview = _disp_mode2;
3361  0096 72160000      	bset	__updateBit,#3
3363  009a 5500000000    	mov	__updateTimer,___timer1s
3365  009f 35050000      	mov	__updateCount,#5
3367  00a3 5500000002    	mov	_disp_mode_preview,__disp_mode2
3368  00a8               L7711:
3369                     ; 850 	only_one++;
3371  00a8 725c0003      	inc	_only_one
3372                     ; 851 }
3375  00ac 85            	popw	x
3376  00ad 81            	ret	
3428                     ; 854 uint8_t rc_ptc_check_subRC(void) {
3429                     .text:	section	.text,new
3430  0000               _rc_ptc_check_subRC:
3432  0000 89            	pushw	x
3433       00000002      OFST:	set	2
3436                     ; 859 	if (_remote == 1) {
3438  0001 c60000        	ld	a,__remote
3439  0004 4a            	dec	a
3440  0005 2603          	jrne	L5321
3441                     ; 860 		return 0xFF;
3443  0007 4a            	dec	a
3446  0008 85            	popw	x
3447  0009 81            	ret	
3448  000a               L5321:
3449                     ; 863 	ch = 0;
3451  000a 0f01          	clr	(OFST-1,sp)
3453                     ; 864 	if (rcSubDataInfo.mode_heat[uiInfo.id - 1] != 0xFF) {
3455  000c cd0151        	call	LC018
3456  000f d60027        	ld	a,(_rcSubDataInfo+16,x)
3457  0012 4c            	inc	a
3458  0013 2704          	jreq	L7321
3459                     ; 865 		ch = 1;
3461  0015 a601          	ld	a,#1
3462  0017 6b01          	ld	(OFST-1,sp),a
3464  0019               L7321:
3465                     ; 868 	rcSubDataInfo.mode_heat[uiInfo.id - 1] = _disp_mode2;
3467  0019 c60004        	ld	a,_uiInfo+4
3468  001c 5f            	clrw	x
3469  001d 97            	ld	xl,a
3470  001e 5a            	decw	x
3471  001f c60000        	ld	a,__disp_mode2
3472  0022 d70027        	ld	(_rcSubDataInfo+16,x),a
3473                     ; 869 	rcSubDataInfo.cur_temp[uiInfo.id - 1] = uiInfo.tCurr;
3475  0025 cd0151        	call	LC018
3476  0028 c60002        	ld	a,_uiInfo+2
3477  002b d70017        	ld	(_rcSubDataInfo,x),a
3478                     ; 870 	rcSubDataInfo.set_temp[uiInfo.id - 1] = uiInfo.tSetup;
3480  002e cd0151        	call	LC018
3481  0031 c6000e        	ld	a,_uiInfo+14
3482  0034 d7001f        	ld	(_rcSubDataInfo+8,x),a
3483                     ; 871 	rcSubDataInfo.time[uiInfo.id - 1] = uiInfo.reserve;
3485  0037 cd0151        	call	LC018
3486  003a c6000d        	ld	a,_uiInfo+13
3487  003d d70037        	ld	(_rcSubDataInfo+32,x),a
3488                     ; 872 	rcSubDataInfo.banb[uiInfo.id - 1] = uiInfo.repeat;
3490  0040 cd0151        	call	LC018
3491  0043 c6000c        	ld	a,_uiInfo+12
3492  0046 d7003f        	ld	(_rcSubDataInfo+40,x),a
3493                     ; 874 	uiInfo.remote_mode[uiInfo.id - 1] = _disp_mode2;
3495  0049 cd0151        	call	LC018
3496  004c c60000        	ld	a,__disp_mode2
3497  004f d70045        	ld	(_uiInfo+69,x),a
3498                     ; 875 	uiInfo.tempCurr[uiInfo.id - 1] = uiInfo.tCurr;
3500  0052 cd0151        	call	LC018
3501  0055 c60002        	ld	a,_uiInfo+2
3502  0058 d70035        	ld	(_uiInfo+53,x),a
3503                     ; 876 	uiInfo.tempSetup[uiInfo.id - 1] = uiInfo.tSetup;
3505  005b cd0151        	call	LC018
3506  005e c6000e        	ld	a,_uiInfo+14
3507  0061 d7003d        	ld	(_uiInfo+61,x),a
3508                     ; 877 	uiInfo.remote_time[uiInfo.id - 1] = uiInfo.reserve;
3510  0064 cd0151        	call	LC018
3511  0067 c6000d        	ld	a,_uiInfo+13
3512  006a d7004d        	ld	(_uiInfo+77,x),a
3513                     ; 878 	uiInfo.remote_banb[uiInfo.id - 1] = uiInfo.repeat;
3515  006d cd0151        	call	LC018
3516  0070 c6000c        	ld	a,_uiInfo+12
3517  0073 d70055        	ld	(_uiInfo+85,x),a
3518                     ; 880 	if (ch == 0) {
3520  0076 7b01          	ld	a,(OFST-1,sp)
3521  0078 2603          	jrne	L1421
3522                     ; 882 		return 0xFF;
3524  007a 4a            	dec	a
3527  007b 85            	popw	x
3528  007c 81            	ret	
3529  007d               L1421:
3530                     ; 885 	num = 0xFF;
3532  007d a6ff          	ld	a,#255
3533  007f 6b01          	ld	(OFST-1,sp),a
3535                     ; 886 	for (i = 0 ; i < 8 ; i++) {
3537  0081 4f            	clr	a
3538  0082 6b02          	ld	(OFST+0,sp),a
3540  0084               L3421:
3541                     ; 887 		if (rcSubDataInfo.set_temp[i] == 0xAA) {
3543  0084 5f            	clrw	x
3544  0085 97            	ld	xl,a
3545  0086 d6001f        	ld	a,(_rcSubDataInfo+8,x)
3546  0089 a1aa          	cp	a,#170
3547  008b 2756          	jreq	L5421
3548                     ; 888 			continue;
3550                     ; 891 		if (uiInfo.remote_mode[i] != rcSubDataInfo.mode_heat[i]) {
3552  008d 7b02          	ld	a,(OFST+0,sp)
3553  008f cd0158        	call	LC019
3554  0092 90d60045      	ld	a,(_uiInfo+69,y)
3555  0096 d10027        	cp	a,(_rcSubDataInfo+16,x)
3556  0099 2706          	jreq	L3521
3557                     ; 892 			num = i;
3559  009b 7b02          	ld	a,(OFST+0,sp)
3560  009d 6b01          	ld	(OFST-1,sp),a
3562                     ; 893 			break;
3564  009f 204c          	jra	L7421
3565  00a1               L3521:
3566                     ; 896 		switch (rcSubDataInfo.mode_heat[i]) {
3568  00a1 7b02          	ld	a,(OFST+0,sp)
3569  00a3 5f            	clrw	x
3570  00a4 97            	ld	xl,a
3571  00a5 d60027        	ld	a,(_rcSubDataInfo+16,x)
3573                     ; 914 				break;
3574  00a8 4a            	dec	a
3575  00a9 270a          	jreq	L5021
3576  00ab a007          	sub	a,#7
3577  00ad 2722          	jreq	L3121
3578  00af a008          	sub	a,#8
3579  00b1 2710          	jreq	L1121
3580  00b3 202e          	jra	L5421
3581  00b5               L5021:
3582                     ; 897 			case RC_MODE_HEAT:
3582                     ; 898 				if (uiInfo.tempSetup[i] != rcSubDataInfo.set_temp[i]) {
3584  00b5 7b02          	ld	a,(OFST+0,sp)
3585  00b7 cd0158        	call	LC019
3586  00ba 90d6003d      	ld	a,(_uiInfo+61,y)
3587  00be d1001f        	cp	a,(_rcSubDataInfo+8,x)
3588                     ; 899 					num = i;
3589  00c1 201a          	jp	LC017
3590                     ; 902 			case RC_MODE_OUT:
3590                     ; 903 			case RC_MODE_STOP:
3590                     ; 904 				break;
3592  00c3               L1121:
3593                     ; 905 			case RC_MODE_REPEAT:
3593                     ; 906 				if (uiInfo.remote_banb[i] != rcSubDataInfo.banb[i]) {
3595  00c3 7b02          	ld	a,(OFST+0,sp)
3596  00c5 cd0158        	call	LC019
3597  00c8 90d60055      	ld	a,(_uiInfo+85,y)
3598  00cc d1003f        	cp	a,(_rcSubDataInfo+40,x)
3599                     ; 907 					num = i;
3600  00cf 200c          	jp	LC017
3601  00d1               L3121:
3602                     ; 910 			case RC_MODE_RESERVE:
3602                     ; 911 				if (uiInfo.remote_time[i] != rcSubDataInfo.time[i]) {
3604  00d1 7b02          	ld	a,(OFST+0,sp)
3605  00d3 cd0158        	call	LC019
3606  00d6 90d6004d      	ld	a,(_uiInfo+77,y)
3607  00da d10037        	cp	a,(_rcSubDataInfo+32,x)
3608                     ; 912 					num = i;
3610  00dd               LC017:
3611  00dd 2704          	jreq	L5421
3614  00df 7b02          	ld	a,(OFST+0,sp)
3615  00e1 6b01          	ld	(OFST-1,sp),a
3617  00e3               L5421:
3618                     ; 886 	for (i = 0 ; i < 8 ; i++) {
3620  00e3 0c02          	inc	(OFST+0,sp)
3624  00e5 7b02          	ld	a,(OFST+0,sp)
3625  00e7 a108          	cp	a,#8
3626  00e9 2599          	jrult	L3421
3627  00eb 7b01          	ld	a,(OFST-1,sp)
3628  00ed               L7421:
3629                     ; 918 	if (num == 0xFF) {
3631  00ed a1ff          	cp	a,#255
3632  00ef 260a          	jrne	L7621
3633                     ; 919 		ret_count = MAX_REPEAT_ERROR_COUNT;
3635  00f1 35050001      	mov	_ret_count,#5
3636                     ; 920 		cur_src = 0;
3638  00f5 725f0000      	clr	_cur_src
3639                     ; 921 		return num;
3642  00f9 2054          	jra	L042
3643  00fb               L7621:
3644                     ; 924 	if (cur_src == num) {
3646  00fb c60000        	ld	a,_cur_src
3647  00fe 1101          	cp	a,(OFST-1,sp)
3648  0100 2642          	jrne	L1721
3649                     ; 925 		ret_count--;
3651  0102 725a0001      	dec	_ret_count
3652                     ; 927 		if (ret_count == 0) {
3654  0106 2645          	jrne	L5721
3655                     ; 928 			rcSubDataInfo.mode_heat[num] = uiInfo.remote_mode[num];
3657  0108 7b01          	ld	a,(OFST-1,sp)
3658  010a 5f            	clrw	x
3659  010b 97            	ld	xl,a
3660  010c d60045        	ld	a,(_uiInfo+69,x)
3661  010f d70027        	ld	(_rcSubDataInfo+16,x),a
3662                     ; 929 			rcSubDataInfo.cur_temp[num] = uiInfo.tempCurr[num];
3664  0112 5f            	clrw	x
3665  0113 7b01          	ld	a,(OFST-1,sp)
3666  0115 97            	ld	xl,a
3667  0116 d60035        	ld	a,(_uiInfo+53,x)
3668  0119 d70017        	ld	(_rcSubDataInfo,x),a
3669                     ; 930 			rcSubDataInfo.set_temp[num] = uiInfo.tempSetup[num];
3671  011c 5f            	clrw	x
3672  011d 7b01          	ld	a,(OFST-1,sp)
3673  011f 97            	ld	xl,a
3674  0120 d6003d        	ld	a,(_uiInfo+61,x)
3675  0123 d7001f        	ld	(_rcSubDataInfo+8,x),a
3676                     ; 931 			rcSubDataInfo.time[num] = uiInfo.remote_time[num];
3678  0126 5f            	clrw	x
3679  0127 7b01          	ld	a,(OFST-1,sp)
3680  0129 97            	ld	xl,a
3681  012a d6004d        	ld	a,(_uiInfo+77,x)
3682  012d d70037        	ld	(_rcSubDataInfo+32,x),a
3683                     ; 932 			rcSubDataInfo.banb[num] = uiInfo.remote_banb[num];
3685  0130 5f            	clrw	x
3686  0131 7b01          	ld	a,(OFST-1,sp)
3687  0133 97            	ld	xl,a
3688  0134 d60055        	ld	a,(_uiInfo+85,x)
3689  0137 d7003f        	ld	(_rcSubDataInfo+40,x),a
3690                     ; 934 			ret_count = MAX_REPEAT_ERROR_COUNT;
3692  013a 35050001      	mov	_ret_count,#5
3693                     ; 935 			num = 0xFF;
3695  013e a6ff          	ld	a,#255
3696  0140 6b01          	ld	(OFST-1,sp),a
3698  0142 2009          	jra	L5721
3699  0144               L1721:
3700                     ; 938 		cur_src = num;
3702  0144 7b01          	ld	a,(OFST-1,sp)
3703  0146 c70000        	ld	_cur_src,a
3704                     ; 939 		ret_count = MAX_REPEAT_ERROR_COUNT;
3706  0149 35050001      	mov	_ret_count,#5
3707  014d               L5721:
3708                     ; 942 	return num;
3710  014d 7b01          	ld	a,(OFST-1,sp)
3712  014f               L042:
3714  014f 85            	popw	x
3715  0150 81            	ret	
3716  0151               LC018:
3717  0151 5f            	clrw	x
3718  0152 c60004        	ld	a,_uiInfo+4
3719  0155 97            	ld	xl,a
3720  0156 5a            	decw	x
3721  0157 81            	ret	
3722  0158               LC019:
3723  0158 5f            	clrw	x
3724  0159 97            	ld	xl,a
3725  015a 905f          	clrw	y
3726  015c 9097          	ld	yl,a
3727  015e 81            	ret	
3771                     ; 946 void rc_ptc_make_subRC(uint8_t *buf, uint8_t num) {
3772                     .text:	section	.text,new
3773  0000               _rc_ptc_make_subRC:
3775  0000 89            	pushw	x
3776       00000000      OFST:	set	0
3779                     ; 947 	buf[0] = BYTE_START_RC_SUBRC | num + 1;
3781  0001 7b05          	ld	a,(OFST+5,sp)
3782  0003 4c            	inc	a
3783  0004 aa60          	or	a,#96
3784  0006 f7            	ld	(x),a
3785                     ; 948 	buf[1] = uiInfo.remote_mode[num];
3787  0007 5f            	clrw	x
3788  0008 7b05          	ld	a,(OFST+5,sp)
3789  000a 97            	ld	xl,a
3790  000b d60045        	ld	a,(_uiInfo+69,x)
3791  000e 1e01          	ldw	x,(OFST+1,sp)
3792                     ; 949 	buf[2] = 0x00;
3794  0010 6f02          	clr	(2,x)
3795  0012 e701          	ld	(1,x),a
3796                     ; 950 	if (uiInfo.remote_mode[num] == RC_MODE_HEAT) {
3798  0014 5f            	clrw	x
3799  0015 7b05          	ld	a,(OFST+5,sp)
3800  0017 97            	ld	xl,a
3801  0018 d60045        	ld	a,(_uiInfo+69,x)
3802  001b 4a            	dec	a
3803  001c 260d          	jrne	L7131
3804                     ; 951 		buf[3] = uiInfo.tempSetup[num];
3806  001e 7b05          	ld	a,(OFST+5,sp)
3807  0020 5f            	clrw	x
3808  0021 97            	ld	xl,a
3809  0022 d6003d        	ld	a,(_uiInfo+61,x)
3810  0025 1e01          	ldw	x,(OFST+1,sp)
3811  0027 e703          	ld	(3,x),a
3813  0029 2004          	jra	L1231
3814  002b               L7131:
3815                     ; 953 		buf[3] = 0x00;
3817  002b 1e01          	ldw	x,(OFST+1,sp)
3818  002d 6f03          	clr	(3,x)
3819  002f               L1231:
3820                     ; 956 	buf[4] = 0x00;
3822  002f 6f04          	clr	(4,x)
3823                     ; 958 	if (uiInfo.remote_mode[num] == RC_MODE_REPEAT) {
3825  0031 5f            	clrw	x
3826  0032 7b05          	ld	a,(OFST+5,sp)
3827  0034 97            	ld	xl,a
3828  0035 d60045        	ld	a,(_uiInfo+69,x)
3829  0038 a110          	cp	a,#16
3830  003a 2609          	jrne	L3231
3831                     ; 959 		buf[5] = uiInfo.remote_banb[num];
3833  003c 7b05          	ld	a,(OFST+5,sp)
3834  003e 5f            	clrw	x
3835  003f 97            	ld	xl,a
3836  0040 d60055        	ld	a,(_uiInfo+85,x)
3838  0043 2012          	jp	LC020
3839  0045               L3231:
3840                     ; 960 	} else if(uiInfo.remote_mode[num] == RC_MODE_RESERVE){
3842  0045 7b05          	ld	a,(OFST+5,sp)
3843  0047 5f            	clrw	x
3844  0048 97            	ld	xl,a
3845  0049 d60045        	ld	a,(_uiInfo+69,x)
3846  004c a108          	cp	a,#8
3847  004e 260d          	jrne	L7231
3848                     ; 961 		buf[5] = uiInfo.remote_time[num];
3850  0050 7b05          	ld	a,(OFST+5,sp)
3851  0052 5f            	clrw	x
3852  0053 97            	ld	xl,a
3853  0054 d6004d        	ld	a,(_uiInfo+77,x)
3854  0057               LC020:
3855  0057 1e01          	ldw	x,(OFST+1,sp)
3856  0059 e705          	ld	(5,x),a
3858  005b 2004          	jra	L5231
3859  005d               L7231:
3860                     ; 963 		buf[5] = 0x00;
3862  005d 1e01          	ldw	x,(OFST+1,sp)
3863  005f 6f05          	clr	(5,x)
3864  0061               L5231:
3865                     ; 966 	buf[6] = 0x00;
3867  0061 6f06          	clr	(6,x)
3868                     ; 968 	makeChecksum(buf);
3870  0063 cd0000        	call	_makeChecksum
3872                     ; 969 }
3875  0066 85            	popw	x
3876  0067 81            	ret	
3915                     ; 971 void rc_ptc_make_error(uint8_t *buf) {
3916                     .text:	section	.text,new
3917  0000               _rc_ptc_make_error:
3919  0000 89            	pushw	x
3920       00000000      OFST:	set	0
3923                     ; 972 	buf[0] = BYTE_START_RC_ERROR | uiInfo.id;
3925  0001 c60004        	ld	a,_uiInfo+4
3926  0004 aae0          	or	a,#224
3927  0006 f7            	ld	(x),a
3928                     ; 973 	buf[1] = error;
3930  0007 c6000a        	ld	a,_error
3931  000a e701          	ld	(1,x),a
3932                     ; 974 	buf[2] = mode_recover;
3934  000c c60011        	ld	a,_mode_recover
3935  000f e702          	ld	(2,x),a
3936                     ; 975 	buf[3] = 0x00;
3938  0011 6f03          	clr	(3,x)
3939                     ; 976 	buf[4] = 0x00;
3941  0013 6f04          	clr	(4,x)
3942                     ; 977 	buf[5] = 0x00;
3944  0015 6f05          	clr	(5,x)
3945                     ; 978 	buf[6] = 0x00;
3947  0017 6f06          	clr	(6,x)
3948                     ; 980 	makeChecksum(buf);
3950  0019 cd0000        	call	_makeChecksum
3952                     ; 981 }
3955  001c 85            	popw	x
3956  001d 81            	ret	
3993                     ; 983 void rc_ptc_make_command(uint8_t *buf) {
3994                     .text:	section	.text,new
3995  0000               _rc_ptc_make_command:
3997       00000000      OFST:	set	0
4000                     ; 984 	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
4002  0000 c60004        	ld	a,_uiInfo+4
4003  0003 aaf0          	or	a,#240
4004  0005 f7            	ld	(x),a
4005                     ; 985 	buf[1] = 0x20;
4007  0006 a620          	ld	a,#32
4008  0008 e701          	ld	(1,x),a
4009                     ; 986 	buf[2] = 0x00;
4011  000a 6f02          	clr	(2,x)
4012                     ; 987 	buf[3] = 0x00;
4014  000c 6f03          	clr	(3,x)
4015                     ; 988 	buf[4] = 0x00;
4017  000e 6f04          	clr	(4,x)
4018                     ; 989 	buf[5] = 0x00;
4020  0010 6f05          	clr	(5,x)
4021                     ; 990 	buf[6] = 0x00;
4023  0012 6f06          	clr	(6,x)
4024                     ; 991 }
4027  0014 81            	ret	
4079                     ; 1001 void rc_ptc_make_command_packet(uint8_t *buf, uint8_t cmd, uint8_t p1)
4079                     ; 1002 {
4080                     .text:	section	.text,new
4081  0000               _rc_ptc_make_command_packet:
4083  0000 89            	pushw	x
4084       00000000      OFST:	set	0
4087                     ; 1003 	rc_ptc_make_command(buf);
4089  0001 cd0000        	call	_rc_ptc_make_command
4091                     ; 1004 	switch( cmd )
4093  0004 7b05          	ld	a,(OFST+5,sp)
4095                     ; 1031 		break;
4096  0006 4a            	dec	a
4097  0007 270c          	jreq	L7631
4098  0009 a003          	sub	a,#3
4099  000b 270d          	jreq	L1731
4100  000d 4a            	dec	a
4101  000e 2710          	jreq	L3731
4102  0010 4a            	dec	a
4103  0011 2713          	jreq	L5731
4104  0013 201b          	jra	L3241
4105  0015               L7631:
4106                     ; 1006 	case PKT_CMD_MIRROR:
4106                     ; 1007 		buf[2] = COMMAND_MODE_MIRROR;
4108  0015 1e01          	ldw	x,(OFST+1,sp)
4109  0017 4c            	inc	a
4110                     ; 1008 		buf[3] = p1;
4111                     ; 1009 		break;
4113  0018 2010          	jp	LC021
4114  001a               L1731:
4115                     ; 1020 	case PKT_CMD_FACTORY:
4115                     ; 1021 		buf[2] = COMMAND_MODE_FACTORY;
4117  001a 1e01          	ldw	x,(OFST+1,sp)
4118  001c a608          	ld	a,#8
4119                     ; 1022 		buf[3] = p1;
4120                     ; 1023 		break;
4122  001e 200a          	jp	LC021
4123  0020               L3731:
4124                     ; 1024 	case PKT_CMD_RESET:
4124                     ; 1025 		buf[2] = COMMAND_MODE_RESET;
4126  0020 1e01          	ldw	x,(OFST+1,sp)
4127  0022 a604          	ld	a,#4
4128                     ; 1026 		buf[3] = p1;
4129                     ; 1027 		break;
4131  0024 2004          	jp	LC021
4132  0026               L5731:
4133                     ; 1028 	case PKT_CMD_BOILER_HOT_MODE:
4133                     ; 1029 		buf[2] = COMMAND_MODE_HOTWATER;
4135  0026 1e01          	ldw	x,(OFST+1,sp)
4136  0028 a602          	ld	a,#2
4137                     ; 1030 		buf[3] = p1;
4139  002a               LC021:
4140  002a e702          	ld	(2,x),a
4144  002c 7b06          	ld	a,(OFST+6,sp)
4145  002e e703          	ld	(3,x),a
4146                     ; 1031 		break;
4148  0030               L3241:
4149                     ; 1034 	makeChecksum(buf);
4151  0030 1e01          	ldw	x,(OFST+1,sp)
4152  0032 cd0000        	call	_makeChecksum
4154                     ; 1035 }
4157  0035 85            	popw	x
4158  0036 81            	ret	
4204                     ; 1071 void rc_ptc_make_mirror(uint8_t *buf) {
4205                     .text:	section	.text,new
4206  0000               _rc_ptc_make_mirror:
4208  0000 89            	pushw	x
4209  0001 88            	push	a
4210       00000001      OFST:	set	1
4213                     ; 1073 	buf[0] = BYTE_START_RC_MIRROR | cur_mirror_page;
4215  0002 c60006        	ld	a,_cur_mirror_page
4216  0005 aa40          	or	a,#64
4217  0007 f7            	ld	(x),a
4218                     ; 1075 	mode = mode_mirror == 1 ? CNT_MODE_MAIN : CNT_MODE_SUB;
4220  0008 c60013        	ld	a,_mode_mirror
4221  000b 4a            	dec	a
4222  000c 2702          	jreq	L662
4223  000e a601          	ld	a,#1
4224  0010               L662:
4225  0010 6b01          	ld	(OFST+0,sp),a
4227                     ; 1076 	rc_ptc_make_baseSetting(buf, cur_mirror_page, mode);
4229  0012 88            	push	a
4230  0013 3b0006        	push	_cur_mirror_page
4231  0016 1e04          	ldw	x,(OFST+3,sp)
4232  0018 cd0000        	call	_rc_ptc_make_baseSetting
4234  001b 85            	popw	x
4235                     ; 1078 	makeChecksum(buf);
4237  001c 1e02          	ldw	x,(OFST+1,sp)
4238  001e cd0000        	call	_makeChecksum
4240                     ; 1080 	if (cur_mirror_page == 2) {
4242  0021 c60006        	ld	a,_cur_mirror_page
4243  0024 a102          	cp	a,#2
4244  0026 2608          	jrne	L5441
4245                     ; 1081 		cur_mirror_page = 0;
4247  0028 725f0006      	clr	_cur_mirror_page
4248                     ; 1082 		mode_mirror = 0;
4250  002c 725f0013      	clr	_mode_mirror
4251  0030               L5441:
4252                     ; 1084 }
4255  0030 5b03          	addw	sp,#3
4256  0032 81            	ret	
4314                     ; 1086 void rc_ptc_make(uint8_t *buf) {
4315                     .text:	section	.text,new
4316  0000               _rc_ptc_make:
4318  0000 89            	pushw	x
4319  0001 88            	push	a
4320       00000001      OFST:	set	1
4323                     ; 1090 	if (error != 0 && error_type != 0) {
4325  0002 c6000a        	ld	a,_error
4326  0005 2705          	jreq	L3741
4328  0007 c60009        	ld	a,_error_type
4329                     ; 1091 		rc_ptc_make_error(buf);
4331                     ; 1092 		return;
4333  000a 2606          	jrne	LC022
4334  000c               L3741:
4335                     ; 1094 		if (mode_recover == 1) {
4337  000c c60011        	ld	a,_mode_recover
4338  000f 4a            	dec	a
4339  0010 2606          	jrne	L5741
4340                     ; 1095 			rc_ptc_make_error(buf);
4342  0012               LC022:
4344  0012 cd0000        	call	_rc_ptc_make_error
4346                     ; 1096 			return;
4347  0015               L033:
4350  0015 5b03          	addw	sp,#3
4351  0017 81            	ret	
4352  0018               L5741:
4353                     ; 1100 	switch (uiInfo.mode) {
4355  0018 c60008        	ld	a,_uiInfo+8
4357                     ; 1148 			break;
4358  001b 276a          	jreq	LC023
4359  001d 4a            	dec	a
4360  001e 26f5          	jrne	L033
4361                     ; 1101 		case SETTING_MODE_MASTER:
4361                     ; 1102 			
4361                     ; 1103 			if (getSettingChange() == 1) {
4363  0020 cd0000        	call	_getSettingChange
4365  0023 4a            	dec	a
4366  0024 2607          	jrne	L5051
4367                     ; 1104 				rc_ptc_make_setting(buf);
4369  0026 1e02          	ldw	x,(OFST+1,sp)
4370  0028 cd0000        	call	_rc_ptc_make_setting
4372                     ; 1105 				return;
4374  002b 20e8          	jra	L033
4375  002d               L5051:
4376                     ; 1109 			if (mode_mirror != 0) {
4378  002d c60013        	ld	a,_mode_mirror
4379  0030 270d          	jreq	L7051
4380                     ; 1110 				rc_ptc_make_command_packet(buf, PKT_CMD_MIRROR, mode_mirror);
4382  0032 3b0013        	push	_mode_mirror
4383  0035 4b01          	push	#1
4384  0037 1e04          	ldw	x,(OFST+3,sp)
4385  0039 cd0000        	call	_rc_ptc_make_command_packet
4387  003c 85            	popw	x
4388                     ; 1111 				return;
4390  003d 20d6          	jra	L033
4391  003f               L7051:
4392                     ; 1114 			if (mode_factory != 0) {
4394  003f c60012        	ld	a,_mode_factory
4395  0042 2711          	jreq	L1151
4396                     ; 1116 				rc_ptc_make_command_packet(buf, PKT_CMD_FACTORY, mode_factory);
4398  0044 3b0012        	push	_mode_factory
4399  0047 4b04          	push	#4
4400  0049 1e04          	ldw	x,(OFST+3,sp)
4401  004b cd0000        	call	_rc_ptc_make_command_packet
4403  004e 725f0012      	clr	_mode_factory
4404  0052 85            	popw	x
4405                     ; 1117 				mode_factory = 0;
4407                     ; 1118 				return;
4409  0053 20c0          	jra	L033
4410  0055               L1151:
4411                     ; 1121 			if (mode_hotwater != 0) {
4413  0055 c60010        	ld	a,_mode_hotwater
4414  0058 270d          	jreq	L3151
4415                     ; 1123 				rc_ptc_make_command_packet(buf, PKT_CMD_BOILER_HOT_MODE, mode_hotwater);
4417  005a 3b0010        	push	_mode_hotwater
4418  005d 4b06          	push	#6
4419  005f 1e04          	ldw	x,(OFST+3,sp)
4420  0061 cd0000        	call	_rc_ptc_make_command_packet
4422  0064 85            	popw	x
4423                     ; 1124 				return;
4425  0065 20ae          	jra	L033
4426  0067               L3151:
4427                     ; 1127 			if (mode_reset != 0) {
4429  0067 c6000f        	ld	a,_mode_reset
4430  006a 270d          	jreq	L5151
4431                     ; 1129 				rc_ptc_make_command_packet(buf, PKT_CMD_RESET, mode_reset);
4433  006c 3b000f        	push	_mode_reset
4434  006f 4b05          	push	#5
4435  0071 1e04          	ldw	x,(OFST+3,sp)
4436  0073 cd0000        	call	_rc_ptc_make_command_packet
4438  0076 85            	popw	x
4439                     ; 1130 				return;
4441  0077 209c          	jra	L033
4442  0079               L5151:
4443                     ; 1134 			num = rc_ptc_check_subRC();
4445  0079 cd0000        	call	_rc_ptc_check_subRC
4447  007c 6b01          	ld	(OFST+0,sp),a
4449                     ; 1135 			if ( num == 0xFF) {
4451  007e 4c            	inc	a
4452                     ; 1136 				rc_ptc_make_normal(buf);
4454                     ; 1137 				return;
4456  007f 2706          	jreq	LC023
4457                     ; 1140 			if (_remote == 1) {
4459  0081 c60000        	ld	a,__remote
4460  0084 4a            	dec	a
4461  0085 2607          	jrne	L1251
4462                     ; 1141 				rc_ptc_make_normal(buf);
4464  0087               LC023:
4467  0087 1e02          	ldw	x,(OFST+1,sp)
4468  0089 cd0000        	call	_rc_ptc_make_normal
4471  008c 2087          	jra	L033
4472  008e               L1251:
4473                     ; 1143 				rc_ptc_make_subRC(buf, num);
4475  008e 7b01          	ld	a,(OFST+0,sp)
4476  0090 88            	push	a
4477  0091 1e03          	ldw	x,(OFST+2,sp)
4478  0093 cd0000        	call	_rc_ptc_make_subRC
4480  0096 84            	pop	a
4481  0097 cc0015        	jra	L033
4482                     ; 1146 		case SETTING_MODE_SUB:
4482                     ; 1147 			rc_ptc_make_normal(buf);
4484                     ; 1148 			break;
4486                     ; 1150 }
4530                     ; 1153 void func_rc_command(uint8_t com1, uint8_t com2) {
4531                     .text:	section	.text,new
4532  0000               _func_rc_command:
4534  0000 89            	pushw	x
4535       00000000      OFST:	set	0
4538                     ; 1154 	mode_mirror = 0;
4540  0001 725f0013      	clr	_mode_mirror
4541                     ; 1155 	mode_factory = 0;
4543  0005 725f0012      	clr	_mode_factory
4544                     ; 1156 	mode_hotwater = 0;
4546  0009 725f0010      	clr	_mode_hotwater
4547                     ; 1157 	mode_reset = 0;
4549  000d 725f000f      	clr	_mode_reset
4550                     ; 1159 	switch(com1) {
4552  0011 9e            	ld	a,xh
4554                     ; 1171 			break;
4555  0012 4a            	dec	a
4556  0013 270d          	jreq	L5251
4557  0015 4a            	dec	a
4558  0016 2711          	jreq	L7251
4559  0018 a002          	sub	a,#2
4560  001a 2714          	jreq	L1351
4561  001c a004          	sub	a,#4
4562  001e 2717          	jreq	L3351
4563  0020 201a          	jra	L5551
4564  0022               L5251:
4565                     ; 1160 		case COMMAND_MODE_MIRROR:
4565                     ; 1161 			mode_mirror = com2;
4567  0022 7b02          	ld	a,(OFST+2,sp)
4568  0024 c70013        	ld	_mode_mirror,a
4569                     ; 1162 			break;
4571  0027 2013          	jra	L5551
4572  0029               L7251:
4573                     ; 1163 		case COMMAND_MODE_HOTWATER:
4573                     ; 1164 			mode_hotwater = com2;
4575  0029 7b02          	ld	a,(OFST+2,sp)
4576  002b c70010        	ld	_mode_hotwater,a
4577                     ; 1165 			break;
4579  002e 200c          	jra	L5551
4580  0030               L1351:
4581                     ; 1166 		case COMMAND_MODE_RESET:
4581                     ; 1167 			mode_reset = com2;
4583  0030 7b02          	ld	a,(OFST+2,sp)
4584  0032 c7000f        	ld	_mode_reset,a
4585                     ; 1168 			break;
4587  0035 2005          	jra	L5551
4588  0037               L3351:
4589                     ; 1169 		case COMMAND_MODE_FACTORY:
4589                     ; 1170 			mode_factory = com2;
4591  0037 7b02          	ld	a,(OFST+2,sp)
4592  0039 c70012        	ld	_mode_factory,a
4593                     ; 1171 			break;
4595  003c               L5551:
4596                     ; 1173 }
4599  003c 85            	popw	x
4600  003d 81            	ret	
4633                     ; 1175 void func_rc_recover(uint8_t com) {
4634                     .text:	section	.text,new
4635  0000               _func_rc_recover:
4639                     ; 1176 	mode_recover = com;
4641  0000 c70011        	ld	_mode_recover,a
4642                     ; 1177 }
4645  0003 81            	ret	
4669                     ; 1179 void func_rc_setting(void) {
4670                     .text:	section	.text,new
4671  0000               _func_rc_setting:
4675                     ; 1180 	setSettingChange(1);
4677  0000 a601          	ld	a,#1
4679                     ; 1181 }
4682  0002 cc0000        	jp	_setSettingChange
4685                     	switch	.data
4686  0007               ___func_rc_settingCb:
4687  0007 00            	dc.b	0
4718                     ; 1185 void func_rc_settingCb(uint8_t ch) {
4719                     .text:	section	.text,new
4720  0000               _func_rc_settingCb:
4724                     ; 1186 	__func_rc_settingCb = ch;
4726  0000 c70007        	ld	___func_rc_settingCb,a
4727                     ; 1187 }
4730  0003 81            	ret	
5053                     	xdef	___func_rc_settingCb
5054                     	xdef	_rc_ptc_make_command_packet
5055                     	xdef	_rc_ptc_make_command
5056                     	xdef	_rc_ptc_make_error
5057                     	xdef	_rc_ptc_check_subRC
5058                     	xdef	_dr_out_count
5059                     	xdef	_rc_ptc_make_baseSetting
5060                     	xdef	_makeChecksum
5061                     	xdef	_rc_ptc_check_mirror
5062                     	xdef	_rc_ptc_check_subrc
5063                     	xdef	_rc_ptc_check_rc
5064                     	xdef	_rc_ptc_check_setting
5065                     	xdef	_rc_ptc_check_normal
5066                     	xdef	___rc_s
5067                     	xdef	_rc_ptc_check_homenet
5068                     	xdef	_rc_ptc_check_master
5069                     	xdef	_only_one
5070                     	xdef	_dr_mode_out
5071                     	switch	.bss
5072  0000               _cur_src:
5073  0000 00            	ds.b	1
5074                     	xdef	_cur_src
5075  0001               _ret_count:
5076  0001 00            	ds.b	1
5077                     	xdef	_ret_count
5078  0002               _disp_mode_preview:
5079  0002 00            	ds.b	1
5080                     	xdef	_disp_mode_preview
5081  0003               __rcLED:
5082  0003 00            	ds.b	1
5083                     	xdef	__rcLED
5084  0004               _test_count:
5085  0004 00            	ds.b	1
5086                     	xdef	_test_count
5087  0005               _packet_changed:
5088  0005 00            	ds.b	1
5089                     	xdef	_packet_changed
5090  0006               _cur_mirror_page:
5091  0006 00            	ds.b	1
5092                     	xdef	_cur_mirror_page
5093  0007               _cur_set_page:
5094  0007 00            	ds.b	1
5095                     	xdef	_cur_set_page
5096  0008               __version:
5097  0008 00            	ds.b	1
5098                     	xdef	__version
5099  0009               _error_type:
5100  0009 00            	ds.b	1
5101                     	xdef	_error_type
5102  000a               _error:
5103  000a 00            	ds.b	1
5104                     	xdef	_error
5105                     	xdef	_debug_br
5106                     	xdef	_debug_hn
5107  000b               _state_check:
5108  000b 00            	ds.b	1
5109                     	xdef	_state_check
5110                     	xref	__backup_backlight
5111                     	xref	_packet_buf
5112                     	xref	__boiler_fire
5113                     	xref	__boiler_type
5114                     	xref	__timFlag
5115                     	xref	__remote
5116  000c               __rcInfo:
5117  000c 0000          	ds.b	2
5118                     	xdef	__rcInfo
5119                     	xref	__boiler_water_heat
5120                     	xref	__boiler_water_shower
5121                     	xref	___boiler_shower
5122                     	xref	__updateCount
5123                     	xref	__updateBit
5124                     	xref	__updateTimer
5125                     	xref	__disp_mode2
5126                     	xref	_lcd_disp_rid
5127                     	xref	_uiInfo
5128                     	xdef	_rcInfoSet
5129                     	xdef	_get_rcInfo
5130                     	xdef	___rc_max
5131                     	xdef	_func_rc_settingCb
5132                     	xdef	_func_rc_setting
5133                     	xdef	_func_rc_recover
5134                     	xdef	_func_rc_command
5135                     	xdef	_rc_ptc_make_mirror
5136                     	xdef	_rc_ptc_make
5137                     	xdef	_rc_ptc_make_subRC
5138                     	xdef	_rc_ptc_make_setting
5139                     	xdef	_rc_ptc_make_normal
5140                     	xdef	_setState_check
5141                     	xdef	_getState_check
5142                     	xdef	_getSettingChange
5143                     	xdef	_setSettingChange
5144                     	xdef	_rc_ptc_check
5145                     	xdef	_rc_ptc_baseSet
5146                     	xdef	_getHexToBin
5147  000e               _set_changed:
5148  000e 00            	ds.b	1
5149                     	xdef	_set_changed
5150  000f               _mode_reset:
5151  000f 00            	ds.b	1
5152                     	xdef	_mode_reset
5153  0010               _mode_hotwater:
5154  0010 00            	ds.b	1
5155                     	xdef	_mode_hotwater
5156  0011               _mode_recover:
5157  0011 00            	ds.b	1
5158                     	xdef	_mode_recover
5159  0012               _mode_factory:
5160  0012 00            	ds.b	1
5161                     	xdef	_mode_factory
5162  0013               _mode_mirror:
5163  0013 00            	ds.b	1
5164                     	xdef	_mode_mirror
5165  0014               _boiler_info:
5166  0014 000000        	ds.b	3
5167                     	xdef	_boiler_info
5168  0017               _rcSubDataInfo:
5169  0017 000000000000  	ds.b	48
5170                     	xdef	_rcSubDataInfo
5171                     	xref	_file_read
5172                     	xref	_disp_char
5173                     	xref	___timer1s
5193                     	end
