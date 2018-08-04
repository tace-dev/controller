   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 170                     ; 145 void USART_DeInit(USART_TypeDef* USARTx)
 170                     ; 146 {
 172                     .text:	section	.text,new
 173  0000               _USART_DeInit:
 177                     ; 150   (void) USARTx->SR;
 179  0000 f6            	ld	a,(x)
 180                     ; 151   (void) USARTx->DR;
 182  0001 e601          	ld	a,(1,x)
 183                     ; 153   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 185  0003 6f03          	clr	(3,x)
 186                     ; 154   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 188  0005 6f02          	clr	(2,x)
 189                     ; 156   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 191  0007 6f04          	clr	(4,x)
 192                     ; 157   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 194  0009 6f05          	clr	(5,x)
 195                     ; 158   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 197  000b 6f06          	clr	(6,x)
 198                     ; 159   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 200  000d 6f07          	clr	(7,x)
 201                     ; 160 }
 204  000f 81            	ret	
 392                     ; 189 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 392                     ; 190                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 392                     ; 191                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 392                     ; 192 {
 393                     .text:	section	.text,new
 394  0000               _USART_Init:
 396  0000 89            	pushw	x
 397  0001 5204          	subw	sp,#4
 398       00000004      OFST:	set	4
 401                     ; 193   uint32_t BaudRate_Mantissa = 0;
 403                     ; 196   assert_param(IS_USART_BAUDRATE(BaudRate));
 405                     ; 198   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 407                     ; 200   assert_param(IS_USART_STOPBITS(USART_StopBits));
 409                     ; 202   assert_param(IS_USART_PARITY(USART_Parity));
 411                     ; 204   assert_param(IS_USART_MODE(USART_Mode));
 413                     ; 207   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 415  0003 e604          	ld	a,(4,x)
 416  0005 a4e9          	and	a,#233
 417  0007 e704          	ld	(4,x),a
 418                     ; 210   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 420  0009 7b0d          	ld	a,(OFST+9,sp)
 421  000b 1a0f          	or	a,(OFST+11,sp)
 422  000d ea04          	or	a,(4,x)
 423  000f e704          	ld	(4,x),a
 424                     ; 213   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 426  0011 e606          	ld	a,(6,x)
 427  0013 a4cf          	and	a,#207
 428  0015 e706          	ld	(6,x),a
 429                     ; 215   USARTx->CR3 |= (uint8_t)USART_StopBits;
 431  0017 e606          	ld	a,(6,x)
 432  0019 1a0e          	or	a,(OFST+10,sp)
 433  001b e706          	ld	(6,x),a
 434                     ; 218   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 436  001d 6f02          	clr	(2,x)
 437                     ; 220   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 439  001f e603          	ld	a,(3,x)
 440  0021 a40f          	and	a,#15
 441  0023 e703          	ld	(3,x),a
 442                     ; 222   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 444  0025 e603          	ld	a,(3,x)
 445  0027 a4f0          	and	a,#240
 446  0029 e703          	ld	(3,x),a
 447                     ; 224   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 449  002b cd0000        	call	_CLK_GetClockFreq
 451  002e 96            	ldw	x,sp
 452  002f 1c0009        	addw	x,#OFST+5
 453  0032 cd0000        	call	c_ludv
 455  0035 96            	ldw	x,sp
 456  0036 5c            	incw	x
 457  0037 cd0000        	call	c_rtol
 459                     ; 226   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 461  003a 7b03          	ld	a,(OFST-1,sp)
 462  003c a4f0          	and	a,#240
 463  003e 1e05          	ldw	x,(OFST+1,sp)
 464  0040 e703          	ld	(3,x),a
 465                     ; 228   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 467  0042 7b04          	ld	a,(OFST+0,sp)
 468  0044 a40f          	and	a,#15
 469  0046 ea03          	or	a,(3,x)
 470  0048 e703          	ld	(3,x),a
 471                     ; 230   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 473  004a 96            	ldw	x,sp
 474  004b 5c            	incw	x
 475  004c cd0000        	call	c_ltor
 477  004f a604          	ld	a,#4
 478  0051 cd0000        	call	c_lursh
 480  0054 b603          	ld	a,c_lreg+3
 481  0056 1e05          	ldw	x,(OFST+1,sp)
 482  0058 e702          	ld	(2,x),a
 483                     ; 233   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 485  005a e605          	ld	a,(5,x)
 486  005c a4f3          	and	a,#243
 487  005e e705          	ld	(5,x),a
 488                     ; 235   USARTx->CR2 |= (uint8_t)USART_Mode;
 490  0060 e605          	ld	a,(5,x)
 491  0062 1a10          	or	a,(OFST+12,sp)
 492  0064 e705          	ld	(5,x),a
 493                     ; 236 }
 496  0066 5b06          	addw	sp,#6
 497  0068 81            	ret	
 657                     ; 261 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 657                     ; 262                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 657                     ; 263                      USART_LastBit_TypeDef USART_LastBit)
 657                     ; 264 {
 658                     .text:	section	.text,new
 659  0000               _USART_ClockInit:
 661  0000 89            	pushw	x
 662       00000000      OFST:	set	0
 665                     ; 266   assert_param(IS_USART_CLOCK(USART_Clock));
 667                     ; 267   assert_param(IS_USART_CPOL(USART_CPOL));
 669                     ; 268   assert_param(IS_USART_CPHA(USART_CPHA));
 671                     ; 269   assert_param(IS_USART_LASTBIT(USART_LastBit));
 673                     ; 272   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 675  0001 e606          	ld	a,(6,x)
 676  0003 a4f8          	and	a,#248
 677  0005 e706          	ld	(6,x),a
 678                     ; 274   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 680  0007 7b06          	ld	a,(OFST+6,sp)
 681  0009 1a07          	or	a,(OFST+7,sp)
 682  000b 1a08          	or	a,(OFST+8,sp)
 683  000d ea06          	or	a,(6,x)
 684  000f e706          	ld	(6,x),a
 685                     ; 276   if (USART_Clock != USART_Clock_Disable)
 687  0011 7b05          	ld	a,(OFST+5,sp)
 688  0013 2706          	jreq	L123
 689                     ; 278     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 691  0015 e606          	ld	a,(6,x)
 692  0017 aa08          	or	a,#8
 694  0019 2006          	jra	L323
 695  001b               L123:
 696                     ; 282     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 698  001b 1e01          	ldw	x,(OFST+1,sp)
 699  001d e606          	ld	a,(6,x)
 700  001f a4f7          	and	a,#247
 701  0021               L323:
 702  0021 e706          	ld	(6,x),a
 703                     ; 284 }
 706  0023 85            	popw	x
 707  0024 81            	ret	
 774                     ; 293 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 774                     ; 294 {
 775                     .text:	section	.text,new
 776  0000               _USART_Cmd:
 778  0000 89            	pushw	x
 779       00000000      OFST:	set	0
 782                     ; 295   if (NewState != DISABLE)
 784  0001 7b05          	ld	a,(OFST+5,sp)
 785  0003 2706          	jreq	L163
 786                     ; 297     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 788  0005 e604          	ld	a,(4,x)
 789  0007 a4df          	and	a,#223
 791  0009 2006          	jra	L363
 792  000b               L163:
 793                     ; 301     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 795  000b 1e01          	ldw	x,(OFST+1,sp)
 796  000d e604          	ld	a,(4,x)
 797  000f aa20          	or	a,#32
 798  0011               L363:
 799  0011 e704          	ld	(4,x),a
 800                     ; 303 }
 803  0013 85            	popw	x
 804  0014 81            	ret	
 848                     ; 326 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 848                     ; 327 {
 849                     .text:	section	.text,new
 850  0000               _USART_SetPrescaler:
 852  0000 89            	pushw	x
 853       00000000      OFST:	set	0
 856                     ; 329   USARTx->PSCR = USART_Prescaler;
 858  0001 7b05          	ld	a,(OFST+5,sp)
 859  0003 1e01          	ldw	x,(OFST+1,sp)
 860  0005 e70a          	ld	(10,x),a
 861                     ; 330 }
 864  0007 85            	popw	x
 865  0008 81            	ret	
 902                     ; 337 void USART_SendBreak(USART_TypeDef* USARTx)
 902                     ; 338 {
 903                     .text:	section	.text,new
 904  0000               _USART_SendBreak:
 908                     ; 339   USARTx->CR2 |= USART_CR2_SBK;
 910  0000 e605          	ld	a,(5,x)
 911  0002 aa01          	or	a,#1
 912  0004 e705          	ld	(5,x),a
 913                     ; 340 }
 916  0006 81            	ret	
 953                     ; 379 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 953                     ; 380 {
 954                     .text:	section	.text,new
 955  0000               _USART_ReceiveData8:
 959                     ; 381   return USARTx->DR;
 961  0000 e601          	ld	a,(1,x)
 964  0002 81            	ret	
1008                     ; 389 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1008                     ; 390 {
1009                     .text:	section	.text,new
1010  0000               _USART_ReceiveData9:
1012  0000 89            	pushw	x
1013  0001 89            	pushw	x
1014       00000002      OFST:	set	2
1017                     ; 391   uint16_t temp = 0;
1019                     ; 393   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1021  0002 e604          	ld	a,(4,x)
1022  0004 a480          	and	a,#128
1023  0006 5f            	clrw	x
1024  0007 02            	rlwa	x,a
1025  0008 58            	sllw	x
1026  0009 1f01          	ldw	(OFST-1,sp),x
1027                     ; 394   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1029  000b 1e03          	ldw	x,(OFST+1,sp)
1030  000d e601          	ld	a,(1,x)
1031  000f 5f            	clrw	x
1032  0010 97            	ld	xl,a
1033  0011 01            	rrwa	x,a
1034  0012 1a02          	or	a,(OFST+0,sp)
1035  0014 01            	rrwa	x,a
1036  0015 1a01          	or	a,(OFST-1,sp)
1037  0017 a401          	and	a,#1
1038  0019 01            	rrwa	x,a
1041  001a 5b04          	addw	sp,#4
1042  001c 81            	ret	
1086                     ; 402 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1086                     ; 403 {
1087                     .text:	section	.text,new
1088  0000               _USART_SendData8:
1090  0000 89            	pushw	x
1091       00000000      OFST:	set	0
1094                     ; 405   USARTx->DR = Data;
1096  0001 7b05          	ld	a,(OFST+5,sp)
1097  0003 1e01          	ldw	x,(OFST+1,sp)
1098  0005 e701          	ld	(1,x),a
1099                     ; 406 }
1102  0007 85            	popw	x
1103  0008 81            	ret	
1147                     ; 415 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1147                     ; 416 {
1148                     .text:	section	.text,new
1149  0000               _USART_SendData9:
1151  0000 89            	pushw	x
1152       00000000      OFST:	set	0
1155                     ; 417   assert_param(IS_USART_DATA_9BITS(Data));
1157                     ; 420   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1159  0001 e604          	ld	a,(4,x)
1160  0003 a4bf          	and	a,#191
1161  0005 e704          	ld	(4,x),a
1162                     ; 423   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1164  0007 1605          	ldw	y,(OFST+5,sp)
1165  0009 9054          	srlw	y
1166  000b 9054          	srlw	y
1167  000d 909f          	ld	a,yl
1168  000f a440          	and	a,#64
1169  0011 ea04          	or	a,(4,x)
1170  0013 e704          	ld	(4,x),a
1171                     ; 426   USARTx->DR   = (uint8_t)(Data);
1173  0015 7b06          	ld	a,(OFST+6,sp)
1174  0017 1e01          	ldw	x,(OFST+1,sp)
1175  0019 e701          	ld	(1,x),a
1176                     ; 427 }
1179  001b 85            	popw	x
1180  001c 81            	ret	
1228                     ; 470 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1228                     ; 471 {
1229                     .text:	section	.text,new
1230  0000               _USART_ReceiverWakeUpCmd:
1232  0000 89            	pushw	x
1233       00000000      OFST:	set	0
1236                     ; 472   assert_param(IS_FUNCTIONAL_STATE(NewState));
1238                     ; 474   if (NewState != DISABLE)
1240  0001 7b05          	ld	a,(OFST+5,sp)
1241  0003 2706          	jreq	L165
1242                     ; 477     USARTx->CR2 |= USART_CR2_RWU;
1244  0005 e605          	ld	a,(5,x)
1245  0007 aa02          	or	a,#2
1247  0009 2006          	jra	L365
1248  000b               L165:
1249                     ; 482     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1251  000b 1e01          	ldw	x,(OFST+1,sp)
1252  000d e605          	ld	a,(5,x)
1253  000f a4fd          	and	a,#253
1254  0011               L365:
1255  0011 e705          	ld	(5,x),a
1256                     ; 484 }
1259  0013 85            	popw	x
1260  0014 81            	ret	
1304                     ; 493 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1304                     ; 494 {
1305                     .text:	section	.text,new
1306  0000               _USART_SetAddress:
1308  0000 89            	pushw	x
1309       00000000      OFST:	set	0
1312                     ; 496   assert_param(IS_USART_ADDRESS(USART_Address));
1314                     ; 499   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1316  0001 e607          	ld	a,(7,x)
1317  0003 a4f0          	and	a,#240
1318  0005 e707          	ld	(7,x),a
1319                     ; 501   USARTx->CR4 |= USART_Address;
1321  0007 e607          	ld	a,(7,x)
1322  0009 1a05          	or	a,(OFST+5,sp)
1323  000b e707          	ld	(7,x),a
1324                     ; 502 }
1327  000d 85            	popw	x
1328  000e 81            	ret	
1397                     ; 512 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1397                     ; 513 {
1398                     .text:	section	.text,new
1399  0000               _USART_WakeUpConfig:
1401  0000 89            	pushw	x
1402       00000000      OFST:	set	0
1405                     ; 514   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1407                     ; 516   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1409  0001 e604          	ld	a,(4,x)
1410  0003 a4f7          	and	a,#247
1411  0005 e704          	ld	(4,x),a
1412                     ; 517   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1414  0007 e604          	ld	a,(4,x)
1415  0009 1a05          	or	a,(OFST+5,sp)
1416  000b e704          	ld	(4,x),a
1417                     ; 518 }
1420  000d 85            	popw	x
1421  000e 81            	ret	
1469                     ; 563 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1469                     ; 564 {
1470                     .text:	section	.text,new
1471  0000               _USART_HalfDuplexCmd:
1473  0000 89            	pushw	x
1474       00000000      OFST:	set	0
1477                     ; 565   assert_param(IS_FUNCTIONAL_STATE(NewState));
1479                     ; 567   if (NewState != DISABLE)
1481  0001 7b05          	ld	a,(OFST+5,sp)
1482  0003 2706          	jreq	L766
1483                     ; 569     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1485  0005 e608          	ld	a,(8,x)
1486  0007 aa08          	or	a,#8
1488  0009 2006          	jra	L176
1489  000b               L766:
1490                     ; 573     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1492  000b 1e01          	ldw	x,(OFST+1,sp)
1493  000d e608          	ld	a,(8,x)
1494  000f a4f7          	and	a,#247
1495  0011               L176:
1496  0011 e708          	ld	(8,x),a
1497                     ; 575 }
1500  0013 85            	popw	x
1501  0014 81            	ret	
1548                     ; 641 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1548                     ; 642 {
1549                     .text:	section	.text,new
1550  0000               _USART_SmartCardCmd:
1552  0000 89            	pushw	x
1553       00000000      OFST:	set	0
1556                     ; 643   assert_param(IS_FUNCTIONAL_STATE(NewState));
1558                     ; 645   if (NewState != DISABLE)
1560  0001 7b05          	ld	a,(OFST+5,sp)
1561  0003 2706          	jreq	L717
1562                     ; 648     USARTx->CR5 |= USART_CR5_SCEN;
1564  0005 e608          	ld	a,(8,x)
1565  0007 aa20          	or	a,#32
1567  0009 2006          	jra	L127
1568  000b               L717:
1569                     ; 653     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1571  000b 1e01          	ldw	x,(OFST+1,sp)
1572  000d e608          	ld	a,(8,x)
1573  000f a4df          	and	a,#223
1574  0011               L127:
1575  0011 e708          	ld	(8,x),a
1576                     ; 655 }
1579  0013 85            	popw	x
1580  0014 81            	ret	
1628                     ; 664 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1628                     ; 665 {
1629                     .text:	section	.text,new
1630  0000               _USART_SmartCardNACKCmd:
1632  0000 89            	pushw	x
1633       00000000      OFST:	set	0
1636                     ; 666   assert_param(IS_FUNCTIONAL_STATE(NewState));
1638                     ; 668   if (NewState != DISABLE)
1640  0001 7b05          	ld	a,(OFST+5,sp)
1641  0003 2706          	jreq	L747
1642                     ; 671     USARTx->CR5 |= USART_CR5_NACK;
1644  0005 e608          	ld	a,(8,x)
1645  0007 aa10          	or	a,#16
1647  0009 2006          	jra	L157
1648  000b               L747:
1649                     ; 676     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1651  000b 1e01          	ldw	x,(OFST+1,sp)
1652  000d e608          	ld	a,(8,x)
1653  000f a4ef          	and	a,#239
1654  0011               L157:
1655  0011 e708          	ld	(8,x),a
1656                     ; 678 }
1659  0013 85            	popw	x
1660  0014 81            	ret	
1704                     ; 687 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1704                     ; 688 {
1705                     .text:	section	.text,new
1706  0000               _USART_SetGuardTime:
1708  0000 89            	pushw	x
1709       00000000      OFST:	set	0
1712                     ; 690   USARTx->GTR = USART_GuardTime;
1714  0001 7b05          	ld	a,(OFST+5,sp)
1715  0003 1e01          	ldw	x,(OFST+1,sp)
1716  0005 e709          	ld	(9,x),a
1717                     ; 691 }
1720  0007 85            	popw	x
1721  0008 81            	ret	
1790                     ; 748 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1790                     ; 749 {
1791                     .text:	section	.text,new
1792  0000               _USART_IrDAConfig:
1794  0000 89            	pushw	x
1795       00000000      OFST:	set	0
1798                     ; 750   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1800                     ; 752   if (USART_IrDAMode != USART_IrDAMode_Normal)
1802  0001 7b05          	ld	a,(OFST+5,sp)
1803  0003 2706          	jreq	L1301
1804                     ; 754     USARTx->CR5 |= USART_CR5_IRLP;
1806  0005 e608          	ld	a,(8,x)
1807  0007 aa04          	or	a,#4
1809  0009 2006          	jra	L3301
1810  000b               L1301:
1811                     ; 758     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1813  000b 1e01          	ldw	x,(OFST+1,sp)
1814  000d e608          	ld	a,(8,x)
1815  000f a4fb          	and	a,#251
1816  0011               L3301:
1817  0011 e708          	ld	(8,x),a
1818                     ; 760 }
1821  0013 85            	popw	x
1822  0014 81            	ret	
1869                     ; 769 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1869                     ; 770 {
1870                     .text:	section	.text,new
1871  0000               _USART_IrDACmd:
1873  0000 89            	pushw	x
1874       00000000      OFST:	set	0
1877                     ; 773   assert_param(IS_FUNCTIONAL_STATE(NewState));
1879                     ; 775   if (NewState != DISABLE)
1881  0001 7b05          	ld	a,(OFST+5,sp)
1882  0003 2706          	jreq	L1601
1883                     ; 778     USARTx->CR5 |= USART_CR5_IREN;
1885  0005 e608          	ld	a,(8,x)
1886  0007 aa02          	or	a,#2
1888  0009 2006          	jra	L3601
1889  000b               L1601:
1890                     ; 783     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1892  000b 1e01          	ldw	x,(OFST+1,sp)
1893  000d e608          	ld	a,(8,x)
1894  000f a4fd          	and	a,#253
1895  0011               L3601:
1896  0011 e708          	ld	(8,x),a
1897                     ; 785 }
1900  0013 85            	popw	x
1901  0014 81            	ret	
1978                     ; 815 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
1978                     ; 816                   FunctionalState NewState)
1978                     ; 817 {
1979                     .text:	section	.text,new
1980  0000               _USART_DMACmd:
1982  0000 89            	pushw	x
1983       00000000      OFST:	set	0
1986                     ; 819   assert_param(IS_USART_DMAREQ(USART_DMAReq));
1988                     ; 820   assert_param(IS_FUNCTIONAL_STATE(NewState));
1990                     ; 822   if (NewState != DISABLE)
1992  0001 7b06          	ld	a,(OFST+6,sp)
1993  0003 2706          	jreq	L5211
1994                     ; 826     USARTx->CR5 |= (uint8_t) USART_DMAReq;
1996  0005 e608          	ld	a,(8,x)
1997  0007 1a05          	or	a,(OFST+5,sp)
1999  0009 2007          	jra	L7211
2000  000b               L5211:
2001                     ; 832     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
2003  000b 1e01          	ldw	x,(OFST+1,sp)
2004  000d 7b05          	ld	a,(OFST+5,sp)
2005  000f 43            	cpl	a
2006  0010 e408          	and	a,(8,x)
2007  0012               L7211:
2008  0012 e708          	ld	(8,x),a
2009                     ; 834 }
2012  0014 85            	popw	x
2013  0015 81            	ret	
2153                     ; 936 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2153                     ; 937 {
2154                     .text:	section	.text,new
2155  0000               _USART_ITConfig:
2157  0000 89            	pushw	x
2158  0001 89            	pushw	x
2159       00000002      OFST:	set	2
2162                     ; 938   uint8_t usartreg, itpos = 0x00;
2164                     ; 939   assert_param(IS_USART_CONFIG_IT(USART_IT));
2166                     ; 940   assert_param(IS_FUNCTIONAL_STATE(NewState));
2168                     ; 943   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2170  0002 7b07          	ld	a,(OFST+5,sp)
2171  0004 6b01          	ld	(OFST-1,sp),a
2172                     ; 945   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2174  0006 7b08          	ld	a,(OFST+6,sp)
2175  0008 a40f          	and	a,#15
2176  000a 5f            	clrw	x
2177  000b 97            	ld	xl,a
2178  000c a601          	ld	a,#1
2179  000e 5d            	tnzw	x
2180  000f 2704          	jreq	L06
2181  0011               L26:
2182  0011 48            	sll	a
2183  0012 5a            	decw	x
2184  0013 26fc          	jrne	L26
2185  0015               L06:
2186  0015 6b02          	ld	(OFST+0,sp),a
2187                     ; 947   if (NewState != DISABLE)
2189  0017 7b09          	ld	a,(OFST+7,sp)
2190  0019 2722          	jreq	L3121
2191                     ; 950     if (usartreg == 0x01)
2193  001b 7b01          	ld	a,(OFST-1,sp)
2194  001d a101          	cp	a,#1
2195  001f 2608          	jrne	L5121
2196                     ; 952       USARTx->CR1 |= itpos;
2198  0021 1e03          	ldw	x,(OFST+1,sp)
2199  0023 e604          	ld	a,(4,x)
2200  0025 1a02          	or	a,(OFST+0,sp)
2202  0027 2021          	jp	LC002
2203  0029               L5121:
2204                     ; 954     else if (usartreg == 0x05)
2206  0029 a105          	cp	a,#5
2207  002b 2608          	jrne	L1221
2208                     ; 956       USARTx->CR5 |= itpos;
2210  002d 1e03          	ldw	x,(OFST+1,sp)
2211  002f e608          	ld	a,(8,x)
2212  0031 1a02          	or	a,(OFST+0,sp)
2214  0033 2024          	jp	LC003
2215  0035               L1221:
2216                     ; 961       USARTx->CR2 |= itpos;
2218  0035 1e03          	ldw	x,(OFST+1,sp)
2219  0037 e605          	ld	a,(5,x)
2220  0039 1a02          	or	a,(OFST+0,sp)
2221  003b 2027          	jp	LC001
2222  003d               L3121:
2223                     ; 967     if (usartreg == 0x01)
2225  003d 7b01          	ld	a,(OFST-1,sp)
2226  003f a101          	cp	a,#1
2227  0041 260b          	jrne	L7221
2228                     ; 969       USARTx->CR1 &= (uint8_t)(~itpos);
2230  0043 1e03          	ldw	x,(OFST+1,sp)
2231  0045 7b02          	ld	a,(OFST+0,sp)
2232  0047 43            	cpl	a
2233  0048 e404          	and	a,(4,x)
2234  004a               LC002:
2235  004a e704          	ld	(4,x),a
2237  004c 2018          	jra	L5221
2238  004e               L7221:
2239                     ; 971     else if (usartreg == 0x05)
2241  004e a105          	cp	a,#5
2242  0050 260b          	jrne	L3321
2243                     ; 973       USARTx->CR5 &= (uint8_t)(~itpos);
2245  0052 1e03          	ldw	x,(OFST+1,sp)
2246  0054 7b02          	ld	a,(OFST+0,sp)
2247  0056 43            	cpl	a
2248  0057 e408          	and	a,(8,x)
2249  0059               LC003:
2250  0059 e708          	ld	(8,x),a
2252  005b 2009          	jra	L5221
2253  005d               L3321:
2254                     ; 978       USARTx->CR2 &= (uint8_t)(~itpos);
2256  005d 1e03          	ldw	x,(OFST+1,sp)
2257  005f 7b02          	ld	a,(OFST+0,sp)
2258  0061 43            	cpl	a
2259  0062 e405          	and	a,(5,x)
2260  0064               LC001:
2261  0064 e705          	ld	(5,x),a
2262  0066               L5221:
2263                     ; 981 }
2266  0066 5b04          	addw	sp,#4
2267  0068 81            	ret	
2415                     ; 999 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2415                     ; 1000 {
2416                     .text:	section	.text,new
2417  0000               _USART_GetFlagStatus:
2419  0000 89            	pushw	x
2420  0001 88            	push	a
2421       00000001      OFST:	set	1
2424                     ; 1001   FlagStatus status = RESET;
2426                     ; 1004   assert_param(IS_USART_FLAG(USART_FLAG));
2428                     ; 1006   if (USART_FLAG == USART_FLAG_SBK)
2430  0002 1e06          	ldw	x,(OFST+5,sp)
2431  0004 a30101        	cpw	x,#257
2432  0007 260a          	jrne	L5231
2433                     ; 1008     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2435  0009 1e02          	ldw	x,(OFST+1,sp)
2436  000b e605          	ld	a,(5,x)
2437  000d 1507          	bcp	a,(OFST+6,sp)
2438  000f 270d          	jreq	L5331
2439                     ; 1011       status = SET;
2441  0011 2007          	jp	LC005
2442                     ; 1016       status = RESET;
2443  0013               L5231:
2444                     ; 1021     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2446  0013 1e02          	ldw	x,(OFST+1,sp)
2447  0015 f6            	ld	a,(x)
2448  0016 1507          	bcp	a,(OFST+6,sp)
2449  0018 2704          	jreq	L5331
2450                     ; 1024       status = SET;
2452  001a               LC005:
2454  001a a601          	ld	a,#1
2456  001c 2001          	jra	L3331
2457  001e               L5331:
2458                     ; 1029       status = RESET;
2461  001e 4f            	clr	a
2462  001f               L3331:
2463                     ; 1033   return status;
2467  001f 5b03          	addw	sp,#3
2468  0021 81            	ret	
2515                     ; 1057 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2515                     ; 1058 {
2516                     .text:	section	.text,new
2517  0000               _USART_ClearFlag:
2519  0000 89            	pushw	x
2520       00000000      OFST:	set	0
2523                     ; 1060   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2525                     ; 1062   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2527  0001 7b06          	ld	a,(OFST+6,sp)
2528  0003 43            	cpl	a
2529  0004 1e01          	ldw	x,(OFST+1,sp)
2530  0006 f7            	ld	(x),a
2531                     ; 1063 }
2534  0007 85            	popw	x
2535  0008 81            	ret	
2628                     ; 1080 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2628                     ; 1081 {
2629                     .text:	section	.text,new
2630  0000               _USART_GetITStatus:
2632  0000 89            	pushw	x
2633  0001 5203          	subw	sp,#3
2634       00000003      OFST:	set	3
2637                     ; 1082   ITStatus pendingbitstatus = RESET;
2639                     ; 1083   uint8_t temp = 0;
2641                     ; 1084   uint8_t itpos = 0;
2643                     ; 1085   uint8_t itmask1 = 0;
2645                     ; 1086   uint8_t itmask2 = 0;
2647                     ; 1087   uint8_t enablestatus = 0;
2649                     ; 1090   assert_param(IS_USART_GET_IT(USART_IT));
2651                     ; 1093   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2653  0003 7b09          	ld	a,(OFST+6,sp)
2654  0005 a40f          	and	a,#15
2655  0007 5f            	clrw	x
2656  0008 97            	ld	xl,a
2657  0009 a601          	ld	a,#1
2658  000b 5d            	tnzw	x
2659  000c 2704          	jreq	L27
2660  000e               L47:
2661  000e 48            	sll	a
2662  000f 5a            	decw	x
2663  0010 26fc          	jrne	L47
2664  0012               L27:
2665  0012 6b02          	ld	(OFST-1,sp),a
2666                     ; 1095   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2668  0014 7b09          	ld	a,(OFST+6,sp)
2669  0016 4e            	swap	a
2670  0017 a40f          	and	a,#15
2671  0019 6b03          	ld	(OFST+0,sp),a
2672                     ; 1097   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2674  001b 5f            	clrw	x
2675  001c 97            	ld	xl,a
2676  001d a601          	ld	a,#1
2677  001f 5d            	tnzw	x
2678  0020 2704          	jreq	L67
2679  0022               L001:
2680  0022 48            	sll	a
2681  0023 5a            	decw	x
2682  0024 26fc          	jrne	L001
2683  0026               L67:
2684  0026 6b03          	ld	(OFST+0,sp),a
2685                     ; 1100   if (USART_IT == USART_IT_PE)
2687  0028 1e08          	ldw	x,(OFST+5,sp)
2688  002a a30100        	cpw	x,#256
2689  002d 2611          	jrne	L7241
2690                     ; 1103     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2692  002f 1e04          	ldw	x,(OFST+1,sp)
2693  0031 e604          	ld	a,(4,x)
2694  0033 1403          	and	a,(OFST+0,sp)
2695  0035 6b03          	ld	(OFST+0,sp),a
2696                     ; 1106     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2698  0037 f6            	ld	a,(x)
2699  0038 1502          	bcp	a,(OFST-1,sp)
2700  003a 2739          	jreq	L1541
2702  003c 7b03          	ld	a,(OFST+0,sp)
2703                     ; 1109       pendingbitstatus = SET;
2705  003e 201e          	jp	LC008
2706                     ; 1114       pendingbitstatus = RESET;
2707  0040               L7241:
2708                     ; 1118   else if (USART_IT == USART_IT_OR)
2710  0040 a30235        	cpw	x,#565
2711  0043 261f          	jrne	L7341
2712                     ; 1121     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2714  0045 1e04          	ldw	x,(OFST+1,sp)
2715  0047 e605          	ld	a,(5,x)
2716  0049 1403          	and	a,(OFST+0,sp)
2717  004b 6b03          	ld	(OFST+0,sp),a
2718                     ; 1124     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2720  004d e608          	ld	a,(8,x)
2721  004f a401          	and	a,#1
2722  0051 6b01          	ld	(OFST-2,sp),a
2723                     ; 1126     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2725  0053 f6            	ld	a,(x)
2726  0054 1502          	bcp	a,(OFST-1,sp)
2727  0056 271d          	jreq	L1541
2729  0058 7b03          	ld	a,(OFST+0,sp)
2730  005a 2604          	jrne	L3441
2732  005c 7b01          	ld	a,(OFST-2,sp)
2733  005e               LC008:
2734  005e 2715          	jreq	L1541
2735  0060               L3441:
2736                     ; 1129       pendingbitstatus = SET;
2740  0060 a601          	ld	a,#1
2742  0062 2012          	jra	L5341
2743                     ; 1134       pendingbitstatus = RESET;
2744  0064               L7341:
2745                     ; 1141     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2747  0064 1e04          	ldw	x,(OFST+1,sp)
2748  0066 e605          	ld	a,(5,x)
2749  0068 1403          	and	a,(OFST+0,sp)
2750  006a 6b03          	ld	(OFST+0,sp),a
2751                     ; 1143     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2753  006c f6            	ld	a,(x)
2754  006d 1502          	bcp	a,(OFST-1,sp)
2755  006f 2704          	jreq	L1541
2757  0071 7b03          	ld	a,(OFST+0,sp)
2758                     ; 1146       pendingbitstatus = SET;
2760  0073 26eb          	jrne	L3441
2761  0075               L1541:
2762                     ; 1151       pendingbitstatus = RESET;
2766  0075 4f            	clr	a
2767  0076               L5341:
2768                     ; 1156   return  pendingbitstatus;
2772  0076 5b05          	addw	sp,#5
2773  0078 81            	ret	
2811                     ; 1180 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2811                     ; 1181 {
2812                     .text:	section	.text,new
2813  0000               _USART_ClearITPendingBit:
2817                     ; 1182   assert_param(IS_USART_CLEAR_IT(USART_IT));
2819                     ; 1185   USARTx->SR &= (uint8_t)(~USART_SR_TC);
2821  0000 f6            	ld	a,(x)
2822  0001 a4bf          	and	a,#191
2823  0003 f7            	ld	(x),a
2824                     ; 1186 }
2827  0004 81            	ret	
2840                     	xdef	_USART_ClearITPendingBit
2841                     	xdef	_USART_GetITStatus
2842                     	xdef	_USART_ClearFlag
2843                     	xdef	_USART_GetFlagStatus
2844                     	xdef	_USART_ITConfig
2845                     	xdef	_USART_DMACmd
2846                     	xdef	_USART_IrDACmd
2847                     	xdef	_USART_IrDAConfig
2848                     	xdef	_USART_SetGuardTime
2849                     	xdef	_USART_SmartCardNACKCmd
2850                     	xdef	_USART_SmartCardCmd
2851                     	xdef	_USART_HalfDuplexCmd
2852                     	xdef	_USART_SetAddress
2853                     	xdef	_USART_ReceiverWakeUpCmd
2854                     	xdef	_USART_WakeUpConfig
2855                     	xdef	_USART_ReceiveData9
2856                     	xdef	_USART_ReceiveData8
2857                     	xdef	_USART_SendData9
2858                     	xdef	_USART_SendData8
2859                     	xdef	_USART_SendBreak
2860                     	xdef	_USART_SetPrescaler
2861                     	xdef	_USART_Cmd
2862                     	xdef	_USART_ClockInit
2863                     	xdef	_USART_Init
2864                     	xdef	_USART_DeInit
2865                     	xref	_CLK_GetClockFreq
2866                     	xref.b	c_lreg
2867                     	xref.b	c_x
2886                     	xref	c_lursh
2887                     	xref	c_ltor
2888                     	xref	c_rtol
2889                     	xref	c_ludv
2890                     	end
