   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 116                     ; 93 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 116                     ; 94 {
 118                     .text:	section	.text,new
 119  0000               _GPIO_DeInit:
 123                     ; 95   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 125  0000 6f04          	clr	(4,x)
 126                     ; 96   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 128  0002 7f            	clr	(x)
 129                     ; 97   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 131  0003 6f02          	clr	(2,x)
 132                     ; 98   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 134  0005 6f03          	clr	(3,x)
 135                     ; 99 }
 138  0007 81            	ret	
 292                     ; 130 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 292                     ; 131 {
 293                     .text:	section	.text,new
 294  0000               _GPIO_Init:
 296  0000 89            	pushw	x
 297       00000000      OFST:	set	0
 300                     ; 136   assert_param(IS_GPIO_MODE(GPIO_Mode));
 302                     ; 137   assert_param(IS_GPIO_PIN(GPIO_Pin));
 304                     ; 140   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 306  0001 7b05          	ld	a,(OFST+5,sp)
 307  0003 43            	cpl	a
 308  0004 e404          	and	a,(4,x)
 309  0006 e704          	ld	(4,x),a
 310                     ; 146   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 312  0008 7b06          	ld	a,(OFST+6,sp)
 313  000a 2a18          	jrpl	L341
 314                     ; 148     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 316  000c a510          	bcp	a,#16
 317  000e 2705          	jreq	L541
 318                     ; 150       GPIOx->ODR |= GPIO_Pin;
 320  0010 f6            	ld	a,(x)
 321  0011 1a05          	or	a,(OFST+5,sp)
 323  0013 2006          	jra	L741
 324  0015               L541:
 325                     ; 153       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 327  0015 1e01          	ldw	x,(OFST+1,sp)
 328  0017 7b05          	ld	a,(OFST+5,sp)
 329  0019 43            	cpl	a
 330  001a f4            	and	a,(x)
 331  001b               L741:
 332  001b f7            	ld	(x),a
 333                     ; 156     GPIOx->DDR |= GPIO_Pin;
 335  001c 1e01          	ldw	x,(OFST+1,sp)
 336  001e e602          	ld	a,(2,x)
 337  0020 1a05          	or	a,(OFST+5,sp)
 339  0022 2007          	jra	L151
 340  0024               L341:
 341                     ; 160     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 343  0024 1e01          	ldw	x,(OFST+1,sp)
 344  0026 7b05          	ld	a,(OFST+5,sp)
 345  0028 43            	cpl	a
 346  0029 e402          	and	a,(2,x)
 347  002b               L151:
 348  002b e702          	ld	(2,x),a
 349                     ; 167   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 351  002d 7b06          	ld	a,(OFST+6,sp)
 352  002f a540          	bcp	a,#64
 353  0031 2706          	jreq	L351
 354                     ; 169     GPIOx->CR1 |= GPIO_Pin;
 356  0033 e603          	ld	a,(3,x)
 357  0035 1a05          	or	a,(OFST+5,sp)
 359  0037 2005          	jra	L551
 360  0039               L351:
 361                     ; 172     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 363  0039 7b05          	ld	a,(OFST+5,sp)
 364  003b 43            	cpl	a
 365  003c e403          	and	a,(3,x)
 366  003e               L551:
 367  003e e703          	ld	(3,x),a
 368                     ; 179   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 370  0040 7b06          	ld	a,(OFST+6,sp)
 371  0042 a520          	bcp	a,#32
 372  0044 2706          	jreq	L751
 373                     ; 181     GPIOx->CR2 |= GPIO_Pin;
 375  0046 e604          	ld	a,(4,x)
 376  0048 1a05          	or	a,(OFST+5,sp)
 378  004a 2005          	jra	L161
 379  004c               L751:
 380                     ; 184     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 382  004c 7b05          	ld	a,(OFST+5,sp)
 383  004e 43            	cpl	a
 384  004f e404          	and	a,(4,x)
 385  0051               L161:
 386  0051 e704          	ld	(4,x),a
 387                     ; 187 }
 390  0053 85            	popw	x
 391  0054 81            	ret	
 466                     ; 206 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 466                     ; 207 {
 467                     .text:	section	.text,new
 468  0000               _GPIO_ExternalPullUpConfig:
 470  0000 89            	pushw	x
 471       00000000      OFST:	set	0
 474                     ; 209   assert_param(IS_GPIO_PIN(GPIO_Pin));
 476                     ; 210   assert_param(IS_FUNCTIONAL_STATE(NewState));
 478                     ; 212   if (NewState != DISABLE) /* External Pull-Up Set*/
 480  0001 7b06          	ld	a,(OFST+6,sp)
 481  0003 2706          	jreq	L122
 482                     ; 214     GPIOx->CR1 |= GPIO_Pin;
 484  0005 e603          	ld	a,(3,x)
 485  0007 1a05          	or	a,(OFST+5,sp)
 487  0009 2007          	jra	L322
 488  000b               L122:
 489                     ; 217     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 491  000b 1e01          	ldw	x,(OFST+1,sp)
 492  000d 7b05          	ld	a,(OFST+5,sp)
 493  000f 43            	cpl	a
 494  0010 e403          	and	a,(3,x)
 495  0012               L322:
 496  0012 e703          	ld	(3,x),a
 497                     ; 219 }
 500  0014 85            	popw	x
 501  0015 81            	ret	
 545                     ; 245 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 545                     ; 246 {
 546                     .text:	section	.text,new
 547  0000               _GPIO_Write:
 549  0000 89            	pushw	x
 550       00000000      OFST:	set	0
 553                     ; 247   GPIOx->ODR = GPIO_PortVal;
 555  0001 7b05          	ld	a,(OFST+5,sp)
 556  0003 1e01          	ldw	x,(OFST+1,sp)
 557  0005 f7            	ld	(x),a
 558                     ; 248 }
 561  0006 85            	popw	x
 562  0007 81            	ret	
 722                     ; 267 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 722                     ; 268 {
 723                     .text:	section	.text,new
 724  0000               _GPIO_WriteBit:
 726  0000 89            	pushw	x
 727       00000000      OFST:	set	0
 730                     ; 270   assert_param(IS_GPIO_PIN(GPIO_Pin));
 732                     ; 271   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 734                     ; 273   if (GPIO_BitVal != RESET)
 736  0001 7b06          	ld	a,(OFST+6,sp)
 737  0003 2705          	jreq	L143
 738                     ; 275     GPIOx->ODR |= GPIO_Pin;
 740  0005 f6            	ld	a,(x)
 741  0006 1a05          	or	a,(OFST+5,sp)
 743  0008 2006          	jra	L343
 744  000a               L143:
 745                     ; 280     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 747  000a 1e01          	ldw	x,(OFST+1,sp)
 748  000c 7b05          	ld	a,(OFST+5,sp)
 749  000e 43            	cpl	a
 750  000f f4            	and	a,(x)
 751  0010               L343:
 752  0010 f7            	ld	(x),a
 753                     ; 282 }
 756  0011 85            	popw	x
 757  0012 81            	ret	
 801                     ; 300 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 801                     ; 301 {
 802                     .text:	section	.text,new
 803  0000               _GPIO_SetBits:
 805  0000 89            	pushw	x
 806       00000000      OFST:	set	0
 809                     ; 302   GPIOx->ODR |= GPIO_Pin;
 811  0001 f6            	ld	a,(x)
 812  0002 1a05          	or	a,(OFST+5,sp)
 813  0004 f7            	ld	(x),a
 814                     ; 303 }
 817  0005 85            	popw	x
 818  0006 81            	ret	
 862                     ; 321 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 862                     ; 322 {
 863                     .text:	section	.text,new
 864  0000               _GPIO_ResetBits:
 866  0000 89            	pushw	x
 867       00000000      OFST:	set	0
 870                     ; 323   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 872  0001 7b05          	ld	a,(OFST+5,sp)
 873  0003 43            	cpl	a
 874  0004 f4            	and	a,(x)
 875  0005 f7            	ld	(x),a
 876                     ; 324 }
 879  0006 85            	popw	x
 880  0007 81            	ret	
 924                     ; 333 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 924                     ; 334 {
 925                     .text:	section	.text,new
 926  0000               _GPIO_ToggleBits:
 928  0000 89            	pushw	x
 929       00000000      OFST:	set	0
 932                     ; 335   GPIOx->ODR ^= GPIO_Pin;
 934  0001 f6            	ld	a,(x)
 935  0002 1805          	xor	a,(OFST+5,sp)
 936  0004 f7            	ld	(x),a
 937                     ; 336 }
 940  0005 85            	popw	x
 941  0006 81            	ret	
 978                     ; 344 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 978                     ; 345 {
 979                     .text:	section	.text,new
 980  0000               _GPIO_ReadInputData:
 984                     ; 346   return ((uint8_t)GPIOx->IDR);
 986  0000 e601          	ld	a,(1,x)
 989  0002 81            	ret	
1027                     ; 355 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1027                     ; 356 {
1028                     .text:	section	.text,new
1029  0000               _GPIO_ReadOutputData:
1033                     ; 357   return ((uint8_t)GPIOx->ODR);
1035  0000 f6            	ld	a,(x)
1038  0001 81            	ret	
1087                     ; 375 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1087                     ; 376 {
1088                     .text:	section	.text,new
1089  0000               _GPIO_ReadInputDataBit:
1091  0000 89            	pushw	x
1092       00000000      OFST:	set	0
1095                     ; 377   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1097  0001 e601          	ld	a,(1,x)
1098  0003 1405          	and	a,(OFST+5,sp)
1101  0005 85            	popw	x
1102  0006 81            	ret	
1151                     ; 386 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1151                     ; 387 {
1152                     .text:	section	.text,new
1153  0000               _GPIO_ReadOutputDataBit:
1155  0000 89            	pushw	x
1156       00000000      OFST:	set	0
1159                     ; 388   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1161  0001 f6            	ld	a,(x)
1162  0002 1405          	and	a,(OFST+5,sp)
1165  0004 85            	popw	x
1166  0005 81            	ret	
1179                     	xdef	_GPIO_ReadOutputDataBit
1180                     	xdef	_GPIO_ReadInputDataBit
1181                     	xdef	_GPIO_ReadOutputData
1182                     	xdef	_GPIO_ReadInputData
1183                     	xdef	_GPIO_ToggleBits
1184                     	xdef	_GPIO_ResetBits
1185                     	xdef	_GPIO_SetBits
1186                     	xdef	_GPIO_WriteBit
1187                     	xdef	_GPIO_Write
1188                     	xdef	_GPIO_ExternalPullUpConfig
1189                     	xdef	_GPIO_Init
1190                     	xdef	_GPIO_DeInit
1209                     	end
