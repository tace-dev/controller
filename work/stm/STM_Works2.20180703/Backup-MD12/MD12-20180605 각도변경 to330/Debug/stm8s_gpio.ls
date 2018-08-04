   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
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
 567       fffffffe      OFST: set -2
 570                     ; 143   GPIOx->ODR = PortVal;
 572  00a7 7b03          	ld	a,(OFST+5,sp)
 573  00a9 f7            	ld	(x),a
 574                     ; 144 }
 577  00aa 81            	ret	
 624                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 624                     ; 155 {
 625                     	switch	.text
 626  00ab               _GPIO_WriteHigh:
 628       fffffffe      OFST: set -2
 631                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 633  00ab f6            	ld	a,(x)
 634  00ac 1a03          	or	a,(OFST+5,sp)
 635  00ae f7            	ld	(x),a
 636                     ; 157 }
 639  00af 81            	ret	
 686                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 686                     ; 168 {
 687                     	switch	.text
 688  00b0               _GPIO_WriteLow:
 690       fffffffe      OFST: set -2
 693                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 695  00b0 7b03          	ld	a,(OFST+5,sp)
 696  00b2 43            	cpl	a
 697  00b3 f4            	and	a,(x)
 698  00b4 f7            	ld	(x),a
 699                     ; 170 }
 702  00b5 81            	ret	
 749                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 749                     ; 181 {
 750                     	switch	.text
 751  00b6               _GPIO_WriteReverse:
 753       fffffffe      OFST: set -2
 756                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 758  00b6 f6            	ld	a,(x)
 759  00b7 1803          	xor	a,(OFST+5,sp)
 760  00b9 f7            	ld	(x),a
 761                     ; 183 }
 764  00ba 81            	ret	
 802                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 802                     ; 192 {
 803                     	switch	.text
 804  00bb               _GPIO_ReadOutputData:
 808                     ; 193   return ((uint8_t)GPIOx->ODR);
 810  00bb f6            	ld	a,(x)
 813  00bc 81            	ret	
 850                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 850                     ; 203 {
 851                     	switch	.text
 852  00bd               _GPIO_ReadInputData:
 856                     ; 204   return ((uint8_t)GPIOx->IDR);
 858  00bd e601          	ld	a,(1,x)
 861  00bf 81            	ret	
 929                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 929                     ; 214 {
 930                     	switch	.text
 931  00c0               _GPIO_ReadInputPin:
 933       fffffffe      OFST: set -2
 936                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 938  00c0 e601          	ld	a,(1,x)
 939  00c2 1403          	and	a,(OFST+5,sp)
 942  00c4 81            	ret	
1021                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
1021                     ; 226 {
1022                     	switch	.text
1023  00c5               _GPIO_ExternalPullUpConfig:
1025  00c5 89            	pushw	x
1026       00000000      OFST:	set	0
1029                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1031  00c6 7b05          	ld	a,(OFST+5,sp)
1032  00c8 2605          	jrne	L05
1033  00ca ae00e4        	ldw	x,#228
1034  00cd ad23          	call	LC002
1035  00cf               L05:
1036                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1038  00cf 7b06          	ld	a,(OFST+6,sp)
1039  00d1 2708          	jreq	L06
1040  00d3 4a            	dec	a
1041  00d4 2705          	jreq	L06
1042  00d6 ae00e5        	ldw	x,#229
1043  00d9 ad17          	call	LC002
1044  00db               L06:
1045                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1047  00db 7b06          	ld	a,(OFST+6,sp)
1048  00dd 2708          	jreq	L574
1049                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1051  00df 1e01          	ldw	x,(OFST+1,sp)
1052  00e1 e603          	ld	a,(3,x)
1053  00e3 1a05          	or	a,(OFST+5,sp)
1055  00e5 2007          	jra	L774
1056  00e7               L574:
1057                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1059  00e7 1e01          	ldw	x,(OFST+1,sp)
1060  00e9 7b05          	ld	a,(OFST+5,sp)
1061  00eb 43            	cpl	a
1062  00ec e403          	and	a,(3,x)
1063  00ee               L774:
1064  00ee e703          	ld	(3,x),a
1065                     ; 238 }
1068  00f0 85            	popw	x
1069  00f1 81            	ret	
1070  00f2               LC002:
1071  00f2 89            	pushw	x
1072  00f3 5f            	clrw	x
1073  00f4 89            	pushw	x
1074  00f5 ae0000        	ldw	x,#L771
1075  00f8 cd0000        	call	_assert_failed
1077  00fb 5b04          	addw	sp,#4
1078  00fd 81            	ret	
1091                     	xdef	_GPIO_ExternalPullUpConfig
1092                     	xdef	_GPIO_ReadInputPin
1093                     	xdef	_GPIO_ReadOutputData
1094                     	xdef	_GPIO_ReadInputData
1095                     	xdef	_GPIO_WriteReverse
1096                     	xdef	_GPIO_WriteLow
1097                     	xdef	_GPIO_WriteHigh
1098                     	xdef	_GPIO_Write
1099                     	xdef	_GPIO_Init
1100                     	xdef	_GPIO_DeInit
1101                     	xref	_assert_failed
1102                     .const:	section	.text
1103  0000               L771:
1104  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm\librarie"
1105  0012 735c73746d38  	dc.b	"s\stm8s_stdperiph_"
1106  0024 647269766572  	dc.b	"driver\src\stm8s_g"
1107  0036 70696f2e6300  	dc.b	"pio.c",0
1127                     	end
