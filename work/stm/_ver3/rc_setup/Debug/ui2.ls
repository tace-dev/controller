   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  60                     ; 5 void	ui_disp_clear_tSetup(uint8_t i)
  60                     ; 6 {
  62                     .text:	section	.text,new
  63  0000               _ui_disp_clear_tSetup:
  65  0000 88            	push	a
  66       00000000      OFST:	set	0
  69                     ; 7 	lcd_clear_npos(2, 0);
  71  0001 ae0200        	ldw	x,#512
  72  0004 cd0000        	call	_lcd_clear_npos
  74                     ; 8 	lcd_clear_npos(3, 0);
  76  0007 ae0300        	ldw	x,#768
  77  000a cd0000        	call	_lcd_clear_npos
  79                     ; 9 	LCD_BIT_CLEAR(bS3);
  81  000d c60008        	ld	a,_iLF_DEF+8
  82  0010 5f            	clrw	x
  83  0011 97            	ld	xl,a
  84  0012 c60008        	ld	a,_bLF_DEF+8
  85  0015 43            	cpl	a
  86  0016 d4540c        	and	a,(21516,x)
  87  0019 d7540c        	ld	(21516,x),a
  88                     ; 10 	LCD_BIT_CLEAR(bC2);
  90  001c c6001b        	ld	a,_iLF_DEF+27
  91  001f 5f            	clrw	x
  92  0020 97            	ld	xl,a
  93  0021 c6001b        	ld	a,_bLF_DEF+27
  94  0024 43            	cpl	a
  95  0025 d4540c        	and	a,(21516,x)
  96  0028 d7540c        	ld	(21516,x),a
  97                     ; 11 	LCD_BIT_CLEAR(bT3);
  99  002b c6003b        	ld	a,_iLF_DEF+59
 100  002e 5f            	clrw	x
 101  002f 97            	ld	xl,a
 102  0030 c6003b        	ld	a,_bLF_DEF+59
 103  0033 43            	cpl	a
 104  0034 d4540c        	and	a,(21516,x)
 105  0037 d7540c        	ld	(21516,x),a
 106                     ; 12 	LCD_BIT_CLEAR(bT4);
 108  003a c6002b        	ld	a,_iLF_DEF+43
 109  003d 5f            	clrw	x
 110  003e 97            	ld	xl,a
 111  003f c6002b        	ld	a,_bLF_DEF+43
 112  0042 43            	cpl	a
 113  0043 d4540c        	and	a,(21516,x)
 114  0046 d7540c        	ld	(21516,x),a
 115                     ; 13 	if (i == 1) {
 117  0049 7b01          	ld	a,(OFST+1,sp)
 118  004b a101          	cp	a,#1
 119  004d 262b          	jrne	L52
 120                     ; 14 		LCD_BIT_CLEAR(bCOL);
 122  004f c60016        	ld	a,_iLF_DEF+22
 123  0052 5f            	clrw	x
 124  0053 97            	ld	xl,a
 125  0054 c60016        	ld	a,_bLF_DEF+22
 126  0057 43            	cpl	a
 127  0058 d4540c        	and	a,(21516,x)
 128  005b d7540c        	ld	(21516,x),a
 129                     ; 15 		LCD_BIT_SET(bS1);
 131  005e c60003        	ld	a,_iLF_DEF+3
 132  0061 5f            	clrw	x
 133  0062 97            	ld	xl,a
 134  0063 d6540c        	ld	a,(21516,x)
 135  0066 ca0003        	or	a,_bLF_DEF+3
 136  0069 d7540c        	ld	(21516,x),a
 137                     ; 16 		LCD_BIT_SET(bC1);
 139  006c c60006        	ld	a,_iLF_DEF+6
 140  006f 5f            	clrw	x
 141  0070 97            	ld	xl,a
 142  0071 d6540c        	ld	a,(21516,x)
 143  0074 ca0006        	or	a,_bLF_DEF+6
 144  0077 d7540c        	ld	(21516,x),a
 145  007a               L52:
 146                     ; 18 }
 149  007a 84            	pop	a
 150  007b 81            	ret
 184                     ; 20 void	ui_disp_set_tSetup(uint8_t i)
 184                     ; 21 {
 185                     .text:	section	.text,new
 186  0000               _ui_disp_set_tSetup:
 190                     ; 22 	LCD_BIT_SET(bS3);
 192  0000 c60008        	ld	a,_iLF_DEF+8
 193  0003 5f            	clrw	x
 194  0004 97            	ld	xl,a
 195  0005 d6540c        	ld	a,(21516,x)
 196  0008 ca0008        	or	a,_bLF_DEF+8
 197  000b d7540c        	ld	(21516,x),a
 198                     ; 23 	LCD_BIT_SET(bC2);
 200  000e c6001b        	ld	a,_iLF_DEF+27
 201  0011 5f            	clrw	x
 202  0012 97            	ld	xl,a
 203  0013 d6540c        	ld	a,(21516,x)
 204  0016 ca001b        	or	a,_bLF_DEF+27
 205  0019 d7540c        	ld	(21516,x),a
 206                     ; 24 }
 209  001c 81            	ret
 243                     ; 26 void	ui_disp_temp_c(uint8_t i)
 243                     ; 27 {
 244                     .text:	section	.text,new
 245  0000               _ui_disp_temp_c:
 249                     ; 28 	if( i == 0 )
 251  0000 4d            	tnz	a
 252  0001 2620          	jrne	L75
 253                     ; 30 		LCD_BIT_CLEAR(bC1);
 255  0003 c60006        	ld	a,_iLF_DEF+6
 256  0006 5f            	clrw	x
 257  0007 97            	ld	xl,a
 258  0008 c60006        	ld	a,_bLF_DEF+6
 259  000b 43            	cpl	a
 260  000c d4540c        	and	a,(21516,x)
 261  000f d7540c        	ld	(21516,x),a
 262                     ; 31 		LCD_BIT_CLEAR(bC2);
 264  0012 c6001b        	ld	a,_iLF_DEF+27
 265  0015 5f            	clrw	x
 266  0016 97            	ld	xl,a
 267  0017 c6001b        	ld	a,_bLF_DEF+27
 268  001a 43            	cpl	a
 269  001b d4540c        	and	a,(21516,x)
 270  001e d7540c        	ld	(21516,x),a
 272  0021 201c          	jra	L16
 273  0023               L75:
 274                     ; 35 		LCD_BIT_SET(bC1);
 276  0023 c60006        	ld	a,_iLF_DEF+6
 277  0026 5f            	clrw	x
 278  0027 97            	ld	xl,a
 279  0028 d6540c        	ld	a,(21516,x)
 280  002b ca0006        	or	a,_bLF_DEF+6
 281  002e d7540c        	ld	(21516,x),a
 282                     ; 36 		LCD_BIT_SET(bC2);
 284  0031 c6001b        	ld	a,_iLF_DEF+27
 285  0034 5f            	clrw	x
 286  0035 97            	ld	xl,a
 287  0036 d6540c        	ld	a,(21516,x)
 288  0039 ca001b        	or	a,_bLF_DEF+27
 289  003c d7540c        	ld	(21516,x),a
 290  003f               L16:
 291                     ; 38 }
 294  003f 81            	ret
 329                     ; 40 void	ui_disp_temp_mark(uint8_t i)
 329                     ; 41 {
 330                     .text:	section	.text,new
 331  0000               _ui_disp_temp_mark:
 333  0000 88            	push	a
 334       00000000      OFST:	set	0
 337                     ; 42 	if( i == 0 )
 339  0001 4d            	tnz	a
 340  0002 2620          	jrne	L77
 341                     ; 44 		LCD_BIT_CLEAR(bS1);
 343  0004 c60003        	ld	a,_iLF_DEF+3
 344  0007 5f            	clrw	x
 345  0008 97            	ld	xl,a
 346  0009 c60003        	ld	a,_bLF_DEF+3
 347  000c 43            	cpl	a
 348  000d d4540c        	and	a,(21516,x)
 349  0010 d7540c        	ld	(21516,x),a
 350                     ; 45 		LCD_BIT_CLEAR(bS3);
 352  0013 c60008        	ld	a,_iLF_DEF+8
 353  0016 5f            	clrw	x
 354  0017 97            	ld	xl,a
 355  0018 c60008        	ld	a,_bLF_DEF+8
 356  001b 43            	cpl	a
 357  001c d4540c        	and	a,(21516,x)
 358  001f d7540c        	ld	(21516,x),a
 360  0022 202b          	jra	L101
 361  0024               L77:
 362                     ; 49 		LCD_BIT_CLEAR(bCOL);
 364  0024 c60016        	ld	a,_iLF_DEF+22
 365  0027 5f            	clrw	x
 366  0028 97            	ld	xl,a
 367  0029 c60016        	ld	a,_bLF_DEF+22
 368  002c 43            	cpl	a
 369  002d d4540c        	and	a,(21516,x)
 370  0030 d7540c        	ld	(21516,x),a
 371                     ; 50 		LCD_BIT_SET(bS1);
 373  0033 c60003        	ld	a,_iLF_DEF+3
 374  0036 5f            	clrw	x
 375  0037 97            	ld	xl,a
 376  0038 d6540c        	ld	a,(21516,x)
 377  003b ca0003        	or	a,_bLF_DEF+3
 378  003e d7540c        	ld	(21516,x),a
 379                     ; 51 		LCD_BIT_SET(bS3);
 381  0041 c60008        	ld	a,_iLF_DEF+8
 382  0044 5f            	clrw	x
 383  0045 97            	ld	xl,a
 384  0046 d6540c        	ld	a,(21516,x)
 385  0049 ca0008        	or	a,_bLF_DEF+8
 386  004c d7540c        	ld	(21516,x),a
 387  004f               L101:
 388                     ; 53 	ui_disp_temp_c(i);
 390  004f 7b01          	ld	a,(OFST+1,sp)
 391  0051 cd0000        	call	_ui_disp_temp_c
 393                     ; 54 	LCD_BIT_CLEAR(bCOL);
 395  0054 c60016        	ld	a,_iLF_DEF+22
 396  0057 5f            	clrw	x
 397  0058 97            	ld	xl,a
 398  0059 c60016        	ld	a,_bLF_DEF+22
 399  005c 43            	cpl	a
 400  005d d4540c        	and	a,(21516,x)
 401  0060 d7540c        	ld	(21516,x),a
 402                     ; 55 }
 405  0063 84            	pop	a
 406  0064 81            	ret
 455                     ; 57 void	ui_disp_temp_setup(uint8_t i)
 455                     ; 58 {
 456                     .text:	section	.text,new
 457  0000               _ui_disp_temp_setup:
 459  0000 89            	pushw	x
 460       00000002      OFST:	set	2
 463                     ; 60 	a = i/2;
 465  0001 5f            	clrw	x
 466  0002 97            	ld	xl,a
 467  0003 57            	sraw	x
 468  0004 01            	rrwa	x,a
 469  0005 6b02          	ld	(OFST+0,sp),a
 470  0007 02            	rlwa	x,a
 471                     ; 61 	b = i%2;
 473  0008 a401          	and	a,#1
 474  000a 6b01          	ld	(OFST-1,sp),a
 475                     ; 62 	lcd_disp_n(2, a/10);
 477  000c 7b02          	ld	a,(OFST+0,sp)
 478  000e 5f            	clrw	x
 479  000f 97            	ld	xl,a
 480  0010 a60a          	ld	a,#10
 481  0012 62            	div	x,a
 482  0013 9f            	ld	a,xl
 483  0014 97            	ld	xl,a
 484  0015 a602          	ld	a,#2
 485  0017 95            	ld	xh,a
 486  0018 cd0000        	call	_lcd_disp_n
 488                     ; 63 	lcd_disp_n(3, a%10);
 490  001b 7b02          	ld	a,(OFST+0,sp)
 491  001d 5f            	clrw	x
 492  001e 97            	ld	xl,a
 493  001f a60a          	ld	a,#10
 494  0021 62            	div	x,a
 495  0022 5f            	clrw	x
 496  0023 97            	ld	xl,a
 497  0024 9f            	ld	a,xl
 498  0025 97            	ld	xl,a
 499  0026 a603          	ld	a,#3
 500  0028 95            	ld	xh,a
 501  0029 cd0000        	call	_lcd_disp_n
 503                     ; 64 	if( b != 0 )
 505  002c 0d01          	tnz	(OFST-1,sp)
 506  002e 271e          	jreq	L321
 507                     ; 66 		LCD_BIT_SET(bT3);
 509  0030 c6003b        	ld	a,_iLF_DEF+59
 510  0033 5f            	clrw	x
 511  0034 97            	ld	xl,a
 512  0035 d6540c        	ld	a,(21516,x)
 513  0038 ca003b        	or	a,_bLF_DEF+59
 514  003b d7540c        	ld	(21516,x),a
 515                     ; 67 		LCD_BIT_SET(bT4);
 517  003e c6002b        	ld	a,_iLF_DEF+43
 518  0041 5f            	clrw	x
 519  0042 97            	ld	xl,a
 520  0043 d6540c        	ld	a,(21516,x)
 521  0046 ca002b        	or	a,_bLF_DEF+43
 522  0049 d7540c        	ld	(21516,x),a
 524  004c 201e          	jra	L521
 525  004e               L321:
 526                     ; 71 		LCD_BIT_CLEAR(bT3);
 528  004e c6003b        	ld	a,_iLF_DEF+59
 529  0051 5f            	clrw	x
 530  0052 97            	ld	xl,a
 531  0053 c6003b        	ld	a,_bLF_DEF+59
 532  0056 43            	cpl	a
 533  0057 d4540c        	and	a,(21516,x)
 534  005a d7540c        	ld	(21516,x),a
 535                     ; 72 		LCD_BIT_CLEAR(bT4);
 537  005d c6002b        	ld	a,_iLF_DEF+43
 538  0060 5f            	clrw	x
 539  0061 97            	ld	xl,a
 540  0062 c6002b        	ld	a,_bLF_DEF+43
 541  0065 43            	cpl	a
 542  0066 d4540c        	and	a,(21516,x)
 543  0069 d7540c        	ld	(21516,x),a
 544  006c               L521:
 545                     ; 74 }
 548  006c 85            	popw	x
 549  006d 81            	ret
 598                     ; 76 void	ui_disp_temp_curr(uint8_t i)
 598                     ; 77 {
 599                     .text:	section	.text,new
 600  0000               _ui_disp_temp_curr:
 602  0000 89            	pushw	x
 603       00000002      OFST:	set	2
 606                     ; 79 	a = i/2;
 608  0001 5f            	clrw	x
 609  0002 97            	ld	xl,a
 610  0003 57            	sraw	x
 611  0004 01            	rrwa	x,a
 612  0005 6b02          	ld	(OFST+0,sp),a
 613  0007 02            	rlwa	x,a
 614                     ; 80 	b = i%2;
 616  0008 a401          	and	a,#1
 617  000a 6b01          	ld	(OFST-1,sp),a
 618                     ; 81 	lcd_disp_n(0, a/10);
 620  000c 7b02          	ld	a,(OFST+0,sp)
 621  000e 5f            	clrw	x
 622  000f 97            	ld	xl,a
 623  0010 a60a          	ld	a,#10
 624  0012 62            	div	x,a
 625  0013 9f            	ld	a,xl
 626  0014 97            	ld	xl,a
 627  0015 4f            	clr	a
 628  0016 95            	ld	xh,a
 629  0017 cd0000        	call	_lcd_disp_n
 631                     ; 82 	lcd_disp_n(1, a%10);
 633  001a 7b02          	ld	a,(OFST+0,sp)
 634  001c 5f            	clrw	x
 635  001d 97            	ld	xl,a
 636  001e a60a          	ld	a,#10
 637  0020 62            	div	x,a
 638  0021 5f            	clrw	x
 639  0022 97            	ld	xl,a
 640  0023 9f            	ld	a,xl
 641  0024 97            	ld	xl,a
 642  0025 a601          	ld	a,#1
 643  0027 95            	ld	xh,a
 644  0028 cd0000        	call	_lcd_disp_n
 646                     ; 83 	if( b != 0 )
 648  002b 0d01          	tnz	(OFST-1,sp)
 649  002d 271e          	jreq	L741
 650                     ; 85 		LCD_BIT_SET(bT1);
 652  002f c60036        	ld	a,_iLF_DEF+54
 653  0032 5f            	clrw	x
 654  0033 97            	ld	xl,a
 655  0034 d6540c        	ld	a,(21516,x)
 656  0037 ca0036        	or	a,_bLF_DEF+54
 657  003a d7540c        	ld	(21516,x),a
 658                     ; 86 		LCD_BIT_SET(bT2);
 660  003d c60026        	ld	a,_iLF_DEF+38
 661  0040 5f            	clrw	x
 662  0041 97            	ld	xl,a
 663  0042 d6540c        	ld	a,(21516,x)
 664  0045 ca0026        	or	a,_bLF_DEF+38
 665  0048 d7540c        	ld	(21516,x),a
 667  004b 201e          	jra	L151
 668  004d               L741:
 669                     ; 90 		LCD_BIT_CLEAR(bT1);
 671  004d c60036        	ld	a,_iLF_DEF+54
 672  0050 5f            	clrw	x
 673  0051 97            	ld	xl,a
 674  0052 c60036        	ld	a,_bLF_DEF+54
 675  0055 43            	cpl	a
 676  0056 d4540c        	and	a,(21516,x)
 677  0059 d7540c        	ld	(21516,x),a
 678                     ; 91 		LCD_BIT_CLEAR(bT2);
 680  005c c60026        	ld	a,_iLF_DEF+38
 681  005f 5f            	clrw	x
 682  0060 97            	ld	xl,a
 683  0061 c60026        	ld	a,_bLF_DEF+38
 684  0064 43            	cpl	a
 685  0065 d4540c        	and	a,(21516,x)
 686  0068 d7540c        	ld	(21516,x),a
 687  006b               L151:
 688                     ; 93 }
 691  006b 85            	popw	x
 692  006c 81            	ret
 730                     ; 96 void	ui_disp_repeat_setup(uint8_t i)
 730                     ; 97 {
 731                     .text:	section	.text,new
 732  0000               _ui_disp_repeat_setup:
 734  0000 88            	push	a
 735       00000000      OFST:	set	0
 738                     ; 98 	ui_disp_temp_mark(0);
 740  0001 4f            	clr	a
 741  0002 cd0000        	call	_ui_disp_temp_mark
 743                     ; 99 	ui_disp_temp_c(0);
 745  0005 4f            	clr	a
 746  0006 cd0000        	call	_ui_disp_temp_c
 748                     ; 100 	LCD_BIT_CLEAR(bT1);
 750  0009 c60036        	ld	a,_iLF_DEF+54
 751  000c 5f            	clrw	x
 752  000d 97            	ld	xl,a
 753  000e c60036        	ld	a,_bLF_DEF+54
 754  0011 43            	cpl	a
 755  0012 d4540c        	and	a,(21516,x)
 756  0015 d7540c        	ld	(21516,x),a
 757                     ; 101 	LCD_BIT_CLEAR(bT2);
 759  0018 c60026        	ld	a,_iLF_DEF+38
 760  001b 5f            	clrw	x
 761  001c 97            	ld	xl,a
 762  001d c60026        	ld	a,_bLF_DEF+38
 763  0020 43            	cpl	a
 764  0021 d4540c        	and	a,(21516,x)
 765  0024 d7540c        	ld	(21516,x),a
 766                     ; 102 	LCD_BIT_CLEAR(bT3);
 768  0027 c6003b        	ld	a,_iLF_DEF+59
 769  002a 5f            	clrw	x
 770  002b 97            	ld	xl,a
 771  002c c6003b        	ld	a,_bLF_DEF+59
 772  002f 43            	cpl	a
 773  0030 d4540c        	and	a,(21516,x)
 774  0033 d7540c        	ld	(21516,x),a
 775                     ; 103 	LCD_BIT_CLEAR(bT4);
 777  0036 c6002b        	ld	a,_iLF_DEF+43
 778  0039 5f            	clrw	x
 779  003a 97            	ld	xl,a
 780  003b c6002b        	ld	a,_bLF_DEF+43
 781  003e 43            	cpl	a
 782  003f d4540c        	and	a,(21516,x)
 783  0042 d7540c        	ld	(21516,x),a
 784                     ; 104 	LCD_BIT_SET(bCOL);
 786  0045 c60016        	ld	a,_iLF_DEF+22
 787  0048 5f            	clrw	x
 788  0049 97            	ld	xl,a
 789  004a d6540c        	ld	a,(21516,x)
 790  004d ca0016        	or	a,_bLF_DEF+22
 791  0050 d7540c        	ld	(21516,x),a
 792                     ; 106 	lcd_disp_n(0, i/10);
 794  0053 7b01          	ld	a,(OFST+1,sp)
 795  0055 5f            	clrw	x
 796  0056 97            	ld	xl,a
 797  0057 a60a          	ld	a,#10
 798  0059 62            	div	x,a
 799  005a 9f            	ld	a,xl
 800  005b 97            	ld	xl,a
 801  005c 4f            	clr	a
 802  005d 95            	ld	xh,a
 803  005e cd0000        	call	_lcd_disp_n
 805                     ; 107 	lcd_disp_n(1, i%10);
 807  0061 7b01          	ld	a,(OFST+1,sp)
 808  0063 5f            	clrw	x
 809  0064 97            	ld	xl,a
 810  0065 a60a          	ld	a,#10
 811  0067 62            	div	x,a
 812  0068 5f            	clrw	x
 813  0069 97            	ld	xl,a
 814  006a 9f            	ld	a,xl
 815  006b 97            	ld	xl,a
 816  006c a601          	ld	a,#1
 817  006e 95            	ld	xh,a
 818  006f cd0000        	call	_lcd_disp_n
 820                     ; 108 	lcd_disp_n(2, (90-i)/10);
 822  0072 a600          	ld	a,#0
 823  0074 97            	ld	xl,a
 824  0075 a65a          	ld	a,#90
 825  0077 1001          	sub	a,(OFST+1,sp)
 826  0079 2401          	jrnc	L22
 827  007b 5a            	decw	x
 828  007c               L22:
 829  007c 02            	rlwa	x,a
 830  007d a60a          	ld	a,#10
 831  007f cd0000        	call	c_sdivx
 833  0082 9f            	ld	a,xl
 834  0083 97            	ld	xl,a
 835  0084 a602          	ld	a,#2
 836  0086 95            	ld	xh,a
 837  0087 cd0000        	call	_lcd_disp_n
 839                     ; 109 	lcd_disp_n(3, (90-i)%10);
 841  008a a600          	ld	a,#0
 842  008c 97            	ld	xl,a
 843  008d a65a          	ld	a,#90
 844  008f 1001          	sub	a,(OFST+1,sp)
 845  0091 2401          	jrnc	L42
 846  0093 5a            	decw	x
 847  0094               L42:
 848  0094 02            	rlwa	x,a
 849  0095 a60a          	ld	a,#10
 850  0097 cd0000        	call	c_smodx
 852  009a 9f            	ld	a,xl
 853  009b 97            	ld	xl,a
 854  009c a603          	ld	a,#3
 855  009e 95            	ld	xh,a
 856  009f cd0000        	call	_lcd_disp_n
 858                     ; 110 }
 861  00a2 84            	pop	a
 862  00a3 81            	ret
 914                     ; 112 void	ui_disp_reserve_setup(uint8_t i)
 914                     ; 113 {
 915                     .text:	section	.text,new
 916  0000               _ui_disp_reserve_setup:
 918  0000 88            	push	a
 919  0001 89            	pushw	x
 920       00000002      OFST:	set	2
 923                     ; 115 	ui_disp_temp_mark(0);
 925  0002 4f            	clr	a
 926  0003 cd0000        	call	_ui_disp_temp_mark
 928                     ; 116 	ui_disp_temp_c(0);
 930  0006 4f            	clr	a
 931  0007 cd0000        	call	_ui_disp_temp_c
 933                     ; 117 	LCD_BIT_CLEAR(bT1);
 935  000a c60036        	ld	a,_iLF_DEF+54
 936  000d 5f            	clrw	x
 937  000e 97            	ld	xl,a
 938  000f c60036        	ld	a,_bLF_DEF+54
 939  0012 43            	cpl	a
 940  0013 d4540c        	and	a,(21516,x)
 941  0016 d7540c        	ld	(21516,x),a
 942                     ; 118 	LCD_BIT_CLEAR(bT2);
 944  0019 c60026        	ld	a,_iLF_DEF+38
 945  001c 5f            	clrw	x
 946  001d 97            	ld	xl,a
 947  001e c60026        	ld	a,_bLF_DEF+38
 948  0021 43            	cpl	a
 949  0022 d4540c        	and	a,(21516,x)
 950  0025 d7540c        	ld	(21516,x),a
 951                     ; 119 	LCD_BIT_CLEAR(bT3);
 953  0028 c6003b        	ld	a,_iLF_DEF+59
 954  002b 5f            	clrw	x
 955  002c 97            	ld	xl,a
 956  002d c6003b        	ld	a,_bLF_DEF+59
 957  0030 43            	cpl	a
 958  0031 d4540c        	and	a,(21516,x)
 959  0034 d7540c        	ld	(21516,x),a
 960                     ; 120 	LCD_BIT_CLEAR(bT4);
 962  0037 c6002b        	ld	a,_iLF_DEF+43
 963  003a 5f            	clrw	x
 964  003b 97            	ld	xl,a
 965  003c c6002b        	ld	a,_bLF_DEF+43
 966  003f 43            	cpl	a
 967  0040 d4540c        	and	a,(21516,x)
 968  0043 d7540c        	ld	(21516,x),a
 969                     ; 121 	LCD_BIT_SET(bCOL);
 971  0046 c60016        	ld	a,_iLF_DEF+22
 972  0049 5f            	clrw	x
 973  004a 97            	ld	xl,a
 974  004b d6540c        	ld	a,(21516,x)
 975  004e ca0016        	or	a,_bLF_DEF+22
 976  0051 d7540c        	ld	(21516,x),a
 977                     ; 123 	a = i/2;
 979  0054 7b03          	ld	a,(OFST+1,sp)
 980  0056 5f            	clrw	x
 981  0057 97            	ld	xl,a
 982  0058 57            	sraw	x
 983  0059 01            	rrwa	x,a
 984  005a 6b02          	ld	(OFST+0,sp),a
 985  005c 02            	rlwa	x,a
 986                     ; 124 	b = i%2;
 988  005d 7b03          	ld	a,(OFST+1,sp)
 989  005f a401          	and	a,#1
 990  0061 6b01          	ld	(OFST-1,sp),a
 991                     ; 125 	lcd_disp_n(0, a/10);
 993  0063 7b02          	ld	a,(OFST+0,sp)
 994  0065 ae000a        	ldw	x,#10
 995  0068 51            	exgw	x,y
 996  0069 5f            	clrw	x
 997  006a 4d            	tnz	a
 998  006b 2a01          	jrpl	L03
 999  006d 5a            	decw	x
1000  006e               L03:
1001  006e 02            	rlwa	x,a
1002  006f cd0000        	call	c_idiv
1004  0072 9f            	ld	a,xl
1005  0073 97            	ld	xl,a
1006  0074 4f            	clr	a
1007  0075 95            	ld	xh,a
1008  0076 cd0000        	call	_lcd_disp_n
1010                     ; 126 	lcd_disp_n(1, a%10);
1012  0079 7b02          	ld	a,(OFST+0,sp)
1013  007b ae000a        	ldw	x,#10
1014  007e 51            	exgw	x,y
1015  007f 5f            	clrw	x
1016  0080 4d            	tnz	a
1017  0081 2a01          	jrpl	L23
1018  0083 5a            	decw	x
1019  0084               L23:
1020  0084 02            	rlwa	x,a
1021  0085 cd0000        	call	c_idiv
1023  0088 909f          	ld	a,yl
1024  008a 97            	ld	xl,a
1025  008b a601          	ld	a,#1
1026  008d 95            	ld	xh,a
1027  008e cd0000        	call	_lcd_disp_n
1029                     ; 127 	lcd_disp_n(2, b==0 ? 0 : 3);
1031  0091 0d01          	tnz	(OFST-1,sp)
1032  0093 2603          	jrne	L43
1033  0095 4f            	clr	a
1034  0096 2002          	jra	L63
1035  0098               L43:
1036  0098 a603          	ld	a,#3
1037  009a               L63:
1038  009a 97            	ld	xl,a
1039  009b a602          	ld	a,#2
1040  009d 95            	ld	xh,a
1041  009e cd0000        	call	_lcd_disp_n
1043                     ; 128 	lcd_disp_n(3, 0);
1045  00a1 ae0300        	ldw	x,#768
1046  00a4 cd0000        	call	_lcd_disp_n
1048                     ; 129 }
1051  00a7 5b03          	addw	sp,#3
1052  00a9 81            	ret
1065                     	xdef	_ui_disp_reserve_setup
1066                     	xdef	_ui_disp_repeat_setup
1067                     	xdef	_ui_disp_set_tSetup
1068                     	xdef	_ui_disp_clear_tSetup
1069                     	xdef	_ui_disp_temp_mark
1070                     	xdef	_ui_disp_temp_c
1071                     	xdef	_ui_disp_temp_curr
1072                     	xdef	_ui_disp_temp_setup
1073                     	xref	_lcd_clear_npos
1074                     	xref	_lcd_disp_n
1075                     	xref	_iLF_DEF
1076                     	xref	_bLF_DEF
1077                     	xref.b	c_x
1096                     	xref	c_idiv
1097                     	xref	c_smodx
1098                     	xref	c_sdivx
1099                     	end
