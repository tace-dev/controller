   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     .const:	section	.text
  24  0000               _ver:
  25  0000 686565646f70  	dc.b	"heedop=151103",0
  26                     	switch	.data
  27  0000               _iouartTimer0:
  28  0000 00            	dc.b	0
  29  0001               _iouartTimer1:
  30  0001 00            	dc.b	0
  31  0002               _ext_br_ready:
  32  0002 00            	dc.b	0
  33  0003               _ext_hn_ready:
  34  0003 00            	dc.b	0
  35  0004               _ext_br_type:
  36  0004 00            	dc.b	0
  37  0005               _ext_br_error:
  38  0005 00            	dc.b	0
  39  0006               _ext_hn_error:
  40  0006 00            	dc.b	0
  41  0007               _ext_br_timeout:
  42  0007 28            	dc.b	40
  43  0008               _ext_sub_ready:
  44  0008 00            	dc.b	0
  45  0009               _ext_sub_timeout:
  46  0009 14            	dc.b	20
  47  000a               _ext_sub_error:
  48  000a 00            	dc.b	0
  85                     ; 109 void cnt_Open(void) {
  87                     .text:	section	.text,new
  88  0000               _cnt_Open:
  92                     ; 112 	funcInfo.relay = FW_GET_RELAY;
  94  0000 a647          	ld	a,#71
  95  0002 cd0000        	call	_file_read
  97  0005 c7000a        	ld	_funcInfo+10,a
  98                     ; 113 	funcInfo.cnt = FW_GET_CNT;
 100  0008 a620          	ld	a,#32
 101  000a cd0000        	call	_file_read
 103  000d c7000b        	ld	_funcInfo+11,a
 104                     ; 115 	funcInfo.valve = FW_GET_VALVE;
 106  0010 a623          	ld	a,#35
 107  0012 cd0000        	call	_file_read
 109  0015 c7000d        	ld	_funcInfo+13,a
 110                     ; 118 if( funcInfo.valve == 0 )
 112  0018 2604          	jrne	L12
 113                     ; 119 	funcInfo.valve = 8;
 115  001a 3508000d      	mov	_funcInfo+13,#8
 116  001e               L12:
 117                     ; 121 	funcInfo.boiler_set_water_shower = FW_GET_B_SHOWER;
 119  001e a63a          	ld	a,#58
 120  0020 cd0000        	call	_file_read
 122  0023 c70003        	ld	_funcInfo+3,a
 123                     ; 122 	funcInfo.houseCapa = FW_GET_HOUSECAPA;
 125  0026 a628          	ld	a,#40
 126  0028 cd0000        	call	_file_read
 128  002b c7000e        	ld	_funcInfo+14,a
 129                     ; 123 	funcInfo.boiler_set_water_heat = FW_GET_B_HEAT;
 131  002e a63b          	ld	a,#59
 132  0030 cd0000        	call	_file_read
 134  0033 c70004        	ld	_funcInfo+4,a
 135                     ; 124 	funcInfo.subrcLock = FW_GET_SUBRCLOCK;
 137  0036 a63d          	ld	a,#61
 138  0038 cd0000        	call	_file_read
 140  003b c70007        	ld	_funcInfo+7,a
 141                     ; 125 	funcInfo.poType = FW_GET_POTYPE;
 143  003e a627          	ld	a,#39
 144  0040 cd0000        	call	_file_read
 146  0043 c7000f        	ld	_funcInfo+15,a
 147                     ; 126 	funcInfo.cntlMode = FW_GET_CNT_MODE;
 149  0046 a622          	ld	a,#34
 150  0048 cd0000        	call	_file_read
 152  004b c70010        	ld	_funcInfo+16,a
 153                     ; 127 	funcInfo.opMode = FW_GET_OPMODE;
 155  004e a621          	ld	a,#33
 156  0050 cd0000        	call	_file_read
 158  0053 c70011        	ld	_funcInfo+17,a
 159                     ; 128 	funcInfo.lpmType = FW_GET_LPM;
 161  0056 a63c          	ld	a,#60
 162  0058 cd0000        	call	_file_read
 164  005b c7000c        	ld	_funcInfo+12,a
 165                     ; 130 	funcInfo.sub_rcLED = 0;
 167  005e 725f0013      	clr	_funcInfo+19
 168                     ; 132 	funcInfo2.relay = FW2_GET_RELAY;
 170  0062 a6ab          	ld	a,#171
 171  0064 cd0000        	call	_file_read
 173  0067 c7000a        	ld	_funcInfo2+10,a
 174                     ; 133 	funcInfo2.cnt = FW2_GET_CNT;
 176  006a a684          	ld	a,#132
 177  006c cd0000        	call	_file_read
 179  006f c7000b        	ld	_funcInfo2+11,a
 180                     ; 134 	funcInfo2.valve = FW2_GET_VALVE;
 182  0072 a687          	ld	a,#135
 183  0074 cd0000        	call	_file_read
 185  0077 c7000d        	ld	_funcInfo2+13,a
 186                     ; 135 	funcInfo2.boiler_set_water_shower = FW2_GET_B_SHOWER;
 188  007a a69e          	ld	a,#158
 189  007c cd0000        	call	_file_read
 191  007f c70003        	ld	_funcInfo2+3,a
 192                     ; 136 	funcInfo2.houseCapa = FW2_GET_HOUSECAPA;
 194  0082 a68c          	ld	a,#140
 195  0084 cd0000        	call	_file_read
 197  0087 c7000e        	ld	_funcInfo2+14,a
 198                     ; 137 	funcInfo2.boiler_set_water_heat = FW2_GET_B_HEAT;
 200  008a a69f          	ld	a,#159
 201  008c cd0000        	call	_file_read
 203  008f c70004        	ld	_funcInfo2+4,a
 204                     ; 138 	funcInfo2.subrcLock = FW2_GET_SUBRCLOCK;
 206  0092 a6a1          	ld	a,#161
 207  0094 cd0000        	call	_file_read
 209  0097 c70007        	ld	_funcInfo2+7,a
 210                     ; 139 	funcInfo2.poType = FW2_GET_POTYPE;
 212  009a a68b          	ld	a,#139
 213  009c cd0000        	call	_file_read
 215  009f c7000f        	ld	_funcInfo2+15,a
 216                     ; 140 	funcInfo2.cntlMode = FW2_GET_CNT_MODE;
 218  00a2 a686          	ld	a,#134
 219  00a4 cd0000        	call	_file_read
 221  00a7 c70010        	ld	_funcInfo2+16,a
 222                     ; 141 	funcInfo2.opMode = FW2_GET_OPMODE;
 224  00aa a685          	ld	a,#133
 225  00ac cd0000        	call	_file_read
 227  00af c70011        	ld	_funcInfo2+17,a
 228                     ; 142 	funcInfo2.lpmType = FW2_GET_LPM;
 230  00b2 a6a0          	ld	a,#160
 231  00b4 cd0000        	call	_file_read
 233  00b7 c7000c        	ld	_funcInfo2+12,a
 234                     ; 144 	funcInfo.valve_rc[0] = FW_GET_VRC_1;
 236  00ba a632          	ld	a,#50
 237  00bc cd0000        	call	_file_read
 239  00bf c70014        	ld	_funcInfo+20,a
 240                     ; 145 	funcInfo.valve_rc[1] = FW_GET_VRC_2;
 242  00c2 a633          	ld	a,#51
 243  00c4 cd0000        	call	_file_read
 245  00c7 c70015        	ld	_funcInfo+21,a
 246                     ; 146 	funcInfo.valve_rc[2] = FW_GET_VRC_3;
 248  00ca a634          	ld	a,#52
 249  00cc cd0000        	call	_file_read
 251  00cf c70016        	ld	_funcInfo+22,a
 252                     ; 147 	funcInfo.valve_rc[3] = FW_GET_VRC_4;
 254  00d2 a635          	ld	a,#53
 255  00d4 cd0000        	call	_file_read
 257  00d7 c70017        	ld	_funcInfo+23,a
 258                     ; 148 	funcInfo.valve_rc[4] = FW_GET_VRC_5;
 260  00da a636          	ld	a,#54
 261  00dc cd0000        	call	_file_read
 263  00df c70018        	ld	_funcInfo+24,a
 264                     ; 149 	funcInfo.valve_rc[5] = FW_GET_VRC_6;
 266  00e2 a637          	ld	a,#55
 267  00e4 cd0000        	call	_file_read
 269  00e7 c70019        	ld	_funcInfo+25,a
 270                     ; 150 	funcInfo.valve_rc[6] = FW_GET_VRC_7;
 272  00ea a638          	ld	a,#56
 273  00ec cd0000        	call	_file_read
 275  00ef c7001a        	ld	_funcInfo+26,a
 276                     ; 151 	funcInfo.valve_rc[7] = FW_GET_VRC_8;
 278  00f2 a639          	ld	a,#57
 279  00f4 cd0000        	call	_file_read
 281  00f7 c7001b        	ld	_funcInfo+27,a
 282                     ; 152 	funcInfo.valve_len[0] = FW_GET_VL_1;
 284  00fa a62a          	ld	a,#42
 285  00fc cd0000        	call	_file_read
 287  00ff c7001c        	ld	_funcInfo+28,a
 288                     ; 153 	funcInfo.valve_len[1] = FW_GET_VL_2;
 290  0102 a62b          	ld	a,#43
 291  0104 cd0000        	call	_file_read
 293  0107 c7001d        	ld	_funcInfo+29,a
 294                     ; 154 	funcInfo.valve_len[2] = FW_GET_VL_3;
 296  010a a62c          	ld	a,#44
 297  010c cd0000        	call	_file_read
 299  010f c7001e        	ld	_funcInfo+30,a
 300                     ; 155 	funcInfo.valve_len[3] = FW_GET_VL_4;
 302  0112 a62d          	ld	a,#45
 303  0114 cd0000        	call	_file_read
 305  0117 c7001f        	ld	_funcInfo+31,a
 306                     ; 156 	funcInfo.valve_len[4] = FW_GET_VL_5;
 308  011a a62e          	ld	a,#46
 309  011c cd0000        	call	_file_read
 311  011f c70020        	ld	_funcInfo+32,a
 312                     ; 157 	funcInfo.valve_len[5] = FW_GET_VL_6;
 314  0122 a62f          	ld	a,#47
 315  0124 cd0000        	call	_file_read
 317  0127 c70021        	ld	_funcInfo+33,a
 318                     ; 158 	funcInfo.valve_len[6] = FW_GET_VL_7;
 320  012a a630          	ld	a,#48
 321  012c cd0000        	call	_file_read
 323  012f c70022        	ld	_funcInfo+34,a
 324                     ; 159 	funcInfo.valve_len[7] = FW_GET_VL_8;
 326  0132 a631          	ld	a,#49
 327  0134 cd0000        	call	_file_read
 329  0137 c70023        	ld	_funcInfo+35,a
 330  013a 720e002303    	btjt	_funcInfo+35,#7,L221
 331                     ; 165 	ext_br_ready = (funcInfo.valve_len[7]&0x80) == 0 ? 0 : 1;
 333  013f 4f            	clr	a
 334  0140 2002          	jra	L421
 335  0142               L221:
 336  0142 a601          	ld	a,#1
 337  0144               L421:
 338  0144 c70002        	ld	_ext_br_ready,a
 339                     ; 166 	ext_hn_ready = (funcInfo.valve_len[7]&0x40) == 0 ? 0 : 1;
 341  0147 720c002303    	btjt	_funcInfo+35,#6,L621
 342  014c 4f            	clr	a
 343  014d 2002          	jra	L031
 344  014f               L621:
 345  014f a601          	ld	a,#1
 346  0151               L031:
 347  0151 c70003        	ld	_ext_hn_ready,a
 348                     ; 168 	funcInfo.valve_len[7] = (funcInfo.valve_len[7]&0x3f) * 4;
 350  0154 c60023        	ld	a,_funcInfo+35
 351  0157 a43f          	and	a,#63
 352  0159 48            	sll	a
 353  015a 48            	sll	a
 354  015b c70023        	ld	_funcInfo+35,a
 355                     ; 170 	ext_sub_ready = (funcInfo.valve_len[6]&0x80) == 0 ? 0 : 1;
 357  015e 720e002203    	btjt	_funcInfo+34,#7,L231
 358  0163 4f            	clr	a
 359  0164 2002          	jra	L431
 360  0166               L231:
 361  0166 a601          	ld	a,#1
 362  0168               L431:
 363  0168 c70008        	ld	_ext_sub_ready,a
 364                     ; 171 	funcInfo.valve_len[6] = (funcInfo.valve_len[6]&0x7f) * 2;
 366  016b c60022        	ld	a,_funcInfo+34
 367  016e a47f          	and	a,#127
 368  0170 48            	sll	a
 369  0171 c70022        	ld	_funcInfo+34,a
 370                     ; 190 	funcInfo2.valve_rc[0] = FW2_GET_VRC_1;
 372  0174 a696          	ld	a,#150
 373  0176 cd0000        	call	_file_read
 375  0179 c70014        	ld	_funcInfo2+20,a
 376                     ; 191 	funcInfo2.valve_rc[1] = FW2_GET_VRC_2;
 378  017c a697          	ld	a,#151
 379  017e cd0000        	call	_file_read
 381  0181 c70015        	ld	_funcInfo2+21,a
 382                     ; 192 	funcInfo2.valve_rc[2] = FW2_GET_VRC_3;
 384  0184 a698          	ld	a,#152
 385  0186 cd0000        	call	_file_read
 387  0189 c70016        	ld	_funcInfo2+22,a
 388                     ; 193 	funcInfo2.valve_rc[3] = FW2_GET_VRC_4;
 390  018c a699          	ld	a,#153
 391  018e cd0000        	call	_file_read
 393  0191 c70017        	ld	_funcInfo2+23,a
 394                     ; 194 	funcInfo2.valve_rc[4] = FW2_GET_VRC_5;
 396  0194 a69a          	ld	a,#154
 397  0196 cd0000        	call	_file_read
 399  0199 c70018        	ld	_funcInfo2+24,a
 400                     ; 195 	funcInfo2.valve_rc[5] = FW2_GET_VRC_6;
 402  019c a69b          	ld	a,#155
 403  019e cd0000        	call	_file_read
 405  01a1 c70019        	ld	_funcInfo2+25,a
 406                     ; 196 	funcInfo2.valve_rc[6] = FW2_GET_VRC_7;
 408  01a4 a69c          	ld	a,#156
 409  01a6 cd0000        	call	_file_read
 411  01a9 c7001a        	ld	_funcInfo2+26,a
 412                     ; 197 	funcInfo2.valve_rc[7] = FW2_GET_VRC_8;
 414  01ac a69d          	ld	a,#157
 415  01ae cd0000        	call	_file_read
 417  01b1 c7001b        	ld	_funcInfo2+27,a
 418                     ; 198 	funcInfo2.valve_len[0] = FW2_GET_VL_1;
 420  01b4 a68e          	ld	a,#142
 421  01b6 cd0000        	call	_file_read
 423  01b9 c7001c        	ld	_funcInfo2+28,a
 424                     ; 199 	funcInfo2.valve_len[1] = FW2_GET_VL_2;
 426  01bc a68f          	ld	a,#143
 427  01be cd0000        	call	_file_read
 429  01c1 c7001d        	ld	_funcInfo2+29,a
 430                     ; 200 	funcInfo2.valve_len[2] = FW2_GET_VL_3;
 432  01c4 a690          	ld	a,#144
 433  01c6 cd0000        	call	_file_read
 435  01c9 c7001e        	ld	_funcInfo2+30,a
 436                     ; 201 	funcInfo2.valve_len[3] = FW2_GET_VL_4;
 438  01cc a691          	ld	a,#145
 439  01ce cd0000        	call	_file_read
 441  01d1 c7001f        	ld	_funcInfo2+31,a
 442                     ; 202 	funcInfo2.valve_len[4] = FW2_GET_VL_5;
 444  01d4 a692          	ld	a,#146
 445  01d6 cd0000        	call	_file_read
 447  01d9 c70020        	ld	_funcInfo2+32,a
 448                     ; 203 	funcInfo2.valve_len[5] = FW2_GET_VL_6;
 450  01dc a693          	ld	a,#147
 451  01de cd0000        	call	_file_read
 453  01e1 c70021        	ld	_funcInfo2+33,a
 454                     ; 204 	funcInfo2.valve_len[6] = FW2_GET_VL_7;
 456  01e4 a694          	ld	a,#148
 457  01e6 cd0000        	call	_file_read
 459  01e9 c70022        	ld	_funcInfo2+34,a
 460                     ; 205 	funcInfo2.valve_len[7] = FW2_GET_VL_8;
 462  01ec a695          	ld	a,#149
 463  01ee cd0000        	call	_file_read
 465  01f1 c70023        	ld	_funcInfo2+35,a
 466                     ; 207 	debug_enable_cnt = FW_GET_CNTTYPE;
 468  01f4 a648          	ld	a,#72
 469  01f6 cd0000        	call	_file_read
 471  01f9 c70000        	ld	_debug_enable_cnt,a
 472                     ; 209 	funcInfo.plc = FW_GET_PLC;
 474  01fc a649          	ld	a,#73
 475  01fe cd0000        	call	_file_read
 477  0201 c70024        	ld	_funcInfo+36,a
 478                     ; 210 	funcInfo2.plc = FW2_GET_PLC;
 480  0204 a6ad          	ld	a,#173
 481  0206 cd0000        	call	_file_read
 483  0209 c70024        	ld	_funcInfo2+36,a
 484                     ; 212 	funcInfo.boiler_type = FW_GET_B_TYPE;
 486  020c a63e          	ld	a,#62
 487  020e cd0000        	call	_file_read
 489  0211 c70005        	ld	_funcInfo+5,a
 490                     ; 213 	funcInfo2.boiler_type = FW2_GET_B_TYPE;
 492  0214 a6a2          	ld	a,#162
 493  0216 cd0000        	call	_file_read
 495  0219 c70005        	ld	_funcInfo2+5,a
 496                     ; 241 	copy_funcInfo(1);
 498  021c a601          	ld	a,#1
 500                     ; 242 }
 503  021e cc0000        	jp	_copy_funcInfo
 539                     ; 244 uint8_t	_msgLoop(uint8_t mode)
 539                     ; 245 {
 540                     .text:	section	.text,new
 541  0000               __msgLoop:
 545                     ; 246 	cnt_ptc_make(iouart_getBuffer());
 547  0000 cd0000        	call	_iouart_getBuffer
 549  0003 cd0000        	call	_cnt_ptc_make
 551                     ; 247 	iouart_Set_Packet(0);
 553  0006 4f            	clr	a
 554  0007 cd0000        	call	_iouart_Set_Packet
 556                     ; 248 	iouart_Pkt_Start();
 558  000a cd0000        	call	_iouart_Pkt_Start
 560                     ; 249 	return 0;
 562  000d 4f            	clr	a
 565  000e 81            	ret	
 589                     ; 252 uint8_t	cntGetType(void)
 589                     ; 253 {
 590                     .text:	section	.text,new
 591  0000               _cntGetType:
 595                     ; 256 	return debug_enable_cnt;
 597  0000 c60000        	ld	a,_debug_enable_cnt
 600  0003 81            	ret	
 623                     ; 261 uint8_t	_iouart3uLoop(void)
 623                     ; 262 {
 624                     .text:	section	.text,new
 625  0000               __iouart3uLoop:
 629                     ; 284 	return 0;
 631  0000 4f            	clr	a
 634  0001 81            	ret	
 637                     	switch	.data
 638  000b               __ioMaster:
 639  000b 00            	dc.b	0
 640  000c 00            	dc.b	0
 641  000d 00            	dc.b	0
 642  000e 0000000000    	ds.b	5
 695                     ; 292 uint8_t	_iouartLoop(void)
 695                     ; 293 {
 696                     .text:	section	.text,new
 697  0000               __iouartLoop:
 699  0000 5203          	subw	sp,#3
 700       00000003      OFST:	set	3
 703                     ; 294 	uint8_t	i = 0;
 706  0002 204f          	jra	L101
 707  0004               L77:
 708                     ; 299 		i = iouart_Ready();
 710  0004 cd0000        	call	_iouart_Ready
 712  0007 6b01          	ld	(OFST-2,sp),a
 713                     ; 302 		if( i == 2 )	
 715  0009 a102          	cp	a,#2
 716  000b 260b          	jrne	L501
 717                     ; 303 			DISP("e", 1);
 719  000d 4b01          	push	#1
 720  000f ae000e        	ldw	x,#L701
 721  0012 cd0000        	call	_uart1_tx_put
 723  0015 84            	pop	a
 724  0016 7b01          	ld	a,(OFST-2,sp)
 725  0018               L501:
 726                     ; 304 		if( i == 1 )
 728  0018 4a            	dec	a
 729  0019 2638          	jrne	L101
 730                     ; 306 			p = iouart_getReadBuffer();
 732  001b cd0000        	call	_iouart_getReadBuffer
 734  001e 1f02          	ldw	(OFST-1,sp),x
 735                     ; 307 			if( cntGetType() == 0 )
 737  0020 cd0000        	call	_cntGetType
 739  0023 4d            	tnz	a
 740  0024 2628          	jrne	L311
 741                     ; 310 				_ioMaster[4] = 1;
 743  0026 3501000f      	mov	__ioMaster+4,#1
 744                     ; 311 				cnt_ptc_check(p);
 746  002a 1e02          	ldw	x,(OFST-1,sp)
 747  002c cd0000        	call	_cnt_ptc_check
 749                     ; 313 				if (cnt_ptc_getCheckState() == STATE_COMMAND_FACTORY) {
 751  002f cd0000        	call	_cnt_ptc_getCheckState
 753  0032 a107          	cp	a,#7
 754  0034 260d          	jrne	L511
 755                     ; 314 					if( p[3] >= 100 )
 757  0036 1e02          	ldw	x,(OFST-1,sp)
 758  0038 e603          	ld	a,(3,x)
 759  003a a164          	cp	a,#100
 760                     ; 315 						return 0;
 762  003c 2442          	jruge	L721
 763                     ; 316 					return 3;
 765  003e a603          	ld	a,#3
 767  0040               L052:
 769  0040 5b03          	addw	sp,#3
 770  0042 81            	ret	
 771  0043               L511:
 772                     ; 321 				if( _ioMaster[2] == 1 )
 774  0043 c6000d        	ld	a,__ioMaster+2
 775  0046 4a            	dec	a
 776  0047 260a          	jrne	L101
 777                     ; 323 					_ioMaster[2] = 0;
 779  0049 c7000d        	ld	__ioMaster+2,a
 780                     ; 324 					if( ext_sub_ready == 1 )
 782  004c 2005          	jra	L101
 783  004e               L311:
 784                     ; 338 				sub_cnt_ptc_check(p);
 786  004e 1e02          	ldw	x,(OFST-1,sp)
 787  0050 cd0000        	call	_sub_cnt_ptc_check
 789  0053               L101:
 790                     ; 297 	while( _io_head != _io_tail )
 792  0053 c60000        	ld	a,__io_head
 793  0056 c10000        	cp	a,__io_tail
 794  0059 26a9          	jrne	L77
 795                     ; 347 	if( _ioMaster[0] != __timer1s )
 797  005b c6000b        	ld	a,__ioMaster
 798  005e c10000        	cp	a,___timer1s
 799  0061 271d          	jreq	L721
 800                     ; 349 		_ioMaster[0] = __timer1s;
 802  0063 550000000b    	mov	__ioMaster,___timer1s
 803                     ; 350 		_ioMaster[1]++;
 805  0068 725c000c      	inc	__ioMaster+1
 806                     ; 351 		if( _ioMaster[1] >= ext_sub_timeout )
 808  006c c6000c        	ld	a,__ioMaster+1
 809  006f c10009        	cp	a,_ext_sub_timeout
 810  0072 250c          	jrult	L721
 811                     ; 353 			ext_sub_timeout = 60;
 813  0074 353c0009      	mov	_ext_sub_timeout,#60
 814                     ; 354 			_ioMaster[2] = 1;
 816  0078 3501000d      	mov	__ioMaster+2,#1
 817                     ; 355 			_ioMaster[1] = 1;
 819  007c 3501000c      	mov	__ioMaster+1,#1
 820                     ; 356 			if( ext_sub_ready == 1 )
 822  0080               L721:
 823                     ; 365 	return 0;
 826  0080 4f            	clr	a
 828  0081 20bd          	jra	L052
 853                     ; 368 void	extCommax(void)
 853                     ; 369 {
 854                     .text:	section	.text,new
 855  0000               _extCommax:
 859                     ; 370 	ext_hn_ready = 1;
 861  0000 35010003      	mov	_ext_hn_ready,#1
 862                     ; 371 	hn_commax_ptc_check();
 865                     ; 372 }
 868  0004 cc0000        	jp	_hn_commax_ptc_check
 893                     ; 374 void	extClio_KR(void)
 893                     ; 375 {
 894                     .text:	section	.text,new
 895  0000               _extClio_KR:
 899                     ; 376 	ext_hn_ready = 1;
 901  0000 35010003      	mov	_ext_hn_ready,#1
 902                     ; 377 	hn_clio_ptc_check();
 905                     ; 378 }
 908  0004 cc0000        	jp	_hn_clio_ptc_check
 933                     ; 380 void	extClio_KD(void)
 933                     ; 381 {
 934                     .text:	section	.text,new
 935  0000               _extClio_KD:
 939                     ; 382 	ext_hn_ready = 1;
 941  0000 35010003      	mov	_ext_hn_ready,#1
 942                     ; 383 	hn_clio_ptc_check_KD();
 945                     ; 384 }
 948  0004 cc0000        	jp	_hn_clio_ptc_check_KD
 973                     ; 386 void extKocom(void) {
 974                     .text:	section	.text,new
 975  0000               _extKocom:
 979                     ; 387 	ext_hn_ready = 1;
 981  0000 35010003      	mov	_ext_hn_ready,#1
 982                     ; 388 	hn_kocom_ptc_check();
 985                     ; 389 }
 988  0004 cc0000        	jp	_hn_kocom_ptc_check
1013                     ; 391 void extHyundai(void) {
1014                     .text:	section	.text,new
1015  0000               _extHyundai:
1019                     ; 392 	ext_hn_ready = 1;
1021  0000 35010003      	mov	_ext_hn_ready,#1
1022                     ; 393 	hn_hyundai_ptc_check();
1025                     ; 394 }
1028  0004 cc0000        	jp	_hn_hyundai_ptc_check
1053                     ; 396 void extSeoul(void) {
1054                     .text:	section	.text,new
1055  0000               _extSeoul:
1059                     ; 397 	ext_hn_ready = 1;
1061  0000 35010003      	mov	_ext_hn_ready,#1
1062                     ; 398 	hn_seoul_ptc_check();
1065                     ; 399 }
1068  0004 cc0000        	jp	_hn_seoul_ptc_check
1071                     	switch	.data
1072  0013               __uartBr:
1073  0013 00            	dc.b	0
1074  0014 00            	dc.b	0
1075  0015 00            	dc.b	0
1076  0016 00            	dc.b	0
1077  0017 00            	dc.b	0
1078  0018 00            	dc.b	0
1079  0019 00            	dc.b	0
1080  001a 00            	dc.b	0
1081  001b               __uartHn:
1082  001b 00            	dc.b	0
1083  001c 00            	dc.b	0
1084  001d 00            	dc.b	0
1085  001e 00            	dc.b	0
1111                     ; 404 void	extB_KR(void)
1111                     ; 405 {
1112                     .text:	section	.text,new
1113  0000               _extB_KR:
1117                     ; 406 	switch (hn_type) {
1119  0000 c60000        	ld	a,_hn_type
1121                     ; 424 			break;
1122  0003 270b          	jreq	L322
1123  0005 4a            	dec	a
1124  0006 2708          	jreq	L322
1125  0008 4a            	dec	a
1126                     ; 422 		default :
1126                     ; 423 			br_kr_ptc_check();
1128                     ; 424 			break;
1130  0009 2605          	jrne	L322
1131                     ; 407 		case HN_TYPE_NONE:
1131                     ; 408 			br_kr_ptc_check();
1133                     ; 409 			break;
1135                     ; 410 		case HN_TYPE_COMMAX:
1135                     ; 411 			br_kr_ptc_check();
1137                     ; 412 			break;
1139                     ; 413 		case HN_TYPE_CLIO:
1139                     ; 414 			br_kr_ptc_check_clio();
1141  000b cd0000        	call	_br_kr_ptc_check_clio
1143                     ; 415 			break;
1145  000e 2003          	jra	L342
1146  0010               L322:
1147                     ; 416 		case HN_TYPE_HYUNDAI:
1147                     ; 417 			br_kr_ptc_check();
1149                     ; 418 			break;
1151                     ; 419 		case HN_TYPE_SEOUL:
1151                     ; 420 			br_kr_ptc_check();
1157  0010 cd0000        	call	_br_kr_ptc_check
1159                     ; 421 			break;
1161  0013               L342:
1162                     ; 428 	_uartBr[1] = 1;
1164  0013 35010014      	mov	__uartBr+1,#1
1165                     ; 430 	ext_br_ready = 1;
1167  0017 35010002      	mov	_ext_br_ready,#1
1168                     ; 431 }
1171  001b 81            	ret	
1196                     ; 433 void	extB_KD(void)
1196                     ; 434 {
1197                     .text:	section	.text,new
1198  0000               _extB_KD:
1202                     ; 435 	br_kd_ptc_check();
1204  0000 cd0000        	call	_br_kd_ptc_check
1206                     ; 437 	ext_br_ready = 1;
1208  0003 35010002      	mov	_ext_br_ready,#1
1209                     ; 438 }
1212  0007 81            	ret	
1215                     	switch	.data
1216  001f               __ping:
1217  001f 00            	dc.b	0
1218  0020 00            	dc.b	0
1219  0021 00            	dc.b	0
1243                     ; 479 void	_br_make(void)
1243                     ; 480 {
1244                     .text:	section	.text,new
1245  0000               __br_make:
1249                     ; 481 	if (hn_type == HN_TYPE_CLIO) {
1251  0000 c60000        	ld	a,_hn_type
1252  0003 a102          	cp	a,#2
1253  0005 2603          	jrne	L562
1254                     ; 482 		br_kr_ptc_make_clio();
1259  0007 cc0000        	jp	_br_kr_ptc_make_clio
1260  000a               L562:
1261                     ; 483 	} else if (hn_type == HN_TYPE_NONE) {
1263                     ; 484 		br_kr_ptc_make();
1266                     ; 486 		br_kr_ptc_make();
1270                     ; 488 }
1273  000a cc0000        	jp	_br_kr_ptc_make
1301                     ; 490 void	_uartLoopCheckMaster(void)
1301                     ; 491 {
1302                     .text:	section	.text,new
1303  0000               __uartLoopCheckMaster:
1307                     ; 492 	if( _uartBr[1] == 0 )
1309  0000 725d0014      	tnz	__uartBr+1
1310                     ; 495 		_br_make();
1313  0004 2713          	jreq	LC004
1314                     ; 500 		if( _ping[0] == 0 )
1316  0006 725d001f      	tnz	__ping
1317  000a 2610          	jrne	L113
1318                     ; 502 			_ping[0] = 1;
1320  000c 3501001f      	mov	__ping,#1
1321                     ; 503 			_ping[1] = __timer100ms;
1323  0010 5500000020    	mov	__ping+1,___timer100ms
1324                     ; 504 			_ping[2] = 0;
1326  0015 725f0021      	clr	__ping+2
1327                     ; 506 			_br_make();
1329  0019               LC004:
1334  0019 cc0000        	jp	__br_make
1335  001c               L113:
1336                     ; 510 			if( _ping[1] != __timer100ms )
1338  001c c60020        	ld	a,__ping+1
1339  001f c10000        	cp	a,___timer100ms
1340  0022 2714          	jreq	L703
1341                     ; 512 				_ping[1] = __timer100ms;
1343  0024 5500000020    	mov	__ping+1,___timer100ms
1344                     ; 513 				_ping[2]++;
1346  0029 725c0021      	inc	__ping+2
1347                     ; 514 				if( _ping[2] == 9 )
1349  002d c60021        	ld	a,__ping+2
1350  0030 a109          	cp	a,#9
1351  0032 2604          	jrne	L703
1352                     ; 516 					_ping[0] = 0;
1354  0034 725f001f      	clr	__ping
1355  0038               L703:
1356                     ; 521 }
1359  0038 81            	ret	
1383                     ; 611 void	dw_init(void)
1383                     ; 612 {
1384                     .text:	section	.text,new
1385  0000               _dw_init:
1389                     ; 613 	GPIO_Init(DW_L1_PORT, DW_L1_PIN, D_IO_OUT_TRIGER);
1391  0000 4be0          	push	#224
1392  0002 4b40          	push	#64
1393  0004 ae5005        	ldw	x,#20485
1394  0007 cd0000        	call	_GPIO_Init
1396  000a 721d5005      	bres	20485,#6
1397  000e 85            	popw	x
1398                     ; 614 	D_IO_LOW(DW_L1_PORT, DW_L1_PIN);
1400                     ; 615 	GPIO_Init(DW_L2_PORT, DW_L2_PIN, D_IO_OUT_TRIGER);
1402  000f 4be0          	push	#224
1403  0011 4b80          	push	#128
1404  0013 ae5005        	ldw	x,#20485
1405  0016 cd0000        	call	_GPIO_Init
1407  0019 721f5005      	bres	20485,#7
1408  001d 85            	popw	x
1409                     ; 616 	D_IO_LOW(DW_L2_PORT, DW_L2_PIN);
1411                     ; 623 }
1414  001e 81            	ret	
1446                     ; 625 void	dw_LaCntl(uint8_t i)
1446                     ; 626 {
1447                     .text:	section	.text,new
1448  0000               _dw_LaCntl:
1452                     ; 627 	if( i==0 )
1454  0000 4d            	tnz	a
1455  0001 2605          	jrne	L543
1456                     ; 628 		D_IO_LOW(DW_L1_PORT, DW_L1_PIN);
1458  0003 721d5005      	bres	20485,#6
1461  0007 81            	ret	
1462  0008               L543:
1463                     ; 630 		D_IO_HIGH(DW_L1_PORT, DW_L1_PIN);	
1465  0008 721c5005      	bset	20485,#6
1466                     ; 631 }
1469  000c 81            	ret	
1501                     ; 633 void	dw_LbCntl(uint8_t i)
1501                     ; 634 {
1502                     .text:	section	.text,new
1503  0000               _dw_LbCntl:
1507                     ; 635 	if( i==0 )
1509  0000 4d            	tnz	a
1510  0001 2605          	jrne	L563
1511                     ; 636 		D_IO_LOW(DW_L2_PORT, DW_L2_PIN);
1513  0003 721f5005      	bres	20485,#7
1516  0007 81            	ret	
1517  0008               L563:
1518                     ; 638 		D_IO_HIGH(DW_L2_PORT, DW_L2_PIN);	
1520  0008 721e5005      	bset	20485,#7
1521                     ; 639 }
1524  000c 81            	ret	
1550                     ; 641 void	extB_Dw(void)
1550                     ; 642 {
1551                     .text:	section	.text,new
1552  0000               _extB_Dw:
1556                     ; 643 	br_dw_ptc_check(iouart9d_getReadBuffer());
1558  0000 cd0000        	call	_iouart9d_getReadBuffer
1560  0003 cd0000        	call	_br_dw_ptc_check
1562                     ; 645 	ext_br_ready = 1;
1564  0006 35010002      	mov	_ext_br_ready,#1
1565                     ; 646 }
1568  000a 81            	ret	
1609                     ; 648 uint8_t	_ioDwLoop(void)
1609                     ; 649 {
1610                     .text:	section	.text,new
1611  0000               __ioDwLoop:
1613  0000 89            	pushw	x
1614       00000002      OFST:	set	2
1617  0001 2016          	jra	L124
1618  0003               L714:
1619                     ; 653 		if( iouart9d_Ready() == 1 )
1621  0003 cd0000        	call	_iouart9d_Ready
1623  0006 4a            	dec	a
1624  0007 260c          	jrne	L524
1625                     ; 655 			p = iouart9d_getReadBuffer();
1627  0009 cd0000        	call	_iouart9d_getReadBuffer
1629                     ; 656 			_ioMaster[5] = 1;
1631  000c 35010010      	mov	__ioMaster+5,#1
1632                     ; 657 			extB_Dw();
1634  0010 cd0000        	call	_extB_Dw
1637  0013 2004          	jra	L124
1638  0015               L524:
1639                     ; 660 			ext_br_error = 0;
1641  0015 725f0005      	clr	_ext_br_error
1642  0019               L124:
1643                     ; 651 	while( iouart9d_ReadyBuf() )
1645  0019 cd0000        	call	_iouart9d_ReadyBuf
1647  001c 4d            	tnz	a
1648  001d 26e4          	jrne	L714
1649                     ; 663 }
1652  001f 85            	popw	x
1653  0020 81            	ret	
1677                     ; 665 void	dwLoop(void)
1677                     ; 666 {
1678                     .text:	section	.text,new
1679  0000               _dwLoop:
1683                     ; 667 	br_dw_ptc_make();
1686                     ; 668 }
1689  0000 cc0000        	jp	_br_dw_ptc_make
1741                     ; 672 void	_uartLoopB(void)
1741                     ; 673 {
1742                     .text:	section	.text,new
1743  0000               __uartLoopB:
1745  0000 88            	push	a
1746       00000001      OFST:	set	1
1749  0001 202b          	jra	L164
1750  0003               L754:
1751                     ; 678 		k = uart1_get();
1753  0003 cd0000        	call	_uart1_get
1755  0006 6b01          	ld	(OFST+0,sp),a
1756                     ; 679 		_ub.t = _t1ms;
1758  0008 55000000ce    	mov	__ub,__t1ms
1759                     ; 680 		_ub.tCount = 1;
1761  000d 350100cf      	mov	__ub+1,#1
1762                     ; 681 		_ub.b[_ub.i] = k;
1764  0011 5f            	clrw	x
1765  0012 c600d0        	ld	a,__ub+2
1766  0015 97            	ld	xl,a
1767  0016 7b01          	ld	a,(OFST+0,sp)
1768  0018 d700d2        	ld	(__ub+4,x),a
1769                     ; 682 		_ub.i++;
1771  001b 725c00d0      	inc	__ub+2
1772                     ; 683 		if( _ub.i == U485_SIZE )
1774  001f c600d0        	ld	a,__ub+2
1775  0022 a150          	cp	a,#80
1776  0024 2608          	jrne	L164
1777                     ; 685 			_ub.i = 0;
1779  0026 725f00d0      	clr	__ub+2
1780                     ; 686 			_ub.tCount = 0;
1782  002a 725f00cf      	clr	__ub+1
1783  002e               L164:
1784                     ; 676 	while( uart1_Ready() )
1786  002e cd0000        	call	_uart1_Ready
1788  0031 4d            	tnz	a
1789  0032 26cf          	jrne	L754
1790                     ; 690 	ext_br_error = 0;
1792  0034 c70005        	ld	_ext_br_error,a
1793                     ; 692 	if( _ub.tCount == 1 )
1795  0037 c600cf        	ld	a,__ub+1
1796  003a 4a            	dec	a
1797  003b 2665          	jrne	L764
1798                     ; 694 		i = _t1ms;
1800  003d c60000        	ld	a,__t1ms
1801  0040 6b01          	ld	(OFST+0,sp),a
1802                     ; 695 		if( _ub.t > i )
1804  0042 c600ce        	ld	a,__ub
1805  0045 1101          	cp	a,(OFST+0,sp)
1806  0047 2306          	jrule	L174
1807                     ; 696 			k = 100 + i - _ub.t;
1809  0049 7b01          	ld	a,(OFST+0,sp)
1810  004b ab64          	add	a,#100
1812  004d 2002          	jra	L374
1813  004f               L174:
1814                     ; 698 			k = i - _ub.t;
1816  004f 7b01          	ld	a,(OFST+0,sp)
1817  0051               L374:
1818  0051 c000ce        	sub	a,__ub
1819  0054 6b01          	ld	(OFST+0,sp),a
1820                     ; 699 		if( k >= 5 )
1822  0056 a105          	cp	a,#5
1823  0058 2548          	jrult	L764
1824                     ; 702 			_ioMaster[5] = 1;
1826  005a 35010010      	mov	__ioMaster+5,#1
1827                     ; 703 			if( _ub.i == 6 )		extB_KR();
1829  005e c600d0        	ld	a,__ub+2
1830  0061 a106          	cp	a,#6
1831  0063 2605          	jrne	L774
1834  0065 cd0000        	call	_extB_KR
1837  0068 2007          	jra	L105
1838  006a               L774:
1839                     ; 704 			else if( _ub.i == 17 )	extB_KD();
1841  006a a111          	cp	a,#17
1842  006c 2603          	jrne	L105
1845  006e cd0000        	call	_extB_KD
1847  0071               L105:
1848                     ; 715 			ext_br_type = _ub.i==6 ? 1 : (_ub.i==17 ? 2 : _ub.i==8 ? 3 : 0);
1850  0071 c600d0        	ld	a,__ub+2
1851  0074 a106          	cp	a,#6
1852  0076 2604          	jrne	L214
1853  0078 a601          	ld	a,#1
1854  007a 2011          	jra	L424
1855  007c               L214:
1856  007c a111          	cp	a,#17
1857  007e 2604          	jrne	L614
1858  0080 a602          	ld	a,#2
1859  0082 2009          	jra	L424
1860  0084               L614:
1861  0084 a108          	cp	a,#8
1862  0086 2604          	jrne	L224
1863  0088 a603          	ld	a,#3
1864  008a 2001          	jra	L424
1865  008c               L224:
1866  008c 4f            	clr	a
1867  008d               L424:
1868  008d c70004        	ld	_ext_br_type,a
1869                     ; 717 			_ub.i = 0;
1871  0090 725f00d0      	clr	__ub+2
1872                     ; 718 			_ub.tCount = 0;
1874  0094 725f00cf      	clr	__ub+1
1875                     ; 719 			_ub.q = _t1ms;
1877  0098 5500000174    	mov	__ub+166,__t1ms
1878                     ; 722 			_uartBr[0] = __timer1s;
1880  009d 5500000013    	mov	__uartBr,___timer1s
1881  00a2               L764:
1882                     ; 725 	if( _ub.sendReady == 1 )
1884  00a2 c60172        	ld	a,__ub+164
1885  00a5 4a            	dec	a
1886  00a6 2621          	jrne	L505
1887                     ; 727 		if( _ub.q != _t1ms )
1889  00a8 c60174        	ld	a,__ub+166
1890  00ab c10000        	cp	a,__t1ms
1891  00ae 2719          	jreq	L505
1892                     ; 729 			_ub.q = _t1ms;
1894  00b0 5500000174    	mov	__ub+166,__t1ms
1895                     ; 730 			_ub.sendCount--;
1897  00b5 725a0173      	dec	__ub+165
1898                     ; 731 			if( _ub.sendCount == 0 )
1900  00b9 260e          	jrne	L505
1901                     ; 733 				_ub.sendReady = 0;
1903  00bb 725f0172      	clr	__ub+164
1904                     ; 734 				uart1_tx_put(_ub.r, _ub.ir);
1906  00bf ae0122        	ldw	x,#__ub+84
1907  00c2 3b00d1        	push	__ub+3
1908  00c5 cd0000        	call	_uart1_tx_put
1910  00c8 84            	pop	a
1911  00c9               L505:
1912                     ; 743 	_ioDwLoop();
1914  00c9 cd0000        	call	__ioDwLoop
1916                     ; 745 }
1919  00cc 84            	pop	a
1920  00cd 81            	ret	
1923                     	switch	.data
1924  0022               _extHn:
1925  0022 00            	dc.b	0
1926  0023               _clio15i:
1927  0023 00            	dc.b	0
1928  0024               _clio26i:
1929  0024 00            	dc.b	0
1930  0025               _clio15s:
1931  0025 00            	dc.b	0
1932  0026               _clio26s:
1933  0026 00            	dc.b	0
1934  0027               __uai:
1935  0027 00            	dc.b	0
1936  0028               __uai2:
1937  0028 00            	dc.b	0
1938  0029               __uartSeoulType:
1939  0029 00            	dc.b	0
2003                     ; 766 void	_uartLoopHome(void)
2003                     ; 767 {
2004                     .text:	section	.text,new
2005  0000               __uartLoopHome:
2007  0000 89            	pushw	x
2008       00000002      OFST:	set	2
2011  0001 cc00e2        	jra	L735
2012  0004               L535:
2013                     ; 774 		k = uart3_get();
2015  0004 cd0000        	call	_uart3_get
2017  0007 6b01          	ld	(OFST-1,sp),a
2018                     ; 776 		loopTta(k);
2020  0009 cd0000        	call	_loopTta
2022                     ; 777 		_ua.t = _t1ms;
2024  000c 5500000175    	mov	__ua,__t1ms
2025                     ; 778 		_ua.tCount = 1;
2027  0011 35010176      	mov	__ua+1,#1
2028                     ; 779 		_ua.b[_ua.i] = k;
2030  0015 5f            	clrw	x
2031  0016 c60177        	ld	a,__ua+2
2032  0019 97            	ld	xl,a
2033  001a 7b01          	ld	a,(OFST-1,sp)
2034  001c d70179        	ld	(__ua+4,x),a
2035                     ; 780 		_ua.i++;
2037  001f 725c0177      	inc	__ua+2
2038                     ; 782 		if( _ua.i == U485_SIZE )
2040  0023 c60177        	ld	a,__ua+2
2041  0026 a150          	cp	a,#80
2042  0028 2608          	jrne	L345
2043                     ; 784 			_ua.i = 0;
2045  002a 725f0177      	clr	__ua+2
2046                     ; 785 			_ua.tCount = 0;
2048  002e 725f0176      	clr	__ua+1
2049  0032               L345:
2050                     ; 788 		if( clio15s == 0 )
2052  0032 c60025        	ld	a,_clio15s
2053  0035 2613          	jrne	L545
2054                     ; 791 			if( k == 0x77 )
2056  0037 7b01          	ld	a,(OFST-1,sp)
2057  0039 a177          	cp	a,#119
2058  003b 264d          	jrne	L155
2059                     ; 793 				clio15s = 1;
2061  003d 35010025      	mov	_clio15s,#1
2062                     ; 794 				clio15i = 0;
2064  0041 725f0023      	clr	_clio15i
2065                     ; 795 				clio15buf[clio15i] = k;
2067  0045 c7001a        	ld	_clio15buf,a
2068  0048 2040          	jra	L155
2069  004a               L545:
2070                     ; 798 		else if( clio15s == 1 )
2072  004a 4a            	dec	a
2073  004b 263d          	jrne	L155
2074                     ; 800 			clio15i++;
2076  004d 725c0023      	inc	_clio15i
2077                     ; 801 			clio15buf[clio15i] = k;
2079  0051 5f            	clrw	x
2080  0052 c60023        	ld	a,_clio15i
2081  0055 97            	ld	xl,a
2082  0056 7b01          	ld	a,(OFST-1,sp)
2083  0058 d7001a        	ld	(_clio15buf,x),a
2084                     ; 802 			if( clio15i == 14 )
2086  005b c60023        	ld	a,_clio15i
2087  005e a10e          	cp	a,#14
2088  0060 2628          	jrne	L155
2089                     ; 804 				clio15s = 0;
2091  0062 725f0025      	clr	_clio15s
2092                     ; 805 				if( k == 0xe7 )
2094  0066 7b01          	ld	a,(OFST-1,sp)
2095  0068 a1e7          	cp	a,#231
2096  006a 261e          	jrne	L155
2097                     ; 808 					for( i=0; i<15; i++ )
2099  006c 4f            	clr	a
2100  006d 6b02          	ld	(OFST+0,sp),a
2101  006f               L165:
2102                     ; 810 						_ua.b[i] = clio15buf[i];
2104  006f 5f            	clrw	x
2105  0070 97            	ld	xl,a
2106  0071 d6001a        	ld	a,(_clio15buf,x)
2107  0074 d70179        	ld	(__ua+4,x),a
2108                     ; 808 					for( i=0; i<15; i++ )
2110  0077 0c02          	inc	(OFST+0,sp)
2113  0079 7b02          	ld	a,(OFST+0,sp)
2114  007b a10f          	cp	a,#15
2115  007d 25f0          	jrult	L165
2116                     ; 812 					_ua.i = 15;
2118  007f 350f0177      	mov	__ua+2,#15
2119                     ; 813 					_ua.tCount = 1;
2121  0083 35010176      	mov	__ua+1,#1
2122                     ; 814 					extClio_KD();
2124  0087 cd0000        	call	_extClio_KD
2126  008a               L155:
2127                     ; 820 		if( clio26s == 0 )
2129  008a c60026        	ld	a,_clio26s
2130  008d 2613          	jrne	L765
2131                     ; 823 			if( k == 0x7e )
2133  008f 7b01          	ld	a,(OFST-1,sp)
2134  0091 a17e          	cp	a,#126
2135  0093 264d          	jrne	L735
2136                     ; 825 				clio26s = 1;
2138  0095 35010026      	mov	_clio26s,#1
2139                     ; 826 				clio26i = 0;
2141  0099 725f0024      	clr	_clio26i
2142                     ; 827 				clio26buf[clio26i] = k;
2144  009d c70000        	ld	_clio26buf,a
2145  00a0 2040          	jra	L735
2146  00a2               L765:
2147                     ; 830 		else if( clio26s == 1 )
2149  00a2 4a            	dec	a
2150  00a3 263d          	jrne	L735
2151                     ; 832 			clio26i++;
2153  00a5 725c0024      	inc	_clio26i
2154                     ; 833 			clio26buf[clio26i] = k;
2156  00a9 5f            	clrw	x
2157  00aa c60024        	ld	a,_clio26i
2158  00ad 97            	ld	xl,a
2159  00ae 7b01          	ld	a,(OFST-1,sp)
2160  00b0 d70000        	ld	(_clio26buf,x),a
2161                     ; 834 			if( clio26i == 25 )
2163  00b3 c60024        	ld	a,_clio26i
2164  00b6 a119          	cp	a,#25
2165  00b8 2628          	jrne	L735
2166                     ; 836 				clio26s = 0;
2168  00ba 725f0026      	clr	_clio26s
2169                     ; 837 				if( k == 0xaa )
2171  00be 7b01          	ld	a,(OFST-1,sp)
2172  00c0 a1aa          	cp	a,#170
2173  00c2 261e          	jrne	L735
2174                     ; 840 					for( i=0; i<26; i++ )
2176  00c4 4f            	clr	a
2177  00c5 6b02          	ld	(OFST+0,sp),a
2178  00c7               L306:
2179                     ; 842 						_ua.b[i] = clio26buf[i];
2181  00c7 5f            	clrw	x
2182  00c8 97            	ld	xl,a
2183  00c9 d60000        	ld	a,(_clio26buf,x)
2184  00cc d70179        	ld	(__ua+4,x),a
2185                     ; 840 					for( i=0; i<26; i++ )
2187  00cf 0c02          	inc	(OFST+0,sp)
2190  00d1 7b02          	ld	a,(OFST+0,sp)
2191  00d3 a11a          	cp	a,#26
2192  00d5 25f0          	jrult	L306
2193                     ; 844 					_ua.i = 26;
2195  00d7 351a0177      	mov	__ua+2,#26
2196                     ; 845 					_ua.tCount = 1;
2198  00db 35010176      	mov	__ua+1,#1
2199                     ; 846 					extClio_KR();
2201  00df cd0000        	call	_extClio_KR
2203  00e2               L735:
2204                     ; 772 	while( uart3_Ready() )
2206  00e2 cd0000        	call	_uart3_Ready
2208  00e5 4d            	tnz	a
2209  00e6 2703cc0004    	jrne	L535
2210                     ; 853 	ext_hn_error = 0;
2212  00eb c70006        	ld	_ext_hn_error,a
2213                     ; 855 	if( _ua.tCount == 1 )
2215  00ee c60176        	ld	a,__ua+1
2216  00f1 4a            	dec	a
2217  00f2 2703cc02be    	jrne	L116
2218                     ; 857 		i = _t1ms;
2220  00f7 c60000        	ld	a,__t1ms
2221  00fa 6b02          	ld	(OFST+0,sp),a
2222                     ; 858 		if( _ua.t > i )
2224  00fc c60175        	ld	a,__ua
2225  00ff 1102          	cp	a,(OFST+0,sp)
2226  0101 2306          	jrule	L316
2227                     ; 859 			k = 100 + i - _ua.t;
2229  0103 7b02          	ld	a,(OFST+0,sp)
2230  0105 ab64          	add	a,#100
2232  0107 2002          	jra	L516
2233  0109               L316:
2234                     ; 861 			k = i - _ua.t;
2236  0109 7b02          	ld	a,(OFST+0,sp)
2237  010b               L516:
2238  010b c00175        	sub	a,__ua
2239  010e 6b01          	ld	(OFST-1,sp),a
2240                     ; 863 		if( k >= 5 )
2242  0110 a105          	cp	a,#5
2243  0112 257b          	jrult	L716
2244  0114               L315:
2245                     ; 865 PacketEntry: 
2245                     ; 866 			ext_hn_error = 0;
2247  0114 725f0006      	clr	_ext_hn_error
2248                     ; 868 			if (_uartSeoulType == 1) {
2250  0118 c60029        	ld	a,__uartSeoulType
2251  011b 4a            	dec	a
2252  011c 2615          	jrne	L126
2253                     ; 869 				if (_ua.i == 4) {	extSeoul();	} 
2255  011e c60177        	ld	a,__ua+2
2256  0121 a104          	cp	a,#4
2257  0123 2605          	jrne	L326
2260  0125 cd0000        	call	_extSeoul
2263  0128 2050          	jra	L136
2264  012a               L326:
2265                     ; 870 				else if (_ua.i == 8) {	extSeoul(); }
2267  012a a108          	cp	a,#8
2268  012c 264c          	jrne	L136
2271  012e cd0000        	call	_extSeoul
2273  0131 2047          	jra	L136
2274  0133               L126:
2275                     ; 879 				if( _ua.i == 8 ) { extCommax();	}
2277  0133 c60177        	ld	a,__ua+2
2278  0136 a108          	cp	a,#8
2279  0138 2605          	jrne	L336
2282  013a cd0000        	call	_extCommax
2285  013d 203b          	jra	L136
2286  013f               L336:
2287                     ; 880 				else if( _ua.i == 26 ) { extClio_KR(); }
2289  013f a11a          	cp	a,#26
2290  0141 2605          	jrne	L736
2293  0143 cd0000        	call	_extClio_KR
2296  0146 2032          	jra	L136
2297  0148               L736:
2298                     ; 881 				else if( _ua.i == 15 ) { extClio_KD(); }
2300  0148 a10f          	cp	a,#15
2301  014a 2605          	jrne	L346
2304  014c cd0000        	call	_extClio_KD
2307  014f 2029          	jra	L136
2308  0151               L346:
2309                     ; 882 				else if( _ua.i == 21 ) { extKocom(); }
2311  0151 a115          	cp	a,#21
2312  0153 2605          	jrne	L746
2315  0155 cd0000        	call	_extKocom
2318  0158 2020          	jra	L136
2319  015a               L746:
2320                     ; 883 				else if( _ua.i == 11 ) { extHyundai(); }
2322  015a a10b          	cp	a,#11
2323  015c 2605          	jrne	L356
2326  015e cd0000        	call	_extHyundai
2329  0161 2017          	jra	L136
2330  0163               L356:
2331                     ; 884 				else if (_ua.i == 4) {	
2333  0163 a104          	cp	a,#4
2334  0165 2609          	jrne	L756
2335                     ; 885 					_uartSeoulType = 1;	
2337  0167 35010029      	mov	__uartSeoulType,#1
2338                     ; 886 					systemUart3ChangeEvenParity();
2340  016b cd0000        	call	_systemUart3ChangeEvenParity
2343  016e 200a          	jra	L136
2344  0170               L756:
2345                     ; 891 					if( _ua.i >= 15 )
2347  0170 a10f          	cp	a,#15
2348  0172 2506          	jrult	L136
2349                     ; 893 						if( extHn == 0 )
2351  0174 725d0022      	tnz	_extHn
2352  0178 271d          	jreq	L515
2353                     ; 895 							goto CLIO_ENTRY;
2355  017a               L136:
2356                     ; 901 			_ua.i = 0;
2358  017a 725f0177      	clr	__ua+2
2359                     ; 902 			_ua.tCount = 0;
2361  017e 725f0176      	clr	__ua+1
2362                     ; 903 			_ua.q = _t1ms;
2364  0182 550000021b    	mov	__ua+166,__t1ms
2365                     ; 904 			_uai = 0;
2367  0187 725f0027      	clr	__uai
2368                     ; 905 			_uai2 = 0;
2370  018b 725f0028      	clr	__uai2
2371  018f               L716:
2372                     ; 909 		if( extHn == 0 )
2374  018f c60022        	ld	a,_extHn
2375  0192 2644          	jrne	L766
2376  0194 c60177        	ld	a,__ua+2
2377  0197               L515:
2378                     ; 911 CLIO_ENTRY:	
2378                     ; 912 			if( _ua.i >= 15 )
2380  0197 a10f          	cp	a,#15
2381  0199 253d          	jrult	L766
2382                     ; 914 				for( i=0; i<_ua.i; i++ )
2384  019b 0f02          	clr	(OFST+0,sp)
2386  019d 2032          	jra	L776
2387  019f               L376:
2388                     ; 916 					if( _ua.b[i] == 0x77 )
2390  019f cd02f5        	call	LC005
2391  01a2 a177          	cp	a,#119
2392  01a4 2611          	jrne	L307
2393                     ; 918 						if( _ua.b[i+14] == 0xe7 )
2395  01a6 7b02          	ld	a,(OFST+0,sp)
2396  01a8 5f            	clrw	x
2397  01a9 97            	ld	xl,a
2398  01aa d60187        	ld	a,(__ua+18,x)
2399  01ad a1e7          	cp	a,#231
2400  01af 261e          	jrne	L707
2401                     ; 920 							extHn = 15;
2403  01b1 350f0022      	mov	_extHn,#15
2404  01b5 2018          	jra	L707
2405  01b7               L307:
2406                     ; 923 					else if( _ua.b[i] == 0x7e )
2408  01b7 7b02          	ld	a,(OFST+0,sp)
2409  01b9 cd02f5        	call	LC005
2410  01bc a17e          	cp	a,#126
2411  01be 260f          	jrne	L707
2412                     ; 925 						if( _ua.b[i+25] == 0xaa )
2414  01c0 7b02          	ld	a,(OFST+0,sp)
2415  01c2 5f            	clrw	x
2416  01c3 97            	ld	xl,a
2417  01c4 d60192        	ld	a,(__ua+29,x)
2418  01c7 a1aa          	cp	a,#170
2419  01c9 2604          	jrne	L707
2420                     ; 927 							extHn = 26;
2422  01cb 351a0022      	mov	_extHn,#26
2423  01cf               L707:
2424                     ; 914 				for( i=0; i<_ua.i; i++ )
2426  01cf 0c02          	inc	(OFST+0,sp)
2427  01d1               L776:
2430  01d1 7b02          	ld	a,(OFST+0,sp)
2431  01d3 c10177        	cp	a,__ua+2
2432  01d6 25c7          	jrult	L376
2433  01d8               L766:
2434                     ; 952 		if( extHn == 26 )
2436  01d8 c60022        	ld	a,_extHn
2437  01db a11a          	cp	a,#26
2438  01dd 266c          	jrne	L517
2439                     ; 956 			if( _ua.i > 26 )
2441  01df c60177        	ld	a,__ua+2
2442  01e2 a11b          	cp	a,#27
2443  01e4 2565          	jrult	L517
2444                     ; 958 				 if( _uai != _ua.i )
2446  01e6 c60027        	ld	a,__uai
2447  01e9 c10177        	cp	a,__ua+2
2448  01ec 275d          	jreq	L517
2449                     ; 960 						_uai = _ua.i;
2451  01ee 5501770027    	mov	__uai,__ua+2
2452                     ; 961 						for( i=_uai2; i<_uai; i++ )
2454  01f3 c60028        	ld	a,__uai2
2455  01f6 6b02          	ld	(OFST+0,sp),a
2457  01f8 2047          	jra	L727
2458  01fa               L327:
2459                     ; 963 						  if( _ua.b[i] != 0xAA )
2461  01fa cd02f5        	call	LC005
2462  01fd a1aa          	cp	a,#170
2463  01ff 263c          	jrne	L527
2464                     ; 964 								continue;
2466                     ; 966 							if( i >= 25 )
2468  0201 7b02          	ld	a,(OFST+0,sp)
2469  0203 a119          	cp	a,#25
2470  0205 2536          	jrult	L527
2471                     ; 968 								if( _ua.b[i-25] == 0x7E )
2473  0207 5f            	clrw	x
2474  0208 97            	ld	xl,a
2475  0209 1d0019        	subw	x,#25
2476  020c d60179        	ld	a,(__ua+4,x)
2477  020f a17e          	cp	a,#126
2478  0211 262a          	jrne	L527
2479                     ; 970 									 for( k=0; k<26; k++ )
2481  0213 4f            	clr	a
2482  0214 6b01          	ld	(OFST-1,sp),a
2483  0216               L147:
2484                     ; 972 											_ua.b[k] = _ua.b[i-25+k]; 
2486  0216 5f            	clrw	x
2487  0217 97            	ld	xl,a
2488  0218 89            	pushw	x
2489  0219 7b04          	ld	a,(OFST+2,sp)
2490  021b 5f            	clrw	x
2491  021c 97            	ld	xl,a
2492  021d 1d0019        	subw	x,#25
2493  0220 01            	rrwa	x,a
2494  0221 1b03          	add	a,(OFST+1,sp)
2495  0223 2401          	jrnc	L664
2496  0225 5c            	incw	x
2497  0226               L664:
2498  0226 02            	rlwa	x,a
2499  0227 d60179        	ld	a,(__ua+4,x)
2500  022a 85            	popw	x
2501  022b d70179        	ld	(__ua+4,x),a
2502                     ; 970 									 for( k=0; k<26; k++ )
2504  022e 0c01          	inc	(OFST-1,sp)
2507  0230 7b01          	ld	a,(OFST-1,sp)
2508  0232 a11a          	cp	a,#26
2509  0234 25e0          	jrult	L147
2510                     ; 974 									 _ua.i = 26;
2512  0236 351a0177      	mov	__ua+2,#26
2513                     ; 975 									 goto PacketEntry;
2515  023a cc0114        	jra	L315
2516  023d               L527:
2517                     ; 961 						for( i=_uai2; i<_uai; i++ )
2519  023d 0c02          	inc	(OFST+0,sp)
2520  023f 7b02          	ld	a,(OFST+0,sp)
2521  0241               L727:
2524  0241 c10027        	cp	a,__uai
2525  0244 25b4          	jrult	L327
2526                     ; 979 						_uai2 = _uai;
2528  0246 5500270028    	mov	__uai2,__uai
2529  024b               L517:
2530                     ; 983 		if( extHn == 15 )
2532  024b c60022        	ld	a,_extHn
2533  024e a10f          	cp	a,#15
2534  0250 266c          	jrne	L116
2535                     ; 987 			if( _ua.i > 15 )
2537  0252 c60177        	ld	a,__ua+2
2538  0255 a110          	cp	a,#16
2539  0257 2565          	jrult	L116
2540                     ; 989 				 if( _uai != _ua.i )
2542  0259 c60027        	ld	a,__uai
2543  025c c10177        	cp	a,__ua+2
2544  025f 275d          	jreq	L116
2545                     ; 991 						_uai = _ua.i;
2547  0261 5501770027    	mov	__uai,__ua+2
2548                     ; 992 						for( i=_uai2; i<_uai; i++ )
2550  0266 c60028        	ld	a,__uai2
2551  0269 6b02          	ld	(OFST+0,sp),a
2553  026b 2047          	jra	L167
2554  026d               L557:
2555                     ; 994 						  if( _ua.b[i] != 0xE7 )
2557  026d cd02f5        	call	LC005
2558  0270 a1e7          	cp	a,#231
2559  0272 263c          	jrne	L757
2560                     ; 995 								continue;
2562                     ; 997 							if( i >= 14 )
2564  0274 7b02          	ld	a,(OFST+0,sp)
2565  0276 a10e          	cp	a,#14
2566  0278 2536          	jrult	L757
2567                     ; 999 								if( _ua.b[i-14] == 0x77 /*&& _ua.b[i-13] == 0x81*/ )
2569  027a 5f            	clrw	x
2570  027b 97            	ld	xl,a
2571  027c 1d000e        	subw	x,#14
2572  027f d60179        	ld	a,(__ua+4,x)
2573  0282 a177          	cp	a,#119
2574  0284 262a          	jrne	L757
2575                     ; 1001 									 for( k=0; k<15; k++ )
2577  0286 4f            	clr	a
2578  0287 6b01          	ld	(OFST-1,sp),a
2579  0289               L377:
2580                     ; 1003 											_ua.b[k] = _ua.b[i-14+k]; 
2582  0289 5f            	clrw	x
2583  028a 97            	ld	xl,a
2584  028b 89            	pushw	x
2585  028c 7b04          	ld	a,(OFST+2,sp)
2586  028e 5f            	clrw	x
2587  028f 97            	ld	xl,a
2588  0290 1d000e        	subw	x,#14
2589  0293 01            	rrwa	x,a
2590  0294 1b03          	add	a,(OFST+1,sp)
2591  0296 2401          	jrnc	L074
2592  0298 5c            	incw	x
2593  0299               L074:
2594  0299 02            	rlwa	x,a
2595  029a d60179        	ld	a,(__ua+4,x)
2596  029d 85            	popw	x
2597  029e d70179        	ld	(__ua+4,x),a
2598                     ; 1001 									 for( k=0; k<15; k++ )
2600  02a1 0c01          	inc	(OFST-1,sp)
2603  02a3 7b01          	ld	a,(OFST-1,sp)
2604  02a5 a10f          	cp	a,#15
2605  02a7 25e0          	jrult	L377
2606                     ; 1005 									 _ua.i = 15;
2608  02a9 350f0177      	mov	__ua+2,#15
2609                     ; 1006 									 goto PacketEntry;
2611  02ad cc0114        	jra	L315
2612  02b0               L757:
2613                     ; 992 						for( i=_uai2; i<_uai; i++ )
2615  02b0 0c02          	inc	(OFST+0,sp)
2616  02b2 7b02          	ld	a,(OFST+0,sp)
2617  02b4               L167:
2620  02b4 c10027        	cp	a,__uai
2621  02b7 25b4          	jrult	L557
2622                     ; 1010 						_uai2 = _uai;
2624  02b9 5500270028    	mov	__uai2,__uai
2625  02be               L116:
2626                     ; 1015 	if( _ua.sendReady == 1 )
2628  02be c60219        	ld	a,__ua+164
2629  02c1 4a            	dec	a
2630  02c2 2621          	jrne	L1001
2631                     ; 1017 		if( _ua.q != _t1ms )
2633  02c4 c6021b        	ld	a,__ua+166
2634  02c7 c10000        	cp	a,__t1ms
2635  02ca 2719          	jreq	L1001
2636                     ; 1019 			_ua.q = _t1ms;
2638  02cc 550000021b    	mov	__ua+166,__t1ms
2639                     ; 1020 			_ua.sendCount--;
2641  02d1 725a021a      	dec	__ua+165
2642                     ; 1021 			if( _ua.sendCount == 0 )
2644  02d5 260e          	jrne	L1001
2645                     ; 1023 				_ua.sendReady = 0;
2647  02d7 725f0219      	clr	__ua+164
2648                     ; 1024 				uart3_tx_put(_ua.r, _ua.ir);
2650  02db ae01c9        	ldw	x,#__ua+84
2651  02de 3b0178        	push	__ua+3
2652  02e1 cd0000        	call	_uart3_tx_put
2654  02e4 84            	pop	a
2655                     ; 1025 				if( hn_type == HN_TYPE_KOCOM )
2657  02e5               L1001:
2658                     ; 1033 	if( hn_type == HN_TYPE_KOCOM )
2660  02e5 c60000        	ld	a,_hn_type
2661  02e8 a104          	cp	a,#4
2662  02ea 2604          	jrne	L1101
2663                     ; 1035 		hn_kocom_cb(0);
2665  02ec 4f            	clr	a
2666  02ed cd0000        	call	_hn_kocom_cb
2668  02f0               L1101:
2669                     ; 1038 	loopTtaCb();
2671  02f0 cd0000        	call	_loopTtaCb
2673                     ; 1039 }
2676  02f3 85            	popw	x
2677  02f4 81            	ret	
2678  02f5               LC005:
2679  02f5 5f            	clrw	x
2680  02f6 97            	ld	xl,a
2681  02f7 d60179        	ld	a,(__ua+4,x)
2682  02fa 81            	ret	
2729                     ; 1047 void	_uartLoop(void)
2729                     ; 1048 {
2730                     .text:	section	.text,new
2731  0000               __uartLoop:
2733  0000 88            	push	a
2734       00000001      OFST:	set	1
2737                     ; 1056 	_uartLoopB();
2739  0001 cd0000        	call	__uartLoopB
2741                     ; 1060 	if( _uartBr[1] == 1 )
2743  0004 c60014        	ld	a,__uartBr+1
2744  0007 4a            	dec	a
2745                     ; 1062 		_uartLoopCheckMaster();
2748  0008 2722          	jreq	LC006
2749                     ; 1066 		i = __timer1s;
2751  000a c60000        	ld	a,___timer1s
2752  000d 6b01          	ld	(OFST+0,sp),a
2753                     ; 1067 		if( i >= _uartBr[0] )
2755  000f c60013        	ld	a,__uartBr
2756  0012 1101          	cp	a,(OFST+0,sp)
2757  0014 2204          	jrugt	L5301
2758                     ; 1068 			i = i - _uartBr[0];
2760  0016 7b01          	ld	a,(OFST+0,sp)
2762  0018 2004          	jra	L7301
2763  001a               L5301:
2764                     ; 1070 			i = 60 + i - _uartBr[0];
2766  001a 7b01          	ld	a,(OFST+0,sp)
2767  001c ab3c          	add	a,#60
2768  001e               L7301:
2769  001e c00013        	sub	a,__uartBr
2770  0021 6b01          	ld	(OFST+0,sp),a
2771                     ; 1072 		if( i > 5 )
2773  0023 a106          	cp	a,#6
2774  0025 2508          	jrult	L3301
2775                     ; 1087 			_uartBr[0] = __timer1s;
2777  0027 5500000013    	mov	__uartBr,___timer1s
2778                     ; 1088 			_uartLoopCheckMaster();
2780  002c               LC006:
2782  002c cd0000        	call	__uartLoopCheckMaster
2784  002f               L3301:
2785                     ; 1091 	if( ext_br_error == 1 )
2787  002f c60005        	ld	a,_ext_br_error
2788  0032 4a            	dec	a
2789  0033 2624          	jrne	L3401
2790                     ; 1096 		if( _uartBr[6] == 1 )
2792  0035 c60019        	ld	a,__uartBr+6
2793  0038 4a            	dec	a
2794  0039 261a          	jrne	L5401
2795                     ; 1098 			_uartBr[6] = 0;
2797  003b c70019        	ld	__uartBr+6,a
2798                     ; 1099 			if( ext_br_ready == 1 )
2800  003e c60002        	ld	a,_ext_br_ready
2801  0041 4a            	dec	a
2802  0042 2611          	jrne	L5401
2803                     ; 1101 				if( funcInfo.error_type == ERROR_TYPE_CNT && funcInfo.error == 3 )
2805  0044 c60009        	ld	a,_funcInfo+9
2806  0047 a102          	cp	a,#2
2807  0049 260a          	jrne	L5401
2809  004b c60008        	ld	a,_funcInfo+8
2810  004e a103          	cp	a,#3
2811  0050 2603          	jrne	L5401
2812                     ; 1102 					func_cnt_errorReset();
2814  0052 cd0000        	call	_func_cnt_errorReset
2816  0055               L5401:
2817                     ; 1105 		_uartBr[4] = 0;
2819  0055 725f0017      	clr	__uartBr+4
2820  0059               L3401:
2821                     ; 1108 	if( _uartBr[5] != __timer1s )
2823  0059 c60018        	ld	a,__uartBr+5
2824  005c c10000        	cp	a,___timer1s
2825  005f 2729          	jreq	L3501
2826                     ; 1110 		_uartBr[5] = __timer1s;
2828  0061 5500000018    	mov	__uartBr+5,___timer1s
2829                     ; 1111 		_uartBr[4]++;
2831  0066 725c0017      	inc	__uartBr+4
2832                     ; 1112 		if( _uartBr[4] >= ext_br_timeout )
2834  006a c60017        	ld	a,__uartBr+4
2835  006d c10007        	cp	a,_ext_br_timeout
2836  0070 2518          	jrult	L3501
2837                     ; 1114 			ext_br_timeout = 60;
2839  0072 353c0007      	mov	_ext_br_timeout,#60
2840                     ; 1115 			_uartBr[6] = 1;
2842  0076 35010019      	mov	__uartBr+6,#1
2843                     ; 1116 			_uartBr[4] = 0;
2845  007a 725f0017      	clr	__uartBr+4
2846                     ; 1117 			if( ext_br_ready == 1 )
2848  007e c60002        	ld	a,_ext_br_ready
2849  0081 4a            	dec	a
2850  0082 2606          	jrne	L3501
2851                     ; 1118 				func_cnt_error(ERROR_TYPE_CNT, 3);
2853  0084 ae0203        	ldw	x,#515
2854  0087 cd0000        	call	_func_cnt_error
2856  008a               L3501:
2857                     ; 1124 	_uartLoopHome();
2859  008a cd0000        	call	__uartLoopHome
2861                     ; 1129 	if( _uartHn[3] == 1 )
2863  008d c6001e        	ld	a,__uartHn+3
2864  0090 4a            	dec	a
2865  0091 2608          	jrne	L1601
2866                     ; 1131 		if( ext_hn_error == 1 )
2868  0093 c60006        	ld	a,_ext_hn_error
2869  0096 4a            	dec	a
2870  0097 260f          	jrne	L1701
2871  0099 204d          	jra	L3101
2872  009b               L1601:
2873                     ; 1148 		if( ext_hn_error == 1 )
2875  009b c60006        	ld	a,_ext_hn_error
2876  009e 4a            	dec	a
2877  009f 2607          	jrne	L1701
2878                     ; 1151 			_ioMaster[6] = 1;
2880  00a1 35010011      	mov	__ioMaster+6,#1
2881                     ; 1152 			_uartHn[2] = 0;
2883  00a5 c7001d        	ld	__uartHn+2,a
2884  00a8               L1701:
2885                     ; 1156 	if( _uartHn[0] != __timer1s )
2887  00a8 c6001b        	ld	a,__uartHn
2888  00ab c10000        	cp	a,___timer1s
2889  00ae 276a          	jreq	L5701
2890                     ; 1158 		_uartHn[0] = __timer1s;
2892  00b0 550000001b    	mov	__uartHn,___timer1s
2893                     ; 1159 		_uartHn[1]++;
2895  00b5 725c001c      	inc	__uartHn+1
2896                     ; 1160 		_uartHn[2]++;
2898  00b9 725c001d      	inc	__uartHn+2
2899                     ; 1161 		if( _uartHn[2] == 30 )
2901  00bd c6001d        	ld	a,__uartHn+2
2902  00c0 a11e          	cp	a,#30
2903  00c2 261d          	jrne	L7701
2904                     ; 1163 			_uartHn[3] = 1;
2906  00c4 3501001e      	mov	__uartHn+3,#1
2907                     ; 1164 			if( ext_hn_ready == 1 )
2909  00c8 c60003        	ld	a,_ext_hn_ready
2910  00cb 4a            	dec	a
2911  00cc 264c          	jrne	L5701
2912                     ; 1166 				if( _uartHn[1] == 30 )
2914  00ce c6001c        	ld	a,__uartHn+1
2915  00d1 a11e          	cp	a,#30
2916  00d3 2606          	jrne	L3011
2917                     ; 1168 					func_cnt_error(ERROR_TYPE_CNT, 98);
2919  00d5 ae0262        	ldw	x,#610
2920  00d8 cd0000        	call	_func_cnt_error
2922  00db               L3011:
2923                     ; 1171 				_uartHn[1] = 31;
2925  00db 351f001c      	mov	__uartHn+1,#31
2926  00df 2039          	jra	L5701
2927  00e1               L7701:
2928                     ; 1174 		else if( _uartHn[2] == 90 )
2930  00e1 c6001d        	ld	a,__uartHn+2
2931  00e4 a15a          	cp	a,#90
2932  00e6 2625          	jrne	L7011
2933                     ; 1176 			goto HN_RECOVER_ENTRY;
2934  00e8               L3101:
2935                     ; 1133 HN_RECOVER_ENTRY:
2935                     ; 1134 			//	light on
2935                     ; 1135 			_ioMaster[6] = 1;
2937  00e8 35010011      	mov	__ioMaster+6,#1
2938                     ; 1136 			_uartHn[3] = 0;
2940  00ec 725f001e      	clr	__uartHn+3
2941                     ; 1137 			_uartHn[2] = HN_OPENED;
2943  00f0 35c7001d      	mov	__uartHn+2,#199
2944                     ; 1138 			if( ext_hn_ready == 1 )
2946  00f4 c60003        	ld	a,_ext_hn_ready
2947  00f7 4a            	dec	a
2948  00f8 26ae          	jrne	L1701
2949                     ; 1140 				if( funcInfo.error_type == ERROR_TYPE_CNT && funcInfo.error == 98 )
2951  00fa c60009        	ld	a,_funcInfo+9
2952  00fd a102          	cp	a,#2
2953  00ff 26a7          	jrne	L1701
2955  0101 c60008        	ld	a,_funcInfo+8
2956  0104 a162          	cp	a,#98
2957  0106 26a0          	jrne	L1701
2958                     ; 1141 					func_cnt_errorReset();
2960  0108 cd0000        	call	_func_cnt_errorReset
2962  010b 209b          	jra	L1701
2963  010d               L7011:
2964                     ; 1180 			if( _uartHn[2] >= HN_OPENED )
2966  010d c6001d        	ld	a,__uartHn+2
2967  0110 a1c7          	cp	a,#199
2968  0112 2506          	jrult	L5701
2969                     ; 1182 				_uartHn[2] = HN_OPENED;
2971  0114 35c7001d      	mov	__uartHn+2,#199
2972                     ; 1183 				return;
2975  0118 84            	pop	a
2976  0119 81            	ret	
2977  011a               L5701:
2978                     ; 1188 }
2981  011a 84            	pop	a
2982  011b 81            	ret	
3014                     ; 1193 void	relayCntl(uint8_t i)
3014                     ; 1194 {
3015                     .text:	section	.text,new
3016  0000               _relayCntl:
3020                     ; 1195 	if( i==0 )
3022  0000 4d            	tnz	a
3023  0001 2605          	jrne	L1311
3024                     ; 1196 		D_IO_LOW(D_RELAY_PORT, D_RELAY_PIN);
3026  0003 72175000      	bres	20480,#3
3029  0007 81            	ret	
3030  0008               L1311:
3031                     ; 1198 		D_IO_HIGH(D_RELAY_PORT, D_RELAY_PIN);
3033  0008 72165000      	bset	20480,#3
3034                     ; 1199 }
3037  000c 81            	ret	
3062                     ; 1201 void	uart_Open(void)
3062                     ; 1202 {
3063                     .text:	section	.text,new
3064  0000               _uart_Open:
3068                     ; 1203 	_ua.t = 0;
3070  0000 725f0175      	clr	__ua
3071                     ; 1204 	_ua.tCount = 0;
3073  0004 725f0176      	clr	__ua+1
3074                     ; 1205 	_ua.i = 0;
3076  0008 725f0177      	clr	__ua+2
3077                     ; 1206 	_ua.sendReady = 0;
3079  000c 725f0219      	clr	__ua+164
3080                     ; 1208 	_ub.t = 0;
3082  0010 725f00ce      	clr	__ub
3083                     ; 1209 	_ub.tCount = 0;
3085  0014 725f00cf      	clr	__ub+1
3086                     ; 1210 	_ub.i = 0;
3088  0018 725f00d0      	clr	__ub+2
3089                     ; 1211 	_ub.sendReady = 0;
3091  001c 725f0172      	clr	__ub+164
3092                     ; 1212 }
3095  0020 81            	ret	
3129                     ; 1214 void cnt_chnage_rc_set(int room) {
3130                     .text:	section	.text,new
3131  0000               _cnt_chnage_rc_set:
3135                     ; 1215 	if ( hn_type == HN_TYPE_KOCOM ) {
3137  0000 c60000        	ld	a,_hn_type
3138  0003 a104          	cp	a,#4
3139  0005 2606          	jrne	L1611
3140                     ; 1216 		hn_kocom_cb(room+100);
3142  0007 9f            	ld	a,xl
3143  0008 ab64          	add	a,#100
3144  000a cd0000        	call	_hn_kocom_cb
3146  000d               L1611:
3147                     ; 1226 }
3150  000d 81            	ret	
3179                     ; 1306 void	lightCntl(void)
3179                     ; 1307 {
3180                     .text:	section	.text,new
3181  0000               _lightCntl:
3185                     ; 1312 	if( __timer1s != __light[0] )
3187  0000 c60000        	ld	a,___timer1s
3188  0003 c1003f        	cp	a,___light
3189  0006 2750          	jreq	L3711
3190                     ; 1314 		__light[0] = __timer1s;
3192  0008 550000003f    	mov	___light,___timer1s
3193                     ; 1315 		__light[1]++;
3195  000d 725c0040      	inc	___light+1
3196                     ; 1316 		if( __light[1] >= 5 )
3198  0011 c60040        	ld	a,___light+1
3199  0014 a105          	cp	a,#5
3200  0016 250a          	jrult	L5711
3201                     ; 1318 			__light[1] = 5;
3203  0018 35050040      	mov	___light+1,#5
3204                     ; 1320 			__ls[0] = 1;
3206  001c 35010039      	mov	___ls,#1
3208  0020 2004          	jra	L7711
3209  0022               L5711:
3210                     ; 1323 			__ls[0] = 8; 
3212  0022 35080039      	mov	___ls,#8
3213  0026               L7711:
3214                     ; 1325 		__light[2]++;
3216  0026 725c0041      	inc	___light+2
3217                     ; 1326 		if( __light[2] >= 5 )
3219  002a c60041        	ld	a,___light+2
3220  002d a105          	cp	a,#5
3221  002f 250a          	jrult	L1021
3222                     ; 1328 			__light[2] = 5;
3224  0031 35050041      	mov	___light+2,#5
3225                     ; 1330 			__ls[1] = 1;
3227  0035 3501003a      	mov	___ls+1,#1
3229  0039 2004          	jra	L3021
3230  003b               L1021:
3231                     ; 1333 			__ls[1] = 8;
3233  003b 3508003a      	mov	___ls+1,#8
3234  003f               L3021:
3235                     ; 1335 		__light[3]++;
3237  003f 725c0042      	inc	___light+3
3238                     ; 1336 		if( __light[3] >= 5 )
3240  0043 c60042        	ld	a,___light+3
3241  0046 a105          	cp	a,#5
3242  0048 250a          	jrult	L5021
3243                     ; 1338 			__light[3] = 5;
3245  004a 35050042      	mov	___light+3,#5
3246                     ; 1340 			__ls[2] = 1;
3248  004e 3501003b      	mov	___ls+2,#1
3250  0052 2004          	jra	L3711
3251  0054               L5021:
3252                     ; 1343 			__ls[2] = 8;
3254  0054 3508003b      	mov	___ls+2,#8
3255  0058               L3711:
3256                     ; 1347 	if( _ioMaster[4] == 1 )
3258  0058 c6000f        	ld	a,__ioMaster+4
3259  005b 4a            	dec	a
3260  005c 260a          	jrne	L1121
3261                     ; 1349 		_ioMaster[4] = 0;
3263  005e c7000f        	ld	__ioMaster+4,a
3264                     ; 1350 		__light[1] = 0;
3266  0061 c70040        	ld	___light+1,a
3267                     ; 1351 		__ls[0] = 8;
3269  0064 35080039      	mov	___ls,#8
3270  0068               L1121:
3271                     ; 1354 	if( _ioMaster[5] == 1 )
3273  0068 c60010        	ld	a,__ioMaster+5
3274  006b 4a            	dec	a
3275  006c 260a          	jrne	L3121
3276                     ; 1356 		_ioMaster[5] = 0;
3278  006e c70010        	ld	__ioMaster+5,a
3279                     ; 1357 		__light[2] = 0;
3281  0071 c70041        	ld	___light+2,a
3282                     ; 1358 		__ls[1] = 8;
3284  0074 3508003a      	mov	___ls+1,#8
3285  0078               L3121:
3286                     ; 1361 	if( _ioMaster[6] == 1 )
3288  0078 c60011        	ld	a,__ioMaster+6
3289  007b 4a            	dec	a
3290  007c 260a          	jrne	L5121
3291                     ; 1363 		_ioMaster[6] = 0;
3293  007e c70011        	ld	__ioMaster+6,a
3294                     ; 1364 		__light[3] = 0;
3296  0081 c70042        	ld	___light+3,a
3297                     ; 1365 		__ls[2] = 8;
3299  0084 3508003b      	mov	___ls+2,#8
3300  0088               L5121:
3301                     ; 1368 	if( (__ls[0]&0x01) == 1 )
3303  0088 720100391e    	btjf	___ls,#0,L7121
3304                     ; 1371 		if( (_timer100ms255%2) == 0 )
3306  008d 7200000015    	btjt	__timer100ms255,#0,L1221
3307                     ; 1373 			if( __light[4] == 0 )
3309  0092 c60043        	ld	a,___light+4
3310  0095 2614          	jrne	L7121
3311                     ; 1375 				__light[4] = 1;
3313  0097 35010043      	mov	___light+4,#1
3314                     ; 1376 				if( cntGetType() == 0 )	
3316  009b cd0000        	call	_cntGetType
3318  009e 4d            	tnz	a
3319  009f 260a          	jrne	L7121
3320                     ; 1382 					D_IO_TOGGLE(DW_L1_PORT, DW_L1_PIN);		
3322  00a1 901c5005      	bcpl	20485,#6
3323  00a5 2004          	jra	L7121
3324  00a7               L1221:
3325                     ; 1388 			__light[4] = 0; 
3327  00a7 725f0043      	clr	___light+4
3328  00ab               L7121:
3329                     ; 1390 	if( (__ls[0]&0x08) == 8 )
3331  00ab 7207003918    	btjf	___ls,#3,L1321
3332                     ; 1392 		if( (_timer100ms255%20) == 0 )
3334  00b0 cd0145        	call	LC007
3335  00b3 260f          	jrne	L3321
3336                     ; 1394 			if( __light[4] == 0 )
3338  00b5 c60043        	ld	a,___light+4
3339  00b8 260e          	jrne	L1321
3340                     ; 1396 				__light[4] = 1;
3342  00ba 35010043      	mov	___light+4,#1
3343                     ; 1401 				D_IO_LOW(DW_L1_PORT, DW_L1_PIN);		
3345  00be 721d5005      	bres	20485,#6
3346  00c2 2004          	jra	L1321
3347  00c4               L3321:
3348                     ; 1408 			__light[4] = 0; 
3350  00c4 725f0043      	clr	___light+4
3351  00c8               L1321:
3352                     ; 1412 	if( (__ls[1]&0x01) == 1 )
3354  00c8 7201003a1e    	btjf	___ls+1,#0,L1421
3355                     ; 1415 		if( (_timer100ms255%3) == 0 )
3357  00cd cd0151        	call	LC008
3358  00d0 2615          	jrne	L3421
3359                     ; 1417 			if( __light[5] == 0 )
3361  00d2 c60044        	ld	a,___light+5
3362  00d5 2614          	jrne	L1421
3363                     ; 1419 				__light[5] = 1;
3365  00d7 35010044      	mov	___light+5,#1
3366                     ; 1420 				if( cntGetType() == 0 )	{	D_IO_TOGGLE(D_LED_PORT, D_LED_PIN);		}
3368  00db cd0000        	call	_cntGetType
3370  00de 4d            	tnz	a
3371  00df 260a          	jrne	L1421
3374  00e1 90125000      	bcpl	20480,#1
3375  00e5 2004          	jra	L1421
3376  00e7               L3421:
3377                     ; 1424 			__light[5] = 0; 
3379  00e7 725f0044      	clr	___light+5
3380  00eb               L1421:
3381                     ; 1426 	if( (__ls[1]&0x08) == 8 )
3383  00eb 7207003a17    	btjf	___ls+1,#3,L3521
3384                     ; 1428 		if( (_timer100ms255%20) == 0 )
3386  00f0 ad53          	call	LC007
3387  00f2 260f          	jrne	L5521
3388                     ; 1430 			if( __light[5] == 0 )
3390  00f4 c60044        	ld	a,___light+5
3391  00f7 260e          	jrne	L3521
3392                     ; 1432 				__light[5] = 1;
3394  00f9 35010044      	mov	___light+5,#1
3395                     ; 1433 				D_IO_LOW(D_LED_PORT, D_LED_PIN);		
3397  00fd 72135000      	bres	20480,#1
3398  0101 2004          	jra	L3521
3399  0103               L5521:
3400                     ; 1437 			__light[5] = 0; 
3402  0103 725f0044      	clr	___light+5
3403  0107               L3521:
3404                     ; 1441 	if( (__ls[2]&0x01) == 1 )
3406  0107 7201003b1d    	btjf	___ls+2,#0,L3621
3407                     ; 1444 		if( (_timer100ms255%3) == 0 )
3409  010c ad43          	call	LC008
3410  010e 2615          	jrne	L5621
3411                     ; 1446 			if( __light[6] == 0 )
3413  0110 c60045        	ld	a,___light+6
3414  0113 2614          	jrne	L3621
3415                     ; 1448 				__light[6] = 1;
3417  0115 35010045      	mov	___light+6,#1
3418                     ; 1449 				if( cntGetType() == 0 )	
3420  0119 cd0000        	call	_cntGetType
3422  011c 4d            	tnz	a
3423  011d 260a          	jrne	L3621
3424                     ; 1455 					D_IO_TOGGLE(DW_L2_PORT, DW_L2_PIN);		
3426  011f 901e5005      	bcpl	20485,#7
3428  0123 2004          	jra	L3621
3429  0125               L5621:
3430                     ; 1462 			__light[6] = 0; 
3432  0125 725f0045      	clr	___light+6
3433  0129               L3621:
3434                     ; 1464 	if( (__ls[2]&0x08) == 8 )
3436  0129 7207003b16    	btjf	___ls+2,#3,L7721
3437                     ; 1467 		if( (_timer100ms255%20) == 0 )
3439  012e ad15          	call	LC007
3440  0130 260e          	jrne	L1031
3441                     ; 1469 			if( __light[6] == 0 )
3443  0132 c60045        	ld	a,___light+6
3444  0135 260d          	jrne	L7721
3445                     ; 1471 				__light[6] = 1;
3447  0137 35010045      	mov	___light+6,#1
3448                     ; 1476 				D_IO_LOW(DW_L2_PORT, DW_L2_PIN);		
3450  013b 721f5005      	bres	20485,#7
3452  013f 81            	ret	
3453  0140               L1031:
3454                     ; 1481 			__light[6] = 0; 
3456  0140 725f0045      	clr	___light+6
3457  0144               L7721:
3458                     ; 1483 }
3461  0144 81            	ret	
3462  0145               LC007:
3463  0145 c60000        	ld	a,__timer100ms255
3464  0148 5f            	clrw	x
3465  0149 97            	ld	xl,a
3466  014a a614          	ld	a,#20
3467  014c cd0000        	call	c_smodx
3469  014f 5d            	tnzw	x
3470  0150 81            	ret	
3471  0151               LC008:
3472  0151 c60000        	ld	a,__timer100ms255
3473  0154 5f            	clrw	x
3474  0155 97            	ld	xl,a
3475  0156 a603          	ld	a,#3
3476  0158 cd0000        	call	c_smodx
3478  015b 5d            	tnzw	x
3479  015c 81            	ret	
3601                     ; 1492 int		main()
3601                     ; 1493 {
3602                     .text:	section	.text,new
3603  0000               _main:
3605  0000 5212          	subw	sp,#18
3606       00000012      OFST:	set	18
3609                     ; 1494 	uint8_t k = 0;
3611                     ; 1495 	uint8_t i = 0;
3613                     ; 1498 	uint8_t	_loopStatus = 0;
3615  0002 0f06          	clr	(OFST-12,sp)
3616                     ; 1499 	uint8_t	i10ms = 0;
3618  0004 0f01          	clr	(OFST-17,sp)
3619                     ; 1508 	clockConfig();
3621  0006 cd0000        	call	_clockConfig
3623                     ; 1511 	GPIO_Init(D_IOUART_RX_PORT, D_IOUART_RX_PIN, D_IO_IN_TRIGER_NOIT);
3625  0009 4b40          	push	#64
3626  000b 4b08          	push	#8
3627  000d ae500f        	ldw	x,#20495
3628  0010 cd0000        	call	_GPIO_Init
3630  0013 85            	popw	x
3631                     ; 1513 	systemTimer();
3633  0014 cd0000        	call	_systemTimer
3635                     ; 1514 	systemUart();
3637  0017 cd0000        	call	_systemUart
3639                     ; 1516 	iouart_Open();
3641  001a cd0000        	call	_iouart_Open
3643                     ; 1519 	GPIO_Init(D_LED_PORT, D_LED_PIN, D_IO_OUT_TRIGER);
3645  001d 4be0          	push	#224
3646  001f 4b02          	push	#2
3647  0021 ae5000        	ldw	x,#20480
3648  0024 cd0000        	call	_GPIO_Init
3650  0027 72135000      	bres	20480,#1
3651  002b 85            	popw	x
3652                     ; 1520 	D_IO_LOW(D_LED_PORT, D_LED_PIN);
3654                     ; 1527 	GPIO_Init(D_RELAY_PORT, D_RELAY_PIN, D_IO_OUT_TRIGER);
3656  002c 4be0          	push	#224
3657  002e 4b08          	push	#8
3658  0030 ae5000        	ldw	x,#20480
3659  0033 cd0000        	call	_GPIO_Init
3661  0036 72175000      	bres	20480,#3
3662  003a 85            	popw	x
3663                     ; 1528 	D_IO_LOW(D_RELAY_PORT, D_RELAY_PIN);
3665                     ; 1530 	mt_init();
3667  003b cd0000        	call	_mt_init
3669                     ; 1531 	vtbl_init();
3671  003e cd0000        	call	_vtbl_init
3673                     ; 1532 	enableInterrupts();
3676  0041 9a            	rim	
3678                     ; 1535 	cnt_Open();
3681  0042 cd0000        	call	_cnt_Open
3683                     ; 1536 	ptc_baseSet();
3685  0045 cd0000        	call	_ptc_baseSet
3687                     ; 1537 	cnt_ptc_baseSet();
3689  0048 cd0000        	call	_cnt_ptc_baseSet
3691                     ; 1538 	uart_Open();
3693  004b cd0000        	call	_uart_Open
3695                     ; 1542 	if( cntGetType() == 0 )
3697  004e cd0000        	call	_cntGetType
3699  0051 4d            	tnz	a
3700  0052 2610          	jrne	L5431
3701                     ; 1544 		i = funcInfo.valve;
3703  0054 c6000d        	ld	a,_funcInfo+13
3704  0057 6b12          	ld	(OFST+0,sp),a
3705                     ; 1545 		if( vtbl.cntlMode==0 && funcInfo.lpmType != 0 )
3707  0059 c6009c        	ld	a,_vtbl+156
3708  005c 261b          	jrne	L1531
3710  005e 725d000c      	tnz	_funcInfo+12
3711                     ; 1546 			i++;
3712  0062 2011          	jp	LC009
3713  0064               L5431:
3714                     ; 1550 		i = funcInfo2.valve;
3716  0064 c6000d        	ld	a,_funcInfo2+13
3717  0067 6b12          	ld	(OFST+0,sp),a
3718                     ; 1551 		if( vtbl.cntlMode==0 && funcInfo2.lpmType != 0 && CNTL_LPM_SUB )
3720  0069 c6009c        	ld	a,_vtbl+156
3721  006c 260b          	jrne	L1531
3723  006e c6000c        	ld	a,_funcInfo2+12
3724  0071 2706          	jreq	L1531
3726  0073 a107          	cp	a,#7
3727                     ; 1552 			i++;
3729  0075               LC009:
3730  0075 2702          	jreq	L1531
3732  0077 0c12          	inc	(OFST+0,sp)
3733  0079               L1531:
3734                     ; 1558 	toolErrorClear();
3736  0079 cd0000        	call	_toolErrorClear
3738                     ; 1559 	toolMtSetSize(i);
3740  007c 7b12          	ld	a,(OFST+0,sp)
3741  007e cd0000        	call	_toolMtSetSize
3743                     ; 1561 	pp[0] = 0;
3745  0081 0f07          	clr	(OFST-11,sp)
3746                     ; 1562 	pp[6] = 0xff;
3748  0083 a6ff          	ld	a,#255
3749  0085 6b0d          	ld	(OFST-5,sp),a
3750                     ; 1565 	indiIOUartIdle = 0;
3752  0087 725f0000      	clr	_indiIOUartIdle
3753  008b               L7031:
3754                     ; 1579 Entry:
3754                     ; 1580 		i = 0;
3756                     ; 1581 		timerCalc();
3758  008b cd0000        	call	_timerCalc
3760                     ; 1583 		_uartLoop();
3762  008e cd0000        	call	__uartLoop
3764                     ; 1585 		if( _loopStatus == 0 )
3766  0091 7b06          	ld	a,(OFST-12,sp)
3767  0093 2609          	jrne	L1631
3768                     ; 1587 			if( mt_Ready() == 1 )
3770  0095 cd0000        	call	_mt_Ready
3772  0098 4a            	dec	a
3773  0099 2611          	jrne	L5631
3774                     ; 1588 				_loopStatus = 1;
3776  009b 4c            	inc	a
3777  009c 200c          	jp	LC010
3778  009e               L1631:
3779                     ; 1590 		else if( _loopStatus == 1 )
3781  009e 4a            	dec	a
3782  009f 260b          	jrne	L5631
3783                     ; 1592 			if( pp[2] == 0 )
3785  00a1 0d09          	tnz	(OFST-9,sp)
3786  00a3 2607          	jrne	L5631
3787                     ; 1594 				pp[2] = 1;
3789  00a5 4c            	inc	a
3790  00a6 6b09          	ld	(OFST-9,sp),a
3791                     ; 1595 				_loopStatus = 4;
3793  00a8 a604          	ld	a,#4
3794  00aa               LC010:
3795  00aa 6b06          	ld	(OFST-12,sp),a
3796  00ac               L5631:
3797                     ; 1599 		if( _t20ms != pp[4] )
3799  00ac c60000        	ld	a,__t20ms
3800  00af 110b          	cp	a,(OFST-7,sp)
3801  00b1 272d          	jreq	L3731
3802                     ; 1601 			i10ms++;
3804  00b3 0c01          	inc	(OFST-17,sp)
3805                     ; 1602 			pp[4] = _t20ms;
3807  00b5 6b0b          	ld	(OFST-7,sp),a
3808                     ; 1604 			dt[0]++;
3810  00b7 0c02          	inc	(OFST-16,sp)
3811                     ; 1605 			if( dt[0] >= 50 )
3813  00b9 7b02          	ld	a,(OFST-16,sp)
3814  00bb a132          	cp	a,#50
3815  00bd 2505          	jrult	L5731
3816                     ; 1608 				dt[0] = 0;
3818  00bf 0f02          	clr	(OFST-16,sp)
3819                     ; 1609 				dwLoop();
3821  00c1 cd0000        	call	_dwLoop
3823  00c4               L5731:
3824                     ; 1612 			if( i10ms >= 42 )
3826  00c4 7b01          	ld	a,(OFST-17,sp)
3827  00c6 a12a          	cp	a,#42
3828  00c8 2513          	jrult	L7731
3829                     ; 1615 				i10ms = 0;
3831  00ca 0f01          	clr	(OFST-17,sp)
3832                     ; 1616 				if( cntGetType() == 0 )
3834  00cc cd0000        	call	_cntGetType
3836  00cf 4d            	tnz	a
3837  00d0 260b          	jrne	L7731
3838                     ; 1618 					if( __mt_enable != 10 )
3840  00d2 c60000        	ld	a,___mt_enable
3841  00d5 a10a          	cp	a,#10
3842  00d7 2704          	jreq	L7731
3843                     ; 1619 						_msgLoop(0);
3845  00d9 4f            	clr	a
3846  00da cd0000        	call	__msgLoop
3848  00dd               L7731:
3849                     ; 1622 			timer10msCb();
3851  00dd cd0000        	call	_timer10msCb
3853  00e0               L3731:
3854                     ; 1626 		i = _iouartLoop();
3856  00e0 cd0000        	call	__iouartLoop
3858  00e3 6b12          	ld	(OFST+0,sp),a
3859                     ; 1627 		if( i == 3 )
3861  00e5 a103          	cp	a,#3
3862  00e7 2607          	jrne	L5041
3863  00e9               L7041:
3864                     ; 1630 				factory(1);
3866  00e9 a601          	ld	a,#1
3867  00eb cd0000        	call	_factory
3870  00ee 20f9          	jra	L7041
3871  00f0               L5041:
3872                     ; 1633 		_iouart3uLoop();
3874  00f0 cd0000        	call	__iouart3uLoop
3876                     ; 1637 		toolMtLoop(0);
3878  00f3 4f            	clr	a
3879  00f4 cd0000        	call	_toolMtLoop
3881                     ; 1641 		mtCalc();
3883  00f7 cd0000        	call	_mtCalc
3885                     ; 1643 		lightCntl();
3887  00fa cd0000        	call	_lightCntl
3889                     ; 1644 		if( __timer1s != pp[5] )
3891  00fd c60000        	ld	a,___timer1s
3892  0100 110c          	cp	a,(OFST-6,sp)
3893  0102 2787          	jreq	L7031
3894                     ; 1650 			pp[5] = __timer1s;
3896  0104 6b0c          	ld	(OFST-6,sp),a
3897                     ; 1651 			if( vtbl.ii[0] == 0x80 )
3899  0106 c60080        	ld	a,_vtbl+128
3900  0109 a180          	cp	a,#128
3901  010b 2615          	jrne	L5141
3902                     ; 1653 				vtbl.ii[0] = 0;
3904  010d 725f0080      	clr	_vtbl+128
3905                     ; 1654 				_ts = 0;
3907  0111 725f0000      	clr	__ts
3908                     ; 1655 				_mc_i = 1;
3910  0115 35010000      	mov	__mc_i,#1
3911                     ; 1656 				mt_clear(0);
3913  0119 4f            	clr	a
3914  011a cd0000        	call	_mt_clear
3916                     ; 1657 				toolErrorClear();
3918  011d cd0000        	call	_toolErrorClear
3921  0120 201d          	jra	L7141
3922  0122               L5141:
3923                     ; 1661 				if( funcInfo.opMode == 2 )		toolMt2Operate();
3925  0122 c60011        	ld	a,_funcInfo+17
3926  0125 a102          	cp	a,#2
3927  0127 2605          	jrne	L1241
3930  0129 cd0000        	call	_toolMt2Operate
3933  012c 2011          	jra	L7141
3934  012e               L1241:
3935                     ; 1662 				else if( funcInfo.opMode == 3 )	toolMtTab();
3937  012e a103          	cp	a,#3
3938  0130 2605          	jrne	L5241
3941  0132 cd0000        	call	_toolMtTab
3944  0135 2008          	jra	L7141
3945  0137               L5241:
3946                     ; 1665 					if( funcInfo.opMode == 7 )
3948  0137 a107          	cp	a,#7
3949  0139 2704          	jreq	L7141
3951                     ; 1671 						vtbl_loop(0);
3953  013b 4f            	clr	a
3954  013c cd0000        	call	_vtbl_loop
3956  013f               L7141:
3957                     ; 1695 			if (funcInfo.cntlMode == 1) {
3959  013f c60010        	ld	a,_funcInfo+16
3960  0142 4a            	dec	a
3961  0143 2641          	jrne	L5341
3962                     ; 1696 				if (br_connect != BOILER_CONNECT_COUNT) {
3964  0145 c60000        	ld	a,_br_connect
3965  0148 a10a          	cp	a,#10
3966  014a 273a          	jreq	L5341
3967                     ; 1697 					br_connect += 1;
3969  014c 725c0000      	inc	_br_connect
3970                     ; 1699 					if (br_connect == BOILER_CONNECT_COUNT) {
3972  0150 c60000        	ld	a,_br_connect
3973  0153 a10a          	cp	a,#10
3974  0155 2618          	jrne	L1441
3975                     ; 1700 						if (funcInfo.error_type == ERROR_TYPE_NONE) {
3977  0157 c60009        	ld	a,_funcInfo+9
3978  015a 262a          	jrne	L5341
3979                     ; 1701 							if (hn_type == HN_TYPE_CLIO) {
3981  015c c60000        	ld	a,_hn_type
3982  015f a102          	cp	a,#2
3983  0161 2606          	jrne	L5441
3984                     ; 1702 								func_cnt_error(ERROR_TYPE_BOILER, 0x21);
3986  0163 ae0121        	ldw	x,#289
3987  0166 cd0000        	call	_func_cnt_error
3989  0169               L5441:
3990                     ; 1704 							br_type = BR_TYPE_NONE;
3992  0169 725f0000      	clr	_br_type
3993  016d 2017          	jra	L5341
3994  016f               L1441:
3995                     ; 1707 						if (hn_type == HN_TYPE_CLIO) {
3997  016f c60000        	ld	a,_hn_type
3998  0172 a102          	cp	a,#2
3999  0174 2610          	jrne	L5341
4000                     ; 1708 							if (funcInfo.error_type == ERROR_TYPE_BOILER &&
4000                     ; 1709 									funcInfo.error == 0x21) {
4002  0176 c60009        	ld	a,_funcInfo+9
4003  0179 4a            	dec	a
4004  017a 260a          	jrne	L5341
4006  017c c60008        	ld	a,_funcInfo+8
4007  017f a121          	cp	a,#33
4008  0181 2603          	jrne	L5341
4009                     ; 1710 								func_cnt_errorReset();
4011  0183 cd0000        	call	_func_cnt_errorReset
4013  0186               L5341:
4014                     ; 1718 			if (hn_type != HN_TYPE_NONE) {
4016  0186 c60000        	ld	a,_hn_type
4017  0189 272b          	jreq	L5541
4018                     ; 1719 				if (hn_connect != HN_CONNECT_COUNT) {
4020  018b c60000        	ld	a,_hn_connect
4021  018e a10a          	cp	a,#10
4022  0190 2707          	jreq	L7541
4023                     ; 1720 					hn_connect += 1;
4025  0192 725c0000      	inc	_hn_connect
4026  0196 c60000        	ld	a,_hn_connect
4027  0199               L7541:
4028                     ; 1723 				if (hn_connect == HN_CONNECT_COUNT) {
4030  0199 a10a          	cp	a,#10
4031  019b 2619          	jrne	L5541
4032                     ; 1724 					if (funcInfo.error_type == ERROR_TYPE_NONE) {
4034  019d c60009        	ld	a,_funcInfo+9
4035  01a0 2614          	jrne	L5541
4036                     ; 1725 						if (hn_type != HN_TYPE_KOCOM) {
4038  01a2 c60000        	ld	a,_hn_type
4039  01a5 a104          	cp	a,#4
4040  01a7 2704          	jreq	L5641
4041                     ; 1726 							hn_type = HN_TYPE_NONE;
4043  01a9 725f0000      	clr	_hn_type
4044  01ad               L5641:
4045                     ; 1730 						switch (br_type) {
4047  01ad c60000        	ld	a,_br_type
4048  01b0 4a            	dec	a
4049  01b1 2603          	jrne	L5541
4052                     ; 1731 							case BR_TYPE_KR:
4052                     ; 1732 								br_kr_ptc_close_clio();
4054  01b3 cd0000        	call	_br_kr_ptc_close_clio
4056                     ; 1733 							break;
4058  01b6               L5541:
4059                     ; 1739 			for( i=0; i<PACKET_SIZE; i++ )
4061  01b6 4f            	clr	a
4062  01b7 6b12          	ld	(OFST+0,sp),a
4063  01b9               L3741:
4064                     ; 1741 				if( packet_buf[i] != PACKET_ERROR_COUNT ) {
4066  01b9 5f            	clrw	x
4067  01ba 97            	ld	xl,a
4068  01bb d60029        	ld	a,(_packet_buf,x)
4069  01be a11e          	cp	a,#30
4070  01c0 270a          	jreq	L1051
4071                     ; 1742 					packet_buf[i] += 1;
4073  01c2 7b12          	ld	a,(OFST+0,sp)
4074  01c4 5f            	clrw	x
4075  01c5 97            	ld	xl,a
4076  01c6 724c0029      	inc	(_packet_buf,x)
4078  01ca 2039          	jra	L3051
4079  01cc               L1051:
4080                     ; 1747 						if (hn_type != HN_TYPE_COMMAX) {
4082  01cc c60000        	ld	a,_hn_type
4083  01cf 4a            	dec	a
4084  01d0 2733          	jreq	L3051
4085                     ; 1748 							for( k=0; k<TBL_V_SIZE; k++ )
4087  01d2 4f            	clr	a
4088  01d3 6b11          	ld	(OFST-1,sp),a
4089  01d5               L7051:
4090                     ; 1750 								if( vtbl.valve2rc[k] == (i+1) )
4092  01d5 5f            	clrw	x
4093  01d6 97            	ld	xl,a
4094  01d7 d60050        	ld	a,(_vtbl+80,x)
4095  01da 5f            	clrw	x
4096  01db 97            	ld	xl,a
4097  01dc 7b12          	ld	a,(OFST+0,sp)
4098  01de 905f          	clrw	y
4099  01e0 9097          	ld	yl,a
4100  01e2 905c          	incw	y
4101  01e4 90bf00        	ldw	c_y,y
4102  01e7 b300          	cpw	x,c_y
4103  01e9 2612          	jrne	L5151
4104                     ; 1752 									vtbl.curr[k] = 0x82;
4106  01eb 7b11          	ld	a,(OFST-1,sp)
4107  01ed 5f            	clrw	x
4108  01ee 97            	ld	xl,a
4109  01ef a682          	ld	a,#130
4110  01f1 d70020        	ld	(_vtbl+32,x),a
4111                     ; 1753 									vtbl.setup[k] = 0x42;
4113  01f4 5f            	clrw	x
4114  01f5 7b11          	ld	a,(OFST-1,sp)
4115  01f7 97            	ld	xl,a
4116  01f8 a642          	ld	a,#66
4117  01fa d70030        	ld	(_vtbl+48,x),a
4118  01fd               L5151:
4119                     ; 1748 							for( k=0; k<TBL_V_SIZE; k++ )
4121  01fd 0c11          	inc	(OFST-1,sp)
4124  01ff 7b11          	ld	a,(OFST-1,sp)
4125  0201 a110          	cp	a,#16
4126  0203 25d0          	jrult	L7051
4127  0205               L3051:
4128                     ; 1739 			for( i=0; i<PACKET_SIZE; i++ )
4130  0205 0c12          	inc	(OFST+0,sp)
4133  0207 7b12          	ld	a,(OFST+0,sp)
4134  0209 a110          	cp	a,#16
4135  020b 25ac          	jrult	L3741
4136                     ; 1770 			_flash_saveCb();
4138  020d cd0000        	call	__flash_saveCb
4140  0210 cc008b        	jra	L7031
4570                     	xdef	_main
4571                     	xdef	_lightCntl
4572                     	xdef	_cnt_chnage_rc_set
4573                     	xdef	_uart_Open
4574                     	xdef	_relayCntl
4575                     	xdef	__uartLoop
4576                     	xdef	__uartLoopHome
4577                     	xref	_loopTtaCb
4578                     	xref	_loopTta
4579                     	xdef	__uartSeoulType
4580                     	xdef	__uai2
4581                     	xdef	__uai
4582                     	xdef	_clio26s
4583                     	xdef	_clio15s
4584                     	xdef	_clio26i
4585                     	xdef	_clio15i
4586                     	switch	.bss
4587  0000               _clio26buf:
4588  0000 000000000000  	ds.b	26
4589                     	xdef	_clio26buf
4590  001a               _clio15buf:
4591  001a 000000000000  	ds.b	15
4592                     	xdef	_clio15buf
4593                     	xdef	_extHn
4594                     	xdef	__uartLoopB
4595                     	xdef	_dwLoop
4596                     	xdef	__ioDwLoop
4597                     	xdef	_extB_Dw
4598                     	xdef	_dw_LbCntl
4599                     	xdef	_dw_LaCntl
4600                     	xdef	_dw_init
4601                     	xref	_br_dw_ptc_make
4602                     	xref	_iouart9d_getReadBuffer
4603                     	xref	_iouart9d_Ready
4604                     	xref	_iouart9d_ReadyBuf
4605                     	xdef	__uartLoopCheckMaster
4606                     	xdef	__br_make
4607                     	xdef	__ping
4608                     	xdef	_extB_KD
4609                     	xdef	_extB_KR
4610                     	xdef	__uartHn
4611                     	xdef	__uartBr
4612                     	xdef	_extSeoul
4613                     	xdef	_extHyundai
4614                     	xdef	_extKocom
4615                     	xdef	_extClio_KD
4616                     	xdef	_extClio_KR
4617                     	xdef	_extCommax
4618                     	xdef	__iouartLoop
4619                     	xdef	__ioMaster
4620                     	xref	_sub_cnt_ptc_check
4621                     	xdef	__iouart3uLoop
4622                     	xdef	__msgLoop
4623                     	xdef	_cnt_Open
4624                     	xdef	_ext_sub_error
4625                     	xdef	_ext_sub_timeout
4626                     	xdef	_ext_sub_ready
4627                     	xdef	_ext_br_timeout
4628                     	xdef	_ext_br_type
4629                     	xdef	_ext_hn_ready
4630                     	xdef	_ext_br_ready
4631  0029               _packet_buf:
4632  0029 000000000000  	ds.b	16
4633                     	xdef	_packet_buf
4634                     	xref	_debug_enable_cnt
4635                     	xref	__t1ms
4636                     	xref	__mc_i
4637                     	xref	__ts
4638                     	xdef	_iouartTimer1
4639                     	xdef	_iouartTimer0
4640                     	xref	_vtbl_loop
4641                     	xref	_vtbl_init
4642                     	xref	_mt_init
4643                     	xref	_copy_funcInfo
4644                     	xref	_ptc_baseSet
4645                     	xref	__flash_saveCb
4646                     	xdef	_ver
4647                     	xref	__timer100ms255
4648  0039               ___ls:
4649  0039 000000000000  	ds.b	6
4650                     	xdef	___ls
4651  003f               ___light:
4652  003f 000000000000  	ds.b	8
4653                     	xdef	___light
4654                     	xref	_timer10msCb
4655                     	xref	_br_kd_ptc_check
4656                     	xref	_br_dw_ptc_check
4657                     	xref	_br_kr_ptc_close_clio
4658                     	xref	_br_kr_ptc_make_clio
4659                     	xref	_br_kr_ptc_make
4660                     	xref	_br_kr_ptc_check_clio
4661                     	xref	_br_kr_ptc_check
4662                     	xref	_br_type
4663                     	xref	_br_connect
4664                     	xref	_hn_seoul_ptc_check
4665                     	xref	_hn_hyundai_ptc_check
4666                     	xref	_hn_kocom_cb
4667                     	xref	_hn_kocom_ptc_check
4668                     	xref	_hn_clio_ptc_check_KD
4669                     	xref	_hn_clio_ptc_check
4670                     	xref	_hn_commax_ptc_check
4671                     	xref	_hn_type
4672                     	xref	_hn_connect
4673                     	xref	_cnt_ptc_getCheckState
4674                     	xref	_cnt_ptc_check
4675                     	xref	_cnt_ptc_make
4676                     	xref	_cnt_ptc_baseSet
4677                     	xdef	_cntGetType
4678                     	xref	_func_cnt_error
4679                     	xref	_func_cnt_errorReset
4680                     	xref	_funcInfo2
4681                     	xref	_funcInfo
4682  0047               __uc:
4683  0047 000000000000  	ds.b	135
4684                     	xdef	__uc
4685  00ce               __ub:
4686  00ce 000000000000  	ds.b	167
4687                     	xdef	__ub
4688  0175               __ua:
4689  0175 000000000000  	ds.b	167
4690                     	xdef	__ua
4691                     	xref	_vtbl
4692                     	xref	_factory
4693                     	xref	_toolErrorClear
4694                     	xref	_toolMtSetSize
4695                     	xref	_mt_Ready
4696                     	xref	_mt_clear
4697                     	xref	_toolMt2Operate
4698                     	xref	_toolMtTab
4699                     	xref	_toolMtLoop
4700                     	xref	___mt_enable
4701                     	xdef	_ext_hn_error
4702                     	xdef	_ext_br_error
4703                     	xref	_file_read
4704                     	xref	_clockConfig
4705                     	xref	_timerCalc
4706                     	xref	_systemTimer
4707                     	xref	___timer1s
4708                     	xref	___timer100ms
4709                     	xref	__t20ms
4710                     	xref	_systemUart3ChangeEvenParity
4711                     	xref	_systemUart
4712                     	xref	_uart3_get
4713                     	xref	_uart3_tx_put
4714                     	xref	_uart3_Ready
4715                     	xref	_uart1_get
4716                     	xref	_uart1_tx_put
4717                     	xref	_uart1_Ready
4718                     	xref	_iouart_getReadBuffer
4719                     	xref	_iouart_getBuffer
4720                     	xref	_iouart_Ready
4721                     	xref	__io_tail
4722                     	xref	__io_head
4723                     	xref	_iouart_Pkt_Start
4724                     	xref	_iouart_Set_Packet
4725                     	xref	_iouart_Open
4726                     	xref	_indiIOUartIdle
4727                     	xref	_mtCalc
4728                     	xref	_GPIO_Init
4729                     	switch	.const
4730  000e               L701:
4731  000e 6500          	dc.b	"e",0
4732                     	xref.b	c_x
4733                     	xref.b	c_y
4753                     	xref	c_smodx
4754                     	end
