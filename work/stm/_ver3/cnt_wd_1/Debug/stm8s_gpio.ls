   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 117                     ; 47 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 117                     ; 48 {
 119                     .text:	section	.text,new
 120  0000               _GPIO_DeInit:
 124                     ; 49     GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 126  0000 7f            	clr	(x)
 127                     ; 50     GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 129  0001 6f02          	clr	(2,x)
 130                     ; 51     GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 132  0003 6f03          	clr	(3,x)
 133                     ; 52     GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 135  0005 6f04          	clr	(4,x)
 136                     ; 53 }
 139  0007 81            	ret	
 379                     ; 65 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 379                     ; 66 {
 380                     .text:	section	.text,new
 381  0000               _GPIO_Init:
 383  0000 89            	pushw	x
 384       00000000      OFST:	set	0
 387                     ; 71     assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 389                     ; 72     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 391                     ; 75   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 393  0001 7b05          	ld	a,(OFST+5,sp)
 394  0003 43            	cpl	a
 395  0004 e404          	and	a,(4,x)
 396  0006 e704          	ld	(4,x),a
 397                     ; 81     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 399  0008 7b06          	ld	a,(OFST+6,sp)
 400  000a 2a18          	jrpl	L771
 401                     ; 83         if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 403  000c a510          	bcp	a,#16
 404  000e 2705          	jreq	L102
 405                     ; 85             GPIOx->ODR |= (uint8_t)GPIO_Pin;
 407  0010 f6            	ld	a,(x)
 408  0011 1a05          	or	a,(OFST+5,sp)
 410  0013 2006          	jra	L302
 411  0015               L102:
 412                     ; 89             GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 414  0015 1e01          	ldw	x,(OFST+1,sp)
 415  0017 7b05          	ld	a,(OFST+5,sp)
 416  0019 43            	cpl	a
 417  001a f4            	and	a,(x)
 418  001b               L302:
 419  001b f7            	ld	(x),a
 420                     ; 92         GPIOx->DDR |= (uint8_t)GPIO_Pin;
 422  001c 1e01          	ldw	x,(OFST+1,sp)
 423  001e e602          	ld	a,(2,x)
 424  0020 1a05          	or	a,(OFST+5,sp)
 426  0022 2007          	jra	L502
 427  0024               L771:
 428                     ; 97         GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 430  0024 1e01          	ldw	x,(OFST+1,sp)
 431  0026 7b05          	ld	a,(OFST+5,sp)
 432  0028 43            	cpl	a
 433  0029 e402          	and	a,(2,x)
 434  002b               L502:
 435  002b e702          	ld	(2,x),a
 436                     ; 104     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 438  002d 7b06          	ld	a,(OFST+6,sp)
 439  002f a540          	bcp	a,#64
 440  0031 2706          	jreq	L702
 441                     ; 106         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 443  0033 e603          	ld	a,(3,x)
 444  0035 1a05          	or	a,(OFST+5,sp)
 446  0037 2005          	jra	L112
 447  0039               L702:
 448                     ; 110         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 450  0039 7b05          	ld	a,(OFST+5,sp)
 451  003b 43            	cpl	a
 452  003c e403          	and	a,(3,x)
 453  003e               L112:
 454  003e e703          	ld	(3,x),a
 455                     ; 117     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 457  0040 7b06          	ld	a,(OFST+6,sp)
 458  0042 a520          	bcp	a,#32
 459  0044 2706          	jreq	L312
 460                     ; 119         GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 462  0046 e604          	ld	a,(4,x)
 463  0048 1a05          	or	a,(OFST+5,sp)
 465  004a 2005          	jra	L512
 466  004c               L312:
 467                     ; 123         GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 469  004c 7b05          	ld	a,(OFST+5,sp)
 470  004e 43            	cpl	a
 471  004f e404          	and	a,(4,x)
 472  0051               L512:
 473  0051 e704          	ld	(4,x),a
 474                     ; 125 }
 477  0053 85            	popw	x
 478  0054 81            	ret	
 522                     ; 135 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 522                     ; 136 {
 523                     .text:	section	.text,new
 524  0000               _GPIO_Write:
 526  0000 89            	pushw	x
 527       00000000      OFST:	set	0
 530                     ; 137     GPIOx->ODR = PortVal;
 532  0001 7b05          	ld	a,(OFST+5,sp)
 533  0003 1e01          	ldw	x,(OFST+1,sp)
 534  0005 f7            	ld	(x),a
 535                     ; 138 }
 538  0006 85            	popw	x
 539  0007 81            	ret	
 586                     ; 148 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 586                     ; 149 {
 587                     .text:	section	.text,new
 588  0000               _GPIO_WriteHigh:
 590  0000 89            	pushw	x
 591       00000000      OFST:	set	0
 594                     ; 150     GPIOx->ODR |= (uint8_t)PortPins;
 596  0001 f6            	ld	a,(x)
 597  0002 1a05          	or	a,(OFST+5,sp)
 598  0004 f7            	ld	(x),a
 599                     ; 151 }
 602  0005 85            	popw	x
 603  0006 81            	ret	
 650                     ; 161 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 650                     ; 162 {
 651                     .text:	section	.text,new
 652  0000               _GPIO_WriteLow:
 654  0000 89            	pushw	x
 655       00000000      OFST:	set	0
 658                     ; 163     GPIOx->ODR &= (uint8_t)(~PortPins);
 660  0001 7b05          	ld	a,(OFST+5,sp)
 661  0003 43            	cpl	a
 662  0004 f4            	and	a,(x)
 663  0005 f7            	ld	(x),a
 664                     ; 164 }
 667  0006 85            	popw	x
 668  0007 81            	ret	
 715                     ; 174 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 715                     ; 175 {
 716                     .text:	section	.text,new
 717  0000               _GPIO_WriteReverse:
 719  0000 89            	pushw	x
 720       00000000      OFST:	set	0
 723                     ; 176     GPIOx->ODR ^= (uint8_t)PortPins;
 725  0001 f6            	ld	a,(x)
 726  0002 1805          	xor	a,(OFST+5,sp)
 727  0004 f7            	ld	(x),a
 728                     ; 177 }
 731  0005 85            	popw	x
 732  0006 81            	ret	
 770                     ; 185 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 770                     ; 186 {
 771                     .text:	section	.text,new
 772  0000               _GPIO_ReadOutputData:
 776                     ; 187     return ((uint8_t)GPIOx->ODR);
 778  0000 f6            	ld	a,(x)
 781  0001 81            	ret	
 818                     ; 196 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 818                     ; 197 {
 819                     .text:	section	.text,new
 820  0000               _GPIO_ReadInputData:
 824                     ; 198     return ((uint8_t)GPIOx->IDR);
 826  0000 e601          	ld	a,(1,x)
 829  0002 81            	ret	
 897                     ; 207 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 897                     ; 208 {
 898                     .text:	section	.text,new
 899  0000               _GPIO_ReadInputPin:
 901  0000 89            	pushw	x
 902       00000000      OFST:	set	0
 905                     ; 209     return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 907  0001 e601          	ld	a,(1,x)
 908  0003 1405          	and	a,(OFST+5,sp)
 911  0005 85            	popw	x
 912  0006 81            	ret	
 990                     ; 219 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 990                     ; 220 {
 991                     .text:	section	.text,new
 992  0000               _GPIO_ExternalPullUpConfig:
 994  0000 89            	pushw	x
 995       00000000      OFST:	set	0
 998                     ; 222     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1000                     ; 223     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1002                     ; 225     if (NewState != DISABLE) /* External Pull-Up Set*/
1004  0001 7b06          	ld	a,(OFST+6,sp)
1005  0003 2706          	jreq	L174
1006                     ; 227         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1008  0005 e603          	ld	a,(3,x)
1009  0007 1a05          	or	a,(OFST+5,sp)
1011  0009 2007          	jra	L374
1012  000b               L174:
1013                     ; 230         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1015  000b 1e01          	ldw	x,(OFST+1,sp)
1016  000d 7b05          	ld	a,(OFST+5,sp)
1017  000f 43            	cpl	a
1018  0010 e403          	and	a,(3,x)
1019  0012               L374:
1020  0012 e703          	ld	(3,x),a
1021                     ; 232 }
1024  0014 85            	popw	x
1025  0015 81            	ret	
1038                     	xdef	_GPIO_ExternalPullUpConfig
1039                     	xdef	_GPIO_ReadInputPin
1040                     	xdef	_GPIO_ReadOutputData
1041                     	xdef	_GPIO_ReadInputData
1042                     	xdef	_GPIO_WriteReverse
1043                     	xdef	_GPIO_WriteLow
1044                     	xdef	_GPIO_WriteHigh
1045                     	xdef	_GPIO_Write
1046                     	xdef	_GPIO_Init
1047                     	xdef	_GPIO_DeInit
1066                     	end
