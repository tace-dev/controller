   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     	switch	.data
  24  0000               _debug_enable_vtbl:
  25  0000 00            	dc.b	0
  26  0001               _debug_enable_cnt:
  27  0001 00            	dc.b	0
  67                     ; 70 void	vtbl_init(void)
  67                     ; 71 {
  69                     .text:	section	.text,new
  70  0000               _vtbl_init:
  72  0000 88            	push	a
  73       00000001      OFST:	set	1
  76                     ; 73 	for( i=0; i<TBL_V_SIZE; i++ )
  78  0001 4f            	clr	a
  79  0002 6b01          	ld	(OFST+0,sp),a
  80  0004               L52:
  81                     ; 75 		vtbl.openCount[i] = 0;
  83  0004 5f            	clrw	x
  84  0005 97            	ld	xl,a
  85  0006 724f0070      	clr	(_vtbl+96,x)
  86                     ; 76 		vtbl.openCount2[i] = 0;
  88  000a 5f            	clrw	x
  89  000b 97            	ld	xl,a
  90  000c 724f0080      	clr	(_vtbl+112,x)
  91                     ; 77 		vtbl.curr[i] = 0x11;
  93  0010 5f            	clrw	x
  94  0011 97            	ld	xl,a
  95  0012 a611          	ld	a,#17
  96  0014 d70030        	ld	(_vtbl+32,x),a
  97                     ; 78 		vtbl.setup[i] = 0x10;
  99  0017 5f            	clrw	x
 100  0018 7b01          	ld	a,(OFST+0,sp)
 101  001a 97            	ld	xl,a
 102  001b a610          	ld	a,#16
 103  001d d70040        	ld	(_vtbl+48,x),a
 104                     ; 79 		tbl_temp[i] = 0;
 106  0020 5f            	clrw	x
 107  0021 7b01          	ld	a,(OFST+0,sp)
 108  0023 97            	ld	xl,a
 109  0024 724f0000      	clr	(_tbl_temp,x)
 110                     ; 80 		vtbl.freeze[i] = 0;
 112  0028 5f            	clrw	x
 113  0029 97            	ld	xl,a
 114  002a 724f00ae      	clr	(_vtbl+158,x)
 115                     ; 81 		vtbl.run[i] = 0;
 117  002e 5f            	clrw	x
 118  002f 97            	ld	xl,a
 119  0030 724f00be      	clr	(_vtbl+174,x)
 120                     ; 73 	for( i=0; i<TBL_V_SIZE; i++ )
 122  0034 0c01          	inc	(OFST+0,sp)
 125  0036 7b01          	ld	a,(OFST+0,sp)
 126  0038 a110          	cp	a,#16
 127  003a 25c8          	jrult	L52
 128                     ; 83 	vtbl.__k = 0xfe;
 130  003c 35fe00ce      	mov	_vtbl+190,#254
 131                     ; 84 }
 134  0040 84            	pop	a
 135  0041 81            	ret	
 192                     ; 86 uint8_t	vtbl_set(uint8_t cmd)
 192                     ; 87 {
 193                     .text:	section	.text,new
 194  0000               _vtbl_set:
 196  0000 5203          	subw	sp,#3
 197       00000003      OFST:	set	3
 200                     ; 89 	uint8_t	j = 0;
 202  0002 0f01          	clr	(OFST-2,sp)
 203                     ; 91 	for( i=0; i<TBL_V_SIZE; i++ )
 205  0004 4f            	clr	a
 206  0005 6b03          	ld	(OFST+0,sp),a
 207  0007               L75:
 208                     ; 96 		if( vtbl.valve2rc[i] == 0 )
 210  0007 5f            	clrw	x
 211  0008 97            	ld	xl,a
 212  0009 724d0060      	tnz	(_vtbl+80,x)
 213  000d 2613          	jrne	L56
 214                     ; 98 			if( ev.id-1 == i )
 216  000f c60002        	ld	a,_ev
 217  0012 5f            	clrw	x
 218  0013 97            	ld	xl,a
 219  0014 5a            	decw	x
 220  0015 7b03          	ld	a,(OFST+0,sp)
 221  0017 905f          	clrw	y
 222  0019 9097          	ld	yl,a
 223  001b 90bf00        	ldw	c_y,y
 224  001e b300          	cpw	x,c_y
 225  0020 270a          	jreq	L33
 226                     ; 100 				goto OFF_MOTOR_ENTRY;
 228  0022               L56:
 229                     ; 103 		if( vtbl.valve2rc[i] == ev.id )
 231  0022 5f            	clrw	x
 232  0023 97            	ld	xl,a
 233  0024 d60060        	ld	a,(_vtbl+80,x)
 234  0027 c10002        	cp	a,_ev
 235  002a 2650          	jrne	L17
 236  002c               L33:
 237                     ; 105 OFF_MOTOR_ENTRY:
 237                     ; 106 			k = 0;
 239  002c 0f02          	clr	(OFST-1,sp)
 240                     ; 107 			if( vtbl.curr[i] != ev.curr )
 242  002e 5f            	clrw	x
 243  002f 7b03          	ld	a,(OFST+0,sp)
 244  0031 97            	ld	xl,a
 245  0032 d60030        	ld	a,(_vtbl+32,x)
 246  0035 c10004        	cp	a,_ev+2
 247  0038 2704          	jreq	L37
 248                     ; 108 				k = 1;
 250  003a a601          	ld	a,#1
 251  003c 6b02          	ld	(OFST-1,sp),a
 252  003e               L37:
 253                     ; 109 			if( vtbl.setup[i] != ev.set )
 255  003e 7b03          	ld	a,(OFST+0,sp)
 256  0040 5f            	clrw	x
 257  0041 97            	ld	xl,a
 258  0042 d60040        	ld	a,(_vtbl+48,x)
 259  0045 c10005        	cp	a,_ev+3
 260  0048 2704          	jreq	L57
 261                     ; 110 				k = 1;
 263  004a a601          	ld	a,#1
 264  004c 6b02          	ld	(OFST-1,sp),a
 265  004e               L57:
 266                     ; 111 			if( k == 1 )
 268  004e 7b02          	ld	a,(OFST-1,sp)
 269  0050 4a            	dec	a
 270  0051 2629          	jrne	L17
 271                     ; 113 				vtbl.curr[i] = ev.curr;
 273  0053 7b03          	ld	a,(OFST+0,sp)
 274  0055 5f            	clrw	x
 275  0056 97            	ld	xl,a
 276  0057 c60004        	ld	a,_ev+2
 277  005a d70030        	ld	(_vtbl+32,x),a
 278                     ; 114 				vtbl.setup[i] = ev.set;
 280  005d 5f            	clrw	x
 281  005e 7b03          	ld	a,(OFST+0,sp)
 282  0060 97            	ld	xl,a
 283  0061 c60005        	ld	a,_ev+3
 284  0064 d70040        	ld	(_vtbl+48,x),a
 285                     ; 115 				vtbl.cmd[i] = ev.mode;
 287  0067 5f            	clrw	x
 288  0068 7b03          	ld	a,(OFST+0,sp)
 289  006a 97            	ld	xl,a
 290  006b c60003        	ld	a,_ev+1
 291  006e d70010        	ld	(_vtbl,x),a
 292                     ; 116 				vtbl.t[i] = TBL_CALC_EVENT_TIMER;
 294  0071 5f            	clrw	x
 295  0072 7b03          	ld	a,(OFST+0,sp)
 296  0074 97            	ld	xl,a
 297  0075 a602          	ld	a,#2
 298  0077 d70050        	ld	(_vtbl+64,x),a
 299                     ; 117 				j++;
 301  007a 0c01          	inc	(OFST-2,sp)
 302  007c               L17:
 303                     ; 91 	for( i=0; i<TBL_V_SIZE; i++ )
 305  007c 0c03          	inc	(OFST+0,sp)
 308  007e 7b03          	ld	a,(OFST+0,sp)
 309  0080 a110          	cp	a,#16
 310  0082 2583          	jrult	L75
 311                     ; 121 	for( i=0; i<PACKET_SIZE; i++ )
 313  0084 4f            	clr	a
 314  0085 6b03          	ld	(OFST+0,sp),a
 315  0087               L101:
 316                     ; 123 		if( packet_buf[i] == PACKET_ERROR_COUNT )
 318  0087 5f            	clrw	x
 319  0088 97            	ld	xl,a
 320  0089 d60000        	ld	a,(_packet_buf,x)
 321  008c a11e          	cp	a,#30
 322  008e 2633          	jrne	L701
 323                     ; 125 			for( k=0; k<TBL_V_SIZE; k++ )
 325  0090 4f            	clr	a
 326  0091 6b02          	ld	(OFST-1,sp),a
 327  0093               L111:
 328                     ; 127 				if( vtbl.valve2rc[k] == (i+1) )
 330  0093 5f            	clrw	x
 331  0094 97            	ld	xl,a
 332  0095 d60060        	ld	a,(_vtbl+80,x)
 333  0098 5f            	clrw	x
 334  0099 97            	ld	xl,a
 335  009a 7b03          	ld	a,(OFST+0,sp)
 336  009c 905f          	clrw	y
 337  009e 9097          	ld	yl,a
 338  00a0 905c          	incw	y
 339  00a2 90bf00        	ldw	c_y,y
 340  00a5 b300          	cpw	x,c_y
 341  00a7 2612          	jrne	L711
 342                     ; 129 					vtbl.curr[k] = 0x80;
 344  00a9 7b02          	ld	a,(OFST-1,sp)
 345  00ab 5f            	clrw	x
 346  00ac 97            	ld	xl,a
 347  00ad a680          	ld	a,#128
 348  00af d70030        	ld	(_vtbl+32,x),a
 349                     ; 130 					vtbl.setup[k] = 0x40;
 351  00b2 5f            	clrw	x
 352  00b3 7b02          	ld	a,(OFST-1,sp)
 353  00b5 97            	ld	xl,a
 354  00b6 a640          	ld	a,#64
 355  00b8 d70040        	ld	(_vtbl+48,x),a
 356  00bb               L711:
 357                     ; 125 			for( k=0; k<TBL_V_SIZE; k++ )
 359  00bb 0c02          	inc	(OFST-1,sp)
 362  00bd 7b02          	ld	a,(OFST-1,sp)
 363  00bf a110          	cp	a,#16
 364  00c1 25d0          	jrult	L111
 365  00c3               L701:
 366                     ; 134 		if( __mt_closeError[i] >= 100 )
 368  00c3 7b03          	ld	a,(OFST+0,sp)
 369  00c5 5f            	clrw	x
 370  00c6 97            	ld	xl,a
 371  00c7 d60000        	ld	a,(___mt_closeError,x)
 372  00ca a164          	cp	a,#100
 373  00cc 251a          	jrult	L121
 374                     ; 136 			vtbl.curr[i] = 0x81;
 376  00ce 7b03          	ld	a,(OFST+0,sp)
 377  00d0 5f            	clrw	x
 378  00d1 97            	ld	xl,a
 379  00d2 a681          	ld	a,#129
 380  00d4 d70030        	ld	(_vtbl+32,x),a
 381                     ; 137 			vtbl.setup[i] = 0x41;
 383  00d7 5f            	clrw	x
 384  00d8 7b03          	ld	a,(OFST+0,sp)
 385  00da 97            	ld	xl,a
 386  00db a641          	ld	a,#65
 387  00dd d70040        	ld	(_vtbl+48,x),a
 388                     ; 138 			vtbl.t[i] = 0;
 390  00e0 5f            	clrw	x
 391  00e1 7b03          	ld	a,(OFST+0,sp)
 392  00e3 97            	ld	xl,a
 393  00e4 724f0050      	clr	(_vtbl+64,x)
 394  00e8               L121:
 395                     ; 121 	for( i=0; i<PACKET_SIZE; i++ )
 397  00e8 0c03          	inc	(OFST+0,sp)
 400  00ea 7b03          	ld	a,(OFST+0,sp)
 401  00ec a110          	cp	a,#16
 402  00ee 2597          	jrult	L101
 403                     ; 141 	return j;
 405  00f0 7b01          	ld	a,(OFST-2,sp)
 408  00f2 5b03          	addw	sp,#3
 409  00f4 81            	ret	
 460                     ; 144 uint8_t	vtbl_calc(uint8_t cmd)
 460                     ; 145 {
 461                     .text:	section	.text,new
 462  0000               _vtbl_calc:
 464  0000 89            	pushw	x
 465       00000002      OFST:	set	2
 468                     ; 149 	for( i=0; i<TBL_V_SIZE; i++ )
 470  0001 4f            	clr	a
 471  0002 6b02          	ld	(OFST+0,sp),a
 472  0004               L341:
 473                     ; 151 		if( vtbl.run[i] == 0 )
 475  0004 5f            	clrw	x
 476  0005 97            	ld	xl,a
 477  0006 724d00be      	tnz	(_vtbl+174,x)
 478  000a 2655          	jrne	L151
 479                     ; 153 			if( vtbl.curr[i] < vtbl.setup[i] )
 481  000c 5f            	clrw	x
 482  000d 97            	ld	xl,a
 483  000e cd01a3        	call	LC006
 484  0011 d10040        	cp	a,(_vtbl+48,x)
 485  0014 7b02          	ld	a,(OFST+0,sp)
 486  0016 5f            	clrw	x
 487  0017 97            	ld	xl,a
 488  0018 2441          	jruge	L351
 489                     ; 155 				j = vtbl.setup[i] - vtbl.curr[i];
 491  001a cd01a3        	call	LC006
 492  001d d00040        	sub	a,(_vtbl+48,x)
 493  0020 40            	neg	a
 494  0021 6b01          	ld	(OFST-1,sp),a
 495                     ; 156 				if( j >= 10 )		tbl_temp[i] = 100;
 497  0023 a10a          	cp	a,#10
 500  0025 2414          	jruge	LC002
 501                     ; 157 				else if( j >= 6 )	tbl_temp[i] = 100;
 503  0027 a106          	cp	a,#6
 506  0029 2410          	jruge	LC002
 507                     ; 158 				else if( j == 5 )	tbl_temp[i] = 100;
 509  002b a105          	cp	a,#5
 512  002d 270c          	jreq	LC002
 513                     ; 159 				else if( j == 4 )	tbl_temp[i] = 100;
 515  002f a104          	cp	a,#4
 518  0031 2708          	jreq	LC002
 519                     ; 160 				else if( j == 3 )	tbl_temp[i] = 100;
 521  0033 a103          	cp	a,#3
 524  0035 2704          	jreq	LC002
 525                     ; 161 				else if( j == 2 )	tbl_temp[i] = 100;
 527  0037 a102          	cp	a,#2
 528  0039 2608          	jrne	L102
 531  003b               LC002:
 537  003b 7b02          	ld	a,(OFST+0,sp)
 538  003d 5f            	clrw	x
 539  003e cd01ac        	call	LC007
 541  0041 2008          	jra	L751
 542  0043               L102:
 543                     ; 162 				else if( j == 1 )	tbl_temp[i] = 0;	
 547                     ; 164 					tbl_temp[i] = 0;
 550  0043 7b02          	ld	a,(OFST+0,sp)
 551  0045 5f            	clrw	x
 552  0046 97            	ld	xl,a
 553  0047 724f0000      	clr	(_tbl_temp,x)
 554  004b               L751:
 555                     ; 166 				if( tbl_temp[i] != 0 )
 557  004b 7b02          	ld	a,(OFST+0,sp)
 558  004d cd01b3        	call	LC008
 559  0050 2764          	jreq	L512
 560                     ; 167 					vtbl.run[i] = 1;
 562  0052 5f            	clrw	x
 563  0053 97            	ld	xl,a
 564  0054 a601          	ld	a,#1
 565  0056 d700be        	ld	(_vtbl+174,x),a
 566  0059 205b          	jra	L512
 567  005b               L351:
 568                     ; 170 				tbl_temp[i] = 0;
 570  005b 724f0000      	clr	(_tbl_temp,x)
 571  005f 2055          	jra	L512
 572  0061               L151:
 573                     ; 174 			if( vtbl.curr[i] < vtbl.setup[i] )
 575  0061 5f            	clrw	x
 576  0062 97            	ld	xl,a
 577  0063 cd01a3        	call	LC006
 578  0066 d10040        	cp	a,(_vtbl+48,x)
 579  0069 7b02          	ld	a,(OFST+0,sp)
 580  006b 5f            	clrw	x
 581  006c 97            	ld	xl,a
 582  006d 243d          	jruge	L712
 583                     ; 176 				j = vtbl.setup[i] - vtbl.curr[i];
 585  006f cd01a3        	call	LC006
 586  0072 d00040        	sub	a,(_vtbl+48,x)
 587  0075 40            	neg	a
 588  0076 6b01          	ld	(OFST-1,sp),a
 589                     ; 177 				if( j >= 10 )		tbl_temp[i] = 100;
 591  0078 a10a          	cp	a,#10
 594  007a 2417          	jruge	LC003
 595                     ; 178 				else if( j >= 6 )	tbl_temp[i] = 100;
 597  007c a106          	cp	a,#6
 600  007e 2413          	jruge	LC003
 601                     ; 179 				else if( j == 5 )	tbl_temp[i] = 100;
 603  0080 a105          	cp	a,#5
 606  0082 270f          	jreq	LC003
 607                     ; 180 				else if( j == 4 )	tbl_temp[i] = 100;
 609  0084 a104          	cp	a,#4
 612  0086 270b          	jreq	LC003
 613                     ; 181 				else if( j == 3 )	tbl_temp[i] = 100;
 615  0088 a103          	cp	a,#3
 618  008a 2707          	jreq	LC003
 619                     ; 182 				else if( j == 2 )	tbl_temp[i] = 100;
 621  008c a102          	cp	a,#2
 624  008e 2703          	jreq	LC003
 625                     ; 183 				else if( j == 1 )	tbl_temp[i] = 100;	
 627  0090 4a            	dec	a
 628  0091 2608          	jrne	L152
 631  0093               LC003:
 638  0093 7b02          	ld	a,(OFST+0,sp)
 639  0095 5f            	clrw	x
 640  0096 cd01ac        	call	LC007
 642  0099 2008          	jra	L322
 643  009b               L152:
 644                     ; 185 					tbl_temp[i] = 0;
 646  009b 7b02          	ld	a,(OFST+0,sp)
 647  009d 5f            	clrw	x
 648  009e 97            	ld	xl,a
 649  009f 724f0000      	clr	(_tbl_temp,x)
 650  00a3               L322:
 651                     ; 187 				if( tbl_temp[i] == 0 )
 653  00a3 7b02          	ld	a,(OFST+0,sp)
 654  00a5 cd01b3        	call	LC008
 655  00a8 260c          	jrne	L512
 656                     ; 188 					vtbl.run[i] = 0;
 657  00aa 2004          	jp	LC004
 658  00ac               L712:
 659                     ; 192 				tbl_temp[i] = 0;
 661  00ac 724f0000      	clr	(_tbl_temp,x)
 662                     ; 193 				vtbl.run[i] = 0;
 664  00b0               LC004:
 666  00b0 5f            	clrw	x
 667  00b1 97            	ld	xl,a
 668  00b2 724f00be      	clr	(_vtbl+174,x)
 669  00b6               L512:
 670                     ; 196 		if( vtbl.freeze[i] == 0 )
 672  00b6 7b02          	ld	a,(OFST+0,sp)
 673  00b8 5f            	clrw	x
 674  00b9 97            	ld	xl,a
 675  00ba 724d00ae      	tnz	(_vtbl+158,x)
 676  00be 261a          	jrne	L162
 677                     ; 198 			if( vtbl.curr[i] <= 10 )
 679  00c0 5f            	clrw	x
 680  00c1 97            	ld	xl,a
 681  00c2 d60030        	ld	a,(_vtbl+32,x)
 682  00c5 a10b          	cp	a,#11
 683  00c7 2438          	jruge	L562
 684                     ; 200 				vtbl.freeze[i] = 1;
 686  00c9 7b02          	ld	a,(OFST+0,sp)
 687  00cb 5f            	clrw	x
 688  00cc 97            	ld	xl,a
 689  00cd a601          	ld	a,#1
 690  00cf d700ae        	ld	(_vtbl+158,x),a
 691                     ; 201 				tbl_temp[i] = 100;
 693  00d2 5f            	clrw	x
 694  00d3 7b02          	ld	a,(OFST+0,sp)
 695  00d5 cd01ac        	call	LC007
 696  00d8 2027          	jra	L562
 697  00da               L162:
 698                     ; 204 		else if( vtbl.freeze[i] == 1 )
 700  00da 5f            	clrw	x
 701  00db 97            	ld	xl,a
 702  00dc d600ae        	ld	a,(_vtbl+158,x)
 703  00df 4a            	dec	a
 704  00e0 261f          	jrne	L562
 705                     ; 207 			tbl_temp[i] = 100;
 707  00e2 7b02          	ld	a,(OFST+0,sp)
 708  00e4 5f            	clrw	x
 709  00e5 cd01ac        	call	LC007
 710                     ; 208 			if( vtbl.curr[i] >= 14 )
 712  00e8 5f            	clrw	x
 713  00e9 7b02          	ld	a,(OFST+0,sp)
 714  00eb 97            	ld	xl,a
 715  00ec d60030        	ld	a,(_vtbl+32,x)
 716  00ef a10e          	cp	a,#14
 717  00f1 250e          	jrult	L562
 718                     ; 211 				vtbl.freeze[i] = 0;
 720  00f3 7b02          	ld	a,(OFST+0,sp)
 721  00f5 5f            	clrw	x
 722  00f6 97            	ld	xl,a
 723  00f7 724f00ae      	clr	(_vtbl+158,x)
 724                     ; 212 				tbl_temp[i] = 0;
 726  00fb 5f            	clrw	x
 727  00fc 97            	ld	xl,a
 728  00fd 724f0000      	clr	(_tbl_temp,x)
 729  0101               L562:
 730                     ; 149 	for( i=0; i<TBL_V_SIZE; i++ )
 732  0101 0c02          	inc	(OFST+0,sp)
 735  0103 7b02          	ld	a,(OFST+0,sp)
 736  0105 a110          	cp	a,#16
 737  0107 2403cc0004    	jrult	L341
 738                     ; 216 	for( i=0; i<TBL_V_SIZE; i++ )
 740  010c 4f            	clr	a
 741  010d 6b02          	ld	(OFST+0,sp),a
 742  010f               L372:
 743                     ; 218 		if( vtbl.valve2rc[i] == 0 )
 745  010f 5f            	clrw	x
 746  0110 97            	ld	xl,a
 747  0111 724d0060      	tnz	(_vtbl+80,x)
 748  0115 2612          	jrne	L103
 749                     ; 220 			vtbl.curr[i] = 0;
 751  0117 5f            	clrw	x
 752  0118 97            	ld	xl,a
 753  0119 724f0030      	clr	(_vtbl+32,x)
 754                     ; 221 			vtbl.setup[i] = 0;
 756  011d 5f            	clrw	x
 757  011e 97            	ld	xl,a
 758  011f 724f0040      	clr	(_vtbl+48,x)
 759                     ; 222 			tbl_temp[i] = 0;
 761  0123 5f            	clrw	x
 762  0124 97            	ld	xl,a
 763  0125 724f0000      	clr	(_tbl_temp,x)
 764  0129               L103:
 765                     ; 216 	for( i=0; i<TBL_V_SIZE; i++ )
 767  0129 0c02          	inc	(OFST+0,sp)
 770  012b 7b02          	ld	a,(OFST+0,sp)
 771  012d a110          	cp	a,#16
 772  012f 25de          	jrult	L372
 773                     ; 226 	funcInfo.rcLED = 0;
 775  0131 725f0012      	clr	_funcInfo+18
 776                     ; 227 	for( i=0; i<TBL_V_SIZE; i++ )
 778  0135 4f            	clr	a
 779  0136 6b02          	ld	(OFST+0,sp),a
 780  0138               L303:
 781                     ; 229 		if( tbl_temp[i] != 0 )
 783  0138 ad79          	call	LC008
 784  013a 2717          	jreq	L113
 785                     ; 231 			funcInfo.rcLED |= 1<<(vtbl.valve2rc[i]-1);
 787  013c 5f            	clrw	x
 788  013d 97            	ld	xl,a
 789  013e d60060        	ld	a,(_vtbl+80,x)
 790  0141 4a            	dec	a
 791  0142 5f            	clrw	x
 792  0143 97            	ld	xl,a
 793  0144 a601          	ld	a,#1
 794  0146 5d            	tnzw	x
 795  0147 2704          	jreq	L21
 796  0149               L41:
 797  0149 48            	sll	a
 798  014a 5a            	decw	x
 799  014b 26fc          	jrne	L41
 800  014d               L21:
 801  014d ca0012        	or	a,_funcInfo+18
 802  0150 c70012        	ld	_funcInfo+18,a
 803  0153               L113:
 804                     ; 227 	for( i=0; i<TBL_V_SIZE; i++ )
 806  0153 0c02          	inc	(OFST+0,sp)
 809  0155 7b02          	ld	a,(OFST+0,sp)
 810  0157 a110          	cp	a,#16
 811  0159 25dd          	jrult	L303
 812                     ; 234 	if( vtbl.cntlMode == 0 && funcInfo2.lpmType==7 )
 814  015b c600ac        	ld	a,_vtbl+156
 815  015e 260a          	jrne	L313
 817  0160 c6000c        	ld	a,_funcInfo2+12
 818  0163 a107          	cp	a,#7
 819                     ; 238 		return 0;
 821  0165 270d          	jreq	L02
 822  0167 c600ac        	ld	a,_vtbl+156
 823  016a               L313:
 824                     ; 240 	if( vtbl.cntlMode == 1 && funcInfo2.lpmType==7 )
 826  016a 4a            	dec	a
 827  016b 260a          	jrne	L513
 829  016d c6000c        	ld	a,_funcInfo2+12
 830  0170 a107          	cp	a,#7
 831  0172 2603          	jrne	L513
 832                     ; 244 		return 0;
 835  0174               L02:
 838  0174 4f            	clr	a
 840  0175 85            	popw	x
 841  0176 81            	ret	
 842  0177               L513:
 843                     ; 246 	for( i=0; i<TBL_V_SIZE; i++ )
 845  0177 0f02          	clr	(OFST+0,sp)
 846  0179               L713:
 847                     ; 248 		if( cntGetType() == 0 )
 849  0179 cd0000        	call	_cntGetType
 851  017c 4d            	tnz	a
 852  017d 2608          	jrne	L523
 853                     ; 250 			if( i >= TBL_V_SIZE/2 )
 855  017f 7b02          	ld	a,(OFST+0,sp)
 856  0181 a108          	cp	a,#8
 857  0183 2514          	jrult	L133
 858                     ; 252 				vtbl.coil[i] = 0;
 859                     ; 253 				tbl_temp[i] = 0;
 860  0185 2006          	jp	LC005
 861  0187               L523:
 862                     ; 258 			if( i < TBL_V_SIZE/2 )
 864  0187 7b02          	ld	a,(OFST+0,sp)
 865  0189 a108          	cp	a,#8
 866  018b 240c          	jruge	L133
 867                     ; 262 				vtbl.coil[i] = 0;
 869                     ; 263 				tbl_temp[i] = 0;
 871  018d               LC005:
 873  018d 5f            	clrw	x
 874  018e 97            	ld	xl,a
 875  018f 724f0020      	clr	(_vtbl+16,x)
 877  0193 5f            	clrw	x
 878  0194 97            	ld	xl,a
 879  0195 724f0000      	clr	(_tbl_temp,x)
 880  0199               L133:
 881                     ; 246 	for( i=0; i<TBL_V_SIZE; i++ )
 883  0199 0c02          	inc	(OFST+0,sp)
 886  019b 7b02          	ld	a,(OFST+0,sp)
 887  019d a110          	cp	a,#16
 888  019f 25d8          	jrult	L713
 889                     ; 267 	return 0;
 891  01a1 20d1          	jra	L02
 892  01a3               LC006:
 893  01a3 905f          	clrw	y
 894  01a5 9097          	ld	yl,a
 895  01a7 90d60030      	ld	a,(_vtbl+32,y)
 896  01ab 81            	ret	
 897  01ac               LC007:
 898  01ac 97            	ld	xl,a
 899  01ad a664          	ld	a,#100
 900  01af d70000        	ld	(_tbl_temp,x),a
 901  01b2 81            	ret	
 902  01b3               LC008:
 903  01b3 5f            	clrw	x
 904  01b4 97            	ld	xl,a
 905  01b5 724d0000      	tnz	(_tbl_temp,x)
 906  01b9 81            	ret	
 946                     ; 270 uint8_t	vtbl_getCoilLarge(void)
 946                     ; 271 {
 947                     .text:	section	.text,new
 948  0000               _vtbl_getCoilLarge:
 950  0000 89            	pushw	x
 951       00000002      OFST:	set	2
 954                     ; 273 	j = 0;
 956  0001 0f01          	clr	(OFST-1,sp)
 957                     ; 274 	for( i=1; i<TBL_V_SIZE; i++ )
 959  0003 a601          	ld	a,#1
 960  0005 6b02          	ld	(OFST+0,sp),a
 961  0007               L353:
 962                     ; 276 		if( vtbl.coil[i] > vtbl.coil[j] )
 964  0007 7b01          	ld	a,(OFST-1,sp)
 965  0009 5f            	clrw	x
 966  000a 97            	ld	xl,a
 967  000b 7b02          	ld	a,(OFST+0,sp)
 968  000d 905f          	clrw	y
 969  000f 9097          	ld	yl,a
 970  0011 90d60020      	ld	a,(_vtbl+16,y)
 971  0015 d10020        	cp	a,(_vtbl+16,x)
 972  0018 2304          	jrule	L163
 973                     ; 277 			j = i;
 975  001a 7b02          	ld	a,(OFST+0,sp)
 976  001c 6b01          	ld	(OFST-1,sp),a
 977  001e               L163:
 978                     ; 274 	for( i=1; i<TBL_V_SIZE; i++ )
 980  001e 0c02          	inc	(OFST+0,sp)
 983  0020 7b02          	ld	a,(OFST+0,sp)
 984  0022 a110          	cp	a,#16
 985  0024 25e1          	jrult	L353
 986                     ; 279 	return j;
 988  0026 7b01          	ld	a,(OFST-1,sp)
 991  0028 85            	popw	x
 992  0029 81            	ret	
1024                     ; 287 void	vtbl_disp(uint8_t id)
1024                     ; 288 {
1025                     .text:	section	.text,new
1026  0000               _vtbl_disp:
1030                     ; 329 }
1033  0000 81            	ret	
1083                     ; 331 void	vtbl_local_sub(void)
1083                     ; 332 {
1084                     .text:	section	.text,new
1085  0000               _vtbl_local_sub:
1087  0000 89            	pushw	x
1088       00000002      OFST:	set	2
1091                     ; 334 	for( i=0; i<funcInfo2.valve; i++ )
1093  0001 0f01          	clr	(OFST-1,sp)
1095  0003 2024          	jra	L524
1096  0005               L124:
1097                     ; 336 		k = i + TBL_V_SIZE/2;
1099  0005 ab08          	add	a,#8
1100  0007 6b02          	ld	(OFST+0,sp),a
1101                     ; 338 		if( vtbl.openCount[k] != 0 )
1103  0009 5f            	clrw	x
1104  000a 97            	ld	xl,a
1105  000b 724d0070      	tnz	(_vtbl+96,x)
1106  000f 2716          	jreq	L134
1107                     ; 340 			if( vtbl.openCount2[k] != 200 )
1109  0011 cd00b4        	call	LC012
1110  0014 a1c8          	cp	a,#200
1111  0016 270f          	jreq	L134
1112                     ; 341 				toolSetPush(i, vtbl.openCount2[k], TS_CNTL_OPEN);
1114  0018 4b06          	push	#6
1115  001a 7b03          	ld	a,(OFST+1,sp)
1116  001c cd00b4        	call	LC012
1117  001f 97            	ld	xl,a
1118  0020 7b02          	ld	a,(OFST+0,sp)
1119  0022 95            	ld	xh,a
1120  0023 cd0000        	call	_toolSetPush
1122  0026 84            	pop	a
1123  0027               L134:
1124                     ; 334 	for( i=0; i<funcInfo2.valve; i++ )
1126  0027 0c01          	inc	(OFST-1,sp)
1127  0029               L524:
1130  0029 7b01          	ld	a,(OFST-1,sp)
1131  002b c1000d        	cp	a,_funcInfo2+13
1132  002e 25d5          	jrult	L124
1133                     ; 344 	k = TBL_V_SIZE/2;
1135                     ; 345 	if( funcInfo2.lpmType != 0 && CNTL_LPM_SUB )
1137  0030 c6000c        	ld	a,_funcInfo2+12
1138  0033 2748          	jreq	L773
1140  0035 a107          	cp	a,#7
1141  0037 2744          	jreq	L773
1142                     ; 347 		if( __mt_closeError[funcInfo2.valve + k] >= 100 )
1144  0039 c6000d        	ld	a,_funcInfo2+13
1145  003c 5f            	clrw	x
1146  003d 97            	ld	xl,a
1147  003e d60008        	ld	a,(___mt_closeError+8,x)
1148  0041 a164          	cp	a,#100
1149  0043 2438          	jruge	L773
1150                     ; 348 			goto ValveEntry;
1152                     ; 351 		if( vtbl._result2 > vtbl._result )
1154  0045 c600a8        	ld	a,_vtbl+152
1155  0048 c100a7        	cp	a,_vtbl+151
1156  004b 2316          	jrule	L144
1157                     ; 353 			if( vtbl._result == 0 )
1159  004d 725d00a7      	tnz	_vtbl+151
1160  0051 2607          	jrne	L344
1161                     ; 354 				toolSetPush(funcInfo2.valve, 1, TS_CLOSE_2P);
1163  0053 4b0d          	push	#13
1164  0055 ae0001        	ldw	x,#1
1167  0058 201b          	jp	LC009
1168  005a               L344:
1169                     ; 357 				j = vtbl._result2 - vtbl._result;
1171  005a c000a7        	sub	a,_vtbl+151
1172  005d 6b02          	ld	(OFST+0,sp),a
1173                     ; 358 				toolSetPush(funcInfo2.valve, j, TS_CNTL_MINUS);
1175  005f 4b05          	push	#5
1177  0061 200f          	jp	LC010
1178  0063               L144:
1179                     ; 361 		else if( vtbl._result2 == vtbl._result )
1181  0063 c100a7        	cp	a,_vtbl+151
1182  0066 2715          	jreq	L773
1184                     ; 366 			j = vtbl._result - vtbl._result2;
1186  0068 c600a7        	ld	a,_vtbl+151
1187  006b c000a8        	sub	a,_vtbl+152
1188  006e 6b02          	ld	(OFST+0,sp),a
1189                     ; 367 			toolSetPush(funcInfo2.valve, j, TS_CNTL_PLUS);
1191  0070 4b04          	push	#4
1192  0072               LC010:
1193  0072 7b03          	ld	a,(OFST+1,sp)
1194  0074 97            	ld	xl,a
1196  0075               LC009:
1197  0075 c6000d        	ld	a,_funcInfo2+13
1198  0078 95            	ld	xh,a
1199  0079 cd0000        	call	_toolSetPush
1200  007c 84            	pop	a
1201  007d               L773:
1202                     ; 370 ValveEntry:	
1202                     ; 371 	for( i=0; i<funcInfo2.valve; i++ )
1204  007d 0f01          	clr	(OFST-1,sp)
1206  007f 202a          	jra	L164
1207  0081               L554:
1208                     ; 373 		k = i + TBL_V_SIZE/2;
1210  0081 ab08          	add	a,#8
1211  0083 6b02          	ld	(OFST+0,sp),a
1212                     ; 375 		if( vtbl.openCount[k] == 0 )
1214  0085 5f            	clrw	x
1215  0086 97            	ld	xl,a
1216  0087 724d0070      	tnz	(_vtbl+96,x)
1217  008b 260b          	jrne	L564
1218                     ; 377 			if( vtbl.openCount2[k] != 0 )
1220  008d ad25          	call	LC012
1221  008f 2718          	jreq	L174
1222                     ; 378 				toolSetPush(i, 1, TS_CLOSE);
1224  0091 4b01          	push	#1
1225  0093 ae0001        	ldw	x,#1
1227  0096 200a          	jp	LC011
1228  0098               L564:
1229                     ; 381 			toolSetPush(i, vtbl.openCount[k], TS_CNTL_MOVE);
1231  0098 4b08          	push	#8
1232  009a 7b03          	ld	a,(OFST+1,sp)
1233  009c 5f            	clrw	x
1234  009d 97            	ld	xl,a
1235  009e d60070        	ld	a,(_vtbl+96,x)
1236  00a1 97            	ld	xl,a
1238  00a2               LC011:
1239  00a2 7b02          	ld	a,(OFST+0,sp)
1240  00a4 95            	ld	xh,a
1241  00a5 cd0000        	call	_toolSetPush
1242  00a8 84            	pop	a
1243  00a9               L174:
1244                     ; 371 	for( i=0; i<funcInfo2.valve; i++ )
1246  00a9 0c01          	inc	(OFST-1,sp)
1247  00ab               L164:
1250  00ab 7b01          	ld	a,(OFST-1,sp)
1251  00ad c1000d        	cp	a,_funcInfo2+13
1252  00b0 25cf          	jrult	L554
1253                     ; 383 }
1256  00b2 85            	popw	x
1257  00b3 81            	ret	
1258  00b4               LC012:
1259  00b4 5f            	clrw	x
1260  00b5 97            	ld	xl,a
1261  00b6 d60080        	ld	a,(_vtbl+112,x)
1262  00b9 81            	ret	
1306                     ; 385 void	vtbl_local_main(void)
1306                     ; 386 {
1307                     .text:	section	.text,new
1308  0000               _vtbl_local_main:
1310  0000 88            	push	a
1311       00000001      OFST:	set	1
1314                     ; 388 	for( i=0; i<funcInfo.valve; i++ )
1316  0001 0f01          	clr	(OFST+0,sp)
1318  0003 2020          	jra	L715
1319  0005               L315:
1320                     ; 390 		if( vtbl.openCount[i] != 0 )
1322  0005 5f            	clrw	x
1323  0006 97            	ld	xl,a
1324  0007 724d0070      	tnz	(_vtbl+96,x)
1325  000b 2716          	jreq	L325
1326                     ; 393 			if( vtbl.openCount2[i] != 200 )
1328  000d cd00c4        	call	LC016
1329  0010 a1c8          	cp	a,#200
1330  0012 270f          	jreq	L325
1331                     ; 394 				toolSetPush(i, vtbl.openCount2[i], TS_CNTL_OPEN);
1333  0014 4b06          	push	#6
1334  0016 7b02          	ld	a,(OFST+1,sp)
1335  0018 cd00c4        	call	LC016
1336  001b 97            	ld	xl,a
1337  001c 7b02          	ld	a,(OFST+1,sp)
1338  001e 95            	ld	xh,a
1339  001f cd0000        	call	_toolSetPush
1341  0022 84            	pop	a
1342  0023               L325:
1343                     ; 388 	for( i=0; i<funcInfo.valve; i++ )
1345  0023 0c01          	inc	(OFST+0,sp)
1346  0025               L715:
1349  0025 7b01          	ld	a,(OFST+0,sp)
1350  0027 c1000d        	cp	a,_funcInfo+13
1351  002a 25d9          	jrult	L315
1352                     ; 397 	if( funcInfo.lpmType != 0 )
1354  002c c6000c        	ld	a,_funcInfo+12
1355  002f 2760          	jreq	L374
1356                     ; 399 		if( __mt_closeError[funcInfo.valve] >= 100 )
1358  0031 c6000d        	ld	a,_funcInfo+13
1359  0034 5f            	clrw	x
1360  0035 97            	ld	xl,a
1361  0036 d60000        	ld	a,(___mt_closeError,x)
1362  0039 a164          	cp	a,#100
1363  003b 2511          	jrult	L135
1364                     ; 402 			if( __mt_closeError[funcInfo.valve] < 200 && funcInfo.boiler_type == 0 )
1366  003d c6000d        	ld	a,_funcInfo+13
1367  0040 5f            	clrw	x
1368  0041 97            	ld	xl,a
1369  0042 d60000        	ld	a,(___mt_closeError,x)
1370  0045 a1c8          	cp	a,#200
1371  0047 2405          	jruge	L135
1373  0049 c60005        	ld	a,_funcInfo+5
1374  004c 2743          	jreq	L374
1375                     ; 403 				goto ValveEntry;
1377  004e               L135:
1378                     ; 406 		toolSetPos(vtbl._result, funcInfo.valve);
1380  004e c6000d        	ld	a,_funcInfo+13
1381  0051 97            	ld	xl,a
1382  0052 c600a7        	ld	a,_vtbl+151
1383  0055 95            	ld	xh,a
1384  0056 cd0000        	call	_toolSetPos
1386                     ; 407 		if( vtbl._result2 > vtbl._result )
1388  0059 c600a8        	ld	a,_vtbl+152
1389  005c c100a7        	cp	a,_vtbl+151
1390  005f 2316          	jrule	L535
1391                     ; 409 			if( vtbl._result == 0 )
1393  0061 725d00a7      	tnz	_vtbl+151
1394  0065 2607          	jrne	L735
1395                     ; 410 				toolSetPush(funcInfo.valve, 1, TS_CLOSE_2P);
1397  0067 4b0d          	push	#13
1398  0069 ae0001        	ldw	x,#1
1401  006c 201b          	jp	LC013
1402  006e               L735:
1403                     ; 413 				j = vtbl._result2 - vtbl._result;
1405  006e c000a7        	sub	a,_vtbl+151
1406  0071 6b01          	ld	(OFST+0,sp),a
1407                     ; 414 				toolSetPush(funcInfo.valve, j, TS_CNTL_MINUS);
1409  0073 4b05          	push	#5
1411  0075 200f          	jp	LC014
1412  0077               L535:
1413                     ; 417 		else if( vtbl._result2 == vtbl._result )
1415  0077 c100a7        	cp	a,_vtbl+151
1416  007a 2715          	jreq	L374
1418                     ; 422 			j = vtbl._result - vtbl._result2;
1420  007c c600a7        	ld	a,_vtbl+151
1421  007f c000a8        	sub	a,_vtbl+152
1422  0082 6b01          	ld	(OFST+0,sp),a
1423                     ; 423 			toolSetPush(funcInfo.valve, j, TS_CNTL_PLUS);
1425  0084 4b04          	push	#4
1426  0086               LC014:
1427  0086 7b02          	ld	a,(OFST+1,sp)
1428  0088 97            	ld	xl,a
1430  0089               LC013:
1431  0089 c6000d        	ld	a,_funcInfo+13
1432  008c 95            	ld	xh,a
1433  008d cd0000        	call	_toolSetPush
1434  0090 84            	pop	a
1435  0091               L374:
1436                     ; 426 ValveEntry:	
1436                     ; 427 	for( i=0; i<funcInfo.valve; i++ )
1438  0091 0f01          	clr	(OFST+0,sp)
1440  0093 2026          	jra	L555
1441  0095               L155:
1442                     ; 430 		if( vtbl.openCount[i] == 0 )
1444  0095 5f            	clrw	x
1445  0096 97            	ld	xl,a
1446  0097 724d0070      	tnz	(_vtbl+96,x)
1447  009b 260b          	jrne	L165
1448                     ; 432 			if( vtbl.openCount2[i] != 0 )
1450  009d ad25          	call	LC016
1451  009f 2718          	jreq	L565
1452                     ; 433 				toolSetPush(i, 1, TS_CLOSE);
1454  00a1 4b01          	push	#1
1455  00a3 ae0001        	ldw	x,#1
1457  00a6 200a          	jp	LC015
1458  00a8               L165:
1459                     ; 436 			toolSetPush(i, vtbl.openCount[i], TS_CNTL_MOVE);
1461  00a8 4b08          	push	#8
1462  00aa 7b02          	ld	a,(OFST+1,sp)
1463  00ac 5f            	clrw	x
1464  00ad 97            	ld	xl,a
1465  00ae d60070        	ld	a,(_vtbl+96,x)
1466  00b1 97            	ld	xl,a
1468  00b2               LC015:
1469  00b2 7b02          	ld	a,(OFST+1,sp)
1470  00b4 95            	ld	xh,a
1471  00b5 cd0000        	call	_toolSetPush
1472  00b8 84            	pop	a
1473  00b9               L565:
1474                     ; 427 	for( i=0; i<funcInfo.valve; i++ )
1476  00b9 0c01          	inc	(OFST+0,sp)
1477  00bb               L555:
1480  00bb 7b01          	ld	a,(OFST+0,sp)
1481  00bd c1000d        	cp	a,_funcInfo+13
1482  00c0 25d3          	jrult	L155
1483                     ; 438 }
1486  00c2 84            	pop	a
1487  00c3 81            	ret	
1488  00c4               LC016:
1489  00c4 5f            	clrw	x
1490  00c5 97            	ld	xl,a
1491  00c6 d60080        	ld	a,(_vtbl+112,x)
1492  00c9 81            	ret	
1518                     ; 440 void	vtbl_local(void)
1518                     ; 441 {
1519                     .text:	section	.text,new
1520  0000               _vtbl_local:
1524                     ; 442 	if( cntGetType() == 0 )	vtbl_local_main();
1526  0000 cd0000        	call	_cntGetType
1528  0003 4d            	tnz	a
1529  0004 2603          	jrne	L775
1535  0006 cc0000        	jp	_vtbl_local_main
1536  0009               L775:
1537                     ; 444 		vtbl_local_sub();
1540                     ; 445 }
1543  0009 cc0000        	jp	_vtbl_local_sub
1590                     ; 447 uint8_t	vtbl_get_short(void)
1590                     ; 448 {
1591                     .text:	section	.text,new
1592  0000               _vtbl_get_short:
1594  0000 5203          	subw	sp,#3
1595       00000003      OFST:	set	3
1598                     ; 450 	j = 0xff;
1600  0002 a6ff          	ld	a,#255
1601  0004 6b02          	ld	(OFST-1,sp),a
1602                     ; 451 	k = 0;
1604  0006 0f01          	clr	(OFST-2,sp)
1605                     ; 452 	for( i=0; i<TBL_V_SIZE/2; i++ )
1607  0008 4f            	clr	a
1608  0009 6b03          	ld	(OFST+0,sp),a
1609  000b               L326:
1610                     ; 454 		if( vtbl.coil[i] == 0 )
1612  000b 5f            	clrw	x
1613  000c 97            	ld	xl,a
1614  000d 724d0020      	tnz	(_vtbl+16,x)
1615  0011 2728          	jreq	L526
1616                     ; 455 			continue;
1618                     ; 457 		if( vtbl.openCount2[i] != 0 )
1620  0013 5f            	clrw	x
1621  0014 97            	ld	xl,a
1622  0015 d60080        	ld	a,(_vtbl+112,x)
1623  0018 2713          	jreq	L336
1624                     ; 459 			if( j == 0xff )
1626  001a 7b02          	ld	a,(OFST-1,sp)
1627  001c 4c            	inc	a
1628                     ; 460 				j = i;
1630  001d 270a          	jreq	LC017
1631                     ; 463 				if( vtbl.coil[j] > vtbl.coil[i] )
1633  001f 7b03          	ld	a,(OFST+0,sp)
1634  0021 5f            	clrw	x
1635  0022 97            	ld	xl,a
1636  0023 7b02          	ld	a,(OFST-1,sp)
1637  0025 ad27          	call	LC018
1638  0027 2304          	jrule	L336
1639                     ; 464 					j = i;
1641  0029               LC017:
1643  0029 7b03          	ld	a,(OFST+0,sp)
1644  002b 6b02          	ld	(OFST-1,sp),a
1645  002d               L336:
1646                     ; 467 		if( vtbl.coil[k] > vtbl.coil[i] )
1648  002d 7b03          	ld	a,(OFST+0,sp)
1649  002f 5f            	clrw	x
1650  0030 97            	ld	xl,a
1651  0031 7b01          	ld	a,(OFST-2,sp)
1652  0033 ad19          	call	LC018
1653  0035 2304          	jrule	L526
1654                     ; 468 			k = i;
1656  0037 7b03          	ld	a,(OFST+0,sp)
1657  0039 6b01          	ld	(OFST-2,sp),a
1658  003b               L526:
1659                     ; 452 	for( i=0; i<TBL_V_SIZE/2; i++ )
1661  003b 0c03          	inc	(OFST+0,sp)
1664  003d 7b03          	ld	a,(OFST+0,sp)
1665  003f a108          	cp	a,#8
1666  0041 25c8          	jrult	L326
1667                     ; 470 	return j==0xff ? k : j;
1669  0043 7b02          	ld	a,(OFST-1,sp)
1670  0045 a1ff          	cp	a,#255
1671  0047 2602          	jrne	L67
1672  0049 7b01          	ld	a,(OFST-2,sp)
1673  004b               L67:
1676  004b 5b03          	addw	sp,#3
1677  004d 81            	ret	
1678  004e               LC018:
1679  004e 905f          	clrw	y
1680  0050 9097          	ld	yl,a
1681  0052 90d60020      	ld	a,(_vtbl+16,y)
1682  0056 d10020        	cp	a,(_vtbl+16,x)
1683  0059 81            	ret	
1732                     ; 475 void	vtbl_each_sub(uint8_t openCount)
1732                     ; 476 {
1733                     .text:	section	.text,new
1734  0000               _vtbl_each_sub:
1736  0000 88            	push	a
1737  0001 89            	pushw	x
1738       00000002      OFST:	set	2
1741                     ; 478 	for( i=0; i<funcInfo2.valve; i++ )
1743  0002 0f02          	clr	(OFST+0,sp)
1745  0004 202a          	jra	L176
1746  0006               L566:
1747                     ; 480 		k = i + TBL_V_SIZE/2;
1749  0006 ab08          	add	a,#8
1750  0008 6b01          	ld	(OFST-1,sp),a
1751                     ; 482 		if( vtbl.openCount[k] != 0 )
1753  000a 5f            	clrw	x
1754  000b 97            	ld	xl,a
1755  000c 724d0070      	tnz	(_vtbl+96,x)
1756  0010 271c          	jreq	L576
1757                     ; 484 			if( vtbl.openCount2[k] != 200 && k != vtbl.__k )
1759  0012 cd009a        	call	LC020
1760  0015 a1c8          	cp	a,#200
1761  0017 2715          	jreq	L576
1763  0019 7b01          	ld	a,(OFST-1,sp)
1764  001b c100ce        	cp	a,_vtbl+190
1765  001e 270e          	jreq	L576
1766                     ; 485 				toolSetPush(i, vtbl.openCount2[k], TS_CNTL_OPEN);
1768  0020 4b06          	push	#6
1769  0022 7b02          	ld	a,(OFST+0,sp)
1770  0024 ad74          	call	LC020
1771  0026 97            	ld	xl,a
1772  0027 7b03          	ld	a,(OFST+1,sp)
1773  0029 95            	ld	xh,a
1774  002a cd0000        	call	_toolSetPush
1776  002d 84            	pop	a
1777  002e               L576:
1778                     ; 478 	for( i=0; i<funcInfo2.valve; i++ )
1780  002e 0c02          	inc	(OFST+0,sp)
1781  0030               L176:
1784  0030 7b02          	ld	a,(OFST+0,sp)
1785  0032 c1000d        	cp	a,_funcInfo2+13
1786  0035 25cf          	jrult	L566
1787                     ; 488 	if( openCount == 0 )
1789  0037 7b03          	ld	a,(OFST+1,sp)
1790  0039 2624          	jrne	L107
1791                     ; 490 		for( i=0; i<funcInfo2.valve; i++ )
1793  003b 6b02          	ld	(OFST+0,sp),a
1795  003d 2018          	jra	L707
1796  003f               L307:
1797                     ; 492 			k = i + TBL_V_SIZE/2;
1799  003f ab08          	add	a,#8
1800  0041 6b01          	ld	(OFST-1,sp),a
1801                     ; 494 			if( vtbl.openCount2[k] != 0 )
1803  0043 ad55          	call	LC020
1804  0045 270c          	jreq	L317
1805                     ; 495 				toolSetPush(i, 1, TS_CLOSE);
1807  0047 4b01          	push	#1
1808  0049 ae0001        	ldw	x,#1
1809  004c 7b03          	ld	a,(OFST+1,sp)
1810  004e 95            	ld	xh,a
1811  004f cd0000        	call	_toolSetPush
1813  0052 84            	pop	a
1814  0053               L317:
1815                     ; 490 		for( i=0; i<funcInfo2.valve; i++ )
1817  0053 0c02          	inc	(OFST+0,sp)
1818  0055 7b02          	ld	a,(OFST+0,sp)
1819  0057               L707:
1822  0057 c1000d        	cp	a,_funcInfo2+13
1823  005a 25e3          	jrult	L307
1825  005c               L517:
1826                     ; 527 }
1829  005c 5b03          	addw	sp,#3
1830  005e 81            	ret	
1831  005f               L107:
1832                     ; 500 		if( vtbl.__k == 0xfe )		{}
1835                     ; 501 		else if( vtbl.__k == 0xff )	{}
1838                     ; 513 		vtbl.__k = 0xff;
1840  005f 35ff00ce      	mov	_vtbl+190,#255
1841                     ; 514 		for( i=0; i<funcInfo2.valve; i++ )
1843  0063 0f02          	clr	(OFST+0,sp)
1845  0065 202a          	jra	L337
1846  0067               L727:
1847                     ; 516 			k = i + TBL_V_SIZE/2;
1849  0067 ab08          	add	a,#8
1850  0069 6b01          	ld	(OFST-1,sp),a
1851                     ; 518 			if( vtbl.openCount[k] == 0 )
1853  006b 5f            	clrw	x
1854  006c 97            	ld	xl,a
1855  006d 724d0070      	tnz	(_vtbl+96,x)
1856  0071 260b          	jrne	L737
1857                     ; 520 				if( vtbl.openCount2[k] != 0 )
1859  0073 ad25          	call	LC020
1860  0075 2718          	jreq	L347
1861                     ; 521 					toolSetPush(i, 1, TS_CLOSE);
1863  0077 4b01          	push	#1
1864  0079 ae0001        	ldw	x,#1
1866  007c 200a          	jp	LC019
1867  007e               L737:
1868                     ; 524 				toolSetPush(i, vtbl.openCount[k], TS_CNTL_MOVE);
1870  007e 4b08          	push	#8
1871  0080 7b02          	ld	a,(OFST+0,sp)
1872  0082 5f            	clrw	x
1873  0083 97            	ld	xl,a
1874  0084 d60070        	ld	a,(_vtbl+96,x)
1875  0087 97            	ld	xl,a
1877  0088               LC019:
1878  0088 7b03          	ld	a,(OFST+1,sp)
1879  008a 95            	ld	xh,a
1880  008b cd0000        	call	_toolSetPush
1881  008e 84            	pop	a
1882  008f               L347:
1883                     ; 514 		for( i=0; i<funcInfo2.valve; i++ )
1885  008f 0c02          	inc	(OFST+0,sp)
1886  0091               L337:
1889  0091 7b02          	ld	a,(OFST+0,sp)
1890  0093 c1000d        	cp	a,_funcInfo2+13
1891  0096 25cf          	jrult	L727
1892  0098 20c2          	jra	L517
1893  009a               LC020:
1894  009a 5f            	clrw	x
1895  009b 97            	ld	xl,a
1896  009c d60080        	ld	a,(_vtbl+112,x)
1897  009f 81            	ret	
1940                     ; 529 void	vtbl_each_main(uint8_t openCount)
1940                     ; 530 {
1941                     .text:	section	.text,new
1942  0000               _vtbl_each_main:
1944  0000 88            	push	a
1945  0001 88            	push	a
1946       00000001      OFST:	set	1
1949                     ; 532 	for( i=0; i<funcInfo.valve; i++ )
1951  0002 0f01          	clr	(OFST+0,sp)
1953  0004 2024          	jra	L767
1954  0006               L367:
1955                     ; 535 		if( vtbl.openCount[i] != 0 )
1957  0006 cd00c0        	call	LC024
1958  0009 271d          	jreq	L377
1959                     ; 537 			if( vtbl.openCount2[i] != 200 && i != vtbl.__k )
1961  000b cd00ba        	call	LC023
1962  000e a1c8          	cp	a,#200
1963  0010 2716          	jreq	L377
1965  0012 7b01          	ld	a,(OFST+0,sp)
1966  0014 c100ce        	cp	a,_vtbl+190
1967  0017 270f          	jreq	L377
1968                     ; 538 				toolSetPush(i, vtbl.openCount2[i], TS_CNTL_OPEN);
1970  0019 4b06          	push	#6
1971  001b 7b02          	ld	a,(OFST+1,sp)
1972  001d cd00ba        	call	LC023
1973  0020 97            	ld	xl,a
1974  0021 7b02          	ld	a,(OFST+1,sp)
1975  0023 95            	ld	xh,a
1976  0024 cd0000        	call	_toolSetPush
1978  0027 84            	pop	a
1979  0028               L377:
1980                     ; 532 	for( i=0; i<funcInfo.valve; i++ )
1982  0028 0c01          	inc	(OFST+0,sp)
1983  002a               L767:
1986  002a 7b01          	ld	a,(OFST+0,sp)
1987  002c c1000d        	cp	a,_funcInfo+13
1988  002f 25d5          	jrult	L367
1989                     ; 541 	if( openCount == 0 )
1991  0031 7b02          	ld	a,(OFST+1,sp)
1992  0033 2639          	jrne	L777
1993                     ; 543 		vtbl.__k = vtbl_get_short();
1995  0035 cd0000        	call	_vtbl_get_short
1997  0038 c700ce        	ld	_vtbl+190,a
1998                     ; 544 		for( i=0; i<funcInfo.valve; i++ )
2000  003b 0f01          	clr	(OFST+0,sp)
2002  003d 2026          	jra	L5001
2003  003f               L1001:
2004                     ; 547 			if( i == vtbl.__k )
2006  003f c100ce        	cp	a,_vtbl+190
2007  0042 260f          	jrne	L1101
2008                     ; 549 				if( vtbl.openCount2[i] != 200 )
2010  0044 ad74          	call	LC023
2011  0046 a1c8          	cp	a,#200
2012  0048 2719          	jreq	L5101
2013                     ; 550 					toolSetPush(i, vtbl.openCount2[i], TS_CNTL_OPEN);
2015  004a 4b06          	push	#6
2016  004c 7b02          	ld	a,(OFST+1,sp)
2017  004e ad6a          	call	LC023
2018  0050 97            	ld	xl,a
2020  0051 2009          	jp	LC021
2021  0053               L1101:
2022                     ; 554 				if( vtbl.openCount2[i] != 0 )
2024  0053 ad65          	call	LC023
2025  0055 270c          	jreq	L5101
2026                     ; 555 					toolSetPush(i, 1, TS_CLOSE);
2028  0057 4b01          	push	#1
2029  0059 ae0001        	ldw	x,#1
2031  005c               LC021:
2032  005c 7b02          	ld	a,(OFST+1,sp)
2033  005e 95            	ld	xh,a
2034  005f cd0000        	call	_toolSetPush
2035  0062 84            	pop	a
2036  0063               L5101:
2037                     ; 544 		for( i=0; i<funcInfo.valve; i++ )
2039  0063 0c01          	inc	(OFST+0,sp)
2040  0065               L5001:
2043  0065 7b01          	ld	a,(OFST+0,sp)
2044  0067 c1000d        	cp	a,_funcInfo+13
2045  006a 25d3          	jrult	L1001
2047  006c               L1201:
2048                     ; 582 }
2051  006c 85            	popw	x
2052  006d 81            	ret	
2053  006e               L777:
2054                     ; 561 		if( vtbl.__k == 0xfe )		{}
2056  006e c600ce        	ld	a,_vtbl+190
2057  0071 a1fe          	cp	a,#254
2058  0073 2712          	jreq	L5201
2060                     ; 562 		else if( vtbl.__k == 0xff )	{}
2062  0075 a1ff          	cp	a,#255
2063  0077 270e          	jreq	L5201
2065                     ; 566 			if( vtbl.openCount[vtbl.__k] == 0 )
2067  0079 ad45          	call	LC024
2068  007b 260a          	jrne	L5201
2069                     ; 567 				toolSetPush(vtbl.__k, 1, TS_CLOSE);
2071  007d 4b01          	push	#1
2072  007f ae0001        	ldw	x,#1
2073  0082 95            	ld	xh,a
2074  0083 cd0000        	call	_toolSetPush
2076  0086 84            	pop	a
2077  0087               L5201:
2078                     ; 569 		vtbl.__k = 0xff;
2080  0087 35ff00ce      	mov	_vtbl+190,#255
2081                     ; 570 		for( i=0; i<funcInfo.valve; i++ )
2083  008b 0f01          	clr	(OFST+0,sp)
2085  008d 2022          	jra	L1401
2086  008f               L5301:
2087                     ; 573 			if( vtbl.openCount[i] == 0 )
2089  008f ad2f          	call	LC024
2090  0091 260b          	jrne	L5401
2091                     ; 575 				if( vtbl.openCount2[i] != 0 )
2093  0093 ad25          	call	LC023
2094  0095 2718          	jreq	L1501
2095                     ; 576 					toolSetPush(i, 1, TS_CLOSE);
2097  0097 4b01          	push	#1
2098  0099 ae0001        	ldw	x,#1
2100  009c 200a          	jp	LC022
2101  009e               L5401:
2102                     ; 579 				toolSetPush(i, vtbl.openCount[i], TS_CNTL_MOVE);
2104  009e 4b08          	push	#8
2105  00a0 7b02          	ld	a,(OFST+1,sp)
2106  00a2 5f            	clrw	x
2107  00a3 97            	ld	xl,a
2108  00a4 d60070        	ld	a,(_vtbl+96,x)
2109  00a7 97            	ld	xl,a
2111  00a8               LC022:
2112  00a8 7b02          	ld	a,(OFST+1,sp)
2113  00aa 95            	ld	xh,a
2114  00ab cd0000        	call	_toolSetPush
2115  00ae 84            	pop	a
2116  00af               L1501:
2117                     ; 570 		for( i=0; i<funcInfo.valve; i++ )
2119  00af 0c01          	inc	(OFST+0,sp)
2120  00b1               L1401:
2123  00b1 7b01          	ld	a,(OFST+0,sp)
2124  00b3 c1000d        	cp	a,_funcInfo+13
2125  00b6 25d7          	jrult	L5301
2126  00b8 20b2          	jra	L1201
2127  00ba               LC023:
2128  00ba 5f            	clrw	x
2129  00bb 97            	ld	xl,a
2130  00bc d60080        	ld	a,(_vtbl+112,x)
2131  00bf 81            	ret	
2132  00c0               LC024:
2133  00c0 5f            	clrw	x
2134  00c1 97            	ld	xl,a
2135  00c2 724d0070      	tnz	(_vtbl+96,x)
2136  00c6 81            	ret	
2162                     ; 584 void	vtbl_boiler_cntl(void)
2162                     ; 585 {
2163                     .text:	section	.text,new
2164  0000               _vtbl_boiler_cntl:
2168                     ; 586 	if( vtbl.cntlMode == 0 )	
2170  0000 c600ac        	ld	a,_vtbl+156
2171  0003 2601          	jrne	L3601
2172                     ; 587 		return;
2175  0005 81            	ret	
2176  0006               L3601:
2177                     ; 589 	relayCntl((funcInfo.rcLED==0 && funcInfo.sub_rcLED==0 ) ? 0 : 1);
2179  0006 c60012        	ld	a,_funcInfo+18
2180  0009 2606          	jrne	L041
2181  000b 725d0013      	tnz	_funcInfo+19
2182  000f 2702          	jreq	L241
2183  0011               L041:
2184  0011 a601          	ld	a,#1
2185  0013               L241:
2187                     ; 590 }
2190  0013 cc0000        	jp	_relayCntl
2234                     ; 592 void	vtbl_each(void)
2234                     ; 593 {
2235                     .text:	section	.text,new
2236  0000               _vtbl_each:
2238  0000 89            	pushw	x
2239       00000002      OFST:	set	2
2242                     ; 595 	j = 0;
2244  0001 0f01          	clr	(OFST-1,sp)
2245                     ; 596 	for( i=0; i<TBL_V_SIZE; i++ )
2247  0003 4f            	clr	a
2248  0004 6b02          	ld	(OFST+0,sp),a
2249  0006               L3011:
2250                     ; 598 		if( vtbl.openCount[i] != 0 )
2252  0006 5f            	clrw	x
2253  0007 97            	ld	xl,a
2254  0008 d60070        	ld	a,(_vtbl+96,x)
2255  000b 2702          	jreq	L1111
2256                     ; 599 			j++;
2258  000d 0c01          	inc	(OFST-1,sp)
2259  000f               L1111:
2260                     ; 596 	for( i=0; i<TBL_V_SIZE; i++ )
2262  000f 0c02          	inc	(OFST+0,sp)
2265  0011 7b02          	ld	a,(OFST+0,sp)
2266  0013 a110          	cp	a,#16
2267  0015 25ef          	jrult	L3011
2268                     ; 601 	if( cntGetType() == 0 )	vtbl_each_main(j);
2270  0017 cd0000        	call	_cntGetType
2272  001a 4d            	tnz	a
2273  001b 2607          	jrne	L3111
2276  001d 7b01          	ld	a,(OFST-1,sp)
2277  001f cd0000        	call	_vtbl_each_main
2280  0022 2005          	jra	L5111
2281  0024               L3111:
2282                     ; 603 		vtbl_each_sub(j);
2284  0024 7b01          	ld	a,(OFST-1,sp)
2285  0026 cd0000        	call	_vtbl_each_sub
2287  0029               L5111:
2288                     ; 605 	vtbl_boiler_cntl();
2290  0029 cd0000        	call	_vtbl_boiler_cntl
2292                     ; 606 }
2295  002c 85            	popw	x
2296  002d 81            	ret	
2338                     ; 608 uint8_t	vtbl_get_openCount(void)
2338                     ; 609 {
2339                     .text:	section	.text,new
2340  0000               _vtbl_get_openCount:
2342  0000 89            	pushw	x
2343       00000002      OFST:	set	2
2346                     ; 612 	k = 0;
2348  0001 0f01          	clr	(OFST-1,sp)
2349                     ; 613 	iOpen = 0;
2351  0003 725f0001      	clr	_iOpen
2352                     ; 614 	iClose = 0;
2354  0007 725f0000      	clr	_iClose
2355                     ; 615 	for( i=0; i<TBL_V_SIZE; i++ )
2357  000b 4f            	clr	a
2358  000c 6b02          	ld	(OFST+0,sp),a
2359  000e               L5311:
2360                     ; 617 		if( vtbl.openCount2[i] == 0 )
2362  000e 5f            	clrw	x
2363  000f 97            	ld	xl,a
2364  0010 724d0080      	tnz	(_vtbl+112,x)
2365  0014 260e          	jrne	L3411
2366                     ; 619 			if( vtbl.openCount[i] != 0 )	//	To Open
2368  0016 5f            	clrw	x
2369  0017 97            	ld	xl,a
2370  0018 724d0070      	tnz	(_vtbl+96,x)
2371  001c 2716          	jreq	L7411
2372                     ; 620 				k |= 0x01;
2374  001e 7b01          	ld	a,(OFST-1,sp)
2375  0020 aa01          	or	a,#1
2376  0022 200c          	jp	LC025
2377  0024               L3411:
2378                     ; 624 			if( vtbl.openCount[i] == 0 )	//	To Close
2380  0024 5f            	clrw	x
2381  0025 97            	ld	xl,a
2382  0026 724d0070      	tnz	(_vtbl+96,x)
2383  002a 2608          	jrne	L7411
2384                     ; 625 				k |= 0x02;
2386  002c 7b01          	ld	a,(OFST-1,sp)
2387  002e aa02          	or	a,#2
2388  0030               LC025:
2389  0030 6b01          	ld	(OFST-1,sp),a
2390  0032 7b02          	ld	a,(OFST+0,sp)
2391  0034               L7411:
2392                     ; 627 		if( vtbl.openCount[i] != 0 )	iOpen += 1;
2394  0034 5f            	clrw	x
2395  0035 97            	ld	xl,a
2396  0036 d60070        	ld	a,(_vtbl+96,x)
2397  0039 2706          	jreq	L3511
2400  003b 725c0001      	inc	_iOpen
2402  003f 2004          	jra	L5511
2403  0041               L3511:
2404                     ; 629 			iClose += 1;
2406  0041 725c0000      	inc	_iClose
2407  0045               L5511:
2408                     ; 615 	for( i=0; i<TBL_V_SIZE; i++ )
2410  0045 0c02          	inc	(OFST+0,sp)
2413  0047 7b02          	ld	a,(OFST+0,sp)
2414  0049 a110          	cp	a,#16
2415  004b 25c1          	jrult	L5311
2416                     ; 631 	return k;
2418  004d 7b01          	ld	a,(OFST-1,sp)
2421  004f 85            	popw	x
2422  0050 81            	ret	
2471                     ; 634 void	vtbl_po(void)
2471                     ; 635 {
2472                     .text:	section	.text,new
2473  0000               _vtbl_po:
2475  0000 5203          	subw	sp,#3
2476       00000003      OFST:	set	3
2479                     ; 637 	n = 0;
2481  0002 0f01          	clr	(OFST-2,sp)
2482                     ; 638 	for( i=0; i<TBL_V_SIZE; i++ )
2484  0004 4f            	clr	a
2485  0005 6b03          	ld	(OFST+0,sp),a
2486  0007               L7711:
2487                     ; 641 		if( vtbl.openCount[i] > vtbl.openCount2[i] )
2489  0007 ad5d          	call	LC027
2490  0009 d10080        	cp	a,(_vtbl+112,x)
2491  000c 231b          	jrule	L5021
2492                     ; 643 			vtbl_disp(1);
2494  000e a601          	ld	a,#1
2495  0010 cd0000        	call	_vtbl_disp
2497                     ; 644 			j = vtbl.openCount[i] - vtbl.openCount2[i];
2499  0013 7b03          	ld	a,(OFST+0,sp)
2500  0015 5f            	clrw	x
2501  0016 97            	ld	xl,a
2502  0017 905f          	clrw	y
2503  0019 9097          	ld	yl,a
2504  001b 90d60080      	ld	a,(_vtbl+112,y)
2505  001f d00070        	sub	a,(_vtbl+96,x)
2506  0022 40            	neg	a
2507  0023 6b02          	ld	(OFST-1,sp),a
2508                     ; 645 			toolSetPush(i, MT_STEP(j), TS_CNTL_LARGE);
2510  0025 4b0a          	push	#10
2512                     ; 646 			n++;
2514  0027 201a          	jp	LC026
2515  0029               L5021:
2516                     ; 648 		else if( vtbl.openCount[i] < vtbl.openCount2[i] )
2518  0029 7b03          	ld	a,(OFST+0,sp)
2519  002b ad39          	call	LC027
2520  002d d10080        	cp	a,(_vtbl+112,x)
2521  0030 2420          	jruge	L7021
2522                     ; 650 			vtbl_disp(2);
2524  0032 a602          	ld	a,#2
2525  0034 cd0000        	call	_vtbl_disp
2527                     ; 651 			j = vtbl.openCount2[i] - vtbl.openCount[i];
2529  0037 7b03          	ld	a,(OFST+0,sp)
2530  0039 ad2b          	call	LC027
2531  003b d00080        	sub	a,(_vtbl+112,x)
2532  003e 40            	neg	a
2533  003f 6b02          	ld	(OFST-1,sp),a
2534                     ; 652 			toolSetPush(i, MT_STEP(j), TS_CNTL_SMALL);
2536  0041 4b0b          	push	#11
2538                     ; 653 			n++;
2540  0043               LC026:
2541  0043 7b03          	ld	a,(OFST+0,sp)
2542  0045 97            	ld	xl,a
2543  0046 a60c          	ld	a,#12
2544  0048 42            	mul	x,a
2545  0049 7b04          	ld	a,(OFST+1,sp)
2546  004b 95            	ld	xh,a
2547  004c cd0000        	call	_toolSetPush
2548  004f 84            	pop	a
2550  0050 0c01          	inc	(OFST-2,sp)
2551  0052               L7021:
2552                     ; 638 	for( i=0; i<TBL_V_SIZE; i++ )
2554  0052 0c03          	inc	(OFST+0,sp)
2557  0054 7b03          	ld	a,(OFST+0,sp)
2558  0056 a110          	cp	a,#16
2559  0058 25ad          	jrult	L7711
2560                     ; 656 	if( n == 0 )
2562  005a 7b01          	ld	a,(OFST-2,sp)
2563  005c 2605          	jrne	L3121
2564                     ; 657 		vtbl_disp(3);
2566  005e a603          	ld	a,#3
2567  0060 cd0000        	call	_vtbl_disp
2569  0063               L3121:
2570                     ; 658 }
2573  0063 5b03          	addw	sp,#3
2574  0065 81            	ret	
2575  0066               LC027:
2576  0066 5f            	clrw	x
2577  0067 97            	ld	xl,a
2578  0068 905f          	clrw	y
2579  006a 9097          	ld	yl,a
2580  006c 90d60070      	ld	a,(_vtbl+96,y)
2581  0070 81            	ret	
2636                     ; 660 uint8_t	vtbl_Cntl(uint8_t mode)
2636                     ; 661 {
2637                     .text:	section	.text,new
2638  0000               _vtbl_Cntl:
2640  0000 88            	push	a
2641  0001 89            	pushw	x
2642       00000002      OFST:	set	2
2645                     ; 664 	if( mode == 0 )
2647  0002 4d            	tnz	a
2648  0003 2619          	jrne	L3421
2649                     ; 666 		if( vtbl.cntlMode == 0 )
2651  0005 c600ac        	ld	a,_vtbl+156
2652  0008 260a          	jrne	L5421
2653                     ; 668 			if( vtbl._result != vtbl._result2 )
2655  000a c600a7        	ld	a,_vtbl+151
2656  000d c100a8        	cp	a,_vtbl+152
2657  0010 2709          	jreq	L1521
2658                     ; 669 				goto RunEntry;
2660  0012 2047          	jra	L5121
2661  0014               L5421:
2662                     ; 673 			if( vtbl.__k == 0xfe )
2664  0014 c600ce        	ld	a,_vtbl+190
2665  0017 a1fe          	cp	a,#254
2666  0019 2755          	jreq	L1221
2667                     ; 674 				goto RunEachEntry;
2669  001b               L1521:
2670                     ; 676 		return 0;
2672  001b 4f            	clr	a
2674  001c 203a          	jra	L212
2675  001e               L3421:
2676                     ; 678 	else if( mode == 0xff )
2678  001e 7b03          	ld	a,(OFST+1,sp)
2679  0020 4c            	inc	a
2680  0021 2638          	jrne	L5121
2681                     ; 680 		k = vtbl_get_short();
2683  0023 cd0000        	call	_vtbl_get_short
2685  0026 6b01          	ld	(OFST-1,sp),a
2686                     ; 681 		for( i=0; i<funcInfo.valve; i++ )
2688  0028 0f02          	clr	(OFST+0,sp)
2690  002a 2020          	jra	L5621
2691  002c               L1621:
2692                     ; 684 			if( i == k )
2694  002c 1101          	cp	a,(OFST-1,sp)
2695  002e 261a          	jrne	L1721
2696                     ; 686 				if( vtbl.openCount2[i] != 200 )
2698  0030 5f            	clrw	x
2699  0031 97            	ld	xl,a
2700  0032 d60080        	ld	a,(_vtbl+112,x)
2701  0035 a1c8          	cp	a,#200
2702  0037 2711          	jreq	L1721
2703                     ; 687 					toolSetPush(i, vtbl.openCount2[i], TS_CNTL_OPEN);
2705  0039 4b06          	push	#6
2706  003b 7b03          	ld	a,(OFST+1,sp)
2707  003d 5f            	clrw	x
2708  003e 97            	ld	xl,a
2709  003f d60080        	ld	a,(_vtbl+112,x)
2710  0042 97            	ld	xl,a
2711  0043 7b03          	ld	a,(OFST+1,sp)
2712  0045 95            	ld	xh,a
2713  0046 cd0000        	call	_toolSetPush
2715  0049 84            	pop	a
2716  004a               L1721:
2717                     ; 681 		for( i=0; i<funcInfo.valve; i++ )
2719  004a 0c02          	inc	(OFST+0,sp)
2720  004c               L5621:
2723  004c 7b02          	ld	a,(OFST+0,sp)
2724  004e c1000d        	cp	a,_funcInfo+13
2725  0051 25d9          	jrult	L1621
2726                     ; 690 		vtbl.__k = k;
2728  0053 7b01          	ld	a,(OFST-1,sp)
2729  0055 c700ce        	ld	_vtbl+190,a
2730                     ; 691 		return;
2731  0058               L212:
2734  0058 5b03          	addw	sp,#3
2735  005a 81            	ret	
2736  005b               L5121:
2737                     ; 693 RunEntry:
2737                     ; 694 	k = vtbl_get_openCount();
2739  005b cd0000        	call	_vtbl_get_openCount
2741  005e 6b01          	ld	(OFST-1,sp),a
2742                     ; 695 	vtbl_disp(0);
2744  0060 4f            	clr	a
2745  0061 cd0000        	call	_vtbl_disp
2747                     ; 697 	if( k == 0 )
2749  0064 0d01          	tnz	(OFST-1,sp)
2750                     ; 699 		goto KOEX;
2752                     ; 704 KOEX:		
2752                     ; 705 		if( vtbl.cntlMode == 0 )	
2754  0066 c600ac        	ld	a,_vtbl+156
2755  0069 2605          	jrne	L1221
2756                     ; 707 			vtbl_local();
2758  006b cd0000        	call	_vtbl_local
2761  006e 2003          	jra	L7721
2762  0070               L1221:
2763                     ; 711 RunEachEntry:			
2763                     ; 712 			vtbl_each();
2765  0070 cd0000        	call	_vtbl_each
2767  0073               L7721:
2768                     ; 716 	for( i=0; i<TBL_V_SIZE; i++ )
2770  0073 4f            	clr	a
2771  0074 6b02          	ld	(OFST+0,sp),a
2772  0076               L5031:
2773                     ; 717 		vtbl.openCount2[i] = vtbl.openCount[i];
2775  0076 5f            	clrw	x
2776  0077 97            	ld	xl,a
2777  0078 d60070        	ld	a,(_vtbl+96,x)
2778  007b d70080        	ld	(_vtbl+112,x),a
2779                     ; 716 	for( i=0; i<TBL_V_SIZE; i++ )
2781  007e 0c02          	inc	(OFST+0,sp)
2784  0080 7b02          	ld	a,(OFST+0,sp)
2785  0082 a110          	cp	a,#16
2786  0084 25f0          	jrult	L5031
2787                     ; 719 	vtbl._result2 = vtbl._result;	
2789  0086 5500a700a8    	mov	_vtbl+152,_vtbl+151
2790                     ; 720 	return 1;
2792  008b a601          	ld	a,#1
2794  008d 20c9          	jra	L212
2852                     ; 723 uint8_t	vtbl_loop(uint8_t cmd)
2852                     ; 724 {
2853                     .text:	section	.text,new
2854  0000               _vtbl_loop:
2856  0000 89            	pushw	x
2857       00000002      OFST:	set	2
2860                     ; 726 	j = 0;
2862  0001 0f01          	clr	(OFST-1,sp)
2863                     ; 727 	for( i=0; i<TBL_V_SIZE; i++ )
2865  0003 4f            	clr	a
2866  0004 6b02          	ld	(OFST+0,sp),a
2867  0006               L3331:
2868                     ; 729 		if( vtbl.t[i] != 0 )
2870  0006 5f            	clrw	x
2871  0007 97            	ld	xl,a
2872  0008 724d0050      	tnz	(_vtbl+64,x)
2873  000c 270a          	jreq	L1431
2874                     ; 731 			vtbl.t[i]--;
2876  000e 5f            	clrw	x
2877  000f 97            	ld	xl,a
2878                     ; 735 			j = 1;
2880  0010 a601          	ld	a,#1
2881  0012 724a0050      	dec	(_vtbl+64,x)
2882  0016 6b01          	ld	(OFST-1,sp),a
2883  0018               L1431:
2884                     ; 727 	for( i=0; i<TBL_V_SIZE; i++ )
2886  0018 0c02          	inc	(OFST+0,sp)
2889  001a 7b02          	ld	a,(OFST+0,sp)
2890  001c a110          	cp	a,#16
2891  001e 25e6          	jrult	L3331
2892                     ; 741 	if( mt_Ready() == 0 || j == 1 )
2894  0020 cd0000        	call	_mt_Ready
2896  0023 4d            	tnz	a
2897  0024 270d          	jreq	L042
2899  0026 7b01          	ld	a,(OFST-1,sp)
2900  0028 4a            	dec	a
2901                     ; 742 		return;
2903  0029 2708          	jreq	L042
2904                     ; 745 	if( _tsCntlHead != _tsCntlTail )
2906  002b c60000        	ld	a,__tsCntlHead
2907  002e c10000        	cp	a,__tsCntlTail
2908  0031 2702          	jreq	L7431
2909                     ; 746 		return;
2910  0033               L042:
2913  0033 85            	popw	x
2914  0034 81            	ret	
2915  0035               L7431:
2916                     ; 749 	vtbl_calc(0);	
2918  0035 4f            	clr	a
2919  0036 cd0000        	call	_vtbl_calc
2921                     ; 750 	vtbl._result = calc_final();
2923  0039 cd0000        	call	_calc_final
2925  003c c700a7        	ld	_vtbl+151,a
2926                     ; 752 	j = 0;
2928  003f 0f01          	clr	(OFST-1,sp)
2929                     ; 753 	for( i=0; i<TBL_V_SIZE; i++ )
2931  0041 4f            	clr	a
2932  0042 6b02          	ld	(OFST+0,sp),a
2933  0044               L1531:
2934                     ; 755 		if( vtbl._r[i] != vtbl.openCount2[i] )
2936  0044 5f            	clrw	x
2937  0045 97            	ld	xl,a
2938  0046 905f          	clrw	y
2939  0048 9097          	ld	yl,a
2940  004a 90d60096      	ld	a,(_vtbl+134,y)
2941  004e d10080        	cp	a,(_vtbl+112,x)
2942  0051 2704          	jreq	L7531
2943                     ; 756 			j = 1;
2945  0053 a601          	ld	a,#1
2946  0055 6b01          	ld	(OFST-1,sp),a
2947  0057               L7531:
2948                     ; 753 	for( i=0; i<TBL_V_SIZE; i++ )
2950  0057 0c02          	inc	(OFST+0,sp)
2953  0059 7b02          	ld	a,(OFST+0,sp)
2954  005b a110          	cp	a,#16
2955  005d 25e5          	jrult	L1531
2956                     ; 759 	if( j==0 )
2958  005f 7b01          	ld	a,(OFST-1,sp)
2959  0061 263a          	jrne	L1631
2960                     ; 761 		if( vtbl.__k != 0xfe )
2962  0063 c600ce        	ld	a,_vtbl+190
2963  0066 a1fe          	cp	a,#254
2964  0068 2733          	jreq	L1631
2965                     ; 763 			vtbl_boiler_cntl();
2967  006a cd0000        	call	_vtbl_boiler_cntl
2969                     ; 764 			if( vtbl.__k != 0xff )
2971  006d c600ce        	ld	a,_vtbl+190
2972  0070 a1ff          	cp	a,#255
2973  0072 2716          	jreq	L5631
2974                     ; 766 				if( funcInfo.rcLED != 0 )
2976  0074 725d0012      	tnz	_funcInfo+18
2977  0078 27b9          	jreq	L042
2978                     ; 769 					toolSetPush(vtbl.__k, 1, TS_CLOSE);
2980  007a 4b01          	push	#1
2981  007c ae0001        	ldw	x,#1
2982  007f 95            	ld	xh,a
2983  0080 cd0000        	call	_toolSetPush
2985  0083 35ff00ce      	mov	_vtbl+190,#255
2986  0087 84            	pop	a
2987                     ; 770 					vtbl.__k = 0xff;
2989                     ; 772 				return;
2991  0088 20a9          	jra	L042
2992  008a               L5631:
2993                     ; 774 			if( funcInfo.rcLED == 0 )
2995  008a c60012        	ld	a,_funcInfo+18
2996  008d 262b          	jrne	L242
2997                     ; 779 				if( vtbl.cntlMode != 0 && cntGetType() == 0 )
2999  008f c600ac        	ld	a,_vtbl+156
3000  0092 2726          	jreq	L242
3002  0094 cd0000        	call	_cntGetType
3004  0097 4d            	tnz	a
3005  0098 2620          	jrne	L242
3006                     ; 780 					vtbl_Cntl(0xff);
3008  009a 4a            	dec	a
3010                     ; 782 			return;
3012  009b 201a          	jp	LC028
3013  009d               L1631:
3014                     ; 785 	for( i=0; i<TBL_V_SIZE; i++ )
3016  009d 4f            	clr	a
3017  009e 6b02          	ld	(OFST+0,sp),a
3018  00a0               L5731:
3019                     ; 786 		vtbl.openCount[i] = vtbl._r[i];
3021  00a0 5f            	clrw	x
3022  00a1 97            	ld	xl,a
3023  00a2 d60096        	ld	a,(_vtbl+134,x)
3024  00a5 d70070        	ld	(_vtbl+96,x),a
3025                     ; 785 	for( i=0; i<TBL_V_SIZE; i++ )
3027  00a8 0c02          	inc	(OFST+0,sp)
3030  00aa 7b02          	ld	a,(OFST+0,sp)
3031  00ac a110          	cp	a,#16
3032  00ae 25f0          	jrult	L5731
3033                     ; 788 	vtbl_disp(4);
3035  00b0 a604          	ld	a,#4
3036  00b2 cd0000        	call	_vtbl_disp
3038                     ; 789 	vtbl_Cntl(j);
3040  00b5 7b01          	ld	a,(OFST-1,sp)
3041  00b7               LC028:
3042  00b7 cd0000        	call	_vtbl_Cntl
3044                     ; 790 }
3045  00ba               L242:
3048  00ba 85            	popw	x
3049  00bb 81            	ret	
3107                     ; 793 void func_cnt_calcInfo(uint8_t id, uint8_t mode, uint8_t curr, uint8_t set) 
3107                     ; 794 {
3108                     .text:	section	.text,new
3109  0000               _func_cnt_calcInfo:
3111  0000 89            	pushw	x
3112       00000000      OFST:	set	0
3115                     ; 797 	if (rcInfo.mode[id - 1] != mode || rcInfo.setup_temp[id - 1] != set) {
3117  0001 9e            	ld	a,xh
3118  0002 5f            	clrw	x
3119  0003 97            	ld	xl,a
3120  0004 5a            	decw	x
3121  0005 d60010        	ld	a,(_rcInfo+16,x)
3122  0008 1102          	cp	a,(OFST+2,sp)
3123  000a 260c          	jrne	L7241
3125  000c 7b01          	ld	a,(OFST+1,sp)
3126  000e 5f            	clrw	x
3127  000f 97            	ld	xl,a
3128  0010 5a            	decw	x
3129  0011 d60008        	ld	a,(_rcInfo+8,x)
3130  0014 1106          	cp	a,(OFST+6,sp)
3131  0016 272d          	jreq	L5241
3132  0018               L7241:
3133                     ; 798 		if( mode == MODE_HOT )
3135  0018 7b02          	ld	a,(OFST+2,sp)
3136  001a a101          	cp	a,#1
3137  001c 260c          	jrne	L1341
3138                     ; 799 			rcInfo._t[id-1] = set;
3140  001e 7b01          	ld	a,(OFST+1,sp)
3141  0020 5f            	clrw	x
3142  0021 97            	ld	xl,a
3143  0022 5a            	decw	x
3144  0023 7b06          	ld	a,(OFST+6,sp)
3145  0025 d70018        	ld	(_rcInfo+24,x),a
3146  0028 7b02          	ld	a,(OFST+2,sp)
3147  002a               L1341:
3148                     ; 800 		_uc.r[60] = mode;
3150  002a c70080        	ld	__uc+128,a
3151                     ; 801 		_uc.r[61] = curr;
3153  002d 7b05          	ld	a,(OFST+5,sp)
3154  002f c70081        	ld	__uc+129,a
3155                     ; 802 		_uc.r[62] = set;
3157  0032 7b06          	ld	a,(OFST+6,sp)
3158  0034 c70082        	ld	__uc+130,a
3159                     ; 803 		_uc.r[63] = id - 1;
3161  0037 7b01          	ld	a,(OFST+1,sp)
3162  0039 4a            	dec	a
3163  003a c70083        	ld	__uc+131,a
3164                     ; 804 		cnt_chnage_rc_set(id - 1);
3166  003d 5f            	clrw	x
3167  003e 7b01          	ld	a,(OFST+1,sp)
3168  0040 97            	ld	xl,a
3169  0041 5a            	decw	x
3170  0042 cd0000        	call	_cnt_chnage_rc_set
3172  0045               L5241:
3173                     ; 807 	ev.id = id & 0x0f;
3175  0045 7b01          	ld	a,(OFST+1,sp)
3176  0047 a40f          	and	a,#15
3177  0049 c70002        	ld	_ev,a
3178                     ; 808 	ev.mode = mode;
3180  004c 7b02          	ld	a,(OFST+2,sp)
3181  004e c70003        	ld	_ev+1,a
3182                     ; 809 	ev.curr = curr;
3184  0051 7b05          	ld	a,(OFST+5,sp)
3185  0053 c70004        	ld	_ev+2,a
3186                     ; 810 	ev.set = set;
3188  0056 7b06          	ld	a,(OFST+6,sp)
3189  0058 c70005        	ld	_ev+3,a
3190                     ; 811 	vtbl_set(0);
3192  005b 4f            	clr	a
3193  005c cd0000        	call	_vtbl_set
3195                     ; 812 }
3198  005f 85            	popw	x
3199  0060 81            	ret	
3234                     ; 814 void func_cnt_factory(uint8_t idx) {
3235                     .text:	section	.text,new
3236  0000               _func_cnt_factory:
3240                     ; 815 	switch( idx )
3243                     ; 829 		break;
3244  0000 a064          	sub	a,#100
3245  0002 2709          	jreq	L3341
3246  0004 a00a          	sub	a,#10
3247  0006 2713          	jreq	L5341
3248  0008 a00a          	sub	a,#10
3249  000a 2717          	jreq	L7341
3251  000c 81            	ret	
3252  000d               L3341:
3253                     ; 817 	case 100:
3253                     ; 818 		debug_enable_vtbl = debug_enable_vtbl==0 ? 1 : 0;
3255  000d 725d0000      	tnz	_debug_enable_vtbl
3256  0011 2603          	jrne	L452
3257  0013 4c            	inc	a
3258  0014 2001          	jra	L652
3259  0016               L452:
3260  0016 4f            	clr	a
3261  0017               L652:
3262  0017 c70000        	ld	_debug_enable_vtbl,a
3263                     ; 819 		break;
3266  001a 81            	ret	
3267  001b               L5341:
3268                     ; 820 	case 110:
3268                     ; 821 		//	MAIN
3268                     ; 822 		debug_enable_cnt = 0;
3270  001b c70001        	ld	_debug_enable_cnt,a
3271                     ; 823 		FW_CNTTYPE(debug_enable_cnt);
3273  001e ae4800        	ldw	x,#18432
3275                     ; 824 		break;
3277  0021 2007          	jp	LC029
3278  0023               L7341:
3279                     ; 825 	case 120:
3279                     ; 826 		//	SUB
3279                     ; 827 		debug_enable_cnt = 1;
3281  0023 35010001      	mov	_debug_enable_cnt,#1
3282                     ; 828 		FW_CNTTYPE(debug_enable_cnt);
3284  0027 ae4801        	ldw	x,#18433
3285  002a               LC029:
3287                     ; 829 		break;
3289                     ; 831 }
3292  002a cc0000        	jp	_file_write
3326                     ; 836 void func_cnt_mirror(uint8_t idx) {
3327                     .text:	section	.text,new
3328  0000               _func_cnt_mirror:
3332                     ; 837 	curr_mirror_page = 0;
3334  0000 725f0000      	clr	_curr_mirror_page
3335                     ; 838 	mirror_type = idx;
3337  0004 c70000        	ld	_mirror_type,a
3338                     ; 839 }
3341  0007 81            	ret	
3367                     ; 842 void func_cnt_endMirror(void) {
3368                     .text:	section	.text,new
3369  0000               _func_cnt_endMirror:
3373                     ; 843 	curr_mirror_page = 0;
3375  0000 725f0000      	clr	_curr_mirror_page
3376                     ; 844 	mirror_type = 0;
3378  0004 725f0000      	clr	_mirror_type
3379                     ; 845 	cnt_check_state = STATE_NORMAL;	
3381  0008 35010000      	mov	_cnt_check_state,#1
3382                     ; 846 }
3385  000c 81            	ret	
3417                     ; 848 void func_cnt_hotwater(uint8_t idx) {
3418                     .text:	section	.text,new
3419  0000               _func_cnt_hotwater:
3423                     ; 849 }
3426  0000 81            	ret	
3458                     ; 851 void func_cnt_reset(uint8_t idx) {
3459                     .text:	section	.text,new
3460  0000               _func_cnt_reset:
3464                     ; 852 }
3467  0000 81            	ret	
3497                     ; 854 void func_cnt_errorReset(void) {
3498                     .text:	section	.text,new
3499  0000               _func_cnt_errorReset:
3503                     ; 856 	cnt_check_state = STATE_ERROR_RECOVER;
3505  0000 35090000      	mov	_cnt_check_state,#9
3506                     ; 858 	switch (funcInfo.error_type) {
3508  0004 c60009        	ld	a,_funcInfo+9
3509  0007 4a            	dec	a
3510  0008 261e          	jrne	L7551
3513                     ; 859 	case ERROR_TYPE_BOILER:	
3513                     ; 860 		if (br_type == BR_TYPE_NONE) {
3515  000a c60000        	ld	a,_br_type
3516  000d 2719          	jreq	L7551
3518                     ; 861 		} else if (br_type == BR_TYPE_KR) {
3520  000f a101          	cp	a,#1
3521  0011 2605          	jrne	L5651
3522                     ; 862 			br_kr_error_reset();
3524  0013 cd0000        	call	_br_kr_error_reset
3527  0016 2010          	jra	L7551
3528  0018               L5651:
3529                     ; 863 		} else if (br_type == BR_TYPE_KD) {
3531  0018 a102          	cp	a,#2
3532  001a 2605          	jrne	L1751
3533                     ; 864 			br_kd_error_reset();
3535  001c cd0000        	call	_br_kd_error_reset
3538  001f 2007          	jra	L7551
3539  0021               L1751:
3540                     ; 871 		} else if (br_type == BR_TYPE_DW) {
3542  0021 a104          	cp	a,#4
3543  0023 2603          	jrne	L7551
3544                     ; 872 			br_dw_error_reset();
3546  0025 cd0000        	call	_br_dw_error_reset
3548                     ; 876 	case ERROR_TYPE_CNT:	break;
3550                     ; 877 	case ERROR_TYPE_RC:		break;
3552                     ; 878 	case ERROR_TYPE_HN:		break;
3554  0028               L7551:
3555                     ; 881 	funcInfo.error_type = 0;
3557  0028 725f0009      	clr	_funcInfo+9
3558                     ; 882 	funcInfo.error = 0;
3560  002c 725f0008      	clr	_funcInfo+8
3561                     ; 883 }
3564  0030 81            	ret	
3604                     ; 885 void func_cnt_error(uint8_t type, uint8_t code) {
3605                     .text:	section	.text,new
3606  0000               _func_cnt_error:
3608  0000 89            	pushw	x
3609       00000000      OFST:	set	0
3612                     ; 886 	if (funcInfo.error != 0) {
3614  0001 c60008        	ld	a,_funcInfo+8
3615  0004 260a          	jrne	L603
3616                     ; 895 		return;
3618                     ; 897 	funcInfo.error_type = type;
3620  0006 7b01          	ld	a,(OFST+1,sp)
3621  0008 c70009        	ld	_funcInfo+9,a
3622                     ; 898 	funcInfo.error = code;
3624  000b 7b02          	ld	a,(OFST+2,sp)
3625  000d c70008        	ld	_funcInfo+8,a
3626                     ; 899 }
3627  0010               L603:
3630  0010 85            	popw	x
3631  0011 81            	ret	
3671                     ; 903 uint8_t	func_get_errorcode(void)
3671                     ; 904 {
3672                     .text:	section	.text,new
3673  0000               _func_get_errorcode:
3675  0000 89            	pushw	x
3676       00000002      OFST:	set	2
3679                     ; 905 	uint8_t	err = 0x98;
3681  0001 a698          	ld	a,#152
3682  0003 6b02          	ld	(OFST+0,sp),a
3683                     ; 907 	switch(ext_br_type)
3685  0005 c60000        	ld	a,_ext_br_type
3687                     ; 916 		default:
3687                     ; 917 			return err;
3688  0008 4a            	dec	a
3691  0009 2613          	jrne	L1261
3692                     ; 909 		case 1:
3692                     ; 910 			//	KR(hex)
3692                     ; 911 			i = ((err&0xf0)<<4) | (err&0x0f);
3694  000b 7b02          	ld	a,(OFST+0,sp)
3695  000d a40f          	and	a,#15
3696  000f 6b01          	ld	(OFST-1,sp),a
3697  0011 7b02          	ld	a,(OFST+0,sp)
3698  0013 a4f0          	and	a,#240
3699  0015 97            	ld	xl,a
3700  0016 a610          	ld	a,#16
3701  0018 42            	mul	x,a
3702  0019 9f            	ld	a,xl
3703  001a 1a01          	or	a,(OFST-1,sp)
3704                     ; 912 			return i;
3707  001c               L213:
3709  001c 85            	popw	x
3710  001d 81            	ret	
3711  001e               L1261:
3712                     ; 913 		case 2:
3712                     ; 914 			//	KD(dec)
3712                     ; 915 			return err;
3715  001e 7b02          	ld	a,(OFST+0,sp)
3717  0020 20fa          	jra	L213
3775                     ; 925 void	testCb_mt_test_open_it(void)
3775                     ; 926 {
3776                     .text:	section	.text,new
3777  0000               _testCb_mt_test_open_it:
3779  0000 520c          	subw	sp,#12
3780       0000000c      OFST:	set	12
3783                     ; 930 	s = 0;
3785  0002 0f02          	clr	(OFST-10,sp)
3786                     ; 934 	__mt_closereset = 1;
3788  0004 35010000      	mov	___mt_closereset,#1
3789                     ; 935 	__mt_closeflag = 1;
3791  0008 35010000      	mov	___mt_closeflag,#1
3792                     ; 936 	mt_run(1, 0, 2800);
3794  000c ae0af0        	ldw	x,#2800
3795  000f 89            	pushw	x
3796  0010 ae0100        	ldw	x,#256
3797  0013 cd0000        	call	_mt_run
3799  0016 35640000      	mov	___mt_offset,#100
3800  001a 85            	popw	x
3801                     ; 937 	__mt_offset[0] = 100;
3803  001b               L7461:
3804                     ; 942 Entry:
3804                     ; 943 		i = 0;
3806                     ; 944 		timerCalc();
3808  001b cd0000        	call	_timerCalc
3810                     ; 945 		if( s == 0 )
3812  001e 7b02          	ld	a,(OFST-10,sp)
3813  0020 2628          	jrne	L7761
3814                     ; 948 			if( __mt_closereset == 0 )
3816  0022 725d0000      	tnz	___mt_closereset
3817  0026 260c          	jrne	L1071
3818                     ; 951 				s = 1;
3820  0028 4c            	inc	a
3821  0029 6b02          	ld	(OFST-10,sp),a
3822                     ; 952 				mt_run(1, 1, MT_OPEN_OFFSET);
3824  002b ae0960        	ldw	x,#2400
3825  002e 89            	pushw	x
3826  002f ae0101        	ldw	x,#257
3829  0032 2012          	jp	LC031
3830  0034               L1071:
3831                     ; 957 				if( __mt_closeError[0] == 100 )
3833  0034 c60000        	ld	a,___mt_closeError
3834  0037 a164          	cp	a,#100
3835  0039 260f          	jrne	L7761
3836                     ; 959 					__mt_closeflag = 1;
3838  003b 35010000      	mov	___mt_closeflag,#1
3839                     ; 960 					mt_run(1, 0, 2800);
3841  003f ae0af0        	ldw	x,#2800
3842  0042 89            	pushw	x
3843  0043 ae0100        	ldw	x,#256
3845  0046               LC031:
3846  0046 cd0000        	call	_mt_run
3847  0049 85            	popw	x
3848  004a               L7761:
3849                     ; 964 		else if( s == 1 )
3852                     ; 968 		else if( s == 2 )
3854                     ; 977 		if( __timer1s != pp[5] )
3856  004a c60000        	ld	a,___timer1s
3857  004d 1108          	cp	a,(OFST-4,sp)
3858  004f 27ca          	jreq	L7461
3859                     ; 979 			pp[6] = pp[6]==0 ? 1 : 0;
3861  0051 7b09          	ld	a,(OFST-3,sp)
3862  0053 2603          	jrne	L623
3863  0055 4c            	inc	a
3864  0056 2001          	jra	L033
3865  0058               L623:
3866  0058 4f            	clr	a
3867  0059               L033:
3868  0059 6b09          	ld	(OFST-3,sp),a
3869                     ; 980 			if( cntGetType() == 0 || pp[6]==1 )
3871  005b cd0000        	call	_cntGetType
3873  005e 4d            	tnz	a
3874  005f 2705          	jreq	L3271
3876  0061 7b09          	ld	a,(OFST-3,sp)
3877  0063 4a            	dec	a
3878  0064 2604          	jrne	L1271
3879  0066               L3271:
3880                     ; 981 				D_IO_TOGGLE(D_LED_PORT, D_LED_PIN);
3882  0066 90125000      	bcpl	20480,#1
3883  006a               L1271:
3884                     ; 982 			pp[5] = __timer1s;
3886  006a c60000        	ld	a,___timer1s
3887  006d 6b08          	ld	(OFST-4,sp),a
3888  006f 20aa          	jra	L7461
4186                     	xdef	_testCb_mt_test_open_it
4187                     	xref	___mt_offset
4188                     	xref	___mt_closeflag
4189                     	xref	___mt_closereset
4190                     	xdef	_func_get_errorcode
4191                     	xref	_ext_br_type
4192                     	xref	_cnt_check_state
4193                     	xref	_mirror_type
4194                     	xref	_curr_mirror_page
4195                     	xdef	_vtbl_loop
4196                     	xdef	_vtbl_Cntl
4197                     	xdef	_vtbl_po
4198                     	xdef	_vtbl_get_openCount
4199                     	xdef	_vtbl_each
4200                     	xdef	_vtbl_boiler_cntl
4201                     	xdef	_vtbl_each_main
4202                     	xdef	_vtbl_each_sub
4203                     	xdef	_vtbl_get_short
4204                     	xdef	_vtbl_local
4205                     	xdef	_vtbl_local_main
4206                     	xdef	_vtbl_local_sub
4207                     	xdef	_vtbl_disp
4208                     	switch	.bss
4209  0000               _iClose:
4210  0000 00            	ds.b	1
4211                     	xdef	_iClose
4212  0001               _iOpen:
4213  0001 00            	ds.b	1
4214                     	xdef	_iOpen
4215                     	xref	_relayCntl
4216                     	xdef	_vtbl_getCoilLarge
4217                     	xdef	_vtbl_calc
4218                     	xdef	_vtbl_set
4219                     	xdef	_vtbl_init
4220                     	xref	_calc_final
4221                     	xref	_tbl_temp
4222  0002               _ev:
4223  0002 00000000      	ds.b	4
4224                     	xdef	_ev
4225                     	xref	_cnt_chnage_rc_set
4226                     	xref	_toolSetPos
4227                     	xref	_packet_buf
4228                     	xref	__tsCntlHead
4229                     	xref	__tsCntlTail
4230  0006               _b:
4231  0006 000000000000  	ds.b	10
4232                     	xdef	_b
4233                     	xdef	_debug_enable_cnt
4234                     	xdef	_debug_enable_vtbl
4235                     	xref	_toolSetPush
4236                     	xref	_mt_Ready
4237                     	xref	_mt_run
4238                     	xref	___mt_closeError
4239                     	xref	_br_kd_error_reset
4240                     	xref	_br_dw_error_reset
4241                     	xref	_br_kr_error_reset
4242                     	xref	_br_type
4243                     	xref	_cntGetType
4244                     	xdef	_func_cnt_error
4245                     	xdef	_func_cnt_errorReset
4246                     	xdef	_func_cnt_reset
4247                     	xdef	_func_cnt_hotwater
4248                     	xdef	_func_cnt_endMirror
4249                     	xdef	_func_cnt_mirror
4250                     	xdef	_func_cnt_factory
4251                     	xdef	_func_cnt_calcInfo
4252                     	xref	_rcInfo
4253                     	xref	_funcInfo2
4254                     	xref	_funcInfo
4255                     	xref	__uc
4256  0010               _vtbl:
4257  0010 000000000000  	ds.b	191
4258                     	xdef	_vtbl
4259                     	xref	_file_write
4260                     	xref	_timerCalc
4261                     	xref	___timer1s
4262                     	xref.b	c_y
4282                     	end
