   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  48                     ; 52 void ADC1_DeInit(void)
  48                     ; 53 {
  50                     	switch	.text
  51  0000               _ADC1_DeInit:
  55                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  57  0000 725f5400      	clr	21504
  58                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  60  0004 725f5401      	clr	21505
  61                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  63  0008 725f5402      	clr	21506
  64                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  66  000c 725f5403      	clr	21507
  67                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  69  0010 725f5406      	clr	21510
  70                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  72  0014 725f5407      	clr	21511
  73                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  75  0018 35ff5408      	mov	21512,#255
  76                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  78  001c 35035409      	mov	21513,#3
  79                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  81  0020 725f540a      	clr	21514
  82                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  84  0024 725f540b      	clr	21515
  85                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  87  0028 725f540e      	clr	21518
  88                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  90  002c 725f540f      	clr	21519
  91                     ; 66 }
  94  0030 81            	ret	
 546                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 546                     ; 89 {
 547                     	switch	.text
 548  0031               _ADC1_Init:
 550  0031 89            	pushw	x
 551       00000000      OFST:	set	0
 554                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 556  0032 9e            	ld	a,xh
 557  0033 4d            	tnz	a
 558  0034 270a          	jreq	L41
 559  0036 9e            	ld	a,xh
 560  0037 4a            	dec	a
 561  0038 2706          	jreq	L41
 562  003a ae005b        	ldw	x,#91
 563  003d cd0128        	call	LC001
 564  0040               L41:
 565                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 567  0040 7b02          	ld	a,(OFST+2,sp)
 568  0042 272e          	jreq	L42
 569  0044 a101          	cp	a,#1
 570  0046 272a          	jreq	L42
 571  0048 a102          	cp	a,#2
 572  004a 2726          	jreq	L42
 573  004c a103          	cp	a,#3
 574  004e 2722          	jreq	L42
 575  0050 a104          	cp	a,#4
 576  0052 271e          	jreq	L42
 577  0054 a105          	cp	a,#5
 578  0056 271a          	jreq	L42
 579  0058 a106          	cp	a,#6
 580  005a 2716          	jreq	L42
 581  005c a107          	cp	a,#7
 582  005e 2712          	jreq	L42
 583  0060 a108          	cp	a,#8
 584  0062 270e          	jreq	L42
 585  0064 a10c          	cp	a,#12
 586  0066 270a          	jreq	L42
 587  0068 a109          	cp	a,#9
 588  006a 2706          	jreq	L42
 589  006c ae005c        	ldw	x,#92
 590  006f cd0128        	call	LC001
 591  0072               L42:
 592                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 594  0072 7b05          	ld	a,(OFST+5,sp)
 595  0074 2722          	jreq	L43
 596  0076 a110          	cp	a,#16
 597  0078 271e          	jreq	L43
 598  007a a120          	cp	a,#32
 599  007c 271a          	jreq	L43
 600  007e a130          	cp	a,#48
 601  0080 2716          	jreq	L43
 602  0082 a140          	cp	a,#64
 603  0084 2712          	jreq	L43
 604  0086 a150          	cp	a,#80
 605  0088 270e          	jreq	L43
 606  008a a160          	cp	a,#96
 607  008c 270a          	jreq	L43
 608  008e a170          	cp	a,#112
 609  0090 2706          	jreq	L43
 610  0092 ae005d        	ldw	x,#93
 611  0095 cd0128        	call	LC001
 612  0098               L43:
 613                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 615  0098 7b06          	ld	a,(OFST+6,sp)
 616  009a 270a          	jreq	L44
 617  009c a110          	cp	a,#16
 618  009e 2706          	jreq	L44
 619  00a0 ae005e        	ldw	x,#94
 620  00a3 cd0128        	call	LC001
 621  00a6               L44:
 622                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 624  00a6 7b07          	ld	a,(OFST+7,sp)
 625  00a8 2708          	jreq	L45
 626  00aa 4a            	dec	a
 627  00ab 2705          	jreq	L45
 628  00ad ae005f        	ldw	x,#95
 629  00b0 ad76          	call	LC001
 630  00b2               L45:
 631                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 633  00b2 7b08          	ld	a,(OFST+8,sp)
 634  00b4 2709          	jreq	L46
 635  00b6 a108          	cp	a,#8
 636  00b8 2705          	jreq	L46
 637  00ba ae0060        	ldw	x,#96
 638  00bd ad69          	call	LC001
 639  00bf               L46:
 640                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 642  00bf 7b09          	ld	a,(OFST+9,sp)
 643  00c1 2731          	jreq	L47
 644  00c3 a101          	cp	a,#1
 645  00c5 272d          	jreq	L47
 646  00c7 a102          	cp	a,#2
 647  00c9 2729          	jreq	L47
 648  00cb a103          	cp	a,#3
 649  00cd 2725          	jreq	L47
 650  00cf a104          	cp	a,#4
 651  00d1 2721          	jreq	L47
 652  00d3 a105          	cp	a,#5
 653  00d5 271d          	jreq	L47
 654  00d7 a106          	cp	a,#6
 655  00d9 2719          	jreq	L47
 656  00db a107          	cp	a,#7
 657  00dd 2715          	jreq	L47
 658  00df a108          	cp	a,#8
 659  00e1 2711          	jreq	L47
 660  00e3 a10c          	cp	a,#12
 661  00e5 270d          	jreq	L47
 662  00e7 a1ff          	cp	a,#255
 663  00e9 2709          	jreq	L47
 664  00eb a109          	cp	a,#9
 665  00ed 2705          	jreq	L47
 666  00ef ae0061        	ldw	x,#97
 667  00f2 ad34          	call	LC001
 668  00f4               L47:
 669                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 671  00f4 7b0a          	ld	a,(OFST+10,sp)
 672  00f6 2708          	jreq	L401
 673  00f8 4a            	dec	a
 674  00f9 2705          	jreq	L401
 675  00fb ae0062        	ldw	x,#98
 676  00fe ad28          	call	LC001
 677  0100               L401:
 678                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 680  0100 7b08          	ld	a,(OFST+8,sp)
 681  0102 88            	push	a
 682  0103 7b03          	ld	a,(OFST+3,sp)
 683  0105 97            	ld	xl,a
 684  0106 7b02          	ld	a,(OFST+2,sp)
 685  0108 95            	ld	xh,a
 686  0109 cd0264        	call	_ADC1_ConversionConfig
 688  010c 84            	pop	a
 689                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 691  010d 7b05          	ld	a,(OFST+5,sp)
 692  010f ad48          	call	_ADC1_PrescalerConfig
 694                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 696  0111 7b07          	ld	a,(OFST+7,sp)
 697  0113 97            	ld	xl,a
 698  0114 7b06          	ld	a,(OFST+6,sp)
 699  0116 95            	ld	xh,a
 700  0117 cd02e9        	call	_ADC1_ExternalTriggerConfig
 702                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 704  011a 7b0a          	ld	a,(OFST+10,sp)
 705  011c 97            	ld	xl,a
 706  011d 7b09          	ld	a,(OFST+9,sp)
 707  011f 95            	ld	xh,a
 708  0120 ad77          	call	_ADC1_SchmittTriggerConfig
 710                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 712  0122 72105401      	bset	21505,#0
 713                     ; 119 }
 716  0126 85            	popw	x
 717  0127 81            	ret	
 718  0128               LC001:
 719  0128 89            	pushw	x
 720  0129 5f            	clrw	x
 721  012a 89            	pushw	x
 722  012b ae0000        	ldw	x,#L542
 723  012e cd0000        	call	_assert_failed
 725  0131 5b04          	addw	sp,#4
 726  0133 81            	ret	
 762                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 762                     ; 127 {
 763                     	switch	.text
 764  0134               _ADC1_Cmd:
 766  0134 88            	push	a
 767       00000000      OFST:	set	0
 770                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 772  0135 4d            	tnz	a
 773  0136 2711          	jreq	L621
 774  0138 4a            	dec	a
 775  0139 270e          	jreq	L621
 776  013b ae0081        	ldw	x,#129
 777  013e 89            	pushw	x
 778  013f 5f            	clrw	x
 779  0140 89            	pushw	x
 780  0141 ae0000        	ldw	x,#L542
 781  0144 cd0000        	call	_assert_failed
 783  0147 5b04          	addw	sp,#4
 784  0149               L621:
 785                     ; 131   if (NewState != DISABLE)
 787  0149 7b01          	ld	a,(OFST+1,sp)
 788  014b 2706          	jreq	L562
 789                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 791  014d 72105401      	bset	21505,#0
 793  0151 2004          	jra	L762
 794  0153               L562:
 795                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 797  0153 72115401      	bres	21505,#0
 798  0157               L762:
 799                     ; 139 }
 802  0157 84            	pop	a
 803  0158 81            	ret	
 840                     ; 224 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
 840                     ; 225 {
 841                     	switch	.text
 842  0159               _ADC1_PrescalerConfig:
 844  0159 88            	push	a
 845       00000000      OFST:	set	0
 848                     ; 227   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
 850  015a 4d            	tnz	a
 851  015b 272a          	jreq	L041
 852  015d a110          	cp	a,#16
 853  015f 2726          	jreq	L041
 854  0161 a120          	cp	a,#32
 855  0163 2722          	jreq	L041
 856  0165 a130          	cp	a,#48
 857  0167 271e          	jreq	L041
 858  0169 a140          	cp	a,#64
 859  016b 271a          	jreq	L041
 860  016d a150          	cp	a,#80
 861  016f 2716          	jreq	L041
 862  0171 a160          	cp	a,#96
 863  0173 2712          	jreq	L041
 864  0175 a170          	cp	a,#112
 865  0177 270e          	jreq	L041
 866  0179 ae00e3        	ldw	x,#227
 867  017c 89            	pushw	x
 868  017d 5f            	clrw	x
 869  017e 89            	pushw	x
 870  017f ae0000        	ldw	x,#L542
 871  0182 cd0000        	call	_assert_failed
 873  0185 5b04          	addw	sp,#4
 874  0187               L041:
 875                     ; 230   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
 877  0187 c65401        	ld	a,21505
 878  018a a48f          	and	a,#143
 879  018c c75401        	ld	21505,a
 880                     ; 232   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
 882  018f c65401        	ld	a,21505
 883  0192 1a01          	or	a,(OFST+1,sp)
 884  0194 c75401        	ld	21505,a
 885                     ; 233 }
 888  0197 84            	pop	a
 889  0198 81            	ret	
 937                     ; 245 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
 937                     ; 246 {
 938                     	switch	.text
 939  0199               _ADC1_SchmittTriggerConfig:
 941  0199 89            	pushw	x
 942       00000000      OFST:	set	0
 945                     ; 248   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 947  019a 9e            	ld	a,xh
 948  019b 4d            	tnz	a
 949  019c 273b          	jreq	L251
 950  019e 9e            	ld	a,xh
 951  019f 4a            	dec	a
 952  01a0 2737          	jreq	L251
 953  01a2 9e            	ld	a,xh
 954  01a3 a102          	cp	a,#2
 955  01a5 2732          	jreq	L251
 956  01a7 9e            	ld	a,xh
 957  01a8 a103          	cp	a,#3
 958  01aa 272d          	jreq	L251
 959  01ac 9e            	ld	a,xh
 960  01ad a104          	cp	a,#4
 961  01af 2728          	jreq	L251
 962  01b1 9e            	ld	a,xh
 963  01b2 a105          	cp	a,#5
 964  01b4 2723          	jreq	L251
 965  01b6 9e            	ld	a,xh
 966  01b7 a106          	cp	a,#6
 967  01b9 271e          	jreq	L251
 968  01bb 9e            	ld	a,xh
 969  01bc a107          	cp	a,#7
 970  01be 2719          	jreq	L251
 971  01c0 9e            	ld	a,xh
 972  01c1 a108          	cp	a,#8
 973  01c3 2714          	jreq	L251
 974  01c5 9e            	ld	a,xh
 975  01c6 a10c          	cp	a,#12
 976  01c8 270f          	jreq	L251
 977  01ca 9e            	ld	a,xh
 978  01cb 4c            	inc	a
 979  01cc 270b          	jreq	L251
 980  01ce 9e            	ld	a,xh
 981  01cf a109          	cp	a,#9
 982  01d1 2706          	jreq	L251
 983  01d3 ae00f8        	ldw	x,#248
 984  01d6 cd0258        	call	LC005
 985  01d9               L251:
 986                     ; 249   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 988  01d9 7b02          	ld	a,(OFST+2,sp)
 989  01db 2708          	jreq	L261
 990  01dd 4a            	dec	a
 991  01de 2705          	jreq	L261
 992  01e0 ae00f9        	ldw	x,#249
 993  01e3 ad73          	call	LC005
 994  01e5               L261:
 995                     ; 251   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
 997  01e5 7b01          	ld	a,(OFST+1,sp)
 998  01e7 a1ff          	cp	a,#255
 999  01e9 261d          	jrne	L133
1000                     ; 253     if (NewState != DISABLE)
1002  01eb 7b02          	ld	a,(OFST+2,sp)
1003  01ed 270a          	jreq	L333
1004                     ; 255       ADC1->TDRL &= (uint8_t)0x0;
1006  01ef 725f5407      	clr	21511
1007                     ; 256       ADC1->TDRH &= (uint8_t)0x0;
1009  01f3 725f5406      	clr	21510
1011  01f7 2057          	jra	L733
1012  01f9               L333:
1013                     ; 260       ADC1->TDRL |= (uint8_t)0xFF;
1015  01f9 c65407        	ld	a,21511
1016  01fc aaff          	or	a,#255
1017  01fe c75407        	ld	21511,a
1018                     ; 261       ADC1->TDRH |= (uint8_t)0xFF;
1020  0201 c65406        	ld	a,21510
1021  0204 aaff          	or	a,#255
1022  0206 2045          	jp	LC002
1023  0208               L133:
1024                     ; 264   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1026  0208 a108          	cp	a,#8
1027  020a 0d02          	tnz	(OFST+2,sp)
1028  020c 2420          	jruge	L143
1029                     ; 266     if (NewState != DISABLE)
1031  020e 2711          	jreq	L343
1032                     ; 268       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1034  0210 ad40          	call	LC004
1035  0212 2704          	jreq	L661
1036  0214               L071:
1037  0214 48            	sll	a
1038  0215 5a            	decw	x
1039  0216 26fc          	jrne	L071
1040  0218               L661:
1041  0218 43            	cpl	a
1042  0219 c45407        	and	a,21511
1043  021c               LC003:
1044  021c c75407        	ld	21511,a
1046  021f 202f          	jra	L733
1047  0221               L343:
1048                     ; 272       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1050  0221 ad2f          	call	LC004
1051  0223 2704          	jreq	L271
1052  0225               L471:
1053  0225 48            	sll	a
1054  0226 5a            	decw	x
1055  0227 26fc          	jrne	L471
1056  0229               L271:
1057  0229 ca5407        	or	a,21511
1058  022c 20ee          	jp	LC003
1059  022e               L143:
1060                     ; 277     if (NewState != DISABLE)
1062  022e 2710          	jreq	L153
1063                     ; 279       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1065  0230 a008          	sub	a,#8
1066  0232 ad1e          	call	LC004
1067  0234 2704          	jreq	L671
1068  0236               L002:
1069  0236 48            	sll	a
1070  0237 5a            	decw	x
1071  0238 26fc          	jrne	L002
1072  023a               L671:
1073  023a 43            	cpl	a
1074  023b c45406        	and	a,21510
1076  023e 200d          	jp	LC002
1077  0240               L153:
1078                     ; 283       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1080  0240 a008          	sub	a,#8
1081  0242 ad0e          	call	LC004
1082  0244 2704          	jreq	L202
1083  0246               L402:
1084  0246 48            	sll	a
1085  0247 5a            	decw	x
1086  0248 26fc          	jrne	L402
1087  024a               L202:
1088  024a ca5406        	or	a,21510
1089  024d               LC002:
1090  024d c75406        	ld	21510,a
1091  0250               L733:
1092                     ; 286 }
1095  0250 85            	popw	x
1096  0251 81            	ret	
1097  0252               LC004:
1098  0252 5f            	clrw	x
1099  0253 97            	ld	xl,a
1100  0254 a601          	ld	a,#1
1101  0256 5d            	tnzw	x
1102  0257 81            	ret	
1103  0258               LC005:
1104  0258 89            	pushw	x
1105  0259 5f            	clrw	x
1106  025a 89            	pushw	x
1107  025b ae0000        	ldw	x,#L542
1108  025e cd0000        	call	_assert_failed
1110  0261 5b04          	addw	sp,#4
1111  0263 81            	ret	
1169                     ; 301 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1169                     ; 302 {
1170                     	switch	.text
1171  0264               _ADC1_ConversionConfig:
1173  0264 89            	pushw	x
1174       00000000      OFST:	set	0
1177                     ; 304   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1179  0265 9e            	ld	a,xh
1180  0266 4d            	tnz	a
1181  0267 2709          	jreq	L412
1182  0269 9e            	ld	a,xh
1183  026a 4a            	dec	a
1184  026b 2705          	jreq	L412
1185  026d ae0130        	ldw	x,#304
1186  0270 ad6b          	call	LC006
1187  0272               L412:
1188                     ; 305   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1190  0272 7b02          	ld	a,(OFST+2,sp)
1191  0274 272d          	jreq	L422
1192  0276 a101          	cp	a,#1
1193  0278 2729          	jreq	L422
1194  027a a102          	cp	a,#2
1195  027c 2725          	jreq	L422
1196  027e a103          	cp	a,#3
1197  0280 2721          	jreq	L422
1198  0282 a104          	cp	a,#4
1199  0284 271d          	jreq	L422
1200  0286 a105          	cp	a,#5
1201  0288 2719          	jreq	L422
1202  028a a106          	cp	a,#6
1203  028c 2715          	jreq	L422
1204  028e a107          	cp	a,#7
1205  0290 2711          	jreq	L422
1206  0292 a108          	cp	a,#8
1207  0294 270d          	jreq	L422
1208  0296 a10c          	cp	a,#12
1209  0298 2709          	jreq	L422
1210  029a a109          	cp	a,#9
1211  029c 2705          	jreq	L422
1212  029e ae0131        	ldw	x,#305
1213  02a1 ad3a          	call	LC006
1214  02a3               L422:
1215                     ; 306   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1217  02a3 7b05          	ld	a,(OFST+5,sp)
1218  02a5 2709          	jreq	L432
1219  02a7 a108          	cp	a,#8
1220  02a9 2705          	jreq	L432
1221  02ab ae0132        	ldw	x,#306
1222  02ae ad2d          	call	LC006
1223  02b0               L432:
1224                     ; 309   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1226  02b0 72175402      	bres	21506,#3
1227                     ; 311   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1229  02b4 c65402        	ld	a,21506
1230  02b7 1a05          	or	a,(OFST+5,sp)
1231  02b9 c75402        	ld	21506,a
1232                     ; 313   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1234  02bc 7b01          	ld	a,(OFST+1,sp)
1235  02be 4a            	dec	a
1236  02bf 2606          	jrne	L304
1237                     ; 316     ADC1->CR1 |= ADC1_CR1_CONT;
1239  02c1 72125401      	bset	21505,#1
1241  02c5 2004          	jra	L504
1242  02c7               L304:
1243                     ; 321     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1245  02c7 72135401      	bres	21505,#1
1246  02cb               L504:
1247                     ; 325   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1249  02cb c65400        	ld	a,21504
1250  02ce a4f0          	and	a,#240
1251  02d0 c75400        	ld	21504,a
1252                     ; 327   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1254  02d3 c65400        	ld	a,21504
1255  02d6 1a02          	or	a,(OFST+2,sp)
1256  02d8 c75400        	ld	21504,a
1257                     ; 328 }
1260  02db 85            	popw	x
1261  02dc 81            	ret	
1262  02dd               LC006:
1263  02dd 89            	pushw	x
1264  02de 5f            	clrw	x
1265  02df 89            	pushw	x
1266  02e0 ae0000        	ldw	x,#L542
1267  02e3 cd0000        	call	_assert_failed
1269  02e6 5b04          	addw	sp,#4
1270  02e8 81            	ret	
1317                     ; 342 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1317                     ; 343 {
1318                     	switch	.text
1319  02e9               _ADC1_ExternalTriggerConfig:
1321  02e9 89            	pushw	x
1322       00000000      OFST:	set	0
1325                     ; 345   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1327  02ea 9e            	ld	a,xh
1328  02eb 4d            	tnz	a
1329  02ec 270a          	jreq	L642
1330  02ee 9e            	ld	a,xh
1331  02ef a110          	cp	a,#16
1332  02f1 2705          	jreq	L642
1333  02f3 ae0159        	ldw	x,#345
1334  02f6 ad2c          	call	LC007
1335  02f8               L642:
1336                     ; 346   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1338  02f8 7b02          	ld	a,(OFST+2,sp)
1339  02fa 2708          	jreq	L652
1340  02fc 4a            	dec	a
1341  02fd 2705          	jreq	L652
1342  02ff ae015a        	ldw	x,#346
1343  0302 ad20          	call	LC007
1344  0304               L652:
1345                     ; 349   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1347  0304 c65402        	ld	a,21506
1348  0307 a4cf          	and	a,#207
1349  0309 c75402        	ld	21506,a
1350                     ; 351   if (NewState != DISABLE)
1352  030c 7b02          	ld	a,(OFST+2,sp)
1353  030e 2706          	jreq	L134
1354                     ; 354     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1356  0310 721c5402      	bset	21506,#6
1358  0314 2004          	jra	L334
1359  0316               L134:
1360                     ; 359     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1362  0316 721d5402      	bres	21506,#6
1363  031a               L334:
1364                     ; 363   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1366  031a c65402        	ld	a,21506
1367  031d 1a01          	or	a,(OFST+1,sp)
1368  031f c75402        	ld	21506,a
1369                     ; 364 }
1372  0322 85            	popw	x
1373  0323 81            	ret	
1374  0324               LC007:
1375  0324 89            	pushw	x
1376  0325 5f            	clrw	x
1377  0326 89            	pushw	x
1378  0327 ae0000        	ldw	x,#L542
1379  032a cd0000        	call	_assert_failed
1381  032d 5b04          	addw	sp,#4
1382  032f 81            	ret	
1406                     ; 376 void ADC1_StartConversion(void)
1406                     ; 377 {
1407                     	switch	.text
1408  0330               _ADC1_StartConversion:
1412                     ; 378   ADC1->CR1 |= ADC1_CR1_ADON;
1414  0330 72105401      	bset	21505,#0
1415                     ; 379 }
1418  0334 81            	ret	
1462                     ; 388 uint16_t ADC1_GetConversionValue(void)
1462                     ; 389 {
1463                     	switch	.text
1464  0335               _ADC1_GetConversionValue:
1466  0335 5205          	subw	sp,#5
1467       00000005      OFST:	set	5
1470                     ; 390   uint16_t temph = 0;
1472                     ; 391   uint8_t templ = 0;
1474                     ; 393   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1476  0337 720754020e    	btjf	21506,#3,L764
1477                     ; 396     templ = ADC1->DRL;
1479  033c c65405        	ld	a,21509
1480  033f 6b03          	ld	(OFST-2,sp),a
1482                     ; 398     temph = ADC1->DRH;
1484  0341 c65404        	ld	a,21508
1485  0344 97            	ld	xl,a
1487                     ; 400     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1489  0345 7b03          	ld	a,(OFST-2,sp)
1490  0347 02            	rlwa	x,a
1493  0348 201a          	jra	L174
1494  034a               L764:
1495                     ; 405     temph = ADC1->DRH;
1497  034a c65404        	ld	a,21508
1498  034d 97            	ld	xl,a
1500                     ; 407     templ = ADC1->DRL;
1502  034e c65405        	ld	a,21509
1503  0351 6b03          	ld	(OFST-2,sp),a
1505                     ; 409     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1507  0353 4f            	clr	a
1508  0354 02            	rlwa	x,a
1509  0355 1f01          	ldw	(OFST-4,sp),x
1511  0357 7b03          	ld	a,(OFST-2,sp)
1512  0359 97            	ld	xl,a
1513  035a a640          	ld	a,#64
1514  035c 42            	mul	x,a
1515  035d 01            	rrwa	x,a
1516  035e 1a02          	or	a,(OFST-3,sp)
1517  0360 01            	rrwa	x,a
1518  0361 1a01          	or	a,(OFST-4,sp)
1519  0363 01            	rrwa	x,a
1521  0364               L174:
1522                     ; 412   return ((uint16_t)temph);
1526  0364 5b05          	addw	sp,#5
1527  0366 81            	ret	
1684                     ; 697 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
1684                     ; 698 {
1685                     	switch	.text
1686  0367               _ADC1_ClearITPendingBit:
1688  0367 89            	pushw	x
1689  0368 88            	push	a
1690       00000001      OFST:	set	1
1693                     ; 699   uint8_t temp = 0;
1695                     ; 702   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
1697  0369 a30080        	cpw	x,#128
1698  036c 274a          	jreq	L472
1699  036e a30140        	cpw	x,#320
1700  0371 2745          	jreq	L472
1701  0373 a30110        	cpw	x,#272
1702  0376 2740          	jreq	L472
1703  0378 a30111        	cpw	x,#273
1704  037b 273b          	jreq	L472
1705  037d a30112        	cpw	x,#274
1706  0380 2736          	jreq	L472
1707  0382 a30113        	cpw	x,#275
1708  0385 2731          	jreq	L472
1709  0387 a30114        	cpw	x,#276
1710  038a 272c          	jreq	L472
1711  038c a30115        	cpw	x,#277
1712  038f 2727          	jreq	L472
1713  0391 a30116        	cpw	x,#278
1714  0394 2722          	jreq	L472
1715  0396 a30117        	cpw	x,#279
1716  0399 271d          	jreq	L472
1717  039b a30118        	cpw	x,#280
1718  039e 2718          	jreq	L472
1719  03a0 a3011c        	cpw	x,#284
1720  03a3 2713          	jreq	L472
1721  03a5 a30119        	cpw	x,#281
1722  03a8 270e          	jreq	L472
1723  03aa ae02be        	ldw	x,#702
1724  03ad 89            	pushw	x
1725  03ae 5f            	clrw	x
1726  03af 89            	pushw	x
1727  03b0 ae0000        	ldw	x,#L542
1728  03b3 cd0000        	call	_assert_failed
1730  03b6 5b04          	addw	sp,#4
1731  03b8               L472:
1732                     ; 704   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
1734  03b8 7b03          	ld	a,(OFST+2,sp)
1735  03ba a4f0          	and	a,#240
1736  03bc 5f            	clrw	x
1737  03bd 02            	rlwa	x,a
1738  03be a30010        	cpw	x,#16
1739  03c1 2634          	jrne	L755
1740                     ; 707     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
1742  03c3 7b03          	ld	a,(OFST+2,sp)
1743  03c5 a40f          	and	a,#15
1744  03c7 6b01          	ld	(OFST+0,sp),a
1746                     ; 708     if (temp < 8)
1748  03c9 a108          	cp	a,#8
1749  03cb 2414          	jruge	L165
1750                     ; 710       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
1752  03cd 5f            	clrw	x
1753  03ce 97            	ld	xl,a
1754  03cf a601          	ld	a,#1
1755  03d1 5d            	tnzw	x
1756  03d2 2704          	jreq	L003
1757  03d4               L203:
1758  03d4 48            	sll	a
1759  03d5 5a            	decw	x
1760  03d6 26fc          	jrne	L203
1761  03d8               L003:
1762  03d8 43            	cpl	a
1763  03d9 c4540d        	and	a,21517
1764  03dc c7540d        	ld	21517,a
1766  03df 201f          	jra	L565
1767  03e1               L165:
1768                     ; 714       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
1770  03e1 a008          	sub	a,#8
1771  03e3 5f            	clrw	x
1772  03e4 97            	ld	xl,a
1773  03e5 a601          	ld	a,#1
1774  03e7 5d            	tnzw	x
1775  03e8 2704          	jreq	L403
1776  03ea               L603:
1777  03ea 48            	sll	a
1778  03eb 5a            	decw	x
1779  03ec 26fc          	jrne	L603
1780  03ee               L403:
1781  03ee 43            	cpl	a
1782  03ef c4540c        	and	a,21516
1783  03f2 c7540c        	ld	21516,a
1784  03f5 2009          	jra	L565
1785  03f7               L755:
1786                     ; 719     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
1788  03f7 7b03          	ld	a,(OFST+2,sp)
1789  03f9 43            	cpl	a
1790  03fa c45400        	and	a,21504
1791  03fd c75400        	ld	21504,a
1792  0400               L565:
1793                     ; 721 }
1796  0400 5b03          	addw	sp,#3
1797  0402 81            	ret	
1810                     	xdef	_ADC1_ClearITPendingBit
1811                     	xdef	_ADC1_GetConversionValue
1812                     	xdef	_ADC1_StartConversion
1813                     	xdef	_ADC1_ExternalTriggerConfig
1814                     	xdef	_ADC1_ConversionConfig
1815                     	xdef	_ADC1_SchmittTriggerConfig
1816                     	xdef	_ADC1_PrescalerConfig
1817                     	xdef	_ADC1_Cmd
1818                     	xdef	_ADC1_Init
1819                     	xdef	_ADC1_DeInit
1820                     	xref	_assert_failed
1821                     .const:	section	.text
1822  0000               L542:
1823  0000 73746d38735f  	dc.b	"stm8s_adc1_sub.c",0
1843                     	end
