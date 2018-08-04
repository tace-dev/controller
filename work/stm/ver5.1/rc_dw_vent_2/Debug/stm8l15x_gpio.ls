   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 116                     ; 93 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 116                     ; 94 {
 117                     .text:	section	.text,new
 118  0000               f_GPIO_DeInit:
 122                     ; 95   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 124  0000 6f04          	clr	(4,x)
 125                     ; 96   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 127  0002 7f            	clr	(x)
 128                     ; 97   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 130  0003 6f02          	clr	(2,x)
 131                     ; 98   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 133  0005 6f03          	clr	(3,x)
 134                     ; 99 }
 137  0007 87            	retf	
 290                     ; 130 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 290                     ; 131 {
 291                     .text:	section	.text,new
 292  0000               f_GPIO_Init:
 294  0000 89            	pushw	x
 295       00000000      OFST:	set	0
 298                     ; 136   assert_param(IS_GPIO_MODE(GPIO_Mode));
 300                     ; 137   assert_param(IS_GPIO_PIN(GPIO_Pin));
 302                     ; 140   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 304  0001 7b06          	ld	a,(OFST+6,sp)
 305  0003 43            	cpl	a
 306  0004 e404          	and	a,(4,x)
 307  0006 e704          	ld	(4,x),a
 308                     ; 146   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 310  0008 7b07          	ld	a,(OFST+7,sp)
 311  000a 2a18          	jrpl	L341
 312                     ; 148     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 314  000c a510          	bcp	a,#16
 315  000e 2705          	jreq	L541
 316                     ; 150       GPIOx->ODR |= GPIO_Pin;
 318  0010 f6            	ld	a,(x)
 319  0011 1a06          	or	a,(OFST+6,sp)
 321  0013 2006          	jra	L741
 322  0015               L541:
 323                     ; 153       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 325  0015 1e01          	ldw	x,(OFST+1,sp)
 326  0017 7b06          	ld	a,(OFST+6,sp)
 327  0019 43            	cpl	a
 328  001a f4            	and	a,(x)
 329  001b               L741:
 330  001b f7            	ld	(x),a
 331                     ; 156     GPIOx->DDR |= GPIO_Pin;
 333  001c 1e01          	ldw	x,(OFST+1,sp)
 334  001e e602          	ld	a,(2,x)
 335  0020 1a06          	or	a,(OFST+6,sp)
 337  0022 2007          	jra	L151
 338  0024               L341:
 339                     ; 160     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 341  0024 1e01          	ldw	x,(OFST+1,sp)
 342  0026 7b06          	ld	a,(OFST+6,sp)
 343  0028 43            	cpl	a
 344  0029 e402          	and	a,(2,x)
 345  002b               L151:
 346  002b e702          	ld	(2,x),a
 347                     ; 167   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 349  002d 7b07          	ld	a,(OFST+7,sp)
 350  002f a540          	bcp	a,#64
 351  0031 2706          	jreq	L351
 352                     ; 169     GPIOx->CR1 |= GPIO_Pin;
 354  0033 e603          	ld	a,(3,x)
 355  0035 1a06          	or	a,(OFST+6,sp)
 357  0037 2005          	jra	L551
 358  0039               L351:
 359                     ; 172     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 361  0039 7b06          	ld	a,(OFST+6,sp)
 362  003b 43            	cpl	a
 363  003c e403          	and	a,(3,x)
 364  003e               L551:
 365  003e e703          	ld	(3,x),a
 366                     ; 179   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 368  0040 7b07          	ld	a,(OFST+7,sp)
 369  0042 a520          	bcp	a,#32
 370  0044 2706          	jreq	L751
 371                     ; 181     GPIOx->CR2 |= GPIO_Pin;
 373  0046 e604          	ld	a,(4,x)
 374  0048 1a06          	or	a,(OFST+6,sp)
 376  004a 2005          	jra	L161
 377  004c               L751:
 378                     ; 184     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 380  004c 7b06          	ld	a,(OFST+6,sp)
 381  004e 43            	cpl	a
 382  004f e404          	and	a,(4,x)
 383  0051               L161:
 384  0051 e704          	ld	(4,x),a
 385                     ; 187 }
 388  0053 85            	popw	x
 389  0054 87            	retf	
 463                     ; 206 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 463                     ; 207 {
 464                     .text:	section	.text,new
 465  0000               f_GPIO_ExternalPullUpConfig:
 467  0000 89            	pushw	x
 468       00000000      OFST:	set	0
 471                     ; 209   assert_param(IS_GPIO_PIN(GPIO_Pin));
 473                     ; 210   assert_param(IS_FUNCTIONAL_STATE(NewState));
 475                     ; 212   if (NewState != DISABLE) /* External Pull-Up Set*/
 477  0001 7b07          	ld	a,(OFST+7,sp)
 478  0003 2706          	jreq	L122
 479                     ; 214     GPIOx->CR1 |= GPIO_Pin;
 481  0005 e603          	ld	a,(3,x)
 482  0007 1a06          	or	a,(OFST+6,sp)
 484  0009 2007          	jra	L322
 485  000b               L122:
 486                     ; 217     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 488  000b 1e01          	ldw	x,(OFST+1,sp)
 489  000d 7b06          	ld	a,(OFST+6,sp)
 490  000f 43            	cpl	a
 491  0010 e403          	and	a,(3,x)
 492  0012               L322:
 493  0012 e703          	ld	(3,x),a
 494                     ; 219 }
 497  0014 85            	popw	x
 498  0015 87            	retf	
 541                     ; 245 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 541                     ; 246 {
 542                     .text:	section	.text,new
 543  0000               f_GPIO_Write:
 545  0000 89            	pushw	x
 546       00000000      OFST:	set	0
 549                     ; 247   GPIOx->ODR = GPIO_PortVal;
 551  0001 7b06          	ld	a,(OFST+6,sp)
 552  0003 1e01          	ldw	x,(OFST+1,sp)
 553  0005 f7            	ld	(x),a
 554                     ; 248 }
 557  0006 85            	popw	x
 558  0007 87            	retf	
 717                     ; 267 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 717                     ; 268 {
 718                     .text:	section	.text,new
 719  0000               f_GPIO_WriteBit:
 721  0000 89            	pushw	x
 722       00000000      OFST:	set	0
 725                     ; 270   assert_param(IS_GPIO_PIN(GPIO_Pin));
 727                     ; 271   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 729                     ; 273   if (GPIO_BitVal != RESET)
 731  0001 7b07          	ld	a,(OFST+7,sp)
 732  0003 2705          	jreq	L143
 733                     ; 275     GPIOx->ODR |= GPIO_Pin;
 735  0005 f6            	ld	a,(x)
 736  0006 1a06          	or	a,(OFST+6,sp)
 738  0008 2006          	jra	L343
 739  000a               L143:
 740                     ; 280     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 742  000a 1e01          	ldw	x,(OFST+1,sp)
 743  000c 7b06          	ld	a,(OFST+6,sp)
 744  000e 43            	cpl	a
 745  000f f4            	and	a,(x)
 746  0010               L343:
 747  0010 f7            	ld	(x),a
 748                     ; 282 }
 751  0011 85            	popw	x
 752  0012 87            	retf	
 795                     ; 300 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 795                     ; 301 {
 796                     .text:	section	.text,new
 797  0000               f_GPIO_SetBits:
 799  0000 89            	pushw	x
 800       00000000      OFST:	set	0
 803                     ; 302   GPIOx->ODR |= GPIO_Pin;
 805  0001 f6            	ld	a,(x)
 806  0002 1a06          	or	a,(OFST+6,sp)
 807  0004 f7            	ld	(x),a
 808                     ; 303 }
 811  0005 85            	popw	x
 812  0006 87            	retf	
 855                     ; 321 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 855                     ; 322 {
 856                     .text:	section	.text,new
 857  0000               f_GPIO_ResetBits:
 859  0000 89            	pushw	x
 860       00000000      OFST:	set	0
 863                     ; 323   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 865  0001 7b06          	ld	a,(OFST+6,sp)
 866  0003 43            	cpl	a
 867  0004 f4            	and	a,(x)
 868  0005 f7            	ld	(x),a
 869                     ; 324 }
 872  0006 85            	popw	x
 873  0007 87            	retf	
 916                     ; 333 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 916                     ; 334 {
 917                     .text:	section	.text,new
 918  0000               f_GPIO_ToggleBits:
 920  0000 89            	pushw	x
 921       00000000      OFST:	set	0
 924                     ; 335   GPIOx->ODR ^= GPIO_Pin;
 926  0001 f6            	ld	a,(x)
 927  0002 1806          	xor	a,(OFST+6,sp)
 928  0004 f7            	ld	(x),a
 929                     ; 336 }
 932  0005 85            	popw	x
 933  0006 87            	retf	
 969                     ; 344 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 969                     ; 345 {
 970                     .text:	section	.text,new
 971  0000               f_GPIO_ReadInputData:
 975                     ; 346   return ((uint8_t)GPIOx->IDR);
 977  0000 e601          	ld	a,(1,x)
 980  0002 87            	retf	
1017                     ; 355 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1017                     ; 356 {
1018                     .text:	section	.text,new
1019  0000               f_GPIO_ReadOutputData:
1023                     ; 357   return ((uint8_t)GPIOx->ODR);
1025  0000 f6            	ld	a,(x)
1028  0001 87            	retf	
1076                     ; 375 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1076                     ; 376 {
1077                     .text:	section	.text,new
1078  0000               f_GPIO_ReadInputDataBit:
1080  0000 89            	pushw	x
1081       00000000      OFST:	set	0
1084                     ; 377   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1086  0001 e601          	ld	a,(1,x)
1087  0003 1406          	and	a,(OFST+6,sp)
1090  0005 85            	popw	x
1091  0006 87            	retf	
1139                     ; 386 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1139                     ; 387 {
1140                     .text:	section	.text,new
1141  0000               f_GPIO_ReadOutputDataBit:
1143  0000 89            	pushw	x
1144       00000000      OFST:	set	0
1147                     ; 388   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1149  0001 f6            	ld	a,(x)
1150  0002 1406          	and	a,(OFST+6,sp)
1153  0004 85            	popw	x
1154  0005 87            	retf	
1166                     	xdef	f_GPIO_ReadOutputDataBit
1167                     	xdef	f_GPIO_ReadInputDataBit
1168                     	xdef	f_GPIO_ReadOutputData
1169                     	xdef	f_GPIO_ReadInputData
1170                     	xdef	f_GPIO_ToggleBits
1171                     	xdef	f_GPIO_ResetBits
1172                     	xdef	f_GPIO_SetBits
1173                     	xdef	f_GPIO_WriteBit
1174                     	xdef	f_GPIO_Write
1175                     	xdef	f_GPIO_ExternalPullUpConfig
1176                     	xdef	f_GPIO_Init
1177                     	xdef	f_GPIO_DeInit
1196                     	end
