   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  22                     	switch	.data
  23  0000               ___s:
  24  0000 00            	dc.b	0
  25  0001               ___sUp:
  26  0001 00            	dc.b	0
  27  0002               ___sDn:
  28  0002 00            	dc.b	0
  29  0003               ___sInfo:
  30  0003 02            	dc.b	2
  31  0004               ___sRoom:
  32  0004 00            	dc.b	0
  33  0005               __updateTimer:
  34  0005 00            	dc.b	0
  35  0006               __updateBit:
  36  0006 00            	dc.b	0
  37  0007               __updateCount:
  38  0007 0a            	dc.b	10
  39  0008               __disp_temp:
  40  0008 01            	dc.b	1
  41  0009               __backup_backlight:
  42  0009 00            	dc.b	0
  43  000a               __backup_backlight2:
  44  000a 00            	dc.b	0
  45  000b               _start_flag:
  46  000b 01            	dc.b	1
  47  000c               _error_display_mode:
  48  000c 00            	dc.b	0
  49  000d               _error_display_status:
  50  000d 00            	dc.b	0
  51  000e               __led_key_port:
  52  000e 500f          	dc.w	20495
  53  0010               __led_key_pin:
  54  0010 80            	dc.b	128
 100                     ; 74 void lcd_disp_rid_hw(uint8_t id, uint8_t t) 
 100                     ; 75 {
 102                     .text:	section	.text,new
 103  0000               _lcd_disp_rid_hw:
 107                     ; 77 	_led_key_status = t==0 ? 1 : 0;
 109  0000 9f            	ld	a,xl
 110  0001 4d            	tnz	a
 111  0002 2603          	jrne	L6
 112  0004 4c            	inc	a
 113  0005 2001          	jra	L01
 114  0007               L6:
 115  0007 4f            	clr	a
 116  0008               L01:
 117  0008 c70000        	ld	__led_key_status,a
 118                     ; 79 	if( t==0 )
 120  000b 9f            	ld	a,xl
 121  000c 4d            	tnz	a
 122  000d 2605          	jrne	L72
 123                     ; 80 		D_IO_HIGH(GPIOD, GPIO_Pin_7);
 125  000f 721e500f      	bset	20495,#7
 128  0013 81            	ret	
 129  0014               L72:
 130                     ; 82 		D_IO_LOW(GPIOD, GPIO_Pin_7);
 132  0014 721f500f      	bres	20495,#7
 133                     ; 84 }
 136  0018 81            	ret	
 179                     ; 86 void	error_display(uint8_t type, uint8_t err)
 179                     ; 87 {
 180                     .text:	section	.text,new
 181  0000               _error_display:
 183  0000 89            	pushw	x
 184       00000000      OFST:	set	0
 187                     ; 88 	if( error_display_mode == 1 )
 189  0001 c6000c        	ld	a,_error_display_mode
 190  0004 4a            	dec	a
 191  0005 2712          	jreq	L41
 192                     ; 89 		return;
 194                     ; 91 	ui_error = err;
 196  0007 7b02          	ld	a,(OFST+2,sp)
 197  0009 c70000        	ld	_ui_error,a
 198                     ; 92 	ui_error_type = type;
 200  000c 7b01          	ld	a,(OFST+1,sp)
 201  000e c70000        	ld	_ui_error_type,a
 202                     ; 94 	error_display_mode = 1;
 204  0011 3501000c      	mov	_error_display_mode,#1
 205                     ; 95 	error_display_status = 1;
 207  0015 3501000d      	mov	_error_display_status,#1
 208                     ; 96 }
 209  0019               L41:
 212  0019 85            	popw	x
 213  001a 81            	ret	
 254                     ; 98 void	ui_Open(void)
 254                     ; 99 {
 255                     .text:	section	.text,new
 256  0000               _ui_Open:
 258  0000 88            	push	a
 259       00000001      OFST:	set	1
 262                     ; 143 	for( i=0; i<8; i++ )
 264  0001 4f            	clr	a
 265  0002 6b01          	ld	(OFST+0,sp),a
 266  0004               L76:
 267                     ; 145 		uiInfo.remote_time[i] = 4;
 269  0004 5f            	clrw	x
 270  0005 97            	ld	xl,a
 271  0006 a604          	ld	a,#4
 272  0008 d7004e        	ld	(_uiInfo+77,x),a
 273                     ; 146 		uiInfo.remote_banb[i] = 30;
 275  000b 5f            	clrw	x
 276  000c 7b01          	ld	a,(OFST+0,sp)
 277  000e 97            	ld	xl,a
 278  000f a61e          	ld	a,#30
 279  0011 d70056        	ld	(_uiInfo+85,x),a
 280                     ; 143 	for( i=0; i<8; i++ )
 282  0014 0c01          	inc	(OFST+0,sp)
 285  0016 7b01          	ld	a,(OFST+0,sp)
 286  0018 a108          	cp	a,#8
 287  001a 25e8          	jrult	L76
 288                     ; 149 	uiInfo.cntlMode = FW_GET_CNTLMODE;
 290  001c a608          	ld	a,#8
 291  001e cd0000        	call	_file_read
 293  0021 c70004        	ld	_uiInfo+3,a
 294                     ; 150 	uiInfo.id = FW_GET_ID;
 296  0024 a60a          	ld	a,#10
 297  0026 cd0000        	call	_file_read
 299  0029 c70005        	ld	_uiInfo+4,a
 300                     ; 151 	uiInfo.cnt = FW_GET_CNT;
 302  002c a60b          	ld	a,#11
 303  002e cd0000        	call	_file_read
 305  0031 c70006        	ld	_uiInfo+5,a
 306                     ; 152 	uiInfo.cnt_sub = FW_GET_CNT_SUB;
 308  0034 a62b          	ld	a,#43
 309  0036 cd0000        	call	_file_read
 311  0039 c70007        	ld	_uiInfo+6,a
 312                     ; 153 	UI_SET(uiInfo.cnt, 8)
 314  003c c60006        	ld	a,_uiInfo+5
 315  003f 2605          	jrne	L57
 318  0041 a608          	ld	a,#8
 319  0043 c70006        	ld	_uiInfo+5,a
 320  0046               L57:
 321                     ; 154 	UI_SET(uiInfo.cnt_sub, 8)
 323  0046 725d0007      	tnz	_uiInfo+6
 324  004a 2604          	jrne	L77
 327  004c 35080007      	mov	_uiInfo+6,#8
 328  0050               L77:
 329                     ; 155 	if( uiInfo.cnt >= 8 )	uiInfo.cnt = 8;
 331  0050 a108          	cp	a,#8
 332  0052 2504          	jrult	L101
 335  0054 35080006      	mov	_uiInfo+5,#8
 336  0058               L101:
 337                     ; 156 	if( uiInfo.cnt_sub >= 8 )	uiInfo.cnt_sub = 8;
 339  0058 c60007        	ld	a,_uiInfo+6
 340  005b a108          	cp	a,#8
 341  005d 2504          	jrult	L301
 344  005f 35080007      	mov	_uiInfo+6,#8
 345  0063               L301:
 346                     ; 158 	uiInfo.opMode = FW_GET_OPMODE;
 348  0063 a60c          	ld	a,#12
 349  0065 cd0000        	call	_file_read
 351  0068 c70008        	ld	_uiInfo+7,a
 352                     ; 159 	uiInfo.mode = FW_GET_MODE;
 354  006b a609          	ld	a,#9
 355  006d cd0000        	call	_file_read
 357  0070 c70009        	ld	_uiInfo+8,a
 358                     ; 161 	uiInfo.controlMode = FW_GET_CNT_MODE;
 360  0073 a60d          	ld	a,#13
 361  0075 cd0000        	call	_file_read
 363  0078 c7000a        	ld	_uiInfo+9,a
 364                     ; 162 	uiInfo.valve = FW_GET_VALVE;
 366  007b a60e          	ld	a,#14
 367  007d cd0000        	call	_file_read
 369  0080 c7000b        	ld	_uiInfo+10,a
 370                     ; 163 	uiInfo.valve_sub = FW_GET_VALVE_SUB;
 372  0083 a62c          	ld	a,#44
 373  0085 cd0000        	call	_file_read
 375  0088 c7000c        	ld	_uiInfo+11,a
 376                     ; 164 	UI_SET(uiInfo.valve, 8)
 378  008b c6000b        	ld	a,_uiInfo+10
 379  008e 2605          	jrne	L501
 382  0090 a608          	ld	a,#8
 383  0092 c7000b        	ld	_uiInfo+10,a
 384  0095               L501:
 385                     ; 165 	UI_SET(uiInfo.valve_sub, 8)
 387  0095 725d000c      	tnz	_uiInfo+11
 388  0099 2604          	jrne	L701
 391  009b 3508000c      	mov	_uiInfo+11,#8
 392  009f               L701:
 393                     ; 166 	if( uiInfo.valve >= 8 )	uiInfo.valve = 8;
 395  009f a108          	cp	a,#8
 396  00a1 2504          	jrult	L111
 399  00a3 3508000b      	mov	_uiInfo+10,#8
 400  00a7               L111:
 401                     ; 167 	if( uiInfo.valve_sub >= 8 )	uiInfo.valve_sub = 8;
 403  00a7 c6000c        	ld	a,_uiInfo+11
 404  00aa a108          	cp	a,#8
 405  00ac 2504          	jrult	L311
 408  00ae 3508000c      	mov	_uiInfo+11,#8
 409  00b2               L311:
 410                     ; 169 	uiInfo.repeat = FW_GET_REPEAT;	
 412  00b2 a60f          	ld	a,#15
 413  00b4 cd0000        	call	_file_read
 415  00b7 c7000d        	ld	_uiInfo+12,a
 416                     ; 171 	UI_SET(uiInfo.repeat, 30)
 418  00ba 2604          	jrne	L511
 421  00bc 351e000d      	mov	_uiInfo+12,#30
 422  00c0               L511:
 423                     ; 175 	uiInfo.reserve = FW_GET_RESERVE;	
 425  00c0 a610          	ld	a,#16
 426  00c2 cd0000        	call	_file_read
 428  00c5 c7000e        	ld	_uiInfo+13,a
 429                     ; 176 	UI_SET(uiInfo.reserve, 24)
 431  00c8 2604          	jrne	L711
 434  00ca 3518000e      	mov	_uiInfo+13,#24
 435  00ce               L711:
 436                     ; 177 	uiInfo.tSetup = FW_GET_TSETUP;	
 438  00ce a611          	ld	a,#17
 439  00d0 cd0000        	call	_file_read
 441  00d3 c7000f        	ld	_uiInfo+14,a
 442                     ; 178 	UI_SET(uiInfo.tSetup, 50)
 444  00d6 2604          	jrne	L121
 447  00d8 3532000f      	mov	_uiInfo+14,#50
 448  00dc               L121:
 449                     ; 179 	uiInfo.poType = FW_GET_POTYPE;	
 451  00dc a612          	ld	a,#18
 452  00de cd0000        	call	_file_read
 454  00e1 c70010        	ld	_uiInfo+15,a
 455                     ; 180 	uiInfo.houseCapa = FW_GET_HOUSECAPA;
 457  00e4 a613          	ld	a,#19
 458  00e6 cd0000        	call	_file_read
 460  00e9 c70011        	ld	_uiInfo+16,a
 461                     ; 181 	UI_SET(uiInfo.houseCapa, 160)
 463  00ec 2604          	jrne	L321
 466  00ee 35a00011      	mov	_uiInfo+16,#160
 467  00f2               L321:
 468                     ; 182 	uiInfo.tOffset = FW_GET_TOFFSET;
 470  00f2 a614          	ld	a,#20
 471  00f4 cd0000        	call	_file_read
 473  00f7 c70012        	ld	_uiInfo+17,a
 474                     ; 183 	UI_SET(uiInfo.tOffset, 100);
 476  00fa 2604          	jrne	L521
 479  00fc 35640012      	mov	_uiInfo+17,#100
 480  0100               L521:
 481                     ; 185 	uiInfo.tempOffset = FW_GET_TEMPOFFSET;
 484  0100 a627          	ld	a,#39
 485  0102 cd0000        	call	_file_read
 487  0105 c70013        	ld	_uiInfo+18,a
 488                     ; 186 	UI_SET(uiInfo.tempOffset, 80)
 490  0108 2604          	jrne	L721
 493  010a 35500013      	mov	_uiInfo+18,#80
 494  010e               L721:
 495                     ; 187 	uiInfo.lpmType = FW_GET_LPM;
 497  010e a628          	ld	a,#40
 498  0110 cd0000        	call	_file_read
 500  0113 c70014        	ld	_uiInfo+19,a
 501                     ; 188 	uiInfo.lpmType_sub = FW_GET_LPM_SUB;
 503  0116 a62d          	ld	a,#45
 504  0118 cd0000        	call	_file_read
 506  011b c70015        	ld	_uiInfo+20,a
 507                     ; 194 	_disp_mode2 = FW_GET_DISPMODE;
 509  011e a629          	ld	a,#41
 510  0120 cd0000        	call	_file_read
 512  0123 c70000        	ld	__disp_mode2,a
 513                     ; 195 	_disp_mode = 0xff;
 515  0126 35ff0000      	mov	__disp_mode,#255
 516                     ; 197 	if (_disp_mode2 == 0x00) {
 518  012a 2606          	jrne	L131
 519                     ; 198 		__sUp = 5;
 521  012c 35050001      	mov	___sUp,#5
 523  0130 202c          	jra	L331
 524  0132               L131:
 525                     ; 199 	} else if (_disp_mode2 == RC_MODE_RESERVE){
 527  0132 a108          	cp	a,#8
 528  0134 2606          	jrne	L531
 529                     ; 200 		__sUp = 1;
 531  0136 35010001      	mov	___sUp,#1
 533  013a 2022          	jra	L331
 534  013c               L531:
 535                     ; 201 	} else if (_disp_mode2 == RC_MODE_REPEAT) {
 537  013c a110          	cp	a,#16
 538  013e 2606          	jrne	L141
 539                     ; 202 		__sUp = 2;
 541  0140 35020001      	mov	___sUp,#2
 543  0144 2018          	jra	L331
 544  0146               L141:
 545                     ; 203 	} else if (_disp_mode2 == RC_MODE_STOP) {
 547  0146 a104          	cp	a,#4
 548  0148 2606          	jrne	L541
 549                     ; 204 		__sUp = 5;
 551  014a 35050001      	mov	___sUp,#5
 553  014e 200e          	jra	L331
 554  0150               L541:
 555                     ; 205 	} else if (_disp_mode2 == RC_MODE_OUT) {
 557  0150 a102          	cp	a,#2
 558  0152 2606          	jrne	L151
 559                     ; 206 		__sUp = 16;
 561  0154 35100001      	mov	___sUp,#16
 563  0158 2004          	jra	L331
 564  015a               L151:
 565                     ; 208 		__sUp = 0;
 567  015a 725f0001      	clr	___sUp
 568  015e               L331:
 569                     ; 211 	uiInfo.valve_len[0] = FW_GET_VL_1;
 571  015e a615          	ld	a,#21
 572  0160 cd0000        	call	_file_read
 574  0163 c70016        	ld	_uiInfo+21,a
 575                     ; 212 	uiInfo.valve_len[1] = FW_GET_VL_2;
 577  0166 a616          	ld	a,#22
 578  0168 cd0000        	call	_file_read
 580  016b c70017        	ld	_uiInfo+22,a
 581                     ; 213 	uiInfo.valve_len[2] = FW_GET_VL_3;
 583  016e a617          	ld	a,#23
 584  0170 cd0000        	call	_file_read
 586  0173 c70018        	ld	_uiInfo+23,a
 587                     ; 214 	uiInfo.valve_len[3] = FW_GET_VL_4;
 589  0176 a618          	ld	a,#24
 590  0178 cd0000        	call	_file_read
 592  017b c70019        	ld	_uiInfo+24,a
 593                     ; 215 	uiInfo.valve_len[4] = FW_GET_VL_5;
 595  017e a619          	ld	a,#25
 596  0180 cd0000        	call	_file_read
 598  0183 c7001a        	ld	_uiInfo+25,a
 599                     ; 216 	uiInfo.valve_len[5] = FW_GET_VL_6;
 601  0186 a61a          	ld	a,#26
 602  0188 cd0000        	call	_file_read
 604  018b c7001b        	ld	_uiInfo+26,a
 605                     ; 217 	uiInfo.valve_len[6] = FW_GET_VL_7;
 607  018e a61b          	ld	a,#27
 608  0190 cd0000        	call	_file_read
 610  0193 c7001c        	ld	_uiInfo+27,a
 611                     ; 218 	uiInfo.valve_len[7] = FW_GET_VL_8;
 613  0196 a61c          	ld	a,#28
 614  0198 cd0000        	call	_file_read
 616  019b c7001d        	ld	_uiInfo+28,a
 617                     ; 220 	uiInfo.valve_rc[0] = FW_GET_VRC_1;
 619  019e a61d          	ld	a,#29
 620  01a0 cd0000        	call	_file_read
 622  01a3 c7001e        	ld	_uiInfo+29,a
 623                     ; 221 	uiInfo.valve_rc[1] = FW_GET_VRC_2;
 625  01a6 a61e          	ld	a,#30
 626  01a8 cd0000        	call	_file_read
 628  01ab c7001f        	ld	_uiInfo+30,a
 629                     ; 222 	uiInfo.valve_rc[2] = FW_GET_VRC_3;
 631  01ae a61f          	ld	a,#31
 632  01b0 cd0000        	call	_file_read
 634  01b3 c70020        	ld	_uiInfo+31,a
 635                     ; 223 	uiInfo.valve_rc[3] = FW_GET_VRC_4;
 637  01b6 a620          	ld	a,#32
 638  01b8 cd0000        	call	_file_read
 640  01bb c70021        	ld	_uiInfo+32,a
 641                     ; 224 	uiInfo.valve_rc[4] = FW_GET_VRC_5;
 643  01be a621          	ld	a,#33
 644  01c0 cd0000        	call	_file_read
 646  01c3 c70022        	ld	_uiInfo+33,a
 647                     ; 225 	uiInfo.valve_rc[5] = FW_GET_VRC_6;
 649  01c6 a622          	ld	a,#34
 650  01c8 cd0000        	call	_file_read
 652  01cb c70023        	ld	_uiInfo+34,a
 653                     ; 226 	uiInfo.valve_rc[6] = FW_GET_VRC_7;
 655  01ce a623          	ld	a,#35
 656  01d0 cd0000        	call	_file_read
 658  01d3 c70024        	ld	_uiInfo+35,a
 659                     ; 227 	uiInfo.valve_rc[7] = FW_GET_VRC_8;
 661  01d6 a624          	ld	a,#36
 662  01d8 cd0000        	call	_file_read
 664  01db c70025        	ld	_uiInfo+36,a
 665                     ; 228 	uiInfo.valve_rc[0] = 1;
 667  01de 3501001e      	mov	_uiInfo+29,#1
 668                     ; 230 	uiInfo.valve_sub_len[0] = FW_GET_VL_1_SUB;
 670  01e2 a62e          	ld	a,#46
 671  01e4 cd0000        	call	_file_read
 673  01e7 c70026        	ld	_uiInfo+37,a
 674                     ; 231 	uiInfo.valve_sub_len[1] = FW_GET_VL_2_SUB;
 676  01ea a62f          	ld	a,#47
 677  01ec cd0000        	call	_file_read
 679  01ef c70027        	ld	_uiInfo+38,a
 680                     ; 232 	uiInfo.valve_sub_len[2] = FW_GET_VL_3_SUB;
 682  01f2 a630          	ld	a,#48
 683  01f4 cd0000        	call	_file_read
 685  01f7 c70028        	ld	_uiInfo+39,a
 686                     ; 233 	uiInfo.valve_sub_len[3] = FW_GET_VL_4_SUB;
 688  01fa a631          	ld	a,#49
 689  01fc cd0000        	call	_file_read
 691  01ff c70029        	ld	_uiInfo+40,a
 692                     ; 234 	uiInfo.valve_sub_len[4] = FW_GET_VL_5_SUB;
 694  0202 a632          	ld	a,#50
 695  0204 cd0000        	call	_file_read
 697  0207 c7002a        	ld	_uiInfo+41,a
 698                     ; 235 	uiInfo.valve_sub_len[5] = FW_GET_VL_6_SUB;
 700  020a a633          	ld	a,#51
 701  020c cd0000        	call	_file_read
 703  020f c7002b        	ld	_uiInfo+42,a
 704                     ; 236 	uiInfo.valve_sub_len[6] = FW_GET_VL_7_SUB;
 706  0212 a634          	ld	a,#52
 707  0214 cd0000        	call	_file_read
 709  0217 c7002c        	ld	_uiInfo+43,a
 710                     ; 237 	uiInfo.valve_sub_len[7] = FW_GET_VL_8_SUB;
 712  021a a635          	ld	a,#53
 713  021c cd0000        	call	_file_read
 715  021f c7002d        	ld	_uiInfo+44,a
 716                     ; 239 	uiInfo.valve_sub_rc[0] = FW_GET_VRC_1_SUB;
 718  0222 a636          	ld	a,#54
 719  0224 cd0000        	call	_file_read
 721  0227 c7002e        	ld	_uiInfo+45,a
 722                     ; 240 	uiInfo.valve_sub_rc[1] = FW_GET_VRC_2_SUB;
 724  022a a637          	ld	a,#55
 725  022c cd0000        	call	_file_read
 727  022f c7002f        	ld	_uiInfo+46,a
 728                     ; 241 	uiInfo.valve_sub_rc[2] = FW_GET_VRC_3_SUB;
 730  0232 a638          	ld	a,#56
 731  0234 cd0000        	call	_file_read
 733  0237 c70030        	ld	_uiInfo+47,a
 734                     ; 242 	uiInfo.valve_sub_rc[3] = FW_GET_VRC_4_SUB;
 736  023a a639          	ld	a,#57
 737  023c cd0000        	call	_file_read
 739  023f c70031        	ld	_uiInfo+48,a
 740                     ; 243 	uiInfo.valve_sub_rc[4] = FW_GET_VRC_5_SUB;
 742  0242 a63a          	ld	a,#58
 743  0244 cd0000        	call	_file_read
 745  0247 c70032        	ld	_uiInfo+49,a
 746                     ; 244 	uiInfo.valve_sub_rc[5] = FW_GET_VRC_6_SUB;
 748  024a a63b          	ld	a,#59
 749  024c cd0000        	call	_file_read
 751  024f c70033        	ld	_uiInfo+50,a
 752                     ; 245 	uiInfo.valve_sub_rc[6] = FW_GET_VRC_7_SUB;
 754  0252 a63c          	ld	a,#60
 755  0254 cd0000        	call	_file_read
 757  0257 c70034        	ld	_uiInfo+51,a
 758                     ; 246 	uiInfo.valve_sub_rc[7] = FW_GET_VRC_8_SUB;
 760  025a a63d          	ld	a,#61
 761  025c cd0000        	call	_file_read
 763  025f c70035        	ld	_uiInfo+52,a
 764                     ; 248 	_boiler_water_shower = FW_GET_B_SHOWER;
 766  0262 a625          	ld	a,#37
 767  0264 ad32          	call	LC001
 768  0266 c70000        	ld	__boiler_water_shower,a
 769                     ; 250 	UI_SET(_boiler_water_shower, 50)
 771  0269 2604          	jrne	L551
 774  026b 35320000      	mov	__boiler_water_shower,#50
 775  026f               L551:
 776                     ; 251 	_boiler_water_heat = FW_GET_B_HEAT;
 778  026f a626          	ld	a,#38
 779  0271 ad25          	call	LC001
 780  0273 c70000        	ld	__boiler_water_heat,a
 781                     ; 253 	UI_SET(_boiler_water_heat, 70)
 783  0276 2604          	jrne	L751
 786  0278 35460000      	mov	__boiler_water_heat,#70
 787  027c               L751:
 788                     ; 254 	_backlight = FW_GET_BACKLIGHT;
 790  027c a62a          	ld	a,#42
 791  027e cd0000        	call	_file_read
 793  0281 c70000        	ld	__backlight,a
 794                     ; 256 	UI_SET(_backlight, BL_2)
 796  0284 2604          	jrne	L161
 799  0286 35070000      	mov	__backlight,#7
 800  028a               L161:
 801                     ; 260 	uiInfo.plc = FW_GET_PLC;
 803  028a a63e          	ld	a,#62
 804  028c cd0000        	call	_file_read
 806  028f c70065        	ld	_uiInfo+100,a
 807                     ; 262 	_backup_backlight = 0;
 809  0292 725f0009      	clr	__backup_backlight
 810                     ; 263 }
 813  0296 84            	pop	a
 814  0297 81            	ret	
 815  0298               LC001:
 816  0298 cd0000        	call	_file_read
 818                     ; 249 	_boiler_water_shower = (_boiler_water_shower/5)*5;
 820  029b 5f            	clrw	x
 821  029c 97            	ld	xl,a
 822  029d a605          	ld	a,#5
 823  029f 62            	div	x,a
 824  02a0 a605          	ld	a,#5
 825  02a2 42            	mul	x,a
 826  02a3 9f            	ld	a,xl
 827  02a4 81            	ret	
 830                     .const:	section	.text
 831  0000               __keypwMaster:
 832  0000 04            	dc.b	4
 833  0001 03            	dc.b	3
 834  0002 04            	dc.b	4
 835  0003 03            	dc.b	3
 836  0004 01            	dc.b	1
 837  0005 01            	dc.b	1
 838  0006               __keypwMaster2:
 839  0006 04            	dc.b	4
 840  0007 03            	dc.b	3
 841  0008 04            	dc.b	4
 842  0009 03            	dc.b	3
 843  000a 01            	dc.b	1
 844  000b 02            	dc.b	2
 845  000c               __keypwClient:
 846  000c 04            	dc.b	4
 847  000d 03            	dc.b	3
 848  000e 04            	dc.b	4
 849  000f 03            	dc.b	3
 850  0010 01            	dc.b	1
 851  0011 03            	dc.b	3
 852                     	switch	.data
 853  0011               __keypwIndexMaster:
 854  0011 00            	dc.b	0
 855  0012               __keypwIndexMaster2:
 856  0012 00            	dc.b	0
 857  0013               __keypwIndexClient:
 858  0013 00            	dc.b	0
 891                     ; 281 void	file_update2(uint8_t i)
 891                     ; 282 {
 892                     .text:	section	.text,new
 893  0000               _file_update2:
 895  0000 88            	push	a
 896       00000000      OFST:	set	0
 899                     ; 283 	FW_TOFFSET(uiInfo.tOffset);
 901  0001 c60012        	ld	a,_uiInfo+17
 902  0004 97            	ld	xl,a
 903  0005 a614          	ld	a,#20
 904  0007 95            	ld	xh,a
 905  0008 cd0000        	call	_file_write
 907                     ; 284 	if( i==0 )	FW_BACKLIGHT(_backlight);
 909  000b 7b01          	ld	a,(OFST+1,sp)
 910  000d 260a          	jrne	L771
 913  000f c60000        	ld	a,__backlight
 914  0012 97            	ld	xl,a
 915  0013 a62a          	ld	a,#42
 916  0015 95            	ld	xh,a
 917  0016 cd0000        	call	_file_write
 919  0019               L771:
 920                     ; 285 }
 923  0019 84            	pop	a
 924  001a 81            	ret	
 952                     ; 323 void	file_update(void)
 952                     ; 324 {
 953                     .text:	section	.text,new
 954  0000               _file_update:
 958                     ; 325 	FW_CNTLMODE(uiInfo.cntlMode);
 960  0000 c60004        	ld	a,_uiInfo+3
 961  0003 97            	ld	xl,a
 962  0004 a608          	ld	a,#8
 963  0006 95            	ld	xh,a
 964  0007 cd0000        	call	_file_write
 966                     ; 326 	FW_MODE(uiInfo.mode);
 968  000a c60009        	ld	a,_uiInfo+8
 969  000d 97            	ld	xl,a
 970  000e a609          	ld	a,#9
 971  0010 95            	ld	xh,a
 972  0011 cd0000        	call	_file_write
 974                     ; 327 	FW_ID(uiInfo.id);
 976  0014 c60005        	ld	a,_uiInfo+4
 977  0017 97            	ld	xl,a
 978  0018 a60a          	ld	a,#10
 979  001a 95            	ld	xh,a
 980  001b cd0000        	call	_file_write
 982                     ; 328 	FW_CNT(uiInfo.cnt);
 984  001e c60006        	ld	a,_uiInfo+5
 985  0021 97            	ld	xl,a
 986  0022 a60b          	ld	a,#11
 987  0024 95            	ld	xh,a
 988  0025 cd0000        	call	_file_write
 990                     ; 329 	FW_CNT_SUB(uiInfo.cnt_sub);
 992  0028 c60007        	ld	a,_uiInfo+6
 993  002b 97            	ld	xl,a
 994  002c a62b          	ld	a,#43
 995  002e 95            	ld	xh,a
 996  002f cd0000        	call	_file_write
 998                     ; 330 	FW_OPMODE(uiInfo.opMode);
1000  0032 c60008        	ld	a,_uiInfo+7
1001  0035 97            	ld	xl,a
1002  0036 a60c          	ld	a,#12
1003  0038 95            	ld	xh,a
1004  0039 cd0000        	call	_file_write
1006                     ; 332 	FW_CNT_MODE(uiInfo.controlMode);
1008  003c c6000a        	ld	a,_uiInfo+9
1009  003f 97            	ld	xl,a
1010  0040 a60d          	ld	a,#13
1011  0042 95            	ld	xh,a
1012  0043 cd0000        	call	_file_write
1014                     ; 333 	FW_VALVE(uiInfo.valve);
1016  0046 c6000b        	ld	a,_uiInfo+10
1017  0049 97            	ld	xl,a
1018  004a a60e          	ld	a,#14
1019  004c 95            	ld	xh,a
1020  004d cd0000        	call	_file_write
1022                     ; 334 	FW_VALVE_SUB(uiInfo.valve_sub);
1024  0050 c6000c        	ld	a,_uiInfo+11
1025  0053 97            	ld	xl,a
1026  0054 a62c          	ld	a,#44
1027  0056 95            	ld	xh,a
1028  0057 cd0000        	call	_file_write
1030                     ; 335 	FW_REPEAT(uiInfo.repeat);
1032  005a c6000d        	ld	a,_uiInfo+12
1033  005d 97            	ld	xl,a
1034  005e a60f          	ld	a,#15
1035  0060 95            	ld	xh,a
1036  0061 cd0000        	call	_file_write
1038                     ; 336 	FW_RESERVE(uiInfo.reserve);
1040  0064 c6000e        	ld	a,_uiInfo+13
1041  0067 97            	ld	xl,a
1042  0068 a610          	ld	a,#16
1043  006a 95            	ld	xh,a
1044  006b cd0000        	call	_file_write
1046                     ; 337 	FW_TSETUP(uiInfo.tSetup);
1048  006e c6000f        	ld	a,_uiInfo+14
1049  0071 97            	ld	xl,a
1050  0072 a611          	ld	a,#17
1051  0074 95            	ld	xh,a
1052  0075 cd0000        	call	_file_write
1054                     ; 339 	FW_POTYPE(uiInfo.poType);
1056  0078 c60010        	ld	a,_uiInfo+15
1057  007b 97            	ld	xl,a
1058  007c a612          	ld	a,#18
1059  007e 95            	ld	xh,a
1060  007f cd0000        	call	_file_write
1062                     ; 340 	FW_HOUSECAPA(uiInfo.houseCapa);
1064  0082 c60011        	ld	a,_uiInfo+16
1065  0085 97            	ld	xl,a
1066  0086 a613          	ld	a,#19
1067  0088 95            	ld	xh,a
1068  0089 cd0000        	call	_file_write
1070                     ; 341 	FW_TOFFSET(uiInfo.tOffset);
1072  008c c60012        	ld	a,_uiInfo+17
1073  008f 97            	ld	xl,a
1074  0090 a614          	ld	a,#20
1075  0092 95            	ld	xh,a
1076  0093 cd0000        	call	_file_write
1078                     ; 343 	FW_VALVE_INFOS
1080  0096 c60016        	ld	a,_uiInfo+21
1081  0099 97            	ld	xl,a
1082  009a a615          	ld	a,#21
1083  009c 95            	ld	xh,a
1084  009d cd0000        	call	_file_write
1088  00a0 c60017        	ld	a,_uiInfo+22
1089  00a3 97            	ld	xl,a
1090  00a4 a616          	ld	a,#22
1091  00a6 95            	ld	xh,a
1092  00a7 cd0000        	call	_file_write
1096  00aa c60018        	ld	a,_uiInfo+23
1097  00ad 97            	ld	xl,a
1098  00ae a617          	ld	a,#23
1099  00b0 95            	ld	xh,a
1100  00b1 cd0000        	call	_file_write
1104  00b4 c60019        	ld	a,_uiInfo+24
1105  00b7 97            	ld	xl,a
1106  00b8 a618          	ld	a,#24
1107  00ba 95            	ld	xh,a
1108  00bb cd0000        	call	_file_write
1112  00be c6001a        	ld	a,_uiInfo+25
1113  00c1 97            	ld	xl,a
1114  00c2 a619          	ld	a,#25
1115  00c4 95            	ld	xh,a
1116  00c5 cd0000        	call	_file_write
1120  00c8 c6001b        	ld	a,_uiInfo+26
1121  00cb 97            	ld	xl,a
1122  00cc a61a          	ld	a,#26
1123  00ce 95            	ld	xh,a
1124  00cf cd0000        	call	_file_write
1128  00d2 c6001c        	ld	a,_uiInfo+27
1129  00d5 97            	ld	xl,a
1130  00d6 a61b          	ld	a,#27
1131  00d8 95            	ld	xh,a
1132  00d9 cd0000        	call	_file_write
1136  00dc c6001d        	ld	a,_uiInfo+28
1137  00df 97            	ld	xl,a
1138  00e0 a61c          	ld	a,#28
1139  00e2 95            	ld	xh,a
1140  00e3 cd0000        	call	_file_write
1144  00e6 c60026        	ld	a,_uiInfo+37
1145  00e9 97            	ld	xl,a
1146  00ea a62e          	ld	a,#46
1147  00ec 95            	ld	xh,a
1148  00ed cd0000        	call	_file_write
1152  00f0 c60027        	ld	a,_uiInfo+38
1153  00f3 97            	ld	xl,a
1154  00f4 a62f          	ld	a,#47
1155  00f6 95            	ld	xh,a
1156  00f7 cd0000        	call	_file_write
1160  00fa c60028        	ld	a,_uiInfo+39
1161  00fd 97            	ld	xl,a
1162  00fe a630          	ld	a,#48
1163  0100 95            	ld	xh,a
1164  0101 cd0000        	call	_file_write
1168  0104 c60029        	ld	a,_uiInfo+40
1169  0107 97            	ld	xl,a
1170  0108 a631          	ld	a,#49
1171  010a 95            	ld	xh,a
1172  010b cd0000        	call	_file_write
1176  010e c6002a        	ld	a,_uiInfo+41
1177  0111 97            	ld	xl,a
1178  0112 a632          	ld	a,#50
1179  0114 95            	ld	xh,a
1180  0115 cd0000        	call	_file_write
1184  0118 c6002b        	ld	a,_uiInfo+42
1185  011b 97            	ld	xl,a
1186  011c a633          	ld	a,#51
1187  011e 95            	ld	xh,a
1188  011f cd0000        	call	_file_write
1192  0122 c6002c        	ld	a,_uiInfo+43
1193  0125 97            	ld	xl,a
1194  0126 a634          	ld	a,#52
1195  0128 95            	ld	xh,a
1196  0129 cd0000        	call	_file_write
1200  012c c6002d        	ld	a,_uiInfo+44
1201  012f 97            	ld	xl,a
1202  0130 a635          	ld	a,#53
1203  0132 95            	ld	xh,a
1204  0133 cd0000        	call	_file_write
1206                     ; 344 	FW_VALVE_RCINFOS
1208  0136 c6001e        	ld	a,_uiInfo+29
1209  0139 97            	ld	xl,a
1210  013a a61d          	ld	a,#29
1211  013c 95            	ld	xh,a
1212  013d cd0000        	call	_file_write
1216  0140 c6001f        	ld	a,_uiInfo+30
1217  0143 97            	ld	xl,a
1218  0144 a61e          	ld	a,#30
1219  0146 95            	ld	xh,a
1220  0147 cd0000        	call	_file_write
1224  014a c60020        	ld	a,_uiInfo+31
1225  014d 97            	ld	xl,a
1226  014e a61f          	ld	a,#31
1227  0150 95            	ld	xh,a
1228  0151 cd0000        	call	_file_write
1232  0154 c60021        	ld	a,_uiInfo+32
1233  0157 97            	ld	xl,a
1234  0158 a620          	ld	a,#32
1235  015a 95            	ld	xh,a
1236  015b cd0000        	call	_file_write
1240  015e c60022        	ld	a,_uiInfo+33
1241  0161 97            	ld	xl,a
1242  0162 a621          	ld	a,#33
1243  0164 95            	ld	xh,a
1244  0165 cd0000        	call	_file_write
1248  0168 c60023        	ld	a,_uiInfo+34
1249  016b 97            	ld	xl,a
1250  016c a622          	ld	a,#34
1251  016e 95            	ld	xh,a
1252  016f cd0000        	call	_file_write
1256  0172 c60024        	ld	a,_uiInfo+35
1257  0175 97            	ld	xl,a
1258  0176 a623          	ld	a,#35
1259  0178 95            	ld	xh,a
1260  0179 cd0000        	call	_file_write
1264  017c c60025        	ld	a,_uiInfo+36
1265  017f 97            	ld	xl,a
1266  0180 a624          	ld	a,#36
1267  0182 95            	ld	xh,a
1268  0183 cd0000        	call	_file_write
1272  0186 c6002e        	ld	a,_uiInfo+45
1273  0189 97            	ld	xl,a
1274  018a a636          	ld	a,#54
1275  018c 95            	ld	xh,a
1276  018d cd0000        	call	_file_write
1280  0190 c6002f        	ld	a,_uiInfo+46
1281  0193 97            	ld	xl,a
1282  0194 a637          	ld	a,#55
1283  0196 95            	ld	xh,a
1284  0197 cd0000        	call	_file_write
1288  019a c60030        	ld	a,_uiInfo+47
1289  019d 97            	ld	xl,a
1290  019e a638          	ld	a,#56
1291  01a0 95            	ld	xh,a
1292  01a1 cd0000        	call	_file_write
1296  01a4 c60031        	ld	a,_uiInfo+48
1297  01a7 97            	ld	xl,a
1298  01a8 a639          	ld	a,#57
1299  01aa 95            	ld	xh,a
1300  01ab cd0000        	call	_file_write
1304  01ae c60032        	ld	a,_uiInfo+49
1305  01b1 97            	ld	xl,a
1306  01b2 a63a          	ld	a,#58
1307  01b4 95            	ld	xh,a
1308  01b5 cd0000        	call	_file_write
1312  01b8 c60033        	ld	a,_uiInfo+50
1313  01bb 97            	ld	xl,a
1314  01bc a63b          	ld	a,#59
1315  01be 95            	ld	xh,a
1316  01bf cd0000        	call	_file_write
1320  01c2 c60034        	ld	a,_uiInfo+51
1321  01c5 97            	ld	xl,a
1322  01c6 a63c          	ld	a,#60
1323  01c8 95            	ld	xh,a
1324  01c9 cd0000        	call	_file_write
1328  01cc c60035        	ld	a,_uiInfo+52
1329  01cf 97            	ld	xl,a
1330  01d0 a63d          	ld	a,#61
1331  01d2 95            	ld	xh,a
1332  01d3 cd0000        	call	_file_write
1334                     ; 346 	FW_B_SHOWER(_boiler_water_shower);
1336  01d6 c60000        	ld	a,__boiler_water_shower
1337  01d9 97            	ld	xl,a
1338  01da a625          	ld	a,#37
1339  01dc 95            	ld	xh,a
1340  01dd cd0000        	call	_file_write
1342                     ; 347 	FW_B_HEAT(_boiler_water_heat);
1344  01e0 c60000        	ld	a,__boiler_water_heat
1345  01e3 97            	ld	xl,a
1346  01e4 a626          	ld	a,#38
1347  01e6 95            	ld	xh,a
1348  01e7 cd0000        	call	_file_write
1350                     ; 348 	FW_TEMPOFFSET(uiInfo.tempOffset);
1352  01ea c60013        	ld	a,_uiInfo+18
1353  01ed 97            	ld	xl,a
1354  01ee a627          	ld	a,#39
1355  01f0 95            	ld	xh,a
1356  01f1 cd0000        	call	_file_write
1358                     ; 349 	FW_LPM(uiInfo.lpmType);
1360  01f4 c60014        	ld	a,_uiInfo+19
1361  01f7 97            	ld	xl,a
1362  01f8 a628          	ld	a,#40
1363  01fa 95            	ld	xh,a
1364  01fb cd0000        	call	_file_write
1366                     ; 350 	FW_LPM_SUB(uiInfo.lpmType_sub);
1368  01fe c60015        	ld	a,_uiInfo+20
1369  0201 97            	ld	xl,a
1370  0202 a62d          	ld	a,#45
1371  0204 95            	ld	xh,a
1372  0205 cd0000        	call	_file_write
1374                     ; 351 	FW_DISPMODE(_disp_mode);
1376  0208 c60000        	ld	a,__disp_mode
1377  020b 97            	ld	xl,a
1378  020c a629          	ld	a,#41
1379  020e 95            	ld	xh,a
1380  020f cd0000        	call	_file_write
1382                     ; 357 	FW_PLC(uiInfo.plc);
1384  0212 c60065        	ld	a,_uiInfo+100
1385  0215 97            	ld	xl,a
1386  0216 a63e          	ld	a,#62
1387  0218 95            	ld	xh,a
1388  0219 cd0000        	call	_file_write
1390                     ; 358 	file_write(_B+55, 0xaa);
1392  021c ae3faa        	ldw	x,#16298
1393  021f cd0000        	call	_file_write
1395                     ; 359 	file_write(_B+56, 0xbb);
1397  0222 ae40bb        	ldw	x,#16571
1399                     ; 360 }
1402  0225 cc0000        	jp	_file_write
1405                     	switch	.data
1406  0014               __ds:
1407  0014 64            	dc.b	100
1408  0015               __dsCount:
1409  0015 00            	dc.b	0
1410  0016               __dsPrev:
1411  0016 00            	dc.b	0
1412  0017               __subRemote:
1413  0017 00            	dc.b	0
1435                     ; 369 void	clear_npos1(void)
1435                     ; 370 {
1436                     .text:	section	.text,new
1437  0000               _clear_npos1:
1441                     ; 371 	lcd_clear_npos(0, 0);
1443  0000 5f            	clrw	x
1444  0001 cd0000        	call	_lcd_clear_npos
1446                     ; 372 	lcd_clear_npos(1, 0);
1448  0004 ae0100        	ldw	x,#256
1450                     ; 373 }
1453  0007 cc0000        	jp	_lcd_clear_npos
1477                     ; 375 void	clear_npos2(void)
1477                     ; 376 {
1478                     .text:	section	.text,new
1479  0000               _clear_npos2:
1483                     ; 377 	lcd_clear_npos(2, 0);
1485  0000 ae0200        	ldw	x,#512
1486  0003 cd0000        	call	_lcd_clear_npos
1488                     ; 378 	lcd_clear_npos(3, 0);
1490  0006 ae0300        	ldw	x,#768
1492                     ; 379 }
1495  0009 cc0000        	jp	_lcd_clear_npos
1521                     ; 381 void	disp_next(void)
1521                     ; 382 {
1522                     .text:	section	.text,new
1523  0000               _disp_next:
1527                     ; 383 	lcd_clear(0);
1529  0000 4f            	clr	a
1530  0001 cd0000        	call	_lcd_clear
1532                     ; 384 	_dsCount = 1;
1534  0004 35010015      	mov	__dsCount,#1
1535                     ; 385 	_dsPrev = 0xff;
1537  0008 35ff0016      	mov	__dsPrev,#255
1538                     ; 386 }
1541  000c 81            	ret	
1544                     	switch	.data
1545  0018               ___bL:
1546  0018 60            	dc.b	96
1601                     ; 396 void	disp_status_id(uint8_t key, uint8_t next)
1601                     ; 397 {
1602                     .text:	section	.text,new
1603  0000               _disp_status_id:
1605  0000 89            	pushw	x
1606  0001 88            	push	a
1607       00000001      OFST:	set	1
1610                     ; 400 	if( _dsCount == 0 )
1612  0002 c60015        	ld	a,__dsCount
1613  0005 2625          	jrne	L142
1614                     ; 402 		disp_next();
1616  0007 cd0000        	call	_disp_next
1618                     ; 403 		lcd_disp_setup_id();
1620  000a cd0000        	call	_lcd_disp_setup_id
1622                     ; 405 		if( uiInfoSet.id < 2 ) {
1624  000d c6006f        	ld	a,_uiInfoSet+1
1625  0010 a102          	cp	a,#2
1626  0012 2404          	jruge	L562
1627                     ; 406 			uiInfoSet.id = 2;
1629  0014 3502006f      	mov	_uiInfoSet+1,#2
1630  0018               L562:
1631                     ; 409 		if (_backup_backlight == 0) {
1633  0018 c60009        	ld	a,__backup_backlight
1634  001b 2604          	jrne	L762
1635                     ; 410 			_backup_backlight = BACKLIGHT_MAX_LEVEL;
1637  001d 35600009      	mov	__backup_backlight,#96
1638  0021               L762:
1639                     ; 412 		__bL = _backlight;
1641  0021 5500000018    	mov	___bL,__backlight
1642                     ; 413 		_backlight = BACKLIGHT_MAX_LEVEL;
1644  0026 35600000      	mov	__backlight,#96
1646  002a 2044          	jra	L172
1647  002c               L142:
1648                     ; 417 EncEntry:		
1648                     ; 418 		i = uiInfoSet.id;
1650  002c c6006f        	ld	a,_uiInfoSet+1
1651  002f 6b01          	ld	(OFST+0,sp),a
1652                     ; 419 		if( uiInfo.enc != 0 )
1654  0031 c60001        	ld	a,_uiInfo
1655  0034 2724          	jreq	L372
1656                     ; 421 			if( (uiInfo.enc&0x40) == 0 )
1658  0036 a540          	bcp	a,#64
1659  0038 260d          	jrne	L572
1660                     ; 423 				if( i==1 )	i = _ID_MAX;
1662  003a 7b01          	ld	a,(OFST+0,sp)
1663  003c 4a            	dec	a
1664  003d 2604          	jrne	L772
1667  003f a606          	ld	a,#6
1669  0041 200c          	jp	LC003
1670  0043               L772:
1671                     ; 425 					i--;
1673  0043 0a01          	dec	(OFST+0,sp)
1674  0045 200e          	jra	L303
1675  0047               L572:
1676                     ; 429 				if( i==_ID_MAX )	i = 1;
1678  0047 7b01          	ld	a,(OFST+0,sp)
1679  0049 a106          	cp	a,#6
1680  004b 2606          	jrne	L503
1683  004d a601          	ld	a,#1
1684  004f               LC003:
1685  004f 6b01          	ld	(OFST+0,sp),a
1687  0051 2002          	jra	L303
1688  0053               L503:
1689                     ; 431 					i++;
1691  0053 0c01          	inc	(OFST+0,sp)
1692  0055               L303:
1693                     ; 433 			uiInfoSet.id = i;
1695  0055 7b01          	ld	a,(OFST+0,sp)
1696  0057 c7006f        	ld	_uiInfoSet+1,a
1697  005a               L372:
1698                     ; 435 		if( _dsPrev != i )
1700  005a c60016        	ld	a,__dsPrev
1701  005d 1101          	cp	a,(OFST+0,sp)
1702  005f 270f          	jreq	L172
1703                     ; 437 			_dsPrev = i;
1705  0061 7b01          	ld	a,(OFST+0,sp)
1706  0063 c70016        	ld	__dsPrev,a
1707                     ; 438 			lcd_disp_rid(i, 0, 0);
1709  0066 4b00          	push	#0
1710  0068 5f            	clrw	x
1711  0069 7b02          	ld	a,(OFST+1,sp)
1712  006b 95            	ld	xh,a
1713  006c cd0000        	call	_lcd_disp_rid
1715  006f 84            	pop	a
1716  0070               L172:
1717                     ; 441 	if( key == 0x10 )		__UP
1719  0070 7b02          	ld	a,(OFST+1,sp)
1720  0072 a110          	cp	a,#16
1721  0074 2606          	jrne	L313
1724  0076 35010001      	mov	_uiInfo,#1
1728  007a 2008          	jp	LC002
1729  007c               L313:
1730                     ; 442 	else if( key == 0x20 )	__DN
1732  007c a120          	cp	a,#32
1733  007e 2608          	jrne	L713
1736  0080 35400001      	mov	_uiInfo,#64
1739  0084               LC002:
1741  0084 0f02          	clr	(OFST+1,sp)
1744  0086 20a4          	jra	L142
1745  0088               L713:
1746                     ; 443 	else if( key == 4 )	
1748  0088 a104          	cp	a,#4
1749  008a 2623          	jrne	L513
1750                     ; 445 		uiInfoSet.mode = uiInfoSet.id == 1 ? 1 : 0;
1752  008c c6006f        	ld	a,_uiInfoSet+1
1753  008f 4a            	dec	a
1754  0090 2603          	jrne	L614
1755  0092 4c            	inc	a
1756  0093 2001          	jra	L024
1757  0095               L614:
1758  0095 4f            	clr	a
1759  0096               L024:
1760  0096 c70073        	ld	_uiInfoSet+5,a
1761                     ; 446 		STATUS_NEXT(next);
1763  0099 7b03          	ld	a,(OFST+2,sp)
1764  009b c70014        	ld	__ds,a
1767  009e 725f0015      	clr	__dsCount
1770  00a2 35ff0016      	mov	__dsPrev,#255
1771                     ; 447 		_backup_backlight = 0;
1774  00a6 725f0009      	clr	__backup_backlight
1775                     ; 449 		_backlight = __bL;
1777  00aa 5500180000    	mov	__backlight,___bL
1778  00af               L513:
1779                     ; 452 }
1782  00af 5b03          	addw	sp,#3
1783  00b1 81            	ret	
1838                     ; 454 void	disp_status_valveCount(uint8_t key, uint8_t next)
1838                     ; 455 {
1839                     .text:	section	.text,new
1840  0000               _disp_status_valveCount:
1842  0000 89            	pushw	x
1843  0001 88            	push	a
1844       00000001      OFST:	set	1
1847                     ; 458 	if( _dsCount == 0 )
1849  0002 c60015        	ld	a,__dsCount
1850  0005 2608          	jrne	L523
1851                     ; 460 		disp_next();
1853  0007 cd0000        	call	_disp_next
1855                     ; 461 		lcd_disp_setup_valve();
1857  000a cd0000        	call	_lcd_disp_setup_valve
1860  000d 206a          	jra	L153
1861  000f               L523:
1862                     ; 465 EncEntry:		
1862                     ; 466 		i = uiInfoSet.controlMode==0 ? uiInfoSet.valve : uiInfoSet.valve_sub;
1864  000f c60074        	ld	a,_uiInfoSet+6
1865  0012 2605          	jrne	L034
1866  0014 c60075        	ld	a,_uiInfoSet+7
1867  0017 2003          	jra	L234
1868  0019               L034:
1869  0019 c60076        	ld	a,_uiInfoSet+8
1870  001c               L234:
1871  001c 6b01          	ld	(OFST+0,sp),a
1872                     ; 467 		if( uiInfo.enc != 0 )
1874  001e c60001        	ld	a,_uiInfo
1875  0021 2731          	jreq	L353
1876                     ; 470 			if( (uiInfo.enc & 0x40) != 0 )
1878  0023 a540          	bcp	a,#64
1879  0025 270e          	jreq	L553
1880                     ; 472 				if( i<=1 )	i = 8;
1882  0027 7b01          	ld	a,(OFST+0,sp)
1883  0029 a102          	cp	a,#2
1884  002b 2404          	jruge	L753
1887  002d a608          	ld	a,#8
1889  002f 200c          	jp	LC005
1890  0031               L753:
1891                     ; 474 					i -= 1;
1893  0031 0a01          	dec	(OFST+0,sp)
1894  0033 200e          	jra	L363
1895  0035               L553:
1896                     ; 478 				if( i>=8 )	i = 1;
1898  0035 7b01          	ld	a,(OFST+0,sp)
1899  0037 a108          	cp	a,#8
1900  0039 2506          	jrult	L563
1903  003b a601          	ld	a,#1
1904  003d               LC005:
1905  003d 6b01          	ld	(OFST+0,sp),a
1907  003f 2002          	jra	L363
1908  0041               L563:
1909                     ; 480 					i += 1;
1911  0041 0c01          	inc	(OFST+0,sp)
1912  0043               L363:
1913                     ; 482 			if( uiInfoSet.controlMode==0 )
1915  0043 c60074        	ld	a,_uiInfoSet+6
1916  0046 2607          	jrne	L173
1917                     ; 483 				uiInfoSet.valve = i;
1919  0048 7b01          	ld	a,(OFST+0,sp)
1920  004a c70075        	ld	_uiInfoSet+7,a
1922  004d 2005          	jra	L353
1923  004f               L173:
1924                     ; 485 				uiInfoSet.valve_sub = i;
1926  004f 7b01          	ld	a,(OFST+0,sp)
1927  0051 c70076        	ld	_uiInfoSet+8,a
1928  0054               L353:
1929                     ; 487 		if( _dsPrev != i )
1931  0054 c60016        	ld	a,__dsPrev
1932  0057 1101          	cp	a,(OFST+0,sp)
1933  0059 271e          	jreq	L153
1934                     ; 489 			_dsPrev = i;
1936  005b 7b01          	ld	a,(OFST+0,sp)
1937  005d c70016        	ld	__dsPrev,a
1938                     ; 490 			UI_DISP_2Digit(i);
1940  0060 5f            	clrw	x
1941  0061 97            	ld	xl,a
1942  0062 a60a          	ld	a,#10
1943  0064 62            	div	x,a
1944  0065 a602          	ld	a,#2
1945  0067 95            	ld	xh,a
1946  0068 cd0000        	call	_lcd_disp_n
1950  006b 7b01          	ld	a,(OFST+0,sp)
1951  006d 5f            	clrw	x
1952  006e 97            	ld	xl,a
1953  006f a60a          	ld	a,#10
1954  0071 62            	div	x,a
1955  0072 97            	ld	xl,a
1956  0073 a603          	ld	a,#3
1957  0075 95            	ld	xh,a
1958  0076 cd0000        	call	_lcd_disp_n
1961  0079               L153:
1962                     ; 493 	if( key == 0x10 )		__UP
1964  0079 7b02          	ld	a,(OFST+1,sp)
1965  007b a110          	cp	a,#16
1966  007d 2606          	jrne	L773
1969  007f 35010001      	mov	_uiInfo,#1
1973  0083 2008          	jp	LC004
1974  0085               L773:
1975                     ; 494 	else if( key == 0x20 )	__DN
1977  0085 a120          	cp	a,#32
1978  0087 2609          	jrne	L304
1981  0089 35400001      	mov	_uiInfo,#64
1984  008d               LC004:
1986  008d 0f02          	clr	(OFST+1,sp)
1989  008f cc000f        	jra	L523
1990  0092               L304:
1991                     ; 495 	else if( key == 4 )	
1993  0092 a104          	cp	a,#4
1994  0094 261e          	jrne	L104
1995                     ; 498 		if( uiInfoSet.controlMode==0 )
1997  0096 c60074        	ld	a,_uiInfoSet+6
1998  0099 2607          	jrne	L114
1999                     ; 499 			uiInfoSet.cnt = uiInfoSet.valve;
2001  009b 5500750070    	mov	_uiInfoSet+2,_uiInfoSet+7
2003  00a0 2005          	jra	L314
2004  00a2               L114:
2005                     ; 501 			uiInfoSet.cnt_sub = uiInfoSet.valve_sub;
2007  00a2 5500760071    	mov	_uiInfoSet+3,_uiInfoSet+8
2008  00a7               L314:
2009                     ; 502 		STATUS_NEXT(next);	
2011  00a7 7b03          	ld	a,(OFST+2,sp)
2012  00a9 c70014        	ld	__ds,a
2015  00ac 725f0015      	clr	__dsCount
2018  00b0 35ff0016      	mov	__dsPrev,#255
2020  00b4               L104:
2021                     ; 505 }
2024  00b4 5b03          	addw	sp,#3
2025  00b6 81            	ret	
2090                     ; 507 void	disp_status_toffset(uint8_t key, uint8_t next)
2090                     ; 508 {
2091                     .text:	section	.text,new
2092  0000               _disp_status_toffset:
2094  0000 89            	pushw	x
2095  0001 88            	push	a
2096       00000001      OFST:	set	1
2099                     ; 511 	if( _dsCount == 0 )
2101  0002 c60015        	ld	a,__dsCount
2102  0005 2620          	jrne	L514
2103                     ; 513 		disp_next();
2105  0007 cd0000        	call	_disp_next
2107                     ; 514 		LCD_BIT_SET(bT4);
2109  000a c6000f        	ld	a,_iLF_DEF+15
2110  000d 5f            	clrw	x
2111  000e 97            	ld	xl,a
2112  000f d6540c        	ld	a,(21516,x)
2113  0012 ca000f        	or	a,_bLF_DEF+15
2114  0015 d7540c        	ld	(21516,x),a
2115                     ; 516 		if( uiInfoSet.tOffset == 0 )
2117  0018 c60079        	ld	a,_uiInfoSet+11
2118  001b 2703cc00b1    	jrne	L544
2119                     ; 517 			uiInfoSet.tOffset = 100;
2121  0020 35640079      	mov	_uiInfoSet+11,#100
2122  0024 cc00b1        	jra	L544
2123  0027               L514:
2124                     ; 521 EncEntry:		
2124                     ; 522 		i = uiInfoSet.tOffset;
2126  0027 c60079        	ld	a,_uiInfoSet+11
2127  002a 6b01          	ld	(OFST+0,sp),a
2128                     ; 523 		if( uiInfo.enc != 0 )
2130  002c c60001        	ld	a,_uiInfo
2131  002f 2747          	jreq	L744
2132                     ; 525 			if( (uiInfo.enc & 0x40) == 0 )
2134  0031 a540          	bcp	a,#64
2135  0033 261c          	jrne	L154
2136                     ; 527 				if( i > 100 )			i -= 2;
2138  0035 7b01          	ld	a,(OFST+0,sp)
2139  0037 a165          	cp	a,#101
2142  0039 2434          	jruge	L574
2143                     ; 528 				else if( i == 100 )		i = 2;
2145  003b a164          	cp	a,#100
2146  003d 2604          	jrne	L754
2149  003f a602          	ld	a,#2
2151  0041 2020          	jp	LC008
2152  0043               L754:
2153                     ; 531 					i += 2;
2155  0043 0c01          	inc	(OFST+0,sp)
2156  0045 0c01          	inc	(OFST+0,sp)
2157                     ; 532 					if( i >= 18 )		i = 18;
2159  0047 7b01          	ld	a,(OFST+0,sp)
2160  0049 a112          	cp	a,#18
2161  004b 2528          	jrult	L564
2164  004d a612          	ld	a,#18
2165  004f 2012          	jp	LC008
2166  0051               L154:
2167                     ; 537 				if( i >= 100 )
2169  0051 7b01          	ld	a,(OFST+0,sp)
2170  0053 a164          	cp	a,#100
2171  0055 2510          	jrult	L764
2172                     ; 539 					i += 2;
2174  0057 0c01          	inc	(OFST+0,sp)
2175  0059 0c01          	inc	(OFST+0,sp)
2176                     ; 540 					if( i >= 118 )		i = 118;
2178  005b 7b01          	ld	a,(OFST+0,sp)
2179  005d a176          	cp	a,#118
2180  005f 2514          	jrult	L564
2183  0061 a676          	ld	a,#118
2184  0063               LC008:
2185  0063 6b01          	ld	(OFST+0,sp),a
2186  0065 200e          	jra	L564
2187  0067               L764:
2188                     ; 544 					if( i == 2 )		i = 100;
2190  0067 a102          	cp	a,#2
2191  0069 2604          	jrne	L574
2194  006b a664          	ld	a,#100
2196  006d 20f4          	jp	LC008
2197  006f               L574:
2198                     ; 546 						i -= 2;
2201  006f 0a01          	dec	(OFST+0,sp)
2202  0071 0a01          	dec	(OFST+0,sp)
2203  0073 7b01          	ld	a,(OFST+0,sp)
2204  0075               L564:
2205                     ; 549 			uiInfoSet.tOffset = i;
2207  0075 c70079        	ld	_uiInfoSet+11,a
2208  0078               L744:
2209                     ; 551 		if( _dsPrev != i )
2211  0078 c60016        	ld	a,__dsPrev
2212  007b 1101          	cp	a,(OFST+0,sp)
2213  007d 2732          	jreq	L544
2214                     ; 553 			_dsPrev = i;
2216  007f 7b01          	ld	a,(OFST+0,sp)
2217  0081 c70016        	ld	__dsPrev,a
2218                     ; 554 			clear_npos2();
2220  0084 cd0000        	call	_clear_npos2
2222                     ; 555 			if( i < 100 && i != 0 )
2224  0087 7b01          	ld	a,(OFST+0,sp)
2225  0089 a164          	cp	a,#100
2226  008b 2414          	jruge	L305
2228  008d 0d01          	tnz	(OFST+0,sp)
2229  008f 2710          	jreq	L305
2230                     ; 557 				LCD_BIT_SET(b4G);
2232  0091 c60037        	ld	a,_iLF_DEF+55
2233  0094 5f            	clrw	x
2234  0095 97            	ld	xl,a
2235  0096 d6540c        	ld	a,(21516,x)
2236  0099 ca0037        	or	a,_bLF_DEF+55
2237  009c d7540c        	ld	(21516,x),a
2238  009f 7b01          	ld	a,(OFST+0,sp)
2239  00a1               L305:
2240                     ; 559 			j = i%100;
2242  00a1 5f            	clrw	x
2243  00a2 97            	ld	xl,a
2244  00a3 a664          	ld	a,#100
2245  00a5 62            	div	x,a
2246  00a6 6b01          	ld	(OFST+0,sp),a
2247                     ; 560 			lcd_disp_n(3, j/2);
2249  00a8 5f            	clrw	x
2250  00a9 97            	ld	xl,a
2251  00aa 57            	sraw	x
2252  00ab a603          	ld	a,#3
2253  00ad 95            	ld	xh,a
2254  00ae cd0000        	call	_lcd_disp_n
2256  00b1               L544:
2257                     ; 563 	if( key == 0x10 )		__DN
2259  00b1 7b02          	ld	a,(OFST+1,sp)
2260  00b3 a110          	cp	a,#16
2261  00b5 2606          	jrne	L505
2264  00b7 35400001      	mov	_uiInfo,#64
2268  00bb 2008          	jp	LC006
2269  00bd               L505:
2270                     ; 564 	else if( key == 0x20 )	__UP
2272  00bd a120          	cp	a,#32
2273  00bf 2609          	jrne	L115
2276  00c1 35010001      	mov	_uiInfo,#1
2279  00c5               LC006:
2281  00c5 0f02          	clr	(OFST+1,sp)
2284  00c7 cc0027        	jra	L514
2285  00ca               L115:
2286                     ; 565 	else if( key == 4 )	
2288  00ca a104          	cp	a,#4
2289  00cc 261a          	jrne	L705
2290                     ; 572 		uiInfo.tOffset = uiInfoSet.tOffset;
2292  00ce c60079        	ld	a,_uiInfoSet+11
2293  00d1 c70012        	ld	_uiInfo+17,a
2294                     ; 573 		FW_TOFFSET(uiInfo.tOffset);
2296  00d4 97            	ld	xl,a
2297  00d5 a614          	ld	a,#20
2298  00d7 95            	ld	xh,a
2299  00d8 cd0000        	call	_file_write
2301                     ; 574 		STATUS_NEXT(next);	
2303  00db 7b03          	ld	a,(OFST+2,sp)
2304  00dd c70014        	ld	__ds,a
2307  00e0 725f0015      	clr	__dsCount
2310  00e4 35ff0016      	mov	__dsPrev,#255
2312  00e8               L705:
2313                     ; 577 }
2316  00e8 5b03          	addw	sp,#3
2317  00ea 81            	ret	
2350                     ; 579 uint8_t	_backlight_get_index(uint8_t i)
2350                     ; 580 {
2351                     .text:	section	.text,new
2352  0000               __backlight_get_index:
2354  0000 88            	push	a
2355       00000000      OFST:	set	0
2358                     ; 583 	if( i==BL_1 )	return 1;
2360  0001 a103          	cp	a,#3
2361  0003 2605          	jrne	L335
2364  0005 a601          	ld	a,#1
2367  0007 5b01          	addw	sp,#1
2368  0009 81            	ret	
2369  000a               L335:
2370                     ; 584 	if( i==BL_2 )	return 2;
2372  000a 7b01          	ld	a,(OFST+1,sp)
2373  000c a107          	cp	a,#7
2374  000e 2605          	jrne	L535
2377  0010 a602          	ld	a,#2
2380  0012 5b01          	addw	sp,#1
2381  0014 81            	ret	
2382  0015               L535:
2383                     ; 585 	if( i==BL_3 )	return 3;
2385  0015 a10b          	cp	a,#11
2386  0017 2605          	jrne	L735
2389  0019 a603          	ld	a,#3
2392  001b 5b01          	addw	sp,#1
2393  001d 81            	ret	
2394  001e               L735:
2395                     ; 586 	if( i==BL_4 )	return 4;
2397  001e a10f          	cp	a,#15
2398  0020 2605          	jrne	L145
2401  0022 a604          	ld	a,#4
2404  0024 5b01          	addw	sp,#1
2405  0026 81            	ret	
2406  0027               L145:
2407                     ; 587 	return 5;
2409  0027 a605          	ld	a,#5
2412  0029 5b01          	addw	sp,#1
2413  002b 81            	ret	
2446                     ; 605 uint8_t	_backlight_get_code(uint8_t i)
2446                     ; 606 {
2447                     .text:	section	.text,new
2448  0000               __backlight_get_code:
2450  0000 88            	push	a
2451       00000000      OFST:	set	0
2454                     ; 608 	if( i==1 )	return BL_1;
2456  0001 4a            	dec	a
2457  0002 2605          	jrne	L755
2460  0004 a603          	ld	a,#3
2463  0006 5b01          	addw	sp,#1
2464  0008 81            	ret	
2465  0009               L755:
2466                     ; 609 	if( i==2 )	return BL_2;
2468  0009 7b01          	ld	a,(OFST+1,sp)
2469  000b a102          	cp	a,#2
2470  000d 2605          	jrne	L165
2473  000f a607          	ld	a,#7
2476  0011 5b01          	addw	sp,#1
2477  0013 81            	ret	
2478  0014               L165:
2479                     ; 610 	if( i==3 )	return BL_3;
2481  0014 a103          	cp	a,#3
2482  0016 2605          	jrne	L365
2485  0018 a60b          	ld	a,#11
2488  001a 5b01          	addw	sp,#1
2489  001c 81            	ret	
2490  001d               L365:
2491                     ; 611 	if( i==4 )	return BL_4;
2493  001d a104          	cp	a,#4
2494  001f 2605          	jrne	L565
2497  0021 a60f          	ld	a,#15
2500  0023 5b01          	addw	sp,#1
2501  0025 81            	ret	
2502  0026               L565:
2503                     ; 612 	return BL_5;
2505  0026 a616          	ld	a,#22
2508  0028 5b01          	addw	sp,#1
2509  002a 81            	ret	
2568                     ; 629 void disp_status_backlight2(uint8_t key, uint8_t next) 
2568                     ; 630 {
2569                     .text:	section	.text,new
2570  0000               _disp_status_backlight2:
2572  0000 89            	pushw	x
2573       00000001      OFST:	set	1
2576                     ; 634 	_backup_backlight2 = 0;
2578  0001 725f000a      	clr	__backup_backlight2
2579  0005 88            	push	a
2580                     ; 636 	if( _dsCount == 0 )
2582  0006 c60015        	ld	a,__dsCount
2583  0009 2611          	jrne	L765
2584                     ; 638 		lcd_clear(0);
2586  000b cd0000        	call	_lcd_clear
2588                     ; 639 		lcd_disp_backlight();
2590  000e cd0000        	call	_lcd_disp_backlight
2592                     ; 640 		_dsCount = 1;
2594  0011 35010015      	mov	__dsCount,#1
2595                     ; 641 		uiInfo._t = _backlight;
2597  0015 5500000060    	mov	_uiInfo+95,__backlight
2599  001a 205c          	jra	L316
2600  001c               L765:
2601                     ; 645 EncEntry:
2601                     ; 646 		i = _backlight;
2603  001c c60000        	ld	a,__backlight
2604  001f 6b01          	ld	(OFST+0,sp),a
2605                     ; 647 		i = _backlight_get_index(i);
2607  0021 cd0000        	call	__backlight_get_index
2609  0024 6b01          	ld	(OFST+0,sp),a
2610                     ; 649 		if( uiInfo.enc != 0 )
2612  0026 c60001        	ld	a,_uiInfo
2613  0029 2728          	jreq	L516
2614                     ; 653 			ENC_MOVE_0(1, 5, 1);
2616  002b a540          	bcp	a,#64
2617  002d 260e          	jrne	L716
2620  002f 7b01          	ld	a,(OFST+0,sp)
2621  0031 a102          	cp	a,#2
2622  0033 2404          	jruge	L126
2625  0035 a605          	ld	a,#5
2627  0037 200c          	jp	LC010
2628  0039               L126:
2631  0039 0a01          	dec	(OFST+0,sp)
2632  003b 200e          	jra	L526
2633  003d               L716:
2636  003d 7b01          	ld	a,(OFST+0,sp)
2637  003f a105          	cp	a,#5
2638  0041 2506          	jrult	L726
2641  0043 a601          	ld	a,#1
2642  0045               LC010:
2643  0045 6b01          	ld	(OFST+0,sp),a
2645  0047 2002          	jra	L526
2646  0049               L726:
2649  0049 0c01          	inc	(OFST+0,sp)
2650  004b               L526:
2651                     ; 654 			_backlight = _backlight_get_code(i);
2654  004b 7b01          	ld	a,(OFST+0,sp)
2655  004d cd0000        	call	__backlight_get_code
2657  0050 c70000        	ld	__backlight,a
2658  0053               L516:
2659                     ; 657 		if( _dsPrev != i )
2661  0053 c60016        	ld	a,__dsPrev
2662  0056 1101          	cp	a,(OFST+0,sp)
2663  0058 271e          	jreq	L316
2664                     ; 659 			_dsPrev = i;
2666  005a 7b01          	ld	a,(OFST+0,sp)
2667  005c c70016        	ld	__dsPrev,a
2668                     ; 661 			UI_DISP_2Digit(i);
2670  005f 5f            	clrw	x
2671  0060 97            	ld	xl,a
2672  0061 a60a          	ld	a,#10
2673  0063 62            	div	x,a
2674  0064 a602          	ld	a,#2
2675  0066 95            	ld	xh,a
2676  0067 cd0000        	call	_lcd_disp_n
2680  006a 7b01          	ld	a,(OFST+0,sp)
2681  006c 5f            	clrw	x
2682  006d 97            	ld	xl,a
2683  006e a60a          	ld	a,#10
2684  0070 62            	div	x,a
2685  0071 97            	ld	xl,a
2686  0072 a603          	ld	a,#3
2687  0074 95            	ld	xh,a
2688  0075 cd0000        	call	_lcd_disp_n
2691  0078               L316:
2692                     ; 665 	if( key == 0x10 )		__DN
2694  0078 7b02          	ld	a,(OFST+1,sp)
2695  007a a110          	cp	a,#16
2696  007c 2606          	jrne	L536
2699  007e 35400001      	mov	_uiInfo,#64
2703  0082 2008          	jp	LC009
2704  0084               L536:
2705                     ; 666 	else if( key == 0x20 )	__UP
2707  0084 a120          	cp	a,#32
2708  0086 2608          	jrne	L146
2711  0088 35010001      	mov	_uiInfo,#1
2714  008c               LC009:
2716  008c 0f02          	clr	(OFST+1,sp)
2719  008e 208c          	jra	L765
2720  0090               L146:
2721                     ; 667 	else if( key == 4 )	
2723  0090 a104          	cp	a,#4
2724  0092 2617          	jrne	L736
2725                     ; 672 		FW_BACKLIGHT(_backlight);
2727  0094 c60000        	ld	a,__backlight
2728  0097 97            	ld	xl,a
2729  0098 a62a          	ld	a,#42
2730  009a 95            	ld	xh,a
2731  009b cd0000        	call	_file_write
2733                     ; 673 		STATUS_NEXT(next);	
2735  009e 7b03          	ld	a,(OFST+2,sp)
2736  00a0 c70014        	ld	__ds,a
2739  00a3 725f0015      	clr	__dsCount
2742  00a7 35ff0016      	mov	__dsPrev,#255
2744  00ab               L736:
2745                     ; 675 }
2748  00ab 5b03          	addw	sp,#3
2749  00ad 81            	ret	
2805                     ; 677 void	disp_status_run_op(uint8_t key, uint8_t next)
2805                     ; 678 {
2806                     .text:	section	.text,new
2807  0000               _disp_status_run_op:
2809  0000 89            	pushw	x
2810  0001 88            	push	a
2811       00000001      OFST:	set	1
2814                     ; 681 	if( uiInfoSet.controlMode==1 )
2816  0002 c60074        	ld	a,_uiInfoSet+6
2817  0005 4a            	dec	a
2818  0006 2603          	jrne	L176
2819                     ; 683 		STATUS_NEXT(next);	
2821  0008 9f            	ld	a,xl
2824                     ; 684 		return;
2827  0009 2060          	jp	LC012
2828  000b               L176:
2829                     ; 686 	if( _dsCount == 0 )
2831  000b c60015        	ld	a,__dsCount
2832  000e 2608          	jrne	L746
2833                     ; 688 		disp_next();
2835  0010 cd0000        	call	_disp_next
2837                     ; 689 		lcd_disp_setup_cntl_op();
2839  0013 cd0000        	call	_lcd_disp_setup_cntl_op
2842  0016 2035          	jra	L576
2843  0018               L746:
2844                     ; 693 EncEntry:		
2844                     ; 694 		i = uiInfoSet.opMode;
2846  0018 c60072        	ld	a,_uiInfoSet+4
2847  001b 6b01          	ld	(OFST+0,sp),a
2848                     ; 695 		if( uiInfo.enc != 0 )
2850  001d c60001        	ld	a,_uiInfo
2851  0020 270d          	jreq	L776
2852                     ; 697 			i = i==0 ? 1 : 0;
2854  0022 7b01          	ld	a,(OFST+0,sp)
2855  0024 2603          	jrne	L405
2856  0026 4c            	inc	a
2857  0027 2001          	jra	L605
2858  0029               L405:
2859  0029 4f            	clr	a
2860  002a               L605:
2861  002a 6b01          	ld	(OFST+0,sp),a
2862                     ; 698 			uiInfoSet.opMode = i;
2864  002c c70072        	ld	_uiInfoSet+4,a
2865  002f               L776:
2866                     ; 700 		if( _dsPrev != i )
2868  002f c60016        	ld	a,__dsPrev
2869  0032 1101          	cp	a,(OFST+0,sp)
2870  0034 2717          	jreq	L576
2871                     ; 702 			_dsPrev = i;
2873  0036 7b01          	ld	a,(OFST+0,sp)
2874  0038 c70016        	ld	__dsPrev,a
2875                     ; 703 			clear_npos2();
2877  003b cd0000        	call	_clear_npos2
2879                     ; 704 			if( i==0 )		lcd_disp_setup_cntl_on();
2881  003e 7b01          	ld	a,(OFST+0,sp)
2882  0040 2605          	jrne	L307
2885  0042 cd0000        	call	_lcd_disp_setup_cntl_on
2888  0045 2006          	jra	L576
2889  0047               L307:
2890                     ; 705 			else if( i==1 )	lcd_disp_setup_cntl_po();
2892  0047 4a            	dec	a
2893  0048 2603          	jrne	L576
2896  004a cd0000        	call	_lcd_disp_setup_cntl_po
2898  004d               L576:
2899                     ; 708 	if( key == 0x10 )		__DN
2901  004d 7b02          	ld	a,(OFST+1,sp)
2902  004f a110          	cp	a,#16
2903  0051 2606          	jrne	L117
2906  0053 35400001      	mov	_uiInfo,#64
2910  0057 2008          	jp	LC011
2911  0059               L117:
2912                     ; 709 	else if( key == 0x20 )	__UP
2914  0059 a120          	cp	a,#32
2915  005b 2608          	jrne	L517
2918  005d 35010001      	mov	_uiInfo,#1
2921  0061               LC011:
2923  0061 0f02          	clr	(OFST+1,sp)
2926  0063 20b3          	jra	L746
2927  0065               L517:
2928                     ; 710 	else if( key == 4 )		
2930  0065 a104          	cp	a,#4
2931  0067 260d          	jrne	L317
2932                     ; 712 		STATUS_NEXT(next);	
2934  0069 7b03          	ld	a,(OFST+2,sp)
2939  006b               LC012:
2940  006b c70014        	ld	__ds,a
2942  006e 725f0015      	clr	__dsCount
2944  0072 35ff0016      	mov	__dsPrev,#255
2946  0076               L317:
2947                     ; 715 }
2950  0076 5b03          	addw	sp,#3
2951  0078 81            	ret	
3008                     ; 717 void	disp_status_cntl_op(uint8_t key, uint8_t next)
3008                     ; 718 {
3009                     .text:	section	.text,new
3010  0000               _disp_status_cntl_op:
3012  0000 89            	pushw	x
3013  0001 88            	push	a
3014       00000001      OFST:	set	1
3017                     ; 721 	if( uiInfoSet.controlMode==1 )
3019  0002 c60074        	ld	a,_uiInfoSet+6
3020  0005 4a            	dec	a
3021  0006 2603          	jrne	L547
3022                     ; 723 		STATUS_NEXT(next);	
3024  0008 9f            	ld	a,xl
3027                     ; 724 		return;
3030  0009 205d          	jp	LC014
3031  000b               L547:
3032                     ; 726 	if( _dsCount == 0 )
3034  000b c60015        	ld	a,__dsCount
3035  000e 2608          	jrne	L327
3036                     ; 728 		disp_next();
3038  0010 cd0000        	call	_disp_next
3040                     ; 729 		lcd_disp_setup_mode();
3042  0013 cd0000        	call	_lcd_disp_setup_mode
3045  0016 2032          	jra	L157
3046  0018               L327:
3047                     ; 733 EncEntry:		
3047                     ; 734 		i = uiInfoSet.cntlMode;
3049  0018 c6006e        	ld	a,_uiInfoSet
3050  001b 6b01          	ld	(OFST+0,sp),a
3051                     ; 735 		if( uiInfo.enc != 0 )
3053  001d c60001        	ld	a,_uiInfo
3054  0020 270d          	jreq	L357
3055                     ; 737 			i = i==0 ? 1 : 0;
3057  0022 7b01          	ld	a,(OFST+0,sp)
3058  0024 2603          	jrne	L625
3059  0026 4c            	inc	a
3060  0027 2001          	jra	L035
3061  0029               L625:
3062  0029 4f            	clr	a
3063  002a               L035:
3064  002a 6b01          	ld	(OFST+0,sp),a
3065                     ; 738 			uiInfoSet.cntlMode = i;
3067  002c c7006e        	ld	_uiInfoSet,a
3068  002f               L357:
3069                     ; 740 		if( _dsPrev != i )
3071  002f c60016        	ld	a,__dsPrev
3072  0032 1101          	cp	a,(OFST+0,sp)
3073  0034 2714          	jreq	L157
3074                     ; 742 			_dsPrev = i;
3076  0036 7b01          	ld	a,(OFST+0,sp)
3077  0038 c70016        	ld	__dsPrev,a
3078                     ; 743 			clear_npos2();
3080  003b cd0000        	call	_clear_npos2
3082                     ; 744 			if( i == 0 )	lcd_disp_setup_mode_local();
3084  003e 7b01          	ld	a,(OFST+0,sp)
3085  0040 2605          	jrne	L757
3088  0042 cd0000        	call	_lcd_disp_setup_mode_local
3091  0045 2003          	jra	L157
3092  0047               L757:
3093                     ; 745 			else			lcd_disp_setup_mode_each();
3095  0047 cd0000        	call	_lcd_disp_setup_mode_each
3097  004a               L157:
3098                     ; 748 	if( key == 0x10 )		__DN
3100  004a 7b02          	ld	a,(OFST+1,sp)
3101  004c a110          	cp	a,#16
3102  004e 2606          	jrne	L367
3105  0050 35400001      	mov	_uiInfo,#64
3109  0054 2008          	jp	LC013
3110  0056               L367:
3111                     ; 749 	else if( key == 0x20 )	__UP
3113  0056 a120          	cp	a,#32
3114  0058 2608          	jrne	L767
3117  005a 35010001      	mov	_uiInfo,#1
3120  005e               LC013:
3122  005e 0f02          	clr	(OFST+1,sp)
3125  0060 20b6          	jra	L327
3126  0062               L767:
3127                     ; 750 	else if( key == 4 )		
3129  0062 a104          	cp	a,#4
3130  0064 260d          	jrne	L567
3131                     ; 752 		STATUS_NEXT(next);	
3133  0066 7b03          	ld	a,(OFST+2,sp)
3138  0068               LC014:
3139  0068 c70014        	ld	__ds,a
3141  006b 725f0015      	clr	__dsCount
3143  006f 35ff0016      	mov	__dsPrev,#255
3145  0073               L567:
3146                     ; 755 }
3149  0073 5b03          	addw	sp,#3
3150  0075 81            	ret	
3205                     ; 757 void	disp_status_houseCapa(uint8_t key, uint8_t next)
3205                     ; 758 {
3206                     .text:	section	.text,new
3207  0000               _disp_status_houseCapa:
3209  0000 89            	pushw	x
3210  0001 88            	push	a
3211       00000001      OFST:	set	1
3214                     ; 761 	if(uiInfoSet.cntlMode != 0 )	
3216  0002 c6006e        	ld	a,_uiInfoSet
3217  0005 2704          	jreq	L7101
3218                     ; 764 		STATUS_NEXT(next);
3220  0007 9f            	ld	a,xl
3223                     ; 765 		return;
3226  0008 cc009b        	jp	LC016
3227  000b               L7101:
3228                     ; 768 	if( _dsCount == 0 )
3230  000b c60015        	ld	a,__dsCount
3231  000e 2608          	jrne	L577
3232                     ; 770 		disp_next();
3234  0010 cd0000        	call	_disp_next
3236                     ; 771 		lcd_disp_setup_len();
3238  0013 cd0000        	call	_lcd_disp_setup_len
3241  0016 2065          	jra	L3201
3242  0018               L577:
3243                     ; 775 EncEntry:		
3243                     ; 776 		i = uiInfoSet.houseCapa;
3245  0018 c60078        	ld	a,_uiInfoSet+10
3246  001b 6b01          	ld	(OFST+0,sp),a
3247                     ; 777 		if( uiInfo.enc != 0 )
3249  001d c60001        	ld	a,_uiInfo
3250  0020 271f          	jreq	L5201
3251                     ; 779 			if( (uiInfo.enc & 0x40) == 0 )	i--;
3253  0022 a540          	bcp	a,#64
3254  0024 2604          	jrne	L7201
3257  0026 0a01          	dec	(OFST+0,sp)
3259  0028 2002          	jra	L1301
3260  002a               L7201:
3261                     ; 781 				i++;
3263  002a 0c01          	inc	(OFST+0,sp)
3264  002c               L1301:
3265                     ; 782 			if( i < 70 )	i = 200;
3267  002c 7b01          	ld	a,(OFST+0,sp)
3268  002e a146          	cp	a,#70
3269  0030 2404          	jruge	L3301
3272  0032 a6c8          	ld	a,#200
3273  0034 6b01          	ld	(OFST+0,sp),a
3274  0036               L3301:
3275                     ; 783 			if( i > 200 )	i = 70;
3277  0036 a1c9          	cp	a,#201
3278  0038 2504          	jrult	L5301
3281  003a a646          	ld	a,#70
3282  003c 6b01          	ld	(OFST+0,sp),a
3283  003e               L5301:
3284                     ; 784 			uiInfoSet.houseCapa = i;
3286  003e c70078        	ld	_uiInfoSet+10,a
3287  0041               L5201:
3288                     ; 786 		if( _dsPrev != i )
3290  0041 c60016        	ld	a,__dsPrev
3291  0044 1101          	cp	a,(OFST+0,sp)
3292  0046 2735          	jreq	L3201
3293                     ; 788 			_dsPrev = i;
3295  0048 7b01          	ld	a,(OFST+0,sp)
3296  004a c70016        	ld	__dsPrev,a
3297                     ; 789 			UI_DISP_3Digit(i);
3299  004d 5f            	clrw	x
3300  004e 97            	ld	xl,a
3301  004f a664          	ld	a,#100
3302  0051 62            	div	x,a
3303  0052 a601          	ld	a,#1
3304  0054 95            	ld	xh,a
3305  0055 cd0000        	call	_lcd_disp_n
3309  0058 7b01          	ld	a,(OFST+0,sp)
3310  005a 5f            	clrw	x
3311  005b 97            	ld	xl,a
3312  005c a664          	ld	a,#100
3313  005e 62            	div	x,a
3314  005f 5f            	clrw	x
3315  0060 97            	ld	xl,a
3316  0061 01            	rrwa	x,a
3317  0062 6b01          	ld	(OFST+0,sp),a
3320  0064 5f            	clrw	x
3321  0065 97            	ld	xl,a
3322  0066 a60a          	ld	a,#10
3323  0068 62            	div	x,a
3324  0069 a602          	ld	a,#2
3325  006b 95            	ld	xh,a
3326  006c cd0000        	call	_lcd_disp_n
3330  006f 7b01          	ld	a,(OFST+0,sp)
3331  0071 5f            	clrw	x
3332  0072 97            	ld	xl,a
3333  0073 a60a          	ld	a,#10
3334  0075 62            	div	x,a
3335  0076 97            	ld	xl,a
3336  0077 a603          	ld	a,#3
3337  0079 95            	ld	xh,a
3338  007a cd0000        	call	_lcd_disp_n
3341  007d               L3201:
3342                     ; 792 	if( key == 0x10 )		__DN
3344  007d 7b02          	ld	a,(OFST+1,sp)
3345  007f a110          	cp	a,#16
3346  0081 2606          	jrne	L1401
3349  0083 35400001      	mov	_uiInfo,#64
3353  0087 2008          	jp	LC015
3354  0089               L1401:
3355                     ; 793 	else if( key == 0x20 )	__UP
3357  0089 a120          	cp	a,#32
3358  008b 2608          	jrne	L5401
3361  008d 35010001      	mov	_uiInfo,#1
3364  0091               LC015:
3366  0091 0f02          	clr	(OFST+1,sp)
3369  0093 2083          	jra	L577
3370  0095               L5401:
3371                     ; 794 	else if( key == 4 )		
3373  0095 a104          	cp	a,#4
3374  0097 260d          	jrne	L3401
3375                     ; 796 		STATUS_NEXT(next);	
3377  0099 7b03          	ld	a,(OFST+2,sp)
3382  009b               LC016:
3383  009b c70014        	ld	__ds,a
3385  009e 725f0015      	clr	__dsCount
3387  00a2 35ff0016      	mov	__dsPrev,#255
3389  00a6               L3401:
3390                     ; 799 }
3393  00a6 5b03          	addw	sp,#3
3394  00a8 81            	ret	
3427                     ; 801 void	disp_status_po_type(uint8_t key, uint8_t next)
3427                     ; 802 {
3428                     .text:	section	.text,new
3429  0000               _disp_status_po_type:
3433                     ; 849 }
3436  0000 81            	ret	
3439                     	switch	.const
3440  0012               ___lpm:
3441  0012 00            	dc.b	0
3442  0013 08            	dc.b	8
3443  0014 0a            	dc.b	10
3444  0015 0f            	dc.b	15
3445  0016 14            	dc.b	20
3446  0017 19            	dc.b	25
3447  0018 1e            	dc.b	30
3448  0019 63            	dc.b	99
3449  001a 63            	dc.b	99
3503                     ; 856 void	disp_status_lpm(uint8_t key, uint8_t next)
3503                     ; 857 {
3504                     .text:	section	.text,new
3505  0000               _disp_status_lpm:
3507  0000 89            	pushw	x
3508  0001 88            	push	a
3509       00000001      OFST:	set	1
3512                     ; 861 	if( uiInfoSet.cntlMode == 1 )
3514  0002 c6006e        	ld	a,_uiInfoSet
3515  0005 4a            	dec	a
3516  0006 2604          	jrne	L1111
3517                     ; 863 		STATUS_NEXT(next);
3519  0008 9f            	ld	a,xl
3522                     ; 864 		return;
3525  0009 cc00a1        	jp	LC018
3526  000c               L1111:
3527                     ; 866 	if( _dsCount == 0 )
3529  000c c60015        	ld	a,__dsCount
3530  000f 2608          	jrne	L7601
3531                     ; 868 		disp_next();
3533  0011 cd0000        	call	_disp_next
3535                     ; 869 		lcd_disp_setup_lpm();
3537  0014 cd0000        	call	_lcd_disp_setup_lpm
3540  0017 2069          	jra	L5111
3541  0019               L7601:
3542                     ; 873 EncEntry:		
3542                     ; 874 		i = uiInfoSet.controlMode==1 ? uiInfoSet.lpmType_sub : uiInfoSet.lpmType;
3544  0019 c60074        	ld	a,_uiInfoSet+6
3545  001c 4a            	dec	a
3546  001d 2605          	jrne	L075
3547  001f c6007c        	ld	a,_uiInfoSet+14
3548  0022 2003          	jra	L275
3549  0024               L075:
3550  0024 c6007b        	ld	a,_uiInfoSet+13
3551  0027               L275:
3552  0027 6b01          	ld	(OFST+0,sp),a
3553                     ; 876 		if( uiInfo.enc != 0 )
3555  0029 c60001        	ld	a,_uiInfo
3556  002c 2730          	jreq	L7111
3557                     ; 878 			if( (uiInfo.enc & 0x40) == 0 )
3559  002e a540          	bcp	a,#64
3560  0030 260e          	jrne	L1211
3561                     ; 880 				if( i==0 )	i = 7;
3563  0032 7b01          	ld	a,(OFST+0,sp)
3564  0034 2606          	jrne	L3211
3567  0036 a607          	ld	a,#7
3568  0038 6b01          	ld	(OFST+0,sp),a
3570  003a 2010          	jra	L7211
3571  003c               L3211:
3572                     ; 882 					i--;
3574  003c 0a01          	dec	(OFST+0,sp)
3575  003e 200c          	jra	L7211
3576  0040               L1211:
3577                     ; 886 				if( i==7 )	i = 0;
3579  0040 7b01          	ld	a,(OFST+0,sp)
3580  0042 a107          	cp	a,#7
3581  0044 2604          	jrne	L1311
3584  0046 0f01          	clr	(OFST+0,sp)
3586  0048 2002          	jra	L7211
3587  004a               L1311:
3588                     ; 888 					i++;
3590  004a 0c01          	inc	(OFST+0,sp)
3591  004c               L7211:
3592                     ; 890 			if( uiInfoSet.controlMode==1 )
3594  004c c60074        	ld	a,_uiInfoSet+6
3595  004f 4a            	dec	a
3596  0050 2607          	jrne	L5311
3597                     ; 891 				uiInfoSet.lpmType_sub = i;
3599  0052 7b01          	ld	a,(OFST+0,sp)
3600  0054 c7007c        	ld	_uiInfoSet+14,a
3602  0057 2005          	jra	L7111
3603  0059               L5311:
3604                     ; 893 				uiInfoSet.lpmType = i;
3606  0059 7b01          	ld	a,(OFST+0,sp)
3607  005b c7007b        	ld	_uiInfoSet+13,a
3608  005e               L7111:
3609                     ; 895 		if( _dsPrev != i )
3611  005e c60016        	ld	a,__dsPrev
3612  0061 1101          	cp	a,(OFST+0,sp)
3613  0063 271d          	jreq	L5111
3614                     ; 897 			_dsPrev = i;
3616  0065 7b01          	ld	a,(OFST+0,sp)
3617  0067 c70016        	ld	__dsPrev,a
3618                     ; 898 			clear_npos2();
3620  006a cd0000        	call	_clear_npos2
3622                     ; 899 			UI_DISP_2Digit(__lpm[i]);
3624  006d 7b01          	ld	a,(OFST+0,sp)
3625  006f ad3e          	call	LC019
3626  0071 a602          	ld	a,#2
3627  0073 95            	ld	xh,a
3628  0074 cd0000        	call	_lcd_disp_n
3632  0077 7b01          	ld	a,(OFST+0,sp)
3633  0079 ad34          	call	LC019
3634  007b 97            	ld	xl,a
3635  007c a603          	ld	a,#3
3636  007e 95            	ld	xh,a
3637  007f cd0000        	call	_lcd_disp_n
3640  0082               L5111:
3641                     ; 902 	if( key == 0x10 )		__DN
3643  0082 7b02          	ld	a,(OFST+1,sp)
3644  0084 a110          	cp	a,#16
3645  0086 2606          	jrne	L3411
3648  0088 35400001      	mov	_uiInfo,#64
3652  008c 2008          	jp	LC017
3653  008e               L3411:
3654                     ; 903 	else if( key == 0x20 )	__UP
3656  008e a120          	cp	a,#32
3657  0090 2609          	jrne	L7411
3660  0092 35010001      	mov	_uiInfo,#1
3663  0096               LC017:
3665  0096 0f02          	clr	(OFST+1,sp)
3668  0098 cc0019        	jra	L7601
3669  009b               L7411:
3670                     ; 904 	else if( key == 4 )		
3672  009b a104          	cp	a,#4
3673  009d 260d          	jrne	L5411
3674                     ; 906 		STATUS_NEXT(next);	
3676  009f 7b03          	ld	a,(OFST+2,sp)
3681  00a1               LC018:
3682  00a1 c70014        	ld	__ds,a
3684  00a4 725f0015      	clr	__dsCount
3686  00a8 35ff0016      	mov	__dsPrev,#255
3688  00ac               L5411:
3689                     ; 909 }
3692  00ac 5b03          	addw	sp,#3
3693  00ae 81            	ret	
3694  00af               LC019:
3695  00af 5f            	clrw	x
3696  00b0 97            	ld	xl,a
3697  00b1 d60012        	ld	a,(___lpm,x)
3698  00b4 5f            	clrw	x
3699  00b5 97            	ld	xl,a
3700  00b6 a60a          	ld	a,#10
3701  00b8 62            	div	x,a
3702  00b9 81            	ret	
3735                     ; 911 void	disp_status_temp_offset(uint8_t key, uint8_t next)
3735                     ; 912 {
3736                     .text:	section	.text,new
3737  0000               _disp_status_temp_offset:
3741                     ; 953 }
3744  0000 81            	ret	
3747                     	switch	.data
3748  0019               __ui_:
3749  0019 00            	dc.b	0
3829                     ; 961 void	disp_status_valveinfo_sub(uint8_t key, uint8_t next, uint8_t prev)
3829                     ; 962 {
3830                     .text:	section	.text,new
3831  0000               _disp_status_valveinfo_sub:
3833  0000 89            	pushw	x
3834  0001 520c          	subw	sp,#12
3835       0000000c      OFST:	set	12
3838                     ; 966 	if( _dsCount == 0 )
3840  0003 c60015        	ld	a,__dsCount
3841  0006 2664          	jrne	L1711
3842                     ; 968 		if( uiInfoSet.valve_sub == 0 )
3844  0008 725d0076      	tnz	_uiInfoSet+8
3845  000c 260a          	jrne	L5221
3846                     ; 970 			uiInfoSet.cnt_sub = 0;
3848  000e c70071        	ld	_uiInfoSet+3,a
3849                     ; 971 			uiInfoSet.lpmType_sub = 0;
3851  0011 c7007c        	ld	_uiInfoSet+14,a
3852                     ; 972 			STATUS_NEXT(next);	
3854  0014 9f            	ld	a,xl
3855  0015 cd019f        	call	LC023
3857  0018               L5221:
3858                     ; 974 		disp_next();
3860  0018 cd0000        	call	_disp_next
3862                     ; 975 		lcd_disp_n(0, UI_RIDs+1);
3864  001b c600a1        	ld	a,_uiInfoSet+51
3865  001e 4c            	inc	a
3866  001f 97            	ld	xl,a
3867  0020 4f            	clr	a
3868  0021 95            	ld	xh,a
3869  0022 cd0000        	call	_lcd_disp_n
3871                     ; 976 		lcd_blink_npos(UI_RIDs+1);
3873  0025 c600a1        	ld	a,_uiInfoSet+51
3874  0028 4c            	inc	a
3875  0029 cd0000        	call	_lcd_blink_npos
3877                     ; 977 		_ui_ = uiInfoSet.valve_sub_rc[UI_RIDs];// + uiInfoSet.cnt;
3879  002c cd0199        	call	LC022
3880  002f d60095        	ld	a,(_uiInfoSet+39,x)
3881  0032 c70019        	ld	__ui_,a
3882                     ; 978 		lcd_disp_rid(_ui_, 1, 0);
3884  0035 4b00          	push	#0
3885  0037 ae0001        	ldw	x,#1
3886  003a 95            	ld	xh,a
3887  003b cd0000        	call	_lcd_disp_rid
3889  003e 84            	pop	a
3890                     ; 979 		for( i=0; i<8; i++ )
3892  003f 4f            	clr	a
3893  0040 6b0c          	ld	(OFST+0,sp),a
3894  0042               L7221:
3895                     ; 981 			if( i >= uiInfoSet.valve_sub )
3897  0042 c10076        	cp	a,_uiInfoSet+8
3898  0045 5f            	clrw	x
3899  0046 97            	ld	xl,a
3900  0047 250c          	jrult	L5321
3901                     ; 983 				uiInfoSet.valve_sub_len[i] = 0;
3903  0049 724f008d      	clr	(_uiInfoSet+31,x)
3904                     ; 984 				uiInfoSet.valve_sub_rc[i] = 0;
3906  004d 5f            	clrw	x
3907  004e 97            	ld	xl,a
3908  004f 724f0095      	clr	(_uiInfoSet+39,x)
3910  0053 200d          	jra	L7321
3911  0055               L5321:
3912                     ; 988 				if( uiInfoSet.valve_rc[i] == 0 )
3914  0055 724d0085      	tnz	(_uiInfoSet+23,x)
3915  0059 2607          	jrne	L7321
3916                     ; 989 					uiInfoSet.valve_rc[i] = 1;
3918  005b 5f            	clrw	x
3919  005c 97            	ld	xl,a
3920  005d a601          	ld	a,#1
3921  005f d70085        	ld	(_uiInfoSet+23,x),a
3922  0062               L7321:
3923                     ; 979 		for( i=0; i<8; i++ )
3925  0062 0c0c          	inc	(OFST+0,sp)
3928  0064 7b0c          	ld	a,(OFST+0,sp)
3929  0066 a108          	cp	a,#8
3930  0068 25d8          	jrult	L7221
3932  006a 206d          	jra	L3421
3933  006c               L1711:
3934                     ; 995 EncEntry:		
3934                     ; 996 		i = uiInfoSet.valve_sub_len[UI_RIDs];
3936  006c cd0199        	call	LC022
3937  006f d6008d        	ld	a,(_uiInfoSet+31,x)
3938  0072 6b0c          	ld	(OFST+0,sp),a
3939                     ; 997 		if( uiInfo.enc != 0 )
3941  0074 c60001        	ld	a,_uiInfo
3942  0077 2724          	jreq	L5421
3943                     ; 999 			if( (uiInfo.enc & 0x40) == 0 )	i--;
3945  0079 a540          	bcp	a,#64
3946  007b 2604          	jrne	L7421
3949  007d 0a0c          	dec	(OFST+0,sp)
3951  007f 2002          	jra	L1521
3952  0081               L7421:
3953                     ; 1001 				i++;
3955  0081 0c0c          	inc	(OFST+0,sp)
3956  0083               L1521:
3957                     ; 1002 			if( i > 150 )	i = 35;
3959  0083 7b0c          	ld	a,(OFST+0,sp)
3960  0085 a197          	cp	a,#151
3961  0087 2504          	jrult	L3521
3964  0089 a623          	ld	a,#35
3965  008b 6b0c          	ld	(OFST+0,sp),a
3966  008d               L3521:
3967                     ; 1003 			if( i < 35 )	i = 150;
3969  008d a123          	cp	a,#35
3970  008f 2404          	jruge	L5521
3973  0091 a696          	ld	a,#150
3974  0093 6b0c          	ld	(OFST+0,sp),a
3975  0095               L5521:
3976                     ; 1004 			uiInfoSet.valve_sub_len[UI_RIDs] = i;
3978  0095 cd0199        	call	LC022
3979  0098 7b0c          	ld	a,(OFST+0,sp)
3980  009a d7008d        	ld	(_uiInfoSet+31,x),a
3981  009d               L5421:
3982                     ; 1006 		if( _dsPrev != i )
3984  009d c60016        	ld	a,__dsPrev
3985  00a0 110c          	cp	a,(OFST+0,sp)
3986  00a2 2735          	jreq	L3421
3987                     ; 1008 			_dsPrev = i;
3989  00a4 7b0c          	ld	a,(OFST+0,sp)
3990  00a6 c70016        	ld	__dsPrev,a
3991                     ; 1009 			UI_DISP_3Digit(i);
3993  00a9 5f            	clrw	x
3994  00aa 97            	ld	xl,a
3995  00ab a664          	ld	a,#100
3996  00ad 62            	div	x,a
3997  00ae a601          	ld	a,#1
3998  00b0 95            	ld	xh,a
3999  00b1 cd0000        	call	_lcd_disp_n
4003  00b4 7b0c          	ld	a,(OFST+0,sp)
4004  00b6 5f            	clrw	x
4005  00b7 97            	ld	xl,a
4006  00b8 a664          	ld	a,#100
4007  00ba 62            	div	x,a
4008  00bb 5f            	clrw	x
4009  00bc 97            	ld	xl,a
4010  00bd 01            	rrwa	x,a
4011  00be 6b0c          	ld	(OFST+0,sp),a
4014  00c0 5f            	clrw	x
4015  00c1 97            	ld	xl,a
4016  00c2 a60a          	ld	a,#10
4017  00c4 62            	div	x,a
4018  00c5 a602          	ld	a,#2
4019  00c7 95            	ld	xh,a
4020  00c8 cd0000        	call	_lcd_disp_n
4024  00cb 7b0c          	ld	a,(OFST+0,sp)
4025  00cd 5f            	clrw	x
4026  00ce 97            	ld	xl,a
4027  00cf a60a          	ld	a,#10
4028  00d1 62            	div	x,a
4029  00d2 97            	ld	xl,a
4030  00d3 a603          	ld	a,#3
4031  00d5 95            	ld	xh,a
4032  00d6 cd0000        	call	_lcd_disp_n
4035  00d9               L3421:
4036                     ; 1012 	if( key == 0x10 )		__DN
4038  00d9 7b0d          	ld	a,(OFST+1,sp)
4039  00db a110          	cp	a,#16
4040  00dd 2606          	jrne	L1621
4043  00df 35400001      	mov	_uiInfo,#64
4047  00e3 2008          	jp	LC020
4048  00e5               L1621:
4049                     ; 1013 	else if( key == 0x20 )	__UP
4051  00e5 a120          	cp	a,#32
4052  00e7 2609          	jrne	L5621
4055  00e9 35010001      	mov	_uiInfo,#1
4058  00ed               LC020:
4060  00ed 0f0d          	clr	(OFST+1,sp)
4063  00ef cc006c        	jra	L1711
4064  00f2               L5621:
4065                     ; 1014 	else if( key == 4 )		
4067  00f2 a104          	cp	a,#4
4068  00f4 266a          	jrne	L1721
4069                     ; 1016 		lcd_blink_npos_clear();
4071  00f6 cd0000        	call	_lcd_blink_npos_clear
4073                     ; 1017 		STATUS_NEXT(next);	
4075  00f9 7b0e          	ld	a,(OFST+2,sp)
4076  00fb cd019f        	call	LC023
4077                     ; 1018 		for( i=0; i<8; i++ )
4080  00fe 0f0c          	clr	(OFST+0,sp)
4081  0100               L3721:
4082                     ; 1019 			b[i] = 0;
4084  0100 96            	ldw	x,sp
4085  0101 1c0004        	addw	x,#OFST-8
4086  0104 9f            	ld	a,xl
4087  0105 5e            	swapw	x
4088  0106 1b0c          	add	a,(OFST+0,sp)
4089  0108 2401          	jrnc	L036
4090  010a 5c            	incw	x
4091  010b               L036:
4092  010b 02            	rlwa	x,a
4093  010c 7f            	clr	(x)
4094                     ; 1018 		for( i=0; i<8; i++ )
4096  010d 0c0c          	inc	(OFST+0,sp)
4099  010f 7b0c          	ld	a,(OFST+0,sp)
4100  0111 a108          	cp	a,#8
4101  0113 25eb          	jrult	L3721
4102                     ; 1020 		for( i=0; i<8; i++ )
4104  0115 4f            	clr	a
4105  0116 6b0c          	ld	(OFST+0,sp),a
4106  0118               L1031:
4107                     ; 1022 			if( uiInfoSet.valve_sub_rc[i] != 0 )
4109  0118 5f            	clrw	x
4110  0119 97            	ld	xl,a
4111  011a 724d0095      	tnz	(_uiInfoSet+39,x)
4112  011e 2714          	jreq	L7031
4113                     ; 1023 				b[uiInfoSet.valve_sub_rc[i]-1] = 1;
4115  0120 96            	ldw	x,sp
4116  0121 1c0004        	addw	x,#OFST-8
4117  0124 1f01          	ldw	(OFST-11,sp),x
4118  0126 5f            	clrw	x
4119  0127 97            	ld	xl,a
4120  0128 d60095        	ld	a,(_uiInfoSet+39,x)
4121  012b 5f            	clrw	x
4122  012c 97            	ld	xl,a
4123  012d 5a            	decw	x
4124  012e 72fb01        	addw	x,(OFST-11,sp)
4125  0131 a601          	ld	a,#1
4126  0133 f7            	ld	(x),a
4127  0134               L7031:
4128                     ; 1020 		for( i=0; i<8; i++ )
4130  0134 0c0c          	inc	(OFST+0,sp)
4133  0136 7b0c          	ld	a,(OFST+0,sp)
4134  0138 a108          	cp	a,#8
4135  013a 25dc          	jrult	L1031
4136                     ; 1025 		j = 0;
4138  013c 0f03          	clr	(OFST-9,sp)
4139                     ; 1026 		for( i=0; i<8; i++ )
4141  013e 0f0c          	clr	(OFST+0,sp)
4142  0140               L1131:
4143                     ; 1028 			if( b[i] != 0 )
4145  0140 96            	ldw	x,sp
4146  0141 1c0004        	addw	x,#OFST-8
4147  0144 9f            	ld	a,xl
4148  0145 5e            	swapw	x
4149  0146 1b0c          	add	a,(OFST+0,sp)
4150  0148 2401          	jrnc	L236
4151  014a 5c            	incw	x
4152  014b               L236:
4153  014b 02            	rlwa	x,a
4154  014c f6            	ld	a,(x)
4155  014d 2702          	jreq	L7131
4156                     ; 1029 				j++;
4158  014f 0c03          	inc	(OFST-9,sp)
4159  0151               L7131:
4160                     ; 1026 		for( i=0; i<8; i++ )
4162  0151 0c0c          	inc	(OFST+0,sp)
4165  0153 7b0c          	ld	a,(OFST+0,sp)
4166  0155 a108          	cp	a,#8
4167  0157 25e7          	jrult	L1131
4168                     ; 1031 		uiInfoSet.cnt_sub = j;
4170  0159 7b03          	ld	a,(OFST-9,sp)
4171  015b c70071        	ld	_uiInfoSet+3,a
4173  015e 2036          	jra	L3621
4174  0160               L1721:
4175                     ; 1033 	else if( key == 8 )
4177  0160 a108          	cp	a,#8
4178  0162 2618          	jrne	L3231
4179                     ; 1035 		uiInfoSet.valve_sub_rc[UI_RIDs]++;
4181  0164 ad33          	call	LC022
4182  0166 724c0095      	inc	(_uiInfoSet+39,x)
4183                     ; 1036 		if( uiInfoSet.valve_sub_rc[UI_RIDs] > 8 )
4185  016a 5f            	clrw	x
4186  016b 97            	ld	xl,a
4187  016c d60095        	ld	a,(_uiInfoSet+39,x)
4188  016f a109          	cp	a,#9
4189  0171 251f          	jrult	L3331
4190                     ; 1037 			uiInfoSet.valve_sub_rc[UI_RIDs] = 1;
4192  0173 ad24          	call	LC022
4193  0175 a601          	ld	a,#1
4194  0177 d70095        	ld	(_uiInfoSet+39,x),a
4195                     ; 1044 		STATUS_NEXT(prev);
4200  017a 2016          	jp	L3331
4201  017c               L3231:
4202                     ; 1046 	else if( key == 1 )
4204  017c 4a            	dec	a
4205  017d 2617          	jrne	L3621
4206                     ; 1048 		lcd_blink_npos_clear();
4208  017f cd0000        	call	_lcd_blink_npos_clear
4210                     ; 1049 		UI_RIDs++;
4212  0182 725c00a1      	inc	_uiInfoSet+51
4213                     ; 1050 		if( UI_RIDs >= uiInfoSet.valve_sub )
4215  0186 c600a1        	ld	a,_uiInfoSet+51
4216  0189 c10076        	cp	a,_uiInfoSet+8
4217  018c 2504          	jrult	L3331
4218                     ; 1051 			UI_RIDs = 0;
4220  018e 725f00a1      	clr	_uiInfoSet+51
4221  0192               L3331:
4222                     ; 1052 		STATUS_NEXT(prev);
4229  0192 7b11          	ld	a,(OFST+5,sp)
4230  0194 ad09          	call	LC023
4232  0196               L3621:
4233                     ; 1055 }
4236  0196 5b0e          	addw	sp,#14
4237  0198 81            	ret	
4238  0199               LC022:
4239  0199 c600a1        	ld	a,_uiInfoSet+51
4240  019c 5f            	clrw	x
4241  019d 97            	ld	xl,a
4242  019e 81            	ret	
4243  019f               LC023:
4244  019f c70014        	ld	__ds,a
4246  01a2 725f0015      	clr	__dsCount
4248  01a6 35ff0016      	mov	__dsPrev,#255
4249  01aa 81            	ret	
4332                     ; 1057 void	disp_status_valveinfo(uint8_t key, uint8_t next, uint8_t prev)
4332                     ; 1058 {
4333                     .text:	section	.text,new
4334  0000               _disp_status_valveinfo:
4336  0000 89            	pushw	x
4337  0001 520c          	subw	sp,#12
4338       0000000c      OFST:	set	12
4341                     ; 1062 	if( uiInfoSet.controlMode==1 )
4343  0003 c60074        	ld	a,_uiInfoSet+6
4344  0006 4a            	dec	a
4345  0007 260d          	jrne	L7631
4346                     ; 1064 		disp_status_valveinfo_sub(key, next, prev);
4348  0009 7b11          	ld	a,(OFST+5,sp)
4349  000b 88            	push	a
4350  000c 7b0e          	ld	a,(OFST+2,sp)
4351  000e 95            	ld	xh,a
4352  000f cd0000        	call	_disp_status_valveinfo_sub
4354  0012 84            	pop	a
4355                     ; 1065 		return;
4357  0013 cc01b8        	jra	L1341
4358  0016               L7631:
4359                     ; 1067 	if( _dsCount == 0 )
4361  0016 c60015        	ld	a,__dsCount
4362  0019 2665          	jrne	L5331
4363                     ; 1069 		if( uiInfoSet.valve == 0 )
4365  001b 725d0075      	tnz	_uiInfoSet+7
4366  001f 260b          	jrne	L3731
4367                     ; 1071 			uiInfoSet.cnt = 0;
4369  0021 c70070        	ld	_uiInfoSet+2,a
4370                     ; 1072 			uiInfoSet.lpmType = 0;
4372  0024 c7007b        	ld	_uiInfoSet+13,a
4373                     ; 1073 			STATUS_NEXT(next);	
4375  0027 7b0e          	ld	a,(OFST+2,sp)
4376  0029 cd01c1        	call	LC027
4378  002c               L3731:
4379                     ; 1075 		disp_next();
4381  002c cd0000        	call	_disp_next
4383                     ; 1076 		lcd_disp_n(0, UI_RID+1);
4385  002f c6009f        	ld	a,_uiInfoSet+49
4386  0032 4c            	inc	a
4387  0033 97            	ld	xl,a
4388  0034 4f            	clr	a
4389  0035 95            	ld	xh,a
4390  0036 cd0000        	call	_lcd_disp_n
4392                     ; 1077 		lcd_blink_npos(UI_RID+1);
4394  0039 c6009f        	ld	a,_uiInfoSet+49
4395  003c 4c            	inc	a
4396  003d cd0000        	call	_lcd_blink_npos
4398                     ; 1078 		_ui_ = uiInfoSet.valve_rc[UI_RID];
4400  0040 cd01bb        	call	LC026
4401  0043 d60085        	ld	a,(_uiInfoSet+23,x)
4402  0046 c70019        	ld	__ui_,a
4403                     ; 1079 		lcd_disp_rid(_ui_, 1, 0);
4405  0049 4b00          	push	#0
4406  004b ae0001        	ldw	x,#1
4407  004e 95            	ld	xh,a
4408  004f cd0000        	call	_lcd_disp_rid
4410  0052 84            	pop	a
4411                     ; 1080 		for( i=0; i<8; i++ )
4413  0053 4f            	clr	a
4414  0054 6b0c          	ld	(OFST+0,sp),a
4415  0056               L5731:
4416                     ; 1082 			if( i >= uiInfoSet.valve )
4418  0056 c10075        	cp	a,_uiInfoSet+7
4419  0059 5f            	clrw	x
4420  005a 97            	ld	xl,a
4421  005b 250c          	jrult	L3041
4422                     ; 1084 				uiInfoSet.valve_len[i] = 0;
4424  005d 724f007d      	clr	(_uiInfoSet+15,x)
4425                     ; 1085 				uiInfoSet.valve_rc[i] = 0;
4427  0061 5f            	clrw	x
4428  0062 97            	ld	xl,a
4429  0063 724f0085      	clr	(_uiInfoSet+23,x)
4431  0067 200d          	jra	L5041
4432  0069               L3041:
4433                     ; 1089 				if( uiInfoSet.valve_rc[i] == 0 )
4435  0069 724d0085      	tnz	(_uiInfoSet+23,x)
4436  006d 2607          	jrne	L5041
4437                     ; 1090 					uiInfoSet.valve_rc[i] = 1;
4439  006f 5f            	clrw	x
4440  0070 97            	ld	xl,a
4441  0071 a601          	ld	a,#1
4442  0073 d70085        	ld	(_uiInfoSet+23,x),a
4443  0076               L5041:
4444                     ; 1080 		for( i=0; i<8; i++ )
4446  0076 0c0c          	inc	(OFST+0,sp)
4449  0078 7b0c          	ld	a,(OFST+0,sp)
4450  007a a108          	cp	a,#8
4451  007c 25d8          	jrult	L5731
4453  007e 206d          	jra	L1141
4454  0080               L5331:
4455                     ; 1096 EncEntry:		
4455                     ; 1097 		i = uiInfoSet.valve_len[UI_RID];
4457  0080 cd01bb        	call	LC026
4458  0083 d6007d        	ld	a,(_uiInfoSet+15,x)
4459  0086 6b0c          	ld	(OFST+0,sp),a
4460                     ; 1098 		if( uiInfo.enc != 0 )
4462  0088 c60001        	ld	a,_uiInfo
4463  008b 2724          	jreq	L3141
4464                     ; 1100 			if( (uiInfo.enc & 0x40) == 0 )	i--;
4466  008d a540          	bcp	a,#64
4467  008f 2604          	jrne	L5141
4470  0091 0a0c          	dec	(OFST+0,sp)
4472  0093 2002          	jra	L7141
4473  0095               L5141:
4474                     ; 1102 				i++;
4476  0095 0c0c          	inc	(OFST+0,sp)
4477  0097               L7141:
4478                     ; 1103 			if( i > 150 )	i = 35;
4480  0097 7b0c          	ld	a,(OFST+0,sp)
4481  0099 a197          	cp	a,#151
4482  009b 2504          	jrult	L1241
4485  009d a623          	ld	a,#35
4486  009f 6b0c          	ld	(OFST+0,sp),a
4487  00a1               L1241:
4488                     ; 1104 			if( i < 35 )	i = 150;
4490  00a1 a123          	cp	a,#35
4491  00a3 2404          	jruge	L3241
4494  00a5 a696          	ld	a,#150
4495  00a7 6b0c          	ld	(OFST+0,sp),a
4496  00a9               L3241:
4497                     ; 1105 			uiInfoSet.valve_len[UI_RID] = i;
4499  00a9 cd01bb        	call	LC026
4500  00ac 7b0c          	ld	a,(OFST+0,sp)
4501  00ae d7007d        	ld	(_uiInfoSet+15,x),a
4502  00b1               L3141:
4503                     ; 1107 		if( _dsPrev != i )
4505  00b1 c60016        	ld	a,__dsPrev
4506  00b4 110c          	cp	a,(OFST+0,sp)
4507  00b6 2735          	jreq	L1141
4508                     ; 1109 			_dsPrev = i;
4510  00b8 7b0c          	ld	a,(OFST+0,sp)
4511  00ba c70016        	ld	__dsPrev,a
4512                     ; 1110 			UI_DISP_3Digit(i);
4514  00bd 5f            	clrw	x
4515  00be 97            	ld	xl,a
4516  00bf a664          	ld	a,#100
4517  00c1 62            	div	x,a
4518  00c2 a601          	ld	a,#1
4519  00c4 95            	ld	xh,a
4520  00c5 cd0000        	call	_lcd_disp_n
4524  00c8 7b0c          	ld	a,(OFST+0,sp)
4525  00ca 5f            	clrw	x
4526  00cb 97            	ld	xl,a
4527  00cc a664          	ld	a,#100
4528  00ce 62            	div	x,a
4529  00cf 5f            	clrw	x
4530  00d0 97            	ld	xl,a
4531  00d1 01            	rrwa	x,a
4532  00d2 6b0c          	ld	(OFST+0,sp),a
4535  00d4 5f            	clrw	x
4536  00d5 97            	ld	xl,a
4537  00d6 a60a          	ld	a,#10
4538  00d8 62            	div	x,a
4539  00d9 a602          	ld	a,#2
4540  00db 95            	ld	xh,a
4541  00dc cd0000        	call	_lcd_disp_n
4545  00df 7b0c          	ld	a,(OFST+0,sp)
4546  00e1 5f            	clrw	x
4547  00e2 97            	ld	xl,a
4548  00e3 a60a          	ld	a,#10
4549  00e5 62            	div	x,a
4550  00e6 97            	ld	xl,a
4551  00e7 a603          	ld	a,#3
4552  00e9 95            	ld	xh,a
4553  00ea cd0000        	call	_lcd_disp_n
4556  00ed               L1141:
4557                     ; 1113 	if( key == 0x10 )		__DN
4559  00ed 7b0d          	ld	a,(OFST+1,sp)
4560  00ef a110          	cp	a,#16
4561  00f1 2606          	jrne	L7241
4564  00f3 35400001      	mov	_uiInfo,#64
4568  00f7 2008          	jp	LC024
4569  00f9               L7241:
4570                     ; 1114 	else if( key == 0x20 )	__UP
4572  00f9 a120          	cp	a,#32
4573  00fb 2609          	jrne	L3341
4576  00fd 35010001      	mov	_uiInfo,#1
4579  0101               LC024:
4581  0101 0f0d          	clr	(OFST+1,sp)
4584  0103 cc0080        	jra	L5331
4585  0106               L3341:
4586                     ; 1115 	else if( key == 4 )		
4588  0106 a104          	cp	a,#4
4589  0108 266a          	jrne	L7341
4590                     ; 1117 		lcd_blink_npos_clear();
4592  010a cd0000        	call	_lcd_blink_npos_clear
4594                     ; 1118 		STATUS_NEXT(next);	
4596  010d 7b0e          	ld	a,(OFST+2,sp)
4597  010f cd01c1        	call	LC027
4598                     ; 1119 		for( i=0; i<8; i++ )
4601  0112 0f0c          	clr	(OFST+0,sp)
4602  0114               L1441:
4603                     ; 1120 			b[i] = 0;
4605  0114 96            	ldw	x,sp
4606  0115 1c0004        	addw	x,#OFST-8
4607  0118 9f            	ld	a,xl
4608  0119 5e            	swapw	x
4609  011a 1b0c          	add	a,(OFST+0,sp)
4610  011c 2401          	jrnc	L266
4611  011e 5c            	incw	x
4612  011f               L266:
4613  011f 02            	rlwa	x,a
4614  0120 7f            	clr	(x)
4615                     ; 1119 		for( i=0; i<8; i++ )
4617  0121 0c0c          	inc	(OFST+0,sp)
4620  0123 7b0c          	ld	a,(OFST+0,sp)
4621  0125 a108          	cp	a,#8
4622  0127 25eb          	jrult	L1441
4623                     ; 1121 		for( i=0; i<8; i++ )
4625  0129 4f            	clr	a
4626  012a 6b0c          	ld	(OFST+0,sp),a
4627  012c               L7441:
4628                     ; 1123 			if( uiInfoSet.valve_rc[i] != 0 )
4630  012c 5f            	clrw	x
4631  012d 97            	ld	xl,a
4632  012e 724d0085      	tnz	(_uiInfoSet+23,x)
4633  0132 2714          	jreq	L5541
4634                     ; 1124 				b[uiInfoSet.valve_rc[i]-1] = 1;
4636  0134 96            	ldw	x,sp
4637  0135 1c0004        	addw	x,#OFST-8
4638  0138 1f01          	ldw	(OFST-11,sp),x
4639  013a 5f            	clrw	x
4640  013b 97            	ld	xl,a
4641  013c d60085        	ld	a,(_uiInfoSet+23,x)
4642  013f 5f            	clrw	x
4643  0140 97            	ld	xl,a
4644  0141 5a            	decw	x
4645  0142 72fb01        	addw	x,(OFST-11,sp)
4646  0145 a601          	ld	a,#1
4647  0147 f7            	ld	(x),a
4648  0148               L5541:
4649                     ; 1121 		for( i=0; i<8; i++ )
4651  0148 0c0c          	inc	(OFST+0,sp)
4654  014a 7b0c          	ld	a,(OFST+0,sp)
4655  014c a108          	cp	a,#8
4656  014e 25dc          	jrult	L7441
4657                     ; 1126 		j = 0;
4659  0150 0f03          	clr	(OFST-9,sp)
4660                     ; 1127 		for( i=0; i<8; i++ )
4662  0152 0f0c          	clr	(OFST+0,sp)
4663  0154               L7541:
4664                     ; 1129 			if( b[i] != 0 )
4666  0154 96            	ldw	x,sp
4667  0155 1c0004        	addw	x,#OFST-8
4668  0158 9f            	ld	a,xl
4669  0159 5e            	swapw	x
4670  015a 1b0c          	add	a,(OFST+0,sp)
4671  015c 2401          	jrnc	L466
4672  015e 5c            	incw	x
4673  015f               L466:
4674  015f 02            	rlwa	x,a
4675  0160 f6            	ld	a,(x)
4676  0161 2702          	jreq	L5641
4677                     ; 1130 				j++;
4679  0163 0c03          	inc	(OFST-9,sp)
4680  0165               L5641:
4681                     ; 1127 		for( i=0; i<8; i++ )
4683  0165 0c0c          	inc	(OFST+0,sp)
4686  0167 7b0c          	ld	a,(OFST+0,sp)
4687  0169 a108          	cp	a,#8
4688  016b 25e7          	jrult	L7541
4689                     ; 1132 		uiInfoSet.cnt = j;
4691  016d 7b03          	ld	a,(OFST-9,sp)
4692  016f c70070        	ld	_uiInfoSet+2,a
4694  0172 2044          	jra	L1341
4695  0174               L7341:
4696                     ; 1134 	else if( key == 8 )
4698  0174 a108          	cp	a,#8
4699  0176 2626          	jrne	L1741
4700                     ; 1136 		uiInfoSet.valve_rc[UI_RID]++;
4702  0178 ad41          	call	LC026
4703  017a 724c0085      	inc	(_uiInfoSet+23,x)
4704                     ; 1137 		if( uiInfoSet.valve+1 == uiInfoSet.valve_rc[UI_RID] )
4706  017e 5f            	clrw	x
4707  017f 97            	ld	xl,a
4708  0180 d60085        	ld	a,(_uiInfoSet+23,x)
4709  0183 5f            	clrw	x
4710  0184 97            	ld	xl,a
4711  0185 c60075        	ld	a,_uiInfoSet+7
4712  0188 905f          	clrw	y
4713  018a 9097          	ld	yl,a
4714  018c bf00          	ldw	c_x,x
4715  018e 905c          	incw	y
4716  0190 90b300        	cpw	y,c_x
4717  0193 261f          	jrne	L1051
4718                     ; 1138 			uiInfoSet.valve_rc[UI_RID] = 1;
4720  0195 ad24          	call	LC026
4721  0197 a601          	ld	a,#1
4722  0199 d70085        	ld	(_uiInfoSet+23,x),a
4723                     ; 1139 		STATUS_NEXT(prev);
4728  019c 2016          	jp	L1051
4729  019e               L1741:
4730                     ; 1141 	else if( key == 1 )
4732  019e 4a            	dec	a
4733  019f 2617          	jrne	L1341
4734                     ; 1143 		lcd_blink_npos_clear();
4736  01a1 cd0000        	call	_lcd_blink_npos_clear
4738                     ; 1144 		UI_RID++;
4740  01a4 725c009f      	inc	_uiInfoSet+49
4741                     ; 1145 		if( UI_RID == uiInfoSet.valve )
4743  01a8 c6009f        	ld	a,_uiInfoSet+49
4744  01ab c10075        	cp	a,_uiInfoSet+7
4745  01ae 2604          	jrne	L1051
4746                     ; 1146 			UI_RID = 0;
4748  01b0 725f009f      	clr	_uiInfoSet+49
4749  01b4               L1051:
4750                     ; 1147 		STATUS_NEXT(prev);
4757  01b4 7b11          	ld	a,(OFST+5,sp)
4758  01b6 ad09          	call	LC027
4760  01b8               L1341:
4761                     ; 1150 }
4764  01b8 5b0e          	addw	sp,#14
4765  01ba 81            	ret	
4766  01bb               LC026:
4767  01bb c6009f        	ld	a,_uiInfoSet+49
4768  01be 5f            	clrw	x
4769  01bf 97            	ld	xl,a
4770  01c0 81            	ret	
4771  01c1               LC027:
4772  01c1 c70014        	ld	__ds,a
4774  01c4 725f0015      	clr	__dsCount
4776  01c8 35ff0016      	mov	__dsPrev,#255
4777  01cc 81            	ret	
4831                     ; 1152 void	disp_status_plc(uint8_t key, uint8_t next)
4831                     ; 1153 {
4832                     .text:	section	.text,new
4833  0000               _disp_status_plc:
4835  0000 89            	pushw	x
4836  0001 88            	push	a
4837       00000001      OFST:	set	1
4840                     ; 1181 	if( _dsCount == 0 )
4842  0002 c60015        	ld	a,__dsCount
4843  0005 260b          	jrne	L3051
4844                     ; 1183 		disp_next();
4846  0007 cd0000        	call	_disp_next
4848                     ; 1184 		lcd_disp_plc();
4850  000a cd0000        	call	_lcd_disp_plc
4852                     ; 1185 		lcd_disp_n(3, uiInfoSet.plc);
4854  000d c600a3        	ld	a,_uiInfoSet+53
4857  0010 2039          	jp	LC029
4858  0012               L3051:
4859                     ; 1189 EncEntry:
4859                     ; 1190 		i = uiInfoSet.plc;
4861  0012 c600a3        	ld	a,_uiInfoSet+53
4862  0015 6b01          	ld	(OFST+0,sp),a
4863                     ; 1191 		if( uiInfo.enc != 0 )
4865  0017 c60001        	ld	a,_uiInfo
4866  001a 2723          	jreq	L1351
4867                     ; 1194 			if( (uiInfo.enc & 0x40) == 0 )
4869  001c a540          	bcp	a,#64
4870  001e 260e          	jrne	L3351
4871                     ; 1196 				if( i != 0 )
4873  0020 7b01          	ld	a,(OFST+0,sp)
4874  0022 2704          	jreq	L5351
4875                     ; 1197 					i--;
4877  0024 0a01          	dec	(OFST+0,sp)
4879  0026 2012          	jra	L1451
4880  0028               L5351:
4881                     ; 1199 					i = _ID_MAX+1;
4883  0028 a607          	ld	a,#7
4884  002a 6b01          	ld	(OFST+0,sp),a
4885  002c 200c          	jra	L1451
4886  002e               L3351:
4887                     ; 1203 				if( i != _ID_MAX+1 )
4889  002e 7b01          	ld	a,(OFST+0,sp)
4890  0030 a107          	cp	a,#7
4891  0032 2704          	jreq	L3451
4892                     ; 1204 					i++;
4894  0034 0c01          	inc	(OFST+0,sp)
4896  0036 2002          	jra	L1451
4897  0038               L3451:
4898                     ; 1206 					i = 0;
4900  0038 0f01          	clr	(OFST+0,sp)
4901  003a               L1451:
4902                     ; 1208 			uiInfoSet.plc = i;
4904  003a 7b01          	ld	a,(OFST+0,sp)
4905  003c c700a3        	ld	_uiInfoSet+53,a
4906  003f               L1351:
4907                     ; 1210 		if( _dsPrev != i )
4909  003f c60016        	ld	a,__dsPrev
4910  0042 1101          	cp	a,(OFST+0,sp)
4911  0044 270c          	jreq	L7251
4912                     ; 1212 			_dsPrev = i;
4914  0046 7b01          	ld	a,(OFST+0,sp)
4915  0048 c70016        	ld	__dsPrev,a
4916                     ; 1213 			lcd_disp_n(3, i);
4918  004b               LC029:
4919  004b 97            	ld	xl,a
4920  004c a603          	ld	a,#3
4921  004e 95            	ld	xh,a
4922  004f cd0000        	call	_lcd_disp_n
4924  0052               L7251:
4925                     ; 1216 	if( key == 4 )		
4927  0052 7b02          	ld	a,(OFST+1,sp)
4928  0054 a104          	cp	a,#4
4929  0056 260f          	jrne	L1551
4930                     ; 1218 		STATUS_NEXT(next);	
4932  0058 7b03          	ld	a,(OFST+2,sp)
4933  005a c70014        	ld	__ds,a
4936  005d 725f0015      	clr	__dsCount
4939  0061 35ff0016      	mov	__dsPrev,#255
4942  0065 2016          	jra	L3551
4943  0067               L1551:
4944                     ; 1220 	else if( key == 0x10 )	__DN
4946  0067 a110          	cp	a,#16
4947  0069 2606          	jrne	L5551
4950  006b 35400001      	mov	_uiInfo,#64
4954  006f 2008          	jp	LC028
4955  0071               L5551:
4956                     ; 1221 	else if( key == 0x20 )	__UP
4958  0071 a120          	cp	a,#32
4959  0073 2608          	jrne	L3551
4962  0075 35010001      	mov	_uiInfo,#1
4965  0079               LC028:
4967  0079 0f02          	clr	(OFST+1,sp)
4970  007b 2095          	jra	L3051
4971  007d               L3551:
4972                     ; 1223 }
4975  007d 5b03          	addw	sp,#3
4976  007f 81            	ret	
4979                     	switch	.data
4980  001a               ___func_rc_timerout:
4981  001a 00            	dc.b	0
4982  001b               ___func_rc_timerout1:
4983  001b 00            	dc.b	0
4984  001c               ___func_rc_timerout2:
4985  001c 00            	dc.b	0
5043                     ; 1232 uint8_t	disp_status_run(uint8_t key, uint8_t next, uint8_t prev)
5043                     ; 1233 {
5044                     .text:	section	.text,new
5045  0000               _disp_status_run:
5047  0000 89            	pushw	x
5048       00000000      OFST:	set	0
5051                     ; 1235 	if( _dsCount == 0 )
5053  0001 c60015        	ld	a,__dsCount
5054  0004 2606          	jrne	L3061
5055                     ; 1237 		disp_next();
5057  0006 cd0000        	call	_disp_next
5059                     ; 1240 		lcd_disp_setup_run();
5061  0009 cd0000        	call	_lcd_disp_setup_run
5063  000c               L3061:
5064                     ; 1242 	if( key == 4 )	
5066  000c 7b01          	ld	a,(OFST+1,sp)
5067  000e a104          	cp	a,#4
5068  0010 2703cc0207    	jrne	L5061
5069                     ; 1244 		copy_infoSet();
5071  0015 cd0000        	call	_copy_infoSet
5073                     ; 1245 		FW_MODE(uiInfo.mode);
5075  0018 c60009        	ld	a,_uiInfo+8
5076  001b 97            	ld	xl,a
5077  001c a609          	ld	a,#9
5078  001e 95            	ld	xh,a
5079  001f cd0000        	call	_file_write
5081                     ; 1246 		FW_ID(uiInfo.id);
5083  0022 c60005        	ld	a,_uiInfo+4
5084  0025 97            	ld	xl,a
5085  0026 a60a          	ld	a,#10
5086  0028 95            	ld	xh,a
5087  0029 cd0000        	call	_file_write
5089                     ; 1247 		FW_TOFFSET(uiInfo.tOffset);
5091  002c c60012        	ld	a,_uiInfo+17
5092  002f 97            	ld	xl,a
5093  0030 a614          	ld	a,#20
5094  0032 95            	ld	xh,a
5095  0033 cd0000        	call	_file_write
5097                     ; 1248 		if( uiInfo.mode == 1 )
5099  0036 c60009        	ld	a,_uiInfo+8
5100  0039 4a            	dec	a
5101  003a 2703cc01f6    	jrne	L7061
5102                     ; 1250 			func_rc_setting();
5104  003f cd0000        	call	_func_rc_setting
5106                     ; 1251 			__func_rc_timerout = 6;
5108  0042 3506001a      	mov	___func_rc_timerout,#6
5109                     ; 1252 			FW_CNTLMODE(uiInfo.cntlMode);
5111  0046 c60004        	ld	a,_uiInfo+3
5112  0049 97            	ld	xl,a
5113  004a a608          	ld	a,#8
5114  004c 95            	ld	xh,a
5115  004d cd0000        	call	_file_write
5117                     ; 1253 			FW_VALVE(uiInfo.valve);
5119  0050 c6000b        	ld	a,_uiInfo+10
5120  0053 97            	ld	xl,a
5121  0054 a60e          	ld	a,#14
5122  0056 95            	ld	xh,a
5123  0057 cd0000        	call	_file_write
5125                     ; 1254 			FW_VALVE_SUB(uiInfo.valve_sub);
5127  005a c6000c        	ld	a,_uiInfo+11
5128  005d 97            	ld	xl,a
5129  005e a62c          	ld	a,#44
5130  0060 95            	ld	xh,a
5131  0061 cd0000        	call	_file_write
5133                     ; 1255 			FW_CNT(uiInfo.cnt);
5135  0064 c60006        	ld	a,_uiInfo+5
5136  0067 97            	ld	xl,a
5137  0068 a60b          	ld	a,#11
5138  006a 95            	ld	xh,a
5139  006b cd0000        	call	_file_write
5141                     ; 1256 			FW_CNT_SUB(uiInfo.cnt_sub);
5143  006e c60007        	ld	a,_uiInfo+6
5144  0071 97            	ld	xl,a
5145  0072 a62b          	ld	a,#43
5146  0074 95            	ld	xh,a
5147  0075 cd0000        	call	_file_write
5149                     ; 1257 			FW_CNT_MODE(uiInfo.controlMode);
5151  0078 c6000a        	ld	a,_uiInfo+9
5152  007b 97            	ld	xl,a
5153  007c a60d          	ld	a,#13
5154  007e 95            	ld	xh,a
5155  007f cd0000        	call	_file_write
5157                     ; 1258 			FW_OPMODE(uiInfo.opMode);
5159  0082 c60008        	ld	a,_uiInfo+7
5160  0085 97            	ld	xl,a
5161  0086 a60c          	ld	a,#12
5162  0088 95            	ld	xh,a
5163  0089 cd0000        	call	_file_write
5165                     ; 1259 			FW_POTYPE(uiInfo.poType);
5167  008c c60010        	ld	a,_uiInfo+15
5168  008f 97            	ld	xl,a
5169  0090 a612          	ld	a,#18
5170  0092 95            	ld	xh,a
5171  0093 cd0000        	call	_file_write
5173                     ; 1260 			FW_HOUSECAPA(uiInfo.houseCapa);
5175  0096 c60011        	ld	a,_uiInfo+16
5176  0099 97            	ld	xl,a
5177  009a a613          	ld	a,#19
5178  009c 95            	ld	xh,a
5179  009d cd0000        	call	_file_write
5181                     ; 1261 			FW_LPM(uiInfo.lpmType);
5183  00a0 c60014        	ld	a,_uiInfo+19
5184  00a3 97            	ld	xl,a
5185  00a4 a628          	ld	a,#40
5186  00a6 95            	ld	xh,a
5187  00a7 cd0000        	call	_file_write
5189                     ; 1262 			FW_TEMPOFFSET(uiInfo.tempOffset);
5191  00aa c60013        	ld	a,_uiInfo+18
5192  00ad 97            	ld	xl,a
5193  00ae a627          	ld	a,#39
5194  00b0 95            	ld	xh,a
5195  00b1 cd0000        	call	_file_write
5197                     ; 1264 			FW_VALVE_INFOS
5199  00b4 c60016        	ld	a,_uiInfo+21
5200  00b7 97            	ld	xl,a
5201  00b8 a615          	ld	a,#21
5202  00ba 95            	ld	xh,a
5203  00bb cd0000        	call	_file_write
5207  00be c60017        	ld	a,_uiInfo+22
5208  00c1 97            	ld	xl,a
5209  00c2 a616          	ld	a,#22
5210  00c4 95            	ld	xh,a
5211  00c5 cd0000        	call	_file_write
5215  00c8 c60018        	ld	a,_uiInfo+23
5216  00cb 97            	ld	xl,a
5217  00cc a617          	ld	a,#23
5218  00ce 95            	ld	xh,a
5219  00cf cd0000        	call	_file_write
5223  00d2 c60019        	ld	a,_uiInfo+24
5224  00d5 97            	ld	xl,a
5225  00d6 a618          	ld	a,#24
5226  00d8 95            	ld	xh,a
5227  00d9 cd0000        	call	_file_write
5231  00dc c6001a        	ld	a,_uiInfo+25
5232  00df 97            	ld	xl,a
5233  00e0 a619          	ld	a,#25
5234  00e2 95            	ld	xh,a
5235  00e3 cd0000        	call	_file_write
5239  00e6 c6001b        	ld	a,_uiInfo+26
5240  00e9 97            	ld	xl,a
5241  00ea a61a          	ld	a,#26
5242  00ec 95            	ld	xh,a
5243  00ed cd0000        	call	_file_write
5247  00f0 c6001c        	ld	a,_uiInfo+27
5248  00f3 97            	ld	xl,a
5249  00f4 a61b          	ld	a,#27
5250  00f6 95            	ld	xh,a
5251  00f7 cd0000        	call	_file_write
5255  00fa c6001d        	ld	a,_uiInfo+28
5256  00fd 97            	ld	xl,a
5257  00fe a61c          	ld	a,#28
5258  0100 95            	ld	xh,a
5259  0101 cd0000        	call	_file_write
5263  0104 c60026        	ld	a,_uiInfo+37
5264  0107 97            	ld	xl,a
5265  0108 a62e          	ld	a,#46
5266  010a 95            	ld	xh,a
5267  010b cd0000        	call	_file_write
5271  010e c60027        	ld	a,_uiInfo+38
5272  0111 97            	ld	xl,a
5273  0112 a62f          	ld	a,#47
5274  0114 95            	ld	xh,a
5275  0115 cd0000        	call	_file_write
5279  0118 c60028        	ld	a,_uiInfo+39
5280  011b 97            	ld	xl,a
5281  011c a630          	ld	a,#48
5282  011e 95            	ld	xh,a
5283  011f cd0000        	call	_file_write
5287  0122 c60029        	ld	a,_uiInfo+40
5288  0125 97            	ld	xl,a
5289  0126 a631          	ld	a,#49
5290  0128 95            	ld	xh,a
5291  0129 cd0000        	call	_file_write
5295  012c c6002a        	ld	a,_uiInfo+41
5296  012f 97            	ld	xl,a
5297  0130 a632          	ld	a,#50
5298  0132 95            	ld	xh,a
5299  0133 cd0000        	call	_file_write
5303  0136 c6002b        	ld	a,_uiInfo+42
5304  0139 97            	ld	xl,a
5305  013a a633          	ld	a,#51
5306  013c 95            	ld	xh,a
5307  013d cd0000        	call	_file_write
5311  0140 c6002c        	ld	a,_uiInfo+43
5312  0143 97            	ld	xl,a
5313  0144 a634          	ld	a,#52
5314  0146 95            	ld	xh,a
5315  0147 cd0000        	call	_file_write
5319  014a c6002d        	ld	a,_uiInfo+44
5320  014d 97            	ld	xl,a
5321  014e a635          	ld	a,#53
5322  0150 95            	ld	xh,a
5323  0151 cd0000        	call	_file_write
5325                     ; 1265 			FW_VALVE_RCINFOS
5327  0154 c6001e        	ld	a,_uiInfo+29
5328  0157 97            	ld	xl,a
5329  0158 a61d          	ld	a,#29
5330  015a 95            	ld	xh,a
5331  015b cd0000        	call	_file_write
5335  015e c6001f        	ld	a,_uiInfo+30
5336  0161 97            	ld	xl,a
5337  0162 a61e          	ld	a,#30
5338  0164 95            	ld	xh,a
5339  0165 cd0000        	call	_file_write
5343  0168 c60020        	ld	a,_uiInfo+31
5344  016b 97            	ld	xl,a
5345  016c a61f          	ld	a,#31
5346  016e 95            	ld	xh,a
5347  016f cd0000        	call	_file_write
5351  0172 c60021        	ld	a,_uiInfo+32
5352  0175 97            	ld	xl,a
5353  0176 a620          	ld	a,#32
5354  0178 95            	ld	xh,a
5355  0179 cd0000        	call	_file_write
5359  017c c60022        	ld	a,_uiInfo+33
5360  017f 97            	ld	xl,a
5361  0180 a621          	ld	a,#33
5362  0182 95            	ld	xh,a
5363  0183 cd0000        	call	_file_write
5367  0186 c60023        	ld	a,_uiInfo+34
5368  0189 97            	ld	xl,a
5369  018a a622          	ld	a,#34
5370  018c 95            	ld	xh,a
5371  018d cd0000        	call	_file_write
5375  0190 c60024        	ld	a,_uiInfo+35
5376  0193 97            	ld	xl,a
5377  0194 a623          	ld	a,#35
5378  0196 95            	ld	xh,a
5379  0197 cd0000        	call	_file_write
5383  019a c60025        	ld	a,_uiInfo+36
5384  019d 97            	ld	xl,a
5385  019e a624          	ld	a,#36
5386  01a0 95            	ld	xh,a
5387  01a1 cd0000        	call	_file_write
5391  01a4 c6002e        	ld	a,_uiInfo+45
5392  01a7 97            	ld	xl,a
5393  01a8 a636          	ld	a,#54
5394  01aa 95            	ld	xh,a
5395  01ab cd0000        	call	_file_write
5399  01ae c6002f        	ld	a,_uiInfo+46
5400  01b1 97            	ld	xl,a
5401  01b2 a637          	ld	a,#55
5402  01b4 95            	ld	xh,a
5403  01b5 cd0000        	call	_file_write
5407  01b8 c60030        	ld	a,_uiInfo+47
5408  01bb 97            	ld	xl,a
5409  01bc a638          	ld	a,#56
5410  01be 95            	ld	xh,a
5411  01bf cd0000        	call	_file_write
5415  01c2 c60031        	ld	a,_uiInfo+48
5416  01c5 97            	ld	xl,a
5417  01c6 a639          	ld	a,#57
5418  01c8 95            	ld	xh,a
5419  01c9 cd0000        	call	_file_write
5423  01cc c60032        	ld	a,_uiInfo+49
5424  01cf 97            	ld	xl,a
5425  01d0 a63a          	ld	a,#58
5426  01d2 95            	ld	xh,a
5427  01d3 cd0000        	call	_file_write
5431  01d6 c60033        	ld	a,_uiInfo+50
5432  01d9 97            	ld	xl,a
5433  01da a63b          	ld	a,#59
5434  01dc 95            	ld	xh,a
5435  01dd cd0000        	call	_file_write
5439  01e0 c60034        	ld	a,_uiInfo+51
5440  01e3 97            	ld	xl,a
5441  01e4 a63c          	ld	a,#60
5442  01e6 95            	ld	xh,a
5443  01e7 cd0000        	call	_file_write
5447  01ea c60035        	ld	a,_uiInfo+52
5448  01ed 97            	ld	xl,a
5449  01ee a63d          	ld	a,#61
5450  01f0 95            	ld	xh,a
5451  01f1 cd0000        	call	_file_write
5454  01f4 2004          	jra	L1161
5455  01f6               L7061:
5456                     ; 1269 			__func_rc_timerout = 4;
5458  01f6 3504001a      	mov	___func_rc_timerout,#4
5459  01fa               L1161:
5460                     ; 1272 		__func_rc_timerout1 = 0;
5462  01fa 725f001b      	clr	___func_rc_timerout1
5463                     ; 1273 		__func_rc_timerout2 = __timer1s;
5465  01fe 550000001c    	mov	___func_rc_timerout2,___timer1s
5466                     ; 1274 		STATUS_NEXT(next);	
5468  0203 7b02          	ld	a,(OFST+2,sp)
5473  0205 2012          	jp	LC030
5474  0207               L5061:
5475                     ; 1276 	else if( key == 2 )
5477  0207 a102          	cp	a,#2
5478  0209 2608          	jrne	L5161
5479                     ; 1278 		_backup_backlight = 0;
5481  020b 725f0009      	clr	__backup_backlight
5482                     ; 1280 		return 1;
5484  020f a601          	ld	a,#1
5486  0211 2012          	jra	L2501
5487  0213               L5161:
5488                     ; 1282 	else if( key == 8 )
5490  0213 a108          	cp	a,#8
5491  0215 260d          	jrne	L3161
5492                     ; 1284 		STATUS_NEXT(prev);
5494  0217 7b05          	ld	a,(OFST+5,sp)
5499  0219               LC030:
5500  0219 c70014        	ld	__ds,a
5502  021c 725f0015      	clr	__dsCount
5504  0220 35ff0016      	mov	__dsPrev,#255
5506  0224               L3161:
5507                     ; 1286 	return 0;
5509  0224 4f            	clr	a
5511  0225               L2501:
5513  0225 85            	popw	x
5514  0226 81            	ret	
5565                     ; 1289 uint8_t	disp_status_run_id(uint8_t key, uint8_t next, uint8_t prev)
5565                     ; 1290 {
5566                     .text:	section	.text,new
5567  0000               _disp_status_run_id:
5569  0000 89            	pushw	x
5570       00000000      OFST:	set	0
5573                     ; 1292 	if( _dsCount == 0 )
5575  0001 c60015        	ld	a,__dsCount
5576  0004 2606          	jrne	L1461
5577                     ; 1294 		disp_next();
5579  0006 cd0000        	call	_disp_next
5581                     ; 1295 		lcd_disp_setup_run();
5583  0009 cd0000        	call	_lcd_disp_setup_run
5585  000c               L1461:
5586                     ; 1297 	if( key == 4 )	
5588  000c 7b01          	ld	a,(OFST+1,sp)
5589  000e a104          	cp	a,#4
5590  0010 2703cc020d    	jrne	L3461
5591                     ; 1299 		copy_infoSet();
5593  0015 cd0000        	call	_copy_infoSet
5595                     ; 1300 		FW_MODE(uiInfo.mode);
5597  0018 c60009        	ld	a,_uiInfo+8
5598  001b 97            	ld	xl,a
5599  001c a609          	ld	a,#9
5600  001e 95            	ld	xh,a
5601  001f cd0000        	call	_file_write
5603                     ; 1301 		FW_ID(uiInfo.id);
5605  0022 c60005        	ld	a,_uiInfo+4
5606  0025 97            	ld	xl,a
5607  0026 a60a          	ld	a,#10
5608  0028 95            	ld	xh,a
5609  0029 cd0000        	call	_file_write
5611                     ; 1302 		FW_TOFFSET(uiInfo.tOffset);
5613  002c c60012        	ld	a,_uiInfo+17
5614  002f 97            	ld	xl,a
5615  0030 a614          	ld	a,#20
5616  0032 95            	ld	xh,a
5617  0033 cd0000        	call	_file_write
5619                     ; 1304 		if( uiInfo.mode == 1 )
5621  0036 c60009        	ld	a,_uiInfo+8
5622  0039 4a            	dec	a
5623  003a 2703cc01f3    	jrne	L5461
5624                     ; 1307 			__func_rc_timerout = 6;
5626  003f 3506001a      	mov	___func_rc_timerout,#6
5627                     ; 1308 			FW_CNTLMODE(uiInfo.cntlMode);
5629  0043 c60004        	ld	a,_uiInfo+3
5630  0046 97            	ld	xl,a
5631  0047 a608          	ld	a,#8
5632  0049 95            	ld	xh,a
5633  004a cd0000        	call	_file_write
5635                     ; 1309 			FW_VALVE(uiInfo.valve);
5637  004d c6000b        	ld	a,_uiInfo+10
5638  0050 97            	ld	xl,a
5639  0051 a60e          	ld	a,#14
5640  0053 95            	ld	xh,a
5641  0054 cd0000        	call	_file_write
5643                     ; 1310 			FW_VALVE_SUB(uiInfo.valve_sub);
5645  0057 c6000c        	ld	a,_uiInfo+11
5646  005a 97            	ld	xl,a
5647  005b a62c          	ld	a,#44
5648  005d 95            	ld	xh,a
5649  005e cd0000        	call	_file_write
5651                     ; 1311 			FW_CNT(uiInfo.cnt);
5653  0061 c60006        	ld	a,_uiInfo+5
5654  0064 97            	ld	xl,a
5655  0065 a60b          	ld	a,#11
5656  0067 95            	ld	xh,a
5657  0068 cd0000        	call	_file_write
5659                     ; 1312 			FW_CNT_SUB(uiInfo.cnt_sub);
5661  006b c60007        	ld	a,_uiInfo+6
5662  006e 97            	ld	xl,a
5663  006f a62b          	ld	a,#43
5664  0071 95            	ld	xh,a
5665  0072 cd0000        	call	_file_write
5667                     ; 1313 			FW_CNT_MODE(uiInfo.controlMode);
5669  0075 c6000a        	ld	a,_uiInfo+9
5670  0078 97            	ld	xl,a
5671  0079 a60d          	ld	a,#13
5672  007b 95            	ld	xh,a
5673  007c cd0000        	call	_file_write
5675                     ; 1314 			FW_OPMODE(uiInfo.opMode);
5677  007f c60008        	ld	a,_uiInfo+7
5678  0082 97            	ld	xl,a
5679  0083 a60c          	ld	a,#12
5680  0085 95            	ld	xh,a
5681  0086 cd0000        	call	_file_write
5683                     ; 1315 			FW_POTYPE(uiInfo.poType);
5685  0089 c60010        	ld	a,_uiInfo+15
5686  008c 97            	ld	xl,a
5687  008d a612          	ld	a,#18
5688  008f 95            	ld	xh,a
5689  0090 cd0000        	call	_file_write
5691                     ; 1316 			FW_HOUSECAPA(uiInfo.houseCapa);
5693  0093 c60011        	ld	a,_uiInfo+16
5694  0096 97            	ld	xl,a
5695  0097 a613          	ld	a,#19
5696  0099 95            	ld	xh,a
5697  009a cd0000        	call	_file_write
5699                     ; 1317 			FW_LPM(uiInfo.lpmType);
5701  009d c60014        	ld	a,_uiInfo+19
5702  00a0 97            	ld	xl,a
5703  00a1 a628          	ld	a,#40
5704  00a3 95            	ld	xh,a
5705  00a4 cd0000        	call	_file_write
5707                     ; 1318 			FW_TEMPOFFSET(uiInfo.tempOffset);
5709  00a7 c60013        	ld	a,_uiInfo+18
5710  00aa 97            	ld	xl,a
5711  00ab a627          	ld	a,#39
5712  00ad 95            	ld	xh,a
5713  00ae cd0000        	call	_file_write
5715                     ; 1320 			FW_VALVE_INFOS
5717  00b1 c60016        	ld	a,_uiInfo+21
5718  00b4 97            	ld	xl,a
5719  00b5 a615          	ld	a,#21
5720  00b7 95            	ld	xh,a
5721  00b8 cd0000        	call	_file_write
5725  00bb c60017        	ld	a,_uiInfo+22
5726  00be 97            	ld	xl,a
5727  00bf a616          	ld	a,#22
5728  00c1 95            	ld	xh,a
5729  00c2 cd0000        	call	_file_write
5733  00c5 c60018        	ld	a,_uiInfo+23
5734  00c8 97            	ld	xl,a
5735  00c9 a617          	ld	a,#23
5736  00cb 95            	ld	xh,a
5737  00cc cd0000        	call	_file_write
5741  00cf c60019        	ld	a,_uiInfo+24
5742  00d2 97            	ld	xl,a
5743  00d3 a618          	ld	a,#24
5744  00d5 95            	ld	xh,a
5745  00d6 cd0000        	call	_file_write
5749  00d9 c6001a        	ld	a,_uiInfo+25
5750  00dc 97            	ld	xl,a
5751  00dd a619          	ld	a,#25
5752  00df 95            	ld	xh,a
5753  00e0 cd0000        	call	_file_write
5757  00e3 c6001b        	ld	a,_uiInfo+26
5758  00e6 97            	ld	xl,a
5759  00e7 a61a          	ld	a,#26
5760  00e9 95            	ld	xh,a
5761  00ea cd0000        	call	_file_write
5765  00ed c6001c        	ld	a,_uiInfo+27
5766  00f0 97            	ld	xl,a
5767  00f1 a61b          	ld	a,#27
5768  00f3 95            	ld	xh,a
5769  00f4 cd0000        	call	_file_write
5773  00f7 c6001d        	ld	a,_uiInfo+28
5774  00fa 97            	ld	xl,a
5775  00fb a61c          	ld	a,#28
5776  00fd 95            	ld	xh,a
5777  00fe cd0000        	call	_file_write
5781  0101 c60026        	ld	a,_uiInfo+37
5782  0104 97            	ld	xl,a
5783  0105 a62e          	ld	a,#46
5784  0107 95            	ld	xh,a
5785  0108 cd0000        	call	_file_write
5789  010b c60027        	ld	a,_uiInfo+38
5790  010e 97            	ld	xl,a
5791  010f a62f          	ld	a,#47
5792  0111 95            	ld	xh,a
5793  0112 cd0000        	call	_file_write
5797  0115 c60028        	ld	a,_uiInfo+39
5798  0118 97            	ld	xl,a
5799  0119 a630          	ld	a,#48
5800  011b 95            	ld	xh,a
5801  011c cd0000        	call	_file_write
5805  011f c60029        	ld	a,_uiInfo+40
5806  0122 97            	ld	xl,a
5807  0123 a631          	ld	a,#49
5808  0125 95            	ld	xh,a
5809  0126 cd0000        	call	_file_write
5813  0129 c6002a        	ld	a,_uiInfo+41
5814  012c 97            	ld	xl,a
5815  012d a632          	ld	a,#50
5816  012f 95            	ld	xh,a
5817  0130 cd0000        	call	_file_write
5821  0133 c6002b        	ld	a,_uiInfo+42
5822  0136 97            	ld	xl,a
5823  0137 a633          	ld	a,#51
5824  0139 95            	ld	xh,a
5825  013a cd0000        	call	_file_write
5829  013d c6002c        	ld	a,_uiInfo+43
5830  0140 97            	ld	xl,a
5831  0141 a634          	ld	a,#52
5832  0143 95            	ld	xh,a
5833  0144 cd0000        	call	_file_write
5837  0147 c6002d        	ld	a,_uiInfo+44
5838  014a 97            	ld	xl,a
5839  014b a635          	ld	a,#53
5840  014d 95            	ld	xh,a
5841  014e cd0000        	call	_file_write
5843                     ; 1321 			FW_VALVE_RCINFOS
5845  0151 c6001e        	ld	a,_uiInfo+29
5846  0154 97            	ld	xl,a
5847  0155 a61d          	ld	a,#29
5848  0157 95            	ld	xh,a
5849  0158 cd0000        	call	_file_write
5853  015b c6001f        	ld	a,_uiInfo+30
5854  015e 97            	ld	xl,a
5855  015f a61e          	ld	a,#30
5856  0161 95            	ld	xh,a
5857  0162 cd0000        	call	_file_write
5861  0165 c60020        	ld	a,_uiInfo+31
5862  0168 97            	ld	xl,a
5863  0169 a61f          	ld	a,#31
5864  016b 95            	ld	xh,a
5865  016c cd0000        	call	_file_write
5869  016f c60021        	ld	a,_uiInfo+32
5870  0172 97            	ld	xl,a
5871  0173 a620          	ld	a,#32
5872  0175 95            	ld	xh,a
5873  0176 cd0000        	call	_file_write
5877  0179 c60022        	ld	a,_uiInfo+33
5878  017c 97            	ld	xl,a
5879  017d a621          	ld	a,#33
5880  017f 95            	ld	xh,a
5881  0180 cd0000        	call	_file_write
5885  0183 c60023        	ld	a,_uiInfo+34
5886  0186 97            	ld	xl,a
5887  0187 a622          	ld	a,#34
5888  0189 95            	ld	xh,a
5889  018a cd0000        	call	_file_write
5893  018d c60024        	ld	a,_uiInfo+35
5894  0190 97            	ld	xl,a
5895  0191 a623          	ld	a,#35
5896  0193 95            	ld	xh,a
5897  0194 cd0000        	call	_file_write
5901  0197 c60025        	ld	a,_uiInfo+36
5902  019a 97            	ld	xl,a
5903  019b a624          	ld	a,#36
5904  019d 95            	ld	xh,a
5905  019e cd0000        	call	_file_write
5909  01a1 c6002e        	ld	a,_uiInfo+45
5910  01a4 97            	ld	xl,a
5911  01a5 a636          	ld	a,#54
5912  01a7 95            	ld	xh,a
5913  01a8 cd0000        	call	_file_write
5917  01ab c6002f        	ld	a,_uiInfo+46
5918  01ae 97            	ld	xl,a
5919  01af a637          	ld	a,#55
5920  01b1 95            	ld	xh,a
5921  01b2 cd0000        	call	_file_write
5925  01b5 c60030        	ld	a,_uiInfo+47
5926  01b8 97            	ld	xl,a
5927  01b9 a638          	ld	a,#56
5928  01bb 95            	ld	xh,a
5929  01bc cd0000        	call	_file_write
5933  01bf c60031        	ld	a,_uiInfo+48
5934  01c2 97            	ld	xl,a
5935  01c3 a639          	ld	a,#57
5936  01c5 95            	ld	xh,a
5937  01c6 cd0000        	call	_file_write
5941  01c9 c60032        	ld	a,_uiInfo+49
5942  01cc 97            	ld	xl,a
5943  01cd a63a          	ld	a,#58
5944  01cf 95            	ld	xh,a
5945  01d0 cd0000        	call	_file_write
5949  01d3 c60033        	ld	a,_uiInfo+50
5950  01d6 97            	ld	xl,a
5951  01d7 a63b          	ld	a,#59
5952  01d9 95            	ld	xh,a
5953  01da cd0000        	call	_file_write
5957  01dd c60034        	ld	a,_uiInfo+51
5958  01e0 97            	ld	xl,a
5959  01e1 a63c          	ld	a,#60
5960  01e3 95            	ld	xh,a
5961  01e4 cd0000        	call	_file_write
5965  01e7 c60035        	ld	a,_uiInfo+52
5966  01ea 97            	ld	xl,a
5967  01eb a63d          	ld	a,#61
5968  01ed 95            	ld	xh,a
5969  01ee cd0000        	call	_file_write
5972  01f1 2004          	jra	L7461
5973  01f3               L5461:
5974                     ; 1325 			__func_rc_timerout = 4;
5976  01f3 3504001a      	mov	___func_rc_timerout,#4
5977  01f7               L7461:
5978                     ; 1328 		__func_rc_timerout1 = 0;
5980  01f7 725f001b      	clr	___func_rc_timerout1
5981                     ; 1329 		__func_rc_timerout2 = __timer1s;
5983  01fb 550000001c    	mov	___func_rc_timerout2,___timer1s
5984                     ; 1330 		STATUS_NEXT(next);	
5986  0200 7b02          	ld	a,(OFST+2,sp)
5987  0202 c70014        	ld	__ds,a
5990  0205 725f0015      	clr	__dsCount
5993  0209 35ff0016      	mov	__dsPrev,#255
5995  020d               L3461:
5996                     ; 1333 	return 0;
5998  020d 4f            	clr	a
6001  020e 85            	popw	x
6002  020f 81            	ret	
6062                     ; 1337 void	disp_status_exit(uint8_t key, uint8_t next)
6062                     ; 1338 {
6063                     .text:	section	.text,new
6064  0000               _disp_status_exit:
6066  0000 89            	pushw	x
6067       00000001      OFST:	set	1
6070                     ; 1341 	_backup_backlight = 0;
6072  0001 725f0009      	clr	__backup_backlight
6073  0005 88            	push	a
6074                     ; 1342 	if( (_t20ms%10) != 0 )
6076  0006 c60000        	ld	a,__t20ms
6077  0009 5f            	clrw	x
6078  000a 97            	ld	xl,a
6079  000b a60a          	ld	a,#10
6080  000d cd0000        	call	c_smodx
6082  0010 5d            	tnzw	x
6083  0011 2706          	jreq	L1761
6084                     ; 1344 		_dsPrev = 0;
6086  0013 725f0016      	clr	__dsPrev
6087                     ; 1345 		return;
6089  0017 2005          	jra	L6221
6090  0019               L1761:
6091                     ; 1348 	if( _dsPrev != 0 )
6093  0019 c60016        	ld	a,__dsPrev
6094  001c 2703          	jreq	L3761
6095                     ; 1349 		return;
6096  001e               L6221:
6099  001e 5b03          	addw	sp,#3
6100  0020 81            	ret	
6101  0021               L3761:
6102                     ; 1352 	_dsCount++;
6104  0021 725c0015      	inc	__dsCount
6105                     ; 1353 	_dsPrev = 1;
6107  0025 35010016      	mov	__dsPrev,#1
6108                     ; 1354 	lcd_clear(0);
6110  0029 cd0000        	call	_lcd_clear
6112                     ; 1355 	for( i=0; i<4; i++ )
6114  002c 0f01          	clr	(OFST+0,sp)
6115  002e               L5761:
6116                     ; 1356 		lcd_disp_n(i, _dsCount%10);
6118  002e c60015        	ld	a,__dsCount
6119  0031 5f            	clrw	x
6120  0032 97            	ld	xl,a
6121  0033 a60a          	ld	a,#10
6122  0035 62            	div	x,a
6123  0036 97            	ld	xl,a
6124  0037 7b01          	ld	a,(OFST+0,sp)
6125  0039 95            	ld	xh,a
6126  003a cd0000        	call	_lcd_disp_n
6128                     ; 1355 	for( i=0; i<4; i++ )
6130  003d 0c01          	inc	(OFST+0,sp)
6133  003f 7b01          	ld	a,(OFST+0,sp)
6134  0041 a104          	cp	a,#4
6135  0043 25e9          	jrult	L5761
6136                     ; 1358 	if( __func_rc_settingCb == 1 && _dsCount >= 10 )
6138  0045 c60000        	ld	a,___func_rc_settingCb
6139  0048 4a            	dec	a
6140  0049 2607          	jrne	L3071
6142  004b c60015        	ld	a,__dsCount
6143  004e a10a          	cp	a,#10
6144                     ; 1360 		STATUS_NEXT(next);
6147                     ; 1361 		return;
6150  0050 242f          	jruge	L3171
6151  0052               L3071:
6152                     ; 1363 	if( __timer1s != __func_rc_timerout2 )
6154  0052 c60000        	ld	a,___timer1s
6155  0055 c1001c        	cp	a,___func_rc_timerout2
6156  0058 2736          	jreq	L5071
6157                     ; 1365 		if( __func_rc_timerout1 == 0 )
6159  005a c6001b        	ld	a,___func_rc_timerout1
6160  005d 26bf          	jrne	L6221
6161                     ; 1367 			__func_rc_timerout2 = __timer1s;
6163  005f 550000001c    	mov	___func_rc_timerout2,___timer1s
6164                     ; 1368 			__func_rc_timerout1 = 1;
6166  0064 3501001b      	mov	___func_rc_timerout1,#1
6167                     ; 1369 			__func_rc_timerout--;
6169  0068 725a001a      	dec	___func_rc_timerout
6170                     ; 1370 			if( __func_rc_timerout == 0 )
6172  006c 26b0          	jrne	L6221
6173                     ; 1372 				if( uiInfo.mode == 1 )
6175  006e c60009        	ld	a,_uiInfo+8
6176  0071 4a            	dec	a
6177  0072 260d          	jrne	L3171
6178                     ; 1376 					ui_error = 19;
6180  0074 35130000      	mov	_ui_error,#19
6181                     ; 1377 					_ds = 97;
6183  0078 35610014      	mov	__ds,#97
6184                     ; 1378 					_dsCount = 0;
6186  007c c70015        	ld	__dsCount,a
6188  007f 209d          	jra	L6221
6189  0081               L3171:
6190                     ; 1382 					STATUS_NEXT(next);
6197  0081 7b03          	ld	a,(OFST+2,sp)
6198  0083 c70014        	ld	__ds,a
6200  0086 725f0015      	clr	__dsCount
6202  008a 35ff0016      	mov	__dsPrev,#255
6204  008e 208e          	jra	L6221
6205  0090               L5071:
6206                     ; 1388 		__func_rc_timerout1 = 0;
6208  0090 725f001b      	clr	___func_rc_timerout1
6209                     ; 1389 }
6211  0094 2088          	jra	L6221
6214                     	switch	.data
6215  001d               __tim1min:
6216  001d 00            	dc.b	0
6217  001e               __tim30min:
6218  001e 00            	dc.b	0
6219  001f               __timFlag:
6220  001f 00            	dc.b	0
6244                     ; 1395 void	timerClear(void)
6244                     ; 1396 {
6245                     .text:	section	.text,new
6246  0000               _timerClear:
6250                     ; 1397 	_tim1min = 0;
6252  0000 725f001d      	clr	__tim1min
6253                     ; 1398 	_tim30min = 0;
6255  0004 725f001e      	clr	__tim30min
6256                     ; 1399 	_timFlag = 0;
6258  0008 725f001f      	clr	__timFlag
6259                     ; 1400 }
6262  000c 81            	ret	
6301                     ; 1402 void	disp_status_loop_message(uint8_t i)
6301                     ; 1403 {
6302                     .text:	section	.text,new
6303  0000               _disp_status_loop_message:
6305  0000 88            	push	a
6306       00000000      OFST:	set	0
6309                     ; 1404 	lcd_clear_btn();
6311  0001 cd0000        	call	_lcd_clear_btn
6313                     ; 1405 	if( i == 0 )		/*	(0)난방*/	
6315  0004 7b01          	ld	a,(OFST+1,sp)
6316  0006 2633          	jrne	L5471
6317                     ; 1407 		_disp_mode = 0x01;	
6319  0008 35010000      	mov	__disp_mode,#1
6320                     ; 1408 		LCD_BIT_SET(bT1);	//	현재온도
6322  000c cd00c6        	call	LC036
6323  000f cd00c0        	call	LC035
6324  0012 ca0000        	or	a,_bLF_DEF
6325  0015 d7540c        	ld	(21516,x),a
6326                     ; 1410 		LCD_BIT_SET(bT4);	//	설정온도
6328  0018 c6000f        	ld	a,_iLF_DEF+15
6329  001b cd00c0        	call	LC035
6330  001e ca000f        	or	a,_bLF_DEF+15
6331  0021 d7540c        	ld	(21516,x),a
6332                     ; 1411 		LCD_BIT_SET(bT5);	//	도
6334  0024 c6000d        	ld	a,_iLF_DEF+13
6335  0027 cd00c0        	call	LC035
6336  002a ca000d        	or	a,_bLF_DEF+13
6337  002d d7540c        	ld	(21516,x),a
6338                     ; 1412 		LCD_BIT_SET(bT6);	//	난방	
6340  0030 c60006        	ld	a,_iLF_DEF+6
6341  0033 cd00c0        	call	LC035
6342  0036 ca0006        	or	a,_bLF_DEF+6
6344  0039 2078          	jp	LC032
6345  003b               L5471:
6346                     ; 1414 	else if( i == 1 )	/*	(1)예약*/	
6348  003b a101          	cp	a,#1
6349  003d 2605          	jrne	L1571
6350                     ; 1416 		_disp_mode = 0x08;	
6352  003f cd00d8        	call	LC037
6353                     ; 1419 		LCD_BIT_SET(bT14);	//	예약
6354  0042 206f          	jp	LC032
6355  0044               L1571:
6356                     ; 1421 	else if( i == 2 )	/*	(2)반복*/	
6358  0044 a102          	cp	a,#2
6359                     ; 1423 		_disp_mode = 0x10;	
6360                     ; 1426 		LCD_BIT_SET(bT18);	//	타이머	
6362  0046 275c          	jreq	LC033
6363                     ; 1437 	else if( i == 8 )		/*	(1)외출*/	
6365  0048 a108          	cp	a,#8
6366  004a 2618          	jrne	L1671
6367                     ; 1439 		_disp_mode = 0x02;	
6369                     ; 1440 		LCD_BIT_SET(bT1);	//	현재온도
6371                     ; 1441 		LCD_BIT_SET(bT3);	//	도
6373                     ; 1442 		LCD_BIT_SET(bT7);	//	외출
6375  004c               LC034:
6377  004c 35020000      	mov	__disp_mode,#2
6379  0050 ad74          	call	LC036
6380  0052 ad6c          	call	LC035
6381  0054 ca0000        	or	a,_bLF_DEF
6382  0057 d7540c        	ld	(21516,x),a
6384  005a c60019        	ld	a,_iLF_DEF+25
6385  005d ad61          	call	LC035
6386  005f ca0019        	or	a,_bLF_DEF+25
6388  0062 204f          	jp	LC032
6389  0064               L1671:
6390                     ; 1450 	else if( i == 17 )		/*	(1)외출 LONG */	
6392  0064 a111          	cp	a,#17
6393  0066 2606          	jrne	L5671
6394                     ; 1452 		_disp_mode = 0x02;
6396  0068 35020000      	mov	__disp_mode,#2
6398  006c 2048          	jra	L7471
6399  006e               L5671:
6400                     ; 1460 	else if( i == 5 )	
6402  006e a105          	cp	a,#5
6403  0070 2606          	jrne	L1771
6404                     ; 1462 		_disp_mode = 0x04;	
6406  0072 35040000      	mov	__disp_mode,#4
6408  0076 203e          	jra	L7471
6409  0078               L1771:
6410                     ; 1465 	else if( i == 151 )		//	OUT
6412  0078 a197          	cp	a,#151
6413                     ; 1467 		_disp_mode = 0x02;	
6414                     ; 1468 		LCD_BIT_SET(bT1);	//	현재온도
6415                     ; 1469 		LCD_BIT_SET(bT3);	//	도
6416                     ; 1472 		LCD_BIT_SET(bT7);	//	외출
6418  007a 27d0          	jreq	LC034
6419                     ; 1474 	else if( i == 152 )		//	온수
6421  007c a198          	cp	a,#152
6422  007e 260a          	jrne	L1002
6423                     ; 1476 		LCD_BIT_SET(bT29);	//	
6425  0080 c60045        	ld	a,_iLF_DEF+69
6426  0083 ad3b          	call	LC035
6427  0085 ca0045        	or	a,_bLF_DEF+69
6429  0088 2029          	jp	LC032
6430  008a               L1002:
6431                     ; 1478 	else if( i == 153 )		//	난수
6433  008a a199          	cp	a,#153
6434  008c 260a          	jrne	L5002
6435                     ; 1480 		LCD_BIT_SET(bT22);	//	
6437  008e c60043        	ld	a,_iLF_DEF+67
6438  0091 ad2d          	call	LC035
6439  0093 ca0043        	or	a,_bLF_DEF+67
6441  0096 201b          	jp	LC032
6442  0098               L5002:
6443                     ; 1482 	else if( i == 154 )		//	예약
6445  0098 a19a          	cp	a,#154
6446  009a 2604          	jrne	L1102
6447                     ; 1484 		_disp_mode = 0x08;
6449  009c ad3a          	call	LC037
6450                     ; 1485 		LCD_BIT_SET(bT14);	//	예약
6451  009e 2013          	jp	LC032
6452  00a0               L1102:
6453                     ; 1487 	else if( i == 155 )		//	타이머
6455  00a0 a19b          	cp	a,#155
6456  00a2 2612          	jrne	L7471
6457                     ; 1489 		_disp_mode = 0x10;
6459                     ; 1490 		LCD_BIT_SET(bT18);	//	타이머	
6461  00a4               LC033:
6463  00a4 35100000      	mov	__disp_mode,#16
6465  00a8 5f            	clrw	x
6466  00a9 c60042        	ld	a,_iLF_DEF+66
6467  00ac 97            	ld	xl,a
6468  00ad d6540c        	ld	a,(21516,x)
6469  00b0 ca0042        	or	a,_bLF_DEF+66
6470  00b3               LC032:
6471  00b3 d7540c        	ld	(21516,x),a
6472  00b6               L7471:
6473                     ; 1493 	_disp_mode2 = _disp_mode;
6475  00b6 5500000000    	mov	__disp_mode2,__disp_mode
6476                     ; 1494 	timerClear();
6478  00bb cd0000        	call	_timerClear
6480                     ; 1495 }
6483  00be 84            	pop	a
6484  00bf 81            	ret	
6485  00c0               LC035:
6486  00c0 5f            	clrw	x
6487  00c1 97            	ld	xl,a
6488  00c2 d6540c        	ld	a,(21516,x)
6489  00c5 81            	ret	
6490  00c6               LC036:
6491  00c6 5f            	clrw	x
6492  00c7 c60004        	ld	a,_iLF_DEF+4
6493  00ca 97            	ld	xl,a
6494  00cb d6540c        	ld	a,(21516,x)
6495  00ce ca0004        	or	a,_bLF_DEF+4
6496  00d1 d7540c        	ld	(21516,x),a
6498  00d4 c60000        	ld	a,_iLF_DEF
6499  00d7 81            	ret	
6500  00d8               LC037:
6501  00d8 35080000      	mov	__disp_mode,#8
6502                     ; 1419 		LCD_BIT_SET(bT14);	//	예약
6504  00dc 5f            	clrw	x
6505  00dd c60041        	ld	a,_iLF_DEF+65
6506  00e0 97            	ld	xl,a
6507  00e1 d6540c        	ld	a,(21516,x)
6508  00e4 ca0041        	or	a,_bLF_DEF+65
6509  00e7 81            	ret	
6556                     ; 1500 void	disp_status_loop_init(void)
6556                     ; 1501 {
6557                     .text:	section	.text,new
6558  0000               _disp_status_loop_init:
6560  0000 88            	push	a
6561       00000001      OFST:	set	1
6564                     ; 1504 	i = 0;
6566                     ; 1505 	if (_disp_mode == 0xff) {
6568                     ; 1506 		i = 1;
6570                     ; 1510 	lcd_clear(0);
6572  0001 4f            	clr	a
6573  0002 cd0000        	call	_lcd_clear
6575                     ; 1511 	lcd_blink_clear();
6577  0005 cd0000        	call	_lcd_blink_clear
6579                     ; 1512 	_dsPrev = 0xff;
6581  0008 35ff0016      	mov	__dsPrev,#255
6582                     ; 1513 	if( uiInfo._temp[0] == 0x80 )
6584  000c c60061        	ld	a,_uiInfo+96
6585  000f a180          	cp	a,#128
6586  0011 2605          	jrne	L5302
6587                     ; 1514 		uiInfo.tSetup = uiInfo._temp[1];
6589  0013 550062000f    	mov	_uiInfo+14,_uiInfo+97
6590  0018               L5302:
6591                     ; 1515 	uiInfo._temp[0] = 0;
6593  0018 725f0061      	clr	_uiInfo+96
6594                     ; 1525 	if( __sUp == 5 )		//	Off
6596  001c c60001        	ld	a,___sUp
6597  001f a105          	cp	a,#5
6598  0021 2744          	jreq	L3602
6600                     ; 1547 	else if( __sUp == 0 )
6602  0023 c60001        	ld	a,___sUp
6603  0026 2613          	jrne	L3402
6604                     ; 1549 		__ui_disp_temp_c(3);
6606  0028 a603          	ld	a,#3
6607  002a cd0000        	call	___ui_disp_temp_c
6609                     ; 1550 		ui_disp_temp_curr(uiInfo.tCurr);
6611  002d c60003        	ld	a,_uiInfo+2
6612  0030 cd0000        	call	_ui_disp_temp_curr
6614                     ; 1551 		ui_disp_temp_setup(uiInfo.tSetup);
6616  0033 c6000f        	ld	a,_uiInfo+14
6617  0036 cd0000        	call	_ui_disp_temp_setup
6620  0039 202c          	jra	L3602
6621  003b               L3402:
6622                     ; 1553 	else if( __sUp == 1 )	//	Y
6624  003b a101          	cp	a,#1
6625  003d 2728          	jreq	L3602
6627                     ; 1556 	else if( __sUp == 2 )	//	B
6629  003f a102          	cp	a,#2
6630  0041 2724          	jreq	L3602
6632                     ; 1559 	else if( __sUp == 8 )	//	Out
6634  0043 a108          	cp	a,#8
6635  0045 2616          	jrne	L7502
6636                     ; 1561 		__ui_disp_temp_c(1);
6638  0047 ad26          	call	LC039
6639                     ; 1567 		UPDATE_BIT(BIT_TSETUP);
6641  0049 72140006      	bset	__updateBit,#2
6644  004d 5500000005    	mov	__updateTimer,___timer1s
6647  0052 35050007      	mov	__updateCount,#5
6648                     ; 1568 		uiInfo._temp[3] = uiInfo.tSetup;
6651  0056 55000f0064    	mov	_uiInfo+99,_uiInfo+14
6652                     ; 1569 		uiInfo.tSetup = 20;
6654  005b 2006          	jp	LC038
6655  005d               L7502:
6656                     ; 1577 	}else if( __sUp == 17 )	//	Out long
6658  005d a111          	cp	a,#17
6659  005f 2606          	jrne	L3602
6660                     ; 1579 		__ui_disp_temp_c(1);
6662  0061 ad0c          	call	LC039
6663                     ; 1582 		uiInfo.tSetup = 20;
6665  0063               LC038:
6667  0063 3514000f      	mov	_uiInfo+14,#20
6669  0067               L3602:
6670                     ; 1584 	else if( __sUp == 151 )	//	OUT
6673                     ; 1590 	disp_status_loop_message(__sUp);
6675  0067 c60001        	ld	a,___sUp
6676  006a cd0000        	call	_disp_status_loop_message
6678                     ; 1591 }
6681  006d 84            	pop	a
6682  006e 81            	ret	
6683  006f               LC039:
6684  006f a601          	ld	a,#1
6685  0071 cd0000        	call	___ui_disp_temp_c
6687                     ; 1562 		uiInfo._temp[0] = 0x80;
6689  0074 35800061      	mov	_uiInfo+96,#128
6690                     ; 1563 		uiInfo._temp[1] = uiInfo.tSetup;
6692  0078 55000f0062    	mov	_uiInfo+97,_uiInfo+14
6693  007d 81            	ret	
6720                     ; 1593 void	disp_status_curr_only(void)
6720                     ; 1594 {
6721                     .text:	section	.text,new
6722  0000               _disp_status_curr_only:
6726                     ; 1595 	ui_disp_clear_tSetup(0);
6728  0000 4f            	clr	a
6729  0001 cd0000        	call	_ui_disp_clear_tSetup
6731                     ; 1596 	ui_disp_temp_curr(uiInfo.tCurr);
6733  0004 c60003        	ld	a,_uiInfo+2
6735                     ; 1597 }
6738  0007 cc0000        	jp	_ui_disp_temp_curr
6780                     ; 1599 void	disp_status_error(uint8_t key, uint8_t next)
6780                     ; 1600 {
6781                     .text:	section	.text,new
6782  0000               _disp_status_error:
6784  0000 89            	pushw	x
6785       00000000      OFST:	set	0
6788                     ; 1602 	if( error_display_status == 1 )
6790  0001 c6000d        	ld	a,_error_display_status
6791  0004 4a            	dec	a
6792  0005 260f          	jrne	L3212
6793                     ; 1604 		lcd_clear(0);
6795  0007 cd0000        	call	_lcd_clear
6797                     ; 1605 		lcd_disp_err(ui_error);
6799  000a c60000        	ld	a,_ui_error
6800  000d cd0000        	call	_lcd_disp_err
6802                     ; 1606 		error_display_status = 2;
6804  0010 3502000d      	mov	_error_display_status,#2
6806  0014 2005          	jra	L5212
6807  0016               L3212:
6808                     ; 1610 		if( uiInfo.enc != 0 )
6810  0016 c60001        	ld	a,_uiInfo
6811  0019 2605          	jrne	L3012
6812                     ; 1612 			goto Exit;
6814  001b               L5212:
6815                     ; 1618 	if( key == 1 )
6817  001b 7b01          	ld	a,(OFST+1,sp)
6818  001d 4a            	dec	a
6819  001e 260a          	jrne	L1312
6820  0020               L3012:
6821                     ; 1623 Exit:		
6821                     ; 1624 		if( uiInfo.mode == 1 )
6823  0020 c60009        	ld	a,_uiInfo+8
6824  0023 4a            	dec	a
6825  0024 2604          	jrne	L1312
6826                     ; 1627 			func_rc_recover(1);
6828  0026 4c            	inc	a
6829  0027 cd0000        	call	_func_rc_recover
6831  002a               L1312:
6832                     ; 1634 	if( error == 0 && error_type == 0 )
6834  002a c60000        	ld	a,_error
6835  002d 260e          	jrne	L5312
6837  002f c60000        	ld	a,_error_type
6838  0032 2609          	jrne	L5312
6839  0034 c60000        	ld	a,_ui_error
6840  0037 200f          	jra	L5012
6841  0039               L7312:
6842                     ; 1644 		error_display_mode = 0;
6844  0039 725f000c      	clr	_error_display_mode
6845  003d               L5312:
6846                     ; 1647 	if( ui_error == 0 && ui_error_type == 0 )
6848  003d c60000        	ld	a,_ui_error
6849  0040 2611          	jrne	L1412
6851  0042 725d0000      	tnz	_ui_error_type
6852  0046 260b          	jrne	L1412
6853                     ; 1649 		goto RESET_ENTRY;
6854  0048               L5012:
6855                     ; 1636 RESET_ENTRY:			
6855                     ; 1637 		/*
6855                     ; 1638 			reset mode
6855                     ; 1639 		 */
6855                     ; 1640 		if (ui_error == 30 && ui_error_type == ERROR_TYPE_CNT) {
6857  0048 a11e          	cp	a,#30
6858  004a 26ed          	jrne	L7312
6860  004c c60000        	ld	a,_ui_error_type
6861  004f a102          	cp	a,#2
6862  0051 26e6          	jrne	L7312
6863                     ; 1641 			return;
6865  0053               L1412:
6866                     ; 1651 }
6869  0053 85            	popw	x
6870  0054 81            	ret	
6931                     ; 1655 void	disp_status_command(uint8_t key)
6931                     ; 1656 {
6932                     .text:	section	.text,new
6933  0000               _disp_status_command:
6935  0000 88            	push	a
6936  0001 88            	push	a
6937       00000001      OFST:	set	1
6940                     ; 1658 	if( _dsCount == 0 )
6942  0002 c60015        	ld	a,__dsCount
6943  0005 263a          	jrne	L3412
6944                     ; 1660 		disp_next();
6946  0007 cd0000        	call	_disp_next
6948                     ; 1662 		LCD_BIT_SET(b1A);
6950  000a c60005        	ld	a,_iLF_DEF+5
6951  000d cd0160        	call	LC045
6952  0010 ca0005        	or	a,_bLF_DEF+5
6953  0013 d7540c        	ld	(21516,x),a
6954                     ; 1663 		LCD_BIT_SET(b1F);
6956  0016 c60018        	ld	a,_iLF_DEF+24
6957  0019 cd0160        	call	LC045
6958  001c ca0018        	or	a,_bLF_DEF+24
6959  001f d7540c        	ld	(21516,x),a
6960                     ; 1664 		LCD_BIT_SET(b1E);
6962  0022 c6002b        	ld	a,_iLF_DEF+43
6963  0025 cd0160        	call	LC045
6964  0028 ca002b        	or	a,_bLF_DEF+43
6965  002b d7540c        	ld	(21516,x),a
6966                     ; 1665 		LCD_BIT_SET(b1D);
6968  002e c6003e        	ld	a,_iLF_DEF+62
6969  0031 cd0160        	call	LC045
6970  0034 ca003e        	or	a,_bLF_DEF+62
6971  0037 d7540c        	ld	(21516,x),a
6972                     ; 1666 		uiInfo._t = 0;
6974  003a 725f0060      	clr	_uiInfo+95
6976  003e cc00d2        	jra	L7022
6977  0041               L3412:
6978                     ; 1670 EncEntry:		
6978                     ; 1671 		i = uiInfo._t;
6980  0041 c60060        	ld	a,_uiInfo+95
6981  0044 6b01          	ld	(OFST+0,sp),a
6982                     ; 1672 		if( uiInfo.enc != 0 )
6984  0046 c60001        	ld	a,_uiInfo
6985  0049 271d          	jreq	L1122
6986                     ; 1674 			if( (uiInfo.enc & 0x40) == 0 )
6988  004b a540          	bcp	a,#64
6989  004d 2609          	jrne	L3122
6990                     ; 1675 				i = (i+_LC-1)%_LC;
6992  004f 7b01          	ld	a,(OFST+0,sp)
6993  0051 5f            	clrw	x
6994  0052 97            	ld	xl,a
6995  0053 1c0009        	addw	x,#9
6998  0056 2005          	jra	L5122
6999  0058               L3122:
7000                     ; 1677 				i = (i+1)%_LC;
7002  0058 7b01          	ld	a,(OFST+0,sp)
7003  005a 5f            	clrw	x
7004  005b 97            	ld	xl,a
7005  005c 5c            	incw	x
7007  005d               L5122:
7008  005d a60a          	ld	a,#10
7009  005f cd0000        	call	c_smodx
7010  0062 01            	rrwa	x,a
7011  0063 6b01          	ld	(OFST+0,sp),a
7012                     ; 1678 			uiInfo._t = i;
7014  0065 c70060        	ld	_uiInfo+95,a
7015  0068               L1122:
7016                     ; 1680 		if( _dsPrev != i )
7018  0068 c60016        	ld	a,__dsPrev
7019  006b 1101          	cp	a,(OFST+0,sp)
7020  006d 2763          	jreq	L7022
7021                     ; 1682 			_dsPrev = i;
7023  006f 7b01          	ld	a,(OFST+0,sp)
7024  0071 c70016        	ld	__dsPrev,a
7025                     ; 1683 			clear_npos2();
7027  0074 cd0000        	call	_clear_npos2
7029                     ; 1684 			if( i==0 )		lcd_disp_setup_cntl_tab();
7031  0077 7b01          	ld	a,(OFST+0,sp)
7032  0079 2605          	jrne	L1222
7035  007b cd0000        	call	_lcd_disp_setup_cntl_tab
7038  007e 2052          	jra	L7022
7039  0080               L1222:
7040                     ; 1685 			else if( i==1 )	lcd_disp_setup_cntl_2motor();
7042  0080 a101          	cp	a,#1
7043  0082 2605          	jrne	L5222
7046  0084 cd0000        	call	_lcd_disp_setup_cntl_2motor
7049  0087 2049          	jra	L7022
7050  0089               L5222:
7051                     ; 1686 			else if( i==2 )	lcd_disp_setup_cntl_on();
7053  0089 a102          	cp	a,#2
7054  008b 2605          	jrne	L1322
7057  008d cd0000        	call	_lcd_disp_setup_cntl_on
7060  0090 2040          	jra	L7022
7061  0092               L1322:
7062                     ; 1687 			else if( i==3 )	lcd_disp_setup_cntl_po();
7064  0092 a103          	cp	a,#3
7065  0094 2605          	jrne	L5322
7068  0096 cd0000        	call	_lcd_disp_setup_cntl_po
7071  0099 2037          	jra	L7022
7072  009b               L5322:
7073                     ; 1688 			else if( i==4 )	lcd_disp_mir1();
7075  009b a104          	cp	a,#4
7076  009d 2605          	jrne	L1422
7079  009f cd0000        	call	_lcd_disp_mir1
7082  00a2 202e          	jra	L7022
7083  00a4               L1422:
7084                     ; 1689 			else if( i==5 )	lcd_disp_mir2();
7086  00a4 a105          	cp	a,#5
7087  00a6 2605          	jrne	L5422
7090  00a8 cd0000        	call	_lcd_disp_mir2
7093  00ab 2025          	jra	L7022
7094  00ad               L5422:
7095                     ; 1690 			else if( i==6 )	lcd_disp_freset();
7097  00ad a106          	cp	a,#6
7098  00af 2605          	jrne	L1522
7101  00b1 cd0000        	call	_lcd_disp_freset
7104  00b4 201c          	jra	L7022
7105  00b6               L1522:
7106                     ; 1691 			else if( i==7 )	lcd_disp_cnt_host();
7108  00b6 a107          	cp	a,#7
7109  00b8 2605          	jrne	L5522
7112  00ba cd0000        	call	_lcd_disp_cnt_host
7115  00bd 2013          	jra	L7022
7116  00bf               L5522:
7117                     ; 1692 			else if( i==8 )	lcd_disp_cnt_sub();
7119  00bf a108          	cp	a,#8
7120  00c1 2605          	jrne	L1622
7123  00c3 cd0000        	call	_lcd_disp_cnt_sub
7126  00c6 200a          	jra	L7022
7127  00c8               L1622:
7128                     ; 1693 			else if( i==9 )	lcd_disp_n(3, 0);
7130  00c8 a109          	cp	a,#9
7131  00ca 2606          	jrne	L7022
7134  00cc ae0300        	ldw	x,#768
7135  00cf cd0000        	call	_lcd_disp_n
7137  00d2               L7022:
7138                     ; 1696 	if( key == 0x10 )		__UP
7140  00d2 7b02          	ld	a,(OFST+1,sp)
7141  00d4 a110          	cp	a,#16
7142  00d6 2606          	jrne	L7622
7145  00d8 35010001      	mov	_uiInfo,#1
7149  00dc 2008          	jp	LC040
7150  00de               L7622:
7151                     ; 1697 	else if( key == 0x20 )	__DN
7153  00de a120          	cp	a,#32
7154  00e0 2609          	jrne	L3722
7157  00e2 35400001      	mov	_uiInfo,#64
7160  00e6               LC040:
7162  00e6 0f02          	clr	(OFST+1,sp)
7165  00e8 cc0041        	jra	L3412
7166  00eb               L3722:
7167                     ; 1698 	else if( key == 4 )		
7169  00eb a104          	cp	a,#4
7170  00ed 2661          	jrne	L7722
7171                     ; 1700 		switch( uiInfo._t )
7173  00ef c60060        	ld	a,_uiInfo+95
7175                     ; 1736 			break;
7176  00f2 271b          	jreq	L5412
7177  00f4 4a            	dec	a
7178  00f5 271e          	jreq	L7412
7179  00f7 4a            	dec	a
7180  00f8 2721          	jreq	L1512
7181  00fa 4a            	dec	a
7182  00fb 2723          	jreq	L3512
7183  00fd a002          	sub	a,#2
7184  00ff 2725          	jreq	L5512
7185  0101 4a            	dec	a
7186  0102 2728          	jreq	L7512
7187  0104 4a            	dec	a
7188  0105 272d          	jreq	L1612
7189  0107 4a            	dec	a
7190  0108 272f          	jreq	L3612
7191  010a 4a            	dec	a
7192  010b 273d          	jreq	L5612
7193  010d 204f          	jra	L1722
7194  010f               L5412:
7195                     ; 1702 		case 0:
7195                     ; 1703 			uiInfoSet.opMode = 3;	
7197  010f 35030072      	mov	_uiInfoSet+4,#3
7198                     ; 1704 			disp_status_run(3, 35, 0);
7200                     ; 1705 			break;
7202  0113 202a          	jp	LC043
7203  0115               L7412:
7204                     ; 1706 		case 1:	
7204                     ; 1707 			uiInfoSet.opMode = 2;	
7206  0115 35020072      	mov	_uiInfoSet+4,#2
7207                     ; 1708 			disp_status_run(3, 35, 0);
7209                     ; 1709 			break;
7211  0119 2024          	jp	LC043
7212  011b               L1512:
7213                     ; 1710 		case 2:	
7213                     ; 1711 			uiInfoSet.opMode = 0;	
7215  011b c70072        	ld	_uiInfoSet+4,a
7216                     ; 1712 			disp_status_run(3, 35, 0);
7218                     ; 1713 			break;
7220  011e 201f          	jp	LC043
7221  0120               L3512:
7222                     ; 1714 		case 3:	
7222                     ; 1715 			uiInfoSet.opMode = 1;	
7224  0120 35010072      	mov	_uiInfoSet+4,#1
7225                     ; 1716 			disp_status_run(3, 35, 0);
7227                     ; 1717 			break;
7229  0124 2019          	jp	LC043
7230  0126               L5512:
7231                     ; 1719 			STATUS_NEXT(95);
7233  0126 355f0014      	mov	__ds,#95
7236                     ; 1720 			break;
7239  012a 202b          	jp	LC041
7240  012c               L7512:
7241                     ; 1721 		case 6:	
7241                     ; 1722 			func_rc_command(COMMAND_MODE_FACTORY, 100);	
7243  012c ae0864        	ldw	x,#2148
7244  012f cd0000        	call	_func_rc_command
7246                     ; 1723 			break;
7248  0132 202a          	jra	L1722
7249  0134               L1612:
7250                     ; 1724 		case 7:	
7250                     ; 1725 			//	MAIN
7250                     ; 1726 			func_rc_command(COMMAND_MODE_FACTORY, 110);	
7252  0134 ae086e        	ldw	x,#2158
7254                     ; 1727 			disp_status_run(3, 35, 0);
7256                     ; 1728 			break;
7258  0137 2003          	jp	LC044
7259  0139               L3612:
7260                     ; 1729 		case 8:	
7260                     ; 1730 			//	SUB
7260                     ; 1731 			func_rc_command(COMMAND_MODE_FACTORY, 120);	
7262  0139 ae0878        	ldw	x,#2168
7263  013c               LC044:
7264  013c cd0000        	call	_func_rc_command
7266                     ; 1732 			disp_status_run(3, 35, 0);
7269  013f               LC043:
7275  013f 4b00          	push	#0
7276  0141 ae0323        	ldw	x,#803
7277  0144 cd0000        	call	_disp_status_run
7278  0147 84            	pop	a
7279                     ; 1733 			break;
7281  0148 2014          	jra	L1722
7282  014a               L5612:
7283                     ; 1735 			STATUS_NEXT(100);
7285  014a 35640014      	mov	__ds,#100
7289                     ; 1736 			break;
7292  014e 2007          	jp	LC041
7294  0150               L7722:
7295                     ; 1739 	else if( key == 1 )
7297  0150 4a            	dec	a
7298  0151 260b          	jrne	L1722
7299                     ; 1741 		STATUS_NEXT(99);
7301  0153 35630014      	mov	__ds,#99
7306  0157               LC041:
7308  0157 c70015        	ld	__dsCount,a
7311  015a 35ff0016      	mov	__dsPrev,#255
7313  015e               L1722:
7314                     ; 1743 }
7317  015e 85            	popw	x
7318  015f 81            	ret	
7319  0160               LC045:
7320  0160 5f            	clrw	x
7321  0161 97            	ld	xl,a
7322  0162 d6540c        	ld	a,(21516,x)
7323  0165 81            	ret	
7326                     	switch	.data
7327  0020               __d485_id:
7328  0020 00            	dc.b	0
7365                     ; 1762 void	disp_write_file(uint8_t next)
7365                     ; 1763 {
7366                     .text:	section	.text,new
7367  0000               _disp_write_file:
7369  0000 88            	push	a
7370       00000000      OFST:	set	0
7373                     ; 1766 	file_update();
7375  0001 cd0000        	call	_file_update
7377                     ; 1767 	__func_rc_timerout = 5;
7379  0004 3505001a      	mov	___func_rc_timerout,#5
7380                     ; 1768 	__func_rc_timerout1 = 0;
7382  0008 725f001b      	clr	___func_rc_timerout1
7383                     ; 1769 	__func_rc_timerout2 = __timer1s;
7385  000c 550000001c    	mov	___func_rc_timerout2,___timer1s
7386                     ; 1770 	func_rc_setting();
7388  0011 cd0000        	call	_func_rc_setting
7390                     ; 1771 	_ds = next;
7392  0014 7b01          	ld	a,(OFST+1,sp)
7393  0016 c70014        	ld	__ds,a
7394                     ; 1772 }
7397  0019 84            	pop	a
7398  001a 81            	ret	
7434                     ; 1774 void	disp_set_state(uint8_t next)
7434                     ; 1775 {
7435                     .text:	section	.text,new
7436  0000               _disp_set_state:
7438  0000 88            	push	a
7439       00000000      OFST:	set	0
7442                     ; 1776 	lcd_blink_clear();
7444  0001 cd0000        	call	_lcd_blink_clear
7446                     ; 1777 	STATUS_NEXT(next);
7448  0004 7b01          	ld	a,(OFST+1,sp)
7449  0006 c70014        	ld	__ds,a
7452  0009 725f0015      	clr	__dsCount
7455  000d 35ff0016      	mov	__dsPrev,#255
7456                     ; 1778 }
7460  0011 84            	pop	a
7461  0012 81            	ret	
7494                     ; 1780 void _disp_485(uint8_t i) {
7495                     .text:	section	.text,new
7496  0000               __disp_485:
7498  0000 88            	push	a
7499       00000000      OFST:	set	0
7502                     ; 1781 	lcd_disp_n(1, i >> 4);
7504  0001 4e            	swap	a
7505  0002 a40f          	and	a,#15
7506  0004 97            	ld	xl,a
7507  0005 a601          	ld	a,#1
7508  0007 95            	ld	xh,a
7509  0008 cd0000        	call	_lcd_disp_n
7511                     ; 1782 	lcd_disp_n(2, (i & 0x0F)/10);
7513  000b 7b01          	ld	a,(OFST+1,sp)
7514  000d a40f          	and	a,#15
7515  000f 5f            	clrw	x
7516  0010 97            	ld	xl,a
7517  0011 a60a          	ld	a,#10
7518  0013 62            	div	x,a
7519  0014 a602          	ld	a,#2
7520  0016 95            	ld	xh,a
7521  0017 cd0000        	call	_lcd_disp_n
7523                     ; 1783 	lcd_disp_n(3, (i & 0x0F)%10);
7525  001a 7b01          	ld	a,(OFST+1,sp)
7526  001c a40f          	and	a,#15
7527  001e 5f            	clrw	x
7528  001f 97            	ld	xl,a
7529  0020 a60a          	ld	a,#10
7530  0022 62            	div	x,a
7531  0023 97            	ld	xl,a
7532  0024 a603          	ld	a,#3
7533  0026 95            	ld	xh,a
7534  0027 cd0000        	call	_lcd_disp_n
7536                     ; 1784 }
7539  002a 84            	pop	a
7540  002b 81            	ret	
7582                     ; 1786 void	disp_485(uint8_t next)
7582                     ; 1787 {
7583                     .text:	section	.text,new
7584  0000               _disp_485:
7588                     ; 1788 	if( _dsCount == 0 )
7590  0000 c60015        	ld	a,__dsCount
7591  0003 2609          	jrne	L3732
7592                     ; 1790 		_dsCount = 1;
7594  0005 35010015      	mov	__dsCount,#1
7595                     ; 1791 		lcd_clear(0);
7597  0009 cd0000        	call	_lcd_clear
7599                     ; 1792 		goto DispEntry;
7601  000c 2018          	jra	L5532
7602  000e               L3732:
7603                     ; 1796 		if( (_t20ms%100) != 0 )
7605  000e c60000        	ld	a,__t20ms
7606  0011 5f            	clrw	x
7607  0012 97            	ld	xl,a
7608  0013 a664          	ld	a,#100
7609  0015 cd0000        	call	c_smodx
7611  0018 5d            	tnzw	x
7612  0019 2705          	jreq	L7732
7613                     ; 1798 			_dsPrev = 0;
7615  001b 725f0016      	clr	__dsPrev
7616                     ; 1799 			return;
7619  001f 81            	ret	
7620  0020               L7732:
7621                     ; 1802 		if( _dsPrev != 0 )
7623  0020 c60016        	ld	a,__dsPrev
7624  0023 2701          	jreq	L5532
7625                     ; 1803 			return;
7628  0025 81            	ret	
7629  0026               L5532:
7630                     ; 1804 DispEntry:			
7630                     ; 1805 		_dsPrev = 1;
7632  0026 35010016      	mov	__dsPrev,#1
7633                     ; 1806 		LCD_BIT_SET(b1F);
7635  002a 5f            	clrw	x
7636  002b c60018        	ld	a,_iLF_DEF+24
7637  002e 97            	ld	xl,a
7638  002f d6540c        	ld	a,(21516,x)
7639  0032 ca0018        	or	a,_bLF_DEF+24
7640  0035 d7540c        	ld	(21516,x),a
7641                     ; 1807 		LCD_BIT_SET(b1E);
7643  0038 c6002b        	ld	a,_iLF_DEF+43
7644  003b ad53          	call	LC046
7645  003d ca002b        	or	a,_bLF_DEF+43
7646  0040 d7540c        	ld	(21516,x),a
7647                     ; 1808 		LCD_BIT_SET(b1G);
7649  0043 c6002a        	ld	a,_iLF_DEF+42
7650  0046 ad48          	call	LC046
7651  0048 ca002a        	or	a,_bLF_DEF+42
7652  004b d7540c        	ld	(21516,x),a
7653                     ; 1809 		LCD_BIT_SET(b1C);
7655  004e c6003d        	ld	a,_iLF_DEF+61
7656  0051 ad3d          	call	LC046
7657  0053 ca003d        	or	a,_bLF_DEF+61
7658  0056 d7540c        	ld	(21516,x),a
7659                     ; 1810 		LCD_BIT_SET(b1D);
7661  0059 c6003e        	ld	a,_iLF_DEF+62
7662  005c ad32          	call	LC046
7663  005e ca003e        	or	a,_bLF_DEF+62
7664  0061 d7540c        	ld	(21516,x),a
7665                     ; 1812 		if( _d485_id == 0 )
7667  0064 c60020        	ld	a,__d485_id
7668  0067 2614          	jrne	L3042
7669                     ; 1814 			LCD_BIT_CLEAR(b1D);
7671  0069 c6003e        	ld	a,_iLF_DEF+62
7672  006c 5f            	clrw	x
7673  006d 97            	ld	xl,a
7674  006e c6003e        	ld	a,_bLF_DEF+62
7675  0071 43            	cpl	a
7676  0072 d4540c        	and	a,(21516,x)
7677  0075 d7540c        	ld	(21516,x),a
7678                     ; 1815 			_disp_485(debug_hn);
7680  0078 c60000        	ld	a,_debug_hn
7683  007b 2003          	jra	L5042
7684  007d               L3042:
7685                     ; 1819 			_disp_485(debug_br);
7687  007d c60000        	ld	a,_debug_br
7689  0080               L5042:
7690  0080 cd0000        	call	__disp_485
7691                     ; 1821 		_d485_id = _d485_id==0 ? 1 : 0;
7693  0083 c60020        	ld	a,__d485_id
7694  0086 2603          	jrne	L0141
7695  0088 4c            	inc	a
7696  0089 2001          	jra	L2141
7697  008b               L0141:
7698  008b 4f            	clr	a
7699  008c               L2141:
7700  008c c70020        	ld	__d485_id,a
7701                     ; 1823 }
7704  008f 81            	ret	
7705  0090               LC046:
7706  0090 5f            	clrw	x
7707  0091 97            	ld	xl,a
7708  0092 d6540c        	ld	a,(21516,x)
7709  0095 81            	ret	
7712                     	switch	.data
7713  0021               _error_display_refresh:
7714  0021 00            	dc.b	0
7796                     ; 1827 void	disp_statusCb(uint8_t key)
7796                     ; 1828 {
7797                     .text:	section	.text,new
7798  0000               _disp_statusCb:
7800  0000 88            	push	a
7801  0001 89            	pushw	x
7802       00000002      OFST:	set	2
7805                     ; 1831 	if( _ds == 220 || _ds == 221)
7807  0002 c60014        	ld	a,__ds
7808  0005 a1dc          	cp	a,#220
7809  0007 2739          	jreq	L7042
7811  0009 a1dd          	cp	a,#221
7812  000b 2735          	jreq	L7042
7813                     ; 1835 	if( error != 0 && error_type != 0 )
7815  000d c60000        	ld	a,_error
7816  0010 270e          	jreq	L5342
7818  0012 725d0000      	tnz	_error_type
7819  0016 2708          	jreq	L5342
7820                     ; 1837 			error_display(error_type, error);
7822  0018 97            	ld	xl,a
7823  0019 c60000        	ld	a,_error_type
7824  001c 95            	ld	xh,a
7825  001d cd0000        	call	_error_display
7827  0020               L5342:
7828                     ; 1842 	if( error_display_mode == 1 )
7830  0020 c6000c        	ld	a,_error_display_mode
7831  0023 4a            	dec	a
7832  0024 2610          	jrne	L7342
7833                     ; 1844 		disp_status_error(key, 99);
7835  0026 ae0063        	ldw	x,#99
7836  0029 7b03          	ld	a,(OFST+1,sp)
7837  002b 95            	ld	xh,a
7838  002c cd0000        	call	_disp_status_error
7840                     ; 1845 		error_display_refresh = 1;
7842  002f 35010021      	mov	_error_display_refresh,#1
7843                     ; 1848 			return;
7845  0033 cc0221        	jra	L5442
7846  0036               L7342:
7847                     ; 1851 	if( error_display_refresh == 1 )
7849  0036 c60021        	ld	a,_error_display_refresh
7850  0039 4a            	dec	a
7851  003a 2606          	jrne	L7042
7852                     ; 1853 		error_display_refresh = 0;
7854  003c c70021        	ld	_error_display_refresh,a
7855                     ; 1854 		disp_status_loop_init();
7857  003f cd0000        	call	_disp_status_loop_init
7859  0042               L7042:
7860                     ; 1857 ERROR_JUMP:
7860                     ; 1858 	if( _ds == 1 )			disp_status_id(key, 37);// disp_status_id(key, 36);
7862  0042 c60014        	ld	a,__ds
7863  0045 a101          	cp	a,#1
7864  0047 260c          	jrne	L3442
7867  0049 ae0025        	ldw	x,#37
7868  004c 7b03          	ld	a,(OFST+1,sp)
7869  004e 95            	ld	xh,a
7870  004f cd0000        	call	_disp_status_id
7873  0052 cc0221        	jra	L5442
7874  0055               L3442:
7875                     ; 1859 	else if( _ds == 36 )	disp_status_toffset(key, 37);
7877  0055 a124          	cp	a,#36
7878  0057 260c          	jrne	L7442
7881  0059 ae0025        	ldw	x,#37
7882  005c 7b03          	ld	a,(OFST+1,sp)
7883  005e 95            	ld	xh,a
7884  005f cd0000        	call	_disp_status_toffset
7887  0062 cc0221        	jra	L5442
7888  0065               L7442:
7889                     ; 1860 	else if( _ds == 37 )	
7891  0065 a125          	cp	a,#37
7892  0067 2617          	jrne	L3542
7893                     ; 1862 		t = disp_status_run(key, 38, 1);
7895  0069 4b01          	push	#1
7896  006b ae0026        	ldw	x,#38
7897  006e 7b04          	ld	a,(OFST+2,sp)
7898  0070 95            	ld	xh,a
7899  0071 cd0000        	call	_disp_status_run
7901  0074 5b01          	addw	sp,#1
7902                     ; 1863 		if( t == 1 )
7904  0076 4a            	dec	a
7905  0077 26e9          	jrne	L5442
7906                     ; 1864 			_ds = 100;
7908  0079 35640014      	mov	__ds,#100
7909  007d cc0221        	jra	L5442
7910  0080               L3542:
7911                     ; 1866 	else if( _ds == 38 )	disp_status_exit(key, 100);
7913  0080 a126          	cp	a,#38
7914  0082 260c          	jrne	L1642
7917  0084 ae0064        	ldw	x,#100
7918  0087 7b03          	ld	a,(OFST+1,sp)
7919  0089 95            	ld	xh,a
7920  008a cd0000        	call	_disp_status_exit
7923  008d cc0221        	jra	L5442
7924  0090               L1642:
7925                     ; 1868 	else if( _ds == 2 )		disp_status_id(key, 3);
7927  0090 a102          	cp	a,#2
7928  0092 260c          	jrne	L5642
7931  0094 ae0003        	ldw	x,#3
7932  0097 7b03          	ld	a,(OFST+1,sp)
7933  0099 95            	ld	xh,a
7934  009a cd0000        	call	_disp_status_id
7937  009d cc0221        	jra	L5442
7938  00a0               L5642:
7939                     ; 1869 	else if( _ds == 3 )	
7941  00a0 a103          	cp	a,#3
7942  00a2 2617          	jrne	L1742
7943                     ; 1871 		t = disp_status_run_id(key, 38, 2);
7945  00a4 4b02          	push	#2
7946  00a6 ae0026        	ldw	x,#38
7947  00a9 7b04          	ld	a,(OFST+2,sp)
7948  00ab 95            	ld	xh,a
7949  00ac cd0000        	call	_disp_status_run_id
7951  00af 5b01          	addw	sp,#1
7952                     ; 1872 		if( t == 1 )
7954  00b1 4a            	dec	a
7955  00b2 26e9          	jrne	L5442
7956                     ; 1873 			_ds = 100;
7958  00b4 35640014      	mov	__ds,#100
7959  00b8 cc0221        	jra	L5442
7960  00bb               L1742:
7961                     ; 1876 	else if( _ds == 9 )		disp_status_run_op(key, 61);
7963  00bb a109          	cp	a,#9
7964  00bd 260c          	jrne	L7742
7967  00bf ae003d        	ldw	x,#61
7968  00c2 7b03          	ld	a,(OFST+1,sp)
7969  00c4 95            	ld	xh,a
7970  00c5 cd0000        	call	_disp_status_run_op
7973  00c8 cc0221        	jra	L5442
7974  00cb               L7742:
7975                     ; 1877 	else if( _ds == 61 )	disp_status_cntl_op(key, 63);
7977  00cb a13d          	cp	a,#61
7978  00cd 260c          	jrne	L3052
7981  00cf ae003f        	ldw	x,#63
7982  00d2 7b03          	ld	a,(OFST+1,sp)
7983  00d4 95            	ld	xh,a
7984  00d5 cd0000        	call	_disp_status_cntl_op
7987  00d8 cc0221        	jra	L5442
7988  00db               L3052:
7989                     ; 1878 	else if( _ds == 63 )	disp_status_valveCount(key, 64);
7991  00db a13f          	cp	a,#63
7992  00dd 260c          	jrne	L7052
7995  00df ae0040        	ldw	x,#64
7996  00e2 7b03          	ld	a,(OFST+1,sp)
7997  00e4 95            	ld	xh,a
7998  00e5 cd0000        	call	_disp_status_valveCount
8001  00e8 cc0221        	jra	L5442
8002  00eb               L7052:
8003                     ; 1879 	else if( _ds == 64 )	disp_status_houseCapa(key, /*65*/66);	//	if opMode==0, skip
8005  00eb a140          	cp	a,#64
8006  00ed 260c          	jrne	L3152
8009  00ef ae0042        	ldw	x,#66
8010  00f2 7b03          	ld	a,(OFST+1,sp)
8011  00f4 95            	ld	xh,a
8012  00f5 cd0000        	call	_disp_status_houseCapa
8015  00f8 cc0221        	jra	L5442
8016  00fb               L3152:
8017                     ; 1882 	else if( _ds == 66 )	disp_status_lpm(key, /*67*/68);		//	세대밸브 if cntlMode==1, skip
8019  00fb a142          	cp	a,#66
8020  00fd 260c          	jrne	L7152
8023  00ff ae0044        	ldw	x,#68
8024  0102 7b03          	ld	a,(OFST+1,sp)
8025  0104 95            	ld	xh,a
8026  0105 cd0000        	call	_disp_status_lpm
8029  0108 cc0221        	jra	L5442
8030  010b               L7152:
8031                     ; 1886 	else if( _ds == 68 )	disp_status_valveinfo(key, 69, 68);
8033  010b a144          	cp	a,#68
8034  010d 260f          	jrne	L3252
8037  010f 4b44          	push	#68
8038  0111 ae0045        	ldw	x,#69
8039  0114 7b04          	ld	a,(OFST+2,sp)
8040  0116 95            	ld	xh,a
8041  0117 cd0000        	call	_disp_status_valveinfo
8043  011a 84            	pop	a
8045  011b cc0221        	jra	L5442
8046  011e               L3252:
8047                     ; 1887 	else if( _ds == 69 )	disp_status_plc(key, 70);
8049  011e a145          	cp	a,#69
8050  0120 260c          	jrne	L7252
8053  0122 ae0046        	ldw	x,#70
8054  0125 7b03          	ld	a,(OFST+1,sp)
8055  0127 95            	ld	xh,a
8056  0128 cd0000        	call	_disp_status_plc
8059  012b cc0221        	jra	L5442
8060  012e               L7252:
8061                     ; 1888 	else if( _ds == 70 )	
8063  012e a146          	cp	a,#70
8064  0130 2617          	jrne	L3352
8065                     ; 1890 		t = disp_status_run(key, 71, 9);
8067  0132 4b09          	push	#9
8068  0134 ae0047        	ldw	x,#71
8069  0137 7b04          	ld	a,(OFST+2,sp)
8070  0139 95            	ld	xh,a
8071  013a cd0000        	call	_disp_status_run
8073  013d 5b01          	addw	sp,#1
8074                     ; 1891 		if( t == 1 )
8076  013f 4a            	dec	a
8077  0140 26e9          	jrne	L5442
8078                     ; 1892 			_ds = 100;
8080  0142 35640014      	mov	__ds,#100
8081  0146 cc0221        	jra	L5442
8082  0149               L3352:
8083                     ; 1894 	else if( _ds == 71 )	disp_status_exit(key, 100);
8085  0149 a147          	cp	a,#71
8086  014b 260c          	jrne	L1452
8089  014d ae0064        	ldw	x,#100
8090  0150 7b03          	ld	a,(OFST+1,sp)
8091  0152 95            	ld	xh,a
8092  0153 cd0000        	call	_disp_status_exit
8095  0156 cc0221        	jra	L5442
8096  0159               L1452:
8097                     ; 1896 	else if( _ds == 10 )	
8099  0159 a10a          	cp	a,#10
8100  015b 2617          	jrne	L5452
8101                     ; 1898 		t = disp_status_run(key, 11, 9);
8103  015d 4b09          	push	#9
8104  015f ae000b        	ldw	x,#11
8105  0162 7b04          	ld	a,(OFST+2,sp)
8106  0164 95            	ld	xh,a
8107  0165 cd0000        	call	_disp_status_run
8109  0168 5b01          	addw	sp,#1
8110                     ; 1899 		if( t == 1 )
8112  016a 4a            	dec	a
8113  016b 26e9          	jrne	L5442
8114                     ; 1900 			_ds = 100;
8116  016d 35640014      	mov	__ds,#100
8117  0171 cc0221        	jra	L5442
8118  0174               L5452:
8119                     ; 1902 	else if( _ds == 11 )	disp_status_exit(key, 100);
8121  0174 a10b          	cp	a,#11
8122  0176 260c          	jrne	L3552
8125  0178 ae0064        	ldw	x,#100
8126  017b 7b03          	ld	a,(OFST+1,sp)
8127  017d 95            	ld	xh,a
8128  017e cd0000        	call	_disp_status_exit
8131  0181 cc0221        	jra	L5442
8132  0184               L3552:
8133                     ; 1904 	else if( _ds == 12 )	disp_status_exit(key, 100);
8135  0184 a10c          	cp	a,#12
8136  0186 260c          	jrne	L7552
8139  0188 ae0064        	ldw	x,#100
8140  018b 7b03          	ld	a,(OFST+1,sp)
8141  018d 95            	ld	xh,a
8142  018e cd0000        	call	_disp_status_exit
8145  0191 cc0221        	jra	L5442
8146  0194               L7552:
8147                     ; 1905 	else if( _ds == 15 )	
8149  0194 a10f          	cp	a,#15
8150  0196 2616          	jrne	L3652
8151                     ; 1907 		t = disp_status_run(key, 11, 20);
8153  0198 4b14          	push	#20
8154  019a ae000b        	ldw	x,#11
8155  019d 7b04          	ld	a,(OFST+2,sp)
8156  019f 95            	ld	xh,a
8157  01a0 cd0000        	call	_disp_status_run
8159  01a3 5b01          	addw	sp,#1
8160                     ; 1908 		if( t == 1 )
8162  01a5 4a            	dec	a
8163  01a6 2679          	jrne	L5442
8164                     ; 1909 			_ds = 100;
8166  01a8 35640014      	mov	__ds,#100
8167  01ac 2073          	jra	L5442
8168  01ae               L3652:
8169                     ; 1911 	else if( _ds == 33 )	disp_status_toffset(key, 34);	//	mainR/C only
8171  01ae a121          	cp	a,#33
8172  01b0 260b          	jrne	L1752
8175  01b2 ae0022        	ldw	x,#34
8176  01b5 7b03          	ld	a,(OFST+1,sp)
8177  01b7 95            	ld	xh,a
8178  01b8 cd0000        	call	_disp_status_toffset
8181  01bb 2064          	jra	L5442
8182  01bd               L1752:
8183                     ; 1912 	else if( _ds == 34 )	
8185  01bd a122          	cp	a,#34
8186  01bf 2616          	jrne	L5752
8187                     ; 1914 		t = disp_status_run(key, 35, 33);
8189  01c1 4b21          	push	#33
8190  01c3 ae0023        	ldw	x,#35
8191  01c6 7b04          	ld	a,(OFST+2,sp)
8192  01c8 95            	ld	xh,a
8193  01c9 cd0000        	call	_disp_status_run
8195  01cc 5b01          	addw	sp,#1
8196                     ; 1915 		if( t == 1 )
8198  01ce 4a            	dec	a
8199  01cf 2650          	jrne	L5442
8200                     ; 1916 			_ds = 100;
8202  01d1 35640014      	mov	__ds,#100
8203  01d5 204a          	jra	L5442
8204  01d7               L5752:
8205                     ; 1918 	else if( _ds == 35 )	disp_status_exit(key, 100);
8207  01d7 a123          	cp	a,#35
8208  01d9 260b          	jrne	L3062
8211  01db ae0064        	ldw	x,#100
8212  01de 7b03          	ld	a,(OFST+1,sp)
8213  01e0 95            	ld	xh,a
8214  01e1 cd0000        	call	_disp_status_exit
8217  01e4 203b          	jra	L5442
8218  01e6               L3062:
8219                     ; 1920 	else if( _ds == 41 )	disp_status_command(key);
8221  01e6 a129          	cp	a,#41
8222  01e8 2607          	jrne	L7062
8225  01ea 7b03          	ld	a,(OFST+1,sp)
8226  01ec cd0000        	call	_disp_status_command
8229  01ef 2030          	jra	L5442
8230  01f1               L7062:
8231                     ; 1922 	else if( _ds == 100 )	
8233  01f1 a164          	cp	a,#100
8234  01f3 2616          	jrne	L3162
8235                     ; 1924 		__s = 0;
8237  01f5 725f0000      	clr	___s
8238                     ; 1925 		_dsCount = 0;
8240  01f9 725f0015      	clr	__dsCount
8241                     ; 1926 		_ds = 99;	
8243  01fd 35630014      	mov	__ds,#99
8244                     ; 1927 		_dsPrev = 0xff;
8246  0201 35ff0016      	mov	__dsPrev,#255
8247                     ; 1928 		_remote = 0;
8249  0205 725f0000      	clr	__remote
8251  0209 2016          	jra	L5442
8252  020b               L3162:
8253                     ; 1930 	else if( _ds == 101 || _ds == 133 )
8255  020b a165          	cp	a,#101
8256  020d 2704          	jreq	L1262
8258  020f a185          	cp	a,#133
8259  0211 2611          	jrne	L7162
8260  0213               L1262:
8261                     ; 1933 		_dsCount = __timer1s;
8263  0213 5500000015    	mov	__dsCount,___timer1s
8264                     ; 1934 		_dsPrev = _ds - 100;
8266  0218 a064          	sub	a,#100
8267  021a c70016        	ld	__dsPrev,a
8268                     ; 1935 		_ds = 200;
8270  021d 35c80014      	mov	__ds,#200
8272  0221               L5442:
8273                     ; 2054 }
8276  0221 5b03          	addw	sp,#3
8277  0223 81            	ret	
8278  0224               L7162:
8279                     ; 1937 	else if (_ds == 150)							// 온도보상
8281  0224 a196          	cp	a,#150
8282  0226 260b          	jrne	L5262
8283                     ; 1939 		disp_status_toffset(key, 151);	//	mainR/C only
8285  0228 ae0097        	ldw	x,#151
8286  022b 7b03          	ld	a,(OFST+1,sp)
8287  022d 95            	ld	xh,a
8288  022e cd0000        	call	_disp_status_toffset
8291  0231 20ee          	jra	L5442
8292  0233               L5262:
8293                     ; 1941 	else if (_ds == 151)							// 백라이트
8295  0233 a197          	cp	a,#151
8296  0235 260b          	jrne	L1362
8297                     ; 1943 		disp_status_backlight2(key, 153);
8299  0237 ae0099        	ldw	x,#153
8300  023a 7b03          	ld	a,(OFST+1,sp)
8301  023c 95            	ld	xh,a
8302  023d cd0000        	call	_disp_status_backlight2
8305  0240 20df          	jra	L5442
8306  0242               L1362:
8307                     ; 1945 	else if (_ds == 152) 
8309  0242 a198          	cp	a,#152
8310  0244 2616          	jrne	L5362
8311                     ; 1947 		t = disp_status_run(key, 153, 150);
8313  0246 4b96          	push	#150
8314  0248 ae0099        	ldw	x,#153
8315  024b 7b04          	ld	a,(OFST+2,sp)
8316  024d 95            	ld	xh,a
8317  024e cd0000        	call	_disp_status_run
8319  0251 5b01          	addw	sp,#1
8320                     ; 1948 		if( t == 1 )
8322  0253 4a            	dec	a
8323  0254 26cb          	jrne	L5442
8324                     ; 1949 			_ds = 100;
8326  0256 35640014      	mov	__ds,#100
8327  025a 20c5          	jra	L5442
8328  025c               L5362:
8329                     ; 1951 	else if (_ds == 153)
8331  025c a199          	cp	a,#153
8332  025e 260a          	jrne	L3462
8333                     ; 1953 		_ds = 100;
8335  0260 35640014      	mov	__ds,#100
8336                     ; 1954 		file_update2(0);
8338  0264 4f            	clr	a
8339  0265 cd0000        	call	_file_update2
8342  0268 20b7          	jra	L5442
8343  026a               L3462:
8344                     ; 1957 	else if (_ds == 160)							// 온도보상
8346  026a a1a0          	cp	a,#160
8347  026c 260b          	jrne	L7462
8348                     ; 1959 		disp_status_toffset(key, 161);	//	mainR/C only
8350  026e ae00a1        	ldw	x,#161
8351  0271 7b03          	ld	a,(OFST+1,sp)
8352  0273 95            	ld	xh,a
8353  0274 cd0000        	call	_disp_status_toffset
8356  0277 20a8          	jra	L5442
8357  0279               L7462:
8358                     ; 1961 	else if (_ds == 161)							// 백라이트
8360  0279 a1a1          	cp	a,#161
8361  027b 260b          	jrne	L3562
8362                     ; 1963 		disp_status_backlight2(key, 162);
8364  027d ae00a2        	ldw	x,#162
8365  0280 7b03          	ld	a,(OFST+1,sp)
8366  0282 95            	ld	xh,a
8367  0283 cd0000        	call	_disp_status_backlight2
8370  0286 2099          	jra	L5442
8371  0288               L3562:
8372                     ; 1965 	else if( _ds == 162 )
8374  0288 a1a2          	cp	a,#162
8375  028a 2606          	jrne	L7562
8376                     ; 1967 		_ds = 100;
8378  028c 35640014      	mov	__ds,#100
8380  0290 208f          	jra	L5442
8381  0292               L7562:
8382                     ; 1969 	else if( _ds == 200 )
8384  0292 a1c8          	cp	a,#200
8385  0294 2618          	jrne	L3662
8386                     ; 1971 		if( _dsCount == __timer1s )
8388  0296 c60015        	ld	a,__dsCount
8389  0299 c10000        	cp	a,___timer1s
8390  029c 2783          	jreq	L5442
8391                     ; 1972 			return;
8393                     ; 1973 		STATUS_NEXT(_dsPrev);
8395  029e 5500160014    	mov	__ds,__dsPrev
8398  02a3 725f0015      	clr	__dsCount
8401  02a7 35ff0016      	mov	__dsPrev,#255
8404  02ab cc0221        	jra	L5442
8405  02ae               L3662:
8406                     ; 1977 	else if( _ds == 81 )	{	disp_write_file(12);	}
8408  02ae a151          	cp	a,#81
8409  02b0 2608          	jrne	L1762
8412  02b2 a60c          	ld	a,#12
8413  02b4 cd0000        	call	_disp_write_file
8416  02b7 cc0221        	jra	L5442
8417  02ba               L1762:
8418                     ; 1978 	else if( _ds == 95 )	{	disp_485(12);	}
8420  02ba a15f          	cp	a,#95
8421  02bc 2608          	jrne	L5762
8424  02be a60c          	ld	a,#12
8425  02c0 cd0000        	call	_disp_485
8428  02c3 cc0221        	jra	L5442
8429  02c6               L5762:
8430                     ; 1979 	else if( _ds == 96 )	{	disp_write_file(12);	}
8432  02c6 a160          	cp	a,#96
8433  02c8 2608          	jrne	L1072
8436  02ca a60c          	ld	a,#12
8437  02cc cd0000        	call	_disp_write_file
8440  02cf cc0221        	jra	L5442
8441  02d2               L1072:
8442                     ; 1980 	else if( _ds == 97 )
8444  02d2 a161          	cp	a,#97
8445  02d4 261a          	jrne	L5072
8446                     ; 1982 		disp_status_error(key, 99);
8448  02d6 ae0063        	ldw	x,#99
8449  02d9 7b03          	ld	a,(OFST+1,sp)
8450  02db 95            	ld	xh,a
8451  02dc cd0000        	call	_disp_status_error
8453                     ; 1984 			if( error == 0 && error_type == 0 )
8455  02df c60000        	ld	a,_error
8456  02e2 26eb          	jrne	L5442
8458  02e4 c60000        	ld	a,_error_type
8459  02e7 26e6          	jrne	L5442
8460                     ; 1987 				_ds = 100;
8462  02e9 35640014      	mov	__ds,#100
8463  02ed cc0221        	jra	L5442
8464  02f0               L5072:
8465                     ; 1997 	else if( _ds == 99 )
8467  02f0 a163          	cp	a,#99
8468  02f2 2676          	jrne	L3172
8469                     ; 2001 		if (key == 200) {
8471  02f4 7b03          	ld	a,(OFST+1,sp)
8472  02f6 a1c8          	cp	a,#200
8473  02f8 2604          	jrne	L5172
8474                     ; 2002 			j = 2;
8476                     ; 2003 			_disp_temp = 1;
8478  02fa 35010008      	mov	__disp_temp,#1
8479  02fe               L5172:
8480                     ; 2005 		if( key == 220 )
8482  02fe a1dc          	cp	a,#220
8483  0300 2616          	jrne	L7172
8484                     ; 2008 			uiInfo.remote_t[0] = __s;
8486  0302 5500000066    	mov	_uiInfo+101,___s
8487                     ; 2009 			uiInfo.remote_t[1] = _dsCount;
8489  0307 5500150067    	mov	_uiInfo+102,__dsCount
8490                     ; 2010 			__s = 200;
8492  030c 35c80000      	mov	___s,#200
8493                     ; 2011 			_dsCount = 0;
8495  0310 725f0015      	clr	__dsCount
8496                     ; 2012 			_disp_temp = 1;
8498  0314 35010008      	mov	__disp_temp,#1
8499  0318               L7172:
8500                     ; 2015 		t = getCurrTemp();
8502  0318 cd0000        	call	_getCurrTemp
8504  031b 6b02          	ld	(OFST+0,sp),a
8505                     ; 2016 		if( uiInfo.tOffset != 100 )
8507  031d c60012        	ld	a,_uiInfo+17
8508  0320 a164          	cp	a,#100
8509  0322 2711          	jreq	L1272
8510                     ; 2018 			if( uiInfo.tOffset > 100 )
8512  0324 a165          	cp	a,#101
8513  0326 2506          	jrult	L3272
8514                     ; 2019 				t = t + (uiInfo.tOffset-100);
8516  0328 a064          	sub	a,#100
8517  032a 1b02          	add	a,(OFST+0,sp)
8519  032c 2005          	jp	LC047
8520  032e               L3272:
8521                     ; 2021 				t = t - uiInfo.tOffset;
8523  032e 7b02          	ld	a,(OFST+0,sp)
8524  0330 c00012        	sub	a,_uiInfo+17
8525  0333               LC047:
8526  0333 6b02          	ld	(OFST+0,sp),a
8527  0335               L1272:
8528                     ; 2023 		if( uiInfo.tCurr != t )
8530  0335 c60003        	ld	a,_uiInfo+2
8531  0338 1102          	cp	a,(OFST+0,sp)
8532  033a 2715          	jreq	L7272
8533                     ; 2025 			uiInfo.tCurr = t;
8535  033c 7b02          	ld	a,(OFST+0,sp)
8536  033e c70003        	ld	_uiInfo+2,a
8537                     ; 2026 			if( _remote == 0 )
8539  0341 c60000        	ld	a,__remote
8540  0344 260b          	jrne	L7272
8541                     ; 2029 				if( _disp_temp == 1 )
8543  0346 c60008        	ld	a,__disp_temp
8544  0349 4a            	dec	a
8545  034a 2605          	jrne	L7272
8546                     ; 2030 					ui_disp_temp_curr(t);
8548  034c 7b02          	ld	a,(OFST+0,sp)
8549  034e cd0000        	call	_ui_disp_temp_curr
8551  0351               L7272:
8552                     ; 2034 		_disp_temp = 0;
8554  0351 725f0008      	clr	__disp_temp
8555                     ; 2037 		if( uiInfo.mode == 0 )	
8557  0355 c60009        	ld	a,_uiInfo+8
8558  0358 2608          	jrne	L5372
8559                     ; 2038 			disp_status_loop_client(key);
8561  035a 7b03          	ld	a,(OFST+1,sp)
8562  035c cd0000        	call	_disp_status_loop_client
8565  035f cc0221        	jra	L5442
8566  0362               L5372:
8567                     ; 2040 			disp_status_loop_host(key);
8569  0362 7b03          	ld	a,(OFST+1,sp)
8570  0364 cd0000        	call	_disp_status_loop_host
8572  0367 cc0221        	jra	L5442
8573  036a               L3172:
8574                     ; 2042 	else if( _ds == 220 )
8576  036a a1dc          	cp	a,#220
8577  036c 260c          	jrne	L3472
8578                     ; 2044 		disp_status_id(key, 221);
8580  036e ae00dd        	ldw	x,#221
8581  0371 7b03          	ld	a,(OFST+1,sp)
8582  0373 95            	ld	xh,a
8583  0374 cd0000        	call	_disp_status_id
8586  0377 cc0221        	jra	L5442
8587  037a               L3472:
8588                     ; 2046 	else if( _ds == 221 )
8590  037a a1dd          	cp	a,#221
8591  037c 26f9          	jrne	L5442
8592                     ; 2048 		FW_ID(uiInfoSet.id);
8594  037e c6006f        	ld	a,_uiInfoSet+1
8595  0381 97            	ld	xl,a
8596  0382 a60a          	ld	a,#10
8597  0384 95            	ld	xh,a
8598  0385 cd0000        	call	_file_write
8600                     ; 2049 		FW_MODE(uiInfoSet.mode);
8602  0388 c60073        	ld	a,_uiInfoSet+5
8603  038b 97            	ld	xl,a
8604  038c a609          	ld	a,#9
8605  038e 95            	ld	xh,a
8606  038f cd0000        	call	_file_write
8608                     ; 2050 		uiInfo.id = uiInfoSet.id;
8610  0392 55006f0005    	mov	_uiInfo+4,_uiInfoSet+1
8611                     ; 2051 		uiInfo.mode = uiInfoSet.mode;
8613  0397 5500730009    	mov	_uiInfo+8,_uiInfoSet+5
8614                     ; 2052 			_ds = 100;
8616  039c 35640014      	mov	__ds,#100
8617  03a0 cc0221        	jra	L5442
8661                     ; 2056 void	copy_info(uint8_t next)
8661                     ; 2057 {
8662                     .text:	section	.text,new
8663  0000               _copy_info:
8665  0000 88            	push	a
8666       00000001      OFST:	set	1
8669                     ; 2059 	disp_set_state(next);
8671  0001 cd0000        	call	_disp_set_state
8673                     ; 2060 	uiInfoSet.id = uiInfo.id;
8675  0004 550005006f    	mov	_uiInfoSet+1,_uiInfo+4
8676                     ; 2061 	uiInfoSet.cnt = uiInfo.cnt;
8678  0009 5500060070    	mov	_uiInfoSet+2,_uiInfo+5
8679                     ; 2062 	uiInfoSet.cnt_sub = uiInfo.cnt_sub;
8681  000e 5500070071    	mov	_uiInfoSet+3,_uiInfo+6
8682                     ; 2063 	uiInfoSet.opMode = uiInfo.opMode;
8684  0013 5500080072    	mov	_uiInfoSet+4,_uiInfo+7
8685                     ; 2064 	uiInfoSet.mode = uiInfo.mode;
8687  0018 5500090073    	mov	_uiInfoSet+5,_uiInfo+8
8688                     ; 2065 	uiInfoSet.controlMode = uiInfo.controlMode;
8690  001d 55000a0074    	mov	_uiInfoSet+6,_uiInfo+9
8691                     ; 2066 	uiInfoSet.valve = uiInfo.valve;
8693  0022 55000b0075    	mov	_uiInfoSet+7,_uiInfo+10
8694                     ; 2067 	uiInfoSet.valve_sub = uiInfo.valve_sub;
8696  0027 55000c0076    	mov	_uiInfoSet+8,_uiInfo+11
8697                     ; 2068 	uiInfoSet.poType = uiInfo.poType;
8699  002c 5500100077    	mov	_uiInfoSet+9,_uiInfo+15
8700                     ; 2069 	uiInfoSet.houseCapa = uiInfo.houseCapa;
8702  0031 5500110078    	mov	_uiInfoSet+10,_uiInfo+16
8703                     ; 2070 	uiInfoSet.tOffset = uiInfo.tOffset;
8705  0036 5500120079    	mov	_uiInfoSet+11,_uiInfo+17
8706                     ; 2071 	uiInfoSet.tempOffset = uiInfo.tempOffset;
8708  003b 550013007a    	mov	_uiInfoSet+12,_uiInfo+18
8709                     ; 2072 	uiInfoSet.lpmType = uiInfo.lpmType;
8711  0040 550014007b    	mov	_uiInfoSet+13,_uiInfo+19
8712                     ; 2073 	uiInfoSet.lpmType_sub = uiInfo.lpmType_sub;
8714  0045 550015007c    	mov	_uiInfoSet+14,_uiInfo+20
8715                     ; 2074 	uiInfoSet.subRCLock = uiInfo.subRCLock;
8717  004a 55005e009d    	mov	_uiInfoSet+47,_uiInfo+93
8718                     ; 2075 	uiInfoSet.cntlMode = uiInfo.cntlMode;
8720                     ; 2076 	for( i=0; i<8; i++ )
8722  004f 4f            	clr	a
8723  0050 550004006e    	mov	_uiInfoSet,_uiInfo+3
8724  0055 6b01          	ld	(OFST+0,sp),a
8725  0057               L7672:
8726                     ; 2078 		uiInfoSet.valve_len[i] = uiInfo.valve_len[i];
8728  0057 5f            	clrw	x
8729  0058 97            	ld	xl,a
8730  0059 d60016        	ld	a,(_uiInfo+21,x)
8731  005c d7007d        	ld	(_uiInfoSet+15,x),a
8732                     ; 2079 		uiInfoSet.valve_rc[i] = uiInfo.valve_rc[i];
8734  005f 5f            	clrw	x
8735  0060 7b01          	ld	a,(OFST+0,sp)
8736  0062 97            	ld	xl,a
8737  0063 d6001e        	ld	a,(_uiInfo+29,x)
8738  0066 d70085        	ld	(_uiInfoSet+23,x),a
8739                     ; 2080 		uiInfoSet.valve_sub_len[i] = uiInfo.valve_sub_len[i];
8741  0069 5f            	clrw	x
8742  006a 7b01          	ld	a,(OFST+0,sp)
8743  006c 97            	ld	xl,a
8744  006d d60026        	ld	a,(_uiInfo+37,x)
8745  0070 d7008d        	ld	(_uiInfoSet+31,x),a
8746                     ; 2081 		uiInfoSet.valve_sub_rc[i] = uiInfo.valve_sub_rc[i];
8748  0073 5f            	clrw	x
8749  0074 7b01          	ld	a,(OFST+0,sp)
8750  0076 97            	ld	xl,a
8751  0077 d6002e        	ld	a,(_uiInfo+45,x)
8752  007a d70095        	ld	(_uiInfoSet+39,x),a
8753                     ; 2076 	for( i=0; i<8; i++ )
8755  007d 0c01          	inc	(OFST+0,sp)
8758  007f 7b01          	ld	a,(OFST+0,sp)
8759  0081 a108          	cp	a,#8
8760  0083 25d2          	jrult	L7672
8761                     ; 2083 	uiInfoSet.plc = uiInfo.plc;
8763  0085 55006500a3    	mov	_uiInfoSet+53,_uiInfo+100
8764                     ; 2089 	lcd_blink_npos_clear();
8766  008a cd0000        	call	_lcd_blink_npos_clear
8768                     ; 2090 	lcd_blink_clear();
8770  008d cd0000        	call	_lcd_blink_clear
8772                     ; 2091 }
8775  0090 84            	pop	a
8776  0091 81            	ret	
8811                     ; 2095 void	copy_infoSet(void)
8811                     ; 2096 {
8812                     .text:	section	.text,new
8813  0000               _copy_infoSet:
8815       00000001      OFST:	set	1
8818                     ; 2098 	uiInfo.id = uiInfoSet.id;
8820  0000 55006f0005    	mov	_uiInfo+4,_uiInfoSet+1
8821                     ; 2099 	uiInfo.cnt = uiInfoSet.cnt;
8823  0005 5500700006    	mov	_uiInfo+5,_uiInfoSet+2
8824                     ; 2100 	uiInfo.cnt_sub = uiInfoSet.cnt_sub;
8826  000a 5500710007    	mov	_uiInfo+6,_uiInfoSet+3
8827                     ; 2101 	uiInfo.opMode = uiInfoSet.opMode;
8829  000f 5500720008    	mov	_uiInfo+7,_uiInfoSet+4
8830                     ; 2102 	uiInfo.mode = uiInfoSet.mode;
8832  0014 5500730009    	mov	_uiInfo+8,_uiInfoSet+5
8833                     ; 2103 	uiInfo.controlMode = uiInfoSet.controlMode;
8835  0019 550074000a    	mov	_uiInfo+9,_uiInfoSet+6
8836                     ; 2104 	uiInfo.valve = uiInfoSet.valve;
8838  001e 550075000b    	mov	_uiInfo+10,_uiInfoSet+7
8839                     ; 2105 	uiInfo.valve_sub = uiInfoSet.valve_sub;
8841  0023 550076000c    	mov	_uiInfo+11,_uiInfoSet+8
8842                     ; 2106 	uiInfo.poType = uiInfoSet.poType;
8844  0028 5500770010    	mov	_uiInfo+15,_uiInfoSet+9
8845                     ; 2107 	uiInfo.houseCapa = uiInfoSet.houseCapa;
8847  002d 5500780011    	mov	_uiInfo+16,_uiInfoSet+10
8848                     ; 2108 	uiInfo.tOffset = uiInfoSet.tOffset;
8850  0032 5500790012    	mov	_uiInfo+17,_uiInfoSet+11
8851                     ; 2109 	uiInfo.tempOffset = uiInfoSet.tempOffset;
8853  0037 55007a0013    	mov	_uiInfo+18,_uiInfoSet+12
8854                     ; 2110 	uiInfo.lpmType = uiInfoSet.lpmType;
8856  003c 55007b0014    	mov	_uiInfo+19,_uiInfoSet+13
8857                     ; 2111 	uiInfo.lpmType_sub = uiInfoSet.lpmType_sub;
8859  0041 55007c0015    	mov	_uiInfo+20,_uiInfoSet+14
8860                     ; 2112 	uiInfo.subRCLock = uiInfoSet.subRCLock;
8862  0046 55009d005e    	mov	_uiInfo+93,_uiInfoSet+47
8863  004b 88            	push	a
8864                     ; 2113 	uiInfo.cntlMode = uiInfoSet.cntlMode;
8866  004c 55006e0004    	mov	_uiInfo+3,_uiInfoSet
8867                     ; 2114 	for( i=0; i<8; i++ )
8869  0051 4f            	clr	a
8870  0052 6b01          	ld	(OFST+0,sp),a
8871  0054               L1103:
8872                     ; 2116 		uiInfo.valve_len[i] = uiInfoSet.valve_len[i];
8874  0054 5f            	clrw	x
8875  0055 97            	ld	xl,a
8876  0056 d6007d        	ld	a,(_uiInfoSet+15,x)
8877  0059 d70016        	ld	(_uiInfo+21,x),a
8878                     ; 2117 		uiInfo.valve_rc[i] = uiInfoSet.valve_rc[i];
8880  005c 5f            	clrw	x
8881  005d 7b01          	ld	a,(OFST+0,sp)
8882  005f 97            	ld	xl,a
8883  0060 d60085        	ld	a,(_uiInfoSet+23,x)
8884  0063 d7001e        	ld	(_uiInfo+29,x),a
8885                     ; 2118 		uiInfo.valve_sub_len[i] = uiInfoSet.valve_sub_len[i];
8887  0066 5f            	clrw	x
8888  0067 7b01          	ld	a,(OFST+0,sp)
8889  0069 97            	ld	xl,a
8890  006a d6008d        	ld	a,(_uiInfoSet+31,x)
8891  006d d70026        	ld	(_uiInfo+37,x),a
8892                     ; 2119 		uiInfo.valve_sub_rc[i] = uiInfoSet.valve_sub_rc[i];
8894  0070 5f            	clrw	x
8895  0071 7b01          	ld	a,(OFST+0,sp)
8896  0073 97            	ld	xl,a
8897  0074 d60095        	ld	a,(_uiInfoSet+39,x)
8898  0077 d7002e        	ld	(_uiInfo+45,x),a
8899                     ; 2114 	for( i=0; i<8; i++ )
8901  007a 0c01          	inc	(OFST+0,sp)
8904  007c 7b01          	ld	a,(OFST+0,sp)
8905  007e a108          	cp	a,#8
8906  0080 25d2          	jrult	L1103
8907                     ; 2121 	uiInfo.plc = uiInfoSet.plc;
8909  0082 c600a3        	ld	a,_uiInfoSet+53
8910  0085 c70065        	ld	_uiInfo+100,a
8911                     ; 2122 	if( uiInfo.plc == 0 )
8913  0088 2605          	jrne	L7103
8914                     ; 2124 		_boiler_type = 0;
8916  008a c70000        	ld	__boiler_type,a
8918  008d 2008          	jra	L1203
8919  008f               L7103:
8920                     ; 2128 		_boiler_type = 1;
8922  008f 35010000      	mov	__boiler_type,#1
8923                     ; 2129 		uiInfo.plc--;
8925  0093 725a0065      	dec	_uiInfo+100
8926  0097               L1203:
8927                     ; 2131 }
8930  0097 84            	pop	a
8931  0098 81            	ret	
8975                     ; 2136 void	disp_status(uint8_t key)
8975                     ; 2137 {
8976                     .text:	section	.text,new
8977  0000               _disp_status:
8979  0000 88            	push	a
8980       00000000      OFST:	set	0
8983                     ; 2138 	lcd_blinkCb();
8985  0001 cd0000        	call	_lcd_blinkCb
8987                     ; 2140 	disp_statusCb(key);
8989  0004 7b01          	ld	a,(OFST+1,sp)
8990  0006 cd0000        	call	_disp_statusCb
8992                     ; 2143 	uiInfo.enc = 0;
8994  0009 725f0001      	clr	_uiInfo
8995                     ; 2146 	if( _updateBit != 0 && _updateTimer != __timer1s )
8997  000d c60006        	ld	a,__updateBit
8998  0010 2772          	jreq	L5403
9000  0012 c60005        	ld	a,__updateTimer
9001  0015 c10000        	cp	a,___timer1s
9002  0018 276a          	jreq	L5403
9003                     ; 2148 		_updateTimer = __timer1s;
9005  001a 5500000005    	mov	__updateTimer,___timer1s
9006                     ; 2149 		_updateCount--;
9008  001f 725a0007      	dec	__updateCount
9009                     ; 2150 		if( _updateCount == 0 )
9011  0023 265f          	jrne	L5403
9012                     ; 2152 			if( (_updateBit&BIT_REPEAT) != 0 )	{FW_REPEAT(uiInfo.repeat);	}
9014  0025 720100060a    	btjf	__updateBit,#0,L1503
9017  002a c6000d        	ld	a,_uiInfo+12
9018  002d 97            	ld	xl,a
9019  002e a60f          	ld	a,#15
9020  0030 95            	ld	xh,a
9021  0031 cd0000        	call	_file_write
9023  0034               L1503:
9024                     ; 2153 			if( (_updateBit&BIT_RESERVE) != 0 )	{FW_RESERVE(uiInfo.reserve);}
9026  0034 720300060a    	btjf	__updateBit,#1,L3503
9029  0039 c6000e        	ld	a,_uiInfo+13
9030  003c 97            	ld	xl,a
9031  003d a610          	ld	a,#16
9032  003f 95            	ld	xh,a
9033  0040 cd0000        	call	_file_write
9035  0043               L3503:
9036                     ; 2154 			if( (_updateBit&BIT_TSETUP) != 0 )	
9038  0043 720500061c    	btjf	__updateBit,#2,L5503
9039                     ; 2157 				if( uiInfo._temp[3] != 0 )
9041  0048 c60064        	ld	a,_uiInfo+99
9042  004b 270d          	jreq	L7503
9043                     ; 2159 					FW_TSETUP(uiInfo._temp[3]);
9045  004d 97            	ld	xl,a
9046  004e a611          	ld	a,#17
9047  0050 95            	ld	xh,a
9048  0051 cd0000        	call	_file_write
9050                     ; 2160 					uiInfo._temp[3] = 0;
9052  0054 725f0064      	clr	_uiInfo+99
9054  0058 200a          	jra	L5503
9055  005a               L7503:
9056                     ; 2163 					FW_TSETUP(uiInfo.tSetup);
9058  005a c6000f        	ld	a,_uiInfo+14
9059  005d 97            	ld	xl,a
9060  005e a611          	ld	a,#17
9061  0060 95            	ld	xh,a
9062  0061 cd0000        	call	_file_write
9064  0064               L5503:
9065                     ; 2165 			if( (_updateBit&BIT_DISPMODE) != 0 ){
9067  0064 720700060a    	btjf	__updateBit,#3,L3603
9068                     ; 2166 				if (uiInfo.mode == SETTING_MODE_SUB) {
9070                     ; 2168 						FW_DISPMODE(_disp_mode);
9073                     ; 2171 					FW_DISPMODE(_disp_mode);
9076  0069 c60000        	ld	a,__disp_mode
9077  006c 97            	ld	xl,a
9078  006d a629          	ld	a,#41
9079  006f 95            	ld	xh,a
9080  0070 cd0000        	call	_file_write
9082  0073               L3603:
9083                     ; 2175 			if( (_updateBit&BIT_REPEAT) != 0 || (_updateBit&BIT_RESERVE) != 0 )	
9085  0073 7200000605    	btjt	__updateBit,#0,L3703
9087  0078 7203000603    	btjf	__updateBit,#1,L1703
9088  007d               L3703:
9089                     ; 2177 				timerEventClear();
9091  007d cd0000        	call	_timerEventClear
9093  0080               L1703:
9094                     ; 2180 			_updateBit = 0;
9096  0080 725f0006      	clr	__updateBit
9097  0084               L5403:
9098                     ; 2183 	if( key==0 )
9100  0084 7b01          	ld	a,(OFST+1,sp)
9101  0086 2602          	jrne	L5703
9102                     ; 2184 		return;
9105  0088 84            	pop	a
9106  0089 81            	ret	
9107  008a               L5703:
9108                     ; 2186 	if( _key_continue == 1 )
9110  008a c60000        	ld	a,__key_continue
9111  008d 4a            	dec	a
9112  008e 2629          	jrne	L3203
9113                     ; 2188 		if( key==2 )		
9115  0090 7b01          	ld	a,(OFST+1,sp)
9116  0092 a102          	cp	a,#2
9117  0094 2606          	jrne	L1013
9118                     ; 2190 			key++;
9120  0096 0c01          	inc	(OFST+1,sp)
9121                     ; 2191 			key--;
9123  0098 0a01          	dec	(OFST+1,sp)
9124  009a 7b01          	ld	a,(OFST+1,sp)
9125  009c               L1013:
9126                     ; 2197 		if( key==8 )	{ copy_info(150);}		
9128  009c a108          	cp	a,#8
9129  009e 2607          	jrne	L3013
9132  00a0 a696          	ld	a,#150
9133  00a2 cd0000        	call	_copy_info
9135  00a5 7b01          	ld	a,(OFST+1,sp)
9136  00a7               L3013:
9137                     ; 2199 		if( key==1 )	
9139  00a7 4a            	dec	a
9140  00a8 260b          	jrne	L5013
9141                     ; 2201 			if( uiInfo.mode == 1 )	
9143  00aa c60009        	ld	a,_uiInfo+8
9144  00ad 4a            	dec	a
9145  00ae 2605          	jrne	L5013
9146                     ; 2202 				disp_statusCb(220);
9148  00b0 a6dc          	ld	a,#220
9149  00b2 cd0000        	call	_disp_statusCb
9151  00b5               L5013:
9152                     ; 2218 		if( key==0x10 ){}		//goto SetupRc;	//}
9154                     ; 2219 		_key_continue = 0;
9156  00b5 725f0000      	clr	__key_continue
9157                     ; 2220 		goto SetupEntry;
9159  00b9               L3203:
9160                     ; 2264 SetupEntry:		
9160                     ; 2265 	if( key == 0x88 )
9162  00b9 7b01          	ld	a,(OFST+1,sp)
9163  00bb a188          	cp	a,#136
9164  00bd 261a          	jrne	L3113
9165                     ; 2267 SetupRoomCntl:		
9165                     ; 2268 		uiInfo.enc = 0;
9167  00bf 725f0001      	clr	_uiInfo
9168                     ; 2269 		if( uiInfo.mode == 0 )
9170  00c3 c60009        	ld	a,_uiInfo+8
9171  00c6 2604          	jrne	L5113
9172                     ; 2270 			uiInfo.id = 2;
9174  00c8 35020005      	mov	_uiInfo+4,#2
9175  00cc               L5113:
9176                     ; 2271 		copy_info(uiInfo.mode==0 ? 101 : 133);
9178  00cc c60009        	ld	a,_uiInfo+8
9179  00cf 2604          	jrne	L2161
9180  00d1 a665          	ld	a,#101
9181  00d3 2013          	jra	LC049
9182  00d5               L2161:
9183  00d5 a685          	ld	a,#133
9186  00d7 200f          	jp	LC049
9187  00d9               L3113:
9188                     ; 2273 	else if( key == 0x89 && uiInfo.mode == 1 )
9190  00d9 a189          	cp	a,#137
9191  00db 260e          	jrne	L7113
9193  00dd c60009        	ld	a,_uiInfo+8
9194  00e0 4a            	dec	a
9195  00e1 2608          	jrne	L7113
9196                     ; 2275 SetupCommand:		
9196                     ; 2276 		uiInfo.enc = 0;
9198  00e3 c70001        	ld	_uiInfo,a
9199                     ; 2277 		copy_info(41);
9201  00e6 a629          	ld	a,#41
9202  00e8               LC049:
9203  00e8 cd0000        	call	_copy_info
9205  00eb               L7113:
9206                     ; 2321 }
9209  00eb 84            	pop	a
9210  00ec 81            	ret	
10059                     	xref	__key_continue
10060                     	xref	_timerEventClear
10061                     	xref	__boiler_type
10062                     	xdef	_disp_statusCb
10063                     	xdef	_error_display_refresh
10064                     	xdef	_disp_485
10065                     	xdef	__disp_485
10066                     	xdef	_disp_set_state
10067                     	xdef	_disp_write_file
10068                     	xdef	__d485_id
10069                     	xref	_debug_br
10070                     	xref	_debug_hn
10071                     	xref	__remote
10072                     	xref	_getCurrTemp
10073                     	xdef	_disp_status_command
10074                     	xdef	_disp_status_error
10075                     	xdef	_timerClear
10076                     	xdef	__timFlag
10077                     	xdef	__tim30min
10078                     	xdef	__tim1min
10079                     	xdef	_disp_status_run_id
10080                     	xdef	___func_rc_timerout2
10081                     	xdef	___func_rc_timerout1
10082                     	xdef	___func_rc_timerout
10083                     	xref	___func_rc_settingCb
10084                     	xdef	_disp_status_plc
10085                     	xdef	_disp_status_valveinfo_sub
10086                     	xdef	__ui_
10087                     	xdef	___lpm
10088                     	xdef	_disp_status_houseCapa
10089                     	xdef	__backlight_get_code
10090                     	xdef	__backlight_get_index
10091                     	xdef	_disp_status_valveCount
10092                     	xdef	___bL
10093                     	xdef	_disp_next
10094                     	xdef	_file_update
10095                     	xdef	__keypwIndexClient
10096                     	xdef	__keypwIndexMaster2
10097                     	xdef	__keypwIndexMaster
10098                     	xdef	__keypwClient
10099                     	xdef	__keypwMaster2
10100                     	xdef	__keypwMaster
10101                     	switch	.bss
10102  0000               __led_key_status:
10103  0000 00            	ds.b	1
10104                     	xdef	__led_key_status
10105                     	xdef	__led_key_pin
10106                     	xdef	__led_key_port
10107                     	xdef	_error_display_status
10108                     	xdef	_error_display_mode
10109                     	xdef	_copy_info
10110                     	xdef	_copy_infoSet
10111                     	xref	__backlight
10112                     	xref	_ui_error_type
10113                     	xref	_ui_error
10114                     	xref	_error_type
10115                     	xref	_error
10116                     	xdef	_start_flag
10117                     	xdef	__backup_backlight2
10118                     	xdef	__backup_backlight
10119                     	xdef	__disp_temp
10120                     	xref	_func_rc_setting
10121                     	xref	_func_rc_recover
10122                     	xref	_func_rc_command
10123                     	xdef	_lcd_disp_rid_hw
10124                     	xref	__boiler_water_heat
10125                     	xref	__boiler_water_shower
10126                     	xdef	_file_update2
10127                     	xdef	__updateCount
10128                     	xdef	__updateBit
10129                     	xdef	__updateTimer
10130                     	xref	__disp_mode2
10131                     	xref	__disp_mode
10132                     	xdef	_disp_status_curr_only
10133                     	xdef	_disp_status_loop_init
10134                     	xdef	_disp_status_loop_message
10135                     	xdef	_disp_status_exit
10136                     	xdef	_disp_status_run
10137                     	xdef	_disp_status_valveinfo
10138                     	xdef	_disp_status_temp_offset
10139                     	xdef	_disp_status_lpm
10140                     	xdef	_disp_status_po_type
10141                     	xdef	_disp_status_cntl_op
10142                     	xdef	_disp_status_run_op
10143                     	xdef	_disp_status_backlight2
10144                     	xdef	_disp_status_toffset
10145                     	xdef	_disp_status_id
10146                     	xdef	_clear_npos2
10147                     	xdef	_clear_npos1
10148                     	xdef	__subRemote
10149                     	xdef	__dsPrev
10150                     	xdef	__dsCount
10151                     	xdef	__ds
10152                     	xdef	_ui_Open
10153                     	xref	_disp_status_loop_client
10154                     	xref	_disp_status_loop_host
10155                     	xdef	___sRoom
10156                     	xdef	___sInfo
10157                     	xdef	___sDn
10158                     	xdef	___sUp
10159                     	xdef	___s
10160                     	xref	_lcd_blink_npos
10161                     	xref	_lcd_blink_npos_clear
10162                     	xref	_ui_disp_clear_tSetup
10163                     	xref	___ui_disp_temp_c
10164                     	xref	_ui_disp_temp_curr
10165                     	xref	_ui_disp_temp_setup
10166                     	xref	_lcd_blinkCb
10167                     	xref	_lcd_blink_clear
10168                     	xdef	_disp_status
10169                     	xref	_lcd_clear_npos
10170                     	xref	_lcd_disp_rid
10171                     	xref	_lcd_disp_err
10172                     	xref	_lcd_disp_n
10173                     	xref	_lcd_clear
10174                     	xref	_lcd_disp_setup_mode_each
10175                     	xref	_lcd_disp_setup_mode_local
10176                     	xref	_lcd_disp_setup_valve
10177                     	xref	_lcd_disp_setup_id
10178                     	xref	_lcd_disp_setup_mode
10179                     	xref	_lcd_disp_setup_run
10180                     	xref	_lcd_disp_plc
10181                     	xref	_lcd_disp_cnt_sub
10182                     	xref	_lcd_disp_cnt_host
10183                     	xref	_lcd_disp_freset
10184                     	xref	_lcd_disp_mir2
10185                     	xref	_lcd_disp_mir1
10186                     	xref	_lcd_disp_setup_cntl_tab
10187                     	xref	_lcd_disp_setup_cntl_2motor
10188                     	xref	_lcd_disp_setup_cntl_po
10189                     	xref	_lcd_disp_setup_cntl_on
10190                     	xref	_lcd_disp_setup_cntl_op
10191                     	xref	_lcd_disp_setup_len
10192                     	xref	_lcd_disp_setup_lpm
10193                     	xref	_lcd_disp_backlight
10194                     	xref	_lcd_clear_btn
10195                     	xref	_iLF_DEF
10196                     	xref	_bLF_DEF
10197  0001               _uiInfo:
10198  0001 000000000000  	ds.b	109
10199                     	xdef	_uiInfo
10200  006e               _uiInfoSet:
10201  006e 000000000000  	ds.b	54
10202                     	xdef	_uiInfoSet
10203                     	xref	_file_read
10204                     	xref	_file_write
10205                     	xref	___timer1s
10206                     	xref	__t20ms
10207                     	xdef	_error_display
10208                     	xref.b	c_x
10228                     	xref	c_smodx
10229                     	end
