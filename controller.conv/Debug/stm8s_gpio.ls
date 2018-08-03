   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
 110                     ; 47 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 110                     ; 48 {
 112                     	switch	.text
 113  0000               _GPIO_DeInit:
 117                     ; 49     GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 119  0000 7f            	clr	(x)
 120                     ; 50     GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 122  0001 6f02          	clr	(2,x)
 123                     ; 51     GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 125  0003 6f03          	clr	(3,x)
 126                     ; 52     GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 128  0005 6f04          	clr	(4,x)
 129                     ; 53 }
 132  0007 81            	ret
 372                     ; 65 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 372                     ; 66 {
 373                     	switch	.text
 374  0008               _GPIO_Init:
 376  0008 89            	pushw	x
 377       00000000      OFST:	set	0
 380                     ; 71     assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 382                     ; 72     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 384                     ; 75   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 386  0009 7b05          	ld	a,(OFST+5,sp)
 387  000b 43            	cpl	a
 388  000c e404          	and	a,(4,x)
 389  000e e704          	ld	(4,x),a
 390                     ; 81     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 392  0010 7b06          	ld	a,(OFST+6,sp)
 393  0012 a580          	bcp	a,#128
 394  0014 271d          	jreq	L771
 395                     ; 83         if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 397  0016 7b06          	ld	a,(OFST+6,sp)
 398  0018 a510          	bcp	a,#16
 399  001a 2706          	jreq	L102
 400                     ; 85             GPIOx->ODR |= (uint8_t)GPIO_Pin;
 402  001c f6            	ld	a,(x)
 403  001d 1a05          	or	a,(OFST+5,sp)
 404  001f f7            	ld	(x),a
 406  0020 2007          	jra	L302
 407  0022               L102:
 408                     ; 89             GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 410  0022 1e01          	ldw	x,(OFST+1,sp)
 411  0024 7b05          	ld	a,(OFST+5,sp)
 412  0026 43            	cpl	a
 413  0027 f4            	and	a,(x)
 414  0028 f7            	ld	(x),a
 415  0029               L302:
 416                     ; 92         GPIOx->DDR |= (uint8_t)GPIO_Pin;
 418  0029 1e01          	ldw	x,(OFST+1,sp)
 419  002b e602          	ld	a,(2,x)
 420  002d 1a05          	or	a,(OFST+5,sp)
 421  002f e702          	ld	(2,x),a
 423  0031 2009          	jra	L502
 424  0033               L771:
 425                     ; 97         GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 427  0033 1e01          	ldw	x,(OFST+1,sp)
 428  0035 7b05          	ld	a,(OFST+5,sp)
 429  0037 43            	cpl	a
 430  0038 e402          	and	a,(2,x)
 431  003a e702          	ld	(2,x),a
 432  003c               L502:
 433                     ; 104     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 435  003c 7b06          	ld	a,(OFST+6,sp)
 436  003e a540          	bcp	a,#64
 437  0040 270a          	jreq	L702
 438                     ; 106         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 440  0042 1e01          	ldw	x,(OFST+1,sp)
 441  0044 e603          	ld	a,(3,x)
 442  0046 1a05          	or	a,(OFST+5,sp)
 443  0048 e703          	ld	(3,x),a
 445  004a 2009          	jra	L112
 446  004c               L702:
 447                     ; 110         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 449  004c 1e01          	ldw	x,(OFST+1,sp)
 450  004e 7b05          	ld	a,(OFST+5,sp)
 451  0050 43            	cpl	a
 452  0051 e403          	and	a,(3,x)
 453  0053 e703          	ld	(3,x),a
 454  0055               L112:
 455                     ; 117     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 457  0055 7b06          	ld	a,(OFST+6,sp)
 458  0057 a520          	bcp	a,#32
 459  0059 270a          	jreq	L312
 460                     ; 119         GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 462  005b 1e01          	ldw	x,(OFST+1,sp)
 463  005d e604          	ld	a,(4,x)
 464  005f 1a05          	or	a,(OFST+5,sp)
 465  0061 e704          	ld	(4,x),a
 467  0063 2009          	jra	L512
 468  0065               L312:
 469                     ; 123         GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 471  0065 1e01          	ldw	x,(OFST+1,sp)
 472  0067 7b05          	ld	a,(OFST+5,sp)
 473  0069 43            	cpl	a
 474  006a e404          	and	a,(4,x)
 475  006c e704          	ld	(4,x),a
 476  006e               L512:
 477                     ; 125 }
 480  006e 85            	popw	x
 481  006f 81            	ret
 527                     ; 135 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 527                     ; 136 {
 528                     	switch	.text
 529  0070               _GPIO_Write:
 531  0070 89            	pushw	x
 532       00000000      OFST:	set	0
 535                     ; 137     GPIOx->ODR = PortVal;
 537  0071 7b05          	ld	a,(OFST+5,sp)
 538  0073 1e01          	ldw	x,(OFST+1,sp)
 539  0075 f7            	ld	(x),a
 540                     ; 138 }
 543  0076 85            	popw	x
 544  0077 81            	ret
 591                     ; 148 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 591                     ; 149 {
 592                     	switch	.text
 593  0078               _GPIO_WriteHigh:
 595  0078 89            	pushw	x
 596       00000000      OFST:	set	0
 599                     ; 150     GPIOx->ODR |= (uint8_t)PortPins;
 601  0079 f6            	ld	a,(x)
 602  007a 1a05          	or	a,(OFST+5,sp)
 603  007c f7            	ld	(x),a
 604                     ; 151 }
 607  007d 85            	popw	x
 608  007e 81            	ret
 655                     ; 161 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 655                     ; 162 {
 656                     	switch	.text
 657  007f               _GPIO_WriteLow:
 659  007f 89            	pushw	x
 660       00000000      OFST:	set	0
 663                     ; 163     GPIOx->ODR &= (uint8_t)(~PortPins);
 665  0080 7b05          	ld	a,(OFST+5,sp)
 666  0082 43            	cpl	a
 667  0083 f4            	and	a,(x)
 668  0084 f7            	ld	(x),a
 669                     ; 164 }
 672  0085 85            	popw	x
 673  0086 81            	ret
 720                     ; 174 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 720                     ; 175 {
 721                     	switch	.text
 722  0087               _GPIO_WriteReverse:
 724  0087 89            	pushw	x
 725       00000000      OFST:	set	0
 728                     ; 176     GPIOx->ODR ^= (uint8_t)PortPins;
 730  0088 f6            	ld	a,(x)
 731  0089 1805          	xor	a,	(OFST+5,sp)
 732  008b f7            	ld	(x),a
 733                     ; 177 }
 736  008c 85            	popw	x
 737  008d 81            	ret
 775                     ; 185 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 775                     ; 186 {
 776                     	switch	.text
 777  008e               _GPIO_ReadOutputData:
 781                     ; 187     return ((uint8_t)GPIOx->ODR);
 783  008e f6            	ld	a,(x)
 786  008f 81            	ret
 823                     ; 196 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 823                     ; 197 {
 824                     	switch	.text
 825  0090               _GPIO_ReadInputData:
 829                     ; 198     return ((uint8_t)GPIOx->IDR);
 831  0090 e601          	ld	a,(1,x)
 834  0092 81            	ret
 902                     ; 207 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 902                     ; 208 {
 903                     	switch	.text
 904  0093               _GPIO_ReadInputPin:
 906  0093 89            	pushw	x
 907       00000000      OFST:	set	0
 910                     ; 209     return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 912  0094 e601          	ld	a,(1,x)
 913  0096 1405          	and	a,(OFST+5,sp)
 916  0098 85            	popw	x
 917  0099 81            	ret
 995                     ; 219 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 995                     ; 220 {
 996                     	switch	.text
 997  009a               _GPIO_ExternalPullUpConfig:
 999  009a 89            	pushw	x
1000       00000000      OFST:	set	0
1003                     ; 222     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1005                     ; 223     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1007                     ; 225     if (NewState != DISABLE) /* External Pull-Up Set*/
1009  009b 0d06          	tnz	(OFST+6,sp)
1010  009d 2708          	jreq	L374
1011                     ; 227         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1013  009f e603          	ld	a,(3,x)
1014  00a1 1a05          	or	a,(OFST+5,sp)
1015  00a3 e703          	ld	(3,x),a
1017  00a5 2009          	jra	L574
1018  00a7               L374:
1019                     ; 230         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1021  00a7 1e01          	ldw	x,(OFST+1,sp)
1022  00a9 7b05          	ld	a,(OFST+5,sp)
1023  00ab 43            	cpl	a
1024  00ac e403          	and	a,(3,x)
1025  00ae e703          	ld	(3,x),a
1026  00b0               L574:
1027                     ; 232 }
1030  00b0 85            	popw	x
1031  00b1 81            	ret
1044                     	xdef	_GPIO_ExternalPullUpConfig
1045                     	xdef	_GPIO_ReadInputPin
1046                     	xdef	_GPIO_ReadOutputData
1047                     	xdef	_GPIO_ReadInputData
1048                     	xdef	_GPIO_WriteReverse
1049                     	xdef	_GPIO_WriteLow
1050                     	xdef	_GPIO_WriteHigh
1051                     	xdef	_GPIO_Write
1052                     	xdef	_GPIO_Init
1053                     	xdef	_GPIO_DeInit
1072                     	end
