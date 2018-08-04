   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  21                     	switch	.data
  22  0000               __fs:
  23  0000 00            	dc.b	0
  24  0001               __fs2:
  25  0001 00            	dc.b	0
  79                     ; 78 void	factory2wire(void)
  79                     ; 79 {
  81                     	switch	.text
  82  0000               _factory2wire:
  84  0000 5203          	subw	sp,#3
  85       00000003      OFST:	set	3
  88                     ; 82 	if( _io_head != _io_tail )
  90  0002 c60000        	ld	a,__io_head
  91  0005 c10000        	cp	a,__io_tail
  92  0008 272c          	jreq	L13
  93                     ; 84 		i = iouart_Ready();
  95  000a cd0000        	call	_iouart_Ready
  97  000d 6b01          	ld	(OFST-2,sp),a
  98                     ; 85 		if( i==1 )
 100  000f 4a            	dec	a
 101  0010 2624          	jrne	L13
 102                     ; 87 			p = iouart_getBuffer();
 104  0012 cd0000        	call	_iouart_getBuffer
 106  0015 1f02          	ldw	(OFST-1,sp),x
 107                     ; 88 			p[0] = 0x0;
 109  0017 7f            	clr	(x)
 110                     ; 89 			p[1] = 0x1;
 112  0018 a601          	ld	a,#1
 113  001a e701          	ld	(1,x),a
 114                     ; 90 			p[2] = 0x2;
 116  001c 4c            	inc	a
 117  001d e702          	ld	(2,x),a
 118                     ; 91 			p[3] = 0x3;
 120  001f 4c            	inc	a
 121  0020 e703          	ld	(3,x),a
 122                     ; 92 			p[4] = 0x4;
 124  0022 4c            	inc	a
 125  0023 e704          	ld	(4,x),a
 126                     ; 93 			p[5] = 0x5;
 128  0025 4c            	inc	a
 129  0026 e705          	ld	(5,x),a
 130                     ; 94 			p[6] = 0x6;
 132  0028 4c            	inc	a
 133  0029 e706          	ld	(6,x),a
 134                     ; 95 			p[7] = 0x15;
 136  002b a615          	ld	a,#21
 137  002d e707          	ld	(7,x),a
 138                     ; 96 			iouart_Set_Packet(0);
 140  002f 4f            	clr	a
 141  0030 cd0000        	call	_iouart_Set_Packet
 143                     ; 97 			iouart_Pkt_Start();
 145  0033 cd0000        	call	_iouart_Pkt_Start
 147  0036               L13:
 148                     ; 132 }
 151  0036 5b03          	addw	sp,#3
 152  0038 81            	ret	
 155                     	switch	.data
 156  0002               ___enc:
 157  0002 01            	dc.b	1
 158  0003               ___lcd:
 159  0003 00            	dc.b	0
 160  0004               ___lcdi:
 161  0004 00            	dc.b	0
 213                     ; 450 void	factoryRC(void)
 213                     ; 451 {
 214                     	switch	.text
 215  0039               _factoryRC:
 217  0039 88            	push	a
 218       00000001      OFST:	set	1
 221                     ; 459 	if( _fs == 0 )
 223  003a c60000        	ld	a,__fs
 224  003d 2613          	jrne	L35
 225                     ; 461 		_fs = 1;
 227  003f 35010000      	mov	__fs,#1
 228                     ; 462 		__f[0] = __timer1s;
 230  0043 5500000000    	mov	___f,___timer1s
 231                     ; 463 		D_IO_LOW(D_LED_PORT, D_LED_PIN);
 233  0048 7211500a      	bres	20490,#0
 234                     ; 465 		lcd_disp_all();
 236  004c cd0000        	call	_lcd_disp_all
 239  004f cc0111        	jra	L55
 240  0052               L35:
 241                     ; 467 	else if( _fs == 1 )
 243  0052 a101          	cp	a,#1
 244  0054 265a          	jrne	L75
 245                     ; 469 		key = key_ready();
 247  0056 cd0000        	call	_key_ready
 249  0059 6b01          	ld	(OFST+0,sp),a
 250                     ; 470 		if( key != 0 )
 252  005b 27f2          	jreq	L55
 253                     ; 472 			if( (key & 0x80) != 0 )
 255  005d a580          	bcp	a,#128
 256  005f 2727          	jreq	L36
 257                     ; 474 				_fs = 14;
 259  0061 350e0000      	mov	__fs,#14
 260                     ; 475 				if( (key&0x40) == 0 )
 262  0065 a540          	bcp	a,#64
 263  0067 2606          	jrne	L56
 264                     ; 476 					__enc--;
 266  0069 725a0002      	dec	___enc
 268  006d 2004          	jra	L76
 269  006f               L56:
 270                     ; 478 					__enc++;
 272  006f 725c0002      	inc	___enc
 273  0073               L76:
 274                     ; 479 				if( __enc == 0 )		__enc = 8;
 276  0073 2606          	jrne	L17
 279  0075 35080002      	mov	___enc,#8
 281  0079 200b          	jra	L37
 282  007b               L17:
 283                     ; 480 				else if( __enc == 9 )	__enc = 1;
 285  007b c60002        	ld	a,___enc
 286  007e a109          	cp	a,#9
 287  0080 2604          	jrne	L37
 290  0082 35010002      	mov	___enc,#1
 291  0086               L37:
 292                     ; 481 				return;
 295  0086 84            	pop	a
 296  0087 81            	ret	
 297  0088               L36:
 298                     ; 483 			lcd_clear(0);
 300  0088 4f            	clr	a
 301  0089 cd0000        	call	_lcd_clear
 303                     ; 484 			if( key == 1 )	_fs = 10;
 305  008c 7b01          	ld	a,(OFST+0,sp)
 306  008e a101          	cp	a,#1
 307  0090 2604          	jrne	L77
 310  0092 350a0000      	mov	__fs,#10
 311  0096               L77:
 312                     ; 485 			if( key == 2 )	_fs = 11;
 314  0096 a102          	cp	a,#2
 315  0098 2604          	jrne	L101
 318  009a 350b0000      	mov	__fs,#11
 319  009e               L101:
 320                     ; 486 			if( key == 3 )	_fs = 12;
 322  009e a103          	cp	a,#3
 323  00a0 2604          	jrne	L301
 326  00a2 350c0000      	mov	__fs,#12
 327  00a6               L301:
 328                     ; 487 			if( key == 4 )	_fs = 13;
 330  00a6 a104          	cp	a,#4
 331  00a8 2667          	jrne	L55
 334  00aa 350d0000      	mov	__fs,#13
 335  00ae 2061          	jra	L55
 336  00b0               L75:
 337                     ; 491 	else if( _fs == 2 )
 339  00b0 a102          	cp	a,#2
 340  00b2 2606          	jrne	L111
 341                     ; 493 		_fs = 1;
 343  00b4 35010000      	mov	__fs,#1
 345  00b8 2057          	jra	L55
 346  00ba               L111:
 347                     ; 495 	else if( _fs == 10 )
 349  00ba a10a          	cp	a,#10
 350  00bc 260b          	jrne	L511
 351                     ; 497 		lcd_disp_n(0, 1);
 353  00be ae0001        	ldw	x,#1
 354  00c1 cd0000        	call	_lcd_disp_n
 356                     ; 498 		lcd_disp_n(1, 1);
 358  00c4 ae0101        	ldw	x,#257
 360                     ; 499 		_fs = 2;
 362  00c7 2041          	jp	LC001
 363  00c9               L511:
 364                     ; 501 	else if( _fs == 11 )
 366  00c9 a10b          	cp	a,#11
 367  00cb 260b          	jrne	L121
 368                     ; 503 		lcd_disp_n(0, 2);
 370  00cd ae0002        	ldw	x,#2
 371  00d0 cd0000        	call	_lcd_disp_n
 373                     ; 504 		lcd_disp_n(1, 2);
 375  00d3 ae0102        	ldw	x,#258
 377                     ; 505 		_fs = 2;
 379  00d6 2032          	jp	LC001
 380  00d8               L121:
 381                     ; 507 	else if( _fs == 12 )
 383  00d8 a10c          	cp	a,#12
 384  00da 260b          	jrne	L521
 385                     ; 509 		lcd_disp_n(0, 3);
 387  00dc ae0003        	ldw	x,#3
 388  00df cd0000        	call	_lcd_disp_n
 390                     ; 510 		lcd_disp_n(1, 3);
 392  00e2 ae0103        	ldw	x,#259
 394                     ; 511 		_fs = 2;
 396  00e5 2023          	jp	LC001
 397  00e7               L521:
 398                     ; 513 	else if( _fs == 13 )
 400  00e7 a10d          	cp	a,#13
 401  00e9 260b          	jrne	L131
 402                     ; 515 		lcd_disp_n(0, 4);
 404  00eb ae0004        	ldw	x,#4
 405  00ee cd0000        	call	_lcd_disp_n
 407                     ; 516 		lcd_disp_n(1, 4);
 409  00f1 ae0104        	ldw	x,#260
 411                     ; 517 		_fs = 2;
 413  00f4 2014          	jp	LC001
 414  00f6               L131:
 415                     ; 519 	else if( _fs == 14 )
 417  00f6 a10e          	cp	a,#14
 418  00f8 2617          	jrne	L55
 419                     ; 521 		lcd_disp_n(0, __enc);
 421  00fa c60002        	ld	a,___enc
 422  00fd 97            	ld	xl,a
 423  00fe 4f            	clr	a
 424  00ff 95            	ld	xh,a
 425  0100 cd0000        	call	_lcd_disp_n
 427                     ; 522 		lcd_disp_n(1, __enc);
 429  0103 c60002        	ld	a,___enc
 430  0106 97            	ld	xl,a
 431  0107 a601          	ld	a,#1
 432  0109 95            	ld	xh,a
 434                     ; 523 		_fs = 2;
 436  010a               LC001:
 437  010a cd0000        	call	_lcd_disp_n
 442  010d 35020000      	mov	__fs,#2
 443  0111               L55:
 444                     ; 525 	if( (__timer100ms%2) == __lcdi )
 446  0111 c60000        	ld	a,___timer100ms
 447  0114 a401          	and	a,#1
 448  0116 c10004        	cp	a,___lcdi
 449  0119 262c          	jrne	L731
 450                     ; 527 		__lcdi = __timer100ms%2;
 452  011b c60000        	ld	a,___timer100ms
 453  011e a401          	and	a,#1
 454  0120 c70004        	ld	___lcdi,a
 455                     ; 528 		if( __lcd == 0 )
 457  0123 c60003        	ld	a,___lcd
 458  0126 2613          	jrne	L141
 459                     ; 530 			__lcd = 1;
 461  0128 35010003      	mov	___lcd,#1
 462                     ; 531 			_backlight++;
 464  012c 725c0000      	inc	__backlight
 465                     ; 532 			if( _backlight == 24 )
 467  0130 c60000        	ld	a,__backlight
 468  0133 a118          	cp	a,#24
 469  0135 2604          	jrne	L141
 470                     ; 533 				_backlight = 12;
 472  0137 350c0000      	mov	__backlight,#12
 473  013b               L141:
 474                     ; 535 		i = adcGet(1);
 476  013b a601          	ld	a,#1
 477  013d cd0000        	call	_adcGet
 479  0140 6b01          	ld	(OFST+0,sp),a
 480                     ; 536 		ui_disp_temp_setup(i);
 482  0142 cd0000        	call	_ui_disp_temp_setup
 485  0145 2004          	jra	L541
 486  0147               L731:
 487                     ; 539 		__lcd = 0;
 489  0147 725f0003      	clr	___lcd
 490  014b               L541:
 491                     ; 541 	factory2wire();
 493  014b cd0000        	call	_factory2wire
 495                     ; 542 }
 498  014e 84            	pop	a
 499  014f 81            	ret	
 531                     ; 545 void	_factoryCntl(uint8_t i)
 531                     ; 546 {
 532                     	switch	.text
 533  0150               __factoryCntl:
 537                     ; 555 }
 540  0150 81            	ret	
 574                     ; 768 uint8_t factory(uint8_t mode)
 574                     ; 769 {
 575                     	switch	.text
 576  0151               _factory:
 580                     ; 770 	timerCalc();
 582  0151 cd0000        	call	_timerCalc
 584                     ; 776 	factoryRC();
 587                     ; 788 }
 590  0154 cc0039        	jp	_factoryRC
 650                     	xdef	_factory
 651                     	xdef	__factoryCntl
 652                     	xdef	_factoryRC
 653                     	xref	__backlight
 654                     	xref	_lcd_disp_all
 655                     	xdef	___lcdi
 656                     	xdef	___lcd
 657                     	xdef	___enc
 658                     	xref	_ui_disp_temp_setup
 659                     	xref	_lcd_clear
 660                     	xdef	_factory2wire
 661                     	xdef	__fs2
 662                     	xdef	__fs
 663                     	switch	.bss
 664  0000               ___f:
 665  0000 000000000000  	ds.b	8
 666                     	xdef	___f
 667                     	xref	_lcd_disp_n
 668                     	xref	_timerCalc
 669                     	xref	___timer1s
 670                     	xref	___timer100ms
 671                     	xref	_iouart_getBuffer
 672                     	xref	_iouart_Ready
 673                     	xref	__io_tail
 674                     	xref	__io_head
 675                     	xref	_iouart_Pkt_Start
 676                     	xref	_iouart_Set_Packet
 677                     	xref	_key_ready
 678                     	xref	_adcGet
 698                     	end
