   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     .const:	section	.text
  21  0000               _HSIDivFactor:
  22  0000 01            	dc.b	1
  23  0001 02            	dc.b	2
  24  0002 04            	dc.b	4
  25  0003 08            	dc.b	8
  26  0004               _CLKPrescTable:
  27  0004 01            	dc.b	1
  28  0005 02            	dc.b	2
  29  0006 04            	dc.b	4
  30  0007 08            	dc.b	8
  31  0008 0a            	dc.b	10
  32  0009 10            	dc.b	16
  33  000a 14            	dc.b	20
  34  000b 28            	dc.b	40
  63                     ; 72 void CLK_DeInit(void)
  63                     ; 73 {
  65                     	switch	.text
  66  0000               _CLK_DeInit:
  70                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  72  0000 350150c0      	mov	20672,#1
  73                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  75  0004 725f50c1      	clr	20673
  76                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  78  0008 35e150c4      	mov	20676,#225
  79                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  81  000c 725f50c5      	clr	20677
  82                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  84  0010 351850c6      	mov	20678,#24
  85                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  87  0014 35ff50c7      	mov	20679,#255
  88                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  90  0018 35ff50ca      	mov	20682,#255
  91                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  93  001c 725f50c8      	clr	20680
  94                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  96  0020 725f50c9      	clr	20681
  98  0024               L52:
  99                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
 101  0024 720050c9fb    	btjt	20681,#0,L52
 102                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 104  0029 725f50c9      	clr	20681
 105                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 107  002d 725f50cc      	clr	20684
 108                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 110  0031 725f50cd      	clr	20685
 111                     ; 88 }
 114  0035 81            	ret	
 171                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 171                     ; 100 {
 172                     	switch	.text
 173  0036               _CLK_FastHaltWakeUpCmd:
 175  0036 88            	push	a
 176       00000000      OFST:	set	0
 179                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 181  0037 4d            	tnz	a
 182  0038 2711          	jreq	L41
 183  003a 4a            	dec	a
 184  003b 270e          	jreq	L41
 185  003d ae0066        	ldw	x,#102
 186  0040 89            	pushw	x
 187  0041 5f            	clrw	x
 188  0042 89            	pushw	x
 189  0043 ae000c        	ldw	x,#L75
 190  0046 cd0000        	call	_assert_failed
 192  0049 5b04          	addw	sp,#4
 193  004b               L41:
 194                     ; 104   if (NewState != DISABLE)
 196  004b 7b01          	ld	a,(OFST+1,sp)
 197  004d 2706          	jreq	L16
 198                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 200  004f 721450c0      	bset	20672,#2
 202  0053 2004          	jra	L36
 203  0055               L16:
 204                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 206  0055 721550c0      	bres	20672,#2
 207  0059               L36:
 208                     ; 114 }
 211  0059 84            	pop	a
 212  005a 81            	ret	
 248                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 248                     ; 122 {
 249                     	switch	.text
 250  005b               _CLK_HSECmd:
 252  005b 88            	push	a
 253       00000000      OFST:	set	0
 256                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 258  005c 4d            	tnz	a
 259  005d 2711          	jreq	L62
 260  005f 4a            	dec	a
 261  0060 270e          	jreq	L62
 262  0062 ae007c        	ldw	x,#124
 263  0065 89            	pushw	x
 264  0066 5f            	clrw	x
 265  0067 89            	pushw	x
 266  0068 ae000c        	ldw	x,#L75
 267  006b cd0000        	call	_assert_failed
 269  006e 5b04          	addw	sp,#4
 270  0070               L62:
 271                     ; 126   if (NewState != DISABLE)
 273  0070 7b01          	ld	a,(OFST+1,sp)
 274  0072 2706          	jreq	L301
 275                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 277  0074 721050c1      	bset	20673,#0
 279  0078 2004          	jra	L501
 280  007a               L301:
 281                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 283  007a 721150c1      	bres	20673,#0
 284  007e               L501:
 285                     ; 136 }
 288  007e 84            	pop	a
 289  007f 81            	ret	
 325                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 325                     ; 144 {
 326                     	switch	.text
 327  0080               _CLK_HSICmd:
 329  0080 88            	push	a
 330       00000000      OFST:	set	0
 333                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 335  0081 4d            	tnz	a
 336  0082 2711          	jreq	L04
 337  0084 4a            	dec	a
 338  0085 270e          	jreq	L04
 339  0087 ae0092        	ldw	x,#146
 340  008a 89            	pushw	x
 341  008b 5f            	clrw	x
 342  008c 89            	pushw	x
 343  008d ae000c        	ldw	x,#L75
 344  0090 cd0000        	call	_assert_failed
 346  0093 5b04          	addw	sp,#4
 347  0095               L04:
 348                     ; 148   if (NewState != DISABLE)
 350  0095 7b01          	ld	a,(OFST+1,sp)
 351  0097 2706          	jreq	L521
 352                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 354  0099 721050c0      	bset	20672,#0
 356  009d 2004          	jra	L721
 357  009f               L521:
 358                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 360  009f 721150c0      	bres	20672,#0
 361  00a3               L721:
 362                     ; 158 }
 365  00a3 84            	pop	a
 366  00a4 81            	ret	
 402                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 402                     ; 167 {
 403                     	switch	.text
 404  00a5               _CLK_LSICmd:
 406  00a5 88            	push	a
 407       00000000      OFST:	set	0
 410                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 412  00a6 4d            	tnz	a
 413  00a7 2711          	jreq	L25
 414  00a9 4a            	dec	a
 415  00aa 270e          	jreq	L25
 416  00ac ae00a9        	ldw	x,#169
 417  00af 89            	pushw	x
 418  00b0 5f            	clrw	x
 419  00b1 89            	pushw	x
 420  00b2 ae000c        	ldw	x,#L75
 421  00b5 cd0000        	call	_assert_failed
 423  00b8 5b04          	addw	sp,#4
 424  00ba               L25:
 425                     ; 171   if (NewState != DISABLE)
 427  00ba 7b01          	ld	a,(OFST+1,sp)
 428  00bc 2706          	jreq	L741
 429                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 431  00be 721650c0      	bset	20672,#3
 433  00c2 2004          	jra	L151
 434  00c4               L741:
 435                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 437  00c4 721750c0      	bres	20672,#3
 438  00c8               L151:
 439                     ; 181 }
 442  00c8 84            	pop	a
 443  00c9 81            	ret	
 479                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 479                     ; 190 {
 480                     	switch	.text
 481  00ca               _CLK_CCOCmd:
 483  00ca 88            	push	a
 484       00000000      OFST:	set	0
 487                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 489  00cb 4d            	tnz	a
 490  00cc 2711          	jreq	L46
 491  00ce 4a            	dec	a
 492  00cf 270e          	jreq	L46
 493  00d1 ae00c0        	ldw	x,#192
 494  00d4 89            	pushw	x
 495  00d5 5f            	clrw	x
 496  00d6 89            	pushw	x
 497  00d7 ae000c        	ldw	x,#L75
 498  00da cd0000        	call	_assert_failed
 500  00dd 5b04          	addw	sp,#4
 501  00df               L46:
 502                     ; 194   if (NewState != DISABLE)
 504  00df 7b01          	ld	a,(OFST+1,sp)
 505  00e1 2706          	jreq	L171
 506                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 508  00e3 721050c9      	bset	20681,#0
 510  00e7 2004          	jra	L371
 511  00e9               L171:
 512                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 514  00e9 721150c9      	bres	20681,#0
 515  00ed               L371:
 516                     ; 204 }
 519  00ed 84            	pop	a
 520  00ee 81            	ret	
 556                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 556                     ; 214 {
 557                     	switch	.text
 558  00ef               _CLK_ClockSwitchCmd:
 560  00ef 88            	push	a
 561       00000000      OFST:	set	0
 564                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 566  00f0 4d            	tnz	a
 567  00f1 2711          	jreq	L67
 568  00f3 4a            	dec	a
 569  00f4 270e          	jreq	L67
 570  00f6 ae00d8        	ldw	x,#216
 571  00f9 89            	pushw	x
 572  00fa 5f            	clrw	x
 573  00fb 89            	pushw	x
 574  00fc ae000c        	ldw	x,#L75
 575  00ff cd0000        	call	_assert_failed
 577  0102 5b04          	addw	sp,#4
 578  0104               L67:
 579                     ; 218   if (NewState != DISABLE )
 581  0104 7b01          	ld	a,(OFST+1,sp)
 582  0106 2706          	jreq	L312
 583                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 585  0108 721250c5      	bset	20677,#1
 587  010c 2004          	jra	L512
 588  010e               L312:
 589                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 591  010e 721350c5      	bres	20677,#1
 592  0112               L512:
 593                     ; 228 }
 596  0112 84            	pop	a
 597  0113 81            	ret	
 634                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 634                     ; 239 {
 635                     	switch	.text
 636  0114               _CLK_SlowActiveHaltWakeUpCmd:
 638  0114 88            	push	a
 639       00000000      OFST:	set	0
 642                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 644  0115 4d            	tnz	a
 645  0116 2711          	jreq	L011
 646  0118 4a            	dec	a
 647  0119 270e          	jreq	L011
 648  011b ae00f1        	ldw	x,#241
 649  011e 89            	pushw	x
 650  011f 5f            	clrw	x
 651  0120 89            	pushw	x
 652  0121 ae000c        	ldw	x,#L75
 653  0124 cd0000        	call	_assert_failed
 655  0127 5b04          	addw	sp,#4
 656  0129               L011:
 657                     ; 243   if (NewState != DISABLE)
 659  0129 7b01          	ld	a,(OFST+1,sp)
 660  012b 2706          	jreq	L532
 661                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 663  012d 721a50c0      	bset	20672,#5
 665  0131 2004          	jra	L732
 666  0133               L532:
 667                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 669  0133 721b50c0      	bres	20672,#5
 670  0137               L732:
 671                     ; 253 }
 674  0137 84            	pop	a
 675  0138 81            	ret	
 835                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 835                     ; 264 {
 836                     	switch	.text
 837  0139               _CLK_PeripheralClockConfig:
 839  0139 89            	pushw	x
 840       00000000      OFST:	set	0
 843                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 845  013a 9f            	ld	a,xl
 846  013b 4d            	tnz	a
 847  013c 270a          	jreq	L221
 848  013e 9f            	ld	a,xl
 849  013f 4a            	dec	a
 850  0140 2706          	jreq	L221
 851  0142 ae010a        	ldw	x,#266
 852  0145 cd01cb        	call	LC004
 853  0148               L221:
 854                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 856  0148 7b01          	ld	a,(OFST+1,sp)
 857  014a 272f          	jreq	L231
 858  014c a101          	cp	a,#1
 859  014e 272b          	jreq	L231
 860  0150 a103          	cp	a,#3
 861  0152 2727          	jreq	L231
 862  0154 a104          	cp	a,#4
 863  0156 2723          	jreq	L231
 864  0158 a105          	cp	a,#5
 865  015a 271f          	jreq	L231
 866  015c a104          	cp	a,#4
 867  015e 271b          	jreq	L231
 868  0160 a106          	cp	a,#6
 869  0162 2717          	jreq	L231
 870  0164 a107          	cp	a,#7
 871  0166 2713          	jreq	L231
 872  0168 a117          	cp	a,#23
 873  016a 270f          	jreq	L231
 874  016c a113          	cp	a,#19
 875  016e 270b          	jreq	L231
 876  0170 a112          	cp	a,#18
 877  0172 2707          	jreq	L231
 878  0174 ae010b        	ldw	x,#267
 879  0177 ad52          	call	LC004
 880  0179 7b01          	ld	a,(OFST+1,sp)
 881  017b               L231:
 882                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 884  017b a510          	bcp	a,#16
 885  017d 2622          	jrne	L323
 886                     ; 271     if (NewState != DISABLE)
 888  017f 0d02          	tnz	(OFST+2,sp)
 889  0181 270d          	jreq	L523
 890                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 892  0183 ad3e          	call	LC003
 893  0185 2704          	jreq	L631
 894  0187               L041:
 895  0187 48            	sll	a
 896  0188 5a            	decw	x
 897  0189 26fc          	jrne	L041
 898  018b               L631:
 899  018b ca50c7        	or	a,20679
 901  018e 200c          	jp	LC002
 902  0190               L523:
 903                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 905  0190 ad31          	call	LC003
 906  0192 2704          	jreq	L241
 907  0194               L441:
 908  0194 48            	sll	a
 909  0195 5a            	decw	x
 910  0196 26fc          	jrne	L441
 911  0198               L241:
 912  0198 43            	cpl	a
 913  0199 c450c7        	and	a,20679
 914  019c               LC002:
 915  019c c750c7        	ld	20679,a
 916  019f 2020          	jra	L133
 917  01a1               L323:
 918                     ; 284     if (NewState != DISABLE)
 920  01a1 0d02          	tnz	(OFST+2,sp)
 921  01a3 270d          	jreq	L333
 922                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 924  01a5 ad1c          	call	LC003
 925  01a7 2704          	jreq	L641
 926  01a9               L051:
 927  01a9 48            	sll	a
 928  01aa 5a            	decw	x
 929  01ab 26fc          	jrne	L051
 930  01ad               L641:
 931  01ad ca50ca        	or	a,20682
 933  01b0 200c          	jp	LC001
 934  01b2               L333:
 935                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 937  01b2 ad0f          	call	LC003
 938  01b4 2704          	jreq	L251
 939  01b6               L451:
 940  01b6 48            	sll	a
 941  01b7 5a            	decw	x
 942  01b8 26fc          	jrne	L451
 943  01ba               L251:
 944  01ba 43            	cpl	a
 945  01bb c450ca        	and	a,20682
 946  01be               LC001:
 947  01be c750ca        	ld	20682,a
 948  01c1               L133:
 949                     ; 295 }
 952  01c1 85            	popw	x
 953  01c2 81            	ret	
 954  01c3               LC003:
 955  01c3 a40f          	and	a,#15
 956  01c5 5f            	clrw	x
 957  01c6 97            	ld	xl,a
 958  01c7 a601          	ld	a,#1
 959  01c9 5d            	tnzw	x
 960  01ca 81            	ret	
 961  01cb               LC004:
 962  01cb 89            	pushw	x
 963  01cc 5f            	clrw	x
 964  01cd 89            	pushw	x
 965  01ce ae000c        	ldw	x,#L75
 966  01d1 cd0000        	call	_assert_failed
 968  01d4 5b04          	addw	sp,#4
 969  01d6 81            	ret	
1158                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1158                     ; 310 {
1159                     	switch	.text
1160  01d7               _CLK_ClockSwitchConfig:
1162  01d7 89            	pushw	x
1163  01d8 5204          	subw	sp,#4
1164       00000004      OFST:	set	4
1167                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1169  01da aeffff        	ldw	x,#65535
1170  01dd 1f03          	ldw	(OFST-1,sp),x
1172                     ; 313   ErrorStatus Swif = ERROR;
1174                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1176  01df 7b06          	ld	a,(OFST+2,sp)
1177  01e1 a1e1          	cp	a,#225
1178  01e3 270e          	jreq	L461
1179  01e5 a1d2          	cp	a,#210
1180  01e7 270a          	jreq	L461
1181  01e9 a1b4          	cp	a,#180
1182  01eb 2706          	jreq	L461
1183  01ed ae013c        	ldw	x,#316
1184  01f0 cd02b3        	call	LC007
1185  01f3               L461:
1186                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1188  01f3 7b05          	ld	a,(OFST+1,sp)
1189  01f5 2709          	jreq	L471
1190  01f7 4a            	dec	a
1191  01f8 2706          	jreq	L471
1192  01fa ae013d        	ldw	x,#317
1193  01fd cd02b3        	call	LC007
1194  0200               L471:
1195                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1197  0200 7b09          	ld	a,(OFST+5,sp)
1198  0202 2709          	jreq	L402
1199  0204 4a            	dec	a
1200  0205 2706          	jreq	L402
1201  0207 ae013e        	ldw	x,#318
1202  020a cd02b3        	call	LC007
1203  020d               L402:
1204                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1206  020d 7b0a          	ld	a,(OFST+6,sp)
1207  020f 2709          	jreq	L412
1208  0211 4a            	dec	a
1209  0212 2706          	jreq	L412
1210  0214 ae013f        	ldw	x,#319
1211  0217 cd02b3        	call	LC007
1212  021a               L412:
1213                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1215  021a c650c3        	ld	a,20675
1216  021d 6b01          	ld	(OFST-3,sp),a
1218                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1220  021f 7b05          	ld	a,(OFST+1,sp)
1221  0221 4a            	dec	a
1222  0222 263d          	jrne	L744
1223                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1225  0224 721250c5      	bset	20677,#1
1226                     ; 331     if (ITState != DISABLE)
1228  0228 7b09          	ld	a,(OFST+5,sp)
1229  022a 2706          	jreq	L154
1230                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1232  022c 721450c5      	bset	20677,#2
1234  0230 2004          	jra	L354
1235  0232               L154:
1236                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1238  0232 721550c5      	bres	20677,#2
1239  0236               L354:
1240                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1242  0236 7b06          	ld	a,(OFST+2,sp)
1243  0238 c750c4        	ld	20676,a
1245  023b 2003          	jra	L164
1246  023d               L554:
1247                     ; 346       DownCounter--;
1249  023d 5a            	decw	x
1250  023e 1f03          	ldw	(OFST-1,sp),x
1252  0240               L164:
1253                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1255  0240 720150c504    	btjf	20677,#0,L564
1257  0245 1e03          	ldw	x,(OFST-1,sp)
1258  0247 26f4          	jrne	L554
1259  0249               L564:
1260                     ; 349     if(DownCounter != 0)
1262  0249 1e03          	ldw	x,(OFST-1,sp)
1263                     ; 351       Swif = SUCCESS;
1265  024b 263d          	jrne	LC006
1266  024d               L764:
1267                     ; 355       Swif = ERROR;
1270  024d 0f02          	clr	(OFST-2,sp)
1272  024f               L374:
1273                     ; 390   if(Swif != ERROR)
1275  024f 275d          	jreq	L715
1276                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1278  0251 7b0a          	ld	a,(OFST+6,sp)
1279  0253 263b          	jrne	L125
1281  0255 7b01          	ld	a,(OFST-3,sp)
1282  0257 a1e1          	cp	a,#225
1283  0259 2635          	jrne	L125
1284                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1286  025b 721150c0      	bres	20672,#0
1288  025f 204d          	jra	L715
1289  0261               L744:
1290                     ; 361     if (ITState != DISABLE)
1292  0261 7b09          	ld	a,(OFST+5,sp)
1293  0263 2706          	jreq	L574
1294                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1296  0265 721450c5      	bset	20677,#2
1298  0269 2004          	jra	L774
1299  026b               L574:
1300                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1302  026b 721550c5      	bres	20677,#2
1303  026f               L774:
1304                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1306  026f 7b06          	ld	a,(OFST+2,sp)
1307  0271 c750c4        	ld	20676,a
1309  0274 2003          	jra	L505
1310  0276               L105:
1311                     ; 376       DownCounter--;
1313  0276 5a            	decw	x
1314  0277 1f03          	ldw	(OFST-1,sp),x
1316  0279               L505:
1317                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1319  0279 720750c504    	btjf	20677,#3,L115
1321  027e 1e03          	ldw	x,(OFST-1,sp)
1322  0280 26f4          	jrne	L105
1323  0282               L115:
1324                     ; 379     if(DownCounter != 0)
1326  0282 1e03          	ldw	x,(OFST-1,sp)
1327  0284 27c7          	jreq	L764
1328                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1330  0286 721250c5      	bset	20677,#1
1331                     ; 383       Swif = SUCCESS;
1333  028a               LC006:
1335  028a a601          	ld	a,#1
1336  028c 6b02          	ld	(OFST-2,sp),a
1339  028e 20bf          	jra	L374
1340                     ; 387       Swif = ERROR;
1341  0290               L125:
1342                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1344  0290 7b0a          	ld	a,(OFST+6,sp)
1345  0292 260c          	jrne	L525
1347  0294 7b01          	ld	a,(OFST-3,sp)
1348  0296 a1d2          	cp	a,#210
1349  0298 2606          	jrne	L525
1350                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1352  029a 721750c0      	bres	20672,#3
1354  029e 200e          	jra	L715
1355  02a0               L525:
1356                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1358  02a0 7b0a          	ld	a,(OFST+6,sp)
1359  02a2 260a          	jrne	L715
1361  02a4 7b01          	ld	a,(OFST-3,sp)
1362  02a6 a1b4          	cp	a,#180
1363  02a8 2604          	jrne	L715
1364                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1366  02aa 721150c1      	bres	20673,#0
1367  02ae               L715:
1368                     ; 406   return(Swif);
1370  02ae 7b02          	ld	a,(OFST-2,sp)
1373  02b0 5b06          	addw	sp,#6
1374  02b2 81            	ret	
1375  02b3               LC007:
1376  02b3 89            	pushw	x
1377  02b4 5f            	clrw	x
1378  02b5 89            	pushw	x
1379  02b6 ae000c        	ldw	x,#L75
1380  02b9 cd0000        	call	_assert_failed
1382  02bc 5b04          	addw	sp,#4
1383  02be 81            	ret	
1522                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1522                     ; 416 {
1523                     	switch	.text
1524  02bf               _CLK_HSIPrescalerConfig:
1526  02bf 88            	push	a
1527       00000000      OFST:	set	0
1530                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1532  02c0 4d            	tnz	a
1533  02c1 271a          	jreq	L622
1534  02c3 a108          	cp	a,#8
1535  02c5 2716          	jreq	L622
1536  02c7 a110          	cp	a,#16
1537  02c9 2712          	jreq	L622
1538  02cb a118          	cp	a,#24
1539  02cd 270e          	jreq	L622
1540  02cf ae01a2        	ldw	x,#418
1541  02d2 89            	pushw	x
1542  02d3 5f            	clrw	x
1543  02d4 89            	pushw	x
1544  02d5 ae000c        	ldw	x,#L75
1545  02d8 cd0000        	call	_assert_failed
1547  02db 5b04          	addw	sp,#4
1548  02dd               L622:
1549                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1551  02dd c650c6        	ld	a,20678
1552  02e0 a4e7          	and	a,#231
1553  02e2 c750c6        	ld	20678,a
1554                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1556  02e5 c650c6        	ld	a,20678
1557  02e8 1a01          	or	a,(OFST+1,sp)
1558  02ea c750c6        	ld	20678,a
1559                     ; 425 }
1562  02ed 84            	pop	a
1563  02ee 81            	ret	
1699                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1699                     ; 437 {
1700                     	switch	.text
1701  02ef               _CLK_CCOConfig:
1703  02ef 88            	push	a
1704       00000000      OFST:	set	0
1707                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1709  02f0 4d            	tnz	a
1710  02f1 273e          	jreq	L042
1711  02f3 a104          	cp	a,#4
1712  02f5 273a          	jreq	L042
1713  02f7 a102          	cp	a,#2
1714  02f9 2736          	jreq	L042
1715  02fb a108          	cp	a,#8
1716  02fd 2732          	jreq	L042
1717  02ff a10a          	cp	a,#10
1718  0301 272e          	jreq	L042
1719  0303 a10c          	cp	a,#12
1720  0305 272a          	jreq	L042
1721  0307 a10e          	cp	a,#14
1722  0309 2726          	jreq	L042
1723  030b a110          	cp	a,#16
1724  030d 2722          	jreq	L042
1725  030f a112          	cp	a,#18
1726  0311 271e          	jreq	L042
1727  0313 a114          	cp	a,#20
1728  0315 271a          	jreq	L042
1729  0317 a116          	cp	a,#22
1730  0319 2716          	jreq	L042
1731  031b a118          	cp	a,#24
1732  031d 2712          	jreq	L042
1733  031f a11a          	cp	a,#26
1734  0321 270e          	jreq	L042
1735  0323 ae01b7        	ldw	x,#439
1736  0326 89            	pushw	x
1737  0327 5f            	clrw	x
1738  0328 89            	pushw	x
1739  0329 ae000c        	ldw	x,#L75
1740  032c cd0000        	call	_assert_failed
1742  032f 5b04          	addw	sp,#4
1743  0331               L042:
1744                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1746  0331 c650c9        	ld	a,20681
1747  0334 a4e1          	and	a,#225
1748  0336 c750c9        	ld	20681,a
1749                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1751  0339 c650c9        	ld	a,20681
1752  033c 1a01          	or	a,(OFST+1,sp)
1753  033e c750c9        	ld	20681,a
1754                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1756  0341 721050c9      	bset	20681,#0
1757                     ; 449 }
1760  0345 84            	pop	a
1761  0346 81            	ret	
1827                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1827                     ; 460 {
1828                     	switch	.text
1829  0347               _CLK_ITConfig:
1831  0347 89            	pushw	x
1832       00000000      OFST:	set	0
1835                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1837  0348 9f            	ld	a,xl
1838  0349 4d            	tnz	a
1839  034a 2709          	jreq	L252
1840  034c 9f            	ld	a,xl
1841  034d 4a            	dec	a
1842  034e 2705          	jreq	L252
1843  0350 ae01ce        	ldw	x,#462
1844  0353 ad3f          	call	LC008
1845  0355               L252:
1846                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1848  0355 7b01          	ld	a,(OFST+1,sp)
1849  0357 a10c          	cp	a,#12
1850  0359 2709          	jreq	L262
1851  035b a11c          	cp	a,#28
1852  035d 2705          	jreq	L262
1853  035f ae01cf        	ldw	x,#463
1854  0362 ad30          	call	LC008
1855  0364               L262:
1856                     ; 465   if (NewState != DISABLE)
1858  0364 7b02          	ld	a,(OFST+2,sp)
1859  0366 2716          	jreq	L727
1860                     ; 467     switch (CLK_IT)
1862  0368 7b01          	ld	a,(OFST+1,sp)
1864                     ; 475     default:
1864                     ; 476       break;
1865  036a a00c          	sub	a,#12
1866  036c 270a          	jreq	L366
1867  036e a010          	sub	a,#16
1868  0370 2620          	jrne	L537
1869                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1869                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1871  0372 721450c5      	bset	20677,#2
1872                     ; 471       break;
1874  0376 201a          	jra	L537
1875  0378               L366:
1876                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1876                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1878  0378 721450c8      	bset	20680,#2
1879                     ; 474       break;
1881  037c 2014          	jra	L537
1882                     ; 475     default:
1882                     ; 476       break;
1885  037e               L727:
1886                     ; 481     switch (CLK_IT)
1888  037e 7b01          	ld	a,(OFST+1,sp)
1890                     ; 489     default:
1890                     ; 490       break;
1891  0380 a00c          	sub	a,#12
1892  0382 270a          	jreq	L176
1893  0384 a010          	sub	a,#16
1894  0386 260a          	jrne	L537
1895                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1895                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1897  0388 721550c5      	bres	20677,#2
1898                     ; 485       break;
1900  038c 2004          	jra	L537
1901  038e               L176:
1902                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1902                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1904  038e 721550c8      	bres	20680,#2
1905                     ; 488       break;
1906  0392               L537:
1907                     ; 493 }
1910  0392 85            	popw	x
1911  0393 81            	ret	
1912                     ; 489     default:
1912                     ; 490       break;
1914  0394               LC008:
1915  0394 89            	pushw	x
1916  0395 5f            	clrw	x
1917  0396 89            	pushw	x
1918  0397 ae000c        	ldw	x,#L75
1919  039a cd0000        	call	_assert_failed
1921  039d 5b04          	addw	sp,#4
1922  039f 81            	ret	
1958                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1958                     ; 501 {
1959                     	switch	.text
1960  03a0               _CLK_SYSCLKConfig:
1962  03a0 88            	push	a
1963       00000000      OFST:	set	0
1966                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1968  03a1 4d            	tnz	a
1969  03a2 273a          	jreq	L472
1970  03a4 a108          	cp	a,#8
1971  03a6 2736          	jreq	L472
1972  03a8 a110          	cp	a,#16
1973  03aa 2732          	jreq	L472
1974  03ac a118          	cp	a,#24
1975  03ae 272e          	jreq	L472
1976  03b0 a180          	cp	a,#128
1977  03b2 272a          	jreq	L472
1978  03b4 a181          	cp	a,#129
1979  03b6 2726          	jreq	L472
1980  03b8 a182          	cp	a,#130
1981  03ba 2722          	jreq	L472
1982  03bc a183          	cp	a,#131
1983  03be 271e          	jreq	L472
1984  03c0 a184          	cp	a,#132
1985  03c2 271a          	jreq	L472
1986  03c4 a185          	cp	a,#133
1987  03c6 2716          	jreq	L472
1988  03c8 a186          	cp	a,#134
1989  03ca 2712          	jreq	L472
1990  03cc a187          	cp	a,#135
1991  03ce 270e          	jreq	L472
1992  03d0 ae01f7        	ldw	x,#503
1993  03d3 89            	pushw	x
1994  03d4 5f            	clrw	x
1995  03d5 89            	pushw	x
1996  03d6 ae000c        	ldw	x,#L75
1997  03d9 cd0000        	call	_assert_failed
1999  03dc 5b04          	addw	sp,#4
2000  03de               L472:
2001                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
2003  03de 7b01          	ld	a,(OFST+1,sp)
2004  03e0 2b0e          	jrmi	L167
2005                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
2007  03e2 c650c6        	ld	a,20678
2008  03e5 a4e7          	and	a,#231
2009  03e7 c750c6        	ld	20678,a
2010                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
2012  03ea 7b01          	ld	a,(OFST+1,sp)
2013  03ec a418          	and	a,#24
2015  03ee 200c          	jra	L367
2016  03f0               L167:
2017                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
2019  03f0 c650c6        	ld	a,20678
2020  03f3 a4f8          	and	a,#248
2021  03f5 c750c6        	ld	20678,a
2022                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
2024  03f8 7b01          	ld	a,(OFST+1,sp)
2025  03fa a407          	and	a,#7
2026  03fc               L367:
2027  03fc ca50c6        	or	a,20678
2028  03ff c750c6        	ld	20678,a
2029                     ; 515 }
2032  0402 84            	pop	a
2033  0403 81            	ret	
2090                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
2090                     ; 524 {
2091                     	switch	.text
2092  0404               _CLK_SWIMConfig:
2094  0404 88            	push	a
2095       00000000      OFST:	set	0
2098                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
2100  0405 4d            	tnz	a
2101  0406 2711          	jreq	L603
2102  0408 4a            	dec	a
2103  0409 270e          	jreq	L603
2104  040b ae020e        	ldw	x,#526
2105  040e 89            	pushw	x
2106  040f 5f            	clrw	x
2107  0410 89            	pushw	x
2108  0411 ae000c        	ldw	x,#L75
2109  0414 cd0000        	call	_assert_failed
2111  0417 5b04          	addw	sp,#4
2112  0419               L603:
2113                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
2115  0419 7b01          	ld	a,(OFST+1,sp)
2116  041b 2706          	jreq	L3101
2117                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
2119  041d 721050cd      	bset	20685,#0
2121  0421 2004          	jra	L5101
2122  0423               L3101:
2123                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
2125  0423 721150cd      	bres	20685,#0
2126  0427               L5101:
2127                     ; 538 }
2130  0427 84            	pop	a
2131  0428 81            	ret	
2155                     ; 547 void CLK_ClockSecuritySystemEnable(void)
2155                     ; 548 {
2156                     	switch	.text
2157  0429               _CLK_ClockSecuritySystemEnable:
2161                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
2163  0429 721050c8      	bset	20680,#0
2164                     ; 551 }
2167  042d 81            	ret	
2192                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
2192                     ; 560 {
2193                     	switch	.text
2194  042e               _CLK_GetSYSCLKSource:
2198                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
2200  042e c650c3        	ld	a,20675
2203  0431 81            	ret	
2266                     ; 569 uint32_t CLK_GetClockFreq(void)
2266                     ; 570 {
2267                     	switch	.text
2268  0432               _CLK_GetClockFreq:
2270  0432 5209          	subw	sp,#9
2271       00000009      OFST:	set	9
2274                     ; 571   uint32_t clockfrequency = 0;
2276                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2278                     ; 573   uint8_t tmp = 0, presc = 0;
2282                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2284  0434 c650c3        	ld	a,20675
2285  0437 6b09          	ld	(OFST+0,sp),a
2287                     ; 578   if (clocksource == CLK_SOURCE_HSI)
2289  0439 a1e1          	cp	a,#225
2290  043b 2634          	jrne	L1701
2291                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2293  043d c650c6        	ld	a,20678
2294  0440 a418          	and	a,#24
2295  0442 44            	srl	a
2296  0443 44            	srl	a
2297  0444 44            	srl	a
2299                     ; 581     tmp = (uint8_t)(tmp >> 3);
2302                     ; 582     presc = HSIDivFactor[tmp];
2304  0445 5f            	clrw	x
2305  0446 97            	ld	xl,a
2306  0447 d60000        	ld	a,(_HSIDivFactor,x)
2307  044a 6b09          	ld	(OFST+0,sp),a
2309                     ; 583     clockfrequency = HSI_VALUE / presc;
2311  044c b703          	ld	c_lreg+3,a
2312  044e 3f02          	clr	c_lreg+2
2313  0450 3f01          	clr	c_lreg+1
2314  0452 3f00          	clr	c_lreg
2315  0454 96            	ldw	x,sp
2316  0455 5c            	incw	x
2317  0456 cd0000        	call	c_rtol
2320  0459 ae2400        	ldw	x,#9216
2321  045c bf02          	ldw	c_lreg+2,x
2322  045e ae00f4        	ldw	x,#244
2323  0461 bf00          	ldw	c_lreg,x
2324  0463 96            	ldw	x,sp
2325  0464 5c            	incw	x
2326  0465 cd0000        	call	c_ludv
2328  0468 96            	ldw	x,sp
2329  0469 1c0005        	addw	x,#OFST-4
2330  046c cd0000        	call	c_rtol
2334  046f 2018          	jra	L3701
2335  0471               L1701:
2336                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2338  0471 a1d2          	cp	a,#210
2339  0473 260a          	jrne	L5701
2340                     ; 587     clockfrequency = LSI_VALUE;
2342  0475 aef400        	ldw	x,#62464
2343  0478 1f07          	ldw	(OFST-2,sp),x
2344  047a ae0001        	ldw	x,#1
2346  047d 2008          	jp	LC009
2347  047f               L5701:
2348                     ; 591     clockfrequency = HSE_VALUE;
2350  047f ae2400        	ldw	x,#9216
2351  0482 1f07          	ldw	(OFST-2,sp),x
2352  0484 ae00f4        	ldw	x,#244
2353  0487               LC009:
2354  0487 1f05          	ldw	(OFST-4,sp),x
2356  0489               L3701:
2357                     ; 594   return((uint32_t)clockfrequency);
2359  0489 96            	ldw	x,sp
2360  048a 1c0005        	addw	x,#OFST-4
2361  048d cd0000        	call	c_ltor
2365  0490 5b09          	addw	sp,#9
2366  0492 81            	ret	
2466                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2466                     ; 605 {
2467                     	switch	.text
2468  0493               _CLK_AdjustHSICalibrationValue:
2470  0493 88            	push	a
2471       00000000      OFST:	set	0
2474                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2476  0494 4d            	tnz	a
2477  0495 272a          	jreq	L623
2478  0497 a101          	cp	a,#1
2479  0499 2726          	jreq	L623
2480  049b a102          	cp	a,#2
2481  049d 2722          	jreq	L623
2482  049f a103          	cp	a,#3
2483  04a1 271e          	jreq	L623
2484  04a3 a104          	cp	a,#4
2485  04a5 271a          	jreq	L623
2486  04a7 a105          	cp	a,#5
2487  04a9 2716          	jreq	L623
2488  04ab a106          	cp	a,#6
2489  04ad 2712          	jreq	L623
2490  04af a107          	cp	a,#7
2491  04b1 270e          	jreq	L623
2492  04b3 ae025f        	ldw	x,#607
2493  04b6 89            	pushw	x
2494  04b7 5f            	clrw	x
2495  04b8 89            	pushw	x
2496  04b9 ae000c        	ldw	x,#L75
2497  04bc cd0000        	call	_assert_failed
2499  04bf 5b04          	addw	sp,#4
2500  04c1               L623:
2501                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2503  04c1 c650cc        	ld	a,20684
2504  04c4 a4f8          	and	a,#248
2505  04c6 1a01          	or	a,(OFST+1,sp)
2506  04c8 c750cc        	ld	20684,a
2507                     ; 611 }
2510  04cb 84            	pop	a
2511  04cc 81            	ret	
2535                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2535                     ; 623 {
2536                     	switch	.text
2537  04cd               _CLK_SYSCLKEmergencyClear:
2541                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2543  04cd 721150c5      	bres	20677,#0
2544                     ; 625 }
2547  04d1 81            	ret	
2701                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2701                     ; 635 {
2702                     	switch	.text
2703  04d2               _CLK_GetFlagStatus:
2705  04d2 89            	pushw	x
2706  04d3 5203          	subw	sp,#3
2707       00000003      OFST:	set	3
2710                     ; 636   uint16_t statusreg = 0;
2712                     ; 637   uint8_t tmpreg = 0;
2714                     ; 638   FlagStatus bitstatus = RESET;
2716                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2718  04d5 a30110        	cpw	x,#272
2719  04d8 2736          	jreq	L243
2720  04da a30102        	cpw	x,#258
2721  04dd 2731          	jreq	L243
2722  04df a30202        	cpw	x,#514
2723  04e2 272c          	jreq	L243
2724  04e4 a30308        	cpw	x,#776
2725  04e7 2727          	jreq	L243
2726  04e9 a30301        	cpw	x,#769
2727  04ec 2722          	jreq	L243
2728  04ee a30408        	cpw	x,#1032
2729  04f1 271d          	jreq	L243
2730  04f3 a30402        	cpw	x,#1026
2731  04f6 2718          	jreq	L243
2732  04f8 a30504        	cpw	x,#1284
2733  04fb 2713          	jreq	L243
2734  04fd a30502        	cpw	x,#1282
2735  0500 270e          	jreq	L243
2736  0502 ae0281        	ldw	x,#641
2737  0505 89            	pushw	x
2738  0506 5f            	clrw	x
2739  0507 89            	pushw	x
2740  0508 ae000c        	ldw	x,#L75
2741  050b cd0000        	call	_assert_failed
2743  050e 5b04          	addw	sp,#4
2744  0510               L243:
2745                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2747  0510 7b04          	ld	a,(OFST+1,sp)
2748  0512 97            	ld	xl,a
2749  0513 4f            	clr	a
2750  0514 02            	rlwa	x,a
2751  0515 1f01          	ldw	(OFST-2,sp),x
2753                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2755  0517 a30100        	cpw	x,#256
2756  051a 2605          	jrne	L3421
2757                     ; 649     tmpreg = CLK->ICKR;
2759  051c c650c0        	ld	a,20672
2761  051f 2021          	jra	L5421
2762  0521               L3421:
2763                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2765  0521 a30200        	cpw	x,#512
2766  0524 2605          	jrne	L7421
2767                     ; 653     tmpreg = CLK->ECKR;
2769  0526 c650c1        	ld	a,20673
2771  0529 2017          	jra	L5421
2772  052b               L7421:
2773                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2775  052b a30300        	cpw	x,#768
2776  052e 2605          	jrne	L3521
2777                     ; 657     tmpreg = CLK->SWCR;
2779  0530 c650c5        	ld	a,20677
2781  0533 200d          	jra	L5421
2782  0535               L3521:
2783                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2785  0535 a30400        	cpw	x,#1024
2786  0538 2605          	jrne	L7521
2787                     ; 661     tmpreg = CLK->CSSR;
2789  053a c650c8        	ld	a,20680
2791  053d 2003          	jra	L5421
2792  053f               L7521:
2793                     ; 665     tmpreg = CLK->CCOR;
2795  053f c650c9        	ld	a,20681
2796  0542               L5421:
2797  0542 6b03          	ld	(OFST+0,sp),a
2799                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2801  0544 7b05          	ld	a,(OFST+2,sp)
2802  0546 1503          	bcp	a,(OFST+0,sp)
2803  0548 2704          	jreq	L3621
2804                     ; 670     bitstatus = SET;
2806  054a a601          	ld	a,#1
2809  054c 2001          	jra	L5621
2810  054e               L3621:
2811                     ; 674     bitstatus = RESET;
2813  054e 4f            	clr	a
2815  054f               L5621:
2816                     ; 678   return((FlagStatus)bitstatus);
2820  054f 5b05          	addw	sp,#5
2821  0551 81            	ret	
2868                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2868                     ; 688 {
2869                     	switch	.text
2870  0552               _CLK_GetITStatus:
2872  0552 88            	push	a
2873  0553 88            	push	a
2874       00000001      OFST:	set	1
2877                     ; 689   ITStatus bitstatus = RESET;
2879                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2881  0554 a10c          	cp	a,#12
2882  0556 2712          	jreq	L453
2883  0558 a11c          	cp	a,#28
2884  055a 270e          	jreq	L453
2885  055c ae02b4        	ldw	x,#692
2886  055f 89            	pushw	x
2887  0560 5f            	clrw	x
2888  0561 89            	pushw	x
2889  0562 ae000c        	ldw	x,#L75
2890  0565 cd0000        	call	_assert_failed
2892  0568 5b04          	addw	sp,#4
2893  056a               L453:
2894                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2896  056a 7b02          	ld	a,(OFST+1,sp)
2897  056c a11c          	cp	a,#28
2898  056e 260b          	jrne	L1131
2899                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2901  0570 c650c5        	ld	a,20677
2902  0573 1402          	and	a,(OFST+1,sp)
2903  0575 a10c          	cp	a,#12
2904  0577 260f          	jrne	L1231
2905                     ; 699       bitstatus = SET;
2907  0579 2009          	jp	LC011
2908                     ; 703       bitstatus = RESET;
2909  057b               L1131:
2910                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2912  057b c650c8        	ld	a,20680
2913  057e 1402          	and	a,(OFST+1,sp)
2914  0580 a10c          	cp	a,#12
2915  0582 2604          	jrne	L1231
2916                     ; 711       bitstatus = SET;
2918  0584               LC011:
2920  0584 a601          	ld	a,#1
2923  0586 2001          	jra	L7131
2924  0588               L1231:
2925                     ; 715       bitstatus = RESET;
2928  0588 4f            	clr	a
2930  0589               L7131:
2931                     ; 720   return bitstatus;
2935  0589 85            	popw	x
2936  058a 81            	ret	
2973                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2973                     ; 730 {
2974                     	switch	.text
2975  058b               _CLK_ClearITPendingBit:
2977  058b 88            	push	a
2978       00000000      OFST:	set	0
2981                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2983  058c a10c          	cp	a,#12
2984  058e 2712          	jreq	L663
2985  0590 a11c          	cp	a,#28
2986  0592 270e          	jreq	L663
2987  0594 ae02dc        	ldw	x,#732
2988  0597 89            	pushw	x
2989  0598 5f            	clrw	x
2990  0599 89            	pushw	x
2991  059a ae000c        	ldw	x,#L75
2992  059d cd0000        	call	_assert_failed
2994  05a0 5b04          	addw	sp,#4
2995  05a2               L663:
2996                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2998  05a2 7b01          	ld	a,(OFST+1,sp)
2999  05a4 a10c          	cp	a,#12
3000  05a6 2606          	jrne	L3431
3001                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
3003  05a8 721750c8      	bres	20680,#3
3005  05ac 2004          	jra	L5431
3006  05ae               L3431:
3007                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
3009  05ae 721750c5      	bres	20677,#3
3010  05b2               L5431:
3011                     ; 745 }
3014  05b2 84            	pop	a
3015  05b3 81            	ret	
3050                     	xdef	_CLKPrescTable
3051                     	xdef	_HSIDivFactor
3052                     	xdef	_CLK_ClearITPendingBit
3053                     	xdef	_CLK_GetITStatus
3054                     	xdef	_CLK_GetFlagStatus
3055                     	xdef	_CLK_GetSYSCLKSource
3056                     	xdef	_CLK_GetClockFreq
3057                     	xdef	_CLK_AdjustHSICalibrationValue
3058                     	xdef	_CLK_SYSCLKEmergencyClear
3059                     	xdef	_CLK_ClockSecuritySystemEnable
3060                     	xdef	_CLK_SWIMConfig
3061                     	xdef	_CLK_SYSCLKConfig
3062                     	xdef	_CLK_ITConfig
3063                     	xdef	_CLK_CCOConfig
3064                     	xdef	_CLK_HSIPrescalerConfig
3065                     	xdef	_CLK_ClockSwitchConfig
3066                     	xdef	_CLK_PeripheralClockConfig
3067                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
3068                     	xdef	_CLK_FastHaltWakeUpCmd
3069                     	xdef	_CLK_ClockSwitchCmd
3070                     	xdef	_CLK_CCOCmd
3071                     	xdef	_CLK_LSICmd
3072                     	xdef	_CLK_HSICmd
3073                     	xdef	_CLK_HSECmd
3074                     	xdef	_CLK_DeInit
3075                     	xref	_assert_failed
3076                     	switch	.const
3077  000c               L75:
3078  000c 2e2e5c2e2e5c  	dc.b	"..\..\stm\librarie"
3079  001e 735c73746d38  	dc.b	"s\stm8s_stdperiph_"
3080  0030 647269766572  	dc.b	"driver\src\stm8s_c"
3081  0042 6c6b2e6300    	dc.b	"lk.c",0
3082                     	xref.b	c_lreg
3083                     	xref.b	c_x
3103                     	xref	c_ltor
3104                     	xref	c_ludv
3105                     	xref	c_rtol
3106                     	end
