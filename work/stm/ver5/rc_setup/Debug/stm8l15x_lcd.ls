   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  56                     ; 118 void LCD_DeInit(void)
  56                     ; 119 {
  58                     .text:	section	.text,new
  59  0000               _LCD_DeInit:
  61  0000 88            	push	a
  62       00000001      OFST:	set	1
  65                     ; 120   uint8_t counter = 0;
  67                     ; 122   LCD->CR1 = LCD_CR1_RESET_VALUE;
  69  0001 725f5400      	clr	21504
  70                     ; 123   LCD->CR2 = LCD_CR2_RESET_VALUE;
  72  0005 725f5401      	clr	21505
  73                     ; 124   LCD->CR3 = LCD_CR3_RESET_VALUE;
  75  0009 725f5402      	clr	21506
  76                     ; 125   LCD->FRQ = LCD_FRQ_RESET_VALUE;
  78  000d 725f5403      	clr	21507
  79                     ; 127   for (counter = 0;counter < 0x05; counter++)
  81  0011 0f01          	clr	(OFST+0,sp)
  82  0013               L52:
  83                     ; 129     LCD->PM[counter] = LCD_PM_RESET_VALUE;
  85  0013 7b01          	ld	a,(OFST+0,sp)
  86  0015 5f            	clrw	x
  87  0016 97            	ld	xl,a
  88  0017 724f5404      	clr	(21508,x)
  89                     ; 127   for (counter = 0;counter < 0x05; counter++)
  91  001b 0c01          	inc	(OFST+0,sp)
  94  001d 7b01          	ld	a,(OFST+0,sp)
  95  001f a105          	cp	a,#5
  96  0021 25f0          	jrult	L52
  97                     ; 132   for (counter = 0;counter < 0x16; counter++)
  99  0023 0f01          	clr	(OFST+0,sp)
 100  0025               L33:
 101                     ; 134     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
 103  0025 7b01          	ld	a,(OFST+0,sp)
 104  0027 5f            	clrw	x
 105  0028 97            	ld	xl,a
 106  0029 724f540c      	clr	(21516,x)
 107                     ; 132   for (counter = 0;counter < 0x16; counter++)
 109  002d 0c01          	inc	(OFST+0,sp)
 112  002f 7b01          	ld	a,(OFST+0,sp)
 113  0031 a116          	cp	a,#22
 114  0033 25f0          	jrult	L33
 115                     ; 137   LCD->CR4 = LCD_CR4_RESET_VALUE;
 117  0035 725f542f      	clr	21551
 118                     ; 139 }
 121  0039 84            	pop	a
 122  003a 81            	ret
 525                     ; 197 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
 525                     ; 198               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
 525                     ; 199               LCD_VoltageSource_TypeDef LCD_VoltageSource)
 525                     ; 200 {
 526                     .text:	section	.text,new
 527  0000               _LCD_Init:
 529  0000 89            	pushw	x
 530       00000000      OFST:	set	0
 533                     ; 202   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
 535                     ; 203   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
 537                     ; 204   assert_param(IS_LCD_DUTY(LCD_Duty));
 539                     ; 205   assert_param(IS_LCD_BIAS(LCD_Bias));
 541                     ; 206   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
 543                     ; 208   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
 545  0001 c65403        	ld	a,21507
 546  0004 a40f          	and	a,#15
 547  0006 c75403        	ld	21507,a
 548                     ; 209   LCD->FRQ |= LCD_Prescaler;
 550  0009 9e            	ld	a,xh
 551  000a ca5403        	or	a,21507
 552  000d c75403        	ld	21507,a
 553                     ; 211   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
 555  0010 c65403        	ld	a,21507
 556  0013 a4f0          	and	a,#240
 557  0015 c75403        	ld	21507,a
 558                     ; 212   LCD->FRQ |= LCD_Divider;
 560  0018 9f            	ld	a,xl
 561  0019 ca5403        	or	a,21507
 562  001c c75403        	ld	21507,a
 563                     ; 215   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
 565  001f c65400        	ld	a,21504
 566  0022 a4f9          	and	a,#249
 567  0024 c75400        	ld	21504,a
 568                     ; 216   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
 570  0027 7213542f      	bres	21551,#1
 571                     ; 218   if (LCD_Duty == LCD_Duty_1_8)
 573  002b 7b05          	ld	a,(OFST+5,sp)
 574  002d a120          	cp	a,#32
 575  002f 260f          	jrne	L742
 576                     ; 220     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
 578  0031 7b05          	ld	a,(OFST+5,sp)
 579  0033 a4f0          	and	a,#240
 580  0035 4e            	swap	a
 581  0036 a40f          	and	a,#15
 582  0038 ca542f        	or	a,21551
 583  003b c7542f        	ld	21551,a
 585  003e 200a          	jra	L152
 586  0040               L742:
 587                     ; 224     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
 589  0040 7b05          	ld	a,(OFST+5,sp)
 590  0042 a40f          	and	a,#15
 591  0044 ca5400        	or	a,21504
 592  0047 c75400        	ld	21504,a
 593  004a               L152:
 594                     ; 228   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
 596  004a 72115400      	bres	21504,#0
 597                     ; 229   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
 599  004e 7211542f      	bres	21551,#0
 600                     ; 231   if (LCD_Bias == LCD_Bias_1_4)
 602  0052 7b06          	ld	a,(OFST+6,sp)
 603  0054 a110          	cp	a,#16
 604  0056 2619          	jrne	L352
 605                     ; 233     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 607  0058 7b06          	ld	a,(OFST+6,sp)
 608  005a a40f          	and	a,#15
 609  005c ca5400        	or	a,21504
 610  005f c75400        	ld	21504,a
 611                     ; 234     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
 613  0062 7b06          	ld	a,(OFST+6,sp)
 614  0064 a4f0          	and	a,#240
 615  0066 4e            	swap	a
 616  0067 a40f          	and	a,#15
 617  0069 ca542f        	or	a,21551
 618  006c c7542f        	ld	21551,a
 620  006f 200a          	jra	L552
 621  0071               L352:
 622                     ; 238     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 624  0071 7b06          	ld	a,(OFST+6,sp)
 625  0073 a40f          	and	a,#15
 626  0075 ca5400        	or	a,21504
 627  0078 c75400        	ld	21504,a
 628  007b               L552:
 629                     ; 241   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
 631  007b 72115401      	bres	21505,#0
 632                     ; 242   LCD->CR2 |= LCD_VoltageSource;
 634  007f c65401        	ld	a,21505
 635  0082 1a07          	or	a,(OFST+7,sp)
 636  0084 c75401        	ld	21505,a
 637                     ; 244 }
 640  0087 85            	popw	x
 641  0088 81            	ret
 738                     ; 259 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
 738                     ; 260 {
 739                     .text:	section	.text,new
 740  0000               _LCD_PortMaskConfig:
 742  0000 89            	pushw	x
 743       00000000      OFST:	set	0
 746                     ; 262   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
 748                     ; 265   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
 750  0001 9e            	ld	a,xh
 751  0002 5f            	clrw	x
 752  0003 97            	ld	xl,a
 753  0004 7b02          	ld	a,(OFST+2,sp)
 754  0006 d75404        	ld	(21508,x),a
 755                     ; 267 }
 758  0009 85            	popw	x
 759  000a 81            	ret
 814                     ; 276 void LCD_Cmd(FunctionalState NewState)
 814                     ; 277 {
 815                     .text:	section	.text,new
 816  0000               _LCD_Cmd:
 820                     ; 279   assert_param(IS_FUNCTIONAL_STATE(NewState));
 822                     ; 281   if (NewState != DISABLE)
 824  0000 4d            	tnz	a
 825  0001 2706          	jreq	L543
 826                     ; 283     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
 828  0003 721c5402      	bset	21506,#6
 830  0007 2004          	jra	L743
 831  0009               L543:
 832                     ; 287     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
 834  0009 721d5402      	bres	21506,#6
 835  000d               L743:
 836                     ; 289 }
 839  000d 81            	ret
 874                     ; 302 void LCD_HighDriveCmd(FunctionalState NewState)
 874                     ; 303 {
 875                     .text:	section	.text,new
 876  0000               _LCD_HighDriveCmd:
 880                     ; 305   assert_param(IS_FUNCTIONAL_STATE(NewState));
 882                     ; 307   if (NewState != DISABLE)
 884  0000 4d            	tnz	a
 885  0001 2706          	jreq	L763
 886                     ; 309     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
 888  0003 72185401      	bset	21505,#4
 890  0007 2004          	jra	L173
 891  0009               L763:
 892                     ; 313     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
 894  0009 72195401      	bres	21505,#4
 895  000d               L173:
 896                     ; 315 }
 899  000d 81            	ret
1006                     ; 332 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
1006                     ; 333 {
1007                     .text:	section	.text,new
1008  0000               _LCD_PulseOnDurationConfig:
1010  0000 88            	push	a
1011       00000000      OFST:	set	0
1014                     ; 335   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
1016                     ; 337   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
1018  0001 c65401        	ld	a,21505
1019  0004 a41f          	and	a,#31
1020  0006 c75401        	ld	21505,a
1021                     ; 338   LCD->CR2 |= LCD_PulseOnDuration;
1023  0009 c65401        	ld	a,21505
1024  000c 1a01          	or	a,(OFST+1,sp)
1025  000e c75401        	ld	21505,a
1026                     ; 339 }
1029  0011 84            	pop	a
1030  0012 81            	ret
1127                     ; 355 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
1127                     ; 356 {
1128                     .text:	section	.text,new
1129  0000               _LCD_DeadTimeConfig:
1131  0000 88            	push	a
1132       00000000      OFST:	set	0
1135                     ; 358   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
1137                     ; 360   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
1139  0001 c65402        	ld	a,21506
1140  0004 a4f8          	and	a,#248
1141  0006 c75402        	ld	21506,a
1142                     ; 362   LCD->CR3 |= LCD_DeadTime;
1144  0009 c65402        	ld	a,21506
1145  000c 1a01          	or	a,(OFST+1,sp)
1146  000e c75402        	ld	21506,a
1147                     ; 364 }
1150  0011 84            	pop	a
1151  0012 81            	ret
1303                     ; 388 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode, LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
1303                     ; 389 {
1304                     .text:	section	.text,new
1305  0000               _LCD_BlinkConfig:
1309                     ; 391   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
1311                     ; 392   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
1313                     ; 394   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
1315  0000 c65400        	ld	a,21504
1316  0003 a43f          	and	a,#63
1317  0005 c75400        	ld	21504,a
1318                     ; 395   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
1320  0008 9e            	ld	a,xh
1321  0009 ca5400        	or	a,21504
1322  000c c75400        	ld	21504,a
1323                     ; 397   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
1325  000f c65400        	ld	a,21504
1326  0012 a4c7          	and	a,#199
1327  0014 c75400        	ld	21504,a
1328                     ; 398   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
1330  0017 9f            	ld	a,xl
1331  0018 ca5400        	or	a,21504
1332  001b c75400        	ld	21504,a
1333                     ; 400 }
1336  001e 81            	ret
1441                     ; 416 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
1441                     ; 417 {
1442                     .text:	section	.text,new
1443  0000               _LCD_ContrastConfig:
1445  0000 88            	push	a
1446       00000000      OFST:	set	0
1449                     ; 419   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
1451                     ; 421   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
1453  0001 c65401        	ld	a,21505
1454  0004 a4f1          	and	a,#241
1455  0006 c75401        	ld	21505,a
1456                     ; 422   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
1458  0009 c65401        	ld	a,21505
1459  000c 1a01          	or	a,(OFST+1,sp)
1460  000e c75401        	ld	21505,a
1461                     ; 424 }
1464  0011 84            	pop	a
1465  0012 81            	ret
1667                     ; 471 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
1667                     ; 472 {
1668                     .text:	section	.text,new
1669  0000               _LCD_WriteRAM:
1671  0000 89            	pushw	x
1672       00000000      OFST:	set	0
1675                     ; 474   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
1677                     ; 477   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
1679  0001 9e            	ld	a,xh
1680  0002 5f            	clrw	x
1681  0003 97            	ld	xl,a
1682  0004 7b02          	ld	a,(OFST+2,sp)
1683  0006 d7540c        	ld	(21516,x),a
1684                     ; 479 }
1687  0009 85            	popw	x
1688  000a 81            	ret
1745                     ; 489 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
1745                     ; 490 {
1746                     .text:	section	.text,new
1747  0000               _LCD_PageSelect:
1751                     ; 492   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
1753                     ; 494   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
1755  0000 7215542f      	bres	21551,#2
1756                     ; 495   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
1758  0004 ca542f        	or	a,21551
1759  0007 c7542f        	ld	21551,a
1760                     ; 497 }
1763  000a 81            	ret
1798                     ; 522 void LCD_ITConfig(FunctionalState NewState)
1798                     ; 523 {
1799                     .text:	section	.text,new
1800  0000               _LCD_ITConfig:
1804                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1806                     ; 527   if (NewState != DISABLE)
1808  0000 4d            	tnz	a
1809  0001 2706          	jreq	L767
1810                     ; 529     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
1812  0003 721a5402      	bset	21506,#5
1814  0007 2004          	jra	L177
1815  0009               L767:
1816                     ; 533     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
1818  0009 721b5402      	bres	21506,#5
1819  000d               L177:
1820                     ; 536 }
1823  000d 81            	ret
1879                     ; 543 FlagStatus LCD_GetFlagStatus(void)
1879                     ; 544 {
1880                     .text:	section	.text,new
1881  0000               _LCD_GetFlagStatus:
1883  0000 88            	push	a
1884       00000001      OFST:	set	1
1887                     ; 545   FlagStatus status = RESET;
1889                     ; 548   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
1891  0001 c65402        	ld	a,21506
1892  0004 a510          	bcp	a,#16
1893  0006 2706          	jreq	L1201
1894                     ; 550     status = SET; /* Flag is set */
1896  0008 a601          	ld	a,#1
1897  000a 6b01          	ld	(OFST+0,sp),a
1899  000c 2002          	jra	L3201
1900  000e               L1201:
1901                     ; 554     status = RESET; /* Flag is reset*/
1903  000e 0f01          	clr	(OFST+0,sp)
1904  0010               L3201:
1905                     ; 557   return status;
1907  0010 7b01          	ld	a,(OFST+0,sp)
1910  0012 5b01          	addw	sp,#1
1911  0014 81            	ret
1934                     ; 566 void LCD_ClearFlag(void)
1934                     ; 567 {
1935                     .text:	section	.text,new
1936  0000               _LCD_ClearFlag:
1940                     ; 569   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
1942  0000 72165402      	bset	21506,#3
1943                     ; 571 }
1946  0004 81            	ret
1989                     ; 579 ITStatus LCD_GetITStatus(void)
1989                     ; 580 {
1990                     .text:	section	.text,new
1991  0000               _LCD_GetITStatus:
1993  0000 88            	push	a
1994       00000001      OFST:	set	1
1997                     ; 581   ITStatus pendingbitstatus = RESET;
1999                     ; 582   uint8_t enablestatus = 0;
2001                     ; 584   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
2003  0001 c65402        	ld	a,21506
2004  0004 a420          	and	a,#32
2005  0006 6b01          	ld	(OFST+0,sp),a
2006                     ; 586   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
2008  0008 c65402        	ld	a,21506
2009  000b a510          	bcp	a,#16
2010  000d 270a          	jreq	L5501
2012  000f 0d01          	tnz	(OFST+0,sp)
2013  0011 2706          	jreq	L5501
2014                     ; 589     pendingbitstatus = SET;
2016  0013 a601          	ld	a,#1
2017  0015 6b01          	ld	(OFST+0,sp),a
2019  0017 2002          	jra	L7501
2020  0019               L5501:
2021                     ; 594     pendingbitstatus = RESET;
2023  0019 0f01          	clr	(OFST+0,sp)
2024  001b               L7501:
2025                     ; 597   return  pendingbitstatus;
2027  001b 7b01          	ld	a,(OFST+0,sp)
2030  001d 5b01          	addw	sp,#1
2031  001f 81            	ret
2055                     ; 606 void LCD_ClearITPendingBit(void)
2055                     ; 607 {
2056                     .text:	section	.text,new
2057  0000               _LCD_ClearITPendingBit:
2061                     ; 609   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
2063  0000 72165402      	bset	21506,#3
2064                     ; 611 }
2067  0004 81            	ret
2080                     	xdef	_LCD_ClearITPendingBit
2081                     	xdef	_LCD_GetITStatus
2082                     	xdef	_LCD_ClearFlag
2083                     	xdef	_LCD_GetFlagStatus
2084                     	xdef	_LCD_ITConfig
2085                     	xdef	_LCD_PageSelect
2086                     	xdef	_LCD_WriteRAM
2087                     	xdef	_LCD_ContrastConfig
2088                     	xdef	_LCD_BlinkConfig
2089                     	xdef	_LCD_DeadTimeConfig
2090                     	xdef	_LCD_PulseOnDurationConfig
2091                     	xdef	_LCD_HighDriveCmd
2092                     	xdef	_LCD_Cmd
2093                     	xdef	_LCD_PortMaskConfig
2094                     	xdef	_LCD_Init
2095                     	xdef	_LCD_DeInit
2114                     	end
