   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     	switch	.data
  24  0000               _hn_error_checksum:
  25  0000 00            	dc.b	0
  26  0001               _hn_buf_count:
  27  0001 00            	dc.b	0
  79                     ; 16 uint8_t getHexToBin(uint8_t hex, uint8_t idx)
  79                     ; 17 {
  81                     .text:	section	.text,new
  82  0000               _getHexToBin:
  84  0000 89            	pushw	x
  85  0001 88            	push	a
  86       00000001      OFST:	set	1
  89                     ; 18 	uint8_t p = 0x80;
  91                     ; 19 	p = p >> (0x08 - (idx + 0x01));
  93  0002 9f            	ld	a,xl
  94  0003 a007          	sub	a,#7
  95  0005 40            	neg	a
  96  0006 5f            	clrw	x
  97  0007 97            	ld	xl,a
  98  0008 a680          	ld	a,#128
  99  000a 5d            	tnzw	x
 100  000b 2704          	jreq	L6
 101  000d               L01:
 102  000d 44            	srl	a
 103  000e 5a            	decw	x
 104  000f 26fc          	jrne	L01
 105  0011               L6:
 106  0011 6b01          	ld	(OFST+0,sp),a
 107                     ; 21 	if (hex & p)
 109  0013 7b02          	ld	a,(OFST+1,sp)
 110  0015 1501          	bcp	a,(OFST+0,sp)
 111  0017 2704          	jreq	L13
 112                     ; 23 		return 1;
 114  0019 a601          	ld	a,#1
 116  001b 2001          	jra	L21
 117  001d               L13:
 118                     ; 27 		return 0;
 120  001d 4f            	clr	a
 122  001e               L21:
 124  001e 5b03          	addw	sp,#3
 125  0020 81            	ret	
 158                     ; 31 uint8_t hn_make_errorCode(void) {
 159                     .text:	section	.text,new
 160  0000               _hn_make_errorCode:
 162  0000 88            	push	a
 163       00000001      OFST:	set	1
 166                     ; 32 	uint8_t code = 0;
 168  0001 0f01          	clr	(OFST+0,sp)
 169                     ; 34 	if (funcInfo.error != 0x00) {
 171  0003 c60008        	ld	a,_funcInfo+8
 172  0006 2727          	jreq	L36
 173                     ; 35 		switch(funcInfo.error_type) {
 175  0008 c60009        	ld	a,_funcInfo+9
 177                     ; 50 				break;
 178  000b 4a            	dec	a
 179  000c 270e          	jreq	L53
 180  000e 4a            	dec	a
 181  000f 270f          	jreq	L73
 182  0011 4a            	dec	a
 183  0012 2710          	jreq	L14
 184  0014 4a            	dec	a
 185  0015 2711          	jreq	L34
 186  0017 4a            	dec	a
 187  0018 2711          	jreq	L54
 188  001a 2013          	jra	L36
 189  001c               L53:
 190                     ; 36 			case ERROR_TYPE_BOILER:
 190                     ; 37 				code = 0x23;
 192  001c a623          	ld	a,#35
 193                     ; 38 				break;
 195  001e 200d          	jp	LC001
 196  0020               L73:
 197                     ; 39 			case ERROR_TYPE_CNT:
 197                     ; 40 				code = 0x60;
 199  0020 a660          	ld	a,#96
 200                     ; 41 				break;
 202  0022 2009          	jp	LC001
 203  0024               L14:
 204                     ; 42 			case ERROR_TYPE_RC:
 204                     ; 43 				code = 0x50;
 206  0024 a650          	ld	a,#80
 207                     ; 44 				break;
 209  0026 2005          	jp	LC001
 210  0028               L34:
 211                     ; 45 			case ERROR_TYPE_HN:
 211                     ; 46 				code = 0xFF;
 213  0028 4a            	dec	a
 214                     ; 47 				break;
 216  0029 2002          	jp	LC001
 217  002b               L54:
 218                     ; 48 			case ERROR_TYPE_EEPROM:
 218                     ; 49 				code = 0x70;
 220  002b a670          	ld	a,#112
 221  002d               LC001:
 222  002d 6b01          	ld	(OFST+0,sp),a
 223                     ; 50 				break;
 225  002f               L36:
 226                     ; 54 	return code;
 228  002f 7b01          	ld	a,(OFST+0,sp)
 231  0031 5b01          	addw	sp,#1
 232  0033 81            	ret	
 271                     ; 57 uint8_t getHax(uint8_t num) {
 272                     .text:	section	.text,new
 273  0000               _getHax:
 275  0000 88            	push	a
 276       00000001      OFST:	set	1
 279                     ; 60 	hax = num;
 281  0001 6b01          	ld	(OFST+0,sp),a
 282                     ; 61 	switch (num) {
 285                     ; 79 			break;
 286  0003 a00a          	sub	a,#10
 287  0005 2713          	jreq	L17
 288  0007 4a            	dec	a
 289  0008 2714          	jreq	L37
 290  000a 4a            	dec	a
 291  000b 2715          	jreq	L57
 292  000d 4a            	dec	a
 293  000e 2716          	jreq	L77
 294  0010 4a            	dec	a
 295  0011 2717          	jreq	L101
 296  0013 4a            	dec	a
 297  0014 2718          	jreq	L301
 298  0016 7b01          	ld	a,(OFST+0,sp)
 299  0018 2016          	jra	LC002
 300  001a               L17:
 301                     ; 62 		case 10:
 301                     ; 63 			hax = 0x0A;
 303  001a a60a          	ld	a,#10
 304                     ; 64 			break;
 306  001c 2012          	jp	LC002
 307  001e               L37:
 308                     ; 65 		case 11:
 308                     ; 66 			hax = 0x0B;
 310  001e a60b          	ld	a,#11
 311                     ; 67 			break;
 313  0020 200e          	jp	LC002
 314  0022               L57:
 315                     ; 68 		case 12:
 315                     ; 69 			hax = 0x0C;
 317  0022 a60c          	ld	a,#12
 318                     ; 70 			break;
 320  0024 200a          	jp	LC002
 321  0026               L77:
 322                     ; 71 		case 13:
 322                     ; 72 			hax = 0x0D;
 324  0026 a60d          	ld	a,#13
 325                     ; 73 			break;
 327  0028 2006          	jp	LC002
 328  002a               L101:
 329                     ; 74 		case 14:
 329                     ; 75 			hax = 0x0E;
 331  002a a60e          	ld	a,#14
 332                     ; 76 			break;
 334  002c 2002          	jp	LC002
 335  002e               L301:
 336                     ; 77 		case 15:
 336                     ; 78 			hax = 0x0F;
 338  002e a60f          	ld	a,#15
 339  0030               LC002:
 340                     ; 79 			break;
 342                     ; 82 	return hax;
 346  0030 5b01          	addw	sp,#1
 347  0032 81            	ret	
 394                     ; 85 uint8_t hn_ptc_10To16(uint8_t val) {
 395                     .text:	section	.text,new
 396  0000               _hn_ptc_10To16:
 398  0000 88            	push	a
 399  0001 89            	pushw	x
 400       00000002      OFST:	set	2
 403                     ; 86 	uint8_t n = getHax(val / 16) << 4;
 405  0002 5f            	clrw	x
 406  0003 97            	ld	xl,a
 407  0004 57            	sraw	x
 408  0005 57            	sraw	x
 409  0006 57            	sraw	x
 410  0007 57            	sraw	x
 411  0008 9f            	ld	a,xl
 412  0009 cd0000        	call	_getHax
 414  000c 97            	ld	xl,a
 415  000d a610          	ld	a,#16
 416  000f 42            	mul	x,a
 417  0010 9f            	ld	a,xl
 418  0011 6b01          	ld	(OFST-1,sp),a
 419                     ; 87 	uint8_t m = getHax(val % 16);
 421  0013 7b03          	ld	a,(OFST+1,sp)
 422  0015 a40f          	and	a,#15
 423  0017 cd0000        	call	_getHax
 425  001a 6b02          	ld	(OFST+0,sp),a
 426                     ; 88 	return n | m;
 428  001c 1a01          	or	a,(OFST-1,sp)
 431  001e 5b03          	addw	sp,#3
 432  0020 81            	ret	
 464                     ; 91 uint8_t hn_ptc_16To10(uint8_t val) {
 465                     .text:	section	.text,new
 466  0000               _hn_ptc_16To10:
 468  0000 88            	push	a
 469  0001 88            	push	a
 470       00000001      OFST:	set	1
 473                     ; 92 	return (((val & 0xF0) >> 4 ) * 10 + (val & 0x0F));
 475  0002 a40f          	and	a,#15
 476  0004 6b01          	ld	(OFST+0,sp),a
 477  0006 7b02          	ld	a,(OFST+1,sp)
 478  0008 4e            	swap	a
 479  0009 a40f          	and	a,#15
 480  000b 97            	ld	xl,a
 481  000c a60a          	ld	a,#10
 482  000e 42            	mul	x,a
 483  000f 9f            	ld	a,xl
 484  0010 1b01          	add	a,(OFST+0,sp)
 487  0012 85            	popw	x
 488  0013 81            	ret	
 541                     	xdef	_getHax
 542                     	xref	_funcInfo
 543                     	xdef	_hn_ptc_16To10
 544                     	xdef	_hn_ptc_10To16
 545                     	xdef	_hn_make_errorCode
 546                     	xdef	_getHexToBin
 547                     	xdef	_hn_buf_count
 548                     	switch	.bss
 549  0000               _hn_buf_error:
 550  0000 000000000000  	ds.b	15
 551                     	xdef	_hn_buf_error
 552                     	xdef	_hn_error_checksum
 553  000f               _hn_type:
 554  000f 00            	ds.b	1
 555                     	xdef	_hn_type
 556  0010               _hn_connect:
 557  0010 00            	ds.b	1
 558                     	xdef	_hn_connect
 578                     	end
