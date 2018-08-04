   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  22                     	switch	.data
  23  0000               __fs:
  24  0000 00            	dc.b	0
  25  0001               __fs2:
  26  0001 00            	dc.b	0
  80                     ; 78 void	factory2wire(void)
  80                     ; 79 {
  82                     .text:	section	.text,new
  83  0000               _factory2wire:
  85  0000 5203          	subw	sp,#3
  86       00000003      OFST:	set	3
  89                     ; 82 	if( _io_head != _io_tail )
  91  0002 c60000        	ld	a,__io_head
  92  0005 c10000        	cp	a,__io_tail
  93  0008 272c          	jreq	L13
  94                     ; 84 		i = iouart_Ready();
  96  000a cd0000        	call	_iouart_Ready
  98  000d 6b01          	ld	(OFST-2,sp),a
  99                     ; 85 		if( i==1 )
 101  000f 4a            	dec	a
 102  0010 2624          	jrne	L13
 103                     ; 87 			p = iouart_getBuffer();
 105  0012 cd0000        	call	_iouart_getBuffer
 107  0015 1f02          	ldw	(OFST-1,sp),x
 108                     ; 88 			p[0] = 0x0;
 110  0017 7f            	clr	(x)
 111                     ; 89 			p[1] = 0x1;
 113  0018 a601          	ld	a,#1
 114  001a e701          	ld	(1,x),a
 115                     ; 90 			p[2] = 0x2;
 117  001c 4c            	inc	a
 118  001d e702          	ld	(2,x),a
 119                     ; 91 			p[3] = 0x3;
 121  001f 4c            	inc	a
 122  0020 e703          	ld	(3,x),a
 123                     ; 92 			p[4] = 0x4;
 125  0022 4c            	inc	a
 126  0023 e704          	ld	(4,x),a
 127                     ; 93 			p[5] = 0x5;
 129  0025 4c            	inc	a
 130  0026 e705          	ld	(5,x),a
 131                     ; 94 			p[6] = 0x6;
 133  0028 4c            	inc	a
 134  0029 e706          	ld	(6,x),a
 135                     ; 95 			p[7] = 0x15;
 137  002b a615          	ld	a,#21
 138  002d e707          	ld	(7,x),a
 139                     ; 96 			iouart_Set_Packet(0);
 141  002f 4f            	clr	a
 142  0030 cd0000        	call	_iouart_Set_Packet
 144                     ; 97 			iouart_Pkt_Start();
 146  0033 cd0000        	call	_iouart_Pkt_Start
 148  0036               L13:
 149                     ; 132 }
 152  0036 5b03          	addw	sp,#3
 153  0038 81            	ret	
 187                     ; 545 void	_factoryCntl(uint8_t i)
 187                     ; 546 {
 188                     .text:	section	.text,new
 189  0000               __factoryCntl:
 191  0000 88            	push	a
 192       00000000      OFST:	set	0
 195                     ; 548 	lcd_disp_n(0, i);
 197  0001 97            	ld	xl,a
 198  0002 4f            	clr	a
 199  0003 95            	ld	xh,a
 200  0004 cd0000        	call	_lcd_disp_n
 202                     ; 549 	lcd_disp_n(1, i);
 204  0007 7b01          	ld	a,(OFST+1,sp)
 205  0009 97            	ld	xl,a
 206  000a a601          	ld	a,#1
 207  000c 95            	ld	xh,a
 208  000d cd0000        	call	_lcd_disp_n
 210                     ; 550 	_fs = 2;
 212  0010 35020000      	mov	__fs,#2
 213                     ; 557 }
 216  0014 84            	pop	a
 217  0015 81            	ret	
 220                     	switch	.data
 221  0002               ___lcd:
 222  0002 00            	dc.b	0
 223  0003               ___lcdi:
 224  0003 00            	dc.b	0
 225  0004               __key_first:
 226  0004 00            	dc.b	0
 286                     ; 581 void	factoryDr(void)
 286                     ; 582 {
 287                     .text:	section	.text,new
 288  0000               _factoryDr:
 290  0000 89            	pushw	x
 291       00000002      OFST:	set	2
 294                     ; 586 	if( _fs == 0 )
 296  0001 c60000        	ld	a,__fs
 297  0004 260f          	jrne	L76
 298                     ; 588 		_fs = 1;
 300  0006 35010000      	mov	__fs,#1
 301                     ; 589 		__f[0] = __timer1s;
 303  000a 5500000000    	mov	___f,___timer1s
 304                     ; 591 		lcd_disp_all();
 306  000f cd0000        	call	_lcd_disp_all
 309  0012 cc0156        	jra	L17
 310  0015               L76:
 311                     ; 593 	else if( _fs == 1 )
 313  0015 a101          	cp	a,#1
 314  0017 2703cc011b    	jrne	L37
 315                     ; 595 		key = 0;
 317  001c 0f02          	clr	(OFST+0,sp)
 319  001e cc00b5        	jra	L101
 320  0021               L57:
 321                     ; 598 			i = uart1_get();
 323  0021 cd0000        	call	_uart1_get
 325  0024 6b01          	ld	(OFST-1,sp),a
 326                     ; 599 			if( i != 0xff )
 328  0026 4c            	inc	a
 329  0027 2603cc00b2    	jreq	L501
 330                     ; 601 				tc[tci] = i;
 332  002c c60000        	ld	a,_tci
 333  002f 5f            	clrw	x
 334  0030 97            	ld	xl,a
 335  0031 7b01          	ld	a,(OFST-1,sp)
 336  0033 d70000        	ld	(_tc,x),a
 337                     ; 602 				tci = tci==0 ? 1 : 0;
 339  0036 c60000        	ld	a,_tci
 340  0039 2603          	jrne	L23
 341  003b 4c            	inc	a
 342  003c 2001          	jra	L43
 343  003e               L23:
 344  003e 4f            	clr	a
 345  003f               L43:
 346  003f c70000        	ld	_tci,a
 347                     ; 603 				if( tci != 0 )
 349  0042 2671          	jrne	L101
 350                     ; 604 					continue;
 352                     ; 606 				i = tc[0] + tc[1];
 354  0044 c60000        	ld	a,_tc
 355  0047 cb0001        	add	a,_tc+1
 356  004a 6b01          	ld	(OFST-1,sp),a
 357                     ; 607 				if( i != 0xff )
 359  004c 4c            	inc	a
 360  004d 2666          	jrne	L101
 361                     ; 608 					continue;
 363                     ; 610 				key = _touchKey(0, 0x01, 0x20);
 365  004f 4b20          	push	#32
 366  0051 ae0001        	ldw	x,#1
 367  0054 cd0000        	call	__touchKey
 369  0057 5b01          	addw	sp,#1
 370  0059 6b02          	ld	(OFST+0,sp),a
 371                     ; 611 				key |= _touchKey(1, 0x02, 0x02);
 373  005b 4b02          	push	#2
 374  005d ae0102        	ldw	x,#258
 375  0060 cd0000        	call	__touchKey
 377  0063 5b01          	addw	sp,#1
 378  0065 1a02          	or	a,(OFST+0,sp)
 379  0067 6b02          	ld	(OFST+0,sp),a
 380                     ; 612 				key |= _touchKey(2, 0x04, 0x08);
 382  0069 4b08          	push	#8
 383  006b ae0204        	ldw	x,#516
 384  006e cd0000        	call	__touchKey
 386  0071 5b01          	addw	sp,#1
 387  0073 1a02          	or	a,(OFST+0,sp)
 388  0075 6b02          	ld	(OFST+0,sp),a
 389                     ; 613 				key |= _touchKey(3, 0x08, 0x04);
 391  0077 4b04          	push	#4
 392  0079 ae0308        	ldw	x,#776
 393  007c cd0000        	call	__touchKey
 395  007f 5b01          	addw	sp,#1
 396  0081 1a02          	or	a,(OFST+0,sp)
 397  0083 6b02          	ld	(OFST+0,sp),a
 398                     ; 614 				key |= _touchKey(4, 0x10, 0x10);
 400  0085 4b10          	push	#16
 401  0087 ae0410        	ldw	x,#1040
 402  008a cd0000        	call	__touchKey
 404  008d 5b01          	addw	sp,#1
 405  008f 1a02          	or	a,(OFST+0,sp)
 406  0091 6b02          	ld	(OFST+0,sp),a
 407                     ; 615 				key |= _touchKey(5, 0x20, 0x01);
 409  0093 4b01          	push	#1
 410  0095 ae0520        	ldw	x,#1312
 411  0098 cd0000        	call	__touchKey
 413  009b 5b01          	addw	sp,#1
 414  009d 1a02          	or	a,(OFST+0,sp)
 415  009f 6b02          	ld	(OFST+0,sp),a
 416                     ; 616 				if( _tcKey == 0 )
 418  00a1 c60000        	ld	a,__tcKey
 419  00a4 270f          	jreq	L101
 420                     ; 617 					continue;
 422                     ; 619 				beepSet(4);			
 424  00a6 a604          	ld	a,#4
 425  00a8 cd0000        	call	_beepSet
 427                     ; 620 				_tctimer100ms[0] = __timer1s;
 429  00ab 5500000000    	mov	__tctimer100ms,___timer1s
 431  00b0 2003          	jra	L101
 432  00b2               L501:
 433                     ; 623 				tci = 0;
 435  00b2 c70000        	ld	_tci,a
 436  00b5               L101:
 437                     ; 596 		while( _uart1_rx_tail != _uart1_rx_head )
 439  00b5 c60000        	ld	a,__uart1_rx_tail
 440  00b8 c10000        	cp	a,__uart1_rx_head
 441  00bb 2703cc0021    	jrne	L57
 442                     ; 625 		if( _tctimer100ms[0] != __timer1s )
 444  00c0 c60000        	ld	a,__tctimer100ms
 445  00c3 c10000        	cp	a,___timer1s
 446  00c6 2713          	jreq	L711
 447                     ; 627 			_tctimer100ms[0] = __timer1s;
 449  00c8 5500000000    	mov	__tctimer100ms,___timer1s
 450                     ; 628 			if( _key_first == 1 )
 452  00cd c60004        	ld	a,__key_first
 453  00d0 4a            	dec	a
 454  00d1 2605          	jrne	L121
 455                     ; 629 				lcd_clear(0);
 457  00d3 cd0000        	call	_lcd_clear
 460  00d6 2003          	jra	L711
 461  00d8               L121:
 462                     ; 631 				lcd_disp_all();
 464  00d8 cd0000        	call	_lcd_disp_all
 466  00db               L711:
 467                     ; 635 		if( key != 0 )
 469  00db 7b02          	ld	a,(OFST+0,sp)
 470  00dd 2777          	jreq	L17
 471                     ; 637 			lcd_clear(0);
 473  00df 4f            	clr	a
 474  00e0 cd0000        	call	_lcd_clear
 476                     ; 638 			if( key == 1 )	_fs = 10;
 478  00e3 7b02          	ld	a,(OFST+0,sp)
 479  00e5 a101          	cp	a,#1
 480  00e7 2604          	jrne	L721
 483  00e9 350a0000      	mov	__fs,#10
 484  00ed               L721:
 485                     ; 639 			if( key == 2 )	_fs = 11;
 487  00ed a102          	cp	a,#2
 488  00ef 2604          	jrne	L131
 491  00f1 350b0000      	mov	__fs,#11
 492  00f5               L131:
 493                     ; 640 			if( key == 4 )	_fs = 12;
 495  00f5 a104          	cp	a,#4
 496  00f7 2604          	jrne	L331
 499  00f9 350c0000      	mov	__fs,#12
 500  00fd               L331:
 501                     ; 641 			if( key == 8 )	_fs = 13;
 503  00fd a108          	cp	a,#8
 504  00ff 2604          	jrne	L531
 507  0101 350d0000      	mov	__fs,#13
 508  0105               L531:
 509                     ; 642 			if( key == 16 )	_fs = 14;
 511  0105 a110          	cp	a,#16
 512  0107 2604          	jrne	L731
 515  0109 350e0000      	mov	__fs,#14
 516  010d               L731:
 517                     ; 643 			if( key == 32 )	_fs = 15;
 519  010d a120          	cp	a,#32
 520  010f 2604          	jrne	L141
 523  0111 350f0000      	mov	__fs,#15
 524  0115               L141:
 525                     ; 644 			_key_first = 1;
 527  0115 35010004      	mov	__key_first,#1
 528  0119 203b          	jra	L17
 529  011b               L37:
 530                     ; 647 	else if( _fs == 2 )
 532  011b a102          	cp	a,#2
 533  011d 2606          	jrne	L541
 534                     ; 649 		_fs = 1;
 536  011f 35010000      	mov	__fs,#1
 538  0123 2031          	jra	L17
 539  0125               L541:
 540                     ; 651 	else if( _fs == 10 )	_factoryCntl(1);
 542  0125 a10a          	cp	a,#10
 543  0127 2604          	jrne	L151
 546  0129 a601          	ld	a,#1
 549  012b 2026          	jp	LC001
 550  012d               L151:
 551                     ; 652 	else if( _fs == 11 )	_factoryCntl(2);
 553  012d a10b          	cp	a,#11
 554  012f 2604          	jrne	L551
 557  0131 a602          	ld	a,#2
 560  0133 201e          	jp	LC001
 561  0135               L551:
 562                     ; 653 	else if( _fs == 12 )	_factoryCntl(3);
 564  0135 a10c          	cp	a,#12
 565  0137 2604          	jrne	L161
 568  0139 a603          	ld	a,#3
 571  013b 2016          	jp	LC001
 572  013d               L161:
 573                     ; 654 	else if( _fs == 13 )	_factoryCntl(4);
 575  013d a10d          	cp	a,#13
 576  013f 2604          	jrne	L561
 579  0141 a604          	ld	a,#4
 582  0143 200e          	jp	LC001
 583  0145               L561:
 584                     ; 655 	else if( _fs == 14 )	_factoryCntl(5);
 586  0145 a10e          	cp	a,#14
 587  0147 2604          	jrne	L171
 590  0149 a605          	ld	a,#5
 593  014b 2006          	jp	LC001
 594  014d               L171:
 595                     ; 656 	else if( _fs == 15 )	_factoryCntl(6);
 597  014d a10f          	cp	a,#15
 598  014f 2605          	jrne	L17
 601  0151 a606          	ld	a,#6
 602  0153               LC001:
 603  0153 cd0000        	call	__factoryCntl
 605  0156               L17:
 606                     ; 658 	if( (__timer100ms%2) == __lcdi )
 608  0156 c60000        	ld	a,___timer100ms
 609  0159 a401          	and	a,#1
 610  015b c10003        	cp	a,___lcdi
 611  015e 262c          	jrne	L771
 612                     ; 660 		__lcdi = __timer100ms%2;
 614  0160 c60000        	ld	a,___timer100ms
 615  0163 a401          	and	a,#1
 616  0165 c70003        	ld	___lcdi,a
 617                     ; 661 		if( __lcd == 0 )
 619  0168 c60002        	ld	a,___lcd
 620  016b 2613          	jrne	L102
 621                     ; 663 			__lcd = 1;
 623  016d 35010002      	mov	___lcd,#1
 624                     ; 664 			_backlight++;
 626  0171 725c0000      	inc	__backlight
 627                     ; 665 			if( _backlight == BACKLIGHT_MAX_LEVEL )
 629  0175 c60000        	ld	a,__backlight
 630  0178 a160          	cp	a,#96
 631  017a 2604          	jrne	L102
 632                     ; 666 				_backlight = 12;
 634  017c 350c0000      	mov	__backlight,#12
 635  0180               L102:
 636                     ; 668 		i = adcGet(1);
 638  0180 a601          	ld	a,#1
 639  0182 cd0000        	call	_adcGet
 641  0185 6b01          	ld	(OFST-1,sp),a
 642                     ; 669 		ui_disp_temp_setup(i);
 644  0187 cd0000        	call	_ui_disp_temp_setup
 647  018a 2004          	jra	L502
 648  018c               L771:
 649                     ; 672 		__lcd = 0;
 651  018c 725f0002      	clr	___lcd
 652  0190               L502:
 653                     ; 674 	factory2wire();
 655  0190 cd0000        	call	_factory2wire
 657                     ; 675 }
 660  0193 85            	popw	x
 661  0194 81            	ret	
 695                     ; 820 uint8_t factory(uint8_t mode)
 695                     ; 821 {
 696                     .text:	section	.text,new
 697  0000               _factory:
 701                     ; 822 	timerCalc();
 703  0000 cd0000        	call	_timerCalc
 705                     ; 834 	factoryDr();
 708                     ; 840 }
 711  0003 cc0000        	jp	_factoryDr
 771                     	xdef	_factory
 772                     	xdef	_factoryDr
 773                     	xref	__tctimer100ms
 774                     	xref	__uart1_rx_tail
 775                     	xref	__uart1_rx_head
 776                     	xref	_beepSet
 777                     	xref	__touchKey
 778                     	xref	__tcKey
 779                     	xref	_tci
 780                     	xref	_tc
 781                     	xref	__backlight
 782                     	xref	_lcd_disp_all
 783                     	xdef	__key_first
 784                     	xdef	___lcdi
 785                     	xdef	___lcd
 786                     	xref	_ui_disp_temp_setup
 787                     	xref	_lcd_clear
 788                     	xdef	__factoryCntl
 789                     	xdef	_factory2wire
 790                     	xdef	__fs2
 791                     	xdef	__fs
 792                     	switch	.bss
 793  0000               ___f:
 794  0000 000000000000  	ds.b	8
 795                     	xdef	___f
 796                     	xref	_lcd_disp_n
 797                     	xref	_timerCalc
 798                     	xref	___timer1s
 799                     	xref	___timer100ms
 800                     	xref	_uart1_get
 801                     	xref	_iouart_getBuffer
 802                     	xref	_iouart_Ready
 803                     	xref	__io_tail
 804                     	xref	__io_head
 805                     	xref	_iouart_Pkt_Start
 806                     	xref	_iouart_Set_Packet
 807                     	xref	_adcGet
 827                     	end
