   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  75                     ; 72 void ptc_baseSet(void)
  75                     ; 73 {
  77                     .text:	section	.text,new
  78  0000               _ptc_baseSet:
  80  0000 5203          	subw	sp,#3
  81       00000003      OFST:	set	3
  84                     ; 79 	dip = BYTE3_0;
  86                     ; 80 	valve = (BYTE3_0 & 0xE0) >> 5;
  88                     ; 82 	setData.valve_count =  valve == 0 ? 0 : valve + 1;
  90  0002 35080006      	mov	_setData+3,#8
  91                     ; 83 	setData.mode_ctr_ct = dip & 0x18 >> 3;
  93  0006 725f0004      	clr	_setData+1
  94                     ; 84 	setData.mode_heat = dip & 0x04 >> 2;
  96  000a 725f0005      	clr	_setData+2
  97                     ; 85 	setData.mode_ctr_op = dip & 0x03;
  99  000e 725f0003      	clr	_setData
 100                     ; 86 	setData.rc_count = BYTE3_1;
 102  0012 35060007      	mov	_setData+4,#6
 103                     ; 88 	setData.rc_valve[0] = BYTE3_2 << 4 | BYTE4_2;
 105  0016 725f0008      	clr	_setData+5
 106                     ; 89 	setData.rc_valve[1] = BYTE5_2 << 4 | BYTE6_2;
 108  001a 35110009      	mov	_setData+6,#17
 109                     ; 90 	setData.rc_valve[2] = BYTE3_3 << 4 | BYTE4_3;
 111  001e 3522000a      	mov	_setData+7,#34
 112                     ; 91 	setData.rc_valve[3] = BYTE5_3 << 4 | BYTE6_3;
 114  0022 3533000b      	mov	_setData+8,#51
 115                     ; 92 	setData.rc_valve[4] = BYTE3_4 << 4 | BYTE4_4;
 117  0026 3544000c      	mov	_setData+9,#68
 118                     ; 93 	setData.rc_valve[5] = BYTE5_4 << 4 | BYTE6_4;
 120  002a 3555000d      	mov	_setData+10,#85
 121                     ; 94 	setData.rc_valve[6] = BYTE3_5 << 4 | BYTE4_5;
 123  002e 3566000e      	mov	_setData+11,#102
 124                     ; 95 	setData.rc_valve[7] = BYTE5_5 << 4 | BYTE6_5;
 126  0032 3577000f      	mov	_setData+12,#119
 127                     ; 97 	for (i = 0 ; i < 8 ; i++)
 129  0036 4f            	clr	a
 130  0037 6b03          	ld	(OFST+0,sp),a
 131  0039               L13:
 132                     ; 99 		setData.room_length[i] = 0x64;
 134  0039 5f            	clrw	x
 135  003a 97            	ld	xl,a
 136  003b a664          	ld	a,#100
 137  003d d70010        	ld	(_setData+13,x),a
 138                     ; 97 	for (i = 0 ; i < 8 ; i++)
 140  0040 0c03          	inc	(OFST+0,sp)
 143  0042 7b03          	ld	a,(OFST+0,sp)
 144  0044 a108          	cp	a,#8
 145  0046 25f1          	jrult	L13
 146                     ; 102 	setData.max_water = BYTE4_1;
 148  0048 35c80018      	mov	_setData+21,#200
 149                     ; 103 	setData.subrc_lock = 0x00;
 151  004c 725f0019      	clr	_setData+22
 152                     ; 104 }
 155  0050 5b03          	addw	sp,#3
 156  0052 81            	ret	
 225                     ; 106 void ptc_check(uint8_t * buf)
 225                     ; 107 {
 226                     .text:	section	.text,new
 227  0000               _ptc_check:
 229  0000 89            	pushw	x
 230  0001 5209          	subw	sp,#9
 231       00000009      OFST:	set	9
 234                     ; 113 	swuart_Write(buf, 8);
 236  0003 4b08          	push	#8
 237  0005 cd0000        	call	_swuart_Write
 239  0008 84            	pop	a
 240                     ; 114 	id = buf[0] & 0x0F;
 242  0009 1e0a          	ldw	x,(OFST+1,sp)
 243  000b f6            	ld	a,(x)
 244  000c a40f          	and	a,#15
 245  000e 6b09          	ld	(OFST+0,sp),a
 246                     ; 116 	if (id == 0) {
 248  0010 2603cc00ab    	jreq	L23
 249                     ; 117 		return;
 251                     ; 120 	ptcData.id = id;
 253  0015 c7001a        	ld	_ptcData,a
 254                     ; 121 	ptcData.op_mode = (buf[0] & 0x70) >> 4;
 256  0018 f6            	ld	a,(x)
 257  0019 4e            	swap	a
 258  001a a407          	and	a,#7
 259  001c c7001b        	ld	_ptcData+1,a
 260                     ; 122 	ptcData.time_reserve = buf[1] & 0x3F;
 262  001f e601          	ld	a,(1,x)
 263  0021 a43f          	and	a,#63
 264  0023 c7001c        	ld	_ptcData+2,a
 265                     ; 123 	ptcData.op = (buf[1] & 0x80) >> 7;
 267  0026 e601          	ld	a,(1,x)
 268  0028 49            	rlc	a
 269  0029 4f            	clr	a
 270  002a 49            	rlc	a
 271  002b c7001d        	ld	_ptcData+3,a
 272                     ; 125 	temp = (buf[2] & 0x80) >> 7;
 274  002e e602          	ld	a,(2,x)
 275  0030 49            	rlc	a
 276  0031 4f            	clr	a
 277  0032 49            	rlc	a
 278  0033 6b09          	ld	(OFST+0,sp),a
 279                     ; 126 	ptcData.cur_tmp = (buf[2] & 0x7F) * 2 + temp;
 281  0035 e602          	ld	a,(2,x)
 282  0037 a47f          	and	a,#127
 283  0039 48            	sll	a
 284  003a 1b09          	add	a,(OFST+0,sp)
 285  003c c7001e        	ld	_ptcData+4,a
 286                     ; 127 	ptcData.set_tmp = buf[3];
 288  003f e603          	ld	a,(3,x)
 289  0041 c7001f        	ld	_ptcData+5,a
 290                     ; 128 	ptcData.byte4 = buf[4];
 292  0044 e604          	ld	a,(4,x)
 293  0046 c70021        	ld	_ptcData+7,a
 294                     ; 129 	ptcData.byte5 = buf[5];
 296  0049 e605          	ld	a,(5,x)
 297  004b c70022        	ld	_ptcData+8,a
 298                     ; 130 	ptcData.byte6 = buf[6];
 300  004e e606          	ld	a,(6,x)
 301  0050 c70023        	ld	_ptcData+9,a
 302                     ; 131 	ptcData.tmp_diff = 100 + ptcData.set_tmp - ptcData.cur_tmp;
 304  0053 c6001f        	ld	a,_ptcData+5
 305  0056 ab64          	add	a,#100
 306  0058 c0001e        	sub	a,_ptcData+4
 307  005b c70020        	ld	_ptcData+6,a
 308                     ; 133 	disp[0] = 'I';
 310  005e a649          	ld	a,#73
 311  0060 6b01          	ld	(OFST-8,sp),a
 312                     ; 134 	disp[1] = 'D';
 314  0062 a644          	ld	a,#68
 315  0064 6b02          	ld	(OFST-7,sp),a
 316                     ; 135 	disp[2] = ptcData.id + '0';
 318  0066 c6001a        	ld	a,_ptcData
 319  0069 ab30          	add	a,#48
 320  006b 6b03          	ld	(OFST-6,sp),a
 321                     ; 136 	disp[3] = (ptcData.set_tmp > ptcData.cur_tmp) ? '+' : '-';
 323  006d c6001f        	ld	a,_ptcData+5
 324  0070 c1001e        	cp	a,_ptcData+4
 325  0073 2304          	jrule	L21
 326  0075 a62b          	ld	a,#43
 327  0077 2002          	jra	L41
 328  0079               L21:
 329  0079 a62d          	ld	a,#45
 330  007b               L41:
 331  007b 6b04          	ld	(OFST-5,sp),a
 332                     ; 138 	swuart_Write(disp, 4);
 334  007d 4b04          	push	#4
 335  007f 96            	ldw	x,sp
 336  0080 1c0002        	addw	x,#OFST-7
 337  0083 cd0000        	call	_swuart_Write
 339  0086 84            	pop	a
 340                     ; 139 	swuart_Write("\r\n", 2);
 342  0087 4b02          	push	#2
 343  0089 ae0000        	ldw	x,#L17
 344  008c cd0000        	call	_swuart_Write
 346  008f 84            	pop	a
 347                     ; 141 	tempBit = ptc_rc_status & ~(0x01 << ( ptcData.id - 1));
 349  0090 ad1c          	call	LC001
 350  0092 2704          	jreq	L22
 351  0094               L42:
 352  0094 48            	sll	a
 353  0095 5a            	decw	x
 354  0096 26fc          	jrne	L42
 355  0098               L22:
 356  0098 43            	cpl	a
 357  0099 c40002        	and	a,_ptc_rc_status
 358  009c 6b09          	ld	(OFST+0,sp),a
 359                     ; 142 	tempBit |= 0x01 << ( ptcData.id - 1);
 361  009e ad0e          	call	LC001
 362  00a0 2704          	jreq	L62
 363  00a2               L03:
 364  00a2 48            	sll	a
 365  00a3 5a            	decw	x
 366  00a4 26fc          	jrne	L03
 367  00a6               L62:
 368  00a6 1a09          	or	a,(OFST+0,sp)
 369                     ; 143 	ptc_rc_status = tempBit;
 371  00a8 c70002        	ld	_ptc_rc_status,a
 372                     ; 144 }
 373  00ab               L23:
 376  00ab 5b0b          	addw	sp,#11
 377  00ad 81            	ret	
 378  00ae               LC001:
 379  00ae c6001a        	ld	a,_ptcData
 380  00b1 4a            	dec	a
 381  00b2 5f            	clrw	x
 382  00b3 97            	ld	xl,a
 383  00b4 a601          	ld	a,#1
 384  00b6 5d            	tnzw	x
 385  00b7 81            	ret	
 437                     ; 146 void ptc_make(uint8_t * buf)
 437                     ; 147 {
 438                     .text:	section	.text,new
 439  0000               _ptc_make:
 441  0000 89            	pushw	x
 442  0001 89            	pushw	x
 443       00000002      OFST:	set	2
 446                     ; 164 	switch(ptc_id_count){
 448  0002 c60001        	ld	a,_ptc_id_count
 450                     ; 183 			break;
 451  0005 271d          	jreq	L37
 452  0007 4a            	dec	a
 453  0008 271a          	jreq	L37
 454  000a 4a            	dec	a
 455  000b 2717          	jreq	L37
 456  000d 4a            	dec	a
 457  000e 2714          	jreq	L37
 458  0010 4a            	dec	a
 459  0011 2711          	jreq	L37
 460  0013 4a            	dec	a
 461  0014 270e          	jreq	L37
 462  0016 4a            	dec	a
 463  0017 270b          	jreq	L37
 464  0019 4a            	dec	a
 465  001a 270f          	jreq	L57
 466  001c 4a            	dec	a
 467  001d 270c          	jreq	L57
 468  001f 4a            	dec	a
 469  0020 2715          	jreq	L77
 470  0022 2020          	jra	L141
 471  0024               L37:
 472                     ; 165 		case 0 :
 472                     ; 166 		case 1 :
 472                     ; 167 		case 2 :
 472                     ; 168 		case 3 :
 472                     ; 169 		case 4 :
 472                     ; 170 		case 5 :
 472                     ; 171 		case 6 :
 472                     ; 172 			buf[0] = ptc_id_count;
 474  0024 1e03          	ldw	x,(OFST+1,sp)
 475  0026 c60001        	ld	a,_ptc_id_count
 476                     ; 173 			buf[2] = ptc_rc_status;
 477                     ; 174 			break;
 479  0029 2013          	jp	LC002
 480  002b               L57:
 481                     ; 175 		case 7 :
 481                     ; 176 		case 8 :
 481                     ; 177 			buf[0] = ptc_id_count + 2;
 483  002b c60001        	ld	a,_ptc_id_count
 484  002e 1e03          	ldw	x,(OFST+1,sp)
 485  0030 ab02          	add	a,#2
 486  0032 f7            	ld	(x),a
 487                     ; 178 			buf[2] = 0;
 489  0033 6f02          	clr	(2,x)
 490                     ; 179 			break;
 492  0035 200d          	jra	L141
 493  0037               L77:
 494                     ; 180 		case 9 :
 494                     ; 181 			buf[0] = ptc_id_count + 2;
 496  0037 c60001        	ld	a,_ptc_id_count
 497  003a ab02          	add	a,#2
 498  003c 1e03          	ldw	x,(OFST+1,sp)
 499                     ; 182 			buf[2] = ptc_rc_status;
 501  003e               LC002:
 502  003e f7            	ld	(x),a
 504  003f c60002        	ld	a,_ptc_rc_status
 505  0042 e702          	ld	(2,x),a
 506                     ; 183 			break;
 508  0044               L141:
 509                     ; 186 	buf[1] = ptc_page_count;
 511  0044 1e03          	ldw	x,(OFST+1,sp)
 512  0046 c60000        	ld	a,_ptc_page_count
 513  0049 e701          	ld	(1,x),a
 514                     ; 187 	switch(ptc_page_count){
 517                     ; 223 			break;
 518  004b 2711          	jreq	L101
 519  004d 4a            	dec	a
 520  004e 271e          	jreq	L301
 521  0050 4a            	dec	a
 522  0051 2729          	jreq	L501
 523  0053 4a            	dec	a
 524  0054 2731          	jreq	L701
 525  0056 4a            	dec	a
 526  0057 2732          	jreq	L111
 527  0059 4a            	dec	a
 528  005a 2733          	jreq	L311
 529  005c 203c          	jra	L541
 530  005e               L101:
 531                     ; 188 		case 0 :
 531                     ; 189 			buf[3] = BYTE3_0;
 533  005e a6e0          	ld	a,#224
 534  0060 e703          	ld	(3,x),a
 535                     ; 190 			buf[4] = BYTE4_0;
 537  0062 a611          	ld	a,#17
 538  0064 e704          	ld	(4,x),a
 539                     ; 191 			buf[5] = BYTE5_0;
 541  0066 a630          	ld	a,#48
 542  0068 e705          	ld	(5,x),a
 543                     ; 192 			buf[6] = BYTE6_0;
 545  006a a645          	ld	a,#69
 546                     ; 193 			break;
 548  006c 202a          	jp	LC003
 549  006e               L301:
 550                     ; 194 		case 1 :
 550                     ; 195 			buf[3] = BYTE3_1;
 552  006e a606          	ld	a,#6
 553  0070 e703          	ld	(3,x),a
 554                     ; 196 			buf[4] = BYTE4_1;
 556  0072 a6c8          	ld	a,#200
 557  0074 e704          	ld	(4,x),a
 558                     ; 197 			buf[5] = BYTE5_1;
 560  0076 6f05          	clr	(5,x)
 561                     ; 198 			buf[6] = BYTE6_1;
 563  0078 6f06          	clr	(6,x)
 564                     ; 199 			break;
 566  007a 201e          	jra	L541
 567  007c               L501:
 568                     ; 200 		case 2 :
 568                     ; 201 			buf[3] = BYTE3_2;
 570  007c e703          	ld	(3,x),a
 571                     ; 202 			buf[4] = BYTE4_2;
 573  007e e704          	ld	(4,x),a
 574                     ; 203 			buf[5] = BYTE5_2;
 576  0080 4c            	inc	a
 577  0081 e705          	ld	(5,x),a
 578                     ; 204 			buf[6] = BYTE6_2;
 580  0083 a601          	ld	a,#1
 581                     ; 205 			break;
 583  0085 2011          	jp	LC003
 584  0087               L701:
 585                     ; 206 		case 3 :
 585                     ; 207 			buf[3] = BYTE3_3;
 587  0087 a602          	ld	a,#2
 588                     ; 208 			buf[4] = BYTE4_3;
 589                     ; 209 			buf[5] = BYTE5_3;
 590                     ; 210 			buf[6] = BYTE6_3;
 591                     ; 211 			break;
 593  0089 2006          	jp	LC004
 594  008b               L111:
 595                     ; 212 		case 4 :
 595                     ; 213 			buf[3] = BYTE3_4;
 597  008b a604          	ld	a,#4
 598                     ; 214 			buf[4] = BYTE4_4;
 599                     ; 215 			buf[5] = BYTE5_4;
 600                     ; 216 			buf[6] = BYTE6_4;
 601                     ; 217 			break;
 603  008d 2002          	jp	LC004
 604  008f               L311:
 605                     ; 218 		case 5 :
 605                     ; 219 			buf[3] = BYTE3_5;
 607  008f a606          	ld	a,#6
 608                     ; 220 			buf[4] = BYTE4_5;
 610                     ; 221 			buf[5] = BYTE5_5;
 612  0091               LC004:
 613  0091 e703          	ld	(3,x),a
 616  0093 e704          	ld	(4,x),a
 619  0095 4c            	inc	a
 620  0096 e705          	ld	(5,x),a
 621                     ; 222 			buf[6] = BYTE6_5;
 623  0098               LC003:
 626  0098 e706          	ld	(6,x),a
 627                     ; 223 			break;
 629  009a               L541:
 630                     ; 226 	s = 0;
 632  009a 0f01          	clr	(OFST-1,sp)
 633                     ; 228 	for (i = 0 ; i < 7 ; i++) 
 635  009c 0f02          	clr	(OFST+0,sp)
 636  009e               L741:
 637                     ; 231 		s += buf[i];
 639  009e 7b03          	ld	a,(OFST+1,sp)
 640  00a0 97            	ld	xl,a
 641  00a1 7b04          	ld	a,(OFST+2,sp)
 642  00a3 1b02          	add	a,(OFST+0,sp)
 643  00a5 2401          	jrnc	L63
 644  00a7 5c            	incw	x
 645  00a8               L63:
 646  00a8 02            	rlwa	x,a
 647  00a9 7b01          	ld	a,(OFST-1,sp)
 648  00ab fb            	add	a,(x)
 649  00ac 6b01          	ld	(OFST-1,sp),a
 650                     ; 228 	for (i = 0 ; i < 7 ; i++) 
 652  00ae 0c02          	inc	(OFST+0,sp)
 655  00b0 7b02          	ld	a,(OFST+0,sp)
 656  00b2 a107          	cp	a,#7
 657  00b4 25e8          	jrult	L741
 658                     ; 235 	buf[7] = s;
 660  00b6 1e03          	ldw	x,(OFST+1,sp)
 661  00b8 7b01          	ld	a,(OFST-1,sp)
 662  00ba e707          	ld	(7,x),a
 663                     ; 237 	ptc_id_count++;
 665  00bc 725c0001      	inc	_ptc_id_count
 666                     ; 238 	ptc_page_count++;
 668  00c0 725c0000      	inc	_ptc_page_count
 669                     ; 240 	if (ptc_id_count == 10) 
 671  00c4 c60001        	ld	a,_ptc_id_count
 672  00c7 a10a          	cp	a,#10
 673  00c9 2604          	jrne	L551
 674                     ; 241 		ptc_id_count = 0;
 676  00cb 725f0001      	clr	_ptc_id_count
 677  00cf               L551:
 678                     ; 243 	if (ptc_page_count == 6) 
 680  00cf c60000        	ld	a,_ptc_page_count
 681  00d2 a106          	cp	a,#6
 682  00d4 2604          	jrne	L751
 683                     ; 244 		ptc_page_count = 0;
 685  00d6 725f0000      	clr	_ptc_page_count
 686  00da               L751:
 687                     ; 245 }
 690  00da 5b04          	addw	sp,#4
 691  00dc 81            	ret	
 694                     	switch	.data
 695  0000               _ptc_ctr_count:
 696  0000 00            	dc.b	0
 744                     ; 249 void ptc_ctr_resp(uint8_t * buf)
 744                     ; 250 {
 745                     .text:	section	.text,new
 746  0000               _ptc_ctr_resp:
 748  0000 89            	pushw	x
 749  0001 89            	pushw	x
 750       00000002      OFST:	set	2
 753                     ; 254 	buf[1] = 0x00;
 755  0002 6f01          	clr	(1,x)
 756                     ; 255 	buf[2] = 0x01;
 758  0004 a601          	ld	a,#1
 759  0006 e702          	ld	(2,x),a
 760                     ; 256 	switch(ptc_ctr_count){
 762  0008 c60000        	ld	a,_ptc_ctr_count
 764                     ; 284 		break;
 765  000b 270b          	jreq	L161
 766  000d 4a            	dec	a
 767  000e 2715          	jreq	L361
 768  0010 4a            	dec	a
 769  0011 271b          	jreq	L561
 770  0013 4a            	dec	a
 771  0014 271e          	jreq	L761
 772  0016 202b          	jra	L512
 773  0018               L161:
 774                     ; 257 	case 0 : 
 774                     ; 258 		buf[0] = 0xB0;
 776  0018 1e03          	ldw	x,(OFST+1,sp)
 777  001a a6b0          	ld	a,#176
 778  001c f7            	ld	(x),a
 779                     ; 259 		buf[3] = 0x20;
 781  001d a620          	ld	a,#32
 782  001f e703          	ld	(3,x),a
 783                     ; 260 		buf[4] = 0x1E;
 785  0021 a61e          	ld	a,#30
 786                     ; 261 		buf[5] = 0x1E;
 787                     ; 262 		buf[6] = 0x1E;
 788                     ; 263 		break;
 790  0023 2018          	jp	LC005
 791  0025               L361:
 792                     ; 264 	case 1 : 
 792                     ; 265 		buf[0] = 0xC0;
 794  0025 1e03          	ldw	x,(OFST+1,sp)
 795  0027 a6c0          	ld	a,#192
 796  0029 f7            	ld	(x),a
 797                     ; 266 		buf[3] = 0x20;
 799  002a a620          	ld	a,#32
 800                     ; 267 		buf[4] = 0x20;
 801                     ; 268 		buf[5] = 0x20;
 802                     ; 269 		buf[6] = 0x20;
 803                     ; 270 		break;
 805  002c 200d          	jp	LC006
 806  002e               L561:
 807                     ; 271 	case 2 : 
 807                     ; 272 		buf[0] = 0xD0;
 809  002e 1e03          	ldw	x,(OFST+1,sp)
 810  0030 a6d0          	ld	a,#208
 811                     ; 273 		buf[3] = 0x64;
 812                     ; 274 		buf[4] = 0x64;
 813                     ; 275 		buf[5] = 0x64;
 814                     ; 276 		buf[6] = 0x64;
 815                     ; 277 		break;
 817  0032 2004          	jp	LC007
 818  0034               L761:
 819                     ; 278 	case 3 : 
 819                     ; 279 		buf[0] = 0xE0;
 821  0034 1e03          	ldw	x,(OFST+1,sp)
 822  0036 a6e0          	ld	a,#224
 823                     ; 280 		buf[3] = 0x64;
 825  0038               LC007:
 826  0038 f7            	ld	(x),a
 828  0039 a664          	ld	a,#100
 829  003b               LC006:
 830  003b e703          	ld	(3,x),a
 831                     ; 281 		buf[4] = 0x64;
 833                     ; 282 		buf[5] = 0x64;
 835                     ; 283 		buf[6] = 0x64;
 837  003d               LC005:
 840  003d e704          	ld	(4,x),a
 844  003f e705          	ld	(5,x),a
 848  0041 e706          	ld	(6,x),a
 849                     ; 284 		break;
 851  0043               L512:
 852                     ; 287 	s = 0;
 854  0043 0f01          	clr	(OFST-1,sp)
 855                     ; 288 	for (i = 0 ; i < 7 ; i++) 
 857  0045 0f02          	clr	(OFST+0,sp)
 858  0047               L712:
 859                     ; 289 		s += buf[i];
 861  0047 7b03          	ld	a,(OFST+1,sp)
 862  0049 97            	ld	xl,a
 863  004a 7b04          	ld	a,(OFST+2,sp)
 864  004c 1b02          	add	a,(OFST+0,sp)
 865  004e 2401          	jrnc	L24
 866  0050 5c            	incw	x
 867  0051               L24:
 868  0051 02            	rlwa	x,a
 869  0052 7b01          	ld	a,(OFST-1,sp)
 870  0054 fb            	add	a,(x)
 871  0055 6b01          	ld	(OFST-1,sp),a
 872                     ; 288 	for (i = 0 ; i < 7 ; i++) 
 874  0057 0c02          	inc	(OFST+0,sp)
 877  0059 7b02          	ld	a,(OFST+0,sp)
 878  005b a107          	cp	a,#7
 879  005d 25e8          	jrult	L712
 880                     ; 291 	buf[7] = s;
 882  005f 1e03          	ldw	x,(OFST+1,sp)
 883  0061 7b01          	ld	a,(OFST-1,sp)
 884  0063 e707          	ld	(7,x),a
 885                     ; 293 	ptc_ctr_count++;
 887  0065 725c0000      	inc	_ptc_ctr_count
 888                     ; 294 	if (ptc_ctr_count == 4)
 890  0069 c60000        	ld	a,_ptc_ctr_count
 891  006c a104          	cp	a,#4
 892  006e 2604          	jrne	L522
 893                     ; 295 		ptc_ctr_count = 0;
 895  0070 725f0000      	clr	_ptc_ctr_count
 896  0074               L522:
 897                     ; 296 }
 900  0074 5b04          	addw	sp,#4
 901  0076 81            	ret	
 925                     ; 298 uint8_t	ptc_getid(void)
 925                     ; 299 {
 926                     .text:	section	.text,new
 927  0000               _ptc_getid:
 931                     ; 300 	return ptc_id_count;
 933  0000 c60001        	ld	a,_ptc_id_count
 936  0003 81            	ret	
1152                     	xdef	_ptc_getid
1153                     	xdef	_ptc_ctr_resp
1154                     	xdef	_ptc_ctr_count
1155                     	xdef	_ptc_make
1156                     	xdef	_ptc_check
1157                     	xdef	_ptc_baseSet
1158                     	switch	.bss
1159  0000               _ptc_page_count:
1160  0000 00            	ds.b	1
1161                     	xdef	_ptc_page_count
1162  0001               _ptc_id_count:
1163  0001 00            	ds.b	1
1164                     	xdef	_ptc_id_count
1165  0002               _ptc_rc_status:
1166  0002 00            	ds.b	1
1167                     	xdef	_ptc_rc_status
1168  0003               _setData:
1169  0003 000000000000  	ds.b	23
1170                     	xdef	_setData
1171  001a               _ptcData:
1172  001a 000000000000  	ds.b	10
1173                     	xdef	_ptcData
1174                     	xref	_swuart_Write
1175                     .const:	section	.text
1176  0000               L17:
1177  0000 0d0a00        	dc.b	13,10,0
1197                     	end
