   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  21                     	switch	.data
  22  0000               ___s:
  23  0000 00            	dc.b	0
  24  0001               ___sUp:
  25  0001 00            	dc.b	0
  26  0002               ___sDn:
  27  0002 00            	dc.b	0
  28  0003               ___sInfo:
  29  0003 02            	dc.b	2
  30  0004               ___sRoom:
  31  0004 00            	dc.b	0
  32  0005               __updateTimer:
  33  0005 00            	dc.b	0
  34  0006               __updateBit:
  35  0006 00            	dc.b	0
  36  0007               __updateCount:
  37  0007 0a            	dc.b	10
  38  0008               __disp_temp:
  39  0008 01            	dc.b	1
  40  0009               __backup_backlight:
  41  0009 00            	dc.b	0
  42  000a               __backup_backlight2:
  43  000a 00            	dc.b	0
  80                     ; 45 void	ui_Open(void)
  80                     ; 46 {
  82                     	switch	.text
  83  0000               _ui_Open:
  87                     ; 89 	uiInfo.cntlMode = FW_GET_CNTLMODE;
  89  0000 a608          	ld	a,#8
  90  0002 cd0000        	call	_file_read
  92  0005 c70003        	ld	_uiInfo+3,a
  93                     ; 90 	uiInfo.id = FW_GET_ID;
  95  0008 a60a          	ld	a,#10
  96  000a cd0000        	call	_file_read
  98  000d c70004        	ld	_uiInfo+4,a
  99                     ; 91 	uiInfo.cnt = FW_GET_CNT;
 101  0010 a60b          	ld	a,#11
 102  0012 cd0000        	call	_file_read
 104  0015 c70005        	ld	_uiInfo+5,a
 105                     ; 92 	uiInfo.cnt_sub = FW_GET_CNT_SUB;
 107  0018 a62b          	ld	a,#43
 108  001a cd0000        	call	_file_read
 110  001d c70006        	ld	_uiInfo+6,a
 111                     ; 93 	UI_SET(uiInfo.cnt, 8)
 113  0020 c60005        	ld	a,_uiInfo+5
 114  0023 2605          	jrne	L12
 117  0025 a608          	ld	a,#8
 118  0027 c70005        	ld	_uiInfo+5,a
 119  002a               L12:
 120                     ; 94 	UI_SET(uiInfo.cnt_sub, 8)
 122  002a 725d0006      	tnz	_uiInfo+6
 123  002e 2604          	jrne	L32
 126  0030 35080006      	mov	_uiInfo+6,#8
 127  0034               L32:
 128                     ; 95 	if( uiInfo.cnt >= 8 )	uiInfo.cnt = 8;
 130  0034 a108          	cp	a,#8
 131  0036 2504          	jrult	L52
 134  0038 35080005      	mov	_uiInfo+5,#8
 135  003c               L52:
 136                     ; 96 	if( uiInfo.cnt_sub >= 8 )	uiInfo.cnt_sub = 8;
 138  003c c60006        	ld	a,_uiInfo+6
 139  003f a108          	cp	a,#8
 140  0041 2504          	jrult	L72
 143  0043 35080006      	mov	_uiInfo+6,#8
 144  0047               L72:
 145                     ; 98 	uiInfo.opMode = FW_GET_OPMODE;
 147  0047 a60c          	ld	a,#12
 148  0049 cd0000        	call	_file_read
 150  004c c70007        	ld	_uiInfo+7,a
 151                     ; 99 	uiInfo.mode = FW_GET_MODE;
 153  004f a609          	ld	a,#9
 154  0051 cd0000        	call	_file_read
 156  0054 c70008        	ld	_uiInfo+8,a
 157                     ; 101 	uiInfo.controlMode = FW_GET_CNT_MODE;
 159  0057 a60d          	ld	a,#13
 160  0059 cd0000        	call	_file_read
 162  005c c70009        	ld	_uiInfo+9,a
 163                     ; 102 	uiInfo.valve = FW_GET_VALVE;
 165  005f a60e          	ld	a,#14
 166  0061 cd0000        	call	_file_read
 168  0064 c7000a        	ld	_uiInfo+10,a
 169                     ; 103 	uiInfo.valve_sub = FW_GET_VALVE_SUB;
 171  0067 a62c          	ld	a,#44
 172  0069 cd0000        	call	_file_read
 174  006c c7000b        	ld	_uiInfo+11,a
 175                     ; 104 	UI_SET(uiInfo.valve, 8)
 177  006f c6000a        	ld	a,_uiInfo+10
 178  0072 2605          	jrne	L13
 181  0074 a608          	ld	a,#8
 182  0076 c7000a        	ld	_uiInfo+10,a
 183  0079               L13:
 184                     ; 105 	UI_SET(uiInfo.valve_sub, 8)
 186  0079 725d000b      	tnz	_uiInfo+11
 187  007d 2604          	jrne	L33
 190  007f 3508000b      	mov	_uiInfo+11,#8
 191  0083               L33:
 192                     ; 106 	if( uiInfo.valve >= 8 )	uiInfo.valve = 8;
 194  0083 a108          	cp	a,#8
 195  0085 2504          	jrult	L53
 198  0087 3508000a      	mov	_uiInfo+10,#8
 199  008b               L53:
 200                     ; 107 	if( uiInfo.valve_sub >= 8 )	uiInfo.valve_sub = 8;
 202  008b c6000b        	ld	a,_uiInfo+11
 203  008e a108          	cp	a,#8
 204  0090 2504          	jrult	L73
 207  0092 3508000b      	mov	_uiInfo+11,#8
 208  0096               L73:
 209                     ; 109 	uiInfo.repeat = FW_GET_REPEAT;	
 211  0096 a60f          	ld	a,#15
 212  0098 cd0000        	call	_file_read
 214  009b c7000c        	ld	_uiInfo+12,a
 215                     ; 110 	UI_SET(uiInfo.repeat, 5)
 217  009e 2604          	jrne	L14
 220  00a0 3505000c      	mov	_uiInfo+12,#5
 221  00a4               L14:
 222                     ; 111 	uiInfo.reserve = FW_GET_RESERVE;	
 224  00a4 a610          	ld	a,#16
 225  00a6 cd0000        	call	_file_read
 227  00a9 c7000d        	ld	_uiInfo+13,a
 228                     ; 112 	UI_SET(uiInfo.reserve, 24)
 230  00ac 2604          	jrne	L34
 233  00ae 3518000d      	mov	_uiInfo+13,#24
 234  00b2               L34:
 235                     ; 113 	uiInfo.tSetup = FW_GET_TSETUP;	
 237  00b2 a611          	ld	a,#17
 238  00b4 cd0000        	call	_file_read
 240  00b7 c7000e        	ld	_uiInfo+14,a
 241                     ; 114 	UI_SET(uiInfo.tSetup, 50)
 243  00ba 2604          	jrne	L54
 246  00bc 3532000e      	mov	_uiInfo+14,#50
 247  00c0               L54:
 248                     ; 115 	uiInfo.poType = FW_GET_POTYPE;	
 250  00c0 a612          	ld	a,#18
 251  00c2 cd0000        	call	_file_read
 253  00c5 c7000f        	ld	_uiInfo+15,a
 254                     ; 116 	uiInfo.houseCapa = FW_GET_HOUSECAPA;
 256  00c8 a613          	ld	a,#19
 257  00ca cd0000        	call	_file_read
 259  00cd c70010        	ld	_uiInfo+16,a
 260                     ; 117 	UI_SET(uiInfo.houseCapa, 160)
 262  00d0 2604          	jrne	L74
 265  00d2 35a00010      	mov	_uiInfo+16,#160
 266  00d6               L74:
 267                     ; 118 	uiInfo.tOffset = FW_GET_TOFFSET;
 269  00d6 a614          	ld	a,#20
 270  00d8 cd0000        	call	_file_read
 272  00db c70011        	ld	_uiInfo+17,a
 273                     ; 119 	UI_SET(uiInfo.tOffset, 100);
 275  00de 2604          	jrne	L15
 278  00e0 35640011      	mov	_uiInfo+17,#100
 279  00e4               L15:
 280                     ; 121 	uiInfo.tempOffset = FW_GET_TEMPOFFSET;
 283  00e4 a627          	ld	a,#39
 284  00e6 cd0000        	call	_file_read
 286  00e9 c70012        	ld	_uiInfo+18,a
 287                     ; 122 	UI_SET(uiInfo.tempOffset, 80)
 289  00ec 2604          	jrne	L35
 292  00ee 35500012      	mov	_uiInfo+18,#80
 293  00f2               L35:
 294                     ; 123 	uiInfo.lpmType = FW_GET_LPM;
 296  00f2 a628          	ld	a,#40
 297  00f4 cd0000        	call	_file_read
 299  00f7 c70013        	ld	_uiInfo+19,a
 300                     ; 124 	uiInfo.lpmType_sub = FW_GET_LPM_SUB;
 302  00fa a62d          	ld	a,#45
 303  00fc cd0000        	call	_file_read
 305  00ff c70014        	ld	_uiInfo+20,a
 306                     ; 130 	_disp_mode2 = FW_GET_DISPMODE;
 308  0102 a629          	ld	a,#41
 309  0104 cd0000        	call	_file_read
 311  0107 c70000        	ld	__disp_mode2,a
 312                     ; 131 	_disp_mode = 0xff;
 314  010a 35ff0000      	mov	__disp_mode,#255
 315                     ; 133 	uiInfo.valve_len[0] = FW_GET_VL_1;
 317  010e a615          	ld	a,#21
 318  0110 cd0000        	call	_file_read
 320  0113 c70015        	ld	_uiInfo+21,a
 321                     ; 134 	uiInfo.valve_len[1] = FW_GET_VL_2;
 323  0116 a616          	ld	a,#22
 324  0118 cd0000        	call	_file_read
 326  011b c70016        	ld	_uiInfo+22,a
 327                     ; 135 	uiInfo.valve_len[2] = FW_GET_VL_3;
 329  011e a617          	ld	a,#23
 330  0120 cd0000        	call	_file_read
 332  0123 c70017        	ld	_uiInfo+23,a
 333                     ; 136 	uiInfo.valve_len[3] = FW_GET_VL_4;
 335  0126 a618          	ld	a,#24
 336  0128 cd0000        	call	_file_read
 338  012b c70018        	ld	_uiInfo+24,a
 339                     ; 137 	uiInfo.valve_len[4] = FW_GET_VL_5;
 341  012e a619          	ld	a,#25
 342  0130 cd0000        	call	_file_read
 344  0133 c70019        	ld	_uiInfo+25,a
 345                     ; 138 	uiInfo.valve_len[5] = FW_GET_VL_6;
 347  0136 a61a          	ld	a,#26
 348  0138 cd0000        	call	_file_read
 350  013b c7001a        	ld	_uiInfo+26,a
 351                     ; 139 	uiInfo.valve_len[6] = FW_GET_VL_7;
 353  013e a61b          	ld	a,#27
 354  0140 cd0000        	call	_file_read
 356  0143 c7001b        	ld	_uiInfo+27,a
 357                     ; 140 	uiInfo.valve_len[7] = FW_GET_VL_8;
 359  0146 a61c          	ld	a,#28
 360  0148 cd0000        	call	_file_read
 362  014b c7001c        	ld	_uiInfo+28,a
 363                     ; 142 	uiInfo.valve_rc[0] = FW_GET_VRC_1;
 365  014e a61d          	ld	a,#29
 366  0150 cd0000        	call	_file_read
 368  0153 c7001d        	ld	_uiInfo+29,a
 369                     ; 143 	uiInfo.valve_rc[1] = FW_GET_VRC_2;
 371  0156 a61e          	ld	a,#30
 372  0158 cd0000        	call	_file_read
 374  015b c7001e        	ld	_uiInfo+30,a
 375                     ; 144 	uiInfo.valve_rc[2] = FW_GET_VRC_3;
 377  015e a61f          	ld	a,#31
 378  0160 cd0000        	call	_file_read
 380  0163 c7001f        	ld	_uiInfo+31,a
 381                     ; 145 	uiInfo.valve_rc[3] = FW_GET_VRC_4;
 383  0166 a620          	ld	a,#32
 384  0168 cd0000        	call	_file_read
 386  016b c70020        	ld	_uiInfo+32,a
 387                     ; 146 	uiInfo.valve_rc[4] = FW_GET_VRC_5;
 389  016e a621          	ld	a,#33
 390  0170 cd0000        	call	_file_read
 392  0173 c70021        	ld	_uiInfo+33,a
 393                     ; 147 	uiInfo.valve_rc[5] = FW_GET_VRC_6;
 395  0176 a622          	ld	a,#34
 396  0178 cd0000        	call	_file_read
 398  017b c70022        	ld	_uiInfo+34,a
 399                     ; 148 	uiInfo.valve_rc[6] = FW_GET_VRC_7;
 401  017e a623          	ld	a,#35
 402  0180 cd0000        	call	_file_read
 404  0183 c70023        	ld	_uiInfo+35,a
 405                     ; 149 	uiInfo.valve_rc[7] = FW_GET_VRC_8;
 407  0186 a624          	ld	a,#36
 408  0188 cd0000        	call	_file_read
 410  018b c70024        	ld	_uiInfo+36,a
 411                     ; 150 	uiInfo.valve_rc[0] = 1;
 413  018e 3501001d      	mov	_uiInfo+29,#1
 414                     ; 152 	uiInfo.valve_sub_len[0] = FW_GET_VL_1_SUB;
 416  0192 a62e          	ld	a,#46
 417  0194 cd0000        	call	_file_read
 419  0197 c70025        	ld	_uiInfo+37,a
 420                     ; 153 	uiInfo.valve_sub_len[1] = FW_GET_VL_2_SUB;
 422  019a a62f          	ld	a,#47
 423  019c cd0000        	call	_file_read
 425  019f c70026        	ld	_uiInfo+38,a
 426                     ; 154 	uiInfo.valve_sub_len[2] = FW_GET_VL_3_SUB;
 428  01a2 a630          	ld	a,#48
 429  01a4 cd0000        	call	_file_read
 431  01a7 c70027        	ld	_uiInfo+39,a
 432                     ; 155 	uiInfo.valve_sub_len[3] = FW_GET_VL_4_SUB;
 434  01aa a631          	ld	a,#49
 435  01ac cd0000        	call	_file_read
 437  01af c70028        	ld	_uiInfo+40,a
 438                     ; 156 	uiInfo.valve_sub_len[4] = FW_GET_VL_5_SUB;
 440  01b2 a632          	ld	a,#50
 441  01b4 cd0000        	call	_file_read
 443  01b7 c70029        	ld	_uiInfo+41,a
 444                     ; 157 	uiInfo.valve_sub_len[5] = FW_GET_VL_6_SUB;
 446  01ba a633          	ld	a,#51
 447  01bc cd0000        	call	_file_read
 449  01bf c7002a        	ld	_uiInfo+42,a
 450                     ; 158 	uiInfo.valve_sub_len[6] = FW_GET_VL_7_SUB;
 452  01c2 a634          	ld	a,#52
 453  01c4 cd0000        	call	_file_read
 455  01c7 c7002b        	ld	_uiInfo+43,a
 456                     ; 159 	uiInfo.valve_sub_len[7] = FW_GET_VL_8_SUB;
 458  01ca a635          	ld	a,#53
 459  01cc cd0000        	call	_file_read
 461  01cf c7002c        	ld	_uiInfo+44,a
 462                     ; 161 	uiInfo.valve_sub_rc[0] = FW_GET_VRC_1_SUB;
 464  01d2 a636          	ld	a,#54
 465  01d4 cd0000        	call	_file_read
 467  01d7 c7002d        	ld	_uiInfo+45,a
 468                     ; 162 	uiInfo.valve_sub_rc[1] = FW_GET_VRC_2_SUB;
 470  01da a637          	ld	a,#55
 471  01dc cd0000        	call	_file_read
 473  01df c7002e        	ld	_uiInfo+46,a
 474                     ; 163 	uiInfo.valve_sub_rc[2] = FW_GET_VRC_3_SUB;
 476  01e2 a638          	ld	a,#56
 477  01e4 cd0000        	call	_file_read
 479  01e7 c7002f        	ld	_uiInfo+47,a
 480                     ; 164 	uiInfo.valve_sub_rc[3] = FW_GET_VRC_4_SUB;
 482  01ea a639          	ld	a,#57
 483  01ec cd0000        	call	_file_read
 485  01ef c70030        	ld	_uiInfo+48,a
 486                     ; 165 	uiInfo.valve_sub_rc[4] = FW_GET_VRC_5_SUB;
 488  01f2 a63a          	ld	a,#58
 489  01f4 cd0000        	call	_file_read
 491  01f7 c70031        	ld	_uiInfo+49,a
 492                     ; 166 	uiInfo.valve_sub_rc[5] = FW_GET_VRC_6_SUB;
 494  01fa a63b          	ld	a,#59
 495  01fc cd0000        	call	_file_read
 497  01ff c70032        	ld	_uiInfo+50,a
 498                     ; 167 	uiInfo.valve_sub_rc[6] = FW_GET_VRC_7_SUB;
 500  0202 a63c          	ld	a,#60
 501  0204 cd0000        	call	_file_read
 503  0207 c70033        	ld	_uiInfo+51,a
 504                     ; 168 	uiInfo.valve_sub_rc[7] = FW_GET_VRC_8_SUB;
 506  020a a63d          	ld	a,#61
 507  020c cd0000        	call	_file_read
 509  020f c70034        	ld	_uiInfo+52,a
 510                     ; 170 	_boiler_water_shower = FW_GET_B_SHOWER;
 512  0212 a625          	ld	a,#37
 513  0214 ad31          	call	LC001
 514  0216 c70000        	ld	__boiler_water_shower,a
 515                     ; 172 	UI_SET(_boiler_water_shower, 50)
 517  0219 2604          	jrne	L55
 520  021b 35320000      	mov	__boiler_water_shower,#50
 521  021f               L55:
 522                     ; 173 	_boiler_water_heat = FW_GET_B_HEAT;
 524  021f a626          	ld	a,#38
 525  0221 ad24          	call	LC001
 526  0223 c70000        	ld	__boiler_water_heat,a
 527                     ; 175 	UI_SET(_boiler_water_heat, 70)
 529  0226 2604          	jrne	L75
 532  0228 35460000      	mov	__boiler_water_heat,#70
 533  022c               L75:
 534                     ; 176 	_backlight = FW_GET_BACKLIGHT;
 536  022c a62a          	ld	a,#42
 537  022e cd0000        	call	_file_read
 539  0231 c70000        	ld	__backlight,a
 540                     ; 177 	UI_SET(_backlight, 3)
 542  0234 2604          	jrne	L16
 545  0236 35030000      	mov	__backlight,#3
 546  023a               L16:
 547                     ; 179 	uiInfo.plc = FW_GET_PLC;
 549  023a a63e          	ld	a,#62
 550  023c cd0000        	call	_file_read
 552  023f c70064        	ld	_uiInfo+100,a
 553                     ; 181 	_backup_backlight = 0;
 555  0242 725f0009      	clr	__backup_backlight
 556                     ; 182 }
 559  0246 81            	ret	
 560  0247               LC001:
 561  0247 cd0000        	call	_file_read
 563                     ; 171 	_boiler_water_shower = (_boiler_water_shower/5)*5;
 565  024a 5f            	clrw	x
 566  024b 97            	ld	xl,a
 567  024c a605          	ld	a,#5
 568  024e 62            	div	x,a
 569  024f a605          	ld	a,#5
 570  0251 42            	mul	x,a
 571  0252 9f            	ld	a,xl
 572  0253 81            	ret	
 575                     .const:	section	.text
 576  0000               __keypwMaster:
 577  0000 04            	dc.b	4
 578  0001 03            	dc.b	3
 579  0002 04            	dc.b	4
 580  0003 03            	dc.b	3
 581  0004 01            	dc.b	1
 582  0005 01            	dc.b	1
 583  0006               __keypwMaster2:
 584  0006 04            	dc.b	4
 585  0007 03            	dc.b	3
 586  0008 04            	dc.b	4
 587  0009 03            	dc.b	3
 588  000a 01            	dc.b	1
 589  000b 02            	dc.b	2
 590  000c               __keypwClient:
 591  000c 04            	dc.b	4
 592  000d 03            	dc.b	3
 593  000e 04            	dc.b	4
 594  000f 03            	dc.b	3
 595  0010 01            	dc.b	1
 596  0011 03            	dc.b	3
 597                     	switch	.data
 598  000b               __keypwIndexMaster:
 599  000b 00            	dc.b	0
 600  000c               __keypwIndexMaster2:
 601  000c 00            	dc.b	0
 602  000d               __keypwIndexClient:
 603  000d 00            	dc.b	0
 635                     ; 200 void	file_update2(uint8_t i)
 635                     ; 201 {
 636                     	switch	.text
 637  0254               _file_update2:
 641                     ; 202 	if( i==0 )	FW_BACKLIGHT(_backlight);
 643  0254 4d            	tnz	a
 644  0255 260a          	jrne	L77
 647  0257 c60000        	ld	a,__backlight
 648  025a 97            	ld	xl,a
 649  025b a62a          	ld	a,#42
 650  025d 95            	ld	xh,a
 651  025e cd0000        	call	_file_write
 653  0261               L77:
 654                     ; 203 }
 657  0261 81            	ret	
 685                     ; 241 void	file_update(void)
 685                     ; 242 {
 686                     	switch	.text
 687  0262               _file_update:
 691                     ; 243 	FW_CNTLMODE(uiInfo.cntlMode);
 693  0262 c60003        	ld	a,_uiInfo+3
 694  0265 97            	ld	xl,a
 695  0266 a608          	ld	a,#8
 696  0268 95            	ld	xh,a
 697  0269 cd0000        	call	_file_write
 699                     ; 244 	FW_MODE(uiInfo.mode);
 701  026c c60008        	ld	a,_uiInfo+8
 702  026f 97            	ld	xl,a
 703  0270 a609          	ld	a,#9
 704  0272 95            	ld	xh,a
 705  0273 cd0000        	call	_file_write
 707                     ; 245 	FW_ID(uiInfo.id);
 709  0276 c60004        	ld	a,_uiInfo+4
 710  0279 97            	ld	xl,a
 711  027a a60a          	ld	a,#10
 712  027c 95            	ld	xh,a
 713  027d cd0000        	call	_file_write
 715                     ; 246 	FW_CNT(uiInfo.cnt);
 717  0280 c60005        	ld	a,_uiInfo+5
 718  0283 97            	ld	xl,a
 719  0284 a60b          	ld	a,#11
 720  0286 95            	ld	xh,a
 721  0287 cd0000        	call	_file_write
 723                     ; 247 	FW_CNT_SUB(uiInfo.cnt_sub);
 725  028a c60006        	ld	a,_uiInfo+6
 726  028d 97            	ld	xl,a
 727  028e a62b          	ld	a,#43
 728  0290 95            	ld	xh,a
 729  0291 cd0000        	call	_file_write
 731                     ; 248 	FW_OPMODE(uiInfo.opMode);
 733  0294 c60007        	ld	a,_uiInfo+7
 734  0297 97            	ld	xl,a
 735  0298 a60c          	ld	a,#12
 736  029a 95            	ld	xh,a
 737  029b cd0000        	call	_file_write
 739                     ; 250 	FW_CNT_MODE(uiInfo.controlMode);
 741  029e c60009        	ld	a,_uiInfo+9
 742  02a1 97            	ld	xl,a
 743  02a2 a60d          	ld	a,#13
 744  02a4 95            	ld	xh,a
 745  02a5 cd0000        	call	_file_write
 747                     ; 251 	FW_VALVE(uiInfo.valve);
 749  02a8 c6000a        	ld	a,_uiInfo+10
 750  02ab 97            	ld	xl,a
 751  02ac a60e          	ld	a,#14
 752  02ae 95            	ld	xh,a
 753  02af cd0000        	call	_file_write
 755                     ; 252 	FW_VALVE_SUB(uiInfo.valve_sub);
 757  02b2 c6000b        	ld	a,_uiInfo+11
 758  02b5 97            	ld	xl,a
 759  02b6 a62c          	ld	a,#44
 760  02b8 95            	ld	xh,a
 761  02b9 cd0000        	call	_file_write
 763                     ; 253 	FW_REPEAT(uiInfo.repeat);
 765  02bc c6000c        	ld	a,_uiInfo+12
 766  02bf 97            	ld	xl,a
 767  02c0 a60f          	ld	a,#15
 768  02c2 95            	ld	xh,a
 769  02c3 cd0000        	call	_file_write
 771                     ; 254 	FW_RESERVE(uiInfo.reserve);
 773  02c6 c6000d        	ld	a,_uiInfo+13
 774  02c9 97            	ld	xl,a
 775  02ca a610          	ld	a,#16
 776  02cc 95            	ld	xh,a
 777  02cd cd0000        	call	_file_write
 779                     ; 255 	FW_TSETUP(uiInfo.tSetup);
 781  02d0 c6000e        	ld	a,_uiInfo+14
 782  02d3 97            	ld	xl,a
 783  02d4 a611          	ld	a,#17
 784  02d6 95            	ld	xh,a
 785  02d7 cd0000        	call	_file_write
 787                     ; 257 	FW_POTYPE(uiInfo.poType);
 789  02da c6000f        	ld	a,_uiInfo+15
 790  02dd 97            	ld	xl,a
 791  02de a612          	ld	a,#18
 792  02e0 95            	ld	xh,a
 793  02e1 cd0000        	call	_file_write
 795                     ; 258 	FW_HOUSECAPA(uiInfo.houseCapa);
 797  02e4 c60010        	ld	a,_uiInfo+16
 798  02e7 97            	ld	xl,a
 799  02e8 a613          	ld	a,#19
 800  02ea 95            	ld	xh,a
 801  02eb cd0000        	call	_file_write
 803                     ; 259 	FW_TOFFSET(uiInfo.tOffset);
 805  02ee c60011        	ld	a,_uiInfo+17
 806  02f1 97            	ld	xl,a
 807  02f2 a614          	ld	a,#20
 808  02f4 95            	ld	xh,a
 809  02f5 cd0000        	call	_file_write
 811                     ; 261 	FW_VALVE_INFOS
 813  02f8 c60015        	ld	a,_uiInfo+21
 814  02fb 97            	ld	xl,a
 815  02fc a615          	ld	a,#21
 816  02fe 95            	ld	xh,a
 817  02ff cd0000        	call	_file_write
 821  0302 c60016        	ld	a,_uiInfo+22
 822  0305 97            	ld	xl,a
 823  0306 a616          	ld	a,#22
 824  0308 95            	ld	xh,a
 825  0309 cd0000        	call	_file_write
 829  030c c60017        	ld	a,_uiInfo+23
 830  030f 97            	ld	xl,a
 831  0310 a617          	ld	a,#23
 832  0312 95            	ld	xh,a
 833  0313 cd0000        	call	_file_write
 837  0316 c60018        	ld	a,_uiInfo+24
 838  0319 97            	ld	xl,a
 839  031a a618          	ld	a,#24
 840  031c 95            	ld	xh,a
 841  031d cd0000        	call	_file_write
 845  0320 c60019        	ld	a,_uiInfo+25
 846  0323 97            	ld	xl,a
 847  0324 a619          	ld	a,#25
 848  0326 95            	ld	xh,a
 849  0327 cd0000        	call	_file_write
 853  032a c6001a        	ld	a,_uiInfo+26
 854  032d 97            	ld	xl,a
 855  032e a61a          	ld	a,#26
 856  0330 95            	ld	xh,a
 857  0331 cd0000        	call	_file_write
 861  0334 c6001b        	ld	a,_uiInfo+27
 862  0337 97            	ld	xl,a
 863  0338 a61b          	ld	a,#27
 864  033a 95            	ld	xh,a
 865  033b cd0000        	call	_file_write
 869  033e c6001c        	ld	a,_uiInfo+28
 870  0341 97            	ld	xl,a
 871  0342 a61c          	ld	a,#28
 872  0344 95            	ld	xh,a
 873  0345 cd0000        	call	_file_write
 877  0348 c60025        	ld	a,_uiInfo+37
 878  034b 97            	ld	xl,a
 879  034c a62e          	ld	a,#46
 880  034e 95            	ld	xh,a
 881  034f cd0000        	call	_file_write
 885  0352 c60026        	ld	a,_uiInfo+38
 886  0355 97            	ld	xl,a
 887  0356 a62f          	ld	a,#47
 888  0358 95            	ld	xh,a
 889  0359 cd0000        	call	_file_write
 893  035c c60027        	ld	a,_uiInfo+39
 894  035f 97            	ld	xl,a
 895  0360 a630          	ld	a,#48
 896  0362 95            	ld	xh,a
 897  0363 cd0000        	call	_file_write
 901  0366 c60028        	ld	a,_uiInfo+40
 902  0369 97            	ld	xl,a
 903  036a a631          	ld	a,#49
 904  036c 95            	ld	xh,a
 905  036d cd0000        	call	_file_write
 909  0370 c60029        	ld	a,_uiInfo+41
 910  0373 97            	ld	xl,a
 911  0374 a632          	ld	a,#50
 912  0376 95            	ld	xh,a
 913  0377 cd0000        	call	_file_write
 917  037a c6002a        	ld	a,_uiInfo+42
 918  037d 97            	ld	xl,a
 919  037e a633          	ld	a,#51
 920  0380 95            	ld	xh,a
 921  0381 cd0000        	call	_file_write
 925  0384 c6002b        	ld	a,_uiInfo+43
 926  0387 97            	ld	xl,a
 927  0388 a634          	ld	a,#52
 928  038a 95            	ld	xh,a
 929  038b cd0000        	call	_file_write
 933  038e c6002c        	ld	a,_uiInfo+44
 934  0391 97            	ld	xl,a
 935  0392 a635          	ld	a,#53
 936  0394 95            	ld	xh,a
 937  0395 cd0000        	call	_file_write
 939                     ; 262 	FW_VALVE_RCINFOS
 941  0398 c6001d        	ld	a,_uiInfo+29
 942  039b 97            	ld	xl,a
 943  039c a61d          	ld	a,#29
 944  039e 95            	ld	xh,a
 945  039f cd0000        	call	_file_write
 949  03a2 c6001e        	ld	a,_uiInfo+30
 950  03a5 97            	ld	xl,a
 951  03a6 a61e          	ld	a,#30
 952  03a8 95            	ld	xh,a
 953  03a9 cd0000        	call	_file_write
 957  03ac c6001f        	ld	a,_uiInfo+31
 958  03af 97            	ld	xl,a
 959  03b0 a61f          	ld	a,#31
 960  03b2 95            	ld	xh,a
 961  03b3 cd0000        	call	_file_write
 965  03b6 c60020        	ld	a,_uiInfo+32
 966  03b9 97            	ld	xl,a
 967  03ba a620          	ld	a,#32
 968  03bc 95            	ld	xh,a
 969  03bd cd0000        	call	_file_write
 973  03c0 c60021        	ld	a,_uiInfo+33
 974  03c3 97            	ld	xl,a
 975  03c4 a621          	ld	a,#33
 976  03c6 95            	ld	xh,a
 977  03c7 cd0000        	call	_file_write
 981  03ca c60022        	ld	a,_uiInfo+34
 982  03cd 97            	ld	xl,a
 983  03ce a622          	ld	a,#34
 984  03d0 95            	ld	xh,a
 985  03d1 cd0000        	call	_file_write
 989  03d4 c60023        	ld	a,_uiInfo+35
 990  03d7 97            	ld	xl,a
 991  03d8 a623          	ld	a,#35
 992  03da 95            	ld	xh,a
 993  03db cd0000        	call	_file_write
 997  03de c60024        	ld	a,_uiInfo+36
 998  03e1 97            	ld	xl,a
 999  03e2 a624          	ld	a,#36
1000  03e4 95            	ld	xh,a
1001  03e5 cd0000        	call	_file_write
1005  03e8 c6002d        	ld	a,_uiInfo+45
1006  03eb 97            	ld	xl,a
1007  03ec a636          	ld	a,#54
1008  03ee 95            	ld	xh,a
1009  03ef cd0000        	call	_file_write
1013  03f2 c6002e        	ld	a,_uiInfo+46
1014  03f5 97            	ld	xl,a
1015  03f6 a637          	ld	a,#55
1016  03f8 95            	ld	xh,a
1017  03f9 cd0000        	call	_file_write
1021  03fc c6002f        	ld	a,_uiInfo+47
1022  03ff 97            	ld	xl,a
1023  0400 a638          	ld	a,#56
1024  0402 95            	ld	xh,a
1025  0403 cd0000        	call	_file_write
1029  0406 c60030        	ld	a,_uiInfo+48
1030  0409 97            	ld	xl,a
1031  040a a639          	ld	a,#57
1032  040c 95            	ld	xh,a
1033  040d cd0000        	call	_file_write
1037  0410 c60031        	ld	a,_uiInfo+49
1038  0413 97            	ld	xl,a
1039  0414 a63a          	ld	a,#58
1040  0416 95            	ld	xh,a
1041  0417 cd0000        	call	_file_write
1045  041a c60032        	ld	a,_uiInfo+50
1046  041d 97            	ld	xl,a
1047  041e a63b          	ld	a,#59
1048  0420 95            	ld	xh,a
1049  0421 cd0000        	call	_file_write
1053  0424 c60033        	ld	a,_uiInfo+51
1054  0427 97            	ld	xl,a
1055  0428 a63c          	ld	a,#60
1056  042a 95            	ld	xh,a
1057  042b cd0000        	call	_file_write
1061  042e c60034        	ld	a,_uiInfo+52
1062  0431 97            	ld	xl,a
1063  0432 a63d          	ld	a,#61
1064  0434 95            	ld	xh,a
1065  0435 cd0000        	call	_file_write
1067                     ; 264 	FW_B_SHOWER(_boiler_water_shower);
1069  0438 c60000        	ld	a,__boiler_water_shower
1070  043b 97            	ld	xl,a
1071  043c a625          	ld	a,#37
1072  043e 95            	ld	xh,a
1073  043f cd0000        	call	_file_write
1075                     ; 265 	FW_B_HEAT(_boiler_water_heat);
1077  0442 c60000        	ld	a,__boiler_water_heat
1078  0445 97            	ld	xl,a
1079  0446 a626          	ld	a,#38
1080  0448 95            	ld	xh,a
1081  0449 cd0000        	call	_file_write
1083                     ; 266 	FW_TEMPOFFSET(uiInfo.tempOffset);
1085  044c c60012        	ld	a,_uiInfo+18
1086  044f 97            	ld	xl,a
1087  0450 a627          	ld	a,#39
1088  0452 95            	ld	xh,a
1089  0453 cd0000        	call	_file_write
1091                     ; 267 	FW_LPM(uiInfo.lpmType);
1093  0456 c60013        	ld	a,_uiInfo+19
1094  0459 97            	ld	xl,a
1095  045a a628          	ld	a,#40
1096  045c 95            	ld	xh,a
1097  045d cd0000        	call	_file_write
1099                     ; 268 	FW_LPM_SUB(uiInfo.lpmType_sub);
1101  0460 c60014        	ld	a,_uiInfo+20
1102  0463 97            	ld	xl,a
1103  0464 a62d          	ld	a,#45
1104  0466 95            	ld	xh,a
1105  0467 cd0000        	call	_file_write
1107                     ; 269 	FW_DISPMODE(_disp_mode);
1109  046a c60000        	ld	a,__disp_mode
1110  046d 97            	ld	xl,a
1111  046e a629          	ld	a,#41
1112  0470 95            	ld	xh,a
1113  0471 cd0000        	call	_file_write
1115                     ; 275 	FW_PLC(uiInfo.plc);
1117  0474 c60064        	ld	a,_uiInfo+100
1118  0477 97            	ld	xl,a
1119  0478 a63e          	ld	a,#62
1120  047a 95            	ld	xh,a
1121  047b cd0000        	call	_file_write
1123                     ; 276 	file_write(_B+55, 0xaa);
1125  047e ae3faa        	ldw	x,#16298
1126  0481 cd0000        	call	_file_write
1128                     ; 277 	file_write(_B+56, 0xbb);
1130  0484 ae40bb        	ldw	x,#16571
1132                     ; 278 }
1135  0487 cc0000        	jp	_file_write
1138                     	switch	.data
1139  000e               __ds:
1140  000e 64            	dc.b	100
1141  000f               __dsCount:
1142  000f 00            	dc.b	0
1143  0010               __dsPrev:
1144  0010 00            	dc.b	0
1166                     ; 286 void	clear_npos1(void)
1166                     ; 287 {
1167                     	switch	.text
1168  048a               _clear_npos1:
1172                     ; 288 	lcd_clear_npos(0, 0);
1174  048a 5f            	clrw	x
1175  048b cd0000        	call	_lcd_clear_npos
1177                     ; 289 	lcd_clear_npos(1, 0);
1179  048e ae0100        	ldw	x,#256
1181                     ; 290 }
1184  0491 cc0000        	jp	_lcd_clear_npos
1208                     ; 292 void	clear_npos2(void)
1208                     ; 293 {
1209                     	switch	.text
1210  0494               _clear_npos2:
1214                     ; 294 	lcd_clear_npos(2, 0);
1216  0494 ae0200        	ldw	x,#512
1217  0497 cd0000        	call	_lcd_clear_npos
1219                     ; 295 	lcd_clear_npos(3, 0);
1221  049a ae0300        	ldw	x,#768
1223                     ; 296 }
1226  049d cc0000        	jp	_lcd_clear_npos
1252                     ; 298 void	disp_next(void)
1252                     ; 299 {
1253                     	switch	.text
1254  04a0               _disp_next:
1258                     ; 300 	lcd_clear(0);
1260  04a0 4f            	clr	a
1261  04a1 cd0000        	call	_lcd_clear
1263                     ; 301 	_dsCount = 1;
1265  04a4 3501000f      	mov	__dsCount,#1
1266                     ; 302 	_dsPrev = 0xff;
1268  04a8 35ff0010      	mov	__dsPrev,#255
1269                     ; 303 }
1272  04ac 81            	ret	
1327                     ; 305 void	disp_status_id(uint8_t key, uint8_t next)
1327                     ; 306 {
1328                     	switch	.text
1329  04ad               _disp_status_id:
1331  04ad 89            	pushw	x
1332  04ae 88            	push	a
1333       00000001      OFST:	set	1
1336                     ; 308 	if( _dsCount == 0 )
1338  04af c6000f        	ld	a,__dsCount
1339  04b2 2612          	jrne	L161
1340                     ; 310 		disp_next();
1342  04b4 adea          	call	_disp_next
1344                     ; 311 		lcd_disp_setup_id();
1346  04b6 cd0000        	call	_lcd_disp_setup_id
1348                     ; 312 		if( uiInfoSet.id < 2 )
1350  04b9 c60066        	ld	a,_uiInfoSet+1
1351  04bc a102          	cp	a,#2
1352  04be 244c          	jruge	L561
1353                     ; 313 			uiInfoSet.id = 2;
1355  04c0 35020066      	mov	_uiInfoSet+1,#2
1356  04c4 2046          	jra	L561
1357  04c6               L161:
1358                     ; 317 		i = uiInfoSet.id;
1360  04c6 c60066        	ld	a,_uiInfoSet+1
1361  04c9 6b01          	ld	(OFST+0,sp),a
1362                     ; 318 		if( uiInfo.enc != 0 )
1364  04cb c60000        	ld	a,_uiInfo
1365  04ce 2725          	jreq	L761
1366                     ; 320 			if( (uiInfo.enc&0x40) == 0 )
1368  04d0 a540          	bcp	a,#64
1369  04d2 260e          	jrne	L171
1370                     ; 322 				if( i==2 )	i = 10;
1372  04d4 7b01          	ld	a,(OFST+0,sp)
1373  04d6 a102          	cp	a,#2
1374  04d8 2604          	jrne	L371
1377  04da a60a          	ld	a,#10
1379  04dc 200c          	jp	LC002
1380  04de               L371:
1381                     ; 324 					i--;
1383  04de 0a01          	dec	(OFST+0,sp)
1384  04e0 200e          	jra	L771
1385  04e2               L171:
1386                     ; 328 				if( i==10 )	i = 2;
1388  04e2 7b01          	ld	a,(OFST+0,sp)
1389  04e4 a10a          	cp	a,#10
1390  04e6 2606          	jrne	L102
1393  04e8 a602          	ld	a,#2
1394  04ea               LC002:
1395  04ea 6b01          	ld	(OFST+0,sp),a
1397  04ec 2002          	jra	L771
1398  04ee               L102:
1399                     ; 330 					i++;
1401  04ee 0c01          	inc	(OFST+0,sp)
1402  04f0               L771:
1403                     ; 332 			uiInfoSet.id = i;
1405  04f0 7b01          	ld	a,(OFST+0,sp)
1406  04f2 c70066        	ld	_uiInfoSet+1,a
1407  04f5               L761:
1408                     ; 334 		if( _dsPrev != i )
1410  04f5 c60010        	ld	a,__dsPrev
1411  04f8 1101          	cp	a,(OFST+0,sp)
1412  04fa 2710          	jreq	L561
1413                     ; 336 			_dsPrev = i;
1415  04fc 7b01          	ld	a,(OFST+0,sp)
1416  04fe c70010        	ld	__dsPrev,a
1417                     ; 338 			lcd_disp_n(3, uiInfoSet.id - 1);
1419  0501 c60066        	ld	a,_uiInfoSet+1
1420  0504 4a            	dec	a
1421  0505 97            	ld	xl,a
1422  0506 a603          	ld	a,#3
1423  0508 95            	ld	xh,a
1424  0509 cd0000        	call	_lcd_disp_n
1426  050c               L561:
1427                     ; 341 	if( key == 3 )	
1429  050c 7b02          	ld	a,(OFST+1,sp)
1430  050e a103          	cp	a,#3
1431  0510 2623          	jrne	L702
1432                     ; 343 		if( uiInfoSet.id == 10 )
1434  0512 c60066        	ld	a,_uiInfoSet+1
1435  0515 a10a          	cp	a,#10
1436  0517 260f          	jrne	L112
1437                     ; 346 			uiInfo.id = 1;
1439  0519 35010004      	mov	_uiInfo+4,#1
1440                     ; 347 			uiInfo.mode = 1;
1442  051d 35010008      	mov	_uiInfo+8,#1
1443                     ; 348 			copy_info(9);
1445  0521 a609          	ld	a,#9
1446  0523 cd167b        	call	_copy_info
1448                     ; 349 			return;
1450  0526 200d          	jra	L702
1451  0528               L112:
1452                     ; 351 		STATUS_NEXT(next);	
1454  0528 7b03          	ld	a,(OFST+2,sp)
1455  052a c7000e        	ld	__ds,a
1458  052d 725f000f      	clr	__dsCount
1461  0531 35ff0010      	mov	__dsPrev,#255
1463  0535               L702:
1464                     ; 353 }
1467  0535 5b03          	addw	sp,#3
1468  0537 81            	ret	
1523                     ; 355 void	disp_status_valveCount(uint8_t key, uint8_t next)
1523                     ; 356 {
1524                     	switch	.text
1525  0538               _disp_status_valveCount:
1527  0538 89            	pushw	x
1528  0539 88            	push	a
1529       00000001      OFST:	set	1
1532                     ; 358 	if( _dsCount == 0 )
1534  053a c6000f        	ld	a,__dsCount
1535  053d 2608          	jrne	L332
1536                     ; 360 		disp_next();
1538  053f cd04a0        	call	_disp_next
1540                     ; 361 		lcd_disp_setup_valve();
1542  0542 cd0000        	call	_lcd_disp_setup_valve
1545  0545 2068          	jra	L532
1546  0547               L332:
1547                     ; 365 		i = uiInfoSet.controlMode==0 ? uiInfoSet.valve : uiInfoSet.valve_sub;
1549  0547 c6006b        	ld	a,_uiInfoSet+6
1550  054a 2605          	jrne	L414
1551  054c c6006c        	ld	a,_uiInfoSet+7
1552  054f 2003          	jra	L614
1553  0551               L414:
1554  0551 c6006d        	ld	a,_uiInfoSet+8
1555  0554               L614:
1556  0554 6b01          	ld	(OFST+0,sp),a
1557                     ; 366 		if( uiInfo.enc != 0 )
1559  0556 c60000        	ld	a,_uiInfo
1560  0559 272f          	jreq	L732
1561                     ; 368 			if( (uiInfo.enc&0x40) == 0 )
1563  055b a540          	bcp	a,#64
1564  055d 260e          	jrne	L142
1565                     ; 370 				if( i==0 )	i = 8;
1567  055f 7b01          	ld	a,(OFST+0,sp)
1568  0561 2606          	jrne	L342
1571  0563 a608          	ld	a,#8
1572  0565 6b01          	ld	(OFST+0,sp),a
1574  0567 2010          	jra	L742
1575  0569               L342:
1576                     ; 372 					i--;
1578  0569 0a01          	dec	(OFST+0,sp)
1579  056b 200c          	jra	L742
1580  056d               L142:
1581                     ; 376 				if( i==8 )	i = 0;
1583  056d 7b01          	ld	a,(OFST+0,sp)
1584  056f a108          	cp	a,#8
1585  0571 2604          	jrne	L152
1588  0573 0f01          	clr	(OFST+0,sp)
1590  0575 2002          	jra	L742
1591  0577               L152:
1592                     ; 378 					i++;
1594  0577 0c01          	inc	(OFST+0,sp)
1595  0579               L742:
1596                     ; 381 			if( uiInfoSet.controlMode==0 )
1598  0579 c6006b        	ld	a,_uiInfoSet+6
1599  057c 2607          	jrne	L552
1600                     ; 382 				uiInfoSet.valve = i;
1602  057e 7b01          	ld	a,(OFST+0,sp)
1603  0580 c7006c        	ld	_uiInfoSet+7,a
1605  0583 2005          	jra	L732
1606  0585               L552:
1607                     ; 384 				uiInfoSet.valve_sub = i;
1609  0585 7b01          	ld	a,(OFST+0,sp)
1610  0587 c7006d        	ld	_uiInfoSet+8,a
1611  058a               L732:
1612                     ; 386 		if( _dsPrev != i )
1614  058a c60010        	ld	a,__dsPrev
1615  058d 1101          	cp	a,(OFST+0,sp)
1616  058f 271e          	jreq	L532
1617                     ; 388 			_dsPrev = i;
1619  0591 7b01          	ld	a,(OFST+0,sp)
1620  0593 c70010        	ld	__dsPrev,a
1621                     ; 389 			UI_DISP_2Digit(i);
1623  0596 5f            	clrw	x
1624  0597 97            	ld	xl,a
1625  0598 a60a          	ld	a,#10
1626  059a 62            	div	x,a
1627  059b a602          	ld	a,#2
1628  059d 95            	ld	xh,a
1629  059e cd0000        	call	_lcd_disp_n
1633  05a1 7b01          	ld	a,(OFST+0,sp)
1634  05a3 5f            	clrw	x
1635  05a4 97            	ld	xl,a
1636  05a5 a60a          	ld	a,#10
1637  05a7 62            	div	x,a
1638  05a8 97            	ld	xl,a
1639  05a9 a603          	ld	a,#3
1640  05ab 95            	ld	xh,a
1641  05ac cd0000        	call	_lcd_disp_n
1644  05af               L532:
1645                     ; 392 	if( key == 3 )		
1647  05af 7b02          	ld	a,(OFST+1,sp)
1648  05b1 a103          	cp	a,#3
1649  05b3 261e          	jrne	L362
1650                     ; 395 		if( uiInfoSet.controlMode==0 )
1652  05b5 c6006b        	ld	a,_uiInfoSet+6
1653  05b8 2607          	jrne	L562
1654                     ; 396 			uiInfoSet.cnt = uiInfoSet.valve;
1656  05ba 55006c0067    	mov	_uiInfoSet+2,_uiInfoSet+7
1658  05bf 2005          	jra	L762
1659  05c1               L562:
1660                     ; 398 			uiInfoSet.cnt_sub = uiInfoSet.valve_sub;
1662  05c1 55006d0068    	mov	_uiInfoSet+3,_uiInfoSet+8
1663  05c6               L762:
1664                     ; 399 		STATUS_NEXT(next);	
1666  05c6 7b03          	ld	a,(OFST+2,sp)
1667  05c8 c7000e        	ld	__ds,a
1670  05cb 725f000f      	clr	__dsCount
1673  05cf 35ff0010      	mov	__dsPrev,#255
1675  05d3               L362:
1676                     ; 401 }
1679  05d3 5b03          	addw	sp,#3
1680  05d5 81            	ret	
1745                     ; 403 void	disp_status_toffset(uint8_t key, uint8_t next)
1745                     ; 404 {
1746                     	switch	.text
1747  05d6               _disp_status_toffset:
1749  05d6 89            	pushw	x
1750  05d7 88            	push	a
1751       00000001      OFST:	set	1
1754                     ; 406 	if( _dsCount == 0 )
1756  05d8 c6000f        	ld	a,__dsCount
1757  05db 2609          	jrne	L313
1758                     ; 408 		disp_next();
1760  05dd cd04a0        	call	_disp_next
1762                     ; 409 		lcd_disp_setup_c();
1764  05e0 cd0000        	call	_lcd_disp_setup_c
1767  05e3 cc069c        	jra	L513
1768  05e6               L313:
1769                     ; 413 		i = uiInfoSet.tOffset;
1771  05e6 c60070        	ld	a,_uiInfoSet+11
1772  05e9 6b01          	ld	(OFST+0,sp),a
1773                     ; 414 		if( uiInfo.enc != 0 )
1775  05eb c60000        	ld	a,_uiInfo
1776  05ee 2740          	jreq	L713
1777                     ; 416 			if( (uiInfo.enc & 0x40) == 0 )
1779  05f0 a540          	bcp	a,#64
1780  05f2 261a          	jrne	L123
1781                     ; 418 				if( i > 100 )			i--;
1783  05f4 7b01          	ld	a,(OFST+0,sp)
1784  05f6 a165          	cp	a,#101
1787  05f8 242f          	jruge	L543
1788                     ; 419 				else if( i == 100 )		i = 1;
1790  05fa a164          	cp	a,#100
1791  05fc 2604          	jrne	L723
1794  05fe a601          	ld	a,#1
1796  0600 201c          	jp	LC004
1797  0602               L723:
1798                     ; 422 					i++;
1800  0602 0c01          	inc	(OFST+0,sp)
1801                     ; 423 					if( i >= 19 )		i = 19;
1803  0604 7b01          	ld	a,(OFST+0,sp)
1804  0606 a113          	cp	a,#19
1805  0608 2523          	jrult	L533
1808  060a a613          	ld	a,#19
1809  060c 2010          	jp	LC004
1810  060e               L123:
1811                     ; 428 				if( i >= 100 )
1813  060e 7b01          	ld	a,(OFST+0,sp)
1814  0610 a164          	cp	a,#100
1815  0612 250e          	jrult	L733
1816                     ; 430 					i++;
1818  0614 0c01          	inc	(OFST+0,sp)
1819                     ; 431 					if( i >= 119 )		i = 119;
1821  0616 7b01          	ld	a,(OFST+0,sp)
1822  0618 a177          	cp	a,#119
1823  061a 2511          	jrult	L533
1826  061c a677          	ld	a,#119
1827  061e               LC004:
1828  061e 6b01          	ld	(OFST+0,sp),a
1829  0620 200b          	jra	L533
1830  0622               L733:
1831                     ; 435 					if( i == 1 )		i = 100;
1833  0622 4a            	dec	a
1834  0623 2604          	jrne	L543
1837  0625 a664          	ld	a,#100
1839  0627 20f5          	jp	LC004
1840  0629               L543:
1841                     ; 437 						i--;
1844  0629 0a01          	dec	(OFST+0,sp)
1845  062b 7b01          	ld	a,(OFST+0,sp)
1846  062d               L533:
1847                     ; 440 			uiInfoSet.tOffset = i;
1849  062d c70070        	ld	_uiInfoSet+11,a
1850  0630               L713:
1851                     ; 442 		if( _dsPrev != i )
1853  0630 c60010        	ld	a,__dsPrev
1854  0633 1101          	cp	a,(OFST+0,sp)
1855  0635 2765          	jreq	L513
1856                     ; 444 			_dsPrev = i;
1858  0637 7b01          	ld	a,(OFST+0,sp)
1859  0639 c70010        	ld	__dsPrev,a
1860                     ; 445 			clear_npos2();
1862  063c cd0494        	call	_clear_npos2
1864                     ; 446 			LCD_BIT_CLEAR(bT3);
1866  063f c6003b        	ld	a,_iLF_DEF+59
1867  0642 5f            	clrw	x
1868  0643 97            	ld	xl,a
1869  0644 c6003b        	ld	a,_bLF_DEF+59
1870  0647 43            	cpl	a
1871  0648 d4540c        	and	a,(21516,x)
1872  064b d7540c        	ld	(21516,x),a
1873                     ; 447 			LCD_BIT_CLEAR(bT4);
1875  064e c6002b        	ld	a,_iLF_DEF+43
1876  0651 5f            	clrw	x
1877  0652 97            	ld	xl,a
1878  0653 c6002b        	ld	a,_bLF_DEF+43
1879  0656 43            	cpl	a
1880  0657 d4540c        	and	a,(21516,x)
1881  065a d7540c        	ld	(21516,x),a
1882                     ; 448 			if( i < 100 )
1884  065d 7b01          	ld	a,(OFST+0,sp)
1885  065f a164          	cp	a,#100
1886  0661 240d          	jruge	L353
1887                     ; 450 				LCD_BIT_SET(b3G);
1889  0663 c60028        	ld	a,_iLF_DEF+40
1890  0666 ad4a          	call	LC005
1891  0668 ca0028        	or	a,_bLF_DEF+40
1892  066b d7540c        	ld	(21516,x),a
1893  066e 7b01          	ld	a,(OFST+0,sp)
1894  0670               L353:
1895                     ; 452 			j = i%100;
1897  0670 5f            	clrw	x
1898  0671 97            	ld	xl,a
1899  0672 a664          	ld	a,#100
1900  0674 62            	div	x,a
1901  0675 6b01          	ld	(OFST+0,sp),a
1902                     ; 453 			lcd_disp_n(3, j/2);
1904  0677 5f            	clrw	x
1905  0678 97            	ld	xl,a
1906  0679 57            	sraw	x
1907  067a a603          	ld	a,#3
1908  067c 95            	ld	xh,a
1909  067d cd0000        	call	_lcd_disp_n
1911                     ; 454 			if( (j%2) == 1 )
1913  0680 7b01          	ld	a,(OFST+0,sp)
1914  0682 a401          	and	a,#1
1915  0684 2716          	jreq	L513
1916                     ; 456 				LCD_BIT_SET(bT3);
1918  0686 c6003b        	ld	a,_iLF_DEF+59
1919  0689 ad27          	call	LC005
1920  068b ca003b        	or	a,_bLF_DEF+59
1921  068e d7540c        	ld	(21516,x),a
1922                     ; 457 				LCD_BIT_SET(bT4);
1924  0691 c6002b        	ld	a,_iLF_DEF+43
1925  0694 ad1c          	call	LC005
1926  0696 ca002b        	or	a,_bLF_DEF+43
1927  0699 d7540c        	ld	(21516,x),a
1928  069c               L513:
1929                     ; 461 	if( key == 3 )	
1931  069c 7b02          	ld	a,(OFST+1,sp)
1932  069e a103          	cp	a,#3
1933  06a0 260d          	jrne	L753
1934                     ; 463 		STATUS_NEXT(next);	
1936  06a2 7b03          	ld	a,(OFST+2,sp)
1937  06a4 c7000e        	ld	__ds,a
1940  06a7 725f000f      	clr	__dsCount
1943  06ab 35ff0010      	mov	__dsPrev,#255
1945  06af               L753:
1946                     ; 465 }
1949  06af 5b03          	addw	sp,#3
1950  06b1 81            	ret	
1951  06b2               LC005:
1952  06b2 5f            	clrw	x
1953  06b3 97            	ld	xl,a
1954  06b4 d6540c        	ld	a,(21516,x)
1955  06b7 81            	ret	
2011                     ; 467 void	disp_status_run_op(uint8_t key, uint8_t next)
2011                     ; 468 {
2012                     	switch	.text
2013  06b8               _disp_status_run_op:
2015  06b8 89            	pushw	x
2016  06b9 88            	push	a
2017       00000001      OFST:	set	1
2020                     ; 470 	if( uiInfoSet.controlMode==1 )
2022  06ba c6006b        	ld	a,_uiInfoSet+6
2023  06bd 4a            	dec	a
2024  06be 2603          	jrne	L104
2025                     ; 472 		STATUS_NEXT(next);	
2027  06c0 9f            	ld	a,xl
2030                     ; 473 		return;
2033  06c1 204a          	jp	LC006
2034  06c3               L104:
2035                     ; 475 	if( _dsCount == 0 )
2037  06c3 c6000f        	ld	a,__dsCount
2038  06c6 2608          	jrne	L304
2039                     ; 477 		disp_next();
2041  06c8 cd04a0        	call	_disp_next
2043                     ; 478 		lcd_disp_setup_cntl_op();
2045  06cb cd0000        	call	_lcd_disp_setup_cntl_op
2048  06ce 2035          	jra	L504
2049  06d0               L304:
2050                     ; 482 		i = uiInfoSet.opMode;
2052  06d0 c60069        	ld	a,_uiInfoSet+4
2053  06d3 6b01          	ld	(OFST+0,sp),a
2054                     ; 483 		if( uiInfo.enc != 0 )
2056  06d5 c60000        	ld	a,_uiInfo
2057  06d8 270d          	jreq	L704
2058                     ; 485 			i = i==0 ? 1 : 0;
2060  06da 7b01          	ld	a,(OFST+0,sp)
2061  06dc 2603          	jrne	L444
2062  06de 4c            	inc	a
2063  06df 2001          	jra	L644
2064  06e1               L444:
2065  06e1 4f            	clr	a
2066  06e2               L644:
2067  06e2 6b01          	ld	(OFST+0,sp),a
2068                     ; 486 			uiInfoSet.opMode = i;
2070  06e4 c70069        	ld	_uiInfoSet+4,a
2071  06e7               L704:
2072                     ; 488 		if( _dsPrev != i )
2074  06e7 c60010        	ld	a,__dsPrev
2075  06ea 1101          	cp	a,(OFST+0,sp)
2076  06ec 2717          	jreq	L504
2077                     ; 490 			_dsPrev = i;
2079  06ee 7b01          	ld	a,(OFST+0,sp)
2080  06f0 c70010        	ld	__dsPrev,a
2081                     ; 491 			clear_npos2();
2083  06f3 cd0494        	call	_clear_npos2
2085                     ; 492 			if( i==0 )		lcd_disp_setup_cntl_on();
2087  06f6 7b01          	ld	a,(OFST+0,sp)
2088  06f8 2605          	jrne	L314
2091  06fa cd0000        	call	_lcd_disp_setup_cntl_on
2094  06fd 2006          	jra	L504
2095  06ff               L314:
2096                     ; 493 			else if( i==1 )	lcd_disp_setup_cntl_po();
2098  06ff 4a            	dec	a
2099  0700 2603          	jrne	L504
2102  0702 cd0000        	call	_lcd_disp_setup_cntl_po
2104  0705               L504:
2105                     ; 496 	if( key == 3 )		
2107  0705 7b02          	ld	a,(OFST+1,sp)
2108  0707 a103          	cp	a,#3
2109  0709 260d          	jrne	L124
2110                     ; 498 		STATUS_NEXT(next);	
2112  070b 7b03          	ld	a,(OFST+2,sp)
2117  070d               LC006:
2118  070d c7000e        	ld	__ds,a
2120  0710 725f000f      	clr	__dsCount
2122  0714 35ff0010      	mov	__dsPrev,#255
2124  0718               L124:
2125                     ; 500 }
2128  0718 5b03          	addw	sp,#3
2129  071a 81            	ret	
2186                     ; 502 void	disp_status_cntl_op(uint8_t key, uint8_t next)
2186                     ; 503 {
2187                     	switch	.text
2188  071b               _disp_status_cntl_op:
2190  071b 89            	pushw	x
2191  071c 88            	push	a
2192       00000001      OFST:	set	1
2195                     ; 505 	if( uiInfoSet.controlMode==1 )
2197  071d c6006b        	ld	a,_uiInfoSet+6
2198  0720 4a            	dec	a
2199  0721 2603          	jrne	L344
2200                     ; 507 		STATUS_NEXT(next);	
2202  0723 9f            	ld	a,xl
2205                     ; 508 		return;
2208  0724 2047          	jp	LC007
2209  0726               L344:
2210                     ; 510 	if( _dsCount == 0 )
2212  0726 c6000f        	ld	a,__dsCount
2213  0729 2608          	jrne	L544
2214                     ; 512 		disp_next();
2216  072b cd04a0        	call	_disp_next
2218                     ; 513 		lcd_disp_setup_mode();
2220  072e cd0000        	call	_lcd_disp_setup_mode
2223  0731 2032          	jra	L744
2224  0733               L544:
2225                     ; 517 		i = uiInfoSet.cntlMode;
2227  0733 c60065        	ld	a,_uiInfoSet
2228  0736 6b01          	ld	(OFST+0,sp),a
2229                     ; 518 		if( uiInfo.enc != 0 )
2231  0738 c60000        	ld	a,_uiInfo
2232  073b 270d          	jreq	L154
2233                     ; 520 			i = i==0 ? 1 : 0;
2235  073d 7b01          	ld	a,(OFST+0,sp)
2236  073f 2603          	jrne	L664
2237  0741 4c            	inc	a
2238  0742 2001          	jra	L074
2239  0744               L664:
2240  0744 4f            	clr	a
2241  0745               L074:
2242  0745 6b01          	ld	(OFST+0,sp),a
2243                     ; 521 			uiInfoSet.cntlMode = i;
2245  0747 c70065        	ld	_uiInfoSet,a
2246  074a               L154:
2247                     ; 523 		if( _dsPrev != i )
2249  074a c60010        	ld	a,__dsPrev
2250  074d 1101          	cp	a,(OFST+0,sp)
2251  074f 2714          	jreq	L744
2252                     ; 525 			_dsPrev = i;
2254  0751 7b01          	ld	a,(OFST+0,sp)
2255  0753 c70010        	ld	__dsPrev,a
2256                     ; 526 			clear_npos2();
2258  0756 cd0494        	call	_clear_npos2
2260                     ; 527 			if( i == 0 )	lcd_disp_setup_mode_local();
2262  0759 7b01          	ld	a,(OFST+0,sp)
2263  075b 2605          	jrne	L554
2266  075d cd0000        	call	_lcd_disp_setup_mode_local
2269  0760 2003          	jra	L744
2270  0762               L554:
2271                     ; 528 			else			lcd_disp_setup_mode_each();
2273  0762 cd0000        	call	_lcd_disp_setup_mode_each
2275  0765               L744:
2276                     ; 531 	if( key == 3 )		
2278  0765 7b02          	ld	a,(OFST+1,sp)
2279  0767 a103          	cp	a,#3
2280  0769 260d          	jrne	L164
2281                     ; 533 		STATUS_NEXT(next);	
2283  076b 7b03          	ld	a,(OFST+2,sp)
2288  076d               LC007:
2289  076d c7000e        	ld	__ds,a
2291  0770 725f000f      	clr	__dsCount
2293  0774 35ff0010      	mov	__dsPrev,#255
2295  0778               L164:
2296                     ; 535 }
2299  0778 5b03          	addw	sp,#3
2300  077a 81            	ret	
2355                     ; 537 void	disp_status_houseCapa(uint8_t key, uint8_t next)
2355                     ; 538 {
2356                     	switch	.text
2357  077b               _disp_status_houseCapa:
2359  077b 89            	pushw	x
2360  077c 88            	push	a
2361       00000001      OFST:	set	1
2364                     ; 540 	if(uiInfoSet.cntlMode != 0 )	
2366  077d c60065        	ld	a,_uiInfoSet
2367  0780 2703          	jreq	L305
2368                     ; 543 		STATUS_NEXT(next);
2370  0782 9f            	ld	a,xl
2373                     ; 544 		return;
2376  0783 207a          	jp	LC008
2377  0785               L305:
2378                     ; 547 	if( _dsCount == 0 )
2380  0785 c6000f        	ld	a,__dsCount
2381  0788 2608          	jrne	L505
2382                     ; 549 		disp_next();
2384  078a cd04a0        	call	_disp_next
2386                     ; 550 		lcd_disp_setup_len();
2388  078d cd0000        	call	_lcd_disp_setup_len
2391  0790 2065          	jra	L705
2392  0792               L505:
2393                     ; 554 		i = uiInfoSet.houseCapa;
2395  0792 c6006f        	ld	a,_uiInfoSet+10
2396  0795 6b01          	ld	(OFST+0,sp),a
2397                     ; 555 		if( uiInfo.enc != 0 )
2399  0797 c60000        	ld	a,_uiInfo
2400  079a 271f          	jreq	L115
2401                     ; 557 			if( (uiInfo.enc & 0x40) == 0 )	i--;
2403  079c a540          	bcp	a,#64
2404  079e 2604          	jrne	L315
2407  07a0 0a01          	dec	(OFST+0,sp)
2409  07a2 2002          	jra	L515
2410  07a4               L315:
2411                     ; 559 				i++;
2413  07a4 0c01          	inc	(OFST+0,sp)
2414  07a6               L515:
2415                     ; 560 			if( i < 70 )	i = 200;
2417  07a6 7b01          	ld	a,(OFST+0,sp)
2418  07a8 a146          	cp	a,#70
2419  07aa 2404          	jruge	L715
2422  07ac a6c8          	ld	a,#200
2423  07ae 6b01          	ld	(OFST+0,sp),a
2424  07b0               L715:
2425                     ; 561 			if( i > 200 )	i = 70;
2427  07b0 a1c9          	cp	a,#201
2428  07b2 2504          	jrult	L125
2431  07b4 a646          	ld	a,#70
2432  07b6 6b01          	ld	(OFST+0,sp),a
2433  07b8               L125:
2434                     ; 562 			uiInfoSet.houseCapa = i;
2436  07b8 c7006f        	ld	_uiInfoSet+10,a
2437  07bb               L115:
2438                     ; 564 		if( _dsPrev != i )
2440  07bb c60010        	ld	a,__dsPrev
2441  07be 1101          	cp	a,(OFST+0,sp)
2442  07c0 2735          	jreq	L705
2443                     ; 566 			_dsPrev = i;
2445  07c2 7b01          	ld	a,(OFST+0,sp)
2446  07c4 c70010        	ld	__dsPrev,a
2447                     ; 567 			UI_DISP_3Digit(i);
2449  07c7 5f            	clrw	x
2450  07c8 97            	ld	xl,a
2451  07c9 a664          	ld	a,#100
2452  07cb 62            	div	x,a
2453  07cc a601          	ld	a,#1
2454  07ce 95            	ld	xh,a
2455  07cf cd0000        	call	_lcd_disp_n
2459  07d2 7b01          	ld	a,(OFST+0,sp)
2460  07d4 5f            	clrw	x
2461  07d5 97            	ld	xl,a
2462  07d6 a664          	ld	a,#100
2463  07d8 62            	div	x,a
2464  07d9 5f            	clrw	x
2465  07da 97            	ld	xl,a
2466  07db 01            	rrwa	x,a
2467  07dc 6b01          	ld	(OFST+0,sp),a
2470  07de 5f            	clrw	x
2471  07df 97            	ld	xl,a
2472  07e0 a60a          	ld	a,#10
2473  07e2 62            	div	x,a
2474  07e3 a602          	ld	a,#2
2475  07e5 95            	ld	xh,a
2476  07e6 cd0000        	call	_lcd_disp_n
2480  07e9 7b01          	ld	a,(OFST+0,sp)
2481  07eb 5f            	clrw	x
2482  07ec 97            	ld	xl,a
2483  07ed a60a          	ld	a,#10
2484  07ef 62            	div	x,a
2485  07f0 97            	ld	xl,a
2486  07f1 a603          	ld	a,#3
2487  07f3 95            	ld	xh,a
2488  07f4 cd0000        	call	_lcd_disp_n
2491  07f7               L705:
2492                     ; 570 	if( key == 3 )		
2494  07f7 7b02          	ld	a,(OFST+1,sp)
2495  07f9 a103          	cp	a,#3
2496  07fb 260d          	jrne	L525
2497                     ; 572 		STATUS_NEXT(next);	
2499  07fd 7b03          	ld	a,(OFST+2,sp)
2504  07ff               LC008:
2505  07ff c7000e        	ld	__ds,a
2507  0802 725f000f      	clr	__dsCount
2509  0806 35ff0010      	mov	__dsPrev,#255
2511  080a               L525:
2512                     ; 574 }
2515  080a 5b03          	addw	sp,#3
2516  080c 81            	ret	
2549                     ; 576 void	disp_status_po_type(uint8_t key, uint8_t next)
2549                     ; 577 {
2550                     	switch	.text
2551  080d               _disp_status_po_type:
2555                     ; 619 }
2558  080d 81            	ret	
2561                     	switch	.const
2562  0012               ___lpm:
2563  0012 00            	dc.b	0
2564  0013 08            	dc.b	8
2565  0014 0a            	dc.b	10
2566  0015 0f            	dc.b	15
2567  0016 14            	dc.b	20
2568  0017 19            	dc.b	25
2569  0018 1e            	dc.b	30
2570  0019 63            	dc.b	99
2571  001a 63            	dc.b	99
2625                     ; 626 void	disp_status_lpm(uint8_t key, uint8_t next)
2625                     ; 627 {
2626                     	switch	.text
2627  080e               _disp_status_lpm:
2629  080e 89            	pushw	x
2630  080f 88            	push	a
2631       00000001      OFST:	set	1
2634                     ; 630 	if( uiInfoSet.cntlMode == 1 )
2636  0810 c60065        	ld	a,_uiInfoSet
2637  0813 4a            	dec	a
2638  0814 2603          	jrne	L365
2639                     ; 632 		STATUS_NEXT(next);
2641  0816 9f            	ld	a,xl
2644                     ; 633 		return;
2647  0817 207e          	jp	LC009
2648  0819               L365:
2649                     ; 635 	if( _dsCount == 0 )
2651  0819 c6000f        	ld	a,__dsCount
2652  081c 2608          	jrne	L565
2653                     ; 637 		disp_next();
2655  081e cd04a0        	call	_disp_next
2657                     ; 638 		lcd_disp_setup_lpm();
2659  0821 cd0000        	call	_lcd_disp_setup_lpm
2662  0824 2069          	jra	L765
2663  0826               L565:
2664                     ; 642 		i = uiInfoSet.controlMode==1 ? uiInfoSet.lpmType_sub : uiInfoSet.lpmType;
2666  0826 c6006b        	ld	a,_uiInfoSet+6
2667  0829 4a            	dec	a
2668  082a 2605          	jrne	L035
2669  082c c60073        	ld	a,_uiInfoSet+14
2670  082f 2003          	jra	L235
2671  0831               L035:
2672  0831 c60072        	ld	a,_uiInfoSet+13
2673  0834               L235:
2674  0834 6b01          	ld	(OFST+0,sp),a
2675                     ; 644 		if( uiInfo.enc != 0 )
2677  0836 c60000        	ld	a,_uiInfo
2678  0839 2730          	jreq	L175
2679                     ; 646 			if( (uiInfo.enc & 0x40) == 0 )
2681  083b a540          	bcp	a,#64
2682  083d 260e          	jrne	L375
2683                     ; 648 				if( i==0 )	i = 7;
2685  083f 7b01          	ld	a,(OFST+0,sp)
2686  0841 2606          	jrne	L575
2689  0843 a607          	ld	a,#7
2690  0845 6b01          	ld	(OFST+0,sp),a
2692  0847 2010          	jra	L106
2693  0849               L575:
2694                     ; 650 					i--;
2696  0849 0a01          	dec	(OFST+0,sp)
2697  084b 200c          	jra	L106
2698  084d               L375:
2699                     ; 654 				if( i==7 )	i = 0;
2701  084d 7b01          	ld	a,(OFST+0,sp)
2702  084f a107          	cp	a,#7
2703  0851 2604          	jrne	L306
2706  0853 0f01          	clr	(OFST+0,sp)
2708  0855 2002          	jra	L106
2709  0857               L306:
2710                     ; 656 					i++;
2712  0857 0c01          	inc	(OFST+0,sp)
2713  0859               L106:
2714                     ; 658 			if( uiInfoSet.controlMode==1 )
2716  0859 c6006b        	ld	a,_uiInfoSet+6
2717  085c 4a            	dec	a
2718  085d 2607          	jrne	L706
2719                     ; 659 				uiInfoSet.lpmType_sub = i;
2721  085f 7b01          	ld	a,(OFST+0,sp)
2722  0861 c70073        	ld	_uiInfoSet+14,a
2724  0864 2005          	jra	L175
2725  0866               L706:
2726                     ; 661 				uiInfoSet.lpmType = i;
2728  0866 7b01          	ld	a,(OFST+0,sp)
2729  0868 c70072        	ld	_uiInfoSet+13,a
2730  086b               L175:
2731                     ; 663 		if( _dsPrev != i )
2733  086b c60010        	ld	a,__dsPrev
2734  086e 1101          	cp	a,(OFST+0,sp)
2735  0870 271d          	jreq	L765
2736                     ; 665 			_dsPrev = i;
2738  0872 7b01          	ld	a,(OFST+0,sp)
2739  0874 c70010        	ld	__dsPrev,a
2740                     ; 666 			clear_npos2();
2742  0877 cd0494        	call	_clear_npos2
2744                     ; 667 			UI_DISP_2Digit(__lpm[i]);
2746  087a 7b01          	ld	a,(OFST+0,sp)
2747  087c ad27          	call	LC010
2748  087e a602          	ld	a,#2
2749  0880 95            	ld	xh,a
2750  0881 cd0000        	call	_lcd_disp_n
2754  0884 7b01          	ld	a,(OFST+0,sp)
2755  0886 ad1d          	call	LC010
2756  0888 97            	ld	xl,a
2757  0889 a603          	ld	a,#3
2758  088b 95            	ld	xh,a
2759  088c cd0000        	call	_lcd_disp_n
2762  088f               L765:
2763                     ; 670 	if( key == 3 )		
2765  088f 7b02          	ld	a,(OFST+1,sp)
2766  0891 a103          	cp	a,#3
2767  0893 260d          	jrne	L516
2768                     ; 672 		STATUS_NEXT(next);	
2770  0895 7b03          	ld	a,(OFST+2,sp)
2775  0897               LC009:
2776  0897 c7000e        	ld	__ds,a
2778  089a 725f000f      	clr	__dsCount
2780  089e 35ff0010      	mov	__dsPrev,#255
2782  08a2               L516:
2783                     ; 674 }
2786  08a2 5b03          	addw	sp,#3
2787  08a4 81            	ret	
2788  08a5               LC010:
2789  08a5 5f            	clrw	x
2790  08a6 97            	ld	xl,a
2791  08a7 d60012        	ld	a,(___lpm,x)
2792  08aa 5f            	clrw	x
2793  08ab 97            	ld	xl,a
2794  08ac a60a          	ld	a,#10
2795  08ae 62            	div	x,a
2796  08af 81            	ret	
2851                     ; 676 void	disp_status_temp_offset(uint8_t key, uint8_t next)
2851                     ; 677 {
2852                     	switch	.text
2853  08b0               _disp_status_temp_offset:
2855  08b0 89            	pushw	x
2856  08b1 88            	push	a
2857       00000001      OFST:	set	1
2860                     ; 679 	if( uiInfoSet.opMode == 0 )
2862  08b2 c60069        	ld	a,_uiInfoSet+4
2863  08b5 2603          	jrne	L736
2864                     ; 681 		STATUS_NEXT(next);
2866  08b7 9f            	ld	a,xl
2869                     ; 682 		return;
2872  08b8 207a          	jp	LC011
2873  08ba               L736:
2874                     ; 684 	if( _dsCount == 0 )
2876  08ba c6000f        	ld	a,__dsCount
2877  08bd 2608          	jrne	L146
2878                     ; 686 		disp_next();
2880  08bf cd04a0        	call	_disp_next
2882                     ; 687 		lcd_disp_setup_temp_offset();
2884  08c2 cd0000        	call	_lcd_disp_setup_temp_offset
2887  08c5 2065          	jra	L346
2888  08c7               L146:
2889                     ; 691 		i = uiInfoSet.tempOffset;
2891  08c7 c60071        	ld	a,_uiInfoSet+12
2892  08ca 6b01          	ld	(OFST+0,sp),a
2893                     ; 692 		if( uiInfo.enc != 0 )
2895  08cc c60000        	ld	a,_uiInfo
2896  08cf 271f          	jreq	L546
2897                     ; 694 			if( (uiInfo.enc & 0x40) == 0 )	i--;
2899  08d1 a540          	bcp	a,#64
2900  08d3 2604          	jrne	L746
2903  08d5 0a01          	dec	(OFST+0,sp)
2905  08d7 2002          	jra	L156
2906  08d9               L746:
2907                     ; 696 				i++;
2909  08d9 0c01          	inc	(OFST+0,sp)
2910  08db               L156:
2911                     ; 697 			if( i < 60 )	i = 100;
2913  08db 7b01          	ld	a,(OFST+0,sp)
2914  08dd a13c          	cp	a,#60
2915  08df 2404          	jruge	L356
2918  08e1 a664          	ld	a,#100
2919  08e3 6b01          	ld	(OFST+0,sp),a
2920  08e5               L356:
2921                     ; 698 			if( i > 100 )	i = 60;
2923  08e5 a165          	cp	a,#101
2924  08e7 2504          	jrult	L556
2927  08e9 a63c          	ld	a,#60
2928  08eb 6b01          	ld	(OFST+0,sp),a
2929  08ed               L556:
2930                     ; 699 			uiInfoSet.tempOffset = i;
2932  08ed c70071        	ld	_uiInfoSet+12,a
2933  08f0               L546:
2934                     ; 701 		if( _dsPrev != i )
2936  08f0 c60010        	ld	a,__dsPrev
2937  08f3 1101          	cp	a,(OFST+0,sp)
2938  08f5 2735          	jreq	L346
2939                     ; 703 			_dsPrev = i;
2941  08f7 7b01          	ld	a,(OFST+0,sp)
2942  08f9 c70010        	ld	__dsPrev,a
2943                     ; 704 			UI_DISP_3Digit(i);
2945  08fc 5f            	clrw	x
2946  08fd 97            	ld	xl,a
2947  08fe a664          	ld	a,#100
2948  0900 62            	div	x,a
2949  0901 a601          	ld	a,#1
2950  0903 95            	ld	xh,a
2951  0904 cd0000        	call	_lcd_disp_n
2955  0907 7b01          	ld	a,(OFST+0,sp)
2956  0909 5f            	clrw	x
2957  090a 97            	ld	xl,a
2958  090b a664          	ld	a,#100
2959  090d 62            	div	x,a
2960  090e 5f            	clrw	x
2961  090f 97            	ld	xl,a
2962  0910 01            	rrwa	x,a
2963  0911 6b01          	ld	(OFST+0,sp),a
2966  0913 5f            	clrw	x
2967  0914 97            	ld	xl,a
2968  0915 a60a          	ld	a,#10
2969  0917 62            	div	x,a
2970  0918 a602          	ld	a,#2
2971  091a 95            	ld	xh,a
2972  091b cd0000        	call	_lcd_disp_n
2976  091e 7b01          	ld	a,(OFST+0,sp)
2977  0920 5f            	clrw	x
2978  0921 97            	ld	xl,a
2979  0922 a60a          	ld	a,#10
2980  0924 62            	div	x,a
2981  0925 97            	ld	xl,a
2982  0926 a603          	ld	a,#3
2983  0928 95            	ld	xh,a
2984  0929 cd0000        	call	_lcd_disp_n
2987  092c               L346:
2988                     ; 707 	if( key == 3 )		
2990  092c 7b02          	ld	a,(OFST+1,sp)
2991  092e a103          	cp	a,#3
2992  0930 260d          	jrne	L166
2993                     ; 709 		STATUS_NEXT(next);	
2995  0932 7b03          	ld	a,(OFST+2,sp)
3000  0934               LC011:
3001  0934 c7000e        	ld	__ds,a
3003  0937 725f000f      	clr	__dsCount
3005  093b 35ff0010      	mov	__dsPrev,#255
3007  093f               L166:
3008                     ; 711 }
3011  093f 5b03          	addw	sp,#3
3012  0941 81            	ret	
3015                     	switch	.data
3016  0011               __ui_:
3017  0011 00            	dc.b	0
3097                     ; 719 void	disp_status_valveinfo_sub(uint8_t key, uint8_t next, uint8_t prev)
3097                     ; 720 {
3098                     	switch	.text
3099  0942               _disp_status_valveinfo_sub:
3101  0942 89            	pushw	x
3102  0943 520c          	subw	sp,#12
3103       0000000c      OFST:	set	12
3106                     ; 723 	if( _dsCount == 0 )
3108  0945 c6000f        	ld	a,__dsCount
3109  0948 2664          	jrne	L317
3110                     ; 725 		if( uiInfoSet.valve_sub == 0 )
3112  094a 725d006d      	tnz	_uiInfoSet+8
3113  094e 260a          	jrne	L517
3114                     ; 727 			uiInfoSet.cnt_sub = 0;
3116  0950 c70068        	ld	_uiInfoSet+3,a
3117                     ; 728 			uiInfoSet.lpmType_sub = 0;
3119  0953 c70073        	ld	_uiInfoSet+14,a
3120                     ; 729 			STATUS_NEXT(next);	
3122  0956 9f            	ld	a,xl
3123  0957 cd0aca        	call	LC014
3125  095a               L517:
3126                     ; 731 		disp_next();
3128  095a cd04a0        	call	_disp_next
3130                     ; 732 		lcd_disp_n(0, UI_RIDs+1);
3132  095d c60098        	ld	a,_uiInfoSet+51
3133  0960 4c            	inc	a
3134  0961 97            	ld	xl,a
3135  0962 4f            	clr	a
3136  0963 95            	ld	xh,a
3137  0964 cd0000        	call	_lcd_disp_n
3139                     ; 733 		lcd_blink_npos(UI_RIDs+1);
3141  0967 c60098        	ld	a,_uiInfoSet+51
3142  096a 4c            	inc	a
3143  096b cd0000        	call	_lcd_blink_npos
3145                     ; 734 		_ui_ = uiInfoSet.valve_sub_rc[UI_RIDs];// + uiInfoSet.cnt;
3147  096e cd0ac4        	call	LC013
3148  0971 d6008c        	ld	a,(_uiInfoSet+39,x)
3149  0974 c70011        	ld	__ui_,a
3150                     ; 735 		lcd_disp_rid(_ui_, 1, 0);
3152  0977 4b00          	push	#0
3153  0979 ae0001        	ldw	x,#1
3154  097c 95            	ld	xh,a
3155  097d cd0000        	call	_lcd_disp_rid
3157  0980 84            	pop	a
3158                     ; 736 		for( i=0; i<8; i++ )
3160  0981 4f            	clr	a
3161  0982 6b0c          	ld	(OFST+0,sp),a
3162  0984               L717:
3163                     ; 738 			if( i >= uiInfoSet.valve_sub )
3165  0984 c1006d        	cp	a,_uiInfoSet+8
3166  0987 5f            	clrw	x
3167  0988 97            	ld	xl,a
3168  0989 250c          	jrult	L527
3169                     ; 740 				uiInfoSet.valve_sub_len[i] = 0;
3171  098b 724f0084      	clr	(_uiInfoSet+31,x)
3172                     ; 741 				uiInfoSet.valve_sub_rc[i] = 0;
3174  098f 5f            	clrw	x
3175  0990 97            	ld	xl,a
3176  0991 724f008c      	clr	(_uiInfoSet+39,x)
3178  0995 200d          	jra	L727
3179  0997               L527:
3180                     ; 745 				if( uiInfoSet.valve_rc[i] == 0 )
3182  0997 724d007c      	tnz	(_uiInfoSet+23,x)
3183  099b 2607          	jrne	L727
3184                     ; 746 					uiInfoSet.valve_rc[i] = 1;
3186  099d 5f            	clrw	x
3187  099e 97            	ld	xl,a
3188  099f a601          	ld	a,#1
3189  09a1 d7007c        	ld	(_uiInfoSet+23,x),a
3190  09a4               L727:
3191                     ; 736 		for( i=0; i<8; i++ )
3193  09a4 0c0c          	inc	(OFST+0,sp)
3196  09a6 7b0c          	ld	a,(OFST+0,sp)
3197  09a8 a108          	cp	a,#8
3198  09aa 25d8          	jrult	L717
3200  09ac 206d          	jra	L337
3201  09ae               L317:
3202                     ; 752 		i = uiInfoSet.valve_sub_len[UI_RIDs];
3204  09ae cd0ac4        	call	LC013
3205  09b1 d60084        	ld	a,(_uiInfoSet+31,x)
3206  09b4 6b0c          	ld	(OFST+0,sp),a
3207                     ; 753 		if( uiInfo.enc != 0 )
3209  09b6 c60000        	ld	a,_uiInfo
3210  09b9 2724          	jreq	L537
3211                     ; 755 			if( (uiInfo.enc & 0x40) == 0 )	i--;
3213  09bb a540          	bcp	a,#64
3214  09bd 2604          	jrne	L737
3217  09bf 0a0c          	dec	(OFST+0,sp)
3219  09c1 2002          	jra	L147
3220  09c3               L737:
3221                     ; 757 				i++;
3223  09c3 0c0c          	inc	(OFST+0,sp)
3224  09c5               L147:
3225                     ; 758 			if( i > 150 )	i = 35;
3227  09c5 7b0c          	ld	a,(OFST+0,sp)
3228  09c7 a197          	cp	a,#151
3229  09c9 2504          	jrult	L347
3232  09cb a623          	ld	a,#35
3233  09cd 6b0c          	ld	(OFST+0,sp),a
3234  09cf               L347:
3235                     ; 759 			if( i < 35 )	i = 150;
3237  09cf a123          	cp	a,#35
3238  09d1 2404          	jruge	L547
3241  09d3 a696          	ld	a,#150
3242  09d5 6b0c          	ld	(OFST+0,sp),a
3243  09d7               L547:
3244                     ; 760 			uiInfoSet.valve_sub_len[UI_RIDs] = i;
3246  09d7 cd0ac4        	call	LC013
3247  09da 7b0c          	ld	a,(OFST+0,sp)
3248  09dc d70084        	ld	(_uiInfoSet+31,x),a
3249  09df               L537:
3250                     ; 762 		if( _dsPrev != i )
3252  09df c60010        	ld	a,__dsPrev
3253  09e2 110c          	cp	a,(OFST+0,sp)
3254  09e4 2735          	jreq	L337
3255                     ; 764 			_dsPrev = i;
3257  09e6 7b0c          	ld	a,(OFST+0,sp)
3258  09e8 c70010        	ld	__dsPrev,a
3259                     ; 765 			UI_DISP_3Digit(i);
3261  09eb 5f            	clrw	x
3262  09ec 97            	ld	xl,a
3263  09ed a664          	ld	a,#100
3264  09ef 62            	div	x,a
3265  09f0 a601          	ld	a,#1
3266  09f2 95            	ld	xh,a
3267  09f3 cd0000        	call	_lcd_disp_n
3271  09f6 7b0c          	ld	a,(OFST+0,sp)
3272  09f8 5f            	clrw	x
3273  09f9 97            	ld	xl,a
3274  09fa a664          	ld	a,#100
3275  09fc 62            	div	x,a
3276  09fd 5f            	clrw	x
3277  09fe 97            	ld	xl,a
3278  09ff 01            	rrwa	x,a
3279  0a00 6b0c          	ld	(OFST+0,sp),a
3282  0a02 5f            	clrw	x
3283  0a03 97            	ld	xl,a
3284  0a04 a60a          	ld	a,#10
3285  0a06 62            	div	x,a
3286  0a07 a602          	ld	a,#2
3287  0a09 95            	ld	xh,a
3288  0a0a cd0000        	call	_lcd_disp_n
3292  0a0d 7b0c          	ld	a,(OFST+0,sp)
3293  0a0f 5f            	clrw	x
3294  0a10 97            	ld	xl,a
3295  0a11 a60a          	ld	a,#10
3296  0a13 62            	div	x,a
3297  0a14 97            	ld	xl,a
3298  0a15 a603          	ld	a,#3
3299  0a17 95            	ld	xh,a
3300  0a18 cd0000        	call	_lcd_disp_n
3303  0a1b               L337:
3304                     ; 768 	if( key == 3 )		
3306  0a1b 7b0d          	ld	a,(OFST+1,sp)
3307  0a1d a103          	cp	a,#3
3308  0a1f 266a          	jrne	L157
3309                     ; 770 		lcd_blink_npos_clear();
3311  0a21 cd0000        	call	_lcd_blink_npos_clear
3313                     ; 771 		STATUS_NEXT(next);	
3315  0a24 7b0e          	ld	a,(OFST+2,sp)
3316  0a26 cd0aca        	call	LC014
3317                     ; 772 		for( i=0; i<8; i++ )
3320  0a29 0f0c          	clr	(OFST+0,sp)
3321  0a2b               L357:
3322                     ; 773 			b[i] = 0;
3324  0a2b 96            	ldw	x,sp
3325  0a2c 1c0004        	addw	x,#OFST-8
3326  0a2f 9f            	ld	a,xl
3327  0a30 5e            	swapw	x
3328  0a31 1b0c          	add	a,(OFST+0,sp)
3329  0a33 2401          	jrnc	L406
3330  0a35 5c            	incw	x
3331  0a36               L406:
3332  0a36 02            	rlwa	x,a
3333  0a37 7f            	clr	(x)
3334                     ; 772 		for( i=0; i<8; i++ )
3336  0a38 0c0c          	inc	(OFST+0,sp)
3339  0a3a 7b0c          	ld	a,(OFST+0,sp)
3340  0a3c a108          	cp	a,#8
3341  0a3e 25eb          	jrult	L357
3342                     ; 774 		for( i=0; i<8; i++ )
3344  0a40 4f            	clr	a
3345  0a41 6b0c          	ld	(OFST+0,sp),a
3346  0a43               L167:
3347                     ; 776 			if( uiInfoSet.valve_sub_rc[i] != 0 )
3349  0a43 5f            	clrw	x
3350  0a44 97            	ld	xl,a
3351  0a45 724d008c      	tnz	(_uiInfoSet+39,x)
3352  0a49 2714          	jreq	L767
3353                     ; 777 				b[uiInfoSet.valve_sub_rc[i]-1] = 1;
3355  0a4b 96            	ldw	x,sp
3356  0a4c 1c0004        	addw	x,#OFST-8
3357  0a4f 1f01          	ldw	(OFST-11,sp),x
3358  0a51 5f            	clrw	x
3359  0a52 97            	ld	xl,a
3360  0a53 d6008c        	ld	a,(_uiInfoSet+39,x)
3361  0a56 5f            	clrw	x
3362  0a57 97            	ld	xl,a
3363  0a58 5a            	decw	x
3364  0a59 72fb01        	addw	x,(OFST-11,sp)
3365  0a5c a601          	ld	a,#1
3366  0a5e f7            	ld	(x),a
3367  0a5f               L767:
3368                     ; 774 		for( i=0; i<8; i++ )
3370  0a5f 0c0c          	inc	(OFST+0,sp)
3373  0a61 7b0c          	ld	a,(OFST+0,sp)
3374  0a63 a108          	cp	a,#8
3375  0a65 25dc          	jrult	L167
3376                     ; 779 		j = 0;
3378  0a67 0f03          	clr	(OFST-9,sp)
3379                     ; 780 		for( i=0; i<8; i++ )
3381  0a69 0f0c          	clr	(OFST+0,sp)
3382  0a6b               L177:
3383                     ; 782 			if( b[i] != 0 )
3385  0a6b 96            	ldw	x,sp
3386  0a6c 1c0004        	addw	x,#OFST-8
3387  0a6f 9f            	ld	a,xl
3388  0a70 5e            	swapw	x
3389  0a71 1b0c          	add	a,(OFST+0,sp)
3390  0a73 2401          	jrnc	L606
3391  0a75 5c            	incw	x
3392  0a76               L606:
3393  0a76 02            	rlwa	x,a
3394  0a77 f6            	ld	a,(x)
3395  0a78 2702          	jreq	L777
3396                     ; 783 				j++;
3398  0a7a 0c03          	inc	(OFST-9,sp)
3399  0a7c               L777:
3400                     ; 780 		for( i=0; i<8; i++ )
3402  0a7c 0c0c          	inc	(OFST+0,sp)
3405  0a7e 7b0c          	ld	a,(OFST+0,sp)
3406  0a80 a108          	cp	a,#8
3407  0a82 25e7          	jrult	L177
3408                     ; 785 		uiInfoSet.cnt_sub = j;
3410  0a84 7b03          	ld	a,(OFST-9,sp)
3411  0a86 c70068        	ld	_uiInfoSet+3,a
3413  0a89 2036          	jra	L1001
3414  0a8b               L157:
3415                     ; 787 	else if( key == 4 )
3417  0a8b a104          	cp	a,#4
3418  0a8d 2618          	jrne	L3001
3419                     ; 789 		uiInfoSet.valve_sub_rc[UI_RIDs]++;
3421  0a8f ad33          	call	LC013
3422  0a91 724c008c      	inc	(_uiInfoSet+39,x)
3423                     ; 790 		if( uiInfoSet.valve_sub_rc[UI_RIDs] > 8 )
3425  0a95 5f            	clrw	x
3426  0a96 97            	ld	xl,a
3427  0a97 d6008c        	ld	a,(_uiInfoSet+39,x)
3428  0a9a a109          	cp	a,#9
3429  0a9c 251f          	jrult	L3101
3430                     ; 791 			uiInfoSet.valve_sub_rc[UI_RIDs] = 1;
3432  0a9e ad24          	call	LC013
3433  0aa0 a601          	ld	a,#1
3434  0aa2 d7008c        	ld	(_uiInfoSet+39,x),a
3435                     ; 798 		STATUS_NEXT(prev);
3440  0aa5 2016          	jp	L3101
3441  0aa7               L3001:
3442                     ; 800 	else if( key == 1 )
3444  0aa7 4a            	dec	a
3445  0aa8 2617          	jrne	L1001
3446                     ; 802 		lcd_blink_npos_clear();
3448  0aaa cd0000        	call	_lcd_blink_npos_clear
3450                     ; 803 		UI_RIDs++;
3452  0aad 725c0098      	inc	_uiInfoSet+51
3453                     ; 804 		if( UI_RIDs >= uiInfoSet.valve_sub )
3455  0ab1 c60098        	ld	a,_uiInfoSet+51
3456  0ab4 c1006d        	cp	a,_uiInfoSet+8
3457  0ab7 2504          	jrult	L3101
3458                     ; 805 			UI_RIDs = 0;
3460  0ab9 725f0098      	clr	_uiInfoSet+51
3461  0abd               L3101:
3462                     ; 806 		STATUS_NEXT(prev);
3469  0abd 7b11          	ld	a,(OFST+5,sp)
3470  0abf ad09          	call	LC014
3472  0ac1               L1001:
3473                     ; 808 }
3476  0ac1 5b0e          	addw	sp,#14
3477  0ac3 81            	ret	
3478  0ac4               LC013:
3479  0ac4 c60098        	ld	a,_uiInfoSet+51
3480  0ac7 5f            	clrw	x
3481  0ac8 97            	ld	xl,a
3482  0ac9 81            	ret	
3483  0aca               LC014:
3484  0aca c7000e        	ld	__ds,a
3486  0acd 725f000f      	clr	__dsCount
3488  0ad1 35ff0010      	mov	__dsPrev,#255
3489  0ad5 81            	ret	
3572                     ; 810 void	disp_status_valveinfo(uint8_t key, uint8_t next, uint8_t prev)
3572                     ; 811 {
3573                     	switch	.text
3574  0ad6               _disp_status_valveinfo:
3576  0ad6 89            	pushw	x
3577  0ad7 520c          	subw	sp,#12
3578       0000000c      OFST:	set	12
3581                     ; 814 	if( uiInfoSet.controlMode==1 )
3583  0ad9 c6006b        	ld	a,_uiInfoSet+6
3584  0adc 4a            	dec	a
3585  0add 260d          	jrne	L5401
3586                     ; 816 		disp_status_valveinfo_sub(key, next, prev);
3588  0adf 7b11          	ld	a,(OFST+5,sp)
3589  0ae1 88            	push	a
3590  0ae2 7b0e          	ld	a,(OFST+2,sp)
3591  0ae4 95            	ld	xh,a
3592  0ae5 cd0942        	call	_disp_status_valveinfo_sub
3594  0ae8 84            	pop	a
3595                     ; 817 		return;
3597  0ae9 cc0c77        	jra	L5311
3598  0aec               L5401:
3599                     ; 819 	if( _dsCount == 0 )
3601  0aec c6000f        	ld	a,__dsCount
3602  0aef 2665          	jrne	L7401
3603                     ; 821 		if( uiInfoSet.valve == 0 )
3605  0af1 725d006c      	tnz	_uiInfoSet+7
3606  0af5 260b          	jrne	L1501
3607                     ; 823 			uiInfoSet.cnt = 0;
3609  0af7 c70067        	ld	_uiInfoSet+2,a
3610                     ; 824 			uiInfoSet.lpmType = 0;
3612  0afa c70072        	ld	_uiInfoSet+13,a
3613                     ; 825 			STATUS_NEXT(next);	
3615  0afd 7b0e          	ld	a,(OFST+2,sp)
3616  0aff cd0c80        	call	LC017
3618  0b02               L1501:
3619                     ; 827 		disp_next();
3621  0b02 cd04a0        	call	_disp_next
3623                     ; 828 		lcd_disp_n(0, UI_RID+1);
3625  0b05 c60096        	ld	a,_uiInfoSet+49
3626  0b08 4c            	inc	a
3627  0b09 97            	ld	xl,a
3628  0b0a 4f            	clr	a
3629  0b0b 95            	ld	xh,a
3630  0b0c cd0000        	call	_lcd_disp_n
3632                     ; 829 		lcd_blink_npos(UI_RID+1);
3634  0b0f c60096        	ld	a,_uiInfoSet+49
3635  0b12 4c            	inc	a
3636  0b13 cd0000        	call	_lcd_blink_npos
3638                     ; 830 		_ui_ = uiInfoSet.valve_rc[UI_RID];
3640  0b16 cd0c7a        	call	LC016
3641  0b19 d6007c        	ld	a,(_uiInfoSet+23,x)
3642  0b1c c70011        	ld	__ui_,a
3643                     ; 831 		lcd_disp_rid(_ui_, 1, 0);
3645  0b1f 4b00          	push	#0
3646  0b21 ae0001        	ldw	x,#1
3647  0b24 95            	ld	xh,a
3648  0b25 cd0000        	call	_lcd_disp_rid
3650  0b28 84            	pop	a
3651                     ; 832 		for( i=0; i<8; i++ )
3653  0b29 4f            	clr	a
3654  0b2a 6b0c          	ld	(OFST+0,sp),a
3655  0b2c               L3501:
3656                     ; 834 			if( i >= uiInfoSet.valve )
3658  0b2c c1006c        	cp	a,_uiInfoSet+7
3659  0b2f 5f            	clrw	x
3660  0b30 97            	ld	xl,a
3661  0b31 250c          	jrult	L1601
3662                     ; 836 				uiInfoSet.valve_len[i] = 0;
3664  0b33 724f0074      	clr	(_uiInfoSet+15,x)
3665                     ; 837 				uiInfoSet.valve_rc[i] = 0;
3667  0b37 5f            	clrw	x
3668  0b38 97            	ld	xl,a
3669  0b39 724f007c      	clr	(_uiInfoSet+23,x)
3671  0b3d 200d          	jra	L3601
3672  0b3f               L1601:
3673                     ; 841 				if( uiInfoSet.valve_rc[i] == 0 )
3675  0b3f 724d007c      	tnz	(_uiInfoSet+23,x)
3676  0b43 2607          	jrne	L3601
3677                     ; 842 					uiInfoSet.valve_rc[i] = 1;
3679  0b45 5f            	clrw	x
3680  0b46 97            	ld	xl,a
3681  0b47 a601          	ld	a,#1
3682  0b49 d7007c        	ld	(_uiInfoSet+23,x),a
3683  0b4c               L3601:
3684                     ; 832 		for( i=0; i<8; i++ )
3686  0b4c 0c0c          	inc	(OFST+0,sp)
3689  0b4e 7b0c          	ld	a,(OFST+0,sp)
3690  0b50 a108          	cp	a,#8
3691  0b52 25d8          	jrult	L3501
3693  0b54 206d          	jra	L7601
3694  0b56               L7401:
3695                     ; 848 		i = uiInfoSet.valve_len[UI_RID];
3697  0b56 cd0c7a        	call	LC016
3698  0b59 d60074        	ld	a,(_uiInfoSet+15,x)
3699  0b5c 6b0c          	ld	(OFST+0,sp),a
3700                     ; 849 		if( uiInfo.enc != 0 )
3702  0b5e c60000        	ld	a,_uiInfo
3703  0b61 2724          	jreq	L1701
3704                     ; 851 			if( (uiInfo.enc & 0x40) == 0 )	i--;
3706  0b63 a540          	bcp	a,#64
3707  0b65 2604          	jrne	L3701
3710  0b67 0a0c          	dec	(OFST+0,sp)
3712  0b69 2002          	jra	L5701
3713  0b6b               L3701:
3714                     ; 853 				i++;
3716  0b6b 0c0c          	inc	(OFST+0,sp)
3717  0b6d               L5701:
3718                     ; 854 			if( i > 150 )	i = 35;
3720  0b6d 7b0c          	ld	a,(OFST+0,sp)
3721  0b6f a197          	cp	a,#151
3722  0b71 2504          	jrult	L7701
3725  0b73 a623          	ld	a,#35
3726  0b75 6b0c          	ld	(OFST+0,sp),a
3727  0b77               L7701:
3728                     ; 855 			if( i < 35 )	i = 150;
3730  0b77 a123          	cp	a,#35
3731  0b79 2404          	jruge	L1011
3734  0b7b a696          	ld	a,#150
3735  0b7d 6b0c          	ld	(OFST+0,sp),a
3736  0b7f               L1011:
3737                     ; 856 			uiInfoSet.valve_len[UI_RID] = i;
3739  0b7f cd0c7a        	call	LC016
3740  0b82 7b0c          	ld	a,(OFST+0,sp)
3741  0b84 d70074        	ld	(_uiInfoSet+15,x),a
3742  0b87               L1701:
3743                     ; 858 		if( _dsPrev != i )
3745  0b87 c60010        	ld	a,__dsPrev
3746  0b8a 110c          	cp	a,(OFST+0,sp)
3747  0b8c 2735          	jreq	L7601
3748                     ; 860 			_dsPrev = i;
3750  0b8e 7b0c          	ld	a,(OFST+0,sp)
3751  0b90 c70010        	ld	__dsPrev,a
3752                     ; 861 			UI_DISP_3Digit(i);
3754  0b93 5f            	clrw	x
3755  0b94 97            	ld	xl,a
3756  0b95 a664          	ld	a,#100
3757  0b97 62            	div	x,a
3758  0b98 a601          	ld	a,#1
3759  0b9a 95            	ld	xh,a
3760  0b9b cd0000        	call	_lcd_disp_n
3764  0b9e 7b0c          	ld	a,(OFST+0,sp)
3765  0ba0 5f            	clrw	x
3766  0ba1 97            	ld	xl,a
3767  0ba2 a664          	ld	a,#100
3768  0ba4 62            	div	x,a
3769  0ba5 5f            	clrw	x
3770  0ba6 97            	ld	xl,a
3771  0ba7 01            	rrwa	x,a
3772  0ba8 6b0c          	ld	(OFST+0,sp),a
3775  0baa 5f            	clrw	x
3776  0bab 97            	ld	xl,a
3777  0bac a60a          	ld	a,#10
3778  0bae 62            	div	x,a
3779  0baf a602          	ld	a,#2
3780  0bb1 95            	ld	xh,a
3781  0bb2 cd0000        	call	_lcd_disp_n
3785  0bb5 7b0c          	ld	a,(OFST+0,sp)
3786  0bb7 5f            	clrw	x
3787  0bb8 97            	ld	xl,a
3788  0bb9 a60a          	ld	a,#10
3789  0bbb 62            	div	x,a
3790  0bbc 97            	ld	xl,a
3791  0bbd a603          	ld	a,#3
3792  0bbf 95            	ld	xh,a
3793  0bc0 cd0000        	call	_lcd_disp_n
3796  0bc3               L7601:
3797                     ; 864 	if( key == 3 )		
3799  0bc3 7b0d          	ld	a,(OFST+1,sp)
3800  0bc5 a103          	cp	a,#3
3801  0bc7 266a          	jrne	L5011
3802                     ; 866 		lcd_blink_npos_clear();
3804  0bc9 cd0000        	call	_lcd_blink_npos_clear
3806                     ; 867 		STATUS_NEXT(next);	
3808  0bcc 7b0e          	ld	a,(OFST+2,sp)
3809  0bce cd0c80        	call	LC017
3810                     ; 868 		for( i=0; i<8; i++ )
3813  0bd1 0f0c          	clr	(OFST+0,sp)
3814  0bd3               L7011:
3815                     ; 869 			b[i] = 0;
3817  0bd3 96            	ldw	x,sp
3818  0bd4 1c0004        	addw	x,#OFST-8
3819  0bd7 9f            	ld	a,xl
3820  0bd8 5e            	swapw	x
3821  0bd9 1b0c          	add	a,(OFST+0,sp)
3822  0bdb 2401          	jrnc	L636
3823  0bdd 5c            	incw	x
3824  0bde               L636:
3825  0bde 02            	rlwa	x,a
3826  0bdf 7f            	clr	(x)
3827                     ; 868 		for( i=0; i<8; i++ )
3829  0be0 0c0c          	inc	(OFST+0,sp)
3832  0be2 7b0c          	ld	a,(OFST+0,sp)
3833  0be4 a108          	cp	a,#8
3834  0be6 25eb          	jrult	L7011
3835                     ; 870 		for( i=0; i<8; i++ )
3837  0be8 4f            	clr	a
3838  0be9 6b0c          	ld	(OFST+0,sp),a
3839  0beb               L5111:
3840                     ; 872 			if( uiInfoSet.valve_rc[i] != 0 )
3842  0beb 5f            	clrw	x
3843  0bec 97            	ld	xl,a
3844  0bed 724d007c      	tnz	(_uiInfoSet+23,x)
3845  0bf1 2714          	jreq	L3211
3846                     ; 873 				b[uiInfoSet.valve_rc[i]-1] = 1;
3848  0bf3 96            	ldw	x,sp
3849  0bf4 1c0004        	addw	x,#OFST-8
3850  0bf7 1f01          	ldw	(OFST-11,sp),x
3851  0bf9 5f            	clrw	x
3852  0bfa 97            	ld	xl,a
3853  0bfb d6007c        	ld	a,(_uiInfoSet+23,x)
3854  0bfe 5f            	clrw	x
3855  0bff 97            	ld	xl,a
3856  0c00 5a            	decw	x
3857  0c01 72fb01        	addw	x,(OFST-11,sp)
3858  0c04 a601          	ld	a,#1
3859  0c06 f7            	ld	(x),a
3860  0c07               L3211:
3861                     ; 870 		for( i=0; i<8; i++ )
3863  0c07 0c0c          	inc	(OFST+0,sp)
3866  0c09 7b0c          	ld	a,(OFST+0,sp)
3867  0c0b a108          	cp	a,#8
3868  0c0d 25dc          	jrult	L5111
3869                     ; 875 		j = 0;
3871  0c0f 0f03          	clr	(OFST-9,sp)
3872                     ; 876 		for( i=0; i<8; i++ )
3874  0c11 0f0c          	clr	(OFST+0,sp)
3875  0c13               L5211:
3876                     ; 878 			if( b[i] != 0 )
3878  0c13 96            	ldw	x,sp
3879  0c14 1c0004        	addw	x,#OFST-8
3880  0c17 9f            	ld	a,xl
3881  0c18 5e            	swapw	x
3882  0c19 1b0c          	add	a,(OFST+0,sp)
3883  0c1b 2401          	jrnc	L046
3884  0c1d 5c            	incw	x
3885  0c1e               L046:
3886  0c1e 02            	rlwa	x,a
3887  0c1f f6            	ld	a,(x)
3888  0c20 2702          	jreq	L3311
3889                     ; 879 				j++;
3891  0c22 0c03          	inc	(OFST-9,sp)
3892  0c24               L3311:
3893                     ; 876 		for( i=0; i<8; i++ )
3895  0c24 0c0c          	inc	(OFST+0,sp)
3898  0c26 7b0c          	ld	a,(OFST+0,sp)
3899  0c28 a108          	cp	a,#8
3900  0c2a 25e7          	jrult	L5211
3901                     ; 881 		uiInfoSet.cnt = j;
3903  0c2c 7b03          	ld	a,(OFST-9,sp)
3904  0c2e c70067        	ld	_uiInfoSet+2,a
3906  0c31 2044          	jra	L5311
3907  0c33               L5011:
3908                     ; 883 	else if( key == 4 )
3910  0c33 a104          	cp	a,#4
3911  0c35 2626          	jrne	L7311
3912                     ; 885 		uiInfoSet.valve_rc[UI_RID]++;
3914  0c37 ad41          	call	LC016
3915  0c39 724c007c      	inc	(_uiInfoSet+23,x)
3916                     ; 886 		if( uiInfoSet.valve+1 == uiInfoSet.valve_rc[UI_RID] )
3918  0c3d 5f            	clrw	x
3919  0c3e 97            	ld	xl,a
3920  0c3f d6007c        	ld	a,(_uiInfoSet+23,x)
3921  0c42 5f            	clrw	x
3922  0c43 97            	ld	xl,a
3923  0c44 c6006c        	ld	a,_uiInfoSet+7
3924  0c47 905f          	clrw	y
3925  0c49 9097          	ld	yl,a
3926  0c4b bf00          	ldw	c_x,x
3927  0c4d 905c          	incw	y
3928  0c4f 90b300        	cpw	y,c_x
3929  0c52 261f          	jrne	L7411
3930                     ; 887 			uiInfoSet.valve_rc[UI_RID] = 1;
3932  0c54 ad24          	call	LC016
3933  0c56 a601          	ld	a,#1
3934  0c58 d7007c        	ld	(_uiInfoSet+23,x),a
3935                     ; 888 		STATUS_NEXT(prev);
3940  0c5b 2016          	jp	L7411
3941  0c5d               L7311:
3942                     ; 890 	else if( key == 1 )
3944  0c5d 4a            	dec	a
3945  0c5e 2617          	jrne	L5311
3946                     ; 892 		lcd_blink_npos_clear();
3948  0c60 cd0000        	call	_lcd_blink_npos_clear
3950                     ; 893 		UI_RID++;
3952  0c63 725c0096      	inc	_uiInfoSet+49
3953                     ; 894 		if( UI_RID == uiInfoSet.valve )
3955  0c67 c60096        	ld	a,_uiInfoSet+49
3956  0c6a c1006c        	cp	a,_uiInfoSet+7
3957  0c6d 2604          	jrne	L7411
3958                     ; 895 			UI_RID = 0;
3960  0c6f 725f0096      	clr	_uiInfoSet+49
3961  0c73               L7411:
3962                     ; 896 		STATUS_NEXT(prev);
3969  0c73 7b11          	ld	a,(OFST+5,sp)
3970  0c75 ad09          	call	LC017
3972  0c77               L5311:
3973                     ; 898 }
3976  0c77 5b0e          	addw	sp,#14
3977  0c79 81            	ret	
3978  0c7a               LC016:
3979  0c7a c60096        	ld	a,_uiInfoSet+49
3980  0c7d 5f            	clrw	x
3981  0c7e 97            	ld	xl,a
3982  0c7f 81            	ret	
3983  0c80               LC017:
3984  0c80 c7000e        	ld	__ds,a
3986  0c83 725f000f      	clr	__dsCount
3988  0c87 35ff0010      	mov	__dsPrev,#255
3989  0c8b 81            	ret	
4043                     ; 900 void	disp_status_plc(uint8_t key, uint8_t next)
4043                     ; 901 {
4044                     	switch	.text
4045  0c8c               _disp_status_plc:
4047  0c8c 89            	pushw	x
4048  0c8d 88            	push	a
4049       00000001      OFST:	set	1
4052                     ; 928 	if( _dsCount == 0 )
4054  0c8e c6000f        	ld	a,__dsCount
4055  0c91 260b          	jrne	L1711
4056                     ; 930 		disp_next();
4058  0c93 cd04a0        	call	_disp_next
4060                     ; 931 		lcd_disp_plc();
4062  0c96 cd0000        	call	_lcd_disp_plc
4064                     ; 932 		lcd_disp_n(3, uiInfoSet.plc);
4066  0c99 c6009a        	ld	a,_uiInfoSet+53
4069  0c9c 2039          	jp	LC018
4070  0c9e               L1711:
4071                     ; 936 		i = uiInfoSet.plc;
4073  0c9e c6009a        	ld	a,_uiInfoSet+53
4074  0ca1 6b01          	ld	(OFST+0,sp),a
4075                     ; 937 		if( uiInfo.enc != 0 )
4077  0ca3 c60000        	ld	a,_uiInfo
4078  0ca6 2723          	jreq	L5711
4079                     ; 939 			if( (uiInfo.enc & 0x40) == 0 )
4081  0ca8 a540          	bcp	a,#64
4082  0caa 260e          	jrne	L7711
4083                     ; 941 				if( i != 0 )
4085  0cac 7b01          	ld	a,(OFST+0,sp)
4086  0cae 2704          	jreq	L1021
4087                     ; 942 					i--;
4089  0cb0 0a01          	dec	(OFST+0,sp)
4091  0cb2 2012          	jra	L5021
4092  0cb4               L1021:
4093                     ; 944 					i = 8;
4095  0cb4 a608          	ld	a,#8
4096  0cb6 6b01          	ld	(OFST+0,sp),a
4097  0cb8 200c          	jra	L5021
4098  0cba               L7711:
4099                     ; 948 				if( i != 8 )
4101  0cba 7b01          	ld	a,(OFST+0,sp)
4102  0cbc a108          	cp	a,#8
4103  0cbe 2704          	jreq	L7021
4104                     ; 949 					i++;
4106  0cc0 0c01          	inc	(OFST+0,sp)
4108  0cc2 2002          	jra	L5021
4109  0cc4               L7021:
4110                     ; 951 					i = 0;
4112  0cc4 0f01          	clr	(OFST+0,sp)
4113  0cc6               L5021:
4114                     ; 953 			uiInfoSet.plc = i;
4116  0cc6 7b01          	ld	a,(OFST+0,sp)
4117  0cc8 c7009a        	ld	_uiInfoSet+53,a
4118  0ccb               L5711:
4119                     ; 955 		if( _dsPrev != i )
4121  0ccb c60010        	ld	a,__dsPrev
4122  0cce 1101          	cp	a,(OFST+0,sp)
4123  0cd0 270c          	jreq	L3711
4124                     ; 957 			_dsPrev = i;
4126  0cd2 7b01          	ld	a,(OFST+0,sp)
4127  0cd4 c70010        	ld	__dsPrev,a
4128                     ; 958 			lcd_disp_n(3, i);
4130  0cd7               LC018:
4131  0cd7 97            	ld	xl,a
4132  0cd8 a603          	ld	a,#3
4133  0cda 95            	ld	xh,a
4134  0cdb cd0000        	call	_lcd_disp_n
4136  0cde               L3711:
4137                     ; 961 	if( key == 3 )		
4139  0cde 7b02          	ld	a,(OFST+1,sp)
4140  0ce0 a103          	cp	a,#3
4141  0ce2 260d          	jrne	L5121
4142                     ; 963 		STATUS_NEXT(next);	
4144  0ce4 7b03          	ld	a,(OFST+2,sp)
4145  0ce6 c7000e        	ld	__ds,a
4148  0ce9 725f000f      	clr	__dsCount
4151  0ced 35ff0010      	mov	__dsPrev,#255
4153  0cf1               L5121:
4154                     ; 965 }
4157  0cf1 5b03          	addw	sp,#3
4158  0cf3 81            	ret	
4161                     	switch	.data
4162  0012               ___func_rc_timerout:
4163  0012 00            	dc.b	0
4164  0013               ___func_rc_timerout1:
4165  0013 00            	dc.b	0
4166  0014               ___func_rc_timerout2:
4167  0014 00            	dc.b	0
4225                     ; 974 uint8_t	disp_status_run(uint8_t key, uint8_t next, uint8_t prev)
4225                     ; 975 {
4226                     	switch	.text
4227  0cf4               _disp_status_run:
4229  0cf4 89            	pushw	x
4230       00000000      OFST:	set	0
4233                     ; 977 	if( _dsCount == 0 )
4235  0cf5 c6000f        	ld	a,__dsCount
4236  0cf8 2606          	jrne	L7321
4237                     ; 979 		disp_next();
4239  0cfa cd04a0        	call	_disp_next
4241                     ; 980 		lcd_disp_setup_run();
4243  0cfd cd0000        	call	_lcd_disp_setup_run
4245  0d00               L7321:
4246                     ; 982 	if( key == 3 )	
4248  0d00 7b01          	ld	a,(OFST+1,sp)
4249  0d02 a103          	cp	a,#3
4250  0d04 2703cc0efb    	jrne	L1421
4251                     ; 984 		copy_infoSet();
4253  0d09 cd1714        	call	_copy_infoSet
4255                     ; 985 		FW_MODE(uiInfo.mode);
4257  0d0c c60008        	ld	a,_uiInfo+8
4258  0d0f 97            	ld	xl,a
4259  0d10 a609          	ld	a,#9
4260  0d12 95            	ld	xh,a
4261  0d13 cd0000        	call	_file_write
4263                     ; 986 		FW_ID(uiInfo.id);
4265  0d16 c60004        	ld	a,_uiInfo+4
4266  0d19 97            	ld	xl,a
4267  0d1a a60a          	ld	a,#10
4268  0d1c 95            	ld	xh,a
4269  0d1d cd0000        	call	_file_write
4271                     ; 987 		FW_TOFFSET(uiInfo.tOffset);
4273  0d20 c60011        	ld	a,_uiInfo+17
4274  0d23 97            	ld	xl,a
4275  0d24 a614          	ld	a,#20
4276  0d26 95            	ld	xh,a
4277  0d27 cd0000        	call	_file_write
4279                     ; 988 		if( uiInfo.mode == 1 )
4281  0d2a c60008        	ld	a,_uiInfo+8
4282  0d2d 4a            	dec	a
4283  0d2e 2703cc0eea    	jrne	L3421
4284                     ; 990 			func_rc_setting();
4286  0d33 cd0000        	call	_func_rc_setting
4288                     ; 991 			__func_rc_timerout = 6;
4290  0d36 35060012      	mov	___func_rc_timerout,#6
4291                     ; 992 			FW_CNTLMODE(uiInfo.cntlMode);
4293  0d3a c60003        	ld	a,_uiInfo+3
4294  0d3d 97            	ld	xl,a
4295  0d3e a608          	ld	a,#8
4296  0d40 95            	ld	xh,a
4297  0d41 cd0000        	call	_file_write
4299                     ; 993 			FW_VALVE(uiInfo.valve);
4301  0d44 c6000a        	ld	a,_uiInfo+10
4302  0d47 97            	ld	xl,a
4303  0d48 a60e          	ld	a,#14
4304  0d4a 95            	ld	xh,a
4305  0d4b cd0000        	call	_file_write
4307                     ; 994 			FW_VALVE_SUB(uiInfo.valve_sub);
4309  0d4e c6000b        	ld	a,_uiInfo+11
4310  0d51 97            	ld	xl,a
4311  0d52 a62c          	ld	a,#44
4312  0d54 95            	ld	xh,a
4313  0d55 cd0000        	call	_file_write
4315                     ; 995 			FW_CNT(uiInfo.cnt);
4317  0d58 c60005        	ld	a,_uiInfo+5
4318  0d5b 97            	ld	xl,a
4319  0d5c a60b          	ld	a,#11
4320  0d5e 95            	ld	xh,a
4321  0d5f cd0000        	call	_file_write
4323                     ; 996 			FW_CNT_SUB(uiInfo.cnt_sub);
4325  0d62 c60006        	ld	a,_uiInfo+6
4326  0d65 97            	ld	xl,a
4327  0d66 a62b          	ld	a,#43
4328  0d68 95            	ld	xh,a
4329  0d69 cd0000        	call	_file_write
4331                     ; 997 			FW_CNT_MODE(uiInfo.controlMode);
4333  0d6c c60009        	ld	a,_uiInfo+9
4334  0d6f 97            	ld	xl,a
4335  0d70 a60d          	ld	a,#13
4336  0d72 95            	ld	xh,a
4337  0d73 cd0000        	call	_file_write
4339                     ; 998 			FW_OPMODE(uiInfo.opMode);
4341  0d76 c60007        	ld	a,_uiInfo+7
4342  0d79 97            	ld	xl,a
4343  0d7a a60c          	ld	a,#12
4344  0d7c 95            	ld	xh,a
4345  0d7d cd0000        	call	_file_write
4347                     ; 999 			FW_POTYPE(uiInfo.poType);
4349  0d80 c6000f        	ld	a,_uiInfo+15
4350  0d83 97            	ld	xl,a
4351  0d84 a612          	ld	a,#18
4352  0d86 95            	ld	xh,a
4353  0d87 cd0000        	call	_file_write
4355                     ; 1000 			FW_HOUSECAPA(uiInfo.houseCapa);
4357  0d8a c60010        	ld	a,_uiInfo+16
4358  0d8d 97            	ld	xl,a
4359  0d8e a613          	ld	a,#19
4360  0d90 95            	ld	xh,a
4361  0d91 cd0000        	call	_file_write
4363                     ; 1001 			FW_LPM(uiInfo.lpmType);
4365  0d94 c60013        	ld	a,_uiInfo+19
4366  0d97 97            	ld	xl,a
4367  0d98 a628          	ld	a,#40
4368  0d9a 95            	ld	xh,a
4369  0d9b cd0000        	call	_file_write
4371                     ; 1002 			FW_TEMPOFFSET(uiInfo.tempOffset);
4373  0d9e c60012        	ld	a,_uiInfo+18
4374  0da1 97            	ld	xl,a
4375  0da2 a627          	ld	a,#39
4376  0da4 95            	ld	xh,a
4377  0da5 cd0000        	call	_file_write
4379                     ; 1004 			FW_VALVE_INFOS
4381  0da8 c60015        	ld	a,_uiInfo+21
4382  0dab 97            	ld	xl,a
4383  0dac a615          	ld	a,#21
4384  0dae 95            	ld	xh,a
4385  0daf cd0000        	call	_file_write
4389  0db2 c60016        	ld	a,_uiInfo+22
4390  0db5 97            	ld	xl,a
4391  0db6 a616          	ld	a,#22
4392  0db8 95            	ld	xh,a
4393  0db9 cd0000        	call	_file_write
4397  0dbc c60017        	ld	a,_uiInfo+23
4398  0dbf 97            	ld	xl,a
4399  0dc0 a617          	ld	a,#23
4400  0dc2 95            	ld	xh,a
4401  0dc3 cd0000        	call	_file_write
4405  0dc6 c60018        	ld	a,_uiInfo+24
4406  0dc9 97            	ld	xl,a
4407  0dca a618          	ld	a,#24
4408  0dcc 95            	ld	xh,a
4409  0dcd cd0000        	call	_file_write
4413  0dd0 c60019        	ld	a,_uiInfo+25
4414  0dd3 97            	ld	xl,a
4415  0dd4 a619          	ld	a,#25
4416  0dd6 95            	ld	xh,a
4417  0dd7 cd0000        	call	_file_write
4421  0dda c6001a        	ld	a,_uiInfo+26
4422  0ddd 97            	ld	xl,a
4423  0dde a61a          	ld	a,#26
4424  0de0 95            	ld	xh,a
4425  0de1 cd0000        	call	_file_write
4429  0de4 c6001b        	ld	a,_uiInfo+27
4430  0de7 97            	ld	xl,a
4431  0de8 a61b          	ld	a,#27
4432  0dea 95            	ld	xh,a
4433  0deb cd0000        	call	_file_write
4437  0dee c6001c        	ld	a,_uiInfo+28
4438  0df1 97            	ld	xl,a
4439  0df2 a61c          	ld	a,#28
4440  0df4 95            	ld	xh,a
4441  0df5 cd0000        	call	_file_write
4445  0df8 c60025        	ld	a,_uiInfo+37
4446  0dfb 97            	ld	xl,a
4447  0dfc a62e          	ld	a,#46
4448  0dfe 95            	ld	xh,a
4449  0dff cd0000        	call	_file_write
4453  0e02 c60026        	ld	a,_uiInfo+38
4454  0e05 97            	ld	xl,a
4455  0e06 a62f          	ld	a,#47
4456  0e08 95            	ld	xh,a
4457  0e09 cd0000        	call	_file_write
4461  0e0c c60027        	ld	a,_uiInfo+39
4462  0e0f 97            	ld	xl,a
4463  0e10 a630          	ld	a,#48
4464  0e12 95            	ld	xh,a
4465  0e13 cd0000        	call	_file_write
4469  0e16 c60028        	ld	a,_uiInfo+40
4470  0e19 97            	ld	xl,a
4471  0e1a a631          	ld	a,#49
4472  0e1c 95            	ld	xh,a
4473  0e1d cd0000        	call	_file_write
4477  0e20 c60029        	ld	a,_uiInfo+41
4478  0e23 97            	ld	xl,a
4479  0e24 a632          	ld	a,#50
4480  0e26 95            	ld	xh,a
4481  0e27 cd0000        	call	_file_write
4485  0e2a c6002a        	ld	a,_uiInfo+42
4486  0e2d 97            	ld	xl,a
4487  0e2e a633          	ld	a,#51
4488  0e30 95            	ld	xh,a
4489  0e31 cd0000        	call	_file_write
4493  0e34 c6002b        	ld	a,_uiInfo+43
4494  0e37 97            	ld	xl,a
4495  0e38 a634          	ld	a,#52
4496  0e3a 95            	ld	xh,a
4497  0e3b cd0000        	call	_file_write
4501  0e3e c6002c        	ld	a,_uiInfo+44
4502  0e41 97            	ld	xl,a
4503  0e42 a635          	ld	a,#53
4504  0e44 95            	ld	xh,a
4505  0e45 cd0000        	call	_file_write
4507                     ; 1005 			FW_VALVE_RCINFOS
4509  0e48 c6001d        	ld	a,_uiInfo+29
4510  0e4b 97            	ld	xl,a
4511  0e4c a61d          	ld	a,#29
4512  0e4e 95            	ld	xh,a
4513  0e4f cd0000        	call	_file_write
4517  0e52 c6001e        	ld	a,_uiInfo+30
4518  0e55 97            	ld	xl,a
4519  0e56 a61e          	ld	a,#30
4520  0e58 95            	ld	xh,a
4521  0e59 cd0000        	call	_file_write
4525  0e5c c6001f        	ld	a,_uiInfo+31
4526  0e5f 97            	ld	xl,a
4527  0e60 a61f          	ld	a,#31
4528  0e62 95            	ld	xh,a
4529  0e63 cd0000        	call	_file_write
4533  0e66 c60020        	ld	a,_uiInfo+32
4534  0e69 97            	ld	xl,a
4535  0e6a a620          	ld	a,#32
4536  0e6c 95            	ld	xh,a
4537  0e6d cd0000        	call	_file_write
4541  0e70 c60021        	ld	a,_uiInfo+33
4542  0e73 97            	ld	xl,a
4543  0e74 a621          	ld	a,#33
4544  0e76 95            	ld	xh,a
4545  0e77 cd0000        	call	_file_write
4549  0e7a c60022        	ld	a,_uiInfo+34
4550  0e7d 97            	ld	xl,a
4551  0e7e a622          	ld	a,#34
4552  0e80 95            	ld	xh,a
4553  0e81 cd0000        	call	_file_write
4557  0e84 c60023        	ld	a,_uiInfo+35
4558  0e87 97            	ld	xl,a
4559  0e88 a623          	ld	a,#35
4560  0e8a 95            	ld	xh,a
4561  0e8b cd0000        	call	_file_write
4565  0e8e c60024        	ld	a,_uiInfo+36
4566  0e91 97            	ld	xl,a
4567  0e92 a624          	ld	a,#36
4568  0e94 95            	ld	xh,a
4569  0e95 cd0000        	call	_file_write
4573  0e98 c6002d        	ld	a,_uiInfo+45
4574  0e9b 97            	ld	xl,a
4575  0e9c a636          	ld	a,#54
4576  0e9e 95            	ld	xh,a
4577  0e9f cd0000        	call	_file_write
4581  0ea2 c6002e        	ld	a,_uiInfo+46
4582  0ea5 97            	ld	xl,a
4583  0ea6 a637          	ld	a,#55
4584  0ea8 95            	ld	xh,a
4585  0ea9 cd0000        	call	_file_write
4589  0eac c6002f        	ld	a,_uiInfo+47
4590  0eaf 97            	ld	xl,a
4591  0eb0 a638          	ld	a,#56
4592  0eb2 95            	ld	xh,a
4593  0eb3 cd0000        	call	_file_write
4597  0eb6 c60030        	ld	a,_uiInfo+48
4598  0eb9 97            	ld	xl,a
4599  0eba a639          	ld	a,#57
4600  0ebc 95            	ld	xh,a
4601  0ebd cd0000        	call	_file_write
4605  0ec0 c60031        	ld	a,_uiInfo+49
4606  0ec3 97            	ld	xl,a
4607  0ec4 a63a          	ld	a,#58
4608  0ec6 95            	ld	xh,a
4609  0ec7 cd0000        	call	_file_write
4613  0eca c60032        	ld	a,_uiInfo+50
4614  0ecd 97            	ld	xl,a
4615  0ece a63b          	ld	a,#59
4616  0ed0 95            	ld	xh,a
4617  0ed1 cd0000        	call	_file_write
4621  0ed4 c60033        	ld	a,_uiInfo+51
4622  0ed7 97            	ld	xl,a
4623  0ed8 a63c          	ld	a,#60
4624  0eda 95            	ld	xh,a
4625  0edb cd0000        	call	_file_write
4629  0ede c60034        	ld	a,_uiInfo+52
4630  0ee1 97            	ld	xl,a
4631  0ee2 a63d          	ld	a,#61
4632  0ee4 95            	ld	xh,a
4633  0ee5 cd0000        	call	_file_write
4636  0ee8 2004          	jra	L5421
4637  0eea               L3421:
4638                     ; 1009 			__func_rc_timerout = 4;
4640  0eea 35040012      	mov	___func_rc_timerout,#4
4641  0eee               L5421:
4642                     ; 1012 		__func_rc_timerout1 = 0;
4644  0eee 725f0013      	clr	___func_rc_timerout1
4645                     ; 1013 		__func_rc_timerout2 = __timer1s;
4647  0ef2 5500000014    	mov	___func_rc_timerout2,___timer1s
4648                     ; 1014 		STATUS_NEXT(next);	
4650  0ef7 7b02          	ld	a,(OFST+2,sp)
4655  0ef9 2012          	jp	LC019
4656  0efb               L1421:
4657                     ; 1016 	else if( key == 2 )
4659  0efb a102          	cp	a,#2
4660  0efd 2608          	jrne	L1521
4661                     ; 1018 		_backup_backlight = 0;
4663  0eff 725f0009      	clr	__backup_backlight
4664                     ; 1020 		return 1;
4666  0f03 a601          	ld	a,#1
4668  0f05 2012          	jra	L6201
4669  0f07               L1521:
4670                     ; 1022 	else if( key == 4 )
4672  0f07 a104          	cp	a,#4
4673  0f09 260d          	jrne	L7421
4674                     ; 1024 		STATUS_NEXT(prev);
4676  0f0b 7b05          	ld	a,(OFST+5,sp)
4681  0f0d               LC019:
4682  0f0d c7000e        	ld	__ds,a
4684  0f10 725f000f      	clr	__dsCount
4686  0f14 35ff0010      	mov	__dsPrev,#255
4688  0f18               L7421:
4689                     ; 1026 	return 0;
4691  0f18 4f            	clr	a
4693  0f19               L6201:
4695  0f19 85            	popw	x
4696  0f1a 81            	ret	
4756                     ; 1029 void	disp_status_exit(uint8_t key, uint8_t next)
4756                     ; 1030 {
4757                     	switch	.text
4758  0f1b               _disp_status_exit:
4760  0f1b 89            	pushw	x
4761       00000001      OFST:	set	1
4764                     ; 1033 	_backup_backlight = 0;
4766  0f1c 725f0009      	clr	__backup_backlight
4767  0f20 88            	push	a
4768                     ; 1034 	if( (_t20ms%10) != 0 )
4770  0f21 c60000        	ld	a,__t20ms
4771  0f24 5f            	clrw	x
4772  0f25 97            	ld	xl,a
4773  0f26 a60a          	ld	a,#10
4774  0f28 cd0000        	call	c_smodx
4776  0f2b 5d            	tnzw	x
4777  0f2c 2706          	jreq	L7721
4778                     ; 1036 		_dsPrev = 0;
4780  0f2e 725f0010      	clr	__dsPrev
4781                     ; 1037 		return;
4783  0f32 2005          	jra	L6301
4784  0f34               L7721:
4785                     ; 1040 	if( _dsPrev != 0 )
4787  0f34 c60010        	ld	a,__dsPrev
4788  0f37 2703          	jreq	L1031
4789                     ; 1041 		return;
4790  0f39               L6301:
4793  0f39 5b03          	addw	sp,#3
4794  0f3b 81            	ret	
4795  0f3c               L1031:
4796                     ; 1044 	_dsCount++;
4798  0f3c 725c000f      	inc	__dsCount
4799                     ; 1045 	_dsPrev = 1;
4801  0f40 35010010      	mov	__dsPrev,#1
4802                     ; 1046 	lcd_clear(0);
4804  0f44 cd0000        	call	_lcd_clear
4806                     ; 1047 	for( i=0; i<4; i++ )
4808  0f47 0f01          	clr	(OFST+0,sp)
4809  0f49               L3031:
4810                     ; 1048 		lcd_disp_n(i, _dsCount%10);
4812  0f49 c6000f        	ld	a,__dsCount
4813  0f4c 5f            	clrw	x
4814  0f4d 97            	ld	xl,a
4815  0f4e a60a          	ld	a,#10
4816  0f50 62            	div	x,a
4817  0f51 97            	ld	xl,a
4818  0f52 7b01          	ld	a,(OFST+0,sp)
4819  0f54 95            	ld	xh,a
4820  0f55 cd0000        	call	_lcd_disp_n
4822                     ; 1047 	for( i=0; i<4; i++ )
4824  0f58 0c01          	inc	(OFST+0,sp)
4827  0f5a 7b01          	ld	a,(OFST+0,sp)
4828  0f5c a104          	cp	a,#4
4829  0f5e 25e9          	jrult	L3031
4830                     ; 1050 	if( __func_rc_settingCb == 1 && _dsCount >= 10 )
4832  0f60 c60000        	ld	a,___func_rc_settingCb
4833  0f63 4a            	dec	a
4834  0f64 2607          	jrne	L1131
4836  0f66 c6000f        	ld	a,__dsCount
4837  0f69 a10a          	cp	a,#10
4838                     ; 1052 		STATUS_NEXT(next);
4841                     ; 1053 		return;
4844  0f6b 242f          	jruge	L1231
4845  0f6d               L1131:
4846                     ; 1055 	if( __timer1s != __func_rc_timerout2 )
4848  0f6d c60000        	ld	a,___timer1s
4849  0f70 c10014        	cp	a,___func_rc_timerout2
4850  0f73 2736          	jreq	L3131
4851                     ; 1057 		if( __func_rc_timerout1 == 0 )
4853  0f75 c60013        	ld	a,___func_rc_timerout1
4854  0f78 26bf          	jrne	L6301
4855                     ; 1059 			__func_rc_timerout2 = __timer1s;
4857  0f7a 5500000014    	mov	___func_rc_timerout2,___timer1s
4858                     ; 1060 			__func_rc_timerout1 = 1;
4860  0f7f 35010013      	mov	___func_rc_timerout1,#1
4861                     ; 1061 			__func_rc_timerout--;
4863  0f83 725a0012      	dec	___func_rc_timerout
4864                     ; 1062 			if( __func_rc_timerout == 0 )
4866  0f87 26b0          	jrne	L6301
4867                     ; 1064 				if( uiInfo.mode == 1 )
4869  0f89 c60008        	ld	a,_uiInfo+8
4870  0f8c 4a            	dec	a
4871  0f8d 260d          	jrne	L1231
4872                     ; 1068 					ui_error = 19;
4874  0f8f 35130000      	mov	_ui_error,#19
4875                     ; 1069 					_ds = 97;
4877  0f93 3561000e      	mov	__ds,#97
4878                     ; 1070 					_dsCount = 0;
4880  0f97 c7000f        	ld	__dsCount,a
4882  0f9a 209d          	jra	L6301
4883  0f9c               L1231:
4884                     ; 1074 					STATUS_NEXT(next);
4891  0f9c 7b03          	ld	a,(OFST+2,sp)
4892  0f9e c7000e        	ld	__ds,a
4894  0fa1 725f000f      	clr	__dsCount
4896  0fa5 35ff0010      	mov	__dsPrev,#255
4898  0fa9 208e          	jra	L6301
4899  0fab               L3131:
4900                     ; 1080 		__func_rc_timerout1 = 0;
4902  0fab 725f0013      	clr	___func_rc_timerout1
4903                     ; 1081 }
4905  0faf 2088          	jra	L6301
4908                     	switch	.data
4909  0015               __tim1min:
4910  0015 00            	dc.b	0
4911  0016               __tim30min:
4912  0016 00            	dc.b	0
4913  0017               __timFlag:
4914  0017 00            	dc.b	0
4938                     ; 1087 void	timerClear(void)
4938                     ; 1088 {
4939                     	switch	.text
4940  0fb1               _timerClear:
4944                     ; 1089 	_tim1min = 0;
4946  0fb1 725f0015      	clr	__tim1min
4947                     ; 1090 	_tim30min = 0;
4949  0fb5 725f0016      	clr	__tim30min
4950                     ; 1091 	_timFlag = 0;
4952  0fb9 725f0017      	clr	__timFlag
4953                     ; 1092 }
4956  0fbd 81            	ret	
4995                     ; 1094 void	disp_status_loop_message(uint8_t i)
4995                     ; 1095 {
4996                     	switch	.text
4997  0fbe               _disp_status_loop_message:
4999  0fbe 88            	push	a
5000       00000000      OFST:	set	0
5003                     ; 1096 	lcd_clear_btn();
5005  0fbf cd0000        	call	_lcd_clear_btn
5007                     ; 1097 	if( i == 0 )		{	_disp_mode = 0x01;	LCD_BIT_SET(bS6);	/*	(0)난방*/	}
5009  0fc2 7b01          	ld	a,(OFST+1,sp)
5010  0fc4 2611          	jrne	L3531
5013  0fc6 35010000      	mov	__disp_mode,#1
5016  0fca 5f            	clrw	x
5017  0fcb c60011        	ld	a,_iLF_DEF+17
5018  0fce 97            	ld	xl,a
5019  0fcf d6540c        	ld	a,(21516,x)
5020  0fd2 ca0011        	or	a,_bLF_DEF+17
5022  0fd5 2052          	jp	LC021
5023  0fd7               L3531:
5024                     ; 1098 	else if( i == 1 )	{	_disp_mode = 0x08;	LCD_BIT_SET(bS7);	/*	(1)예약*/	}
5026  0fd7 a101          	cp	a,#1
5027  0fd9 2611          	jrne	L7531
5030  0fdb 35080000      	mov	__disp_mode,#8
5033  0fdf 5f            	clrw	x
5034  0fe0 c60021        	ld	a,_iLF_DEF+33
5035  0fe3 97            	ld	xl,a
5036  0fe4 d6540c        	ld	a,(21516,x)
5037  0fe7 ca0021        	or	a,_bLF_DEF+33
5039  0fea 203d          	jp	LC021
5040  0fec               L7531:
5041                     ; 1099 	else if( i == 2 )	{	_disp_mode = 0x10;	LCD_BIT_SET(bS8);	/*	(2)반복*/	}
5043  0fec a102          	cp	a,#2
5044  0fee 2611          	jrne	L3631
5047  0ff0 35100000      	mov	__disp_mode,#16
5050  0ff4 5f            	clrw	x
5051  0ff5 c60031        	ld	a,_iLF_DEF+49
5052  0ff8 97            	ld	xl,a
5053  0ff9 d6540c        	ld	a,(21516,x)
5054  0ffc ca0031        	or	a,_bLF_DEF+49
5056  0fff 2028          	jp	LC021
5057  1001               L3631:
5058                     ; 1100 	else if( i == 8 )	{	_disp_mode = 0x02;	LCD_BIT_SET(bS9);	/*	(1)외출*/	}
5060  1001 a108          	cp	a,#8
5061  1003 2611          	jrne	L7631
5064  1005 35020000      	mov	__disp_mode,#2
5067  1009 5f            	clrw	x
5068  100a c60010        	ld	a,_iLF_DEF+16
5069  100d 97            	ld	xl,a
5070  100e d6540c        	ld	a,(21516,x)
5071  1011 ca0010        	or	a,_bLF_DEF+16
5073  1014 2013          	jp	LC021
5074  1016               L7631:
5075                     ; 1101 	else if( i == 5 )	{	_disp_mode = 0x04;	LCD_BIT_SET(bS10);	/*	(2)정지*/	}
5077  1016 a105          	cp	a,#5
5078  1018 2612          	jrne	L5531
5081  101a 35040000      	mov	__disp_mode,#4
5084  101e 5f            	clrw	x
5085  101f c60020        	ld	a,_iLF_DEF+32
5086  1022 97            	ld	xl,a
5087  1023 d6540c        	ld	a,(21516,x)
5088  1026 ca0020        	or	a,_bLF_DEF+32
5089  1029               LC021:
5090  1029 d7540c        	ld	(21516,x),a
5091  102c               L5531:
5092                     ; 1103 	_disp_mode2 = _disp_mode;
5094  102c 5500000000    	mov	__disp_mode2,__disp_mode
5095                     ; 1104 	timerClear();
5097  1031 cd0fb1        	call	_timerClear
5099                     ; 1105 }
5102  1034 84            	pop	a
5103  1035 81            	ret	
5151                     ; 1108 void	disp_status_loop_init(void)
5151                     ; 1109 {
5152                     	switch	.text
5153  1036               _disp_status_loop_init:
5155  1036 88            	push	a
5156       00000001      OFST:	set	1
5159                     ; 1112 	i = 0;
5161  1037 0f01          	clr	(OFST+0,sp)
5162                     ; 1113 	if (_disp_mode == 0xff) {
5164  1039 c60000        	ld	a,__disp_mode
5165  103c 4c            	inc	a
5166  103d 2603          	jrne	L1141
5167                     ; 1114 		i = 1;
5169  103f 4c            	inc	a
5170  1040 6b01          	ld	(OFST+0,sp),a
5171  1042               L1141:
5172                     ; 1118 	lcd_clear(0);
5174  1042 4f            	clr	a
5175  1043 cd0000        	call	_lcd_clear
5177                     ; 1120 	if ( i == 0) {
5179  1046 7b01          	ld	a,(OFST+0,sp)
5180  1048 2604          	jrne	L3141
5181                     ; 1121 		ui_disp_temp_mark(1);
5183  104a 4c            	inc	a
5184  104b cd0000        	call	_ui_disp_temp_mark
5186  104e               L3141:
5187                     ; 1124 	if (_disp_mode != _disp_mode2) {
5189  104e c60000        	ld	a,__disp_mode
5190  1051 c10000        	cp	a,__disp_mode2
5191  1054 2733          	jreq	L5141
5192                     ; 1125 		if( _disp_mode2 == 0x01 )	__sUp = 0;
5194  1056 c60000        	ld	a,__disp_mode2
5195  1059 a101          	cp	a,#1
5196  105b 2606          	jrne	L7141
5199  105d 725f0001      	clr	___sUp
5201  1061 2026          	jra	L5141
5202  1063               L7141:
5203                     ; 1126 		else if( _disp_mode2 == 0x08 )	__sUp = 1;
5205  1063 a108          	cp	a,#8
5206  1065 2606          	jrne	L3241
5209  1067 35010001      	mov	___sUp,#1
5211  106b 201c          	jra	L5141
5212  106d               L3241:
5213                     ; 1127 		else if( _disp_mode2 == 0x10 )	__sUp = 2;
5215  106d a110          	cp	a,#16
5216  106f 2606          	jrne	L7241
5219  1071 35020001      	mov	___sUp,#2
5221  1075 2012          	jra	L5141
5222  1077               L7241:
5223                     ; 1128 		else if( _disp_mode2 == 0x04 )	__sUp = 5;
5225  1077 a104          	cp	a,#4
5226  1079 2606          	jrne	L3341
5229  107b 35050001      	mov	___sUp,#5
5231  107f 2008          	jra	L5141
5232  1081               L3341:
5233                     ; 1129 		else if( _disp_mode2 == 0x02 )	__sUp = 8;
5235  1081 a102          	cp	a,#2
5236  1083 2604          	jrne	L5141
5239  1085 35080001      	mov	___sUp,#8
5240  1089               L5141:
5241                     ; 1132 	disp_status_loop_message(__sUp);
5243  1089 c60001        	ld	a,___sUp
5244  108c cd0fbe        	call	_disp_status_loop_message
5246                     ; 1134 	if ( i == 0) {
5248  108f 7b01          	ld	a,(OFST+0,sp)
5249  1091 2616          	jrne	L1441
5250                     ; 1135 		if (_disp_mode == 0x01) {
5252  1093 c60000        	ld	a,__disp_mode
5253  1096 4a            	dec	a
5254  1097 260e          	jrne	L3441
5255                     ; 1136 			ui_disp_temp_curr(uiInfo.tCurr);
5257  1099 c60002        	ld	a,_uiInfo+2
5258  109c cd0000        	call	_ui_disp_temp_curr
5260                     ; 1137 			ui_disp_temp_setup(uiInfo.tSetup);
5262  109f c6000e        	ld	a,_uiInfo+14
5263  10a2 cd0000        	call	_ui_disp_temp_setup
5266  10a5 2002          	jra	L1441
5267  10a7               L3441:
5268                     ; 1139 			disp_status_curr_only();
5270  10a7 ad1c          	call	_disp_status_curr_only
5272  10a9               L1441:
5273                     ; 1143 	lcd_blink_clear();
5275  10a9 cd0000        	call	_lcd_blink_clear
5277                     ; 1144 	lcd_disp_info_fire(_boiler_fire != 0 ? 1 : 0);
5279  10ac c60000        	ld	a,__boiler_fire
5280  10af 2702          	jreq	L2701
5281  10b1 a601          	ld	a,#1
5282  10b3               L2701:
5283  10b3 cd0000        	call	_lcd_disp_info_fire
5285                     ; 1146 	if ( i == 1 ) {
5287  10b6 7b01          	ld	a,(OFST+0,sp)
5288  10b8 4a            	dec	a
5289  10b9 2608          	jrne	L7441
5290                     ; 1147 		_key_blink = 1;
5292  10bb 35010000      	mov	__key_blink,#1
5293                     ; 1148 		_key_sec = KEY_BLINK_FADE;
5295  10bf 350a0000      	mov	__key_sec,#10
5296  10c3               L7441:
5297                     ; 1150 }
5300  10c3 84            	pop	a
5301  10c4 81            	ret	
5330                     ; 1152 void	disp_status_curr_only(void)
5330                     ; 1153 {
5331                     	switch	.text
5332  10c5               _disp_status_curr_only:
5336                     ; 1154 	ui_disp_clear_tSetup(0);
5338  10c5 4f            	clr	a
5339  10c6 cd0000        	call	_ui_disp_clear_tSetup
5341                     ; 1155 	LCD_BIT_SET(bS1);
5343  10c9 c60003        	ld	a,_iLF_DEF+3
5344  10cc 5f            	clrw	x
5345  10cd 97            	ld	xl,a
5346  10ce d6540c        	ld	a,(21516,x)
5347  10d1 ca0003        	or	a,_bLF_DEF+3
5348  10d4 d7540c        	ld	(21516,x),a
5349                     ; 1156 	LCD_BIT_SET(bC1);
5351  10d7 c60006        	ld	a,_iLF_DEF+6
5352  10da 5f            	clrw	x
5353  10db 97            	ld	xl,a
5354  10dc d6540c        	ld	a,(21516,x)
5355  10df ca0006        	or	a,_bLF_DEF+6
5356  10e2 d7540c        	ld	(21516,x),a
5357                     ; 1157 	LCD_BIT_CLEAR(bCOL);
5359  10e5 c60016        	ld	a,_iLF_DEF+22
5360  10e8 5f            	clrw	x
5361  10e9 97            	ld	xl,a
5362  10ea c60016        	ld	a,_bLF_DEF+22
5363  10ed 43            	cpl	a
5364  10ee d4540c        	and	a,(21516,x)
5365  10f1 d7540c        	ld	(21516,x),a
5366                     ; 1158 	ui_disp_temp_curr(uiInfo.tCurr);
5368  10f4 c60002        	ld	a,_uiInfo+2
5370                     ; 1159 }
5373  10f7 cc0000        	jp	_ui_disp_temp_curr
5426                     ; 1161 void	disp_status_error(uint8_t key, uint8_t next)
5426                     ; 1162 {
5427                     	switch	.text
5428  10fa               _disp_status_error:
5430  10fa 89            	pushw	x
5431       00000000      OFST:	set	0
5434                     ; 1164 	if( _dsCount == 0 )
5436  10fb c6000f        	ld	a,__dsCount
5437  10fe 261e          	jrne	L1051
5438                     ; 1166 		disp_next();
5440  1100 cd04a0        	call	_disp_next
5442                     ; 1167 		lcd_disp_err(ui_error);
5444  1103 c60000        	ld	a,_ui_error
5445  1106 cd0000        	call	_lcd_disp_err
5447                     ; 1168 		LCD_BIT_SET(bS11);
5449  1109 c60030        	ld	a,_iLF_DEF+48
5450  110c 5f            	clrw	x
5451  110d 97            	ld	xl,a
5452  110e d6540c        	ld	a,(21516,x)
5453  1111 ca0030        	or	a,_bLF_DEF+48
5454  1114 d7540c        	ld	(21516,x),a
5455                     ; 1169 		lcd_blink_item(bS11);
5457  1117 a630          	ld	a,#48
5458  1119 cd0000        	call	_lcd_blink_item
5461  111c 2005          	jra	L3051
5462  111e               L1051:
5463                     ; 1173 		if( uiInfo.enc != 0 )
5465  111e c60000        	ld	a,_uiInfo
5466  1121 2606          	jrne	L1641
5467                     ; 1175 			goto Exit;
5469  1123               L3051:
5470                     ; 1179 	if( key == 2 )
5472  1123 7b01          	ld	a,(OFST+1,sp)
5473  1125 a102          	cp	a,#2
5474  1127 2622          	jrne	L7051
5475  1129               L1641:
5476                     ; 1181 Exit:		
5476                     ; 1182 		if( uiInfo.mode == 1 )
5478  1129 c60008        	ld	a,_uiInfo+8
5479  112c 4a            	dec	a
5480  112d 261c          	jrne	L7051
5481                     ; 1185 			func_rc_recover(1);
5483  112f 4c            	inc	a
5484  1130 cd0000        	call	_func_rc_recover
5486                     ; 1186 			error_type = 0;
5488  1133 725f0000      	clr	_error_type
5489                     ; 1187 			error = 0;
5491  1137 725f0000      	clr	_error
5492                     ; 1188 			lcd_blink_clear();
5494  113b cd0000        	call	_lcd_blink_clear
5496                     ; 1189 			STATUS_NEXT(next);
5498  113e 7b02          	ld	a,(OFST+2,sp)
5499  1140 c7000e        	ld	__ds,a
5502  1143 725f000f      	clr	__dsCount
5505  1147 35ff0010      	mov	__dsPrev,#255
5507  114b               L7051:
5508                     ; 1192 }
5511  114b 85            	popw	x
5512  114c 81            	ret	
5572                     ; 1196 void	disp_status_command(uint8_t key)
5572                     ; 1197 {
5573                     	switch	.text
5574  114d               _disp_status_command:
5576  114d 88            	push	a
5577  114e 88            	push	a
5578       00000001      OFST:	set	1
5581                     ; 1199 	if( _dsCount == 0 )
5583  114f c6000f        	ld	a,__dsCount
5584  1152 263a          	jrne	L5551
5585                     ; 1201 		disp_next();
5587  1154 cd04a0        	call	_disp_next
5589                     ; 1203 		LCD_BIT_SET(b1A);
5591  1157 c60002        	ld	a,_iLF_DEF+2
5592  115a cd129d        	call	LC028
5593  115d ca0002        	or	a,_bLF_DEF+2
5594  1160 d7540c        	ld	(21516,x),a
5595                     ; 1204 		LCD_BIT_SET(b1F);
5597  1163 c60012        	ld	a,_iLF_DEF+18
5598  1166 cd129d        	call	LC028
5599  1169 ca0012        	or	a,_bLF_DEF+18
5600  116c d7540c        	ld	(21516,x),a
5601                     ; 1205 		LCD_BIT_SET(b1E);
5603  116f c60022        	ld	a,_iLF_DEF+34
5604  1172 cd129d        	call	LC028
5605  1175 ca0022        	or	a,_bLF_DEF+34
5606  1178 d7540c        	ld	(21516,x),a
5607                     ; 1206 		LCD_BIT_SET(b1D);
5609  117b c60032        	ld	a,_iLF_DEF+50
5610  117e cd129d        	call	LC028
5611  1181 ca0032        	or	a,_bLF_DEF+50
5612  1184 d7540c        	ld	(21516,x),a
5613                     ; 1207 		uiInfo._t = 0;
5615  1187 725f005f      	clr	_uiInfo+95
5617  118b cc121f        	jra	L7551
5618  118e               L5551:
5619                     ; 1211 		i = uiInfo._t;
5621  118e c6005f        	ld	a,_uiInfo+95
5622  1191 6b01          	ld	(OFST+0,sp),a
5623                     ; 1212 		if( uiInfo.enc != 0 )
5625  1193 c60000        	ld	a,_uiInfo
5626  1196 271d          	jreq	L1651
5627                     ; 1214 			if( (uiInfo.enc & 0x40) == 0 )
5629  1198 a540          	bcp	a,#64
5630  119a 2609          	jrne	L3651
5631                     ; 1215 				i = (i+_LC-1)%_LC;
5633  119c 7b01          	ld	a,(OFST+0,sp)
5634  119e 5f            	clrw	x
5635  119f 97            	ld	xl,a
5636  11a0 1c0009        	addw	x,#9
5639  11a3 2005          	jra	L5651
5640  11a5               L3651:
5641                     ; 1217 				i = (i+1)%_LC;
5643  11a5 7b01          	ld	a,(OFST+0,sp)
5644  11a7 5f            	clrw	x
5645  11a8 97            	ld	xl,a
5646  11a9 5c            	incw	x
5648  11aa               L5651:
5649  11aa a60a          	ld	a,#10
5650  11ac cd0000        	call	c_smodx
5651  11af 01            	rrwa	x,a
5652  11b0 6b01          	ld	(OFST+0,sp),a
5653                     ; 1218 			uiInfo._t = i;
5655  11b2 c7005f        	ld	_uiInfo+95,a
5656  11b5               L1651:
5657                     ; 1220 		if( _dsPrev != i )
5659  11b5 c60010        	ld	a,__dsPrev
5660  11b8 1101          	cp	a,(OFST+0,sp)
5661  11ba 2763          	jreq	L7551
5662                     ; 1222 			_dsPrev = i;
5664  11bc 7b01          	ld	a,(OFST+0,sp)
5665  11be c70010        	ld	__dsPrev,a
5666                     ; 1223 			clear_npos2();
5668  11c1 cd0494        	call	_clear_npos2
5670                     ; 1224 			if( i==0 )		lcd_disp_setup_cntl_tab();
5672  11c4 7b01          	ld	a,(OFST+0,sp)
5673  11c6 2605          	jrne	L1751
5676  11c8 cd0000        	call	_lcd_disp_setup_cntl_tab
5679  11cb 2052          	jra	L7551
5680  11cd               L1751:
5681                     ; 1225 			else if( i==1 )	lcd_disp_setup_cntl_2motor();
5683  11cd a101          	cp	a,#1
5684  11cf 2605          	jrne	L5751
5687  11d1 cd0000        	call	_lcd_disp_setup_cntl_2motor
5690  11d4 2049          	jra	L7551
5691  11d6               L5751:
5692                     ; 1226 			else if( i==2 )	lcd_disp_setup_cntl_on();
5694  11d6 a102          	cp	a,#2
5695  11d8 2605          	jrne	L1061
5698  11da cd0000        	call	_lcd_disp_setup_cntl_on
5701  11dd 2040          	jra	L7551
5702  11df               L1061:
5703                     ; 1227 			else if( i==3 )	lcd_disp_setup_cntl_po();
5705  11df a103          	cp	a,#3
5706  11e1 2605          	jrne	L5061
5709  11e3 cd0000        	call	_lcd_disp_setup_cntl_po
5712  11e6 2037          	jra	L7551
5713  11e8               L5061:
5714                     ; 1228 			else if( i==4 )	lcd_disp_mir1();
5716  11e8 a104          	cp	a,#4
5717  11ea 2605          	jrne	L1161
5720  11ec cd0000        	call	_lcd_disp_mir1
5723  11ef 202e          	jra	L7551
5724  11f1               L1161:
5725                     ; 1229 			else if( i==5 )	
5727  11f1 a105          	cp	a,#5
5728  11f3 2605          	jrne	L5161
5729                     ; 1234 				lcd_disp_n(2, 5);
5731  11f5 ae0205        	ldw	x,#517
5734  11f8 2022          	jp	LC022
5735  11fa               L5161:
5736                     ; 1236 			else if( i==6 )	lcd_disp_freset();
5738  11fa a106          	cp	a,#6
5739  11fc 2605          	jrne	L1261
5742  11fe cd0000        	call	_lcd_disp_freset
5745  1201 201c          	jra	L7551
5746  1203               L1261:
5747                     ; 1237 			else if( i==7 )	lcd_disp_cnt_host();
5749  1203 a107          	cp	a,#7
5750  1205 2605          	jrne	L5261
5753  1207 cd0000        	call	_lcd_disp_cnt_host
5756  120a 2013          	jra	L7551
5757  120c               L5261:
5758                     ; 1238 			else if( i==8 )	lcd_disp_cnt_sub();
5760  120c a108          	cp	a,#8
5761  120e 2605          	jrne	L1361
5764  1210 cd0000        	call	_lcd_disp_cnt_sub
5767  1213 200a          	jra	L7551
5768  1215               L1361:
5769                     ; 1239 			else if( i==9 )	lcd_disp_n(3, 0);
5771  1215 a109          	cp	a,#9
5772  1217 2606          	jrne	L7551
5775  1219 ae0300        	ldw	x,#768
5776  121c               LC022:
5777  121c cd0000        	call	_lcd_disp_n
5779  121f               L7551:
5780                     ; 1242 	if( key == 3 )		
5782  121f 7b02          	ld	a,(OFST+1,sp)
5783  1221 a103          	cp	a,#3
5784  1223 2668          	jrne	L7361
5785                     ; 1244 		switch( uiInfo._t )
5787  1225 c6005f        	ld	a,_uiInfo+95
5789                     ; 1283 			break;
5790  1228 271d          	jreq	L3151
5791  122a 4a            	dec	a
5792  122b 2720          	jreq	L5151
5793  122d 4a            	dec	a
5794  122e 2723          	jreq	L7151
5795  1230 4a            	dec	a
5796  1231 2725          	jreq	L1251
5797  1233 4a            	dec	a
5798  1234 2728          	jreq	L3251
5799  1236 4a            	dec	a
5800  1237 272d          	jreq	L5251
5801  1239 4a            	dec	a
5802  123a 2730          	jreq	L7251
5803  123c 4a            	dec	a
5804  123d 2732          	jreq	L1351
5805  123f 4a            	dec	a
5806  1240 2734          	jreq	L3351
5807  1242 4a            	dec	a
5808  1243 2742          	jreq	L5351
5809  1245 2054          	jra	L5461
5810  1247               L3151:
5811                     ; 1246 		case 0:
5811                     ; 1247 			uiInfoSet.opMode = 3;	
5813  1247 35030069      	mov	_uiInfoSet+4,#3
5814                     ; 1248 			disp_status_run(3, 35, 0);
5816                     ; 1249 			break;
5818  124b 202f          	jp	LC025
5819  124d               L5151:
5820                     ; 1250 		case 1:	
5820                     ; 1251 			uiInfoSet.opMode = 2;	
5822  124d 35020069      	mov	_uiInfoSet+4,#2
5823                     ; 1252 			disp_status_run(3, 35, 0);
5825                     ; 1253 			break;
5827  1251 2029          	jp	LC025
5828  1253               L7151:
5829                     ; 1254 		case 2:	
5829                     ; 1255 			uiInfoSet.opMode = 0;	
5831  1253 c70069        	ld	_uiInfoSet+4,a
5832                     ; 1256 			disp_status_run(3, 35, 0);
5834                     ; 1257 			break;
5836  1256 2024          	jp	LC025
5837  1258               L1251:
5838                     ; 1258 		case 3:	
5838                     ; 1259 			uiInfoSet.opMode = 1;	
5840  1258 35010069      	mov	_uiInfoSet+4,#1
5841                     ; 1260 			disp_status_run(3, 35, 0);
5843                     ; 1261 			break;
5845  125c 201e          	jp	LC025
5846  125e               L3251:
5847                     ; 1262 		case 4:
5847                     ; 1263 			func_rc_command(COMMAND_MODE_MIRROR, 1);   // 1: main, 0:sub	
5849  125e ae0101        	ldw	x,#257
5850  1261               LC027:
5851  1261 cd0000        	call	_func_rc_command
5853                     ; 1264 		 break;
5855  1264 2035          	jra	L5461
5856  1266               L5251:
5857                     ; 1266 			STATUS_NEXT(95);
5859  1266 355f000e      	mov	__ds,#95
5862                     ; 1267 			break;
5865  126a 2028          	jp	LC023
5866  126c               L7251:
5867                     ; 1268 		case 6:	
5867                     ; 1269 			func_rc_command(COMMAND_MODE_FACTORY, 100);	
5869  126c ae0864        	ldw	x,#2148
5871                     ; 1270 			break;
5873  126f 20f0          	jp	LC027
5874  1271               L1351:
5875                     ; 1271 		case 7:	
5875                     ; 1272 			//	MAIN
5875                     ; 1273 			func_rc_command(COMMAND_MODE_FACTORY, 110);	
5877  1271 ae086e        	ldw	x,#2158
5879                     ; 1274 			disp_status_run(3, 35, 0);
5881                     ; 1275 			break;
5883  1274 2003          	jp	LC026
5884  1276               L3351:
5885                     ; 1276 		case 8:	
5885                     ; 1277 			//	SUB
5885                     ; 1278 			func_rc_command(COMMAND_MODE_FACTORY, 120);	
5887  1276 ae0878        	ldw	x,#2168
5888  1279               LC026:
5889  1279 cd0000        	call	_func_rc_command
5891                     ; 1279 			disp_status_run(3, 35, 0);
5894  127c               LC025:
5900  127c 4b00          	push	#0
5901  127e ae0323        	ldw	x,#803
5902  1281 cd0cf4        	call	_disp_status_run
5903  1284 84            	pop	a
5904                     ; 1280 			break;
5906  1285 2014          	jra	L5461
5907  1287               L5351:
5908                     ; 1282 			STATUS_NEXT(100);
5910  1287 3564000e      	mov	__ds,#100
5914                     ; 1283 			break;
5917  128b 2007          	jp	LC023
5919  128d               L7361:
5920                     ; 1286 	else if( key == 1 )
5922  128d 4a            	dec	a
5923  128e 260b          	jrne	L5461
5924                     ; 1288 		STATUS_NEXT(99);
5926  1290 3563000e      	mov	__ds,#99
5931  1294               LC023:
5933  1294 c7000f        	ld	__dsCount,a
5936  1297 35ff0010      	mov	__dsPrev,#255
5938  129b               L5461:
5939                     ; 1290 }
5942  129b 85            	popw	x
5943  129c 81            	ret	
5944  129d               LC028:
5945  129d 5f            	clrw	x
5946  129e 97            	ld	xl,a
5947  129f d6540c        	ld	a,(21516,x)
5948  12a2 81            	ret	
5951                     	switch	.data
5952  0018               __d485_id:
5953  0018 00            	dc.b	0
5990                     ; 1309 void	disp_write_file(uint8_t next)
5990                     ; 1310 {
5991                     	switch	.text
5992  12a3               _disp_write_file:
5994  12a3 88            	push	a
5995       00000000      OFST:	set	0
5998                     ; 1313 	file_update();
6000  12a4 cd0262        	call	_file_update
6002                     ; 1314 	__func_rc_timerout = 5;
6004  12a7 35050012      	mov	___func_rc_timerout,#5
6005                     ; 1315 	__func_rc_timerout1 = 0;
6007  12ab 725f0013      	clr	___func_rc_timerout1
6008                     ; 1316 	__func_rc_timerout2 = __timer1s;
6010  12af 5500000014    	mov	___func_rc_timerout2,___timer1s
6011                     ; 1317 	func_rc_setting();
6013  12b4 cd0000        	call	_func_rc_setting
6015                     ; 1318 	_ds = next;
6017  12b7 7b01          	ld	a,(OFST+1,sp)
6018  12b9 c7000e        	ld	__ds,a
6019                     ; 1319 }
6022  12bc 84            	pop	a
6023  12bd 81            	ret	
6059                     ; 1321 void	disp_set_state(uint8_t next)
6059                     ; 1322 {
6060                     	switch	.text
6061  12be               _disp_set_state:
6063  12be 88            	push	a
6064       00000000      OFST:	set	0
6067                     ; 1323 	lcd_blink_clear();
6069  12bf cd0000        	call	_lcd_blink_clear
6071                     ; 1324 	STATUS_NEXT(next);
6073  12c2 7b01          	ld	a,(OFST+1,sp)
6074  12c4 c7000e        	ld	__ds,a
6077  12c7 725f000f      	clr	__dsCount
6080  12cb 35ff0010      	mov	__dsPrev,#255
6081                     ; 1325 }
6085  12cf 84            	pop	a
6086  12d0 81            	ret	
6128                     ; 1327 void	disp_485(uint8_t next)
6128                     ; 1328 {
6129                     	switch	.text
6130  12d1               _disp_485:
6134                     ; 1329 	if( _dsCount == 0 )
6136  12d1 c6000f        	ld	a,__dsCount
6137  12d4 2609          	jrne	L7171
6138                     ; 1331 		_dsCount = 1;
6140  12d6 3501000f      	mov	__dsCount,#1
6141                     ; 1332 		lcd_clear(0);
6143  12da cd0000        	call	_lcd_clear
6145                     ; 1333 		goto DispEntry;
6147  12dd 2018          	jra	L1071
6148  12df               L7171:
6149                     ; 1337 		if( (_t20ms%100) != 0 )
6151  12df c60000        	ld	a,__t20ms
6152  12e2 5f            	clrw	x
6153  12e3 97            	ld	xl,a
6154  12e4 a664          	ld	a,#100
6155  12e6 cd0000        	call	c_smodx
6157  12e9 5d            	tnzw	x
6158  12ea 2705          	jreq	L3271
6159                     ; 1339 			_dsPrev = 0;
6161  12ec 725f0010      	clr	__dsPrev
6162                     ; 1340 			return;
6165  12f0 81            	ret	
6166  12f1               L3271:
6167                     ; 1343 		if( _dsPrev != 0 )
6169  12f1 c60010        	ld	a,__dsPrev
6170  12f4 2701          	jreq	L1071
6171                     ; 1344 			return;
6174  12f6 81            	ret	
6175  12f7               L1071:
6176                     ; 1345 DispEntry:			
6176                     ; 1346 		_dsPrev = 1;
6178  12f7 35010010      	mov	__dsPrev,#1
6179                     ; 1347 		LCD_BIT_SET(b1F);
6181  12fb 5f            	clrw	x
6182  12fc c60012        	ld	a,_iLF_DEF+18
6183  12ff 97            	ld	xl,a
6184  1300 d6540c        	ld	a,(21516,x)
6185  1303 ca0012        	or	a,_bLF_DEF+18
6186  1306 d7540c        	ld	(21516,x),a
6187                     ; 1348 		LCD_BIT_SET(b1E);
6189  1309 c60022        	ld	a,_iLF_DEF+34
6190  130c cd138e        	call	LC030
6191  130f ca0022        	or	a,_bLF_DEF+34
6192  1312 d7540c        	ld	(21516,x),a
6193                     ; 1349 		LCD_BIT_SET(b1G);
6195  1315 c60023        	ld	a,_iLF_DEF+35
6196  1318 ad74          	call	LC030
6197  131a ca0023        	or	a,_bLF_DEF+35
6198  131d d7540c        	ld	(21516,x),a
6199                     ; 1350 		LCD_BIT_SET(b1C);
6201  1320 c60033        	ld	a,_iLF_DEF+51
6202  1323 ad69          	call	LC030
6203  1325 ca0033        	or	a,_bLF_DEF+51
6204  1328 d7540c        	ld	(21516,x),a
6205                     ; 1351 		LCD_BIT_SET(b1D);
6207  132b c60032        	ld	a,_iLF_DEF+50
6208  132e ad5e          	call	LC030
6209  1330 ca0032        	or	a,_bLF_DEF+50
6210  1333 d7540c        	ld	(21516,x),a
6211                     ; 1352 		if( _d485_id == 0 )
6213  1336 c60018        	ld	a,__d485_id
6214  1339 261e          	jrne	L7271
6215                     ; 1354 			LCD_BIT_CLEAR(b1D);
6217  133b c60032        	ld	a,_iLF_DEF+50
6218  133e 5f            	clrw	x
6219  133f 97            	ld	xl,a
6220  1340 c60032        	ld	a,_bLF_DEF+50
6221  1343 43            	cpl	a
6222  1344 d4540c        	and	a,(21516,x)
6223  1347 d7540c        	ld	(21516,x),a
6224                     ; 1355 			lcd_disp_n(1, debug_hn >> 4);
6226  134a c60000        	ld	a,_debug_hn
6227  134d ad45          	call	LC031
6229                     ; 1356 			lcd_disp_n(2, (debug_hn & 0x0F)/10);
6231  134f c60000        	ld	a,_debug_hn
6232  1352 ad2d          	call	LC029
6234                     ; 1357 			lcd_disp_n(3, (debug_hn & 0x0F)%10);
6236  1354 c60000        	ld	a,_debug_hn
6239  1357 200d          	jra	L1371
6240  1359               L7271:
6241                     ; 1361 			lcd_disp_n(1, debug_br >> 4);
6243  1359 c60000        	ld	a,_debug_br
6244  135c ad36          	call	LC031
6246                     ; 1362 			lcd_disp_n(2, (debug_br & 0x0F)/10);
6248  135e c60000        	ld	a,_debug_br
6249  1361 ad1e          	call	LC029
6251                     ; 1363 			lcd_disp_n(3, (debug_br & 0x0F)%10);
6253  1363 c60000        	ld	a,_debug_br
6255  1366               L1371:
6256  1366 a40f          	and	a,#15
6257  1368 5f            	clrw	x
6258  1369 97            	ld	xl,a
6259  136a a60a          	ld	a,#10
6260  136c 62            	div	x,a
6261  136d 97            	ld	xl,a
6262  136e a603          	ld	a,#3
6263  1370 95            	ld	xh,a
6264  1371 cd0000        	call	_lcd_disp_n
6265                     ; 1365 		_d485_id = _d485_id==0 ? 1 : 0;
6267  1374 c60018        	ld	a,__d485_id
6268  1377 2603          	jrne	L0321
6269  1379 4c            	inc	a
6270  137a 2001          	jra	L2321
6271  137c               L0321:
6272  137c 4f            	clr	a
6273  137d               L2321:
6274  137d c70018        	ld	__d485_id,a
6275                     ; 1367 }
6278  1380 81            	ret	
6279  1381               LC029:
6280  1381 a40f          	and	a,#15
6281  1383 5f            	clrw	x
6282  1384 97            	ld	xl,a
6283  1385 a60a          	ld	a,#10
6284  1387 62            	div	x,a
6285  1388 a602          	ld	a,#2
6286  138a 95            	ld	xh,a
6287  138b cc0000        	jp	_lcd_disp_n
6288  138e               LC030:
6289  138e 5f            	clrw	x
6290  138f 97            	ld	xl,a
6291  1390 d6540c        	ld	a,(21516,x)
6292  1393 81            	ret	
6293  1394               LC031:
6294  1394 4e            	swap	a
6295  1395 a40f          	and	a,#15
6296  1397 97            	ld	xl,a
6297  1398 a601          	ld	a,#1
6298  139a 95            	ld	xh,a
6299  139b cc0000        	jp	_lcd_disp_n
6368                     ; 1369 void	disp_statusCb(uint8_t key)
6368                     ; 1370 {
6369                     	switch	.text
6370  139e               _disp_statusCb:
6372  139e 88            	push	a
6373  139f 88            	push	a
6374       00000001      OFST:	set	1
6377                     ; 1372 	if( _ds == 1 )			disp_status_id(key, 36);
6379  13a0 c6000e        	ld	a,__ds
6380  13a3 a101          	cp	a,#1
6381  13a5 260c          	jrne	L1571
6384  13a7 ae0024        	ldw	x,#36
6385  13aa 7b02          	ld	a,(OFST+1,sp)
6386  13ac 95            	ld	xh,a
6387  13ad cd04ad        	call	_disp_status_id
6390  13b0 cc15bd        	jra	L0431
6391  13b3               L1571:
6392                     ; 1373 	else if( _ds == 36 )	disp_status_toffset(key, 37);
6394  13b3 a124          	cp	a,#36
6395  13b5 260c          	jrne	L5571
6398  13b7 ae0025        	ldw	x,#37
6399  13ba 7b02          	ld	a,(OFST+1,sp)
6400  13bc 95            	ld	xh,a
6401  13bd cd05d6        	call	_disp_status_toffset
6404  13c0 cc15bd        	jra	L0431
6405  13c3               L5571:
6406                     ; 1374 	else if( _ds == 37 )	
6408  13c3 a125          	cp	a,#37
6409  13c5 2617          	jrne	L1671
6410                     ; 1376 		t = disp_status_run(key, 38, 1);
6412  13c7 4b01          	push	#1
6413  13c9 ae0026        	ldw	x,#38
6414  13cc 7b03          	ld	a,(OFST+2,sp)
6415  13ce 95            	ld	xh,a
6416  13cf cd0cf4        	call	_disp_status_run
6418  13d2 5b01          	addw	sp,#1
6419                     ; 1377 		if( t == 1 )
6421  13d4 4a            	dec	a
6422  13d5 26e9          	jrne	L0431
6423                     ; 1378 			_ds = 100;
6425  13d7 3564000e      	mov	__ds,#100
6426  13db cc15bd        	jra	L0431
6427  13de               L1671:
6428                     ; 1380 	else if( _ds == 38 )	disp_status_exit(key, 100);
6430  13de a126          	cp	a,#38
6431  13e0 260c          	jrne	L7671
6434  13e2 ae0064        	ldw	x,#100
6435  13e5 7b02          	ld	a,(OFST+1,sp)
6436  13e7 95            	ld	xh,a
6437  13e8 cd0f1b        	call	_disp_status_exit
6440  13eb cc15bd        	jra	L0431
6441  13ee               L7671:
6442                     ; 1382 	else if( _ds == 2 )		disp_status_id(key, 3);
6444  13ee a102          	cp	a,#2
6445  13f0 260c          	jrne	L3771
6448  13f2 ae0003        	ldw	x,#3
6449  13f5 7b02          	ld	a,(OFST+1,sp)
6450  13f7 95            	ld	xh,a
6451  13f8 cd04ad        	call	_disp_status_id
6454  13fb cc15bd        	jra	L0431
6455  13fe               L3771:
6456                     ; 1383 	else if( _ds == 3 )	
6458  13fe a103          	cp	a,#3
6459  1400 2617          	jrne	L7771
6460                     ; 1385 		t = disp_status_run(key, 38, 2);
6462  1402 4b02          	push	#2
6463  1404 ae0026        	ldw	x,#38
6464  1407 7b03          	ld	a,(OFST+2,sp)
6465  1409 95            	ld	xh,a
6466  140a cd0cf4        	call	_disp_status_run
6468  140d 5b01          	addw	sp,#1
6469                     ; 1386 		if( t == 1 )
6471  140f 4a            	dec	a
6472  1410 26e9          	jrne	L0431
6473                     ; 1387 			_ds = 100;
6475  1412 3564000e      	mov	__ds,#100
6476  1416 cc15bd        	jra	L0431
6477  1419               L7771:
6478                     ; 1390 	else if( _ds == 9 )		disp_status_run_op(key, 61);
6480  1419 a109          	cp	a,#9
6481  141b 260c          	jrne	L5002
6484  141d ae003d        	ldw	x,#61
6485  1420 7b02          	ld	a,(OFST+1,sp)
6486  1422 95            	ld	xh,a
6487  1423 cd06b8        	call	_disp_status_run_op
6490  1426 cc15bd        	jra	L0431
6491  1429               L5002:
6492                     ; 1391 	else if( _ds == 61 )	disp_status_cntl_op(key, 63);
6494  1429 a13d          	cp	a,#61
6495  142b 260c          	jrne	L1102
6498  142d ae003f        	ldw	x,#63
6499  1430 7b02          	ld	a,(OFST+1,sp)
6500  1432 95            	ld	xh,a
6501  1433 cd071b        	call	_disp_status_cntl_op
6504  1436 cc15bd        	jra	L0431
6505  1439               L1102:
6506                     ; 1392 	else if( _ds == 63 )	disp_status_valveCount(key, 64);
6508  1439 a13f          	cp	a,#63
6509  143b 260c          	jrne	L5102
6512  143d ae0040        	ldw	x,#64
6513  1440 7b02          	ld	a,(OFST+1,sp)
6514  1442 95            	ld	xh,a
6515  1443 cd0538        	call	_disp_status_valveCount
6518  1446 cc15bd        	jra	L0431
6519  1449               L5102:
6520                     ; 1393 	else if( _ds == 64 )	disp_status_houseCapa(key, /*65*/66);	//	if opMode==0, skip
6522  1449 a140          	cp	a,#64
6523  144b 260c          	jrne	L1202
6526  144d ae0042        	ldw	x,#66
6527  1450 7b02          	ld	a,(OFST+1,sp)
6528  1452 95            	ld	xh,a
6529  1453 cd077b        	call	_disp_status_houseCapa
6532  1456 cc15bd        	jra	L0431
6533  1459               L1202:
6534                     ; 1396 	else if( _ds == 66 )	disp_status_lpm(key, /*67*/68);		//	세대밸브 if cntlMode==1, skip
6536  1459 a142          	cp	a,#66
6537  145b 260c          	jrne	L5202
6540  145d ae0044        	ldw	x,#68
6541  1460 7b02          	ld	a,(OFST+1,sp)
6542  1462 95            	ld	xh,a
6543  1463 cd080e        	call	_disp_status_lpm
6546  1466 cc15bd        	jra	L0431
6547  1469               L5202:
6548                     ; 1400 	else if( _ds == 68 )	disp_status_valveinfo(key, 69, 68);
6550  1469 a144          	cp	a,#68
6551  146b 260f          	jrne	L1302
6554  146d 4b44          	push	#68
6555  146f ae0045        	ldw	x,#69
6556  1472 7b03          	ld	a,(OFST+2,sp)
6557  1474 95            	ld	xh,a
6558  1475 cd0ad6        	call	_disp_status_valveinfo
6560  1478 84            	pop	a
6562  1479 cc15bd        	jra	L0431
6563  147c               L1302:
6564                     ; 1401 	else if( _ds == 69 )	disp_status_plc(key, 70);
6566  147c a145          	cp	a,#69
6567  147e 260c          	jrne	L5302
6570  1480 ae0046        	ldw	x,#70
6571  1483 7b02          	ld	a,(OFST+1,sp)
6572  1485 95            	ld	xh,a
6573  1486 cd0c8c        	call	_disp_status_plc
6576  1489 cc15bd        	jra	L0431
6577  148c               L5302:
6578                     ; 1402 	else if( _ds == 70 )	
6580  148c a146          	cp	a,#70
6581  148e 2617          	jrne	L1402
6582                     ; 1404 		t = disp_status_run(key, 71, 9);
6584  1490 4b09          	push	#9
6585  1492 ae0047        	ldw	x,#71
6586  1495 7b03          	ld	a,(OFST+2,sp)
6587  1497 95            	ld	xh,a
6588  1498 cd0cf4        	call	_disp_status_run
6590  149b 5b01          	addw	sp,#1
6591                     ; 1405 		if( t == 1 )
6593  149d 4a            	dec	a
6594  149e 26e9          	jrne	L0431
6595                     ; 1406 			_ds = 100;
6597  14a0 3564000e      	mov	__ds,#100
6598  14a4 cc15bd        	jra	L0431
6599  14a7               L1402:
6600                     ; 1408 	else if( _ds == 71 )	disp_status_exit(key, 100);
6602  14a7 a147          	cp	a,#71
6603  14a9 260c          	jrne	L7402
6606  14ab ae0064        	ldw	x,#100
6607  14ae 7b02          	ld	a,(OFST+1,sp)
6608  14b0 95            	ld	xh,a
6609  14b1 cd0f1b        	call	_disp_status_exit
6612  14b4 cc15bd        	jra	L0431
6613  14b7               L7402:
6614                     ; 1410 	else if( _ds == 10 )	
6616  14b7 a10a          	cp	a,#10
6617  14b9 2617          	jrne	L3502
6618                     ; 1412 		t = disp_status_run(key, 11, 9);
6620  14bb 4b09          	push	#9
6621  14bd ae000b        	ldw	x,#11
6622  14c0 7b03          	ld	a,(OFST+2,sp)
6623  14c2 95            	ld	xh,a
6624  14c3 cd0cf4        	call	_disp_status_run
6626  14c6 5b01          	addw	sp,#1
6627                     ; 1413 		if( t == 1 )
6629  14c8 4a            	dec	a
6630  14c9 26e9          	jrne	L0431
6631                     ; 1414 			_ds = 100;
6633  14cb 3564000e      	mov	__ds,#100
6634  14cf cc15bd        	jra	L0431
6635  14d2               L3502:
6636                     ; 1416 	else if( _ds == 11 )	disp_status_exit(key, 100);
6638  14d2 a10b          	cp	a,#11
6639  14d4 260c          	jrne	L1602
6642  14d6 ae0064        	ldw	x,#100
6643  14d9 7b02          	ld	a,(OFST+1,sp)
6644  14db 95            	ld	xh,a
6645  14dc cd0f1b        	call	_disp_status_exit
6648  14df cc15bd        	jra	L0431
6649  14e2               L1602:
6650                     ; 1418 	else if( _ds == 12 )	disp_status_exit(key, 100);
6652  14e2 a10c          	cp	a,#12
6653  14e4 260c          	jrne	L5602
6656  14e6 ae0064        	ldw	x,#100
6657  14e9 7b02          	ld	a,(OFST+1,sp)
6658  14eb 95            	ld	xh,a
6659  14ec cd0f1b        	call	_disp_status_exit
6662  14ef cc15bd        	jra	L0431
6663  14f2               L5602:
6664                     ; 1419 	else if( _ds == 15 )	
6666  14f2 a10f          	cp	a,#15
6667  14f4 2617          	jrne	L1702
6668                     ; 1421 		t = disp_status_run(key, 11, 20);
6670  14f6 4b14          	push	#20
6671  14f8 ae000b        	ldw	x,#11
6672  14fb 7b03          	ld	a,(OFST+2,sp)
6673  14fd 95            	ld	xh,a
6674  14fe cd0cf4        	call	_disp_status_run
6676  1501 5b01          	addw	sp,#1
6677                     ; 1422 		if( t == 1 )
6679  1503 4a            	dec	a
6680  1504 26e9          	jrne	L0431
6681                     ; 1423 			_ds = 100;
6683  1506 3564000e      	mov	__ds,#100
6684  150a cc15bd        	jra	L0431
6685  150d               L1702:
6686                     ; 1425 	else if( _ds == 31 )	disp_status_toffset(key, 32);	//	mainR/C only
6688  150d a11f          	cp	a,#31
6689  150f 260c          	jrne	L7702
6692  1511 ae0020        	ldw	x,#32
6693  1514 7b02          	ld	a,(OFST+1,sp)
6694  1516 95            	ld	xh,a
6695  1517 cd05d6        	call	_disp_status_toffset
6698  151a cc15bd        	jra	L0431
6699  151d               L7702:
6700                     ; 1426 	else if( _ds == 32 )	
6702  151d a120          	cp	a,#32
6703  151f 2617          	jrne	L3012
6704                     ; 1428 		t = disp_status_run(key, 35, 31);
6706  1521 4b1f          	push	#31
6707  1523 ae0023        	ldw	x,#35
6708  1526 7b03          	ld	a,(OFST+2,sp)
6709  1528 95            	ld	xh,a
6710  1529 cd0cf4        	call	_disp_status_run
6712  152c 5b01          	addw	sp,#1
6713                     ; 1429 		if( t == 1 )
6715  152e 4a            	dec	a
6716  152f 26e9          	jrne	L0431
6717                     ; 1430 			_ds = 100;
6719  1531 3564000e      	mov	__ds,#100
6720  1535 cc15bd        	jra	L0431
6721  1538               L3012:
6722                     ; 1432 	else if( _ds == 33 )	disp_status_toffset(key, 34);	//	mainR/C only
6724  1538 a121          	cp	a,#33
6725  153a 260b          	jrne	L1112
6728  153c ae0022        	ldw	x,#34
6729  153f 7b02          	ld	a,(OFST+1,sp)
6730  1541 95            	ld	xh,a
6731  1542 cd05d6        	call	_disp_status_toffset
6734  1545 2076          	jra	L0431
6735  1547               L1112:
6736                     ; 1433 	else if( _ds == 34 )	
6738  1547 a122          	cp	a,#34
6739  1549 2616          	jrne	L5112
6740                     ; 1435 		t = disp_status_run(key, 35, 33);
6742  154b 4b21          	push	#33
6743  154d ae0023        	ldw	x,#35
6744  1550 7b03          	ld	a,(OFST+2,sp)
6745  1552 95            	ld	xh,a
6746  1553 cd0cf4        	call	_disp_status_run
6748  1556 5b01          	addw	sp,#1
6749                     ; 1436 		if( t == 1 )
6751  1558 4a            	dec	a
6752  1559 2662          	jrne	L0431
6753                     ; 1437 			_ds = 100;
6755  155b 3564000e      	mov	__ds,#100
6756  155f 205c          	jra	L0431
6757  1561               L5112:
6758                     ; 1439 	else if( _ds == 35 )	disp_status_exit(key, 100);
6760  1561 a123          	cp	a,#35
6761  1563 260b          	jrne	L3212
6764  1565 ae0064        	ldw	x,#100
6765  1568 7b02          	ld	a,(OFST+1,sp)
6766  156a 95            	ld	xh,a
6767  156b cd0f1b        	call	_disp_status_exit
6770  156e 204d          	jra	L0431
6771  1570               L3212:
6772                     ; 1441 	else if( _ds == 41 )	disp_status_command(key);
6774  1570 a129          	cp	a,#41
6775  1572 2607          	jrne	L7212
6778  1574 7b02          	ld	a,(OFST+1,sp)
6779  1576 cd114d        	call	_disp_status_command
6782  1579 2042          	jra	L0431
6783  157b               L7212:
6784                     ; 1443 	else if( _ds == 100 )	
6786  157b a164          	cp	a,#100
6787  157d 2616          	jrne	L3312
6788                     ; 1445 		__s = 0;
6790  157f 725f0000      	clr	___s
6791                     ; 1446 		_dsCount = 0;
6793  1583 725f000f      	clr	__dsCount
6794                     ; 1447 		_ds = 99;	
6796  1587 3563000e      	mov	__ds,#99
6797                     ; 1448 		_dsPrev = 0xff;
6799  158b 35ff0010      	mov	__dsPrev,#255
6800                     ; 1449 		_remote = 0;
6802  158f 725f0000      	clr	__remote
6804  1593 2028          	jra	L0431
6805  1595               L3312:
6806                     ; 1451 	else if( _ds == 101 || _ds == 133 || _ds == 131 )
6808  1595 a165          	cp	a,#101
6809  1597 2708          	jreq	L1412
6811  1599 a185          	cp	a,#133
6812  159b 2704          	jreq	L1412
6814  159d a183          	cp	a,#131
6815  159f 2610          	jrne	L7312
6816  15a1               L1412:
6817                     ; 1454 		_dsCount = __timer1s;
6819  15a1 550000000f    	mov	__dsCount,___timer1s
6820                     ; 1455 		_dsPrev = _ds - 100;
6822  15a6 a064          	sub	a,#100
6823  15a8 c70010        	ld	__dsPrev,a
6824                     ; 1456 		_ds = 200;
6826  15ab 35c8000e      	mov	__ds,#200
6828                     ; 1520 }
6830  15af 200c          	jra	L0431
6831  15b1               L7312:
6832                     ; 1458 	else if( _ds == 200 )
6834  15b1 a1c8          	cp	a,#200
6835  15b3 2619          	jrne	L7412
6836                     ; 1460 		if( _dsCount == __timer1s )
6838  15b5 c6000f        	ld	a,__dsCount
6839  15b8 c10000        	cp	a,___timer1s
6840  15bb 2602          	jrne	L1512
6841                     ; 1461 			return;
6842  15bd               L0431:
6845  15bd 85            	popw	x
6846  15be 81            	ret	
6847  15bf               L1512:
6848                     ; 1462 		STATUS_NEXT(_dsPrev);
6850  15bf 550010000e    	mov	__ds,__dsPrev
6853  15c4 725f000f      	clr	__dsCount
6856  15c8 35ff0010      	mov	__dsPrev,#255
6859  15cc 20ef          	jra	L0431
6860  15ce               L7412:
6861                     ; 1466 	else if( _ds == 81 )	{	disp_write_file(12);	}
6863  15ce a151          	cp	a,#81
6864  15d0 2607          	jrne	L5512
6867  15d2 a60c          	ld	a,#12
6868  15d4 cd12a3        	call	_disp_write_file
6871  15d7 20e4          	jra	L0431
6872  15d9               L5512:
6873                     ; 1467 	else if( _ds == 95 )	{	disp_485(12);	}
6875  15d9 a15f          	cp	a,#95
6876  15db 2607          	jrne	L1612
6879  15dd a60c          	ld	a,#12
6880  15df cd12d1        	call	_disp_485
6883  15e2 20d9          	jra	L0431
6884  15e4               L1612:
6885                     ; 1468 	else if( _ds == 96 )	{	disp_write_file(12);	}
6887  15e4 a160          	cp	a,#96
6888  15e6 2607          	jrne	L5612
6891  15e8 a60c          	ld	a,#12
6892  15ea cd12a3        	call	_disp_write_file
6895  15ed 20ce          	jra	L0431
6896  15ef               L5612:
6897                     ; 1469 	else if( _ds == 97 )
6899  15ef a161          	cp	a,#97
6900  15f1 2619          	jrne	L1712
6901                     ; 1471 		disp_status_error(key, 99);
6903  15f3 ae0063        	ldw	x,#99
6904  15f6 7b02          	ld	a,(OFST+1,sp)
6905  15f8 95            	ld	xh,a
6906  15f9 cd10fa        	call	_disp_status_error
6908                     ; 1473 			if( error == 0 && error_type == 0 )
6910  15fc c60000        	ld	a,_error
6911  15ff 26bc          	jrne	L0431
6913  1601 c60000        	ld	a,_error_type
6914  1604 26b7          	jrne	L0431
6915                     ; 1476 				_ds = 100;
6917  1606 3564000e      	mov	__ds,#100
6918  160a 20b1          	jra	L0431
6919  160c               L1712:
6920                     ; 1486 	else if( _ds == 99 )
6922  160c a163          	cp	a,#99
6923  160e 26ad          	jrne	L0431
6924                     ; 1488 		t = getCurrTemp();
6926  1610 cd0000        	call	_getCurrTemp
6928  1613 6b01          	ld	(OFST+0,sp),a
6929                     ; 1489 		if( uiInfo.tOffset != 100 )
6931  1615 c60011        	ld	a,_uiInfo+17
6932  1618 a164          	cp	a,#100
6933  161a 2711          	jreq	L1022
6934                     ; 1491 			if( uiInfo.tOffset > 100 )
6936  161c a165          	cp	a,#101
6937  161e 2506          	jrult	L3022
6938                     ; 1492 				t = t + (uiInfo.tOffset-100);
6940  1620 a064          	sub	a,#100
6941  1622 1b01          	add	a,(OFST+0,sp)
6943  1624 2005          	jp	LC032
6944  1626               L3022:
6945                     ; 1494 				t = t - uiInfo.tOffset;
6947  1626 7b01          	ld	a,(OFST+0,sp)
6948  1628 c00011        	sub	a,_uiInfo+17
6949  162b               LC032:
6950  162b 6b01          	ld	(OFST+0,sp),a
6951  162d               L1022:
6952                     ; 1496 		if( uiInfo.tCurr != t )
6954  162d c60002        	ld	a,_uiInfo+2
6955  1630 1101          	cp	a,(OFST+0,sp)
6956  1632 2715          	jreq	L7022
6957                     ; 1498 			uiInfo.tCurr = t;
6959  1634 7b01          	ld	a,(OFST+0,sp)
6960  1636 c70002        	ld	_uiInfo+2,a
6961                     ; 1499 			if( _remote == 0 )
6963  1639 c60000        	ld	a,__remote
6964  163c 260b          	jrne	L7022
6965                     ; 1502 				if( _disp_temp == 1 )
6967  163e c60008        	ld	a,__disp_temp
6968  1641 4a            	dec	a
6969  1642 2605          	jrne	L7022
6970                     ; 1503 					ui_disp_temp_curr(t);
6972  1644 7b01          	ld	a,(OFST+0,sp)
6973  1646 cd0000        	call	_ui_disp_temp_curr
6975  1649               L7022:
6976                     ; 1506 		_disp_temp = 0;
6978  1649 725f0008      	clr	__disp_temp
6979                     ; 1508 		if( uiInfo.mode == 0 )	disp_status_loop_client(key);
6981  164d c60008        	ld	a,_uiInfo+8
6982  1650 2607          	jrne	L5122
6985  1652 7b02          	ld	a,(OFST+1,sp)
6986  1654 cd0000        	call	_disp_status_loop_client
6989  1657 2005          	jra	L7122
6990  1659               L5122:
6991                     ; 1510 			disp_status_loop_host(key);
6993  1659 7b02          	ld	a,(OFST+1,sp)
6994  165b cd0000        	call	_disp_status_loop_host
6996  165e               L7122:
6997                     ; 1513 		if( error != 0 && error_type != 0 )
6999  165e c60000        	ld	a,_error
7000  1661 2603cc15bd    	jreq	L0431
7002  1666 c60000        	ld	a,_error_type
7003  1669 27f8          	jreq	L0431
7004                     ; 1515 			ui_error = error;
7006  166b 5500000000    	mov	_ui_error,_error
7007                     ; 1516 			_ds = 97;
7009  1670 3561000e      	mov	__ds,#97
7010                     ; 1517 			_dsCount = 0;
7012  1674 725f000f      	clr	__dsCount
7013  1678 cc15bd        	jra	L0431
7059                     ; 1522 void	copy_info(uint8_t next)
7059                     ; 1523 {
7060                     	switch	.text
7061  167b               _copy_info:
7063  167b 88            	push	a
7064       00000001      OFST:	set	1
7067                     ; 1525 	disp_set_state(next);
7069  167c cd12be        	call	_disp_set_state
7071                     ; 1526 	uiInfoSet.id = uiInfo.id;
7073  167f 5500040066    	mov	_uiInfoSet+1,_uiInfo+4
7074                     ; 1527 	uiInfoSet.cnt = uiInfo.cnt;
7076  1684 5500050067    	mov	_uiInfoSet+2,_uiInfo+5
7077                     ; 1528 	uiInfoSet.cnt_sub = uiInfo.cnt_sub;
7079  1689 5500060068    	mov	_uiInfoSet+3,_uiInfo+6
7080                     ; 1529 	uiInfoSet.opMode = uiInfo.opMode;
7082  168e 5500070069    	mov	_uiInfoSet+4,_uiInfo+7
7083                     ; 1530 	uiInfoSet.mode = uiInfo.mode;
7085  1693 550008006a    	mov	_uiInfoSet+5,_uiInfo+8
7086                     ; 1531 	uiInfoSet.controlMode = uiInfo.controlMode;
7088  1698 550009006b    	mov	_uiInfoSet+6,_uiInfo+9
7089                     ; 1532 	uiInfoSet.valve = uiInfo.valve;
7091  169d 55000a006c    	mov	_uiInfoSet+7,_uiInfo+10
7092                     ; 1533 	uiInfoSet.valve_sub = uiInfo.valve_sub;
7094  16a2 55000b006d    	mov	_uiInfoSet+8,_uiInfo+11
7095                     ; 1534 	uiInfoSet.poType = uiInfo.poType;
7097  16a7 55000f006e    	mov	_uiInfoSet+9,_uiInfo+15
7098                     ; 1535 	uiInfoSet.houseCapa = uiInfo.houseCapa;
7100  16ac 550010006f    	mov	_uiInfoSet+10,_uiInfo+16
7101                     ; 1536 	uiInfoSet.tOffset = uiInfo.tOffset;
7103  16b1 5500110070    	mov	_uiInfoSet+11,_uiInfo+17
7104                     ; 1537 	uiInfoSet.tempOffset = uiInfo.tempOffset;
7106  16b6 5500120071    	mov	_uiInfoSet+12,_uiInfo+18
7107                     ; 1538 	uiInfoSet.lpmType = uiInfo.lpmType;
7109  16bb 5500130072    	mov	_uiInfoSet+13,_uiInfo+19
7110                     ; 1539 	uiInfoSet.lpmType_sub = uiInfo.lpmType_sub;
7112  16c0 5500140073    	mov	_uiInfoSet+14,_uiInfo+20
7113                     ; 1540 	uiInfoSet.subRCLock = uiInfo.subRCLock;
7115  16c5 55005d0094    	mov	_uiInfoSet+47,_uiInfo+93
7116                     ; 1541 	uiInfoSet.cntlMode = uiInfo.cntlMode;
7118                     ; 1542 	for( i=0; i<8; i++ )
7120  16ca 4f            	clr	a
7121  16cb 5500030065    	mov	_uiInfoSet,_uiInfo+3
7122  16d0 6b01          	ld	(OFST+0,sp),a
7123  16d2               L1422:
7124                     ; 1544 		uiInfoSet.valve_len[i] = uiInfo.valve_len[i];
7126  16d2 5f            	clrw	x
7127  16d3 97            	ld	xl,a
7128  16d4 d60015        	ld	a,(_uiInfo+21,x)
7129  16d7 d70074        	ld	(_uiInfoSet+15,x),a
7130                     ; 1545 		uiInfoSet.valve_rc[i] = uiInfo.valve_rc[i];
7132  16da 5f            	clrw	x
7133  16db 7b01          	ld	a,(OFST+0,sp)
7134  16dd 97            	ld	xl,a
7135  16de d6001d        	ld	a,(_uiInfo+29,x)
7136  16e1 d7007c        	ld	(_uiInfoSet+23,x),a
7137                     ; 1546 		uiInfoSet.valve_sub_len[i] = uiInfo.valve_sub_len[i];
7139  16e4 5f            	clrw	x
7140  16e5 7b01          	ld	a,(OFST+0,sp)
7141  16e7 97            	ld	xl,a
7142  16e8 d60025        	ld	a,(_uiInfo+37,x)
7143  16eb d70084        	ld	(_uiInfoSet+31,x),a
7144                     ; 1547 		uiInfoSet.valve_sub_rc[i] = uiInfo.valve_sub_rc[i];
7146  16ee 5f            	clrw	x
7147  16ef 7b01          	ld	a,(OFST+0,sp)
7148  16f1 97            	ld	xl,a
7149  16f2 d6002d        	ld	a,(_uiInfo+45,x)
7150  16f5 d7008c        	ld	(_uiInfoSet+39,x),a
7151                     ; 1542 	for( i=0; i<8; i++ )
7153  16f8 0c01          	inc	(OFST+0,sp)
7156  16fa 7b01          	ld	a,(OFST+0,sp)
7157  16fc a108          	cp	a,#8
7158  16fe 25d2          	jrult	L1422
7159                     ; 1549 	uiInfoSet.plc = uiInfo.plc;
7161  1700 550064009a    	mov	_uiInfoSet+53,_uiInfo+100
7162                     ; 1551 	_backup_backlight = _backlight + 1;
7164  1705 c60000        	ld	a,__backlight
7165  1708 4c            	inc	a
7166  1709 c70009        	ld	__backup_backlight,a
7167                     ; 1553 	lcd_blink_npos_clear();
7169  170c cd0000        	call	_lcd_blink_npos_clear
7171                     ; 1554 	lcd_blink_clear();
7173  170f cd0000        	call	_lcd_blink_clear
7175                     ; 1555 }
7178  1712 84            	pop	a
7179  1713 81            	ret	
7214                     ; 1559 void	copy_infoSet(void)
7214                     ; 1560 {
7215                     	switch	.text
7216  1714               _copy_infoSet:
7218       00000001      OFST:	set	1
7221                     ; 1562 	uiInfo.id = uiInfoSet.id;
7223  1714 5500660004    	mov	_uiInfo+4,_uiInfoSet+1
7224                     ; 1563 	uiInfo.cnt = uiInfoSet.cnt;
7226  1719 5500670005    	mov	_uiInfo+5,_uiInfoSet+2
7227                     ; 1564 	uiInfo.cnt_sub = uiInfoSet.cnt_sub;
7229  171e 5500680006    	mov	_uiInfo+6,_uiInfoSet+3
7230                     ; 1565 	uiInfo.opMode = uiInfoSet.opMode;
7232  1723 5500690007    	mov	_uiInfo+7,_uiInfoSet+4
7233                     ; 1566 	uiInfo.mode = uiInfoSet.mode;
7235  1728 55006a0008    	mov	_uiInfo+8,_uiInfoSet+5
7236                     ; 1567 	uiInfo.controlMode = uiInfoSet.controlMode;
7238  172d 55006b0009    	mov	_uiInfo+9,_uiInfoSet+6
7239                     ; 1568 	uiInfo.valve = uiInfoSet.valve;
7241  1732 55006c000a    	mov	_uiInfo+10,_uiInfoSet+7
7242                     ; 1569 	uiInfo.valve_sub = uiInfoSet.valve_sub;
7244  1737 55006d000b    	mov	_uiInfo+11,_uiInfoSet+8
7245                     ; 1570 	uiInfo.poType = uiInfoSet.poType;
7247  173c 55006e000f    	mov	_uiInfo+15,_uiInfoSet+9
7248                     ; 1571 	uiInfo.houseCapa = uiInfoSet.houseCapa;
7250  1741 55006f0010    	mov	_uiInfo+16,_uiInfoSet+10
7251                     ; 1572 	uiInfo.tOffset = uiInfoSet.tOffset;
7253  1746 5500700011    	mov	_uiInfo+17,_uiInfoSet+11
7254                     ; 1573 	uiInfo.tempOffset = uiInfoSet.tempOffset;
7256  174b 5500710012    	mov	_uiInfo+18,_uiInfoSet+12
7257                     ; 1574 	uiInfo.lpmType = uiInfoSet.lpmType;
7259  1750 5500720013    	mov	_uiInfo+19,_uiInfoSet+13
7260                     ; 1575 	uiInfo.lpmType_sub = uiInfoSet.lpmType_sub;
7262  1755 5500730014    	mov	_uiInfo+20,_uiInfoSet+14
7263                     ; 1576 	uiInfo.subRCLock = uiInfoSet.subRCLock;
7265  175a 550094005d    	mov	_uiInfo+93,_uiInfoSet+47
7266  175f 88            	push	a
7267                     ; 1577 	uiInfo.cntlMode = uiInfoSet.cntlMode;
7269  1760 5500650003    	mov	_uiInfo+3,_uiInfoSet
7270                     ; 1578 	for( i=0; i<8; i++ )
7272  1765 4f            	clr	a
7273  1766 6b01          	ld	(OFST+0,sp),a
7274  1768               L3622:
7275                     ; 1580 		uiInfo.valve_len[i] = uiInfoSet.valve_len[i];
7277  1768 5f            	clrw	x
7278  1769 97            	ld	xl,a
7279  176a d60074        	ld	a,(_uiInfoSet+15,x)
7280  176d d70015        	ld	(_uiInfo+21,x),a
7281                     ; 1581 		uiInfo.valve_rc[i] = uiInfoSet.valve_rc[i];
7283  1770 5f            	clrw	x
7284  1771 7b01          	ld	a,(OFST+0,sp)
7285  1773 97            	ld	xl,a
7286  1774 d6007c        	ld	a,(_uiInfoSet+23,x)
7287  1777 d7001d        	ld	(_uiInfo+29,x),a
7288                     ; 1582 		uiInfo.valve_sub_len[i] = uiInfoSet.valve_sub_len[i];
7290  177a 5f            	clrw	x
7291  177b 7b01          	ld	a,(OFST+0,sp)
7292  177d 97            	ld	xl,a
7293  177e d60084        	ld	a,(_uiInfoSet+31,x)
7294  1781 d70025        	ld	(_uiInfo+37,x),a
7295                     ; 1583 		uiInfo.valve_sub_rc[i] = uiInfoSet.valve_sub_rc[i];
7297  1784 5f            	clrw	x
7298  1785 7b01          	ld	a,(OFST+0,sp)
7299  1787 97            	ld	xl,a
7300  1788 d6008c        	ld	a,(_uiInfoSet+39,x)
7301  178b d7002d        	ld	(_uiInfo+45,x),a
7302                     ; 1578 	for( i=0; i<8; i++ )
7304  178e 0c01          	inc	(OFST+0,sp)
7307  1790 7b01          	ld	a,(OFST+0,sp)
7308  1792 a108          	cp	a,#8
7309  1794 25d2          	jrult	L3622
7310                     ; 1585 	uiInfo.plc = uiInfoSet.plc;
7312  1796 c6009a        	ld	a,_uiInfoSet+53
7313  1799 c70064        	ld	_uiInfo+100,a
7314                     ; 1586 	if( uiInfo.plc == 0 )
7316  179c 2605          	jrne	L1722
7317                     ; 1588 		_boiler_type = 0;
7319  179e c70000        	ld	__boiler_type,a
7321  17a1 2008          	jra	L3722
7322  17a3               L1722:
7323                     ; 1592 		_boiler_type = 1;
7325  17a3 35010000      	mov	__boiler_type,#1
7326                     ; 1593 		uiInfo.plc--;
7328  17a7 725a0064      	dec	_uiInfo+100
7329  17ab               L3722:
7330                     ; 1595 }
7333  17ab 84            	pop	a
7334  17ac 81            	ret	
7383                     ; 1599 void	disp_status(uint8_t key)
7383                     ; 1600 {
7384                     	switch	.text
7385  17ad               _disp_status:
7387  17ad 88            	push	a
7388       00000000      OFST:	set	0
7391                     ; 1601 	lcd_blinkCb();
7393  17ae cd0000        	call	_lcd_blinkCb
7395                     ; 1602 	disp_statusCb(key);
7397  17b1 7b01          	ld	a,(OFST+1,sp)
7398  17b3 cd139e        	call	_disp_statusCb
7400                     ; 1605 	uiInfo.enc = 0;
7402  17b6 725f0000      	clr	_uiInfo
7403                     ; 1608 	if( _updateBit != 0 && _updateTimer != __timer1s )
7405  17ba c60006        	ld	a,__updateBit
7406  17bd 276e          	jreq	L1132
7408  17bf c60005        	ld	a,__updateTimer
7409  17c2 c10000        	cp	a,___timer1s
7410  17c5 2766          	jreq	L1132
7411                     ; 1610 		_updateTimer = __timer1s;
7413  17c7 5500000005    	mov	__updateTimer,___timer1s
7414                     ; 1611 		_updateCount--;
7416  17cc 725a0007      	dec	__updateCount
7417                     ; 1612 		if( _updateCount == 0 )
7419  17d0 265b          	jrne	L1132
7420                     ; 1614 			if( (_updateBit&BIT_REPEAT) != 0 )	{FW_REPEAT(uiInfo.repeat);	}
7422  17d2 720100060a    	btjf	__updateBit,#0,L5132
7425  17d7 c6000c        	ld	a,_uiInfo+12
7426  17da 97            	ld	xl,a
7427  17db a60f          	ld	a,#15
7428  17dd 95            	ld	xh,a
7429  17de cd0000        	call	_file_write
7431  17e1               L5132:
7432                     ; 1615 			if( (_updateBit&BIT_RESERVE) != 0 )	{FW_RESERVE(uiInfo.reserve);}
7434  17e1 720300060a    	btjf	__updateBit,#1,L7132
7437  17e6 c6000d        	ld	a,_uiInfo+13
7438  17e9 97            	ld	xl,a
7439  17ea a610          	ld	a,#16
7440  17ec 95            	ld	xh,a
7441  17ed cd0000        	call	_file_write
7443  17f0               L7132:
7444                     ; 1616 			if( (_updateBit&BIT_TSETUP) != 0 )	{FW_TSETUP(uiInfo.tSetup);}
7446  17f0 720500060a    	btjf	__updateBit,#2,L1232
7449  17f5 c6000e        	ld	a,_uiInfo+14
7450  17f8 97            	ld	xl,a
7451  17f9 a611          	ld	a,#17
7452  17fb 95            	ld	xh,a
7453  17fc cd0000        	call	_file_write
7455  17ff               L1232:
7456                     ; 1617 			if( (_updateBit&BIT_DISPMODE) != 0 ){
7458  17ff 7207000618    	btjf	__updateBit,#3,L3232
7459                     ; 1618 				if (uiInfo.mode == SETTING_MODE_SUB) {
7461  1804 c60008        	ld	a,_uiInfo+8
7462  1807 2609          	jrne	L5232
7463                     ; 1619 					if (_disp_mode != RC_MODE_OUT) {
7465  1809 c60000        	ld	a,__disp_mode
7466  180c a102          	cp	a,#2
7467  180e 270c          	jreq	L3232
7468                     ; 1620 						FW_DISPMODE(_disp_mode);
7470  1810 2003          	jp	LC033
7471  1812               L5232:
7472                     ; 1623 					FW_DISPMODE(_disp_mode);
7474  1812 c60000        	ld	a,__disp_mode
7475  1815               LC033:
7477  1815 97            	ld	xl,a
7478  1816 a629          	ld	a,#41
7479  1818 95            	ld	xh,a
7480  1819 cd0000        	call	_file_write
7482  181c               L3232:
7483                     ; 1627 			if( (_updateBit&BIT_REPEAT) != 0 || (_updateBit&BIT_RESERVE) != 0 )	
7485  181c 7200000605    	btjt	__updateBit,#0,L5332
7487  1821 7203000603    	btjf	__updateBit,#1,L3332
7488  1826               L5332:
7489                     ; 1629 				timerEventClear();
7491  1826 cd0000        	call	_timerEventClear
7493  1829               L3332:
7494                     ; 1632 			_updateBit = 0;
7496  1829 725f0006      	clr	__updateBit
7497  182d               L1132:
7498                     ; 1635 	if( key==0 )
7500  182d 7b01          	ld	a,(OFST+1,sp)
7501  182f 2602          	jrne	L7332
7502                     ; 1636 		return;
7505  1831 84            	pop	a
7506  1832 81            	ret	
7507  1833               L7332:
7508                     ; 1638 	if( key == _keypwMaster[_keypwIndexMaster] )
7510  1833 c6000b        	ld	a,__keypwIndexMaster
7511  1836 5f            	clrw	x
7512  1837 97            	ld	xl,a
7513  1838 d60000        	ld	a,(__keypwMaster,x)
7514  183b 1101          	cp	a,(OFST+1,sp)
7515  183d 2622          	jrne	L1432
7516                     ; 1640 		_keypwIndexMaster++;
7518  183f 725c000b      	inc	__keypwIndexMaster
7519                     ; 1641 		if( _keypwIndexMaster == 6 )
7521  1843 c6000b        	ld	a,__keypwIndexMaster
7522  1846 a106          	cp	a,#6
7523  1848 2625          	jrne	L5432
7524                     ; 1643 			_keypwIndexMaster = 0;
7526  184a 725f000b      	clr	__keypwIndexMaster
7527                     ; 1644 			uiInfo.id = 1;
7529  184e 35010004      	mov	_uiInfo+4,#1
7530                     ; 1645 			uiInfo.mode = 1;
7532  1852 35010008      	mov	_uiInfo+8,#1
7533                     ; 1646 			uiInfo.controlMode = 0;
7535  1856 725f0009      	clr	_uiInfo+9
7536                     ; 1647 			copy_info(9);
7538  185a a609          	ld	a,#9
7539  185c cd167b        	call	_copy_info
7541  185f 200e          	jra	L5432
7542  1861               L1432:
7543                     ; 1652 		_keypwIndexMaster = 0;
7545  1861 725f000b      	clr	__keypwIndexMaster
7546                     ; 1653 		if( key == _keypwMaster[_keypwIndexMaster] )
7548  1865 7b01          	ld	a,(OFST+1,sp)
7549  1867 a104          	cp	a,#4
7550  1869 2604          	jrne	L5432
7551                     ; 1654 			_keypwIndexMaster++;
7553  186b 725c000b      	inc	__keypwIndexMaster
7554  186f               L5432:
7555                     ; 1657 	if( key == _keypwMaster2[_keypwIndexMaster2] )
7557  186f c6000c        	ld	a,__keypwIndexMaster2
7558  1872 5f            	clrw	x
7559  1873 97            	ld	xl,a
7560  1874 d60006        	ld	a,(__keypwMaster2,x)
7561  1877 1101          	cp	a,(OFST+1,sp)
7562  1879 2622          	jrne	L1532
7563                     ; 1659 		_keypwIndexMaster2++;
7565  187b 725c000c      	inc	__keypwIndexMaster2
7566                     ; 1660 		if( _keypwIndexMaster2 == 6 )
7568  187f c6000c        	ld	a,__keypwIndexMaster2
7569  1882 a106          	cp	a,#6
7570  1884 2625          	jrne	L5532
7571                     ; 1662 			_keypwIndexMaster2 = 0;
7573  1886 725f000c      	clr	__keypwIndexMaster2
7574                     ; 1663 			uiInfo.id = 1;
7576  188a 35010004      	mov	_uiInfo+4,#1
7577                     ; 1664 			uiInfo.mode = 1;
7579  188e 35010008      	mov	_uiInfo+8,#1
7580                     ; 1665 			uiInfo.controlMode = 1;
7582  1892 35010009      	mov	_uiInfo+9,#1
7583                     ; 1666 			copy_info(9);
7585  1896 a609          	ld	a,#9
7586  1898 cd167b        	call	_copy_info
7588  189b 200e          	jra	L5532
7589  189d               L1532:
7590                     ; 1671 		_keypwIndexMaster2 = 0;
7592  189d 725f000c      	clr	__keypwIndexMaster2
7593                     ; 1672 		if( key == _keypwMaster2[_keypwIndexMaster2] )
7595  18a1 7b01          	ld	a,(OFST+1,sp)
7596  18a3 a104          	cp	a,#4
7597  18a5 2604          	jrne	L5532
7598                     ; 1673 			_keypwIndexMaster2++;
7600  18a7 725c000c      	inc	__keypwIndexMaster2
7601  18ab               L5532:
7602                     ; 1676 	if( key == 0x88 )
7604  18ab 7b01          	ld	a,(OFST+1,sp)
7605  18ad a188          	cp	a,#136
7606  18af 261a          	jrne	L1632
7607                     ; 1678 		uiInfo.enc = 0;
7609  18b1 725f0000      	clr	_uiInfo
7610                     ; 1679 		if( uiInfo.mode == 0 )
7612  18b5 c60008        	ld	a,_uiInfo+8
7613  18b8 2604          	jrne	L3632
7614                     ; 1680 			uiInfo.id = 2;
7616  18ba 35020004      	mov	_uiInfo+4,#2
7617  18be               L3632:
7618                     ; 1684 		copy_info(uiInfo.mode==0 ? 131 : 133);
7620  18be c60008        	ld	a,_uiInfo+8
7621  18c1 2604          	jrne	L4041
7622  18c3 a683          	ld	a,#131
7623  18c5 2013          	jra	LC034
7624  18c7               L4041:
7625  18c7 a685          	ld	a,#133
7628  18c9 200f          	jp	LC034
7629  18cb               L1632:
7630                     ; 1686 	else if( key == 0x89 && uiInfo.mode == 1 )
7632  18cb a189          	cp	a,#137
7633  18cd 260e          	jrne	L5632
7635  18cf c60008        	ld	a,_uiInfo+8
7636  18d2 4a            	dec	a
7637  18d3 2608          	jrne	L5632
7638                     ; 1688 		uiInfo.enc = 0;
7640  18d5 c70000        	ld	_uiInfo,a
7641                     ; 1690 		copy_info(41);
7643  18d8 a629          	ld	a,#41
7644  18da               LC034:
7645  18da cd167b        	call	_copy_info
7647  18dd               L5632:
7648                     ; 1711 	if( key == _keypwClient[_keypwIndexClient] )
7650  18dd c6000d        	ld	a,__keypwIndexClient
7651  18e0 5f            	clrw	x
7652  18e1 97            	ld	xl,a
7653  18e2 d6000c        	ld	a,(__keypwClient,x)
7654  18e5 1101          	cp	a,(OFST+1,sp)
7655  18e7 261e          	jrne	L1732
7656                     ; 1713 		_keypwIndexClient++;
7658  18e9 725c000d      	inc	__keypwIndexClient
7659                     ; 1714 		if( _keypwIndexClient == 6 )
7661  18ed c6000d        	ld	a,__keypwIndexClient
7662  18f0 a106          	cp	a,#6
7663  18f2 2621          	jrne	L5732
7664                     ; 1716 			_keypwIndexClient = 0;
7666  18f4 725f000d      	clr	__keypwIndexClient
7667                     ; 1717 			uiInfo.id = 2;
7669  18f8 35020004      	mov	_uiInfo+4,#2
7670                     ; 1718 			uiInfo.mode = 0;
7672  18fc 725f0008      	clr	_uiInfo+8
7673                     ; 1719 			copy_info(101);
7675  1900 a665          	ld	a,#101
7676  1902 cd167b        	call	_copy_info
7678  1905 200e          	jra	L5732
7679  1907               L1732:
7680                     ; 1724 		_keypwIndexClient = 0;
7682  1907 725f000d      	clr	__keypwIndexClient
7683                     ; 1725 		if( key == _keypwClient[_keypwIndexClient] )
7685  190b 7b01          	ld	a,(OFST+1,sp)
7686  190d a104          	cp	a,#4
7687  190f 2604          	jrne	L5732
7688                     ; 1726 			_keypwIndexClient++;
7690  1911 725c000d      	inc	__keypwIndexClient
7691  1915               L5732:
7692                     ; 1728 }
7695  1915 84            	pop	a
7696  1916 81            	ret	
8413                     	xref	_timerEventClear
8414                     	xref	__boiler_type
8415                     	xdef	_disp_statusCb
8416                     	xdef	_disp_485
8417                     	xdef	_disp_set_state
8418                     	xdef	_disp_write_file
8419                     	xdef	__d485_id
8420                     	xref	_debug_br
8421                     	xref	_debug_hn
8422                     	xref	__remote
8423                     	xref	_getCurrTemp
8424                     	xdef	_disp_status_command
8425                     	xdef	_disp_status_error
8426                     	xref	__boiler_fire
8427                     	xdef	_timerClear
8428                     	xdef	__timFlag
8429                     	xdef	__tim30min
8430                     	xdef	__tim1min
8431                     	xdef	___func_rc_timerout2
8432                     	xdef	___func_rc_timerout1
8433                     	xdef	___func_rc_timerout
8434                     	xref	___func_rc_settingCb
8435                     	xdef	_disp_status_plc
8436                     	xdef	_disp_status_valveinfo_sub
8437                     	xdef	__ui_
8438                     	xdef	___lpm
8439                     	xdef	_disp_status_houseCapa
8440                     	xdef	_disp_status_valveCount
8441                     	xdef	_disp_next
8442                     	xdef	_file_update
8443                     	xdef	__keypwIndexClient
8444                     	xdef	__keypwIndexMaster2
8445                     	xdef	__keypwIndexMaster
8446                     	xdef	__keypwClient
8447                     	xdef	__keypwMaster2
8448                     	xdef	__keypwMaster
8449                     	xdef	_copy_info
8450                     	xdef	_copy_infoSet
8451                     	xref	__backlight
8452                     	xref	_ui_error
8453                     	xref	_error_type
8454                     	xref	_error
8455                     	xdef	__backup_backlight2
8456                     	xdef	__backup_backlight
8457                     	xdef	__disp_temp
8458                     	xref	_func_rc_setting
8459                     	xref	_func_rc_recover
8460                     	xref	_func_rc_command
8461                     	xref	__boiler_water_heat
8462                     	xref	__boiler_water_shower
8463                     	xdef	_file_update2
8464                     	xdef	__updateCount
8465                     	xdef	__updateBit
8466                     	xdef	__updateTimer
8467                     	xref	__key_blink
8468                     	xref	__key_sec
8469                     	xref	__disp_mode2
8470                     	xref	__disp_mode
8471                     	xdef	_disp_status_curr_only
8472                     	xdef	_disp_status_loop_init
8473                     	xdef	_disp_status_loop_message
8474                     	xdef	_disp_status_exit
8475                     	xdef	_disp_status_run
8476                     	xdef	_disp_status_valveinfo
8477                     	xdef	_disp_status_temp_offset
8478                     	xdef	_disp_status_lpm
8479                     	xdef	_disp_status_po_type
8480                     	xdef	_disp_status_cntl_op
8481                     	xdef	_disp_status_run_op
8482                     	xdef	_disp_status_toffset
8483                     	xdef	_disp_status_id
8484                     	xdef	_clear_npos2
8485                     	xdef	_clear_npos1
8486                     	xdef	__dsPrev
8487                     	xdef	__dsCount
8488                     	xdef	__ds
8489                     	xdef	_ui_Open
8490                     	xref	_disp_status_loop_client
8491                     	xref	_disp_status_loop_host
8492                     	xdef	___sRoom
8493                     	xdef	___sInfo
8494                     	xdef	___sDn
8495                     	xdef	___sUp
8496                     	xdef	___s
8497                     	xref	_lcd_blink_npos
8498                     	xref	_lcd_blink_npos_clear
8499                     	xref	_lcd_disp_info_fire
8500                     	xref	_ui_disp_clear_tSetup
8501                     	xref	_ui_disp_temp_mark
8502                     	xref	_ui_disp_temp_curr
8503                     	xref	_ui_disp_temp_setup
8504                     	xref	_lcd_blinkCb
8505                     	xref	_lcd_blink_item
8506                     	xref	_lcd_blink_clear
8507                     	xdef	_disp_status
8508                     	xref	_lcd_clear_npos
8509                     	xref	_lcd_disp_rid
8510                     	xref	_lcd_disp_err
8511                     	xref	_lcd_disp_n
8512                     	xref	_lcd_clear
8513                     	xref	_lcd_disp_setup_mode_each
8514                     	xref	_lcd_disp_setup_mode_local
8515                     	xref	_lcd_disp_setup_valve
8516                     	xref	_lcd_disp_setup_id
8517                     	xref	_lcd_disp_setup_mode
8518                     	xref	_lcd_disp_setup_run
8519                     	xref	_lcd_disp_setup_c
8520                     	xref	_lcd_disp_plc
8521                     	xref	_lcd_disp_cnt_sub
8522                     	xref	_lcd_disp_cnt_host
8523                     	xref	_lcd_disp_freset
8524                     	xref	_lcd_disp_mir1
8525                     	xref	_lcd_disp_setup_cntl_tab
8526                     	xref	_lcd_disp_setup_cntl_2motor
8527                     	xref	_lcd_disp_setup_cntl_po
8528                     	xref	_lcd_disp_setup_cntl_on
8529                     	xref	_lcd_disp_setup_cntl_op
8530                     	xref	_lcd_disp_setup_len
8531                     	xref	_lcd_disp_setup_temp_offset
8532                     	xref	_lcd_disp_setup_lpm
8533                     	xref	_lcd_clear_btn
8534                     	xref	_iLF_DEF
8535                     	xref	_bLF_DEF
8536                     	switch	.bss
8537  0000               _uiInfo:
8538  0000 000000000000  	ds.b	101
8539                     	xdef	_uiInfo
8540  0065               _uiInfoSet:
8541  0065 000000000000  	ds.b	54
8542                     	xdef	_uiInfoSet
8543                     	xref	_file_read
8544                     	xref	_file_write
8545                     	xref	___timer1s
8546                     	xref	__t20ms
8547                     	xref.b	c_x
8567                     	xref	c_smodx
8568                     	end
