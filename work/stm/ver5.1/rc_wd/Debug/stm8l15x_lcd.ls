   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  58                     ; 118 void LCD_DeInit(void)
  58                     ; 119 {
  60                     	switch	.text
  61  0000               _LCD_DeInit:
  63  0000 88            	push	a
  64       00000001      OFST:	set	1
  67                     ; 120   uint8_t counter = 0;
  69                     ; 122   LCD->CR1 = LCD_CR1_RESET_VALUE;
  71  0001 725f5400      	clr	21504
  72                     ; 123   LCD->CR2 = LCD_CR2_RESET_VALUE;
  74  0005 725f5401      	clr	21505
  75                     ; 124   LCD->CR3 = LCD_CR3_RESET_VALUE;
  77  0009 725f5402      	clr	21506
  78                     ; 125   LCD->FRQ = LCD_FRQ_RESET_VALUE;
  80  000d 725f5403      	clr	21507
  81                     ; 127   for (counter = 0;counter < 0x05; counter++)
  83  0011 4f            	clr	a
  84  0012 6b01          	ld	(OFST+0,sp),a
  85  0014               L52:
  86                     ; 129     LCD->PM[counter] = LCD_PM_RESET_VALUE;
  88  0014 5f            	clrw	x
  89  0015 97            	ld	xl,a
  90  0016 724f5404      	clr	(21508,x)
  91                     ; 127   for (counter = 0;counter < 0x05; counter++)
  93  001a 0c01          	inc	(OFST+0,sp)
  96  001c 7b01          	ld	a,(OFST+0,sp)
  97  001e a105          	cp	a,#5
  98  0020 25f2          	jrult	L52
  99                     ; 132   for (counter = 0;counter < 0x16; counter++)
 101  0022 4f            	clr	a
 102  0023 6b01          	ld	(OFST+0,sp),a
 103  0025               L33:
 104                     ; 134     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
 106  0025 5f            	clrw	x
 107  0026 97            	ld	xl,a
 108  0027 724f540c      	clr	(21516,x)
 109                     ; 132   for (counter = 0;counter < 0x16; counter++)
 111  002b 0c01          	inc	(OFST+0,sp)
 114  002d 7b01          	ld	a,(OFST+0,sp)
 115  002f a116          	cp	a,#22
 116  0031 25f2          	jrult	L33
 117                     ; 137   LCD->CR4 = LCD_CR4_RESET_VALUE;
 119  0033 725f542f      	clr	21551
 120                     ; 139 }
 123  0037 84            	pop	a
 124  0038 81            	ret	
 527                     ; 197 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
 527                     ; 198               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
 527                     ; 199               LCD_VoltageSource_TypeDef LCD_VoltageSource)
 527                     ; 200 {
 528                     	switch	.text
 529  0039               _LCD_Init:
 531  0039 89            	pushw	x
 532       00000000      OFST:	set	0
 535                     ; 202   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
 537                     ; 203   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
 539                     ; 204   assert_param(IS_LCD_DUTY(LCD_Duty));
 541                     ; 205   assert_param(IS_LCD_BIAS(LCD_Bias));
 543                     ; 206   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
 545                     ; 208   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
 547  003a c65403        	ld	a,21507
 548  003d a40f          	and	a,#15
 549  003f c75403        	ld	21507,a
 550                     ; 209   LCD->FRQ |= LCD_Prescaler;
 552  0042 9e            	ld	a,xh
 553  0043 ca5403        	or	a,21507
 554  0046 c75403        	ld	21507,a
 555                     ; 211   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
 557  0049 c65403        	ld	a,21507
 558  004c a4f0          	and	a,#240
 559  004e c75403        	ld	21507,a
 560                     ; 212   LCD->FRQ |= LCD_Divider;
 562  0051 9f            	ld	a,xl
 563  0052 ca5403        	or	a,21507
 564  0055 c75403        	ld	21507,a
 565                     ; 215   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
 567  0058 c65400        	ld	a,21504
 568  005b a4f9          	and	a,#249
 569  005d c75400        	ld	21504,a
 570                     ; 216   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
 572  0060 7213542f      	bres	21551,#1
 573                     ; 218   if (LCD_Duty == LCD_Duty_1_8)
 575  0064 7b05          	ld	a,(OFST+5,sp)
 576  0066 a120          	cp	a,#32
 577  0068 2604          	jrne	L742
 578                     ; 220     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
 580  006a ad33          	call	LC002
 582  006c 2002          	jra	L152
 583  006e               L742:
 584                     ; 224     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
 586  006e ad26          	call	LC001
 587  0070               L152:
 588                     ; 228   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
 590  0070 72115400      	bres	21504,#0
 591                     ; 229   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
 593  0074 7211542f      	bres	21551,#0
 594                     ; 231   if (LCD_Bias == LCD_Bias_1_4)
 596  0078 7b06          	ld	a,(OFST+6,sp)
 597  007a a110          	cp	a,#16
 598  007c 2608          	jrne	L352
 599                     ; 233     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 601  007e ad16          	call	LC001
 602                     ; 234     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
 604  0080 7b06          	ld	a,(OFST+6,sp)
 605  0082 ad1b          	call	LC002
 607  0084 2002          	jra	L552
 608  0086               L352:
 609                     ; 238     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 611  0086 ad0e          	call	LC001
 612  0088               L552:
 613                     ; 241   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
 615  0088 72115401      	bres	21505,#0
 616                     ; 242   LCD->CR2 |= LCD_VoltageSource;
 618  008c c65401        	ld	a,21505
 619  008f 1a07          	or	a,(OFST+7,sp)
 620  0091 c75401        	ld	21505,a
 621                     ; 244 }
 624  0094 85            	popw	x
 625  0095 81            	ret	
 626  0096               LC001:
 627  0096 a40f          	and	a,#15
 628  0098 ca5400        	or	a,21504
 629  009b c75400        	ld	21504,a
 630  009e 81            	ret	
 631  009f               LC002:
 632  009f 4e            	swap	a
 633  00a0 a40f          	and	a,#15
 634  00a2 ca542f        	or	a,21551
 635  00a5 c7542f        	ld	21551,a
 636  00a8 81            	ret	
 733                     ; 259 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
 733                     ; 260 {
 734                     	switch	.text
 735  00a9               _LCD_PortMaskConfig:
 737  00a9 89            	pushw	x
 738       00000000      OFST:	set	0
 741                     ; 262   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
 743                     ; 265   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
 745  00aa 9e            	ld	a,xh
 746  00ab 5f            	clrw	x
 747  00ac 97            	ld	xl,a
 748  00ad 7b02          	ld	a,(OFST+2,sp)
 749  00af d75404        	ld	(21508,x),a
 750                     ; 267 }
 753  00b2 85            	popw	x
 754  00b3 81            	ret	
 809                     ; 276 void LCD_Cmd(FunctionalState NewState)
 809                     ; 277 {
 810                     	switch	.text
 811  00b4               _LCD_Cmd:
 815                     ; 279   assert_param(IS_FUNCTIONAL_STATE(NewState));
 817                     ; 281   if (NewState != DISABLE)
 819  00b4 4d            	tnz	a
 820  00b5 2705          	jreq	L543
 821                     ; 283     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
 823  00b7 721c5402      	bset	21506,#6
 826  00bb 81            	ret	
 827  00bc               L543:
 828                     ; 287     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
 830  00bc 721d5402      	bres	21506,#6
 831                     ; 289 }
 834  00c0 81            	ret	
 869                     ; 302 void LCD_HighDriveCmd(FunctionalState NewState)
 869                     ; 303 {
 870                     	switch	.text
 871  00c1               _LCD_HighDriveCmd:
 875                     ; 305   assert_param(IS_FUNCTIONAL_STATE(NewState));
 877                     ; 307   if (NewState != DISABLE)
 879  00c1 4d            	tnz	a
 880  00c2 2705          	jreq	L763
 881                     ; 309     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
 883  00c4 72185401      	bset	21505,#4
 886  00c8 81            	ret	
 887  00c9               L763:
 888                     ; 313     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
 890  00c9 72195401      	bres	21505,#4
 891                     ; 315 }
 894  00cd 81            	ret	
1001                     ; 332 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
1001                     ; 333 {
1002                     	switch	.text
1003  00ce               _LCD_PulseOnDurationConfig:
1005  00ce 88            	push	a
1006       00000000      OFST:	set	0
1009                     ; 335   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
1011                     ; 337   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
1013  00cf c65401        	ld	a,21505
1014  00d2 a41f          	and	a,#31
1015  00d4 c75401        	ld	21505,a
1016                     ; 338   LCD->CR2 |= LCD_PulseOnDuration;
1018  00d7 c65401        	ld	a,21505
1019  00da 1a01          	or	a,(OFST+1,sp)
1020  00dc c75401        	ld	21505,a
1021                     ; 339 }
1024  00df 84            	pop	a
1025  00e0 81            	ret	
1122                     ; 355 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
1122                     ; 356 {
1123                     	switch	.text
1124  00e1               _LCD_DeadTimeConfig:
1126  00e1 88            	push	a
1127       00000000      OFST:	set	0
1130                     ; 358   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
1132                     ; 360   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
1134  00e2 c65402        	ld	a,21506
1135  00e5 a4f8          	and	a,#248
1136  00e7 c75402        	ld	21506,a
1137                     ; 362   LCD->CR3 |= LCD_DeadTime;
1139  00ea c65402        	ld	a,21506
1140  00ed 1a01          	or	a,(OFST+1,sp)
1141  00ef c75402        	ld	21506,a
1142                     ; 364 }
1145  00f2 84            	pop	a
1146  00f3 81            	ret	
1298                     ; 388 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode, LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
1298                     ; 389 {
1299                     	switch	.text
1300  00f4               _LCD_BlinkConfig:
1304                     ; 391   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
1306                     ; 392   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
1308                     ; 394   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
1310  00f4 c65400        	ld	a,21504
1311  00f7 a43f          	and	a,#63
1312  00f9 c75400        	ld	21504,a
1313                     ; 395   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
1315  00fc 9e            	ld	a,xh
1316  00fd ca5400        	or	a,21504
1317  0100 c75400        	ld	21504,a
1318                     ; 397   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
1320  0103 c65400        	ld	a,21504
1321  0106 a4c7          	and	a,#199
1322  0108 c75400        	ld	21504,a
1323                     ; 398   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
1325  010b 9f            	ld	a,xl
1326  010c ca5400        	or	a,21504
1327  010f c75400        	ld	21504,a
1328                     ; 400 }
1331  0112 81            	ret	
1436                     ; 416 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
1436                     ; 417 {
1437                     	switch	.text
1438  0113               _LCD_ContrastConfig:
1440  0113 88            	push	a
1441       00000000      OFST:	set	0
1444                     ; 419   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
1446                     ; 421   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
1448  0114 c65401        	ld	a,21505
1449  0117 a4f1          	and	a,#241
1450  0119 c75401        	ld	21505,a
1451                     ; 422   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
1453  011c c65401        	ld	a,21505
1454  011f 1a01          	or	a,(OFST+1,sp)
1455  0121 c75401        	ld	21505,a
1456                     ; 424 }
1459  0124 84            	pop	a
1460  0125 81            	ret	
1662                     ; 471 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
1662                     ; 472 {
1663                     	switch	.text
1664  0126               _LCD_WriteRAM:
1666  0126 89            	pushw	x
1667       00000000      OFST:	set	0
1670                     ; 474   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
1672                     ; 477   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
1674  0127 9e            	ld	a,xh
1675  0128 5f            	clrw	x
1676  0129 97            	ld	xl,a
1677  012a 7b02          	ld	a,(OFST+2,sp)
1678  012c d7540c        	ld	(21516,x),a
1679                     ; 479 }
1682  012f 85            	popw	x
1683  0130 81            	ret	
1740                     ; 489 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
1740                     ; 490 {
1741                     	switch	.text
1742  0131               _LCD_PageSelect:
1746                     ; 492   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
1748                     ; 494   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
1750  0131 7215542f      	bres	21551,#2
1751                     ; 495   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
1753  0135 ca542f        	or	a,21551
1754  0138 c7542f        	ld	21551,a
1755                     ; 497 }
1758  013b 81            	ret	
1793                     ; 522 void LCD_ITConfig(FunctionalState NewState)
1793                     ; 523 {
1794                     	switch	.text
1795  013c               _LCD_ITConfig:
1799                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1801                     ; 527   if (NewState != DISABLE)
1803  013c 4d            	tnz	a
1804  013d 2705          	jreq	L767
1805                     ; 529     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
1807  013f 721a5402      	bset	21506,#5
1810  0143 81            	ret	
1811  0144               L767:
1812                     ; 533     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
1814  0144 721b5402      	bres	21506,#5
1815                     ; 536 }
1818  0148 81            	ret	
1874                     ; 543 FlagStatus LCD_GetFlagStatus(void)
1874                     ; 544 {
1875                     	switch	.text
1876  0149               _LCD_GetFlagStatus:
1878  0149 88            	push	a
1879       00000001      OFST:	set	1
1882                     ; 545   FlagStatus status = RESET;
1884                     ; 548   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
1886  014a 7209540204    	btjf	21506,#4,L1201
1887                     ; 550     status = SET; /* Flag is set */
1889  014f a601          	ld	a,#1
1891  0151 2001          	jra	L3201
1892  0153               L1201:
1893                     ; 554     status = RESET; /* Flag is reset*/
1895  0153 4f            	clr	a
1896  0154               L3201:
1897                     ; 557   return status;
1901  0154 5b01          	addw	sp,#1
1902  0156 81            	ret	
1925                     ; 566 void LCD_ClearFlag(void)
1925                     ; 567 {
1926                     	switch	.text
1927  0157               _LCD_ClearFlag:
1931                     ; 569   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
1933  0157 72165402      	bset	21506,#3
1934                     ; 571 }
1937  015b 81            	ret	
1980                     ; 579 ITStatus LCD_GetITStatus(void)
1980                     ; 580 {
1981                     	switch	.text
1982  015c               _LCD_GetITStatus:
1984  015c 88            	push	a
1985       00000001      OFST:	set	1
1988                     ; 581   ITStatus pendingbitstatus = RESET;
1990                     ; 582   uint8_t enablestatus = 0;
1992                     ; 584   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
1994  015d c65402        	ld	a,21506
1995  0160 a420          	and	a,#32
1996  0162 6b01          	ld	(OFST+0,sp),a
1997                     ; 586   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
1999  0164 7209540206    	btjf	21506,#4,L5501
2001  0169 2704          	jreq	L5501
2002                     ; 589     pendingbitstatus = SET;
2004  016b a601          	ld	a,#1
2006  016d 2001          	jra	L7501
2007  016f               L5501:
2008                     ; 594     pendingbitstatus = RESET;
2010  016f 4f            	clr	a
2011  0170               L7501:
2012                     ; 597   return  pendingbitstatus;
2016  0170 5b01          	addw	sp,#1
2017  0172 81            	ret	
2041                     ; 606 void LCD_ClearITPendingBit(void)
2041                     ; 607 {
2042                     	switch	.text
2043  0173               _LCD_ClearITPendingBit:
2047                     ; 609   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
2049  0173 72165402      	bset	21506,#3
2050                     ; 611 }
2053  0177 81            	ret	
2066                     	xdef	_LCD_ClearITPendingBit
2067                     	xdef	_LCD_GetITStatus
2068                     	xdef	_LCD_ClearFlag
2069                     	xdef	_LCD_GetFlagStatus
2070                     	xdef	_LCD_ITConfig
2071                     	xdef	_LCD_PageSelect
2072                     	xdef	_LCD_WriteRAM
2073                     	xdef	_LCD_ContrastConfig
2074                     	xdef	_LCD_BlinkConfig
2075                     	xdef	_LCD_DeadTimeConfig
2076                     	xdef	_LCD_PulseOnDurationConfig
2077                     	xdef	_LCD_HighDriveCmd
2078                     	xdef	_LCD_Cmd
2079                     	xdef	_LCD_PortMaskConfig
2080                     	xdef	_LCD_Init
2081                     	xdef	_LCD_DeInit
2100                     	end
