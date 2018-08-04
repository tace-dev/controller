   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  22                     	switch	.data
  23  0000               _debug_hn:
  24  0000 00            	dc.b	0
  25  0001               _debug_br:
  26  0001 00            	dc.b	0
  27  0002               _dr_mode_out:
  28  0002 01            	dc.b	1
  29  0003               _only_one:
  30  0003 00            	dc.b	0
  82                     ; 69 uint8_t getHexToBin(uint8_t hex, uint8_t idx)
  82                     ; 70 {
  84                     .text:	section	.text,new
  85  0000               _getHexToBin:
  87  0000 89            	pushw	x
  88  0001 88            	push	a
  89       00000001      OFST:	set	1
  92                     ; 71 	uint8_t p = 0x80;
  94                     ; 72 	p = p >> (0x08 - (idx + 0x01));
  96  0002 9f            	ld	a,xl
  97  0003 a007          	sub	a,#7
  98  0005 40            	neg	a
  99  0006 5f            	clrw	x
 100  0007 97            	ld	xl,a
 101  0008 a680          	ld	a,#128
 102  000a 5d            	tnzw	x
 103  000b 2704          	jreq	L6
 104  000d               L01:
 105  000d 44            	srl	a
 106  000e 5a            	decw	x
 107  000f 26fc          	jrne	L01
 108  0011               L6:
 109  0011 6b01          	ld	(OFST+0,sp),a
 110                     ; 74 	if (hex & p)
 112  0013 7b02          	ld	a,(OFST+1,sp)
 113  0015 1501          	bcp	a,(OFST+0,sp)
 114  0017 2704          	jreq	L13
 115                     ; 76 		return 1;
 117  0019 a601          	ld	a,#1
 119  001b 2001          	jra	L21
 120  001d               L13:
 121                     ; 80 		return 0;
 123  001d 4f            	clr	a
 125  001e               L21:
 127  001e 5b03          	addw	sp,#3
 128  0020 81            	ret	
 163                     ; 84 void rc_ptc_baseSet(void) {
 164                     .text:	section	.text,new
 165  0000               _rc_ptc_baseSet:
 167  0000 88            	push	a
 168       00000001      OFST:	set	1
 171                     ; 86 	state_check = RC_STATE_NORMAL;
 173  0001 3501000b      	mov	_state_check,#1
 174                     ; 87 	set_changed = 0;
 176  0005 725f000c      	clr	_set_changed
 177                     ; 89 	for (i = 0 ; i < 8 ; i++) {
 179  0009 4f            	clr	a
 180  000a 6b01          	ld	(OFST+0,sp),a
 181  000c               L15:
 182                     ; 90 		rcSubDataInfo.mode_heat[i] = 0xAA;
 184  000c 5f            	clrw	x
 185  000d 97            	ld	xl,a
 186  000e a6aa          	ld	a,#170
 187  0010 d70025        	ld	(_rcSubDataInfo+16,x),a
 188                     ; 91 		rcSubDataInfo.cur_temp[i] = 0xAA;
 190  0013 5f            	clrw	x
 191  0014 7b01          	ld	a,(OFST+0,sp)
 192  0016 97            	ld	xl,a
 193  0017 a6aa          	ld	a,#170
 194  0019 d70015        	ld	(_rcSubDataInfo,x),a
 195                     ; 92 		rcSubDataInfo.set_temp[i] = 0xAA;
 197  001c 5f            	clrw	x
 198  001d 7b01          	ld	a,(OFST+0,sp)
 199  001f 97            	ld	xl,a
 200  0020 a6aa          	ld	a,#170
 201  0022 d7001d        	ld	(_rcSubDataInfo+8,x),a
 202                     ; 93 		rcSubDataInfo.time[i] = 0xAA;
 204  0025 5f            	clrw	x
 205  0026 7b01          	ld	a,(OFST+0,sp)
 206  0028 97            	ld	xl,a
 207  0029 a6aa          	ld	a,#170
 208  002b d70035        	ld	(_rcSubDataInfo+32,x),a
 209                     ; 94 		rcSubDataInfo.banb[i] = 0xAA;
 211  002e 5f            	clrw	x
 212  002f 7b01          	ld	a,(OFST+0,sp)
 213  0031 97            	ld	xl,a
 214  0032 a6aa          	ld	a,#170
 215  0034 d7003d        	ld	(_rcSubDataInfo+40,x),a
 216                     ; 89 	for (i = 0 ; i < 8 ; i++) {
 218  0037 0c01          	inc	(OFST+0,sp)
 221  0039 7b01          	ld	a,(OFST+0,sp)
 222  003b a108          	cp	a,#8
 223  003d 25cd          	jrult	L15
 224                     ; 96 }
 227  003f 84            	pop	a
 228  0040 81            	ret	
 268                     ; 98 void rc_ptc_check_master(uint8_t *buf) {
 269                     .text:	section	.text,new
 270  0000               _rc_ptc_check_master:
 272  0000 89            	pushw	x
 273       00000000      OFST:	set	0
 276                     ; 99 	if (buf[1] != 0x00) {
 278  0001 e601          	ld	a,(1,x)
 279  0003 260f          	jrne	L42
 280                     ; 100 		return;
 282                     ; 107 	if (getHexToBin(buf[6], 7) == 1) {  // H/N 패킷
 284  0005 1601          	ldw	y,(OFST+1,sp)
 285  0007 ae0007        	ldw	x,#7
 286  000a 90e606        	ld	a,(6,y)
 287  000d 95            	ld	xh,a
 288  000e cd0000        	call	_getHexToBin
 290  0011 4a            	dec	a
 291  0012 2602          	jrne	L77
 292                     ; 108 		return;
 293  0014               L42:
 296  0014 85            	popw	x
 297  0015 81            	ret	
 298  0016               L77:
 299                     ; 111 	boiler_info.state = buf[4] & 0x03;
 301  0016 1e01          	ldw	x,(OFST+1,sp)
 302  0018 e604          	ld	a,(4,x)
 303  001a a403          	and	a,#3
 304  001c c70012        	ld	_boiler_info,a
 305                     ; 112 	boiler_info.hotwater = buf[2];
 307  001f e602          	ld	a,(2,x)
 308  0021 c70013        	ld	_boiler_info+1,a
 309                     ; 113 	boiler_info.heatwater = buf[3];
 311  0024 e603          	ld	a,(3,x)
 312  0026 c70014        	ld	_boiler_info+2,a
 313                     ; 115 	uiInfo.cntlMode = getHexToBin(buf[4], 7);
 315  0029 1601          	ldw	y,(OFST+1,sp)
 316  002b ae0007        	ldw	x,#7
 317  002e 90e604        	ld	a,(4,y)
 318  0031 95            	ld	xh,a
 319  0032 cd0000        	call	_getHexToBin
 321  0035 c70003        	ld	_uiInfo+3,a
 322                     ; 117 	_boiler_fire = boiler_info.state;
 324  0038 5500120000    	mov	__boiler_fire,_boiler_info
 325                     ; 119 }
 327  003d 20d5          	jra	L42
 383                     ; 122 void rc_ptc_check_homenet(uint8_t *buf) {
 384                     .text:	section	.text,new
 385  0000               _rc_ptc_check_homenet:
 387  0000 89            	pushw	x
 388  0001 88            	push	a
 389       00000001      OFST:	set	1
 392                     ; 126 	if (getHexToBin(buf[6], 7) == 0) { // 일반 패킷
 394  0002 1602          	ldw	y,(OFST+1,sp)
 395  0004 ae0007        	ldw	x,#7
 396  0007 90e606        	ld	a,(6,y)
 397  000a 95            	ld	xh,a
 398  000b cd0000        	call	_getHexToBin
 400  000e 4d            	tnz	a
 401  000f 270d          	jreq	L23
 402                     ; 127 		return;
 404                     ; 130 	id = buf[1] & 0x0F;
 406  0011 1e02          	ldw	x,(OFST+1,sp)
 407  0013 e601          	ld	a,(1,x)
 408  0015 a40f          	and	a,#15
 409  0017 6b01          	ld	(OFST+0,sp),a
 410                     ; 132 	if (id != uiInfo.id) {
 412  0019 c10004        	cp	a,_uiInfo+4
 413  001c 2703          	jreq	L521
 414                     ; 133 		return;
 415  001e               L23:
 418  001e 5b03          	addw	sp,#3
 419  0020 81            	ret	
 420  0021               L521:
 421                     ; 136 	packet_changed = 1;
 423  0021 35010005      	mov	_packet_changed,#1
 424                     ; 138 	if (_remote == 0) {
 426  0025 c60000        	ld	a,__remote
 427  0028 26f4          	jrne	L23
 428                     ; 139 		_disp_mode2 = buf[2];
 430  002a e602          	ld	a,(2,x)
 431  002c c70000        	ld	__disp_mode2,a
 432                     ; 141 		if (buf[2] == RC_MODE_HEAT) {
 434  002f a101          	cp	a,#1
 435  0031 260b          	jrne	L131
 436                     ; 142 			if (buf[3] != 0xFF) {
 438  0033 e603          	ld	a,(3,x)
 439  0035 a1ff          	cp	a,#255
 440  0037 27e5          	jreq	L23
 441                     ; 143 				uiInfo.tSetup = buf[3];
 443  0039 c7000e        	ld	_uiInfo+14,a
 444  003c 20e0          	jra	L23
 445  003e               L131:
 446                     ; 145 		} else if (buf[2] == RC_MODE_OUT) {
 448  003e a102          	cp	a,#2
 449  0040 26dc          	jrne	L23
 450                     ; 146 			out_mode = (buf[4] & 0xF0) >> 7;
 452  0042 e604          	ld	a,(4,x)
 453  0044 49            	rlc	a
 454  0045 4f            	clr	a
 455  0046 49            	rlc	a
 456  0047 6b01          	ld	(OFST+0,sp),a
 457                     ; 147 			uiInfo.tSetup = /*buf[3]*/20;
 459  0049 3514000e      	mov	_uiInfo+14,#20
 460                     ; 148 			if (out_mode == 1) {
 462  004d 4a            	dec	a
 463  004e 2606          	jrne	L141
 464                     ; 149 				dr_mode_out = 1;   // 개별외출
 466  0050 35010002      	mov	_dr_mode_out,#1
 468  0054 20c8          	jra	L23
 469  0056               L141:
 470                     ; 151 				dr_mode_out = 0;   // 전체 외출
 472  0056 725f0002      	clr	_dr_mode_out
 473                     ; 154 		else if( buf[2] == RC_MODE_STOP )
 475                     ; 156 			out_mode = 1;
 477                     ; 159 }
 479  005a 20c2          	jra	L23
 482                     	switch	.data
 483  0004               ___rc_max:
 484  0004 01            	dc.b	1
 543                     ; 164 void rc_ptc_check_normal(uint8_t *buf) {
 544                     .text:	section	.text,new
 545  0000               _rc_ptc_check_normal:
 547  0000 89            	pushw	x
 548  0001 88            	push	a
 549       00000001      OFST:	set	1
 552                     ; 165 	uint8_t start = buf[0] & 0x0F;
 554  0002 f6            	ld	a,(x)
 555  0003 a40f          	and	a,#15
 556  0005 6b01          	ld	(OFST+0,sp),a
 557                     ; 167 	if (start == 0x0F) {
 559  0007 a10f          	cp	a,#15
 560  0009 2606          	jrne	L171
 561                     ; 168 		state_check = RC_STATE_FACTORY;
 563  000b 3505000b      	mov	_state_check,#5
 564                     ; 169 		return;
 566  000f 203e          	jra	L26
 567  0011               L171:
 568                     ; 172 	if (start == 0x01 || start == 0x09) {
 570  0011 a101          	cp	a,#1
 571  0013 2704          	jreq	L571
 573  0015 a109          	cp	a,#9
 574  0017 2604          	jrne	L371
 575  0019               L571:
 576                     ; 173 		only_one = 0;
 578  0019 725f0003      	clr	_only_one
 579  001d               L371:
 580                     ; 176 	if( start <= 0x08 )
 582  001d a109          	cp	a,#9
 583  001f 2408          	jruge	L771
 584                     ; 178 		if( start > __rc_max )
 586  0021 c10004        	cp	a,___rc_max
 587  0024 2303          	jrule	L771
 588                     ; 179 			__rc_max = start;
 590  0026 c70004        	ld	___rc_max,a
 591  0029               L771:
 592                     ; 182 	if (start == uiInfo.id) {
 594  0029 c10004        	cp	a,_uiInfo+4
 595  002c 260d          	jrne	L302
 596                     ; 183 		packet_buf[start - 1] = 0;
 598  002e 5f            	clrw	x
 599  002f 97            	ld	xl,a
 600  0030 5a            	decw	x
 601                     ; 184 		state_check = RC_STATE_NORMAL;
 603  0031 3501000b      	mov	_state_check,#1
 604  0035 724f0000      	clr	(_packet_buf,x)
 606  0039 2004          	jra	L502
 607  003b               L302:
 608                     ; 186 		state_check = RC_STATE_NONE;
 610  003b 725f000b      	clr	_state_check
 611  003f               L502:
 612                     ; 189 	if (start == 0x09 ) {
 614  003f a109          	cp	a,#9
 615  0041 260f          	jrne	L702
 616                     ; 190 		debug_hn = buf[2];
 618  0043 1e02          	ldw	x,(OFST+1,sp)
 619  0045 e602          	ld	a,(2,x)
 620  0047 c70000        	ld	_debug_hn,a
 621                     ; 191 		debug_br = buf[1];
 623  004a e601          	ld	a,(1,x)
 624  004c c70001        	ld	_debug_br,a
 625                     ; 192 		return;
 626  004f               L26:
 629  004f 5b03          	addw	sp,#3
 630  0051 81            	ret	
 631  0052               L702:
 632                     ; 195 	if (uiInfo.mode == SETTING_MODE_MASTER) {
 634  0052 c60008        	ld	a,_uiInfo+8
 635  0055 4a            	dec	a
 636  0056 2605          	jrne	L112
 637                     ; 196 		rc_ptc_check_master(buf);
 639  0058 1e02          	ldw	x,(OFST+1,sp)
 640  005a cd0000        	call	_rc_ptc_check_master
 642  005d               L112:
 643                     ; 199 	if ( _remote == 0 && _backup_backlight == 0) {
 645  005d c60000        	ld	a,__remote
 646  0060 2650          	jrne	L312
 648  0062 c60000        	ld	a,__backup_backlight
 649  0065 264b          	jrne	L312
 650                     ; 200 		if (getHexToBin(buf[6], 7) == 0) {
 652  0067 1602          	ldw	y,(OFST+1,sp)
 653  0069 ae0007        	ldw	x,#7
 654  006c 90e606        	ld	a,(6,y)
 655  006f 95            	ld	xh,a
 656  0070 cd0000        	call	_getHexToBin
 658  0073 4d            	tnz	a
 659  0074 263c          	jrne	L312
 660                     ; 201 			_rcLED = buf[1];
 662  0076 1e02          	ldw	x,(OFST+1,sp)
 663  0078 e601          	ld	a,(1,x)
 664  007a c70003        	ld	__rcLED,a
 665                     ; 203 			if (getHexToBin(buf[1], uiInfo.id - 1) == 1) {
 667  007d c60004        	ld	a,_uiInfo+4
 668  0080 4a            	dec	a
 669  0081 1602          	ldw	y,(OFST+1,sp)
 670  0083 97            	ld	xl,a
 671  0084 90e601        	ld	a,(1,y)
 672  0087 95            	ld	xh,a
 673  0088 cd0000        	call	_getHexToBin
 675  008b 4a            	dec	a
 676  008c 2610          	jrne	L712
 677                     ; 208 				lcd_disp_rid(uiInfo.id, 1, (uiInfo.mode == SETTING_MODE_MASTER) ? 1 : 0);
 679  008e c60008        	ld	a,_uiInfo+8
 680  0091 4a            	dec	a
 681  0092 2603          	jrne	L64
 682  0094 4c            	inc	a
 683  0095 2001          	jra	L05
 684  0097               L64:
 685  0097 4f            	clr	a
 686  0098               L05:
 687  0098 88            	push	a
 688  0099 ae0001        	ldw	x,#1
 691  009c 200c          	jp	LC002
 692  009e               L712:
 693                     ; 219 				lcd_disp_rid(uiInfo.id, 0, (uiInfo.mode == SETTING_MODE_MASTER) ? 1 : 0);
 695  009e c60008        	ld	a,_uiInfo+8
 696  00a1 4a            	dec	a
 697  00a2 2603          	jrne	L45
 698  00a4 4c            	inc	a
 699  00a5 2001          	jra	L65
 700  00a7               L45:
 701  00a7 4f            	clr	a
 702  00a8               L65:
 703  00a8 88            	push	a
 704  00a9 5f            	clrw	x
 706  00aa               LC002:
 707  00aa c60004        	ld	a,_uiInfo+4
 708  00ad 95            	ld	xh,a
 709  00ae cd0000        	call	_lcd_disp_rid
 710  00b1 84            	pop	a
 711  00b2               L312:
 712                     ; 229 	rc_ptc_check_homenet(buf);
 714  00b2 1e02          	ldw	x,(OFST+1,sp)
 715  00b4 cd0000        	call	_rc_ptc_check_homenet
 717                     ; 231 	_version = buf[6] >> 1;
 719  00b7 1e02          	ldw	x,(OFST+1,sp)
 720  00b9 e606          	ld	a,(6,x)
 721  00bb 44            	srl	a
 722  00bc c70008        	ld	__version,a
 723                     ; 233 	if (mode_recover == 0) {
 725  00bf c6000f        	ld	a,_mode_recover
 726  00c2 2613          	jrne	L322
 727                     ; 234 		error_type = (buf[4] & 0x0F) >> 2;
 729  00c4 e604          	ld	a,(4,x)
 730  00c6 a40c          	and	a,#12
 731  00c8 44            	srl	a
 732  00c9 44            	srl	a
 733  00ca c70009        	ld	_error_type,a
 734                     ; 236 		if (error_type != 0) {
 736  00cd 2702          	jreq	L522
 737                     ; 237 			error = buf[5];
 739  00cf e605          	ld	a,(5,x)
 741  00d1               L522:
 742                     ; 239 			error = 0;
 744  00d1 c7000a        	ld	_error,a
 745  00d4 cc004f        	jra	L26
 746  00d7               L322:
 747                     ; 242 		if (((buf[4]& 0x0F) >> 2) == 0 && buf[5] == 0) {
 749  00d7 e604          	ld	a,(4,x)
 750  00d9 a40c          	and	a,#12
 751  00db 44            	srl	a
 752  00dc 44            	srl	a
 753  00dd 5f            	clrw	x
 754  00de 97            	ld	xl,a
 755  00df 5d            	tnzw	x
 756  00e0 26f2          	jrne	L26
 758  00e2 1e02          	ldw	x,(OFST+1,sp)
 759  00e4 e605          	ld	a,(5,x)
 760  00e6 26ec          	jrne	L26
 761                     ; 243 			error_type = 0;
 763  00e8 c70009        	ld	_error_type,a
 764                     ; 244 			error = 0;
 766  00eb c7000a        	ld	_error,a
 767                     ; 245 			mode_recover = 0;
 769  00ee c7000f        	ld	_mode_recover,a
 770                     ; 252 }
 772  00f1 cc004f        	jra	L26
 820                     ; 255 void rc_ptc_check_setting(uint8_t *buf) {
 821                     .text:	section	.text,new
 822  0000               _rc_ptc_check_setting:
 824  0000 88            	push	a
 825       00000001      OFST:	set	1
 828                     ; 256 	uint8_t page = buf[0] & 0x0F;
 830  0001 f6            	ld	a,(x)
 831  0002 a40f          	and	a,#15
 832  0004 6b01          	ld	(OFST+0,sp),a
 833                     ; 258 	if (uiInfo.mode != SETTING_MODE_MASTER) {
 835  0006 c60008        	ld	a,_uiInfo+8
 836  0009 4a            	dec	a
 837  000a 2702          	jreq	L552
 838                     ; 259 		return;
 841  000c 84            	pop	a
 842  000d 81            	ret	
 843  000e               L552:
 844                     ; 262 	state_check = RC_STATE_SETTING;
 846  000e 3502000b      	mov	_state_check,#2
 847                     ; 264 	if (cur_set_page == page) {
 849  0012 c60007        	ld	a,_cur_set_page
 850  0015 1101          	cp	a,(OFST+0,sp)
 851  0017 2607          	jrne	L752
 852                     ; 265 		cur_set_page++;
 854  0019 725c0007      	inc	_cur_set_page
 855  001d c60007        	ld	a,_cur_set_page
 856  0020               L752:
 857                     ; 268 	if (cur_set_page == MAX_SETTING_PAGE) { 
 859  0020 a103          	cp	a,#3
 860  0022 2613          	jrne	L162
 861                     ; 269 		set_changed = 0;
 863  0024 725f000c      	clr	_set_changed
 864                     ; 270 		cur_set_page = 0;
 866  0028 725f0007      	clr	_cur_set_page
 867                     ; 272 		func_rc_settingCb(1);
 869  002c a601          	ld	a,#1
 870  002e cd0000        	call	_func_rc_settingCb
 872                     ; 273 		state_check = RC_STATE_NORMAL;
 874  0031 3501000b      	mov	_state_check,#1
 876  0035 2004          	jra	L362
 877  0037               L162:
 878                     ; 275 		func_rc_settingCb(0);
 880  0037 4f            	clr	a
 881  0038 cd0000        	call	_func_rc_settingCb
 883  003b               L362:
 884                     ; 277 }
 887  003b 84            	pop	a
 888  003c 81            	ret	
 946                     ; 280 void rc_ptc_check_rc(uint8_t *buf) {
 947                     .text:	section	.text,new
 948  0000               _rc_ptc_check_rc:
 950  0000 89            	pushw	x
 951  0001 89            	pushw	x
 952       00000002      OFST:	set	2
 955                     ; 284 	st = (buf[0] & 0x0F) - 1;
 957  0002 f6            	ld	a,(x)
 958  0003 a40f          	and	a,#15
 959  0005 4a            	dec	a
 960  0006 6b02          	ld	(OFST+0,sp),a
 961                     ; 286 	if (uiInfo.mode != SETTING_MODE_MASTER) {
 963  0008 c60008        	ld	a,_uiInfo+8
 964  000b 4a            	dec	a
 965  000c 2743          	jreq	L333
 966                     ; 287 		if (st == 0) {
 968  000e 7b02          	ld	a,(OFST+0,sp)
 969  0010 2703cc00b4    	jrne	L201
 970                     ; 288 			if (buf[1] == RC_MODE_OUT && (buf[5] & 0x01)  == 0) {
 972  0015 e601          	ld	a,(1,x)
 973  0017 a102          	cp	a,#2
 974  0019 2612          	jrne	L733
 976  001b e605          	ld	a,(5,x)
 977  001d a501          	bcp	a,#1
 978  001f 260c          	jrne	L733
 979                     ; 289 				_disp_mode2 = RC_MODE_OUT;
 981  0021 35020000      	mov	__disp_mode2,#2
 982                     ; 290 				dr_mode_out = 0;
 984  0025 725f0002      	clr	_dr_mode_out
 985                     ; 294 				dr_mode_out = 1;
 987  0029 35010002      	mov	_dr_mode_out,#1
 988  002d               L733:
 989                     ; 298 			if (dr_mode_out == 0) {
 991  002d c60002        	ld	a,_dr_mode_out
 992  0030 26e0          	jrne	L201
 993                     ; 299 				if (_disp_mode2 == RC_MODE_OUT) {
 995  0032 c60000        	ld	a,__disp_mode2
 996  0035 a102          	cp	a,#2
 997  0037 267b          	jrne	L201
 998                     ; 300 					if (buf[1] != RC_MODE_OUT) {
1000  0039 1e03          	ldw	x,(OFST+1,sp)
1001  003b e601          	ld	a,(1,x)
1002  003d a102          	cp	a,#2
1003  003f 2705          	jreq	L543
1004                     ; 301 						packet_changed = 1;
1006  0041 cd0170        	call	LC006
1007                     ; 303 						_disp_mode2 = FW_GET_DISPMODE;
1008  0044 206e          	jra	L201
1009  0046               L543:
1010                     ; 305 						if((buf[5] & 0x01) != 0)  {
1012  0046 e605          	ld	a,(5,x)
1013  0048 a501          	bcp	a,#1
1014  004a 2768          	jreq	L201
1015                     ; 306 							packet_changed = 1;
1017  004c cd0170        	call	LC006
1018                     ; 314 		return;
1020  004f 2063          	jra	L201
1021  0051               L333:
1022                     ; 317 	k = 0;
1024  0051 6b01          	ld	(OFST-1,sp),a
1025                     ; 319 	packet_buf[st] = 0;
1027  0053 5f            	clrw	x
1028  0054 7b02          	ld	a,(OFST+0,sp)
1029  0056 97            	ld	xl,a
1030  0057 724f0000      	clr	(_packet_buf,x)
1031                     ; 321 	if (_remote == 0) {
1033  005b 725d0000      	tnz	__remote
1034  005f 2703cc013f    	jrne	L353
1035                     ; 322 		if (rcSubDataInfo.mode_heat[st] == 0xFF) {
1037  0064 5f            	clrw	x
1038  0065 97            	ld	xl,a
1039  0066 d60025        	ld	a,(_rcSubDataInfo+16,x)
1040  0069 4c            	inc	a
1041  006a 264b          	jrne	L553
1042                     ; 323 			if (uiInfo.remote_mode[st] != buf[1]) {
1044  006c 7b02          	ld	a,(OFST+0,sp)
1045  006e 5f            	clrw	x
1046  006f 97            	ld	xl,a
1047  0070 d60045        	ld	a,(_uiInfo+69,x)
1048  0073 1e03          	ldw	x,(OFST+1,sp)
1049  0075 e101          	cp	a,(1,x)
1050                     ; 324 				k = 1;
1052  0077 2632          	jrne	LC003
1053                     ; 327 				switch (buf[1]) {
1055  0079 e601          	ld	a,(1,x)
1057                     ; 346 						break;
1058  007b 4a            	dec	a
1059  007c 270a          	jreq	L562
1060  007e a007          	sub	a,#7
1061  0080 2713          	jreq	L372
1062  0082 a008          	sub	a,#8
1063  0084 2718          	jreq	L572
1064  0086 2027          	jra	L163
1065  0088               L562:
1066                     ; 328 					case RC_MODE_HEAT:
1066                     ; 329 						if (uiInfo.tempSetup[st] != buf[3]) {
1068  0088 7b02          	ld	a,(OFST+0,sp)
1069  008a 5f            	clrw	x
1070  008b 97            	ld	xl,a
1071  008c d6003d        	ld	a,(_uiInfo+61,x)
1072  008f 1e03          	ldw	x,(OFST+1,sp)
1073  0091 e103          	cp	a,(3,x)
1074                     ; 330 							k = 1;
1075  0093 2014          	jp	LC004
1076                     ; 333 					case RC_MODE_OUT:
1076                     ; 334 						break;
1078                     ; 335 					case RC_MODE_STOP:
1078                     ; 336 						break;
1080  0095               L372:
1081                     ; 337 					case RC_MODE_RESERVE:
1081                     ; 338 						if (uiInfo.remote_time[st] != buf[5]) {
1083  0095 7b02          	ld	a,(OFST+0,sp)
1084  0097 5f            	clrw	x
1085  0098 97            	ld	xl,a
1086  0099 d6004d        	ld	a,(_uiInfo+77,x)
1087                     ; 339 							k = 1;
1088  009c 2007          	jp	LC005
1089  009e               L572:
1090                     ; 342 					case RC_MODE_REPEAT:
1090                     ; 343 						if (uiInfo.remote_banb[st] != buf[5]) {
1092  009e 7b02          	ld	a,(OFST+0,sp)
1093  00a0 5f            	clrw	x
1094  00a1 97            	ld	xl,a
1095  00a2 d60055        	ld	a,(_uiInfo+85,x)
1096  00a5               LC005:
1097  00a5 1e03          	ldw	x,(OFST+1,sp)
1098  00a7 e105          	cp	a,(5,x)
1099  00a9               LC004:
1100  00a9 2704          	jreq	L163
1101                     ; 344 							k = 1;
1103  00ab               LC003:
1107  00ab a601          	ld	a,#1
1108  00ad 6b01          	ld	(OFST-1,sp),a
1109  00af               L163:
1110                     ; 350 			if (k == 1) {
1112  00af 7b01          	ld	a,(OFST-1,sp)
1113  00b1 4a            	dec	a
1114  00b2 2603          	jrne	L553
1115                     ; 351 				return;
1116  00b4               L201:
1119  00b4 5b04          	addw	sp,#4
1120  00b6 81            	ret	
1121  00b7               L553:
1122                     ; 355 		rcSubDataInfo.mode_heat[st] = buf[1];
1124  00b7 7b02          	ld	a,(OFST+0,sp)
1125  00b9 5f            	clrw	x
1126  00ba 1603          	ldw	y,(OFST+1,sp)
1127  00bc 97            	ld	xl,a
1128  00bd 90e601        	ld	a,(1,y)
1129  00c0 d70025        	ld	(_rcSubDataInfo+16,x),a
1130                     ; 356 		rcSubDataInfo.cur_temp[st] = buf[2];
1132  00c3 5f            	clrw	x
1133  00c4 7b02          	ld	a,(OFST+0,sp)
1134  00c6 97            	ld	xl,a
1135  00c7 90e602        	ld	a,(2,y)
1136  00ca d70015        	ld	(_rcSubDataInfo,x),a
1137                     ; 358 		uiInfo.remote_mode[st] = buf[1];
1139  00cd 5f            	clrw	x
1140  00ce 7b02          	ld	a,(OFST+0,sp)
1141  00d0 97            	ld	xl,a
1142  00d1 90e601        	ld	a,(1,y)
1143  00d4 d70045        	ld	(_uiInfo+69,x),a
1144                     ; 359 		uiInfo.tempCurr[st] = buf[2];
1146  00d7 5f            	clrw	x
1147  00d8 7b02          	ld	a,(OFST+0,sp)
1148  00da 97            	ld	xl,a
1149  00db 90e602        	ld	a,(2,y)
1150  00de d70035        	ld	(_uiInfo+53,x),a
1151                     ; 361 		switch (buf[1]) {
1153  00e1 1e03          	ldw	x,(OFST+1,sp)
1154  00e3 e601          	ld	a,(1,x)
1156                     ; 377 				break;
1157  00e5 4a            	dec	a
1158  00e6 270a          	jreq	L772
1159  00e8 a007          	sub	a,#7
1160  00ea 271c          	jreq	L503
1161  00ec a008          	sub	a,#8
1162  00ee 272e          	jreq	L703
1163  00f0 2040          	jra	L104
1164  00f2               L772:
1165                     ; 362 			case RC_MODE_HEAT:
1165                     ; 363 				rcSubDataInfo.set_temp[st] = buf[3];
1167  00f2 7b02          	ld	a,(OFST+0,sp)
1168  00f4 5f            	clrw	x
1169  00f5 97            	ld	xl,a
1170  00f6 90e603        	ld	a,(3,y)
1171  00f9 d7001d        	ld	(_rcSubDataInfo+8,x),a
1172                     ; 364 				uiInfo.tempSetup[st] = buf[3];
1174  00fc 5f            	clrw	x
1175  00fd 7b02          	ld	a,(OFST+0,sp)
1176  00ff 97            	ld	xl,a
1177  0100 90e603        	ld	a,(3,y)
1178  0103 d7003d        	ld	(_uiInfo+61,x),a
1179                     ; 365 				break;
1181  0106 202a          	jra	L104
1182                     ; 366 			case RC_MODE_OUT:
1182                     ; 367 				break;
1184                     ; 368 			case RC_MODE_STOP:
1184                     ; 369 				break;
1186  0108               L503:
1187                     ; 370 			case RC_MODE_RESERVE:
1187                     ; 371 				rcSubDataInfo.time[st] = buf[5];
1189  0108 7b02          	ld	a,(OFST+0,sp)
1190  010a 5f            	clrw	x
1191  010b 97            	ld	xl,a
1192  010c 90e605        	ld	a,(5,y)
1193  010f d70035        	ld	(_rcSubDataInfo+32,x),a
1194                     ; 372 				uiInfo.remote_time[st] = buf[5];
1196  0112 5f            	clrw	x
1197  0113 7b02          	ld	a,(OFST+0,sp)
1198  0115 97            	ld	xl,a
1199  0116 90e605        	ld	a,(5,y)
1200  0119 d7004d        	ld	(_uiInfo+77,x),a
1201                     ; 373 				break;
1203  011c 2014          	jra	L104
1204  011e               L703:
1205                     ; 374 			case RC_MODE_REPEAT:
1205                     ; 375 				rcSubDataInfo.banb[st] = buf[5];
1207  011e 7b02          	ld	a,(OFST+0,sp)
1208  0120 5f            	clrw	x
1209  0121 97            	ld	xl,a
1210  0122 90e605        	ld	a,(5,y)
1211  0125 d7003d        	ld	(_rcSubDataInfo+40,x),a
1212                     ; 376 				uiInfo.remote_banb[st] = buf[5];
1214  0128 5f            	clrw	x
1215  0129 7b02          	ld	a,(OFST+0,sp)
1216  012b 97            	ld	xl,a
1217  012c 90e605        	ld	a,(5,y)
1218  012f d70055        	ld	(_uiInfo+85,x),a
1219                     ; 377 				break;
1221  0132               L104:
1222                     ; 380 		disp_char(uiInfo.remote_mode[st]);
1224  0132 7b02          	ld	a,(OFST+0,sp)
1225  0134 5f            	clrw	x
1226  0135 97            	ld	xl,a
1227  0136 d60045        	ld	a,(_uiInfo+69,x)
1228  0139 cd0000        	call	_disp_char
1231  013c cc00b4        	jra	L201
1232  013f               L353:
1233                     ; 384 		rcSubDataInfo.mode_heat[st] = 0xFF;
1235  013f 5f            	clrw	x
1236  0140 97            	ld	xl,a
1237  0141 a6ff          	ld	a,#255
1238  0143 d70025        	ld	(_rcSubDataInfo+16,x),a
1239                     ; 385 		rcSubDataInfo.cur_temp[st] = buf[2];
1241  0146 5f            	clrw	x
1242  0147 7b02          	ld	a,(OFST+0,sp)
1243  0149 1603          	ldw	y,(OFST+1,sp)
1244  014b 97            	ld	xl,a
1245  014c 90e602        	ld	a,(2,y)
1246  014f d70015        	ld	(_rcSubDataInfo,x),a
1247                     ; 386 		rcSubDataInfo.set_temp[st] = 0xFF;
1249  0152 5f            	clrw	x
1250  0153 7b02          	ld	a,(OFST+0,sp)
1251  0155 97            	ld	xl,a
1252  0156 a6ff          	ld	a,#255
1253  0158 d7001d        	ld	(_rcSubDataInfo+8,x),a
1254                     ; 387 		rcSubDataInfo.time[st] = 0xFF;
1256  015b 5f            	clrw	x
1257  015c 7b02          	ld	a,(OFST+0,sp)
1258  015e 97            	ld	xl,a
1259  015f a6ff          	ld	a,#255
1260  0161 d70035        	ld	(_rcSubDataInfo+32,x),a
1261                     ; 388 		rcSubDataInfo.banb[st] = 0xFF;
1263  0164 5f            	clrw	x
1264  0165 7b02          	ld	a,(OFST+0,sp)
1265  0167 97            	ld	xl,a
1266  0168 a6ff          	ld	a,#255
1267  016a d7003d        	ld	(_rcSubDataInfo+40,x),a
1268                     ; 390 }
1270  016d cc00b4        	jra	L201
1271  0170               LC006:
1272  0170 35010005      	mov	_packet_changed,#1
1273                     ; 307 							dr_mode_out = 1;
1275  0174 35010002      	mov	_dr_mode_out,#1
1276                     ; 308 							_disp_mode2 = FW_GET_DISPMODE;
1278  0178 a629          	ld	a,#41
1279  017a cd0000        	call	_file_read
1281  017d c70000        	ld	__disp_mode2,a
1282  0180 81            	ret	
1328                     ; 393 void rc_ptc_check_subrc(uint8_t *buf) {
1329                     .text:	section	.text,new
1330  0000               _rc_ptc_check_subrc:
1332  0000 89            	pushw	x
1333  0001 88            	push	a
1334       00000001      OFST:	set	1
1337                     ; 394 	uint8_t start = buf[0] & 0x0F;
1339  0002 f6            	ld	a,(x)
1340  0003 a40f          	and	a,#15
1341  0005 6b01          	ld	(OFST+0,sp),a
1342                     ; 396 	state_check = RC_STATE_NONE;
1344  0007 725f000b      	clr	_state_check
1345                     ; 398 	if (uiInfo.mode == SETTING_MODE_MASTER) {
1347  000b c60008        	ld	a,_uiInfo+8
1348  000e 4a            	dec	a
1349  000f 2707          	jreq	L601
1350                     ; 399 		return;
1352                     ; 402 	if (start != uiInfo.id) {
1354  0011 7b01          	ld	a,(OFST+0,sp)
1355  0013 c10004        	cp	a,_uiInfo+4
1356  0016 2703          	jreq	L534
1357                     ; 403 		return;
1358  0018               L601:
1361  0018 5b03          	addw	sp,#3
1362  001a 81            	ret	
1363  001b               L534:
1364                     ; 406 	packet_changed = 1;	
1366  001b 35010005      	mov	_packet_changed,#1
1367                     ; 407 	_disp_mode2 = buf[1];
1369  001f 1e02          	ldw	x,(OFST+1,sp)
1370  0021 e601          	ld	a,(1,x)
1371  0023 c70000        	ld	__disp_mode2,a
1372                     ; 409 	switch(_disp_mode2)
1375                     ; 413 	case RC_MODE_REPEAT:	uiInfo.repeat = buf[5];	break;
1376  0026 4a            	dec	a
1377  0027 270a          	jreq	L504
1378  0029 a007          	sub	a,#7
1379  002b 270d          	jreq	L704
1380  002d a008          	sub	a,#8
1381  002f 2710          	jreq	L114
1382  0031 20e5          	jra	L601
1383  0033               L504:
1384                     ; 411 	case RC_MODE_HEAT:		uiInfo.tSetup = buf[3];	break;
1386  0033 e603          	ld	a,(3,x)
1387  0035 c7000e        	ld	_uiInfo+14,a
1390  0038 20de          	jra	L601
1391  003a               L704:
1392                     ; 412 	case RC_MODE_RESERVE:	uiInfo.reserve = buf[5];	break;
1394  003a e605          	ld	a,(5,x)
1395  003c c7000d        	ld	_uiInfo+13,a
1398  003f 20d7          	jra	L601
1399  0041               L114:
1400                     ; 413 	case RC_MODE_REPEAT:	uiInfo.repeat = buf[5];	break;
1402  0041 e605          	ld	a,(5,x)
1403  0043 c7000c        	ld	_uiInfo+12,a
1406                     ; 415 }
1408  0046 20d0          	jra	L601
1471                     ; 417 void rc_ptc_check_mirror(uint8_t *buf) {
1472                     .text:	section	.text,new
1473  0000               _rc_ptc_check_mirror:
1475  0000 89            	pushw	x
1476       00000001      OFST:	set	1
1479                     ; 422 	state_check = RC_STATE_NONE;
1481  0001 725f000b      	clr	_state_check
1482  0005 88            	push	a
1483                     ; 424 	if (uiInfo.mode != SETTING_MODE_MASTER) {
1485  0006 c60008        	ld	a,_uiInfo+8
1486  0009 a101          	cp	a,#1
1487  000b 2703cc01b5    	jrne	L105
1488                     ; 425 		return;
1490                     ; 428 	page = buf[0] & 0x0F;
1492  0010 1e02          	ldw	x,(OFST+1,sp)
1493  0012 f6            	ld	a,(x)
1494  0013 a40f          	and	a,#15
1495  0015 6b01          	ld	(OFST+0,sp),a
1496                     ; 429 	cur_mirror_page = page;
1498  0017 c70006        	ld	_cur_mirror_page,a
1499                     ; 430 	state_check = RC_STATE_MIRROR;
1501  001a 3506000b      	mov	_state_check,#6
1502                     ; 432 	switch(page) {
1505                     ; 513 			break;
1506  001e 270f          	jreq	L344
1507  0020 4a            	dec	a
1508  0021 2603cc00a5    	jreq	L544
1509  0026 4a            	dec	a
1510  0027 2603cc0130    	jreq	L744
1511  002c cc01b5        	jra	L105
1512  002f               L344:
1513                     ; 433 		case 0:
1513                     ; 434 			mode = (buf[6] & 0x80) >> 7;
1515  002f e606          	ld	a,(6,x)
1516  0031 49            	rlc	a
1517  0032 4f            	clr	a
1518  0033 49            	rlc	a
1519  0034 6b01          	ld	(OFST+0,sp),a
1520                     ; 435 			if (mode == CNT_MODE_MAIN) {
1522  0036 2654          	jrne	L305
1523                     ; 436 				_boiler_type = (buf[1] & 0x80) >> 7;
1525  0038 cd01c4        	call	LC009
1526  003b c70000        	ld	__boiler_type,a
1527                     ; 437 				uiInfo.lpmType = (buf[1] & 0x0F);
1529  003e e601          	ld	a,(1,x)
1530  0040 a40f          	and	a,#15
1531  0042 c70013        	ld	_uiInfo+19,a
1532                     ; 438 				uiInfo.cnt = (buf[2] & 0x70) >> 4;
1534  0045 cd01b8        	call	LC007
1535  0048 c70005        	ld	_uiInfo+5,a
1536                     ; 439 				uiInfo.valve = buf[2] & 0x0F;
1538  004b e602          	ld	a,(2,x)
1539  004d a40f          	and	a,#15
1540  004f c7000a        	ld	_uiInfo+10,a
1541                     ; 440 				_boiler_water_shower = buf[3];
1543  0052 e603          	ld	a,(3,x)
1544  0054 c70000        	ld	__boiler_water_shower,a
1545                     ; 441 				uiInfo.houseCapa = buf[4];
1547  0057 e604          	ld	a,(4,x)
1548  0059 c70010        	ld	_uiInfo+16,a
1549                     ; 442 				_boiler_water_heat = buf[5] ;
1551  005c e605          	ld	a,(5,x)
1552  005e c70000        	ld	__boiler_water_heat,a
1553                     ; 443 				uiInfo.controlMode = mode;
1555  0061 7b01          	ld	a,(OFST+0,sp)
1556  0063 c70009        	ld	_uiInfo+9,a
1557                     ; 444 				uiInfo.subRCLock = (buf[6] & 0x40) >> 6 ;
1559  0066 e606          	ld	a,(6,x)
1560  0068 4e            	swap	a
1561  0069 a404          	and	a,#4
1562  006b 44            	srl	a
1563  006c 44            	srl	a
1564  006d c7005d        	ld	_uiInfo+93,a
1565                     ; 445 				uiInfo.poType = (buf[6] & 0x30) >> 4;
1567  0070 e606          	ld	a,(6,x)
1568  0072 4e            	swap	a
1569  0073 a403          	and	a,#3
1570  0075 c7000f        	ld	_uiInfo+15,a
1571                     ; 446 				uiInfo.cntlMode = (buf[6] & 0x08) >> 3;
1573  0078 e606          	ld	a,(6,x)
1574  007a a408          	and	a,#8
1575  007c 44            	srl	a
1576  007d 44            	srl	a
1577  007e 44            	srl	a
1578  007f c70003        	ld	_uiInfo+3,a
1579                     ; 447 				uiInfo.opMode = buf[6] & 0x07;
1581  0082 e606          	ld	a,(6,x)
1582  0084 a407          	and	a,#7
1583  0086 c70007        	ld	_uiInfo+7,a
1585  0089 cc01b5        	jra	L105
1586  008c               L305:
1587                     ; 449 				uiInfo.lpmType_sub = (buf[1] & 0x0F);
1589  008c e601          	ld	a,(1,x)
1590  008e a40f          	and	a,#15
1591  0090 c70014        	ld	_uiInfo+20,a
1592                     ; 450 				uiInfo.cnt_sub = (buf[2] & 0xF0) >> 4;
1594  0093 e602          	ld	a,(2,x)
1595  0095 4e            	swap	a
1596  0096 a40f          	and	a,#15
1597  0098 c70006        	ld	_uiInfo+6,a
1598                     ; 451 				uiInfo.valve_sub = buf[2] & 0x0F;
1600  009b e602          	ld	a,(2,x)
1601  009d a40f          	and	a,#15
1602  009f c7000b        	ld	_uiInfo+11,a
1603  00a2 cc01b5        	jra	L105
1604  00a5               L544:
1605                     ; 454 		case 1:
1605                     ; 455 			mode = (buf[1] & 0x80) >> 7;
1607  00a5 cd01c4        	call	LC009
1608  00a8 6b01          	ld	(OFST+0,sp),a
1609                     ; 456 			if (mode == CNT_MODE_MAIN) {
1611  00aa 2631          	jrne	L705
1612                     ; 457 				uiInfo.valve_rc[0] = (buf[1] & 0x70) >> 4;
1614  00ac cd01be        	call	LC008
1615  00af c7001d        	ld	_uiInfo+29,a
1616                     ; 458 				uiInfo.valve_rc[1] = buf[1] & 0x07;
1618  00b2 e601          	ld	a,(1,x)
1619  00b4 a407          	and	a,#7
1620  00b6 c7001e        	ld	_uiInfo+30,a
1621                     ; 459 				uiInfo.valve_rc[2] = (buf[2] & 0x70) >> 4;
1623  00b9 cd01b8        	call	LC007
1624  00bc c7001f        	ld	_uiInfo+31,a
1625                     ; 460 				uiInfo.valve_rc[3] = buf[2] & 0x07;
1627  00bf e602          	ld	a,(2,x)
1628  00c1 a407          	and	a,#7
1629  00c3 c70020        	ld	_uiInfo+32,a
1630                     ; 462 				uiInfo.valve_len[0] = buf[3];
1632  00c6 e603          	ld	a,(3,x)
1633  00c8 c70015        	ld	_uiInfo+21,a
1634                     ; 463 				uiInfo.valve_len[1] = buf[4];
1636  00cb e604          	ld	a,(4,x)
1637  00cd c70016        	ld	_uiInfo+22,a
1638                     ; 464 				uiInfo.valve_len[2] = buf[5];
1640  00d0 e605          	ld	a,(5,x)
1641  00d2 c70017        	ld	_uiInfo+23,a
1642                     ; 465 				uiInfo.valve_len[3] = buf[6];
1644  00d5 e606          	ld	a,(6,x)
1645  00d7 c70018        	ld	_uiInfo+24,a
1647  00da cc01b5        	jra	L105
1648  00dd               L705:
1649                     ; 467 				uiInfo.valve_sub_rc[0] = (buf[1] & 0x70) >> 4;
1651  00dd cd01be        	call	LC008
1652  00e0 c7002d        	ld	_uiInfo+45,a
1653                     ; 468 				uiInfo.valve_sub_rc[1] = buf[1] & 0x07;
1655  00e3 e601          	ld	a,(1,x)
1656  00e5 a407          	and	a,#7
1657  00e7 c7002e        	ld	_uiInfo+46,a
1658                     ; 469 				uiInfo.valve_sub_rc[2] = (buf[2] & 0x70) >> 4;
1660  00ea cd01b8        	call	LC007
1661  00ed c7002f        	ld	_uiInfo+47,a
1662                     ; 470 				uiInfo.valve_sub_rc[3] = buf[2] & 0x07;
1664  00f0 e602          	ld	a,(2,x)
1665  00f2 a407          	and	a,#7
1666  00f4 c70030        	ld	_uiInfo+48,a
1667                     ; 472 				uiInfo.valve_sub_len[0] = buf[3];
1669  00f7 e603          	ld	a,(3,x)
1670  00f9 c70025        	ld	_uiInfo+37,a
1671                     ; 473 				uiInfo.valve_sub_len[1] = buf[4];
1673  00fc e604          	ld	a,(4,x)
1674  00fe c70026        	ld	_uiInfo+38,a
1675                     ; 474 				uiInfo.valve_sub_len[2] = buf[5];
1677  0101 e605          	ld	a,(5,x)
1678  0103 c70027        	ld	_uiInfo+39,a
1679                     ; 475 				uiInfo.valve_sub_len[3] = buf[6];
1681  0106 e606          	ld	a,(6,x)
1682  0108 c70028        	ld	_uiInfo+40,a
1683                     ; 477 				for (i = 0 ; i < 4 ; i++) {
1685  010b 4f            	clr	a
1686  010c 6b01          	ld	(OFST+0,sp),a
1687  010e               L315:
1688                     ; 478 					if (uiInfo.valve_sub_rc[i] == 0 && uiInfo.valve_sub_len[i] != 0) {
1690  010e 5f            	clrw	x
1691  010f 97            	ld	xl,a
1692  0110 724d002d      	tnz	(_uiInfo+45,x)
1693  0114 260f          	jrne	L125
1695  0116 5f            	clrw	x
1696  0117 97            	ld	xl,a
1697  0118 724d0025      	tnz	(_uiInfo+37,x)
1698  011c 2707          	jreq	L125
1699                     ; 479 						uiInfo.valve_sub_rc[i] = 8;
1701  011e 5f            	clrw	x
1702  011f 97            	ld	xl,a
1703  0120 a608          	ld	a,#8
1704  0122 d7002d        	ld	(_uiInfo+45,x),a
1705  0125               L125:
1706                     ; 477 				for (i = 0 ; i < 4 ; i++) {
1708  0125 0c01          	inc	(OFST+0,sp)
1711  0127 7b01          	ld	a,(OFST+0,sp)
1712  0129 a104          	cp	a,#4
1713  012b 25e1          	jrult	L315
1714  012d cc01b5        	jra	L105
1715  0130               L744:
1716                     ; 484 		case 2:
1716                     ; 485 			mode = (buf[1] & 0x80) >> 7;
1718  0130 cd01c4        	call	LC009
1719  0133 6b01          	ld	(OFST+0,sp),a
1720                     ; 486 			if (mode == CNT_MODE_MAIN) {
1722  0135 262f          	jrne	L325
1723                     ; 487 				uiInfo.valve_rc[4] = (buf[1] & 0x70) >> 4;
1725  0137 cd01be        	call	LC008
1726  013a c70021        	ld	_uiInfo+33,a
1727                     ; 488 				uiInfo.valve_rc[5] = buf[1] & 0x07;
1729  013d e601          	ld	a,(1,x)
1730  013f a407          	and	a,#7
1731  0141 c70022        	ld	_uiInfo+34,a
1732                     ; 489 				uiInfo.valve_rc[6] = (buf[2] & 0x70) >> 4;
1734  0144 ad72          	call	LC007
1735  0146 c70023        	ld	_uiInfo+35,a
1736                     ; 490 				uiInfo.valve_rc[7] = buf[2] & 0x07;
1738  0149 e602          	ld	a,(2,x)
1739  014b a407          	and	a,#7
1740  014d c70024        	ld	_uiInfo+36,a
1741                     ; 492 				uiInfo.valve_len[4] = buf[3];
1743  0150 e603          	ld	a,(3,x)
1744  0152 c70019        	ld	_uiInfo+25,a
1745                     ; 493 				uiInfo.valve_len[5] = buf[4];
1747  0155 e604          	ld	a,(4,x)
1748  0157 c7001a        	ld	_uiInfo+26,a
1749                     ; 494 				uiInfo.valve_len[6] = buf[5];
1751  015a e605          	ld	a,(5,x)
1752  015c c7001b        	ld	_uiInfo+27,a
1753                     ; 495 				uiInfo.valve_len[7] = buf[6];
1755  015f e606          	ld	a,(6,x)
1756  0161 c7001c        	ld	_uiInfo+28,a
1758  0164 204f          	jra	L105
1759  0166               L325:
1760                     ; 497 				uiInfo.valve_sub_rc[4] = (buf[1] & 0x70) >> 4;
1762  0166 ad56          	call	LC008
1763  0168 c70031        	ld	_uiInfo+49,a
1764                     ; 498 				uiInfo.valve_sub_rc[5] = buf[1] & 0x07;
1766  016b e601          	ld	a,(1,x)
1767  016d a407          	and	a,#7
1768  016f c70032        	ld	_uiInfo+50,a
1769                     ; 499 				uiInfo.valve_sub_rc[6] = (buf[2] & 0x70) >> 4;
1771  0172 ad44          	call	LC007
1772  0174 c70033        	ld	_uiInfo+51,a
1773                     ; 500 				uiInfo.valve_sub_rc[7] = buf[2] & 0x07;
1775  0177 e602          	ld	a,(2,x)
1776  0179 a407          	and	a,#7
1777  017b c70034        	ld	_uiInfo+52,a
1778                     ; 502 				uiInfo.valve_sub_len[4] = buf[3];
1780  017e e603          	ld	a,(3,x)
1781  0180 c70029        	ld	_uiInfo+41,a
1782                     ; 503 				uiInfo.valve_sub_len[5] = buf[4];
1784  0183 e604          	ld	a,(4,x)
1785  0185 c7002a        	ld	_uiInfo+42,a
1786                     ; 504 				uiInfo.valve_sub_len[6] = buf[5];
1788  0188 e605          	ld	a,(5,x)
1789  018a c7002b        	ld	_uiInfo+43,a
1790                     ; 505 				uiInfo.valve_sub_len[7] = buf[6];
1792  018d e606          	ld	a,(6,x)
1793  018f c7002c        	ld	_uiInfo+44,a
1794                     ; 507 				for (i = 4 ; i < 8 ; i++) {
1796  0192 a604          	ld	a,#4
1797  0194 6b01          	ld	(OFST+0,sp),a
1798  0196               L725:
1799                     ; 508 					if (uiInfo.valve_sub_rc[i] == 0 && uiInfo.valve_sub_len[i] != 0) {
1801  0196 5f            	clrw	x
1802  0197 97            	ld	xl,a
1803  0198 724d002d      	tnz	(_uiInfo+45,x)
1804  019c 260f          	jrne	L535
1806  019e 5f            	clrw	x
1807  019f 97            	ld	xl,a
1808  01a0 724d0025      	tnz	(_uiInfo+37,x)
1809  01a4 2707          	jreq	L535
1810                     ; 509 						uiInfo.valve_sub_rc[i] = 8;
1812  01a6 5f            	clrw	x
1813  01a7 97            	ld	xl,a
1814  01a8 a608          	ld	a,#8
1815  01aa d7002d        	ld	(_uiInfo+45,x),a
1816  01ad               L535:
1817                     ; 507 				for (i = 4 ; i < 8 ; i++) {
1819  01ad 0c01          	inc	(OFST+0,sp)
1822  01af 7b01          	ld	a,(OFST+0,sp)
1823  01b1 a108          	cp	a,#8
1824  01b3 25e1          	jrult	L725
1825  01b5               L105:
1826                     ; 515 }
1829  01b5 5b03          	addw	sp,#3
1830  01b7 81            	ret	
1831  01b8               LC007:
1832  01b8 e602          	ld	a,(2,x)
1833  01ba 4e            	swap	a
1834  01bb a407          	and	a,#7
1835  01bd 81            	ret	
1836  01be               LC008:
1837  01be e601          	ld	a,(1,x)
1838  01c0 4e            	swap	a
1839  01c1 a407          	and	a,#7
1840  01c3 81            	ret	
1841  01c4               LC009:
1842  01c4 e601          	ld	a,(1,x)
1843  01c6 49            	rlc	a
1844  01c7 4f            	clr	a
1845  01c8 49            	rlc	a
1846  01c9 81            	ret	
1895                     ; 517 void rc_ptc_check(uint8_t *buf) {
1896                     .text:	section	.text,new
1897  0000               _rc_ptc_check:
1899  0000 89            	pushw	x
1900  0001 88            	push	a
1901       00000001      OFST:	set	1
1904                     ; 519 	start = buf[0] & 0xF0;
1906  0002 f6            	ld	a,(x)
1907  0003 a4f0          	and	a,#240
1908  0005 6b01          	ld	(OFST+0,sp),a
1909                     ; 521 	switch(start) {
1912                     ; 541 			break;
1913  0007 a020          	sub	a,#32
1914  0009 2738          	jreq	L745
1915  000b a010          	sub	a,#16
1916  000d 271f          	jreq	L145
1917  000f a030          	sub	a,#48
1918  0011 2729          	jreq	L545
1919  0013 a010          	sub	a,#16
1920  0015 2710          	jreq	L735
1921  0017 a080          	sub	a,#128
1922  0019 271a          	jreq	L345
1923                     ; 537 		default:
1923                     ; 538 			state_check = RC_STATE_ERROR;
1925  001b 3504000b      	mov	_state_check,#4
1926                     ; 539 			disp_char(buf[0]);
1928  001f 1e02          	ldw	x,(OFST+1,sp)
1929  0021 f6            	ld	a,(x)
1930  0022 cd0000        	call	_disp_char
1932                     ; 541 			break;
1934  0025 2021          	jra	L575
1935  0027               L735:
1936                     ; 522 		case BYTE_START_CNT_NORMAL:
1936                     ; 523 			rc_ptc_check_normal(buf);
1938  0027 1e02          	ldw	x,(OFST+1,sp)
1939  0029 cd0000        	call	_rc_ptc_check_normal
1941                     ; 524 			break;
1943  002c 201a          	jra	L575
1944  002e               L145:
1945                     ; 525 		case BYTE_START_CNT_SETTING:
1945                     ; 526 			rc_ptc_check_setting(buf);
1947  002e 1e02          	ldw	x,(OFST+1,sp)
1948  0030 cd0000        	call	_rc_ptc_check_setting
1950                     ; 527 			break;
1952  0033 2013          	jra	L575
1953  0035               L345:
1954                     ; 528 		case BYTE_START_RC_NORMAL:
1954                     ; 529 			rc_ptc_check_rc(buf);
1956  0035 1e02          	ldw	x,(OFST+1,sp)
1957  0037 cd0000        	call	_rc_ptc_check_rc
1959                     ; 530 			break;
1961  003a 200c          	jra	L575
1962  003c               L545:
1963                     ; 531 		case BYTE_START_RC_SUBRC:
1963                     ; 532 			rc_ptc_check_subrc(buf);
1965  003c 1e02          	ldw	x,(OFST+1,sp)
1966  003e cd0000        	call	_rc_ptc_check_subrc
1968                     ; 533 			break;
1970  0041 2005          	jra	L575
1971  0043               L745:
1972                     ; 534 		case BYTE_START_CNT_MIRROR:
1972                     ; 535 			rc_ptc_check_mirror(buf);
1974  0043 1e02          	ldw	x,(OFST+1,sp)
1975  0045 cd0000        	call	_rc_ptc_check_mirror
1977                     ; 536 			break;
1979  0048               L575:
1980                     ; 543 }
1983  0048 5b03          	addw	sp,#3
1984  004a 81            	ret	
2017                     ; 545 void setSettingChange(uint8_t ch) {
2018                     .text:	section	.text,new
2019  0000               _setSettingChange:
2023                     ; 546 	set_changed = ch;
2025  0000 c7000c        	ld	_set_changed,a
2026                     ; 547 }
2029  0003 81            	ret	
2053                     ; 549 uint8_t getSettingChange(void) {
2054                     .text:	section	.text,new
2055  0000               _getSettingChange:
2059                     ; 550 	return set_changed;
2061  0000 c6000c        	ld	a,_set_changed
2064  0003 81            	ret	
2088                     ; 553 uint8_t getState_check(void) {
2089                     .text:	section	.text,new
2090  0000               _getState_check:
2094                     ; 554 	return state_check;
2096  0000 c6000b        	ld	a,_state_check
2099  0003 81            	ret	
2132                     ; 557 void setState_check(uint8_t st) {
2133                     .text:	section	.text,new
2134  0000               _setState_check:
2138                     ; 558 	state_check = st;
2140  0000 c7000b        	ld	_state_check,a
2141                     ; 559 }
2144  0003 81            	ret	
2193                     ; 561 void makeChecksum(uint8_t *buf) {
2194                     .text:	section	.text,new
2195  0000               _makeChecksum:
2197  0000 89            	pushw	x
2198  0001 89            	pushw	x
2199       00000002      OFST:	set	2
2202                     ; 566 	s = 0;
2204  0002 0f01          	clr	(OFST-1,sp)
2205                     ; 567 	for (i = 0 ; i < 7 ; i++) {
2207  0004 0f02          	clr	(OFST+0,sp)
2208  0006               L176:
2209                     ; 568 		s += buf[i];
2211  0006 7b03          	ld	a,(OFST+1,sp)
2212  0008 97            	ld	xl,a
2213  0009 7b04          	ld	a,(OFST+2,sp)
2214  000b 1b02          	add	a,(OFST+0,sp)
2215  000d 2401          	jrnc	L441
2216  000f 5c            	incw	x
2217  0010               L441:
2218  0010 02            	rlwa	x,a
2219  0011 7b01          	ld	a,(OFST-1,sp)
2220  0013 fb            	add	a,(x)
2221  0014 6b01          	ld	(OFST-1,sp),a
2222                     ; 567 	for (i = 0 ; i < 7 ; i++) {
2224  0016 0c02          	inc	(OFST+0,sp)
2227  0018 7b02          	ld	a,(OFST+0,sp)
2228  001a a107          	cp	a,#7
2229  001c 25e8          	jrult	L176
2230                     ; 570 	buf[7] = s;
2232  001e 1e03          	ldw	x,(OFST+1,sp)
2233  0020 7b01          	ld	a,(OFST-1,sp)
2234  0022 e707          	ld	(7,x),a
2235                     ; 576 }
2238  0024 5b04          	addw	sp,#4
2239  0026 81            	ret	
2293                     ; 578 void rc_ptc_make_baseSetting(uint8_t *buf, uint8_t page, uint8_t mode) {
2294                     .text:	section	.text,new
2295  0000               _rc_ptc_make_baseSetting:
2297  0000 89            	pushw	x
2298  0001 5203          	subw	sp,#3
2299       00000003      OFST:	set	3
2302                     ; 579 	switch (page) {
2304  0003 7b08          	ld	a,(OFST+5,sp)
2306                     ; 670 		break;
2307  0005 270f          	jreq	L776
2308  0007 4a            	dec	a
2309  0008 2603cc00ad    	jreq	L107
2310  000d 4a            	dec	a
2311  000e 2603cc0153    	jreq	L307
2312  0013 cc01f1        	jra	L137
2313  0016               L776:
2314                     ; 580 		case 0:
2314                     ; 581 			if (mode == CNT_MODE_MAIN) {
2316  0016 7b09          	ld	a,(OFST+6,sp)
2317  0018 2625          	jrne	L337
2318                     ; 582 				buf[1] = (_boiler_type << 7)
2318                     ; 583 									| ((uiInfo.plc & 0x07) << 4)
2318                     ; 584 									| (uiInfo.lpmType);
2320  001a c60064        	ld	a,_uiInfo+100
2321  001d a407          	and	a,#7
2322  001f cd01fa        	call	LC013
2323  0022 6b03          	ld	(OFST+0,sp),a
2324  0024 c60000        	ld	a,__boiler_type
2325  0027 cd01f4        	call	LC012
2326  002a 1a03          	or	a,(OFST+0,sp)
2327  002c 1e04          	ldw	x,(OFST+1,sp)
2328  002e ca0013        	or	a,_uiInfo+19
2329  0031 e701          	ld	(1,x),a
2330                     ; 585 				buf[2] = ((uiInfo.relay & 0x01) << 7) 
2330                     ; 586 									| ((uiInfo.cnt & 0x07) << 4) 
2330                     ; 587 									| (uiInfo.valve & 0x0F);
2332  0033 c6000a        	ld	a,_uiInfo+10
2333  0036 a40f          	and	a,#15
2334  0038 6b03          	ld	(OFST+0,sp),a
2335  003a c60005        	ld	a,_uiInfo+5
2336                     ; 588 				buf[3] = _boiler_water_shower;
2337                     ; 589 				buf[4] = uiInfo.houseCapa;
2338                     ; 590 				buf[5] = _boiler_water_heat;
2339                     ; 591 				buf[6] = 	(mode << 7) 
2339                     ; 592 									| (uiInfo.subRCLock << 6) 
2339                     ; 593 									| ((uiInfo.poType & 0x01) << 4) 
2339                     ; 594 									| ((uiInfo.cntlMode & 0x01) << 3) 
2339                     ; 595 									| uiInfo.opMode;
2341  003d 2017          	jp	LC011
2342  003f               L337:
2343                     ; 597 				buf[1] = (_boiler_type << 7) 
2343                     ; 598 									| (uiInfo.lpmType_sub);
2345  003f c60000        	ld	a,__boiler_type
2346  0042 cd01f4        	call	LC012
2347  0045 1e04          	ldw	x,(OFST+1,sp)
2348  0047 ca0014        	or	a,_uiInfo+20
2349  004a e701          	ld	(1,x),a
2350                     ; 599 				buf[2] = ((uiInfo.relay & 0x01) << 7) 
2350                     ; 600 									| ((uiInfo.cnt_sub & 0x07) << 4) 
2350                     ; 601 									| (uiInfo.valve_sub & 0x0F);
2352  004c c6000b        	ld	a,_uiInfo+11
2353  004f a40f          	and	a,#15
2354  0051 6b03          	ld	(OFST+0,sp),a
2355  0053 c60006        	ld	a,_uiInfo+6
2356                     ; 602 				buf[3] = _boiler_water_shower;
2358                     ; 603 				buf[4] = uiInfo.houseCapa;
2360                     ; 604 				buf[5] = _boiler_water_heat;
2362                     ; 605 				buf[6] = 	(mode << 7) 
2362                     ; 606 									| (uiInfo.subRCLock << 6) 
2362                     ; 607 									| ((uiInfo.poType & 0x01) << 4) 
2362                     ; 608 									| ((uiInfo.cntlMode & 0x01) << 3) 
2362                     ; 609 									| uiInfo.opMode;
2364  0056               LC011:
2365  0056 a407          	and	a,#7
2366  0058 cd01fa        	call	LC013
2367  005b 6b02          	ld	(OFST-1,sp),a
2368  005d c6005e        	ld	a,_uiInfo+94
2369  0060 a401          	and	a,#1
2370  0062 cd01f4        	call	LC012
2371  0065 1a02          	or	a,(OFST-1,sp)
2372  0067 1e04          	ldw	x,(OFST+1,sp)
2373  0069 1a03          	or	a,(OFST+0,sp)
2374  006b e702          	ld	(2,x),a
2376  006d c60000        	ld	a,__boiler_water_shower
2377  0070 e703          	ld	(3,x),a
2379  0072 c60010        	ld	a,_uiInfo+16
2380  0075 e704          	ld	(4,x),a
2382  0077 c60000        	ld	a,__boiler_water_heat
2383  007a e705          	ld	(5,x),a
2385  007c c60003        	ld	a,_uiInfo+3
2386  007f a401          	and	a,#1
2387  0081 48            	sll	a
2388  0082 48            	sll	a
2389  0083 48            	sll	a
2390  0084 6b03          	ld	(OFST+0,sp),a
2391  0086 c6000f        	ld	a,_uiInfo+15
2392  0089 a401          	and	a,#1
2393  008b cd01fa        	call	LC013
2394  008e 6b02          	ld	(OFST-1,sp),a
2395  0090 c6005d        	ld	a,_uiInfo+93
2396  0093 97            	ld	xl,a
2397  0094 a640          	ld	a,#64
2398  0096 42            	mul	x,a
2399  0097 9f            	ld	a,xl
2400  0098 6b01          	ld	(OFST-2,sp),a
2401  009a 7b09          	ld	a,(OFST+6,sp)
2402  009c cd01f4        	call	LC012
2403  009f 1a01          	or	a,(OFST-2,sp)
2404  00a1 1a02          	or	a,(OFST-1,sp)
2405  00a3 1a03          	or	a,(OFST+0,sp)
2406  00a5 ca0007        	or	a,_uiInfo+7
2407  00a8 1e04          	ldw	x,(OFST+1,sp)
2408  00aa cc01ef        	jp	LC010
2409  00ad               L107:
2410                     ; 612 		case 1:
2410                     ; 613 			if (mode == CNT_MODE_MAIN) {
2412  00ad 7b09          	ld	a,(OFST+6,sp)
2413  00af 2651          	jrne	L737
2414                     ; 614 				buf[1] = mode << 7 
2414                     ; 615 							 | (uiInfo.valve_rc[0] << 4)
2414                     ; 616 							 | mode << 3 
2414                     ; 617 							 | uiInfo.valve_rc[1];
2416  00b1 48            	sll	a
2417  00b2 48            	sll	a
2418  00b3 48            	sll	a
2419  00b4 6b03          	ld	(OFST+0,sp),a
2420  00b6 c6001d        	ld	a,_uiInfo+29
2421  00b9 cd01fa        	call	LC013
2422  00bc 6b02          	ld	(OFST-1,sp),a
2423  00be 7b09          	ld	a,(OFST+6,sp)
2424  00c0 cd01f4        	call	LC012
2425  00c3 1a02          	or	a,(OFST-1,sp)
2426  00c5 1a03          	or	a,(OFST+0,sp)
2427  00c7 1e04          	ldw	x,(OFST+1,sp)
2428  00c9 ca001e        	or	a,_uiInfo+30
2429  00cc e701          	ld	(1,x),a
2430                     ; 618 				buf[2] = mode << 7 
2430                     ; 619 							 | (uiInfo.valve_rc[2] << 4)
2430                     ; 620 							 | mode << 3 
2430                     ; 621 							 | uiInfo.valve_rc[3];
2432  00ce 7b09          	ld	a,(OFST+6,sp)
2433  00d0 48            	sll	a
2434  00d1 48            	sll	a
2435  00d2 48            	sll	a
2436  00d3 6b03          	ld	(OFST+0,sp),a
2437  00d5 c6001f        	ld	a,_uiInfo+31
2438  00d8 cd01fa        	call	LC013
2439  00db 6b02          	ld	(OFST-1,sp),a
2440  00dd 7b09          	ld	a,(OFST+6,sp)
2441  00df cd01f4        	call	LC012
2442  00e2 1a02          	or	a,(OFST-1,sp)
2443  00e4 1a03          	or	a,(OFST+0,sp)
2444  00e6 1e04          	ldw	x,(OFST+1,sp)
2445  00e8 ca0020        	or	a,_uiInfo+32
2446  00eb e702          	ld	(2,x),a
2447                     ; 622 				buf[3] = uiInfo.valve_len[0];
2449  00ed c60015        	ld	a,_uiInfo+21
2450  00f0 e703          	ld	(3,x),a
2451                     ; 623 				buf[4] = uiInfo.valve_len[1];
2453  00f2 c60016        	ld	a,_uiInfo+22
2454  00f5 e704          	ld	(4,x),a
2455                     ; 624 				buf[5] = uiInfo.valve_len[2];
2457  00f7 c60017        	ld	a,_uiInfo+23
2458  00fa e705          	ld	(5,x),a
2459                     ; 625 				buf[6] = uiInfo.valve_len[3];
2461  00fc c60018        	ld	a,_uiInfo+24
2463  00ff cc01ef        	jp	LC010
2464  0102               L737:
2465                     ; 627 				buf[1] = mode << 7 
2465                     ; 628 							 | (uiInfo.valve_sub_rc[0] << 4)
2465                     ; 629 							 | mode << 3 
2465                     ; 630 							 | uiInfo.valve_sub_rc[1];
2467  0102 48            	sll	a
2468  0103 48            	sll	a
2469  0104 48            	sll	a
2470  0105 6b03          	ld	(OFST+0,sp),a
2471  0107 c6002d        	ld	a,_uiInfo+45
2472  010a cd01fa        	call	LC013
2473  010d 6b02          	ld	(OFST-1,sp),a
2474  010f 7b09          	ld	a,(OFST+6,sp)
2475  0111 cd01f4        	call	LC012
2476  0114 1a02          	or	a,(OFST-1,sp)
2477  0116 1a03          	or	a,(OFST+0,sp)
2478  0118 1e04          	ldw	x,(OFST+1,sp)
2479  011a ca002e        	or	a,_uiInfo+46
2480  011d e701          	ld	(1,x),a
2481                     ; 631 				buf[2] = mode << 7 
2481                     ; 632 							 | (uiInfo.valve_sub_rc[2] << 4)
2481                     ; 633 							 | mode << 3 
2481                     ; 634 							 | uiInfo.valve_sub_rc[3];
2483  011f 7b09          	ld	a,(OFST+6,sp)
2484  0121 48            	sll	a
2485  0122 48            	sll	a
2486  0123 48            	sll	a
2487  0124 6b03          	ld	(OFST+0,sp),a
2488  0126 c6002f        	ld	a,_uiInfo+47
2489  0129 cd01fa        	call	LC013
2490  012c 6b02          	ld	(OFST-1,sp),a
2491  012e 7b09          	ld	a,(OFST+6,sp)
2492  0130 cd01f4        	call	LC012
2493  0133 1a02          	or	a,(OFST-1,sp)
2494  0135 1a03          	or	a,(OFST+0,sp)
2495  0137 1e04          	ldw	x,(OFST+1,sp)
2496  0139 ca0030        	or	a,_uiInfo+48
2497  013c e702          	ld	(2,x),a
2498                     ; 635 				buf[3] = uiInfo.valve_sub_len[0];
2500  013e c60025        	ld	a,_uiInfo+37
2501  0141 e703          	ld	(3,x),a
2502                     ; 636 				buf[4] = uiInfo.valve_sub_len[1];
2504  0143 c60026        	ld	a,_uiInfo+38
2505  0146 e704          	ld	(4,x),a
2506                     ; 637 				buf[5] = uiInfo.valve_sub_len[2];
2508  0148 c60027        	ld	a,_uiInfo+39
2509  014b e705          	ld	(5,x),a
2510                     ; 638 				buf[6] = uiInfo.valve_sub_len[3];
2512  014d c60028        	ld	a,_uiInfo+40
2513  0150 cc01ef        	jp	LC010
2514  0153               L307:
2515                     ; 641 		case 2:
2515                     ; 642 			if (mode == CNT_MODE_MAIN) {
2517  0153 7b09          	ld	a,(OFST+6,sp)
2518  0155 264e          	jrne	L347
2519                     ; 643 				buf[1] = mode << 7 
2519                     ; 644 							 | (uiInfo.valve_rc[4] << 4) 
2519                     ; 645 							 | mode << 3 
2519                     ; 646 							 | uiInfo.valve_rc[5];
2521  0157 48            	sll	a
2522  0158 48            	sll	a
2523  0159 48            	sll	a
2524  015a 6b03          	ld	(OFST+0,sp),a
2525  015c c60021        	ld	a,_uiInfo+33
2526  015f cd01fa        	call	LC013
2527  0162 6b02          	ld	(OFST-1,sp),a
2528  0164 7b09          	ld	a,(OFST+6,sp)
2529  0166 cd01f4        	call	LC012
2530  0169 1a02          	or	a,(OFST-1,sp)
2531  016b 1a03          	or	a,(OFST+0,sp)
2532  016d 1e04          	ldw	x,(OFST+1,sp)
2533  016f ca0022        	or	a,_uiInfo+34
2534  0172 e701          	ld	(1,x),a
2535                     ; 647 				buf[2] = mode << 7 
2535                     ; 648 							 | (uiInfo.valve_rc[6] << 4) 
2535                     ; 649 							 | mode << 3 
2535                     ; 650 							 | uiInfo.valve_rc[7];
2537  0174 7b09          	ld	a,(OFST+6,sp)
2538  0176 48            	sll	a
2539  0177 48            	sll	a
2540  0178 48            	sll	a
2541  0179 6b03          	ld	(OFST+0,sp),a
2542  017b c60023        	ld	a,_uiInfo+35
2543  017e ad7a          	call	LC013
2544  0180 6b02          	ld	(OFST-1,sp),a
2545  0182 7b09          	ld	a,(OFST+6,sp)
2546  0184 ad6e          	call	LC012
2547  0186 1a02          	or	a,(OFST-1,sp)
2548  0188 1a03          	or	a,(OFST+0,sp)
2549  018a 1e04          	ldw	x,(OFST+1,sp)
2550  018c ca0024        	or	a,_uiInfo+36
2551  018f e702          	ld	(2,x),a
2552                     ; 651 				buf[3] = uiInfo.valve_len[4];
2554  0191 c60019        	ld	a,_uiInfo+25
2555  0194 e703          	ld	(3,x),a
2556                     ; 652 				buf[4] = uiInfo.valve_len[5];
2558  0196 c6001a        	ld	a,_uiInfo+26
2559  0199 e704          	ld	(4,x),a
2560                     ; 653 				buf[5] = uiInfo.valve_len[6];
2562  019b c6001b        	ld	a,_uiInfo+27
2563  019e e705          	ld	(5,x),a
2564                     ; 654 				buf[6] = uiInfo.valve_len[7];
2566  01a0 c6001c        	ld	a,_uiInfo+28
2568  01a3 204a          	jp	LC010
2569  01a5               L347:
2570                     ; 656 				buf[1] = mode << 7 
2570                     ; 657 							 | (uiInfo.valve_sub_rc[4] << 4) 
2570                     ; 658 							 | mode << 3 
2570                     ; 659 							 | uiInfo.valve_sub_rc[5];
2572  01a5 48            	sll	a
2573  01a6 48            	sll	a
2574  01a7 48            	sll	a
2575  01a8 6b03          	ld	(OFST+0,sp),a
2576  01aa c60031        	ld	a,_uiInfo+49
2577  01ad ad4b          	call	LC013
2578  01af 6b02          	ld	(OFST-1,sp),a
2579  01b1 7b09          	ld	a,(OFST+6,sp)
2580  01b3 ad3f          	call	LC012
2581  01b5 1a02          	or	a,(OFST-1,sp)
2582  01b7 1a03          	or	a,(OFST+0,sp)
2583  01b9 1e04          	ldw	x,(OFST+1,sp)
2584  01bb ca0032        	or	a,_uiInfo+50
2585  01be e701          	ld	(1,x),a
2586                     ; 660 				buf[2] = mode << 7 
2586                     ; 661 							 | (uiInfo.valve_sub_rc[6] << 4) 
2586                     ; 662 							 | mode << 3 
2586                     ; 663 							 | uiInfo.valve_sub_rc[7];
2588  01c0 7b09          	ld	a,(OFST+6,sp)
2589  01c2 48            	sll	a
2590  01c3 48            	sll	a
2591  01c4 48            	sll	a
2592  01c5 6b03          	ld	(OFST+0,sp),a
2593  01c7 c60033        	ld	a,_uiInfo+51
2594  01ca ad2e          	call	LC013
2595  01cc 6b02          	ld	(OFST-1,sp),a
2596  01ce 7b09          	ld	a,(OFST+6,sp)
2597  01d0 ad22          	call	LC012
2598  01d2 1a02          	or	a,(OFST-1,sp)
2599  01d4 1a03          	or	a,(OFST+0,sp)
2600  01d6 1e04          	ldw	x,(OFST+1,sp)
2601  01d8 ca0034        	or	a,_uiInfo+52
2602  01db e702          	ld	(2,x),a
2603                     ; 664 				buf[3] = uiInfo.valve_sub_len[4];
2605  01dd c60029        	ld	a,_uiInfo+41
2606  01e0 e703          	ld	(3,x),a
2607                     ; 665 				buf[4] = uiInfo.valve_sub_len[5];
2609  01e2 c6002a        	ld	a,_uiInfo+42
2610  01e5 e704          	ld	(4,x),a
2611                     ; 666 				buf[5] = uiInfo.valve_sub_len[6];
2613  01e7 c6002b        	ld	a,_uiInfo+43
2614  01ea e705          	ld	(5,x),a
2615                     ; 667 				buf[6] = uiInfo.valve_sub_len[7];
2617  01ec c6002c        	ld	a,_uiInfo+44
2618  01ef               LC010:
2619  01ef e706          	ld	(6,x),a
2620  01f1               L137:
2621                     ; 672 }
2624  01f1 5b05          	addw	sp,#5
2625  01f3 81            	ret	
2626  01f4               LC012:
2627  01f4 97            	ld	xl,a
2628  01f5 a680          	ld	a,#128
2629  01f7 42            	mul	x,a
2630  01f8 9f            	ld	a,xl
2631  01f9 81            	ret	
2632  01fa               LC013:
2633  01fa 97            	ld	xl,a
2634  01fb a610          	ld	a,#16
2635  01fd 42            	mul	x,a
2636  01fe 9f            	ld	a,xl
2637  01ff 81            	ret	
2684                     ; 675 void rc_ptc_make_setting(uint8_t *buf) {
2685                     .text:	section	.text,new
2686  0000               _rc_ptc_make_setting:
2688  0000 89            	pushw	x
2689  0001 88            	push	a
2690       00000001      OFST:	set	1
2693                     ; 677 	uint8_t mode = uiInfo.controlMode;
2695  0002 c60009        	ld	a,_uiInfo+9
2696  0005 6b01          	ld	(OFST+0,sp),a
2697                     ; 679 	buf[0] = BYTE_START_RC_SETTING | cur_set_page;
2699  0007 c60007        	ld	a,_cur_set_page
2700  000a 1e02          	ldw	x,(OFST+1,sp)
2701  000c aa50          	or	a,#80
2702  000e f7            	ld	(x),a
2703                     ; 681 	rc_ptc_make_baseSetting(buf, cur_set_page, mode);
2705  000f 7b01          	ld	a,(OFST+0,sp)
2706  0011 88            	push	a
2707  0012 3b0007        	push	_cur_set_page
2708  0015 1e04          	ldw	x,(OFST+3,sp)
2709  0017 cd0000        	call	_rc_ptc_make_baseSetting
2711  001a 85            	popw	x
2712                     ; 683 	makeChecksum(buf);
2714  001b 1e02          	ldw	x,(OFST+1,sp)
2715  001d cd0000        	call	_makeChecksum
2717                     ; 684 }
2720  0020 5b03          	addw	sp,#3
2721  0022 81            	ret	
2724                     	switch	.data
2725  0005               _dr_out_count:
2726  0005 01            	dc.b	1
2774                     ; 690 void rc_ptc_make_normal(uint8_t *buf) {
2775                     .text:	section	.text,new
2776  0000               _rc_ptc_make_normal:
2778  0000 89            	pushw	x
2779       00000000      OFST:	set	0
2782                     ; 692 	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
2784  0001 c60004        	ld	a,_uiInfo+4
2785  0004 1e01          	ldw	x,(OFST+1,sp)
2786  0006 aaf0          	or	a,#240
2787  0008 f7            	ld	(x),a
2788                     ; 693 	buf[1] = _disp_mode2;
2790  0009 c60000        	ld	a,__disp_mode2
2791  000c e701          	ld	(1,x),a
2792                     ; 694 	buf[2] = uiInfo.tCurr;
2794  000e c60002        	ld	a,_uiInfo+2
2795  0011 e702          	ld	(2,x),a
2796                     ; 695 	buf[3] = 0x00;
2798  0013 6f03          	clr	(3,x)
2799                     ; 696 	buf[4] = 0x00;
2801  0015 6f04          	clr	(4,x)
2802                     ; 697 	buf[5] = 0x00;
2804  0017 6f05          	clr	(5,x)
2805                     ; 698 	buf[6] = 0x00;
2807  0019 6f06          	clr	(6,x)
2808                     ; 700 	if (uiInfo.mode == SETTING_MODE_MASTER) {
2810  001b c60008        	ld	a,_uiInfo+8
2811  001e 4a            	dec	a
2812  001f 2619          	jrne	L1201
2813                     ; 701 		buf[4] = _boiler_water_heat;
2815  0021 c60000        	ld	a,__boiler_water_heat
2816  0024 e704          	ld	(4,x),a
2817                     ; 702 		buf[6] = __boiler_shower[5] == 1 ? 1 : 0; // 온수모드   
2819  0026 c60005        	ld	a,___boiler_shower+5
2820  0029 4a            	dec	a
2821  002a 2603          	jrne	L061
2822  002c 4c            	inc	a
2823  002d 2001          	jra	L261
2824  002f               L061:
2825  002f 4f            	clr	a
2826  0030               L261:
2827  0030 e706          	ld	(6,x),a
2828                     ; 703 		buf[6] |= (_boiler_water_shower << 1);					// 온수
2830  0032 c60000        	ld	a,__boiler_water_shower
2831  0035 48            	sll	a
2832  0036 ea06          	or	a,(6,x)
2833  0038 e706          	ld	(6,x),a
2834  003a               L1201:
2835                     ; 706 	switch(buf[1]) {
2837  003a e601          	ld	a,(1,x)
2839                     ; 743 		default:
2839                     ; 744 			break;
2840  003c 4a            	dec	a
2841  003d 270d          	jreq	L767
2842  003f 4a            	dec	a
2843  0040 2711          	jreq	L177
2844  0042 a006          	sub	a,#6
2845  0044 2740          	jreq	L777
2846  0046 a008          	sub	a,#8
2847  0048 272e          	jreq	L577
2848  004a 203f          	jra	L5201
2849  004c               L767:
2850                     ; 707 		case RC_MODE_HEAT:
2850                     ; 708 			buf[3] = uiInfo.tSetup;
2852  004c c6000e        	ld	a,_uiInfo+14
2853  004f e703          	ld	(3,x),a
2854                     ; 709 			break;
2856  0051 2038          	jra	L5201
2857  0053               L177:
2858                     ; 710 		case RC_MODE_OUT:
2858                     ; 711 			buf[5] = dr_mode_out;
2860  0053 c60002        	ld	a,_dr_mode_out
2861  0056 e705          	ld	(5,x),a
2862                     ; 714 			buf[3] = 0x1E;					// 외출 온도 15도
2864  0058 a61e          	ld	a,#30
2865  005a e703          	ld	(3,x),a
2866                     ; 716 			if (dr_mode_out == 0) {
2868  005c c60002        	ld	a,_dr_mode_out
2869  005f 2611          	jrne	L7201
2870                     ; 717 				if (dr_out_count != 0) {
2872  0061 c60005        	ld	a,_dr_out_count
2873  0064 2706          	jreq	L1301
2874                     ; 718 					dr_out_count--;
2876  0066 725a0005      	dec	_dr_out_count
2878  006a 201f          	jra	L5201
2879  006c               L1301:
2880                     ; 720 					dr_mode_out = 1;
2882  006c 35010002      	mov	_dr_mode_out,#1
2883  0070 2019          	jra	L5201
2884  0072               L7201:
2885                     ; 723 				dr_out_count = DR_ALL_OUT_COUNT;
2887  0072 35010005      	mov	_dr_out_count,#1
2888  0076 2013          	jra	L5201
2889                     ; 730 		case RC_MODE_STOP:
2889                     ; 731 			break;
2891  0078               L577:
2892                     ; 732 		case RC_MODE_REPEAT:
2892                     ; 733 			if(_timFlag == 0) {
2894  0078 c60000        	ld	a,__timFlag
2895  007b 2604          	jrne	L7301
2896                     ; 734 				buf[3] = MAX_REPEAT_TEMP;
2898  007d a650          	ld	a,#80
2899  007f e703          	ld	(3,x),a
2900  0081               L7301:
2901                     ; 737 			buf[5] = uiInfo.repeat;
2903  0081 c6000c        	ld	a,_uiInfo+12
2904                     ; 739 			break;
2906  0084 2003          	jp	LC014
2907  0086               L777:
2908                     ; 740 		case RC_MODE_RESERVE:
2908                     ; 741 			buf[5] = uiInfo.reserve;
2910  0086 c6000d        	ld	a,_uiInfo+13
2911  0089               LC014:
2912  0089 e705          	ld	(5,x),a
2913                     ; 742 			break;
2915                     ; 743 		default:
2915                     ; 744 			break;
2917  008b               L5201:
2918                     ; 747 	makeChecksum(buf);
2920  008b 1e01          	ldw	x,(OFST+1,sp)
2921  008d cd0000        	call	_makeChecksum
2923                     ; 749 	if (disp_mode_preview != _disp_mode2){
2925  0090 c60002        	ld	a,_disp_mode_preview
2926  0093 c10000        	cp	a,__disp_mode2
2927  0096 2712          	jreq	L1401
2928                     ; 750 		if (uiInfo.mode == SETTING_MODE_SUB) {
2930                     ; 752 				UPDATE_BIT(BIT_DISPMODE);
2933                     ; 753 				disp_mode_preview = _disp_mode2;
2936                     ; 756 			UPDATE_BIT(BIT_DISPMODE);
2942                     ; 757 			disp_mode_preview = _disp_mode2;
2946  0098 72160000      	bset	__updateBit,#3
2948  009c 5500000000    	mov	__updateTimer,___timer1s
2950  00a1 35050000      	mov	__updateCount,#5
2952  00a5 5500000002    	mov	_disp_mode_preview,__disp_mode2
2953  00aa               L1401:
2954                     ; 761 	only_one++;
2956  00aa 725c0003      	inc	_only_one
2957                     ; 762 }
2960  00ae 85            	popw	x
2961  00af 81            	ret	
3013                     ; 765 uint8_t rc_ptc_check_subRC(void) {
3014                     .text:	section	.text,new
3015  0000               _rc_ptc_check_subRC:
3017  0000 89            	pushw	x
3018       00000002      OFST:	set	2
3021                     ; 770 	if (_remote == 1) {
3023  0001 c60000        	ld	a,__remote
3024  0004 4a            	dec	a
3025  0005 2603          	jrne	L7701
3026                     ; 771 		return 0xFF;
3028  0007 4a            	dec	a
3031  0008 85            	popw	x
3032  0009 81            	ret	
3033  000a               L7701:
3034                     ; 774 	ch = 0;
3036  000a 0f01          	clr	(OFST-1,sp)
3037                     ; 775 	if (rcSubDataInfo.mode_heat[uiInfo.id - 1] != 0xFF) {
3039  000c cd0151        	call	LC017
3040  000f d60025        	ld	a,(_rcSubDataInfo+16,x)
3041  0012 4c            	inc	a
3042  0013 2704          	jreq	L1011
3043                     ; 776 		ch = 1;
3045  0015 a601          	ld	a,#1
3046  0017 6b01          	ld	(OFST-1,sp),a
3047  0019               L1011:
3048                     ; 779 	rcSubDataInfo.mode_heat[uiInfo.id - 1] = _disp_mode2;
3050  0019 c60004        	ld	a,_uiInfo+4
3051  001c 5f            	clrw	x
3052  001d 97            	ld	xl,a
3053  001e 5a            	decw	x
3054  001f c60000        	ld	a,__disp_mode2
3055  0022 d70025        	ld	(_rcSubDataInfo+16,x),a
3056                     ; 780 	rcSubDataInfo.cur_temp[uiInfo.id - 1] = uiInfo.tCurr;
3058  0025 cd0151        	call	LC017
3059  0028 c60002        	ld	a,_uiInfo+2
3060  002b d70015        	ld	(_rcSubDataInfo,x),a
3061                     ; 781 	rcSubDataInfo.set_temp[uiInfo.id - 1] = uiInfo.tSetup;
3063  002e cd0151        	call	LC017
3064  0031 c6000e        	ld	a,_uiInfo+14
3065  0034 d7001d        	ld	(_rcSubDataInfo+8,x),a
3066                     ; 782 	rcSubDataInfo.time[uiInfo.id - 1] = uiInfo.reserve;
3068  0037 cd0151        	call	LC017
3069  003a c6000d        	ld	a,_uiInfo+13
3070  003d d70035        	ld	(_rcSubDataInfo+32,x),a
3071                     ; 783 	rcSubDataInfo.banb[uiInfo.id - 1] = uiInfo.repeat;
3073  0040 cd0151        	call	LC017
3074  0043 c6000c        	ld	a,_uiInfo+12
3075  0046 d7003d        	ld	(_rcSubDataInfo+40,x),a
3076                     ; 785 	uiInfo.remote_mode[uiInfo.id - 1] = _disp_mode2;
3078  0049 cd0151        	call	LC017
3079  004c c60000        	ld	a,__disp_mode2
3080  004f d70045        	ld	(_uiInfo+69,x),a
3081                     ; 786 	uiInfo.tempCurr[uiInfo.id - 1] = uiInfo.tCurr;
3083  0052 cd0151        	call	LC017
3084  0055 c60002        	ld	a,_uiInfo+2
3085  0058 d70035        	ld	(_uiInfo+53,x),a
3086                     ; 787 	uiInfo.tempSetup[uiInfo.id - 1] = uiInfo.tSetup;
3088  005b cd0151        	call	LC017
3089  005e c6000e        	ld	a,_uiInfo+14
3090  0061 d7003d        	ld	(_uiInfo+61,x),a
3091                     ; 788 	uiInfo.remote_time[uiInfo.id - 1] = uiInfo.reserve;
3093  0064 cd0151        	call	LC017
3094  0067 c6000d        	ld	a,_uiInfo+13
3095  006a d7004d        	ld	(_uiInfo+77,x),a
3096                     ; 789 	uiInfo.remote_banb[uiInfo.id - 1] = uiInfo.repeat;
3098  006d cd0151        	call	LC017
3099  0070 c6000c        	ld	a,_uiInfo+12
3100  0073 d70055        	ld	(_uiInfo+85,x),a
3101                     ; 791 	if (ch == 0) {
3103  0076 7b01          	ld	a,(OFST-1,sp)
3104  0078 2603          	jrne	L3011
3105                     ; 793 		return 0xFF;
3107  007a 4a            	dec	a
3110  007b 85            	popw	x
3111  007c 81            	ret	
3112  007d               L3011:
3113                     ; 796 	num = 0xFF;
3115  007d a6ff          	ld	a,#255
3116  007f 6b01          	ld	(OFST-1,sp),a
3117                     ; 797 	for (i = 0 ; i < 8 ; i++) {
3119  0081 4f            	clr	a
3120  0082 6b02          	ld	(OFST+0,sp),a
3121  0084               L5011:
3122                     ; 798 		if (rcSubDataInfo.set_temp[i] == 0xAA) {
3124  0084 5f            	clrw	x
3125  0085 97            	ld	xl,a
3126  0086 d6001d        	ld	a,(_rcSubDataInfo+8,x)
3127  0089 a1aa          	cp	a,#170
3128  008b 2756          	jreq	L7011
3129                     ; 799 			continue;
3131                     ; 802 		if (uiInfo.remote_mode[i] != rcSubDataInfo.mode_heat[i]) {
3133  008d 7b02          	ld	a,(OFST+0,sp)
3134  008f cd0158        	call	LC018
3135  0092 90d60045      	ld	a,(_uiInfo+69,y)
3136  0096 d10025        	cp	a,(_rcSubDataInfo+16,x)
3137  0099 2706          	jreq	L5111
3138                     ; 803 			num = i;
3140  009b 7b02          	ld	a,(OFST+0,sp)
3141  009d 6b01          	ld	(OFST-1,sp),a
3142                     ; 804 			break;
3144  009f 204c          	jra	L1111
3145  00a1               L5111:
3146                     ; 807 		switch (rcSubDataInfo.mode_heat[i]) {
3148  00a1 7b02          	ld	a,(OFST+0,sp)
3149  00a3 5f            	clrw	x
3150  00a4 97            	ld	xl,a
3151  00a5 d60025        	ld	a,(_rcSubDataInfo+16,x)
3153                     ; 825 				break;
3154  00a8 4a            	dec	a
3155  00a9 270a          	jreq	L7401
3156  00ab a007          	sub	a,#7
3157  00ad 2722          	jreq	L5501
3158  00af a008          	sub	a,#8
3159  00b1 2710          	jreq	L3501
3160  00b3 202e          	jra	L7011
3161  00b5               L7401:
3162                     ; 808 			case RC_MODE_HEAT:
3162                     ; 809 				if (uiInfo.tempSetup[i] != rcSubDataInfo.set_temp[i]) {
3164  00b5 7b02          	ld	a,(OFST+0,sp)
3165  00b7 cd0158        	call	LC018
3166  00ba 90d6003d      	ld	a,(_uiInfo+61,y)
3167  00be d1001d        	cp	a,(_rcSubDataInfo+8,x)
3168                     ; 810 					num = i;
3169  00c1 201a          	jp	LC016
3170                     ; 813 			case RC_MODE_OUT:
3170                     ; 814 			case RC_MODE_STOP:
3170                     ; 815 				break;
3172  00c3               L3501:
3173                     ; 816 			case RC_MODE_REPEAT:
3173                     ; 817 				if (uiInfo.remote_banb[i] != rcSubDataInfo.banb[i]) {
3175  00c3 7b02          	ld	a,(OFST+0,sp)
3176  00c5 cd0158        	call	LC018
3177  00c8 90d60055      	ld	a,(_uiInfo+85,y)
3178  00cc d1003d        	cp	a,(_rcSubDataInfo+40,x)
3179                     ; 818 					num = i;
3180  00cf 200c          	jp	LC016
3181  00d1               L5501:
3182                     ; 821 			case RC_MODE_RESERVE:
3182                     ; 822 				if (uiInfo.remote_time[i] != rcSubDataInfo.time[i]) {
3184  00d1 7b02          	ld	a,(OFST+0,sp)
3185  00d3 cd0158        	call	LC018
3186  00d6 90d6004d      	ld	a,(_uiInfo+77,y)
3187  00da d10035        	cp	a,(_rcSubDataInfo+32,x)
3188                     ; 823 					num = i;
3190  00dd               LC016:
3191  00dd 2704          	jreq	L7011
3194  00df 7b02          	ld	a,(OFST+0,sp)
3195  00e1 6b01          	ld	(OFST-1,sp),a
3196  00e3               L7011:
3197                     ; 797 	for (i = 0 ; i < 8 ; i++) {
3199  00e3 0c02          	inc	(OFST+0,sp)
3202  00e5 7b02          	ld	a,(OFST+0,sp)
3203  00e7 a108          	cp	a,#8
3204  00e9 2599          	jrult	L5011
3205  00eb 7b01          	ld	a,(OFST-1,sp)
3206  00ed               L1111:
3207                     ; 829 	if (num == 0xFF) {
3209  00ed a1ff          	cp	a,#255
3210  00ef 260a          	jrne	L1311
3211                     ; 830 		ret_count = MAX_REPEAT_ERROR_COUNT;
3213  00f1 35050001      	mov	_ret_count,#5
3214                     ; 831 		cur_src = 0;
3216  00f5 725f0000      	clr	_cur_src
3217                     ; 832 		return num;
3220  00f9 2054          	jra	L071
3221  00fb               L1311:
3222                     ; 835 	if (cur_src == num) {
3224  00fb c60000        	ld	a,_cur_src
3225  00fe 1101          	cp	a,(OFST-1,sp)
3226  0100 2642          	jrne	L3311
3227                     ; 836 		ret_count--;
3229  0102 725a0001      	dec	_ret_count
3230                     ; 838 		if (ret_count == 0) {
3232  0106 2645          	jrne	L7311
3233                     ; 839 			rcSubDataInfo.mode_heat[num] = uiInfo.remote_mode[num];
3235  0108 7b01          	ld	a,(OFST-1,sp)
3236  010a 5f            	clrw	x
3237  010b 97            	ld	xl,a
3238  010c d60045        	ld	a,(_uiInfo+69,x)
3239  010f d70025        	ld	(_rcSubDataInfo+16,x),a
3240                     ; 840 			rcSubDataInfo.cur_temp[num] = uiInfo.tempCurr[num];
3242  0112 5f            	clrw	x
3243  0113 7b01          	ld	a,(OFST-1,sp)
3244  0115 97            	ld	xl,a
3245  0116 d60035        	ld	a,(_uiInfo+53,x)
3246  0119 d70015        	ld	(_rcSubDataInfo,x),a
3247                     ; 841 			rcSubDataInfo.set_temp[num] = uiInfo.tempSetup[num];
3249  011c 5f            	clrw	x
3250  011d 7b01          	ld	a,(OFST-1,sp)
3251  011f 97            	ld	xl,a
3252  0120 d6003d        	ld	a,(_uiInfo+61,x)
3253  0123 d7001d        	ld	(_rcSubDataInfo+8,x),a
3254                     ; 842 			rcSubDataInfo.time[num] = uiInfo.remote_time[num];
3256  0126 5f            	clrw	x
3257  0127 7b01          	ld	a,(OFST-1,sp)
3258  0129 97            	ld	xl,a
3259  012a d6004d        	ld	a,(_uiInfo+77,x)
3260  012d d70035        	ld	(_rcSubDataInfo+32,x),a
3261                     ; 843 			rcSubDataInfo.banb[num] = uiInfo.remote_banb[num];
3263  0130 5f            	clrw	x
3264  0131 7b01          	ld	a,(OFST-1,sp)
3265  0133 97            	ld	xl,a
3266  0134 d60055        	ld	a,(_uiInfo+85,x)
3267  0137 d7003d        	ld	(_rcSubDataInfo+40,x),a
3268                     ; 845 			ret_count = MAX_REPEAT_ERROR_COUNT;
3270  013a 35050001      	mov	_ret_count,#5
3271                     ; 846 			num = 0xFF;
3273  013e a6ff          	ld	a,#255
3274  0140 6b01          	ld	(OFST-1,sp),a
3275  0142 2009          	jra	L7311
3276  0144               L3311:
3277                     ; 849 		cur_src = num;
3279  0144 7b01          	ld	a,(OFST-1,sp)
3280  0146 c70000        	ld	_cur_src,a
3281                     ; 850 		ret_count = MAX_REPEAT_ERROR_COUNT;
3283  0149 35050001      	mov	_ret_count,#5
3284  014d               L7311:
3285                     ; 853 	return num;
3287  014d 7b01          	ld	a,(OFST-1,sp)
3289  014f               L071:
3291  014f 85            	popw	x
3292  0150 81            	ret	
3293  0151               LC017:
3294  0151 5f            	clrw	x
3295  0152 c60004        	ld	a,_uiInfo+4
3296  0155 97            	ld	xl,a
3297  0156 5a            	decw	x
3298  0157 81            	ret	
3299  0158               LC018:
3300  0158 5f            	clrw	x
3301  0159 97            	ld	xl,a
3302  015a 905f          	clrw	y
3303  015c 9097          	ld	yl,a
3304  015e 81            	ret	
3348                     ; 857 void rc_ptc_make_subRC(uint8_t *buf, uint8_t num) {
3349                     .text:	section	.text,new
3350  0000               _rc_ptc_make_subRC:
3352  0000 89            	pushw	x
3353       00000000      OFST:	set	0
3356                     ; 858 	buf[0] = BYTE_START_RC_SUBRC | num + 1;
3358  0001 7b05          	ld	a,(OFST+5,sp)
3359  0003 4c            	inc	a
3360  0004 1e01          	ldw	x,(OFST+1,sp)
3361  0006 aa60          	or	a,#96
3362  0008 f7            	ld	(x),a
3363                     ; 859 	buf[1] = uiInfo.remote_mode[num];
3365  0009 5f            	clrw	x
3366  000a 7b05          	ld	a,(OFST+5,sp)
3367  000c 97            	ld	xl,a
3368  000d d60045        	ld	a,(_uiInfo+69,x)
3369  0010 1e01          	ldw	x,(OFST+1,sp)
3370                     ; 860 	buf[2] = 0x00;
3372  0012 6f02          	clr	(2,x)
3373  0014 e701          	ld	(1,x),a
3374                     ; 861 	if (uiInfo.remote_mode[num] == RC_MODE_HEAT) {
3376  0016 5f            	clrw	x
3377  0017 7b05          	ld	a,(OFST+5,sp)
3378  0019 97            	ld	xl,a
3379  001a d60045        	ld	a,(_uiInfo+69,x)
3380  001d 4a            	dec	a
3381  001e 260d          	jrne	L1611
3382                     ; 862 		buf[3] = uiInfo.tempSetup[num];
3384  0020 7b05          	ld	a,(OFST+5,sp)
3385  0022 5f            	clrw	x
3386  0023 97            	ld	xl,a
3387  0024 d6003d        	ld	a,(_uiInfo+61,x)
3388  0027 1e01          	ldw	x,(OFST+1,sp)
3389  0029 e703          	ld	(3,x),a
3391  002b 2004          	jra	L3611
3392  002d               L1611:
3393                     ; 864 		buf[3] = 0x00;
3395  002d 1e01          	ldw	x,(OFST+1,sp)
3396  002f 6f03          	clr	(3,x)
3397  0031               L3611:
3398                     ; 867 	buf[4] = 0x00;
3400  0031 6f04          	clr	(4,x)
3401                     ; 869 	if (uiInfo.remote_mode[num] == RC_MODE_REPEAT) {
3403  0033 5f            	clrw	x
3404  0034 7b05          	ld	a,(OFST+5,sp)
3405  0036 97            	ld	xl,a
3406  0037 d60045        	ld	a,(_uiInfo+69,x)
3407  003a a110          	cp	a,#16
3408  003c 2609          	jrne	L5611
3409                     ; 870 		buf[5] = uiInfo.remote_banb[num];
3411  003e 7b05          	ld	a,(OFST+5,sp)
3412  0040 5f            	clrw	x
3413  0041 97            	ld	xl,a
3414  0042 d60055        	ld	a,(_uiInfo+85,x)
3416  0045 2012          	jp	LC019
3417  0047               L5611:
3418                     ; 871 	} else if(uiInfo.remote_mode[num] == RC_MODE_RESERVE){
3420  0047 7b05          	ld	a,(OFST+5,sp)
3421  0049 5f            	clrw	x
3422  004a 97            	ld	xl,a
3423  004b d60045        	ld	a,(_uiInfo+69,x)
3424  004e a108          	cp	a,#8
3425  0050 260d          	jrne	L1711
3426                     ; 872 		buf[5] = uiInfo.remote_time[num];
3428  0052 7b05          	ld	a,(OFST+5,sp)
3429  0054 5f            	clrw	x
3430  0055 97            	ld	xl,a
3431  0056 d6004d        	ld	a,(_uiInfo+77,x)
3432  0059               LC019:
3433  0059 1e01          	ldw	x,(OFST+1,sp)
3434  005b e705          	ld	(5,x),a
3436  005d 2004          	jra	L7611
3437  005f               L1711:
3438                     ; 874 		buf[5] = 0x00;
3440  005f 1e01          	ldw	x,(OFST+1,sp)
3441  0061 6f05          	clr	(5,x)
3442  0063               L7611:
3443                     ; 877 	buf[6] = 0x00;
3445  0063 6f06          	clr	(6,x)
3446                     ; 879 	makeChecksum(buf);
3448  0065 cd0000        	call	_makeChecksum
3450                     ; 880 }
3453  0068 85            	popw	x
3454  0069 81            	ret	
3493                     ; 882 void rc_ptc_make_error(uint8_t *buf) {
3494                     .text:	section	.text,new
3495  0000               _rc_ptc_make_error:
3497  0000 89            	pushw	x
3498       00000000      OFST:	set	0
3501                     ; 883 	buf[0] = BYTE_START_RC_ERROR | uiInfo.id;
3503  0001 c60004        	ld	a,_uiInfo+4
3504  0004 1e01          	ldw	x,(OFST+1,sp)
3505  0006 aae0          	or	a,#224
3506  0008 f7            	ld	(x),a
3507                     ; 884 	buf[1] = error;
3509  0009 c6000a        	ld	a,_error
3510  000c e701          	ld	(1,x),a
3511                     ; 885 	buf[2] = mode_recover;
3513  000e c6000f        	ld	a,_mode_recover
3514  0011 e702          	ld	(2,x),a
3515                     ; 886 	buf[3] = 0x00;
3517  0013 6f03          	clr	(3,x)
3518                     ; 887 	buf[4] = 0x00;
3520  0015 6f04          	clr	(4,x)
3521                     ; 888 	buf[5] = 0x00;
3523  0017 6f05          	clr	(5,x)
3524                     ; 889 	buf[6] = 0x00;
3526  0019 6f06          	clr	(6,x)
3527                     ; 891 	makeChecksum(buf);
3529  001b cd0000        	call	_makeChecksum
3531                     ; 892 }
3534  001e 85            	popw	x
3535  001f 81            	ret	
3572                     ; 894 void rc_ptc_make_command(uint8_t *buf) {
3573                     .text:	section	.text,new
3574  0000               _rc_ptc_make_command:
3576  0000 89            	pushw	x
3577       00000000      OFST:	set	0
3580                     ; 895 	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
3582  0001 c60004        	ld	a,_uiInfo+4
3583  0004 1e01          	ldw	x,(OFST+1,sp)
3584  0006 aaf0          	or	a,#240
3585  0008 f7            	ld	(x),a
3586                     ; 896 	buf[1] = 0x20;
3588  0009 a620          	ld	a,#32
3589  000b e701          	ld	(1,x),a
3590                     ; 897 	buf[2] = 0x00;
3592  000d 6f02          	clr	(2,x)
3593                     ; 898 	buf[3] = 0x00;
3595  000f 6f03          	clr	(3,x)
3596                     ; 899 	buf[4] = 0x00;
3598  0011 6f04          	clr	(4,x)
3599                     ; 900 	buf[5] = 0x00;
3601  0013 6f05          	clr	(5,x)
3602                     ; 901 	buf[6] = 0x00;
3604  0015 6f06          	clr	(6,x)
3605                     ; 902 }
3608  0017 85            	popw	x
3609  0018 81            	ret	
3661                     ; 912 void rc_ptc_make_command_packet(uint8_t *buf, uint8_t cmd, uint8_t p1)
3661                     ; 913 {
3662                     .text:	section	.text,new
3663  0000               _rc_ptc_make_command_packet:
3665  0000 89            	pushw	x
3666       00000000      OFST:	set	0
3669                     ; 914 	rc_ptc_make_command(buf);
3671  0001 cd0000        	call	_rc_ptc_make_command
3673                     ; 915 	switch( cmd )
3675  0004 7b05          	ld	a,(OFST+5,sp)
3677                     ; 942 		break;
3678  0006 4a            	dec	a
3679  0007 270c          	jreq	L1321
3680  0009 a003          	sub	a,#3
3681  000b 270d          	jreq	L3321
3682  000d 4a            	dec	a
3683  000e 2710          	jreq	L5321
3684  0010 4a            	dec	a
3685  0011 2713          	jreq	L7321
3686  0013 201b          	jra	L5621
3687  0015               L1321:
3688                     ; 917 	case PKT_CMD_MIRROR:
3688                     ; 918 		buf[2] = COMMAND_MODE_MIRROR;
3690  0015 1e01          	ldw	x,(OFST+1,sp)
3691  0017 4c            	inc	a
3692                     ; 919 		buf[3] = p1;
3693                     ; 920 		break;
3695  0018 2010          	jp	LC020
3696  001a               L3321:
3697                     ; 931 	case PKT_CMD_FACTORY:
3697                     ; 932 		buf[2] = COMMAND_MODE_FACTORY;
3699  001a 1e01          	ldw	x,(OFST+1,sp)
3700  001c a608          	ld	a,#8
3701                     ; 933 		buf[3] = p1;
3702                     ; 934 		break;
3704  001e 200a          	jp	LC020
3705  0020               L5321:
3706                     ; 935 	case PKT_CMD_RESET:
3706                     ; 936 		buf[2] = COMMAND_MODE_RESET;
3708  0020 1e01          	ldw	x,(OFST+1,sp)
3709  0022 a604          	ld	a,#4
3710                     ; 937 		buf[3] = p1;
3711                     ; 938 		break;
3713  0024 2004          	jp	LC020
3714  0026               L7321:
3715                     ; 939 	case PKT_CMD_BOILER_HOT_MODE:
3715                     ; 940 		buf[2] = COMMAND_MODE_HOTWATER;
3717  0026 1e01          	ldw	x,(OFST+1,sp)
3718  0028 a602          	ld	a,#2
3719                     ; 941 		buf[3] = p1;
3721  002a               LC020:
3722  002a e702          	ld	(2,x),a
3726  002c 7b06          	ld	a,(OFST+6,sp)
3727  002e e703          	ld	(3,x),a
3728                     ; 942 		break;
3730  0030               L5621:
3731                     ; 945 	makeChecksum(buf);
3733  0030 1e01          	ldw	x,(OFST+1,sp)
3734  0032 cd0000        	call	_makeChecksum
3736                     ; 946 }
3739  0035 85            	popw	x
3740  0036 81            	ret	
3786                     ; 982 void rc_ptc_make_mirror(uint8_t *buf) {
3787                     .text:	section	.text,new
3788  0000               _rc_ptc_make_mirror:
3790  0000 89            	pushw	x
3791  0001 88            	push	a
3792       00000001      OFST:	set	1
3795                     ; 984 	buf[0] = BYTE_START_RC_MIRROR | cur_mirror_page;
3797  0002 c60006        	ld	a,_cur_mirror_page
3798  0005 1e02          	ldw	x,(OFST+1,sp)
3799  0007 aa40          	or	a,#64
3800  0009 f7            	ld	(x),a
3801                     ; 986 	mode = mode_mirror == 1 ? CNT_MODE_MAIN : CNT_MODE_SUB;
3803  000a c60011        	ld	a,_mode_mirror
3804  000d 4a            	dec	a
3805  000e 2702          	jreq	L612
3806  0010 a601          	ld	a,#1
3807  0012               L612:
3808  0012 6b01          	ld	(OFST+0,sp),a
3809                     ; 987 	rc_ptc_make_baseSetting(buf, cur_mirror_page, mode);
3811  0014 88            	push	a
3812  0015 3b0006        	push	_cur_mirror_page
3813  0018 1e04          	ldw	x,(OFST+3,sp)
3814  001a cd0000        	call	_rc_ptc_make_baseSetting
3816  001d 85            	popw	x
3817                     ; 989 	makeChecksum(buf);
3819  001e 1e02          	ldw	x,(OFST+1,sp)
3820  0020 cd0000        	call	_makeChecksum
3822                     ; 991 	if (cur_mirror_page == 2) {
3824  0023 c60006        	ld	a,_cur_mirror_page
3825  0026 a102          	cp	a,#2
3826  0028 2608          	jrne	L7031
3827                     ; 992 		cur_mirror_page = 0;
3829  002a 725f0006      	clr	_cur_mirror_page
3830                     ; 993 		mode_mirror = 0;
3832  002e 725f0011      	clr	_mode_mirror
3833  0032               L7031:
3834                     ; 995 }
3837  0032 5b03          	addw	sp,#3
3838  0034 81            	ret	
3896                     ; 997 void rc_ptc_make(uint8_t *buf) {
3897                     .text:	section	.text,new
3898  0000               _rc_ptc_make:
3900  0000 89            	pushw	x
3901  0001 88            	push	a
3902       00000001      OFST:	set	1
3905                     ; 1001 	if (error != 0 && error_type != 0) {
3907  0002 c6000a        	ld	a,_error
3908  0005 2705          	jreq	L5331
3910  0007 c60009        	ld	a,_error_type
3911                     ; 1002 		rc_ptc_make_error(buf);
3913                     ; 1003 		return;
3915  000a 2608          	jrne	LC021
3916  000c               L5331:
3917                     ; 1005 		if (mode_recover == 1) {
3919  000c c6000f        	ld	a,_mode_recover
3920  000f 4a            	dec	a
3921  0010 2608          	jrne	L7331
3922                     ; 1006 			rc_ptc_make_error(buf);
3924  0012 1e02          	ldw	x,(OFST+1,sp)
3925  0014               LC021:
3927  0014 cd0000        	call	_rc_ptc_make_error
3929                     ; 1007 			return;
3930  0017               L062:
3933  0017 5b03          	addw	sp,#3
3934  0019 81            	ret	
3935  001a               L7331:
3936                     ; 1011 	switch (uiInfo.mode) {
3938  001a c60008        	ld	a,_uiInfo+8
3940                     ; 1059 			break;
3941  001d 276a          	jreq	LC022
3942  001f 4a            	dec	a
3943  0020 26f5          	jrne	L062
3944                     ; 1012 		case SETTING_MODE_MASTER:
3944                     ; 1013 			
3944                     ; 1014 			if (getSettingChange() == 1) {
3946  0022 cd0000        	call	_getSettingChange
3948  0025 4a            	dec	a
3949  0026 2607          	jrne	L7431
3950                     ; 1015 				rc_ptc_make_setting(buf);
3952  0028 1e02          	ldw	x,(OFST+1,sp)
3953  002a cd0000        	call	_rc_ptc_make_setting
3955                     ; 1016 				return;
3957  002d 20e8          	jra	L062
3958  002f               L7431:
3959                     ; 1020 			if (mode_mirror != 0) {
3961  002f c60011        	ld	a,_mode_mirror
3962  0032 270d          	jreq	L1531
3963                     ; 1021 				rc_ptc_make_command_packet(buf, PKT_CMD_MIRROR, mode_mirror);
3965  0034 3b0011        	push	_mode_mirror
3966  0037 4b01          	push	#1
3967  0039 1e04          	ldw	x,(OFST+3,sp)
3968  003b cd0000        	call	_rc_ptc_make_command_packet
3970  003e 85            	popw	x
3971                     ; 1022 				return;
3973  003f 20d6          	jra	L062
3974  0041               L1531:
3975                     ; 1025 			if (mode_factory != 0) {
3977  0041 c60010        	ld	a,_mode_factory
3978  0044 2711          	jreq	L3531
3979                     ; 1027 				rc_ptc_make_command_packet(buf, PKT_CMD_FACTORY, mode_factory);
3981  0046 3b0010        	push	_mode_factory
3982  0049 4b04          	push	#4
3983  004b 1e04          	ldw	x,(OFST+3,sp)
3984  004d cd0000        	call	_rc_ptc_make_command_packet
3986  0050 725f0010      	clr	_mode_factory
3987  0054 85            	popw	x
3988                     ; 1028 				mode_factory = 0;
3990                     ; 1029 				return;
3992  0055 20c0          	jra	L062
3993  0057               L3531:
3994                     ; 1032 			if (mode_hotwater != 0) {
3996  0057 c6000e        	ld	a,_mode_hotwater
3997  005a 270d          	jreq	L5531
3998                     ; 1034 				rc_ptc_make_command_packet(buf, PKT_CMD_BOILER_HOT_MODE, mode_hotwater);
4000  005c 3b000e        	push	_mode_hotwater
4001  005f 4b06          	push	#6
4002  0061 1e04          	ldw	x,(OFST+3,sp)
4003  0063 cd0000        	call	_rc_ptc_make_command_packet
4005  0066 85            	popw	x
4006                     ; 1035 				return;
4008  0067 20ae          	jra	L062
4009  0069               L5531:
4010                     ; 1038 			if (mode_reset != 0) {
4012  0069 c6000d        	ld	a,_mode_reset
4013  006c 270d          	jreq	L7531
4014                     ; 1040 				rc_ptc_make_command_packet(buf, PKT_CMD_RESET, mode_reset);
4016  006e 3b000d        	push	_mode_reset
4017  0071 4b05          	push	#5
4018  0073 1e04          	ldw	x,(OFST+3,sp)
4019  0075 cd0000        	call	_rc_ptc_make_command_packet
4021  0078 85            	popw	x
4022                     ; 1041 				return;
4024  0079 209c          	jra	L062
4025  007b               L7531:
4026                     ; 1045 			num = rc_ptc_check_subRC();
4028  007b cd0000        	call	_rc_ptc_check_subRC
4030  007e 6b01          	ld	(OFST+0,sp),a
4031                     ; 1046 			if ( num == 0xFF) {
4033  0080 4c            	inc	a
4034                     ; 1047 				rc_ptc_make_normal(buf);
4036                     ; 1048 				return;
4038  0081 2706          	jreq	LC022
4039                     ; 1051 			if (_remote == 1) {
4041  0083 c60000        	ld	a,__remote
4042  0086 4a            	dec	a
4043  0087 2607          	jrne	L3631
4044                     ; 1052 				rc_ptc_make_normal(buf);
4046  0089               LC022:
4049  0089 1e02          	ldw	x,(OFST+1,sp)
4050  008b cd0000        	call	_rc_ptc_make_normal
4053  008e 2087          	jra	L062
4054  0090               L3631:
4055                     ; 1054 				rc_ptc_make_subRC(buf, num);
4057  0090 7b01          	ld	a,(OFST+0,sp)
4058  0092 88            	push	a
4059  0093 1e03          	ldw	x,(OFST+2,sp)
4060  0095 cd0000        	call	_rc_ptc_make_subRC
4062  0098 84            	pop	a
4063  0099 cc0017        	jra	L062
4064                     ; 1057 		case SETTING_MODE_SUB:
4064                     ; 1058 			rc_ptc_make_normal(buf);
4066                     ; 1059 			break;
4068                     ; 1061 }
4112                     ; 1064 void func_rc_command(uint8_t com1, uint8_t com2) {
4113                     .text:	section	.text,new
4114  0000               _func_rc_command:
4116  0000 89            	pushw	x
4117       00000000      OFST:	set	0
4120                     ; 1065 	mode_mirror = 0;
4122  0001 725f0011      	clr	_mode_mirror
4123                     ; 1066 	mode_factory = 0;
4125  0005 725f0010      	clr	_mode_factory
4126                     ; 1067 	mode_hotwater = 0;
4128  0009 725f000e      	clr	_mode_hotwater
4129                     ; 1068 	mode_reset = 0;
4131  000d 725f000d      	clr	_mode_reset
4132                     ; 1070 	switch(com1) {
4134  0011 9e            	ld	a,xh
4136                     ; 1082 			break;
4137  0012 4a            	dec	a
4138  0013 270d          	jreq	L7631
4139  0015 4a            	dec	a
4140  0016 2711          	jreq	L1731
4141  0018 a002          	sub	a,#2
4142  001a 2714          	jreq	L3731
4143  001c a004          	sub	a,#4
4144  001e 2717          	jreq	L5731
4145  0020 201a          	jra	L7141
4146  0022               L7631:
4147                     ; 1071 		case COMMAND_MODE_MIRROR:
4147                     ; 1072 			mode_mirror = com2;
4149  0022 7b02          	ld	a,(OFST+2,sp)
4150  0024 c70011        	ld	_mode_mirror,a
4151                     ; 1073 			break;
4153  0027 2013          	jra	L7141
4154  0029               L1731:
4155                     ; 1074 		case COMMAND_MODE_HOTWATER:
4155                     ; 1075 			mode_hotwater = com2;
4157  0029 7b02          	ld	a,(OFST+2,sp)
4158  002b c7000e        	ld	_mode_hotwater,a
4159                     ; 1076 			break;
4161  002e 200c          	jra	L7141
4162  0030               L3731:
4163                     ; 1077 		case COMMAND_MODE_RESET:
4163                     ; 1078 			mode_reset = com2;
4165  0030 7b02          	ld	a,(OFST+2,sp)
4166  0032 c7000d        	ld	_mode_reset,a
4167                     ; 1079 			break;
4169  0035 2005          	jra	L7141
4170  0037               L5731:
4171                     ; 1080 		case COMMAND_MODE_FACTORY:
4171                     ; 1081 			mode_factory = com2;
4173  0037 7b02          	ld	a,(OFST+2,sp)
4174  0039 c70010        	ld	_mode_factory,a
4175                     ; 1082 			break;
4177  003c               L7141:
4178                     ; 1084 }
4181  003c 85            	popw	x
4182  003d 81            	ret	
4215                     ; 1086 void func_rc_recover(uint8_t com) {
4216                     .text:	section	.text,new
4217  0000               _func_rc_recover:
4221                     ; 1087 	mode_recover = com;
4223  0000 c7000f        	ld	_mode_recover,a
4224                     ; 1088 }
4227  0003 81            	ret	
4251                     ; 1090 void func_rc_setting(void) {
4252                     .text:	section	.text,new
4253  0000               _func_rc_setting:
4257                     ; 1091 	setSettingChange(1);
4259  0000 a601          	ld	a,#1
4261                     ; 1092 }
4264  0002 cc0000        	jp	_setSettingChange
4267                     	switch	.data
4268  0006               ___func_rc_settingCb:
4269  0006 00            	dc.b	0
4300                     ; 1096 void func_rc_settingCb(uint8_t ch) {
4301                     .text:	section	.text,new
4302  0000               _func_rc_settingCb:
4306                     ; 1097 	__func_rc_settingCb = ch;
4308  0000 c70006        	ld	___func_rc_settingCb,a
4309                     ; 1098 }
4312  0003 81            	ret	
4618                     	xdef	___func_rc_settingCb
4619                     	xdef	_rc_ptc_make_command_packet
4620                     	xdef	_rc_ptc_make_command
4621                     	xdef	_rc_ptc_make_error
4622                     	xdef	_rc_ptc_check_subRC
4623                     	xdef	_dr_out_count
4624                     	xdef	_rc_ptc_make_baseSetting
4625                     	xdef	_makeChecksum
4626                     	xdef	_rc_ptc_check_mirror
4627                     	xdef	_rc_ptc_check_subrc
4628                     	xdef	_rc_ptc_check_rc
4629                     	xdef	_rc_ptc_check_setting
4630                     	xdef	_rc_ptc_check_normal
4631                     	xdef	_rc_ptc_check_homenet
4632                     	xdef	_rc_ptc_check_master
4633                     	xdef	_only_one
4634                     	xdef	_dr_mode_out
4635                     	switch	.bss
4636  0000               _cur_src:
4637  0000 00            	ds.b	1
4638                     	xdef	_cur_src
4639  0001               _ret_count:
4640  0001 00            	ds.b	1
4641                     	xdef	_ret_count
4642  0002               _disp_mode_preview:
4643  0002 00            	ds.b	1
4644                     	xdef	_disp_mode_preview
4645  0003               __rcLED:
4646  0003 00            	ds.b	1
4647                     	xdef	__rcLED
4648  0004               _test_count:
4649  0004 00            	ds.b	1
4650                     	xdef	_test_count
4651  0005               _packet_changed:
4652  0005 00            	ds.b	1
4653                     	xdef	_packet_changed
4654  0006               _cur_mirror_page:
4655  0006 00            	ds.b	1
4656                     	xdef	_cur_mirror_page
4657  0007               _cur_set_page:
4658  0007 00            	ds.b	1
4659                     	xdef	_cur_set_page
4660  0008               __version:
4661  0008 00            	ds.b	1
4662                     	xdef	__version
4663  0009               _error_type:
4664  0009 00            	ds.b	1
4665                     	xdef	_error_type
4666  000a               _error:
4667  000a 00            	ds.b	1
4668                     	xdef	_error
4669                     	xdef	_debug_br
4670                     	xdef	_debug_hn
4671  000b               _state_check:
4672  000b 00            	ds.b	1
4673                     	xdef	_state_check
4674                     	xref	__backup_backlight
4675                     	xref	_packet_buf
4676                     	xref	__boiler_fire
4677                     	xref	__boiler_type
4678                     	xref	__timFlag
4679                     	xref	__remote
4680                     	xref	__boiler_water_heat
4681                     	xref	__boiler_water_shower
4682                     	xref	___boiler_shower
4683                     	xref	__updateCount
4684                     	xref	__updateBit
4685                     	xref	__updateTimer
4686                     	xref	__disp_mode2
4687                     	xref	_lcd_disp_rid
4688                     	xref	_uiInfo
4689                     	xdef	___rc_max
4690                     	xdef	_func_rc_settingCb
4691                     	xdef	_func_rc_setting
4692                     	xdef	_func_rc_recover
4693                     	xdef	_func_rc_command
4694                     	xdef	_rc_ptc_make_mirror
4695                     	xdef	_rc_ptc_make
4696                     	xdef	_rc_ptc_make_subRC
4697                     	xdef	_rc_ptc_make_setting
4698                     	xdef	_rc_ptc_make_normal
4699                     	xdef	_setState_check
4700                     	xdef	_getState_check
4701                     	xdef	_getSettingChange
4702                     	xdef	_setSettingChange
4703                     	xdef	_rc_ptc_check
4704                     	xdef	_rc_ptc_baseSet
4705                     	xdef	_getHexToBin
4706  000c               _set_changed:
4707  000c 00            	ds.b	1
4708                     	xdef	_set_changed
4709  000d               _mode_reset:
4710  000d 00            	ds.b	1
4711                     	xdef	_mode_reset
4712  000e               _mode_hotwater:
4713  000e 00            	ds.b	1
4714                     	xdef	_mode_hotwater
4715  000f               _mode_recover:
4716  000f 00            	ds.b	1
4717                     	xdef	_mode_recover
4718  0010               _mode_factory:
4719  0010 00            	ds.b	1
4720                     	xdef	_mode_factory
4721  0011               _mode_mirror:
4722  0011 00            	ds.b	1
4723                     	xdef	_mode_mirror
4724  0012               _boiler_info:
4725  0012 000000        	ds.b	3
4726                     	xdef	_boiler_info
4727  0015               _rcSubDataInfo:
4728  0015 000000000000  	ds.b	48
4729                     	xdef	_rcSubDataInfo
4730                     	xref	_file_read
4731                     	xref	_disp_char
4732                     	xref	___timer1s
4752                     	end
