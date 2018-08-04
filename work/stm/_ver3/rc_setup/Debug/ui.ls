   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  19                     	switch	.data
  20  0000               ___s:
  21  0000 00            	dc.b	0
  22  0001               ___sUp:
  23  0001 00            	dc.b	0
  24  0002               ___sDn:
  25  0002 00            	dc.b	0
  26  0003               ___sInfo:
  27  0003 02            	dc.b	2
  28  0004               ___sRoom:
  29  0004 00            	dc.b	0
  30  0005               __updateTimer:
  31  0005 00            	dc.b	0
  32  0006               __updateBit:
  33  0006 00            	dc.b	0
  34  0007               __updateCount:
  35  0007 0a            	dc.b	10
  36  0008               __disp_temp:
  37  0008 01            	dc.b	1
  38  0009               __backup_backlight:
  39  0009 00            	dc.b	0
  76                     ; 47 void	ui_Open(void)
  76                     ; 48 {
  78                     .text:	section	.text,new
  79  0000               _ui_Open:
  83                     ; 91 	uiInfo.cntlMode = FW_GET_CNTLMODE;
  85  0000 a608          	ld	a,#8
  86  0002 cd0000        	call	_file_read
  88  0005 c70003        	ld	_uiInfo+3,a
  89                     ; 92 	uiInfo.id = FW_GET_ID;
  91  0008 a60a          	ld	a,#10
  92  000a cd0000        	call	_file_read
  94  000d c70004        	ld	_uiInfo+4,a
  95                     ; 93 	uiInfo.cnt = FW_GET_CNT;
  97  0010 a60b          	ld	a,#11
  98  0012 cd0000        	call	_file_read
 100  0015 c70005        	ld	_uiInfo+5,a
 101                     ; 94 	uiInfo.cnt_sub = FW_GET_CNT_SUB;
 103  0018 a62b          	ld	a,#43
 104  001a cd0000        	call	_file_read
 106  001d c70006        	ld	_uiInfo+6,a
 107                     ; 95 	UI_SET(uiInfo.cnt, 8)
 109  0020 725d0005      	tnz	_uiInfo+5
 110  0024 2604          	jrne	L12
 113  0026 35080005      	mov	_uiInfo+5,#8
 114  002a               L12:
 115                     ; 96 	UI_SET(uiInfo.cnt_sub, 8)
 117  002a 725d0006      	tnz	_uiInfo+6
 118  002e 2604          	jrne	L32
 121  0030 35080006      	mov	_uiInfo+6,#8
 122  0034               L32:
 123                     ; 97 	if( uiInfo.cnt >= 8 )	uiInfo.cnt = 8;
 125  0034 c60005        	ld	a,_uiInfo+5
 126  0037 a108          	cp	a,#8
 127  0039 2504          	jrult	L52
 130  003b 35080005      	mov	_uiInfo+5,#8
 131  003f               L52:
 132                     ; 98 	if( uiInfo.cnt_sub >= 8 )	uiInfo.cnt_sub = 8;
 134  003f c60006        	ld	a,_uiInfo+6
 135  0042 a108          	cp	a,#8
 136  0044 2504          	jrult	L72
 139  0046 35080006      	mov	_uiInfo+6,#8
 140  004a               L72:
 141                     ; 100 	uiInfo.opMode = FW_GET_OPMODE;
 143  004a a60c          	ld	a,#12
 144  004c cd0000        	call	_file_read
 146  004f c70007        	ld	_uiInfo+7,a
 147                     ; 101 	uiInfo.mode = FW_GET_MODE;
 149  0052 a609          	ld	a,#9
 150  0054 cd0000        	call	_file_read
 152  0057 c70008        	ld	_uiInfo+8,a
 153                     ; 103 	uiInfo.controlMode = FW_GET_CNT_MODE;
 155  005a a60d          	ld	a,#13
 156  005c cd0000        	call	_file_read
 158  005f c70009        	ld	_uiInfo+9,a
 159                     ; 104 	uiInfo.valve = FW_GET_VALVE;
 161  0062 a60e          	ld	a,#14
 162  0064 cd0000        	call	_file_read
 164  0067 c7000a        	ld	_uiInfo+10,a
 165                     ; 105 	uiInfo.valve_sub = FW_GET_VALVE_SUB;
 167  006a a62c          	ld	a,#44
 168  006c cd0000        	call	_file_read
 170  006f c7000b        	ld	_uiInfo+11,a
 171                     ; 106 	UI_SET(uiInfo.valve, 8)
 173  0072 725d000a      	tnz	_uiInfo+10
 174  0076 2604          	jrne	L13
 177  0078 3508000a      	mov	_uiInfo+10,#8
 178  007c               L13:
 179                     ; 107 	UI_SET(uiInfo.valve_sub, 8)
 181  007c 725d000b      	tnz	_uiInfo+11
 182  0080 2604          	jrne	L33
 185  0082 3508000b      	mov	_uiInfo+11,#8
 186  0086               L33:
 187                     ; 108 	if( uiInfo.valve >= 8 )	uiInfo.valve = 8;
 189  0086 c6000a        	ld	a,_uiInfo+10
 190  0089 a108          	cp	a,#8
 191  008b 2504          	jrult	L53
 194  008d 3508000a      	mov	_uiInfo+10,#8
 195  0091               L53:
 196                     ; 109 	if( uiInfo.valve_sub >= 8 )	uiInfo.valve_sub = 8;
 198  0091 c6000b        	ld	a,_uiInfo+11
 199  0094 a108          	cp	a,#8
 200  0096 2504          	jrult	L73
 203  0098 3508000b      	mov	_uiInfo+11,#8
 204  009c               L73:
 205                     ; 111 	uiInfo.repeat = FW_GET_REPEAT;	
 207  009c a60f          	ld	a,#15
 208  009e cd0000        	call	_file_read
 210  00a1 c7000c        	ld	_uiInfo+12,a
 211                     ; 112 	UI_SET(uiInfo.repeat, 5)
 213  00a4 725d000c      	tnz	_uiInfo+12
 214  00a8 2604          	jrne	L14
 217  00aa 3505000c      	mov	_uiInfo+12,#5
 218  00ae               L14:
 219                     ; 113 	uiInfo.reserve = FW_GET_RESERVE;	
 221  00ae a610          	ld	a,#16
 222  00b0 cd0000        	call	_file_read
 224  00b3 c7000d        	ld	_uiInfo+13,a
 225                     ; 114 	UI_SET(uiInfo.reserve, 24)
 227  00b6 725d000d      	tnz	_uiInfo+13
 228  00ba 2604          	jrne	L34
 231  00bc 3518000d      	mov	_uiInfo+13,#24
 232  00c0               L34:
 233                     ; 115 	uiInfo.tSetup = FW_GET_TSETUP;	
 235  00c0 a611          	ld	a,#17
 236  00c2 cd0000        	call	_file_read
 238  00c5 c7000e        	ld	_uiInfo+14,a
 239                     ; 116 	UI_SET(uiInfo.tSetup, 50)
 241  00c8 725d000e      	tnz	_uiInfo+14
 242  00cc 2604          	jrne	L54
 245  00ce 3532000e      	mov	_uiInfo+14,#50
 246  00d2               L54:
 247                     ; 117 	uiInfo.poType = FW_GET_POTYPE;	
 249  00d2 a612          	ld	a,#18
 250  00d4 cd0000        	call	_file_read
 252  00d7 c7000f        	ld	_uiInfo+15,a
 253                     ; 118 	uiInfo.houseCapa = FW_GET_HOUSECAPA;
 255  00da a613          	ld	a,#19
 256  00dc cd0000        	call	_file_read
 258  00df c70010        	ld	_uiInfo+16,a
 259                     ; 119 	UI_SET(uiInfo.houseCapa, 160)
 261  00e2 725d0010      	tnz	_uiInfo+16
 262  00e6 2604          	jrne	L74
 265  00e8 35a00010      	mov	_uiInfo+16,#160
 266  00ec               L74:
 267                     ; 120 	uiInfo.tOffset = FW_GET_TOFFSET;
 269  00ec a614          	ld	a,#20
 270  00ee cd0000        	call	_file_read
 272  00f1 c70011        	ld	_uiInfo+17,a
 273                     ; 121 	UI_SET(uiInfo.tOffset, 100);
 275  00f4 725d0011      	tnz	_uiInfo+17
 276  00f8 2604          	jrne	L15
 279  00fa 35640011      	mov	_uiInfo+17,#100
 280  00fe               L15:
 281                     ; 123 	uiInfo.tempOffset = FW_GET_TEMPOFFSET;
 284  00fe a627          	ld	a,#39
 285  0100 cd0000        	call	_file_read
 287  0103 c70012        	ld	_uiInfo+18,a
 288                     ; 124 	UI_SET(uiInfo.tempOffset, 80)
 290  0106 725d0012      	tnz	_uiInfo+18
 291  010a 2604          	jrne	L35
 294  010c 35500012      	mov	_uiInfo+18,#80
 295  0110               L35:
 296                     ; 125 	uiInfo.lpmType = FW_GET_LPM;
 298  0110 a628          	ld	a,#40
 299  0112 cd0000        	call	_file_read
 301  0115 c70013        	ld	_uiInfo+19,a
 302                     ; 126 	uiInfo.lpmType_sub = FW_GET_LPM_SUB;
 304  0118 a62d          	ld	a,#45
 305  011a cd0000        	call	_file_read
 307  011d c70014        	ld	_uiInfo+20,a
 308                     ; 127 	UI_SET(uiInfo.lpmType, 8)
 310  0120 725d0013      	tnz	_uiInfo+19
 311  0124 2604          	jrne	L55
 314  0126 35080013      	mov	_uiInfo+19,#8
 315  012a               L55:
 316                     ; 128 	UI_SET(uiInfo.lpmType_sub, 8)
 318  012a 725d0014      	tnz	_uiInfo+20
 319  012e 2604          	jrne	L75
 322  0130 35080014      	mov	_uiInfo+20,#8
 323  0134               L75:
 324                     ; 129 	if( uiInfo.lpmType >= 8 )	uiInfo.lpmType = 8;
 326  0134 c60013        	ld	a,_uiInfo+19
 327  0137 a108          	cp	a,#8
 328  0139 2504          	jrult	L16
 331  013b 35080013      	mov	_uiInfo+19,#8
 332  013f               L16:
 333                     ; 130 	if( uiInfo.lpmType_sub >= 8 )	uiInfo.lpmType_sub = 8;
 335  013f c60014        	ld	a,_uiInfo+20
 336  0142 a108          	cp	a,#8
 337  0144 2504          	jrult	L36
 340  0146 35080014      	mov	_uiInfo+20,#8
 341  014a               L36:
 342                     ; 132 	_disp_mode2 = FW_GET_DISPMODE;
 344  014a a629          	ld	a,#41
 345  014c cd0000        	call	_file_read
 347  014f c70000        	ld	__disp_mode2,a
 348                     ; 133 	_disp_mode = 0xff;
 350  0152 35ff0000      	mov	__disp_mode,#255
 351                     ; 135 	uiInfo.valve_len[0] = FW_GET_VL_1;
 353  0156 a615          	ld	a,#21
 354  0158 cd0000        	call	_file_read
 356  015b c70015        	ld	_uiInfo+21,a
 357                     ; 136 	uiInfo.valve_len[1] = FW_GET_VL_2;
 359  015e a616          	ld	a,#22
 360  0160 cd0000        	call	_file_read
 362  0163 c70016        	ld	_uiInfo+22,a
 363                     ; 137 	uiInfo.valve_len[2] = FW_GET_VL_3;
 365  0166 a617          	ld	a,#23
 366  0168 cd0000        	call	_file_read
 368  016b c70017        	ld	_uiInfo+23,a
 369                     ; 138 	uiInfo.valve_len[3] = FW_GET_VL_4;
 371  016e a618          	ld	a,#24
 372  0170 cd0000        	call	_file_read
 374  0173 c70018        	ld	_uiInfo+24,a
 375                     ; 139 	uiInfo.valve_len[4] = FW_GET_VL_5;
 377  0176 a619          	ld	a,#25
 378  0178 cd0000        	call	_file_read
 380  017b c70019        	ld	_uiInfo+25,a
 381                     ; 140 	uiInfo.valve_len[5] = FW_GET_VL_6;
 383  017e a61a          	ld	a,#26
 384  0180 cd0000        	call	_file_read
 386  0183 c7001a        	ld	_uiInfo+26,a
 387                     ; 141 	uiInfo.valve_len[6] = FW_GET_VL_7;
 389  0186 a61b          	ld	a,#27
 390  0188 cd0000        	call	_file_read
 392  018b c7001b        	ld	_uiInfo+27,a
 393                     ; 142 	uiInfo.valve_len[7] = FW_GET_VL_8;
 395  018e a61c          	ld	a,#28
 396  0190 cd0000        	call	_file_read
 398  0193 c7001c        	ld	_uiInfo+28,a
 399                     ; 144 	uiInfo.valve_rc[0] = FW_GET_VRC_1;
 401  0196 a61d          	ld	a,#29
 402  0198 cd0000        	call	_file_read
 404  019b c7001d        	ld	_uiInfo+29,a
 405                     ; 145 	uiInfo.valve_rc[1] = FW_GET_VRC_2;
 407  019e a61e          	ld	a,#30
 408  01a0 cd0000        	call	_file_read
 410  01a3 c7001e        	ld	_uiInfo+30,a
 411                     ; 146 	uiInfo.valve_rc[2] = FW_GET_VRC_3;
 413  01a6 a61f          	ld	a,#31
 414  01a8 cd0000        	call	_file_read
 416  01ab c7001f        	ld	_uiInfo+31,a
 417                     ; 147 	uiInfo.valve_rc[3] = FW_GET_VRC_4;
 419  01ae a620          	ld	a,#32
 420  01b0 cd0000        	call	_file_read
 422  01b3 c70020        	ld	_uiInfo+32,a
 423                     ; 148 	uiInfo.valve_rc[4] = FW_GET_VRC_5;
 425  01b6 a621          	ld	a,#33
 426  01b8 cd0000        	call	_file_read
 428  01bb c70021        	ld	_uiInfo+33,a
 429                     ; 149 	uiInfo.valve_rc[5] = FW_GET_VRC_6;
 431  01be a622          	ld	a,#34
 432  01c0 cd0000        	call	_file_read
 434  01c3 c70022        	ld	_uiInfo+34,a
 435                     ; 150 	uiInfo.valve_rc[6] = FW_GET_VRC_7;
 437  01c6 a623          	ld	a,#35
 438  01c8 cd0000        	call	_file_read
 440  01cb c70023        	ld	_uiInfo+35,a
 441                     ; 151 	uiInfo.valve_rc[7] = FW_GET_VRC_8;
 443  01ce a624          	ld	a,#36
 444  01d0 cd0000        	call	_file_read
 446  01d3 c70024        	ld	_uiInfo+36,a
 447                     ; 153 	uiInfo.valve_sub_len[0] = FW_GET_VL_1_SUB;
 449  01d6 a62e          	ld	a,#46
 450  01d8 cd0000        	call	_file_read
 452  01db c70025        	ld	_uiInfo+37,a
 453                     ; 154 	uiInfo.valve_sub_len[1] = FW_GET_VL_2_SUB;
 455  01de a62f          	ld	a,#47
 456  01e0 cd0000        	call	_file_read
 458  01e3 c70026        	ld	_uiInfo+38,a
 459                     ; 155 	uiInfo.valve_sub_len[2] = FW_GET_VL_3_SUB;
 461  01e6 a630          	ld	a,#48
 462  01e8 cd0000        	call	_file_read
 464  01eb c70027        	ld	_uiInfo+39,a
 465                     ; 156 	uiInfo.valve_sub_len[3] = FW_GET_VL_4_SUB;
 467  01ee a631          	ld	a,#49
 468  01f0 cd0000        	call	_file_read
 470  01f3 c70028        	ld	_uiInfo+40,a
 471                     ; 157 	uiInfo.valve_sub_len[4] = FW_GET_VL_5_SUB;
 473  01f6 a632          	ld	a,#50
 474  01f8 cd0000        	call	_file_read
 476  01fb c70029        	ld	_uiInfo+41,a
 477                     ; 158 	uiInfo.valve_sub_len[5] = FW_GET_VL_6_SUB;
 479  01fe a633          	ld	a,#51
 480  0200 cd0000        	call	_file_read
 482  0203 c7002a        	ld	_uiInfo+42,a
 483                     ; 159 	uiInfo.valve_sub_len[6] = FW_GET_VL_7_SUB;
 485  0206 a634          	ld	a,#52
 486  0208 cd0000        	call	_file_read
 488  020b c7002b        	ld	_uiInfo+43,a
 489                     ; 160 	uiInfo.valve_sub_len[7] = FW_GET_VL_8_SUB;
 491  020e a635          	ld	a,#53
 492  0210 cd0000        	call	_file_read
 494  0213 c7002c        	ld	_uiInfo+44,a
 495                     ; 162 	uiInfo.valve_sub_rc[0] = FW_GET_VRC_1_SUB;
 497  0216 a636          	ld	a,#54
 498  0218 cd0000        	call	_file_read
 500  021b c7002d        	ld	_uiInfo+45,a
 501                     ; 163 	uiInfo.valve_sub_rc[1] = FW_GET_VRC_2_SUB;
 503  021e a637          	ld	a,#55
 504  0220 cd0000        	call	_file_read
 506  0223 c7002e        	ld	_uiInfo+46,a
 507                     ; 164 	uiInfo.valve_sub_rc[2] = FW_GET_VRC_3_SUB;
 509  0226 a638          	ld	a,#56
 510  0228 cd0000        	call	_file_read
 512  022b c7002f        	ld	_uiInfo+47,a
 513                     ; 165 	uiInfo.valve_sub_rc[3] = FW_GET_VRC_4_SUB;
 515  022e a639          	ld	a,#57
 516  0230 cd0000        	call	_file_read
 518  0233 c70030        	ld	_uiInfo+48,a
 519                     ; 166 	uiInfo.valve_sub_rc[4] = FW_GET_VRC_5_SUB;
 521  0236 a63a          	ld	a,#58
 522  0238 cd0000        	call	_file_read
 524  023b c70031        	ld	_uiInfo+49,a
 525                     ; 167 	uiInfo.valve_sub_rc[5] = FW_GET_VRC_6_SUB;
 527  023e a63b          	ld	a,#59
 528  0240 cd0000        	call	_file_read
 530  0243 c70032        	ld	_uiInfo+50,a
 531                     ; 168 	uiInfo.valve_sub_rc[6] = FW_GET_VRC_7_SUB;
 533  0246 a63c          	ld	a,#60
 534  0248 cd0000        	call	_file_read
 536  024b c70033        	ld	_uiInfo+51,a
 537                     ; 169 	uiInfo.valve_sub_rc[7] = FW_GET_VRC_8_SUB;
 539  024e a63d          	ld	a,#61
 540  0250 cd0000        	call	_file_read
 542  0253 c70034        	ld	_uiInfo+52,a
 543                     ; 171 	_boiler_water_shower = FW_GET_B_SHOWER;
 545  0256 a625          	ld	a,#37
 546  0258 cd0000        	call	_file_read
 548  025b c70000        	ld	__boiler_water_shower,a
 549                     ; 172 	UI_SET(_boiler_water_shower, 50)
 551  025e 725d0000      	tnz	__boiler_water_shower
 552  0262 2604          	jrne	L56
 555  0264 35320000      	mov	__boiler_water_shower,#50
 556  0268               L56:
 557                     ; 173 	_boiler_water_heat = FW_GET_B_HEAT;
 559  0268 a626          	ld	a,#38
 560  026a cd0000        	call	_file_read
 562  026d c70000        	ld	__boiler_water_heat,a
 563                     ; 174 	UI_SET(_boiler_water_heat, 70)
 565  0270 725d0000      	tnz	__boiler_water_heat
 566  0274 2604          	jrne	L76
 569  0276 35460000      	mov	__boiler_water_heat,#70
 570  027a               L76:
 571                     ; 175 	_backlight = FW_GET_BACKLIGHT;
 573  027a a62a          	ld	a,#42
 574  027c cd0000        	call	_file_read
 576  027f c70000        	ld	__backlight,a
 577                     ; 176 	UI_SET(_backlight, 3)
 579  0282 725d0000      	tnz	__backlight
 580  0286 2604          	jrne	L17
 583  0288 35030000      	mov	__backlight,#3
 584  028c               L17:
 585                     ; 178 	_backup_backlight = 0;
 587  028c 725f0009      	clr	__backup_backlight
 588                     ; 179 }
 591  0290 81            	ret
 594                     .const:	section	.text
 595  0000               __keypwMaster:
 596  0000 04            	dc.b	4
 597  0001 03            	dc.b	3
 598  0002 04            	dc.b	4
 599  0003 03            	dc.b	3
 600  0004 01            	dc.b	1
 601  0005 01            	dc.b	1
 602  0006               __keypwMaster2:
 603  0006 04            	dc.b	4
 604  0007 03            	dc.b	3
 605  0008 04            	dc.b	4
 606  0009 03            	dc.b	3
 607  000a 01            	dc.b	1
 608  000b 02            	dc.b	2
 609  000c               __keypwClient:
 610  000c 04            	dc.b	4
 611  000d 03            	dc.b	3
 612  000e 04            	dc.b	4
 613  000f 03            	dc.b	3
 614  0010 01            	dc.b	1
 615  0011 03            	dc.b	3
 616  0012               __keypwDefault:
 617  0012 04            	dc.b	4
 618  0013 03            	dc.b	3
 619  0014 04            	dc.b	4
 620  0015 03            	dc.b	3
 621  0016 01            	dc.b	1
 622  0017 04            	dc.b	4
 623                     	switch	.data
 624  000a               __keypwIndexMaster:
 625  000a 00            	dc.b	0
 626  000b               __keypwIndexMaster2:
 627  000b 00            	dc.b	0
 628  000c               __keypwIndexClient:
 629  000c 00            	dc.b	0
 630  000d               __keypwIndexDefault:
 631  000d 00            	dc.b	0
 663                     ; 197 void	file_update2(uint8_t i)
 663                     ; 198 {
 664                     .text:	section	.text,new
 665  0000               _file_update2:
 669                     ; 199 	if( i==0 )	FW_BACKLIGHT(_backlight);
 671  0000 4d            	tnz	a
 672  0001 260a          	jrne	L701
 675  0003 c60000        	ld	a,__backlight
 676  0006 97            	ld	xl,a
 677  0007 a62a          	ld	a,#42
 678  0009 95            	ld	xh,a
 679  000a cd0000        	call	_file_write
 681  000d               L701:
 682                     ; 200 }
 685  000d 81            	ret
 713                     ; 238 void	file_update(void)
 713                     ; 239 {
 714                     .text:	section	.text,new
 715  0000               _file_update:
 719                     ; 240 	FW_CNTLMODE(uiInfo.cntlMode);
 721  0000 c60003        	ld	a,_uiInfo+3
 722  0003 97            	ld	xl,a
 723  0004 a608          	ld	a,#8
 724  0006 95            	ld	xh,a
 725  0007 cd0000        	call	_file_write
 727                     ; 241 	FW_MODE(uiInfo.mode);
 729  000a c60008        	ld	a,_uiInfo+8
 730  000d 97            	ld	xl,a
 731  000e a609          	ld	a,#9
 732  0010 95            	ld	xh,a
 733  0011 cd0000        	call	_file_write
 735                     ; 242 	FW_ID(uiInfo.id);
 737  0014 c60004        	ld	a,_uiInfo+4
 738  0017 97            	ld	xl,a
 739  0018 a60a          	ld	a,#10
 740  001a 95            	ld	xh,a
 741  001b cd0000        	call	_file_write
 743                     ; 243 	FW_CNT(uiInfo.cnt);
 745  001e c60005        	ld	a,_uiInfo+5
 746  0021 97            	ld	xl,a
 747  0022 a60b          	ld	a,#11
 748  0024 95            	ld	xh,a
 749  0025 cd0000        	call	_file_write
 751                     ; 244 	FW_CNT_SUB(uiInfo.cnt_sub);
 753  0028 c60006        	ld	a,_uiInfo+6
 754  002b 97            	ld	xl,a
 755  002c a62b          	ld	a,#43
 756  002e 95            	ld	xh,a
 757  002f cd0000        	call	_file_write
 759                     ; 245 	FW_OPMODE(uiInfo.opMode);
 761  0032 c60007        	ld	a,_uiInfo+7
 762  0035 97            	ld	xl,a
 763  0036 a60c          	ld	a,#12
 764  0038 95            	ld	xh,a
 765  0039 cd0000        	call	_file_write
 767                     ; 247 	FW_CNT_MODE(uiInfo.controlMode);
 769  003c c60009        	ld	a,_uiInfo+9
 770  003f 97            	ld	xl,a
 771  0040 a60d          	ld	a,#13
 772  0042 95            	ld	xh,a
 773  0043 cd0000        	call	_file_write
 775                     ; 248 	FW_VALVE(uiInfo.valve);
 777  0046 c6000a        	ld	a,_uiInfo+10
 778  0049 97            	ld	xl,a
 779  004a a60e          	ld	a,#14
 780  004c 95            	ld	xh,a
 781  004d cd0000        	call	_file_write
 783                     ; 249 	FW_VALVE_SUB(uiInfo.valve_sub);
 785  0050 c6000b        	ld	a,_uiInfo+11
 786  0053 97            	ld	xl,a
 787  0054 a62c          	ld	a,#44
 788  0056 95            	ld	xh,a
 789  0057 cd0000        	call	_file_write
 791                     ; 250 	FW_REPEAT(uiInfo.repeat);
 793  005a c6000c        	ld	a,_uiInfo+12
 794  005d 97            	ld	xl,a
 795  005e a60f          	ld	a,#15
 796  0060 95            	ld	xh,a
 797  0061 cd0000        	call	_file_write
 799                     ; 251 	FW_RESERVE(uiInfo.reserve);
 801  0064 c6000d        	ld	a,_uiInfo+13
 802  0067 97            	ld	xl,a
 803  0068 a610          	ld	a,#16
 804  006a 95            	ld	xh,a
 805  006b cd0000        	call	_file_write
 807                     ; 252 	FW_TSETUP(uiInfo.tSetup);
 809  006e c6000e        	ld	a,_uiInfo+14
 810  0071 97            	ld	xl,a
 811  0072 a611          	ld	a,#17
 812  0074 95            	ld	xh,a
 813  0075 cd0000        	call	_file_write
 815                     ; 254 	FW_POTYPE(uiInfo.poType);
 817  0078 c6000f        	ld	a,_uiInfo+15
 818  007b 97            	ld	xl,a
 819  007c a612          	ld	a,#18
 820  007e 95            	ld	xh,a
 821  007f cd0000        	call	_file_write
 823                     ; 255 	FW_HOUSECAPA(uiInfo.houseCapa);
 825  0082 c60010        	ld	a,_uiInfo+16
 826  0085 97            	ld	xl,a
 827  0086 a613          	ld	a,#19
 828  0088 95            	ld	xh,a
 829  0089 cd0000        	call	_file_write
 831                     ; 256 	FW_TOFFSET(uiInfo.tOffset);
 833  008c c60011        	ld	a,_uiInfo+17
 834  008f 97            	ld	xl,a
 835  0090 a614          	ld	a,#20
 836  0092 95            	ld	xh,a
 837  0093 cd0000        	call	_file_write
 839                     ; 258 	FW_VALVE_INFOS
 841  0096 c60015        	ld	a,_uiInfo+21
 842  0099 97            	ld	xl,a
 843  009a a615          	ld	a,#21
 844  009c 95            	ld	xh,a
 845  009d cd0000        	call	_file_write
 849  00a0 c60016        	ld	a,_uiInfo+22
 850  00a3 97            	ld	xl,a
 851  00a4 a616          	ld	a,#22
 852  00a6 95            	ld	xh,a
 853  00a7 cd0000        	call	_file_write
 857  00aa c60017        	ld	a,_uiInfo+23
 858  00ad 97            	ld	xl,a
 859  00ae a617          	ld	a,#23
 860  00b0 95            	ld	xh,a
 861  00b1 cd0000        	call	_file_write
 865  00b4 c60018        	ld	a,_uiInfo+24
 866  00b7 97            	ld	xl,a
 867  00b8 a618          	ld	a,#24
 868  00ba 95            	ld	xh,a
 869  00bb cd0000        	call	_file_write
 873  00be c60019        	ld	a,_uiInfo+25
 874  00c1 97            	ld	xl,a
 875  00c2 a619          	ld	a,#25
 876  00c4 95            	ld	xh,a
 877  00c5 cd0000        	call	_file_write
 881  00c8 c6001a        	ld	a,_uiInfo+26
 882  00cb 97            	ld	xl,a
 883  00cc a61a          	ld	a,#26
 884  00ce 95            	ld	xh,a
 885  00cf cd0000        	call	_file_write
 889  00d2 c6001b        	ld	a,_uiInfo+27
 890  00d5 97            	ld	xl,a
 891  00d6 a61b          	ld	a,#27
 892  00d8 95            	ld	xh,a
 893  00d9 cd0000        	call	_file_write
 897  00dc c6001c        	ld	a,_uiInfo+28
 898  00df 97            	ld	xl,a
 899  00e0 a61c          	ld	a,#28
 900  00e2 95            	ld	xh,a
 901  00e3 cd0000        	call	_file_write
 905  00e6 c60025        	ld	a,_uiInfo+37
 906  00e9 97            	ld	xl,a
 907  00ea a62e          	ld	a,#46
 908  00ec 95            	ld	xh,a
 909  00ed cd0000        	call	_file_write
 913  00f0 c60026        	ld	a,_uiInfo+38
 914  00f3 97            	ld	xl,a
 915  00f4 a62f          	ld	a,#47
 916  00f6 95            	ld	xh,a
 917  00f7 cd0000        	call	_file_write
 921  00fa c60027        	ld	a,_uiInfo+39
 922  00fd 97            	ld	xl,a
 923  00fe a630          	ld	a,#48
 924  0100 95            	ld	xh,a
 925  0101 cd0000        	call	_file_write
 929  0104 c60028        	ld	a,_uiInfo+40
 930  0107 97            	ld	xl,a
 931  0108 a631          	ld	a,#49
 932  010a 95            	ld	xh,a
 933  010b cd0000        	call	_file_write
 937  010e c60029        	ld	a,_uiInfo+41
 938  0111 97            	ld	xl,a
 939  0112 a632          	ld	a,#50
 940  0114 95            	ld	xh,a
 941  0115 cd0000        	call	_file_write
 945  0118 c6002a        	ld	a,_uiInfo+42
 946  011b 97            	ld	xl,a
 947  011c a633          	ld	a,#51
 948  011e 95            	ld	xh,a
 949  011f cd0000        	call	_file_write
 953  0122 c6002b        	ld	a,_uiInfo+43
 954  0125 97            	ld	xl,a
 955  0126 a634          	ld	a,#52
 956  0128 95            	ld	xh,a
 957  0129 cd0000        	call	_file_write
 961  012c c6002c        	ld	a,_uiInfo+44
 962  012f 97            	ld	xl,a
 963  0130 a635          	ld	a,#53
 964  0132 95            	ld	xh,a
 965  0133 cd0000        	call	_file_write
 967                     ; 259 	FW_VALVE_RCINFOS
 969  0136 c6001d        	ld	a,_uiInfo+29
 970  0139 97            	ld	xl,a
 971  013a a61d          	ld	a,#29
 972  013c 95            	ld	xh,a
 973  013d cd0000        	call	_file_write
 977  0140 c6001e        	ld	a,_uiInfo+30
 978  0143 97            	ld	xl,a
 979  0144 a61e          	ld	a,#30
 980  0146 95            	ld	xh,a
 981  0147 cd0000        	call	_file_write
 985  014a c6001f        	ld	a,_uiInfo+31
 986  014d 97            	ld	xl,a
 987  014e a61f          	ld	a,#31
 988  0150 95            	ld	xh,a
 989  0151 cd0000        	call	_file_write
 993  0154 c60020        	ld	a,_uiInfo+32
 994  0157 97            	ld	xl,a
 995  0158 a620          	ld	a,#32
 996  015a 95            	ld	xh,a
 997  015b cd0000        	call	_file_write
1001  015e c60021        	ld	a,_uiInfo+33
1002  0161 97            	ld	xl,a
1003  0162 a621          	ld	a,#33
1004  0164 95            	ld	xh,a
1005  0165 cd0000        	call	_file_write
1009  0168 c60022        	ld	a,_uiInfo+34
1010  016b 97            	ld	xl,a
1011  016c a622          	ld	a,#34
1012  016e 95            	ld	xh,a
1013  016f cd0000        	call	_file_write
1017  0172 c60023        	ld	a,_uiInfo+35
1018  0175 97            	ld	xl,a
1019  0176 a623          	ld	a,#35
1020  0178 95            	ld	xh,a
1021  0179 cd0000        	call	_file_write
1025  017c c60024        	ld	a,_uiInfo+36
1026  017f 97            	ld	xl,a
1027  0180 a624          	ld	a,#36
1028  0182 95            	ld	xh,a
1029  0183 cd0000        	call	_file_write
1033  0186 c6002d        	ld	a,_uiInfo+45
1034  0189 97            	ld	xl,a
1035  018a a636          	ld	a,#54
1036  018c 95            	ld	xh,a
1037  018d cd0000        	call	_file_write
1041  0190 c6002e        	ld	a,_uiInfo+46
1042  0193 97            	ld	xl,a
1043  0194 a637          	ld	a,#55
1044  0196 95            	ld	xh,a
1045  0197 cd0000        	call	_file_write
1049  019a c6002f        	ld	a,_uiInfo+47
1050  019d 97            	ld	xl,a
1051  019e a638          	ld	a,#56
1052  01a0 95            	ld	xh,a
1053  01a1 cd0000        	call	_file_write
1057  01a4 c60030        	ld	a,_uiInfo+48
1058  01a7 97            	ld	xl,a
1059  01a8 a639          	ld	a,#57
1060  01aa 95            	ld	xh,a
1061  01ab cd0000        	call	_file_write
1065  01ae c60031        	ld	a,_uiInfo+49
1066  01b1 97            	ld	xl,a
1067  01b2 a63a          	ld	a,#58
1068  01b4 95            	ld	xh,a
1069  01b5 cd0000        	call	_file_write
1073  01b8 c60032        	ld	a,_uiInfo+50
1074  01bb 97            	ld	xl,a
1075  01bc a63b          	ld	a,#59
1076  01be 95            	ld	xh,a
1077  01bf cd0000        	call	_file_write
1081  01c2 c60033        	ld	a,_uiInfo+51
1082  01c5 97            	ld	xl,a
1083  01c6 a63c          	ld	a,#60
1084  01c8 95            	ld	xh,a
1085  01c9 cd0000        	call	_file_write
1089  01cc c60034        	ld	a,_uiInfo+52
1090  01cf 97            	ld	xl,a
1091  01d0 a63d          	ld	a,#61
1092  01d2 95            	ld	xh,a
1093  01d3 cd0000        	call	_file_write
1095                     ; 261 	FW_B_SHOWER(_boiler_water_shower);
1097  01d6 c60000        	ld	a,__boiler_water_shower
1098  01d9 97            	ld	xl,a
1099  01da a625          	ld	a,#37
1100  01dc 95            	ld	xh,a
1101  01dd cd0000        	call	_file_write
1103                     ; 262 	FW_B_HEAT(_boiler_water_heat);
1105  01e0 c60000        	ld	a,__boiler_water_heat
1106  01e3 97            	ld	xl,a
1107  01e4 a626          	ld	a,#38
1108  01e6 95            	ld	xh,a
1109  01e7 cd0000        	call	_file_write
1111                     ; 263 	FW_TEMPOFFSET(uiInfo.tempOffset);
1113  01ea c60012        	ld	a,_uiInfo+18
1114  01ed 97            	ld	xl,a
1115  01ee a627          	ld	a,#39
1116  01f0 95            	ld	xh,a
1117  01f1 cd0000        	call	_file_write
1119                     ; 264 	FW_LPM(uiInfo.lpmType);
1121  01f4 c60013        	ld	a,_uiInfo+19
1122  01f7 97            	ld	xl,a
1123  01f8 a628          	ld	a,#40
1124  01fa 95            	ld	xh,a
1125  01fb cd0000        	call	_file_write
1127                     ; 265 	FW_LPM_SUB(uiInfo.lpmType_sub);
1129  01fe c60014        	ld	a,_uiInfo+20
1130  0201 97            	ld	xl,a
1131  0202 a62d          	ld	a,#45
1132  0204 95            	ld	xh,a
1133  0205 cd0000        	call	_file_write
1135                     ; 266 	FW_DISPMODE(_disp_mode);
1137  0208 c60000        	ld	a,__disp_mode
1138  020b 97            	ld	xl,a
1139  020c a629          	ld	a,#41
1140  020e 95            	ld	xh,a
1141  020f cd0000        	call	_file_write
1143                     ; 272 }
1146  0212 81            	ret
1149                     	switch	.data
1150  000e               __ds:
1151  000e 64            	dc.b	100
1152  000f               __dsCount:
1153  000f 00            	dc.b	0
1154  0010               __dsPrev:
1155  0010 00            	dc.b	0
1177                     ; 280 void	clear_npos1(void)
1177                     ; 281 {
1178                     .text:	section	.text,new
1179  0000               _clear_npos1:
1183                     ; 282 	lcd_clear_npos(0, 0);
1185  0000 5f            	clrw	x
1186  0001 cd0000        	call	_lcd_clear_npos
1188                     ; 283 	lcd_clear_npos(1, 0);
1190  0004 ae0100        	ldw	x,#256
1191  0007 cd0000        	call	_lcd_clear_npos
1193                     ; 284 }
1196  000a 81            	ret
1220                     ; 286 void	clear_npos2(void)
1220                     ; 287 {
1221                     .text:	section	.text,new
1222  0000               _clear_npos2:
1226                     ; 288 	lcd_clear_npos(2, 0);
1228  0000 ae0200        	ldw	x,#512
1229  0003 cd0000        	call	_lcd_clear_npos
1231                     ; 289 	lcd_clear_npos(3, 0);
1233  0006 ae0300        	ldw	x,#768
1234  0009 cd0000        	call	_lcd_clear_npos
1236                     ; 290 }
1239  000c 81            	ret
1265                     ; 292 void	disp_next(void)
1265                     ; 293 {
1266                     .text:	section	.text,new
1267  0000               _disp_next:
1271                     ; 294 	lcd_clear(0);
1273  0000 4f            	clr	a
1274  0001 cd0000        	call	_lcd_clear
1276                     ; 295 	_dsCount = 1;
1278  0004 3501000f      	mov	__dsCount,#1
1279                     ; 296 	_dsPrev = 0xff;
1281  0008 35ff0010      	mov	__dsPrev,#255
1282                     ; 297 }
1285  000c 81            	ret
1340                     ; 299 void	disp_status_id(uint8_t key, uint8_t next)
1340                     ; 300 {
1341                     .text:	section	.text,new
1342  0000               _disp_status_id:
1344  0000 89            	pushw	x
1345  0001 88            	push	a
1346       00000001      OFST:	set	1
1349                     ; 302 	if( _dsCount == 0 )
1351  0002 725d000f      	tnz	__dsCount
1352  0006 2613          	jrne	L171
1353                     ; 304 		disp_next();
1355  0008 cd0000        	call	_disp_next
1357                     ; 305 		lcd_disp_setup_id();
1359  000b cd0000        	call	_lcd_disp_setup_id
1361                     ; 306 		if( uiInfoSet.id < 2 )
1363  000e c60066        	ld	a,_uiInfoSet+1
1364  0011 a102          	cp	a,#2
1365  0013 2452          	jruge	L571
1366                     ; 307 			uiInfoSet.id = 2;
1368  0015 35020066      	mov	_uiInfoSet+1,#2
1369  0019 204c          	jra	L571
1370  001b               L171:
1371                     ; 311 		i = uiInfoSet.id;
1373  001b c60066        	ld	a,_uiInfoSet+1
1374  001e 6b01          	ld	(OFST+0,sp),a
1375                     ; 312 		if( uiInfo.enc != 0 )
1377  0020 725d0000      	tnz	_uiInfo
1378  0024 272a          	jreq	L771
1379                     ; 314 			if( (uiInfo.enc&0x40) == 0 )
1381  0026 c60000        	ld	a,_uiInfo
1382  0029 a540          	bcp	a,#64
1383  002b 2610          	jrne	L102
1384                     ; 316 				if( i==2 )	i = 10;
1386  002d 7b01          	ld	a,(OFST+0,sp)
1387  002f a102          	cp	a,#2
1388  0031 2606          	jrne	L302
1391  0033 a60a          	ld	a,#10
1392  0035 6b01          	ld	(OFST+0,sp),a
1394  0037 2012          	jra	L702
1395  0039               L302:
1396                     ; 318 					i--;
1398  0039 0a01          	dec	(OFST+0,sp)
1399  003b 200e          	jra	L702
1400  003d               L102:
1401                     ; 322 				if( i==10 )	i = 2;
1403  003d 7b01          	ld	a,(OFST+0,sp)
1404  003f a10a          	cp	a,#10
1405  0041 2606          	jrne	L112
1408  0043 a602          	ld	a,#2
1409  0045 6b01          	ld	(OFST+0,sp),a
1411  0047 2002          	jra	L702
1412  0049               L112:
1413                     ; 324 					i++;
1415  0049 0c01          	inc	(OFST+0,sp)
1416  004b               L702:
1417                     ; 326 			uiInfoSet.id = i;
1419  004b 7b01          	ld	a,(OFST+0,sp)
1420  004d c70066        	ld	_uiInfoSet+1,a
1421  0050               L771:
1422                     ; 328 		if( _dsPrev != i )
1424  0050 c60010        	ld	a,__dsPrev
1425  0053 1101          	cp	a,(OFST+0,sp)
1426  0055 2710          	jreq	L571
1427                     ; 330 			_dsPrev = i;
1429  0057 7b01          	ld	a,(OFST+0,sp)
1430  0059 c70010        	ld	__dsPrev,a
1431                     ; 332 			lcd_disp_n(3, uiInfoSet.id - 1);
1433  005c c60066        	ld	a,_uiInfoSet+1
1434  005f 4a            	dec	a
1435  0060 97            	ld	xl,a
1436  0061 a603          	ld	a,#3
1437  0063 95            	ld	xh,a
1438  0064 cd0000        	call	_lcd_disp_n
1440  0067               L571:
1441                     ; 335 	if( key == 3 )	
1443  0067 7b02          	ld	a,(OFST+1,sp)
1444  0069 a103          	cp	a,#3
1445  006b 2623          	jrne	L712
1446                     ; 337 		if( uiInfoSet.id == 10 )
1448  006d c60066        	ld	a,_uiInfoSet+1
1449  0070 a10a          	cp	a,#10
1450  0072 260f          	jrne	L122
1451                     ; 340 			uiInfo.id = 1;
1453  0074 35010004      	mov	_uiInfo+4,#1
1454                     ; 341 			uiInfo.mode = 1;
1456  0078 35010008      	mov	_uiInfo+8,#1
1457                     ; 342 			copy_info(9);
1459  007c a609          	ld	a,#9
1460  007e cd0000        	call	_copy_info
1462                     ; 343 			return;
1464  0081 200d          	jra	L22
1465  0083               L122:
1466                     ; 345 		STATUS_NEXT(next);	
1468  0083 7b03          	ld	a,(OFST+2,sp)
1469  0085 c7000e        	ld	__ds,a
1472  0088 725f000f      	clr	__dsCount
1475  008c 35ff0010      	mov	__dsPrev,#255
1477  0090               L712:
1478                     ; 347 }
1479  0090               L22:
1482  0090 5b03          	addw	sp,#3
1483  0092 81            	ret
1538                     ; 349 void	disp_status_valveCount(uint8_t key, uint8_t next)
1538                     ; 350 {
1539                     .text:	section	.text,new
1540  0000               _disp_status_valveCount:
1542  0000 89            	pushw	x
1543  0001 88            	push	a
1544       00000001      OFST:	set	1
1547                     ; 352 	if( _dsCount == 0 )
1549  0002 725d000f      	tnz	__dsCount
1550  0006 2608          	jrne	L342
1551                     ; 354 		disp_next();
1553  0008 cd0000        	call	_disp_next
1555                     ; 355 		lcd_disp_setup_valve();
1557  000b cd0000        	call	_lcd_disp_setup_valve
1560  000e 2079          	jra	L542
1561  0010               L342:
1562                     ; 359 		i = uiInfoSet.controlMode==0 ? uiInfoSet.valve : uiInfoSet.valve_sub;
1564  0010 725d006b      	tnz	_uiInfoSet+6
1565  0014 2605          	jrne	L62
1566  0016 c6006c        	ld	a,_uiInfoSet+7
1567  0019 2003          	jra	L03
1568  001b               L62:
1569  001b c6006d        	ld	a,_uiInfoSet+8
1570  001e               L03:
1571  001e 6b01          	ld	(OFST+0,sp),a
1572                     ; 360 		if( uiInfo.enc != 0 )
1574  0020 725d0000      	tnz	_uiInfo
1575  0024 2737          	jreq	L742
1576                     ; 362 			ENC_MOVE_0(1, 8, 1);
1578  0026 c60000        	ld	a,_uiInfo
1579  0029 a540          	bcp	a,#64
1580  002b 2610          	jrne	L152
1583  002d 7b01          	ld	a,(OFST+0,sp)
1584  002f a102          	cp	a,#2
1585  0031 2406          	jruge	L352
1588  0033 a608          	ld	a,#8
1589  0035 6b01          	ld	(OFST+0,sp),a
1591  0037 2012          	jra	L752
1592  0039               L352:
1595  0039 0a01          	dec	(OFST+0,sp)
1596  003b 200e          	jra	L752
1597  003d               L152:
1600  003d 7b01          	ld	a,(OFST+0,sp)
1601  003f a108          	cp	a,#8
1602  0041 2506          	jrult	L162
1605  0043 a601          	ld	a,#1
1606  0045 6b01          	ld	(OFST+0,sp),a
1608  0047 2002          	jra	L752
1609  0049               L162:
1612  0049 0c01          	inc	(OFST+0,sp)
1613  004b               L752:
1614                     ; 363 			if( uiInfoSet.controlMode==0 )
1617  004b 725d006b      	tnz	_uiInfoSet+6
1618  004f 2607          	jrne	L562
1619                     ; 364 				uiInfoSet.valve = i;
1621  0051 7b01          	ld	a,(OFST+0,sp)
1622  0053 c7006c        	ld	_uiInfoSet+7,a
1624  0056 2005          	jra	L742
1625  0058               L562:
1626                     ; 366 				uiInfoSet.valve_sub = i;
1628  0058 7b01          	ld	a,(OFST+0,sp)
1629  005a c7006d        	ld	_uiInfoSet+8,a
1630  005d               L742:
1631                     ; 368 		if( _dsPrev != i )
1633  005d c60010        	ld	a,__dsPrev
1634  0060 1101          	cp	a,(OFST+0,sp)
1635  0062 2725          	jreq	L542
1636                     ; 370 			_dsPrev = i;
1638  0064 7b01          	ld	a,(OFST+0,sp)
1639  0066 c70010        	ld	__dsPrev,a
1640                     ; 371 			UI_DISP_2Digit(i);
1642  0069 7b01          	ld	a,(OFST+0,sp)
1643  006b 5f            	clrw	x
1644  006c 97            	ld	xl,a
1645  006d a60a          	ld	a,#10
1646  006f 62            	div	x,a
1647  0070 9f            	ld	a,xl
1648  0071 97            	ld	xl,a
1649  0072 a602          	ld	a,#2
1650  0074 95            	ld	xh,a
1651  0075 cd0000        	call	_lcd_disp_n
1655  0078 7b01          	ld	a,(OFST+0,sp)
1656  007a 5f            	clrw	x
1657  007b 97            	ld	xl,a
1658  007c a60a          	ld	a,#10
1659  007e 62            	div	x,a
1660  007f 5f            	clrw	x
1661  0080 97            	ld	xl,a
1662  0081 9f            	ld	a,xl
1663  0082 97            	ld	xl,a
1664  0083 a603          	ld	a,#3
1665  0085 95            	ld	xh,a
1666  0086 cd0000        	call	_lcd_disp_n
1669  0089               L542:
1670                     ; 374 	if( key == 3 )		
1672  0089 7b02          	ld	a,(OFST+1,sp)
1673  008b a103          	cp	a,#3
1674  008d 261f          	jrne	L372
1675                     ; 377 		if( uiInfoSet.controlMode==0 )
1677  008f 725d006b      	tnz	_uiInfoSet+6
1678  0093 2607          	jrne	L572
1679                     ; 378 			uiInfoSet.cnt = uiInfoSet.valve;
1681  0095 55006c0067    	mov	_uiInfoSet+2,_uiInfoSet+7
1683  009a 2005          	jra	L772
1684  009c               L572:
1685                     ; 380 			uiInfoSet.cnt_sub = uiInfoSet.valve_sub;
1687  009c 55006d0068    	mov	_uiInfoSet+3,_uiInfoSet+8
1688  00a1               L772:
1689                     ; 381 		STATUS_NEXT(next);	
1691  00a1 7b03          	ld	a,(OFST+2,sp)
1692  00a3 c7000e        	ld	__ds,a
1695  00a6 725f000f      	clr	__dsCount
1698  00aa 35ff0010      	mov	__dsPrev,#255
1700  00ae               L372:
1701                     ; 383 }
1704  00ae 5b03          	addw	sp,#3
1705  00b0 81            	ret
1770                     ; 385 void	disp_status_toffset(uint8_t key, uint8_t next)
1770                     ; 386 {
1771                     .text:	section	.text,new
1772  0000               _disp_status_toffset:
1774  0000 89            	pushw	x
1775  0001 88            	push	a
1776       00000001      OFST:	set	1
1779                     ; 388 	if( _dsCount == 0 )
1781  0002 725d000f      	tnz	__dsCount
1782  0006 260a          	jrne	L323
1783                     ; 390 		disp_next();
1785  0008 cd0000        	call	_disp_next
1787                     ; 391 		lcd_disp_setup_c();
1789  000b cd0000        	call	_lcd_disp_setup_c
1792  000e aced00ed      	jpf	L523
1793  0012               L323:
1794                     ; 395 		i = uiInfoSet.tOffset;
1796  0012 c60070        	ld	a,_uiInfoSet+11
1797  0015 6b01          	ld	(OFST+0,sp),a
1798                     ; 396 		if( uiInfo.enc != 0 )
1800  0017 725d0000      	tnz	_uiInfo
1801  001b 2752          	jreq	L723
1802                     ; 398 			if( (uiInfo.enc & 0x40) == 0 )
1804  001d c60000        	ld	a,_uiInfo
1805  0020 a540          	bcp	a,#64
1806  0022 2624          	jrne	L133
1807                     ; 400 				if( i > 100 )			i--;
1809  0024 7b01          	ld	a,(OFST+0,sp)
1810  0026 a165          	cp	a,#101
1811  0028 2504          	jrult	L333
1814  002a 0a01          	dec	(OFST+0,sp)
1816  002c 203c          	jra	L543
1817  002e               L333:
1818                     ; 401 				else if( i == 100 )		i = 1;
1820  002e 7b01          	ld	a,(OFST+0,sp)
1821  0030 a164          	cp	a,#100
1822  0032 2606          	jrne	L733
1825  0034 a601          	ld	a,#1
1826  0036 6b01          	ld	(OFST+0,sp),a
1828  0038 2030          	jra	L543
1829  003a               L733:
1830                     ; 404 					i++;
1832  003a 0c01          	inc	(OFST+0,sp)
1833                     ; 405 					if( i >= 19 )		i = 19;
1835  003c 7b01          	ld	a,(OFST+0,sp)
1836  003e a113          	cp	a,#19
1837  0040 2528          	jrult	L543
1840  0042 a613          	ld	a,#19
1841  0044 6b01          	ld	(OFST+0,sp),a
1842  0046 2022          	jra	L543
1843  0048               L133:
1844                     ; 410 				if( i >= 100 )
1846  0048 7b01          	ld	a,(OFST+0,sp)
1847  004a a164          	cp	a,#100
1848  004c 250e          	jrult	L743
1849                     ; 412 					i++;
1851  004e 0c01          	inc	(OFST+0,sp)
1852                     ; 413 					if( i >= 119 )		i = 119;
1854  0050 7b01          	ld	a,(OFST+0,sp)
1855  0052 a177          	cp	a,#119
1856  0054 2514          	jrult	L543
1859  0056 a677          	ld	a,#119
1860  0058 6b01          	ld	(OFST+0,sp),a
1861  005a 200e          	jra	L543
1862  005c               L743:
1863                     ; 417 					if( i == 1 )		i = 100;
1865  005c 7b01          	ld	a,(OFST+0,sp)
1866  005e a101          	cp	a,#1
1867  0060 2606          	jrne	L553
1870  0062 a664          	ld	a,#100
1871  0064 6b01          	ld	(OFST+0,sp),a
1873  0066 2002          	jra	L543
1874  0068               L553:
1875                     ; 419 						i--;
1877  0068 0a01          	dec	(OFST+0,sp)
1878  006a               L543:
1879                     ; 422 			uiInfoSet.tOffset = i;
1881  006a 7b01          	ld	a,(OFST+0,sp)
1882  006c c70070        	ld	_uiInfoSet+11,a
1883  006f               L723:
1884                     ; 424 		if( _dsPrev != i )
1886  006f c60010        	ld	a,__dsPrev
1887  0072 1101          	cp	a,(OFST+0,sp)
1888  0074 2777          	jreq	L523
1889                     ; 426 			_dsPrev = i;
1891  0076 7b01          	ld	a,(OFST+0,sp)
1892  0078 c70010        	ld	__dsPrev,a
1893                     ; 427 			clear_npos2();
1895  007b cd0000        	call	_clear_npos2
1897                     ; 428 			LCD_BIT_CLEAR(bT3);
1899  007e c6003b        	ld	a,_iLF_DEF+59
1900  0081 5f            	clrw	x
1901  0082 97            	ld	xl,a
1902  0083 c6003b        	ld	a,_bLF_DEF+59
1903  0086 43            	cpl	a
1904  0087 d4540c        	and	a,(21516,x)
1905  008a d7540c        	ld	(21516,x),a
1906                     ; 429 			LCD_BIT_CLEAR(bT4);
1908  008d c6002b        	ld	a,_iLF_DEF+43
1909  0090 5f            	clrw	x
1910  0091 97            	ld	xl,a
1911  0092 c6002b        	ld	a,_bLF_DEF+43
1912  0095 43            	cpl	a
1913  0096 d4540c        	and	a,(21516,x)
1914  0099 d7540c        	ld	(21516,x),a
1915                     ; 430 			if( i < 100 )
1917  009c 7b01          	ld	a,(OFST+0,sp)
1918  009e a164          	cp	a,#100
1919  00a0 240e          	jruge	L363
1920                     ; 432 				LCD_BIT_SET(b3G);
1922  00a2 c60028        	ld	a,_iLF_DEF+40
1923  00a5 5f            	clrw	x
1924  00a6 97            	ld	xl,a
1925  00a7 d6540c        	ld	a,(21516,x)
1926  00aa ca0028        	or	a,_bLF_DEF+40
1927  00ad d7540c        	ld	(21516,x),a
1928  00b0               L363:
1929                     ; 434 			j = i%100;
1931  00b0 7b01          	ld	a,(OFST+0,sp)
1932  00b2 5f            	clrw	x
1933  00b3 97            	ld	xl,a
1934  00b4 a664          	ld	a,#100
1935  00b6 62            	div	x,a
1936  00b7 5f            	clrw	x
1937  00b8 97            	ld	xl,a
1938  00b9 9f            	ld	a,xl
1939  00ba 6b01          	ld	(OFST+0,sp),a
1940                     ; 435 			lcd_disp_n(3, j/2);
1942  00bc 7b01          	ld	a,(OFST+0,sp)
1943  00be 5f            	clrw	x
1944  00bf 97            	ld	xl,a
1945  00c0 57            	sraw	x
1946  00c1 9f            	ld	a,xl
1947  00c2 97            	ld	xl,a
1948  00c3 a603          	ld	a,#3
1949  00c5 95            	ld	xh,a
1950  00c6 cd0000        	call	_lcd_disp_n
1952                     ; 436 			if( (j%2) == 1 )
1954  00c9 7b01          	ld	a,(OFST+0,sp)
1955  00cb a401          	and	a,#1
1956  00cd a101          	cp	a,#1
1957  00cf 261c          	jrne	L523
1958                     ; 438 				LCD_BIT_SET(bT3);
1960  00d1 c6003b        	ld	a,_iLF_DEF+59
1961  00d4 5f            	clrw	x
1962  00d5 97            	ld	xl,a
1963  00d6 d6540c        	ld	a,(21516,x)
1964  00d9 ca003b        	or	a,_bLF_DEF+59
1965  00dc d7540c        	ld	(21516,x),a
1966                     ; 439 				LCD_BIT_SET(bT4);
1968  00df c6002b        	ld	a,_iLF_DEF+43
1969  00e2 5f            	clrw	x
1970  00e3 97            	ld	xl,a
1971  00e4 d6540c        	ld	a,(21516,x)
1972  00e7 ca002b        	or	a,_bLF_DEF+43
1973  00ea d7540c        	ld	(21516,x),a
1974  00ed               L523:
1975                     ; 443 	if( key == 3 )	
1977  00ed 7b02          	ld	a,(OFST+1,sp)
1978  00ef a103          	cp	a,#3
1979  00f1 260d          	jrne	L763
1980                     ; 445 		STATUS_NEXT(next);	
1982  00f3 7b03          	ld	a,(OFST+2,sp)
1983  00f5 c7000e        	ld	__ds,a
1986  00f8 725f000f      	clr	__dsCount
1989  00fc 35ff0010      	mov	__dsPrev,#255
1991  0100               L763:
1992                     ; 447 }
1995  0100 5b03          	addw	sp,#3
1996  0102 81            	ret
2052                     ; 449 void	disp_status_run_op(uint8_t key, uint8_t next)
2052                     ; 450 {
2053                     .text:	section	.text,new
2054  0000               _disp_status_run_op:
2056  0000 89            	pushw	x
2057  0001 88            	push	a
2058       00000001      OFST:	set	1
2061                     ; 452 	if( uiInfoSet.controlMode==1 )
2063  0002 c6006b        	ld	a,_uiInfoSet+6
2064  0005 a101          	cp	a,#1
2065  0007 260e          	jrne	L114
2066                     ; 454 		STATUS_NEXT(next);	
2068  0009 9f            	ld	a,xl
2069  000a c7000e        	ld	__ds,a
2072  000d 725f000f      	clr	__dsCount
2075  0011 35ff0010      	mov	__dsPrev,#255
2076                     ; 455 		return;
2079  0015 205d          	jra	L24
2080  0017               L114:
2081                     ; 457 	if( _dsCount == 0 )
2083  0017 725d000f      	tnz	__dsCount
2084  001b 2608          	jrne	L314
2085                     ; 459 		disp_next();
2087  001d cd0000        	call	_disp_next
2089                     ; 460 		lcd_disp_setup_cntl_op();
2091  0020 cd0000        	call	_lcd_disp_setup_cntl_op
2094  0023 203c          	jra	L514
2095  0025               L314:
2096                     ; 464 		i = uiInfoSet.opMode;
2098  0025 c60069        	ld	a,_uiInfoSet+4
2099  0028 6b01          	ld	(OFST+0,sp),a
2100                     ; 465 		if( uiInfo.enc != 0 )
2102  002a 725d0000      	tnz	_uiInfo
2103  002e 2710          	jreq	L714
2104                     ; 467 			i = i==0 ? 1 : 0;
2106  0030 0d01          	tnz	(OFST+0,sp)
2107  0032 2604          	jrne	L63
2108  0034 a601          	ld	a,#1
2109  0036 2001          	jra	L04
2110  0038               L63:
2111  0038 4f            	clr	a
2112  0039               L04:
2113  0039 6b01          	ld	(OFST+0,sp),a
2114                     ; 468 			uiInfoSet.opMode = i;
2116  003b 7b01          	ld	a,(OFST+0,sp)
2117  003d c70069        	ld	_uiInfoSet+4,a
2118  0040               L714:
2119                     ; 470 		if( _dsPrev != i )
2121  0040 c60010        	ld	a,__dsPrev
2122  0043 1101          	cp	a,(OFST+0,sp)
2123  0045 271a          	jreq	L514
2124                     ; 472 			_dsPrev = i;
2126  0047 7b01          	ld	a,(OFST+0,sp)
2127  0049 c70010        	ld	__dsPrev,a
2128                     ; 473 			clear_npos2();
2130  004c cd0000        	call	_clear_npos2
2132                     ; 474 			if( i==0 )		lcd_disp_setup_cntl_on();
2134  004f 0d01          	tnz	(OFST+0,sp)
2135  0051 2605          	jrne	L324
2138  0053 cd0000        	call	_lcd_disp_setup_cntl_on
2141  0056 2009          	jra	L514
2142  0058               L324:
2143                     ; 475 			else if( i==1 )	lcd_disp_setup_cntl_po();
2145  0058 7b01          	ld	a,(OFST+0,sp)
2146  005a a101          	cp	a,#1
2147  005c 2603          	jrne	L514
2150  005e cd0000        	call	_lcd_disp_setup_cntl_po
2152  0061               L514:
2153                     ; 478 	if( key == 3 )		
2155  0061 7b02          	ld	a,(OFST+1,sp)
2156  0063 a103          	cp	a,#3
2157  0065 260d          	jrne	L134
2158                     ; 480 		STATUS_NEXT(next);	
2160  0067 7b03          	ld	a,(OFST+2,sp)
2161  0069 c7000e        	ld	__ds,a
2164  006c 725f000f      	clr	__dsCount
2167  0070 35ff0010      	mov	__dsPrev,#255
2169  0074               L134:
2170                     ; 482 }
2171  0074               L24:
2174  0074 5b03          	addw	sp,#3
2175  0076 81            	ret
2232                     ; 484 void	disp_status_cntl_op(uint8_t key, uint8_t next)
2232                     ; 485 {
2233                     .text:	section	.text,new
2234  0000               _disp_status_cntl_op:
2236  0000 89            	pushw	x
2237  0001 88            	push	a
2238       00000001      OFST:	set	1
2241                     ; 487 	if( uiInfoSet.controlMode==1 )
2243  0002 c6006b        	ld	a,_uiInfoSet+6
2244  0005 a101          	cp	a,#1
2245  0007 260e          	jrne	L354
2246                     ; 489 		STATUS_NEXT(next);	
2248  0009 9f            	ld	a,xl
2249  000a c7000e        	ld	__ds,a
2252  000d 725f000f      	clr	__dsCount
2255  0011 35ff0010      	mov	__dsPrev,#255
2256                     ; 490 		return;
2259  0015 2057          	jra	L25
2260  0017               L354:
2261                     ; 492 	if( _dsCount == 0 )
2263  0017 725d000f      	tnz	__dsCount
2264  001b 2608          	jrne	L554
2265                     ; 494 		disp_next();
2267  001d cd0000        	call	_disp_next
2269                     ; 495 		lcd_disp_setup_mode();
2271  0020 cd0000        	call	_lcd_disp_setup_mode
2274  0023 2036          	jra	L754
2275  0025               L554:
2276                     ; 499 		i = uiInfoSet.cntlMode;
2278  0025 c60065        	ld	a,_uiInfoSet
2279  0028 6b01          	ld	(OFST+0,sp),a
2280                     ; 500 		if( uiInfo.enc != 0 )
2282  002a 725d0000      	tnz	_uiInfo
2283  002e 2710          	jreq	L164
2284                     ; 502 			i = i==0 ? 1 : 0;
2286  0030 0d01          	tnz	(OFST+0,sp)
2287  0032 2604          	jrne	L64
2288  0034 a601          	ld	a,#1
2289  0036 2001          	jra	L05
2290  0038               L64:
2291  0038 4f            	clr	a
2292  0039               L05:
2293  0039 6b01          	ld	(OFST+0,sp),a
2294                     ; 503 			uiInfoSet.cntlMode = i;
2296  003b 7b01          	ld	a,(OFST+0,sp)
2297  003d c70065        	ld	_uiInfoSet,a
2298  0040               L164:
2299                     ; 505 		if( _dsPrev != i )
2301  0040 c60010        	ld	a,__dsPrev
2302  0043 1101          	cp	a,(OFST+0,sp)
2303  0045 2714          	jreq	L754
2304                     ; 507 			_dsPrev = i;
2306  0047 7b01          	ld	a,(OFST+0,sp)
2307  0049 c70010        	ld	__dsPrev,a
2308                     ; 508 			clear_npos2();
2310  004c cd0000        	call	_clear_npos2
2312                     ; 509 			if( i == 0 )	lcd_disp_setup_mode_local();
2314  004f 0d01          	tnz	(OFST+0,sp)
2315  0051 2605          	jrne	L564
2318  0053 cd0000        	call	_lcd_disp_setup_mode_local
2321  0056 2003          	jra	L754
2322  0058               L564:
2323                     ; 510 			else			lcd_disp_setup_mode_each();
2325  0058 cd0000        	call	_lcd_disp_setup_mode_each
2327  005b               L754:
2328                     ; 513 	if( key == 3 )		
2330  005b 7b02          	ld	a,(OFST+1,sp)
2331  005d a103          	cp	a,#3
2332  005f 260d          	jrne	L174
2333                     ; 515 		STATUS_NEXT(next);	
2335  0061 7b03          	ld	a,(OFST+2,sp)
2336  0063 c7000e        	ld	__ds,a
2339  0066 725f000f      	clr	__dsCount
2342  006a 35ff0010      	mov	__dsPrev,#255
2344  006e               L174:
2345                     ; 517 }
2346  006e               L25:
2349  006e 5b03          	addw	sp,#3
2350  0070 81            	ret
2405                     ; 519 void	disp_status_houseCapa(uint8_t key, uint8_t next)
2405                     ; 520 {
2406                     .text:	section	.text,new
2407  0000               _disp_status_houseCapa:
2409  0000 89            	pushw	x
2410  0001 88            	push	a
2411       00000001      OFST:	set	1
2414                     ; 522 	if(uiInfoSet.cntlMode != 0 )	
2416  0002 725d0065      	tnz	_uiInfoSet
2417  0006 2710          	jreq	L315
2418                     ; 525 		STATUS_NEXT(next);
2420  0008 9f            	ld	a,xl
2421  0009 c7000e        	ld	__ds,a
2424  000c 725f000f      	clr	__dsCount
2427  0010 35ff0010      	mov	__dsPrev,#255
2428                     ; 526 		return;
2431  0014 acb200b2      	jpf	L65
2432  0018               L315:
2433                     ; 529 	if( _dsCount == 0 )
2435  0018 725d000f      	tnz	__dsCount
2436  001c 2608          	jrne	L515
2437                     ; 531 		disp_next();
2439  001e cd0000        	call	_disp_next
2441                     ; 532 		lcd_disp_setup_len();
2443  0021 cd0000        	call	_lcd_disp_setup_len
2446  0024 2079          	jra	L715
2447  0026               L515:
2448                     ; 536 		i = uiInfoSet.houseCapa;
2450  0026 c6006f        	ld	a,_uiInfoSet+10
2451  0029 6b01          	ld	(OFST+0,sp),a
2452                     ; 537 		if( uiInfo.enc != 0 )
2454  002b 725d0000      	tnz	_uiInfo
2455  002f 2726          	jreq	L125
2456                     ; 539 			if( (uiInfo.enc & 0x40) == 0 )	i--;
2458  0031 c60000        	ld	a,_uiInfo
2459  0034 a540          	bcp	a,#64
2460  0036 2604          	jrne	L325
2463  0038 0a01          	dec	(OFST+0,sp)
2465  003a 2002          	jra	L525
2466  003c               L325:
2467                     ; 541 				i++;
2469  003c 0c01          	inc	(OFST+0,sp)
2470  003e               L525:
2471                     ; 542 			if( i < 70 )	i = 200;
2473  003e 7b01          	ld	a,(OFST+0,sp)
2474  0040 a146          	cp	a,#70
2475  0042 2404          	jruge	L725
2478  0044 a6c8          	ld	a,#200
2479  0046 6b01          	ld	(OFST+0,sp),a
2480  0048               L725:
2481                     ; 543 			if( i > 200 )	i = 70;
2483  0048 7b01          	ld	a,(OFST+0,sp)
2484  004a a1c9          	cp	a,#201
2485  004c 2504          	jrult	L135
2488  004e a646          	ld	a,#70
2489  0050 6b01          	ld	(OFST+0,sp),a
2490  0052               L135:
2491                     ; 544 			uiInfoSet.houseCapa = i;
2493  0052 7b01          	ld	a,(OFST+0,sp)
2494  0054 c7006f        	ld	_uiInfoSet+10,a
2495  0057               L125:
2496                     ; 546 		if( _dsPrev != i )
2498  0057 c60010        	ld	a,__dsPrev
2499  005a 1101          	cp	a,(OFST+0,sp)
2500  005c 2741          	jreq	L715
2501                     ; 548 			_dsPrev = i;
2503  005e 7b01          	ld	a,(OFST+0,sp)
2504  0060 c70010        	ld	__dsPrev,a
2505                     ; 549 			UI_DISP_3Digit(i);
2507  0063 7b01          	ld	a,(OFST+0,sp)
2508  0065 5f            	clrw	x
2509  0066 97            	ld	xl,a
2510  0067 a664          	ld	a,#100
2511  0069 62            	div	x,a
2512  006a 9f            	ld	a,xl
2513  006b 97            	ld	xl,a
2514  006c a601          	ld	a,#1
2515  006e 95            	ld	xh,a
2516  006f cd0000        	call	_lcd_disp_n
2520  0072 7b01          	ld	a,(OFST+0,sp)
2521  0074 5f            	clrw	x
2522  0075 97            	ld	xl,a
2523  0076 a664          	ld	a,#100
2524  0078 62            	div	x,a
2525  0079 5f            	clrw	x
2526  007a 97            	ld	xl,a
2527  007b 01            	rrwa	x,a
2528  007c 6b01          	ld	(OFST+0,sp),a
2529  007e 02            	rlwa	x,a
2532  007f 7b01          	ld	a,(OFST+0,sp)
2533  0081 5f            	clrw	x
2534  0082 97            	ld	xl,a
2535  0083 a60a          	ld	a,#10
2536  0085 62            	div	x,a
2537  0086 9f            	ld	a,xl
2538  0087 97            	ld	xl,a
2539  0088 a602          	ld	a,#2
2540  008a 95            	ld	xh,a
2541  008b cd0000        	call	_lcd_disp_n
2545  008e 7b01          	ld	a,(OFST+0,sp)
2546  0090 5f            	clrw	x
2547  0091 97            	ld	xl,a
2548  0092 a60a          	ld	a,#10
2549  0094 62            	div	x,a
2550  0095 5f            	clrw	x
2551  0096 97            	ld	xl,a
2552  0097 9f            	ld	a,xl
2553  0098 97            	ld	xl,a
2554  0099 a603          	ld	a,#3
2555  009b 95            	ld	xh,a
2556  009c cd0000        	call	_lcd_disp_n
2559  009f               L715:
2560                     ; 552 	if( key == 3 )		
2562  009f 7b02          	ld	a,(OFST+1,sp)
2563  00a1 a103          	cp	a,#3
2564  00a3 260d          	jrne	L535
2565                     ; 554 		STATUS_NEXT(next);	
2567  00a5 7b03          	ld	a,(OFST+2,sp)
2568  00a7 c7000e        	ld	__ds,a
2571  00aa 725f000f      	clr	__dsCount
2574  00ae 35ff0010      	mov	__dsPrev,#255
2576  00b2               L535:
2577                     ; 556 }
2578  00b2               L65:
2581  00b2 5b03          	addw	sp,#3
2582  00b4 81            	ret
2636                     ; 558 void	disp_status_po_type(uint8_t key, uint8_t next)
2636                     ; 559 {
2637                     .text:	section	.text,new
2638  0000               _disp_status_po_type:
2640  0000 89            	pushw	x
2641  0001 88            	push	a
2642       00000001      OFST:	set	1
2645                     ; 561 	if( _dsCount == 0 )
2647  0002 725d000f      	tnz	__dsCount
2648  0006 2605          	jrne	L755
2649                     ; 563 		disp_next();
2651  0008 cd0000        	call	_disp_next
2654  000b 2040          	jra	L165
2655  000d               L755:
2656                     ; 568 		i = uiInfoSet.poType;
2658  000d c6006e        	ld	a,_uiInfoSet+9
2659  0010 6b01          	ld	(OFST+0,sp),a
2660                     ; 569 		if( uiInfo.enc != 0 )
2662  0012 725d0000      	tnz	_uiInfo
2663  0016 2726          	jreq	L365
2664                     ; 571 			if( (uiInfo.enc & 0x40) == 0 )
2666  0018 c60000        	ld	a,_uiInfo
2667  001b a540          	bcp	a,#64
2668  001d 260e          	jrne	L565
2669                     ; 573 				if( i==0 )	i = 2;
2671  001f 0d01          	tnz	(OFST+0,sp)
2672  0021 2606          	jrne	L765
2675  0023 a602          	ld	a,#2
2676  0025 6b01          	ld	(OFST+0,sp),a
2678  0027 2010          	jra	L375
2679  0029               L765:
2680                     ; 575 					i--;
2682  0029 0a01          	dec	(OFST+0,sp)
2683  002b 200c          	jra	L375
2684  002d               L565:
2685                     ; 579 				if( i==2 )	i = 0;
2687  002d 7b01          	ld	a,(OFST+0,sp)
2688  002f a102          	cp	a,#2
2689  0031 2604          	jrne	L575
2692  0033 0f01          	clr	(OFST+0,sp)
2694  0035 2002          	jra	L375
2695  0037               L575:
2696                     ; 581 					i++;
2698  0037 0c01          	inc	(OFST+0,sp)
2699  0039               L375:
2700                     ; 583 			uiInfoSet.poType = i;
2702  0039 7b01          	ld	a,(OFST+0,sp)
2703  003b c7006e        	ld	_uiInfoSet+9,a
2704  003e               L365:
2705                     ; 585 		if( _dsPrev != i )
2707  003e c60010        	ld	a,__dsPrev
2708  0041 1101          	cp	a,(OFST+0,sp)
2709  0043 2708          	jreq	L165
2710                     ; 587 			_dsPrev = i;
2712  0045 7b01          	ld	a,(OFST+0,sp)
2713  0047 c70010        	ld	__dsPrev,a
2714                     ; 588 			clear_npos2();
2716  004a cd0000        	call	_clear_npos2
2718  004d               L165:
2719                     ; 595 	if( key == 3 )		
2721  004d 7b02          	ld	a,(OFST+1,sp)
2722  004f a103          	cp	a,#3
2723  0051 260d          	jrne	L306
2724                     ; 597 		STATUS_NEXT(next);	
2726  0053 7b03          	ld	a,(OFST+2,sp)
2727  0055 c7000e        	ld	__ds,a
2730  0058 725f000f      	clr	__dsCount
2733  005c 35ff0010      	mov	__dsPrev,#255
2735  0060               L306:
2736                     ; 599 }
2739  0060 5b03          	addw	sp,#3
2740  0062 81            	ret
2743                     	switch	.const
2744  0018               ___lpm:
2745  0018 00            	dc.b	0
2746  0019 08            	dc.b	8
2747  001a 0a            	dc.b	10
2748  001b 0f            	dc.b	15
2749  001c 14            	dc.b	20
2750  001d 19            	dc.b	25
2751  001e 1e            	dc.b	30
2752  001f 63            	dc.b	99
2806                     ; 606 void	disp_status_lpm(uint8_t key, uint8_t next)
2806                     ; 607 {
2807                     .text:	section	.text,new
2808  0000               _disp_status_lpm:
2810  0000 89            	pushw	x
2811  0001 88            	push	a
2812       00000001      OFST:	set	1
2815                     ; 610 	if( uiInfoSet.cntlMode == 1 )
2817  0002 c60065        	ld	a,_uiInfoSet
2818  0005 a101          	cp	a,#1
2819  0007 2610          	jrne	L526
2820                     ; 612 		STATUS_NEXT(next);
2822  0009 9f            	ld	a,xl
2823  000a c7000e        	ld	__ds,a
2826  000d 725f000f      	clr	__dsCount
2829  0011 35ff0010      	mov	__dsPrev,#255
2830                     ; 613 		return;
2833  0015 acc000c0      	jpf	L07
2834  0019               L526:
2835                     ; 615 	if( _dsCount == 0 )
2837  0019 725d000f      	tnz	__dsCount
2838  001d 260a          	jrne	L726
2839                     ; 617 		disp_next();
2841  001f cd0000        	call	_disp_next
2843                     ; 618 		lcd_disp_setup_lpm();
2845  0022 cd0000        	call	_lcd_disp_setup_lpm
2848  0025 acad00ad      	jpf	L136
2849  0029               L726:
2850                     ; 622 		i = uiInfoSet.controlMode==1 ? uiInfoSet.lpmType_sub : uiInfoSet.lpmType;
2852  0029 c6006b        	ld	a,_uiInfoSet+6
2853  002c a101          	cp	a,#1
2854  002e 2605          	jrne	L46
2855  0030 c60073        	ld	a,_uiInfoSet+14
2856  0033 2003          	jra	L66
2857  0035               L46:
2858  0035 c60072        	ld	a,_uiInfoSet+13
2859  0038               L66:
2860  0038 6b01          	ld	(OFST+0,sp),a
2861                     ; 624 		if( uiInfo.enc != 0 )
2863  003a 725d0000      	tnz	_uiInfo
2864  003e 2734          	jreq	L336
2865                     ; 626 			if( (uiInfo.enc & 0x40) == 0 )
2867  0040 c60000        	ld	a,_uiInfo
2868  0043 a540          	bcp	a,#64
2869  0045 260e          	jrne	L536
2870                     ; 628 				if( i==0 )	i = 7;
2872  0047 0d01          	tnz	(OFST+0,sp)
2873  0049 2606          	jrne	L736
2876  004b a607          	ld	a,#7
2877  004d 6b01          	ld	(OFST+0,sp),a
2879  004f 2010          	jra	L346
2880  0051               L736:
2881                     ; 630 					i--;
2883  0051 0a01          	dec	(OFST+0,sp)
2884  0053 200c          	jra	L346
2885  0055               L536:
2886                     ; 634 				if( i==7 )	i = 0;
2888  0055 7b01          	ld	a,(OFST+0,sp)
2889  0057 a107          	cp	a,#7
2890  0059 2604          	jrne	L546
2893  005b 0f01          	clr	(OFST+0,sp)
2895  005d 2002          	jra	L346
2896  005f               L546:
2897                     ; 636 					i++;
2899  005f 0c01          	inc	(OFST+0,sp)
2900  0061               L346:
2901                     ; 638 			if( uiInfoSet.controlMode==1 )
2903  0061 c6006b        	ld	a,_uiInfoSet+6
2904  0064 a101          	cp	a,#1
2905  0066 2607          	jrne	L156
2906                     ; 639 				uiInfoSet.lpmType_sub = i;
2908  0068 7b01          	ld	a,(OFST+0,sp)
2909  006a c70073        	ld	_uiInfoSet+14,a
2911  006d 2005          	jra	L336
2912  006f               L156:
2913                     ; 641 				uiInfoSet.lpmType = i;
2915  006f 7b01          	ld	a,(OFST+0,sp)
2916  0071 c70072        	ld	_uiInfoSet+13,a
2917  0074               L336:
2918                     ; 643 		if( _dsPrev != i )
2920  0074 c60010        	ld	a,__dsPrev
2921  0077 1101          	cp	a,(OFST+0,sp)
2922  0079 2732          	jreq	L136
2923                     ; 645 			_dsPrev = i;
2925  007b 7b01          	ld	a,(OFST+0,sp)
2926  007d c70010        	ld	__dsPrev,a
2927                     ; 646 			clear_npos2();
2929  0080 cd0000        	call	_clear_npos2
2931                     ; 647 			UI_DISP_2Digit(__lpm[i]);
2933  0083 7b01          	ld	a,(OFST+0,sp)
2934  0085 5f            	clrw	x
2935  0086 97            	ld	xl,a
2936  0087 d60018        	ld	a,(___lpm,x)
2937  008a 5f            	clrw	x
2938  008b 97            	ld	xl,a
2939  008c a60a          	ld	a,#10
2940  008e 62            	div	x,a
2941  008f 9f            	ld	a,xl
2942  0090 97            	ld	xl,a
2943  0091 a602          	ld	a,#2
2944  0093 95            	ld	xh,a
2945  0094 cd0000        	call	_lcd_disp_n
2949  0097 7b01          	ld	a,(OFST+0,sp)
2950  0099 5f            	clrw	x
2951  009a 97            	ld	xl,a
2952  009b d60018        	ld	a,(___lpm,x)
2953  009e 5f            	clrw	x
2954  009f 97            	ld	xl,a
2955  00a0 a60a          	ld	a,#10
2956  00a2 62            	div	x,a
2957  00a3 5f            	clrw	x
2958  00a4 97            	ld	xl,a
2959  00a5 9f            	ld	a,xl
2960  00a6 97            	ld	xl,a
2961  00a7 a603          	ld	a,#3
2962  00a9 95            	ld	xh,a
2963  00aa cd0000        	call	_lcd_disp_n
2966  00ad               L136:
2967                     ; 650 	if( key == 3 )		
2969  00ad 7b02          	ld	a,(OFST+1,sp)
2970  00af a103          	cp	a,#3
2971  00b1 260d          	jrne	L756
2972                     ; 652 		STATUS_NEXT(next);	
2974  00b3 7b03          	ld	a,(OFST+2,sp)
2975  00b5 c7000e        	ld	__ds,a
2978  00b8 725f000f      	clr	__dsCount
2981  00bc 35ff0010      	mov	__dsPrev,#255
2983  00c0               L756:
2984                     ; 654 }
2985  00c0               L07:
2988  00c0 5b03          	addw	sp,#3
2989  00c2 81            	ret
3044                     ; 656 void	disp_status_temp_offset(uint8_t key, uint8_t next)
3044                     ; 657 {
3045                     .text:	section	.text,new
3046  0000               _disp_status_temp_offset:
3048  0000 89            	pushw	x
3049  0001 88            	push	a
3050       00000001      OFST:	set	1
3053                     ; 659 	if( uiInfoSet.opMode == 0 )
3055  0002 725d0069      	tnz	_uiInfoSet+4
3056  0006 2610          	jrne	L107
3057                     ; 661 		STATUS_NEXT(next);
3059  0008 9f            	ld	a,xl
3060  0009 c7000e        	ld	__ds,a
3063  000c 725f000f      	clr	__dsCount
3066  0010 35ff0010      	mov	__dsPrev,#255
3067                     ; 662 		return;
3070  0014 acb200b2      	jpf	L47
3071  0018               L107:
3072                     ; 664 	if( _dsCount == 0 )
3074  0018 725d000f      	tnz	__dsCount
3075  001c 2608          	jrne	L307
3076                     ; 666 		disp_next();
3078  001e cd0000        	call	_disp_next
3080                     ; 667 		lcd_disp_setup_temp_offset();
3082  0021 cd0000        	call	_lcd_disp_setup_temp_offset
3085  0024 2079          	jra	L507
3086  0026               L307:
3087                     ; 671 		i = uiInfoSet.tempOffset;
3089  0026 c60071        	ld	a,_uiInfoSet+12
3090  0029 6b01          	ld	(OFST+0,sp),a
3091                     ; 672 		if( uiInfo.enc != 0 )
3093  002b 725d0000      	tnz	_uiInfo
3094  002f 2726          	jreq	L707
3095                     ; 674 			if( (uiInfo.enc & 0x40) == 0 )	i--;
3097  0031 c60000        	ld	a,_uiInfo
3098  0034 a540          	bcp	a,#64
3099  0036 2604          	jrne	L117
3102  0038 0a01          	dec	(OFST+0,sp)
3104  003a 2002          	jra	L317
3105  003c               L117:
3106                     ; 676 				i++;
3108  003c 0c01          	inc	(OFST+0,sp)
3109  003e               L317:
3110                     ; 677 			if( i < 60 )	i = 100;
3112  003e 7b01          	ld	a,(OFST+0,sp)
3113  0040 a13c          	cp	a,#60
3114  0042 2404          	jruge	L517
3117  0044 a664          	ld	a,#100
3118  0046 6b01          	ld	(OFST+0,sp),a
3119  0048               L517:
3120                     ; 678 			if( i > 100 )	i = 60;
3122  0048 7b01          	ld	a,(OFST+0,sp)
3123  004a a165          	cp	a,#101
3124  004c 2504          	jrult	L717
3127  004e a63c          	ld	a,#60
3128  0050 6b01          	ld	(OFST+0,sp),a
3129  0052               L717:
3130                     ; 679 			uiInfoSet.tempOffset = i;
3132  0052 7b01          	ld	a,(OFST+0,sp)
3133  0054 c70071        	ld	_uiInfoSet+12,a
3134  0057               L707:
3135                     ; 681 		if( _dsPrev != i )
3137  0057 c60010        	ld	a,__dsPrev
3138  005a 1101          	cp	a,(OFST+0,sp)
3139  005c 2741          	jreq	L507
3140                     ; 683 			_dsPrev = i;
3142  005e 7b01          	ld	a,(OFST+0,sp)
3143  0060 c70010        	ld	__dsPrev,a
3144                     ; 684 			UI_DISP_3Digit(i);
3146  0063 7b01          	ld	a,(OFST+0,sp)
3147  0065 5f            	clrw	x
3148  0066 97            	ld	xl,a
3149  0067 a664          	ld	a,#100
3150  0069 62            	div	x,a
3151  006a 9f            	ld	a,xl
3152  006b 97            	ld	xl,a
3153  006c a601          	ld	a,#1
3154  006e 95            	ld	xh,a
3155  006f cd0000        	call	_lcd_disp_n
3159  0072 7b01          	ld	a,(OFST+0,sp)
3160  0074 5f            	clrw	x
3161  0075 97            	ld	xl,a
3162  0076 a664          	ld	a,#100
3163  0078 62            	div	x,a
3164  0079 5f            	clrw	x
3165  007a 97            	ld	xl,a
3166  007b 01            	rrwa	x,a
3167  007c 6b01          	ld	(OFST+0,sp),a
3168  007e 02            	rlwa	x,a
3171  007f 7b01          	ld	a,(OFST+0,sp)
3172  0081 5f            	clrw	x
3173  0082 97            	ld	xl,a
3174  0083 a60a          	ld	a,#10
3175  0085 62            	div	x,a
3176  0086 9f            	ld	a,xl
3177  0087 97            	ld	xl,a
3178  0088 a602          	ld	a,#2
3179  008a 95            	ld	xh,a
3180  008b cd0000        	call	_lcd_disp_n
3184  008e 7b01          	ld	a,(OFST+0,sp)
3185  0090 5f            	clrw	x
3186  0091 97            	ld	xl,a
3187  0092 a60a          	ld	a,#10
3188  0094 62            	div	x,a
3189  0095 5f            	clrw	x
3190  0096 97            	ld	xl,a
3191  0097 9f            	ld	a,xl
3192  0098 97            	ld	xl,a
3193  0099 a603          	ld	a,#3
3194  009b 95            	ld	xh,a
3195  009c cd0000        	call	_lcd_disp_n
3198  009f               L507:
3199                     ; 687 	if( key == 3 )		
3201  009f 7b02          	ld	a,(OFST+1,sp)
3202  00a1 a103          	cp	a,#3
3203  00a3 260d          	jrne	L327
3204                     ; 689 		STATUS_NEXT(next);	
3206  00a5 7b03          	ld	a,(OFST+2,sp)
3207  00a7 c7000e        	ld	__ds,a
3210  00aa 725f000f      	clr	__dsCount
3213  00ae 35ff0010      	mov	__dsPrev,#255
3215  00b2               L327:
3216                     ; 691 }
3217  00b2               L47:
3220  00b2 5b03          	addw	sp,#3
3221  00b4 81            	ret
3224                     	switch	.data
3225  0011               __ui_:
3226  0011 00            	dc.b	0
3306                     ; 699 void	disp_status_valveinfo_sub(uint8_t key, uint8_t next, uint8_t prev)
3306                     ; 700 {
3307                     .text:	section	.text,new
3308  0000               _disp_status_valveinfo_sub:
3310  0000 89            	pushw	x
3311  0001 520c          	subw	sp,#12
3312       0000000c      OFST:	set	12
3315                     ; 703 	if( _dsCount == 0 )
3317  0003 725d000f      	tnz	__dsCount
3318  0007 2651          	jrne	L557
3319                     ; 705 		disp_next();
3321  0009 cd0000        	call	_disp_next
3323                     ; 706 		lcd_disp_n(0, UI_RIDs+1);
3325  000c c60098        	ld	a,_uiInfoSet+51
3326  000f 4c            	inc	a
3327  0010 97            	ld	xl,a
3328  0011 4f            	clr	a
3329  0012 95            	ld	xh,a
3330  0013 cd0000        	call	_lcd_disp_n
3332                     ; 707 		lcd_blink_npos(UI_RIDs+1);
3334  0016 c60098        	ld	a,_uiInfoSet+51
3335  0019 4c            	inc	a
3336  001a cd0000        	call	_lcd_blink_npos
3338                     ; 708 		_ui_ = uiInfoSet.valve_sub_rc[UI_RIDs];// + uiInfoSet.cnt;
3340  001d c60098        	ld	a,_uiInfoSet+51
3341  0020 5f            	clrw	x
3342  0021 97            	ld	xl,a
3343  0022 d6008c        	ld	a,(_uiInfoSet+39,x)
3344  0025 c70011        	ld	__ui_,a
3345                     ; 709 		lcd_disp_rid(_ui_, 1, 0);
3347  0028 4b00          	push	#0
3348  002a ae0001        	ldw	x,#1
3349  002d c60011        	ld	a,__ui_
3350  0030 95            	ld	xh,a
3351  0031 cd0000        	call	_lcd_disp_rid
3353  0034 84            	pop	a
3354                     ; 710 		for( i=0; i<8; i++ )
3356  0035 0f0c          	clr	(OFST+0,sp)
3357  0037               L757:
3358                     ; 712 			if( i >= uiInfoSet.valve_sub )
3360  0037 7b0c          	ld	a,(OFST+0,sp)
3361  0039 c1006d        	cp	a,_uiInfoSet+8
3362  003c 2510          	jrult	L567
3363                     ; 714 				uiInfoSet.valve_sub_len[i] = 0;
3365  003e 7b0c          	ld	a,(OFST+0,sp)
3366  0040 5f            	clrw	x
3367  0041 97            	ld	xl,a
3368  0042 724f0084      	clr	(_uiInfoSet+31,x)
3369                     ; 715 				uiInfoSet.valve_sub_rc[i] = 0;
3371  0046 7b0c          	ld	a,(OFST+0,sp)
3372  0048 5f            	clrw	x
3373  0049 97            	ld	xl,a
3374  004a 724f008c      	clr	(_uiInfoSet+39,x)
3375  004e               L567:
3376                     ; 710 		for( i=0; i<8; i++ )
3378  004e 0c0c          	inc	(OFST+0,sp)
3381  0050 7b0c          	ld	a,(OFST+0,sp)
3382  0052 a108          	cp	a,#8
3383  0054 25e1          	jrult	L757
3385  0056 acdd00dd      	jpf	L767
3386  005a               L557:
3387                     ; 721 		i = uiInfoSet.valve_sub_len[UI_RIDs];
3389  005a c60098        	ld	a,_uiInfoSet+51
3390  005d 5f            	clrw	x
3391  005e 97            	ld	xl,a
3392  005f d60084        	ld	a,(_uiInfoSet+31,x)
3393  0062 6b0c          	ld	(OFST+0,sp),a
3394                     ; 722 		if( uiInfo.enc != 0 )
3396  0064 725d0000      	tnz	_uiInfo
3397  0068 272b          	jreq	L177
3398                     ; 724 			if( (uiInfo.enc & 0x40) == 0 )	i--;
3400  006a c60000        	ld	a,_uiInfo
3401  006d a540          	bcp	a,#64
3402  006f 2604          	jrne	L377
3405  0071 0a0c          	dec	(OFST+0,sp)
3407  0073 2002          	jra	L577
3408  0075               L377:
3409                     ; 726 				i++;
3411  0075 0c0c          	inc	(OFST+0,sp)
3412  0077               L577:
3413                     ; 727 			if( i > 150 )	i = 35;
3415  0077 7b0c          	ld	a,(OFST+0,sp)
3416  0079 a197          	cp	a,#151
3417  007b 2504          	jrult	L777
3420  007d a623          	ld	a,#35
3421  007f 6b0c          	ld	(OFST+0,sp),a
3422  0081               L777:
3423                     ; 728 			if( i < 35 )	i = 150;
3425  0081 7b0c          	ld	a,(OFST+0,sp)
3426  0083 a123          	cp	a,#35
3427  0085 2404          	jruge	L1001
3430  0087 a696          	ld	a,#150
3431  0089 6b0c          	ld	(OFST+0,sp),a
3432  008b               L1001:
3433                     ; 729 			uiInfoSet.valve_sub_len[UI_RIDs] = i;
3435  008b c60098        	ld	a,_uiInfoSet+51
3436  008e 5f            	clrw	x
3437  008f 97            	ld	xl,a
3438  0090 7b0c          	ld	a,(OFST+0,sp)
3439  0092 d70084        	ld	(_uiInfoSet+31,x),a
3440  0095               L177:
3441                     ; 731 		if( _dsPrev != i )
3443  0095 c60010        	ld	a,__dsPrev
3444  0098 110c          	cp	a,(OFST+0,sp)
3445  009a 2741          	jreq	L767
3446                     ; 733 			_dsPrev = i;
3448  009c 7b0c          	ld	a,(OFST+0,sp)
3449  009e c70010        	ld	__dsPrev,a
3450                     ; 734 			UI_DISP_3Digit(i);
3452  00a1 7b0c          	ld	a,(OFST+0,sp)
3453  00a3 5f            	clrw	x
3454  00a4 97            	ld	xl,a
3455  00a5 a664          	ld	a,#100
3456  00a7 62            	div	x,a
3457  00a8 9f            	ld	a,xl
3458  00a9 97            	ld	xl,a
3459  00aa a601          	ld	a,#1
3460  00ac 95            	ld	xh,a
3461  00ad cd0000        	call	_lcd_disp_n
3465  00b0 7b0c          	ld	a,(OFST+0,sp)
3466  00b2 5f            	clrw	x
3467  00b3 97            	ld	xl,a
3468  00b4 a664          	ld	a,#100
3469  00b6 62            	div	x,a
3470  00b7 5f            	clrw	x
3471  00b8 97            	ld	xl,a
3472  00b9 01            	rrwa	x,a
3473  00ba 6b0c          	ld	(OFST+0,sp),a
3474  00bc 02            	rlwa	x,a
3477  00bd 7b0c          	ld	a,(OFST+0,sp)
3478  00bf 5f            	clrw	x
3479  00c0 97            	ld	xl,a
3480  00c1 a60a          	ld	a,#10
3481  00c3 62            	div	x,a
3482  00c4 9f            	ld	a,xl
3483  00c5 97            	ld	xl,a
3484  00c6 a602          	ld	a,#2
3485  00c8 95            	ld	xh,a
3486  00c9 cd0000        	call	_lcd_disp_n
3490  00cc 7b0c          	ld	a,(OFST+0,sp)
3491  00ce 5f            	clrw	x
3492  00cf 97            	ld	xl,a
3493  00d0 a60a          	ld	a,#10
3494  00d2 62            	div	x,a
3495  00d3 5f            	clrw	x
3496  00d4 97            	ld	xl,a
3497  00d5 9f            	ld	a,xl
3498  00d6 97            	ld	xl,a
3499  00d7 a603          	ld	a,#3
3500  00d9 95            	ld	xh,a
3501  00da cd0000        	call	_lcd_disp_n
3504  00dd               L767:
3505                     ; 737 	if( key == 3 )		
3507  00dd 7b0d          	ld	a,(OFST+1,sp)
3508  00df a103          	cp	a,#3
3509  00e1 2675          	jrne	L5001
3510                     ; 739 		lcd_blink_npos_clear();
3512  00e3 cd0000        	call	_lcd_blink_npos_clear
3514                     ; 740 		STATUS_NEXT(next);	
3516  00e6 7b0e          	ld	a,(OFST+2,sp)
3517  00e8 c7000e        	ld	__ds,a
3520  00eb 725f000f      	clr	__dsCount
3523  00ef 35ff0010      	mov	__dsPrev,#255
3524                     ; 741 		for( i=0; i<8; i++ )
3527  00f3 0f0c          	clr	(OFST+0,sp)
3528  00f5               L7001:
3529                     ; 742 			b[i] = 0;
3531  00f5 96            	ldw	x,sp
3532  00f6 1c0004        	addw	x,#OFST-8
3533  00f9 9f            	ld	a,xl
3534  00fa 5e            	swapw	x
3535  00fb 1b0c          	add	a,(OFST+0,sp)
3536  00fd 2401          	jrnc	L001
3537  00ff 5c            	incw	x
3538  0100               L001:
3539  0100 02            	rlwa	x,a
3540  0101 7f            	clr	(x)
3541                     ; 741 		for( i=0; i<8; i++ )
3543  0102 0c0c          	inc	(OFST+0,sp)
3546  0104 7b0c          	ld	a,(OFST+0,sp)
3547  0106 a108          	cp	a,#8
3548  0108 25eb          	jrult	L7001
3549                     ; 743 		for( i=0; i<8; i++ )
3551  010a 0f0c          	clr	(OFST+0,sp)
3552  010c               L5101:
3553                     ; 745 			if( uiInfoSet.valve_sub_rc[i] != 0 )
3555  010c 7b0c          	ld	a,(OFST+0,sp)
3556  010e 5f            	clrw	x
3557  010f 97            	ld	xl,a
3558  0110 724d008c      	tnz	(_uiInfoSet+39,x)
3559  0114 2716          	jreq	L3201
3560                     ; 746 				b[uiInfoSet.valve_sub_rc[i]-1] = 1;
3562  0116 96            	ldw	x,sp
3563  0117 1c0004        	addw	x,#OFST-8
3564  011a 1f01          	ldw	(OFST-11,sp),x
3565  011c 7b0c          	ld	a,(OFST+0,sp)
3566  011e 5f            	clrw	x
3567  011f 97            	ld	xl,a
3568  0120 d6008c        	ld	a,(_uiInfoSet+39,x)
3569  0123 5f            	clrw	x
3570  0124 97            	ld	xl,a
3571  0125 5a            	decw	x
3572  0126 72fb01        	addw	x,(OFST-11,sp)
3573  0129 a601          	ld	a,#1
3574  012b f7            	ld	(x),a
3575  012c               L3201:
3576                     ; 743 		for( i=0; i<8; i++ )
3578  012c 0c0c          	inc	(OFST+0,sp)
3581  012e 7b0c          	ld	a,(OFST+0,sp)
3582  0130 a108          	cp	a,#8
3583  0132 25d8          	jrult	L5101
3584                     ; 748 		j = 0;
3586  0134 0f03          	clr	(OFST-9,sp)
3587                     ; 749 		for( i=0; i<8; i++ )
3589  0136 0f0c          	clr	(OFST+0,sp)
3590  0138               L5201:
3591                     ; 751 			if( b[i] != 0 )
3593  0138 96            	ldw	x,sp
3594  0139 1c0004        	addw	x,#OFST-8
3595  013c 9f            	ld	a,xl
3596  013d 5e            	swapw	x
3597  013e 1b0c          	add	a,(OFST+0,sp)
3598  0140 2401          	jrnc	L201
3599  0142 5c            	incw	x
3600  0143               L201:
3601  0143 02            	rlwa	x,a
3602  0144 7d            	tnz	(x)
3603  0145 2702          	jreq	L3301
3604                     ; 752 				j++;
3606  0147 0c03          	inc	(OFST-9,sp)
3607  0149               L3301:
3608                     ; 749 		for( i=0; i<8; i++ )
3610  0149 0c0c          	inc	(OFST+0,sp)
3613  014b 7b0c          	ld	a,(OFST+0,sp)
3614  014d a108          	cp	a,#8
3615  014f 25e7          	jrult	L5201
3616                     ; 754 		uiInfoSet.cnt_sub = j;
3618  0151 7b03          	ld	a,(OFST-9,sp)
3619  0153 c70068        	ld	_uiInfoSet+3,a
3621  0156 205a          	jra	L5301
3622  0158               L5001:
3623                     ; 756 	else if( key == 4 )
3625  0158 7b0d          	ld	a,(OFST+1,sp)
3626  015a a104          	cp	a,#4
3627  015c 262e          	jrne	L7301
3628                     ; 758 		uiInfoSet.valve_sub_rc[UI_RIDs]++;
3630  015e c60098        	ld	a,_uiInfoSet+51
3631  0161 5f            	clrw	x
3632  0162 97            	ld	xl,a
3633  0163 724c008c      	inc	(_uiInfoSet+39,x)
3634                     ; 759 		if( uiInfoSet.valve_sub_rc[UI_RIDs] > 8 )
3636  0167 c60098        	ld	a,_uiInfoSet+51
3637  016a 5f            	clrw	x
3638  016b 97            	ld	xl,a
3639  016c d6008c        	ld	a,(_uiInfoSet+39,x)
3640  016f a109          	cp	a,#9
3641  0171 250a          	jrult	L1401
3642                     ; 760 			uiInfoSet.valve_sub_rc[UI_RIDs] = 1;
3644  0173 c60098        	ld	a,_uiInfoSet+51
3645  0176 5f            	clrw	x
3646  0177 97            	ld	xl,a
3647  0178 a601          	ld	a,#1
3648  017a d7008c        	ld	(_uiInfoSet+39,x),a
3649  017d               L1401:
3650                     ; 767 		STATUS_NEXT(prev);
3652  017d 7b11          	ld	a,(OFST+5,sp)
3653  017f c7000e        	ld	__ds,a
3656  0182 725f000f      	clr	__dsCount
3659  0186 35ff0010      	mov	__dsPrev,#255
3662  018a 2026          	jra	L5301
3663  018c               L7301:
3664                     ; 769 	else if( key == 1 )
3666  018c 7b0d          	ld	a,(OFST+1,sp)
3667  018e a101          	cp	a,#1
3668  0190 2620          	jrne	L5301
3669                     ; 771 		lcd_blink_npos_clear();
3671  0192 cd0000        	call	_lcd_blink_npos_clear
3673                     ; 772 		UI_RIDs++;
3675  0195 725c0098      	inc	_uiInfoSet+51
3676                     ; 773 		if( UI_RIDs == uiInfoSet.valve_sub )
3678  0199 c60098        	ld	a,_uiInfoSet+51
3679  019c c1006d        	cp	a,_uiInfoSet+8
3680  019f 2604          	jrne	L7401
3681                     ; 774 			UI_RIDs = 0;
3683  01a1 725f0098      	clr	_uiInfoSet+51
3684  01a5               L7401:
3685                     ; 775 		STATUS_NEXT(prev);
3687  01a5 7b11          	ld	a,(OFST+5,sp)
3688  01a7 c7000e        	ld	__ds,a
3691  01aa 725f000f      	clr	__dsCount
3694  01ae 35ff0010      	mov	__dsPrev,#255
3696  01b2               L5301:
3697                     ; 777 }
3700  01b2 5b0e          	addw	sp,#14
3701  01b4 81            	ret
3784                     ; 779 void	disp_status_valveinfo(uint8_t key, uint8_t next, uint8_t prev)
3784                     ; 780 {
3785                     .text:	section	.text,new
3786  0000               _disp_status_valveinfo:
3788  0000 89            	pushw	x
3789  0001 520c          	subw	sp,#12
3790       0000000c      OFST:	set	12
3793                     ; 783 	if( uiInfoSet.controlMode==1 )
3795  0003 c6006b        	ld	a,_uiInfoSet+6
3796  0006 a101          	cp	a,#1
3797  0008 2610          	jrne	L1011
3798                     ; 785 		disp_status_valveinfo_sub(key, next, prev);
3800  000a 7b11          	ld	a,(OFST+5,sp)
3801  000c 88            	push	a
3802  000d 9f            	ld	a,xl
3803  000e 97            	ld	xl,a
3804  000f 7b0e          	ld	a,(OFST+2,sp)
3805  0011 95            	ld	xh,a
3806  0012 cd0000        	call	_disp_status_valveinfo_sub
3808  0015 84            	pop	a
3809                     ; 786 		return;
3811  0016 acd701d7      	jpf	L211
3812  001a               L1011:
3813                     ; 788 	if( _dsCount == 0 )
3815  001a 725d000f      	tnz	__dsCount
3816  001e 2651          	jrne	L3011
3817                     ; 790 		disp_next();
3819  0020 cd0000        	call	_disp_next
3821                     ; 791 		lcd_disp_n(0, UI_RID+1);
3823  0023 c60096        	ld	a,_uiInfoSet+49
3824  0026 4c            	inc	a
3825  0027 97            	ld	xl,a
3826  0028 4f            	clr	a
3827  0029 95            	ld	xh,a
3828  002a cd0000        	call	_lcd_disp_n
3830                     ; 792 		lcd_blink_npos(UI_RID+1);
3832  002d c60096        	ld	a,_uiInfoSet+49
3833  0030 4c            	inc	a
3834  0031 cd0000        	call	_lcd_blink_npos
3836                     ; 793 		_ui_ = uiInfoSet.valve_rc[UI_RID];
3838  0034 c60096        	ld	a,_uiInfoSet+49
3839  0037 5f            	clrw	x
3840  0038 97            	ld	xl,a
3841  0039 d6007c        	ld	a,(_uiInfoSet+23,x)
3842  003c c70011        	ld	__ui_,a
3843                     ; 794 		lcd_disp_rid(_ui_, 1, 0);
3845  003f 4b00          	push	#0
3846  0041 ae0001        	ldw	x,#1
3847  0044 c60011        	ld	a,__ui_
3848  0047 95            	ld	xh,a
3849  0048 cd0000        	call	_lcd_disp_rid
3851  004b 84            	pop	a
3852                     ; 795 		for( i=0; i<8; i++ )
3854  004c 0f0c          	clr	(OFST+0,sp)
3855  004e               L5011:
3856                     ; 797 			if( i >= uiInfoSet.valve )
3858  004e 7b0c          	ld	a,(OFST+0,sp)
3859  0050 c1006c        	cp	a,_uiInfoSet+7
3860  0053 2510          	jrult	L3111
3861                     ; 799 				uiInfoSet.valve_len[i] = 0;
3863  0055 7b0c          	ld	a,(OFST+0,sp)
3864  0057 5f            	clrw	x
3865  0058 97            	ld	xl,a
3866  0059 724f0074      	clr	(_uiInfoSet+15,x)
3867                     ; 800 				uiInfoSet.valve_rc[i] = 0;
3869  005d 7b0c          	ld	a,(OFST+0,sp)
3870  005f 5f            	clrw	x
3871  0060 97            	ld	xl,a
3872  0061 724f007c      	clr	(_uiInfoSet+23,x)
3873  0065               L3111:
3874                     ; 795 		for( i=0; i<8; i++ )
3876  0065 0c0c          	inc	(OFST+0,sp)
3879  0067 7b0c          	ld	a,(OFST+0,sp)
3880  0069 a108          	cp	a,#8
3881  006b 25e1          	jrult	L5011
3883  006d acf400f4      	jpf	L5111
3884  0071               L3011:
3885                     ; 807 		i = uiInfoSet.valve_len[UI_RID];
3887  0071 c60096        	ld	a,_uiInfoSet+49
3888  0074 5f            	clrw	x
3889  0075 97            	ld	xl,a
3890  0076 d60074        	ld	a,(_uiInfoSet+15,x)
3891  0079 6b0c          	ld	(OFST+0,sp),a
3892                     ; 808 		if( uiInfo.enc != 0 )
3894  007b 725d0000      	tnz	_uiInfo
3895  007f 272b          	jreq	L7111
3896                     ; 810 			if( (uiInfo.enc & 0x40) == 0 )	i--;
3898  0081 c60000        	ld	a,_uiInfo
3899  0084 a540          	bcp	a,#64
3900  0086 2604          	jrne	L1211
3903  0088 0a0c          	dec	(OFST+0,sp)
3905  008a 2002          	jra	L3211
3906  008c               L1211:
3907                     ; 812 				i++;
3909  008c 0c0c          	inc	(OFST+0,sp)
3910  008e               L3211:
3911                     ; 813 			if( i > 150 )	i = 35;
3913  008e 7b0c          	ld	a,(OFST+0,sp)
3914  0090 a197          	cp	a,#151
3915  0092 2504          	jrult	L5211
3918  0094 a623          	ld	a,#35
3919  0096 6b0c          	ld	(OFST+0,sp),a
3920  0098               L5211:
3921                     ; 814 			if( i < 35 )	i = 150;
3923  0098 7b0c          	ld	a,(OFST+0,sp)
3924  009a a123          	cp	a,#35
3925  009c 2404          	jruge	L7211
3928  009e a696          	ld	a,#150
3929  00a0 6b0c          	ld	(OFST+0,sp),a
3930  00a2               L7211:
3931                     ; 815 			uiInfoSet.valve_len[UI_RID] = i;
3933  00a2 c60096        	ld	a,_uiInfoSet+49
3934  00a5 5f            	clrw	x
3935  00a6 97            	ld	xl,a
3936  00a7 7b0c          	ld	a,(OFST+0,sp)
3937  00a9 d70074        	ld	(_uiInfoSet+15,x),a
3938  00ac               L7111:
3939                     ; 817 		if( _dsPrev != i )
3941  00ac c60010        	ld	a,__dsPrev
3942  00af 110c          	cp	a,(OFST+0,sp)
3943  00b1 2741          	jreq	L5111
3944                     ; 819 			_dsPrev = i;
3946  00b3 7b0c          	ld	a,(OFST+0,sp)
3947  00b5 c70010        	ld	__dsPrev,a
3948                     ; 820 			UI_DISP_3Digit(i);
3950  00b8 7b0c          	ld	a,(OFST+0,sp)
3951  00ba 5f            	clrw	x
3952  00bb 97            	ld	xl,a
3953  00bc a664          	ld	a,#100
3954  00be 62            	div	x,a
3955  00bf 9f            	ld	a,xl
3956  00c0 97            	ld	xl,a
3957  00c1 a601          	ld	a,#1
3958  00c3 95            	ld	xh,a
3959  00c4 cd0000        	call	_lcd_disp_n
3963  00c7 7b0c          	ld	a,(OFST+0,sp)
3964  00c9 5f            	clrw	x
3965  00ca 97            	ld	xl,a
3966  00cb a664          	ld	a,#100
3967  00cd 62            	div	x,a
3968  00ce 5f            	clrw	x
3969  00cf 97            	ld	xl,a
3970  00d0 01            	rrwa	x,a
3971  00d1 6b0c          	ld	(OFST+0,sp),a
3972  00d3 02            	rlwa	x,a
3975  00d4 7b0c          	ld	a,(OFST+0,sp)
3976  00d6 5f            	clrw	x
3977  00d7 97            	ld	xl,a
3978  00d8 a60a          	ld	a,#10
3979  00da 62            	div	x,a
3980  00db 9f            	ld	a,xl
3981  00dc 97            	ld	xl,a
3982  00dd a602          	ld	a,#2
3983  00df 95            	ld	xh,a
3984  00e0 cd0000        	call	_lcd_disp_n
3988  00e3 7b0c          	ld	a,(OFST+0,sp)
3989  00e5 5f            	clrw	x
3990  00e6 97            	ld	xl,a
3991  00e7 a60a          	ld	a,#10
3992  00e9 62            	div	x,a
3993  00ea 5f            	clrw	x
3994  00eb 97            	ld	xl,a
3995  00ec 9f            	ld	a,xl
3996  00ed 97            	ld	xl,a
3997  00ee a603          	ld	a,#3
3998  00f0 95            	ld	xh,a
3999  00f1 cd0000        	call	_lcd_disp_n
4002  00f4               L5111:
4003                     ; 823 	if( key == 3 )		
4005  00f4 7b0d          	ld	a,(OFST+1,sp)
4006  00f6 a103          	cp	a,#3
4007  00f8 2675          	jrne	L3311
4008                     ; 825 		lcd_blink_npos_clear();
4010  00fa cd0000        	call	_lcd_blink_npos_clear
4012                     ; 826 		STATUS_NEXT(next);	
4014  00fd 7b0e          	ld	a,(OFST+2,sp)
4015  00ff c7000e        	ld	__ds,a
4018  0102 725f000f      	clr	__dsCount
4021  0106 35ff0010      	mov	__dsPrev,#255
4022                     ; 827 		for( i=0; i<8; i++ )
4025  010a 0f0c          	clr	(OFST+0,sp)
4026  010c               L5311:
4027                     ; 828 			b[i] = 0;
4029  010c 96            	ldw	x,sp
4030  010d 1c0004        	addw	x,#OFST-8
4031  0110 9f            	ld	a,xl
4032  0111 5e            	swapw	x
4033  0112 1b0c          	add	a,(OFST+0,sp)
4034  0114 2401          	jrnc	L601
4035  0116 5c            	incw	x
4036  0117               L601:
4037  0117 02            	rlwa	x,a
4038  0118 7f            	clr	(x)
4039                     ; 827 		for( i=0; i<8; i++ )
4041  0119 0c0c          	inc	(OFST+0,sp)
4044  011b 7b0c          	ld	a,(OFST+0,sp)
4045  011d a108          	cp	a,#8
4046  011f 25eb          	jrult	L5311
4047                     ; 829 		for( i=0; i<8; i++ )
4049  0121 0f0c          	clr	(OFST+0,sp)
4050  0123               L3411:
4051                     ; 831 			if( uiInfoSet.valve_rc[i] != 0 )
4053  0123 7b0c          	ld	a,(OFST+0,sp)
4054  0125 5f            	clrw	x
4055  0126 97            	ld	xl,a
4056  0127 724d007c      	tnz	(_uiInfoSet+23,x)
4057  012b 2716          	jreq	L1511
4058                     ; 832 				b[uiInfoSet.valve_rc[i]-1] = 1;
4060  012d 96            	ldw	x,sp
4061  012e 1c0004        	addw	x,#OFST-8
4062  0131 1f01          	ldw	(OFST-11,sp),x
4063  0133 7b0c          	ld	a,(OFST+0,sp)
4064  0135 5f            	clrw	x
4065  0136 97            	ld	xl,a
4066  0137 d6007c        	ld	a,(_uiInfoSet+23,x)
4067  013a 5f            	clrw	x
4068  013b 97            	ld	xl,a
4069  013c 5a            	decw	x
4070  013d 72fb01        	addw	x,(OFST-11,sp)
4071  0140 a601          	ld	a,#1
4072  0142 f7            	ld	(x),a
4073  0143               L1511:
4074                     ; 829 		for( i=0; i<8; i++ )
4076  0143 0c0c          	inc	(OFST+0,sp)
4079  0145 7b0c          	ld	a,(OFST+0,sp)
4080  0147 a108          	cp	a,#8
4081  0149 25d8          	jrult	L3411
4082                     ; 834 		j = 0;
4084  014b 0f03          	clr	(OFST-9,sp)
4085                     ; 835 		for( i=0; i<8; i++ )
4087  014d 0f0c          	clr	(OFST+0,sp)
4088  014f               L3511:
4089                     ; 837 			if( b[i] != 0 )
4091  014f 96            	ldw	x,sp
4092  0150 1c0004        	addw	x,#OFST-8
4093  0153 9f            	ld	a,xl
4094  0154 5e            	swapw	x
4095  0155 1b0c          	add	a,(OFST+0,sp)
4096  0157 2401          	jrnc	L011
4097  0159 5c            	incw	x
4098  015a               L011:
4099  015a 02            	rlwa	x,a
4100  015b 7d            	tnz	(x)
4101  015c 2702          	jreq	L1611
4102                     ; 838 				j++;
4104  015e 0c03          	inc	(OFST-9,sp)
4105  0160               L1611:
4106                     ; 835 		for( i=0; i<8; i++ )
4108  0160 0c0c          	inc	(OFST+0,sp)
4111  0162 7b0c          	ld	a,(OFST+0,sp)
4112  0164 a108          	cp	a,#8
4113  0166 25e7          	jrult	L3511
4114                     ; 840 		uiInfoSet.cnt = j;
4116  0168 7b03          	ld	a,(OFST-9,sp)
4117  016a c70067        	ld	_uiInfoSet+2,a
4119  016d 2068          	jra	L3611
4120  016f               L3311:
4121                     ; 842 	else if( key == 4 )
4123  016f 7b0d          	ld	a,(OFST+1,sp)
4124  0171 a104          	cp	a,#4
4125  0173 263c          	jrne	L5611
4126                     ; 844 		uiInfoSet.valve_rc[UI_RID]++;
4128  0175 c60096        	ld	a,_uiInfoSet+49
4129  0178 5f            	clrw	x
4130  0179 97            	ld	xl,a
4131  017a 724c007c      	inc	(_uiInfoSet+23,x)
4132                     ; 845 		if( uiInfoSet.valve+1 == uiInfoSet.valve_rc[UI_RID] )
4134  017e c60096        	ld	a,_uiInfoSet+49
4135  0181 5f            	clrw	x
4136  0182 97            	ld	xl,a
4137  0183 d6007c        	ld	a,(_uiInfoSet+23,x)
4138  0186 5f            	clrw	x
4139  0187 97            	ld	xl,a
4140  0188 c6006c        	ld	a,_uiInfoSet+7
4141  018b 905f          	clrw	y
4142  018d 9097          	ld	yl,a
4143  018f 905c          	incw	y
4144  0191 bf00          	ldw	c_x,x
4145  0193 90b300        	cpw	y,c_x
4146  0196 260a          	jrne	L7611
4147                     ; 846 			uiInfoSet.valve_rc[UI_RID] = 1;
4149  0198 c60096        	ld	a,_uiInfoSet+49
4150  019b 5f            	clrw	x
4151  019c 97            	ld	xl,a
4152  019d a601          	ld	a,#1
4153  019f d7007c        	ld	(_uiInfoSet+23,x),a
4154  01a2               L7611:
4155                     ; 847 		STATUS_NEXT(prev);
4157  01a2 7b11          	ld	a,(OFST+5,sp)
4158  01a4 c7000e        	ld	__ds,a
4161  01a7 725f000f      	clr	__dsCount
4164  01ab 35ff0010      	mov	__dsPrev,#255
4167  01af 2026          	jra	L3611
4168  01b1               L5611:
4169                     ; 849 	else if( key == 1 )
4171  01b1 7b0d          	ld	a,(OFST+1,sp)
4172  01b3 a101          	cp	a,#1
4173  01b5 2620          	jrne	L3611
4174                     ; 851 		lcd_blink_npos_clear();
4176  01b7 cd0000        	call	_lcd_blink_npos_clear
4178                     ; 852 		UI_RID++;
4180  01ba 725c0096      	inc	_uiInfoSet+49
4181                     ; 853 		if( UI_RID == uiInfoSet.valve )
4183  01be c60096        	ld	a,_uiInfoSet+49
4184  01c1 c1006c        	cp	a,_uiInfoSet+7
4185  01c4 2604          	jrne	L5711
4186                     ; 854 			UI_RID = 0;
4188  01c6 725f0096      	clr	_uiInfoSet+49
4189  01ca               L5711:
4190                     ; 855 		STATUS_NEXT(prev);
4192  01ca 7b11          	ld	a,(OFST+5,sp)
4193  01cc c7000e        	ld	__ds,a
4196  01cf 725f000f      	clr	__dsCount
4199  01d3 35ff0010      	mov	__dsPrev,#255
4201  01d7               L3611:
4202                     ; 857 }
4203  01d7               L211:
4206  01d7 5b0e          	addw	sp,#14
4207  01d9 81            	ret
4261                     ; 859 void	disp_status_plc(uint8_t key, uint8_t next)
4261                     ; 860 {
4262                     .text:	section	.text,new
4263  0000               _disp_status_plc:
4265  0000 89            	pushw	x
4266  0001 88            	push	a
4267       00000001      OFST:	set	1
4270                     ; 862 	if( _dsCount == 0 )
4272  0002 725d000f      	tnz	__dsCount
4273  0006 2612          	jrne	L7711
4274                     ; 864 		disp_next();
4276  0008 cd0000        	call	_disp_next
4278                     ; 865 		lcd_disp_plc();
4280  000b cd0000        	call	_lcd_disp_plc
4282                     ; 866 		lcd_disp_n(3, uiInfoSet.plc);
4284  000e c6009a        	ld	a,_uiInfoSet+53
4285  0011 97            	ld	xl,a
4286  0012 a603          	ld	a,#3
4287  0014 95            	ld	xh,a
4288  0015 cd0000        	call	_lcd_disp_n
4291  0018 2046          	jra	L3221
4292  001a               L7711:
4293                     ; 870 EncEntry:
4293                     ; 871 		i = uiInfoSet.plc;
4295  001a c6009a        	ld	a,_uiInfoSet+53
4296  001d 6b01          	ld	(OFST+0,sp),a
4297                     ; 872 		if( uiInfo.enc != 0 )
4299  001f 725d0000      	tnz	_uiInfo
4300  0023 2726          	jreq	L5221
4301                     ; 874 			if( (uiInfo.enc & 0x40) == 0 )
4303  0025 c60000        	ld	a,_uiInfo
4304  0028 a540          	bcp	a,#64
4305  002a 260e          	jrne	L7221
4306                     ; 876 				if( i != 0 )
4308  002c 0d01          	tnz	(OFST+0,sp)
4309  002e 2704          	jreq	L1321
4310                     ; 877 					i--;
4312  0030 0a01          	dec	(OFST+0,sp)
4314  0032 2012          	jra	L5321
4315  0034               L1321:
4316                     ; 879 					i = 8;
4318  0034 a608          	ld	a,#8
4319  0036 6b01          	ld	(OFST+0,sp),a
4320  0038 200c          	jra	L5321
4321  003a               L7221:
4322                     ; 883 				if( i != 8 )
4324  003a 7b01          	ld	a,(OFST+0,sp)
4325  003c a108          	cp	a,#8
4326  003e 2704          	jreq	L7321
4327                     ; 884 					i++;
4329  0040 0c01          	inc	(OFST+0,sp)
4331  0042 2002          	jra	L5321
4332  0044               L7321:
4333                     ; 886 					i = 0;
4335  0044 0f01          	clr	(OFST+0,sp)
4336  0046               L5321:
4337                     ; 888 			uiInfoSet.plc = i;
4339  0046 7b01          	ld	a,(OFST+0,sp)
4340  0048 c7009a        	ld	_uiInfoSet+53,a
4341  004b               L5221:
4342                     ; 890 		if( _dsPrev != i )
4344  004b c60010        	ld	a,__dsPrev
4345  004e 1101          	cp	a,(OFST+0,sp)
4346  0050 270e          	jreq	L3221
4347                     ; 892 			_dsPrev = i;
4349  0052 7b01          	ld	a,(OFST+0,sp)
4350  0054 c70010        	ld	__dsPrev,a
4351                     ; 893 			lcd_disp_n(3, i);
4353  0057 7b01          	ld	a,(OFST+0,sp)
4354  0059 97            	ld	xl,a
4355  005a a603          	ld	a,#3
4356  005c 95            	ld	xh,a
4357  005d cd0000        	call	_lcd_disp_n
4359  0060               L3221:
4360                     ; 896 	if( key == 4 )		
4362  0060 7b02          	ld	a,(OFST+1,sp)
4363  0062 a104          	cp	a,#4
4364  0064 260d          	jrne	L5421
4365                     ; 898 		STATUS_NEXT(next);	
4367  0066 7b03          	ld	a,(OFST+2,sp)
4368  0068 c7000e        	ld	__ds,a
4371  006b 725f000f      	clr	__dsCount
4374  006f 35ff0010      	mov	__dsPrev,#255
4376  0073               L5421:
4377                     ; 900 }
4380  0073 5b03          	addw	sp,#3
4381  0075 81            	ret
4384                     	switch	.data
4385  0012               ___func_rc_timerout:
4386  0012 00            	dc.b	0
4387  0013               ___func_rc_timerout1:
4388  0013 00            	dc.b	0
4389  0014               ___func_rc_timerout2:
4390  0014 00            	dc.b	0
4448                     ; 909 uint8_t	disp_status_run(uint8_t key, uint8_t next, uint8_t prev)
4448                     ; 910 {
4449                     .text:	section	.text,new
4450  0000               _disp_status_run:
4452  0000 89            	pushw	x
4453       00000000      OFST:	set	0
4456                     ; 912 	if( _dsCount == 0 )
4458  0001 725d000f      	tnz	__dsCount
4459  0005 2606          	jrne	L7621
4460                     ; 914 		disp_next();
4462  0007 cd0000        	call	_disp_next
4464                     ; 915 		lcd_disp_setup_run();
4466  000a cd0000        	call	_lcd_disp_setup_run
4468  000d               L7621:
4469                     ; 917 	if( key == 3 )	
4471  000d 7b01          	ld	a,(OFST+1,sp)
4472  000f a103          	cp	a,#3
4473  0011 2703          	jreq	L221
4474  0013 cc0214        	jp	L1721
4475  0016               L221:
4476                     ; 919 		copy_infoSet();
4478  0016 cd0000        	call	_copy_infoSet
4480                     ; 920 		FW_MODE(uiInfo.mode);
4482  0019 c60008        	ld	a,_uiInfo+8
4483  001c 97            	ld	xl,a
4484  001d a609          	ld	a,#9
4485  001f 95            	ld	xh,a
4486  0020 cd0000        	call	_file_write
4488                     ; 921 		FW_ID(uiInfo.id);
4490  0023 c60004        	ld	a,_uiInfo+4
4491  0026 97            	ld	xl,a
4492  0027 a60a          	ld	a,#10
4493  0029 95            	ld	xh,a
4494  002a cd0000        	call	_file_write
4496                     ; 922 		FW_TOFFSET(uiInfo.tOffset);
4498  002d c60011        	ld	a,_uiInfo+17
4499  0030 97            	ld	xl,a
4500  0031 a614          	ld	a,#20
4501  0033 95            	ld	xh,a
4502  0034 cd0000        	call	_file_write
4504                     ; 923 		if( uiInfo.mode == 1 )
4506  0037 c60008        	ld	a,_uiInfo+8
4507  003a a101          	cp	a,#1
4508  003c 2703          	jreq	L421
4509  003e cc01f8        	jp	L3721
4510  0041               L421:
4511                     ; 925 			func_rc_setting();
4513  0041 cd0000        	call	_func_rc_setting
4515                     ; 926 			__func_rc_timerout = 10;
4517  0044 350a0012      	mov	___func_rc_timerout,#10
4518                     ; 927 			FW_CNTLMODE(uiInfo.cntlMode);
4520  0048 c60003        	ld	a,_uiInfo+3
4521  004b 97            	ld	xl,a
4522  004c a608          	ld	a,#8
4523  004e 95            	ld	xh,a
4524  004f cd0000        	call	_file_write
4526                     ; 928 			FW_VALVE(uiInfo.valve);
4528  0052 c6000a        	ld	a,_uiInfo+10
4529  0055 97            	ld	xl,a
4530  0056 a60e          	ld	a,#14
4531  0058 95            	ld	xh,a
4532  0059 cd0000        	call	_file_write
4534                     ; 929 			FW_VALVE_SUB(uiInfo.valve_sub);
4536  005c c6000b        	ld	a,_uiInfo+11
4537  005f 97            	ld	xl,a
4538  0060 a62c          	ld	a,#44
4539  0062 95            	ld	xh,a
4540  0063 cd0000        	call	_file_write
4542                     ; 930 			FW_CNT(uiInfo.cnt);
4544  0066 c60005        	ld	a,_uiInfo+5
4545  0069 97            	ld	xl,a
4546  006a a60b          	ld	a,#11
4547  006c 95            	ld	xh,a
4548  006d cd0000        	call	_file_write
4550                     ; 931 			FW_CNT_SUB(uiInfo.cnt_sub);
4552  0070 c60006        	ld	a,_uiInfo+6
4553  0073 97            	ld	xl,a
4554  0074 a62b          	ld	a,#43
4555  0076 95            	ld	xh,a
4556  0077 cd0000        	call	_file_write
4558                     ; 932 			FW_CNT_MODE(uiInfo.controlMode);
4560  007a c60009        	ld	a,_uiInfo+9
4561  007d 97            	ld	xl,a
4562  007e a60d          	ld	a,#13
4563  0080 95            	ld	xh,a
4564  0081 cd0000        	call	_file_write
4566                     ; 933 			FW_OPMODE(uiInfo.opMode);
4568  0084 c60007        	ld	a,_uiInfo+7
4569  0087 97            	ld	xl,a
4570  0088 a60c          	ld	a,#12
4571  008a 95            	ld	xh,a
4572  008b cd0000        	call	_file_write
4574                     ; 934 			FW_POTYPE(uiInfo.poType);
4576  008e c6000f        	ld	a,_uiInfo+15
4577  0091 97            	ld	xl,a
4578  0092 a612          	ld	a,#18
4579  0094 95            	ld	xh,a
4580  0095 cd0000        	call	_file_write
4582                     ; 935 			FW_HOUSECAPA(uiInfo.houseCapa);
4584  0098 c60010        	ld	a,_uiInfo+16
4585  009b 97            	ld	xl,a
4586  009c a613          	ld	a,#19
4587  009e 95            	ld	xh,a
4588  009f cd0000        	call	_file_write
4590                     ; 936 			FW_LPM(uiInfo.lpmType);
4592  00a2 c60013        	ld	a,_uiInfo+19
4593  00a5 97            	ld	xl,a
4594  00a6 a628          	ld	a,#40
4595  00a8 95            	ld	xh,a
4596  00a9 cd0000        	call	_file_write
4598                     ; 937 			FW_TEMPOFFSET(uiInfo.tempOffset);
4600  00ac c60012        	ld	a,_uiInfo+18
4601  00af 97            	ld	xl,a
4602  00b0 a627          	ld	a,#39
4603  00b2 95            	ld	xh,a
4604  00b3 cd0000        	call	_file_write
4606                     ; 939 			FW_VALVE_INFOS
4608  00b6 c60015        	ld	a,_uiInfo+21
4609  00b9 97            	ld	xl,a
4610  00ba a615          	ld	a,#21
4611  00bc 95            	ld	xh,a
4612  00bd cd0000        	call	_file_write
4616  00c0 c60016        	ld	a,_uiInfo+22
4617  00c3 97            	ld	xl,a
4618  00c4 a616          	ld	a,#22
4619  00c6 95            	ld	xh,a
4620  00c7 cd0000        	call	_file_write
4624  00ca c60017        	ld	a,_uiInfo+23
4625  00cd 97            	ld	xl,a
4626  00ce a617          	ld	a,#23
4627  00d0 95            	ld	xh,a
4628  00d1 cd0000        	call	_file_write
4632  00d4 c60018        	ld	a,_uiInfo+24
4633  00d7 97            	ld	xl,a
4634  00d8 a618          	ld	a,#24
4635  00da 95            	ld	xh,a
4636  00db cd0000        	call	_file_write
4640  00de c60019        	ld	a,_uiInfo+25
4641  00e1 97            	ld	xl,a
4642  00e2 a619          	ld	a,#25
4643  00e4 95            	ld	xh,a
4644  00e5 cd0000        	call	_file_write
4648  00e8 c6001a        	ld	a,_uiInfo+26
4649  00eb 97            	ld	xl,a
4650  00ec a61a          	ld	a,#26
4651  00ee 95            	ld	xh,a
4652  00ef cd0000        	call	_file_write
4656  00f2 c6001b        	ld	a,_uiInfo+27
4657  00f5 97            	ld	xl,a
4658  00f6 a61b          	ld	a,#27
4659  00f8 95            	ld	xh,a
4660  00f9 cd0000        	call	_file_write
4664  00fc c6001c        	ld	a,_uiInfo+28
4665  00ff 97            	ld	xl,a
4666  0100 a61c          	ld	a,#28
4667  0102 95            	ld	xh,a
4668  0103 cd0000        	call	_file_write
4672  0106 c60025        	ld	a,_uiInfo+37
4673  0109 97            	ld	xl,a
4674  010a a62e          	ld	a,#46
4675  010c 95            	ld	xh,a
4676  010d cd0000        	call	_file_write
4680  0110 c60026        	ld	a,_uiInfo+38
4681  0113 97            	ld	xl,a
4682  0114 a62f          	ld	a,#47
4683  0116 95            	ld	xh,a
4684  0117 cd0000        	call	_file_write
4688  011a c60027        	ld	a,_uiInfo+39
4689  011d 97            	ld	xl,a
4690  011e a630          	ld	a,#48
4691  0120 95            	ld	xh,a
4692  0121 cd0000        	call	_file_write
4696  0124 c60028        	ld	a,_uiInfo+40
4697  0127 97            	ld	xl,a
4698  0128 a631          	ld	a,#49
4699  012a 95            	ld	xh,a
4700  012b cd0000        	call	_file_write
4704  012e c60029        	ld	a,_uiInfo+41
4705  0131 97            	ld	xl,a
4706  0132 a632          	ld	a,#50
4707  0134 95            	ld	xh,a
4708  0135 cd0000        	call	_file_write
4712  0138 c6002a        	ld	a,_uiInfo+42
4713  013b 97            	ld	xl,a
4714  013c a633          	ld	a,#51
4715  013e 95            	ld	xh,a
4716  013f cd0000        	call	_file_write
4720  0142 c6002b        	ld	a,_uiInfo+43
4721  0145 97            	ld	xl,a
4722  0146 a634          	ld	a,#52
4723  0148 95            	ld	xh,a
4724  0149 cd0000        	call	_file_write
4728  014c c6002c        	ld	a,_uiInfo+44
4729  014f 97            	ld	xl,a
4730  0150 a635          	ld	a,#53
4731  0152 95            	ld	xh,a
4732  0153 cd0000        	call	_file_write
4734                     ; 940 			FW_VALVE_RCINFOS
4736  0156 c6001d        	ld	a,_uiInfo+29
4737  0159 97            	ld	xl,a
4738  015a a61d          	ld	a,#29
4739  015c 95            	ld	xh,a
4740  015d cd0000        	call	_file_write
4744  0160 c6001e        	ld	a,_uiInfo+30
4745  0163 97            	ld	xl,a
4746  0164 a61e          	ld	a,#30
4747  0166 95            	ld	xh,a
4748  0167 cd0000        	call	_file_write
4752  016a c6001f        	ld	a,_uiInfo+31
4753  016d 97            	ld	xl,a
4754  016e a61f          	ld	a,#31
4755  0170 95            	ld	xh,a
4756  0171 cd0000        	call	_file_write
4760  0174 c60020        	ld	a,_uiInfo+32
4761  0177 97            	ld	xl,a
4762  0178 a620          	ld	a,#32
4763  017a 95            	ld	xh,a
4764  017b cd0000        	call	_file_write
4768  017e c60021        	ld	a,_uiInfo+33
4769  0181 97            	ld	xl,a
4770  0182 a621          	ld	a,#33
4771  0184 95            	ld	xh,a
4772  0185 cd0000        	call	_file_write
4776  0188 c60022        	ld	a,_uiInfo+34
4777  018b 97            	ld	xl,a
4778  018c a622          	ld	a,#34
4779  018e 95            	ld	xh,a
4780  018f cd0000        	call	_file_write
4784  0192 c60023        	ld	a,_uiInfo+35
4785  0195 97            	ld	xl,a
4786  0196 a623          	ld	a,#35
4787  0198 95            	ld	xh,a
4788  0199 cd0000        	call	_file_write
4792  019c c60024        	ld	a,_uiInfo+36
4793  019f 97            	ld	xl,a
4794  01a0 a624          	ld	a,#36
4795  01a2 95            	ld	xh,a
4796  01a3 cd0000        	call	_file_write
4800  01a6 c6002d        	ld	a,_uiInfo+45
4801  01a9 97            	ld	xl,a
4802  01aa a636          	ld	a,#54
4803  01ac 95            	ld	xh,a
4804  01ad cd0000        	call	_file_write
4808  01b0 c6002e        	ld	a,_uiInfo+46
4809  01b3 97            	ld	xl,a
4810  01b4 a637          	ld	a,#55
4811  01b6 95            	ld	xh,a
4812  01b7 cd0000        	call	_file_write
4816  01ba c6002f        	ld	a,_uiInfo+47
4817  01bd 97            	ld	xl,a
4818  01be a638          	ld	a,#56
4819  01c0 95            	ld	xh,a
4820  01c1 cd0000        	call	_file_write
4824  01c4 c60030        	ld	a,_uiInfo+48
4825  01c7 97            	ld	xl,a
4826  01c8 a639          	ld	a,#57
4827  01ca 95            	ld	xh,a
4828  01cb cd0000        	call	_file_write
4832  01ce c60031        	ld	a,_uiInfo+49
4833  01d1 97            	ld	xl,a
4834  01d2 a63a          	ld	a,#58
4835  01d4 95            	ld	xh,a
4836  01d5 cd0000        	call	_file_write
4840  01d8 c60032        	ld	a,_uiInfo+50
4841  01db 97            	ld	xl,a
4842  01dc a63b          	ld	a,#59
4843  01de 95            	ld	xh,a
4844  01df cd0000        	call	_file_write
4848  01e2 c60033        	ld	a,_uiInfo+51
4849  01e5 97            	ld	xl,a
4850  01e6 a63c          	ld	a,#60
4851  01e8 95            	ld	xh,a
4852  01e9 cd0000        	call	_file_write
4856  01ec c60034        	ld	a,_uiInfo+52
4857  01ef 97            	ld	xl,a
4858  01f0 a63d          	ld	a,#61
4859  01f2 95            	ld	xh,a
4860  01f3 cd0000        	call	_file_write
4863  01f6 2004          	jra	L5721
4864  01f8               L3721:
4865                     ; 944 			__func_rc_timerout = 10;
4867  01f8 350a0012      	mov	___func_rc_timerout,#10
4868  01fc               L5721:
4869                     ; 947 		__func_rc_timerout1 = 0;
4871  01fc 725f0013      	clr	___func_rc_timerout1
4872                     ; 948 		__func_rc_timerout2 = __timer1s;
4874  0200 5500000014    	mov	___func_rc_timerout2,___timer1s
4875                     ; 949 		STATUS_NEXT(next);	
4877  0205 7b02          	ld	a,(OFST+2,sp)
4878  0207 c7000e        	ld	__ds,a
4881  020a 725f000f      	clr	__dsCount
4884  020e 35ff0010      	mov	__dsPrev,#255
4887  0212 2021          	jra	L7721
4888  0214               L1721:
4889                     ; 951 	else if( key == 2 )
4891  0214 7b01          	ld	a,(OFST+1,sp)
4892  0216 a102          	cp	a,#2
4893  0218 2608          	jrne	L1031
4894                     ; 953 		_backup_backlight = 0;
4896  021a 725f0009      	clr	__backup_backlight
4897                     ; 955 		return 1;
4899  021e a601          	ld	a,#1
4901  0220 2014          	jra	L021
4902  0222               L1031:
4903                     ; 957 	else if( key == 4 )
4905  0222 7b01          	ld	a,(OFST+1,sp)
4906  0224 a104          	cp	a,#4
4907  0226 260d          	jrne	L7721
4908                     ; 959 		STATUS_NEXT(prev);
4910  0228 7b05          	ld	a,(OFST+5,sp)
4911  022a c7000e        	ld	__ds,a
4914  022d 725f000f      	clr	__dsCount
4917  0231 35ff0010      	mov	__dsPrev,#255
4919  0235               L7721:
4920                     ; 961 	return 0;
4922  0235 4f            	clr	a
4924  0236               L021:
4926  0236 85            	popw	x
4927  0237 81            	ret
4987                     ; 964 void	disp_status_exit(uint8_t key, uint8_t next)
4987                     ; 965 {
4988                     .text:	section	.text,new
4989  0000               _disp_status_exit:
4991  0000 89            	pushw	x
4992  0001 88            	push	a
4993       00000001      OFST:	set	1
4996                     ; 968 	_backup_backlight = 0;
4998  0002 725f0009      	clr	__backup_backlight
4999                     ; 969 	if( (_t20ms%10) != 0 )
5001  0006 c60000        	ld	a,__t20ms
5002  0009 5f            	clrw	x
5003  000a 97            	ld	xl,a
5004  000b a60a          	ld	a,#10
5005  000d cd0000        	call	c_smodx
5007  0010 a30000        	cpw	x,#0
5008  0013 2706          	jreq	L7231
5009                     ; 971 		_dsPrev = 0;
5011  0015 725f0010      	clr	__dsPrev
5012                     ; 972 		return;
5014  0019 2006          	jra	L031
5015  001b               L7231:
5016                     ; 975 	if( _dsPrev != 0 )
5018  001b 725d0010      	tnz	__dsPrev
5019  001f 2703          	jreq	L1331
5020                     ; 976 		return;
5021  0021               L031:
5024  0021 5b03          	addw	sp,#3
5025  0023 81            	ret
5026  0024               L1331:
5027                     ; 979 	_dsCount++;
5029  0024 725c000f      	inc	__dsCount
5030                     ; 980 	_dsPrev = 1;
5032  0028 35010010      	mov	__dsPrev,#1
5033                     ; 981 	lcd_clear(0);
5035  002c 4f            	clr	a
5036  002d cd0000        	call	_lcd_clear
5038                     ; 982 	for( i=0; i<4; i++ )
5040  0030 0f01          	clr	(OFST+0,sp)
5041  0032               L3331:
5042                     ; 983 		lcd_disp_n(i, _dsCount%10);
5044  0032 c6000f        	ld	a,__dsCount
5045  0035 5f            	clrw	x
5046  0036 97            	ld	xl,a
5047  0037 a60a          	ld	a,#10
5048  0039 62            	div	x,a
5049  003a 5f            	clrw	x
5050  003b 97            	ld	xl,a
5051  003c 9f            	ld	a,xl
5052  003d 97            	ld	xl,a
5053  003e 7b01          	ld	a,(OFST+0,sp)
5054  0040 95            	ld	xh,a
5055  0041 cd0000        	call	_lcd_disp_n
5057                     ; 982 	for( i=0; i<4; i++ )
5059  0044 0c01          	inc	(OFST+0,sp)
5062  0046 7b01          	ld	a,(OFST+0,sp)
5063  0048 a104          	cp	a,#4
5064  004a 25e6          	jrult	L3331
5065                     ; 985 	if( __func_rc_settingCb == 1 && _dsCount >= 10 )
5067  004c c60000        	ld	a,___func_rc_settingCb
5068  004f a101          	cp	a,#1
5069  0051 2616          	jrne	L1431
5071  0053 c6000f        	ld	a,__dsCount
5072  0056 a10a          	cp	a,#10
5073  0058 250f          	jrult	L1431
5074                     ; 987 		STATUS_NEXT(next);
5076  005a 7b03          	ld	a,(OFST+2,sp)
5077  005c c7000e        	ld	__ds,a
5080  005f 725f000f      	clr	__dsCount
5083  0063 35ff0010      	mov	__dsPrev,#255
5084                     ; 988 		return;
5087  0067 20b8          	jra	L031
5088  0069               L1431:
5089                     ; 990 	if( __timer1s != __func_rc_timerout2 )
5091  0069 c60000        	ld	a,___timer1s
5092  006c c10014        	cp	a,___func_rc_timerout2
5093  006f 273d          	jreq	L3431
5094                     ; 992 		if( __func_rc_timerout1 == 0 )
5096  0071 725d0013      	tnz	___func_rc_timerout1
5097  0075 263b          	jrne	L5531
5098                     ; 994 			__func_rc_timerout2 = __timer1s;
5100  0077 5500000014    	mov	___func_rc_timerout2,___timer1s
5101                     ; 995 			__func_rc_timerout1 = 1;
5103  007c 35010013      	mov	___func_rc_timerout1,#1
5104                     ; 996 			__func_rc_timerout--;
5106  0080 725a0012      	dec	___func_rc_timerout
5107                     ; 997 			if( __func_rc_timerout == 0 )
5109  0084 725d0012      	tnz	___func_rc_timerout
5110  0088 2628          	jrne	L5531
5111                     ; 999 				if( uiInfo.mode == 1 )
5113  008a c60008        	ld	a,_uiInfo+8
5114  008d a101          	cp	a,#1
5115  008f 260e          	jrne	L1531
5116                     ; 1003 					ui_error = 19;
5118  0091 35130000      	mov	_ui_error,#19
5119                     ; 1004 					_ds = 97;
5121  0095 3561000e      	mov	__ds,#97
5122                     ; 1005 					_dsCount = 0;
5124  0099 725f000f      	clr	__dsCount
5126  009d 2013          	jra	L5531
5127  009f               L1531:
5128                     ; 1009 					STATUS_NEXT(next);
5130  009f 7b03          	ld	a,(OFST+2,sp)
5131  00a1 c7000e        	ld	__ds,a
5134  00a4 725f000f      	clr	__dsCount
5137  00a8 35ff0010      	mov	__dsPrev,#255
5139  00ac 2004          	jra	L5531
5140  00ae               L3431:
5141                     ; 1015 		__func_rc_timerout1 = 0;
5143  00ae 725f0013      	clr	___func_rc_timerout1
5144  00b2               L5531:
5145                     ; 1016 }
5147  00b2 ac210021      	jpf	L031
5150                     	switch	.data
5151  0015               __tim1min:
5152  0015 00            	dc.b	0
5153  0016               __tim30min:
5154  0016 00            	dc.b	0
5155  0017               __timFlag:
5156  0017 00            	dc.b	0
5180                     ; 1022 void	timerClear(void)
5180                     ; 1023 {
5181                     .text:	section	.text,new
5182  0000               _timerClear:
5186                     ; 1024 	_tim1min = 0;
5188  0000 725f0015      	clr	__tim1min
5189                     ; 1025 	_tim30min = 0;
5191  0004 725f0016      	clr	__tim30min
5192                     ; 1026 	_timFlag = 0;
5194  0008 725f0017      	clr	__timFlag
5195                     ; 1027 }
5198  000c 81            	ret
5237                     ; 1029 void	disp_status_loop_message(uint8_t i)
5237                     ; 1030 {
5238                     .text:	section	.text,new
5239  0000               _disp_status_loop_message:
5241  0000 88            	push	a
5242       00000000      OFST:	set	0
5245                     ; 1031 	lcd_clear_btn();
5247  0001 cd0000        	call	_lcd_clear_btn
5249                     ; 1032 	if( i == 0 )		{	_disp_mode = 0x01;	LCD_BIT_SET(bS6);	/*	(0)난방*/	}
5251  0004 0d01          	tnz	(OFST+1,sp)
5252  0006 2614          	jrne	L3041
5255  0008 35010000      	mov	__disp_mode,#1
5258  000c c60011        	ld	a,_iLF_DEF+17
5259  000f 5f            	clrw	x
5260  0010 97            	ld	xl,a
5261  0011 d6540c        	ld	a,(21516,x)
5262  0014 ca0011        	or	a,_bLF_DEF+17
5263  0017 d7540c        	ld	(21516,x),a
5265  001a 2066          	jra	L5041
5266  001c               L3041:
5267                     ; 1033 	else if( i == 1 )	{	_disp_mode = 0x08;	LCD_BIT_SET(bS7);	/*	(1)예약*/	}
5269  001c 7b01          	ld	a,(OFST+1,sp)
5270  001e a101          	cp	a,#1
5271  0020 2614          	jrne	L7041
5274  0022 35080000      	mov	__disp_mode,#8
5277  0026 c60021        	ld	a,_iLF_DEF+33
5278  0029 5f            	clrw	x
5279  002a 97            	ld	xl,a
5280  002b d6540c        	ld	a,(21516,x)
5281  002e ca0021        	or	a,_bLF_DEF+33
5282  0031 d7540c        	ld	(21516,x),a
5284  0034 204c          	jra	L5041
5285  0036               L7041:
5286                     ; 1034 	else if( i == 2 )	{	_disp_mode = 0x10;	LCD_BIT_SET(bS8);	/*	(2)반복*/	}
5288  0036 7b01          	ld	a,(OFST+1,sp)
5289  0038 a102          	cp	a,#2
5290  003a 2614          	jrne	L3141
5293  003c 35100000      	mov	__disp_mode,#16
5296  0040 c60031        	ld	a,_iLF_DEF+49
5297  0043 5f            	clrw	x
5298  0044 97            	ld	xl,a
5299  0045 d6540c        	ld	a,(21516,x)
5300  0048 ca0031        	or	a,_bLF_DEF+49
5301  004b d7540c        	ld	(21516,x),a
5303  004e 2032          	jra	L5041
5304  0050               L3141:
5305                     ; 1035 	else if( i == 8 )	{	_disp_mode = 0x02;	LCD_BIT_SET(bS9);	/*	(1)외출*/	}
5307  0050 7b01          	ld	a,(OFST+1,sp)
5308  0052 a108          	cp	a,#8
5309  0054 2614          	jrne	L7141
5312  0056 35020000      	mov	__disp_mode,#2
5315  005a c60010        	ld	a,_iLF_DEF+16
5316  005d 5f            	clrw	x
5317  005e 97            	ld	xl,a
5318  005f d6540c        	ld	a,(21516,x)
5319  0062 ca0010        	or	a,_bLF_DEF+16
5320  0065 d7540c        	ld	(21516,x),a
5322  0068 2018          	jra	L5041
5323  006a               L7141:
5324                     ; 1036 	else if( i == 5 )	{	_disp_mode = 0x04;	LCD_BIT_SET(bS10);	/*	(2)정지*/	}
5326  006a 7b01          	ld	a,(OFST+1,sp)
5327  006c a105          	cp	a,#5
5328  006e 2612          	jrne	L5041
5331  0070 35040000      	mov	__disp_mode,#4
5334  0074 c60020        	ld	a,_iLF_DEF+32
5335  0077 5f            	clrw	x
5336  0078 97            	ld	xl,a
5337  0079 d6540c        	ld	a,(21516,x)
5338  007c ca0020        	or	a,_bLF_DEF+32
5339  007f d7540c        	ld	(21516,x),a
5340  0082               L5041:
5341                     ; 1038 	_disp_mode2 = _disp_mode;
5343  0082 5500000000    	mov	__disp_mode2,__disp_mode
5344                     ; 1039 	timerClear();
5346  0087 cd0000        	call	_timerClear
5348                     ; 1040 }
5351  008a 84            	pop	a
5352  008b 81            	ret
5400                     ; 1043 void	disp_status_loop_init(void)
5400                     ; 1044 {
5401                     .text:	section	.text,new
5402  0000               _disp_status_loop_init:
5404  0000 88            	push	a
5405       00000001      OFST:	set	1
5408                     ; 1047 	i = 0;
5410  0001 0f01          	clr	(OFST+0,sp)
5411                     ; 1048 	if (_disp_mode == 0xff) {
5413  0003 c60000        	ld	a,__disp_mode
5414  0006 a1ff          	cp	a,#255
5415  0008 2604          	jrne	L1441
5416                     ; 1049 		i = 1;
5418  000a a601          	ld	a,#1
5419  000c 6b01          	ld	(OFST+0,sp),a
5420  000e               L1441:
5421                     ; 1053 	lcd_clear(0);
5423  000e 4f            	clr	a
5424  000f cd0000        	call	_lcd_clear
5426                     ; 1055 	if ( i == 0) {
5428  0012 0d01          	tnz	(OFST+0,sp)
5429  0014 2605          	jrne	L3441
5430                     ; 1056 		ui_disp_temp_mark(1);
5432  0016 a601          	ld	a,#1
5433  0018 cd0000        	call	_ui_disp_temp_mark
5435  001b               L3441:
5436                     ; 1059 	if (_disp_mode != _disp_mode2) {
5438  001b c60000        	ld	a,__disp_mode
5439  001e c10000        	cp	a,__disp_mode2
5440  0021 273f          	jreq	L5441
5441                     ; 1060 		if( _disp_mode2 == 0x01 )	__sUp = 0;
5443  0023 c60000        	ld	a,__disp_mode2
5444  0026 a101          	cp	a,#1
5445  0028 2606          	jrne	L7441
5448  002a 725f0001      	clr	___sUp
5450  002e 2032          	jra	L5441
5451  0030               L7441:
5452                     ; 1061 		else if( _disp_mode2 == 0x08 )	__sUp = 1;
5454  0030 c60000        	ld	a,__disp_mode2
5455  0033 a108          	cp	a,#8
5456  0035 2606          	jrne	L3541
5459  0037 35010001      	mov	___sUp,#1
5461  003b 2025          	jra	L5441
5462  003d               L3541:
5463                     ; 1062 		else if( _disp_mode2 == 0x10 )	__sUp = 2;
5465  003d c60000        	ld	a,__disp_mode2
5466  0040 a110          	cp	a,#16
5467  0042 2606          	jrne	L7541
5470  0044 35020001      	mov	___sUp,#2
5472  0048 2018          	jra	L5441
5473  004a               L7541:
5474                     ; 1063 		else if( _disp_mode2 == 0x04 )	__sUp = 5;
5476  004a c60000        	ld	a,__disp_mode2
5477  004d a104          	cp	a,#4
5478  004f 2606          	jrne	L3641
5481  0051 35050001      	mov	___sUp,#5
5483  0055 200b          	jra	L5441
5484  0057               L3641:
5485                     ; 1064 		else if( _disp_mode2 == 0x02 )	__sUp = 8;
5487  0057 c60000        	ld	a,__disp_mode2
5488  005a a102          	cp	a,#2
5489  005c 2604          	jrne	L5441
5492  005e 35080001      	mov	___sUp,#8
5493  0062               L5441:
5494                     ; 1067 	disp_status_loop_message(__sUp);
5496  0062 c60001        	ld	a,___sUp
5497  0065 cd0000        	call	_disp_status_loop_message
5499                     ; 1069 	if ( i == 0) {
5501  0068 0d01          	tnz	(OFST+0,sp)
5502  006a 2618          	jrne	L1741
5503                     ; 1070 		if (_disp_mode == 0x01) {
5505  006c c60000        	ld	a,__disp_mode
5506  006f a101          	cp	a,#1
5507  0071 260e          	jrne	L3741
5508                     ; 1071 			ui_disp_temp_curr(uiInfo.tCurr);
5510  0073 c60002        	ld	a,_uiInfo+2
5511  0076 cd0000        	call	_ui_disp_temp_curr
5513                     ; 1072 			ui_disp_temp_setup(uiInfo.tSetup);
5515  0079 c6000e        	ld	a,_uiInfo+14
5516  007c cd0000        	call	_ui_disp_temp_setup
5519  007f 2003          	jra	L1741
5520  0081               L3741:
5521                     ; 1074 			disp_status_curr_only();
5523  0081 cd0000        	call	_disp_status_curr_only
5525  0084               L1741:
5526                     ; 1078 	lcd_blink_clear();
5528  0084 cd0000        	call	_lcd_blink_clear
5530                     ; 1079 	lcd_disp_info_fire(_boiler_fire != 0 ? 1 : 0);
5532  0087 725d0000      	tnz	__boiler_fire
5533  008b 2704          	jreq	L041
5534  008d a601          	ld	a,#1
5535  008f 2001          	jra	L241
5536  0091               L041:
5537  0091 4f            	clr	a
5538  0092               L241:
5539  0092 cd0000        	call	_lcd_disp_info_fire
5541                     ; 1081 	if ( i == 1 ) {
5543  0095 7b01          	ld	a,(OFST+0,sp)
5544  0097 a101          	cp	a,#1
5545  0099 2608          	jrne	L7741
5546                     ; 1082 		_key_blink = 1;
5548  009b 35010000      	mov	__key_blink,#1
5549                     ; 1083 		_key_sec = KEY_BLINK_FADE;
5551  009f 350a0000      	mov	__key_sec,#10
5552  00a3               L7741:
5553                     ; 1085 }
5556  00a3 84            	pop	a
5557  00a4 81            	ret
5586                     ; 1087 void	disp_status_curr_only(void)
5586                     ; 1088 {
5587                     .text:	section	.text,new
5588  0000               _disp_status_curr_only:
5592                     ; 1089 	ui_disp_clear_tSetup(0);
5594  0000 4f            	clr	a
5595  0001 cd0000        	call	_ui_disp_clear_tSetup
5597                     ; 1090 	LCD_BIT_SET(bS1);
5599  0004 c60003        	ld	a,_iLF_DEF+3
5600  0007 5f            	clrw	x
5601  0008 97            	ld	xl,a
5602  0009 d6540c        	ld	a,(21516,x)
5603  000c ca0003        	or	a,_bLF_DEF+3
5604  000f d7540c        	ld	(21516,x),a
5605                     ; 1091 	LCD_BIT_SET(bC1);
5607  0012 c60006        	ld	a,_iLF_DEF+6
5608  0015 5f            	clrw	x
5609  0016 97            	ld	xl,a
5610  0017 d6540c        	ld	a,(21516,x)
5611  001a ca0006        	or	a,_bLF_DEF+6
5612  001d d7540c        	ld	(21516,x),a
5613                     ; 1092 	LCD_BIT_CLEAR(bCOL);
5615  0020 c60016        	ld	a,_iLF_DEF+22
5616  0023 5f            	clrw	x
5617  0024 97            	ld	xl,a
5618  0025 c60016        	ld	a,_bLF_DEF+22
5619  0028 43            	cpl	a
5620  0029 d4540c        	and	a,(21516,x)
5621  002c d7540c        	ld	(21516,x),a
5622                     ; 1093 	ui_disp_temp_curr(uiInfo.tCurr);
5624  002f c60002        	ld	a,_uiInfo+2
5625  0032 cd0000        	call	_ui_disp_temp_curr
5627                     ; 1094 }
5630  0035 81            	ret
5680                     ; 1096 void	disp_status_error(uint8_t key, uint8_t next)
5680                     ; 1097 {
5681                     .text:	section	.text,new
5682  0000               _disp_status_error:
5684  0000 89            	pushw	x
5685       00000000      OFST:	set	0
5688                     ; 1099 	if( _dsCount == 0 )
5690  0001 725d000f      	tnz	__dsCount
5691  0005 260b          	jrne	L1351
5692                     ; 1101 		disp_next();
5694  0007 cd0000        	call	_disp_next
5696                     ; 1102 		lcd_disp_err(ui_error);
5698  000a c60000        	ld	a,_ui_error
5699  000d cd0000        	call	_lcd_disp_err
5702  0010 2006          	jra	L3351
5703  0012               L1351:
5704                     ; 1108 		if( uiInfo.enc != 0 )
5706  0012 725d0000      	tnz	_uiInfo
5707  0016 2606          	jrne	L1151
5708                     ; 1110 			goto Exit;
5710  0018               L3351:
5711                     ; 1114 	if( key == 2 )
5713  0018 7b01          	ld	a,(OFST+1,sp)
5714  001a a102          	cp	a,#2
5715  001c 2624          	jrne	L7351
5716  001e               L1151:
5717                     ; 1116 Exit:		
5717                     ; 1117 		if( uiInfo.mode == 1 )
5719  001e c60008        	ld	a,_uiInfo+8
5720  0021 a101          	cp	a,#1
5721  0023 261d          	jrne	L7351
5722                     ; 1120 			func_rc_recover(1);
5724  0025 a601          	ld	a,#1
5725  0027 cd0000        	call	_func_rc_recover
5727                     ; 1121 			error_type = 0;
5729  002a 725f0000      	clr	_error_type
5730                     ; 1122 			error = 0;
5732  002e 725f0000      	clr	_error
5733                     ; 1123 			lcd_blink_clear();
5735  0032 cd0000        	call	_lcd_blink_clear
5737                     ; 1124 			STATUS_NEXT(next);
5739  0035 7b02          	ld	a,(OFST+2,sp)
5740  0037 c7000e        	ld	__ds,a
5743  003a 725f000f      	clr	__dsCount
5746  003e 35ff0010      	mov	__dsPrev,#255
5748  0042               L7351:
5749                     ; 1127 }
5752  0042 85            	popw	x
5753  0043 81            	ret
5814                     ; 1131 void	disp_status_command(uint8_t key)
5814                     ; 1132 {
5815                     .text:	section	.text,new
5816  0000               _disp_status_command:
5818  0000 88            	push	a
5819  0001 88            	push	a
5820       00000001      OFST:	set	1
5823                     ; 1134 	if( _dsCount == 0 )
5825  0002 725d000f      	tnz	__dsCount
5826  0006 2643          	jrne	L1061
5827                     ; 1136 		disp_next();
5829  0008 cd0000        	call	_disp_next
5831                     ; 1138 		LCD_BIT_SET(b1A);
5833  000b c60002        	ld	a,_iLF_DEF+2
5834  000e 5f            	clrw	x
5835  000f 97            	ld	xl,a
5836  0010 d6540c        	ld	a,(21516,x)
5837  0013 ca0002        	or	a,_bLF_DEF+2
5838  0016 d7540c        	ld	(21516,x),a
5839                     ; 1139 		LCD_BIT_SET(b1F);
5841  0019 c60012        	ld	a,_iLF_DEF+18
5842  001c 5f            	clrw	x
5843  001d 97            	ld	xl,a
5844  001e d6540c        	ld	a,(21516,x)
5845  0021 ca0012        	or	a,_bLF_DEF+18
5846  0024 d7540c        	ld	(21516,x),a
5847                     ; 1140 		LCD_BIT_SET(b1E);
5849  0027 c60022        	ld	a,_iLF_DEF+34
5850  002a 5f            	clrw	x
5851  002b 97            	ld	xl,a
5852  002c d6540c        	ld	a,(21516,x)
5853  002f ca0022        	or	a,_bLF_DEF+34
5854  0032 d7540c        	ld	(21516,x),a
5855                     ; 1141 		LCD_BIT_SET(b1D);
5857  0035 c60032        	ld	a,_iLF_DEF+50
5858  0038 5f            	clrw	x
5859  0039 97            	ld	xl,a
5860  003a d6540c        	ld	a,(21516,x)
5861  003d ca0032        	or	a,_bLF_DEF+50
5862  0040 d7540c        	ld	(21516,x),a
5863                     ; 1142 		uiInfo._t = 0;
5865  0043 725f005f      	clr	_uiInfo+95
5867  0047 acfe00fe      	jpf	L3061
5868  004b               L1061:
5869                     ; 1146 		i = uiInfo._t;
5871  004b c6005f        	ld	a,_uiInfo+95
5872  004e 6b01          	ld	(OFST+0,sp),a
5873                     ; 1147 		if( uiInfo.enc != 0 )
5875  0050 725d0000      	tnz	_uiInfo
5876  0054 272c          	jreq	L5061
5877                     ; 1149 			if( (uiInfo.enc & 0x40) == 0 )
5879  0056 c60000        	ld	a,_uiInfo
5880  0059 a540          	bcp	a,#64
5881  005b 2612          	jrne	L7061
5882                     ; 1150 				i = (i+_LC-1)%_LC;
5884  005d 7b01          	ld	a,(OFST+0,sp)
5885  005f 5f            	clrw	x
5886  0060 97            	ld	xl,a
5887  0061 1c0009        	addw	x,#9
5888  0064 a60a          	ld	a,#10
5889  0066 cd0000        	call	c_smodx
5891  0069 01            	rrwa	x,a
5892  006a 6b01          	ld	(OFST+0,sp),a
5893  006c 02            	rlwa	x,a
5895  006d 200e          	jra	L1161
5896  006f               L7061:
5897                     ; 1152 				i = (i+1)%_LC;
5899  006f 7b01          	ld	a,(OFST+0,sp)
5900  0071 5f            	clrw	x
5901  0072 97            	ld	xl,a
5902  0073 5c            	incw	x
5903  0074 a60a          	ld	a,#10
5904  0076 cd0000        	call	c_smodx
5906  0079 01            	rrwa	x,a
5907  007a 6b01          	ld	(OFST+0,sp),a
5908  007c 02            	rlwa	x,a
5909  007d               L1161:
5910                     ; 1153 			uiInfo._t = i;
5912  007d 7b01          	ld	a,(OFST+0,sp)
5913  007f c7005f        	ld	_uiInfo+95,a
5914  0082               L5061:
5915                     ; 1155 		if( _dsPrev != i )
5917  0082 c60010        	ld	a,__dsPrev
5918  0085 1101          	cp	a,(OFST+0,sp)
5919  0087 2775          	jreq	L3061
5920                     ; 1157 			_dsPrev = i;
5922  0089 7b01          	ld	a,(OFST+0,sp)
5923  008b c70010        	ld	__dsPrev,a
5924                     ; 1158 			clear_npos2();
5926  008e cd0000        	call	_clear_npos2
5928                     ; 1159 			if( i==0 )		lcd_disp_setup_cntl_tab();
5930  0091 0d01          	tnz	(OFST+0,sp)
5931  0093 2605          	jrne	L5161
5934  0095 cd0000        	call	_lcd_disp_setup_cntl_tab
5937  0098 2064          	jra	L3061
5938  009a               L5161:
5939                     ; 1160 			else if( i==1 )	lcd_disp_setup_cntl_2motor();
5941  009a 7b01          	ld	a,(OFST+0,sp)
5942  009c a101          	cp	a,#1
5943  009e 2605          	jrne	L1261
5946  00a0 cd0000        	call	_lcd_disp_setup_cntl_2motor
5949  00a3 2059          	jra	L3061
5950  00a5               L1261:
5951                     ; 1161 			else if( i==2 )	lcd_disp_setup_cntl_on();
5953  00a5 7b01          	ld	a,(OFST+0,sp)
5954  00a7 a102          	cp	a,#2
5955  00a9 2605          	jrne	L5261
5958  00ab cd0000        	call	_lcd_disp_setup_cntl_on
5961  00ae 204e          	jra	L3061
5962  00b0               L5261:
5963                     ; 1162 			else if( i==3 )	lcd_disp_setup_cntl_po();
5965  00b0 7b01          	ld	a,(OFST+0,sp)
5966  00b2 a103          	cp	a,#3
5967  00b4 2605          	jrne	L1361
5970  00b6 cd0000        	call	_lcd_disp_setup_cntl_po
5973  00b9 2043          	jra	L3061
5974  00bb               L1361:
5975                     ; 1163 			else if( i==4 )	lcd_disp_mir1();
5977  00bb 7b01          	ld	a,(OFST+0,sp)
5978  00bd a104          	cp	a,#4
5979  00bf 2605          	jrne	L5361
5982  00c1 cd0000        	call	_lcd_disp_mir1
5985  00c4 2038          	jra	L3061
5986  00c6               L5361:
5987                     ; 1164 			else if( i==5 )	lcd_disp_mir2();
5989  00c6 7b01          	ld	a,(OFST+0,sp)
5990  00c8 a105          	cp	a,#5
5991  00ca 2605          	jrne	L1461
5994  00cc cd0000        	call	_lcd_disp_mir2
5997  00cf 202d          	jra	L3061
5998  00d1               L1461:
5999                     ; 1165 			else if( i==6 )	lcd_disp_freset();
6001  00d1 7b01          	ld	a,(OFST+0,sp)
6002  00d3 a106          	cp	a,#6
6003  00d5 2605          	jrne	L5461
6006  00d7 cd0000        	call	_lcd_disp_freset
6009  00da 2022          	jra	L3061
6010  00dc               L5461:
6011                     ; 1166 			else if( i==7 )	lcd_disp_cnt_host();
6013  00dc 7b01          	ld	a,(OFST+0,sp)
6014  00de a107          	cp	a,#7
6015  00e0 2605          	jrne	L1561
6018  00e2 cd0000        	call	_lcd_disp_cnt_host
6021  00e5 2017          	jra	L3061
6022  00e7               L1561:
6023                     ; 1167 			else if( i==8 )	lcd_disp_cnt_sub();
6025  00e7 7b01          	ld	a,(OFST+0,sp)
6026  00e9 a108          	cp	a,#8
6027  00eb 2605          	jrne	L5561
6030  00ed cd0000        	call	_lcd_disp_cnt_sub
6033  00f0 200c          	jra	L3061
6034  00f2               L5561:
6035                     ; 1168 			else if( i==9 )	lcd_disp_n(3, 0);
6037  00f2 7b01          	ld	a,(OFST+0,sp)
6038  00f4 a109          	cp	a,#9
6039  00f6 2606          	jrne	L3061
6042  00f8 ae0300        	ldw	x,#768
6043  00fb cd0000        	call	_lcd_disp_n
6045  00fe               L3061:
6046                     ; 1171 	if( key == 3 )		
6048  00fe 7b02          	ld	a,(OFST+1,sp)
6049  0100 a103          	cp	a,#3
6050  0102 2703          	jreq	L251
6051  0104 cc019c        	jp	L3661
6052  0107               L251:
6053                     ; 1173 		switch( uiInfo._t )
6055  0107 c6005f        	ld	a,_uiInfo+95
6057                     ; 1206 			break;
6058  010a 4d            	tnz	a
6059  010b 2719          	jreq	L3451
6060  010d 4a            	dec	a
6061  010e 2725          	jreq	L5451
6062  0110 4a            	dec	a
6063  0111 2731          	jreq	L7451
6064  0113 4a            	dec	a
6065  0114 273d          	jreq	L1551
6066  0116 a003          	sub	a,#3
6067  0118 2748          	jreq	L3551
6068  011a 4a            	dec	a
6069  011b 274d          	jreq	L5551
6070  011d 4a            	dec	a
6071  011e 275b          	jreq	L7551
6072  0120 4a            	dec	a
6073  0121 2769          	jreq	L1651
6074  0123 cc01ae        	jra	L1761
6075  0126               L3451:
6076                     ; 1175 		case 0:
6076                     ; 1176 			uiInfoSet.opMode = 3;	
6078  0126 35030069      	mov	_uiInfoSet+4,#3
6079                     ; 1177 			disp_status_run(3, 35, 0);
6081  012a 4b00          	push	#0
6082  012c ae0323        	ldw	x,#803
6083  012f cd0000        	call	_disp_status_run
6085  0132 84            	pop	a
6086                     ; 1178 			break;
6088  0133 2079          	jra	L1761
6089  0135               L5451:
6090                     ; 1179 		case 1:	
6090                     ; 1180 			uiInfoSet.opMode = 2;	
6092  0135 35020069      	mov	_uiInfoSet+4,#2
6093                     ; 1181 			disp_status_run(3, 35, 0);
6095  0139 4b00          	push	#0
6096  013b ae0323        	ldw	x,#803
6097  013e cd0000        	call	_disp_status_run
6099  0141 84            	pop	a
6100                     ; 1182 			break;
6102  0142 206a          	jra	L1761
6103  0144               L7451:
6104                     ; 1183 		case 2:	
6104                     ; 1184 			uiInfoSet.opMode = 0;	
6106  0144 725f0069      	clr	_uiInfoSet+4
6107                     ; 1185 			disp_status_run(3, 35, 0);
6109  0148 4b00          	push	#0
6110  014a ae0323        	ldw	x,#803
6111  014d cd0000        	call	_disp_status_run
6113  0150 84            	pop	a
6114                     ; 1186 			break;
6116  0151 205b          	jra	L1761
6117  0153               L1551:
6118                     ; 1187 		case 3:	
6118                     ; 1188 			uiInfoSet.opMode = 1;	
6120  0153 35010069      	mov	_uiInfoSet+4,#1
6121                     ; 1189 			disp_status_run(3, 35, 0);
6123  0157 4b00          	push	#0
6124  0159 ae0323        	ldw	x,#803
6125  015c cd0000        	call	_disp_status_run
6127  015f 84            	pop	a
6128                     ; 1190 			break;
6130  0160 204c          	jra	L1761
6131  0162               L3551:
6132                     ; 1191 		case 6:	
6132                     ; 1192 			func_rc_command(COMMAND_MODE_FACTORY, 100);	
6134  0162 ae0864        	ldw	x,#2148
6135  0165 cd0000        	call	_func_rc_command
6137                     ; 1193 			break;
6139  0168 2044          	jra	L1761
6140  016a               L5551:
6141                     ; 1194 		case 7:	
6141                     ; 1195 			//	MAIN
6141                     ; 1196 			func_rc_command(COMMAND_MODE_FACTORY, 110);	
6143  016a ae086e        	ldw	x,#2158
6144  016d cd0000        	call	_func_rc_command
6146                     ; 1197 			disp_status_run(3, 35, 0);
6148  0170 4b00          	push	#0
6149  0172 ae0323        	ldw	x,#803
6150  0175 cd0000        	call	_disp_status_run
6152  0178 84            	pop	a
6153                     ; 1198 			break;
6155  0179 2033          	jra	L1761
6156  017b               L7551:
6157                     ; 1199 		case 8:	
6157                     ; 1200 			//	SUB
6157                     ; 1201 			func_rc_command(COMMAND_MODE_FACTORY, 120);	
6159  017b ae0878        	ldw	x,#2168
6160  017e cd0000        	call	_func_rc_command
6162                     ; 1202 			disp_status_run(3, 35, 0);
6164  0181 4b00          	push	#0
6165  0183 ae0323        	ldw	x,#803
6166  0186 cd0000        	call	_disp_status_run
6168  0189 84            	pop	a
6169                     ; 1203 			break;
6171  018a 2022          	jra	L1761
6172  018c               L1651:
6173                     ; 1205 			STATUS_NEXT(100);
6175  018c 3564000e      	mov	__ds,#100
6178  0190 725f000f      	clr	__dsCount
6181  0194 35ff0010      	mov	__dsPrev,#255
6182                     ; 1206 			break;
6185  0198 2014          	jra	L1761
6186  019a               L7661:
6188  019a 2012          	jra	L1761
6189  019c               L3661:
6190                     ; 1209 	else if( key == 1 )
6192  019c 7b02          	ld	a,(OFST+1,sp)
6193  019e a101          	cp	a,#1
6194  01a0 260c          	jrne	L1761
6195                     ; 1211 		STATUS_NEXT(99);
6197  01a2 3563000e      	mov	__ds,#99
6200  01a6 725f000f      	clr	__dsCount
6203  01aa 35ff0010      	mov	__dsPrev,#255
6205  01ae               L1761:
6206                     ; 1213 }
6209  01ae 85            	popw	x
6210  01af 81            	ret
6249                     ; 1224 void	disp_write_file(uint8_t next)
6249                     ; 1225 {
6250                     .text:	section	.text,new
6251  0000               _disp_write_file:
6253  0000 88            	push	a
6254       00000000      OFST:	set	0
6257                     ; 1228 	file_update();
6259  0001 cd0000        	call	_file_update
6261                     ; 1229 	__func_rc_timerout = 5;
6263  0004 35050012      	mov	___func_rc_timerout,#5
6264                     ; 1230 	__func_rc_timerout1 = 0;
6266  0008 725f0013      	clr	___func_rc_timerout1
6267                     ; 1231 	__func_rc_timerout2 = __timer1s;
6269  000c 5500000014    	mov	___func_rc_timerout2,___timer1s
6270                     ; 1232 	func_rc_setting();
6272  0011 cd0000        	call	_func_rc_setting
6274                     ; 1233 	_ds = next;
6276  0014 7b01          	ld	a,(OFST+1,sp)
6277  0016 c7000e        	ld	__ds,a
6278                     ; 1234 }
6281  0019 84            	pop	a
6282  001a 81            	ret
6318                     ; 1236 void	disp_set_state(uint8_t next)
6318                     ; 1237 {
6319                     .text:	section	.text,new
6320  0000               _disp_set_state:
6322  0000 88            	push	a
6323       00000000      OFST:	set	0
6326                     ; 1238 	lcd_blink_clear();
6328  0001 cd0000        	call	_lcd_blink_clear
6330                     ; 1239 	STATUS_NEXT(next);
6332  0004 7b01          	ld	a,(OFST+1,sp)
6333  0006 c7000e        	ld	__ds,a
6336  0009 725f000f      	clr	__dsCount
6339  000d 35ff0010      	mov	__dsPrev,#255
6340                     ; 1240 }
6344  0011 84            	pop	a
6345  0012 81            	ret
6421                     ; 1245 void	disp_statusCb(uint8_t key)
6421                     ; 1246 {
6422                     .text:	section	.text,new
6423  0000               _disp_statusCb:
6425  0000 88            	push	a
6426  0001 88            	push	a
6427       00000001      OFST:	set	1
6430                     ; 1248 	if( _ds == 1 )			disp_status_id(key, 36);
6432  0002 c6000e        	ld	a,__ds
6433  0005 a101          	cp	a,#1
6434  0007 260d          	jrne	L3471
6437  0009 ae0024        	ldw	x,#36
6438  000c 7b02          	ld	a,(OFST+1,sp)
6439  000e 95            	ld	xh,a
6440  000f cd0000        	call	_disp_status_id
6443  0012 ac5d025d      	jpf	L5471
6444  0016               L3471:
6445                     ; 1249 	else if( _ds == 36 )	disp_status_toffset(key, 37);
6447  0016 c6000e        	ld	a,__ds
6448  0019 a124          	cp	a,#36
6449  001b 260d          	jrne	L7471
6452  001d ae0025        	ldw	x,#37
6453  0020 7b02          	ld	a,(OFST+1,sp)
6454  0022 95            	ld	xh,a
6455  0023 cd0000        	call	_disp_status_toffset
6458  0026 ac5d025d      	jpf	L5471
6459  002a               L7471:
6460                     ; 1250 	else if( _ds == 37 )	
6462  002a c6000e        	ld	a,__ds
6463  002d a125          	cp	a,#37
6464  002f 2620          	jrne	L3571
6465                     ; 1252 		t = disp_status_run(key, 38, 1);
6467  0031 4b01          	push	#1
6468  0033 ae0026        	ldw	x,#38
6469  0036 7b03          	ld	a,(OFST+2,sp)
6470  0038 95            	ld	xh,a
6471  0039 cd0000        	call	_disp_status_run
6473  003c 5b01          	addw	sp,#1
6474  003e 6b01          	ld	(OFST+0,sp),a
6475                     ; 1253 		if( t == 1 )
6477  0040 7b01          	ld	a,(OFST+0,sp)
6478  0042 a101          	cp	a,#1
6479  0044 2703          	jreq	L461
6480  0046 cc025d        	jp	L5471
6481  0049               L461:
6482                     ; 1254 			_ds = 100;
6484  0049 3564000e      	mov	__ds,#100
6485  004d ac5d025d      	jpf	L5471
6486  0051               L3571:
6487                     ; 1256 	else if( _ds == 38 )	disp_status_exit(key, 100);
6489  0051 c6000e        	ld	a,__ds
6490  0054 a126          	cp	a,#38
6491  0056 260d          	jrne	L1671
6494  0058 ae0064        	ldw	x,#100
6495  005b 7b02          	ld	a,(OFST+1,sp)
6496  005d 95            	ld	xh,a
6497  005e cd0000        	call	_disp_status_exit
6500  0061 ac5d025d      	jpf	L5471
6501  0065               L1671:
6502                     ; 1258 	else if( _ds == 9 )		disp_status_run_op(key, 61);
6504  0065 c6000e        	ld	a,__ds
6505  0068 a109          	cp	a,#9
6506  006a 260d          	jrne	L5671
6509  006c ae003d        	ldw	x,#61
6510  006f 7b02          	ld	a,(OFST+1,sp)
6511  0071 95            	ld	xh,a
6512  0072 cd0000        	call	_disp_status_run_op
6515  0075 ac5d025d      	jpf	L5471
6516  0079               L5671:
6517                     ; 1259 	else if( _ds == 61 )	disp_status_cntl_op(key, 63);
6519  0079 c6000e        	ld	a,__ds
6520  007c a13d          	cp	a,#61
6521  007e 260d          	jrne	L1771
6524  0080 ae003f        	ldw	x,#63
6525  0083 7b02          	ld	a,(OFST+1,sp)
6526  0085 95            	ld	xh,a
6527  0086 cd0000        	call	_disp_status_cntl_op
6530  0089 ac5d025d      	jpf	L5471
6531  008d               L1771:
6532                     ; 1260 	else if( _ds == 63 )	disp_status_valveCount(key, 64);
6534  008d c6000e        	ld	a,__ds
6535  0090 a13f          	cp	a,#63
6536  0092 260d          	jrne	L5771
6539  0094 ae0040        	ldw	x,#64
6540  0097 7b02          	ld	a,(OFST+1,sp)
6541  0099 95            	ld	xh,a
6542  009a cd0000        	call	_disp_status_valveCount
6545  009d ac5d025d      	jpf	L5471
6546  00a1               L5771:
6547                     ; 1261 	else if( _ds == 64 )	disp_status_houseCapa(key, 65);	//	if opMode==0, skip
6549  00a1 c6000e        	ld	a,__ds
6550  00a4 a140          	cp	a,#64
6551  00a6 260d          	jrne	L1002
6554  00a8 ae0041        	ldw	x,#65
6555  00ab 7b02          	ld	a,(OFST+1,sp)
6556  00ad 95            	ld	xh,a
6557  00ae cd0000        	call	_disp_status_houseCapa
6560  00b1 ac5d025d      	jpf	L5471
6561  00b5               L1002:
6562                     ; 1262 	else if( _ds == 65 )	disp_status_po_type(key, 66);	//	비례제어
6564  00b5 c6000e        	ld	a,__ds
6565  00b8 a141          	cp	a,#65
6566  00ba 260d          	jrne	L5002
6569  00bc ae0042        	ldw	x,#66
6570  00bf 7b02          	ld	a,(OFST+1,sp)
6571  00c1 95            	ld	xh,a
6572  00c2 cd0000        	call	_disp_status_po_type
6575  00c5 ac5d025d      	jpf	L5471
6576  00c9               L5002:
6577                     ; 1263 	else if( _ds == 66 )	disp_status_lpm(key, 67);		//	세대밸브 if cntlMode==1, skip
6579  00c9 c6000e        	ld	a,__ds
6580  00cc a142          	cp	a,#66
6581  00ce 260d          	jrne	L1102
6584  00d0 ae0043        	ldw	x,#67
6585  00d3 7b02          	ld	a,(OFST+1,sp)
6586  00d5 95            	ld	xh,a
6587  00d6 cd0000        	call	_disp_status_lpm
6590  00d9 ac5d025d      	jpf	L5471
6591  00dd               L1102:
6592                     ; 1264 	else if( _ds == 67 )	disp_status_temp_offset(key, 68);	//	if opMode==0, skip
6594  00dd c6000e        	ld	a,__ds
6595  00e0 a143          	cp	a,#67
6596  00e2 260d          	jrne	L5102
6599  00e4 ae0044        	ldw	x,#68
6600  00e7 7b02          	ld	a,(OFST+1,sp)
6601  00e9 95            	ld	xh,a
6602  00ea cd0000        	call	_disp_status_temp_offset
6605  00ed ac5d025d      	jpf	L5471
6606  00f1               L5102:
6607                     ; 1266 	else if( _ds == 68 )	disp_status_valveinfo(key, 69, 68);
6609  00f1 c6000e        	ld	a,__ds
6610  00f4 a144          	cp	a,#68
6611  00f6 2610          	jrne	L1202
6614  00f8 4b44          	push	#68
6615  00fa ae0045        	ldw	x,#69
6616  00fd 7b03          	ld	a,(OFST+2,sp)
6617  00ff 95            	ld	xh,a
6618  0100 cd0000        	call	_disp_status_valveinfo
6620  0103 84            	pop	a
6622  0104 ac5d025d      	jpf	L5471
6623  0108               L1202:
6624                     ; 1267 	else if( _ds == 69 )	disp_status_plc(key, 69);	
6626  0108 c6000e        	ld	a,__ds
6627  010b a145          	cp	a,#69
6628  010d 260d          	jrne	L5202
6631  010f ae0045        	ldw	x,#69
6632  0112 7b02          	ld	a,(OFST+1,sp)
6633  0114 95            	ld	xh,a
6634  0115 cd0000        	call	_disp_status_plc
6637  0118 ac5d025d      	jpf	L5471
6638  011c               L5202:
6639                     ; 1268 	else if( _ds == 70 )	
6641  011c c6000e        	ld	a,__ds
6642  011f a146          	cp	a,#70
6643  0121 2620          	jrne	L1302
6644                     ; 1270 		t = disp_status_run(key, 71, 9);
6646  0123 4b09          	push	#9
6647  0125 ae0047        	ldw	x,#71
6648  0128 7b03          	ld	a,(OFST+2,sp)
6649  012a 95            	ld	xh,a
6650  012b cd0000        	call	_disp_status_run
6652  012e 5b01          	addw	sp,#1
6653  0130 6b01          	ld	(OFST+0,sp),a
6654                     ; 1271 		if( t == 1 )
6656  0132 7b01          	ld	a,(OFST+0,sp)
6657  0134 a101          	cp	a,#1
6658  0136 2703          	jreq	L661
6659  0138 cc025d        	jp	L5471
6660  013b               L661:
6661                     ; 1272 			_ds = 100;
6663  013b 3564000e      	mov	__ds,#100
6664  013f ac5d025d      	jpf	L5471
6665  0143               L1302:
6666                     ; 1274 	else if( _ds == 71 )	disp_status_exit(key, 100);
6668  0143 c6000e        	ld	a,__ds
6669  0146 a147          	cp	a,#71
6670  0148 260d          	jrne	L7302
6673  014a ae0064        	ldw	x,#100
6674  014d 7b02          	ld	a,(OFST+1,sp)
6675  014f 95            	ld	xh,a
6676  0150 cd0000        	call	_disp_status_exit
6679  0153 ac5d025d      	jpf	L5471
6680  0157               L7302:
6681                     ; 1276 	else if( _ds == 10 )	
6683  0157 c6000e        	ld	a,__ds
6684  015a a10a          	cp	a,#10
6685  015c 2620          	jrne	L3402
6686                     ; 1278 		t = disp_status_run(key, 11, 9);
6688  015e 4b09          	push	#9
6689  0160 ae000b        	ldw	x,#11
6690  0163 7b03          	ld	a,(OFST+2,sp)
6691  0165 95            	ld	xh,a
6692  0166 cd0000        	call	_disp_status_run
6694  0169 5b01          	addw	sp,#1
6695  016b 6b01          	ld	(OFST+0,sp),a
6696                     ; 1279 		if( t == 1 )
6698  016d 7b01          	ld	a,(OFST+0,sp)
6699  016f a101          	cp	a,#1
6700  0171 2703          	jreq	L071
6701  0173 cc025d        	jp	L5471
6702  0176               L071:
6703                     ; 1280 			_ds = 100;
6705  0176 3564000e      	mov	__ds,#100
6706  017a ac5d025d      	jpf	L5471
6707  017e               L3402:
6708                     ; 1282 	else if( _ds == 11 )	disp_status_exit(key, 100);
6710  017e c6000e        	ld	a,__ds
6711  0181 a10b          	cp	a,#11
6712  0183 260d          	jrne	L1502
6715  0185 ae0064        	ldw	x,#100
6716  0188 7b02          	ld	a,(OFST+1,sp)
6717  018a 95            	ld	xh,a
6718  018b cd0000        	call	_disp_status_exit
6721  018e ac5d025d      	jpf	L5471
6722  0192               L1502:
6723                     ; 1284 	else if( _ds == 12 )	disp_status_exit(key, 100);
6725  0192 c6000e        	ld	a,__ds
6726  0195 a10c          	cp	a,#12
6727  0197 260d          	jrne	L5502
6730  0199 ae0064        	ldw	x,#100
6731  019c 7b02          	ld	a,(OFST+1,sp)
6732  019e 95            	ld	xh,a
6733  019f cd0000        	call	_disp_status_exit
6736  01a2 ac5d025d      	jpf	L5471
6737  01a6               L5502:
6738                     ; 1285 	else if( _ds == 15 )	
6740  01a6 c6000e        	ld	a,__ds
6741  01a9 a10f          	cp	a,#15
6742  01ab 2620          	jrne	L1602
6743                     ; 1287 		t = disp_status_run(key, 11, 20);
6745  01ad 4b14          	push	#20
6746  01af ae000b        	ldw	x,#11
6747  01b2 7b03          	ld	a,(OFST+2,sp)
6748  01b4 95            	ld	xh,a
6749  01b5 cd0000        	call	_disp_status_run
6751  01b8 5b01          	addw	sp,#1
6752  01ba 6b01          	ld	(OFST+0,sp),a
6753                     ; 1288 		if( t == 1 )
6755  01bc 7b01          	ld	a,(OFST+0,sp)
6756  01be a101          	cp	a,#1
6757  01c0 2703          	jreq	L271
6758  01c2 cc025d        	jp	L5471
6759  01c5               L271:
6760                     ; 1289 			_ds = 100;
6762  01c5 3564000e      	mov	__ds,#100
6763  01c9 ac5d025d      	jpf	L5471
6764  01cd               L1602:
6765                     ; 1291 	else if( _ds == 33 )	disp_status_toffset(key, 34);	//	mainR/C only
6767  01cd c6000e        	ld	a,__ds
6768  01d0 a121          	cp	a,#33
6769  01d2 260b          	jrne	L7602
6772  01d4 ae0022        	ldw	x,#34
6773  01d7 7b02          	ld	a,(OFST+1,sp)
6774  01d9 95            	ld	xh,a
6775  01da cd0000        	call	_disp_status_toffset
6778  01dd 207e          	jra	L5471
6779  01df               L7602:
6780                     ; 1292 	else if( _ds == 34 )	
6782  01df c6000e        	ld	a,__ds
6783  01e2 a122          	cp	a,#34
6784  01e4 261b          	jrne	L3702
6785                     ; 1294 		t = disp_status_run(key, 35, 33);
6787  01e6 4b21          	push	#33
6788  01e8 ae0023        	ldw	x,#35
6789  01eb 7b03          	ld	a,(OFST+2,sp)
6790  01ed 95            	ld	xh,a
6791  01ee cd0000        	call	_disp_status_run
6793  01f1 5b01          	addw	sp,#1
6794  01f3 6b01          	ld	(OFST+0,sp),a
6795                     ; 1295 		if( t == 1 )
6797  01f5 7b01          	ld	a,(OFST+0,sp)
6798  01f7 a101          	cp	a,#1
6799  01f9 2662          	jrne	L5471
6800                     ; 1296 			_ds = 100;
6802  01fb 3564000e      	mov	__ds,#100
6803  01ff 205c          	jra	L5471
6804  0201               L3702:
6805                     ; 1298 	else if( _ds == 35 )	disp_status_exit(key, 100);
6807  0201 c6000e        	ld	a,__ds
6808  0204 a123          	cp	a,#35
6809  0206 260b          	jrne	L1012
6812  0208 ae0064        	ldw	x,#100
6813  020b 7b02          	ld	a,(OFST+1,sp)
6814  020d 95            	ld	xh,a
6815  020e cd0000        	call	_disp_status_exit
6818  0211 204a          	jra	L5471
6819  0213               L1012:
6820                     ; 1300 	else if( _ds == 41 )	disp_status_command(key);
6822  0213 c6000e        	ld	a,__ds
6823  0216 a129          	cp	a,#41
6824  0218 2607          	jrne	L5012
6827  021a 7b02          	ld	a,(OFST+1,sp)
6828  021c cd0000        	call	_disp_status_command
6831  021f 203c          	jra	L5471
6832  0221               L5012:
6833                     ; 1302 	else if( _ds == 100 )	
6835  0221 c6000e        	ld	a,__ds
6836  0224 a164          	cp	a,#100
6837  0226 2616          	jrne	L1112
6838                     ; 1304 		__s = 0;
6840  0228 725f0000      	clr	___s
6841                     ; 1305 		_dsCount = 0;
6843  022c 725f000f      	clr	__dsCount
6844                     ; 1314 		_ds = 201;
6846  0230 35c9000e      	mov	__ds,#201
6847                     ; 1316 		_dsPrev = 0xff;
6849  0234 35ff0010      	mov	__dsPrev,#255
6850                     ; 1317 		_remote = 0;
6852  0238 725f0000      	clr	__remote
6854  023c 201f          	jra	L5471
6855  023e               L1112:
6856                     ; 1319 	else if( _ds == 101 || _ds == 133 )
6858  023e c6000e        	ld	a,__ds
6859  0241 a165          	cp	a,#101
6860  0243 2707          	jreq	L7112
6862  0245 c6000e        	ld	a,__ds
6863  0248 a185          	cp	a,#133
6864  024a 2613          	jrne	L5112
6865  024c               L7112:
6866                     ; 1322 		_dsCount = __timer1s;
6868  024c 550000000f    	mov	__dsCount,___timer1s
6869                     ; 1323 		_dsPrev = _ds - 100;
6871  0251 c6000e        	ld	a,__ds
6872  0254 a064          	sub	a,#100
6873  0256 c70010        	ld	__dsPrev,a
6874                     ; 1324 		_ds = 200;
6876  0259 35c8000e      	mov	__ds,#200
6878  025d               L5471:
6879                     ; 1435 }
6881  025d 200f          	jra	L261
6882  025f               L5112:
6883                     ; 1326 	else if( _ds == 200 )
6885  025f c6000e        	ld	a,__ds
6886  0262 a1c8          	cp	a,#200
6887  0264 2619          	jrne	L3212
6888                     ; 1328 		if( _dsCount == __timer1s )
6890  0266 c6000f        	ld	a,__dsCount
6891  0269 c10000        	cp	a,___timer1s
6892  026c 2602          	jrne	L5212
6893                     ; 1329 			return;
6894  026e               L261:
6897  026e 85            	popw	x
6898  026f 81            	ret
6899  0270               L5212:
6900                     ; 1330 		STATUS_NEXT(_dsPrev);
6902  0270 550010000e    	mov	__ds,__dsPrev
6905  0275 725f000f      	clr	__dsCount
6908  0279 35ff0010      	mov	__dsPrev,#255
6911  027d 20de          	jra	L5471
6912  027f               L3212:
6913                     ; 1332 	else if( _ds == 201 )
6915  027f c6000e        	ld	a,__ds
6916  0282 a1c9          	cp	a,#201
6917  0284 2607          	jrne	L1312
6918                     ; 1335 		_ui_setup(key);
6920  0286 7b02          	ld	a,(OFST+1,sp)
6921  0288 cd0000        	call	__ui_setup
6924  028b 20d0          	jra	L5471
6925  028d               L1312:
6926                     ; 1338 	else if( _ds == 220 )	
6928  028d c6000e        	ld	a,__ds
6929  0290 a1dc          	cp	a,#220
6930  0292 263b          	jrne	L5312
6931                     ; 1340 		uiInfoSet.id = 1;
6933  0294 35010066      	mov	_uiInfoSet+1,#1
6934                     ; 1341 		uiInfoSet.lpmType = 1;		//	8LPM
6936  0298 35010072      	mov	_uiInfoSet+13,#1
6937                     ; 1342 		uiInfoSet.mode = 1;			//	1 host
6939  029c 3501006a      	mov	_uiInfoSet+5,#1
6940                     ; 1343 		uiInfoSet.controlMode = 0;	//	0 main, 1 sub
6942  02a0 725f006b      	clr	_uiInfoSet+6
6943                     ; 1344 		uiInfoSet.valve_sub = 0;
6945  02a4 725f006d      	clr	_uiInfoSet+8
6946                     ; 1345 		uiInfoSet.poType = 0;
6948  02a8 725f006e      	clr	_uiInfoSet+9
6949                     ; 1346 		uiInfoSet.tOffset = 100;
6951  02ac 35640070      	mov	_uiInfoSet+11,#100
6952                     ; 1347 		uiInfoSet.tempOffset = 100;
6954  02b0 35640071      	mov	_uiInfoSet+12,#100
6955                     ; 1348 		uiInfoSet.lpmType_sub = 0;
6957  02b4 725f0073      	clr	_uiInfoSet+14
6958                     ; 1349 		uiInfoSet.subRCLock = 0;
6960  02b8 725f0094      	clr	_uiInfoSet+47
6961                     ; 1351 		_boiler_type = 0;		//	0 normal, 1 plc
6963  02bc 725f0000      	clr	__boiler_type
6964                     ; 1352 		uiInfoSet.plc = 0;		
6966  02c0 725f009a      	clr	_uiInfoSet+53
6967                     ; 1354 		disp_status_run_op(key, 221);	//	PO, On/Off
6969  02c4 ae00dd        	ldw	x,#221
6970  02c7 7b02          	ld	a,(OFST+1,sp)
6971  02c9 95            	ld	xh,a
6972  02ca cd0000        	call	_disp_status_run_op
6975  02cd 208e          	jra	L5471
6976  02cf               L5312:
6977                     ; 1356 	else if( _ds == 221 )	disp_status_cntl_op(key, 223);	//	Local, Each
6979  02cf c6000e        	ld	a,__ds
6980  02d2 a1dd          	cp	a,#221
6981  02d4 260c          	jrne	L1412
6984  02d6 ae00df        	ldw	x,#223
6985  02d9 7b02          	ld	a,(OFST+1,sp)
6986  02db 95            	ld	xh,a
6987  02dc cd0000        	call	_disp_status_cntl_op
6990  02df cc025d        	jra	L5471
6991  02e2               L1412:
6992                     ; 1357 	else if( _ds == 223 )	disp_status_valveCount(key, 224);
6994  02e2 c6000e        	ld	a,__ds
6995  02e5 a1df          	cp	a,#223
6996  02e7 260d          	jrne	L5412
6999  02e9 ae00e0        	ldw	x,#224
7000  02ec 7b02          	ld	a,(OFST+1,sp)
7001  02ee 95            	ld	xh,a
7002  02ef cd0000        	call	_disp_status_valveCount
7005  02f2 ac5d025d      	jpf	L5471
7006  02f6               L5412:
7007                     ; 1358 	else if( _ds == 224 )	disp_status_houseCapa(key, 225);	//	if opMode==0, skip
7009  02f6 c6000e        	ld	a,__ds
7010  02f9 a1e0          	cp	a,#224
7011  02fb 260d          	jrne	L1512
7014  02fd ae00e1        	ldw	x,#225
7015  0300 7b02          	ld	a,(OFST+1,sp)
7016  0302 95            	ld	xh,a
7017  0303 cd0000        	call	_disp_status_houseCapa
7020  0306 ac5d025d      	jpf	L5471
7021  030a               L1512:
7022                     ; 1359 	else if( _ds == 225 )	disp_status_valveinfo(key, 226, 225);
7024  030a c6000e        	ld	a,__ds
7025  030d a1e1          	cp	a,#225
7026  030f 2610          	jrne	L5512
7029  0311 4be1          	push	#225
7030  0313 ae00e2        	ldw	x,#226
7031  0316 7b03          	ld	a,(OFST+2,sp)
7032  0318 95            	ld	xh,a
7033  0319 cd0000        	call	_disp_status_valveinfo
7035  031c 84            	pop	a
7037  031d ac5d025d      	jpf	L5471
7038  0321               L5512:
7039                     ; 1360 	else if( _ds == 226 )	
7041  0321 c6000e        	ld	a,__ds
7042  0324 a1e2          	cp	a,#226
7043  0326 260b          	jrne	L1612
7044                     ; 1365 		copy_infoSet();
7046  0328 cd0000        	call	_copy_infoSet
7048                     ; 1366 		_ds = 228;
7050  032b 35e4000e      	mov	__ds,#228
7052  032f ac5d025d      	jpf	L5471
7053  0333               L1612:
7054                     ; 1368 	else if( _ds == 227 )	disp_status_exit(key, 220);
7056  0333 c6000e        	ld	a,__ds
7057  0336 a1e3          	cp	a,#227
7058  0338 260d          	jrne	L5612
7061  033a ae00dc        	ldw	x,#220
7062  033d 7b02          	ld	a,(OFST+1,sp)
7063  033f 95            	ld	xh,a
7064  0340 cd0000        	call	_disp_status_exit
7067  0343 ac5d025d      	jpf	L5471
7068  0347               L5612:
7069                     ; 1369 	else if( _ds == 228 )
7071  0347 c6000e        	ld	a,__ds
7072  034a a1e4          	cp	a,#228
7073  034c 2614          	jrne	L1712
7074                     ; 1371 		if( _ui_writer(key) == 1 )
7076  034e 7b02          	ld	a,(OFST+1,sp)
7077  0350 cd0000        	call	__ui_writer
7079  0353 a101          	cp	a,#1
7080  0355 2703          	jreq	L471
7081  0357 cc025d        	jp	L5471
7082  035a               L471:
7083                     ; 1372 			_ds = 220;
7085  035a 35dc000e      	mov	__ds,#220
7086  035e ac5d025d      	jpf	L5471
7087  0362               L1712:
7088                     ; 1375 	else if( _ds == 80 )	{	config_disp2(key, 81);	}
7090  0362 c6000e        	ld	a,__ds
7091  0365 a150          	cp	a,#80
7092  0367 260d          	jrne	L7712
7095  0369 ae0051        	ldw	x,#81
7096  036c 7b02          	ld	a,(OFST+1,sp)
7097  036e 95            	ld	xh,a
7098  036f cd0000        	call	_config_disp2
7101  0372 ac5d025d      	jpf	L5471
7102  0376               L7712:
7103                     ; 1376 	else if( _ds == 81 )	{	disp_write_file(12);	}
7105  0376 c6000e        	ld	a,__ds
7106  0379 a151          	cp	a,#81
7107  037b 2609          	jrne	L3022
7110  037d a60c          	ld	a,#12
7111  037f cd0000        	call	_disp_write_file
7114  0382 ac5d025d      	jpf	L5471
7115  0386               L3022:
7116                     ; 1377 	else if( _ds == 96 )	{	disp_write_file(12);	}
7118  0386 c6000e        	ld	a,__ds
7119  0389 a160          	cp	a,#96
7120  038b 2609          	jrne	L7022
7123  038d a60c          	ld	a,#12
7124  038f cd0000        	call	_disp_write_file
7127  0392 ac5d025d      	jpf	L5471
7128  0396               L7022:
7129                     ; 1378 	else if( _ds == 97 )
7131  0396 c6000e        	ld	a,__ds
7132  0399 a161          	cp	a,#97
7133  039b 2623          	jrne	L3122
7134                     ; 1380 		disp_status_error(key, 99);
7136  039d ae0063        	ldw	x,#99
7137  03a0 7b02          	ld	a,(OFST+1,sp)
7138  03a2 95            	ld	xh,a
7139  03a3 cd0000        	call	_disp_status_error
7141                     ; 1382 			if( error == 0 && error_type == 0 )
7143  03a6 725d0000      	tnz	_error
7144  03aa 2703          	jreq	L671
7145  03ac cc025d        	jp	L5471
7146  03af               L671:
7148  03af 725d0000      	tnz	_error_type
7149  03b3 2703          	jreq	L002
7150  03b5 cc025d        	jp	L5471
7151  03b8               L002:
7152                     ; 1385 				_ds = 100;
7154  03b8 3564000e      	mov	__ds,#100
7155  03bc ac5d025d      	jpf	L5471
7156  03c0               L3122:
7157                     ; 1389 	else if( _ds == 98 )	
7159  03c0 c6000e        	ld	a,__ds
7160  03c3 a162          	cp	a,#98
7161  03c5 261c          	jrne	L1222
7162                     ; 1391 		t = config_disp(key, 96);	
7164  03c7 ae0060        	ldw	x,#96
7165  03ca 7b02          	ld	a,(OFST+1,sp)
7166  03cc 95            	ld	xh,a
7167  03cd cd0000        	call	_config_disp
7169  03d0 6b01          	ld	(OFST+0,sp),a
7170                     ; 1392 		if( t == 1 )
7172  03d2 7b01          	ld	a,(OFST+0,sp)
7173  03d4 a101          	cp	a,#1
7174  03d6 2703          	jreq	L202
7175  03d8 cc025d        	jp	L5471
7176  03db               L202:
7177                     ; 1393 			_ds = 100;
7179  03db 3564000e      	mov	__ds,#100
7180  03df ac5d025d      	jpf	L5471
7181  03e3               L1222:
7182                     ; 1395 	else if( _ds == 99 )
7184  03e3 c6000e        	ld	a,__ds
7185  03e6 a163          	cp	a,#99
7186  03e8 2703          	jreq	L402
7187  03ea cc025d        	jp	L5471
7188  03ed               L402:
7189                     ; 1397 		t = getCurrTemp();
7191  03ed cd0000        	call	_getCurrTemp
7193  03f0 6b01          	ld	(OFST+0,sp),a
7194                     ; 1398 		if( uiInfo.tOffset != 100 )
7196  03f2 c60011        	ld	a,_uiInfo+17
7197  03f5 a164          	cp	a,#100
7198  03f7 2719          	jreq	L1322
7199                     ; 1400 			if( uiInfo.tOffset > 100 )
7201  03f9 c60011        	ld	a,_uiInfo+17
7202  03fc a165          	cp	a,#101
7203  03fe 250b          	jrult	L3322
7204                     ; 1401 				t = t + (uiInfo.tOffset-100);
7206  0400 c60011        	ld	a,_uiInfo+17
7207  0403 a064          	sub	a,#100
7208  0405 1b01          	add	a,(OFST+0,sp)
7209  0407 6b01          	ld	(OFST+0,sp),a
7211  0409 2007          	jra	L1322
7212  040b               L3322:
7213                     ; 1403 				t = t - uiInfo.tOffset;
7215  040b 7b01          	ld	a,(OFST+0,sp)
7216  040d c00011        	sub	a,_uiInfo+17
7217  0410 6b01          	ld	(OFST+0,sp),a
7218  0412               L1322:
7219                     ; 1405 		if( uiInfo.tCurr != t )
7221  0412 c60002        	ld	a,_uiInfo+2
7222  0415 1101          	cp	a,(OFST+0,sp)
7223  0417 2717          	jreq	L7322
7224                     ; 1407 			uiInfo.tCurr = t;
7226  0419 7b01          	ld	a,(OFST+0,sp)
7227  041b c70002        	ld	_uiInfo+2,a
7228                     ; 1408 			if( _remote == 0 )
7230  041e 725d0000      	tnz	__remote
7231  0422 260c          	jrne	L7322
7232                     ; 1411 				if( _disp_temp == 1 )
7234  0424 c60008        	ld	a,__disp_temp
7235  0427 a101          	cp	a,#1
7236  0429 2605          	jrne	L7322
7237                     ; 1412 					ui_disp_temp_curr(t);
7239  042b 7b01          	ld	a,(OFST+0,sp)
7240  042d cd0000        	call	_ui_disp_temp_curr
7242  0430               L7322:
7243                     ; 1415 		_disp_temp = 0;
7245  0430 725f0008      	clr	__disp_temp
7246                     ; 1417 		if( uiInfo.mode == 0 )	disp_status_loop_client(key);
7248  0434 725d0008      	tnz	_uiInfo+8
7249  0438 2607          	jrne	L5422
7252  043a 7b02          	ld	a,(OFST+1,sp)
7253  043c cd0000        	call	_disp_status_loop_client
7256  043f 2005          	jra	L7422
7257  0441               L5422:
7258                     ; 1419 			disp_status_loop_host(key);
7260  0441 7b02          	ld	a,(OFST+1,sp)
7261  0443 cd0000        	call	_disp_status_loop_host
7263  0446               L7422:
7264                     ; 1422 		if( error != 0 && error_type != 0 )
7266  0446 725d0000      	tnz	_error
7267  044a 2603          	jrne	L602
7268  044c cc025d        	jp	L5471
7269  044f               L602:
7271  044f 725d0000      	tnz	_error_type
7272  0453 2603          	jrne	L012
7273  0455 cc025d        	jp	L5471
7274  0458               L012:
7275  0458 ac5d025d      	jpf	L5471
7321                     ; 1437 void	copy_info(uint8_t next)
7321                     ; 1438 {
7322                     .text:	section	.text,new
7323  0000               _copy_info:
7325  0000 88            	push	a
7326       00000001      OFST:	set	1
7329                     ; 1440 	disp_set_state(next);
7331  0001 cd0000        	call	_disp_set_state
7333                     ; 1441 	uiInfoSet.id = uiInfo.id;
7335  0004 5500040066    	mov	_uiInfoSet+1,_uiInfo+4
7336                     ; 1442 	uiInfoSet.cnt = uiInfo.cnt;
7338  0009 5500050067    	mov	_uiInfoSet+2,_uiInfo+5
7339                     ; 1443 	uiInfoSet.cnt_sub = uiInfo.cnt_sub;
7341  000e 5500060068    	mov	_uiInfoSet+3,_uiInfo+6
7342                     ; 1444 	uiInfoSet.opMode = uiInfo.opMode;
7344  0013 5500070069    	mov	_uiInfoSet+4,_uiInfo+7
7345                     ; 1445 	uiInfoSet.mode = uiInfo.mode;
7347  0018 550008006a    	mov	_uiInfoSet+5,_uiInfo+8
7348                     ; 1446 	uiInfoSet.controlMode = uiInfo.controlMode;
7350  001d 550009006b    	mov	_uiInfoSet+6,_uiInfo+9
7351                     ; 1447 	uiInfoSet.valve = uiInfo.valve;
7353  0022 55000a006c    	mov	_uiInfoSet+7,_uiInfo+10
7354                     ; 1448 	uiInfoSet.valve_sub = uiInfo.valve_sub;
7356  0027 55000b006d    	mov	_uiInfoSet+8,_uiInfo+11
7357                     ; 1449 	uiInfoSet.poType = uiInfo.poType;
7359  002c 55000f006e    	mov	_uiInfoSet+9,_uiInfo+15
7360                     ; 1450 	uiInfoSet.houseCapa = uiInfo.houseCapa;
7362  0031 550010006f    	mov	_uiInfoSet+10,_uiInfo+16
7363                     ; 1451 	uiInfoSet.tOffset = uiInfo.tOffset;
7365  0036 5500110070    	mov	_uiInfoSet+11,_uiInfo+17
7366                     ; 1452 	uiInfoSet.tempOffset = uiInfo.tempOffset;
7368  003b 5500120071    	mov	_uiInfoSet+12,_uiInfo+18
7369                     ; 1453 	uiInfoSet.lpmType = uiInfo.lpmType;
7371  0040 5500130072    	mov	_uiInfoSet+13,_uiInfo+19
7372                     ; 1454 	uiInfoSet.lpmType_sub = uiInfo.lpmType_sub;
7374  0045 5500140073    	mov	_uiInfoSet+14,_uiInfo+20
7375                     ; 1455 	uiInfoSet.subRCLock = uiInfo.subRCLock;
7377  004a 55005d0094    	mov	_uiInfoSet+47,_uiInfo+93
7378                     ; 1456 	uiInfoSet.cntlMode = uiInfo.cntlMode;
7380  004f 5500030065    	mov	_uiInfoSet,_uiInfo+3
7381                     ; 1457 	for( i=0; i<8; i++ )
7383  0054 0f01          	clr	(OFST+0,sp)
7384  0056               L1722:
7385                     ; 1459 		uiInfoSet.valve_len[i] = uiInfo.valve_len[i];
7387  0056 7b01          	ld	a,(OFST+0,sp)
7388  0058 5f            	clrw	x
7389  0059 97            	ld	xl,a
7390  005a d60015        	ld	a,(_uiInfo+21,x)
7391  005d d70074        	ld	(_uiInfoSet+15,x),a
7392                     ; 1460 		uiInfoSet.valve_rc[i] = uiInfo.valve_rc[i];
7394  0060 7b01          	ld	a,(OFST+0,sp)
7395  0062 5f            	clrw	x
7396  0063 97            	ld	xl,a
7397  0064 d6001d        	ld	a,(_uiInfo+29,x)
7398  0067 d7007c        	ld	(_uiInfoSet+23,x),a
7399                     ; 1461 		uiInfoSet.valve_sub_len[i] = uiInfo.valve_sub_len[i];
7401  006a 7b01          	ld	a,(OFST+0,sp)
7402  006c 5f            	clrw	x
7403  006d 97            	ld	xl,a
7404  006e d60025        	ld	a,(_uiInfo+37,x)
7405  0071 d70084        	ld	(_uiInfoSet+31,x),a
7406                     ; 1462 		uiInfoSet.valve_sub_rc[i] = uiInfo.valve_sub_rc[i];
7408  0074 7b01          	ld	a,(OFST+0,sp)
7409  0076 5f            	clrw	x
7410  0077 97            	ld	xl,a
7411  0078 d6002d        	ld	a,(_uiInfo+45,x)
7412  007b d7008c        	ld	(_uiInfoSet+39,x),a
7413                     ; 1457 	for( i=0; i<8; i++ )
7415  007e 0c01          	inc	(OFST+0,sp)
7418  0080 7b01          	ld	a,(OFST+0,sp)
7419  0082 a108          	cp	a,#8
7420  0084 25d0          	jrult	L1722
7421                     ; 1465 	_backup_backlight = _backlight + 1;
7423  0086 c60000        	ld	a,__backlight
7424  0089 4c            	inc	a
7425  008a c70009        	ld	__backup_backlight,a
7426                     ; 1467 	lcd_blink_npos_clear();
7428  008d cd0000        	call	_lcd_blink_npos_clear
7430                     ; 1468 	lcd_blink_clear();
7432  0090 cd0000        	call	_lcd_blink_clear
7434                     ; 1469 }
7437  0093 84            	pop	a
7438  0094 81            	ret
7472                     ; 1471 void	copy_infoSet(void)
7472                     ; 1472 {
7473                     .text:	section	.text,new
7474  0000               _copy_infoSet:
7476  0000 88            	push	a
7477       00000001      OFST:	set	1
7480                     ; 1474 	uiInfo.id = uiInfoSet.id;
7482  0001 5500660004    	mov	_uiInfo+4,_uiInfoSet+1
7483                     ; 1475 	uiInfo.cnt = uiInfoSet.cnt;
7485  0006 5500670005    	mov	_uiInfo+5,_uiInfoSet+2
7486                     ; 1476 	uiInfo.cnt_sub = uiInfoSet.cnt_sub;
7488  000b 5500680006    	mov	_uiInfo+6,_uiInfoSet+3
7489                     ; 1477 	uiInfo.opMode = uiInfoSet.opMode;
7491  0010 5500690007    	mov	_uiInfo+7,_uiInfoSet+4
7492                     ; 1478 	uiInfo.mode = uiInfoSet.mode;
7494  0015 55006a0008    	mov	_uiInfo+8,_uiInfoSet+5
7495                     ; 1479 	uiInfo.controlMode = uiInfoSet.controlMode;
7497  001a 55006b0009    	mov	_uiInfo+9,_uiInfoSet+6
7498                     ; 1480 	uiInfo.valve = uiInfoSet.valve;
7500  001f 55006c000a    	mov	_uiInfo+10,_uiInfoSet+7
7501                     ; 1481 	uiInfo.valve_sub = uiInfoSet.valve_sub;
7503  0024 55006d000b    	mov	_uiInfo+11,_uiInfoSet+8
7504                     ; 1482 	uiInfo.poType = uiInfoSet.poType;
7506  0029 55006e000f    	mov	_uiInfo+15,_uiInfoSet+9
7507                     ; 1483 	uiInfo.houseCapa = uiInfoSet.houseCapa;
7509  002e 55006f0010    	mov	_uiInfo+16,_uiInfoSet+10
7510                     ; 1484 	uiInfo.tOffset = uiInfoSet.tOffset;
7512  0033 5500700011    	mov	_uiInfo+17,_uiInfoSet+11
7513                     ; 1485 	uiInfo.tempOffset = uiInfoSet.tempOffset;
7515  0038 5500710012    	mov	_uiInfo+18,_uiInfoSet+12
7516                     ; 1486 	uiInfo.lpmType = uiInfoSet.lpmType;
7518  003d 5500720013    	mov	_uiInfo+19,_uiInfoSet+13
7519                     ; 1487 	uiInfo.lpmType_sub = uiInfoSet.lpmType_sub;
7521  0042 5500730014    	mov	_uiInfo+20,_uiInfoSet+14
7522                     ; 1488 	uiInfo.subRCLock = uiInfoSet.subRCLock;
7524  0047 550094005d    	mov	_uiInfo+93,_uiInfoSet+47
7525                     ; 1489 	uiInfo.cntlMode = uiInfoSet.cntlMode;
7527  004c 5500650003    	mov	_uiInfo+3,_uiInfoSet
7528                     ; 1490 	for( i=0; i<8; i++ )
7530  0051 0f01          	clr	(OFST+0,sp)
7531  0053               L3132:
7532                     ; 1492 		uiInfo.valve_len[i] = uiInfoSet.valve_len[i];
7534  0053 7b01          	ld	a,(OFST+0,sp)
7535  0055 5f            	clrw	x
7536  0056 97            	ld	xl,a
7537  0057 d60074        	ld	a,(_uiInfoSet+15,x)
7538  005a d70015        	ld	(_uiInfo+21,x),a
7539                     ; 1493 		uiInfo.valve_rc[i] = uiInfoSet.valve_rc[i];
7541  005d 7b01          	ld	a,(OFST+0,sp)
7542  005f 5f            	clrw	x
7543  0060 97            	ld	xl,a
7544  0061 d6007c        	ld	a,(_uiInfoSet+23,x)
7545  0064 d7001d        	ld	(_uiInfo+29,x),a
7546                     ; 1494 		uiInfo.valve_sub_len[i] = uiInfoSet.valve_sub_len[i];
7548  0067 7b01          	ld	a,(OFST+0,sp)
7549  0069 5f            	clrw	x
7550  006a 97            	ld	xl,a
7551  006b d60084        	ld	a,(_uiInfoSet+31,x)
7552  006e d70025        	ld	(_uiInfo+37,x),a
7553                     ; 1495 		uiInfo.valve_sub_rc[i] = uiInfoSet.valve_sub_rc[i];
7555  0071 7b01          	ld	a,(OFST+0,sp)
7556  0073 5f            	clrw	x
7557  0074 97            	ld	xl,a
7558  0075 d6008c        	ld	a,(_uiInfoSet+39,x)
7559  0078 d7002d        	ld	(_uiInfo+45,x),a
7560                     ; 1490 	for( i=0; i<8; i++ )
7562  007b 0c01          	inc	(OFST+0,sp)
7565  007d 7b01          	ld	a,(OFST+0,sp)
7566  007f a108          	cp	a,#8
7567  0081 25d0          	jrult	L3132
7568                     ; 1497 }
7571  0083 84            	pop	a
7572  0084 81            	ret
7623                     ; 1501 void	disp_status(uint8_t key)
7623                     ; 1502 {
7624                     .text:	section	.text,new
7625  0000               _disp_status:
7627  0000 88            	push	a
7628       00000000      OFST:	set	0
7631                     ; 1503 	lcd_blinkCb();
7633  0001 cd0000        	call	_lcd_blinkCb
7635                     ; 1504 	disp_statusCb(key);
7637  0004 7b01          	ld	a,(OFST+1,sp)
7638  0006 cd0000        	call	_disp_statusCb
7640                     ; 1507 	uiInfo.enc = 0;
7642  0009 725f0000      	clr	_uiInfo
7643                     ; 1510 	if( _updateBit != 0 && _updateTimer != __timer1s )
7645  000d 725d0006      	tnz	__updateBit
7646  0011 2603          	jrne	L422
7647  0013 cc00a2        	jp	L5332
7648  0016               L422:
7650  0016 c60005        	ld	a,__updateTimer
7651  0019 c10000        	cp	a,___timer1s
7652  001c 2603          	jrne	L622
7653  001e cc00a2        	jp	L5332
7654  0021               L622:
7655                     ; 1512 		_updateTimer = __timer1s;
7657  0021 5500000005    	mov	__updateTimer,___timer1s
7658                     ; 1513 		_updateCount--;
7660  0026 725a0007      	dec	__updateCount
7661                     ; 1514 		if( _updateCount == 0 )
7663  002a 725d0007      	tnz	__updateCount
7664  002e 2672          	jrne	L5332
7665                     ; 1516 			if( (_updateBit&BIT_REPEAT) != 0 )	{FW_REPEAT(uiInfo.repeat);	}
7667  0030 c60006        	ld	a,__updateBit
7668  0033 a501          	bcp	a,#1
7669  0035 270a          	jreq	L1432
7672  0037 c6000c        	ld	a,_uiInfo+12
7673  003a 97            	ld	xl,a
7674  003b a60f          	ld	a,#15
7675  003d 95            	ld	xh,a
7676  003e cd0000        	call	_file_write
7678  0041               L1432:
7679                     ; 1517 			if( (_updateBit&BIT_RESERVE) != 0 )	{FW_RESERVE(uiInfo.reserve);}
7681  0041 c60006        	ld	a,__updateBit
7682  0044 a502          	bcp	a,#2
7683  0046 270a          	jreq	L3432
7686  0048 c6000d        	ld	a,_uiInfo+13
7687  004b 97            	ld	xl,a
7688  004c a610          	ld	a,#16
7689  004e 95            	ld	xh,a
7690  004f cd0000        	call	_file_write
7692  0052               L3432:
7693                     ; 1518 			if( (_updateBit&BIT_TSETUP) != 0 )	{FW_TSETUP(uiInfo.tSetup);}
7695  0052 c60006        	ld	a,__updateBit
7696  0055 a504          	bcp	a,#4
7697  0057 270a          	jreq	L5432
7700  0059 c6000e        	ld	a,_uiInfo+14
7701  005c 97            	ld	xl,a
7702  005d a611          	ld	a,#17
7703  005f 95            	ld	xh,a
7704  0060 cd0000        	call	_file_write
7706  0063               L5432:
7707                     ; 1519 			if( (_updateBit&BIT_DISPMODE) != 0 ){
7709  0063 c60006        	ld	a,__updateBit
7710  0066 a508          	bcp	a,#8
7711  0068 2723          	jreq	L7432
7712                     ; 1520 				if (uiInfo.mode == SETTING_MODE_SUB) {
7714  006a 725d0008      	tnz	_uiInfo+8
7715  006e 2613          	jrne	L1532
7716                     ; 1521 					if (_disp_mode != RC_MODE_OUT) {
7718  0070 c60000        	ld	a,__disp_mode
7719  0073 a102          	cp	a,#2
7720  0075 2716          	jreq	L7432
7721                     ; 1522 						FW_DISPMODE(_disp_mode);
7723  0077 c60000        	ld	a,__disp_mode
7724  007a 97            	ld	xl,a
7725  007b a629          	ld	a,#41
7726  007d 95            	ld	xh,a
7727  007e cd0000        	call	_file_write
7729  0081 200a          	jra	L7432
7730  0083               L1532:
7731                     ; 1525 					FW_DISPMODE(_disp_mode);
7733  0083 c60000        	ld	a,__disp_mode
7734  0086 97            	ld	xl,a
7735  0087 a629          	ld	a,#41
7736  0089 95            	ld	xh,a
7737  008a cd0000        	call	_file_write
7739  008d               L7432:
7740                     ; 1529 			if( (_updateBit&BIT_REPEAT) != 0 || (_updateBit&BIT_RESERVE) != 0 )	
7742  008d c60006        	ld	a,__updateBit
7743  0090 a501          	bcp	a,#1
7744  0092 2607          	jrne	L1632
7746  0094 c60006        	ld	a,__updateBit
7747  0097 a502          	bcp	a,#2
7748  0099 2703          	jreq	L7532
7749  009b               L1632:
7750                     ; 1531 				timerEventClear();
7752  009b cd0000        	call	_timerEventClear
7754  009e               L7532:
7755                     ; 1534 			_updateBit = 0;
7757  009e 725f0006      	clr	__updateBit
7758  00a2               L5332:
7759                     ; 1537 	if( key==0 )
7761  00a2 0d01          	tnz	(OFST+1,sp)
7762  00a4 2602          	jrne	L3632
7763                     ; 1538 		return;
7766  00a6 84            	pop	a
7767  00a7 81            	ret
7768  00a8               L3632:
7769                     ; 1540 	if( key == _keypwMaster[_keypwIndexMaster] )
7771  00a8 c6000a        	ld	a,__keypwIndexMaster
7772  00ab 5f            	clrw	x
7773  00ac 97            	ld	xl,a
7774  00ad d60000        	ld	a,(__keypwMaster,x)
7775  00b0 1101          	cp	a,(OFST+1,sp)
7776  00b2 2622          	jrne	L5632
7777                     ; 1542 		_keypwIndexMaster++;
7779  00b4 725c000a      	inc	__keypwIndexMaster
7780                     ; 1543 		if( _keypwIndexMaster == 6 )
7782  00b8 c6000a        	ld	a,__keypwIndexMaster
7783  00bb a106          	cp	a,#6
7784  00bd 2625          	jrne	L1732
7785                     ; 1545 			_keypwIndexMaster = 0;
7787  00bf 725f000a      	clr	__keypwIndexMaster
7788                     ; 1546 			uiInfo.id = 1;
7790  00c3 35010004      	mov	_uiInfo+4,#1
7791                     ; 1547 			uiInfo.mode = 1;
7793  00c7 35010008      	mov	_uiInfo+8,#1
7794                     ; 1548 			uiInfo.controlMode = 0;
7796  00cb 725f0009      	clr	_uiInfo+9
7797                     ; 1549 			copy_info(9);
7799  00cf a609          	ld	a,#9
7800  00d1 cd0000        	call	_copy_info
7802  00d4 200e          	jra	L1732
7803  00d6               L5632:
7804                     ; 1554 		_keypwIndexMaster = 0;
7806  00d6 725f000a      	clr	__keypwIndexMaster
7807                     ; 1555 		if( key == _keypwMaster[_keypwIndexMaster] )
7809  00da 7b01          	ld	a,(OFST+1,sp)
7810  00dc a104          	cp	a,#4
7811  00de 2604          	jrne	L1732
7812                     ; 1556 			_keypwIndexMaster++;
7814  00e0 725c000a      	inc	__keypwIndexMaster
7815  00e4               L1732:
7816                     ; 1559 	if( key == _keypwMaster2[_keypwIndexMaster2] )
7818  00e4 c6000b        	ld	a,__keypwIndexMaster2
7819  00e7 5f            	clrw	x
7820  00e8 97            	ld	xl,a
7821  00e9 d60006        	ld	a,(__keypwMaster2,x)
7822  00ec 1101          	cp	a,(OFST+1,sp)
7823  00ee 2622          	jrne	L5732
7824                     ; 1561 		_keypwIndexMaster2++;
7826  00f0 725c000b      	inc	__keypwIndexMaster2
7827                     ; 1562 		if( _keypwIndexMaster2 == 6 )
7829  00f4 c6000b        	ld	a,__keypwIndexMaster2
7830  00f7 a106          	cp	a,#6
7831  00f9 2625          	jrne	L1042
7832                     ; 1564 			_keypwIndexMaster2 = 0;
7834  00fb 725f000b      	clr	__keypwIndexMaster2
7835                     ; 1565 			uiInfo.id = 1;
7837  00ff 35010004      	mov	_uiInfo+4,#1
7838                     ; 1566 			uiInfo.mode = 1;
7840  0103 35010008      	mov	_uiInfo+8,#1
7841                     ; 1567 			uiInfo.controlMode = 1;
7843  0107 35010009      	mov	_uiInfo+9,#1
7844                     ; 1568 			copy_info(9);
7846  010b a609          	ld	a,#9
7847  010d cd0000        	call	_copy_info
7849  0110 200e          	jra	L1042
7850  0112               L5732:
7851                     ; 1573 		_keypwIndexMaster2 = 0;
7853  0112 725f000b      	clr	__keypwIndexMaster2
7854                     ; 1574 		if( key == _keypwMaster2[_keypwIndexMaster2] )
7856  0116 7b01          	ld	a,(OFST+1,sp)
7857  0118 a104          	cp	a,#4
7858  011a 2604          	jrne	L1042
7859                     ; 1575 			_keypwIndexMaster2++;
7861  011c 725c000b      	inc	__keypwIndexMaster2
7862  0120               L1042:
7863                     ; 1578 	if( key == 0x88 )
7865  0120 7b01          	ld	a,(OFST+1,sp)
7866  0122 a188          	cp	a,#136
7867  0124 261f          	jrne	L5042
7868                     ; 1580 		uiInfo.enc = 0;
7870  0126 725f0000      	clr	_uiInfo
7871                     ; 1581 		if( uiInfo.mode == 0 )
7873  012a 725d0008      	tnz	_uiInfo+8
7874  012e 2604          	jrne	L7042
7875                     ; 1582 			uiInfo.id = 2;
7877  0130 35020004      	mov	_uiInfo+4,#2
7878  0134               L7042:
7879                     ; 1583 		copy_info(uiInfo.mode==0 ? 101 : 133);
7881  0134 725d0008      	tnz	_uiInfo+8
7882  0138 2604          	jrne	L022
7883  013a a665          	ld	a,#101
7884  013c 2002          	jra	L222
7885  013e               L022:
7886  013e a685          	ld	a,#133
7887  0140               L222:
7888  0140 cd0000        	call	_copy_info
7891  0143 2016          	jra	L1142
7892  0145               L5042:
7893                     ; 1585 	else if( key == 0x89 && uiInfo.mode == 1 )
7895  0145 7b01          	ld	a,(OFST+1,sp)
7896  0147 a189          	cp	a,#137
7897  0149 2610          	jrne	L1142
7899  014b c60008        	ld	a,_uiInfo+8
7900  014e a101          	cp	a,#1
7901  0150 2609          	jrne	L1142
7902                     ; 1587 		uiInfo.enc = 0;
7904  0152 725f0000      	clr	_uiInfo
7905                     ; 1588 		copy_info(41);
7907  0156 a629          	ld	a,#41
7908  0158 cd0000        	call	_copy_info
7910  015b               L1142:
7911                     ; 1591 	if( key == _keypwDefault[_keypwIndexDefault] )
7913  015b c6000d        	ld	a,__keypwIndexDefault
7914  015e 5f            	clrw	x
7915  015f 97            	ld	xl,a
7916  0160 d60012        	ld	a,(__keypwDefault,x)
7917  0163 1101          	cp	a,(OFST+1,sp)
7918  0165 261e          	jrne	L5142
7919                     ; 1593 		_keypwIndexDefault++;
7921  0167 725c000d      	inc	__keypwIndexDefault
7922                     ; 1594 		if( _keypwIndexDefault == 6 )
7924  016b c6000d        	ld	a,__keypwIndexDefault
7925  016e a106          	cp	a,#6
7926  0170 2621          	jrne	L1242
7927                     ; 1596 			_keypwIndexDefault = 0;
7929  0172 725f000d      	clr	__keypwIndexDefault
7930                     ; 1597 			uiInfo.id = 1;
7932  0176 35010004      	mov	_uiInfo+4,#1
7933                     ; 1598 			uiInfo.mode = 1;
7935  017a 35010008      	mov	_uiInfo+8,#1
7936                     ; 1599 			copy_info(98);
7938  017e a662          	ld	a,#98
7939  0180 cd0000        	call	_copy_info
7941  0183 200e          	jra	L1242
7942  0185               L5142:
7943                     ; 1604 		_keypwIndexDefault = 0;
7945  0185 725f000d      	clr	__keypwIndexDefault
7946                     ; 1605 		if( key == _keypwDefault[_keypwIndexDefault] )
7948  0189 7b01          	ld	a,(OFST+1,sp)
7949  018b a104          	cp	a,#4
7950  018d 2604          	jrne	L1242
7951                     ; 1606 			_keypwIndexDefault++;
7953  018f 725c000d      	inc	__keypwIndexDefault
7954  0193               L1242:
7955                     ; 1609 	if( key == _keypwClient[_keypwIndexClient] )
7957  0193 c6000c        	ld	a,__keypwIndexClient
7958  0196 5f            	clrw	x
7959  0197 97            	ld	xl,a
7960  0198 d6000c        	ld	a,(__keypwClient,x)
7961  019b 1101          	cp	a,(OFST+1,sp)
7962  019d 261e          	jrne	L5242
7963                     ; 1611 		_keypwIndexClient++;
7965  019f 725c000c      	inc	__keypwIndexClient
7966                     ; 1612 		if( _keypwIndexClient == 6 )
7968  01a3 c6000c        	ld	a,__keypwIndexClient
7969  01a6 a106          	cp	a,#6
7970  01a8 2621          	jrne	L1342
7971                     ; 1614 			_keypwIndexClient = 0;
7973  01aa 725f000c      	clr	__keypwIndexClient
7974                     ; 1615 			uiInfo.id = 2;
7976  01ae 35020004      	mov	_uiInfo+4,#2
7977                     ; 1616 			uiInfo.mode = 0;
7979  01b2 725f0008      	clr	_uiInfo+8
7980                     ; 1617 			copy_info(101);
7982  01b6 a665          	ld	a,#101
7983  01b8 cd0000        	call	_copy_info
7985  01bb 200e          	jra	L1342
7986  01bd               L5242:
7987                     ; 1622 		_keypwIndexClient = 0;
7989  01bd 725f000c      	clr	__keypwIndexClient
7990                     ; 1623 		if( key == _keypwClient[_keypwIndexClient] )
7992  01c1 7b01          	ld	a,(OFST+1,sp)
7993  01c3 a104          	cp	a,#4
7994  01c5 2604          	jrne	L1342
7995                     ; 1624 			_keypwIndexClient++;
7997  01c7 725c000c      	inc	__keypwIndexClient
7998  01cb               L1342:
7999                     ; 1626 }
8002  01cb 84            	pop	a
8003  01cc 81            	ret
8723                     	xref	_timerEventClear
8724                     	xdef	_disp_statusCb
8725                     	xref	__ui_writer
8726                     	xref	__ui_setup
8727                     	xdef	_disp_set_state
8728                     	xdef	_disp_write_file
8729                     	xref	__boiler_type
8730                     	xref	_config_disp2
8731                     	xref	_config_disp
8732                     	xref	__remote
8733                     	xref	_getCurrTemp
8734                     	xdef	_disp_status_command
8735                     	xdef	_disp_status_error
8736                     	xref	__boiler_fire
8737                     	xdef	_timerClear
8738                     	xdef	__timFlag
8739                     	xdef	__tim30min
8740                     	xdef	__tim1min
8741                     	xdef	___func_rc_timerout2
8742                     	xdef	___func_rc_timerout1
8743                     	xdef	___func_rc_timerout
8744                     	xref	_func_rc_setting
8745                     	xref	___func_rc_settingCb
8746                     	xdef	_disp_status_plc
8747                     	xdef	_disp_status_valveinfo_sub
8748                     	xdef	__ui_
8749                     	xdef	___lpm
8750                     	xdef	_disp_status_houseCapa
8751                     	xdef	_disp_status_valveCount
8752                     	xdef	_disp_next
8753                     	xdef	_file_update
8754                     	xdef	__keypwIndexDefault
8755                     	xdef	__keypwIndexClient
8756                     	xdef	__keypwIndexMaster2
8757                     	xdef	__keypwIndexMaster
8758                     	xdef	__keypwDefault
8759                     	xdef	__keypwClient
8760                     	xdef	__keypwMaster2
8761                     	xdef	__keypwMaster
8762                     	xdef	_copy_info
8763                     	xdef	_copy_infoSet
8764                     	xref	_func_rc_command
8765                     	xref	__backlight
8766                     	xref	_func_rc_recover
8767                     	xref	_ui_error
8768                     	xref	_error_type
8769                     	xref	_error
8770                     	xdef	__backup_backlight
8771                     	xdef	__disp_temp
8772                     	xref	__boiler_water_heat
8773                     	xref	__boiler_water_shower
8774                     	xdef	_file_update2
8775                     	xdef	__updateCount
8776                     	xdef	__updateBit
8777                     	xdef	__updateTimer
8778                     	xref	__key_blink
8779                     	xref	__key_sec
8780                     	xref	__disp_mode2
8781                     	xref	__disp_mode
8782                     	xdef	_disp_status_curr_only
8783                     	xdef	_disp_status_loop_init
8784                     	xdef	_disp_status_loop_message
8785                     	xdef	_disp_status_exit
8786                     	xdef	_disp_status_run
8787                     	xdef	_disp_status_valveinfo
8788                     	xdef	_disp_status_temp_offset
8789                     	xdef	_disp_status_lpm
8790                     	xdef	_disp_status_po_type
8791                     	xdef	_disp_status_cntl_op
8792                     	xdef	_disp_status_run_op
8793                     	xdef	_disp_status_toffset
8794                     	xdef	_disp_status_id
8795                     	xdef	_clear_npos2
8796                     	xdef	_clear_npos1
8797                     	xdef	__dsPrev
8798                     	xdef	__dsCount
8799                     	xdef	__ds
8800                     	xdef	_ui_Open
8801                     	xref	_disp_status_loop_client
8802                     	xref	_disp_status_loop_host
8803                     	xdef	___sRoom
8804                     	xdef	___sInfo
8805                     	xdef	___sDn
8806                     	xdef	___sUp
8807                     	xdef	___s
8808                     	xref	_lcd_blink_npos
8809                     	xref	_lcd_blink_npos_clear
8810                     	xref	_lcd_disp_info_fire
8811                     	xref	_ui_disp_clear_tSetup
8812                     	xref	_ui_disp_temp_mark
8813                     	xref	_ui_disp_temp_curr
8814                     	xref	_ui_disp_temp_setup
8815                     	xref	_lcd_blinkCb
8816                     	xref	_lcd_blink_clear
8817                     	xdef	_disp_status
8818                     	xref	_lcd_clear_npos
8819                     	xref	_lcd_disp_rid
8820                     	xref	_lcd_disp_err
8821                     	xref	_lcd_disp_n
8822                     	xref	_lcd_clear
8823                     	xref	_lcd_disp_setup_mode_each
8824                     	xref	_lcd_disp_setup_mode_local
8825                     	xref	_lcd_disp_setup_valve
8826                     	xref	_lcd_disp_setup_id
8827                     	xref	_lcd_disp_setup_mode
8828                     	xref	_lcd_disp_setup_run
8829                     	xref	_lcd_disp_setup_c
8830                     	xref	_lcd_disp_plc
8831                     	xref	_lcd_disp_cnt_sub
8832                     	xref	_lcd_disp_cnt_host
8833                     	xref	_lcd_disp_freset
8834                     	xref	_lcd_disp_mir2
8835                     	xref	_lcd_disp_mir1
8836                     	xref	_lcd_disp_setup_cntl_tab
8837                     	xref	_lcd_disp_setup_cntl_2motor
8838                     	xref	_lcd_disp_setup_cntl_po
8839                     	xref	_lcd_disp_setup_cntl_on
8840                     	xref	_lcd_disp_setup_cntl_op
8841                     	xref	_lcd_disp_setup_len
8842                     	xref	_lcd_disp_setup_temp_offset
8843                     	xref	_lcd_disp_setup_lpm
8844                     	xref	_lcd_clear_btn
8845                     	xref	_iLF_DEF
8846                     	xref	_bLF_DEF
8847                     	switch	.bss
8848  0000               _uiInfo:
8849  0000 000000000000  	ds.b	101
8850                     	xdef	_uiInfo
8851  0065               _uiInfoSet:
8852  0065 000000000000  	ds.b	54
8853                     	xdef	_uiInfoSet
8854                     	xref	_file_read
8855                     	xref	_file_write
8856                     	xref	___timer1s
8857                     	xref	__t20ms
8858                     	xref.b	c_x
8878                     	xref	c_smodx
8879                     	end
