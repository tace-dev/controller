   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
 114                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 114                     ; 54 {
 116                     	switch	.text
 117  0000               _GPIO_DeInit:
 121                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 123  0000 7f            	clr	(x)
 124                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 126  0001 6f02          	clr	(2,x)
 127                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 129  0003 6f03          	clr	(3,x)
 130                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 132  0005 6f04          	clr	(4,x)
 133                     ; 59 }
 136  0007 81            	ret	
 377                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 377                     ; 72 {
 378                     	switch	.text
 379  0008               _GPIO_Init:
 381  0008 89            	pushw	x
 382       00000000      OFST:	set	0
 385                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 387  0009 7b06          	ld	a,(OFST+6,sp)
 388  000b 2731          	jreq	L41
 389  000d a140          	cp	a,#64
 390  000f 272d          	jreq	L41
 391  0011 a120          	cp	a,#32
 392  0013 2729          	jreq	L41
 393  0015 a160          	cp	a,#96
 394  0017 2725          	jreq	L41
 395  0019 a1a0          	cp	a,#160
 396  001b 2721          	jreq	L41
 397  001d a1e0          	cp	a,#224
 398  001f 271d          	jreq	L41
 399  0021 a180          	cp	a,#128
 400  0023 2719          	jreq	L41
 401  0025 a1c0          	cp	a,#192
 402  0027 2715          	jreq	L41
 403  0029 a1b0          	cp	a,#176
 404  002b 2711          	jreq	L41
 405  002d a1f0          	cp	a,#240
 406  002f 270d          	jreq	L41
 407  0031 a190          	cp	a,#144
 408  0033 2709          	jreq	L41
 409  0035 a1d0          	cp	a,#208
 410  0037 2705          	jreq	L41
 411  0039 ae004d        	ldw	x,#77
 412  003c ad5d          	call	LC001
 413  003e               L41:
 414                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 416  003e 7b05          	ld	a,(OFST+5,sp)
 417  0040 2607          	jrne	L22
 418  0042 ae004e        	ldw	x,#78
 419  0045 ad54          	call	LC001
 420  0047 7b05          	ld	a,(OFST+5,sp)
 421  0049               L22:
 422                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 424  0049 1e01          	ldw	x,(OFST+1,sp)
 425  004b 43            	cpl	a
 426  004c e404          	and	a,(4,x)
 427  004e e704          	ld	(4,x),a
 428                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 430  0050 7b06          	ld	a,(OFST+6,sp)
 431  0052 2a14          	jrpl	L102
 432                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 434  0054 a510          	bcp	a,#16
 435  0056 2705          	jreq	L302
 436                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 438  0058 f6            	ld	a,(x)
 439  0059 1a05          	or	a,(OFST+5,sp)
 441  005b 2004          	jra	L502
 442  005d               L302:
 443                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 445  005d 7b05          	ld	a,(OFST+5,sp)
 446  005f 43            	cpl	a
 447  0060 f4            	and	a,(x)
 448  0061               L502:
 449  0061 f7            	ld	(x),a
 450                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 452  0062 e602          	ld	a,(2,x)
 453  0064 1a05          	or	a,(OFST+5,sp)
 455  0066 2005          	jra	L702
 456  0068               L102:
 457                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 459  0068 7b05          	ld	a,(OFST+5,sp)
 460  006a 43            	cpl	a
 461  006b e402          	and	a,(2,x)
 462  006d               L702:
 463  006d e702          	ld	(2,x),a
 464                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 466  006f 7b06          	ld	a,(OFST+6,sp)
 467  0071 a540          	bcp	a,#64
 468  0073 2706          	jreq	L112
 469                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 471  0075 e603          	ld	a,(3,x)
 472  0077 1a05          	or	a,(OFST+5,sp)
 474  0079 2005          	jra	L312
 475  007b               L112:
 476                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 478  007b 7b05          	ld	a,(OFST+5,sp)
 479  007d 43            	cpl	a
 480  007e e403          	and	a,(3,x)
 481  0080               L312:
 482  0080 e703          	ld	(3,x),a
 483                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 485  0082 7b06          	ld	a,(OFST+6,sp)
 486  0084 a520          	bcp	a,#32
 487  0086 2708          	jreq	L512
 488                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 490  0088 1e01          	ldw	x,(OFST+1,sp)
 491  008a e604          	ld	a,(4,x)
 492  008c 1a05          	or	a,(OFST+5,sp)
 494  008e 2007          	jra	L712
 495  0090               L512:
 496                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 498  0090 1e01          	ldw	x,(OFST+1,sp)
 499  0092 7b05          	ld	a,(OFST+5,sp)
 500  0094 43            	cpl	a
 501  0095 e404          	and	a,(4,x)
 502  0097               L712:
 503  0097 e704          	ld	(4,x),a
 504                     ; 131 }
 507  0099 85            	popw	x
 508  009a 81            	ret	
 509  009b               LC001:
 510  009b 89            	pushw	x
 511  009c 5f            	clrw	x
 512  009d 89            	pushw	x
 513  009e ae0000        	ldw	x,#L771
 514  00a1 cd0000        	call	_assert_failed
 516  00a4 5b04          	addw	sp,#4
 517  00a6 81            	ret	
 563                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 563                     ; 142 {
 564                     	switch	.text
 565  00a7               _GPIO_Write:
 567  00a7 89            	pushw	x
 568       00000000      OFST:	set	0
 571                     ; 143   GPIOx->ODR = PortVal;
 573  00a8 7b05          	ld	a,(OFST+5,sp)
 574  00aa f7            	ld	(x),a
 575                     ; 144 }
 578  00ab 85            	popw	x
 579  00ac 81            	ret	
 626                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 626                     ; 155 {
 627                     	switch	.text
 628  00ad               _GPIO_WriteHigh:
 630  00ad 89            	pushw	x
 631       00000000      OFST:	set	0
 634                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 636  00ae f6            	ld	a,(x)
 637  00af 1a05          	or	a,(OFST+5,sp)
 638  00b1 f7            	ld	(x),a
 639                     ; 157 }
 642  00b2 85            	popw	x
 643  00b3 81            	ret	
 690                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 690                     ; 168 {
 691                     	switch	.text
 692  00b4               _GPIO_WriteLow:
 694  00b4 89            	pushw	x
 695       00000000      OFST:	set	0
 698                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 700  00b5 7b05          	ld	a,(OFST+5,sp)
 701  00b7 43            	cpl	a
 702  00b8 f4            	and	a,(x)
 703  00b9 f7            	ld	(x),a
 704                     ; 170 }
 707  00ba 85            	popw	x
 708  00bb 81            	ret	
 755                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 755                     ; 181 {
 756                     	switch	.text
 757  00bc               _GPIO_WriteReverse:
 759  00bc 89            	pushw	x
 760       00000000      OFST:	set	0
 763                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 765  00bd f6            	ld	a,(x)
 766  00be 1805          	xor	a,(OFST+5,sp)
 767  00c0 f7            	ld	(x),a
 768                     ; 183 }
 771  00c1 85            	popw	x
 772  00c2 81            	ret	
 810                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 810                     ; 192 {
 811                     	switch	.text
 812  00c3               _GPIO_ReadOutputData:
 816                     ; 193   return ((uint8_t)GPIOx->ODR);
 818  00c3 f6            	ld	a,(x)
 821  00c4 81            	ret	
 858                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 858                     ; 203 {
 859                     	switch	.text
 860  00c5               _GPIO_ReadInputData:
 864                     ; 204   return ((uint8_t)GPIOx->IDR);
 866  00c5 e601          	ld	a,(1,x)
 869  00c7 81            	ret	
 937                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 937                     ; 214 {
 938                     	switch	.text
 939  00c8               _GPIO_ReadInputPin:
 941  00c8 89            	pushw	x
 942       00000000      OFST:	set	0
 945                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 947  00c9 e601          	ld	a,(1,x)
 948  00cb 1405          	and	a,(OFST+5,sp)
 951  00cd 85            	popw	x
 952  00ce 81            	ret	
1031                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
1031                     ; 226 {
1032                     	switch	.text
1033  00cf               _GPIO_ExternalPullUpConfig:
1035  00cf 89            	pushw	x
1036       00000000      OFST:	set	0
1039                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1041  00d0 7b05          	ld	a,(OFST+5,sp)
1042  00d2 2605          	jrne	L05
1043  00d4 ae00e4        	ldw	x,#228
1044  00d7 ad23          	call	LC002
1045  00d9               L05:
1046                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1048  00d9 7b06          	ld	a,(OFST+6,sp)
1049  00db 2708          	jreq	L06
1050  00dd 4a            	dec	a
1051  00de 2705          	jreq	L06
1052  00e0 ae00e5        	ldw	x,#229
1053  00e3 ad17          	call	LC002
1054  00e5               L06:
1055                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1057  00e5 7b06          	ld	a,(OFST+6,sp)
1058  00e7 2708          	jreq	L574
1059                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1061  00e9 1e01          	ldw	x,(OFST+1,sp)
1062  00eb e603          	ld	a,(3,x)
1063  00ed 1a05          	or	a,(OFST+5,sp)
1065  00ef 2007          	jra	L774
1066  00f1               L574:
1067                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1069  00f1 1e01          	ldw	x,(OFST+1,sp)
1070  00f3 7b05          	ld	a,(OFST+5,sp)
1071  00f5 43            	cpl	a
1072  00f6 e403          	and	a,(3,x)
1073  00f8               L774:
1074  00f8 e703          	ld	(3,x),a
1075                     ; 238 }
1078  00fa 85            	popw	x
1079  00fb 81            	ret	
1080  00fc               LC002:
1081  00fc 89            	pushw	x
1082  00fd 5f            	clrw	x
1083  00fe 89            	pushw	x
1084  00ff ae0000        	ldw	x,#L771
1085  0102 cd0000        	call	_assert_failed
1087  0105 5b04          	addw	sp,#4
1088  0107 81            	ret	
1101                     	xdef	_GPIO_ExternalPullUpConfig
1102                     	xdef	_GPIO_ReadInputPin
1103                     	xdef	_GPIO_ReadOutputData
1104                     	xdef	_GPIO_ReadInputData
1105                     	xdef	_GPIO_WriteReverse
1106                     	xdef	_GPIO_WriteLow
1107                     	xdef	_GPIO_WriteHigh
1108                     	xdef	_GPIO_Write
1109                     	xdef	_GPIO_Init
1110                     	xdef	_GPIO_DeInit
1111                     	xref	_assert_failed
1112                     .const:	section	.text
1113  0000               L771:
1114  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm\librarie"
1115  0012 735c73746d38  	dc.b	"s\stm8s_stdperiph_"
1116  0024 647269766572  	dc.b	"driver\src\stm8s_g"
1117  0036 70696f2e6300  	dc.b	"pio.c",0
1137                     	end
