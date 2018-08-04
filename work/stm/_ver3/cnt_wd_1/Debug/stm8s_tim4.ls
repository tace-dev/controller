   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  51                     ; 43 void TIM4_DeInit(void)
  51                     ; 44 {
  53                     .text:	section	.text,new
  54  0000               _TIM4_DeInit:
  58                     ; 45     TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  60  0000 725f5340      	clr	21312
  61                     ; 46     TIM4->IER = TIM4_IER_RESET_VALUE;
  63  0004 725f5341      	clr	21313
  64                     ; 47     TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  66  0008 725f5344      	clr	21316
  67                     ; 48     TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  69  000c 725f5345      	clr	21317
  70                     ; 49     TIM4->ARR = TIM4_ARR_RESET_VALUE;
  72  0010 35ff5346      	mov	21318,#255
  73                     ; 50     TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  75  0014 725f5342      	clr	21314
  76                     ; 51 }
  79  0018 81            	ret	
 183                     ; 59 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 183                     ; 60 {
 184                     .text:	section	.text,new
 185  0000               _TIM4_TimeBaseInit:
 189                     ; 62     assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 191                     ; 64     TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 193  0000 9e            	ld	a,xh
 194  0001 c75345        	ld	21317,a
 195                     ; 66     TIM4->ARR = (uint8_t)(TIM4_Period);
 197  0004 9f            	ld	a,xl
 198  0005 c75346        	ld	21318,a
 199                     ; 67 }
 202  0008 81            	ret	
 257                     ; 77 void TIM4_Cmd(FunctionalState NewState)
 257                     ; 78 {
 258                     .text:	section	.text,new
 259  0000               _TIM4_Cmd:
 263                     ; 80     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 265                     ; 83     if (NewState != DISABLE)
 267  0000 4d            	tnz	a
 268  0001 2705          	jreq	L311
 269                     ; 85         TIM4->CR1 |= TIM4_CR1_CEN;
 271  0003 72105340      	bset	21312,#0
 274  0007 81            	ret	
 275  0008               L311:
 276                     ; 89         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 278  0008 72115340      	bres	21312,#0
 279                     ; 91 }
 282  000c 81            	ret	
 340                     ; 103 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 340                     ; 104 {
 341                     .text:	section	.text,new
 342  0000               _TIM4_ITConfig:
 344  0000 89            	pushw	x
 345       00000000      OFST:	set	0
 348                     ; 106     assert_param(IS_TIM4_IT_OK(TIM4_IT));
 350                     ; 107     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 352                     ; 109     if (NewState != DISABLE)
 354  0001 9f            	ld	a,xl
 355  0002 4d            	tnz	a
 356  0003 2706          	jreq	L741
 357                     ; 112         TIM4->IER |= (uint8_t)TIM4_IT;
 359  0005 9e            	ld	a,xh
 360  0006 ca5341        	or	a,21313
 362  0009 2006          	jra	L151
 363  000b               L741:
 364                     ; 117         TIM4->IER &= (uint8_t)(~TIM4_IT);
 366  000b 7b01          	ld	a,(OFST+1,sp)
 367  000d 43            	cpl	a
 368  000e c45341        	and	a,21313
 369  0011               L151:
 370  0011 c75341        	ld	21313,a
 371                     ; 119 }
 374  0014 85            	popw	x
 375  0015 81            	ret	
 411                     ; 127 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 411                     ; 128 {
 412                     .text:	section	.text,new
 413  0000               _TIM4_UpdateDisableConfig:
 417                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 419                     ; 133     if (NewState != DISABLE)
 421  0000 4d            	tnz	a
 422  0001 2705          	jreq	L171
 423                     ; 135         TIM4->CR1 |= TIM4_CR1_UDIS;
 425  0003 72125340      	bset	21312,#1
 428  0007 81            	ret	
 429  0008               L171:
 430                     ; 139         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 432  0008 72135340      	bres	21312,#1
 433                     ; 141 }
 436  000c 81            	ret	
 494                     ; 151 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 494                     ; 152 {
 495                     .text:	section	.text,new
 496  0000               _TIM4_UpdateRequestConfig:
 500                     ; 154     assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 502                     ; 157     if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 504  0000 4d            	tnz	a
 505  0001 2705          	jreq	L322
 506                     ; 159         TIM4->CR1 |= TIM4_CR1_URS;
 508  0003 72145340      	bset	21312,#2
 511  0007 81            	ret	
 512  0008               L322:
 513                     ; 163         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 515  0008 72155340      	bres	21312,#2
 516                     ; 165 }
 519  000c 81            	ret	
 576                     ; 175 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 576                     ; 176 {
 577                     .text:	section	.text,new
 578  0000               _TIM4_SelectOnePulseMode:
 582                     ; 178     assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 584                     ; 181     if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 586  0000 4d            	tnz	a
 587  0001 2705          	jreq	L552
 588                     ; 183         TIM4->CR1 |= TIM4_CR1_OPM;
 590  0003 72165340      	bset	21312,#3
 593  0007 81            	ret	
 594  0008               L552:
 595                     ; 187         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 597  0008 72175340      	bres	21312,#3
 598                     ; 190 }
 601  000c 81            	ret	
 669                     ; 212 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 669                     ; 213 {
 670                     .text:	section	.text,new
 671  0000               _TIM4_PrescalerConfig:
 675                     ; 215     assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 677                     ; 216     assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 679                     ; 219     TIM4->PSCR = (uint8_t)Prescaler;
 681  0000 9e            	ld	a,xh
 682  0001 c75345        	ld	21317,a
 683                     ; 222     TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 685  0004 9f            	ld	a,xl
 686  0005 c75343        	ld	21315,a
 687                     ; 223 }
 690  0008 81            	ret	
 726                     ; 231 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 726                     ; 232 {
 727                     .text:	section	.text,new
 728  0000               _TIM4_ARRPreloadConfig:
 732                     ; 234     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 734                     ; 237     if (NewState != DISABLE)
 736  0000 4d            	tnz	a
 737  0001 2705          	jreq	L133
 738                     ; 239         TIM4->CR1 |= TIM4_CR1_ARPE;
 740  0003 721e5340      	bset	21312,#7
 743  0007 81            	ret	
 744  0008               L133:
 745                     ; 243         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 747  0008 721f5340      	bres	21312,#7
 748                     ; 245 }
 751  000c 81            	ret	
 800                     ; 254 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 800                     ; 255 {
 801                     .text:	section	.text,new
 802  0000               _TIM4_GenerateEvent:
 806                     ; 257     assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 808                     ; 260     TIM4->EGR = (uint8_t)(TIM4_EventSource);
 810  0000 c75343        	ld	21315,a
 811                     ; 261 }
 814  0003 81            	ret	
 846                     ; 270 void TIM4_SetCounter(uint8_t Counter)
 846                     ; 271 {
 847                     .text:	section	.text,new
 848  0000               _TIM4_SetCounter:
 852                     ; 273     TIM4->CNTR = (uint8_t)(Counter);
 854  0000 c75344        	ld	21316,a
 855                     ; 274 }
 858  0003 81            	ret	
 890                     ; 283 void TIM4_SetAutoreload(uint8_t Autoreload)
 890                     ; 284 {
 891                     .text:	section	.text,new
 892  0000               _TIM4_SetAutoreload:
 896                     ; 286     TIM4->ARR = (uint8_t)(Autoreload);
 898  0000 c75346        	ld	21318,a
 899                     ; 287 }
 902  0003 81            	ret	
 925                     ; 294 uint8_t TIM4_GetCounter(void)
 925                     ; 295 {
 926                     .text:	section	.text,new
 927  0000               _TIM4_GetCounter:
 931                     ; 297     return (uint8_t)(TIM4->CNTR);
 933  0000 c65344        	ld	a,21316
 936  0003 81            	ret	
 960                     ; 305 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 960                     ; 306 {
 961                     .text:	section	.text,new
 962  0000               _TIM4_GetPrescaler:
 966                     ; 308     return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 968  0000 c65345        	ld	a,21317
 971  0003 81            	ret	
1050                     ; 318 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1050                     ; 319 {
1051                     .text:	section	.text,new
1052  0000               _TIM4_GetFlagStatus:
1054  0000 88            	push	a
1055       00000001      OFST:	set	1
1058                     ; 320     FlagStatus bitstatus = RESET;
1060                     ; 323     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1062                     ; 325   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1064  0001 c45342        	and	a,21314
1065  0004 2702          	jreq	L174
1066                     ; 327     bitstatus = SET;
1068  0006 a601          	ld	a,#1
1070  0008               L174:
1071                     ; 331     bitstatus = RESET;
1073                     ; 333   return ((FlagStatus)bitstatus);
1077  0008 5b01          	addw	sp,#1
1078  000a 81            	ret	
1113                     ; 343 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1113                     ; 344 {
1114                     .text:	section	.text,new
1115  0000               _TIM4_ClearFlag:
1119                     ; 346     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1121                     ; 349     TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1123  0000 43            	cpl	a
1124  0001 c75342        	ld	21314,a
1125                     ; 351 }
1128  0004 81            	ret	
1188                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1188                     ; 361 {
1189                     .text:	section	.text,new
1190  0000               _TIM4_GetITStatus:
1192  0000 88            	push	a
1193  0001 89            	pushw	x
1194       00000002      OFST:	set	2
1197                     ; 362     ITStatus bitstatus = RESET;
1199                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1203                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1205                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1207  0002 c45342        	and	a,21314
1208  0005 6b01          	ld	(OFST-1,sp),a
1209                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1211  0007 c65341        	ld	a,21313
1212  000a 1403          	and	a,(OFST+1,sp)
1213  000c 6b02          	ld	(OFST+0,sp),a
1214                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1216  000e 7b01          	ld	a,(OFST-1,sp)
1217  0010 2708          	jreq	L145
1219  0012 7b02          	ld	a,(OFST+0,sp)
1220  0014 2704          	jreq	L145
1221                     ; 375     bitstatus = (ITStatus)SET;
1223  0016 a601          	ld	a,#1
1225  0018 2001          	jra	L345
1226  001a               L145:
1227                     ; 379     bitstatus = (ITStatus)RESET;
1229  001a 4f            	clr	a
1230  001b               L345:
1231                     ; 381   return ((ITStatus)bitstatus);
1235  001b 5b03          	addw	sp,#3
1236  001d 81            	ret	
1272                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1272                     ; 392 {
1273                     .text:	section	.text,new
1274  0000               _TIM4_ClearITPendingBit:
1278                     ; 394     assert_param(IS_TIM4_IT_OK(TIM4_IT));
1280                     ; 397     TIM4->SR1 = (uint8_t)(~TIM4_IT);
1282  0000 43            	cpl	a
1283  0001 c75342        	ld	21314,a
1284                     ; 398 }
1287  0004 81            	ret	
1300                     	xdef	_TIM4_ClearITPendingBit
1301                     	xdef	_TIM4_GetITStatus
1302                     	xdef	_TIM4_ClearFlag
1303                     	xdef	_TIM4_GetFlagStatus
1304                     	xdef	_TIM4_GetPrescaler
1305                     	xdef	_TIM4_GetCounter
1306                     	xdef	_TIM4_SetAutoreload
1307                     	xdef	_TIM4_SetCounter
1308                     	xdef	_TIM4_GenerateEvent
1309                     	xdef	_TIM4_ARRPreloadConfig
1310                     	xdef	_TIM4_PrescalerConfig
1311                     	xdef	_TIM4_SelectOnePulseMode
1312                     	xdef	_TIM4_UpdateRequestConfig
1313                     	xdef	_TIM4_UpdateDisableConfig
1314                     	xdef	_TIM4_ITConfig
1315                     	xdef	_TIM4_Cmd
1316                     	xdef	_TIM4_TimeBaseInit
1317                     	xdef	_TIM4_DeInit
1336                     	end
