   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 170                     ; 145 void USART_DeInit(USART_TypeDef* USARTx)
 170                     ; 146 {
 171                     .text:	section	.text,new
 172  0000               f_USART_DeInit:
 176                     ; 150   (void) USARTx->SR;
 178  0000 f6            	ld	a,(x)
 179                     ; 151   (void) USARTx->DR;
 181  0001 e601          	ld	a,(1,x)
 182                     ; 153   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 184  0003 6f03          	clr	(3,x)
 185                     ; 154   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 187  0005 6f02          	clr	(2,x)
 188                     ; 156   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 190  0007 6f04          	clr	(4,x)
 191                     ; 157   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 193  0009 6f05          	clr	(5,x)
 194                     ; 158   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 196  000b 6f06          	clr	(6,x)
 197                     ; 159   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 199  000d 6f07          	clr	(7,x)
 200                     ; 160 }
 203  000f 87            	retf	
 390                     ; 189 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 390                     ; 190                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 390                     ; 191                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 390                     ; 192 {
 391                     .text:	section	.text,new
 392  0000               f_USART_Init:
 394  0000 89            	pushw	x
 395  0001 5204          	subw	sp,#4
 396       00000004      OFST:	set	4
 399                     ; 193   uint32_t BaudRate_Mantissa = 0;
 401                     ; 196   assert_param(IS_USART_BAUDRATE(BaudRate));
 403                     ; 198   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 405                     ; 200   assert_param(IS_USART_STOPBITS(USART_StopBits));
 407                     ; 202   assert_param(IS_USART_PARITY(USART_Parity));
 409                     ; 204   assert_param(IS_USART_MODE(USART_Mode));
 411                     ; 207   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 413  0003 e604          	ld	a,(4,x)
 414  0005 a4e9          	and	a,#233
 415  0007 e704          	ld	(4,x),a
 416                     ; 210   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 418  0009 7b0e          	ld	a,(OFST+10,sp)
 419  000b 1a10          	or	a,(OFST+12,sp)
 420  000d ea04          	or	a,(4,x)
 421  000f e704          	ld	(4,x),a
 422                     ; 213   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 424  0011 e606          	ld	a,(6,x)
 425  0013 a4cf          	and	a,#207
 426  0015 e706          	ld	(6,x),a
 427                     ; 215   USARTx->CR3 |= (uint8_t)USART_StopBits;
 429  0017 e606          	ld	a,(6,x)
 430  0019 1a0f          	or	a,(OFST+11,sp)
 431  001b e706          	ld	(6,x),a
 432                     ; 218   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 434  001d 6f02          	clr	(2,x)
 435                     ; 220   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 437  001f e603          	ld	a,(3,x)
 438  0021 a40f          	and	a,#15
 439  0023 e703          	ld	(3,x),a
 440                     ; 222   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 442  0025 e603          	ld	a,(3,x)
 443  0027 a4f0          	and	a,#240
 444  0029 e703          	ld	(3,x),a
 445                     ; 224   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 447  002b 8d000000      	callf	f_CLK_GetClockFreq
 449  002f 96            	ldw	x,sp
 450  0030 1c000a        	addw	x,#OFST+6
 451  0033 8d000000      	callf	d_ludv
 453  0037 96            	ldw	x,sp
 454  0038 5c            	incw	x
 455  0039 8d000000      	callf	d_rtol
 457                     ; 226   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 459  003d 7b03          	ld	a,(OFST-1,sp)
 460  003f a4f0          	and	a,#240
 461  0041 1e05          	ldw	x,(OFST+1,sp)
 462  0043 e703          	ld	(3,x),a
 463                     ; 228   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 465  0045 7b04          	ld	a,(OFST+0,sp)
 466  0047 a40f          	and	a,#15
 467  0049 ea03          	or	a,(3,x)
 468  004b e703          	ld	(3,x),a
 469                     ; 230   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 471  004d 96            	ldw	x,sp
 472  004e 5c            	incw	x
 473  004f 8d000000      	callf	d_ltor
 475  0053 a604          	ld	a,#4
 476  0055 8d000000      	callf	d_lursh
 478  0059 b603          	ld	a,c_lreg+3
 479  005b 1e05          	ldw	x,(OFST+1,sp)
 480  005d e702          	ld	(2,x),a
 481                     ; 233   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 483  005f e605          	ld	a,(5,x)
 484  0061 a4f3          	and	a,#243
 485  0063 e705          	ld	(5,x),a
 486                     ; 235   USARTx->CR2 |= (uint8_t)USART_Mode;
 488  0065 e605          	ld	a,(5,x)
 489  0067 1a11          	or	a,(OFST+13,sp)
 490  0069 e705          	ld	(5,x),a
 491                     ; 236 }
 494  006b 5b06          	addw	sp,#6
 495  006d 87            	retf	
 654                     ; 261 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 654                     ; 262                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 654                     ; 263                      USART_LastBit_TypeDef USART_LastBit)
 654                     ; 264 {
 655                     .text:	section	.text,new
 656  0000               f_USART_ClockInit:
 658  0000 89            	pushw	x
 659       00000000      OFST:	set	0
 662                     ; 266   assert_param(IS_USART_CLOCK(USART_Clock));
 664                     ; 267   assert_param(IS_USART_CPOL(USART_CPOL));
 666                     ; 268   assert_param(IS_USART_CPHA(USART_CPHA));
 668                     ; 269   assert_param(IS_USART_LASTBIT(USART_LastBit));
 670                     ; 272   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 672  0001 e606          	ld	a,(6,x)
 673  0003 a4f8          	and	a,#248
 674  0005 e706          	ld	(6,x),a
 675                     ; 274   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 677  0007 7b07          	ld	a,(OFST+7,sp)
 678  0009 1a08          	or	a,(OFST+8,sp)
 679  000b 1a09          	or	a,(OFST+9,sp)
 680  000d ea06          	or	a,(6,x)
 681  000f e706          	ld	(6,x),a
 682                     ; 276   if (USART_Clock != USART_Clock_Disable)
 684  0011 7b06          	ld	a,(OFST+6,sp)
 685  0013 2706          	jreq	L123
 686                     ; 278     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 688  0015 e606          	ld	a,(6,x)
 689  0017 aa08          	or	a,#8
 691  0019 2006          	jra	L323
 692  001b               L123:
 693                     ; 282     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 695  001b 1e01          	ldw	x,(OFST+1,sp)
 696  001d e606          	ld	a,(6,x)
 697  001f a4f7          	and	a,#247
 698  0021               L323:
 699  0021 e706          	ld	(6,x),a
 700                     ; 284 }
 703  0023 85            	popw	x
 704  0024 87            	retf	
 770                     ; 293 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 770                     ; 294 {
 771                     .text:	section	.text,new
 772  0000               f_USART_Cmd:
 774  0000 89            	pushw	x
 775       00000000      OFST:	set	0
 778                     ; 295   if (NewState != DISABLE)
 780  0001 7b06          	ld	a,(OFST+6,sp)
 781  0003 2706          	jreq	L163
 782                     ; 297     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 784  0005 e604          	ld	a,(4,x)
 785  0007 a4df          	and	a,#223
 787  0009 2006          	jra	L363
 788  000b               L163:
 789                     ; 301     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 791  000b 1e01          	ldw	x,(OFST+1,sp)
 792  000d e604          	ld	a,(4,x)
 793  000f aa20          	or	a,#32
 794  0011               L363:
 795  0011 e704          	ld	(4,x),a
 796                     ; 303 }
 799  0013 85            	popw	x
 800  0014 87            	retf	
 843                     ; 326 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 843                     ; 327 {
 844                     .text:	section	.text,new
 845  0000               f_USART_SetPrescaler:
 847  0000 89            	pushw	x
 848       00000000      OFST:	set	0
 851                     ; 329   USARTx->PSCR = USART_Prescaler;
 853  0001 7b06          	ld	a,(OFST+6,sp)
 854  0003 1e01          	ldw	x,(OFST+1,sp)
 855  0005 e70a          	ld	(10,x),a
 856                     ; 330 }
 859  0007 85            	popw	x
 860  0008 87            	retf	
 896                     ; 337 void USART_SendBreak(USART_TypeDef* USARTx)
 896                     ; 338 {
 897                     .text:	section	.text,new
 898  0000               f_USART_SendBreak:
 902                     ; 339   USARTx->CR2 |= USART_CR2_SBK;
 904  0000 e605          	ld	a,(5,x)
 905  0002 aa01          	or	a,#1
 906  0004 e705          	ld	(5,x),a
 907                     ; 340 }
 910  0006 87            	retf	
 946                     ; 379 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 946                     ; 380 {
 947                     .text:	section	.text,new
 948  0000               f_USART_ReceiveData8:
 952                     ; 381   return USARTx->DR;
 954  0000 e601          	ld	a,(1,x)
 957  0002 87            	retf	
1000                     ; 389 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1000                     ; 390 {
1001                     .text:	section	.text,new
1002  0000               f_USART_ReceiveData9:
1004  0000 89            	pushw	x
1005  0001 89            	pushw	x
1006       00000002      OFST:	set	2
1009                     ; 391   uint16_t temp = 0;
1011                     ; 393   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1013  0002 e604          	ld	a,(4,x)
1014  0004 a480          	and	a,#128
1015  0006 5f            	clrw	x
1016  0007 02            	rlwa	x,a
1017  0008 58            	sllw	x
1018  0009 1f01          	ldw	(OFST-1,sp),x
1019                     ; 394   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1021  000b 1e03          	ldw	x,(OFST+1,sp)
1022  000d e601          	ld	a,(1,x)
1023  000f 5f            	clrw	x
1024  0010 97            	ld	xl,a
1025  0011 01            	rrwa	x,a
1026  0012 1a02          	or	a,(OFST+0,sp)
1027  0014 01            	rrwa	x,a
1028  0015 1a01          	or	a,(OFST-1,sp)
1029  0017 a401          	and	a,#1
1030  0019 01            	rrwa	x,a
1033  001a 5b04          	addw	sp,#4
1034  001c 87            	retf	
1077                     ; 402 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1077                     ; 403 {
1078                     .text:	section	.text,new
1079  0000               f_USART_SendData8:
1081  0000 89            	pushw	x
1082       00000000      OFST:	set	0
1085                     ; 405   USARTx->DR = Data;
1087  0001 7b06          	ld	a,(OFST+6,sp)
1088  0003 1e01          	ldw	x,(OFST+1,sp)
1089  0005 e701          	ld	(1,x),a
1090                     ; 406 }
1093  0007 85            	popw	x
1094  0008 87            	retf	
1137                     ; 415 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1137                     ; 416 {
1138                     .text:	section	.text,new
1139  0000               f_USART_SendData9:
1141  0000 89            	pushw	x
1142       00000000      OFST:	set	0
1145                     ; 417   assert_param(IS_USART_DATA_9BITS(Data));
1147                     ; 420   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1149  0001 e604          	ld	a,(4,x)
1150  0003 a4bf          	and	a,#191
1151  0005 e704          	ld	(4,x),a
1152                     ; 423   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1154  0007 1606          	ldw	y,(OFST+6,sp)
1155  0009 9054          	srlw	y
1156  000b 9054          	srlw	y
1157  000d 909f          	ld	a,yl
1158  000f a440          	and	a,#64
1159  0011 ea04          	or	a,(4,x)
1160  0013 e704          	ld	(4,x),a
1161                     ; 426   USARTx->DR   = (uint8_t)(Data);
1163  0015 7b07          	ld	a,(OFST+7,sp)
1164  0017 1e01          	ldw	x,(OFST+1,sp)
1165  0019 e701          	ld	(1,x),a
1166                     ; 427 }
1169  001b 85            	popw	x
1170  001c 87            	retf	
1217                     ; 470 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1217                     ; 471 {
1218                     .text:	section	.text,new
1219  0000               f_USART_ReceiverWakeUpCmd:
1221  0000 89            	pushw	x
1222       00000000      OFST:	set	0
1225                     ; 472   assert_param(IS_FUNCTIONAL_STATE(NewState));
1227                     ; 474   if (NewState != DISABLE)
1229  0001 7b06          	ld	a,(OFST+6,sp)
1230  0003 2706          	jreq	L165
1231                     ; 477     USARTx->CR2 |= USART_CR2_RWU;
1233  0005 e605          	ld	a,(5,x)
1234  0007 aa02          	or	a,#2
1236  0009 2006          	jra	L365
1237  000b               L165:
1238                     ; 482     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1240  000b 1e01          	ldw	x,(OFST+1,sp)
1241  000d e605          	ld	a,(5,x)
1242  000f a4fd          	and	a,#253
1243  0011               L365:
1244  0011 e705          	ld	(5,x),a
1245                     ; 484 }
1248  0013 85            	popw	x
1249  0014 87            	retf	
1292                     ; 493 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1292                     ; 494 {
1293                     .text:	section	.text,new
1294  0000               f_USART_SetAddress:
1296  0000 89            	pushw	x
1297       00000000      OFST:	set	0
1300                     ; 496   assert_param(IS_USART_ADDRESS(USART_Address));
1302                     ; 499   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1304  0001 e607          	ld	a,(7,x)
1305  0003 a4f0          	and	a,#240
1306  0005 e707          	ld	(7,x),a
1307                     ; 501   USARTx->CR4 |= USART_Address;
1309  0007 e607          	ld	a,(7,x)
1310  0009 1a06          	or	a,(OFST+6,sp)
1311  000b e707          	ld	(7,x),a
1312                     ; 502 }
1315  000d 85            	popw	x
1316  000e 87            	retf	
1384                     ; 512 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1384                     ; 513 {
1385                     .text:	section	.text,new
1386  0000               f_USART_WakeUpConfig:
1388  0000 89            	pushw	x
1389       00000000      OFST:	set	0
1392                     ; 514   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1394                     ; 516   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1396  0001 e604          	ld	a,(4,x)
1397  0003 a4f7          	and	a,#247
1398  0005 e704          	ld	(4,x),a
1399                     ; 517   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1401  0007 e604          	ld	a,(4,x)
1402  0009 1a06          	or	a,(OFST+6,sp)
1403  000b e704          	ld	(4,x),a
1404                     ; 518 }
1407  000d 85            	popw	x
1408  000e 87            	retf	
1455                     ; 563 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1455                     ; 564 {
1456                     .text:	section	.text,new
1457  0000               f_USART_HalfDuplexCmd:
1459  0000 89            	pushw	x
1460       00000000      OFST:	set	0
1463                     ; 565   assert_param(IS_FUNCTIONAL_STATE(NewState));
1465                     ; 567   if (NewState != DISABLE)
1467  0001 7b06          	ld	a,(OFST+6,sp)
1468  0003 2706          	jreq	L766
1469                     ; 569     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1471  0005 e608          	ld	a,(8,x)
1472  0007 aa08          	or	a,#8
1474  0009 2006          	jra	L176
1475  000b               L766:
1476                     ; 573     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1478  000b 1e01          	ldw	x,(OFST+1,sp)
1479  000d e608          	ld	a,(8,x)
1480  000f a4f7          	and	a,#247
1481  0011               L176:
1482  0011 e708          	ld	(8,x),a
1483                     ; 575 }
1486  0013 85            	popw	x
1487  0014 87            	retf	
1533                     ; 641 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1533                     ; 642 {
1534                     .text:	section	.text,new
1535  0000               f_USART_SmartCardCmd:
1537  0000 89            	pushw	x
1538       00000000      OFST:	set	0
1541                     ; 643   assert_param(IS_FUNCTIONAL_STATE(NewState));
1543                     ; 645   if (NewState != DISABLE)
1545  0001 7b06          	ld	a,(OFST+6,sp)
1546  0003 2706          	jreq	L717
1547                     ; 648     USARTx->CR5 |= USART_CR5_SCEN;
1549  0005 e608          	ld	a,(8,x)
1550  0007 aa20          	or	a,#32
1552  0009 2006          	jra	L127
1553  000b               L717:
1554                     ; 653     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1556  000b 1e01          	ldw	x,(OFST+1,sp)
1557  000d e608          	ld	a,(8,x)
1558  000f a4df          	and	a,#223
1559  0011               L127:
1560  0011 e708          	ld	(8,x),a
1561                     ; 655 }
1564  0013 85            	popw	x
1565  0014 87            	retf	
1612                     ; 664 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1612                     ; 665 {
1613                     .text:	section	.text,new
1614  0000               f_USART_SmartCardNACKCmd:
1616  0000 89            	pushw	x
1617       00000000      OFST:	set	0
1620                     ; 666   assert_param(IS_FUNCTIONAL_STATE(NewState));
1622                     ; 668   if (NewState != DISABLE)
1624  0001 7b06          	ld	a,(OFST+6,sp)
1625  0003 2706          	jreq	L747
1626                     ; 671     USARTx->CR5 |= USART_CR5_NACK;
1628  0005 e608          	ld	a,(8,x)
1629  0007 aa10          	or	a,#16
1631  0009 2006          	jra	L157
1632  000b               L747:
1633                     ; 676     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1635  000b 1e01          	ldw	x,(OFST+1,sp)
1636  000d e608          	ld	a,(8,x)
1637  000f a4ef          	and	a,#239
1638  0011               L157:
1639  0011 e708          	ld	(8,x),a
1640                     ; 678 }
1643  0013 85            	popw	x
1644  0014 87            	retf	
1687                     ; 687 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1687                     ; 688 {
1688                     .text:	section	.text,new
1689  0000               f_USART_SetGuardTime:
1691  0000 89            	pushw	x
1692       00000000      OFST:	set	0
1695                     ; 690   USARTx->GTR = USART_GuardTime;
1697  0001 7b06          	ld	a,(OFST+6,sp)
1698  0003 1e01          	ldw	x,(OFST+1,sp)
1699  0005 e709          	ld	(9,x),a
1700                     ; 691 }
1703  0007 85            	popw	x
1704  0008 87            	retf	
1772                     ; 748 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1772                     ; 749 {
1773                     .text:	section	.text,new
1774  0000               f_USART_IrDAConfig:
1776  0000 89            	pushw	x
1777       00000000      OFST:	set	0
1780                     ; 750   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1782                     ; 752   if (USART_IrDAMode != USART_IrDAMode_Normal)
1784  0001 7b06          	ld	a,(OFST+6,sp)
1785  0003 2706          	jreq	L1301
1786                     ; 754     USARTx->CR5 |= USART_CR5_IRLP;
1788  0005 e608          	ld	a,(8,x)
1789  0007 aa04          	or	a,#4
1791  0009 2006          	jra	L3301
1792  000b               L1301:
1793                     ; 758     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1795  000b 1e01          	ldw	x,(OFST+1,sp)
1796  000d e608          	ld	a,(8,x)
1797  000f a4fb          	and	a,#251
1798  0011               L3301:
1799  0011 e708          	ld	(8,x),a
1800                     ; 760 }
1803  0013 85            	popw	x
1804  0014 87            	retf	
1850                     ; 769 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1850                     ; 770 {
1851                     .text:	section	.text,new
1852  0000               f_USART_IrDACmd:
1854  0000 89            	pushw	x
1855       00000000      OFST:	set	0
1858                     ; 773   assert_param(IS_FUNCTIONAL_STATE(NewState));
1860                     ; 775   if (NewState != DISABLE)
1862  0001 7b06          	ld	a,(OFST+6,sp)
1863  0003 2706          	jreq	L1601
1864                     ; 778     USARTx->CR5 |= USART_CR5_IREN;
1866  0005 e608          	ld	a,(8,x)
1867  0007 aa02          	or	a,#2
1869  0009 2006          	jra	L3601
1870  000b               L1601:
1871                     ; 783     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1873  000b 1e01          	ldw	x,(OFST+1,sp)
1874  000d e608          	ld	a,(8,x)
1875  000f a4fd          	and	a,#253
1876  0011               L3601:
1877  0011 e708          	ld	(8,x),a
1878                     ; 785 }
1881  0013 85            	popw	x
1882  0014 87            	retf	
1958                     ; 815 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
1958                     ; 816                   FunctionalState NewState)
1958                     ; 817 {
1959                     .text:	section	.text,new
1960  0000               f_USART_DMACmd:
1962  0000 89            	pushw	x
1963       00000000      OFST:	set	0
1966                     ; 819   assert_param(IS_USART_DMAREQ(USART_DMAReq));
1968                     ; 820   assert_param(IS_FUNCTIONAL_STATE(NewState));
1970                     ; 822   if (NewState != DISABLE)
1972  0001 7b07          	ld	a,(OFST+7,sp)
1973  0003 2706          	jreq	L5211
1974                     ; 826     USARTx->CR5 |= (uint8_t) USART_DMAReq;
1976  0005 e608          	ld	a,(8,x)
1977  0007 1a06          	or	a,(OFST+6,sp)
1979  0009 2007          	jra	L7211
1980  000b               L5211:
1981                     ; 832     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
1983  000b 1e01          	ldw	x,(OFST+1,sp)
1984  000d 7b06          	ld	a,(OFST+6,sp)
1985  000f 43            	cpl	a
1986  0010 e408          	and	a,(8,x)
1987  0012               L7211:
1988  0012 e708          	ld	(8,x),a
1989                     ; 834 }
1992  0014 85            	popw	x
1993  0015 87            	retf	
2132                     ; 936 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2132                     ; 937 {
2133                     .text:	section	.text,new
2134  0000               f_USART_ITConfig:
2136  0000 89            	pushw	x
2137  0001 89            	pushw	x
2138       00000002      OFST:	set	2
2141                     ; 938   uint8_t usartreg, itpos = 0x00;
2143                     ; 939   assert_param(IS_USART_CONFIG_IT(USART_IT));
2145                     ; 940   assert_param(IS_FUNCTIONAL_STATE(NewState));
2147                     ; 943   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2149  0002 7b08          	ld	a,(OFST+6,sp)
2150  0004 6b01          	ld	(OFST-1,sp),a
2151                     ; 945   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2153  0006 7b09          	ld	a,(OFST+7,sp)
2154  0008 a40f          	and	a,#15
2155  000a 5f            	clrw	x
2156  000b 97            	ld	xl,a
2157  000c a601          	ld	a,#1
2158  000e 5d            	tnzw	x
2159  000f 2704          	jreq	L06
2160  0011               L26:
2161  0011 48            	sll	a
2162  0012 5a            	decw	x
2163  0013 26fc          	jrne	L26
2164  0015               L06:
2165  0015 6b02          	ld	(OFST+0,sp),a
2166                     ; 947   if (NewState != DISABLE)
2168  0017 7b0a          	ld	a,(OFST+8,sp)
2169  0019 2722          	jreq	L3121
2170                     ; 950     if (usartreg == 0x01)
2172  001b 7b01          	ld	a,(OFST-1,sp)
2173  001d a101          	cp	a,#1
2174  001f 2608          	jrne	L5121
2175                     ; 952       USARTx->CR1 |= itpos;
2177  0021 1e03          	ldw	x,(OFST+1,sp)
2178  0023 e604          	ld	a,(4,x)
2179  0025 1a02          	or	a,(OFST+0,sp)
2181  0027 2021          	jpf	LC002
2182  0029               L5121:
2183                     ; 954     else if (usartreg == 0x05)
2185  0029 a105          	cp	a,#5
2186  002b 2608          	jrne	L1221
2187                     ; 956       USARTx->CR5 |= itpos;
2189  002d 1e03          	ldw	x,(OFST+1,sp)
2190  002f e608          	ld	a,(8,x)
2191  0031 1a02          	or	a,(OFST+0,sp)
2193  0033 2024          	jpf	LC003
2194  0035               L1221:
2195                     ; 961       USARTx->CR2 |= itpos;
2197  0035 1e03          	ldw	x,(OFST+1,sp)
2198  0037 e605          	ld	a,(5,x)
2199  0039 1a02          	or	a,(OFST+0,sp)
2200  003b 2027          	jpf	LC001
2201  003d               L3121:
2202                     ; 967     if (usartreg == 0x01)
2204  003d 7b01          	ld	a,(OFST-1,sp)
2205  003f a101          	cp	a,#1
2206  0041 260b          	jrne	L7221
2207                     ; 969       USARTx->CR1 &= (uint8_t)(~itpos);
2209  0043 1e03          	ldw	x,(OFST+1,sp)
2210  0045 7b02          	ld	a,(OFST+0,sp)
2211  0047 43            	cpl	a
2212  0048 e404          	and	a,(4,x)
2213  004a               LC002:
2214  004a e704          	ld	(4,x),a
2216  004c 2018          	jra	L5221
2217  004e               L7221:
2218                     ; 971     else if (usartreg == 0x05)
2220  004e a105          	cp	a,#5
2221  0050 260b          	jrne	L3321
2222                     ; 973       USARTx->CR5 &= (uint8_t)(~itpos);
2224  0052 1e03          	ldw	x,(OFST+1,sp)
2225  0054 7b02          	ld	a,(OFST+0,sp)
2226  0056 43            	cpl	a
2227  0057 e408          	and	a,(8,x)
2228  0059               LC003:
2229  0059 e708          	ld	(8,x),a
2231  005b 2009          	jra	L5221
2232  005d               L3321:
2233                     ; 978       USARTx->CR2 &= (uint8_t)(~itpos);
2235  005d 1e03          	ldw	x,(OFST+1,sp)
2236  005f 7b02          	ld	a,(OFST+0,sp)
2237  0061 43            	cpl	a
2238  0062 e405          	and	a,(5,x)
2239  0064               LC001:
2240  0064 e705          	ld	(5,x),a
2241  0066               L5221:
2242                     ; 981 }
2245  0066 5b04          	addw	sp,#4
2246  0068 87            	retf	
2393                     ; 999 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2393                     ; 1000 {
2394                     .text:	section	.text,new
2395  0000               f_USART_GetFlagStatus:
2397  0000 89            	pushw	x
2398  0001 88            	push	a
2399       00000001      OFST:	set	1
2402                     ; 1001   FlagStatus status = RESET;
2404                     ; 1004   assert_param(IS_USART_FLAG(USART_FLAG));
2406                     ; 1006   if (USART_FLAG == USART_FLAG_SBK)
2408  0002 1e07          	ldw	x,(OFST+6,sp)
2409  0004 a30101        	cpw	x,#257
2410  0007 260a          	jrne	L5231
2411                     ; 1008     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2413  0009 1e02          	ldw	x,(OFST+1,sp)
2414  000b e605          	ld	a,(5,x)
2415  000d 1508          	bcp	a,(OFST+7,sp)
2416  000f 270d          	jreq	L5331
2417                     ; 1011       status = SET;
2419  0011 2007          	jpf	LC005
2420                     ; 1016       status = RESET;
2421  0013               L5231:
2422                     ; 1021     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2424  0013 1e02          	ldw	x,(OFST+1,sp)
2425  0015 f6            	ld	a,(x)
2426  0016 1508          	bcp	a,(OFST+7,sp)
2427  0018 2704          	jreq	L5331
2428                     ; 1024       status = SET;
2430  001a               LC005:
2432  001a a601          	ld	a,#1
2434  001c 2001          	jra	L3331
2435  001e               L5331:
2436                     ; 1029       status = RESET;
2439  001e 4f            	clr	a
2440  001f               L3331:
2441                     ; 1033   return status;
2445  001f 5b03          	addw	sp,#3
2446  0021 87            	retf	
2492                     ; 1057 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2492                     ; 1058 {
2493                     .text:	section	.text,new
2494  0000               f_USART_ClearFlag:
2496  0000 89            	pushw	x
2497       00000000      OFST:	set	0
2500                     ; 1060   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2502                     ; 1062   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2504  0001 7b07          	ld	a,(OFST+7,sp)
2505  0003 43            	cpl	a
2506  0004 1e01          	ldw	x,(OFST+1,sp)
2507  0006 f7            	ld	(x),a
2508                     ; 1063 }
2511  0007 85            	popw	x
2512  0008 87            	retf	
2604                     ; 1080 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2604                     ; 1081 {
2605                     .text:	section	.text,new
2606  0000               f_USART_GetITStatus:
2608  0000 89            	pushw	x
2609  0001 5203          	subw	sp,#3
2610       00000003      OFST:	set	3
2613                     ; 1082   ITStatus pendingbitstatus = RESET;
2615                     ; 1083   uint8_t temp = 0;
2617                     ; 1084   uint8_t itpos = 0;
2619                     ; 1085   uint8_t itmask1 = 0;
2621                     ; 1086   uint8_t itmask2 = 0;
2623                     ; 1087   uint8_t enablestatus = 0;
2625                     ; 1090   assert_param(IS_USART_GET_IT(USART_IT));
2627                     ; 1093   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2629  0003 7b0a          	ld	a,(OFST+7,sp)
2630  0005 a40f          	and	a,#15
2631  0007 5f            	clrw	x
2632  0008 97            	ld	xl,a
2633  0009 a601          	ld	a,#1
2634  000b 5d            	tnzw	x
2635  000c 2704          	jreq	L27
2636  000e               L47:
2637  000e 48            	sll	a
2638  000f 5a            	decw	x
2639  0010 26fc          	jrne	L47
2640  0012               L27:
2641  0012 6b02          	ld	(OFST-1,sp),a
2642                     ; 1095   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2644  0014 7b0a          	ld	a,(OFST+7,sp)
2645  0016 4e            	swap	a
2646  0017 a40f          	and	a,#15
2647  0019 6b03          	ld	(OFST+0,sp),a
2648                     ; 1097   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2650  001b 5f            	clrw	x
2651  001c 97            	ld	xl,a
2652  001d a601          	ld	a,#1
2653  001f 5d            	tnzw	x
2654  0020 2704          	jreq	L67
2655  0022               L001:
2656  0022 48            	sll	a
2657  0023 5a            	decw	x
2658  0024 26fc          	jrne	L001
2659  0026               L67:
2660  0026 6b03          	ld	(OFST+0,sp),a
2661                     ; 1100   if (USART_IT == USART_IT_PE)
2663  0028 1e09          	ldw	x,(OFST+6,sp)
2664  002a a30100        	cpw	x,#256
2665  002d 2611          	jrne	L7241
2666                     ; 1103     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2668  002f 1e04          	ldw	x,(OFST+1,sp)
2669  0031 e604          	ld	a,(4,x)
2670  0033 1403          	and	a,(OFST+0,sp)
2671  0035 6b03          	ld	(OFST+0,sp),a
2672                     ; 1106     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2674  0037 f6            	ld	a,(x)
2675  0038 1502          	bcp	a,(OFST-1,sp)
2676  003a 2739          	jreq	L1541
2678  003c 7b03          	ld	a,(OFST+0,sp)
2679                     ; 1109       pendingbitstatus = SET;
2681  003e 201e          	jpf	LC008
2682                     ; 1114       pendingbitstatus = RESET;
2683  0040               L7241:
2684                     ; 1118   else if (USART_IT == USART_IT_OR)
2686  0040 a30235        	cpw	x,#565
2687  0043 261f          	jrne	L7341
2688                     ; 1121     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2690  0045 1e04          	ldw	x,(OFST+1,sp)
2691  0047 e605          	ld	a,(5,x)
2692  0049 1403          	and	a,(OFST+0,sp)
2693  004b 6b03          	ld	(OFST+0,sp),a
2694                     ; 1124     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2696  004d e608          	ld	a,(8,x)
2697  004f a401          	and	a,#1
2698  0051 6b01          	ld	(OFST-2,sp),a
2699                     ; 1126     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2701  0053 f6            	ld	a,(x)
2702  0054 1502          	bcp	a,(OFST-1,sp)
2703  0056 271d          	jreq	L1541
2705  0058 7b03          	ld	a,(OFST+0,sp)
2706  005a 2604          	jrne	L3441
2708  005c 7b01          	ld	a,(OFST-2,sp)
2709  005e               LC008:
2710  005e 2715          	jreq	L1541
2711  0060               L3441:
2712                     ; 1129       pendingbitstatus = SET;
2716  0060 a601          	ld	a,#1
2718  0062 2012          	jra	L5341
2719                     ; 1134       pendingbitstatus = RESET;
2720  0064               L7341:
2721                     ; 1141     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2723  0064 1e04          	ldw	x,(OFST+1,sp)
2724  0066 e605          	ld	a,(5,x)
2725  0068 1403          	and	a,(OFST+0,sp)
2726  006a 6b03          	ld	(OFST+0,sp),a
2727                     ; 1143     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2729  006c f6            	ld	a,(x)
2730  006d 1502          	bcp	a,(OFST-1,sp)
2731  006f 2704          	jreq	L1541
2733  0071 7b03          	ld	a,(OFST+0,sp)
2734                     ; 1146       pendingbitstatus = SET;
2736  0073 26eb          	jrne	L3441
2737  0075               L1541:
2738                     ; 1151       pendingbitstatus = RESET;
2742  0075 4f            	clr	a
2743  0076               L5341:
2744                     ; 1156   return  pendingbitstatus;
2748  0076 5b05          	addw	sp,#5
2749  0078 87            	retf	
2786                     ; 1180 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2786                     ; 1181 {
2787                     .text:	section	.text,new
2788  0000               f_USART_ClearITPendingBit:
2792                     ; 1182   assert_param(IS_USART_CLEAR_IT(USART_IT));
2794                     ; 1185   USARTx->SR &= (uint8_t)(~USART_SR_TC);
2796  0000 f6            	ld	a,(x)
2797  0001 a4bf          	and	a,#191
2798  0003 f7            	ld	(x),a
2799                     ; 1186 }
2802  0004 87            	retf	
2814                     	xdef	f_USART_ClearITPendingBit
2815                     	xdef	f_USART_GetITStatus
2816                     	xdef	f_USART_ClearFlag
2817                     	xdef	f_USART_GetFlagStatus
2818                     	xdef	f_USART_ITConfig
2819                     	xdef	f_USART_DMACmd
2820                     	xdef	f_USART_IrDACmd
2821                     	xdef	f_USART_IrDAConfig
2822                     	xdef	f_USART_SetGuardTime
2823                     	xdef	f_USART_SmartCardNACKCmd
2824                     	xdef	f_USART_SmartCardCmd
2825                     	xdef	f_USART_HalfDuplexCmd
2826                     	xdef	f_USART_SetAddress
2827                     	xdef	f_USART_ReceiverWakeUpCmd
2828                     	xdef	f_USART_WakeUpConfig
2829                     	xdef	f_USART_ReceiveData9
2830                     	xdef	f_USART_ReceiveData8
2831                     	xdef	f_USART_SendData9
2832                     	xdef	f_USART_SendData8
2833                     	xdef	f_USART_SendBreak
2834                     	xdef	f_USART_SetPrescaler
2835                     	xdef	f_USART_Cmd
2836                     	xdef	f_USART_ClockInit
2837                     	xdef	f_USART_Init
2838                     	xdef	f_USART_DeInit
2839                     	xref	f_CLK_GetClockFreq
2840                     	xref.b	c_lreg
2841                     	xref.b	c_x
2860                     	xref	d_lursh
2861                     	xref	d_ltor
2862                     	xref	d_rtol
2863                     	xref	d_ludv
2864                     	end
