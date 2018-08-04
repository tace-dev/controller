   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  48                     ; 49 void TIM4_DeInit(void)
  48                     ; 50 {
  50                     	switch	.text
  51  0000               _TIM4_DeInit:
  55                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  57  0000 725f5340      	clr	21312
  58                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  60  0004 725f5343      	clr	21315
  61                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  63  0008 725f5346      	clr	21318
  64                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  66  000c 725f5347      	clr	21319
  67                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  69  0010 35ff5348      	mov	21320,#255
  70                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  72  0014 725f5344      	clr	21316
  73                     ; 57 }
  76  0018 81            	ret	
 183                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 183                     ; 66 {
 184                     	switch	.text
 185  0019               _TIM4_TimeBaseInit:
 187  0019 89            	pushw	x
 188       00000000      OFST:	set	0
 191                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 193  001a 9e            	ld	a,xh
 194  001b 4d            	tnz	a
 195  001c 2730          	jreq	L41
 196  001e 9e            	ld	a,xh
 197  001f 4a            	dec	a
 198  0020 272c          	jreq	L41
 199  0022 9e            	ld	a,xh
 200  0023 a102          	cp	a,#2
 201  0025 2727          	jreq	L41
 202  0027 9e            	ld	a,xh
 203  0028 a103          	cp	a,#3
 204  002a 2722          	jreq	L41
 205  002c 9e            	ld	a,xh
 206  002d a104          	cp	a,#4
 207  002f 271d          	jreq	L41
 208  0031 9e            	ld	a,xh
 209  0032 a105          	cp	a,#5
 210  0034 2718          	jreq	L41
 211  0036 9e            	ld	a,xh
 212  0037 a106          	cp	a,#6
 213  0039 2713          	jreq	L41
 214  003b 9e            	ld	a,xh
 215  003c a107          	cp	a,#7
 216  003e 270e          	jreq	L41
 217  0040 ae0044        	ldw	x,#68
 218  0043 89            	pushw	x
 219  0044 5f            	clrw	x
 220  0045 89            	pushw	x
 221  0046 ae0000        	ldw	x,#L76
 222  0049 cd0000        	call	_assert_failed
 224  004c 5b04          	addw	sp,#4
 225  004e               L41:
 226                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 228  004e 7b01          	ld	a,(OFST+1,sp)
 229  0050 c75347        	ld	21319,a
 230                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 232  0053 7b02          	ld	a,(OFST+2,sp)
 233  0055 c75348        	ld	21320,a
 234                     ; 73 }
 237  0058 85            	popw	x
 238  0059 81            	ret	
 294                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 294                     ; 82 {
 295                     	switch	.text
 296  005a               _TIM4_Cmd:
 298  005a 88            	push	a
 299       00000000      OFST:	set	0
 302                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 304  005b 4d            	tnz	a
 305  005c 2711          	jreq	L62
 306  005e 4a            	dec	a
 307  005f 270e          	jreq	L62
 308  0061 ae0054        	ldw	x,#84
 309  0064 89            	pushw	x
 310  0065 5f            	clrw	x
 311  0066 89            	pushw	x
 312  0067 ae0000        	ldw	x,#L76
 313  006a cd0000        	call	_assert_failed
 315  006d 5b04          	addw	sp,#4
 316  006f               L62:
 317                     ; 87   if (NewState != DISABLE)
 319  006f 7b01          	ld	a,(OFST+1,sp)
 320  0071 2706          	jreq	L711
 321                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 323  0073 72105340      	bset	21312,#0
 325  0077 2004          	jra	L121
 326  0079               L711:
 327                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 329  0079 72115340      	bres	21312,#0
 330  007d               L121:
 331                     ; 95 }
 334  007d 84            	pop	a
 335  007e 81            	ret	
 394                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 394                     ; 108 {
 395                     	switch	.text
 396  007f               _TIM4_ITConfig:
 398  007f 89            	pushw	x
 399       00000000      OFST:	set	0
 402                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 404  0080 9e            	ld	a,xh
 405  0081 4a            	dec	a
 406  0082 2705          	jreq	L63
 407  0084 ae006e        	ldw	x,#110
 408  0087 ad22          	call	LC001
 409  0089               L63:
 410                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 412  0089 7b02          	ld	a,(OFST+2,sp)
 413  008b 2708          	jreq	L64
 414  008d 4a            	dec	a
 415  008e 2705          	jreq	L64
 416  0090 ae006f        	ldw	x,#111
 417  0093 ad16          	call	LC001
 418  0095               L64:
 419                     ; 113   if (NewState != DISABLE)
 421  0095 7b02          	ld	a,(OFST+2,sp)
 422  0097 2707          	jreq	L351
 423                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 425  0099 c65343        	ld	a,21315
 426  009c 1a01          	or	a,(OFST+1,sp)
 428  009e 2006          	jra	L551
 429  00a0               L351:
 430                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 432  00a0 7b01          	ld	a,(OFST+1,sp)
 433  00a2 43            	cpl	a
 434  00a3 c45343        	and	a,21315
 435  00a6               L551:
 436  00a6 c75343        	ld	21315,a
 437                     ; 123 }
 440  00a9 85            	popw	x
 441  00aa 81            	ret	
 442  00ab               LC001:
 443  00ab 89            	pushw	x
 444  00ac 5f            	clrw	x
 445  00ad 89            	pushw	x
 446  00ae ae0000        	ldw	x,#L76
 447  00b1 cd0000        	call	_assert_failed
 449  00b4 5b04          	addw	sp,#4
 450  00b6 81            	ret	
 487                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 487                     ; 132 {
 488                     	switch	.text
 489  00b7               _TIM4_UpdateDisableConfig:
 491  00b7 88            	push	a
 492       00000000      OFST:	set	0
 495                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 497  00b8 4d            	tnz	a
 498  00b9 2711          	jreq	L06
 499  00bb 4a            	dec	a
 500  00bc 270e          	jreq	L06
 501  00be ae0086        	ldw	x,#134
 502  00c1 89            	pushw	x
 503  00c2 5f            	clrw	x
 504  00c3 89            	pushw	x
 505  00c4 ae0000        	ldw	x,#L76
 506  00c7 cd0000        	call	_assert_failed
 508  00ca 5b04          	addw	sp,#4
 509  00cc               L06:
 510                     ; 137   if (NewState != DISABLE)
 512  00cc 7b01          	ld	a,(OFST+1,sp)
 513  00ce 2706          	jreq	L571
 514                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 516  00d0 72125340      	bset	21312,#1
 518  00d4 2004          	jra	L771
 519  00d6               L571:
 520                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 522  00d6 72135340      	bres	21312,#1
 523  00da               L771:
 524                     ; 145 }
 527  00da 84            	pop	a
 528  00db 81            	ret	
 587                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 587                     ; 156 {
 588                     	switch	.text
 589  00dc               _TIM4_UpdateRequestConfig:
 591  00dc 88            	push	a
 592       00000000      OFST:	set	0
 595                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 597  00dd 4d            	tnz	a
 598  00de 2711          	jreq	L27
 599  00e0 4a            	dec	a
 600  00e1 270e          	jreq	L27
 601  00e3 ae009e        	ldw	x,#158
 602  00e6 89            	pushw	x
 603  00e7 5f            	clrw	x
 604  00e8 89            	pushw	x
 605  00e9 ae0000        	ldw	x,#L76
 606  00ec cd0000        	call	_assert_failed
 608  00ef 5b04          	addw	sp,#4
 609  00f1               L27:
 610                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 612  00f1 7b01          	ld	a,(OFST+1,sp)
 613  00f3 2706          	jreq	L722
 614                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 616  00f5 72145340      	bset	21312,#2
 618  00f9 2004          	jra	L132
 619  00fb               L722:
 620                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 622  00fb 72155340      	bres	21312,#2
 623  00ff               L132:
 624                     ; 169 }
 627  00ff 84            	pop	a
 628  0100 81            	ret	
 686                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 686                     ; 180 {
 687                     	switch	.text
 688  0101               _TIM4_SelectOnePulseMode:
 690  0101 88            	push	a
 691       00000000      OFST:	set	0
 694                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 696  0102 a101          	cp	a,#1
 697  0104 2711          	jreq	L401
 698  0106 4d            	tnz	a
 699  0107 270e          	jreq	L401
 700  0109 ae00b6        	ldw	x,#182
 701  010c 89            	pushw	x
 702  010d 5f            	clrw	x
 703  010e 89            	pushw	x
 704  010f ae0000        	ldw	x,#L76
 705  0112 cd0000        	call	_assert_failed
 707  0115 5b04          	addw	sp,#4
 708  0117               L401:
 709                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 711  0117 7b01          	ld	a,(OFST+1,sp)
 712  0119 2706          	jreq	L162
 713                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 715  011b 72165340      	bset	21312,#3
 717  011f 2004          	jra	L362
 718  0121               L162:
 719                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 721  0121 72175340      	bres	21312,#3
 722  0125               L362:
 723                     ; 193 }
 726  0125 84            	pop	a
 727  0126 81            	ret	
 796                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 796                     ; 216 {
 797                     	switch	.text
 798  0127               _TIM4_PrescalerConfig:
 800  0127 89            	pushw	x
 801       00000000      OFST:	set	0
 804                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 806  0128 9f            	ld	a,xl
 807  0129 4d            	tnz	a
 808  012a 2709          	jreq	L611
 809  012c 9f            	ld	a,xl
 810  012d 4a            	dec	a
 811  012e 2705          	jreq	L611
 812  0130 ae00da        	ldw	x,#218
 813  0133 ad31          	call	LC002
 814  0135               L611:
 815                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 817  0135 7b01          	ld	a,(OFST+1,sp)
 818  0137 2723          	jreq	L621
 819  0139 a101          	cp	a,#1
 820  013b 271f          	jreq	L621
 821  013d a102          	cp	a,#2
 822  013f 271b          	jreq	L621
 823  0141 a103          	cp	a,#3
 824  0143 2717          	jreq	L621
 825  0145 a104          	cp	a,#4
 826  0147 2713          	jreq	L621
 827  0149 a105          	cp	a,#5
 828  014b 270f          	jreq	L621
 829  014d a106          	cp	a,#6
 830  014f 270b          	jreq	L621
 831  0151 a107          	cp	a,#7
 832  0153 2707          	jreq	L621
 833  0155 ae00db        	ldw	x,#219
 834  0158 ad0c          	call	LC002
 835  015a 7b01          	ld	a,(OFST+1,sp)
 836  015c               L621:
 837                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 839  015c c75347        	ld	21319,a
 840                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 842  015f 7b02          	ld	a,(OFST+2,sp)
 843  0161 c75345        	ld	21317,a
 844                     ; 226 }
 847  0164 85            	popw	x
 848  0165 81            	ret	
 849  0166               LC002:
 850  0166 89            	pushw	x
 851  0167 5f            	clrw	x
 852  0168 89            	pushw	x
 853  0169 ae0000        	ldw	x,#L76
 854  016c cd0000        	call	_assert_failed
 856  016f 5b04          	addw	sp,#4
 857  0171 81            	ret	
 894                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 894                     ; 235 {
 895                     	switch	.text
 896  0172               _TIM4_ARRPreloadConfig:
 898  0172 88            	push	a
 899       00000000      OFST:	set	0
 902                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 904  0173 4d            	tnz	a
 905  0174 2711          	jreq	L041
 906  0176 4a            	dec	a
 907  0177 270e          	jreq	L041
 908  0179 ae00ed        	ldw	x,#237
 909  017c 89            	pushw	x
 910  017d 5f            	clrw	x
 911  017e 89            	pushw	x
 912  017f ae0000        	ldw	x,#L76
 913  0182 cd0000        	call	_assert_failed
 915  0185 5b04          	addw	sp,#4
 916  0187               L041:
 917                     ; 240   if (NewState != DISABLE)
 919  0187 7b01          	ld	a,(OFST+1,sp)
 920  0189 2706          	jreq	L533
 921                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 923  018b 721e5340      	bset	21312,#7
 925  018f 2004          	jra	L733
 926  0191               L533:
 927                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 929  0191 721f5340      	bres	21312,#7
 930  0195               L733:
 931                     ; 248 }
 934  0195 84            	pop	a
 935  0196 81            	ret	
 985                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 985                     ; 258 {
 986                     	switch	.text
 987  0197               _TIM4_GenerateEvent:
 989  0197 88            	push	a
 990       00000000      OFST:	set	0
 993                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 995  0198 4a            	dec	a
 996  0199 270e          	jreq	L051
 997  019b ae0104        	ldw	x,#260
 998  019e 89            	pushw	x
 999  019f 5f            	clrw	x
1000  01a0 89            	pushw	x
1001  01a1 ae0000        	ldw	x,#L76
1002  01a4 cd0000        	call	_assert_failed
1004  01a7 5b04          	addw	sp,#4
1005  01a9               L051:
1006                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
1008  01a9 7b01          	ld	a,(OFST+1,sp)
1009  01ab c75345        	ld	21317,a
1010                     ; 264 }
1013  01ae 84            	pop	a
1014  01af 81            	ret	
1048                     ; 272 void TIM4_SetCounter(uint8_t Counter)
1048                     ; 273 {
1049                     	switch	.text
1050  01b0               _TIM4_SetCounter:
1054                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
1056  01b0 c75346        	ld	21318,a
1057                     ; 276 }
1060  01b3 81            	ret	
1094                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
1094                     ; 285 {
1095                     	switch	.text
1096  01b4               _TIM4_SetAutoreload:
1100                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
1102  01b4 c75348        	ld	21320,a
1103                     ; 288 }
1106  01b7 81            	ret	
1129                     ; 295 uint8_t TIM4_GetCounter(void)
1129                     ; 296 {
1130                     	switch	.text
1131  01b8               _TIM4_GetCounter:
1135                     ; 298   return (uint8_t)(TIM4->CNTR);
1137  01b8 c65346        	ld	a,21318
1140  01bb 81            	ret	
1164                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
1164                     ; 307 {
1165                     	switch	.text
1166  01bc               _TIM4_GetPrescaler:
1170                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
1172  01bc c65347        	ld	a,21319
1175  01bf 81            	ret	
1255                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1255                     ; 320 {
1256                     	switch	.text
1257  01c0               _TIM4_GetFlagStatus:
1259  01c0 88            	push	a
1260  01c1 88            	push	a
1261       00000001      OFST:	set	1
1264                     ; 321   FlagStatus bitstatus = RESET;
1266                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1268  01c2 4a            	dec	a
1269  01c3 270e          	jreq	L071
1270  01c5 ae0144        	ldw	x,#324
1271  01c8 89            	pushw	x
1272  01c9 5f            	clrw	x
1273  01ca 89            	pushw	x
1274  01cb ae0000        	ldw	x,#L76
1275  01ce cd0000        	call	_assert_failed
1277  01d1 5b04          	addw	sp,#4
1278  01d3               L071:
1279                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1281  01d3 c65344        	ld	a,21316
1282  01d6 1502          	bcp	a,(OFST+1,sp)
1283  01d8 2704          	jreq	L105
1284                     ; 328     bitstatus = SET;
1286  01da a601          	ld	a,#1
1289  01dc 2001          	jra	L305
1290  01de               L105:
1291                     ; 332     bitstatus = RESET;
1293  01de 4f            	clr	a
1295  01df               L305:
1296                     ; 334   return ((FlagStatus)bitstatus);
1300  01df 85            	popw	x
1301  01e0 81            	ret	
1337                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1337                     ; 345 {
1338                     	switch	.text
1339  01e1               _TIM4_ClearFlag:
1341  01e1 88            	push	a
1342       00000000      OFST:	set	0
1345                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1347  01e2 4a            	dec	a
1348  01e3 270e          	jreq	L002
1349  01e5 ae015b        	ldw	x,#347
1350  01e8 89            	pushw	x
1351  01e9 5f            	clrw	x
1352  01ea 89            	pushw	x
1353  01eb ae0000        	ldw	x,#L76
1354  01ee cd0000        	call	_assert_failed
1356  01f1 5b04          	addw	sp,#4
1357  01f3               L002:
1358                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1360  01f3 7b01          	ld	a,(OFST+1,sp)
1361  01f5 43            	cpl	a
1362  01f6 c75344        	ld	21316,a
1363                     ; 351 }
1366  01f9 84            	pop	a
1367  01fa 81            	ret	
1432                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1432                     ; 361 {
1433                     	switch	.text
1434  01fb               _TIM4_GetITStatus:
1436  01fb 88            	push	a
1437  01fc 89            	pushw	x
1438       00000002      OFST:	set	2
1441                     ; 362   ITStatus bitstatus = RESET;
1443                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1447                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1449  01fd 4a            	dec	a
1450  01fe 270e          	jreq	L012
1451  0200 ae016f        	ldw	x,#367
1452  0203 89            	pushw	x
1453  0204 5f            	clrw	x
1454  0205 89            	pushw	x
1455  0206 ae0000        	ldw	x,#L76
1456  0209 cd0000        	call	_assert_failed
1458  020c 5b04          	addw	sp,#4
1459  020e               L012:
1460                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1462  020e c65344        	ld	a,21316
1463  0211 1403          	and	a,(OFST+1,sp)
1464  0213 6b01          	ld	(OFST-1,sp),a
1466                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1468  0215 c65343        	ld	a,21315
1469  0218 1403          	and	a,(OFST+1,sp)
1470  021a 6b02          	ld	(OFST+0,sp),a
1472                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1474  021c 7b01          	ld	a,(OFST-1,sp)
1475  021e 2708          	jreq	L555
1477  0220 7b02          	ld	a,(OFST+0,sp)
1478  0222 2704          	jreq	L555
1479                     ; 375     bitstatus = (ITStatus)SET;
1481  0224 a601          	ld	a,#1
1484  0226 2001          	jra	L755
1485  0228               L555:
1486                     ; 379     bitstatus = (ITStatus)RESET;
1488  0228 4f            	clr	a
1490  0229               L755:
1491                     ; 381   return ((ITStatus)bitstatus);
1495  0229 5b03          	addw	sp,#3
1496  022b 81            	ret	
1533                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1533                     ; 392 {
1534                     	switch	.text
1535  022c               _TIM4_ClearITPendingBit:
1537  022c 88            	push	a
1538       00000000      OFST:	set	0
1541                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1543  022d 4a            	dec	a
1544  022e 270e          	jreq	L022
1545  0230 ae018a        	ldw	x,#394
1546  0233 89            	pushw	x
1547  0234 5f            	clrw	x
1548  0235 89            	pushw	x
1549  0236 ae0000        	ldw	x,#L76
1550  0239 cd0000        	call	_assert_failed
1552  023c 5b04          	addw	sp,#4
1553  023e               L022:
1554                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1556  023e 7b01          	ld	a,(OFST+1,sp)
1557  0240 43            	cpl	a
1558  0241 c75344        	ld	21316,a
1559                     ; 398 }
1562  0244 84            	pop	a
1563  0245 81            	ret	
1576                     	xdef	_TIM4_ClearITPendingBit
1577                     	xdef	_TIM4_GetITStatus
1578                     	xdef	_TIM4_ClearFlag
1579                     	xdef	_TIM4_GetFlagStatus
1580                     	xdef	_TIM4_GetPrescaler
1581                     	xdef	_TIM4_GetCounter
1582                     	xdef	_TIM4_SetAutoreload
1583                     	xdef	_TIM4_SetCounter
1584                     	xdef	_TIM4_GenerateEvent
1585                     	xdef	_TIM4_ARRPreloadConfig
1586                     	xdef	_TIM4_PrescalerConfig
1587                     	xdef	_TIM4_SelectOnePulseMode
1588                     	xdef	_TIM4_UpdateRequestConfig
1589                     	xdef	_TIM4_UpdateDisableConfig
1590                     	xdef	_TIM4_ITConfig
1591                     	xdef	_TIM4_Cmd
1592                     	xdef	_TIM4_TimeBaseInit
1593                     	xdef	_TIM4_DeInit
1594                     	xref	_assert_failed
1595                     .const:	section	.text
1596  0000               L76:
1597  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm\librarie"
1598  0012 735c73746d38  	dc.b	"s\stm8s_stdperiph_"
1599  0024 647269766572  	dc.b	"driver\src\stm8s_t"
1600  0036 696d342e6300  	dc.b	"im4.c",0
1620                     	end
