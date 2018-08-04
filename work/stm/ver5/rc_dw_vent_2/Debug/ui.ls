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
 100                     ; 75 void lcd_disp_rid_hw(uint8_t id, uint8_t t) 
 100                     ; 76 {
 101                     .text:	section	.text,new
 102  0000               f_lcd_disp_rid_hw:
 106                     ; 78 	_led_key_status = t==0 ? 1 : 0;
 108  0000 9f            	ld	a,xl
 109  0001 4d            	tnz	a
 110  0002 2603          	jrne	L6
 111  0004 4c            	inc	a
 112  0005 2001          	jra	L01
 113  0007               L6:
 114  0007 4f            	clr	a
 115  0008               L01:
 116  0008 c70000        	ld	__led_key_status,a
 117                     ; 80 	if( t==0 )
 119  000b 9f            	ld	a,xl
 120  000c 4d            	tnz	a
 121  000d 2605          	jrne	L72
 122                     ; 81 		D_IO_HIGH(GPIOD, GPIO_Pin_7);
 124  000f 721e500f      	bset	20495,#7
 127  0013 87            	retf	
 128  0014               L72:
 129                     ; 83 		D_IO_LOW(GPIOD, GPIO_Pin_7);
 131  0014 721f500f      	bres	20495,#7
 132                     ; 85 }
 135  0018 87            	retf	
 177                     ; 87 void	error_display(uint8_t type, uint8_t err)
 177                     ; 88 {
 178                     .text:	section	.text,new
 179  0000               f_error_display:
 181  0000 89            	pushw	x
 182       00000000      OFST:	set	0
 185                     ; 89 	if( error_display_mode == 1 )
 187  0001 c6000c        	ld	a,_error_display_mode
 188  0004 4a            	dec	a
 189  0005 2712          	jreq	L41
 190                     ; 90 		return;
 192                     ; 92 	ui_error = err;
 194  0007 7b02          	ld	a,(OFST+2,sp)
 195  0009 c70000        	ld	_ui_error,a
 196                     ; 93 	ui_error_type = type;
 198  000c 7b01          	ld	a,(OFST+1,sp)
 199  000e c70000        	ld	_ui_error_type,a
 200                     ; 95 	error_display_mode = 1;
 202  0011 3501000c      	mov	_error_display_mode,#1
 203                     ; 96 	error_display_status = 1;
 205  0015 3501000d      	mov	_error_display_status,#1
 206                     ; 97 }
 207  0019               L41:
 210  0019 85            	popw	x
 211  001a 87            	retf	
 251                     ; 99 void	ui_Open(void)
 251                     ; 100 {
 252                     .text:	section	.text,new
 253  0000               f_ui_Open:
 255  0000 88            	push	a
 256       00000001      OFST:	set	1
 259                     ; 144 	for( i=0; i<8; i++ )
 261  0001 4f            	clr	a
 262  0002 6b01          	ld	(OFST+0,sp),a
 263  0004               L76:
 264                     ; 146 		uiInfo.remote_time[i] = 4;
 266  0004 5f            	clrw	x
 267  0005 97            	ld	xl,a
 268  0006 a604          	ld	a,#4
 269  0008 d7004e        	ld	(_uiInfo+77,x),a
 270                     ; 147 		uiInfo.remote_banb[i] = 30;
 272  000b 5f            	clrw	x
 273  000c 7b01          	ld	a,(OFST+0,sp)
 274  000e 97            	ld	xl,a
 275  000f a61e          	ld	a,#30
 276  0011 d70056        	ld	(_uiInfo+85,x),a
 277                     ; 144 	for( i=0; i<8; i++ )
 279  0014 0c01          	inc	(OFST+0,sp)
 282  0016 7b01          	ld	a,(OFST+0,sp)
 283  0018 a108          	cp	a,#8
 284  001a 25e8          	jrult	L76
 285                     ; 150 	uiInfo.cntlMode = FW_GET_CNTLMODE;
 287  001c a608          	ld	a,#8
 288  001e 8d000000      	callf	f_file_read
 290  0022 c70004        	ld	_uiInfo+3,a
 291                     ; 151 	uiInfo.id = FW_GET_ID;
 293  0025 a60a          	ld	a,#10
 294  0027 8d000000      	callf	f_file_read
 296  002b c70005        	ld	_uiInfo+4,a
 297                     ; 152 	uiInfo.cnt = FW_GET_CNT;
 299  002e a60b          	ld	a,#11
 300  0030 8d000000      	callf	f_file_read
 302  0034 c70006        	ld	_uiInfo+5,a
 303                     ; 153 	uiInfo.cnt_sub = FW_GET_CNT_SUB;
 305  0037 a62b          	ld	a,#43
 306  0039 8d000000      	callf	f_file_read
 308  003d c70007        	ld	_uiInfo+6,a
 309                     ; 154 	UI_SET(uiInfo.cnt, 8)
 311  0040 c60006        	ld	a,_uiInfo+5
 312  0043 2605          	jrne	L57
 315  0045 a608          	ld	a,#8
 316  0047 c70006        	ld	_uiInfo+5,a
 317  004a               L57:
 318                     ; 155 	UI_SET(uiInfo.cnt_sub, 8)
 320  004a 725d0007      	tnz	_uiInfo+6
 321  004e 2604          	jrne	L77
 324  0050 35080007      	mov	_uiInfo+6,#8
 325  0054               L77:
 326                     ; 156 	if( uiInfo.cnt >= 8 )	uiInfo.cnt = 8;
 328  0054 a108          	cp	a,#8
 329  0056 2504          	jrult	L101
 332  0058 35080006      	mov	_uiInfo+5,#8
 333  005c               L101:
 334                     ; 157 	if( uiInfo.cnt_sub >= 8 )	uiInfo.cnt_sub = 8;
 336  005c c60007        	ld	a,_uiInfo+6
 337  005f a108          	cp	a,#8
 338  0061 2504          	jrult	L301
 341  0063 35080007      	mov	_uiInfo+6,#8
 342  0067               L301:
 343                     ; 159 	uiInfo.opMode = FW_GET_OPMODE;
 345  0067 a60c          	ld	a,#12
 346  0069 8d000000      	callf	f_file_read
 348  006d c70008        	ld	_uiInfo+7,a
 349                     ; 160 	uiInfo.mode = FW_GET_MODE;
 351  0070 a609          	ld	a,#9
 352  0072 8d000000      	callf	f_file_read
 354  0076 c70009        	ld	_uiInfo+8,a
 355                     ; 162 	uiInfo.controlMode = FW_GET_CNT_MODE;
 357  0079 a60d          	ld	a,#13
 358  007b 8d000000      	callf	f_file_read
 360  007f c7000a        	ld	_uiInfo+9,a
 361                     ; 163 	uiInfo.valve = FW_GET_VALVE;
 363  0082 a60e          	ld	a,#14
 364  0084 8d000000      	callf	f_file_read
 366  0088 c7000b        	ld	_uiInfo+10,a
 367                     ; 164 	uiInfo.valve_sub = FW_GET_VALVE_SUB;
 369  008b a62c          	ld	a,#44
 370  008d 8d000000      	callf	f_file_read
 372  0091 c7000c        	ld	_uiInfo+11,a
 373                     ; 165 	UI_SET(uiInfo.valve, 8)
 375  0094 c6000b        	ld	a,_uiInfo+10
 376  0097 2605          	jrne	L501
 379  0099 a608          	ld	a,#8
 380  009b c7000b        	ld	_uiInfo+10,a
 381  009e               L501:
 382                     ; 166 	UI_SET(uiInfo.valve_sub, 8)
 384  009e 725d000c      	tnz	_uiInfo+11
 385  00a2 2604          	jrne	L701
 388  00a4 3508000c      	mov	_uiInfo+11,#8
 389  00a8               L701:
 390                     ; 167 	if( uiInfo.valve >= 8 )	uiInfo.valve = 8;
 392  00a8 a108          	cp	a,#8
 393  00aa 2504          	jrult	L111
 396  00ac 3508000b      	mov	_uiInfo+10,#8
 397  00b0               L111:
 398                     ; 168 	if( uiInfo.valve_sub >= 8 )	uiInfo.valve_sub = 8;
 400  00b0 c6000c        	ld	a,_uiInfo+11
 401  00b3 a108          	cp	a,#8
 402  00b5 2504          	jrult	L311
 405  00b7 3508000c      	mov	_uiInfo+11,#8
 406  00bb               L311:
 407                     ; 170 	uiInfo.repeat = FW_GET_REPEAT;	
 409  00bb a60f          	ld	a,#15
 410  00bd 8d000000      	callf	f_file_read
 412  00c1 c7000d        	ld	_uiInfo+12,a
 413                     ; 174 	UI_SET(uiInfo.repeat, 10)
 415  00c4 2604          	jrne	L511
 418  00c6 350a000d      	mov	_uiInfo+12,#10
 419  00ca               L511:
 420                     ; 176 	uiInfo.reserve = FW_GET_RESERVE;	
 422  00ca a610          	ld	a,#16
 423  00cc 8d000000      	callf	f_file_read
 425  00d0 c7000e        	ld	_uiInfo+13,a
 426                     ; 177 	UI_SET(uiInfo.reserve, 24)
 428  00d3 2604          	jrne	L711
 431  00d5 3518000e      	mov	_uiInfo+13,#24
 432  00d9               L711:
 433                     ; 178 	uiInfo.tSetup = FW_GET_TSETUP;	
 435  00d9 a611          	ld	a,#17
 436  00db 8d000000      	callf	f_file_read
 438  00df c7000f        	ld	_uiInfo+14,a
 439                     ; 179 	UI_SET(uiInfo.tSetup, 50)
 441  00e2 2604          	jrne	L121
 444  00e4 3532000f      	mov	_uiInfo+14,#50
 445  00e8               L121:
 446                     ; 180 	uiInfo.poType = FW_GET_POTYPE;	
 448  00e8 a612          	ld	a,#18
 449  00ea 8d000000      	callf	f_file_read
 451  00ee c70010        	ld	_uiInfo+15,a
 452                     ; 181 	uiInfo.houseCapa = FW_GET_HOUSECAPA;
 454  00f1 a613          	ld	a,#19
 455  00f3 8d000000      	callf	f_file_read
 457  00f7 c70011        	ld	_uiInfo+16,a
 458                     ; 182 	UI_SET(uiInfo.houseCapa, 160)
 460  00fa 2604          	jrne	L321
 463  00fc 35a00011      	mov	_uiInfo+16,#160
 464  0100               L321:
 465                     ; 183 	uiInfo.tOffset = FW_GET_TOFFSET;
 467  0100 a614          	ld	a,#20
 468  0102 8d000000      	callf	f_file_read
 470  0106 c70012        	ld	_uiInfo+17,a
 471                     ; 184 	UI_SET(uiInfo.tOffset, 100);
 473  0109 2604          	jrne	L521
 476  010b 35640012      	mov	_uiInfo+17,#100
 477  010f               L521:
 478                     ; 186 	uiInfo.tempOffset = FW_GET_TEMPOFFSET;
 481  010f a627          	ld	a,#39
 482  0111 8d000000      	callf	f_file_read
 484  0115 c70013        	ld	_uiInfo+18,a
 485                     ; 187 	UI_SET(uiInfo.tempOffset, 80)
 487  0118 2604          	jrne	L721
 490  011a 35500013      	mov	_uiInfo+18,#80
 491  011e               L721:
 492                     ; 188 	uiInfo.lpmType = FW_GET_LPM;
 494  011e a628          	ld	a,#40
 495  0120 8d000000      	callf	f_file_read
 497  0124 c70014        	ld	_uiInfo+19,a
 498                     ; 189 	uiInfo.lpmType_sub = FW_GET_LPM_SUB;
 500  0127 a62d          	ld	a,#45
 501  0129 8d000000      	callf	f_file_read
 503  012d c70015        	ld	_uiInfo+20,a
 504                     ; 195 	_disp_mode2 = FW_GET_DISPMODE;
 506  0130 a629          	ld	a,#41
 507  0132 8d000000      	callf	f_file_read
 509  0136 c70000        	ld	__disp_mode2,a
 510                     ; 196 	_disp_mode = 0xff;
 512  0139 35ff0000      	mov	__disp_mode,#255
 513                     ; 198 	if (_disp_mode2 == 0x00) {
 515  013d 2606          	jrne	L131
 516                     ; 199 		__sUp = 5;
 518  013f 35050001      	mov	___sUp,#5
 520  0143 202c          	jra	L331
 521  0145               L131:
 522                     ; 200 	} else if (_disp_mode2 == RC_MODE_RESERVE){
 524  0145 a108          	cp	a,#8
 525  0147 2606          	jrne	L531
 526                     ; 201 		__sUp = 1;
 528  0149 35010001      	mov	___sUp,#1
 530  014d 2022          	jra	L331
 531  014f               L531:
 532                     ; 202 	} else if (_disp_mode2 == RC_MODE_REPEAT) {
 534  014f a110          	cp	a,#16
 535  0151 2606          	jrne	L141
 536                     ; 203 		__sUp = 2;
 538  0153 35020001      	mov	___sUp,#2
 540  0157 2018          	jra	L331
 541  0159               L141:
 542                     ; 204 	} else if (_disp_mode2 == RC_MODE_STOP) {
 544  0159 a104          	cp	a,#4
 545  015b 2606          	jrne	L541
 546                     ; 205 		__sUp = 5;
 548  015d 35050001      	mov	___sUp,#5
 550  0161 200e          	jra	L331
 551  0163               L541:
 552                     ; 206 	} else if (_disp_mode2 == RC_MODE_OUT) {
 554  0163 a102          	cp	a,#2
 555  0165 2606          	jrne	L151
 556                     ; 207 		__sUp = 16;
 558  0167 35100001      	mov	___sUp,#16
 560  016b 2004          	jra	L331
 561  016d               L151:
 562                     ; 209 		__sUp = 0;
 564  016d 725f0001      	clr	___sUp
 565  0171               L331:
 566                     ; 212 	uiInfo.valve_len[0] = FW_GET_VL_1;
 568  0171 a615          	ld	a,#21
 569  0173 8d000000      	callf	f_file_read
 571  0177 c70016        	ld	_uiInfo+21,a
 572                     ; 213 	uiInfo.valve_len[1] = FW_GET_VL_2;
 574  017a a616          	ld	a,#22
 575  017c 8d000000      	callf	f_file_read
 577  0180 c70017        	ld	_uiInfo+22,a
 578                     ; 214 	uiInfo.valve_len[2] = FW_GET_VL_3;
 580  0183 a617          	ld	a,#23
 581  0185 8d000000      	callf	f_file_read
 583  0189 c70018        	ld	_uiInfo+23,a
 584                     ; 215 	uiInfo.valve_len[3] = FW_GET_VL_4;
 586  018c a618          	ld	a,#24
 587  018e 8d000000      	callf	f_file_read
 589  0192 c70019        	ld	_uiInfo+24,a
 590                     ; 216 	uiInfo.valve_len[4] = FW_GET_VL_5;
 592  0195 a619          	ld	a,#25
 593  0197 8d000000      	callf	f_file_read
 595  019b c7001a        	ld	_uiInfo+25,a
 596                     ; 217 	uiInfo.valve_len[5] = FW_GET_VL_6;
 598  019e a61a          	ld	a,#26
 599  01a0 8d000000      	callf	f_file_read
 601  01a4 c7001b        	ld	_uiInfo+26,a
 602                     ; 218 	uiInfo.valve_len[6] = FW_GET_VL_7;
 604  01a7 a61b          	ld	a,#27
 605  01a9 8d000000      	callf	f_file_read
 607  01ad c7001c        	ld	_uiInfo+27,a
 608                     ; 219 	uiInfo.valve_len[7] = FW_GET_VL_8;
 610  01b0 a61c          	ld	a,#28
 611  01b2 8d000000      	callf	f_file_read
 613  01b6 c7001d        	ld	_uiInfo+28,a
 614                     ; 221 	uiInfo.valve_rc[0] = FW_GET_VRC_1;
 616  01b9 a61d          	ld	a,#29
 617  01bb 8d000000      	callf	f_file_read
 619  01bf c7001e        	ld	_uiInfo+29,a
 620                     ; 222 	uiInfo.valve_rc[1] = FW_GET_VRC_2;
 622  01c2 a61e          	ld	a,#30
 623  01c4 8d000000      	callf	f_file_read
 625  01c8 c7001f        	ld	_uiInfo+30,a
 626                     ; 223 	uiInfo.valve_rc[2] = FW_GET_VRC_3;
 628  01cb a61f          	ld	a,#31
 629  01cd 8d000000      	callf	f_file_read
 631  01d1 c70020        	ld	_uiInfo+31,a
 632                     ; 224 	uiInfo.valve_rc[3] = FW_GET_VRC_4;
 634  01d4 a620          	ld	a,#32
 635  01d6 8d000000      	callf	f_file_read
 637  01da c70021        	ld	_uiInfo+32,a
 638                     ; 225 	uiInfo.valve_rc[4] = FW_GET_VRC_5;
 640  01dd a621          	ld	a,#33
 641  01df 8d000000      	callf	f_file_read
 643  01e3 c70022        	ld	_uiInfo+33,a
 644                     ; 226 	uiInfo.valve_rc[5] = FW_GET_VRC_6;
 646  01e6 a622          	ld	a,#34
 647  01e8 8d000000      	callf	f_file_read
 649  01ec c70023        	ld	_uiInfo+34,a
 650                     ; 227 	uiInfo.valve_rc[6] = FW_GET_VRC_7;
 652  01ef a623          	ld	a,#35
 653  01f1 8d000000      	callf	f_file_read
 655  01f5 c70024        	ld	_uiInfo+35,a
 656                     ; 228 	uiInfo.valve_rc[7] = FW_GET_VRC_8;
 658  01f8 a624          	ld	a,#36
 659  01fa 8d000000      	callf	f_file_read
 661  01fe c70025        	ld	_uiInfo+36,a
 662                     ; 229 	uiInfo.valve_rc[0] = 1;
 664  0201 3501001e      	mov	_uiInfo+29,#1
 665                     ; 231 	uiInfo.valve_sub_len[0] = FW_GET_VL_1_SUB;
 667  0205 a62e          	ld	a,#46
 668  0207 8d000000      	callf	f_file_read
 670  020b c70026        	ld	_uiInfo+37,a
 671                     ; 232 	uiInfo.valve_sub_len[1] = FW_GET_VL_2_SUB;
 673  020e a62f          	ld	a,#47
 674  0210 8d000000      	callf	f_file_read
 676  0214 c70027        	ld	_uiInfo+38,a
 677                     ; 233 	uiInfo.valve_sub_len[2] = FW_GET_VL_3_SUB;
 679  0217 a630          	ld	a,#48
 680  0219 8d000000      	callf	f_file_read
 682  021d c70028        	ld	_uiInfo+39,a
 683                     ; 234 	uiInfo.valve_sub_len[3] = FW_GET_VL_4_SUB;
 685  0220 a631          	ld	a,#49
 686  0222 8d000000      	callf	f_file_read
 688  0226 c70029        	ld	_uiInfo+40,a
 689                     ; 235 	uiInfo.valve_sub_len[4] = FW_GET_VL_5_SUB;
 691  0229 a632          	ld	a,#50
 692  022b 8d000000      	callf	f_file_read
 694  022f c7002a        	ld	_uiInfo+41,a
 695                     ; 236 	uiInfo.valve_sub_len[5] = FW_GET_VL_6_SUB;
 697  0232 a633          	ld	a,#51
 698  0234 8d000000      	callf	f_file_read
 700  0238 c7002b        	ld	_uiInfo+42,a
 701                     ; 237 	uiInfo.valve_sub_len[6] = FW_GET_VL_7_SUB;
 703  023b a634          	ld	a,#52
 704  023d 8d000000      	callf	f_file_read
 706  0241 c7002c        	ld	_uiInfo+43,a
 707                     ; 238 	uiInfo.valve_sub_len[7] = FW_GET_VL_8_SUB;
 709  0244 a635          	ld	a,#53
 710  0246 8d000000      	callf	f_file_read
 712  024a c7002d        	ld	_uiInfo+44,a
 713                     ; 240 	uiInfo.valve_sub_rc[0] = FW_GET_VRC_1_SUB;
 715  024d a636          	ld	a,#54
 716  024f 8d000000      	callf	f_file_read
 718  0253 c7002e        	ld	_uiInfo+45,a
 719                     ; 241 	uiInfo.valve_sub_rc[1] = FW_GET_VRC_2_SUB;
 721  0256 a637          	ld	a,#55
 722  0258 8d000000      	callf	f_file_read
 724  025c c7002f        	ld	_uiInfo+46,a
 725                     ; 242 	uiInfo.valve_sub_rc[2] = FW_GET_VRC_3_SUB;
 727  025f a638          	ld	a,#56
 728  0261 8d000000      	callf	f_file_read
 730  0265 c70030        	ld	_uiInfo+47,a
 731                     ; 243 	uiInfo.valve_sub_rc[3] = FW_GET_VRC_4_SUB;
 733  0268 a639          	ld	a,#57
 734  026a 8d000000      	callf	f_file_read
 736  026e c70031        	ld	_uiInfo+48,a
 737                     ; 244 	uiInfo.valve_sub_rc[4] = FW_GET_VRC_5_SUB;
 739  0271 a63a          	ld	a,#58
 740  0273 8d000000      	callf	f_file_read
 742  0277 c70032        	ld	_uiInfo+49,a
 743                     ; 245 	uiInfo.valve_sub_rc[5] = FW_GET_VRC_6_SUB;
 745  027a a63b          	ld	a,#59
 746  027c 8d000000      	callf	f_file_read
 748  0280 c70033        	ld	_uiInfo+50,a
 749                     ; 246 	uiInfo.valve_sub_rc[6] = FW_GET_VRC_7_SUB;
 751  0283 a63c          	ld	a,#60
 752  0285 8d000000      	callf	f_file_read
 754  0289 c70034        	ld	_uiInfo+51,a
 755                     ; 247 	uiInfo.valve_sub_rc[7] = FW_GET_VRC_8_SUB;
 757  028c a63d          	ld	a,#61
 758  028e 8d000000      	callf	f_file_read
 760  0292 c70035        	ld	_uiInfo+52,a
 761                     ; 249 	_boiler_water_shower = FW_GET_B_SHOWER;
 763  0295 a625          	ld	a,#37
 764  0297 8dd102d1      	callf	LC001
 765  029b c70000        	ld	__boiler_water_shower,a
 766                     ; 251 	UI_SET(_boiler_water_shower, 50)
 768  029e 2604          	jrne	L551
 771  02a0 35320000      	mov	__boiler_water_shower,#50
 772  02a4               L551:
 773                     ; 252 	_boiler_water_heat = FW_GET_B_HEAT;
 775  02a4 a626          	ld	a,#38
 776  02a6 8dd102d1      	callf	LC001
 777  02aa c70000        	ld	__boiler_water_heat,a
 778                     ; 254 	UI_SET(_boiler_water_heat, 70)
 780  02ad 2604          	jrne	L751
 783  02af 35460000      	mov	__boiler_water_heat,#70
 784  02b3               L751:
 785                     ; 255 	_backlight = FW_GET_BACKLIGHT;
 787  02b3 a62a          	ld	a,#42
 788  02b5 8d000000      	callf	f_file_read
 790  02b9 c70000        	ld	__backlight,a
 791                     ; 259 	UI_SET(_backlight, 2)
 793  02bc 2604          	jrne	L161
 796  02be 35020000      	mov	__backlight,#2
 797  02c2               L161:
 798                     ; 261 	uiInfo.plc = FW_GET_PLC;
 800  02c2 a63e          	ld	a,#62
 801  02c4 8d000000      	callf	f_file_read
 803  02c8 c70065        	ld	_uiInfo+100,a
 804                     ; 263 	_backup_backlight = 0;
 806  02cb 725f0009      	clr	__backup_backlight
 807                     ; 264 }
 810  02cf 84            	pop	a
 811  02d0 87            	retf	
 812  02d1               LC001:
 813  02d1 8d000000      	callf	f_file_read
 815                     ; 250 	_boiler_water_shower = (_boiler_water_shower/5)*5;
 817  02d5 5f            	clrw	x
 818  02d6 97            	ld	xl,a
 819  02d7 a605          	ld	a,#5
 820  02d9 62            	div	x,a
 821  02da a605          	ld	a,#5
 822  02dc 42            	mul	x,a
 823  02dd 9f            	ld	a,xl
 824  02de 87            	retf	
 826                     .const:	section	.text
 827  0000               __keypwMaster:
 828  0000 04            	dc.b	4
 829  0001 03            	dc.b	3
 830  0002 04            	dc.b	4
 831  0003 03            	dc.b	3
 832  0004 01            	dc.b	1
 833  0005 01            	dc.b	1
 834  0006               __keypwMaster2:
 835  0006 04            	dc.b	4
 836  0007 03            	dc.b	3
 837  0008 04            	dc.b	4
 838  0009 03            	dc.b	3
 839  000a 01            	dc.b	1
 840  000b 02            	dc.b	2
 841  000c               __keypwClient:
 842  000c 04            	dc.b	4
 843  000d 03            	dc.b	3
 844  000e 04            	dc.b	4
 845  000f 03            	dc.b	3
 846  0010 01            	dc.b	1
 847  0011 03            	dc.b	3
 848                     	switch	.data
 849  0011               __keypwIndexMaster:
 850  0011 00            	dc.b	0
 851  0012               __keypwIndexMaster2:
 852  0012 00            	dc.b	0
 853  0013               __keypwIndexClient:
 854  0013 00            	dc.b	0
 887                     ; 282 void	file_update2(uint8_t i)
 887                     ; 283 {
 888                     .text:	section	.text,new
 889  0000               f_file_update2:
 891  0000 88            	push	a
 892       00000000      OFST:	set	0
 895                     ; 284 	FW_TOFFSET(uiInfo.tOffset);
 897  0001 c60012        	ld	a,_uiInfo+17
 898  0004 97            	ld	xl,a
 899  0005 a614          	ld	a,#20
 900  0007 95            	ld	xh,a
 901  0008 8d000000      	callf	f_file_write
 903                     ; 285 	if( i==0 )	FW_BACKLIGHT(_backlight);
 905  000c 7b01          	ld	a,(OFST+1,sp)
 906  000e 260b          	jrne	L771
 909  0010 c60000        	ld	a,__backlight
 910  0013 97            	ld	xl,a
 911  0014 a62a          	ld	a,#42
 912  0016 95            	ld	xh,a
 913  0017 8d000000      	callf	f_file_write
 915  001b               L771:
 916                     ; 286 }
 919  001b 84            	pop	a
 920  001c 87            	retf	
 947                     ; 324 void	file_update(void)
 947                     ; 325 {
 948                     .text:	section	.text,new
 949  0000               f_file_update:
 953                     ; 326 	FW_CNTLMODE(uiInfo.cntlMode);
 955  0000 c60004        	ld	a,_uiInfo+3
 956  0003 97            	ld	xl,a
 957  0004 a608          	ld	a,#8
 958  0006 95            	ld	xh,a
 959  0007 8d000000      	callf	f_file_write
 961                     ; 327 	FW_MODE(uiInfo.mode);
 963  000b c60009        	ld	a,_uiInfo+8
 964  000e 97            	ld	xl,a
 965  000f a609          	ld	a,#9
 966  0011 95            	ld	xh,a
 967  0012 8d000000      	callf	f_file_write
 969                     ; 328 	FW_ID(uiInfo.id);
 971  0016 c60005        	ld	a,_uiInfo+4
 972  0019 97            	ld	xl,a
 973  001a a60a          	ld	a,#10
 974  001c 95            	ld	xh,a
 975  001d 8d000000      	callf	f_file_write
 977                     ; 329 	FW_CNT(uiInfo.cnt);
 979  0021 c60006        	ld	a,_uiInfo+5
 980  0024 97            	ld	xl,a
 981  0025 a60b          	ld	a,#11
 982  0027 95            	ld	xh,a
 983  0028 8d000000      	callf	f_file_write
 985                     ; 330 	FW_CNT_SUB(uiInfo.cnt_sub);
 987  002c c60007        	ld	a,_uiInfo+6
 988  002f 97            	ld	xl,a
 989  0030 a62b          	ld	a,#43
 990  0032 95            	ld	xh,a
 991  0033 8d000000      	callf	f_file_write
 993                     ; 331 	FW_OPMODE(uiInfo.opMode);
 995  0037 c60008        	ld	a,_uiInfo+7
 996  003a 97            	ld	xl,a
 997  003b a60c          	ld	a,#12
 998  003d 95            	ld	xh,a
 999  003e 8d000000      	callf	f_file_write
1001                     ; 333 	FW_CNT_MODE(uiInfo.controlMode);
1003  0042 c6000a        	ld	a,_uiInfo+9
1004  0045 97            	ld	xl,a
1005  0046 a60d          	ld	a,#13
1006  0048 95            	ld	xh,a
1007  0049 8d000000      	callf	f_file_write
1009                     ; 334 	FW_VALVE(uiInfo.valve);
1011  004d c6000b        	ld	a,_uiInfo+10
1012  0050 97            	ld	xl,a
1013  0051 a60e          	ld	a,#14
1014  0053 95            	ld	xh,a
1015  0054 8d000000      	callf	f_file_write
1017                     ; 335 	FW_VALVE_SUB(uiInfo.valve_sub);
1019  0058 c6000c        	ld	a,_uiInfo+11
1020  005b 97            	ld	xl,a
1021  005c a62c          	ld	a,#44
1022  005e 95            	ld	xh,a
1023  005f 8d000000      	callf	f_file_write
1025                     ; 336 	FW_REPEAT(uiInfo.repeat);
1027  0063 c6000d        	ld	a,_uiInfo+12
1028  0066 97            	ld	xl,a
1029  0067 a60f          	ld	a,#15
1030  0069 95            	ld	xh,a
1031  006a 8d000000      	callf	f_file_write
1033                     ; 337 	FW_RESERVE(uiInfo.reserve);
1035  006e c6000e        	ld	a,_uiInfo+13
1036  0071 97            	ld	xl,a
1037  0072 a610          	ld	a,#16
1038  0074 95            	ld	xh,a
1039  0075 8d000000      	callf	f_file_write
1041                     ; 338 	FW_TSETUP(uiInfo.tSetup);
1043  0079 c6000f        	ld	a,_uiInfo+14
1044  007c 97            	ld	xl,a
1045  007d a611          	ld	a,#17
1046  007f 95            	ld	xh,a
1047  0080 8d000000      	callf	f_file_write
1049                     ; 340 	FW_POTYPE(uiInfo.poType);
1051  0084 c60010        	ld	a,_uiInfo+15
1052  0087 97            	ld	xl,a
1053  0088 a612          	ld	a,#18
1054  008a 95            	ld	xh,a
1055  008b 8d000000      	callf	f_file_write
1057                     ; 341 	FW_HOUSECAPA(uiInfo.houseCapa);
1059  008f c60011        	ld	a,_uiInfo+16
1060  0092 97            	ld	xl,a
1061  0093 a613          	ld	a,#19
1062  0095 95            	ld	xh,a
1063  0096 8d000000      	callf	f_file_write
1065                     ; 342 	FW_TOFFSET(uiInfo.tOffset);
1067  009a c60012        	ld	a,_uiInfo+17
1068  009d 97            	ld	xl,a
1069  009e a614          	ld	a,#20
1070  00a0 95            	ld	xh,a
1071  00a1 8d000000      	callf	f_file_write
1073                     ; 344 	FW_VALVE_INFOS
1075  00a5 c60016        	ld	a,_uiInfo+21
1076  00a8 97            	ld	xl,a
1077  00a9 a615          	ld	a,#21
1078  00ab 95            	ld	xh,a
1079  00ac 8d000000      	callf	f_file_write
1083  00b0 c60017        	ld	a,_uiInfo+22
1084  00b3 97            	ld	xl,a
1085  00b4 a616          	ld	a,#22
1086  00b6 95            	ld	xh,a
1087  00b7 8d000000      	callf	f_file_write
1091  00bb c60018        	ld	a,_uiInfo+23
1092  00be 97            	ld	xl,a
1093  00bf a617          	ld	a,#23
1094  00c1 95            	ld	xh,a
1095  00c2 8d000000      	callf	f_file_write
1099  00c6 c60019        	ld	a,_uiInfo+24
1100  00c9 97            	ld	xl,a
1101  00ca a618          	ld	a,#24
1102  00cc 95            	ld	xh,a
1103  00cd 8d000000      	callf	f_file_write
1107  00d1 c6001a        	ld	a,_uiInfo+25
1108  00d4 97            	ld	xl,a
1109  00d5 a619          	ld	a,#25
1110  00d7 95            	ld	xh,a
1111  00d8 8d000000      	callf	f_file_write
1115  00dc c6001b        	ld	a,_uiInfo+26
1116  00df 97            	ld	xl,a
1117  00e0 a61a          	ld	a,#26
1118  00e2 95            	ld	xh,a
1119  00e3 8d000000      	callf	f_file_write
1123  00e7 c6001c        	ld	a,_uiInfo+27
1124  00ea 97            	ld	xl,a
1125  00eb a61b          	ld	a,#27
1126  00ed 95            	ld	xh,a
1127  00ee 8d000000      	callf	f_file_write
1131  00f2 c6001d        	ld	a,_uiInfo+28
1132  00f5 97            	ld	xl,a
1133  00f6 a61c          	ld	a,#28
1134  00f8 95            	ld	xh,a
1135  00f9 8d000000      	callf	f_file_write
1139  00fd c60026        	ld	a,_uiInfo+37
1140  0100 97            	ld	xl,a
1141  0101 a62e          	ld	a,#46
1142  0103 95            	ld	xh,a
1143  0104 8d000000      	callf	f_file_write
1147  0108 c60027        	ld	a,_uiInfo+38
1148  010b 97            	ld	xl,a
1149  010c a62f          	ld	a,#47
1150  010e 95            	ld	xh,a
1151  010f 8d000000      	callf	f_file_write
1155  0113 c60028        	ld	a,_uiInfo+39
1156  0116 97            	ld	xl,a
1157  0117 a630          	ld	a,#48
1158  0119 95            	ld	xh,a
1159  011a 8d000000      	callf	f_file_write
1163  011e c60029        	ld	a,_uiInfo+40
1164  0121 97            	ld	xl,a
1165  0122 a631          	ld	a,#49
1166  0124 95            	ld	xh,a
1167  0125 8d000000      	callf	f_file_write
1171  0129 c6002a        	ld	a,_uiInfo+41
1172  012c 97            	ld	xl,a
1173  012d a632          	ld	a,#50
1174  012f 95            	ld	xh,a
1175  0130 8d000000      	callf	f_file_write
1179  0134 c6002b        	ld	a,_uiInfo+42
1180  0137 97            	ld	xl,a
1181  0138 a633          	ld	a,#51
1182  013a 95            	ld	xh,a
1183  013b 8d000000      	callf	f_file_write
1187  013f c6002c        	ld	a,_uiInfo+43
1188  0142 97            	ld	xl,a
1189  0143 a634          	ld	a,#52
1190  0145 95            	ld	xh,a
1191  0146 8d000000      	callf	f_file_write
1195  014a c6002d        	ld	a,_uiInfo+44
1196  014d 97            	ld	xl,a
1197  014e a635          	ld	a,#53
1198  0150 95            	ld	xh,a
1199  0151 8d000000      	callf	f_file_write
1201                     ; 345 	FW_VALVE_RCINFOS
1203  0155 c6001e        	ld	a,_uiInfo+29
1204  0158 97            	ld	xl,a
1205  0159 a61d          	ld	a,#29
1206  015b 95            	ld	xh,a
1207  015c 8d000000      	callf	f_file_write
1211  0160 c6001f        	ld	a,_uiInfo+30
1212  0163 97            	ld	xl,a
1213  0164 a61e          	ld	a,#30
1214  0166 95            	ld	xh,a
1215  0167 8d000000      	callf	f_file_write
1219  016b c60020        	ld	a,_uiInfo+31
1220  016e 97            	ld	xl,a
1221  016f a61f          	ld	a,#31
1222  0171 95            	ld	xh,a
1223  0172 8d000000      	callf	f_file_write
1227  0176 c60021        	ld	a,_uiInfo+32
1228  0179 97            	ld	xl,a
1229  017a a620          	ld	a,#32
1230  017c 95            	ld	xh,a
1231  017d 8d000000      	callf	f_file_write
1235  0181 c60022        	ld	a,_uiInfo+33
1236  0184 97            	ld	xl,a
1237  0185 a621          	ld	a,#33
1238  0187 95            	ld	xh,a
1239  0188 8d000000      	callf	f_file_write
1243  018c c60023        	ld	a,_uiInfo+34
1244  018f 97            	ld	xl,a
1245  0190 a622          	ld	a,#34
1246  0192 95            	ld	xh,a
1247  0193 8d000000      	callf	f_file_write
1251  0197 c60024        	ld	a,_uiInfo+35
1252  019a 97            	ld	xl,a
1253  019b a623          	ld	a,#35
1254  019d 95            	ld	xh,a
1255  019e 8d000000      	callf	f_file_write
1259  01a2 c60025        	ld	a,_uiInfo+36
1260  01a5 97            	ld	xl,a
1261  01a6 a624          	ld	a,#36
1262  01a8 95            	ld	xh,a
1263  01a9 8d000000      	callf	f_file_write
1267  01ad c6002e        	ld	a,_uiInfo+45
1268  01b0 97            	ld	xl,a
1269  01b1 a636          	ld	a,#54
1270  01b3 95            	ld	xh,a
1271  01b4 8d000000      	callf	f_file_write
1275  01b8 c6002f        	ld	a,_uiInfo+46
1276  01bb 97            	ld	xl,a
1277  01bc a637          	ld	a,#55
1278  01be 95            	ld	xh,a
1279  01bf 8d000000      	callf	f_file_write
1283  01c3 c60030        	ld	a,_uiInfo+47
1284  01c6 97            	ld	xl,a
1285  01c7 a638          	ld	a,#56
1286  01c9 95            	ld	xh,a
1287  01ca 8d000000      	callf	f_file_write
1291  01ce c60031        	ld	a,_uiInfo+48
1292  01d1 97            	ld	xl,a
1293  01d2 a639          	ld	a,#57
1294  01d4 95            	ld	xh,a
1295  01d5 8d000000      	callf	f_file_write
1299  01d9 c60032        	ld	a,_uiInfo+49
1300  01dc 97            	ld	xl,a
1301  01dd a63a          	ld	a,#58
1302  01df 95            	ld	xh,a
1303  01e0 8d000000      	callf	f_file_write
1307  01e4 c60033        	ld	a,_uiInfo+50
1308  01e7 97            	ld	xl,a
1309  01e8 a63b          	ld	a,#59
1310  01ea 95            	ld	xh,a
1311  01eb 8d000000      	callf	f_file_write
1315  01ef c60034        	ld	a,_uiInfo+51
1316  01f2 97            	ld	xl,a
1317  01f3 a63c          	ld	a,#60
1318  01f5 95            	ld	xh,a
1319  01f6 8d000000      	callf	f_file_write
1323  01fa c60035        	ld	a,_uiInfo+52
1324  01fd 97            	ld	xl,a
1325  01fe a63d          	ld	a,#61
1326  0200 95            	ld	xh,a
1327  0201 8d000000      	callf	f_file_write
1329                     ; 347 	FW_B_SHOWER(_boiler_water_shower);
1331  0205 c60000        	ld	a,__boiler_water_shower
1332  0208 97            	ld	xl,a
1333  0209 a625          	ld	a,#37
1334  020b 95            	ld	xh,a
1335  020c 8d000000      	callf	f_file_write
1337                     ; 348 	FW_B_HEAT(_boiler_water_heat);
1339  0210 c60000        	ld	a,__boiler_water_heat
1340  0213 97            	ld	xl,a
1341  0214 a626          	ld	a,#38
1342  0216 95            	ld	xh,a
1343  0217 8d000000      	callf	f_file_write
1345                     ; 349 	FW_TEMPOFFSET(uiInfo.tempOffset);
1347  021b c60013        	ld	a,_uiInfo+18
1348  021e 97            	ld	xl,a
1349  021f a627          	ld	a,#39
1350  0221 95            	ld	xh,a
1351  0222 8d000000      	callf	f_file_write
1353                     ; 350 	FW_LPM(uiInfo.lpmType);
1355  0226 c60014        	ld	a,_uiInfo+19
1356  0229 97            	ld	xl,a
1357  022a a628          	ld	a,#40
1358  022c 95            	ld	xh,a
1359  022d 8d000000      	callf	f_file_write
1361                     ; 351 	FW_LPM_SUB(uiInfo.lpmType_sub);
1363  0231 c60015        	ld	a,_uiInfo+20
1364  0234 97            	ld	xl,a
1365  0235 a62d          	ld	a,#45
1366  0237 95            	ld	xh,a
1367  0238 8d000000      	callf	f_file_write
1369                     ; 352 	FW_DISPMODE(_disp_mode);
1371  023c c60000        	ld	a,__disp_mode
1372  023f 97            	ld	xl,a
1373  0240 a629          	ld	a,#41
1374  0242 95            	ld	xh,a
1375  0243 8d000000      	callf	f_file_write
1377                     ; 358 	FW_PLC(uiInfo.plc);
1379  0247 c60065        	ld	a,_uiInfo+100
1380  024a 97            	ld	xl,a
1381  024b a63e          	ld	a,#62
1382  024d 95            	ld	xh,a
1383  024e 8d000000      	callf	f_file_write
1385                     ; 359 	file_write(_B+55, 0xaa);
1387  0252 ae3faa        	ldw	x,#16298
1388  0255 8d000000      	callf	f_file_write
1390                     ; 360 	file_write(_B+56, 0xbb);
1392  0259 ae40bb        	ldw	x,#16571
1394                     ; 361 }
1397  025c ac000000      	jpf	f_file_write
1399                     	switch	.data
1400  0014               __ds:
1401  0014 64            	dc.b	100
1402  0015               __dsCount:
1403  0015 00            	dc.b	0
1404  0016               __dsPrev:
1405  0016 00            	dc.b	0
1406  0017               __subRemote:
1407  0017 00            	dc.b	0
1429                     ; 370 void	clear_npos1(void)
1429                     ; 371 {
1430                     .text:	section	.text,new
1431  0000               f_clear_npos1:
1435                     ; 372 	lcd_clear_npos(0, 0);
1437  0000 5f            	clrw	x
1438  0001 8d000000      	callf	f_lcd_clear_npos
1440                     ; 373 	lcd_clear_npos(1, 0);
1442  0005 ae0100        	ldw	x,#256
1444                     ; 374 }
1447  0008 ac000000      	jpf	f_lcd_clear_npos
1470                     ; 376 void	clear_npos2(void)
1470                     ; 377 {
1471                     .text:	section	.text,new
1472  0000               f_clear_npos2:
1476                     ; 378 	lcd_clear_npos(2, 0);
1478  0000 ae0200        	ldw	x,#512
1479  0003 8d000000      	callf	f_lcd_clear_npos
1481                     ; 379 	lcd_clear_npos(3, 0);
1483  0007 ae0300        	ldw	x,#768
1485                     ; 380 }
1488  000a ac000000      	jpf	f_lcd_clear_npos
1513                     ; 382 void	disp_next(void)
1513                     ; 383 {
1514                     .text:	section	.text,new
1515  0000               f_disp_next:
1519                     ; 384 	lcd_clear(0);
1521  0000 4f            	clr	a
1522  0001 8d000000      	callf	f_lcd_clear
1524                     ; 385 	_dsCount = 1;
1526  0005 35010015      	mov	__dsCount,#1
1527                     ; 386 	_dsPrev = 0xff;
1529  0009 35ff0016      	mov	__dsPrev,#255
1530                     ; 387 }
1533  000d 87            	retf	
1535                     	switch	.data
1536  0018               ___bL:
1537  0018 60            	dc.b	96
1592                     ; 399 void	disp_status_id(uint8_t key, uint8_t next)
1592                     ; 400 {
1593                     .text:	section	.text,new
1594  0000               f_disp_status_id:
1596  0000 89            	pushw	x
1597  0001 88            	push	a
1598       00000001      OFST:	set	1
1601                     ; 402 	if( _dsCount == 0 )
1603  0002 c60015        	ld	a,__dsCount
1604  0005 2627          	jrne	L142
1605                     ; 404 		disp_next();
1607  0007 8d000000      	callf	f_disp_next
1609                     ; 405 		lcd_disp_setup_id();
1611  000b 8d000000      	callf	f_lcd_disp_setup_id
1613                     ; 407 		if( uiInfoSet.id < 2 ) {
1615  000f c6006f        	ld	a,_uiInfoSet+1
1616  0012 a102          	cp	a,#2
1617  0014 2404          	jruge	L562
1618                     ; 408 			uiInfoSet.id = 2;
1620  0016 3502006f      	mov	_uiInfoSet+1,#2
1621  001a               L562:
1622                     ; 411 		if (_backup_backlight == 0) {
1624  001a c60009        	ld	a,__backup_backlight
1625  001d 2604          	jrne	L762
1626                     ; 412 			_backup_backlight = BACKLIGHT_MAX_LEVEL;
1628  001f 35600009      	mov	__backup_backlight,#96
1629  0023               L762:
1630                     ; 414 		__bL = _backlight;
1632  0023 5500000018    	mov	___bL,__backlight
1633                     ; 415 		_backlight = BACKLIGHT_MAX_LEVEL;
1635  0028 35600000      	mov	__backlight,#96
1637  002c 2045          	jra	L172
1638  002e               L142:
1639                     ; 419 EncEntry:		
1639                     ; 420 		i = uiInfoSet.id;
1641  002e c6006f        	ld	a,_uiInfoSet+1
1642  0031 6b01          	ld	(OFST+0,sp),a
1643                     ; 421 		if( uiInfo.enc != 0 )
1645  0033 c60001        	ld	a,_uiInfo
1646  0036 2724          	jreq	L372
1647                     ; 423 			if( (uiInfo.enc&0x40) == 0 )
1649  0038 a540          	bcp	a,#64
1650  003a 260d          	jrne	L572
1651                     ; 425 				if( i==1 )	i = _ID_MAX;
1653  003c 7b01          	ld	a,(OFST+0,sp)
1654  003e 4a            	dec	a
1655  003f 2604          	jrne	L772
1658  0041 a608          	ld	a,#8
1660  0043 200c          	jpf	LC003
1661  0045               L772:
1662                     ; 427 					i--;
1664  0045 0a01          	dec	(OFST+0,sp)
1665  0047 200e          	jra	L303
1666  0049               L572:
1667                     ; 431 				if( i==_ID_MAX )	i = 1;
1669  0049 7b01          	ld	a,(OFST+0,sp)
1670  004b a108          	cp	a,#8
1671  004d 2606          	jrne	L503
1674  004f a601          	ld	a,#1
1675  0051               LC003:
1676  0051 6b01          	ld	(OFST+0,sp),a
1678  0053 2002          	jra	L303
1679  0055               L503:
1680                     ; 433 					i++;
1682  0055 0c01          	inc	(OFST+0,sp)
1683  0057               L303:
1684                     ; 435 			uiInfoSet.id = i;
1686  0057 7b01          	ld	a,(OFST+0,sp)
1687  0059 c7006f        	ld	_uiInfoSet+1,a
1688  005c               L372:
1689                     ; 437 		if( _dsPrev != i )
1691  005c c60016        	ld	a,__dsPrev
1692  005f 1101          	cp	a,(OFST+0,sp)
1693  0061 2710          	jreq	L172
1694                     ; 439 			_dsPrev = i;
1696  0063 7b01          	ld	a,(OFST+0,sp)
1697  0065 c70016        	ld	__dsPrev,a
1698                     ; 440 			lcd_disp_rid(i, 0, 0);
1700  0068 4b00          	push	#0
1701  006a 5f            	clrw	x
1702  006b 7b02          	ld	a,(OFST+1,sp)
1703  006d 95            	ld	xh,a
1704  006e 8d000000      	callf	f_lcd_disp_rid
1706  0072 84            	pop	a
1707  0073               L172:
1708                     ; 443 	if( key == 0x10 )		__UP
1710  0073 7b02          	ld	a,(OFST+1,sp)
1711  0075 a110          	cp	a,#16
1712  0077 2606          	jrne	L313
1715  0079 35010001      	mov	_uiInfo,#1
1719  007d 2008          	jpf	LC002
1720  007f               L313:
1721                     ; 444 	else if( key == 0x20 )	__DN
1723  007f a120          	cp	a,#32
1724  0081 2608          	jrne	L713
1727  0083 35400001      	mov	_uiInfo,#64
1730  0087               LC002:
1732  0087 0f02          	clr	(OFST+1,sp)
1735  0089 20a3          	jra	L142
1736  008b               L713:
1737                     ; 445 	else if( key == 4 )	
1739  008b a104          	cp	a,#4
1740  008d 2623          	jrne	L513
1741                     ; 447 		uiInfoSet.mode = uiInfoSet.id == 1 ? 1 : 0;
1743  008f c6006f        	ld	a,_uiInfoSet+1
1744  0092 4a            	dec	a
1745  0093 2603          	jrne	L614
1746  0095 4c            	inc	a
1747  0096 2001          	jra	L024
1748  0098               L614:
1749  0098 4f            	clr	a
1750  0099               L024:
1751  0099 c70073        	ld	_uiInfoSet+5,a
1752                     ; 448 		STATUS_NEXT(next);
1754  009c 7b03          	ld	a,(OFST+2,sp)
1755  009e c70014        	ld	__ds,a
1758  00a1 725f0015      	clr	__dsCount
1761  00a5 35ff0016      	mov	__dsPrev,#255
1762                     ; 449 		_backup_backlight = 0;
1765  00a9 725f0009      	clr	__backup_backlight
1766                     ; 451 		_backlight = __bL;
1768  00ad 5500180000    	mov	__backlight,___bL
1769  00b2               L513:
1770                     ; 453 }
1773  00b2 5b03          	addw	sp,#3
1774  00b4 87            	retf	
1828                     ; 455 void	disp_status_valveCount(uint8_t key, uint8_t next)
1828                     ; 456 {
1829                     .text:	section	.text,new
1830  0000               f_disp_status_valveCount:
1832  0000 89            	pushw	x
1833  0001 88            	push	a
1834       00000001      OFST:	set	1
1837                     ; 458 	if( _dsCount == 0 )
1839  0002 c60015        	ld	a,__dsCount
1840  0005 260a          	jrne	L523
1841                     ; 460 		disp_next();
1843  0007 8d000000      	callf	f_disp_next
1845                     ; 461 		lcd_disp_setup_valve();
1847  000b 8d000000      	callf	f_lcd_disp_setup_valve
1850  000f 206c          	jra	L153
1851  0011               L523:
1852                     ; 465 EncEntry:		
1852                     ; 466 		i = uiInfoSet.controlMode==0 ? uiInfoSet.valve : uiInfoSet.valve_sub;
1854  0011 c60074        	ld	a,_uiInfoSet+6
1855  0014 2605          	jrne	L034
1856  0016 c60075        	ld	a,_uiInfoSet+7
1857  0019 2003          	jra	L234
1858  001b               L034:
1859  001b c60076        	ld	a,_uiInfoSet+8
1860  001e               L234:
1861  001e 6b01          	ld	(OFST+0,sp),a
1862                     ; 467 		if( uiInfo.enc != 0 )
1864  0020 c60001        	ld	a,_uiInfo
1865  0023 2731          	jreq	L353
1866                     ; 470 			if( (uiInfo.enc & 0x40) != 0 )
1868  0025 a540          	bcp	a,#64
1869  0027 270e          	jreq	L553
1870                     ; 472 				if( i<=1 )	i = 8;
1872  0029 7b01          	ld	a,(OFST+0,sp)
1873  002b a102          	cp	a,#2
1874  002d 2404          	jruge	L753
1877  002f a608          	ld	a,#8
1879  0031 200c          	jpf	LC005
1880  0033               L753:
1881                     ; 474 					i -= 1;
1883  0033 0a01          	dec	(OFST+0,sp)
1884  0035 200e          	jra	L363
1885  0037               L553:
1886                     ; 478 				if( i>=8 )	i = 1;
1888  0037 7b01          	ld	a,(OFST+0,sp)
1889  0039 a108          	cp	a,#8
1890  003b 2506          	jrult	L563
1893  003d a601          	ld	a,#1
1894  003f               LC005:
1895  003f 6b01          	ld	(OFST+0,sp),a
1897  0041 2002          	jra	L363
1898  0043               L563:
1899                     ; 480 					i += 1;
1901  0043 0c01          	inc	(OFST+0,sp)
1902  0045               L363:
1903                     ; 482 			if( uiInfoSet.controlMode==0 )
1905  0045 c60074        	ld	a,_uiInfoSet+6
1906  0048 2607          	jrne	L173
1907                     ; 483 				uiInfoSet.valve = i;
1909  004a 7b01          	ld	a,(OFST+0,sp)
1910  004c c70075        	ld	_uiInfoSet+7,a
1912  004f 2005          	jra	L353
1913  0051               L173:
1914                     ; 485 				uiInfoSet.valve_sub = i;
1916  0051 7b01          	ld	a,(OFST+0,sp)
1917  0053 c70076        	ld	_uiInfoSet+8,a
1918  0056               L353:
1919                     ; 487 		if( _dsPrev != i )
1921  0056 c60016        	ld	a,__dsPrev
1922  0059 1101          	cp	a,(OFST+0,sp)
1923  005b 2720          	jreq	L153
1924                     ; 489 			_dsPrev = i;
1926  005d 7b01          	ld	a,(OFST+0,sp)
1927  005f c70016        	ld	__dsPrev,a
1928                     ; 490 			UI_DISP_2Digit(i);
1930  0062 5f            	clrw	x
1931  0063 97            	ld	xl,a
1932  0064 a60a          	ld	a,#10
1933  0066 62            	div	x,a
1934  0067 a602          	ld	a,#2
1935  0069 95            	ld	xh,a
1936  006a 8d000000      	callf	f_lcd_disp_n
1940  006e 7b01          	ld	a,(OFST+0,sp)
1941  0070 5f            	clrw	x
1942  0071 97            	ld	xl,a
1943  0072 a60a          	ld	a,#10
1944  0074 62            	div	x,a
1945  0075 97            	ld	xl,a
1946  0076 a603          	ld	a,#3
1947  0078 95            	ld	xh,a
1948  0079 8d000000      	callf	f_lcd_disp_n
1951  007d               L153:
1952                     ; 493 	if( key == 0x10 )		__UP
1954  007d 7b02          	ld	a,(OFST+1,sp)
1955  007f a110          	cp	a,#16
1956  0081 2606          	jrne	L773
1959  0083 35010001      	mov	_uiInfo,#1
1963  0087 2008          	jpf	LC004
1964  0089               L773:
1965                     ; 494 	else if( key == 0x20 )	__DN
1967  0089 a120          	cp	a,#32
1968  008b 260a          	jrne	L304
1971  008d 35400001      	mov	_uiInfo,#64
1974  0091               LC004:
1976  0091 0f02          	clr	(OFST+1,sp)
1979  0093 ac110011      	jra	L523
1980  0097               L304:
1981                     ; 495 	else if( key == 4 )	
1983  0097 a104          	cp	a,#4
1984  0099 261e          	jrne	L104
1985                     ; 498 		if( uiInfoSet.controlMode==0 )
1987  009b c60074        	ld	a,_uiInfoSet+6
1988  009e 2607          	jrne	L114
1989                     ; 499 			uiInfoSet.cnt = uiInfoSet.valve;
1991  00a0 5500750070    	mov	_uiInfoSet+2,_uiInfoSet+7
1993  00a5 2005          	jra	L314
1994  00a7               L114:
1995                     ; 501 			uiInfoSet.cnt_sub = uiInfoSet.valve_sub;
1997  00a7 5500760071    	mov	_uiInfoSet+3,_uiInfoSet+8
1998  00ac               L314:
1999                     ; 502 		STATUS_NEXT(next);	
2001  00ac 7b03          	ld	a,(OFST+2,sp)
2002  00ae c70014        	ld	__ds,a
2005  00b1 725f0015      	clr	__dsCount
2008  00b5 35ff0016      	mov	__dsPrev,#255
2010  00b9               L104:
2011                     ; 504 }
2014  00b9 5b03          	addw	sp,#3
2015  00bb 87            	retf	
2079                     ; 506 void	disp_status_toffset(uint8_t key, uint8_t next)
2079                     ; 507 {
2080                     .text:	section	.text,new
2081  0000               f_disp_status_toffset:
2083  0000 89            	pushw	x
2084  0001 88            	push	a
2085       00000001      OFST:	set	1
2088                     ; 509 	if( _dsCount == 0 )
2090  0002 c60015        	ld	a,__dsCount
2091  0005 2623          	jrne	L514
2092                     ; 511 		disp_next();
2094  0007 8d000000      	callf	f_disp_next
2096                     ; 512 		LCD_BIT_SET(bT4);
2098  000b c6000f        	ld	a,_iLF_DEF+15
2099  000e 5f            	clrw	x
2100  000f 97            	ld	xl,a
2101  0010 d6540c        	ld	a,(21516,x)
2102  0013 ca000f        	or	a,_bLF_DEF+15
2103  0016 d7540c        	ld	(21516,x),a
2104                     ; 514 		if( uiInfoSet.tOffset == 0 )
2106  0019 c60079        	ld	a,_uiInfoSet+11
2107  001c 2704acb600b6  	jrne	L544
2108                     ; 515 			uiInfoSet.tOffset = 100;
2110  0022 35640079      	mov	_uiInfoSet+11,#100
2111  0026 acb600b6      	jra	L544
2112  002a               L514:
2113                     ; 519 EncEntry:		
2113                     ; 520 		i = uiInfoSet.tOffset;
2115  002a c60079        	ld	a,_uiInfoSet+11
2116  002d 6b01          	ld	(OFST+0,sp),a
2117                     ; 521 		if( uiInfo.enc != 0 )
2119  002f c60001        	ld	a,_uiInfo
2120  0032 2747          	jreq	L744
2121                     ; 523 			if( (uiInfo.enc & 0x40) == 0 )
2123  0034 a540          	bcp	a,#64
2124  0036 261c          	jrne	L154
2125                     ; 525 				if( i > 100 )			i -= 2;
2127  0038 7b01          	ld	a,(OFST+0,sp)
2128  003a a165          	cp	a,#101
2131  003c 2434          	jruge	L574
2132                     ; 526 				else if( i == 100 )		i = 2;
2134  003e a164          	cp	a,#100
2135  0040 2604          	jrne	L754
2138  0042 a602          	ld	a,#2
2140  0044 2020          	jpf	LC008
2141  0046               L754:
2142                     ; 529 					i += 2;
2144  0046 0c01          	inc	(OFST+0,sp)
2145  0048 0c01          	inc	(OFST+0,sp)
2146                     ; 530 					if( i >= 18 )		i = 18;
2148  004a 7b01          	ld	a,(OFST+0,sp)
2149  004c a112          	cp	a,#18
2150  004e 2528          	jrult	L564
2153  0050 a612          	ld	a,#18
2154  0052 2012          	jpf	LC008
2155  0054               L154:
2156                     ; 535 				if( i >= 100 )
2158  0054 7b01          	ld	a,(OFST+0,sp)
2159  0056 a164          	cp	a,#100
2160  0058 2510          	jrult	L764
2161                     ; 537 					i += 2;
2163  005a 0c01          	inc	(OFST+0,sp)
2164  005c 0c01          	inc	(OFST+0,sp)
2165                     ; 538 					if( i >= 118 )		i = 118;
2167  005e 7b01          	ld	a,(OFST+0,sp)
2168  0060 a176          	cp	a,#118
2169  0062 2514          	jrult	L564
2172  0064 a676          	ld	a,#118
2173  0066               LC008:
2174  0066 6b01          	ld	(OFST+0,sp),a
2175  0068 200e          	jra	L564
2176  006a               L764:
2177                     ; 542 					if( i == 2 )		i = 100;
2179  006a a102          	cp	a,#2
2180  006c 2604          	jrne	L574
2183  006e a664          	ld	a,#100
2185  0070 20f4          	jpf	LC008
2186  0072               L574:
2187                     ; 544 						i -= 2;
2190  0072 0a01          	dec	(OFST+0,sp)
2191  0074 0a01          	dec	(OFST+0,sp)
2192  0076 7b01          	ld	a,(OFST+0,sp)
2193  0078               L564:
2194                     ; 547 			uiInfoSet.tOffset = i;
2196  0078 c70079        	ld	_uiInfoSet+11,a
2197  007b               L744:
2198                     ; 549 		if( _dsPrev != i )
2200  007b c60016        	ld	a,__dsPrev
2201  007e 1101          	cp	a,(OFST+0,sp)
2202  0080 2734          	jreq	L544
2203                     ; 551 			_dsPrev = i;
2205  0082 7b01          	ld	a,(OFST+0,sp)
2206  0084 c70016        	ld	__dsPrev,a
2207                     ; 552 			clear_npos2();
2209  0087 8d000000      	callf	f_clear_npos2
2211                     ; 553 			if( i < 100 && i != 0 )
2213  008b 7b01          	ld	a,(OFST+0,sp)
2214  008d a164          	cp	a,#100
2215  008f 2414          	jruge	L305
2217  0091 0d01          	tnz	(OFST+0,sp)
2218  0093 2710          	jreq	L305
2219                     ; 555 				LCD_BIT_SET(b4G);
2221  0095 c60037        	ld	a,_iLF_DEF+55
2222  0098 5f            	clrw	x
2223  0099 97            	ld	xl,a
2224  009a d6540c        	ld	a,(21516,x)
2225  009d ca0037        	or	a,_bLF_DEF+55
2226  00a0 d7540c        	ld	(21516,x),a
2227  00a3 7b01          	ld	a,(OFST+0,sp)
2228  00a5               L305:
2229                     ; 557 			j = i%100;
2231  00a5 5f            	clrw	x
2232  00a6 97            	ld	xl,a
2233  00a7 a664          	ld	a,#100
2234  00a9 62            	div	x,a
2235  00aa 6b01          	ld	(OFST+0,sp),a
2236                     ; 558 			lcd_disp_n(3, j/2);
2238  00ac 5f            	clrw	x
2239  00ad 97            	ld	xl,a
2240  00ae 57            	sraw	x
2241  00af a603          	ld	a,#3
2242  00b1 95            	ld	xh,a
2243  00b2 8d000000      	callf	f_lcd_disp_n
2245  00b6               L544:
2246                     ; 561 	if( key == 0x10 )		__DN
2248  00b6 7b02          	ld	a,(OFST+1,sp)
2249  00b8 a110          	cp	a,#16
2250  00ba 2606          	jrne	L505
2253  00bc 35400001      	mov	_uiInfo,#64
2257  00c0 2008          	jpf	LC006
2258  00c2               L505:
2259                     ; 562 	else if( key == 0x20 )	__UP
2261  00c2 a120          	cp	a,#32
2262  00c4 260a          	jrne	L115
2265  00c6 35010001      	mov	_uiInfo,#1
2268  00ca               LC006:
2270  00ca 0f02          	clr	(OFST+1,sp)
2273  00cc ac2a002a      	jra	L514
2274  00d0               L115:
2275                     ; 563 	else if( key == 4 )	
2277  00d0 a104          	cp	a,#4
2278  00d2 261b          	jrne	L705
2279                     ; 570 		uiInfo.tOffset = uiInfoSet.tOffset;
2281  00d4 c60079        	ld	a,_uiInfoSet+11
2282  00d7 c70012        	ld	_uiInfo+17,a
2283                     ; 571 		FW_TOFFSET(uiInfo.tOffset);
2285  00da 97            	ld	xl,a
2286  00db a614          	ld	a,#20
2287  00dd 95            	ld	xh,a
2288  00de 8d000000      	callf	f_file_write
2290                     ; 572 		STATUS_NEXT(next);	
2292  00e2 7b03          	ld	a,(OFST+2,sp)
2293  00e4 c70014        	ld	__ds,a
2296  00e7 725f0015      	clr	__dsCount
2299  00eb 35ff0016      	mov	__dsPrev,#255
2301  00ef               L705:
2302                     ; 574 }
2305  00ef 5b03          	addw	sp,#3
2306  00f1 87            	retf	
2338                     ; 576 uint8_t	_backlight_get_index(uint8_t i)
2338                     ; 577 {
2339                     .text:	section	.text,new
2340  0000               f__backlight_get_index:
2342  0000 88            	push	a
2343       00000000      OFST:	set	0
2346                     ; 592 	if( i==BL_1 )	return 1;
2348  0001 a103          	cp	a,#3
2349  0003 2605          	jrne	L335
2352  0005 a601          	ld	a,#1
2355  0007 5b01          	addw	sp,#1
2356  0009 87            	retf	
2357  000a               L335:
2358                     ; 593 	if( i==BL_2 )	return 2;
2360  000a 7b01          	ld	a,(OFST+1,sp)
2361  000c a107          	cp	a,#7
2362  000e 2605          	jrne	L535
2365  0010 a602          	ld	a,#2
2368  0012 5b01          	addw	sp,#1
2369  0014 87            	retf	
2370  0015               L535:
2371                     ; 594 	if( i==BL_3 )	return 3;
2373  0015 a10b          	cp	a,#11
2374  0017 2605          	jrne	L735
2377  0019 a603          	ld	a,#3
2380  001b 5b01          	addw	sp,#1
2381  001d 87            	retf	
2382  001e               L735:
2383                     ; 595 	if( i==BL_4 )	return 4;
2385  001e a10f          	cp	a,#15
2386  0020 2605          	jrne	L145
2389  0022 a604          	ld	a,#4
2392  0024 5b01          	addw	sp,#1
2393  0026 87            	retf	
2394  0027               L145:
2395                     ; 596 	return 5;
2397  0027 a605          	ld	a,#5
2400  0029 5b01          	addw	sp,#1
2401  002b 87            	retf	
2433                     ; 606 uint8_t	_backlight_get_code(uint8_t i)
2433                     ; 607 {
2434                     .text:	section	.text,new
2435  0000               f__backlight_get_code:
2437  0000 88            	push	a
2438       00000000      OFST:	set	0
2441                     ; 622 	if( i==1 )	return BL_1;
2443  0001 4a            	dec	a
2444  0002 2605          	jrne	L755
2447  0004 a603          	ld	a,#3
2450  0006 5b01          	addw	sp,#1
2451  0008 87            	retf	
2452  0009               L755:
2453                     ; 623 	if( i==2 )	return BL_2;
2455  0009 7b01          	ld	a,(OFST+1,sp)
2456  000b a102          	cp	a,#2
2457  000d 2605          	jrne	L165
2460  000f a607          	ld	a,#7
2463  0011 5b01          	addw	sp,#1
2464  0013 87            	retf	
2465  0014               L165:
2466                     ; 624 	if( i==3 )	return BL_3;
2468  0014 a103          	cp	a,#3
2469  0016 2605          	jrne	L365
2472  0018 a60b          	ld	a,#11
2475  001a 5b01          	addw	sp,#1
2476  001c 87            	retf	
2477  001d               L365:
2478                     ; 625 	if( i==4 )	return BL_4;
2480  001d a104          	cp	a,#4
2481  001f 2605          	jrne	L565
2484  0021 a60f          	ld	a,#15
2487  0023 5b01          	addw	sp,#1
2488  0025 87            	retf	
2489  0026               L565:
2490                     ; 626 	return BL_5;
2492  0026 a616          	ld	a,#22
2495  0028 5b01          	addw	sp,#1
2496  002a 87            	retf	
2554                     ; 636 void disp_status_backlight2(uint8_t key, uint8_t next) 
2554                     ; 637 {
2555                     .text:	section	.text,new
2556  0000               f_disp_status_backlight2:
2558  0000 89            	pushw	x
2559       00000001      OFST:	set	1
2562                     ; 641 	_backup_backlight2 = 0;
2564  0001 725f000a      	clr	__backup_backlight2
2565  0005 88            	push	a
2566                     ; 643 	if( _dsCount == 0 )
2568  0006 c60015        	ld	a,__dsCount
2569  0009 2613          	jrne	L765
2570                     ; 645 		lcd_clear(0);
2572  000b 8d000000      	callf	f_lcd_clear
2574                     ; 646 		lcd_disp_backlight();
2576  000f 8d000000      	callf	f_lcd_disp_backlight
2578                     ; 647 		_dsCount = 1;
2580  0013 35010015      	mov	__dsCount,#1
2581                     ; 648 		uiInfo._t = _backlight;
2583  0017 5500000060    	mov	_uiInfo+95,__backlight
2585  001c 2060          	jra	L316
2586  001e               L765:
2587                     ; 652 EncEntry:
2587                     ; 653 		i = _backlight;
2589  001e c60000        	ld	a,__backlight
2590  0021 6b01          	ld	(OFST+0,sp),a
2591                     ; 654 		i = _backlight_get_index(i);
2593  0023 8d000000      	callf	f__backlight_get_index
2595  0027 6b01          	ld	(OFST+0,sp),a
2596                     ; 656 		if( uiInfo.enc != 0 )
2598  0029 c60001        	ld	a,_uiInfo
2599  002c 2729          	jreq	L516
2600                     ; 660 			ENC_MOVE_0(1, 5, 1);
2602  002e a540          	bcp	a,#64
2603  0030 260e          	jrne	L716
2606  0032 7b01          	ld	a,(OFST+0,sp)
2607  0034 a102          	cp	a,#2
2608  0036 2404          	jruge	L126
2611  0038 a605          	ld	a,#5
2613  003a 200c          	jpf	LC010
2614  003c               L126:
2617  003c 0a01          	dec	(OFST+0,sp)
2618  003e 200e          	jra	L526
2619  0040               L716:
2622  0040 7b01          	ld	a,(OFST+0,sp)
2623  0042 a105          	cp	a,#5
2624  0044 2506          	jrult	L726
2627  0046 a601          	ld	a,#1
2628  0048               LC010:
2629  0048 6b01          	ld	(OFST+0,sp),a
2631  004a 2002          	jra	L526
2632  004c               L726:
2635  004c 0c01          	inc	(OFST+0,sp)
2636  004e               L526:
2637                     ; 661 			_backlight = _backlight_get_code(i);
2640  004e 7b01          	ld	a,(OFST+0,sp)
2641  0050 8d000000      	callf	f__backlight_get_code
2643  0054 c70000        	ld	__backlight,a
2644  0057               L516:
2645                     ; 664 		if( _dsPrev != i )
2647  0057 c60016        	ld	a,__dsPrev
2648  005a 1101          	cp	a,(OFST+0,sp)
2649  005c 2720          	jreq	L316
2650                     ; 666 			_dsPrev = i;
2652  005e 7b01          	ld	a,(OFST+0,sp)
2653  0060 c70016        	ld	__dsPrev,a
2654                     ; 668 			UI_DISP_2Digit(i);
2656  0063 5f            	clrw	x
2657  0064 97            	ld	xl,a
2658  0065 a60a          	ld	a,#10
2659  0067 62            	div	x,a
2660  0068 a602          	ld	a,#2
2661  006a 95            	ld	xh,a
2662  006b 8d000000      	callf	f_lcd_disp_n
2666  006f 7b01          	ld	a,(OFST+0,sp)
2667  0071 5f            	clrw	x
2668  0072 97            	ld	xl,a
2669  0073 a60a          	ld	a,#10
2670  0075 62            	div	x,a
2671  0076 97            	ld	xl,a
2672  0077 a603          	ld	a,#3
2673  0079 95            	ld	xh,a
2674  007a 8d000000      	callf	f_lcd_disp_n
2677  007e               L316:
2678                     ; 672 	if( key == 0x10 )		__DN
2680  007e 7b02          	ld	a,(OFST+1,sp)
2681  0080 a110          	cp	a,#16
2682  0082 2606          	jrne	L536
2685  0084 35400001      	mov	_uiInfo,#64
2689  0088 2008          	jpf	LC009
2690  008a               L536:
2691                     ; 673 	else if( key == 0x20 )	__UP
2693  008a a120          	cp	a,#32
2694  008c 2608          	jrne	L146
2697  008e 35010001      	mov	_uiInfo,#1
2700  0092               LC009:
2702  0092 0f02          	clr	(OFST+1,sp)
2705  0094 2088          	jra	L765
2706  0096               L146:
2707                     ; 674 	else if( key == 4 )	
2709  0096 a104          	cp	a,#4
2710  0098 2618          	jrne	L736
2711                     ; 679 		FW_BACKLIGHT(_backlight);
2713  009a c60000        	ld	a,__backlight
2714  009d 97            	ld	xl,a
2715  009e a62a          	ld	a,#42
2716  00a0 95            	ld	xh,a
2717  00a1 8d000000      	callf	f_file_write
2719                     ; 680 		STATUS_NEXT(next);	
2721  00a5 7b03          	ld	a,(OFST+2,sp)
2722  00a7 c70014        	ld	__ds,a
2725  00aa 725f0015      	clr	__dsCount
2728  00ae 35ff0016      	mov	__dsPrev,#255
2730  00b2               L736:
2731                     ; 682 }
2734  00b2 5b03          	addw	sp,#3
2735  00b4 87            	retf	
2790                     ; 684 void	disp_status_run_op(uint8_t key, uint8_t next)
2790                     ; 685 {
2791                     .text:	section	.text,new
2792  0000               f_disp_status_run_op:
2794  0000 89            	pushw	x
2795  0001 88            	push	a
2796       00000001      OFST:	set	1
2799                     ; 687 	if( uiInfoSet.controlMode==1 )
2801  0002 c60074        	ld	a,_uiInfoSet+6
2802  0005 4a            	dec	a
2803  0006 2603          	jrne	L176
2804                     ; 689 		STATUS_NEXT(next);	
2806  0008 9f            	ld	a,xl
2809                     ; 690 		return;
2812  0009 2065          	jpf	LC012
2813  000b               L176:
2814                     ; 692 	if( _dsCount == 0 )
2816  000b c60015        	ld	a,__dsCount
2817  000e 260a          	jrne	L746
2818                     ; 694 		disp_next();
2820  0010 8d000000      	callf	f_disp_next
2822                     ; 695 		lcd_disp_setup_cntl_op();
2824  0014 8d000000      	callf	f_lcd_disp_setup_cntl_op
2827  0018 2038          	jra	L576
2828  001a               L746:
2829                     ; 699 EncEntry:		
2829                     ; 700 		i = uiInfoSet.opMode;
2831  001a c60072        	ld	a,_uiInfoSet+4
2832  001d 6b01          	ld	(OFST+0,sp),a
2833                     ; 701 		if( uiInfo.enc != 0 )
2835  001f c60001        	ld	a,_uiInfo
2836  0022 270d          	jreq	L776
2837                     ; 703 			i = i==0 ? 1 : 0;
2839  0024 7b01          	ld	a,(OFST+0,sp)
2840  0026 2603          	jrne	L405
2841  0028 4c            	inc	a
2842  0029 2001          	jra	L605
2843  002b               L405:
2844  002b 4f            	clr	a
2845  002c               L605:
2846  002c 6b01          	ld	(OFST+0,sp),a
2847                     ; 704 			uiInfoSet.opMode = i;
2849  002e c70072        	ld	_uiInfoSet+4,a
2850  0031               L776:
2851                     ; 706 		if( _dsPrev != i )
2853  0031 c60016        	ld	a,__dsPrev
2854  0034 1101          	cp	a,(OFST+0,sp)
2855  0036 271a          	jreq	L576
2856                     ; 708 			_dsPrev = i;
2858  0038 7b01          	ld	a,(OFST+0,sp)
2859  003a c70016        	ld	__dsPrev,a
2860                     ; 709 			clear_npos2();
2862  003d 8d000000      	callf	f_clear_npos2
2864                     ; 710 			if( i==0 )		lcd_disp_setup_cntl_on();
2866  0041 7b01          	ld	a,(OFST+0,sp)
2867  0043 2606          	jrne	L307
2870  0045 8d000000      	callf	f_lcd_disp_setup_cntl_on
2873  0049 2007          	jra	L576
2874  004b               L307:
2875                     ; 711 			else if( i==1 )	lcd_disp_setup_cntl_po();
2877  004b 4a            	dec	a
2878  004c 2604          	jrne	L576
2881  004e 8d000000      	callf	f_lcd_disp_setup_cntl_po
2883  0052               L576:
2884                     ; 714 	if( key == 0x10 )		__DN
2886  0052 7b02          	ld	a,(OFST+1,sp)
2887  0054 a110          	cp	a,#16
2888  0056 2606          	jrne	L117
2891  0058 35400001      	mov	_uiInfo,#64
2895  005c 2008          	jpf	LC011
2896  005e               L117:
2897                     ; 715 	else if( key == 0x20 )	__UP
2899  005e a120          	cp	a,#32
2900  0060 2608          	jrne	L517
2903  0062 35010001      	mov	_uiInfo,#1
2906  0066               LC011:
2908  0066 0f02          	clr	(OFST+1,sp)
2911  0068 20b0          	jra	L746
2912  006a               L517:
2913                     ; 716 	else if( key == 4 )		
2915  006a a104          	cp	a,#4
2916  006c 260d          	jrne	L317
2917                     ; 718 		STATUS_NEXT(next);	
2919  006e 7b03          	ld	a,(OFST+2,sp)
2924  0070               LC012:
2925  0070 c70014        	ld	__ds,a
2927  0073 725f0015      	clr	__dsCount
2929  0077 35ff0016      	mov	__dsPrev,#255
2931  007b               L317:
2932                     ; 720 }
2935  007b 5b03          	addw	sp,#3
2936  007d 87            	retf	
2992                     ; 722 void	disp_status_cntl_op(uint8_t key, uint8_t next)
2992                     ; 723 {
2993                     .text:	section	.text,new
2994  0000               f_disp_status_cntl_op:
2996  0000 89            	pushw	x
2997  0001 88            	push	a
2998       00000001      OFST:	set	1
3001                     ; 725 	if( uiInfoSet.controlMode==1 )
3003  0002 c60074        	ld	a,_uiInfoSet+6
3004  0005 4a            	dec	a
3005  0006 2603          	jrne	L547
3006                     ; 727 		STATUS_NEXT(next);	
3008  0008 9f            	ld	a,xl
3011                     ; 728 		return;
3014  0009 2062          	jpf	LC014
3015  000b               L547:
3016                     ; 730 	if( _dsCount == 0 )
3018  000b c60015        	ld	a,__dsCount
3019  000e 260a          	jrne	L327
3020                     ; 732 		disp_next();
3022  0010 8d000000      	callf	f_disp_next
3024                     ; 733 		lcd_disp_setup_mode();
3026  0014 8d000000      	callf	f_lcd_disp_setup_mode
3029  0018 2035          	jra	L157
3030  001a               L327:
3031                     ; 737 EncEntry:		
3031                     ; 738 		i = uiInfoSet.cntlMode;
3033  001a c6006e        	ld	a,_uiInfoSet
3034  001d 6b01          	ld	(OFST+0,sp),a
3035                     ; 739 		if( uiInfo.enc != 0 )
3037  001f c60001        	ld	a,_uiInfo
3038  0022 270d          	jreq	L357
3039                     ; 741 			i = i==0 ? 1 : 0;
3041  0024 7b01          	ld	a,(OFST+0,sp)
3042  0026 2603          	jrne	L625
3043  0028 4c            	inc	a
3044  0029 2001          	jra	L035
3045  002b               L625:
3046  002b 4f            	clr	a
3047  002c               L035:
3048  002c 6b01          	ld	(OFST+0,sp),a
3049                     ; 742 			uiInfoSet.cntlMode = i;
3051  002e c7006e        	ld	_uiInfoSet,a
3052  0031               L357:
3053                     ; 744 		if( _dsPrev != i )
3055  0031 c60016        	ld	a,__dsPrev
3056  0034 1101          	cp	a,(OFST+0,sp)
3057  0036 2717          	jreq	L157
3058                     ; 746 			_dsPrev = i;
3060  0038 7b01          	ld	a,(OFST+0,sp)
3061  003a c70016        	ld	__dsPrev,a
3062                     ; 747 			clear_npos2();
3064  003d 8d000000      	callf	f_clear_npos2
3066                     ; 748 			if( i == 0 )	lcd_disp_setup_mode_local();
3068  0041 7b01          	ld	a,(OFST+0,sp)
3069  0043 2606          	jrne	L757
3072  0045 8d000000      	callf	f_lcd_disp_setup_mode_local
3075  0049 2004          	jra	L157
3076  004b               L757:
3077                     ; 749 			else			lcd_disp_setup_mode_each();
3079  004b 8d000000      	callf	f_lcd_disp_setup_mode_each
3081  004f               L157:
3082                     ; 752 	if( key == 0x10 )		__DN
3084  004f 7b02          	ld	a,(OFST+1,sp)
3085  0051 a110          	cp	a,#16
3086  0053 2606          	jrne	L367
3089  0055 35400001      	mov	_uiInfo,#64
3093  0059 2008          	jpf	LC013
3094  005b               L367:
3095                     ; 753 	else if( key == 0x20 )	__UP
3097  005b a120          	cp	a,#32
3098  005d 2608          	jrne	L767
3101  005f 35010001      	mov	_uiInfo,#1
3104  0063               LC013:
3106  0063 0f02          	clr	(OFST+1,sp)
3109  0065 20b3          	jra	L327
3110  0067               L767:
3111                     ; 754 	else if( key == 4 )		
3113  0067 a104          	cp	a,#4
3114  0069 260d          	jrne	L567
3115                     ; 756 		STATUS_NEXT(next);	
3117  006b 7b03          	ld	a,(OFST+2,sp)
3122  006d               LC014:
3123  006d c70014        	ld	__ds,a
3125  0070 725f0015      	clr	__dsCount
3127  0074 35ff0016      	mov	__dsPrev,#255
3129  0078               L567:
3130                     ; 758 }
3133  0078 5b03          	addw	sp,#3
3134  007a 87            	retf	
3188                     ; 760 void	disp_status_houseCapa(uint8_t key, uint8_t next)
3188                     ; 761 {
3189                     .text:	section	.text,new
3190  0000               f_disp_status_houseCapa:
3192  0000 89            	pushw	x
3193  0001 88            	push	a
3194       00000001      OFST:	set	1
3197                     ; 763 	if(uiInfoSet.cntlMode != 0 )	
3199  0002 c6006e        	ld	a,_uiInfoSet
3200  0005 2705          	jreq	L7101
3201                     ; 766 		STATUS_NEXT(next);
3203  0007 9f            	ld	a,xl
3206                     ; 767 		return;
3209  0008 aca100a1      	jpf	LC016
3210  000c               L7101:
3211                     ; 770 	if( _dsCount == 0 )
3213  000c c60015        	ld	a,__dsCount
3214  000f 260a          	jrne	L577
3215                     ; 772 		disp_next();
3217  0011 8d000000      	callf	f_disp_next
3219                     ; 773 		lcd_disp_setup_len();
3221  0015 8d000000      	callf	f_lcd_disp_setup_len
3224  0019 2068          	jra	L3201
3225  001b               L577:
3226                     ; 777 EncEntry:		
3226                     ; 778 		i = uiInfoSet.houseCapa;
3228  001b c60078        	ld	a,_uiInfoSet+10
3229  001e 6b01          	ld	(OFST+0,sp),a
3230                     ; 779 		if( uiInfo.enc != 0 )
3232  0020 c60001        	ld	a,_uiInfo
3233  0023 271f          	jreq	L5201
3234                     ; 781 			if( (uiInfo.enc & 0x40) == 0 )	i--;
3236  0025 a540          	bcp	a,#64
3237  0027 2604          	jrne	L7201
3240  0029 0a01          	dec	(OFST+0,sp)
3242  002b 2002          	jra	L1301
3243  002d               L7201:
3244                     ; 783 				i++;
3246  002d 0c01          	inc	(OFST+0,sp)
3247  002f               L1301:
3248                     ; 784 			if( i < 70 )	i = 200;
3250  002f 7b01          	ld	a,(OFST+0,sp)
3251  0031 a146          	cp	a,#70
3252  0033 2404          	jruge	L3301
3255  0035 a6c8          	ld	a,#200
3256  0037 6b01          	ld	(OFST+0,sp),a
3257  0039               L3301:
3258                     ; 785 			if( i > 200 )	i = 70;
3260  0039 a1c9          	cp	a,#201
3261  003b 2504          	jrult	L5301
3264  003d a646          	ld	a,#70
3265  003f 6b01          	ld	(OFST+0,sp),a
3266  0041               L5301:
3267                     ; 786 			uiInfoSet.houseCapa = i;
3269  0041 c70078        	ld	_uiInfoSet+10,a
3270  0044               L5201:
3271                     ; 788 		if( _dsPrev != i )
3273  0044 c60016        	ld	a,__dsPrev
3274  0047 1101          	cp	a,(OFST+0,sp)
3275  0049 2738          	jreq	L3201
3276                     ; 790 			_dsPrev = i;
3278  004b 7b01          	ld	a,(OFST+0,sp)
3279  004d c70016        	ld	__dsPrev,a
3280                     ; 791 			UI_DISP_3Digit(i);
3282  0050 5f            	clrw	x
3283  0051 97            	ld	xl,a
3284  0052 a664          	ld	a,#100
3285  0054 62            	div	x,a
3286  0055 a601          	ld	a,#1
3287  0057 95            	ld	xh,a
3288  0058 8d000000      	callf	f_lcd_disp_n
3292  005c 7b01          	ld	a,(OFST+0,sp)
3293  005e 5f            	clrw	x
3294  005f 97            	ld	xl,a
3295  0060 a664          	ld	a,#100
3296  0062 62            	div	x,a
3297  0063 5f            	clrw	x
3298  0064 97            	ld	xl,a
3299  0065 01            	rrwa	x,a
3300  0066 6b01          	ld	(OFST+0,sp),a
3303  0068 5f            	clrw	x
3304  0069 97            	ld	xl,a
3305  006a a60a          	ld	a,#10
3306  006c 62            	div	x,a
3307  006d a602          	ld	a,#2
3308  006f 95            	ld	xh,a
3309  0070 8d000000      	callf	f_lcd_disp_n
3313  0074 7b01          	ld	a,(OFST+0,sp)
3314  0076 5f            	clrw	x
3315  0077 97            	ld	xl,a
3316  0078 a60a          	ld	a,#10
3317  007a 62            	div	x,a
3318  007b 97            	ld	xl,a
3319  007c a603          	ld	a,#3
3320  007e 95            	ld	xh,a
3321  007f 8d000000      	callf	f_lcd_disp_n
3324  0083               L3201:
3325                     ; 794 	if( key == 0x10 )		__DN
3327  0083 7b02          	ld	a,(OFST+1,sp)
3328  0085 a110          	cp	a,#16
3329  0087 2606          	jrne	L1401
3332  0089 35400001      	mov	_uiInfo,#64
3336  008d 2008          	jpf	LC015
3337  008f               L1401:
3338                     ; 795 	else if( key == 0x20 )	__UP
3340  008f a120          	cp	a,#32
3341  0091 2608          	jrne	L5401
3344  0093 35010001      	mov	_uiInfo,#1
3347  0097               LC015:
3349  0097 0f02          	clr	(OFST+1,sp)
3352  0099 2080          	jra	L577
3353  009b               L5401:
3354                     ; 796 	else if( key == 4 )		
3356  009b a104          	cp	a,#4
3357  009d 260d          	jrne	L3401
3358                     ; 798 		STATUS_NEXT(next);	
3360  009f 7b03          	ld	a,(OFST+2,sp)
3365  00a1               LC016:
3366  00a1 c70014        	ld	__ds,a
3368  00a4 725f0015      	clr	__dsCount
3370  00a8 35ff0016      	mov	__dsPrev,#255
3372  00ac               L3401:
3373                     ; 800 }
3376  00ac 5b03          	addw	sp,#3
3377  00ae 87            	retf	
3409                     ; 802 void	disp_status_po_type(uint8_t key, uint8_t next)
3409                     ; 803 {
3410                     .text:	section	.text,new
3411  0000               f_disp_status_po_type:
3415                     ; 848 }
3418  0000 87            	retf	
3420                     	switch	.const
3421  0012               ___lpm:
3422  0012 00            	dc.b	0
3423  0013 08            	dc.b	8
3424  0014 0a            	dc.b	10
3425  0015 0f            	dc.b	15
3426  0016 14            	dc.b	20
3427  0017 19            	dc.b	25
3428  0018 1e            	dc.b	30
3429  0019 63            	dc.b	99
3430  001a 63            	dc.b	99
3484                     ; 855 void	disp_status_lpm(uint8_t key, uint8_t next)
3484                     ; 856 {
3485                     .text:	section	.text,new
3486  0000               f_disp_status_lpm:
3488  0000 89            	pushw	x
3489  0001 88            	push	a
3490       00000001      OFST:	set	1
3493                     ; 859 	if( uiInfoSet.cntlMode == 1 )
3495  0002 c6006e        	ld	a,_uiInfoSet
3496  0005 4a            	dec	a
3497  0006 2605          	jrne	L1111
3498                     ; 861 		STATUS_NEXT(next);
3500  0008 9f            	ld	a,xl
3503                     ; 862 		return;
3506  0009 acb800b8      	jpf	LC018
3507  000d               L1111:
3508                     ; 864 	if( _dsCount == 0 )
3510  000d c60015        	ld	a,__dsCount
3511  0010 260a          	jrne	L7601
3512                     ; 866 		disp_next();
3514  0012 8d000000      	callf	f_disp_next
3516                     ; 867 		lcd_disp_setup_lpm();
3518  0016 8d000000      	callf	f_lcd_disp_setup_lpm
3521  001a 207c          	jra	L5111
3522  001c               L7601:
3523                     ; 871 EncEntry:		
3523                     ; 872 		i = uiInfoSet.controlMode==1 ? uiInfoSet.lpmType_sub : uiInfoSet.lpmType;
3525  001c c60074        	ld	a,_uiInfoSet+6
3526  001f 4a            	dec	a
3527  0020 2605          	jrne	L075
3528  0022 c6007c        	ld	a,_uiInfoSet+14
3529  0025 2003          	jra	L275
3530  0027               L075:
3531  0027 c6007b        	ld	a,_uiInfoSet+13
3532  002a               L275:
3533  002a 6b01          	ld	(OFST+0,sp),a
3534                     ; 874 		if( uiInfo.enc != 0 )
3536  002c c60001        	ld	a,_uiInfo
3537  002f 2730          	jreq	L7111
3538                     ; 876 			if( (uiInfo.enc & 0x40) == 0 )
3540  0031 a540          	bcp	a,#64
3541  0033 260e          	jrne	L1211
3542                     ; 878 				if( i==0 )	i = 7;
3544  0035 7b01          	ld	a,(OFST+0,sp)
3545  0037 2606          	jrne	L3211
3548  0039 a607          	ld	a,#7
3549  003b 6b01          	ld	(OFST+0,sp),a
3551  003d 2010          	jra	L7211
3552  003f               L3211:
3553                     ; 880 					i--;
3555  003f 0a01          	dec	(OFST+0,sp)
3556  0041 200c          	jra	L7211
3557  0043               L1211:
3558                     ; 884 				if( i==7 )	i = 0;
3560  0043 7b01          	ld	a,(OFST+0,sp)
3561  0045 a107          	cp	a,#7
3562  0047 2604          	jrne	L1311
3565  0049 0f01          	clr	(OFST+0,sp)
3567  004b 2002          	jra	L7211
3568  004d               L1311:
3569                     ; 886 					i++;
3571  004d 0c01          	inc	(OFST+0,sp)
3572  004f               L7211:
3573                     ; 888 			if( uiInfoSet.controlMode==1 )
3575  004f c60074        	ld	a,_uiInfoSet+6
3576  0052 4a            	dec	a
3577  0053 2607          	jrne	L5311
3578                     ; 889 				uiInfoSet.lpmType_sub = i;
3580  0055 7b01          	ld	a,(OFST+0,sp)
3581  0057 c7007c        	ld	_uiInfoSet+14,a
3583  005a 2005          	jra	L7111
3584  005c               L5311:
3585                     ; 891 				uiInfoSet.lpmType = i;
3587  005c 7b01          	ld	a,(OFST+0,sp)
3588  005e c7007b        	ld	_uiInfoSet+13,a
3589  0061               L7111:
3590                     ; 893 		if( _dsPrev != i )
3592  0061 c60016        	ld	a,__dsPrev
3593  0064 1101          	cp	a,(OFST+0,sp)
3594  0066 2730          	jreq	L5111
3595                     ; 895 			_dsPrev = i;
3597  0068 7b01          	ld	a,(OFST+0,sp)
3598  006a c70016        	ld	__dsPrev,a
3599                     ; 896 			clear_npos2();
3601  006d 8d000000      	callf	f_clear_npos2
3603                     ; 897 			UI_DISP_2Digit(__lpm[i]);
3605  0071 7b01          	ld	a,(OFST+0,sp)
3606  0073 5f            	clrw	x
3607  0074 97            	ld	xl,a
3608  0075 d60012        	ld	a,(___lpm,x)
3609  0078 5f            	clrw	x
3610  0079 97            	ld	xl,a
3611  007a a60a          	ld	a,#10
3612  007c 62            	div	x,a
3613  007d a602          	ld	a,#2
3614  007f 95            	ld	xh,a
3615  0080 8d000000      	callf	f_lcd_disp_n
3619  0084 7b01          	ld	a,(OFST+0,sp)
3620  0086 5f            	clrw	x
3621  0087 97            	ld	xl,a
3622  0088 d60012        	ld	a,(___lpm,x)
3623  008b 5f            	clrw	x
3624  008c 97            	ld	xl,a
3625  008d a60a          	ld	a,#10
3626  008f 62            	div	x,a
3627  0090 97            	ld	xl,a
3628  0091 a603          	ld	a,#3
3629  0093 95            	ld	xh,a
3630  0094 8d000000      	callf	f_lcd_disp_n
3633  0098               L5111:
3634                     ; 900 	if( key == 0x10 )		__DN
3636  0098 7b02          	ld	a,(OFST+1,sp)
3637  009a a110          	cp	a,#16
3638  009c 2606          	jrne	L3411
3641  009e 35400001      	mov	_uiInfo,#64
3645  00a2 2008          	jpf	LC017
3646  00a4               L3411:
3647                     ; 901 	else if( key == 0x20 )	__UP
3649  00a4 a120          	cp	a,#32
3650  00a6 260a          	jrne	L7411
3653  00a8 35010001      	mov	_uiInfo,#1
3656  00ac               LC017:
3658  00ac 0f02          	clr	(OFST+1,sp)
3661  00ae ac1c001c      	jra	L7601
3662  00b2               L7411:
3663                     ; 902 	else if( key == 4 )		
3665  00b2 a104          	cp	a,#4
3666  00b4 260d          	jrne	L5411
3667                     ; 904 		STATUS_NEXT(next);	
3669  00b6 7b03          	ld	a,(OFST+2,sp)
3674  00b8               LC018:
3675  00b8 c70014        	ld	__ds,a
3677  00bb 725f0015      	clr	__dsCount
3679  00bf 35ff0016      	mov	__dsPrev,#255
3681  00c3               L5411:
3682                     ; 906 }
3685  00c3 5b03          	addw	sp,#3
3686  00c5 87            	retf	
3718                     ; 908 void	disp_status_temp_offset(uint8_t key, uint8_t next)
3718                     ; 909 {
3719                     .text:	section	.text,new
3720  0000               f_disp_status_temp_offset:
3724                     ; 948 }
3727  0000 87            	retf	
3729                     	switch	.data
3730  0019               __ui_:
3731  0019 00            	dc.b	0
3811                     ; 956 void	disp_status_valveinfo_sub(uint8_t key, uint8_t next, uint8_t prev)
3811                     ; 957 {
3812                     .text:	section	.text,new
3813  0000               f_disp_status_valveinfo_sub:
3815  0000 89            	pushw	x
3816  0001 520c          	subw	sp,#12
3817       0000000c      OFST:	set	12
3820                     ; 960 	if( _dsCount == 0 )
3822  0003 c60015        	ld	a,__dsCount
3823  0006 266a          	jrne	L1711
3824                     ; 962 		if( uiInfoSet.valve_sub == 0 )
3826  0008 725d0076      	tnz	_uiInfoSet+8
3827  000c 260b          	jrne	L5221
3828                     ; 964 			uiInfoSet.cnt_sub = 0;
3830  000e c70071        	ld	_uiInfoSet+3,a
3831                     ; 965 			uiInfoSet.lpmType_sub = 0;
3833  0011 c7007c        	ld	_uiInfoSet+14,a
3834                     ; 966 			STATUS_NEXT(next);	
3836  0014 9f            	ld	a,xl
3837  0015 8db401b4      	callf	LC022
3839  0019               L5221:
3840                     ; 968 		disp_next();
3842  0019 8d000000      	callf	f_disp_next
3844                     ; 969 		lcd_disp_n(0, UI_RIDs+1);
3846  001d c600a1        	ld	a,_uiInfoSet+51
3847  0020 4c            	inc	a
3848  0021 97            	ld	xl,a
3849  0022 4f            	clr	a
3850  0023 95            	ld	xh,a
3851  0024 8d000000      	callf	f_lcd_disp_n
3853                     ; 970 		lcd_blink_npos(UI_RIDs+1);
3855  0028 c600a1        	ld	a,_uiInfoSet+51
3856  002b 4c            	inc	a
3857  002c 8d000000      	callf	f_lcd_blink_npos
3859                     ; 971 		_ui_ = uiInfoSet.valve_sub_rc[UI_RIDs];// + uiInfoSet.cnt;
3861  0030 8dae01ae      	callf	LC021
3862  0034 d60095        	ld	a,(_uiInfoSet+39,x)
3863  0037 c70019        	ld	__ui_,a
3864                     ; 972 		lcd_disp_rid(_ui_, 1, 0);
3866  003a 4b00          	push	#0
3867  003c ae0001        	ldw	x,#1
3868  003f 95            	ld	xh,a
3869  0040 8d000000      	callf	f_lcd_disp_rid
3871  0044 84            	pop	a
3872                     ; 973 		for( i=0; i<8; i++ )
3874  0045 4f            	clr	a
3875  0046 6b0c          	ld	(OFST+0,sp),a
3876  0048               L7221:
3877                     ; 975 			if( i >= uiInfoSet.valve_sub )
3879  0048 c10076        	cp	a,_uiInfoSet+8
3880  004b 5f            	clrw	x
3881  004c 97            	ld	xl,a
3882  004d 250c          	jrult	L5321
3883                     ; 977 				uiInfoSet.valve_sub_len[i] = 0;
3885  004f 724f008d      	clr	(_uiInfoSet+31,x)
3886                     ; 978 				uiInfoSet.valve_sub_rc[i] = 0;
3888  0053 5f            	clrw	x
3889  0054 97            	ld	xl,a
3890  0055 724f0095      	clr	(_uiInfoSet+39,x)
3892  0059 200d          	jra	L7321
3893  005b               L5321:
3894                     ; 982 				if( uiInfoSet.valve_rc[i] == 0 )
3896  005b 724d0085      	tnz	(_uiInfoSet+23,x)
3897  005f 2607          	jrne	L7321
3898                     ; 983 					uiInfoSet.valve_rc[i] = 1;
3900  0061 5f            	clrw	x
3901  0062 97            	ld	xl,a
3902  0063 a601          	ld	a,#1
3903  0065 d70085        	ld	(_uiInfoSet+23,x),a
3904  0068               L7321:
3905                     ; 973 		for( i=0; i<8; i++ )
3907  0068 0c0c          	inc	(OFST+0,sp)
3910  006a 7b0c          	ld	a,(OFST+0,sp)
3911  006c a108          	cp	a,#8
3912  006e 25d8          	jrult	L7221
3914  0070 2072          	jra	L3421
3915  0072               L1711:
3916                     ; 989 EncEntry:		
3916                     ; 990 		i = uiInfoSet.valve_sub_len[UI_RIDs];
3918  0072 8dae01ae      	callf	LC021
3919  0076 d6008d        	ld	a,(_uiInfoSet+31,x)
3920  0079 6b0c          	ld	(OFST+0,sp),a
3921                     ; 991 		if( uiInfo.enc != 0 )
3923  007b c60001        	ld	a,_uiInfo
3924  007e 2725          	jreq	L5421
3925                     ; 993 			if( (uiInfo.enc & 0x40) == 0 )	i--;
3927  0080 a540          	bcp	a,#64
3928  0082 2604          	jrne	L7421
3931  0084 0a0c          	dec	(OFST+0,sp)
3933  0086 2002          	jra	L1521
3934  0088               L7421:
3935                     ; 995 				i++;
3937  0088 0c0c          	inc	(OFST+0,sp)
3938  008a               L1521:
3939                     ; 996 			if( i > 150 )	i = 35;
3941  008a 7b0c          	ld	a,(OFST+0,sp)
3942  008c a197          	cp	a,#151
3943  008e 2504          	jrult	L3521
3946  0090 a623          	ld	a,#35
3947  0092 6b0c          	ld	(OFST+0,sp),a
3948  0094               L3521:
3949                     ; 997 			if( i < 35 )	i = 150;
3951  0094 a123          	cp	a,#35
3952  0096 2404          	jruge	L5521
3955  0098 a696          	ld	a,#150
3956  009a 6b0c          	ld	(OFST+0,sp),a
3957  009c               L5521:
3958                     ; 998 			uiInfoSet.valve_sub_len[UI_RIDs] = i;
3960  009c 8dae01ae      	callf	LC021
3961  00a0 7b0c          	ld	a,(OFST+0,sp)
3962  00a2 d7008d        	ld	(_uiInfoSet+31,x),a
3963  00a5               L5421:
3964                     ; 1000 		if( _dsPrev != i )
3966  00a5 c60016        	ld	a,__dsPrev
3967  00a8 110c          	cp	a,(OFST+0,sp)
3968  00aa 2738          	jreq	L3421
3969                     ; 1002 			_dsPrev = i;
3971  00ac 7b0c          	ld	a,(OFST+0,sp)
3972  00ae c70016        	ld	__dsPrev,a
3973                     ; 1003 			UI_DISP_3Digit(i);
3975  00b1 5f            	clrw	x
3976  00b2 97            	ld	xl,a
3977  00b3 a664          	ld	a,#100
3978  00b5 62            	div	x,a
3979  00b6 a601          	ld	a,#1
3980  00b8 95            	ld	xh,a
3981  00b9 8d000000      	callf	f_lcd_disp_n
3985  00bd 7b0c          	ld	a,(OFST+0,sp)
3986  00bf 5f            	clrw	x
3987  00c0 97            	ld	xl,a
3988  00c1 a664          	ld	a,#100
3989  00c3 62            	div	x,a
3990  00c4 5f            	clrw	x
3991  00c5 97            	ld	xl,a
3992  00c6 01            	rrwa	x,a
3993  00c7 6b0c          	ld	(OFST+0,sp),a
3996  00c9 5f            	clrw	x
3997  00ca 97            	ld	xl,a
3998  00cb a60a          	ld	a,#10
3999  00cd 62            	div	x,a
4000  00ce a602          	ld	a,#2
4001  00d0 95            	ld	xh,a
4002  00d1 8d000000      	callf	f_lcd_disp_n
4006  00d5 7b0c          	ld	a,(OFST+0,sp)
4007  00d7 5f            	clrw	x
4008  00d8 97            	ld	xl,a
4009  00d9 a60a          	ld	a,#10
4010  00db 62            	div	x,a
4011  00dc 97            	ld	xl,a
4012  00dd a603          	ld	a,#3
4013  00df 95            	ld	xh,a
4014  00e0 8d000000      	callf	f_lcd_disp_n
4017  00e4               L3421:
4018                     ; 1006 	if( key == 0x10 )		__DN
4020  00e4 7b0d          	ld	a,(OFST+1,sp)
4021  00e6 a110          	cp	a,#16
4022  00e8 2606          	jrne	L1621
4025  00ea 35400001      	mov	_uiInfo,#64
4029  00ee 2008          	jpf	LC019
4030  00f0               L1621:
4031                     ; 1007 	else if( key == 0x20 )	__UP
4033  00f0 a120          	cp	a,#32
4034  00f2 260a          	jrne	L5621
4037  00f4 35010001      	mov	_uiInfo,#1
4040  00f8               LC019:
4042  00f8 0f0d          	clr	(OFST+1,sp)
4045  00fa ac720072      	jra	L1711
4046  00fe               L5621:
4047                     ; 1008 	else if( key == 4 )		
4049  00fe a104          	cp	a,#4
4050  0100 266c          	jrne	L1721
4051                     ; 1010 		lcd_blink_npos_clear();
4053  0102 8d000000      	callf	f_lcd_blink_npos_clear
4055                     ; 1011 		STATUS_NEXT(next);	
4057  0106 7b0e          	ld	a,(OFST+2,sp)
4058  0108 8db401b4      	callf	LC022
4059                     ; 1012 		for( i=0; i<8; i++ )
4062  010c 0f0c          	clr	(OFST+0,sp)
4063  010e               L3721:
4064                     ; 1013 			b[i] = 0;
4066  010e 96            	ldw	x,sp
4067  010f 1c0004        	addw	x,#OFST-8
4068  0112 9f            	ld	a,xl
4069  0113 5e            	swapw	x
4070  0114 1b0c          	add	a,(OFST+0,sp)
4071  0116 2401          	jrnc	L036
4072  0118 5c            	incw	x
4073  0119               L036:
4074  0119 02            	rlwa	x,a
4075  011a 7f            	clr	(x)
4076                     ; 1012 		for( i=0; i<8; i++ )
4078  011b 0c0c          	inc	(OFST+0,sp)
4081  011d 7b0c          	ld	a,(OFST+0,sp)
4082  011f a108          	cp	a,#8
4083  0121 25eb          	jrult	L3721
4084                     ; 1014 		for( i=0; i<8; i++ )
4086  0123 4f            	clr	a
4087  0124 6b0c          	ld	(OFST+0,sp),a
4088  0126               L1031:
4089                     ; 1016 			if( uiInfoSet.valve_sub_rc[i] != 0 )
4091  0126 5f            	clrw	x
4092  0127 97            	ld	xl,a
4093  0128 724d0095      	tnz	(_uiInfoSet+39,x)
4094  012c 2714          	jreq	L7031
4095                     ; 1017 				b[uiInfoSet.valve_sub_rc[i]-1] = 1;
4097  012e 96            	ldw	x,sp
4098  012f 1c0004        	addw	x,#OFST-8
4099  0132 1f01          	ldw	(OFST-11,sp),x
4100  0134 5f            	clrw	x
4101  0135 97            	ld	xl,a
4102  0136 d60095        	ld	a,(_uiInfoSet+39,x)
4103  0139 5f            	clrw	x
4104  013a 97            	ld	xl,a
4105  013b 5a            	decw	x
4106  013c 72fb01        	addw	x,(OFST-11,sp)
4107  013f a601          	ld	a,#1
4108  0141 f7            	ld	(x),a
4109  0142               L7031:
4110                     ; 1014 		for( i=0; i<8; i++ )
4112  0142 0c0c          	inc	(OFST+0,sp)
4115  0144 7b0c          	ld	a,(OFST+0,sp)
4116  0146 a108          	cp	a,#8
4117  0148 25dc          	jrult	L1031
4118                     ; 1019 		j = 0;
4120  014a 0f03          	clr	(OFST-9,sp)
4121                     ; 1020 		for( i=0; i<8; i++ )
4123  014c 0f0c          	clr	(OFST+0,sp)
4124  014e               L1131:
4125                     ; 1022 			if( b[i] != 0 )
4127  014e 96            	ldw	x,sp
4128  014f 1c0004        	addw	x,#OFST-8
4129  0152 9f            	ld	a,xl
4130  0153 5e            	swapw	x
4131  0154 1b0c          	add	a,(OFST+0,sp)
4132  0156 2401          	jrnc	L236
4133  0158 5c            	incw	x
4134  0159               L236:
4135  0159 02            	rlwa	x,a
4136  015a f6            	ld	a,(x)
4137  015b 2702          	jreq	L7131
4138                     ; 1023 				j++;
4140  015d 0c03          	inc	(OFST-9,sp)
4141  015f               L7131:
4142                     ; 1020 		for( i=0; i<8; i++ )
4144  015f 0c0c          	inc	(OFST+0,sp)
4147  0161 7b0c          	ld	a,(OFST+0,sp)
4148  0163 a108          	cp	a,#8
4149  0165 25e7          	jrult	L1131
4150                     ; 1025 		uiInfoSet.cnt_sub = j;
4152  0167 7b03          	ld	a,(OFST-9,sp)
4153  0169 c70071        	ld	_uiInfoSet+3,a
4155  016c 203d          	jra	L3621
4156  016e               L1721:
4157                     ; 1027 	else if( key == 8 )
4159  016e a108          	cp	a,#8
4160  0170 261c          	jrne	L3231
4161                     ; 1029 		uiInfoSet.valve_sub_rc[UI_RIDs]++;
4163  0172 8dae01ae      	callf	LC021
4164  0176 724c0095      	inc	(_uiInfoSet+39,x)
4165                     ; 1030 		if( uiInfoSet.valve_sub_rc[UI_RIDs] > 8 )
4167  017a 5f            	clrw	x
4168  017b 97            	ld	xl,a
4169  017c d60095        	ld	a,(_uiInfoSet+39,x)
4170  017f a109          	cp	a,#9
4171  0181 2522          	jrult	L3331
4172                     ; 1031 			uiInfoSet.valve_sub_rc[UI_RIDs] = 1;
4174  0183 8dae01ae      	callf	LC021
4175  0187 a601          	ld	a,#1
4176  0189 d70095        	ld	(_uiInfoSet+39,x),a
4177                     ; 1038 		STATUS_NEXT(prev);
4182  018c 2017          	jpf	L3331
4183  018e               L3231:
4184                     ; 1040 	else if( key == 1 )
4186  018e 4a            	dec	a
4187  018f 261a          	jrne	L3621
4188                     ; 1042 		lcd_blink_npos_clear();
4190  0191 8d000000      	callf	f_lcd_blink_npos_clear
4192                     ; 1043 		UI_RIDs++;
4194  0195 725c00a1      	inc	_uiInfoSet+51
4195                     ; 1044 		if( UI_RIDs >= uiInfoSet.valve_sub )
4197  0199 c600a1        	ld	a,_uiInfoSet+51
4198  019c c10076        	cp	a,_uiInfoSet+8
4199  019f 2504          	jrult	L3331
4200                     ; 1045 			UI_RIDs = 0;
4202  01a1 725f00a1      	clr	_uiInfoSet+51
4203  01a5               L3331:
4204                     ; 1046 		STATUS_NEXT(prev);
4211  01a5 7b12          	ld	a,(OFST+6,sp)
4212  01a7 8db401b4      	callf	LC022
4214  01ab               L3621:
4215                     ; 1048 }
4218  01ab 5b0e          	addw	sp,#14
4219  01ad 87            	retf	
4220  01ae               LC021:
4221  01ae c600a1        	ld	a,_uiInfoSet+51
4222  01b1 5f            	clrw	x
4223  01b2 97            	ld	xl,a
4224  01b3 87            	retf	
4225  01b4               LC022:
4226  01b4 c70014        	ld	__ds,a
4228  01b7 725f0015      	clr	__dsCount
4230  01bb 35ff0016      	mov	__dsPrev,#255
4231  01bf 87            	retf	
4313                     ; 1050 void	disp_status_valveinfo(uint8_t key, uint8_t next, uint8_t prev)
4313                     ; 1051 {
4314                     .text:	section	.text,new
4315  0000               f_disp_status_valveinfo:
4317  0000 89            	pushw	x
4318  0001 520c          	subw	sp,#12
4319       0000000c      OFST:	set	12
4322                     ; 1054 	if( uiInfoSet.controlMode==1 )
4324  0003 c60074        	ld	a,_uiInfoSet+6
4325  0006 4a            	dec	a
4326  0007 260f          	jrne	L7631
4327                     ; 1056 		disp_status_valveinfo_sub(key, next, prev);
4329  0009 7b12          	ld	a,(OFST+6,sp)
4330  000b 88            	push	a
4331  000c 7b0e          	ld	a,(OFST+2,sp)
4332  000e 95            	ld	xh,a
4333  000f 8d000000      	callf	f_disp_status_valveinfo_sub
4335  0013 84            	pop	a
4336                     ; 1057 		return;
4338  0014 accf01cf      	jra	L1341
4339  0018               L7631:
4340                     ; 1059 	if( _dsCount == 0 )
4342  0018 c60015        	ld	a,__dsCount
4343  001b 266b          	jrne	L5331
4344                     ; 1061 		if( uiInfoSet.valve == 0 )
4346  001d 725d0075      	tnz	_uiInfoSet+7
4347  0021 260c          	jrne	L3731
4348                     ; 1063 			uiInfoSet.cnt = 0;
4350  0023 c70070        	ld	_uiInfoSet+2,a
4351                     ; 1064 			uiInfoSet.lpmType = 0;
4353  0026 c7007b        	ld	_uiInfoSet+13,a
4354                     ; 1065 			STATUS_NEXT(next);	
4356  0029 7b0e          	ld	a,(OFST+2,sp)
4357  002b 8dd801d8      	callf	LC026
4359  002f               L3731:
4360                     ; 1067 		disp_next();
4362  002f 8d000000      	callf	f_disp_next
4364                     ; 1068 		lcd_disp_n(0, UI_RID+1);
4366  0033 c6009f        	ld	a,_uiInfoSet+49
4367  0036 4c            	inc	a
4368  0037 97            	ld	xl,a
4369  0038 4f            	clr	a
4370  0039 95            	ld	xh,a
4371  003a 8d000000      	callf	f_lcd_disp_n
4373                     ; 1069 		lcd_blink_npos(UI_RID+1);
4375  003e c6009f        	ld	a,_uiInfoSet+49
4376  0041 4c            	inc	a
4377  0042 8d000000      	callf	f_lcd_blink_npos
4379                     ; 1070 		_ui_ = uiInfoSet.valve_rc[UI_RID];
4381  0046 8dd201d2      	callf	LC025
4382  004a d60085        	ld	a,(_uiInfoSet+23,x)
4383  004d c70019        	ld	__ui_,a
4384                     ; 1071 		lcd_disp_rid(_ui_, 1, 0);
4386  0050 4b00          	push	#0
4387  0052 ae0001        	ldw	x,#1
4388  0055 95            	ld	xh,a
4389  0056 8d000000      	callf	f_lcd_disp_rid
4391  005a 84            	pop	a
4392                     ; 1072 		for( i=0; i<8; i++ )
4394  005b 4f            	clr	a
4395  005c 6b0c          	ld	(OFST+0,sp),a
4396  005e               L5731:
4397                     ; 1074 			if( i >= uiInfoSet.valve )
4399  005e c10075        	cp	a,_uiInfoSet+7
4400  0061 5f            	clrw	x
4401  0062 97            	ld	xl,a
4402  0063 250c          	jrult	L3041
4403                     ; 1076 				uiInfoSet.valve_len[i] = 0;
4405  0065 724f007d      	clr	(_uiInfoSet+15,x)
4406                     ; 1077 				uiInfoSet.valve_rc[i] = 0;
4408  0069 5f            	clrw	x
4409  006a 97            	ld	xl,a
4410  006b 724f0085      	clr	(_uiInfoSet+23,x)
4412  006f 200d          	jra	L5041
4413  0071               L3041:
4414                     ; 1081 				if( uiInfoSet.valve_rc[i] == 0 )
4416  0071 724d0085      	tnz	(_uiInfoSet+23,x)
4417  0075 2607          	jrne	L5041
4418                     ; 1082 					uiInfoSet.valve_rc[i] = 1;
4420  0077 5f            	clrw	x
4421  0078 97            	ld	xl,a
4422  0079 a601          	ld	a,#1
4423  007b d70085        	ld	(_uiInfoSet+23,x),a
4424  007e               L5041:
4425                     ; 1072 		for( i=0; i<8; i++ )
4427  007e 0c0c          	inc	(OFST+0,sp)
4430  0080 7b0c          	ld	a,(OFST+0,sp)
4431  0082 a108          	cp	a,#8
4432  0084 25d8          	jrult	L5731
4434  0086 2072          	jra	L1141
4435  0088               L5331:
4436                     ; 1088 EncEntry:		
4436                     ; 1089 		i = uiInfoSet.valve_len[UI_RID];
4438  0088 8dd201d2      	callf	LC025
4439  008c d6007d        	ld	a,(_uiInfoSet+15,x)
4440  008f 6b0c          	ld	(OFST+0,sp),a
4441                     ; 1090 		if( uiInfo.enc != 0 )
4443  0091 c60001        	ld	a,_uiInfo
4444  0094 2725          	jreq	L3141
4445                     ; 1092 			if( (uiInfo.enc & 0x40) == 0 )	i--;
4447  0096 a540          	bcp	a,#64
4448  0098 2604          	jrne	L5141
4451  009a 0a0c          	dec	(OFST+0,sp)
4453  009c 2002          	jra	L7141
4454  009e               L5141:
4455                     ; 1094 				i++;
4457  009e 0c0c          	inc	(OFST+0,sp)
4458  00a0               L7141:
4459                     ; 1095 			if( i > 150 )	i = 35;
4461  00a0 7b0c          	ld	a,(OFST+0,sp)
4462  00a2 a197          	cp	a,#151
4463  00a4 2504          	jrult	L1241
4466  00a6 a623          	ld	a,#35
4467  00a8 6b0c          	ld	(OFST+0,sp),a
4468  00aa               L1241:
4469                     ; 1096 			if( i < 35 )	i = 150;
4471  00aa a123          	cp	a,#35
4472  00ac 2404          	jruge	L3241
4475  00ae a696          	ld	a,#150
4476  00b0 6b0c          	ld	(OFST+0,sp),a
4477  00b2               L3241:
4478                     ; 1097 			uiInfoSet.valve_len[UI_RID] = i;
4480  00b2 8dd201d2      	callf	LC025
4481  00b6 7b0c          	ld	a,(OFST+0,sp)
4482  00b8 d7007d        	ld	(_uiInfoSet+15,x),a
4483  00bb               L3141:
4484                     ; 1099 		if( _dsPrev != i )
4486  00bb c60016        	ld	a,__dsPrev
4487  00be 110c          	cp	a,(OFST+0,sp)
4488  00c0 2738          	jreq	L1141
4489                     ; 1101 			_dsPrev = i;
4491  00c2 7b0c          	ld	a,(OFST+0,sp)
4492  00c4 c70016        	ld	__dsPrev,a
4493                     ; 1102 			UI_DISP_3Digit(i);
4495  00c7 5f            	clrw	x
4496  00c8 97            	ld	xl,a
4497  00c9 a664          	ld	a,#100
4498  00cb 62            	div	x,a
4499  00cc a601          	ld	a,#1
4500  00ce 95            	ld	xh,a
4501  00cf 8d000000      	callf	f_lcd_disp_n
4505  00d3 7b0c          	ld	a,(OFST+0,sp)
4506  00d5 5f            	clrw	x
4507  00d6 97            	ld	xl,a
4508  00d7 a664          	ld	a,#100
4509  00d9 62            	div	x,a
4510  00da 5f            	clrw	x
4511  00db 97            	ld	xl,a
4512  00dc 01            	rrwa	x,a
4513  00dd 6b0c          	ld	(OFST+0,sp),a
4516  00df 5f            	clrw	x
4517  00e0 97            	ld	xl,a
4518  00e1 a60a          	ld	a,#10
4519  00e3 62            	div	x,a
4520  00e4 a602          	ld	a,#2
4521  00e6 95            	ld	xh,a
4522  00e7 8d000000      	callf	f_lcd_disp_n
4526  00eb 7b0c          	ld	a,(OFST+0,sp)
4527  00ed 5f            	clrw	x
4528  00ee 97            	ld	xl,a
4529  00ef a60a          	ld	a,#10
4530  00f1 62            	div	x,a
4531  00f2 97            	ld	xl,a
4532  00f3 a603          	ld	a,#3
4533  00f5 95            	ld	xh,a
4534  00f6 8d000000      	callf	f_lcd_disp_n
4537  00fa               L1141:
4538                     ; 1105 	if( key == 0x10 )		__DN
4540  00fa 7b0d          	ld	a,(OFST+1,sp)
4541  00fc a110          	cp	a,#16
4542  00fe 2606          	jrne	L7241
4545  0100 35400001      	mov	_uiInfo,#64
4549  0104 2008          	jpf	LC023
4550  0106               L7241:
4551                     ; 1106 	else if( key == 0x20 )	__UP
4553  0106 a120          	cp	a,#32
4554  0108 260a          	jrne	L3341
4557  010a 35010001      	mov	_uiInfo,#1
4560  010e               LC023:
4562  010e 0f0d          	clr	(OFST+1,sp)
4565  0110 ac880088      	jra	L5331
4566  0114               L3341:
4567                     ; 1107 	else if( key == 4 )		
4569  0114 a104          	cp	a,#4
4570  0116 266c          	jrne	L7341
4571                     ; 1109 		lcd_blink_npos_clear();
4573  0118 8d000000      	callf	f_lcd_blink_npos_clear
4575                     ; 1110 		STATUS_NEXT(next);	
4577  011c 7b0e          	ld	a,(OFST+2,sp)
4578  011e 8dd801d8      	callf	LC026
4579                     ; 1111 		for( i=0; i<8; i++ )
4582  0122 0f0c          	clr	(OFST+0,sp)
4583  0124               L1441:
4584                     ; 1112 			b[i] = 0;
4586  0124 96            	ldw	x,sp
4587  0125 1c0004        	addw	x,#OFST-8
4588  0128 9f            	ld	a,xl
4589  0129 5e            	swapw	x
4590  012a 1b0c          	add	a,(OFST+0,sp)
4591  012c 2401          	jrnc	L266
4592  012e 5c            	incw	x
4593  012f               L266:
4594  012f 02            	rlwa	x,a
4595  0130 7f            	clr	(x)
4596                     ; 1111 		for( i=0; i<8; i++ )
4598  0131 0c0c          	inc	(OFST+0,sp)
4601  0133 7b0c          	ld	a,(OFST+0,sp)
4602  0135 a108          	cp	a,#8
4603  0137 25eb          	jrult	L1441
4604                     ; 1113 		for( i=0; i<8; i++ )
4606  0139 4f            	clr	a
4607  013a 6b0c          	ld	(OFST+0,sp),a
4608  013c               L7441:
4609                     ; 1115 			if( uiInfoSet.valve_rc[i] != 0 )
4611  013c 5f            	clrw	x
4612  013d 97            	ld	xl,a
4613  013e 724d0085      	tnz	(_uiInfoSet+23,x)
4614  0142 2714          	jreq	L5541
4615                     ; 1116 				b[uiInfoSet.valve_rc[i]-1] = 1;
4617  0144 96            	ldw	x,sp
4618  0145 1c0004        	addw	x,#OFST-8
4619  0148 1f01          	ldw	(OFST-11,sp),x
4620  014a 5f            	clrw	x
4621  014b 97            	ld	xl,a
4622  014c d60085        	ld	a,(_uiInfoSet+23,x)
4623  014f 5f            	clrw	x
4624  0150 97            	ld	xl,a
4625  0151 5a            	decw	x
4626  0152 72fb01        	addw	x,(OFST-11,sp)
4627  0155 a601          	ld	a,#1
4628  0157 f7            	ld	(x),a
4629  0158               L5541:
4630                     ; 1113 		for( i=0; i<8; i++ )
4632  0158 0c0c          	inc	(OFST+0,sp)
4635  015a 7b0c          	ld	a,(OFST+0,sp)
4636  015c a108          	cp	a,#8
4637  015e 25dc          	jrult	L7441
4638                     ; 1118 		j = 0;
4640  0160 0f03          	clr	(OFST-9,sp)
4641                     ; 1119 		for( i=0; i<8; i++ )
4643  0162 0f0c          	clr	(OFST+0,sp)
4644  0164               L7541:
4645                     ; 1121 			if( b[i] != 0 )
4647  0164 96            	ldw	x,sp
4648  0165 1c0004        	addw	x,#OFST-8
4649  0168 9f            	ld	a,xl
4650  0169 5e            	swapw	x
4651  016a 1b0c          	add	a,(OFST+0,sp)
4652  016c 2401          	jrnc	L466
4653  016e 5c            	incw	x
4654  016f               L466:
4655  016f 02            	rlwa	x,a
4656  0170 f6            	ld	a,(x)
4657  0171 2702          	jreq	L5641
4658                     ; 1122 				j++;
4660  0173 0c03          	inc	(OFST-9,sp)
4661  0175               L5641:
4662                     ; 1119 		for( i=0; i<8; i++ )
4664  0175 0c0c          	inc	(OFST+0,sp)
4667  0177 7b0c          	ld	a,(OFST+0,sp)
4668  0179 a108          	cp	a,#8
4669  017b 25e7          	jrult	L7541
4670                     ; 1124 		uiInfoSet.cnt = j;
4672  017d 7b03          	ld	a,(OFST-9,sp)
4673  017f c70070        	ld	_uiInfoSet+2,a
4675  0182 204b          	jra	L1341
4676  0184               L7341:
4677                     ; 1126 	else if( key == 8 )
4679  0184 a108          	cp	a,#8
4680  0186 262a          	jrne	L1741
4681                     ; 1128 		uiInfoSet.valve_rc[UI_RID]++;
4683  0188 8dd201d2      	callf	LC025
4684  018c 724c0085      	inc	(_uiInfoSet+23,x)
4685                     ; 1129 		if( uiInfoSet.valve+1 == uiInfoSet.valve_rc[UI_RID] )
4687  0190 5f            	clrw	x
4688  0191 97            	ld	xl,a
4689  0192 d60085        	ld	a,(_uiInfoSet+23,x)
4690  0195 5f            	clrw	x
4691  0196 97            	ld	xl,a
4692  0197 c60075        	ld	a,_uiInfoSet+7
4693  019a 905f          	clrw	y
4694  019c 9097          	ld	yl,a
4695  019e bf00          	ldw	c_x,x
4696  01a0 905c          	incw	y
4697  01a2 90b300        	cpw	y,c_x
4698  01a5 2622          	jrne	L1051
4699                     ; 1130 			uiInfoSet.valve_rc[UI_RID] = 1;
4701  01a7 8dd201d2      	callf	LC025
4702  01ab a601          	ld	a,#1
4703  01ad d70085        	ld	(_uiInfoSet+23,x),a
4704                     ; 1131 		STATUS_NEXT(prev);
4709  01b0 2017          	jpf	L1051
4710  01b2               L1741:
4711                     ; 1133 	else if( key == 1 )
4713  01b2 4a            	dec	a
4714  01b3 261a          	jrne	L1341
4715                     ; 1135 		lcd_blink_npos_clear();
4717  01b5 8d000000      	callf	f_lcd_blink_npos_clear
4719                     ; 1136 		UI_RID++;
4721  01b9 725c009f      	inc	_uiInfoSet+49
4722                     ; 1137 		if( UI_RID == uiInfoSet.valve )
4724  01bd c6009f        	ld	a,_uiInfoSet+49
4725  01c0 c10075        	cp	a,_uiInfoSet+7
4726  01c3 2604          	jrne	L1051
4727                     ; 1138 			UI_RID = 0;
4729  01c5 725f009f      	clr	_uiInfoSet+49
4730  01c9               L1051:
4731                     ; 1139 		STATUS_NEXT(prev);
4738  01c9 7b12          	ld	a,(OFST+6,sp)
4739  01cb 8dd801d8      	callf	LC026
4741  01cf               L1341:
4742                     ; 1141 }
4745  01cf 5b0e          	addw	sp,#14
4746  01d1 87            	retf	
4747  01d2               LC025:
4748  01d2 c6009f        	ld	a,_uiInfoSet+49
4749  01d5 5f            	clrw	x
4750  01d6 97            	ld	xl,a
4751  01d7 87            	retf	
4752  01d8               LC026:
4753  01d8 c70014        	ld	__ds,a
4755  01db 725f0015      	clr	__dsCount
4757  01df 35ff0016      	mov	__dsPrev,#255
4758  01e3 87            	retf	
4811                     ; 1143 void	disp_status_plc(uint8_t key, uint8_t next)
4811                     ; 1144 {
4812                     .text:	section	.text,new
4813  0000               f_disp_status_plc:
4815  0000 89            	pushw	x
4816  0001 88            	push	a
4817       00000001      OFST:	set	1
4820                     ; 1171 	if( _dsCount == 0 )
4822  0002 c60015        	ld	a,__dsCount
4823  0005 260d          	jrne	L3051
4824                     ; 1173 		disp_next();
4826  0007 8d000000      	callf	f_disp_next
4828                     ; 1174 		lcd_disp_plc();
4830  000b 8d000000      	callf	f_lcd_disp_plc
4832                     ; 1175 		lcd_disp_n(3, uiInfoSet.plc);
4834  000f c600a3        	ld	a,_uiInfoSet+53
4837  0012 2039          	jpf	LC028
4838  0014               L3051:
4839                     ; 1179 EncEntry:
4839                     ; 1180 		i = uiInfoSet.plc;
4841  0014 c600a3        	ld	a,_uiInfoSet+53
4842  0017 6b01          	ld	(OFST+0,sp),a
4843                     ; 1181 		if( uiInfo.enc != 0 )
4845  0019 c60001        	ld	a,_uiInfo
4846  001c 2723          	jreq	L1351
4847                     ; 1184 			if( (uiInfo.enc & 0x40) == 0 )
4849  001e a540          	bcp	a,#64
4850  0020 260e          	jrne	L3351
4851                     ; 1186 				if( i != 0 )
4853  0022 7b01          	ld	a,(OFST+0,sp)
4854  0024 2704          	jreq	L5351
4855                     ; 1187 					i--;
4857  0026 0a01          	dec	(OFST+0,sp)
4859  0028 2012          	jra	L1451
4860  002a               L5351:
4861                     ; 1189 					i = _ID_MAX+1;
4863  002a a609          	ld	a,#9
4864  002c 6b01          	ld	(OFST+0,sp),a
4865  002e 200c          	jra	L1451
4866  0030               L3351:
4867                     ; 1193 				if( i != _ID_MAX+1 )
4869  0030 7b01          	ld	a,(OFST+0,sp)
4870  0032 a109          	cp	a,#9
4871  0034 2704          	jreq	L3451
4872                     ; 1194 					i++;
4874  0036 0c01          	inc	(OFST+0,sp)
4876  0038 2002          	jra	L1451
4877  003a               L3451:
4878                     ; 1196 					i = 0;
4880  003a 0f01          	clr	(OFST+0,sp)
4881  003c               L1451:
4882                     ; 1198 			uiInfoSet.plc = i;
4884  003c 7b01          	ld	a,(OFST+0,sp)
4885  003e c700a3        	ld	_uiInfoSet+53,a
4886  0041               L1351:
4887                     ; 1200 		if( _dsPrev != i )
4889  0041 c60016        	ld	a,__dsPrev
4890  0044 1101          	cp	a,(OFST+0,sp)
4891  0046 270d          	jreq	L7251
4892                     ; 1202 			_dsPrev = i;
4894  0048 7b01          	ld	a,(OFST+0,sp)
4895  004a c70016        	ld	__dsPrev,a
4896                     ; 1203 			lcd_disp_n(3, i);
4898  004d               LC028:
4899  004d 97            	ld	xl,a
4900  004e a603          	ld	a,#3
4901  0050 95            	ld	xh,a
4902  0051 8d000000      	callf	f_lcd_disp_n
4904  0055               L7251:
4905                     ; 1206 	if( key == 4 )		
4907  0055 7b02          	ld	a,(OFST+1,sp)
4908  0057 a104          	cp	a,#4
4909  0059 260f          	jrne	L1551
4910                     ; 1208 		STATUS_NEXT(next);	
4912  005b 7b03          	ld	a,(OFST+2,sp)
4913  005d c70014        	ld	__ds,a
4916  0060 725f0015      	clr	__dsCount
4919  0064 35ff0016      	mov	__dsPrev,#255
4922  0068 2016          	jra	L3551
4923  006a               L1551:
4924                     ; 1210 	else if( key == 0x10 )	__DN
4926  006a a110          	cp	a,#16
4927  006c 2606          	jrne	L5551
4930  006e 35400001      	mov	_uiInfo,#64
4934  0072 2008          	jpf	LC027
4935  0074               L5551:
4936                     ; 1211 	else if( key == 0x20 )	__UP
4938  0074 a120          	cp	a,#32
4939  0076 2608          	jrne	L3551
4942  0078 35010001      	mov	_uiInfo,#1
4945  007c               LC027:
4947  007c 0f02          	clr	(OFST+1,sp)
4950  007e 2094          	jra	L3051
4951  0080               L3551:
4952                     ; 1212 }
4955  0080 5b03          	addw	sp,#3
4956  0082 87            	retf	
4958                     	switch	.data
4959  001a               ___func_rc_timerout:
4960  001a 00            	dc.b	0
4961  001b               ___func_rc_timerout1:
4962  001b 00            	dc.b	0
4963  001c               ___func_rc_timerout2:
4964  001c 00            	dc.b	0
5022                     ; 1221 uint8_t	disp_status_run(uint8_t key, uint8_t next, uint8_t prev)
5022                     ; 1222 {
5023                     .text:	section	.text,new
5024  0000               f_disp_status_run:
5026  0000 89            	pushw	x
5027       00000000      OFST:	set	0
5030                     ; 1224 	if( _dsCount == 0 )
5032  0001 c60015        	ld	a,__dsCount
5033  0004 2608          	jrne	L3061
5034                     ; 1226 		disp_next();
5036  0006 8d000000      	callf	f_disp_next
5038                     ; 1229 		lcd_disp_setup_run();
5040  000a 8d000000      	callf	f_lcd_disp_setup_run
5042  000e               L3061:
5043                     ; 1231 	if( key == 4 )	
5045  000e 7b01          	ld	a,(OFST+1,sp)
5046  0010 a104          	cp	a,#4
5047  0012 2704ac3b023b  	jrne	L5061
5048                     ; 1233 		copy_infoSet();
5050  0018 8d000000      	callf	f_copy_infoSet
5052                     ; 1234 		FW_MODE(uiInfo.mode);
5054  001c c60009        	ld	a,_uiInfo+8
5055  001f 97            	ld	xl,a
5056  0020 a609          	ld	a,#9
5057  0022 95            	ld	xh,a
5058  0023 8d000000      	callf	f_file_write
5060                     ; 1235 		FW_ID(uiInfo.id);
5062  0027 c60005        	ld	a,_uiInfo+4
5063  002a 97            	ld	xl,a
5064  002b a60a          	ld	a,#10
5065  002d 95            	ld	xh,a
5066  002e 8d000000      	callf	f_file_write
5068                     ; 1236 		FW_TOFFSET(uiInfo.tOffset);
5070  0032 c60012        	ld	a,_uiInfo+17
5071  0035 97            	ld	xl,a
5072  0036 a614          	ld	a,#20
5073  0038 95            	ld	xh,a
5074  0039 8d000000      	callf	f_file_write
5076                     ; 1237 		if( uiInfo.mode == 1 )
5078  003d c60009        	ld	a,_uiInfo+8
5079  0040 4a            	dec	a
5080  0041 2704ac2a022a  	jrne	L7061
5081                     ; 1239 			func_rc_setting();
5083  0047 8d000000      	callf	f_func_rc_setting
5085                     ; 1240 			__func_rc_timerout = 6;
5087  004b 3506001a      	mov	___func_rc_timerout,#6
5088                     ; 1241 			FW_CNTLMODE(uiInfo.cntlMode);
5090  004f c60004        	ld	a,_uiInfo+3
5091  0052 97            	ld	xl,a
5092  0053 a608          	ld	a,#8
5093  0055 95            	ld	xh,a
5094  0056 8d000000      	callf	f_file_write
5096                     ; 1242 			FW_VALVE(uiInfo.valve);
5098  005a c6000b        	ld	a,_uiInfo+10
5099  005d 97            	ld	xl,a
5100  005e a60e          	ld	a,#14
5101  0060 95            	ld	xh,a
5102  0061 8d000000      	callf	f_file_write
5104                     ; 1243 			FW_VALVE_SUB(uiInfo.valve_sub);
5106  0065 c6000c        	ld	a,_uiInfo+11
5107  0068 97            	ld	xl,a
5108  0069 a62c          	ld	a,#44
5109  006b 95            	ld	xh,a
5110  006c 8d000000      	callf	f_file_write
5112                     ; 1244 			FW_CNT(uiInfo.cnt);
5114  0070 c60006        	ld	a,_uiInfo+5
5115  0073 97            	ld	xl,a
5116  0074 a60b          	ld	a,#11
5117  0076 95            	ld	xh,a
5118  0077 8d000000      	callf	f_file_write
5120                     ; 1245 			FW_CNT_SUB(uiInfo.cnt_sub);
5122  007b c60007        	ld	a,_uiInfo+6
5123  007e 97            	ld	xl,a
5124  007f a62b          	ld	a,#43
5125  0081 95            	ld	xh,a
5126  0082 8d000000      	callf	f_file_write
5128                     ; 1246 			FW_CNT_MODE(uiInfo.controlMode);
5130  0086 c6000a        	ld	a,_uiInfo+9
5131  0089 97            	ld	xl,a
5132  008a a60d          	ld	a,#13
5133  008c 95            	ld	xh,a
5134  008d 8d000000      	callf	f_file_write
5136                     ; 1247 			FW_OPMODE(uiInfo.opMode);
5138  0091 c60008        	ld	a,_uiInfo+7
5139  0094 97            	ld	xl,a
5140  0095 a60c          	ld	a,#12
5141  0097 95            	ld	xh,a
5142  0098 8d000000      	callf	f_file_write
5144                     ; 1248 			FW_POTYPE(uiInfo.poType);
5146  009c c60010        	ld	a,_uiInfo+15
5147  009f 97            	ld	xl,a
5148  00a0 a612          	ld	a,#18
5149  00a2 95            	ld	xh,a
5150  00a3 8d000000      	callf	f_file_write
5152                     ; 1249 			FW_HOUSECAPA(uiInfo.houseCapa);
5154  00a7 c60011        	ld	a,_uiInfo+16
5155  00aa 97            	ld	xl,a
5156  00ab a613          	ld	a,#19
5157  00ad 95            	ld	xh,a
5158  00ae 8d000000      	callf	f_file_write
5160                     ; 1250 			FW_LPM(uiInfo.lpmType);
5162  00b2 c60014        	ld	a,_uiInfo+19
5163  00b5 97            	ld	xl,a
5164  00b6 a628          	ld	a,#40
5165  00b8 95            	ld	xh,a
5166  00b9 8d000000      	callf	f_file_write
5168                     ; 1251 			FW_TEMPOFFSET(uiInfo.tempOffset);
5170  00bd c60013        	ld	a,_uiInfo+18
5171  00c0 97            	ld	xl,a
5172  00c1 a627          	ld	a,#39
5173  00c3 95            	ld	xh,a
5174  00c4 8d000000      	callf	f_file_write
5176                     ; 1253 			FW_VALVE_INFOS
5178  00c8 c60016        	ld	a,_uiInfo+21
5179  00cb 97            	ld	xl,a
5180  00cc a615          	ld	a,#21
5181  00ce 95            	ld	xh,a
5182  00cf 8d000000      	callf	f_file_write
5186  00d3 c60017        	ld	a,_uiInfo+22
5187  00d6 97            	ld	xl,a
5188  00d7 a616          	ld	a,#22
5189  00d9 95            	ld	xh,a
5190  00da 8d000000      	callf	f_file_write
5194  00de c60018        	ld	a,_uiInfo+23
5195  00e1 97            	ld	xl,a
5196  00e2 a617          	ld	a,#23
5197  00e4 95            	ld	xh,a
5198  00e5 8d000000      	callf	f_file_write
5202  00e9 c60019        	ld	a,_uiInfo+24
5203  00ec 97            	ld	xl,a
5204  00ed a618          	ld	a,#24
5205  00ef 95            	ld	xh,a
5206  00f0 8d000000      	callf	f_file_write
5210  00f4 c6001a        	ld	a,_uiInfo+25
5211  00f7 97            	ld	xl,a
5212  00f8 a619          	ld	a,#25
5213  00fa 95            	ld	xh,a
5214  00fb 8d000000      	callf	f_file_write
5218  00ff c6001b        	ld	a,_uiInfo+26
5219  0102 97            	ld	xl,a
5220  0103 a61a          	ld	a,#26
5221  0105 95            	ld	xh,a
5222  0106 8d000000      	callf	f_file_write
5226  010a c6001c        	ld	a,_uiInfo+27
5227  010d 97            	ld	xl,a
5228  010e a61b          	ld	a,#27
5229  0110 95            	ld	xh,a
5230  0111 8d000000      	callf	f_file_write
5234  0115 c6001d        	ld	a,_uiInfo+28
5235  0118 97            	ld	xl,a
5236  0119 a61c          	ld	a,#28
5237  011b 95            	ld	xh,a
5238  011c 8d000000      	callf	f_file_write
5242  0120 c60026        	ld	a,_uiInfo+37
5243  0123 97            	ld	xl,a
5244  0124 a62e          	ld	a,#46
5245  0126 95            	ld	xh,a
5246  0127 8d000000      	callf	f_file_write
5250  012b c60027        	ld	a,_uiInfo+38
5251  012e 97            	ld	xl,a
5252  012f a62f          	ld	a,#47
5253  0131 95            	ld	xh,a
5254  0132 8d000000      	callf	f_file_write
5258  0136 c60028        	ld	a,_uiInfo+39
5259  0139 97            	ld	xl,a
5260  013a a630          	ld	a,#48
5261  013c 95            	ld	xh,a
5262  013d 8d000000      	callf	f_file_write
5266  0141 c60029        	ld	a,_uiInfo+40
5267  0144 97            	ld	xl,a
5268  0145 a631          	ld	a,#49
5269  0147 95            	ld	xh,a
5270  0148 8d000000      	callf	f_file_write
5274  014c c6002a        	ld	a,_uiInfo+41
5275  014f 97            	ld	xl,a
5276  0150 a632          	ld	a,#50
5277  0152 95            	ld	xh,a
5278  0153 8d000000      	callf	f_file_write
5282  0157 c6002b        	ld	a,_uiInfo+42
5283  015a 97            	ld	xl,a
5284  015b a633          	ld	a,#51
5285  015d 95            	ld	xh,a
5286  015e 8d000000      	callf	f_file_write
5290  0162 c6002c        	ld	a,_uiInfo+43
5291  0165 97            	ld	xl,a
5292  0166 a634          	ld	a,#52
5293  0168 95            	ld	xh,a
5294  0169 8d000000      	callf	f_file_write
5298  016d c6002d        	ld	a,_uiInfo+44
5299  0170 97            	ld	xl,a
5300  0171 a635          	ld	a,#53
5301  0173 95            	ld	xh,a
5302  0174 8d000000      	callf	f_file_write
5304                     ; 1254 			FW_VALVE_RCINFOS
5306  0178 c6001e        	ld	a,_uiInfo+29
5307  017b 97            	ld	xl,a
5308  017c a61d          	ld	a,#29
5309  017e 95            	ld	xh,a
5310  017f 8d000000      	callf	f_file_write
5314  0183 c6001f        	ld	a,_uiInfo+30
5315  0186 97            	ld	xl,a
5316  0187 a61e          	ld	a,#30
5317  0189 95            	ld	xh,a
5318  018a 8d000000      	callf	f_file_write
5322  018e c60020        	ld	a,_uiInfo+31
5323  0191 97            	ld	xl,a
5324  0192 a61f          	ld	a,#31
5325  0194 95            	ld	xh,a
5326  0195 8d000000      	callf	f_file_write
5330  0199 c60021        	ld	a,_uiInfo+32
5331  019c 97            	ld	xl,a
5332  019d a620          	ld	a,#32
5333  019f 95            	ld	xh,a
5334  01a0 8d000000      	callf	f_file_write
5338  01a4 c60022        	ld	a,_uiInfo+33
5339  01a7 97            	ld	xl,a
5340  01a8 a621          	ld	a,#33
5341  01aa 95            	ld	xh,a
5342  01ab 8d000000      	callf	f_file_write
5346  01af c60023        	ld	a,_uiInfo+34
5347  01b2 97            	ld	xl,a
5348  01b3 a622          	ld	a,#34
5349  01b5 95            	ld	xh,a
5350  01b6 8d000000      	callf	f_file_write
5354  01ba c60024        	ld	a,_uiInfo+35
5355  01bd 97            	ld	xl,a
5356  01be a623          	ld	a,#35
5357  01c0 95            	ld	xh,a
5358  01c1 8d000000      	callf	f_file_write
5362  01c5 c60025        	ld	a,_uiInfo+36
5363  01c8 97            	ld	xl,a
5364  01c9 a624          	ld	a,#36
5365  01cb 95            	ld	xh,a
5366  01cc 8d000000      	callf	f_file_write
5370  01d0 c6002e        	ld	a,_uiInfo+45
5371  01d3 97            	ld	xl,a
5372  01d4 a636          	ld	a,#54
5373  01d6 95            	ld	xh,a
5374  01d7 8d000000      	callf	f_file_write
5378  01db c6002f        	ld	a,_uiInfo+46
5379  01de 97            	ld	xl,a
5380  01df a637          	ld	a,#55
5381  01e1 95            	ld	xh,a
5382  01e2 8d000000      	callf	f_file_write
5386  01e6 c60030        	ld	a,_uiInfo+47
5387  01e9 97            	ld	xl,a
5388  01ea a638          	ld	a,#56
5389  01ec 95            	ld	xh,a
5390  01ed 8d000000      	callf	f_file_write
5394  01f1 c60031        	ld	a,_uiInfo+48
5395  01f4 97            	ld	xl,a
5396  01f5 a639          	ld	a,#57
5397  01f7 95            	ld	xh,a
5398  01f8 8d000000      	callf	f_file_write
5402  01fc c60032        	ld	a,_uiInfo+49
5403  01ff 97            	ld	xl,a
5404  0200 a63a          	ld	a,#58
5405  0202 95            	ld	xh,a
5406  0203 8d000000      	callf	f_file_write
5410  0207 c60033        	ld	a,_uiInfo+50
5411  020a 97            	ld	xl,a
5412  020b a63b          	ld	a,#59
5413  020d 95            	ld	xh,a
5414  020e 8d000000      	callf	f_file_write
5418  0212 c60034        	ld	a,_uiInfo+51
5419  0215 97            	ld	xl,a
5420  0216 a63c          	ld	a,#60
5421  0218 95            	ld	xh,a
5422  0219 8d000000      	callf	f_file_write
5426  021d c60035        	ld	a,_uiInfo+52
5427  0220 97            	ld	xl,a
5428  0221 a63d          	ld	a,#61
5429  0223 95            	ld	xh,a
5430  0224 8d000000      	callf	f_file_write
5433  0228 2004          	jra	L1161
5434  022a               L7061:
5435                     ; 1258 			__func_rc_timerout = 4;
5437  022a 3504001a      	mov	___func_rc_timerout,#4
5438  022e               L1161:
5439                     ; 1261 		__func_rc_timerout1 = 0;
5441  022e 725f001b      	clr	___func_rc_timerout1
5442                     ; 1262 		__func_rc_timerout2 = __timer1s;
5444  0232 550000001c    	mov	___func_rc_timerout2,___timer1s
5445                     ; 1263 		STATUS_NEXT(next);	
5447  0237 7b02          	ld	a,(OFST+2,sp)
5452  0239 2012          	jpf	LC029
5453  023b               L5061:
5454                     ; 1265 	else if( key == 2 )
5456  023b a102          	cp	a,#2
5457  023d 2608          	jrne	L5161
5458                     ; 1267 		_backup_backlight = 0;
5460  023f 725f0009      	clr	__backup_backlight
5461                     ; 1269 		return 1;
5463  0243 a601          	ld	a,#1
5465  0245 2012          	jra	L2501
5466  0247               L5161:
5467                     ; 1271 	else if( key == 8 )
5469  0247 a108          	cp	a,#8
5470  0249 260d          	jrne	L3161
5471                     ; 1273 		STATUS_NEXT(prev);
5473  024b 7b06          	ld	a,(OFST+6,sp)
5478  024d               LC029:
5479  024d c70014        	ld	__ds,a
5481  0250 725f0015      	clr	__dsCount
5483  0254 35ff0016      	mov	__dsPrev,#255
5485  0258               L3161:
5486                     ; 1275 	return 0;
5488  0258 4f            	clr	a
5490  0259               L2501:
5492  0259 85            	popw	x
5493  025a 87            	retf	
5543                     ; 1278 uint8_t	disp_status_run_id(uint8_t key, uint8_t next, uint8_t prev)
5543                     ; 1279 {
5544                     .text:	section	.text,new
5545  0000               f_disp_status_run_id:
5547  0000 89            	pushw	x
5548       00000000      OFST:	set	0
5551                     ; 1281 	if( _dsCount == 0 )
5553  0001 c60015        	ld	a,__dsCount
5554  0004 2608          	jrne	L1461
5555                     ; 1283 		disp_next();
5557  0006 8d000000      	callf	f_disp_next
5559                     ; 1284 		lcd_disp_setup_run();
5561  000a 8d000000      	callf	f_lcd_disp_setup_run
5563  000e               L1461:
5564                     ; 1286 	if( key == 4 )	
5566  000e 7b01          	ld	a,(OFST+1,sp)
5567  0010 a104          	cp	a,#4
5568  0012 2704ac400240  	jrne	L3461
5569                     ; 1288 		copy_infoSet();
5571  0018 8d000000      	callf	f_copy_infoSet
5573                     ; 1289 		FW_MODE(uiInfo.mode);
5575  001c c60009        	ld	a,_uiInfo+8
5576  001f 97            	ld	xl,a
5577  0020 a609          	ld	a,#9
5578  0022 95            	ld	xh,a
5579  0023 8d000000      	callf	f_file_write
5581                     ; 1290 		FW_ID(uiInfo.id);
5583  0027 c60005        	ld	a,_uiInfo+4
5584  002a 97            	ld	xl,a
5585  002b a60a          	ld	a,#10
5586  002d 95            	ld	xh,a
5587  002e 8d000000      	callf	f_file_write
5589                     ; 1291 		FW_TOFFSET(uiInfo.tOffset);
5591  0032 c60012        	ld	a,_uiInfo+17
5592  0035 97            	ld	xl,a
5593  0036 a614          	ld	a,#20
5594  0038 95            	ld	xh,a
5595  0039 8d000000      	callf	f_file_write
5597                     ; 1293 		if( uiInfo.mode == 1 )
5599  003d c60009        	ld	a,_uiInfo+8
5600  0040 4a            	dec	a
5601  0041 2704ac260226  	jrne	L5461
5602                     ; 1296 			__func_rc_timerout = 6;
5604  0047 3506001a      	mov	___func_rc_timerout,#6
5605                     ; 1297 			FW_CNTLMODE(uiInfo.cntlMode);
5607  004b c60004        	ld	a,_uiInfo+3
5608  004e 97            	ld	xl,a
5609  004f a608          	ld	a,#8
5610  0051 95            	ld	xh,a
5611  0052 8d000000      	callf	f_file_write
5613                     ; 1298 			FW_VALVE(uiInfo.valve);
5615  0056 c6000b        	ld	a,_uiInfo+10
5616  0059 97            	ld	xl,a
5617  005a a60e          	ld	a,#14
5618  005c 95            	ld	xh,a
5619  005d 8d000000      	callf	f_file_write
5621                     ; 1299 			FW_VALVE_SUB(uiInfo.valve_sub);
5623  0061 c6000c        	ld	a,_uiInfo+11
5624  0064 97            	ld	xl,a
5625  0065 a62c          	ld	a,#44
5626  0067 95            	ld	xh,a
5627  0068 8d000000      	callf	f_file_write
5629                     ; 1300 			FW_CNT(uiInfo.cnt);
5631  006c c60006        	ld	a,_uiInfo+5
5632  006f 97            	ld	xl,a
5633  0070 a60b          	ld	a,#11
5634  0072 95            	ld	xh,a
5635  0073 8d000000      	callf	f_file_write
5637                     ; 1301 			FW_CNT_SUB(uiInfo.cnt_sub);
5639  0077 c60007        	ld	a,_uiInfo+6
5640  007a 97            	ld	xl,a
5641  007b a62b          	ld	a,#43
5642  007d 95            	ld	xh,a
5643  007e 8d000000      	callf	f_file_write
5645                     ; 1302 			FW_CNT_MODE(uiInfo.controlMode);
5647  0082 c6000a        	ld	a,_uiInfo+9
5648  0085 97            	ld	xl,a
5649  0086 a60d          	ld	a,#13
5650  0088 95            	ld	xh,a
5651  0089 8d000000      	callf	f_file_write
5653                     ; 1303 			FW_OPMODE(uiInfo.opMode);
5655  008d c60008        	ld	a,_uiInfo+7
5656  0090 97            	ld	xl,a
5657  0091 a60c          	ld	a,#12
5658  0093 95            	ld	xh,a
5659  0094 8d000000      	callf	f_file_write
5661                     ; 1304 			FW_POTYPE(uiInfo.poType);
5663  0098 c60010        	ld	a,_uiInfo+15
5664  009b 97            	ld	xl,a
5665  009c a612          	ld	a,#18
5666  009e 95            	ld	xh,a
5667  009f 8d000000      	callf	f_file_write
5669                     ; 1305 			FW_HOUSECAPA(uiInfo.houseCapa);
5671  00a3 c60011        	ld	a,_uiInfo+16
5672  00a6 97            	ld	xl,a
5673  00a7 a613          	ld	a,#19
5674  00a9 95            	ld	xh,a
5675  00aa 8d000000      	callf	f_file_write
5677                     ; 1306 			FW_LPM(uiInfo.lpmType);
5679  00ae c60014        	ld	a,_uiInfo+19
5680  00b1 97            	ld	xl,a
5681  00b2 a628          	ld	a,#40
5682  00b4 95            	ld	xh,a
5683  00b5 8d000000      	callf	f_file_write
5685                     ; 1307 			FW_TEMPOFFSET(uiInfo.tempOffset);
5687  00b9 c60013        	ld	a,_uiInfo+18
5688  00bc 97            	ld	xl,a
5689  00bd a627          	ld	a,#39
5690  00bf 95            	ld	xh,a
5691  00c0 8d000000      	callf	f_file_write
5693                     ; 1309 			FW_VALVE_INFOS
5695  00c4 c60016        	ld	a,_uiInfo+21
5696  00c7 97            	ld	xl,a
5697  00c8 a615          	ld	a,#21
5698  00ca 95            	ld	xh,a
5699  00cb 8d000000      	callf	f_file_write
5703  00cf c60017        	ld	a,_uiInfo+22
5704  00d2 97            	ld	xl,a
5705  00d3 a616          	ld	a,#22
5706  00d5 95            	ld	xh,a
5707  00d6 8d000000      	callf	f_file_write
5711  00da c60018        	ld	a,_uiInfo+23
5712  00dd 97            	ld	xl,a
5713  00de a617          	ld	a,#23
5714  00e0 95            	ld	xh,a
5715  00e1 8d000000      	callf	f_file_write
5719  00e5 c60019        	ld	a,_uiInfo+24
5720  00e8 97            	ld	xl,a
5721  00e9 a618          	ld	a,#24
5722  00eb 95            	ld	xh,a
5723  00ec 8d000000      	callf	f_file_write
5727  00f0 c6001a        	ld	a,_uiInfo+25
5728  00f3 97            	ld	xl,a
5729  00f4 a619          	ld	a,#25
5730  00f6 95            	ld	xh,a
5731  00f7 8d000000      	callf	f_file_write
5735  00fb c6001b        	ld	a,_uiInfo+26
5736  00fe 97            	ld	xl,a
5737  00ff a61a          	ld	a,#26
5738  0101 95            	ld	xh,a
5739  0102 8d000000      	callf	f_file_write
5743  0106 c6001c        	ld	a,_uiInfo+27
5744  0109 97            	ld	xl,a
5745  010a a61b          	ld	a,#27
5746  010c 95            	ld	xh,a
5747  010d 8d000000      	callf	f_file_write
5751  0111 c6001d        	ld	a,_uiInfo+28
5752  0114 97            	ld	xl,a
5753  0115 a61c          	ld	a,#28
5754  0117 95            	ld	xh,a
5755  0118 8d000000      	callf	f_file_write
5759  011c c60026        	ld	a,_uiInfo+37
5760  011f 97            	ld	xl,a
5761  0120 a62e          	ld	a,#46
5762  0122 95            	ld	xh,a
5763  0123 8d000000      	callf	f_file_write
5767  0127 c60027        	ld	a,_uiInfo+38
5768  012a 97            	ld	xl,a
5769  012b a62f          	ld	a,#47
5770  012d 95            	ld	xh,a
5771  012e 8d000000      	callf	f_file_write
5775  0132 c60028        	ld	a,_uiInfo+39
5776  0135 97            	ld	xl,a
5777  0136 a630          	ld	a,#48
5778  0138 95            	ld	xh,a
5779  0139 8d000000      	callf	f_file_write
5783  013d c60029        	ld	a,_uiInfo+40
5784  0140 97            	ld	xl,a
5785  0141 a631          	ld	a,#49
5786  0143 95            	ld	xh,a
5787  0144 8d000000      	callf	f_file_write
5791  0148 c6002a        	ld	a,_uiInfo+41
5792  014b 97            	ld	xl,a
5793  014c a632          	ld	a,#50
5794  014e 95            	ld	xh,a
5795  014f 8d000000      	callf	f_file_write
5799  0153 c6002b        	ld	a,_uiInfo+42
5800  0156 97            	ld	xl,a
5801  0157 a633          	ld	a,#51
5802  0159 95            	ld	xh,a
5803  015a 8d000000      	callf	f_file_write
5807  015e c6002c        	ld	a,_uiInfo+43
5808  0161 97            	ld	xl,a
5809  0162 a634          	ld	a,#52
5810  0164 95            	ld	xh,a
5811  0165 8d000000      	callf	f_file_write
5815  0169 c6002d        	ld	a,_uiInfo+44
5816  016c 97            	ld	xl,a
5817  016d a635          	ld	a,#53
5818  016f 95            	ld	xh,a
5819  0170 8d000000      	callf	f_file_write
5821                     ; 1310 			FW_VALVE_RCINFOS
5823  0174 c6001e        	ld	a,_uiInfo+29
5824  0177 97            	ld	xl,a
5825  0178 a61d          	ld	a,#29
5826  017a 95            	ld	xh,a
5827  017b 8d000000      	callf	f_file_write
5831  017f c6001f        	ld	a,_uiInfo+30
5832  0182 97            	ld	xl,a
5833  0183 a61e          	ld	a,#30
5834  0185 95            	ld	xh,a
5835  0186 8d000000      	callf	f_file_write
5839  018a c60020        	ld	a,_uiInfo+31
5840  018d 97            	ld	xl,a
5841  018e a61f          	ld	a,#31
5842  0190 95            	ld	xh,a
5843  0191 8d000000      	callf	f_file_write
5847  0195 c60021        	ld	a,_uiInfo+32
5848  0198 97            	ld	xl,a
5849  0199 a620          	ld	a,#32
5850  019b 95            	ld	xh,a
5851  019c 8d000000      	callf	f_file_write
5855  01a0 c60022        	ld	a,_uiInfo+33
5856  01a3 97            	ld	xl,a
5857  01a4 a621          	ld	a,#33
5858  01a6 95            	ld	xh,a
5859  01a7 8d000000      	callf	f_file_write
5863  01ab c60023        	ld	a,_uiInfo+34
5864  01ae 97            	ld	xl,a
5865  01af a622          	ld	a,#34
5866  01b1 95            	ld	xh,a
5867  01b2 8d000000      	callf	f_file_write
5871  01b6 c60024        	ld	a,_uiInfo+35
5872  01b9 97            	ld	xl,a
5873  01ba a623          	ld	a,#35
5874  01bc 95            	ld	xh,a
5875  01bd 8d000000      	callf	f_file_write
5879  01c1 c60025        	ld	a,_uiInfo+36
5880  01c4 97            	ld	xl,a
5881  01c5 a624          	ld	a,#36
5882  01c7 95            	ld	xh,a
5883  01c8 8d000000      	callf	f_file_write
5887  01cc c6002e        	ld	a,_uiInfo+45
5888  01cf 97            	ld	xl,a
5889  01d0 a636          	ld	a,#54
5890  01d2 95            	ld	xh,a
5891  01d3 8d000000      	callf	f_file_write
5895  01d7 c6002f        	ld	a,_uiInfo+46
5896  01da 97            	ld	xl,a
5897  01db a637          	ld	a,#55
5898  01dd 95            	ld	xh,a
5899  01de 8d000000      	callf	f_file_write
5903  01e2 c60030        	ld	a,_uiInfo+47
5904  01e5 97            	ld	xl,a
5905  01e6 a638          	ld	a,#56
5906  01e8 95            	ld	xh,a
5907  01e9 8d000000      	callf	f_file_write
5911  01ed c60031        	ld	a,_uiInfo+48
5912  01f0 97            	ld	xl,a
5913  01f1 a639          	ld	a,#57
5914  01f3 95            	ld	xh,a
5915  01f4 8d000000      	callf	f_file_write
5919  01f8 c60032        	ld	a,_uiInfo+49
5920  01fb 97            	ld	xl,a
5921  01fc a63a          	ld	a,#58
5922  01fe 95            	ld	xh,a
5923  01ff 8d000000      	callf	f_file_write
5927  0203 c60033        	ld	a,_uiInfo+50
5928  0206 97            	ld	xl,a
5929  0207 a63b          	ld	a,#59
5930  0209 95            	ld	xh,a
5931  020a 8d000000      	callf	f_file_write
5935  020e c60034        	ld	a,_uiInfo+51
5936  0211 97            	ld	xl,a
5937  0212 a63c          	ld	a,#60
5938  0214 95            	ld	xh,a
5939  0215 8d000000      	callf	f_file_write
5943  0219 c60035        	ld	a,_uiInfo+52
5944  021c 97            	ld	xl,a
5945  021d a63d          	ld	a,#61
5946  021f 95            	ld	xh,a
5947  0220 8d000000      	callf	f_file_write
5950  0224 2004          	jra	L7461
5951  0226               L5461:
5952                     ; 1314 			__func_rc_timerout = 4;
5954  0226 3504001a      	mov	___func_rc_timerout,#4
5955  022a               L7461:
5956                     ; 1317 		__func_rc_timerout1 = 0;
5958  022a 725f001b      	clr	___func_rc_timerout1
5959                     ; 1318 		__func_rc_timerout2 = __timer1s;
5961  022e 550000001c    	mov	___func_rc_timerout2,___timer1s
5962                     ; 1319 		STATUS_NEXT(next);	
5964  0233 7b02          	ld	a,(OFST+2,sp)
5965  0235 c70014        	ld	__ds,a
5968  0238 725f0015      	clr	__dsCount
5971  023c 35ff0016      	mov	__dsPrev,#255
5973  0240               L3461:
5974                     ; 1322 	return 0;
5976  0240 4f            	clr	a
5979  0241 85            	popw	x
5980  0242 87            	retf	
6039                     ; 1326 void	disp_status_exit(uint8_t key, uint8_t next)
6039                     ; 1327 {
6040                     .text:	section	.text,new
6041  0000               f_disp_status_exit:
6043  0000 89            	pushw	x
6044       00000001      OFST:	set	1
6047                     ; 1330 	_backup_backlight = 0;
6049  0001 725f0009      	clr	__backup_backlight
6050  0005 88            	push	a
6051                     ; 1331 	if( (_t20ms%10) != 0 )
6053  0006 c60000        	ld	a,__t20ms
6054  0009 5f            	clrw	x
6055  000a 97            	ld	xl,a
6056  000b a60a          	ld	a,#10
6057  000d 8d000000      	callf	d_smodx
6059  0011 5d            	tnzw	x
6060  0012 2706          	jreq	L1761
6061                     ; 1333 		_dsPrev = 0;
6063  0014 725f0016      	clr	__dsPrev
6064                     ; 1334 		return;
6066  0018 2005          	jra	L6221
6067  001a               L1761:
6068                     ; 1337 	if( _dsPrev != 0 )
6070  001a c60016        	ld	a,__dsPrev
6071  001d 2703          	jreq	L3761
6072                     ; 1338 		return;
6073  001f               L6221:
6076  001f 5b03          	addw	sp,#3
6077  0021 87            	retf	
6078  0022               L3761:
6079                     ; 1341 	_dsCount++;
6081  0022 725c0015      	inc	__dsCount
6082                     ; 1342 	_dsPrev = 1;
6084  0026 35010016      	mov	__dsPrev,#1
6085                     ; 1343 	lcd_clear(0);
6087  002a 8d000000      	callf	f_lcd_clear
6089                     ; 1344 	for( i=0; i<4; i++ )
6091  002e 0f01          	clr	(OFST+0,sp)
6092  0030               L5761:
6093                     ; 1345 		lcd_disp_n(i, _dsCount%10);
6095  0030 c60015        	ld	a,__dsCount
6096  0033 5f            	clrw	x
6097  0034 97            	ld	xl,a
6098  0035 a60a          	ld	a,#10
6099  0037 62            	div	x,a
6100  0038 97            	ld	xl,a
6101  0039 7b01          	ld	a,(OFST+0,sp)
6102  003b 95            	ld	xh,a
6103  003c 8d000000      	callf	f_lcd_disp_n
6105                     ; 1344 	for( i=0; i<4; i++ )
6107  0040 0c01          	inc	(OFST+0,sp)
6110  0042 7b01          	ld	a,(OFST+0,sp)
6111  0044 a104          	cp	a,#4
6112  0046 25e8          	jrult	L5761
6113                     ; 1347 	if( __func_rc_settingCb == 1 && _dsCount >= 10 )
6115  0048 c60000        	ld	a,___func_rc_settingCb
6116  004b 4a            	dec	a
6117  004c 2607          	jrne	L3071
6119  004e c60015        	ld	a,__dsCount
6120  0051 a10a          	cp	a,#10
6121                     ; 1349 		STATUS_NEXT(next);
6124                     ; 1350 		return;
6127  0053 242f          	jruge	L3171
6128  0055               L3071:
6129                     ; 1352 	if( __timer1s != __func_rc_timerout2 )
6131  0055 c60000        	ld	a,___timer1s
6132  0058 c1001c        	cp	a,___func_rc_timerout2
6133  005b 2736          	jreq	L5071
6134                     ; 1354 		if( __func_rc_timerout1 == 0 )
6136  005d c6001b        	ld	a,___func_rc_timerout1
6137  0060 26bd          	jrne	L6221
6138                     ; 1356 			__func_rc_timerout2 = __timer1s;
6140  0062 550000001c    	mov	___func_rc_timerout2,___timer1s
6141                     ; 1357 			__func_rc_timerout1 = 1;
6143  0067 3501001b      	mov	___func_rc_timerout1,#1
6144                     ; 1358 			__func_rc_timerout--;
6146  006b 725a001a      	dec	___func_rc_timerout
6147                     ; 1359 			if( __func_rc_timerout == 0 )
6149  006f 26ae          	jrne	L6221
6150                     ; 1361 				if( uiInfo.mode == 1 )
6152  0071 c60009        	ld	a,_uiInfo+8
6153  0074 4a            	dec	a
6154  0075 260d          	jrne	L3171
6155                     ; 1365 					ui_error = 19;
6157  0077 35130000      	mov	_ui_error,#19
6158                     ; 1366 					_ds = 97;
6160  007b 35610014      	mov	__ds,#97
6161                     ; 1367 					_dsCount = 0;
6163  007f c70015        	ld	__dsCount,a
6165  0082 209b          	jra	L6221
6166  0084               L3171:
6167                     ; 1371 					STATUS_NEXT(next);
6174  0084 7b03          	ld	a,(OFST+2,sp)
6175  0086 c70014        	ld	__ds,a
6177  0089 725f0015      	clr	__dsCount
6179  008d 35ff0016      	mov	__dsPrev,#255
6181  0091 208c          	jra	L6221
6182  0093               L5071:
6183                     ; 1377 		__func_rc_timerout1 = 0;
6185  0093 725f001b      	clr	___func_rc_timerout1
6186                     ; 1378 }
6188  0097 2086          	jra	L6221
6190                     	switch	.data
6191  001d               __tim1min:
6192  001d 00            	dc.b	0
6193  001e               __tim30min:
6194  001e 00            	dc.b	0
6195  001f               __timFlag:
6196  001f 00            	dc.b	0
6220                     ; 1384 void	timerClear(void)
6220                     ; 1385 {
6221                     .text:	section	.text,new
6222  0000               f_timerClear:
6226                     ; 1386 	_tim1min = 0;
6228  0000 725f001d      	clr	__tim1min
6229                     ; 1387 	_tim30min = 0;
6231  0004 725f001e      	clr	__tim30min
6232                     ; 1388 	_timFlag = 0;
6234  0008 725f001f      	clr	__timFlag
6235                     ; 1389 }
6238  000c 87            	retf	
6276                     ; 1391 void	disp_status_loop_message(uint8_t i)
6276                     ; 1392 {
6277                     .text:	section	.text,new
6278  0000               f_disp_status_loop_message:
6280  0000 88            	push	a
6281       00000000      OFST:	set	0
6284                     ; 1393 	lcd_clear_btn();
6286  0001 8d000000      	callf	f_lcd_clear_btn
6288                     ; 1394 	if( i == 0 )		/*	(0)난방*/	
6290  0005 7b01          	ld	a,(OFST+1,sp)
6291  0007 263a          	jrne	L5471
6292                     ; 1396 		_disp_mode = 0x01;	
6294  0009 35010000      	mov	__disp_mode,#1
6295                     ; 1397 		LCD_BIT_SET(bT1);	//	현재온도
6297  000d 8ddc00dc      	callf	LC035
6298  0011 8dd600d6      	callf	LC034
6299  0015 ca0000        	or	a,_bLF_DEF
6300  0018 d7540c        	ld	(21516,x),a
6301                     ; 1399 		LCD_BIT_SET(bT4);	//	설정온도
6303  001b c6000f        	ld	a,_iLF_DEF+15
6304  001e 8dd600d6      	callf	LC034
6305  0022 ca000f        	or	a,_bLF_DEF+15
6306  0025 d7540c        	ld	(21516,x),a
6307                     ; 1400 		LCD_BIT_SET(bT5);	//	도
6309  0028 c6000d        	ld	a,_iLF_DEF+13
6310  002b 8dd600d6      	callf	LC034
6311  002f ca000d        	or	a,_bLF_DEF+13
6312  0032 d7540c        	ld	(21516,x),a
6313                     ; 1401 		LCD_BIT_SET(bT6);	//	난방	
6315  0035 c60006        	ld	a,_iLF_DEF+6
6316  0038 8dd600d6      	callf	LC034
6317  003c ca0006        	or	a,_bLF_DEF+6
6319  003f acc800c8      	jpf	LC031
6320  0043               L5471:
6321                     ; 1403 	else if( i == 1 )	/*	(1)예약*/	
6323  0043 a101          	cp	a,#1
6324  0045 2606          	jrne	L1571
6325                     ; 1405 		_disp_mode = 0x08;	
6327  0047 8dee00ee      	callf	LC036
6328                     ; 1408 		LCD_BIT_SET(bT14);	//	예약
6329  004b 207b          	jpf	LC031
6330  004d               L1571:
6331                     ; 1410 	else if( i == 2 )	/*	(2)반복*/	
6333  004d a102          	cp	a,#2
6334                     ; 1412 		_disp_mode = 0x10;	
6335                     ; 1415 		LCD_BIT_SET(bT18);	//	타이머	
6337  004f 2768          	jreq	LC032
6338                     ; 1426 	else if( i == 8 )		/*	(1)외출*/	
6340  0051 a108          	cp	a,#8
6341  0053 261e          	jrne	L1671
6342                     ; 1428 		_disp_mode = 0x02;	
6344                     ; 1429 		LCD_BIT_SET(bT1);	//	현재온도
6346                     ; 1430 		LCD_BIT_SET(bT3);	//	도
6348                     ; 1431 		LCD_BIT_SET(bT7);	//	외출
6350  0055               LC033:
6352  0055 35020000      	mov	__disp_mode,#2
6354  0059 8ddc00dc      	callf	LC035
6355  005d 8dd600d6      	callf	LC034
6356  0061 ca0000        	or	a,_bLF_DEF
6357  0064 d7540c        	ld	(21516,x),a
6359  0067 c60019        	ld	a,_iLF_DEF+25
6360  006a 8dd600d6      	callf	LC034
6361  006e ca0019        	or	a,_bLF_DEF+25
6363  0071 2055          	jpf	LC031
6364  0073               L1671:
6365                     ; 1439 	else if( i == 17 )		/*	(1)외출 LONG */	
6367  0073 a111          	cp	a,#17
6368  0075 2606          	jrne	L5671
6369                     ; 1441 		_disp_mode = 0x02;
6371  0077 35020000      	mov	__disp_mode,#2
6373  007b 204e          	jra	L7471
6374  007d               L5671:
6375                     ; 1449 	else if( i == 5 )	
6377  007d a105          	cp	a,#5
6378  007f 2606          	jrne	L1771
6379                     ; 1451 		_disp_mode = 0x04;	
6381  0081 35040000      	mov	__disp_mode,#4
6383  0085 2044          	jra	L7471
6384  0087               L1771:
6385                     ; 1454 	else if( i == 151 )		//	OUT
6387  0087 a197          	cp	a,#151
6388                     ; 1456 		_disp_mode = 0x02;	
6389                     ; 1457 		LCD_BIT_SET(bT1);	//	현재온도
6390                     ; 1458 		LCD_BIT_SET(bT3);	//	도
6391                     ; 1461 		LCD_BIT_SET(bT7);	//	외출
6393  0089 27ca          	jreq	LC033
6394                     ; 1463 	else if( i == 152 )		//	온수
6396  008b a198          	cp	a,#152
6397  008d 260c          	jrne	L1002
6398                     ; 1465 		LCD_BIT_SET(bT29);	//	
6400  008f c60045        	ld	a,_iLF_DEF+69
6401  0092 8dd600d6      	callf	LC034
6402  0096 ca0045        	or	a,_bLF_DEF+69
6404  0099 202d          	jpf	LC031
6405  009b               L1002:
6406                     ; 1467 	else if( i == 153 )		//	난수
6408  009b a199          	cp	a,#153
6409  009d 260c          	jrne	L5002
6410                     ; 1469 		LCD_BIT_SET(bT22);	//	
6412  009f c60043        	ld	a,_iLF_DEF+67
6413  00a2 8dd600d6      	callf	LC034
6414  00a6 ca0043        	or	a,_bLF_DEF+67
6416  00a9 201d          	jpf	LC031
6417  00ab               L5002:
6418                     ; 1471 	else if( i == 154 )		//	예약
6420  00ab a19a          	cp	a,#154
6421  00ad 2606          	jrne	L1102
6422                     ; 1473 		_disp_mode = 0x08;
6424  00af 8dee00ee      	callf	LC036
6425                     ; 1474 		LCD_BIT_SET(bT14);	//	예약
6426  00b3 2013          	jpf	LC031
6427  00b5               L1102:
6428                     ; 1476 	else if( i == 155 )		//	타이머
6430  00b5 a19b          	cp	a,#155
6431  00b7 2612          	jrne	L7471
6432                     ; 1478 		_disp_mode = 0x10;
6434                     ; 1479 		LCD_BIT_SET(bT18);	//	타이머	
6436  00b9               LC032:
6438  00b9 35100000      	mov	__disp_mode,#16
6440  00bd 5f            	clrw	x
6441  00be c60042        	ld	a,_iLF_DEF+66
6442  00c1 97            	ld	xl,a
6443  00c2 d6540c        	ld	a,(21516,x)
6444  00c5 ca0042        	or	a,_bLF_DEF+66
6445  00c8               LC031:
6446  00c8 d7540c        	ld	(21516,x),a
6447  00cb               L7471:
6448                     ; 1482 	_disp_mode2 = _disp_mode;
6450  00cb 5500000000    	mov	__disp_mode2,__disp_mode
6451                     ; 1483 	timerClear();
6453  00d0 8d000000      	callf	f_timerClear
6455                     ; 1484 }
6458  00d4 84            	pop	a
6459  00d5 87            	retf	
6460  00d6               LC034:
6461  00d6 5f            	clrw	x
6462  00d7 97            	ld	xl,a
6463  00d8 d6540c        	ld	a,(21516,x)
6464  00db 87            	retf	
6465  00dc               LC035:
6466  00dc 5f            	clrw	x
6467  00dd c60004        	ld	a,_iLF_DEF+4
6468  00e0 97            	ld	xl,a
6469  00e1 d6540c        	ld	a,(21516,x)
6470  00e4 ca0004        	or	a,_bLF_DEF+4
6471  00e7 d7540c        	ld	(21516,x),a
6473  00ea c60000        	ld	a,_iLF_DEF
6474  00ed 87            	retf	
6475  00ee               LC036:
6476  00ee 35080000      	mov	__disp_mode,#8
6477                     ; 1408 		LCD_BIT_SET(bT14);	//	예약
6479  00f2 5f            	clrw	x
6480  00f3 c60041        	ld	a,_iLF_DEF+65
6481  00f6 97            	ld	xl,a
6482  00f7 d6540c        	ld	a,(21516,x)
6483  00fa ca0041        	or	a,_bLF_DEF+65
6484  00fd 87            	retf	
6530                     ; 1489 void	disp_status_loop_init(void)
6530                     ; 1490 {
6531                     .text:	section	.text,new
6532  0000               f_disp_status_loop_init:
6534  0000 88            	push	a
6535       00000001      OFST:	set	1
6538                     ; 1493 	i = 0;
6540                     ; 1494 	if (_disp_mode == 0xff) {
6542                     ; 1495 		i = 1;
6544                     ; 1499 	lcd_clear(0);
6546  0001 4f            	clr	a
6547  0002 8d000000      	callf	f_lcd_clear
6549                     ; 1500 	lcd_blink_clear();
6551  0006 8d000000      	callf	f_lcd_blink_clear
6553                     ; 1501 	_dsPrev = 0xff;
6555  000a 35ff0016      	mov	__dsPrev,#255
6556                     ; 1502 	if( uiInfo._temp[0] == 0x80 )
6558  000e c60061        	ld	a,_uiInfo+96
6559  0011 a180          	cp	a,#128
6560  0013 2605          	jrne	L5302
6561                     ; 1503 		uiInfo.tSetup = uiInfo._temp[1];
6563  0015 550062000f    	mov	_uiInfo+14,_uiInfo+97
6564  001a               L5302:
6565                     ; 1504 	uiInfo._temp[0] = 0;
6567  001a 725f0061      	clr	_uiInfo+96
6568                     ; 1514 	if( __sUp == 5 )		//	Off
6570  001e c60001        	ld	a,___sUp
6571  0021 a105          	cp	a,#5
6572  0023 274b          	jreq	L3602
6574                     ; 1536 	else if( __sUp == 0 )
6576  0025 c60001        	ld	a,___sUp
6577  0028 2616          	jrne	L3402
6578                     ; 1538 		__ui_disp_temp_c(3);
6580  002a a603          	ld	a,#3
6581  002c 8d000000      	callf	f___ui_disp_temp_c
6583                     ; 1539 		ui_disp_temp_curr(uiInfo.tCurr);
6585  0030 c60003        	ld	a,_uiInfo+2
6586  0033 8d000000      	callf	f_ui_disp_temp_curr
6588                     ; 1540 		ui_disp_temp_setup(uiInfo.tSetup);
6590  0037 c6000f        	ld	a,_uiInfo+14
6591  003a 8d000000      	callf	f_ui_disp_temp_setup
6594  003e 2030          	jra	L3602
6595  0040               L3402:
6596                     ; 1542 	else if( __sUp == 1 )	//	Y
6598  0040 a101          	cp	a,#1
6599  0042 272c          	jreq	L3602
6601                     ; 1545 	else if( __sUp == 2 )	//	B
6603  0044 a102          	cp	a,#2
6604  0046 2728          	jreq	L3602
6606                     ; 1548 	else if( __sUp == 8 )	//	Out
6608  0048 a108          	cp	a,#8
6609  004a 2618          	jrne	L7502
6610                     ; 1550 		__ui_disp_temp_c(1);
6612  004c 8d790079      	callf	LC038
6613                     ; 1556 		UPDATE_BIT(BIT_TSETUP);
6615  0050 72140006      	bset	__updateBit,#2
6618  0054 5500000005    	mov	__updateTimer,___timer1s
6621  0059 35050007      	mov	__updateCount,#5
6622                     ; 1557 		uiInfo._temp[3] = uiInfo.tSetup;
6625  005d 55000f0064    	mov	_uiInfo+99,_uiInfo+14
6626                     ; 1558 		uiInfo.tSetup = 20;
6628  0062 2008          	jpf	LC037
6629  0064               L7502:
6630                     ; 1566 	}else if( __sUp == 17 )	//	Out long
6632  0064 a111          	cp	a,#17
6633  0066 2608          	jrne	L3602
6634                     ; 1568 		__ui_disp_temp_c(1);
6636  0068 8d790079      	callf	LC038
6637                     ; 1571 		uiInfo.tSetup = 20;
6639  006c               LC037:
6641  006c 3514000f      	mov	_uiInfo+14,#20
6643  0070               L3602:
6644                     ; 1573 	else if( __sUp == 151 )	//	OUT
6647                     ; 1579 	disp_status_loop_message(__sUp);
6649  0070 c60001        	ld	a,___sUp
6650  0073 8d000000      	callf	f_disp_status_loop_message
6652                     ; 1580 }
6655  0077 84            	pop	a
6656  0078 87            	retf	
6657  0079               LC038:
6658  0079 a601          	ld	a,#1
6659  007b 8d000000      	callf	f___ui_disp_temp_c
6661                     ; 1551 		uiInfo._temp[0] = 0x80;
6663  007f 35800061      	mov	_uiInfo+96,#128
6664                     ; 1552 		uiInfo._temp[1] = uiInfo.tSetup;
6666  0083 55000f0062    	mov	_uiInfo+97,_uiInfo+14
6667  0088 87            	retf	
6693                     ; 1582 void	disp_status_curr_only(void)
6693                     ; 1583 {
6694                     .text:	section	.text,new
6695  0000               f_disp_status_curr_only:
6699                     ; 1584 	ui_disp_clear_tSetup(0);
6701  0000 4f            	clr	a
6702  0001 8d000000      	callf	f_ui_disp_clear_tSetup
6704                     ; 1585 	ui_disp_temp_curr(uiInfo.tCurr);
6706  0005 c60003        	ld	a,_uiInfo+2
6708                     ; 1586 }
6711  0008 ac000000      	jpf	f_ui_disp_temp_curr
6752                     ; 1588 void	disp_status_error(uint8_t key, uint8_t next)
6752                     ; 1589 {
6753                     .text:	section	.text,new
6754  0000               f_disp_status_error:
6756  0000 89            	pushw	x
6757       00000000      OFST:	set	0
6760                     ; 1591 	if( error_display_status == 1 )
6762  0001 c6000d        	ld	a,_error_display_status
6763  0004 4a            	dec	a
6764  0005 2611          	jrne	L3212
6765                     ; 1593 		lcd_clear(0);
6767  0007 8d000000      	callf	f_lcd_clear
6769                     ; 1594 		lcd_disp_err(ui_error);
6771  000b c60000        	ld	a,_ui_error
6772  000e 8d000000      	callf	f_lcd_disp_err
6774                     ; 1595 		error_display_status = 2;
6776  0012 3502000d      	mov	_error_display_status,#2
6778  0016 2005          	jra	L5212
6779  0018               L3212:
6780                     ; 1599 		if( uiInfo.enc != 0 )
6782  0018 c60001        	ld	a,_uiInfo
6783  001b 2606          	jrne	L3012
6784                     ; 1601 			goto Exit;
6786  001d               L5212:
6787                     ; 1609 	if( key == 2 )
6789  001d 7b01          	ld	a,(OFST+1,sp)
6790  001f a102          	cp	a,#2
6791  0021 260b          	jrne	L1312
6792  0023               L3012:
6793                     ; 1612 Exit:		
6793                     ; 1613 		if( uiInfo.mode == 1 )
6795  0023 c60009        	ld	a,_uiInfo+8
6796  0026 4a            	dec	a
6797  0027 2605          	jrne	L1312
6798                     ; 1616 			func_rc_recover(1);
6800  0029 4c            	inc	a
6801  002a 8d000000      	callf	f_func_rc_recover
6803  002e               L1312:
6804                     ; 1623 	if( error == 0 && error_type == 0 )
6806  002e c60000        	ld	a,_error
6807  0031 260e          	jrne	L5312
6809  0033 c60000        	ld	a,_error_type
6810  0036 2609          	jrne	L5312
6811  0038 c60000        	ld	a,_ui_error
6812  003b 200f          	jra	L5012
6813  003d               L7312:
6814                     ; 1633 		error_display_mode = 0;
6816  003d 725f000c      	clr	_error_display_mode
6817  0041               L5312:
6818                     ; 1636 	if( ui_error == 0 && ui_error_type == 0 )
6820  0041 c60000        	ld	a,_ui_error
6821  0044 2611          	jrne	L1412
6823  0046 725d0000      	tnz	_ui_error_type
6824  004a 260b          	jrne	L1412
6825                     ; 1638 		goto RESET_ENTRY;
6826  004c               L5012:
6827                     ; 1625 RESET_ENTRY:			
6827                     ; 1626 		/*
6827                     ; 1627 			reset mode
6827                     ; 1628 		 */
6827                     ; 1629 		if (ui_error == 30 && ui_error_type == ERROR_TYPE_CNT) {
6829  004c a11e          	cp	a,#30
6830  004e 26ed          	jrne	L7312
6832  0050 c60000        	ld	a,_ui_error_type
6833  0053 a102          	cp	a,#2
6834  0055 26e6          	jrne	L7312
6835                     ; 1630 			return;
6837  0057               L1412:
6838                     ; 1640 }
6841  0057 85            	popw	x
6842  0058 87            	retf	
6902                     ; 1644 void	disp_status_command(uint8_t key)
6902                     ; 1645 {
6903                     .text:	section	.text,new
6904  0000               f_disp_status_command:
6906  0000 88            	push	a
6907  0001 88            	push	a
6908       00000001      OFST:	set	1
6911                     ; 1647 	if( _dsCount == 0 )
6913  0002 c60015        	ld	a,__dsCount
6914  0005 2640          	jrne	L3412
6915                     ; 1649 		disp_next();
6917  0007 8d000000      	callf	f_disp_next
6919                     ; 1651 		LCD_BIT_SET(b1A);
6921  000b c60005        	ld	a,_iLF_DEF+5
6922  000e 8d760176      	callf	LC044
6923  0012 ca0005        	or	a,_bLF_DEF+5
6924  0015 d7540c        	ld	(21516,x),a
6925                     ; 1652 		LCD_BIT_SET(b1F);
6927  0018 c60018        	ld	a,_iLF_DEF+24
6928  001b 8d760176      	callf	LC044
6929  001f ca0018        	or	a,_bLF_DEF+24
6930  0022 d7540c        	ld	(21516,x),a
6931                     ; 1653 		LCD_BIT_SET(b1E);
6933  0025 c6002b        	ld	a,_iLF_DEF+43
6934  0028 8d760176      	callf	LC044
6935  002c ca002b        	or	a,_bLF_DEF+43
6936  002f d7540c        	ld	(21516,x),a
6937                     ; 1654 		LCD_BIT_SET(b1D);
6939  0032 c6003e        	ld	a,_iLF_DEF+62
6940  0035 8d760176      	callf	LC044
6941  0039 ca003e        	or	a,_bLF_DEF+62
6942  003c d7540c        	ld	(21516,x),a
6943                     ; 1655 		uiInfo._t = 0;
6945  003f 725f0060      	clr	_uiInfo+95
6947  0043 ace400e4      	jra	L7022
6948  0047               L3412:
6949                     ; 1659 EncEntry:		
6949                     ; 1660 		i = uiInfo._t;
6951  0047 c60060        	ld	a,_uiInfo+95
6952  004a 6b01          	ld	(OFST+0,sp),a
6953                     ; 1661 		if( uiInfo.enc != 0 )
6955  004c c60001        	ld	a,_uiInfo
6956  004f 271e          	jreq	L1122
6957                     ; 1663 			if( (uiInfo.enc & 0x40) == 0 )
6959  0051 a540          	bcp	a,#64
6960  0053 2609          	jrne	L3122
6961                     ; 1664 				i = (i+_LC-1)%_LC;
6963  0055 7b01          	ld	a,(OFST+0,sp)
6964  0057 5f            	clrw	x
6965  0058 97            	ld	xl,a
6966  0059 1c0009        	addw	x,#9
6969  005c 2005          	jra	L5122
6970  005e               L3122:
6971                     ; 1666 				i = (i+1)%_LC;
6973  005e 7b01          	ld	a,(OFST+0,sp)
6974  0060 5f            	clrw	x
6975  0061 97            	ld	xl,a
6976  0062 5c            	incw	x
6978  0063               L5122:
6979  0063 a60a          	ld	a,#10
6980  0065 8d000000      	callf	d_smodx
6981  0069 01            	rrwa	x,a
6982  006a 6b01          	ld	(OFST+0,sp),a
6983                     ; 1667 			uiInfo._t = i;
6985  006c c70060        	ld	_uiInfo+95,a
6986  006f               L1122:
6987                     ; 1669 		if( _dsPrev != i )
6989  006f c60016        	ld	a,__dsPrev
6990  0072 1101          	cp	a,(OFST+0,sp)
6991  0074 276e          	jreq	L7022
6992                     ; 1671 			_dsPrev = i;
6994  0076 7b01          	ld	a,(OFST+0,sp)
6995  0078 c70016        	ld	__dsPrev,a
6996                     ; 1672 			clear_npos2();
6998  007b 8d000000      	callf	f_clear_npos2
7000                     ; 1673 			if( i==0 )		lcd_disp_setup_cntl_tab();
7002  007f 7b01          	ld	a,(OFST+0,sp)
7003  0081 2606          	jrne	L1222
7006  0083 8d000000      	callf	f_lcd_disp_setup_cntl_tab
7009  0087 205b          	jra	L7022
7010  0089               L1222:
7011                     ; 1674 			else if( i==1 )	lcd_disp_setup_cntl_2motor();
7013  0089 a101          	cp	a,#1
7014  008b 2606          	jrne	L5222
7017  008d 8d000000      	callf	f_lcd_disp_setup_cntl_2motor
7020  0091 2051          	jra	L7022
7021  0093               L5222:
7022                     ; 1675 			else if( i==2 )	lcd_disp_setup_cntl_on();
7024  0093 a102          	cp	a,#2
7025  0095 2606          	jrne	L1322
7028  0097 8d000000      	callf	f_lcd_disp_setup_cntl_on
7031  009b 2047          	jra	L7022
7032  009d               L1322:
7033                     ; 1676 			else if( i==3 )	lcd_disp_setup_cntl_po();
7035  009d a103          	cp	a,#3
7036  009f 2606          	jrne	L5322
7039  00a1 8d000000      	callf	f_lcd_disp_setup_cntl_po
7042  00a5 203d          	jra	L7022
7043  00a7               L5322:
7044                     ; 1677 			else if( i==4 )	lcd_disp_mir1();
7046  00a7 a104          	cp	a,#4
7047  00a9 2606          	jrne	L1422
7050  00ab 8d000000      	callf	f_lcd_disp_mir1
7053  00af 2033          	jra	L7022
7054  00b1               L1422:
7055                     ; 1678 			else if( i==5 )	lcd_disp_mir2();
7057  00b1 a105          	cp	a,#5
7058  00b3 2606          	jrne	L5422
7061  00b5 8d000000      	callf	f_lcd_disp_mir2
7064  00b9 2029          	jra	L7022
7065  00bb               L5422:
7066                     ; 1679 			else if( i==6 )	lcd_disp_freset();
7068  00bb a106          	cp	a,#6
7069  00bd 2606          	jrne	L1522
7072  00bf 8d000000      	callf	f_lcd_disp_freset
7075  00c3 201f          	jra	L7022
7076  00c5               L1522:
7077                     ; 1680 			else if( i==7 )	lcd_disp_cnt_host();
7079  00c5 a107          	cp	a,#7
7080  00c7 2606          	jrne	L5522
7083  00c9 8d000000      	callf	f_lcd_disp_cnt_host
7086  00cd 2015          	jra	L7022
7087  00cf               L5522:
7088                     ; 1681 			else if( i==8 )	lcd_disp_cnt_sub();
7090  00cf a108          	cp	a,#8
7091  00d1 2606          	jrne	L1622
7094  00d3 8d000000      	callf	f_lcd_disp_cnt_sub
7097  00d7 200b          	jra	L7022
7098  00d9               L1622:
7099                     ; 1682 			else if( i==9 )	lcd_disp_n(3, 0);
7101  00d9 a109          	cp	a,#9
7102  00db 2607          	jrne	L7022
7105  00dd ae0300        	ldw	x,#768
7106  00e0 8d000000      	callf	f_lcd_disp_n
7108  00e4               L7022:
7109                     ; 1685 	if( key == 0x10 )		__UP
7111  00e4 7b02          	ld	a,(OFST+1,sp)
7112  00e6 a110          	cp	a,#16
7113  00e8 2606          	jrne	L7622
7116  00ea 35010001      	mov	_uiInfo,#1
7120  00ee 2008          	jpf	LC039
7121  00f0               L7622:
7122                     ; 1686 	else if( key == 0x20 )	__DN
7124  00f0 a120          	cp	a,#32
7125  00f2 260a          	jrne	L3722
7128  00f4 35400001      	mov	_uiInfo,#64
7131  00f8               LC039:
7133  00f8 0f02          	clr	(OFST+1,sp)
7136  00fa ac470047      	jra	L3412
7137  00fe               L3722:
7138                     ; 1687 	else if( key == 4 )		
7140  00fe a104          	cp	a,#4
7141  0100 2664          	jrne	L7722
7142                     ; 1689 		switch( uiInfo._t )
7144  0102 c60060        	ld	a,_uiInfo+95
7146                     ; 1725 			break;
7147  0105 271b          	jreq	L5412
7148  0107 4a            	dec	a
7149  0108 271e          	jreq	L7412
7150  010a 4a            	dec	a
7151  010b 2721          	jreq	L1512
7152  010d 4a            	dec	a
7153  010e 2723          	jreq	L3512
7154  0110 a002          	sub	a,#2
7155  0112 2725          	jreq	L5512
7156  0114 4a            	dec	a
7157  0115 2728          	jreq	L7512
7158  0117 4a            	dec	a
7159  0118 272e          	jreq	L1612
7160  011a 4a            	dec	a
7161  011b 2730          	jreq	L3612
7162  011d 4a            	dec	a
7163  011e 2740          	jreq	L5612
7164  0120 2052          	jra	L1722
7165  0122               L5412:
7166                     ; 1691 		case 0:
7166                     ; 1692 			uiInfoSet.opMode = 3;	
7168  0122 35030072      	mov	_uiInfoSet+4,#3
7169                     ; 1693 			disp_status_run(3, 35, 0);
7171                     ; 1694 			break;
7173  0126 202c          	jpf	LC042
7174  0128               L7412:
7175                     ; 1695 		case 1:	
7175                     ; 1696 			uiInfoSet.opMode = 2;	
7177  0128 35020072      	mov	_uiInfoSet+4,#2
7178                     ; 1697 			disp_status_run(3, 35, 0);
7180                     ; 1698 			break;
7182  012c 2026          	jpf	LC042
7183  012e               L1512:
7184                     ; 1699 		case 2:	
7184                     ; 1700 			uiInfoSet.opMode = 0;	
7186  012e c70072        	ld	_uiInfoSet+4,a
7187                     ; 1701 			disp_status_run(3, 35, 0);
7189                     ; 1702 			break;
7191  0131 2021          	jpf	LC042
7192  0133               L3512:
7193                     ; 1703 		case 3:	
7193                     ; 1704 			uiInfoSet.opMode = 1;	
7195  0133 35010072      	mov	_uiInfoSet+4,#1
7196                     ; 1705 			disp_status_run(3, 35, 0);
7198                     ; 1706 			break;
7200  0137 201b          	jpf	LC042
7201  0139               L5512:
7202                     ; 1708 			STATUS_NEXT(95);
7204  0139 355f0014      	mov	__ds,#95
7207                     ; 1709 			break;
7210  013d 202e          	jpf	LC040
7211  013f               L7512:
7212                     ; 1710 		case 6:	
7212                     ; 1711 			func_rc_command(COMMAND_MODE_FACTORY, 100);	
7214  013f ae0864        	ldw	x,#2148
7215  0142 8d000000      	callf	f_func_rc_command
7217                     ; 1712 			break;
7219  0146 202c          	jra	L1722
7220  0148               L1612:
7221                     ; 1713 		case 7:	
7221                     ; 1714 			//	MAIN
7221                     ; 1715 			func_rc_command(COMMAND_MODE_FACTORY, 110);	
7223  0148 ae086e        	ldw	x,#2158
7225                     ; 1716 			disp_status_run(3, 35, 0);
7227                     ; 1717 			break;
7229  014b 2003          	jpf	LC043
7230  014d               L3612:
7231                     ; 1718 		case 8:	
7231                     ; 1719 			//	SUB
7231                     ; 1720 			func_rc_command(COMMAND_MODE_FACTORY, 120);	
7233  014d ae0878        	ldw	x,#2168
7234  0150               LC043:
7235  0150 8d000000      	callf	f_func_rc_command
7237                     ; 1721 			disp_status_run(3, 35, 0);
7240  0154               LC042:
7246  0154 4b00          	push	#0
7247  0156 ae0323        	ldw	x,#803
7248  0159 8d000000      	callf	f_disp_status_run
7249  015d 84            	pop	a
7250                     ; 1722 			break;
7252  015e 2014          	jra	L1722
7253  0160               L5612:
7254                     ; 1724 			STATUS_NEXT(100);
7256  0160 35640014      	mov	__ds,#100
7260                     ; 1725 			break;
7263  0164 2007          	jpf	LC040
7265  0166               L7722:
7266                     ; 1728 	else if( key == 1 )
7268  0166 4a            	dec	a
7269  0167 260b          	jrne	L1722
7270                     ; 1730 		STATUS_NEXT(99);
7272  0169 35630014      	mov	__ds,#99
7277  016d               LC040:
7279  016d c70015        	ld	__dsCount,a
7282  0170 35ff0016      	mov	__dsPrev,#255
7284  0174               L1722:
7285                     ; 1732 }
7288  0174 85            	popw	x
7289  0175 87            	retf	
7290  0176               LC044:
7291  0176 5f            	clrw	x
7292  0177 97            	ld	xl,a
7293  0178 d6540c        	ld	a,(21516,x)
7294  017b 87            	retf	
7296                     	switch	.data
7297  0020               __d485_id:
7298  0020 00            	dc.b	0
7335                     ; 1751 void	disp_write_file(uint8_t next)
7335                     ; 1752 {
7336                     .text:	section	.text,new
7337  0000               f_disp_write_file:
7339  0000 88            	push	a
7340       00000000      OFST:	set	0
7343                     ; 1755 	file_update();
7345  0001 8d000000      	callf	f_file_update
7347                     ; 1756 	__func_rc_timerout = 5;
7349  0005 3505001a      	mov	___func_rc_timerout,#5
7350                     ; 1757 	__func_rc_timerout1 = 0;
7352  0009 725f001b      	clr	___func_rc_timerout1
7353                     ; 1758 	__func_rc_timerout2 = __timer1s;
7355  000d 550000001c    	mov	___func_rc_timerout2,___timer1s
7356                     ; 1759 	func_rc_setting();
7358  0012 8d000000      	callf	f_func_rc_setting
7360                     ; 1760 	_ds = next;
7362  0016 7b01          	ld	a,(OFST+1,sp)
7363  0018 c70014        	ld	__ds,a
7364                     ; 1761 }
7367  001b 84            	pop	a
7368  001c 87            	retf	
7403                     ; 1763 void	disp_set_state(uint8_t next)
7403                     ; 1764 {
7404                     .text:	section	.text,new
7405  0000               f_disp_set_state:
7407  0000 88            	push	a
7408       00000000      OFST:	set	0
7411                     ; 1765 	lcd_blink_clear();
7413  0001 8d000000      	callf	f_lcd_blink_clear
7415                     ; 1766 	STATUS_NEXT(next);
7417  0005 7b01          	ld	a,(OFST+1,sp)
7418  0007 c70014        	ld	__ds,a
7421  000a 725f0015      	clr	__dsCount
7424  000e 35ff0016      	mov	__dsPrev,#255
7425                     ; 1767 }
7429  0012 84            	pop	a
7430  0013 87            	retf	
7462                     ; 1769 void _disp_485(uint8_t i) {
7463                     .text:	section	.text,new
7464  0000               f__disp_485:
7466  0000 88            	push	a
7467       00000000      OFST:	set	0
7470                     ; 1770 	lcd_disp_n(1, i >> 4);
7472  0001 4e            	swap	a
7473  0002 a40f          	and	a,#15
7474  0004 97            	ld	xl,a
7475  0005 a601          	ld	a,#1
7476  0007 95            	ld	xh,a
7477  0008 8d000000      	callf	f_lcd_disp_n
7479                     ; 1771 	lcd_disp_n(2, (i & 0x0F)/10);
7481  000c 7b01          	ld	a,(OFST+1,sp)
7482  000e a40f          	and	a,#15
7483  0010 5f            	clrw	x
7484  0011 97            	ld	xl,a
7485  0012 a60a          	ld	a,#10
7486  0014 62            	div	x,a
7487  0015 a602          	ld	a,#2
7488  0017 95            	ld	xh,a
7489  0018 8d000000      	callf	f_lcd_disp_n
7491                     ; 1772 	lcd_disp_n(3, (i & 0x0F)%10);
7493  001c 7b01          	ld	a,(OFST+1,sp)
7494  001e a40f          	and	a,#15
7495  0020 5f            	clrw	x
7496  0021 97            	ld	xl,a
7497  0022 a60a          	ld	a,#10
7498  0024 62            	div	x,a
7499  0025 97            	ld	xl,a
7500  0026 a603          	ld	a,#3
7501  0028 95            	ld	xh,a
7502  0029 8d000000      	callf	f_lcd_disp_n
7504                     ; 1773 }
7507  002d 84            	pop	a
7508  002e 87            	retf	
7549                     ; 1775 void	disp_485(uint8_t next)
7549                     ; 1776 {
7550                     .text:	section	.text,new
7551  0000               f_disp_485:
7555                     ; 1777 	if( _dsCount == 0 )
7557  0000 c60015        	ld	a,__dsCount
7558  0003 260a          	jrne	L3732
7559                     ; 1779 		_dsCount = 1;
7561  0005 35010015      	mov	__dsCount,#1
7562                     ; 1780 		lcd_clear(0);
7564  0009 8d000000      	callf	f_lcd_clear
7566                     ; 1781 		goto DispEntry;
7568  000d 2019          	jra	L5532
7569  000f               L3732:
7570                     ; 1785 		if( (_t20ms%100) != 0 )
7572  000f c60000        	ld	a,__t20ms
7573  0012 5f            	clrw	x
7574  0013 97            	ld	xl,a
7575  0014 a664          	ld	a,#100
7576  0016 8d000000      	callf	d_smodx
7578  001a 5d            	tnzw	x
7579  001b 2705          	jreq	L7732
7580                     ; 1787 			_dsPrev = 0;
7582  001d 725f0016      	clr	__dsPrev
7583                     ; 1788 			return;
7586  0021 87            	retf	
7587  0022               L7732:
7588                     ; 1791 		if( _dsPrev != 0 )
7590  0022 c60016        	ld	a,__dsPrev
7591  0025 2701          	jreq	L5532
7592                     ; 1792 			return;
7595  0027 87            	retf	
7596  0028               L5532:
7597                     ; 1793 DispEntry:			
7597                     ; 1794 		_dsPrev = 1;
7599  0028 35010016      	mov	__dsPrev,#1
7600                     ; 1795 		LCD_BIT_SET(b1F);
7602  002c 5f            	clrw	x
7603  002d c60018        	ld	a,_iLF_DEF+24
7604  0030 97            	ld	xl,a
7605  0031 d6540c        	ld	a,(21516,x)
7606  0034 ca0018        	or	a,_bLF_DEF+24
7607  0037 d7540c        	ld	(21516,x),a
7608                     ; 1796 		LCD_BIT_SET(b1E);
7610  003a c6002b        	ld	a,_iLF_DEF+43
7611  003d 8d9b009b      	callf	LC045
7612  0041 ca002b        	or	a,_bLF_DEF+43
7613  0044 d7540c        	ld	(21516,x),a
7614                     ; 1797 		LCD_BIT_SET(b1G);
7616  0047 c6002a        	ld	a,_iLF_DEF+42
7617  004a 8d9b009b      	callf	LC045
7618  004e ca002a        	or	a,_bLF_DEF+42
7619  0051 d7540c        	ld	(21516,x),a
7620                     ; 1798 		LCD_BIT_SET(b1C);
7622  0054 c6003d        	ld	a,_iLF_DEF+61
7623  0057 8d9b009b      	callf	LC045
7624  005b ca003d        	or	a,_bLF_DEF+61
7625  005e d7540c        	ld	(21516,x),a
7626                     ; 1799 		LCD_BIT_SET(b1D);
7628  0061 c6003e        	ld	a,_iLF_DEF+62
7629  0064 8d9b009b      	callf	LC045
7630  0068 ca003e        	or	a,_bLF_DEF+62
7631  006b d7540c        	ld	(21516,x),a
7632                     ; 1801 		if( _d485_id == 0 )
7634  006e c60020        	ld	a,__d485_id
7635  0071 2614          	jrne	L3042
7636                     ; 1803 			LCD_BIT_CLEAR(b1D);
7638  0073 c6003e        	ld	a,_iLF_DEF+62
7639  0076 5f            	clrw	x
7640  0077 97            	ld	xl,a
7641  0078 c6003e        	ld	a,_bLF_DEF+62
7642  007b 43            	cpl	a
7643  007c d4540c        	and	a,(21516,x)
7644  007f d7540c        	ld	(21516,x),a
7645                     ; 1804 			_disp_485(debug_hn);
7647  0082 c60000        	ld	a,_debug_hn
7650  0085 2003          	jra	L5042
7651  0087               L3042:
7652                     ; 1808 			_disp_485(debug_br);
7654  0087 c60000        	ld	a,_debug_br
7656  008a               L5042:
7657  008a 8d000000      	callf	f__disp_485
7658                     ; 1810 		_d485_id = _d485_id==0 ? 1 : 0;
7660  008e c60020        	ld	a,__d485_id
7661  0091 2603          	jrne	L0141
7662  0093 4c            	inc	a
7663  0094 2001          	jra	L2141
7664  0096               L0141:
7665  0096 4f            	clr	a
7666  0097               L2141:
7667  0097 c70020        	ld	__d485_id,a
7668                     ; 1812 }
7671  009a 87            	retf	
7672  009b               LC045:
7673  009b 5f            	clrw	x
7674  009c 97            	ld	xl,a
7675  009d d6540c        	ld	a,(21516,x)
7676  00a0 87            	retf	
7678                     	switch	.data
7679  0021               _error_display_refresh:
7680  0021 00            	dc.b	0
7762                     ; 1816 void	disp_statusCb(uint8_t key)
7762                     ; 1817 {
7763                     .text:	section	.text,new
7764  0000               f_disp_statusCb:
7766  0000 88            	push	a
7767  0001 89            	pushw	x
7768       00000002      OFST:	set	2
7771                     ; 1820 	if( _ds == 220 || _ds == 221)
7773  0002 c60014        	ld	a,__ds
7774  0005 a1dc          	cp	a,#220
7775  0007 273d          	jreq	L7042
7777  0009 a1dd          	cp	a,#221
7778  000b 2739          	jreq	L7042
7779                     ; 1824 	if( error != 0 && error_type != 0 )
7781  000d c60000        	ld	a,_error
7782  0010 270f          	jreq	L5342
7784  0012 725d0000      	tnz	_error_type
7785  0016 2709          	jreq	L5342
7786                     ; 1826 			error_display(error_type, error);
7788  0018 97            	ld	xl,a
7789  0019 c60000        	ld	a,_error_type
7790  001c 95            	ld	xh,a
7791  001d 8d000000      	callf	f_error_display
7793  0021               L5342:
7794                     ; 1831 	if( error_display_mode == 1 )
7796  0021 c6000c        	ld	a,_error_display_mode
7797  0024 4a            	dec	a
7798  0025 2612          	jrne	L7342
7799                     ; 1833 		disp_status_error(key, 99);
7801  0027 ae0063        	ldw	x,#99
7802  002a 7b03          	ld	a,(OFST+1,sp)
7803  002c 95            	ld	xh,a
7804  002d 8d000000      	callf	f_disp_status_error
7806                     ; 1834 		error_display_refresh = 1;
7808  0031 35010021      	mov	_error_display_refresh,#1
7809                     ; 1837 			return;
7811  0035 ac4e024e      	jra	L5442
7812  0039               L7342:
7813                     ; 1840 	if( error_display_refresh == 1 )
7815  0039 c60021        	ld	a,_error_display_refresh
7816  003c 4a            	dec	a
7817  003d 2607          	jrne	L7042
7818                     ; 1842 		error_display_refresh = 0;
7820  003f c70021        	ld	_error_display_refresh,a
7821                     ; 1843 		disp_status_loop_init();
7823  0042 8d000000      	callf	f_disp_status_loop_init
7825  0046               L7042:
7826                     ; 1846 ERROR_JUMP:
7826                     ; 1847 	if( _ds == 1 )			disp_status_id(key, 37);// disp_status_id(key, 36);
7828  0046 c60014        	ld	a,__ds
7829  0049 a101          	cp	a,#1
7830  004b 260e          	jrne	L3442
7833  004d ae0025        	ldw	x,#37
7834  0050 7b03          	ld	a,(OFST+1,sp)
7835  0052 95            	ld	xh,a
7836  0053 8d000000      	callf	f_disp_status_id
7839  0057 ac4e024e      	jra	L5442
7840  005b               L3442:
7841                     ; 1848 	else if( _ds == 36 )	disp_status_toffset(key, 37);
7843  005b a124          	cp	a,#36
7844  005d 260e          	jrne	L7442
7847  005f ae0025        	ldw	x,#37
7848  0062 7b03          	ld	a,(OFST+1,sp)
7849  0064 95            	ld	xh,a
7850  0065 8d000000      	callf	f_disp_status_toffset
7853  0069 ac4e024e      	jra	L5442
7854  006d               L7442:
7855                     ; 1849 	else if( _ds == 37 )	
7857  006d a125          	cp	a,#37
7858  006f 2619          	jrne	L3542
7859                     ; 1851 		t = disp_status_run(key, 38, 1);
7861  0071 4b01          	push	#1
7862  0073 ae0026        	ldw	x,#38
7863  0076 7b04          	ld	a,(OFST+2,sp)
7864  0078 95            	ld	xh,a
7865  0079 8d000000      	callf	f_disp_status_run
7867  007d 5b01          	addw	sp,#1
7868                     ; 1852 		if( t == 1 )
7870  007f 4a            	dec	a
7871  0080 26e7          	jrne	L5442
7872                     ; 1853 			_ds = 100;
7874  0082 35640014      	mov	__ds,#100
7875  0086 ac4e024e      	jra	L5442
7876  008a               L3542:
7877                     ; 1855 	else if( _ds == 38 )	disp_status_exit(key, 100);
7879  008a a126          	cp	a,#38
7880  008c 260e          	jrne	L1642
7883  008e ae0064        	ldw	x,#100
7884  0091 7b03          	ld	a,(OFST+1,sp)
7885  0093 95            	ld	xh,a
7886  0094 8d000000      	callf	f_disp_status_exit
7889  0098 ac4e024e      	jra	L5442
7890  009c               L1642:
7891                     ; 1857 	else if( _ds == 2 )		disp_status_id(key, 3);
7893  009c a102          	cp	a,#2
7894  009e 260e          	jrne	L5642
7897  00a0 ae0003        	ldw	x,#3
7898  00a3 7b03          	ld	a,(OFST+1,sp)
7899  00a5 95            	ld	xh,a
7900  00a6 8d000000      	callf	f_disp_status_id
7903  00aa ac4e024e      	jra	L5442
7904  00ae               L5642:
7905                     ; 1858 	else if( _ds == 3 )	
7907  00ae a103          	cp	a,#3
7908  00b0 2619          	jrne	L1742
7909                     ; 1860 		t = disp_status_run_id(key, 38, 2);
7911  00b2 4b02          	push	#2
7912  00b4 ae0026        	ldw	x,#38
7913  00b7 7b04          	ld	a,(OFST+2,sp)
7914  00b9 95            	ld	xh,a
7915  00ba 8d000000      	callf	f_disp_status_run_id
7917  00be 5b01          	addw	sp,#1
7918                     ; 1861 		if( t == 1 )
7920  00c0 4a            	dec	a
7921  00c1 26e7          	jrne	L5442
7922                     ; 1862 			_ds = 100;
7924  00c3 35640014      	mov	__ds,#100
7925  00c7 ac4e024e      	jra	L5442
7926  00cb               L1742:
7927                     ; 1865 	else if( _ds == 9 )		disp_status_run_op(key, 61);
7929  00cb a109          	cp	a,#9
7930  00cd 260e          	jrne	L7742
7933  00cf ae003d        	ldw	x,#61
7934  00d2 7b03          	ld	a,(OFST+1,sp)
7935  00d4 95            	ld	xh,a
7936  00d5 8d000000      	callf	f_disp_status_run_op
7939  00d9 ac4e024e      	jra	L5442
7940  00dd               L7742:
7941                     ; 1866 	else if( _ds == 61 )	disp_status_cntl_op(key, 63);
7943  00dd a13d          	cp	a,#61
7944  00df 260e          	jrne	L3052
7947  00e1 ae003f        	ldw	x,#63
7948  00e4 7b03          	ld	a,(OFST+1,sp)
7949  00e6 95            	ld	xh,a
7950  00e7 8d000000      	callf	f_disp_status_cntl_op
7953  00eb ac4e024e      	jra	L5442
7954  00ef               L3052:
7955                     ; 1867 	else if( _ds == 63 )	disp_status_valveCount(key, 64);
7957  00ef a13f          	cp	a,#63
7958  00f1 260e          	jrne	L7052
7961  00f3 ae0040        	ldw	x,#64
7962  00f6 7b03          	ld	a,(OFST+1,sp)
7963  00f8 95            	ld	xh,a
7964  00f9 8d000000      	callf	f_disp_status_valveCount
7967  00fd ac4e024e      	jra	L5442
7968  0101               L7052:
7969                     ; 1868 	else if( _ds == 64 )	disp_status_houseCapa(key, /*65*/66);	//	if opMode==0, skip
7971  0101 a140          	cp	a,#64
7972  0103 260e          	jrne	L3152
7975  0105 ae0042        	ldw	x,#66
7976  0108 7b03          	ld	a,(OFST+1,sp)
7977  010a 95            	ld	xh,a
7978  010b 8d000000      	callf	f_disp_status_houseCapa
7981  010f ac4e024e      	jra	L5442
7982  0113               L3152:
7983                     ; 1871 	else if( _ds == 66 )	disp_status_lpm(key, /*67*/68);		//	세대밸브 if cntlMode==1, skip
7985  0113 a142          	cp	a,#66
7986  0115 260e          	jrne	L7152
7989  0117 ae0044        	ldw	x,#68
7990  011a 7b03          	ld	a,(OFST+1,sp)
7991  011c 95            	ld	xh,a
7992  011d 8d000000      	callf	f_disp_status_lpm
7995  0121 ac4e024e      	jra	L5442
7996  0125               L7152:
7997                     ; 1875 	else if( _ds == 68 )	disp_status_valveinfo(key, 69, 68);
7999  0125 a144          	cp	a,#68
8000  0127 2611          	jrne	L3252
8003  0129 4b44          	push	#68
8004  012b ae0045        	ldw	x,#69
8005  012e 7b04          	ld	a,(OFST+2,sp)
8006  0130 95            	ld	xh,a
8007  0131 8d000000      	callf	f_disp_status_valveinfo
8009  0135 84            	pop	a
8011  0136 ac4e024e      	jra	L5442
8012  013a               L3252:
8013                     ; 1876 	else if( _ds == 69 )	disp_status_plc(key, 70);
8015  013a a145          	cp	a,#69
8016  013c 260e          	jrne	L7252
8019  013e ae0046        	ldw	x,#70
8020  0141 7b03          	ld	a,(OFST+1,sp)
8021  0143 95            	ld	xh,a
8022  0144 8d000000      	callf	f_disp_status_plc
8025  0148 ac4e024e      	jra	L5442
8026  014c               L7252:
8027                     ; 1877 	else if( _ds == 70 )	
8029  014c a146          	cp	a,#70
8030  014e 2619          	jrne	L3352
8031                     ; 1879 		t = disp_status_run(key, 71, 9);
8033  0150 4b09          	push	#9
8034  0152 ae0047        	ldw	x,#71
8035  0155 7b04          	ld	a,(OFST+2,sp)
8036  0157 95            	ld	xh,a
8037  0158 8d000000      	callf	f_disp_status_run
8039  015c 5b01          	addw	sp,#1
8040                     ; 1880 		if( t == 1 )
8042  015e 4a            	dec	a
8043  015f 26e7          	jrne	L5442
8044                     ; 1881 			_ds = 100;
8046  0161 35640014      	mov	__ds,#100
8047  0165 ac4e024e      	jra	L5442
8048  0169               L3352:
8049                     ; 1883 	else if( _ds == 71 )	disp_status_exit(key, 100);
8051  0169 a147          	cp	a,#71
8052  016b 260e          	jrne	L1452
8055  016d ae0064        	ldw	x,#100
8056  0170 7b03          	ld	a,(OFST+1,sp)
8057  0172 95            	ld	xh,a
8058  0173 8d000000      	callf	f_disp_status_exit
8061  0177 ac4e024e      	jra	L5442
8062  017b               L1452:
8063                     ; 1885 	else if( _ds == 10 )	
8065  017b a10a          	cp	a,#10
8066  017d 2619          	jrne	L5452
8067                     ; 1887 		t = disp_status_run(key, 11, 9);
8069  017f 4b09          	push	#9
8070  0181 ae000b        	ldw	x,#11
8071  0184 7b04          	ld	a,(OFST+2,sp)
8072  0186 95            	ld	xh,a
8073  0187 8d000000      	callf	f_disp_status_run
8075  018b 5b01          	addw	sp,#1
8076                     ; 1888 		if( t == 1 )
8078  018d 4a            	dec	a
8079  018e 26e7          	jrne	L5442
8080                     ; 1889 			_ds = 100;
8082  0190 35640014      	mov	__ds,#100
8083  0194 ac4e024e      	jra	L5442
8084  0198               L5452:
8085                     ; 1891 	else if( _ds == 11 )	disp_status_exit(key, 100);
8087  0198 a10b          	cp	a,#11
8088  019a 260e          	jrne	L3552
8091  019c ae0064        	ldw	x,#100
8092  019f 7b03          	ld	a,(OFST+1,sp)
8093  01a1 95            	ld	xh,a
8094  01a2 8d000000      	callf	f_disp_status_exit
8097  01a6 ac4e024e      	jra	L5442
8098  01aa               L3552:
8099                     ; 1893 	else if( _ds == 12 )	disp_status_exit(key, 100);
8101  01aa a10c          	cp	a,#12
8102  01ac 260e          	jrne	L7552
8105  01ae ae0064        	ldw	x,#100
8106  01b1 7b03          	ld	a,(OFST+1,sp)
8107  01b3 95            	ld	xh,a
8108  01b4 8d000000      	callf	f_disp_status_exit
8111  01b8 ac4e024e      	jra	L5442
8112  01bc               L7552:
8113                     ; 1894 	else if( _ds == 15 )	
8115  01bc a10f          	cp	a,#15
8116  01be 2617          	jrne	L3652
8117                     ; 1896 		t = disp_status_run(key, 11, 20);
8119  01c0 4b14          	push	#20
8120  01c2 ae000b        	ldw	x,#11
8121  01c5 7b04          	ld	a,(OFST+2,sp)
8122  01c7 95            	ld	xh,a
8123  01c8 8d000000      	callf	f_disp_status_run
8125  01cc 5b01          	addw	sp,#1
8126                     ; 1897 		if( t == 1 )
8128  01ce 4a            	dec	a
8129  01cf 267d          	jrne	L5442
8130                     ; 1898 			_ds = 100;
8132  01d1 35640014      	mov	__ds,#100
8133  01d5 2077          	jra	L5442
8134  01d7               L3652:
8135                     ; 1900 	else if( _ds == 33 )	disp_status_toffset(key, 34);	//	mainR/C only
8137  01d7 a121          	cp	a,#33
8138  01d9 260c          	jrne	L1752
8141  01db ae0022        	ldw	x,#34
8142  01de 7b03          	ld	a,(OFST+1,sp)
8143  01e0 95            	ld	xh,a
8144  01e1 8d000000      	callf	f_disp_status_toffset
8147  01e5 2067          	jra	L5442
8148  01e7               L1752:
8149                     ; 1901 	else if( _ds == 34 )	
8151  01e7 a122          	cp	a,#34
8152  01e9 2617          	jrne	L5752
8153                     ; 1903 		t = disp_status_run(key, 35, 33);
8155  01eb 4b21          	push	#33
8156  01ed ae0023        	ldw	x,#35
8157  01f0 7b04          	ld	a,(OFST+2,sp)
8158  01f2 95            	ld	xh,a
8159  01f3 8d000000      	callf	f_disp_status_run
8161  01f7 5b01          	addw	sp,#1
8162                     ; 1904 		if( t == 1 )
8164  01f9 4a            	dec	a
8165  01fa 2652          	jrne	L5442
8166                     ; 1905 			_ds = 100;
8168  01fc 35640014      	mov	__ds,#100
8169  0200 204c          	jra	L5442
8170  0202               L5752:
8171                     ; 1907 	else if( _ds == 35 )	disp_status_exit(key, 100);
8173  0202 a123          	cp	a,#35
8174  0204 260c          	jrne	L3062
8177  0206 ae0064        	ldw	x,#100
8178  0209 7b03          	ld	a,(OFST+1,sp)
8179  020b 95            	ld	xh,a
8180  020c 8d000000      	callf	f_disp_status_exit
8183  0210 203c          	jra	L5442
8184  0212               L3062:
8185                     ; 1909 	else if( _ds == 41 )	disp_status_command(key);
8187  0212 a129          	cp	a,#41
8188  0214 2608          	jrne	L7062
8191  0216 7b03          	ld	a,(OFST+1,sp)
8192  0218 8d000000      	callf	f_disp_status_command
8195  021c 2030          	jra	L5442
8196  021e               L7062:
8197                     ; 1911 	else if( _ds == 100 )	
8199  021e a164          	cp	a,#100
8200  0220 2616          	jrne	L3162
8201                     ; 1913 		__s = 0;
8203  0222 725f0000      	clr	___s
8204                     ; 1914 		_dsCount = 0;
8206  0226 725f0015      	clr	__dsCount
8207                     ; 1915 		_ds = 99;	
8209  022a 35630014      	mov	__ds,#99
8210                     ; 1916 		_dsPrev = 0xff;
8212  022e 35ff0016      	mov	__dsPrev,#255
8213                     ; 1917 		_remote = 0;
8215  0232 725f0000      	clr	__remote
8217  0236 2016          	jra	L5442
8218  0238               L3162:
8219                     ; 1919 	else if( _ds == 101 || _ds == 133 )
8221  0238 a165          	cp	a,#101
8222  023a 2704          	jreq	L1262
8224  023c a185          	cp	a,#133
8225  023e 2611          	jrne	L7162
8226  0240               L1262:
8227                     ; 1922 		_dsCount = __timer1s;
8229  0240 5500000015    	mov	__dsCount,___timer1s
8230                     ; 1923 		_dsPrev = _ds - 100;
8232  0245 a064          	sub	a,#100
8233  0247 c70016        	ld	__dsPrev,a
8234                     ; 1924 		_ds = 200;
8236  024a 35c80014      	mov	__ds,#200
8238  024e               L5442:
8239                     ; 2043 }
8242  024e 5b03          	addw	sp,#3
8243  0250 87            	retf	
8244  0251               L7162:
8245                     ; 1926 	else if (_ds == 150)							// 온도보상
8247  0251 a196          	cp	a,#150
8248  0253 260c          	jrne	L5262
8249                     ; 1928 		disp_status_toffset(key, 151);	//	mainR/C only
8251  0255 ae0097        	ldw	x,#151
8252  0258 7b03          	ld	a,(OFST+1,sp)
8253  025a 95            	ld	xh,a
8254  025b 8d000000      	callf	f_disp_status_toffset
8257  025f 20ed          	jra	L5442
8258  0261               L5262:
8259                     ; 1930 	else if (_ds == 151)							// 백라이트
8261  0261 a197          	cp	a,#151
8262  0263 260c          	jrne	L1362
8263                     ; 1932 		disp_status_backlight2(key, 153);
8265  0265 ae0099        	ldw	x,#153
8266  0268 7b03          	ld	a,(OFST+1,sp)
8267  026a 95            	ld	xh,a
8268  026b 8d000000      	callf	f_disp_status_backlight2
8271  026f 20dd          	jra	L5442
8272  0271               L1362:
8273                     ; 1934 	else if (_ds == 152) 
8275  0271 a198          	cp	a,#152
8276  0273 2617          	jrne	L5362
8277                     ; 1936 		t = disp_status_run(key, 153, 150);
8279  0275 4b96          	push	#150
8280  0277 ae0099        	ldw	x,#153
8281  027a 7b04          	ld	a,(OFST+2,sp)
8282  027c 95            	ld	xh,a
8283  027d 8d000000      	callf	f_disp_status_run
8285  0281 5b01          	addw	sp,#1
8286                     ; 1937 		if( t == 1 )
8288  0283 4a            	dec	a
8289  0284 26c8          	jrne	L5442
8290                     ; 1938 			_ds = 100;
8292  0286 35640014      	mov	__ds,#100
8293  028a 20c2          	jra	L5442
8294  028c               L5362:
8295                     ; 1940 	else if (_ds == 153)
8297  028c a199          	cp	a,#153
8298  028e 260b          	jrne	L3462
8299                     ; 1942 		_ds = 100;
8301  0290 35640014      	mov	__ds,#100
8302                     ; 1943 		file_update2(0);
8304  0294 4f            	clr	a
8305  0295 8d000000      	callf	f_file_update2
8308  0299 20b3          	jra	L5442
8309  029b               L3462:
8310                     ; 1946 	else if (_ds == 160)							// 온도보상
8312  029b a1a0          	cp	a,#160
8313  029d 260c          	jrne	L7462
8314                     ; 1948 		disp_status_toffset(key, 161);	//	mainR/C only
8316  029f ae00a1        	ldw	x,#161
8317  02a2 7b03          	ld	a,(OFST+1,sp)
8318  02a4 95            	ld	xh,a
8319  02a5 8d000000      	callf	f_disp_status_toffset
8322  02a9 20a3          	jra	L5442
8323  02ab               L7462:
8324                     ; 1950 	else if (_ds == 161)							// 백라이트
8326  02ab a1a1          	cp	a,#161
8327  02ad 260c          	jrne	L3562
8328                     ; 1952 		disp_status_backlight2(key, 162);
8330  02af ae00a2        	ldw	x,#162
8331  02b2 7b03          	ld	a,(OFST+1,sp)
8332  02b4 95            	ld	xh,a
8333  02b5 8d000000      	callf	f_disp_status_backlight2
8336  02b9 2093          	jra	L5442
8337  02bb               L3562:
8338                     ; 1954 	else if( _ds == 162 )
8340  02bb a1a2          	cp	a,#162
8341  02bd 2606          	jrne	L7562
8342                     ; 1956 		_ds = 100;
8344  02bf 35640014      	mov	__ds,#100
8346  02c3 2089          	jra	L5442
8347  02c5               L7562:
8348                     ; 1958 	else if( _ds == 200 )
8350  02c5 a1c8          	cp	a,#200
8351  02c7 261d          	jrne	L3662
8352                     ; 1960 		if( _dsCount == __timer1s )
8354  02c9 c60015        	ld	a,__dsCount
8355  02cc c10000        	cp	a,___timer1s
8356  02cf 2604ac4e024e  	jreq	L5442
8357                     ; 1961 			return;
8359                     ; 1962 		STATUS_NEXT(_dsPrev);
8361  02d5 5500160014    	mov	__ds,__dsPrev
8364  02da 725f0015      	clr	__dsCount
8367  02de 35ff0016      	mov	__dsPrev,#255
8370  02e2 ac4e024e      	jra	L5442
8371  02e6               L3662:
8372                     ; 1966 	else if( _ds == 81 )	{	disp_write_file(12);	}
8374  02e6 a151          	cp	a,#81
8375  02e8 260a          	jrne	L1762
8378  02ea a60c          	ld	a,#12
8379  02ec 8d000000      	callf	f_disp_write_file
8382  02f0 ac4e024e      	jra	L5442
8383  02f4               L1762:
8384                     ; 1967 	else if( _ds == 95 )	{	disp_485(12);	}
8386  02f4 a15f          	cp	a,#95
8387  02f6 260a          	jrne	L5762
8390  02f8 a60c          	ld	a,#12
8391  02fa 8d000000      	callf	f_disp_485
8394  02fe ac4e024e      	jra	L5442
8395  0302               L5762:
8396                     ; 1968 	else if( _ds == 96 )	{	disp_write_file(12);	}
8398  0302 a160          	cp	a,#96
8399  0304 260a          	jrne	L1072
8402  0306 a60c          	ld	a,#12
8403  0308 8d000000      	callf	f_disp_write_file
8406  030c ac4e024e      	jra	L5442
8407  0310               L1072:
8408                     ; 1969 	else if( _ds == 97 )
8410  0310 a161          	cp	a,#97
8411  0312 261c          	jrne	L5072
8412                     ; 1971 		disp_status_error(key, 99);
8414  0314 ae0063        	ldw	x,#99
8415  0317 7b03          	ld	a,(OFST+1,sp)
8416  0319 95            	ld	xh,a
8417  031a 8d000000      	callf	f_disp_status_error
8419                     ; 1973 			if( error == 0 && error_type == 0 )
8421  031e c60000        	ld	a,_error
8422  0321 26e9          	jrne	L5442
8424  0323 c60000        	ld	a,_error_type
8425  0326 26e4          	jrne	L5442
8426                     ; 1976 				_ds = 100;
8428  0328 35640014      	mov	__ds,#100
8429  032c ac4e024e      	jra	L5442
8430  0330               L5072:
8431                     ; 1986 	else if( _ds == 99 )
8433  0330 a163          	cp	a,#99
8434  0332 2704acb403b4  	jrne	L3172
8435                     ; 1990 		if (key == 200) {
8437  0338 7b03          	ld	a,(OFST+1,sp)
8438  033a a1c8          	cp	a,#200
8439  033c 2604          	jrne	L5172
8440                     ; 1991 			j = 2;
8442                     ; 1992 			_disp_temp = 1;
8444  033e 35010008      	mov	__disp_temp,#1
8445  0342               L5172:
8446                     ; 1994 		if( key == 220 )
8448  0342 a1dc          	cp	a,#220
8449  0344 2616          	jrne	L7172
8450                     ; 1997 			uiInfo.remote_t[0] = __s;
8452  0346 5500000066    	mov	_uiInfo+101,___s
8453                     ; 1998 			uiInfo.remote_t[1] = _dsCount;
8455  034b 5500150067    	mov	_uiInfo+102,__dsCount
8456                     ; 1999 			__s = 200;
8458  0350 35c80000      	mov	___s,#200
8459                     ; 2000 			_dsCount = 0;
8461  0354 725f0015      	clr	__dsCount
8462                     ; 2001 			_disp_temp = 1;
8464  0358 35010008      	mov	__disp_temp,#1
8465  035c               L7172:
8466                     ; 2004 		t = getCurrTemp();
8468  035c 8d000000      	callf	f_getCurrTemp
8470  0360 6b02          	ld	(OFST+0,sp),a
8471                     ; 2005 		if( uiInfo.tOffset != 100 )
8473  0362 c60012        	ld	a,_uiInfo+17
8474  0365 a164          	cp	a,#100
8475  0367 2711          	jreq	L1272
8476                     ; 2007 			if( uiInfo.tOffset > 100 )
8478  0369 a165          	cp	a,#101
8479  036b 2506          	jrult	L3272
8480                     ; 2008 				t = t + (uiInfo.tOffset-100);
8482  036d a064          	sub	a,#100
8483  036f 1b02          	add	a,(OFST+0,sp)
8485  0371 2005          	jpf	LC046
8486  0373               L3272:
8487                     ; 2010 				t = t - uiInfo.tOffset;
8489  0373 7b02          	ld	a,(OFST+0,sp)
8490  0375 c00012        	sub	a,_uiInfo+17
8491  0378               LC046:
8492  0378 6b02          	ld	(OFST+0,sp),a
8493  037a               L1272:
8494                     ; 2012 		if( uiInfo.tCurr != t )
8496  037a c60003        	ld	a,_uiInfo+2
8497  037d 1102          	cp	a,(OFST+0,sp)
8498  037f 2716          	jreq	L7272
8499                     ; 2014 			uiInfo.tCurr = t;
8501  0381 7b02          	ld	a,(OFST+0,sp)
8502  0383 c70003        	ld	_uiInfo+2,a
8503                     ; 2015 			if( _remote == 0 )
8505  0386 c60000        	ld	a,__remote
8506  0389 260c          	jrne	L7272
8507                     ; 2018 				if( _disp_temp == 1 )
8509  038b c60008        	ld	a,__disp_temp
8510  038e 4a            	dec	a
8511  038f 2606          	jrne	L7272
8512                     ; 2019 					ui_disp_temp_curr(t);
8514  0391 7b02          	ld	a,(OFST+0,sp)
8515  0393 8d000000      	callf	f_ui_disp_temp_curr
8517  0397               L7272:
8518                     ; 2023 		_disp_temp = 0;
8520  0397 725f0008      	clr	__disp_temp
8521                     ; 2026 		if( uiInfo.mode == 0 )	
8523  039b c60009        	ld	a,_uiInfo+8
8524  039e 260a          	jrne	L5372
8525                     ; 2027 			disp_status_loop_client(key);
8527  03a0 7b03          	ld	a,(OFST+1,sp)
8528  03a2 8d000000      	callf	f_disp_status_loop_client
8531  03a6 ac4e024e      	jra	L5442
8532  03aa               L5372:
8533                     ; 2029 			disp_status_loop_host(key);
8535  03aa 7b03          	ld	a,(OFST+1,sp)
8536  03ac 8d000000      	callf	f_disp_status_loop_host
8538  03b0 ac4e024e      	jra	L5442
8539  03b4               L3172:
8540                     ; 2031 	else if( _ds == 220 )
8542  03b4 a1dc          	cp	a,#220
8543  03b6 260e          	jrne	L3472
8544                     ; 2033 		disp_status_id(key, 221);
8546  03b8 ae00dd        	ldw	x,#221
8547  03bb 7b03          	ld	a,(OFST+1,sp)
8548  03bd 95            	ld	xh,a
8549  03be 8d000000      	callf	f_disp_status_id
8552  03c2 ac4e024e      	jra	L5442
8553  03c6               L3472:
8554                     ; 2035 	else if( _ds == 221 )
8556  03c6 a1dd          	cp	a,#221
8557  03c8 26f8          	jrne	L5442
8558                     ; 2037 		FW_ID(uiInfoSet.id);
8560  03ca c6006f        	ld	a,_uiInfoSet+1
8561  03cd 97            	ld	xl,a
8562  03ce a60a          	ld	a,#10
8563  03d0 95            	ld	xh,a
8564  03d1 8d000000      	callf	f_file_write
8566                     ; 2038 		FW_MODE(uiInfoSet.mode);
8568  03d5 c60073        	ld	a,_uiInfoSet+5
8569  03d8 97            	ld	xl,a
8570  03d9 a609          	ld	a,#9
8571  03db 95            	ld	xh,a
8572  03dc 8d000000      	callf	f_file_write
8574                     ; 2039 		uiInfo.id = uiInfoSet.id;
8576  03e0 55006f0005    	mov	_uiInfo+4,_uiInfoSet+1
8577                     ; 2040 		uiInfo.mode = uiInfoSet.mode;
8579  03e5 5500730009    	mov	_uiInfo+8,_uiInfoSet+5
8580                     ; 2041 			_ds = 100;
8582  03ea 35640014      	mov	__ds,#100
8583  03ee ac4e024e      	jra	L5442
8626                     ; 2045 void	copy_info(uint8_t next)
8626                     ; 2046 {
8627                     .text:	section	.text,new
8628  0000               f_copy_info:
8630  0000 88            	push	a
8631       00000001      OFST:	set	1
8634                     ; 2048 	disp_set_state(next);
8636  0001 8d000000      	callf	f_disp_set_state
8638                     ; 2049 	uiInfoSet.id = uiInfo.id;
8640  0005 550005006f    	mov	_uiInfoSet+1,_uiInfo+4
8641                     ; 2050 	uiInfoSet.cnt = uiInfo.cnt;
8643  000a 5500060070    	mov	_uiInfoSet+2,_uiInfo+5
8644                     ; 2051 	uiInfoSet.cnt_sub = uiInfo.cnt_sub;
8646  000f 5500070071    	mov	_uiInfoSet+3,_uiInfo+6
8647                     ; 2052 	uiInfoSet.opMode = uiInfo.opMode;
8649  0014 5500080072    	mov	_uiInfoSet+4,_uiInfo+7
8650                     ; 2053 	uiInfoSet.mode = uiInfo.mode;
8652  0019 5500090073    	mov	_uiInfoSet+5,_uiInfo+8
8653                     ; 2054 	uiInfoSet.controlMode = uiInfo.controlMode;
8655  001e 55000a0074    	mov	_uiInfoSet+6,_uiInfo+9
8656                     ; 2055 	uiInfoSet.valve = uiInfo.valve;
8658  0023 55000b0075    	mov	_uiInfoSet+7,_uiInfo+10
8659                     ; 2056 	uiInfoSet.valve_sub = uiInfo.valve_sub;
8661  0028 55000c0076    	mov	_uiInfoSet+8,_uiInfo+11
8662                     ; 2057 	uiInfoSet.poType = uiInfo.poType;
8664  002d 5500100077    	mov	_uiInfoSet+9,_uiInfo+15
8665                     ; 2058 	uiInfoSet.houseCapa = uiInfo.houseCapa;
8667  0032 5500110078    	mov	_uiInfoSet+10,_uiInfo+16
8668                     ; 2059 	uiInfoSet.tOffset = uiInfo.tOffset;
8670  0037 5500120079    	mov	_uiInfoSet+11,_uiInfo+17
8671                     ; 2060 	uiInfoSet.tempOffset = uiInfo.tempOffset;
8673  003c 550013007a    	mov	_uiInfoSet+12,_uiInfo+18
8674                     ; 2061 	uiInfoSet.lpmType = uiInfo.lpmType;
8676  0041 550014007b    	mov	_uiInfoSet+13,_uiInfo+19
8677                     ; 2062 	uiInfoSet.lpmType_sub = uiInfo.lpmType_sub;
8679  0046 550015007c    	mov	_uiInfoSet+14,_uiInfo+20
8680                     ; 2063 	uiInfoSet.subRCLock = uiInfo.subRCLock;
8682  004b 55005e009d    	mov	_uiInfoSet+47,_uiInfo+93
8683                     ; 2064 	uiInfoSet.cntlMode = uiInfo.cntlMode;
8685                     ; 2065 	for( i=0; i<8; i++ )
8687  0050 4f            	clr	a
8688  0051 550004006e    	mov	_uiInfoSet,_uiInfo+3
8689  0056 6b01          	ld	(OFST+0,sp),a
8690  0058               L7672:
8691                     ; 2067 		uiInfoSet.valve_len[i] = uiInfo.valve_len[i];
8693  0058 5f            	clrw	x
8694  0059 97            	ld	xl,a
8695  005a d60016        	ld	a,(_uiInfo+21,x)
8696  005d d7007d        	ld	(_uiInfoSet+15,x),a
8697                     ; 2068 		uiInfoSet.valve_rc[i] = uiInfo.valve_rc[i];
8699  0060 5f            	clrw	x
8700  0061 7b01          	ld	a,(OFST+0,sp)
8701  0063 97            	ld	xl,a
8702  0064 d6001e        	ld	a,(_uiInfo+29,x)
8703  0067 d70085        	ld	(_uiInfoSet+23,x),a
8704                     ; 2069 		uiInfoSet.valve_sub_len[i] = uiInfo.valve_sub_len[i];
8706  006a 5f            	clrw	x
8707  006b 7b01          	ld	a,(OFST+0,sp)
8708  006d 97            	ld	xl,a
8709  006e d60026        	ld	a,(_uiInfo+37,x)
8710  0071 d7008d        	ld	(_uiInfoSet+31,x),a
8711                     ; 2070 		uiInfoSet.valve_sub_rc[i] = uiInfo.valve_sub_rc[i];
8713  0074 5f            	clrw	x
8714  0075 7b01          	ld	a,(OFST+0,sp)
8715  0077 97            	ld	xl,a
8716  0078 d6002e        	ld	a,(_uiInfo+45,x)
8717  007b d70095        	ld	(_uiInfoSet+39,x),a
8718                     ; 2065 	for( i=0; i<8; i++ )
8720  007e 0c01          	inc	(OFST+0,sp)
8723  0080 7b01          	ld	a,(OFST+0,sp)
8724  0082 a108          	cp	a,#8
8725  0084 25d2          	jrult	L7672
8726                     ; 2072 	uiInfoSet.plc = uiInfo.plc;
8728  0086 55006500a3    	mov	_uiInfoSet+53,_uiInfo+100
8729                     ; 2078 	lcd_blink_npos_clear();
8731  008b 8d000000      	callf	f_lcd_blink_npos_clear
8733                     ; 2079 	lcd_blink_clear();
8735  008f 8d000000      	callf	f_lcd_blink_clear
8737                     ; 2080 }
8740  0093 84            	pop	a
8741  0094 87            	retf	
8775                     ; 2084 void	copy_infoSet(void)
8775                     ; 2085 {
8776                     .text:	section	.text,new
8777  0000               f_copy_infoSet:
8779       00000001      OFST:	set	1
8782                     ; 2087 	uiInfo.id = uiInfoSet.id;
8784  0000 55006f0005    	mov	_uiInfo+4,_uiInfoSet+1
8785                     ; 2088 	uiInfo.cnt = uiInfoSet.cnt;
8787  0005 5500700006    	mov	_uiInfo+5,_uiInfoSet+2
8788                     ; 2089 	uiInfo.cnt_sub = uiInfoSet.cnt_sub;
8790  000a 5500710007    	mov	_uiInfo+6,_uiInfoSet+3
8791                     ; 2090 	uiInfo.opMode = uiInfoSet.opMode;
8793  000f 5500720008    	mov	_uiInfo+7,_uiInfoSet+4
8794                     ; 2091 	uiInfo.mode = uiInfoSet.mode;
8796  0014 5500730009    	mov	_uiInfo+8,_uiInfoSet+5
8797                     ; 2092 	uiInfo.controlMode = uiInfoSet.controlMode;
8799  0019 550074000a    	mov	_uiInfo+9,_uiInfoSet+6
8800                     ; 2093 	uiInfo.valve = uiInfoSet.valve;
8802  001e 550075000b    	mov	_uiInfo+10,_uiInfoSet+7
8803                     ; 2094 	uiInfo.valve_sub = uiInfoSet.valve_sub;
8805  0023 550076000c    	mov	_uiInfo+11,_uiInfoSet+8
8806                     ; 2095 	uiInfo.poType = uiInfoSet.poType;
8808  0028 5500770010    	mov	_uiInfo+15,_uiInfoSet+9
8809                     ; 2096 	uiInfo.houseCapa = uiInfoSet.houseCapa;
8811  002d 5500780011    	mov	_uiInfo+16,_uiInfoSet+10
8812                     ; 2097 	uiInfo.tOffset = uiInfoSet.tOffset;
8814  0032 5500790012    	mov	_uiInfo+17,_uiInfoSet+11
8815                     ; 2098 	uiInfo.tempOffset = uiInfoSet.tempOffset;
8817  0037 55007a0013    	mov	_uiInfo+18,_uiInfoSet+12
8818                     ; 2099 	uiInfo.lpmType = uiInfoSet.lpmType;
8820  003c 55007b0014    	mov	_uiInfo+19,_uiInfoSet+13
8821                     ; 2100 	uiInfo.lpmType_sub = uiInfoSet.lpmType_sub;
8823  0041 55007c0015    	mov	_uiInfo+20,_uiInfoSet+14
8824                     ; 2101 	uiInfo.subRCLock = uiInfoSet.subRCLock;
8826  0046 55009d005e    	mov	_uiInfo+93,_uiInfoSet+47
8827  004b 88            	push	a
8828                     ; 2102 	uiInfo.cntlMode = uiInfoSet.cntlMode;
8830  004c 55006e0004    	mov	_uiInfo+3,_uiInfoSet
8831                     ; 2103 	for( i=0; i<8; i++ )
8833  0051 4f            	clr	a
8834  0052 6b01          	ld	(OFST+0,sp),a
8835  0054               L1103:
8836                     ; 2105 		uiInfo.valve_len[i] = uiInfoSet.valve_len[i];
8838  0054 5f            	clrw	x
8839  0055 97            	ld	xl,a
8840  0056 d6007d        	ld	a,(_uiInfoSet+15,x)
8841  0059 d70016        	ld	(_uiInfo+21,x),a
8842                     ; 2106 		uiInfo.valve_rc[i] = uiInfoSet.valve_rc[i];
8844  005c 5f            	clrw	x
8845  005d 7b01          	ld	a,(OFST+0,sp)
8846  005f 97            	ld	xl,a
8847  0060 d60085        	ld	a,(_uiInfoSet+23,x)
8848  0063 d7001e        	ld	(_uiInfo+29,x),a
8849                     ; 2107 		uiInfo.valve_sub_len[i] = uiInfoSet.valve_sub_len[i];
8851  0066 5f            	clrw	x
8852  0067 7b01          	ld	a,(OFST+0,sp)
8853  0069 97            	ld	xl,a
8854  006a d6008d        	ld	a,(_uiInfoSet+31,x)
8855  006d d70026        	ld	(_uiInfo+37,x),a
8856                     ; 2108 		uiInfo.valve_sub_rc[i] = uiInfoSet.valve_sub_rc[i];
8858  0070 5f            	clrw	x
8859  0071 7b01          	ld	a,(OFST+0,sp)
8860  0073 97            	ld	xl,a
8861  0074 d60095        	ld	a,(_uiInfoSet+39,x)
8862  0077 d7002e        	ld	(_uiInfo+45,x),a
8863                     ; 2103 	for( i=0; i<8; i++ )
8865  007a 0c01          	inc	(OFST+0,sp)
8868  007c 7b01          	ld	a,(OFST+0,sp)
8869  007e a108          	cp	a,#8
8870  0080 25d2          	jrult	L1103
8871                     ; 2110 	uiInfo.plc = uiInfoSet.plc;
8873  0082 c600a3        	ld	a,_uiInfoSet+53
8874  0085 c70065        	ld	_uiInfo+100,a
8875                     ; 2111 	if( uiInfo.plc == 0 )
8877  0088 2605          	jrne	L7103
8878                     ; 2113 		_boiler_type = 0;
8880  008a c70000        	ld	__boiler_type,a
8882  008d 2008          	jra	L1203
8883  008f               L7103:
8884                     ; 2117 		_boiler_type = 1;
8886  008f 35010000      	mov	__boiler_type,#1
8887                     ; 2118 		uiInfo.plc--;
8889  0093 725a0065      	dec	_uiInfo+100
8890  0097               L1203:
8891                     ; 2120 }
8894  0097 84            	pop	a
8895  0098 87            	retf	
8938                     ; 2125 void	disp_status(uint8_t key)
8938                     ; 2126 {
8939                     .text:	section	.text,new
8940  0000               f_disp_status:
8942  0000 88            	push	a
8943       00000000      OFST:	set	0
8946                     ; 2127 	lcd_blinkCb();
8948  0001 8d000000      	callf	f_lcd_blinkCb
8950                     ; 2129 	disp_statusCb(key);
8952  0005 7b01          	ld	a,(OFST+1,sp)
8953  0007 8d000000      	callf	f_disp_statusCb
8955                     ; 2132 	uiInfo.enc = 0;
8957  000b 725f0001      	clr	_uiInfo
8958                     ; 2135 	if( _updateBit != 0 && _updateTimer != __timer1s )
8960  000f c60006        	ld	a,__updateBit
8961  0012 2778          	jreq	L5403
8963  0014 c60005        	ld	a,__updateTimer
8964  0017 c10000        	cp	a,___timer1s
8965  001a 2770          	jreq	L5403
8966                     ; 2137 		_updateTimer = __timer1s;
8968  001c 5500000005    	mov	__updateTimer,___timer1s
8969                     ; 2138 		_updateCount--;
8971  0021 725a0007      	dec	__updateCount
8972                     ; 2139 		if( _updateCount == 0 )
8974  0025 2665          	jrne	L5403
8975                     ; 2141 			if( (_updateBit&BIT_REPEAT) != 0 )	{FW_REPEAT(uiInfo.repeat);	}
8977  0027 720100060b    	btjf	__updateBit,#0,L1503
8980  002c c6000d        	ld	a,_uiInfo+12
8981  002f 97            	ld	xl,a
8982  0030 a60f          	ld	a,#15
8983  0032 95            	ld	xh,a
8984  0033 8d000000      	callf	f_file_write
8986  0037               L1503:
8987                     ; 2142 			if( (_updateBit&BIT_RESERVE) != 0 )	{FW_RESERVE(uiInfo.reserve);}
8989  0037 720300060b    	btjf	__updateBit,#1,L3503
8992  003c c6000e        	ld	a,_uiInfo+13
8993  003f 97            	ld	xl,a
8994  0040 a610          	ld	a,#16
8995  0042 95            	ld	xh,a
8996  0043 8d000000      	callf	f_file_write
8998  0047               L3503:
8999                     ; 2143 			if( (_updateBit&BIT_TSETUP) != 0 )	
9001  0047 720500061e    	btjf	__updateBit,#2,L5503
9002                     ; 2146 				if( uiInfo._temp[3] != 0 )
9004  004c c60064        	ld	a,_uiInfo+99
9005  004f 270e          	jreq	L7503
9006                     ; 2148 					FW_TSETUP(uiInfo._temp[3]);
9008  0051 97            	ld	xl,a
9009  0052 a611          	ld	a,#17
9010  0054 95            	ld	xh,a
9011  0055 8d000000      	callf	f_file_write
9013                     ; 2149 					uiInfo._temp[3] = 0;
9015  0059 725f0064      	clr	_uiInfo+99
9017  005d 200b          	jra	L5503
9018  005f               L7503:
9019                     ; 2152 					FW_TSETUP(uiInfo.tSetup);
9021  005f c6000f        	ld	a,_uiInfo+14
9022  0062 97            	ld	xl,a
9023  0063 a611          	ld	a,#17
9024  0065 95            	ld	xh,a
9025  0066 8d000000      	callf	f_file_write
9027  006a               L5503:
9028                     ; 2154 			if( (_updateBit&BIT_DISPMODE) != 0 ){
9030  006a 720700060b    	btjf	__updateBit,#3,L3603
9031                     ; 2155 				if (uiInfo.mode == SETTING_MODE_SUB) {
9033                     ; 2157 						FW_DISPMODE(_disp_mode);
9036                     ; 2160 					FW_DISPMODE(_disp_mode);
9039  006f c60000        	ld	a,__disp_mode
9040  0072 97            	ld	xl,a
9041  0073 a629          	ld	a,#41
9042  0075 95            	ld	xh,a
9043  0076 8d000000      	callf	f_file_write
9045  007a               L3603:
9046                     ; 2164 			if( (_updateBit&BIT_REPEAT) != 0 || (_updateBit&BIT_RESERVE) != 0 )	
9048  007a 7200000605    	btjt	__updateBit,#0,L3703
9050  007f 7203000604    	btjf	__updateBit,#1,L1703
9051  0084               L3703:
9052                     ; 2166 				timerEventClear();
9054  0084 8d000000      	callf	f_timerEventClear
9056  0088               L1703:
9057                     ; 2169 			_updateBit = 0;
9059  0088 725f0006      	clr	__updateBit
9060  008c               L5403:
9061                     ; 2172 	if( key==0 )
9063  008c 7b01          	ld	a,(OFST+1,sp)
9064  008e 2602          	jrne	L5703
9065                     ; 2173 		return;
9068  0090 84            	pop	a
9069  0091 87            	retf	
9070  0092               L5703:
9071                     ; 2175 	if( _key_continue == 1 )
9073  0092 c60000        	ld	a,__key_continue
9074  0095 4a            	dec	a
9075  0096 262b          	jrne	L3203
9076                     ; 2177 		if( key==2 )		
9078  0098 7b01          	ld	a,(OFST+1,sp)
9079  009a a102          	cp	a,#2
9080  009c 2606          	jrne	L1013
9081                     ; 2179 			key++;
9083  009e 0c01          	inc	(OFST+1,sp)
9084                     ; 2180 			key--;
9086  00a0 0a01          	dec	(OFST+1,sp)
9087  00a2 7b01          	ld	a,(OFST+1,sp)
9088  00a4               L1013:
9089                     ; 2186 		if( key==8 )	{ copy_info(150);}		
9091  00a4 a108          	cp	a,#8
9092  00a6 2608          	jrne	L3013
9095  00a8 a696          	ld	a,#150
9096  00aa 8d000000      	callf	f_copy_info
9098  00ae 7b01          	ld	a,(OFST+1,sp)
9099  00b0               L3013:
9100                     ; 2188 		if( key==1 )	
9102  00b0 4a            	dec	a
9103  00b1 260c          	jrne	L5013
9104                     ; 2190 			if( uiInfo.mode == 1 )	
9106  00b3 c60009        	ld	a,_uiInfo+8
9107  00b6 4a            	dec	a
9108  00b7 2606          	jrne	L5013
9109                     ; 2191 				disp_statusCb(220);
9111  00b9 a6dc          	ld	a,#220
9112  00bb 8d000000      	callf	f_disp_statusCb
9114  00bf               L5013:
9115                     ; 2207 		if( key==0x10 ){}		//goto SetupRc;	//}
9117                     ; 2208 		_key_continue = 0;
9119  00bf 725f0000      	clr	__key_continue
9120                     ; 2209 		goto SetupEntry;
9122  00c3               L3203:
9123                     ; 2253 SetupEntry:		
9123                     ; 2254 	if( key == 0x88 )
9125  00c3 7b01          	ld	a,(OFST+1,sp)
9126  00c5 a188          	cp	a,#136
9127  00c7 261a          	jrne	L3113
9128                     ; 2256 SetupRoomCntl:		
9128                     ; 2257 		uiInfo.enc = 0;
9130  00c9 725f0001      	clr	_uiInfo
9131                     ; 2258 		if( uiInfo.mode == 0 )
9133  00cd c60009        	ld	a,_uiInfo+8
9134  00d0 2604          	jrne	L5113
9135                     ; 2259 			uiInfo.id = 2;
9137  00d2 35020005      	mov	_uiInfo+4,#2
9138  00d6               L5113:
9139                     ; 2260 		copy_info(uiInfo.mode==0 ? 101 : 133);
9141  00d6 c60009        	ld	a,_uiInfo+8
9142  00d9 2604          	jrne	L2161
9143  00db a665          	ld	a,#101
9144  00dd 2013          	jra	LC048
9145  00df               L2161:
9146  00df a685          	ld	a,#133
9149  00e1 200f          	jpf	LC048
9150  00e3               L3113:
9151                     ; 2262 	else if( key == 0x89 && uiInfo.mode == 1 )
9153  00e3 a189          	cp	a,#137
9154  00e5 260f          	jrne	L7113
9156  00e7 c60009        	ld	a,_uiInfo+8
9157  00ea 4a            	dec	a
9158  00eb 2609          	jrne	L7113
9159                     ; 2264 SetupCommand:		
9159                     ; 2265 		uiInfo.enc = 0;
9161  00ed c70001        	ld	_uiInfo,a
9162                     ; 2266 		copy_info(41);
9164  00f0 a629          	ld	a,#41
9165  00f2               LC048:
9166  00f2 8d000000      	callf	f_copy_info
9168  00f6               L7113:
9169                     ; 2310 }
9172  00f6 84            	pop	a
9173  00f7 87            	retf	
10021                     	xref	__key_continue
10022                     	xref	f_timerEventClear
10023                     	xref	__boiler_type
10024                     	xdef	f_disp_statusCb
10025                     	xdef	_error_display_refresh
10026                     	xdef	f_disp_485
10027                     	xdef	f__disp_485
10028                     	xdef	f_disp_set_state
10029                     	xdef	f_disp_write_file
10030                     	xdef	__d485_id
10031                     	xref	_debug_br
10032                     	xref	_debug_hn
10033                     	xref	__remote
10034                     	xref	f_getCurrTemp
10035                     	xdef	f_disp_status_command
10036                     	xdef	f_disp_status_error
10037                     	xdef	f_timerClear
10038                     	xdef	__timFlag
10039                     	xdef	__tim30min
10040                     	xdef	__tim1min
10041                     	xdef	f_disp_status_run_id
10042                     	xdef	___func_rc_timerout2
10043                     	xdef	___func_rc_timerout1
10044                     	xdef	___func_rc_timerout
10045                     	xref	___func_rc_settingCb
10046                     	xdef	f_disp_status_plc
10047                     	xdef	f_disp_status_valveinfo_sub
10048                     	xdef	__ui_
10049                     	xdef	___lpm
10050                     	xdef	f_disp_status_houseCapa
10051                     	xdef	f__backlight_get_code
10052                     	xdef	f__backlight_get_index
10053                     	xdef	f_disp_status_valveCount
10054                     	xdef	___bL
10055                     	xdef	f_disp_next
10056                     	xdef	f_file_update
10057                     	xdef	__keypwIndexClient
10058                     	xdef	__keypwIndexMaster2
10059                     	xdef	__keypwIndexMaster
10060                     	xdef	__keypwClient
10061                     	xdef	__keypwMaster2
10062                     	xdef	__keypwMaster
10063                     	switch	.bss
10064  0000               __led_key_status:
10065  0000 00            	ds.b	1
10066                     	xdef	__led_key_status
10067                     	xdef	__led_key_pin
10068                     	xdef	__led_key_port
10069                     	xdef	_error_display_status
10070                     	xdef	_error_display_mode
10071                     	xdef	f_copy_info
10072                     	xdef	f_copy_infoSet
10073                     	xref	__backlight
10074                     	xref	_ui_error_type
10075                     	xref	_ui_error
10076                     	xref	_error_type
10077                     	xref	_error
10078                     	xdef	_start_flag
10079                     	xdef	__backup_backlight2
10080                     	xdef	__backup_backlight
10081                     	xdef	__disp_temp
10082                     	xref	f_func_rc_setting
10083                     	xref	f_func_rc_recover
10084                     	xref	f_func_rc_command
10085                     	xdef	f_lcd_disp_rid_hw
10086                     	xref	__boiler_water_heat
10087                     	xref	__boiler_water_shower
10088                     	xdef	f_file_update2
10089                     	xdef	__updateCount
10090                     	xdef	__updateBit
10091                     	xdef	__updateTimer
10092                     	xref	__disp_mode2
10093                     	xref	__disp_mode
10094                     	xdef	f_disp_status_curr_only
10095                     	xdef	f_disp_status_loop_init
10096                     	xdef	f_disp_status_loop_message
10097                     	xdef	f_disp_status_exit
10098                     	xdef	f_disp_status_run
10099                     	xdef	f_disp_status_valveinfo
10100                     	xdef	f_disp_status_temp_offset
10101                     	xdef	f_disp_status_lpm
10102                     	xdef	f_disp_status_po_type
10103                     	xdef	f_disp_status_cntl_op
10104                     	xdef	f_disp_status_run_op
10105                     	xdef	f_disp_status_backlight2
10106                     	xdef	f_disp_status_toffset
10107                     	xdef	f_disp_status_id
10108                     	xdef	f_clear_npos2
10109                     	xdef	f_clear_npos1
10110                     	xdef	__subRemote
10111                     	xdef	__dsPrev
10112                     	xdef	__dsCount
10113                     	xdef	__ds
10114                     	xdef	f_ui_Open
10115                     	xref	f_disp_status_loop_client
10116                     	xref	f_disp_status_loop_host
10117                     	xdef	___sRoom
10118                     	xdef	___sInfo
10119                     	xdef	___sDn
10120                     	xdef	___sUp
10121                     	xdef	___s
10122                     	xref	f_lcd_blink_npos
10123                     	xref	f_lcd_blink_npos_clear
10124                     	xref	f_ui_disp_clear_tSetup
10125                     	xref	f___ui_disp_temp_c
10126                     	xref	f_ui_disp_temp_curr
10127                     	xref	f_ui_disp_temp_setup
10128                     	xref	f_lcd_blinkCb
10129                     	xref	f_lcd_blink_clear
10130                     	xdef	f_disp_status
10131                     	xref	f_lcd_clear_npos
10132                     	xref	f_lcd_disp_rid
10133                     	xref	f_lcd_disp_err
10134                     	xref	f_lcd_disp_n
10135                     	xref	f_lcd_clear
10136                     	xref	f_lcd_disp_setup_mode_each
10137                     	xref	f_lcd_disp_setup_mode_local
10138                     	xref	f_lcd_disp_setup_valve
10139                     	xref	f_lcd_disp_setup_id
10140                     	xref	f_lcd_disp_setup_mode
10141                     	xref	f_lcd_disp_setup_run
10142                     	xref	f_lcd_disp_plc
10143                     	xref	f_lcd_disp_cnt_sub
10144                     	xref	f_lcd_disp_cnt_host
10145                     	xref	f_lcd_disp_freset
10146                     	xref	f_lcd_disp_mir2
10147                     	xref	f_lcd_disp_mir1
10148                     	xref	f_lcd_disp_setup_cntl_tab
10149                     	xref	f_lcd_disp_setup_cntl_2motor
10150                     	xref	f_lcd_disp_setup_cntl_po
10151                     	xref	f_lcd_disp_setup_cntl_on
10152                     	xref	f_lcd_disp_setup_cntl_op
10153                     	xref	f_lcd_disp_setup_len
10154                     	xref	f_lcd_disp_setup_lpm
10155                     	xref	f_lcd_disp_backlight
10156                     	xref	f_lcd_clear_btn
10157                     	xref	_iLF_DEF
10158                     	xref	_bLF_DEF
10159  0001               _uiInfo:
10160  0001 000000000000  	ds.b	109
10161                     	xdef	_uiInfo
10162  006e               _uiInfoSet:
10163  006e 000000000000  	ds.b	54
10164                     	xdef	_uiInfoSet
10165                     	xref	f_file_read
10166                     	xref	f_file_write
10167                     	xref	___timer1s
10168                     	xref	__t20ms
10169                     	xdef	f_error_display
10170                     	xref.b	c_x
10190                     	xref	d_smodx
10191                     	end
