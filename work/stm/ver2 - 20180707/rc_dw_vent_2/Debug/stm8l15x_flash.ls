   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  85                     ; 171 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  85                     ; 172 {
  86                     .text:	section	.text,new
  87  0000               f_FLASH_SetProgrammingTime:
  91                     ; 174   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  93                     ; 176   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  95  0000 72115050      	bres	20560,#0
  96                     ; 177   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  98  0004 ca5050        	or	a,20560
  99  0007 c75050        	ld	20560,a
 100                     ; 178 }
 103  000a 87            	retf	
 127                     ; 185 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 127                     ; 186 {
 128                     .text:	section	.text,new
 129  0000               f_FLASH_GetProgrammingTime:
 133                     ; 187   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 135  0000 c65050        	ld	a,20560
 136  0003 a401          	and	a,#1
 139  0005 87            	retf	
 194                     ; 200 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 194                     ; 201 {
 195                     .text:	section	.text,new
 196  0000               f_FLASH_PowerWaitModeConfig:
 200                     ; 203   assert_param(IS_FLASH_POWER(FLASH_Power));
 202                     ; 206   if (FLASH_Power != FLASH_Power_On)
 204  0000 4a            	dec	a
 205  0001 2705          	jreq	L57
 206                     ; 208     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 208  0003 72145050      	bset	20560,#2
 211  0007 87            	retf	
 212  0008               L57:
 213                     ; 213     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 215  0008 72155050      	bres	20560,#2
 216                     ; 215 }
 219  000c 87            	retf	
 241                     ; 256 void FLASH_DeInit(void)
 241                     ; 257 {
 242                     .text:	section	.text,new
 243  0000               f_FLASH_DeInit:
 247                     ; 258   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 249  0000 725f5050      	clr	20560
 250                     ; 259   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 252  0004 725f5051      	clr	20561
 253                     ; 260   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 255  0008 35405054      	mov	20564,#64
 256                     ; 261   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 258  000c c65054        	ld	a,20564
 259                     ; 262 }
 262  000f 87            	retf	
 317                     ; 272 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 317                     ; 273 {
 318                     .text:	section	.text,new
 319  0000               f_FLASH_Unlock:
 321  0000 88            	push	a
 322       00000000      OFST:	set	0
 325                     ; 275   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 327                     ; 278   if (FLASH_MemType == FLASH_MemType_Program)
 329  0001 a1fd          	cp	a,#253
 330  0003 2608          	jrne	L731
 331                     ; 280     FLASH->PUKR = FLASH_RASS_KEY1;
 333  0005 35565052      	mov	20562,#86
 334                     ; 281     FLASH->PUKR = FLASH_RASS_KEY2;
 336  0009 35ae5052      	mov	20562,#174
 337  000d               L731:
 338                     ; 285   if (FLASH_MemType == FLASH_MemType_Data)
 340  000d 7b01          	ld	a,(OFST+1,sp)
 341  000f a1f7          	cp	a,#247
 342  0011 2608          	jrne	L141
 343                     ; 287     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 345  0013 35ae5053      	mov	20563,#174
 346                     ; 288     FLASH->DUKR = FLASH_RASS_KEY1;
 348  0017 35565053      	mov	20563,#86
 349  001b               L141:
 350                     ; 290 }
 353  001b 84            	pop	a
 354  001c 87            	retf	
 388                     ; 300 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 388                     ; 301 {
 389                     .text:	section	.text,new
 390  0000               f_FLASH_Lock:
 394                     ; 303   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 396                     ; 305   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 398  0000 c45054        	and	a,20564
 399  0003 c75054        	ld	20564,a
 400                     ; 306 }
 403  0006 87            	retf	
 441                     ; 314 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 441                     ; 315 {
 442                     .text:	section	.text,new
 443  0000               f_FLASH_ProgramByte:
 445       00000000      OFST:	set	0
 448                     ; 317   assert_param(IS_FLASH_ADDRESS(Address));
 450                     ; 319   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 452  0000 1e06          	ldw	x,(OFST+6,sp)
 453  0002 7b08          	ld	a,(OFST+8,sp)
 454  0004 f7            	ld	(x),a
 455                     ; 320 }
 458  0005 87            	retf	
 489                     ; 327 void FLASH_EraseByte(uint32_t Address)
 489                     ; 328 {
 490                     .text:	section	.text,new
 491  0000               f_FLASH_EraseByte:
 493       00000000      OFST:	set	0
 496                     ; 330   assert_param(IS_FLASH_ADDRESS(Address));
 498                     ; 332   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 500  0000 1e06          	ldw	x,(OFST+6,sp)
 501  0002 7f            	clr	(x)
 502                     ; 333 }
 505  0003 87            	retf	
 543                     ; 341 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 543                     ; 342 {
 544                     .text:	section	.text,new
 545  0000               f_FLASH_ProgramWord:
 547       00000000      OFST:	set	0
 550                     ; 344   assert_param(IS_FLASH_ADDRESS(Address));
 552                     ; 346   FLASH->CR2 |= FLASH_CR2_WPRG;
 554  0000 721c5051      	bset	20561,#6
 555                     ; 349   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 557  0004 1e06          	ldw	x,(OFST+6,sp)
 558  0006 7b08          	ld	a,(OFST+8,sp)
 559  0008 f7            	ld	(x),a
 560                     ; 351   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 562  0009 7b09          	ld	a,(OFST+9,sp)
 563  000b e701          	ld	(1,x),a
 564                     ; 353   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 566  000d 7b0a          	ld	a,(OFST+10,sp)
 567  000f e702          	ld	(2,x),a
 568                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 570  0011 7b0b          	ld	a,(OFST+11,sp)
 571  0013 e703          	ld	(3,x),a
 572                     ; 356 }
 575  0015 87            	retf	
 606                     ; 363 uint8_t FLASH_ReadByte(uint32_t Address)
 606                     ; 364 {
 607                     .text:	section	.text,new
 608  0000               f_FLASH_ReadByte:
 610       00000000      OFST:	set	0
 613                     ; 366   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 615  0000 1e06          	ldw	x,(OFST+6,sp)
 616  0002 f6            	ld	a,(x)
 619  0003 87            	retf	
 659                     ; 413 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 659                     ; 414 {
 660                     .text:	section	.text,new
 661  0000               f_FLASH_ProgramOptionByte:
 663  0000 89            	pushw	x
 664       00000000      OFST:	set	0
 667                     ; 416   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 669                     ; 419   FLASH->CR2 |= FLASH_CR2_OPT;
 671  0001 721e5051      	bset	20561,#7
 672                     ; 422   *((PointerAttr uint8_t*)Address) = Data;
 674  0005 1e01          	ldw	x,(OFST+1,sp)
 675  0007 7b06          	ld	a,(OFST+6,sp)
 676  0009 f7            	ld	(x),a
 677                     ; 424   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 679  000a a6fd          	ld	a,#253
 680  000c 8d000000      	callf	f_FLASH_WaitForLastOperation
 682                     ; 427   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 684  0010 721f5051      	bres	20561,#7
 685                     ; 428 }
 688  0014 85            	popw	x
 689  0015 87            	retf	
 722                     ; 435 void FLASH_EraseOptionByte(uint16_t Address)
 722                     ; 436 {
 723                     .text:	section	.text,new
 724  0000               f_FLASH_EraseOptionByte:
 728                     ; 438   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 730                     ; 441   FLASH->CR2 |= FLASH_CR2_OPT;
 732  0000 721e5051      	bset	20561,#7
 733                     ; 444   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 735  0004 7f            	clr	(x)
 736                     ; 446   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 738  0005 a6fd          	ld	a,#253
 739  0007 8d000000      	callf	f_FLASH_WaitForLastOperation
 741                     ; 449   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 743  000b 721f5051      	bres	20561,#7
 744                     ; 450 }
 747  000f 87            	retf	
 803                     ; 458 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 803                     ; 459 {
 804                     .text:	section	.text,new
 805  0000               f_FLASH_GetReadOutProtectionStatus:
 807  0000 88            	push	a
 808       00000001      OFST:	set	1
 811                     ; 460   FunctionalState state = DISABLE;
 813                     ; 462   if (OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 815  0001 c64800        	ld	a,18432
 816  0004 a1aa          	cp	a,#170
 817  0006 2604          	jrne	L523
 818                     ; 465     state =  ENABLE;
 820  0008 a601          	ld	a,#1
 822  000a 2001          	jra	L723
 823  000c               L523:
 824                     ; 470     state =  DISABLE;
 826  000c 4f            	clr	a
 827  000d               L723:
 828                     ; 473   return state;
 832  000d 5b01          	addw	sp,#1
 833  000f 87            	retf	
 864                     ; 481 uint16_t FLASH_GetBootSize(void)
 864                     ; 482 {
 865                     .text:	section	.text,new
 866  0000               f_FLASH_GetBootSize:
 868  0000 89            	pushw	x
 869       00000002      OFST:	set	2
 872                     ; 483   uint16_t temp = 0;
 874                     ; 486   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 876  0001 c64802        	ld	a,18434
 877  0004 5f            	clrw	x
 878  0005 97            	ld	xl,a
 879  0006 4f            	clr	a
 880  0007 02            	rlwa	x,a
 881  0008 44            	srl	a
 882  0009 56            	rrcw	x
 883                     ; 489   if (OPT->UBC > 0x7F)
 885  000a c64802        	ld	a,18434
 886  000d a180          	cp	a,#128
 887  000f 2503          	jrult	L543
 888                     ; 491     temp = 8192;
 890  0011 ae2000        	ldw	x,#8192
 891  0014               L543:
 892                     ; 495   return(temp);
 896  0014 5b02          	addw	sp,#2
 897  0016 87            	retf	
 928                     ; 505 uint16_t FLASH_GetCodeSize(void)
 928                     ; 506 {
 929                     .text:	section	.text,new
 930  0000               f_FLASH_GetCodeSize:
 932  0000 89            	pushw	x
 933       00000002      OFST:	set	2
 936                     ; 507   uint16_t temp = 0;
 938                     ; 510   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 940  0001 c64807        	ld	a,18439
 941  0004 5f            	clrw	x
 942  0005 97            	ld	xl,a
 943  0006 4f            	clr	a
 944  0007 02            	rlwa	x,a
 945  0008 44            	srl	a
 946  0009 56            	rrcw	x
 947                     ; 513   if (OPT->PCODESIZE > 0x7F)
 949  000a c64807        	ld	a,18439
 950  000d a180          	cp	a,#128
 951  000f 2503          	jrult	L363
 952                     ; 515     temp = 8192;
 954  0011 ae2000        	ldw	x,#8192
 955  0014               L363:
 956                     ; 519   return(temp);
 960  0014 5b02          	addw	sp,#2
 961  0016 87            	retf	
 995                     ; 544 void FLASH_ITConfig(FunctionalState NewState)
 995                     ; 545 {
 996                     .text:	section	.text,new
 997  0000               f_FLASH_ITConfig:
1001                     ; 548   assert_param(IS_FUNCTIONAL_STATE(NewState));
1003                     ; 550   if (NewState != DISABLE)
1005  0000 4d            	tnz	a
1006  0001 2705          	jreq	L304
1007                     ; 553     FLASH->CR1 |= FLASH_CR1_IE;
1009  0003 72125050      	bset	20560,#1
1012  0007 87            	retf	
1013  0008               L304:
1014                     ; 558     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1016  0008 72135050      	bres	20560,#1
1017                     ; 560 }
1020  000c 87            	retf	
1128                     ; 574 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1128                     ; 575 {
1129                     .text:	section	.text,new
1130  0000               f_FLASH_GetFlagStatus:
1132  0000 88            	push	a
1133       00000001      OFST:	set	1
1136                     ; 576   FlagStatus status = RESET;
1138                     ; 577   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1140                     ; 580   if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1142  0001 c45054        	and	a,20564
1143  0004 2702          	jreq	L754
1144                     ; 582     status = SET; /* Flash_FLAG is set*/
1146  0006 a601          	ld	a,#1
1148  0008               L754:
1149                     ; 586     status = RESET; /* Flash_FLAG is reset*/
1151                     ; 590   return status;
1155  0008 5b01          	addw	sp,#1
1156  000a 87            	retf	
1191                     ; 706 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1191                     ; 707 {
1192                     .text:	section	.text,new
1193  0000               f_FLASH_PowerRunModeConfig:
1197                     ; 709   assert_param(IS_FLASH_POWER(FLASH_Power));
1199                     ; 711   if (FLASH_Power != FLASH_Power_On)
1201  0000 4a            	dec	a
1202  0001 2705          	jreq	L105
1203                     ; 713   FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1205  0003 72165050      	bset	20560,#3
1208  0007 87            	retf	
1209  0008               L105:
1210                     ; 717     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1212  0008 72175050      	bres	20560,#3
1213                     ; 719 }
1216  000c 87            	retf	
1279                     ; 732 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1279                     ; 733 {
1280                     .text:	section	.text,new
1281  0000               f_FLASH_GetPowerStatus:
1285                     ; 734   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1287  0000 c65050        	ld	a,20560
1288  0003 a40c          	and	a,#12
1291  0005 87            	retf	
1388                     ; 752 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1388                     ; 753                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1388                     ; 754 {
1389                     .text:	section	.text,new
1390  0000               f_FLASH_ProgramBlock:
1392  0000 89            	pushw	x
1393  0001 5206          	subw	sp,#6
1394       00000006      OFST:	set	6
1397                     ; 755   uint16_t Count = 0;
1399                     ; 756   uint32_t startaddress = 0;
1401                     ; 759   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1403                     ; 760   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1405                     ; 761   if (FLASH_MemType == FLASH_MemType_Program)
1407  0003 7b0c          	ld	a,(OFST+6,sp)
1408  0005 a1fd          	cp	a,#253
1409  0007 2605          	jrne	L575
1410                     ; 763   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1412                     ; 764     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1414  0009 ae8000        	ldw	x,#32768
1416  000c 2003          	jra	L775
1417  000e               L575:
1418                     ; 768     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1420                     ; 769     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1422  000e ae1000        	ldw	x,#4096
1423  0011               L775:
1424  0011 1f03          	ldw	(OFST-3,sp),x
1425  0013 5f            	clrw	x
1426  0014 1f01          	ldw	(OFST-5,sp),x
1427                     ; 773   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1429  0016 a680          	ld	a,#128
1430  0018 1e07          	ldw	x,(OFST+1,sp)
1431  001a 8d000000      	callf	d_cmulx
1433  001e 96            	ldw	x,sp
1434  001f 5c            	incw	x
1435  0020 8d000000      	callf	d_lgadd
1437                     ; 776   if (FLASH_ProgMode == FLASH_ProgramMode_Standard)
1439  0024 7b0d          	ld	a,(OFST+7,sp)
1440  0026 2606          	jrne	L106
1441                     ; 779   FLASH->CR2 |= FLASH_CR2_PRG;
1443  0028 72105051      	bset	20561,#0
1445  002c 2004          	jra	L306
1446  002e               L106:
1447                     ; 784   FLASH->CR2 |= FLASH_CR2_FPRG;
1449  002e 72185051      	bset	20561,#4
1450  0032               L306:
1451                     ; 788   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1453  0032 5f            	clrw	x
1454  0033 1f05          	ldw	(OFST-1,sp),x
1455  0035               L506:
1456                     ; 790     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1458  0035 1e0e          	ldw	x,(OFST+8,sp)
1459  0037 72fb05        	addw	x,(OFST-1,sp)
1460  003a f6            	ld	a,(x)
1461  003b 1e03          	ldw	x,(OFST-3,sp)
1462  003d 72fb05        	addw	x,(OFST-1,sp)
1463  0040 f7            	ld	(x),a
1464                     ; 788   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1466  0041 1e05          	ldw	x,(OFST-1,sp)
1467  0043 5c            	incw	x
1468  0044 1f05          	ldw	(OFST-1,sp),x
1471  0046 a30080        	cpw	x,#128
1472  0049 25ea          	jrult	L506
1473                     ; 792 }
1476  004b 5b08          	addw	sp,#8
1477  004d 87            	retf	
1535                     ; 804 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1535                     ; 805 {
1536                     .text:	section	.text,new
1537  0000               f_FLASH_EraseBlock:
1539  0000 89            	pushw	x
1540  0001 5206          	subw	sp,#6
1541       00000006      OFST:	set	6
1544                     ; 806   uint32_t startaddress = 0;
1546                     ; 816   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1548                     ; 817   if (FLASH_MemType == FLASH_MemType_Program)
1550  0003 7b0c          	ld	a,(OFST+6,sp)
1551  0005 a1fd          	cp	a,#253
1552  0007 2605          	jrne	L146
1553                     ; 819   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1555                     ; 820     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1557  0009 ae8000        	ldw	x,#32768
1559  000c 2003          	jra	L346
1560  000e               L146:
1561                     ; 824     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1563                     ; 825     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1565  000e ae1000        	ldw	x,#4096
1566  0011               L346:
1567  0011 1f05          	ldw	(OFST-1,sp),x
1568  0013 5f            	clrw	x
1569  0014 1f03          	ldw	(OFST-3,sp),x
1570                     ; 831   pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1572  0016 a680          	ld	a,#128
1573  0018 1e07          	ldw	x,(OFST+1,sp)
1574  001a 8d000000      	callf	d_cmulx
1576  001e 96            	ldw	x,sp
1577  001f 1c0003        	addw	x,#OFST-3
1578  0022 8d000000      	callf	d_ladd
1580  0026 be02          	ldw	x,c_lreg+2
1581  0028 1f01          	ldw	(OFST-5,sp),x
1582                     ; 838   FLASH->CR2 |= FLASH_CR2_ERASE;
1584  002a 721a5051      	bset	20561,#5
1585                     ; 842   *pwFlash = (uint32_t)0;  
1587  002e 4f            	clr	a
1588  002f e703          	ld	(3,x),a
1589  0031 e702          	ld	(2,x),a
1590  0033 e701          	ld	(1,x),a
1591  0035 f7            	ld	(x),a
1592                     ; 850 }
1595  0036 5b08          	addw	sp,#8
1596  0038 87            	retf	
1676                     ; 862 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1676                     ; 863 {
1677                     .text:	section	.text,new
1678  0000               f_FLASH_WaitForLastOperation:
1680  0000 5205          	subw	sp,#5
1681       00000005      OFST:	set	5
1684                     ; 864   uint32_t timeout = OPERATION_TIMEOUT;
1686  0002 aeffff        	ldw	x,#65535
1687  0005 1f03          	ldw	(OFST-2,sp),x
1688  0007 5f            	clrw	x
1689  0008 1f01          	ldw	(OFST-4,sp),x
1690                     ; 865   uint8_t flagstatus = 0x00;
1692  000a 0f05          	clr	(OFST+0,sp)
1693                     ; 867   if (FLASH_MemType == FLASH_MemType_Program)
1695  000c a1fd          	cp	a,#253
1696  000e 262e          	jrne	L717
1698  0010 200f          	jra	L507
1699  0012               L307:
1700                     ; 871       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1700                     ; 872                              FLASH_IAPSR_WR_PG_DIS));
1702  0012 c65054        	ld	a,20564
1703  0015 a405          	and	a,#5
1704  0017 6b05          	ld	(OFST+0,sp),a
1705                     ; 873       timeout--;
1707  0019 96            	ldw	x,sp
1708  001a 5c            	incw	x
1709  001b a601          	ld	a,#1
1710  001d 8d000000      	callf	d_lgsbc
1712  0021               L507:
1713                     ; 869   while ((flagstatus == 0x00) && (timeout != 0x00))
1715  0021 7b05          	ld	a,(OFST+0,sp)
1716  0023 2625          	jrne	L317
1718  0025 96            	ldw	x,sp
1719  0026 5c            	incw	x
1720  0027 8d000000      	callf	d_lzmp
1722  002b 26e5          	jrne	L307
1723  002d 201b          	jra	L317
1724  002f               L517:
1725                     ; 880       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1725                     ; 881                              FLASH_IAPSR_WR_PG_DIS));
1727  002f c65054        	ld	a,20564
1728  0032 a441          	and	a,#65
1729  0034 6b05          	ld	(OFST+0,sp),a
1730                     ; 882       timeout--;
1732  0036 96            	ldw	x,sp
1733  0037 5c            	incw	x
1734  0038 a601          	ld	a,#1
1735  003a 8d000000      	callf	d_lgsbc
1737  003e               L717:
1738                     ; 878     while ((flagstatus == 0x00) && (timeout != 0x00))
1740  003e 7b05          	ld	a,(OFST+0,sp)
1741  0040 2608          	jrne	L317
1743  0042 96            	ldw	x,sp
1744  0043 5c            	incw	x
1745  0044 8d000000      	callf	d_lzmp
1747  0048 26e5          	jrne	L517
1748  004a               L317:
1749                     ; 885   if (timeout == 0x00 )
1751  004a 96            	ldw	x,sp
1752  004b 5c            	incw	x
1753  004c 8d000000      	callf	d_lzmp
1755  0050 2604          	jrne	L527
1756                     ; 887   flagstatus = FLASH_Status_TimeOut;
1758  0052 a602          	ld	a,#2
1759  0054 6b05          	ld	(OFST+0,sp),a
1760  0056               L527:
1761                     ; 890   return((FLASH_Status_TypeDef)flagstatus);
1763  0056 7b05          	ld	a,(OFST+0,sp)
1766  0058 5b05          	addw	sp,#5
1767  005a 87            	retf	
1779                     	xdef	f_FLASH_WaitForLastOperation
1780                     	xdef	f_FLASH_EraseBlock
1781                     	xdef	f_FLASH_ProgramBlock
1782                     	xdef	f_FLASH_GetPowerStatus
1783                     	xdef	f_FLASH_PowerRunModeConfig
1784                     	xdef	f_FLASH_GetFlagStatus
1785                     	xdef	f_FLASH_ITConfig
1786                     	xdef	f_FLASH_EraseOptionByte
1787                     	xdef	f_FLASH_ProgramOptionByte
1788                     	xdef	f_FLASH_GetReadOutProtectionStatus
1789                     	xdef	f_FLASH_GetCodeSize
1790                     	xdef	f_FLASH_GetBootSize
1791                     	xdef	f_FLASH_ReadByte
1792                     	xdef	f_FLASH_ProgramWord
1793                     	xdef	f_FLASH_EraseByte
1794                     	xdef	f_FLASH_ProgramByte
1795                     	xdef	f_FLASH_Lock
1796                     	xdef	f_FLASH_Unlock
1797                     	xdef	f_FLASH_DeInit
1798                     	xdef	f_FLASH_PowerWaitModeConfig
1799                     	xdef	f_FLASH_SetProgrammingTime
1800                     	xdef	f_FLASH_GetProgrammingTime
1801                     	xref.b	c_lreg
1820                     	xref	d_lzmp
1821                     	xref	d_lgsbc
1822                     	xref	d_ladd
1823                     	xref	d_lgadd
1824                     	xref	d_cmulx
1825                     	end
