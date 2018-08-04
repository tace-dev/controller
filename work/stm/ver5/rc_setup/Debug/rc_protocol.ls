   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  19                     	switch	.data
  20  0000               _debug_hn:
  21  0000 00            	dc.b	0
  22  0001               _debug_br:
  23  0001 00            	dc.b	0
  24  0002               _dr_mode_out:
  25  0002 01            	dc.b	1
  77                     ; 67 uint8_t getHexToBin(uint8_t hex, uint8_t idx)
  77                     ; 68 {
  79                     .text:	section	.text,new
  80  0000               _getHexToBin:
  82  0000 89            	pushw	x
  83  0001 88            	push	a
  84       00000001      OFST:	set	1
  87                     ; 69 	uint8_t p = 0x80;
  89                     ; 70 	p = p >> (0x08 - (idx + 0x01));
  91  0002 9f            	ld	a,xl
  92  0003 a007          	sub	a,#7
  93  0005 40            	neg	a
  94  0006 5f            	clrw	x
  95  0007 97            	ld	xl,a
  96  0008 a680          	ld	a,#128
  97  000a 5d            	tnzw	x
  98  000b 2704          	jreq	L6
  99  000d               L01:
 100  000d 44            	srl	a
 101  000e 5a            	decw	x
 102  000f 26fc          	jrne	L01
 103  0011               L6:
 104  0011 6b01          	ld	(OFST+0,sp),a
 105                     ; 72 	if (hex & p)
 107  0013 7b02          	ld	a,(OFST+1,sp)
 108  0015 1501          	bcp	a,(OFST+0,sp)
 109  0017 2704          	jreq	L13
 110                     ; 74 		return 1;
 112  0019 a601          	ld	a,#1
 114  001b 2001          	jra	L21
 115  001d               L13:
 116                     ; 78 		return 0;
 118  001d 4f            	clr	a
 120  001e               L21:
 122  001e 5b03          	addw	sp,#3
 123  0020 81            	ret
 158                     ; 82 void rc_ptc_baseSet(void) {
 159                     .text:	section	.text,new
 160  0000               _rc_ptc_baseSet:
 162  0000 88            	push	a
 163       00000001      OFST:	set	1
 166                     ; 84 	state_check = RC_STATE_NORMAL;
 168  0001 3501000b      	mov	_state_check,#1
 169                     ; 85 	set_changed = 0;
 171  0005 725f000c      	clr	_set_changed
 172                     ; 87 	for (i = 0 ; i < 8 ; i++) {
 174  0009 0f01          	clr	(OFST+0,sp)
 175  000b               L15:
 176                     ; 88 		rcSubDataInfo.mode_heat[i] = 0xAA;
 178  000b 7b01          	ld	a,(OFST+0,sp)
 179  000d 5f            	clrw	x
 180  000e 97            	ld	xl,a
 181  000f a6aa          	ld	a,#170
 182  0011 d70025        	ld	(_rcSubDataInfo+16,x),a
 183                     ; 89 		rcSubDataInfo.cur_temp[i] = 0xAA;
 185  0014 7b01          	ld	a,(OFST+0,sp)
 186  0016 5f            	clrw	x
 187  0017 97            	ld	xl,a
 188  0018 a6aa          	ld	a,#170
 189  001a d70015        	ld	(_rcSubDataInfo,x),a
 190                     ; 90 		rcSubDataInfo.set_temp[i] = 0xAA;
 192  001d 7b01          	ld	a,(OFST+0,sp)
 193  001f 5f            	clrw	x
 194  0020 97            	ld	xl,a
 195  0021 a6aa          	ld	a,#170
 196  0023 d7001d        	ld	(_rcSubDataInfo+8,x),a
 197                     ; 91 		rcSubDataInfo.time[i] = 0xAA;
 199  0026 7b01          	ld	a,(OFST+0,sp)
 200  0028 5f            	clrw	x
 201  0029 97            	ld	xl,a
 202  002a a6aa          	ld	a,#170
 203  002c d70035        	ld	(_rcSubDataInfo+32,x),a
 204                     ; 92 		rcSubDataInfo.banb[i] = 0xAA;
 206  002f 7b01          	ld	a,(OFST+0,sp)
 207  0031 5f            	clrw	x
 208  0032 97            	ld	xl,a
 209  0033 a6aa          	ld	a,#170
 210  0035 d7003d        	ld	(_rcSubDataInfo+40,x),a
 211                     ; 87 	for (i = 0 ; i < 8 ; i++) {
 213  0038 0c01          	inc	(OFST+0,sp)
 216  003a 7b01          	ld	a,(OFST+0,sp)
 217  003c a108          	cp	a,#8
 218  003e 25cb          	jrult	L15
 219                     ; 94 }
 222  0040 84            	pop	a
 223  0041 81            	ret
 263                     ; 96 void rc_ptc_check_master(uint8_t *buf) {
 264                     .text:	section	.text,new
 265  0000               _rc_ptc_check_master:
 267  0000 89            	pushw	x
 268       00000000      OFST:	set	0
 271                     ; 97 	if (buf[1] != 0x00) {
 273  0001 6d01          	tnz	(1,x)
 274  0003 2610          	jrne	L02
 275                     ; 98 		return;
 277                     ; 105 	if (getHexToBin(buf[6], 7) == 1) {  // H/N 패킷
 279  0005 ae0007        	ldw	x,#7
 280  0008 1601          	ldw	y,(OFST+1,sp)
 281  000a 90e606        	ld	a,(6,y)
 282  000d 95            	ld	xh,a
 283  000e cd0000        	call	_getHexToBin
 285  0011 a101          	cp	a,#1
 286  0013 2602          	jrne	L77
 287                     ; 106 		return;
 288  0015               L02:
 291  0015 85            	popw	x
 292  0016 81            	ret
 293  0017               L77:
 294                     ; 109 	boiler_info.state = buf[4] & 0x03;
 296  0017 1e01          	ldw	x,(OFST+1,sp)
 297  0019 e604          	ld	a,(4,x)
 298  001b a403          	and	a,#3
 299  001d c70012        	ld	_boiler_info,a
 300                     ; 110 	boiler_info.hotwater = buf[2];
 302  0020 1e01          	ldw	x,(OFST+1,sp)
 303  0022 e602          	ld	a,(2,x)
 304  0024 c70013        	ld	_boiler_info+1,a
 305                     ; 111 	boiler_info.heatwater = buf[3];
 307  0027 1e01          	ldw	x,(OFST+1,sp)
 308  0029 e603          	ld	a,(3,x)
 309  002b c70014        	ld	_boiler_info+2,a
 310                     ; 113 	uiInfo.cntlMode = getHexToBin(buf[4], 7);
 312  002e ae0007        	ldw	x,#7
 313  0031 1601          	ldw	y,(OFST+1,sp)
 314  0033 90e604        	ld	a,(4,y)
 315  0036 95            	ld	xh,a
 316  0037 cd0000        	call	_getHexToBin
 318  003a c70003        	ld	_uiInfo+3,a
 319                     ; 117 	_boiler_fire = boiler_info.state;
 321  003d 5500120000    	mov	__boiler_fire,_boiler_info
 322                     ; 119 }
 324  0042 20d1          	jra	L02
 380                     ; 122 void rc_ptc_check_homenet(uint8_t *buf) {
 381                     .text:	section	.text,new
 382  0000               _rc_ptc_check_homenet:
 384  0000 89            	pushw	x
 385  0001 88            	push	a
 386       00000001      OFST:	set	1
 389                     ; 126 	if (getHexToBin(buf[6], 7) == 0) { // 일반 패킷
 391  0002 ae0007        	ldw	x,#7
 392  0005 1602          	ldw	y,(OFST+1,sp)
 393  0007 90e606        	ld	a,(6,y)
 394  000a 95            	ld	xh,a
 395  000b cd0000        	call	_getHexToBin
 397  000e 4d            	tnz	a
 398  000f 270f          	jreq	L42
 399                     ; 127 		return;
 401                     ; 130 	id = buf[1] & 0x0F;
 403  0011 1e02          	ldw	x,(OFST+1,sp)
 404  0013 e601          	ld	a,(1,x)
 405  0015 a40f          	and	a,#15
 406  0017 6b01          	ld	(OFST+0,sp),a
 407                     ; 132 	if (id != uiInfo.id) {
 409  0019 7b01          	ld	a,(OFST+0,sp)
 410  001b c10004        	cp	a,_uiInfo+4
 411  001e 2703          	jreq	L521
 412                     ; 133 		return;
 413  0020               L42:
 416  0020 5b03          	addw	sp,#3
 417  0022 81            	ret
 418  0023               L521:
 419                     ; 136 	packet_changed = 1;
 421  0023 35010005      	mov	_packet_changed,#1
 422                     ; 138 	if (_remote == 0) {
 424  0027 725d0000      	tnz	__remote
 425  002b 2641          	jrne	L721
 426                     ; 139 		_disp_mode2 = buf[2];
 428  002d 1e02          	ldw	x,(OFST+1,sp)
 429  002f e602          	ld	a,(2,x)
 430  0031 c70000        	ld	__disp_mode2,a
 431                     ; 141 		if (buf[2] == RC_MODE_HEAT) {
 433  0034 1e02          	ldw	x,(OFST+1,sp)
 434  0036 e602          	ld	a,(2,x)
 435  0038 a101          	cp	a,#1
 436  003a 2611          	jrne	L131
 437                     ; 142 			if (buf[3] != 0xFF) {
 439  003c 1e02          	ldw	x,(OFST+1,sp)
 440  003e e603          	ld	a,(3,x)
 441  0040 a1ff          	cp	a,#255
 442  0042 272a          	jreq	L721
 443                     ; 143 				uiInfo.tSetup = buf[3];
 445  0044 1e02          	ldw	x,(OFST+1,sp)
 446  0046 e603          	ld	a,(3,x)
 447  0048 c7000e        	ld	_uiInfo+14,a
 448  004b 2021          	jra	L721
 449  004d               L131:
 450                     ; 145 		} else if (buf[2] == RC_MODE_OUT) {
 452  004d 1e02          	ldw	x,(OFST+1,sp)
 453  004f e602          	ld	a,(2,x)
 454  0051 a102          	cp	a,#2
 455  0053 2619          	jrne	L721
 456                     ; 146 			out_mode = (buf[4] & 0xF0) >> 7;
 458  0055 1e02          	ldw	x,(OFST+1,sp)
 459  0057 e604          	ld	a,(4,x)
 460  0059 49            	rlc	a
 461  005a 4f            	clr	a
 462  005b 49            	rlc	a
 463  005c 6b01          	ld	(OFST+0,sp),a
 464                     ; 147 			if (out_mode == 1) {
 466  005e 7b01          	ld	a,(OFST+0,sp)
 467  0060 a101          	cp	a,#1
 468  0062 2606          	jrne	L141
 469                     ; 148 				dr_mode_out = 1;   // 개별외출
 471  0064 35010002      	mov	_dr_mode_out,#1
 473  0068 2004          	jra	L721
 474  006a               L141:
 475                     ; 150 				dr_mode_out = 0;   // 전체 외출
 477  006a 725f0002      	clr	_dr_mode_out
 478  006e               L721:
 479                     ; 154 }
 481  006e 20b0          	jra	L42
 540                     ; 157 void rc_ptc_check_normal(uint8_t *buf) {
 541                     .text:	section	.text,new
 542  0000               _rc_ptc_check_normal:
 544  0000 89            	pushw	x
 545  0001 88            	push	a
 546       00000001      OFST:	set	1
 549                     ; 158 	uint8_t start = buf[0] & 0x0F;
 551  0002 f6            	ld	a,(x)
 552  0003 a40f          	and	a,#15
 553  0005 6b01          	ld	(OFST+0,sp),a
 554                     ; 160 	if (start == 0x0F) {
 556  0007 7b01          	ld	a,(OFST+0,sp)
 557  0009 a10f          	cp	a,#15
 558  000b 2606          	jrne	L561
 559                     ; 161 		state_check = RC_STATE_FACTORY;
 561  000d 3505000b      	mov	_state_check,#5
 562                     ; 162 		return;
 564  0011 202e          	jra	L04
 565  0013               L561:
 566                     ; 165 	if (start == uiInfo.id) {
 568  0013 7b01          	ld	a,(OFST+0,sp)
 569  0015 c10004        	cp	a,_uiInfo+4
 570  0018 260f          	jrne	L761
 571                     ; 166 		packet_buf[start - 1] = 0;
 573  001a 7b01          	ld	a,(OFST+0,sp)
 574  001c 5f            	clrw	x
 575  001d 97            	ld	xl,a
 576  001e 5a            	decw	x
 577  001f 724f0000      	clr	(_packet_buf,x)
 578                     ; 167 		state_check = RC_STATE_NORMAL;
 580  0023 3501000b      	mov	_state_check,#1
 582  0027 2004          	jra	L171
 583  0029               L761:
 584                     ; 169 		state_check = RC_STATE_NONE;
 586  0029 725f000b      	clr	_state_check
 587  002d               L171:
 588                     ; 172 	if (start == 0x09 ) {
 590  002d 7b01          	ld	a,(OFST+0,sp)
 591  002f a109          	cp	a,#9
 592  0031 2611          	jrne	L371
 593                     ; 173 		debug_hn = buf[2];
 595  0033 1e02          	ldw	x,(OFST+1,sp)
 596  0035 e602          	ld	a,(2,x)
 597  0037 c70000        	ld	_debug_hn,a
 598                     ; 174 		debug_br = buf[1];
 600  003a 1e02          	ldw	x,(OFST+1,sp)
 601  003c e601          	ld	a,(1,x)
 602  003e c70001        	ld	_debug_br,a
 603                     ; 175 		return;
 604  0041               L04:
 607  0041 5b03          	addw	sp,#3
 608  0043 81            	ret
 609  0044               L371:
 610                     ; 178 	if (uiInfo.mode == SETTING_MODE_MASTER) {
 612  0044 c60008        	ld	a,_uiInfo+8
 613  0047 a101          	cp	a,#1
 614  0049 2605          	jrne	L571
 615                     ; 179 		rc_ptc_check_master(buf);
 617  004b 1e02          	ldw	x,(OFST+1,sp)
 618  004d cd0000        	call	_rc_ptc_check_master
 620  0050               L571:
 621                     ; 182 	if ( _remote == 0 && _backup_backlight == 0) {
 623  0050 725d0000      	tnz	__remote
 624  0054 2666          	jrne	L771
 626  0056 725d0000      	tnz	__backup_backlight
 627  005a 2660          	jrne	L771
 628                     ; 183 		if (getHexToBin(buf[6], 7) == 0) {
 630  005c ae0007        	ldw	x,#7
 631  005f 1602          	ldw	y,(OFST+1,sp)
 632  0061 90e606        	ld	a,(6,y)
 633  0064 95            	ld	xh,a
 634  0065 cd0000        	call	_getHexToBin
 636  0068 4d            	tnz	a
 637  0069 2651          	jrne	L771
 638                     ; 184 			_rcLED = buf[1];
 640  006b 1e02          	ldw	x,(OFST+1,sp)
 641  006d e601          	ld	a,(1,x)
 642  006f c70003        	ld	__rcLED,a
 643                     ; 186 			if (getHexToBin(buf[1], uiInfo.id - 1) == 1) {
 645  0072 c60004        	ld	a,_uiInfo+4
 646  0075 4a            	dec	a
 647  0076 97            	ld	xl,a
 648  0077 1602          	ldw	y,(OFST+1,sp)
 649  0079 90e601        	ld	a,(1,y)
 650  007c 95            	ld	xh,a
 651  007d cd0000        	call	_getHexToBin
 653  0080 a101          	cp	a,#1
 654  0082 261e          	jrne	L302
 655                     ; 188 				D_IO_LOW(D_LED_PORT, D_LED_PIN);
 657  0084 7211500a      	bres	20490,#0
 658                     ; 191 				lcd_disp_rid(uiInfo.id, 1, (uiInfo.mode == SETTING_MODE_MASTER) ? 1 : 0);
 660  0088 c60008        	ld	a,_uiInfo+8
 661  008b a101          	cp	a,#1
 662  008d 2604          	jrne	L03
 663  008f a601          	ld	a,#1
 664  0091 2001          	jra	L23
 665  0093               L03:
 666  0093 4f            	clr	a
 667  0094               L23:
 668  0094 88            	push	a
 669  0095 ae0001        	ldw	x,#1
 670  0098 c60004        	ld	a,_uiInfo+4
 671  009b 95            	ld	xh,a
 672  009c cd0000        	call	_lcd_disp_rid
 674  009f 84            	pop	a
 676  00a0 201a          	jra	L771
 677  00a2               L302:
 678                     ; 199 				D_IO_HIGH(D_LED_PORT, D_LED_PIN);
 680  00a2 7210500a      	bset	20490,#0
 681                     ; 202 				lcd_disp_rid(uiInfo.id, 0, (uiInfo.mode == SETTING_MODE_MASTER) ? 1 : 0);
 683  00a6 c60008        	ld	a,_uiInfo+8
 684  00a9 a101          	cp	a,#1
 685  00ab 2604          	jrne	L43
 686  00ad a601          	ld	a,#1
 687  00af 2001          	jra	L63
 688  00b1               L43:
 689  00b1 4f            	clr	a
 690  00b2               L63:
 691  00b2 88            	push	a
 692  00b3 5f            	clrw	x
 693  00b4 c60004        	ld	a,_uiInfo+4
 694  00b7 95            	ld	xh,a
 695  00b8 cd0000        	call	_lcd_disp_rid
 697  00bb 84            	pop	a
 698  00bc               L771:
 699                     ; 212 	rc_ptc_check_homenet(buf);
 701  00bc 1e02          	ldw	x,(OFST+1,sp)
 702  00be cd0000        	call	_rc_ptc_check_homenet
 704                     ; 214 	_version = buf[6] >> 1;
 706  00c1 1e02          	ldw	x,(OFST+1,sp)
 707  00c3 e606          	ld	a,(6,x)
 708  00c5 44            	srl	a
 709  00c6 c70008        	ld	__version,a
 710                     ; 216 	if (mode_recover == 0) {
 712  00c9 725d000f      	tnz	_mode_recover
 713  00cd 261e          	jrne	L702
 714                     ; 217 		error_type = buf[4] >> 2;
 716  00cf 1e02          	ldw	x,(OFST+1,sp)
 717  00d1 e604          	ld	a,(4,x)
 718  00d3 44            	srl	a
 719  00d4 44            	srl	a
 720  00d5 c70009        	ld	_error_type,a
 721                     ; 219 		if (error_type != 0) {
 723  00d8 725d0009      	tnz	_error_type
 724  00dc 2709          	jreq	L112
 725                     ; 220 			error = buf[5];
 727  00de 1e02          	ldw	x,(OFST+1,sp)
 728  00e0 e605          	ld	a,(5,x)
 729  00e2 c7000a        	ld	_error,a
 731  00e5 2025          	jra	L512
 732  00e7               L112:
 733                     ; 222 			error = 0;
 735  00e7 725f000a      	clr	_error
 736  00eb 201f          	jra	L512
 737  00ed               L702:
 738                     ; 225 		if ((buf[4] >> 2) == 0 && buf[5] == 0) {
 740  00ed 1e02          	ldw	x,(OFST+1,sp)
 741  00ef e604          	ld	a,(4,x)
 742  00f1 44            	srl	a
 743  00f2 44            	srl	a
 744  00f3 5f            	clrw	x
 745  00f4 97            	ld	xl,a
 746  00f5 a30000        	cpw	x,#0
 747  00f8 2612          	jrne	L512
 749  00fa 1e02          	ldw	x,(OFST+1,sp)
 750  00fc 6d05          	tnz	(5,x)
 751  00fe 260c          	jrne	L512
 752                     ; 226 			error_type = 0;
 754  0100 725f0009      	clr	_error_type
 755                     ; 227 			error = 0;
 757  0104 725f000a      	clr	_error
 758                     ; 228 			mode_recover = 0;
 760  0108 725f000f      	clr	_mode_recover
 761  010c               L512:
 762                     ; 235 }
 764  010c ac410041      	jpf	L04
 812                     ; 238 void rc_ptc_check_setting(uint8_t *buf) {
 813                     .text:	section	.text,new
 814  0000               _rc_ptc_check_setting:
 816  0000 88            	push	a
 817       00000001      OFST:	set	1
 820                     ; 239 	uint8_t page = buf[0] & 0x0F;
 822  0001 f6            	ld	a,(x)
 823  0002 a40f          	and	a,#15
 824  0004 6b01          	ld	(OFST+0,sp),a
 825                     ; 241 	if (uiInfo.mode != SETTING_MODE_MASTER) {
 827  0006 c60008        	ld	a,_uiInfo+8
 828  0009 a101          	cp	a,#1
 829  000b 2702          	jreq	L142
 830                     ; 242 		return;
 833  000d 84            	pop	a
 834  000e 81            	ret
 835  000f               L142:
 836                     ; 245 	state_check = RC_STATE_SETTING;
 838  000f 3502000b      	mov	_state_check,#2
 839                     ; 247 	if (cur_set_page == page) {
 841  0013 c60007        	ld	a,_cur_set_page
 842  0016 1101          	cp	a,(OFST+0,sp)
 843  0018 2604          	jrne	L342
 844                     ; 248 		cur_set_page++;
 846  001a 725c0007      	inc	_cur_set_page
 847  001e               L342:
 848                     ; 251 	if (cur_set_page == MAX_SETTING_PAGE) { 
 850  001e c60007        	ld	a,_cur_set_page
 851  0021 a103          	cp	a,#3
 852  0023 2613          	jrne	L542
 853                     ; 252 		set_changed = 0;
 855  0025 725f000c      	clr	_set_changed
 856                     ; 253 		cur_set_page = 0;
 858  0029 725f0007      	clr	_cur_set_page
 859                     ; 255 		func_rc_settingCb(1);
 861  002d a601          	ld	a,#1
 862  002f cd0000        	call	_func_rc_settingCb
 864                     ; 256 		state_check = RC_STATE_NORMAL;
 866  0032 3501000b      	mov	_state_check,#1
 868  0036 2004          	jra	L742
 869  0038               L542:
 870                     ; 258 		func_rc_settingCb(0);
 872  0038 4f            	clr	a
 873  0039 cd0000        	call	_func_rc_settingCb
 875  003c               L742:
 876                     ; 260 }
 879  003c 84            	pop	a
 880  003d 81            	ret
 938                     ; 263 void rc_ptc_check_rc(uint8_t *buf) {
 939                     .text:	section	.text,new
 940  0000               _rc_ptc_check_rc:
 942  0000 89            	pushw	x
 943  0001 89            	pushw	x
 944       00000002      OFST:	set	2
 947                     ; 267 	st = (buf[0] & 0x0F) - 1;
 949  0002 f6            	ld	a,(x)
 950  0003 a40f          	and	a,#15
 951  0005 4a            	dec	a
 952  0006 6b02          	ld	(OFST+0,sp),a
 953                     ; 269 	if (uiInfo.mode != SETTING_MODE_MASTER) {
 955  0008 c60008        	ld	a,_uiInfo+8
 956  000b a101          	cp	a,#1
 957  000d 2756          	jreq	L713
 958                     ; 270 		if (st == 0) {
 960  000f 0d02          	tnz	(OFST+0,sp)
 961  0011 264f          	jrne	L123
 962                     ; 271 			if (buf[1] == RC_MODE_OUT && buf[4] == 0) {
 964  0013 e601          	ld	a,(1,x)
 965  0015 a102          	cp	a,#2
 966  0017 260c          	jrne	L323
 968  0019 6d04          	tnz	(4,x)
 969  001b 2608          	jrne	L323
 970                     ; 272 				_disp_mode2 = RC_MODE_OUT;
 972  001d 35020000      	mov	__disp_mode2,#2
 973                     ; 273 				dr_mode_out = 0;
 975  0021 725f0002      	clr	_dr_mode_out
 976  0025               L323:
 977                     ; 276 			if (dr_mode_out == 0) {
 979  0025 725d0002      	tnz	_dr_mode_out
 980  0029 2637          	jrne	L123
 981                     ; 277 				if (_disp_mode2 == RC_MODE_OUT) {
 983  002b c60000        	ld	a,__disp_mode2
 984  002e a102          	cp	a,#2
 985  0030 2630          	jrne	L123
 986                     ; 278 					if (buf[1] != RC_MODE_OUT) {
 988  0032 1e03          	ldw	x,(OFST+1,sp)
 989  0034 e601          	ld	a,(1,x)
 990  0036 a102          	cp	a,#2
 991  0038 2712          	jreq	L133
 992                     ; 279 						packet_changed = 1;
 994  003a 35010005      	mov	_packet_changed,#1
 995                     ; 280 						dr_mode_out = 1;
 997  003e 35010002      	mov	_dr_mode_out,#1
 998                     ; 281 						_disp_mode2 = FW_GET_DISPMODE;
1000  0042 a629          	ld	a,#41
1001  0044 cd0000        	call	_file_read
1003  0047 c70000        	ld	__disp_mode2,a
1005  004a 2016          	jra	L123
1006  004c               L133:
1007                     ; 283 						if(buf[4] != 0)  {
1009  004c 1e03          	ldw	x,(OFST+1,sp)
1010  004e 6d04          	tnz	(4,x)
1011  0050 2710          	jreq	L123
1012                     ; 284 							packet_changed = 1;
1014  0052 35010005      	mov	_packet_changed,#1
1015                     ; 285 							dr_mode_out = 1;
1017  0056 35010002      	mov	_dr_mode_out,#1
1018                     ; 286 							_disp_mode2 = FW_GET_DISPMODE;
1020  005a a629          	ld	a,#41
1021  005c cd0000        	call	_file_read
1023  005f c70000        	ld	__disp_mode2,a
1024  0062               L123:
1025                     ; 292 		return;
1027  0062 cc00e8        	jra	L64
1028  0065               L713:
1029                     ; 295 	k = 0;
1031  0065 0f01          	clr	(OFST-1,sp)
1032                     ; 297 	packet_buf[st] = 0;
1034  0067 7b02          	ld	a,(OFST+0,sp)
1035  0069 5f            	clrw	x
1036  006a 97            	ld	xl,a
1037  006b 724f0000      	clr	(_packet_buf,x)
1038                     ; 299 	if (_remote == 0) {
1040  006f 725d0000      	tnz	__remote
1041  0073 2703          	jreq	L05
1042  0075 cc0188        	jp	L733
1043  0078               L05:
1044                     ; 300 		if (rcSubDataInfo.mode_heat[st] == 0xFF) {
1046  0078 7b02          	ld	a,(OFST+0,sp)
1047  007a 5f            	clrw	x
1048  007b 97            	ld	xl,a
1049  007c d60025        	ld	a,(_rcSubDataInfo+16,x)
1050  007f a1ff          	cp	a,#255
1051  0081 2668          	jrne	L143
1052                     ; 301 			if (uiInfo.remote_mode[st] != buf[1]) {
1054  0083 7b02          	ld	a,(OFST+0,sp)
1055  0085 5f            	clrw	x
1056  0086 97            	ld	xl,a
1057  0087 d60045        	ld	a,(_uiInfo+69,x)
1058  008a 1e03          	ldw	x,(OFST+1,sp)
1059  008c e101          	cp	a,(1,x)
1060  008e 2706          	jreq	L343
1061                     ; 302 				k = 1;
1063  0090 a601          	ld	a,#1
1064  0092 6b01          	ld	(OFST-1,sp),a
1066  0094 204c          	jra	L543
1067  0096               L343:
1068                     ; 305 				switch (buf[1]) {
1070  0096 1e03          	ldw	x,(OFST+1,sp)
1071  0098 e601          	ld	a,(1,x)
1073                     ; 324 						break;
1074  009a 4a            	dec	a
1075  009b 270a          	jreq	L152
1076  009d a007          	sub	a,#7
1077  009f 271d          	jreq	L752
1078  00a1 a008          	sub	a,#8
1079  00a3 272c          	jreq	L162
1080  00a5 203b          	jra	L543
1081  00a7               L152:
1082                     ; 306 					case RC_MODE_HEAT:
1082                     ; 307 						if (uiInfo.tempSetup[st] != buf[3]) {
1084  00a7 7b02          	ld	a,(OFST+0,sp)
1085  00a9 5f            	clrw	x
1086  00aa 97            	ld	xl,a
1087  00ab d6003d        	ld	a,(_uiInfo+61,x)
1088  00ae 1e03          	ldw	x,(OFST+1,sp)
1089  00b0 e103          	cp	a,(3,x)
1090  00b2 272e          	jreq	L543
1091                     ; 308 							k = 1;
1093  00b4 a601          	ld	a,#1
1094  00b6 6b01          	ld	(OFST-1,sp),a
1095  00b8 2028          	jra	L543
1096  00ba               L352:
1097                     ; 311 					case RC_MODE_OUT:
1097                     ; 312 						break;
1099  00ba 2026          	jra	L543
1100  00bc               L552:
1101                     ; 313 					case RC_MODE_STOP:
1101                     ; 314 						break;
1103  00bc 2024          	jra	L543
1104  00be               L752:
1105                     ; 315 					case RC_MODE_RESERVE:
1105                     ; 316 						if (uiInfo.remote_time[st] != buf[5]) {
1107  00be 7b02          	ld	a,(OFST+0,sp)
1108  00c0 5f            	clrw	x
1109  00c1 97            	ld	xl,a
1110  00c2 d6004d        	ld	a,(_uiInfo+77,x)
1111  00c5 1e03          	ldw	x,(OFST+1,sp)
1112  00c7 e105          	cp	a,(5,x)
1113  00c9 2717          	jreq	L543
1114                     ; 317 							k = 1;
1116  00cb a601          	ld	a,#1
1117  00cd 6b01          	ld	(OFST-1,sp),a
1118  00cf 2011          	jra	L543
1119  00d1               L162:
1120                     ; 320 					case RC_MODE_REPEAT:
1120                     ; 321 						if (uiInfo.remote_banb[st] != buf[5]) {
1122  00d1 7b02          	ld	a,(OFST+0,sp)
1123  00d3 5f            	clrw	x
1124  00d4 97            	ld	xl,a
1125  00d5 d60055        	ld	a,(_uiInfo+85,x)
1126  00d8 1e03          	ldw	x,(OFST+1,sp)
1127  00da e105          	cp	a,(5,x)
1128  00dc 2704          	jreq	L543
1129                     ; 322 							k = 1;
1131  00de a601          	ld	a,#1
1132  00e0 6b01          	ld	(OFST-1,sp),a
1133  00e2               L153:
1134  00e2               L543:
1135                     ; 328 			if (k == 1) {
1137  00e2 7b01          	ld	a,(OFST-1,sp)
1138  00e4 a101          	cp	a,#1
1139  00e6 2603          	jrne	L143
1140                     ; 329 				return;
1141  00e8               L64:
1144  00e8 5b04          	addw	sp,#4
1145  00ea 81            	ret
1146  00eb               L143:
1147                     ; 333 		rcSubDataInfo.mode_heat[st] = buf[1];
1149  00eb 7b02          	ld	a,(OFST+0,sp)
1150  00ed 5f            	clrw	x
1151  00ee 97            	ld	xl,a
1152  00ef 1603          	ldw	y,(OFST+1,sp)
1153  00f1 90e601        	ld	a,(1,y)
1154  00f4 d70025        	ld	(_rcSubDataInfo+16,x),a
1155                     ; 334 		rcSubDataInfo.cur_temp[st] = buf[2];
1157  00f7 7b02          	ld	a,(OFST+0,sp)
1158  00f9 5f            	clrw	x
1159  00fa 97            	ld	xl,a
1160  00fb 1603          	ldw	y,(OFST+1,sp)
1161  00fd 90e602        	ld	a,(2,y)
1162  0100 d70015        	ld	(_rcSubDataInfo,x),a
1163                     ; 336 		uiInfo.remote_mode[st] = buf[1];
1165  0103 7b02          	ld	a,(OFST+0,sp)
1166  0105 5f            	clrw	x
1167  0106 97            	ld	xl,a
1168  0107 1603          	ldw	y,(OFST+1,sp)
1169  0109 90e601        	ld	a,(1,y)
1170  010c d70045        	ld	(_uiInfo+69,x),a
1171                     ; 337 		uiInfo.tempCurr[st] = buf[2];
1173  010f 7b02          	ld	a,(OFST+0,sp)
1174  0111 5f            	clrw	x
1175  0112 97            	ld	xl,a
1176  0113 1603          	ldw	y,(OFST+1,sp)
1177  0115 90e602        	ld	a,(2,y)
1178  0118 d70035        	ld	(_uiInfo+53,x),a
1179                     ; 339 		switch (buf[1]) {
1181  011b 1e03          	ldw	x,(OFST+1,sp)
1182  011d e601          	ld	a,(1,x)
1184                     ; 355 				break;
1185  011f 4a            	dec	a
1186  0120 270a          	jreq	L362
1187  0122 a007          	sub	a,#7
1188  0124 2724          	jreq	L172
1189  0126 a008          	sub	a,#8
1190  0128 273a          	jreq	L372
1191  012a 2050          	jra	L563
1192  012c               L362:
1193                     ; 340 			case RC_MODE_HEAT:
1193                     ; 341 				rcSubDataInfo.set_temp[st] = buf[3];
1195  012c 7b02          	ld	a,(OFST+0,sp)
1196  012e 5f            	clrw	x
1197  012f 97            	ld	xl,a
1198  0130 1603          	ldw	y,(OFST+1,sp)
1199  0132 90e603        	ld	a,(3,y)
1200  0135 d7001d        	ld	(_rcSubDataInfo+8,x),a
1201                     ; 342 				uiInfo.tempSetup[st] = buf[3];
1203  0138 7b02          	ld	a,(OFST+0,sp)
1204  013a 5f            	clrw	x
1205  013b 97            	ld	xl,a
1206  013c 1603          	ldw	y,(OFST+1,sp)
1207  013e 90e603        	ld	a,(3,y)
1208  0141 d7003d        	ld	(_uiInfo+61,x),a
1209                     ; 343 				break;
1211  0144 2036          	jra	L563
1212  0146               L562:
1213                     ; 344 			case RC_MODE_OUT:
1213                     ; 345 				break;
1215  0146 2034          	jra	L563
1216  0148               L762:
1217                     ; 346 			case RC_MODE_STOP:
1217                     ; 347 				break;
1219  0148 2032          	jra	L563
1220  014a               L172:
1221                     ; 348 			case RC_MODE_RESERVE:
1221                     ; 349 				rcSubDataInfo.time[st] = buf[5];
1223  014a 7b02          	ld	a,(OFST+0,sp)
1224  014c 5f            	clrw	x
1225  014d 97            	ld	xl,a
1226  014e 1603          	ldw	y,(OFST+1,sp)
1227  0150 90e605        	ld	a,(5,y)
1228  0153 d70035        	ld	(_rcSubDataInfo+32,x),a
1229                     ; 350 				uiInfo.remote_time[st] = buf[5];
1231  0156 7b02          	ld	a,(OFST+0,sp)
1232  0158 5f            	clrw	x
1233  0159 97            	ld	xl,a
1234  015a 1603          	ldw	y,(OFST+1,sp)
1235  015c 90e605        	ld	a,(5,y)
1236  015f d7004d        	ld	(_uiInfo+77,x),a
1237                     ; 351 				break;
1239  0162 2018          	jra	L563
1240  0164               L372:
1241                     ; 352 			case RC_MODE_REPEAT:
1241                     ; 353 				rcSubDataInfo.banb[st] = buf[5];
1243  0164 7b02          	ld	a,(OFST+0,sp)
1244  0166 5f            	clrw	x
1245  0167 97            	ld	xl,a
1246  0168 1603          	ldw	y,(OFST+1,sp)
1247  016a 90e605        	ld	a,(5,y)
1248  016d d7003d        	ld	(_rcSubDataInfo+40,x),a
1249                     ; 354 				uiInfo.remote_banb[st] = buf[5];
1251  0170 7b02          	ld	a,(OFST+0,sp)
1252  0172 5f            	clrw	x
1253  0173 97            	ld	xl,a
1254  0174 1603          	ldw	y,(OFST+1,sp)
1255  0176 90e605        	ld	a,(5,y)
1256  0179 d70055        	ld	(_uiInfo+85,x),a
1257                     ; 355 				break;
1259  017c               L563:
1260                     ; 358 		disp_char(uiInfo.remote_mode[st]);
1262  017c 7b02          	ld	a,(OFST+0,sp)
1263  017e 5f            	clrw	x
1264  017f 97            	ld	xl,a
1265  0180 d60045        	ld	a,(_uiInfo+69,x)
1266  0183 cd0000        	call	_disp_char
1269  0186 2030          	jra	L763
1270  0188               L733:
1271                     ; 362 		rcSubDataInfo.mode_heat[st] = 0xFF;
1273  0188 7b02          	ld	a,(OFST+0,sp)
1274  018a 5f            	clrw	x
1275  018b 97            	ld	xl,a
1276  018c a6ff          	ld	a,#255
1277  018e d70025        	ld	(_rcSubDataInfo+16,x),a
1278                     ; 363 		rcSubDataInfo.cur_temp[st] = buf[2];
1280  0191 7b02          	ld	a,(OFST+0,sp)
1281  0193 5f            	clrw	x
1282  0194 97            	ld	xl,a
1283  0195 1603          	ldw	y,(OFST+1,sp)
1284  0197 90e602        	ld	a,(2,y)
1285  019a d70015        	ld	(_rcSubDataInfo,x),a
1286                     ; 364 		rcSubDataInfo.set_temp[st] = 0xFF;
1288  019d 7b02          	ld	a,(OFST+0,sp)
1289  019f 5f            	clrw	x
1290  01a0 97            	ld	xl,a
1291  01a1 a6ff          	ld	a,#255
1292  01a3 d7001d        	ld	(_rcSubDataInfo+8,x),a
1293                     ; 365 		rcSubDataInfo.time[st] = 0xFF;
1295  01a6 7b02          	ld	a,(OFST+0,sp)
1296  01a8 5f            	clrw	x
1297  01a9 97            	ld	xl,a
1298  01aa a6ff          	ld	a,#255
1299  01ac d70035        	ld	(_rcSubDataInfo+32,x),a
1300                     ; 366 		rcSubDataInfo.banb[st] = 0xFF;
1302  01af 7b02          	ld	a,(OFST+0,sp)
1303  01b1 5f            	clrw	x
1304  01b2 97            	ld	xl,a
1305  01b3 a6ff          	ld	a,#255
1306  01b5 d7003d        	ld	(_rcSubDataInfo+40,x),a
1307  01b8               L763:
1308                     ; 368 }
1310  01b8 ace800e8      	jpf	L64
1356                     ; 371 void rc_ptc_check_subrc(uint8_t *buf) {
1357                     .text:	section	.text,new
1358  0000               _rc_ptc_check_subrc:
1360  0000 89            	pushw	x
1361  0001 88            	push	a
1362       00000001      OFST:	set	1
1365                     ; 372 	uint8_t start = buf[0] & 0x0F;
1367  0002 f6            	ld	a,(x)
1368  0003 a40f          	and	a,#15
1369  0005 6b01          	ld	(OFST+0,sp),a
1370                     ; 374 	state_check = RC_STATE_NONE;
1372  0007 725f000b      	clr	_state_check
1373                     ; 376 	if (uiInfo.mode == SETTING_MODE_MASTER) {
1375  000b c60008        	ld	a,_uiInfo+8
1376  000e a101          	cp	a,#1
1377  0010 2707          	jreq	L45
1378                     ; 377 		return;
1380                     ; 380 	if (start != uiInfo.id) {
1382  0012 7b01          	ld	a,(OFST+0,sp)
1383  0014 c10004        	cp	a,_uiInfo+4
1384  0017 2703          	jreq	L314
1385                     ; 381 		return;
1386  0019               L45:
1389  0019 5b03          	addw	sp,#3
1390  001b 81            	ret
1391  001c               L314:
1392                     ; 384 	packet_changed = 1;	
1394  001c 35010005      	mov	_packet_changed,#1
1395                     ; 385 	_disp_mode2 = buf[1];
1397  0020 1e02          	ldw	x,(OFST+1,sp)
1398  0022 e601          	ld	a,(1,x)
1399  0024 c70000        	ld	__disp_mode2,a
1400                     ; 387 	if (_disp_mode2 == RC_MODE_HEAT) {
1402  0027 c60000        	ld	a,__disp_mode2
1403  002a a101          	cp	a,#1
1404  002c 2607          	jrne	L514
1405                     ; 388 		uiInfo.tSetup = buf[3];
1407  002e 1e02          	ldw	x,(OFST+1,sp)
1408  0030 e603          	ld	a,(3,x)
1409  0032 c7000e        	ld	_uiInfo+14,a
1410  0035               L514:
1411                     ; 391 	if (_disp_mode2 == RC_MODE_RESERVE) {
1413  0035 c60000        	ld	a,__disp_mode2
1414  0038 a108          	cp	a,#8
1415  003a 2609          	jrne	L714
1416                     ; 392 		uiInfo.reserve = buf[5];
1418  003c 1e02          	ldw	x,(OFST+1,sp)
1419  003e e605          	ld	a,(5,x)
1420  0040 c7000d        	ld	_uiInfo+13,a
1422  0043 200e          	jra	L124
1423  0045               L714:
1424                     ; 393 	} else if (_disp_mode2 == RC_MODE_REPEAT){
1426  0045 c60000        	ld	a,__disp_mode2
1427  0048 a110          	cp	a,#16
1428  004a 2607          	jrne	L124
1429                     ; 394 		uiInfo.repeat = buf[5];
1431  004c 1e02          	ldw	x,(OFST+1,sp)
1432  004e e605          	ld	a,(5,x)
1433  0050 c7000c        	ld	_uiInfo+12,a
1434  0053               L124:
1435                     ; 396 }
1437  0053 20c4          	jra	L45
1500                     ; 398 void rc_ptc_check_mirror(uint8_t *buf) {
1501                     .text:	section	.text,new
1502  0000               _rc_ptc_check_mirror:
1504  0000 89            	pushw	x
1505  0001 88            	push	a
1506       00000001      OFST:	set	1
1509                     ; 403 	state_check = RC_STATE_NONE;
1511  0002 725f000b      	clr	_state_check
1512                     ; 405 	if (uiInfo.mode != SETTING_MODE_MASTER) {
1514  0006 c60008        	ld	a,_uiInfo+8
1515  0009 a101          	cp	a,#1
1516  000b 2703          	jreq	L26
1517  000d cc0263        	jp	L06
1518  0010               L26:
1519                     ; 406 		return;
1521                     ; 409 	page = buf[0] & 0x0F;
1523  0010 1e02          	ldw	x,(OFST+1,sp)
1524  0012 f6            	ld	a,(x)
1525  0013 a40f          	and	a,#15
1526  0015 6b01          	ld	(OFST+0,sp),a
1527                     ; 410 	cur_mirror_page = page;
1529  0017 7b01          	ld	a,(OFST+0,sp)
1530  0019 c70006        	ld	_cur_mirror_page,a
1531                     ; 411 	state_check = RC_STATE_MIRROR;
1533  001c 3506000b      	mov	_state_check,#6
1534                     ; 413 	switch(page) {
1536  0020 7b01          	ld	a,(OFST+0,sp)
1538                     ; 494 			break;
1539  0022 4d            	tnz	a
1540  0023 2710          	jreq	L524
1541  0025 4a            	dec	a
1542  0026 2603          	jrne	L46
1543  0028 cc00d7        	jp	L724
1544  002b               L46:
1545  002b 4a            	dec	a
1546  002c 2603          	jrne	L66
1547  002e cc019f        	jp	L134
1548  0031               L66:
1549  0031 ac630263      	jpf	L364
1550  0035               L524:
1551                     ; 414 		case 0:
1551                     ; 415 			mode = (buf[6] & 0x80) >> 7;
1553  0035 1e02          	ldw	x,(OFST+1,sp)
1554  0037 e606          	ld	a,(6,x)
1555  0039 49            	rlc	a
1556  003a 4f            	clr	a
1557  003b 49            	rlc	a
1558  003c 6b01          	ld	(OFST+0,sp),a
1559                     ; 416 			if (mode == CNT_MODE_MAIN) {
1561  003e 0d01          	tnz	(OFST+0,sp)
1562  0040 2675          	jrne	L564
1563                     ; 417 				_boiler_type = (buf[1] & 0x80) >> 7;
1565  0042 1e02          	ldw	x,(OFST+1,sp)
1566  0044 e601          	ld	a,(1,x)
1567  0046 49            	rlc	a
1568  0047 4f            	clr	a
1569  0048 49            	rlc	a
1570  0049 c70000        	ld	__boiler_type,a
1571                     ; 418 				uiInfo.lpmType = (buf[1] & 0x0F);
1573  004c 1e02          	ldw	x,(OFST+1,sp)
1574  004e e601          	ld	a,(1,x)
1575  0050 a40f          	and	a,#15
1576  0052 c70013        	ld	_uiInfo+19,a
1577                     ; 419 				uiInfo.cnt = (buf[2] & 0x70) >> 4;
1579  0055 1e02          	ldw	x,(OFST+1,sp)
1580  0057 e602          	ld	a,(2,x)
1581  0059 4e            	swap	a
1582  005a a40f          	and	a,#15
1583  005c a407          	and	a,#7
1584  005e c70005        	ld	_uiInfo+5,a
1585                     ; 420 				uiInfo.valve = buf[2] & 0x0F;
1587  0061 1e02          	ldw	x,(OFST+1,sp)
1588  0063 e602          	ld	a,(2,x)
1589  0065 a40f          	and	a,#15
1590  0067 c7000a        	ld	_uiInfo+10,a
1591                     ; 421 				_boiler_water_shower = buf[3];
1593  006a 1e02          	ldw	x,(OFST+1,sp)
1594  006c e603          	ld	a,(3,x)
1595  006e c70000        	ld	__boiler_water_shower,a
1596                     ; 422 				uiInfo.houseCapa = buf[4];
1598  0071 1e02          	ldw	x,(OFST+1,sp)
1599  0073 e604          	ld	a,(4,x)
1600  0075 c70010        	ld	_uiInfo+16,a
1601                     ; 423 				_boiler_water_heat = buf[5] ;
1603  0078 1e02          	ldw	x,(OFST+1,sp)
1604  007a e605          	ld	a,(5,x)
1605  007c c70000        	ld	__boiler_water_heat,a
1606                     ; 424 				uiInfo.controlMode = mode;
1608  007f 7b01          	ld	a,(OFST+0,sp)
1609  0081 c70009        	ld	_uiInfo+9,a
1610                     ; 425 				uiInfo.subRCLock = (buf[6] & 0x40) >> 6 ;
1612  0084 1e02          	ldw	x,(OFST+1,sp)
1613  0086 e606          	ld	a,(6,x)
1614  0088 4e            	swap	a
1615  0089 44            	srl	a
1616  008a 44            	srl	a
1617  008b a403          	and	a,#3
1618  008d a401          	and	a,#1
1619  008f c7005d        	ld	_uiInfo+93,a
1620                     ; 426 				uiInfo.poType = (buf[6] & 0x30) >> 4;
1622  0092 1e02          	ldw	x,(OFST+1,sp)
1623  0094 e606          	ld	a,(6,x)
1624  0096 4e            	swap	a
1625  0097 a40f          	and	a,#15
1626  0099 a403          	and	a,#3
1627  009b c7000f        	ld	_uiInfo+15,a
1628                     ; 427 				uiInfo.cntlMode = (buf[6] & 0x08) >> 3;
1630  009e 1e02          	ldw	x,(OFST+1,sp)
1631  00a0 e606          	ld	a,(6,x)
1632  00a2 44            	srl	a
1633  00a3 44            	srl	a
1634  00a4 44            	srl	a
1635  00a5 a401          	and	a,#1
1636  00a7 c70003        	ld	_uiInfo+3,a
1637                     ; 428 				uiInfo.opMode = buf[6] & 0x07;
1639  00aa 1e02          	ldw	x,(OFST+1,sp)
1640  00ac e606          	ld	a,(6,x)
1641  00ae a407          	and	a,#7
1642  00b0 c70007        	ld	_uiInfo+7,a
1644  00b3 ac630263      	jpf	L364
1645  00b7               L564:
1646                     ; 430 				uiInfo.lpmType_sub = (buf[1] & 0x0F);
1648  00b7 1e02          	ldw	x,(OFST+1,sp)
1649  00b9 e601          	ld	a,(1,x)
1650  00bb a40f          	and	a,#15
1651  00bd c70014        	ld	_uiInfo+20,a
1652                     ; 431 				uiInfo.cnt_sub = (buf[2] & 0xF0) >> 4;
1654  00c0 1e02          	ldw	x,(OFST+1,sp)
1655  00c2 e602          	ld	a,(2,x)
1656  00c4 4e            	swap	a
1657  00c5 a40f          	and	a,#15
1658  00c7 c70006        	ld	_uiInfo+6,a
1659                     ; 432 				uiInfo.valve_sub = buf[2] & 0x0F;
1661  00ca 1e02          	ldw	x,(OFST+1,sp)
1662  00cc e602          	ld	a,(2,x)
1663  00ce a40f          	and	a,#15
1664  00d0 c7000b        	ld	_uiInfo+11,a
1665  00d3 ac630263      	jpf	L364
1666  00d7               L724:
1667                     ; 435 		case 1:
1667                     ; 436 			mode = (buf[1] & 0x80) >> 7;
1669  00d7 1e02          	ldw	x,(OFST+1,sp)
1670  00d9 e601          	ld	a,(1,x)
1671  00db 49            	rlc	a
1672  00dc 4f            	clr	a
1673  00dd 49            	rlc	a
1674  00de 6b01          	ld	(OFST+0,sp),a
1675                     ; 437 			if (mode == CNT_MODE_MAIN) {
1677  00e0 0d01          	tnz	(OFST+0,sp)
1678  00e2 264a          	jrne	L174
1679                     ; 438 				uiInfo.valve_rc[0] = (buf[1] & 0x70) >> 4;
1681  00e4 1e02          	ldw	x,(OFST+1,sp)
1682  00e6 e601          	ld	a,(1,x)
1683  00e8 4e            	swap	a
1684  00e9 a40f          	and	a,#15
1685  00eb a407          	and	a,#7
1686  00ed c7001d        	ld	_uiInfo+29,a
1687                     ; 439 				uiInfo.valve_rc[1] = buf[1] & 0x07;
1689  00f0 1e02          	ldw	x,(OFST+1,sp)
1690  00f2 e601          	ld	a,(1,x)
1691  00f4 a407          	and	a,#7
1692  00f6 c7001e        	ld	_uiInfo+30,a
1693                     ; 440 				uiInfo.valve_rc[2] = (buf[2] & 0x70) >> 4;
1695  00f9 1e02          	ldw	x,(OFST+1,sp)
1696  00fb e602          	ld	a,(2,x)
1697  00fd 4e            	swap	a
1698  00fe a40f          	and	a,#15
1699  0100 a407          	and	a,#7
1700  0102 c7001f        	ld	_uiInfo+31,a
1701                     ; 441 				uiInfo.valve_rc[3] = buf[2] & 0x07;
1703  0105 1e02          	ldw	x,(OFST+1,sp)
1704  0107 e602          	ld	a,(2,x)
1705  0109 a407          	and	a,#7
1706  010b c70020        	ld	_uiInfo+32,a
1707                     ; 443 				uiInfo.valve_len[0] = buf[3];
1709  010e 1e02          	ldw	x,(OFST+1,sp)
1710  0110 e603          	ld	a,(3,x)
1711  0112 c70015        	ld	_uiInfo+21,a
1712                     ; 444 				uiInfo.valve_len[1] = buf[4];
1714  0115 1e02          	ldw	x,(OFST+1,sp)
1715  0117 e604          	ld	a,(4,x)
1716  0119 c70016        	ld	_uiInfo+22,a
1717                     ; 445 				uiInfo.valve_len[2] = buf[5];
1719  011c 1e02          	ldw	x,(OFST+1,sp)
1720  011e e605          	ld	a,(5,x)
1721  0120 c70017        	ld	_uiInfo+23,a
1722                     ; 446 				uiInfo.valve_len[3] = buf[6];
1724  0123 1e02          	ldw	x,(OFST+1,sp)
1725  0125 e606          	ld	a,(6,x)
1726  0127 c70018        	ld	_uiInfo+24,a
1728  012a ac630263      	jpf	L364
1729  012e               L174:
1730                     ; 448 				uiInfo.valve_sub_rc[0] = (buf[1] & 0x70) >> 4;
1732  012e 1e02          	ldw	x,(OFST+1,sp)
1733  0130 e601          	ld	a,(1,x)
1734  0132 4e            	swap	a
1735  0133 a40f          	and	a,#15
1736  0135 a407          	and	a,#7
1737  0137 c7002d        	ld	_uiInfo+45,a
1738                     ; 449 				uiInfo.valve_sub_rc[1] = buf[1] & 0x07;
1740  013a 1e02          	ldw	x,(OFST+1,sp)
1741  013c e601          	ld	a,(1,x)
1742  013e a407          	and	a,#7
1743  0140 c7002e        	ld	_uiInfo+46,a
1744                     ; 450 				uiInfo.valve_sub_rc[2] = (buf[2] & 0x70) >> 4;
1746  0143 1e02          	ldw	x,(OFST+1,sp)
1747  0145 e602          	ld	a,(2,x)
1748  0147 4e            	swap	a
1749  0148 a40f          	and	a,#15
1750  014a a407          	and	a,#7
1751  014c c7002f        	ld	_uiInfo+47,a
1752                     ; 451 				uiInfo.valve_sub_rc[3] = buf[2] & 0x07;
1754  014f 1e02          	ldw	x,(OFST+1,sp)
1755  0151 e602          	ld	a,(2,x)
1756  0153 a407          	and	a,#7
1757  0155 c70030        	ld	_uiInfo+48,a
1758                     ; 453 				uiInfo.valve_sub_len[0] = buf[3];
1760  0158 1e02          	ldw	x,(OFST+1,sp)
1761  015a e603          	ld	a,(3,x)
1762  015c c70025        	ld	_uiInfo+37,a
1763                     ; 454 				uiInfo.valve_sub_len[1] = buf[4];
1765  015f 1e02          	ldw	x,(OFST+1,sp)
1766  0161 e604          	ld	a,(4,x)
1767  0163 c70026        	ld	_uiInfo+38,a
1768                     ; 455 				uiInfo.valve_sub_len[2] = buf[5];
1770  0166 1e02          	ldw	x,(OFST+1,sp)
1771  0168 e605          	ld	a,(5,x)
1772  016a c70027        	ld	_uiInfo+39,a
1773                     ; 456 				uiInfo.valve_sub_len[3] = buf[6];
1775  016d 1e02          	ldw	x,(OFST+1,sp)
1776  016f e606          	ld	a,(6,x)
1777  0171 c70028        	ld	_uiInfo+40,a
1778                     ; 458 				for (i = 0 ; i < 4 ; i++) {
1780  0174 0f01          	clr	(OFST+0,sp)
1781  0176               L574:
1782                     ; 459 					if (uiInfo.valve_sub_rc[i] == 0 && uiInfo.valve_sub_len[i] != 0) {
1784  0176 7b01          	ld	a,(OFST+0,sp)
1785  0178 5f            	clrw	x
1786  0179 97            	ld	xl,a
1787  017a 724d002d      	tnz	(_uiInfo+45,x)
1788  017e 2613          	jrne	L305
1790  0180 7b01          	ld	a,(OFST+0,sp)
1791  0182 5f            	clrw	x
1792  0183 97            	ld	xl,a
1793  0184 724d0025      	tnz	(_uiInfo+37,x)
1794  0188 2709          	jreq	L305
1795                     ; 460 						uiInfo.valve_sub_rc[i] = 8;
1797  018a 7b01          	ld	a,(OFST+0,sp)
1798  018c 5f            	clrw	x
1799  018d 97            	ld	xl,a
1800  018e a608          	ld	a,#8
1801  0190 d7002d        	ld	(_uiInfo+45,x),a
1802  0193               L305:
1803                     ; 458 				for (i = 0 ; i < 4 ; i++) {
1805  0193 0c01          	inc	(OFST+0,sp)
1808  0195 7b01          	ld	a,(OFST+0,sp)
1809  0197 a104          	cp	a,#4
1810  0199 25db          	jrult	L574
1811  019b ac630263      	jpf	L364
1812  019f               L134:
1813                     ; 465 		case 2:
1813                     ; 466 			mode = (buf[1] & 0x80) >> 7;
1815  019f 1e02          	ldw	x,(OFST+1,sp)
1816  01a1 e601          	ld	a,(1,x)
1817  01a3 49            	rlc	a
1818  01a4 4f            	clr	a
1819  01a5 49            	rlc	a
1820  01a6 6b01          	ld	(OFST+0,sp),a
1821                     ; 467 			if (mode == CNT_MODE_MAIN) {
1823  01a8 0d01          	tnz	(OFST+0,sp)
1824  01aa 2648          	jrne	L505
1825                     ; 468 				uiInfo.valve_rc[4] = (buf[1] & 0x70) >> 4;
1827  01ac 1e02          	ldw	x,(OFST+1,sp)
1828  01ae e601          	ld	a,(1,x)
1829  01b0 4e            	swap	a
1830  01b1 a40f          	and	a,#15
1831  01b3 a407          	and	a,#7
1832  01b5 c70021        	ld	_uiInfo+33,a
1833                     ; 469 				uiInfo.valve_rc[5] = buf[1] & 0x07;
1835  01b8 1e02          	ldw	x,(OFST+1,sp)
1836  01ba e601          	ld	a,(1,x)
1837  01bc a407          	and	a,#7
1838  01be c70022        	ld	_uiInfo+34,a
1839                     ; 470 				uiInfo.valve_rc[6] = (buf[2] & 0x70) >> 4;
1841  01c1 1e02          	ldw	x,(OFST+1,sp)
1842  01c3 e602          	ld	a,(2,x)
1843  01c5 4e            	swap	a
1844  01c6 a40f          	and	a,#15
1845  01c8 a407          	and	a,#7
1846  01ca c70023        	ld	_uiInfo+35,a
1847                     ; 471 				uiInfo.valve_rc[7] = buf[2] & 0x07;
1849  01cd 1e02          	ldw	x,(OFST+1,sp)
1850  01cf e602          	ld	a,(2,x)
1851  01d1 a407          	and	a,#7
1852  01d3 c70024        	ld	_uiInfo+36,a
1853                     ; 473 				uiInfo.valve_len[4] = buf[3];
1855  01d6 1e02          	ldw	x,(OFST+1,sp)
1856  01d8 e603          	ld	a,(3,x)
1857  01da c70019        	ld	_uiInfo+25,a
1858                     ; 474 				uiInfo.valve_len[5] = buf[4];
1860  01dd 1e02          	ldw	x,(OFST+1,sp)
1861  01df e604          	ld	a,(4,x)
1862  01e1 c7001a        	ld	_uiInfo+26,a
1863                     ; 475 				uiInfo.valve_len[6] = buf[5];
1865  01e4 1e02          	ldw	x,(OFST+1,sp)
1866  01e6 e605          	ld	a,(5,x)
1867  01e8 c7001b        	ld	_uiInfo+27,a
1868                     ; 476 				uiInfo.valve_len[7] = buf[6];
1870  01eb 1e02          	ldw	x,(OFST+1,sp)
1871  01ed e606          	ld	a,(6,x)
1872  01ef c7001c        	ld	_uiInfo+28,a
1874  01f2 206f          	jra	L364
1875  01f4               L505:
1876                     ; 478 				uiInfo.valve_sub_rc[4] = (buf[1] & 0x70) >> 4;
1878  01f4 1e02          	ldw	x,(OFST+1,sp)
1879  01f6 e601          	ld	a,(1,x)
1880  01f8 4e            	swap	a
1881  01f9 a40f          	and	a,#15
1882  01fb a407          	and	a,#7
1883  01fd c70031        	ld	_uiInfo+49,a
1884                     ; 479 				uiInfo.valve_sub_rc[5] = buf[1] & 0x07;
1886  0200 1e02          	ldw	x,(OFST+1,sp)
1887  0202 e601          	ld	a,(1,x)
1888  0204 a407          	and	a,#7
1889  0206 c70032        	ld	_uiInfo+50,a
1890                     ; 480 				uiInfo.valve_sub_rc[6] = (buf[2] & 0x70) >> 4;
1892  0209 1e02          	ldw	x,(OFST+1,sp)
1893  020b e602          	ld	a,(2,x)
1894  020d 4e            	swap	a
1895  020e a40f          	and	a,#15
1896  0210 a407          	and	a,#7
1897  0212 c70033        	ld	_uiInfo+51,a
1898                     ; 481 				uiInfo.valve_sub_rc[7] = buf[2] & 0x07;
1900  0215 1e02          	ldw	x,(OFST+1,sp)
1901  0217 e602          	ld	a,(2,x)
1902  0219 a407          	and	a,#7
1903  021b c70034        	ld	_uiInfo+52,a
1904                     ; 483 				uiInfo.valve_sub_len[4] = buf[3];
1906  021e 1e02          	ldw	x,(OFST+1,sp)
1907  0220 e603          	ld	a,(3,x)
1908  0222 c70029        	ld	_uiInfo+41,a
1909                     ; 484 				uiInfo.valve_sub_len[5] = buf[4];
1911  0225 1e02          	ldw	x,(OFST+1,sp)
1912  0227 e604          	ld	a,(4,x)
1913  0229 c7002a        	ld	_uiInfo+42,a
1914                     ; 485 				uiInfo.valve_sub_len[6] = buf[5];
1916  022c 1e02          	ldw	x,(OFST+1,sp)
1917  022e e605          	ld	a,(5,x)
1918  0230 c7002b        	ld	_uiInfo+43,a
1919                     ; 486 				uiInfo.valve_sub_len[7] = buf[6];
1921  0233 1e02          	ldw	x,(OFST+1,sp)
1922  0235 e606          	ld	a,(6,x)
1923  0237 c7002c        	ld	_uiInfo+44,a
1924                     ; 488 				for (i = 4 ; i < 8 ; i++) {
1926  023a a604          	ld	a,#4
1927  023c 6b01          	ld	(OFST+0,sp),a
1928  023e               L115:
1929                     ; 489 					if (uiInfo.valve_sub_rc[i] == 0 && uiInfo.valve_sub_len[i] != 0) {
1931  023e 7b01          	ld	a,(OFST+0,sp)
1932  0240 5f            	clrw	x
1933  0241 97            	ld	xl,a
1934  0242 724d002d      	tnz	(_uiInfo+45,x)
1935  0246 2613          	jrne	L715
1937  0248 7b01          	ld	a,(OFST+0,sp)
1938  024a 5f            	clrw	x
1939  024b 97            	ld	xl,a
1940  024c 724d0025      	tnz	(_uiInfo+37,x)
1941  0250 2709          	jreq	L715
1942                     ; 490 						uiInfo.valve_sub_rc[i] = 8;
1944  0252 7b01          	ld	a,(OFST+0,sp)
1945  0254 5f            	clrw	x
1946  0255 97            	ld	xl,a
1947  0256 a608          	ld	a,#8
1948  0258 d7002d        	ld	(_uiInfo+45,x),a
1949  025b               L715:
1950                     ; 488 				for (i = 4 ; i < 8 ; i++) {
1952  025b 0c01          	inc	(OFST+0,sp)
1955  025d 7b01          	ld	a,(OFST+0,sp)
1956  025f a108          	cp	a,#8
1957  0261 25db          	jrult	L115
1958  0263               L364:
1959                     ; 496 }
1960  0263               L06:
1963  0263 5b03          	addw	sp,#3
1964  0265 81            	ret
2013                     ; 498 void rc_ptc_check(uint8_t *buf) {
2014                     .text:	section	.text,new
2015  0000               _rc_ptc_check:
2017  0000 89            	pushw	x
2018  0001 88            	push	a
2019       00000001      OFST:	set	1
2022                     ; 500 	start = buf[0] & 0xF0;
2024  0002 f6            	ld	a,(x)
2025  0003 a4f0          	and	a,#240
2026  0005 6b01          	ld	(OFST+0,sp),a
2027                     ; 501 	switch(start) {
2029  0007 7b01          	ld	a,(OFST+0,sp)
2031                     ; 521 			break;
2032  0009 a020          	sub	a,#32
2033  000b 2738          	jreq	L135
2034  000d a010          	sub	a,#16
2035  000f 271f          	jreq	L325
2036  0011 a030          	sub	a,#48
2037  0013 2729          	jreq	L725
2038  0015 a010          	sub	a,#16
2039  0017 2710          	jreq	L125
2040  0019 a080          	sub	a,#128
2041  001b 271a          	jreq	L525
2042  001d               L335:
2043                     ; 517 		default:
2043                     ; 518 			state_check = RC_STATE_ERROR;
2045  001d 3504000b      	mov	_state_check,#4
2046                     ; 519 			disp_char(buf[0]);
2048  0021 1e02          	ldw	x,(OFST+1,sp)
2049  0023 f6            	ld	a,(x)
2050  0024 cd0000        	call	_disp_char
2052                     ; 521 			break;
2054  0027 2021          	jra	L755
2055  0029               L125:
2056                     ; 502 		case BYTE_START_CNT_NORMAL:
2056                     ; 503 			rc_ptc_check_normal(buf);
2058  0029 1e02          	ldw	x,(OFST+1,sp)
2059  002b cd0000        	call	_rc_ptc_check_normal
2061                     ; 504 			break;
2063  002e 201a          	jra	L755
2064  0030               L325:
2065                     ; 505 		case BYTE_START_CNT_SETTING:
2065                     ; 506 			rc_ptc_check_setting(buf);
2067  0030 1e02          	ldw	x,(OFST+1,sp)
2068  0032 cd0000        	call	_rc_ptc_check_setting
2070                     ; 507 			break;
2072  0035 2013          	jra	L755
2073  0037               L525:
2074                     ; 508 		case BYTE_START_RC_NORMAL:
2074                     ; 509 			rc_ptc_check_rc(buf);
2076  0037 1e02          	ldw	x,(OFST+1,sp)
2077  0039 cd0000        	call	_rc_ptc_check_rc
2079                     ; 510 			break;
2081  003c 200c          	jra	L755
2082  003e               L725:
2083                     ; 511 		case BYTE_START_RC_SUBRC:
2083                     ; 512 			rc_ptc_check_subrc(buf);
2085  003e 1e02          	ldw	x,(OFST+1,sp)
2086  0040 cd0000        	call	_rc_ptc_check_subrc
2088                     ; 513 			break;
2090  0043 2005          	jra	L755
2091  0045               L135:
2092                     ; 514 		case BYTE_START_CNT_MIRROR:
2092                     ; 515 			rc_ptc_check_mirror(buf);
2094  0045 1e02          	ldw	x,(OFST+1,sp)
2095  0047 cd0000        	call	_rc_ptc_check_mirror
2097                     ; 516 			break;
2099  004a               L755:
2100                     ; 523 }
2103  004a 5b03          	addw	sp,#3
2104  004c 81            	ret
2137                     ; 525 void setSettingChange(uint8_t ch) {
2138                     .text:	section	.text,new
2139  0000               _setSettingChange:
2143                     ; 526 	set_changed = ch;
2145  0000 c7000c        	ld	_set_changed,a
2146                     ; 527 }
2149  0003 81            	ret
2173                     ; 529 uint8_t getSettingChange(void) {
2174                     .text:	section	.text,new
2175  0000               _getSettingChange:
2179                     ; 530 	return set_changed;
2181  0000 c6000c        	ld	a,_set_changed
2184  0003 81            	ret
2208                     ; 533 uint8_t getState_check(void) {
2209                     .text:	section	.text,new
2210  0000               _getState_check:
2214                     ; 534 	return state_check;
2216  0000 c6000b        	ld	a,_state_check
2219  0003 81            	ret
2252                     ; 537 void setState_check(uint8_t st) {
2253                     .text:	section	.text,new
2254  0000               _setState_check:
2258                     ; 538 	state_check = st;
2260  0000 c7000b        	ld	_state_check,a
2261                     ; 539 }
2264  0003 81            	ret
2321                     ; 541 void makeChecksum(uint8_t *buf) {
2322                     .text:	section	.text,new
2323  0000               _makeChecksum:
2325  0000 89            	pushw	x
2326  0001 89            	pushw	x
2327       00000002      OFST:	set	2
2330                     ; 546 	s = 0;
2332  0002 0f01          	clr	(OFST-1,sp)
2333                     ; 547 	for (i = 0 ; i < 7 ; i++) {
2335  0004 0f02          	clr	(OFST+0,sp)
2336  0006               L556:
2337                     ; 548 		s += buf[i];
2339  0006 7b03          	ld	a,(OFST+1,sp)
2340  0008 97            	ld	xl,a
2341  0009 7b04          	ld	a,(OFST+2,sp)
2342  000b 1b02          	add	a,(OFST+0,sp)
2343  000d 2401          	jrnc	L401
2344  000f 5c            	incw	x
2345  0010               L401:
2346  0010 02            	rlwa	x,a
2347  0011 7b01          	ld	a,(OFST-1,sp)
2348  0013 fb            	add	a,(x)
2349  0014 6b01          	ld	(OFST-1,sp),a
2350                     ; 547 	for (i = 0 ; i < 7 ; i++) {
2352  0016 0c02          	inc	(OFST+0,sp)
2355  0018 7b02          	ld	a,(OFST+0,sp)
2356  001a a107          	cp	a,#7
2357  001c 25e8          	jrult	L556
2358                     ; 550 	buf[7] = s;
2360  001e 7b01          	ld	a,(OFST-1,sp)
2361  0020 1e03          	ldw	x,(OFST+1,sp)
2362  0022 e707          	ld	(7,x),a
2363                     ; 552 	for( j=0; j<8; j++ )
2365  0024 0f02          	clr	(OFST+0,sp)
2366  0026               L366:
2367                     ; 553 		disp_char(buf[j]);
2369  0026 7b03          	ld	a,(OFST+1,sp)
2370  0028 97            	ld	xl,a
2371  0029 7b04          	ld	a,(OFST+2,sp)
2372  002b 1b02          	add	a,(OFST+0,sp)
2373  002d 2401          	jrnc	L601
2374  002f 5c            	incw	x
2375  0030               L601:
2376  0030 02            	rlwa	x,a
2377  0031 f6            	ld	a,(x)
2378  0032 cd0000        	call	_disp_char
2380                     ; 552 	for( j=0; j<8; j++ )
2382  0035 0c02          	inc	(OFST+0,sp)
2385  0037 7b02          	ld	a,(OFST+0,sp)
2386  0039 a108          	cp	a,#8
2387  003b 25e9          	jrult	L366
2388                     ; 556 }
2391  003d 5b04          	addw	sp,#4
2392  003f 81            	ret
2447                     ; 560 void rc_ptc_make_baseSetting(uint8_t *buf, uint8_t page, uint8_t mode) {
2448                     .text:	section	.text,new
2449  0000               _rc_ptc_make_baseSetting:
2451  0000 89            	pushw	x
2452  0001 5203          	subw	sp,#3
2453       00000003      OFST:	set	3
2456                     ; 561 	switch (page) {
2458  0003 7b08          	ld	a,(OFST+5,sp)
2460                     ; 656 		break;
2461  0005 4d            	tnz	a
2462  0006 2710          	jreq	L176
2463  0008 4a            	dec	a
2464  0009 2603          	jrne	L211
2465  000b cc012f        	jp	L376
2466  000e               L211:
2467  000e 4a            	dec	a
2468  000f 2603          	jrne	L411
2469  0011 cc01ff        	jp	L576
2470  0014               L411:
2471  0014 acc902c9      	jpf	L327
2472  0018               L176:
2473                     ; 562 		case 0:
2473                     ; 563 			if (mode == CNT_MODE_MAIN) {
2475  0018 0d09          	tnz	(OFST+6,sp)
2476  001a 2703          	jreq	L611
2477  001c cc00ae        	jp	L527
2478  001f               L611:
2479                     ; 564 				buf[1] = (_boiler_type << 7)
2479                     ; 565 									| ((uiInfo.plc & 0x07) << 4)
2479                     ; 566 									| (uiInfo.lpmType);
2481  001f c60064        	ld	a,_uiInfo+100
2482  0022 a407          	and	a,#7
2483  0024 97            	ld	xl,a
2484  0025 a610          	ld	a,#16
2485  0027 42            	mul	x,a
2486  0028 9f            	ld	a,xl
2487  0029 6b03          	ld	(OFST+0,sp),a
2488  002b c60000        	ld	a,__boiler_type
2489  002e 97            	ld	xl,a
2490  002f a680          	ld	a,#128
2491  0031 42            	mul	x,a
2492  0032 9f            	ld	a,xl
2493  0033 1a03          	or	a,(OFST+0,sp)
2494  0035 ca0013        	or	a,_uiInfo+19
2495  0038 1e04          	ldw	x,(OFST+1,sp)
2496  003a e701          	ld	(1,x),a
2497                     ; 567 				buf[2] = ((uiInfo.relay & 0x01) << 7) 
2497                     ; 568 									| ((uiInfo.cnt & 0x07) << 4) 
2497                     ; 569 									| (uiInfo.valve & 0x0F);
2499  003c c6000a        	ld	a,_uiInfo+10
2500  003f a40f          	and	a,#15
2501  0041 6b03          	ld	(OFST+0,sp),a
2502  0043 c60005        	ld	a,_uiInfo+5
2503  0046 a407          	and	a,#7
2504  0048 97            	ld	xl,a
2505  0049 a610          	ld	a,#16
2506  004b 42            	mul	x,a
2507  004c 9f            	ld	a,xl
2508  004d 6b02          	ld	(OFST-1,sp),a
2509  004f c6005e        	ld	a,_uiInfo+94
2510  0052 a401          	and	a,#1
2511  0054 97            	ld	xl,a
2512  0055 a680          	ld	a,#128
2513  0057 42            	mul	x,a
2514  0058 9f            	ld	a,xl
2515  0059 1a02          	or	a,(OFST-1,sp)
2516  005b 1a03          	or	a,(OFST+0,sp)
2517  005d 1e04          	ldw	x,(OFST+1,sp)
2518  005f e702          	ld	(2,x),a
2519                     ; 570 				buf[3] = _boiler_water_shower;
2521  0061 1e04          	ldw	x,(OFST+1,sp)
2522  0063 c60000        	ld	a,__boiler_water_shower
2523  0066 e703          	ld	(3,x),a
2524                     ; 571 				buf[4] = uiInfo.houseCapa;
2526  0068 1e04          	ldw	x,(OFST+1,sp)
2527  006a c60010        	ld	a,_uiInfo+16
2528  006d e704          	ld	(4,x),a
2529                     ; 572 				buf[5] = _boiler_water_heat;
2531  006f 1e04          	ldw	x,(OFST+1,sp)
2532  0071 c60000        	ld	a,__boiler_water_heat
2533  0074 e705          	ld	(5,x),a
2534                     ; 573 				buf[6] = 	(mode << 7) 
2534                     ; 574 									| (uiInfo.subRCLock << 6) 
2534                     ; 575 									| ((uiInfo.poType & 0x01) << 4) 
2534                     ; 576 #if defined (_RC_SETUP_)
2534                     ; 577 									| ((__cntlMode & 0x01) << 3) 
2534                     ; 578 #else
2534                     ; 579 									| ((uiInfo.cntlMode & 0x01) << 3) 
2534                     ; 580 #endif
2534                     ; 581 									| uiInfo.opMode;
2536  0076 c60000        	ld	a,___cntlMode
2537  0079 a401          	and	a,#1
2538  007b 48            	sll	a
2539  007c 48            	sll	a
2540  007d 48            	sll	a
2541  007e 6b03          	ld	(OFST+0,sp),a
2542  0080 c6000f        	ld	a,_uiInfo+15
2543  0083 a401          	and	a,#1
2544  0085 97            	ld	xl,a
2545  0086 a610          	ld	a,#16
2546  0088 42            	mul	x,a
2547  0089 9f            	ld	a,xl
2548  008a 6b02          	ld	(OFST-1,sp),a
2549  008c c6005d        	ld	a,_uiInfo+93
2550  008f 97            	ld	xl,a
2551  0090 a640          	ld	a,#64
2552  0092 42            	mul	x,a
2553  0093 9f            	ld	a,xl
2554  0094 6b01          	ld	(OFST-2,sp),a
2555  0096 7b09          	ld	a,(OFST+6,sp)
2556  0098 97            	ld	xl,a
2557  0099 a680          	ld	a,#128
2558  009b 42            	mul	x,a
2559  009c 9f            	ld	a,xl
2560  009d 1a01          	or	a,(OFST-2,sp)
2561  009f 1a02          	or	a,(OFST-1,sp)
2562  00a1 1a03          	or	a,(OFST+0,sp)
2563  00a3 ca0007        	or	a,_uiInfo+7
2564  00a6 1e04          	ldw	x,(OFST+1,sp)
2565  00a8 e706          	ld	(6,x),a
2567  00aa acc902c9      	jpf	L327
2568  00ae               L527:
2569                     ; 583 				buf[1] = (_boiler_type << 7) 
2569                     ; 584 									| (uiInfo.lpmType_sub);
2571  00ae c60000        	ld	a,__boiler_type
2572  00b1 97            	ld	xl,a
2573  00b2 a680          	ld	a,#128
2574  00b4 42            	mul	x,a
2575  00b5 9f            	ld	a,xl
2576  00b6 ca0014        	or	a,_uiInfo+20
2577  00b9 1e04          	ldw	x,(OFST+1,sp)
2578  00bb e701          	ld	(1,x),a
2579                     ; 585 				buf[2] = ((uiInfo.relay & 0x01) << 7) 
2579                     ; 586 									| ((uiInfo.cnt_sub & 0x07) << 4) 
2579                     ; 587 									| (uiInfo.valve_sub & 0x0F);
2581  00bd c6000b        	ld	a,_uiInfo+11
2582  00c0 a40f          	and	a,#15
2583  00c2 6b03          	ld	(OFST+0,sp),a
2584  00c4 c60006        	ld	a,_uiInfo+6
2585  00c7 a407          	and	a,#7
2586  00c9 97            	ld	xl,a
2587  00ca a610          	ld	a,#16
2588  00cc 42            	mul	x,a
2589  00cd 9f            	ld	a,xl
2590  00ce 6b02          	ld	(OFST-1,sp),a
2591  00d0 c6005e        	ld	a,_uiInfo+94
2592  00d3 a401          	and	a,#1
2593  00d5 97            	ld	xl,a
2594  00d6 a680          	ld	a,#128
2595  00d8 42            	mul	x,a
2596  00d9 9f            	ld	a,xl
2597  00da 1a02          	or	a,(OFST-1,sp)
2598  00dc 1a03          	or	a,(OFST+0,sp)
2599  00de 1e04          	ldw	x,(OFST+1,sp)
2600  00e0 e702          	ld	(2,x),a
2601                     ; 588 				buf[3] = _boiler_water_shower;
2603  00e2 1e04          	ldw	x,(OFST+1,sp)
2604  00e4 c60000        	ld	a,__boiler_water_shower
2605  00e7 e703          	ld	(3,x),a
2606                     ; 589 				buf[4] = uiInfo.houseCapa;
2608  00e9 1e04          	ldw	x,(OFST+1,sp)
2609  00eb c60010        	ld	a,_uiInfo+16
2610  00ee e704          	ld	(4,x),a
2611                     ; 590 				buf[5] = _boiler_water_heat;
2613  00f0 1e04          	ldw	x,(OFST+1,sp)
2614  00f2 c60000        	ld	a,__boiler_water_heat
2615  00f5 e705          	ld	(5,x),a
2616                     ; 591 				buf[6] = 	(mode << 7) 
2616                     ; 592 									| (uiInfo.subRCLock << 6) 
2616                     ; 593 									| ((uiInfo.poType & 0x01) << 4) 
2616                     ; 594 									| ((uiInfo.cntlMode & 0x01) << 3) 
2616                     ; 595 									| uiInfo.opMode;
2618  00f7 c60003        	ld	a,_uiInfo+3
2619  00fa a401          	and	a,#1
2620  00fc 48            	sll	a
2621  00fd 48            	sll	a
2622  00fe 48            	sll	a
2623  00ff 6b03          	ld	(OFST+0,sp),a
2624  0101 c6000f        	ld	a,_uiInfo+15
2625  0104 a401          	and	a,#1
2626  0106 97            	ld	xl,a
2627  0107 a610          	ld	a,#16
2628  0109 42            	mul	x,a
2629  010a 9f            	ld	a,xl
2630  010b 6b02          	ld	(OFST-1,sp),a
2631  010d c6005d        	ld	a,_uiInfo+93
2632  0110 97            	ld	xl,a
2633  0111 a640          	ld	a,#64
2634  0113 42            	mul	x,a
2635  0114 9f            	ld	a,xl
2636  0115 6b01          	ld	(OFST-2,sp),a
2637  0117 7b09          	ld	a,(OFST+6,sp)
2638  0119 97            	ld	xl,a
2639  011a a680          	ld	a,#128
2640  011c 42            	mul	x,a
2641  011d 9f            	ld	a,xl
2642  011e 1a01          	or	a,(OFST-2,sp)
2643  0120 1a02          	or	a,(OFST-1,sp)
2644  0122 1a03          	or	a,(OFST+0,sp)
2645  0124 ca0007        	or	a,_uiInfo+7
2646  0127 1e04          	ldw	x,(OFST+1,sp)
2647  0129 e706          	ld	(6,x),a
2648  012b acc902c9      	jpf	L327
2649  012f               L376:
2650                     ; 598 		case 1:
2650                     ; 599 			if (mode == CNT_MODE_MAIN) {
2652  012f 0d09          	tnz	(OFST+6,sp)
2653  0131 2666          	jrne	L137
2654                     ; 600 				buf[1] = mode << 7 
2654                     ; 601 							 | (uiInfo.valve_rc[0] << 4)
2654                     ; 602 							 | mode << 3 
2654                     ; 603 							 | uiInfo.valve_rc[1];
2656  0133 7b09          	ld	a,(OFST+6,sp)
2657  0135 48            	sll	a
2658  0136 48            	sll	a
2659  0137 48            	sll	a
2660  0138 6b03          	ld	(OFST+0,sp),a
2661  013a c6001d        	ld	a,_uiInfo+29
2662  013d 97            	ld	xl,a
2663  013e a610          	ld	a,#16
2664  0140 42            	mul	x,a
2665  0141 9f            	ld	a,xl
2666  0142 6b02          	ld	(OFST-1,sp),a
2667  0144 7b09          	ld	a,(OFST+6,sp)
2668  0146 97            	ld	xl,a
2669  0147 a680          	ld	a,#128
2670  0149 42            	mul	x,a
2671  014a 9f            	ld	a,xl
2672  014b 1a02          	or	a,(OFST-1,sp)
2673  014d 1a03          	or	a,(OFST+0,sp)
2674  014f ca001e        	or	a,_uiInfo+30
2675  0152 1e04          	ldw	x,(OFST+1,sp)
2676  0154 e701          	ld	(1,x),a
2677                     ; 604 				buf[2] = mode << 7 
2677                     ; 605 							 | (uiInfo.valve_rc[2] << 4)
2677                     ; 606 							 | mode << 3 
2677                     ; 607 							 | uiInfo.valve_rc[3];
2679  0156 7b09          	ld	a,(OFST+6,sp)
2680  0158 48            	sll	a
2681  0159 48            	sll	a
2682  015a 48            	sll	a
2683  015b 6b03          	ld	(OFST+0,sp),a
2684  015d c6001f        	ld	a,_uiInfo+31
2685  0160 97            	ld	xl,a
2686  0161 a610          	ld	a,#16
2687  0163 42            	mul	x,a
2688  0164 9f            	ld	a,xl
2689  0165 6b02          	ld	(OFST-1,sp),a
2690  0167 7b09          	ld	a,(OFST+6,sp)
2691  0169 97            	ld	xl,a
2692  016a a680          	ld	a,#128
2693  016c 42            	mul	x,a
2694  016d 9f            	ld	a,xl
2695  016e 1a02          	or	a,(OFST-1,sp)
2696  0170 1a03          	or	a,(OFST+0,sp)
2697  0172 ca0020        	or	a,_uiInfo+32
2698  0175 1e04          	ldw	x,(OFST+1,sp)
2699  0177 e702          	ld	(2,x),a
2700                     ; 608 				buf[3] = uiInfo.valve_len[0];
2702  0179 1e04          	ldw	x,(OFST+1,sp)
2703  017b c60015        	ld	a,_uiInfo+21
2704  017e e703          	ld	(3,x),a
2705                     ; 609 				buf[4] = uiInfo.valve_len[1];
2707  0180 1e04          	ldw	x,(OFST+1,sp)
2708  0182 c60016        	ld	a,_uiInfo+22
2709  0185 e704          	ld	(4,x),a
2710                     ; 610 				buf[5] = uiInfo.valve_len[2];
2712  0187 1e04          	ldw	x,(OFST+1,sp)
2713  0189 c60017        	ld	a,_uiInfo+23
2714  018c e705          	ld	(5,x),a
2715                     ; 611 				buf[6] = uiInfo.valve_len[3];
2717  018e 1e04          	ldw	x,(OFST+1,sp)
2718  0190 c60018        	ld	a,_uiInfo+24
2719  0193 e706          	ld	(6,x),a
2721  0195 acc902c9      	jpf	L327
2722  0199               L137:
2723                     ; 613 				buf[1] = mode << 7 
2723                     ; 614 							 | (uiInfo.valve_sub_rc[0] << 4)
2723                     ; 615 							 | mode << 3 
2723                     ; 616 							 | uiInfo.valve_sub_rc[1];
2725  0199 7b09          	ld	a,(OFST+6,sp)
2726  019b 48            	sll	a
2727  019c 48            	sll	a
2728  019d 48            	sll	a
2729  019e 6b03          	ld	(OFST+0,sp),a
2730  01a0 c6002d        	ld	a,_uiInfo+45
2731  01a3 97            	ld	xl,a
2732  01a4 a610          	ld	a,#16
2733  01a6 42            	mul	x,a
2734  01a7 9f            	ld	a,xl
2735  01a8 6b02          	ld	(OFST-1,sp),a
2736  01aa 7b09          	ld	a,(OFST+6,sp)
2737  01ac 97            	ld	xl,a
2738  01ad a680          	ld	a,#128
2739  01af 42            	mul	x,a
2740  01b0 9f            	ld	a,xl
2741  01b1 1a02          	or	a,(OFST-1,sp)
2742  01b3 1a03          	or	a,(OFST+0,sp)
2743  01b5 ca002e        	or	a,_uiInfo+46
2744  01b8 1e04          	ldw	x,(OFST+1,sp)
2745  01ba e701          	ld	(1,x),a
2746                     ; 617 				buf[2] = mode << 7 
2746                     ; 618 							 | (uiInfo.valve_sub_rc[2] << 4)
2746                     ; 619 							 | mode << 3 
2746                     ; 620 							 | uiInfo.valve_sub_rc[3];
2748  01bc 7b09          	ld	a,(OFST+6,sp)
2749  01be 48            	sll	a
2750  01bf 48            	sll	a
2751  01c0 48            	sll	a
2752  01c1 6b03          	ld	(OFST+0,sp),a
2753  01c3 c6002f        	ld	a,_uiInfo+47
2754  01c6 97            	ld	xl,a
2755  01c7 a610          	ld	a,#16
2756  01c9 42            	mul	x,a
2757  01ca 9f            	ld	a,xl
2758  01cb 6b02          	ld	(OFST-1,sp),a
2759  01cd 7b09          	ld	a,(OFST+6,sp)
2760  01cf 97            	ld	xl,a
2761  01d0 a680          	ld	a,#128
2762  01d2 42            	mul	x,a
2763  01d3 9f            	ld	a,xl
2764  01d4 1a02          	or	a,(OFST-1,sp)
2765  01d6 1a03          	or	a,(OFST+0,sp)
2766  01d8 ca0030        	or	a,_uiInfo+48
2767  01db 1e04          	ldw	x,(OFST+1,sp)
2768  01dd e702          	ld	(2,x),a
2769                     ; 621 				buf[3] = uiInfo.valve_sub_len[0];
2771  01df 1e04          	ldw	x,(OFST+1,sp)
2772  01e1 c60025        	ld	a,_uiInfo+37
2773  01e4 e703          	ld	(3,x),a
2774                     ; 622 				buf[4] = uiInfo.valve_sub_len[1];
2776  01e6 1e04          	ldw	x,(OFST+1,sp)
2777  01e8 c60026        	ld	a,_uiInfo+38
2778  01eb e704          	ld	(4,x),a
2779                     ; 623 				buf[5] = uiInfo.valve_sub_len[2];
2781  01ed 1e04          	ldw	x,(OFST+1,sp)
2782  01ef c60027        	ld	a,_uiInfo+39
2783  01f2 e705          	ld	(5,x),a
2784                     ; 624 				buf[6] = uiInfo.valve_sub_len[3];
2786  01f4 1e04          	ldw	x,(OFST+1,sp)
2787  01f6 c60028        	ld	a,_uiInfo+40
2788  01f9 e706          	ld	(6,x),a
2789  01fb acc902c9      	jpf	L327
2790  01ff               L576:
2791                     ; 627 		case 2:
2791                     ; 628 			if (mode == CNT_MODE_MAIN) {
2793  01ff 0d09          	tnz	(OFST+6,sp)
2794  0201 2664          	jrne	L537
2795                     ; 629 				buf[1] = mode << 7 
2795                     ; 630 							 | (uiInfo.valve_rc[4] << 4) 
2795                     ; 631 							 | mode << 3 
2795                     ; 632 							 | uiInfo.valve_rc[5];
2797  0203 7b09          	ld	a,(OFST+6,sp)
2798  0205 48            	sll	a
2799  0206 48            	sll	a
2800  0207 48            	sll	a
2801  0208 6b03          	ld	(OFST+0,sp),a
2802  020a c60021        	ld	a,_uiInfo+33
2803  020d 97            	ld	xl,a
2804  020e a610          	ld	a,#16
2805  0210 42            	mul	x,a
2806  0211 9f            	ld	a,xl
2807  0212 6b02          	ld	(OFST-1,sp),a
2808  0214 7b09          	ld	a,(OFST+6,sp)
2809  0216 97            	ld	xl,a
2810  0217 a680          	ld	a,#128
2811  0219 42            	mul	x,a
2812  021a 9f            	ld	a,xl
2813  021b 1a02          	or	a,(OFST-1,sp)
2814  021d 1a03          	or	a,(OFST+0,sp)
2815  021f ca0022        	or	a,_uiInfo+34
2816  0222 1e04          	ldw	x,(OFST+1,sp)
2817  0224 e701          	ld	(1,x),a
2818                     ; 633 				buf[2] = mode << 7 
2818                     ; 634 							 | (uiInfo.valve_rc[6] << 4) 
2818                     ; 635 							 | mode << 3 
2818                     ; 636 							 | uiInfo.valve_rc[7];
2820  0226 7b09          	ld	a,(OFST+6,sp)
2821  0228 48            	sll	a
2822  0229 48            	sll	a
2823  022a 48            	sll	a
2824  022b 6b03          	ld	(OFST+0,sp),a
2825  022d c60023        	ld	a,_uiInfo+35
2826  0230 97            	ld	xl,a
2827  0231 a610          	ld	a,#16
2828  0233 42            	mul	x,a
2829  0234 9f            	ld	a,xl
2830  0235 6b02          	ld	(OFST-1,sp),a
2831  0237 7b09          	ld	a,(OFST+6,sp)
2832  0239 97            	ld	xl,a
2833  023a a680          	ld	a,#128
2834  023c 42            	mul	x,a
2835  023d 9f            	ld	a,xl
2836  023e 1a02          	or	a,(OFST-1,sp)
2837  0240 1a03          	or	a,(OFST+0,sp)
2838  0242 ca0024        	or	a,_uiInfo+36
2839  0245 1e04          	ldw	x,(OFST+1,sp)
2840  0247 e702          	ld	(2,x),a
2841                     ; 637 				buf[3] = uiInfo.valve_len[4];
2843  0249 1e04          	ldw	x,(OFST+1,sp)
2844  024b c60019        	ld	a,_uiInfo+25
2845  024e e703          	ld	(3,x),a
2846                     ; 638 				buf[4] = uiInfo.valve_len[5];
2848  0250 1e04          	ldw	x,(OFST+1,sp)
2849  0252 c6001a        	ld	a,_uiInfo+26
2850  0255 e704          	ld	(4,x),a
2851                     ; 639 				buf[5] = uiInfo.valve_len[6];
2853  0257 1e04          	ldw	x,(OFST+1,sp)
2854  0259 c6001b        	ld	a,_uiInfo+27
2855  025c e705          	ld	(5,x),a
2856                     ; 640 				buf[6] = uiInfo.valve_len[7];
2858  025e 1e04          	ldw	x,(OFST+1,sp)
2859  0260 c6001c        	ld	a,_uiInfo+28
2860  0263 e706          	ld	(6,x),a
2862  0265 2062          	jra	L327
2863  0267               L537:
2864                     ; 642 				buf[1] = mode << 7 
2864                     ; 643 							 | (uiInfo.valve_sub_rc[4] << 4) 
2864                     ; 644 							 | mode << 3 
2864                     ; 645 							 | uiInfo.valve_sub_rc[5];
2866  0267 7b09          	ld	a,(OFST+6,sp)
2867  0269 48            	sll	a
2868  026a 48            	sll	a
2869  026b 48            	sll	a
2870  026c 6b03          	ld	(OFST+0,sp),a
2871  026e c60031        	ld	a,_uiInfo+49
2872  0271 97            	ld	xl,a
2873  0272 a610          	ld	a,#16
2874  0274 42            	mul	x,a
2875  0275 9f            	ld	a,xl
2876  0276 6b02          	ld	(OFST-1,sp),a
2877  0278 7b09          	ld	a,(OFST+6,sp)
2878  027a 97            	ld	xl,a
2879  027b a680          	ld	a,#128
2880  027d 42            	mul	x,a
2881  027e 9f            	ld	a,xl
2882  027f 1a02          	or	a,(OFST-1,sp)
2883  0281 1a03          	or	a,(OFST+0,sp)
2884  0283 ca0032        	or	a,_uiInfo+50
2885  0286 1e04          	ldw	x,(OFST+1,sp)
2886  0288 e701          	ld	(1,x),a
2887                     ; 646 				buf[2] = mode << 7 
2887                     ; 647 							 | (uiInfo.valve_sub_rc[6] << 4) 
2887                     ; 648 							 | mode << 3 
2887                     ; 649 							 | uiInfo.valve_sub_rc[7];
2889  028a 7b09          	ld	a,(OFST+6,sp)
2890  028c 48            	sll	a
2891  028d 48            	sll	a
2892  028e 48            	sll	a
2893  028f 6b03          	ld	(OFST+0,sp),a
2894  0291 c60033        	ld	a,_uiInfo+51
2895  0294 97            	ld	xl,a
2896  0295 a610          	ld	a,#16
2897  0297 42            	mul	x,a
2898  0298 9f            	ld	a,xl
2899  0299 6b02          	ld	(OFST-1,sp),a
2900  029b 7b09          	ld	a,(OFST+6,sp)
2901  029d 97            	ld	xl,a
2902  029e a680          	ld	a,#128
2903  02a0 42            	mul	x,a
2904  02a1 9f            	ld	a,xl
2905  02a2 1a02          	or	a,(OFST-1,sp)
2906  02a4 1a03          	or	a,(OFST+0,sp)
2907  02a6 ca0034        	or	a,_uiInfo+52
2908  02a9 1e04          	ldw	x,(OFST+1,sp)
2909  02ab e702          	ld	(2,x),a
2910                     ; 650 				buf[3] = uiInfo.valve_sub_len[4];
2912  02ad 1e04          	ldw	x,(OFST+1,sp)
2913  02af c60029        	ld	a,_uiInfo+41
2914  02b2 e703          	ld	(3,x),a
2915                     ; 651 				buf[4] = uiInfo.valve_sub_len[5];
2917  02b4 1e04          	ldw	x,(OFST+1,sp)
2918  02b6 c6002a        	ld	a,_uiInfo+42
2919  02b9 e704          	ld	(4,x),a
2920                     ; 652 				buf[5] = uiInfo.valve_sub_len[6];
2922  02bb 1e04          	ldw	x,(OFST+1,sp)
2923  02bd c6002b        	ld	a,_uiInfo+43
2924  02c0 e705          	ld	(5,x),a
2925                     ; 653 				buf[6] = uiInfo.valve_sub_len[7];
2927  02c2 1e04          	ldw	x,(OFST+1,sp)
2928  02c4 c6002c        	ld	a,_uiInfo+44
2929  02c7 e706          	ld	(6,x),a
2930  02c9               L327:
2931                     ; 658 }
2934  02c9 5b05          	addw	sp,#5
2935  02cb 81            	ret
2982                     ; 661 void rc_ptc_make_setting(uint8_t *buf) {
2983                     .text:	section	.text,new
2984  0000               _rc_ptc_make_setting:
2986  0000 89            	pushw	x
2987  0001 88            	push	a
2988       00000001      OFST:	set	1
2991                     ; 663 	uint8_t mode = uiInfo.controlMode;
2993  0002 c60009        	ld	a,_uiInfo+9
2994  0005 6b01          	ld	(OFST+0,sp),a
2995                     ; 665 	buf[0] = BYTE_START_RC_SETTING | cur_set_page;
2997  0007 c60007        	ld	a,_cur_set_page
2998  000a aa50          	or	a,#80
2999  000c 1e02          	ldw	x,(OFST+1,sp)
3000  000e f7            	ld	(x),a
3001                     ; 667 	rc_ptc_make_baseSetting(buf, cur_set_page, mode);
3003  000f 7b01          	ld	a,(OFST+0,sp)
3004  0011 88            	push	a
3005  0012 3b0007        	push	_cur_set_page
3006  0015 1e04          	ldw	x,(OFST+3,sp)
3007  0017 cd0000        	call	_rc_ptc_make_baseSetting
3009  001a 85            	popw	x
3010                     ; 669 	makeChecksum(buf);
3012  001b 1e02          	ldw	x,(OFST+1,sp)
3013  001d cd0000        	call	_makeChecksum
3015                     ; 670 }
3018  0020 5b03          	addw	sp,#3
3019  0022 81            	ret
3065                     ; 673 void rc_ptc_make_normal(uint8_t *buf) {
3066                     .text:	section	.text,new
3067  0000               _rc_ptc_make_normal:
3069  0000 89            	pushw	x
3070       00000000      OFST:	set	0
3073                     ; 674 	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
3075  0001 c60004        	ld	a,_uiInfo+4
3076  0004 aaf0          	or	a,#240
3077  0006 1e01          	ldw	x,(OFST+1,sp)
3078  0008 f7            	ld	(x),a
3079                     ; 675 	buf[1] = _disp_mode2;
3081  0009 1e01          	ldw	x,(OFST+1,sp)
3082  000b c60000        	ld	a,__disp_mode2
3083  000e e701          	ld	(1,x),a
3084                     ; 676 	buf[2] = uiInfo.tCurr;
3086  0010 1e01          	ldw	x,(OFST+1,sp)
3087  0012 c60002        	ld	a,_uiInfo+2
3088  0015 e702          	ld	(2,x),a
3089                     ; 677 	buf[3] = 0x00;
3091  0017 1e01          	ldw	x,(OFST+1,sp)
3092  0019 6f03          	clr	(3,x)
3093                     ; 678 	buf[4] = 0x00;
3095  001b 1e01          	ldw	x,(OFST+1,sp)
3096  001d 6f04          	clr	(4,x)
3097                     ; 679 	buf[5] = 0x00;
3099  001f 1e01          	ldw	x,(OFST+1,sp)
3100  0021 6f05          	clr	(5,x)
3101                     ; 680 	buf[6] = __boiler_shower[6];  // 온수모드 
3103  0023 1e01          	ldw	x,(OFST+1,sp)
3104  0025 c60006        	ld	a,___boiler_shower+6
3105  0028 e706          	ld	(6,x),a
3106                     ; 682 	switch(buf[1]) {
3108  002a 1e01          	ldw	x,(OFST+1,sp)
3109  002c e601          	ld	a,(1,x)
3111                     ; 702 		default:
3111                     ; 703 			break;
3112  002e 4a            	dec	a
3113  002f 270d          	jreq	L167
3114  0031 4a            	dec	a
3115  0032 2713          	jreq	L367
3116  0034 a006          	sub	a,#6
3117  0036 272f          	jreq	L177
3118  0038 a008          	sub	a,#8
3119  003a 2716          	jreq	L767
3120  003c 2030          	jra	L5101
3121  003e               L167:
3122                     ; 683 		case RC_MODE_HEAT:
3122                     ; 684 			buf[3] = uiInfo.tSetup;
3124  003e 1e01          	ldw	x,(OFST+1,sp)
3125  0040 c6000e        	ld	a,_uiInfo+14
3126  0043 e703          	ld	(3,x),a
3127                     ; 685 			break;
3129  0045 2027          	jra	L5101
3130  0047               L367:
3131                     ; 686 		case RC_MODE_OUT:
3131                     ; 687 			buf[4] = dr_mode_out;
3133  0047 1e01          	ldw	x,(OFST+1,sp)
3134  0049 c60002        	ld	a,_dr_mode_out
3135  004c e704          	ld	(4,x),a
3136                     ; 688 			break;
3138  004e 201e          	jra	L5101
3139  0050               L567:
3140                     ; 689 		case RC_MODE_STOP:
3140                     ; 690 			break;
3142  0050 201c          	jra	L5101
3143  0052               L767:
3144                     ; 691 		case RC_MODE_REPEAT:
3144                     ; 692 			if(_timFlag == 0) {
3146  0052 725d0000      	tnz	__timFlag
3147  0056 2606          	jrne	L7101
3148                     ; 693 				buf[3] = MAX_REPEAT_TEMP;
3150  0058 1e01          	ldw	x,(OFST+1,sp)
3151  005a a650          	ld	a,#80
3152  005c e703          	ld	(3,x),a
3153  005e               L7101:
3154                     ; 696 			buf[5] = uiInfo.repeat;
3156  005e 1e01          	ldw	x,(OFST+1,sp)
3157  0060 c6000c        	ld	a,_uiInfo+12
3158  0063 e705          	ld	(5,x),a
3159                     ; 698 			break;
3161  0065 2007          	jra	L5101
3162  0067               L177:
3163                     ; 699 		case RC_MODE_RESERVE:
3163                     ; 700 			buf[5] = uiInfo.reserve;
3165  0067 1e01          	ldw	x,(OFST+1,sp)
3166  0069 c6000d        	ld	a,_uiInfo+13
3167  006c e705          	ld	(5,x),a
3168                     ; 701 			break;
3170  006e               L377:
3171                     ; 702 		default:
3171                     ; 703 			break;
3173  006e               L5101:
3174                     ; 706 	makeChecksum(buf);
3176  006e 1e01          	ldw	x,(OFST+1,sp)
3177  0070 cd0000        	call	_makeChecksum
3179                     ; 708 	if (disp_mode_preview != _disp_mode2){
3181  0073 c60002        	ld	a,_disp_mode_preview
3182  0076 c10000        	cp	a,__disp_mode2
3183  0079 2733          	jreq	L1201
3184                     ; 709 		if (uiInfo.mode == SETTING_MODE_SUB) {
3186  007b 725d0008      	tnz	_uiInfo+8
3187  007f 261b          	jrne	L3201
3188                     ; 710 			if (_disp_mode2 != RC_MODE_OUT) {
3190  0081 c60000        	ld	a,__disp_mode2
3191  0084 a102          	cp	a,#2
3192  0086 2726          	jreq	L1201
3193                     ; 711 				UPDATE_BIT(BIT_DISPMODE);
3195  0088 72160000      	bset	__updateBit,#3
3198  008c 5500000000    	mov	__updateTimer,___timer1s
3201  0091 35050000      	mov	__updateCount,#5
3202                     ; 712 				disp_mode_preview = _disp_mode2;
3205  0095 5500000002    	mov	_disp_mode_preview,__disp_mode2
3206  009a 2012          	jra	L1201
3207  009c               L3201:
3208                     ; 715 			UPDATE_BIT(BIT_DISPMODE);
3210  009c 72160000      	bset	__updateBit,#3
3213  00a0 5500000000    	mov	__updateTimer,___timer1s
3216  00a5 35050000      	mov	__updateCount,#5
3217                     ; 716 			disp_mode_preview = _disp_mode2;
3220  00a9 5500000002    	mov	_disp_mode_preview,__disp_mode2
3221  00ae               L1201:
3222                     ; 719 }
3225  00ae 85            	popw	x
3226  00af 81            	ret
3278                     ; 722 uint8_t rc_ptc_check_subRC(void) {
3279                     .text:	section	.text,new
3280  0000               _rc_ptc_check_subRC:
3282  0000 89            	pushw	x
3283       00000002      OFST:	set	2
3286                     ; 727 	if (_remote == 1) {
3288  0001 c60000        	ld	a,__remote
3289  0004 a101          	cp	a,#1
3290  0006 2604          	jrne	L1601
3291                     ; 728 		return 0xFF;
3293  0008 a6ff          	ld	a,#255
3296  000a 85            	popw	x
3297  000b 81            	ret
3298  000c               L1601:
3299                     ; 731 	ch = 0;
3301  000c 0f01          	clr	(OFST-1,sp)
3302                     ; 732 	if (rcSubDataInfo.mode_heat[uiInfo.id - 1] != 0xFF) {
3304  000e c60004        	ld	a,_uiInfo+4
3305  0011 5f            	clrw	x
3306  0012 97            	ld	xl,a
3307  0013 5a            	decw	x
3308  0014 d60025        	ld	a,(_rcSubDataInfo+16,x)
3309  0017 a1ff          	cp	a,#255
3310  0019 2704          	jreq	L3601
3311                     ; 733 		ch = 1;
3313  001b a601          	ld	a,#1
3314  001d 6b01          	ld	(OFST-1,sp),a
3315  001f               L3601:
3316                     ; 736 	rcSubDataInfo.mode_heat[uiInfo.id - 1] = _disp_mode2;
3318  001f c60004        	ld	a,_uiInfo+4
3319  0022 5f            	clrw	x
3320  0023 97            	ld	xl,a
3321  0024 5a            	decw	x
3322  0025 c60000        	ld	a,__disp_mode2
3323  0028 d70025        	ld	(_rcSubDataInfo+16,x),a
3324                     ; 737 	rcSubDataInfo.cur_temp[uiInfo.id - 1] = uiInfo.tCurr;
3326  002b c60004        	ld	a,_uiInfo+4
3327  002e 5f            	clrw	x
3328  002f 97            	ld	xl,a
3329  0030 5a            	decw	x
3330  0031 c60002        	ld	a,_uiInfo+2
3331  0034 d70015        	ld	(_rcSubDataInfo,x),a
3332                     ; 738 	rcSubDataInfo.set_temp[uiInfo.id - 1] = uiInfo.tSetup;
3334  0037 c60004        	ld	a,_uiInfo+4
3335  003a 5f            	clrw	x
3336  003b 97            	ld	xl,a
3337  003c 5a            	decw	x
3338  003d c6000e        	ld	a,_uiInfo+14
3339  0040 d7001d        	ld	(_rcSubDataInfo+8,x),a
3340                     ; 739 	rcSubDataInfo.time[uiInfo.id - 1] = uiInfo.reserve;
3342  0043 c60004        	ld	a,_uiInfo+4
3343  0046 5f            	clrw	x
3344  0047 97            	ld	xl,a
3345  0048 5a            	decw	x
3346  0049 c6000d        	ld	a,_uiInfo+13
3347  004c d70035        	ld	(_rcSubDataInfo+32,x),a
3348                     ; 740 	rcSubDataInfo.banb[uiInfo.id - 1] = uiInfo.repeat;
3350  004f c60004        	ld	a,_uiInfo+4
3351  0052 5f            	clrw	x
3352  0053 97            	ld	xl,a
3353  0054 5a            	decw	x
3354  0055 c6000c        	ld	a,_uiInfo+12
3355  0058 d7003d        	ld	(_rcSubDataInfo+40,x),a
3356                     ; 742 	uiInfo.remote_mode[uiInfo.id - 1] = _disp_mode2;
3358  005b c60004        	ld	a,_uiInfo+4
3359  005e 5f            	clrw	x
3360  005f 97            	ld	xl,a
3361  0060 5a            	decw	x
3362  0061 c60000        	ld	a,__disp_mode2
3363  0064 d70045        	ld	(_uiInfo+69,x),a
3364                     ; 743 	uiInfo.tempCurr[uiInfo.id - 1] = uiInfo.tCurr;
3366  0067 c60004        	ld	a,_uiInfo+4
3367  006a 5f            	clrw	x
3368  006b 97            	ld	xl,a
3369  006c 5a            	decw	x
3370  006d c60002        	ld	a,_uiInfo+2
3371  0070 d70035        	ld	(_uiInfo+53,x),a
3372                     ; 744 	uiInfo.tempSetup[uiInfo.id - 1] = uiInfo.tSetup;
3374  0073 c60004        	ld	a,_uiInfo+4
3375  0076 5f            	clrw	x
3376  0077 97            	ld	xl,a
3377  0078 5a            	decw	x
3378  0079 c6000e        	ld	a,_uiInfo+14
3379  007c d7003d        	ld	(_uiInfo+61,x),a
3380                     ; 745 	uiInfo.remote_time[uiInfo.id - 1] = uiInfo.reserve;
3382  007f c60004        	ld	a,_uiInfo+4
3383  0082 5f            	clrw	x
3384  0083 97            	ld	xl,a
3385  0084 5a            	decw	x
3386  0085 c6000d        	ld	a,_uiInfo+13
3387  0088 d7004d        	ld	(_uiInfo+77,x),a
3388                     ; 746 	uiInfo.remote_banb[uiInfo.id - 1] = uiInfo.repeat;
3390  008b c60004        	ld	a,_uiInfo+4
3391  008e 5f            	clrw	x
3392  008f 97            	ld	xl,a
3393  0090 5a            	decw	x
3394  0091 c6000c        	ld	a,_uiInfo+12
3395  0094 d70055        	ld	(_uiInfo+85,x),a
3396                     ; 748 	if (ch == 0) {
3398  0097 0d01          	tnz	(OFST-1,sp)
3399  0099 2604          	jrne	L5601
3400                     ; 750 		return 0xFF;
3402  009b a6ff          	ld	a,#255
3405  009d 85            	popw	x
3406  009e 81            	ret
3407  009f               L5601:
3408                     ; 753 	num = 0xFF;
3410  009f a6ff          	ld	a,#255
3411  00a1 6b01          	ld	(OFST-1,sp),a
3412                     ; 754 	for (i = 0 ; i < 8 ; i++) {
3414  00a3 0f02          	clr	(OFST+0,sp)
3415  00a5               L7601:
3416                     ; 755 		if (rcSubDataInfo.set_temp[i] == 0xAA) {
3418  00a5 7b02          	ld	a,(OFST+0,sp)
3419  00a7 5f            	clrw	x
3420  00a8 97            	ld	xl,a
3421  00a9 d6001d        	ld	a,(_rcSubDataInfo+8,x)
3422  00ac a1aa          	cp	a,#170
3423  00ae 2778          	jreq	L1701
3424                     ; 756 			continue;
3426                     ; 759 		if (uiInfo.remote_mode[i] != rcSubDataInfo.mode_heat[i]) {
3428  00b0 7b02          	ld	a,(OFST+0,sp)
3429  00b2 5f            	clrw	x
3430  00b3 97            	ld	xl,a
3431  00b4 7b02          	ld	a,(OFST+0,sp)
3432  00b6 905f          	clrw	y
3433  00b8 9097          	ld	yl,a
3434  00ba 90d60045      	ld	a,(_uiInfo+69,y)
3435  00be d10025        	cp	a,(_rcSubDataInfo+16,x)
3436  00c1 2706          	jreq	L7701
3437                     ; 760 			num = i;
3439  00c3 7b02          	ld	a,(OFST+0,sp)
3440  00c5 6b01          	ld	(OFST-1,sp),a
3441                     ; 761 			break;
3443  00c7 206a          	jra	L3701
3444  00c9               L7701:
3445                     ; 764 		switch (rcSubDataInfo.mode_heat[i]) {
3447  00c9 7b02          	ld	a,(OFST+0,sp)
3448  00cb 5f            	clrw	x
3449  00cc 97            	ld	xl,a
3450  00cd d60025        	ld	a,(_rcSubDataInfo+16,x)
3452                     ; 782 				break;
3453  00d0 4a            	dec	a
3454  00d1 270a          	jreq	L1301
3455  00d3 a007          	sub	a,#7
3456  00d5 273a          	jreq	L7301
3457  00d7 a008          	sub	a,#8
3458  00d9 271d          	jreq	L5301
3459  00db 204b          	jra	L1701
3460  00dd               L1301:
3461                     ; 765 			case RC_MODE_HEAT:
3461                     ; 766 				if (uiInfo.tempSetup[i] != rcSubDataInfo.set_temp[i]) {
3463  00dd 7b02          	ld	a,(OFST+0,sp)
3464  00df 5f            	clrw	x
3465  00e0 97            	ld	xl,a
3466  00e1 7b02          	ld	a,(OFST+0,sp)
3467  00e3 905f          	clrw	y
3468  00e5 9097          	ld	yl,a
3469  00e7 90d6003d      	ld	a,(_uiInfo+61,y)
3470  00eb d1001d        	cp	a,(_rcSubDataInfo+8,x)
3471  00ee 2738          	jreq	L1701
3472                     ; 767 					num = i;
3474  00f0 7b02          	ld	a,(OFST+0,sp)
3475  00f2 6b01          	ld	(OFST-1,sp),a
3476  00f4 2032          	jra	L1701
3477  00f6               L3301:
3478                     ; 770 			case RC_MODE_OUT:
3478                     ; 771 			case RC_MODE_STOP:
3478                     ; 772 				break;
3480  00f6 2030          	jra	L1701
3481  00f8               L5301:
3482                     ; 773 			case RC_MODE_REPEAT:
3482                     ; 774 				if (uiInfo.remote_banb[i] != rcSubDataInfo.banb[i]) {
3484  00f8 7b02          	ld	a,(OFST+0,sp)
3485  00fa 5f            	clrw	x
3486  00fb 97            	ld	xl,a
3487  00fc 7b02          	ld	a,(OFST+0,sp)
3488  00fe 905f          	clrw	y
3489  0100 9097          	ld	yl,a
3490  0102 90d60055      	ld	a,(_uiInfo+85,y)
3491  0106 d1003d        	cp	a,(_rcSubDataInfo+40,x)
3492  0109 271d          	jreq	L1701
3493                     ; 775 					num = i;
3495  010b 7b02          	ld	a,(OFST+0,sp)
3496  010d 6b01          	ld	(OFST-1,sp),a
3497  010f 2017          	jra	L1701
3498  0111               L7301:
3499                     ; 778 			case RC_MODE_RESERVE:
3499                     ; 779 				if (uiInfo.remote_time[i] != rcSubDataInfo.time[i]) {
3501  0111 7b02          	ld	a,(OFST+0,sp)
3502  0113 5f            	clrw	x
3503  0114 97            	ld	xl,a
3504  0115 7b02          	ld	a,(OFST+0,sp)
3505  0117 905f          	clrw	y
3506  0119 9097          	ld	yl,a
3507  011b 90d6004d      	ld	a,(_uiInfo+77,y)
3508  011f d10035        	cp	a,(_rcSubDataInfo+32,x)
3509  0122 2704          	jreq	L1701
3510                     ; 780 					num = i;
3512  0124 7b02          	ld	a,(OFST+0,sp)
3513  0126 6b01          	ld	(OFST-1,sp),a
3514  0128               L3011:
3515  0128               L1701:
3516                     ; 754 	for (i = 0 ; i < 8 ; i++) {
3518  0128 0c02          	inc	(OFST+0,sp)
3521  012a 7b02          	ld	a,(OFST+0,sp)
3522  012c a108          	cp	a,#8
3523  012e 2403cc00a5    	jrult	L7601
3524  0133               L3701:
3525                     ; 786 	if (num == 0xFF) {
3527  0133 7b01          	ld	a,(OFST-1,sp)
3528  0135 a1ff          	cp	a,#255
3529  0137 260c          	jrne	L3111
3530                     ; 787 		ret_count = MAX_REPEAT_ERROR_COUNT;
3532  0139 35050001      	mov	_ret_count,#5
3533                     ; 788 		cur_src = 0;
3535  013d 725f0000      	clr	_cur_src
3536                     ; 789 		return num;
3538  0141 7b01          	ld	a,(OFST-1,sp)
3540  0143 2058          	jra	L621
3541  0145               L3111:
3542                     ; 792 	if (cur_src == num) {
3544  0145 c60000        	ld	a,_cur_src
3545  0148 1101          	cp	a,(OFST-1,sp)
3546  014a 2646          	jrne	L5111
3547                     ; 793 		ret_count--;
3549  014c 725a0001      	dec	_ret_count
3550                     ; 795 		if (ret_count == 0) {
3552  0150 725d0001      	tnz	_ret_count
3553  0154 2645          	jrne	L1211
3554                     ; 796 			rcSubDataInfo.mode_heat[num] = uiInfo.remote_mode[num];
3556  0156 7b01          	ld	a,(OFST-1,sp)
3557  0158 5f            	clrw	x
3558  0159 97            	ld	xl,a
3559  015a d60045        	ld	a,(_uiInfo+69,x)
3560  015d d70025        	ld	(_rcSubDataInfo+16,x),a
3561                     ; 797 			rcSubDataInfo.cur_temp[num] = uiInfo.tempCurr[num];
3563  0160 7b01          	ld	a,(OFST-1,sp)
3564  0162 5f            	clrw	x
3565  0163 97            	ld	xl,a
3566  0164 d60035        	ld	a,(_uiInfo+53,x)
3567  0167 d70015        	ld	(_rcSubDataInfo,x),a
3568                     ; 798 			rcSubDataInfo.set_temp[num] = uiInfo.tempSetup[num];
3570  016a 7b01          	ld	a,(OFST-1,sp)
3571  016c 5f            	clrw	x
3572  016d 97            	ld	xl,a
3573  016e d6003d        	ld	a,(_uiInfo+61,x)
3574  0171 d7001d        	ld	(_rcSubDataInfo+8,x),a
3575                     ; 799 			rcSubDataInfo.time[num] = uiInfo.remote_time[num];
3577  0174 7b01          	ld	a,(OFST-1,sp)
3578  0176 5f            	clrw	x
3579  0177 97            	ld	xl,a
3580  0178 d6004d        	ld	a,(_uiInfo+77,x)
3581  017b d70035        	ld	(_rcSubDataInfo+32,x),a
3582                     ; 800 			rcSubDataInfo.banb[num] = uiInfo.remote_banb[num];
3584  017e 7b01          	ld	a,(OFST-1,sp)
3585  0180 5f            	clrw	x
3586  0181 97            	ld	xl,a
3587  0182 d60055        	ld	a,(_uiInfo+85,x)
3588  0185 d7003d        	ld	(_rcSubDataInfo+40,x),a
3589                     ; 802 			ret_count = MAX_REPEAT_ERROR_COUNT;
3591  0188 35050001      	mov	_ret_count,#5
3592                     ; 803 			num = 0xFF;
3594  018c a6ff          	ld	a,#255
3595  018e 6b01          	ld	(OFST-1,sp),a
3596  0190 2009          	jra	L1211
3597  0192               L5111:
3598                     ; 806 		cur_src = num;
3600  0192 7b01          	ld	a,(OFST-1,sp)
3601  0194 c70000        	ld	_cur_src,a
3602                     ; 807 		ret_count = MAX_REPEAT_ERROR_COUNT;
3604  0197 35050001      	mov	_ret_count,#5
3605  019b               L1211:
3606                     ; 810 	return num;
3608  019b 7b01          	ld	a,(OFST-1,sp)
3610  019d               L621:
3612  019d 85            	popw	x
3613  019e 81            	ret
3657                     ; 814 void rc_ptc_make_subRC(uint8_t *buf, uint8_t num) {
3658                     .text:	section	.text,new
3659  0000               _rc_ptc_make_subRC:
3661  0000 89            	pushw	x
3662       00000000      OFST:	set	0
3665                     ; 815 	buf[0] = BYTE_START_RC_SUBRC | num + 1;
3667  0001 7b05          	ld	a,(OFST+5,sp)
3668  0003 4c            	inc	a
3669  0004 aa60          	or	a,#96
3670  0006 1e01          	ldw	x,(OFST+1,sp)
3671  0008 f7            	ld	(x),a
3672                     ; 816 	buf[1] = uiInfo.remote_mode[num];
3674  0009 7b05          	ld	a,(OFST+5,sp)
3675  000b 5f            	clrw	x
3676  000c 97            	ld	xl,a
3677  000d d60045        	ld	a,(_uiInfo+69,x)
3678  0010 1e01          	ldw	x,(OFST+1,sp)
3679  0012 e701          	ld	(1,x),a
3680                     ; 817 	buf[2] = 0x00;
3682  0014 1e01          	ldw	x,(OFST+1,sp)
3683  0016 6f02          	clr	(2,x)
3684                     ; 818 	if (uiInfo.remote_mode[num] == RC_MODE_HEAT) {
3686  0018 7b05          	ld	a,(OFST+5,sp)
3687  001a 5f            	clrw	x
3688  001b 97            	ld	xl,a
3689  001c d60045        	ld	a,(_uiInfo+69,x)
3690  001f a101          	cp	a,#1
3691  0021 260d          	jrne	L3411
3692                     ; 819 		buf[3] = uiInfo.tempSetup[num];
3694  0023 7b05          	ld	a,(OFST+5,sp)
3695  0025 5f            	clrw	x
3696  0026 97            	ld	xl,a
3697  0027 d6003d        	ld	a,(_uiInfo+61,x)
3698  002a 1e01          	ldw	x,(OFST+1,sp)
3699  002c e703          	ld	(3,x),a
3701  002e 2004          	jra	L5411
3702  0030               L3411:
3703                     ; 821 		buf[3] = 0x00;
3705  0030 1e01          	ldw	x,(OFST+1,sp)
3706  0032 6f03          	clr	(3,x)
3707  0034               L5411:
3708                     ; 824 	buf[4] = 0x00;
3710  0034 1e01          	ldw	x,(OFST+1,sp)
3711  0036 6f04          	clr	(4,x)
3712                     ; 826 	if (uiInfo.remote_mode[num] == RC_MODE_REPEAT) {
3714  0038 7b05          	ld	a,(OFST+5,sp)
3715  003a 5f            	clrw	x
3716  003b 97            	ld	xl,a
3717  003c d60045        	ld	a,(_uiInfo+69,x)
3718  003f a110          	cp	a,#16
3719  0041 260d          	jrne	L7411
3720                     ; 827 		buf[5] = uiInfo.remote_banb[num];
3722  0043 7b05          	ld	a,(OFST+5,sp)
3723  0045 5f            	clrw	x
3724  0046 97            	ld	xl,a
3725  0047 d60055        	ld	a,(_uiInfo+85,x)
3726  004a 1e01          	ldw	x,(OFST+1,sp)
3727  004c e705          	ld	(5,x),a
3729  004e 201c          	jra	L1511
3730  0050               L7411:
3731                     ; 828 	} else if(uiInfo.remote_mode[num] == RC_MODE_RESERVE){
3733  0050 7b05          	ld	a,(OFST+5,sp)
3734  0052 5f            	clrw	x
3735  0053 97            	ld	xl,a
3736  0054 d60045        	ld	a,(_uiInfo+69,x)
3737  0057 a108          	cp	a,#8
3738  0059 260d          	jrne	L3511
3739                     ; 829 		buf[5] = uiInfo.remote_time[num];
3741  005b 7b05          	ld	a,(OFST+5,sp)
3742  005d 5f            	clrw	x
3743  005e 97            	ld	xl,a
3744  005f d6004d        	ld	a,(_uiInfo+77,x)
3745  0062 1e01          	ldw	x,(OFST+1,sp)
3746  0064 e705          	ld	(5,x),a
3748  0066 2004          	jra	L1511
3749  0068               L3511:
3750                     ; 831 		buf[5] = 0x00;
3752  0068 1e01          	ldw	x,(OFST+1,sp)
3753  006a 6f05          	clr	(5,x)
3754  006c               L1511:
3755                     ; 834 	buf[6] = 0x00;
3757  006c 1e01          	ldw	x,(OFST+1,sp)
3758  006e 6f06          	clr	(6,x)
3759                     ; 836 	makeChecksum(buf);
3761  0070 1e01          	ldw	x,(OFST+1,sp)
3762  0072 cd0000        	call	_makeChecksum
3764                     ; 837 }
3767  0075 85            	popw	x
3768  0076 81            	ret
3807                     ; 839 void rc_ptc_make_error(uint8_t *buf) {
3808                     .text:	section	.text,new
3809  0000               _rc_ptc_make_error:
3811  0000 89            	pushw	x
3812       00000000      OFST:	set	0
3815                     ; 840 	buf[0] = BYTE_START_RC_ERROR | uiInfo.id;
3817  0001 c60004        	ld	a,_uiInfo+4
3818  0004 aae0          	or	a,#224
3819  0006 1e01          	ldw	x,(OFST+1,sp)
3820  0008 f7            	ld	(x),a
3821                     ; 841 	buf[1] = error;
3823  0009 1e01          	ldw	x,(OFST+1,sp)
3824  000b c6000a        	ld	a,_error
3825  000e e701          	ld	(1,x),a
3826                     ; 842 	buf[2] = mode_recover;
3828  0010 1e01          	ldw	x,(OFST+1,sp)
3829  0012 c6000f        	ld	a,_mode_recover
3830  0015 e702          	ld	(2,x),a
3831                     ; 843 	buf[3] = 0x00;
3833  0017 1e01          	ldw	x,(OFST+1,sp)
3834  0019 6f03          	clr	(3,x)
3835                     ; 844 	buf[4] = 0x00;
3837  001b 1e01          	ldw	x,(OFST+1,sp)
3838  001d 6f04          	clr	(4,x)
3839                     ; 845 	buf[5] = 0x00;
3841  001f 1e01          	ldw	x,(OFST+1,sp)
3842  0021 6f05          	clr	(5,x)
3843                     ; 846 	buf[6] = 0x00;
3845  0023 1e01          	ldw	x,(OFST+1,sp)
3846  0025 6f06          	clr	(6,x)
3847                     ; 848 	makeChecksum(buf);
3849  0027 1e01          	ldw	x,(OFST+1,sp)
3850  0029 cd0000        	call	_makeChecksum
3852                     ; 849 }
3855  002c 85            	popw	x
3856  002d 81            	ret
3893                     ; 851 void rc_ptc_make_command(uint8_t *buf) {
3894                     .text:	section	.text,new
3895  0000               _rc_ptc_make_command:
3897  0000 89            	pushw	x
3898       00000000      OFST:	set	0
3901                     ; 852 	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
3903  0001 c60004        	ld	a,_uiInfo+4
3904  0004 aaf0          	or	a,#240
3905  0006 1e01          	ldw	x,(OFST+1,sp)
3906  0008 f7            	ld	(x),a
3907                     ; 853 	buf[1] = 0x20;
3909  0009 1e01          	ldw	x,(OFST+1,sp)
3910  000b a620          	ld	a,#32
3911  000d e701          	ld	(1,x),a
3912                     ; 854 	buf[2] = 0x00;
3914  000f 1e01          	ldw	x,(OFST+1,sp)
3915  0011 6f02          	clr	(2,x)
3916                     ; 855 	buf[3] = 0x00;
3918  0013 1e01          	ldw	x,(OFST+1,sp)
3919  0015 6f03          	clr	(3,x)
3920                     ; 856 	buf[4] = 0x00;
3922  0017 1e01          	ldw	x,(OFST+1,sp)
3923  0019 6f04          	clr	(4,x)
3924                     ; 857 	buf[5] = 0x00;
3926  001b 1e01          	ldw	x,(OFST+1,sp)
3927  001d 6f05          	clr	(5,x)
3928                     ; 858 	buf[6] = 0x00;
3930  001f 1e01          	ldw	x,(OFST+1,sp)
3931  0021 6f06          	clr	(6,x)
3932                     ; 859 }
3935  0023 85            	popw	x
3936  0024 81            	ret
3988                     ; 869 void rc_ptc_make_command_packet(uint8_t *buf, uint8_t cmd, uint8_t p1)
3988                     ; 870 {
3989                     .text:	section	.text,new
3990  0000               _rc_ptc_make_command_packet:
3992  0000 89            	pushw	x
3993       00000000      OFST:	set	0
3996                     ; 871 	rc_ptc_make_command(buf);
3998  0001 cd0000        	call	_rc_ptc_make_command
4000                     ; 872 	switch( cmd )
4002  0004 7b05          	ld	a,(OFST+5,sp)
4004                     ; 899 		break;
4005  0006 4a            	dec	a
4006  0007 270c          	jreq	L3121
4007  0009 a003          	sub	a,#3
4008  000b 2716          	jreq	L5121
4009  000d 4a            	dec	a
4010  000e 2721          	jreq	L7121
4011  0010 4a            	dec	a
4012  0011 272c          	jreq	L1221
4013  0013 2036          	jra	L7421
4014  0015               L3121:
4015                     ; 874 	case PKT_CMD_MIRROR:
4015                     ; 875 		buf[2] = COMMAND_MODE_MIRROR;
4017  0015 1e01          	ldw	x,(OFST+1,sp)
4018  0017 a601          	ld	a,#1
4019  0019 e702          	ld	(2,x),a
4020                     ; 876 		buf[3] = p1;
4022  001b 7b06          	ld	a,(OFST+6,sp)
4023  001d 1e01          	ldw	x,(OFST+1,sp)
4024  001f e703          	ld	(3,x),a
4025                     ; 877 		break;
4027  0021 2028          	jra	L7421
4028  0023               L5121:
4029                     ; 888 	case PKT_CMD_FACTORY:
4029                     ; 889 		buf[2] = COMMAND_MODE_FACTORY;
4031  0023 1e01          	ldw	x,(OFST+1,sp)
4032  0025 a608          	ld	a,#8
4033  0027 e702          	ld	(2,x),a
4034                     ; 890 		buf[3] = p1;
4036  0029 7b06          	ld	a,(OFST+6,sp)
4037  002b 1e01          	ldw	x,(OFST+1,sp)
4038  002d e703          	ld	(3,x),a
4039                     ; 891 		break;
4041  002f 201a          	jra	L7421
4042  0031               L7121:
4043                     ; 892 	case PKT_CMD_RESET:
4043                     ; 893 		buf[2] = COMMAND_MODE_RESET;
4045  0031 1e01          	ldw	x,(OFST+1,sp)
4046  0033 a604          	ld	a,#4
4047  0035 e702          	ld	(2,x),a
4048                     ; 894 		buf[3] = p1;
4050  0037 7b06          	ld	a,(OFST+6,sp)
4051  0039 1e01          	ldw	x,(OFST+1,sp)
4052  003b e703          	ld	(3,x),a
4053                     ; 895 		break;
4055  003d 200c          	jra	L7421
4056  003f               L1221:
4057                     ; 896 	case PKT_CMD_BOILER_HOT_MODE:
4057                     ; 897 		buf[2] = COMMAND_MODE_HOTWATER;
4059  003f 1e01          	ldw	x,(OFST+1,sp)
4060  0041 a602          	ld	a,#2
4061  0043 e702          	ld	(2,x),a
4062                     ; 898 		buf[3] = p1;
4064  0045 7b06          	ld	a,(OFST+6,sp)
4065  0047 1e01          	ldw	x,(OFST+1,sp)
4066  0049 e703          	ld	(3,x),a
4067                     ; 899 		break;
4069  004b               L7421:
4070                     ; 902 	makeChecksum(buf);
4072  004b 1e01          	ldw	x,(OFST+1,sp)
4073  004d cd0000        	call	_makeChecksum
4075                     ; 903 }
4078  0050 85            	popw	x
4079  0051 81            	ret
4125                     ; 939 void rc_ptc_make_mirror(uint8_t *buf) {
4126                     .text:	section	.text,new
4127  0000               _rc_ptc_make_mirror:
4129  0000 89            	pushw	x
4130  0001 88            	push	a
4131       00000001      OFST:	set	1
4134                     ; 941 	buf[0] = BYTE_START_RC_MIRROR | cur_mirror_page;
4136  0002 c60006        	ld	a,_cur_mirror_page
4137  0005 aa40          	or	a,#64
4138  0007 1e02          	ldw	x,(OFST+1,sp)
4139  0009 f7            	ld	(x),a
4140                     ; 943 	mode = mode_mirror == 1 ? CNT_MODE_MAIN : CNT_MODE_SUB;
4142  000a c60011        	ld	a,_mode_mirror
4143  000d a101          	cp	a,#1
4144  000f 2603          	jrne	L241
4145  0011 4f            	clr	a
4146  0012 2002          	jra	L441
4147  0014               L241:
4148  0014 a601          	ld	a,#1
4149  0016               L441:
4150  0016 6b01          	ld	(OFST+0,sp),a
4151                     ; 944 	rc_ptc_make_baseSetting(buf, cur_mirror_page, mode);
4153  0018 7b01          	ld	a,(OFST+0,sp)
4154  001a 88            	push	a
4155  001b 3b0006        	push	_cur_mirror_page
4156  001e 1e04          	ldw	x,(OFST+3,sp)
4157  0020 cd0000        	call	_rc_ptc_make_baseSetting
4159  0023 85            	popw	x
4160                     ; 946 	makeChecksum(buf);
4162  0024 1e02          	ldw	x,(OFST+1,sp)
4163  0026 cd0000        	call	_makeChecksum
4165                     ; 948 	if (cur_mirror_page == 2) {
4167  0029 c60006        	ld	a,_cur_mirror_page
4168  002c a102          	cp	a,#2
4169  002e 2608          	jrne	L1721
4170                     ; 949 		cur_mirror_page = 0;
4172  0030 725f0006      	clr	_cur_mirror_page
4173                     ; 950 		mode_mirror = 0;
4175  0034 725f0011      	clr	_mode_mirror
4176  0038               L1721:
4177                     ; 952 }
4180  0038 5b03          	addw	sp,#3
4181  003a 81            	ret
4239                     ; 954 void rc_ptc_make(uint8_t *buf) {
4240                     .text:	section	.text,new
4241  0000               _rc_ptc_make:
4243  0000 89            	pushw	x
4244  0001 88            	push	a
4245       00000001      OFST:	set	1
4248                     ; 969 	if (error != 0 && error_type != 0) {
4250  0002 725d000a      	tnz	_error
4251  0006 270f          	jreq	L7131
4253  0008 725d0009      	tnz	_error_type
4254  000c 2709          	jreq	L7131
4255                     ; 970 		mode_recover = 1;
4257  000e 3501000f      	mov	_mode_recover,#1
4258                     ; 971 		rc_ptc_make_error(buf);
4260  0012 cd0000        	call	_rc_ptc_make_error
4262                     ; 972 		return;
4264  0015 201b          	jra	L051
4265  0017               L7131:
4266                     ; 975 	switch (uiInfo.mode) {
4268  0017 c60008        	ld	a,_uiInfo+8
4270                     ; 1023 			break;
4271  001a 4d            	tnz	a
4272  001b 2603          	jrne	L251
4273  001d cc00b0        	jp	L5721
4274  0020               L251:
4275  0020 4a            	dec	a
4276  0021 2703          	jreq	L451
4277  0023 cc00b5        	jp	L3231
4278  0026               L451:
4279                     ; 976 		case SETTING_MODE_MASTER:
4279                     ; 977 			
4279                     ; 978 			if (getSettingChange() == 1) {
4281  0026 cd0000        	call	_getSettingChange
4283  0029 a101          	cp	a,#1
4284  002b 2608          	jrne	L5231
4285                     ; 979 				rc_ptc_make_setting(buf);
4287  002d 1e02          	ldw	x,(OFST+1,sp)
4288  002f cd0000        	call	_rc_ptc_make_setting
4290                     ; 980 				return;
4291  0032               L051:
4294  0032 5b03          	addw	sp,#3
4295  0034 81            	ret
4296  0035               L5231:
4297                     ; 984 			if (mode_mirror != 0) {
4299  0035 725d0011      	tnz	_mode_mirror
4300  0039 270d          	jreq	L7231
4301                     ; 985 				rc_ptc_make_command_packet(buf, PKT_CMD_MIRROR, mode_mirror);
4303  003b 3b0011        	push	_mode_mirror
4304  003e 4b01          	push	#1
4305  0040 1e04          	ldw	x,(OFST+3,sp)
4306  0042 cd0000        	call	_rc_ptc_make_command_packet
4308  0045 85            	popw	x
4309                     ; 986 				return;
4311  0046 20ea          	jra	L051
4312  0048               L7231:
4313                     ; 989 			if (mode_factory != 0) {
4315  0048 725d0010      	tnz	_mode_factory
4316  004c 2711          	jreq	L1331
4317                     ; 991 				rc_ptc_make_command_packet(buf, PKT_CMD_FACTORY, mode_factory);
4319  004e 3b0010        	push	_mode_factory
4320  0051 4b04          	push	#4
4321  0053 1e04          	ldw	x,(OFST+3,sp)
4322  0055 cd0000        	call	_rc_ptc_make_command_packet
4324  0058 85            	popw	x
4325                     ; 992 				mode_factory = 0;
4327  0059 725f0010      	clr	_mode_factory
4328                     ; 993 				return;
4330  005d 20d3          	jra	L051
4331  005f               L1331:
4332                     ; 996 			if (mode_hotwater != 0) {
4334  005f 725d000e      	tnz	_mode_hotwater
4335  0063 270d          	jreq	L3331
4336                     ; 998 				rc_ptc_make_command_packet(buf, PKT_CMD_BOILER_HOT_MODE, mode_hotwater);
4338  0065 3b000e        	push	_mode_hotwater
4339  0068 4b06          	push	#6
4340  006a 1e04          	ldw	x,(OFST+3,sp)
4341  006c cd0000        	call	_rc_ptc_make_command_packet
4343  006f 85            	popw	x
4344                     ; 999 				return;
4346  0070 20c0          	jra	L051
4347  0072               L3331:
4348                     ; 1002 			if (mode_reset != 0) {
4350  0072 725d000d      	tnz	_mode_reset
4351  0076 270d          	jreq	L5331
4352                     ; 1004 				rc_ptc_make_command_packet(buf, PKT_CMD_RESET, mode_reset);
4354  0078 3b000d        	push	_mode_reset
4355  007b 4b05          	push	#5
4356  007d 1e04          	ldw	x,(OFST+3,sp)
4357  007f cd0000        	call	_rc_ptc_make_command_packet
4359  0082 85            	popw	x
4360                     ; 1005 				return;
4362  0083 20ad          	jra	L051
4363  0085               L5331:
4364                     ; 1009 			num = rc_ptc_check_subRC();
4366  0085 cd0000        	call	_rc_ptc_check_subRC
4368  0088 6b01          	ld	(OFST+0,sp),a
4369                     ; 1010 			if ( num == 0xFF) {
4371  008a 7b01          	ld	a,(OFST+0,sp)
4372  008c a1ff          	cp	a,#255
4373  008e 2607          	jrne	L7331
4374                     ; 1011 				rc_ptc_make_normal(buf);
4376  0090 1e02          	ldw	x,(OFST+1,sp)
4377  0092 cd0000        	call	_rc_ptc_make_normal
4379                     ; 1012 				return;
4381  0095 209b          	jra	L051
4382  0097               L7331:
4383                     ; 1015 			if (_remote == 1) {
4385  0097 c60000        	ld	a,__remote
4386  009a a101          	cp	a,#1
4387  009c 2607          	jrne	L1431
4388                     ; 1016 				rc_ptc_make_normal(buf);
4390  009e 1e02          	ldw	x,(OFST+1,sp)
4391  00a0 cd0000        	call	_rc_ptc_make_normal
4394  00a3 2010          	jra	L3231
4395  00a5               L1431:
4396                     ; 1018 				rc_ptc_make_subRC(buf, num);
4398  00a5 7b01          	ld	a,(OFST+0,sp)
4399  00a7 88            	push	a
4400  00a8 1e03          	ldw	x,(OFST+2,sp)
4401  00aa cd0000        	call	_rc_ptc_make_subRC
4403  00ad 84            	pop	a
4404  00ae 2005          	jra	L3231
4405  00b0               L5721:
4406                     ; 1021 		case SETTING_MODE_SUB:
4406                     ; 1022 			rc_ptc_make_normal(buf);
4408  00b0 1e02          	ldw	x,(OFST+1,sp)
4409  00b2 cd0000        	call	_rc_ptc_make_normal
4411                     ; 1023 			break;
4413  00b5               L3231:
4414                     ; 1025 }
4416  00b5 cc0032        	jra	L051
4459                     ; 1028 void func_rc_command(uint8_t com1, uint8_t com2) {
4460                     .text:	section	.text,new
4461  0000               _func_rc_command:
4463  0000 89            	pushw	x
4464       00000000      OFST:	set	0
4467                     ; 1029 	mode_mirror = 0;
4469  0001 725f0011      	clr	_mode_mirror
4470                     ; 1030 	mode_factory = 0;
4472  0005 725f0010      	clr	_mode_factory
4473                     ; 1031 	mode_hotwater = 0;
4475  0009 725f000e      	clr	_mode_hotwater
4476                     ; 1032 	mode_reset = 0;
4478  000d 725f000d      	clr	_mode_reset
4479                     ; 1034 	switch(com1) {
4481  0011 9e            	ld	a,xh
4483                     ; 1046 			break;
4484  0012 4a            	dec	a
4485  0013 270d          	jreq	L5431
4486  0015 4a            	dec	a
4487  0016 2711          	jreq	L7431
4488  0018 a002          	sub	a,#2
4489  001a 2714          	jreq	L1531
4490  001c a004          	sub	a,#4
4491  001e 2717          	jreq	L3531
4492  0020 201a          	jra	L5731
4493  0022               L5431:
4494                     ; 1035 		case COMMAND_MODE_MIRROR:
4494                     ; 1036 			mode_mirror = com2;
4496  0022 7b02          	ld	a,(OFST+2,sp)
4497  0024 c70011        	ld	_mode_mirror,a
4498                     ; 1037 			break;
4500  0027 2013          	jra	L5731
4501  0029               L7431:
4502                     ; 1038 		case COMMAND_MODE_HOTWATER:
4502                     ; 1039 			mode_hotwater = com2;
4504  0029 7b02          	ld	a,(OFST+2,sp)
4505  002b c7000e        	ld	_mode_hotwater,a
4506                     ; 1040 			break;
4508  002e 200c          	jra	L5731
4509  0030               L1531:
4510                     ; 1041 		case COMMAND_MODE_RESET:
4510                     ; 1042 			mode_reset = com2;
4512  0030 7b02          	ld	a,(OFST+2,sp)
4513  0032 c7000d        	ld	_mode_reset,a
4514                     ; 1043 			break;
4516  0035 2005          	jra	L5731
4517  0037               L3531:
4518                     ; 1044 		case COMMAND_MODE_FACTORY:
4518                     ; 1045 			mode_factory = com2;
4520  0037 7b02          	ld	a,(OFST+2,sp)
4521  0039 c70010        	ld	_mode_factory,a
4522                     ; 1046 			break;
4524  003c               L5731:
4525                     ; 1048 }
4528  003c 85            	popw	x
4529  003d 81            	ret
4562                     ; 1050 void func_rc_recover(uint8_t com) {
4563                     .text:	section	.text,new
4564  0000               _func_rc_recover:
4568                     ; 1051 	mode_recover = com;
4570  0000 c7000f        	ld	_mode_recover,a
4571                     ; 1052 }
4574  0003 81            	ret
4598                     ; 1054 void func_rc_setting(void) {
4599                     .text:	section	.text,new
4600  0000               _func_rc_setting:
4604                     ; 1055 	setSettingChange(1);
4606  0000 a601          	ld	a,#1
4607  0002 cd0000        	call	_setSettingChange
4609                     ; 1056 }
4612  0005 81            	ret
4615                     	switch	.data
4616  0003               ___func_rc_settingCb:
4617  0003 00            	dc.b	0
4648                     ; 1060 void func_rc_settingCb(uint8_t ch) {
4649                     .text:	section	.text,new
4650  0000               _func_rc_settingCb:
4654                     ; 1061 	__func_rc_settingCb = ch;
4656  0000 c70003        	ld	___func_rc_settingCb,a
4657                     ; 1062 }
4660  0003 81            	ret
4945                     	xdef	___func_rc_settingCb
4946                     	xdef	_func_rc_setting
4947                     	xdef	_func_rc_recover
4948                     	xdef	_func_rc_command
4949                     	xdef	_rc_ptc_make_command_packet
4950                     	xdef	_rc_ptc_make_command
4951                     	xdef	_rc_ptc_make_error
4952                     	xdef	_rc_ptc_check_subRC
4953                     	xdef	_rc_ptc_make_baseSetting
4954                     	xref	___cntlMode
4955                     	xdef	_makeChecksum
4956                     	xdef	_rc_ptc_check_mirror
4957                     	xdef	_rc_ptc_check_subrc
4958                     	xdef	_rc_ptc_check_rc
4959                     	xdef	_rc_ptc_check_setting
4960                     	xdef	_rc_ptc_check_normal
4961                     	xdef	_rc_ptc_check_homenet
4962                     	xdef	_rc_ptc_check_master
4963                     	xdef	_func_rc_settingCb
4964                     	xdef	_dr_mode_out
4965                     	switch	.bss
4966  0000               _cur_src:
4967  0000 00            	ds.b	1
4968                     	xdef	_cur_src
4969  0001               _ret_count:
4970  0001 00            	ds.b	1
4971                     	xdef	_ret_count
4972  0002               _disp_mode_preview:
4973  0002 00            	ds.b	1
4974                     	xdef	_disp_mode_preview
4975  0003               __rcLED:
4976  0003 00            	ds.b	1
4977                     	xdef	__rcLED
4978  0004               _test_count:
4979  0004 00            	ds.b	1
4980                     	xdef	_test_count
4981  0005               _packet_changed:
4982  0005 00            	ds.b	1
4983                     	xdef	_packet_changed
4984  0006               _cur_mirror_page:
4985  0006 00            	ds.b	1
4986                     	xdef	_cur_mirror_page
4987  0007               _cur_set_page:
4988  0007 00            	ds.b	1
4989                     	xdef	_cur_set_page
4990  0008               __version:
4991  0008 00            	ds.b	1
4992                     	xdef	__version
4993  0009               _error_type:
4994  0009 00            	ds.b	1
4995                     	xdef	_error_type
4996  000a               _error:
4997  000a 00            	ds.b	1
4998                     	xdef	_error
4999                     	xdef	_debug_br
5000                     	xdef	_debug_hn
5001  000b               _state_check:
5002  000b 00            	ds.b	1
5003                     	xdef	_state_check
5004                     	xref	__backup_backlight
5005                     	xref	_packet_buf
5006                     	xref	__boiler_fire
5007                     	xref	__boiler_type
5008                     	xref	__timFlag
5009                     	xref	__remote
5010                     	xref	__boiler_water_heat
5011                     	xref	__boiler_water_shower
5012                     	xref	___boiler_shower
5013                     	xref	__updateCount
5014                     	xref	__updateBit
5015                     	xref	__updateTimer
5016                     	xref	__disp_mode2
5017                     	xref	_lcd_disp_rid
5018                     	xref	_uiInfo
5019                     	xdef	_rc_ptc_make_mirror
5020                     	xdef	_rc_ptc_make
5021                     	xdef	_rc_ptc_make_subRC
5022                     	xdef	_rc_ptc_make_setting
5023                     	xdef	_rc_ptc_make_normal
5024                     	xdef	_setState_check
5025                     	xdef	_getState_check
5026                     	xdef	_getSettingChange
5027                     	xdef	_setSettingChange
5028                     	xdef	_rc_ptc_check
5029                     	xdef	_rc_ptc_baseSet
5030                     	xdef	_getHexToBin
5031  000c               _set_changed:
5032  000c 00            	ds.b	1
5033                     	xdef	_set_changed
5034  000d               _mode_reset:
5035  000d 00            	ds.b	1
5036                     	xdef	_mode_reset
5037  000e               _mode_hotwater:
5038  000e 00            	ds.b	1
5039                     	xdef	_mode_hotwater
5040  000f               _mode_recover:
5041  000f 00            	ds.b	1
5042                     	xdef	_mode_recover
5043  0010               _mode_factory:
5044  0010 00            	ds.b	1
5045                     	xdef	_mode_factory
5046  0011               _mode_mirror:
5047  0011 00            	ds.b	1
5048                     	xdef	_mode_mirror
5049  0012               _boiler_info:
5050  0012 000000        	ds.b	3
5051                     	xdef	_boiler_info
5052  0015               _rcSubDataInfo:
5053  0015 000000000000  	ds.b	48
5054                     	xdef	_rcSubDataInfo
5055                     	xref	_file_read
5056                     	xref	_disp_char
5057                     	xref	___timer1s
5077                     	end
