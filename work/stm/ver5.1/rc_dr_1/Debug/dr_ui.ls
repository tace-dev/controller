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
  78                     ; 57 void	ui_Open(void)
  78                     ; 58 {
  80                     	switch	.text
  81  0000               _ui_Open:
  85                     ; 101 	uiInfo.cntlMode = FW_GET_CNTLMODE;
  87  0000 a608          	ld	a,#8
  88  0002 cd0000        	call	_file_read
  90  0005 c70003        	ld	_uiInfo+3,a
  91                     ; 102 	uiInfo.id = FW_GET_ID;
  93  0008 a60a          	ld	a,#10
  94  000a cd0000        	call	_file_read
  96  000d c70004        	ld	_uiInfo+4,a
  97                     ; 103 	uiInfo.cnt = FW_GET_CNT;
  99  0010 a60b          	ld	a,#11
 100  0012 cd0000        	call	_file_read
 102  0015 c70005        	ld	_uiInfo+5,a
 103                     ; 104 	uiInfo.cnt_sub = FW_GET_CNT_SUB;
 105  0018 a62b          	ld	a,#43
 106  001a cd0000        	call	_file_read
 108  001d c70006        	ld	_uiInfo+6,a
 109                     ; 105 	UI_SET(uiInfo.cnt, 8)
 111  0020 c60005        	ld	a,_uiInfo+5
 112  0023 2605          	jrne	L12
 115  0025 a608          	ld	a,#8
 116  0027 c70005        	ld	_uiInfo+5,a
 117  002a               L12:
 118                     ; 106 	UI_SET(uiInfo.cnt_sub, 8)
 120  002a 725d0006      	tnz	_uiInfo+6
 121  002e 2604          	jrne	L32
 124  0030 35080006      	mov	_uiInfo+6,#8
 125  0034               L32:
 126                     ; 107 	if( uiInfo.cnt >= 8 )	uiInfo.cnt = 8;
 128  0034 a108          	cp	a,#8
 129  0036 2504          	jrult	L52
 132  0038 35080005      	mov	_uiInfo+5,#8
 133  003c               L52:
 134                     ; 108 	if( uiInfo.cnt_sub >= 8 )	uiInfo.cnt_sub = 8;
 136  003c c60006        	ld	a,_uiInfo+6
 137  003f a108          	cp	a,#8
 138  0041 2504          	jrult	L72
 141  0043 35080006      	mov	_uiInfo+6,#8
 142  0047               L72:
 143                     ; 110 	uiInfo.opMode = FW_GET_OPMODE;
 145  0047 a60c          	ld	a,#12
 146  0049 cd0000        	call	_file_read
 148  004c c70007        	ld	_uiInfo+7,a
 149                     ; 111 	uiInfo.mode = FW_GET_MODE;
 151  004f a609          	ld	a,#9
 152  0051 cd0000        	call	_file_read
 154  0054 c70008        	ld	_uiInfo+8,a
 155                     ; 113 	uiInfo.controlMode = FW_GET_CNT_MODE;
 157  0057 a60d          	ld	a,#13
 158  0059 cd0000        	call	_file_read
 160  005c c70009        	ld	_uiInfo+9,a
 161                     ; 114 	uiInfo.valve = FW_GET_VALVE;
 163  005f a60e          	ld	a,#14
 164  0061 cd0000        	call	_file_read
 166  0064 c7000a        	ld	_uiInfo+10,a
 167                     ; 115 	uiInfo.valve_sub = FW_GET_VALVE_SUB;
 169  0067 a62c          	ld	a,#44
 170  0069 cd0000        	call	_file_read
 172  006c c7000b        	ld	_uiInfo+11,a
 173                     ; 116 	UI_SET(uiInfo.valve, 8)
 175  006f c6000a        	ld	a,_uiInfo+10
 176  0072 2605          	jrne	L13
 179  0074 a608          	ld	a,#8
 180  0076 c7000a        	ld	_uiInfo+10,a
 181  0079               L13:
 182                     ; 117 	UI_SET(uiInfo.valve_sub, 8)
 184  0079 725d000b      	tnz	_uiInfo+11
 185  007d 2604          	jrne	L33
 188  007f 3508000b      	mov	_uiInfo+11,#8
 189  0083               L33:
 190                     ; 118 	if( uiInfo.valve >= 8 )	uiInfo.valve = 8;
 192  0083 a108          	cp	a,#8
 193  0085 2504          	jrult	L53
 196  0087 3508000a      	mov	_uiInfo+10,#8
 197  008b               L53:
 198                     ; 119 	if( uiInfo.valve_sub >= 8 )	uiInfo.valve_sub = 8;
 200  008b c6000b        	ld	a,_uiInfo+11
 201  008e a108          	cp	a,#8
 202  0090 2504          	jrult	L73
 205  0092 3508000b      	mov	_uiInfo+11,#8
 206  0096               L73:
 207                     ; 121 	uiInfo.repeat = FW_GET_REPEAT;	
 209  0096 a60f          	ld	a,#15
 210  0098 cd0000        	call	_file_read
 212  009b c7000c        	ld	_uiInfo+12,a
 213                     ; 122 	UI_SET(uiInfo.repeat, 5)
 215  009e 2604          	jrne	L14
 218  00a0 3505000c      	mov	_uiInfo+12,#5
 219  00a4               L14:
 220                     ; 123 	uiInfo.reserve = FW_GET_RESERVE;	
 222  00a4 a610          	ld	a,#16
 223  00a6 cd0000        	call	_file_read
 225  00a9 c7000d        	ld	_uiInfo+13,a
 226                     ; 124 	UI_SET(uiInfo.reserve, 24)
 228  00ac 2604          	jrne	L34
 231  00ae 3518000d      	mov	_uiInfo+13,#24
 232  00b2               L34:
 233                     ; 125 	uiInfo.tSetup = FW_GET_TSETUP;	
 235  00b2 a611          	ld	a,#17
 236  00b4 cd0000        	call	_file_read
 238  00b7 c7000e        	ld	_uiInfo+14,a
 239                     ; 126 	UI_SET(uiInfo.tSetup, 50)
 241  00ba 2604          	jrne	L54
 244  00bc 3532000e      	mov	_uiInfo+14,#50
 245  00c0               L54:
 246                     ; 127 	uiInfo.poType = FW_GET_POTYPE;	
 248  00c0 a612          	ld	a,#18
 249  00c2 cd0000        	call	_file_read
 251  00c5 c7000f        	ld	_uiInfo+15,a
 252                     ; 128 	uiInfo.houseCapa = FW_GET_HOUSECAPA;
 254  00c8 a613          	ld	a,#19
 255  00ca cd0000        	call	_file_read
 257  00cd c70010        	ld	_uiInfo+16,a
 258                     ; 129 	UI_SET(uiInfo.houseCapa, 160)
 260  00d0 2604          	jrne	L74
 263  00d2 35a00010      	mov	_uiInfo+16,#160
 264  00d6               L74:
 265                     ; 130 	uiInfo.tOffset = FW_GET_TOFFSET;
 267  00d6 a614          	ld	a,#20
 268  00d8 cd0000        	call	_file_read
 270  00db c70011        	ld	_uiInfo+17,a
 271                     ; 131 	UI_SET(uiInfo.tOffset, 100);
 273  00de 2604          	jrne	L15
 276  00e0 35640011      	mov	_uiInfo+17,#100
 277  00e4               L15:
 278                     ; 133 	uiInfo.tempOffset = FW_GET_TEMPOFFSET;
 281  00e4 a627          	ld	a,#39
 282  00e6 cd0000        	call	_file_read
 284  00e9 c70012        	ld	_uiInfo+18,a
 285                     ; 134 	UI_SET(uiInfo.tempOffset, 80)
 287  00ec 2604          	jrne	L35
 290  00ee 35500012      	mov	_uiInfo+18,#80
 291  00f2               L35:
 292                     ; 135 	uiInfo.lpmType = FW_GET_LPM;
 294  00f2 a628          	ld	a,#40
 295  00f4 cd0000        	call	_file_read
 297  00f7 c70013        	ld	_uiInfo+19,a
 298                     ; 136 	uiInfo.lpmType_sub = FW_GET_LPM_SUB;
 300  00fa a62d          	ld	a,#45
 301  00fc cd0000        	call	_file_read
 303  00ff c70014        	ld	_uiInfo+20,a
 304                     ; 137 	UI_SET(uiInfo.lpmType, 8)
 306  0102 c60013        	ld	a,_uiInfo+19
 307  0105 2605          	jrne	L55
 310  0107 a608          	ld	a,#8
 311  0109 c70013        	ld	_uiInfo+19,a
 312  010c               L55:
 313                     ; 138 	UI_SET(uiInfo.lpmType_sub, 8)
 315  010c 725d0014      	tnz	_uiInfo+20
 316  0110 2604          	jrne	L75
 319  0112 35080014      	mov	_uiInfo+20,#8
 320  0116               L75:
 321                     ; 139 	if( uiInfo.lpmType >= 8 )	uiInfo.lpmType = 8;
 323  0116 a108          	cp	a,#8
 324  0118 2504          	jrult	L16
 327  011a 35080013      	mov	_uiInfo+19,#8
 328  011e               L16:
 329                     ; 140 	if( uiInfo.lpmType_sub >= 8 )	uiInfo.lpmType_sub = 8;
 331  011e c60014        	ld	a,_uiInfo+20
 332  0121 a108          	cp	a,#8
 333  0123 2504          	jrult	L36
 336  0125 35080014      	mov	_uiInfo+20,#8
 337  0129               L36:
 338                     ; 142 	_disp_mode2 = FW_GET_DISPMODE;
 340  0129 a629          	ld	a,#41
 341  012b cd0000        	call	_file_read
 343  012e c70000        	ld	__disp_mode2,a
 344                     ; 143 	_disp_mode = 0xff;
 346  0131 35ff0000      	mov	__disp_mode,#255
 347                     ; 145 	uiInfo.valve_len[0] = FW_GET_VL_1;
 349  0135 a615          	ld	a,#21
 350  0137 cd0000        	call	_file_read
 352  013a c70015        	ld	_uiInfo+21,a
 353                     ; 146 	uiInfo.valve_len[1] = FW_GET_VL_2;
 355  013d a616          	ld	a,#22
 356  013f cd0000        	call	_file_read
 358  0142 c70016        	ld	_uiInfo+22,a
 359                     ; 147 	uiInfo.valve_len[2] = FW_GET_VL_3;
 361  0145 a617          	ld	a,#23
 362  0147 cd0000        	call	_file_read
 364  014a c70017        	ld	_uiInfo+23,a
 365                     ; 148 	uiInfo.valve_len[3] = FW_GET_VL_4;
 367  014d a618          	ld	a,#24
 368  014f cd0000        	call	_file_read
 370  0152 c70018        	ld	_uiInfo+24,a
 371                     ; 149 	uiInfo.valve_len[4] = FW_GET_VL_5;
 373  0155 a619          	ld	a,#25
 374  0157 cd0000        	call	_file_read
 376  015a c70019        	ld	_uiInfo+25,a
 377                     ; 150 	uiInfo.valve_len[5] = FW_GET_VL_6;
 379  015d a61a          	ld	a,#26
 380  015f cd0000        	call	_file_read
 382  0162 c7001a        	ld	_uiInfo+26,a
 383                     ; 151 	uiInfo.valve_len[6] = FW_GET_VL_7;
 385  0165 a61b          	ld	a,#27
 386  0167 cd0000        	call	_file_read
 388  016a c7001b        	ld	_uiInfo+27,a
 389                     ; 152 	uiInfo.valve_len[7] = FW_GET_VL_8;
 391  016d a61c          	ld	a,#28
 392  016f cd0000        	call	_file_read
 394  0172 c7001c        	ld	_uiInfo+28,a
 395                     ; 154 	uiInfo.valve_rc[0] = FW_GET_VRC_1;
 397  0175 a61d          	ld	a,#29
 398  0177 cd0000        	call	_file_read
 400  017a c7001d        	ld	_uiInfo+29,a
 401                     ; 155 	uiInfo.valve_rc[1] = FW_GET_VRC_2;
 403  017d a61e          	ld	a,#30
 404  017f cd0000        	call	_file_read
 406  0182 c7001e        	ld	_uiInfo+30,a
 407                     ; 156 	uiInfo.valve_rc[2] = FW_GET_VRC_3;
 409  0185 a61f          	ld	a,#31
 410  0187 cd0000        	call	_file_read
 412  018a c7001f        	ld	_uiInfo+31,a
 413                     ; 157 	uiInfo.valve_rc[3] = FW_GET_VRC_4;
 415  018d a620          	ld	a,#32
 416  018f cd0000        	call	_file_read
 418  0192 c70020        	ld	_uiInfo+32,a
 419                     ; 158 	uiInfo.valve_rc[4] = FW_GET_VRC_5;
 421  0195 a621          	ld	a,#33
 422  0197 cd0000        	call	_file_read
 424  019a c70021        	ld	_uiInfo+33,a
 425                     ; 159 	uiInfo.valve_rc[5] = FW_GET_VRC_6;
 427  019d a622          	ld	a,#34
 428  019f cd0000        	call	_file_read
 430  01a2 c70022        	ld	_uiInfo+34,a
 431                     ; 160 	uiInfo.valve_rc[6] = FW_GET_VRC_7;
 433  01a5 a623          	ld	a,#35
 434  01a7 cd0000        	call	_file_read
 436  01aa c70023        	ld	_uiInfo+35,a
 437                     ; 161 	uiInfo.valve_rc[7] = FW_GET_VRC_8;
 439  01ad a624          	ld	a,#36
 440  01af cd0000        	call	_file_read
 442  01b2 c70024        	ld	_uiInfo+36,a
 443                     ; 163 	uiInfo.valve_sub_len[0] = FW_GET_VL_1_SUB;
 445  01b5 a62e          	ld	a,#46
 446  01b7 cd0000        	call	_file_read
 448  01ba c70025        	ld	_uiInfo+37,a
 449                     ; 164 	uiInfo.valve_sub_len[1] = FW_GET_VL_2_SUB;
 451  01bd a62f          	ld	a,#47
 452  01bf cd0000        	call	_file_read
 454  01c2 c70026        	ld	_uiInfo+38,a
 455                     ; 165 	uiInfo.valve_sub_len[2] = FW_GET_VL_3_SUB;
 457  01c5 a630          	ld	a,#48
 458  01c7 cd0000        	call	_file_read
 460  01ca c70027        	ld	_uiInfo+39,a
 461                     ; 166 	uiInfo.valve_sub_len[3] = FW_GET_VL_4_SUB;
 463  01cd a631          	ld	a,#49
 464  01cf cd0000        	call	_file_read
 466  01d2 c70028        	ld	_uiInfo+40,a
 467                     ; 167 	uiInfo.valve_sub_len[4] = FW_GET_VL_5_SUB;
 469  01d5 a632          	ld	a,#50
 470  01d7 cd0000        	call	_file_read
 472  01da c70029        	ld	_uiInfo+41,a
 473                     ; 168 	uiInfo.valve_sub_len[5] = FW_GET_VL_6_SUB;
 475  01dd a633          	ld	a,#51
 476  01df cd0000        	call	_file_read
 478  01e2 c7002a        	ld	_uiInfo+42,a
 479                     ; 169 	uiInfo.valve_sub_len[6] = FW_GET_VL_7_SUB;
 481  01e5 a634          	ld	a,#52
 482  01e7 cd0000        	call	_file_read
 484  01ea c7002b        	ld	_uiInfo+43,a
 485                     ; 170 	uiInfo.valve_sub_len[7] = FW_GET_VL_8_SUB;
 487  01ed a635          	ld	a,#53
 488  01ef cd0000        	call	_file_read
 490  01f2 c7002c        	ld	_uiInfo+44,a
 491                     ; 172 	uiInfo.valve_sub_rc[0] = FW_GET_VRC_1_SUB;
 493  01f5 a636          	ld	a,#54
 494  01f7 cd0000        	call	_file_read
 496  01fa c7002d        	ld	_uiInfo+45,a
 497                     ; 173 	uiInfo.valve_sub_rc[1] = FW_GET_VRC_2_SUB;
 499  01fd a637          	ld	a,#55
 500  01ff cd0000        	call	_file_read
 502  0202 c7002e        	ld	_uiInfo+46,a
 503                     ; 174 	uiInfo.valve_sub_rc[2] = FW_GET_VRC_3_SUB;
 505  0205 a638          	ld	a,#56
 506  0207 cd0000        	call	_file_read
 508  020a c7002f        	ld	_uiInfo+47,a
 509                     ; 175 	uiInfo.valve_sub_rc[3] = FW_GET_VRC_4_SUB;
 511  020d a639          	ld	a,#57
 512  020f cd0000        	call	_file_read
 514  0212 c70030        	ld	_uiInfo+48,a
 515                     ; 176 	uiInfo.valve_sub_rc[4] = FW_GET_VRC_5_SUB;
 517  0215 a63a          	ld	a,#58
 518  0217 cd0000        	call	_file_read
 520  021a c70031        	ld	_uiInfo+49,a
 521                     ; 177 	uiInfo.valve_sub_rc[5] = FW_GET_VRC_6_SUB;
 523  021d a63b          	ld	a,#59
 524  021f cd0000        	call	_file_read
 526  0222 c70032        	ld	_uiInfo+50,a
 527                     ; 178 	uiInfo.valve_sub_rc[6] = FW_GET_VRC_7_SUB;
 529  0225 a63c          	ld	a,#60
 530  0227 cd0000        	call	_file_read
 532  022a c70033        	ld	_uiInfo+51,a
 533                     ; 179 	uiInfo.valve_sub_rc[7] = FW_GET_VRC_8_SUB;
 535  022d a63d          	ld	a,#61
 536  022f cd0000        	call	_file_read
 538  0232 c70034        	ld	_uiInfo+52,a
 539                     ; 181 	_boiler_water_shower = FW_GET_B_SHOWER;
 541  0235 a625          	ld	a,#37
 542  0237 cd0000        	call	_file_read
 544  023a c70000        	ld	__boiler_water_shower,a
 545                     ; 182 	UI_SET(_boiler_water_shower, 50)
 547  023d 2604          	jrne	L56
 550  023f 35320000      	mov	__boiler_water_shower,#50
 551  0243               L56:
 552                     ; 183 	_boiler_water_heat = FW_GET_B_HEAT;
 554  0243 a626          	ld	a,#38
 555  0245 cd0000        	call	_file_read
 557  0248 c70000        	ld	__boiler_water_heat,a
 558                     ; 184 	UI_SET(_boiler_water_heat, 70)
 560  024b 2604          	jrne	L76
 563  024d 35460000      	mov	__boiler_water_heat,#70
 564  0251               L76:
 565                     ; 185 	_backlight = FW_GET_BACKLIGHT;
 567  0251 a62a          	ld	a,#42
 568  0253 cd0000        	call	_file_read
 570  0256 c70000        	ld	__backlight,a
 571                     ; 186 	UI_SET(_backlight, 3)
 573  0259 2604          	jrne	L17
 576  025b 35030000      	mov	__backlight,#3
 577  025f               L17:
 578                     ; 188 	_backup_backlight = 0;
 580  025f 725f0009      	clr	__backup_backlight
 581                     ; 189 }
 584  0263 81            	ret	
 587                     .const:	section	.text
 588  0000               __keypwMaster:
 589  0000 04            	dc.b	4
 590  0001 03            	dc.b	3
 591  0002 04            	dc.b	4
 592  0003 03            	dc.b	3
 593  0004 01            	dc.b	1
 594  0005 01            	dc.b	1
 595  0006               __keypwMaster2:
 596  0006 04            	dc.b	4
 597  0007 03            	dc.b	3
 598  0008 04            	dc.b	4
 599  0009 03            	dc.b	3
 600  000a 01            	dc.b	1
 601  000b 02            	dc.b	2
 602  000c               __keypwClient:
 603  000c 04            	dc.b	4
 604  000d 03            	dc.b	3
 605  000e 04            	dc.b	4
 606  000f 03            	dc.b	3
 607  0010 01            	dc.b	1
 608  0011 03            	dc.b	3
 609  0012               __keypwDefault:
 610  0012 04            	dc.b	4
 611  0013 03            	dc.b	3
 612  0014 04            	dc.b	4
 613  0015 03            	dc.b	3
 614  0016 01            	dc.b	1
 615  0017 04            	dc.b	4
 616                     	switch	.data
 617  000a               __keypwIndexMaster:
 618  000a 00            	dc.b	0
 619  000b               __keypwIndexMaster2:
 620  000b 00            	dc.b	0
 621  000c               __keypwIndexClient:
 622  000c 00            	dc.b	0
 623  000d               __keypwIndexDefault:
 624  000d 00            	dc.b	0
 625  000e               __ds:
 626  000e 64            	dc.b	100
 627  000f               __dsCount:
 628  000f 00            	dc.b	0
 629  0010               __dsPrev:
 630  0010 00            	dc.b	0
 662                     ; 212 void	file_update2(uint8_t i)
 662                     ; 213 {
 663                     	switch	.text
 664  0264               _file_update2:
 668                     ; 214 	if( i==0 )	FW_BACKLIGHT(_backlight);
 670  0264 4d            	tnz	a
 671  0265 260a          	jrne	L701
 674  0267 c60000        	ld	a,__backlight
 675  026a 97            	ld	xl,a
 676  026b a62a          	ld	a,#42
 677  026d 95            	ld	xh,a
 678  026e cd0000        	call	_file_write
 680  0271               L701:
 681                     ; 215 }
 684  0271 81            	ret	
 712                     ; 253 void	file_update(void)
 712                     ; 254 {
 713                     	switch	.text
 714  0272               _file_update:
 718                     ; 255 	FW_CNTLMODE(uiInfo.cntlMode);
 720  0272 c60003        	ld	a,_uiInfo+3
 721  0275 97            	ld	xl,a
 722  0276 a608          	ld	a,#8
 723  0278 95            	ld	xh,a
 724  0279 cd0000        	call	_file_write
 726                     ; 256 	FW_MODE(uiInfo.mode);
 728  027c c60008        	ld	a,_uiInfo+8
 729  027f 97            	ld	xl,a
 730  0280 a609          	ld	a,#9
 731  0282 95            	ld	xh,a
 732  0283 cd0000        	call	_file_write
 734                     ; 257 	FW_ID(uiInfo.id);
 736  0286 c60004        	ld	a,_uiInfo+4
 737  0289 97            	ld	xl,a
 738  028a a60a          	ld	a,#10
 739  028c 95            	ld	xh,a
 740  028d cd0000        	call	_file_write
 742                     ; 258 	FW_CNT(uiInfo.cnt);
 744  0290 c60005        	ld	a,_uiInfo+5
 745  0293 97            	ld	xl,a
 746  0294 a60b          	ld	a,#11
 747  0296 95            	ld	xh,a
 748  0297 cd0000        	call	_file_write
 750                     ; 259 	FW_CNT_SUB(uiInfo.cnt_sub);
 752  029a c60006        	ld	a,_uiInfo+6
 753  029d 97            	ld	xl,a
 754  029e a62b          	ld	a,#43
 755  02a0 95            	ld	xh,a
 756  02a1 cd0000        	call	_file_write
 758                     ; 260 	FW_OPMODE(uiInfo.opMode);
 760  02a4 c60007        	ld	a,_uiInfo+7
 761  02a7 97            	ld	xl,a
 762  02a8 a60c          	ld	a,#12
 763  02aa 95            	ld	xh,a
 764  02ab cd0000        	call	_file_write
 766                     ; 262 	FW_CNT_MODE(uiInfo.controlMode);
 768  02ae c60009        	ld	a,_uiInfo+9
 769  02b1 97            	ld	xl,a
 770  02b2 a60d          	ld	a,#13
 771  02b4 95            	ld	xh,a
 772  02b5 cd0000        	call	_file_write
 774                     ; 263 	FW_VALVE(uiInfo.valve);
 776  02b8 c6000a        	ld	a,_uiInfo+10
 777  02bb 97            	ld	xl,a
 778  02bc a60e          	ld	a,#14
 779  02be 95            	ld	xh,a
 780  02bf cd0000        	call	_file_write
 782                     ; 264 	FW_VALVE_SUB(uiInfo.valve_sub);
 784  02c2 c6000b        	ld	a,_uiInfo+11
 785  02c5 97            	ld	xl,a
 786  02c6 a62c          	ld	a,#44
 787  02c8 95            	ld	xh,a
 788  02c9 cd0000        	call	_file_write
 790                     ; 265 	FW_REPEAT(uiInfo.repeat);
 792  02cc c6000c        	ld	a,_uiInfo+12
 793  02cf 97            	ld	xl,a
 794  02d0 a60f          	ld	a,#15
 795  02d2 95            	ld	xh,a
 796  02d3 cd0000        	call	_file_write
 798                     ; 266 	FW_RESERVE(uiInfo.reserve);
 800  02d6 c6000d        	ld	a,_uiInfo+13
 801  02d9 97            	ld	xl,a
 802  02da a610          	ld	a,#16
 803  02dc 95            	ld	xh,a
 804  02dd cd0000        	call	_file_write
 806                     ; 267 	FW_TSETUP(uiInfo.tSetup);
 808  02e0 c6000e        	ld	a,_uiInfo+14
 809  02e3 97            	ld	xl,a
 810  02e4 a611          	ld	a,#17
 811  02e6 95            	ld	xh,a
 812  02e7 cd0000        	call	_file_write
 814                     ; 269 	FW_POTYPE(uiInfo.poType);
 816  02ea c6000f        	ld	a,_uiInfo+15
 817  02ed 97            	ld	xl,a
 818  02ee a612          	ld	a,#18
 819  02f0 95            	ld	xh,a
 820  02f1 cd0000        	call	_file_write
 822                     ; 270 	FW_HOUSECAPA(uiInfo.houseCapa);
 824  02f4 c60010        	ld	a,_uiInfo+16
 825  02f7 97            	ld	xl,a
 826  02f8 a613          	ld	a,#19
 827  02fa 95            	ld	xh,a
 828  02fb cd0000        	call	_file_write
 830                     ; 271 	FW_TOFFSET(uiInfo.tOffset);
 832  02fe c60011        	ld	a,_uiInfo+17
 833  0301 97            	ld	xl,a
 834  0302 a614          	ld	a,#20
 835  0304 95            	ld	xh,a
 836  0305 cd0000        	call	_file_write
 838                     ; 273 	FW_VALVE_INFOS
 840  0308 c60015        	ld	a,_uiInfo+21
 841  030b 97            	ld	xl,a
 842  030c a615          	ld	a,#21
 843  030e 95            	ld	xh,a
 844  030f cd0000        	call	_file_write
 848  0312 c60016        	ld	a,_uiInfo+22
 849  0315 97            	ld	xl,a
 850  0316 a616          	ld	a,#22
 851  0318 95            	ld	xh,a
 852  0319 cd0000        	call	_file_write
 856  031c c60017        	ld	a,_uiInfo+23
 857  031f 97            	ld	xl,a
 858  0320 a617          	ld	a,#23
 859  0322 95            	ld	xh,a
 860  0323 cd0000        	call	_file_write
 864  0326 c60018        	ld	a,_uiInfo+24
 865  0329 97            	ld	xl,a
 866  032a a618          	ld	a,#24
 867  032c 95            	ld	xh,a
 868  032d cd0000        	call	_file_write
 872  0330 c60019        	ld	a,_uiInfo+25
 873  0333 97            	ld	xl,a
 874  0334 a619          	ld	a,#25
 875  0336 95            	ld	xh,a
 876  0337 cd0000        	call	_file_write
 880  033a c6001a        	ld	a,_uiInfo+26
 881  033d 97            	ld	xl,a
 882  033e a61a          	ld	a,#26
 883  0340 95            	ld	xh,a
 884  0341 cd0000        	call	_file_write
 888  0344 c6001b        	ld	a,_uiInfo+27
 889  0347 97            	ld	xl,a
 890  0348 a61b          	ld	a,#27
 891  034a 95            	ld	xh,a
 892  034b cd0000        	call	_file_write
 896  034e c6001c        	ld	a,_uiInfo+28
 897  0351 97            	ld	xl,a
 898  0352 a61c          	ld	a,#28
 899  0354 95            	ld	xh,a
 900  0355 cd0000        	call	_file_write
 904  0358 c60025        	ld	a,_uiInfo+37
 905  035b 97            	ld	xl,a
 906  035c a62e          	ld	a,#46
 907  035e 95            	ld	xh,a
 908  035f cd0000        	call	_file_write
 912  0362 c60026        	ld	a,_uiInfo+38
 913  0365 97            	ld	xl,a
 914  0366 a62f          	ld	a,#47
 915  0368 95            	ld	xh,a
 916  0369 cd0000        	call	_file_write
 920  036c c60027        	ld	a,_uiInfo+39
 921  036f 97            	ld	xl,a
 922  0370 a630          	ld	a,#48
 923  0372 95            	ld	xh,a
 924  0373 cd0000        	call	_file_write
 928  0376 c60028        	ld	a,_uiInfo+40
 929  0379 97            	ld	xl,a
 930  037a a631          	ld	a,#49
 931  037c 95            	ld	xh,a
 932  037d cd0000        	call	_file_write
 936  0380 c60029        	ld	a,_uiInfo+41
 937  0383 97            	ld	xl,a
 938  0384 a632          	ld	a,#50
 939  0386 95            	ld	xh,a
 940  0387 cd0000        	call	_file_write
 944  038a c6002a        	ld	a,_uiInfo+42
 945  038d 97            	ld	xl,a
 946  038e a633          	ld	a,#51
 947  0390 95            	ld	xh,a
 948  0391 cd0000        	call	_file_write
 952  0394 c6002b        	ld	a,_uiInfo+43
 953  0397 97            	ld	xl,a
 954  0398 a634          	ld	a,#52
 955  039a 95            	ld	xh,a
 956  039b cd0000        	call	_file_write
 960  039e c6002c        	ld	a,_uiInfo+44
 961  03a1 97            	ld	xl,a
 962  03a2 a635          	ld	a,#53
 963  03a4 95            	ld	xh,a
 964  03a5 cd0000        	call	_file_write
 966                     ; 274 	FW_VALVE_RCINFOS
 968  03a8 c6001d        	ld	a,_uiInfo+29
 969  03ab 97            	ld	xl,a
 970  03ac a61d          	ld	a,#29
 971  03ae 95            	ld	xh,a
 972  03af cd0000        	call	_file_write
 976  03b2 c6001e        	ld	a,_uiInfo+30
 977  03b5 97            	ld	xl,a
 978  03b6 a61e          	ld	a,#30
 979  03b8 95            	ld	xh,a
 980  03b9 cd0000        	call	_file_write
 984  03bc c6001f        	ld	a,_uiInfo+31
 985  03bf 97            	ld	xl,a
 986  03c0 a61f          	ld	a,#31
 987  03c2 95            	ld	xh,a
 988  03c3 cd0000        	call	_file_write
 992  03c6 c60020        	ld	a,_uiInfo+32
 993  03c9 97            	ld	xl,a
 994  03ca a620          	ld	a,#32
 995  03cc 95            	ld	xh,a
 996  03cd cd0000        	call	_file_write
1000  03d0 c60021        	ld	a,_uiInfo+33
1001  03d3 97            	ld	xl,a
1002  03d4 a621          	ld	a,#33
1003  03d6 95            	ld	xh,a
1004  03d7 cd0000        	call	_file_write
1008  03da c60022        	ld	a,_uiInfo+34
1009  03dd 97            	ld	xl,a
1010  03de a622          	ld	a,#34
1011  03e0 95            	ld	xh,a
1012  03e1 cd0000        	call	_file_write
1016  03e4 c60023        	ld	a,_uiInfo+35
1017  03e7 97            	ld	xl,a
1018  03e8 a623          	ld	a,#35
1019  03ea 95            	ld	xh,a
1020  03eb cd0000        	call	_file_write
1024  03ee c60024        	ld	a,_uiInfo+36
1025  03f1 97            	ld	xl,a
1026  03f2 a624          	ld	a,#36
1027  03f4 95            	ld	xh,a
1028  03f5 cd0000        	call	_file_write
1032  03f8 c6002d        	ld	a,_uiInfo+45
1033  03fb 97            	ld	xl,a
1034  03fc a636          	ld	a,#54
1035  03fe 95            	ld	xh,a
1036  03ff cd0000        	call	_file_write
1040  0402 c6002e        	ld	a,_uiInfo+46
1041  0405 97            	ld	xl,a
1042  0406 a637          	ld	a,#55
1043  0408 95            	ld	xh,a
1044  0409 cd0000        	call	_file_write
1048  040c c6002f        	ld	a,_uiInfo+47
1049  040f 97            	ld	xl,a
1050  0410 a638          	ld	a,#56
1051  0412 95            	ld	xh,a
1052  0413 cd0000        	call	_file_write
1056  0416 c60030        	ld	a,_uiInfo+48
1057  0419 97            	ld	xl,a
1058  041a a639          	ld	a,#57
1059  041c 95            	ld	xh,a
1060  041d cd0000        	call	_file_write
1064  0420 c60031        	ld	a,_uiInfo+49
1065  0423 97            	ld	xl,a
1066  0424 a63a          	ld	a,#58
1067  0426 95            	ld	xh,a
1068  0427 cd0000        	call	_file_write
1072  042a c60032        	ld	a,_uiInfo+50
1073  042d 97            	ld	xl,a
1074  042e a63b          	ld	a,#59
1075  0430 95            	ld	xh,a
1076  0431 cd0000        	call	_file_write
1080  0434 c60033        	ld	a,_uiInfo+51
1081  0437 97            	ld	xl,a
1082  0438 a63c          	ld	a,#60
1083  043a 95            	ld	xh,a
1084  043b cd0000        	call	_file_write
1088  043e c60034        	ld	a,_uiInfo+52
1089  0441 97            	ld	xl,a
1090  0442 a63d          	ld	a,#61
1091  0444 95            	ld	xh,a
1092  0445 cd0000        	call	_file_write
1094                     ; 276 	FW_B_SHOWER(_boiler_water_shower);
1096  0448 c60000        	ld	a,__boiler_water_shower
1097  044b 97            	ld	xl,a
1098  044c a625          	ld	a,#37
1099  044e 95            	ld	xh,a
1100  044f cd0000        	call	_file_write
1102                     ; 277 	FW_B_HEAT(_boiler_water_heat);
1104  0452 c60000        	ld	a,__boiler_water_heat
1105  0455 97            	ld	xl,a
1106  0456 a626          	ld	a,#38
1107  0458 95            	ld	xh,a
1108  0459 cd0000        	call	_file_write
1110                     ; 278 	FW_TEMPOFFSET(uiInfo.tempOffset);
1112  045c c60012        	ld	a,_uiInfo+18
1113  045f 97            	ld	xl,a
1114  0460 a627          	ld	a,#39
1115  0462 95            	ld	xh,a
1116  0463 cd0000        	call	_file_write
1118                     ; 279 	FW_LPM(uiInfo.lpmType);
1120  0466 c60013        	ld	a,_uiInfo+19
1121  0469 97            	ld	xl,a
1122  046a a628          	ld	a,#40
1123  046c 95            	ld	xh,a
1124  046d cd0000        	call	_file_write
1126                     ; 280 	FW_LPM_SUB(uiInfo.lpmType_sub);
1128  0470 c60014        	ld	a,_uiInfo+20
1129  0473 97            	ld	xl,a
1130  0474 a62d          	ld	a,#45
1131  0476 95            	ld	xh,a
1132  0477 cd0000        	call	_file_write
1134                     ; 281 	FW_DISPMODE(_disp_mode);
1136  047a c60000        	ld	a,__disp_mode
1137  047d 97            	ld	xl,a
1138  047e a629          	ld	a,#41
1139  0480 95            	ld	xh,a
1141                     ; 287 }
1144  0481 cc0000        	jp	_file_write
1168                     ; 289 void	clear_npos1(void)
1168                     ; 290 {
1169                     	switch	.text
1170  0484               _clear_npos1:
1174                     ; 291 	lcd_clear_npos(0, 0);
1176  0484 5f            	clrw	x
1177  0485 cd0000        	call	_lcd_clear_npos
1179                     ; 292 	lcd_clear_npos(1, 0);
1181  0488 ae0100        	ldw	x,#256
1183                     ; 293 }
1186  048b cc0000        	jp	_lcd_clear_npos
1210                     ; 295 void	clear_npos2(void)
1210                     ; 296 {
1211                     	switch	.text
1212  048e               _clear_npos2:
1216                     ; 297 	lcd_clear_npos(2, 0);
1218  048e ae0200        	ldw	x,#512
1219  0491 cd0000        	call	_lcd_clear_npos
1221                     ; 298 	lcd_clear_npos(3, 0);
1223  0494 ae0300        	ldw	x,#768
1225                     ; 299 }
1228  0497 cc0000        	jp	_lcd_clear_npos
1254                     ; 301 void	disp_next(void)
1254                     ; 302 {
1255                     	switch	.text
1256  049a               _disp_next:
1260                     ; 303 	lcd_clear(0);
1262  049a 4f            	clr	a
1263  049b cd0000        	call	_lcd_clear
1265                     ; 304 	_dsCount = 1;
1267  049e 3501000f      	mov	__dsCount,#1
1268                     ; 305 	_dsPrev = 0xff;
1270  04a2 35ff0010      	mov	__dsPrev,#255
1271                     ; 306 }
1274  04a6 81            	ret	
1329                     ; 308 void	disp_status_id(uint8_t key, uint8_t next)
1329                     ; 309 {
1330                     	switch	.text
1331  04a7               _disp_status_id:
1333  04a7 89            	pushw	x
1334  04a8 88            	push	a
1335       00000001      OFST:	set	1
1338                     ; 311 	if( _dsCount == 0 )
1340  04a9 c6000f        	ld	a,__dsCount
1341  04ac 2612          	jrne	L151
1342                     ; 313 		disp_next();
1344  04ae adea          	call	_disp_next
1346                     ; 314 		lcd_disp_setup_id();
1348  04b0 cd0000        	call	_lcd_disp_setup_id
1350                     ; 315 		if( uiInfoSet.id < 2 )
1352  04b3 c60065        	ld	a,_uiInfoSet+1
1353  04b6 a102          	cp	a,#2
1354  04b8 244a          	jruge	L771
1355                     ; 316 			uiInfoSet.id = 2;
1357  04ba 35020065      	mov	_uiInfoSet+1,#2
1358  04be 2044          	jra	L771
1359  04c0               L151:
1360                     ; 320 EncEntry:		
1360                     ; 321 		i = uiInfoSet.id;
1362  04c0 c60065        	ld	a,_uiInfoSet+1
1363  04c3 6b01          	ld	(OFST+0,sp),a
1364                     ; 322 		if( uiInfo.enc != 0 )
1366  04c5 c60000        	ld	a,_uiInfo
1367  04c8 2724          	jreq	L102
1368                     ; 324 			if( (uiInfo.enc&0x40) == 0 )
1370  04ca a540          	bcp	a,#64
1371  04cc 260d          	jrne	L302
1372                     ; 326 				if( i==1 )	i = 7;
1374  04ce 7b01          	ld	a,(OFST+0,sp)
1375  04d0 4a            	dec	a
1376  04d1 2604          	jrne	L502
1379  04d3 a607          	ld	a,#7
1381  04d5 200c          	jp	LC002
1382  04d7               L502:
1383                     ; 328 					i--;
1385  04d7 0a01          	dec	(OFST+0,sp)
1386  04d9 200e          	jra	L112
1387  04db               L302:
1388                     ; 332 				if( i==7 )	i = 1;
1390  04db 7b01          	ld	a,(OFST+0,sp)
1391  04dd a107          	cp	a,#7
1392  04df 2606          	jrne	L312
1395  04e1 a601          	ld	a,#1
1396  04e3               LC002:
1397  04e3 6b01          	ld	(OFST+0,sp),a
1399  04e5 2002          	jra	L112
1400  04e7               L312:
1401                     ; 334 					i++;
1403  04e7 0c01          	inc	(OFST+0,sp)
1404  04e9               L112:
1405                     ; 336 			uiInfoSet.id = i;
1407  04e9 7b01          	ld	a,(OFST+0,sp)
1408  04eb c70065        	ld	_uiInfoSet+1,a
1409  04ee               L102:
1410                     ; 338 		if( _dsPrev != i )
1412  04ee c60010        	ld	a,__dsPrev
1413  04f1 1101          	cp	a,(OFST+0,sp)
1414  04f3 270f          	jreq	L771
1415                     ; 340 			_dsPrev = i;
1417  04f5 7b01          	ld	a,(OFST+0,sp)
1418  04f7 c70010        	ld	__dsPrev,a
1419                     ; 341 			lcd_disp_rid(i, 0, 0);
1421  04fa 4b00          	push	#0
1422  04fc 5f            	clrw	x
1423  04fd 7b02          	ld	a,(OFST+1,sp)
1424  04ff 95            	ld	xh,a
1425  0500 cd0000        	call	_lcd_disp_rid
1427  0503 84            	pop	a
1428  0504               L771:
1429                     ; 344 	if( key == 0x10 )		__UP
1431  0504 7b02          	ld	a,(OFST+1,sp)
1432  0506 a110          	cp	a,#16
1433  0508 2606          	jrne	L122
1436  050a 35010000      	mov	_uiInfo,#1
1440  050e 2008          	jp	LC001
1441  0510               L122:
1442                     ; 345 	else if( key == 0x20 )	__DN
1444  0510 a120          	cp	a,#32
1445  0512 2608          	jrne	L522
1448  0514 35400000      	mov	_uiInfo,#64
1451  0518               LC001:
1453  0518 0f02          	clr	(OFST+1,sp)
1456  051a 20a4          	jra	L151
1457  051c               L522:
1458                     ; 346 	else if( key == 4 )	
1460  051c a104          	cp	a,#4
1461  051e 2622          	jrne	L322
1462                     ; 348 		if( uiInfoSet.id == 1 )
1464  0520 c60065        	ld	a,_uiInfoSet+1
1465  0523 4a            	dec	a
1466  0524 260f          	jrne	L332
1467                     ; 351 			uiInfo.id = 1;
1469  0526 35010004      	mov	_uiInfo+4,#1
1470                     ; 352 			uiInfo.mode = 1;
1472  052a 35010008      	mov	_uiInfo+8,#1
1473                     ; 353 			copy_info(9);
1475  052e a609          	ld	a,#9
1476  0530 cd160d        	call	_copy_info
1478                     ; 354 			return;
1480  0533 200d          	jra	L322
1481  0535               L332:
1482                     ; 356 		STATUS_NEXT(next);	
1484  0535 7b03          	ld	a,(OFST+2,sp)
1485  0537 c7000e        	ld	__ds,a
1488  053a 725f000f      	clr	__dsCount
1491  053e 35ff0010      	mov	__dsPrev,#255
1493  0542               L322:
1494                     ; 358 }
1497  0542 5b03          	addw	sp,#3
1498  0544 81            	ret	
1553                     ; 360 void	disp_status_valveCount(uint8_t key, uint8_t next)
1553                     ; 361 {
1554                     	switch	.text
1555  0545               _disp_status_valveCount:
1557  0545 89            	pushw	x
1558  0546 88            	push	a
1559       00000001      OFST:	set	1
1562                     ; 363 	if( _dsCount == 0 )
1564  0547 c6000f        	ld	a,__dsCount
1565  054a 2608          	jrne	L532
1566                     ; 365 		disp_next();
1568  054c cd049a        	call	_disp_next
1570                     ; 366 		lcd_disp_setup_valve();
1572  054f cd0000        	call	_lcd_disp_setup_valve
1575  0552 206a          	jra	L162
1576  0554               L532:
1577                     ; 370 EncEntry:		
1577                     ; 371 		i = uiInfoSet.controlMode==0 ? uiInfoSet.valve : uiInfoSet.valve_sub;
1579  0554 c6006a        	ld	a,_uiInfoSet+6
1580  0557 2605          	jrne	L404
1581  0559 c6006b        	ld	a,_uiInfoSet+7
1582  055c 2003          	jra	L604
1583  055e               L404:
1584  055e c6006c        	ld	a,_uiInfoSet+8
1585  0561               L604:
1586  0561 6b01          	ld	(OFST+0,sp),a
1587                     ; 372 		if( uiInfo.enc != 0 )
1589  0563 c60000        	ld	a,_uiInfo
1590  0566 2731          	jreq	L362
1591                     ; 374 			ENC_MOVE_0(1, 8, 1);
1593  0568 a540          	bcp	a,#64
1594  056a 260e          	jrne	L562
1597  056c 7b01          	ld	a,(OFST+0,sp)
1598  056e a102          	cp	a,#2
1599  0570 2404          	jruge	L762
1602  0572 a608          	ld	a,#8
1604  0574 200c          	jp	LC004
1605  0576               L762:
1608  0576 0a01          	dec	(OFST+0,sp)
1609  0578 200e          	jra	L372
1610  057a               L562:
1613  057a 7b01          	ld	a,(OFST+0,sp)
1614  057c a108          	cp	a,#8
1615  057e 2506          	jrult	L572
1618  0580 a601          	ld	a,#1
1619  0582               LC004:
1620  0582 6b01          	ld	(OFST+0,sp),a
1622  0584 2002          	jra	L372
1623  0586               L572:
1626  0586 0c01          	inc	(OFST+0,sp)
1627  0588               L372:
1628                     ; 375 			if( uiInfoSet.controlMode==0 )
1631  0588 c6006a        	ld	a,_uiInfoSet+6
1632  058b 2607          	jrne	L103
1633                     ; 376 				uiInfoSet.valve = i;
1635  058d 7b01          	ld	a,(OFST+0,sp)
1636  058f c7006b        	ld	_uiInfoSet+7,a
1638  0592 2005          	jra	L362
1639  0594               L103:
1640                     ; 378 				uiInfoSet.valve_sub = i;
1642  0594 7b01          	ld	a,(OFST+0,sp)
1643  0596 c7006c        	ld	_uiInfoSet+8,a
1644  0599               L362:
1645                     ; 380 		if( _dsPrev != i )
1647  0599 c60010        	ld	a,__dsPrev
1648  059c 1101          	cp	a,(OFST+0,sp)
1649  059e 271e          	jreq	L162
1650                     ; 382 			_dsPrev = i;
1652  05a0 7b01          	ld	a,(OFST+0,sp)
1653  05a2 c70010        	ld	__dsPrev,a
1654                     ; 383 			UI_DISP_2Digit(i);
1656  05a5 5f            	clrw	x
1657  05a6 97            	ld	xl,a
1658  05a7 a60a          	ld	a,#10
1659  05a9 62            	div	x,a
1660  05aa a602          	ld	a,#2
1661  05ac 95            	ld	xh,a
1662  05ad cd0000        	call	_lcd_disp_n
1666  05b0 7b01          	ld	a,(OFST+0,sp)
1667  05b2 5f            	clrw	x
1668  05b3 97            	ld	xl,a
1669  05b4 a60a          	ld	a,#10
1670  05b6 62            	div	x,a
1671  05b7 97            	ld	xl,a
1672  05b8 a603          	ld	a,#3
1673  05ba 95            	ld	xh,a
1674  05bb cd0000        	call	_lcd_disp_n
1677  05be               L162:
1678                     ; 386 	if( key == 0x10 )		__UP
1680  05be 7b02          	ld	a,(OFST+1,sp)
1681  05c0 a110          	cp	a,#16
1682  05c2 2606          	jrne	L703
1685  05c4 35010000      	mov	_uiInfo,#1
1689  05c8 2008          	jp	LC003
1690  05ca               L703:
1691                     ; 387 	else if( key == 0x20 )	__DN
1693  05ca a120          	cp	a,#32
1694  05cc 2609          	jrne	L313
1697  05ce 35400000      	mov	_uiInfo,#64
1700  05d2               LC003:
1702  05d2 0f02          	clr	(OFST+1,sp)
1705  05d4 cc0554        	jra	L532
1706  05d7               L313:
1707                     ; 388 	else if( key == 4 )	
1709  05d7 a104          	cp	a,#4
1710  05d9 261e          	jrne	L113
1711                     ; 391 		if( uiInfoSet.controlMode==0 )
1713  05db c6006a        	ld	a,_uiInfoSet+6
1714  05de 2607          	jrne	L123
1715                     ; 392 			uiInfoSet.cnt = uiInfoSet.valve;
1717  05e0 55006b0066    	mov	_uiInfoSet+2,_uiInfoSet+7
1719  05e5 2005          	jra	L323
1720  05e7               L123:
1721                     ; 394 			uiInfoSet.cnt_sub = uiInfoSet.valve_sub;
1723  05e7 55006c0067    	mov	_uiInfoSet+3,_uiInfoSet+8
1724  05ec               L323:
1725                     ; 395 		STATUS_NEXT(next);	
1727  05ec 7b03          	ld	a,(OFST+2,sp)
1728  05ee c7000e        	ld	__ds,a
1731  05f1 725f000f      	clr	__dsCount
1734  05f5 35ff0010      	mov	__dsPrev,#255
1736  05f9               L113:
1737                     ; 397 }
1740  05f9 5b03          	addw	sp,#3
1741  05fb 81            	ret	
1805                     ; 399 void	disp_status_toffset(uint8_t key, uint8_t next)
1805                     ; 400 {
1806                     	switch	.text
1807  05fc               _disp_status_toffset:
1809  05fc 89            	pushw	x
1810  05fd 88            	push	a
1811       00000001      OFST:	set	1
1814                     ; 402 	if( _dsCount == 0 )
1816  05fe c6000f        	ld	a,__dsCount
1817  0601 2614          	jrne	L523
1818                     ; 404 		disp_next();
1820  0603 cd049a        	call	_disp_next
1822                     ; 405 		LCD_BIT_SET(bP19);
1824  0606 c60029        	ld	a,_iLF_DEF+41
1825  0609 5f            	clrw	x
1826  060a 97            	ld	xl,a
1827  060b d6540c        	ld	a,(21516,x)
1828  060e ca0029        	or	a,_bLF_DEF+41
1829  0611 d7540c        	ld	(21516,x),a
1831  0614 cc069d        	jra	L353
1832  0617               L523:
1833                     ; 410 EncEntry:		
1833                     ; 411 		i = uiInfoSet.tOffset;
1835  0617 c6006f        	ld	a,_uiInfoSet+11
1836  061a 6b01          	ld	(OFST+0,sp),a
1837                     ; 412 		if( uiInfo.enc != 0 )
1839  061c c60000        	ld	a,_uiInfo
1840  061f 2747          	jreq	L553
1841                     ; 414 			if( (uiInfo.enc & 0x40) == 0 )
1843  0621 a540          	bcp	a,#64
1844  0623 261c          	jrne	L753
1845                     ; 416 				if( i > 100 )			i -= 2;
1847  0625 7b01          	ld	a,(OFST+0,sp)
1848  0627 a165          	cp	a,#101
1851  0629 2434          	jruge	L304
1852                     ; 417 				else if( i == 100 )		i = 2;
1854  062b a164          	cp	a,#100
1855  062d 2604          	jrne	L563
1858  062f a602          	ld	a,#2
1860  0631 2020          	jp	LC007
1861  0633               L563:
1862                     ; 420 					i += 2;
1864  0633 0c01          	inc	(OFST+0,sp)
1865  0635 0c01          	inc	(OFST+0,sp)
1866                     ; 421 					if( i >= 18 )		i = 18;
1868  0637 7b01          	ld	a,(OFST+0,sp)
1869  0639 a112          	cp	a,#18
1870  063b 2528          	jrult	L373
1873  063d a612          	ld	a,#18
1874  063f 2012          	jp	LC007
1875  0641               L753:
1876                     ; 426 				if( i >= 100 )
1878  0641 7b01          	ld	a,(OFST+0,sp)
1879  0643 a164          	cp	a,#100
1880  0645 2510          	jrult	L573
1881                     ; 428 					i += 2;
1883  0647 0c01          	inc	(OFST+0,sp)
1884  0649 0c01          	inc	(OFST+0,sp)
1885                     ; 429 					if( i >= 118 )		i = 118;
1887  064b 7b01          	ld	a,(OFST+0,sp)
1888  064d a176          	cp	a,#118
1889  064f 2514          	jrult	L373
1892  0651 a676          	ld	a,#118
1893  0653               LC007:
1894  0653 6b01          	ld	(OFST+0,sp),a
1895  0655 200e          	jra	L373
1896  0657               L573:
1897                     ; 433 					if( i == 2 )		i = 100;
1899  0657 a102          	cp	a,#2
1900  0659 2604          	jrne	L304
1903  065b a664          	ld	a,#100
1905  065d 20f4          	jp	LC007
1906  065f               L304:
1907                     ; 435 						i -= 2;
1910  065f 0a01          	dec	(OFST+0,sp)
1911  0661 0a01          	dec	(OFST+0,sp)
1912  0663 7b01          	ld	a,(OFST+0,sp)
1913  0665               L373:
1914                     ; 438 			uiInfoSet.tOffset = i;
1916  0665 c7006f        	ld	_uiInfoSet+11,a
1917  0668               L553:
1918                     ; 440 		if( _dsPrev != i )
1920  0668 c60010        	ld	a,__dsPrev
1921  066b 1101          	cp	a,(OFST+0,sp)
1922  066d 272e          	jreq	L353
1923                     ; 442 			_dsPrev = i;
1925  066f 7b01          	ld	a,(OFST+0,sp)
1926  0671 c70010        	ld	__dsPrev,a
1927                     ; 443 			clear_npos2();
1929  0674 cd048e        	call	_clear_npos2
1931                     ; 444 			if( i < 100 )
1933  0677 7b01          	ld	a,(OFST+0,sp)
1934  0679 a164          	cp	a,#100
1935  067b 2410          	jruge	L114
1936                     ; 446 				LCD_BIT_SET(b3G);
1938  067d c6001e        	ld	a,_iLF_DEF+30
1939  0680 5f            	clrw	x
1940  0681 97            	ld	xl,a
1941  0682 d6540c        	ld	a,(21516,x)
1942  0685 ca001e        	or	a,_bLF_DEF+30
1943  0688 d7540c        	ld	(21516,x),a
1944  068b 7b01          	ld	a,(OFST+0,sp)
1945  068d               L114:
1946                     ; 448 			j = i%100;
1948  068d 5f            	clrw	x
1949  068e 97            	ld	xl,a
1950  068f a664          	ld	a,#100
1951  0691 62            	div	x,a
1952  0692 6b01          	ld	(OFST+0,sp),a
1953                     ; 449 			lcd_disp_n(3, j/2);
1955  0694 5f            	clrw	x
1956  0695 97            	ld	xl,a
1957  0696 57            	sraw	x
1958  0697 a603          	ld	a,#3
1959  0699 95            	ld	xh,a
1960  069a cd0000        	call	_lcd_disp_n
1962  069d               L353:
1963                     ; 452 	if( key == 0x10 )		__DN
1965  069d 7b02          	ld	a,(OFST+1,sp)
1966  069f a110          	cp	a,#16
1967  06a1 2606          	jrne	L314
1970  06a3 35400000      	mov	_uiInfo,#64
1974  06a7 2008          	jp	LC005
1975  06a9               L314:
1976                     ; 453 	else if( key == 0x20 )	__UP
1978  06a9 a120          	cp	a,#32
1979  06ab 2609          	jrne	L714
1982  06ad 35010000      	mov	_uiInfo,#1
1985  06b1               LC005:
1987  06b1 0f02          	clr	(OFST+1,sp)
1990  06b3 cc0617        	jra	L523
1991  06b6               L714:
1992                     ; 454 	else if( key == 4 )	
1994  06b6 a104          	cp	a,#4
1995  06b8 260d          	jrne	L514
1996                     ; 456 		STATUS_NEXT(next);	
1998  06ba 7b03          	ld	a,(OFST+2,sp)
1999  06bc c7000e        	ld	__ds,a
2002  06bf 725f000f      	clr	__dsCount
2005  06c3 35ff0010      	mov	__dsPrev,#255
2007  06c7               L514:
2008                     ; 458 }
2011  06c7 5b03          	addw	sp,#3
2012  06c9 81            	ret	
2068                     ; 460 void	disp_status_run_op(uint8_t key, uint8_t next)
2068                     ; 461 {
2069                     	switch	.text
2070  06ca               _disp_status_run_op:
2072  06ca 89            	pushw	x
2073  06cb 88            	push	a
2074       00000001      OFST:	set	1
2077                     ; 463 	if( uiInfoSet.controlMode==1 )
2079  06cc c6006a        	ld	a,_uiInfoSet+6
2080  06cf 4a            	dec	a
2081  06d0 2603          	jrne	L744
2082                     ; 465 		STATUS_NEXT(next);	
2084  06d2 9f            	ld	a,xl
2087                     ; 466 		return;
2090  06d3 2060          	jp	LC009
2091  06d5               L744:
2092                     ; 468 	if( _dsCount == 0 )
2094  06d5 c6000f        	ld	a,__dsCount
2095  06d8 2608          	jrne	L524
2096                     ; 470 		disp_next();
2098  06da cd049a        	call	_disp_next
2100                     ; 471 		lcd_disp_setup_cntl_op();
2102  06dd cd0000        	call	_lcd_disp_setup_cntl_op
2105  06e0 2035          	jra	L354
2106  06e2               L524:
2107                     ; 475 EncEntry:		
2107                     ; 476 		i = uiInfoSet.opMode;
2109  06e2 c60068        	ld	a,_uiInfoSet+4
2110  06e5 6b01          	ld	(OFST+0,sp),a
2111                     ; 477 		if( uiInfo.enc != 0 )
2113  06e7 c60000        	ld	a,_uiInfo
2114  06ea 270d          	jreq	L554
2115                     ; 479 			i = i==0 ? 1 : 0;
2117  06ec 7b01          	ld	a,(OFST+0,sp)
2118  06ee 2603          	jrne	L234
2119  06f0 4c            	inc	a
2120  06f1 2001          	jra	L434
2121  06f3               L234:
2122  06f3 4f            	clr	a
2123  06f4               L434:
2124  06f4 6b01          	ld	(OFST+0,sp),a
2125                     ; 480 			uiInfoSet.opMode = i;
2127  06f6 c70068        	ld	_uiInfoSet+4,a
2128  06f9               L554:
2129                     ; 482 		if( _dsPrev != i )
2131  06f9 c60010        	ld	a,__dsPrev
2132  06fc 1101          	cp	a,(OFST+0,sp)
2133  06fe 2717          	jreq	L354
2134                     ; 484 			_dsPrev = i;
2136  0700 7b01          	ld	a,(OFST+0,sp)
2137  0702 c70010        	ld	__dsPrev,a
2138                     ; 485 			clear_npos2();
2140  0705 cd048e        	call	_clear_npos2
2142                     ; 486 			if( i==0 )		lcd_disp_setup_cntl_on();
2144  0708 7b01          	ld	a,(OFST+0,sp)
2145  070a 2605          	jrne	L164
2148  070c cd0000        	call	_lcd_disp_setup_cntl_on
2151  070f 2006          	jra	L354
2152  0711               L164:
2153                     ; 487 			else if( i==1 )	lcd_disp_setup_cntl_po();
2155  0711 4a            	dec	a
2156  0712 2603          	jrne	L354
2159  0714 cd0000        	call	_lcd_disp_setup_cntl_po
2161  0717               L354:
2162                     ; 490 	if( key == 0x10 )		__DN
2164  0717 7b02          	ld	a,(OFST+1,sp)
2165  0719 a110          	cp	a,#16
2166  071b 2606          	jrne	L764
2169  071d 35400000      	mov	_uiInfo,#64
2173  0721 2008          	jp	LC008
2174  0723               L764:
2175                     ; 491 	else if( key == 0x20 )	__UP
2177  0723 a120          	cp	a,#32
2178  0725 2608          	jrne	L374
2181  0727 35010000      	mov	_uiInfo,#1
2184  072b               LC008:
2186  072b 0f02          	clr	(OFST+1,sp)
2189  072d 20b3          	jra	L524
2190  072f               L374:
2191                     ; 492 	else if( key == 4 )		
2193  072f a104          	cp	a,#4
2194  0731 260d          	jrne	L174
2195                     ; 494 		STATUS_NEXT(next);	
2197  0733 7b03          	ld	a,(OFST+2,sp)
2202  0735               LC009:
2203  0735 c7000e        	ld	__ds,a
2205  0738 725f000f      	clr	__dsCount
2207  073c 35ff0010      	mov	__dsPrev,#255
2209  0740               L174:
2210                     ; 496 }
2213  0740 5b03          	addw	sp,#3
2214  0742 81            	ret	
2271                     ; 498 void	disp_status_cntl_op(uint8_t key, uint8_t next)
2271                     ; 499 {
2272                     	switch	.text
2273  0743               _disp_status_cntl_op:
2275  0743 89            	pushw	x
2276  0744 88            	push	a
2277       00000001      OFST:	set	1
2280                     ; 501 	if( uiInfoSet.controlMode==1 )
2282  0745 c6006a        	ld	a,_uiInfoSet+6
2283  0748 4a            	dec	a
2284  0749 2603          	jrne	L325
2285                     ; 503 		STATUS_NEXT(next);	
2287  074b 9f            	ld	a,xl
2290                     ; 504 		return;
2293  074c 205d          	jp	LC011
2294  074e               L325:
2295                     ; 506 	if( _dsCount == 0 )
2297  074e c6000f        	ld	a,__dsCount
2298  0751 2608          	jrne	L105
2299                     ; 508 		disp_next();
2301  0753 cd049a        	call	_disp_next
2303                     ; 509 		lcd_disp_setup_mode();
2305  0756 cd0000        	call	_lcd_disp_setup_mode
2308  0759 2032          	jra	L725
2309  075b               L105:
2310                     ; 513 EncEntry:		
2310                     ; 514 		i = uiInfoSet.cntlMode;
2312  075b c60064        	ld	a,_uiInfoSet
2313  075e 6b01          	ld	(OFST+0,sp),a
2314                     ; 515 		if( uiInfo.enc != 0 )
2316  0760 c60000        	ld	a,_uiInfo
2317  0763 270d          	jreq	L135
2318                     ; 517 			i = i==0 ? 1 : 0;
2320  0765 7b01          	ld	a,(OFST+0,sp)
2321  0767 2603          	jrne	L454
2322  0769 4c            	inc	a
2323  076a 2001          	jra	L654
2324  076c               L454:
2325  076c 4f            	clr	a
2326  076d               L654:
2327  076d 6b01          	ld	(OFST+0,sp),a
2328                     ; 518 			uiInfoSet.cntlMode = i;
2330  076f c70064        	ld	_uiInfoSet,a
2331  0772               L135:
2332                     ; 520 		if( _dsPrev != i )
2334  0772 c60010        	ld	a,__dsPrev
2335  0775 1101          	cp	a,(OFST+0,sp)
2336  0777 2714          	jreq	L725
2337                     ; 522 			_dsPrev = i;
2339  0779 7b01          	ld	a,(OFST+0,sp)
2340  077b c70010        	ld	__dsPrev,a
2341                     ; 523 			clear_npos2();
2343  077e cd048e        	call	_clear_npos2
2345                     ; 524 			if( i == 0 )	lcd_disp_setup_mode_local();
2347  0781 7b01          	ld	a,(OFST+0,sp)
2348  0783 2605          	jrne	L535
2351  0785 cd0000        	call	_lcd_disp_setup_mode_local
2354  0788 2003          	jra	L725
2355  078a               L535:
2356                     ; 525 			else			lcd_disp_setup_mode_each();
2358  078a cd0000        	call	_lcd_disp_setup_mode_each
2360  078d               L725:
2361                     ; 528 	if( key == 0x10 )		__DN
2363  078d 7b02          	ld	a,(OFST+1,sp)
2364  078f a110          	cp	a,#16
2365  0791 2606          	jrne	L145
2368  0793 35400000      	mov	_uiInfo,#64
2372  0797 2008          	jp	LC010
2373  0799               L145:
2374                     ; 529 	else if( key == 0x20 )	__UP
2376  0799 a120          	cp	a,#32
2377  079b 2608          	jrne	L545
2380  079d 35010000      	mov	_uiInfo,#1
2383  07a1               LC010:
2385  07a1 0f02          	clr	(OFST+1,sp)
2388  07a3 20b6          	jra	L105
2389  07a5               L545:
2390                     ; 530 	else if( key == 4 )		
2392  07a5 a104          	cp	a,#4
2393  07a7 260d          	jrne	L345
2394                     ; 532 		STATUS_NEXT(next);	
2396  07a9 7b03          	ld	a,(OFST+2,sp)
2401  07ab               LC011:
2402  07ab c7000e        	ld	__ds,a
2404  07ae 725f000f      	clr	__dsCount
2406  07b2 35ff0010      	mov	__dsPrev,#255
2408  07b6               L345:
2409                     ; 534 }
2412  07b6 5b03          	addw	sp,#3
2413  07b8 81            	ret	
2468                     ; 536 void	disp_status_houseCapa(uint8_t key, uint8_t next)
2468                     ; 537 {
2469                     	switch	.text
2470  07b9               _disp_status_houseCapa:
2472  07b9 89            	pushw	x
2473  07ba 88            	push	a
2474       00000001      OFST:	set	1
2477                     ; 539 	if(uiInfoSet.cntlMode != 0 )	
2479  07bb c60064        	ld	a,_uiInfoSet
2480  07be 2704          	jreq	L575
2481                     ; 542 		STATUS_NEXT(next);
2483  07c0 9f            	ld	a,xl
2486                     ; 543 		return;
2489  07c1 cc0854        	jp	LC013
2490  07c4               L575:
2491                     ; 546 	if( _dsCount == 0 )
2493  07c4 c6000f        	ld	a,__dsCount
2494  07c7 2608          	jrne	L355
2495                     ; 548 		disp_next();
2497  07c9 cd049a        	call	_disp_next
2499                     ; 549 		lcd_disp_setup_len();
2501  07cc cd0000        	call	_lcd_disp_setup_len
2504  07cf 2065          	jra	L106
2505  07d1               L355:
2506                     ; 553 EncEntry:		
2506                     ; 554 		i = uiInfoSet.houseCapa;
2508  07d1 c6006e        	ld	a,_uiInfoSet+10
2509  07d4 6b01          	ld	(OFST+0,sp),a
2510                     ; 555 		if( uiInfo.enc != 0 )
2512  07d6 c60000        	ld	a,_uiInfo
2513  07d9 271f          	jreq	L306
2514                     ; 557 			if( (uiInfo.enc & 0x40) == 0 )	i--;
2516  07db a540          	bcp	a,#64
2517  07dd 2604          	jrne	L506
2520  07df 0a01          	dec	(OFST+0,sp)
2522  07e1 2002          	jra	L706
2523  07e3               L506:
2524                     ; 559 				i++;
2526  07e3 0c01          	inc	(OFST+0,sp)
2527  07e5               L706:
2528                     ; 560 			if( i < 70 )	i = 200;
2530  07e5 7b01          	ld	a,(OFST+0,sp)
2531  07e7 a146          	cp	a,#70
2532  07e9 2404          	jruge	L116
2535  07eb a6c8          	ld	a,#200
2536  07ed 6b01          	ld	(OFST+0,sp),a
2537  07ef               L116:
2538                     ; 561 			if( i > 200 )	i = 70;
2540  07ef a1c9          	cp	a,#201
2541  07f1 2504          	jrult	L316
2544  07f3 a646          	ld	a,#70
2545  07f5 6b01          	ld	(OFST+0,sp),a
2546  07f7               L316:
2547                     ; 562 			uiInfoSet.houseCapa = i;
2549  07f7 c7006e        	ld	_uiInfoSet+10,a
2550  07fa               L306:
2551                     ; 564 		if( _dsPrev != i )
2553  07fa c60010        	ld	a,__dsPrev
2554  07fd 1101          	cp	a,(OFST+0,sp)
2555  07ff 2735          	jreq	L106
2556                     ; 566 			_dsPrev = i;
2558  0801 7b01          	ld	a,(OFST+0,sp)
2559  0803 c70010        	ld	__dsPrev,a
2560                     ; 567 			UI_DISP_3Digit(i);
2562  0806 5f            	clrw	x
2563  0807 97            	ld	xl,a
2564  0808 a664          	ld	a,#100
2565  080a 62            	div	x,a
2566  080b a601          	ld	a,#1
2567  080d 95            	ld	xh,a
2568  080e cd0000        	call	_lcd_disp_n
2572  0811 7b01          	ld	a,(OFST+0,sp)
2573  0813 5f            	clrw	x
2574  0814 97            	ld	xl,a
2575  0815 a664          	ld	a,#100
2576  0817 62            	div	x,a
2577  0818 5f            	clrw	x
2578  0819 97            	ld	xl,a
2579  081a 01            	rrwa	x,a
2580  081b 6b01          	ld	(OFST+0,sp),a
2583  081d 5f            	clrw	x
2584  081e 97            	ld	xl,a
2585  081f a60a          	ld	a,#10
2586  0821 62            	div	x,a
2587  0822 a602          	ld	a,#2
2588  0824 95            	ld	xh,a
2589  0825 cd0000        	call	_lcd_disp_n
2593  0828 7b01          	ld	a,(OFST+0,sp)
2594  082a 5f            	clrw	x
2595  082b 97            	ld	xl,a
2596  082c a60a          	ld	a,#10
2597  082e 62            	div	x,a
2598  082f 97            	ld	xl,a
2599  0830 a603          	ld	a,#3
2600  0832 95            	ld	xh,a
2601  0833 cd0000        	call	_lcd_disp_n
2604  0836               L106:
2605                     ; 570 	if( key == 0x10 )		__DN
2607  0836 7b02          	ld	a,(OFST+1,sp)
2608  0838 a110          	cp	a,#16
2609  083a 2606          	jrne	L716
2612  083c 35400000      	mov	_uiInfo,#64
2616  0840 2008          	jp	LC012
2617  0842               L716:
2618                     ; 571 	else if( key == 0x20 )	__UP
2620  0842 a120          	cp	a,#32
2621  0844 2608          	jrne	L326
2624  0846 35010000      	mov	_uiInfo,#1
2627  084a               LC012:
2629  084a 0f02          	clr	(OFST+1,sp)
2632  084c 2083          	jra	L355
2633  084e               L326:
2634                     ; 572 	else if( key == 4 )		
2636  084e a104          	cp	a,#4
2637  0850 260d          	jrne	L126
2638                     ; 574 		STATUS_NEXT(next);	
2640  0852 7b03          	ld	a,(OFST+2,sp)
2645  0854               LC013:
2646  0854 c7000e        	ld	__ds,a
2648  0857 725f000f      	clr	__dsCount
2650  085b 35ff0010      	mov	__dsPrev,#255
2652  085f               L126:
2653                     ; 576 }
2656  085f 5b03          	addw	sp,#3
2657  0861 81            	ret	
2715                     ; 578 void	disp_status_po_type(uint8_t key, uint8_t next)
2715                     ; 579 {
2716                     	switch	.text
2717  0862               _disp_status_po_type:
2719  0862 89            	pushw	x
2720  0863 88            	push	a
2721       00000001      OFST:	set	1
2724                     ; 581 	if( _dsCount == 0 )
2726  0864 c6000f        	ld	a,__dsCount
2727  0867 2608          	jrne	L136
2728                     ; 583 		disp_next();
2730  0869 cd049a        	call	_disp_next
2732                     ; 584 		lcd_disp_setup_po_type();
2734  086c cd0000        	call	_lcd_disp_setup_po_type
2737  086f 2050          	jra	L556
2738  0871               L136:
2739                     ; 588 EncEntry:		
2739                     ; 589 		i = uiInfoSet.poType;
2741  0871 c6006d        	ld	a,_uiInfoSet+9
2742  0874 6b01          	ld	(OFST+0,sp),a
2743                     ; 590 		if( uiInfo.enc != 0 )
2745  0876 c60000        	ld	a,_uiInfo
2746  0879 2723          	jreq	L756
2747                     ; 592 			if( (uiInfo.enc & 0x40) == 0 )
2749  087b a540          	bcp	a,#64
2750  087d 260e          	jrne	L166
2751                     ; 594 				if( i==0 )	i = 2;
2753  087f 7b01          	ld	a,(OFST+0,sp)
2754  0881 2606          	jrne	L366
2757  0883 a602          	ld	a,#2
2758  0885 6b01          	ld	(OFST+0,sp),a
2760  0887 2010          	jra	L766
2761  0889               L366:
2762                     ; 596 					i--;
2764  0889 0a01          	dec	(OFST+0,sp)
2765  088b 200c          	jra	L766
2766  088d               L166:
2767                     ; 600 				if( i==2 )	i = 0;
2769  088d 7b01          	ld	a,(OFST+0,sp)
2770  088f a102          	cp	a,#2
2771  0891 2604          	jrne	L176
2774  0893 0f01          	clr	(OFST+0,sp)
2776  0895 2002          	jra	L766
2777  0897               L176:
2778                     ; 602 					i++;
2780  0897 0c01          	inc	(OFST+0,sp)
2781  0899               L766:
2782                     ; 604 			uiInfoSet.poType = i;
2784  0899 7b01          	ld	a,(OFST+0,sp)
2785  089b c7006d        	ld	_uiInfoSet+9,a
2786  089e               L756:
2787                     ; 606 		if( _dsPrev != i )
2789  089e c60010        	ld	a,__dsPrev
2790  08a1 1101          	cp	a,(OFST+0,sp)
2791  08a3 271c          	jreq	L556
2792                     ; 608 			_dsPrev = i;
2794  08a5 7b01          	ld	a,(OFST+0,sp)
2795  08a7 c70010        	ld	__dsPrev,a
2796                     ; 609 			clear_npos2();
2798  08aa cd048e        	call	_clear_npos2
2800                     ; 610 			if( i==0 )		lcd_disp_setup_po_type_xl();
2802  08ad 7b01          	ld	a,(OFST+0,sp)
2803  08af 2605          	jrne	L776
2806  08b1 cd0000        	call	_lcd_disp_setup_po_type_xl
2809  08b4 200b          	jra	L556
2810  08b6               L776:
2811                     ; 611 			else if( i==1 )	lcd_disp_setup_po_type_pb();
2813  08b6 4a            	dec	a
2814  08b7 2605          	jrne	L307
2817  08b9 cd0000        	call	_lcd_disp_setup_po_type_pb
2820  08bc 2003          	jra	L556
2821  08be               L307:
2822                     ; 613 				lcd_disp_setup_po_type_pe();
2824  08be cd0000        	call	_lcd_disp_setup_po_type_pe
2826  08c1               L556:
2827                     ; 616 	if( key == 0x10 )		__DN
2829  08c1 7b02          	ld	a,(OFST+1,sp)
2830  08c3 a110          	cp	a,#16
2831  08c5 2606          	jrne	L707
2834  08c7 35400000      	mov	_uiInfo,#64
2838  08cb 2008          	jp	LC014
2839  08cd               L707:
2840                     ; 617 	else if( key == 0x20 )	__UP
2842  08cd a120          	cp	a,#32
2843  08cf 2608          	jrne	L317
2846  08d1 35010000      	mov	_uiInfo,#1
2849  08d5               LC014:
2851  08d5 0f02          	clr	(OFST+1,sp)
2854  08d7 2098          	jra	L136
2855  08d9               L317:
2856                     ; 618 	else if( key == 4 )		
2858  08d9 a104          	cp	a,#4
2859  08db 260d          	jrne	L117
2860                     ; 620 		STATUS_NEXT(next);	
2862  08dd 7b03          	ld	a,(OFST+2,sp)
2863  08df c7000e        	ld	__ds,a
2866  08e2 725f000f      	clr	__dsCount
2869  08e6 35ff0010      	mov	__dsPrev,#255
2871  08ea               L117:
2872                     ; 622 }
2875  08ea 5b03          	addw	sp,#3
2876  08ec 81            	ret	
2879                     	switch	.const
2880  0018               ___lpm:
2881  0018 00            	dc.b	0
2882  0019 08            	dc.b	8
2883  001a 0a            	dc.b	10
2884  001b 0f            	dc.b	15
2885  001c 14            	dc.b	20
2886  001d 19            	dc.b	25
2887  001e 1e            	dc.b	30
2888  001f 63            	dc.b	99
2942                     ; 629 void	disp_status_lpm(uint8_t key, uint8_t next)
2942                     ; 630 {
2943                     	switch	.text
2944  08ed               _disp_status_lpm:
2946  08ed 89            	pushw	x
2947  08ee 88            	push	a
2948       00000001      OFST:	set	1
2951                     ; 633 	if( uiInfoSet.cntlMode == 1 )
2953  08ef c60064        	ld	a,_uiInfoSet
2954  08f2 4a            	dec	a
2955  08f3 2604          	jrne	L347
2956                     ; 635 		STATUS_NEXT(next);
2958  08f5 9f            	ld	a,xl
2961                     ; 636 		return;
2964  08f6 cc098e        	jp	LC016
2965  08f9               L347:
2966                     ; 638 	if( _dsCount == 0 )
2968  08f9 c6000f        	ld	a,__dsCount
2969  08fc 2608          	jrne	L127
2970                     ; 640 		disp_next();
2972  08fe cd049a        	call	_disp_next
2974                     ; 641 		lcd_disp_setup_lpm();
2976  0901 cd0000        	call	_lcd_disp_setup_lpm
2979  0904 2069          	jra	L747
2980  0906               L127:
2981                     ; 645 EncEntry:		
2981                     ; 646 		i = uiInfoSet.controlMode==1 ? uiInfoSet.lpmType_sub : uiInfoSet.lpmType;
2983  0906 c6006a        	ld	a,_uiInfoSet+6
2984  0909 4a            	dec	a
2985  090a 2605          	jrne	L235
2986  090c c60072        	ld	a,_uiInfoSet+14
2987  090f 2003          	jra	L435
2988  0911               L235:
2989  0911 c60071        	ld	a,_uiInfoSet+13
2990  0914               L435:
2991  0914 6b01          	ld	(OFST+0,sp),a
2992                     ; 648 		if( uiInfo.enc != 0 )
2994  0916 c60000        	ld	a,_uiInfo
2995  0919 2730          	jreq	L157
2996                     ; 650 			if( (uiInfo.enc & 0x40) == 0 )
2998  091b a540          	bcp	a,#64
2999  091d 260e          	jrne	L357
3000                     ; 652 				if( i==0 )	i = 7;
3002  091f 7b01          	ld	a,(OFST+0,sp)
3003  0921 2606          	jrne	L557
3006  0923 a607          	ld	a,#7
3007  0925 6b01          	ld	(OFST+0,sp),a
3009  0927 2010          	jra	L167
3010  0929               L557:
3011                     ; 654 					i--;
3013  0929 0a01          	dec	(OFST+0,sp)
3014  092b 200c          	jra	L167
3015  092d               L357:
3016                     ; 658 				if( i==7 )	i = 0;
3018  092d 7b01          	ld	a,(OFST+0,sp)
3019  092f a107          	cp	a,#7
3020  0931 2604          	jrne	L367
3023  0933 0f01          	clr	(OFST+0,sp)
3025  0935 2002          	jra	L167
3026  0937               L367:
3027                     ; 660 					i++;
3029  0937 0c01          	inc	(OFST+0,sp)
3030  0939               L167:
3031                     ; 662 			if( uiInfoSet.controlMode==1 )
3033  0939 c6006a        	ld	a,_uiInfoSet+6
3034  093c 4a            	dec	a
3035  093d 2607          	jrne	L767
3036                     ; 663 				uiInfoSet.lpmType_sub = i;
3038  093f 7b01          	ld	a,(OFST+0,sp)
3039  0941 c70072        	ld	_uiInfoSet+14,a
3041  0944 2005          	jra	L157
3042  0946               L767:
3043                     ; 665 				uiInfoSet.lpmType = i;
3045  0946 7b01          	ld	a,(OFST+0,sp)
3046  0948 c70071        	ld	_uiInfoSet+13,a
3047  094b               L157:
3048                     ; 667 		if( _dsPrev != i )
3050  094b c60010        	ld	a,__dsPrev
3051  094e 1101          	cp	a,(OFST+0,sp)
3052  0950 271d          	jreq	L747
3053                     ; 669 			_dsPrev = i;
3055  0952 7b01          	ld	a,(OFST+0,sp)
3056  0954 c70010        	ld	__dsPrev,a
3057                     ; 670 			clear_npos2();
3059  0957 cd048e        	call	_clear_npos2
3061                     ; 671 			UI_DISP_2Digit(__lpm[i]);
3063  095a 7b01          	ld	a,(OFST+0,sp)
3064  095c ad3e          	call	LC017
3065  095e a602          	ld	a,#2
3066  0960 95            	ld	xh,a
3067  0961 cd0000        	call	_lcd_disp_n
3071  0964 7b01          	ld	a,(OFST+0,sp)
3072  0966 ad34          	call	LC017
3073  0968 97            	ld	xl,a
3074  0969 a603          	ld	a,#3
3075  096b 95            	ld	xh,a
3076  096c cd0000        	call	_lcd_disp_n
3079  096f               L747:
3080                     ; 674 	if( key == 0x10 )		__DN
3082  096f 7b02          	ld	a,(OFST+1,sp)
3083  0971 a110          	cp	a,#16
3084  0973 2606          	jrne	L577
3087  0975 35400000      	mov	_uiInfo,#64
3091  0979 2008          	jp	LC015
3092  097b               L577:
3093                     ; 675 	else if( key == 0x20 )	__UP
3095  097b a120          	cp	a,#32
3096  097d 2609          	jrne	L1001
3099  097f 35010000      	mov	_uiInfo,#1
3102  0983               LC015:
3104  0983 0f02          	clr	(OFST+1,sp)
3107  0985 cc0906        	jra	L127
3108  0988               L1001:
3109                     ; 676 	else if( key == 4 )		
3111  0988 a104          	cp	a,#4
3112  098a 260d          	jrne	L777
3113                     ; 678 		STATUS_NEXT(next);	
3115  098c 7b03          	ld	a,(OFST+2,sp)
3120  098e               LC016:
3121  098e c7000e        	ld	__ds,a
3123  0991 725f000f      	clr	__dsCount
3125  0995 35ff0010      	mov	__dsPrev,#255
3127  0999               L777:
3128                     ; 680 }
3131  0999 5b03          	addw	sp,#3
3132  099b 81            	ret	
3133  099c               LC017:
3134  099c 5f            	clrw	x
3135  099d 97            	ld	xl,a
3136  099e d60018        	ld	a,(___lpm,x)
3137  09a1 5f            	clrw	x
3138  09a2 97            	ld	xl,a
3139  09a3 a60a          	ld	a,#10
3140  09a5 62            	div	x,a
3141  09a6 81            	ret	
3196                     ; 682 void	disp_status_temp_offset(uint8_t key, uint8_t next)
3196                     ; 683 {
3197                     	switch	.text
3198  09a7               _disp_status_temp_offset:
3200  09a7 89            	pushw	x
3201  09a8 88            	push	a
3202       00000001      OFST:	set	1
3205                     ; 685 	if( uiInfoSet.opMode == 0 )
3207  09a9 c60068        	ld	a,_uiInfoSet+4
3208  09ac 2604          	jrne	L1301
3209                     ; 687 		STATUS_NEXT(next);
3211  09ae 9f            	ld	a,xl
3214                     ; 688 		return;
3217  09af cc0a42        	jp	LC019
3218  09b2               L1301:
3219                     ; 690 	if( _dsCount == 0 )
3221  09b2 c6000f        	ld	a,__dsCount
3222  09b5 2608          	jrne	L7001
3223                     ; 692 		disp_next();
3225  09b7 cd049a        	call	_disp_next
3227                     ; 693 		lcd_disp_setup_temp_offset();
3229  09ba cd0000        	call	_lcd_disp_setup_temp_offset
3232  09bd 2065          	jra	L5301
3233  09bf               L7001:
3234                     ; 697 EncEntry:		
3234                     ; 698 		i = uiInfoSet.tempOffset;
3236  09bf c60070        	ld	a,_uiInfoSet+12
3237  09c2 6b01          	ld	(OFST+0,sp),a
3238                     ; 699 		if( uiInfo.enc != 0 )
3240  09c4 c60000        	ld	a,_uiInfo
3241  09c7 271f          	jreq	L7301
3242                     ; 701 			if( (uiInfo.enc & 0x40) == 0 )	i--;
3244  09c9 a540          	bcp	a,#64
3245  09cb 2604          	jrne	L1401
3248  09cd 0a01          	dec	(OFST+0,sp)
3250  09cf 2002          	jra	L3401
3251  09d1               L1401:
3252                     ; 703 				i++;
3254  09d1 0c01          	inc	(OFST+0,sp)
3255  09d3               L3401:
3256                     ; 704 			if( i < 60 )	i = 100;
3258  09d3 7b01          	ld	a,(OFST+0,sp)
3259  09d5 a13c          	cp	a,#60
3260  09d7 2404          	jruge	L5401
3263  09d9 a664          	ld	a,#100
3264  09db 6b01          	ld	(OFST+0,sp),a
3265  09dd               L5401:
3266                     ; 705 			if( i > 100 )	i = 60;
3268  09dd a165          	cp	a,#101
3269  09df 2504          	jrult	L7401
3272  09e1 a63c          	ld	a,#60
3273  09e3 6b01          	ld	(OFST+0,sp),a
3274  09e5               L7401:
3275                     ; 706 			uiInfoSet.tempOffset = i;
3277  09e5 c70070        	ld	_uiInfoSet+12,a
3278  09e8               L7301:
3279                     ; 708 		if( _dsPrev != i )
3281  09e8 c60010        	ld	a,__dsPrev
3282  09eb 1101          	cp	a,(OFST+0,sp)
3283  09ed 2735          	jreq	L5301
3284                     ; 710 			_dsPrev = i;
3286  09ef 7b01          	ld	a,(OFST+0,sp)
3287  09f1 c70010        	ld	__dsPrev,a
3288                     ; 711 			UI_DISP_3Digit(i);
3290  09f4 5f            	clrw	x
3291  09f5 97            	ld	xl,a
3292  09f6 a664          	ld	a,#100
3293  09f8 62            	div	x,a
3294  09f9 a601          	ld	a,#1
3295  09fb 95            	ld	xh,a
3296  09fc cd0000        	call	_lcd_disp_n
3300  09ff 7b01          	ld	a,(OFST+0,sp)
3301  0a01 5f            	clrw	x
3302  0a02 97            	ld	xl,a
3303  0a03 a664          	ld	a,#100
3304  0a05 62            	div	x,a
3305  0a06 5f            	clrw	x
3306  0a07 97            	ld	xl,a
3307  0a08 01            	rrwa	x,a
3308  0a09 6b01          	ld	(OFST+0,sp),a
3311  0a0b 5f            	clrw	x
3312  0a0c 97            	ld	xl,a
3313  0a0d a60a          	ld	a,#10
3314  0a0f 62            	div	x,a
3315  0a10 a602          	ld	a,#2
3316  0a12 95            	ld	xh,a
3317  0a13 cd0000        	call	_lcd_disp_n
3321  0a16 7b01          	ld	a,(OFST+0,sp)
3322  0a18 5f            	clrw	x
3323  0a19 97            	ld	xl,a
3324  0a1a a60a          	ld	a,#10
3325  0a1c 62            	div	x,a
3326  0a1d 97            	ld	xl,a
3327  0a1e a603          	ld	a,#3
3328  0a20 95            	ld	xh,a
3329  0a21 cd0000        	call	_lcd_disp_n
3332  0a24               L5301:
3333                     ; 714 	if( key == 0x10 )		__DN
3335  0a24 7b02          	ld	a,(OFST+1,sp)
3336  0a26 a110          	cp	a,#16
3337  0a28 2606          	jrne	L3501
3340  0a2a 35400000      	mov	_uiInfo,#64
3344  0a2e 2008          	jp	LC018
3345  0a30               L3501:
3346                     ; 715 	else if( key == 0x20 )	__UP
3348  0a30 a120          	cp	a,#32
3349  0a32 2608          	jrne	L7501
3352  0a34 35010000      	mov	_uiInfo,#1
3355  0a38               LC018:
3357  0a38 0f02          	clr	(OFST+1,sp)
3360  0a3a 2083          	jra	L7001
3361  0a3c               L7501:
3362                     ; 716 	else if( key == 4 )		
3364  0a3c a104          	cp	a,#4
3365  0a3e 260d          	jrne	L5501
3366                     ; 718 		STATUS_NEXT(next);	
3368  0a40 7b03          	ld	a,(OFST+2,sp)
3373  0a42               LC019:
3374  0a42 c7000e        	ld	__ds,a
3376  0a45 725f000f      	clr	__dsCount
3378  0a49 35ff0010      	mov	__dsPrev,#255
3380  0a4d               L5501:
3381                     ; 720 }
3384  0a4d 5b03          	addw	sp,#3
3385  0a4f 81            	ret	
3388                     	switch	.data
3389  0011               __ui_:
3390  0011 00            	dc.b	0
3470                     ; 728 void	disp_status_valveinfo_sub(uint8_t key, uint8_t next, uint8_t prev)
3470                     ; 729 {
3471                     	switch	.text
3472  0a50               _disp_status_valveinfo_sub:
3474  0a50 89            	pushw	x
3475  0a51 520c          	subw	sp,#12
3476       0000000c      OFST:	set	12
3479                     ; 732 	if( _dsCount == 0 )
3481  0a53 c6000f        	ld	a,__dsCount
3482  0a56 2645          	jrne	L5601
3483                     ; 734 		disp_next();
3485  0a58 cd049a        	call	_disp_next
3487                     ; 735 		lcd_disp_n(0, UI_RIDs+1);
3489  0a5b c60097        	ld	a,_uiInfoSet+51
3490  0a5e 4c            	inc	a
3491  0a5f 97            	ld	xl,a
3492  0a60 4f            	clr	a
3493  0a61 95            	ld	xh,a
3494  0a62 cd0000        	call	_lcd_disp_n
3496                     ; 736 		lcd_blink_npos(UI_RIDs+1);
3498  0a65 c60097        	ld	a,_uiInfoSet+51
3499  0a68 4c            	inc	a
3500  0a69 cd0000        	call	_lcd_blink_npos
3502                     ; 737 		_ui_ = uiInfoSet.valve_sub_rc[UI_RIDs];// + uiInfoSet.cnt;
3504  0a6c cd0bc3        	call	LC021
3505  0a6f d6008b        	ld	a,(_uiInfoSet+39,x)
3506  0a72 c70011        	ld	__ui_,a
3507                     ; 738 		lcd_disp_rid(_ui_, 1, 0);
3509  0a75 4b00          	push	#0
3510  0a77 ae0001        	ldw	x,#1
3511  0a7a 95            	ld	xh,a
3512  0a7b cd0000        	call	_lcd_disp_rid
3514  0a7e 84            	pop	a
3515                     ; 739 		for( i=0; i<8; i++ )
3517  0a7f 4f            	clr	a
3518  0a80 6b0c          	ld	(OFST+0,sp),a
3519  0a82               L1211:
3520                     ; 741 			if( i >= uiInfoSet.valve_sub )
3522  0a82 c1006c        	cp	a,_uiInfoSet+8
3523  0a85 250c          	jrult	L7211
3524                     ; 743 				uiInfoSet.valve_sub_len[i] = 0;
3526  0a87 5f            	clrw	x
3527  0a88 97            	ld	xl,a
3528  0a89 724f0083      	clr	(_uiInfoSet+31,x)
3529                     ; 744 				uiInfoSet.valve_sub_rc[i] = 0;
3531  0a8d 5f            	clrw	x
3532  0a8e 97            	ld	xl,a
3533  0a8f 724f008b      	clr	(_uiInfoSet+39,x)
3534  0a93               L7211:
3535                     ; 739 		for( i=0; i<8; i++ )
3537  0a93 0c0c          	inc	(OFST+0,sp)
3540  0a95 7b0c          	ld	a,(OFST+0,sp)
3541  0a97 a108          	cp	a,#8
3542  0a99 25e7          	jrult	L1211
3544  0a9b 206d          	jra	L1311
3545  0a9d               L5601:
3546                     ; 750 EncEntry:		
3546                     ; 751 		i = uiInfoSet.valve_sub_len[UI_RIDs];
3548  0a9d cd0bc3        	call	LC021
3549  0aa0 d60083        	ld	a,(_uiInfoSet+31,x)
3550  0aa3 6b0c          	ld	(OFST+0,sp),a
3551                     ; 752 		if( uiInfo.enc != 0 )
3553  0aa5 c60000        	ld	a,_uiInfo
3554  0aa8 2724          	jreq	L3311
3555                     ; 754 			if( (uiInfo.enc & 0x40) == 0 )	i--;
3557  0aaa a540          	bcp	a,#64
3558  0aac 2604          	jrne	L5311
3561  0aae 0a0c          	dec	(OFST+0,sp)
3563  0ab0 2002          	jra	L7311
3564  0ab2               L5311:
3565                     ; 756 				i++;
3567  0ab2 0c0c          	inc	(OFST+0,sp)
3568  0ab4               L7311:
3569                     ; 757 			if( i > 150 )	i = 35;
3571  0ab4 7b0c          	ld	a,(OFST+0,sp)
3572  0ab6 a197          	cp	a,#151
3573  0ab8 2504          	jrult	L1411
3576  0aba a623          	ld	a,#35
3577  0abc 6b0c          	ld	(OFST+0,sp),a
3578  0abe               L1411:
3579                     ; 758 			if( i < 35 )	i = 150;
3581  0abe a123          	cp	a,#35
3582  0ac0 2404          	jruge	L3411
3585  0ac2 a696          	ld	a,#150
3586  0ac4 6b0c          	ld	(OFST+0,sp),a
3587  0ac6               L3411:
3588                     ; 759 			uiInfoSet.valve_sub_len[UI_RIDs] = i;
3590  0ac6 cd0bc3        	call	LC021
3591  0ac9 7b0c          	ld	a,(OFST+0,sp)
3592  0acb d70083        	ld	(_uiInfoSet+31,x),a
3593  0ace               L3311:
3594                     ; 761 		if( _dsPrev != i )
3596  0ace c60010        	ld	a,__dsPrev
3597  0ad1 110c          	cp	a,(OFST+0,sp)
3598  0ad3 2735          	jreq	L1311
3599                     ; 763 			_dsPrev = i;
3601  0ad5 7b0c          	ld	a,(OFST+0,sp)
3602  0ad7 c70010        	ld	__dsPrev,a
3603                     ; 764 			UI_DISP_3Digit(i);
3605  0ada 5f            	clrw	x
3606  0adb 97            	ld	xl,a
3607  0adc a664          	ld	a,#100
3608  0ade 62            	div	x,a
3609  0adf a601          	ld	a,#1
3610  0ae1 95            	ld	xh,a
3611  0ae2 cd0000        	call	_lcd_disp_n
3615  0ae5 7b0c          	ld	a,(OFST+0,sp)
3616  0ae7 5f            	clrw	x
3617  0ae8 97            	ld	xl,a
3618  0ae9 a664          	ld	a,#100
3619  0aeb 62            	div	x,a
3620  0aec 5f            	clrw	x
3621  0aed 97            	ld	xl,a
3622  0aee 01            	rrwa	x,a
3623  0aef 6b0c          	ld	(OFST+0,sp),a
3626  0af1 5f            	clrw	x
3627  0af2 97            	ld	xl,a
3628  0af3 a60a          	ld	a,#10
3629  0af5 62            	div	x,a
3630  0af6 a602          	ld	a,#2
3631  0af8 95            	ld	xh,a
3632  0af9 cd0000        	call	_lcd_disp_n
3636  0afc 7b0c          	ld	a,(OFST+0,sp)
3637  0afe 5f            	clrw	x
3638  0aff 97            	ld	xl,a
3639  0b00 a60a          	ld	a,#10
3640  0b02 62            	div	x,a
3641  0b03 97            	ld	xl,a
3642  0b04 a603          	ld	a,#3
3643  0b06 95            	ld	xh,a
3644  0b07 cd0000        	call	_lcd_disp_n
3647  0b0a               L1311:
3648                     ; 767 	if( key == 4 )		
3650  0b0a 7b0d          	ld	a,(OFST+1,sp)
3651  0b0c a104          	cp	a,#4
3652  0b0e 2671          	jrne	L7411
3653                     ; 769 		lcd_blink_npos_clear();
3655  0b10 cd0000        	call	_lcd_blink_npos_clear
3657                     ; 770 		STATUS_NEXT(next);	
3659  0b13 7b0e          	ld	a,(OFST+2,sp)
3660  0b15 c7000e        	ld	__ds,a
3663  0b18 725f000f      	clr	__dsCount
3666  0b1c 35ff0010      	mov	__dsPrev,#255
3667                     ; 771 		for( i=0; i<8; i++ )
3670  0b20 0f0c          	clr	(OFST+0,sp)
3671  0b22               L1511:
3672                     ; 772 			b[i] = 0;
3674  0b22 96            	ldw	x,sp
3675  0b23 1c0004        	addw	x,#OFST-8
3676  0b26 9f            	ld	a,xl
3677  0b27 5e            	swapw	x
3678  0b28 1b0c          	add	a,(OFST+0,sp)
3679  0b2a 2401          	jrnc	L606
3680  0b2c 5c            	incw	x
3681  0b2d               L606:
3682  0b2d 02            	rlwa	x,a
3683  0b2e 7f            	clr	(x)
3684                     ; 771 		for( i=0; i<8; i++ )
3686  0b2f 0c0c          	inc	(OFST+0,sp)
3689  0b31 7b0c          	ld	a,(OFST+0,sp)
3690  0b33 a108          	cp	a,#8
3691  0b35 25eb          	jrult	L1511
3692                     ; 773 		for( i=0; i<8; i++ )
3694  0b37 4f            	clr	a
3695  0b38 6b0c          	ld	(OFST+0,sp),a
3696  0b3a               L7511:
3697                     ; 775 			if( uiInfoSet.valve_sub_rc[i] != 0 )
3699  0b3a 5f            	clrw	x
3700  0b3b 97            	ld	xl,a
3701  0b3c 724d008b      	tnz	(_uiInfoSet+39,x)
3702  0b40 2713          	jreq	L5611
3703                     ; 776 				b[uiInfoSet.valve_sub_rc[i]] = 1;
3705  0b42 96            	ldw	x,sp
3706  0b43 1c0004        	addw	x,#OFST-8
3707  0b46 1f01          	ldw	(OFST-11,sp),x
3708  0b48 5f            	clrw	x
3709  0b49 97            	ld	xl,a
3710  0b4a d6008b        	ld	a,(_uiInfoSet+39,x)
3711  0b4d 5f            	clrw	x
3712  0b4e 97            	ld	xl,a
3713  0b4f 72fb01        	addw	x,(OFST-11,sp)
3714  0b52 a601          	ld	a,#1
3715  0b54 f7            	ld	(x),a
3716  0b55               L5611:
3717                     ; 773 		for( i=0; i<8; i++ )
3719  0b55 0c0c          	inc	(OFST+0,sp)
3722  0b57 7b0c          	ld	a,(OFST+0,sp)
3723  0b59 a108          	cp	a,#8
3724  0b5b 25dd          	jrult	L7511
3725                     ; 778 		j = 0;
3727  0b5d 0f03          	clr	(OFST-9,sp)
3728                     ; 779 		for( i=0; i<8; i++ )
3730  0b5f 0f0c          	clr	(OFST+0,sp)
3731  0b61               L7611:
3732                     ; 781 			if( b[i] != 0 )
3734  0b61 96            	ldw	x,sp
3735  0b62 1c0004        	addw	x,#OFST-8
3736  0b65 9f            	ld	a,xl
3737  0b66 5e            	swapw	x
3738  0b67 1b0c          	add	a,(OFST+0,sp)
3739  0b69 2401          	jrnc	L016
3740  0b6b 5c            	incw	x
3741  0b6c               L016:
3742  0b6c 02            	rlwa	x,a
3743  0b6d f6            	ld	a,(x)
3744  0b6e 2702          	jreq	L5711
3745                     ; 782 				j++;
3747  0b70 0c03          	inc	(OFST-9,sp)
3748  0b72               L5711:
3749                     ; 779 		for( i=0; i<8; i++ )
3751  0b72 0c0c          	inc	(OFST+0,sp)
3754  0b74 7b0c          	ld	a,(OFST+0,sp)
3755  0b76 a108          	cp	a,#8
3756  0b78 25e7          	jrult	L7611
3757                     ; 784 		uiInfoSet.cnt_sub = j;
3759  0b7a 7b03          	ld	a,(OFST-9,sp)
3760  0b7c c70067        	ld	_uiInfoSet+3,a
3762  0b7f 203f          	jra	L7711
3763  0b81               L7411:
3764                     ; 786 	else if( key == 8 )
3766  0b81 a108          	cp	a,#8
3767  0b83 2618          	jrne	L1021
3768                     ; 788 		uiInfoSet.valve_sub_rc[UI_RIDs]++;
3770  0b85 ad3c          	call	LC021
3771  0b87 724c008b      	inc	(_uiInfoSet+39,x)
3772                     ; 789 		if( uiInfoSet.valve_sub_rc[UI_RIDs] > 8 )
3774  0b8b 5f            	clrw	x
3775  0b8c 97            	ld	xl,a
3776  0b8d d6008b        	ld	a,(_uiInfoSet+39,x)
3777  0b90 a109          	cp	a,#9
3778  0b92 251f          	jrult	L1121
3779                     ; 790 			uiInfoSet.valve_sub_rc[UI_RIDs] = 1;
3781  0b94 ad2d          	call	LC021
3782  0b96 a601          	ld	a,#1
3783  0b98 d7008b        	ld	(_uiInfoSet+39,x),a
3784                     ; 797 		STATUS_NEXT(prev);
3789  0b9b 2016          	jp	L1121
3790  0b9d               L1021:
3791                     ; 799 	else if( key == 1 )
3793  0b9d 4a            	dec	a
3794  0b9e 2620          	jrne	L7711
3795                     ; 801 		lcd_blink_npos_clear();
3797  0ba0 cd0000        	call	_lcd_blink_npos_clear
3799                     ; 802 		UI_RIDs++;
3801  0ba3 725c0097      	inc	_uiInfoSet+51
3802                     ; 803 		if( UI_RIDs == uiInfoSet.valve_sub )
3804  0ba7 c60097        	ld	a,_uiInfoSet+51
3805  0baa c1006c        	cp	a,_uiInfoSet+8
3806  0bad 2604          	jrne	L1121
3807                     ; 804 			UI_RIDs = 0;
3809  0baf 725f0097      	clr	_uiInfoSet+51
3810  0bb3               L1121:
3811                     ; 805 		STATUS_NEXT(prev);
3818  0bb3 7b11          	ld	a,(OFST+5,sp)
3819  0bb5 c7000e        	ld	__ds,a
3821  0bb8 725f000f      	clr	__dsCount
3823  0bbc 35ff0010      	mov	__dsPrev,#255
3825  0bc0               L7711:
3826                     ; 807 }
3829  0bc0 5b0e          	addw	sp,#14
3830  0bc2 81            	ret	
3831  0bc3               LC021:
3832  0bc3 c60097        	ld	a,_uiInfoSet+51
3833  0bc6 5f            	clrw	x
3834  0bc7 97            	ld	xl,a
3835  0bc8 81            	ret	
3918                     ; 809 void	disp_status_valveinfo(uint8_t key, uint8_t next, uint8_t prev)
3918                     ; 810 {
3919                     	switch	.text
3920  0bc9               _disp_status_valveinfo:
3922  0bc9 89            	pushw	x
3923  0bca 520c          	subw	sp,#12
3924       0000000c      OFST:	set	12
3927                     ; 813 	if( uiInfoSet.controlMode==1 )
3929  0bcc c6006a        	ld	a,_uiInfoSet+6
3930  0bcf 4a            	dec	a
3931  0bd0 260d          	jrne	L5421
3932                     ; 815 		disp_status_valveinfo_sub(key, next, prev);
3934  0bd2 7b11          	ld	a,(OFST+5,sp)
3935  0bd4 88            	push	a
3936  0bd5 7b0e          	ld	a,(OFST+2,sp)
3937  0bd7 95            	ld	xh,a
3938  0bd8 cd0a50        	call	_disp_status_valveinfo_sub
3940  0bdb 84            	pop	a
3941                     ; 816 		return;
3943  0bdc cc0d71        	jra	L1031
3944  0bdf               L5421:
3945                     ; 818 	if( _dsCount == 0 )
3947  0bdf c6000f        	ld	a,__dsCount
3948  0be2 2645          	jrne	L3121
3949                     ; 820 		disp_next();
3951  0be4 cd049a        	call	_disp_next
3953                     ; 821 		lcd_disp_n(0, UI_RID+1);
3955  0be7 c60095        	ld	a,_uiInfoSet+49
3956  0bea 4c            	inc	a
3957  0beb 97            	ld	xl,a
3958  0bec 4f            	clr	a
3959  0bed 95            	ld	xh,a
3960  0bee cd0000        	call	_lcd_disp_n
3962                     ; 822 		lcd_blink_npos(UI_RID+1);
3964  0bf1 c60095        	ld	a,_uiInfoSet+49
3965  0bf4 4c            	inc	a
3966  0bf5 cd0000        	call	_lcd_blink_npos
3968                     ; 823 		_ui_ = uiInfoSet.valve_rc[UI_RID];
3970  0bf8 cd0d74        	call	LC024
3971  0bfb d6007b        	ld	a,(_uiInfoSet+23,x)
3972  0bfe c70011        	ld	__ui_,a
3973                     ; 824 		lcd_disp_rid(_ui_, 1, 0);
3975  0c01 4b00          	push	#0
3976  0c03 ae0001        	ldw	x,#1
3977  0c06 95            	ld	xh,a
3978  0c07 cd0000        	call	_lcd_disp_rid
3980  0c0a 84            	pop	a
3981                     ; 825 		for( i=0; i<8; i++ )
3983  0c0b 4f            	clr	a
3984  0c0c 6b0c          	ld	(OFST+0,sp),a
3985  0c0e               L1521:
3986                     ; 827 			if( i >= uiInfoSet.valve )
3988  0c0e c1006b        	cp	a,_uiInfoSet+7
3989  0c11 250c          	jrult	L7521
3990                     ; 829 				uiInfoSet.valve_len[i] = 0;
3992  0c13 5f            	clrw	x
3993  0c14 97            	ld	xl,a
3994  0c15 724f0073      	clr	(_uiInfoSet+15,x)
3995                     ; 830 				uiInfoSet.valve_rc[i] = 0;
3997  0c19 5f            	clrw	x
3998  0c1a 97            	ld	xl,a
3999  0c1b 724f007b      	clr	(_uiInfoSet+23,x)
4000  0c1f               L7521:
4001                     ; 825 		for( i=0; i<8; i++ )
4003  0c1f 0c0c          	inc	(OFST+0,sp)
4006  0c21 7b0c          	ld	a,(OFST+0,sp)
4007  0c23 a108          	cp	a,#8
4008  0c25 25e7          	jrult	L1521
4010  0c27 206d          	jra	L1621
4011  0c29               L3121:
4012                     ; 836 EncEntry:		
4012                     ; 837 		i = uiInfoSet.valve_len[UI_RID];
4014  0c29 cd0d74        	call	LC024
4015  0c2c d60073        	ld	a,(_uiInfoSet+15,x)
4016  0c2f 6b0c          	ld	(OFST+0,sp),a
4017                     ; 838 		if( uiInfo.enc != 0 )
4019  0c31 c60000        	ld	a,_uiInfo
4020  0c34 2724          	jreq	L3621
4021                     ; 840 			if( (uiInfo.enc & 0x40) == 0 )	i--;
4023  0c36 a540          	bcp	a,#64
4024  0c38 2604          	jrne	L5621
4027  0c3a 0a0c          	dec	(OFST+0,sp)
4029  0c3c 2002          	jra	L7621
4030  0c3e               L5621:
4031                     ; 842 				i++;
4033  0c3e 0c0c          	inc	(OFST+0,sp)
4034  0c40               L7621:
4035                     ; 843 			if( i > 150 )	i = 35;
4037  0c40 7b0c          	ld	a,(OFST+0,sp)
4038  0c42 a197          	cp	a,#151
4039  0c44 2504          	jrult	L1721
4042  0c46 a623          	ld	a,#35
4043  0c48 6b0c          	ld	(OFST+0,sp),a
4044  0c4a               L1721:
4045                     ; 844 			if( i < 35 )	i = 150;
4047  0c4a a123          	cp	a,#35
4048  0c4c 2404          	jruge	L3721
4051  0c4e a696          	ld	a,#150
4052  0c50 6b0c          	ld	(OFST+0,sp),a
4053  0c52               L3721:
4054                     ; 845 			uiInfoSet.valve_len[UI_RID] = i;
4056  0c52 cd0d74        	call	LC024
4057  0c55 7b0c          	ld	a,(OFST+0,sp)
4058  0c57 d70073        	ld	(_uiInfoSet+15,x),a
4059  0c5a               L3621:
4060                     ; 847 		if( _dsPrev != i )
4062  0c5a c60010        	ld	a,__dsPrev
4063  0c5d 110c          	cp	a,(OFST+0,sp)
4064  0c5f 2735          	jreq	L1621
4065                     ; 849 			_dsPrev = i;
4067  0c61 7b0c          	ld	a,(OFST+0,sp)
4068  0c63 c70010        	ld	__dsPrev,a
4069                     ; 850 			UI_DISP_3Digit(i);
4071  0c66 5f            	clrw	x
4072  0c67 97            	ld	xl,a
4073  0c68 a664          	ld	a,#100
4074  0c6a 62            	div	x,a
4075  0c6b a601          	ld	a,#1
4076  0c6d 95            	ld	xh,a
4077  0c6e cd0000        	call	_lcd_disp_n
4081  0c71 7b0c          	ld	a,(OFST+0,sp)
4082  0c73 5f            	clrw	x
4083  0c74 97            	ld	xl,a
4084  0c75 a664          	ld	a,#100
4085  0c77 62            	div	x,a
4086  0c78 5f            	clrw	x
4087  0c79 97            	ld	xl,a
4088  0c7a 01            	rrwa	x,a
4089  0c7b 6b0c          	ld	(OFST+0,sp),a
4092  0c7d 5f            	clrw	x
4093  0c7e 97            	ld	xl,a
4094  0c7f a60a          	ld	a,#10
4095  0c81 62            	div	x,a
4096  0c82 a602          	ld	a,#2
4097  0c84 95            	ld	xh,a
4098  0c85 cd0000        	call	_lcd_disp_n
4102  0c88 7b0c          	ld	a,(OFST+0,sp)
4103  0c8a 5f            	clrw	x
4104  0c8b 97            	ld	xl,a
4105  0c8c a60a          	ld	a,#10
4106  0c8e 62            	div	x,a
4107  0c8f 97            	ld	xl,a
4108  0c90 a603          	ld	a,#3
4109  0c92 95            	ld	xh,a
4110  0c93 cd0000        	call	_lcd_disp_n
4113  0c96               L1621:
4114                     ; 853 	if( key == 0x10 )		__DN
4116  0c96 7b0d          	ld	a,(OFST+1,sp)
4117  0c98 a110          	cp	a,#16
4118  0c9a 2606          	jrne	L7721
4121  0c9c 35400000      	mov	_uiInfo,#64
4125  0ca0 2008          	jp	LC022
4126  0ca2               L7721:
4127                     ; 854 	else if( key == 0x20 )	__UP
4129  0ca2 a120          	cp	a,#32
4130  0ca4 2609          	jrne	L3031
4133  0ca6 35010000      	mov	_uiInfo,#1
4136  0caa               LC022:
4138  0caa 0f0d          	clr	(OFST+1,sp)
4141  0cac cc0c29        	jra	L3121
4142  0caf               L3031:
4143                     ; 855 	else if( key == 4 )		
4145  0caf a104          	cp	a,#4
4146  0cb1 2671          	jrne	L7031
4147                     ; 857 		lcd_blink_npos_clear();
4149  0cb3 cd0000        	call	_lcd_blink_npos_clear
4151                     ; 858 		STATUS_NEXT(next);	
4153  0cb6 7b0e          	ld	a,(OFST+2,sp)
4154  0cb8 c7000e        	ld	__ds,a
4157  0cbb 725f000f      	clr	__dsCount
4160  0cbf 35ff0010      	mov	__dsPrev,#255
4161                     ; 859 		for( i=0; i<8; i++ )
4164  0cc3 0f0c          	clr	(OFST+0,sp)
4165  0cc5               L1131:
4166                     ; 860 			b[i] = 0;
4168  0cc5 96            	ldw	x,sp
4169  0cc6 1c0004        	addw	x,#OFST-8
4170  0cc9 9f            	ld	a,xl
4171  0cca 5e            	swapw	x
4172  0ccb 1b0c          	add	a,(OFST+0,sp)
4173  0ccd 2401          	jrnc	L046
4174  0ccf 5c            	incw	x
4175  0cd0               L046:
4176  0cd0 02            	rlwa	x,a
4177  0cd1 7f            	clr	(x)
4178                     ; 859 		for( i=0; i<8; i++ )
4180  0cd2 0c0c          	inc	(OFST+0,sp)
4183  0cd4 7b0c          	ld	a,(OFST+0,sp)
4184  0cd6 a108          	cp	a,#8
4185  0cd8 25eb          	jrult	L1131
4186                     ; 861 		for( i=0; i<8; i++ )
4188  0cda 4f            	clr	a
4189  0cdb 6b0c          	ld	(OFST+0,sp),a
4190  0cdd               L7131:
4191                     ; 863 			if( uiInfoSet.valve_rc[i] != 0 )
4193  0cdd 5f            	clrw	x
4194  0cde 97            	ld	xl,a
4195  0cdf 724d007b      	tnz	(_uiInfoSet+23,x)
4196  0ce3 2713          	jreq	L5231
4197                     ; 864 				b[uiInfoSet.valve_rc[i]] = 1;
4199  0ce5 96            	ldw	x,sp
4200  0ce6 1c0004        	addw	x,#OFST-8
4201  0ce9 1f01          	ldw	(OFST-11,sp),x
4202  0ceb 5f            	clrw	x
4203  0cec 97            	ld	xl,a
4204  0ced d6007b        	ld	a,(_uiInfoSet+23,x)
4205  0cf0 5f            	clrw	x
4206  0cf1 97            	ld	xl,a
4207  0cf2 72fb01        	addw	x,(OFST-11,sp)
4208  0cf5 a601          	ld	a,#1
4209  0cf7 f7            	ld	(x),a
4210  0cf8               L5231:
4211                     ; 861 		for( i=0; i<8; i++ )
4213  0cf8 0c0c          	inc	(OFST+0,sp)
4216  0cfa 7b0c          	ld	a,(OFST+0,sp)
4217  0cfc a108          	cp	a,#8
4218  0cfe 25dd          	jrult	L7131
4219                     ; 866 		j = 0;
4221  0d00 0f03          	clr	(OFST-9,sp)
4222                     ; 867 		for( i=0; i<8; i++ )
4224  0d02 0f0c          	clr	(OFST+0,sp)
4225  0d04               L7231:
4226                     ; 869 			if( b[i] != 0 )
4228  0d04 96            	ldw	x,sp
4229  0d05 1c0004        	addw	x,#OFST-8
4230  0d08 9f            	ld	a,xl
4231  0d09 5e            	swapw	x
4232  0d0a 1b0c          	add	a,(OFST+0,sp)
4233  0d0c 2401          	jrnc	L246
4234  0d0e 5c            	incw	x
4235  0d0f               L246:
4236  0d0f 02            	rlwa	x,a
4237  0d10 f6            	ld	a,(x)
4238  0d11 2702          	jreq	L5331
4239                     ; 870 				j++;
4241  0d13 0c03          	inc	(OFST-9,sp)
4242  0d15               L5331:
4243                     ; 867 		for( i=0; i<8; i++ )
4245  0d15 0c0c          	inc	(OFST+0,sp)
4248  0d17 7b0c          	ld	a,(OFST+0,sp)
4249  0d19 a108          	cp	a,#8
4250  0d1b 25e7          	jrult	L7231
4251                     ; 872 		uiInfoSet.cnt = j;
4253  0d1d 7b03          	ld	a,(OFST-9,sp)
4254  0d1f c70066        	ld	_uiInfoSet+2,a
4256  0d22 204d          	jra	L1031
4257  0d24               L7031:
4258                     ; 874 	else if( key == 8 )
4260  0d24 a108          	cp	a,#8
4261  0d26 2626          	jrne	L1431
4262                     ; 876 		uiInfoSet.valve_rc[UI_RID]++;
4264  0d28 ad4a          	call	LC024
4265  0d2a 724c007b      	inc	(_uiInfoSet+23,x)
4266                     ; 877 		if( uiInfoSet.valve+1 == uiInfoSet.valve_rc[UI_RID] )
4268  0d2e 5f            	clrw	x
4269  0d2f 97            	ld	xl,a
4270  0d30 d6007b        	ld	a,(_uiInfoSet+23,x)
4271  0d33 5f            	clrw	x
4272  0d34 97            	ld	xl,a
4273  0d35 c6006b        	ld	a,_uiInfoSet+7
4274  0d38 905f          	clrw	y
4275  0d3a 9097          	ld	yl,a
4276  0d3c bf00          	ldw	c_x,x
4277  0d3e 905c          	incw	y
4278  0d40 90b300        	cpw	y,c_x
4279  0d43 261f          	jrne	L1531
4280                     ; 878 			uiInfoSet.valve_rc[UI_RID] = 1;
4282  0d45 ad2d          	call	LC024
4283  0d47 a601          	ld	a,#1
4284  0d49 d7007b        	ld	(_uiInfoSet+23,x),a
4285                     ; 879 		STATUS_NEXT(prev);
4290  0d4c 2016          	jp	L1531
4291  0d4e               L1431:
4292                     ; 881 	else if( key == 1 )
4294  0d4e 4a            	dec	a
4295  0d4f 2620          	jrne	L1031
4296                     ; 883 		lcd_blink_npos_clear();
4298  0d51 cd0000        	call	_lcd_blink_npos_clear
4300                     ; 884 		UI_RID++;
4302  0d54 725c0095      	inc	_uiInfoSet+49
4303                     ; 885 		if( UI_RID == uiInfoSet.valve )
4305  0d58 c60095        	ld	a,_uiInfoSet+49
4306  0d5b c1006b        	cp	a,_uiInfoSet+7
4307  0d5e 2604          	jrne	L1531
4308                     ; 886 			UI_RID = 0;
4310  0d60 725f0095      	clr	_uiInfoSet+49
4311  0d64               L1531:
4312                     ; 887 		STATUS_NEXT(prev);
4319  0d64 7b11          	ld	a,(OFST+5,sp)
4320  0d66 c7000e        	ld	__ds,a
4322  0d69 725f000f      	clr	__dsCount
4324  0d6d 35ff0010      	mov	__dsPrev,#255
4326  0d71               L1031:
4327                     ; 889 }
4330  0d71 5b0e          	addw	sp,#14
4331  0d73 81            	ret	
4332  0d74               LC024:
4333  0d74 c60095        	ld	a,_uiInfoSet+49
4334  0d77 5f            	clrw	x
4335  0d78 97            	ld	xl,a
4336  0d79 81            	ret	
4339                     	switch	.data
4340  0012               ___func_rc_timerout:
4341  0012 00            	dc.b	0
4342  0013               ___func_rc_timerout1:
4343  0013 00            	dc.b	0
4344  0014               ___func_rc_timerout2:
4345  0014 00            	dc.b	0
4404                     ; 898 uint8_t	disp_status_run(uint8_t key, uint8_t next, uint8_t prev)
4404                     ; 899 {
4405                     	switch	.text
4406  0d7a               _disp_status_run:
4408  0d7a 89            	pushw	x
4409       00000000      OFST:	set	0
4412                     ; 901 	if( _dsCount == 0 )
4414  0d7b c6000f        	ld	a,__dsCount
4415  0d7e 2611          	jrne	L3731
4416                     ; 903 		disp_next();
4418  0d80 cd049a        	call	_disp_next
4420                     ; 904 		LCD_BIT_SET(bP15);
4422  0d83 c6003f        	ld	a,_iLF_DEF+63
4423  0d86 5f            	clrw	x
4424  0d87 97            	ld	xl,a
4425  0d88 d6540c        	ld	a,(21516,x)
4426  0d8b ca003f        	or	a,_bLF_DEF+63
4427  0d8e d7540c        	ld	(21516,x),a
4428  0d91               L3731:
4429                     ; 907 	if( key == 4 )	
4431  0d91 7b01          	ld	a,(OFST+1,sp)
4432  0d93 a104          	cp	a,#4
4433  0d95 2703cc0f8c    	jrne	L5731
4434                     ; 909 		copy_infoSet();
4436  0d9a cd16a1        	call	_copy_infoSet
4438                     ; 910 		FW_MODE(uiInfo.mode);
4440  0d9d c60008        	ld	a,_uiInfo+8
4441  0da0 97            	ld	xl,a
4442  0da1 a609          	ld	a,#9
4443  0da3 95            	ld	xh,a
4444  0da4 cd0000        	call	_file_write
4446                     ; 911 		FW_ID(uiInfo.id);
4448  0da7 c60004        	ld	a,_uiInfo+4
4449  0daa 97            	ld	xl,a
4450  0dab a60a          	ld	a,#10
4451  0dad 95            	ld	xh,a
4452  0dae cd0000        	call	_file_write
4454                     ; 912 		FW_TOFFSET(uiInfo.tOffset);
4456  0db1 c60011        	ld	a,_uiInfo+17
4457  0db4 97            	ld	xl,a
4458  0db5 a614          	ld	a,#20
4459  0db7 95            	ld	xh,a
4460  0db8 cd0000        	call	_file_write
4462                     ; 913 		if( uiInfo.mode == 1 )
4464  0dbb c60008        	ld	a,_uiInfo+8
4465  0dbe 4a            	dec	a
4466  0dbf 2703cc0f7b    	jrne	L7731
4467                     ; 915 			func_rc_setting();
4469  0dc4 cd0000        	call	_func_rc_setting
4471                     ; 916 			__func_rc_timerout = 6;
4473  0dc7 35060012      	mov	___func_rc_timerout,#6
4474                     ; 917 			FW_CNTLMODE(uiInfo.cntlMode);
4476  0dcb c60003        	ld	a,_uiInfo+3
4477  0dce 97            	ld	xl,a
4478  0dcf a608          	ld	a,#8
4479  0dd1 95            	ld	xh,a
4480  0dd2 cd0000        	call	_file_write
4482                     ; 918 			FW_VALVE(uiInfo.valve);
4484  0dd5 c6000a        	ld	a,_uiInfo+10
4485  0dd8 97            	ld	xl,a
4486  0dd9 a60e          	ld	a,#14
4487  0ddb 95            	ld	xh,a
4488  0ddc cd0000        	call	_file_write
4490                     ; 919 			FW_VALVE_SUB(uiInfo.valve_sub);
4492  0ddf c6000b        	ld	a,_uiInfo+11
4493  0de2 97            	ld	xl,a
4494  0de3 a62c          	ld	a,#44
4495  0de5 95            	ld	xh,a
4496  0de6 cd0000        	call	_file_write
4498                     ; 920 			FW_CNT(uiInfo.cnt);
4500  0de9 c60005        	ld	a,_uiInfo+5
4501  0dec 97            	ld	xl,a
4502  0ded a60b          	ld	a,#11
4503  0def 95            	ld	xh,a
4504  0df0 cd0000        	call	_file_write
4506                     ; 921 			FW_CNT_SUB(uiInfo.cnt_sub);
4508  0df3 c60006        	ld	a,_uiInfo+6
4509  0df6 97            	ld	xl,a
4510  0df7 a62b          	ld	a,#43
4511  0df9 95            	ld	xh,a
4512  0dfa cd0000        	call	_file_write
4514                     ; 922 			FW_CNT_MODE(uiInfo.controlMode);
4516  0dfd c60009        	ld	a,_uiInfo+9
4517  0e00 97            	ld	xl,a
4518  0e01 a60d          	ld	a,#13
4519  0e03 95            	ld	xh,a
4520  0e04 cd0000        	call	_file_write
4522                     ; 923 			FW_OPMODE(uiInfo.opMode);
4524  0e07 c60007        	ld	a,_uiInfo+7
4525  0e0a 97            	ld	xl,a
4526  0e0b a60c          	ld	a,#12
4527  0e0d 95            	ld	xh,a
4528  0e0e cd0000        	call	_file_write
4530                     ; 924 			FW_POTYPE(uiInfo.poType);
4532  0e11 c6000f        	ld	a,_uiInfo+15
4533  0e14 97            	ld	xl,a
4534  0e15 a612          	ld	a,#18
4535  0e17 95            	ld	xh,a
4536  0e18 cd0000        	call	_file_write
4538                     ; 925 			FW_HOUSECAPA(uiInfo.houseCapa);
4540  0e1b c60010        	ld	a,_uiInfo+16
4541  0e1e 97            	ld	xl,a
4542  0e1f a613          	ld	a,#19
4543  0e21 95            	ld	xh,a
4544  0e22 cd0000        	call	_file_write
4546                     ; 926 			FW_LPM(uiInfo.lpmType);
4548  0e25 c60013        	ld	a,_uiInfo+19
4549  0e28 97            	ld	xl,a
4550  0e29 a628          	ld	a,#40
4551  0e2b 95            	ld	xh,a
4552  0e2c cd0000        	call	_file_write
4554                     ; 927 			FW_TEMPOFFSET(uiInfo.tempOffset);
4556  0e2f c60012        	ld	a,_uiInfo+18
4557  0e32 97            	ld	xl,a
4558  0e33 a627          	ld	a,#39
4559  0e35 95            	ld	xh,a
4560  0e36 cd0000        	call	_file_write
4562                     ; 929 			FW_VALVE_INFOS
4564  0e39 c60015        	ld	a,_uiInfo+21
4565  0e3c 97            	ld	xl,a
4566  0e3d a615          	ld	a,#21
4567  0e3f 95            	ld	xh,a
4568  0e40 cd0000        	call	_file_write
4572  0e43 c60016        	ld	a,_uiInfo+22
4573  0e46 97            	ld	xl,a
4574  0e47 a616          	ld	a,#22
4575  0e49 95            	ld	xh,a
4576  0e4a cd0000        	call	_file_write
4580  0e4d c60017        	ld	a,_uiInfo+23
4581  0e50 97            	ld	xl,a
4582  0e51 a617          	ld	a,#23
4583  0e53 95            	ld	xh,a
4584  0e54 cd0000        	call	_file_write
4588  0e57 c60018        	ld	a,_uiInfo+24
4589  0e5a 97            	ld	xl,a
4590  0e5b a618          	ld	a,#24
4591  0e5d 95            	ld	xh,a
4592  0e5e cd0000        	call	_file_write
4596  0e61 c60019        	ld	a,_uiInfo+25
4597  0e64 97            	ld	xl,a
4598  0e65 a619          	ld	a,#25
4599  0e67 95            	ld	xh,a
4600  0e68 cd0000        	call	_file_write
4604  0e6b c6001a        	ld	a,_uiInfo+26
4605  0e6e 97            	ld	xl,a
4606  0e6f a61a          	ld	a,#26
4607  0e71 95            	ld	xh,a
4608  0e72 cd0000        	call	_file_write
4612  0e75 c6001b        	ld	a,_uiInfo+27
4613  0e78 97            	ld	xl,a
4614  0e79 a61b          	ld	a,#27
4615  0e7b 95            	ld	xh,a
4616  0e7c cd0000        	call	_file_write
4620  0e7f c6001c        	ld	a,_uiInfo+28
4621  0e82 97            	ld	xl,a
4622  0e83 a61c          	ld	a,#28
4623  0e85 95            	ld	xh,a
4624  0e86 cd0000        	call	_file_write
4628  0e89 c60025        	ld	a,_uiInfo+37
4629  0e8c 97            	ld	xl,a
4630  0e8d a62e          	ld	a,#46
4631  0e8f 95            	ld	xh,a
4632  0e90 cd0000        	call	_file_write
4636  0e93 c60026        	ld	a,_uiInfo+38
4637  0e96 97            	ld	xl,a
4638  0e97 a62f          	ld	a,#47
4639  0e99 95            	ld	xh,a
4640  0e9a cd0000        	call	_file_write
4644  0e9d c60027        	ld	a,_uiInfo+39
4645  0ea0 97            	ld	xl,a
4646  0ea1 a630          	ld	a,#48
4647  0ea3 95            	ld	xh,a
4648  0ea4 cd0000        	call	_file_write
4652  0ea7 c60028        	ld	a,_uiInfo+40
4653  0eaa 97            	ld	xl,a
4654  0eab a631          	ld	a,#49
4655  0ead 95            	ld	xh,a
4656  0eae cd0000        	call	_file_write
4660  0eb1 c60029        	ld	a,_uiInfo+41
4661  0eb4 97            	ld	xl,a
4662  0eb5 a632          	ld	a,#50
4663  0eb7 95            	ld	xh,a
4664  0eb8 cd0000        	call	_file_write
4668  0ebb c6002a        	ld	a,_uiInfo+42
4669  0ebe 97            	ld	xl,a
4670  0ebf a633          	ld	a,#51
4671  0ec1 95            	ld	xh,a
4672  0ec2 cd0000        	call	_file_write
4676  0ec5 c6002b        	ld	a,_uiInfo+43
4677  0ec8 97            	ld	xl,a
4678  0ec9 a634          	ld	a,#52
4679  0ecb 95            	ld	xh,a
4680  0ecc cd0000        	call	_file_write
4684  0ecf c6002c        	ld	a,_uiInfo+44
4685  0ed2 97            	ld	xl,a
4686  0ed3 a635          	ld	a,#53
4687  0ed5 95            	ld	xh,a
4688  0ed6 cd0000        	call	_file_write
4690                     ; 930 			FW_VALVE_RCINFOS
4692  0ed9 c6001d        	ld	a,_uiInfo+29
4693  0edc 97            	ld	xl,a
4694  0edd a61d          	ld	a,#29
4695  0edf 95            	ld	xh,a
4696  0ee0 cd0000        	call	_file_write
4700  0ee3 c6001e        	ld	a,_uiInfo+30
4701  0ee6 97            	ld	xl,a
4702  0ee7 a61e          	ld	a,#30
4703  0ee9 95            	ld	xh,a
4704  0eea cd0000        	call	_file_write
4708  0eed c6001f        	ld	a,_uiInfo+31
4709  0ef0 97            	ld	xl,a
4710  0ef1 a61f          	ld	a,#31
4711  0ef3 95            	ld	xh,a
4712  0ef4 cd0000        	call	_file_write
4716  0ef7 c60020        	ld	a,_uiInfo+32
4717  0efa 97            	ld	xl,a
4718  0efb a620          	ld	a,#32
4719  0efd 95            	ld	xh,a
4720  0efe cd0000        	call	_file_write
4724  0f01 c60021        	ld	a,_uiInfo+33
4725  0f04 97            	ld	xl,a
4726  0f05 a621          	ld	a,#33
4727  0f07 95            	ld	xh,a
4728  0f08 cd0000        	call	_file_write
4732  0f0b c60022        	ld	a,_uiInfo+34
4733  0f0e 97            	ld	xl,a
4734  0f0f a622          	ld	a,#34
4735  0f11 95            	ld	xh,a
4736  0f12 cd0000        	call	_file_write
4740  0f15 c60023        	ld	a,_uiInfo+35
4741  0f18 97            	ld	xl,a
4742  0f19 a623          	ld	a,#35
4743  0f1b 95            	ld	xh,a
4744  0f1c cd0000        	call	_file_write
4748  0f1f c60024        	ld	a,_uiInfo+36
4749  0f22 97            	ld	xl,a
4750  0f23 a624          	ld	a,#36
4751  0f25 95            	ld	xh,a
4752  0f26 cd0000        	call	_file_write
4756  0f29 c6002d        	ld	a,_uiInfo+45
4757  0f2c 97            	ld	xl,a
4758  0f2d a636          	ld	a,#54
4759  0f2f 95            	ld	xh,a
4760  0f30 cd0000        	call	_file_write
4764  0f33 c6002e        	ld	a,_uiInfo+46
4765  0f36 97            	ld	xl,a
4766  0f37 a637          	ld	a,#55
4767  0f39 95            	ld	xh,a
4768  0f3a cd0000        	call	_file_write
4772  0f3d c6002f        	ld	a,_uiInfo+47
4773  0f40 97            	ld	xl,a
4774  0f41 a638          	ld	a,#56
4775  0f43 95            	ld	xh,a
4776  0f44 cd0000        	call	_file_write
4780  0f47 c60030        	ld	a,_uiInfo+48
4781  0f4a 97            	ld	xl,a
4782  0f4b a639          	ld	a,#57
4783  0f4d 95            	ld	xh,a
4784  0f4e cd0000        	call	_file_write
4788  0f51 c60031        	ld	a,_uiInfo+49
4789  0f54 97            	ld	xl,a
4790  0f55 a63a          	ld	a,#58
4791  0f57 95            	ld	xh,a
4792  0f58 cd0000        	call	_file_write
4796  0f5b c60032        	ld	a,_uiInfo+50
4797  0f5e 97            	ld	xl,a
4798  0f5f a63b          	ld	a,#59
4799  0f61 95            	ld	xh,a
4800  0f62 cd0000        	call	_file_write
4804  0f65 c60033        	ld	a,_uiInfo+51
4805  0f68 97            	ld	xl,a
4806  0f69 a63c          	ld	a,#60
4807  0f6b 95            	ld	xh,a
4808  0f6c cd0000        	call	_file_write
4812  0f6f c60034        	ld	a,_uiInfo+52
4813  0f72 97            	ld	xl,a
4814  0f73 a63d          	ld	a,#61
4815  0f75 95            	ld	xh,a
4816  0f76 cd0000        	call	_file_write
4819  0f79 2004          	jra	L1041
4820  0f7b               L7731:
4821                     ; 934 			__func_rc_timerout = 4;
4823  0f7b 35040012      	mov	___func_rc_timerout,#4
4824  0f7f               L1041:
4825                     ; 937 		__func_rc_timerout1 = 0;
4827  0f7f 725f0013      	clr	___func_rc_timerout1
4828                     ; 938 		__func_rc_timerout2 = __timer1s;
4830  0f83 5500000014    	mov	___func_rc_timerout2,___timer1s
4831                     ; 939 		STATUS_NEXT(next);	
4833  0f88 7b02          	ld	a,(OFST+2,sp)
4838  0f8a 2012          	jp	LC025
4839  0f8c               L5731:
4840                     ; 941 	else if( key == 2 )
4842  0f8c a102          	cp	a,#2
4843  0f8e 2608          	jrne	L5041
4844                     ; 943 		_backup_backlight = 0;
4846  0f90 725f0009      	clr	__backup_backlight
4847                     ; 945 		return 1;
4849  0f94 a601          	ld	a,#1
4851  0f96 2012          	jra	L4101
4852  0f98               L5041:
4853                     ; 947 	else if( key == 8 )
4855  0f98 a108          	cp	a,#8
4856  0f9a 260d          	jrne	L3041
4857                     ; 949 		STATUS_NEXT(prev);
4859  0f9c 7b05          	ld	a,(OFST+5,sp)
4864  0f9e               LC025:
4865  0f9e c7000e        	ld	__ds,a
4867  0fa1 725f000f      	clr	__dsCount
4869  0fa5 35ff0010      	mov	__dsPrev,#255
4871  0fa9               L3041:
4872                     ; 951 	return 0;
4874  0fa9 4f            	clr	a
4876  0faa               L4101:
4878  0faa 85            	popw	x
4879  0fab 81            	ret	
4939                     ; 954 void	disp_status_exit(uint8_t key, uint8_t next)
4939                     ; 955 {
4940                     	switch	.text
4941  0fac               _disp_status_exit:
4943  0fac 89            	pushw	x
4944       00000001      OFST:	set	1
4947                     ; 958 	_backup_backlight = 0;
4949  0fad 725f0009      	clr	__backup_backlight
4950  0fb1 88            	push	a
4951                     ; 959 	if( (_t20ms%10) != 0 )
4953  0fb2 c60000        	ld	a,__t20ms
4954  0fb5 5f            	clrw	x
4955  0fb6 97            	ld	xl,a
4956  0fb7 a60a          	ld	a,#10
4957  0fb9 cd0000        	call	c_smodx
4959  0fbc 5d            	tnzw	x
4960  0fbd 2706          	jreq	L3341
4961                     ; 961 		_dsPrev = 0;
4963  0fbf 725f0010      	clr	__dsPrev
4964                     ; 962 		return;
4966  0fc3 2005          	jra	L4201
4967  0fc5               L3341:
4968                     ; 965 	if( _dsPrev != 0 )
4970  0fc5 c60010        	ld	a,__dsPrev
4971  0fc8 2703          	jreq	L5341
4972                     ; 966 		return;
4973  0fca               L4201:
4976  0fca 5b03          	addw	sp,#3
4977  0fcc 81            	ret	
4978  0fcd               L5341:
4979                     ; 969 	_dsCount++;
4981  0fcd 725c000f      	inc	__dsCount
4982                     ; 970 	_dsPrev = 1;
4984  0fd1 35010010      	mov	__dsPrev,#1
4985                     ; 971 	lcd_clear(0);
4987  0fd5 cd0000        	call	_lcd_clear
4989                     ; 972 	for( i=0; i<4; i++ )
4991  0fd8 0f01          	clr	(OFST+0,sp)
4992  0fda               L7341:
4993                     ; 973 		lcd_disp_n(i, _dsCount%10);
4995  0fda c6000f        	ld	a,__dsCount
4996  0fdd 5f            	clrw	x
4997  0fde 97            	ld	xl,a
4998  0fdf a60a          	ld	a,#10
4999  0fe1 62            	div	x,a
5000  0fe2 97            	ld	xl,a
5001  0fe3 7b01          	ld	a,(OFST+0,sp)
5002  0fe5 95            	ld	xh,a
5003  0fe6 cd0000        	call	_lcd_disp_n
5005                     ; 972 	for( i=0; i<4; i++ )
5007  0fe9 0c01          	inc	(OFST+0,sp)
5010  0feb 7b01          	ld	a,(OFST+0,sp)
5011  0fed a104          	cp	a,#4
5012  0fef 25e9          	jrult	L7341
5013                     ; 975 	if( __func_rc_settingCb == 1 && _dsCount >= 10 )
5015  0ff1 c60000        	ld	a,___func_rc_settingCb
5016  0ff4 4a            	dec	a
5017  0ff5 2607          	jrne	L5441
5019  0ff7 c6000f        	ld	a,__dsCount
5020  0ffa a10a          	cp	a,#10
5021                     ; 977 		STATUS_NEXT(next);
5024                     ; 978 		return;
5027  0ffc 242f          	jruge	L5541
5028  0ffe               L5441:
5029                     ; 980 	if( __timer1s != __func_rc_timerout2 )
5031  0ffe c60000        	ld	a,___timer1s
5032  1001 c10014        	cp	a,___func_rc_timerout2
5033  1004 2736          	jreq	L7441
5034                     ; 982 		if( __func_rc_timerout1 == 0 )
5036  1006 c60013        	ld	a,___func_rc_timerout1
5037  1009 26bf          	jrne	L4201
5038                     ; 984 			__func_rc_timerout2 = __timer1s;
5040  100b 5500000014    	mov	___func_rc_timerout2,___timer1s
5041                     ; 985 			__func_rc_timerout1 = 1;
5043  1010 35010013      	mov	___func_rc_timerout1,#1
5044                     ; 986 			__func_rc_timerout--;
5046  1014 725a0012      	dec	___func_rc_timerout
5047                     ; 987 			if( __func_rc_timerout == 0 )
5049  1018 26b0          	jrne	L4201
5050                     ; 989 				if( uiInfo.mode == 1 )
5052  101a c60008        	ld	a,_uiInfo+8
5053  101d 4a            	dec	a
5054  101e 260d          	jrne	L5541
5055                     ; 993 					ui_error = 19;
5057  1020 35130000      	mov	_ui_error,#19
5058                     ; 994 					_ds = 97;
5060  1024 3561000e      	mov	__ds,#97
5061                     ; 995 					_dsCount = 0;
5063  1028 c7000f        	ld	__dsCount,a
5065  102b 209d          	jra	L4201
5066  102d               L5541:
5067                     ; 999 					STATUS_NEXT(next);
5074  102d 7b03          	ld	a,(OFST+2,sp)
5075  102f c7000e        	ld	__ds,a
5077  1032 725f000f      	clr	__dsCount
5079  1036 35ff0010      	mov	__dsPrev,#255
5081  103a 208e          	jra	L4201
5082  103c               L7441:
5083                     ; 1005 		__func_rc_timerout1 = 0;
5085  103c 725f0013      	clr	___func_rc_timerout1
5086                     ; 1006 }
5088  1040 2088          	jra	L4201
5091                     	switch	.data
5092  0015               __tim1min:
5093  0015 00            	dc.b	0
5094  0016               __tim30min:
5095  0016 00            	dc.b	0
5096  0017               __timFlag:
5097  0017 00            	dc.b	0
5121                     ; 1012 void	timerClear(void)
5121                     ; 1013 {
5122                     	switch	.text
5123  1042               _timerClear:
5127                     ; 1014 	_tim1min = 0;
5129  1042 725f0015      	clr	__tim1min
5130                     ; 1015 	_tim30min = 0;
5132  1046 725f0016      	clr	__tim30min
5133                     ; 1016 	_timFlag = 0;
5135  104a 725f0017      	clr	__timFlag
5136                     ; 1017 }
5139  104e 81            	ret	
5178                     ; 1019 void	disp_status_loop_message(uint8_t i)
5178                     ; 1020 {
5179                     	switch	.text
5180  104f               _disp_status_loop_message:
5182  104f 88            	push	a
5183       00000000      OFST:	set	0
5186                     ; 1021 	lcd_clear_btn();
5188  1050 cd0000        	call	_lcd_clear_btn
5190                     ; 1022 	if( i == 0 )		/*	(0)난방*/	
5192  1053 7b01          	ld	a,(OFST+1,sp)
5193  1055 2614          	jrne	L7051
5194                     ; 1024 		_disp_mode = 0x01;	
5196  1057 35010000      	mov	__disp_mode,#1
5197                     ; 1025 		LCD_BIT_SET(bP12);	
5199  105b 5f            	clrw	x
5200  105c c60020        	ld	a,_iLF_DEF+32
5201  105f 97            	ld	xl,a
5202  1060 d6540c        	ld	a,(21516,x)
5203  1063 ca0020        	or	a,_bLF_DEF+32
5204  1066 cd1105        	call	LC030
5205                     ; 1029 		LCD_BIT_SET(bP15);	
5206                     ; 1030 		LCD_BIT_SET(bP14);	
5207                     ; 1031 		LCD_BIT_SET(bDP2);	
5209  1069 2057          	jp	LC029
5210  106b               L7051:
5211                     ; 1033 	else if( i == 1 )	/*	(1)예약*/	
5213  106b a101          	cp	a,#1
5214  106d 261d          	jrne	L3151
5215                     ; 1035 		_disp_mode = 0x08;	
5217  106f 35080000      	mov	__disp_mode,#8
5218                     ; 1036 		LCD_BIT_SET(bP10);	
5220  1073 5f            	clrw	x
5221  1074 c6003a        	ld	a,_iLF_DEF+58
5222  1077 97            	ld	xl,a
5223  1078 d6540c        	ld	a,(21516,x)
5224  107b ca003a        	or	a,_bLF_DEF+58
5225  107e d7540c        	ld	(21516,x),a
5226                     ; 1037 		LCD_BIT_SET(bS2d);	
5228  1081 c6001a        	ld	a,_iLF_DEF+26
5229  1084 cd1127        	call	LC031
5230  1087 ca001a        	or	a,_bLF_DEF+26
5231                     ; 1039 		LCD_BIT_SET(bP19);	
5232                     ; 1040 		LCD_BIT_SET(bP20);	
5233                     ; 1041 		LCD_BIT_SET(bDP1);	
5235  108a 201f          	jp	LC028
5236  108c               L3151:
5237                     ; 1043 	else if( i == 2 )	/*	(2)반복*/	
5239  108c a102          	cp	a,#2
5240  108e 261f          	jrne	L7151
5241                     ; 1045 		_disp_mode = 0x10;	
5243  1090 35100000      	mov	__disp_mode,#16
5244                     ; 1046 		LCD_BIT_SET(bP9);	
5246  1094 5f            	clrw	x
5247  1095 c60031        	ld	a,_iLF_DEF+49
5248  1098 97            	ld	xl,a
5249  1099 d6540c        	ld	a,(21516,x)
5250  109c ca0031        	or	a,_bLF_DEF+49
5251  109f d7540c        	ld	(21516,x),a
5252                     ; 1047 		LCD_BIT_SET(bS1);	
5254  10a2 c6002a        	ld	a,_iLF_DEF+42
5255  10a5 cd1127        	call	LC031
5256  10a8 ca002a        	or	a,_bLF_DEF+42
5257                     ; 1049 		LCD_BIT_SET(bP19);	
5259                     ; 1050 		LCD_BIT_SET(bP20);	
5261                     ; 1051 		LCD_BIT_SET(bDP1);	
5263  10ab               LC028:
5264  10ab ad58          	call	LC030
5266  10ad 2049          	jp	LC027
5267  10af               L7151:
5268                     ; 1053 	else if( i == 8 )		/*	(1)외출*/	
5270  10af a108          	cp	a,#8
5271  10b1 2632          	jrne	L3251
5272                     ; 1055 		_disp_mode = 0x02;	
5274  10b3 35020000      	mov	__disp_mode,#2
5275                     ; 1056 		LCD_BIT_SET(bP13);	
5277  10b7 5f            	clrw	x
5278  10b8 c60010        	ld	a,_iLF_DEF+16
5279  10bb 97            	ld	xl,a
5280  10bc d6540c        	ld	a,(21516,x)
5281  10bf ca0010        	or	a,_bLF_DEF+16
5282                     ; 1057 		LCD_BIT_SET(bP15);	
5284                     ; 1058 		LCD_BIT_SET(bP14);	
5286                     ; 1059 		LCD_BIT_SET(bDP2);	
5288  10c2               LC029:
5289  10c2 d7540c        	ld	(21516,x),a
5291  10c5 c6003f        	ld	a,_iLF_DEF+63
5292  10c8 ad5d          	call	LC031
5293  10ca ca003f        	or	a,_bLF_DEF+63
5294  10cd d7540c        	ld	(21516,x),a
5296  10d0 c60000        	ld	a,_iLF_DEF
5297  10d3 ad52          	call	LC031
5298  10d5 ca0000        	or	a,_bLF_DEF
5299  10d8 d7540c        	ld	(21516,x),a
5301  10db c6000a        	ld	a,_iLF_DEF+10
5302  10de ad47          	call	LC031
5303  10e0 ca000a        	or	a,_bLF_DEF+10
5305  10e3 2013          	jp	LC027
5306  10e5               L3251:
5307                     ; 1061 	else if( i == 5 )	{	_disp_mode = 0x04;	LCD_BIT_SET(bP11);	/*	(2)정지*/	}
5309  10e5 a105          	cp	a,#5
5310  10e7 2612          	jrne	L1151
5313  10e9 35040000      	mov	__disp_mode,#4
5316  10ed 5f            	clrw	x
5317  10ee c60030        	ld	a,_iLF_DEF+48
5318  10f1 97            	ld	xl,a
5319  10f2 d6540c        	ld	a,(21516,x)
5320  10f5 ca0030        	or	a,_bLF_DEF+48
5321  10f8               LC027:
5322  10f8 d7540c        	ld	(21516,x),a
5323  10fb               L1151:
5324                     ; 1063 	_disp_mode2 = _disp_mode;
5326  10fb 5500000000    	mov	__disp_mode2,__disp_mode
5327                     ; 1064 	timerClear();
5329  1100 cd1042        	call	_timerClear
5331                     ; 1065 }
5334  1103 84            	pop	a
5335  1104 81            	ret	
5336  1105               LC030:
5337  1105 d7540c        	ld	(21516,x),a
5338                     ; 1026 		LCD_BIT_SET(bP19);	
5340  1108 c60029        	ld	a,_iLF_DEF+41
5341  110b ad1a          	call	LC031
5342  110d ca0029        	or	a,_bLF_DEF+41
5343  1110 d7540c        	ld	(21516,x),a
5344                     ; 1027 		LCD_BIT_SET(bP20);	
5346  1113 c60039        	ld	a,_iLF_DEF+57
5347  1116 ad0f          	call	LC031
5348  1118 ca0039        	or	a,_bLF_DEF+57
5349  111b d7540c        	ld	(21516,x),a
5350                     ; 1028 		LCD_BIT_SET(bDP1);	
5352  111e c60006        	ld	a,_iLF_DEF+6
5353  1121 ad04          	call	LC031
5354  1123 ca0006        	or	a,_bLF_DEF+6
5355  1126 81            	ret	
5356  1127               LC031:
5357  1127 5f            	clrw	x
5358  1128 97            	ld	xl,a
5359  1129 d6540c        	ld	a,(21516,x)
5360  112c 81            	ret	
5393                     ; 1070 void	disp_status_loop_init(void)
5393                     ; 1071 {
5394                     	switch	.text
5395  112d               _disp_status_loop_init:
5399                     ; 1075 	lcd_clear(0);
5401  112d 4f            	clr	a
5402  112e cd0000        	call	_lcd_clear
5404                     ; 1076 	lcd_blink_clear();
5406  1131 cd0000        	call	_lcd_blink_clear
5408                     ; 1077 	_dsPrev = 0xff;
5410  1134 35ff0010      	mov	__dsPrev,#255
5411                     ; 1078 	if( uiInfo._temp[0] == 0x80 )
5413  1138 c60060        	ld	a,_uiInfo+96
5414  113b a180          	cp	a,#128
5415  113d 2605          	jrne	L1451
5416                     ; 1079 		uiInfo.tSetup = uiInfo._temp[1];
5418  113f 550061000e    	mov	_uiInfo+14,_uiInfo+97
5419  1144               L1451:
5420                     ; 1080 	uiInfo._temp[0] = 0;
5422  1144 725f0060      	clr	_uiInfo+96
5423                     ; 1090 	if( __sUp == 5 )		//	Off
5425  1148 c60001        	ld	a,___sUp
5426  114b a105          	cp	a,#5
5427  114d 2736          	jreq	L5451
5429                     ; 1112 	else if( __sUp == 0 )
5431  114f c60001        	ld	a,___sUp
5432  1152 2613          	jrne	L7451
5433                     ; 1114 		__ui_disp_temp_c(3);
5435  1154 a603          	ld	a,#3
5436  1156 cd0000        	call	___ui_disp_temp_c
5438                     ; 1115 		ui_disp_temp_curr(uiInfo.tCurr);
5440  1159 c60002        	ld	a,_uiInfo+2
5441  115c cd0000        	call	_ui_disp_temp_curr
5443                     ; 1116 		ui_disp_temp_setup(uiInfo.tSetup);
5445  115f c6000e        	ld	a,_uiInfo+14
5446  1162 cd0000        	call	_ui_disp_temp_setup
5449  1165 201e          	jra	L5451
5450  1167               L7451:
5451                     ; 1118 	else if( __sUp == 1 )	//	Y
5453  1167 a101          	cp	a,#1
5454  1169 271a          	jreq	L5451
5456                     ; 1121 	else if( __sUp == 2 )	//	B
5458  116b a102          	cp	a,#2
5459  116d 2716          	jreq	L5451
5461                     ; 1124 	else if( __sUp == 8 )	//	Out
5463  116f a108          	cp	a,#8
5464  1171 2612          	jrne	L5451
5465                     ; 1126 		__ui_disp_temp_c(2);
5467  1173 a602          	ld	a,#2
5468  1175 cd0000        	call	___ui_disp_temp_c
5470                     ; 1127 		uiInfo._temp[0] = 0x80;
5472  1178 35800060      	mov	_uiInfo+96,#128
5473                     ; 1128 		uiInfo._temp[1] = uiInfo.tSetup;
5475  117c 55000e0061    	mov	_uiInfo+97,_uiInfo+14
5476                     ; 1129 		uiInfo.tSetup = 20;
5478  1181 3514000e      	mov	_uiInfo+14,#20
5480  1185               L5451:
5481                     ; 1141 	disp_status_loop_message(__sUp);
5483  1185 c60001        	ld	a,___sUp
5485                     ; 1142 }
5488  1188 cc104f        	jp	_disp_status_loop_message
5515                     ; 1144 void	disp_status_curr_only(void)
5515                     ; 1145 {
5516                     	switch	.text
5517  118b               _disp_status_curr_only:
5521                     ; 1146 	ui_disp_clear_tSetup(0);
5523  118b 4f            	clr	a
5524  118c cd0000        	call	_ui_disp_clear_tSetup
5526                     ; 1150 	ui_disp_temp_curr(uiInfo.tCurr);
5528  118f c60002        	ld	a,_uiInfo+2
5530                     ; 1151 }
5533  1192 cc0000        	jp	_ui_disp_temp_curr
5583                     ; 1153 void	disp_status_error(uint8_t key, uint8_t next)
5583                     ; 1154 {
5584                     	switch	.text
5585  1195               _disp_status_error:
5587  1195 89            	pushw	x
5588       00000000      OFST:	set	0
5591                     ; 1156 	if( _dsCount == 0 )
5593  1196 c6000f        	ld	a,__dsCount
5594  1199 260b          	jrne	L7161
5595                     ; 1158 		disp_next();
5597  119b cd049a        	call	_disp_next
5599                     ; 1159 		lcd_disp_err(ui_error);
5601  119e c60000        	ld	a,_ui_error
5602  11a1 cd0000        	call	_lcd_disp_err
5605  11a4 2005          	jra	L1261
5606  11a6               L7161:
5607                     ; 1165 		if( uiInfo.enc != 0 )
5609  11a6 c60000        	ld	a,_uiInfo
5610  11a9 2606          	jrne	L7751
5611                     ; 1167 			goto Exit;
5613  11ab               L1261:
5614                     ; 1171 	if( key == 2 )
5616  11ab 7b01          	ld	a,(OFST+1,sp)
5617  11ad a102          	cp	a,#2
5618  11af 2622          	jrne	L5261
5619  11b1               L7751:
5620                     ; 1173 Exit:		
5620                     ; 1174 		if( uiInfo.mode == 1 )
5622  11b1 c60008        	ld	a,_uiInfo+8
5623  11b4 4a            	dec	a
5624  11b5 261c          	jrne	L5261
5625                     ; 1177 			func_rc_recover(1);
5627  11b7 4c            	inc	a
5628  11b8 cd0000        	call	_func_rc_recover
5630                     ; 1178 			error_type = 0;
5632  11bb 725f0000      	clr	_error_type
5633                     ; 1179 			error = 0;
5635  11bf 725f0000      	clr	_error
5636                     ; 1180 			lcd_blink_clear();
5638  11c3 cd0000        	call	_lcd_blink_clear
5640                     ; 1181 			STATUS_NEXT(next);
5642  11c6 7b02          	ld	a,(OFST+2,sp)
5643  11c8 c7000e        	ld	__ds,a
5646  11cb 725f000f      	clr	__dsCount
5649  11cf 35ff0010      	mov	__dsPrev,#255
5651  11d3               L5261:
5652                     ; 1184 }
5655  11d3 85            	popw	x
5656  11d4 81            	ret	
5717                     ; 1188 void	disp_status_command(uint8_t key)
5717                     ; 1189 {
5718                     	switch	.text
5719  11d5               _disp_status_command:
5721  11d5 88            	push	a
5722  11d6 88            	push	a
5723       00000001      OFST:	set	1
5726                     ; 1191 	if( _dsCount == 0 )
5728  11d7 c6000f        	ld	a,__dsCount
5729  11da 263a          	jrne	L1361
5730                     ; 1193 		disp_next();
5732  11dc cd049a        	call	_disp_next
5734                     ; 1195 		LCD_BIT_SET(b1A);
5736  11df c60037        	ld	a,_iLF_DEF+55
5737  11e2 cd132c        	call	LC036
5738  11e5 ca0037        	or	a,_bLF_DEF+55
5739  11e8 d7540c        	ld	(21516,x),a
5740                     ; 1196 		LCD_BIT_SET(b1F);
5742  11eb c60038        	ld	a,_iLF_DEF+56
5743  11ee cd132c        	call	LC036
5744  11f1 ca0038        	or	a,_bLF_DEF+56
5745  11f4 d7540c        	ld	(21516,x),a
5746                     ; 1197 		LCD_BIT_SET(b1E);
5748  11f7 c60018        	ld	a,_iLF_DEF+24
5749  11fa cd132c        	call	LC036
5750  11fd ca0018        	or	a,_bLF_DEF+24
5751  1200 d7540c        	ld	(21516,x),a
5752                     ; 1198 		LCD_BIT_SET(b1D);
5754  1203 c60007        	ld	a,_iLF_DEF+7
5755  1206 cd132c        	call	LC036
5756  1209 ca0007        	or	a,_bLF_DEF+7
5757  120c d7540c        	ld	(21516,x),a
5758                     ; 1199 		uiInfo._t = 0;
5760  120f 725f005f      	clr	_uiInfo+95
5762  1213 cc12a7        	jra	L3761
5763  1216               L1361:
5764                     ; 1203 EncEntry:		
5764                     ; 1204 		i = uiInfo._t;
5766  1216 c6005f        	ld	a,_uiInfo+95
5767  1219 6b01          	ld	(OFST+0,sp),a
5768                     ; 1205 		if( uiInfo.enc != 0 )
5770  121b c60000        	ld	a,_uiInfo
5771  121e 271d          	jreq	L5761
5772                     ; 1207 			if( (uiInfo.enc & 0x40) == 0 )
5774  1220 a540          	bcp	a,#64
5775  1222 2609          	jrne	L7761
5776                     ; 1208 				i = (i+_LC-1)%_LC;
5778  1224 7b01          	ld	a,(OFST+0,sp)
5779  1226 5f            	clrw	x
5780  1227 97            	ld	xl,a
5781  1228 1c0009        	addw	x,#9
5784  122b 2005          	jra	L1071
5785  122d               L7761:
5786                     ; 1210 				i = (i+1)%_LC;
5788  122d 7b01          	ld	a,(OFST+0,sp)
5789  122f 5f            	clrw	x
5790  1230 97            	ld	xl,a
5791  1231 5c            	incw	x
5793  1232               L1071:
5794  1232 a60a          	ld	a,#10
5795  1234 cd0000        	call	c_smodx
5796  1237 01            	rrwa	x,a
5797  1238 6b01          	ld	(OFST+0,sp),a
5798                     ; 1211 			uiInfo._t = i;
5800  123a c7005f        	ld	_uiInfo+95,a
5801  123d               L5761:
5802                     ; 1213 		if( _dsPrev != i )
5804  123d c60010        	ld	a,__dsPrev
5805  1240 1101          	cp	a,(OFST+0,sp)
5806  1242 2763          	jreq	L3761
5807                     ; 1215 			_dsPrev = i;
5809  1244 7b01          	ld	a,(OFST+0,sp)
5810  1246 c70010        	ld	__dsPrev,a
5811                     ; 1216 			clear_npos2();
5813  1249 cd048e        	call	_clear_npos2
5815                     ; 1217 			if( i==0 )		lcd_disp_setup_cntl_tab();
5817  124c 7b01          	ld	a,(OFST+0,sp)
5818  124e 2605          	jrne	L5071
5821  1250 cd0000        	call	_lcd_disp_setup_cntl_tab
5824  1253 2052          	jra	L3761
5825  1255               L5071:
5826                     ; 1218 			else if( i==1 )	lcd_disp_setup_cntl_2motor();
5828  1255 a101          	cp	a,#1
5829  1257 2605          	jrne	L1171
5832  1259 cd0000        	call	_lcd_disp_setup_cntl_2motor
5835  125c 2049          	jra	L3761
5836  125e               L1171:
5837                     ; 1219 			else if( i==2 )	lcd_disp_setup_cntl_on();
5839  125e a102          	cp	a,#2
5840  1260 2605          	jrne	L5171
5843  1262 cd0000        	call	_lcd_disp_setup_cntl_on
5846  1265 2040          	jra	L3761
5847  1267               L5171:
5848                     ; 1220 			else if( i==3 )	lcd_disp_setup_cntl_po();
5850  1267 a103          	cp	a,#3
5851  1269 2605          	jrne	L1271
5854  126b cd0000        	call	_lcd_disp_setup_cntl_po
5857  126e 2037          	jra	L3761
5858  1270               L1271:
5859                     ; 1221 			else if( i==4 )	lcd_disp_mir1();
5861  1270 a104          	cp	a,#4
5862  1272 2605          	jrne	L5271
5865  1274 cd0000        	call	_lcd_disp_mir1
5868  1277 202e          	jra	L3761
5869  1279               L5271:
5870                     ; 1222 			else if( i==5 )	lcd_disp_mir2();
5872  1279 a105          	cp	a,#5
5873  127b 2605          	jrne	L1371
5876  127d cd0000        	call	_lcd_disp_mir2
5879  1280 2025          	jra	L3761
5880  1282               L1371:
5881                     ; 1223 			else if( i==6 )	lcd_disp_freset();
5883  1282 a106          	cp	a,#6
5884  1284 2605          	jrne	L5371
5887  1286 cd0000        	call	_lcd_disp_freset
5890  1289 201c          	jra	L3761
5891  128b               L5371:
5892                     ; 1224 			else if( i==7 )	lcd_disp_cnt_host();
5894  128b a107          	cp	a,#7
5895  128d 2605          	jrne	L1471
5898  128f cd0000        	call	_lcd_disp_cnt_host
5901  1292 2013          	jra	L3761
5902  1294               L1471:
5903                     ; 1225 			else if( i==8 )	lcd_disp_cnt_sub();
5905  1294 a108          	cp	a,#8
5906  1296 2605          	jrne	L5471
5909  1298 cd0000        	call	_lcd_disp_cnt_sub
5912  129b 200a          	jra	L3761
5913  129d               L5471:
5914                     ; 1226 			else if( i==9 )	lcd_disp_n(3, 0);
5916  129d a109          	cp	a,#9
5917  129f 2606          	jrne	L3761
5920  12a1 ae0300        	ldw	x,#768
5921  12a4 cd0000        	call	_lcd_disp_n
5923  12a7               L3761:
5924                     ; 1229 	if( key == 0x10 )		__UP
5926  12a7 7b02          	ld	a,(OFST+1,sp)
5927  12a9 a110          	cp	a,#16
5928  12ab 2606          	jrne	L3571
5931  12ad 35010000      	mov	_uiInfo,#1
5935  12b1 2008          	jp	LC032
5936  12b3               L3571:
5937                     ; 1230 	else if( key == 0x20 )	__DN
5939  12b3 a120          	cp	a,#32
5940  12b5 2609          	jrne	L7571
5943  12b7 35400000      	mov	_uiInfo,#64
5946  12bb               LC032:
5948  12bb 0f02          	clr	(OFST+1,sp)
5951  12bd cc1216        	jra	L1361
5952  12c0               L7571:
5953                     ; 1231 	else if( key == 4 )		
5955  12c0 a104          	cp	a,#4
5956  12c2 2658          	jrne	L3671
5957                     ; 1233 		switch( uiInfo._t )
5959  12c4 c6005f        	ld	a,_uiInfo+95
5961                     ; 1266 			break;
5962  12c7 2718          	jreq	L3361
5963  12c9 4a            	dec	a
5964  12ca 271b          	jreq	L5361
5965  12cc 4a            	dec	a
5966  12cd 271e          	jreq	L7361
5967  12cf 4a            	dec	a
5968  12d0 2720          	jreq	L1461
5969  12d2 a003          	sub	a,#3
5970  12d4 2722          	jreq	L3461
5971  12d6 4a            	dec	a
5972  12d7 2727          	jreq	L5461
5973  12d9 4a            	dec	a
5974  12da 2729          	jreq	L7461
5975  12dc 4a            	dec	a
5976  12dd 2737          	jreq	L1561
5977  12df 2049          	jra	L5571
5978  12e1               L3361:
5979                     ; 1235 		case 0:
5979                     ; 1236 			uiInfoSet.opMode = 3;	
5981  12e1 35030068      	mov	_uiInfoSet+4,#3
5982                     ; 1237 			disp_status_run(3, 35, 0);
5984                     ; 1238 			break;
5986  12e5 2024          	jp	LC034
5987  12e7               L5361:
5988                     ; 1239 		case 1:	
5988                     ; 1240 			uiInfoSet.opMode = 2;	
5990  12e7 35020068      	mov	_uiInfoSet+4,#2
5991                     ; 1241 			disp_status_run(3, 35, 0);
5993                     ; 1242 			break;
5995  12eb 201e          	jp	LC034
5996  12ed               L7361:
5997                     ; 1243 		case 2:	
5997                     ; 1244 			uiInfoSet.opMode = 0;	
5999  12ed c70068        	ld	_uiInfoSet+4,a
6000                     ; 1245 			disp_status_run(3, 35, 0);
6002                     ; 1246 			break;
6004  12f0 2019          	jp	LC034
6005  12f2               L1461:
6006                     ; 1247 		case 3:	
6006                     ; 1248 			uiInfoSet.opMode = 1;	
6008  12f2 35010068      	mov	_uiInfoSet+4,#1
6009                     ; 1249 			disp_status_run(3, 35, 0);
6011                     ; 1250 			break;
6013  12f6 2013          	jp	LC034
6014  12f8               L3461:
6015                     ; 1251 		case 6:	
6015                     ; 1252 			func_rc_command(COMMAND_MODE_FACTORY, 100);	
6017  12f8 ae0864        	ldw	x,#2148
6018  12fb cd0000        	call	_func_rc_command
6020                     ; 1253 			break;
6022  12fe 202a          	jra	L5571
6023  1300               L5461:
6024                     ; 1254 		case 7:	
6024                     ; 1255 			//	MAIN
6024                     ; 1256 			func_rc_command(COMMAND_MODE_FACTORY, 110);	
6026  1300 ae086e        	ldw	x,#2158
6028                     ; 1257 			disp_status_run(3, 35, 0);
6030                     ; 1258 			break;
6032  1303 2003          	jp	LC035
6033  1305               L7461:
6034                     ; 1259 		case 8:	
6034                     ; 1260 			//	SUB
6034                     ; 1261 			func_rc_command(COMMAND_MODE_FACTORY, 120);	
6036  1305 ae0878        	ldw	x,#2168
6037  1308               LC035:
6038  1308 cd0000        	call	_func_rc_command
6040                     ; 1262 			disp_status_run(3, 35, 0);
6043  130b               LC034:
6049  130b 4b00          	push	#0
6050  130d ae0323        	ldw	x,#803
6051  1310 cd0d7a        	call	_disp_status_run
6052  1313 84            	pop	a
6053                     ; 1263 			break;
6055  1314 2014          	jra	L5571
6056  1316               L1561:
6057                     ; 1265 			STATUS_NEXT(100);
6059  1316 3564000e      	mov	__ds,#100
6062                     ; 1266 			break;
6065  131a 2007          	jp	LC033
6067  131c               L3671:
6068                     ; 1269 	else if( key == 1 )
6070  131c 4a            	dec	a
6071  131d 260b          	jrne	L5571
6072                     ; 1271 		STATUS_NEXT(99);
6074  131f 3563000e      	mov	__ds,#99
6079  1323               LC033:
6081  1323 c7000f        	ld	__dsCount,a
6083  1326 35ff0010      	mov	__dsPrev,#255
6085  132a               L5571:
6086                     ; 1273 }
6089  132a 85            	popw	x
6090  132b 81            	ret	
6091  132c               LC036:
6092  132c 5f            	clrw	x
6093  132d 97            	ld	xl,a
6094  132e d6540c        	ld	a,(21516,x)
6095  1331 81            	ret	
6134                     ; 1282 void	disp_write_file(uint8_t next)
6134                     ; 1283 {
6135                     	switch	.text
6136  1332               _disp_write_file:
6138  1332 88            	push	a
6139       00000000      OFST:	set	0
6142                     ; 1286 	file_update();
6144  1333 cd0272        	call	_file_update
6146                     ; 1287 	__func_rc_timerout = 5;
6148  1336 35050012      	mov	___func_rc_timerout,#5
6149                     ; 1288 	__func_rc_timerout1 = 0;
6151  133a 725f0013      	clr	___func_rc_timerout1
6152                     ; 1289 	__func_rc_timerout2 = __timer1s;
6154  133e 5500000014    	mov	___func_rc_timerout2,___timer1s
6155                     ; 1290 	func_rc_setting();
6157  1343 cd0000        	call	_func_rc_setting
6159                     ; 1291 	_ds = next;
6161  1346 7b01          	ld	a,(OFST+1,sp)
6162  1348 c7000e        	ld	__ds,a
6163                     ; 1292 }
6166  134b 84            	pop	a
6167  134c 81            	ret	
6203                     ; 1294 void	disp_set_state(uint8_t next)
6203                     ; 1295 {
6204                     	switch	.text
6205  134d               _disp_set_state:
6207  134d 88            	push	a
6208       00000000      OFST:	set	0
6211                     ; 1296 	lcd_blink_clear();
6213  134e cd0000        	call	_lcd_blink_clear
6215                     ; 1297 	STATUS_NEXT(next);
6217  1351 7b01          	ld	a,(OFST+1,sp)
6218  1353 c7000e        	ld	__ds,a
6221  1356 725f000f      	clr	__dsCount
6224  135a 35ff0010      	mov	__dsPrev,#255
6225                     ; 1298 }
6229  135e 84            	pop	a
6230  135f 81            	ret	
6301                     ; 1300 void	disp_statusCb(uint8_t key)
6301                     ; 1301 {
6302                     	switch	.text
6303  1360               _disp_statusCb:
6305  1360 88            	push	a
6306  1361 88            	push	a
6307       00000001      OFST:	set	1
6310                     ; 1303 	if( _ds == 1 )			disp_status_id(key, 36);
6312  1362 c6000e        	ld	a,__ds
6313  1365 a101          	cp	a,#1
6314  1367 260c          	jrne	L3402
6317  1369 ae0024        	ldw	x,#36
6318  136c 7b02          	ld	a,(OFST+1,sp)
6319  136e 95            	ld	xh,a
6320  136f cd04a7        	call	_disp_status_id
6323  1372 cc1535        	jra	L4621
6324  1375               L3402:
6325                     ; 1304 	else if( _ds == 36 )	disp_status_toffset(key, 37);
6327  1375 a124          	cp	a,#36
6328  1377 260c          	jrne	L7402
6331  1379 ae0025        	ldw	x,#37
6332  137c 7b02          	ld	a,(OFST+1,sp)
6333  137e 95            	ld	xh,a
6334  137f cd05fc        	call	_disp_status_toffset
6337  1382 cc1535        	jra	L4621
6338  1385               L7402:
6339                     ; 1305 	else if( _ds == 37 )	
6341  1385 a125          	cp	a,#37
6342  1387 2617          	jrne	L3502
6343                     ; 1307 		t = disp_status_run(key, 38, 1);
6345  1389 4b01          	push	#1
6346  138b ae0026        	ldw	x,#38
6347  138e 7b03          	ld	a,(OFST+2,sp)
6348  1390 95            	ld	xh,a
6349  1391 cd0d7a        	call	_disp_status_run
6351  1394 5b01          	addw	sp,#1
6352                     ; 1308 		if( t == 1 )
6354  1396 4a            	dec	a
6355  1397 26e9          	jrne	L4621
6356                     ; 1309 			_ds = 100;
6358  1399 3564000e      	mov	__ds,#100
6359  139d cc1535        	jra	L4621
6360  13a0               L3502:
6361                     ; 1311 	else if( _ds == 38 )	disp_status_exit(key, 100);
6363  13a0 a126          	cp	a,#38
6364  13a2 260c          	jrne	L1602
6367  13a4 ae0064        	ldw	x,#100
6368  13a7 7b02          	ld	a,(OFST+1,sp)
6369  13a9 95            	ld	xh,a
6370  13aa cd0fac        	call	_disp_status_exit
6373  13ad cc1535        	jra	L4621
6374  13b0               L1602:
6375                     ; 1313 	else if( _ds == 9 )		disp_status_run_op(key, 61);
6377  13b0 a109          	cp	a,#9
6378  13b2 260c          	jrne	L5602
6381  13b4 ae003d        	ldw	x,#61
6382  13b7 7b02          	ld	a,(OFST+1,sp)
6383  13b9 95            	ld	xh,a
6384  13ba cd06ca        	call	_disp_status_run_op
6387  13bd cc1535        	jra	L4621
6388  13c0               L5602:
6389                     ; 1314 	else if( _ds == 61 )	disp_status_cntl_op(key, 63);
6391  13c0 a13d          	cp	a,#61
6392  13c2 260c          	jrne	L1702
6395  13c4 ae003f        	ldw	x,#63
6396  13c7 7b02          	ld	a,(OFST+1,sp)
6397  13c9 95            	ld	xh,a
6398  13ca cd0743        	call	_disp_status_cntl_op
6401  13cd cc1535        	jra	L4621
6402  13d0               L1702:
6403                     ; 1315 	else if( _ds == 63 )	disp_status_valveCount(key, 64);
6405  13d0 a13f          	cp	a,#63
6406  13d2 260c          	jrne	L5702
6409  13d4 ae0040        	ldw	x,#64
6410  13d7 7b02          	ld	a,(OFST+1,sp)
6411  13d9 95            	ld	xh,a
6412  13da cd0545        	call	_disp_status_valveCount
6415  13dd cc1535        	jra	L4621
6416  13e0               L5702:
6417                     ; 1316 	else if( _ds == 64 )	disp_status_houseCapa(key, 65);	//	if opMode==0, skip
6419  13e0 a140          	cp	a,#64
6420  13e2 260c          	jrne	L1012
6423  13e4 ae0041        	ldw	x,#65
6424  13e7 7b02          	ld	a,(OFST+1,sp)
6425  13e9 95            	ld	xh,a
6426  13ea cd07b9        	call	_disp_status_houseCapa
6429  13ed cc1535        	jra	L4621
6430  13f0               L1012:
6431                     ; 1317 	else if( _ds == 65 )	disp_status_po_type(key, 66);	//	비례제어
6433  13f0 a141          	cp	a,#65
6434  13f2 260c          	jrne	L5012
6437  13f4 ae0042        	ldw	x,#66
6438  13f7 7b02          	ld	a,(OFST+1,sp)
6439  13f9 95            	ld	xh,a
6440  13fa cd0862        	call	_disp_status_po_type
6443  13fd cc1535        	jra	L4621
6444  1400               L5012:
6445                     ; 1318 	else if( _ds == 66 )	disp_status_lpm(key, 67);		//	세대밸브 if cntlMode==1, skip
6447  1400 a142          	cp	a,#66
6448  1402 260c          	jrne	L1112
6451  1404 ae0043        	ldw	x,#67
6452  1407 7b02          	ld	a,(OFST+1,sp)
6453  1409 95            	ld	xh,a
6454  140a cd08ed        	call	_disp_status_lpm
6457  140d cc1535        	jra	L4621
6458  1410               L1112:
6459                     ; 1319 	else if( _ds == 67 )	disp_status_temp_offset(key, 68);	//	if opMode==0, skip
6461  1410 a143          	cp	a,#67
6462  1412 260c          	jrne	L5112
6465  1414 ae0044        	ldw	x,#68
6466  1417 7b02          	ld	a,(OFST+1,sp)
6467  1419 95            	ld	xh,a
6468  141a cd09a7        	call	_disp_status_temp_offset
6471  141d cc1535        	jra	L4621
6472  1420               L5112:
6473                     ; 1321 	else if( _ds == 68 )	disp_status_valveinfo(key, 70, 68);
6475  1420 a144          	cp	a,#68
6476  1422 260f          	jrne	L1212
6479  1424 4b44          	push	#68
6480  1426 ae0046        	ldw	x,#70
6481  1429 7b03          	ld	a,(OFST+2,sp)
6482  142b 95            	ld	xh,a
6483  142c cd0bc9        	call	_disp_status_valveinfo
6485  142f 84            	pop	a
6487  1430 cc1535        	jra	L4621
6488  1433               L1212:
6489                     ; 1322 	else if( _ds == 70 )	
6491  1433 a146          	cp	a,#70
6492  1435 2617          	jrne	L5212
6493                     ; 1324 		t = disp_status_run(key, 71, 9);
6495  1437 4b09          	push	#9
6496  1439 ae0047        	ldw	x,#71
6497  143c 7b03          	ld	a,(OFST+2,sp)
6498  143e 95            	ld	xh,a
6499  143f cd0d7a        	call	_disp_status_run
6501  1442 5b01          	addw	sp,#1
6502                     ; 1325 		if( t == 1 )
6504  1444 4a            	dec	a
6505  1445 26e9          	jrne	L4621
6506                     ; 1326 			_ds = 100;
6508  1447 3564000e      	mov	__ds,#100
6509  144b cc1535        	jra	L4621
6510  144e               L5212:
6511                     ; 1328 	else if( _ds == 71 )	disp_status_exit(key, 100);
6513  144e a147          	cp	a,#71
6514  1450 260c          	jrne	L3312
6517  1452 ae0064        	ldw	x,#100
6518  1455 7b02          	ld	a,(OFST+1,sp)
6519  1457 95            	ld	xh,a
6520  1458 cd0fac        	call	_disp_status_exit
6523  145b cc1535        	jra	L4621
6524  145e               L3312:
6525                     ; 1330 	else if( _ds == 10 )	
6527  145e a10a          	cp	a,#10
6528  1460 2617          	jrne	L7312
6529                     ; 1332 		t = disp_status_run(key, 11, 9);
6531  1462 4b09          	push	#9
6532  1464 ae000b        	ldw	x,#11
6533  1467 7b03          	ld	a,(OFST+2,sp)
6534  1469 95            	ld	xh,a
6535  146a cd0d7a        	call	_disp_status_run
6537  146d 5b01          	addw	sp,#1
6538                     ; 1333 		if( t == 1 )
6540  146f 4a            	dec	a
6541  1470 26e9          	jrne	L4621
6542                     ; 1334 			_ds = 100;
6544  1472 3564000e      	mov	__ds,#100
6545  1476 cc1535        	jra	L4621
6546  1479               L7312:
6547                     ; 1336 	else if( _ds == 11 )	disp_status_exit(key, 100);
6549  1479 a10b          	cp	a,#11
6550  147b 260c          	jrne	L5412
6553  147d ae0064        	ldw	x,#100
6554  1480 7b02          	ld	a,(OFST+1,sp)
6555  1482 95            	ld	xh,a
6556  1483 cd0fac        	call	_disp_status_exit
6559  1486 cc1535        	jra	L4621
6560  1489               L5412:
6561                     ; 1338 	else if( _ds == 12 )	disp_status_exit(key, 100);
6563  1489 a10c          	cp	a,#12
6564  148b 260c          	jrne	L1512
6567  148d ae0064        	ldw	x,#100
6568  1490 7b02          	ld	a,(OFST+1,sp)
6569  1492 95            	ld	xh,a
6570  1493 cd0fac        	call	_disp_status_exit
6573  1496 cc1535        	jra	L4621
6574  1499               L1512:
6575                     ; 1339 	else if( _ds == 15 )	
6577  1499 a10f          	cp	a,#15
6578  149b 2617          	jrne	L5512
6579                     ; 1341 		t = disp_status_run(key, 11, 20);
6581  149d 4b14          	push	#20
6582  149f ae000b        	ldw	x,#11
6583  14a2 7b03          	ld	a,(OFST+2,sp)
6584  14a4 95            	ld	xh,a
6585  14a5 cd0d7a        	call	_disp_status_run
6587  14a8 5b01          	addw	sp,#1
6588                     ; 1342 		if( t == 1 )
6590  14aa 4a            	dec	a
6591  14ab 26e9          	jrne	L4621
6592                     ; 1343 			_ds = 100;
6594  14ad 3564000e      	mov	__ds,#100
6595  14b1 cc1535        	jra	L4621
6596  14b4               L5512:
6597                     ; 1345 	else if( _ds == 33 )	disp_status_toffset(key, 34);	//	mainR/C only
6599  14b4 a121          	cp	a,#33
6600  14b6 260b          	jrne	L3612
6603  14b8 ae0022        	ldw	x,#34
6604  14bb 7b02          	ld	a,(OFST+1,sp)
6605  14bd 95            	ld	xh,a
6606  14be cd05fc        	call	_disp_status_toffset
6609  14c1 2072          	jra	L4621
6610  14c3               L3612:
6611                     ; 1346 	else if( _ds == 34 )	
6613  14c3 a122          	cp	a,#34
6614  14c5 2616          	jrne	L7612
6615                     ; 1348 		t = disp_status_run(key, 35, 33);
6617  14c7 4b21          	push	#33
6618  14c9 ae0023        	ldw	x,#35
6619  14cc 7b03          	ld	a,(OFST+2,sp)
6620  14ce 95            	ld	xh,a
6621  14cf cd0d7a        	call	_disp_status_run
6623  14d2 5b01          	addw	sp,#1
6624                     ; 1349 		if( t == 1 )
6626  14d4 4a            	dec	a
6627  14d5 265e          	jrne	L4621
6628                     ; 1350 			_ds = 100;
6630  14d7 3564000e      	mov	__ds,#100
6631  14db 2058          	jra	L4621
6632  14dd               L7612:
6633                     ; 1352 	else if( _ds == 35 )	disp_status_exit(key, 100);
6635  14dd a123          	cp	a,#35
6636  14df 260b          	jrne	L5712
6639  14e1 ae0064        	ldw	x,#100
6640  14e4 7b02          	ld	a,(OFST+1,sp)
6641  14e6 95            	ld	xh,a
6642  14e7 cd0fac        	call	_disp_status_exit
6645  14ea 2049          	jra	L4621
6646  14ec               L5712:
6647                     ; 1354 	else if( _ds == 41 )	disp_status_command(key);
6649  14ec a129          	cp	a,#41
6650  14ee 2607          	jrne	L1022
6653  14f0 7b02          	ld	a,(OFST+1,sp)
6654  14f2 cd11d5        	call	_disp_status_command
6657  14f5 203e          	jra	L4621
6658  14f7               L1022:
6659                     ; 1356 	else if( _ds == 100 )	
6661  14f7 a164          	cp	a,#100
6662  14f9 2616          	jrne	L5022
6663                     ; 1358 		__s = 0;
6665  14fb 725f0000      	clr	___s
6666                     ; 1359 		_dsCount = 0;
6668  14ff 725f000f      	clr	__dsCount
6669                     ; 1360 		_ds = 99;	
6671  1503 3563000e      	mov	__ds,#99
6672                     ; 1361 		_dsPrev = 0xff;
6674  1507 35ff0010      	mov	__dsPrev,#255
6675                     ; 1362 		_remote = 0;
6677  150b 725f0000      	clr	__remote
6679  150f 2024          	jra	L4621
6680  1511               L5022:
6681                     ; 1364 	else if( _ds == 101 || _ds == 133 )
6683  1511 a165          	cp	a,#101
6684  1513 2704          	jreq	L3122
6686  1515 a185          	cp	a,#133
6687  1517 2610          	jrne	L1122
6688  1519               L3122:
6689                     ; 1367 		_dsCount = __timer1s;
6691  1519 550000000f    	mov	__dsCount,___timer1s
6692                     ; 1368 		_dsPrev = _ds - 100;
6694  151e a064          	sub	a,#100
6695  1520 c70010        	ld	__dsPrev,a
6696                     ; 1369 		_ds = 200;
6698  1523 35c8000e      	mov	__ds,#200
6700                     ; 1432 }
6702  1527 200c          	jra	L4621
6703  1529               L1122:
6704                     ; 1371 	else if( _ds == 200 )
6706  1529 a1c8          	cp	a,#200
6707  152b 2619          	jrne	L7122
6708                     ; 1373 		if( _dsCount == __timer1s )
6710  152d c6000f        	ld	a,__dsCount
6711  1530 c10000        	cp	a,___timer1s
6712  1533 2602          	jrne	L1222
6713                     ; 1374 			return;
6714  1535               L4621:
6717  1535 85            	popw	x
6718  1536 81            	ret	
6719  1537               L1222:
6720                     ; 1375 		STATUS_NEXT(_dsPrev);
6722  1537 550010000e    	mov	__ds,__dsPrev
6725  153c 725f000f      	clr	__dsCount
6728  1540 35ff0010      	mov	__dsPrev,#255
6731  1544 20ef          	jra	L4621
6732  1546               L7122:
6733                     ; 1378 	else if( _ds == 80 )	{	config_disp2(key, 81);	}
6735  1546 a150          	cp	a,#80
6736  1548 260b          	jrne	L5222
6739  154a ae0051        	ldw	x,#81
6740  154d 7b02          	ld	a,(OFST+1,sp)
6741  154f 95            	ld	xh,a
6742  1550 cd0000        	call	_config_disp2
6745  1553 20e0          	jra	L4621
6746  1555               L5222:
6747                     ; 1379 	else if( _ds == 81 )	{	disp_write_file(12);	}
6749  1555 a151          	cp	a,#81
6750  1557 2607          	jrne	L1322
6753  1559 a60c          	ld	a,#12
6754  155b cd1332        	call	_disp_write_file
6757  155e 20d5          	jra	L4621
6758  1560               L1322:
6759                     ; 1380 	else if( _ds == 96 )	{	disp_write_file(12);	}
6761  1560 a160          	cp	a,#96
6762  1562 2607          	jrne	L5322
6765  1564 a60c          	ld	a,#12
6766  1566 cd1332        	call	_disp_write_file
6769  1569 20ca          	jra	L4621
6770  156b               L5322:
6771                     ; 1381 	else if( _ds == 97 )
6773  156b a161          	cp	a,#97
6774  156d 2619          	jrne	L1422
6775                     ; 1383 		disp_status_error(key, 99);
6777  156f ae0063        	ldw	x,#99
6778  1572 7b02          	ld	a,(OFST+1,sp)
6779  1574 95            	ld	xh,a
6780  1575 cd1195        	call	_disp_status_error
6782                     ; 1385 			if( error == 0 && error_type == 0 )
6784  1578 c60000        	ld	a,_error
6785  157b 26b8          	jrne	L4621
6787  157d c60000        	ld	a,_error_type
6788  1580 26b3          	jrne	L4621
6789                     ; 1388 				_ds = 100;
6791  1582 3564000e      	mov	__ds,#100
6792  1586 20ad          	jra	L4621
6793  1588               L1422:
6794                     ; 1392 	else if( _ds == 98 )	
6796  1588 a162          	cp	a,#98
6797  158a 2612          	jrne	L7422
6798                     ; 1394 		t = config_disp(key, 96);	
6800  158c ae0060        	ldw	x,#96
6801  158f 7b02          	ld	a,(OFST+1,sp)
6802  1591 95            	ld	xh,a
6803  1592 cd0000        	call	_config_disp
6805                     ; 1395 		if( t == 1 )
6807  1595 4a            	dec	a
6808  1596 269d          	jrne	L4621
6809                     ; 1396 			_ds = 100;
6811  1598 3564000e      	mov	__ds,#100
6812  159c 2097          	jra	L4621
6813  159e               L7422:
6814                     ; 1398 	else if( _ds == 99 )
6816  159e a163          	cp	a,#99
6817  15a0 2693          	jrne	L4621
6818                     ; 1400 		t = getCurrTemp();
6820  15a2 cd0000        	call	_getCurrTemp
6822  15a5 6b01          	ld	(OFST+0,sp),a
6823                     ; 1401 		if( uiInfo.tOffset != 100 )
6825  15a7 c60011        	ld	a,_uiInfo+17
6826  15aa a164          	cp	a,#100
6827  15ac 2711          	jreq	L7522
6828                     ; 1403 			if( uiInfo.tOffset > 100 )
6830  15ae a165          	cp	a,#101
6831  15b0 2506          	jrult	L1622
6832                     ; 1404 				t = t + (uiInfo.tOffset-100);
6834  15b2 a064          	sub	a,#100
6835  15b4 1b01          	add	a,(OFST+0,sp)
6837  15b6 2005          	jp	LC037
6838  15b8               L1622:
6839                     ; 1406 				t = t - uiInfo.tOffset;
6841  15b8 7b01          	ld	a,(OFST+0,sp)
6842  15ba c00011        	sub	a,_uiInfo+17
6843  15bd               LC037:
6844  15bd 6b01          	ld	(OFST+0,sp),a
6845  15bf               L7522:
6846                     ; 1408 		if( uiInfo.tCurr != t )
6848  15bf c60002        	ld	a,_uiInfo+2
6849  15c2 1101          	cp	a,(OFST+0,sp)
6850  15c4 2715          	jreq	L5622
6851                     ; 1410 			uiInfo.tCurr = t;
6853  15c6 7b01          	ld	a,(OFST+0,sp)
6854  15c8 c70002        	ld	_uiInfo+2,a
6855                     ; 1411 			if( _remote == 0 )
6857  15cb c60000        	ld	a,__remote
6858  15ce 260b          	jrne	L5622
6859                     ; 1414 				if( _disp_temp == 1 )
6861  15d0 c60008        	ld	a,__disp_temp
6862  15d3 4a            	dec	a
6863  15d4 2605          	jrne	L5622
6864                     ; 1415 					ui_disp_temp_curr(t);
6866  15d6 7b01          	ld	a,(OFST+0,sp)
6867  15d8 cd0000        	call	_ui_disp_temp_curr
6869  15db               L5622:
6870                     ; 1418 		_disp_temp = 0;
6872  15db 725f0008      	clr	__disp_temp
6873                     ; 1420 		if( uiInfo.mode == 0 )	disp_status_loop_client(key);
6875  15df c60008        	ld	a,_uiInfo+8
6876  15e2 2607          	jrne	L3722
6879  15e4 7b02          	ld	a,(OFST+1,sp)
6880  15e6 cd0000        	call	_disp_status_loop_client
6883  15e9 2005          	jra	L5722
6884  15eb               L3722:
6885                     ; 1422 			disp_status_loop_host(key);
6887  15eb 7b02          	ld	a,(OFST+1,sp)
6888  15ed cd0000        	call	_disp_status_loop_host
6890  15f0               L5722:
6891                     ; 1425 		if( error != 0 && error_type != 0 )
6893  15f0 c60000        	ld	a,_error
6894  15f3 2603cc1535    	jreq	L4621
6896  15f8 c60000        	ld	a,_error_type
6897  15fb 27f8          	jreq	L4621
6898                     ; 1427 			ui_error = error;
6900  15fd 5500000000    	mov	_ui_error,_error
6901                     ; 1428 			_ds = 97;
6903  1602 3561000e      	mov	__ds,#97
6904                     ; 1429 			_dsCount = 0;
6906  1606 725f000f      	clr	__dsCount
6907  160a cc1535        	jra	L4621
6953                     ; 1434 void	copy_info(uint8_t next)
6953                     ; 1435 {
6954                     	switch	.text
6955  160d               _copy_info:
6957  160d 88            	push	a
6958       00000001      OFST:	set	1
6961                     ; 1437 	disp_set_state(next);
6963  160e cd134d        	call	_disp_set_state
6965                     ; 1438 	uiInfoSet.id = uiInfo.id;
6967  1611 5500040065    	mov	_uiInfoSet+1,_uiInfo+4
6968                     ; 1439 	uiInfoSet.cnt = uiInfo.cnt;
6970  1616 5500050066    	mov	_uiInfoSet+2,_uiInfo+5
6971                     ; 1440 	uiInfoSet.cnt_sub = uiInfo.cnt_sub;
6973  161b 5500060067    	mov	_uiInfoSet+3,_uiInfo+6
6974                     ; 1441 	uiInfoSet.opMode = uiInfo.opMode;
6976  1620 5500070068    	mov	_uiInfoSet+4,_uiInfo+7
6977                     ; 1442 	uiInfoSet.mode = uiInfo.mode;
6979  1625 5500080069    	mov	_uiInfoSet+5,_uiInfo+8
6980                     ; 1443 	uiInfoSet.controlMode = uiInfo.controlMode;
6982  162a 550009006a    	mov	_uiInfoSet+6,_uiInfo+9
6983                     ; 1444 	uiInfoSet.valve = uiInfo.valve;
6985  162f 55000a006b    	mov	_uiInfoSet+7,_uiInfo+10
6986                     ; 1445 	uiInfoSet.valve_sub = uiInfo.valve_sub;
6988  1634 55000b006c    	mov	_uiInfoSet+8,_uiInfo+11
6989                     ; 1446 	uiInfoSet.poType = uiInfo.poType;
6991  1639 55000f006d    	mov	_uiInfoSet+9,_uiInfo+15
6992                     ; 1447 	uiInfoSet.houseCapa = uiInfo.houseCapa;
6994  163e 550010006e    	mov	_uiInfoSet+10,_uiInfo+16
6995                     ; 1448 	uiInfoSet.tOffset = uiInfo.tOffset;
6997  1643 550011006f    	mov	_uiInfoSet+11,_uiInfo+17
6998                     ; 1449 	uiInfoSet.tempOffset = uiInfo.tempOffset;
7000  1648 5500120070    	mov	_uiInfoSet+12,_uiInfo+18
7001                     ; 1450 	uiInfoSet.lpmType = uiInfo.lpmType;
7003  164d 5500130071    	mov	_uiInfoSet+13,_uiInfo+19
7004                     ; 1451 	uiInfoSet.lpmType_sub = uiInfo.lpmType_sub;
7006  1652 5500140072    	mov	_uiInfoSet+14,_uiInfo+20
7007                     ; 1452 	uiInfoSet.subRCLock = uiInfo.subRCLock;
7009  1657 55005d0093    	mov	_uiInfoSet+47,_uiInfo+93
7010                     ; 1453 	uiInfoSet.cntlMode = uiInfo.cntlMode;
7012                     ; 1454 	for( i=0; i<8; i++ )
7014  165c 4f            	clr	a
7015  165d 5500030064    	mov	_uiInfoSet,_uiInfo+3
7016  1662 6b01          	ld	(OFST+0,sp),a
7017  1664               L7132:
7018                     ; 1456 		uiInfoSet.valve_len[i] = uiInfo.valve_len[i];
7020  1664 5f            	clrw	x
7021  1665 97            	ld	xl,a
7022  1666 d60015        	ld	a,(_uiInfo+21,x)
7023  1669 d70073        	ld	(_uiInfoSet+15,x),a
7024                     ; 1457 		uiInfoSet.valve_rc[i] = uiInfo.valve_rc[i];
7026  166c 5f            	clrw	x
7027  166d 7b01          	ld	a,(OFST+0,sp)
7028  166f 97            	ld	xl,a
7029  1670 d6001d        	ld	a,(_uiInfo+29,x)
7030  1673 d7007b        	ld	(_uiInfoSet+23,x),a
7031                     ; 1458 		uiInfoSet.valve_sub_len[i] = uiInfo.valve_sub_len[i];
7033  1676 5f            	clrw	x
7034  1677 7b01          	ld	a,(OFST+0,sp)
7035  1679 97            	ld	xl,a
7036  167a d60025        	ld	a,(_uiInfo+37,x)
7037  167d d70083        	ld	(_uiInfoSet+31,x),a
7038                     ; 1459 		uiInfoSet.valve_sub_rc[i] = uiInfo.valve_sub_rc[i];
7040  1680 5f            	clrw	x
7041  1681 7b01          	ld	a,(OFST+0,sp)
7042  1683 97            	ld	xl,a
7043  1684 d6002d        	ld	a,(_uiInfo+45,x)
7044  1687 d7008b        	ld	(_uiInfoSet+39,x),a
7045                     ; 1454 	for( i=0; i<8; i++ )
7047  168a 0c01          	inc	(OFST+0,sp)
7050  168c 7b01          	ld	a,(OFST+0,sp)
7051  168e a108          	cp	a,#8
7052  1690 25d2          	jrult	L7132
7053                     ; 1462 	_backup_backlight = _backlight + 1;
7055  1692 c60000        	ld	a,__backlight
7056  1695 4c            	inc	a
7057  1696 c70009        	ld	__backup_backlight,a
7058                     ; 1464 	lcd_blink_npos_clear();
7060  1699 cd0000        	call	_lcd_blink_npos_clear
7062                     ; 1465 	lcd_blink_clear();
7064  169c cd0000        	call	_lcd_blink_clear
7066                     ; 1466 }
7069  169f 84            	pop	a
7070  16a0 81            	ret	
7104                     ; 1468 void	copy_infoSet(void)
7104                     ; 1469 {
7105                     	switch	.text
7106  16a1               _copy_infoSet:
7108       00000001      OFST:	set	1
7111                     ; 1471 	uiInfo.id = uiInfoSet.id;
7113  16a1 5500650004    	mov	_uiInfo+4,_uiInfoSet+1
7114                     ; 1472 	uiInfo.cnt = uiInfoSet.cnt;
7116  16a6 5500660005    	mov	_uiInfo+5,_uiInfoSet+2
7117                     ; 1473 	uiInfo.cnt_sub = uiInfoSet.cnt_sub;
7119  16ab 5500670006    	mov	_uiInfo+6,_uiInfoSet+3
7120                     ; 1474 	uiInfo.opMode = uiInfoSet.opMode;
7122  16b0 5500680007    	mov	_uiInfo+7,_uiInfoSet+4
7123                     ; 1475 	uiInfo.mode = uiInfoSet.mode;
7125  16b5 5500690008    	mov	_uiInfo+8,_uiInfoSet+5
7126                     ; 1476 	uiInfo.controlMode = uiInfoSet.controlMode;
7128  16ba 55006a0009    	mov	_uiInfo+9,_uiInfoSet+6
7129                     ; 1477 	uiInfo.valve = uiInfoSet.valve;
7131  16bf 55006b000a    	mov	_uiInfo+10,_uiInfoSet+7
7132                     ; 1478 	uiInfo.valve_sub = uiInfoSet.valve_sub;
7134  16c4 55006c000b    	mov	_uiInfo+11,_uiInfoSet+8
7135                     ; 1479 	uiInfo.poType = uiInfoSet.poType;
7137  16c9 55006d000f    	mov	_uiInfo+15,_uiInfoSet+9
7138                     ; 1480 	uiInfo.houseCapa = uiInfoSet.houseCapa;
7140  16ce 55006e0010    	mov	_uiInfo+16,_uiInfoSet+10
7141                     ; 1481 	uiInfo.tOffset = uiInfoSet.tOffset;
7143  16d3 55006f0011    	mov	_uiInfo+17,_uiInfoSet+11
7144                     ; 1482 	uiInfo.tempOffset = uiInfoSet.tempOffset;
7146  16d8 5500700012    	mov	_uiInfo+18,_uiInfoSet+12
7147                     ; 1483 	uiInfo.lpmType = uiInfoSet.lpmType;
7149  16dd 5500710013    	mov	_uiInfo+19,_uiInfoSet+13
7150                     ; 1484 	uiInfo.lpmType_sub = uiInfoSet.lpmType_sub;
7152  16e2 5500720014    	mov	_uiInfo+20,_uiInfoSet+14
7153                     ; 1485 	uiInfo.subRCLock = uiInfoSet.subRCLock;
7155  16e7 550093005d    	mov	_uiInfo+93,_uiInfoSet+47
7156  16ec 88            	push	a
7157                     ; 1486 	uiInfo.cntlMode = uiInfoSet.cntlMode;
7159  16ed 5500640003    	mov	_uiInfo+3,_uiInfoSet
7160                     ; 1487 	for( i=0; i<8; i++ )
7162  16f2 4f            	clr	a
7163  16f3 6b01          	ld	(OFST+0,sp),a
7164  16f5               L1432:
7165                     ; 1489 		uiInfo.valve_len[i] = uiInfoSet.valve_len[i];
7167  16f5 5f            	clrw	x
7168  16f6 97            	ld	xl,a
7169  16f7 d60073        	ld	a,(_uiInfoSet+15,x)
7170  16fa d70015        	ld	(_uiInfo+21,x),a
7171                     ; 1490 		uiInfo.valve_rc[i] = uiInfoSet.valve_rc[i];
7173  16fd 5f            	clrw	x
7174  16fe 7b01          	ld	a,(OFST+0,sp)
7175  1700 97            	ld	xl,a
7176  1701 d6007b        	ld	a,(_uiInfoSet+23,x)
7177  1704 d7001d        	ld	(_uiInfo+29,x),a
7178                     ; 1491 		uiInfo.valve_sub_len[i] = uiInfoSet.valve_sub_len[i];
7180  1707 5f            	clrw	x
7181  1708 7b01          	ld	a,(OFST+0,sp)
7182  170a 97            	ld	xl,a
7183  170b d60083        	ld	a,(_uiInfoSet+31,x)
7184  170e d70025        	ld	(_uiInfo+37,x),a
7185                     ; 1492 		uiInfo.valve_sub_rc[i] = uiInfoSet.valve_sub_rc[i];
7187  1711 5f            	clrw	x
7188  1712 7b01          	ld	a,(OFST+0,sp)
7189  1714 97            	ld	xl,a
7190  1715 d6008b        	ld	a,(_uiInfoSet+39,x)
7191  1718 d7002d        	ld	(_uiInfo+45,x),a
7192                     ; 1487 	for( i=0; i<8; i++ )
7194  171b 0c01          	inc	(OFST+0,sp)
7197  171d 7b01          	ld	a,(OFST+0,sp)
7198  171f a108          	cp	a,#8
7199  1721 25d2          	jrult	L1432
7200                     ; 1494 }
7203  1723 84            	pop	a
7204  1724 81            	ret	
7256                     ; 1499 void	disp_status(uint8_t key)
7256                     ; 1500 {
7257                     	switch	.text
7258  1725               _disp_status:
7260  1725 88            	push	a
7261       00000000      OFST:	set	0
7264                     ; 1501 	lcd_blinkCb();
7266  1726 cd0000        	call	_lcd_blinkCb
7268                     ; 1502 	disp_statusCb(key);
7270  1729 7b01          	ld	a,(OFST+1,sp)
7271  172b cd1360        	call	_disp_statusCb
7273                     ; 1505 	uiInfo.enc = 0;
7275  172e 725f0000      	clr	_uiInfo
7276                     ; 1508 	if( _updateBit != 0 && _updateTimer != __timer1s )
7278  1732 c60006        	ld	a,__updateBit
7279  1735 276e          	jreq	L7732
7281  1737 c60005        	ld	a,__updateTimer
7282  173a c10000        	cp	a,___timer1s
7283  173d 2766          	jreq	L7732
7284                     ; 1510 		_updateTimer = __timer1s;
7286  173f 5500000005    	mov	__updateTimer,___timer1s
7287                     ; 1511 		_updateCount--;
7289  1744 725a0007      	dec	__updateCount
7290                     ; 1512 		if( _updateCount == 0 )
7292  1748 265b          	jrne	L7732
7293                     ; 1514 			if( (_updateBit&BIT_REPEAT) != 0 )	{FW_REPEAT(uiInfo.repeat);	}
7295  174a 720100060a    	btjf	__updateBit,#0,L3042
7298  174f c6000c        	ld	a,_uiInfo+12
7299  1752 97            	ld	xl,a
7300  1753 a60f          	ld	a,#15
7301  1755 95            	ld	xh,a
7302  1756 cd0000        	call	_file_write
7304  1759               L3042:
7305                     ; 1515 			if( (_updateBit&BIT_RESERVE) != 0 )	{FW_RESERVE(uiInfo.reserve);}
7307  1759 720300060a    	btjf	__updateBit,#1,L5042
7310  175e c6000d        	ld	a,_uiInfo+13
7311  1761 97            	ld	xl,a
7312  1762 a610          	ld	a,#16
7313  1764 95            	ld	xh,a
7314  1765 cd0000        	call	_file_write
7316  1768               L5042:
7317                     ; 1516 			if( (_updateBit&BIT_TSETUP) != 0 )	{FW_TSETUP(uiInfo.tSetup);}
7319  1768 720500060a    	btjf	__updateBit,#2,L7042
7322  176d c6000e        	ld	a,_uiInfo+14
7323  1770 97            	ld	xl,a
7324  1771 a611          	ld	a,#17
7325  1773 95            	ld	xh,a
7326  1774 cd0000        	call	_file_write
7328  1777               L7042:
7329                     ; 1517 			if( (_updateBit&BIT_DISPMODE) != 0 ){
7331  1777 7207000618    	btjf	__updateBit,#3,L1142
7332                     ; 1518 				if (uiInfo.mode == SETTING_MODE_SUB) {
7334  177c c60008        	ld	a,_uiInfo+8
7335  177f 2609          	jrne	L3142
7336                     ; 1519 					if (_disp_mode != RC_MODE_OUT) {
7338  1781 c60000        	ld	a,__disp_mode
7339  1784 a102          	cp	a,#2
7340  1786 270c          	jreq	L1142
7341                     ; 1520 						FW_DISPMODE(_disp_mode);
7343  1788 2003          	jp	LC038
7344  178a               L3142:
7345                     ; 1523 					FW_DISPMODE(_disp_mode);
7347  178a c60000        	ld	a,__disp_mode
7348  178d               LC038:
7350  178d 97            	ld	xl,a
7351  178e a629          	ld	a,#41
7352  1790 95            	ld	xh,a
7353  1791 cd0000        	call	_file_write
7355  1794               L1142:
7356                     ; 1527 			if( (_updateBit&BIT_REPEAT) != 0 || (_updateBit&BIT_RESERVE) != 0 )	
7358  1794 7200000605    	btjt	__updateBit,#0,L3242
7360  1799 7203000603    	btjf	__updateBit,#1,L1242
7361  179e               L3242:
7362                     ; 1529 				timerEventClear();
7364  179e cd0000        	call	_timerEventClear
7366  17a1               L1242:
7367                     ; 1532 			_updateBit = 0;
7369  17a1 725f0006      	clr	__updateBit
7370  17a5               L7732:
7371                     ; 1535 	if( key==0 )
7373  17a5 7b01          	ld	a,(OFST+1,sp)
7374  17a7 2602          	jrne	L5242
7375                     ; 1536 		return;
7378  17a9 84            	pop	a
7379  17aa 81            	ret	
7380  17ab               L5242:
7381                     ; 1538 if( _key_continue == 1 )
7383  17ab c60000        	ld	a,__key_continue
7384  17ae 4a            	dec	a
7385  17af 2625          	jrne	L7242
7386                     ; 1540 	if( key==2 )		{		goto SetupMaster;	}
7388  17b1 7b01          	ld	a,(OFST+1,sp)
7389  17b3 a102          	cp	a,#2
7390  17b5 273a          	jreq	L7432
7393                     ; 1541 	else if( key==4 )	{		goto SetupSub;	}
7395  17b7 a104          	cp	a,#4
7396  17b9 2772          	jreq	L1532
7399                     ; 1542 	else if( key==8 )	{		goto SetupRoomCntl;	}
7401  17bb a108          	cp	a,#8
7402  17bd 2603cc1854    	jreq	L5532
7405                     ; 1543 	else if( key==1 )	{		goto SetupCommand;	}
7407  17c2 a101          	cp	a,#1
7408  17c4 2603cc1878    	jreq	L7532
7411                     ; 1544 	else if( key==0x10 ){		goto SetupRc;	}
7413  17c9 a110          	cp	a,#16
7414  17cb 2603cc18d4    	jreq	L1632
7417                     ; 1545 	_key_continue = 0;
7419  17d0 725f0000      	clr	__key_continue
7420                     ; 1546 	goto SetupEntry;
7422  17d4 2078          	jra	L3532
7423  17d6               L7242:
7424                     ; 1548 	if( key == _keypwMaster[_keypwIndexMaster] )
7426  17d6 c6000a        	ld	a,__keypwIndexMaster
7427  17d9 5f            	clrw	x
7428  17da 97            	ld	xl,a
7429  17db d60000        	ld	a,(__keypwMaster,x)
7430  17de 1101          	cp	a,(OFST+1,sp)
7431  17e0 2622          	jrne	L3542
7432                     ; 1550 		_keypwIndexMaster++;
7434  17e2 725c000a      	inc	__keypwIndexMaster
7435                     ; 1551 		if( _keypwIndexMaster == 6 )
7437  17e6 c6000a        	ld	a,__keypwIndexMaster
7438  17e9 a106          	cp	a,#6
7439  17eb 2625          	jrne	L7542
7440                     ; 1553 			_keypwIndexMaster = 0;
7442  17ed 725f000a      	clr	__keypwIndexMaster
7443  17f1               L7432:
7444                     ; 1554 SetupMaster:		
7444                     ; 1555 			uiInfo.id = 1;
7446  17f1 35010004      	mov	_uiInfo+4,#1
7447                     ; 1556 			uiInfo.mode = 1;
7449  17f5 35010008      	mov	_uiInfo+8,#1
7450                     ; 1557 			uiInfo.controlMode = 0;
7452  17f9 725f0009      	clr	_uiInfo+9
7453                     ; 1558 			copy_info(9);
7455  17fd a609          	ld	a,#9
7456  17ff cd160d        	call	_copy_info
7458  1802 200e          	jra	L7542
7459  1804               L3542:
7460                     ; 1563 		_keypwIndexMaster = 0;
7462  1804 725f000a      	clr	__keypwIndexMaster
7463                     ; 1564 		if( key == _keypwMaster[_keypwIndexMaster] )
7465  1808 7b01          	ld	a,(OFST+1,sp)
7466  180a a104          	cp	a,#4
7467  180c 2604          	jrne	L7542
7468                     ; 1565 			_keypwIndexMaster++;
7470  180e 725c000a      	inc	__keypwIndexMaster
7471  1812               L7542:
7472                     ; 1568 	if( key == _keypwMaster2[_keypwIndexMaster2] )
7474  1812 c6000b        	ld	a,__keypwIndexMaster2
7475  1815 5f            	clrw	x
7476  1816 97            	ld	xl,a
7477  1817 d60006        	ld	a,(__keypwMaster2,x)
7478  181a 1101          	cp	a,(OFST+1,sp)
7479  181c 2622          	jrne	L3642
7480                     ; 1570 		_keypwIndexMaster2++;
7482  181e 725c000b      	inc	__keypwIndexMaster2
7483                     ; 1571 		if( _keypwIndexMaster2 == 6 )
7485  1822 c6000b        	ld	a,__keypwIndexMaster2
7486  1825 a106          	cp	a,#6
7487  1827 2625          	jrne	L3532
7488                     ; 1573 			_keypwIndexMaster2 = 0;
7490  1829 725f000b      	clr	__keypwIndexMaster2
7491  182d               L1532:
7492                     ; 1574 SetupSub:
7492                     ; 1575 			uiInfo.id = 1;
7494  182d 35010004      	mov	_uiInfo+4,#1
7495                     ; 1576 			uiInfo.mode = 1;
7497  1831 35010008      	mov	_uiInfo+8,#1
7498                     ; 1577 			uiInfo.controlMode = 1;
7500  1835 35010009      	mov	_uiInfo+9,#1
7501                     ; 1578 			copy_info(9);
7503  1839 a609          	ld	a,#9
7504  183b cd160d        	call	_copy_info
7506  183e 200e          	jra	L3532
7507  1840               L3642:
7508                     ; 1583 		_keypwIndexMaster2 = 0;
7510  1840 725f000b      	clr	__keypwIndexMaster2
7511                     ; 1584 		if( key == _keypwMaster2[_keypwIndexMaster2] )
7513  1844 7b01          	ld	a,(OFST+1,sp)
7514  1846 a104          	cp	a,#4
7515  1848 2604          	jrne	L3532
7516                     ; 1585 			_keypwIndexMaster2++;
7518  184a 725c000b      	inc	__keypwIndexMaster2
7519  184e               L3532:
7520                     ; 1588 SetupEntry:		
7520                     ; 1589 	if( key == 0x88 )
7522  184e 7b01          	ld	a,(OFST+1,sp)
7523  1850 a188          	cp	a,#136
7524  1852 261a          	jrne	L3742
7525  1854               L5532:
7526                     ; 1591 SetupRoomCntl:		
7526                     ; 1592 		uiInfo.enc = 0;
7528  1854 725f0000      	clr	_uiInfo
7529                     ; 1593 		if( uiInfo.mode == 0 )
7531  1858 c60008        	ld	a,_uiInfo+8
7532  185b 2604          	jrne	L5742
7533                     ; 1594 			uiInfo.id = 2;
7535  185d 35020004      	mov	_uiInfo+4,#2
7536  1861               L5742:
7537                     ; 1595 		copy_info(uiInfo.mode==0 ? 101 : 133);
7539  1861 c60008        	ld	a,_uiInfo+8
7540  1864 2604          	jrne	L0331
7541  1866 a665          	ld	a,#101
7542  1868 2014          	jra	LC039
7543  186a               L0331:
7544  186a a685          	ld	a,#133
7547  186c 2010          	jp	LC039
7548  186e               L3742:
7549                     ; 1597 	else if( key == 0x89 && uiInfo.mode == 1 )
7551  186e a189          	cp	a,#137
7552  1870 260f          	jrne	L7742
7554  1872 c60008        	ld	a,_uiInfo+8
7555  1875 4a            	dec	a
7556  1876 2609          	jrne	L7742
7557  1878               L7532:
7558                     ; 1599 SetupCommand:		
7558                     ; 1600 		uiInfo.enc = 0;
7560  1878 725f0000      	clr	_uiInfo
7561                     ; 1601 		copy_info(41);
7563  187c a629          	ld	a,#41
7564  187e               LC039:
7565  187e cd160d        	call	_copy_info
7567  1881               L7742:
7568                     ; 1604 	if( key == _keypwDefault[_keypwIndexDefault] )
7570  1881 c6000d        	ld	a,__keypwIndexDefault
7571  1884 5f            	clrw	x
7572  1885 97            	ld	xl,a
7573  1886 d60012        	ld	a,(__keypwDefault,x)
7574  1889 1101          	cp	a,(OFST+1,sp)
7575  188b 261e          	jrne	L3052
7576                     ; 1606 		_keypwIndexDefault++;
7578  188d 725c000d      	inc	__keypwIndexDefault
7579                     ; 1607 		if( _keypwIndexDefault == 6 )
7581  1891 c6000d        	ld	a,__keypwIndexDefault
7582  1894 a106          	cp	a,#6
7583  1896 2621          	jrne	L7052
7584                     ; 1609 			_keypwIndexDefault = 0;
7586  1898 725f000d      	clr	__keypwIndexDefault
7587                     ; 1610 			uiInfo.id = 1;
7589  189c 35010004      	mov	_uiInfo+4,#1
7590                     ; 1611 			uiInfo.mode = 1;
7592  18a0 35010008      	mov	_uiInfo+8,#1
7593                     ; 1612 			copy_info(98);
7595  18a4 a662          	ld	a,#98
7596  18a6 cd160d        	call	_copy_info
7598  18a9 200e          	jra	L7052
7599  18ab               L3052:
7600                     ; 1617 		_keypwIndexDefault = 0;
7602  18ab 725f000d      	clr	__keypwIndexDefault
7603                     ; 1618 		if( key == _keypwDefault[_keypwIndexDefault] )
7605  18af 7b01          	ld	a,(OFST+1,sp)
7606  18b1 a104          	cp	a,#4
7607  18b3 2604          	jrne	L7052
7608                     ; 1619 			_keypwIndexDefault++;
7610  18b5 725c000d      	inc	__keypwIndexDefault
7611  18b9               L7052:
7612                     ; 1622 	if( key == _keypwClient[_keypwIndexClient] )
7614  18b9 c6000c        	ld	a,__keypwIndexClient
7615  18bc 5f            	clrw	x
7616  18bd 97            	ld	xl,a
7617  18be d6000c        	ld	a,(__keypwClient,x)
7618  18c1 1101          	cp	a,(OFST+1,sp)
7619  18c3 261e          	jrne	L3152
7620                     ; 1624 		_keypwIndexClient++;
7622  18c5 725c000c      	inc	__keypwIndexClient
7623                     ; 1625 		if( _keypwIndexClient == 6 )
7625  18c9 c6000c        	ld	a,__keypwIndexClient
7626  18cc a106          	cp	a,#6
7627  18ce 2621          	jrne	L7152
7628                     ; 1627 			_keypwIndexClient = 0;
7630  18d0 725f000c      	clr	__keypwIndexClient
7631  18d4               L1632:
7632                     ; 1628 SetupRc:
7632                     ; 1629 			uiInfo.id = 2;
7634  18d4 35020004      	mov	_uiInfo+4,#2
7635                     ; 1630 			uiInfo.mode = 0;
7637  18d8 725f0008      	clr	_uiInfo+8
7638                     ; 1631 			copy_info(101);
7640  18dc a665          	ld	a,#101
7641  18de cd160d        	call	_copy_info
7643  18e1 200e          	jra	L7152
7644  18e3               L3152:
7645                     ; 1636 		_keypwIndexClient = 0;
7647  18e3 725f000c      	clr	__keypwIndexClient
7648                     ; 1637 		if( key == _keypwClient[_keypwIndexClient] )
7650  18e7 7b01          	ld	a,(OFST+1,sp)
7651  18e9 a104          	cp	a,#4
7652  18eb 2604          	jrne	L7152
7653                     ; 1638 			_keypwIndexClient++;
7655  18ed 725c000c      	inc	__keypwIndexClient
7656  18f1               L7152:
7657                     ; 1640 }
7660  18f1 84            	pop	a
7661  18f2 81            	ret	
8367                     	xref	__key_continue
8368                     	xref	_timerEventClear
8369                     	xdef	_disp_statusCb
8370                     	xdef	_disp_set_state
8371                     	xdef	_disp_write_file
8372                     	xref	_config_disp2
8373                     	xref	_config_disp
8374                     	xref	__remote
8375                     	xref	_getCurrTemp
8376                     	xdef	_disp_status_command
8377                     	xdef	_disp_status_error
8378                     	xref	___ui_disp_temp_c
8379                     	xdef	_timerClear
8380                     	xdef	__timFlag
8381                     	xdef	__tim30min
8382                     	xdef	__tim1min
8383                     	xdef	___func_rc_timerout2
8384                     	xdef	___func_rc_timerout1
8385                     	xdef	___func_rc_timerout
8386                     	xref	_func_rc_setting
8387                     	xref	___func_rc_settingCb
8388                     	xdef	_disp_status_valveinfo_sub
8389                     	xdef	__ui_
8390                     	xdef	___lpm
8391                     	xdef	_disp_status_houseCapa
8392                     	xdef	_disp_status_valveCount
8393                     	xdef	_disp_next
8394                     	xdef	_file_update
8395                     	xdef	__keypwIndexDefault
8396                     	xdef	__keypwIndexClient
8397                     	xdef	__keypwIndexMaster2
8398                     	xdef	__keypwIndexMaster
8399                     	xdef	__keypwDefault
8400                     	xdef	__keypwClient
8401                     	xdef	__keypwMaster2
8402                     	xdef	__keypwMaster
8403                     	xdef	_copy_info
8404                     	xdef	_copy_infoSet
8405                     	xref	_func_rc_command
8406                     	xref	__backlight
8407                     	xref	_func_rc_recover
8408                     	xref	__boiler_water_heat
8409                     	xref	__boiler_water_shower
8410                     	xref	_ui_error
8411                     	xref	_error_type
8412                     	xref	_error
8413                     	xdef	__backup_backlight
8414                     	xdef	__disp_temp
8415                     	xdef	_file_update2
8416                     	xdef	__updateCount
8417                     	xdef	__updateBit
8418                     	xdef	__updateTimer
8419                     	xref	__disp_mode2
8420                     	xref	__disp_mode
8421                     	xdef	_disp_status_curr_only
8422                     	xdef	_disp_status_loop_init
8423                     	xdef	_disp_status_loop_message
8424                     	xdef	_disp_status_exit
8425                     	xdef	_disp_status_run
8426                     	xdef	_disp_status_valveinfo
8427                     	xdef	_disp_status_temp_offset
8428                     	xdef	_disp_status_lpm
8429                     	xdef	_disp_status_po_type
8430                     	xdef	_disp_status_cntl_op
8431                     	xdef	_disp_status_run_op
8432                     	xdef	_disp_status_toffset
8433                     	xdef	_disp_status_id
8434                     	xdef	_clear_npos2
8435                     	xdef	_clear_npos1
8436                     	xdef	__dsPrev
8437                     	xdef	__dsCount
8438                     	xdef	__ds
8439                     	xdef	_ui_Open
8440                     	xref	_disp_status_loop_client
8441                     	xref	_disp_status_loop_host
8442                     	xdef	___sRoom
8443                     	xdef	___sInfo
8444                     	xdef	___sDn
8445                     	xdef	___sUp
8446                     	xdef	___s
8447                     	xref	_lcd_blink_npos
8448                     	xref	_lcd_blink_npos_clear
8449                     	xref	_ui_disp_clear_tSetup
8450                     	xref	_ui_disp_temp_curr
8451                     	xref	_ui_disp_temp_setup
8452                     	xref	_lcd_blinkCb
8453                     	xref	_lcd_blink_clear
8454                     	xdef	_disp_status
8455                     	xref	_lcd_clear_npos
8456                     	xref	_lcd_disp_rid
8457                     	xref	_lcd_disp_err
8458                     	xref	_lcd_disp_n
8459                     	xref	_lcd_clear
8460                     	xref	_lcd_disp_setup_mode_each
8461                     	xref	_lcd_disp_setup_mode_local
8462                     	xref	_lcd_disp_setup_valve
8463                     	xref	_lcd_disp_setup_id
8464                     	xref	_lcd_disp_setup_mode
8465                     	xref	_lcd_disp_cnt_sub
8466                     	xref	_lcd_disp_cnt_host
8467                     	xref	_lcd_disp_freset
8468                     	xref	_lcd_disp_mir2
8469                     	xref	_lcd_disp_mir1
8470                     	xref	_lcd_disp_setup_cntl_tab
8471                     	xref	_lcd_disp_setup_cntl_2motor
8472                     	xref	_lcd_disp_setup_cntl_po
8473                     	xref	_lcd_disp_setup_cntl_on
8474                     	xref	_lcd_disp_setup_cntl_op
8475                     	xref	_lcd_disp_setup_len
8476                     	xref	_lcd_disp_setup_po_type_pb
8477                     	xref	_lcd_disp_setup_po_type_pe
8478                     	xref	_lcd_disp_setup_po_type_xl
8479                     	xref	_lcd_disp_setup_po_type
8480                     	xref	_lcd_disp_setup_temp_offset
8481                     	xref	_lcd_disp_setup_lpm
8482                     	xref	_lcd_clear_btn
8483                     	xref	_iLF_DEF
8484                     	xref	_bLF_DEF
8485                     	switch	.bss
8486  0000               _uiInfo:
8487  0000 000000000000  	ds.b	100
8488                     	xdef	_uiInfo
8489  0064               _uiInfoSet:
8490  0064 000000000000  	ds.b	53
8491                     	xdef	_uiInfoSet
8492                     	xref	_file_read
8493                     	xref	_file_write
8494                     	xref	___timer1s
8495                     	xref	__t20ms
8496                     	xref.b	c_x
8516                     	xref	c_smodx
8517                     	end
