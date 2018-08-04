   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  61                     ; 5 void	ui_disp_clear_tSetup(uint8_t i)
  61                     ; 6 {
  63                     .text:	section	.text,new
  64  0000               _ui_disp_clear_tSetup:
  66  0000 88            	push	a
  67       00000000      OFST:	set	0
  70                     ; 7 	lcd_clear_npos(2, 0);
  72  0001 ae0200        	ldw	x,#512
  73  0004 cd0000        	call	_lcd_clear_npos
  75                     ; 8 	lcd_clear_npos(3, 0);
  77  0007 ae0300        	ldw	x,#768
  78  000a cd0000        	call	_lcd_clear_npos
  80                     ; 13 	if (i == 1) {
  82                     ; 18 }
  85  000d 84            	pop	a
  86  000e 81            	ret	
 118                     ; 20 void	ui_disp_set_tSetup(uint8_t i)
 118                     ; 21 {
 119                     .text:	section	.text,new
 120  0000               _ui_disp_set_tSetup:
 124                     ; 24 }
 127  0000 81            	ret	
 161                     ; 26 void	__ui_disp_temp_c(uint8_t i)
 161                     ; 27 {
 162                     .text:	section	.text,new
 163  0000               ___ui_disp_temp_c:
 165  0000 88            	push	a
 166       00000000      OFST:	set	0
 169                     ; 28 	LCD_BIT_CLEAR(bDP1);
 171  0001 c60006        	ld	a,_iLF_DEF+6
 172  0004 5f            	clrw	x
 173  0005 97            	ld	xl,a
 174  0006 c60006        	ld	a,_bLF_DEF+6
 175  0009 43            	cpl	a
 176  000a d4540c        	and	a,(21516,x)
 177  000d d7540c        	ld	(21516,x),a
 178                     ; 29 	LCD_BIT_CLEAR(bDP2);
 180  0010 c6000a        	ld	a,_iLF_DEF+10
 181  0013 5f            	clrw	x
 182  0014 97            	ld	xl,a
 183  0015 c6000a        	ld	a,_bLF_DEF+10
 184  0018 43            	cpl	a
 185  0019 d4540c        	and	a,(21516,x)
 186  001c d7540c        	ld	(21516,x),a
 187                     ; 30 	if( i&0x01 )
 189  001f 7b01          	ld	a,(OFST+1,sp)
 190  0021 a501          	bcp	a,#1
 191  0023 2710          	jreq	L75
 192                     ; 32 		LCD_BIT_SET(bDP1);
 194  0025 c60006        	ld	a,_iLF_DEF+6
 195  0028 5f            	clrw	x
 196  0029 97            	ld	xl,a
 197  002a d6540c        	ld	a,(21516,x)
 198  002d ca0006        	or	a,_bLF_DEF+6
 199  0030 d7540c        	ld	(21516,x),a
 200  0033 7b01          	ld	a,(OFST+1,sp)
 201  0035               L75:
 202                     ; 34 	if( i&0x02 )
 204  0035 a502          	bcp	a,#2
 205  0037 270e          	jreq	L16
 206                     ; 36 		LCD_BIT_SET(bDP2);
 208  0039 c6000a        	ld	a,_iLF_DEF+10
 209  003c 5f            	clrw	x
 210  003d 97            	ld	xl,a
 211  003e d6540c        	ld	a,(21516,x)
 212  0041 ca000a        	or	a,_bLF_DEF+10
 213  0044 d7540c        	ld	(21516,x),a
 214  0047               L16:
 215                     ; 38 }
 218  0047 84            	pop	a
 219  0048 81            	ret	
 253                     ; 40 void	ui_disp_temp_c(uint8_t i)
 253                     ; 41 {
 254                     .text:	section	.text,new
 255  0000               _ui_disp_temp_c:
 259                     ; 42 	if( i == 0 )
 261  0000 4d            	tnz	a
 262  0001 261d          	jrne	L77
 263                     ; 44 		LCD_BIT_CLEAR(bDP1);
 265  0003 c60006        	ld	a,_iLF_DEF+6
 266  0006 5f            	clrw	x
 267  0007 97            	ld	xl,a
 268  0008 c60006        	ld	a,_bLF_DEF+6
 269  000b 43            	cpl	a
 270  000c d4540c        	and	a,(21516,x)
 271  000f d7540c        	ld	(21516,x),a
 272                     ; 45 		LCD_BIT_CLEAR(bDP2);
 274  0012 c6000a        	ld	a,_iLF_DEF+10
 275  0015 5f            	clrw	x
 276  0016 97            	ld	xl,a
 277  0017 c6000a        	ld	a,_bLF_DEF+10
 278  001a 43            	cpl	a
 279  001b d4540c        	and	a,(21516,x)
 281  001e 2019          	jra	L101
 282  0020               L77:
 283                     ; 49 		LCD_BIT_SET(bDP1);
 285  0020 c60006        	ld	a,_iLF_DEF+6
 286  0023 5f            	clrw	x
 287  0024 97            	ld	xl,a
 288  0025 d6540c        	ld	a,(21516,x)
 289  0028 ca0006        	or	a,_bLF_DEF+6
 290  002b d7540c        	ld	(21516,x),a
 291                     ; 50 		LCD_BIT_SET(bDP2);
 293  002e c6000a        	ld	a,_iLF_DEF+10
 294  0031 5f            	clrw	x
 295  0032 97            	ld	xl,a
 296  0033 d6540c        	ld	a,(21516,x)
 297  0036 ca000a        	or	a,_bLF_DEF+10
 298  0039               L101:
 299  0039 d7540c        	ld	(21516,x),a
 300                     ; 52 }
 303  003c 81            	ret	
 336                     ; 54 void	ui_disp_temp_mark(uint8_t i)
 336                     ; 55 {
 337                     .text:	section	.text,new
 338  0000               _ui_disp_temp_mark:
 340  0000 88            	push	a
 341       00000000      OFST:	set	0
 344                     ; 56 	if( i == 0 )
 346  0001 4d            	tnz	a
 348                     ; 67 	ui_disp_temp_c(i);
 350  0002 cd0000        	call	_ui_disp_temp_c
 352                     ; 69 }
 355  0005 84            	pop	a
 356  0006 81            	ret	
 403                     ; 71 void	ui_disp_temp_setup(uint8_t i)
 403                     ; 72 {
 404                     .text:	section	.text,new
 405  0000               _ui_disp_temp_setup:
 407  0000 89            	pushw	x
 408       00000002      OFST:	set	2
 411                     ; 74 	a = i/2;
 413  0001 5f            	clrw	x
 414  0002 97            	ld	xl,a
 415  0003 57            	sraw	x
 416  0004 01            	rrwa	x,a
 417  0005 6b02          	ld	(OFST+0,sp),a
 418  0007 02            	rlwa	x,a
 420                     ; 75 	b = i%2;
 422  0008 a401          	and	a,#1
 423  000a 6b01          	ld	(OFST-1,sp),a
 425                     ; 76 	lcd_disp_n(2, a/10);
 427  000c 5f            	clrw	x
 428  000d 7b02          	ld	a,(OFST+0,sp)
 429  000f 97            	ld	xl,a
 430  0010 a60a          	ld	a,#10
 431  0012 62            	div	x,a
 432  0013 9f            	ld	a,xl
 433  0014 ae0200        	ldw	x,#512
 434  0017 97            	ld	xl,a
 435  0018 cd0000        	call	_lcd_disp_n
 437                     ; 77 	lcd_disp_n(3, a%10);
 439  001b 7b02          	ld	a,(OFST+0,sp)
 440  001d 5f            	clrw	x
 441  001e 97            	ld	xl,a
 442  001f a60a          	ld	a,#10
 443  0021 62            	div	x,a
 444  0022 ae0300        	ldw	x,#768
 445  0025 97            	ld	xl,a
 446  0026 cd0000        	call	_lcd_disp_n
 448                     ; 80 	if( b != 0 )
 450  0029 0d01          	tnz	(OFST-1,sp)
 452                     ; 90 }
 455  002b 85            	popw	x
 456  002c 81            	ret	
 503                     ; 92 void	ui_disp_temp_curr(uint8_t i)
 503                     ; 93 {
 504                     .text:	section	.text,new
 505  0000               _ui_disp_temp_curr:
 507  0000 89            	pushw	x
 508       00000002      OFST:	set	2
 511                     ; 95 	a = i/2;
 513  0001 5f            	clrw	x
 514  0002 97            	ld	xl,a
 515  0003 57            	sraw	x
 516  0004 01            	rrwa	x,a
 517  0005 6b02          	ld	(OFST+0,sp),a
 518  0007 02            	rlwa	x,a
 520                     ; 96 	b = i%2;
 522  0008 a401          	and	a,#1
 523  000a 6b01          	ld	(OFST-1,sp),a
 525                     ; 97 	lcd_disp_n(0, a/10);
 527  000c 5f            	clrw	x
 528  000d 7b02          	ld	a,(OFST+0,sp)
 529  000f 97            	ld	xl,a
 530  0010 a60a          	ld	a,#10
 531  0012 62            	div	x,a
 532  0013 9f            	ld	a,xl
 533  0014 5f            	clrw	x
 534  0015 97            	ld	xl,a
 535  0016 cd0000        	call	_lcd_disp_n
 537                     ; 98 	lcd_disp_n(1, a%10);
 539  0019 7b02          	ld	a,(OFST+0,sp)
 540  001b 5f            	clrw	x
 541  001c 97            	ld	xl,a
 542  001d a60a          	ld	a,#10
 543  001f 62            	div	x,a
 544  0020 ae0100        	ldw	x,#256
 545  0023 97            	ld	xl,a
 546  0024 cd0000        	call	_lcd_disp_n
 548                     ; 101 	if( b != 0 )
 550  0027 0d01          	tnz	(OFST-1,sp)
 552                     ; 111 }
 555  0029 85            	popw	x
 556  002a 81            	ret	
 590                     ; 114 void	ui_disp_repeat_setup(uint8_t i)
 590                     ; 115 {
 591                     .text:	section	.text,new
 592  0000               _ui_disp_repeat_setup:
 594  0000 88            	push	a
 595       00000000      OFST:	set	0
 598                     ; 125 	lcd_disp_n(2, i/10);
 600  0001 5f            	clrw	x
 601  0002 97            	ld	xl,a
 602  0003 a60a          	ld	a,#10
 603  0005 62            	div	x,a
 604  0006 9f            	ld	a,xl
 605  0007 ae0200        	ldw	x,#512
 606  000a 97            	ld	xl,a
 607  000b cd0000        	call	_lcd_disp_n
 609                     ; 126 	lcd_disp_n(3, i%10);
 611  000e 7b01          	ld	a,(OFST+1,sp)
 612  0010 5f            	clrw	x
 613  0011 97            	ld	xl,a
 614  0012 a60a          	ld	a,#10
 615  0014 62            	div	x,a
 616  0015 ae0300        	ldw	x,#768
 617  0018 97            	ld	xl,a
 618  0019 cd0000        	call	_lcd_disp_n
 620                     ; 129 }
 623  001c 84            	pop	a
 624  001d 81            	ret	
 672                     ; 131 void	ui_disp_reserve_setup(uint8_t i)
 672                     ; 132 {
 673                     .text:	section	.text,new
 674  0000               _ui_disp_reserve_setup:
 676  0000 89            	pushw	x
 677       00000002      OFST:	set	2
 680                     ; 143 	a = i/2;
 682  0001 5f            	clrw	x
 683  0002 97            	ld	xl,a
 684  0003 57            	sraw	x
 685  0004 01            	rrwa	x,a
 686  0005 6b02          	ld	(OFST+0,sp),a
 688                     ; 144 	b = i%2;
 690                     ; 145 	lcd_disp_n(2, a/10);
 692  0007 90ae000a      	ldw	y,#10
 693  000b 5f            	clrw	x
 694  000c 4d            	tnz	a
 695  000d 2a01          	jrpl	L25
 696  000f 5a            	decw	x
 697  0010               L25:
 698  0010 02            	rlwa	x,a
 699  0011 cd0000        	call	c_idiv
 701  0014 9f            	ld	a,xl
 702  0015 ae0200        	ldw	x,#512
 703  0018 97            	ld	xl,a
 704  0019 cd0000        	call	_lcd_disp_n
 706                     ; 146 	lcd_disp_n(3, a%10);
 708  001c 7b02          	ld	a,(OFST+0,sp)
 709  001e 90ae000a      	ldw	y,#10
 710  0022 5f            	clrw	x
 711  0023 4d            	tnz	a
 712  0024 2a01          	jrpl	L65
 713  0026 5a            	decw	x
 714  0027               L65:
 715  0027 02            	rlwa	x,a
 716  0028 cd0000        	call	c_idiv
 718  002b 909f          	ld	a,yl
 719  002d ae0300        	ldw	x,#768
 720  0030 97            	ld	xl,a
 721  0031 cd0000        	call	_lcd_disp_n
 723                     ; 149 }
 726  0034 85            	popw	x
 727  0035 81            	ret	
 740                     	xdef	_ui_disp_reserve_setup
 741                     	xdef	_ui_disp_repeat_setup
 742                     	xdef	_ui_disp_set_tSetup
 743                     	xdef	_ui_disp_clear_tSetup
 744                     	xdef	___ui_disp_temp_c
 745                     	xdef	_ui_disp_temp_mark
 746                     	xdef	_ui_disp_temp_c
 747                     	xdef	_ui_disp_temp_curr
 748                     	xdef	_ui_disp_temp_setup
 749                     	xref	_lcd_clear_npos
 750                     	xref	_lcd_disp_n
 751                     	xref	_iLF_DEF
 752                     	xref	_bLF_DEF
 771                     	xref	c_idiv
 772                     	end
