   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
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
 770  0004 ae1400        	ldw	x,#5120
 771  0007 97            	ld	xl,a
 772  0008 cd0000        	call	_file_write
 774                     ; 245 	if( i==0 )	FW_BACKLIGHT(_backlight);
 776  000b 7b01          	ld	a,(OFST+1,sp)
 777  000d 260a          	jrne	L341
 780  000f c60000        	ld	a,__backlight
 781  0012 ae2a00        	ldw	x,#10752
 782  0015 97            	ld	xl,a
 783  0016 cd0000        	call	_file_write
 785  0019               L341:
 786                     ; 246 }
 789  0019 84            	pop	a
 790  001a 81            	ret	
 818                     ; 284 void	file_update(void)
 818                     ; 285 {
 819                     .text:	section	.text,new
 820  0000               _file_update:
 824                     ; 286 	FW_CNTLMODE(uiInfo.cntlMode);
 826  0000 c60003        	ld	a,_uiInfo+3
 827  0003 ae0800        	ldw	x,#2048
 828  0006 97            	ld	xl,a
 829  0007 cd0000        	call	_file_write
 831                     ; 287 	FW_MODE(uiInfo.mode);
 833  000a c60008        	ld	a,_uiInfo+8
 834  000d ae0900        	ldw	x,#2304
 835  0010 97            	ld	xl,a
 836  0011 cd0000        	call	_file_write
 838                     ; 288 	FW_ID(uiInfo.id);
 840  0014 c60004        	ld	a,_uiInfo+4
 841  0017 ae0a00        	ldw	x,#2560
 842  001a 97            	ld	xl,a
 843  001b cd0000        	call	_file_write
 845                     ; 289 	FW_CNT(uiInfo.cnt);
 847  001e c60005        	ld	a,_uiInfo+5
 848  0021 ae0b00        	ldw	x,#2816
 849  0024 97            	ld	xl,a
 850  0025 cd0000        	call	_file_write
 852                     ; 290 	FW_CNT_SUB(uiInfo.cnt_sub);
 854  0028 c60006        	ld	a,_uiInfo+6
 855  002b ae2b00        	ldw	x,#11008
 856  002e 97            	ld	xl,a
 857  002f cd0000        	call	_file_write
 859                     ; 291 	FW_OPMODE(uiInfo.opMode);
 861  0032 c60007        	ld	a,_uiInfo+7
 862  0035 ae0c00        	ldw	x,#3072
 863  0038 97            	ld	xl,a
 864  0039 cd0000        	call	_file_write
 866                     ; 293 	FW_CNT_MODE(uiInfo.controlMode);
 868  003c c60009        	ld	a,_uiInfo+9
 869  003f ae0d00        	ldw	x,#3328
 870  0042 97            	ld	xl,a
 871  0043 cd0000        	call	_file_write
 873                     ; 294 	FW_VALVE(uiInfo.valve);
 875  0046 c6000a        	ld	a,_uiInfo+10
 876  0049 ae0e00        	ldw	x,#3584
 877  004c 97            	ld	xl,a
 878  004d cd0000        	call	_file_write
 880                     ; 295 	FW_VALVE_SUB(uiInfo.valve_sub);
 882  0050 c6000b        	ld	a,_uiInfo+11
 883  0053 ae2c00        	ldw	x,#11264
 884  0056 97            	ld	xl,a
 885  0057 cd0000        	call	_file_write
 887                     ; 296 	FW_REPEAT(uiInfo.repeat);
 889  005a c6000c        	ld	a,_uiInfo+12
 890  005d ae0f00        	ldw	x,#3840
 891  0060 97            	ld	xl,a
 892  0061 cd0000        	call	_file_write
 894                     ; 297 	FW_RESERVE(uiInfo.reserve);
 896  0064 c6000d        	ld	a,_uiInfo+13
 897  0067 ae1000        	ldw	x,#4096
 898  006a 97            	ld	xl,a
 899  006b cd0000        	call	_file_write
 901                     ; 298 	FW_TSETUP(uiInfo.tSetup);
 903  006e c6000e        	ld	a,_uiInfo+14
 904  0071 ae1100        	ldw	x,#4352
 905  0074 97            	ld	xl,a
 906  0075 cd0000        	call	_file_write
 908                     ; 300 	FW_POTYPE(uiInfo.poType);
 910  0078 c6000f        	ld	a,_uiInfo+15
 911  007b ae1200        	ldw	x,#4608
 912  007e 97            	ld	xl,a
 913  007f cd0000        	call	_file_write
 915                     ; 301 	FW_HOUSECAPA(uiInfo.houseCapa);
 917  0082 c60010        	ld	a,_uiInfo+16
 918  0085 ae1300        	ldw	x,#4864
 919  0088 97            	ld	xl,a
 920  0089 cd0000        	call	_file_write
 922                     ; 302 	FW_TOFFSET(uiInfo.tOffset);
 924  008c c60011        	ld	a,_uiInfo+17
 925  008f ae1400        	ldw	x,#5120
 926  0092 97            	ld	xl,a
 927  0093 cd0000        	call	_file_write
 929                     ; 304 	FW_VALVE_INFOS
 931  0096 c60015        	ld	a,_uiInfo+21
 932  0099 ae1500        	ldw	x,#5376
 933  009c 97            	ld	xl,a
 934  009d cd0000        	call	_file_write
 938  00a0 c60016        	ld	a,_uiInfo+22
 939  00a3 ae1600        	ldw	x,#5632
 940  00a6 97            	ld	xl,a
 941  00a7 cd0000        	call	_file_write
 945  00aa c60017        	ld	a,_uiInfo+23
 946  00ad ae1700        	ldw	x,#5888
 947  00b0 97            	ld	xl,a
 948  00b1 cd0000        	call	_file_write
 952  00b4 c60018        	ld	a,_uiInfo+24
 953  00b7 ae1800        	ldw	x,#6144
 954  00ba 97            	ld	xl,a
 955  00bb cd0000        	call	_file_write
 959  00be c60019        	ld	a,_uiInfo+25
 960  00c1 ae1900        	ldw	x,#6400
 961  00c4 97            	ld	xl,a
 962  00c5 cd0000        	call	_file_write
 966  00c8 c6001a        	ld	a,_uiInfo+26
 967  00cb ae1a00        	ldw	x,#6656
 968  00ce 97            	ld	xl,a
 969  00cf cd0000        	call	_file_write
 973  00d2 c6001b        	ld	a,_uiInfo+27
 974  00d5 ae1b00        	ldw	x,#6912
 975  00d8 97            	ld	xl,a
 976  00d9 cd0000        	call	_file_write
 980  00dc c6001c        	ld	a,_uiInfo+28
 981  00df ae1c00        	ldw	x,#7168
 982  00e2 97            	ld	xl,a
 983  00e3 cd0000        	call	_file_write
 987  00e6 c60025        	ld	a,_uiInfo+37
 988  00e9 ae2e00        	ldw	x,#11776
 989  00ec 97            	ld	xl,a
 990  00ed cd0000        	call	_file_write
 994  00f0 c60026        	ld	a,_uiInfo+38
 995  00f3 ae2f00        	ldw	x,#12032
 996  00f6 97            	ld	xl,a
 997  00f7 cd0000        	call	_file_write
1001  00fa c60027        	ld	a,_uiInfo+39
1002  00fd ae3000        	ldw	x,#12288
1003  0100 97            	ld	xl,a
1004  0101 cd0000        	call	_file_write
1008  0104 c60028        	ld	a,_uiInfo+40
1009  0107 ae3100        	ldw	x,#12544
1010  010a 97            	ld	xl,a
1011  010b cd0000        	call	_file_write
1015  010e c60029        	ld	a,_uiInfo+41
1016  0111 ae3200        	ldw	x,#12800
1017  0114 97            	ld	xl,a
1018  0115 cd0000        	call	_file_write
1022  0118 c6002a        	ld	a,_uiInfo+42
1023  011b ae3300        	ldw	x,#13056
1024  011e 97            	ld	xl,a
1025  011f cd0000        	call	_file_write
1029  0122 c6002b        	ld	a,_uiInfo+43
1030  0125 ae3400        	ldw	x,#13312
1031  0128 97            	ld	xl,a
1032  0129 cd0000        	call	_file_write
1036  012c c6002c        	ld	a,_uiInfo+44
1037  012f ae3500        	ldw	x,#13568
1038  0132 97            	ld	xl,a
1039  0133 cd0000        	call	_file_write
1041                     ; 305 	FW_VALVE_RCINFOS
1043  0136 c6001d        	ld	a,_uiInfo+29
1044  0139 ae1d00        	ldw	x,#7424
1045  013c 97            	ld	xl,a
1046  013d cd0000        	call	_file_write
1050  0140 c6001e        	ld	a,_uiInfo+30
1051  0143 ae1e00        	ldw	x,#7680
1052  0146 97            	ld	xl,a
1053  0147 cd0000        	call	_file_write
1057  014a c6001f        	ld	a,_uiInfo+31
1058  014d ae1f00        	ldw	x,#7936
1059  0150 97            	ld	xl,a
1060  0151 cd0000        	call	_file_write
1064  0154 c60020        	ld	a,_uiInfo+32
1065  0157 ae2000        	ldw	x,#8192
1066  015a 97            	ld	xl,a
1067  015b cd0000        	call	_file_write
1071  015e c60021        	ld	a,_uiInfo+33
1072  0161 ae2100        	ldw	x,#8448
1073  0164 97            	ld	xl,a
1074  0165 cd0000        	call	_file_write
1078  0168 c60022        	ld	a,_uiInfo+34
1079  016b ae2200        	ldw	x,#8704
1080  016e 97            	ld	xl,a
1081  016f cd0000        	call	_file_write
1085  0172 c60023        	ld	a,_uiInfo+35
1086  0175 ae2300        	ldw	x,#8960
1087  0178 97            	ld	xl,a
1088  0179 cd0000        	call	_file_write
1092  017c c60024        	ld	a,_uiInfo+36
1093  017f ae2400        	ldw	x,#9216
1094  0182 97            	ld	xl,a
1095  0183 cd0000        	call	_file_write
1099  0186 c6002d        	ld	a,_uiInfo+45
1100  0189 ae3600        	ldw	x,#13824
1101  018c 97            	ld	xl,a
1102  018d cd0000        	call	_file_write
1106  0190 c6002e        	ld	a,_uiInfo+46
1107  0193 ae3700        	ldw	x,#14080
1108  0196 97            	ld	xl,a
1109  0197 cd0000        	call	_file_write
1113  019a c6002f        	ld	a,_uiInfo+47
1114  019d ae3800        	ldw	x,#14336
1115  01a0 97            	ld	xl,a
1116  01a1 cd0000        	call	_file_write
1120  01a4 c60030        	ld	a,_uiInfo+48
1121  01a7 ae3900        	ldw	x,#14592
1122  01aa 97            	ld	xl,a
1123  01ab cd0000        	call	_file_write
1127  01ae c60031        	ld	a,_uiInfo+49
1128  01b1 ae3a00        	ldw	x,#14848
1129  01b4 97            	ld	xl,a
1130  01b5 cd0000        	call	_file_write
1134  01b8 c60032        	ld	a,_uiInfo+50
1135  01bb ae3b00        	ldw	x,#15104
1136  01be 97            	ld	xl,a
1137  01bf cd0000        	call	_file_write
1141  01c2 c60033        	ld	a,_uiInfo+51
1142  01c5 ae3c00        	ldw	x,#15360
1143  01c8 97            	ld	xl,a
1144  01c9 cd0000        	call	_file_write
1148  01cc c60034        	ld	a,_uiInfo+52
1149  01cf ae3d00        	ldw	x,#15616
1150  01d2 97            	ld	xl,a
1151  01d3 cd0000        	call	_file_write
1153                     ; 307 	FW_B_SHOWER(_boiler_water_shower);
1155  01d6 c60000        	ld	a,__boiler_water_shower
1156  01d9 ae2500        	ldw	x,#9472
1157  01dc 97            	ld	xl,a
1158  01dd cd0000        	call	_file_write
1160                     ; 308 	FW_B_HEAT(_boiler_water_heat);
1162  01e0 c60000        	ld	a,__boiler_water_heat
1163  01e3 ae2600        	ldw	x,#9728
1164  01e6 97            	ld	xl,a
1165  01e7 cd0000        	call	_file_write
1167                     ; 309 	FW_TEMPOFFSET(uiInfo.tempOffset);
1169  01ea c60012        	ld	a,_uiInfo+18
1170  01ed ae2700        	ldw	x,#9984
1171  01f0 97            	ld	xl,a
1172  01f1 cd0000        	call	_file_write
1174                     ; 310 	FW_LPM(uiInfo.lpmType);
1176  01f4 c60013        	ld	a,_uiInfo+19
1177  01f7 ae2800        	ldw	x,#10240
1178  01fa 97            	ld	xl,a
1179  01fb cd0000        	call	_file_write
1181                     ; 311 	FW_LPM_SUB(uiInfo.lpmType_sub);
1183  01fe c60014        	ld	a,_uiInfo+20
1184  0201 ae2d00        	ldw	x,#11520
1185  0204 97            	ld	xl,a
1186  0205 cd0000        	call	_file_write
1188                     ; 312 	FW_DISPMODE(_disp_mode);
1190  0208 c60000        	ld	a,__disp_mode
1191  020b ae2900        	ldw	x,#10496
1192  020e 97            	ld	xl,a
1193  020f cd0000        	call	_file_write
1195                     ; 318 	FW_PLC(uiInfo.plc);
1197  0212 c60064        	ld	a,_uiInfo+100
1198  0215 ae3e00        	ldw	x,#15872
1199  0218 97            	ld	xl,a
1200  0219 cd0000        	call	_file_write
1202                     ; 319 	file_write(_B+55, 0xaa);
1204  021c ae3faa        	ldw	x,#16298
1205  021f cd0000        	call	_file_write
1207                     ; 320 	file_write(_B+56, 0xbb);
1209  0222 ae40bb        	ldw	x,#16571
1211                     ; 321 }
1214  0225 cc0000        	jp	_file_write
1217                     	switch	.data
1218  0011               __ds:
1219  0011 64            	dc.b	100
1220  0012               __dsCount:
1221  0012 00            	dc.b	0
1222  0013               __dsPrev:
1223  0013 00            	dc.b	0
1224  0014               __subRemote:
1225  0014 00            	dc.b	0
1247                     ; 330 void	clear_npos1(void)
1247                     ; 331 {
1248                     .text:	section	.text,new
1249  0000               _clear_npos1:
1253                     ; 332 	lcd_clear_npos(0, 0);
1255  0000 5f            	clrw	x
1256  0001 cd0000        	call	_lcd_clear_npos
1258                     ; 333 	lcd_clear_npos(1, 0);
1260  0004 ae0100        	ldw	x,#256
1262                     ; 334 }
1265  0007 cc0000        	jp	_lcd_clear_npos
1289                     ; 336 void	clear_npos2(void)
1289                     ; 337 {
1290                     .text:	section	.text,new
1291  0000               _clear_npos2:
1295                     ; 338 	lcd_clear_npos(2, 0);
1297  0000 ae0200        	ldw	x,#512
1298  0003 cd0000        	call	_lcd_clear_npos
1300                     ; 339 	lcd_clear_npos(3, 0);
1302  0006 ae0300        	ldw	x,#768
1304                     ; 340 }
1307  0009 cc0000        	jp	_lcd_clear_npos
1333                     ; 342 void	disp_next(void)
1333                     ; 343 {
1334                     .text:	section	.text,new
1335  0000               _disp_next:
1339                     ; 344 	lcd_clear(0);
1341  0000 4f            	clr	a
1342  0001 cd0000        	call	_lcd_clear
1344                     ; 345 	_dsCount = 1;
1346  0004 35010012      	mov	__dsCount,#1
1347                     ; 346 	_dsPrev = 0xff;
1349  0008 35ff0013      	mov	__dsPrev,#255
1350                     ; 347 }
1353  000c 81            	ret	
1356                     	switch	.data
1357  0015               ___bL:
1358  0015 60            	dc.b	96
1413                     ; 355 void	disp_status_id(uint8_t key, uint8_t next)
1413                     ; 356 {
1414                     .text:	section	.text,new
1415  0000               _disp_status_id:
1417  0000 89            	pushw	x
1418  0001 88            	push	a
1419       00000001      OFST:	set	1
1422                     ; 358 	if( _dsCount == 0 )
1424  0002 c60012        	ld	a,__dsCount
1425  0005 2625          	jrne	L502
1426                     ; 360 		disp_next();
1428  0007 cd0000        	call	_disp_next
1430                     ; 361 		lcd_disp_setup_id();
1432  000a cd0000        	call	_lcd_disp_setup_id
1434                     ; 363 		if( uiInfoSet.id < 2 ) {
1436  000d c6006e        	ld	a,_uiInfoSet+1
1437  0010 a102          	cp	a,#2
1438  0012 2404          	jruge	L132
1439                     ; 364 			uiInfoSet.id = 2;
1441  0014 3502006e      	mov	_uiInfoSet+1,#2
1442  0018               L132:
1443                     ; 367 		if (_backup_backlight == 0) {
1445  0018 c60009        	ld	a,__backup_backlight
1446  001b 2604          	jrne	L332
1447                     ; 368 			_backup_backlight = BACKLIGHT_MAX_LEVEL;
1449  001d 35600009      	mov	__backup_backlight,#96
1450  0021               L332:
1451                     ; 370 		__bL = _backlight;
1453  0021 5500000015    	mov	___bL,__backlight
1454                     ; 371 		_backlight = BACKLIGHT_MAX_LEVEL;
1456  0026 35600000      	mov	__backlight,#96
1458  002a 2044          	jra	L532
1459  002c               L502:
1460                     ; 375 EncEntry:		
1460                     ; 376 		i = uiInfoSet.id;
1462  002c c6006e        	ld	a,_uiInfoSet+1
1463  002f 6b01          	ld	(OFST+0,sp),a
1465                     ; 377 		if( uiInfo.enc != 0 )
1467  0031 c60000        	ld	a,_uiInfo
1468  0034 2724          	jreq	L732
1469                     ; 379 			if( (uiInfo.enc&0x40) == 0 )
1471  0036 a540          	bcp	a,#64
1472  0038 260d          	jrne	L142
1473                     ; 381 				if( i==1 )	i = _ID_MAX;
1475  003a 7b01          	ld	a,(OFST+0,sp)
1476  003c 4a            	dec	a
1477  003d 2604          	jrne	L342
1480  003f a607          	ld	a,#7
1482  0041 200c          	jp	LC004
1483  0043               L342:
1484                     ; 383 					i--;
1486  0043 0a01          	dec	(OFST+0,sp)
1488  0045 200e          	jra	L742
1489  0047               L142:
1490                     ; 387 				if( i==_ID_MAX )	i = 1;
1492  0047 7b01          	ld	a,(OFST+0,sp)
1493  0049 a107          	cp	a,#7
1494  004b 2606          	jrne	L152
1497  004d a601          	ld	a,#1
1498  004f               LC004:
1499  004f 6b01          	ld	(OFST+0,sp),a
1502  0051 2002          	jra	L742
1503  0053               L152:
1504                     ; 389 					i++;
1506  0053 0c01          	inc	(OFST+0,sp)
1508  0055               L742:
1509                     ; 391 			uiInfoSet.id = i;
1511  0055 7b01          	ld	a,(OFST+0,sp)
1512  0057 c7006e        	ld	_uiInfoSet+1,a
1513  005a               L732:
1514                     ; 393 		if( _dsPrev != i )
1516  005a c60013        	ld	a,__dsPrev
1517  005d 1101          	cp	a,(OFST+0,sp)
1518  005f 270f          	jreq	L532
1519                     ; 395 			_dsPrev = i;
1521  0061 7b01          	ld	a,(OFST+0,sp)
1522  0063 c70013        	ld	__dsPrev,a
1523                     ; 396 			lcd_disp_rid(i, 0, 0);
1525  0066 4b00          	push	#0
1526  0068 7b02          	ld	a,(OFST+1,sp)
1527  006a 5f            	clrw	x
1528  006b 95            	ld	xh,a
1529  006c cd0000        	call	_lcd_disp_rid
1531  006f 84            	pop	a
1532  0070               L532:
1533                     ; 399 	if( key == 0x10 )		__UP
1535  0070 7b02          	ld	a,(OFST+1,sp)
1536  0072 a110          	cp	a,#16
1537  0074 2606          	jrne	L752
1540  0076 35010000      	mov	_uiInfo,#1
1544  007a 2008          	jp	LC003
1545  007c               L752:
1546                     ; 400 	else if( key == 0x20 )	__DN
1548  007c a120          	cp	a,#32
1549  007e 2608          	jrne	L362
1552  0080 35400000      	mov	_uiInfo,#64
1555  0084               LC003:
1557  0084 0f02          	clr	(OFST+1,sp)
1560  0086 20a4          	jra	L502
1561  0088               L362:
1562                     ; 401 	else if( key == 4 )	
1564  0088 a104          	cp	a,#4
1565  008a 2623          	jrne	L162
1566                     ; 403 		uiInfoSet.mode = uiInfoSet.id == 1 ? 1 : 0;
1568  008c c6006e        	ld	a,_uiInfoSet+1
1569  008f 4a            	dec	a
1570  0090 2603          	jrne	L014
1571  0092 4c            	inc	a
1572  0093 2001          	jra	L214
1573  0095               L014:
1574  0095 4f            	clr	a
1575  0096               L214:
1576  0096 c70072        	ld	_uiInfoSet+5,a
1577                     ; 404 		STATUS_NEXT(next);
1579  0099 7b03          	ld	a,(OFST+2,sp)
1580  009b c70011        	ld	__ds,a
1583  009e 725f0012      	clr	__dsCount
1586  00a2 35ff0013      	mov	__dsPrev,#255
1587                     ; 405 		_backup_backlight = 0;
1590  00a6 725f0009      	clr	__backup_backlight
1591                     ; 407 		_backlight = __bL;
1593  00aa 5500150000    	mov	__backlight,___bL
1594  00af               L162:
1595                     ; 409 }
1598  00af 5b03          	addw	sp,#3
1599  00b1 81            	ret	
1654                     ; 411 void	disp_status_valveCount(uint8_t key, uint8_t next)
1654                     ; 412 {
1655                     .text:	section	.text,new
1656  0000               _disp_status_valveCount:
1658  0000 89            	pushw	x
1659  0001 88            	push	a
1660       00000001      OFST:	set	1
1663                     ; 414 	if( _dsCount == 0 )
1665  0002 c60012        	ld	a,__dsCount
1666  0005 2608          	jrne	L172
1667                     ; 416 		disp_next();
1669  0007 cd0000        	call	_disp_next
1671                     ; 417 		lcd_disp_setup_valve();
1673  000a cd0000        	call	_lcd_disp_setup_valve
1676  000d 206c          	jra	L513
1677  000f               L172:
1678                     ; 421 EncEntry:		
1678                     ; 422 		i = uiInfoSet.controlMode==0 ? uiInfoSet.valve : uiInfoSet.valve_sub;
1680  000f c60073        	ld	a,_uiInfoSet+6
1681  0012 2605          	jrne	L224
1682  0014 c60074        	ld	a,_uiInfoSet+7
1683  0017 2003          	jra	L424
1684  0019               L224:
1685  0019 c60075        	ld	a,_uiInfoSet+8
1686  001c               L424:
1687  001c 6b01          	ld	(OFST+0,sp),a
1689                     ; 423 		if( uiInfo.enc != 0 )
1691  001e c60000        	ld	a,_uiInfo
1692  0021 2731          	jreq	L713
1693                     ; 425 			ENC_MOVE_0(1, 8, 1);
1695  0023 a540          	bcp	a,#64
1696  0025 260e          	jrne	L123
1699  0027 7b01          	ld	a,(OFST+0,sp)
1700  0029 a102          	cp	a,#2
1701  002b 2404          	jruge	L323
1704  002d a608          	ld	a,#8
1706  002f 200c          	jp	LC006
1707  0031               L323:
1710  0031 0a01          	dec	(OFST+0,sp)
1712  0033 200e          	jra	L723
1713  0035               L123:
1716  0035 7b01          	ld	a,(OFST+0,sp)
1717  0037 a108          	cp	a,#8
1718  0039 2506          	jrult	L133
1721  003b a601          	ld	a,#1
1722  003d               LC006:
1723  003d 6b01          	ld	(OFST+0,sp),a
1726  003f 2002          	jra	L723
1727  0041               L133:
1730  0041 0c01          	inc	(OFST+0,sp)
1732  0043               L723:
1733                     ; 426 			if( uiInfoSet.controlMode==0 )
1736  0043 c60073        	ld	a,_uiInfoSet+6
1737  0046 2607          	jrne	L533
1738                     ; 427 				uiInfoSet.valve = i;
1740  0048 7b01          	ld	a,(OFST+0,sp)
1741  004a c70074        	ld	_uiInfoSet+7,a
1743  004d 2005          	jra	L713
1744  004f               L533:
1745                     ; 429 				uiInfoSet.valve_sub = i;
1747  004f 7b01          	ld	a,(OFST+0,sp)
1748  0051 c70075        	ld	_uiInfoSet+8,a
1749  0054               L713:
1750                     ; 431 		if( _dsPrev != i )
1752  0054 c60013        	ld	a,__dsPrev
1753  0057 1101          	cp	a,(OFST+0,sp)
1754  0059 2720          	jreq	L513
1755                     ; 433 			_dsPrev = i;
1757  005b 7b01          	ld	a,(OFST+0,sp)
1758  005d c70013        	ld	__dsPrev,a
1759                     ; 434 			UI_DISP_2Digit(i);
1761  0060 5f            	clrw	x
1762  0061 97            	ld	xl,a
1763  0062 a60a          	ld	a,#10
1764  0064 62            	div	x,a
1765  0065 9f            	ld	a,xl
1766  0066 ae0200        	ldw	x,#512
1767  0069 97            	ld	xl,a
1768  006a cd0000        	call	_lcd_disp_n
1772  006d 7b01          	ld	a,(OFST+0,sp)
1773  006f 5f            	clrw	x
1774  0070 97            	ld	xl,a
1775  0071 a60a          	ld	a,#10
1776  0073 62            	div	x,a
1777  0074 ae0300        	ldw	x,#768
1778  0077 97            	ld	xl,a
1779  0078 cd0000        	call	_lcd_disp_n
1782  007b               L513:
1783                     ; 437 	if( key == 0x10 )		__UP
1785  007b 7b02          	ld	a,(OFST+1,sp)
1786  007d a110          	cp	a,#16
1787  007f 2606          	jrne	L343
1790  0081 35010000      	mov	_uiInfo,#1
1794  0085 2008          	jp	LC005
1795  0087               L343:
1796                     ; 438 	else if( key == 0x20 )	__DN
1798  0087 a120          	cp	a,#32
1799  0089 2609          	jrne	L743
1802  008b 35400000      	mov	_uiInfo,#64
1805  008f               LC005:
1807  008f 0f02          	clr	(OFST+1,sp)
1810  0091 cc000f        	jra	L172
1811  0094               L743:
1812                     ; 439 	else if( key == 4 )	
1814  0094 a104          	cp	a,#4
1815  0096 261e          	jrne	L543
1816                     ; 442 		if( uiInfoSet.controlMode==0 )
1818  0098 c60073        	ld	a,_uiInfoSet+6
1819  009b 2607          	jrne	L553
1820                     ; 443 			uiInfoSet.cnt = uiInfoSet.valve;
1822  009d 550074006f    	mov	_uiInfoSet+2,_uiInfoSet+7
1824  00a2 2005          	jra	L753
1825  00a4               L553:
1826                     ; 445 			uiInfoSet.cnt_sub = uiInfoSet.valve_sub;
1828  00a4 5500750070    	mov	_uiInfoSet+3,_uiInfoSet+8
1829  00a9               L753:
1830                     ; 446 		STATUS_NEXT(next);	
1832  00a9 7b03          	ld	a,(OFST+2,sp)
1833  00ab c70011        	ld	__ds,a
1836  00ae 725f0012      	clr	__dsCount
1839  00b2 35ff0013      	mov	__dsPrev,#255
1841  00b6               L543:
1842                     ; 448 }
1845  00b6 5b03          	addw	sp,#3
1846  00b8 81            	ret	
1911                     ; 450 void	disp_status_toffset(uint8_t key, uint8_t next)
1911                     ; 451 {
1912                     .text:	section	.text,new
1913  0000               _disp_status_toffset:
1915  0000 89            	pushw	x
1916  0001 88            	push	a
1917       00000001      OFST:	set	1
1920                     ; 453 	if( _dsCount == 0 )
1922  0002 c60012        	ld	a,__dsCount
1923  0005 2620          	jrne	L163
1924                     ; 455 		disp_next();
1926  0007 cd0000        	call	_disp_next
1928                     ; 456 		LCD_BIT_SET(bP19);
1930  000a c60029        	ld	a,_iLF_DEF+41
1931  000d 5f            	clrw	x
1932  000e 97            	ld	xl,a
1933  000f d6540c        	ld	a,(21516,x)
1934  0012 ca0029        	or	a,_bLF_DEF+41
1935  0015 d7540c        	ld	(21516,x),a
1936                     ; 458 		if( uiInfoSet.tOffset == 0 )
1938  0018 c60078        	ld	a,_uiInfoSet+11
1939  001b 2703cc00b3    	jrne	L114
1940                     ; 459 			uiInfoSet.tOffset = 100;
1942  0020 35640078      	mov	_uiInfoSet+11,#100
1943  0024 cc00b3        	jra	L114
1944  0027               L163:
1945                     ; 463 EncEntry:		
1945                     ; 464 		i = uiInfoSet.tOffset;
1947  0027 c60078        	ld	a,_uiInfoSet+11
1948  002a 6b01          	ld	(OFST+0,sp),a
1950                     ; 465 		if( uiInfo.enc != 0 )
1952  002c c60000        	ld	a,_uiInfo
1953  002f 2747          	jreq	L314
1954                     ; 467 			if( (uiInfo.enc & 0x40) == 0 )
1956  0031 a540          	bcp	a,#64
1957  0033 261c          	jrne	L514
1958                     ; 469 				if( i > 100 )			i -= 2;
1960  0035 7b01          	ld	a,(OFST+0,sp)
1961  0037 a165          	cp	a,#101
1964  0039 2434          	jruge	L144
1965                     ; 470 				else if( i == 100 )		i = 2;
1967  003b a164          	cp	a,#100
1968  003d 2604          	jrne	L324
1971  003f a602          	ld	a,#2
1973  0041 2020          	jp	LC009
1974  0043               L324:
1975                     ; 473 					i += 2;
1977  0043 0c01          	inc	(OFST+0,sp)
1978  0045 0c01          	inc	(OFST+0,sp)
1980                     ; 474 					if( i >= 18 )		i = 18;
1982  0047 7b01          	ld	a,(OFST+0,sp)
1983  0049 a112          	cp	a,#18
1984  004b 2528          	jrult	L134
1987  004d a612          	ld	a,#18
1988  004f 2012          	jp	LC009
1989  0051               L514:
1990                     ; 479 				if( i >= 100 )
1992  0051 7b01          	ld	a,(OFST+0,sp)
1993  0053 a164          	cp	a,#100
1994  0055 2510          	jrult	L334
1995                     ; 481 					i += 2;
1997  0057 0c01          	inc	(OFST+0,sp)
1998  0059 0c01          	inc	(OFST+0,sp)
2000                     ; 482 					if( i >= 118 )		i = 118;
2002  005b 7b01          	ld	a,(OFST+0,sp)
2003  005d a176          	cp	a,#118
2004  005f 2514          	jrult	L134
2007  0061 a676          	ld	a,#118
2008  0063               LC009:
2009  0063 6b01          	ld	(OFST+0,sp),a
2011  0065 200e          	jra	L134
2012  0067               L334:
2013                     ; 486 					if( i == 2 )		i = 100;
2015  0067 a102          	cp	a,#2
2016  0069 2604          	jrne	L144
2019  006b a664          	ld	a,#100
2021  006d 20f4          	jp	LC009
2022  006f               L144:
2023                     ; 488 						i -= 2;
2026  006f 0a01          	dec	(OFST+0,sp)
2027  0071 0a01          	dec	(OFST+0,sp)
2029  0073 7b01          	ld	a,(OFST+0,sp)
2030  0075               L134:
2031                     ; 491 			uiInfoSet.tOffset = i;
2033  0075 c70078        	ld	_uiInfoSet+11,a
2034  0078               L314:
2035                     ; 493 		if( _dsPrev != i )
2037  0078 c60013        	ld	a,__dsPrev
2038  007b 1101          	cp	a,(OFST+0,sp)
2039  007d 2734          	jreq	L114
2040                     ; 495 			_dsPrev = i;
2042  007f 7b01          	ld	a,(OFST+0,sp)
2043  0081 c70013        	ld	__dsPrev,a
2044                     ; 496 			clear_npos2();
2046  0084 cd0000        	call	_clear_npos2
2048                     ; 497 			if( i < 100 && i != 0 )
2050  0087 7b01          	ld	a,(OFST+0,sp)
2051  0089 a164          	cp	a,#100
2052  008b 2414          	jruge	L744
2054  008d 0d01          	tnz	(OFST+0,sp)
2055  008f 2710          	jreq	L744
2056                     ; 499 				LCD_BIT_SET(b3G);
2058  0091 c6001e        	ld	a,_iLF_DEF+30
2059  0094 5f            	clrw	x
2060  0095 97            	ld	xl,a
2061  0096 d6540c        	ld	a,(21516,x)
2062  0099 ca001e        	or	a,_bLF_DEF+30
2063  009c d7540c        	ld	(21516,x),a
2064  009f 7b01          	ld	a,(OFST+0,sp)
2065  00a1               L744:
2066                     ; 501 			j = i%100;
2068  00a1 5f            	clrw	x
2069  00a2 97            	ld	xl,a
2070  00a3 a664          	ld	a,#100
2071  00a5 62            	div	x,a
2072  00a6 6b01          	ld	(OFST+0,sp),a
2074                     ; 502 			lcd_disp_n(3, j/2);
2076  00a8 5f            	clrw	x
2077  00a9 97            	ld	xl,a
2078  00aa 57            	sraw	x
2079  00ab 9f            	ld	a,xl
2080  00ac ae0300        	ldw	x,#768
2081  00af 97            	ld	xl,a
2082  00b0 cd0000        	call	_lcd_disp_n
2084  00b3               L114:
2085                     ; 505 	if( key == 0x10 )		__DN
2087  00b3 7b02          	ld	a,(OFST+1,sp)
2088  00b5 a110          	cp	a,#16
2089  00b7 2606          	jrne	L154
2092  00b9 35400000      	mov	_uiInfo,#64
2096  00bd 2008          	jp	LC007
2097  00bf               L154:
2098                     ; 506 	else if( key == 0x20 )	__UP
2100  00bf a120          	cp	a,#32
2101  00c1 2609          	jrne	L554
2104  00c3 35010000      	mov	_uiInfo,#1
2107  00c7               LC007:
2109  00c7 0f02          	clr	(OFST+1,sp)
2112  00c9 cc0027        	jra	L163
2113  00cc               L554:
2114                     ; 507 	else if( key == 4 )	
2116  00cc a104          	cp	a,#4
2117  00ce 261a          	jrne	L354
2118                     ; 514 		uiInfo.tOffset = uiInfoSet.tOffset;
2120  00d0 c60078        	ld	a,_uiInfoSet+11
2121  00d3 c70011        	ld	_uiInfo+17,a
2122                     ; 515 		FW_TOFFSET(uiInfo.tOffset);
2124  00d6 ae1400        	ldw	x,#5120
2125  00d9 97            	ld	xl,a
2126  00da cd0000        	call	_file_write
2128                     ; 516 		STATUS_NEXT(next);	
2130  00dd 7b03          	ld	a,(OFST+2,sp)
2131  00df c70011        	ld	__ds,a
2134  00e2 725f0012      	clr	__dsCount
2137  00e6 35ff0013      	mov	__dsPrev,#255
2139  00ea               L354:
2140                     ; 518 }
2143  00ea 5b03          	addw	sp,#3
2144  00ec 81            	ret	
2177                     ; 520 uint8_t	_backlight_get_index(uint8_t i)
2177                     ; 521 {
2178                     .text:	section	.text,new
2179  0000               __backlight_get_index:
2181  0000 88            	push	a
2182       00000000      OFST:	set	0
2185                     ; 522 	if( i==1 )	return 1;
2187  0001 4a            	dec	a
2188  0002 2604          	jrne	L774
2191  0004 4c            	inc	a
2194  0005 5b01          	addw	sp,#1
2195  0007 81            	ret	
2196  0008               L774:
2197                     ; 523 	if( i==4 )	return 2;
2199  0008 7b01          	ld	a,(OFST+1,sp)
2200  000a a104          	cp	a,#4
2201  000c 2605          	jrne	L105
2204  000e a602          	ld	a,#2
2207  0010 5b01          	addw	sp,#1
2208  0012 81            	ret	
2209  0013               L105:
2210                     ; 524 	if( i==8 )	return 3;
2212  0013 a108          	cp	a,#8
2213  0015 2605          	jrne	L305
2216  0017 a603          	ld	a,#3
2219  0019 5b01          	addw	sp,#1
2220  001b 81            	ret	
2221  001c               L305:
2222                     ; 525 	if( i==12 )	return 4;
2224  001c a10c          	cp	a,#12
2225  001e 2605          	jrne	L505
2228  0020 a604          	ld	a,#4
2231  0022 5b01          	addw	sp,#1
2232  0024 81            	ret	
2233  0025               L505:
2234                     ; 526 	return 5;
2236  0025 a605          	ld	a,#5
2239  0027 5b01          	addw	sp,#1
2240  0029 81            	ret	
2273                     ; 536 uint8_t	_backlight_get_code(uint8_t i)
2273                     ; 537 {
2274                     .text:	section	.text,new
2275  0000               __backlight_get_code:
2277  0000 88            	push	a
2278       00000000      OFST:	set	0
2281                     ; 538 	if( i==1 )	return 1;
2283  0001 4a            	dec	a
2284  0002 2604          	jrne	L325
2287  0004 4c            	inc	a
2290  0005 5b01          	addw	sp,#1
2291  0007 81            	ret	
2292  0008               L325:
2293                     ; 539 	if( i==2 )	return 4;
2295  0008 7b01          	ld	a,(OFST+1,sp)
2296  000a a102          	cp	a,#2
2297  000c 2605          	jrne	L525
2300  000e a604          	ld	a,#4
2303  0010 5b01          	addw	sp,#1
2304  0012 81            	ret	
2305  0013               L525:
2306                     ; 540 	if( i==3 )	return 8;
2308  0013 a103          	cp	a,#3
2309  0015 2605          	jrne	L725
2312  0017 a608          	ld	a,#8
2315  0019 5b01          	addw	sp,#1
2316  001b 81            	ret	
2317  001c               L725:
2318                     ; 541 	if( i==4 )	return 12;
2320  001c a104          	cp	a,#4
2321  001e 2605          	jrne	L135
2324  0020 a60c          	ld	a,#12
2327  0022 5b01          	addw	sp,#1
2328  0024 81            	ret	
2329  0025               L135:
2330                     ; 542 	return BACKLIGHT_MAX_LEVEL;
2332  0025 a660          	ld	a,#96
2335  0027 5b01          	addw	sp,#1
2336  0029 81            	ret	
2395                     ; 545 void disp_status_backlight2(uint8_t key, uint8_t next) 
2395                     ; 546 {
2396                     .text:	section	.text,new
2397  0000               _disp_status_backlight2:
2399  0000 89            	pushw	x
2400       00000001      OFST:	set	1
2403                     ; 550 	_backup_backlight2 = 0;
2405  0001 725f000a      	clr	__backup_backlight2
2406  0005 88            	push	a
2407                     ; 552 	if( _dsCount == 0 )
2409  0006 c60012        	ld	a,__dsCount
2410  0009 2611          	jrne	L335
2411                     ; 554 		lcd_clear(0);
2413  000b cd0000        	call	_lcd_clear
2415                     ; 555 		lcd_disp_backlight();
2417  000e cd0000        	call	_lcd_disp_backlight
2419                     ; 556 		_dsCount = 1;
2421  0011 35010012      	mov	__dsCount,#1
2422                     ; 557 		uiInfo._t = _backlight;
2424  0015 550000005f    	mov	_uiInfo+95,__backlight
2426  001a 205e          	jra	L755
2427  001c               L335:
2428                     ; 561 EncEntry:
2428                     ; 562 		i = _backlight;
2430  001c c60000        	ld	a,__backlight
2431  001f 6b01          	ld	(OFST+0,sp),a
2433                     ; 563 		i = _backlight_get_index(i);
2435  0021 cd0000        	call	__backlight_get_index
2437  0024 6b01          	ld	(OFST+0,sp),a
2439                     ; 565 		if( uiInfo.enc != 0 )
2441  0026 c60000        	ld	a,_uiInfo
2442  0029 2728          	jreq	L165
2443                     ; 569 			ENC_MOVE_0(1, 5, 1);
2445  002b a540          	bcp	a,#64
2446  002d 260e          	jrne	L365
2449  002f 7b01          	ld	a,(OFST+0,sp)
2450  0031 a102          	cp	a,#2
2451  0033 2404          	jruge	L565
2454  0035 a605          	ld	a,#5
2456  0037 200c          	jp	LC011
2457  0039               L565:
2460  0039 0a01          	dec	(OFST+0,sp)
2462  003b 200e          	jra	L175
2463  003d               L365:
2466  003d 7b01          	ld	a,(OFST+0,sp)
2467  003f a105          	cp	a,#5
2468  0041 2506          	jrult	L375
2471  0043 a601          	ld	a,#1
2472  0045               LC011:
2473  0045 6b01          	ld	(OFST+0,sp),a
2476  0047 2002          	jra	L175
2477  0049               L375:
2480  0049 0c01          	inc	(OFST+0,sp)
2482  004b               L175:
2483                     ; 570 			_backlight = _backlight_get_code(i);
2486  004b 7b01          	ld	a,(OFST+0,sp)
2487  004d cd0000        	call	__backlight_get_code
2489  0050 c70000        	ld	__backlight,a
2490  0053               L165:
2491                     ; 573 		if( _dsPrev != i )
2493  0053 c60013        	ld	a,__dsPrev
2494  0056 1101          	cp	a,(OFST+0,sp)
2495  0058 2720          	jreq	L755
2496                     ; 575 			_dsPrev = i;
2498  005a 7b01          	ld	a,(OFST+0,sp)
2499  005c c70013        	ld	__dsPrev,a
2500                     ; 577 			UI_DISP_2Digit(i);
2502  005f 5f            	clrw	x
2503  0060 97            	ld	xl,a
2504  0061 a60a          	ld	a,#10
2505  0063 62            	div	x,a
2506  0064 9f            	ld	a,xl
2507  0065 ae0200        	ldw	x,#512
2508  0068 97            	ld	xl,a
2509  0069 cd0000        	call	_lcd_disp_n
2513  006c 7b01          	ld	a,(OFST+0,sp)
2514  006e 5f            	clrw	x
2515  006f 97            	ld	xl,a
2516  0070 a60a          	ld	a,#10
2517  0072 62            	div	x,a
2518  0073 ae0300        	ldw	x,#768
2519  0076 97            	ld	xl,a
2520  0077 cd0000        	call	_lcd_disp_n
2523  007a               L755:
2524                     ; 581 	if( key == 0x10 )		__DN
2526  007a 7b02          	ld	a,(OFST+1,sp)
2527  007c a110          	cp	a,#16
2528  007e 2606          	jrne	L106
2531  0080 35400000      	mov	_uiInfo,#64
2535  0084 2008          	jp	LC010
2536  0086               L106:
2537                     ; 582 	else if( key == 0x20 )	__UP
2539  0086 a120          	cp	a,#32
2540  0088 2608          	jrne	L506
2543  008a 35010000      	mov	_uiInfo,#1
2546  008e               LC010:
2548  008e 0f02          	clr	(OFST+1,sp)
2551  0090 208a          	jra	L335
2552  0092               L506:
2553                     ; 583 	else if( key == 4 )	
2555  0092 a104          	cp	a,#4
2556  0094 2617          	jrne	L306
2557                     ; 588 		FW_BACKLIGHT(_backlight);
2559  0096 c60000        	ld	a,__backlight
2560  0099 ae2a00        	ldw	x,#10752
2561  009c 97            	ld	xl,a
2562  009d cd0000        	call	_file_write
2564                     ; 589 		STATUS_NEXT(next);	
2566  00a0 7b03          	ld	a,(OFST+2,sp)
2567  00a2 c70011        	ld	__ds,a
2570  00a5 725f0012      	clr	__dsCount
2573  00a9 35ff0013      	mov	__dsPrev,#255
2575  00ad               L306:
2576                     ; 591 }
2579  00ad 5b03          	addw	sp,#3
2580  00af 81            	ret	
2636                     ; 593 void	disp_status_run_op(uint8_t key, uint8_t next)
2636                     ; 594 {
2637                     .text:	section	.text,new
2638  0000               _disp_status_run_op:
2640  0000 89            	pushw	x
2641  0001 88            	push	a
2642       00000001      OFST:	set	1
2645                     ; 596 	if( uiInfoSet.controlMode==1 )
2647  0002 c60073        	ld	a,_uiInfoSet+6
2648  0005 4a            	dec	a
2649  0006 2603          	jrne	L536
2650                     ; 598 		STATUS_NEXT(next);	
2652  0008 9f            	ld	a,xl
2655                     ; 599 		return;
2658  0009 2060          	jp	LC013
2659  000b               L536:
2660                     ; 601 	if( _dsCount == 0 )
2662  000b c60012        	ld	a,__dsCount
2663  000e 2608          	jrne	L316
2664                     ; 603 		disp_next();
2666  0010 cd0000        	call	_disp_next
2668                     ; 604 		lcd_disp_setup_cntl_op();
2670  0013 cd0000        	call	_lcd_disp_setup_cntl_op
2673  0016 2035          	jra	L146
2674  0018               L316:
2675                     ; 608 EncEntry:		
2675                     ; 609 		i = uiInfoSet.opMode;
2677  0018 c60071        	ld	a,_uiInfoSet+4
2678  001b 6b01          	ld	(OFST+0,sp),a
2680                     ; 610 		if( uiInfo.enc != 0 )
2682  001d c60000        	ld	a,_uiInfo
2683  0020 270d          	jreq	L346
2684                     ; 612 			i = i==0 ? 1 : 0;
2686  0022 7b01          	ld	a,(OFST+0,sp)
2687  0024 2603          	jrne	L674
2688  0026 4c            	inc	a
2689  0027 2001          	jra	L005
2690  0029               L674:
2691  0029 4f            	clr	a
2692  002a               L005:
2693  002a 6b01          	ld	(OFST+0,sp),a
2695                     ; 613 			uiInfoSet.opMode = i;
2697  002c c70071        	ld	_uiInfoSet+4,a
2698  002f               L346:
2699                     ; 615 		if( _dsPrev != i )
2701  002f c60013        	ld	a,__dsPrev
2702  0032 1101          	cp	a,(OFST+0,sp)
2703  0034 2717          	jreq	L146
2704                     ; 617 			_dsPrev = i;
2706  0036 7b01          	ld	a,(OFST+0,sp)
2707  0038 c70013        	ld	__dsPrev,a
2708                     ; 618 			clear_npos2();
2710  003b cd0000        	call	_clear_npos2
2712                     ; 619 			if( i==0 )		lcd_disp_setup_cntl_on();
2714  003e 7b01          	ld	a,(OFST+0,sp)
2715  0040 2605          	jrne	L746
2718  0042 cd0000        	call	_lcd_disp_setup_cntl_on
2721  0045 2006          	jra	L146
2722  0047               L746:
2723                     ; 620 			else if( i==1 )	lcd_disp_setup_cntl_po();
2725  0047 4a            	dec	a
2726  0048 2603          	jrne	L146
2729  004a cd0000        	call	_lcd_disp_setup_cntl_po
2731  004d               L146:
2732                     ; 623 	if( key == 0x10 )		__DN
2734  004d 7b02          	ld	a,(OFST+1,sp)
2735  004f a110          	cp	a,#16
2736  0051 2606          	jrne	L556
2739  0053 35400000      	mov	_uiInfo,#64
2743  0057 2008          	jp	LC012
2744  0059               L556:
2745                     ; 624 	else if( key == 0x20 )	__UP
2747  0059 a120          	cp	a,#32
2748  005b 2608          	jrne	L166
2751  005d 35010000      	mov	_uiInfo,#1
2754  0061               LC012:
2756  0061 0f02          	clr	(OFST+1,sp)
2759  0063 20b3          	jra	L316
2760  0065               L166:
2761                     ; 625 	else if( key == 4 )		
2763  0065 a104          	cp	a,#4
2764  0067 260d          	jrne	L756
2765                     ; 627 		STATUS_NEXT(next);	
2767  0069 7b03          	ld	a,(OFST+2,sp)
2772  006b               LC013:
2773  006b c70011        	ld	__ds,a
2775  006e 725f0012      	clr	__dsCount
2777  0072 35ff0013      	mov	__dsPrev,#255
2779  0076               L756:
2780                     ; 629 }
2783  0076 5b03          	addw	sp,#3
2784  0078 81            	ret	
2841                     ; 631 void	disp_status_cntl_op(uint8_t key, uint8_t next)
2841                     ; 632 {
2842                     .text:	section	.text,new
2843  0000               _disp_status_cntl_op:
2845  0000 89            	pushw	x
2846  0001 88            	push	a
2847       00000001      OFST:	set	1
2850                     ; 634 	if( uiInfoSet.controlMode==1 )
2852  0002 c60073        	ld	a,_uiInfoSet+6
2853  0005 4a            	dec	a
2854  0006 2603          	jrne	L117
2855                     ; 636 		STATUS_NEXT(next);	
2857  0008 9f            	ld	a,xl
2860                     ; 637 		return;
2863  0009 205d          	jp	LC015
2864  000b               L117:
2865                     ; 639 	if( _dsCount == 0 )
2867  000b c60012        	ld	a,__dsCount
2868  000e 2608          	jrne	L766
2869                     ; 641 		disp_next();
2871  0010 cd0000        	call	_disp_next
2873                     ; 642 		lcd_disp_setup_mode();
2875  0013 cd0000        	call	_lcd_disp_setup_mode
2878  0016 2032          	jra	L517
2879  0018               L766:
2880                     ; 646 EncEntry:		
2880                     ; 647 		i = uiInfoSet.cntlMode;
2882  0018 c6006d        	ld	a,_uiInfoSet
2883  001b 6b01          	ld	(OFST+0,sp),a
2885                     ; 648 		if( uiInfo.enc != 0 )
2887  001d c60000        	ld	a,_uiInfo
2888  0020 270d          	jreq	L717
2889                     ; 650 			i = i==0 ? 1 : 0;
2891  0022 7b01          	ld	a,(OFST+0,sp)
2892  0024 2603          	jrne	L025
2893  0026 4c            	inc	a
2894  0027 2001          	jra	L225
2895  0029               L025:
2896  0029 4f            	clr	a
2897  002a               L225:
2898  002a 6b01          	ld	(OFST+0,sp),a
2900                     ; 651 			uiInfoSet.cntlMode = i;
2902  002c c7006d        	ld	_uiInfoSet,a
2903  002f               L717:
2904                     ; 653 		if( _dsPrev != i )
2906  002f c60013        	ld	a,__dsPrev
2907  0032 1101          	cp	a,(OFST+0,sp)
2908  0034 2714          	jreq	L517
2909                     ; 655 			_dsPrev = i;
2911  0036 7b01          	ld	a,(OFST+0,sp)
2912  0038 c70013        	ld	__dsPrev,a
2913                     ; 656 			clear_npos2();
2915  003b cd0000        	call	_clear_npos2
2917                     ; 657 			if( i == 0 )	lcd_disp_setup_mode_local();
2919  003e 7b01          	ld	a,(OFST+0,sp)
2920  0040 2605          	jrne	L327
2923  0042 cd0000        	call	_lcd_disp_setup_mode_local
2926  0045 2003          	jra	L517
2927  0047               L327:
2928                     ; 658 			else			lcd_disp_setup_mode_each();
2930  0047 cd0000        	call	_lcd_disp_setup_mode_each
2932  004a               L517:
2933                     ; 661 	if( key == 0x10 )		__DN
2935  004a 7b02          	ld	a,(OFST+1,sp)
2936  004c a110          	cp	a,#16
2937  004e 2606          	jrne	L727
2940  0050 35400000      	mov	_uiInfo,#64
2944  0054 2008          	jp	LC014
2945  0056               L727:
2946                     ; 662 	else if( key == 0x20 )	__UP
2948  0056 a120          	cp	a,#32
2949  0058 2608          	jrne	L337
2952  005a 35010000      	mov	_uiInfo,#1
2955  005e               LC014:
2957  005e 0f02          	clr	(OFST+1,sp)
2960  0060 20b6          	jra	L766
2961  0062               L337:
2962                     ; 663 	else if( key == 4 )		
2964  0062 a104          	cp	a,#4
2965  0064 260d          	jrne	L137
2966                     ; 665 		STATUS_NEXT(next);	
2968  0066 7b03          	ld	a,(OFST+2,sp)
2973  0068               LC015:
2974  0068 c70011        	ld	__ds,a
2976  006b 725f0012      	clr	__dsCount
2978  006f 35ff0013      	mov	__dsPrev,#255
2980  0073               L137:
2981                     ; 667 }
2984  0073 5b03          	addw	sp,#3
2985  0075 81            	ret	
3040                     ; 669 void	disp_status_houseCapa(uint8_t key, uint8_t next)
3040                     ; 670 {
3041                     .text:	section	.text,new
3042  0000               _disp_status_houseCapa:
3044  0000 89            	pushw	x
3045  0001 88            	push	a
3046       00000001      OFST:	set	1
3049                     ; 672 	if(uiInfoSet.cntlMode != 0 )	
3051  0002 c6006d        	ld	a,_uiInfoSet
3052  0005 2704          	jreq	L367
3053                     ; 675 		STATUS_NEXT(next);
3055  0007 9f            	ld	a,xl
3058                     ; 676 		return;
3061  0008 cc00a0        	jp	LC017
3062  000b               L367:
3063                     ; 679 	if( _dsCount == 0 )
3065  000b c60012        	ld	a,__dsCount
3066  000e 2608          	jrne	L147
3067                     ; 681 		disp_next();
3069  0010 cd0000        	call	_disp_next
3071                     ; 682 		lcd_disp_setup_len();
3073  0013 cd0000        	call	_lcd_disp_setup_len
3076  0016 2069          	jra	L767
3077  0018               L147:
3078                     ; 686 EncEntry:		
3078                     ; 687 		i = uiInfoSet.houseCapa;
3080  0018 c60077        	ld	a,_uiInfoSet+10
3081  001b 6b01          	ld	(OFST+0,sp),a
3083                     ; 688 		if( uiInfo.enc != 0 )
3085  001d c60000        	ld	a,_uiInfo
3086  0020 271f          	jreq	L177
3087                     ; 690 			if( (uiInfo.enc & 0x40) == 0 )	i--;
3089  0022 a540          	bcp	a,#64
3090  0024 2604          	jrne	L377
3093  0026 0a01          	dec	(OFST+0,sp)
3096  0028 2002          	jra	L577
3097  002a               L377:
3098                     ; 692 				i++;
3100  002a 0c01          	inc	(OFST+0,sp)
3102  002c               L577:
3103                     ; 693 			if( i < 70 )	i = 200;
3105  002c 7b01          	ld	a,(OFST+0,sp)
3106  002e a146          	cp	a,#70
3107  0030 2404          	jruge	L777
3110  0032 a6c8          	ld	a,#200
3111  0034 6b01          	ld	(OFST+0,sp),a
3113  0036               L777:
3114                     ; 694 			if( i > 200 )	i = 70;
3116  0036 a1c9          	cp	a,#201
3117  0038 2504          	jrult	L1001
3120  003a a646          	ld	a,#70
3121  003c 6b01          	ld	(OFST+0,sp),a
3123  003e               L1001:
3124                     ; 695 			uiInfoSet.houseCapa = i;
3126  003e c70077        	ld	_uiInfoSet+10,a
3127  0041               L177:
3128                     ; 697 		if( _dsPrev != i )
3130  0041 c60013        	ld	a,__dsPrev
3131  0044 1101          	cp	a,(OFST+0,sp)
3132  0046 2739          	jreq	L767
3133                     ; 699 			_dsPrev = i;
3135  0048 7b01          	ld	a,(OFST+0,sp)
3136  004a c70013        	ld	__dsPrev,a
3137                     ; 700 			UI_DISP_3Digit(i);
3139  004d 5f            	clrw	x
3140  004e 97            	ld	xl,a
3141  004f a664          	ld	a,#100
3142  0051 62            	div	x,a
3143  0052 9f            	ld	a,xl
3144  0053 ae0100        	ldw	x,#256
3145  0056 97            	ld	xl,a
3146  0057 cd0000        	call	_lcd_disp_n
3150  005a 7b01          	ld	a,(OFST+0,sp)
3151  005c 5f            	clrw	x
3152  005d 97            	ld	xl,a
3153  005e a664          	ld	a,#100
3154  0060 62            	div	x,a
3155  0061 5f            	clrw	x
3156  0062 97            	ld	xl,a
3157  0063 01            	rrwa	x,a
3158  0064 6b01          	ld	(OFST+0,sp),a
3162  0066 5f            	clrw	x
3163  0067 97            	ld	xl,a
3164  0068 a60a          	ld	a,#10
3165  006a 62            	div	x,a
3166  006b 9f            	ld	a,xl
3167  006c ae0200        	ldw	x,#512
3168  006f 97            	ld	xl,a
3169  0070 cd0000        	call	_lcd_disp_n
3173  0073 7b01          	ld	a,(OFST+0,sp)
3174  0075 5f            	clrw	x
3175  0076 97            	ld	xl,a
3176  0077 a60a          	ld	a,#10
3177  0079 62            	div	x,a
3178  007a ae0300        	ldw	x,#768
3179  007d 97            	ld	xl,a
3180  007e cd0000        	call	_lcd_disp_n
3183  0081               L767:
3184                     ; 703 	if( key == 0x10 )		__DN
3186  0081 7b02          	ld	a,(OFST+1,sp)
3187  0083 a110          	cp	a,#16
3188  0085 2606          	jrne	L5001
3191  0087 35400000      	mov	_uiInfo,#64
3195  008b 2008          	jp	LC016
3196  008d               L5001:
3197                     ; 704 	else if( key == 0x20 )	__UP
3199  008d a120          	cp	a,#32
3200  008f 2609          	jrne	L1101
3203  0091 35010000      	mov	_uiInfo,#1
3206  0095               LC016:
3208  0095 0f02          	clr	(OFST+1,sp)
3211  0097 cc0018        	jra	L147
3212  009a               L1101:
3213                     ; 705 	else if( key == 4 )		
3215  009a a104          	cp	a,#4
3216  009c 260d          	jrne	L7001
3217                     ; 707 		STATUS_NEXT(next);	
3219  009e 7b03          	ld	a,(OFST+2,sp)
3224  00a0               LC017:
3225  00a0 c70011        	ld	__ds,a
3227  00a3 725f0012      	clr	__dsCount
3229  00a7 35ff0013      	mov	__dsPrev,#255
3231  00ab               L7001:
3232                     ; 709 }
3235  00ab 5b03          	addw	sp,#3
3236  00ad 81            	ret	
3269                     ; 711 void	disp_status_po_type(uint8_t key, uint8_t next)
3269                     ; 712 {
3270                     .text:	section	.text,new
3271  0000               _disp_status_po_type:
3275                     ; 757 }
3278  0000 81            	ret	
3281                     	switch	.const
3282  0012               ___lpm:
3283  0012 00            	dc.b	0
3284  0013 08            	dc.b	8
3285  0014 0a            	dc.b	10
3286  0015 0f            	dc.b	15
3287  0016 14            	dc.b	20
3288  0017 19            	dc.b	25
3289  0018 1e            	dc.b	30
3290  0019 63            	dc.b	99
3291  001a 63            	dc.b	99
3345                     ; 764 void	disp_status_lpm(uint8_t key, uint8_t next)
3345                     ; 765 {
3346                     .text:	section	.text,new
3347  0000               _disp_status_lpm:
3349  0000 89            	pushw	x
3350  0001 88            	push	a
3351       00000001      OFST:	set	1
3354                     ; 768 	if( uiInfoSet.cntlMode == 1 )
3356  0002 c6006d        	ld	a,_uiInfoSet
3357  0005 4a            	dec	a
3358  0006 2604          	jrne	L5501
3359                     ; 770 		STATUS_NEXT(next);
3361  0008 9f            	ld	a,xl
3364                     ; 771 		return;
3367  0009 cc00a3        	jp	LC019
3368  000c               L5501:
3369                     ; 773 	if( _dsCount == 0 )
3371  000c c60012        	ld	a,__dsCount
3372  000f 2608          	jrne	L3301
3373                     ; 775 		disp_next();
3375  0011 cd0000        	call	_disp_next
3377                     ; 776 		lcd_disp_setup_lpm();
3379  0014 cd0000        	call	_lcd_disp_setup_lpm
3382  0017 206b          	jra	L1601
3383  0019               L3301:
3384                     ; 780 EncEntry:		
3384                     ; 781 		i = uiInfoSet.controlMode==1 ? uiInfoSet.lpmType_sub : uiInfoSet.lpmType;
3386  0019 c60073        	ld	a,_uiInfoSet+6
3387  001c 4a            	dec	a
3388  001d 2605          	jrne	L265
3389  001f c6007b        	ld	a,_uiInfoSet+14
3390  0022 2003          	jra	L465
3391  0024               L265:
3392  0024 c6007a        	ld	a,_uiInfoSet+13
3393  0027               L465:
3394  0027 6b01          	ld	(OFST+0,sp),a
3396                     ; 783 		if( uiInfo.enc != 0 )
3398  0029 c60000        	ld	a,_uiInfo
3399  002c 2730          	jreq	L3601
3400                     ; 785 			if( (uiInfo.enc & 0x40) == 0 )
3402  002e a540          	bcp	a,#64
3403  0030 260e          	jrne	L5601
3404                     ; 787 				if( i==0 )	i = 7;
3406  0032 7b01          	ld	a,(OFST+0,sp)
3407  0034 2606          	jrne	L7601
3410  0036 a607          	ld	a,#7
3411  0038 6b01          	ld	(OFST+0,sp),a
3414  003a 2010          	jra	L3701
3415  003c               L7601:
3416                     ; 789 					i--;
3418  003c 0a01          	dec	(OFST+0,sp)
3420  003e 200c          	jra	L3701
3421  0040               L5601:
3422                     ; 793 				if( i==7 )	i = 0;
3424  0040 7b01          	ld	a,(OFST+0,sp)
3425  0042 a107          	cp	a,#7
3426  0044 2604          	jrne	L5701
3429  0046 0f01          	clr	(OFST+0,sp)
3432  0048 2002          	jra	L3701
3433  004a               L5701:
3434                     ; 795 					i++;
3436  004a 0c01          	inc	(OFST+0,sp)
3438  004c               L3701:
3439                     ; 797 			if( uiInfoSet.controlMode==1 )
3441  004c c60073        	ld	a,_uiInfoSet+6
3442  004f 4a            	dec	a
3443  0050 2607          	jrne	L1011
3444                     ; 798 				uiInfoSet.lpmType_sub = i;
3446  0052 7b01          	ld	a,(OFST+0,sp)
3447  0054 c7007b        	ld	_uiInfoSet+14,a
3449  0057 2005          	jra	L3601
3450  0059               L1011:
3451                     ; 800 				uiInfoSet.lpmType = i;
3453  0059 7b01          	ld	a,(OFST+0,sp)
3454  005b c7007a        	ld	_uiInfoSet+13,a
3455  005e               L3601:
3456                     ; 802 		if( _dsPrev != i )
3458  005e c60013        	ld	a,__dsPrev
3459  0061 1101          	cp	a,(OFST+0,sp)
3460  0063 271f          	jreq	L1601
3461                     ; 804 			_dsPrev = i;
3463  0065 7b01          	ld	a,(OFST+0,sp)
3464  0067 c70013        	ld	__dsPrev,a
3465                     ; 805 			clear_npos2();
3467  006a cd0000        	call	_clear_npos2
3469                     ; 806 			UI_DISP_2Digit(__lpm[i]);
3471  006d 7b01          	ld	a,(OFST+0,sp)
3472  006f ad40          	call	LC020
3473  0071 9f            	ld	a,xl
3474  0072 ae0200        	ldw	x,#512
3475  0075 97            	ld	xl,a
3476  0076 cd0000        	call	_lcd_disp_n
3480  0079 7b01          	ld	a,(OFST+0,sp)
3481  007b ad34          	call	LC020
3482  007d ae0300        	ldw	x,#768
3483  0080 97            	ld	xl,a
3484  0081 cd0000        	call	_lcd_disp_n
3487  0084               L1601:
3488                     ; 809 	if( key == 0x10 )		__DN
3490  0084 7b02          	ld	a,(OFST+1,sp)
3491  0086 a110          	cp	a,#16
3492  0088 2606          	jrne	L7011
3495  008a 35400000      	mov	_uiInfo,#64
3499  008e 2008          	jp	LC018
3500  0090               L7011:
3501                     ; 810 	else if( key == 0x20 )	__UP
3503  0090 a120          	cp	a,#32
3504  0092 2609          	jrne	L3111
3507  0094 35010000      	mov	_uiInfo,#1
3510  0098               LC018:
3512  0098 0f02          	clr	(OFST+1,sp)
3515  009a cc0019        	jra	L3301
3516  009d               L3111:
3517                     ; 811 	else if( key == 4 )		
3519  009d a104          	cp	a,#4
3520  009f 260d          	jrne	L1111
3521                     ; 813 		STATUS_NEXT(next);	
3523  00a1 7b03          	ld	a,(OFST+2,sp)
3528  00a3               LC019:
3529  00a3 c70011        	ld	__ds,a
3531  00a6 725f0012      	clr	__dsCount
3533  00aa 35ff0013      	mov	__dsPrev,#255
3535  00ae               L1111:
3536                     ; 815 }
3539  00ae 5b03          	addw	sp,#3
3540  00b0 81            	ret	
3541  00b1               LC020:
3542  00b1 5f            	clrw	x
3543  00b2 97            	ld	xl,a
3544  00b3 d60012        	ld	a,(___lpm,x)
3545  00b6 5f            	clrw	x
3546  00b7 97            	ld	xl,a
3547  00b8 a60a          	ld	a,#10
3548  00ba 62            	div	x,a
3549  00bb 81            	ret	
3582                     ; 817 void	disp_status_temp_offset(uint8_t key, uint8_t next)
3582                     ; 818 {
3583                     .text:	section	.text,new
3584  0000               _disp_status_temp_offset:
3588                     ; 857 }
3591  0000 81            	ret	
3594                     	switch	.data
3595  0016               __ui_:
3596  0016 00            	dc.b	0
3676                     ; 865 void	disp_status_valveinfo_sub(uint8_t key, uint8_t next, uint8_t prev)
3676                     ; 866 {
3677                     .text:	section	.text,new
3678  0000               _disp_status_valveinfo_sub:
3680  0000 89            	pushw	x
3681  0001 520c          	subw	sp,#12
3682       0000000c      OFST:	set	12
3685                     ; 869 	if( _dsCount == 0 )
3687  0003 c60012        	ld	a,__dsCount
3688  0006 2663          	jrne	L5311
3689                     ; 871 		if( uiInfoSet.valve_sub == 0 )
3691  0008 725d0075      	tnz	_uiInfoSet+8
3692  000c 260a          	jrne	L1711
3693                     ; 873 			uiInfoSet.cnt_sub = 0;
3695  000e c70070        	ld	_uiInfoSet+3,a
3696                     ; 874 			uiInfoSet.lpmType_sub = 0;
3698  0011 c7007b        	ld	_uiInfoSet+14,a
3699                     ; 875 			STATUS_NEXT(next);	
3701  0014 9f            	ld	a,xl
3702  0015 cd01a2        	call	LC024
3704  0018               L1711:
3705                     ; 877 		disp_next();
3707  0018 cd0000        	call	_disp_next
3709                     ; 878 		lcd_disp_n(0, UI_RIDs+1);
3711  001b c600a0        	ld	a,_uiInfoSet+51
3712  001e 4c            	inc	a
3713  001f 5f            	clrw	x
3714  0020 97            	ld	xl,a
3715  0021 cd0000        	call	_lcd_disp_n
3717                     ; 879 		lcd_blink_npos(UI_RIDs+1);
3719  0024 c600a0        	ld	a,_uiInfoSet+51
3720  0027 4c            	inc	a
3721  0028 cd0000        	call	_lcd_blink_npos
3723                     ; 880 		_ui_ = uiInfoSet.valve_sub_rc[UI_RIDs];// + uiInfoSet.cnt;
3725  002b cd019c        	call	LC023
3726  002e d60094        	ld	a,(_uiInfoSet+39,x)
3727  0031 c70016        	ld	__ui_,a
3728                     ; 881 		lcd_disp_rid(_ui_, 1, 0);
3730  0034 4b00          	push	#0
3731  0036 ae0001        	ldw	x,#1
3732  0039 95            	ld	xh,a
3733  003a cd0000        	call	_lcd_disp_rid
3735  003d 84            	pop	a
3736                     ; 882 		for( i=0; i<8; i++ )
3738  003e 4f            	clr	a
3739  003f 6b0c          	ld	(OFST+0,sp),a
3741  0041               L3711:
3742                     ; 884 			if( i >= uiInfoSet.valve_sub )
3744  0041 c10075        	cp	a,_uiInfoSet+8
3745  0044 5f            	clrw	x
3746  0045 97            	ld	xl,a
3747  0046 250c          	jrult	L1021
3748                     ; 886 				uiInfoSet.valve_sub_len[i] = 0;
3750  0048 724f008c      	clr	(_uiInfoSet+31,x)
3751                     ; 887 				uiInfoSet.valve_sub_rc[i] = 0;
3753  004c 5f            	clrw	x
3754  004d 97            	ld	xl,a
3755  004e 724f0094      	clr	(_uiInfoSet+39,x)
3757  0052 200d          	jra	L3021
3758  0054               L1021:
3759                     ; 891 				if( uiInfoSet.valve_rc[i] == 0 )
3761  0054 724d0084      	tnz	(_uiInfoSet+23,x)
3762  0058 2607          	jrne	L3021
3763                     ; 892 					uiInfoSet.valve_rc[i] = 1;
3765  005a 5f            	clrw	x
3766  005b 97            	ld	xl,a
3767  005c a601          	ld	a,#1
3768  005e d70084        	ld	(_uiInfoSet+23,x),a
3769  0061               L3021:
3770                     ; 882 		for( i=0; i<8; i++ )
3772  0061 0c0c          	inc	(OFST+0,sp)
3776  0063 7b0c          	ld	a,(OFST+0,sp)
3777  0065 a108          	cp	a,#8
3778  0067 25d8          	jrult	L3711
3780  0069 2071          	jra	L7021
3781  006b               L5311:
3782                     ; 898 EncEntry:		
3782                     ; 899 		i = uiInfoSet.valve_sub_len[UI_RIDs];
3784  006b cd019c        	call	LC023
3785  006e d6008c        	ld	a,(_uiInfoSet+31,x)
3786  0071 6b0c          	ld	(OFST+0,sp),a
3788                     ; 900 		if( uiInfo.enc != 0 )
3790  0073 c60000        	ld	a,_uiInfo
3791  0076 2724          	jreq	L1121
3792                     ; 902 			if( (uiInfo.enc & 0x40) == 0 )	i--;
3794  0078 a540          	bcp	a,#64
3795  007a 2604          	jrne	L3121
3798  007c 0a0c          	dec	(OFST+0,sp)
3801  007e 2002          	jra	L5121
3802  0080               L3121:
3803                     ; 904 				i++;
3805  0080 0c0c          	inc	(OFST+0,sp)
3807  0082               L5121:
3808                     ; 905 			if( i > 150 )	i = 35;
3810  0082 7b0c          	ld	a,(OFST+0,sp)
3811  0084 a197          	cp	a,#151
3812  0086 2504          	jrult	L7121
3815  0088 a623          	ld	a,#35
3816  008a 6b0c          	ld	(OFST+0,sp),a
3818  008c               L7121:
3819                     ; 906 			if( i < 35 )	i = 150;
3821  008c a123          	cp	a,#35
3822  008e 2404          	jruge	L1221
3825  0090 a696          	ld	a,#150
3826  0092 6b0c          	ld	(OFST+0,sp),a
3828  0094               L1221:
3829                     ; 907 			uiInfoSet.valve_sub_len[UI_RIDs] = i;
3831  0094 cd019c        	call	LC023
3832  0097 7b0c          	ld	a,(OFST+0,sp)
3833  0099 d7008c        	ld	(_uiInfoSet+31,x),a
3834  009c               L1121:
3835                     ; 909 		if( _dsPrev != i )
3837  009c c60013        	ld	a,__dsPrev
3838  009f 110c          	cp	a,(OFST+0,sp)
3839  00a1 2739          	jreq	L7021
3840                     ; 911 			_dsPrev = i;
3842  00a3 7b0c          	ld	a,(OFST+0,sp)
3843  00a5 c70013        	ld	__dsPrev,a
3844                     ; 912 			UI_DISP_3Digit(i);
3846  00a8 5f            	clrw	x
3847  00a9 97            	ld	xl,a
3848  00aa a664          	ld	a,#100
3849  00ac 62            	div	x,a
3850  00ad 9f            	ld	a,xl
3851  00ae ae0100        	ldw	x,#256
3852  00b1 97            	ld	xl,a
3853  00b2 cd0000        	call	_lcd_disp_n
3857  00b5 7b0c          	ld	a,(OFST+0,sp)
3858  00b7 5f            	clrw	x
3859  00b8 97            	ld	xl,a
3860  00b9 a664          	ld	a,#100
3861  00bb 62            	div	x,a
3862  00bc 5f            	clrw	x
3863  00bd 97            	ld	xl,a
3864  00be 01            	rrwa	x,a
3865  00bf 6b0c          	ld	(OFST+0,sp),a
3869  00c1 5f            	clrw	x
3870  00c2 97            	ld	xl,a
3871  00c3 a60a          	ld	a,#10
3872  00c5 62            	div	x,a
3873  00c6 9f            	ld	a,xl
3874  00c7 ae0200        	ldw	x,#512
3875  00ca 97            	ld	xl,a
3876  00cb cd0000        	call	_lcd_disp_n
3880  00ce 7b0c          	ld	a,(OFST+0,sp)
3881  00d0 5f            	clrw	x
3882  00d1 97            	ld	xl,a
3883  00d2 a60a          	ld	a,#10
3884  00d4 62            	div	x,a
3885  00d5 ae0300        	ldw	x,#768
3886  00d8 97            	ld	xl,a
3887  00d9 cd0000        	call	_lcd_disp_n
3890  00dc               L7021:
3891                     ; 915 	if( key == 0x10 )		__DN
3893  00dc 7b0d          	ld	a,(OFST+1,sp)
3894  00de a110          	cp	a,#16
3895  00e0 2606          	jrne	L5221
3898  00e2 35400000      	mov	_uiInfo,#64
3902  00e6 2008          	jp	LC021
3903  00e8               L5221:
3904                     ; 916 	else if( key == 0x20 )	__UP
3906  00e8 a120          	cp	a,#32
3907  00ea 2609          	jrne	L1321
3910  00ec 35010000      	mov	_uiInfo,#1
3913  00f0               LC021:
3915  00f0 0f0d          	clr	(OFST+1,sp)
3918  00f2 cc006b        	jra	L5311
3919  00f5               L1321:
3920                     ; 917 	else if( key == 4 )		
3922  00f5 a104          	cp	a,#4
3923  00f7 266a          	jrne	L5321
3924                     ; 919 		lcd_blink_npos_clear();
3926  00f9 cd0000        	call	_lcd_blink_npos_clear
3928                     ; 920 		STATUS_NEXT(next);	
3930  00fc 7b0e          	ld	a,(OFST+2,sp)
3931  00fe cd01a2        	call	LC024
3932                     ; 921 		for( i=0; i<8; i++ )
3935  0101 0f0c          	clr	(OFST+0,sp)
3937  0103               L7321:
3938                     ; 922 			b[i] = 0;
3940  0103 96            	ldw	x,sp
3941  0104 1c0004        	addw	x,#OFST-8
3942  0107 9f            	ld	a,xl
3943  0108 5e            	swapw	x
3944  0109 1b0c          	add	a,(OFST+0,sp)
3945  010b 2401          	jrnc	L226
3946  010d 5c            	incw	x
3947  010e               L226:
3948  010e 02            	rlwa	x,a
3949  010f 7f            	clr	(x)
3950                     ; 921 		for( i=0; i<8; i++ )
3952  0110 0c0c          	inc	(OFST+0,sp)
3956  0112 7b0c          	ld	a,(OFST+0,sp)
3957  0114 a108          	cp	a,#8
3958  0116 25eb          	jrult	L7321
3959                     ; 923 		for( i=0; i<8; i++ )
3961  0118 4f            	clr	a
3962  0119 6b0c          	ld	(OFST+0,sp),a
3964  011b               L5421:
3965                     ; 925 			if( uiInfoSet.valve_sub_rc[i] != 0 )
3967  011b 5f            	clrw	x
3968  011c 97            	ld	xl,a
3969  011d 724d0094      	tnz	(_uiInfoSet+39,x)
3970  0121 2714          	jreq	L3521
3971                     ; 926 				b[uiInfoSet.valve_sub_rc[i]-1] = 1;
3973  0123 96            	ldw	x,sp
3974  0124 1c0004        	addw	x,#OFST-8
3975  0127 1f01          	ldw	(OFST-11,sp),x
3977  0129 5f            	clrw	x
3978  012a 97            	ld	xl,a
3979  012b d60094        	ld	a,(_uiInfoSet+39,x)
3980  012e 5f            	clrw	x
3981  012f 97            	ld	xl,a
3982  0130 5a            	decw	x
3983  0131 72fb01        	addw	x,(OFST-11,sp)
3984  0134 a601          	ld	a,#1
3985  0136 f7            	ld	(x),a
3986  0137               L3521:
3987                     ; 923 		for( i=0; i<8; i++ )
3989  0137 0c0c          	inc	(OFST+0,sp)
3993  0139 7b0c          	ld	a,(OFST+0,sp)
3994  013b a108          	cp	a,#8
3995  013d 25dc          	jrult	L5421
3996                     ; 928 		j = 0;
3998  013f 0f03          	clr	(OFST-9,sp)
4000                     ; 929 		for( i=0; i<8; i++ )
4002  0141 0f0c          	clr	(OFST+0,sp)
4004  0143               L5521:
4005                     ; 931 			if( b[i] != 0 )
4007  0143 96            	ldw	x,sp
4008  0144 1c0004        	addw	x,#OFST-8
4009  0147 9f            	ld	a,xl
4010  0148 5e            	swapw	x
4011  0149 1b0c          	add	a,(OFST+0,sp)
4012  014b 2401          	jrnc	L426
4013  014d 5c            	incw	x
4014  014e               L426:
4015  014e 02            	rlwa	x,a
4016  014f f6            	ld	a,(x)
4017  0150 2702          	jreq	L3621
4018                     ; 932 				j++;
4020  0152 0c03          	inc	(OFST-9,sp)
4022  0154               L3621:
4023                     ; 929 		for( i=0; i<8; i++ )
4025  0154 0c0c          	inc	(OFST+0,sp)
4029  0156 7b0c          	ld	a,(OFST+0,sp)
4030  0158 a108          	cp	a,#8
4031  015a 25e7          	jrult	L5521
4032                     ; 934 		uiInfoSet.cnt_sub = j;
4034  015c 7b03          	ld	a,(OFST-9,sp)
4035  015e c70070        	ld	_uiInfoSet+3,a
4037  0161 2036          	jra	L7221
4038  0163               L5321:
4039                     ; 936 	else if( key == 8 )
4041  0163 a108          	cp	a,#8
4042  0165 2618          	jrne	L7621
4043                     ; 938 		uiInfoSet.valve_sub_rc[UI_RIDs]++;
4045  0167 ad33          	call	LC023
4046  0169 724c0094      	inc	(_uiInfoSet+39,x)
4047                     ; 939 		if( uiInfoSet.valve_sub_rc[UI_RIDs] > 8 )
4049  016d 5f            	clrw	x
4050  016e 97            	ld	xl,a
4051  016f d60094        	ld	a,(_uiInfoSet+39,x)
4052  0172 a109          	cp	a,#9
4053  0174 251f          	jrult	L7721
4054                     ; 940 			uiInfoSet.valve_sub_rc[UI_RIDs] = 1;
4056  0176 ad24          	call	LC023
4057  0178 a601          	ld	a,#1
4058  017a d70094        	ld	(_uiInfoSet+39,x),a
4059                     ; 947 		STATUS_NEXT(prev);
4064  017d 2016          	jp	L7721
4065  017f               L7621:
4066                     ; 949 	else if( key == 1 )
4068  017f 4a            	dec	a
4069  0180 2617          	jrne	L7221
4070                     ; 951 		lcd_blink_npos_clear();
4072  0182 cd0000        	call	_lcd_blink_npos_clear
4074                     ; 952 		UI_RIDs++;
4076  0185 725c00a0      	inc	_uiInfoSet+51
4077                     ; 953 		if( UI_RIDs >= uiInfoSet.valve_sub )
4079  0189 c600a0        	ld	a,_uiInfoSet+51
4080  018c c10075        	cp	a,_uiInfoSet+8
4081  018f 2504          	jrult	L7721
4082                     ; 954 			UI_RIDs = 0;
4084  0191 725f00a0      	clr	_uiInfoSet+51
4085  0195               L7721:
4086                     ; 955 		STATUS_NEXT(prev);
4093  0195 7b11          	ld	a,(OFST+5,sp)
4094  0197 ad09          	call	LC024
4096  0199               L7221:
4097                     ; 957 }
4100  0199 5b0e          	addw	sp,#14
4101  019b 81            	ret	
4102  019c               LC023:
4103  019c c600a0        	ld	a,_uiInfoSet+51
4104  019f 5f            	clrw	x
4105  01a0 97            	ld	xl,a
4106  01a1 81            	ret	
4107  01a2               LC024:
4108  01a2 c70011        	ld	__ds,a
4110  01a5 725f0012      	clr	__dsCount
4112  01a9 35ff0013      	mov	__dsPrev,#255
4113  01ad 81            	ret	
4196                     ; 959 void	disp_status_valveinfo(uint8_t key, uint8_t next, uint8_t prev)
4196                     ; 960 {
4197                     .text:	section	.text,new
4198  0000               _disp_status_valveinfo:
4200  0000 89            	pushw	x
4201  0001 520c          	subw	sp,#12
4202       0000000c      OFST:	set	12
4205                     ; 963 	if( uiInfoSet.controlMode==1 )
4207  0003 c60073        	ld	a,_uiInfoSet+6
4208  0006 4a            	dec	a
4209  0007 260d          	jrne	L3331
4210                     ; 965 		disp_status_valveinfo_sub(key, next, prev);
4212  0009 7b11          	ld	a,(OFST+5,sp)
4213  000b 88            	push	a
4214  000c 7b0e          	ld	a,(OFST+2,sp)
4215  000e 95            	ld	xh,a
4216  000f cd0000        	call	_disp_status_valveinfo_sub
4218  0012 84            	pop	a
4219                     ; 966 		return;
4221  0013 cc01bb        	jra	L5731
4222  0016               L3331:
4223                     ; 968 	if( _dsCount == 0 )
4225  0016 c60012        	ld	a,__dsCount
4226  0019 2664          	jrne	L1031
4227                     ; 970 		if( uiInfoSet.valve == 0 )
4229  001b 725d0074      	tnz	_uiInfoSet+7
4230  001f 260b          	jrne	L7331
4231                     ; 972 			uiInfoSet.cnt = 0;
4233  0021 c7006f        	ld	_uiInfoSet+2,a
4234                     ; 973 			uiInfoSet.lpmType = 0;
4236  0024 c7007a        	ld	_uiInfoSet+13,a
4237                     ; 974 			STATUS_NEXT(next);	
4239  0027 7b0e          	ld	a,(OFST+2,sp)
4240  0029 cd01c4        	call	LC028
4242  002c               L7331:
4243                     ; 976 		disp_next();
4245  002c cd0000        	call	_disp_next
4247                     ; 977 		lcd_disp_n(0, UI_RID+1);
4249  002f c6009e        	ld	a,_uiInfoSet+49
4250  0032 4c            	inc	a
4251  0033 5f            	clrw	x
4252  0034 97            	ld	xl,a
4253  0035 cd0000        	call	_lcd_disp_n
4255                     ; 978 		lcd_blink_npos(UI_RID+1);
4257  0038 c6009e        	ld	a,_uiInfoSet+49
4258  003b 4c            	inc	a
4259  003c cd0000        	call	_lcd_blink_npos
4261                     ; 979 		_ui_ = uiInfoSet.valve_rc[UI_RID];
4263  003f cd01be        	call	LC027
4264  0042 d60084        	ld	a,(_uiInfoSet+23,x)
4265  0045 c70016        	ld	__ui_,a
4266                     ; 980 		lcd_disp_rid(_ui_, 1, 0);
4268  0048 4b00          	push	#0
4269  004a ae0001        	ldw	x,#1
4270  004d 95            	ld	xh,a
4271  004e cd0000        	call	_lcd_disp_rid
4273  0051 84            	pop	a
4274                     ; 981 		for( i=0; i<8; i++ )
4276  0052 4f            	clr	a
4277  0053 6b0c          	ld	(OFST+0,sp),a
4279  0055               L1431:
4280                     ; 983 			if( i >= uiInfoSet.valve )
4282  0055 c10074        	cp	a,_uiInfoSet+7
4283  0058 5f            	clrw	x
4284  0059 97            	ld	xl,a
4285  005a 250c          	jrult	L7431
4286                     ; 985 				uiInfoSet.valve_len[i] = 0;
4288  005c 724f007c      	clr	(_uiInfoSet+15,x)
4289                     ; 986 				uiInfoSet.valve_rc[i] = 0;
4291  0060 5f            	clrw	x
4292  0061 97            	ld	xl,a
4293  0062 724f0084      	clr	(_uiInfoSet+23,x)
4295  0066 200d          	jra	L1531
4296  0068               L7431:
4297                     ; 990 				if( uiInfoSet.valve_rc[i] == 0 )
4299  0068 724d0084      	tnz	(_uiInfoSet+23,x)
4300  006c 2607          	jrne	L1531
4301                     ; 991 					uiInfoSet.valve_rc[i] = 1;
4303  006e 5f            	clrw	x
4304  006f 97            	ld	xl,a
4305  0070 a601          	ld	a,#1
4306  0072 d70084        	ld	(_uiInfoSet+23,x),a
4307  0075               L1531:
4308                     ; 981 		for( i=0; i<8; i++ )
4310  0075 0c0c          	inc	(OFST+0,sp)
4314  0077 7b0c          	ld	a,(OFST+0,sp)
4315  0079 a108          	cp	a,#8
4316  007b 25d8          	jrult	L1431
4318  007d 2071          	jra	L5531
4319  007f               L1031:
4320                     ; 997 EncEntry:		
4320                     ; 998 		i = uiInfoSet.valve_len[UI_RID];
4322  007f cd01be        	call	LC027
4323  0082 d6007c        	ld	a,(_uiInfoSet+15,x)
4324  0085 6b0c          	ld	(OFST+0,sp),a
4326                     ; 999 		if( uiInfo.enc != 0 )
4328  0087 c60000        	ld	a,_uiInfo
4329  008a 2724          	jreq	L7531
4330                     ; 1001 			if( (uiInfo.enc & 0x40) == 0 )	i--;
4332  008c a540          	bcp	a,#64
4333  008e 2604          	jrne	L1631
4336  0090 0a0c          	dec	(OFST+0,sp)
4339  0092 2002          	jra	L3631
4340  0094               L1631:
4341                     ; 1003 				i++;
4343  0094 0c0c          	inc	(OFST+0,sp)
4345  0096               L3631:
4346                     ; 1004 			if( i > 150 )	i = 35;
4348  0096 7b0c          	ld	a,(OFST+0,sp)
4349  0098 a197          	cp	a,#151
4350  009a 2504          	jrult	L5631
4353  009c a623          	ld	a,#35
4354  009e 6b0c          	ld	(OFST+0,sp),a
4356  00a0               L5631:
4357                     ; 1005 			if( i < 35 )	i = 150;
4359  00a0 a123          	cp	a,#35
4360  00a2 2404          	jruge	L7631
4363  00a4 a696          	ld	a,#150
4364  00a6 6b0c          	ld	(OFST+0,sp),a
4366  00a8               L7631:
4367                     ; 1006 			uiInfoSet.valve_len[UI_RID] = i;
4369  00a8 cd01be        	call	LC027
4370  00ab 7b0c          	ld	a,(OFST+0,sp)
4371  00ad d7007c        	ld	(_uiInfoSet+15,x),a
4372  00b0               L7531:
4373                     ; 1008 		if( _dsPrev != i )
4375  00b0 c60013        	ld	a,__dsPrev
4376  00b3 110c          	cp	a,(OFST+0,sp)
4377  00b5 2739          	jreq	L5531
4378                     ; 1010 			_dsPrev = i;
4380  00b7 7b0c          	ld	a,(OFST+0,sp)
4381  00b9 c70013        	ld	__dsPrev,a
4382                     ; 1011 			UI_DISP_3Digit(i);
4384  00bc 5f            	clrw	x
4385  00bd 97            	ld	xl,a
4386  00be a664          	ld	a,#100
4387  00c0 62            	div	x,a
4388  00c1 9f            	ld	a,xl
4389  00c2 ae0100        	ldw	x,#256
4390  00c5 97            	ld	xl,a
4391  00c6 cd0000        	call	_lcd_disp_n
4395  00c9 7b0c          	ld	a,(OFST+0,sp)
4396  00cb 5f            	clrw	x
4397  00cc 97            	ld	xl,a
4398  00cd a664          	ld	a,#100
4399  00cf 62            	div	x,a
4400  00d0 5f            	clrw	x
4401  00d1 97            	ld	xl,a
4402  00d2 01            	rrwa	x,a
4403  00d3 6b0c          	ld	(OFST+0,sp),a
4407  00d5 5f            	clrw	x
4408  00d6 97            	ld	xl,a
4409  00d7 a60a          	ld	a,#10
4410  00d9 62            	div	x,a
4411  00da 9f            	ld	a,xl
4412  00db ae0200        	ldw	x,#512
4413  00de 97            	ld	xl,a
4414  00df cd0000        	call	_lcd_disp_n
4418  00e2 7b0c          	ld	a,(OFST+0,sp)
4419  00e4 5f            	clrw	x
4420  00e5 97            	ld	xl,a
4421  00e6 a60a          	ld	a,#10
4422  00e8 62            	div	x,a
4423  00e9 ae0300        	ldw	x,#768
4424  00ec 97            	ld	xl,a
4425  00ed cd0000        	call	_lcd_disp_n
4428  00f0               L5531:
4429                     ; 1014 	if( key == 0x10 )		__DN
4431  00f0 7b0d          	ld	a,(OFST+1,sp)
4432  00f2 a110          	cp	a,#16
4433  00f4 2606          	jrne	L3731
4436  00f6 35400000      	mov	_uiInfo,#64
4440  00fa 2008          	jp	LC025
4441  00fc               L3731:
4442                     ; 1015 	else if( key == 0x20 )	__UP
4444  00fc a120          	cp	a,#32
4445  00fe 2609          	jrne	L7731
4448  0100 35010000      	mov	_uiInfo,#1
4451  0104               LC025:
4453  0104 0f0d          	clr	(OFST+1,sp)
4456  0106 cc007f        	jra	L1031
4457  0109               L7731:
4458                     ; 1016 	else if( key == 4 )		
4460  0109 a104          	cp	a,#4
4461  010b 266a          	jrne	L3041
4462                     ; 1018 		lcd_blink_npos_clear();
4464  010d cd0000        	call	_lcd_blink_npos_clear
4466                     ; 1019 		STATUS_NEXT(next);	
4468  0110 7b0e          	ld	a,(OFST+2,sp)
4469  0112 cd01c4        	call	LC028
4470                     ; 1020 		for( i=0; i<8; i++ )
4473  0115 0f0c          	clr	(OFST+0,sp)
4475  0117               L5041:
4476                     ; 1021 			b[i] = 0;
4478  0117 96            	ldw	x,sp
4479  0118 1c0004        	addw	x,#OFST-8
4480  011b 9f            	ld	a,xl
4481  011c 5e            	swapw	x
4482  011d 1b0c          	add	a,(OFST+0,sp)
4483  011f 2401          	jrnc	L456
4484  0121 5c            	incw	x
4485  0122               L456:
4486  0122 02            	rlwa	x,a
4487  0123 7f            	clr	(x)
4488                     ; 1020 		for( i=0; i<8; i++ )
4490  0124 0c0c          	inc	(OFST+0,sp)
4494  0126 7b0c          	ld	a,(OFST+0,sp)
4495  0128 a108          	cp	a,#8
4496  012a 25eb          	jrult	L5041
4497                     ; 1022 		for( i=0; i<8; i++ )
4499  012c 4f            	clr	a
4500  012d 6b0c          	ld	(OFST+0,sp),a
4502  012f               L3141:
4503                     ; 1024 			if( uiInfoSet.valve_rc[i] != 0 )
4505  012f 5f            	clrw	x
4506  0130 97            	ld	xl,a
4507  0131 724d0084      	tnz	(_uiInfoSet+23,x)
4508  0135 2714          	jreq	L1241
4509                     ; 1025 				b[uiInfoSet.valve_rc[i]-1] = 1;
4511  0137 96            	ldw	x,sp
4512  0138 1c0004        	addw	x,#OFST-8
4513  013b 1f01          	ldw	(OFST-11,sp),x
4515  013d 5f            	clrw	x
4516  013e 97            	ld	xl,a
4517  013f d60084        	ld	a,(_uiInfoSet+23,x)
4518  0142 5f            	clrw	x
4519  0143 97            	ld	xl,a
4520  0144 5a            	decw	x
4521  0145 72fb01        	addw	x,(OFST-11,sp)
4522  0148 a601          	ld	a,#1
4523  014a f7            	ld	(x),a
4524  014b               L1241:
4525                     ; 1022 		for( i=0; i<8; i++ )
4527  014b 0c0c          	inc	(OFST+0,sp)
4531  014d 7b0c          	ld	a,(OFST+0,sp)
4532  014f a108          	cp	a,#8
4533  0151 25dc          	jrult	L3141
4534                     ; 1027 		j = 0;
4536  0153 0f03          	clr	(OFST-9,sp)
4538                     ; 1028 		for( i=0; i<8; i++ )
4540  0155 0f0c          	clr	(OFST+0,sp)
4542  0157               L3241:
4543                     ; 1030 			if( b[i] != 0 )
4545  0157 96            	ldw	x,sp
4546  0158 1c0004        	addw	x,#OFST-8
4547  015b 9f            	ld	a,xl
4548  015c 5e            	swapw	x
4549  015d 1b0c          	add	a,(OFST+0,sp)
4550  015f 2401          	jrnc	L656
4551  0161 5c            	incw	x
4552  0162               L656:
4553  0162 02            	rlwa	x,a
4554  0163 f6            	ld	a,(x)
4555  0164 2702          	jreq	L1341
4556                     ; 1031 				j++;
4558  0166 0c03          	inc	(OFST-9,sp)
4560  0168               L1341:
4561                     ; 1028 		for( i=0; i<8; i++ )
4563  0168 0c0c          	inc	(OFST+0,sp)
4567  016a 7b0c          	ld	a,(OFST+0,sp)
4568  016c a108          	cp	a,#8
4569  016e 25e7          	jrult	L3241
4570                     ; 1033 		uiInfoSet.cnt = j;
4572  0170 7b03          	ld	a,(OFST-9,sp)
4573  0172 c7006f        	ld	_uiInfoSet+2,a
4575  0175 2044          	jra	L5731
4576  0177               L3041:
4577                     ; 1035 	else if( key == 8 )
4579  0177 a108          	cp	a,#8
4580  0179 2626          	jrne	L5341
4581                     ; 1037 		uiInfoSet.valve_rc[UI_RID]++;
4583  017b ad41          	call	LC027
4584  017d 724c0084      	inc	(_uiInfoSet+23,x)
4585                     ; 1038 		if( uiInfoSet.valve+1 == uiInfoSet.valve_rc[UI_RID] )
4587  0181 5f            	clrw	x
4588  0182 97            	ld	xl,a
4589  0183 d60084        	ld	a,(_uiInfoSet+23,x)
4590  0186 5f            	clrw	x
4591  0187 97            	ld	xl,a
4592  0188 c60074        	ld	a,_uiInfoSet+7
4593  018b 905f          	clrw	y
4594  018d 9097          	ld	yl,a
4595  018f bf00          	ldw	c_x,x
4596  0191 905c          	incw	y
4597  0193 90b300        	cpw	y,c_x
4598  0196 261f          	jrne	L5441
4599                     ; 1039 			uiInfoSet.valve_rc[UI_RID] = 1;
4601  0198 ad24          	call	LC027
4602  019a a601          	ld	a,#1
4603  019c d70084        	ld	(_uiInfoSet+23,x),a
4604                     ; 1040 		STATUS_NEXT(prev);
4609  019f 2016          	jp	L5441
4610  01a1               L5341:
4611                     ; 1042 	else if( key == 1 )
4613  01a1 4a            	dec	a
4614  01a2 2617          	jrne	L5731
4615                     ; 1044 		lcd_blink_npos_clear();
4617  01a4 cd0000        	call	_lcd_blink_npos_clear
4619                     ; 1045 		UI_RID++;
4621  01a7 725c009e      	inc	_uiInfoSet+49
4622                     ; 1046 		if( UI_RID == uiInfoSet.valve )
4624  01ab c6009e        	ld	a,_uiInfoSet+49
4625  01ae c10074        	cp	a,_uiInfoSet+7
4626  01b1 2604          	jrne	L5441
4627                     ; 1047 			UI_RID = 0;
4629  01b3 725f009e      	clr	_uiInfoSet+49
4630  01b7               L5441:
4631                     ; 1048 		STATUS_NEXT(prev);
4638  01b7 7b11          	ld	a,(OFST+5,sp)
4639  01b9 ad09          	call	LC028
4641  01bb               L5731:
4642                     ; 1050 }
4645  01bb 5b0e          	addw	sp,#14
4646  01bd 81            	ret	
4647  01be               LC027:
4648  01be c6009e        	ld	a,_uiInfoSet+49
4649  01c1 5f            	clrw	x
4650  01c2 97            	ld	xl,a
4651  01c3 81            	ret	
4652  01c4               LC028:
4653  01c4 c70011        	ld	__ds,a
4655  01c7 725f0012      	clr	__dsCount
4657  01cb 35ff0013      	mov	__dsPrev,#255
4658  01cf 81            	ret	
4712                     ; 1052 void	disp_status_plc(uint8_t key, uint8_t next)
4712                     ; 1053 {
4713                     .text:	section	.text,new
4714  0000               _disp_status_plc:
4716  0000 89            	pushw	x
4717  0001 88            	push	a
4718       00000001      OFST:	set	1
4721                     ; 1080 	if( _dsCount == 0 )
4723  0002 c60012        	ld	a,__dsCount
4724  0005 260b          	jrne	L7441
4725                     ; 1082 		disp_next();
4727  0007 cd0000        	call	_disp_next
4729                     ; 1083 		lcd_disp_plc();
4731  000a cd0000        	call	_lcd_disp_plc
4733                     ; 1084 		lcd_disp_n(3, uiInfoSet.plc);
4735  000d c600a2        	ld	a,_uiInfoSet+53
4738  0010 2039          	jp	LC030
4739  0012               L7441:
4740                     ; 1088 EncEntry:
4740                     ; 1089 		i = uiInfoSet.plc;
4742  0012 c600a2        	ld	a,_uiInfoSet+53
4743  0015 6b01          	ld	(OFST+0,sp),a
4745                     ; 1090 		if( uiInfo.enc != 0 )
4747  0017 c60000        	ld	a,_uiInfo
4748  001a 2723          	jreq	L5741
4749                     ; 1093 			if( (uiInfo.enc & 0x40) == 0 )
4751  001c a540          	bcp	a,#64
4752  001e 260e          	jrne	L7741
4753                     ; 1095 				if( i != 0 )
4755  0020 7b01          	ld	a,(OFST+0,sp)
4756  0022 2704          	jreq	L1051
4757                     ; 1096 					i--;
4759  0024 0a01          	dec	(OFST+0,sp)
4762  0026 2012          	jra	L5051
4763  0028               L1051:
4764                     ; 1098 					i = _ID_MAX+1;
4766  0028 a608          	ld	a,#8
4767  002a 6b01          	ld	(OFST+0,sp),a
4769  002c 200c          	jra	L5051
4770  002e               L7741:
4771                     ; 1102 				if( i != _ID_MAX+1 )
4773  002e 7b01          	ld	a,(OFST+0,sp)
4774  0030 a108          	cp	a,#8
4775  0032 2704          	jreq	L7051
4776                     ; 1103 					i++;
4778  0034 0c01          	inc	(OFST+0,sp)
4781  0036 2002          	jra	L5051
4782  0038               L7051:
4783                     ; 1105 					i = 0;
4785  0038 0f01          	clr	(OFST+0,sp)
4787  003a               L5051:
4788                     ; 1107 			uiInfoSet.plc = i;
4790  003a 7b01          	ld	a,(OFST+0,sp)
4791  003c c700a2        	ld	_uiInfoSet+53,a
4792  003f               L5741:
4793                     ; 1109 		if( _dsPrev != i )
4795  003f c60013        	ld	a,__dsPrev
4796  0042 1101          	cp	a,(OFST+0,sp)
4797  0044 270c          	jreq	L3741
4798                     ; 1111 			_dsPrev = i;
4800  0046 7b01          	ld	a,(OFST+0,sp)
4801  0048 c70013        	ld	__dsPrev,a
4802                     ; 1112 			lcd_disp_n(3, i);
4804  004b               LC030:
4805  004b ae0300        	ldw	x,#768
4806  004e 97            	ld	xl,a
4807  004f cd0000        	call	_lcd_disp_n
4809  0052               L3741:
4810                     ; 1115 	if( key == 4 )		
4812  0052 7b02          	ld	a,(OFST+1,sp)
4813  0054 a104          	cp	a,#4
4814  0056 260f          	jrne	L5151
4815                     ; 1117 		STATUS_NEXT(next);	
4817  0058 7b03          	ld	a,(OFST+2,sp)
4818  005a c70011        	ld	__ds,a
4821  005d 725f0012      	clr	__dsCount
4824  0061 35ff0013      	mov	__dsPrev,#255
4827  0065 2016          	jra	L7151
4828  0067               L5151:
4829                     ; 1119 	else if( key == 0x10 )	__DN
4831  0067 a110          	cp	a,#16
4832  0069 2606          	jrne	L1251
4835  006b 35400000      	mov	_uiInfo,#64
4839  006f 2008          	jp	LC029
4840  0071               L1251:
4841                     ; 1120 	else if( key == 0x20 )	__UP
4843  0071 a120          	cp	a,#32
4844  0073 2608          	jrne	L7151
4847  0075 35010000      	mov	_uiInfo,#1
4850  0079               LC029:
4852  0079 0f02          	clr	(OFST+1,sp)
4855  007b 2095          	jra	L7441
4856  007d               L7151:
4857                     ; 1121 }
4860  007d 5b03          	addw	sp,#3
4861  007f 81            	ret	
4864                     	switch	.data
4865  0017               ___func_rc_timerout:
4866  0017 00            	dc.b	0
4867  0018               ___func_rc_timerout1:
4868  0018 00            	dc.b	0
4869  0019               ___func_rc_timerout2:
4870  0019 00            	dc.b	0
4929                     ; 1130 uint8_t	disp_status_run(uint8_t key, uint8_t next, uint8_t prev)
4929                     ; 1131 {
4930                     .text:	section	.text,new
4931  0000               _disp_status_run:
4933  0000 89            	pushw	x
4934       00000000      OFST:	set	0
4937                     ; 1133 	if( _dsCount == 0 )
4939  0001 c60012        	ld	a,__dsCount
4940  0004 2611          	jrne	L7451
4941                     ; 1135 		disp_next();
4943  0006 cd0000        	call	_disp_next
4945                     ; 1136 		LCD_BIT_SET(bP15);
4947  0009 c6003f        	ld	a,_iLF_DEF+63
4948  000c 5f            	clrw	x
4949  000d 97            	ld	xl,a
4950  000e d6540c        	ld	a,(21516,x)
4951  0011 ca003f        	or	a,_bLF_DEF+63
4952  0014 d7540c        	ld	(21516,x),a
4953  0017               L7451:
4954                     ; 1139 	if( key == 4 )	
4956  0017 7b01          	ld	a,(OFST+1,sp)
4957  0019 a104          	cp	a,#4
4958  001b 2703cc0212    	jrne	L1551
4959                     ; 1141 		copy_infoSet();
4961  0020 cd0000        	call	_copy_infoSet
4963                     ; 1142 		FW_MODE(uiInfo.mode);
4965  0023 c60008        	ld	a,_uiInfo+8
4966  0026 ae0900        	ldw	x,#2304
4967  0029 97            	ld	xl,a
4968  002a cd0000        	call	_file_write
4970                     ; 1143 		FW_ID(uiInfo.id);
4972  002d c60004        	ld	a,_uiInfo+4
4973  0030 ae0a00        	ldw	x,#2560
4974  0033 97            	ld	xl,a
4975  0034 cd0000        	call	_file_write
4977                     ; 1144 		FW_TOFFSET(uiInfo.tOffset);
4979  0037 c60011        	ld	a,_uiInfo+17
4980  003a ae1400        	ldw	x,#5120
4981  003d 97            	ld	xl,a
4982  003e cd0000        	call	_file_write
4984                     ; 1145 		if( uiInfo.mode == 1 )
4986  0041 c60008        	ld	a,_uiInfo+8
4987  0044 4a            	dec	a
4988  0045 2703cc0201    	jrne	L3551
4989                     ; 1147 			func_rc_setting();
4991  004a cd0000        	call	_func_rc_setting
4993                     ; 1148 			__func_rc_timerout = 6;
4995  004d 35060017      	mov	___func_rc_timerout,#6
4996                     ; 1149 			FW_CNTLMODE(uiInfo.cntlMode);
4998  0051 ae0800        	ldw	x,#2048
4999  0054 c60003        	ld	a,_uiInfo+3
5000  0057 97            	ld	xl,a
5001  0058 cd0000        	call	_file_write
5003                     ; 1150 			FW_VALVE(uiInfo.valve);
5005  005b c6000a        	ld	a,_uiInfo+10
5006  005e ae0e00        	ldw	x,#3584
5007  0061 97            	ld	xl,a
5008  0062 cd0000        	call	_file_write
5010                     ; 1151 			FW_VALVE_SUB(uiInfo.valve_sub);
5012  0065 c6000b        	ld	a,_uiInfo+11
5013  0068 ae2c00        	ldw	x,#11264
5014  006b 97            	ld	xl,a
5015  006c cd0000        	call	_file_write
5017                     ; 1152 			FW_CNT(uiInfo.cnt);
5019  006f c60005        	ld	a,_uiInfo+5
5020  0072 ae0b00        	ldw	x,#2816
5021  0075 97            	ld	xl,a
5022  0076 cd0000        	call	_file_write
5024                     ; 1153 			FW_CNT_SUB(uiInfo.cnt_sub);
5026  0079 c60006        	ld	a,_uiInfo+6
5027  007c ae2b00        	ldw	x,#11008
5028  007f 97            	ld	xl,a
5029  0080 cd0000        	call	_file_write
5031                     ; 1154 			FW_CNT_MODE(uiInfo.controlMode);
5033  0083 c60009        	ld	a,_uiInfo+9
5034  0086 ae0d00        	ldw	x,#3328
5035  0089 97            	ld	xl,a
5036  008a cd0000        	call	_file_write
5038                     ; 1155 			FW_OPMODE(uiInfo.opMode);
5040  008d c60007        	ld	a,_uiInfo+7
5041  0090 ae0c00        	ldw	x,#3072
5042  0093 97            	ld	xl,a
5043  0094 cd0000        	call	_file_write
5045                     ; 1156 			FW_POTYPE(uiInfo.poType);
5047  0097 c6000f        	ld	a,_uiInfo+15
5048  009a ae1200        	ldw	x,#4608
5049  009d 97            	ld	xl,a
5050  009e cd0000        	call	_file_write
5052                     ; 1157 			FW_HOUSECAPA(uiInfo.houseCapa);
5054  00a1 c60010        	ld	a,_uiInfo+16
5055  00a4 ae1300        	ldw	x,#4864
5056  00a7 97            	ld	xl,a
5057  00a8 cd0000        	call	_file_write
5059                     ; 1158 			FW_LPM(uiInfo.lpmType);
5061  00ab c60013        	ld	a,_uiInfo+19
5062  00ae ae2800        	ldw	x,#10240
5063  00b1 97            	ld	xl,a
5064  00b2 cd0000        	call	_file_write
5066                     ; 1159 			FW_TEMPOFFSET(uiInfo.tempOffset);
5068  00b5 c60012        	ld	a,_uiInfo+18
5069  00b8 ae2700        	ldw	x,#9984
5070  00bb 97            	ld	xl,a
5071  00bc cd0000        	call	_file_write
5073                     ; 1161 			FW_VALVE_INFOS
5075  00bf c60015        	ld	a,_uiInfo+21
5076  00c2 ae1500        	ldw	x,#5376
5077  00c5 97            	ld	xl,a
5078  00c6 cd0000        	call	_file_write
5082  00c9 c60016        	ld	a,_uiInfo+22
5083  00cc ae1600        	ldw	x,#5632
5084  00cf 97            	ld	xl,a
5085  00d0 cd0000        	call	_file_write
5089  00d3 c60017        	ld	a,_uiInfo+23
5090  00d6 ae1700        	ldw	x,#5888
5091  00d9 97            	ld	xl,a
5092  00da cd0000        	call	_file_write
5096  00dd c60018        	ld	a,_uiInfo+24
5097  00e0 ae1800        	ldw	x,#6144
5098  00e3 97            	ld	xl,a
5099  00e4 cd0000        	call	_file_write
5103  00e7 c60019        	ld	a,_uiInfo+25
5104  00ea ae1900        	ldw	x,#6400
5105  00ed 97            	ld	xl,a
5106  00ee cd0000        	call	_file_write
5110  00f1 c6001a        	ld	a,_uiInfo+26
5111  00f4 ae1a00        	ldw	x,#6656
5112  00f7 97            	ld	xl,a
5113  00f8 cd0000        	call	_file_write
5117  00fb c6001b        	ld	a,_uiInfo+27
5118  00fe ae1b00        	ldw	x,#6912
5119  0101 97            	ld	xl,a
5120  0102 cd0000        	call	_file_write
5124  0105 c6001c        	ld	a,_uiInfo+28
5125  0108 ae1c00        	ldw	x,#7168
5126  010b 97            	ld	xl,a
5127  010c cd0000        	call	_file_write
5131  010f c60025        	ld	a,_uiInfo+37
5132  0112 ae2e00        	ldw	x,#11776
5133  0115 97            	ld	xl,a
5134  0116 cd0000        	call	_file_write
5138  0119 c60026        	ld	a,_uiInfo+38
5139  011c ae2f00        	ldw	x,#12032
5140  011f 97            	ld	xl,a
5141  0120 cd0000        	call	_file_write
5145  0123 c60027        	ld	a,_uiInfo+39
5146  0126 ae3000        	ldw	x,#12288
5147  0129 97            	ld	xl,a
5148  012a cd0000        	call	_file_write
5152  012d c60028        	ld	a,_uiInfo+40
5153  0130 ae3100        	ldw	x,#12544
5154  0133 97            	ld	xl,a
5155  0134 cd0000        	call	_file_write
5159  0137 c60029        	ld	a,_uiInfo+41
5160  013a ae3200        	ldw	x,#12800
5161  013d 97            	ld	xl,a
5162  013e cd0000        	call	_file_write
5166  0141 c6002a        	ld	a,_uiInfo+42
5167  0144 ae3300        	ldw	x,#13056
5168  0147 97            	ld	xl,a
5169  0148 cd0000        	call	_file_write
5173  014b c6002b        	ld	a,_uiInfo+43
5174  014e ae3400        	ldw	x,#13312
5175  0151 97            	ld	xl,a
5176  0152 cd0000        	call	_file_write
5180  0155 c6002c        	ld	a,_uiInfo+44
5181  0158 ae3500        	ldw	x,#13568
5182  015b 97            	ld	xl,a
5183  015c cd0000        	call	_file_write
5185                     ; 1162 			FW_VALVE_RCINFOS
5187  015f c6001d        	ld	a,_uiInfo+29
5188  0162 ae1d00        	ldw	x,#7424
5189  0165 97            	ld	xl,a
5190  0166 cd0000        	call	_file_write
5194  0169 c6001e        	ld	a,_uiInfo+30
5195  016c ae1e00        	ldw	x,#7680
5196  016f 97            	ld	xl,a
5197  0170 cd0000        	call	_file_write
5201  0173 c6001f        	ld	a,_uiInfo+31
5202  0176 ae1f00        	ldw	x,#7936
5203  0179 97            	ld	xl,a
5204  017a cd0000        	call	_file_write
5208  017d c60020        	ld	a,_uiInfo+32
5209  0180 ae2000        	ldw	x,#8192
5210  0183 97            	ld	xl,a
5211  0184 cd0000        	call	_file_write
5215  0187 c60021        	ld	a,_uiInfo+33
5216  018a ae2100        	ldw	x,#8448
5217  018d 97            	ld	xl,a
5218  018e cd0000        	call	_file_write
5222  0191 c60022        	ld	a,_uiInfo+34
5223  0194 ae2200        	ldw	x,#8704
5224  0197 97            	ld	xl,a
5225  0198 cd0000        	call	_file_write
5229  019b c60023        	ld	a,_uiInfo+35
5230  019e ae2300        	ldw	x,#8960
5231  01a1 97            	ld	xl,a
5232  01a2 cd0000        	call	_file_write
5236  01a5 c60024        	ld	a,_uiInfo+36
5237  01a8 ae2400        	ldw	x,#9216
5238  01ab 97            	ld	xl,a
5239  01ac cd0000        	call	_file_write
5243  01af c6002d        	ld	a,_uiInfo+45
5244  01b2 ae3600        	ldw	x,#13824
5245  01b5 97            	ld	xl,a
5246  01b6 cd0000        	call	_file_write
5250  01b9 c6002e        	ld	a,_uiInfo+46
5251  01bc ae3700        	ldw	x,#14080
5252  01bf 97            	ld	xl,a
5253  01c0 cd0000        	call	_file_write
5257  01c3 c6002f        	ld	a,_uiInfo+47
5258  01c6 ae3800        	ldw	x,#14336
5259  01c9 97            	ld	xl,a
5260  01ca cd0000        	call	_file_write
5264  01cd c60030        	ld	a,_uiInfo+48
5265  01d0 ae3900        	ldw	x,#14592
5266  01d3 97            	ld	xl,a
5267  01d4 cd0000        	call	_file_write
5271  01d7 c60031        	ld	a,_uiInfo+49
5272  01da ae3a00        	ldw	x,#14848
5273  01dd 97            	ld	xl,a
5274  01de cd0000        	call	_file_write
5278  01e1 c60032        	ld	a,_uiInfo+50
5279  01e4 ae3b00        	ldw	x,#15104
5280  01e7 97            	ld	xl,a
5281  01e8 cd0000        	call	_file_write
5285  01eb c60033        	ld	a,_uiInfo+51
5286  01ee ae3c00        	ldw	x,#15360
5287  01f1 97            	ld	xl,a
5288  01f2 cd0000        	call	_file_write
5292  01f5 c60034        	ld	a,_uiInfo+52
5293  01f8 ae3d00        	ldw	x,#15616
5294  01fb 97            	ld	xl,a
5295  01fc cd0000        	call	_file_write
5298  01ff 2004          	jra	L5551
5299  0201               L3551:
5300                     ; 1166 			__func_rc_timerout = 4;
5302  0201 35040017      	mov	___func_rc_timerout,#4
5303  0205               L5551:
5304                     ; 1169 		__func_rc_timerout1 = 0;
5306  0205 725f0018      	clr	___func_rc_timerout1
5307                     ; 1170 		__func_rc_timerout2 = __timer1s;
5309  0209 5500000019    	mov	___func_rc_timerout2,___timer1s
5310                     ; 1171 		STATUS_NEXT(next);	
5312  020e 7b02          	ld	a,(OFST+2,sp)
5317  0210 2012          	jp	LC031
5318  0212               L1551:
5319                     ; 1173 	else if( key == 2 )
5321  0212 a102          	cp	a,#2
5322  0214 2608          	jrne	L1651
5323                     ; 1175 		_backup_backlight = 0;
5325  0216 725f0009      	clr	__backup_backlight
5326                     ; 1177 		return 1;
5328  021a a601          	ld	a,#1
5330  021c 2012          	jra	L2401
5331  021e               L1651:
5332                     ; 1179 	else if( key == 8 )
5334  021e a108          	cp	a,#8
5335  0220 260d          	jrne	L7551
5336                     ; 1181 		STATUS_NEXT(prev);
5338  0222 7b05          	ld	a,(OFST+5,sp)
5343  0224               LC031:
5344  0224 c70011        	ld	__ds,a
5346  0227 725f0012      	clr	__dsCount
5348  022b 35ff0013      	mov	__dsPrev,#255
5350  022f               L7551:
5351                     ; 1183 	return 0;
5353  022f 4f            	clr	a
5355  0230               L2401:
5357  0230 85            	popw	x
5358  0231 81            	ret	
5410                     ; 1186 uint8_t	disp_status_run_id(uint8_t key, uint8_t next, uint8_t prev)
5410                     ; 1187 {
5411                     .text:	section	.text,new
5412  0000               _disp_status_run_id:
5414  0000 89            	pushw	x
5415       00000000      OFST:	set	0
5418                     ; 1189 	if( _dsCount == 0 )
5420  0001 c60012        	ld	a,__dsCount
5421  0004 2611          	jrne	L5061
5422                     ; 1191 		disp_next();
5424  0006 cd0000        	call	_disp_next
5426                     ; 1192 		LCD_BIT_SET(bP15);
5428  0009 c6003f        	ld	a,_iLF_DEF+63
5429  000c 5f            	clrw	x
5430  000d 97            	ld	xl,a
5431  000e d6540c        	ld	a,(21516,x)
5432  0011 ca003f        	or	a,_bLF_DEF+63
5433  0014 d7540c        	ld	(21516,x),a
5434  0017               L5061:
5435                     ; 1195 	if( key == 4 )	
5437  0017 7b01          	ld	a,(OFST+1,sp)
5438  0019 a104          	cp	a,#4
5439  001b 263b          	jrne	L7061
5440                     ; 1197 		copy_infoSet();
5442  001d cd0000        	call	_copy_infoSet
5444                     ; 1198 		FW_MODE(uiInfo.mode);
5446  0020 c60008        	ld	a,_uiInfo+8
5447  0023 ae0900        	ldw	x,#2304
5448  0026 97            	ld	xl,a
5449  0027 cd0000        	call	_file_write
5451                     ; 1199 		FW_ID(uiInfo.id);
5453  002a c60004        	ld	a,_uiInfo+4
5454  002d ae0a00        	ldw	x,#2560
5455  0030 97            	ld	xl,a
5456  0031 cd0000        	call	_file_write
5458                     ; 1200 		FW_TOFFSET(uiInfo.tOffset);
5460  0034 c60011        	ld	a,_uiInfo+17
5461  0037 ae1400        	ldw	x,#5120
5462  003a 97            	ld	xl,a
5463  003b cd0000        	call	_file_write
5465                     ; 1202 		__func_rc_timerout = 4;
5467  003e 35040017      	mov	___func_rc_timerout,#4
5468                     ; 1203 		__func_rc_timerout1 = 0;
5470  0042 725f0018      	clr	___func_rc_timerout1
5471                     ; 1204 		__func_rc_timerout2 = __timer1s;
5473  0046 5500000019    	mov	___func_rc_timerout2,___timer1s
5474                     ; 1205 		STATUS_NEXT(next);	
5476  004b 7b02          	ld	a,(OFST+2,sp)
5477  004d c70011        	ld	__ds,a
5480  0050 725f0012      	clr	__dsCount
5483  0054 35ff0013      	mov	__dsPrev,#255
5485  0058               L7061:
5486                     ; 1208 	return 0;
5488  0058 4f            	clr	a
5491  0059 85            	popw	x
5492  005a 81            	ret	
5552                     ; 1212 void	disp_status_exit(uint8_t key, uint8_t next)
5552                     ; 1213 {
5553                     .text:	section	.text,new
5554  0000               _disp_status_exit:
5556  0000 89            	pushw	x
5557       00000001      OFST:	set	1
5560                     ; 1216 	_backup_backlight = 0;
5562  0001 725f0009      	clr	__backup_backlight
5563  0005 88            	push	a
5564                     ; 1217 	if( (_t20ms%10) != 0 )
5566  0006 c60000        	ld	a,__t20ms
5567  0009 5f            	clrw	x
5568  000a 97            	ld	xl,a
5569  000b a60a          	ld	a,#10
5570  000d cd0000        	call	c_smodx
5572  0010 5d            	tnzw	x
5573  0011 2706          	jreq	L1361
5574                     ; 1219 		_dsPrev = 0;
5576  0013 725f0013      	clr	__dsPrev
5577                     ; 1220 		return;
5579  0017 2005          	jra	L6601
5580  0019               L1361:
5581                     ; 1223 	if( _dsPrev != 0 )
5583  0019 c60013        	ld	a,__dsPrev
5584  001c 2703          	jreq	L3361
5585                     ; 1224 		return;
5586  001e               L6601:
5589  001e 5b03          	addw	sp,#3
5590  0020 81            	ret	
5591  0021               L3361:
5592                     ; 1227 	_dsCount++;
5594  0021 725c0012      	inc	__dsCount
5595                     ; 1228 	_dsPrev = 1;
5597  0025 35010013      	mov	__dsPrev,#1
5598                     ; 1229 	lcd_clear(0);
5600  0029 cd0000        	call	_lcd_clear
5602                     ; 1230 	for( i=0; i<4; i++ )
5604  002c 0f01          	clr	(OFST+0,sp)
5606  002e               L5361:
5607                     ; 1231 		lcd_disp_n(i, _dsCount%10);
5609  002e c60012        	ld	a,__dsCount
5610  0031 5f            	clrw	x
5611  0032 97            	ld	xl,a
5612  0033 a60a          	ld	a,#10
5613  0035 62            	div	x,a
5614  0036 97            	ld	xl,a
5615  0037 7b01          	ld	a,(OFST+0,sp)
5616  0039 95            	ld	xh,a
5617  003a cd0000        	call	_lcd_disp_n
5619                     ; 1230 	for( i=0; i<4; i++ )
5621  003d 0c01          	inc	(OFST+0,sp)
5625  003f 7b01          	ld	a,(OFST+0,sp)
5626  0041 a104          	cp	a,#4
5627  0043 25e9          	jrult	L5361
5628                     ; 1233 	if( __func_rc_settingCb == 1 && _dsCount >= 10 )
5630  0045 c60000        	ld	a,___func_rc_settingCb
5631  0048 4a            	dec	a
5632  0049 2607          	jrne	L3461
5634  004b c60012        	ld	a,__dsCount
5635  004e a10a          	cp	a,#10
5636                     ; 1235 		STATUS_NEXT(next);
5639                     ; 1236 		return;
5642  0050 242f          	jruge	L3561
5643  0052               L3461:
5644                     ; 1238 	if( __timer1s != __func_rc_timerout2 )
5646  0052 c60000        	ld	a,___timer1s
5647  0055 c10019        	cp	a,___func_rc_timerout2
5648  0058 2736          	jreq	L5461
5649                     ; 1240 		if( __func_rc_timerout1 == 0 )
5651  005a c60018        	ld	a,___func_rc_timerout1
5652  005d 26bf          	jrne	L6601
5653                     ; 1242 			__func_rc_timerout2 = __timer1s;
5655  005f 5500000019    	mov	___func_rc_timerout2,___timer1s
5656                     ; 1243 			__func_rc_timerout1 = 1;
5658  0064 35010018      	mov	___func_rc_timerout1,#1
5659                     ; 1244 			__func_rc_timerout--;
5661  0068 725a0017      	dec	___func_rc_timerout
5662                     ; 1245 			if( __func_rc_timerout == 0 )
5664  006c 26b0          	jrne	L6601
5665                     ; 1247 				if( uiInfo.mode == 1 )
5667  006e c60008        	ld	a,_uiInfo+8
5668  0071 4a            	dec	a
5669  0072 260d          	jrne	L3561
5670                     ; 1251 					ui_error = 19;
5672  0074 35130000      	mov	_ui_error,#19
5673                     ; 1252 					_ds = 97;
5675  0078 35610011      	mov	__ds,#97
5676                     ; 1253 					_dsCount = 0;
5678  007c c70012        	ld	__dsCount,a
5680  007f 209d          	jra	L6601
5681  0081               L3561:
5682                     ; 1257 					STATUS_NEXT(next);
5689  0081 7b03          	ld	a,(OFST+2,sp)
5690  0083 c70011        	ld	__ds,a
5692  0086 725f0012      	clr	__dsCount
5694  008a 35ff0013      	mov	__dsPrev,#255
5696  008e 208e          	jra	L6601
5697  0090               L5461:
5698                     ; 1263 		__func_rc_timerout1 = 0;
5700  0090 725f0018      	clr	___func_rc_timerout1
5701                     ; 1264 }
5703  0094 2088          	jra	L6601
5706                     	switch	.data
5707  001a               __tim1min:
5708  001a 00            	dc.b	0
5709  001b               __tim30min:
5710  001b 00            	dc.b	0
5711  001c               __timFlag:
5712  001c 00            	dc.b	0
5736                     ; 1270 void	timerClear(void)
5736                     ; 1271 {
5737                     .text:	section	.text,new
5738  0000               _timerClear:
5742                     ; 1272 	_tim1min = 0;
5744  0000 725f001a      	clr	__tim1min
5745                     ; 1273 	_tim30min = 0;
5747  0004 725f001b      	clr	__tim30min
5748                     ; 1274 	_timFlag = 0;
5750  0008 725f001c      	clr	__timFlag
5751                     ; 1275 }
5754  000c 81            	ret	
5793                     ; 1277 void	disp_status_loop_message(uint8_t i)
5793                     ; 1278 {
5794                     .text:	section	.text,new
5795  0000               _disp_status_loop_message:
5797  0000 88            	push	a
5798       00000000      OFST:	set	0
5801                     ; 1279 	lcd_clear_btn();
5803  0001 cd0000        	call	_lcd_clear_btn
5805                     ; 1280 	if( i == 0 )		/*	(0)난방*/	
5807  0004 7b01          	ld	a,(OFST+1,sp)
5808  0006 2642          	jrne	L5071
5809                     ; 1282 		_disp_mode = 0x01;	
5811  0008 35010000      	mov	__disp_mode,#1
5812                     ; 1287 		LCD_BIT_SET(bP19);	
5814  000c 5f            	clrw	x
5815  000d c60029        	ld	a,_iLF_DEF+41
5816  0010 97            	ld	xl,a
5817  0011 d6540c        	ld	a,(21516,x)
5818  0014 cd00dc        	call	LC037
5819  0017 cd00d6        	call	LC036
5820  001a cd00e6        	call	LC038
5821  001d cd00d6        	call	LC036
5822  0020 ca0006        	or	a,_bLF_DEF+6
5823  0023 d7540c        	ld	(21516,x),a
5824                     ; 1290 		LCD_BIT_SET(bP15);	
5826  0026 c6003f        	ld	a,_iLF_DEF+63
5827  0029 cd00d6        	call	LC036
5828  002c ca003f        	or	a,_bLF_DEF+63
5829  002f d7540c        	ld	(21516,x),a
5830                     ; 1291 		LCD_BIT_SET(bP14);	
5832  0032 c60000        	ld	a,_iLF_DEF
5833  0035 cd00d6        	call	LC036
5834  0038 ca0000        	or	a,_bLF_DEF
5835  003b d7540c        	ld	(21516,x),a
5836                     ; 1292 		LCD_BIT_SET(bDP2);	
5838  003e c6000a        	ld	a,_iLF_DEF+10
5839  0041 cd00d6        	call	LC036
5840  0044 ca000a        	or	a,_bLF_DEF+10
5842  0047 cc00c9        	jp	LC033
5843  004a               L5071:
5844                     ; 1294 	else if( i == 1 )	/*	(1)예약*/	
5846  004a a101          	cp	a,#1
5847  004c 261c          	jrne	L1171
5848                     ; 1296 		_disp_mode = 0x08;	
5850  004e 35080000      	mov	__disp_mode,#8
5851                     ; 1297 		LCD_BIT_SET(bP10);	
5853  0052 5f            	clrw	x
5854  0053 c6003a        	ld	a,_iLF_DEF+58
5855  0056 97            	ld	xl,a
5856  0057 d6540c        	ld	a,(21516,x)
5857  005a ca003a        	or	a,_bLF_DEF+58
5858  005d d7540c        	ld	(21516,x),a
5859                     ; 1298 		LCD_BIT_SET(bS2d);	
5861  0060 c6001a        	ld	a,_iLF_DEF+26
5862  0063 ad71          	call	LC036
5863  0065 ca001a        	or	a,_bLF_DEF+26
5864                     ; 1300 		LCD_BIT_SET(bP19);	
5865                     ; 1301 		LCD_BIT_SET(bP20);	
5866                     ; 1302 		LCD_BIT_SET(bDP1);	
5868  0068 201e          	jp	LC034
5869  006a               L1171:
5870                     ; 1304 	else if( i == 2 )	/*	(2)반복*/	
5872  006a a102          	cp	a,#2
5873  006c 262f          	jrne	L5171
5874                     ; 1306 		_disp_mode = 0x10;	
5876  006e 35100000      	mov	__disp_mode,#16
5877                     ; 1307 		LCD_BIT_SET(bP9);	
5879  0072 5f            	clrw	x
5880  0073 c60031        	ld	a,_iLF_DEF+49
5881  0076 97            	ld	xl,a
5882  0077 d6540c        	ld	a,(21516,x)
5883  007a ca0031        	or	a,_bLF_DEF+49
5884  007d d7540c        	ld	(21516,x),a
5885                     ; 1308 		LCD_BIT_SET(bS1);	
5887  0080 c6002a        	ld	a,_iLF_DEF+42
5888  0083 ad51          	call	LC036
5889  0085 ca002a        	or	a,_bLF_DEF+42
5890                     ; 1310 		LCD_BIT_SET(bP19);	
5892                     ; 1311 		LCD_BIT_SET(bP20);	
5894                     ; 1312 		LCD_BIT_SET(bDP1);	
5896  0088               LC034:
5897  0088 d7540c        	ld	(21516,x),a
5901  008b c60029        	ld	a,_iLF_DEF+41
5902  008e ad46          	call	LC036
5903  0090 ad4a          	call	LC037
5904  0092 ad42          	call	LC036
5905  0094 ad50          	call	LC038
5906  0096 ad3e          	call	LC036
5907  0098 ca0006        	or	a,_bLF_DEF+6
5909  009b 202c          	jp	LC033
5910  009d               L5171:
5911                     ; 1314 	else if( i == 8 )		/*	(1)외출*/	
5913  009d a108          	cp	a,#8
5914  009f 2611          	jrne	L1271
5915                     ; 1316 		_disp_mode = 0x02;	
5917                     ; 1317 		LCD_BIT_SET(bP13);	
5919  00a1               LC035:
5921  00a1 35020000      	mov	__disp_mode,#2
5923  00a5 5f            	clrw	x
5924  00a6 c60010        	ld	a,_iLF_DEF+16
5925  00a9 97            	ld	xl,a
5926  00aa d6540c        	ld	a,(21516,x)
5927  00ad ca0010        	or	a,_bLF_DEF+16
5928                     ; 1318 		LCD_BIT_SET(bP19);	
5929                     ; 1319 		LCD_BIT_SET(bP20);	
5930                     ; 1320 		LCD_BIT_SET(bDP1);	
5932  00b0 20d6          	jp	LC034
5933  00b2               L1271:
5934                     ; 1322 	else if( i == 17 )		/*	(1)외출 LONG */	
5936  00b2 a111          	cp	a,#17
5937                     ; 1324 		_disp_mode = 0x02;	
5938                     ; 1325 		LCD_BIT_SET(bP13);	
5939                     ; 1326 		LCD_BIT_SET(bP19);	
5940                     ; 1327 		LCD_BIT_SET(bP20);	
5941                     ; 1328 		LCD_BIT_SET(bDP1);	
5943  00b4 27eb          	jreq	LC035
5944                     ; 1330 	else if( i == 5 )	{	_disp_mode = 0x04;	LCD_BIT_SET(bP11);	/*	(2)정지*/	}
5946  00b6 a105          	cp	a,#5
5947  00b8 2612          	jrne	L7071
5950  00ba 35040000      	mov	__disp_mode,#4
5953  00be 5f            	clrw	x
5954  00bf c60030        	ld	a,_iLF_DEF+48
5955  00c2 97            	ld	xl,a
5956  00c3 d6540c        	ld	a,(21516,x)
5957  00c6 ca0030        	or	a,_bLF_DEF+48
5958  00c9               LC033:
5959  00c9 d7540c        	ld	(21516,x),a
5960  00cc               L7071:
5961                     ; 1332 	_disp_mode2 = _disp_mode;
5963  00cc 5500000000    	mov	__disp_mode2,__disp_mode
5964                     ; 1333 	timerClear();
5966  00d1 cd0000        	call	_timerClear
5968                     ; 1334 }
5971  00d4 84            	pop	a
5972  00d5 81            	ret	
5973  00d6               LC036:
5974  00d6 5f            	clrw	x
5975  00d7 97            	ld	xl,a
5976  00d8 d6540c        	ld	a,(21516,x)
5977  00db 81            	ret	
5978  00dc               LC037:
5979  00dc ca0029        	or	a,_bLF_DEF+41
5980  00df d7540c        	ld	(21516,x),a
5984  00e2 c60039        	ld	a,_iLF_DEF+57
5985  00e5 81            	ret	
5986  00e6               LC038:
5987  00e6 ca0039        	or	a,_bLF_DEF+57
5988  00e9 d7540c        	ld	(21516,x),a
5992  00ec c60006        	ld	a,_iLF_DEF+6
5993  00ef 81            	ret	
6040                     ; 1339 void	disp_status_loop_init(void)
6040                     ; 1340 {
6041                     .text:	section	.text,new
6042  0000               _disp_status_loop_init:
6044  0000 88            	push	a
6045       00000001      OFST:	set	1
6048                     ; 1343 	i = 0;
6050                     ; 1344 	if (_disp_mode == 0xff) {
6052                     ; 1345 		i = 1;
6054                     ; 1349 	lcd_clear(0);
6056  0001 4f            	clr	a
6057  0002 cd0000        	call	_lcd_clear
6059                     ; 1350 	lcd_blink_clear();
6061  0005 cd0000        	call	_lcd_blink_clear
6063                     ; 1351 	_dsPrev = 0xff;
6065  0008 35ff0013      	mov	__dsPrev,#255
6066                     ; 1352 	if( uiInfo._temp[0] == 0x80 )
6068  000c c60060        	ld	a,_uiInfo+96
6069  000f a180          	cp	a,#128
6070  0011 2605          	jrne	L1571
6071                     ; 1353 		uiInfo.tSetup = uiInfo._temp[1];
6073  0013 550061000e    	mov	_uiInfo+14,_uiInfo+97
6074  0018               L1571:
6075                     ; 1354 	uiInfo._temp[0] = 0;
6077  0018 725f0060      	clr	_uiInfo+96
6078                     ; 1364 	if( __sUp == 5 )		//	Off
6080  001c c60001        	ld	a,___sUp
6081  001f a105          	cp	a,#5
6082  0021 2744          	jreq	L5571
6084                     ; 1386 	else if( __sUp == 0 )
6086  0023 c60001        	ld	a,___sUp
6087  0026 2613          	jrne	L7571
6088                     ; 1388 		__ui_disp_temp_c(3);
6090  0028 a603          	ld	a,#3
6091  002a cd0000        	call	___ui_disp_temp_c
6093                     ; 1389 		ui_disp_temp_curr(uiInfo.tCurr);
6095  002d c60002        	ld	a,_uiInfo+2
6096  0030 cd0000        	call	_ui_disp_temp_curr
6098                     ; 1390 		ui_disp_temp_setup(uiInfo.tSetup);
6100  0033 c6000e        	ld	a,_uiInfo+14
6101  0036 cd0000        	call	_ui_disp_temp_setup
6104  0039 202c          	jra	L5571
6105  003b               L7571:
6106                     ; 1392 	else if( __sUp == 1 )	//	Y
6108  003b a101          	cp	a,#1
6109  003d 2728          	jreq	L5571
6111                     ; 1395 	else if( __sUp == 2 )	//	B
6113  003f a102          	cp	a,#2
6114  0041 2724          	jreq	L5571
6116                     ; 1398 	else if( __sUp == 8 )	//	Out
6118  0043 a108          	cp	a,#8
6119  0045 261a          	jrne	L3771
6120                     ; 1400 		__ui_disp_temp_c(1);
6122  0047 ad26          	call	LC039
6123                     ; 1406 		UPDATE_BIT(BIT_TSETUP);
6125  0049 72140006      	bset	__updateBit,#2
6128  004d 5500000005    	mov	__updateTimer,___timer1s
6131  0052 35050007      	mov	__updateCount,#5
6132                     ; 1407 		uiInfo._temp[3] = uiInfo.tSetup;
6135  0056 55000e0063    	mov	_uiInfo+99,_uiInfo+14
6136                     ; 1408 		uiInfo.tSetup = 30;
6138  005b 351e000e      	mov	_uiInfo+14,#30
6140  005f 2006          	jra	L5571
6141  0061               L3771:
6142                     ; 1416 	}else if( __sUp == 17 )	//	Out long
6144  0061 a111          	cp	a,#17
6145  0063 2602          	jrne	L5571
6146                     ; 1418 		__ui_disp_temp_c(1);
6148  0065 ad08          	call	LC039
6149                     ; 1420 		uiInfo._temp[1] = uiInfo.tSetup;
6150  0067               L5571:
6151                     ; 1426 	disp_status_loop_message(__sUp);
6153  0067 c60001        	ld	a,___sUp
6154  006a cd0000        	call	_disp_status_loop_message
6156                     ; 1427 }
6159  006d 84            	pop	a
6160  006e 81            	ret	
6161  006f               LC039:
6162  006f a601          	ld	a,#1
6163  0071 cd0000        	call	___ui_disp_temp_c
6165                     ; 1401 		uiInfo._temp[0] = 0x80;
6167  0074 35800060      	mov	_uiInfo+96,#128
6168                     ; 1402 		uiInfo._temp[1] = uiInfo.tSetup;
6170  0078 55000e0061    	mov	_uiInfo+97,_uiInfo+14
6171  007d 81            	ret	
6198                     ; 1429 void	disp_status_curr_only(void)
6198                     ; 1430 {
6199                     .text:	section	.text,new
6200  0000               _disp_status_curr_only:
6204                     ; 1431 	ui_disp_clear_tSetup(0);
6206  0000 4f            	clr	a
6207  0001 cd0000        	call	_ui_disp_clear_tSetup
6209                     ; 1435 	ui_disp_temp_curr(uiInfo.tCurr);
6211  0004 c60002        	ld	a,_uiInfo+2
6213                     ; 1436 }
6216  0007 cc0000        	jp	_ui_disp_temp_curr
6258                     ; 1438 void	disp_status_error(uint8_t key, uint8_t next)
6258                     ; 1439 {
6259                     .text:	section	.text,new
6260  0000               _disp_status_error:
6262  0000 89            	pushw	x
6263       00000000      OFST:	set	0
6266                     ; 1441 	if( error_display_status == 1 )
6268  0001 c6000d        	ld	a,_error_display_status
6269  0004 4a            	dec	a
6270  0005 260f          	jrne	L3302
6271                     ; 1443 		lcd_clear(0);
6273  0007 cd0000        	call	_lcd_clear
6275                     ; 1444 		lcd_disp_err(ui_error);
6277  000a c60000        	ld	a,_ui_error
6278  000d cd0000        	call	_lcd_disp_err
6280                     ; 1445 		error_display_status = 2;
6282  0010 3502000d      	mov	_error_display_status,#2
6284  0014 2005          	jra	L5302
6285  0016               L3302:
6286                     ; 1449 		if( uiInfo.enc != 0 )
6288  0016 c60000        	ld	a,_uiInfo
6289  0019 2606          	jrne	L3102
6290                     ; 1451 			goto Exit;
6292  001b               L5302:
6293                     ; 1455 	if( key == 8 )        // 2015.10.30 에러복구 버튼 변경
6295  001b 7b01          	ld	a,(OFST+1,sp)
6296  001d a108          	cp	a,#8
6297  001f 260a          	jrne	L1402
6298  0021               L3102:
6299                     ; 1460 Exit:		
6299                     ; 1461 		if( uiInfo.mode == 1 )
6301  0021 c60008        	ld	a,_uiInfo+8
6302  0024 4a            	dec	a
6303  0025 2604          	jrne	L1402
6304                     ; 1464 			func_rc_recover(1);
6306  0027 4c            	inc	a
6307  0028 cd0000        	call	_func_rc_recover
6309  002b               L1402:
6310                     ; 1471 	if( error == 0 && error_type == 0 )
6312  002b c60000        	ld	a,_error
6313  002e 260e          	jrne	L5402
6315  0030 c60000        	ld	a,_error_type
6316  0033 2609          	jrne	L5402
6317  0035 c60000        	ld	a,_ui_error
6318  0038 200f          	jra	L5102
6319  003a               L7402:
6320                     ; 1481 		error_display_mode = 0;
6322  003a 725f000c      	clr	_error_display_mode
6323  003e               L5402:
6324                     ; 1484 	if( ui_error == 0 && ui_error_type == 0 )
6326  003e c60000        	ld	a,_ui_error
6327  0041 2611          	jrne	L1502
6329  0043 725d0000      	tnz	_ui_error_type
6330  0047 260b          	jrne	L1502
6331                     ; 1486 		goto RESET_ENTRY;
6332  0049               L5102:
6333                     ; 1473 RESET_ENTRY:			
6333                     ; 1474 		/*
6333                     ; 1475 			reset mode
6333                     ; 1476 		 */
6333                     ; 1477 		if (ui_error == 30 && ui_error_type == ERROR_TYPE_CNT) {
6335  0049 a11e          	cp	a,#30
6336  004b 26ed          	jrne	L7402
6338  004d c60000        	ld	a,_ui_error_type
6339  0050 a102          	cp	a,#2
6340  0052 26e6          	jrne	L7402
6341                     ; 1478 			return;
6343  0054               L1502:
6344                     ; 1488 }
6347  0054 85            	popw	x
6348  0055 81            	ret	
6409                     ; 1492 void	disp_status_command(uint8_t key)
6409                     ; 1493 {
6410                     .text:	section	.text,new
6411  0000               _disp_status_command:
6413  0000 88            	push	a
6414  0001 88            	push	a
6415       00000001      OFST:	set	1
6418                     ; 1495 	if( _dsCount == 0 )
6420  0002 c60012        	ld	a,__dsCount
6421  0005 263a          	jrne	L3502
6422                     ; 1497 		disp_next();
6424  0007 cd0000        	call	_disp_next
6426                     ; 1499 		LCD_BIT_SET(b1A);
6428  000a c60037        	ld	a,_iLF_DEF+55
6429  000d cd0160        	call	LC045
6430  0010 ca0037        	or	a,_bLF_DEF+55
6431  0013 d7540c        	ld	(21516,x),a
6432                     ; 1500 		LCD_BIT_SET(b1F);
6434  0016 c60038        	ld	a,_iLF_DEF+56
6435  0019 cd0160        	call	LC045
6436  001c ca0038        	or	a,_bLF_DEF+56
6437  001f d7540c        	ld	(21516,x),a
6438                     ; 1501 		LCD_BIT_SET(b1E);
6440  0022 c60018        	ld	a,_iLF_DEF+24
6441  0025 cd0160        	call	LC045
6442  0028 ca0018        	or	a,_bLF_DEF+24
6443  002b d7540c        	ld	(21516,x),a
6444                     ; 1502 		LCD_BIT_SET(b1D);
6446  002e c60007        	ld	a,_iLF_DEF+7
6447  0031 cd0160        	call	LC045
6448  0034 ca0007        	or	a,_bLF_DEF+7
6449  0037 d7540c        	ld	(21516,x),a
6450                     ; 1503 		uiInfo._t = 0;
6452  003a 725f005f      	clr	_uiInfo+95
6454  003e cc00d2        	jra	L7112
6455  0041               L3502:
6456                     ; 1507 EncEntry:		
6456                     ; 1508 		i = uiInfo._t;
6458  0041 c6005f        	ld	a,_uiInfo+95
6459  0044 6b01          	ld	(OFST+0,sp),a
6461                     ; 1509 		if( uiInfo.enc != 0 )
6463  0046 c60000        	ld	a,_uiInfo
6464  0049 271d          	jreq	L1212
6465                     ; 1511 			if( (uiInfo.enc & 0x40) == 0 )
6467  004b a540          	bcp	a,#64
6468  004d 2609          	jrne	L3212
6469                     ; 1512 				i = (i+_LC-1)%_LC;
6471  004f 7b01          	ld	a,(OFST+0,sp)
6472  0051 5f            	clrw	x
6473  0052 97            	ld	xl,a
6474  0053 1c0009        	addw	x,#9
6477  0056 2005          	jra	L5212
6478  0058               L3212:
6479                     ; 1514 				i = (i+1)%_LC;
6481  0058 7b01          	ld	a,(OFST+0,sp)
6482  005a 5f            	clrw	x
6483  005b 97            	ld	xl,a
6484  005c 5c            	incw	x
6486  005d               L5212:
6487  005d a60a          	ld	a,#10
6488  005f cd0000        	call	c_smodx
6489  0062 01            	rrwa	x,a
6490  0063 6b01          	ld	(OFST+0,sp),a
6492                     ; 1515 			uiInfo._t = i;
6494  0065 c7005f        	ld	_uiInfo+95,a
6495  0068               L1212:
6496                     ; 1517 		if( _dsPrev != i )
6498  0068 c60013        	ld	a,__dsPrev
6499  006b 1101          	cp	a,(OFST+0,sp)
6500  006d 2763          	jreq	L7112
6501                     ; 1519 			_dsPrev = i;
6503  006f 7b01          	ld	a,(OFST+0,sp)
6504  0071 c70013        	ld	__dsPrev,a
6505                     ; 1520 			clear_npos2();
6507  0074 cd0000        	call	_clear_npos2
6509                     ; 1521 			if( i==0 )		lcd_disp_setup_cntl_tab();
6511  0077 7b01          	ld	a,(OFST+0,sp)
6512  0079 2605          	jrne	L1312
6515  007b cd0000        	call	_lcd_disp_setup_cntl_tab
6518  007e 2052          	jra	L7112
6519  0080               L1312:
6520                     ; 1522 			else if( i==1 )	lcd_disp_setup_cntl_2motor();
6522  0080 a101          	cp	a,#1
6523  0082 2605          	jrne	L5312
6526  0084 cd0000        	call	_lcd_disp_setup_cntl_2motor
6529  0087 2049          	jra	L7112
6530  0089               L5312:
6531                     ; 1523 			else if( i==2 )	lcd_disp_setup_cntl_on();
6533  0089 a102          	cp	a,#2
6534  008b 2605          	jrne	L1412
6537  008d cd0000        	call	_lcd_disp_setup_cntl_on
6540  0090 2040          	jra	L7112
6541  0092               L1412:
6542                     ; 1524 			else if( i==3 )	lcd_disp_setup_cntl_po();
6544  0092 a103          	cp	a,#3
6545  0094 2605          	jrne	L5412
6548  0096 cd0000        	call	_lcd_disp_setup_cntl_po
6551  0099 2037          	jra	L7112
6552  009b               L5412:
6553                     ; 1525 			else if( i==4 )	lcd_disp_mir1();
6555  009b a104          	cp	a,#4
6556  009d 2605          	jrne	L1512
6559  009f cd0000        	call	_lcd_disp_mir1
6562  00a2 202e          	jra	L7112
6563  00a4               L1512:
6564                     ; 1526 			else if( i==5 )	lcd_disp_mir2();
6566  00a4 a105          	cp	a,#5
6567  00a6 2605          	jrne	L5512
6570  00a8 cd0000        	call	_lcd_disp_mir2
6573  00ab 2025          	jra	L7112
6574  00ad               L5512:
6575                     ; 1527 			else if( i==6 )	lcd_disp_freset();
6577  00ad a106          	cp	a,#6
6578  00af 2605          	jrne	L1612
6581  00b1 cd0000        	call	_lcd_disp_freset
6584  00b4 201c          	jra	L7112
6585  00b6               L1612:
6586                     ; 1528 			else if( i==7 )	lcd_disp_cnt_host();
6588  00b6 a107          	cp	a,#7
6589  00b8 2605          	jrne	L5612
6592  00ba cd0000        	call	_lcd_disp_cnt_host
6595  00bd 2013          	jra	L7112
6596  00bf               L5612:
6597                     ; 1529 			else if( i==8 )	lcd_disp_cnt_sub();
6599  00bf a108          	cp	a,#8
6600  00c1 2605          	jrne	L1712
6603  00c3 cd0000        	call	_lcd_disp_cnt_sub
6606  00c6 200a          	jra	L7112
6607  00c8               L1712:
6608                     ; 1530 			else if( i==9 )	lcd_disp_n(3, 0);
6610  00c8 a109          	cp	a,#9
6611  00ca 2606          	jrne	L7112
6614  00cc ae0300        	ldw	x,#768
6615  00cf cd0000        	call	_lcd_disp_n
6617  00d2               L7112:
6618                     ; 1533 	if( key == 0x10 )		__UP
6620  00d2 7b02          	ld	a,(OFST+1,sp)
6621  00d4 a110          	cp	a,#16
6622  00d6 2606          	jrne	L7712
6625  00d8 35010000      	mov	_uiInfo,#1
6629  00dc 2008          	jp	LC040
6630  00de               L7712:
6631                     ; 1534 	else if( key == 0x20 )	__DN
6633  00de a120          	cp	a,#32
6634  00e0 2609          	jrne	L3022
6637  00e2 35400000      	mov	_uiInfo,#64
6640  00e6               LC040:
6642  00e6 0f02          	clr	(OFST+1,sp)
6645  00e8 cc0041        	jra	L3502
6646  00eb               L3022:
6647                     ; 1535 	else if( key == 4 )		
6649  00eb a104          	cp	a,#4
6650  00ed 2661          	jrne	L7022
6651                     ; 1537 		switch( uiInfo._t )
6653  00ef c6005f        	ld	a,_uiInfo+95
6655                     ; 1573 			break;
6656  00f2 271b          	jreq	L5502
6657  00f4 4a            	dec	a
6658  00f5 271e          	jreq	L7502
6659  00f7 4a            	dec	a
6660  00f8 2721          	jreq	L1602
6661  00fa 4a            	dec	a
6662  00fb 2723          	jreq	L3602
6663  00fd a002          	sub	a,#2
6664  00ff 2725          	jreq	L5602
6665  0101 4a            	dec	a
6666  0102 2728          	jreq	L7602
6667  0104 4a            	dec	a
6668  0105 272d          	jreq	L1702
6669  0107 4a            	dec	a
6670  0108 272f          	jreq	L3702
6671  010a 4a            	dec	a
6672  010b 273d          	jreq	L5702
6673  010d 204f          	jra	L1022
6674  010f               L5502:
6675                     ; 1539 		case 0:
6675                     ; 1540 			uiInfoSet.opMode = 3;	
6677  010f 35030071      	mov	_uiInfoSet+4,#3
6678                     ; 1541 			disp_status_run(3, 35, 0);
6680                     ; 1542 			break;
6682  0113 202a          	jp	LC043
6683  0115               L7502:
6684                     ; 1543 		case 1:	
6684                     ; 1544 			uiInfoSet.opMode = 2;	
6686  0115 35020071      	mov	_uiInfoSet+4,#2
6687                     ; 1545 			disp_status_run(3, 35, 0);
6689                     ; 1546 			break;
6691  0119 2024          	jp	LC043
6692  011b               L1602:
6693                     ; 1547 		case 2:	
6693                     ; 1548 			uiInfoSet.opMode = 0;	
6695  011b c70071        	ld	_uiInfoSet+4,a
6696                     ; 1549 			disp_status_run(3, 35, 0);
6698                     ; 1550 			break;
6700  011e 201f          	jp	LC043
6701  0120               L3602:
6702                     ; 1551 		case 3:	
6702                     ; 1552 			uiInfoSet.opMode = 1;	
6704  0120 35010071      	mov	_uiInfoSet+4,#1
6705                     ; 1553 			disp_status_run(3, 35, 0);
6707                     ; 1554 			break;
6709  0124 2019          	jp	LC043
6710  0126               L5602:
6711                     ; 1556 			STATUS_NEXT(95);
6713  0126 355f0011      	mov	__ds,#95
6716                     ; 1557 			break;
6719  012a 202b          	jp	LC041
6720  012c               L7602:
6721                     ; 1558 		case 6:	
6721                     ; 1559 			func_rc_command(COMMAND_MODE_FACTORY, 100);	
6723  012c ae0864        	ldw	x,#2148
6724  012f cd0000        	call	_func_rc_command
6726                     ; 1560 			break;
6728  0132 202a          	jra	L1022
6729  0134               L1702:
6730                     ; 1561 		case 7:	
6730                     ; 1562 			//	MAIN
6730                     ; 1563 			func_rc_command(COMMAND_MODE_FACTORY, 110);	
6732  0134 ae086e        	ldw	x,#2158
6734                     ; 1564 			disp_status_run(3, 35, 0);
6736                     ; 1565 			break;
6738  0137 2003          	jp	LC044
6739  0139               L3702:
6740                     ; 1566 		case 8:	
6740                     ; 1567 			//	SUB
6740                     ; 1568 			func_rc_command(COMMAND_MODE_FACTORY, 120);	
6742  0139 ae0878        	ldw	x,#2168
6743  013c               LC044:
6744  013c cd0000        	call	_func_rc_command
6746                     ; 1569 			disp_status_run(3, 35, 0);
6749  013f               LC043:
6755  013f 4b00          	push	#0
6756  0141 ae0323        	ldw	x,#803
6757  0144 cd0000        	call	_disp_status_run
6758  0147 84            	pop	a
6759                     ; 1570 			break;
6761  0148 2014          	jra	L1022
6762  014a               L5702:
6763                     ; 1572 			STATUS_NEXT(100);
6765  014a 35640011      	mov	__ds,#100
6769                     ; 1573 			break;
6772  014e 2007          	jp	LC041
6774  0150               L7022:
6775                     ; 1576 	else if( key == 1 )
6777  0150 4a            	dec	a
6778  0151 260b          	jrne	L1022
6779                     ; 1578 		STATUS_NEXT(99);
6781  0153 35630011      	mov	__ds,#99
6786  0157               LC041:
6788  0157 c70012        	ld	__dsCount,a
6791  015a 35ff0013      	mov	__dsPrev,#255
6793  015e               L1022:
6794                     ; 1580 }
6797  015e 85            	popw	x
6798  015f 81            	ret	
6799  0160               LC045:
6800  0160 5f            	clrw	x
6801  0161 97            	ld	xl,a
6802  0162 d6540c        	ld	a,(21516,x)
6803  0165 81            	ret	
6806                     	switch	.data
6807  001d               __d485_id:
6808  001d 00            	dc.b	0
6845                     ; 1599 void	disp_write_file(uint8_t next)
6845                     ; 1600 {
6846                     .text:	section	.text,new
6847  0000               _disp_write_file:
6849  0000 88            	push	a
6850       00000000      OFST:	set	0
6853                     ; 1603 	file_update();
6855  0001 cd0000        	call	_file_update
6857                     ; 1604 	__func_rc_timerout = 5;
6859  0004 35050017      	mov	___func_rc_timerout,#5
6860                     ; 1605 	__func_rc_timerout1 = 0;
6862  0008 725f0018      	clr	___func_rc_timerout1
6863                     ; 1606 	__func_rc_timerout2 = __timer1s;
6865  000c 5500000019    	mov	___func_rc_timerout2,___timer1s
6866                     ; 1607 	func_rc_setting();
6868  0011 cd0000        	call	_func_rc_setting
6870                     ; 1608 	_ds = next;
6872  0014 7b01          	ld	a,(OFST+1,sp)
6873  0016 c70011        	ld	__ds,a
6874                     ; 1609 }
6877  0019 84            	pop	a
6878  001a 81            	ret	
6914                     ; 1611 void	disp_set_state(uint8_t next)
6914                     ; 1612 {
6915                     .text:	section	.text,new
6916  0000               _disp_set_state:
6918  0000 88            	push	a
6919       00000000      OFST:	set	0
6922                     ; 1613 	lcd_blink_clear();
6924  0001 cd0000        	call	_lcd_blink_clear
6926                     ; 1614 	STATUS_NEXT(next);
6928  0004 7b01          	ld	a,(OFST+1,sp)
6929  0006 c70011        	ld	__ds,a
6932  0009 725f0012      	clr	__dsCount
6935  000d 35ff0013      	mov	__dsPrev,#255
6936                     ; 1615 }
6940  0011 84            	pop	a
6941  0012 81            	ret	
6974                     ; 1617 void _disp_485(uint8_t i) {
6975                     .text:	section	.text,new
6976  0000               __disp_485:
6978  0000 88            	push	a
6979       00000000      OFST:	set	0
6982                     ; 1618 	lcd_disp_n(1, i >> 4);
6984  0001 4e            	swap	a
6985  0002 a40f          	and	a,#15
6986  0004 ae0100        	ldw	x,#256
6987  0007 97            	ld	xl,a
6988  0008 cd0000        	call	_lcd_disp_n
6990                     ; 1619 	lcd_disp_n(2, (i & 0x0F)/10);
6992  000b 7b01          	ld	a,(OFST+1,sp)
6993  000d a40f          	and	a,#15
6994  000f 5f            	clrw	x
6995  0010 97            	ld	xl,a
6996  0011 a60a          	ld	a,#10
6997  0013 62            	div	x,a
6998  0014 9f            	ld	a,xl
6999  0015 ae0200        	ldw	x,#512
7000  0018 97            	ld	xl,a
7001  0019 cd0000        	call	_lcd_disp_n
7003                     ; 1620 	lcd_disp_n(3, (i & 0x0F)%10);
7005  001c 7b01          	ld	a,(OFST+1,sp)
7006  001e a40f          	and	a,#15
7007  0020 5f            	clrw	x
7008  0021 97            	ld	xl,a
7009  0022 a60a          	ld	a,#10
7010  0024 62            	div	x,a
7011  0025 ae0300        	ldw	x,#768
7012  0028 97            	ld	xl,a
7013  0029 cd0000        	call	_lcd_disp_n
7015                     ; 1621 }
7018  002c 84            	pop	a
7019  002d 81            	ret	
7061                     ; 1623 void	disp_485(uint8_t next)
7061                     ; 1624 {
7062                     .text:	section	.text,new
7063  0000               _disp_485:
7067                     ; 1625 	if( _dsCount == 0 )
7069  0000 c60012        	ld	a,__dsCount
7070  0003 2609          	jrne	L3032
7071                     ; 1627 		_dsCount = 1;
7073  0005 35010012      	mov	__dsCount,#1
7074                     ; 1628 		lcd_clear(0);
7076  0009 cd0000        	call	_lcd_clear
7078                     ; 1629 		goto DispEntry;
7080  000c 2018          	jra	L5622
7081  000e               L3032:
7082                     ; 1633 		if( (_t20ms%100) != 0 )
7084  000e c60000        	ld	a,__t20ms
7085  0011 5f            	clrw	x
7086  0012 97            	ld	xl,a
7087  0013 a664          	ld	a,#100
7088  0015 cd0000        	call	c_smodx
7090  0018 5d            	tnzw	x
7091  0019 2705          	jreq	L7032
7092                     ; 1635 			_dsPrev = 0;
7094  001b 725f0013      	clr	__dsPrev
7095                     ; 1636 			return;
7098  001f 81            	ret	
7099  0020               L7032:
7100                     ; 1639 		if( _dsPrev != 0 )
7102  0020 c60013        	ld	a,__dsPrev
7103  0023 2701          	jreq	L5622
7104                     ; 1640 			return;
7107  0025 81            	ret	
7108  0026               L5622:
7109                     ; 1641 DispEntry:			
7109                     ; 1642 		_dsPrev = 1;
7111  0026 35010013      	mov	__dsPrev,#1
7112                     ; 1643 		LCD_BIT_SET(b1F);
7114  002a 5f            	clrw	x
7115  002b c60038        	ld	a,_iLF_DEF+56
7116  002e 97            	ld	xl,a
7117  002f d6540c        	ld	a,(21516,x)
7118  0032 ca0038        	or	a,_bLF_DEF+56
7119  0035 d7540c        	ld	(21516,x),a
7120                     ; 1644 		LCD_BIT_SET(b1E);
7122  0038 c60018        	ld	a,_iLF_DEF+24
7123  003b ad53          	call	LC046
7124  003d ca0018        	or	a,_bLF_DEF+24
7125  0040 d7540c        	ld	(21516,x),a
7126                     ; 1645 		LCD_BIT_SET(b1G);
7128  0043 c60028        	ld	a,_iLF_DEF+40
7129  0046 ad48          	call	LC046
7130  0048 ca0028        	or	a,_bLF_DEF+40
7131  004b d7540c        	ld	(21516,x),a
7132                     ; 1646 		LCD_BIT_SET(b1C);
7134  004e c60017        	ld	a,_iLF_DEF+23
7135  0051 ad3d          	call	LC046
7136  0053 ca0017        	or	a,_bLF_DEF+23
7137  0056 d7540c        	ld	(21516,x),a
7138                     ; 1647 		LCD_BIT_SET(b1D);
7140  0059 c60007        	ld	a,_iLF_DEF+7
7141  005c ad32          	call	LC046
7142  005e ca0007        	or	a,_bLF_DEF+7
7143  0061 d7540c        	ld	(21516,x),a
7144                     ; 1649 		if( _d485_id == 0 )
7146  0064 c6001d        	ld	a,__d485_id
7147  0067 2614          	jrne	L3132
7148                     ; 1651 			LCD_BIT_CLEAR(b1D);
7150  0069 c60007        	ld	a,_iLF_DEF+7
7151  006c 5f            	clrw	x
7152  006d 97            	ld	xl,a
7153  006e c60007        	ld	a,_bLF_DEF+7
7154  0071 43            	cpl	a
7155  0072 d4540c        	and	a,(21516,x)
7156  0075 d7540c        	ld	(21516,x),a
7157                     ; 1652 			_disp_485(debug_hn);
7159  0078 c60000        	ld	a,_debug_hn
7162  007b 2003          	jra	L5132
7163  007d               L3132:
7164                     ; 1656 			_disp_485(debug_br);
7166  007d c60000        	ld	a,_debug_br
7168  0080               L5132:
7169  0080 cd0000        	call	__disp_485
7170                     ; 1658 		_d485_id = _d485_id==0 ? 1 : 0;
7172  0083 c6001d        	ld	a,__d485_id
7173  0086 2603          	jrne	L0521
7174  0088 4c            	inc	a
7175  0089 2001          	jra	L2521
7176  008b               L0521:
7177  008b 4f            	clr	a
7178  008c               L2521:
7179  008c c7001d        	ld	__d485_id,a
7180                     ; 1660 }
7183  008f 81            	ret	
7184  0090               LC046:
7185  0090 5f            	clrw	x
7186  0091 97            	ld	xl,a
7187  0092 d6540c        	ld	a,(21516,x)
7188  0095 81            	ret	
7191                     	switch	.data
7192  001e               _error_display_refresh:
7193  001e 00            	dc.b	0
7275                     ; 1664 void	disp_statusCb(uint8_t key)
7275                     ; 1665 {
7276                     .text:	section	.text,new
7277  0000               _disp_statusCb:
7279  0000 88            	push	a
7280  0001 89            	pushw	x
7281       00000002      OFST:	set	2
7284                     ; 1668 	if( _ds == 220 || _ds == 221)
7286  0002 c60011        	ld	a,__ds
7287  0005 a1dc          	cp	a,#220
7288  0007 2739          	jreq	L7132
7290  0009 a1dd          	cp	a,#221
7291  000b 2735          	jreq	L7132
7292                     ; 1672 	if( error != 0 && error_type != 0 )
7294  000d c60000        	ld	a,_error
7295  0010 270e          	jreq	L5432
7297  0012 725d0000      	tnz	_error_type
7298  0016 2708          	jreq	L5432
7299                     ; 1674 			error_display(error_type, error);
7301  0018 97            	ld	xl,a
7302  0019 c60000        	ld	a,_error_type
7303  001c 95            	ld	xh,a
7304  001d cd0000        	call	_error_display
7306  0020               L5432:
7307                     ; 1679 	if( error_display_mode == 1 )
7309  0020 c6000c        	ld	a,_error_display_mode
7310  0023 4a            	dec	a
7311  0024 2610          	jrne	L7432
7312                     ; 1681 		disp_status_error(key, 99);
7314  0026 7b03          	ld	a,(OFST+1,sp)
7315  0028 ae0063        	ldw	x,#99
7316  002b 95            	ld	xh,a
7317  002c cd0000        	call	_disp_status_error
7319                     ; 1682 		error_display_refresh = 1;
7321  002f 3501001e      	mov	_error_display_refresh,#1
7322                     ; 1685 			return;
7324  0033 cc020d        	jra	L5532
7325  0036               L7432:
7326                     ; 1688 	if( error_display_refresh == 1 )
7328  0036 c6001e        	ld	a,_error_display_refresh
7329  0039 4a            	dec	a
7330  003a 2606          	jrne	L7132
7331                     ; 1690 		error_display_refresh = 0;
7333  003c c7001e        	ld	_error_display_refresh,a
7334                     ; 1691 		disp_status_loop_init();
7336  003f cd0000        	call	_disp_status_loop_init
7338  0042               L7132:
7339                     ; 1694 ERROR_JUMP:
7339                     ; 1695 	if( _ds == 1 )			disp_status_id(key, 37);// disp_status_id(key, 36);
7341  0042 c60011        	ld	a,__ds
7342  0045 a101          	cp	a,#1
7343  0047 260c          	jrne	L3532
7346  0049 7b03          	ld	a,(OFST+1,sp)
7347  004b ae0025        	ldw	x,#37
7348  004e 95            	ld	xh,a
7349  004f cd0000        	call	_disp_status_id
7352  0052 cc020d        	jra	L5532
7353  0055               L3532:
7354                     ; 1696 	else if( _ds == 36 )	disp_status_toffset(key, 37);
7356  0055 a124          	cp	a,#36
7357  0057 260c          	jrne	L7532
7360  0059 7b03          	ld	a,(OFST+1,sp)
7361  005b ae0025        	ldw	x,#37
7362  005e 95            	ld	xh,a
7363  005f cd0000        	call	_disp_status_toffset
7366  0062 cc020d        	jra	L5532
7367  0065               L7532:
7368                     ; 1697 	else if( _ds == 37 )	
7370  0065 a125          	cp	a,#37
7371  0067 2617          	jrne	L3632
7372                     ; 1699 		t = disp_status_run(key, 38, 1);
7374  0069 4b01          	push	#1
7375  006b 7b04          	ld	a,(OFST+2,sp)
7376  006d ae0026        	ldw	x,#38
7377  0070 95            	ld	xh,a
7378  0071 cd0000        	call	_disp_status_run
7380  0074 5b01          	addw	sp,#1
7382                     ; 1700 		if( t == 1 )
7384  0076 4a            	dec	a
7385  0077 26e9          	jrne	L5532
7386                     ; 1701 			_ds = 100;
7388  0079 35640011      	mov	__ds,#100
7389  007d cc020d        	jra	L5532
7390  0080               L3632:
7391                     ; 1703 	else if( _ds == 38 )	disp_status_exit(key, 100);
7393  0080 a126          	cp	a,#38
7394  0082 2608          	jrne	L1732
7397  0084 7b03          	ld	a,(OFST+1,sp)
7398  0086 cd0354        	call	LC048
7401  0089 cc020d        	jra	L5532
7402  008c               L1732:
7403                     ; 1705 	else if( _ds == 2 )		disp_status_id(key, 3);
7405  008c a102          	cp	a,#2
7406  008e 260c          	jrne	L5732
7409  0090 7b03          	ld	a,(OFST+1,sp)
7410  0092 ae0003        	ldw	x,#3
7411  0095 95            	ld	xh,a
7412  0096 cd0000        	call	_disp_status_id
7415  0099 cc020d        	jra	L5532
7416  009c               L5732:
7417                     ; 1706 	else if( _ds == 3 )	
7419  009c a103          	cp	a,#3
7420  009e 2617          	jrne	L1042
7421                     ; 1708 		t = disp_status_run_id(key, 38, 2);
7423  00a0 4b02          	push	#2
7424  00a2 7b04          	ld	a,(OFST+2,sp)
7425  00a4 ae0026        	ldw	x,#38
7426  00a7 95            	ld	xh,a
7427  00a8 cd0000        	call	_disp_status_run_id
7429  00ab 5b01          	addw	sp,#1
7431                     ; 1709 		if( t == 1 )
7433  00ad 4a            	dec	a
7434  00ae 26e9          	jrne	L5532
7435                     ; 1710 			_ds = 100;
7437  00b0 35640011      	mov	__ds,#100
7438  00b4 cc020d        	jra	L5532
7439  00b7               L1042:
7440                     ; 1713 	else if( _ds == 9 )		disp_status_run_op(key, 61);
7442  00b7 a109          	cp	a,#9
7443  00b9 260c          	jrne	L7042
7446  00bb 7b03          	ld	a,(OFST+1,sp)
7447  00bd ae003d        	ldw	x,#61
7448  00c0 95            	ld	xh,a
7449  00c1 cd0000        	call	_disp_status_run_op
7452  00c4 cc020d        	jra	L5532
7453  00c7               L7042:
7454                     ; 1714 	else if( _ds == 61 )	disp_status_cntl_op(key, 63);
7456  00c7 a13d          	cp	a,#61
7457  00c9 260c          	jrne	L3142
7460  00cb 7b03          	ld	a,(OFST+1,sp)
7461  00cd ae003f        	ldw	x,#63
7462  00d0 95            	ld	xh,a
7463  00d1 cd0000        	call	_disp_status_cntl_op
7466  00d4 cc020d        	jra	L5532
7467  00d7               L3142:
7468                     ; 1715 	else if( _ds == 63 )	disp_status_valveCount(key, 64);
7470  00d7 a13f          	cp	a,#63
7471  00d9 260c          	jrne	L7142
7474  00db 7b03          	ld	a,(OFST+1,sp)
7475  00dd ae0040        	ldw	x,#64
7476  00e0 95            	ld	xh,a
7477  00e1 cd0000        	call	_disp_status_valveCount
7480  00e4 cc020d        	jra	L5532
7481  00e7               L7142:
7482                     ; 1716 	else if( _ds == 64 )	disp_status_houseCapa(key, /*65*/66);	//	if opMode==0, skip
7484  00e7 a140          	cp	a,#64
7485  00e9 260c          	jrne	L3242
7488  00eb 7b03          	ld	a,(OFST+1,sp)
7489  00ed ae0042        	ldw	x,#66
7490  00f0 95            	ld	xh,a
7491  00f1 cd0000        	call	_disp_status_houseCapa
7494  00f4 cc020d        	jra	L5532
7495  00f7               L3242:
7496                     ; 1719 	else if( _ds == 66 )	disp_status_lpm(key, /*67*/68);		//	세대밸브 if cntlMode==1, skip
7498  00f7 a142          	cp	a,#66
7499  00f9 260c          	jrne	L7242
7502  00fb 7b03          	ld	a,(OFST+1,sp)
7503  00fd ae0044        	ldw	x,#68
7504  0100 95            	ld	xh,a
7505  0101 cd0000        	call	_disp_status_lpm
7508  0104 cc020d        	jra	L5532
7509  0107               L7242:
7510                     ; 1723 	else if( _ds == 68 )	disp_status_valveinfo(key, 69, 68);
7512  0107 a144          	cp	a,#68
7513  0109 260f          	jrne	L3342
7516  010b 4b44          	push	#68
7517  010d 7b04          	ld	a,(OFST+2,sp)
7518  010f ae0045        	ldw	x,#69
7519  0112 95            	ld	xh,a
7520  0113 cd0000        	call	_disp_status_valveinfo
7522  0116 84            	pop	a
7524  0117 cc020d        	jra	L5532
7525  011a               L3342:
7526                     ; 1724 	else if( _ds == 69 )	disp_status_plc(key, 70);
7528  011a a145          	cp	a,#69
7529  011c 260c          	jrne	L7342
7532  011e 7b03          	ld	a,(OFST+1,sp)
7533  0120 ae0046        	ldw	x,#70
7534  0123 95            	ld	xh,a
7535  0124 cd0000        	call	_disp_status_plc
7538  0127 cc020d        	jra	L5532
7539  012a               L7342:
7540                     ; 1725 	else if( _ds == 70 )	
7542  012a a146          	cp	a,#70
7543  012c 2617          	jrne	L3442
7544                     ; 1727 		t = disp_status_run(key, 71, 9);
7546  012e 4b09          	push	#9
7547  0130 7b04          	ld	a,(OFST+2,sp)
7548  0132 ae0047        	ldw	x,#71
7549  0135 95            	ld	xh,a
7550  0136 cd0000        	call	_disp_status_run
7552  0139 5b01          	addw	sp,#1
7554                     ; 1728 		if( t == 1 )
7556  013b 4a            	dec	a
7557  013c 26e9          	jrne	L5532
7558                     ; 1729 			_ds = 100;
7560  013e 35640011      	mov	__ds,#100
7561  0142 cc020d        	jra	L5532
7562  0145               L3442:
7563                     ; 1731 	else if( _ds == 71 )	disp_status_exit(key, 100);
7565  0145 a147          	cp	a,#71
7566  0147 2608          	jrne	L1542
7569  0149 7b03          	ld	a,(OFST+1,sp)
7570  014b cd0354        	call	LC048
7573  014e cc020d        	jra	L5532
7574  0151               L1542:
7575                     ; 1733 	else if( _ds == 10 )	
7577  0151 a10a          	cp	a,#10
7578  0153 2617          	jrne	L5542
7579                     ; 1735 		t = disp_status_run(key, 11, 9);
7581  0155 4b09          	push	#9
7582  0157 7b04          	ld	a,(OFST+2,sp)
7583  0159 ae000b        	ldw	x,#11
7584  015c 95            	ld	xh,a
7585  015d cd0000        	call	_disp_status_run
7587  0160 5b01          	addw	sp,#1
7589                     ; 1736 		if( t == 1 )
7591  0162 4a            	dec	a
7592  0163 26e9          	jrne	L5532
7593                     ; 1737 			_ds = 100;
7595  0165 35640011      	mov	__ds,#100
7596  0169 cc020d        	jra	L5532
7597  016c               L5542:
7598                     ; 1739 	else if( _ds == 11 )	disp_status_exit(key, 100);
7600  016c a10b          	cp	a,#11
7601  016e 2608          	jrne	L3642
7604  0170 7b03          	ld	a,(OFST+1,sp)
7605  0172 cd0354        	call	LC048
7608  0175 cc020d        	jra	L5532
7609  0178               L3642:
7610                     ; 1741 	else if( _ds == 12 )	disp_status_exit(key, 100);
7612  0178 a10c          	cp	a,#12
7613  017a 2608          	jrne	L7642
7616  017c 7b03          	ld	a,(OFST+1,sp)
7617  017e cd0354        	call	LC048
7620  0181 cc020d        	jra	L5532
7621  0184               L7642:
7622                     ; 1742 	else if( _ds == 15 )	
7624  0184 a10f          	cp	a,#15
7625  0186 2616          	jrne	L3742
7626                     ; 1744 		t = disp_status_run(key, 11, 20);
7628  0188 4b14          	push	#20
7629  018a 7b04          	ld	a,(OFST+2,sp)
7630  018c ae000b        	ldw	x,#11
7631  018f 95            	ld	xh,a
7632  0190 cd0000        	call	_disp_status_run
7634  0193 5b01          	addw	sp,#1
7636                     ; 1745 		if( t == 1 )
7638  0195 4a            	dec	a
7639  0196 2675          	jrne	L5532
7640                     ; 1746 			_ds = 100;
7642  0198 35640011      	mov	__ds,#100
7643  019c 206f          	jra	L5532
7644  019e               L3742:
7645                     ; 1748 	else if( _ds == 33 )	disp_status_toffset(key, 34);	//	mainR/C only
7647  019e a121          	cp	a,#33
7648  01a0 260b          	jrne	L1052
7651  01a2 7b03          	ld	a,(OFST+1,sp)
7652  01a4 ae0022        	ldw	x,#34
7653  01a7 95            	ld	xh,a
7654  01a8 cd0000        	call	_disp_status_toffset
7657  01ab 2060          	jra	L5532
7658  01ad               L1052:
7659                     ; 1749 	else if( _ds == 34 )	
7661  01ad a122          	cp	a,#34
7662  01af 2616          	jrne	L5052
7663                     ; 1751 		t = disp_status_run(key, 35, 33);
7665  01b1 4b21          	push	#33
7666  01b3 7b04          	ld	a,(OFST+2,sp)
7667  01b5 ae0023        	ldw	x,#35
7668  01b8 95            	ld	xh,a
7669  01b9 cd0000        	call	_disp_status_run
7671  01bc 5b01          	addw	sp,#1
7673                     ; 1752 		if( t == 1 )
7675  01be 4a            	dec	a
7676  01bf 264c          	jrne	L5532
7677                     ; 1753 			_ds = 100;
7679  01c1 35640011      	mov	__ds,#100
7680  01c5 2046          	jra	L5532
7681  01c7               L5052:
7682                     ; 1755 	else if( _ds == 35 )	disp_status_exit(key, 100);
7684  01c7 a123          	cp	a,#35
7685  01c9 2607          	jrne	L3152
7688  01cb 7b03          	ld	a,(OFST+1,sp)
7689  01cd cd0354        	call	LC048
7692  01d0 203b          	jra	L5532
7693  01d2               L3152:
7694                     ; 1757 	else if( _ds == 41 )	disp_status_command(key);
7696  01d2 a129          	cp	a,#41
7697  01d4 2607          	jrne	L7152
7700  01d6 7b03          	ld	a,(OFST+1,sp)
7701  01d8 cd0000        	call	_disp_status_command
7704  01db 2030          	jra	L5532
7705  01dd               L7152:
7706                     ; 1759 	else if( _ds == 100 )	
7708  01dd a164          	cp	a,#100
7709  01df 2616          	jrne	L3252
7710                     ; 1761 		__s = 0;
7712  01e1 725f0000      	clr	___s
7713                     ; 1762 		_dsCount = 0;
7715  01e5 725f0012      	clr	__dsCount
7716                     ; 1763 		_ds = 99;	
7718  01e9 35630011      	mov	__ds,#99
7719                     ; 1764 		_dsPrev = 0xff;
7721  01ed 35ff0013      	mov	__dsPrev,#255
7722                     ; 1765 		_remote = 0;
7724  01f1 725f0000      	clr	__remote
7726  01f5 2016          	jra	L5532
7727  01f7               L3252:
7728                     ; 1767 	else if( _ds == 101 || _ds == 133 )
7730  01f7 a165          	cp	a,#101
7731  01f9 2704          	jreq	L1352
7733  01fb a185          	cp	a,#133
7734  01fd 2611          	jrne	L7252
7735  01ff               L1352:
7736                     ; 1770 		_dsCount = __timer1s;
7738  01ff 5500000012    	mov	__dsCount,___timer1s
7739                     ; 1771 		_dsPrev = _ds - 100;
7741  0204 a064          	sub	a,#100
7742  0206 c70013        	ld	__dsPrev,a
7743                     ; 1772 		_ds = 200;
7745  0209 35c80011      	mov	__ds,#200
7747  020d               L5532:
7748                     ; 1890 }
7751  020d 5b03          	addw	sp,#3
7752  020f 81            	ret	
7753  0210               L7252:
7754                     ; 1774 	else if (_ds == 150)							// 온도보상
7756  0210 a196          	cp	a,#150
7757  0212 260b          	jrne	L5352
7758                     ; 1776 		disp_status_toffset(key, 151);	//	mainR/C only
7760  0214 7b03          	ld	a,(OFST+1,sp)
7761  0216 ae0097        	ldw	x,#151
7762  0219 95            	ld	xh,a
7763  021a cd0000        	call	_disp_status_toffset
7766  021d 20ee          	jra	L5532
7767  021f               L5352:
7768                     ; 1778 	else if (_ds == 151)							// 백라이트
7770  021f a197          	cp	a,#151
7771  0221 260b          	jrne	L1452
7772                     ; 1780 		disp_status_backlight2(key, 153);
7774  0223 7b03          	ld	a,(OFST+1,sp)
7775  0225 ae0099        	ldw	x,#153
7776  0228 95            	ld	xh,a
7777  0229 cd0000        	call	_disp_status_backlight2
7780  022c 20df          	jra	L5532
7781  022e               L1452:
7782                     ; 1782 	else if (_ds == 152) 
7784  022e a198          	cp	a,#152
7785  0230 2616          	jrne	L5452
7786                     ; 1784 		t = disp_status_run(key, 153, 150);
7788  0232 4b96          	push	#150
7789  0234 7b04          	ld	a,(OFST+2,sp)
7790  0236 ae0099        	ldw	x,#153
7791  0239 95            	ld	xh,a
7792  023a cd0000        	call	_disp_status_run
7794  023d 5b01          	addw	sp,#1
7796                     ; 1785 		if( t == 1 )
7798  023f 4a            	dec	a
7799  0240 26cb          	jrne	L5532
7800                     ; 1786 			_ds = 100;
7802  0242 35640011      	mov	__ds,#100
7803  0246 20c5          	jra	L5532
7804  0248               L5452:
7805                     ; 1788 	else if (_ds == 153)
7807  0248 a199          	cp	a,#153
7808  024a 260a          	jrne	L3552
7809                     ; 1790 		_ds = 100;
7811  024c 35640011      	mov	__ds,#100
7812                     ; 1791 		file_update2(0);
7814  0250 4f            	clr	a
7815  0251 cd0000        	call	_file_update2
7818  0254 20b7          	jra	L5532
7819  0256               L3552:
7820                     ; 1794 	else if (_ds == 160)							// 온도보상
7822  0256 a1a0          	cp	a,#160
7823  0258 260b          	jrne	L7552
7824                     ; 1796 		disp_status_toffset(key, 161);	//	mainR/C only
7826  025a 7b03          	ld	a,(OFST+1,sp)
7827  025c ae00a1        	ldw	x,#161
7828  025f 95            	ld	xh,a
7829  0260 cd0000        	call	_disp_status_toffset
7832  0263 20a8          	jra	L5532
7833  0265               L7552:
7834                     ; 1798 	else if (_ds == 161)							// 백라이트
7836  0265 a1a1          	cp	a,#161
7837  0267 260b          	jrne	L3652
7838                     ; 1800 		disp_status_backlight2(key, 162);
7840  0269 7b03          	ld	a,(OFST+1,sp)
7841  026b ae00a2        	ldw	x,#162
7842  026e 95            	ld	xh,a
7843  026f cd0000        	call	_disp_status_backlight2
7846  0272 2099          	jra	L5532
7847  0274               L3652:
7848                     ; 1802 	else if( _ds == 162 )
7850  0274 a1a2          	cp	a,#162
7851  0276 2606          	jrne	L7652
7852                     ; 1804 		_ds = 100;
7854  0278 35640011      	mov	__ds,#100
7856  027c 208f          	jra	L5532
7857  027e               L7652:
7858                     ; 1806 	else if( _ds == 200 )
7860  027e a1c8          	cp	a,#200
7861  0280 2618          	jrne	L3752
7862                     ; 1808 		if( _dsCount == __timer1s )
7864  0282 c60012        	ld	a,__dsCount
7865  0285 c10000        	cp	a,___timer1s
7866  0288 2783          	jreq	L5532
7867                     ; 1809 			return;
7869                     ; 1810 		STATUS_NEXT(_dsPrev);
7871  028a 5500130011    	mov	__ds,__dsPrev
7874  028f 725f0012      	clr	__dsCount
7877  0293 35ff0013      	mov	__dsPrev,#255
7880  0297 cc020d        	jra	L5532
7881  029a               L3752:
7882                     ; 1814 	else if( _ds == 81 )	{	disp_write_file(12);	}
7884  029a a151          	cp	a,#81
7885  029c 2608          	jrne	L1062
7888  029e a60c          	ld	a,#12
7889  02a0 cd0000        	call	_disp_write_file
7892  02a3 cc020d        	jra	L5532
7893  02a6               L1062:
7894                     ; 1815 	else if( _ds == 95 )	{	disp_485(12);	}
7896  02a6 a15f          	cp	a,#95
7897  02a8 2608          	jrne	L5062
7900  02aa a60c          	ld	a,#12
7901  02ac cd0000        	call	_disp_485
7904  02af cc020d        	jra	L5532
7905  02b2               L5062:
7906                     ; 1816 	else if( _ds == 96 )	{	disp_write_file(12);	}
7908  02b2 a160          	cp	a,#96
7909  02b4 2608          	jrne	L1162
7912  02b6 a60c          	ld	a,#12
7913  02b8 cd0000        	call	_disp_write_file
7916  02bb cc020d        	jra	L5532
7917  02be               L1162:
7918                     ; 1843 	else if( _ds == 99 )
7920  02be a163          	cp	a,#99
7921  02c0 2659          	jrne	L5162
7922                     ; 1846 		t = getCurrTemp();
7924  02c2 cd0000        	call	_getCurrTemp
7926  02c5 6b02          	ld	(OFST+0,sp),a
7928                     ; 1847 		if( uiInfo.tOffset != 100 )
7930  02c7 c60011        	ld	a,_uiInfo+17
7931  02ca a164          	cp	a,#100
7932  02cc 2711          	jreq	L7162
7933                     ; 1849 			if( uiInfo.tOffset > 100 )
7935  02ce a165          	cp	a,#101
7936  02d0 2506          	jrult	L1262
7937                     ; 1850 				t = t + (uiInfo.tOffset-100);
7939  02d2 a064          	sub	a,#100
7940  02d4 1b02          	add	a,(OFST+0,sp)
7942  02d6 2005          	jp	LC047
7943  02d8               L1262:
7944                     ; 1852 				t = t - uiInfo.tOffset;
7946  02d8 7b02          	ld	a,(OFST+0,sp)
7947  02da c00011        	sub	a,_uiInfo+17
7948  02dd               LC047:
7949  02dd 6b02          	ld	(OFST+0,sp),a
7951  02df               L7162:
7952                     ; 1854 		if( uiInfo.tCurr != t )
7954  02df c60002        	ld	a,_uiInfo+2
7955  02e2 1102          	cp	a,(OFST+0,sp)
7956  02e4 2715          	jreq	L5262
7957                     ; 1856 			uiInfo.tCurr = t;
7959  02e6 7b02          	ld	a,(OFST+0,sp)
7960  02e8 c70002        	ld	_uiInfo+2,a
7961                     ; 1857 			if( _remote == 0 )
7963  02eb c60000        	ld	a,__remote
7964  02ee 260b          	jrne	L5262
7965                     ; 1860 				if( _disp_temp == 1 )
7967  02f0 c60008        	ld	a,__disp_temp
7968  02f3 4a            	dec	a
7969  02f4 2605          	jrne	L5262
7970                     ; 1861 					ui_disp_temp_curr(t);
7972  02f6 7b02          	ld	a,(OFST+0,sp)
7973  02f8 cd0000        	call	_ui_disp_temp_curr
7975  02fb               L5262:
7976                     ; 1865 		if (key == 200) {
7978  02fb 7b03          	ld	a,(OFST+1,sp)
7979  02fd a1c8          	cp	a,#200
7980  02ff 2604          	jrne	L3362
7981                     ; 1866 			j = 2;
7983                     ; 1867 			_disp_temp = 1;
7985  0301 35010008      	mov	__disp_temp,#1
7986  0305               L3362:
7987                     ; 1870 		_disp_temp = 0;
7989  0305 725f0008      	clr	__disp_temp
7990                     ; 1873 		if( uiInfo.mode == 0 )	
7992  0309 725d0008      	tnz	_uiInfo+8
7993  030d 2606          	jrne	L5362
7994                     ; 1874 			disp_status_loop_client(key);
7996  030f cd0000        	call	_disp_status_loop_client
7999  0312 cc020d        	jra	L5532
8000  0315               L5362:
8001                     ; 1876 			disp_status_loop_host(key);
8003  0315 cd0000        	call	_disp_status_loop_host
8005  0318 cc020d        	jra	L5532
8006  031b               L5162:
8007                     ; 1878 	else if( _ds == 220 )
8009  031b a1dc          	cp	a,#220
8010  031d 260c          	jrne	L3462
8011                     ; 1880 		disp_status_id(key, 221);
8013  031f 7b03          	ld	a,(OFST+1,sp)
8014  0321 ae00dd        	ldw	x,#221
8015  0324 95            	ld	xh,a
8016  0325 cd0000        	call	_disp_status_id
8019  0328 cc020d        	jra	L5532
8020  032b               L3462:
8021                     ; 1882 	else if( _ds == 221 )
8023  032b a1dd          	cp	a,#221
8024  032d 26f9          	jrne	L5532
8025                     ; 1884 		FW_ID(uiInfoSet.id);
8027  032f c6006e        	ld	a,_uiInfoSet+1
8028  0332 ae0a00        	ldw	x,#2560
8029  0335 97            	ld	xl,a
8030  0336 cd0000        	call	_file_write
8032                     ; 1885 		FW_MODE(uiInfoSet.mode);
8034  0339 c60072        	ld	a,_uiInfoSet+5
8035  033c ae0900        	ldw	x,#2304
8036  033f 97            	ld	xl,a
8037  0340 cd0000        	call	_file_write
8039                     ; 1886 		uiInfo.id = uiInfoSet.id;
8041  0343 55006e0004    	mov	_uiInfo+4,_uiInfoSet+1
8042                     ; 1887 		uiInfo.mode = uiInfoSet.mode;
8044  0348 5500720008    	mov	_uiInfo+8,_uiInfoSet+5
8045                     ; 1888 			_ds = 100;
8047  034d 35640011      	mov	__ds,#100
8048  0351 cc020d        	jra	L5532
8049  0354               LC048:
8050  0354 ae0064        	ldw	x,#100
8051  0357 95            	ld	xh,a
8052  0358 cc0000        	jp	_disp_status_exit
8096                     ; 1892 void	copy_info(uint8_t next)
8096                     ; 1893 {
8097                     .text:	section	.text,new
8098  0000               _copy_info:
8100  0000 88            	push	a
8101       00000001      OFST:	set	1
8104                     ; 1895 	disp_set_state(next);
8106  0001 cd0000        	call	_disp_set_state
8108                     ; 1896 	uiInfoSet.id = uiInfo.id;
8110  0004 550004006e    	mov	_uiInfoSet+1,_uiInfo+4
8111                     ; 1897 	uiInfoSet.cnt = uiInfo.cnt;
8113  0009 550005006f    	mov	_uiInfoSet+2,_uiInfo+5
8114                     ; 1898 	uiInfoSet.cnt_sub = uiInfo.cnt_sub;
8116  000e 5500060070    	mov	_uiInfoSet+3,_uiInfo+6
8117                     ; 1899 	uiInfoSet.opMode = uiInfo.opMode;
8119  0013 5500070071    	mov	_uiInfoSet+4,_uiInfo+7
8120                     ; 1900 	uiInfoSet.mode = uiInfo.mode;
8122  0018 5500080072    	mov	_uiInfoSet+5,_uiInfo+8
8123                     ; 1901 	uiInfoSet.controlMode = uiInfo.controlMode;
8125  001d 5500090073    	mov	_uiInfoSet+6,_uiInfo+9
8126                     ; 1902 	uiInfoSet.valve = uiInfo.valve;
8128  0022 55000a0074    	mov	_uiInfoSet+7,_uiInfo+10
8129                     ; 1903 	uiInfoSet.valve_sub = uiInfo.valve_sub;
8131  0027 55000b0075    	mov	_uiInfoSet+8,_uiInfo+11
8132                     ; 1904 	uiInfoSet.poType = uiInfo.poType;
8134  002c 55000f0076    	mov	_uiInfoSet+9,_uiInfo+15
8135                     ; 1905 	uiInfoSet.houseCapa = uiInfo.houseCapa;
8137  0031 5500100077    	mov	_uiInfoSet+10,_uiInfo+16
8138                     ; 1906 	uiInfoSet.tOffset = uiInfo.tOffset;
8140  0036 5500110078    	mov	_uiInfoSet+11,_uiInfo+17
8141                     ; 1907 	uiInfoSet.tempOffset = uiInfo.tempOffset;
8143  003b 5500120079    	mov	_uiInfoSet+12,_uiInfo+18
8144                     ; 1908 	uiInfoSet.lpmType = uiInfo.lpmType;
8146  0040 550013007a    	mov	_uiInfoSet+13,_uiInfo+19
8147                     ; 1909 	uiInfoSet.lpmType_sub = uiInfo.lpmType_sub;
8149  0045 550014007b    	mov	_uiInfoSet+14,_uiInfo+20
8150                     ; 1910 	uiInfoSet.subRCLock = uiInfo.subRCLock;
8152  004a 55005d009c    	mov	_uiInfoSet+47,_uiInfo+93
8153                     ; 1911 	uiInfoSet.cntlMode = uiInfo.cntlMode;
8155                     ; 1912 	for( i=0; i<8; i++ )
8157  004f 4f            	clr	a
8158  0050 550003006d    	mov	_uiInfoSet,_uiInfo+3
8159  0055 6b01          	ld	(OFST+0,sp),a
8161  0057               L7662:
8162                     ; 1914 		uiInfoSet.valve_len[i] = uiInfo.valve_len[i];
8164  0057 5f            	clrw	x
8165  0058 97            	ld	xl,a
8166  0059 d60015        	ld	a,(_uiInfo+21,x)
8167  005c d7007c        	ld	(_uiInfoSet+15,x),a
8168                     ; 1915 		uiInfoSet.valve_rc[i] = uiInfo.valve_rc[i];
8170  005f 5f            	clrw	x
8171  0060 7b01          	ld	a,(OFST+0,sp)
8172  0062 97            	ld	xl,a
8173  0063 d6001d        	ld	a,(_uiInfo+29,x)
8174  0066 d70084        	ld	(_uiInfoSet+23,x),a
8175                     ; 1916 		uiInfoSet.valve_sub_len[i] = uiInfo.valve_sub_len[i];
8177  0069 5f            	clrw	x
8178  006a 7b01          	ld	a,(OFST+0,sp)
8179  006c 97            	ld	xl,a
8180  006d d60025        	ld	a,(_uiInfo+37,x)
8181  0070 d7008c        	ld	(_uiInfoSet+31,x),a
8182                     ; 1917 		uiInfoSet.valve_sub_rc[i] = uiInfo.valve_sub_rc[i];
8184  0073 5f            	clrw	x
8185  0074 7b01          	ld	a,(OFST+0,sp)
8186  0076 97            	ld	xl,a
8187  0077 d6002d        	ld	a,(_uiInfo+45,x)
8188  007a d70094        	ld	(_uiInfoSet+39,x),a
8189                     ; 1912 	for( i=0; i<8; i++ )
8191  007d 0c01          	inc	(OFST+0,sp)
8195  007f 7b01          	ld	a,(OFST+0,sp)
8196  0081 a108          	cp	a,#8
8197  0083 25d2          	jrult	L7662
8198                     ; 1919 	uiInfoSet.plc = uiInfo.plc;
8200  0085 55006400a2    	mov	_uiInfoSet+53,_uiInfo+100
8201                     ; 1925 	lcd_blink_npos_clear();
8203  008a cd0000        	call	_lcd_blink_npos_clear
8205                     ; 1926 	lcd_blink_clear();
8207  008d cd0000        	call	_lcd_blink_clear
8209                     ; 1927 }
8212  0090 84            	pop	a
8213  0091 81            	ret	
8248                     ; 1931 void	copy_infoSet(void)
8248                     ; 1932 {
8249                     .text:	section	.text,new
8250  0000               _copy_infoSet:
8252       00000001      OFST:	set	1
8255                     ; 1934 	uiInfo.id = uiInfoSet.id;
8257  0000 55006e0004    	mov	_uiInfo+4,_uiInfoSet+1
8258                     ; 1935 	uiInfo.cnt = uiInfoSet.cnt;
8260  0005 55006f0005    	mov	_uiInfo+5,_uiInfoSet+2
8261                     ; 1936 	uiInfo.cnt_sub = uiInfoSet.cnt_sub;
8263  000a 5500700006    	mov	_uiInfo+6,_uiInfoSet+3
8264                     ; 1937 	uiInfo.opMode = uiInfoSet.opMode;
8266  000f 5500710007    	mov	_uiInfo+7,_uiInfoSet+4
8267                     ; 1938 	uiInfo.mode = uiInfoSet.mode;
8269  0014 5500720008    	mov	_uiInfo+8,_uiInfoSet+5
8270                     ; 1939 	uiInfo.controlMode = uiInfoSet.controlMode;
8272  0019 5500730009    	mov	_uiInfo+9,_uiInfoSet+6
8273                     ; 1940 	uiInfo.valve = uiInfoSet.valve;
8275  001e 550074000a    	mov	_uiInfo+10,_uiInfoSet+7
8276                     ; 1941 	uiInfo.valve_sub = uiInfoSet.valve_sub;
8278  0023 550075000b    	mov	_uiInfo+11,_uiInfoSet+8
8279                     ; 1942 	uiInfo.poType = uiInfoSet.poType;
8281  0028 550076000f    	mov	_uiInfo+15,_uiInfoSet+9
8282                     ; 1943 	uiInfo.houseCapa = uiInfoSet.houseCapa;
8284  002d 5500770010    	mov	_uiInfo+16,_uiInfoSet+10
8285                     ; 1944 	uiInfo.tOffset = uiInfoSet.tOffset;
8287  0032 5500780011    	mov	_uiInfo+17,_uiInfoSet+11
8288                     ; 1945 	uiInfo.tempOffset = uiInfoSet.tempOffset;
8290  0037 5500790012    	mov	_uiInfo+18,_uiInfoSet+12
8291                     ; 1946 	uiInfo.lpmType = uiInfoSet.lpmType;
8293  003c 55007a0013    	mov	_uiInfo+19,_uiInfoSet+13
8294                     ; 1947 	uiInfo.lpmType_sub = uiInfoSet.lpmType_sub;
8296  0041 55007b0014    	mov	_uiInfo+20,_uiInfoSet+14
8297                     ; 1948 	uiInfo.subRCLock = uiInfoSet.subRCLock;
8299  0046 55009c005d    	mov	_uiInfo+93,_uiInfoSet+47
8300  004b 88            	push	a
8301                     ; 1949 	uiInfo.cntlMode = uiInfoSet.cntlMode;
8303  004c 55006d0003    	mov	_uiInfo+3,_uiInfoSet
8304                     ; 1950 	for( i=0; i<8; i++ )
8306  0051 4f            	clr	a
8307  0052 6b01          	ld	(OFST+0,sp),a
8309  0054               L1172:
8310                     ; 1952 		uiInfo.valve_len[i] = uiInfoSet.valve_len[i];
8312  0054 5f            	clrw	x
8313  0055 97            	ld	xl,a
8314  0056 d6007c        	ld	a,(_uiInfoSet+15,x)
8315  0059 d70015        	ld	(_uiInfo+21,x),a
8316                     ; 1953 		uiInfo.valve_rc[i] = uiInfoSet.valve_rc[i];
8318  005c 5f            	clrw	x
8319  005d 7b01          	ld	a,(OFST+0,sp)
8320  005f 97            	ld	xl,a
8321  0060 d60084        	ld	a,(_uiInfoSet+23,x)
8322  0063 d7001d        	ld	(_uiInfo+29,x),a
8323                     ; 1954 		uiInfo.valve_sub_len[i] = uiInfoSet.valve_sub_len[i];
8325  0066 5f            	clrw	x
8326  0067 7b01          	ld	a,(OFST+0,sp)
8327  0069 97            	ld	xl,a
8328  006a d6008c        	ld	a,(_uiInfoSet+31,x)
8329  006d d70025        	ld	(_uiInfo+37,x),a
8330                     ; 1955 		uiInfo.valve_sub_rc[i] = uiInfoSet.valve_sub_rc[i];
8332  0070 5f            	clrw	x
8333  0071 7b01          	ld	a,(OFST+0,sp)
8334  0073 97            	ld	xl,a
8335  0074 d60094        	ld	a,(_uiInfoSet+39,x)
8336  0077 d7002d        	ld	(_uiInfo+45,x),a
8337                     ; 1950 	for( i=0; i<8; i++ )
8339  007a 0c01          	inc	(OFST+0,sp)
8343  007c 7b01          	ld	a,(OFST+0,sp)
8344  007e a108          	cp	a,#8
8345  0080 25d2          	jrult	L1172
8346                     ; 1957 	uiInfo.plc = uiInfoSet.plc;
8348  0082 c600a2        	ld	a,_uiInfoSet+53
8349  0085 c70064        	ld	_uiInfo+100,a
8350                     ; 1958 	if( uiInfo.plc == 0 )
8352  0088 2605          	jrne	L7172
8353                     ; 1960 		_boiler_type = 0;
8355  008a c70000        	ld	__boiler_type,a
8357  008d 2008          	jra	L1272
8358  008f               L7172:
8359                     ; 1964 		_boiler_type = 1;
8361  008f 35010000      	mov	__boiler_type,#1
8362                     ; 1965 		uiInfo.plc--;
8364  0093 725a0064      	dec	_uiInfo+100
8365  0097               L1272:
8366                     ; 1967 }
8369  0097 84            	pop	a
8370  0098 81            	ret	
8423                     ; 1972 void	disp_status(uint8_t key)
8423                     ; 1973 {
8424                     .text:	section	.text,new
8425  0000               _disp_status:
8427  0000 88            	push	a
8428       00000000      OFST:	set	0
8431                     ; 1974 	lcd_blinkCb();
8433  0001 cd0000        	call	_lcd_blinkCb
8435                     ; 1976 	disp_statusCb(key);
8437  0004 7b01          	ld	a,(OFST+1,sp)
8438  0006 cd0000        	call	_disp_statusCb
8440                     ; 1979 	uiInfo.enc = 0;
8442  0009 725f0000      	clr	_uiInfo
8443                     ; 1982 	if( _updateBit != 0 && _updateTimer != __timer1s )
8445  000d c60006        	ld	a,__updateBit
8446  0010 2772          	jreq	L3572
8448  0012 c60005        	ld	a,__updateTimer
8449  0015 c10000        	cp	a,___timer1s
8450  0018 276a          	jreq	L3572
8451                     ; 1984 		_updateTimer = __timer1s;
8453  001a 5500000005    	mov	__updateTimer,___timer1s
8454                     ; 1985 		_updateCount--;
8456  001f 725a0007      	dec	__updateCount
8457                     ; 1986 		if( _updateCount == 0 )
8459  0023 265f          	jrne	L3572
8460                     ; 1988 			if( (_updateBit&BIT_REPEAT) != 0 )	{FW_REPEAT(uiInfo.repeat);	}
8462  0025 720100060a    	btjf	__updateBit,#0,L7572
8465  002a c6000c        	ld	a,_uiInfo+12
8466  002d ae0f00        	ldw	x,#3840
8467  0030 97            	ld	xl,a
8468  0031 cd0000        	call	_file_write
8470  0034               L7572:
8471                     ; 1989 			if( (_updateBit&BIT_RESERVE) != 0 )	{FW_RESERVE(uiInfo.reserve);}
8473  0034 720300060a    	btjf	__updateBit,#1,L1672
8476  0039 c6000d        	ld	a,_uiInfo+13
8477  003c ae1000        	ldw	x,#4096
8478  003f 97            	ld	xl,a
8479  0040 cd0000        	call	_file_write
8481  0043               L1672:
8482                     ; 1990 			if( (_updateBit&BIT_TSETUP) != 0 )	
8484  0043 720500061c    	btjf	__updateBit,#2,L3672
8485                     ; 1993 				if( uiInfo._temp[3] != 0 )
8487  0048 c60063        	ld	a,_uiInfo+99
8488  004b 270d          	jreq	L5672
8489                     ; 1995 					FW_TSETUP(uiInfo._temp[3]);
8491  004d ae1100        	ldw	x,#4352
8492  0050 97            	ld	xl,a
8493  0051 cd0000        	call	_file_write
8495                     ; 1996 					uiInfo._temp[3] = 0;
8497  0054 725f0063      	clr	_uiInfo+99
8499  0058 200a          	jra	L3672
8500  005a               L5672:
8501                     ; 1999 					FW_TSETUP(uiInfo.tSetup);
8503  005a c6000e        	ld	a,_uiInfo+14
8504  005d ae1100        	ldw	x,#4352
8505  0060 97            	ld	xl,a
8506  0061 cd0000        	call	_file_write
8508  0064               L3672:
8509                     ; 2001 			if( (_updateBit&BIT_DISPMODE) != 0 ){
8511  0064 720700060a    	btjf	__updateBit,#3,L1772
8512                     ; 2002 				if (uiInfo.mode == SETTING_MODE_SUB) {
8514                     ; 2004 						FW_DISPMODE(_disp_mode);
8517                     ; 2007 					FW_DISPMODE(_disp_mode);
8520  0069 c60000        	ld	a,__disp_mode
8521  006c ae2900        	ldw	x,#10496
8522  006f 97            	ld	xl,a
8523  0070 cd0000        	call	_file_write
8525  0073               L1772:
8526                     ; 2011 			if( (_updateBit&BIT_REPEAT) != 0 || (_updateBit&BIT_RESERVE) != 0 )	
8528  0073 7200000605    	btjt	__updateBit,#0,L1003
8530  0078 7203000603    	btjf	__updateBit,#1,L7772
8531  007d               L1003:
8532                     ; 2013 				timerEventClear();
8534  007d cd0000        	call	_timerEventClear
8536  0080               L7772:
8537                     ; 2016 			_updateBit = 0;
8539  0080 725f0006      	clr	__updateBit
8540  0084               L3572:
8541                     ; 2019 	if( key==0 )
8543  0084 7b01          	ld	a,(OFST+1,sp)
8544  0086 2602          	jrne	L3003
8545                     ; 2020 		return;
8548  0088 84            	pop	a
8549  0089 81            	ret	
8550  008a               L3003:
8551                     ; 2022 	if( _key_continue == 1 )
8553  008a c60000        	ld	a,__key_continue
8554  008d 4a            	dec	a
8555  008e 2629          	jrne	L5003
8556                     ; 2025 		if( key==4 )	{	disp_statusCb(200);}
8558  0090 7b01          	ld	a,(OFST+1,sp)
8559  0092 a104          	cp	a,#4
8560  0094 2607          	jrne	L7003
8563  0096 a6c8          	ld	a,#200
8564  0098 cd0000        	call	_disp_statusCb
8567  009b 2016          	jra	L1103
8568  009d               L7003:
8569                     ; 2032 		else if( key==0x55 )
8571  009d a155          	cp	a,#85
8572  009f 2603cc017e    	jreq	L5372
8573                     ; 2035 			goto SetupRc;
8575                     ; 2037 		else if( key==0x53 )
8577  00a4 a153          	cp	a,#83
8578  00a6 260b          	jrne	L1103
8579                     ; 2040 			disp_set_state(160);
8581  00a8 a6a0          	ld	a,#160
8582  00aa cd0000        	call	_disp_set_state
8584                     ; 2041 			lcd_blink_npos_clear();
8586  00ad cd0000        	call	_lcd_blink_npos_clear
8588                     ; 2042 			lcd_blink_clear();		
8590  00b0 cd0000        	call	_lcd_blink_clear
8592  00b3               L1103:
8593                     ; 2044 		_key_continue = 0;
8595  00b3 725f0000      	clr	__key_continue
8596                     ; 2045 		goto SetupEntry;
8598  00b7 2078          	jra	L7272
8599  00b9               L5003:
8600                     ; 2048 	if( key == _keypwMaster[_keypwIndexMaster] )
8602  00b9 c6000e        	ld	a,__keypwIndexMaster
8603  00bc 5f            	clrw	x
8604  00bd 97            	ld	xl,a
8605  00be d60000        	ld	a,(__keypwMaster,x)
8606  00c1 1101          	cp	a,(OFST+1,sp)
8607  00c3 2622          	jrne	L1203
8608                     ; 2050 		_keypwIndexMaster++;
8610  00c5 725c000e      	inc	__keypwIndexMaster
8611                     ; 2051 		if( _keypwIndexMaster == 6 )
8613  00c9 c6000e        	ld	a,__keypwIndexMaster
8614  00cc a106          	cp	a,#6
8615  00ce 2625          	jrne	L5203
8616                     ; 2053 			_keypwIndexMaster = 0;
8618  00d0 725f000e      	clr	__keypwIndexMaster
8619                     ; 2054 SetupMaster:		
8619                     ; 2055 			uiInfo.id = 1;
8621  00d4 35010004      	mov	_uiInfo+4,#1
8622                     ; 2056 			uiInfo.mode = 1;
8624  00d8 35010008      	mov	_uiInfo+8,#1
8625                     ; 2057 			uiInfo.controlMode = 0;
8627  00dc 725f0009      	clr	_uiInfo+9
8628                     ; 2058 			copy_info(9);
8630  00e0 a609          	ld	a,#9
8631  00e2 cd0000        	call	_copy_info
8633  00e5 200e          	jra	L5203
8634  00e7               L1203:
8635                     ; 2063 		_keypwIndexMaster = 0;
8637  00e7 725f000e      	clr	__keypwIndexMaster
8638                     ; 2064 		if( key == _keypwMaster[_keypwIndexMaster] )
8640  00eb 7b01          	ld	a,(OFST+1,sp)
8641  00ed a104          	cp	a,#4
8642  00ef 2604          	jrne	L5203
8643                     ; 2065 			_keypwIndexMaster++;
8645  00f1 725c000e      	inc	__keypwIndexMaster
8646  00f5               L5203:
8647                     ; 2068 	if( key == _keypwMaster2[_keypwIndexMaster2] )
8649  00f5 c6000f        	ld	a,__keypwIndexMaster2
8650  00f8 5f            	clrw	x
8651  00f9 97            	ld	xl,a
8652  00fa d60006        	ld	a,(__keypwMaster2,x)
8653  00fd 1101          	cp	a,(OFST+1,sp)
8654  00ff 2622          	jrne	L1303
8655                     ; 2070 		_keypwIndexMaster2++;
8657  0101 725c000f      	inc	__keypwIndexMaster2
8658                     ; 2071 		if( _keypwIndexMaster2 == 6 )
8660  0105 c6000f        	ld	a,__keypwIndexMaster2
8661  0108 a106          	cp	a,#6
8662  010a 2625          	jrne	L7272
8663                     ; 2073 			_keypwIndexMaster2 = 0;
8665  010c 725f000f      	clr	__keypwIndexMaster2
8666                     ; 2074 SetupSub:
8666                     ; 2075 			uiInfo.id = 1;
8668  0110 35010004      	mov	_uiInfo+4,#1
8669                     ; 2076 			uiInfo.mode = 1;
8671  0114 35010008      	mov	_uiInfo+8,#1
8672                     ; 2077 			uiInfo.controlMode = 1;
8674  0118 35010009      	mov	_uiInfo+9,#1
8675                     ; 2078 			copy_info(9);
8677  011c a609          	ld	a,#9
8678  011e cd0000        	call	_copy_info
8680  0121 200e          	jra	L7272
8681  0123               L1303:
8682                     ; 2083 		_keypwIndexMaster2 = 0;
8684  0123 725f000f      	clr	__keypwIndexMaster2
8685                     ; 2084 		if( key == _keypwMaster2[_keypwIndexMaster2] )
8687  0127 7b01          	ld	a,(OFST+1,sp)
8688  0129 a104          	cp	a,#4
8689  012b 2604          	jrne	L7272
8690                     ; 2085 			_keypwIndexMaster2++;
8692  012d 725c000f      	inc	__keypwIndexMaster2
8693  0131               L7272:
8694                     ; 2088 SetupEntry:		
8694                     ; 2089 	if( key == 0x88 )
8696  0131 7b01          	ld	a,(OFST+1,sp)
8697  0133 a188          	cp	a,#136
8698  0135 261a          	jrne	L1403
8699                     ; 2091 SetupRoomCntl:		
8699                     ; 2092 		uiInfo.enc = 0;
8701  0137 725f0000      	clr	_uiInfo
8702                     ; 2093 		if( uiInfo.mode == 0 )
8704  013b c60008        	ld	a,_uiInfo+8
8705  013e 2604          	jrne	L3403
8706                     ; 2094 			uiInfo.id = 2;
8708  0140 35020004      	mov	_uiInfo+4,#2
8709  0144               L3403:
8710                     ; 2095 		copy_info(uiInfo.mode==0 ? 101 : 133);
8712  0144 c60008        	ld	a,_uiInfo+8
8713  0147 2604          	jrne	L0641
8714  0149 a665          	ld	a,#101
8715  014b 2013          	jra	LC050
8716  014d               L0641:
8717  014d a685          	ld	a,#133
8720  014f 200f          	jp	LC050
8721  0151               L1403:
8722                     ; 2097 	else if( key == 0x89 && uiInfo.mode == 1 )
8724  0151 a189          	cp	a,#137
8725  0153 260e          	jrne	L5403
8727  0155 c60008        	ld	a,_uiInfo+8
8728  0158 4a            	dec	a
8729  0159 2608          	jrne	L5403
8730                     ; 2099 SetupCommand:		
8730                     ; 2100 		uiInfo.enc = 0;
8732  015b c70000        	ld	_uiInfo,a
8733                     ; 2101 		copy_info(41);
8735  015e a629          	ld	a,#41
8736  0160               LC050:
8737  0160 cd0000        	call	_copy_info
8739  0163               L5403:
8740                     ; 2122 	if( key == _keypwClient[_keypwIndexClient] )
8742  0163 c60010        	ld	a,__keypwIndexClient
8743  0166 5f            	clrw	x
8744  0167 97            	ld	xl,a
8745  0168 d6000c        	ld	a,(__keypwClient,x)
8746  016b 1101          	cp	a,(OFST+1,sp)
8747  016d 261c          	jrne	L1503
8748                     ; 2124 		_keypwIndexClient++;
8750  016f 725c0010      	inc	__keypwIndexClient
8751                     ; 2125 		if( _keypwIndexClient == 6 )
8753  0173 c60010        	ld	a,__keypwIndexClient
8754  0176 a106          	cp	a,#6
8755  0178 261f          	jrne	L5503
8756                     ; 2127 			_keypwIndexClient = 0;
8758  017a 725f0010      	clr	__keypwIndexClient
8759  017e               L5372:
8760                     ; 2128 SetupRc:
8760                     ; 2129 //			uiInfo.id = 2;
8760                     ; 2130 //			uiInfo.mode = 0;
8760                     ; 2131 //			copy_info(101);
8760                     ; 2132 	lcd_blink_npos_clear();
8762  017e cd0000        	call	_lcd_blink_npos_clear
8764                     ; 2133 	lcd_blink_clear();
8766  0181 cd0000        	call	_lcd_blink_clear
8768                     ; 2134 	disp_set_state(220);
8770  0184 a6dc          	ld	a,#220
8771  0186 cd0000        	call	_disp_set_state
8773  0189 200e          	jra	L5503
8774  018b               L1503:
8775                     ; 2139 		_keypwIndexClient = 0;
8777  018b 725f0010      	clr	__keypwIndexClient
8778                     ; 2140 		if( key == _keypwClient[_keypwIndexClient] )
8780  018f 7b01          	ld	a,(OFST+1,sp)
8781  0191 a104          	cp	a,#4
8782  0193 2604          	jrne	L5503
8783                     ; 2141 			_keypwIndexClient++;
8785  0195 725c0010      	inc	__keypwIndexClient
8786  0199               L5503:
8787                     ; 2143 }
8790  0199 84            	pop	a
8791  019a 81            	ret	
9562                     	xref	__key_continue
9563                     	xref	_timerEventClear
9564                     	xref	__boiler_type
9565                     	xdef	_disp_statusCb
9566                     	xdef	_error_display_refresh
9567                     	xdef	_disp_485
9568                     	xdef	__disp_485
9569                     	xdef	_disp_set_state
9570                     	xdef	_disp_write_file
9571                     	xdef	__d485_id
9572                     	xref	_debug_br
9573                     	xref	_debug_hn
9574                     	xref	__remote
9575                     	xref	_getCurrTemp
9576                     	xdef	_disp_status_command
9577                     	xdef	_disp_status_error
9578                     	xdef	_timerClear
9579                     	xdef	__timFlag
9580                     	xdef	__tim30min
9581                     	xdef	__tim1min
9582                     	xdef	_disp_status_run_id
9583                     	xdef	___func_rc_timerout2
9584                     	xdef	___func_rc_timerout1
9585                     	xdef	___func_rc_timerout
9586                     	xref	___func_rc_settingCb
9587                     	xdef	_disp_status_plc
9588                     	xdef	_disp_status_valveinfo_sub
9589                     	xdef	__ui_
9590                     	xdef	___lpm
9591                     	xdef	_disp_status_houseCapa
9592                     	xdef	__backlight_get_code
9593                     	xdef	__backlight_get_index
9594                     	xdef	_disp_status_valveCount
9595                     	xdef	___bL
9596                     	xdef	_disp_next
9597                     	xdef	_file_update
9598                     	xdef	__keypwIndexClient
9599                     	xdef	__keypwIndexMaster2
9600                     	xdef	__keypwIndexMaster
9601                     	xdef	__keypwClient
9602                     	xdef	__keypwMaster2
9603                     	xdef	__keypwMaster
9604                     	xdef	_error_display_status
9605                     	xdef	_error_display_mode
9606                     	xdef	_copy_info
9607                     	xdef	_copy_infoSet
9608                     	xref	__backlight
9609                     	xref	_ui_error_type
9610                     	xref	_ui_error
9611                     	xref	_error_type
9612                     	xref	_error
9613                     	xdef	_start_flag
9614                     	xdef	__backup_backlight2
9615                     	xdef	__backup_backlight
9616                     	xdef	__disp_temp
9617                     	xref	_func_rc_setting
9618                     	xref	_func_rc_recover
9619                     	xref	_func_rc_command
9620                     	xref	__boiler_water_heat
9621                     	xref	__boiler_water_shower
9622                     	xdef	_file_update2
9623                     	xdef	__updateCount
9624                     	xdef	__updateBit
9625                     	xdef	__updateTimer
9626                     	xref	__disp_mode2
9627                     	xref	__disp_mode
9628                     	xdef	_disp_status_curr_only
9629                     	xdef	_disp_status_loop_init
9630                     	xdef	_disp_status_loop_message
9631                     	xdef	_disp_status_exit
9632                     	xdef	_disp_status_run
9633                     	xdef	_disp_status_valveinfo
9634                     	xdef	_disp_status_temp_offset
9635                     	xdef	_disp_status_lpm
9636                     	xdef	_disp_status_po_type
9637                     	xdef	_disp_status_cntl_op
9638                     	xdef	_disp_status_run_op
9639                     	xdef	_disp_status_backlight2
9640                     	xdef	_disp_status_toffset
9641                     	xdef	_disp_status_id
9642                     	xdef	_clear_npos2
9643                     	xdef	_clear_npos1
9644                     	xdef	__subRemote
9645                     	xdef	__dsPrev
9646                     	xdef	__dsCount
9647                     	xdef	__ds
9648                     	xdef	_ui_Open
9649                     	xref	_disp_status_loop_client
9650                     	xref	_disp_status_loop_host
9651                     	xdef	___sRoom
9652                     	xdef	___sInfo
9653                     	xdef	___sDn
9654                     	xdef	___sUp
9655                     	xdef	___s
9656                     	xref	_lcd_blink_npos
9657                     	xref	_lcd_blink_npos_clear
9658                     	xref	_ui_disp_clear_tSetup
9659                     	xref	___ui_disp_temp_c
9660                     	xref	_ui_disp_temp_curr
9661                     	xref	_ui_disp_temp_setup
9662                     	xref	_lcd_blinkCb
9663                     	xref	_lcd_blink_clear
9664                     	xdef	_disp_status
9665                     	xref	_lcd_clear_npos
9666                     	xref	_lcd_disp_rid
9667                     	xref	_lcd_disp_err
9668                     	xref	_lcd_disp_n
9669                     	xref	_lcd_clear
9670                     	xref	_lcd_disp_setup_mode_each
9671                     	xref	_lcd_disp_setup_mode_local
9672                     	xref	_lcd_disp_setup_valve
9673                     	xref	_lcd_disp_setup_id
9674                     	xref	_lcd_disp_setup_mode
9675                     	xref	_lcd_disp_plc
9676                     	xref	_lcd_disp_cnt_sub
9677                     	xref	_lcd_disp_cnt_host
9678                     	xref	_lcd_disp_freset
9679                     	xref	_lcd_disp_mir2
9680                     	xref	_lcd_disp_mir1
9681                     	xref	_lcd_disp_setup_cntl_tab
9682                     	xref	_lcd_disp_setup_cntl_2motor
9683                     	xref	_lcd_disp_setup_cntl_po
9684                     	xref	_lcd_disp_setup_cntl_on
9685                     	xref	_lcd_disp_setup_cntl_op
9686                     	xref	_lcd_disp_setup_len
9687                     	xref	_lcd_disp_setup_lpm
9688                     	xref	_lcd_disp_backlight
9689                     	xref	_lcd_clear_btn
9690                     	xref	_iLF_DEF
9691                     	xref	_bLF_DEF
9692                     	switch	.bss
9693  0000               _uiInfo:
9694  0000 000000000000  	ds.b	109
9695                     	xdef	_uiInfo
9696  006d               _uiInfoSet:
9697  006d 000000000000  	ds.b	54
9698                     	xdef	_uiInfoSet
9699                     	xref	_file_read
9700                     	xref	_file_write
9701                     	xref	___timer1s
9702                     	xref	__t20ms
9703                     	xdef	_error_display
9704                     	xref.b	c_x
9724                     	xref	c_smodx
9725                     	end
