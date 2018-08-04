   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 115                     ; 93 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 115                     ; 94 {
 117                     	switch	.text
 118  0000               _GPIO_DeInit:
 122                     ; 95   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 124  0000 6f04          	clr	(4,x)
 125                     ; 96   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 127  0002 7f            	clr	(x)
 128                     ; 97   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 130  0003 6f02          	clr	(2,x)
 131                     ; 98   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 133  0005 6f03          	clr	(3,x)
 134                     ; 99 }
 137  0007 81            	ret	
 291                     ; 130 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 291                     ; 131 {
 292                     	switch	.text
 293  0008               _GPIO_Init:
 295  0008 89            	pushw	x
 296       00000000      OFST:	set	0
 299                     ; 136   assert_param(IS_GPIO_MODE(GPIO_Mode));
 301                     ; 137   assert_param(IS_GPIO_PIN(GPIO_Pin));
 303                     ; 140   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 305  0009 7b05          	ld	a,(OFST+5,sp)
 306  000b 43            	cpl	a
 307  000c e404          	and	a,(4,x)
 308  000e e704          	ld	(4,x),a
 309                     ; 146   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 311  0010 7b06          	ld	a,(OFST+6,sp)
 312  0012 2a18          	jrpl	L341
 313                     ; 148     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 315  0014 a510          	bcp	a,#16
 316  0016 2705          	jreq	L541
 317                     ; 150       GPIOx->ODR |= GPIO_Pin;
 319  0018 f6            	ld	a,(x)
 320  0019 1a05          	or	a,(OFST+5,sp)
 322  001b 2006          	jra	L741
 323  001d               L541:
 324                     ; 153       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 326  001d 1e01          	ldw	x,(OFST+1,sp)
 327  001f 7b05          	ld	a,(OFST+5,sp)
 328  0021 43            	cpl	a
 329  0022 f4            	and	a,(x)
 330  0023               L741:
 331  0023 f7            	ld	(x),a
 332                     ; 156     GPIOx->DDR |= GPIO_Pin;
 334  0024 1e01          	ldw	x,(OFST+1,sp)
 335  0026 e602          	ld	a,(2,x)
 336  0028 1a05          	or	a,(OFST+5,sp)
 338  002a 2007          	jra	L151
 339  002c               L341:
 340                     ; 160     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 342  002c 1e01          	ldw	x,(OFST+1,sp)
 343  002e 7b05          	ld	a,(OFST+5,sp)
 344  0030 43            	cpl	a
 345  0031 e402          	and	a,(2,x)
 346  0033               L151:
 347  0033 e702          	ld	(2,x),a
 348                     ; 167   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 350  0035 7b06          	ld	a,(OFST+6,sp)
 351  0037 a540          	bcp	a,#64
 352  0039 2706          	jreq	L351
 353                     ; 169     GPIOx->CR1 |= GPIO_Pin;
 355  003b e603          	ld	a,(3,x)
 356  003d 1a05          	or	a,(OFST+5,sp)
 358  003f 2005          	jra	L551
 359  0041               L351:
 360                     ; 172     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 362  0041 7b05          	ld	a,(OFST+5,sp)
 363  0043 43            	cpl	a
 364  0044 e403          	and	a,(3,x)
 365  0046               L551:
 366  0046 e703          	ld	(3,x),a
 367                     ; 179   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 369  0048 7b06          	ld	a,(OFST+6,sp)
 370  004a a520          	bcp	a,#32
 371  004c 2706          	jreq	L751
 372                     ; 181     GPIOx->CR2 |= GPIO_Pin;
 374  004e e604          	ld	a,(4,x)
 375  0050 1a05          	or	a,(OFST+5,sp)
 377  0052 2005          	jra	L161
 378  0054               L751:
 379                     ; 184     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 381  0054 7b05          	ld	a,(OFST+5,sp)
 382  0056 43            	cpl	a
 383  0057 e404          	and	a,(4,x)
 384  0059               L161:
 385  0059 e704          	ld	(4,x),a
 386                     ; 187 }
 389  005b 85            	popw	x
 390  005c 81            	ret	
 465                     ; 206 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 465                     ; 207 {
 466                     	switch	.text
 467  005d               _GPIO_ExternalPullUpConfig:
 469  005d 89            	pushw	x
 470       00000000      OFST:	set	0
 473                     ; 209   assert_param(IS_GPIO_PIN(GPIO_Pin));
 475                     ; 210   assert_param(IS_FUNCTIONAL_STATE(NewState));
 477                     ; 212   if (NewState != DISABLE) /* External Pull-Up Set*/
 479  005e 7b06          	ld	a,(OFST+6,sp)
 480  0060 2706          	jreq	L122
 481                     ; 214     GPIOx->CR1 |= GPIO_Pin;
 483  0062 e603          	ld	a,(3,x)
 484  0064 1a05          	or	a,(OFST+5,sp)
 486  0066 2007          	jra	L322
 487  0068               L122:
 488                     ; 217     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 490  0068 1e01          	ldw	x,(OFST+1,sp)
 491  006a 7b05          	ld	a,(OFST+5,sp)
 492  006c 43            	cpl	a
 493  006d e403          	and	a,(3,x)
 494  006f               L322:
 495  006f e703          	ld	(3,x),a
 496                     ; 219 }
 499  0071 85            	popw	x
 500  0072 81            	ret	
 544                     ; 245 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 544                     ; 246 {
 545                     	switch	.text
 546  0073               _GPIO_Write:
 548  0073 89            	pushw	x
 549       00000000      OFST:	set	0
 552                     ; 247   GPIOx->ODR = GPIO_PortVal;
 554  0074 7b05          	ld	a,(OFST+5,sp)
 555  0076 1e01          	ldw	x,(OFST+1,sp)
 556  0078 f7            	ld	(x),a
 557                     ; 248 }
 560  0079 85            	popw	x
 561  007a 81            	ret	
 721                     ; 267 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 721                     ; 268 {
 722                     	switch	.text
 723  007b               _GPIO_WriteBit:
 725  007b 89            	pushw	x
 726       00000000      OFST:	set	0
 729                     ; 270   assert_param(IS_GPIO_PIN(GPIO_Pin));
 731                     ; 271   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 733                     ; 273   if (GPIO_BitVal != RESET)
 735  007c 7b06          	ld	a,(OFST+6,sp)
 736  007e 2705          	jreq	L143
 737                     ; 275     GPIOx->ODR |= GPIO_Pin;
 739  0080 f6            	ld	a,(x)
 740  0081 1a05          	or	a,(OFST+5,sp)
 742  0083 2006          	jra	L343
 743  0085               L143:
 744                     ; 280     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 746  0085 1e01          	ldw	x,(OFST+1,sp)
 747  0087 7b05          	ld	a,(OFST+5,sp)
 748  0089 43            	cpl	a
 749  008a f4            	and	a,(x)
 750  008b               L343:
 751  008b f7            	ld	(x),a
 752                     ; 282 }
 755  008c 85            	popw	x
 756  008d 81            	ret	
 800                     ; 300 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 800                     ; 301 {
 801                     	switch	.text
 802  008e               _GPIO_SetBits:
 804  008e 89            	pushw	x
 805       00000000      OFST:	set	0
 808                     ; 302   GPIOx->ODR |= GPIO_Pin;
 810  008f f6            	ld	a,(x)
 811  0090 1a05          	or	a,(OFST+5,sp)
 812  0092 f7            	ld	(x),a
 813                     ; 303 }
 816  0093 85            	popw	x
 817  0094 81            	ret	
 861                     ; 321 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 861                     ; 322 {
 862                     	switch	.text
 863  0095               _GPIO_ResetBits:
 865  0095 89            	pushw	x
 866       00000000      OFST:	set	0
 869                     ; 323   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 871  0096 7b05          	ld	a,(OFST+5,sp)
 872  0098 43            	cpl	a
 873  0099 f4            	and	a,(x)
 874  009a f7            	ld	(x),a
 875                     ; 324 }
 878  009b 85            	popw	x
 879  009c 81            	ret	
 923                     ; 333 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 923                     ; 334 {
 924                     	switch	.text
 925  009d               _GPIO_ToggleBits:
 927  009d 89            	pushw	x
 928       00000000      OFST:	set	0
 931                     ; 335   GPIOx->ODR ^= GPIO_Pin;
 933  009e f6            	ld	a,(x)
 934  009f 1805          	xor	a,(OFST+5,sp)
 935  00a1 f7            	ld	(x),a
 936                     ; 336 }
 939  00a2 85            	popw	x
 940  00a3 81            	ret	
 977                     ; 344 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 977                     ; 345 {
 978                     	switch	.text
 979  00a4               _GPIO_ReadInputData:
 983                     ; 346   return ((uint8_t)GPIOx->IDR);
 985  00a4 e601          	ld	a,(1,x)
 988  00a6 81            	ret	
1026                     ; 355 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1026                     ; 356 {
1027                     	switch	.text
1028  00a7               _GPIO_ReadOutputData:
1032                     ; 357   return ((uint8_t)GPIOx->ODR);
1034  00a7 f6            	ld	a,(x)
1037  00a8 81            	ret	
1086                     ; 375 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1086                     ; 376 {
1087                     	switch	.text
1088  00a9               _GPIO_ReadInputDataBit:
1090  00a9 89            	pushw	x
1091       00000000      OFST:	set	0
1094                     ; 377   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1096  00aa e601          	ld	a,(1,x)
1097  00ac 1405          	and	a,(OFST+5,sp)
1100  00ae 85            	popw	x
1101  00af 81            	ret	
1150                     ; 386 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1150                     ; 387 {
1151                     	switch	.text
1152  00b0               _GPIO_ReadOutputDataBit:
1154  00b0 89            	pushw	x
1155       00000000      OFST:	set	0
1158                     ; 388   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1160  00b1 f6            	ld	a,(x)
1161  00b2 1405          	and	a,(OFST+5,sp)
1164  00b4 85            	popw	x
1165  00b5 81            	ret	
1178                     	xdef	_GPIO_ReadOutputDataBit
1179                     	xdef	_GPIO_ReadInputDataBit
1180                     	xdef	_GPIO_ReadOutputData
1181                     	xdef	_GPIO_ReadInputData
1182                     	xdef	_GPIO_ToggleBits
1183                     	xdef	_GPIO_ResetBits
1184                     	xdef	_GPIO_SetBits
1185                     	xdef	_GPIO_WriteBit
1186                     	xdef	_GPIO_Write
1187                     	xdef	_GPIO_ExternalPullUpConfig
1188                     	xdef	_GPIO_Init
1189                     	xdef	_GPIO_DeInit
1208                     	end
