   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
 167                     ; 145 void USART_DeInit(USART_TypeDef* USARTx)
 167                     ; 146 {
 169                     .text:	section	.text,new
 170  0000               _USART_DeInit:
 174                     ; 150   (void) USARTx->SR;
 176  0000 f6            	ld	a,(x)
 177                     ; 151   (void) USARTx->DR;
 179  0001 e601          	ld	a,(1,x)
 180                     ; 153   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 182  0003 6f03          	clr	(3,x)
 183                     ; 154   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 185  0005 6f02          	clr	(2,x)
 186                     ; 156   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 188  0007 6f04          	clr	(4,x)
 189                     ; 157   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 191  0009 6f05          	clr	(5,x)
 192                     ; 158   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 194  000b 6f06          	clr	(6,x)
 195                     ; 159   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 197  000d 6f07          	clr	(7,x)
 198                     ; 160 }
 201  000f 81            	ret
 389                     ; 189 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 389                     ; 190                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 389                     ; 191                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 389                     ; 192 {
 390                     .text:	section	.text,new
 391  0000               _USART_Init:
 393  0000 89            	pushw	x
 394  0001 5204          	subw	sp,#4
 395       00000004      OFST:	set	4
 398                     ; 193   uint32_t BaudRate_Mantissa = 0;
 400                     ; 196   assert_param(IS_USART_BAUDRATE(BaudRate));
 402                     ; 198   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 404                     ; 200   assert_param(IS_USART_STOPBITS(USART_StopBits));
 406                     ; 202   assert_param(IS_USART_PARITY(USART_Parity));
 408                     ; 204   assert_param(IS_USART_MODE(USART_Mode));
 410                     ; 207   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 412  0003 e604          	ld	a,(4,x)
 413  0005 a4e9          	and	a,#233
 414  0007 e704          	ld	(4,x),a
 415                     ; 210   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 417  0009 7b0d          	ld	a,(OFST+9,sp)
 418  000b 1a0f          	or	a,(OFST+11,sp)
 419  000d ea04          	or	a,(4,x)
 420  000f e704          	ld	(4,x),a
 421                     ; 213   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 423  0011 e606          	ld	a,(6,x)
 424  0013 a4cf          	and	a,#207
 425  0015 e706          	ld	(6,x),a
 426                     ; 215   USARTx->CR3 |= (uint8_t)USART_StopBits;
 428  0017 e606          	ld	a,(6,x)
 429  0019 1a0e          	or	a,(OFST+10,sp)
 430  001b e706          	ld	(6,x),a
 431                     ; 218   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 433  001d 6f02          	clr	(2,x)
 434                     ; 220   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 436  001f e603          	ld	a,(3,x)
 437  0021 a40f          	and	a,#15
 438  0023 e703          	ld	(3,x),a
 439                     ; 222   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 441  0025 e603          	ld	a,(3,x)
 442  0027 a4f0          	and	a,#240
 443  0029 e703          	ld	(3,x),a
 444                     ; 224   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 446  002b cd0000        	call	_CLK_GetClockFreq
 448  002e 96            	ldw	x,sp
 449  002f 1c0009        	addw	x,#OFST+5
 450  0032 cd0000        	call	c_ludv
 452  0035 96            	ldw	x,sp
 453  0036 1c0001        	addw	x,#OFST-3
 454  0039 cd0000        	call	c_rtol
 456                     ; 226   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 458  003c 7b03          	ld	a,(OFST-1,sp)
 459  003e a4f0          	and	a,#240
 460  0040 1e05          	ldw	x,(OFST+1,sp)
 461  0042 e703          	ld	(3,x),a
 462                     ; 228   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 464  0044 1e05          	ldw	x,(OFST+1,sp)
 465  0046 7b04          	ld	a,(OFST+0,sp)
 466  0048 a40f          	and	a,#15
 467  004a ea03          	or	a,(3,x)
 468  004c e703          	ld	(3,x),a
 469                     ; 230   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 471  004e 96            	ldw	x,sp
 472  004f 1c0001        	addw	x,#OFST-3
 473  0052 cd0000        	call	c_ltor
 475  0055 a604          	ld	a,#4
 476  0057 cd0000        	call	c_lursh
 478  005a b603          	ld	a,c_lreg+3
 479  005c 1e05          	ldw	x,(OFST+1,sp)
 480  005e e702          	ld	(2,x),a
 481                     ; 233   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 483  0060 1e05          	ldw	x,(OFST+1,sp)
 484  0062 e605          	ld	a,(5,x)
 485  0064 a4f3          	and	a,#243
 486  0066 e705          	ld	(5,x),a
 487                     ; 235   USARTx->CR2 |= (uint8_t)USART_Mode;
 489  0068 1e05          	ldw	x,(OFST+1,sp)
 490  006a e605          	ld	a,(5,x)
 491  006c 1a10          	or	a,(OFST+12,sp)
 492  006e e705          	ld	(5,x),a
 493                     ; 236 }
 496  0070 5b06          	addw	sp,#6
 497  0072 81            	ret
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
 687  0011 0d05          	tnz	(OFST+5,sp)
 688  0013 2708          	jreq	L123
 689                     ; 278     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 691  0015 e606          	ld	a,(6,x)
 692  0017 aa08          	or	a,#8
 693  0019 e706          	ld	(6,x),a
 695  001b 2008          	jra	L323
 696  001d               L123:
 697                     ; 282     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 699  001d 1e01          	ldw	x,(OFST+1,sp)
 700  001f e606          	ld	a,(6,x)
 701  0021 a4f7          	and	a,#247
 702  0023 e706          	ld	(6,x),a
 703  0025               L323:
 704                     ; 284 }
 707  0025 85            	popw	x
 708  0026 81            	ret
 775                     ; 293 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 775                     ; 294 {
 776                     .text:	section	.text,new
 777  0000               _USART_Cmd:
 779  0000 89            	pushw	x
 780       00000000      OFST:	set	0
 783                     ; 295   if (NewState != DISABLE)
 785  0001 0d05          	tnz	(OFST+5,sp)
 786  0003 2708          	jreq	L163
 787                     ; 297     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 789  0005 e604          	ld	a,(4,x)
 790  0007 a4df          	and	a,#223
 791  0009 e704          	ld	(4,x),a
 793  000b 2008          	jra	L363
 794  000d               L163:
 795                     ; 301     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 797  000d 1e01          	ldw	x,(OFST+1,sp)
 798  000f e604          	ld	a,(4,x)
 799  0011 aa20          	or	a,#32
 800  0013 e704          	ld	(4,x),a
 801  0015               L363:
 802                     ; 303 }
 805  0015 85            	popw	x
 806  0016 81            	ret
 850                     ; 326 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 850                     ; 327 {
 851                     .text:	section	.text,new
 852  0000               _USART_SetPrescaler:
 854  0000 89            	pushw	x
 855       00000000      OFST:	set	0
 858                     ; 329   USARTx->PSCR = USART_Prescaler;
 860  0001 7b05          	ld	a,(OFST+5,sp)
 861  0003 1e01          	ldw	x,(OFST+1,sp)
 862  0005 e70a          	ld	(10,x),a
 863                     ; 330 }
 866  0007 85            	popw	x
 867  0008 81            	ret
 904                     ; 337 void USART_SendBreak(USART_TypeDef* USARTx)
 904                     ; 338 {
 905                     .text:	section	.text,new
 906  0000               _USART_SendBreak:
 910                     ; 339   USARTx->CR2 |= USART_CR2_SBK;
 912  0000 e605          	ld	a,(5,x)
 913  0002 aa01          	or	a,#1
 914  0004 e705          	ld	(5,x),a
 915                     ; 340 }
 918  0006 81            	ret
 955                     ; 379 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 955                     ; 380 {
 956                     .text:	section	.text,new
 957  0000               _USART_ReceiveData8:
 961                     ; 381   return USARTx->DR;
 963  0000 e601          	ld	a,(1,x)
 966  0002 81            	ret
1010                     ; 389 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1010                     ; 390 {
1011                     .text:	section	.text,new
1012  0000               _USART_ReceiveData9:
1014  0000 89            	pushw	x
1015  0001 89            	pushw	x
1016       00000002      OFST:	set	2
1019                     ; 391   uint16_t temp = 0;
1021                     ; 393   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1023  0002 e604          	ld	a,(4,x)
1024  0004 5f            	clrw	x
1025  0005 a480          	and	a,#128
1026  0007 5f            	clrw	x
1027  0008 02            	rlwa	x,a
1028  0009 58            	sllw	x
1029  000a 1f01          	ldw	(OFST-1,sp),x
1030                     ; 394   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1032  000c 1e03          	ldw	x,(OFST+1,sp)
1033  000e e601          	ld	a,(1,x)
1034  0010 5f            	clrw	x
1035  0011 97            	ld	xl,a
1036  0012 01            	rrwa	x,a
1037  0013 1a02          	or	a,(OFST+0,sp)
1038  0015 01            	rrwa	x,a
1039  0016 1a01          	or	a,(OFST-1,sp)
1040  0018 01            	rrwa	x,a
1041  0019 01            	rrwa	x,a
1042  001a a4ff          	and	a,#255
1043  001c 01            	rrwa	x,a
1044  001d a401          	and	a,#1
1045  001f 01            	rrwa	x,a
1048  0020 5b04          	addw	sp,#4
1049  0022 81            	ret
1093                     ; 402 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1093                     ; 403 {
1094                     .text:	section	.text,new
1095  0000               _USART_SendData8:
1097  0000 89            	pushw	x
1098       00000000      OFST:	set	0
1101                     ; 405   USARTx->DR = Data;
1103  0001 7b05          	ld	a,(OFST+5,sp)
1104  0003 1e01          	ldw	x,(OFST+1,sp)
1105  0005 e701          	ld	(1,x),a
1106                     ; 406 }
1109  0007 85            	popw	x
1110  0008 81            	ret
1154                     ; 415 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1154                     ; 416 {
1155                     .text:	section	.text,new
1156  0000               _USART_SendData9:
1158  0000 89            	pushw	x
1159       00000000      OFST:	set	0
1162                     ; 417   assert_param(IS_USART_DATA_9BITS(Data));
1164                     ; 420   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1166  0001 e604          	ld	a,(4,x)
1167  0003 a4bf          	and	a,#191
1168  0005 e704          	ld	(4,x),a
1169                     ; 423   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1171  0007 1605          	ldw	y,(OFST+5,sp)
1172  0009 9054          	srlw	y
1173  000b 9054          	srlw	y
1174  000d 909f          	ld	a,yl
1175  000f a440          	and	a,#64
1176  0011 ea04          	or	a,(4,x)
1177  0013 e704          	ld	(4,x),a
1178                     ; 426   USARTx->DR   = (uint8_t)(Data);
1180  0015 7b06          	ld	a,(OFST+6,sp)
1181  0017 1e01          	ldw	x,(OFST+1,sp)
1182  0019 e701          	ld	(1,x),a
1183                     ; 427 }
1186  001b 85            	popw	x
1187  001c 81            	ret
1235                     ; 470 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1235                     ; 471 {
1236                     .text:	section	.text,new
1237  0000               _USART_ReceiverWakeUpCmd:
1239  0000 89            	pushw	x
1240       00000000      OFST:	set	0
1243                     ; 472   assert_param(IS_FUNCTIONAL_STATE(NewState));
1245                     ; 474   if (NewState != DISABLE)
1247  0001 0d05          	tnz	(OFST+5,sp)
1248  0003 2708          	jreq	L165
1249                     ; 477     USARTx->CR2 |= USART_CR2_RWU;
1251  0005 e605          	ld	a,(5,x)
1252  0007 aa02          	or	a,#2
1253  0009 e705          	ld	(5,x),a
1255  000b 2008          	jra	L365
1256  000d               L165:
1257                     ; 482     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1259  000d 1e01          	ldw	x,(OFST+1,sp)
1260  000f e605          	ld	a,(5,x)
1261  0011 a4fd          	and	a,#253
1262  0013 e705          	ld	(5,x),a
1263  0015               L365:
1264                     ; 484 }
1267  0015 85            	popw	x
1268  0016 81            	ret
1312                     ; 493 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1312                     ; 494 {
1313                     .text:	section	.text,new
1314  0000               _USART_SetAddress:
1316  0000 89            	pushw	x
1317       00000000      OFST:	set	0
1320                     ; 496   assert_param(IS_USART_ADDRESS(USART_Address));
1322                     ; 499   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1324  0001 e607          	ld	a,(7,x)
1325  0003 a4f0          	and	a,#240
1326  0005 e707          	ld	(7,x),a
1327                     ; 501   USARTx->CR4 |= USART_Address;
1329  0007 e607          	ld	a,(7,x)
1330  0009 1a05          	or	a,(OFST+5,sp)
1331  000b e707          	ld	(7,x),a
1332                     ; 502 }
1335  000d 85            	popw	x
1336  000e 81            	ret
1405                     ; 512 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1405                     ; 513 {
1406                     .text:	section	.text,new
1407  0000               _USART_WakeUpConfig:
1409  0000 89            	pushw	x
1410       00000000      OFST:	set	0
1413                     ; 514   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1415                     ; 516   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1417  0001 e604          	ld	a,(4,x)
1418  0003 a4f7          	and	a,#247
1419  0005 e704          	ld	(4,x),a
1420                     ; 517   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1422  0007 e604          	ld	a,(4,x)
1423  0009 1a05          	or	a,(OFST+5,sp)
1424  000b e704          	ld	(4,x),a
1425                     ; 518 }
1428  000d 85            	popw	x
1429  000e 81            	ret
1477                     ; 563 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1477                     ; 564 {
1478                     .text:	section	.text,new
1479  0000               _USART_HalfDuplexCmd:
1481  0000 89            	pushw	x
1482       00000000      OFST:	set	0
1485                     ; 565   assert_param(IS_FUNCTIONAL_STATE(NewState));
1487                     ; 567   if (NewState != DISABLE)
1489  0001 0d05          	tnz	(OFST+5,sp)
1490  0003 2708          	jreq	L766
1491                     ; 569     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1493  0005 e608          	ld	a,(8,x)
1494  0007 aa08          	or	a,#8
1495  0009 e708          	ld	(8,x),a
1497  000b 2008          	jra	L176
1498  000d               L766:
1499                     ; 573     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1501  000d 1e01          	ldw	x,(OFST+1,sp)
1502  000f e608          	ld	a,(8,x)
1503  0011 a4f7          	and	a,#247
1504  0013 e708          	ld	(8,x),a
1505  0015               L176:
1506                     ; 575 }
1509  0015 85            	popw	x
1510  0016 81            	ret
1557                     ; 641 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1557                     ; 642 {
1558                     .text:	section	.text,new
1559  0000               _USART_SmartCardCmd:
1561  0000 89            	pushw	x
1562       00000000      OFST:	set	0
1565                     ; 643   assert_param(IS_FUNCTIONAL_STATE(NewState));
1567                     ; 645   if (NewState != DISABLE)
1569  0001 0d05          	tnz	(OFST+5,sp)
1570  0003 2708          	jreq	L717
1571                     ; 648     USARTx->CR5 |= USART_CR5_SCEN;
1573  0005 e608          	ld	a,(8,x)
1574  0007 aa20          	or	a,#32
1575  0009 e708          	ld	(8,x),a
1577  000b 2008          	jra	L127
1578  000d               L717:
1579                     ; 653     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1581  000d 1e01          	ldw	x,(OFST+1,sp)
1582  000f e608          	ld	a,(8,x)
1583  0011 a4df          	and	a,#223
1584  0013 e708          	ld	(8,x),a
1585  0015               L127:
1586                     ; 655 }
1589  0015 85            	popw	x
1590  0016 81            	ret
1638                     ; 664 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1638                     ; 665 {
1639                     .text:	section	.text,new
1640  0000               _USART_SmartCardNACKCmd:
1642  0000 89            	pushw	x
1643       00000000      OFST:	set	0
1646                     ; 666   assert_param(IS_FUNCTIONAL_STATE(NewState));
1648                     ; 668   if (NewState != DISABLE)
1650  0001 0d05          	tnz	(OFST+5,sp)
1651  0003 2708          	jreq	L747
1652                     ; 671     USARTx->CR5 |= USART_CR5_NACK;
1654  0005 e608          	ld	a,(8,x)
1655  0007 aa10          	or	a,#16
1656  0009 e708          	ld	(8,x),a
1658  000b 2008          	jra	L157
1659  000d               L747:
1660                     ; 676     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1662  000d 1e01          	ldw	x,(OFST+1,sp)
1663  000f e608          	ld	a,(8,x)
1664  0011 a4ef          	and	a,#239
1665  0013 e708          	ld	(8,x),a
1666  0015               L157:
1667                     ; 678 }
1670  0015 85            	popw	x
1671  0016 81            	ret
1715                     ; 687 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1715                     ; 688 {
1716                     .text:	section	.text,new
1717  0000               _USART_SetGuardTime:
1719  0000 89            	pushw	x
1720       00000000      OFST:	set	0
1723                     ; 690   USARTx->GTR = USART_GuardTime;
1725  0001 7b05          	ld	a,(OFST+5,sp)
1726  0003 1e01          	ldw	x,(OFST+1,sp)
1727  0005 e709          	ld	(9,x),a
1728                     ; 691 }
1731  0007 85            	popw	x
1732  0008 81            	ret
1801                     ; 748 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1801                     ; 749 {
1802                     .text:	section	.text,new
1803  0000               _USART_IrDAConfig:
1805  0000 89            	pushw	x
1806       00000000      OFST:	set	0
1809                     ; 750   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1811                     ; 752   if (USART_IrDAMode != USART_IrDAMode_Normal)
1813  0001 0d05          	tnz	(OFST+5,sp)
1814  0003 2708          	jreq	L1301
1815                     ; 754     USARTx->CR5 |= USART_CR5_IRLP;
1817  0005 e608          	ld	a,(8,x)
1818  0007 aa04          	or	a,#4
1819  0009 e708          	ld	(8,x),a
1821  000b 2008          	jra	L3301
1822  000d               L1301:
1823                     ; 758     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1825  000d 1e01          	ldw	x,(OFST+1,sp)
1826  000f e608          	ld	a,(8,x)
1827  0011 a4fb          	and	a,#251
1828  0013 e708          	ld	(8,x),a
1829  0015               L3301:
1830                     ; 760 }
1833  0015 85            	popw	x
1834  0016 81            	ret
1881                     ; 769 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1881                     ; 770 {
1882                     .text:	section	.text,new
1883  0000               _USART_IrDACmd:
1885  0000 89            	pushw	x
1886       00000000      OFST:	set	0
1889                     ; 773   assert_param(IS_FUNCTIONAL_STATE(NewState));
1891                     ; 775   if (NewState != DISABLE)
1893  0001 0d05          	tnz	(OFST+5,sp)
1894  0003 2708          	jreq	L1601
1895                     ; 778     USARTx->CR5 |= USART_CR5_IREN;
1897  0005 e608          	ld	a,(8,x)
1898  0007 aa02          	or	a,#2
1899  0009 e708          	ld	(8,x),a
1901  000b 2008          	jra	L3601
1902  000d               L1601:
1903                     ; 783     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1905  000d 1e01          	ldw	x,(OFST+1,sp)
1906  000f e608          	ld	a,(8,x)
1907  0011 a4fd          	and	a,#253
1908  0013 e708          	ld	(8,x),a
1909  0015               L3601:
1910                     ; 785 }
1913  0015 85            	popw	x
1914  0016 81            	ret
1991                     ; 815 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
1991                     ; 816                   FunctionalState NewState)
1991                     ; 817 {
1992                     .text:	section	.text,new
1993  0000               _USART_DMACmd:
1995  0000 89            	pushw	x
1996       00000000      OFST:	set	0
1999                     ; 819   assert_param(IS_USART_DMAREQ(USART_DMAReq));
2001                     ; 820   assert_param(IS_FUNCTIONAL_STATE(NewState));
2003                     ; 822   if (NewState != DISABLE)
2005  0001 0d06          	tnz	(OFST+6,sp)
2006  0003 2708          	jreq	L5211
2007                     ; 826     USARTx->CR5 |= (uint8_t) USART_DMAReq;
2009  0005 e608          	ld	a,(8,x)
2010  0007 1a05          	or	a,(OFST+5,sp)
2011  0009 e708          	ld	(8,x),a
2013  000b 2009          	jra	L7211
2014  000d               L5211:
2015                     ; 832     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
2017  000d 1e01          	ldw	x,(OFST+1,sp)
2018  000f 7b05          	ld	a,(OFST+5,sp)
2019  0011 43            	cpl	a
2020  0012 e408          	and	a,(8,x)
2021  0014 e708          	ld	(8,x),a
2022  0016               L7211:
2023                     ; 834 }
2026  0016 85            	popw	x
2027  0017 81            	ret
2167                     ; 936 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2167                     ; 937 {
2168                     .text:	section	.text,new
2169  0000               _USART_ITConfig:
2171  0000 89            	pushw	x
2172  0001 89            	pushw	x
2173       00000002      OFST:	set	2
2176                     ; 938   uint8_t usartreg, itpos = 0x00;
2178                     ; 939   assert_param(IS_USART_CONFIG_IT(USART_IT));
2180                     ; 940   assert_param(IS_FUNCTIONAL_STATE(NewState));
2182                     ; 943   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2184  0002 7b07          	ld	a,(OFST+5,sp)
2185  0004 6b01          	ld	(OFST-1,sp),a
2186                     ; 945   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2188  0006 7b08          	ld	a,(OFST+6,sp)
2189  0008 a40f          	and	a,#15
2190  000a 5f            	clrw	x
2191  000b 97            	ld	xl,a
2192  000c a601          	ld	a,#1
2193  000e 5d            	tnzw	x
2194  000f 2704          	jreq	L65
2195  0011               L06:
2196  0011 48            	sll	a
2197  0012 5a            	decw	x
2198  0013 26fc          	jrne	L06
2199  0015               L65:
2200  0015 6b02          	ld	(OFST+0,sp),a
2201                     ; 947   if (NewState != DISABLE)
2203  0017 0d09          	tnz	(OFST+7,sp)
2204  0019 272a          	jreq	L3121
2205                     ; 950     if (usartreg == 0x01)
2207  001b 7b01          	ld	a,(OFST-1,sp)
2208  001d a101          	cp	a,#1
2209  001f 260a          	jrne	L5121
2210                     ; 952       USARTx->CR1 |= itpos;
2212  0021 1e03          	ldw	x,(OFST+1,sp)
2213  0023 e604          	ld	a,(4,x)
2214  0025 1a02          	or	a,(OFST+0,sp)
2215  0027 e704          	ld	(4,x),a
2217  0029 2045          	jra	L5221
2218  002b               L5121:
2219                     ; 954     else if (usartreg == 0x05)
2221  002b 7b01          	ld	a,(OFST-1,sp)
2222  002d a105          	cp	a,#5
2223  002f 260a          	jrne	L1221
2224                     ; 956       USARTx->CR5 |= itpos;
2226  0031 1e03          	ldw	x,(OFST+1,sp)
2227  0033 e608          	ld	a,(8,x)
2228  0035 1a02          	or	a,(OFST+0,sp)
2229  0037 e708          	ld	(8,x),a
2231  0039 2035          	jra	L5221
2232  003b               L1221:
2233                     ; 961       USARTx->CR2 |= itpos;
2235  003b 1e03          	ldw	x,(OFST+1,sp)
2236  003d e605          	ld	a,(5,x)
2237  003f 1a02          	or	a,(OFST+0,sp)
2238  0041 e705          	ld	(5,x),a
2239  0043 202b          	jra	L5221
2240  0045               L3121:
2241                     ; 967     if (usartreg == 0x01)
2243  0045 7b01          	ld	a,(OFST-1,sp)
2244  0047 a101          	cp	a,#1
2245  0049 260b          	jrne	L7221
2246                     ; 969       USARTx->CR1 &= (uint8_t)(~itpos);
2248  004b 1e03          	ldw	x,(OFST+1,sp)
2249  004d 7b02          	ld	a,(OFST+0,sp)
2250  004f 43            	cpl	a
2251  0050 e404          	and	a,(4,x)
2252  0052 e704          	ld	(4,x),a
2254  0054 201a          	jra	L5221
2255  0056               L7221:
2256                     ; 971     else if (usartreg == 0x05)
2258  0056 7b01          	ld	a,(OFST-1,sp)
2259  0058 a105          	cp	a,#5
2260  005a 260b          	jrne	L3321
2261                     ; 973       USARTx->CR5 &= (uint8_t)(~itpos);
2263  005c 1e03          	ldw	x,(OFST+1,sp)
2264  005e 7b02          	ld	a,(OFST+0,sp)
2265  0060 43            	cpl	a
2266  0061 e408          	and	a,(8,x)
2267  0063 e708          	ld	(8,x),a
2269  0065 2009          	jra	L5221
2270  0067               L3321:
2271                     ; 978       USARTx->CR2 &= (uint8_t)(~itpos);
2273  0067 1e03          	ldw	x,(OFST+1,sp)
2274  0069 7b02          	ld	a,(OFST+0,sp)
2275  006b 43            	cpl	a
2276  006c e405          	and	a,(5,x)
2277  006e e705          	ld	(5,x),a
2278  0070               L5221:
2279                     ; 981 }
2282  0070 5b04          	addw	sp,#4
2283  0072 81            	ret
2431                     ; 999 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2431                     ; 1000 {
2432                     .text:	section	.text,new
2433  0000               _USART_GetFlagStatus:
2435  0000 89            	pushw	x
2436  0001 88            	push	a
2437       00000001      OFST:	set	1
2440                     ; 1001   FlagStatus status = RESET;
2442                     ; 1004   assert_param(IS_USART_FLAG(USART_FLAG));
2444                     ; 1006   if (USART_FLAG == USART_FLAG_SBK)
2446  0002 1e06          	ldw	x,(OFST+5,sp)
2447  0004 a30101        	cpw	x,#257
2448  0007 2612          	jrne	L5231
2449                     ; 1008     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2451  0009 1e02          	ldw	x,(OFST+1,sp)
2452  000b e605          	ld	a,(5,x)
2453  000d 1507          	bcp	a,(OFST+6,sp)
2454  000f 2706          	jreq	L7231
2455                     ; 1011       status = SET;
2457  0011 a601          	ld	a,#1
2458  0013 6b01          	ld	(OFST+0,sp),a
2460  0015 2013          	jra	L3331
2461  0017               L7231:
2462                     ; 1016       status = RESET;
2464  0017 0f01          	clr	(OFST+0,sp)
2465  0019 200f          	jra	L3331
2466  001b               L5231:
2467                     ; 1021     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2469  001b 1e02          	ldw	x,(OFST+1,sp)
2470  001d f6            	ld	a,(x)
2471  001e 1507          	bcp	a,(OFST+6,sp)
2472  0020 2706          	jreq	L5331
2473                     ; 1024       status = SET;
2475  0022 a601          	ld	a,#1
2476  0024 6b01          	ld	(OFST+0,sp),a
2478  0026 2002          	jra	L3331
2479  0028               L5331:
2480                     ; 1029       status = RESET;
2482  0028 0f01          	clr	(OFST+0,sp)
2483  002a               L3331:
2484                     ; 1033   return status;
2486  002a 7b01          	ld	a,(OFST+0,sp)
2489  002c 5b03          	addw	sp,#3
2490  002e 81            	ret
2537                     ; 1057 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2537                     ; 1058 {
2538                     .text:	section	.text,new
2539  0000               _USART_ClearFlag:
2541  0000 89            	pushw	x
2542       00000000      OFST:	set	0
2545                     ; 1060   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2547                     ; 1062   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2549  0001 7b06          	ld	a,(OFST+6,sp)
2550  0003 43            	cpl	a
2551  0004 1e01          	ldw	x,(OFST+1,sp)
2552  0006 f7            	ld	(x),a
2553                     ; 1063 }
2556  0007 85            	popw	x
2557  0008 81            	ret
2650                     ; 1080 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2650                     ; 1081 {
2651                     .text:	section	.text,new
2652  0000               _USART_GetITStatus:
2654  0000 89            	pushw	x
2655  0001 5203          	subw	sp,#3
2656       00000003      OFST:	set	3
2659                     ; 1082   ITStatus pendingbitstatus = RESET;
2661                     ; 1083   uint8_t temp = 0;
2663                     ; 1084   uint8_t itpos = 0;
2665                     ; 1085   uint8_t itmask1 = 0;
2667                     ; 1086   uint8_t itmask2 = 0;
2669                     ; 1087   uint8_t enablestatus = 0;
2671                     ; 1090   assert_param(IS_USART_GET_IT(USART_IT));
2673                     ; 1093   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2675  0003 7b09          	ld	a,(OFST+6,sp)
2676  0005 a40f          	and	a,#15
2677  0007 5f            	clrw	x
2678  0008 97            	ld	xl,a
2679  0009 a601          	ld	a,#1
2680  000b 5d            	tnzw	x
2681  000c 2704          	jreq	L07
2682  000e               L27:
2683  000e 48            	sll	a
2684  000f 5a            	decw	x
2685  0010 26fc          	jrne	L27
2686  0012               L07:
2687  0012 6b02          	ld	(OFST-1,sp),a
2688                     ; 1095   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2690  0014 7b09          	ld	a,(OFST+6,sp)
2691  0016 4e            	swap	a
2692  0017 a40f          	and	a,#15
2693  0019 6b03          	ld	(OFST+0,sp),a
2694                     ; 1097   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2696  001b 7b03          	ld	a,(OFST+0,sp)
2697  001d 5f            	clrw	x
2698  001e 97            	ld	xl,a
2699  001f a601          	ld	a,#1
2700  0021 5d            	tnzw	x
2701  0022 2704          	jreq	L47
2702  0024               L67:
2703  0024 48            	sll	a
2704  0025 5a            	decw	x
2705  0026 26fc          	jrne	L67
2706  0028               L47:
2707  0028 6b03          	ld	(OFST+0,sp),a
2708                     ; 1100   if (USART_IT == USART_IT_PE)
2710  002a 1e08          	ldw	x,(OFST+5,sp)
2711  002c a30100        	cpw	x,#256
2712  002f 261d          	jrne	L7241
2713                     ; 1103     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2715  0031 1e04          	ldw	x,(OFST+1,sp)
2716  0033 e604          	ld	a,(4,x)
2717  0035 1403          	and	a,(OFST+0,sp)
2718  0037 6b03          	ld	(OFST+0,sp),a
2719                     ; 1106     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2721  0039 1e04          	ldw	x,(OFST+1,sp)
2722  003b f6            	ld	a,(x)
2723  003c 1502          	bcp	a,(OFST-1,sp)
2724  003e 270a          	jreq	L1341
2726  0040 0d03          	tnz	(OFST+0,sp)
2727  0042 2706          	jreq	L1341
2728                     ; 1109       pendingbitstatus = SET;
2730  0044 a601          	ld	a,#1
2731  0046 6b03          	ld	(OFST+0,sp),a
2733  0048 204f          	jra	L5341
2734  004a               L1341:
2735                     ; 1114       pendingbitstatus = RESET;
2737  004a 0f03          	clr	(OFST+0,sp)
2738  004c 204b          	jra	L5341
2739  004e               L7241:
2740                     ; 1118   else if (USART_IT == USART_IT_OR)
2742  004e 1e08          	ldw	x,(OFST+5,sp)
2743  0050 a30235        	cpw	x,#565
2744  0053 2629          	jrne	L7341
2745                     ; 1121     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2747  0055 1e04          	ldw	x,(OFST+1,sp)
2748  0057 e605          	ld	a,(5,x)
2749  0059 1403          	and	a,(OFST+0,sp)
2750  005b 6b03          	ld	(OFST+0,sp),a
2751                     ; 1124     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2753  005d 1e04          	ldw	x,(OFST+1,sp)
2754  005f e608          	ld	a,(8,x)
2755  0061 a401          	and	a,#1
2756  0063 6b01          	ld	(OFST-2,sp),a
2757                     ; 1126     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2759  0065 1e04          	ldw	x,(OFST+1,sp)
2760  0067 f6            	ld	a,(x)
2761  0068 1502          	bcp	a,(OFST-1,sp)
2762  006a 270e          	jreq	L1441
2764  006c 0d03          	tnz	(OFST+0,sp)
2765  006e 2604          	jrne	L3441
2767  0070 0d01          	tnz	(OFST-2,sp)
2768  0072 2706          	jreq	L1441
2769  0074               L3441:
2770                     ; 1129       pendingbitstatus = SET;
2772  0074 a601          	ld	a,#1
2773  0076 6b03          	ld	(OFST+0,sp),a
2775  0078 201f          	jra	L5341
2776  007a               L1441:
2777                     ; 1134       pendingbitstatus = RESET;
2779  007a 0f03          	clr	(OFST+0,sp)
2780  007c 201b          	jra	L5341
2781  007e               L7341:
2782                     ; 1141     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2784  007e 1e04          	ldw	x,(OFST+1,sp)
2785  0080 e605          	ld	a,(5,x)
2786  0082 1403          	and	a,(OFST+0,sp)
2787  0084 6b03          	ld	(OFST+0,sp),a
2788                     ; 1143     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2790  0086 1e04          	ldw	x,(OFST+1,sp)
2791  0088 f6            	ld	a,(x)
2792  0089 1502          	bcp	a,(OFST-1,sp)
2793  008b 270a          	jreq	L1541
2795  008d 0d03          	tnz	(OFST+0,sp)
2796  008f 2706          	jreq	L1541
2797                     ; 1146       pendingbitstatus = SET;
2799  0091 a601          	ld	a,#1
2800  0093 6b03          	ld	(OFST+0,sp),a
2802  0095 2002          	jra	L5341
2803  0097               L1541:
2804                     ; 1151       pendingbitstatus = RESET;
2806  0097 0f03          	clr	(OFST+0,sp)
2807  0099               L5341:
2808                     ; 1156   return  pendingbitstatus;
2810  0099 7b03          	ld	a,(OFST+0,sp)
2813  009b 5b05          	addw	sp,#5
2814  009d 81            	ret
2852                     ; 1180 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2852                     ; 1181 {
2853                     .text:	section	.text,new
2854  0000               _USART_ClearITPendingBit:
2858                     ; 1182   assert_param(IS_USART_CLEAR_IT(USART_IT));
2860                     ; 1185   USARTx->SR &= (uint8_t)(~USART_SR_TC);
2862  0000 f6            	ld	a,(x)
2863  0001 a4bf          	and	a,#191
2864  0003 f7            	ld	(x),a
2865                     ; 1186 }
2868  0004 81            	ret
2881                     	xdef	_USART_ClearITPendingBit
2882                     	xdef	_USART_GetITStatus
2883                     	xdef	_USART_ClearFlag
2884                     	xdef	_USART_GetFlagStatus
2885                     	xdef	_USART_ITConfig
2886                     	xdef	_USART_DMACmd
2887                     	xdef	_USART_IrDACmd
2888                     	xdef	_USART_IrDAConfig
2889                     	xdef	_USART_SetGuardTime
2890                     	xdef	_USART_SmartCardNACKCmd
2891                     	xdef	_USART_SmartCardCmd
2892                     	xdef	_USART_HalfDuplexCmd
2893                     	xdef	_USART_SetAddress
2894                     	xdef	_USART_ReceiverWakeUpCmd
2895                     	xdef	_USART_WakeUpConfig
2896                     	xdef	_USART_ReceiveData9
2897                     	xdef	_USART_ReceiveData8
2898                     	xdef	_USART_SendData9
2899                     	xdef	_USART_SendData8
2900                     	xdef	_USART_SendBreak
2901                     	xdef	_USART_SetPrescaler
2902                     	xdef	_USART_Cmd
2903                     	xdef	_USART_ClockInit
2904                     	xdef	_USART_Init
2905                     	xdef	_USART_DeInit
2906                     	xref	_CLK_GetClockFreq
2907                     	xref.b	c_lreg
2908                     	xref.b	c_x
2927                     	xref	c_lursh
2928                     	xref	c_ltor
2929                     	xref	c_rtol
2930                     	xref	c_ludv
2931                     	end
