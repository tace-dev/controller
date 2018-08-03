   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  76                     ; 81 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  76                     ; 82 {
  78                     	switch	.text
  79  0000               _FLASH_Unlock:
  83                     ; 84     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  85                     ; 87     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
  87  0000 a1fd          	cp	a,#253
  88  0002 260a          	jrne	L73
  89                     ; 89         FLASH->PUKR = FLASH_RASS_KEY1;
  91  0004 35565062      	mov	20578,#86
  92                     ; 90         FLASH->PUKR = FLASH_RASS_KEY2;
  94  0008 35ae5062      	mov	20578,#174
  96  000c 2008          	jra	L14
  97  000e               L73:
  98                     ; 95         FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 100  000e 35ae5064      	mov	20580,#174
 101                     ; 96         FLASH->DUKR = FLASH_RASS_KEY1;
 103  0012 35565064      	mov	20580,#86
 104  0016               L14:
 105                     ; 98 }
 108  0016 81            	ret
 143                     ; 106 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 143                     ; 107 {
 144                     	switch	.text
 145  0017               _FLASH_Lock:
 149                     ; 109     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 151                     ; 112   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 153  0017 c4505f        	and	a,20575
 154  001a c7505f        	ld	20575,a
 155                     ; 113 }
 158  001d 81            	ret
 181                     ; 120 void FLASH_DeInit(void)
 181                     ; 121 {
 182                     	switch	.text
 183  001e               _FLASH_DeInit:
 187                     ; 122     FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 189  001e 725f505a      	clr	20570
 190                     ; 123     FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 192  0022 725f505b      	clr	20571
 193                     ; 124     FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 195  0026 35ff505c      	mov	20572,#255
 196                     ; 125     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 198  002a 7217505f      	bres	20575,#3
 199                     ; 126     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 201  002e 7213505f      	bres	20575,#1
 202                     ; 127     (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 204  0032 c6505f        	ld	a,20575
 205                     ; 128 }
 208  0035 81            	ret
 263                     ; 136 void FLASH_ITConfig(FunctionalState NewState)
 263                     ; 137 {
 264                     	switch	.text
 265  0036               _FLASH_ITConfig:
 269                     ; 139   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 271                     ; 141     if (NewState != DISABLE)
 273  0036 4d            	tnz	a
 274  0037 2706          	jreq	L711
 275                     ; 143         FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 277  0039 7212505a      	bset	20570,#1
 279  003d 2004          	jra	L121
 280  003f               L711:
 281                     ; 147         FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 283  003f 7213505a      	bres	20570,#1
 284  0043               L121:
 285                     ; 149 }
 288  0043 81            	ret
 322                     ; 158 void FLASH_EraseByte(uint32_t Address)
 322                     ; 159 {
 323                     	switch	.text
 324  0044               _FLASH_EraseByte:
 326       00000000      OFST:	set	0
 329                     ; 161     assert_param(IS_FLASH_ADDRESS_OK(Address));
 331                     ; 164    *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; 
 333  0044 1e05          	ldw	x,(OFST+5,sp)
 334  0046 7f            	clr	(x)
 335                     ; 166 }
 338  0047 81            	ret
 381                     ; 176 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 381                     ; 177 {
 382                     	switch	.text
 383  0048               _FLASH_ProgramByte:
 385       00000000      OFST:	set	0
 388                     ; 179     assert_param(IS_FLASH_ADDRESS_OK(Address));
 390                     ; 180     *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 392  0048 7b07          	ld	a,(OFST+7,sp)
 393  004a 1e05          	ldw	x,(OFST+5,sp)
 394  004c f7            	ld	(x),a
 395                     ; 181 }
 398  004d 81            	ret
 432                     ; 190 uint8_t FLASH_ReadByte(uint32_t Address)
 432                     ; 191 {
 433                     	switch	.text
 434  004e               _FLASH_ReadByte:
 436       00000000      OFST:	set	0
 439                     ; 193     assert_param(IS_FLASH_ADDRESS_OK(Address));
 441                     ; 196     return(*(PointerAttr uint8_t *) (uint16_t)Address); 
 443  004e 1e05          	ldw	x,(OFST+5,sp)
 444  0050 f6            	ld	a,(x)
 447  0051 81            	ret
 490                     ; 207 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 490                     ; 208 {
 491                     	switch	.text
 492  0052               _FLASH_ProgramWord:
 494       00000000      OFST:	set	0
 497                     ; 210     assert_param(IS_FLASH_ADDRESS_OK(Address));
 499                     ; 213     FLASH->CR2 |= FLASH_CR2_WPRG;
 501  0052 721c505b      	bset	20571,#6
 502                     ; 214     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 504  0056 721d505c      	bres	20572,#6
 505                     ; 217     *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));
 507  005a 7b07          	ld	a,(OFST+7,sp)
 508  005c 1e05          	ldw	x,(OFST+5,sp)
 509  005e f7            	ld	(x),a
 510                     ; 219     *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data)+1); 
 512  005f 7b08          	ld	a,(OFST+8,sp)
 513  0061 1e05          	ldw	x,(OFST+5,sp)
 514  0063 e701          	ld	(1,x),a
 515                     ; 221     *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data)+2); 
 517  0065 7b09          	ld	a,(OFST+9,sp)
 518  0067 1e05          	ldw	x,(OFST+5,sp)
 519  0069 e702          	ld	(2,x),a
 520                     ; 223     *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data)+3); 
 522  006b 7b0a          	ld	a,(OFST+10,sp)
 523  006d 1e05          	ldw	x,(OFST+5,sp)
 524  006f e703          	ld	(3,x),a
 525                     ; 224 }
 528  0071 81            	ret
 573                     ; 232 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 573                     ; 233 {
 574                     	switch	.text
 575  0072               _FLASH_ProgramOptionByte:
 577  0072 89            	pushw	x
 578       00000000      OFST:	set	0
 581                     ; 235     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 583                     ; 238     FLASH->CR2 |= FLASH_CR2_OPT;
 585  0073 721e505b      	bset	20571,#7
 586                     ; 239     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 588  0077 721f505c      	bres	20572,#7
 589                     ; 242     if (Address == 0x4800)
 591  007b a34800        	cpw	x,#18432
 592  007e 2607          	jrne	L542
 593                     ; 245        *((NEAR uint8_t*)Address) = Data;
 595  0080 7b05          	ld	a,(OFST+5,sp)
 596  0082 1e01          	ldw	x,(OFST+1,sp)
 597  0084 f7            	ld	(x),a
 599  0085 200c          	jra	L742
 600  0087               L542:
 601                     ; 250        *((NEAR uint8_t*)Address) = Data;
 603  0087 7b05          	ld	a,(OFST+5,sp)
 604  0089 1e01          	ldw	x,(OFST+1,sp)
 605  008b f7            	ld	(x),a
 606                     ; 251        *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 608  008c 7b05          	ld	a,(OFST+5,sp)
 609  008e 43            	cpl	a
 610  008f 1e01          	ldw	x,(OFST+1,sp)
 611  0091 e701          	ld	(1,x),a
 612  0093               L742:
 613                     ; 253     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 615  0093 a6fd          	ld	a,#253
 616  0095 cd017d        	call	_FLASH_WaitForLastOperation
 618                     ; 256     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 620  0098 721f505b      	bres	20571,#7
 621                     ; 257     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 623  009c 721e505c      	bset	20572,#7
 624                     ; 258 }
 627  00a0 85            	popw	x
 628  00a1 81            	ret
 664                     ; 265 void FLASH_EraseOptionByte(uint16_t Address)
 664                     ; 266 {
 665                     	switch	.text
 666  00a2               _FLASH_EraseOptionByte:
 668  00a2 89            	pushw	x
 669       00000000      OFST:	set	0
 672                     ; 268     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 674                     ; 271     FLASH->CR2 |= FLASH_CR2_OPT;
 676  00a3 721e505b      	bset	20571,#7
 677                     ; 272     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 679  00a7 721f505c      	bres	20572,#7
 680                     ; 275      if (Address == 0x4800)
 682  00ab a34800        	cpw	x,#18432
 683  00ae 2603          	jrne	L762
 684                     ; 278        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 686  00b0 7f            	clr	(x)
 688  00b1 2009          	jra	L172
 689  00b3               L762:
 690                     ; 283        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 692  00b3 1e01          	ldw	x,(OFST+1,sp)
 693  00b5 7f            	clr	(x)
 694                     ; 284        *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 696  00b6 1e01          	ldw	x,(OFST+1,sp)
 697  00b8 a6ff          	ld	a,#255
 698  00ba e701          	ld	(1,x),a
 699  00bc               L172:
 700                     ; 286     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 702  00bc a6fd          	ld	a,#253
 703  00be cd017d        	call	_FLASH_WaitForLastOperation
 705                     ; 289     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 707  00c1 721f505b      	bres	20571,#7
 708                     ; 290     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 710  00c5 721e505c      	bset	20572,#7
 711                     ; 291 }
 714  00c9 85            	popw	x
 715  00ca 81            	ret
 778                     ; 297 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 778                     ; 298 {
 779                     	switch	.text
 780  00cb               _FLASH_ReadOptionByte:
 782  00cb 5204          	subw	sp,#4
 783       00000004      OFST:	set	4
 786                     ; 299     uint8_t value_optbyte, value_optbyte_complement = 0;
 788                     ; 300     uint16_t res_value = 0;
 790                     ; 303     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 792                     ; 306     value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 794  00cd f6            	ld	a,(x)
 795  00ce 6b01          	ld	(OFST-3,sp),a
 797                     ; 307     value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 799  00d0 e601          	ld	a,(1,x)
 800  00d2 6b02          	ld	(OFST-2,sp),a
 802                     ; 310     if (Address == 0x4800)	 
 804  00d4 a34800        	cpw	x,#18432
 805  00d7 2608          	jrne	L523
 806                     ; 312         res_value =	 value_optbyte;
 808  00d9 7b01          	ld	a,(OFST-3,sp)
 809  00db 5f            	clrw	x
 810  00dc 97            	ld	xl,a
 811  00dd 1f03          	ldw	(OFST-1,sp),x
 814  00df 2023          	jra	L723
 815  00e1               L523:
 816                     ; 316         if (value_optbyte == (uint8_t)(~value_optbyte_complement))
 818  00e1 7b02          	ld	a,(OFST-2,sp)
 819  00e3 43            	cpl	a
 820  00e4 1101          	cp	a,(OFST-3,sp)
 821  00e6 2617          	jrne	L133
 822                     ; 318             res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 824  00e8 7b01          	ld	a,(OFST-3,sp)
 825  00ea 5f            	clrw	x
 826  00eb 97            	ld	xl,a
 827  00ec 4f            	clr	a
 828  00ed 02            	rlwa	x,a
 829  00ee 1f03          	ldw	(OFST-1,sp),x
 831                     ; 319             res_value = res_value | (uint16_t)value_optbyte_complement;
 833  00f0 7b02          	ld	a,(OFST-2,sp)
 834  00f2 5f            	clrw	x
 835  00f3 97            	ld	xl,a
 836  00f4 01            	rrwa	x,a
 837  00f5 1a04          	or	a,(OFST+0,sp)
 838  00f7 01            	rrwa	x,a
 839  00f8 1a03          	or	a,(OFST-1,sp)
 840  00fa 01            	rrwa	x,a
 841  00fb 1f03          	ldw	(OFST-1,sp),x
 844  00fd 2005          	jra	L723
 845  00ff               L133:
 846                     ; 323             res_value = FLASH_OPTIONBYTE_ERROR;
 848  00ff ae5555        	ldw	x,#21845
 849  0102 1f03          	ldw	(OFST-1,sp),x
 851  0104               L723:
 852                     ; 326     return(res_value);
 854  0104 1e03          	ldw	x,(OFST-1,sp)
 857  0106 5b04          	addw	sp,#4
 858  0108 81            	ret
 932                     ; 335 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 932                     ; 336 {
 933                     	switch	.text
 934  0109               _FLASH_SetLowPowerMode:
 936  0109 88            	push	a
 937       00000000      OFST:	set	0
 940                     ; 338     assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 942                     ; 341     FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 944  010a c6505a        	ld	a,20570
 945  010d a4f3          	and	a,#243
 946  010f c7505a        	ld	20570,a
 947                     ; 344     FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 949  0112 c6505a        	ld	a,20570
 950  0115 1a01          	or	a,(OFST+1,sp)
 951  0117 c7505a        	ld	20570,a
 952                     ; 345 }
 955  011a 84            	pop	a
 956  011b 81            	ret
1014                     ; 353 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1014                     ; 354 {
1015                     	switch	.text
1016  011c               _FLASH_SetProgrammingTime:
1020                     ; 356     assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1022                     ; 358     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1024  011c 7211505a      	bres	20570,#0
1025                     ; 359     FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1027  0120 ca505a        	or	a,20570
1028  0123 c7505a        	ld	20570,a
1029                     ; 360 }
1032  0126 81            	ret
1057                     ; 367 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1057                     ; 368 {
1058                     	switch	.text
1059  0127               _FLASH_GetLowPowerMode:
1063                     ; 369     return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1065  0127 c6505a        	ld	a,20570
1066  012a a40c          	and	a,#12
1069  012c 81            	ret
1094                     ; 377 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1094                     ; 378 {
1095                     	switch	.text
1096  012d               _FLASH_GetProgrammingTime:
1100                     ; 379     return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1102  012d c6505a        	ld	a,20570
1103  0130 a401          	and	a,#1
1106  0132 81            	ret
1140                     ; 387 uint32_t FLASH_GetBootSize(void)
1140                     ; 388 {
1141                     	switch	.text
1142  0133               _FLASH_GetBootSize:
1144  0133 5204          	subw	sp,#4
1145       00000004      OFST:	set	4
1148                     ; 389     uint32_t temp = 0;
1150                     ; 392     temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1152  0135 c6505d        	ld	a,20573
1153  0138 5f            	clrw	x
1154  0139 97            	ld	xl,a
1155  013a 90ae0200      	ldw	y,#512
1156  013e cd0000        	call	c_umul
1158  0141 96            	ldw	x,sp
1159  0142 1c0001        	addw	x,#OFST-3
1160  0145 cd0000        	call	c_rtol
1163                     ; 395     if (FLASH->FPR == 0xFF)
1165  0148 c6505d        	ld	a,20573
1166  014b a1ff          	cp	a,#255
1167  014d 2611          	jrne	L354
1168                     ; 397         temp += 512;
1170  014f ae0200        	ldw	x,#512
1171  0152 bf02          	ldw	c_lreg+2,x
1172  0154 ae0000        	ldw	x,#0
1173  0157 bf00          	ldw	c_lreg,x
1174  0159 96            	ldw	x,sp
1175  015a 1c0001        	addw	x,#OFST-3
1176  015d cd0000        	call	c_lgadd
1179  0160               L354:
1180                     ; 401     return(temp);
1182  0160 96            	ldw	x,sp
1183  0161 1c0001        	addw	x,#OFST-3
1184  0164 cd0000        	call	c_ltor
1188  0167 5b04          	addw	sp,#4
1189  0169 81            	ret
1298                     ; 412 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1298                     ; 413 {
1299                     	switch	.text
1300  016a               _FLASH_GetFlagStatus:
1302  016a 88            	push	a
1303       00000001      OFST:	set	1
1306                     ; 414     FlagStatus status = RESET;
1308                     ; 416     assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1310                     ; 419     if ((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1312  016b c4505f        	and	a,20575
1313  016e 2706          	jreq	L525
1314                     ; 421         status = SET; /* FLASH_FLAG is set */
1316  0170 a601          	ld	a,#1
1317  0172 6b01          	ld	(OFST+0,sp),a
1320  0174 2002          	jra	L725
1321  0176               L525:
1322                     ; 425         status = RESET; /* FLASH_FLAG is reset*/
1324  0176 0f01          	clr	(OFST+0,sp)
1326  0178               L725:
1327                     ; 429     return status;
1329  0178 7b01          	ld	a,(OFST+0,sp)
1332  017a 5b01          	addw	sp,#1
1333  017c 81            	ret
1426                     ; 531 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1426                     ; 532 {
1427                     	switch	.text
1428  017d               _FLASH_WaitForLastOperation:
1430  017d 5205          	subw	sp,#5
1431       00000005      OFST:	set	5
1434                     ; 533     uint8_t flagstatus = 0x00;
1436  017f 0f05          	clr	(OFST+0,sp)
1438                     ; 534     uint32_t timeout = OPERATION_TIMEOUT;
1440  0181 aeffff        	ldw	x,#65535
1441  0184 1f03          	ldw	(OFST-2,sp),x
1442  0186 ae000f        	ldw	x,#15
1443  0189 1f01          	ldw	(OFST-4,sp),x
1445                     ; 539     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1447  018b a1fd          	cp	a,#253
1448  018d 2631          	jrne	L116
1450  018f 2010          	jra	L775
1451  0191               L575:
1452                     ; 543             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1452                     ; 544                                               FLASH_IAPSR_WR_PG_DIS));
1454  0191 c6505f        	ld	a,20575
1455  0194 a405          	and	a,#5
1456  0196 6b05          	ld	(OFST+0,sp),a
1458                     ; 545             timeout--;
1460  0198 96            	ldw	x,sp
1461  0199 1c0001        	addw	x,#OFST-4
1462  019c a601          	ld	a,#1
1463  019e cd0000        	call	c_lgsbc
1466  01a1               L775:
1467                     ; 541         while ((flagstatus == 0x00) && (timeout != 0x00))
1469  01a1 0d05          	tnz	(OFST+0,sp)
1470  01a3 2628          	jrne	L506
1472  01a5 96            	ldw	x,sp
1473  01a6 1c0001        	addw	x,#OFST-4
1474  01a9 cd0000        	call	c_lzmp
1476  01ac 26e3          	jrne	L575
1477  01ae 201d          	jra	L506
1478  01b0               L706:
1479                     ; 552             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1479                     ; 553                                               FLASH_IAPSR_WR_PG_DIS));
1481  01b0 c6505f        	ld	a,20575
1482  01b3 a441          	and	a,#65
1483  01b5 6b05          	ld	(OFST+0,sp),a
1485                     ; 554             timeout--;
1487  01b7 96            	ldw	x,sp
1488  01b8 1c0001        	addw	x,#OFST-4
1489  01bb a601          	ld	a,#1
1490  01bd cd0000        	call	c_lgsbc
1493  01c0               L116:
1494                     ; 550         while ((flagstatus == 0x00) && (timeout != 0x00))
1496  01c0 0d05          	tnz	(OFST+0,sp)
1497  01c2 2609          	jrne	L506
1499  01c4 96            	ldw	x,sp
1500  01c5 1c0001        	addw	x,#OFST-4
1501  01c8 cd0000        	call	c_lzmp
1503  01cb 26e3          	jrne	L706
1504  01cd               L506:
1505                     ; 566     if (timeout == 0x00 )
1507  01cd 96            	ldw	x,sp
1508  01ce 1c0001        	addw	x,#OFST-4
1509  01d1 cd0000        	call	c_lzmp
1511  01d4 2604          	jrne	L716
1512                     ; 568         flagstatus = FLASH_STATUS_TIMEOUT;
1514  01d6 a602          	ld	a,#2
1515  01d8 6b05          	ld	(OFST+0,sp),a
1517  01da               L716:
1518                     ; 571     return((FLASH_Status_TypeDef)flagstatus);
1520  01da 7b05          	ld	a,(OFST+0,sp)
1523  01dc 5b05          	addw	sp,#5
1524  01de 81            	ret
1587                     ; 581 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1587                     ; 582 {
1588                     	switch	.text
1589  01df               _FLASH_EraseBlock:
1591  01df 89            	pushw	x
1592  01e0 5206          	subw	sp,#6
1593       00000006      OFST:	set	6
1596                     ; 583   uint32_t startaddress = 0;
1598                     ; 593   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1600                     ; 594   if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1602  01e2 7b0b          	ld	a,(OFST+5,sp)
1603  01e4 a1fd          	cp	a,#253
1604  01e6 260c          	jrne	L356
1605                     ; 596       assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1607                     ; 597       startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1609  01e8 ae8000        	ldw	x,#32768
1610  01eb 1f05          	ldw	(OFST-1,sp),x
1611  01ed ae0000        	ldw	x,#0
1612  01f0 1f03          	ldw	(OFST-3,sp),x
1615  01f2 200a          	jra	L556
1616  01f4               L356:
1617                     ; 601       assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1619                     ; 602       startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1621  01f4 ae4000        	ldw	x,#16384
1622  01f7 1f05          	ldw	(OFST-1,sp),x
1623  01f9 ae0000        	ldw	x,#0
1624  01fc 1f03          	ldw	(OFST-3,sp),x
1626  01fe               L556:
1627                     ; 610     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1629  01fe 1e07          	ldw	x,(OFST+1,sp)
1630  0200 a680          	ld	a,#128
1631  0202 cd0000        	call	c_cmulx
1633  0205 96            	ldw	x,sp
1634  0206 1c0003        	addw	x,#OFST-3
1635  0209 cd0000        	call	c_ladd
1637  020c be02          	ldw	x,c_lreg+2
1638  020e 1f01          	ldw	(OFST-5,sp),x
1640                     ; 614     FLASH->CR2 |= FLASH_CR2_ERASE;
1642  0210 721a505b      	bset	20571,#5
1643                     ; 615     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1645  0214 721b505c      	bres	20572,#5
1646                     ; 619     *pwFlash = (uint32_t)0;
1648  0218 1e01          	ldw	x,(OFST-5,sp)
1649  021a a600          	ld	a,#0
1650  021c e703          	ld	(3,x),a
1651  021e a600          	ld	a,#0
1652  0220 e702          	ld	(2,x),a
1653  0222 a600          	ld	a,#0
1654  0224 e701          	ld	(1,x),a
1655  0226 a600          	ld	a,#0
1656  0228 f7            	ld	(x),a
1657                     ; 627 }
1660  0229 5b08          	addw	sp,#8
1661  022b 81            	ret
1765                     ; 638 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1765                     ; 639                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1765                     ; 640 {
1766                     	switch	.text
1767  022c               _FLASH_ProgramBlock:
1769  022c 89            	pushw	x
1770  022d 5206          	subw	sp,#6
1771       00000006      OFST:	set	6
1774                     ; 641     uint16_t Count = 0;
1776                     ; 642     uint32_t startaddress = 0;
1778                     ; 645     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1780                     ; 646     assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1782                     ; 647     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1784  022f 7b0b          	ld	a,(OFST+5,sp)
1785  0231 a1fd          	cp	a,#253
1786  0233 260c          	jrne	L137
1787                     ; 649         assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1789                     ; 650         startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1791  0235 ae8000        	ldw	x,#32768
1792  0238 1f03          	ldw	(OFST-3,sp),x
1793  023a ae0000        	ldw	x,#0
1794  023d 1f01          	ldw	(OFST-5,sp),x
1797  023f 200a          	jra	L337
1798  0241               L137:
1799                     ; 654         assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1801                     ; 655         startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1803  0241 ae4000        	ldw	x,#16384
1804  0244 1f03          	ldw	(OFST-3,sp),x
1805  0246 ae0000        	ldw	x,#0
1806  0249 1f01          	ldw	(OFST-5,sp),x
1808  024b               L337:
1809                     ; 659     startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1811  024b 1e07          	ldw	x,(OFST+1,sp)
1812  024d a680          	ld	a,#128
1813  024f cd0000        	call	c_cmulx
1815  0252 96            	ldw	x,sp
1816  0253 1c0001        	addw	x,#OFST-5
1817  0256 cd0000        	call	c_lgadd
1820                     ; 662     if (FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1822  0259 0d0c          	tnz	(OFST+6,sp)
1823  025b 260a          	jrne	L537
1824                     ; 665         FLASH->CR2 |= FLASH_CR2_PRG;
1826  025d 7210505b      	bset	20571,#0
1827                     ; 666         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1829  0261 7211505c      	bres	20572,#0
1831  0265 2008          	jra	L737
1832  0267               L537:
1833                     ; 671         FLASH->CR2 |= FLASH_CR2_FPRG;
1835  0267 7218505b      	bset	20571,#4
1836                     ; 672         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1838  026b 7219505c      	bres	20572,#4
1839  026f               L737:
1840                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1842  026f 5f            	clrw	x
1843  0270 1f05          	ldw	(OFST-1,sp),x
1845  0272               L147:
1846                     ; 680   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1848  0272 1e0d          	ldw	x,(OFST+7,sp)
1849  0274 72fb05        	addw	x,(OFST-1,sp)
1850  0277 f6            	ld	a,(x)
1851  0278 1e03          	ldw	x,(OFST-3,sp)
1852  027a 72fb05        	addw	x,(OFST-1,sp)
1853  027d f7            	ld	(x),a
1854                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1856  027e 1e05          	ldw	x,(OFST-1,sp)
1857  0280 1c0001        	addw	x,#1
1858  0283 1f05          	ldw	(OFST-1,sp),x
1862  0285 1e05          	ldw	x,(OFST-1,sp)
1863  0287 a30080        	cpw	x,#128
1864  028a 25e6          	jrult	L147
1865                     ; 685 }
1868  028c 5b08          	addw	sp,#8
1869  028e 81            	ret
1882                     	xdef	_FLASH_WaitForLastOperation
1883                     	xdef	_FLASH_ProgramBlock
1884                     	xdef	_FLASH_EraseBlock
1885                     	xdef	_FLASH_GetFlagStatus
1886                     	xdef	_FLASH_GetBootSize
1887                     	xdef	_FLASH_GetProgrammingTime
1888                     	xdef	_FLASH_GetLowPowerMode
1889                     	xdef	_FLASH_SetProgrammingTime
1890                     	xdef	_FLASH_SetLowPowerMode
1891                     	xdef	_FLASH_EraseOptionByte
1892                     	xdef	_FLASH_ProgramOptionByte
1893                     	xdef	_FLASH_ReadOptionByte
1894                     	xdef	_FLASH_ProgramWord
1895                     	xdef	_FLASH_ReadByte
1896                     	xdef	_FLASH_ProgramByte
1897                     	xdef	_FLASH_EraseByte
1898                     	xdef	_FLASH_ITConfig
1899                     	xdef	_FLASH_DeInit
1900                     	xdef	_FLASH_Lock
1901                     	xdef	_FLASH_Unlock
1902                     	xref.b	c_lreg
1903                     	xref.b	c_x
1904                     	xref.b	c_y
1923                     	xref	c_ladd
1924                     	xref	c_cmulx
1925                     	xref	c_lzmp
1926                     	xref	c_lgsbc
1927                     	xref	c_ltor
1928                     	xref	c_lgadd
1929                     	xref	c_rtol
1930                     	xref	c_umul
1931                     	end
