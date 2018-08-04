   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  60                     ; 5 void	ui_disp_clear_tSetup(uint8_t i)
  60                     ; 6 {
  62                     	switch	.text
  63  0000               _ui_disp_clear_tSetup:
  65  0000 88            	push	a
  66       00000000      OFST:	set	0
  69                     ; 7 	lcd_clear_npos(2, 0);
  71  0001 ae0200        	ldw	x,#512
  72  0004 cd0000        	call	_lcd_clear_npos
  74                     ; 8 	lcd_clear_npos(3, 0);
  76  0007 ae0300        	ldw	x,#768
  77  000a cd0000        	call	_lcd_clear_npos
  79                     ; 13 	if (i == 1) {
  81                     ; 18 }
  84  000d 84            	pop	a
  85  000e 81            	ret	
 117                     ; 20 void	ui_disp_set_tSetup(uint8_t i)
 117                     ; 21 {
 118                     	switch	.text
 119  000f               _ui_disp_set_tSetup:
 123                     ; 24 }
 126  000f 81            	ret	
 160                     ; 26 void	__ui_disp_temp_c(uint8_t i)
 160                     ; 27 {
 161                     	switch	.text
 162  0010               ___ui_disp_temp_c:
 164  0010 88            	push	a
 165       00000000      OFST:	set	0
 168                     ; 28 	LCD_BIT_CLEAR(bDP1);
 170  0011 c60006        	ld	a,_iLF_DEF+6
 171  0014 5f            	clrw	x
 172  0015 97            	ld	xl,a
 173  0016 c60006        	ld	a,_bLF_DEF+6
 174  0019 43            	cpl	a
 175  001a d4540c        	and	a,(21516,x)
 176  001d d7540c        	ld	(21516,x),a
 177                     ; 29 	LCD_BIT_CLEAR(bDP2);
 179  0020 c6000a        	ld	a,_iLF_DEF+10
 180  0023 5f            	clrw	x
 181  0024 97            	ld	xl,a
 182  0025 c6000a        	ld	a,_bLF_DEF+10
 183  0028 43            	cpl	a
 184  0029 d4540c        	and	a,(21516,x)
 185  002c d7540c        	ld	(21516,x),a
 186                     ; 30 	if( i&0x01 )
 188  002f 7b01          	ld	a,(OFST+1,sp)
 189  0031 a501          	bcp	a,#1
 190  0033 2710          	jreq	L75
 191                     ; 32 		LCD_BIT_SET(bDP1);
 193  0035 c60006        	ld	a,_iLF_DEF+6
 194  0038 5f            	clrw	x
 195  0039 97            	ld	xl,a
 196  003a d6540c        	ld	a,(21516,x)
 197  003d ca0006        	or	a,_bLF_DEF+6
 198  0040 d7540c        	ld	(21516,x),a
 199  0043 7b01          	ld	a,(OFST+1,sp)
 200  0045               L75:
 201                     ; 34 	if( i&0x02 )
 203  0045 a502          	bcp	a,#2
 204  0047 270e          	jreq	L16
 205                     ; 36 		LCD_BIT_SET(bDP2);
 207  0049 c6000a        	ld	a,_iLF_DEF+10
 208  004c 5f            	clrw	x
 209  004d 97            	ld	xl,a
 210  004e d6540c        	ld	a,(21516,x)
 211  0051 ca000a        	or	a,_bLF_DEF+10
 212  0054 d7540c        	ld	(21516,x),a
 213  0057               L16:
 214                     ; 38 }
 217  0057 84            	pop	a
 218  0058 81            	ret	
 252                     ; 40 void	ui_disp_temp_c(uint8_t i)
 252                     ; 41 {
 253                     	switch	.text
 254  0059               _ui_disp_temp_c:
 258                     ; 42 	if( i == 0 )
 260  0059 4d            	tnz	a
 261  005a 261d          	jrne	L77
 262                     ; 44 		LCD_BIT_CLEAR(bDP1);
 264  005c c60006        	ld	a,_iLF_DEF+6
 265  005f 5f            	clrw	x
 266  0060 97            	ld	xl,a
 267  0061 c60006        	ld	a,_bLF_DEF+6
 268  0064 43            	cpl	a
 269  0065 d4540c        	and	a,(21516,x)
 270  0068 d7540c        	ld	(21516,x),a
 271                     ; 45 		LCD_BIT_CLEAR(bDP2);
 273  006b c6000a        	ld	a,_iLF_DEF+10
 274  006e 5f            	clrw	x
 275  006f 97            	ld	xl,a
 276  0070 c6000a        	ld	a,_bLF_DEF+10
 277  0073 43            	cpl	a
 278  0074 d4540c        	and	a,(21516,x)
 280  0077 2019          	jra	L101
 281  0079               L77:
 282                     ; 49 		LCD_BIT_SET(bDP1);
 284  0079 c60006        	ld	a,_iLF_DEF+6
 285  007c 5f            	clrw	x
 286  007d 97            	ld	xl,a
 287  007e d6540c        	ld	a,(21516,x)
 288  0081 ca0006        	or	a,_bLF_DEF+6
 289  0084 d7540c        	ld	(21516,x),a
 290                     ; 50 		LCD_BIT_SET(bDP2);
 292  0087 c6000a        	ld	a,_iLF_DEF+10
 293  008a 5f            	clrw	x
 294  008b 97            	ld	xl,a
 295  008c d6540c        	ld	a,(21516,x)
 296  008f ca000a        	or	a,_bLF_DEF+10
 297  0092               L101:
 298  0092 d7540c        	ld	(21516,x),a
 299                     ; 52 }
 302  0095 81            	ret	
 335                     ; 54 void	ui_disp_temp_mark(uint8_t i)
 335                     ; 55 {
 336                     	switch	.text
 337  0096               _ui_disp_temp_mark:
 339  0096 88            	push	a
 340       00000000      OFST:	set	0
 343                     ; 56 	if( i == 0 )
 345  0097 4d            	tnz	a
 347                     ; 67 	ui_disp_temp_c(i);
 349  0098 7b01          	ld	a,(OFST+1,sp)
 350  009a adbd          	call	_ui_disp_temp_c
 352                     ; 69 }
 355  009c 84            	pop	a
 356  009d 81            	ret	
 403                     ; 71 void	ui_disp_temp_setup(uint8_t i)
 403                     ; 72 {
 404                     	switch	.text
 405  009e               _ui_disp_temp_setup:
 407  009e 89            	pushw	x
 408       00000002      OFST:	set	2
 411                     ; 74 	a = i/2;
 413  009f 5f            	clrw	x
 414  00a0 97            	ld	xl,a
 415  00a1 57            	sraw	x
 416  00a2 01            	rrwa	x,a
 417  00a3 6b02          	ld	(OFST+0,sp),a
 418  00a5 02            	rlwa	x,a
 419                     ; 75 	b = i%2;
 421  00a6 a401          	and	a,#1
 422  00a8 6b01          	ld	(OFST-1,sp),a
 423                     ; 76 	lcd_disp_n(2, a/10);
 425  00aa 5f            	clrw	x
 426  00ab 7b02          	ld	a,(OFST+0,sp)
 427  00ad 97            	ld	xl,a
 428  00ae a60a          	ld	a,#10
 429  00b0 62            	div	x,a
 430  00b1 a602          	ld	a,#2
 431  00b3 95            	ld	xh,a
 432  00b4 cd0000        	call	_lcd_disp_n
 434                     ; 77 	lcd_disp_n(3, a%10);
 436  00b7 7b02          	ld	a,(OFST+0,sp)
 437  00b9 5f            	clrw	x
 438  00ba 97            	ld	xl,a
 439  00bb a60a          	ld	a,#10
 440  00bd 62            	div	x,a
 441  00be 97            	ld	xl,a
 442  00bf a603          	ld	a,#3
 443  00c1 95            	ld	xh,a
 444  00c2 cd0000        	call	_lcd_disp_n
 446                     ; 80 	if( b != 0 )
 448  00c5 0d01          	tnz	(OFST-1,sp)
 450                     ; 90 }
 453  00c7 85            	popw	x
 454  00c8 81            	ret	
 501                     ; 92 void	ui_disp_temp_curr(uint8_t i)
 501                     ; 93 {
 502                     	switch	.text
 503  00c9               _ui_disp_temp_curr:
 505  00c9 89            	pushw	x
 506       00000002      OFST:	set	2
 509                     ; 95 	a = i/2;
 511  00ca 5f            	clrw	x
 512  00cb 97            	ld	xl,a
 513  00cc 57            	sraw	x
 514  00cd 01            	rrwa	x,a
 515  00ce 6b02          	ld	(OFST+0,sp),a
 516  00d0 02            	rlwa	x,a
 517                     ; 96 	b = i%2;
 519  00d1 a401          	and	a,#1
 520  00d3 6b01          	ld	(OFST-1,sp),a
 521                     ; 97 	lcd_disp_n(0, a/10);
 523  00d5 5f            	clrw	x
 524  00d6 7b02          	ld	a,(OFST+0,sp)
 525  00d8 97            	ld	xl,a
 526  00d9 a60a          	ld	a,#10
 527  00db 62            	div	x,a
 528  00dc 4f            	clr	a
 529  00dd 95            	ld	xh,a
 530  00de cd0000        	call	_lcd_disp_n
 532                     ; 98 	lcd_disp_n(1, a%10);
 534  00e1 7b02          	ld	a,(OFST+0,sp)
 535  00e3 5f            	clrw	x
 536  00e4 97            	ld	xl,a
 537  00e5 a60a          	ld	a,#10
 538  00e7 62            	div	x,a
 539  00e8 97            	ld	xl,a
 540  00e9 a601          	ld	a,#1
 541  00eb 95            	ld	xh,a
 542  00ec cd0000        	call	_lcd_disp_n
 544                     ; 101 	if( b != 0 )
 546  00ef 0d01          	tnz	(OFST-1,sp)
 548                     ; 111 }
 551  00f1 85            	popw	x
 552  00f2 81            	ret	
 586                     ; 114 void	ui_disp_repeat_setup(uint8_t i)
 586                     ; 115 {
 587                     	switch	.text
 588  00f3               _ui_disp_repeat_setup:
 590  00f3 88            	push	a
 591       00000000      OFST:	set	0
 594                     ; 125 	lcd_disp_n(2, i/10);
 596  00f4 5f            	clrw	x
 597  00f5 97            	ld	xl,a
 598  00f6 a60a          	ld	a,#10
 599  00f8 62            	div	x,a
 600  00f9 a602          	ld	a,#2
 601  00fb 95            	ld	xh,a
 602  00fc cd0000        	call	_lcd_disp_n
 604                     ; 126 	lcd_disp_n(3, i%10);
 606  00ff 7b01          	ld	a,(OFST+1,sp)
 607  0101 5f            	clrw	x
 608  0102 97            	ld	xl,a
 609  0103 a60a          	ld	a,#10
 610  0105 62            	div	x,a
 611  0106 97            	ld	xl,a
 612  0107 a603          	ld	a,#3
 613  0109 95            	ld	xh,a
 614  010a cd0000        	call	_lcd_disp_n
 616                     ; 129 }
 619  010d 84            	pop	a
 620  010e 81            	ret	
 668                     ; 131 void	ui_disp_reserve_setup(uint8_t i)
 668                     ; 132 {
 669                     	switch	.text
 670  010f               _ui_disp_reserve_setup:
 672  010f 89            	pushw	x
 673       00000002      OFST:	set	2
 676                     ; 143 	a = i/2;
 678  0110 5f            	clrw	x
 679  0111 97            	ld	xl,a
 680  0112 57            	sraw	x
 681  0113 01            	rrwa	x,a
 682  0114 6b02          	ld	(OFST+0,sp),a
 683                     ; 144 	b = i%2;
 685                     ; 145 	lcd_disp_n(2, a/10);
 687  0116 90ae000a      	ldw	y,#10
 688  011a 5f            	clrw	x
 689  011b 4d            	tnz	a
 690  011c 2a01          	jrpl	L25
 691  011e 5a            	decw	x
 692  011f               L25:
 693  011f 02            	rlwa	x,a
 694  0120 cd0000        	call	c_idiv
 696  0123 a602          	ld	a,#2
 697  0125 95            	ld	xh,a
 698  0126 cd0000        	call	_lcd_disp_n
 700                     ; 146 	lcd_disp_n(3, a%10);
 702  0129 7b02          	ld	a,(OFST+0,sp)
 703  012b 90ae000a      	ldw	y,#10
 704  012f 5f            	clrw	x
 705  0130 4d            	tnz	a
 706  0131 2a01          	jrpl	L65
 707  0133 5a            	decw	x
 708  0134               L65:
 709  0134 02            	rlwa	x,a
 710  0135 cd0000        	call	c_idiv
 712  0138 909f          	ld	a,yl
 713  013a 97            	ld	xl,a
 714  013b a603          	ld	a,#3
 715  013d 95            	ld	xh,a
 716  013e cd0000        	call	_lcd_disp_n
 718                     ; 149 }
 721  0141 85            	popw	x
 722  0142 81            	ret	
 735                     	xdef	___ui_disp_temp_c
 736                     	xdef	_ui_disp_reserve_setup
 737                     	xdef	_ui_disp_repeat_setup
 738                     	xdef	_ui_disp_set_tSetup
 739                     	xdef	_ui_disp_clear_tSetup
 740                     	xdef	_ui_disp_temp_mark
 741                     	xdef	_ui_disp_temp_c
 742                     	xdef	_ui_disp_temp_curr
 743                     	xdef	_ui_disp_temp_setup
 744                     	xref	_lcd_clear_npos
 745                     	xref	_lcd_disp_n
 746                     	xref	_iLF_DEF
 747                     	xref	_bLF_DEF
 766                     	xref	c_idiv
 767                     	end
