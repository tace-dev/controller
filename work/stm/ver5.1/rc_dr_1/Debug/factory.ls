   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  22                     	switch	.data
  23  0000               __fs:
  24  0000 00            	dc.b	0
  25  0001               __fs2:
  26  0001 00            	dc.b	0
  80                     ; 83 void	factory2wire(void)
  80                     ; 84 {
  82                     .text:	section	.text,new
  83  0000               _factory2wire:
  85  0000 5203          	subw	sp,#3
  86       00000003      OFST:	set	3
  89                     ; 87 	if( _io_head != _io_tail )
  91  0002 c60000        	ld	a,__io_head
  92  0005 c10000        	cp	a,__io_tail
  93  0008 272c          	jreq	L13
  94                     ; 89 		i = iouart_Ready();
  96  000a cd0000        	call	_iouart_Ready
  98  000d 6b01          	ld	(OFST-2,sp),a
 100                     ; 90 		if( i==1 )
 102  000f 4a            	dec	a
 103  0010 2624          	jrne	L13
 104                     ; 92 			p = iouart_getBuffer();
 106  0012 cd0000        	call	_iouart_getBuffer
 108  0015 1f02          	ldw	(OFST-1,sp),x
 110                     ; 93 			p[0] = 0x0;
 112  0017 7f            	clr	(x)
 113                     ; 94 			p[1] = 0x1;
 115  0018 a601          	ld	a,#1
 116  001a e701          	ld	(1,x),a
 117                     ; 95 			p[2] = 0x2;
 119  001c 4c            	inc	a
 120  001d e702          	ld	(2,x),a
 121                     ; 96 			p[3] = 0x3;
 123  001f 4c            	inc	a
 124  0020 e703          	ld	(3,x),a
 125                     ; 97 			p[4] = 0x4;
 127  0022 4c            	inc	a
 128  0023 e704          	ld	(4,x),a
 129                     ; 98 			p[5] = 0x5;
 131  0025 4c            	inc	a
 132  0026 e705          	ld	(5,x),a
 133                     ; 99 			p[6] = 0x6;
 135  0028 4c            	inc	a
 136  0029 e706          	ld	(6,x),a
 137                     ; 100 			p[7] = 0x15;
 139  002b a615          	ld	a,#21
 140  002d e707          	ld	(7,x),a
 141                     ; 101 			iouart_Set_Packet(0);
 143  002f 4f            	clr	a
 144  0030 cd0000        	call	_iouart_Set_Packet
 146                     ; 102 			iouart_Pkt_Start();
 148  0033 cd0000        	call	_iouart_Pkt_Start
 150  0036               L13:
 151                     ; 153 }
 154  0036 5b03          	addw	sp,#3
 155  0038 81            	ret	
 189                     ; 566 void	_factoryCntl(uint8_t i)
 189                     ; 567 {
 190                     .text:	section	.text,new
 191  0000               __factoryCntl:
 193  0000 88            	push	a
 194       00000000      OFST:	set	0
 197                     ; 569 	lcd_disp_n(0, i);
 199  0001 5f            	clrw	x
 200  0002 97            	ld	xl,a
 201  0003 cd0000        	call	_lcd_disp_n
 203                     ; 570 	lcd_disp_n(1, i);
 205  0006 7b01          	ld	a,(OFST+1,sp)
 206  0008 ae0100        	ldw	x,#256
 207  000b 97            	ld	xl,a
 208  000c cd0000        	call	_lcd_disp_n
 210                     ; 571 	_fs = 2;
 212  000f 35020000      	mov	__fs,#2
 213                     ; 578 }
 216  0013 84            	pop	a
 217  0014 81            	ret	
 220                     	switch	.data
 221  0002               ___lcd:
 222  0002 00            	dc.b	0
 223  0003               ___lcdi:
 224  0003 00            	dc.b	0
 225  0004               __key_first:
 226  0004 00            	dc.b	0
 286                     ; 602 void	factoryDr(void)
 286                     ; 603 {
 287                     .text:	section	.text,new
 288  0000               _factoryDr:
 290  0000 89            	pushw	x
 291       00000002      OFST:	set	2
 294                     ; 607 	if( _fs == 0 )
 296  0001 c60000        	ld	a,__fs
 297  0004 260f          	jrne	L76
 298                     ; 609 		_fs = 1;
 300  0006 35010000      	mov	__fs,#1
 301                     ; 610 		__f[0] = __timer1s;
 303  000a 5500000000    	mov	___f,___timer1s
 304                     ; 612 		lcd_disp_all();
 306  000f cd0000        	call	_lcd_disp_all
 309  0012 cc0156        	jra	L17
 310  0015               L76:
 311                     ; 614 	else if( _fs == 1 )
 313  0015 a101          	cp	a,#1
 314  0017 2703cc011b    	jrne	L37
 315                     ; 616 		key = 0;
 317  001c 0f02          	clr	(OFST+0,sp)
 320  001e cc00b5        	jra	L101
 321  0021               L57:
 322                     ; 619 			i = uart1_get();
 324  0021 cd0000        	call	_uart1_get
 326  0024 6b01          	ld	(OFST-1,sp),a
 328                     ; 620 			if( i != 0xff )
 330  0026 4c            	inc	a
 331  0027 2603cc00b2    	jreq	L501
 332                     ; 622 				tc[tci] = i;
 334  002c c60000        	ld	a,_tci
 335  002f 5f            	clrw	x
 336  0030 97            	ld	xl,a
 337  0031 7b01          	ld	a,(OFST-1,sp)
 338  0033 d70000        	ld	(_tc,x),a
 339                     ; 623 				tci = tci==0 ? 1 : 0;
 341  0036 c60000        	ld	a,_tci
 342  0039 2603          	jrne	L23
 343  003b 4c            	inc	a
 344  003c 2001          	jra	L43
 345  003e               L23:
 346  003e 4f            	clr	a
 347  003f               L43:
 348  003f c70000        	ld	_tci,a
 349                     ; 624 				if( tci != 0 )
 351  0042 2671          	jrne	L101
 352                     ; 625 					continue;
 354                     ; 627 				i = tc[0] + tc[1];
 356  0044 c60000        	ld	a,_tc
 357  0047 cb0001        	add	a,_tc+1
 358  004a 6b01          	ld	(OFST-1,sp),a
 360                     ; 628 				if( i != 0xff )
 362  004c 4c            	inc	a
 363  004d 2666          	jrne	L101
 364                     ; 629 					continue;
 366                     ; 631 				key = _touchKey(0, 0x01, 0x20);
 368  004f 4b20          	push	#32
 369  0051 ae0001        	ldw	x,#1
 370  0054 cd0000        	call	__touchKey
 372  0057 5b01          	addw	sp,#1
 373  0059 6b02          	ld	(OFST+0,sp),a
 375                     ; 632 				key |= _touchKey(1, 0x02, 0x02);
 377  005b 4b02          	push	#2
 378  005d ae0102        	ldw	x,#258
 379  0060 cd0000        	call	__touchKey
 381  0063 5b01          	addw	sp,#1
 382  0065 1a02          	or	a,(OFST+0,sp)
 383  0067 6b02          	ld	(OFST+0,sp),a
 385                     ; 633 				key |= _touchKey(2, 0x04, 0x08);
 387  0069 4b08          	push	#8
 388  006b ae0204        	ldw	x,#516
 389  006e cd0000        	call	__touchKey
 391  0071 5b01          	addw	sp,#1
 392  0073 1a02          	or	a,(OFST+0,sp)
 393  0075 6b02          	ld	(OFST+0,sp),a
 395                     ; 634 				key |= _touchKey(3, 0x08, 0x04);
 397  0077 4b04          	push	#4
 398  0079 ae0308        	ldw	x,#776
 399  007c cd0000        	call	__touchKey
 401  007f 5b01          	addw	sp,#1
 402  0081 1a02          	or	a,(OFST+0,sp)
 403  0083 6b02          	ld	(OFST+0,sp),a
 405                     ; 635 				key |= _touchKey(4, 0x10, 0x10);
 407  0085 4b10          	push	#16
 408  0087 ae0410        	ldw	x,#1040
 409  008a cd0000        	call	__touchKey
 411  008d 5b01          	addw	sp,#1
 412  008f 1a02          	or	a,(OFST+0,sp)
 413  0091 6b02          	ld	(OFST+0,sp),a
 415                     ; 636 				key |= _touchKey(5, 0x20, 0x01);
 417  0093 4b01          	push	#1
 418  0095 ae0520        	ldw	x,#1312
 419  0098 cd0000        	call	__touchKey
 421  009b 5b01          	addw	sp,#1
 422  009d 1a02          	or	a,(OFST+0,sp)
 423  009f 6b02          	ld	(OFST+0,sp),a
 425                     ; 637 				if( _tcKey == 0 )
 427  00a1 c60000        	ld	a,__tcKey
 428  00a4 270f          	jreq	L101
 429                     ; 638 					continue;
 431                     ; 640 				beepSet(4);			
 433  00a6 a604          	ld	a,#4
 434  00a8 cd0000        	call	_beepSet
 436                     ; 641 				_tctimer100ms[0] = __timer1s;
 438  00ab 5500000000    	mov	__tctimer100ms,___timer1s
 440  00b0 2003          	jra	L101
 441  00b2               L501:
 442                     ; 644 				tci = 0;
 444  00b2 c70000        	ld	_tci,a
 445  00b5               L101:
 446                     ; 617 		while( _uart1_rx_tail != _uart1_rx_head )
 448  00b5 c60000        	ld	a,__uart1_rx_tail
 449  00b8 c10000        	cp	a,__uart1_rx_head
 450  00bb 2703cc0021    	jrne	L57
 451                     ; 646 		if( _tctimer100ms[0] != __timer1s )
 453  00c0 c60000        	ld	a,__tctimer100ms
 454  00c3 c10000        	cp	a,___timer1s
 455  00c6 2713          	jreq	L711
 456                     ; 648 			_tctimer100ms[0] = __timer1s;
 458  00c8 5500000000    	mov	__tctimer100ms,___timer1s
 459                     ; 649 			if( _key_first == 1 )
 461  00cd c60004        	ld	a,__key_first
 462  00d0 4a            	dec	a
 463  00d1 2605          	jrne	L121
 464                     ; 650 				lcd_clear(0);
 466  00d3 cd0000        	call	_lcd_clear
 469  00d6 2003          	jra	L711
 470  00d8               L121:
 471                     ; 652 				lcd_disp_all();
 473  00d8 cd0000        	call	_lcd_disp_all
 475  00db               L711:
 476                     ; 656 		if( key != 0 )
 478  00db 7b02          	ld	a,(OFST+0,sp)
 479  00dd 2777          	jreq	L17
 480                     ; 658 			lcd_clear(0);
 482  00df 4f            	clr	a
 483  00e0 cd0000        	call	_lcd_clear
 485                     ; 659 			if( key == 1 )	_fs = 10;
 487  00e3 7b02          	ld	a,(OFST+0,sp)
 488  00e5 a101          	cp	a,#1
 489  00e7 2604          	jrne	L721
 492  00e9 350a0000      	mov	__fs,#10
 493  00ed               L721:
 494                     ; 660 			if( key == 2 )	_fs = 11;
 496  00ed a102          	cp	a,#2
 497  00ef 2604          	jrne	L131
 500  00f1 350b0000      	mov	__fs,#11
 501  00f5               L131:
 502                     ; 661 			if( key == 4 )	_fs = 12;
 504  00f5 a104          	cp	a,#4
 505  00f7 2604          	jrne	L331
 508  00f9 350c0000      	mov	__fs,#12
 509  00fd               L331:
 510                     ; 662 			if( key == 8 )	_fs = 13;
 512  00fd a108          	cp	a,#8
 513  00ff 2604          	jrne	L531
 516  0101 350d0000      	mov	__fs,#13
 517  0105               L531:
 518                     ; 663 			if( key == 16 )	_fs = 14;
 520  0105 a110          	cp	a,#16
 521  0107 2604          	jrne	L731
 524  0109 350e0000      	mov	__fs,#14
 525  010d               L731:
 526                     ; 664 			if( key == 32 )	_fs = 15;
 528  010d a120          	cp	a,#32
 529  010f 2604          	jrne	L141
 532  0111 350f0000      	mov	__fs,#15
 533  0115               L141:
 534                     ; 665 			_key_first = 1;
 536  0115 35010004      	mov	__key_first,#1
 537  0119 203b          	jra	L17
 538  011b               L37:
 539                     ; 668 	else if( _fs == 2 )
 541  011b a102          	cp	a,#2
 542  011d 2606          	jrne	L541
 543                     ; 670 		_fs = 1;
 545  011f 35010000      	mov	__fs,#1
 547  0123 2031          	jra	L17
 548  0125               L541:
 549                     ; 672 	else if( _fs == 10 )	_factoryCntl(1);
 551  0125 a10a          	cp	a,#10
 552  0127 2604          	jrne	L151
 555  0129 a601          	ld	a,#1
 558  012b 2026          	jp	LC001
 559  012d               L151:
 560                     ; 673 	else if( _fs == 11 )	_factoryCntl(2);
 562  012d a10b          	cp	a,#11
 563  012f 2604          	jrne	L551
 566  0131 a602          	ld	a,#2
 569  0133 201e          	jp	LC001
 570  0135               L551:
 571                     ; 674 	else if( _fs == 12 )	_factoryCntl(3);
 573  0135 a10c          	cp	a,#12
 574  0137 2604          	jrne	L161
 577  0139 a603          	ld	a,#3
 580  013b 2016          	jp	LC001
 581  013d               L161:
 582                     ; 675 	else if( _fs == 13 )	_factoryCntl(4);
 584  013d a10d          	cp	a,#13
 585  013f 2604          	jrne	L561
 588  0141 a604          	ld	a,#4
 591  0143 200e          	jp	LC001
 592  0145               L561:
 593                     ; 676 	else if( _fs == 14 )	_factoryCntl(5);
 595  0145 a10e          	cp	a,#14
 596  0147 2604          	jrne	L171
 599  0149 a605          	ld	a,#5
 602  014b 2006          	jp	LC001
 603  014d               L171:
 604                     ; 677 	else if( _fs == 15 )	_factoryCntl(6);
 606  014d a10f          	cp	a,#15
 607  014f 2605          	jrne	L17
 610  0151 a606          	ld	a,#6
 611  0153               LC001:
 612  0153 cd0000        	call	__factoryCntl
 614  0156               L17:
 615                     ; 679 	if( (__timer100ms%2) == __lcdi )
 617  0156 c60000        	ld	a,___timer100ms
 618  0159 a401          	and	a,#1
 619  015b c10003        	cp	a,___lcdi
 620  015e 262c          	jrne	L771
 621                     ; 681 		__lcdi = __timer100ms%2;
 623  0160 c60000        	ld	a,___timer100ms
 624  0163 a401          	and	a,#1
 625  0165 c70003        	ld	___lcdi,a
 626                     ; 682 		if( __lcd == 0 )
 628  0168 c60002        	ld	a,___lcd
 629  016b 2613          	jrne	L102
 630                     ; 684 			__lcd = 1;
 632  016d 35010002      	mov	___lcd,#1
 633                     ; 685 			_backlight++;
 635  0171 725c0000      	inc	__backlight
 636                     ; 686 			if( _backlight == BACKLIGHT_MAX_LEVEL )
 638  0175 c60000        	ld	a,__backlight
 639  0178 a160          	cp	a,#96
 640  017a 2604          	jrne	L102
 641                     ; 687 				_backlight = 12;
 643  017c 350c0000      	mov	__backlight,#12
 644  0180               L102:
 645                     ; 689 		i = adcGet(1);
 647  0180 a601          	ld	a,#1
 648  0182 cd0000        	call	_adcGet
 650  0185 6b01          	ld	(OFST-1,sp),a
 652                     ; 690 		ui_disp_temp_setup(i);
 654  0187 cd0000        	call	_ui_disp_temp_setup
 657  018a 2004          	jra	L502
 658  018c               L771:
 659                     ; 693 		__lcd = 0;
 661  018c 725f0002      	clr	___lcd
 662  0190               L502:
 663                     ; 695 	factory2wire();
 665  0190 cd0000        	call	_factory2wire
 667                     ; 696 }
 670  0193 85            	popw	x
 671  0194 81            	ret	
 705                     ; 841 uint8_t factory(uint8_t mode)
 705                     ; 842 {
 706                     .text:	section	.text,new
 707  0000               _factory:
 711                     ; 843 	timerCalc();
 713  0000 cd0000        	call	_timerCalc
 715                     ; 855 	factoryDr();
 718                     ; 861 }
 721  0003 cc0000        	jp	_factoryDr
 781                     	xdef	_factory
 782                     	xdef	_factoryDr
 783                     	xref	__tctimer100ms
 784                     	xref	__uart1_rx_tail
 785                     	xref	__uart1_rx_head
 786                     	xref	_beepSet
 787                     	xref	__touchKey
 788                     	xref	__tcKey
 789                     	xref	_tci
 790                     	xref	_tc
 791                     	xref	__backlight
 792                     	xdef	__key_first
 793                     	xdef	___lcdi
 794                     	xdef	___lcd
 795                     	xref	_lcd_disp_all
 796                     	xref	_ui_disp_temp_setup
 797                     	xref	_lcd_clear
 798                     	xdef	__factoryCntl
 799                     	xdef	_factory2wire
 800                     	xdef	__fs2
 801                     	xdef	__fs
 802                     	switch	.bss
 803  0000               ___f:
 804  0000 000000000000  	ds.b	8
 805                     	xdef	___f
 806                     	xref	_lcd_disp_n
 807                     	xref	_timerCalc
 808                     	xref	___timer1s
 809                     	xref	___timer100ms
 810                     	xref	_uart1_get
 811                     	xref	_iouart_getBuffer
 812                     	xref	_iouart_Ready
 813                     	xref	__io_tail
 814                     	xref	__io_head
 815                     	xref	_iouart_Pkt_Start
 816                     	xref	_iouart_Set_Packet
 817                     	xref	_adcGet
 837                     	end
