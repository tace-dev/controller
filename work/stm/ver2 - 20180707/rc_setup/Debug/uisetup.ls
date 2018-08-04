   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  19                     	switch	.data
  20  0000               __uiSetup:
  21  0000 01            	dc.b	1
  22  0001               __uiSetupPrev:
  23  0001 ff            	dc.b	255
  24  0002               ___cntlMode:
  25  0002 00            	dc.b	0
  73                     ; 18 void	_ui_setup_info(uint8_t id)
  73                     ; 19 {
  75                     .text:	section	.text,new
  76  0000               __ui_setup_info:
  78  0000 88            	push	a
  79  0001 88            	push	a
  80       00000001      OFST:	set	1
  83                     ; 21 	uiInfo.cnt_sub = 0;
  85  0002 725f0006      	clr	_uiInfo+6
  86                     ; 22 	uiInfo.opMode = 1;		//	0 OnOff, 1 PO
  88  0006 35010007      	mov	_uiInfo+7,#1
  89                     ; 23 	uiInfo.mode = 1;		//	1 host
  91  000a 35010008      	mov	_uiInfo+8,#1
  92                     ; 24 	uiInfo.controlMode = 0;	//	0 main, 1 sub
  94  000e 725f0009      	clr	_uiInfo+9
  95                     ; 29 	uiInfo.valve_sub = 0;
  97  0012 725f000b      	clr	_uiInfo+11
  98                     ; 30 	uiInfo.poType = 0;
 100  0016 725f000f      	clr	_uiInfo+15
 101                     ; 31 	uiInfo.tOffset = 100;
 103  001a 35640011      	mov	_uiInfo+17,#100
 104                     ; 32 	uiInfo.tempOffset = 100;
 106  001e 35640012      	mov	_uiInfo+18,#100
 107                     ; 33 	uiInfo.lpmType = 1;		//	8LPM
 109  0022 35010013      	mov	_uiInfo+19,#1
 110                     ; 34 	uiInfo.lpmType_sub = 0;
 112  0026 725f0014      	clr	_uiInfo+20
 113                     ; 35 	uiInfo.subRCLock = 0;
 115  002a 725f005d      	clr	_uiInfo+93
 116                     ; 36 	__cntlMode = uiInfo.cntlMode = 1;	//	0 local, 1 each
 118  002e 35010003      	mov	_uiInfo+3,#1
 119  0032 5500030002    	mov	___cntlMode,_uiInfo+3
 120                     ; 37 	uiInfo.houseCapa = 150;		//100 default for each mode;
 122  0037 35960010      	mov	_uiInfo+16,#150
 123                     ; 54 _boiler_type = 0;		//	0 normal, 1 plc
 125  003b 725f0000      	clr	__boiler_type
 126                     ; 55 uiInfo.plc = 0;
 128  003f 725f0064      	clr	_uiInfo+100
 129                     ; 58 	for( i=0; i<8; i++ )
 131  0043 0f01          	clr	(OFST+0,sp)
 132  0045               L15:
 133                     ; 60 		uiInfo.valve_len[i] = 0;
 135  0045 7b01          	ld	a,(OFST+0,sp)
 136  0047 5f            	clrw	x
 137  0048 97            	ld	xl,a
 138  0049 724f0015      	clr	(_uiInfo+21,x)
 139                     ; 61 		uiInfo.valve_rc[i] = 0;
 141  004d 7b01          	ld	a,(OFST+0,sp)
 142  004f 5f            	clrw	x
 143  0050 97            	ld	xl,a
 144  0051 724f001d      	clr	(_uiInfo+29,x)
 145                     ; 62 		uiInfo.valve_sub_len[i] = 0;
 147  0055 7b01          	ld	a,(OFST+0,sp)
 148  0057 5f            	clrw	x
 149  0058 97            	ld	xl,a
 150  0059 724f0025      	clr	(_uiInfo+37,x)
 151                     ; 63 		uiInfo.valve_sub_rc[i] = 0;
 153  005d 7b01          	ld	a,(OFST+0,sp)
 154  005f 5f            	clrw	x
 155  0060 97            	ld	xl,a
 156  0061 724f002d      	clr	(_uiInfo+45,x)
 157                     ; 58 	for( i=0; i<8; i++ )
 159  0065 0c01          	inc	(OFST+0,sp)
 162  0067 7b01          	ld	a,(OFST+0,sp)
 163  0069 a108          	cp	a,#8
 164  006b 25d8          	jrult	L15
 165                     ; 73 	uiInfo.valve_len[7] |= 0x80;
 167  006d 721e001c      	bset	_uiInfo+28,#7
 168                     ; 77 	uiInfo.valve_len[7] |= 0x40;
 170  0071 721c001c      	bset	_uiInfo+28,#6
 171                     ; 82 	switch( id )
 173  0075 7b02          	ld	a,(OFST+1,sp)
 175                     ; 203 		break;
 176  0077 4a            	dec	a
 177  0078 272e          	jreq	L3
 178  007a 4a            	dec	a
 179  007b 274b          	jreq	L5
 180  007d 4a            	dec	a
 181  007e 2768          	jreq	L7
 182  0080 4a            	dec	a
 183  0081 2603          	jrne	L6
 184  0083 cc0108        	jp	L11
 185  0086               L6:
 186  0086 4a            	dec	a
 187  0087 2603          	jrne	L01
 188  0089 cc0130        	jp	L31
 189  008c               L01:
 190  008c 4a            	dec	a
 191  008d 2603          	jrne	L21
 192  008f cc0160        	jp	L51
 193  0092               L21:
 194  0092 4a            	dec	a
 195  0093 2603          	jrne	L41
 196  0095 cc0190        	jp	L71
 197  0098               L41:
 198  0098 4a            	dec	a
 199  0099 2603          	jrne	L61
 200  009b cc01c6        	jp	L12
 201  009e               L61:
 202  009e 4a            	dec	a
 203  009f 2603          	jrne	L02
 204  00a1 cc01fc        	jp	L32
 205  00a4               L02:
 206  00a4 ac400240      	jpf	L16
 207  00a8               L3:
 208                     ; 84 	case 1:
 208                     ; 85 #if defined (_WOODANG_TEST_ONLY_)
 208                     ; 86 #else
 208                     ; 87 		uiInfo.houseCapa = 164;	
 210  00a8 35a40010      	mov	_uiInfo+16,#164
 211                     ; 88 		uiInfo.cnt = 1;
 213  00ac 35010005      	mov	_uiInfo+5,#1
 214                     ; 89 		uiInfo.valve = 2;
 216  00b0 3502000a      	mov	_uiInfo+10,#2
 217                     ; 90 		uiInfo.valve_len[0] = 140;
 219  00b4 358c0015      	mov	_uiInfo+21,#140
 220                     ; 91 		uiInfo.valve_len[1] = 150;
 222  00b8 35960016      	mov	_uiInfo+22,#150
 223                     ; 92 		uiInfo.valve_rc[0] = 1;
 225  00bc 3501001d      	mov	_uiInfo+29,#1
 226                     ; 93 		uiInfo.valve_rc[1] = 1;
 228  00c0 3501001e      	mov	_uiInfo+30,#1
 229                     ; 95 		break;
 231  00c4 ac400240      	jpf	L16
 232  00c8               L5:
 233                     ; 96 	case 2:
 233                     ; 97 		uiInfo.houseCapa = 167;	
 235  00c8 35a70010      	mov	_uiInfo+16,#167
 236                     ; 98 		uiInfo.cnt = 1;
 238  00cc 35010005      	mov	_uiInfo+5,#1
 239                     ; 99 		uiInfo.valve = 2;
 241  00d0 3502000a      	mov	_uiInfo+10,#2
 242                     ; 100 		uiInfo.valve_len[0] = 140;
 244  00d4 358c0015      	mov	_uiInfo+21,#140
 245                     ; 101 		uiInfo.valve_len[1] = 150;
 247  00d8 35960016      	mov	_uiInfo+22,#150
 248                     ; 102 		uiInfo.valve_rc[0] = 1;
 250  00dc 3501001d      	mov	_uiInfo+29,#1
 251                     ; 103 		uiInfo.valve_rc[1] = 1;
 253  00e0 3501001e      	mov	_uiInfo+30,#1
 254                     ; 104 		break;
 256  00e4 ac400240      	jpf	L16
 257  00e8               L7:
 258                     ; 106 	case 3:
 258                     ; 107 		uiInfo.houseCapa = 165;	
 260  00e8 35a50010      	mov	_uiInfo+16,#165
 261                     ; 108 		uiInfo.cnt = 2;
 263  00ec 35020005      	mov	_uiInfo+5,#2
 264                     ; 109 		uiInfo.valve = 2;
 266  00f0 3502000a      	mov	_uiInfo+10,#2
 267                     ; 110 		uiInfo.valve_len[0] = 150;
 269  00f4 35960015      	mov	_uiInfo+21,#150
 270                     ; 111 		uiInfo.valve_len[1] = 140;
 272  00f8 358c0016      	mov	_uiInfo+22,#140
 273                     ; 112 		uiInfo.valve_rc[0] = 1;
 275  00fc 3501001d      	mov	_uiInfo+29,#1
 276                     ; 113 		uiInfo.valve_rc[1] = 2;
 278  0100 3502001e      	mov	_uiInfo+30,#2
 279                     ; 114 		break;
 281  0104 ac400240      	jpf	L16
 282  0108               L11:
 283                     ; 115 	case 4:
 283                     ; 116 		uiInfo.houseCapa = 167;	
 285  0108 35a70010      	mov	_uiInfo+16,#167
 286                     ; 117 		uiInfo.cnt = 3;
 288  010c 35030005      	mov	_uiInfo+5,#3
 289                     ; 118 		uiInfo.valve = 3;
 291  0110 3503000a      	mov	_uiInfo+10,#3
 292                     ; 119 		uiInfo.valve_len[0] = 145;
 294  0114 35910015      	mov	_uiInfo+21,#145
 295                     ; 120 		uiInfo.valve_len[1] = 150;
 297  0118 35960016      	mov	_uiInfo+22,#150
 298                     ; 121 		uiInfo.valve_len[2] = 140;
 300  011c 358c0017      	mov	_uiInfo+23,#140
 301                     ; 122 		uiInfo.valve_rc[0] = 1;
 303  0120 3501001d      	mov	_uiInfo+29,#1
 304                     ; 123 		uiInfo.valve_rc[1] = 2;
 306  0124 3502001e      	mov	_uiInfo+30,#2
 307                     ; 124 		uiInfo.valve_rc[2] = 3;
 309  0128 3503001f      	mov	_uiInfo+31,#3
 310                     ; 125 		break;
 312  012c ac400240      	jpf	L16
 313  0130               L31:
 314                     ; 127 	case 5:
 314                     ; 128 		uiInfo.houseCapa = 167;	
 316  0130 35a70010      	mov	_uiInfo+16,#167
 317                     ; 129 		uiInfo.cnt = 4;
 319  0134 35040005      	mov	_uiInfo+5,#4
 320                     ; 130 		uiInfo.valve = 4;
 322  0138 3504000a      	mov	_uiInfo+10,#4
 323                     ; 131 		uiInfo.valve_len[0] = 150;
 325  013c 35960015      	mov	_uiInfo+21,#150
 326                     ; 132 		uiInfo.valve_len[1] = 145;
 328  0140 35910016      	mov	_uiInfo+22,#145
 329                     ; 133 		uiInfo.valve_len[2] = 140;
 331  0144 358c0017      	mov	_uiInfo+23,#140
 332                     ; 134 		uiInfo.valve_len[3] = 140;
 334  0148 358c0018      	mov	_uiInfo+24,#140
 335                     ; 135 		uiInfo.valve_rc[0] = 1;
 337  014c 3501001d      	mov	_uiInfo+29,#1
 338                     ; 136 		uiInfo.valve_rc[1] = 2;
 340  0150 3502001e      	mov	_uiInfo+30,#2
 341                     ; 137 		uiInfo.valve_rc[2] = 3;
 343  0154 3503001f      	mov	_uiInfo+31,#3
 344                     ; 138 		uiInfo.valve_rc[3] = 4;
 346  0158 35040020      	mov	_uiInfo+32,#4
 347                     ; 139 		break;
 349  015c ac400240      	jpf	L16
 350  0160               L51:
 351                     ; 140 	case 6:
 351                     ; 141 		uiInfo.houseCapa = 168;	
 353  0160 35a80010      	mov	_uiInfo+16,#168
 354                     ; 142 		uiInfo.cnt = 4;
 356  0164 35040005      	mov	_uiInfo+5,#4
 357                     ; 143 		uiInfo.valve = 4;
 359  0168 3504000a      	mov	_uiInfo+10,#4
 360                     ; 144 		uiInfo.valve_len[0] = 145;
 362  016c 35910015      	mov	_uiInfo+21,#145
 363                     ; 145 		uiInfo.valve_len[1] = 150;
 365  0170 35960016      	mov	_uiInfo+22,#150
 366                     ; 146 		uiInfo.valve_len[2] = 135;
 368  0174 35870017      	mov	_uiInfo+23,#135
 369                     ; 147 		uiInfo.valve_len[3] = 140;
 371  0178 358c0018      	mov	_uiInfo+24,#140
 372                     ; 148 		uiInfo.valve_rc[0] = 1;
 374  017c 3501001d      	mov	_uiInfo+29,#1
 375                     ; 149 		uiInfo.valve_rc[1] = 2;
 377  0180 3502001e      	mov	_uiInfo+30,#2
 378                     ; 150 		uiInfo.valve_rc[2] = 3;
 380  0184 3503001f      	mov	_uiInfo+31,#3
 381                     ; 151 		uiInfo.valve_rc[3] = 4;
 383  0188 35040020      	mov	_uiInfo+32,#4
 384                     ; 152 		break;
 386  018c ac400240      	jpf	L16
 387  0190               L71:
 388                     ; 154 	case 7:
 388                     ; 155 		uiInfo.houseCapa = 185;	
 390  0190 35b90010      	mov	_uiInfo+16,#185
 391                     ; 156 		uiInfo.cnt = 4;
 393  0194 35040005      	mov	_uiInfo+5,#4
 394                     ; 157 		uiInfo.valve = 5;
 396  0198 3505000a      	mov	_uiInfo+10,#5
 397                     ; 158 		uiInfo.valve_len[0] = 150;
 399  019c 35960015      	mov	_uiInfo+21,#150
 400                     ; 159 		uiInfo.valve_len[1] = 140;
 402  01a0 358c0016      	mov	_uiInfo+22,#140
 403                     ; 160 		uiInfo.valve_len[2] = 135;
 405  01a4 35870017      	mov	_uiInfo+23,#135
 406                     ; 161 		uiInfo.valve_len[3] = 145;
 408  01a8 35910018      	mov	_uiInfo+24,#145
 409                     ; 162 		uiInfo.valve_len[4] = 140;
 411  01ac 358c0019      	mov	_uiInfo+25,#140
 412                     ; 163 		uiInfo.valve_rc[0] = 1;
 414  01b0 3501001d      	mov	_uiInfo+29,#1
 415                     ; 164 		uiInfo.valve_rc[1] = 2;
 417  01b4 3502001e      	mov	_uiInfo+30,#2
 418                     ; 165 		uiInfo.valve_rc[2] = 2;
 420  01b8 3502001f      	mov	_uiInfo+31,#2
 421                     ; 166 		uiInfo.valve_rc[3] = 3;
 423  01bc 35030020      	mov	_uiInfo+32,#3
 424                     ; 167 		uiInfo.valve_rc[4] = 4;
 426  01c0 35040021      	mov	_uiInfo+33,#4
 427                     ; 168 		break;
 429  01c4 207a          	jra	L16
 430  01c6               L12:
 431                     ; 169 	case 8:
 431                     ; 170 		uiInfo.houseCapa = 185;	
 433  01c6 35b90010      	mov	_uiInfo+16,#185
 434                     ; 171 		uiInfo.cnt = 4;
 436  01ca 35040005      	mov	_uiInfo+5,#4
 437                     ; 172 		uiInfo.valve = 5;
 439  01ce 3505000a      	mov	_uiInfo+10,#5
 440                     ; 173 		uiInfo.valve_len[0] = 150;
 442  01d2 35960015      	mov	_uiInfo+21,#150
 443                     ; 174 		uiInfo.valve_len[1] = 145;
 445  01d6 35910016      	mov	_uiInfo+22,#145
 446                     ; 175 		uiInfo.valve_len[2] = 140;
 448  01da 358c0017      	mov	_uiInfo+23,#140
 449                     ; 176 		uiInfo.valve_len[3] = 135;
 451  01de 35870018      	mov	_uiInfo+24,#135
 452                     ; 177 		uiInfo.valve_len[4] = 135;
 454  01e2 35870019      	mov	_uiInfo+25,#135
 455                     ; 178 		uiInfo.valve_rc[0] = 1;
 457  01e6 3501001d      	mov	_uiInfo+29,#1
 458                     ; 179 		uiInfo.valve_rc[1] = 2;
 460  01ea 3502001e      	mov	_uiInfo+30,#2
 461                     ; 180 		uiInfo.valve_rc[2] = 2;
 463  01ee 3502001f      	mov	_uiInfo+31,#2
 464                     ; 181 		uiInfo.valve_rc[3] = 3;
 466  01f2 35030020      	mov	_uiInfo+32,#3
 467                     ; 182 		uiInfo.valve_rc[4] = 4;
 469  01f6 35040021      	mov	_uiInfo+33,#4
 470                     ; 183 		break;
 472  01fa 2044          	jra	L16
 473  01fc               L32:
 474                     ; 185 	case 9:
 474                     ; 186 		uiInfo.houseCapa = 185;	
 476  01fc 35b90010      	mov	_uiInfo+16,#185
 477                     ; 187 		uiInfo.cnt = 5;
 479  0200 35050005      	mov	_uiInfo+5,#5
 480                     ; 188 		uiInfo.valve = 7;
 482  0204 3507000a      	mov	_uiInfo+10,#7
 483                     ; 189 		uiInfo.valve_len[0] = 150;
 485  0208 35960015      	mov	_uiInfo+21,#150
 486                     ; 190 		uiInfo.valve_len[1] = 135;
 488  020c 35870016      	mov	_uiInfo+22,#135
 489                     ; 191 		uiInfo.valve_len[2] = 150;
 491  0210 35960017      	mov	_uiInfo+23,#150
 492                     ; 192 		uiInfo.valve_len[3] = 135;
 494  0214 35870018      	mov	_uiInfo+24,#135
 495                     ; 193 		uiInfo.valve_len[4] = 145;
 497  0218 35910019      	mov	_uiInfo+25,#145
 498                     ; 194 		uiInfo.valve_len[5] = 140;
 500  021c 358c001a      	mov	_uiInfo+26,#140
 501                     ; 195 		uiInfo.valve_len[6] = 150;
 503  0220 3596001b      	mov	_uiInfo+27,#150
 504                     ; 196 		uiInfo.valve_rc[0] = 1;
 506  0224 3501001d      	mov	_uiInfo+29,#1
 507                     ; 197 		uiInfo.valve_rc[1] = 1;
 509  0228 3501001e      	mov	_uiInfo+30,#1
 510                     ; 198 		uiInfo.valve_rc[2] = 2;
 512  022c 3502001f      	mov	_uiInfo+31,#2
 513                     ; 199 		uiInfo.valve_rc[3] = 2;
 515  0230 35020020      	mov	_uiInfo+32,#2
 516                     ; 200 		uiInfo.valve_rc[4] = 3;
 518  0234 35030021      	mov	_uiInfo+33,#3
 519                     ; 201 		uiInfo.valve_rc[5] = 4;
 521  0238 35040022      	mov	_uiInfo+34,#4
 522                     ; 202 		uiInfo.valve_rc[6] = 5;
 524  023c 35050023      	mov	_uiInfo+35,#5
 525                     ; 203 		break;
 527  0240               L16:
 528                     ; 205 }
 531  0240 85            	popw	x
 532  0241 81            	ret
 557                     ; 207 void	char_ext_h(void)
 557                     ; 208 {
 558                     .text:	section	.text,new
 559  0000               _char_ext_h:
 563                     ; 209 	LCD_BIT_SET(b1B);
 565  0000 c60013        	ld	a,_iLF_DEF+19
 566  0003 5f            	clrw	x
 567  0004 97            	ld	xl,a
 568  0005 d6540c        	ld	a,(21516,x)
 569  0008 ca0013        	or	a,_bLF_DEF+19
 570  000b d7540c        	ld	(21516,x),a
 571                     ; 210 	LCD_BIT_SET(b1C);
 573  000e c60033        	ld	a,_iLF_DEF+51
 574  0011 5f            	clrw	x
 575  0012 97            	ld	xl,a
 576  0013 d6540c        	ld	a,(21516,x)
 577  0016 ca0033        	or	a,_bLF_DEF+51
 578  0019 d7540c        	ld	(21516,x),a
 579                     ; 211 	LCD_BIT_SET(b1E);
 581  001c c60022        	ld	a,_iLF_DEF+34
 582  001f 5f            	clrw	x
 583  0020 97            	ld	xl,a
 584  0021 d6540c        	ld	a,(21516,x)
 585  0024 ca0022        	or	a,_bLF_DEF+34
 586  0027 d7540c        	ld	(21516,x),a
 587                     ; 212 	LCD_BIT_SET(b1F);
 589  002a c60012        	ld	a,_iLF_DEF+18
 590  002d 5f            	clrw	x
 591  002e 97            	ld	xl,a
 592  002f d6540c        	ld	a,(21516,x)
 593  0032 ca0012        	or	a,_bLF_DEF+18
 594  0035 d7540c        	ld	(21516,x),a
 595                     ; 213 	LCD_BIT_SET(b1G);
 597  0038 c60023        	ld	a,_iLF_DEF+35
 598  003b 5f            	clrw	x
 599  003c 97            	ld	xl,a
 600  003d d6540c        	ld	a,(21516,x)
 601  0040 ca0023        	or	a,_bLF_DEF+35
 602  0043 d7540c        	ld	(21516,x),a
 603                     ; 214 }
 606  0046 81            	ret
 631                     ; 216 void	char_e3(void)
 631                     ; 217 {
 632                     .text:	section	.text,new
 633  0000               _char_e3:
 637                     ; 218 	LCD_BIT_SET(b3A);
 639  0000 c60007        	ld	a,_iLF_DEF+7
 640  0003 5f            	clrw	x
 641  0004 97            	ld	xl,a
 642  0005 d6540c        	ld	a,(21516,x)
 643  0008 ca0007        	or	a,_bLF_DEF+7
 644  000b d7540c        	ld	(21516,x),a
 645                     ; 219 	LCD_BIT_SET(b3D);
 647  000e c60037        	ld	a,_iLF_DEF+55
 648  0011 5f            	clrw	x
 649  0012 97            	ld	xl,a
 650  0013 d6540c        	ld	a,(21516,x)
 651  0016 ca0037        	or	a,_bLF_DEF+55
 652  0019 d7540c        	ld	(21516,x),a
 653                     ; 220 	LCD_BIT_SET(b3E);
 655  001c c60027        	ld	a,_iLF_DEF+39
 656  001f 5f            	clrw	x
 657  0020 97            	ld	xl,a
 658  0021 d6540c        	ld	a,(21516,x)
 659  0024 ca0027        	or	a,_bLF_DEF+39
 660  0027 d7540c        	ld	(21516,x),a
 661                     ; 221 	LCD_BIT_SET(b3F);
 663  002a c60017        	ld	a,_iLF_DEF+23
 664  002d 5f            	clrw	x
 665  002e 97            	ld	xl,a
 666  002f d6540c        	ld	a,(21516,x)
 667  0032 ca0017        	or	a,_bLF_DEF+23
 668  0035 d7540c        	ld	(21516,x),a
 669                     ; 222 	LCD_BIT_SET(b3G);
 671  0038 c60028        	ld	a,_iLF_DEF+40
 672  003b 5f            	clrw	x
 673  003c 97            	ld	xl,a
 674  003d d6540c        	ld	a,(21516,x)
 675  0040 ca0028        	or	a,_bLF_DEF+40
 676  0043 d7540c        	ld	(21516,x),a
 677                     ; 223 }
 680  0046 81            	ret
 705                     ; 225 void	char_h3(void)
 705                     ; 226 {
 706                     .text:	section	.text,new
 707  0000               _char_h3:
 711                     ; 227 	LCD_BIT_SET(b3B);
 713  0000 c60018        	ld	a,_iLF_DEF+24
 714  0003 5f            	clrw	x
 715  0004 97            	ld	xl,a
 716  0005 d6540c        	ld	a,(21516,x)
 717  0008 ca0018        	or	a,_bLF_DEF+24
 718  000b d7540c        	ld	(21516,x),a
 719                     ; 228 	LCD_BIT_SET(b3C);
 721  000e c60038        	ld	a,_iLF_DEF+56
 722  0011 5f            	clrw	x
 723  0012 97            	ld	xl,a
 724  0013 d6540c        	ld	a,(21516,x)
 725  0016 ca0038        	or	a,_bLF_DEF+56
 726  0019 d7540c        	ld	(21516,x),a
 727                     ; 229 	LCD_BIT_SET(b3E);
 729  001c c60027        	ld	a,_iLF_DEF+39
 730  001f 5f            	clrw	x
 731  0020 97            	ld	xl,a
 732  0021 d6540c        	ld	a,(21516,x)
 733  0024 ca0027        	or	a,_bLF_DEF+39
 734  0027 d7540c        	ld	(21516,x),a
 735                     ; 230 	LCD_BIT_SET(b3F);
 737  002a c60017        	ld	a,_iLF_DEF+23
 738  002d 5f            	clrw	x
 739  002e 97            	ld	xl,a
 740  002f d6540c        	ld	a,(21516,x)
 741  0032 ca0017        	or	a,_bLF_DEF+23
 742  0035 d7540c        	ld	(21516,x),a
 743                     ; 231 	LCD_BIT_SET(b3G);
 745  0038 c60028        	ld	a,_iLF_DEF+40
 746  003b 5f            	clrw	x
 747  003c 97            	ld	xl,a
 748  003d d6540c        	ld	a,(21516,x)
 749  0040 ca0028        	or	a,_bLF_DEF+40
 750  0043 d7540c        	ld	(21516,x),a
 751                     ; 232 }
 754  0046 81            	ret
 779                     ; 234 void	char_e4(void)
 779                     ; 235 {
 780                     .text:	section	.text,new
 781  0000               _char_e4:
 785                     ; 236 	LCD_BIT_SET(b4A);
 787  0000 c60009        	ld	a,_iLF_DEF+9
 788  0003 5f            	clrw	x
 789  0004 97            	ld	xl,a
 790  0005 d6540c        	ld	a,(21516,x)
 791  0008 ca0009        	or	a,_bLF_DEF+9
 792  000b d7540c        	ld	(21516,x),a
 793                     ; 237 	LCD_BIT_SET(b4D);
 795  000e c60039        	ld	a,_iLF_DEF+57
 796  0011 5f            	clrw	x
 797  0012 97            	ld	xl,a
 798  0013 d6540c        	ld	a,(21516,x)
 799  0016 ca0039        	or	a,_bLF_DEF+57
 800  0019 d7540c        	ld	(21516,x),a
 801                     ; 238 	LCD_BIT_SET(b4E);
 803  001c c60029        	ld	a,_iLF_DEF+41
 804  001f 5f            	clrw	x
 805  0020 97            	ld	xl,a
 806  0021 d6540c        	ld	a,(21516,x)
 807  0024 ca0029        	or	a,_bLF_DEF+41
 808  0027 d7540c        	ld	(21516,x),a
 809                     ; 239 	LCD_BIT_SET(b4F);
 811  002a c60019        	ld	a,_iLF_DEF+25
 812  002d 5f            	clrw	x
 813  002e 97            	ld	xl,a
 814  002f d6540c        	ld	a,(21516,x)
 815  0032 ca0019        	or	a,_bLF_DEF+25
 816  0035 d7540c        	ld	(21516,x),a
 817                     ; 240 	LCD_BIT_SET(b4G);
 819  0038 c6002a        	ld	a,_iLF_DEF+42
 820  003b 5f            	clrw	x
 821  003c 97            	ld	xl,a
 822  003d d6540c        	ld	a,(21516,x)
 823  0040 ca002a        	or	a,_bLF_DEF+42
 824  0043 d7540c        	ld	(21516,x),a
 825                     ; 241 }
 828  0046 81            	ret
 853                     ; 243 void	char_L4(void)
 853                     ; 244 {
 854                     .text:	section	.text,new
 855  0000               _char_L4:
 859                     ; 245 	LCD_BIT_SET(b4D);
 861  0000 c60039        	ld	a,_iLF_DEF+57
 862  0003 5f            	clrw	x
 863  0004 97            	ld	xl,a
 864  0005 d6540c        	ld	a,(21516,x)
 865  0008 ca0039        	or	a,_bLF_DEF+57
 866  000b d7540c        	ld	(21516,x),a
 867                     ; 246 	LCD_BIT_SET(b4E);
 869  000e c60029        	ld	a,_iLF_DEF+41
 870  0011 5f            	clrw	x
 871  0012 97            	ld	xl,a
 872  0013 d6540c        	ld	a,(21516,x)
 873  0016 ca0029        	or	a,_bLF_DEF+41
 874  0019 d7540c        	ld	(21516,x),a
 875                     ; 247 	LCD_BIT_SET(b4G);
 877  001c c6002a        	ld	a,_iLF_DEF+42
 878  001f 5f            	clrw	x
 879  0020 97            	ld	xl,a
 880  0021 d6540c        	ld	a,(21516,x)
 881  0024 ca002a        	or	a,_bLF_DEF+42
 882  0027 d7540c        	ld	(21516,x),a
 883                     ; 248 }
 886  002a 81            	ret
 911                     ; 250 void	char_eS(void)
 911                     ; 251 {
 912                     .text:	section	.text,new
 913  0000               _char_eS:
 917                     ; 252 	LCD_BIT_SET(b3A);
 919  0000 c60007        	ld	a,_iLF_DEF+7
 920  0003 5f            	clrw	x
 921  0004 97            	ld	xl,a
 922  0005 d6540c        	ld	a,(21516,x)
 923  0008 ca0007        	or	a,_bLF_DEF+7
 924  000b d7540c        	ld	(21516,x),a
 925                     ; 253 	LCD_BIT_SET(b3D);
 927  000e c60037        	ld	a,_iLF_DEF+55
 928  0011 5f            	clrw	x
 929  0012 97            	ld	xl,a
 930  0013 d6540c        	ld	a,(21516,x)
 931  0016 ca0037        	or	a,_bLF_DEF+55
 932  0019 d7540c        	ld	(21516,x),a
 933                     ; 254 	LCD_BIT_SET(b3C);
 935  001c c60038        	ld	a,_iLF_DEF+56
 936  001f 5f            	clrw	x
 937  0020 97            	ld	xl,a
 938  0021 d6540c        	ld	a,(21516,x)
 939  0024 ca0038        	or	a,_bLF_DEF+56
 940  0027 d7540c        	ld	(21516,x),a
 941                     ; 255 	LCD_BIT_SET(b3F);
 943  002a c60017        	ld	a,_iLF_DEF+23
 944  002d 5f            	clrw	x
 945  002e 97            	ld	xl,a
 946  002f d6540c        	ld	a,(21516,x)
 947  0032 ca0017        	or	a,_bLF_DEF+23
 948  0035 d7540c        	ld	(21516,x),a
 949                     ; 256 	LCD_BIT_SET(b3G);
 951  0038 c60028        	ld	a,_iLF_DEF+40
 952  003b 5f            	clrw	x
 953  003c 97            	ld	xl,a
 954  003d d6540c        	ld	a,(21516,x)
 955  0040 ca0028        	or	a,_bLF_DEF+40
 956  0043 d7540c        	ld	(21516,x),a
 957                     ; 257 }
 960  0046 81            	ret
 985                     ; 260 void	char_a4(void)
 985                     ; 261 {
 986                     .text:	section	.text,new
 987  0000               _char_a4:
 991                     ; 262 	LCD_BIT_SET(b4A);
 993  0000 c60009        	ld	a,_iLF_DEF+9
 994  0003 5f            	clrw	x
 995  0004 97            	ld	xl,a
 996  0005 d6540c        	ld	a,(21516,x)
 997  0008 ca0009        	or	a,_bLF_DEF+9
 998  000b d7540c        	ld	(21516,x),a
 999                     ; 263 	LCD_BIT_SET(b4B);
1001  000e c6001a        	ld	a,_iLF_DEF+26
1002  0011 5f            	clrw	x
1003  0012 97            	ld	xl,a
1004  0013 d6540c        	ld	a,(21516,x)
1005  0016 ca001a        	or	a,_bLF_DEF+26
1006  0019 d7540c        	ld	(21516,x),a
1007                     ; 264 	LCD_BIT_SET(b4C);
1009  001c c6003a        	ld	a,_iLF_DEF+58
1010  001f 5f            	clrw	x
1011  0020 97            	ld	xl,a
1012  0021 d6540c        	ld	a,(21516,x)
1013  0024 ca003a        	or	a,_bLF_DEF+58
1014  0027 d7540c        	ld	(21516,x),a
1015                     ; 265 	LCD_BIT_SET(b4E);
1017  002a c60029        	ld	a,_iLF_DEF+41
1018  002d 5f            	clrw	x
1019  002e 97            	ld	xl,a
1020  002f d6540c        	ld	a,(21516,x)
1021  0032 ca0029        	or	a,_bLF_DEF+41
1022  0035 d7540c        	ld	(21516,x),a
1023                     ; 266 	LCD_BIT_SET(b4G);
1025  0038 c6002a        	ld	a,_iLF_DEF+42
1026  003b 5f            	clrw	x
1027  003c 97            	ld	xl,a
1028  003d d6540c        	ld	a,(21516,x)
1029  0040 ca002a        	or	a,_bLF_DEF+42
1030  0043 d7540c        	ld	(21516,x),a
1031                     ; 267 	LCD_BIT_SET(b4F);
1033  0046 c60019        	ld	a,_iLF_DEF+25
1034  0049 5f            	clrw	x
1035  004a 97            	ld	xl,a
1036  004b d6540c        	ld	a,(21516,x)
1037  004e ca0019        	or	a,_bLF_DEF+25
1038  0051 d7540c        	ld	(21516,x),a
1039                     ; 268 }
1042  0054 81            	ret
1067                     ; 270 void	char_b4(void)
1067                     ; 271 {
1068                     .text:	section	.text,new
1069  0000               _char_b4:
1073                     ; 272 	LCD_BIT_SET(b4D);
1075  0000 c60039        	ld	a,_iLF_DEF+57
1076  0003 5f            	clrw	x
1077  0004 97            	ld	xl,a
1078  0005 d6540c        	ld	a,(21516,x)
1079  0008 ca0039        	or	a,_bLF_DEF+57
1080  000b d7540c        	ld	(21516,x),a
1081                     ; 273 	LCD_BIT_SET(b4C);
1083  000e c6003a        	ld	a,_iLF_DEF+58
1084  0011 5f            	clrw	x
1085  0012 97            	ld	xl,a
1086  0013 d6540c        	ld	a,(21516,x)
1087  0016 ca003a        	or	a,_bLF_DEF+58
1088  0019 d7540c        	ld	(21516,x),a
1089                     ; 274 	LCD_BIT_SET(b4E);
1091  001c c60029        	ld	a,_iLF_DEF+41
1092  001f 5f            	clrw	x
1093  0020 97            	ld	xl,a
1094  0021 d6540c        	ld	a,(21516,x)
1095  0024 ca0029        	or	a,_bLF_DEF+41
1096  0027 d7540c        	ld	(21516,x),a
1097                     ; 275 	LCD_BIT_SET(b4G);
1099  002a c6002a        	ld	a,_iLF_DEF+42
1100  002d 5f            	clrw	x
1101  002e 97            	ld	xl,a
1102  002f d6540c        	ld	a,(21516,x)
1103  0032 ca002a        	or	a,_bLF_DEF+42
1104  0035 d7540c        	ld	(21516,x),a
1105                     ; 276 	LCD_BIT_SET(b4F);
1107  0038 c60019        	ld	a,_iLF_DEF+25
1108  003b 5f            	clrw	x
1109  003c 97            	ld	xl,a
1110  003d d6540c        	ld	a,(21516,x)
1111  0040 ca0019        	or	a,_bLF_DEF+25
1112  0043 d7540c        	ld	(21516,x),a
1113                     ; 277 }
1116  0046 81            	ret
1141                     ; 279 void	char_c4(void)
1141                     ; 280 {
1142                     .text:	section	.text,new
1143  0000               _char_c4:
1147                     ; 281 	LCD_BIT_SET(b4E);
1149  0000 c60029        	ld	a,_iLF_DEF+41
1150  0003 5f            	clrw	x
1151  0004 97            	ld	xl,a
1152  0005 d6540c        	ld	a,(21516,x)
1153  0008 ca0029        	or	a,_bLF_DEF+41
1154  000b d7540c        	ld	(21516,x),a
1155                     ; 282 	LCD_BIT_SET(b4G);
1157  000e c6002a        	ld	a,_iLF_DEF+42
1158  0011 5f            	clrw	x
1159  0012 97            	ld	xl,a
1160  0013 d6540c        	ld	a,(21516,x)
1161  0016 ca002a        	or	a,_bLF_DEF+42
1162  0019 d7540c        	ld	(21516,x),a
1163                     ; 283 	LCD_BIT_SET(b4D);
1165  001c c60039        	ld	a,_iLF_DEF+57
1166  001f 5f            	clrw	x
1167  0020 97            	ld	xl,a
1168  0021 d6540c        	ld	a,(21516,x)
1169  0024 ca0039        	or	a,_bLF_DEF+57
1170  0027 d7540c        	ld	(21516,x),a
1171                     ; 284 }
1174  002a 81            	ret
1199                     ; 286 void	char_d4(void)
1199                     ; 287 {
1200                     .text:	section	.text,new
1201  0000               _char_d4:
1205                     ; 288 	LCD_BIT_SET(b4D);
1207  0000 c60039        	ld	a,_iLF_DEF+57
1208  0003 5f            	clrw	x
1209  0004 97            	ld	xl,a
1210  0005 d6540c        	ld	a,(21516,x)
1211  0008 ca0039        	or	a,_bLF_DEF+57
1212  000b d7540c        	ld	(21516,x),a
1213                     ; 289 	LCD_BIT_SET(b4B);
1215  000e c6001a        	ld	a,_iLF_DEF+26
1216  0011 5f            	clrw	x
1217  0012 97            	ld	xl,a
1218  0013 d6540c        	ld	a,(21516,x)
1219  0016 ca001a        	or	a,_bLF_DEF+26
1220  0019 d7540c        	ld	(21516,x),a
1221                     ; 290 	LCD_BIT_SET(b4C);
1223  001c c6003a        	ld	a,_iLF_DEF+58
1224  001f 5f            	clrw	x
1225  0020 97            	ld	xl,a
1226  0021 d6540c        	ld	a,(21516,x)
1227  0024 ca003a        	or	a,_bLF_DEF+58
1228  0027 d7540c        	ld	(21516,x),a
1229                     ; 291 	LCD_BIT_SET(b4E);
1231  002a c60029        	ld	a,_iLF_DEF+41
1232  002d 5f            	clrw	x
1233  002e 97            	ld	xl,a
1234  002f d6540c        	ld	a,(21516,x)
1235  0032 ca0029        	or	a,_bLF_DEF+41
1236  0035 d7540c        	ld	(21516,x),a
1237                     ; 292 	LCD_BIT_SET(b4G);
1239  0038 c6002a        	ld	a,_iLF_DEF+42
1240  003b 5f            	clrw	x
1241  003c 97            	ld	xl,a
1242  003d d6540c        	ld	a,(21516,x)
1243  0040 ca002a        	or	a,_bLF_DEF+42
1244  0043 d7540c        	ld	(21516,x),a
1245                     ; 293 }
1248  0046 81            	ret
1283                     ; 295 void	_ui_setup_menu_disp(uint8_t id)
1283                     ; 296 {
1284                     .text:	section	.text,new
1285  0000               __ui_setup_menu_disp:
1287  0000 88            	push	a
1288       00000000      OFST:	set	0
1291                     ; 297 	lcd_clear(0);
1293  0001 4f            	clr	a
1294  0002 cd0000        	call	_lcd_clear
1296                     ; 298 	switch( id )
1298  0005 7b01          	ld	a,(OFST+1,sp)
1300                     ; 346 		break;
1301  0007 4a            	dec	a
1302  0008 2722          	jreq	L302
1303  000a 4a            	dec	a
1304  000b 2734          	jreq	L502
1305  000d 4a            	dec	a
1306  000e 2745          	jreq	L702
1307  0010 4a            	dec	a
1308  0011 2750          	jreq	L112
1309  0013 4a            	dec	a
1310  0014 275b          	jreq	L312
1311  0016 4a            	dec	a
1312  0017 2766          	jreq	L512
1313  0019 4a            	dec	a
1314  001a 2777          	jreq	L712
1315  001c 4a            	dec	a
1316  001d 2603cc00a1    	jreq	L122
1317  0022 4a            	dec	a
1318  0023 2603          	jrne	L05
1319  0025 cc00b5        	jp	L322
1320  0028               L05:
1321  0028 acc700c7      	jpf	L342
1322  002c               L302:
1323                     ; 300 	case 1:
1323                     ; 301 #if defined (_WOODANG_TEST_ONLY_)
1323                     ; 302 		lcd_disp_n(0, 0);
1323                     ; 303 		lcd_disp_n(1, 0);
1323                     ; 304 #else
1323                     ; 305 		lcd_disp_n(0, 2);
1325  002c ae0002        	ldw	x,#2
1326  002f cd0000        	call	_lcd_disp_n
1328                     ; 306 		lcd_disp_n(1, 7);
1330  0032 ae0107        	ldw	x,#263
1331  0035 cd0000        	call	_lcd_disp_n
1333                     ; 307 		lcd_disp_n(3, 1);
1335  0038 ae0301        	ldw	x,#769
1336  003b cd0000        	call	_lcd_disp_n
1338                     ; 309 		break;
1340  003e cc00c7        	jra	L342
1341  0041               L502:
1342                     ; 310 	case 2:
1342                     ; 311 		lcd_disp_n(0, 2);
1344  0041 ae0002        	ldw	x,#2
1345  0044 cd0000        	call	_lcd_disp_n
1347                     ; 312 		lcd_disp_n(1, 7);
1349  0047 ae0107        	ldw	x,#263
1350  004a cd0000        	call	_lcd_disp_n
1352                     ; 313 		lcd_disp_n(3, 2);
1354  004d ae0302        	ldw	x,#770
1355  0050 cd0000        	call	_lcd_disp_n
1357                     ; 314 		break;
1359  0053 2072          	jra	L342
1360  0055               L702:
1361                     ; 316 	case 3:
1361                     ; 317 		lcd_disp_n(0, 3);
1363  0055 ae0003        	ldw	x,#3
1364  0058 cd0000        	call	_lcd_disp_n
1366                     ; 318 		lcd_disp_n(1, 2);
1368  005b ae0102        	ldw	x,#258
1369  005e cd0000        	call	_lcd_disp_n
1371                     ; 319 		break;
1373  0061 2064          	jra	L342
1374  0063               L112:
1375                     ; 320 	case 4:
1375                     ; 321 		lcd_disp_n(0, 4);
1377  0063 ae0004        	ldw	x,#4
1378  0066 cd0000        	call	_lcd_disp_n
1380                     ; 322 		lcd_disp_n(1, 2);
1382  0069 ae0102        	ldw	x,#258
1383  006c cd0000        	call	_lcd_disp_n
1385                     ; 323 		break;
1387  006f 2056          	jra	L342
1388  0071               L312:
1389                     ; 324 	case 5:
1389                     ; 325 		lcd_disp_n(0, 5);
1391  0071 ae0005        	ldw	x,#5
1392  0074 cd0000        	call	_lcd_disp_n
1394                     ; 326 		lcd_disp_n(1, 9);
1396  0077 ae0109        	ldw	x,#265
1397  007a cd0000        	call	_lcd_disp_n
1399                     ; 327 		break;
1401  007d 2048          	jra	L342
1402  007f               L512:
1403                     ; 328 	case 6:
1403                     ; 329 		lcd_disp_n(0, 5);
1405  007f ae0005        	ldw	x,#5
1406  0082 cd0000        	call	_lcd_disp_n
1408                     ; 330 		lcd_disp_n(1, 9);
1410  0085 ae0109        	ldw	x,#265
1411  0088 cd0000        	call	_lcd_disp_n
1413                     ; 331 		lcd_disp_n(3, 1);
1415  008b ae0301        	ldw	x,#769
1416  008e cd0000        	call	_lcd_disp_n
1418                     ; 332 		break;
1420  0091 2034          	jra	L342
1421  0093               L712:
1422                     ; 333 	case 7:
1422                     ; 334 		lcd_disp_n(0, 8);
1424  0093 ae0008        	ldw	x,#8
1425  0096 cd0000        	call	_lcd_disp_n
1427                     ; 335 		lcd_disp_n(1, 4);
1429  0099 ae0104        	ldw	x,#260
1430  009c cd0000        	call	_lcd_disp_n
1432                     ; 336 		break;
1434  009f 2026          	jra	L342
1435  00a1               L122:
1436                     ; 337 	case 8:
1436                     ; 338 		lcd_disp_n(0, 8);
1438  00a1 ae0008        	ldw	x,#8
1439  00a4 cd0000        	call	_lcd_disp_n
1441                     ; 339 		lcd_disp_n(1, 4);
1443  00a7 ae0104        	ldw	x,#260
1444  00aa cd0000        	call	_lcd_disp_n
1446                     ; 340 		lcd_disp_n(3, 1);
1448  00ad ae0301        	ldw	x,#769
1449  00b0 cd0000        	call	_lcd_disp_n
1451                     ; 341 		break;
1453  00b3 2012          	jra	L342
1454  00b5               L322:
1455                     ; 342 	case 9:
1455                     ; 343 		lcd_disp_n(0, 1);
1457  00b5 ae0001        	ldw	x,#1
1458  00b8 cd0000        	call	_lcd_disp_n
1460                     ; 344 		lcd_disp_n(1, 1);
1462  00bb ae0101        	ldw	x,#257
1463  00be cd0000        	call	_lcd_disp_n
1465                     ; 345 		lcd_disp_n(2, 4);
1467  00c1 ae0204        	ldw	x,#516
1468  00c4 cd0000        	call	_lcd_disp_n
1470                     ; 346 		break;
1472  00c7               L342:
1473                     ; 349 }
1476  00c7 84            	pop	a
1477  00c8 81            	ret
1513                     ; 351 void	_ui_setup_menu(void)
1513                     ; 352 {
1514                     .text:	section	.text,new
1515  0000               __ui_setup_menu:
1517  0000 88            	push	a
1518       00000001      OFST:	set	1
1521                     ; 355 	i = _uiSetup;
1523  0001 c60000        	ld	a,__uiSetup
1524  0004 6b01          	ld	(OFST+0,sp),a
1525                     ; 356 	if( uiInfo.enc != 0 )
1527  0006 725d0000      	tnz	_uiInfo
1528  000a 2728          	jreq	L162
1529                     ; 358 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
1531  000c c60000        	ld	a,_uiInfo
1532  000f a540          	bcp	a,#64
1533  0011 2604          	jrne	L45
1534  0013 a6ff          	ld	a,#255
1535  0015 2002          	jra	L65
1536  0017               L45:
1537  0017 a601          	ld	a,#1
1538  0019               L65:
1539  0019 1b01          	add	a,(OFST+0,sp)
1540  001b 6b01          	ld	(OFST+0,sp),a
1541                     ; 362 		if( i==0 )	i = __COUNT;
1543  001d 0d01          	tnz	(OFST+0,sp)
1544  001f 2604          	jrne	L362
1547  0021 a609          	ld	a,#9
1548  0023 6b01          	ld	(OFST+0,sp),a
1549  0025               L362:
1550                     ; 363 		if( i>__COUNT )	i = 1;
1552  0025 7b01          	ld	a,(OFST+0,sp)
1553  0027 a10a          	cp	a,#10
1554  0029 2504          	jrult	L562
1557  002b a601          	ld	a,#1
1558  002d 6b01          	ld	(OFST+0,sp),a
1559  002f               L562:
1560                     ; 365 		_uiSetup = i;
1562  002f 7b01          	ld	a,(OFST+0,sp)
1563  0031 c70000        	ld	__uiSetup,a
1564  0034               L162:
1565                     ; 367 	if( _dsPrev != i )
1567  0034 c60000        	ld	a,__dsPrev
1568  0037 1101          	cp	a,(OFST+0,sp)
1569  0039 270a          	jreq	L762
1570                     ; 369 		_dsPrev = i;
1572  003b 7b01          	ld	a,(OFST+0,sp)
1573  003d c70000        	ld	__dsPrev,a
1574                     ; 370 		_ui_setup_menu_disp(i);
1576  0040 7b01          	ld	a,(OFST+0,sp)
1577  0042 cd0000        	call	__ui_setup_menu_disp
1579  0045               L762:
1580                     ; 373 }
1583  0045 84            	pop	a
1584  0046 81            	ret
1587                     	switch	.data
1588  0003               ___delayi:
1589  0003 00            	dc.b	0
1649                     ; 389 void	_ui_setup(uint8_t key)
1649                     ; 390 {
1650                     .text:	section	.text,new
1651  0000               __ui_setup:
1653  0000 88            	push	a
1654  0001 88            	push	a
1655       00000001      OFST:	set	1
1658                     ; 391 	uint8_t	i = 0;
1660                     ; 392 	if( __s == 0 )
1662  0002 725d0000      	tnz	___s
1663  0006 266e          	jrne	L703
1664                     ; 394 		if( _dsCount == 0 )
1666  0008 725d0000      	tnz	__dsCount
1667  000c 2612          	jrne	L113
1668                     ; 396 			uiInfo.id = 1;
1670  000e 35010004      	mov	_uiInfo+4,#1
1671                     ; 397 			_dsCount = 1;
1673  0012 35010000      	mov	__dsCount,#1
1674                     ; 398 			_ui_setup_menu_disp(_uiSetup);
1676  0016 c60000        	ld	a,__uiSetup
1677  0019 cd0000        	call	__ui_setup_menu_disp
1680  001c ac160116      	jpf	L323
1681  0020               L113:
1682                     ; 400 		else if( _dsCount == 1 )
1684  0020 c60000        	ld	a,__dsCount
1685  0023 a101          	cp	a,#1
1686  0025 2703          	jreq	L46
1687  0027 cc0116        	jp	L323
1688  002a               L46:
1689                     ; 402 			_ui_setup_menu();
1691  002a cd0000        	call	__ui_setup_menu
1693                     ; 403 			if( key == 3 )
1695  002d 7b02          	ld	a,(OFST+1,sp)
1696  002f a103          	cp	a,#3
1697  0031 2703          	jreq	L66
1698  0033 cc0116        	jp	L323
1699  0036               L66:
1700                     ; 406 				mode_recover = 1;
1702  0036 35010000      	mov	_mode_recover,#1
1703                     ; 407 				_ui_setup_info(_uiSetup);
1705  003a c60000        	ld	a,__uiSetup
1706  003d cd0000        	call	__ui_setup_info
1708                     ; 408 				func_rc_setting();
1710  0040 cd0000        	call	_func_rc_setting
1712                     ; 409 				__func_rc_timerout = 10;
1714  0043 350a0000      	mov	___func_rc_timerout,#10
1715                     ; 410 				__func_rc_timerout1 = 0;
1717  0047 725f0000      	clr	___func_rc_timerout1
1718                     ; 411 				__func_rc_timerout2 = __timer1s;
1720  004b 5500000000    	mov	___func_rc_timerout2,___timer1s
1721                     ; 412 				_dsCount = 1;
1723  0050 35010000      	mov	__dsCount,#1
1724                     ; 413 				__s = 1;
1726  0054 35010000      	mov	___s,#1
1727                     ; 414 				if( _uiSetup != _uiSetupPrev )
1729  0058 c60000        	ld	a,__uiSetup
1730  005b c10001        	cp	a,__uiSetupPrev
1731  005e 2603          	jrne	L07
1732  0060 cc0116        	jp	L323
1733  0063               L07:
1734                     ; 416 					_uiSetupPrev = _uiSetup;
1736  0063 5500000001    	mov	__uiSetupPrev,__uiSetup
1737                     ; 417 					FW_SETUP_LAST(_uiSetup);
1739  0068 c60000        	ld	a,__uiSetup
1740  006b 97            	ld	xl,a
1741  006c a63e          	ld	a,#62
1742  006e 95            	ld	xh,a
1743  006f cd0000        	call	_file_write
1745  0072 ac160116      	jpf	L323
1746  0076               L703:
1747                     ; 422 	else if( __s == 1 )
1749  0076 c60000        	ld	a,___s
1750  0079 a101          	cp	a,#1
1751  007b 2703          	jreq	L27
1752  007d cc0116        	jp	L323
1753  0080               L27:
1754                     ; 424 		if( (_t20ms%10) != 0 )
1756  0080 c60000        	ld	a,__t20ms
1757  0083 5f            	clrw	x
1758  0084 97            	ld	xl,a
1759  0085 a60a          	ld	a,#10
1760  0087 cd0000        	call	c_smodx
1762  008a a30000        	cpw	x,#0
1763  008d 2706          	jreq	L723
1764                     ; 426 			_dsPrev = 0;
1766  008f 725f0000      	clr	__dsPrev
1767                     ; 427 			return;
1769  0093 2006          	jra	L26
1770  0095               L723:
1771                     ; 430 		if( _dsPrev != 0 )
1773  0095 725d0000      	tnz	__dsPrev
1774  0099 2702          	jreq	L133
1775                     ; 431 			return;
1776  009b               L26:
1779  009b 85            	popw	x
1780  009c 81            	ret
1781  009d               L133:
1782                     ; 433 		_dsCount++;
1784  009d 725c0000      	inc	__dsCount
1785                     ; 434 		_dsPrev = 1;
1787  00a1 35010000      	mov	__dsPrev,#1
1788                     ; 435 		lcd_clear(0);
1790  00a5 4f            	clr	a
1791  00a6 cd0000        	call	_lcd_clear
1793                     ; 436 		for( i=0; i<4; i++ )
1795  00a9 0f01          	clr	(OFST+0,sp)
1796  00ab               L333:
1797                     ; 437 			lcd_disp_n(i, _dsCount%10);
1799  00ab c60000        	ld	a,__dsCount
1800  00ae 5f            	clrw	x
1801  00af 97            	ld	xl,a
1802  00b0 a60a          	ld	a,#10
1803  00b2 62            	div	x,a
1804  00b3 5f            	clrw	x
1805  00b4 97            	ld	xl,a
1806  00b5 9f            	ld	a,xl
1807  00b6 97            	ld	xl,a
1808  00b7 7b01          	ld	a,(OFST+0,sp)
1809  00b9 95            	ld	xh,a
1810  00ba cd0000        	call	_lcd_disp_n
1812                     ; 436 		for( i=0; i<4; i++ )
1814  00bd 0c01          	inc	(OFST+0,sp)
1817  00bf 7b01          	ld	a,(OFST+0,sp)
1818  00c1 a104          	cp	a,#4
1819  00c3 25e6          	jrult	L333
1820                     ; 439 		if( __func_rc_settingCb == 1 && _dsCount >= 30 && getSettingChange() == 0 )
1822  00c5 c60000        	ld	a,___func_rc_settingCb
1823  00c8 a101          	cp	a,#1
1824  00ca 2617          	jrne	L143
1826  00cc c60000        	ld	a,__dsCount
1827  00cf a11e          	cp	a,#30
1828  00d1 2510          	jrult	L143
1830  00d3 cd0000        	call	_getSettingChange
1832  00d6 4d            	tnz	a
1833  00d7 260a          	jrne	L143
1834                     ; 441 			__s = 0;
1836  00d9 725f0000      	clr	___s
1837                     ; 442 			_dsCount = 0;
1839  00dd 725f0000      	clr	__dsCount
1840                     ; 444 			return;
1842  00e1 20b8          	jra	L26
1843  00e3               L143:
1844                     ; 446 		if( __timer1s != __func_rc_timerout2 )
1846  00e3 c60000        	ld	a,___timer1s
1847  00e6 c10000        	cp	a,___func_rc_timerout2
1848  00e9 2727          	jreq	L343
1849                     ; 448 			if( __func_rc_timerout1 == 0 )
1851  00eb 725d0000      	tnz	___func_rc_timerout1
1852  00ef 2625          	jrne	L323
1853                     ; 450 				__func_rc_timerout2 = __timer1s;
1855  00f1 5500000000    	mov	___func_rc_timerout2,___timer1s
1856                     ; 451 				__func_rc_timerout1 = 1;
1858  00f6 35010000      	mov	___func_rc_timerout1,#1
1859                     ; 452 				__func_rc_timerout--;
1861  00fa 725a0000      	dec	___func_rc_timerout
1862                     ; 453 				if( __func_rc_timerout == 0 )
1864  00fe 725d0000      	tnz	___func_rc_timerout
1865  0102 2612          	jrne	L323
1866                     ; 457 						ui_error = 19;
1868  0104 35130000      	mov	_ui_error,#19
1869                     ; 458 						_ds = 97;
1871  0108 35610000      	mov	__ds,#97
1872                     ; 459 						_dsCount = 0;
1874  010c 725f0000      	clr	__dsCount
1875  0110 2004          	jra	L323
1876  0112               L343:
1877                     ; 464 			__func_rc_timerout1 = 0;
1879  0112 725f0000      	clr	___func_rc_timerout1
1880  0116               L323:
1881                     ; 466 }
1883  0116 2083          	jra	L26
1940                     ; 469 uint8_t	_ui_writer(uint8_t key)
1940                     ; 470 {
1941                     .text:	section	.text,new
1942  0000               __ui_writer:
1944  0000 88            	push	a
1945       00000001      OFST:	set	1
1948                     ; 471 	uint8_t	i = 0;
1950                     ; 472 	if( __s == 0 )
1952  0001 725d0000      	tnz	___s
1953  0005 263c          	jrne	L173
1954                     ; 474 		if( _dsCount == 0 )
1956  0007 725d0000      	tnz	__dsCount
1957  000b 260c          	jrne	L373
1958                     ; 476 			uiInfo.id = 1;
1960  000d 35010004      	mov	_uiInfo+4,#1
1961                     ; 477 			_dsCount = 1;
1963  0011 35010000      	mov	__dsCount,#1
1965  0015 ac4f014f      	jpf	L104
1966  0019               L373:
1967                     ; 480 		else if( _dsCount == 1 )
1969  0019 c60000        	ld	a,__dsCount
1970  001c a101          	cp	a,#1
1971  001e 2703          	jreq	L67
1972  0020 cc014f        	jp	L104
1973  0023               L67:
1974                     ; 486 				mode_recover = 1;
1976  0023 35010000      	mov	_mode_recover,#1
1977                     ; 488 				func_rc_setting();
1979  0027 cd0000        	call	_func_rc_setting
1981                     ; 489 				__func_rc_timerout = 10;
1983  002a 350a0000      	mov	___func_rc_timerout,#10
1984                     ; 490 				__func_rc_timerout1 = 0;
1986  002e 725f0000      	clr	___func_rc_timerout1
1987                     ; 491 				__func_rc_timerout2 = __timer1s;
1989  0032 5500000000    	mov	___func_rc_timerout2,___timer1s
1990                     ; 492 				_dsCount = 1;
1992  0037 35010000      	mov	__dsCount,#1
1993                     ; 493 				__s = 1;
1995  003b 35010000      	mov	___s,#1
1996  003f ac4f014f      	jpf	L104
1997  0043               L173:
1998                     ; 504 	else if( __s == 10 )
2000  0043 c60000        	ld	a,___s
2001  0046 a10a          	cp	a,#10
2002  0048 2663          	jrne	L304
2003                     ; 506 		if( (_t20ms%10) != 0 )
2005  004a c60000        	ld	a,__t20ms
2006  004d 5f            	clrw	x
2007  004e 97            	ld	xl,a
2008  004f a60a          	ld	a,#10
2009  0051 cd0000        	call	c_smodx
2011  0054 a30000        	cpw	x,#0
2012  0057 2708          	jreq	L504
2013                     ; 508 			_dsPrev = 0;
2015  0059 725f0000      	clr	__dsPrev
2016                     ; 509 			return 0;
2018  005d 4f            	clr	a
2021  005e 5b01          	addw	sp,#1
2022  0060 81            	ret
2023  0061               L504:
2024                     ; 512 		if( _dsPrev != 0 )
2026  0061 725d0000      	tnz	__dsPrev
2027  0065 2704          	jreq	L704
2028                     ; 513 			return 0;
2030  0067 4f            	clr	a
2033  0068 5b01          	addw	sp,#1
2034  006a 81            	ret
2035  006b               L704:
2036                     ; 515 		_dsCount++;
2038  006b 725c0000      	inc	__dsCount
2039                     ; 516 		_dsPrev = 1;
2041  006f 35010000      	mov	__dsPrev,#1
2042                     ; 517 		lcd_clear(0);
2044  0073 4f            	clr	a
2045  0074 cd0000        	call	_lcd_clear
2047                     ; 518 		for( i=0; i<4; i++ )
2049  0077 0f01          	clr	(OFST+0,sp)
2050  0079               L114:
2051                     ; 519 			lcd_disp_n(i, _dsCount%10);
2053  0079 c60000        	ld	a,__dsCount
2054  007c 5f            	clrw	x
2055  007d 97            	ld	xl,a
2056  007e a60a          	ld	a,#10
2057  0080 62            	div	x,a
2058  0081 5f            	clrw	x
2059  0082 97            	ld	xl,a
2060  0083 9f            	ld	a,xl
2061  0084 97            	ld	xl,a
2062  0085 7b01          	ld	a,(OFST+0,sp)
2063  0087 95            	ld	xh,a
2064  0088 cd0000        	call	_lcd_disp_n
2066                     ; 518 		for( i=0; i<4; i++ )
2068  008b 0c01          	inc	(OFST+0,sp)
2071  008d 7b01          	ld	a,(OFST+0,sp)
2072  008f a104          	cp	a,#4
2073  0091 25e6          	jrult	L114
2074                     ; 521 		__delayi--;
2076  0093 725a0003      	dec	___delayi
2077                     ; 522 		if( __delayi == 0 )
2079  0097 725d0003      	tnz	___delayi
2080  009b 2703          	jreq	L001
2081  009d cc014f        	jp	L104
2082  00a0               L001:
2083                     ; 525 			__s = 0;
2085  00a0 725f0000      	clr	___s
2086                     ; 526 			_dsCount = 0;
2088  00a4 725f0000      	clr	__dsCount
2089                     ; 527 			return 1;
2091  00a8 a601          	ld	a,#1
2094  00aa 5b01          	addw	sp,#1
2095  00ac 81            	ret
2096  00ad               L304:
2097                     ; 530 	else if( __s == 1 )
2099  00ad c60000        	ld	a,___s
2100  00b0 a101          	cp	a,#1
2101  00b2 2703          	jreq	L201
2102  00b4 cc014f        	jp	L104
2103  00b7               L201:
2104                     ; 532 		if( (_t20ms%10) != 0 )
2106  00b7 c60000        	ld	a,__t20ms
2107  00ba 5f            	clrw	x
2108  00bb 97            	ld	xl,a
2109  00bc a60a          	ld	a,#10
2110  00be cd0000        	call	c_smodx
2112  00c1 a30000        	cpw	x,#0
2113  00c4 2708          	jreq	L524
2114                     ; 534 			_dsPrev = 0;
2116  00c6 725f0000      	clr	__dsPrev
2117                     ; 535 			return 0;
2119  00ca 4f            	clr	a
2122  00cb 5b01          	addw	sp,#1
2123  00cd 81            	ret
2124  00ce               L524:
2125                     ; 538 		if( _dsPrev != 0 )
2127  00ce 725d0000      	tnz	__dsPrev
2128  00d2 2704          	jreq	L724
2129                     ; 539 			return 0;
2131  00d4 4f            	clr	a
2134  00d5 5b01          	addw	sp,#1
2135  00d7 81            	ret
2136  00d8               L724:
2137                     ; 541 		_dsCount++;
2139  00d8 725c0000      	inc	__dsCount
2140                     ; 542 		_dsPrev = 1;
2142  00dc 35010000      	mov	__dsPrev,#1
2143                     ; 543 		lcd_clear(0);
2145  00e0 4f            	clr	a
2146  00e1 cd0000        	call	_lcd_clear
2148                     ; 544 		for( i=0; i<4; i++ )
2150  00e4 0f01          	clr	(OFST+0,sp)
2151  00e6               L134:
2152                     ; 545 			lcd_disp_n(i, _dsCount%10);
2154  00e6 c60000        	ld	a,__dsCount
2155  00e9 5f            	clrw	x
2156  00ea 97            	ld	xl,a
2157  00eb a60a          	ld	a,#10
2158  00ed 62            	div	x,a
2159  00ee 5f            	clrw	x
2160  00ef 97            	ld	xl,a
2161  00f0 9f            	ld	a,xl
2162  00f1 97            	ld	xl,a
2163  00f2 7b01          	ld	a,(OFST+0,sp)
2164  00f4 95            	ld	xh,a
2165  00f5 cd0000        	call	_lcd_disp_n
2167                     ; 544 		for( i=0; i<4; i++ )
2169  00f8 0c01          	inc	(OFST+0,sp)
2172  00fa 7b01          	ld	a,(OFST+0,sp)
2173  00fc a104          	cp	a,#4
2174  00fe 25e6          	jrult	L134
2175                     ; 547 		if( __func_rc_settingCb == 1 && _dsCount >= 30 && getSettingChange() == 0 )
2177  0100 c60000        	ld	a,___func_rc_settingCb
2178  0103 a101          	cp	a,#1
2179  0105 2615          	jrne	L734
2181  0107 c60000        	ld	a,__dsCount
2182  010a a11e          	cp	a,#30
2183  010c 250e          	jrult	L734
2185  010e cd0000        	call	_getSettingChange
2187  0111 4d            	tnz	a
2188  0112 2608          	jrne	L734
2189                     ; 549 			__delayi = 12;
2191  0114 350c0003      	mov	___delayi,#12
2192                     ; 550 			__s = 10;
2194  0118 350a0000      	mov	___s,#10
2195  011c               L734:
2196                     ; 552 		if( __timer1s != __func_rc_timerout2 )
2198  011c c60000        	ld	a,___timer1s
2199  011f c10000        	cp	a,___func_rc_timerout2
2200  0122 2727          	jreq	L144
2201                     ; 554 			if( __func_rc_timerout1 == 0 )
2203  0124 725d0000      	tnz	___func_rc_timerout1
2204  0128 2625          	jrne	L104
2205                     ; 556 				__func_rc_timerout2 = __timer1s;
2207  012a 5500000000    	mov	___func_rc_timerout2,___timer1s
2208                     ; 557 				__func_rc_timerout1 = 1;
2210  012f 35010000      	mov	___func_rc_timerout1,#1
2211                     ; 558 				__func_rc_timerout--;
2213  0133 725a0000      	dec	___func_rc_timerout
2214                     ; 559 				if( __func_rc_timerout == 0 )
2216  0137 725d0000      	tnz	___func_rc_timerout
2217  013b 2612          	jrne	L104
2218                     ; 563 						ui_error = 19;
2220  013d 35130000      	mov	_ui_error,#19
2221                     ; 564 						_ds = 97;
2223  0141 35610000      	mov	__ds,#97
2224                     ; 565 						_dsCount = 0;
2226  0145 725f0000      	clr	__dsCount
2227  0149 2004          	jra	L104
2228  014b               L144:
2229                     ; 570 			__func_rc_timerout1 = 0;
2231  014b 725f0000      	clr	___func_rc_timerout1
2232  014f               L104:
2233                     ; 572 	return 0;
2235  014f 4f            	clr	a
2238  0150 5b01          	addw	sp,#1
2239  0152 81            	ret
2282                     	xdef	__ui_writer
2283                     	xdef	__ui_setup
2284                     	xdef	___delayi
2285                     	xref	_getSettingChange
2286                     	xref	_mode_recover
2287                     	xref	_ui_error
2288                     	xref	___func_rc_timerout2
2289                     	xref	___func_rc_timerout1
2290                     	xref	___func_rc_timerout
2291                     	xref	_func_rc_setting
2292                     	xref	___func_rc_settingCb
2293                     	xdef	__ui_setup_menu
2294                     	xdef	__ui_setup_menu_disp
2295                     	xdef	_char_d4
2296                     	xdef	_char_c4
2297                     	xdef	_char_b4
2298                     	xdef	_char_a4
2299                     	xdef	_char_eS
2300                     	xdef	_char_L4
2301                     	xdef	_char_e4
2302                     	xdef	_char_h3
2303                     	xdef	_char_e3
2304                     	xdef	_char_ext_h
2305                     	xdef	__ui_setup_info
2306                     	xdef	___cntlMode
2307                     	xref	__boiler_type
2308                     	xdef	__uiSetupPrev
2309                     	xdef	__uiSetup
2310                     	xref	__dsPrev
2311                     	xref	__dsCount
2312                     	xref	__ds
2313                     	xref	___s
2314                     	xref	_lcd_disp_n
2315                     	xref	_lcd_clear
2316                     	xref	_iLF_DEF
2317                     	xref	_bLF_DEF
2318                     	xref	_uiInfo
2319                     	xref	_file_write
2320                     	xref	___timer1s
2321                     	xref	__t20ms
2322                     	xref.b	c_x
2341                     	xref	c_smodx
2342                     	end
