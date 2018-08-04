   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  59                     ; 118 void LCD_DeInit(void)
  59                     ; 119 {
  61                     .text:	section	.text,new
  62  0000               _LCD_DeInit:
  64  0000 88            	push	a
  65       00000001      OFST:	set	1
  68                     ; 120   uint8_t counter = 0;
  70                     ; 122   LCD->CR1 = LCD_CR1_RESET_VALUE;
  72  0001 725f5400      	clr	21504
  73                     ; 123   LCD->CR2 = LCD_CR2_RESET_VALUE;
  75  0005 725f5401      	clr	21505
  76                     ; 124   LCD->CR3 = LCD_CR3_RESET_VALUE;
  78  0009 725f5402      	clr	21506
  79                     ; 125   LCD->FRQ = LCD_FRQ_RESET_VALUE;
  81  000d 725f5403      	clr	21507
  82                     ; 127   for (counter = 0;counter < 0x05; counter++)
  84  0011 4f            	clr	a
  85  0012 6b01          	ld	(OFST+0,sp),a
  86  0014               L52:
  87                     ; 129     LCD->PM[counter] = LCD_PM_RESET_VALUE;
  89  0014 5f            	clrw	x
  90  0015 97            	ld	xl,a
  91  0016 724f5404      	clr	(21508,x)
  92                     ; 127   for (counter = 0;counter < 0x05; counter++)
  94  001a 0c01          	inc	(OFST+0,sp)
  97  001c 7b01          	ld	a,(OFST+0,sp)
  98  001e a105          	cp	a,#5
  99  0020 25f2          	jrult	L52
 100                     ; 132   for (counter = 0;counter < 0x16; counter++)
 102  0022 4f            	clr	a
 103  0023 6b01          	ld	(OFST+0,sp),a
 104  0025               L33:
 105                     ; 134     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
 107  0025 5f            	clrw	x
 108  0026 97            	ld	xl,a
 109  0027 724f540c      	clr	(21516,x)
 110                     ; 132   for (counter = 0;counter < 0x16; counter++)
 112  002b 0c01          	inc	(OFST+0,sp)
 115  002d 7b01          	ld	a,(OFST+0,sp)
 116  002f a116          	cp	a,#22
 117  0031 25f2          	jrult	L33
 118                     ; 137   LCD->CR4 = LCD_CR4_RESET_VALUE;
 120  0033 725f542f      	clr	21551
 121                     ; 139 }
 124  0037 84            	pop	a
 125  0038 81            	ret	
 528                     ; 197 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
 528                     ; 198               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
 528                     ; 199               LCD_VoltageSource_TypeDef LCD_VoltageSource)
 528                     ; 200 {
 529                     .text:	section	.text,new
 530  0000               _LCD_Init:
 532  0000 89            	pushw	x
 533       00000000      OFST:	set	0
 536                     ; 202   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
 538                     ; 203   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
 540                     ; 204   assert_param(IS_LCD_DUTY(LCD_Duty));
 542                     ; 205   assert_param(IS_LCD_BIAS(LCD_Bias));
 544                     ; 206   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
 546                     ; 208   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
 548  0001 c65403        	ld	a,21507
 549  0004 a40f          	and	a,#15
 550  0006 c75403        	ld	21507,a
 551                     ; 209   LCD->FRQ |= LCD_Prescaler;
 553  0009 9e            	ld	a,xh
 554  000a ca5403        	or	a,21507
 555  000d c75403        	ld	21507,a
 556                     ; 211   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
 558  0010 c65403        	ld	a,21507
 559  0013 a4f0          	and	a,#240
 560  0015 c75403        	ld	21507,a
 561                     ; 212   LCD->FRQ |= LCD_Divider;
 563  0018 9f            	ld	a,xl
 564  0019 ca5403        	or	a,21507
 565  001c c75403        	ld	21507,a
 566                     ; 215   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
 568  001f c65400        	ld	a,21504
 569  0022 a4f9          	and	a,#249
 570  0024 c75400        	ld	21504,a
 571                     ; 216   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
 573  0027 7213542f      	bres	21551,#1
 574                     ; 218   if (LCD_Duty == LCD_Duty_1_8)
 576  002b 7b05          	ld	a,(OFST+5,sp)
 577  002d a120          	cp	a,#32
 578  002f 2604          	jrne	L742
 579                     ; 220     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
 581  0031 ad33          	call	LC002
 583  0033 2002          	jra	L152
 584  0035               L742:
 585                     ; 224     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
 587  0035 ad26          	call	LC001
 588  0037               L152:
 589                     ; 228   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
 591  0037 72115400      	bres	21504,#0
 592                     ; 229   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
 594  003b 7211542f      	bres	21551,#0
 595                     ; 231   if (LCD_Bias == LCD_Bias_1_4)
 597  003f 7b06          	ld	a,(OFST+6,sp)
 598  0041 a110          	cp	a,#16
 599  0043 2608          	jrne	L352
 600                     ; 233     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 602  0045 ad16          	call	LC001
 603                     ; 234     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
 605  0047 7b06          	ld	a,(OFST+6,sp)
 606  0049 ad1b          	call	LC002
 608  004b 2002          	jra	L552
 609  004d               L352:
 610                     ; 238     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 612  004d ad0e          	call	LC001
 613  004f               L552:
 614                     ; 241   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
 616  004f 72115401      	bres	21505,#0
 617                     ; 242   LCD->CR2 |= LCD_VoltageSource;
 619  0053 c65401        	ld	a,21505
 620  0056 1a07          	or	a,(OFST+7,sp)
 621  0058 c75401        	ld	21505,a
 622                     ; 244 }
 625  005b 85            	popw	x
 626  005c 81            	ret	
 627  005d               LC001:
 628  005d a40f          	and	a,#15
 629  005f ca5400        	or	a,21504
 630  0062 c75400        	ld	21504,a
 631  0065 81            	ret	
 632  0066               LC002:
 633  0066 4e            	swap	a
 634  0067 a40f          	and	a,#15
 635  0069 ca542f        	or	a,21551
 636  006c c7542f        	ld	21551,a
 637  006f 81            	ret	
 734                     ; 259 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
 734                     ; 260 {
 735                     .text:	section	.text,new
 736  0000               _LCD_PortMaskConfig:
 738  0000 89            	pushw	x
 739       00000000      OFST:	set	0
 742                     ; 262   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
 744                     ; 265   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
 746  0001 9e            	ld	a,xh
 747  0002 5f            	clrw	x
 748  0003 97            	ld	xl,a
 749  0004 7b02          	ld	a,(OFST+2,sp)
 750  0006 d75404        	ld	(21508,x),a
 751                     ; 267 }
 754  0009 85            	popw	x
 755  000a 81            	ret	
 810                     ; 276 void LCD_Cmd(FunctionalState NewState)
 810                     ; 277 {
 811                     .text:	section	.text,new
 812  0000               _LCD_Cmd:
 816                     ; 279   assert_param(IS_FUNCTIONAL_STATE(NewState));
 818                     ; 281   if (NewState != DISABLE)
 820  0000 4d            	tnz	a
 821  0001 2705          	jreq	L543
 822                     ; 283     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
 824  0003 721c5402      	bset	21506,#6
 827  0007 81            	ret	
 828  0008               L543:
 829                     ; 287     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
 831  0008 721d5402      	bres	21506,#6
 832                     ; 289 }
 835  000c 81            	ret	
 870                     ; 302 void LCD_HighDriveCmd(FunctionalState NewState)
 870                     ; 303 {
 871                     .text:	section	.text,new
 872  0000               _LCD_HighDriveCmd:
 876                     ; 305   assert_param(IS_FUNCTIONAL_STATE(NewState));
 878                     ; 307   if (NewState != DISABLE)
 880  0000 4d            	tnz	a
 881  0001 2705          	jreq	L763
 882                     ; 309     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
 884  0003 72185401      	bset	21505,#4
 887  0007 81            	ret	
 888  0008               L763:
 889                     ; 313     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
 891  0008 72195401      	bres	21505,#4
 892                     ; 315 }
 895  000c 81            	ret	
1002                     ; 332 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
1002                     ; 333 {
1003                     .text:	section	.text,new
1004  0000               _LCD_PulseOnDurationConfig:
1006  0000 88            	push	a
1007       00000000      OFST:	set	0
1010                     ; 335   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
1012                     ; 337   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
1014  0001 c65401        	ld	a,21505
1015  0004 a41f          	and	a,#31
1016  0006 c75401        	ld	21505,a
1017                     ; 338   LCD->CR2 |= LCD_PulseOnDuration;
1019  0009 c65401        	ld	a,21505
1020  000c 1a01          	or	a,(OFST+1,sp)
1021  000e c75401        	ld	21505,a
1022                     ; 339 }
1025  0011 84            	pop	a
1026  0012 81            	ret	
1123                     ; 355 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
1123                     ; 356 {
1124                     .text:	section	.text,new
1125  0000               _LCD_DeadTimeConfig:
1127  0000 88            	push	a
1128       00000000      OFST:	set	0
1131                     ; 358   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
1133                     ; 360   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
1135  0001 c65402        	ld	a,21506
1136  0004 a4f8          	and	a,#248
1137  0006 c75402        	ld	21506,a
1138                     ; 362   LCD->CR3 |= LCD_DeadTime;
1140  0009 c65402        	ld	a,21506
1141  000c 1a01          	or	a,(OFST+1,sp)
1142  000e c75402        	ld	21506,a
1143                     ; 364 }
1146  0011 84            	pop	a
1147  0012 81            	ret	
1299                     ; 388 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode, LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
1299                     ; 389 {
1300                     .text:	section	.text,new
1301  0000               _LCD_BlinkConfig:
1305                     ; 391   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
1307                     ; 392   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
1309                     ; 394   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
1311  0000 c65400        	ld	a,21504
1312  0003 a43f          	and	a,#63
1313  0005 c75400        	ld	21504,a
1314                     ; 395   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
1316  0008 9e            	ld	a,xh
1317  0009 ca5400        	or	a,21504
1318  000c c75400        	ld	21504,a
1319                     ; 397   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
1321  000f c65400        	ld	a,21504
1322  0012 a4c7          	and	a,#199
1323  0014 c75400        	ld	21504,a
1324                     ; 398   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
1326  0017 9f            	ld	a,xl
1327  0018 ca5400        	or	a,21504
1328  001b c75400        	ld	21504,a
1329                     ; 400 }
1332  001e 81            	ret	
1437                     ; 416 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
1437                     ; 417 {
1438                     .text:	section	.text,new
1439  0000               _LCD_ContrastConfig:
1441  0000 88            	push	a
1442       00000000      OFST:	set	0
1445                     ; 419   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
1447                     ; 421   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
1449  0001 c65401        	ld	a,21505
1450  0004 a4f1          	and	a,#241
1451  0006 c75401        	ld	21505,a
1452                     ; 422   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
1454  0009 c65401        	ld	a,21505
1455  000c 1a01          	or	a,(OFST+1,sp)
1456  000e c75401        	ld	21505,a
1457                     ; 424 }
1460  0011 84            	pop	a
1461  0012 81            	ret	
1663                     ; 471 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
1663                     ; 472 {
1664                     .text:	section	.text,new
1665  0000               _LCD_WriteRAM:
1667  0000 89            	pushw	x
1668       00000000      OFST:	set	0
1671                     ; 474   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
1673                     ; 477   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
1675  0001 9e            	ld	a,xh
1676  0002 5f            	clrw	x
1677  0003 97            	ld	xl,a
1678  0004 7b02          	ld	a,(OFST+2,sp)
1679  0006 d7540c        	ld	(21516,x),a
1680                     ; 479 }
1683  0009 85            	popw	x
1684  000a 81            	ret	
1741                     ; 489 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
1741                     ; 490 {
1742                     .text:	section	.text,new
1743  0000               _LCD_PageSelect:
1747                     ; 492   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
1749                     ; 494   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
1751  0000 7215542f      	bres	21551,#2
1752                     ; 495   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
1754  0004 ca542f        	or	a,21551
1755  0007 c7542f        	ld	21551,a
1756                     ; 497 }
1759  000a 81            	ret	
1794                     ; 522 void LCD_ITConfig(FunctionalState NewState)
1794                     ; 523 {
1795                     .text:	section	.text,new
1796  0000               _LCD_ITConfig:
1800                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1802                     ; 527   if (NewState != DISABLE)
1804  0000 4d            	tnz	a
1805  0001 2705          	jreq	L767
1806                     ; 529     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
1808  0003 721a5402      	bset	21506,#5
1811  0007 81            	ret	
1812  0008               L767:
1813                     ; 533     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
1815  0008 721b5402      	bres	21506,#5
1816                     ; 536 }
1819  000c 81            	ret	
1875                     ; 543 FlagStatus LCD_GetFlagStatus(void)
1875                     ; 544 {
1876                     .text:	section	.text,new
1877  0000               _LCD_GetFlagStatus:
1879  0000 88            	push	a
1880       00000001      OFST:	set	1
1883                     ; 545   FlagStatus status = RESET;
1885                     ; 548   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
1887  0001 7209540204    	btjf	21506,#4,L1201
1888                     ; 550     status = SET; /* Flag is set */
1890  0006 a601          	ld	a,#1
1892  0008 2001          	jra	L3201
1893  000a               L1201:
1894                     ; 554     status = RESET; /* Flag is reset*/
1896  000a 4f            	clr	a
1897  000b               L3201:
1898                     ; 557   return status;
1902  000b 5b01          	addw	sp,#1
1903  000d 81            	ret	
1926                     ; 566 void LCD_ClearFlag(void)
1926                     ; 567 {
1927                     .text:	section	.text,new
1928  0000               _LCD_ClearFlag:
1932                     ; 569   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
1934  0000 72165402      	bset	21506,#3
1935                     ; 571 }
1938  0004 81            	ret	
1981                     ; 579 ITStatus LCD_GetITStatus(void)
1981                     ; 580 {
1982                     .text:	section	.text,new
1983  0000               _LCD_GetITStatus:
1985  0000 88            	push	a
1986       00000001      OFST:	set	1
1989                     ; 581   ITStatus pendingbitstatus = RESET;
1991                     ; 582   uint8_t enablestatus = 0;
1993                     ; 584   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
1995  0001 c65402        	ld	a,21506
1996  0004 a420          	and	a,#32
1997  0006 6b01          	ld	(OFST+0,sp),a
1998                     ; 586   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
2000  0008 7209540206    	btjf	21506,#4,L5501
2002  000d 2704          	jreq	L5501
2003                     ; 589     pendingbitstatus = SET;
2005  000f a601          	ld	a,#1
2007  0011 2001          	jra	L7501
2008  0013               L5501:
2009                     ; 594     pendingbitstatus = RESET;
2011  0013 4f            	clr	a
2012  0014               L7501:
2013                     ; 597   return  pendingbitstatus;
2017  0014 5b01          	addw	sp,#1
2018  0016 81            	ret	
2042                     ; 606 void LCD_ClearITPendingBit(void)
2042                     ; 607 {
2043                     .text:	section	.text,new
2044  0000               _LCD_ClearITPendingBit:
2048                     ; 609   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
2050  0000 72165402      	bset	21506,#3
2051                     ; 611 }
2054  0004 81            	ret	
2067                     	xdef	_LCD_ClearITPendingBit
2068                     	xdef	_LCD_GetITStatus
2069                     	xdef	_LCD_ClearFlag
2070                     	xdef	_LCD_GetFlagStatus
2071                     	xdef	_LCD_ITConfig
2072                     	xdef	_LCD_PageSelect
2073                     	xdef	_LCD_WriteRAM
2074                     	xdef	_LCD_ContrastConfig
2075                     	xdef	_LCD_BlinkConfig
2076                     	xdef	_LCD_DeadTimeConfig
2077                     	xdef	_LCD_PulseOnDurationConfig
2078                     	xdef	_LCD_HighDriveCmd
2079                     	xdef	_LCD_Cmd
2080                     	xdef	_LCD_PortMaskConfig
2081                     	xdef	_LCD_Init
2082                     	xdef	_LCD_DeInit
2101                     	end
