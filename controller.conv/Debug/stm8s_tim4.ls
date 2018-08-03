   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  44                     ; 43 void TIM4_DeInit(void)
  44                     ; 44 {
  46                     	switch	.text
  47  0000               _TIM4_DeInit:
  51                     ; 45     TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  53  0000 725f5340      	clr	21312
  54                     ; 46     TIM4->IER = TIM4_IER_RESET_VALUE;
  56  0004 725f5341      	clr	21313
  57                     ; 47     TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  59  0008 725f5344      	clr	21316
  60                     ; 48     TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  62  000c 725f5345      	clr	21317
  63                     ; 49     TIM4->ARR = TIM4_ARR_RESET_VALUE;
  65  0010 35ff5346      	mov	21318,#255
  66                     ; 50     TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  68  0014 725f5342      	clr	21314
  69                     ; 51 }
  72  0018 81            	ret
 178                     ; 59 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 178                     ; 60 {
 179                     	switch	.text
 180  0019               _TIM4_TimeBaseInit:
 184                     ; 62     assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 186                     ; 64     TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 188  0019 9e            	ld	a,xh
 189  001a c75345        	ld	21317,a
 190                     ; 66     TIM4->ARR = (uint8_t)(TIM4_Period);
 192  001d 9f            	ld	a,xl
 193  001e c75346        	ld	21318,a
 194                     ; 67 }
 197  0021 81            	ret
 252                     ; 77 void TIM4_Cmd(FunctionalState NewState)
 252                     ; 78 {
 253                     	switch	.text
 254  0022               _TIM4_Cmd:
 258                     ; 80     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 260                     ; 83     if (NewState != DISABLE)
 262  0022 4d            	tnz	a
 263  0023 2706          	jreq	L511
 264                     ; 85         TIM4->CR1 |= TIM4_CR1_CEN;
 266  0025 72105340      	bset	21312,#0
 268  0029 2004          	jra	L711
 269  002b               L511:
 270                     ; 89         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 272  002b 72115340      	bres	21312,#0
 273  002f               L711:
 274                     ; 91 }
 277  002f 81            	ret
 335                     ; 103 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 335                     ; 104 {
 336                     	switch	.text
 337  0030               _TIM4_ITConfig:
 339  0030 89            	pushw	x
 340       00000000      OFST:	set	0
 343                     ; 106     assert_param(IS_TIM4_IT_OK(TIM4_IT));
 345                     ; 107     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 347                     ; 109     if (NewState != DISABLE)
 349  0031 9f            	ld	a,xl
 350  0032 4d            	tnz	a
 351  0033 2709          	jreq	L151
 352                     ; 112         TIM4->IER |= (uint8_t)TIM4_IT;
 354  0035 9e            	ld	a,xh
 355  0036 ca5341        	or	a,21313
 356  0039 c75341        	ld	21313,a
 358  003c 2009          	jra	L351
 359  003e               L151:
 360                     ; 117         TIM4->IER &= (uint8_t)(~TIM4_IT);
 362  003e 7b01          	ld	a,(OFST+1,sp)
 363  0040 43            	cpl	a
 364  0041 c45341        	and	a,21313
 365  0044 c75341        	ld	21313,a
 366  0047               L351:
 367                     ; 119 }
 370  0047 85            	popw	x
 371  0048 81            	ret
 407                     ; 127 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 407                     ; 128 {
 408                     	switch	.text
 409  0049               _TIM4_UpdateDisableConfig:
 413                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 415                     ; 133     if (NewState != DISABLE)
 417  0049 4d            	tnz	a
 418  004a 2706          	jreq	L371
 419                     ; 135         TIM4->CR1 |= TIM4_CR1_UDIS;
 421  004c 72125340      	bset	21312,#1
 423  0050 2004          	jra	L571
 424  0052               L371:
 425                     ; 139         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 427  0052 72135340      	bres	21312,#1
 428  0056               L571:
 429                     ; 141 }
 432  0056 81            	ret
 490                     ; 151 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 490                     ; 152 {
 491                     	switch	.text
 492  0057               _TIM4_UpdateRequestConfig:
 496                     ; 154     assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 498                     ; 157     if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 500  0057 4d            	tnz	a
 501  0058 2706          	jreq	L522
 502                     ; 159         TIM4->CR1 |= TIM4_CR1_URS;
 504  005a 72145340      	bset	21312,#2
 506  005e 2004          	jra	L722
 507  0060               L522:
 508                     ; 163         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 510  0060 72155340      	bres	21312,#2
 511  0064               L722:
 512                     ; 165 }
 515  0064 81            	ret
 572                     ; 175 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 572                     ; 176 {
 573                     	switch	.text
 574  0065               _TIM4_SelectOnePulseMode:
 578                     ; 178     assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 580                     ; 181     if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 582  0065 4d            	tnz	a
 583  0066 2706          	jreq	L752
 584                     ; 183         TIM4->CR1 |= TIM4_CR1_OPM;
 586  0068 72165340      	bset	21312,#3
 588  006c 2004          	jra	L162
 589  006e               L752:
 590                     ; 187         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 592  006e 72175340      	bres	21312,#3
 593  0072               L162:
 594                     ; 190 }
 597  0072 81            	ret
 665                     ; 212 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 665                     ; 213 {
 666                     	switch	.text
 667  0073               _TIM4_PrescalerConfig:
 671                     ; 215     assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 673                     ; 216     assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 675                     ; 219     TIM4->PSCR = (uint8_t)Prescaler;
 677  0073 9e            	ld	a,xh
 678  0074 c75345        	ld	21317,a
 679                     ; 222     TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 681  0077 9f            	ld	a,xl
 682  0078 c75343        	ld	21315,a
 683                     ; 223 }
 686  007b 81            	ret
 722                     ; 231 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 722                     ; 232 {
 723                     	switch	.text
 724  007c               _TIM4_ARRPreloadConfig:
 728                     ; 234     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 730                     ; 237     if (NewState != DISABLE)
 732  007c 4d            	tnz	a
 733  007d 2706          	jreq	L333
 734                     ; 239         TIM4->CR1 |= TIM4_CR1_ARPE;
 736  007f 721e5340      	bset	21312,#7
 738  0083 2004          	jra	L533
 739  0085               L333:
 740                     ; 243         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 742  0085 721f5340      	bres	21312,#7
 743  0089               L533:
 744                     ; 245 }
 747  0089 81            	ret
 796                     ; 254 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 796                     ; 255 {
 797                     	switch	.text
 798  008a               _TIM4_GenerateEvent:
 802                     ; 257     assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 804                     ; 260     TIM4->EGR = (uint8_t)(TIM4_EventSource);
 806  008a c75343        	ld	21315,a
 807                     ; 261 }
 810  008d 81            	ret
 844                     ; 270 void TIM4_SetCounter(uint8_t Counter)
 844                     ; 271 {
 845                     	switch	.text
 846  008e               _TIM4_SetCounter:
 850                     ; 273     TIM4->CNTR = (uint8_t)(Counter);
 852  008e c75344        	ld	21316,a
 853                     ; 274 }
 856  0091 81            	ret
 890                     ; 283 void TIM4_SetAutoreload(uint8_t Autoreload)
 890                     ; 284 {
 891                     	switch	.text
 892  0092               _TIM4_SetAutoreload:
 896                     ; 286     TIM4->ARR = (uint8_t)(Autoreload);
 898  0092 c75346        	ld	21318,a
 899                     ; 287 }
 902  0095 81            	ret
 925                     ; 294 uint8_t TIM4_GetCounter(void)
 925                     ; 295 {
 926                     	switch	.text
 927  0096               _TIM4_GetCounter:
 931                     ; 297     return (uint8_t)(TIM4->CNTR);
 933  0096 c65344        	ld	a,21316
 936  0099 81            	ret
 960                     ; 305 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 960                     ; 306 {
 961                     	switch	.text
 962  009a               _TIM4_GetPrescaler:
 966                     ; 308     return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 968  009a c65345        	ld	a,21317
 971  009d 81            	ret
1050                     ; 318 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1050                     ; 319 {
1051                     	switch	.text
1052  009e               _TIM4_GetFlagStatus:
1054  009e 88            	push	a
1055       00000001      OFST:	set	1
1058                     ; 320     FlagStatus bitstatus = RESET;
1060                     ; 323     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1062                     ; 325   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1064  009f c45342        	and	a,21314
1065  00a2 2706          	jreq	L774
1066                     ; 327     bitstatus = SET;
1068  00a4 a601          	ld	a,#1
1069  00a6 6b01          	ld	(OFST+0,sp),a
1072  00a8 2002          	jra	L105
1073  00aa               L774:
1074                     ; 331     bitstatus = RESET;
1076  00aa 0f01          	clr	(OFST+0,sp)
1078  00ac               L105:
1079                     ; 333   return ((FlagStatus)bitstatus);
1081  00ac 7b01          	ld	a,(OFST+0,sp)
1084  00ae 5b01          	addw	sp,#1
1085  00b0 81            	ret
1120                     ; 343 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1120                     ; 344 {
1121                     	switch	.text
1122  00b1               _TIM4_ClearFlag:
1126                     ; 346     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1128                     ; 349     TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1130  00b1 43            	cpl	a
1131  00b2 c75342        	ld	21314,a
1132                     ; 351 }
1135  00b5 81            	ret
1199                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1199                     ; 361 {
1200                     	switch	.text
1201  00b6               _TIM4_GetITStatus:
1203  00b6 88            	push	a
1204  00b7 89            	pushw	x
1205       00000002      OFST:	set	2
1208                     ; 362     ITStatus bitstatus = RESET;
1210                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1214                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1216                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1218  00b8 c45342        	and	a,21314
1219  00bb 6b01          	ld	(OFST-1,sp),a
1221                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1223  00bd c65341        	ld	a,21313
1224  00c0 1403          	and	a,(OFST+1,sp)
1225  00c2 6b02          	ld	(OFST+0,sp),a
1227                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1229  00c4 0d01          	tnz	(OFST-1,sp)
1230  00c6 270a          	jreq	L355
1232  00c8 0d02          	tnz	(OFST+0,sp)
1233  00ca 2706          	jreq	L355
1234                     ; 375     bitstatus = (ITStatus)SET;
1236  00cc a601          	ld	a,#1
1237  00ce 6b02          	ld	(OFST+0,sp),a
1240  00d0 2002          	jra	L555
1241  00d2               L355:
1242                     ; 379     bitstatus = (ITStatus)RESET;
1244  00d2 0f02          	clr	(OFST+0,sp)
1246  00d4               L555:
1247                     ; 381   return ((ITStatus)bitstatus);
1249  00d4 7b02          	ld	a,(OFST+0,sp)
1252  00d6 5b03          	addw	sp,#3
1253  00d8 81            	ret
1289                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1289                     ; 392 {
1290                     	switch	.text
1291  00d9               _TIM4_ClearITPendingBit:
1295                     ; 394     assert_param(IS_TIM4_IT_OK(TIM4_IT));
1297                     ; 397     TIM4->SR1 = (uint8_t)(~TIM4_IT);
1299  00d9 43            	cpl	a
1300  00da c75342        	ld	21314,a
1301                     ; 398 }
1304  00dd 81            	ret
1317                     	xdef	_TIM4_ClearITPendingBit
1318                     	xdef	_TIM4_GetITStatus
1319                     	xdef	_TIM4_ClearFlag
1320                     	xdef	_TIM4_GetFlagStatus
1321                     	xdef	_TIM4_GetPrescaler
1322                     	xdef	_TIM4_GetCounter
1323                     	xdef	_TIM4_SetAutoreload
1324                     	xdef	_TIM4_SetCounter
1325                     	xdef	_TIM4_GenerateEvent
1326                     	xdef	_TIM4_ARRPreloadConfig
1327                     	xdef	_TIM4_PrescalerConfig
1328                     	xdef	_TIM4_SelectOnePulseMode
1329                     	xdef	_TIM4_UpdateRequestConfig
1330                     	xdef	_TIM4_UpdateDisableConfig
1331                     	xdef	_TIM4_ITConfig
1332                     	xdef	_TIM4_Cmd
1333                     	xdef	_TIM4_TimeBaseInit
1334                     	xdef	_TIM4_DeInit
1353                     	end
