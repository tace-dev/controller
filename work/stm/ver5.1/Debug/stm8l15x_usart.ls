   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 169                     ; 145 void USART_DeInit(USART_TypeDef* USARTx)
 169                     ; 146 {
 171                     	switch	.text
 172  0000               _USART_DeInit:
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
 203  000f 81            	ret	
 391                     ; 189 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 391                     ; 190                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 391                     ; 191                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 391                     ; 192 {
 392                     	switch	.text
 393  0010               _USART_Init:
 395  0010 89            	pushw	x
 396  0011 5204          	subw	sp,#4
 397       00000004      OFST:	set	4
 400                     ; 193   uint32_t BaudRate_Mantissa = 0;
 402                     ; 196   assert_param(IS_USART_BAUDRATE(BaudRate));
 404                     ; 198   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 406                     ; 200   assert_param(IS_USART_STOPBITS(USART_StopBits));
 408                     ; 202   assert_param(IS_USART_PARITY(USART_Parity));
 410                     ; 204   assert_param(IS_USART_MODE(USART_Mode));
 412                     ; 207   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 414  0013 e604          	ld	a,(4,x)
 415  0015 a4e9          	and	a,#233
 416  0017 e704          	ld	(4,x),a
 417                     ; 210   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 419  0019 7b0d          	ld	a,(OFST+9,sp)
 420  001b 1a0f          	or	a,(OFST+11,sp)
 421  001d ea04          	or	a,(4,x)
 422  001f e704          	ld	(4,x),a
 423                     ; 213   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 425  0021 e606          	ld	a,(6,x)
 426  0023 a4cf          	and	a,#207
 427  0025 e706          	ld	(6,x),a
 428                     ; 215   USARTx->CR3 |= (uint8_t)USART_StopBits;
 430  0027 e606          	ld	a,(6,x)
 431  0029 1a0e          	or	a,(OFST+10,sp)
 432  002b e706          	ld	(6,x),a
 433                     ; 218   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 435  002d 6f02          	clr	(2,x)
 436                     ; 220   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 438  002f e603          	ld	a,(3,x)
 439  0031 a40f          	and	a,#15
 440  0033 e703          	ld	(3,x),a
 441                     ; 222   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 443  0035 e603          	ld	a,(3,x)
 444  0037 a4f0          	and	a,#240
 445  0039 e703          	ld	(3,x),a
 446                     ; 224   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 448  003b cd0000        	call	_CLK_GetClockFreq
 450  003e 96            	ldw	x,sp
 451  003f 1c0009        	addw	x,#OFST+5
 452  0042 cd0000        	call	c_ludv
 454  0045 96            	ldw	x,sp
 455  0046 5c            	incw	x
 456  0047 cd0000        	call	c_rtol
 458                     ; 226   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 460  004a 7b03          	ld	a,(OFST-1,sp)
 461  004c a4f0          	and	a,#240
 462  004e 1e05          	ldw	x,(OFST+1,sp)
 463  0050 e703          	ld	(3,x),a
 464                     ; 228   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 466  0052 7b04          	ld	a,(OFST+0,sp)
 467  0054 a40f          	and	a,#15
 468  0056 ea03          	or	a,(3,x)
 469  0058 e703          	ld	(3,x),a
 470                     ; 230   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 472  005a 96            	ldw	x,sp
 473  005b 5c            	incw	x
 474  005c cd0000        	call	c_ltor
 476  005f a604          	ld	a,#4
 477  0061 cd0000        	call	c_lursh
 479  0064 b603          	ld	a,c_lreg+3
 480  0066 1e05          	ldw	x,(OFST+1,sp)
 481  0068 e702          	ld	(2,x),a
 482                     ; 233   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 484  006a e605          	ld	a,(5,x)
 485  006c a4f3          	and	a,#243
 486  006e e705          	ld	(5,x),a
 487                     ; 235   USARTx->CR2 |= (uint8_t)USART_Mode;
 489  0070 e605          	ld	a,(5,x)
 490  0072 1a10          	or	a,(OFST+12,sp)
 491  0074 e705          	ld	(5,x),a
 492                     ; 236 }
 495  0076 5b06          	addw	sp,#6
 496  0078 81            	ret	
 656                     ; 261 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 656                     ; 262                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 656                     ; 263                      USART_LastBit_TypeDef USART_LastBit)
 656                     ; 264 {
 657                     	switch	.text
 658  0079               _USART_ClockInit:
 660  0079 89            	pushw	x
 661       00000000      OFST:	set	0
 664                     ; 266   assert_param(IS_USART_CLOCK(USART_Clock));
 666                     ; 267   assert_param(IS_USART_CPOL(USART_CPOL));
 668                     ; 268   assert_param(IS_USART_CPHA(USART_CPHA));
 670                     ; 269   assert_param(IS_USART_LASTBIT(USART_LastBit));
 672                     ; 272   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 674  007a e606          	ld	a,(6,x)
 675  007c a4f8          	and	a,#248
 676  007e e706          	ld	(6,x),a
 677                     ; 274   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 679  0080 7b06          	ld	a,(OFST+6,sp)
 680  0082 1a07          	or	a,(OFST+7,sp)
 681  0084 1a08          	or	a,(OFST+8,sp)
 682  0086 ea06          	or	a,(6,x)
 683  0088 e706          	ld	(6,x),a
 684                     ; 276   if (USART_Clock != USART_Clock_Disable)
 686  008a 7b05          	ld	a,(OFST+5,sp)
 687  008c 2706          	jreq	L123
 688                     ; 278     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 690  008e e606          	ld	a,(6,x)
 691  0090 aa08          	or	a,#8
 693  0092 2006          	jra	L323
 694  0094               L123:
 695                     ; 282     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 697  0094 1e01          	ldw	x,(OFST+1,sp)
 698  0096 e606          	ld	a,(6,x)
 699  0098 a4f7          	and	a,#247
 700  009a               L323:
 701  009a e706          	ld	(6,x),a
 702                     ; 284 }
 705  009c 85            	popw	x
 706  009d 81            	ret	
 773                     ; 293 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 773                     ; 294 {
 774                     	switch	.text
 775  009e               _USART_Cmd:
 777  009e 89            	pushw	x
 778       00000000      OFST:	set	0
 781                     ; 295   if (NewState != DISABLE)
 783  009f 7b05          	ld	a,(OFST+5,sp)
 784  00a1 2706          	jreq	L163
 785                     ; 297     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 787  00a3 e604          	ld	a,(4,x)
 788  00a5 a4df          	and	a,#223
 790  00a7 2006          	jra	L363
 791  00a9               L163:
 792                     ; 301     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 794  00a9 1e01          	ldw	x,(OFST+1,sp)
 795  00ab e604          	ld	a,(4,x)
 796  00ad aa20          	or	a,#32
 797  00af               L363:
 798  00af e704          	ld	(4,x),a
 799                     ; 303 }
 802  00b1 85            	popw	x
 803  00b2 81            	ret	
 847                     ; 326 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 847                     ; 327 {
 848                     	switch	.text
 849  00b3               _USART_SetPrescaler:
 851  00b3 89            	pushw	x
 852       00000000      OFST:	set	0
 855                     ; 329   USARTx->PSCR = USART_Prescaler;
 857  00b4 7b05          	ld	a,(OFST+5,sp)
 858  00b6 1e01          	ldw	x,(OFST+1,sp)
 859  00b8 e70a          	ld	(10,x),a
 860                     ; 330 }
 863  00ba 85            	popw	x
 864  00bb 81            	ret	
 901                     ; 337 void USART_SendBreak(USART_TypeDef* USARTx)
 901                     ; 338 {
 902                     	switch	.text
 903  00bc               _USART_SendBreak:
 907                     ; 339   USARTx->CR2 |= USART_CR2_SBK;
 909  00bc e605          	ld	a,(5,x)
 910  00be aa01          	or	a,#1
 911  00c0 e705          	ld	(5,x),a
 912                     ; 340 }
 915  00c2 81            	ret	
 952                     ; 379 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 952                     ; 380 {
 953                     	switch	.text
 954  00c3               _USART_ReceiveData8:
 958                     ; 381   return USARTx->DR;
 960  00c3 e601          	ld	a,(1,x)
 963  00c5 81            	ret	
1007                     ; 389 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1007                     ; 390 {
1008                     	switch	.text
1009  00c6               _USART_ReceiveData9:
1011  00c6 89            	pushw	x
1012  00c7 89            	pushw	x
1013       00000002      OFST:	set	2
1016                     ; 391   uint16_t temp = 0;
1018                     ; 393   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1020  00c8 e604          	ld	a,(4,x)
1021  00ca a480          	and	a,#128
1022  00cc 5f            	clrw	x
1023  00cd 02            	rlwa	x,a
1024  00ce 58            	sllw	x
1025  00cf 1f01          	ldw	(OFST-1,sp),x
1026                     ; 394   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1028  00d1 1e03          	ldw	x,(OFST+1,sp)
1029  00d3 e601          	ld	a,(1,x)
1030  00d5 5f            	clrw	x
1031  00d6 97            	ld	xl,a
1032  00d7 01            	rrwa	x,a
1033  00d8 1a02          	or	a,(OFST+0,sp)
1034  00da 01            	rrwa	x,a
1035  00db 1a01          	or	a,(OFST-1,sp)
1036  00dd a401          	and	a,#1
1037  00df 01            	rrwa	x,a
1040  00e0 5b04          	addw	sp,#4
1041  00e2 81            	ret	
1085                     ; 402 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1085                     ; 403 {
1086                     	switch	.text
1087  00e3               _USART_SendData8:
1089  00e3 89            	pushw	x
1090       00000000      OFST:	set	0
1093                     ; 405   USARTx->DR = Data;
1095  00e4 7b05          	ld	a,(OFST+5,sp)
1096  00e6 1e01          	ldw	x,(OFST+1,sp)
1097  00e8 e701          	ld	(1,x),a
1098                     ; 406 }
1101  00ea 85            	popw	x
1102  00eb 81            	ret	
1146                     ; 415 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1146                     ; 416 {
1147                     	switch	.text
1148  00ec               _USART_SendData9:
1150  00ec 89            	pushw	x
1151       00000000      OFST:	set	0
1154                     ; 417   assert_param(IS_USART_DATA_9BITS(Data));
1156                     ; 420   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1158  00ed e604          	ld	a,(4,x)
1159  00ef a4bf          	and	a,#191
1160  00f1 e704          	ld	(4,x),a
1161                     ; 423   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1163  00f3 1605          	ldw	y,(OFST+5,sp)
1164  00f5 9054          	srlw	y
1165  00f7 9054          	srlw	y
1166  00f9 909f          	ld	a,yl
1167  00fb a440          	and	a,#64
1168  00fd ea04          	or	a,(4,x)
1169  00ff e704          	ld	(4,x),a
1170                     ; 426   USARTx->DR   = (uint8_t)(Data);
1172  0101 7b06          	ld	a,(OFST+6,sp)
1173  0103 1e01          	ldw	x,(OFST+1,sp)
1174  0105 e701          	ld	(1,x),a
1175                     ; 427 }
1178  0107 85            	popw	x
1179  0108 81            	ret	
1227                     ; 470 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1227                     ; 471 {
1228                     	switch	.text
1229  0109               _USART_ReceiverWakeUpCmd:
1231  0109 89            	pushw	x
1232       00000000      OFST:	set	0
1235                     ; 472   assert_param(IS_FUNCTIONAL_STATE(NewState));
1237                     ; 474   if (NewState != DISABLE)
1239  010a 7b05          	ld	a,(OFST+5,sp)
1240  010c 2706          	jreq	L165
1241                     ; 477     USARTx->CR2 |= USART_CR2_RWU;
1243  010e e605          	ld	a,(5,x)
1244  0110 aa02          	or	a,#2
1246  0112 2006          	jra	L365
1247  0114               L165:
1248                     ; 482     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1250  0114 1e01          	ldw	x,(OFST+1,sp)
1251  0116 e605          	ld	a,(5,x)
1252  0118 a4fd          	and	a,#253
1253  011a               L365:
1254  011a e705          	ld	(5,x),a
1255                     ; 484 }
1258  011c 85            	popw	x
1259  011d 81            	ret	
1303                     ; 493 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1303                     ; 494 {
1304                     	switch	.text
1305  011e               _USART_SetAddress:
1307  011e 89            	pushw	x
1308       00000000      OFST:	set	0
1311                     ; 496   assert_param(IS_USART_ADDRESS(USART_Address));
1313                     ; 499   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1315  011f e607          	ld	a,(7,x)
1316  0121 a4f0          	and	a,#240
1317  0123 e707          	ld	(7,x),a
1318                     ; 501   USARTx->CR4 |= USART_Address;
1320  0125 e607          	ld	a,(7,x)
1321  0127 1a05          	or	a,(OFST+5,sp)
1322  0129 e707          	ld	(7,x),a
1323                     ; 502 }
1326  012b 85            	popw	x
1327  012c 81            	ret	
1396                     ; 512 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1396                     ; 513 {
1397                     	switch	.text
1398  012d               _USART_WakeUpConfig:
1400  012d 89            	pushw	x
1401       00000000      OFST:	set	0
1404                     ; 514   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1406                     ; 516   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1408  012e e604          	ld	a,(4,x)
1409  0130 a4f7          	and	a,#247
1410  0132 e704          	ld	(4,x),a
1411                     ; 517   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1413  0134 e604          	ld	a,(4,x)
1414  0136 1a05          	or	a,(OFST+5,sp)
1415  0138 e704          	ld	(4,x),a
1416                     ; 518 }
1419  013a 85            	popw	x
1420  013b 81            	ret	
1468                     ; 563 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1468                     ; 564 {
1469                     	switch	.text
1470  013c               _USART_HalfDuplexCmd:
1472  013c 89            	pushw	x
1473       00000000      OFST:	set	0
1476                     ; 565   assert_param(IS_FUNCTIONAL_STATE(NewState));
1478                     ; 567   if (NewState != DISABLE)
1480  013d 7b05          	ld	a,(OFST+5,sp)
1481  013f 2706          	jreq	L766
1482                     ; 569     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1484  0141 e608          	ld	a,(8,x)
1485  0143 aa08          	or	a,#8
1487  0145 2006          	jra	L176
1488  0147               L766:
1489                     ; 573     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1491  0147 1e01          	ldw	x,(OFST+1,sp)
1492  0149 e608          	ld	a,(8,x)
1493  014b a4f7          	and	a,#247
1494  014d               L176:
1495  014d e708          	ld	(8,x),a
1496                     ; 575 }
1499  014f 85            	popw	x
1500  0150 81            	ret	
1547                     ; 641 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1547                     ; 642 {
1548                     	switch	.text
1549  0151               _USART_SmartCardCmd:
1551  0151 89            	pushw	x
1552       00000000      OFST:	set	0
1555                     ; 643   assert_param(IS_FUNCTIONAL_STATE(NewState));
1557                     ; 645   if (NewState != DISABLE)
1559  0152 7b05          	ld	a,(OFST+5,sp)
1560  0154 2706          	jreq	L717
1561                     ; 648     USARTx->CR5 |= USART_CR5_SCEN;
1563  0156 e608          	ld	a,(8,x)
1564  0158 aa20          	or	a,#32
1566  015a 2006          	jra	L127
1567  015c               L717:
1568                     ; 653     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1570  015c 1e01          	ldw	x,(OFST+1,sp)
1571  015e e608          	ld	a,(8,x)
1572  0160 a4df          	and	a,#223
1573  0162               L127:
1574  0162 e708          	ld	(8,x),a
1575                     ; 655 }
1578  0164 85            	popw	x
1579  0165 81            	ret	
1627                     ; 664 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1627                     ; 665 {
1628                     	switch	.text
1629  0166               _USART_SmartCardNACKCmd:
1631  0166 89            	pushw	x
1632       00000000      OFST:	set	0
1635                     ; 666   assert_param(IS_FUNCTIONAL_STATE(NewState));
1637                     ; 668   if (NewState != DISABLE)
1639  0167 7b05          	ld	a,(OFST+5,sp)
1640  0169 2706          	jreq	L747
1641                     ; 671     USARTx->CR5 |= USART_CR5_NACK;
1643  016b e608          	ld	a,(8,x)
1644  016d aa10          	or	a,#16
1646  016f 2006          	jra	L157
1647  0171               L747:
1648                     ; 676     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1650  0171 1e01          	ldw	x,(OFST+1,sp)
1651  0173 e608          	ld	a,(8,x)
1652  0175 a4ef          	and	a,#239
1653  0177               L157:
1654  0177 e708          	ld	(8,x),a
1655                     ; 678 }
1658  0179 85            	popw	x
1659  017a 81            	ret	
1703                     ; 687 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1703                     ; 688 {
1704                     	switch	.text
1705  017b               _USART_SetGuardTime:
1707  017b 89            	pushw	x
1708       00000000      OFST:	set	0
1711                     ; 690   USARTx->GTR = USART_GuardTime;
1713  017c 7b05          	ld	a,(OFST+5,sp)
1714  017e 1e01          	ldw	x,(OFST+1,sp)
1715  0180 e709          	ld	(9,x),a
1716                     ; 691 }
1719  0182 85            	popw	x
1720  0183 81            	ret	
1789                     ; 748 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1789                     ; 749 {
1790                     	switch	.text
1791  0184               _USART_IrDAConfig:
1793  0184 89            	pushw	x
1794       00000000      OFST:	set	0
1797                     ; 750   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1799                     ; 752   if (USART_IrDAMode != USART_IrDAMode_Normal)
1801  0185 7b05          	ld	a,(OFST+5,sp)
1802  0187 2706          	jreq	L1301
1803                     ; 754     USARTx->CR5 |= USART_CR5_IRLP;
1805  0189 e608          	ld	a,(8,x)
1806  018b aa04          	or	a,#4
1808  018d 2006          	jra	L3301
1809  018f               L1301:
1810                     ; 758     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1812  018f 1e01          	ldw	x,(OFST+1,sp)
1813  0191 e608          	ld	a,(8,x)
1814  0193 a4fb          	and	a,#251
1815  0195               L3301:
1816  0195 e708          	ld	(8,x),a
1817                     ; 760 }
1820  0197 85            	popw	x
1821  0198 81            	ret	
1868                     ; 769 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1868                     ; 770 {
1869                     	switch	.text
1870  0199               _USART_IrDACmd:
1872  0199 89            	pushw	x
1873       00000000      OFST:	set	0
1876                     ; 773   assert_param(IS_FUNCTIONAL_STATE(NewState));
1878                     ; 775   if (NewState != DISABLE)
1880  019a 7b05          	ld	a,(OFST+5,sp)
1881  019c 2706          	jreq	L1601
1882                     ; 778     USARTx->CR5 |= USART_CR5_IREN;
1884  019e e608          	ld	a,(8,x)
1885  01a0 aa02          	or	a,#2
1887  01a2 2006          	jra	L3601
1888  01a4               L1601:
1889                     ; 783     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1891  01a4 1e01          	ldw	x,(OFST+1,sp)
1892  01a6 e608          	ld	a,(8,x)
1893  01a8 a4fd          	and	a,#253
1894  01aa               L3601:
1895  01aa e708          	ld	(8,x),a
1896                     ; 785 }
1899  01ac 85            	popw	x
1900  01ad 81            	ret	
1977                     ; 815 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
1977                     ; 816                   FunctionalState NewState)
1977                     ; 817 {
1978                     	switch	.text
1979  01ae               _USART_DMACmd:
1981  01ae 89            	pushw	x
1982       00000000      OFST:	set	0
1985                     ; 819   assert_param(IS_USART_DMAREQ(USART_DMAReq));
1987                     ; 820   assert_param(IS_FUNCTIONAL_STATE(NewState));
1989                     ; 822   if (NewState != DISABLE)
1991  01af 7b06          	ld	a,(OFST+6,sp)
1992  01b1 2706          	jreq	L5211
1993                     ; 826     USARTx->CR5 |= (uint8_t) USART_DMAReq;
1995  01b3 e608          	ld	a,(8,x)
1996  01b5 1a05          	or	a,(OFST+5,sp)
1998  01b7 2007          	jra	L7211
1999  01b9               L5211:
2000                     ; 832     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
2002  01b9 1e01          	ldw	x,(OFST+1,sp)
2003  01bb 7b05          	ld	a,(OFST+5,sp)
2004  01bd 43            	cpl	a
2005  01be e408          	and	a,(8,x)
2006  01c0               L7211:
2007  01c0 e708          	ld	(8,x),a
2008                     ; 834 }
2011  01c2 85            	popw	x
2012  01c3 81            	ret	
2152                     ; 936 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2152                     ; 937 {
2153                     	switch	.text
2154  01c4               _USART_ITConfig:
2156  01c4 89            	pushw	x
2157  01c5 89            	pushw	x
2158       00000002      OFST:	set	2
2161                     ; 938   uint8_t usartreg, itpos = 0x00;
2163                     ; 939   assert_param(IS_USART_CONFIG_IT(USART_IT));
2165                     ; 940   assert_param(IS_FUNCTIONAL_STATE(NewState));
2167                     ; 943   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2169  01c6 7b07          	ld	a,(OFST+5,sp)
2170  01c8 6b01          	ld	(OFST-1,sp),a
2171                     ; 945   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2173  01ca 7b08          	ld	a,(OFST+6,sp)
2174  01cc a40f          	and	a,#15
2175  01ce 5f            	clrw	x
2176  01cf 97            	ld	xl,a
2177  01d0 a601          	ld	a,#1
2178  01d2 5d            	tnzw	x
2179  01d3 2704          	jreq	L06
2180  01d5               L26:
2181  01d5 48            	sll	a
2182  01d6 5a            	decw	x
2183  01d7 26fc          	jrne	L26
2184  01d9               L06:
2185  01d9 6b02          	ld	(OFST+0,sp),a
2186                     ; 947   if (NewState != DISABLE)
2188  01db 7b09          	ld	a,(OFST+7,sp)
2189  01dd 2722          	jreq	L3121
2190                     ; 950     if (usartreg == 0x01)
2192  01df 7b01          	ld	a,(OFST-1,sp)
2193  01e1 a101          	cp	a,#1
2194  01e3 2608          	jrne	L5121
2195                     ; 952       USARTx->CR1 |= itpos;
2197  01e5 1e03          	ldw	x,(OFST+1,sp)
2198  01e7 e604          	ld	a,(4,x)
2199  01e9 1a02          	or	a,(OFST+0,sp)
2201  01eb 2021          	jp	LC002
2202  01ed               L5121:
2203                     ; 954     else if (usartreg == 0x05)
2205  01ed a105          	cp	a,#5
2206  01ef 2608          	jrne	L1221
2207                     ; 956       USARTx->CR5 |= itpos;
2209  01f1 1e03          	ldw	x,(OFST+1,sp)
2210  01f3 e608          	ld	a,(8,x)
2211  01f5 1a02          	or	a,(OFST+0,sp)
2213  01f7 2024          	jp	LC003
2214  01f9               L1221:
2215                     ; 961       USARTx->CR2 |= itpos;
2217  01f9 1e03          	ldw	x,(OFST+1,sp)
2218  01fb e605          	ld	a,(5,x)
2219  01fd 1a02          	or	a,(OFST+0,sp)
2220  01ff 2027          	jp	LC001
2221  0201               L3121:
2222                     ; 967     if (usartreg == 0x01)
2224  0201 7b01          	ld	a,(OFST-1,sp)
2225  0203 a101          	cp	a,#1
2226  0205 260b          	jrne	L7221
2227                     ; 969       USARTx->CR1 &= (uint8_t)(~itpos);
2229  0207 1e03          	ldw	x,(OFST+1,sp)
2230  0209 7b02          	ld	a,(OFST+0,sp)
2231  020b 43            	cpl	a
2232  020c e404          	and	a,(4,x)
2233  020e               LC002:
2234  020e e704          	ld	(4,x),a
2236  0210 2018          	jra	L5221
2237  0212               L7221:
2238                     ; 971     else if (usartreg == 0x05)
2240  0212 a105          	cp	a,#5
2241  0214 260b          	jrne	L3321
2242                     ; 973       USARTx->CR5 &= (uint8_t)(~itpos);
2244  0216 1e03          	ldw	x,(OFST+1,sp)
2245  0218 7b02          	ld	a,(OFST+0,sp)
2246  021a 43            	cpl	a
2247  021b e408          	and	a,(8,x)
2248  021d               LC003:
2249  021d e708          	ld	(8,x),a
2251  021f 2009          	jra	L5221
2252  0221               L3321:
2253                     ; 978       USARTx->CR2 &= (uint8_t)(~itpos);
2255  0221 1e03          	ldw	x,(OFST+1,sp)
2256  0223 7b02          	ld	a,(OFST+0,sp)
2257  0225 43            	cpl	a
2258  0226 e405          	and	a,(5,x)
2259  0228               LC001:
2260  0228 e705          	ld	(5,x),a
2261  022a               L5221:
2262                     ; 981 }
2265  022a 5b04          	addw	sp,#4
2266  022c 81            	ret	
2414                     ; 999 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2414                     ; 1000 {
2415                     	switch	.text
2416  022d               _USART_GetFlagStatus:
2418  022d 89            	pushw	x
2419  022e 88            	push	a
2420       00000001      OFST:	set	1
2423                     ; 1001   FlagStatus status = RESET;
2425                     ; 1004   assert_param(IS_USART_FLAG(USART_FLAG));
2427                     ; 1006   if (USART_FLAG == USART_FLAG_SBK)
2429  022f 1e06          	ldw	x,(OFST+5,sp)
2430  0231 a30101        	cpw	x,#257
2431  0234 260a          	jrne	L5231
2432                     ; 1008     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2434  0236 1e02          	ldw	x,(OFST+1,sp)
2435  0238 e605          	ld	a,(5,x)
2436  023a 1507          	bcp	a,(OFST+6,sp)
2437  023c 270d          	jreq	L5331
2438                     ; 1011       status = SET;
2440  023e 2007          	jp	LC005
2441                     ; 1016       status = RESET;
2442  0240               L5231:
2443                     ; 1021     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2445  0240 1e02          	ldw	x,(OFST+1,sp)
2446  0242 f6            	ld	a,(x)
2447  0243 1507          	bcp	a,(OFST+6,sp)
2448  0245 2704          	jreq	L5331
2449                     ; 1024       status = SET;
2451  0247               LC005:
2453  0247 a601          	ld	a,#1
2455  0249 2001          	jra	L3331
2456  024b               L5331:
2457                     ; 1029       status = RESET;
2460  024b 4f            	clr	a
2461  024c               L3331:
2462                     ; 1033   return status;
2466  024c 5b03          	addw	sp,#3
2467  024e 81            	ret	
2514                     ; 1057 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2514                     ; 1058 {
2515                     	switch	.text
2516  024f               _USART_ClearFlag:
2518  024f 89            	pushw	x
2519       00000000      OFST:	set	0
2522                     ; 1060   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2524                     ; 1062   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2526  0250 7b06          	ld	a,(OFST+6,sp)
2527  0252 43            	cpl	a
2528  0253 1e01          	ldw	x,(OFST+1,sp)
2529  0255 f7            	ld	(x),a
2530                     ; 1063 }
2533  0256 85            	popw	x
2534  0257 81            	ret	
2627                     ; 1080 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2627                     ; 1081 {
2628                     	switch	.text
2629  0258               _USART_GetITStatus:
2631  0258 89            	pushw	x
2632  0259 5203          	subw	sp,#3
2633       00000003      OFST:	set	3
2636                     ; 1082   ITStatus pendingbitstatus = RESET;
2638                     ; 1083   uint8_t temp = 0;
2640                     ; 1084   uint8_t itpos = 0;
2642                     ; 1085   uint8_t itmask1 = 0;
2644                     ; 1086   uint8_t itmask2 = 0;
2646                     ; 1087   uint8_t enablestatus = 0;
2648                     ; 1090   assert_param(IS_USART_GET_IT(USART_IT));
2650                     ; 1093   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2652  025b 7b09          	ld	a,(OFST+6,sp)
2653  025d a40f          	and	a,#15
2654  025f 5f            	clrw	x
2655  0260 97            	ld	xl,a
2656  0261 a601          	ld	a,#1
2657  0263 5d            	tnzw	x
2658  0264 2704          	jreq	L27
2659  0266               L47:
2660  0266 48            	sll	a
2661  0267 5a            	decw	x
2662  0268 26fc          	jrne	L47
2663  026a               L27:
2664  026a 6b02          	ld	(OFST-1,sp),a
2665                     ; 1095   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2667  026c 7b09          	ld	a,(OFST+6,sp)
2668  026e 4e            	swap	a
2669  026f a40f          	and	a,#15
2670  0271 6b03          	ld	(OFST+0,sp),a
2671                     ; 1097   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2673  0273 5f            	clrw	x
2674  0274 97            	ld	xl,a
2675  0275 a601          	ld	a,#1
2676  0277 5d            	tnzw	x
2677  0278 2704          	jreq	L67
2678  027a               L001:
2679  027a 48            	sll	a
2680  027b 5a            	decw	x
2681  027c 26fc          	jrne	L001
2682  027e               L67:
2683  027e 6b03          	ld	(OFST+0,sp),a
2684                     ; 1100   if (USART_IT == USART_IT_PE)
2686  0280 1e08          	ldw	x,(OFST+5,sp)
2687  0282 a30100        	cpw	x,#256
2688  0285 2611          	jrne	L7241
2689                     ; 1103     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2691  0287 1e04          	ldw	x,(OFST+1,sp)
2692  0289 e604          	ld	a,(4,x)
2693  028b 1403          	and	a,(OFST+0,sp)
2694  028d 6b03          	ld	(OFST+0,sp),a
2695                     ; 1106     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2697  028f f6            	ld	a,(x)
2698  0290 1502          	bcp	a,(OFST-1,sp)
2699  0292 2739          	jreq	L1541
2701  0294 7b03          	ld	a,(OFST+0,sp)
2702                     ; 1109       pendingbitstatus = SET;
2704  0296 201e          	jp	LC008
2705                     ; 1114       pendingbitstatus = RESET;
2706  0298               L7241:
2707                     ; 1118   else if (USART_IT == USART_IT_OR)
2709  0298 a30235        	cpw	x,#565
2710  029b 261f          	jrne	L7341
2711                     ; 1121     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2713  029d 1e04          	ldw	x,(OFST+1,sp)
2714  029f e605          	ld	a,(5,x)
2715  02a1 1403          	and	a,(OFST+0,sp)
2716  02a3 6b03          	ld	(OFST+0,sp),a
2717                     ; 1124     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2719  02a5 e608          	ld	a,(8,x)
2720  02a7 a401          	and	a,#1
2721  02a9 6b01          	ld	(OFST-2,sp),a
2722                     ; 1126     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2724  02ab f6            	ld	a,(x)
2725  02ac 1502          	bcp	a,(OFST-1,sp)
2726  02ae 271d          	jreq	L1541
2728  02b0 7b03          	ld	a,(OFST+0,sp)
2729  02b2 2604          	jrne	L3441
2731  02b4 7b01          	ld	a,(OFST-2,sp)
2732  02b6               LC008:
2733  02b6 2715          	jreq	L1541
2734  02b8               L3441:
2735                     ; 1129       pendingbitstatus = SET;
2739  02b8 a601          	ld	a,#1
2741  02ba 2012          	jra	L5341
2742                     ; 1134       pendingbitstatus = RESET;
2743  02bc               L7341:
2744                     ; 1141     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2746  02bc 1e04          	ldw	x,(OFST+1,sp)
2747  02be e605          	ld	a,(5,x)
2748  02c0 1403          	and	a,(OFST+0,sp)
2749  02c2 6b03          	ld	(OFST+0,sp),a
2750                     ; 1143     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2752  02c4 f6            	ld	a,(x)
2753  02c5 1502          	bcp	a,(OFST-1,sp)
2754  02c7 2704          	jreq	L1541
2756  02c9 7b03          	ld	a,(OFST+0,sp)
2757                     ; 1146       pendingbitstatus = SET;
2759  02cb 26eb          	jrne	L3441
2760  02cd               L1541:
2761                     ; 1151       pendingbitstatus = RESET;
2765  02cd 4f            	clr	a
2766  02ce               L5341:
2767                     ; 1156   return  pendingbitstatus;
2771  02ce 5b05          	addw	sp,#5
2772  02d0 81            	ret	
2810                     ; 1180 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2810                     ; 1181 {
2811                     	switch	.text
2812  02d1               _USART_ClearITPendingBit:
2816                     ; 1182   assert_param(IS_USART_CLEAR_IT(USART_IT));
2818                     ; 1185   USARTx->SR &= (uint8_t)(~USART_SR_TC);
2820  02d1 f6            	ld	a,(x)
2821  02d2 a4bf          	and	a,#191
2822  02d4 f7            	ld	(x),a
2823                     ; 1186 }
2826  02d5 81            	ret	
2839                     	xdef	_USART_ClearITPendingBit
2840                     	xdef	_USART_GetITStatus
2841                     	xdef	_USART_ClearFlag
2842                     	xdef	_USART_GetFlagStatus
2843                     	xdef	_USART_ITConfig
2844                     	xdef	_USART_DMACmd
2845                     	xdef	_USART_IrDACmd
2846                     	xdef	_USART_IrDAConfig
2847                     	xdef	_USART_SetGuardTime
2848                     	xdef	_USART_SmartCardNACKCmd
2849                     	xdef	_USART_SmartCardCmd
2850                     	xdef	_USART_HalfDuplexCmd
2851                     	xdef	_USART_SetAddress
2852                     	xdef	_USART_ReceiverWakeUpCmd
2853                     	xdef	_USART_WakeUpConfig
2854                     	xdef	_USART_ReceiveData9
2855                     	xdef	_USART_ReceiveData8
2856                     	xdef	_USART_SendData9
2857                     	xdef	_USART_SendData8
2858                     	xdef	_USART_SendBreak
2859                     	xdef	_USART_SetPrescaler
2860                     	xdef	_USART_Cmd
2861                     	xdef	_USART_ClockInit
2862                     	xdef	_USART_Init
2863                     	xdef	_USART_DeInit
2864                     	xref	_CLK_GetClockFreq
2865                     	xref.b	c_lreg
2866                     	xref.b	c_x
2885                     	xref	c_lursh
2886                     	xref	c_ltor
2887                     	xref	c_rtol
2888                     	xref	c_ludv
2889                     	end
