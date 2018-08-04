   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
 113                     ; 93 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 113                     ; 94 {
 115                     .text:	section	.text,new
 116  0000               _GPIO_DeInit:
 120                     ; 95   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 122  0000 6f04          	clr	(4,x)
 123                     ; 96   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 125  0002 7f            	clr	(x)
 126                     ; 97   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 128  0003 6f02          	clr	(2,x)
 129                     ; 98   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 131  0005 6f03          	clr	(3,x)
 132                     ; 99 }
 135  0007 81            	ret
 289                     ; 130 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 289                     ; 131 {
 290                     .text:	section	.text,new
 291  0000               _GPIO_Init:
 293  0000 89            	pushw	x
 294       00000000      OFST:	set	0
 297                     ; 136   assert_param(IS_GPIO_MODE(GPIO_Mode));
 299                     ; 137   assert_param(IS_GPIO_PIN(GPIO_Pin));
 301                     ; 140   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 303  0001 7b05          	ld	a,(OFST+5,sp)
 304  0003 43            	cpl	a
 305  0004 e404          	and	a,(4,x)
 306  0006 e704          	ld	(4,x),a
 307                     ; 146   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 309  0008 7b06          	ld	a,(OFST+6,sp)
 310  000a a580          	bcp	a,#128
 311  000c 271d          	jreq	L341
 312                     ; 148     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 314  000e 7b06          	ld	a,(OFST+6,sp)
 315  0010 a510          	bcp	a,#16
 316  0012 2706          	jreq	L541
 317                     ; 150       GPIOx->ODR |= GPIO_Pin;
 319  0014 f6            	ld	a,(x)
 320  0015 1a05          	or	a,(OFST+5,sp)
 321  0017 f7            	ld	(x),a
 323  0018 2007          	jra	L741
 324  001a               L541:
 325                     ; 153       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 327  001a 1e01          	ldw	x,(OFST+1,sp)
 328  001c 7b05          	ld	a,(OFST+5,sp)
 329  001e 43            	cpl	a
 330  001f f4            	and	a,(x)
 331  0020 f7            	ld	(x),a
 332  0021               L741:
 333                     ; 156     GPIOx->DDR |= GPIO_Pin;
 335  0021 1e01          	ldw	x,(OFST+1,sp)
 336  0023 e602          	ld	a,(2,x)
 337  0025 1a05          	or	a,(OFST+5,sp)
 338  0027 e702          	ld	(2,x),a
 340  0029 2009          	jra	L151
 341  002b               L341:
 342                     ; 160     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 344  002b 1e01          	ldw	x,(OFST+1,sp)
 345  002d 7b05          	ld	a,(OFST+5,sp)
 346  002f 43            	cpl	a
 347  0030 e402          	and	a,(2,x)
 348  0032 e702          	ld	(2,x),a
 349  0034               L151:
 350                     ; 167   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 352  0034 7b06          	ld	a,(OFST+6,sp)
 353  0036 a540          	bcp	a,#64
 354  0038 270a          	jreq	L351
 355                     ; 169     GPIOx->CR1 |= GPIO_Pin;
 357  003a 1e01          	ldw	x,(OFST+1,sp)
 358  003c e603          	ld	a,(3,x)
 359  003e 1a05          	or	a,(OFST+5,sp)
 360  0040 e703          	ld	(3,x),a
 362  0042 2009          	jra	L551
 363  0044               L351:
 364                     ; 172     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 366  0044 1e01          	ldw	x,(OFST+1,sp)
 367  0046 7b05          	ld	a,(OFST+5,sp)
 368  0048 43            	cpl	a
 369  0049 e403          	and	a,(3,x)
 370  004b e703          	ld	(3,x),a
 371  004d               L551:
 372                     ; 179   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 374  004d 7b06          	ld	a,(OFST+6,sp)
 375  004f a520          	bcp	a,#32
 376  0051 270a          	jreq	L751
 377                     ; 181     GPIOx->CR2 |= GPIO_Pin;
 379  0053 1e01          	ldw	x,(OFST+1,sp)
 380  0055 e604          	ld	a,(4,x)
 381  0057 1a05          	or	a,(OFST+5,sp)
 382  0059 e704          	ld	(4,x),a
 384  005b 2009          	jra	L161
 385  005d               L751:
 386                     ; 184     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 388  005d 1e01          	ldw	x,(OFST+1,sp)
 389  005f 7b05          	ld	a,(OFST+5,sp)
 390  0061 43            	cpl	a
 391  0062 e404          	and	a,(4,x)
 392  0064 e704          	ld	(4,x),a
 393  0066               L161:
 394                     ; 187 }
 397  0066 85            	popw	x
 398  0067 81            	ret
 473                     ; 206 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 473                     ; 207 {
 474                     .text:	section	.text,new
 475  0000               _GPIO_ExternalPullUpConfig:
 477  0000 89            	pushw	x
 478       00000000      OFST:	set	0
 481                     ; 209   assert_param(IS_GPIO_PIN(GPIO_Pin));
 483                     ; 210   assert_param(IS_FUNCTIONAL_STATE(NewState));
 485                     ; 212   if (NewState != DISABLE) /* External Pull-Up Set*/
 487  0001 0d06          	tnz	(OFST+6,sp)
 488  0003 2708          	jreq	L122
 489                     ; 214     GPIOx->CR1 |= GPIO_Pin;
 491  0005 e603          	ld	a,(3,x)
 492  0007 1a05          	or	a,(OFST+5,sp)
 493  0009 e703          	ld	(3,x),a
 495  000b 2009          	jra	L322
 496  000d               L122:
 497                     ; 217     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 499  000d 1e01          	ldw	x,(OFST+1,sp)
 500  000f 7b05          	ld	a,(OFST+5,sp)
 501  0011 43            	cpl	a
 502  0012 e403          	and	a,(3,x)
 503  0014 e703          	ld	(3,x),a
 504  0016               L322:
 505                     ; 219 }
 508  0016 85            	popw	x
 509  0017 81            	ret
 553                     ; 245 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 553                     ; 246 {
 554                     .text:	section	.text,new
 555  0000               _GPIO_Write:
 557  0000 89            	pushw	x
 558       00000000      OFST:	set	0
 561                     ; 247   GPIOx->ODR = GPIO_PortVal;
 563  0001 7b05          	ld	a,(OFST+5,sp)
 564  0003 1e01          	ldw	x,(OFST+1,sp)
 565  0005 f7            	ld	(x),a
 566                     ; 248 }
 569  0006 85            	popw	x
 570  0007 81            	ret
 730                     ; 267 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 730                     ; 268 {
 731                     .text:	section	.text,new
 732  0000               _GPIO_WriteBit:
 734  0000 89            	pushw	x
 735       00000000      OFST:	set	0
 738                     ; 270   assert_param(IS_GPIO_PIN(GPIO_Pin));
 740                     ; 271   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 742                     ; 273   if (GPIO_BitVal != RESET)
 744  0001 0d06          	tnz	(OFST+6,sp)
 745  0003 2706          	jreq	L143
 746                     ; 275     GPIOx->ODR |= GPIO_Pin;
 748  0005 f6            	ld	a,(x)
 749  0006 1a05          	or	a,(OFST+5,sp)
 750  0008 f7            	ld	(x),a
 752  0009 2007          	jra	L343
 753  000b               L143:
 754                     ; 280     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 756  000b 1e01          	ldw	x,(OFST+1,sp)
 757  000d 7b05          	ld	a,(OFST+5,sp)
 758  000f 43            	cpl	a
 759  0010 f4            	and	a,(x)
 760  0011 f7            	ld	(x),a
 761  0012               L343:
 762                     ; 282 }
 765  0012 85            	popw	x
 766  0013 81            	ret
 810                     ; 300 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 810                     ; 301 {
 811                     .text:	section	.text,new
 812  0000               _GPIO_SetBits:
 814  0000 89            	pushw	x
 815       00000000      OFST:	set	0
 818                     ; 302   GPIOx->ODR |= GPIO_Pin;
 820  0001 f6            	ld	a,(x)
 821  0002 1a05          	or	a,(OFST+5,sp)
 822  0004 f7            	ld	(x),a
 823                     ; 303 }
 826  0005 85            	popw	x
 827  0006 81            	ret
 871                     ; 321 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 871                     ; 322 {
 872                     .text:	section	.text,new
 873  0000               _GPIO_ResetBits:
 875  0000 89            	pushw	x
 876       00000000      OFST:	set	0
 879                     ; 323   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 881  0001 7b05          	ld	a,(OFST+5,sp)
 882  0003 43            	cpl	a
 883  0004 f4            	and	a,(x)
 884  0005 f7            	ld	(x),a
 885                     ; 324 }
 888  0006 85            	popw	x
 889  0007 81            	ret
 933                     ; 333 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 933                     ; 334 {
 934                     .text:	section	.text,new
 935  0000               _GPIO_ToggleBits:
 937  0000 89            	pushw	x
 938       00000000      OFST:	set	0
 941                     ; 335   GPIOx->ODR ^= GPIO_Pin;
 943  0001 f6            	ld	a,(x)
 944  0002 1805          	xor	a,	(OFST+5,sp)
 945  0004 f7            	ld	(x),a
 946                     ; 336 }
 949  0005 85            	popw	x
 950  0006 81            	ret
 987                     ; 344 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 987                     ; 345 {
 988                     .text:	section	.text,new
 989  0000               _GPIO_ReadInputData:
 993                     ; 346   return ((uint8_t)GPIOx->IDR);
 995  0000 e601          	ld	a,(1,x)
 998  0002 81            	ret
1036                     ; 355 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1036                     ; 356 {
1037                     .text:	section	.text,new
1038  0000               _GPIO_ReadOutputData:
1042                     ; 357   return ((uint8_t)GPIOx->ODR);
1044  0000 f6            	ld	a,(x)
1047  0001 81            	ret
1096                     ; 375 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1096                     ; 376 {
1097                     .text:	section	.text,new
1098  0000               _GPIO_ReadInputDataBit:
1100  0000 89            	pushw	x
1101       00000000      OFST:	set	0
1104                     ; 377   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1106  0001 e601          	ld	a,(1,x)
1107  0003 1405          	and	a,(OFST+5,sp)
1110  0005 85            	popw	x
1111  0006 81            	ret
1160                     ; 386 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1160                     ; 387 {
1161                     .text:	section	.text,new
1162  0000               _GPIO_ReadOutputDataBit:
1164  0000 89            	pushw	x
1165       00000000      OFST:	set	0
1168                     ; 388   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1170  0001 f6            	ld	a,(x)
1171  0002 1405          	and	a,(OFST+5,sp)
1174  0004 85            	popw	x
1175  0005 81            	ret
1188                     	xdef	_GPIO_ReadOutputDataBit
1189                     	xdef	_GPIO_ReadInputDataBit
1190                     	xdef	_GPIO_ReadOutputData
1191                     	xdef	_GPIO_ReadInputData
1192                     	xdef	_GPIO_ToggleBits
1193                     	xdef	_GPIO_ResetBits
1194                     	xdef	_GPIO_SetBits
1195                     	xdef	_GPIO_WriteBit
1196                     	xdef	_GPIO_Write
1197                     	xdef	_GPIO_ExternalPullUpConfig
1198                     	xdef	_GPIO_Init
1199                     	xdef	_GPIO_DeInit
1218                     	end
