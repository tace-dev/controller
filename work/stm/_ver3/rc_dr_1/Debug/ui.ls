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
  42  0009 19            	dc.b	25
  43  000a               __backup_backlight2:
  44  000a 00            	dc.b	0
  45  000b               _start_flag:
  46  000b 01            	dc.b	1
  47  000c               _error_display_mode:
  48  000c 00            	dc.b	0
  49  000d               _error_display_status:
  50  000d 00            	dc.b	0
  99                     ; 61 void	error_display(uint8_t type, uint8_t err)
  99                     ; 62 {
 101                     .text:	section	.text,new
 102  0000               _error_display:
 104  0000 89            	pushw	x
 105       00000000      OFST:	set	0
 108                     ; 63 	if( error_display_mode == 1 )
 110  0001 c6000c        	ld	a,_error_display_mode
 111  0004 4a            	dec	a
 112  0005 2712          	jreq	L6
 113                     ; 64 		return;
 115                     ; 66 	ui_error = err;
 117  0007 7b02          	ld	a,(OFST+2,sp)
 118  0009 c70000        	ld	_ui_error,a
 119                     ; 67 	ui_error_type = type;
 121  000c 7b01          	ld	a,(OFST+1,sp)
 122  000e c70000        	ld	_ui_error_type,a
 123                     ; 69 	error_display_mode = 1;
 125  0011 3501000c      	mov	_error_display_mode,#1
 126                     ; 70 	error_display_status = 1;
 128  0015 3501000d      	mov	_error_display_status,#1
 129                     ; 71 }
 130  0019               L6:
 133  0019 85            	popw	x
 134  001a 81            	ret	
 166                     ; 73 void	ui_Open(void)
 166                     ; 74 {
 167                     .text:	section	.text,new
 168  0000               _ui_Open:
 172                     ; 117 	uiInfo.cntlMode = FW_GET_CNTLMODE;
 174  0000 a608          	ld	a,#8
 175  0002 cd0000        	call	_file_read
 177  0005 c70003        	ld	_uiInfo+3,a
 178                     ; 118 	uiInfo.id = FW_GET_ID;
 180  0008 a60a          	ld	a,#10
 181  000a cd0000        	call	_file_read
 183  000d c70004        	ld	_uiInfo+4,a
 184                     ; 119 	uiInfo.cnt = FW_GET_CNT;
 186  0010 a60b          	ld	a,#11
 187  0012 cd0000        	call	_file_read
 189  0015 c70005        	ld	_uiInfo+5,a
 190                     ; 120 	uiInfo.cnt_sub = FW_GET_CNT_SUB;
 192  0018 a62b          	ld	a,#43
 193  001a cd0000        	call	_file_read
 195  001d c70006        	ld	_uiInfo+6,a
 196                     ; 121 	UI_SET(uiInfo.cnt, 8)
 198  0020 c60005        	ld	a,_uiInfo+5
 199  0023 2605          	jrne	L14
 202  0025 a608          	ld	a,#8
 203  0027 c70005        	ld	_uiInfo+5,a
 204  002a               L14:
 205                     ; 122 	UI_SET(uiInfo.cnt_sub, 8)
 207  002a 725d0006      	tnz	_uiInfo+6
 208  002e 2604          	jrne	L34
 211  0030 35080006      	mov	_uiInfo+6,#8
 212  0034               L34:
 213                     ; 123 	if( uiInfo.cnt >= 8 )	uiInfo.cnt = 8;
 215  0034 a108          	cp	a,#8
 216  0036 2504          	jrult	L54
 219  0038 35080005      	mov	_uiInfo+5,#8
 220  003c               L54:
 221                     ; 124 	if( uiInfo.cnt_sub >= 8 )	uiInfo.cnt_sub = 8;
 223  003c c60006        	ld	a,_uiInfo+6
 224  003f a108          	cp	a,#8
 225  0041 2504          	jrult	L74
 228  0043 35080006      	mov	_uiInfo+6,#8
 229  0047               L74:
 230                     ; 126 	uiInfo.opMode = FW_GET_OPMODE;
 232  0047 a60c          	ld	a,#12
 233  0049 cd0000        	call	_file_read
 235  004c c70007        	ld	_uiInfo+7,a
 236                     ; 127 	uiInfo.mode = FW_GET_MODE;
 238  004f a609          	ld	a,#9
 239  0051 cd0000        	call	_file_read
 241  0054 c70008        	ld	_uiInfo+8,a
 242                     ; 129 	uiInfo.controlMode = FW_GET_CNT_MODE;
 244  0057 a60d          	ld	a,#13
 245  0059 cd0000        	call	_file_read
 247  005c c70009        	ld	_uiInfo+9,a
 248                     ; 130 	uiInfo.valve = FW_GET_VALVE;
 250  005f a60e          	ld	a,#14
 251  0061 cd0000        	call	_file_read
 253  0064 c7000a        	ld	_uiInfo+10,a
 254                     ; 131 	uiInfo.valve_sub = FW_GET_VALVE_SUB;
 256  0067 a62c          	ld	a,#44
 257  0069 cd0000        	call	_file_read
 259  006c c7000b        	ld	_uiInfo+11,a
 260                     ; 132 	UI_SET(uiInfo.valve, 8)
 262  006f c6000a        	ld	a,_uiInfo+10
 263  0072 2605          	jrne	L15
 266  0074 a608          	ld	a,#8
 267  0076 c7000a        	ld	_uiInfo+10,a
 268  0079               L15:
 269                     ; 133 	UI_SET(uiInfo.valve_sub, 8)
 271  0079 725d000b      	tnz	_uiInfo+11
 272  007d 2604          	jrne	L35
 275  007f 3508000b      	mov	_uiInfo+11,#8
 276  0083               L35:
 277                     ; 134 	if( uiInfo.valve >= 8 )	uiInfo.valve = 8;
 279  0083 a108          	cp	a,#8
 280  0085 2504          	jrult	L55
 283  0087 3508000a      	mov	_uiInfo+10,#8
 284  008b               L55:
 285                     ; 135 	if( uiInfo.valve_sub >= 8 )	uiInfo.valve_sub = 8;
 287  008b c6000b        	ld	a,_uiInfo+11
 288  008e a108          	cp	a,#8
 289  0090 2504          	jrult	L75
 292  0092 3508000b      	mov	_uiInfo+11,#8
 293  0096               L75:
 294                     ; 137 	uiInfo.repeat = FW_GET_REPEAT;	
 296  0096 a60f          	ld	a,#15
 297  0098 cd0000        	call	_file_read
 299  009b c7000c        	ld	_uiInfo+12,a
 300                     ; 138 	UI_SET(uiInfo.repeat, 10)
 302  009e 2604          	jrne	L16
 305  00a0 350a000c      	mov	_uiInfo+12,#10
 306  00a4               L16:
 307                     ; 139 	uiInfo.reserve = FW_GET_RESERVE;	
 309  00a4 a610          	ld	a,#16
 310  00a6 cd0000        	call	_file_read
 312  00a9 c7000d        	ld	_uiInfo+13,a
 313                     ; 140 	UI_SET(uiInfo.reserve, 24)
 315  00ac 2604          	jrne	L36
 318  00ae 3518000d      	mov	_uiInfo+13,#24
 319  00b2               L36:
 320                     ; 141 	uiInfo.tSetup = FW_GET_TSETUP;	
 322  00b2 a611          	ld	a,#17
 323  00b4 cd0000        	call	_file_read
 325  00b7 c7000e        	ld	_uiInfo+14,a
 326                     ; 142 	UI_SET(uiInfo.tSetup, 50)
 328  00ba 2604          	jrne	L56
 331  00bc 3532000e      	mov	_uiInfo+14,#50
 332  00c0               L56:
 333                     ; 143 	uiInfo.poType = FW_GET_POTYPE;	
 335  00c0 a612          	ld	a,#18
 336  00c2 cd0000        	call	_file_read
 338  00c5 c7000f        	ld	_uiInfo+15,a
 339                     ; 144 	uiInfo.houseCapa = FW_GET_HOUSECAPA;
 341  00c8 a613          	ld	a,#19
 342  00ca cd0000        	call	_file_read
 344  00cd c70010        	ld	_uiInfo+16,a
 345                     ; 145 	UI_SET(uiInfo.houseCapa, 160)
 347  00d0 2604          	jrne	L76
 350  00d2 35a00010      	mov	_uiInfo+16,#160
 351  00d6               L76:
 352                     ; 146 	uiInfo.tOffset = FW_GET_TOFFSET;
 354  00d6 a614          	ld	a,#20
 355  00d8 cd0000        	call	_file_read
 357  00db c70011        	ld	_uiInfo+17,a
 358                     ; 147 	UI_SET(uiInfo.tOffset, 100);
 360  00de 2604          	jrne	L17
 363  00e0 35640011      	mov	_uiInfo+17,#100
 364  00e4               L17:
 365                     ; 149 	uiInfo.tempOffset = FW_GET_TEMPOFFSET;
 368  00e4 a627          	ld	a,#39
 369  00e6 cd0000        	call	_file_read
 371  00e9 c70012        	ld	_uiInfo+18,a
 372                     ; 150 	UI_SET(uiInfo.tempOffset, 80)
 374  00ec 2604          	jrne	L37
 377  00ee 35500012      	mov	_uiInfo+18,#80
 378  00f2               L37:
 379                     ; 151 	uiInfo.lpmType = FW_GET_LPM;
 381  00f2 a628          	ld	a,#40
 382  00f4 cd0000        	call	_file_read
 384  00f7 c70013        	ld	_uiInfo+19,a
 385                     ; 152 	uiInfo.lpmType_sub = FW_GET_LPM_SUB;
 387  00fa a62d          	ld	a,#45
 388  00fc cd0000        	call	_file_read
 390  00ff c70014        	ld	_uiInfo+20,a
 391                     ; 158 	_disp_mode2 = FW_GET_DISPMODE;
 393  0102 a629          	ld	a,#41
 394  0104 cd0000        	call	_file_read
 396  0107 c70000        	ld	__disp_mode2,a
 397                     ; 159 	_disp_mode = 0xff;
 399  010a 35ff0000      	mov	__disp_mode,#255
 400                     ; 161 	if (_disp_mode2 == 0x00) {
 402                     ; 162 		__sUp = 5;
 404  010e 2712          	jreq	LC002
 405                     ; 163 	} else if (_disp_mode2 == RC_MODE_RESERVE){
 407  0110 a108          	cp	a,#8
 408                     ; 164 		__sUp = 16;
 410  0112 2718          	jreq	LC001
 411                     ; 165 	} else if (_disp_mode2 == RC_MODE_REPEAT) {
 413  0114 a110          	cp	a,#16
 414  0116 2606          	jrne	L501
 415                     ; 166 		__sUp = 2;
 417  0118 35020001      	mov	___sUp,#2
 419  011c 2018          	jra	L77
 420  011e               L501:
 421                     ; 167 	} else if (_disp_mode2 == RC_MODE_STOP) {
 423  011e a104          	cp	a,#4
 424  0120 2606          	jrne	L111
 425                     ; 168 		__sUp = 5;
 427  0122               LC002:
 429  0122 35050001      	mov	___sUp,#5
 431  0126 200e          	jra	L77
 432  0128               L111:
 433                     ; 169 	} else if (_disp_mode2 == RC_MODE_OUT) {
 435  0128 a102          	cp	a,#2
 436  012a 2606          	jrne	L511
 437                     ; 170 		__sUp = 16;
 439  012c               LC001:
 441  012c 35100001      	mov	___sUp,#16
 443  0130 2004          	jra	L77
 444  0132               L511:
 445                     ; 172 		__sUp = 0;
 447  0132 725f0001      	clr	___sUp
 448  0136               L77:
 449                     ; 175 	uiInfo.valve_len[0] = FW_GET_VL_1;
 451  0136 a615          	ld	a,#21
 452  0138 cd0000        	call	_file_read
 454  013b c70015        	ld	_uiInfo+21,a
 455                     ; 176 	uiInfo.valve_len[1] = FW_GET_VL_2;
 457  013e a616          	ld	a,#22
 458  0140 cd0000        	call	_file_read
 460  0143 c70016        	ld	_uiInfo+22,a
 461                     ; 177 	uiInfo.valve_len[2] = FW_GET_VL_3;
 463  0146 a617          	ld	a,#23
 464  0148 cd0000        	call	_file_read
 466  014b c70017        	ld	_uiInfo+23,a
 467                     ; 178 	uiInfo.valve_len[3] = FW_GET_VL_4;
 469  014e a618          	ld	a,#24
 470  0150 cd0000        	call	_file_read
 472  0153 c70018        	ld	_uiInfo+24,a
 473                     ; 179 	uiInfo.valve_len[4] = FW_GET_VL_5;
 475  0156 a619          	ld	a,#25
 476  0158 cd0000        	call	_file_read
 478  015b c70019        	ld	_uiInfo+25,a
 479                     ; 180 	uiInfo.valve_len[5] = FW_GET_VL_6;
 481  015e a61a          	ld	a,#26
 482  0160 cd0000        	call	_file_read
 484  0163 c7001a        	ld	_uiInfo+26,a
 485                     ; 181 	uiInfo.valve_len[6] = FW_GET_VL_7;
 487  0166 a61b          	ld	a,#27
 488  0168 cd0000        	call	_file_read
 490  016b c7001b        	ld	_uiInfo+27,a
 491                     ; 182 	uiInfo.valve_len[7] = FW_GET_VL_8;
 493  016e a61c          	ld	a,#28
 494  0170 cd0000        	call	_file_read
 496  0173 c7001c        	ld	_uiInfo+28,a
 497                     ; 184 	uiInfo.valve_rc[0] = FW_GET_VRC_1;
 499  0176 a61d          	ld	a,#29
 500  0178 cd0000        	call	_file_read
 502  017b c7001d        	ld	_uiInfo+29,a
 503                     ; 185 	uiInfo.valve_rc[1] = FW_GET_VRC_2;
 505  017e a61e          	ld	a,#30
 506  0180 cd0000        	call	_file_read
 508  0183 c7001e        	ld	_uiInfo+30,a
 509                     ; 186 	uiInfo.valve_rc[2] = FW_GET_VRC_3;
 511  0186 a61f          	ld	a,#31
 512  0188 cd0000        	call	_file_read
 514  018b c7001f        	ld	_uiInfo+31,a
 515                     ; 187 	uiInfo.valve_rc[3] = FW_GET_VRC_4;
 517  018e a620          	ld	a,#32
 518  0190 cd0000        	call	_file_read
 520  0193 c70020        	ld	_uiInfo+32,a
 521                     ; 188 	uiInfo.valve_rc[4] = FW_GET_VRC_5;
 523  0196 a621          	ld	a,#33
 524  0198 cd0000        	call	_file_read
 526  019b c70021        	ld	_uiInfo+33,a
 527                     ; 189 	uiInfo.valve_rc[5] = FW_GET_VRC_6;
 529  019e a622          	ld	a,#34
 530  01a0 cd0000        	call	_file_read
 532  01a3 c70022        	ld	_uiInfo+34,a
 533                     ; 190 	uiInfo.valve_rc[6] = FW_GET_VRC_7;
 535  01a6 a623          	ld	a,#35
 536  01a8 cd0000        	call	_file_read
 538  01ab c70023        	ld	_uiInfo+35,a
 539                     ; 191 	uiInfo.valve_rc[7] = FW_GET_VRC_8;
 541  01ae a624          	ld	a,#36
 542  01b0 cd0000        	call	_file_read
 544  01b3 c70024        	ld	_uiInfo+36,a
 545                     ; 192 	uiInfo.valve_rc[0] = 1;
 547  01b6 3501001d      	mov	_uiInfo+29,#1
 548                     ; 194 	uiInfo.valve_sub_len[0] = FW_GET_VL_1_SUB;
 550  01ba a62e          	ld	a,#46
 551  01bc cd0000        	call	_file_read
 553  01bf c70025        	ld	_uiInfo+37,a
 554                     ; 195 	uiInfo.valve_sub_len[1] = FW_GET_VL_2_SUB;
 556  01c2 a62f          	ld	a,#47
 557  01c4 cd0000        	call	_file_read
 559  01c7 c70026        	ld	_uiInfo+38,a
 560                     ; 196 	uiInfo.valve_sub_len[2] = FW_GET_VL_3_SUB;
 562  01ca a630          	ld	a,#48
 563  01cc cd0000        	call	_file_read
 565  01cf c70027        	ld	_uiInfo+39,a
 566                     ; 197 	uiInfo.valve_sub_len[3] = FW_GET_VL_4_SUB;
 568  01d2 a631          	ld	a,#49
 569  01d4 cd0000        	call	_file_read
 571  01d7 c70028        	ld	_uiInfo+40,a
 572                     ; 198 	uiInfo.valve_sub_len[4] = FW_GET_VL_5_SUB;
 574  01da a632          	ld	a,#50
 575  01dc cd0000        	call	_file_read
 577  01df c70029        	ld	_uiInfo+41,a
 578                     ; 199 	uiInfo.valve_sub_len[5] = FW_GET_VL_6_SUB;
 580  01e2 a633          	ld	a,#51
 581  01e4 cd0000        	call	_file_read
 583  01e7 c7002a        	ld	_uiInfo+42,a
 584                     ; 200 	uiInfo.valve_sub_len[6] = FW_GET_VL_7_SUB;
 586  01ea a634          	ld	a,#52
 587  01ec cd0000        	call	_file_read
 589  01ef c7002b        	ld	_uiInfo+43,a
 590                     ; 201 	uiInfo.valve_sub_len[7] = FW_GET_VL_8_SUB;
 592  01f2 a635          	ld	a,#53
 593  01f4 cd0000        	call	_file_read
 595  01f7 c7002c        	ld	_uiInfo+44,a
 596                     ; 203 	uiInfo.valve_sub_rc[0] = FW_GET_VRC_1_SUB;
 598  01fa a636          	ld	a,#54
 599  01fc cd0000        	call	_file_read
 601  01ff c7002d        	ld	_uiInfo+45,a
 602                     ; 204 	uiInfo.valve_sub_rc[1] = FW_GET_VRC_2_SUB;
 604  0202 a637          	ld	a,#55
 605  0204 cd0000        	call	_file_read
 607  0207 c7002e        	ld	_uiInfo+46,a
 608                     ; 205 	uiInfo.valve_sub_rc[2] = FW_GET_VRC_3_SUB;
 610  020a a638          	ld	a,#56
 611  020c cd0000        	call	_file_read
 613  020f c7002f        	ld	_uiInfo+47,a
 614                     ; 206 	uiInfo.valve_sub_rc[3] = FW_GET_VRC_4_SUB;
 616  0212 a639          	ld	a,#57
 617  0214 cd0000        	call	_file_read
 619  0217 c70030        	ld	_uiInfo+48,a
 620                     ; 207 	uiInfo.valve_sub_rc[4] = FW_GET_VRC_5_SUB;
 622  021a a63a          	ld	a,#58
 623  021c cd0000        	call	_file_read
 625  021f c70031        	ld	_uiInfo+49,a
 626                     ; 208 	uiInfo.valve_sub_rc[5] = FW_GET_VRC_6_SUB;
 628  0222 a63b          	ld	a,#59
 629  0224 cd0000        	call	_file_read
 631  0227 c70032        	ld	_uiInfo+50,a
 632                     ; 209 	uiInfo.valve_sub_rc[6] = FW_GET_VRC_7_SUB;
 634  022a a63c          	ld	a,#60
 635  022c cd0000        	call	_file_read
 637  022f c70033        	ld	_uiInfo+51,a
 638                     ; 210 	uiInfo.valve_sub_rc[7] = FW_GET_VRC_8_SUB;
 640  0232 a63d          	ld	a,#61
 641  0234 cd0000        	call	_file_read
 643  0237 c70034        	ld	_uiInfo+52,a
 644                     ; 212 	_boiler_water_shower = FW_GET_B_SHOWER;
 646  023a a625          	ld	a,#37
 647  023c cd0000        	call	_file_read
 649  023f c70000        	ld	__boiler_water_shower,a
 650                     ; 214 	UI_SET(_boiler_water_shower, 50)
 652  0242 2604          	jrne	L121
 655  0244 35320000      	mov	__boiler_water_shower,#50
 656  0248               L121:
 657                     ; 215 	_boiler_water_heat = FW_GET_B_HEAT;
 659  0248 a626          	ld	a,#38
 660  024a cd0000        	call	_file_read
 662  024d c70000        	ld	__boiler_water_heat,a
 663                     ; 217 	UI_SET(_boiler_water_heat, 70)
 665  0250 2604          	jrne	L321
 668  0252 35460000      	mov	__boiler_water_heat,#70
 669  0256               L321:
 670                     ; 218 	_backlight = FW_GET_BACKLIGHT;
 672  0256 a62a          	ld	a,#42
 673  0258 cd0000        	call	_file_read
 675  025b c70000        	ld	__backlight,a
 676                     ; 219 	UI_SET(_backlight, 3)
 678  025e 2604          	jrne	L521
 681  0260 35030000      	mov	__backlight,#3
 682  0264               L521:
 683                     ; 221 	uiInfo.plc = FW_GET_PLC;
 685  0264 a63e          	ld	a,#62
 686  0266 cd0000        	call	_file_read
 688  0269 c70064        	ld	_uiInfo+100,a
 689                     ; 223 	_backup_backlight = 0;
 691  026c 725f0009      	clr	__backup_backlight
 692                     ; 224 }
 695  0270 81            	ret	
 698                     .const:	section	.text
 699  0000               __keypwMaster:
 700  0000 04            	dc.b	4
 701  0001 03            	dc.b	3
 702  0002 04            	dc.b	4
 703  0003 03            	dc.b	3
 704  0004 01            	dc.b	1
 705  0005 01            	dc.b	1
 706  0006               __keypwMaster2:
 707  0006 04            	dc.b	4
 708  0007 03            	dc.b	3
 709  0008 04            	dc.b	4
 710  0009 03            	dc.b	3
 711  000a 01            	dc.b	1
 712  000b 02            	dc.b	2
 713  000c               __keypwClient:
 714  000c 04            	dc.b	4
 715  000d 03            	dc.b	3
 716  000e 04            	dc.b	4
 717  000f 03            	dc.b	3
 718  0010 01            	dc.b	1
 719  0011 03            	dc.b	3
 720                     	switch	.data
 721  000e               __keypwIndexMaster:
 722  000e 00            	dc.b	0
 723  000f               __keypwIndexMaster2:
 724  000f 00            	dc.b	0
 725  0010               __keypwIndexClient:
 726  0010 00            	dc.b	0
 759                     ; 242 void	file_update2(uint8_t i)
 759                     ; 243 {
 760                     .text:	section	.text,new
 761  0000               _file_update2:
 763  0000 88            	push	a
 764       00000000      OFST:	set	0
 767                     ; 244 	FW_TOFFSET(uiInfo.tOffset);
 769  0001 c60011        	ld	a,_uiInfo+17
 770  0004 97            	ld	xl,a
 771  0005 a614          	ld	a,#20
 772  0007 95            	ld	xh,a
 773  0008 cd0000        	call	_file_write
 775                     ; 245 	if( i==0 )	FW_BACKLIGHT(_backlight);
 777  000b 7b01          	ld	a,(OFST+1,sp)
 778  000d 260a          	jrne	L341
 781  000f c60000        	ld	a,__backlight
 782  0012 97            	ld	xl,a
 783  0013 a62a          	ld	a,#42
 784  0015 95            	ld	xh,a
 785  0016 cd0000        	call	_file_write
 787  0019               L341:
 788                     ; 246 }
 791  0019 84            	pop	a
 792  001a 81            	ret	
 820                     ; 284 void	file_update(void)
 820                     ; 285 {
 821                     .text:	section	.text,new
 822  0000               _file_update:
 826                     ; 286 	FW_CNTLMODE(uiInfo.cntlMode);
 828  0000 c60003        	ld	a,_uiInfo+3
 829  0003 97            	ld	xl,a
 830  0004 a608          	ld	a,#8
 831  0006 95            	ld	xh,a
 832  0007 cd0000        	call	_file_write
 834                     ; 287 	FW_MODE(uiInfo.mode);
 836  000a c60008        	ld	a,_uiInfo+8
 837  000d 97            	ld	xl,a
 838  000e a609          	ld	a,#9
 839  0010 95            	ld	xh,a
 840  0011 cd0000        	call	_file_write
 842                     ; 288 	FW_ID(uiInfo.id);
 844  0014 c60004        	ld	a,_uiInfo+4
 845  0017 97            	ld	xl,a
 846  0018 a60a          	ld	a,#10
 847  001a 95            	ld	xh,a
 848  001b cd0000        	call	_file_write
 850                     ; 289 	FW_CNT(uiInfo.cnt);
 852  001e c60005        	ld	a,_uiInfo+5
 853  0021 97            	ld	xl,a
 854  0022 a60b          	ld	a,#11
 855  0024 95            	ld	xh,a
 856  0025 cd0000        	call	_file_write
 858                     ; 290 	FW_CNT_SUB(uiInfo.cnt_sub);
 860  0028 c60006        	ld	a,_uiInfo+6
 861  002b 97            	ld	xl,a
 862  002c a62b          	ld	a,#43
 863  002e 95            	ld	xh,a
 864  002f cd0000        	call	_file_write
 866                     ; 291 	FW_OPMODE(uiInfo.opMode);
 868  0032 c60007        	ld	a,_uiInfo+7
 869  0035 97            	ld	xl,a
 870  0036 a60c          	ld	a,#12
 871  0038 95            	ld	xh,a
 872  0039 cd0000        	call	_file_write
 874                     ; 293 	FW_CNT_MODE(uiInfo.controlMode);
 876  003c c60009        	ld	a,_uiInfo+9
 877  003f 97            	ld	xl,a
 878  0040 a60d          	ld	a,#13
 879  0042 95            	ld	xh,a
 880  0043 cd0000        	call	_file_write
 882                     ; 294 	FW_VALVE(uiInfo.valve);
 884  0046 c6000a        	ld	a,_uiInfo+10
 885  0049 97            	ld	xl,a
 886  004a a60e          	ld	a,#14
 887  004c 95            	ld	xh,a
 888  004d cd0000        	call	_file_write
 890                     ; 295 	FW_VALVE_SUB(uiInfo.valve_sub);
 892  0050 c6000b        	ld	a,_uiInfo+11
 893  0053 97            	ld	xl,a
 894  0054 a62c          	ld	a,#44
 895  0056 95            	ld	xh,a
 896  0057 cd0000        	call	_file_write
 898                     ; 296 	FW_REPEAT(uiInfo.repeat);
 900  005a c6000c        	ld	a,_uiInfo+12
 901  005d 97            	ld	xl,a
 902  005e a60f          	ld	a,#15
 903  0060 95            	ld	xh,a
 904  0061 cd0000        	call	_file_write
 906                     ; 297 	FW_RESERVE(uiInfo.reserve);
 908  0064 c6000d        	ld	a,_uiInfo+13
 909  0067 97            	ld	xl,a
 910  0068 a610          	ld	a,#16
 911  006a 95            	ld	xh,a
 912  006b cd0000        	call	_file_write
 914                     ; 298 	FW_TSETUP(uiInfo.tSetup);
 916  006e c6000e        	ld	a,_uiInfo+14
 917  0071 97            	ld	xl,a
 918  0072 a611          	ld	a,#17
 919  0074 95            	ld	xh,a
 920  0075 cd0000        	call	_file_write
 922                     ; 300 	FW_POTYPE(uiInfo.poType);
 924  0078 c6000f        	ld	a,_uiInfo+15
 925  007b 97            	ld	xl,a
 926  007c a612          	ld	a,#18
 927  007e 95            	ld	xh,a
 928  007f cd0000        	call	_file_write
 930                     ; 301 	FW_HOUSECAPA(uiInfo.houseCapa);
 932  0082 c60010        	ld	a,_uiInfo+16
 933  0085 97            	ld	xl,a
 934  0086 a613          	ld	a,#19
 935  0088 95            	ld	xh,a
 936  0089 cd0000        	call	_file_write
 938                     ; 302 	FW_TOFFSET(uiInfo.tOffset);
 940  008c c60011        	ld	a,_uiInfo+17
 941  008f 97            	ld	xl,a
 942  0090 a614          	ld	a,#20
 943  0092 95            	ld	xh,a
 944  0093 cd0000        	call	_file_write
 946                     ; 304 	FW_VALVE_INFOS
 948  0096 c60015        	ld	a,_uiInfo+21
 949  0099 97            	ld	xl,a
 950  009a a615          	ld	a,#21
 951  009c 95            	ld	xh,a
 952  009d cd0000        	call	_file_write
 956  00a0 c60016        	ld	a,_uiInfo+22
 957  00a3 97            	ld	xl,a
 958  00a4 a616          	ld	a,#22
 959  00a6 95            	ld	xh,a
 960  00a7 cd0000        	call	_file_write
 964  00aa c60017        	ld	a,_uiInfo+23
 965  00ad 97            	ld	xl,a
 966  00ae a617          	ld	a,#23
 967  00b0 95            	ld	xh,a
 968  00b1 cd0000        	call	_file_write
 972  00b4 c60018        	ld	a,_uiInfo+24
 973  00b7 97            	ld	xl,a
 974  00b8 a618          	ld	a,#24
 975  00ba 95            	ld	xh,a
 976  00bb cd0000        	call	_file_write
 980  00be c60019        	ld	a,_uiInfo+25
 981  00c1 97            	ld	xl,a
 982  00c2 a619          	ld	a,#25
 983  00c4 95            	ld	xh,a
 984  00c5 cd0000        	call	_file_write
 988  00c8 c6001a        	ld	a,_uiInfo+26
 989  00cb 97            	ld	xl,a
 990  00cc a61a          	ld	a,#26
 991  00ce 95            	ld	xh,a
 992  00cf cd0000        	call	_file_write
 996  00d2 c6001b        	ld	a,_uiInfo+27
 997  00d5 97            	ld	xl,a
 998  00d6 a61b          	ld	a,#27
 999  00d8 95            	ld	xh,a
1000  00d9 cd0000        	call	_file_write
1004  00dc c6001c        	ld	a,_uiInfo+28
1005  00df 97            	ld	xl,a
1006  00e0 a61c          	ld	a,#28
1007  00e2 95            	ld	xh,a
1008  00e3 cd0000        	call	_file_write
1012  00e6 c60025        	ld	a,_uiInfo+37
1013  00e9 97            	ld	xl,a
1014  00ea a62e          	ld	a,#46
1015  00ec 95            	ld	xh,a
1016  00ed cd0000        	call	_file_write
1020  00f0 c60026        	ld	a,_uiInfo+38
1021  00f3 97            	ld	xl,a
1022  00f4 a62f          	ld	a,#47
1023  00f6 95            	ld	xh,a
1024  00f7 cd0000        	call	_file_write
1028  00fa c60027        	ld	a,_uiInfo+39
1029  00fd 97            	ld	xl,a
1030  00fe a630          	ld	a,#48
1031  0100 95            	ld	xh,a
1032  0101 cd0000        	call	_file_write
1036  0104 c60028        	ld	a,_uiInfo+40
1037  0107 97            	ld	xl,a
1038  0108 a631          	ld	a,#49
1039  010a 95            	ld	xh,a
1040  010b cd0000        	call	_file_write
1044  010e c60029        	ld	a,_uiInfo+41
1045  0111 97            	ld	xl,a
1046  0112 a632          	ld	a,#50
1047  0114 95            	ld	xh,a
1048  0115 cd0000        	call	_file_write
1052  0118 c6002a        	ld	a,_uiInfo+42
1053  011b 97            	ld	xl,a
1054  011c a633          	ld	a,#51
1055  011e 95            	ld	xh,a
1056  011f cd0000        	call	_file_write
1060  0122 c6002b        	ld	a,_uiInfo+43
1061  0125 97            	ld	xl,a
1062  0126 a634          	ld	a,#52
1063  0128 95            	ld	xh,a
1064  0129 cd0000        	call	_file_write
1068  012c c6002c        	ld	a,_uiInfo+44
1069  012f 97            	ld	xl,a
1070  0130 a635          	ld	a,#53
1071  0132 95            	ld	xh,a
1072  0133 cd0000        	call	_file_write
1074                     ; 305 	FW_VALVE_RCINFOS
1076  0136 c6001d        	ld	a,_uiInfo+29
1077  0139 97            	ld	xl,a
1078  013a a61d          	ld	a,#29
1079  013c 95            	ld	xh,a
1080  013d cd0000        	call	_file_write
1084  0140 c6001e        	ld	a,_uiInfo+30
1085  0143 97            	ld	xl,a
1086  0144 a61e          	ld	a,#30
1087  0146 95            	ld	xh,a
1088  0147 cd0000        	call	_file_write
1092  014a c6001f        	ld	a,_uiInfo+31
1093  014d 97            	ld	xl,a
1094  014e a61f          	ld	a,#31
1095  0150 95            	ld	xh,a
1096  0151 cd0000        	call	_file_write
1100  0154 c60020        	ld	a,_uiInfo+32
1101  0157 97            	ld	xl,a
1102  0158 a620          	ld	a,#32
1103  015a 95            	ld	xh,a
1104  015b cd0000        	call	_file_write
1108  015e c60021        	ld	a,_uiInfo+33
1109  0161 97            	ld	xl,a
1110  0162 a621          	ld	a,#33
1111  0164 95            	ld	xh,a
1112  0165 cd0000        	call	_file_write
1116  0168 c60022        	ld	a,_uiInfo+34
1117  016b 97            	ld	xl,a
1118  016c a622          	ld	a,#34
1119  016e 95            	ld	xh,a
1120  016f cd0000        	call	_file_write
1124  0172 c60023        	ld	a,_uiInfo+35
1125  0175 97            	ld	xl,a
1126  0176 a623          	ld	a,#35
1127  0178 95            	ld	xh,a
1128  0179 cd0000        	call	_file_write
1132  017c c60024        	ld	a,_uiInfo+36
1133  017f 97            	ld	xl,a
1134  0180 a624          	ld	a,#36
1135  0182 95            	ld	xh,a
1136  0183 cd0000        	call	_file_write
1140  0186 c6002d        	ld	a,_uiInfo+45
1141  0189 97            	ld	xl,a
1142  018a a636          	ld	a,#54
1143  018c 95            	ld	xh,a
1144  018d cd0000        	call	_file_write
1148  0190 c6002e        	ld	a,_uiInfo+46
1149  0193 97            	ld	xl,a
1150  0194 a637          	ld	a,#55
1151  0196 95            	ld	xh,a
1152  0197 cd0000        	call	_file_write
1156  019a c6002f        	ld	a,_uiInfo+47
1157  019d 97            	ld	xl,a
1158  019e a638          	ld	a,#56
1159  01a0 95            	ld	xh,a
1160  01a1 cd0000        	call	_file_write
1164  01a4 c60030        	ld	a,_uiInfo+48
1165  01a7 97            	ld	xl,a
1166  01a8 a639          	ld	a,#57
1167  01aa 95            	ld	xh,a
1168  01ab cd0000        	call	_file_write
1172  01ae c60031        	ld	a,_uiInfo+49
1173  01b1 97            	ld	xl,a
1174  01b2 a63a          	ld	a,#58
1175  01b4 95            	ld	xh,a
1176  01b5 cd0000        	call	_file_write
1180  01b8 c60032        	ld	a,_uiInfo+50
1181  01bb 97            	ld	xl,a
1182  01bc a63b          	ld	a,#59
1183  01be 95            	ld	xh,a
1184  01bf cd0000        	call	_file_write
1188  01c2 c60033        	ld	a,_uiInfo+51
1189  01c5 97            	ld	xl,a
1190  01c6 a63c          	ld	a,#60
1191  01c8 95            	ld	xh,a
1192  01c9 cd0000        	call	_file_write
1196  01cc c60034        	ld	a,_uiInfo+52
1197  01cf 97            	ld	xl,a
1198  01d0 a63d          	ld	a,#61
1199  01d2 95            	ld	xh,a
1200  01d3 cd0000        	call	_file_write
1202                     ; 307 	FW_B_SHOWER(_boiler_water_shower);
1204  01d6 c60000        	ld	a,__boiler_water_shower
1205  01d9 97            	ld	xl,a
1206  01da a625          	ld	a,#37
1207  01dc 95            	ld	xh,a
1208  01dd cd0000        	call	_file_write
1210                     ; 308 	FW_B_HEAT(_boiler_water_heat);
1212  01e0 c60000        	ld	a,__boiler_water_heat
1213  01e3 97            	ld	xl,a
1214  01e4 a626          	ld	a,#38
1215  01e6 95            	ld	xh,a
1216  01e7 cd0000        	call	_file_write
1218                     ; 309 	FW_TEMPOFFSET(uiInfo.tempOffset);
1220  01ea c60012        	ld	a,_uiInfo+18
1221  01ed 97            	ld	xl,a
1222  01ee a627          	ld	a,#39
1223  01f0 95            	ld	xh,a
1224  01f1 cd0000        	call	_file_write
1226                     ; 310 	FW_LPM(uiInfo.lpmType);
1228  01f4 c60013        	ld	a,_uiInfo+19
1229  01f7 97            	ld	xl,a
1230  01f8 a628          	ld	a,#40
1231  01fa 95            	ld	xh,a
1232  01fb cd0000        	call	_file_write
1234                     ; 311 	FW_LPM_SUB(uiInfo.lpmType_sub);
1236  01fe c60014        	ld	a,_uiInfo+20
1237  0201 97            	ld	xl,a
1238  0202 a62d          	ld	a,#45
1239  0204 95            	ld	xh,a
1240  0205 cd0000        	call	_file_write
1242                     ; 312 	FW_DISPMODE(_disp_mode);
1244  0208 c60000        	ld	a,__disp_mode
1245  020b 97            	ld	xl,a
1246  020c a629          	ld	a,#41
1247  020e 95            	ld	xh,a
1248  020f cd0000        	call	_file_write
1250                     ; 318 	FW_PLC(uiInfo.plc);
1252  0212 c60064        	ld	a,_uiInfo+100
1253  0215 97            	ld	xl,a
1254  0216 a63e          	ld	a,#62
1255  0218 95            	ld	xh,a
1256  0219 cd0000        	call	_file_write
1258                     ; 319 	file_write(_B+55, 0xaa);
1260  021c ae3faa        	ldw	x,#16298
1261  021f cd0000        	call	_file_write
1263                     ; 320 	file_write(_B+56, 0xbb);
1265  0222 ae40bb        	ldw	x,#16571
1267                     ; 321 }
1270  0225 cc0000        	jp	_file_write
1273                     	switch	.data
1274  0011               __ds:
1275  0011 64            	dc.b	100
1276  0012               __dsCount:
1277  0012 00            	dc.b	0
1278  0013               __dsPrev:
1279  0013 00            	dc.b	0
1280  0014               __subRemote:
1281  0014 00            	dc.b	0
1303                     ; 330 void	clear_npos1(void)
1303                     ; 331 {
1304                     .text:	section	.text,new
1305  0000               _clear_npos1:
1309                     ; 332 	lcd_clear_npos(0, 0);
1311  0000 5f            	clrw	x
1312  0001 cd0000        	call	_lcd_clear_npos
1314                     ; 333 	lcd_clear_npos(1, 0);
1316  0004 ae0100        	ldw	x,#256
1318                     ; 334 }
1321  0007 cc0000        	jp	_lcd_clear_npos
1345                     ; 336 void	clear_npos2(void)
1345                     ; 337 {
1346                     .text:	section	.text,new
1347  0000               _clear_npos2:
1351                     ; 338 	lcd_clear_npos(2, 0);
1353  0000 ae0200        	ldw	x,#512
1354  0003 cd0000        	call	_lcd_clear_npos
1356                     ; 339 	lcd_clear_npos(3, 0);
1358  0006 ae0300        	ldw	x,#768
1360                     ; 340 }
1363  0009 cc0000        	jp	_lcd_clear_npos
1389                     ; 342 void	disp_next(void)
1389                     ; 343 {
1390                     .text:	section	.text,new
1391  0000               _disp_next:
1395                     ; 344 	lcd_clear(0);
1397  0000 4f            	clr	a
1398  0001 cd0000        	call	_lcd_clear
1400                     ; 345 	_dsCount = 1;
1402  0004 35010012      	mov	__dsCount,#1
1403                     ; 346 	_dsPrev = 0xff;
1405  0008 35ff0013      	mov	__dsPrev,#255
1406                     ; 347 }
1409  000c 81            	ret	
1412                     	switch	.data
1413  0015               ___bL:
1414  0015 60            	dc.b	96
1469                     ; 355 void	disp_status_id(uint8_t key, uint8_t next)
1469                     ; 356 {
1470                     .text:	section	.text,new
1471  0000               _disp_status_id:
1473  0000 89            	pushw	x
1474  0001 88            	push	a
1475       00000001      OFST:	set	1
1478                     ; 358 	if( _dsCount == 0 )
1480  0002 c60012        	ld	a,__dsCount
1481  0005 2625          	jrne	L502
1482                     ; 360 		disp_next();
1484  0007 cd0000        	call	_disp_next
1486                     ; 361 		lcd_disp_setup_id();
1488  000a cd0000        	call	_lcd_disp_setup_id
1490                     ; 363 		if( uiInfoSet.id < 2 ) {
1492  000d c6006e        	ld	a,_uiInfoSet+1
1493  0010 a102          	cp	a,#2
1494  0012 2404          	jruge	L132
1495                     ; 364 			uiInfoSet.id = 2;
1497  0014 3502006e      	mov	_uiInfoSet+1,#2
1498  0018               L132:
1499                     ; 367 		if (_backup_backlight == 0) {
1501  0018 c60009        	ld	a,__backup_backlight
1502  001b 2604          	jrne	L332
1503                     ; 368 			_backup_backlight = BACKLIGHT_MAX_LEVEL;
1505  001d 35600009      	mov	__backup_backlight,#96
1506  0021               L332:
1507                     ; 370 		__bL = _backlight;
1509  0021 5500000015    	mov	___bL,__backlight
1510                     ; 371 		_backlight = BACKLIGHT_MAX_LEVEL;
1512  0026 35600000      	mov	__backlight,#96
1514  002a 2044          	jra	L532
1515  002c               L502:
1516                     ; 375 EncEntry:		
1516                     ; 376 		i = uiInfoSet.id;
1518  002c c6006e        	ld	a,_uiInfoSet+1
1519  002f 6b01          	ld	(OFST+0,sp),a
1520                     ; 377 		if( uiInfo.enc != 0 )
1522  0031 c60000        	ld	a,_uiInfo
1523  0034 2724          	jreq	L732
1524                     ; 379 			if( (uiInfo.enc&0x40) == 0 )
1526  0036 a540          	bcp	a,#64
1527  0038 260d          	jrne	L142
1528                     ; 381 				if( i==1 )	i = _ID_MAX;
1530  003a 7b01          	ld	a,(OFST+0,sp)
1531  003c 4a            	dec	a
1532  003d 2604          	jrne	L342
1535  003f a607          	ld	a,#7
1537  0041 200c          	jp	LC004
1538  0043               L342:
1539                     ; 383 					i--;
1541  0043 0a01          	dec	(OFST+0,sp)
1542  0045 200e          	jra	L742
1543  0047               L142:
1544                     ; 387 				if( i==_ID_MAX )	i = 1;
1546  0047 7b01          	ld	a,(OFST+0,sp)
1547  0049 a107          	cp	a,#7
1548  004b 2606          	jrne	L152
1551  004d a601          	ld	a,#1
1552  004f               LC004:
1553  004f 6b01          	ld	(OFST+0,sp),a
1555  0051 2002          	jra	L742
1556  0053               L152:
1557                     ; 389 					i++;
1559  0053 0c01          	inc	(OFST+0,sp)
1560  0055               L742:
1561                     ; 391 			uiInfoSet.id = i;
1563  0055 7b01          	ld	a,(OFST+0,sp)
1564  0057 c7006e        	ld	_uiInfoSet+1,a
1565  005a               L732:
1566                     ; 393 		if( _dsPrev != i )
1568  005a c60013        	ld	a,__dsPrev
1569  005d 1101          	cp	a,(OFST+0,sp)
1570  005f 270f          	jreq	L532
1571                     ; 395 			_dsPrev = i;
1573  0061 7b01          	ld	a,(OFST+0,sp)
1574  0063 c70013        	ld	__dsPrev,a
1575                     ; 396 			lcd_disp_rid(i, 0, 0);
1577  0066 4b00          	push	#0
1578  0068 5f            	clrw	x
1579  0069 7b02          	ld	a,(OFST+1,sp)
1580  006b 95            	ld	xh,a
1581  006c cd0000        	call	_lcd_disp_rid
1583  006f 84            	pop	a
1584  0070               L532:
1585                     ; 399 	if( key == 0x10 )		__UP
1587  0070 7b02          	ld	a,(OFST+1,sp)
1588  0072 a110          	cp	a,#16
1589  0074 2606          	jrne	L752
1592  0076 35010000      	mov	_uiInfo,#1
1596  007a 2008          	jp	LC003
1597  007c               L752:
1598                     ; 400 	else if( key == 0x20 )	__DN
1600  007c a120          	cp	a,#32
1601  007e 2608          	jrne	L362
1604  0080 35400000      	mov	_uiInfo,#64
1607  0084               LC003:
1609  0084 0f02          	clr	(OFST+1,sp)
1612  0086 20a4          	jra	L502
1613  0088               L362:
1614                     ; 401 	else if( key == 4 )	
1616  0088 a104          	cp	a,#4
1617  008a 2623          	jrne	L162
1618                     ; 403 		uiInfoSet.mode = uiInfoSet.id == 1 ? 1 : 0;
1620  008c c6006e        	ld	a,_uiInfoSet+1
1621  008f 4a            	dec	a
1622  0090 2603          	jrne	L014
1623  0092 4c            	inc	a
1624  0093 2001          	jra	L214
1625  0095               L014:
1626  0095 4f            	clr	a
1627  0096               L214:
1628  0096 c70072        	ld	_uiInfoSet+5,a
1629                     ; 404 		STATUS_NEXT(next);
1631  0099 7b03          	ld	a,(OFST+2,sp)
1632  009b c70011        	ld	__ds,a
1635  009e 725f0012      	clr	__dsCount
1638  00a2 35ff0013      	mov	__dsPrev,#255
1639                     ; 405 		_backup_backlight = 0;
1642  00a6 725f0009      	clr	__backup_backlight
1643                     ; 407 		_backlight = __bL;
1645  00aa 5500150000    	mov	__backlight,___bL
1646  00af               L162:
1647                     ; 409 }
1650  00af 5b03          	addw	sp,#3
1651  00b1 81            	ret	
1706                     ; 411 void	disp_status_valveCount(uint8_t key, uint8_t next)
1706                     ; 412 {
1707                     .text:	section	.text,new
1708  0000               _disp_status_valveCount:
1710  0000 89            	pushw	x
1711  0001 88            	push	a
1712       00000001      OFST:	set	1
1715                     ; 414 	if( _dsCount == 0 )
1717  0002 c60012        	ld	a,__dsCount
1718  0005 2608          	jrne	L172
1719                     ; 416 		disp_next();
1721  0007 cd0000        	call	_disp_next
1723                     ; 417 		lcd_disp_setup_valve();
1725  000a cd0000        	call	_lcd_disp_setup_valve
1728  000d 206a          	jra	L513
1729  000f               L172:
1730                     ; 421 EncEntry:		
1730                     ; 422 		i = uiInfoSet.controlMode==0 ? uiInfoSet.valve : uiInfoSet.valve_sub;
1732  000f c60073        	ld	a,_uiInfoSet+6
1733  0012 2605          	jrne	L224
1734  0014 c60074        	ld	a,_uiInfoSet+7
1735  0017 2003          	jra	L424
1736  0019               L224:
1737  0019 c60075        	ld	a,_uiInfoSet+8
1738  001c               L424:
1739  001c 6b01          	ld	(OFST+0,sp),a
1740                     ; 423 		if( uiInfo.enc != 0 )
1742  001e c60000        	ld	a,_uiInfo
1743  0021 2731          	jreq	L713
1744                     ; 425 			ENC_MOVE_0(1, 8, 1);
1746  0023 a540          	bcp	a,#64
1747  0025 260e          	jrne	L123
1750  0027 7b01          	ld	a,(OFST+0,sp)
1751  0029 a102          	cp	a,#2
1752  002b 2404          	jruge	L323
1755  002d a608          	ld	a,#8
1757  002f 200c          	jp	LC006
1758  0031               L323:
1761  0031 0a01          	dec	(OFST+0,sp)
1762  0033 200e          	jra	L723
1763  0035               L123:
1766  0035 7b01          	ld	a,(OFST+0,sp)
1767  0037 a108          	cp	a,#8
1768  0039 2506          	jrult	L133
1771  003b a601          	ld	a,#1
1772  003d               LC006:
1773  003d 6b01          	ld	(OFST+0,sp),a
1775  003f 2002          	jra	L723
1776  0041               L133:
1779  0041 0c01          	inc	(OFST+0,sp)
1780  0043               L723:
1781                     ; 426 			if( uiInfoSet.controlMode==0 )
1784  0043 c60073        	ld	a,_uiInfoSet+6
1785  0046 2607          	jrne	L533
1786                     ; 427 				uiInfoSet.valve = i;
1788  0048 7b01          	ld	a,(OFST+0,sp)
1789  004a c70074        	ld	_uiInfoSet+7,a
1791  004d 2005          	jra	L713
1792  004f               L533:
1793                     ; 429 				uiInfoSet.valve_sub = i;
1795  004f 7b01          	ld	a,(OFST+0,sp)
1796  0051 c70075        	ld	_uiInfoSet+8,a
1797  0054               L713:
1798                     ; 431 		if( _dsPrev != i )
1800  0054 c60013        	ld	a,__dsPrev
1801  0057 1101          	cp	a,(OFST+0,sp)
1802  0059 271e          	jreq	L513
1803                     ; 433 			_dsPrev = i;
1805  005b 7b01          	ld	a,(OFST+0,sp)
1806  005d c70013        	ld	__dsPrev,a
1807                     ; 434 			UI_DISP_2Digit(i);
1809  0060 5f            	clrw	x
1810  0061 97            	ld	xl,a
1811  0062 a60a          	ld	a,#10
1812  0064 62            	div	x,a
1813  0065 a602          	ld	a,#2
1814  0067 95            	ld	xh,a
1815  0068 cd0000        	call	_lcd_disp_n
1819  006b 7b01          	ld	a,(OFST+0,sp)
1820  006d 5f            	clrw	x
1821  006e 97            	ld	xl,a
1822  006f a60a          	ld	a,#10
1823  0071 62            	div	x,a
1824  0072 97            	ld	xl,a
1825  0073 a603          	ld	a,#3
1826  0075 95            	ld	xh,a
1827  0076 cd0000        	call	_lcd_disp_n
1830  0079               L513:
1831                     ; 437 	if( key == 0x10 )		__UP
1833  0079 7b02          	ld	a,(OFST+1,sp)
1834  007b a110          	cp	a,#16
1835  007d 2606          	jrne	L343
1838  007f 35010000      	mov	_uiInfo,#1
1842  0083 2008          	jp	LC005
1843  0085               L343:
1844                     ; 438 	else if( key == 0x20 )	__DN
1846  0085 a120          	cp	a,#32
1847  0087 2609          	jrne	L743
1850  0089 35400000      	mov	_uiInfo,#64
1853  008d               LC005:
1855  008d 0f02          	clr	(OFST+1,sp)
1858  008f cc000f        	jra	L172
1859  0092               L743:
1860                     ; 439 	else if( key == 4 )	
1862  0092 a104          	cp	a,#4
1863  0094 261e          	jrne	L543
1864                     ; 442 		if( uiInfoSet.controlMode==0 )
1866  0096 c60073        	ld	a,_uiInfoSet+6
1867  0099 2607          	jrne	L553
1868                     ; 443 			uiInfoSet.cnt = uiInfoSet.valve;
1870  009b 550074006f    	mov	_uiInfoSet+2,_uiInfoSet+7
1872  00a0 2005          	jra	L753
1873  00a2               L553:
1874                     ; 445 			uiInfoSet.cnt_sub = uiInfoSet.valve_sub;
1876  00a2 5500750070    	mov	_uiInfoSet+3,_uiInfoSet+8
1877  00a7               L753:
1878                     ; 446 		STATUS_NEXT(next);	
1880  00a7 7b03          	ld	a,(OFST+2,sp)
1881  00a9 c70011        	ld	__ds,a
1884  00ac 725f0012      	clr	__dsCount
1887  00b0 35ff0013      	mov	__dsPrev,#255
1889  00b4               L543:
1890                     ; 448 }
1893  00b4 5b03          	addw	sp,#3
1894  00b6 81            	ret	
1959                     ; 450 void	disp_status_toffset(uint8_t key, uint8_t next)
1959                     ; 451 {
1960                     .text:	section	.text,new
1961  0000               _disp_status_toffset:
1963  0000 89            	pushw	x
1964  0001 88            	push	a
1965       00000001      OFST:	set	1
1968                     ; 453 	if( _dsCount == 0 )
1970  0002 c60012        	ld	a,__dsCount
1971  0005 2620          	jrne	L163
1972                     ; 455 		disp_next();
1974  0007 cd0000        	call	_disp_next
1976                     ; 456 		LCD_BIT_SET(bP19);
1978  000a c60029        	ld	a,_iLF_DEF+41
1979  000d 5f            	clrw	x
1980  000e 97            	ld	xl,a
1981  000f d6540c        	ld	a,(21516,x)
1982  0012 ca0029        	or	a,_bLF_DEF+41
1983  0015 d7540c        	ld	(21516,x),a
1984                     ; 458 		if( uiInfoSet.tOffset == 0 )
1986  0018 c60078        	ld	a,_uiInfoSet+11
1987  001b 2703cc00b1    	jrne	L114
1988                     ; 459 			uiInfoSet.tOffset = 100;
1990  0020 35640078      	mov	_uiInfoSet+11,#100
1991  0024 cc00b1        	jra	L114
1992  0027               L163:
1993                     ; 463 EncEntry:		
1993                     ; 464 		i = uiInfoSet.tOffset;
1995  0027 c60078        	ld	a,_uiInfoSet+11
1996  002a 6b01          	ld	(OFST+0,sp),a
1997                     ; 465 		if( uiInfo.enc != 0 )
1999  002c c60000        	ld	a,_uiInfo
2000  002f 2747          	jreq	L314
2001                     ; 467 			if( (uiInfo.enc & 0x40) == 0 )
2003  0031 a540          	bcp	a,#64
2004  0033 261c          	jrne	L514
2005                     ; 469 				if( i > 100 )			i -= 2;
2007  0035 7b01          	ld	a,(OFST+0,sp)
2008  0037 a165          	cp	a,#101
2011  0039 2434          	jruge	L144
2012                     ; 470 				else if( i == 100 )		i = 2;
2014  003b a164          	cp	a,#100
2015  003d 2604          	jrne	L324
2018  003f a602          	ld	a,#2
2020  0041 2020          	jp	LC009
2021  0043               L324:
2022                     ; 473 					i += 2;
2024  0043 0c01          	inc	(OFST+0,sp)
2025  0045 0c01          	inc	(OFST+0,sp)
2026                     ; 474 					if( i >= 18 )		i = 18;
2028  0047 7b01          	ld	a,(OFST+0,sp)
2029  0049 a112          	cp	a,#18
2030  004b 2528          	jrult	L134
2033  004d a612          	ld	a,#18
2034  004f 2012          	jp	LC009
2035  0051               L514:
2036                     ; 479 				if( i >= 100 )
2038  0051 7b01          	ld	a,(OFST+0,sp)
2039  0053 a164          	cp	a,#100
2040  0055 2510          	jrult	L334
2041                     ; 481 					i += 2;
2043  0057 0c01          	inc	(OFST+0,sp)
2044  0059 0c01          	inc	(OFST+0,sp)
2045                     ; 482 					if( i >= 118 )		i = 118;
2047  005b 7b01          	ld	a,(OFST+0,sp)
2048  005d a176          	cp	a,#118
2049  005f 2514          	jrult	L134
2052  0061 a676          	ld	a,#118
2053  0063               LC009:
2054  0063 6b01          	ld	(OFST+0,sp),a
2055  0065 200e          	jra	L134
2056  0067               L334:
2057                     ; 486 					if( i == 2 )		i = 100;
2059  0067 a102          	cp	a,#2
2060  0069 2604          	jrne	L144
2063  006b a664          	ld	a,#100
2065  006d 20f4          	jp	LC009
2066  006f               L144:
2067                     ; 488 						i -= 2;
2070  006f 0a01          	dec	(OFST+0,sp)
2071  0071 0a01          	dec	(OFST+0,sp)
2072  0073 7b01          	ld	a,(OFST+0,sp)
2073  0075               L134:
2074                     ; 491 			uiInfoSet.tOffset = i;
2076  0075 c70078        	ld	_uiInfoSet+11,a
2077  0078               L314:
2078                     ; 493 		if( _dsPrev != i )
2080  0078 c60013        	ld	a,__dsPrev
2081  007b 1101          	cp	a,(OFST+0,sp)
2082  007d 2732          	jreq	L114
2083                     ; 495 			_dsPrev = i;
2085  007f 7b01          	ld	a,(OFST+0,sp)
2086  0081 c70013        	ld	__dsPrev,a
2087                     ; 496 			clear_npos2();
2089  0084 cd0000        	call	_clear_npos2
2091                     ; 497 			if( i < 100 && i != 0 )
2093  0087 7b01          	ld	a,(OFST+0,sp)
2094  0089 a164          	cp	a,#100
2095  008b 2414          	jruge	L744
2097  008d 0d01          	tnz	(OFST+0,sp)
2098  008f 2710          	jreq	L744
2099                     ; 499 				LCD_BIT_SET(b3G);
2101  0091 c6001e        	ld	a,_iLF_DEF+30
2102  0094 5f            	clrw	x
2103  0095 97            	ld	xl,a
2104  0096 d6540c        	ld	a,(21516,x)
2105  0099 ca001e        	or	a,_bLF_DEF+30
2106  009c d7540c        	ld	(21516,x),a
2107  009f 7b01          	ld	a,(OFST+0,sp)
2108  00a1               L744:
2109                     ; 501 			j = i%100;
2111  00a1 5f            	clrw	x
2112  00a2 97            	ld	xl,a
2113  00a3 a664          	ld	a,#100
2114  00a5 62            	div	x,a
2115  00a6 6b01          	ld	(OFST+0,sp),a
2116                     ; 502 			lcd_disp_n(3, j/2);
2118  00a8 5f            	clrw	x
2119  00a9 97            	ld	xl,a
2120  00aa 57            	sraw	x
2121  00ab a603          	ld	a,#3
2122  00ad 95            	ld	xh,a
2123  00ae cd0000        	call	_lcd_disp_n
2125  00b1               L114:
2126                     ; 505 	if( key == 0x10 )		__DN
2128  00b1 7b02          	ld	a,(OFST+1,sp)
2129  00b3 a110          	cp	a,#16
2130  00b5 2606          	jrne	L154
2133  00b7 35400000      	mov	_uiInfo,#64
2137  00bb 2008          	jp	LC007
2138  00bd               L154:
2139                     ; 506 	else if( key == 0x20 )	__UP
2141  00bd a120          	cp	a,#32
2142  00bf 2609          	jrne	L554
2145  00c1 35010000      	mov	_uiInfo,#1
2148  00c5               LC007:
2150  00c5 0f02          	clr	(OFST+1,sp)
2153  00c7 cc0027        	jra	L163
2154  00ca               L554:
2155                     ; 507 	else if( key == 4 )	
2157  00ca a104          	cp	a,#4
2158  00cc 261a          	jrne	L354
2159                     ; 514 		uiInfo.tOffset = uiInfoSet.tOffset;
2161  00ce c60078        	ld	a,_uiInfoSet+11
2162  00d1 c70011        	ld	_uiInfo+17,a
2163                     ; 515 		FW_TOFFSET(uiInfo.tOffset);
2165  00d4 97            	ld	xl,a
2166  00d5 a614          	ld	a,#20
2167  00d7 95            	ld	xh,a
2168  00d8 cd0000        	call	_file_write
2170                     ; 516 		STATUS_NEXT(next);	
2172  00db 7b03          	ld	a,(OFST+2,sp)
2173  00dd c70011        	ld	__ds,a
2176  00e0 725f0012      	clr	__dsCount
2179  00e4 35ff0013      	mov	__dsPrev,#255
2181  00e8               L354:
2182                     ; 518 }
2185  00e8 5b03          	addw	sp,#3
2186  00ea 81            	ret	
2219                     ; 520 uint8_t	_backlight_get_index(uint8_t i)
2219                     ; 521 {
2220                     .text:	section	.text,new
2221  0000               __backlight_get_index:
2223  0000 88            	push	a
2224       00000000      OFST:	set	0
2227                     ; 522 	if( i==1 )	return 1;
2229  0001 4a            	dec	a
2230  0002 2604          	jrne	L774
2233  0004 4c            	inc	a
2236  0005 5b01          	addw	sp,#1
2237  0007 81            	ret	
2238  0008               L774:
2239                     ; 523 	if( i==4 )	return 2;
2241  0008 7b01          	ld	a,(OFST+1,sp)
2242  000a a104          	cp	a,#4
2243  000c 2605          	jrne	L105
2246  000e a602          	ld	a,#2
2249  0010 5b01          	addw	sp,#1
2250  0012 81            	ret	
2251  0013               L105:
2252                     ; 524 	if( i==8 )	return 3;
2254  0013 a108          	cp	a,#8
2255  0015 2605          	jrne	L305
2258  0017 a603          	ld	a,#3
2261  0019 5b01          	addw	sp,#1
2262  001b 81            	ret	
2263  001c               L305:
2264                     ; 525 	if( i==12 )	return 4;
2266  001c a10c          	cp	a,#12
2267  001e 2605          	jrne	L505
2270  0020 a604          	ld	a,#4
2273  0022 5b01          	addw	sp,#1
2274  0024 81            	ret	
2275  0025               L505:
2276                     ; 526 	return 5;
2278  0025 a605          	ld	a,#5
2281  0027 5b01          	addw	sp,#1
2282  0029 81            	ret	
2315                     ; 536 uint8_t	_backlight_get_code(uint8_t i)
2315                     ; 537 {
2316                     .text:	section	.text,new
2317  0000               __backlight_get_code:
2319  0000 88            	push	a
2320       00000000      OFST:	set	0
2323                     ; 538 	if( i==1 )	return 1;
2325  0001 4a            	dec	a
2326  0002 2604          	jrne	L325
2329  0004 4c            	inc	a
2332  0005 5b01          	addw	sp,#1
2333  0007 81            	ret	
2334  0008               L325:
2335                     ; 539 	if( i==2 )	return 4;
2337  0008 7b01          	ld	a,(OFST+1,sp)
2338  000a a102          	cp	a,#2
2339  000c 2605          	jrne	L525
2342  000e a604          	ld	a,#4
2345  0010 5b01          	addw	sp,#1
2346  0012 81            	ret	
2347  0013               L525:
2348                     ; 540 	if( i==3 )	return 8;
2350  0013 a103          	cp	a,#3
2351  0015 2605          	jrne	L725
2354  0017 a608          	ld	a,#8
2357  0019 5b01          	addw	sp,#1
2358  001b 81            	ret	
2359  001c               L725:
2360                     ; 541 	if( i==4 )	return 12;
2362  001c a104          	cp	a,#4
2363  001e 2605          	jrne	L135
2366  0020 a60c          	ld	a,#12
2369  0022 5b01          	addw	sp,#1
2370  0024 81            	ret	
2371  0025               L135:
2372                     ; 542 	return BACKLIGHT_MAX_LEVEL;
2374  0025 a660          	ld	a,#96
2377  0027 5b01          	addw	sp,#1
2378  0029 81            	ret	
2437                     ; 545 void disp_status_backlight2(uint8_t key, uint8_t next) 
2437                     ; 546 {
2438                     .text:	section	.text,new
2439  0000               _disp_status_backlight2:
2441  0000 89            	pushw	x
2442       00000001      OFST:	set	1
2445                     ; 550 	_backup_backlight2 = 0;
2447  0001 725f000a      	clr	__backup_backlight2
2448  0005 88            	push	a
2449                     ; 552 	if( _dsCount == 0 )
2451  0006 c60012        	ld	a,__dsCount
2452  0009 2611          	jrne	L335
2453                     ; 554 		lcd_clear(0);
2455  000b cd0000        	call	_lcd_clear
2457                     ; 555 		lcd_disp_backlight();
2459  000e cd0000        	call	_lcd_disp_backlight
2461                     ; 556 		_dsCount = 1;
2463  0011 35010012      	mov	__dsCount,#1
2464                     ; 557 		uiInfo._t = _backlight;
2466  0015 550000005f    	mov	_uiInfo+95,__backlight
2468  001a 205c          	jra	L755
2469  001c               L335:
2470                     ; 561 EncEntry:
2470                     ; 562 		i = _backlight;
2472  001c c60000        	ld	a,__backlight
2473  001f 6b01          	ld	(OFST+0,sp),a
2474                     ; 563 		i = _backlight_get_index(i);
2476  0021 cd0000        	call	__backlight_get_index
2478  0024 6b01          	ld	(OFST+0,sp),a
2479                     ; 565 		if( uiInfo.enc != 0 )
2481  0026 c60000        	ld	a,_uiInfo
2482  0029 2728          	jreq	L165
2483                     ; 569 			ENC_MOVE_0(1, 5, 1);
2485  002b a540          	bcp	a,#64
2486  002d 260e          	jrne	L365
2489  002f 7b01          	ld	a,(OFST+0,sp)
2490  0031 a102          	cp	a,#2
2491  0033 2404          	jruge	L565
2494  0035 a605          	ld	a,#5
2496  0037 200c          	jp	LC011
2497  0039               L565:
2500  0039 0a01          	dec	(OFST+0,sp)
2501  003b 200e          	jra	L175
2502  003d               L365:
2505  003d 7b01          	ld	a,(OFST+0,sp)
2506  003f a105          	cp	a,#5
2507  0041 2506          	jrult	L375
2510  0043 a601          	ld	a,#1
2511  0045               LC011:
2512  0045 6b01          	ld	(OFST+0,sp),a
2514  0047 2002          	jra	L175
2515  0049               L375:
2518  0049 0c01          	inc	(OFST+0,sp)
2519  004b               L175:
2520                     ; 570 			_backlight = _backlight_get_code(i);
2523  004b 7b01          	ld	a,(OFST+0,sp)
2524  004d cd0000        	call	__backlight_get_code
2526  0050 c70000        	ld	__backlight,a
2527  0053               L165:
2528                     ; 573 		if( _dsPrev != i )
2530  0053 c60013        	ld	a,__dsPrev
2531  0056 1101          	cp	a,(OFST+0,sp)
2532  0058 271e          	jreq	L755
2533                     ; 575 			_dsPrev = i;
2535  005a 7b01          	ld	a,(OFST+0,sp)
2536  005c c70013        	ld	__dsPrev,a
2537                     ; 577 			UI_DISP_2Digit(i);
2539  005f 5f            	clrw	x
2540  0060 97            	ld	xl,a
2541  0061 a60a          	ld	a,#10
2542  0063 62            	div	x,a
2543  0064 a602          	ld	a,#2
2544  0066 95            	ld	xh,a
2545  0067 cd0000        	call	_lcd_disp_n
2549  006a 7b01          	ld	a,(OFST+0,sp)
2550  006c 5f            	clrw	x
2551  006d 97            	ld	xl,a
2552  006e a60a          	ld	a,#10
2553  0070 62            	div	x,a
2554  0071 97            	ld	xl,a
2555  0072 a603          	ld	a,#3
2556  0074 95            	ld	xh,a
2557  0075 cd0000        	call	_lcd_disp_n
2560  0078               L755:
2561                     ; 581 	if( key == 0x10 )		__DN
2563  0078 7b02          	ld	a,(OFST+1,sp)
2564  007a a110          	cp	a,#16
2565  007c 2606          	jrne	L106
2568  007e 35400000      	mov	_uiInfo,#64
2572  0082 2008          	jp	LC010
2573  0084               L106:
2574                     ; 582 	else if( key == 0x20 )	__UP
2576  0084 a120          	cp	a,#32
2577  0086 2608          	jrne	L506
2580  0088 35010000      	mov	_uiInfo,#1
2583  008c               LC010:
2585  008c 0f02          	clr	(OFST+1,sp)
2588  008e 208c          	jra	L335
2589  0090               L506:
2590                     ; 583 	else if( key == 4 )	
2592  0090 a104          	cp	a,#4
2593  0092 2617          	jrne	L306
2594                     ; 588 		FW_BACKLIGHT(_backlight);
2596  0094 c60000        	ld	a,__backlight
2597  0097 97            	ld	xl,a
2598  0098 a62a          	ld	a,#42
2599  009a 95            	ld	xh,a
2600  009b cd0000        	call	_file_write
2602                     ; 589 		STATUS_NEXT(next);	
2604  009e 7b03          	ld	a,(OFST+2,sp)
2605  00a0 c70011        	ld	__ds,a
2608  00a3 725f0012      	clr	__dsCount
2611  00a7 35ff0013      	mov	__dsPrev,#255
2613  00ab               L306:
2614                     ; 591 }
2617  00ab 5b03          	addw	sp,#3
2618  00ad 81            	ret	
2674                     ; 593 void	disp_status_run_op(uint8_t key, uint8_t next)
2674                     ; 594 {
2675                     .text:	section	.text,new
2676  0000               _disp_status_run_op:
2678  0000 89            	pushw	x
2679  0001 88            	push	a
2680       00000001      OFST:	set	1
2683                     ; 596 	if( uiInfoSet.controlMode==1 )
2685  0002 c60073        	ld	a,_uiInfoSet+6
2686  0005 4a            	dec	a
2687  0006 2603          	jrne	L536
2688                     ; 598 		STATUS_NEXT(next);	
2690  0008 9f            	ld	a,xl
2693                     ; 599 		return;
2696  0009 2060          	jp	LC013
2697  000b               L536:
2698                     ; 601 	if( _dsCount == 0 )
2700  000b c60012        	ld	a,__dsCount
2701  000e 2608          	jrne	L316
2702                     ; 603 		disp_next();
2704  0010 cd0000        	call	_disp_next
2706                     ; 604 		lcd_disp_setup_cntl_op();
2708  0013 cd0000        	call	_lcd_disp_setup_cntl_op
2711  0016 2035          	jra	L146
2712  0018               L316:
2713                     ; 608 EncEntry:		
2713                     ; 609 		i = uiInfoSet.opMode;
2715  0018 c60071        	ld	a,_uiInfoSet+4
2716  001b 6b01          	ld	(OFST+0,sp),a
2717                     ; 610 		if( uiInfo.enc != 0 )
2719  001d c60000        	ld	a,_uiInfo
2720  0020 270d          	jreq	L346
2721                     ; 612 			i = i==0 ? 1 : 0;
2723  0022 7b01          	ld	a,(OFST+0,sp)
2724  0024 2603          	jrne	L674
2725  0026 4c            	inc	a
2726  0027 2001          	jra	L005
2727  0029               L674:
2728  0029 4f            	clr	a
2729  002a               L005:
2730  002a 6b01          	ld	(OFST+0,sp),a
2731                     ; 613 			uiInfoSet.opMode = i;
2733  002c c70071        	ld	_uiInfoSet+4,a
2734  002f               L346:
2735                     ; 615 		if( _dsPrev != i )
2737  002f c60013        	ld	a,__dsPrev
2738  0032 1101          	cp	a,(OFST+0,sp)
2739  0034 2717          	jreq	L146
2740                     ; 617 			_dsPrev = i;
2742  0036 7b01          	ld	a,(OFST+0,sp)
2743  0038 c70013        	ld	__dsPrev,a
2744                     ; 618 			clear_npos2();
2746  003b cd0000        	call	_clear_npos2
2748                     ; 619 			if( i==0 )		lcd_disp_setup_cntl_on();
2750  003e 7b01          	ld	a,(OFST+0,sp)
2751  0040 2605          	jrne	L746
2754  0042 cd0000        	call	_lcd_disp_setup_cntl_on
2757  0045 2006          	jra	L146
2758  0047               L746:
2759                     ; 620 			else if( i==1 )	lcd_disp_setup_cntl_po();
2761  0047 4a            	dec	a
2762  0048 2603          	jrne	L146
2765  004a cd0000        	call	_lcd_disp_setup_cntl_po
2767  004d               L146:
2768                     ; 623 	if( key == 0x10 )		__DN
2770  004d 7b02          	ld	a,(OFST+1,sp)
2771  004f a110          	cp	a,#16
2772  0051 2606          	jrne	L556
2775  0053 35400000      	mov	_uiInfo,#64
2779  0057 2008          	jp	LC012
2780  0059               L556:
2781                     ; 624 	else if( key == 0x20 )	__UP
2783  0059 a120          	cp	a,#32
2784  005b 2608          	jrne	L166
2787  005d 35010000      	mov	_uiInfo,#1
2790  0061               LC012:
2792  0061 0f02          	clr	(OFST+1,sp)
2795  0063 20b3          	jra	L316
2796  0065               L166:
2797                     ; 625 	else if( key == 4 )		
2799  0065 a104          	cp	a,#4
2800  0067 260d          	jrne	L756
2801                     ; 627 		STATUS_NEXT(next);	
2803  0069 7b03          	ld	a,(OFST+2,sp)
2808  006b               LC013:
2809  006b c70011        	ld	__ds,a
2811  006e 725f0012      	clr	__dsCount
2813  0072 35ff0013      	mov	__dsPrev,#255
2815  0076               L756:
2816                     ; 629 }
2819  0076 5b03          	addw	sp,#3
2820  0078 81            	ret	
2877                     ; 631 void	disp_status_cntl_op(uint8_t key, uint8_t next)
2877                     ; 632 {
2878                     .text:	section	.text,new
2879  0000               _disp_status_cntl_op:
2881  0000 89            	pushw	x
2882  0001 88            	push	a
2883       00000001      OFST:	set	1
2886                     ; 634 	if( uiInfoSet.controlMode==1 )
2888  0002 c60073        	ld	a,_uiInfoSet+6
2889  0005 4a            	dec	a
2890  0006 2603          	jrne	L117
2891                     ; 636 		STATUS_NEXT(next);	
2893  0008 9f            	ld	a,xl
2896                     ; 637 		return;
2899  0009 205d          	jp	LC015
2900  000b               L117:
2901                     ; 639 	if( _dsCount == 0 )
2903  000b c60012        	ld	a,__dsCount
2904  000e 2608          	jrne	L766
2905                     ; 641 		disp_next();
2907  0010 cd0000        	call	_disp_next
2909                     ; 642 		lcd_disp_setup_mode();
2911  0013 cd0000        	call	_lcd_disp_setup_mode
2914  0016 2032          	jra	L517
2915  0018               L766:
2916                     ; 646 EncEntry:		
2916                     ; 647 		i = uiInfoSet.cntlMode;
2918  0018 c6006d        	ld	a,_uiInfoSet
2919  001b 6b01          	ld	(OFST+0,sp),a
2920                     ; 648 		if( uiInfo.enc != 0 )
2922  001d c60000        	ld	a,_uiInfo
2923  0020 270d          	jreq	L717
2924                     ; 650 			i = i==0 ? 1 : 0;
2926  0022 7b01          	ld	a,(OFST+0,sp)
2927  0024 2603          	jrne	L025
2928  0026 4c            	inc	a
2929  0027 2001          	jra	L225
2930  0029               L025:
2931  0029 4f            	clr	a
2932  002a               L225:
2933  002a 6b01          	ld	(OFST+0,sp),a
2934                     ; 651 			uiInfoSet.cntlMode = i;
2936  002c c7006d        	ld	_uiInfoSet,a
2937  002f               L717:
2938                     ; 653 		if( _dsPrev != i )
2940  002f c60013        	ld	a,__dsPrev
2941  0032 1101          	cp	a,(OFST+0,sp)
2942  0034 2714          	jreq	L517
2943                     ; 655 			_dsPrev = i;
2945  0036 7b01          	ld	a,(OFST+0,sp)
2946  0038 c70013        	ld	__dsPrev,a
2947                     ; 656 			clear_npos2();
2949  003b cd0000        	call	_clear_npos2
2951                     ; 657 			if( i == 0 )	lcd_disp_setup_mode_local();
2953  003e 7b01          	ld	a,(OFST+0,sp)
2954  0040 2605          	jrne	L327
2957  0042 cd0000        	call	_lcd_disp_setup_mode_local
2960  0045 2003          	jra	L517
2961  0047               L327:
2962                     ; 658 			else			lcd_disp_setup_mode_each();
2964  0047 cd0000        	call	_lcd_disp_setup_mode_each
2966  004a               L517:
2967                     ; 661 	if( key == 0x10 )		__DN
2969  004a 7b02          	ld	a,(OFST+1,sp)
2970  004c a110          	cp	a,#16
2971  004e 2606          	jrne	L727
2974  0050 35400000      	mov	_uiInfo,#64
2978  0054 2008          	jp	LC014
2979  0056               L727:
2980                     ; 662 	else if( key == 0x20 )	__UP
2982  0056 a120          	cp	a,#32
2983  0058 2608          	jrne	L337
2986  005a 35010000      	mov	_uiInfo,#1
2989  005e               LC014:
2991  005e 0f02          	clr	(OFST+1,sp)
2994  0060 20b6          	jra	L766
2995  0062               L337:
2996                     ; 663 	else if( key == 4 )		
2998  0062 a104          	cp	a,#4
2999  0064 260d          	jrne	L137
3000                     ; 665 		STATUS_NEXT(next);	
3002  0066 7b03          	ld	a,(OFST+2,sp)
3007  0068               LC015:
3008  0068 c70011        	ld	__ds,a
3010  006b 725f0012      	clr	__dsCount
3012  006f 35ff0013      	mov	__dsPrev,#255
3014  0073               L137:
3015                     ; 667 }
3018  0073 5b03          	addw	sp,#3
3019  0075 81            	ret	
3074                     ; 669 void	disp_status_houseCapa(uint8_t key, uint8_t next)
3074                     ; 670 {
3075                     .text:	section	.text,new
3076  0000               _disp_status_houseCapa:
3078  0000 89            	pushw	x
3079  0001 88            	push	a
3080       00000001      OFST:	set	1
3083                     ; 672 	if(uiInfoSet.cntlMode != 0 )	
3085  0002 c6006d        	ld	a,_uiInfoSet
3086  0005 2704          	jreq	L367
3087                     ; 675 		STATUS_NEXT(next);
3089  0007 9f            	ld	a,xl
3092                     ; 676 		return;
3095  0008 cc009b        	jp	LC017
3096  000b               L367:
3097                     ; 679 	if( _dsCount == 0 )
3099  000b c60012        	ld	a,__dsCount
3100  000e 2608          	jrne	L147
3101                     ; 681 		disp_next();
3103  0010 cd0000        	call	_disp_next
3105                     ; 682 		lcd_disp_setup_len();
3107  0013 cd0000        	call	_lcd_disp_setup_len
3110  0016 2065          	jra	L767
3111  0018               L147:
3112                     ; 686 EncEntry:		
3112                     ; 687 		i = uiInfoSet.houseCapa;
3114  0018 c60077        	ld	a,_uiInfoSet+10
3115  001b 6b01          	ld	(OFST+0,sp),a
3116                     ; 688 		if( uiInfo.enc != 0 )
3118  001d c60000        	ld	a,_uiInfo
3119  0020 271f          	jreq	L177
3120                     ; 690 			if( (uiInfo.enc & 0x40) == 0 )	i--;
3122  0022 a540          	bcp	a,#64
3123  0024 2604          	jrne	L377
3126  0026 0a01          	dec	(OFST+0,sp)
3128  0028 2002          	jra	L577
3129  002a               L377:
3130                     ; 692 				i++;
3132  002a 0c01          	inc	(OFST+0,sp)
3133  002c               L577:
3134                     ; 693 			if( i < 70 )	i = 200;
3136  002c 7b01          	ld	a,(OFST+0,sp)
3137  002e a146          	cp	a,#70
3138  0030 2404          	jruge	L777
3141  0032 a6c8          	ld	a,#200
3142  0034 6b01          	ld	(OFST+0,sp),a
3143  0036               L777:
3144                     ; 694 			if( i > 200 )	i = 70;
3146  0036 a1c9          	cp	a,#201
3147  0038 2504          	jrult	L1001
3150  003a a646          	ld	a,#70
3151  003c 6b01          	ld	(OFST+0,sp),a
3152  003e               L1001:
3153                     ; 695 			uiInfoSet.houseCapa = i;
3155  003e c70077        	ld	_uiInfoSet+10,a
3156  0041               L177:
3157                     ; 697 		if( _dsPrev != i )
3159  0041 c60013        	ld	a,__dsPrev
3160  0044 1101          	cp	a,(OFST+0,sp)
3161  0046 2735          	jreq	L767
3162                     ; 699 			_dsPrev = i;
3164  0048 7b01          	ld	a,(OFST+0,sp)
3165  004a c70013        	ld	__dsPrev,a
3166                     ; 700 			UI_DISP_3Digit(i);
3168  004d 5f            	clrw	x
3169  004e 97            	ld	xl,a
3170  004f a664          	ld	a,#100
3171  0051 62            	div	x,a
3172  0052 a601          	ld	a,#1
3173  0054 95            	ld	xh,a
3174  0055 cd0000        	call	_lcd_disp_n
3178  0058 7b01          	ld	a,(OFST+0,sp)
3179  005a 5f            	clrw	x
3180  005b 97            	ld	xl,a
3181  005c a664          	ld	a,#100
3182  005e 62            	div	x,a
3183  005f 5f            	clrw	x
3184  0060 97            	ld	xl,a
3185  0061 01            	rrwa	x,a
3186  0062 6b01          	ld	(OFST+0,sp),a
3189  0064 5f            	clrw	x
3190  0065 97            	ld	xl,a
3191  0066 a60a          	ld	a,#10
3192  0068 62            	div	x,a
3193  0069 a602          	ld	a,#2
3194  006b 95            	ld	xh,a
3195  006c cd0000        	call	_lcd_disp_n
3199  006f 7b01          	ld	a,(OFST+0,sp)
3200  0071 5f            	clrw	x
3201  0072 97            	ld	xl,a
3202  0073 a60a          	ld	a,#10
3203  0075 62            	div	x,a
3204  0076 97            	ld	xl,a
3205  0077 a603          	ld	a,#3
3206  0079 95            	ld	xh,a
3207  007a cd0000        	call	_lcd_disp_n
3210  007d               L767:
3211                     ; 703 	if( key == 0x10 )		__DN
3213  007d 7b02          	ld	a,(OFST+1,sp)
3214  007f a110          	cp	a,#16
3215  0081 2606          	jrne	L5001
3218  0083 35400000      	mov	_uiInfo,#64
3222  0087 2008          	jp	LC016
3223  0089               L5001:
3224                     ; 704 	else if( key == 0x20 )	__UP
3226  0089 a120          	cp	a,#32
3227  008b 2608          	jrne	L1101
3230  008d 35010000      	mov	_uiInfo,#1
3233  0091               LC016:
3235  0091 0f02          	clr	(OFST+1,sp)
3238  0093 2083          	jra	L147
3239  0095               L1101:
3240                     ; 705 	else if( key == 4 )		
3242  0095 a104          	cp	a,#4
3243  0097 260d          	jrne	L7001
3244                     ; 707 		STATUS_NEXT(next);	
3246  0099 7b03          	ld	a,(OFST+2,sp)
3251  009b               LC017:
3252  009b c70011        	ld	__ds,a
3254  009e 725f0012      	clr	__dsCount
3256  00a2 35ff0013      	mov	__dsPrev,#255
3258  00a6               L7001:
3259                     ; 709 }
3262  00a6 5b03          	addw	sp,#3
3263  00a8 81            	ret	
3296                     ; 711 void	disp_status_po_type(uint8_t key, uint8_t next)
3296                     ; 712 {
3297                     .text:	section	.text,new
3298  0000               _disp_status_po_type:
3302                     ; 757 }
3305  0000 81            	ret	
3308                     	switch	.const
3309  0012               ___lpm:
3310  0012 00            	dc.b	0
3311  0013 08            	dc.b	8
3312  0014 0a            	dc.b	10
3313  0015 0f            	dc.b	15
3314  0016 14            	dc.b	20
3315  0017 19            	dc.b	25
3316  0018 1e            	dc.b	30
3317  0019 63            	dc.b	99
3318  001a 63            	dc.b	99
3372                     ; 764 void	disp_status_lpm(uint8_t key, uint8_t next)
3372                     ; 765 {
3373                     .text:	section	.text,new
3374  0000               _disp_status_lpm:
3376  0000 89            	pushw	x
3377  0001 88            	push	a
3378       00000001      OFST:	set	1
3381                     ; 768 	if( uiInfoSet.cntlMode == 1 )
3383  0002 c6006d        	ld	a,_uiInfoSet
3384  0005 4a            	dec	a
3385  0006 2604          	jrne	L5501
3386                     ; 770 		STATUS_NEXT(next);
3388  0008 9f            	ld	a,xl
3391                     ; 771 		return;
3394  0009 cc00a1        	jp	LC019
3395  000c               L5501:
3396                     ; 773 	if( _dsCount == 0 )
3398  000c c60012        	ld	a,__dsCount
3399  000f 2608          	jrne	L3301
3400                     ; 775 		disp_next();
3402  0011 cd0000        	call	_disp_next
3404                     ; 776 		lcd_disp_setup_lpm();
3406  0014 cd0000        	call	_lcd_disp_setup_lpm
3409  0017 2069          	jra	L1601
3410  0019               L3301:
3411                     ; 780 EncEntry:		
3411                     ; 781 		i = uiInfoSet.controlMode==1 ? uiInfoSet.lpmType_sub : uiInfoSet.lpmType;
3413  0019 c60073        	ld	a,_uiInfoSet+6
3414  001c 4a            	dec	a
3415  001d 2605          	jrne	L265
3416  001f c6007b        	ld	a,_uiInfoSet+14
3417  0022 2003          	jra	L465
3418  0024               L265:
3419  0024 c6007a        	ld	a,_uiInfoSet+13
3420  0027               L465:
3421  0027 6b01          	ld	(OFST+0,sp),a
3422                     ; 783 		if( uiInfo.enc != 0 )
3424  0029 c60000        	ld	a,_uiInfo
3425  002c 2730          	jreq	L3601
3426                     ; 785 			if( (uiInfo.enc & 0x40) == 0 )
3428  002e a540          	bcp	a,#64
3429  0030 260e          	jrne	L5601
3430                     ; 787 				if( i==0 )	i = 7;
3432  0032 7b01          	ld	a,(OFST+0,sp)
3433  0034 2606          	jrne	L7601
3436  0036 a607          	ld	a,#7
3437  0038 6b01          	ld	(OFST+0,sp),a
3439  003a 2010          	jra	L3701
3440  003c               L7601:
3441                     ; 789 					i--;
3443  003c 0a01          	dec	(OFST+0,sp)
3444  003e 200c          	jra	L3701
3445  0040               L5601:
3446                     ; 793 				if( i==7 )	i = 0;
3448  0040 7b01          	ld	a,(OFST+0,sp)
3449  0042 a107          	cp	a,#7
3450  0044 2604          	jrne	L5701
3453  0046 0f01          	clr	(OFST+0,sp)
3455  0048 2002          	jra	L3701
3456  004a               L5701:
3457                     ; 795 					i++;
3459  004a 0c01          	inc	(OFST+0,sp)
3460  004c               L3701:
3461                     ; 797 			if( uiInfoSet.controlMode==1 )
3463  004c c60073        	ld	a,_uiInfoSet+6
3464  004f 4a            	dec	a
3465  0050 2607          	jrne	L1011
3466                     ; 798 				uiInfoSet.lpmType_sub = i;
3468  0052 7b01          	ld	a,(OFST+0,sp)
3469  0054 c7007b        	ld	_uiInfoSet+14,a
3471  0057 2005          	jra	L3601
3472  0059               L1011:
3473                     ; 800 				uiInfoSet.lpmType = i;
3475  0059 7b01          	ld	a,(OFST+0,sp)
3476  005b c7007a        	ld	_uiInfoSet+13,a
3477  005e               L3601:
3478                     ; 802 		if( _dsPrev != i )
3480  005e c60013        	ld	a,__dsPrev
3481  0061 1101          	cp	a,(OFST+0,sp)
3482  0063 271d          	jreq	L1601
3483                     ; 804 			_dsPrev = i;
3485  0065 7b01          	ld	a,(OFST+0,sp)
3486  0067 c70013        	ld	__dsPrev,a
3487                     ; 805 			clear_npos2();
3489  006a cd0000        	call	_clear_npos2
3491                     ; 806 			UI_DISP_2Digit(__lpm[i]);
3493  006d 7b01          	ld	a,(OFST+0,sp)
3494  006f ad3e          	call	LC020
3495  0071 a602          	ld	a,#2
3496  0073 95            	ld	xh,a
3497  0074 cd0000        	call	_lcd_disp_n
3501  0077 7b01          	ld	a,(OFST+0,sp)
3502  0079 ad34          	call	LC020
3503  007b 97            	ld	xl,a
3504  007c a603          	ld	a,#3
3505  007e 95            	ld	xh,a
3506  007f cd0000        	call	_lcd_disp_n
3509  0082               L1601:
3510                     ; 809 	if( key == 0x10 )		__DN
3512  0082 7b02          	ld	a,(OFST+1,sp)
3513  0084 a110          	cp	a,#16
3514  0086 2606          	jrne	L7011
3517  0088 35400000      	mov	_uiInfo,#64
3521  008c 2008          	jp	LC018
3522  008e               L7011:
3523                     ; 810 	else if( key == 0x20 )	__UP
3525  008e a120          	cp	a,#32
3526  0090 2609          	jrne	L3111
3529  0092 35010000      	mov	_uiInfo,#1
3532  0096               LC018:
3534  0096 0f02          	clr	(OFST+1,sp)
3537  0098 cc0019        	jra	L3301
3538  009b               L3111:
3539                     ; 811 	else if( key == 4 )		
3541  009b a104          	cp	a,#4
3542  009d 260d          	jrne	L1111
3543                     ; 813 		STATUS_NEXT(next);	
3545  009f 7b03          	ld	a,(OFST+2,sp)
3550  00a1               LC019:
3551  00a1 c70011        	ld	__ds,a
3553  00a4 725f0012      	clr	__dsCount
3555  00a8 35ff0013      	mov	__dsPrev,#255
3557  00ac               L1111:
3558                     ; 815 }
3561  00ac 5b03          	addw	sp,#3
3562  00ae 81            	ret	
3563  00af               LC020:
3564  00af 5f            	clrw	x
3565  00b0 97            	ld	xl,a
3566  00b1 d60012        	ld	a,(___lpm,x)
3567  00b4 5f            	clrw	x
3568  00b5 97            	ld	xl,a
3569  00b6 a60a          	ld	a,#10
3570  00b8 62            	div	x,a
3571  00b9 81            	ret	
3604                     ; 817 void	disp_status_temp_offset(uint8_t key, uint8_t next)
3604                     ; 818 {
3605                     .text:	section	.text,new
3606  0000               _disp_status_temp_offset:
3610                     ; 857 }
3613  0000 81            	ret	
3616                     	switch	.data
3617  0016               __ui_:
3618  0016 00            	dc.b	0
3698                     ; 865 void	disp_status_valveinfo_sub(uint8_t key, uint8_t next, uint8_t prev)
3698                     ; 866 {
3699                     .text:	section	.text,new
3700  0000               _disp_status_valveinfo_sub:
3702  0000 89            	pushw	x
3703  0001 520c          	subw	sp,#12
3704       0000000c      OFST:	set	12
3707                     ; 869 	if( _dsCount == 0 )
3709  0003 c60012        	ld	a,__dsCount
3710  0006 2664          	jrne	L5311
3711                     ; 871 		if( uiInfoSet.valve_sub == 0 )
3713  0008 725d0075      	tnz	_uiInfoSet+8
3714  000c 260a          	jrne	L1711
3715                     ; 873 			uiInfoSet.cnt_sub = 0;
3717  000e c70070        	ld	_uiInfoSet+3,a
3718                     ; 874 			uiInfoSet.lpmType_sub = 0;
3720  0011 c7007b        	ld	_uiInfoSet+14,a
3721                     ; 875 			STATUS_NEXT(next);	
3723  0014 9f            	ld	a,xl
3724  0015 cd019f        	call	LC024
3726  0018               L1711:
3727                     ; 877 		disp_next();
3729  0018 cd0000        	call	_disp_next
3731                     ; 878 		lcd_disp_n(0, UI_RIDs+1);
3733  001b c600a0        	ld	a,_uiInfoSet+51
3734  001e 4c            	inc	a
3735  001f 97            	ld	xl,a
3736  0020 4f            	clr	a
3737  0021 95            	ld	xh,a
3738  0022 cd0000        	call	_lcd_disp_n
3740                     ; 879 		lcd_blink_npos(UI_RIDs+1);
3742  0025 c600a0        	ld	a,_uiInfoSet+51
3743  0028 4c            	inc	a
3744  0029 cd0000        	call	_lcd_blink_npos
3746                     ; 880 		_ui_ = uiInfoSet.valve_sub_rc[UI_RIDs];// + uiInfoSet.cnt;
3748  002c cd0199        	call	LC023
3749  002f d60094        	ld	a,(_uiInfoSet+39,x)
3750  0032 c70016        	ld	__ui_,a
3751                     ; 881 		lcd_disp_rid(_ui_, 1, 0);
3753  0035 4b00          	push	#0
3754  0037 ae0001        	ldw	x,#1
3755  003a 95            	ld	xh,a
3756  003b cd0000        	call	_lcd_disp_rid
3758  003e 84            	pop	a
3759                     ; 882 		for( i=0; i<8; i++ )
3761  003f 4f            	clr	a
3762  0040 6b0c          	ld	(OFST+0,sp),a
3763  0042               L3711:
3764                     ; 884 			if( i >= uiInfoSet.valve_sub )
3766  0042 c10075        	cp	a,_uiInfoSet+8
3767  0045 5f            	clrw	x
3768  0046 97            	ld	xl,a
3769  0047 250c          	jrult	L1021
3770                     ; 886 				uiInfoSet.valve_sub_len[i] = 0;
3772  0049 724f008c      	clr	(_uiInfoSet+31,x)
3773                     ; 887 				uiInfoSet.valve_sub_rc[i] = 0;
3775  004d 5f            	clrw	x
3776  004e 97            	ld	xl,a
3777  004f 724f0094      	clr	(_uiInfoSet+39,x)
3779  0053 200d          	jra	L3021
3780  0055               L1021:
3781                     ; 891 				if( uiInfoSet.valve_rc[i] == 0 )
3783  0055 724d0084      	tnz	(_uiInfoSet+23,x)
3784  0059 2607          	jrne	L3021
3785                     ; 892 					uiInfoSet.valve_rc[i] = 1;
3787  005b 5f            	clrw	x
3788  005c 97            	ld	xl,a
3789  005d a601          	ld	a,#1
3790  005f d70084        	ld	(_uiInfoSet+23,x),a
3791  0062               L3021:
3792                     ; 882 		for( i=0; i<8; i++ )
3794  0062 0c0c          	inc	(OFST+0,sp)
3797  0064 7b0c          	ld	a,(OFST+0,sp)
3798  0066 a108          	cp	a,#8
3799  0068 25d8          	jrult	L3711
3801  006a 206d          	jra	L7021
3802  006c               L5311:
3803                     ; 898 EncEntry:		
3803                     ; 899 		i = uiInfoSet.valve_sub_len[UI_RIDs];
3805  006c cd0199        	call	LC023
3806  006f d6008c        	ld	a,(_uiInfoSet+31,x)
3807  0072 6b0c          	ld	(OFST+0,sp),a
3808                     ; 900 		if( uiInfo.enc != 0 )
3810  0074 c60000        	ld	a,_uiInfo
3811  0077 2724          	jreq	L1121
3812                     ; 902 			if( (uiInfo.enc & 0x40) == 0 )	i--;
3814  0079 a540          	bcp	a,#64
3815  007b 2604          	jrne	L3121
3818  007d 0a0c          	dec	(OFST+0,sp)
3820  007f 2002          	jra	L5121
3821  0081               L3121:
3822                     ; 904 				i++;
3824  0081 0c0c          	inc	(OFST+0,sp)
3825  0083               L5121:
3826                     ; 905 			if( i > 150 )	i = 35;
3828  0083 7b0c          	ld	a,(OFST+0,sp)
3829  0085 a197          	cp	a,#151
3830  0087 2504          	jrult	L7121
3833  0089 a623          	ld	a,#35
3834  008b 6b0c          	ld	(OFST+0,sp),a
3835  008d               L7121:
3836                     ; 906 			if( i < 35 )	i = 150;
3838  008d a123          	cp	a,#35
3839  008f 2404          	jruge	L1221
3842  0091 a696          	ld	a,#150
3843  0093 6b0c          	ld	(OFST+0,sp),a
3844  0095               L1221:
3845                     ; 907 			uiInfoSet.valve_sub_len[UI_RIDs] = i;
3847  0095 cd0199        	call	LC023
3848  0098 7b0c          	ld	a,(OFST+0,sp)
3849  009a d7008c        	ld	(_uiInfoSet+31,x),a
3850  009d               L1121:
3851                     ; 909 		if( _dsPrev != i )
3853  009d c60013        	ld	a,__dsPrev
3854  00a0 110c          	cp	a,(OFST+0,sp)
3855  00a2 2735          	jreq	L7021
3856                     ; 911 			_dsPrev = i;
3858  00a4 7b0c          	ld	a,(OFST+0,sp)
3859  00a6 c70013        	ld	__dsPrev,a
3860                     ; 912 			UI_DISP_3Digit(i);
3862  00a9 5f            	clrw	x
3863  00aa 97            	ld	xl,a
3864  00ab a664          	ld	a,#100
3865  00ad 62            	div	x,a
3866  00ae a601          	ld	a,#1
3867  00b0 95            	ld	xh,a
3868  00b1 cd0000        	call	_lcd_disp_n
3872  00b4 7b0c          	ld	a,(OFST+0,sp)
3873  00b6 5f            	clrw	x
3874  00b7 97            	ld	xl,a
3875  00b8 a664          	ld	a,#100
3876  00ba 62            	div	x,a
3877  00bb 5f            	clrw	x
3878  00bc 97            	ld	xl,a
3879  00bd 01            	rrwa	x,a
3880  00be 6b0c          	ld	(OFST+0,sp),a
3883  00c0 5f            	clrw	x
3884  00c1 97            	ld	xl,a
3885  00c2 a60a          	ld	a,#10
3886  00c4 62            	div	x,a
3887  00c5 a602          	ld	a,#2
3888  00c7 95            	ld	xh,a
3889  00c8 cd0000        	call	_lcd_disp_n
3893  00cb 7b0c          	ld	a,(OFST+0,sp)
3894  00cd 5f            	clrw	x
3895  00ce 97            	ld	xl,a
3896  00cf a60a          	ld	a,#10
3897  00d1 62            	div	x,a
3898  00d2 97            	ld	xl,a
3899  00d3 a603          	ld	a,#3
3900  00d5 95            	ld	xh,a
3901  00d6 cd0000        	call	_lcd_disp_n
3904  00d9               L7021:
3905                     ; 915 	if( key == 0x10 )		__DN
3907  00d9 7b0d          	ld	a,(OFST+1,sp)
3908  00db a110          	cp	a,#16
3909  00dd 2606          	jrne	L5221
3912  00df 35400000      	mov	_uiInfo,#64
3916  00e3 2008          	jp	LC021
3917  00e5               L5221:
3918                     ; 916 	else if( key == 0x20 )	__UP
3920  00e5 a120          	cp	a,#32
3921  00e7 2609          	jrne	L1321
3924  00e9 35010000      	mov	_uiInfo,#1
3927  00ed               LC021:
3929  00ed 0f0d          	clr	(OFST+1,sp)
3932  00ef cc006c        	jra	L5311
3933  00f2               L1321:
3934                     ; 917 	else if( key == 4 )		
3936  00f2 a104          	cp	a,#4
3937  00f4 266a          	jrne	L5321
3938                     ; 919 		lcd_blink_npos_clear();
3940  00f6 cd0000        	call	_lcd_blink_npos_clear
3942                     ; 920 		STATUS_NEXT(next);	
3944  00f9 7b0e          	ld	a,(OFST+2,sp)
3945  00fb cd019f        	call	LC024
3946                     ; 921 		for( i=0; i<8; i++ )
3949  00fe 0f0c          	clr	(OFST+0,sp)
3950  0100               L7321:
3951                     ; 922 			b[i] = 0;
3953  0100 96            	ldw	x,sp
3954  0101 1c0004        	addw	x,#OFST-8
3955  0104 9f            	ld	a,xl
3956  0105 5e            	swapw	x
3957  0106 1b0c          	add	a,(OFST+0,sp)
3958  0108 2401          	jrnc	L226
3959  010a 5c            	incw	x
3960  010b               L226:
3961  010b 02            	rlwa	x,a
3962  010c 7f            	clr	(x)
3963                     ; 921 		for( i=0; i<8; i++ )
3965  010d 0c0c          	inc	(OFST+0,sp)
3968  010f 7b0c          	ld	a,(OFST+0,sp)
3969  0111 a108          	cp	a,#8
3970  0113 25eb          	jrult	L7321
3971                     ; 923 		for( i=0; i<8; i++ )
3973  0115 4f            	clr	a
3974  0116 6b0c          	ld	(OFST+0,sp),a
3975  0118               L5421:
3976                     ; 925 			if( uiInfoSet.valve_sub_rc[i] != 0 )
3978  0118 5f            	clrw	x
3979  0119 97            	ld	xl,a
3980  011a 724d0094      	tnz	(_uiInfoSet+39,x)
3981  011e 2714          	jreq	L3521
3982                     ; 926 				b[uiInfoSet.valve_sub_rc[i]-1] = 1;
3984  0120 96            	ldw	x,sp
3985  0121 1c0004        	addw	x,#OFST-8
3986  0124 1f01          	ldw	(OFST-11,sp),x
3987  0126 5f            	clrw	x
3988  0127 97            	ld	xl,a
3989  0128 d60094        	ld	a,(_uiInfoSet+39,x)
3990  012b 5f            	clrw	x
3991  012c 97            	ld	xl,a
3992  012d 5a            	decw	x
3993  012e 72fb01        	addw	x,(OFST-11,sp)
3994  0131 a601          	ld	a,#1
3995  0133 f7            	ld	(x),a
3996  0134               L3521:
3997                     ; 923 		for( i=0; i<8; i++ )
3999  0134 0c0c          	inc	(OFST+0,sp)
4002  0136 7b0c          	ld	a,(OFST+0,sp)
4003  0138 a108          	cp	a,#8
4004  013a 25dc          	jrult	L5421
4005                     ; 928 		j = 0;
4007  013c 0f03          	clr	(OFST-9,sp)
4008                     ; 929 		for( i=0; i<8; i++ )
4010  013e 0f0c          	clr	(OFST+0,sp)
4011  0140               L5521:
4012                     ; 931 			if( b[i] != 0 )
4014  0140 96            	ldw	x,sp
4015  0141 1c0004        	addw	x,#OFST-8
4016  0144 9f            	ld	a,xl
4017  0145 5e            	swapw	x
4018  0146 1b0c          	add	a,(OFST+0,sp)
4019  0148 2401          	jrnc	L426
4020  014a 5c            	incw	x
4021  014b               L426:
4022  014b 02            	rlwa	x,a
4023  014c f6            	ld	a,(x)
4024  014d 2702          	jreq	L3621
4025                     ; 932 				j++;
4027  014f 0c03          	inc	(OFST-9,sp)
4028  0151               L3621:
4029                     ; 929 		for( i=0; i<8; i++ )
4031  0151 0c0c          	inc	(OFST+0,sp)
4034  0153 7b0c          	ld	a,(OFST+0,sp)
4035  0155 a108          	cp	a,#8
4036  0157 25e7          	jrult	L5521
4037                     ; 934 		uiInfoSet.cnt_sub = j;
4039  0159 7b03          	ld	a,(OFST-9,sp)
4040  015b c70070        	ld	_uiInfoSet+3,a
4042  015e 2036          	jra	L7221
4043  0160               L5321:
4044                     ; 936 	else if( key == 8 )
4046  0160 a108          	cp	a,#8
4047  0162 2618          	jrne	L7621
4048                     ; 938 		uiInfoSet.valve_sub_rc[UI_RIDs]++;
4050  0164 ad33          	call	LC023
4051  0166 724c0094      	inc	(_uiInfoSet+39,x)
4052                     ; 939 		if( uiInfoSet.valve_sub_rc[UI_RIDs] > 8 )
4054  016a 5f            	clrw	x
4055  016b 97            	ld	xl,a
4056  016c d60094        	ld	a,(_uiInfoSet+39,x)
4057  016f a109          	cp	a,#9
4058  0171 251f          	jrult	L7721
4059                     ; 940 			uiInfoSet.valve_sub_rc[UI_RIDs] = 1;
4061  0173 ad24          	call	LC023
4062  0175 a601          	ld	a,#1
4063  0177 d70094        	ld	(_uiInfoSet+39,x),a
4064                     ; 947 		STATUS_NEXT(prev);
4069  017a 2016          	jp	L7721
4070  017c               L7621:
4071                     ; 949 	else if( key == 1 )
4073  017c 4a            	dec	a
4074  017d 2617          	jrne	L7221
4075                     ; 951 		lcd_blink_npos_clear();
4077  017f cd0000        	call	_lcd_blink_npos_clear
4079                     ; 952 		UI_RIDs++;
4081  0182 725c00a0      	inc	_uiInfoSet+51
4082                     ; 953 		if( UI_RIDs >= uiInfoSet.valve_sub )
4084  0186 c600a0        	ld	a,_uiInfoSet+51
4085  0189 c10075        	cp	a,_uiInfoSet+8
4086  018c 2504          	jrult	L7721
4087                     ; 954 			UI_RIDs = 0;
4089  018e 725f00a0      	clr	_uiInfoSet+51
4090  0192               L7721:
4091                     ; 955 		STATUS_NEXT(prev);
4098  0192 7b11          	ld	a,(OFST+5,sp)
4099  0194 ad09          	call	LC024
4101  0196               L7221:
4102                     ; 957 }
4105  0196 5b0e          	addw	sp,#14
4106  0198 81            	ret	
4107  0199               LC023:
4108  0199 c600a0        	ld	a,_uiInfoSet+51
4109  019c 5f            	clrw	x
4110  019d 97            	ld	xl,a
4111  019e 81            	ret	
4112  019f               LC024:
4113  019f c70011        	ld	__ds,a
4115  01a2 725f0012      	clr	__dsCount
4117  01a6 35ff0013      	mov	__dsPrev,#255
4118  01aa 81            	ret	
4201                     ; 959 void	disp_status_valveinfo(uint8_t key, uint8_t next, uint8_t prev)
4201                     ; 960 {
4202                     .text:	section	.text,new
4203  0000               _disp_status_valveinfo:
4205  0000 89            	pushw	x
4206  0001 520c          	subw	sp,#12
4207       0000000c      OFST:	set	12
4210                     ; 963 	if( uiInfoSet.controlMode==1 )
4212  0003 c60073        	ld	a,_uiInfoSet+6
4213  0006 4a            	dec	a
4214  0007 260d          	jrne	L3331
4215                     ; 965 		disp_status_valveinfo_sub(key, next, prev);
4217  0009 7b11          	ld	a,(OFST+5,sp)
4218  000b 88            	push	a
4219  000c 7b0e          	ld	a,(OFST+2,sp)
4220  000e 95            	ld	xh,a
4221  000f cd0000        	call	_disp_status_valveinfo_sub
4223  0012 84            	pop	a
4224                     ; 966 		return;
4226  0013 cc01b8        	jra	L5731
4227  0016               L3331:
4228                     ; 968 	if( _dsCount == 0 )
4230  0016 c60012        	ld	a,__dsCount
4231  0019 2665          	jrne	L1031
4232                     ; 970 		if( uiInfoSet.valve == 0 )
4234  001b 725d0074      	tnz	_uiInfoSet+7
4235  001f 260b          	jrne	L7331
4236                     ; 972 			uiInfoSet.cnt = 0;
4238  0021 c7006f        	ld	_uiInfoSet+2,a
4239                     ; 973 			uiInfoSet.lpmType = 0;
4241  0024 c7007a        	ld	_uiInfoSet+13,a
4242                     ; 974 			STATUS_NEXT(next);	
4244  0027 7b0e          	ld	a,(OFST+2,sp)
4245  0029 cd01c1        	call	LC028
4247  002c               L7331:
4248                     ; 976 		disp_next();
4250  002c cd0000        	call	_disp_next
4252                     ; 977 		lcd_disp_n(0, UI_RID+1);
4254  002f c6009e        	ld	a,_uiInfoSet+49
4255  0032 4c            	inc	a
4256  0033 97            	ld	xl,a
4257  0034 4f            	clr	a
4258  0035 95            	ld	xh,a
4259  0036 cd0000        	call	_lcd_disp_n
4261                     ; 978 		lcd_blink_npos(UI_RID+1);
4263  0039 c6009e        	ld	a,_uiInfoSet+49
4264  003c 4c            	inc	a
4265  003d cd0000        	call	_lcd_blink_npos
4267                     ; 979 		_ui_ = uiInfoSet.valve_rc[UI_RID];
4269  0040 cd01bb        	call	LC027
4270  0043 d60084        	ld	a,(_uiInfoSet+23,x)
4271  0046 c70016        	ld	__ui_,a
4272                     ; 980 		lcd_disp_rid(_ui_, 1, 0);
4274  0049 4b00          	push	#0
4275  004b ae0001        	ldw	x,#1
4276  004e 95            	ld	xh,a
4277  004f cd0000        	call	_lcd_disp_rid
4279  0052 84            	pop	a
4280                     ; 981 		for( i=0; i<8; i++ )
4282  0053 4f            	clr	a
4283  0054 6b0c          	ld	(OFST+0,sp),a
4284  0056               L1431:
4285                     ; 983 			if( i >= uiInfoSet.valve )
4287  0056 c10074        	cp	a,_uiInfoSet+7
4288  0059 5f            	clrw	x
4289  005a 97            	ld	xl,a
4290  005b 250c          	jrult	L7431
4291                     ; 985 				uiInfoSet.valve_len[i] = 0;
4293  005d 724f007c      	clr	(_uiInfoSet+15,x)
4294                     ; 986 				uiInfoSet.valve_rc[i] = 0;
4296  0061 5f            	clrw	x
4297  0062 97            	ld	xl,a
4298  0063 724f0084      	clr	(_uiInfoSet+23,x)
4300  0067 200d          	jra	L1531
4301  0069               L7431:
4302                     ; 990 				if( uiInfoSet.valve_rc[i] == 0 )
4304  0069 724d0084      	tnz	(_uiInfoSet+23,x)
4305  006d 2607          	jrne	L1531
4306                     ; 991 					uiInfoSet.valve_rc[i] = 1;
4308  006f 5f            	clrw	x
4309  0070 97            	ld	xl,a
4310  0071 a601          	ld	a,#1
4311  0073 d70084        	ld	(_uiInfoSet+23,x),a
4312  0076               L1531:
4313                     ; 981 		for( i=0; i<8; i++ )
4315  0076 0c0c          	inc	(OFST+0,sp)
4318  0078 7b0c          	ld	a,(OFST+0,sp)
4319  007a a108          	cp	a,#8
4320  007c 25d8          	jrult	L1431
4322  007e 206d          	jra	L5531
4323  0080               L1031:
4324                     ; 997 EncEntry:		
4324                     ; 998 		i = uiInfoSet.valve_len[UI_RID];
4326  0080 cd01bb        	call	LC027
4327  0083 d6007c        	ld	a,(_uiInfoSet+15,x)
4328  0086 6b0c          	ld	(OFST+0,sp),a
4329                     ; 999 		if( uiInfo.enc != 0 )
4331  0088 c60000        	ld	a,_uiInfo
4332  008b 2724          	jreq	L7531
4333                     ; 1001 			if( (uiInfo.enc & 0x40) == 0 )	i--;
4335  008d a540          	bcp	a,#64
4336  008f 2604          	jrne	L1631
4339  0091 0a0c          	dec	(OFST+0,sp)
4341  0093 2002          	jra	L3631
4342  0095               L1631:
4343                     ; 1003 				i++;
4345  0095 0c0c          	inc	(OFST+0,sp)
4346  0097               L3631:
4347                     ; 1004 			if( i > 150 )	i = 35;
4349  0097 7b0c          	ld	a,(OFST+0,sp)
4350  0099 a197          	cp	a,#151
4351  009b 2504          	jrult	L5631
4354  009d a623          	ld	a,#35
4355  009f 6b0c          	ld	(OFST+0,sp),a
4356  00a1               L5631:
4357                     ; 1005 			if( i < 35 )	i = 150;
4359  00a1 a123          	cp	a,#35
4360  00a3 2404          	jruge	L7631
4363  00a5 a696          	ld	a,#150
4364  00a7 6b0c          	ld	(OFST+0,sp),a
4365  00a9               L7631:
4366                     ; 1006 			uiInfoSet.valve_len[UI_RID] = i;
4368  00a9 cd01bb        	call	LC027
4369  00ac 7b0c          	ld	a,(OFST+0,sp)
4370  00ae d7007c        	ld	(_uiInfoSet+15,x),a
4371  00b1               L7531:
4372                     ; 1008 		if( _dsPrev != i )
4374  00b1 c60013        	ld	a,__dsPrev
4375  00b4 110c          	cp	a,(OFST+0,sp)
4376  00b6 2735          	jreq	L5531
4377                     ; 1010 			_dsPrev = i;
4379  00b8 7b0c          	ld	a,(OFST+0,sp)
4380  00ba c70013        	ld	__dsPrev,a
4381                     ; 1011 			UI_DISP_3Digit(i);
4383  00bd 5f            	clrw	x
4384  00be 97            	ld	xl,a
4385  00bf a664          	ld	a,#100
4386  00c1 62            	div	x,a
4387  00c2 a601          	ld	a,#1
4388  00c4 95            	ld	xh,a
4389  00c5 cd0000        	call	_lcd_disp_n
4393  00c8 7b0c          	ld	a,(OFST+0,sp)
4394  00ca 5f            	clrw	x
4395  00cb 97            	ld	xl,a
4396  00cc a664          	ld	a,#100
4397  00ce 62            	div	x,a
4398  00cf 5f            	clrw	x
4399  00d0 97            	ld	xl,a
4400  00d1 01            	rrwa	x,a
4401  00d2 6b0c          	ld	(OFST+0,sp),a
4404  00d4 5f            	clrw	x
4405  00d5 97            	ld	xl,a
4406  00d6 a60a          	ld	a,#10
4407  00d8 62            	div	x,a
4408  00d9 a602          	ld	a,#2
4409  00db 95            	ld	xh,a
4410  00dc cd0000        	call	_lcd_disp_n
4414  00df 7b0c          	ld	a,(OFST+0,sp)
4415  00e1 5f            	clrw	x
4416  00e2 97            	ld	xl,a
4417  00e3 a60a          	ld	a,#10
4418  00e5 62            	div	x,a
4419  00e6 97            	ld	xl,a
4420  00e7 a603          	ld	a,#3
4421  00e9 95            	ld	xh,a
4422  00ea cd0000        	call	_lcd_disp_n
4425  00ed               L5531:
4426                     ; 1014 	if( key == 0x10 )		__DN
4428  00ed 7b0d          	ld	a,(OFST+1,sp)
4429  00ef a110          	cp	a,#16
4430  00f1 2606          	jrne	L3731
4433  00f3 35400000      	mov	_uiInfo,#64
4437  00f7 2008          	jp	LC025
4438  00f9               L3731:
4439                     ; 1015 	else if( key == 0x20 )	__UP
4441  00f9 a120          	cp	a,#32
4442  00fb 2609          	jrne	L7731
4445  00fd 35010000      	mov	_uiInfo,#1
4448  0101               LC025:
4450  0101 0f0d          	clr	(OFST+1,sp)
4453  0103 cc0080        	jra	L1031
4454  0106               L7731:
4455                     ; 1016 	else if( key == 4 )		
4457  0106 a104          	cp	a,#4
4458  0108 266a          	jrne	L3041
4459                     ; 1018 		lcd_blink_npos_clear();
4461  010a cd0000        	call	_lcd_blink_npos_clear
4463                     ; 1019 		STATUS_NEXT(next);	
4465  010d 7b0e          	ld	a,(OFST+2,sp)
4466  010f cd01c1        	call	LC028
4467                     ; 1020 		for( i=0; i<8; i++ )
4470  0112 0f0c          	clr	(OFST+0,sp)
4471  0114               L5041:
4472                     ; 1021 			b[i] = 0;
4474  0114 96            	ldw	x,sp
4475  0115 1c0004        	addw	x,#OFST-8
4476  0118 9f            	ld	a,xl
4477  0119 5e            	swapw	x
4478  011a 1b0c          	add	a,(OFST+0,sp)
4479  011c 2401          	jrnc	L456
4480  011e 5c            	incw	x
4481  011f               L456:
4482  011f 02            	rlwa	x,a
4483  0120 7f            	clr	(x)
4484                     ; 1020 		for( i=0; i<8; i++ )
4486  0121 0c0c          	inc	(OFST+0,sp)
4489  0123 7b0c          	ld	a,(OFST+0,sp)
4490  0125 a108          	cp	a,#8
4491  0127 25eb          	jrult	L5041
4492                     ; 1022 		for( i=0; i<8; i++ )
4494  0129 4f            	clr	a
4495  012a 6b0c          	ld	(OFST+0,sp),a
4496  012c               L3141:
4497                     ; 1024 			if( uiInfoSet.valve_rc[i] != 0 )
4499  012c 5f            	clrw	x
4500  012d 97            	ld	xl,a
4501  012e 724d0084      	tnz	(_uiInfoSet+23,x)
4502  0132 2714          	jreq	L1241
4503                     ; 1025 				b[uiInfoSet.valve_rc[i]-1] = 1;
4505  0134 96            	ldw	x,sp
4506  0135 1c0004        	addw	x,#OFST-8
4507  0138 1f01          	ldw	(OFST-11,sp),x
4508  013a 5f            	clrw	x
4509  013b 97            	ld	xl,a
4510  013c d60084        	ld	a,(_uiInfoSet+23,x)
4511  013f 5f            	clrw	x
4512  0140 97            	ld	xl,a
4513  0141 5a            	decw	x
4514  0142 72fb01        	addw	x,(OFST-11,sp)
4515  0145 a601          	ld	a,#1
4516  0147 f7            	ld	(x),a
4517  0148               L1241:
4518                     ; 1022 		for( i=0; i<8; i++ )
4520  0148 0c0c          	inc	(OFST+0,sp)
4523  014a 7b0c          	ld	a,(OFST+0,sp)
4524  014c a108          	cp	a,#8
4525  014e 25dc          	jrult	L3141
4526                     ; 1027 		j = 0;
4528  0150 0f03          	clr	(OFST-9,sp)
4529                     ; 1028 		for( i=0; i<8; i++ )
4531  0152 0f0c          	clr	(OFST+0,sp)
4532  0154               L3241:
4533                     ; 1030 			if( b[i] != 0 )
4535  0154 96            	ldw	x,sp
4536  0155 1c0004        	addw	x,#OFST-8
4537  0158 9f            	ld	a,xl
4538  0159 5e            	swapw	x
4539  015a 1b0c          	add	a,(OFST+0,sp)
4540  015c 2401          	jrnc	L656
4541  015e 5c            	incw	x
4542  015f               L656:
4543  015f 02            	rlwa	x,a
4544  0160 f6            	ld	a,(x)
4545  0161 2702          	jreq	L1341
4546                     ; 1031 				j++;
4548  0163 0c03          	inc	(OFST-9,sp)
4549  0165               L1341:
4550                     ; 1028 		for( i=0; i<8; i++ )
4552  0165 0c0c          	inc	(OFST+0,sp)
4555  0167 7b0c          	ld	a,(OFST+0,sp)
4556  0169 a108          	cp	a,#8
4557  016b 25e7          	jrult	L3241
4558                     ; 1033 		uiInfoSet.cnt = j;
4560  016d 7b03          	ld	a,(OFST-9,sp)
4561  016f c7006f        	ld	_uiInfoSet+2,a
4563  0172 2044          	jra	L5731
4564  0174               L3041:
4565                     ; 1035 	else if( key == 8 )
4567  0174 a108          	cp	a,#8
4568  0176 2626          	jrne	L5341
4569                     ; 1037 		uiInfoSet.valve_rc[UI_RID]++;
4571  0178 ad41          	call	LC027
4572  017a 724c0084      	inc	(_uiInfoSet+23,x)
4573                     ; 1038 		if( uiInfoSet.valve+1 == uiInfoSet.valve_rc[UI_RID] )
4575  017e 5f            	clrw	x
4576  017f 97            	ld	xl,a
4577  0180 d60084        	ld	a,(_uiInfoSet+23,x)
4578  0183 5f            	clrw	x
4579  0184 97            	ld	xl,a
4580  0185 c60074        	ld	a,_uiInfoSet+7
4581  0188 905f          	clrw	y
4582  018a 9097          	ld	yl,a
4583  018c bf00          	ldw	c_x,x
4584  018e 905c          	incw	y
4585  0190 90b300        	cpw	y,c_x
4586  0193 261f          	jrne	L5441
4587                     ; 1039 			uiInfoSet.valve_rc[UI_RID] = 1;
4589  0195 ad24          	call	LC027
4590  0197 a601          	ld	a,#1
4591  0199 d70084        	ld	(_uiInfoSet+23,x),a
4592                     ; 1040 		STATUS_NEXT(prev);
4597  019c 2016          	jp	L5441
4598  019e               L5341:
4599                     ; 1042 	else if( key == 1 )
4601  019e 4a            	dec	a
4602  019f 2617          	jrne	L5731
4603                     ; 1044 		lcd_blink_npos_clear();
4605  01a1 cd0000        	call	_lcd_blink_npos_clear
4607                     ; 1045 		UI_RID++;
4609  01a4 725c009e      	inc	_uiInfoSet+49
4610                     ; 1046 		if( UI_RID == uiInfoSet.valve )
4612  01a8 c6009e        	ld	a,_uiInfoSet+49
4613  01ab c10074        	cp	a,_uiInfoSet+7
4614  01ae 2604          	jrne	L5441
4615                     ; 1047 			UI_RID = 0;
4617  01b0 725f009e      	clr	_uiInfoSet+49
4618  01b4               L5441:
4619                     ; 1048 		STATUS_NEXT(prev);
4626  01b4 7b11          	ld	a,(OFST+5,sp)
4627  01b6 ad09          	call	LC028
4629  01b8               L5731:
4630                     ; 1050 }
4633  01b8 5b0e          	addw	sp,#14
4634  01ba 81            	ret	
4635  01bb               LC027:
4636  01bb c6009e        	ld	a,_uiInfoSet+49
4637  01be 5f            	clrw	x
4638  01bf 97            	ld	xl,a
4639  01c0 81            	ret	
4640  01c1               LC028:
4641  01c1 c70011        	ld	__ds,a
4643  01c4 725f0012      	clr	__dsCount
4645  01c8 35ff0013      	mov	__dsPrev,#255
4646  01cc 81            	ret	
4700                     ; 1052 void	disp_status_plc(uint8_t key, uint8_t next)
4700                     ; 1053 {
4701                     .text:	section	.text,new
4702  0000               _disp_status_plc:
4704  0000 89            	pushw	x
4705  0001 88            	push	a
4706       00000001      OFST:	set	1
4709                     ; 1080 	if( _dsCount == 0 )
4711  0002 c60012        	ld	a,__dsCount
4712  0005 260b          	jrne	L7441
4713                     ; 1082 		disp_next();
4715  0007 cd0000        	call	_disp_next
4717                     ; 1083 		lcd_disp_plc();
4719  000a cd0000        	call	_lcd_disp_plc
4721                     ; 1084 		lcd_disp_n(3, uiInfoSet.plc);
4723  000d c600a2        	ld	a,_uiInfoSet+53
4726  0010 2039          	jp	LC030
4727  0012               L7441:
4728                     ; 1088 EncEntry:
4728                     ; 1089 		i = uiInfoSet.plc;
4730  0012 c600a2        	ld	a,_uiInfoSet+53
4731  0015 6b01          	ld	(OFST+0,sp),a
4732                     ; 1090 		if( uiInfo.enc != 0 )
4734  0017 c60000        	ld	a,_uiInfo
4735  001a 2723          	jreq	L5741
4736                     ; 1093 			if( (uiInfo.enc & 0x40) == 0 )
4738  001c a540          	bcp	a,#64
4739  001e 260e          	jrne	L7741
4740                     ; 1095 				if( i != 0 )
4742  0020 7b01          	ld	a,(OFST+0,sp)
4743  0022 2704          	jreq	L1051
4744                     ; 1096 					i--;
4746  0024 0a01          	dec	(OFST+0,sp)
4748  0026 2012          	jra	L5051
4749  0028               L1051:
4750                     ; 1098 					i = _ID_MAX+1;
4752  0028 a608          	ld	a,#8
4753  002a 6b01          	ld	(OFST+0,sp),a
4754  002c 200c          	jra	L5051
4755  002e               L7741:
4756                     ; 1102 				if( i != _ID_MAX+1 )
4758  002e 7b01          	ld	a,(OFST+0,sp)
4759  0030 a108          	cp	a,#8
4760  0032 2704          	jreq	L7051
4761                     ; 1103 					i++;
4763  0034 0c01          	inc	(OFST+0,sp)
4765  0036 2002          	jra	L5051
4766  0038               L7051:
4767                     ; 1105 					i = 0;
4769  0038 0f01          	clr	(OFST+0,sp)
4770  003a               L5051:
4771                     ; 1107 			uiInfoSet.plc = i;
4773  003a 7b01          	ld	a,(OFST+0,sp)
4774  003c c700a2        	ld	_uiInfoSet+53,a
4775  003f               L5741:
4776                     ; 1109 		if( _dsPrev != i )
4778  003f c60013        	ld	a,__dsPrev
4779  0042 1101          	cp	a,(OFST+0,sp)
4780  0044 270c          	jreq	L3741
4781                     ; 1111 			_dsPrev = i;
4783  0046 7b01          	ld	a,(OFST+0,sp)
4784  0048 c70013        	ld	__dsPrev,a
4785                     ; 1112 			lcd_disp_n(3, i);
4787  004b               LC030:
4788  004b 97            	ld	xl,a
4789  004c a603          	ld	a,#3
4790  004e 95            	ld	xh,a
4791  004f cd0000        	call	_lcd_disp_n
4793  0052               L3741:
4794                     ; 1115 	if( key == 4 )		
4796  0052 7b02          	ld	a,(OFST+1,sp)
4797  0054 a104          	cp	a,#4
4798  0056 260f          	jrne	L5151
4799                     ; 1117 		STATUS_NEXT(next);	
4801  0058 7b03          	ld	a,(OFST+2,sp)
4802  005a c70011        	ld	__ds,a
4805  005d 725f0012      	clr	__dsCount
4808  0061 35ff0013      	mov	__dsPrev,#255
4811  0065 2016          	jra	L7151
4812  0067               L5151:
4813                     ; 1119 	else if( key == 0x10 )	__DN
4815  0067 a110          	cp	a,#16
4816  0069 2606          	jrne	L1251
4819  006b 35400000      	mov	_uiInfo,#64
4823  006f 2008          	jp	LC029
4824  0071               L1251:
4825                     ; 1120 	else if( key == 0x20 )	__UP
4827  0071 a120          	cp	a,#32
4828  0073 2608          	jrne	L7151
4831  0075 35010000      	mov	_uiInfo,#1
4834  0079               LC029:
4836  0079 0f02          	clr	(OFST+1,sp)
4839  007b 2095          	jra	L7441
4840  007d               L7151:
4841                     ; 1121 }
4844  007d 5b03          	addw	sp,#3
4845  007f 81            	ret	
4848                     	switch	.data
4849  0017               ___func_rc_timerout:
4850  0017 00            	dc.b	0
4851  0018               ___func_rc_timerout1:
4852  0018 00            	dc.b	0
4853  0019               ___func_rc_timerout2:
4854  0019 00            	dc.b	0
4913                     ; 1130 uint8_t	disp_status_run(uint8_t key, uint8_t next, uint8_t prev)
4913                     ; 1131 {
4914                     .text:	section	.text,new
4915  0000               _disp_status_run:
4917  0000 89            	pushw	x
4918       00000000      OFST:	set	0
4921                     ; 1133 	if( _dsCount == 0 )
4923  0001 c60012        	ld	a,__dsCount
4924  0004 2611          	jrne	L7451
4925                     ; 1135 		disp_next();
4927  0006 cd0000        	call	_disp_next
4929                     ; 1136 		LCD_BIT_SET(bP15);
4931  0009 c6003f        	ld	a,_iLF_DEF+63
4932  000c 5f            	clrw	x
4933  000d 97            	ld	xl,a
4934  000e d6540c        	ld	a,(21516,x)
4935  0011 ca003f        	or	a,_bLF_DEF+63
4936  0014 d7540c        	ld	(21516,x),a
4937  0017               L7451:
4938                     ; 1139 	if( key == 4 )	
4940  0017 7b01          	ld	a,(OFST+1,sp)
4941  0019 a104          	cp	a,#4
4942  001b 2703cc0212    	jrne	L1551
4943                     ; 1141 		copy_infoSet();
4945  0020 cd0000        	call	_copy_infoSet
4947                     ; 1142 		FW_MODE(uiInfo.mode);
4949  0023 c60008        	ld	a,_uiInfo+8
4950  0026 97            	ld	xl,a
4951  0027 a609          	ld	a,#9
4952  0029 95            	ld	xh,a
4953  002a cd0000        	call	_file_write
4955                     ; 1143 		FW_ID(uiInfo.id);
4957  002d c60004        	ld	a,_uiInfo+4
4958  0030 97            	ld	xl,a
4959  0031 a60a          	ld	a,#10
4960  0033 95            	ld	xh,a
4961  0034 cd0000        	call	_file_write
4963                     ; 1144 		FW_TOFFSET(uiInfo.tOffset);
4965  0037 c60011        	ld	a,_uiInfo+17
4966  003a 97            	ld	xl,a
4967  003b a614          	ld	a,#20
4968  003d 95            	ld	xh,a
4969  003e cd0000        	call	_file_write
4971                     ; 1145 		if( uiInfo.mode == 1 )
4973  0041 c60008        	ld	a,_uiInfo+8
4974  0044 4a            	dec	a
4975  0045 2703cc0201    	jrne	L3551
4976                     ; 1147 			func_rc_setting();
4978  004a cd0000        	call	_func_rc_setting
4980                     ; 1148 			__func_rc_timerout = 6;
4982  004d 35060017      	mov	___func_rc_timerout,#6
4983                     ; 1149 			FW_CNTLMODE(uiInfo.cntlMode);
4985  0051 c60003        	ld	a,_uiInfo+3
4986  0054 97            	ld	xl,a
4987  0055 a608          	ld	a,#8
4988  0057 95            	ld	xh,a
4989  0058 cd0000        	call	_file_write
4991                     ; 1150 			FW_VALVE(uiInfo.valve);
4993  005b c6000a        	ld	a,_uiInfo+10
4994  005e 97            	ld	xl,a
4995  005f a60e          	ld	a,#14
4996  0061 95            	ld	xh,a
4997  0062 cd0000        	call	_file_write
4999                     ; 1151 			FW_VALVE_SUB(uiInfo.valve_sub);
5001  0065 c6000b        	ld	a,_uiInfo+11
5002  0068 97            	ld	xl,a
5003  0069 a62c          	ld	a,#44
5004  006b 95            	ld	xh,a
5005  006c cd0000        	call	_file_write
5007                     ; 1152 			FW_CNT(uiInfo.cnt);
5009  006f c60005        	ld	a,_uiInfo+5
5010  0072 97            	ld	xl,a
5011  0073 a60b          	ld	a,#11
5012  0075 95            	ld	xh,a
5013  0076 cd0000        	call	_file_write
5015                     ; 1153 			FW_CNT_SUB(uiInfo.cnt_sub);
5017  0079 c60006        	ld	a,_uiInfo+6
5018  007c 97            	ld	xl,a
5019  007d a62b          	ld	a,#43
5020  007f 95            	ld	xh,a
5021  0080 cd0000        	call	_file_write
5023                     ; 1154 			FW_CNT_MODE(uiInfo.controlMode);
5025  0083 c60009        	ld	a,_uiInfo+9
5026  0086 97            	ld	xl,a
5027  0087 a60d          	ld	a,#13
5028  0089 95            	ld	xh,a
5029  008a cd0000        	call	_file_write
5031                     ; 1155 			FW_OPMODE(uiInfo.opMode);
5033  008d c60007        	ld	a,_uiInfo+7
5034  0090 97            	ld	xl,a
5035  0091 a60c          	ld	a,#12
5036  0093 95            	ld	xh,a
5037  0094 cd0000        	call	_file_write
5039                     ; 1156 			FW_POTYPE(uiInfo.poType);
5041  0097 c6000f        	ld	a,_uiInfo+15
5042  009a 97            	ld	xl,a
5043  009b a612          	ld	a,#18
5044  009d 95            	ld	xh,a
5045  009e cd0000        	call	_file_write
5047                     ; 1157 			FW_HOUSECAPA(uiInfo.houseCapa);
5049  00a1 c60010        	ld	a,_uiInfo+16
5050  00a4 97            	ld	xl,a
5051  00a5 a613          	ld	a,#19
5052  00a7 95            	ld	xh,a
5053  00a8 cd0000        	call	_file_write
5055                     ; 1158 			FW_LPM(uiInfo.lpmType);
5057  00ab c60013        	ld	a,_uiInfo+19
5058  00ae 97            	ld	xl,a
5059  00af a628          	ld	a,#40
5060  00b1 95            	ld	xh,a
5061  00b2 cd0000        	call	_file_write
5063                     ; 1159 			FW_TEMPOFFSET(uiInfo.tempOffset);
5065  00b5 c60012        	ld	a,_uiInfo+18
5066  00b8 97            	ld	xl,a
5067  00b9 a627          	ld	a,#39
5068  00bb 95            	ld	xh,a
5069  00bc cd0000        	call	_file_write
5071                     ; 1161 			FW_VALVE_INFOS
5073  00bf c60015        	ld	a,_uiInfo+21
5074  00c2 97            	ld	xl,a
5075  00c3 a615          	ld	a,#21
5076  00c5 95            	ld	xh,a
5077  00c6 cd0000        	call	_file_write
5081  00c9 c60016        	ld	a,_uiInfo+22
5082  00cc 97            	ld	xl,a
5083  00cd a616          	ld	a,#22
5084  00cf 95            	ld	xh,a
5085  00d0 cd0000        	call	_file_write
5089  00d3 c60017        	ld	a,_uiInfo+23
5090  00d6 97            	ld	xl,a
5091  00d7 a617          	ld	a,#23
5092  00d9 95            	ld	xh,a
5093  00da cd0000        	call	_file_write
5097  00dd c60018        	ld	a,_uiInfo+24
5098  00e0 97            	ld	xl,a
5099  00e1 a618          	ld	a,#24
5100  00e3 95            	ld	xh,a
5101  00e4 cd0000        	call	_file_write
5105  00e7 c60019        	ld	a,_uiInfo+25
5106  00ea 97            	ld	xl,a
5107  00eb a619          	ld	a,#25
5108  00ed 95            	ld	xh,a
5109  00ee cd0000        	call	_file_write
5113  00f1 c6001a        	ld	a,_uiInfo+26
5114  00f4 97            	ld	xl,a
5115  00f5 a61a          	ld	a,#26
5116  00f7 95            	ld	xh,a
5117  00f8 cd0000        	call	_file_write
5121  00fb c6001b        	ld	a,_uiInfo+27
5122  00fe 97            	ld	xl,a
5123  00ff a61b          	ld	a,#27
5124  0101 95            	ld	xh,a
5125  0102 cd0000        	call	_file_write
5129  0105 c6001c        	ld	a,_uiInfo+28
5130  0108 97            	ld	xl,a
5131  0109 a61c          	ld	a,#28
5132  010b 95            	ld	xh,a
5133  010c cd0000        	call	_file_write
5137  010f c60025        	ld	a,_uiInfo+37
5138  0112 97            	ld	xl,a
5139  0113 a62e          	ld	a,#46
5140  0115 95            	ld	xh,a
5141  0116 cd0000        	call	_file_write
5145  0119 c60026        	ld	a,_uiInfo+38
5146  011c 97            	ld	xl,a
5147  011d a62f          	ld	a,#47
5148  011f 95            	ld	xh,a
5149  0120 cd0000        	call	_file_write
5153  0123 c60027        	ld	a,_uiInfo+39
5154  0126 97            	ld	xl,a
5155  0127 a630          	ld	a,#48
5156  0129 95            	ld	xh,a
5157  012a cd0000        	call	_file_write
5161  012d c60028        	ld	a,_uiInfo+40
5162  0130 97            	ld	xl,a
5163  0131 a631          	ld	a,#49
5164  0133 95            	ld	xh,a
5165  0134 cd0000        	call	_file_write
5169  0137 c60029        	ld	a,_uiInfo+41
5170  013a 97            	ld	xl,a
5171  013b a632          	ld	a,#50
5172  013d 95            	ld	xh,a
5173  013e cd0000        	call	_file_write
5177  0141 c6002a        	ld	a,_uiInfo+42
5178  0144 97            	ld	xl,a
5179  0145 a633          	ld	a,#51
5180  0147 95            	ld	xh,a
5181  0148 cd0000        	call	_file_write
5185  014b c6002b        	ld	a,_uiInfo+43
5186  014e 97            	ld	xl,a
5187  014f a634          	ld	a,#52
5188  0151 95            	ld	xh,a
5189  0152 cd0000        	call	_file_write
5193  0155 c6002c        	ld	a,_uiInfo+44
5194  0158 97            	ld	xl,a
5195  0159 a635          	ld	a,#53
5196  015b 95            	ld	xh,a
5197  015c cd0000        	call	_file_write
5199                     ; 1162 			FW_VALVE_RCINFOS
5201  015f c6001d        	ld	a,_uiInfo+29
5202  0162 97            	ld	xl,a
5203  0163 a61d          	ld	a,#29
5204  0165 95            	ld	xh,a
5205  0166 cd0000        	call	_file_write
5209  0169 c6001e        	ld	a,_uiInfo+30
5210  016c 97            	ld	xl,a
5211  016d a61e          	ld	a,#30
5212  016f 95            	ld	xh,a
5213  0170 cd0000        	call	_file_write
5217  0173 c6001f        	ld	a,_uiInfo+31
5218  0176 97            	ld	xl,a
5219  0177 a61f          	ld	a,#31
5220  0179 95            	ld	xh,a
5221  017a cd0000        	call	_file_write
5225  017d c60020        	ld	a,_uiInfo+32
5226  0180 97            	ld	xl,a
5227  0181 a620          	ld	a,#32
5228  0183 95            	ld	xh,a
5229  0184 cd0000        	call	_file_write
5233  0187 c60021        	ld	a,_uiInfo+33
5234  018a 97            	ld	xl,a
5235  018b a621          	ld	a,#33
5236  018d 95            	ld	xh,a
5237  018e cd0000        	call	_file_write
5241  0191 c60022        	ld	a,_uiInfo+34
5242  0194 97            	ld	xl,a
5243  0195 a622          	ld	a,#34
5244  0197 95            	ld	xh,a
5245  0198 cd0000        	call	_file_write
5249  019b c60023        	ld	a,_uiInfo+35
5250  019e 97            	ld	xl,a
5251  019f a623          	ld	a,#35
5252  01a1 95            	ld	xh,a
5253  01a2 cd0000        	call	_file_write
5257  01a5 c60024        	ld	a,_uiInfo+36
5258  01a8 97            	ld	xl,a
5259  01a9 a624          	ld	a,#36
5260  01ab 95            	ld	xh,a
5261  01ac cd0000        	call	_file_write
5265  01af c6002d        	ld	a,_uiInfo+45
5266  01b2 97            	ld	xl,a
5267  01b3 a636          	ld	a,#54
5268  01b5 95            	ld	xh,a
5269  01b6 cd0000        	call	_file_write
5273  01b9 c6002e        	ld	a,_uiInfo+46
5274  01bc 97            	ld	xl,a
5275  01bd a637          	ld	a,#55
5276  01bf 95            	ld	xh,a
5277  01c0 cd0000        	call	_file_write
5281  01c3 c6002f        	ld	a,_uiInfo+47
5282  01c6 97            	ld	xl,a
5283  01c7 a638          	ld	a,#56
5284  01c9 95            	ld	xh,a
5285  01ca cd0000        	call	_file_write
5289  01cd c60030        	ld	a,_uiInfo+48
5290  01d0 97            	ld	xl,a
5291  01d1 a639          	ld	a,#57
5292  01d3 95            	ld	xh,a
5293  01d4 cd0000        	call	_file_write
5297  01d7 c60031        	ld	a,_uiInfo+49
5298  01da 97            	ld	xl,a
5299  01db a63a          	ld	a,#58
5300  01dd 95            	ld	xh,a
5301  01de cd0000        	call	_file_write
5305  01e1 c60032        	ld	a,_uiInfo+50
5306  01e4 97            	ld	xl,a
5307  01e5 a63b          	ld	a,#59
5308  01e7 95            	ld	xh,a
5309  01e8 cd0000        	call	_file_write
5313  01eb c60033        	ld	a,_uiInfo+51
5314  01ee 97            	ld	xl,a
5315  01ef a63c          	ld	a,#60
5316  01f1 95            	ld	xh,a
5317  01f2 cd0000        	call	_file_write
5321  01f5 c60034        	ld	a,_uiInfo+52
5322  01f8 97            	ld	xl,a
5323  01f9 a63d          	ld	a,#61
5324  01fb 95            	ld	xh,a
5325  01fc cd0000        	call	_file_write
5328  01ff 2004          	jra	L5551
5329  0201               L3551:
5330                     ; 1166 			__func_rc_timerout = 4;
5332  0201 35040017      	mov	___func_rc_timerout,#4
5333  0205               L5551:
5334                     ; 1169 		__func_rc_timerout1 = 0;
5336  0205 725f0018      	clr	___func_rc_timerout1
5337                     ; 1170 		__func_rc_timerout2 = __timer1s;
5339  0209 5500000019    	mov	___func_rc_timerout2,___timer1s
5340                     ; 1171 		STATUS_NEXT(next);	
5342  020e 7b02          	ld	a,(OFST+2,sp)
5347  0210 2012          	jp	LC031
5348  0212               L1551:
5349                     ; 1173 	else if( key == 2 )
5351  0212 a102          	cp	a,#2
5352  0214 2608          	jrne	L1651
5353                     ; 1175 		_backup_backlight = 0;
5355  0216 725f0009      	clr	__backup_backlight
5356                     ; 1177 		return 1;
5358  021a a601          	ld	a,#1
5360  021c 2012          	jra	L2401
5361  021e               L1651:
5362                     ; 1179 	else if( key == 8 )
5364  021e a108          	cp	a,#8
5365  0220 260d          	jrne	L7551
5366                     ; 1181 		STATUS_NEXT(prev);
5368  0222 7b05          	ld	a,(OFST+5,sp)
5373  0224               LC031:
5374  0224 c70011        	ld	__ds,a
5376  0227 725f0012      	clr	__dsCount
5378  022b 35ff0013      	mov	__dsPrev,#255
5380  022f               L7551:
5381                     ; 1183 	return 0;
5383  022f 4f            	clr	a
5385  0230               L2401:
5387  0230 85            	popw	x
5388  0231 81            	ret	
5440                     ; 1186 uint8_t	disp_status_run_id(uint8_t key, uint8_t next, uint8_t prev)
5440                     ; 1187 {
5441                     .text:	section	.text,new
5442  0000               _disp_status_run_id:
5444  0000 89            	pushw	x
5445       00000000      OFST:	set	0
5448                     ; 1189 	if( _dsCount == 0 )
5450  0001 c60012        	ld	a,__dsCount
5451  0004 2611          	jrne	L5061
5452                     ; 1191 		disp_next();
5454  0006 cd0000        	call	_disp_next
5456                     ; 1192 		LCD_BIT_SET(bP15);
5458  0009 c6003f        	ld	a,_iLF_DEF+63
5459  000c 5f            	clrw	x
5460  000d 97            	ld	xl,a
5461  000e d6540c        	ld	a,(21516,x)
5462  0011 ca003f        	or	a,_bLF_DEF+63
5463  0014 d7540c        	ld	(21516,x),a
5464  0017               L5061:
5465                     ; 1195 	if( key == 4 )	
5467  0017 7b01          	ld	a,(OFST+1,sp)
5468  0019 a104          	cp	a,#4
5469  001b 263b          	jrne	L7061
5470                     ; 1197 		copy_infoSet();
5472  001d cd0000        	call	_copy_infoSet
5474                     ; 1198 		FW_MODE(uiInfo.mode);
5476  0020 c60008        	ld	a,_uiInfo+8
5477  0023 97            	ld	xl,a
5478  0024 a609          	ld	a,#9
5479  0026 95            	ld	xh,a
5480  0027 cd0000        	call	_file_write
5482                     ; 1199 		FW_ID(uiInfo.id);
5484  002a c60004        	ld	a,_uiInfo+4
5485  002d 97            	ld	xl,a
5486  002e a60a          	ld	a,#10
5487  0030 95            	ld	xh,a
5488  0031 cd0000        	call	_file_write
5490                     ; 1200 		FW_TOFFSET(uiInfo.tOffset);
5492  0034 c60011        	ld	a,_uiInfo+17
5493  0037 97            	ld	xl,a
5494  0038 a614          	ld	a,#20
5495  003a 95            	ld	xh,a
5496  003b cd0000        	call	_file_write
5498                     ; 1202 		__func_rc_timerout = 4;
5500  003e 35040017      	mov	___func_rc_timerout,#4
5501                     ; 1203 		__func_rc_timerout1 = 0;
5503  0042 725f0018      	clr	___func_rc_timerout1
5504                     ; 1204 		__func_rc_timerout2 = __timer1s;
5506  0046 5500000019    	mov	___func_rc_timerout2,___timer1s
5507                     ; 1205 		STATUS_NEXT(next);	
5509  004b 7b02          	ld	a,(OFST+2,sp)
5510  004d c70011        	ld	__ds,a
5513  0050 725f0012      	clr	__dsCount
5516  0054 35ff0013      	mov	__dsPrev,#255
5518  0058               L7061:
5519                     ; 1208 	return 0;
5521  0058 4f            	clr	a
5524  0059 85            	popw	x
5525  005a 81            	ret	
5585                     ; 1212 void	disp_status_exit(uint8_t key, uint8_t next)
5585                     ; 1213 {
5586                     .text:	section	.text,new
5587  0000               _disp_status_exit:
5589  0000 89            	pushw	x
5590       00000001      OFST:	set	1
5593                     ; 1216 	_backup_backlight = 0;
5595  0001 725f0009      	clr	__backup_backlight
5596  0005 88            	push	a
5597                     ; 1217 	if( (_t20ms%10) != 0 )
5599  0006 c60000        	ld	a,__t20ms
5600  0009 5f            	clrw	x
5601  000a 97            	ld	xl,a
5602  000b a60a          	ld	a,#10
5603  000d cd0000        	call	c_smodx
5605  0010 5d            	tnzw	x
5606  0011 2706          	jreq	L1361
5607                     ; 1219 		_dsPrev = 0;
5609  0013 725f0013      	clr	__dsPrev
5610                     ; 1220 		return;
5612  0017 2005          	jra	L6601
5613  0019               L1361:
5614                     ; 1223 	if( _dsPrev != 0 )
5616  0019 c60013        	ld	a,__dsPrev
5617  001c 2703          	jreq	L3361
5618                     ; 1224 		return;
5619  001e               L6601:
5622  001e 5b03          	addw	sp,#3
5623  0020 81            	ret	
5624  0021               L3361:
5625                     ; 1227 	_dsCount++;
5627  0021 725c0012      	inc	__dsCount
5628                     ; 1228 	_dsPrev = 1;
5630  0025 35010013      	mov	__dsPrev,#1
5631                     ; 1229 	lcd_clear(0);
5633  0029 cd0000        	call	_lcd_clear
5635                     ; 1230 	for( i=0; i<4; i++ )
5637  002c 0f01          	clr	(OFST+0,sp)
5638  002e               L5361:
5639                     ; 1231 		lcd_disp_n(i, _dsCount%10);
5641  002e c60012        	ld	a,__dsCount
5642  0031 5f            	clrw	x
5643  0032 97            	ld	xl,a
5644  0033 a60a          	ld	a,#10
5645  0035 62            	div	x,a
5646  0036 97            	ld	xl,a
5647  0037 7b01          	ld	a,(OFST+0,sp)
5648  0039 95            	ld	xh,a
5649  003a cd0000        	call	_lcd_disp_n
5651                     ; 1230 	for( i=0; i<4; i++ )
5653  003d 0c01          	inc	(OFST+0,sp)
5656  003f 7b01          	ld	a,(OFST+0,sp)
5657  0041 a104          	cp	a,#4
5658  0043 25e9          	jrult	L5361
5659                     ; 1233 	if( __func_rc_settingCb == 1 && _dsCount >= 10 )
5661  0045 c60000        	ld	a,___func_rc_settingCb
5662  0048 4a            	dec	a
5663  0049 2607          	jrne	L3461
5665  004b c60012        	ld	a,__dsCount
5666  004e a10a          	cp	a,#10
5667                     ; 1235 		STATUS_NEXT(next);
5670                     ; 1236 		return;
5673  0050 242f          	jruge	L3561
5674  0052               L3461:
5675                     ; 1238 	if( __timer1s != __func_rc_timerout2 )
5677  0052 c60000        	ld	a,___timer1s
5678  0055 c10019        	cp	a,___func_rc_timerout2
5679  0058 2736          	jreq	L5461
5680                     ; 1240 		if( __func_rc_timerout1 == 0 )
5682  005a c60018        	ld	a,___func_rc_timerout1
5683  005d 26bf          	jrne	L6601
5684                     ; 1242 			__func_rc_timerout2 = __timer1s;
5686  005f 5500000019    	mov	___func_rc_timerout2,___timer1s
5687                     ; 1243 			__func_rc_timerout1 = 1;
5689  0064 35010018      	mov	___func_rc_timerout1,#1
5690                     ; 1244 			__func_rc_timerout--;
5692  0068 725a0017      	dec	___func_rc_timerout
5693                     ; 1245 			if( __func_rc_timerout == 0 )
5695  006c 26b0          	jrne	L6601
5696                     ; 1247 				if( uiInfo.mode == 1 )
5698  006e c60008        	ld	a,_uiInfo+8
5699  0071 4a            	dec	a
5700  0072 260d          	jrne	L3561
5701                     ; 1251 					ui_error = 19;
5703  0074 35130000      	mov	_ui_error,#19
5704                     ; 1252 					_ds = 97;
5706  0078 35610011      	mov	__ds,#97
5707                     ; 1253 					_dsCount = 0;
5709  007c c70012        	ld	__dsCount,a
5711  007f 209d          	jra	L6601
5712  0081               L3561:
5713                     ; 1257 					STATUS_NEXT(next);
5720  0081 7b03          	ld	a,(OFST+2,sp)
5721  0083 c70011        	ld	__ds,a
5723  0086 725f0012      	clr	__dsCount
5725  008a 35ff0013      	mov	__dsPrev,#255
5727  008e 208e          	jra	L6601
5728  0090               L5461:
5729                     ; 1263 		__func_rc_timerout1 = 0;
5731  0090 725f0018      	clr	___func_rc_timerout1
5732                     ; 1264 }
5734  0094 2088          	jra	L6601
5737                     	switch	.data
5738  001a               __tim1min:
5739  001a 00            	dc.b	0
5740  001b               __tim30min:
5741  001b 00            	dc.b	0
5742  001c               __timFlag:
5743  001c 00            	dc.b	0
5767                     ; 1270 void	timerClear(void)
5767                     ; 1271 {
5768                     .text:	section	.text,new
5769  0000               _timerClear:
5773                     ; 1272 	_tim1min = 0;
5775  0000 725f001a      	clr	__tim1min
5776                     ; 1273 	_tim30min = 0;
5778  0004 725f001b      	clr	__tim30min
5779                     ; 1274 	_timFlag = 0;
5781  0008 725f001c      	clr	__timFlag
5782                     ; 1275 }
5785  000c 81            	ret	
5824                     ; 1277 void	disp_status_loop_message(uint8_t i)
5824                     ; 1278 {
5825                     .text:	section	.text,new
5826  0000               _disp_status_loop_message:
5828  0000 88            	push	a
5829       00000000      OFST:	set	0
5832                     ; 1279 	lcd_clear_btn();
5834  0001 cd0000        	call	_lcd_clear_btn
5836                     ; 1280 	if( i == 0 )		/*	(0)난방*/	
5838  0004 7b01          	ld	a,(OFST+1,sp)
5839  0006 2642          	jrne	L5071
5840                     ; 1282 		_disp_mode = 0x01;	
5842  0008 35010000      	mov	__disp_mode,#1
5843                     ; 1287 		LCD_BIT_SET(bP19);	
5845  000c 5f            	clrw	x
5846  000d c60029        	ld	a,_iLF_DEF+41
5847  0010 97            	ld	xl,a
5848  0011 d6540c        	ld	a,(21516,x)
5849  0014 cd00dc        	call	LC037
5850  0017 cd00d6        	call	LC036
5851  001a cd00e6        	call	LC038
5852  001d cd00d6        	call	LC036
5853  0020 ca0006        	or	a,_bLF_DEF+6
5854  0023 d7540c        	ld	(21516,x),a
5855                     ; 1290 		LCD_BIT_SET(bP15);	
5857  0026 c6003f        	ld	a,_iLF_DEF+63
5858  0029 cd00d6        	call	LC036
5859  002c ca003f        	or	a,_bLF_DEF+63
5860  002f d7540c        	ld	(21516,x),a
5861                     ; 1291 		LCD_BIT_SET(bP14);	
5863  0032 c60000        	ld	a,_iLF_DEF
5864  0035 cd00d6        	call	LC036
5865  0038 ca0000        	or	a,_bLF_DEF
5866  003b d7540c        	ld	(21516,x),a
5867                     ; 1292 		LCD_BIT_SET(bDP2);	
5869  003e c6000a        	ld	a,_iLF_DEF+10
5870  0041 cd00d6        	call	LC036
5871  0044 ca000a        	or	a,_bLF_DEF+10
5873  0047 cc00c9        	jp	LC033
5874  004a               L5071:
5875                     ; 1294 	else if( i == 1 )	/*	(1)예약*/	
5877  004a a101          	cp	a,#1
5878  004c 261c          	jrne	L1171
5879                     ; 1296 		_disp_mode = 0x08;	
5881  004e 35080000      	mov	__disp_mode,#8
5882                     ; 1297 		LCD_BIT_SET(bP10);	
5884  0052 5f            	clrw	x
5885  0053 c6003a        	ld	a,_iLF_DEF+58
5886  0056 97            	ld	xl,a
5887  0057 d6540c        	ld	a,(21516,x)
5888  005a ca003a        	or	a,_bLF_DEF+58
5889  005d d7540c        	ld	(21516,x),a
5890                     ; 1298 		LCD_BIT_SET(bS2d);	
5892  0060 c6001a        	ld	a,_iLF_DEF+26
5893  0063 ad71          	call	LC036
5894  0065 ca001a        	or	a,_bLF_DEF+26
5895                     ; 1300 		LCD_BIT_SET(bP19);	
5896                     ; 1301 		LCD_BIT_SET(bP20);	
5897                     ; 1302 		LCD_BIT_SET(bDP1);	
5899  0068 201e          	jp	LC034
5900  006a               L1171:
5901                     ; 1304 	else if( i == 2 )	/*	(2)반복*/	
5903  006a a102          	cp	a,#2
5904  006c 262f          	jrne	L5171
5905                     ; 1306 		_disp_mode = 0x10;	
5907  006e 35100000      	mov	__disp_mode,#16
5908                     ; 1307 		LCD_BIT_SET(bP9);	
5910  0072 5f            	clrw	x
5911  0073 c60031        	ld	a,_iLF_DEF+49
5912  0076 97            	ld	xl,a
5913  0077 d6540c        	ld	a,(21516,x)
5914  007a ca0031        	or	a,_bLF_DEF+49
5915  007d d7540c        	ld	(21516,x),a
5916                     ; 1308 		LCD_BIT_SET(bS1);	
5918  0080 c6002a        	ld	a,_iLF_DEF+42
5919  0083 ad51          	call	LC036
5920  0085 ca002a        	or	a,_bLF_DEF+42
5921                     ; 1310 		LCD_BIT_SET(bP19);	
5923                     ; 1311 		LCD_BIT_SET(bP20);	
5925                     ; 1312 		LCD_BIT_SET(bDP1);	
5927  0088               LC034:
5928  0088 d7540c        	ld	(21516,x),a
5932  008b c60029        	ld	a,_iLF_DEF+41
5933  008e ad46          	call	LC036
5934  0090 ad4a          	call	LC037
5935  0092 ad42          	call	LC036
5936  0094 ad50          	call	LC038
5937  0096 ad3e          	call	LC036
5938  0098 ca0006        	or	a,_bLF_DEF+6
5940  009b 202c          	jp	LC033
5941  009d               L5171:
5942                     ; 1314 	else if( i == 8 )		/*	(1)외출*/	
5944  009d a108          	cp	a,#8
5945  009f 2611          	jrne	L1271
5946                     ; 1316 		_disp_mode = 0x02;	
5948                     ; 1317 		LCD_BIT_SET(bP13);	
5950  00a1               LC035:
5952  00a1 35020000      	mov	__disp_mode,#2
5954  00a5 5f            	clrw	x
5955  00a6 c60010        	ld	a,_iLF_DEF+16
5956  00a9 97            	ld	xl,a
5957  00aa d6540c        	ld	a,(21516,x)
5958  00ad ca0010        	or	a,_bLF_DEF+16
5959                     ; 1318 		LCD_BIT_SET(bP19);	
5960                     ; 1319 		LCD_BIT_SET(bP20);	
5961                     ; 1320 		LCD_BIT_SET(bDP1);	
5963  00b0 20d6          	jp	LC034
5964  00b2               L1271:
5965                     ; 1322 	else if( i == 17 )		/*	(1)외출 LONG */	
5967  00b2 a111          	cp	a,#17
5968                     ; 1324 		_disp_mode = 0x02;	
5969                     ; 1325 		LCD_BIT_SET(bP13);	
5970                     ; 1326 		LCD_BIT_SET(bP19);	
5971                     ; 1327 		LCD_BIT_SET(bP20);	
5972                     ; 1328 		LCD_BIT_SET(bDP1);	
5974  00b4 27eb          	jreq	LC035
5975                     ; 1330 	else if( i == 5 )	{	_disp_mode = 0x04;	LCD_BIT_SET(bP11);	/*	(2)정지*/	}
5977  00b6 a105          	cp	a,#5
5978  00b8 2612          	jrne	L7071
5981  00ba 35040000      	mov	__disp_mode,#4
5984  00be 5f            	clrw	x
5985  00bf c60030        	ld	a,_iLF_DEF+48
5986  00c2 97            	ld	xl,a
5987  00c3 d6540c        	ld	a,(21516,x)
5988  00c6 ca0030        	or	a,_bLF_DEF+48
5989  00c9               LC033:
5990  00c9 d7540c        	ld	(21516,x),a
5991  00cc               L7071:
5992                     ; 1332 	_disp_mode2 = _disp_mode;
5994  00cc 5500000000    	mov	__disp_mode2,__disp_mode
5995                     ; 1333 	timerClear();
5997  00d1 cd0000        	call	_timerClear
5999                     ; 1334 }
6002  00d4 84            	pop	a
6003  00d5 81            	ret	
6004  00d6               LC036:
6005  00d6 5f            	clrw	x
6006  00d7 97            	ld	xl,a
6007  00d8 d6540c        	ld	a,(21516,x)
6008  00db 81            	ret	
6009  00dc               LC037:
6010  00dc ca0029        	or	a,_bLF_DEF+41
6011  00df d7540c        	ld	(21516,x),a
6015  00e2 c60039        	ld	a,_iLF_DEF+57
6016  00e5 81            	ret	
6017  00e6               LC038:
6018  00e6 ca0039        	or	a,_bLF_DEF+57
6019  00e9 d7540c        	ld	(21516,x),a
6023  00ec c60006        	ld	a,_iLF_DEF+6
6024  00ef 81            	ret	
6071                     ; 1339 void	disp_status_loop_init(void)
6071                     ; 1340 {
6072                     .text:	section	.text,new
6073  0000               _disp_status_loop_init:
6075  0000 88            	push	a
6076       00000001      OFST:	set	1
6079                     ; 1343 	i = 0;
6081                     ; 1344 	if (_disp_mode == 0xff) {
6083                     ; 1345 		i = 1;
6085                     ; 1349 	lcd_clear(0);
6087  0001 4f            	clr	a
6088  0002 cd0000        	call	_lcd_clear
6090                     ; 1350 	lcd_blink_clear();
6092  0005 cd0000        	call	_lcd_blink_clear
6094                     ; 1351 	_dsPrev = 0xff;
6096  0008 35ff0013      	mov	__dsPrev,#255
6097                     ; 1352 	if( uiInfo._temp[0] == 0x80 )
6099  000c c60060        	ld	a,_uiInfo+96
6100  000f a180          	cp	a,#128
6101  0011 2605          	jrne	L1571
6102                     ; 1353 		uiInfo.tSetup = uiInfo._temp[1];
6104  0013 550061000e    	mov	_uiInfo+14,_uiInfo+97
6105  0018               L1571:
6106                     ; 1354 	uiInfo._temp[0] = 0;
6108  0018 725f0060      	clr	_uiInfo+96
6109                     ; 1364 	if( __sUp == 5 )		//	Off
6111  001c c60001        	ld	a,___sUp
6112  001f a105          	cp	a,#5
6113  0021 2744          	jreq	L5571
6115                     ; 1386 	else if( __sUp == 0 )
6117  0023 c60001        	ld	a,___sUp
6118  0026 2613          	jrne	L7571
6119                     ; 1388 		__ui_disp_temp_c(3);
6121  0028 a603          	ld	a,#3
6122  002a cd0000        	call	___ui_disp_temp_c
6124                     ; 1389 		ui_disp_temp_curr(uiInfo.tCurr);
6126  002d c60002        	ld	a,_uiInfo+2
6127  0030 cd0000        	call	_ui_disp_temp_curr
6129                     ; 1390 		ui_disp_temp_setup(uiInfo.tSetup);
6131  0033 c6000e        	ld	a,_uiInfo+14
6132  0036 cd0000        	call	_ui_disp_temp_setup
6135  0039 202c          	jra	L5571
6136  003b               L7571:
6137                     ; 1392 	else if( __sUp == 1 )	//	Y
6139  003b a101          	cp	a,#1
6140  003d 2728          	jreq	L5571
6142                     ; 1395 	else if( __sUp == 2 )	//	B
6144  003f a102          	cp	a,#2
6145  0041 2724          	jreq	L5571
6147                     ; 1398 	else if( __sUp == 8 )	//	Out
6149  0043 a108          	cp	a,#8
6150  0045 261a          	jrne	L3771
6151                     ; 1400 		__ui_disp_temp_c(1);
6153  0047 ad26          	call	LC039
6154                     ; 1406 		UPDATE_BIT(BIT_TSETUP);
6156  0049 72140006      	bset	__updateBit,#2
6159  004d 5500000005    	mov	__updateTimer,___timer1s
6162  0052 35050007      	mov	__updateCount,#5
6163                     ; 1407 		uiInfo._temp[3] = uiInfo.tSetup;
6166  0056 55000e0063    	mov	_uiInfo+99,_uiInfo+14
6167                     ; 1408 		uiInfo.tSetup = 30;
6169  005b 351e000e      	mov	_uiInfo+14,#30
6171  005f 2006          	jra	L5571
6172  0061               L3771:
6173                     ; 1416 	}else if( __sUp == 17 )	//	Out long
6175  0061 a111          	cp	a,#17
6176  0063 2602          	jrne	L5571
6177                     ; 1418 		__ui_disp_temp_c(1);
6179  0065 ad08          	call	LC039
6180                     ; 1420 		uiInfo._temp[1] = uiInfo.tSetup;
6181  0067               L5571:
6182                     ; 1426 	disp_status_loop_message(__sUp);
6184  0067 c60001        	ld	a,___sUp
6185  006a cd0000        	call	_disp_status_loop_message
6187                     ; 1427 }
6190  006d 84            	pop	a
6191  006e 81            	ret	
6192  006f               LC039:
6193  006f a601          	ld	a,#1
6194  0071 cd0000        	call	___ui_disp_temp_c
6196                     ; 1401 		uiInfo._temp[0] = 0x80;
6198  0074 35800060      	mov	_uiInfo+96,#128
6199                     ; 1402 		uiInfo._temp[1] = uiInfo.tSetup;
6201  0078 55000e0061    	mov	_uiInfo+97,_uiInfo+14
6202  007d 81            	ret	
6229                     ; 1429 void	disp_status_curr_only(void)
6229                     ; 1430 {
6230                     .text:	section	.text,new
6231  0000               _disp_status_curr_only:
6235                     ; 1431 	ui_disp_clear_tSetup(0);
6237  0000 4f            	clr	a
6238  0001 cd0000        	call	_ui_disp_clear_tSetup
6240                     ; 1435 	ui_disp_temp_curr(uiInfo.tCurr);
6242  0004 c60002        	ld	a,_uiInfo+2
6244                     ; 1436 }
6247  0007 cc0000        	jp	_ui_disp_temp_curr
6289                     ; 1438 void	disp_status_error(uint8_t key, uint8_t next)
6289                     ; 1439 {
6290                     .text:	section	.text,new
6291  0000               _disp_status_error:
6293  0000 89            	pushw	x
6294       00000000      OFST:	set	0
6297                     ; 1441 	if( error_display_status == 1 )
6299  0001 c6000d        	ld	a,_error_display_status
6300  0004 4a            	dec	a
6301  0005 260f          	jrne	L3302
6302                     ; 1443 		lcd_clear(0);
6304  0007 cd0000        	call	_lcd_clear
6306                     ; 1444 		lcd_disp_err(ui_error);
6308  000a c60000        	ld	a,_ui_error
6309  000d cd0000        	call	_lcd_disp_err
6311                     ; 1445 		error_display_status = 2;
6313  0010 3502000d      	mov	_error_display_status,#2
6315  0014 2005          	jra	L5302
6316  0016               L3302:
6317                     ; 1449 		if( uiInfo.enc != 0 )
6319  0016 c60000        	ld	a,_uiInfo
6320  0019 2606          	jrne	L3102
6321                     ; 1451 			goto Exit;
6323  001b               L5302:
6324                     ; 1455 	if( key == 8 )        // 2015.10.30 에러복구 버튼 변경
6326  001b 7b01          	ld	a,(OFST+1,sp)
6327  001d a108          	cp	a,#8
6328  001f 260a          	jrne	L1402
6329  0021               L3102:
6330                     ; 1460 Exit:		
6330                     ; 1461 		if( uiInfo.mode == 1 )
6332  0021 c60008        	ld	a,_uiInfo+8
6333  0024 4a            	dec	a
6334  0025 2604          	jrne	L1402
6335                     ; 1464 			func_rc_recover(1);
6337  0027 4c            	inc	a
6338  0028 cd0000        	call	_func_rc_recover
6340  002b               L1402:
6341                     ; 1471 	if( error == 0 && error_type == 0 )
6343  002b c60000        	ld	a,_error
6344  002e 260e          	jrne	L5402
6346  0030 c60000        	ld	a,_error_type
6347  0033 2609          	jrne	L5402
6348  0035 c60000        	ld	a,_ui_error
6349  0038 200f          	jra	L5102
6350  003a               L7402:
6351                     ; 1481 		error_display_mode = 0;
6353  003a 725f000c      	clr	_error_display_mode
6354  003e               L5402:
6355                     ; 1484 	if( ui_error == 0 && ui_error_type == 0 )
6357  003e c60000        	ld	a,_ui_error
6358  0041 2611          	jrne	L1502
6360  0043 725d0000      	tnz	_ui_error_type
6361  0047 260b          	jrne	L1502
6362                     ; 1486 		goto RESET_ENTRY;
6363  0049               L5102:
6364                     ; 1473 RESET_ENTRY:			
6364                     ; 1474 		/*
6364                     ; 1475 			reset mode
6364                     ; 1476 		 */
6364                     ; 1477 		if (ui_error == 30 && ui_error_type == ERROR_TYPE_CNT) {
6366  0049 a11e          	cp	a,#30
6367  004b 26ed          	jrne	L7402
6369  004d c60000        	ld	a,_ui_error_type
6370  0050 a102          	cp	a,#2
6371  0052 26e6          	jrne	L7402
6372                     ; 1478 			return;
6374  0054               L1502:
6375                     ; 1488 }
6378  0054 85            	popw	x
6379  0055 81            	ret	
6440                     ; 1492 void	disp_status_command(uint8_t key)
6440                     ; 1493 {
6441                     .text:	section	.text,new
6442  0000               _disp_status_command:
6444  0000 88            	push	a
6445  0001 88            	push	a
6446       00000001      OFST:	set	1
6449                     ; 1495 	if( _dsCount == 0 )
6451  0002 c60012        	ld	a,__dsCount
6452  0005 263a          	jrne	L3502
6453                     ; 1497 		disp_next();
6455  0007 cd0000        	call	_disp_next
6457                     ; 1499 		LCD_BIT_SET(b1A);
6459  000a c60037        	ld	a,_iLF_DEF+55
6460  000d cd0160        	call	LC045
6461  0010 ca0037        	or	a,_bLF_DEF+55
6462  0013 d7540c        	ld	(21516,x),a
6463                     ; 1500 		LCD_BIT_SET(b1F);
6465  0016 c60038        	ld	a,_iLF_DEF+56
6466  0019 cd0160        	call	LC045
6467  001c ca0038        	or	a,_bLF_DEF+56
6468  001f d7540c        	ld	(21516,x),a
6469                     ; 1501 		LCD_BIT_SET(b1E);
6471  0022 c60018        	ld	a,_iLF_DEF+24
6472  0025 cd0160        	call	LC045
6473  0028 ca0018        	or	a,_bLF_DEF+24
6474  002b d7540c        	ld	(21516,x),a
6475                     ; 1502 		LCD_BIT_SET(b1D);
6477  002e c60007        	ld	a,_iLF_DEF+7
6478  0031 cd0160        	call	LC045
6479  0034 ca0007        	or	a,_bLF_DEF+7
6480  0037 d7540c        	ld	(21516,x),a
6481                     ; 1503 		uiInfo._t = 0;
6483  003a 725f005f      	clr	_uiInfo+95
6485  003e cc00d2        	jra	L7112
6486  0041               L3502:
6487                     ; 1507 EncEntry:		
6487                     ; 1508 		i = uiInfo._t;
6489  0041 c6005f        	ld	a,_uiInfo+95
6490  0044 6b01          	ld	(OFST+0,sp),a
6491                     ; 1509 		if( uiInfo.enc != 0 )
6493  0046 c60000        	ld	a,_uiInfo
6494  0049 271d          	jreq	L1212
6495                     ; 1511 			if( (uiInfo.enc & 0x40) == 0 )
6497  004b a540          	bcp	a,#64
6498  004d 2609          	jrne	L3212
6499                     ; 1512 				i = (i+_LC-1)%_LC;
6501  004f 7b01          	ld	a,(OFST+0,sp)
6502  0051 5f            	clrw	x
6503  0052 97            	ld	xl,a
6504  0053 1c0009        	addw	x,#9
6507  0056 2005          	jra	L5212
6508  0058               L3212:
6509                     ; 1514 				i = (i+1)%_LC;
6511  0058 7b01          	ld	a,(OFST+0,sp)
6512  005a 5f            	clrw	x
6513  005b 97            	ld	xl,a
6514  005c 5c            	incw	x
6516  005d               L5212:
6517  005d a60a          	ld	a,#10
6518  005f cd0000        	call	c_smodx
6519  0062 01            	rrwa	x,a
6520  0063 6b01          	ld	(OFST+0,sp),a
6521                     ; 1515 			uiInfo._t = i;
6523  0065 c7005f        	ld	_uiInfo+95,a
6524  0068               L1212:
6525                     ; 1517 		if( _dsPrev != i )
6527  0068 c60013        	ld	a,__dsPrev
6528  006b 1101          	cp	a,(OFST+0,sp)
6529  006d 2763          	jreq	L7112
6530                     ; 1519 			_dsPrev = i;
6532  006f 7b01          	ld	a,(OFST+0,sp)
6533  0071 c70013        	ld	__dsPrev,a
6534                     ; 1520 			clear_npos2();
6536  0074 cd0000        	call	_clear_npos2
6538                     ; 1521 			if( i==0 )		lcd_disp_setup_cntl_tab();
6540  0077 7b01          	ld	a,(OFST+0,sp)
6541  0079 2605          	jrne	L1312
6544  007b cd0000        	call	_lcd_disp_setup_cntl_tab
6547  007e 2052          	jra	L7112
6548  0080               L1312:
6549                     ; 1522 			else if( i==1 )	lcd_disp_setup_cntl_2motor();
6551  0080 a101          	cp	a,#1
6552  0082 2605          	jrne	L5312
6555  0084 cd0000        	call	_lcd_disp_setup_cntl_2motor
6558  0087 2049          	jra	L7112
6559  0089               L5312:
6560                     ; 1523 			else if( i==2 )	lcd_disp_setup_cntl_on();
6562  0089 a102          	cp	a,#2
6563  008b 2605          	jrne	L1412
6566  008d cd0000        	call	_lcd_disp_setup_cntl_on
6569  0090 2040          	jra	L7112
6570  0092               L1412:
6571                     ; 1524 			else if( i==3 )	lcd_disp_setup_cntl_po();
6573  0092 a103          	cp	a,#3
6574  0094 2605          	jrne	L5412
6577  0096 cd0000        	call	_lcd_disp_setup_cntl_po
6580  0099 2037          	jra	L7112
6581  009b               L5412:
6582                     ; 1525 			else if( i==4 )	lcd_disp_mir1();
6584  009b a104          	cp	a,#4
6585  009d 2605          	jrne	L1512
6588  009f cd0000        	call	_lcd_disp_mir1
6591  00a2 202e          	jra	L7112
6592  00a4               L1512:
6593                     ; 1526 			else if( i==5 )	lcd_disp_mir2();
6595  00a4 a105          	cp	a,#5
6596  00a6 2605          	jrne	L5512
6599  00a8 cd0000        	call	_lcd_disp_mir2
6602  00ab 2025          	jra	L7112
6603  00ad               L5512:
6604                     ; 1527 			else if( i==6 )	lcd_disp_freset();
6606  00ad a106          	cp	a,#6
6607  00af 2605          	jrne	L1612
6610  00b1 cd0000        	call	_lcd_disp_freset
6613  00b4 201c          	jra	L7112
6614  00b6               L1612:
6615                     ; 1528 			else if( i==7 )	lcd_disp_cnt_host();
6617  00b6 a107          	cp	a,#7
6618  00b8 2605          	jrne	L5612
6621  00ba cd0000        	call	_lcd_disp_cnt_host
6624  00bd 2013          	jra	L7112
6625  00bf               L5612:
6626                     ; 1529 			else if( i==8 )	lcd_disp_cnt_sub();
6628  00bf a108          	cp	a,#8
6629  00c1 2605          	jrne	L1712
6632  00c3 cd0000        	call	_lcd_disp_cnt_sub
6635  00c6 200a          	jra	L7112
6636  00c8               L1712:
6637                     ; 1530 			else if( i==9 )	lcd_disp_n(3, 0);
6639  00c8 a109          	cp	a,#9
6640  00ca 2606          	jrne	L7112
6643  00cc ae0300        	ldw	x,#768
6644  00cf cd0000        	call	_lcd_disp_n
6646  00d2               L7112:
6647                     ; 1533 	if( key == 0x10 )		__UP
6649  00d2 7b02          	ld	a,(OFST+1,sp)
6650  00d4 a110          	cp	a,#16
6651  00d6 2606          	jrne	L7712
6654  00d8 35010000      	mov	_uiInfo,#1
6658  00dc 2008          	jp	LC040
6659  00de               L7712:
6660                     ; 1534 	else if( key == 0x20 )	__DN
6662  00de a120          	cp	a,#32
6663  00e0 2609          	jrne	L3022
6666  00e2 35400000      	mov	_uiInfo,#64
6669  00e6               LC040:
6671  00e6 0f02          	clr	(OFST+1,sp)
6674  00e8 cc0041        	jra	L3502
6675  00eb               L3022:
6676                     ; 1535 	else if( key == 4 )		
6678  00eb a104          	cp	a,#4
6679  00ed 2661          	jrne	L7022
6680                     ; 1537 		switch( uiInfo._t )
6682  00ef c6005f        	ld	a,_uiInfo+95
6684                     ; 1573 			break;
6685  00f2 271b          	jreq	L5502
6686  00f4 4a            	dec	a
6687  00f5 271e          	jreq	L7502
6688  00f7 4a            	dec	a
6689  00f8 2721          	jreq	L1602
6690  00fa 4a            	dec	a
6691  00fb 2723          	jreq	L3602
6692  00fd a002          	sub	a,#2
6693  00ff 2725          	jreq	L5602
6694  0101 4a            	dec	a
6695  0102 2728          	jreq	L7602
6696  0104 4a            	dec	a
6697  0105 272d          	jreq	L1702
6698  0107 4a            	dec	a
6699  0108 272f          	jreq	L3702
6700  010a 4a            	dec	a
6701  010b 273d          	jreq	L5702
6702  010d 204f          	jra	L1022
6703  010f               L5502:
6704                     ; 1539 		case 0:
6704                     ; 1540 			uiInfoSet.opMode = 3;	
6706  010f 35030071      	mov	_uiInfoSet+4,#3
6707                     ; 1541 			disp_status_run(3, 35, 0);
6709                     ; 1542 			break;
6711  0113 202a          	jp	LC043
6712  0115               L7502:
6713                     ; 1543 		case 1:	
6713                     ; 1544 			uiInfoSet.opMode = 2;	
6715  0115 35020071      	mov	_uiInfoSet+4,#2
6716                     ; 1545 			disp_status_run(3, 35, 0);
6718                     ; 1546 			break;
6720  0119 2024          	jp	LC043
6721  011b               L1602:
6722                     ; 1547 		case 2:	
6722                     ; 1548 			uiInfoSet.opMode = 0;	
6724  011b c70071        	ld	_uiInfoSet+4,a
6725                     ; 1549 			disp_status_run(3, 35, 0);
6727                     ; 1550 			break;
6729  011e 201f          	jp	LC043
6730  0120               L3602:
6731                     ; 1551 		case 3:	
6731                     ; 1552 			uiInfoSet.opMode = 1;	
6733  0120 35010071      	mov	_uiInfoSet+4,#1
6734                     ; 1553 			disp_status_run(3, 35, 0);
6736                     ; 1554 			break;
6738  0124 2019          	jp	LC043
6739  0126               L5602:
6740                     ; 1556 			STATUS_NEXT(95);
6742  0126 355f0011      	mov	__ds,#95
6745                     ; 1557 			break;
6748  012a 202b          	jp	LC041
6749  012c               L7602:
6750                     ; 1558 		case 6:	
6750                     ; 1559 			func_rc_command(COMMAND_MODE_FACTORY, 100);	
6752  012c ae0864        	ldw	x,#2148
6753  012f cd0000        	call	_func_rc_command
6755                     ; 1560 			break;
6757  0132 202a          	jra	L1022
6758  0134               L1702:
6759                     ; 1561 		case 7:	
6759                     ; 1562 			//	MAIN
6759                     ; 1563 			func_rc_command(COMMAND_MODE_FACTORY, 110);	
6761  0134 ae086e        	ldw	x,#2158
6763                     ; 1564 			disp_status_run(3, 35, 0);
6765                     ; 1565 			break;
6767  0137 2003          	jp	LC044
6768  0139               L3702:
6769                     ; 1566 		case 8:	
6769                     ; 1567 			//	SUB
6769                     ; 1568 			func_rc_command(COMMAND_MODE_FACTORY, 120);	
6771  0139 ae0878        	ldw	x,#2168
6772  013c               LC044:
6773  013c cd0000        	call	_func_rc_command
6775                     ; 1569 			disp_status_run(3, 35, 0);
6778  013f               LC043:
6784  013f 4b00          	push	#0
6785  0141 ae0323        	ldw	x,#803
6786  0144 cd0000        	call	_disp_status_run
6787  0147 84            	pop	a
6788                     ; 1570 			break;
6790  0148 2014          	jra	L1022
6791  014a               L5702:
6792                     ; 1572 			STATUS_NEXT(100);
6794  014a 35640011      	mov	__ds,#100
6798                     ; 1573 			break;
6801  014e 2007          	jp	LC041
6803  0150               L7022:
6804                     ; 1576 	else if( key == 1 )
6806  0150 4a            	dec	a
6807  0151 260b          	jrne	L1022
6808                     ; 1578 		STATUS_NEXT(99);
6810  0153 35630011      	mov	__ds,#99
6815  0157               LC041:
6817  0157 c70012        	ld	__dsCount,a
6820  015a 35ff0013      	mov	__dsPrev,#255
6822  015e               L1022:
6823                     ; 1580 }
6826  015e 85            	popw	x
6827  015f 81            	ret	
6828  0160               LC045:
6829  0160 5f            	clrw	x
6830  0161 97            	ld	xl,a
6831  0162 d6540c        	ld	a,(21516,x)
6832  0165 81            	ret	
6835                     	switch	.data
6836  001d               __d485_id:
6837  001d 00            	dc.b	0
6874                     ; 1599 void	disp_write_file(uint8_t next)
6874                     ; 1600 {
6875                     .text:	section	.text,new
6876  0000               _disp_write_file:
6878  0000 88            	push	a
6879       00000000      OFST:	set	0
6882                     ; 1603 	file_update();
6884  0001 cd0000        	call	_file_update
6886                     ; 1604 	__func_rc_timerout = 5;
6888  0004 35050017      	mov	___func_rc_timerout,#5
6889                     ; 1605 	__func_rc_timerout1 = 0;
6891  0008 725f0018      	clr	___func_rc_timerout1
6892                     ; 1606 	__func_rc_timerout2 = __timer1s;
6894  000c 5500000019    	mov	___func_rc_timerout2,___timer1s
6895                     ; 1607 	func_rc_setting();
6897  0011 cd0000        	call	_func_rc_setting
6899                     ; 1608 	_ds = next;
6901  0014 7b01          	ld	a,(OFST+1,sp)
6902  0016 c70011        	ld	__ds,a
6903                     ; 1609 }
6906  0019 84            	pop	a
6907  001a 81            	ret	
6943                     ; 1611 void	disp_set_state(uint8_t next)
6943                     ; 1612 {
6944                     .text:	section	.text,new
6945  0000               _disp_set_state:
6947  0000 88            	push	a
6948       00000000      OFST:	set	0
6951                     ; 1613 	lcd_blink_clear();
6953  0001 cd0000        	call	_lcd_blink_clear
6955                     ; 1614 	STATUS_NEXT(next);
6957  0004 7b01          	ld	a,(OFST+1,sp)
6958  0006 c70011        	ld	__ds,a
6961  0009 725f0012      	clr	__dsCount
6964  000d 35ff0013      	mov	__dsPrev,#255
6965                     ; 1615 }
6969  0011 84            	pop	a
6970  0012 81            	ret	
7003                     ; 1617 void _disp_485(uint8_t i) {
7004                     .text:	section	.text,new
7005  0000               __disp_485:
7007  0000 88            	push	a
7008       00000000      OFST:	set	0
7011                     ; 1618 	lcd_disp_n(1, i >> 4);
7013  0001 4e            	swap	a
7014  0002 a40f          	and	a,#15
7015  0004 97            	ld	xl,a
7016  0005 a601          	ld	a,#1
7017  0007 95            	ld	xh,a
7018  0008 cd0000        	call	_lcd_disp_n
7020                     ; 1619 	lcd_disp_n(2, (i & 0x0F)/10);
7022  000b 7b01          	ld	a,(OFST+1,sp)
7023  000d a40f          	and	a,#15
7024  000f 5f            	clrw	x
7025  0010 97            	ld	xl,a
7026  0011 a60a          	ld	a,#10
7027  0013 62            	div	x,a
7028  0014 a602          	ld	a,#2
7029  0016 95            	ld	xh,a
7030  0017 cd0000        	call	_lcd_disp_n
7032                     ; 1620 	lcd_disp_n(3, (i & 0x0F)%10);
7034  001a 7b01          	ld	a,(OFST+1,sp)
7035  001c a40f          	and	a,#15
7036  001e 5f            	clrw	x
7037  001f 97            	ld	xl,a
7038  0020 a60a          	ld	a,#10
7039  0022 62            	div	x,a
7040  0023 97            	ld	xl,a
7041  0024 a603          	ld	a,#3
7042  0026 95            	ld	xh,a
7043  0027 cd0000        	call	_lcd_disp_n
7045                     ; 1621 }
7048  002a 84            	pop	a
7049  002b 81            	ret	
7091                     ; 1623 void	disp_485(uint8_t next)
7091                     ; 1624 {
7092                     .text:	section	.text,new
7093  0000               _disp_485:
7097                     ; 1625 	if( _dsCount == 0 )
7099  0000 c60012        	ld	a,__dsCount
7100  0003 2609          	jrne	L3032
7101                     ; 1627 		_dsCount = 1;
7103  0005 35010012      	mov	__dsCount,#1
7104                     ; 1628 		lcd_clear(0);
7106  0009 cd0000        	call	_lcd_clear
7108                     ; 1629 		goto DispEntry;
7110  000c 2018          	jra	L5622
7111  000e               L3032:
7112                     ; 1633 		if( (_t20ms%100) != 0 )
7114  000e c60000        	ld	a,__t20ms
7115  0011 5f            	clrw	x
7116  0012 97            	ld	xl,a
7117  0013 a664          	ld	a,#100
7118  0015 cd0000        	call	c_smodx
7120  0018 5d            	tnzw	x
7121  0019 2705          	jreq	L7032
7122                     ; 1635 			_dsPrev = 0;
7124  001b 725f0013      	clr	__dsPrev
7125                     ; 1636 			return;
7128  001f 81            	ret	
7129  0020               L7032:
7130                     ; 1639 		if( _dsPrev != 0 )
7132  0020 c60013        	ld	a,__dsPrev
7133  0023 2701          	jreq	L5622
7134                     ; 1640 			return;
7137  0025 81            	ret	
7138  0026               L5622:
7139                     ; 1641 DispEntry:			
7139                     ; 1642 		_dsPrev = 1;
7141  0026 35010013      	mov	__dsPrev,#1
7142                     ; 1643 		LCD_BIT_SET(b1F);
7144  002a 5f            	clrw	x
7145  002b c60038        	ld	a,_iLF_DEF+56
7146  002e 97            	ld	xl,a
7147  002f d6540c        	ld	a,(21516,x)
7148  0032 ca0038        	or	a,_bLF_DEF+56
7149  0035 d7540c        	ld	(21516,x),a
7150                     ; 1644 		LCD_BIT_SET(b1E);
7152  0038 c60018        	ld	a,_iLF_DEF+24
7153  003b ad53          	call	LC046
7154  003d ca0018        	or	a,_bLF_DEF+24
7155  0040 d7540c        	ld	(21516,x),a
7156                     ; 1645 		LCD_BIT_SET(b1G);
7158  0043 c60028        	ld	a,_iLF_DEF+40
7159  0046 ad48          	call	LC046
7160  0048 ca0028        	or	a,_bLF_DEF+40
7161  004b d7540c        	ld	(21516,x),a
7162                     ; 1646 		LCD_BIT_SET(b1C);
7164  004e c60017        	ld	a,_iLF_DEF+23
7165  0051 ad3d          	call	LC046
7166  0053 ca0017        	or	a,_bLF_DEF+23
7167  0056 d7540c        	ld	(21516,x),a
7168                     ; 1647 		LCD_BIT_SET(b1D);
7170  0059 c60007        	ld	a,_iLF_DEF+7
7171  005c ad32          	call	LC046
7172  005e ca0007        	or	a,_bLF_DEF+7
7173  0061 d7540c        	ld	(21516,x),a
7174                     ; 1649 		if( _d485_id == 0 )
7176  0064 c6001d        	ld	a,__d485_id
7177  0067 2614          	jrne	L3132
7178                     ; 1651 			LCD_BIT_CLEAR(b1D);
7180  0069 c60007        	ld	a,_iLF_DEF+7
7181  006c 5f            	clrw	x
7182  006d 97            	ld	xl,a
7183  006e c60007        	ld	a,_bLF_DEF+7
7184  0071 43            	cpl	a
7185  0072 d4540c        	and	a,(21516,x)
7186  0075 d7540c        	ld	(21516,x),a
7187                     ; 1652 			_disp_485(debug_hn);
7189  0078 c60000        	ld	a,_debug_hn
7192  007b 2003          	jra	L5132
7193  007d               L3132:
7194                     ; 1656 			_disp_485(debug_br);
7196  007d c60000        	ld	a,_debug_br
7198  0080               L5132:
7199  0080 cd0000        	call	__disp_485
7200                     ; 1658 		_d485_id = _d485_id==0 ? 1 : 0;
7202  0083 c6001d        	ld	a,__d485_id
7203  0086 2603          	jrne	L0521
7204  0088 4c            	inc	a
7205  0089 2001          	jra	L2521
7206  008b               L0521:
7207  008b 4f            	clr	a
7208  008c               L2521:
7209  008c c7001d        	ld	__d485_id,a
7210                     ; 1660 }
7213  008f 81            	ret	
7214  0090               LC046:
7215  0090 5f            	clrw	x
7216  0091 97            	ld	xl,a
7217  0092 d6540c        	ld	a,(21516,x)
7218  0095 81            	ret	
7221                     	switch	.data
7222  001e               _error_display_refresh:
7223  001e 00            	dc.b	0
7305                     ; 1664 void	disp_statusCb(uint8_t key)
7305                     ; 1665 {
7306                     .text:	section	.text,new
7307  0000               _disp_statusCb:
7309  0000 88            	push	a
7310  0001 89            	pushw	x
7311       00000002      OFST:	set	2
7314                     ; 1668 	if( _ds == 220 || _ds == 221)
7316  0002 c60011        	ld	a,__ds
7317  0005 a1dc          	cp	a,#220
7318  0007 2739          	jreq	L7132
7320  0009 a1dd          	cp	a,#221
7321  000b 2735          	jreq	L7132
7322                     ; 1672 	if( error != 0 && error_type != 0 )
7324  000d c60000        	ld	a,_error
7325  0010 270e          	jreq	L5432
7327  0012 725d0000      	tnz	_error_type
7328  0016 2708          	jreq	L5432
7329                     ; 1674 			error_display(error_type, error);
7331  0018 97            	ld	xl,a
7332  0019 c60000        	ld	a,_error_type
7333  001c 95            	ld	xh,a
7334  001d cd0000        	call	_error_display
7336  0020               L5432:
7337                     ; 1679 	if( error_display_mode == 1 )
7339  0020 c6000c        	ld	a,_error_display_mode
7340  0023 4a            	dec	a
7341  0024 2610          	jrne	L7432
7342                     ; 1681 		disp_status_error(key, 99);
7344  0026 ae0063        	ldw	x,#99
7345  0029 7b03          	ld	a,(OFST+1,sp)
7346  002b 95            	ld	xh,a
7347  002c cd0000        	call	_disp_status_error
7349                     ; 1682 		error_display_refresh = 1;
7351  002f 3501001e      	mov	_error_display_refresh,#1
7352                     ; 1685 			return;
7354  0033 cc0221        	jra	L5532
7355  0036               L7432:
7356                     ; 1688 	if( error_display_refresh == 1 )
7358  0036 c6001e        	ld	a,_error_display_refresh
7359  0039 4a            	dec	a
7360  003a 2606          	jrne	L7132
7361                     ; 1690 		error_display_refresh = 0;
7363  003c c7001e        	ld	_error_display_refresh,a
7364                     ; 1691 		disp_status_loop_init();
7366  003f cd0000        	call	_disp_status_loop_init
7368  0042               L7132:
7369                     ; 1694 ERROR_JUMP:
7369                     ; 1695 	if( _ds == 1 )			disp_status_id(key, 37);// disp_status_id(key, 36);
7371  0042 c60011        	ld	a,__ds
7372  0045 a101          	cp	a,#1
7373  0047 260c          	jrne	L3532
7376  0049 ae0025        	ldw	x,#37
7377  004c 7b03          	ld	a,(OFST+1,sp)
7378  004e 95            	ld	xh,a
7379  004f cd0000        	call	_disp_status_id
7382  0052 cc0221        	jra	L5532
7383  0055               L3532:
7384                     ; 1696 	else if( _ds == 36 )	disp_status_toffset(key, 37);
7386  0055 a124          	cp	a,#36
7387  0057 260c          	jrne	L7532
7390  0059 ae0025        	ldw	x,#37
7391  005c 7b03          	ld	a,(OFST+1,sp)
7392  005e 95            	ld	xh,a
7393  005f cd0000        	call	_disp_status_toffset
7396  0062 cc0221        	jra	L5532
7397  0065               L7532:
7398                     ; 1697 	else if( _ds == 37 )	
7400  0065 a125          	cp	a,#37
7401  0067 2617          	jrne	L3632
7402                     ; 1699 		t = disp_status_run(key, 38, 1);
7404  0069 4b01          	push	#1
7405  006b ae0026        	ldw	x,#38
7406  006e 7b04          	ld	a,(OFST+2,sp)
7407  0070 95            	ld	xh,a
7408  0071 cd0000        	call	_disp_status_run
7410  0074 5b01          	addw	sp,#1
7411                     ; 1700 		if( t == 1 )
7413  0076 4a            	dec	a
7414  0077 26e9          	jrne	L5532
7415                     ; 1701 			_ds = 100;
7417  0079 35640011      	mov	__ds,#100
7418  007d cc0221        	jra	L5532
7419  0080               L3632:
7420                     ; 1703 	else if( _ds == 38 )	disp_status_exit(key, 100);
7422  0080 a126          	cp	a,#38
7423  0082 260c          	jrne	L1732
7426  0084 ae0064        	ldw	x,#100
7427  0087 7b03          	ld	a,(OFST+1,sp)
7428  0089 95            	ld	xh,a
7429  008a cd0000        	call	_disp_status_exit
7432  008d cc0221        	jra	L5532
7433  0090               L1732:
7434                     ; 1705 	else if( _ds == 2 )		disp_status_id(key, 3);
7436  0090 a102          	cp	a,#2
7437  0092 260c          	jrne	L5732
7440  0094 ae0003        	ldw	x,#3
7441  0097 7b03          	ld	a,(OFST+1,sp)
7442  0099 95            	ld	xh,a
7443  009a cd0000        	call	_disp_status_id
7446  009d cc0221        	jra	L5532
7447  00a0               L5732:
7448                     ; 1706 	else if( _ds == 3 )	
7450  00a0 a103          	cp	a,#3
7451  00a2 2617          	jrne	L1042
7452                     ; 1708 		t = disp_status_run_id(key, 38, 2);
7454  00a4 4b02          	push	#2
7455  00a6 ae0026        	ldw	x,#38
7456  00a9 7b04          	ld	a,(OFST+2,sp)
7457  00ab 95            	ld	xh,a
7458  00ac cd0000        	call	_disp_status_run_id
7460  00af 5b01          	addw	sp,#1
7461                     ; 1709 		if( t == 1 )
7463  00b1 4a            	dec	a
7464  00b2 26e9          	jrne	L5532
7465                     ; 1710 			_ds = 100;
7467  00b4 35640011      	mov	__ds,#100
7468  00b8 cc0221        	jra	L5532
7469  00bb               L1042:
7470                     ; 1713 	else if( _ds == 9 )		disp_status_run_op(key, 61);
7472  00bb a109          	cp	a,#9
7473  00bd 260c          	jrne	L7042
7476  00bf ae003d        	ldw	x,#61
7477  00c2 7b03          	ld	a,(OFST+1,sp)
7478  00c4 95            	ld	xh,a
7479  00c5 cd0000        	call	_disp_status_run_op
7482  00c8 cc0221        	jra	L5532
7483  00cb               L7042:
7484                     ; 1714 	else if( _ds == 61 )	disp_status_cntl_op(key, 63);
7486  00cb a13d          	cp	a,#61
7487  00cd 260c          	jrne	L3142
7490  00cf ae003f        	ldw	x,#63
7491  00d2 7b03          	ld	a,(OFST+1,sp)
7492  00d4 95            	ld	xh,a
7493  00d5 cd0000        	call	_disp_status_cntl_op
7496  00d8 cc0221        	jra	L5532
7497  00db               L3142:
7498                     ; 1715 	else if( _ds == 63 )	disp_status_valveCount(key, 64);
7500  00db a13f          	cp	a,#63
7501  00dd 260c          	jrne	L7142
7504  00df ae0040        	ldw	x,#64
7505  00e2 7b03          	ld	a,(OFST+1,sp)
7506  00e4 95            	ld	xh,a
7507  00e5 cd0000        	call	_disp_status_valveCount
7510  00e8 cc0221        	jra	L5532
7511  00eb               L7142:
7512                     ; 1716 	else if( _ds == 64 )	disp_status_houseCapa(key, /*65*/66);	//	if opMode==0, skip
7514  00eb a140          	cp	a,#64
7515  00ed 260c          	jrne	L3242
7518  00ef ae0042        	ldw	x,#66
7519  00f2 7b03          	ld	a,(OFST+1,sp)
7520  00f4 95            	ld	xh,a
7521  00f5 cd0000        	call	_disp_status_houseCapa
7524  00f8 cc0221        	jra	L5532
7525  00fb               L3242:
7526                     ; 1719 	else if( _ds == 66 )	disp_status_lpm(key, /*67*/68);		//	세대밸브 if cntlMode==1, skip
7528  00fb a142          	cp	a,#66
7529  00fd 260c          	jrne	L7242
7532  00ff ae0044        	ldw	x,#68
7533  0102 7b03          	ld	a,(OFST+1,sp)
7534  0104 95            	ld	xh,a
7535  0105 cd0000        	call	_disp_status_lpm
7538  0108 cc0221        	jra	L5532
7539  010b               L7242:
7540                     ; 1723 	else if( _ds == 68 )	disp_status_valveinfo(key, 69, 68);
7542  010b a144          	cp	a,#68
7543  010d 260f          	jrne	L3342
7546  010f 4b44          	push	#68
7547  0111 ae0045        	ldw	x,#69
7548  0114 7b04          	ld	a,(OFST+2,sp)
7549  0116 95            	ld	xh,a
7550  0117 cd0000        	call	_disp_status_valveinfo
7552  011a 84            	pop	a
7554  011b cc0221        	jra	L5532
7555  011e               L3342:
7556                     ; 1724 	else if( _ds == 69 )	disp_status_plc(key, 70);
7558  011e a145          	cp	a,#69
7559  0120 260c          	jrne	L7342
7562  0122 ae0046        	ldw	x,#70
7563  0125 7b03          	ld	a,(OFST+1,sp)
7564  0127 95            	ld	xh,a
7565  0128 cd0000        	call	_disp_status_plc
7568  012b cc0221        	jra	L5532
7569  012e               L7342:
7570                     ; 1725 	else if( _ds == 70 )	
7572  012e a146          	cp	a,#70
7573  0130 2617          	jrne	L3442
7574                     ; 1727 		t = disp_status_run(key, 71, 9);
7576  0132 4b09          	push	#9
7577  0134 ae0047        	ldw	x,#71
7578  0137 7b04          	ld	a,(OFST+2,sp)
7579  0139 95            	ld	xh,a
7580  013a cd0000        	call	_disp_status_run
7582  013d 5b01          	addw	sp,#1
7583                     ; 1728 		if( t == 1 )
7585  013f 4a            	dec	a
7586  0140 26e9          	jrne	L5532
7587                     ; 1729 			_ds = 100;
7589  0142 35640011      	mov	__ds,#100
7590  0146 cc0221        	jra	L5532
7591  0149               L3442:
7592                     ; 1731 	else if( _ds == 71 )	disp_status_exit(key, 100);
7594  0149 a147          	cp	a,#71
7595  014b 260c          	jrne	L1542
7598  014d ae0064        	ldw	x,#100
7599  0150 7b03          	ld	a,(OFST+1,sp)
7600  0152 95            	ld	xh,a
7601  0153 cd0000        	call	_disp_status_exit
7604  0156 cc0221        	jra	L5532
7605  0159               L1542:
7606                     ; 1733 	else if( _ds == 10 )	
7608  0159 a10a          	cp	a,#10
7609  015b 2617          	jrne	L5542
7610                     ; 1735 		t = disp_status_run(key, 11, 9);
7612  015d 4b09          	push	#9
7613  015f ae000b        	ldw	x,#11
7614  0162 7b04          	ld	a,(OFST+2,sp)
7615  0164 95            	ld	xh,a
7616  0165 cd0000        	call	_disp_status_run
7618  0168 5b01          	addw	sp,#1
7619                     ; 1736 		if( t == 1 )
7621  016a 4a            	dec	a
7622  016b 26e9          	jrne	L5532
7623                     ; 1737 			_ds = 100;
7625  016d 35640011      	mov	__ds,#100
7626  0171 cc0221        	jra	L5532
7627  0174               L5542:
7628                     ; 1739 	else if( _ds == 11 )	disp_status_exit(key, 100);
7630  0174 a10b          	cp	a,#11
7631  0176 260c          	jrne	L3642
7634  0178 ae0064        	ldw	x,#100
7635  017b 7b03          	ld	a,(OFST+1,sp)
7636  017d 95            	ld	xh,a
7637  017e cd0000        	call	_disp_status_exit
7640  0181 cc0221        	jra	L5532
7641  0184               L3642:
7642                     ; 1741 	else if( _ds == 12 )	disp_status_exit(key, 100);
7644  0184 a10c          	cp	a,#12
7645  0186 260c          	jrne	L7642
7648  0188 ae0064        	ldw	x,#100
7649  018b 7b03          	ld	a,(OFST+1,sp)
7650  018d 95            	ld	xh,a
7651  018e cd0000        	call	_disp_status_exit
7654  0191 cc0221        	jra	L5532
7655  0194               L7642:
7656                     ; 1742 	else if( _ds == 15 )	
7658  0194 a10f          	cp	a,#15
7659  0196 2616          	jrne	L3742
7660                     ; 1744 		t = disp_status_run(key, 11, 20);
7662  0198 4b14          	push	#20
7663  019a ae000b        	ldw	x,#11
7664  019d 7b04          	ld	a,(OFST+2,sp)
7665  019f 95            	ld	xh,a
7666  01a0 cd0000        	call	_disp_status_run
7668  01a3 5b01          	addw	sp,#1
7669                     ; 1745 		if( t == 1 )
7671  01a5 4a            	dec	a
7672  01a6 2679          	jrne	L5532
7673                     ; 1746 			_ds = 100;
7675  01a8 35640011      	mov	__ds,#100
7676  01ac 2073          	jra	L5532
7677  01ae               L3742:
7678                     ; 1748 	else if( _ds == 33 )	disp_status_toffset(key, 34);	//	mainR/C only
7680  01ae a121          	cp	a,#33
7681  01b0 260b          	jrne	L1052
7684  01b2 ae0022        	ldw	x,#34
7685  01b5 7b03          	ld	a,(OFST+1,sp)
7686  01b7 95            	ld	xh,a
7687  01b8 cd0000        	call	_disp_status_toffset
7690  01bb 2064          	jra	L5532
7691  01bd               L1052:
7692                     ; 1749 	else if( _ds == 34 )	
7694  01bd a122          	cp	a,#34
7695  01bf 2616          	jrne	L5052
7696                     ; 1751 		t = disp_status_run(key, 35, 33);
7698  01c1 4b21          	push	#33
7699  01c3 ae0023        	ldw	x,#35
7700  01c6 7b04          	ld	a,(OFST+2,sp)
7701  01c8 95            	ld	xh,a
7702  01c9 cd0000        	call	_disp_status_run
7704  01cc 5b01          	addw	sp,#1
7705                     ; 1752 		if( t == 1 )
7707  01ce 4a            	dec	a
7708  01cf 2650          	jrne	L5532
7709                     ; 1753 			_ds = 100;
7711  01d1 35640011      	mov	__ds,#100
7712  01d5 204a          	jra	L5532
7713  01d7               L5052:
7714                     ; 1755 	else if( _ds == 35 )	disp_status_exit(key, 100);
7716  01d7 a123          	cp	a,#35
7717  01d9 260b          	jrne	L3152
7720  01db ae0064        	ldw	x,#100
7721  01de 7b03          	ld	a,(OFST+1,sp)
7722  01e0 95            	ld	xh,a
7723  01e1 cd0000        	call	_disp_status_exit
7726  01e4 203b          	jra	L5532
7727  01e6               L3152:
7728                     ; 1757 	else if( _ds == 41 )	disp_status_command(key);
7730  01e6 a129          	cp	a,#41
7731  01e8 2607          	jrne	L7152
7734  01ea 7b03          	ld	a,(OFST+1,sp)
7735  01ec cd0000        	call	_disp_status_command
7738  01ef 2030          	jra	L5532
7739  01f1               L7152:
7740                     ; 1759 	else if( _ds == 100 )	
7742  01f1 a164          	cp	a,#100
7743  01f3 2616          	jrne	L3252
7744                     ; 1761 		__s = 0;
7746  01f5 725f0000      	clr	___s
7747                     ; 1762 		_dsCount = 0;
7749  01f9 725f0012      	clr	__dsCount
7750                     ; 1763 		_ds = 99;	
7752  01fd 35630011      	mov	__ds,#99
7753                     ; 1764 		_dsPrev = 0xff;
7755  0201 35ff0013      	mov	__dsPrev,#255
7756                     ; 1765 		_remote = 0;
7758  0205 725f0000      	clr	__remote
7760  0209 2016          	jra	L5532
7761  020b               L3252:
7762                     ; 1767 	else if( _ds == 101 || _ds == 133 )
7764  020b a165          	cp	a,#101
7765  020d 2704          	jreq	L1352
7767  020f a185          	cp	a,#133
7768  0211 2611          	jrne	L7252
7769  0213               L1352:
7770                     ; 1770 		_dsCount = __timer1s;
7772  0213 5500000012    	mov	__dsCount,___timer1s
7773                     ; 1771 		_dsPrev = _ds - 100;
7775  0218 a064          	sub	a,#100
7776  021a c70013        	ld	__dsPrev,a
7777                     ; 1772 		_ds = 200;
7779  021d 35c80011      	mov	__ds,#200
7781  0221               L5532:
7782                     ; 1890 }
7785  0221 5b03          	addw	sp,#3
7786  0223 81            	ret	
7787  0224               L7252:
7788                     ; 1774 	else if (_ds == 150)							// 온도보상
7790  0224 a196          	cp	a,#150
7791  0226 260b          	jrne	L5352
7792                     ; 1776 		disp_status_toffset(key, 151);	//	mainR/C only
7794  0228 ae0097        	ldw	x,#151
7795  022b 7b03          	ld	a,(OFST+1,sp)
7796  022d 95            	ld	xh,a
7797  022e cd0000        	call	_disp_status_toffset
7800  0231 20ee          	jra	L5532
7801  0233               L5352:
7802                     ; 1778 	else if (_ds == 151)							// 백라이트
7804  0233 a197          	cp	a,#151
7805  0235 260b          	jrne	L1452
7806                     ; 1780 		disp_status_backlight2(key, 153);
7808  0237 ae0099        	ldw	x,#153
7809  023a 7b03          	ld	a,(OFST+1,sp)
7810  023c 95            	ld	xh,a
7811  023d cd0000        	call	_disp_status_backlight2
7814  0240 20df          	jra	L5532
7815  0242               L1452:
7816                     ; 1782 	else if (_ds == 152) 
7818  0242 a198          	cp	a,#152
7819  0244 2616          	jrne	L5452
7820                     ; 1784 		t = disp_status_run(key, 153, 150);
7822  0246 4b96          	push	#150
7823  0248 ae0099        	ldw	x,#153
7824  024b 7b04          	ld	a,(OFST+2,sp)
7825  024d 95            	ld	xh,a
7826  024e cd0000        	call	_disp_status_run
7828  0251 5b01          	addw	sp,#1
7829                     ; 1785 		if( t == 1 )
7831  0253 4a            	dec	a
7832  0254 26cb          	jrne	L5532
7833                     ; 1786 			_ds = 100;
7835  0256 35640011      	mov	__ds,#100
7836  025a 20c5          	jra	L5532
7837  025c               L5452:
7838                     ; 1788 	else if (_ds == 153)
7840  025c a199          	cp	a,#153
7841  025e 260a          	jrne	L3552
7842                     ; 1790 		_ds = 100;
7844  0260 35640011      	mov	__ds,#100
7845                     ; 1791 		file_update2(0);
7847  0264 4f            	clr	a
7848  0265 cd0000        	call	_file_update2
7851  0268 20b7          	jra	L5532
7852  026a               L3552:
7853                     ; 1794 	else if (_ds == 160)							// 온도보상
7855  026a a1a0          	cp	a,#160
7856  026c 260b          	jrne	L7552
7857                     ; 1796 		disp_status_toffset(key, 161);	//	mainR/C only
7859  026e ae00a1        	ldw	x,#161
7860  0271 7b03          	ld	a,(OFST+1,sp)
7861  0273 95            	ld	xh,a
7862  0274 cd0000        	call	_disp_status_toffset
7865  0277 20a8          	jra	L5532
7866  0279               L7552:
7867                     ; 1798 	else if (_ds == 161)							// 백라이트
7869  0279 a1a1          	cp	a,#161
7870  027b 260b          	jrne	L3652
7871                     ; 1800 		disp_status_backlight2(key, 162);
7873  027d ae00a2        	ldw	x,#162
7874  0280 7b03          	ld	a,(OFST+1,sp)
7875  0282 95            	ld	xh,a
7876  0283 cd0000        	call	_disp_status_backlight2
7879  0286 2099          	jra	L5532
7880  0288               L3652:
7881                     ; 1802 	else if( _ds == 162 )
7883  0288 a1a2          	cp	a,#162
7884  028a 2606          	jrne	L7652
7885                     ; 1804 		_ds = 100;
7887  028c 35640011      	mov	__ds,#100
7889  0290 208f          	jra	L5532
7890  0292               L7652:
7891                     ; 1806 	else if( _ds == 200 )
7893  0292 a1c8          	cp	a,#200
7894  0294 2618          	jrne	L3752
7895                     ; 1808 		if( _dsCount == __timer1s )
7897  0296 c60012        	ld	a,__dsCount
7898  0299 c10000        	cp	a,___timer1s
7899  029c 2783          	jreq	L5532
7900                     ; 1809 			return;
7902                     ; 1810 		STATUS_NEXT(_dsPrev);
7904  029e 5500130011    	mov	__ds,__dsPrev
7907  02a3 725f0012      	clr	__dsCount
7910  02a7 35ff0013      	mov	__dsPrev,#255
7913  02ab cc0221        	jra	L5532
7914  02ae               L3752:
7915                     ; 1814 	else if( _ds == 81 )	{	disp_write_file(12);	}
7917  02ae a151          	cp	a,#81
7918  02b0 2608          	jrne	L1062
7921  02b2 a60c          	ld	a,#12
7922  02b4 cd0000        	call	_disp_write_file
7925  02b7 cc0221        	jra	L5532
7926  02ba               L1062:
7927                     ; 1815 	else if( _ds == 95 )	{	disp_485(12);	}
7929  02ba a15f          	cp	a,#95
7930  02bc 2608          	jrne	L5062
7933  02be a60c          	ld	a,#12
7934  02c0 cd0000        	call	_disp_485
7937  02c3 cc0221        	jra	L5532
7938  02c6               L5062:
7939                     ; 1816 	else if( _ds == 96 )	{	disp_write_file(12);	}
7941  02c6 a160          	cp	a,#96
7942  02c8 2608          	jrne	L1162
7945  02ca a60c          	ld	a,#12
7946  02cc cd0000        	call	_disp_write_file
7949  02cf cc0221        	jra	L5532
7950  02d2               L1162:
7951                     ; 1843 	else if( _ds == 99 )
7953  02d2 a163          	cp	a,#99
7954  02d4 2659          	jrne	L5162
7955                     ; 1846 		t = getCurrTemp();
7957  02d6 cd0000        	call	_getCurrTemp
7959  02d9 6b02          	ld	(OFST+0,sp),a
7960                     ; 1847 		if( uiInfo.tOffset != 100 )
7962  02db c60011        	ld	a,_uiInfo+17
7963  02de a164          	cp	a,#100
7964  02e0 2711          	jreq	L7162
7965                     ; 1849 			if( uiInfo.tOffset > 100 )
7967  02e2 a165          	cp	a,#101
7968  02e4 2506          	jrult	L1262
7969                     ; 1850 				t = t + (uiInfo.tOffset-100);
7971  02e6 a064          	sub	a,#100
7972  02e8 1b02          	add	a,(OFST+0,sp)
7974  02ea 2005          	jp	LC047
7975  02ec               L1262:
7976                     ; 1852 				t = t - uiInfo.tOffset;
7978  02ec 7b02          	ld	a,(OFST+0,sp)
7979  02ee c00011        	sub	a,_uiInfo+17
7980  02f1               LC047:
7981  02f1 6b02          	ld	(OFST+0,sp),a
7982  02f3               L7162:
7983                     ; 1854 		if( uiInfo.tCurr != t )
7985  02f3 c60002        	ld	a,_uiInfo+2
7986  02f6 1102          	cp	a,(OFST+0,sp)
7987  02f8 2715          	jreq	L5262
7988                     ; 1856 			uiInfo.tCurr = t;
7990  02fa 7b02          	ld	a,(OFST+0,sp)
7991  02fc c70002        	ld	_uiInfo+2,a
7992                     ; 1857 			if( _remote == 0 )
7994  02ff c60000        	ld	a,__remote
7995  0302 260b          	jrne	L5262
7996                     ; 1860 				if( _disp_temp == 1 )
7998  0304 c60008        	ld	a,__disp_temp
7999  0307 4a            	dec	a
8000  0308 2605          	jrne	L5262
8001                     ; 1861 					ui_disp_temp_curr(t);
8003  030a 7b02          	ld	a,(OFST+0,sp)
8004  030c cd0000        	call	_ui_disp_temp_curr
8006  030f               L5262:
8007                     ; 1865 		if (key == 200) {
8009  030f 7b03          	ld	a,(OFST+1,sp)
8010  0311 a1c8          	cp	a,#200
8011  0313 2604          	jrne	L3362
8012                     ; 1866 			j = 2;
8014                     ; 1867 			_disp_temp = 1;
8016  0315 35010008      	mov	__disp_temp,#1
8017  0319               L3362:
8018                     ; 1870 		_disp_temp = 0;
8020  0319 725f0008      	clr	__disp_temp
8021                     ; 1873 		if( uiInfo.mode == 0 )	
8023  031d 725d0008      	tnz	_uiInfo+8
8024  0321 2606          	jrne	L5362
8025                     ; 1874 			disp_status_loop_client(key);
8027  0323 cd0000        	call	_disp_status_loop_client
8030  0326 cc0221        	jra	L5532
8031  0329               L5362:
8032                     ; 1876 			disp_status_loop_host(key);
8034  0329 cd0000        	call	_disp_status_loop_host
8036  032c cc0221        	jra	L5532
8037  032f               L5162:
8038                     ; 1878 	else if( _ds == 220 )
8040  032f a1dc          	cp	a,#220
8041  0331 260c          	jrne	L3462
8042                     ; 1880 		disp_status_id(key, 221);
8044  0333 ae00dd        	ldw	x,#221
8045  0336 7b03          	ld	a,(OFST+1,sp)
8046  0338 95            	ld	xh,a
8047  0339 cd0000        	call	_disp_status_id
8050  033c cc0221        	jra	L5532
8051  033f               L3462:
8052                     ; 1882 	else if( _ds == 221 )
8054  033f a1dd          	cp	a,#221
8055  0341 26f9          	jrne	L5532
8056                     ; 1884 		FW_ID(uiInfoSet.id);
8058  0343 c6006e        	ld	a,_uiInfoSet+1
8059  0346 97            	ld	xl,a
8060  0347 a60a          	ld	a,#10
8061  0349 95            	ld	xh,a
8062  034a cd0000        	call	_file_write
8064                     ; 1885 		FW_MODE(uiInfoSet.mode);
8066  034d c60072        	ld	a,_uiInfoSet+5
8067  0350 97            	ld	xl,a
8068  0351 a609          	ld	a,#9
8069  0353 95            	ld	xh,a
8070  0354 cd0000        	call	_file_write
8072                     ; 1886 		uiInfo.id = uiInfoSet.id;
8074  0357 55006e0004    	mov	_uiInfo+4,_uiInfoSet+1
8075                     ; 1887 		uiInfo.mode = uiInfoSet.mode;
8077  035c 5500720008    	mov	_uiInfo+8,_uiInfoSet+5
8078                     ; 1888 			_ds = 100;
8080  0361 35640011      	mov	__ds,#100
8081  0365 cc0221        	jra	L5532
8125                     ; 1892 void	copy_info(uint8_t next)
8125                     ; 1893 {
8126                     .text:	section	.text,new
8127  0000               _copy_info:
8129  0000 88            	push	a
8130       00000001      OFST:	set	1
8133                     ; 1895 	disp_set_state(next);
8135  0001 cd0000        	call	_disp_set_state
8137                     ; 1896 	uiInfoSet.id = uiInfo.id;
8139  0004 550004006e    	mov	_uiInfoSet+1,_uiInfo+4
8140                     ; 1897 	uiInfoSet.cnt = uiInfo.cnt;
8142  0009 550005006f    	mov	_uiInfoSet+2,_uiInfo+5
8143                     ; 1898 	uiInfoSet.cnt_sub = uiInfo.cnt_sub;
8145  000e 5500060070    	mov	_uiInfoSet+3,_uiInfo+6
8146                     ; 1899 	uiInfoSet.opMode = uiInfo.opMode;
8148  0013 5500070071    	mov	_uiInfoSet+4,_uiInfo+7
8149                     ; 1900 	uiInfoSet.mode = uiInfo.mode;
8151  0018 5500080072    	mov	_uiInfoSet+5,_uiInfo+8
8152                     ; 1901 	uiInfoSet.controlMode = uiInfo.controlMode;
8154  001d 5500090073    	mov	_uiInfoSet+6,_uiInfo+9
8155                     ; 1902 	uiInfoSet.valve = uiInfo.valve;
8157  0022 55000a0074    	mov	_uiInfoSet+7,_uiInfo+10
8158                     ; 1903 	uiInfoSet.valve_sub = uiInfo.valve_sub;
8160  0027 55000b0075    	mov	_uiInfoSet+8,_uiInfo+11
8161                     ; 1904 	uiInfoSet.poType = uiInfo.poType;
8163  002c 55000f0076    	mov	_uiInfoSet+9,_uiInfo+15
8164                     ; 1905 	uiInfoSet.houseCapa = uiInfo.houseCapa;
8166  0031 5500100077    	mov	_uiInfoSet+10,_uiInfo+16
8167                     ; 1906 	uiInfoSet.tOffset = uiInfo.tOffset;
8169  0036 5500110078    	mov	_uiInfoSet+11,_uiInfo+17
8170                     ; 1907 	uiInfoSet.tempOffset = uiInfo.tempOffset;
8172  003b 5500120079    	mov	_uiInfoSet+12,_uiInfo+18
8173                     ; 1908 	uiInfoSet.lpmType = uiInfo.lpmType;
8175  0040 550013007a    	mov	_uiInfoSet+13,_uiInfo+19
8176                     ; 1909 	uiInfoSet.lpmType_sub = uiInfo.lpmType_sub;
8178  0045 550014007b    	mov	_uiInfoSet+14,_uiInfo+20
8179                     ; 1910 	uiInfoSet.subRCLock = uiInfo.subRCLock;
8181  004a 55005d009c    	mov	_uiInfoSet+47,_uiInfo+93
8182                     ; 1911 	uiInfoSet.cntlMode = uiInfo.cntlMode;
8184                     ; 1912 	for( i=0; i<8; i++ )
8186  004f 4f            	clr	a
8187  0050 550003006d    	mov	_uiInfoSet,_uiInfo+3
8188  0055 6b01          	ld	(OFST+0,sp),a
8189  0057               L7662:
8190                     ; 1914 		uiInfoSet.valve_len[i] = uiInfo.valve_len[i];
8192  0057 5f            	clrw	x
8193  0058 97            	ld	xl,a
8194  0059 d60015        	ld	a,(_uiInfo+21,x)
8195  005c d7007c        	ld	(_uiInfoSet+15,x),a
8196                     ; 1915 		uiInfoSet.valve_rc[i] = uiInfo.valve_rc[i];
8198  005f 5f            	clrw	x
8199  0060 7b01          	ld	a,(OFST+0,sp)
8200  0062 97            	ld	xl,a
8201  0063 d6001d        	ld	a,(_uiInfo+29,x)
8202  0066 d70084        	ld	(_uiInfoSet+23,x),a
8203                     ; 1916 		uiInfoSet.valve_sub_len[i] = uiInfo.valve_sub_len[i];
8205  0069 5f            	clrw	x
8206  006a 7b01          	ld	a,(OFST+0,sp)
8207  006c 97            	ld	xl,a
8208  006d d60025        	ld	a,(_uiInfo+37,x)
8209  0070 d7008c        	ld	(_uiInfoSet+31,x),a
8210                     ; 1917 		uiInfoSet.valve_sub_rc[i] = uiInfo.valve_sub_rc[i];
8212  0073 5f            	clrw	x
8213  0074 7b01          	ld	a,(OFST+0,sp)
8214  0076 97            	ld	xl,a
8215  0077 d6002d        	ld	a,(_uiInfo+45,x)
8216  007a d70094        	ld	(_uiInfoSet+39,x),a
8217                     ; 1912 	for( i=0; i<8; i++ )
8219  007d 0c01          	inc	(OFST+0,sp)
8222  007f 7b01          	ld	a,(OFST+0,sp)
8223  0081 a108          	cp	a,#8
8224  0083 25d2          	jrult	L7662
8225                     ; 1919 	uiInfoSet.plc = uiInfo.plc;
8227  0085 55006400a2    	mov	_uiInfoSet+53,_uiInfo+100
8228                     ; 1925 	lcd_blink_npos_clear();
8230  008a cd0000        	call	_lcd_blink_npos_clear
8232                     ; 1926 	lcd_blink_clear();
8234  008d cd0000        	call	_lcd_blink_clear
8236                     ; 1927 }
8239  0090 84            	pop	a
8240  0091 81            	ret	
8275                     ; 1931 void	copy_infoSet(void)
8275                     ; 1932 {
8276                     .text:	section	.text,new
8277  0000               _copy_infoSet:
8279       00000001      OFST:	set	1
8282                     ; 1934 	uiInfo.id = uiInfoSet.id;
8284  0000 55006e0004    	mov	_uiInfo+4,_uiInfoSet+1
8285                     ; 1935 	uiInfo.cnt = uiInfoSet.cnt;
8287  0005 55006f0005    	mov	_uiInfo+5,_uiInfoSet+2
8288                     ; 1936 	uiInfo.cnt_sub = uiInfoSet.cnt_sub;
8290  000a 5500700006    	mov	_uiInfo+6,_uiInfoSet+3
8291                     ; 1937 	uiInfo.opMode = uiInfoSet.opMode;
8293  000f 5500710007    	mov	_uiInfo+7,_uiInfoSet+4
8294                     ; 1938 	uiInfo.mode = uiInfoSet.mode;
8296  0014 5500720008    	mov	_uiInfo+8,_uiInfoSet+5
8297                     ; 1939 	uiInfo.controlMode = uiInfoSet.controlMode;
8299  0019 5500730009    	mov	_uiInfo+9,_uiInfoSet+6
8300                     ; 1940 	uiInfo.valve = uiInfoSet.valve;
8302  001e 550074000a    	mov	_uiInfo+10,_uiInfoSet+7
8303                     ; 1941 	uiInfo.valve_sub = uiInfoSet.valve_sub;
8305  0023 550075000b    	mov	_uiInfo+11,_uiInfoSet+8
8306                     ; 1942 	uiInfo.poType = uiInfoSet.poType;
8308  0028 550076000f    	mov	_uiInfo+15,_uiInfoSet+9
8309                     ; 1943 	uiInfo.houseCapa = uiInfoSet.houseCapa;
8311  002d 5500770010    	mov	_uiInfo+16,_uiInfoSet+10
8312                     ; 1944 	uiInfo.tOffset = uiInfoSet.tOffset;
8314  0032 5500780011    	mov	_uiInfo+17,_uiInfoSet+11
8315                     ; 1945 	uiInfo.tempOffset = uiInfoSet.tempOffset;
8317  0037 5500790012    	mov	_uiInfo+18,_uiInfoSet+12
8318                     ; 1946 	uiInfo.lpmType = uiInfoSet.lpmType;
8320  003c 55007a0013    	mov	_uiInfo+19,_uiInfoSet+13
8321                     ; 1947 	uiInfo.lpmType_sub = uiInfoSet.lpmType_sub;
8323  0041 55007b0014    	mov	_uiInfo+20,_uiInfoSet+14
8324                     ; 1948 	uiInfo.subRCLock = uiInfoSet.subRCLock;
8326  0046 55009c005d    	mov	_uiInfo+93,_uiInfoSet+47
8327  004b 88            	push	a
8328                     ; 1949 	uiInfo.cntlMode = uiInfoSet.cntlMode;
8330  004c 55006d0003    	mov	_uiInfo+3,_uiInfoSet
8331                     ; 1950 	for( i=0; i<8; i++ )
8333  0051 4f            	clr	a
8334  0052 6b01          	ld	(OFST+0,sp),a
8335  0054               L1172:
8336                     ; 1952 		uiInfo.valve_len[i] = uiInfoSet.valve_len[i];
8338  0054 5f            	clrw	x
8339  0055 97            	ld	xl,a
8340  0056 d6007c        	ld	a,(_uiInfoSet+15,x)
8341  0059 d70015        	ld	(_uiInfo+21,x),a
8342                     ; 1953 		uiInfo.valve_rc[i] = uiInfoSet.valve_rc[i];
8344  005c 5f            	clrw	x
8345  005d 7b01          	ld	a,(OFST+0,sp)
8346  005f 97            	ld	xl,a
8347  0060 d60084        	ld	a,(_uiInfoSet+23,x)
8348  0063 d7001d        	ld	(_uiInfo+29,x),a
8349                     ; 1954 		uiInfo.valve_sub_len[i] = uiInfoSet.valve_sub_len[i];
8351  0066 5f            	clrw	x
8352  0067 7b01          	ld	a,(OFST+0,sp)
8353  0069 97            	ld	xl,a
8354  006a d6008c        	ld	a,(_uiInfoSet+31,x)
8355  006d d70025        	ld	(_uiInfo+37,x),a
8356                     ; 1955 		uiInfo.valve_sub_rc[i] = uiInfoSet.valve_sub_rc[i];
8358  0070 5f            	clrw	x
8359  0071 7b01          	ld	a,(OFST+0,sp)
8360  0073 97            	ld	xl,a
8361  0074 d60094        	ld	a,(_uiInfoSet+39,x)
8362  0077 d7002d        	ld	(_uiInfo+45,x),a
8363                     ; 1950 	for( i=0; i<8; i++ )
8365  007a 0c01          	inc	(OFST+0,sp)
8368  007c 7b01          	ld	a,(OFST+0,sp)
8369  007e a108          	cp	a,#8
8370  0080 25d2          	jrult	L1172
8371                     ; 1957 	uiInfo.plc = uiInfoSet.plc;
8373  0082 c600a2        	ld	a,_uiInfoSet+53
8374  0085 c70064        	ld	_uiInfo+100,a
8375                     ; 1958 	if( uiInfo.plc == 0 )
8377  0088 2605          	jrne	L7172
8378                     ; 1960 		_boiler_type = 0;
8380  008a c70000        	ld	__boiler_type,a
8382  008d 2008          	jra	L1272
8383  008f               L7172:
8384                     ; 1964 		_boiler_type = 1;
8386  008f 35010000      	mov	__boiler_type,#1
8387                     ; 1965 		uiInfo.plc--;
8389  0093 725a0064      	dec	_uiInfo+100
8390  0097               L1272:
8391                     ; 1967 }
8394  0097 84            	pop	a
8395  0098 81            	ret	
8448                     ; 1972 void	disp_status(uint8_t key)
8448                     ; 1973 {
8449                     .text:	section	.text,new
8450  0000               _disp_status:
8452  0000 88            	push	a
8453       00000000      OFST:	set	0
8456                     ; 1974 	lcd_blinkCb();
8458  0001 cd0000        	call	_lcd_blinkCb
8460                     ; 1976 	disp_statusCb(key);
8462  0004 7b01          	ld	a,(OFST+1,sp)
8463  0006 cd0000        	call	_disp_statusCb
8465                     ; 1979 	uiInfo.enc = 0;
8467  0009 725f0000      	clr	_uiInfo
8468                     ; 1982 	if( _updateBit != 0 && _updateTimer != __timer1s )
8470  000d c60006        	ld	a,__updateBit
8471  0010 2772          	jreq	L3572
8473  0012 c60005        	ld	a,__updateTimer
8474  0015 c10000        	cp	a,___timer1s
8475  0018 276a          	jreq	L3572
8476                     ; 1984 		_updateTimer = __timer1s;
8478  001a 5500000005    	mov	__updateTimer,___timer1s
8479                     ; 1985 		_updateCount--;
8481  001f 725a0007      	dec	__updateCount
8482                     ; 1986 		if( _updateCount == 0 )
8484  0023 265f          	jrne	L3572
8485                     ; 1988 			if( (_updateBit&BIT_REPEAT) != 0 )	{FW_REPEAT(uiInfo.repeat);	}
8487  0025 720100060a    	btjf	__updateBit,#0,L7572
8490  002a c6000c        	ld	a,_uiInfo+12
8491  002d 97            	ld	xl,a
8492  002e a60f          	ld	a,#15
8493  0030 95            	ld	xh,a
8494  0031 cd0000        	call	_file_write
8496  0034               L7572:
8497                     ; 1989 			if( (_updateBit&BIT_RESERVE) != 0 )	{FW_RESERVE(uiInfo.reserve);}
8499  0034 720300060a    	btjf	__updateBit,#1,L1672
8502  0039 c6000d        	ld	a,_uiInfo+13
8503  003c 97            	ld	xl,a
8504  003d a610          	ld	a,#16
8505  003f 95            	ld	xh,a
8506  0040 cd0000        	call	_file_write
8508  0043               L1672:
8509                     ; 1990 			if( (_updateBit&BIT_TSETUP) != 0 )	
8511  0043 720500061c    	btjf	__updateBit,#2,L3672
8512                     ; 1993 				if( uiInfo._temp[3] != 0 )
8514  0048 c60063        	ld	a,_uiInfo+99
8515  004b 270d          	jreq	L5672
8516                     ; 1995 					FW_TSETUP(uiInfo._temp[3]);
8518  004d 97            	ld	xl,a
8519  004e a611          	ld	a,#17
8520  0050 95            	ld	xh,a
8521  0051 cd0000        	call	_file_write
8523                     ; 1996 					uiInfo._temp[3] = 0;
8525  0054 725f0063      	clr	_uiInfo+99
8527  0058 200a          	jra	L3672
8528  005a               L5672:
8529                     ; 1999 					FW_TSETUP(uiInfo.tSetup);
8531  005a c6000e        	ld	a,_uiInfo+14
8532  005d 97            	ld	xl,a
8533  005e a611          	ld	a,#17
8534  0060 95            	ld	xh,a
8535  0061 cd0000        	call	_file_write
8537  0064               L3672:
8538                     ; 2001 			if( (_updateBit&BIT_DISPMODE) != 0 ){
8540  0064 720700060a    	btjf	__updateBit,#3,L1772
8541                     ; 2002 				if (uiInfo.mode == SETTING_MODE_SUB) {
8543                     ; 2004 						FW_DISPMODE(_disp_mode);
8546                     ; 2007 					FW_DISPMODE(_disp_mode);
8549  0069 c60000        	ld	a,__disp_mode
8550  006c 97            	ld	xl,a
8551  006d a629          	ld	a,#41
8552  006f 95            	ld	xh,a
8553  0070 cd0000        	call	_file_write
8555  0073               L1772:
8556                     ; 2011 			if( (_updateBit&BIT_REPEAT) != 0 || (_updateBit&BIT_RESERVE) != 0 )	
8558  0073 7200000605    	btjt	__updateBit,#0,L1003
8560  0078 7203000603    	btjf	__updateBit,#1,L7772
8561  007d               L1003:
8562                     ; 2013 				timerEventClear();
8564  007d cd0000        	call	_timerEventClear
8566  0080               L7772:
8567                     ; 2016 			_updateBit = 0;
8569  0080 725f0006      	clr	__updateBit
8570  0084               L3572:
8571                     ; 2019 	if( key==0 )
8573  0084 7b01          	ld	a,(OFST+1,sp)
8574  0086 2602          	jrne	L3003
8575                     ; 2020 		return;
8578  0088 84            	pop	a
8579  0089 81            	ret	
8580  008a               L3003:
8581                     ; 2022 	if( _key_continue == 1 )
8583  008a c60000        	ld	a,__key_continue
8584  008d 4a            	dec	a
8585  008e 2629          	jrne	L5003
8586                     ; 2025 		if( key==4 )	{	disp_statusCb(200);}
8588  0090 7b01          	ld	a,(OFST+1,sp)
8589  0092 a104          	cp	a,#4
8590  0094 2607          	jrne	L7003
8593  0096 a6c8          	ld	a,#200
8594  0098 cd0000        	call	_disp_statusCb
8597  009b 2016          	jra	L1103
8598  009d               L7003:
8599                     ; 2032 		else if( key==0x55 )
8601  009d a155          	cp	a,#85
8602  009f 2603cc017e    	jreq	L5372
8603                     ; 2035 			goto SetupRc;
8605                     ; 2037 		else if( key==0x53 )
8607  00a4 a153          	cp	a,#83
8608  00a6 260b          	jrne	L1103
8609                     ; 2040 			disp_set_state(160);
8611  00a8 a6a0          	ld	a,#160
8612  00aa cd0000        	call	_disp_set_state
8614                     ; 2041 			lcd_blink_npos_clear();
8616  00ad cd0000        	call	_lcd_blink_npos_clear
8618                     ; 2042 			lcd_blink_clear();		
8620  00b0 cd0000        	call	_lcd_blink_clear
8622  00b3               L1103:
8623                     ; 2044 		_key_continue = 0;
8625  00b3 725f0000      	clr	__key_continue
8626                     ; 2045 		goto SetupEntry;
8628  00b7 2078          	jra	L7272
8629  00b9               L5003:
8630                     ; 2048 	if( key == _keypwMaster[_keypwIndexMaster] )
8632  00b9 c6000e        	ld	a,__keypwIndexMaster
8633  00bc 5f            	clrw	x
8634  00bd 97            	ld	xl,a
8635  00be d60000        	ld	a,(__keypwMaster,x)
8636  00c1 1101          	cp	a,(OFST+1,sp)
8637  00c3 2622          	jrne	L1203
8638                     ; 2050 		_keypwIndexMaster++;
8640  00c5 725c000e      	inc	__keypwIndexMaster
8641                     ; 2051 		if( _keypwIndexMaster == 6 )
8643  00c9 c6000e        	ld	a,__keypwIndexMaster
8644  00cc a106          	cp	a,#6
8645  00ce 2625          	jrne	L5203
8646                     ; 2053 			_keypwIndexMaster = 0;
8648  00d0 725f000e      	clr	__keypwIndexMaster
8649                     ; 2054 SetupMaster:		
8649                     ; 2055 			uiInfo.id = 1;
8651  00d4 35010004      	mov	_uiInfo+4,#1
8652                     ; 2056 			uiInfo.mode = 1;
8654  00d8 35010008      	mov	_uiInfo+8,#1
8655                     ; 2057 			uiInfo.controlMode = 0;
8657  00dc 725f0009      	clr	_uiInfo+9
8658                     ; 2058 			copy_info(9);
8660  00e0 a609          	ld	a,#9
8661  00e2 cd0000        	call	_copy_info
8663  00e5 200e          	jra	L5203
8664  00e7               L1203:
8665                     ; 2063 		_keypwIndexMaster = 0;
8667  00e7 725f000e      	clr	__keypwIndexMaster
8668                     ; 2064 		if( key == _keypwMaster[_keypwIndexMaster] )
8670  00eb 7b01          	ld	a,(OFST+1,sp)
8671  00ed a104          	cp	a,#4
8672  00ef 2604          	jrne	L5203
8673                     ; 2065 			_keypwIndexMaster++;
8675  00f1 725c000e      	inc	__keypwIndexMaster
8676  00f5               L5203:
8677                     ; 2068 	if( key == _keypwMaster2[_keypwIndexMaster2] )
8679  00f5 c6000f        	ld	a,__keypwIndexMaster2
8680  00f8 5f            	clrw	x
8681  00f9 97            	ld	xl,a
8682  00fa d60006        	ld	a,(__keypwMaster2,x)
8683  00fd 1101          	cp	a,(OFST+1,sp)
8684  00ff 2622          	jrne	L1303
8685                     ; 2070 		_keypwIndexMaster2++;
8687  0101 725c000f      	inc	__keypwIndexMaster2
8688                     ; 2071 		if( _keypwIndexMaster2 == 6 )
8690  0105 c6000f        	ld	a,__keypwIndexMaster2
8691  0108 a106          	cp	a,#6
8692  010a 2625          	jrne	L7272
8693                     ; 2073 			_keypwIndexMaster2 = 0;
8695  010c 725f000f      	clr	__keypwIndexMaster2
8696                     ; 2074 SetupSub:
8696                     ; 2075 			uiInfo.id = 1;
8698  0110 35010004      	mov	_uiInfo+4,#1
8699                     ; 2076 			uiInfo.mode = 1;
8701  0114 35010008      	mov	_uiInfo+8,#1
8702                     ; 2077 			uiInfo.controlMode = 1;
8704  0118 35010009      	mov	_uiInfo+9,#1
8705                     ; 2078 			copy_info(9);
8707  011c a609          	ld	a,#9
8708  011e cd0000        	call	_copy_info
8710  0121 200e          	jra	L7272
8711  0123               L1303:
8712                     ; 2083 		_keypwIndexMaster2 = 0;
8714  0123 725f000f      	clr	__keypwIndexMaster2
8715                     ; 2084 		if( key == _keypwMaster2[_keypwIndexMaster2] )
8717  0127 7b01          	ld	a,(OFST+1,sp)
8718  0129 a104          	cp	a,#4
8719  012b 2604          	jrne	L7272
8720                     ; 2085 			_keypwIndexMaster2++;
8722  012d 725c000f      	inc	__keypwIndexMaster2
8723  0131               L7272:
8724                     ; 2088 SetupEntry:		
8724                     ; 2089 	if( key == 0x88 )
8726  0131 7b01          	ld	a,(OFST+1,sp)
8727  0133 a188          	cp	a,#136
8728  0135 261a          	jrne	L1403
8729                     ; 2091 SetupRoomCntl:		
8729                     ; 2092 		uiInfo.enc = 0;
8731  0137 725f0000      	clr	_uiInfo
8732                     ; 2093 		if( uiInfo.mode == 0 )
8734  013b c60008        	ld	a,_uiInfo+8
8735  013e 2604          	jrne	L3403
8736                     ; 2094 			uiInfo.id = 2;
8738  0140 35020004      	mov	_uiInfo+4,#2
8739  0144               L3403:
8740                     ; 2095 		copy_info(uiInfo.mode==0 ? 101 : 133);
8742  0144 c60008        	ld	a,_uiInfo+8
8743  0147 2604          	jrne	L0641
8744  0149 a665          	ld	a,#101
8745  014b 2013          	jra	LC049
8746  014d               L0641:
8747  014d a685          	ld	a,#133
8750  014f 200f          	jp	LC049
8751  0151               L1403:
8752                     ; 2097 	else if( key == 0x89 && uiInfo.mode == 1 )
8754  0151 a189          	cp	a,#137
8755  0153 260e          	jrne	L5403
8757  0155 c60008        	ld	a,_uiInfo+8
8758  0158 4a            	dec	a
8759  0159 2608          	jrne	L5403
8760                     ; 2099 SetupCommand:		
8760                     ; 2100 		uiInfo.enc = 0;
8762  015b c70000        	ld	_uiInfo,a
8763                     ; 2101 		copy_info(41);
8765  015e a629          	ld	a,#41
8766  0160               LC049:
8767  0160 cd0000        	call	_copy_info
8769  0163               L5403:
8770                     ; 2122 	if( key == _keypwClient[_keypwIndexClient] )
8772  0163 c60010        	ld	a,__keypwIndexClient
8773  0166 5f            	clrw	x
8774  0167 97            	ld	xl,a
8775  0168 d6000c        	ld	a,(__keypwClient,x)
8776  016b 1101          	cp	a,(OFST+1,sp)
8777  016d 261c          	jrne	L1503
8778                     ; 2124 		_keypwIndexClient++;
8780  016f 725c0010      	inc	__keypwIndexClient
8781                     ; 2125 		if( _keypwIndexClient == 6 )
8783  0173 c60010        	ld	a,__keypwIndexClient
8784  0176 a106          	cp	a,#6
8785  0178 261f          	jrne	L5503
8786                     ; 2127 			_keypwIndexClient = 0;
8788  017a 725f0010      	clr	__keypwIndexClient
8789  017e               L5372:
8790                     ; 2128 SetupRc:
8790                     ; 2129 //			uiInfo.id = 2;
8790                     ; 2130 //			uiInfo.mode = 0;
8790                     ; 2131 //			copy_info(101);
8790                     ; 2132 	lcd_blink_npos_clear();
8792  017e cd0000        	call	_lcd_blink_npos_clear
8794                     ; 2133 	lcd_blink_clear();
8796  0181 cd0000        	call	_lcd_blink_clear
8798                     ; 2134 	disp_set_state(220);
8800  0184 a6dc          	ld	a,#220
8801  0186 cd0000        	call	_disp_set_state
8803  0189 200e          	jra	L5503
8804  018b               L1503:
8805                     ; 2139 		_keypwIndexClient = 0;
8807  018b 725f0010      	clr	__keypwIndexClient
8808                     ; 2140 		if( key == _keypwClient[_keypwIndexClient] )
8810  018f 7b01          	ld	a,(OFST+1,sp)
8811  0191 a104          	cp	a,#4
8812  0193 2604          	jrne	L5503
8813                     ; 2141 			_keypwIndexClient++;
8815  0195 725c0010      	inc	__keypwIndexClient
8816  0199               L5503:
8817                     ; 2143 }
8820  0199 84            	pop	a
8821  019a 81            	ret	
9592                     	xref	__key_continue
9593                     	xref	_timerEventClear
9594                     	xref	__boiler_type
9595                     	xdef	_disp_statusCb
9596                     	xdef	_error_display_refresh
9597                     	xdef	_disp_485
9598                     	xdef	__disp_485
9599                     	xdef	_disp_set_state
9600                     	xdef	_disp_write_file
9601                     	xdef	__d485_id
9602                     	xref	_debug_br
9603                     	xref	_debug_hn
9604                     	xref	__remote
9605                     	xref	_getCurrTemp
9606                     	xdef	_disp_status_command
9607                     	xdef	_disp_status_error
9608                     	xdef	_timerClear
9609                     	xdef	__timFlag
9610                     	xdef	__tim30min
9611                     	xdef	__tim1min
9612                     	xdef	_disp_status_run_id
9613                     	xdef	___func_rc_timerout2
9614                     	xdef	___func_rc_timerout1
9615                     	xdef	___func_rc_timerout
9616                     	xref	___func_rc_settingCb
9617                     	xdef	_disp_status_plc
9618                     	xdef	_disp_status_valveinfo_sub
9619                     	xdef	__ui_
9620                     	xdef	___lpm
9621                     	xdef	_disp_status_houseCapa
9622                     	xdef	__backlight_get_code
9623                     	xdef	__backlight_get_index
9624                     	xdef	_disp_status_valveCount
9625                     	xdef	___bL
9626                     	xdef	_disp_next
9627                     	xdef	_file_update
9628                     	xdef	__keypwIndexClient
9629                     	xdef	__keypwIndexMaster2
9630                     	xdef	__keypwIndexMaster
9631                     	xdef	__keypwClient
9632                     	xdef	__keypwMaster2
9633                     	xdef	__keypwMaster
9634                     	xdef	_error_display_status
9635                     	xdef	_error_display_mode
9636                     	xdef	_copy_info
9637                     	xdef	_copy_infoSet
9638                     	xref	__backlight
9639                     	xref	_ui_error_type
9640                     	xref	_ui_error
9641                     	xref	_error_type
9642                     	xref	_error
9643                     	xdef	_start_flag
9644                     	xdef	__backup_backlight2
9645                     	xdef	__backup_backlight
9646                     	xdef	__disp_temp
9647                     	xref	_func_rc_setting
9648                     	xref	_func_rc_recover
9649                     	xref	_func_rc_command
9650                     	xref	__boiler_water_heat
9651                     	xref	__boiler_water_shower
9652                     	xdef	_file_update2
9653                     	xdef	__updateCount
9654                     	xdef	__updateBit
9655                     	xdef	__updateTimer
9656                     	xref	__disp_mode2
9657                     	xref	__disp_mode
9658                     	xdef	_disp_status_curr_only
9659                     	xdef	_disp_status_loop_init
9660                     	xdef	_disp_status_loop_message
9661                     	xdef	_disp_status_exit
9662                     	xdef	_disp_status_run
9663                     	xdef	_disp_status_valveinfo
9664                     	xdef	_disp_status_temp_offset
9665                     	xdef	_disp_status_lpm
9666                     	xdef	_disp_status_po_type
9667                     	xdef	_disp_status_cntl_op
9668                     	xdef	_disp_status_run_op
9669                     	xdef	_disp_status_backlight2
9670                     	xdef	_disp_status_toffset
9671                     	xdef	_disp_status_id
9672                     	xdef	_clear_npos2
9673                     	xdef	_clear_npos1
9674                     	xdef	__subRemote
9675                     	xdef	__dsPrev
9676                     	xdef	__dsCount
9677                     	xdef	__ds
9678                     	xdef	_ui_Open
9679                     	xref	_disp_status_loop_client
9680                     	xref	_disp_status_loop_host
9681                     	xdef	___sRoom
9682                     	xdef	___sInfo
9683                     	xdef	___sDn
9684                     	xdef	___sUp
9685                     	xdef	___s
9686                     	xref	_lcd_blink_npos
9687                     	xref	_lcd_blink_npos_clear
9688                     	xref	_ui_disp_clear_tSetup
9689                     	xref	___ui_disp_temp_c
9690                     	xref	_ui_disp_temp_curr
9691                     	xref	_ui_disp_temp_setup
9692                     	xref	_lcd_blinkCb
9693                     	xref	_lcd_blink_clear
9694                     	xdef	_disp_status
9695                     	xref	_lcd_clear_npos
9696                     	xref	_lcd_disp_rid
9697                     	xref	_lcd_disp_err
9698                     	xref	_lcd_disp_n
9699                     	xref	_lcd_clear
9700                     	xref	_lcd_disp_setup_mode_each
9701                     	xref	_lcd_disp_setup_mode_local
9702                     	xref	_lcd_disp_setup_valve
9703                     	xref	_lcd_disp_setup_id
9704                     	xref	_lcd_disp_setup_mode
9705                     	xref	_lcd_disp_plc
9706                     	xref	_lcd_disp_cnt_sub
9707                     	xref	_lcd_disp_cnt_host
9708                     	xref	_lcd_disp_freset
9709                     	xref	_lcd_disp_mir2
9710                     	xref	_lcd_disp_mir1
9711                     	xref	_lcd_disp_setup_cntl_tab
9712                     	xref	_lcd_disp_setup_cntl_2motor
9713                     	xref	_lcd_disp_setup_cntl_po
9714                     	xref	_lcd_disp_setup_cntl_on
9715                     	xref	_lcd_disp_setup_cntl_op
9716                     	xref	_lcd_disp_setup_len
9717                     	xref	_lcd_disp_setup_lpm
9718                     	xref	_lcd_disp_backlight
9719                     	xref	_lcd_clear_btn
9720                     	xref	_iLF_DEF
9721                     	xref	_bLF_DEF
9722                     	switch	.bss
9723  0000               _uiInfo:
9724  0000 000000000000  	ds.b	109
9725                     	xdef	_uiInfo
9726  006d               _uiInfoSet:
9727  006d 000000000000  	ds.b	54
9728                     	xdef	_uiInfoSet
9729                     	xref	_file_read
9730                     	xref	_file_write
9731                     	xref	___timer1s
9732                     	xref	__t20ms
9733                     	xdef	_error_display
9734                     	xref.b	c_x
9754                     	xref	c_smodx
9755                     	end
