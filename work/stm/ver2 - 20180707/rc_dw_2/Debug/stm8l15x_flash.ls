   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  85                     ; 171 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  85                     ; 172 {
  87                     .text:	section	.text,new
  88  0000               _FLASH_SetProgrammingTime:
  92                     ; 174   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  94                     ; 176   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  96  0000 72115050      	bres	20560,#0
  97                     ; 177   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  99  0004 ca5050        	or	a,20560
 100  0007 c75050        	ld	20560,a
 101                     ; 178 }
 104  000a 81            	ret	
 129                     ; 185 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 129                     ; 186 {
 130                     .text:	section	.text,new
 131  0000               _FLASH_GetProgrammingTime:
 135                     ; 187   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 137  0000 c65050        	ld	a,20560
 138  0003 a401          	and	a,#1
 141  0005 81            	ret	
 197                     ; 200 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 197                     ; 201 {
 198                     .text:	section	.text,new
 199  0000               _FLASH_PowerWaitModeConfig:
 203                     ; 203   assert_param(IS_FLASH_POWER(FLASH_Power));
 205                     ; 206   if (FLASH_Power != FLASH_Power_On)
 207  0000 4a            	dec	a
 208  0001 2705          	jreq	L57
 209                     ; 208     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 211  0003 72145050      	bset	20560,#2
 214  0007 81            	ret	
 215  0008               L57:
 216                     ; 213     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 218  0008 72155050      	bres	20560,#2
 219                     ; 215 }
 222  000c 81            	ret	
 245                     ; 256 void FLASH_DeInit(void)
 245                     ; 257 {
 246                     .text:	section	.text,new
 247  0000               _FLASH_DeInit:
 251                     ; 258   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 253  0000 725f5050      	clr	20560
 254                     ; 259   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 256  0004 725f5051      	clr	20561
 257                     ; 260   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 259  0008 35405054      	mov	20564,#64
 260                     ; 261   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 262  000c c65054        	ld	a,20564
 263                     ; 262 }
 266  000f 81            	ret	
 322                     ; 272 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 322                     ; 273 {
 323                     .text:	section	.text,new
 324  0000               _FLASH_Unlock:
 326  0000 88            	push	a
 327       00000000      OFST:	set	0
 330                     ; 275   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 332                     ; 278   if (FLASH_MemType == FLASH_MemType_Program)
 334  0001 a1fd          	cp	a,#253
 335  0003 2608          	jrne	L731
 336                     ; 280     FLASH->PUKR = FLASH_RASS_KEY1;
 338  0005 35565052      	mov	20562,#86
 339                     ; 281     FLASH->PUKR = FLASH_RASS_KEY2;
 341  0009 35ae5052      	mov	20562,#174
 342  000d               L731:
 343                     ; 285   if (FLASH_MemType == FLASH_MemType_Data)
 345  000d 7b01          	ld	a,(OFST+1,sp)
 346  000f a1f7          	cp	a,#247
 347  0011 2608          	jrne	L141
 348                     ; 287     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 350  0013 35ae5053      	mov	20563,#174
 351                     ; 288     FLASH->DUKR = FLASH_RASS_KEY1;
 353  0017 35565053      	mov	20563,#86
 354  001b               L141:
 355                     ; 290 }
 358  001b 84            	pop	a
 359  001c 81            	ret	
 394                     ; 300 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 394                     ; 301 {
 395                     .text:	section	.text,new
 396  0000               _FLASH_Lock:
 400                     ; 303   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 402                     ; 305   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 404  0000 c45054        	and	a,20564
 405  0003 c75054        	ld	20564,a
 406                     ; 306 }
 409  0006 81            	ret	
 448                     ; 314 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 448                     ; 315 {
 449                     .text:	section	.text,new
 450  0000               _FLASH_ProgramByte:
 452       00000000      OFST:	set	0
 455                     ; 317   assert_param(IS_FLASH_ADDRESS(Address));
 457                     ; 319   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 459  0000 1e05          	ldw	x,(OFST+5,sp)
 460  0002 7b07          	ld	a,(OFST+7,sp)
 461  0004 f7            	ld	(x),a
 462                     ; 320 }
 465  0005 81            	ret	
 497                     ; 327 void FLASH_EraseByte(uint32_t Address)
 497                     ; 328 {
 498                     .text:	section	.text,new
 499  0000               _FLASH_EraseByte:
 501       00000000      OFST:	set	0
 504                     ; 330   assert_param(IS_FLASH_ADDRESS(Address));
 506                     ; 332   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 508  0000 1e05          	ldw	x,(OFST+5,sp)
 509  0002 7f            	clr	(x)
 510                     ; 333 }
 513  0003 81            	ret	
 552                     ; 341 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 552                     ; 342 {
 553                     .text:	section	.text,new
 554  0000               _FLASH_ProgramWord:
 556       00000000      OFST:	set	0
 559                     ; 344   assert_param(IS_FLASH_ADDRESS(Address));
 561                     ; 346   FLASH->CR2 |= FLASH_CR2_WPRG;
 563  0000 721c5051      	bset	20561,#6
 564                     ; 349   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 566  0004 1e05          	ldw	x,(OFST+5,sp)
 567  0006 7b07          	ld	a,(OFST+7,sp)
 568  0008 f7            	ld	(x),a
 569                     ; 351   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 571  0009 7b08          	ld	a,(OFST+8,sp)
 572  000b e701          	ld	(1,x),a
 573                     ; 353   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 575  000d 7b09          	ld	a,(OFST+9,sp)
 576  000f e702          	ld	(2,x),a
 577                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 579  0011 7b0a          	ld	a,(OFST+10,sp)
 580  0013 e703          	ld	(3,x),a
 581                     ; 356 }
 584  0015 81            	ret	
 616                     ; 363 uint8_t FLASH_ReadByte(uint32_t Address)
 616                     ; 364 {
 617                     .text:	section	.text,new
 618  0000               _FLASH_ReadByte:
 620       00000000      OFST:	set	0
 623                     ; 366   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 625  0000 1e05          	ldw	x,(OFST+5,sp)
 626  0002 f6            	ld	a,(x)
 629  0003 81            	ret	
 670                     ; 413 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 670                     ; 414 {
 671                     .text:	section	.text,new
 672  0000               _FLASH_ProgramOptionByte:
 674  0000 89            	pushw	x
 675       00000000      OFST:	set	0
 678                     ; 416   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 680                     ; 419   FLASH->CR2 |= FLASH_CR2_OPT;
 682  0001 721e5051      	bset	20561,#7
 683                     ; 422   *((PointerAttr uint8_t*)Address) = Data;
 685  0005 1e01          	ldw	x,(OFST+1,sp)
 686  0007 7b05          	ld	a,(OFST+5,sp)
 687  0009 f7            	ld	(x),a
 688                     ; 424   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 690  000a a6fd          	ld	a,#253
 691  000c cd0000        	call	_FLASH_WaitForLastOperation
 693                     ; 427   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 695  000f 721f5051      	bres	20561,#7
 696                     ; 428 }
 699  0013 85            	popw	x
 700  0014 81            	ret	
 734                     ; 435 void FLASH_EraseOptionByte(uint16_t Address)
 734                     ; 436 {
 735                     .text:	section	.text,new
 736  0000               _FLASH_EraseOptionByte:
 740                     ; 438   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 742                     ; 441   FLASH->CR2 |= FLASH_CR2_OPT;
 744  0000 721e5051      	bset	20561,#7
 745                     ; 444   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 747  0004 7f            	clr	(x)
 748                     ; 446   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 750  0005 a6fd          	ld	a,#253
 751  0007 cd0000        	call	_FLASH_WaitForLastOperation
 753                     ; 449   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 755  000a 721f5051      	bres	20561,#7
 756                     ; 450 }
 759  000e 81            	ret	
 816                     ; 458 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 816                     ; 459 {
 817                     .text:	section	.text,new
 818  0000               _FLASH_GetReadOutProtectionStatus:
 820  0000 88            	push	a
 821       00000001      OFST:	set	1
 824                     ; 460   FunctionalState state = DISABLE;
 826                     ; 462   if (OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 828  0001 c64800        	ld	a,18432
 829  0004 a1aa          	cp	a,#170
 830  0006 2604          	jrne	L523
 831                     ; 465     state =  ENABLE;
 833  0008 a601          	ld	a,#1
 835  000a 2001          	jra	L723
 836  000c               L523:
 837                     ; 470     state =  DISABLE;
 839  000c 4f            	clr	a
 840  000d               L723:
 841                     ; 473   return state;
 845  000d 5b01          	addw	sp,#1
 846  000f 81            	ret	
 878                     ; 481 uint16_t FLASH_GetBootSize(void)
 878                     ; 482 {
 879                     .text:	section	.text,new
 880  0000               _FLASH_GetBootSize:
 882  0000 89            	pushw	x
 883       00000002      OFST:	set	2
 886                     ; 483   uint16_t temp = 0;
 888                     ; 486   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 890  0001 c64802        	ld	a,18434
 891  0004 5f            	clrw	x
 892  0005 97            	ld	xl,a
 893  0006 4f            	clr	a
 894  0007 02            	rlwa	x,a
 895  0008 44            	srl	a
 896  0009 56            	rrcw	x
 897                     ; 489   if (OPT->UBC > 0x7F)
 899  000a c64802        	ld	a,18434
 900  000d a180          	cp	a,#128
 901  000f 2503          	jrult	L543
 902                     ; 491     temp = 8192;
 904  0011 ae2000        	ldw	x,#8192
 905  0014               L543:
 906                     ; 495   return(temp);
 910  0014 5b02          	addw	sp,#2
 911  0016 81            	ret	
 943                     ; 505 uint16_t FLASH_GetCodeSize(void)
 943                     ; 506 {
 944                     .text:	section	.text,new
 945  0000               _FLASH_GetCodeSize:
 947  0000 89            	pushw	x
 948       00000002      OFST:	set	2
 951                     ; 507   uint16_t temp = 0;
 953                     ; 510   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 955  0001 c64807        	ld	a,18439
 956  0004 5f            	clrw	x
 957  0005 97            	ld	xl,a
 958  0006 4f            	clr	a
 959  0007 02            	rlwa	x,a
 960  0008 44            	srl	a
 961  0009 56            	rrcw	x
 962                     ; 513   if (OPT->PCODESIZE > 0x7F)
 964  000a c64807        	ld	a,18439
 965  000d a180          	cp	a,#128
 966  000f 2503          	jrult	L363
 967                     ; 515     temp = 8192;
 969  0011 ae2000        	ldw	x,#8192
 970  0014               L363:
 971                     ; 519   return(temp);
 975  0014 5b02          	addw	sp,#2
 976  0016 81            	ret	
1011                     ; 544 void FLASH_ITConfig(FunctionalState NewState)
1011                     ; 545 {
1012                     .text:	section	.text,new
1013  0000               _FLASH_ITConfig:
1017                     ; 548   assert_param(IS_FUNCTIONAL_STATE(NewState));
1019                     ; 550   if (NewState != DISABLE)
1021  0000 4d            	tnz	a
1022  0001 2705          	jreq	L304
1023                     ; 553     FLASH->CR1 |= FLASH_CR1_IE;
1025  0003 72125050      	bset	20560,#1
1028  0007 81            	ret	
1029  0008               L304:
1030                     ; 558     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1032  0008 72135050      	bres	20560,#1
1033                     ; 560 }
1036  000c 81            	ret	
1145                     ; 574 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1145                     ; 575 {
1146                     .text:	section	.text,new
1147  0000               _FLASH_GetFlagStatus:
1149  0000 88            	push	a
1150       00000001      OFST:	set	1
1153                     ; 576   FlagStatus status = RESET;
1155                     ; 577   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1157                     ; 580   if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1159  0001 c45054        	and	a,20564
1160  0004 2702          	jreq	L754
1161                     ; 582     status = SET; /* Flash_FLAG is set*/
1163  0006 a601          	ld	a,#1
1165  0008               L754:
1166                     ; 586     status = RESET; /* Flash_FLAG is reset*/
1168                     ; 590   return status;
1172  0008 5b01          	addw	sp,#1
1173  000a 81            	ret	
1209                     ; 706 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1209                     ; 707 {
1210                     .text:	section	.text,new
1211  0000               _FLASH_PowerRunModeConfig:
1215                     ; 709   assert_param(IS_FLASH_POWER(FLASH_Power));
1217                     ; 711   if (FLASH_Power != FLASH_Power_On)
1219  0000 4a            	dec	a
1220  0001 2705          	jreq	L105
1221                     ; 713   FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1223  0003 72165050      	bset	20560,#3
1226  0007 81            	ret	
1227  0008               L105:
1228                     ; 717     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1230  0008 72175050      	bres	20560,#3
1231                     ; 719 }
1234  000c 81            	ret	
1298                     ; 732 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1298                     ; 733 {
1299                     .text:	section	.text,new
1300  0000               _FLASH_GetPowerStatus:
1304                     ; 734   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1306  0000 c65050        	ld	a,20560
1307  0003 a40c          	and	a,#12
1310  0005 81            	ret	
1408                     ; 752 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1408                     ; 753                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1408                     ; 754 {
1409                     .text:	section	.text,new
1410  0000               _FLASH_ProgramBlock:
1412  0000 89            	pushw	x
1413  0001 5206          	subw	sp,#6
1414       00000006      OFST:	set	6
1417                     ; 755   uint16_t Count = 0;
1419                     ; 756   uint32_t startaddress = 0;
1421                     ; 759   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1423                     ; 760   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1425                     ; 761   if (FLASH_MemType == FLASH_MemType_Program)
1427  0003 7b0b          	ld	a,(OFST+5,sp)
1428  0005 a1fd          	cp	a,#253
1429  0007 2605          	jrne	L575
1430                     ; 763   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1432                     ; 764     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1434  0009 ae8000        	ldw	x,#32768
1436  000c 2003          	jra	L775
1437  000e               L575:
1438                     ; 768     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1440                     ; 769     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1442  000e ae1000        	ldw	x,#4096
1443  0011               L775:
1444  0011 1f03          	ldw	(OFST-3,sp),x
1445  0013 5f            	clrw	x
1446  0014 1f01          	ldw	(OFST-5,sp),x
1447                     ; 773   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1449  0016 a680          	ld	a,#128
1450  0018 1e07          	ldw	x,(OFST+1,sp)
1451  001a cd0000        	call	c_cmulx
1453  001d 96            	ldw	x,sp
1454  001e 5c            	incw	x
1455  001f cd0000        	call	c_lgadd
1457                     ; 776   if (FLASH_ProgMode == FLASH_ProgramMode_Standard)
1459  0022 7b0c          	ld	a,(OFST+6,sp)
1460  0024 2606          	jrne	L106
1461                     ; 779   FLASH->CR2 |= FLASH_CR2_PRG;
1463  0026 72105051      	bset	20561,#0
1465  002a 2004          	jra	L306
1466  002c               L106:
1467                     ; 784   FLASH->CR2 |= FLASH_CR2_FPRG;
1469  002c 72185051      	bset	20561,#4
1470  0030               L306:
1471                     ; 788   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1473  0030 5f            	clrw	x
1474  0031 1f05          	ldw	(OFST-1,sp),x
1475  0033               L506:
1476                     ; 790     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1478  0033 1e0d          	ldw	x,(OFST+7,sp)
1479  0035 72fb05        	addw	x,(OFST-1,sp)
1480  0038 f6            	ld	a,(x)
1481  0039 1e03          	ldw	x,(OFST-3,sp)
1482  003b 72fb05        	addw	x,(OFST-1,sp)
1483  003e f7            	ld	(x),a
1484                     ; 788   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1486  003f 1e05          	ldw	x,(OFST-1,sp)
1487  0041 5c            	incw	x
1488  0042 1f05          	ldw	(OFST-1,sp),x
1491  0044 a30080        	cpw	x,#128
1492  0047 25ea          	jrult	L506
1493                     ; 792 }
1496  0049 5b08          	addw	sp,#8
1497  004b 81            	ret	
1556                     ; 804 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1556                     ; 805 {
1557                     .text:	section	.text,new
1558  0000               _FLASH_EraseBlock:
1560  0000 89            	pushw	x
1561  0001 5206          	subw	sp,#6
1562       00000006      OFST:	set	6
1565                     ; 806   uint32_t startaddress = 0;
1567                     ; 816   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1569                     ; 817   if (FLASH_MemType == FLASH_MemType_Program)
1571  0003 7b0b          	ld	a,(OFST+5,sp)
1572  0005 a1fd          	cp	a,#253
1573  0007 2605          	jrne	L146
1574                     ; 819   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1576                     ; 820     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1578  0009 ae8000        	ldw	x,#32768
1580  000c 2003          	jra	L346
1581  000e               L146:
1582                     ; 824     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1584                     ; 825     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1586  000e ae1000        	ldw	x,#4096
1587  0011               L346:
1588  0011 1f05          	ldw	(OFST-1,sp),x
1589  0013 5f            	clrw	x
1590  0014 1f03          	ldw	(OFST-3,sp),x
1591                     ; 831   pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1593  0016 a680          	ld	a,#128
1594  0018 1e07          	ldw	x,(OFST+1,sp)
1595  001a cd0000        	call	c_cmulx
1597  001d 96            	ldw	x,sp
1598  001e 1c0003        	addw	x,#OFST-3
1599  0021 cd0000        	call	c_ladd
1601  0024 be02          	ldw	x,c_lreg+2
1602  0026 1f01          	ldw	(OFST-5,sp),x
1603                     ; 838   FLASH->CR2 |= FLASH_CR2_ERASE;
1605  0028 721a5051      	bset	20561,#5
1606                     ; 842   *pwFlash = (uint32_t)0;  
1608  002c 4f            	clr	a
1609  002d e703          	ld	(3,x),a
1610  002f e702          	ld	(2,x),a
1611  0031 e701          	ld	(1,x),a
1612  0033 f7            	ld	(x),a
1613                     ; 850 }
1616  0034 5b08          	addw	sp,#8
1617  0036 81            	ret	
1698                     ; 862 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1698                     ; 863 {
1699                     .text:	section	.text,new
1700  0000               _FLASH_WaitForLastOperation:
1702  0000 5205          	subw	sp,#5
1703       00000005      OFST:	set	5
1706                     ; 864   uint32_t timeout = OPERATION_TIMEOUT;
1708  0002 aeffff        	ldw	x,#65535
1709  0005 1f03          	ldw	(OFST-2,sp),x
1710  0007 5f            	clrw	x
1711  0008 1f01          	ldw	(OFST-4,sp),x
1712                     ; 865   uint8_t flagstatus = 0x00;
1714  000a 0f05          	clr	(OFST+0,sp)
1715                     ; 867   if (FLASH_MemType == FLASH_MemType_Program)
1717  000c a1fd          	cp	a,#253
1718  000e 262b          	jrne	L717
1720  0010 200e          	jra	L507
1721  0012               L307:
1722                     ; 871       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1722                     ; 872                              FLASH_IAPSR_WR_PG_DIS));
1724  0012 c65054        	ld	a,20564
1725  0015 a405          	and	a,#5
1726  0017 6b05          	ld	(OFST+0,sp),a
1727                     ; 873       timeout--;
1729  0019 96            	ldw	x,sp
1730  001a 5c            	incw	x
1731  001b a601          	ld	a,#1
1732  001d cd0000        	call	c_lgsbc
1734  0020               L507:
1735                     ; 869   while ((flagstatus == 0x00) && (timeout != 0x00))
1737  0020 7b05          	ld	a,(OFST+0,sp)
1738  0022 2622          	jrne	L317
1740  0024 96            	ldw	x,sp
1741  0025 5c            	incw	x
1742  0026 cd0000        	call	c_lzmp
1744  0029 26e7          	jrne	L307
1745  002b 2019          	jra	L317
1746  002d               L517:
1747                     ; 880       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1747                     ; 881                              FLASH_IAPSR_WR_PG_DIS));
1749  002d c65054        	ld	a,20564
1750  0030 a441          	and	a,#65
1751  0032 6b05          	ld	(OFST+0,sp),a
1752                     ; 882       timeout--;
1754  0034 96            	ldw	x,sp
1755  0035 5c            	incw	x
1756  0036 a601          	ld	a,#1
1757  0038 cd0000        	call	c_lgsbc
1759  003b               L717:
1760                     ; 878     while ((flagstatus == 0x00) && (timeout != 0x00))
1762  003b 7b05          	ld	a,(OFST+0,sp)
1763  003d 2607          	jrne	L317
1765  003f 96            	ldw	x,sp
1766  0040 5c            	incw	x
1767  0041 cd0000        	call	c_lzmp
1769  0044 26e7          	jrne	L517
1770  0046               L317:
1771                     ; 885   if (timeout == 0x00 )
1773  0046 96            	ldw	x,sp
1774  0047 5c            	incw	x
1775  0048 cd0000        	call	c_lzmp
1777  004b 2604          	jrne	L527
1778                     ; 887   flagstatus = FLASH_Status_TimeOut;
1780  004d a602          	ld	a,#2
1781  004f 6b05          	ld	(OFST+0,sp),a
1782  0051               L527:
1783                     ; 890   return((FLASH_Status_TypeDef)flagstatus);
1785  0051 7b05          	ld	a,(OFST+0,sp)
1788  0053 5b05          	addw	sp,#5
1789  0055 81            	ret	
1802                     	xdef	_FLASH_WaitForLastOperation
1803                     	xdef	_FLASH_EraseBlock
1804                     	xdef	_FLASH_ProgramBlock
1805                     	xdef	_FLASH_GetPowerStatus
1806                     	xdef	_FLASH_PowerRunModeConfig
1807                     	xdef	_FLASH_GetFlagStatus
1808                     	xdef	_FLASH_ITConfig
1809                     	xdef	_FLASH_EraseOptionByte
1810                     	xdef	_FLASH_ProgramOptionByte
1811                     	xdef	_FLASH_GetReadOutProtectionStatus
1812                     	xdef	_FLASH_GetCodeSize
1813                     	xdef	_FLASH_GetBootSize
1814                     	xdef	_FLASH_ReadByte
1815                     	xdef	_FLASH_ProgramWord
1816                     	xdef	_FLASH_EraseByte
1817                     	xdef	_FLASH_ProgramByte
1818                     	xdef	_FLASH_Lock
1819                     	xdef	_FLASH_Unlock
1820                     	xdef	_FLASH_DeInit
1821                     	xdef	_FLASH_PowerWaitModeConfig
1822                     	xdef	_FLASH_SetProgrammingTime
1823                     	xdef	_FLASH_GetProgrammingTime
1824                     	xref.b	c_lreg
1843                     	xref	c_lzmp
1844                     	xref	c_lgsbc
1845                     	xref	c_ladd
1846                     	xref	c_lgadd
1847                     	xref	c_cmulx
1848                     	end
