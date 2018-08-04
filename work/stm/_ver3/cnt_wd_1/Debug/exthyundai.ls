   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  76                     ; 23 void hn_hyundai_make_checkSum(uint8_t num) {
  78                     .text:	section	.text,new
  79  0000               _hn_hyundai_make_checkSum:
  81  0000 88            	push	a
  82  0001 89            	pushw	x
  83       00000002      OFST:	set	2
  86                     ; 27 	s = 0;
  88  0002 0f01          	clr	(OFST-1,sp)
  89                     ; 28 	for (i = 0 ; i < num ; i++) {
  91  0004 0f02          	clr	(OFST+0,sp)
  93  0006 200b          	jra	L53
  94  0008               L13:
  95                     ; 29 		s ^= _ua.r[i];
  97  0008 5f            	clrw	x
  98  0009 97            	ld	xl,a
  99  000a 7b01          	ld	a,(OFST-1,sp)
 100  000c d80054        	xor	a,(__ua+84,x)
 101  000f 6b01          	ld	(OFST-1,sp),a
 102                     ; 28 	for (i = 0 ; i < num ; i++) {
 104  0011 0c02          	inc	(OFST+0,sp)
 105  0013               L53:
 108  0013 7b02          	ld	a,(OFST+0,sp)
 109  0015 1103          	cp	a,(OFST+1,sp)
 110  0017 25ef          	jrult	L13
 111                     ; 32 	_ua.r[num] = s;
 113  0019 7b03          	ld	a,(OFST+1,sp)
 114  001b 5f            	clrw	x
 115  001c 97            	ld	xl,a
 116  001d 7b01          	ld	a,(OFST-1,sp)
 117  001f d70054        	ld	(__ua+84,x),a
 118                     ; 33 }
 121  0022 5b03          	addw	sp,#3
 122  0024 81            	ret	
 156                     ; 35 uint8_t hn_hyundai_change_mode(uint8_t room) {
 157                     .text:	section	.text,new
 158  0000               _hn_hyundai_change_mode:
 160  0000 88            	push	a
 161       00000000      OFST:	set	0
 164                     ; 36 	if (rcInfo.mode[room] == 0x00) {
 166  0001 ad24          	call	LC001
 167  0003 2603          	jrne	L55
 168                     ; 37 		return 0x00;
 172  0005 5b01          	addw	sp,#1
 173  0007 81            	ret	
 174  0008               L55:
 175                     ; 38 	} else if (rcInfo.mode[room] == MODE_OUT) {
 177  0008 7b01          	ld	a,(OFST+1,sp)
 178  000a ad1b          	call	LC001
 179  000c a102          	cp	a,#2
 180  000e 2605          	jrne	L16
 181                     ; 39 		return 0x04;
 183  0010 a604          	ld	a,#4
 186  0012 5b01          	addw	sp,#1
 187  0014 81            	ret	
 188  0015               L16:
 189                     ; 41 	} else if (rcInfo.mode[room] == MODE_STOP) {
 191  0015 7b01          	ld	a,(OFST+1,sp)
 192  0017 ad0e          	call	LC001
 193  0019 a104          	cp	a,#4
 194  001b 2605          	jrne	L56
 195                     ; 42 		return 0x04;
 197  001d a604          	ld	a,#4
 200  001f 5b01          	addw	sp,#1
 201  0021 81            	ret	
 202  0022               L56:
 203                     ; 44 		return 0x01;
 205  0022 a601          	ld	a,#1
 208  0024 5b01          	addw	sp,#1
 209  0026 81            	ret	
 210  0027               LC001:
 211  0027 5f            	clrw	x
 212  0028 97            	ld	xl,a
 213  0029 d60010        	ld	a,(_rcInfo+16,x)
 214  002c 81            	ret	
 247                     ; 48 uint8_t hn_hyundai_change_curr_mode(uint8_t mode) {
 248                     .text:	section	.text,new
 249  0000               _hn_hyundai_change_curr_mode:
 251  0000 88            	push	a
 252       00000000      OFST:	set	0
 255                     ; 49 	if (mode == 0x00) {
 257  0001 4d            	tnz	a
 258  0002 2603          	jrne	L501
 259                     ; 50 		return 0x00;
 263  0004 5b01          	addw	sp,#1
 264  0006 81            	ret	
 265  0007               L501:
 266                     ; 51 	} else if (mode == MODE_OUT) {
 268  0007 7b01          	ld	a,(OFST+1,sp)
 269  0009 a102          	cp	a,#2
 270  000b 2605          	jrne	L111
 271                     ; 52 		return 0x04;
 273  000d a604          	ld	a,#4
 276  000f 5b01          	addw	sp,#1
 277  0011 81            	ret	
 278  0012               L111:
 279                     ; 54 	} else if (mode == MODE_STOP) {
 281  0012 a104          	cp	a,#4
 282  0014 2605          	jrne	L511
 283                     ; 55 		return 0x04;
 285  0016 a604          	ld	a,#4
 288  0018 5b01          	addw	sp,#1
 289  001a 81            	ret	
 290  001b               L511:
 291                     ; 57 		return 0x01;
 293  001b a601          	ld	a,#1
 296  001d 5b01          	addw	sp,#1
 297  001f 81            	ret	
 345                     ; 61 uint8_t hn_hyundai_change_temp(uint8_t room, uint8_t iscurr) {
 346                     .text:	section	.text,new
 347  0000               _hn_hyundai_change_temp:
 349  0000 89            	pushw	x
 350  0001 88            	push	a
 351       00000001      OFST:	set	1
 354                     ; 64 	if (rcInfo.mode[room] == 0x00) {
 356  0002 9e            	ld	a,xh
 357  0003 5f            	clrw	x
 358  0004 97            	ld	xl,a
 359  0005 d60010        	ld	a,(_rcInfo+16,x)
 360  0008 2603          	jrne	L141
 361                     ; 65 		return 0xFF;
 363  000a 4a            	dec	a
 365  000b 2019          	jra	L541
 366  000d               L141:
 367                     ; 68 	if (iscurr == 1) {
 369  000d 7b03          	ld	a,(OFST+2,sp)
 370  000f 4a            	dec	a
 371  0010 2609          	jrne	L341
 372                     ; 69 		temp = rcInfo.curr_temp[room] / 2;
 374  0012 7b02          	ld	a,(OFST+1,sp)
 375  0014 5f            	clrw	x
 376  0015 97            	ld	xl,a
 377  0016 d60000        	ld	a,(_rcInfo,x)
 379  0019 2007          	jp	LC002
 380  001b               L341:
 381                     ; 71 		temp = rcInfo.setup_temp[room] / 2;
 383  001b 7b02          	ld	a,(OFST+1,sp)
 384  001d 5f            	clrw	x
 385  001e 97            	ld	xl,a
 386  001f d60008        	ld	a,(_rcInfo+8,x)
 387  0022               LC002:
 388  0022 5f            	clrw	x
 389  0023 97            	ld	xl,a
 390  0024 57            	sraw	x
 391  0025 01            	rrwa	x,a
 392  0026               L541:
 393                     ; 76 	return temp;
 397  0026 5b03          	addw	sp,#3
 398  0028 81            	ret	
 440                     ; 80 void hn_hyundai_ptc_make_state(uint8_t room) {
 441                     .text:	section	.text,new
 442  0000               _hn_hyundai_ptc_make_state:
 444  0000 88            	push	a
 445       00000000      OFST:	set	0
 448                     ; 81 	_ua.r[0] = 0xF7;
 450  0001 35f70054      	mov	__ua+84,#247
 451                     ; 82 	_ua.r[1] = 0x0D;	// 2016.02.05 수정 
 453  0005 350d0055      	mov	__ua+85,#13
 454                     ; 83 	_ua.r[2] = _ua.b[2];
 456  0009 5500060056    	mov	__ua+86,__ua+6
 457                     ; 84 	_ua.r[3] = _ua.b[3];
 459  000e 5500070057    	mov	__ua+87,__ua+7
 460                     ; 85 	_ua.r[4] = 0x04; 
 462  0013 35040058      	mov	__ua+88,#4
 463                     ; 86 	_ua.r[5] = _ua.b[5]; 
 465  0017 5500090059    	mov	__ua+89,__ua+9
 466                     ; 87 	_ua.r[6] = _ua.b[6]; 
 468  001c 55000a005a    	mov	__ua+90,__ua+10
 469                     ; 88 	_ua.r[7] = _ua.b[7];
 471                     ; 90 	_ua.r[8] = hn_hyundai_change_mode(room - 1); // 모드
 473  0021 4a            	dec	a
 474  0022 55000b005b    	mov	__ua+91,__ua+11
 475  0027 cd0000        	call	_hn_hyundai_change_mode
 477  002a c7005c        	ld	__ua+92,a
 478                     ; 91 	_ua.r[9] = hn_hyundai_change_temp(room - 1, 1); // 현재 온도 
 480  002d ae0001        	ldw	x,#1
 481  0030 7b01          	ld	a,(OFST+1,sp)
 482  0032 4a            	dec	a
 483  0033 95            	ld	xh,a
 484  0034 cd0000        	call	_hn_hyundai_change_temp
 486  0037 c7005d        	ld	__ua+93,a
 487                     ; 92 	_ua.r[10] = hn_hyundai_change_temp(room - 1, 0); // 설정온도
 489  003a 5f            	clrw	x
 490  003b 7b01          	ld	a,(OFST+1,sp)
 491  003d 4a            	dec	a
 492  003e 95            	ld	xh,a
 493  003f cd0000        	call	_hn_hyundai_change_temp
 495  0042 c7005e        	ld	__ua+94,a
 496                     ; 94 	if (msg_hn == 1) {
 498  0045 c60000        	ld	a,_msg_hn
 499  0048 4a            	dec	a
 500  0049 2652          	jrne	L361
 501                     ; 95 		if (hnCnt.id == room) {
 503  004b c60000        	ld	a,_hnCnt
 504  004e 1101          	cp	a,(OFST+1,sp)
 505  0050 261c          	jrne	L561
 506                     ; 96 			_ua.r[8] = hn_hyundai_change_curr_mode(hnCnt.mode);
 508  0052 c60001        	ld	a,_hnCnt+1
 509  0055 cd0000        	call	_hn_hyundai_change_curr_mode
 511  0058 c7005c        	ld	__ua+92,a
 512                     ; 97 			_ua.r[10] = (hnCnt.setup_temp == 0xFF) ? pre_heat_temp[room - 1] : (hnCnt.setup_temp / 2);		
 514  005b c60002        	ld	a,_hnCnt+2
 515  005e a1ff          	cp	a,#255
 516  0060 2634          	jrne	LC004
 517  0062               LC005:
 518  0062 7b01          	ld	a,(OFST+1,sp)
 519  0064 5f            	clrw	x
 520  0065 97            	ld	xl,a
 521  0066 5a            	decw	x
 522  0067 d60000        	ld	a,(_pre_heat_temp,x)
 523  006a 5f            	clrw	x
 524  006b 97            	ld	xl,a
 525  006c 202b          	jra	L04
 527  006e               L561:
 528                     ; 99 			if (hnCnts[room - 1].isChange == 1) {
 530  006e 7b01          	ld	a,(OFST+1,sp)
 531  0070 ad50          	call	LC006
 532  0072 d60004        	ld	a,(_hnCnts+4,x)
 533  0075 4a            	dec	a
 534  0076 2625          	jrne	L361
 535                     ; 100 				_ua.r[8] = hn_hyundai_change_curr_mode(hnCnts[room - 1].mode);
 537  0078 7b01          	ld	a,(OFST+1,sp)
 538  007a ad46          	call	LC006
 539  007c d60001        	ld	a,(_hnCnts+1,x)
 540  007f cd0000        	call	_hn_hyundai_change_curr_mode
 542  0082 c7005c        	ld	__ua+92,a
 543                     ; 101 				_ua.r[10] = (hnCnts[room - 1].setup_temp == 0xFF) ? pre_heat_temp[room - 1] : (hnCnts[room - 1].setup_temp / 2);		
 545  0085 7b01          	ld	a,(OFST+1,sp)
 546  0087 ad39          	call	LC006
 547  0089 d60002        	ld	a,(_hnCnts+2,x)
 548  008c 4c            	inc	a
 549  008d 27d3          	jreq	LC005
 550  008f 7b01          	ld	a,(OFST+1,sp)
 551  0091 ad2f          	call	LC006
 552  0093 d60002        	ld	a,(_hnCnts+2,x)
 553  0096               LC004:
 554  0096 5f            	clrw	x
 555  0097 97            	ld	xl,a
 556  0098 57            	sraw	x
 557  0099               L04:
 558  0099 01            	rrwa	x,a
 559  009a c7005e        	ld	__ua+94,a
 560  009d               L361:
 561                     ; 106 	if (_ua.r[8] == hn_hyundai_change_curr_mode(MODE_OUT)) {
 563  009d a602          	ld	a,#2
 564  009f cd0000        	call	_hn_hyundai_change_curr_mode
 566  00a2 c1005c        	cp	a,__ua+92
 567  00a5 2604          	jrne	L371
 568                     ; 107 		_ua.r[10] = 0x0F;
 570  00a7 350f005e      	mov	__ua+94,#15
 571  00ab               L371:
 572                     ; 110 	hn_hyundai_make_checkSum(11);
 574  00ab a60b          	ld	a,#11
 575  00ad cd0000        	call	_hn_hyundai_make_checkSum
 577                     ; 111 	_ua.r[12] = 0xEE;
 579  00b0 35ee0060      	mov	__ua+96,#238
 580                     ; 113 	HYUNDAI_SEND(13)
 582  00b4 350d0003      	mov	__ua+3,#13
 585  00b8 350100a4      	mov	__ua+164,#1
 588  00bc 353200a5      	mov	__ua+165,#50
 589                     ; 114 }
 592  00c0 84            	pop	a
 593  00c1 81            	ret	
 594  00c2               LC006:
 595  00c2 97            	ld	xl,a
 596  00c3 a605          	ld	a,#5
 597  00c5 42            	mul	x,a
 598  00c6 1d0005        	subw	x,#5
 599  00c9 81            	ret	
 641                     ; 117 void hn_hyundai_ptc_make_controll(uint8_t room) {	
 642                     .text:	section	.text,new
 643  0000               _hn_hyundai_ptc_make_controll:
 645  0000 88            	push	a
 646       00000000      OFST:	set	0
 649                     ; 118 	if (msg_hn == 1) {
 651  0001 c60000        	ld	a,_msg_hn
 652  0004 4a            	dec	a
 653  0005 2703cc010e    	jrne	L112
 654                     ; 119 		hnCnts[room - 1].id = room;
 656  000a 7b01          	ld	a,(OFST+1,sp)
 657  000c cd01b7        	call	LC015
 658  000f 7b01          	ld	a,(OFST+1,sp)
 659  0011 d70000        	ld	(_hnCnts,x),a
 660                     ; 120 		hnCnts[room - 1].comm = 1;
 662  0014 cd01b7        	call	LC015
 663  0017 a601          	ld	a,#1
 664  0019 d70003        	ld	(_hnCnts+3,x),a
 665                     ; 121 		hnCnts[room - 1].isChange = 1;
 667  001c 7b01          	ld	a,(OFST+1,sp)
 668  001e cd01b7        	call	LC015
 669  0021 a601          	ld	a,#1
 670  0023 d70004        	ld	(_hnCnts+4,x),a
 671                     ; 122 		msg_hn_more = 1;
 673  0026 35010000      	mov	_msg_hn_more,#1
 674                     ; 124 		if (_ua.b[5] == 0x45) {
 676  002a c60009        	ld	a,__ua+9
 677  002d a145          	cp	a,#69
 678  002f 263f          	jrne	L312
 679                     ; 125 			if (_ua.b[7] < 0x46) {
 681  0031 c6000b        	ld	a,__ua+11
 682  0034 a146          	cp	a,#70
 683  0036 7b01          	ld	a,(OFST+1,sp)
 684  0038 97            	ld	xl,a
 685  0039 a605          	ld	a,#5
 686  003b 2421          	jruge	L512
 687                     ; 126 				hnCnts[room - 1].mode = rcInfo.mode[room - 1];
 689  003d 42            	mul	x,a
 690  003e 1d0005        	subw	x,#5
 691  0041 7b01          	ld	a,(OFST+1,sp)
 692  0043 905f          	clrw	y
 693  0045 9097          	ld	yl,a
 694  0047 905a          	decw	y
 695  0049 90d60010      	ld	a,(_rcInfo+16,y)
 696  004d d70001        	ld	(_hnCnts+1,x),a
 697                     ; 127 				hnCnts[room - 1].setup_temp = _ua.b[7] * 2;
 699  0050 7b01          	ld	a,(OFST+1,sp)
 700  0052 cd01b7        	call	LC015
 701  0055 c6000b        	ld	a,__ua+11
 702  0058 48            	sll	a
 703  0059 d70002        	ld	(_hnCnts+2,x),a
 704                     ; 129 				pre_heat_temp[room - 1] = _ua.b[7];
 706  005c 2051          	jp	L722
 707  005e               L512:
 708                     ; 132 				hnCnts[room - 1].isChange = 0;
 710  005e 42            	mul	x,a
 711  005f 1d0005        	subw	x,#5
 712  0062 724f0004      	clr	(_hnCnts+4,x)
 713                     ; 133 				funcInfo.boiler_water_heat = _ua.b[7] * 2;
 715  0066 c6000b        	ld	a,__ua+11
 716  0069 48            	sll	a
 717  006a c70002        	ld	_funcInfo+2,a
 718  006d cc010c        	jra	L122
 719  0070               L312:
 720                     ; 135 		} else if (_ua.b[5] == 0x44) {
 722  0070 a144          	cp	a,#68
 723  0072 2645          	jrne	L322
 724                     ; 136 			if (_ua.b[7] == 0x05) {
 726  0074 c6000b        	ld	a,__ua+11
 727  0077 a105          	cp	a,#5
 728  0079 2619          	jrne	L522
 729                     ; 137 				hnCnts[room - 1].mode = MODE_HOT;
 731  007b 7b01          	ld	a,(OFST+1,sp)
 732  007d cd01b7        	call	LC015
 733  0080 a601          	ld	a,#1
 734  0082 d70001        	ld	(_hnCnts+1,x),a
 735                     ; 138 				hnCnts[room - 1].setup_temp = hnCnts[room - 1].setup_temp + 0x02;
 737  0085 7b01          	ld	a,(OFST+1,sp)
 738  0087 cd01b7        	call	LC015
 739  008a 724c0002      	inc	(_hnCnts+2,x)
 740  008e 724c0002      	inc	(_hnCnts+2,x)
 742  0092 201b          	jra	L722
 743  0094               L522:
 744                     ; 139 			} else if (_ua.b[7] == 0x06) {
 746  0094 a106          	cp	a,#6
 747  0096 2617          	jrne	L722
 748                     ; 140 				hnCnts[room - 1].mode = MODE_HOT;
 750  0098 7b01          	ld	a,(OFST+1,sp)
 751  009a cd01b7        	call	LC015
 752  009d a601          	ld	a,#1
 753  009f d70001        	ld	(_hnCnts+1,x),a
 754                     ; 141 				hnCnts[room - 1].setup_temp = hnCnts[room - 1].setup_temp - 0x02;
 756  00a2 7b01          	ld	a,(OFST+1,sp)
 757  00a4 cd01b7        	call	LC015
 758  00a7 724a0002      	dec	(_hnCnts+2,x)
 759  00ab 724a0002      	dec	(_hnCnts+2,x)
 760  00af               L722:
 761                     ; 144 			pre_heat_temp[room - 1] = _ua.b[7];
 764  00af 7b01          	ld	a,(OFST+1,sp)
 765  00b1 5f            	clrw	x
 766  00b2 97            	ld	xl,a
 767  00b3 5a            	decw	x
 768  00b4 c6000b        	ld	a,__ua+11
 770  00b7 2036          	jp	LC008
 771  00b9               L322:
 772                     ; 146 		} else if (_ua.b[5] == 0x46) {
 774  00b9 a146          	cp	a,#70
 775  00bb 264f          	jrne	L122
 776                     ; 147 			if (_ua.b[7] == 0x01) {
 778  00bd c6000b        	ld	a,__ua+11
 779  00c0 a101          	cp	a,#1
 780                     ; 148 				hnCnts[room - 1].mode = MODE_HOT;
 781                     ; 149 				hnCnts[room - 1].setup_temp = 0xFF;
 783  00c2 2734          	jreq	LC007
 784                     ; 150 			} else if (_ua.b[7] == 0x04) {
 786  00c4 a104          	cp	a,#4
 787                     ; 151 				hnCnts[room - 1].mode = MODE_OUT;
 788                     ; 152 				hnCnts[room - 1].setup_temp = 0xFF;
 789                     ; 153 				pre_heat_temp[room - 1] = hn_hyundai_change_temp(room - 1, 0);
 792  00c6 2704          	jreq	LC009
 793                     ; 154 			} else if (_ua.b[7] == 0x07) {
 795  00c8 a107          	cp	a,#7
 796  00ca 2628          	jrne	L742
 797                     ; 155 				hnCnts[room - 1].mode = MODE_OUT;
 799                     ; 156 				hnCnts[room - 1].setup_temp = 0xFF;
 801                     ; 157 				pre_heat_temp[room - 1] = hn_hyundai_change_temp(room - 1, 0);
 804  00cc               LC009:
 806  00cc 7b01          	ld	a,(OFST+1,sp)
 807  00ce cd01b7        	call	LC015
 808  00d1 a602          	ld	a,#2
 809  00d3 d70001        	ld	(_hnCnts+1,x),a
 811  00d6 7b01          	ld	a,(OFST+1,sp)
 812  00d8 cd01b7        	call	LC015
 813  00db a6ff          	ld	a,#255
 814  00dd d70002        	ld	(_hnCnts+2,x),a
 816  00e0 5f            	clrw	x
 817  00e1 7b01          	ld	a,(OFST+1,sp)
 818  00e3 97            	ld	xl,a
 819  00e4 5a            	decw	x
 820  00e5 89            	pushw	x
 821  00e6 5f            	clrw	x
 822  00e7 7b03          	ld	a,(OFST+3,sp)
 823  00e9 4a            	dec	a
 824  00ea 95            	ld	xh,a
 825  00eb cd0000        	call	_hn_hyundai_change_temp
 826  00ee 85            	popw	x
 827  00ef               LC008:
 828  00ef d70000        	ld	(_pre_heat_temp,x),a
 830  00f2 2018          	jra	L122
 831  00f4               L742:
 832                     ; 158 			} else if (_ua.b[7] == 0x08) {
 834  00f4 a108          	cp	a,#8
 835  00f6 2614          	jrne	L122
 836                     ; 159 				hnCnts[room - 1].mode = MODE_HOT;
 838                     ; 160 				hnCnts[room - 1].setup_temp = 0xFF;
 840  00f8               LC007:
 842  00f8 7b01          	ld	a,(OFST+1,sp)
 843  00fa cd01b7        	call	LC015
 844  00fd a601          	ld	a,#1
 845  00ff d70001        	ld	(_hnCnts+1,x),a
 847  0102 7b01          	ld	a,(OFST+1,sp)
 848  0104 cd01b7        	call	LC015
 849  0107 a6ff          	ld	a,#255
 850  0109 d70002        	ld	(_hnCnts+2,x),a
 851  010c               L122:
 852                     ; 163 		return;
 855  010c 84            	pop	a
 856  010d 81            	ret	
 857  010e               L112:
 858                     ; 167 	hnCnt.id = room;
 860  010e 7b01          	ld	a,(OFST+1,sp)
 861  0110 c70000        	ld	_hnCnt,a
 862                     ; 168 	hnCnt.comm = 1;
 864  0113 35010003      	mov	_hnCnt+3,#1
 865                     ; 169 	msg_hn = 1;
 867  0117 35010000      	mov	_msg_hn,#1
 868                     ; 171 	if (_ua.b[5] == 0x45) {
 870  011b c60009        	ld	a,__ua+9
 871  011e a145          	cp	a,#69
 872  0120 2625          	jrne	L552
 873                     ; 172 		if (_ua.b[7] < 0x46) {
 875  0122 c6000b        	ld	a,__ua+11
 876  0125 a146          	cp	a,#70
 877  0127 2414          	jruge	L752
 878                     ; 173 			hnCnt.mode = rcInfo.mode[room - 1];
 880  0129 7b01          	ld	a,(OFST+1,sp)
 881  012b 5f            	clrw	x
 882  012c 97            	ld	xl,a
 883  012d 5a            	decw	x
 884  012e d60010        	ld	a,(_rcInfo+16,x)
 885  0131 c70001        	ld	_hnCnt+1,a
 886                     ; 174 			hnCnt.setup_temp = _ua.b[7] * 2;
 888  0134 c6000b        	ld	a,__ua+11
 889  0137 48            	sll	a
 890  0138 c70002        	ld	_hnCnt+2,a
 891                     ; 176 			pre_heat_temp[room - 1] = _ua.b[7];
 893  013b 2033          	jp	L172
 894  013d               L752:
 895                     ; 179 			msg_hn = 0;
 897  013d 725f0000      	clr	_msg_hn
 898                     ; 180 			funcInfo.boiler_water_heat = _ua.b[7] * 2;
 900  0141 48            	sll	a
 901  0142 c70002        	ld	_funcInfo+2,a
 902  0145 206e          	jra	L362
 903  0147               L552:
 904                     ; 182 	} else if (_ua.b[5] == 0x44) {
 906  0147 a144          	cp	a,#68
 907  0149 262f          	jrne	L562
 908                     ; 183 		if (_ua.b[7] == 0x05) {
 910  014b c6000b        	ld	a,__ua+11
 911  014e a105          	cp	a,#5
 912  0150 260e          	jrne	L762
 913                     ; 184 			hnCnt.mode = MODE_HOT;
 915  0152 35010001      	mov	_hnCnt+1,#1
 916                     ; 185 			hnCnt.setup_temp = hnCnt.setup_temp + 0x02;
 918  0156 725c0002      	inc	_hnCnt+2
 919  015a 725c0002      	inc	_hnCnt+2
 921  015e 2010          	jra	L172
 922  0160               L762:
 923                     ; 186 		} else if (_ua.b[7] == 0x06) {
 925  0160 a106          	cp	a,#6
 926  0162 260c          	jrne	L172
 927                     ; 187 			hnCnt.mode = MODE_HOT;
 929  0164 35010001      	mov	_hnCnt+1,#1
 930                     ; 188 			hnCnt.setup_temp = hnCnt.setup_temp - 0x02;
 932  0168 725a0002      	dec	_hnCnt+2
 933  016c 725a0002      	dec	_hnCnt+2
 934  0170               L172:
 935                     ; 191 		pre_heat_temp[room - 1] = _ua.b[7];
 938  0170 7b01          	ld	a,(OFST+1,sp)
 939  0172 5f            	clrw	x
 940  0173 97            	ld	xl,a
 941  0174 5a            	decw	x
 942  0175 c6000b        	ld	a,__ua+11
 944  0178 202a          	jp	LC012
 945  017a               L562:
 946                     ; 193 	} else if (_ua.b[5] == 0x46) {
 948  017a a146          	cp	a,#70
 949  017c 2637          	jrne	L362
 950                     ; 194 		if (_ua.b[7] == 0x01) {
 952  017e c6000b        	ld	a,__ua+11
 953  0181 a101          	cp	a,#1
 954                     ; 195 			hnCnt.mode = MODE_HOT;
 955                     ; 196 			hnCnt.setup_temp = 0xFF;
 957  0183 2728          	jreq	LC011
 958                     ; 197 		} else if (_ua.b[7] == 0x04) {
 960  0185 a104          	cp	a,#4
 961                     ; 198 			hnCnt.mode = MODE_OUT;
 962                     ; 199 			hnCnt.setup_temp = 0xFF;
 963                     ; 200 			pre_heat_temp[room - 1] = hn_hyundai_change_temp(room - 1, 0);
 966  0187 2704          	jreq	LC013
 967                     ; 201 		} else if (_ua.b[7] == 0x07) {
 969  0189 a107          	cp	a,#7
 970  018b 261c          	jrne	L113
 971                     ; 202 			hnCnt.mode = MODE_OUT;
 973                     ; 203 			hnCnt.setup_temp = 0xFF;
 975                     ; 204 			pre_heat_temp[room - 1] = hn_hyundai_change_temp(room - 1, 0);
 978  018d               LC013:
 980  018d 35020001      	mov	_hnCnt+1,#2
 982  0191 35ff0002      	mov	_hnCnt+2,#255
 984  0195 5f            	clrw	x
 985  0196 7b01          	ld	a,(OFST+1,sp)
 986  0198 97            	ld	xl,a
 987  0199 5a            	decw	x
 988  019a 89            	pushw	x
 989  019b 5f            	clrw	x
 990  019c 7b03          	ld	a,(OFST+3,sp)
 991  019e 4a            	dec	a
 992  019f 95            	ld	xh,a
 993  01a0 cd0000        	call	_hn_hyundai_change_temp
 994  01a3 85            	popw	x
 995  01a4               LC012:
 996  01a4 d70000        	ld	(_pre_heat_temp,x),a
 998  01a7 200c          	jra	L362
 999  01a9               L113:
1000                     ; 205 		} else if (_ua.b[7] == 0x08) {
1002  01a9 a108          	cp	a,#8
1003  01ab 2608          	jrne	L362
1004                     ; 206 			hnCnt.mode = MODE_HOT;
1006                     ; 207 			hnCnt.setup_temp = 0xFF;
1008  01ad               LC011:
1010  01ad 35010001      	mov	_hnCnt+1,#1
1012  01b1 35ff0002      	mov	_hnCnt+2,#255
1013  01b5               L362:
1014                     ; 210 }
1017  01b5 84            	pop	a
1018  01b6 81            	ret	
1019  01b7               LC015:
1020  01b7 97            	ld	xl,a
1021  01b8 a605          	ld	a,#5
1022  01ba 42            	mul	x,a
1023  01bb 1d0005        	subw	x,#5
1024  01be 81            	ret	
1073                     ; 213 void hn_hyundai_ptc_make_state_all(void) {
1074                     .text:	section	.text,new
1075  0000               _hn_hyundai_ptc_make_state_all:
1077  0000 5203          	subw	sp,#3
1078       00000003      OFST:	set	3
1081                     ; 218 	_ua.r[0] = 0xF7;
1083  0002 35f70054      	mov	__ua+84,#247
1084                     ; 219 	_ua.r[1] = 0x22; //len
1086  0006 35220055      	mov	__ua+85,#34
1087                     ; 220 	_ua.r[2] = _ua.b[2];
1089  000a 5500060056    	mov	__ua+86,__ua+6
1090                     ; 221 	_ua.r[3] = _ua.b[3]; //TODO:
1092  000f 5500070057    	mov	__ua+87,__ua+7
1093                     ; 222 	_ua.r[4] = 0x04; 
1095  0014 35040058      	mov	__ua+88,#4
1096                     ; 223 	_ua.r[5] = _ua.b[5];
1098  0018 5500090059    	mov	__ua+89,__ua+9
1099                     ; 225 	_ua.r[6] = _ua.b[6]; 
1101  001d 55000a005a    	mov	__ua+90,__ua+10
1102                     ; 226 	_ua.r[7] = _ua.b[7];
1104  0022 55000b005b    	mov	__ua+91,__ua+11
1105                     ; 228 	room = 0;
1107  0027 0f02          	clr	(OFST-1,sp)
1108                     ; 229 	for (i = 8 ; i < (8+24) ; i=i+3) {
1110  0029 a608          	ld	a,#8
1111  002b 6b03          	ld	(OFST+0,sp),a
1112  002d               L533:
1113                     ; 230 		_ua.r[i] = hn_hyundai_change_mode(room - 1);
1115  002d 5f            	clrw	x
1116  002e 97            	ld	xl,a
1117  002f 89            	pushw	x
1118  0030 7b04          	ld	a,(OFST+1,sp)
1119  0032 4a            	dec	a
1120  0033 cd0000        	call	_hn_hyundai_change_mode
1122  0036 85            	popw	x
1123  0037 d70054        	ld	(__ua+84,x),a
1124                     ; 231 		_ua.r[i+1] = hn_hyundai_change_temp(room - 1, 1);
1126  003a 5f            	clrw	x
1127  003b 7b03          	ld	a,(OFST+0,sp)
1128  003d 97            	ld	xl,a
1129  003e 89            	pushw	x
1130  003f ae0001        	ldw	x,#1
1131  0042 7b04          	ld	a,(OFST+1,sp)
1132  0044 4a            	dec	a
1133  0045 95            	ld	xh,a
1134  0046 cd0000        	call	_hn_hyundai_change_temp
1136  0049 85            	popw	x
1137  004a d70055        	ld	(__ua+85,x),a
1138                     ; 232 		_ua.r[i+2] = hn_hyundai_change_temp(room - 1, 0);
1140  004d 5f            	clrw	x
1141  004e 7b03          	ld	a,(OFST+0,sp)
1142  0050 97            	ld	xl,a
1143  0051 89            	pushw	x
1144  0052 5f            	clrw	x
1145  0053 7b04          	ld	a,(OFST+1,sp)
1146  0055 4a            	dec	a
1147  0056 95            	ld	xh,a
1148  0057 cd0000        	call	_hn_hyundai_change_temp
1150  005a 85            	popw	x
1151  005b d70056        	ld	(__ua+86,x),a
1152                     ; 234 		if (msg_hn == 1) {
1154  005e c60000        	ld	a,_msg_hn
1155  0061 4a            	dec	a
1156  0062 2665          	jrne	L343
1157                     ; 235 			if (hnCnt.id == room) {
1159  0064 c60000        	ld	a,_hnCnt
1160  0067 1102          	cp	a,(OFST-1,sp)
1161  0069 2622          	jrne	L543
1162                     ; 236 				_ua.r[i] = hn_hyundai_change_curr_mode(hnCnt.mode);
1164  006b 7b03          	ld	a,(OFST+0,sp)
1165  006d 5f            	clrw	x
1166  006e 97            	ld	xl,a
1167  006f 89            	pushw	x
1168  0070 c60001        	ld	a,_hnCnt+1
1169  0073 cd0000        	call	_hn_hyundai_change_curr_mode
1171  0076 85            	popw	x
1172  0077 d70054        	ld	(__ua+84,x),a
1173                     ; 237 				_ua.r[i+2] = (hnCnt.setup_temp == 0xFF) ? pre_heat_temp[room - 1] : (hnCnt.setup_temp / 2);		
1175  007a c60002        	ld	a,_hnCnt+2
1176  007d a1ff          	cp	a,#255
1177  007f 263a          	jrne	LC017
1178  0081               LC018:
1179  0081 7b02          	ld	a,(OFST-1,sp)
1180  0083 5f            	clrw	x
1181  0084 97            	ld	xl,a
1182  0085 5a            	decw	x
1183  0086 d60000        	ld	a,(_pre_heat_temp,x)
1184  0089 5f            	clrw	x
1185  008a 97            	ld	xl,a
1186  008b 2031          	jra	L201
1188  008d               L543:
1189                     ; 239 				if (hnCnts[room - 1].isChange == 1) {
1191  008d 7b02          	ld	a,(OFST-1,sp)
1192  008f ad7a          	call	LC019
1193  0091 d60004        	ld	a,(_hnCnts+4,x)
1194  0094 4a            	dec	a
1195  0095 2632          	jrne	L343
1196                     ; 240 					_ua.r[i] = hn_hyundai_change_curr_mode(hnCnts[room - 1].mode);
1198  0097 7b03          	ld	a,(OFST+0,sp)
1199  0099 5f            	clrw	x
1200  009a 97            	ld	xl,a
1201  009b 89            	pushw	x
1202  009c 7b04          	ld	a,(OFST+1,sp)
1203  009e ad6b          	call	LC019
1204  00a0 d60001        	ld	a,(_hnCnts+1,x)
1205  00a3 cd0000        	call	_hn_hyundai_change_curr_mode
1207  00a6 85            	popw	x
1208  00a7 d70054        	ld	(__ua+84,x),a
1209                     ; 241 					_ua.r[i+2] = (hnCnts[room - 1].setup_temp == 0xFF) ? pre_heat_temp[room - 1] : (hnCnts[room - 1].setup_temp / 2);		
1211  00aa 7b02          	ld	a,(OFST-1,sp)
1212  00ac ad5d          	call	LC019
1213  00ae d60002        	ld	a,(_hnCnts+2,x)
1214  00b1 4c            	inc	a
1215  00b2 27cd          	jreq	LC018
1216  00b4 7b02          	ld	a,(OFST-1,sp)
1217  00b6 ad53          	call	LC019
1218  00b8 d60002        	ld	a,(_hnCnts+2,x)
1219  00bb               LC017:
1220  00bb 5f            	clrw	x
1221  00bc 97            	ld	xl,a
1222  00bd 57            	sraw	x
1223  00be               L201:
1224  00be 7b03          	ld	a,(OFST+0,sp)
1225  00c0 905f          	clrw	y
1226  00c2 9097          	ld	yl,a
1227  00c4 01            	rrwa	x,a
1228  00c5 90d70056      	ld	(__ua+86,y),a
1229  00c9               L343:
1230                     ; 246 		if (_ua.r[i] == hn_hyundai_change_curr_mode(MODE_OUT)) {
1232  00c9 a602          	ld	a,#2
1233  00cb cd0000        	call	_hn_hyundai_change_curr_mode
1235  00ce 6b01          	ld	(OFST-2,sp),a
1236  00d0 5f            	clrw	x
1237  00d1 7b03          	ld	a,(OFST+0,sp)
1238  00d3 97            	ld	xl,a
1239  00d4 d60054        	ld	a,(__ua+84,x)
1240  00d7 1101          	cp	a,(OFST-2,sp)
1241  00d9 2609          	jrne	L353
1242                     ; 247 			_ua.r[i+2] = 0x0F;
1244  00db 7b03          	ld	a,(OFST+0,sp)
1245  00dd 5f            	clrw	x
1246  00de 97            	ld	xl,a
1247  00df a60f          	ld	a,#15
1248  00e1 d70056        	ld	(__ua+86,x),a
1249  00e4               L353:
1250                     ; 250 		room++;
1252  00e4 0c02          	inc	(OFST-1,sp)
1253                     ; 229 	for (i = 8 ; i < (8+24) ; i=i+3) {
1255  00e6 7b03          	ld	a,(OFST+0,sp)
1256  00e8 ab03          	add	a,#3
1257  00ea 6b03          	ld	(OFST+0,sp),a
1260  00ec a120          	cp	a,#32
1261  00ee 2403cc002d    	jrult	L533
1262                     ; 253 	hn_hyundai_make_checkSum(32);
1264  00f3 a620          	ld	a,#32
1265  00f5 cd0000        	call	_hn_hyundai_make_checkSum
1267                     ; 254 	_ua.r[33] = 0xEE;
1269  00f8 35ee0075      	mov	__ua+117,#238
1270                     ; 255 	HYUNDAI_SEND(34)
1272  00fc 35220003      	mov	__ua+3,#34
1275  0100 350100a4      	mov	__ua+164,#1
1278  0104 353200a5      	mov	__ua+165,#50
1279                     ; 256 }
1282  0108 5b03          	addw	sp,#3
1283  010a 81            	ret	
1284  010b               LC019:
1285  010b 97            	ld	xl,a
1286  010c a605          	ld	a,#5
1287  010e 42            	mul	x,a
1288  010f 1d0005        	subw	x,#5
1289  0112 81            	ret	
1327                     ; 259 void hn_hyundai_ptc_make_controll_all(void) {	
1328                     .text:	section	.text,new
1329  0000               _hn_hyundai_ptc_make_controll_all:
1331  0000 88            	push	a
1332       00000001      OFST:	set	1
1335                     ; 261 	hnCnt.id = 1;
1337  0001 35010000      	mov	_hnCnt,#1
1338                     ; 262 	hnCnt.comm = 1;
1340  0005 35010003      	mov	_hnCnt+3,#1
1341                     ; 263 	msg_hn = 1;
1343  0009 35010000      	mov	_msg_hn,#1
1344                     ; 265 	if (_ua.b[5] == 0x46) {
1346  000d c60009        	ld	a,__ua+9
1347  0010 a146          	cp	a,#70
1348  0012 2653          	jrne	L173
1349                     ; 266 		if (_ua.b[7] == 0x01) {
1351  0014 c6000b        	ld	a,__ua+11
1352  0017 a101          	cp	a,#1
1353                     ; 267 			hnCnt.mode = MODE_HOT;
1354                     ; 268 			hnCnt.setup_temp = 0xFF;
1356  0019 2744          	jreq	LC020
1357                     ; 269 		} else if (_ua.b[7] == 0x04) {
1359  001b a104          	cp	a,#4
1360  001d 261c          	jrne	L773
1361                     ; 270 			hnCnt.comm = 0;
1363  001f ad48          	call	LC021
1364  0021 6b01          	ld	(OFST+0,sp),a
1365  0023               L104:
1366                     ; 274 				pre_heat_temp[i] = hn_hyundai_change_temp(i, 0);
1368  0023 5f            	clrw	x
1369  0024 97            	ld	xl,a
1370  0025 89            	pushw	x
1371  0026 5f            	clrw	x
1372  0027 7b03          	ld	a,(OFST+2,sp)
1373  0029 95            	ld	xh,a
1374  002a cd0000        	call	_hn_hyundai_change_temp
1376  002d 85            	popw	x
1377  002e d70000        	ld	(_pre_heat_temp,x),a
1378                     ; 273 			for (i = 0 ; i < 8 ; i++) {
1380  0031 0c01          	inc	(OFST+0,sp)
1383  0033 7b01          	ld	a,(OFST+0,sp)
1384  0035 a108          	cp	a,#8
1385  0037 25ea          	jrult	L104
1387  0039 202c          	jra	L173
1388  003b               L773:
1389                     ; 276 		} else if (_ua.b[7] == 0x07) {
1391  003b a107          	cp	a,#7
1392  003d 261c          	jrne	L114
1393                     ; 277 			hnCnt.comm = 0;
1395  003f ad28          	call	LC021
1396  0041 6b01          	ld	(OFST+0,sp),a
1397  0043               L314:
1398                     ; 281 				pre_heat_temp[i] = hn_hyundai_change_temp(i, 0);
1400  0043 5f            	clrw	x
1401  0044 97            	ld	xl,a
1402  0045 89            	pushw	x
1403  0046 5f            	clrw	x
1404  0047 7b03          	ld	a,(OFST+2,sp)
1405  0049 95            	ld	xh,a
1406  004a cd0000        	call	_hn_hyundai_change_temp
1408  004d 85            	popw	x
1409  004e d70000        	ld	(_pre_heat_temp,x),a
1410                     ; 280 			for (i = 0 ; i < 8 ; i++) {
1412  0051 0c01          	inc	(OFST+0,sp)
1415  0053 7b01          	ld	a,(OFST+0,sp)
1416  0055 a108          	cp	a,#8
1417  0057 25ea          	jrult	L314
1419  0059 200c          	jra	L173
1420  005b               L114:
1421                     ; 283 		} else if (_ua.b[7] == 0x08) {
1423  005b a108          	cp	a,#8
1424  005d 2608          	jrne	L173
1425                     ; 284 			hnCnt.mode = MODE_HOT;
1427                     ; 285 			hnCnt.setup_temp = 0xFF;
1429  005f               LC020:
1431  005f 35010001      	mov	_hnCnt+1,#1
1433  0063 35ff0002      	mov	_hnCnt+2,#255
1434  0067               L173:
1435                     ; 288 }
1438  0067 84            	pop	a
1439  0068 81            	ret	
1440  0069               LC021:
1441  0069 725f0003      	clr	_hnCnt+3
1442                     ; 271 			hnCnt.mode = MODE_OUT;
1444  006d 35020001      	mov	_hnCnt+1,#2
1445                     ; 272 			hnCnt.setup_temp = 0xFF;
1447  0071 35ff0002      	mov	_hnCnt+2,#255
1448                     ; 273 			for (i = 0 ; i < 8 ; i++) {
1450  0075 4f            	clr	a
1451  0076 81            	ret	
1489                     ; 290 void hn_hyundai_ptc_make(void) {
1490                     .text:	section	.text,new
1491  0000               _hn_hyundai_ptc_make:
1493  0000 88            	push	a
1494       00000001      OFST:	set	1
1497                     ; 293 	if ((_ua.b[6] & 0x10) == 0x10) {
1499  0001 c6000a        	ld	a,__ua+10
1500  0004 a40f          	and	a,#15
1501  0006 7209000a21    	btjf	__ua+10,#4,L144
1502                     ; 294 		mode = _ua.b[6] & 0x0F;
1504  000b 6b01          	ld	(OFST+0,sp),a
1505                     ; 295 		if (_ua.b[4] == 0x01) { // 상태 요구
1507  000d c60008        	ld	a,__ua+8
1508  0010 a101          	cp	a,#1
1509  0012 2606          	jrne	L344
1510                     ; 296 			if (mode == 0x00) {
1512  0014 7b01          	ld	a,(OFST+0,sp)
1513  0016 260f          	jrne	LC024
1514                     ; 297 				hn_hyundai_ptc_make_state_all();
1517  0018 2022          	jp	LC022
1518                     ; 299 				hn_hyundai_ptc_make_state(mode);
1520  001a               L344:
1521                     ; 301 		} else if (_ua.b[4] == 0x02) { // 제어 요구
1523  001a a102          	cp	a,#2
1524  001c 2621          	jrne	L164
1525                     ; 302 			if (mode == 0x00) {
1527  001e 7b01          	ld	a,(OFST+0,sp)
1528                     ; 303 				hn_hyundai_ptc_make_controll_all();
1530                     ; 304 				hn_hyundai_ptc_make_state_all();
1533  0020 2717          	jreq	LC023
1534                     ; 306 				hn_hyundai_ptc_make_controll(mode);
1536  0022 cd0000        	call	_hn_hyundai_ptc_make_controll
1538                     ; 307 				hn_hyundai_ptc_make_state(mode);
1540  0025 7b01          	ld	a,(OFST+0,sp)
1541  0027               LC024:
1543  0027 cd0000        	call	_hn_hyundai_ptc_make_state
1545  002a 2013          	jra	L164
1546  002c               L144:
1547                     ; 311 		mode = _ua.b[6] & 0x0F;
1549  002c 6b01          	ld	(OFST+0,sp),a
1550                     ; 312 		if (_ua.b[4] == 0x02) {				// 제어 요구
1552  002e c60008        	ld	a,__ua+8
1553  0031 a102          	cp	a,#2
1554  0033 260a          	jrne	L164
1555                     ; 313 			if (mode == 0x00) {
1557  0035 7b01          	ld	a,(OFST+0,sp)
1558  0037 2606          	jrne	L164
1559                     ; 314 				hn_hyundai_ptc_make_controll_all();
1561  0039               LC023:
1563  0039 cd0000        	call	_hn_hyundai_ptc_make_controll_all
1565                     ; 315 				hn_hyundai_ptc_make_state_all();
1567  003c               LC022:
1570  003c cd0000        	call	_hn_hyundai_ptc_make_state_all
1572  003f               L164:
1573                     ; 319 }
1576  003f 84            	pop	a
1577  0040 81            	ret	
1618                     ; 323 uint8_t hn_hyundai_check_checkSum(void) {
1619                     .text:	section	.text,new
1620  0000               _hn_hyundai_check_checkSum:
1622  0000 89            	pushw	x
1623       00000002      OFST:	set	2
1626                     ; 327 	s = 0;
1628  0001 0f01          	clr	(OFST-1,sp)
1629                     ; 328 	for (i = 0 ; i < 9 ; i++) {
1631  0003 4f            	clr	a
1632  0004 6b02          	ld	(OFST+0,sp),a
1633  0006               L505:
1634                     ; 329 		s ^= _ua.b[i];
1636  0006 5f            	clrw	x
1637  0007 97            	ld	xl,a
1638  0008 7b01          	ld	a,(OFST-1,sp)
1639  000a d80004        	xor	a,(__ua+4,x)
1640  000d 6b01          	ld	(OFST-1,sp),a
1641                     ; 328 	for (i = 0 ; i < 9 ; i++) {
1643  000f 0c02          	inc	(OFST+0,sp)
1646  0011 7b02          	ld	a,(OFST+0,sp)
1647  0013 a109          	cp	a,#9
1648  0015 25ef          	jrult	L505
1649                     ; 332 	if (s == _ua.b[9]) {
1651  0017 7b01          	ld	a,(OFST-1,sp)
1652  0019 c1000d        	cp	a,__ua+13
1653  001c 2604          	jrne	L315
1654                     ; 333 		return 1;
1656  001e a601          	ld	a,#1
1658  0020 2001          	jra	L241
1659  0022               L315:
1660                     ; 336 	return 0;
1662  0022 4f            	clr	a
1664  0023               L241:
1666  0023 85            	popw	x
1667  0024 81            	ret	
1699                     ; 339 uint8_t hn_hyundai_ptc_base_check(void){
1700                     .text:	section	.text,new
1701  0000               _hn_hyundai_ptc_base_check:
1705                     ; 340 	if (hn_buf_count == 15) {
1707  0000 c60000        	ld	a,_hn_buf_count
1708  0003 a10f          	cp	a,#15
1709  0005 2604          	jrne	L525
1710                     ; 341 		hn_buf_count = 0;
1712  0007 725f0000      	clr	_hn_buf_count
1713  000b               L525:
1714                     ; 344 	if (_ua.b[0] != 0xF7) {
1716  000b c60004        	ld	a,__ua+4
1717  000e a1f7          	cp	a,#247
1718  0010 2702          	jreq	L725
1719                     ; 345 		hn_buf_error[hn_buf_count++] = 1;
1721  0012 2034          	jp	LC025
1722  0014               L725:
1723                     ; 349 	if (_ua.b[3] != 0x18) {
1725  0014 c60007        	ld	a,__ua+7
1726  0017 a118          	cp	a,#24
1727  0019 2702          	jreq	L135
1728                     ; 350 		hn_buf_error[hn_buf_count++] = 1;
1730  001b 202b          	jp	LC025
1731  001d               L135:
1732                     ; 354 	if (_ua.b[10] != 0xEE) {
1734  001d c6000e        	ld	a,__ua+14
1735  0020 a1ee          	cp	a,#238
1736  0022 2702          	jreq	L335
1737                     ; 355 		hn_buf_error[hn_buf_count++] = 1;
1739  0024 2022          	jp	LC025
1740  0026               L335:
1741                     ; 359 	if (hn_hyundai_check_checkSum() == 0) {
1743  0026 cd0000        	call	_hn_hyundai_check_checkSum
1745  0029 4d            	tnz	a
1746  002a 2606          	jrne	L535
1747                     ; 360 		hn_error_checksum = 1;
1749  002c 35010000      	mov	_hn_error_checksum,#1
1750                     ; 361 		hn_buf_error[hn_buf_count++] = 1;
1752  0030 2016          	jp	LC025
1753  0032               L535:
1754                     ; 365 	hn_error_checksum = 0;
1756  0032 725f0000      	clr	_hn_error_checksum
1757                     ; 366 	hn_type = HN_TYPE_HYUNDAI;
1759  0036 35050000      	mov	_hn_type,#5
1760                     ; 367 	hn_connect = 0;
1762  003a 725f0000      	clr	_hn_connect
1763                     ; 368 	hn_buf_error[hn_buf_count++] = 0;
1765  003e ad0f          	call	LC026
1766  0040 724f0000      	clr	(_hn_buf_error,x)
1767  0044 c70000        	ld	_ext_hn_error,a
1768                     ; 372 	return 1;
1772  0047 81            	ret	
1773  0048               LC025:
1774  0048 ad05          	call	LC026
1775  004a d70000        	ld	(_hn_buf_error,x),a
1776                     ; 346 		return 0;
1778  004d 4f            	clr	a
1781  004e 81            	ret	
1782  004f               LC026:
1783  004f c60000        	ld	a,_hn_buf_count
1784  0052 725c0000      	inc	_hn_buf_count
1785  0056 5f            	clrw	x
1786  0057 97            	ld	xl,a
1787                     ; 370 	ext_hn_error = 1;                             // 2015.11.03   홈넷 연결에러 체크
1789  0058 a601          	ld	a,#1
1790  005a 81            	ret	
1816                     ; 375 void hn_hyundai_ptc_check (void) {
1817                     .text:	section	.text,new
1818  0000               _hn_hyundai_ptc_check:
1822                     ; 377 	if (hn_hyundai_ptc_base_check() == 0) {
1824  0000 cd0000        	call	_hn_hyundai_ptc_base_check
1826  0003 4d            	tnz	a
1827  0004 2601          	jrne	L745
1828                     ; 378 		return;
1831  0006 81            	ret	
1832  0007               L745:
1833                     ; 381 	hn_hyundai_ptc_make();
1836                     ; 383 }
1839  0007 cc0000        	jp	_hn_hyundai_ptc_make
1864                     	xdef	_hn_hyundai_ptc_base_check
1865                     	xdef	_hn_hyundai_check_checkSum
1866                     	xdef	_hn_hyundai_ptc_make
1867                     	xdef	_hn_hyundai_ptc_make_controll_all
1868                     	xdef	_hn_hyundai_ptc_make_state_all
1869                     	xdef	_hn_hyundai_ptc_make_controll
1870                     	xdef	_hn_hyundai_ptc_make_state
1871                     	xdef	_hn_hyundai_change_temp
1872                     	xdef	_hn_hyundai_change_curr_mode
1873                     	xdef	_hn_hyundai_change_mode
1874                     	xdef	_hn_hyundai_make_checkSum
1875                     	switch	.bss
1876  0000               _pre_heat_temp:
1877  0000 000000000000  	ds.b	8
1878                     	xdef	_pre_heat_temp
1879                     	xref	_msg_hn_more
1880                     	xref	_msg_hn
1881                     	xref	_hnCnts
1882                     	xref	_hnCnt
1883                     	xref	_rcInfo
1884                     	xref	_funcInfo
1885                     	xref	__ua
1886                     	xdef	_hn_hyundai_ptc_check
1887                     	xref	_hn_buf_count
1888                     	xref	_hn_buf_error
1889                     	xref	_hn_error_checksum
1890                     	xref	_hn_type
1891                     	xref	_hn_connect
1892                     	xref	_ext_hn_error
1912                     	end
