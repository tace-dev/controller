   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  44                     ; 53 void EXTI_DeInit(void)
  44                     ; 54 {
  46                     	switch	.text
  47  0000               _EXTI_DeInit:
  51                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  53  0000 725f50a0      	clr	20640
  54                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  56  0004 725f50a1      	clr	20641
  57                     ; 57 }
  60  0008 81            	ret
 186                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 186                     ; 71 {
 187                     	switch	.text
 188  0009               _EXTI_SetExtIntSensitivity:
 190  0009 89            	pushw	x
 191       00000000      OFST:	set	0
 194                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 196  000a 9e            	ld	a,xh
 197  000b 4d            	tnz	a
 198  000c 2714          	jreq	L21
 199  000e 9e            	ld	a,xh
 200  000f a101          	cp	a,#1
 201  0011 270f          	jreq	L21
 202  0013 9e            	ld	a,xh
 203  0014 a102          	cp	a,#2
 204  0016 270a          	jreq	L21
 205  0018 9e            	ld	a,xh
 206  0019 a103          	cp	a,#3
 207  001b 2705          	jreq	L21
 208  001d 9e            	ld	a,xh
 209  001e a104          	cp	a,#4
 210  0020 2603          	jrne	L01
 211  0022               L21:
 212  0022 4f            	clr	a
 213  0023 2010          	jra	L41
 214  0025               L01:
 215  0025 ae0049        	ldw	x,#73
 216  0028 89            	pushw	x
 217  0029 ae0000        	ldw	x,#0
 218  002c 89            	pushw	x
 219  002d ae0000        	ldw	x,#L111
 220  0030 cd0000        	call	_assert_failed
 222  0033 5b04          	addw	sp,#4
 223  0035               L41:
 224                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 226  0035 0d02          	tnz	(OFST+2,sp)
 227  0037 2712          	jreq	L02
 228  0039 7b02          	ld	a,(OFST+2,sp)
 229  003b a101          	cp	a,#1
 230  003d 270c          	jreq	L02
 231  003f 7b02          	ld	a,(OFST+2,sp)
 232  0041 a102          	cp	a,#2
 233  0043 2706          	jreq	L02
 234  0045 7b02          	ld	a,(OFST+2,sp)
 235  0047 a103          	cp	a,#3
 236  0049 2603          	jrne	L61
 237  004b               L02:
 238  004b 4f            	clr	a
 239  004c 2010          	jra	L22
 240  004e               L61:
 241  004e ae004a        	ldw	x,#74
 242  0051 89            	pushw	x
 243  0052 ae0000        	ldw	x,#0
 244  0055 89            	pushw	x
 245  0056 ae0000        	ldw	x,#L111
 246  0059 cd0000        	call	_assert_failed
 248  005c 5b04          	addw	sp,#4
 249  005e               L22:
 250                     ; 77   switch (Port)
 252  005e 7b01          	ld	a,(OFST+1,sp)
 254                     ; 99   default:
 254                     ; 100     break;
 255  0060 4d            	tnz	a
 256  0061 270e          	jreq	L12
 257  0063 4a            	dec	a
 258  0064 271d          	jreq	L32
 259  0066 4a            	dec	a
 260  0067 272e          	jreq	L52
 261  0069 4a            	dec	a
 262  006a 2742          	jreq	L72
 263  006c 4a            	dec	a
 264  006d 2756          	jreq	L13
 265  006f 2064          	jra	L511
 266  0071               L12:
 267                     ; 79   case EXTI_PORT_GPIOA:
 267                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 269  0071 c650a0        	ld	a,20640
 270  0074 a4fc          	and	a,#252
 271  0076 c750a0        	ld	20640,a
 272                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 274  0079 c650a0        	ld	a,20640
 275  007c 1a02          	or	a,(OFST+2,sp)
 276  007e c750a0        	ld	20640,a
 277                     ; 82     break;
 279  0081 2052          	jra	L511
 280  0083               L32:
 281                     ; 83   case EXTI_PORT_GPIOB:
 281                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 283  0083 c650a0        	ld	a,20640
 284  0086 a4f3          	and	a,#243
 285  0088 c750a0        	ld	20640,a
 286                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 288  008b 7b02          	ld	a,(OFST+2,sp)
 289  008d 48            	sll	a
 290  008e 48            	sll	a
 291  008f ca50a0        	or	a,20640
 292  0092 c750a0        	ld	20640,a
 293                     ; 86     break;
 295  0095 203e          	jra	L511
 296  0097               L52:
 297                     ; 87   case EXTI_PORT_GPIOC:
 297                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 299  0097 c650a0        	ld	a,20640
 300  009a a4cf          	and	a,#207
 301  009c c750a0        	ld	20640,a
 302                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 304  009f 7b02          	ld	a,(OFST+2,sp)
 305  00a1 97            	ld	xl,a
 306  00a2 a610          	ld	a,#16
 307  00a4 42            	mul	x,a
 308  00a5 9f            	ld	a,xl
 309  00a6 ca50a0        	or	a,20640
 310  00a9 c750a0        	ld	20640,a
 311                     ; 90     break;
 313  00ac 2027          	jra	L511
 314  00ae               L72:
 315                     ; 91   case EXTI_PORT_GPIOD:
 315                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 317  00ae c650a0        	ld	a,20640
 318  00b1 a43f          	and	a,#63
 319  00b3 c750a0        	ld	20640,a
 320                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 322  00b6 7b02          	ld	a,(OFST+2,sp)
 323  00b8 97            	ld	xl,a
 324  00b9 a640          	ld	a,#64
 325  00bb 42            	mul	x,a
 326  00bc 9f            	ld	a,xl
 327  00bd ca50a0        	or	a,20640
 328  00c0 c750a0        	ld	20640,a
 329                     ; 94     break;
 331  00c3 2010          	jra	L511
 332  00c5               L13:
 333                     ; 95   case EXTI_PORT_GPIOE:
 333                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 335  00c5 c650a1        	ld	a,20641
 336  00c8 a4fc          	and	a,#252
 337  00ca c750a1        	ld	20641,a
 338                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 340  00cd c650a1        	ld	a,20641
 341  00d0 1a02          	or	a,(OFST+2,sp)
 342  00d2 c750a1        	ld	20641,a
 343                     ; 98     break;
 345  00d5               L33:
 346                     ; 99   default:
 346                     ; 100     break;
 348  00d5               L511:
 349                     ; 102 }
 352  00d5 85            	popw	x
 353  00d6 81            	ret
 412                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 412                     ; 112 {
 413                     	switch	.text
 414  00d7               _EXTI_SetTLISensitivity:
 416  00d7 88            	push	a
 417       00000000      OFST:	set	0
 420                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 422  00d8 4d            	tnz	a
 423  00d9 2704          	jreq	L03
 424  00db a104          	cp	a,#4
 425  00dd 2603          	jrne	L62
 426  00df               L03:
 427  00df 4f            	clr	a
 428  00e0 2010          	jra	L23
 429  00e2               L62:
 430  00e2 ae0072        	ldw	x,#114
 431  00e5 89            	pushw	x
 432  00e6 ae0000        	ldw	x,#0
 433  00e9 89            	pushw	x
 434  00ea ae0000        	ldw	x,#L111
 435  00ed cd0000        	call	_assert_failed
 437  00f0 5b04          	addw	sp,#4
 438  00f2               L23:
 439                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 441  00f2 721550a1      	bres	20641,#2
 442                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 444  00f6 c650a1        	ld	a,20641
 445  00f9 1a01          	or	a,(OFST+1,sp)
 446  00fb c750a1        	ld	20641,a
 447                     ; 119 }
 450  00fe 84            	pop	a
 451  00ff 81            	ret
 498                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 498                     ; 127 {
 499                     	switch	.text
 500  0100               _EXTI_GetExtIntSensitivity:
 502  0100 88            	push	a
 503  0101 88            	push	a
 504       00000001      OFST:	set	1
 507                     ; 128   uint8_t value = 0;
 509  0102 0f01          	clr	(OFST+0,sp)
 511                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 513  0104 4d            	tnz	a
 514  0105 2710          	jreq	L04
 515  0107 a101          	cp	a,#1
 516  0109 270c          	jreq	L04
 517  010b a102          	cp	a,#2
 518  010d 2708          	jreq	L04
 519  010f a103          	cp	a,#3
 520  0111 2704          	jreq	L04
 521  0113 a104          	cp	a,#4
 522  0115 2603          	jrne	L63
 523  0117               L04:
 524  0117 4f            	clr	a
 525  0118 2010          	jra	L24
 526  011a               L63:
 527  011a ae0083        	ldw	x,#131
 528  011d 89            	pushw	x
 529  011e ae0000        	ldw	x,#0
 530  0121 89            	pushw	x
 531  0122 ae0000        	ldw	x,#L111
 532  0125 cd0000        	call	_assert_failed
 534  0128 5b04          	addw	sp,#4
 535  012a               L24:
 536                     ; 133   switch (Port)
 538  012a 7b02          	ld	a,(OFST+1,sp)
 540                     ; 150   default:
 540                     ; 151     break;
 541  012c 4d            	tnz	a
 542  012d 270e          	jreq	L541
 543  012f 4a            	dec	a
 544  0130 2714          	jreq	L741
 545  0132 4a            	dec	a
 546  0133 271c          	jreq	L151
 547  0135 4a            	dec	a
 548  0136 2725          	jreq	L351
 549  0138 4a            	dec	a
 550  0139 2730          	jreq	L551
 551  013b 2035          	jra	L502
 552  013d               L541:
 553                     ; 135   case EXTI_PORT_GPIOA:
 553                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 555  013d c650a0        	ld	a,20640
 556  0140 a403          	and	a,#3
 557  0142 6b01          	ld	(OFST+0,sp),a
 559                     ; 137     break;
 561  0144 202c          	jra	L502
 562  0146               L741:
 563                     ; 138   case EXTI_PORT_GPIOB:
 563                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 565  0146 c650a0        	ld	a,20640
 566  0149 a40c          	and	a,#12
 567  014b 44            	srl	a
 568  014c 44            	srl	a
 569  014d 6b01          	ld	(OFST+0,sp),a
 571                     ; 140     break;
 573  014f 2021          	jra	L502
 574  0151               L151:
 575                     ; 141   case EXTI_PORT_GPIOC:
 575                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 577  0151 c650a0        	ld	a,20640
 578  0154 a430          	and	a,#48
 579  0156 4e            	swap	a
 580  0157 a40f          	and	a,#15
 581  0159 6b01          	ld	(OFST+0,sp),a
 583                     ; 143     break;
 585  015b 2015          	jra	L502
 586  015d               L351:
 587                     ; 144   case EXTI_PORT_GPIOD:
 587                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 589  015d c650a0        	ld	a,20640
 590  0160 a4c0          	and	a,#192
 591  0162 4e            	swap	a
 592  0163 44            	srl	a
 593  0164 44            	srl	a
 594  0165 a403          	and	a,#3
 595  0167 6b01          	ld	(OFST+0,sp),a
 597                     ; 146     break;
 599  0169 2007          	jra	L502
 600  016b               L551:
 601                     ; 147   case EXTI_PORT_GPIOE:
 601                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 603  016b c650a1        	ld	a,20641
 604  016e a403          	and	a,#3
 605  0170 6b01          	ld	(OFST+0,sp),a
 607                     ; 149     break;
 609  0172               L751:
 610                     ; 150   default:
 610                     ; 151     break;
 612  0172               L502:
 613                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 615  0172 7b01          	ld	a,(OFST+0,sp)
 618  0174 85            	popw	x
 619  0175 81            	ret
 655                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 655                     ; 163 {
 656                     	switch	.text
 657  0176               _EXTI_GetTLISensitivity:
 659  0176 88            	push	a
 660       00000001      OFST:	set	1
 663                     ; 164   uint8_t value = 0;
 665                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 667  0177 c650a1        	ld	a,20641
 668  017a a404          	and	a,#4
 669  017c 6b01          	ld	(OFST+0,sp),a
 671                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 673  017e 7b01          	ld	a,(OFST+0,sp)
 676  0180 5b01          	addw	sp,#1
 677  0182 81            	ret
 690                     	xdef	_EXTI_GetTLISensitivity
 691                     	xdef	_EXTI_GetExtIntSensitivity
 692                     	xdef	_EXTI_SetTLISensitivity
 693                     	xdef	_EXTI_SetExtIntSensitivity
 694                     	xdef	_EXTI_DeInit
 695                     	xref	_assert_failed
 696                     .const:	section	.text
 697  0000               L111:
 698  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm\librarie"
 699  0012 735c73746d38  	dc.b	"s\stm8s_stdperiph_"
 700  0024 647269766572  	dc.b	"driver\src\stm8s_e"
 701  0036 7874692e6300  	dc.b	"xti.c",0
 721                     	end
