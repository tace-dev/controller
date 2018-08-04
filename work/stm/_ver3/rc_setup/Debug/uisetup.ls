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
 116                     ; 36 	__cntlMode = uiInfo.cntlMode = 0;	//	0 local, 1 each
 118  002e 725f0003      	clr	_uiInfo+3
 119  0032 725f0002      	clr	___cntlMode
 120                     ; 37 	uiInfo.houseCapa = 150;		//100 default for each mode;
 122  0036 35960010      	mov	_uiInfo+16,#150
 123                     ; 54 _boiler_type = 0;		//	0 normal, 1 plc
 125  003a 725f0000      	clr	__boiler_type
 126                     ; 55 uiInfo.plc = 0;
 128  003e 725f0064      	clr	_uiInfo+100
 129                     ; 58 	for( i=0; i<8; i++ )
 131  0042 0f01          	clr	(OFST+0,sp)
 132  0044               L74:
 133                     ; 60 		uiInfo.valve_len[i] = 0;
 135  0044 7b01          	ld	a,(OFST+0,sp)
 136  0046 5f            	clrw	x
 137  0047 97            	ld	xl,a
 138  0048 724f0015      	clr	(_uiInfo+21,x)
 139                     ; 61 		uiInfo.valve_rc[i] = 0;
 141  004c 7b01          	ld	a,(OFST+0,sp)
 142  004e 5f            	clrw	x
 143  004f 97            	ld	xl,a
 144  0050 724f001d      	clr	(_uiInfo+29,x)
 145                     ; 62 		uiInfo.valve_sub_len[i] = 0;
 147  0054 7b01          	ld	a,(OFST+0,sp)
 148  0056 5f            	clrw	x
 149  0057 97            	ld	xl,a
 150  0058 724f0025      	clr	(_uiInfo+37,x)
 151                     ; 63 		uiInfo.valve_sub_rc[i] = 0;
 153  005c 7b01          	ld	a,(OFST+0,sp)
 154  005e 5f            	clrw	x
 155  005f 97            	ld	xl,a
 156  0060 724f002d      	clr	(_uiInfo+45,x)
 157                     ; 58 	for( i=0; i<8; i++ )
 159  0064 0c01          	inc	(OFST+0,sp)
 162  0066 7b01          	ld	a,(OFST+0,sp)
 163  0068 a108          	cp	a,#8
 164  006a 25d8          	jrult	L74
 165                     ; 77 	uiInfo.valve_len[7] |= 0x40;
 167  006c 721c001c      	bset	_uiInfo+28,#6
 168                     ; 82 	switch( id )
 170  0070 7b02          	ld	a,(OFST+1,sp)
 172                     ; 228 		break;
 173  0072 4a            	dec	a
 174  0073 272b          	jreq	L3
 175  0075 4a            	dec	a
 176  0076 2768          	jreq	L5
 177  0078 4a            	dec	a
 178  0079 2603          	jrne	L6
 179  007b cc0118        	jp	L7
 180  007e               L6:
 181  007e 4a            	dec	a
 182  007f 2603          	jrne	L01
 183  0081 cc0158        	jp	L11
 184  0084               L01:
 185  0084 4a            	dec	a
 186  0085 2603          	jrne	L21
 187  0087 cc0190        	jp	L31
 188  008a               L21:
 189  008a 4a            	dec	a
 190  008b 2603          	jrne	L41
 191  008d cc01d0        	jp	L51
 192  0090               L41:
 193  0090 4a            	dec	a
 194  0091 2603          	jrne	L61
 195  0093 cc020e        	jp	L71
 196  0096               L61:
 197  0096 4a            	dec	a
 198  0097 2603          	jrne	L02
 199  0099 cc023c        	jp	L12
 200  009c               L02:
 201  009c ac780278      	jpf	L75
 202  00a0               L3:
 203                     ; 84 	case 1:
 203                     ; 85 #if defined (_WOODANG_TEST_ONLY_)
 203                     ; 86 		uiInfo.cnt = 4;
 203                     ; 87 		uiInfo.valve = 4;
 203                     ; 88 		uiInfo.valve_len[0] = 150;
 203                     ; 89 		uiInfo.valve_len[1] = 120;
 203                     ; 90 		uiInfo.valve_len[2] = 100;
 203                     ; 91 		uiInfo.valve_len[3] = 80;
 203                     ; 92 		uiInfo.valve_rc[0] = 1;
 203                     ; 93 		uiInfo.valve_rc[1] = 2;
 203                     ; 94 		uiInfo.valve_rc[2] = 3;
 203                     ; 95 		uiInfo.valve_rc[3] = 4;
 203                     ; 96 #else
 203                     ; 97 		uiInfo.houseCapa = 164;	
 205  00a0 35a40010      	mov	_uiInfo+16,#164
 206                     ; 98 		uiInfo.cnt = 5;
 208  00a4 35050005      	mov	_uiInfo+5,#5
 209                     ; 99 		uiInfo.valve = 6;
 211  00a8 3506000a      	mov	_uiInfo+10,#6
 212                     ; 100 		uiInfo.valve_len[0] = 150;
 214  00ac 35960015      	mov	_uiInfo+21,#150
 215                     ; 101 		uiInfo.valve_len[1] = 145;
 217  00b0 35910016      	mov	_uiInfo+22,#145
 218                     ; 102 		uiInfo.valve_len[2] = 145;
 220  00b4 35910017      	mov	_uiInfo+23,#145
 221                     ; 103 		uiInfo.valve_len[3] = 140;
 223  00b8 358c0018      	mov	_uiInfo+24,#140
 224                     ; 104 		uiInfo.valve_len[4] = 145;
 226  00bc 35910019      	mov	_uiInfo+25,#145
 227                     ; 105 		uiInfo.valve_len[5] = 135;
 229  00c0 3587001a      	mov	_uiInfo+26,#135
 230                     ; 106 		uiInfo.valve_rc[0] = 1;
 232  00c4 3501001d      	mov	_uiInfo+29,#1
 233                     ; 107 		uiInfo.valve_rc[1] = 2;
 235  00c8 3502001e      	mov	_uiInfo+30,#2
 236                     ; 108 		uiInfo.valve_rc[2] = 2;
 238  00cc 3502001f      	mov	_uiInfo+31,#2
 239                     ; 109 		uiInfo.valve_rc[3] = 3;
 241  00d0 35030020      	mov	_uiInfo+32,#3
 242                     ; 110 		uiInfo.valve_rc[4] = 4;
 244  00d4 35040021      	mov	_uiInfo+33,#4
 245                     ; 111 		uiInfo.valve_rc[5] = 5;
 247  00d8 35050022      	mov	_uiInfo+34,#5
 248                     ; 113 		break;
 250  00dc ac780278      	jpf	L75
 251  00e0               L5:
 252                     ; 114 	case 2:
 252                     ; 115 		uiInfo.houseCapa = 167;	
 254  00e0 35a70010      	mov	_uiInfo+16,#167
 255                     ; 116 		uiInfo.cnt = 4;
 257  00e4 35040005      	mov	_uiInfo+5,#4
 258                     ; 117 		uiInfo.valve = 5;
 260  00e8 3505000a      	mov	_uiInfo+10,#5
 261                     ; 118 		uiInfo.valve_len[0] = 150;
 263  00ec 35960015      	mov	_uiInfo+21,#150
 264                     ; 119 		uiInfo.valve_len[1] = 140;
 266  00f0 358c0016      	mov	_uiInfo+22,#140
 267                     ; 120 		uiInfo.valve_len[2] = 145;
 269  00f4 35910017      	mov	_uiInfo+23,#145
 270                     ; 121 		uiInfo.valve_len[3] = 135;
 272  00f8 35870018      	mov	_uiInfo+24,#135
 273                     ; 122 		uiInfo.valve_len[4] = 135;
 275  00fc 35870019      	mov	_uiInfo+25,#135
 276                     ; 123 		uiInfo.valve_rc[0] = 1;
 278  0100 3501001d      	mov	_uiInfo+29,#1
 279                     ; 124 		uiInfo.valve_rc[1] = 2;
 281  0104 3502001e      	mov	_uiInfo+30,#2
 282                     ; 125 		uiInfo.valve_rc[2] = 2;
 284  0108 3502001f      	mov	_uiInfo+31,#2
 285                     ; 126 		uiInfo.valve_rc[3] = 3;
 287  010c 35030020      	mov	_uiInfo+32,#3
 288                     ; 127 		uiInfo.valve_rc[4] = 4;
 290  0110 35040021      	mov	_uiInfo+33,#4
 291                     ; 128 		break;
 293  0114 ac780278      	jpf	L75
 294  0118               L7:
 295                     ; 130 	case 3:
 295                     ; 131 		uiInfo.houseCapa = 165;	
 297  0118 35a50010      	mov	_uiInfo+16,#165
 298                     ; 132 		uiInfo.cnt = 5;
 300  011c 35050005      	mov	_uiInfo+5,#5
 301                     ; 133 		uiInfo.valve = 6;
 303  0120 3506000a      	mov	_uiInfo+10,#6
 304                     ; 134 		uiInfo.valve_len[0] = 150;
 306  0124 35960015      	mov	_uiInfo+21,#150
 307                     ; 135 		uiInfo.valve_len[1] = 145;
 309  0128 35910016      	mov	_uiInfo+22,#145
 310                     ; 136 		uiInfo.valve_len[2] = 145;
 312  012c 35910017      	mov	_uiInfo+23,#145
 313                     ; 137 		uiInfo.valve_len[3] = 140;
 315  0130 358c0018      	mov	_uiInfo+24,#140
 316                     ; 138 		uiInfo.valve_len[4] = 140;
 318  0134 358c0019      	mov	_uiInfo+25,#140
 319                     ; 139 		uiInfo.valve_len[5] = 135;
 321  0138 3587001a      	mov	_uiInfo+26,#135
 322                     ; 140 		uiInfo.valve_rc[0] = 1;
 324  013c 3501001d      	mov	_uiInfo+29,#1
 325                     ; 141 		uiInfo.valve_rc[1] = 2;
 327  0140 3502001e      	mov	_uiInfo+30,#2
 328                     ; 142 		uiInfo.valve_rc[2] = 2;
 330  0144 3502001f      	mov	_uiInfo+31,#2
 331                     ; 143 		uiInfo.valve_rc[3] = 3;
 333  0148 35030020      	mov	_uiInfo+32,#3
 334                     ; 144 		uiInfo.valve_rc[4] = 4;
 336  014c 35040021      	mov	_uiInfo+33,#4
 337                     ; 145 		uiInfo.valve_rc[5] = 5;
 339  0150 35050022      	mov	_uiInfo+34,#5
 340                     ; 146 		break;
 342  0154 ac780278      	jpf	L75
 343  0158               L11:
 344                     ; 147 	case 4:
 344                     ; 148 		uiInfo.houseCapa = 167;	
 346  0158 35a70010      	mov	_uiInfo+16,#167
 347                     ; 149 		uiInfo.cnt = 4;
 349  015c 35040005      	mov	_uiInfo+5,#4
 350                     ; 150 		uiInfo.valve = 5;
 352  0160 3505000a      	mov	_uiInfo+10,#5
 353                     ; 151 		uiInfo.valve_len[0] = 150;
 355  0164 35960015      	mov	_uiInfo+21,#150
 356                     ; 152 		uiInfo.valve_len[1] = 135;
 358  0168 35870016      	mov	_uiInfo+22,#135
 359                     ; 153 		uiInfo.valve_len[2] = 135;
 361  016c 35870017      	mov	_uiInfo+23,#135
 362                     ; 154 		uiInfo.valve_len[3] = 140;
 364  0170 358c0018      	mov	_uiInfo+24,#140
 365                     ; 155 		uiInfo.valve_len[4] = 145;
 367  0174 35910019      	mov	_uiInfo+25,#145
 368                     ; 156 		uiInfo.valve_rc[0] = 1;
 370  0178 3501001d      	mov	_uiInfo+29,#1
 371                     ; 157 		uiInfo.valve_rc[1] = 2;
 373  017c 3502001e      	mov	_uiInfo+30,#2
 374                     ; 158 		uiInfo.valve_rc[2] = 2;
 376  0180 3502001f      	mov	_uiInfo+31,#2
 377                     ; 159 		uiInfo.valve_rc[3] = 3;
 379  0184 35030020      	mov	_uiInfo+32,#3
 380                     ; 160 		uiInfo.valve_rc[4] = 4;
 382  0188 35040021      	mov	_uiInfo+33,#4
 383                     ; 161 		break;
 385  018c ac780278      	jpf	L75
 386  0190               L31:
 387                     ; 163 	case 5:
 387                     ; 164 		uiInfo.houseCapa = 167;	
 389  0190 35a70010      	mov	_uiInfo+16,#167
 390                     ; 165 		uiInfo.cnt = 5;
 392  0194 35050005      	mov	_uiInfo+5,#5
 393                     ; 166 		uiInfo.valve = 6;
 395  0198 3506000a      	mov	_uiInfo+10,#6
 396                     ; 167 		uiInfo.valve_len[0] = 150;
 398  019c 35960015      	mov	_uiInfo+21,#150
 399                     ; 168 		uiInfo.valve_len[1] = 140;
 401  01a0 358c0016      	mov	_uiInfo+22,#140
 402                     ; 169 		uiInfo.valve_len[2] = 145;
 404  01a4 35910017      	mov	_uiInfo+23,#145
 405                     ; 170 		uiInfo.valve_len[3] = 140;
 407  01a8 358c0018      	mov	_uiInfo+24,#140
 408                     ; 171 		uiInfo.valve_len[4] = 145;
 410  01ac 35910019      	mov	_uiInfo+25,#145
 411                     ; 172 		uiInfo.valve_len[5] = 135;
 413  01b0 3587001a      	mov	_uiInfo+26,#135
 414                     ; 173 		uiInfo.valve_rc[0] = 1;
 416  01b4 3501001d      	mov	_uiInfo+29,#1
 417                     ; 174 		uiInfo.valve_rc[1] = 2;
 419  01b8 3502001e      	mov	_uiInfo+30,#2
 420                     ; 175 		uiInfo.valve_rc[2] = 2;
 422  01bc 3502001f      	mov	_uiInfo+31,#2
 423                     ; 176 		uiInfo.valve_rc[3] = 3;
 425  01c0 35030020      	mov	_uiInfo+32,#3
 426                     ; 177 		uiInfo.valve_rc[4] = 4;
 428  01c4 35040021      	mov	_uiInfo+33,#4
 429                     ; 178 		uiInfo.valve_rc[5] = 5;
 431  01c8 35050022      	mov	_uiInfo+34,#5
 432                     ; 179 		break;
 434  01cc ac780278      	jpf	L75
 435  01d0               L51:
 436                     ; 180 	case 6:
 436                     ; 181 		uiInfo.houseCapa = 168;	
 438  01d0 35a80010      	mov	_uiInfo+16,#168
 439                     ; 182 		uiInfo.cnt = 5;
 441  01d4 35050005      	mov	_uiInfo+5,#5
 442                     ; 183 		uiInfo.valve = 6;
 444  01d8 3506000a      	mov	_uiInfo+10,#6
 445                     ; 184 		uiInfo.valve_len[0] = 150;
 447  01dc 35960015      	mov	_uiInfo+21,#150
 448                     ; 185 		uiInfo.valve_len[1] = 145;
 450  01e0 35910016      	mov	_uiInfo+22,#145
 451                     ; 186 		uiInfo.valve_len[2] = 145;
 453  01e4 35910017      	mov	_uiInfo+23,#145
 454                     ; 187 		uiInfo.valve_len[3] = 140;
 456  01e8 358c0018      	mov	_uiInfo+24,#140
 457                     ; 188 		uiInfo.valve_len[4] = 145;
 459  01ec 35910019      	mov	_uiInfo+25,#145
 460                     ; 189 		uiInfo.valve_len[5] = 135;
 462  01f0 3587001a      	mov	_uiInfo+26,#135
 463                     ; 190 		uiInfo.valve_rc[0] = 1;
 465  01f4 3501001d      	mov	_uiInfo+29,#1
 466                     ; 191 		uiInfo.valve_rc[1] = 2;
 468  01f8 3502001e      	mov	_uiInfo+30,#2
 469                     ; 192 		uiInfo.valve_rc[2] = 2;
 471  01fc 3502001f      	mov	_uiInfo+31,#2
 472                     ; 193 		uiInfo.valve_rc[3] = 3;
 474  0200 35030020      	mov	_uiInfo+32,#3
 475                     ; 194 		uiInfo.valve_rc[4] = 4;
 477  0204 35040021      	mov	_uiInfo+33,#4
 478                     ; 195 		uiInfo.valve_rc[5] = 5;
 480  0208 35050022      	mov	_uiInfo+34,#5
 481                     ; 196 		break;
 483  020c 206a          	jra	L75
 484  020e               L71:
 485                     ; 198 	case 7:
 485                     ; 199 		uiInfo.houseCapa = 185;	
 487  020e 35b90010      	mov	_uiInfo+16,#185
 488                     ; 200 		uiInfo.cnt = 2;
 490  0212 35020005      	mov	_uiInfo+5,#2
 491                     ; 201 		uiInfo.valve = 4;
 493  0216 3504000a      	mov	_uiInfo+10,#4
 494                     ; 202 		uiInfo.valve_len[0] = 150;
 496  021a 35960015      	mov	_uiInfo+21,#150
 497                     ; 203 		uiInfo.valve_len[1] = 150;
 499  021e 35960016      	mov	_uiInfo+22,#150
 500                     ; 204 		uiInfo.valve_len[2] = 140;
 502  0222 358c0017      	mov	_uiInfo+23,#140
 503                     ; 205 		uiInfo.valve_len[3] = 140;
 505  0226 358c0018      	mov	_uiInfo+24,#140
 506                     ; 206 		uiInfo.valve_rc[0] = 1;
 508  022a 3501001d      	mov	_uiInfo+29,#1
 509                     ; 207 		uiInfo.valve_rc[1] = 1;
 511  022e 3501001e      	mov	_uiInfo+30,#1
 512                     ; 208 		uiInfo.valve_rc[2] = 2;
 514  0232 3502001f      	mov	_uiInfo+31,#2
 515                     ; 209 		uiInfo.valve_rc[3] = 2;
 517  0236 35020020      	mov	_uiInfo+32,#2
 518                     ; 210 		break;
 520  023a 203c          	jra	L75
 521  023c               L12:
 522                     ; 211 	case 8:
 522                     ; 212 		uiInfo.controlMode = 1;	//	0 main, 1 sub
 524  023c 35010009      	mov	_uiInfo+9,#1
 525                     ; 213 		uiInfo.lpmType_sub = 0;	//	sub no house_value
 527  0240 725f0014      	clr	_uiInfo+20
 528                     ; 214 		uiInfo.cnt_sub = 4;
 530  0244 35040006      	mov	_uiInfo+6,#4
 531                     ; 215 		uiInfo.valve_sub = 4;
 533  0248 3504000b      	mov	_uiInfo+11,#4
 534                     ; 216 		uiInfo.houseCapa = 185;	
 536  024c 35b90010      	mov	_uiInfo+16,#185
 537                     ; 217 		uiInfo.cnt = 0;
 539  0250 725f0005      	clr	_uiInfo+5
 540                     ; 218 		uiInfo.valve = 0;
 542  0254 725f000a      	clr	_uiInfo+10
 543                     ; 220 		uiInfo.valve_len[0] = 150;
 545  0258 35960015      	mov	_uiInfo+21,#150
 546                     ; 221 		uiInfo.valve_len[1] = 140;
 548  025c 358c0016      	mov	_uiInfo+22,#140
 549                     ; 222 		uiInfo.valve_len[2] = 145;
 551  0260 35910017      	mov	_uiInfo+23,#145
 552                     ; 223 		uiInfo.valve_len[3] = 145;
 554  0264 35910018      	mov	_uiInfo+24,#145
 555                     ; 224 		uiInfo.valve_rc[0] = 1;
 557  0268 3501001d      	mov	_uiInfo+29,#1
 558                     ; 225 		uiInfo.valve_rc[1] = 2;
 560  026c 3502001e      	mov	_uiInfo+30,#2
 561                     ; 226 		uiInfo.valve_rc[2] = 3;
 563  0270 3503001f      	mov	_uiInfo+31,#3
 564                     ; 227 		uiInfo.valve_rc[3] = 4;
 566  0274 35040020      	mov	_uiInfo+32,#4
 567                     ; 228 		break;
 569  0278               L75:
 570                     ; 230 }
 573  0278 85            	popw	x
 574  0279 81            	ret
 599                     ; 232 void	char_ext_h(void)
 599                     ; 233 {
 600                     .text:	section	.text,new
 601  0000               _char_ext_h:
 605                     ; 234 	LCD_BIT_SET(b1B);
 607  0000 c60013        	ld	a,_iLF_DEF+19
 608  0003 5f            	clrw	x
 609  0004 97            	ld	xl,a
 610  0005 d6540c        	ld	a,(21516,x)
 611  0008 ca0013        	or	a,_bLF_DEF+19
 612  000b d7540c        	ld	(21516,x),a
 613                     ; 235 	LCD_BIT_SET(b1C);
 615  000e c60033        	ld	a,_iLF_DEF+51
 616  0011 5f            	clrw	x
 617  0012 97            	ld	xl,a
 618  0013 d6540c        	ld	a,(21516,x)
 619  0016 ca0033        	or	a,_bLF_DEF+51
 620  0019 d7540c        	ld	(21516,x),a
 621                     ; 236 	LCD_BIT_SET(b1E);
 623  001c c60022        	ld	a,_iLF_DEF+34
 624  001f 5f            	clrw	x
 625  0020 97            	ld	xl,a
 626  0021 d6540c        	ld	a,(21516,x)
 627  0024 ca0022        	or	a,_bLF_DEF+34
 628  0027 d7540c        	ld	(21516,x),a
 629                     ; 237 	LCD_BIT_SET(b1F);
 631  002a c60012        	ld	a,_iLF_DEF+18
 632  002d 5f            	clrw	x
 633  002e 97            	ld	xl,a
 634  002f d6540c        	ld	a,(21516,x)
 635  0032 ca0012        	or	a,_bLF_DEF+18
 636  0035 d7540c        	ld	(21516,x),a
 637                     ; 238 	LCD_BIT_SET(b1G);
 639  0038 c60023        	ld	a,_iLF_DEF+35
 640  003b 5f            	clrw	x
 641  003c 97            	ld	xl,a
 642  003d d6540c        	ld	a,(21516,x)
 643  0040 ca0023        	or	a,_bLF_DEF+35
 644  0043 d7540c        	ld	(21516,x),a
 645                     ; 239 }
 648  0046 81            	ret
 673                     ; 241 void	char_e3(void)
 673                     ; 242 {
 674                     .text:	section	.text,new
 675  0000               _char_e3:
 679                     ; 243 	LCD_BIT_SET(b3A);
 681  0000 c60007        	ld	a,_iLF_DEF+7
 682  0003 5f            	clrw	x
 683  0004 97            	ld	xl,a
 684  0005 d6540c        	ld	a,(21516,x)
 685  0008 ca0007        	or	a,_bLF_DEF+7
 686  000b d7540c        	ld	(21516,x),a
 687                     ; 244 	LCD_BIT_SET(b3D);
 689  000e c60037        	ld	a,_iLF_DEF+55
 690  0011 5f            	clrw	x
 691  0012 97            	ld	xl,a
 692  0013 d6540c        	ld	a,(21516,x)
 693  0016 ca0037        	or	a,_bLF_DEF+55
 694  0019 d7540c        	ld	(21516,x),a
 695                     ; 245 	LCD_BIT_SET(b3E);
 697  001c c60027        	ld	a,_iLF_DEF+39
 698  001f 5f            	clrw	x
 699  0020 97            	ld	xl,a
 700  0021 d6540c        	ld	a,(21516,x)
 701  0024 ca0027        	or	a,_bLF_DEF+39
 702  0027 d7540c        	ld	(21516,x),a
 703                     ; 246 	LCD_BIT_SET(b3F);
 705  002a c60017        	ld	a,_iLF_DEF+23
 706  002d 5f            	clrw	x
 707  002e 97            	ld	xl,a
 708  002f d6540c        	ld	a,(21516,x)
 709  0032 ca0017        	or	a,_bLF_DEF+23
 710  0035 d7540c        	ld	(21516,x),a
 711                     ; 247 	LCD_BIT_SET(b3G);
 713  0038 c60028        	ld	a,_iLF_DEF+40
 714  003b 5f            	clrw	x
 715  003c 97            	ld	xl,a
 716  003d d6540c        	ld	a,(21516,x)
 717  0040 ca0028        	or	a,_bLF_DEF+40
 718  0043 d7540c        	ld	(21516,x),a
 719                     ; 248 }
 722  0046 81            	ret
 747                     ; 250 void	char_h3(void)
 747                     ; 251 {
 748                     .text:	section	.text,new
 749  0000               _char_h3:
 753                     ; 252 	LCD_BIT_SET(b3B);
 755  0000 c60018        	ld	a,_iLF_DEF+24
 756  0003 5f            	clrw	x
 757  0004 97            	ld	xl,a
 758  0005 d6540c        	ld	a,(21516,x)
 759  0008 ca0018        	or	a,_bLF_DEF+24
 760  000b d7540c        	ld	(21516,x),a
 761                     ; 253 	LCD_BIT_SET(b3C);
 763  000e c60038        	ld	a,_iLF_DEF+56
 764  0011 5f            	clrw	x
 765  0012 97            	ld	xl,a
 766  0013 d6540c        	ld	a,(21516,x)
 767  0016 ca0038        	or	a,_bLF_DEF+56
 768  0019 d7540c        	ld	(21516,x),a
 769                     ; 254 	LCD_BIT_SET(b3E);
 771  001c c60027        	ld	a,_iLF_DEF+39
 772  001f 5f            	clrw	x
 773  0020 97            	ld	xl,a
 774  0021 d6540c        	ld	a,(21516,x)
 775  0024 ca0027        	or	a,_bLF_DEF+39
 776  0027 d7540c        	ld	(21516,x),a
 777                     ; 255 	LCD_BIT_SET(b3F);
 779  002a c60017        	ld	a,_iLF_DEF+23
 780  002d 5f            	clrw	x
 781  002e 97            	ld	xl,a
 782  002f d6540c        	ld	a,(21516,x)
 783  0032 ca0017        	or	a,_bLF_DEF+23
 784  0035 d7540c        	ld	(21516,x),a
 785                     ; 256 	LCD_BIT_SET(b3G);
 787  0038 c60028        	ld	a,_iLF_DEF+40
 788  003b 5f            	clrw	x
 789  003c 97            	ld	xl,a
 790  003d d6540c        	ld	a,(21516,x)
 791  0040 ca0028        	or	a,_bLF_DEF+40
 792  0043 d7540c        	ld	(21516,x),a
 793                     ; 257 }
 796  0046 81            	ret
 821                     ; 259 void	char_e4(void)
 821                     ; 260 {
 822                     .text:	section	.text,new
 823  0000               _char_e4:
 827                     ; 261 	LCD_BIT_SET(b4A);
 829  0000 c60009        	ld	a,_iLF_DEF+9
 830  0003 5f            	clrw	x
 831  0004 97            	ld	xl,a
 832  0005 d6540c        	ld	a,(21516,x)
 833  0008 ca0009        	or	a,_bLF_DEF+9
 834  000b d7540c        	ld	(21516,x),a
 835                     ; 262 	LCD_BIT_SET(b4D);
 837  000e c60039        	ld	a,_iLF_DEF+57
 838  0011 5f            	clrw	x
 839  0012 97            	ld	xl,a
 840  0013 d6540c        	ld	a,(21516,x)
 841  0016 ca0039        	or	a,_bLF_DEF+57
 842  0019 d7540c        	ld	(21516,x),a
 843                     ; 263 	LCD_BIT_SET(b4E);
 845  001c c60029        	ld	a,_iLF_DEF+41
 846  001f 5f            	clrw	x
 847  0020 97            	ld	xl,a
 848  0021 d6540c        	ld	a,(21516,x)
 849  0024 ca0029        	or	a,_bLF_DEF+41
 850  0027 d7540c        	ld	(21516,x),a
 851                     ; 264 	LCD_BIT_SET(b4F);
 853  002a c60019        	ld	a,_iLF_DEF+25
 854  002d 5f            	clrw	x
 855  002e 97            	ld	xl,a
 856  002f d6540c        	ld	a,(21516,x)
 857  0032 ca0019        	or	a,_bLF_DEF+25
 858  0035 d7540c        	ld	(21516,x),a
 859                     ; 265 	LCD_BIT_SET(b4G);
 861  0038 c6002a        	ld	a,_iLF_DEF+42
 862  003b 5f            	clrw	x
 863  003c 97            	ld	xl,a
 864  003d d6540c        	ld	a,(21516,x)
 865  0040 ca002a        	or	a,_bLF_DEF+42
 866  0043 d7540c        	ld	(21516,x),a
 867                     ; 266 }
 870  0046 81            	ret
 895                     ; 268 void	char_L4(void)
 895                     ; 269 {
 896                     .text:	section	.text,new
 897  0000               _char_L4:
 901                     ; 270 	LCD_BIT_SET(b4D);
 903  0000 c60039        	ld	a,_iLF_DEF+57
 904  0003 5f            	clrw	x
 905  0004 97            	ld	xl,a
 906  0005 d6540c        	ld	a,(21516,x)
 907  0008 ca0039        	or	a,_bLF_DEF+57
 908  000b d7540c        	ld	(21516,x),a
 909                     ; 271 	LCD_BIT_SET(b4E);
 911  000e c60029        	ld	a,_iLF_DEF+41
 912  0011 5f            	clrw	x
 913  0012 97            	ld	xl,a
 914  0013 d6540c        	ld	a,(21516,x)
 915  0016 ca0029        	or	a,_bLF_DEF+41
 916  0019 d7540c        	ld	(21516,x),a
 917                     ; 272 	LCD_BIT_SET(b4G);
 919  001c c6002a        	ld	a,_iLF_DEF+42
 920  001f 5f            	clrw	x
 921  0020 97            	ld	xl,a
 922  0021 d6540c        	ld	a,(21516,x)
 923  0024 ca002a        	or	a,_bLF_DEF+42
 924  0027 d7540c        	ld	(21516,x),a
 925                     ; 273 }
 928  002a 81            	ret
 953                     ; 275 void	char_eS(void)
 953                     ; 276 {
 954                     .text:	section	.text,new
 955  0000               _char_eS:
 959                     ; 277 	LCD_BIT_SET(b3A);
 961  0000 c60007        	ld	a,_iLF_DEF+7
 962  0003 5f            	clrw	x
 963  0004 97            	ld	xl,a
 964  0005 d6540c        	ld	a,(21516,x)
 965  0008 ca0007        	or	a,_bLF_DEF+7
 966  000b d7540c        	ld	(21516,x),a
 967                     ; 278 	LCD_BIT_SET(b3D);
 969  000e c60037        	ld	a,_iLF_DEF+55
 970  0011 5f            	clrw	x
 971  0012 97            	ld	xl,a
 972  0013 d6540c        	ld	a,(21516,x)
 973  0016 ca0037        	or	a,_bLF_DEF+55
 974  0019 d7540c        	ld	(21516,x),a
 975                     ; 279 	LCD_BIT_SET(b3C);
 977  001c c60038        	ld	a,_iLF_DEF+56
 978  001f 5f            	clrw	x
 979  0020 97            	ld	xl,a
 980  0021 d6540c        	ld	a,(21516,x)
 981  0024 ca0038        	or	a,_bLF_DEF+56
 982  0027 d7540c        	ld	(21516,x),a
 983                     ; 280 	LCD_BIT_SET(b3F);
 985  002a c60017        	ld	a,_iLF_DEF+23
 986  002d 5f            	clrw	x
 987  002e 97            	ld	xl,a
 988  002f d6540c        	ld	a,(21516,x)
 989  0032 ca0017        	or	a,_bLF_DEF+23
 990  0035 d7540c        	ld	(21516,x),a
 991                     ; 281 	LCD_BIT_SET(b3G);
 993  0038 c60028        	ld	a,_iLF_DEF+40
 994  003b 5f            	clrw	x
 995  003c 97            	ld	xl,a
 996  003d d6540c        	ld	a,(21516,x)
 997  0040 ca0028        	or	a,_bLF_DEF+40
 998  0043 d7540c        	ld	(21516,x),a
 999                     ; 282 }
1002  0046 81            	ret
1027                     ; 285 void	char_a4(void)
1027                     ; 286 {
1028                     .text:	section	.text,new
1029  0000               _char_a4:
1033                     ; 287 	LCD_BIT_SET(b4A);
1035  0000 c60009        	ld	a,_iLF_DEF+9
1036  0003 5f            	clrw	x
1037  0004 97            	ld	xl,a
1038  0005 d6540c        	ld	a,(21516,x)
1039  0008 ca0009        	or	a,_bLF_DEF+9
1040  000b d7540c        	ld	(21516,x),a
1041                     ; 288 	LCD_BIT_SET(b4B);
1043  000e c6001a        	ld	a,_iLF_DEF+26
1044  0011 5f            	clrw	x
1045  0012 97            	ld	xl,a
1046  0013 d6540c        	ld	a,(21516,x)
1047  0016 ca001a        	or	a,_bLF_DEF+26
1048  0019 d7540c        	ld	(21516,x),a
1049                     ; 289 	LCD_BIT_SET(b4C);
1051  001c c6003a        	ld	a,_iLF_DEF+58
1052  001f 5f            	clrw	x
1053  0020 97            	ld	xl,a
1054  0021 d6540c        	ld	a,(21516,x)
1055  0024 ca003a        	or	a,_bLF_DEF+58
1056  0027 d7540c        	ld	(21516,x),a
1057                     ; 290 	LCD_BIT_SET(b4E);
1059  002a c60029        	ld	a,_iLF_DEF+41
1060  002d 5f            	clrw	x
1061  002e 97            	ld	xl,a
1062  002f d6540c        	ld	a,(21516,x)
1063  0032 ca0029        	or	a,_bLF_DEF+41
1064  0035 d7540c        	ld	(21516,x),a
1065                     ; 291 	LCD_BIT_SET(b4G);
1067  0038 c6002a        	ld	a,_iLF_DEF+42
1068  003b 5f            	clrw	x
1069  003c 97            	ld	xl,a
1070  003d d6540c        	ld	a,(21516,x)
1071  0040 ca002a        	or	a,_bLF_DEF+42
1072  0043 d7540c        	ld	(21516,x),a
1073                     ; 292 	LCD_BIT_SET(b4F);
1075  0046 c60019        	ld	a,_iLF_DEF+25
1076  0049 5f            	clrw	x
1077  004a 97            	ld	xl,a
1078  004b d6540c        	ld	a,(21516,x)
1079  004e ca0019        	or	a,_bLF_DEF+25
1080  0051 d7540c        	ld	(21516,x),a
1081                     ; 293 }
1084  0054 81            	ret
1109                     ; 295 void	char_b4(void)
1109                     ; 296 {
1110                     .text:	section	.text,new
1111  0000               _char_b4:
1115                     ; 297 	LCD_BIT_SET(b4D);
1117  0000 c60039        	ld	a,_iLF_DEF+57
1118  0003 5f            	clrw	x
1119  0004 97            	ld	xl,a
1120  0005 d6540c        	ld	a,(21516,x)
1121  0008 ca0039        	or	a,_bLF_DEF+57
1122  000b d7540c        	ld	(21516,x),a
1123                     ; 298 	LCD_BIT_SET(b4C);
1125  000e c6003a        	ld	a,_iLF_DEF+58
1126  0011 5f            	clrw	x
1127  0012 97            	ld	xl,a
1128  0013 d6540c        	ld	a,(21516,x)
1129  0016 ca003a        	or	a,_bLF_DEF+58
1130  0019 d7540c        	ld	(21516,x),a
1131                     ; 299 	LCD_BIT_SET(b4E);
1133  001c c60029        	ld	a,_iLF_DEF+41
1134  001f 5f            	clrw	x
1135  0020 97            	ld	xl,a
1136  0021 d6540c        	ld	a,(21516,x)
1137  0024 ca0029        	or	a,_bLF_DEF+41
1138  0027 d7540c        	ld	(21516,x),a
1139                     ; 300 	LCD_BIT_SET(b4G);
1141  002a c6002a        	ld	a,_iLF_DEF+42
1142  002d 5f            	clrw	x
1143  002e 97            	ld	xl,a
1144  002f d6540c        	ld	a,(21516,x)
1145  0032 ca002a        	or	a,_bLF_DEF+42
1146  0035 d7540c        	ld	(21516,x),a
1147                     ; 301 	LCD_BIT_SET(b4F);
1149  0038 c60019        	ld	a,_iLF_DEF+25
1150  003b 5f            	clrw	x
1151  003c 97            	ld	xl,a
1152  003d d6540c        	ld	a,(21516,x)
1153  0040 ca0019        	or	a,_bLF_DEF+25
1154  0043 d7540c        	ld	(21516,x),a
1155                     ; 302 }
1158  0046 81            	ret
1183                     ; 304 void	char_c4(void)
1183                     ; 305 {
1184                     .text:	section	.text,new
1185  0000               _char_c4:
1189                     ; 306 	LCD_BIT_SET(b4E);
1191  0000 c60029        	ld	a,_iLF_DEF+41
1192  0003 5f            	clrw	x
1193  0004 97            	ld	xl,a
1194  0005 d6540c        	ld	a,(21516,x)
1195  0008 ca0029        	or	a,_bLF_DEF+41
1196  000b d7540c        	ld	(21516,x),a
1197                     ; 307 	LCD_BIT_SET(b4G);
1199  000e c6002a        	ld	a,_iLF_DEF+42
1200  0011 5f            	clrw	x
1201  0012 97            	ld	xl,a
1202  0013 d6540c        	ld	a,(21516,x)
1203  0016 ca002a        	or	a,_bLF_DEF+42
1204  0019 d7540c        	ld	(21516,x),a
1205                     ; 308 	LCD_BIT_SET(b4D);
1207  001c c60039        	ld	a,_iLF_DEF+57
1208  001f 5f            	clrw	x
1209  0020 97            	ld	xl,a
1210  0021 d6540c        	ld	a,(21516,x)
1211  0024 ca0039        	or	a,_bLF_DEF+57
1212  0027 d7540c        	ld	(21516,x),a
1213                     ; 309 }
1216  002a 81            	ret
1241                     ; 311 void	char_d4(void)
1241                     ; 312 {
1242                     .text:	section	.text,new
1243  0000               _char_d4:
1247                     ; 313 	LCD_BIT_SET(b4D);
1249  0000 c60039        	ld	a,_iLF_DEF+57
1250  0003 5f            	clrw	x
1251  0004 97            	ld	xl,a
1252  0005 d6540c        	ld	a,(21516,x)
1253  0008 ca0039        	or	a,_bLF_DEF+57
1254  000b d7540c        	ld	(21516,x),a
1255                     ; 314 	LCD_BIT_SET(b4B);
1257  000e c6001a        	ld	a,_iLF_DEF+26
1258  0011 5f            	clrw	x
1259  0012 97            	ld	xl,a
1260  0013 d6540c        	ld	a,(21516,x)
1261  0016 ca001a        	or	a,_bLF_DEF+26
1262  0019 d7540c        	ld	(21516,x),a
1263                     ; 315 	LCD_BIT_SET(b4C);
1265  001c c6003a        	ld	a,_iLF_DEF+58
1266  001f 5f            	clrw	x
1267  0020 97            	ld	xl,a
1268  0021 d6540c        	ld	a,(21516,x)
1269  0024 ca003a        	or	a,_bLF_DEF+58
1270  0027 d7540c        	ld	(21516,x),a
1271                     ; 316 	LCD_BIT_SET(b4E);
1273  002a c60029        	ld	a,_iLF_DEF+41
1274  002d 5f            	clrw	x
1275  002e 97            	ld	xl,a
1276  002f d6540c        	ld	a,(21516,x)
1277  0032 ca0029        	or	a,_bLF_DEF+41
1278  0035 d7540c        	ld	(21516,x),a
1279                     ; 317 	LCD_BIT_SET(b4G);
1281  0038 c6002a        	ld	a,_iLF_DEF+42
1282  003b 5f            	clrw	x
1283  003c 97            	ld	xl,a
1284  003d d6540c        	ld	a,(21516,x)
1285  0040 ca002a        	or	a,_bLF_DEF+42
1286  0043 d7540c        	ld	(21516,x),a
1287                     ; 318 }
1290  0046 81            	ret
1325                     ; 320 void	_ui_setup_menu_disp(uint8_t id)
1325                     ; 321 {
1326                     .text:	section	.text,new
1327  0000               __ui_setup_menu_disp:
1329  0000 88            	push	a
1330       00000000      OFST:	set	0
1333                     ; 322 	lcd_clear(0);
1335  0001 4f            	clr	a
1336  0002 cd0000        	call	_lcd_clear
1338                     ; 323 	switch( id )
1340  0005 7b01          	ld	a,(OFST+1,sp)
1342                     ; 369 		break;
1343  0007 4a            	dec	a
1344  0008 271c          	jreq	L102
1345  000a 4a            	dec	a
1346  000b 2728          	jreq	L302
1347  000d 4a            	dec	a
1348  000e 2733          	jreq	L502
1349  0010 4a            	dec	a
1350  0011 2744          	jreq	L702
1351  0013 4a            	dec	a
1352  0014 274f          	jreq	L112
1353  0016 4a            	dec	a
1354  0017 2760          	jreq	L312
1355  0019 4a            	dec	a
1356  001a 2771          	jreq	L512
1357  001c 4a            	dec	a
1358  001d 2603cc00a1    	jreq	L712
1359  0022 acb900b9      	jpf	L732
1360  0026               L102:
1361                     ; 325 	case 1:
1361                     ; 326 #if defined (_WOODANG_TEST_ONLY_)
1361                     ; 327 		lcd_disp_n(0, 0);
1361                     ; 328 		lcd_disp_n(1, 0);
1361                     ; 329 #else
1361                     ; 330 		lcd_disp_n(0, 9);
1363  0026 ae0009        	ldw	x,#9
1364  0029 cd0000        	call	_lcd_disp_n
1366                     ; 331 		lcd_disp_n(1, 7);
1368  002c ae0107        	ldw	x,#263
1369  002f cd0000        	call	_lcd_disp_n
1371                     ; 333 		break;
1373  0032 cc00b9        	jra	L732
1374  0035               L302:
1375                     ; 334 	case 2:
1375                     ; 335 		lcd_disp_n(0, 1);
1377  0035 ae0001        	ldw	x,#1
1378  0038 cd0000        	call	_lcd_disp_n
1380                     ; 337 		lcd_disp_n(2, 1);
1382  003b ae0201        	ldw	x,#513
1383  003e cd0000        	call	_lcd_disp_n
1385                     ; 338 		break;
1387  0041 2076          	jra	L732
1388  0043               L502:
1389                     ; 340 	case 3:
1389                     ; 341 		lcd_disp_n(0, 1);
1391  0043 ae0001        	ldw	x,#1
1392  0046 cd0000        	call	_lcd_disp_n
1394                     ; 342 		lcd_disp_n(2, 1);
1396  0049 ae0201        	ldw	x,#513
1397  004c cd0000        	call	_lcd_disp_n
1399                     ; 343 		lcd_disp_n(3, 1);
1401  004f ae0301        	ldw	x,#769
1402  0052 cd0000        	call	_lcd_disp_n
1404                     ; 344 		break;
1406  0055 2062          	jra	L732
1407  0057               L702:
1408                     ; 345 	case 4:
1408                     ; 346 		lcd_disp_n(0, 1);
1410  0057 ae0001        	ldw	x,#1
1411  005a cd0000        	call	_lcd_disp_n
1413                     ; 347 		lcd_disp_n(2, 2);
1415  005d ae0202        	ldw	x,#514
1416  0060 cd0000        	call	_lcd_disp_n
1418                     ; 348 		break;
1420  0063 2054          	jra	L732
1421  0065               L112:
1422                     ; 349 	case 5:
1422                     ; 350 		lcd_disp_n(0, 1);
1424  0065 ae0001        	ldw	x,#1
1425  0068 cd0000        	call	_lcd_disp_n
1427                     ; 351 		lcd_disp_n(2, 2);
1429  006b ae0202        	ldw	x,#514
1430  006e cd0000        	call	_lcd_disp_n
1432                     ; 352 		lcd_disp_n(3, 1);
1434  0071 ae0301        	ldw	x,#769
1435  0074 cd0000        	call	_lcd_disp_n
1437                     ; 353 		break;
1439  0077 2040          	jra	L732
1440  0079               L312:
1441                     ; 354 	case 6:
1441                     ; 355 		lcd_disp_n(0, 1);
1443  0079 ae0001        	ldw	x,#1
1444  007c cd0000        	call	_lcd_disp_n
1446                     ; 356 		lcd_disp_n(1, 0);
1448  007f ae0100        	ldw	x,#256
1449  0082 cd0000        	call	_lcd_disp_n
1451                     ; 357 		lcd_disp_n(2, 4);
1453  0085 ae0204        	ldw	x,#516
1454  0088 cd0000        	call	_lcd_disp_n
1456                     ; 358 		break;
1458  008b 202c          	jra	L732
1459  008d               L512:
1460                     ; 359 	case 7:
1460                     ; 360 		lcd_disp_n(0, 1);
1462  008d ae0001        	ldw	x,#1
1463  0090 cd0000        	call	_lcd_disp_n
1465                     ; 361 		lcd_disp_n(1, 3);
1467  0093 ae0103        	ldw	x,#259
1468  0096 cd0000        	call	_lcd_disp_n
1470                     ; 362 		lcd_disp_n(2, 3);
1472  0099 ae0203        	ldw	x,#515
1473  009c cd0000        	call	_lcd_disp_n
1475                     ; 363 		break;
1477  009f 2018          	jra	L732
1478  00a1               L712:
1479                     ; 364 	case 8:
1479                     ; 365 		lcd_disp_n(0, 1);
1481  00a1 ae0001        	ldw	x,#1
1482  00a4 cd0000        	call	_lcd_disp_n
1484                     ; 366 		lcd_disp_n(1, 3);
1486  00a7 ae0103        	ldw	x,#259
1487  00aa cd0000        	call	_lcd_disp_n
1489                     ; 367 		lcd_disp_n(2, 3);
1491  00ad ae0203        	ldw	x,#515
1492  00b0 cd0000        	call	_lcd_disp_n
1494                     ; 368 		lcd_disp_n(3, 5);
1496  00b3 ae0305        	ldw	x,#773
1497  00b6 cd0000        	call	_lcd_disp_n
1499                     ; 369 		break;
1501  00b9               L732:
1502                     ; 372 }
1505  00b9 84            	pop	a
1506  00ba 81            	ret
1542                     ; 374 void	_ui_setup_menu(void)
1542                     ; 375 {
1543                     .text:	section	.text,new
1544  0000               __ui_setup_menu:
1546  0000 88            	push	a
1547       00000001      OFST:	set	1
1550                     ; 378 	i = _uiSetup;
1552  0001 c60000        	ld	a,__uiSetup
1553  0004 6b01          	ld	(OFST+0,sp),a
1554                     ; 379 	if( uiInfo.enc != 0 )
1556  0006 725d0000      	tnz	_uiInfo
1557  000a 2728          	jreq	L552
1558                     ; 381 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
1560  000c c60000        	ld	a,_uiInfo
1561  000f a540          	bcp	a,#64
1562  0011 2604          	jrne	L25
1563  0013 a6ff          	ld	a,#255
1564  0015 2002          	jra	L45
1565  0017               L25:
1566  0017 a601          	ld	a,#1
1567  0019               L45:
1568  0019 1b01          	add	a,(OFST+0,sp)
1569  001b 6b01          	ld	(OFST+0,sp),a
1570                     ; 385 		if( i==0 )	i = __COUNT;
1572  001d 0d01          	tnz	(OFST+0,sp)
1573  001f 2604          	jrne	L752
1576  0021 a606          	ld	a,#6
1577  0023 6b01          	ld	(OFST+0,sp),a
1578  0025               L752:
1579                     ; 386 		if( i>__COUNT )	i = 1;
1581  0025 7b01          	ld	a,(OFST+0,sp)
1582  0027 a107          	cp	a,#7
1583  0029 2504          	jrult	L162
1586  002b a601          	ld	a,#1
1587  002d 6b01          	ld	(OFST+0,sp),a
1588  002f               L162:
1589                     ; 388 		_uiSetup = i;
1591  002f 7b01          	ld	a,(OFST+0,sp)
1592  0031 c70000        	ld	__uiSetup,a
1593  0034               L552:
1594                     ; 390 	if( _dsPrev != i )
1596  0034 c60000        	ld	a,__dsPrev
1597  0037 1101          	cp	a,(OFST+0,sp)
1598  0039 270a          	jreq	L362
1599                     ; 392 		_dsPrev = i;
1601  003b 7b01          	ld	a,(OFST+0,sp)
1602  003d c70000        	ld	__dsPrev,a
1603                     ; 393 		_ui_setup_menu_disp(i);
1605  0040 7b01          	ld	a,(OFST+0,sp)
1606  0042 cd0000        	call	__ui_setup_menu_disp
1608  0045               L362:
1609                     ; 396 }
1612  0045 84            	pop	a
1613  0046 81            	ret
1616                     	switch	.data
1617  0003               ___delayi:
1618  0003 00            	dc.b	0
1678                     ; 412 void	_ui_setup(uint8_t key)
1678                     ; 413 {
1679                     .text:	section	.text,new
1680  0000               __ui_setup:
1682  0000 88            	push	a
1683  0001 88            	push	a
1684       00000001      OFST:	set	1
1687                     ; 414 	uint8_t	i = 0;
1689                     ; 415 	if( __s == 0 )
1691  0002 725d0000      	tnz	___s
1692  0006 266e          	jrne	L303
1693                     ; 417 		if( _dsCount == 0 )
1695  0008 725d0000      	tnz	__dsCount
1696  000c 2612          	jrne	L503
1697                     ; 419 			uiInfo.id = 1;
1699  000e 35010004      	mov	_uiInfo+4,#1
1700                     ; 420 			_dsCount = 1;
1702  0012 35010000      	mov	__dsCount,#1
1703                     ; 421 			_ui_setup_menu_disp(_uiSetup);
1705  0016 c60000        	ld	a,__uiSetup
1706  0019 cd0000        	call	__ui_setup_menu_disp
1709  001c ac160116      	jpf	L713
1710  0020               L503:
1711                     ; 423 		else if( _dsCount == 1 )
1713  0020 c60000        	ld	a,__dsCount
1714  0023 a101          	cp	a,#1
1715  0025 2703          	jreq	L26
1716  0027 cc0116        	jp	L713
1717  002a               L26:
1718                     ; 425 			_ui_setup_menu();
1720  002a cd0000        	call	__ui_setup_menu
1722                     ; 426 			if( key == 3 )
1724  002d 7b02          	ld	a,(OFST+1,sp)
1725  002f a103          	cp	a,#3
1726  0031 2703          	jreq	L46
1727  0033 cc0116        	jp	L713
1728  0036               L46:
1729                     ; 429 				mode_recover = 1;
1731  0036 35010000      	mov	_mode_recover,#1
1732                     ; 430 				_ui_setup_info(_uiSetup);
1734  003a c60000        	ld	a,__uiSetup
1735  003d cd0000        	call	__ui_setup_info
1737                     ; 431 				func_rc_setting();
1739  0040 cd0000        	call	_func_rc_setting
1741                     ; 432 				__func_rc_timerout = 10;
1743  0043 350a0000      	mov	___func_rc_timerout,#10
1744                     ; 433 				__func_rc_timerout1 = 0;
1746  0047 725f0000      	clr	___func_rc_timerout1
1747                     ; 434 				__func_rc_timerout2 = __timer1s;
1749  004b 5500000000    	mov	___func_rc_timerout2,___timer1s
1750                     ; 435 				_dsCount = 1;
1752  0050 35010000      	mov	__dsCount,#1
1753                     ; 436 				__s = 1;
1755  0054 35010000      	mov	___s,#1
1756                     ; 437 				if( _uiSetup != _uiSetupPrev )
1758  0058 c60000        	ld	a,__uiSetup
1759  005b c10001        	cp	a,__uiSetupPrev
1760  005e 2603          	jrne	L66
1761  0060 cc0116        	jp	L713
1762  0063               L66:
1763                     ; 439 					_uiSetupPrev = _uiSetup;
1765  0063 5500000001    	mov	__uiSetupPrev,__uiSetup
1766                     ; 440 					FW_SETUP_LAST(_uiSetup);
1768  0068 c60000        	ld	a,__uiSetup
1769  006b 97            	ld	xl,a
1770  006c a63e          	ld	a,#62
1771  006e 95            	ld	xh,a
1772  006f cd0000        	call	_file_write
1774  0072 ac160116      	jpf	L713
1775  0076               L303:
1776                     ; 445 	else if( __s == 1 )
1778  0076 c60000        	ld	a,___s
1779  0079 a101          	cp	a,#1
1780  007b 2703          	jreq	L07
1781  007d cc0116        	jp	L713
1782  0080               L07:
1783                     ; 447 		if( (_t20ms%10) != 0 )
1785  0080 c60000        	ld	a,__t20ms
1786  0083 5f            	clrw	x
1787  0084 97            	ld	xl,a
1788  0085 a60a          	ld	a,#10
1789  0087 cd0000        	call	c_smodx
1791  008a a30000        	cpw	x,#0
1792  008d 2706          	jreq	L323
1793                     ; 449 			_dsPrev = 0;
1795  008f 725f0000      	clr	__dsPrev
1796                     ; 450 			return;
1798  0093 2006          	jra	L06
1799  0095               L323:
1800                     ; 453 		if( _dsPrev != 0 )
1802  0095 725d0000      	tnz	__dsPrev
1803  0099 2702          	jreq	L523
1804                     ; 454 			return;
1805  009b               L06:
1808  009b 85            	popw	x
1809  009c 81            	ret
1810  009d               L523:
1811                     ; 456 		_dsCount++;
1813  009d 725c0000      	inc	__dsCount
1814                     ; 457 		_dsPrev = 1;
1816  00a1 35010000      	mov	__dsPrev,#1
1817                     ; 458 		lcd_clear(0);
1819  00a5 4f            	clr	a
1820  00a6 cd0000        	call	_lcd_clear
1822                     ; 459 		for( i=0; i<4; i++ )
1824  00a9 0f01          	clr	(OFST+0,sp)
1825  00ab               L723:
1826                     ; 460 			lcd_disp_n(i, _dsCount%10);
1828  00ab c60000        	ld	a,__dsCount
1829  00ae 5f            	clrw	x
1830  00af 97            	ld	xl,a
1831  00b0 a60a          	ld	a,#10
1832  00b2 62            	div	x,a
1833  00b3 5f            	clrw	x
1834  00b4 97            	ld	xl,a
1835  00b5 9f            	ld	a,xl
1836  00b6 97            	ld	xl,a
1837  00b7 7b01          	ld	a,(OFST+0,sp)
1838  00b9 95            	ld	xh,a
1839  00ba cd0000        	call	_lcd_disp_n
1841                     ; 459 		for( i=0; i<4; i++ )
1843  00bd 0c01          	inc	(OFST+0,sp)
1846  00bf 7b01          	ld	a,(OFST+0,sp)
1847  00c1 a104          	cp	a,#4
1848  00c3 25e6          	jrult	L723
1849                     ; 462 		if( __func_rc_settingCb == 1 && _dsCount >= 30 && getSettingChange() == 0 )
1851  00c5 c60000        	ld	a,___func_rc_settingCb
1852  00c8 a101          	cp	a,#1
1853  00ca 2617          	jrne	L533
1855  00cc c60000        	ld	a,__dsCount
1856  00cf a11e          	cp	a,#30
1857  00d1 2510          	jrult	L533
1859  00d3 cd0000        	call	_getSettingChange
1861  00d6 4d            	tnz	a
1862  00d7 260a          	jrne	L533
1863                     ; 464 			__s = 0;
1865  00d9 725f0000      	clr	___s
1866                     ; 465 			_dsCount = 0;
1868  00dd 725f0000      	clr	__dsCount
1869                     ; 467 			return;
1871  00e1 20b8          	jra	L06
1872  00e3               L533:
1873                     ; 469 		if( __timer1s != __func_rc_timerout2 )
1875  00e3 c60000        	ld	a,___timer1s
1876  00e6 c10000        	cp	a,___func_rc_timerout2
1877  00e9 2727          	jreq	L733
1878                     ; 471 			if( __func_rc_timerout1 == 0 )
1880  00eb 725d0000      	tnz	___func_rc_timerout1
1881  00ef 2625          	jrne	L713
1882                     ; 473 				__func_rc_timerout2 = __timer1s;
1884  00f1 5500000000    	mov	___func_rc_timerout2,___timer1s
1885                     ; 474 				__func_rc_timerout1 = 1;
1887  00f6 35010000      	mov	___func_rc_timerout1,#1
1888                     ; 475 				__func_rc_timerout--;
1890  00fa 725a0000      	dec	___func_rc_timerout
1891                     ; 476 				if( __func_rc_timerout == 0 )
1893  00fe 725d0000      	tnz	___func_rc_timerout
1894  0102 2612          	jrne	L713
1895                     ; 480 						ui_error = 19;
1897  0104 35130000      	mov	_ui_error,#19
1898                     ; 481 						_ds = 97;
1900  0108 35610000      	mov	__ds,#97
1901                     ; 482 						_dsCount = 0;
1903  010c 725f0000      	clr	__dsCount
1904  0110 2004          	jra	L713
1905  0112               L733:
1906                     ; 487 			__func_rc_timerout1 = 0;
1908  0112 725f0000      	clr	___func_rc_timerout1
1909  0116               L713:
1910                     ; 489 }
1912  0116 2083          	jra	L06
1969                     ; 492 uint8_t	_ui_writer(uint8_t key)
1969                     ; 493 {
1970                     .text:	section	.text,new
1971  0000               __ui_writer:
1973  0000 88            	push	a
1974       00000001      OFST:	set	1
1977                     ; 494 	uint8_t	i = 0;
1979                     ; 495 	if( __s == 0 )
1981  0001 725d0000      	tnz	___s
1982  0005 263c          	jrne	L563
1983                     ; 497 		if( _dsCount == 0 )
1985  0007 725d0000      	tnz	__dsCount
1986  000b 260c          	jrne	L763
1987                     ; 499 			uiInfo.id = 1;
1989  000d 35010004      	mov	_uiInfo+4,#1
1990                     ; 500 			_dsCount = 1;
1992  0011 35010000      	mov	__dsCount,#1
1994  0015 ac4f014f      	jpf	L573
1995  0019               L763:
1996                     ; 503 		else if( _dsCount == 1 )
1998  0019 c60000        	ld	a,__dsCount
1999  001c a101          	cp	a,#1
2000  001e 2703          	jreq	L47
2001  0020 cc014f        	jp	L573
2002  0023               L47:
2003                     ; 509 				mode_recover = 1;
2005  0023 35010000      	mov	_mode_recover,#1
2006                     ; 511 				func_rc_setting();
2008  0027 cd0000        	call	_func_rc_setting
2010                     ; 512 				__func_rc_timerout = 10;
2012  002a 350a0000      	mov	___func_rc_timerout,#10
2013                     ; 513 				__func_rc_timerout1 = 0;
2015  002e 725f0000      	clr	___func_rc_timerout1
2016                     ; 514 				__func_rc_timerout2 = __timer1s;
2018  0032 5500000000    	mov	___func_rc_timerout2,___timer1s
2019                     ; 515 				_dsCount = 1;
2021  0037 35010000      	mov	__dsCount,#1
2022                     ; 516 				__s = 1;
2024  003b 35010000      	mov	___s,#1
2025  003f ac4f014f      	jpf	L573
2026  0043               L563:
2027                     ; 527 	else if( __s == 10 )
2029  0043 c60000        	ld	a,___s
2030  0046 a10a          	cp	a,#10
2031  0048 2663          	jrne	L773
2032                     ; 529 		if( (_t20ms%10) != 0 )
2034  004a c60000        	ld	a,__t20ms
2035  004d 5f            	clrw	x
2036  004e 97            	ld	xl,a
2037  004f a60a          	ld	a,#10
2038  0051 cd0000        	call	c_smodx
2040  0054 a30000        	cpw	x,#0
2041  0057 2708          	jreq	L104
2042                     ; 531 			_dsPrev = 0;
2044  0059 725f0000      	clr	__dsPrev
2045                     ; 532 			return 0;
2047  005d 4f            	clr	a
2050  005e 5b01          	addw	sp,#1
2051  0060 81            	ret
2052  0061               L104:
2053                     ; 535 		if( _dsPrev != 0 )
2055  0061 725d0000      	tnz	__dsPrev
2056  0065 2704          	jreq	L304
2057                     ; 536 			return 0;
2059  0067 4f            	clr	a
2062  0068 5b01          	addw	sp,#1
2063  006a 81            	ret
2064  006b               L304:
2065                     ; 538 		_dsCount++;
2067  006b 725c0000      	inc	__dsCount
2068                     ; 539 		_dsPrev = 1;
2070  006f 35010000      	mov	__dsPrev,#1
2071                     ; 540 		lcd_clear(0);
2073  0073 4f            	clr	a
2074  0074 cd0000        	call	_lcd_clear
2076                     ; 541 		for( i=0; i<4; i++ )
2078  0077 0f01          	clr	(OFST+0,sp)
2079  0079               L504:
2080                     ; 542 			lcd_disp_n(i, _dsCount%10);
2082  0079 c60000        	ld	a,__dsCount
2083  007c 5f            	clrw	x
2084  007d 97            	ld	xl,a
2085  007e a60a          	ld	a,#10
2086  0080 62            	div	x,a
2087  0081 5f            	clrw	x
2088  0082 97            	ld	xl,a
2089  0083 9f            	ld	a,xl
2090  0084 97            	ld	xl,a
2091  0085 7b01          	ld	a,(OFST+0,sp)
2092  0087 95            	ld	xh,a
2093  0088 cd0000        	call	_lcd_disp_n
2095                     ; 541 		for( i=0; i<4; i++ )
2097  008b 0c01          	inc	(OFST+0,sp)
2100  008d 7b01          	ld	a,(OFST+0,sp)
2101  008f a104          	cp	a,#4
2102  0091 25e6          	jrult	L504
2103                     ; 544 		__delayi--;
2105  0093 725a0003      	dec	___delayi
2106                     ; 545 		if( __delayi == 0 )
2108  0097 725d0003      	tnz	___delayi
2109  009b 2703          	jreq	L67
2110  009d cc014f        	jp	L573
2111  00a0               L67:
2112                     ; 548 			__s = 0;
2114  00a0 725f0000      	clr	___s
2115                     ; 549 			_dsCount = 0;
2117  00a4 725f0000      	clr	__dsCount
2118                     ; 550 			return 1;
2120  00a8 a601          	ld	a,#1
2123  00aa 5b01          	addw	sp,#1
2124  00ac 81            	ret
2125  00ad               L773:
2126                     ; 553 	else if( __s == 1 )
2128  00ad c60000        	ld	a,___s
2129  00b0 a101          	cp	a,#1
2130  00b2 2703          	jreq	L001
2131  00b4 cc014f        	jp	L573
2132  00b7               L001:
2133                     ; 555 		if( (_t20ms%10) != 0 )
2135  00b7 c60000        	ld	a,__t20ms
2136  00ba 5f            	clrw	x
2137  00bb 97            	ld	xl,a
2138  00bc a60a          	ld	a,#10
2139  00be cd0000        	call	c_smodx
2141  00c1 a30000        	cpw	x,#0
2142  00c4 2708          	jreq	L124
2143                     ; 557 			_dsPrev = 0;
2145  00c6 725f0000      	clr	__dsPrev
2146                     ; 558 			return 0;
2148  00ca 4f            	clr	a
2151  00cb 5b01          	addw	sp,#1
2152  00cd 81            	ret
2153  00ce               L124:
2154                     ; 561 		if( _dsPrev != 0 )
2156  00ce 725d0000      	tnz	__dsPrev
2157  00d2 2704          	jreq	L324
2158                     ; 562 			return 0;
2160  00d4 4f            	clr	a
2163  00d5 5b01          	addw	sp,#1
2164  00d7 81            	ret
2165  00d8               L324:
2166                     ; 564 		_dsCount++;
2168  00d8 725c0000      	inc	__dsCount
2169                     ; 565 		_dsPrev = 1;
2171  00dc 35010000      	mov	__dsPrev,#1
2172                     ; 566 		lcd_clear(0);
2174  00e0 4f            	clr	a
2175  00e1 cd0000        	call	_lcd_clear
2177                     ; 567 		for( i=0; i<4; i++ )
2179  00e4 0f01          	clr	(OFST+0,sp)
2180  00e6               L524:
2181                     ; 568 			lcd_disp_n(i, _dsCount%10);
2183  00e6 c60000        	ld	a,__dsCount
2184  00e9 5f            	clrw	x
2185  00ea 97            	ld	xl,a
2186  00eb a60a          	ld	a,#10
2187  00ed 62            	div	x,a
2188  00ee 5f            	clrw	x
2189  00ef 97            	ld	xl,a
2190  00f0 9f            	ld	a,xl
2191  00f1 97            	ld	xl,a
2192  00f2 7b01          	ld	a,(OFST+0,sp)
2193  00f4 95            	ld	xh,a
2194  00f5 cd0000        	call	_lcd_disp_n
2196                     ; 567 		for( i=0; i<4; i++ )
2198  00f8 0c01          	inc	(OFST+0,sp)
2201  00fa 7b01          	ld	a,(OFST+0,sp)
2202  00fc a104          	cp	a,#4
2203  00fe 25e6          	jrult	L524
2204                     ; 570 		if( __func_rc_settingCb == 1 && _dsCount >= 30 && getSettingChange() == 0 )
2206  0100 c60000        	ld	a,___func_rc_settingCb
2207  0103 a101          	cp	a,#1
2208  0105 2615          	jrne	L334
2210  0107 c60000        	ld	a,__dsCount
2211  010a a11e          	cp	a,#30
2212  010c 250e          	jrult	L334
2214  010e cd0000        	call	_getSettingChange
2216  0111 4d            	tnz	a
2217  0112 2608          	jrne	L334
2218                     ; 572 			__delayi = 12;
2220  0114 350c0003      	mov	___delayi,#12
2221                     ; 573 			__s = 10;
2223  0118 350a0000      	mov	___s,#10
2224  011c               L334:
2225                     ; 575 		if( __timer1s != __func_rc_timerout2 )
2227  011c c60000        	ld	a,___timer1s
2228  011f c10000        	cp	a,___func_rc_timerout2
2229  0122 2727          	jreq	L534
2230                     ; 577 			if( __func_rc_timerout1 == 0 )
2232  0124 725d0000      	tnz	___func_rc_timerout1
2233  0128 2625          	jrne	L573
2234                     ; 579 				__func_rc_timerout2 = __timer1s;
2236  012a 5500000000    	mov	___func_rc_timerout2,___timer1s
2237                     ; 580 				__func_rc_timerout1 = 1;
2239  012f 35010000      	mov	___func_rc_timerout1,#1
2240                     ; 581 				__func_rc_timerout--;
2242  0133 725a0000      	dec	___func_rc_timerout
2243                     ; 582 				if( __func_rc_timerout == 0 )
2245  0137 725d0000      	tnz	___func_rc_timerout
2246  013b 2612          	jrne	L573
2247                     ; 586 						ui_error = 19;
2249  013d 35130000      	mov	_ui_error,#19
2250                     ; 587 						_ds = 97;
2252  0141 35610000      	mov	__ds,#97
2253                     ; 588 						_dsCount = 0;
2255  0145 725f0000      	clr	__dsCount
2256  0149 2004          	jra	L573
2257  014b               L534:
2258                     ; 593 			__func_rc_timerout1 = 0;
2260  014b 725f0000      	clr	___func_rc_timerout1
2261  014f               L573:
2262                     ; 595 	return 0;
2264  014f 4f            	clr	a
2267  0150 5b01          	addw	sp,#1
2268  0152 81            	ret
2311                     	xdef	__ui_writer
2312                     	xdef	__ui_setup
2313                     	xdef	___delayi
2314                     	xref	_getSettingChange
2315                     	xref	_mode_recover
2316                     	xref	_ui_error
2317                     	xref	___func_rc_timerout2
2318                     	xref	___func_rc_timerout1
2319                     	xref	___func_rc_timerout
2320                     	xref	_func_rc_setting
2321                     	xref	___func_rc_settingCb
2322                     	xdef	__ui_setup_menu
2323                     	xdef	__ui_setup_menu_disp
2324                     	xdef	_char_d4
2325                     	xdef	_char_c4
2326                     	xdef	_char_b4
2327                     	xdef	_char_a4
2328                     	xdef	_char_eS
2329                     	xdef	_char_L4
2330                     	xdef	_char_e4
2331                     	xdef	_char_h3
2332                     	xdef	_char_e3
2333                     	xdef	_char_ext_h
2334                     	xdef	__ui_setup_info
2335                     	xdef	___cntlMode
2336                     	xref	__boiler_type
2337                     	xdef	__uiSetupPrev
2338                     	xdef	__uiSetup
2339                     	xref	__dsPrev
2340                     	xref	__dsCount
2341                     	xref	__ds
2342                     	xref	___s
2343                     	xref	_lcd_disp_n
2344                     	xref	_lcd_clear
2345                     	xref	_iLF_DEF
2346                     	xref	_bLF_DEF
2347                     	xref	_uiInfo
2348                     	xref	_file_write
2349                     	xref	___timer1s
2350                     	xref	__t20ms
2351                     	xref.b	c_x
2370                     	xref	c_smodx
2371                     	end
