   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     	switch	.data
  24  0000               __mt_Cntl:
  25  0000 00            	dc.b	0
  26  0001               __mt_s:
  27  0001 00            	dc.b	0
  28  0002               __mt_s_rev:
  29  0002 00            	dc.b	0
  30  0003               __mt_pwm:
  31  0003 00            	dc.b	0
  32  0004               __mt_p1:
  33  0004 00            	dc.b	0
  34  0005               __mt_p2:
  35  0005 00            	dc.b	0
  36  0006               __qq:
  37  0006 00            	dc.b	0
  38  0007               ___mt_closeError:
  39  0007 00            	dc.b	0
  40  0008 00            	dc.b	0
  41  0009 00            	dc.b	0
  42  000a 00            	dc.b	0
  43  000b 00            	dc.b	0
  44  000c 00            	dc.b	0
  45  000d 00            	dc.b	0
  46  000e 00            	dc.b	0
  47  000f 00            	dc.b	0
  48  0010 00            	dc.b	0
  49  0011 00            	dc.b	0
  50  0012 00            	dc.b	0
  51  0013 00            	dc.b	0
  52  0014 00            	dc.b	0
  53  0015 00            	dc.b	0
  54  0016 00            	dc.b	0
  95                     ; 62 void	mt_clear(uint8_t i)
  95                     ; 63 {
  97                     .text:	section	.text,new
  98  0000               _mt_clear:
 102                     ; 65 	__mt_enable = 0;
 104  0000 725f001a      	clr	___mt_enable
 105                     ; 67 	__L(IO_MV, IO_V1p);
 107  0004 72175014      	bres	20500,#3
 108                     ; 68 	__L(IO_MV, IO_V2p);
 110  0008 72155014      	bres	20500,#2
 111                     ; 69 	__L(IO_MV, IO_V3p);
 113  000c 72135014      	bres	20500,#1
 114                     ; 70 	__L(IO_MV, IO_V4p);
 116  0010 72115014      	bres	20500,#0
 117                     ; 72 	D_IO_LOW(IO_M1, IO_M1p);
 119  0014 7213501e      	bres	20510,#1
 120                     ; 73 	D_IO_LOW(IO_M2, IO_M2p);
 122  0018 7211501e      	bres	20510,#0
 123                     ; 74 	D_IO_LOW(IO_M3, IO_M3p);
 125  001c 721f500a      	bres	20490,#7
 126                     ; 75 	D_IO_LOW(IO_M4, IO_M4p);
 128  0020 721d500a      	bres	20490,#6
 129                     ; 77 	D_IO_LOW(IO_M5, IO_M5p);
 131  0024 721b500a      	bres	20490,#5
 132                     ; 78 	D_IO_LOW(IO_M6, IO_M6p);
 134  0028 7219500a      	bres	20490,#4
 135                     ; 79 	D_IO_LOW(IO_M7, IO_M7p);
 137  002c 7217500a      	bres	20490,#3
 138                     ; 80 	D_IO_LOW(IO_M8, IO_M8p);
 140  0030 721b5014      	bres	20500,#5
 141                     ; 82 	MT_PWM(0,0)		
 143  0034 725f0004      	clr	__mt_p1
 146  0038 725f0005      	clr	__mt_p2
 147                     ; 83 }
 150  003c 81            	ret	
 175                     ; 85 void	mt_init(void)
 175                     ; 86 {
 176                     .text:	section	.text,new
 177  0000               _mt_init:
 181                     ; 96 	GPIO_Init(IO_M1, IO_M1p, D_IO_OUT_TRIGER);
 183  0000 4be0          	push	#224
 184  0002 4b02          	push	#2
 185  0004 ae501e        	ldw	x,#20510
 186  0007 cd0000        	call	_GPIO_Init
 188  000a 85            	popw	x
 189                     ; 97 	GPIO_Init(IO_M2, IO_M2p, D_IO_OUT_TRIGER);
 191  000b 4be0          	push	#224
 192  000d 4b01          	push	#1
 193  000f ae501e        	ldw	x,#20510
 194  0012 cd0000        	call	_GPIO_Init
 196  0015 85            	popw	x
 197                     ; 98 	GPIO_Init(IO_M3, IO_M3p, D_IO_OUT_TRIGER);
 199  0016 4be0          	push	#224
 200  0018 4b80          	push	#128
 201  001a ae500a        	ldw	x,#20490
 202  001d cd0000        	call	_GPIO_Init
 204  0020 85            	popw	x
 205                     ; 99 	GPIO_Init(IO_M4, IO_M4p, D_IO_OUT_TRIGER);
 207  0021 4be0          	push	#224
 208  0023 4b40          	push	#64
 209  0025 ae500a        	ldw	x,#20490
 210  0028 cd0000        	call	_GPIO_Init
 212  002b 85            	popw	x
 213                     ; 100 	GPIO_Init(IO_M5, IO_M5p, D_IO_OUT_TRIGER);
 215  002c 4be0          	push	#224
 216  002e 4b20          	push	#32
 217  0030 ae500a        	ldw	x,#20490
 218  0033 cd0000        	call	_GPIO_Init
 220  0036 85            	popw	x
 221                     ; 101 	GPIO_Init(IO_M6, IO_M6p, D_IO_OUT_TRIGER);
 223  0037 4be0          	push	#224
 224  0039 4b10          	push	#16
 225  003b ae500a        	ldw	x,#20490
 226  003e cd0000        	call	_GPIO_Init
 228  0041 85            	popw	x
 229                     ; 102 	GPIO_Init(IO_M7, IO_M7p, D_IO_OUT_TRIGER);
 231  0042 4be0          	push	#224
 232  0044 4b08          	push	#8
 233  0046 ae500a        	ldw	x,#20490
 234  0049 cd0000        	call	_GPIO_Init
 236  004c 85            	popw	x
 237                     ; 103 	GPIO_Init(IO_M8, IO_M8p, D_IO_OUT_TRIGER);
 239  004d 4be0          	push	#224
 240  004f 4b20          	push	#32
 241  0051 ae5014        	ldw	x,#20500
 242  0054 cd0000        	call	_GPIO_Init
 244  0057 85            	popw	x
 245                     ; 105 	GPIO_Init(IO_MV, IO_V1p, D_IO_OUT_TRIGER);
 247  0058 4be0          	push	#224
 248  005a 4b08          	push	#8
 249  005c ae5014        	ldw	x,#20500
 250  005f cd0000        	call	_GPIO_Init
 252  0062 85            	popw	x
 253                     ; 106 	GPIO_Init(IO_MV, IO_V2p, D_IO_OUT_TRIGER);
 255  0063 4be0          	push	#224
 256  0065 4b04          	push	#4
 257  0067 ae5014        	ldw	x,#20500
 258  006a cd0000        	call	_GPIO_Init
 260  006d 85            	popw	x
 261                     ; 107 	GPIO_Init(IO_MV, IO_V3p, D_IO_OUT_TRIGER);
 263  006e 4be0          	push	#224
 264  0070 4b02          	push	#2
 265  0072 ae5014        	ldw	x,#20500
 266  0075 cd0000        	call	_GPIO_Init
 268  0078 85            	popw	x
 269                     ; 108 	GPIO_Init(IO_MV, IO_V4p, D_IO_OUT_TRIGER);
 271  0079 4be0          	push	#224
 272  007b 4b01          	push	#1
 273  007d ae5014        	ldw	x,#20500
 274  0080 cd0000        	call	_GPIO_Init
 276  0083 85            	popw	x
 277                     ; 111 	GPIO_Init(IO_B1, IO_B1p, D_IO_IN_TRIGER_NOIT);
 279  0084 4b40          	push	#64
 280  0086 4b20          	push	#32
 281  0088 ae5005        	ldw	x,#20485
 282  008b cd0000        	call	_GPIO_Init
 284  008e 85            	popw	x
 285                     ; 112 	GPIO_Init(IO_B2, IO_B2p, D_IO_IN_TRIGER_NOIT);
 287  008f 4b40          	push	#64
 288  0091 4b10          	push	#16
 289  0093 ae5005        	ldw	x,#20485
 290  0096 cd0000        	call	_GPIO_Init
 292  0099 85            	popw	x
 293                     ; 113 	GPIO_Init(IO_B3, IO_B3p, D_IO_IN_TRIGER_NOIT);
 295  009a 4b40          	push	#64
 296  009c 4b08          	push	#8
 297  009e ae5005        	ldw	x,#20485
 298  00a1 cd0000        	call	_GPIO_Init
 300  00a4 85            	popw	x
 301                     ; 114 	GPIO_Init(IO_B4, IO_B4p, D_IO_IN_TRIGER_NOIT);
 303  00a5 4b40          	push	#64
 304  00a7 4b04          	push	#4
 305  00a9 ae5005        	ldw	x,#20485
 306  00ac cd0000        	call	_GPIO_Init
 308  00af 85            	popw	x
 309                     ; 115 	GPIO_Init(IO_B5, IO_B5p, D_IO_IN_TRIGER_NOIT);
 311  00b0 4b40          	push	#64
 312  00b2 4b02          	push	#2
 313  00b4 ae5005        	ldw	x,#20485
 314  00b7 cd0000        	call	_GPIO_Init
 316  00ba 85            	popw	x
 317                     ; 116 	GPIO_Init(IO_B6, IO_B6p, D_IO_IN_TRIGER_NOIT);
 319  00bb 4b40          	push	#64
 320  00bd 4b01          	push	#1
 321  00bf ae5005        	ldw	x,#20485
 322  00c2 cd0000        	call	_GPIO_Init
 324  00c5 85            	popw	x
 325                     ; 117 	GPIO_Init(IO_B7, IO_B7p, D_IO_IN_TRIGER_NOIT);
 327  00c6 4b40          	push	#64
 328  00c8 4b80          	push	#128
 329  00ca ae5014        	ldw	x,#20500
 330  00cd cd0000        	call	_GPIO_Init
 332  00d0 85            	popw	x
 333                     ; 118 	GPIO_Init(IO_B8, IO_B8p, D_IO_IN_TRIGER_NOIT);
 335  00d1 4b40          	push	#64
 336  00d3 4b40          	push	#64
 337  00d5 ae5014        	ldw	x,#20500
 338  00d8 cd0000        	call	_GPIO_Init
 340  00db a601          	ld	a,#1
 341  00dd 85            	popw	x
 342                     ; 129 	mt_clear(1);
 345                     ; 133 }
 348  00de cc0000        	jp	_mt_clear
 351                     	switch	.data
 352  0017               ___mt_count16:
 353  0017 0000          	dc.w	0
 354  0019               __mo_count:
 355  0019 00            	dc.b	0
 356  001a               ___mt_enable:
 357  001a 00            	dc.b	0
 358  001b               ___mt_id:
 359  001b 00            	dc.b	0
 360  001c               ___mt_i:
 361  001c 00            	dc.b	0
 362  001d               ___mt_dir:
 363  001d 00            	dc.b	0
 364  001e               ___mt_side:
 365  001e 00            	dc.b	0
 366  001f               ___mt_closeflag:
 367  001f 00            	dc.b	0
 368  0020               ___mt_closereset:
 369  0020 00            	dc.b	0
 370  0021               ___mt_type_flag:
 371  0021 00            	dc.b	0
 372  0022               ___mt_wait_init:
 373  0022 03e8          	dc.w	1000
 433                     ; 169 void	mt_run(uint8_t id, uint8_t dir, uint16_t count)
 433                     ; 170 {
 434                     .text:	section	.text,new
 435  0000               _mt_run:
 437  0000 89            	pushw	x
 438  0001 5204          	subw	sp,#4
 439       00000004      OFST:	set	4
 442                     ; 174 	mt_clear(1);
 444  0003 a601          	ld	a,#1
 445  0005 cd0000        	call	_mt_clear
 447                     ; 175 	if( count == 0 )
 449  0008 1e09          	ldw	x,(OFST+5,sp)
 450  000a 2603cc00b4    	jreq	L27
 451                     ; 176 		return;
 453                     ; 178 	if( id == 1 )		{	__H_SIDE(IO_V1p, 0);	}
 455  000f 7b05          	ld	a,(OFST+1,sp)
 456  0011 a101          	cp	a,#1
 457  0013 2606          	jrne	L16
 460  0015 72165014      	bset	20500,#3
 464  0019 201c          	jp	LC002
 465  001b               L16:
 466                     ; 179 	else if( id == 2 )	{	__H_SIDE(IO_V2p, 0);	}
 468  001b a102          	cp	a,#2
 469  001d 2606          	jrne	L56
 472  001f 72145014      	bset	20500,#2
 476  0023 2012          	jp	LC002
 477  0025               L56:
 478                     ; 180 	else if( id == 3 )	{	__H_SIDE(IO_V3p, 0);	}
 480  0025 a103          	cp	a,#3
 481  0027 2606          	jrne	L17
 484  0029 72125014      	bset	20500,#1
 488  002d 2008          	jp	LC002
 489  002f               L17:
 490                     ; 181 	else if( id == 4 )	{	__H_SIDE(IO_V4p, 0);	}
 492  002f a104          	cp	a,#4
 493  0031 260a          	jrne	L57
 496  0033 72105014      	bset	20500,#0
 499  0037               LC002:
 503  0037 725f001e      	clr	___mt_side
 506  003b 202a          	jra	L36
 507  003d               L57:
 508                     ; 182 	else if( id == 5 )	{	__H_SIDE(IO_V4p, 1);	}
 510  003d a105          	cp	a,#5
 511  003f 2606          	jrne	L101
 514  0041 72105014      	bset	20500,#0
 518  0045 201c          	jp	LC001
 519  0047               L101:
 520                     ; 183 	else if( id == 6 )	{	__H_SIDE(IO_V3p, 1);	}
 522  0047 a106          	cp	a,#6
 523  0049 2606          	jrne	L501
 526  004b 72125014      	bset	20500,#1
 530  004f 2012          	jp	LC001
 531  0051               L501:
 532                     ; 184 	else if( id == 7 )	{	__H_SIDE(IO_V2p, 1);	}
 534  0051 a107          	cp	a,#7
 535  0053 2606          	jrne	L111
 538  0055 72145014      	bset	20500,#2
 542  0059 2008          	jp	LC001
 543  005b               L111:
 544                     ; 185 	else if( id == 8 )	{	__H_SIDE(IO_V1p, 1);	}
 546  005b a108          	cp	a,#8
 547  005d 2608          	jrne	L36
 550  005f 72165014      	bset	20500,#3
 553  0063               LC001:
 557  0063 3501001e      	mov	___mt_side,#1
 559  0067               L36:
 560                     ; 187 	__mt_dir = dir;
 562  0067 7b06          	ld	a,(OFST+2,sp)
 563  0069 c7001d        	ld	___mt_dir,a
 564                     ; 188 	__mt_id = id;
 566  006c 7b05          	ld	a,(OFST+1,sp)
 567  006e c7001b        	ld	___mt_id,a
 568                     ; 189 	_mo_count = 0;
 570  0071 725f0019      	clr	__mo_count
 571                     ; 191 	if( __mt_type_flag == 0 )
 573  0075 c60021        	ld	a,___mt_type_flag
 574  0078 2607          	jrne	L711
 575                     ; 197 		__mt_count16 = count;
 577  007a 1e09          	ldw	x,(OFST+5,sp)
 578  007c cf0017        	ldw	___mt_count16,x
 580  007f 2029          	jra	L121
 581  0081               L711:
 582                     ; 201 		i32 = 1757;
 584                     ; 202 		i32 = count * i32;			//	1.716*1024
 586  0081 1e09          	ldw	x,(OFST+5,sp)
 587  0083 90ae06dd      	ldw	y,#1757
 588  0087 cd0000        	call	c_umul
 590  008a 96            	ldw	x,sp
 591  008b 5c            	incw	x
 592  008c cd0000        	call	c_rtol
 594                     ; 203 		__mt_count16 = i32 / 1024;	//	/1024
 596  008f 96            	ldw	x,sp
 597  0090 5c            	incw	x
 598  0091 cd0000        	call	c_ltor
 600  0094 a60a          	ld	a,#10
 601  0096 cd0000        	call	c_lursh
 603  0099 be02          	ldw	x,c_lreg+2
 604  009b cf0017        	ldw	___mt_count16,x
 605                     ; 205 		__mt_dir = __mt_dir == 0 ? 1 : 0;
 607  009e c6001d        	ld	a,___mt_dir
 608  00a1 2603          	jrne	L66
 609  00a3 4c            	inc	a
 610  00a4 2001          	jra	L07
 611  00a6               L66:
 612  00a6 4f            	clr	a
 613  00a7               L07:
 614  00a7 c7001d        	ld	___mt_dir,a
 615  00aa               L121:
 616                     ; 207 	__mt_wait_init = 100;	//	100us*10 = 1ms * 1000 = 1s
 618  00aa ae0064        	ldw	x,#100
 619  00ad cf0022        	ldw	___mt_wait_init,x
 620                     ; 208 	__mt_enable = 1;
 622  00b0 3501001a      	mov	___mt_enable,#1
 623                     ; 209 }
 624  00b4               L27:
 627  00b4 5b06          	addw	sp,#6
 628  00b6 81            	ret	
 655                     ; 211 void	_mtCbCW(void)
 655                     ; 212 {
 656                     .text:	section	.text,new
 657  0000               __mtCbCW:
 661                     ; 214 	if( __mt_side == 0 )
 663  0000 c6001e        	ld	a,___mt_side
 664  0003 2703cc0090    	jrne	L331
 665                     ; 217 		if( __mt_k == 0 )
 667  0008 c60002        	ld	a,___mt_k
 668  000b 261d          	jrne	L531
 669                     ; 219 			__mt_k = 1;
 671  000d 35010002      	mov	___mt_k,#1
 672                     ; 220 			D_IO_LOW(IO_M1, IO_M1p);
 674  0011 7213501e      	bres	20510,#1
 675                     ; 221 			D_IO_HIGH(IO_M2, IO_M2p);
 677  0015 7210501e      	bset	20510,#0
 678                     ; 222 			D_IO_HIGH(IO_M3, IO_M3p);
 680  0019 721e500a      	bset	20490,#7
 681                     ; 223 			D_IO_LOW(IO_M4, IO_M4p);
 683  001d 721d500a      	bres	20490,#6
 684                     ; 224 			MT_PWM(2,3)
 686  0021 35020004      	mov	__mt_p1,#2
 689  0025 35030005      	mov	__mt_p2,#3
 692  0029 81            	ret	
 693  002a               L531:
 694                     ; 226 		else if( __mt_k == 1 )
 696  002a a101          	cp	a,#1
 697  002c 261d          	jrne	L141
 698                     ; 228 			__mt_k = 2;
 700  002e 35020002      	mov	___mt_k,#2
 701                     ; 229 			D_IO_LOW(IO_M1, IO_M1p);
 703  0032 7213501e      	bres	20510,#1
 704                     ; 230 			D_IO_HIGH(IO_M2, IO_M2p);
 706  0036 7210501e      	bset	20510,#0
 707                     ; 231 			D_IO_LOW(IO_M3, IO_M3p);
 709  003a 721f500a      	bres	20490,#7
 710                     ; 232 			D_IO_HIGH(IO_M4, IO_M4p);
 712  003e 721c500a      	bset	20490,#6
 713                     ; 233 			MT_PWM(2,4)
 715  0042 35020004      	mov	__mt_p1,#2
 718  0046 35040005      	mov	__mt_p2,#4
 721  004a 81            	ret	
 722  004b               L141:
 723                     ; 235 		else if( __mt_k == 2 )
 725  004b a102          	cp	a,#2
 726  004d 261d          	jrne	L541
 727                     ; 237 			__mt_k = 3;
 729  004f 35030002      	mov	___mt_k,#3
 730                     ; 238 			D_IO_HIGH(IO_M1, IO_M1p);
 732  0053 7212501e      	bset	20510,#1
 733                     ; 239 			D_IO_LOW(IO_M2, IO_M2p);
 735  0057 7211501e      	bres	20510,#0
 736                     ; 240 			D_IO_LOW(IO_M3, IO_M3p);
 738  005b 721f500a      	bres	20490,#7
 739                     ; 241 			D_IO_HIGH(IO_M4, IO_M4p);
 741  005f 721c500a      	bset	20490,#6
 742                     ; 242 			MT_PWM(1,4)
 744  0063 35010004      	mov	__mt_p1,#1
 747  0067 35040005      	mov	__mt_p2,#4
 750  006b 81            	ret	
 751  006c               L541:
 752                     ; 244 		else if( __mt_k == 3 )
 754  006c a103          	cp	a,#3
 755  006e 2703cc010e    	jrne	L351
 756                     ; 246 			__mt_k = 0;
 758  0073 725f0002      	clr	___mt_k
 759                     ; 247 			D_IO_HIGH(IO_M1, IO_M1p);
 761  0077 7212501e      	bset	20510,#1
 762                     ; 248 			D_IO_LOW(IO_M2, IO_M2p);
 764  007b 7211501e      	bres	20510,#0
 765                     ; 249 			D_IO_HIGH(IO_M3, IO_M3p);
 767  007f 721e500a      	bset	20490,#7
 768                     ; 250 			D_IO_LOW(IO_M4, IO_M4p);
 770  0083 721d500a      	bres	20490,#6
 771                     ; 251 			MT_PWM(1,3)
 773  0087 35010004      	mov	__mt_p1,#1
 776  008b 35030005      	mov	__mt_p2,#3
 778  008f 81            	ret	
 779  0090               L331:
 780                     ; 256 		if( __mt_k == 0 )
 782  0090 c60002        	ld	a,___mt_k
 783  0093 261a          	jrne	L551
 784                     ; 258 			__mt_k = 1;
 786  0095 35010002      	mov	___mt_k,#1
 787                     ; 259 			D_IO_LOW(IO_M5, IO_M5p);
 789  0099 721b500a      	bres	20490,#5
 790                     ; 260 			D_IO_HIGH(IO_M6, IO_M6p);
 792  009d 7218500a      	bset	20490,#4
 793                     ; 261 			D_IO_HIGH(IO_M7, IO_M7p);
 795  00a1 7216500a      	bset	20490,#3
 796                     ; 262 			D_IO_LOW(IO_M8, IO_M8p);
 798  00a5 721b5014      	bres	20500,#5
 799                     ; 263 			MT_PWM(6,7)
 801  00a9 35060004      	mov	__mt_p1,#6
 804  00ad 205b          	jp	LC003
 805  00af               L551:
 806                     ; 265 		else if( __mt_k == 1 )
 808  00af a101          	cp	a,#1
 809  00b1 261a          	jrne	L161
 810                     ; 267 			__mt_k = 2;
 812  00b3 35020002      	mov	___mt_k,#2
 813                     ; 268 			D_IO_LOW(IO_M5, IO_M5p);
 815  00b7 721b500a      	bres	20490,#5
 816                     ; 269 			D_IO_HIGH(IO_M6, IO_M6p);
 818  00bb 7218500a      	bset	20490,#4
 819                     ; 270 			D_IO_LOW(IO_M7, IO_M7p);
 821  00bf 7217500a      	bres	20490,#3
 822                     ; 271 			D_IO_HIGH(IO_M8, IO_M8p);
 824  00c3 721a5014      	bset	20500,#5
 825                     ; 272 			MT_PWM(6,8)
 827  00c7 35060004      	mov	__mt_p1,#6
 830  00cb 201c          	jp	LC004
 831  00cd               L161:
 832                     ; 274 		else if( __mt_k == 2 )
 834  00cd a102          	cp	a,#2
 835  00cf 261d          	jrne	L561
 836                     ; 276 			__mt_k = 3;
 838  00d1 35030002      	mov	___mt_k,#3
 839                     ; 277 			D_IO_HIGH(IO_M5, IO_M5p);
 841  00d5 721a500a      	bset	20490,#5
 842                     ; 278 			D_IO_LOW(IO_M6, IO_M6p);
 844  00d9 7219500a      	bres	20490,#4
 845                     ; 279 			D_IO_LOW(IO_M7, IO_M7p);
 847  00dd 7217500a      	bres	20490,#3
 848                     ; 280 			D_IO_HIGH(IO_M8, IO_M8p);
 850  00e1 721a5014      	bset	20500,#5
 851                     ; 281 			MT_PWM(5,8)
 853  00e5 35050004      	mov	__mt_p1,#5
 856  00e9               LC004:
 858  00e9 35080005      	mov	__mt_p2,#8
 861  00ed 81            	ret	
 862  00ee               L561:
 863                     ; 283 		else if( __mt_k == 3 )
 865  00ee a103          	cp	a,#3
 866  00f0 261c          	jrne	L351
 867                     ; 285 			__mt_k = 0;
 869  00f2 725f0002      	clr	___mt_k
 870                     ; 286 			D_IO_HIGH(IO_M5, IO_M5p);
 872  00f6 721a500a      	bset	20490,#5
 873                     ; 287 			D_IO_LOW(IO_M6, IO_M6p);
 875  00fa 7219500a      	bres	20490,#4
 876                     ; 288 			D_IO_HIGH(IO_M7, IO_M7p);
 878  00fe 7216500a      	bset	20490,#3
 879                     ; 289 			D_IO_LOW(IO_M8, IO_M8p);
 881  0102 721b5014      	bres	20500,#5
 882                     ; 290 			MT_PWM(5,7)
 884  0106 35050004      	mov	__mt_p1,#5
 887  010a               LC003:
 889  010a 35070005      	mov	__mt_p2,#7
 890  010e               L351:
 891                     ; 293 }
 894  010e 81            	ret	
 921                     ; 295 void	_mtCbCCW(void)
 921                     ; 296 {
 922                     .text:	section	.text,new
 923  0000               __mtCbCCW:
 927                     ; 298 	if( __mt_side == 0 )
 929  0000 c6001e        	ld	a,___mt_side
 930  0003 2703cc0090    	jrne	L302
 931                     ; 300 		if( __mt_k == 0 )
 933  0008 c60002        	ld	a,___mt_k
 934  000b 261d          	jrne	L502
 935                     ; 302 			__mt_k = 3;
 937  000d 35030002      	mov	___mt_k,#3
 938                     ; 303 			D_IO_LOW(IO_M1, IO_M1p);
 940  0011 7213501e      	bres	20510,#1
 941                     ; 304 			D_IO_HIGH(IO_M2, IO_M2p);
 943  0015 7210501e      	bset	20510,#0
 944                     ; 305 			D_IO_HIGH(IO_M3, IO_M3p);
 946  0019 721e500a      	bset	20490,#7
 947                     ; 306 			D_IO_LOW(IO_M4, IO_M4p);
 949  001d 721d500a      	bres	20490,#6
 950                     ; 307 			MT_PWM(2,3)
 952  0021 35020004      	mov	__mt_p1,#2
 955  0025 35030005      	mov	__mt_p2,#3
 958  0029 81            	ret	
 959  002a               L502:
 960                     ; 309 		else if( __mt_k == 1 )
 962  002a a101          	cp	a,#1
 963  002c 261d          	jrne	L112
 964                     ; 311 			__mt_k = 0;
 966  002e 725f0002      	clr	___mt_k
 967                     ; 312 			D_IO_LOW(IO_M1, IO_M1p);
 969  0032 7213501e      	bres	20510,#1
 970                     ; 313 			D_IO_HIGH(IO_M2, IO_M2p);
 972  0036 7210501e      	bset	20510,#0
 973                     ; 314 			D_IO_LOW(IO_M3, IO_M3p);
 975  003a 721f500a      	bres	20490,#7
 976                     ; 315 			D_IO_HIGH(IO_M4, IO_M4p);
 978  003e 721c500a      	bset	20490,#6
 979                     ; 316 			MT_PWM(2,4)
 981  0042 35020004      	mov	__mt_p1,#2
 984  0046 35040005      	mov	__mt_p2,#4
 987  004a 81            	ret	
 988  004b               L112:
 989                     ; 318 		else if( __mt_k == 2 )
 991  004b a102          	cp	a,#2
 992  004d 261d          	jrne	L512
 993                     ; 320 			__mt_k = 1;
 995  004f 35010002      	mov	___mt_k,#1
 996                     ; 321 			D_IO_HIGH(IO_M1, IO_M1p);
 998  0053 7212501e      	bset	20510,#1
 999                     ; 322 			D_IO_LOW(IO_M2, IO_M2p);
1001  0057 7211501e      	bres	20510,#0
1002                     ; 323 			D_IO_LOW(IO_M3, IO_M3p);
1004  005b 721f500a      	bres	20490,#7
1005                     ; 324 			D_IO_HIGH(IO_M4, IO_M4p);
1007  005f 721c500a      	bset	20490,#6
1008                     ; 325 			MT_PWM(1,4)
1010  0063 35010004      	mov	__mt_p1,#1
1013  0067 35040005      	mov	__mt_p2,#4
1016  006b 81            	ret	
1017  006c               L512:
1018                     ; 327 		else if( __mt_k == 3 )
1020  006c a103          	cp	a,#3
1021  006e 2703cc010e    	jrne	L322
1022                     ; 329 			__mt_k = 2;
1024  0073 35020002      	mov	___mt_k,#2
1025                     ; 330 			D_IO_HIGH(IO_M1, IO_M1p);
1027  0077 7212501e      	bset	20510,#1
1028                     ; 331 			D_IO_LOW(IO_M2, IO_M2p);
1030  007b 7211501e      	bres	20510,#0
1031                     ; 332 			D_IO_HIGH(IO_M3, IO_M3p);
1033  007f 721e500a      	bset	20490,#7
1034                     ; 333 			D_IO_LOW(IO_M4, IO_M4p);
1036  0083 721d500a      	bres	20490,#6
1037                     ; 334 			MT_PWM(1,3)
1039  0087 35010004      	mov	__mt_p1,#1
1042  008b 35030005      	mov	__mt_p2,#3
1044  008f 81            	ret	
1045  0090               L302:
1046                     ; 339 		if( __mt_k == 0 )
1048  0090 c60002        	ld	a,___mt_k
1049  0093 261a          	jrne	L522
1050                     ; 341 			__mt_k = 3;
1052  0095 35030002      	mov	___mt_k,#3
1053                     ; 342 			D_IO_LOW(IO_M5, IO_M5p);
1055  0099 721b500a      	bres	20490,#5
1056                     ; 343 			D_IO_HIGH(IO_M6, IO_M6p);
1058  009d 7218500a      	bset	20490,#4
1059                     ; 344 			D_IO_HIGH(IO_M7, IO_M7p);
1061  00a1 7216500a      	bset	20490,#3
1062                     ; 345 			D_IO_LOW(IO_M8, IO_M8p);
1064  00a5 721b5014      	bres	20500,#5
1065                     ; 346 			MT_PWM(6,7)
1067  00a9 35060004      	mov	__mt_p1,#6
1070  00ad 205b          	jp	LC005
1071  00af               L522:
1072                     ; 348 		else if( __mt_k == 1 )
1074  00af a101          	cp	a,#1
1075  00b1 261a          	jrne	L132
1076                     ; 350 			__mt_k = 0;
1078  00b3 725f0002      	clr	___mt_k
1079                     ; 351 			D_IO_LOW(IO_M5, IO_M5p);
1081  00b7 721b500a      	bres	20490,#5
1082                     ; 352 			D_IO_HIGH(IO_M6, IO_M6p);
1084  00bb 7218500a      	bset	20490,#4
1085                     ; 353 			D_IO_LOW(IO_M7, IO_M7p);
1087  00bf 7217500a      	bres	20490,#3
1088                     ; 354 			D_IO_HIGH(IO_M8, IO_M8p);
1090  00c3 721a5014      	bset	20500,#5
1091                     ; 355 			MT_PWM(6,8)
1093  00c7 35060004      	mov	__mt_p1,#6
1096  00cb 201c          	jp	LC006
1097  00cd               L132:
1098                     ; 357 		else if( __mt_k == 2 )
1100  00cd a102          	cp	a,#2
1101  00cf 261d          	jrne	L532
1102                     ; 359 			__mt_k = 1;
1104  00d1 35010002      	mov	___mt_k,#1
1105                     ; 360 			D_IO_HIGH(IO_M5, IO_M5p);
1107  00d5 721a500a      	bset	20490,#5
1108                     ; 361 			D_IO_LOW(IO_M6, IO_M6p);
1110  00d9 7219500a      	bres	20490,#4
1111                     ; 362 			D_IO_LOW(IO_M7, IO_M7p);
1113  00dd 7217500a      	bres	20490,#3
1114                     ; 363 			D_IO_HIGH(IO_M8, IO_M8p);
1116  00e1 721a5014      	bset	20500,#5
1117                     ; 364 			MT_PWM(5,8)
1119  00e5 35050004      	mov	__mt_p1,#5
1122  00e9               LC006:
1124  00e9 35080005      	mov	__mt_p2,#8
1127  00ed 81            	ret	
1128  00ee               L532:
1129                     ; 366 		else if( __mt_k == 3 )
1131  00ee a103          	cp	a,#3
1132  00f0 261c          	jrne	L322
1133                     ; 368 			__mt_k = 2;
1135  00f2 35020002      	mov	___mt_k,#2
1136                     ; 369 			D_IO_HIGH(IO_M5, IO_M5p);
1138  00f6 721a500a      	bset	20490,#5
1139                     ; 370 			D_IO_LOW(IO_M6, IO_M6p);
1141  00fa 7219500a      	bres	20490,#4
1142                     ; 371 			D_IO_HIGH(IO_M7, IO_M7p);
1144  00fe 7216500a      	bset	20490,#3
1145                     ; 372 			D_IO_LOW(IO_M8, IO_M8p);
1147  0102 721b5014      	bres	20500,#5
1148                     ; 373 			MT_PWM(5,7)
1150  0106 35050004      	mov	__mt_p1,#5
1153  010a               LC005:
1155  010a 35070005      	mov	__mt_p2,#7
1156  010e               L322:
1157                     ; 376 }
1160  010e 81            	ret	
1200                     ; 378 uint8_t	mt_getPt(uint8_t i)
1200                     ; 379 {
1201                     .text:	section	.text,new
1202  0000               _mt_getPt:
1204  0000 88            	push	a
1205  0001 88            	push	a
1206       00000001      OFST:	set	1
1209                     ; 381 	if( i == 1 )		r = MT_READ(IO_B1, IO_B1p); 
1211  0002 4a            	dec	a
1212  0003 2604          	jrne	L162
1215  0005 4b20          	push	#32
1218  0007 2018          	jp	LC009
1219  0009               L162:
1220                     ; 382 	else if( i == 2 )	r = MT_READ(IO_B2, IO_B2p); 
1222  0009 7b02          	ld	a,(OFST+1,sp)
1223  000b a102          	cp	a,#2
1224  000d 2604          	jrne	L562
1227  000f 4b10          	push	#16
1230  0011 200e          	jp	LC009
1231  0013               L562:
1232                     ; 383 	else if( i == 3 )	r = MT_READ(IO_B3, IO_B3p); 
1234  0013 a103          	cp	a,#3
1235  0015 2604          	jrne	L172
1238  0017 4b08          	push	#8
1241  0019 2006          	jp	LC009
1242  001b               L172:
1243                     ; 384 	else if( i == 4 )	r = MT_READ(IO_B4, IO_B4p); 
1245  001b a104          	cp	a,#4
1246  001d 2607          	jrne	L572
1249  001f 4b04          	push	#4
1250  0021               LC009:
1251  0021 ae5005        	ldw	x,#20485
1254  0024 2021          	jp	LC007
1255  0026               L572:
1256                     ; 385 	else if( i == 5 )	r = MT_READ(IO_B5, IO_B5p); 
1258  0026 a105          	cp	a,#5
1259  0028 2604          	jrne	L103
1262  002a 4b02          	push	#2
1265  002c 20f3          	jp	LC009
1266  002e               L103:
1267                     ; 386 	else if( i == 6 )	r = MT_READ(IO_B6, IO_B6p); 
1269  002e a106          	cp	a,#6
1270  0030 2604          	jrne	L503
1273  0032 4b01          	push	#1
1276  0034 20eb          	jp	LC009
1277  0036               L503:
1278                     ; 387 	else if( i == 7 )	r = MT_READ(IO_B7, IO_B7p); 
1280  0036 a107          	cp	a,#7
1281  0038 2604          	jrne	L113
1284  003a 4b80          	push	#128
1287  003c 2006          	jp	LC008
1288  003e               L113:
1289                     ; 388 	else if( i == 8 )	r = MT_READ(IO_B8, IO_B8p); 
1291  003e a108          	cp	a,#8
1292  0040 260c          	jrne	L362
1295  0042 4b40          	push	#64
1296  0044               LC008:
1297  0044 ae5014        	ldw	x,#20500
1299  0047               LC007:
1300  0047 cd0000        	call	_GPIO_ReadInputPin
1301  004a 5b01          	addw	sp,#1
1302  004c 6b01          	ld	(OFST+0,sp),a
1303  004e               L362:
1304                     ; 389 	return r==0 ? 0 : 1;
1306  004e 7b01          	ld	a,(OFST+0,sp)
1307  0050 2702          	jreq	L421
1308  0052 a601          	ld	a,#1
1309  0054               L421:
1312  0054 85            	popw	x
1313  0055 81            	ret	
1342                     ; 392 void	mtOverrun(void)
1342                     ; 393 {
1343                     .text:	section	.text,new
1344  0000               _mtOverrun:
1348                     ; 394 	__mt_overrun = 0;
1350  0000 725f0001      	clr	___mt_overrun
1351                     ; 395 	switch( __mt_k )
1353  0004 c60002        	ld	a,___mt_k
1355                     ; 400 	case 0:	__mt_k = 2;	break;
1356  0007 271a          	jreq	L523
1357  0009 4a            	dec	a
1358  000a 2711          	jreq	L323
1359  000c 4a            	dec	a
1360  000d 2709          	jreq	L123
1361  000f 4a            	dec	a
1362  0010 2615          	jrne	L143
1363                     ; 397 	case 3:	__mt_k = 1;	break;
1365  0012 35010002      	mov	___mt_k,#1
1368  0016 200f          	jra	L143
1369  0018               L123:
1370                     ; 398 	case 2:	__mt_k = 0;	break;
1372  0018 c70002        	ld	___mt_k,a
1375  001b 200a          	jra	L143
1376  001d               L323:
1377                     ; 399 	case 1:	__mt_k = 3;	break;
1379  001d 35030002      	mov	___mt_k,#3
1382  0021 2004          	jra	L143
1383  0023               L523:
1384                     ; 400 	case 0:	__mt_k = 2;	break;
1386  0023 35020002      	mov	___mt_k,#2
1389  0027               L143:
1390                     ; 402 	mt_run(__mt_id, __mt_dir==0 ? 1 : 0, __mt_overrunCount+1);
1392  0027 c60000        	ld	a,___mt_overrunCount
1393  002a 5f            	clrw	x
1394  002b 97            	ld	xl,a
1395  002c 5c            	incw	x
1396  002d 89            	pushw	x
1397  002e c6001d        	ld	a,___mt_dir
1398  0031 2603          	jrne	L231
1399  0033 4c            	inc	a
1400  0034 2001          	jra	L431
1401  0036               L231:
1402  0036 4f            	clr	a
1403  0037               L431:
1404  0037 97            	ld	xl,a
1405  0038 c6001b        	ld	a,___mt_id
1406  003b 95            	ld	xh,a
1407  003c cd0000        	call	_mt_run
1409  003f 85            	popw	x
1410                     ; 403 }
1413  0040 81            	ret	
1438                     ; 405 void	mtCloseError(void)
1438                     ; 406 {
1439                     .text:	section	.text,new
1440  0000               _mtCloseError:
1444                     ; 409 	if( __mt_closeError[__mt_id - 1] < 100 )
1446  0000 c6001b        	ld	a,___mt_id
1447  0003 5f            	clrw	x
1448  0004 97            	ld	xl,a
1449  0005 5a            	decw	x
1450  0006 d60007        	ld	a,(___mt_closeError,x)
1451  0009 a164          	cp	a,#100
1452  000b 240b          	jruge	L353
1453                     ; 410 		__mt_closeError[__mt_id - 1] = 100;
1455  000d c6001b        	ld	a,___mt_id
1456  0010 5f            	clrw	x
1457  0011 97            	ld	xl,a
1458  0012 5a            	decw	x
1459  0013 a664          	ld	a,#100
1460  0015 d70007        	ld	(___mt_closeError,x),a
1461  0018               L353:
1462                     ; 411 }
1465  0018 81            	ret	
1468                     	switch	.data
1469  0024               ___mt_power:
1470  0024 01            	dc.b	1
1471  0025               ___mt_power_mode:
1472  0025 01            	dc.b	1
1520                     ; 418 void	_mtCb(void)
1520                     ; 419 {
1521                     .text:	section	.text,new
1522  0000               __mtCb:
1524  0000 88            	push	a
1525       00000001      OFST:	set	1
1528                     ; 422 	if( __mt_enable == 0 )
1530  0001 c6001a        	ld	a,___mt_enable
1531  0004 2602          	jrne	L573
1532                     ; 423 		return;
1535  0006 84            	pop	a
1536  0007 81            	ret	
1537  0008               L573:
1538                     ; 425 	if( __mt_type_flag == 0 )
1540  0008 c60021        	ld	a,___mt_type_flag
1541  000b 2609          	jrne	L773
1542                     ; 433 		_mtCount = 30;//_MT_TYPE_2_25MS;
1544  000d 351e0000      	mov	__mtCount,#30
1545                     ; 436 		dir = __mt_dir;
1547  0011 c6001d        	ld	a,___mt_dir
1549  0014 200d          	jra	L441
1550  0016               L773:
1551                     ; 514 		_mtCount = _MT_TYPE_1_90MS;
1553  0016 352d0000      	mov	__mtCount,#45
1554                     ; 515 		dir = __mt_dir==0 ? 1 : 0;
1556  001a c6001d        	ld	a,___mt_dir
1557  001d 2603          	jrne	L241
1558  001f 4c            	inc	a
1559  0020 2001          	jra	L441
1560  0022               L241:
1561  0022 4f            	clr	a
1562  0023               L441:
1563  0023 6b01          	ld	(OFST+0,sp),a
1564                     ; 526 	if( __mt_dir == 0 )		_mtCbCW();
1566  0025 c6001d        	ld	a,___mt_dir
1567  0028 2605          	jrne	L304
1570  002a cd0000        	call	__mtCbCW
1573  002d 2003          	jra	L504
1574  002f               L304:
1575                     ; 528 		_mtCbCCW();
1577  002f cd0000        	call	__mtCbCCW
1579  0032               L504:
1580                     ; 530 	if( _mt_Cntl == 0 )
1582  0032 c60000        	ld	a,__mt_Cntl
1583  0035 2630          	jrne	L704
1584                     ; 532 		if( mt_getPt(__mt_id) == 0 && dir == 0 )
1586  0037 c6001b        	ld	a,___mt_id
1587  003a cd0000        	call	_mt_getPt
1589  003d 4d            	tnz	a
1590  003e 2621          	jrne	L114
1592  0040 7b01          	ld	a,(OFST+0,sp)
1593  0042 261d          	jrne	L114
1594                     ; 534 			_mo_count++;
1596  0044 725c0019      	inc	__mo_count
1597                     ; 535 			if( _mo_count == __mt_offset[__mt_id-1] )
1599  0048 5f            	clrw	x
1600  0049 c6001b        	ld	a,___mt_id
1601  004c 97            	ld	xl,a
1602  004d 5a            	decw	x
1603  004e d60003        	ld	a,(___mt_offset,x)
1604  0051 c10019        	cp	a,__mo_count
1605  0054 266d          	jrne	L714
1606                     ; 537 ErrorExit:			
1606                     ; 538 				__mt_closereset = 0;
1608  0056 725f0020      	clr	___mt_closereset
1609                     ; 539 				mt_clear(1);
1611  005a a601          	ld	a,#1
1612  005c cd0000        	call	_mt_clear
1614                     ; 540 				return;
1617  005f 84            	pop	a
1618  0060 81            	ret	
1619  0061               L114:
1620                     ; 544 			_mo_count = 0;
1622  0061 725f0019      	clr	__mo_count
1623  0065 205c          	jra	L714
1624  0067               L704:
1625                     ; 546 	else if( _mt_Cntl == 2 )
1627  0067 a102          	cp	a,#2
1628  0069 2658          	jrne	L714
1629                     ; 548 		if( mt_getPt(__mt_id) == 1 )
1631  006b c6001b        	ld	a,___mt_id
1632  006e cd0000        	call	_mt_getPt
1634  0071 4a            	dec	a
1635  0072 2636          	jrne	L324
1636                     ; 550 			mt_clear(1);
1638  0074 4c            	inc	a
1639  0075 cd0000        	call	_mt_clear
1641                     ; 557 			__mt_offset[__mt_id-1] = _mo_count;
1643  0078 ad73          	call	LC011
1644  007a c60019        	ld	a,__mo_count
1645  007d d70003        	ld	(___mt_offset,x),a
1646                     ; 563 			if( _mo_count > 64)			__mt_offset[__mt_id-1] -= 32+16;
1648  0080 a141          	cp	a,#65
1649  0082 2509          	jrult	L524
1652  0084 ad67          	call	LC011
1653  0086 d60003        	ld	a,(___mt_offset,x)
1654  0089 a030          	sub	a,#48
1656  008b 2018          	jp	LC010
1657  008d               L524:
1658                     ; 564 			else if( _mo_count > 32 )	__mt_offset[__mt_id-1] -= 16+8;
1660  008d a121          	cp	a,#33
1661  008f 2509          	jrult	L134
1664  0091 ad5a          	call	LC011
1665  0093 d60003        	ld	a,(___mt_offset,x)
1666  0096 a018          	sub	a,#24
1668  0098 200b          	jp	LC010
1669  009a               L134:
1670                     ; 565 			else if( _mo_count > 16 )	__mt_offset[__mt_id-1] -= 8+4;
1672  009a a111          	cp	a,#17
1673  009c 250a          	jrult	L724
1676  009e ad4d          	call	LC011
1677  00a0 d60003        	ld	a,(___mt_offset,x)
1678  00a3 a00c          	sub	a,#12
1679  00a5               LC010:
1680  00a5 d70003        	ld	(___mt_offset,x),a
1681  00a8               L724:
1682                     ; 568 			return;
1685  00a8 84            	pop	a
1686  00a9 81            	ret	
1687  00aa               L324:
1688                     ; 572 			_mo_count++;
1690  00aa 725c0019      	inc	__mo_count
1691                     ; 573 			if( _mo_count >= _MT_R_OFFSET )
1693  00ae c60019        	ld	a,__mo_count
1694  00b1 a196          	cp	a,#150
1695  00b3 250e          	jrult	L714
1696                     ; 576 				mt_clear(1);
1698  00b5 a601          	ld	a,#1
1699  00b7 cd0000        	call	_mt_clear
1701                     ; 577 				__mt_offset[__mt_id-1] = _MT_R_OFFSET;
1703  00ba ad31          	call	LC011
1704  00bc a696          	ld	a,#150
1705  00be d70003        	ld	(___mt_offset,x),a
1706                     ; 578 				return;
1709  00c1 84            	pop	a
1710  00c2 81            	ret	
1711  00c3               L714:
1712                     ; 583 	__mt_count16--;
1714  00c3 ce0017        	ldw	x,___mt_count16
1715  00c6 5a            	decw	x
1716  00c7 cf0017        	ldw	___mt_count16,x
1717                     ; 584 	if( __mt_count16 == 0 )
1719  00ca 261f          	jrne	L344
1720                     ; 586 		if( __mt_closeflag == 1 && __mt_closereset == 1 )
1722  00cc c6001f        	ld	a,___mt_closeflag
1723  00cf 4a            	dec	a
1724  00d0 2609          	jrne	L753
1726  00d2 c60020        	ld	a,___mt_closereset
1727  00d5 4a            	dec	a
1728  00d6 2603          	jrne	L753
1729                     ; 587 			mtCloseError();
1731  00d8 cd0000        	call	_mtCloseError
1733  00db               L753:
1734                     ; 588 Exit:		
1734                     ; 589 #ifdef _POWER_TEST_	
1734                     ; 590 		mtOverrun();
1734                     ; 591 #else
1734                     ; 592 		if( __mt_overrun == 1 )
1736  00db c60001        	ld	a,___mt_overrun
1737  00de 4a            	dec	a
1738  00df 2605          	jrne	L744
1739                     ; 593 			mtOverrun();
1741  00e1 cd0000        	call	_mtOverrun
1744  00e4 2005          	jra	L344
1745  00e6               L744:
1746                     ; 595 			mt_clear(1);
1748  00e6 a601          	ld	a,#1
1749  00e8 cd0000        	call	_mt_clear
1751  00eb               L344:
1752                     ; 598 }
1755  00eb 84            	pop	a
1756  00ec 81            	ret	
1757  00ed               LC011:
1758  00ed c6001b        	ld	a,___mt_id
1759  00f0 5f            	clrw	x
1760  00f1 97            	ld	xl,a
1761  00f2 5a            	decw	x
1762  00f3 81            	ret	
1765                     	switch	.data
1766  0026               __mc_i:
1767  0026 01            	dc.b	1
1768  0027               __mc_complete:
1769  0027 02            	dc.b	2
1770  0028               __mc_wait:
1771  0028 00            	dc.b	0
1793                     ; 604 uint8_t	mt_Ready(void)
1793                     ; 605 {
1794                     .text:	section	.text,new
1795  0000               _mt_Ready:
1799                     ; 606 	return _mc_complete == 0 ? 1 : 0;
1801  0000 c60027        	ld	a,__mc_complete
1802  0003 2602          	jrne	L471
1803  0005 4c            	inc	a
1805  0006 81            	ret	
1806  0007               L471:
1807  0007 4f            	clr	a
1810  0008 81            	ret	
1813                     	switch	.data
1814  0029               _mt_plc_mode:
1815  0029 64            	dc.b	100
1860                     ; 622 void	mtCalc(void)
1860                     ; 623 {
1861                     .text:	section	.text,new
1862  0000               _mtCalc:
1864  0000 88            	push	a
1865       00000001      OFST:	set	1
1868                     ; 666 MT_ENTRY:		
1868                     ; 667 	if( _mc_i == 1 )		
1870  0001 c60026        	ld	a,__mc_i
1871  0004 a101          	cp	a,#1
1872  0006 2642          	jrne	L305
1873                     ; 669 		_mt_Cntl = 0;
1875  0008 725f0000      	clr	__mt_Cntl
1876                     ; 670 		for( i=0; i<8+1; i++ )
1878  000c 4f            	clr	a
1879  000d 6b01          	ld	(OFST+0,sp),a
1880  000f               L505:
1881                     ; 671 			__mt_offset[i] = _MT_R_OFFSET;
1883  000f 5f            	clrw	x
1884  0010 97            	ld	xl,a
1885  0011 a696          	ld	a,#150
1886  0013 d70003        	ld	(___mt_offset,x),a
1887                     ; 670 		for( i=0; i<8+1; i++ )
1889  0016 0c01          	inc	(OFST+0,sp)
1892  0018 7b01          	ld	a,(OFST+0,sp)
1893  001a a109          	cp	a,#9
1894  001c 25f1          	jrult	L505
1895                     ; 673 		i = (cntGetType() == 0 ) ? funcInfo.valve : funcInfo2.valve;
1897  001e cd0000        	call	_cntGetType
1899  0021 4d            	tnz	a
1900  0022 2605          	jrne	L202
1901  0024 c6000d        	ld	a,_funcInfo+13
1902  0027 2003          	jra	L602
1903  0029               L202:
1904  0029 c6000d        	ld	a,_funcInfo2+13
1905  002c               L602:
1906  002c 6b01          	ld	(OFST+0,sp),a
1907                     ; 675 		if( i == 0 )
1909  002e 2603cc0106    	jreq	L564
1910                     ; 676 			goto MT_INIT_COMPLETE_ENTRY;
1912                     ; 678 		MT_NEXT(2);	
1914  0033 cd01e9        	call	LC013
1915  0036 89            	pushw	x
1916  0037 5f            	clrw	x
1917  0038 c60026        	ld	a,__mc_i
1918  003b 95            	ld	xh,a
1919  003c cd0000        	call	_mt_run
1921  003f 35630026      	mov	__mc_i,#99
1922  0043 35020027      	mov	__mc_complete,#2
1929  0047 cc01e6        	jp	LC012
1930  004a               L305:
1931                     ; 680 	else if( _mc_i == 2 )	{	MT_NEXT(3);	}
1933  004a a102          	cp	a,#2
1934  004c 2614          	jrne	L715
1937  004e cd01e9        	call	LC013
1938  0051 89            	pushw	x
1939  0052 5f            	clrw	x
1940  0053 95            	ld	xh,a
1941  0054 cd0000        	call	_mt_run
1943  0057 35630026      	mov	__mc_i,#99
1944  005b 35030027      	mov	__mc_complete,#3
1951  005f cc01e6        	jp	LC012
1952  0062               L715:
1953                     ; 681 	else if( _mc_i == 3 )	{	MT_NEXT(4);	}
1955  0062 a103          	cp	a,#3
1956  0064 2614          	jrne	L325
1959  0066 cd01e9        	call	LC013
1960  0069 89            	pushw	x
1961  006a 5f            	clrw	x
1962  006b 95            	ld	xh,a
1963  006c cd0000        	call	_mt_run
1965  006f 35630026      	mov	__mc_i,#99
1966  0073 35040027      	mov	__mc_complete,#4
1973  0077 cc01e6        	jp	LC012
1974  007a               L325:
1975                     ; 682 	else if( _mc_i == 4 )	{	MT_NEXT(5);	}
1977  007a a104          	cp	a,#4
1978  007c 2614          	jrne	L725
1981  007e cd01e9        	call	LC013
1982  0081 89            	pushw	x
1983  0082 5f            	clrw	x
1984  0083 95            	ld	xh,a
1985  0084 cd0000        	call	_mt_run
1987  0087 35630026      	mov	__mc_i,#99
1988  008b 35050027      	mov	__mc_complete,#5
1995  008f cc01e6        	jp	LC012
1996  0092               L725:
1997                     ; 683 	else if( _mc_i == 5 )	{	MT_NEXT(6);	}
1999  0092 a105          	cp	a,#5
2000  0094 2614          	jrne	L335
2003  0096 cd01e9        	call	LC013
2004  0099 89            	pushw	x
2005  009a 5f            	clrw	x
2006  009b 95            	ld	xh,a
2007  009c cd0000        	call	_mt_run
2009  009f 35630026      	mov	__mc_i,#99
2010  00a3 35060027      	mov	__mc_complete,#6
2017  00a7 cc01e6        	jp	LC012
2018  00aa               L335:
2019                     ; 684 	else if( _mc_i == 6 )	{	MT_NEXT(7);	}
2021  00aa a106          	cp	a,#6
2022  00ac 2614          	jrne	L735
2025  00ae cd01e9        	call	LC013
2026  00b1 89            	pushw	x
2027  00b2 5f            	clrw	x
2028  00b3 95            	ld	xh,a
2029  00b4 cd0000        	call	_mt_run
2031  00b7 35630026      	mov	__mc_i,#99
2032  00bb 35070027      	mov	__mc_complete,#7
2039  00bf cc01e6        	jp	LC012
2040  00c2               L735:
2041                     ; 685 	else if( _mc_i == 7 )	{	MT_NEXT(8);	}
2043  00c2 a107          	cp	a,#7
2044  00c4 2614          	jrne	L345
2047  00c6 cd01e9        	call	LC013
2048  00c9 89            	pushw	x
2049  00ca 5f            	clrw	x
2050  00cb 95            	ld	xh,a
2051  00cc cd0000        	call	_mt_run
2053  00cf 35630026      	mov	__mc_i,#99
2054  00d3 35080027      	mov	__mc_complete,#8
2061  00d7 cc01e6        	jp	LC012
2062  00da               L345:
2063                     ; 686 	else if( _mc_i == 8 )	{	MT_NEXT(100);	}
2065  00da a108          	cp	a,#8
2066  00dc 2614          	jrne	L745
2069  00de cd01e9        	call	LC013
2070  00e1 89            	pushw	x
2071  00e2 5f            	clrw	x
2072  00e3 95            	ld	xh,a
2073  00e4 cd0000        	call	_mt_run
2075  00e7 35630026      	mov	__mc_i,#99
2076  00eb 35640027      	mov	__mc_complete,#100
2083  00ef cc01e6        	jp	LC012
2084  00f2               L745:
2085                     ; 690 	else if( _mc_i == 99 )
2087  00f2 a163          	cp	a,#99
2088  00f4 260c          	jrne	L355
2089                     ; 692 		_mc_wait = __timer1s;
2091  00f6 5500000028    	mov	__mc_wait,___timer1s
2092                     ; 693 		_mc_i = 101;
2094  00fb 35650026      	mov	__mc_i,#101
2096  00ff cc01e7        	jra	L515
2097  0102               L355:
2098                     ; 695 	else if( _mc_i == 100 )
2100  0102 a164          	cp	a,#100
2101  0104 2613          	jrne	L755
2102  0106               L564:
2103                     ; 697 MT_INIT_COMPLETE_ENTRY:
2103                     ; 698 		_mc_i = 100;
2105  0106 35640026      	mov	__mc_i,#100
2106                     ; 699 		if( vtbl.ii[1] != 0 )
2108  010a 725d0081      	tnz	_vtbl+129
2109                     ; 702 		_mc_complete = 0;
2111  010e 725f0027      	clr	__mc_complete
2112                     ; 703 		_mt_Cntl = 0;
2114  0112 725f0000      	clr	__mt_Cntl
2116  0116 cc01e7        	jra	L515
2117  0119               L755:
2118                     ; 705 	else if( _mc_i == 101 )
2120  0119 a165          	cp	a,#101
2121  011b 2621          	jrne	L565
2122                     ; 707 		if( __mt_enable == 1 )
2124  011d c6001a        	ld	a,___mt_enable
2125  0120 4a            	dec	a
2126  0121 2602          	jrne	L765
2127                     ; 708 			return;
2130  0123 84            	pop	a
2131  0124 81            	ret	
2132  0125               L765:
2133                     ; 711 		_mt_Cntl = 2;
2135  0125 35020000      	mov	__mt_Cntl,#2
2136                     ; 712 		mt_run(__mt_id, 1, _MT_R_OFFSET);
2138  0129 ae0096        	ldw	x,#150
2139  012c 89            	pushw	x
2140  012d ae0001        	ldw	x,#1
2141  0130 c6001b        	ld	a,___mt_id
2142  0133 95            	ld	xh,a
2143  0134 cd0000        	call	_mt_run
2145  0137 35680026      	mov	__mc_i,#104
2146                     ; 713 		_mc_i = 104;
2149  013b cc01e6        	jp	LC012
2150  013e               L565:
2151                     ; 715 	else if( _mc_i == 102 )
2153  013e a166          	cp	a,#102
2154  0140 2664          	jrne	L375
2155                     ; 717 		if( _mc_wait == __timer1s )
2157  0142 c60028        	ld	a,__mc_wait
2158  0145 c10000        	cp	a,___timer1s
2159  0148 2602          	jrne	L575
2160                     ; 718 			return;
2163  014a 84            	pop	a
2164  014b 81            	ret	
2165  014c               L575:
2166                     ; 720 		if( __mt_enable != 0 )
2168  014c c6001a        	ld	a,___mt_enable
2169  014f 2702          	jreq	L775
2170                     ; 721 			return;
2173  0151 84            	pop	a
2174  0152 81            	ret	
2175  0153               L775:
2176                     ; 723 		_mc_i = _mc_complete;
2178  0153 5500270026    	mov	__mc_i,__mc_complete
2179                     ; 724 		i = 1;
2181  0158 4c            	inc	a
2182  0159 6b01          	ld	(OFST+0,sp),a
2183                     ; 725 		if( cntGetType() == 0 )
2185  015b cd0000        	call	_cntGetType
2187  015e 4d            	tnz	a
2188  015f 261a          	jrne	L106
2189                     ; 727 			if( vtbl.cntlMode == 0 )
2191  0161 c6009c        	ld	a,_vtbl+156
2192  0164 260e          	jrne	L306
2193                     ; 729 				if( funcInfo.lpmType != 0 )
2195  0166 c6000c        	ld	a,_funcInfo+12
2196  0169 2709          	jreq	L306
2197                     ; 732 					if( funcInfo.boiler_type == 0 )
2199  016b c60005        	ld	a,_funcInfo+5
2200  016e 2604          	jrne	L306
2201                     ; 733 						i = 2;
2203  0170 a602          	ld	a,#2
2204  0172 6b01          	ld	(OFST+0,sp),a
2205  0174               L306:
2206                     ; 736 			i = funcInfo.valve+i;
2208  0174 7b01          	ld	a,(OFST+0,sp)
2209  0176 cb000d        	add	a,_funcInfo+13
2211  0179 201c          	jra	L116
2212  017b               L106:
2213                     ; 740 			if( vtbl.cntlMode == 0 )
2215  017b c6009c        	ld	a,_vtbl+156
2216  017e 2612          	jrne	L316
2217                     ; 742 				if( funcInfo2.lpmType != 0 && CNTL_LPM_SUB )
2219  0180 c6000c        	ld	a,_funcInfo2+12
2220  0183 270d          	jreq	L316
2222  0185 a107          	cp	a,#7
2223  0187 2709          	jreq	L316
2224                     ; 744 					if( funcInfo2.boiler_type == 0 )
2226  0189 c60005        	ld	a,_funcInfo2+5
2227  018c 2604          	jrne	L316
2228                     ; 745 						i = 2;
2230  018e a602          	ld	a,#2
2231  0190 6b01          	ld	(OFST+0,sp),a
2232  0192               L316:
2233                     ; 748 			i = funcInfo2.valve+i;
2235  0192 7b01          	ld	a,(OFST+0,sp)
2236  0194 cb000d        	add	a,_funcInfo2+13
2237  0197               L116:
2238  0197 6b01          	ld	(OFST+0,sp),a
2239                     ; 750 		if( _mc_i == i )
2241  0199 c60026        	ld	a,__mc_i
2242  019c 1101          	cp	a,(OFST+0,sp)
2243  019e 2647          	jrne	L515
2244                     ; 751 			_mc_i = 100;
2246  01a0 35640026      	mov	__mc_i,#100
2247  01a4 2041          	jra	L515
2248  01a6               L375:
2249                     ; 753 	else if( _mc_i == 103 )
2251  01a6 a167          	cp	a,#103
2252  01a8 2617          	jrne	L526
2253                     ; 755 		if( __mt_enable == 1 )
2255  01aa c6001a        	ld	a,___mt_enable
2256  01ad 4a            	dec	a
2257  01ae 2602          	jrne	L726
2258                     ; 756 			return;
2261  01b0 84            	pop	a
2262  01b1 81            	ret	
2263  01b2               L726:
2264                     ; 758 		_mt_Cntl = 0;
2266  01b2 725f0000      	clr	__mt_Cntl
2267                     ; 759 		_mc_wait = __timer1s;
2269  01b6 5500000028    	mov	__mc_wait,___timer1s
2270                     ; 760 		_mc_i = 102;
2272  01bb 35660026      	mov	__mc_i,#102
2274  01bf 2026          	jra	L515
2275  01c1               L526:
2276                     ; 762 	else if( _mc_i == 104 )
2278  01c1 a168          	cp	a,#104
2279  01c3 2622          	jrne	L515
2280                     ; 764 		if( __mt_enable == 1 )
2282  01c5 c6001a        	ld	a,___mt_enable
2283  01c8 4a            	dec	a
2284  01c9 2602          	jrne	L536
2285                     ; 765 			return;
2288  01cb 84            	pop	a
2289  01cc 81            	ret	
2290  01cd               L536:
2291                     ; 767 		mt_run(__mt_id, 0, _MT_R_OFFSET);
2293  01cd ae0096        	ldw	x,#150
2294  01d0 89            	pushw	x
2295  01d1 5f            	clrw	x
2296  01d2 c6001b        	ld	a,___mt_id
2297  01d5 95            	ld	xh,a
2298  01d6 cd0000        	call	_mt_run
2300  01d9 5500000028    	mov	__mc_wait,___timer1s
2301  01de 725f0000      	clr	__mt_Cntl
2302  01e2 35660026      	mov	__mc_i,#102
2303  01e6               LC012:
2304  01e6 85            	popw	x
2305                     ; 768 		_mc_wait = __timer1s;
2307                     ; 769 		_mt_Cntl = 0;
2309                     ; 770 		_mc_i = 102;
2311  01e7               L515:
2312                     ; 772 }
2315  01e7 84            	pop	a
2316  01e8 81            	ret	
2317  01e9               LC013:
2318  01e9 3501001f      	mov	___mt_closeflag,#1
2319                     ; 686 	else if( _mc_i == 8 )	{	MT_NEXT(100);	}
2321  01ed 35010020      	mov	___mt_closereset,#1
2324  01f1 ae0af0        	ldw	x,#2800
2325  01f4 81            	ret	
2559                     	xdef	_mt_plc_mode
2560                     	xdef	__mc_wait
2561                     	xdef	__mc_complete
2562                     	xdef	__mc_i
2563                     	xdef	___mt_power_mode
2564                     	xdef	___mt_power
2565                     	xdef	_mtCloseError
2566                     	xdef	_mtOverrun
2567                     	xdef	_mt_getPt
2568                     	xdef	__mtCbCCW
2569                     	xdef	__mtCbCW
2570                     	xdef	___mt_wait_init
2571                     	xdef	___mt_type_flag
2572                     	xdef	___mt_closereset
2573                     	xdef	___mt_closeflag
2574                     	switch	.bss
2575  0000               ___mt_overrunCount:
2576  0000 00            	ds.b	1
2577                     	xdef	___mt_overrunCount
2578  0001               ___mt_overrun:
2579  0001 00            	ds.b	1
2580                     	xdef	___mt_overrun
2581                     	xdef	___mt_side
2582  0002               ___mt_k:
2583  0002 00            	ds.b	1
2584                     	xdef	___mt_k
2585                     	xdef	___mt_dir
2586                     	xdef	___mt_i
2587                     	xdef	___mt_id
2588                     	xdef	__mo_count
2589                     	xdef	___mt_count16
2590                     	xdef	_mt_init
2591                     	xref	__mtCount
2592  0003               ___mt_offset:
2593  0003 000000000000  	ds.b	9
2594                     	xdef	___mt_offset
2595                     	xdef	__qq
2596  000c               __qqq:
2597  000c 00            	ds.b	1
2598                     	xdef	__qqq
2599                     	xdef	__mt_p2
2600                     	xdef	__mt_p1
2601                     	xdef	__mt_pwm
2602                     	xdef	__mt_s_rev
2603                     	xdef	__mt_s
2604                     	xdef	__mt_Cntl
2605                     	xref	_cntGetType
2606                     	xref	_funcInfo2
2607                     	xref	_funcInfo
2608                     	xref	_vtbl
2609                     	xdef	_mt_Ready
2610                     	xdef	_mt_clear
2611                     	xdef	_mt_run
2612                     	xdef	___mt_closeError
2613                     	xdef	___mt_enable
2614                     	xref	___timer1s
2615                     	xdef	_mtCalc
2616                     	xdef	__mtCb
2617                     	xref	_GPIO_ReadInputPin
2618                     	xref	_GPIO_Init
2619                     	xref.b	c_lreg
2620                     	xref.b	c_x
2621                     	xref.b	c_y
2641                     	xref	c_lursh
2642                     	xref	c_ltor
2643                     	xref	c_rtol
2644                     	xref	c_umul
2645                     	end
