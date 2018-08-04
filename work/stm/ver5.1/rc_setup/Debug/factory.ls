   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  19                     	switch	.data
  20  0000               __fs:
  21  0000 00            	dc.b	0
  22  0001               __fs2:
  23  0001 00            	dc.b	0
  77                     ; 78 void	factory2wire(void)
  77                     ; 79 {
  79                     .text:	section	.text,new
  80  0000               _factory2wire:
  82  0000 5203          	subw	sp,#3
  83       00000003      OFST:	set	3
  86                     ; 82 	if( _io_head != _io_tail )
  88  0002 c60000        	ld	a,__io_head
  89  0005 c10000        	cp	a,__io_tail
  90  0008 2744          	jreq	L13
  91                     ; 84 		i = iouart_Ready();
  93  000a cd0000        	call	_iouart_Ready
  95  000d 6b01          	ld	(OFST-2,sp),a
  96                     ; 85 		if( i==1 )
  98  000f 7b01          	ld	a,(OFST-2,sp)
  99  0011 a101          	cp	a,#1
 100  0013 2639          	jrne	L13
 101                     ; 87 			p = iouart_getBuffer();
 103  0015 cd0000        	call	_iouart_getBuffer
 105  0018 1f02          	ldw	(OFST-1,sp),x
 106                     ; 88 			p[0] = 0x0;
 108  001a 1e02          	ldw	x,(OFST-1,sp)
 109  001c 7f            	clr	(x)
 110                     ; 89 			p[1] = 0x1;
 112  001d 1e02          	ldw	x,(OFST-1,sp)
 113  001f a601          	ld	a,#1
 114  0021 e701          	ld	(1,x),a
 115                     ; 90 			p[2] = 0x2;
 117  0023 1e02          	ldw	x,(OFST-1,sp)
 118  0025 a602          	ld	a,#2
 119  0027 e702          	ld	(2,x),a
 120                     ; 91 			p[3] = 0x3;
 122  0029 1e02          	ldw	x,(OFST-1,sp)
 123  002b a603          	ld	a,#3
 124  002d e703          	ld	(3,x),a
 125                     ; 92 			p[4] = 0x4;
 127  002f 1e02          	ldw	x,(OFST-1,sp)
 128  0031 a604          	ld	a,#4
 129  0033 e704          	ld	(4,x),a
 130                     ; 93 			p[5] = 0x5;
 132  0035 1e02          	ldw	x,(OFST-1,sp)
 133  0037 a605          	ld	a,#5
 134  0039 e705          	ld	(5,x),a
 135                     ; 94 			p[6] = 0x6;
 137  003b 1e02          	ldw	x,(OFST-1,sp)
 138  003d a606          	ld	a,#6
 139  003f e706          	ld	(6,x),a
 140                     ; 95 			p[7] = 0x15;
 142  0041 1e02          	ldw	x,(OFST-1,sp)
 143  0043 a615          	ld	a,#21
 144  0045 e707          	ld	(7,x),a
 145                     ; 96 			iouart_Set_Packet(0);
 147  0047 4f            	clr	a
 148  0048 cd0000        	call	_iouart_Set_Packet
 150                     ; 97 			iouart_Pkt_Start();
 152  004b cd0000        	call	_iouart_Pkt_Start
 154  004e               L13:
 155                     ; 132 }
 158  004e 5b03          	addw	sp,#3
 159  0050 81            	ret
 162                     	switch	.data
 163  0002               ___enc:
 164  0002 01            	dc.b	1
 165  0003               ___lcd:
 166  0003 00            	dc.b	0
 167  0004               ___lcdi:
 168  0004 00            	dc.b	0
 220                     ; 450 void	factoryRC(void)
 220                     ; 451 {
 221                     .text:	section	.text,new
 222  0000               _factoryRC:
 224  0000 88            	push	a
 225       00000001      OFST:	set	1
 228                     ; 459 	if( _fs == 0 )
 230  0001 725d0000      	tnz	__fs
 231  0005 2614          	jrne	L35
 232                     ; 461 		_fs = 1;
 234  0007 35010000      	mov	__fs,#1
 235                     ; 462 		__f[0] = __timer1s;
 237  000b 5500000000    	mov	___f,___timer1s
 238                     ; 463 		D_IO_LOW(D_LED_PORT, D_LED_PIN);
 240  0010 7211500a      	bres	20490,#0
 241                     ; 465 		lcd_disp_all();
 243  0014 cd0000        	call	_lcd_disp_all
 246  0017 ac240124      	jpf	L55
 247  001b               L35:
 248                     ; 467 	else if( _fs == 1 )
 250  001b c60000        	ld	a,__fs
 251  001e a101          	cp	a,#1
 252  0020 2672          	jrne	L75
 253                     ; 469 		key = key_ready();
 255  0022 cd0000        	call	_key_ready
 257  0025 6b01          	ld	(OFST+0,sp),a
 258                     ; 470 		if( key != 0 )
 260  0027 0d01          	tnz	(OFST+0,sp)
 261  0029 2603          	jrne	L01
 262  002b cc0124        	jp	L55
 263  002e               L01:
 264                     ; 472 			if( (key & 0x80) != 0 )
 266  002e 7b01          	ld	a,(OFST+0,sp)
 267  0030 a580          	bcp	a,#128
 268  0032 272d          	jreq	L36
 269                     ; 474 				_fs = 14;
 271  0034 350e0000      	mov	__fs,#14
 272                     ; 475 				if( (key&0x40) == 0 )
 274  0038 7b01          	ld	a,(OFST+0,sp)
 275  003a a540          	bcp	a,#64
 276  003c 2606          	jrne	L56
 277                     ; 476 					__enc--;
 279  003e 725a0002      	dec	___enc
 281  0042 2004          	jra	L76
 282  0044               L56:
 283                     ; 478 					__enc++;
 285  0044 725c0002      	inc	___enc
 286  0048               L76:
 287                     ; 479 				if( __enc == 0 )		__enc = 8;
 289  0048 725d0002      	tnz	___enc
 290  004c 2606          	jrne	L17
 293  004e 35080002      	mov	___enc,#8
 295  0052 200b          	jra	L37
 296  0054               L17:
 297                     ; 480 				else if( __enc == 9 )	__enc = 1;
 299  0054 c60002        	ld	a,___enc
 300  0057 a109          	cp	a,#9
 301  0059 2604          	jrne	L37
 304  005b 35010002      	mov	___enc,#1
 305  005f               L37:
 306                     ; 481 				return;
 309  005f 84            	pop	a
 310  0060 81            	ret
 311  0061               L36:
 312                     ; 483 			lcd_clear(0);
 314  0061 4f            	clr	a
 315  0062 cd0000        	call	_lcd_clear
 317                     ; 484 			if( key == 1 )	_fs = 10;
 319  0065 7b01          	ld	a,(OFST+0,sp)
 320  0067 a101          	cp	a,#1
 321  0069 2604          	jrne	L77
 324  006b 350a0000      	mov	__fs,#10
 325  006f               L77:
 326                     ; 485 			if( key == 2 )	_fs = 11;
 328  006f 7b01          	ld	a,(OFST+0,sp)
 329  0071 a102          	cp	a,#2
 330  0073 2604          	jrne	L101
 333  0075 350b0000      	mov	__fs,#11
 334  0079               L101:
 335                     ; 486 			if( key == 3 )	_fs = 12;
 337  0079 7b01          	ld	a,(OFST+0,sp)
 338  007b a103          	cp	a,#3
 339  007d 2604          	jrne	L301
 342  007f 350c0000      	mov	__fs,#12
 343  0083               L301:
 344                     ; 487 			if( key == 4 )	_fs = 13;
 346  0083 7b01          	ld	a,(OFST+0,sp)
 347  0085 a104          	cp	a,#4
 348  0087 2703          	jreq	L21
 349  0089 cc0124        	jp	L55
 350  008c               L21:
 353  008c 350d0000      	mov	__fs,#13
 354  0090 ac240124      	jpf	L55
 355  0094               L75:
 356                     ; 491 	else if( _fs == 2 )
 358  0094 c60000        	ld	a,__fs
 359  0097 a102          	cp	a,#2
 360  0099 2607          	jrne	L111
 361                     ; 493 		_fs = 1;
 363  009b 35010000      	mov	__fs,#1
 365  009f cc0124        	jra	L55
 366  00a2               L111:
 367                     ; 495 	else if( _fs == 10 )
 369  00a2 c60000        	ld	a,__fs
 370  00a5 a10a          	cp	a,#10
 371  00a7 2612          	jrne	L511
 372                     ; 497 		lcd_disp_n(0, 1);
 374  00a9 ae0001        	ldw	x,#1
 375  00ac cd0000        	call	_lcd_disp_n
 377                     ; 498 		lcd_disp_n(1, 1);
 379  00af ae0101        	ldw	x,#257
 380  00b2 cd0000        	call	_lcd_disp_n
 382                     ; 499 		_fs = 2;
 384  00b5 35020000      	mov	__fs,#2
 386  00b9 2069          	jra	L55
 387  00bb               L511:
 388                     ; 501 	else if( _fs == 11 )
 390  00bb c60000        	ld	a,__fs
 391  00be a10b          	cp	a,#11
 392  00c0 2612          	jrne	L121
 393                     ; 503 		lcd_disp_n(0, 2);
 395  00c2 ae0002        	ldw	x,#2
 396  00c5 cd0000        	call	_lcd_disp_n
 398                     ; 504 		lcd_disp_n(1, 2);
 400  00c8 ae0102        	ldw	x,#258
 401  00cb cd0000        	call	_lcd_disp_n
 403                     ; 505 		_fs = 2;
 405  00ce 35020000      	mov	__fs,#2
 407  00d2 2050          	jra	L55
 408  00d4               L121:
 409                     ; 507 	else if( _fs == 12 )
 411  00d4 c60000        	ld	a,__fs
 412  00d7 a10c          	cp	a,#12
 413  00d9 2612          	jrne	L521
 414                     ; 509 		lcd_disp_n(0, 3);
 416  00db ae0003        	ldw	x,#3
 417  00de cd0000        	call	_lcd_disp_n
 419                     ; 510 		lcd_disp_n(1, 3);
 421  00e1 ae0103        	ldw	x,#259
 422  00e4 cd0000        	call	_lcd_disp_n
 424                     ; 511 		_fs = 2;
 426  00e7 35020000      	mov	__fs,#2
 428  00eb 2037          	jra	L55
 429  00ed               L521:
 430                     ; 513 	else if( _fs == 13 )
 432  00ed c60000        	ld	a,__fs
 433  00f0 a10d          	cp	a,#13
 434  00f2 2612          	jrne	L131
 435                     ; 515 		lcd_disp_n(0, 4);
 437  00f4 ae0004        	ldw	x,#4
 438  00f7 cd0000        	call	_lcd_disp_n
 440                     ; 516 		lcd_disp_n(1, 4);
 442  00fa ae0104        	ldw	x,#260
 443  00fd cd0000        	call	_lcd_disp_n
 445                     ; 517 		_fs = 2;
 447  0100 35020000      	mov	__fs,#2
 449  0104 201e          	jra	L55
 450  0106               L131:
 451                     ; 519 	else if( _fs == 14 )
 453  0106 c60000        	ld	a,__fs
 454  0109 a10e          	cp	a,#14
 455  010b 2617          	jrne	L55
 456                     ; 521 		lcd_disp_n(0, __enc);
 458  010d c60002        	ld	a,___enc
 459  0110 97            	ld	xl,a
 460  0111 4f            	clr	a
 461  0112 95            	ld	xh,a
 462  0113 cd0000        	call	_lcd_disp_n
 464                     ; 522 		lcd_disp_n(1, __enc);
 466  0116 c60002        	ld	a,___enc
 467  0119 97            	ld	xl,a
 468  011a a601          	ld	a,#1
 469  011c 95            	ld	xh,a
 470  011d cd0000        	call	_lcd_disp_n
 472                     ; 523 		_fs = 2;
 474  0120 35020000      	mov	__fs,#2
 475  0124               L55:
 476                     ; 525 	if( (__timer100ms%2) == __lcdi )
 478  0124 c60000        	ld	a,___timer100ms
 479  0127 a401          	and	a,#1
 480  0129 c10004        	cp	a,___lcdi
 481  012c 262f          	jrne	L731
 482                     ; 527 		__lcdi = __timer100ms%2;
 484  012e c60000        	ld	a,___timer100ms
 485  0131 a401          	and	a,#1
 486  0133 c70004        	ld	___lcdi,a
 487                     ; 528 		if( __lcd == 0 )
 489  0136 725d0003      	tnz	___lcd
 490  013a 2613          	jrne	L141
 491                     ; 530 			__lcd = 1;
 493  013c 35010003      	mov	___lcd,#1
 494                     ; 531 			_backlight++;
 496  0140 725c0000      	inc	__backlight
 497                     ; 532 			if( _backlight == 24 )
 499  0144 c60000        	ld	a,__backlight
 500  0147 a118          	cp	a,#24
 501  0149 2604          	jrne	L141
 502                     ; 533 				_backlight = 12;
 504  014b 350c0000      	mov	__backlight,#12
 505  014f               L141:
 506                     ; 535 		i = adcGet(1);
 508  014f a601          	ld	a,#1
 509  0151 cd0000        	call	_adcGet
 511  0154 6b01          	ld	(OFST+0,sp),a
 512                     ; 536 		ui_disp_temp_setup(i);
 514  0156 7b01          	ld	a,(OFST+0,sp)
 515  0158 cd0000        	call	_ui_disp_temp_setup
 518  015b 2004          	jra	L541
 519  015d               L731:
 520                     ; 539 		__lcd = 0;
 522  015d 725f0003      	clr	___lcd
 523  0161               L541:
 524                     ; 541 	factory2wire();
 526  0161 cd0000        	call	_factory2wire
 528                     ; 542 }
 531  0164 84            	pop	a
 532  0165 81            	ret
 564                     ; 545 void	_factoryCntl(uint8_t i)
 564                     ; 546 {
 565                     .text:	section	.text,new
 566  0000               __factoryCntl:
 570                     ; 557 }
 573  0000 81            	ret
 607                     ; 820 uint8_t factory(uint8_t mode)
 607                     ; 821 {
 608                     .text:	section	.text,new
 609  0000               _factory:
 613                     ; 822 	timerCalc();
 615  0000 cd0000        	call	_timerCalc
 617                     ; 828 	factoryRC();
 619  0003 cd0000        	call	_factoryRC
 621                     ; 840 }
 624  0006 81            	ret
 684                     	xdef	_factory
 685                     	xdef	__factoryCntl
 686                     	xdef	_factoryRC
 687                     	xref	__backlight
 688                     	xref	_lcd_disp_all
 689                     	xdef	___lcdi
 690                     	xdef	___lcd
 691                     	xdef	___enc
 692                     	xref	_ui_disp_temp_setup
 693                     	xref	_lcd_clear
 694                     	xdef	_factory2wire
 695                     	xdef	__fs2
 696                     	xdef	__fs
 697                     	switch	.bss
 698  0000               ___f:
 699  0000 000000000000  	ds.b	8
 700                     	xdef	___f
 701                     	xref	_lcd_disp_n
 702                     	xref	_timerCalc
 703                     	xref	___timer1s
 704                     	xref	___timer100ms
 705                     	xref	_iouart_getBuffer
 706                     	xref	_iouart_Ready
 707                     	xref	__io_tail
 708                     	xref	__io_head
 709                     	xref	_iouart_Pkt_Start
 710                     	xref	_iouart_Set_Packet
 711                     	xref	_key_ready
 712                     	xref	_adcGet
 732                     	end
