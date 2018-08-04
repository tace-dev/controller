   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  62                     ; 5 void	ui_disp_clear_tSetup(uint8_t i)
  62                     ; 6 {
  64                     	switch	.text
  65  0000               _ui_disp_clear_tSetup:
  67  0000 88            	push	a
  68       00000000      OFST:	set	0
  71                     ; 7 	lcd_clear_npos(2, 0);
  73  0001 ae0200        	ldw	x,#512
  74  0004 cd0000        	call	_lcd_clear_npos
  76                     ; 8 	lcd_clear_npos(3, 0);
  78  0007 ae0300        	ldw	x,#768
  79  000a cd0000        	call	_lcd_clear_npos
  81                     ; 9 	LCD_BIT_CLEAR(bS3);
  83  000d c60008        	ld	a,_iLF_DEF+8
  84  0010 5f            	clrw	x
  85  0011 97            	ld	xl,a
  86  0012 c60008        	ld	a,_bLF_DEF+8
  87  0015 ad4b          	call	LC001
  88                     ; 10 	LCD_BIT_CLEAR(bC2);
  90  0017 c6001b        	ld	a,_iLF_DEF+27
  91  001a 5f            	clrw	x
  92  001b 97            	ld	xl,a
  93  001c c6001b        	ld	a,_bLF_DEF+27
  94  001f ad41          	call	LC001
  95                     ; 11 	LCD_BIT_CLEAR(bT3);
  97  0021 c6003b        	ld	a,_iLF_DEF+59
  98  0024 5f            	clrw	x
  99  0025 97            	ld	xl,a
 100  0026 c6003b        	ld	a,_bLF_DEF+59
 101  0029 ad37          	call	LC001
 102                     ; 12 	LCD_BIT_CLEAR(bT4);
 104  002b c6002b        	ld	a,_iLF_DEF+43
 105  002e 5f            	clrw	x
 106  002f 97            	ld	xl,a
 107  0030 c6002b        	ld	a,_bLF_DEF+43
 108  0033 ad2d          	call	LC001
 109                     ; 13 	if (i == 1) {
 111  0035 7b01          	ld	a,(OFST+1,sp)
 112  0037 4a            	dec	a
 113  0038 2626          	jrne	L52
 114                     ; 14 		LCD_BIT_CLEAR(bCOL);
 116  003a c60016        	ld	a,_iLF_DEF+22
 117  003d 5f            	clrw	x
 118  003e 97            	ld	xl,a
 119  003f c60016        	ld	a,_bLF_DEF+22
 120  0042 ad1e          	call	LC001
 121                     ; 15 		LCD_BIT_SET(bS1);
 123  0044 c60003        	ld	a,_iLF_DEF+3
 124  0047 5f            	clrw	x
 125  0048 97            	ld	xl,a
 126  0049 d6540c        	ld	a,(21516,x)
 127  004c ca0003        	or	a,_bLF_DEF+3
 128  004f d7540c        	ld	(21516,x),a
 129                     ; 16 		LCD_BIT_SET(bC1);
 131  0052 c60006        	ld	a,_iLF_DEF+6
 132  0055 5f            	clrw	x
 133  0056 97            	ld	xl,a
 134  0057 d6540c        	ld	a,(21516,x)
 135  005a ca0006        	or	a,_bLF_DEF+6
 136  005d d7540c        	ld	(21516,x),a
 137  0060               L52:
 138                     ; 18 }
 141  0060 84            	pop	a
 142  0061 81            	ret	
 143  0062               LC001:
 144  0062 43            	cpl	a
 145  0063 d4540c        	and	a,(21516,x)
 146  0066 d7540c        	ld	(21516,x),a
 147  0069 81            	ret	
 181                     ; 20 void	ui_disp_set_tSetup(uint8_t i)
 181                     ; 21 {
 182                     	switch	.text
 183  006a               _ui_disp_set_tSetup:
 187                     ; 22 	LCD_BIT_SET(bS3);
 189  006a c60008        	ld	a,_iLF_DEF+8
 190  006d 5f            	clrw	x
 191  006e 97            	ld	xl,a
 192  006f d6540c        	ld	a,(21516,x)
 193  0072 ca0008        	or	a,_bLF_DEF+8
 194  0075 d7540c        	ld	(21516,x),a
 195                     ; 23 	LCD_BIT_SET(bC2);
 197  0078 c6001b        	ld	a,_iLF_DEF+27
 198  007b 5f            	clrw	x
 199  007c 97            	ld	xl,a
 200  007d d6540c        	ld	a,(21516,x)
 201  0080 ca001b        	or	a,_bLF_DEF+27
 202  0083 d7540c        	ld	(21516,x),a
 203                     ; 24 }
 206  0086 81            	ret	
 240                     ; 26 void	ui_disp_temp_c(uint8_t i)
 240                     ; 27 {
 241                     	switch	.text
 242  0087               _ui_disp_temp_c:
 246                     ; 28 	if( i == 0 )
 248  0087 4d            	tnz	a
 249  0088 261d          	jrne	L75
 250                     ; 30 		LCD_BIT_CLEAR(bC1);
 252  008a c60006        	ld	a,_iLF_DEF+6
 253  008d 5f            	clrw	x
 254  008e 97            	ld	xl,a
 255  008f c60006        	ld	a,_bLF_DEF+6
 256  0092 43            	cpl	a
 257  0093 d4540c        	and	a,(21516,x)
 258  0096 d7540c        	ld	(21516,x),a
 259                     ; 31 		LCD_BIT_CLEAR(bC2);
 261  0099 c6001b        	ld	a,_iLF_DEF+27
 262  009c 5f            	clrw	x
 263  009d 97            	ld	xl,a
 264  009e c6001b        	ld	a,_bLF_DEF+27
 265  00a1 43            	cpl	a
 266  00a2 d4540c        	and	a,(21516,x)
 268  00a5 2019          	jra	L16
 269  00a7               L75:
 270                     ; 35 		LCD_BIT_SET(bC1);
 272  00a7 c60006        	ld	a,_iLF_DEF+6
 273  00aa 5f            	clrw	x
 274  00ab 97            	ld	xl,a
 275  00ac d6540c        	ld	a,(21516,x)
 276  00af ca0006        	or	a,_bLF_DEF+6
 277  00b2 d7540c        	ld	(21516,x),a
 278                     ; 36 		LCD_BIT_SET(bC2);
 280  00b5 c6001b        	ld	a,_iLF_DEF+27
 281  00b8 5f            	clrw	x
 282  00b9 97            	ld	xl,a
 283  00ba d6540c        	ld	a,(21516,x)
 284  00bd ca001b        	or	a,_bLF_DEF+27
 285  00c0               L16:
 286  00c0 d7540c        	ld	(21516,x),a
 287                     ; 38 }
 290  00c3 81            	ret	
 325                     ; 40 void	ui_disp_temp_mark(uint8_t i)
 325                     ; 41 {
 326                     	switch	.text
 327  00c4               _ui_disp_temp_mark:
 329  00c4 88            	push	a
 330       00000000      OFST:	set	0
 333                     ; 42 	if( i == 0 )
 335  00c5 4d            	tnz	a
 336  00c6 261d          	jrne	L77
 337                     ; 44 		LCD_BIT_CLEAR(bS1);
 339  00c8 c60003        	ld	a,_iLF_DEF+3
 340  00cb 5f            	clrw	x
 341  00cc 97            	ld	xl,a
 342  00cd c60003        	ld	a,_bLF_DEF+3
 343  00d0 43            	cpl	a
 344  00d1 d4540c        	and	a,(21516,x)
 345  00d4 d7540c        	ld	(21516,x),a
 346                     ; 45 		LCD_BIT_CLEAR(bS3);
 348  00d7 c60008        	ld	a,_iLF_DEF+8
 349  00da 5f            	clrw	x
 350  00db 97            	ld	xl,a
 351  00dc c60008        	ld	a,_bLF_DEF+8
 352  00df 43            	cpl	a
 353  00e0 d4540c        	and	a,(21516,x)
 355  00e3 201b          	jra	L101
 356  00e5               L77:
 357                     ; 49 		LCD_BIT_CLEAR(bCOL);
 359  00e5 ad24          	call	LC002
 360                     ; 50 		LCD_BIT_SET(bS1);
 362  00e7 c60003        	ld	a,_iLF_DEF+3
 363  00ea 5f            	clrw	x
 364  00eb 97            	ld	xl,a
 365  00ec d6540c        	ld	a,(21516,x)
 366  00ef ca0003        	or	a,_bLF_DEF+3
 367  00f2 d7540c        	ld	(21516,x),a
 368                     ; 51 		LCD_BIT_SET(bS3);
 370  00f5 c60008        	ld	a,_iLF_DEF+8
 371  00f8 5f            	clrw	x
 372  00f9 97            	ld	xl,a
 373  00fa d6540c        	ld	a,(21516,x)
 374  00fd ca0008        	or	a,_bLF_DEF+8
 375  0100               L101:
 376  0100 d7540c        	ld	(21516,x),a
 377                     ; 53 	ui_disp_temp_c(i);
 379  0103 7b01          	ld	a,(OFST+1,sp)
 380  0105 ad80          	call	_ui_disp_temp_c
 382                     ; 54 	LCD_BIT_CLEAR(bCOL);
 384  0107 ad02          	call	LC002
 385                     ; 55 }
 388  0109 84            	pop	a
 389  010a 81            	ret	
 390  010b               LC002:
 391  010b c60016        	ld	a,_iLF_DEF+22
 392  010e 5f            	clrw	x
 393  010f 97            	ld	xl,a
 394  0110 c60016        	ld	a,_bLF_DEF+22
 395  0113 43            	cpl	a
 396  0114 d4540c        	and	a,(21516,x)
 397  0117 d7540c        	ld	(21516,x),a
 398  011a 81            	ret	
 447                     ; 57 void	ui_disp_temp_setup(uint8_t i)
 447                     ; 58 {
 448                     	switch	.text
 449  011b               _ui_disp_temp_setup:
 451  011b 89            	pushw	x
 452       00000002      OFST:	set	2
 455                     ; 60 	a = i/2;
 457  011c 5f            	clrw	x
 458  011d 97            	ld	xl,a
 459  011e 57            	sraw	x
 460  011f 01            	rrwa	x,a
 461  0120 6b02          	ld	(OFST+0,sp),a
 462  0122 02            	rlwa	x,a
 463                     ; 61 	b = i%2;
 465  0123 a401          	and	a,#1
 466  0125 6b01          	ld	(OFST-1,sp),a
 467                     ; 62 	lcd_disp_n(2, a/10);
 469  0127 5f            	clrw	x
 470  0128 7b02          	ld	a,(OFST+0,sp)
 471  012a 97            	ld	xl,a
 472  012b a60a          	ld	a,#10
 473  012d 62            	div	x,a
 474  012e a602          	ld	a,#2
 475  0130 95            	ld	xh,a
 476  0131 cd0000        	call	_lcd_disp_n
 478                     ; 63 	lcd_disp_n(3, a%10);
 480  0134 7b02          	ld	a,(OFST+0,sp)
 481  0136 5f            	clrw	x
 482  0137 97            	ld	xl,a
 483  0138 a60a          	ld	a,#10
 484  013a 62            	div	x,a
 485  013b 97            	ld	xl,a
 486  013c a603          	ld	a,#3
 487  013e 95            	ld	xh,a
 488  013f cd0000        	call	_lcd_disp_n
 490                     ; 64 	if( b != 0 )
 492  0142 7b01          	ld	a,(OFST-1,sp)
 493  0144 271b          	jreq	L321
 494                     ; 66 		LCD_BIT_SET(bT3);
 496  0146 c6003b        	ld	a,_iLF_DEF+59
 497  0149 5f            	clrw	x
 498  014a 97            	ld	xl,a
 499  014b d6540c        	ld	a,(21516,x)
 500  014e ca003b        	or	a,_bLF_DEF+59
 501  0151 d7540c        	ld	(21516,x),a
 502                     ; 67 		LCD_BIT_SET(bT4);
 504  0154 c6002b        	ld	a,_iLF_DEF+43
 505  0157 5f            	clrw	x
 506  0158 97            	ld	xl,a
 507  0159 d6540c        	ld	a,(21516,x)
 508  015c ca002b        	or	a,_bLF_DEF+43
 510  015f 201b          	jra	L521
 511  0161               L321:
 512                     ; 71 		LCD_BIT_CLEAR(bT3);
 514  0161 c6003b        	ld	a,_iLF_DEF+59
 515  0164 5f            	clrw	x
 516  0165 97            	ld	xl,a
 517  0166 c6003b        	ld	a,_bLF_DEF+59
 518  0169 43            	cpl	a
 519  016a d4540c        	and	a,(21516,x)
 520  016d d7540c        	ld	(21516,x),a
 521                     ; 72 		LCD_BIT_CLEAR(bT4);
 523  0170 c6002b        	ld	a,_iLF_DEF+43
 524  0173 5f            	clrw	x
 525  0174 97            	ld	xl,a
 526  0175 c6002b        	ld	a,_bLF_DEF+43
 527  0178 43            	cpl	a
 528  0179 d4540c        	and	a,(21516,x)
 529  017c               L521:
 530  017c d7540c        	ld	(21516,x),a
 531                     ; 74 }
 534  017f 85            	popw	x
 535  0180 81            	ret	
 584                     ; 76 void	ui_disp_temp_curr(uint8_t i)
 584                     ; 77 {
 585                     	switch	.text
 586  0181               _ui_disp_temp_curr:
 588  0181 89            	pushw	x
 589       00000002      OFST:	set	2
 592                     ; 79 	a = i/2;
 594  0182 5f            	clrw	x
 595  0183 97            	ld	xl,a
 596  0184 57            	sraw	x
 597  0185 01            	rrwa	x,a
 598  0186 6b02          	ld	(OFST+0,sp),a
 599  0188 02            	rlwa	x,a
 600                     ; 80 	b = i%2;
 602  0189 a401          	and	a,#1
 603  018b 6b01          	ld	(OFST-1,sp),a
 604                     ; 81 	lcd_disp_n(0, a/10);
 606  018d 5f            	clrw	x
 607  018e 7b02          	ld	a,(OFST+0,sp)
 608  0190 97            	ld	xl,a
 609  0191 a60a          	ld	a,#10
 610  0193 62            	div	x,a
 611  0194 4f            	clr	a
 612  0195 95            	ld	xh,a
 613  0196 cd0000        	call	_lcd_disp_n
 615                     ; 82 	lcd_disp_n(1, a%10);
 617  0199 7b02          	ld	a,(OFST+0,sp)
 618  019b 5f            	clrw	x
 619  019c 97            	ld	xl,a
 620  019d a60a          	ld	a,#10
 621  019f 62            	div	x,a
 622  01a0 97            	ld	xl,a
 623  01a1 a601          	ld	a,#1
 624  01a3 95            	ld	xh,a
 625  01a4 cd0000        	call	_lcd_disp_n
 627                     ; 83 	if( b != 0 )
 629  01a7 7b01          	ld	a,(OFST-1,sp)
 630  01a9 271b          	jreq	L741
 631                     ; 85 		LCD_BIT_SET(bT1);
 633  01ab c60036        	ld	a,_iLF_DEF+54
 634  01ae 5f            	clrw	x
 635  01af 97            	ld	xl,a
 636  01b0 d6540c        	ld	a,(21516,x)
 637  01b3 ca0036        	or	a,_bLF_DEF+54
 638  01b6 d7540c        	ld	(21516,x),a
 639                     ; 86 		LCD_BIT_SET(bT2);
 641  01b9 c60026        	ld	a,_iLF_DEF+38
 642  01bc 5f            	clrw	x
 643  01bd 97            	ld	xl,a
 644  01be d6540c        	ld	a,(21516,x)
 645  01c1 ca0026        	or	a,_bLF_DEF+38
 647  01c4 201b          	jra	L151
 648  01c6               L741:
 649                     ; 90 		LCD_BIT_CLEAR(bT1);
 651  01c6 c60036        	ld	a,_iLF_DEF+54
 652  01c9 5f            	clrw	x
 653  01ca 97            	ld	xl,a
 654  01cb c60036        	ld	a,_bLF_DEF+54
 655  01ce 43            	cpl	a
 656  01cf d4540c        	and	a,(21516,x)
 657  01d2 d7540c        	ld	(21516,x),a
 658                     ; 91 		LCD_BIT_CLEAR(bT2);
 660  01d5 c60026        	ld	a,_iLF_DEF+38
 661  01d8 5f            	clrw	x
 662  01d9 97            	ld	xl,a
 663  01da c60026        	ld	a,_bLF_DEF+38
 664  01dd 43            	cpl	a
 665  01de d4540c        	and	a,(21516,x)
 666  01e1               L151:
 667  01e1 d7540c        	ld	(21516,x),a
 668                     ; 93 }
 671  01e4 85            	popw	x
 672  01e5 81            	ret	
 710                     ; 96 void	ui_disp_repeat_setup(uint8_t i)
 710                     ; 97 {
 711                     	switch	.text
 712  01e6               _ui_disp_repeat_setup:
 714  01e6 88            	push	a
 715       00000000      OFST:	set	0
 718                     ; 98 	ui_disp_temp_mark(0);
 720  01e7 4f            	clr	a
 721  01e8 cd00c4        	call	_ui_disp_temp_mark
 723                     ; 99 	ui_disp_temp_c(0);
 725  01eb 4f            	clr	a
 726  01ec cd0087        	call	_ui_disp_temp_c
 728                     ; 100 	LCD_BIT_CLEAR(bT1);
 730  01ef c60036        	ld	a,_iLF_DEF+54
 731  01f2 5f            	clrw	x
 732  01f3 97            	ld	xl,a
 733  01f4 c60036        	ld	a,_bLF_DEF+54
 734  01f7 ad72          	call	LC003
 735                     ; 101 	LCD_BIT_CLEAR(bT2);
 737  01f9 c60026        	ld	a,_iLF_DEF+38
 738  01fc 5f            	clrw	x
 739  01fd 97            	ld	xl,a
 740  01fe c60026        	ld	a,_bLF_DEF+38
 741  0201 ad68          	call	LC003
 742                     ; 102 	LCD_BIT_CLEAR(bT3);
 744  0203 c6003b        	ld	a,_iLF_DEF+59
 745  0206 5f            	clrw	x
 746  0207 97            	ld	xl,a
 747  0208 c6003b        	ld	a,_bLF_DEF+59
 748  020b ad5e          	call	LC003
 749                     ; 103 	LCD_BIT_CLEAR(bT4);
 751  020d c6002b        	ld	a,_iLF_DEF+43
 752  0210 5f            	clrw	x
 753  0211 97            	ld	xl,a
 754  0212 c6002b        	ld	a,_bLF_DEF+43
 755  0215 ad54          	call	LC003
 756                     ; 104 	LCD_BIT_SET(bCOL);
 758  0217 c60016        	ld	a,_iLF_DEF+22
 759  021a 5f            	clrw	x
 760  021b 97            	ld	xl,a
 761  021c d6540c        	ld	a,(21516,x)
 762  021f ca0016        	or	a,_bLF_DEF+22
 763  0222 d7540c        	ld	(21516,x),a
 764                     ; 106 	lcd_disp_n(0, i/10);
 766  0225 7b01          	ld	a,(OFST+1,sp)
 767  0227 5f            	clrw	x
 768  0228 97            	ld	xl,a
 769  0229 a60a          	ld	a,#10
 770  022b 62            	div	x,a
 771  022c 4f            	clr	a
 772  022d 95            	ld	xh,a
 773  022e cd0000        	call	_lcd_disp_n
 775                     ; 107 	lcd_disp_n(1, i%10);
 777  0231 7b01          	ld	a,(OFST+1,sp)
 778  0233 5f            	clrw	x
 779  0234 97            	ld	xl,a
 780  0235 a60a          	ld	a,#10
 781  0237 62            	div	x,a
 782  0238 97            	ld	xl,a
 783  0239 a601          	ld	a,#1
 784  023b 95            	ld	xh,a
 785  023c cd0000        	call	_lcd_disp_n
 787                     ; 108 	lcd_disp_n(2, (90-i)/10);
 789  023f 4f            	clr	a
 790  0240 97            	ld	xl,a
 791  0241 a65a          	ld	a,#90
 792  0243 1001          	sub	a,(OFST+1,sp)
 793  0245 2401          	jrnc	L25
 794  0247 5a            	decw	x
 795  0248               L25:
 796  0248 02            	rlwa	x,a
 797  0249 a60a          	ld	a,#10
 798  024b cd0000        	call	c_sdivx
 800  024e a602          	ld	a,#2
 801  0250 95            	ld	xh,a
 802  0251 cd0000        	call	_lcd_disp_n
 804                     ; 109 	lcd_disp_n(3, (90-i)%10);
 806  0254 4f            	clr	a
 807  0255 97            	ld	xl,a
 808  0256 a65a          	ld	a,#90
 809  0258 1001          	sub	a,(OFST+1,sp)
 810  025a 2401          	jrnc	L65
 811  025c 5a            	decw	x
 812  025d               L65:
 813  025d 02            	rlwa	x,a
 814  025e a60a          	ld	a,#10
 815  0260 cd0000        	call	c_smodx
 817  0263 a603          	ld	a,#3
 818  0265 95            	ld	xh,a
 819  0266 cd0000        	call	_lcd_disp_n
 821                     ; 110 }
 824  0269 84            	pop	a
 825  026a 81            	ret	
 826  026b               LC003:
 827  026b 43            	cpl	a
 828  026c d4540c        	and	a,(21516,x)
 829  026f d7540c        	ld	(21516,x),a
 830  0272 81            	ret	
 882                     ; 112 void	ui_disp_reserve_setup(uint8_t i)
 882                     ; 113 {
 883                     	switch	.text
 884  0273               _ui_disp_reserve_setup:
 886  0273 88            	push	a
 887  0274 89            	pushw	x
 888       00000002      OFST:	set	2
 891                     ; 115 	ui_disp_temp_mark(0);
 893  0275 4f            	clr	a
 894  0276 cd00c4        	call	_ui_disp_temp_mark
 896                     ; 116 	ui_disp_temp_c(0);
 898  0279 4f            	clr	a
 899  027a cd0087        	call	_ui_disp_temp_c
 901                     ; 117 	LCD_BIT_CLEAR(bT1);
 903  027d c60036        	ld	a,_iLF_DEF+54
 904  0280 5f            	clrw	x
 905  0281 97            	ld	xl,a
 906  0282 c60036        	ld	a,_bLF_DEF+54
 907  0285 ad7c          	call	LC004
 908                     ; 118 	LCD_BIT_CLEAR(bT2);
 910  0287 c60026        	ld	a,_iLF_DEF+38
 911  028a 5f            	clrw	x
 912  028b 97            	ld	xl,a
 913  028c c60026        	ld	a,_bLF_DEF+38
 914  028f ad72          	call	LC004
 915                     ; 119 	LCD_BIT_CLEAR(bT3);
 917  0291 c6003b        	ld	a,_iLF_DEF+59
 918  0294 5f            	clrw	x
 919  0295 97            	ld	xl,a
 920  0296 c6003b        	ld	a,_bLF_DEF+59
 921  0299 ad68          	call	LC004
 922                     ; 120 	LCD_BIT_CLEAR(bT4);
 924  029b c6002b        	ld	a,_iLF_DEF+43
 925  029e 5f            	clrw	x
 926  029f 97            	ld	xl,a
 927  02a0 c6002b        	ld	a,_bLF_DEF+43
 928  02a3 ad5e          	call	LC004
 929                     ; 121 	LCD_BIT_SET(bCOL);
 931  02a5 c60016        	ld	a,_iLF_DEF+22
 932  02a8 5f            	clrw	x
 933  02a9 97            	ld	xl,a
 934  02aa d6540c        	ld	a,(21516,x)
 935  02ad ca0016        	or	a,_bLF_DEF+22
 936  02b0 d7540c        	ld	(21516,x),a
 937                     ; 123 	a = i/2;
 939  02b3 7b03          	ld	a,(OFST+1,sp)
 940  02b5 5f            	clrw	x
 941  02b6 97            	ld	xl,a
 942  02b7 57            	sraw	x
 943  02b8 01            	rrwa	x,a
 944  02b9 6b02          	ld	(OFST+0,sp),a
 945                     ; 124 	b = i%2;
 947  02bb 7b03          	ld	a,(OFST+1,sp)
 948  02bd a401          	and	a,#1
 949  02bf 6b01          	ld	(OFST-1,sp),a
 950                     ; 125 	lcd_disp_n(0, a/10);
 952  02c1 90ae000a      	ldw	y,#10
 953  02c5 7b02          	ld	a,(OFST+0,sp)
 954  02c7 5f            	clrw	x
 955  02c8 4d            	tnz	a
 956  02c9 2a01          	jrpl	L07
 957  02cb 5a            	decw	x
 958  02cc               L07:
 959  02cc 02            	rlwa	x,a
 960  02cd cd0000        	call	c_idiv
 962  02d0 4f            	clr	a
 963  02d1 95            	ld	xh,a
 964  02d2 cd0000        	call	_lcd_disp_n
 966                     ; 126 	lcd_disp_n(1, a%10);
 968  02d5 7b02          	ld	a,(OFST+0,sp)
 969  02d7 90ae000a      	ldw	y,#10
 970  02db 5f            	clrw	x
 971  02dc 4d            	tnz	a
 972  02dd 2a01          	jrpl	L47
 973  02df 5a            	decw	x
 974  02e0               L47:
 975  02e0 02            	rlwa	x,a
 976  02e1 cd0000        	call	c_idiv
 978  02e4 909f          	ld	a,yl
 979  02e6 97            	ld	xl,a
 980  02e7 a601          	ld	a,#1
 981  02e9 95            	ld	xh,a
 982  02ea cd0000        	call	_lcd_disp_n
 984                     ; 127 	lcd_disp_n(2, b==0 ? 0 : 3);
 986  02ed 7b01          	ld	a,(OFST-1,sp)
 987  02ef 2702          	jreq	L201
 988  02f1 a603          	ld	a,#3
 989  02f3               L201:
 990  02f3 97            	ld	xl,a
 991  02f4 a602          	ld	a,#2
 992  02f6 95            	ld	xh,a
 993  02f7 cd0000        	call	_lcd_disp_n
 995                     ; 128 	lcd_disp_n(3, 0);
 997  02fa ae0300        	ldw	x,#768
 998  02fd cd0000        	call	_lcd_disp_n
1000                     ; 129 }
1003  0300 5b03          	addw	sp,#3
1004  0302 81            	ret	
1005  0303               LC004:
1006  0303 43            	cpl	a
1007  0304 d4540c        	and	a,(21516,x)
1008  0307 d7540c        	ld	(21516,x),a
1009  030a 81            	ret	
1022                     	xdef	_ui_disp_reserve_setup
1023                     	xdef	_ui_disp_repeat_setup
1024                     	xdef	_ui_disp_set_tSetup
1025                     	xdef	_ui_disp_clear_tSetup
1026                     	xdef	_ui_disp_temp_mark
1027                     	xdef	_ui_disp_temp_c
1028                     	xdef	_ui_disp_temp_curr
1029                     	xdef	_ui_disp_temp_setup
1030                     	xref	_lcd_clear_npos
1031                     	xref	_lcd_disp_n
1032                     	xref	_iLF_DEF
1033                     	xref	_bLF_DEF
1034                     	xref.b	c_x
1053                     	xref	c_idiv
1054                     	xref	c_smodx
1055                     	xref	c_sdivx
1056                     	end
