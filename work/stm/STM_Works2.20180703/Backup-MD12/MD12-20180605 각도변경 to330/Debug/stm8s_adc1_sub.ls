   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  49                     ; 52 void ADC1_DeInit(void)
  49                     ; 53 {
  51                     .text:	section	.text,new
  52  0000               _ADC1_DeInit:
  56                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  58  0000 725f5400      	clr	21504
  59                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  61  0004 725f5401      	clr	21505
  62                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  64  0008 725f5402      	clr	21506
  65                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  67  000c 725f5403      	clr	21507
  68                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  70  0010 725f5406      	clr	21510
  71                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  73  0014 725f5407      	clr	21511
  74                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  76  0018 35ff5408      	mov	21512,#255
  77                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  79  001c 35035409      	mov	21513,#3
  80                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  82  0020 725f540a      	clr	21514
  83                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  85  0024 725f540b      	clr	21515
  86                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  88  0028 725f540e      	clr	21518
  89                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  91  002c 725f540f      	clr	21519
  92                     ; 66 }
  95  0030 81            	ret	
 547                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 547                     ; 89 {
 548                     .text:	section	.text,new
 549  0000               _ADC1_Init:
 551  0000 89            	pushw	x
 552       00000000      OFST:	set	0
 555                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 557  0001 9e            	ld	a,xh
 558  0002 4d            	tnz	a
 559  0003 270a          	jreq	L41
 560  0005 9e            	ld	a,xh
 561  0006 4a            	dec	a
 562  0007 2706          	jreq	L41
 563  0009 ae005b        	ldw	x,#91
 564  000c cd00f9        	call	LC001
 565  000f               L41:
 566                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 568  000f 7b02          	ld	a,(OFST+2,sp)
 569  0011 272e          	jreq	L42
 570  0013 a101          	cp	a,#1
 571  0015 272a          	jreq	L42
 572  0017 a102          	cp	a,#2
 573  0019 2726          	jreq	L42
 574  001b a103          	cp	a,#3
 575  001d 2722          	jreq	L42
 576  001f a104          	cp	a,#4
 577  0021 271e          	jreq	L42
 578  0023 a105          	cp	a,#5
 579  0025 271a          	jreq	L42
 580  0027 a106          	cp	a,#6
 581  0029 2716          	jreq	L42
 582  002b a107          	cp	a,#7
 583  002d 2712          	jreq	L42
 584  002f a108          	cp	a,#8
 585  0031 270e          	jreq	L42
 586  0033 a10c          	cp	a,#12
 587  0035 270a          	jreq	L42
 588  0037 a109          	cp	a,#9
 589  0039 2706          	jreq	L42
 590  003b ae005c        	ldw	x,#92
 591  003e cd00f9        	call	LC001
 592  0041               L42:
 593                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 595  0041 7b05          	ld	a,(OFST+5,sp)
 596  0043 2722          	jreq	L43
 597  0045 a110          	cp	a,#16
 598  0047 271e          	jreq	L43
 599  0049 a120          	cp	a,#32
 600  004b 271a          	jreq	L43
 601  004d a130          	cp	a,#48
 602  004f 2716          	jreq	L43
 603  0051 a140          	cp	a,#64
 604  0053 2712          	jreq	L43
 605  0055 a150          	cp	a,#80
 606  0057 270e          	jreq	L43
 607  0059 a160          	cp	a,#96
 608  005b 270a          	jreq	L43
 609  005d a170          	cp	a,#112
 610  005f 2706          	jreq	L43
 611  0061 ae005d        	ldw	x,#93
 612  0064 cd00f9        	call	LC001
 613  0067               L43:
 614                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 616  0067 7b06          	ld	a,(OFST+6,sp)
 617  0069 270a          	jreq	L44
 618  006b a110          	cp	a,#16
 619  006d 2706          	jreq	L44
 620  006f ae005e        	ldw	x,#94
 621  0072 cd00f9        	call	LC001
 622  0075               L44:
 623                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 625  0075 7b07          	ld	a,(OFST+7,sp)
 626  0077 2708          	jreq	L45
 627  0079 4a            	dec	a
 628  007a 2705          	jreq	L45
 629  007c ae005f        	ldw	x,#95
 630  007f ad78          	call	LC001
 631  0081               L45:
 632                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 634  0081 7b08          	ld	a,(OFST+8,sp)
 635  0083 2709          	jreq	L46
 636  0085 a108          	cp	a,#8
 637  0087 2705          	jreq	L46
 638  0089 ae0060        	ldw	x,#96
 639  008c ad6b          	call	LC001
 640  008e               L46:
 641                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 643  008e 7b09          	ld	a,(OFST+9,sp)
 644  0090 2731          	jreq	L47
 645  0092 a101          	cp	a,#1
 646  0094 272d          	jreq	L47
 647  0096 a102          	cp	a,#2
 648  0098 2729          	jreq	L47
 649  009a a103          	cp	a,#3
 650  009c 2725          	jreq	L47
 651  009e a104          	cp	a,#4
 652  00a0 2721          	jreq	L47
 653  00a2 a105          	cp	a,#5
 654  00a4 271d          	jreq	L47
 655  00a6 a106          	cp	a,#6
 656  00a8 2719          	jreq	L47
 657  00aa a107          	cp	a,#7
 658  00ac 2715          	jreq	L47
 659  00ae a108          	cp	a,#8
 660  00b0 2711          	jreq	L47
 661  00b2 a10c          	cp	a,#12
 662  00b4 270d          	jreq	L47
 663  00b6 a1ff          	cp	a,#255
 664  00b8 2709          	jreq	L47
 665  00ba a109          	cp	a,#9
 666  00bc 2705          	jreq	L47
 667  00be ae0061        	ldw	x,#97
 668  00c1 ad36          	call	LC001
 669  00c3               L47:
 670                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 672  00c3 7b0a          	ld	a,(OFST+10,sp)
 673  00c5 2708          	jreq	L401
 674  00c7 4a            	dec	a
 675  00c8 2705          	jreq	L401
 676  00ca ae0062        	ldw	x,#98
 677  00cd ad2a          	call	LC001
 678  00cf               L401:
 679                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 681  00cf 7b08          	ld	a,(OFST+8,sp)
 682  00d1 88            	push	a
 683  00d2 7b03          	ld	a,(OFST+3,sp)
 684  00d4 97            	ld	xl,a
 685  00d5 7b02          	ld	a,(OFST+2,sp)
 686  00d7 95            	ld	xh,a
 687  00d8 cd0000        	call	_ADC1_ConversionConfig
 689  00db 84            	pop	a
 690                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 692  00dc 7b05          	ld	a,(OFST+5,sp)
 693  00de cd0000        	call	_ADC1_PrescalerConfig
 695                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 697  00e1 7b07          	ld	a,(OFST+7,sp)
 698  00e3 97            	ld	xl,a
 699  00e4 7b06          	ld	a,(OFST+6,sp)
 700  00e6 95            	ld	xh,a
 701  00e7 cd0000        	call	_ADC1_ExternalTriggerConfig
 703                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 705  00ea 7b0a          	ld	a,(OFST+10,sp)
 706  00ec 97            	ld	xl,a
 707  00ed 7b09          	ld	a,(OFST+9,sp)
 708  00ef 95            	ld	xh,a
 709  00f0 cd0000        	call	_ADC1_SchmittTriggerConfig
 711                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 713  00f3 72105401      	bset	21505,#0
 714                     ; 119 }
 717  00f7 85            	popw	x
 718  00f8 81            	ret	
 719  00f9               LC001:
 720  00f9 89            	pushw	x
 721  00fa 5f            	clrw	x
 722  00fb 89            	pushw	x
 723  00fc ae0000        	ldw	x,#L542
 724  00ff cd0000        	call	_assert_failed
 726  0102 5b04          	addw	sp,#4
 727  0104 81            	ret	
 763                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 763                     ; 127 {
 764                     .text:	section	.text,new
 765  0000               _ADC1_Cmd:
 767  0000 88            	push	a
 768       00000000      OFST:	set	0
 771                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 773  0001 4d            	tnz	a
 774  0002 2711          	jreq	L621
 775  0004 4a            	dec	a
 776  0005 270e          	jreq	L621
 777  0007 ae0081        	ldw	x,#129
 778  000a 89            	pushw	x
 779  000b 5f            	clrw	x
 780  000c 89            	pushw	x
 781  000d ae0000        	ldw	x,#L542
 782  0010 cd0000        	call	_assert_failed
 784  0013 5b04          	addw	sp,#4
 785  0015               L621:
 786                     ; 131   if (NewState != DISABLE)
 788  0015 7b01          	ld	a,(OFST+1,sp)
 789  0017 2706          	jreq	L562
 790                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 792  0019 72105401      	bset	21505,#0
 794  001d 2004          	jra	L762
 795  001f               L562:
 796                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 798  001f 72115401      	bres	21505,#0
 799  0023               L762:
 800                     ; 139 }
 803  0023 84            	pop	a
 804  0024 81            	ret	
 841                     ; 224 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
 841                     ; 225 {
 842                     .text:	section	.text,new
 843  0000               _ADC1_PrescalerConfig:
 845  0000 88            	push	a
 846       00000000      OFST:	set	0
 849                     ; 227   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
 851  0001 4d            	tnz	a
 852  0002 272a          	jreq	L041
 853  0004 a110          	cp	a,#16
 854  0006 2726          	jreq	L041
 855  0008 a120          	cp	a,#32
 856  000a 2722          	jreq	L041
 857  000c a130          	cp	a,#48
 858  000e 271e          	jreq	L041
 859  0010 a140          	cp	a,#64
 860  0012 271a          	jreq	L041
 861  0014 a150          	cp	a,#80
 862  0016 2716          	jreq	L041
 863  0018 a160          	cp	a,#96
 864  001a 2712          	jreq	L041
 865  001c a170          	cp	a,#112
 866  001e 270e          	jreq	L041
 867  0020 ae00e3        	ldw	x,#227
 868  0023 89            	pushw	x
 869  0024 5f            	clrw	x
 870  0025 89            	pushw	x
 871  0026 ae0000        	ldw	x,#L542
 872  0029 cd0000        	call	_assert_failed
 874  002c 5b04          	addw	sp,#4
 875  002e               L041:
 876                     ; 230   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
 878  002e c65401        	ld	a,21505
 879  0031 a48f          	and	a,#143
 880  0033 c75401        	ld	21505,a
 881                     ; 232   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
 883  0036 c65401        	ld	a,21505
 884  0039 1a01          	or	a,(OFST+1,sp)
 885  003b c75401        	ld	21505,a
 886                     ; 233 }
 889  003e 84            	pop	a
 890  003f 81            	ret	
 938                     ; 245 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
 938                     ; 246 {
 939                     .text:	section	.text,new
 940  0000               _ADC1_SchmittTriggerConfig:
 942  0000 89            	pushw	x
 943       00000000      OFST:	set	0
 946                     ; 248   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 948  0001 9e            	ld	a,xh
 949  0002 4d            	tnz	a
 950  0003 273b          	jreq	L251
 951  0005 9e            	ld	a,xh
 952  0006 4a            	dec	a
 953  0007 2737          	jreq	L251
 954  0009 9e            	ld	a,xh
 955  000a a102          	cp	a,#2
 956  000c 2732          	jreq	L251
 957  000e 9e            	ld	a,xh
 958  000f a103          	cp	a,#3
 959  0011 272d          	jreq	L251
 960  0013 9e            	ld	a,xh
 961  0014 a104          	cp	a,#4
 962  0016 2728          	jreq	L251
 963  0018 9e            	ld	a,xh
 964  0019 a105          	cp	a,#5
 965  001b 2723          	jreq	L251
 966  001d 9e            	ld	a,xh
 967  001e a106          	cp	a,#6
 968  0020 271e          	jreq	L251
 969  0022 9e            	ld	a,xh
 970  0023 a107          	cp	a,#7
 971  0025 2719          	jreq	L251
 972  0027 9e            	ld	a,xh
 973  0028 a108          	cp	a,#8
 974  002a 2714          	jreq	L251
 975  002c 9e            	ld	a,xh
 976  002d a10c          	cp	a,#12
 977  002f 270f          	jreq	L251
 978  0031 9e            	ld	a,xh
 979  0032 4c            	inc	a
 980  0033 270b          	jreq	L251
 981  0035 9e            	ld	a,xh
 982  0036 a109          	cp	a,#9
 983  0038 2706          	jreq	L251
 984  003a ae00f8        	ldw	x,#248
 985  003d cd00bf        	call	LC005
 986  0040               L251:
 987                     ; 249   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 989  0040 7b02          	ld	a,(OFST+2,sp)
 990  0042 2708          	jreq	L261
 991  0044 4a            	dec	a
 992  0045 2705          	jreq	L261
 993  0047 ae00f9        	ldw	x,#249
 994  004a ad73          	call	LC005
 995  004c               L261:
 996                     ; 251   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
 998  004c 7b01          	ld	a,(OFST+1,sp)
 999  004e a1ff          	cp	a,#255
1000  0050 261d          	jrne	L133
1001                     ; 253     if (NewState != DISABLE)
1003  0052 7b02          	ld	a,(OFST+2,sp)
1004  0054 270a          	jreq	L333
1005                     ; 255       ADC1->TDRL &= (uint8_t)0x0;
1007  0056 725f5407      	clr	21511
1008                     ; 256       ADC1->TDRH &= (uint8_t)0x0;
1010  005a 725f5406      	clr	21510
1012  005e 2057          	jra	L733
1013  0060               L333:
1014                     ; 260       ADC1->TDRL |= (uint8_t)0xFF;
1016  0060 c65407        	ld	a,21511
1017  0063 aaff          	or	a,#255
1018  0065 c75407        	ld	21511,a
1019                     ; 261       ADC1->TDRH |= (uint8_t)0xFF;
1021  0068 c65406        	ld	a,21510
1022  006b aaff          	or	a,#255
1023  006d 2045          	jp	LC002
1024  006f               L133:
1025                     ; 264   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1027  006f a108          	cp	a,#8
1028  0071 0d02          	tnz	(OFST+2,sp)
1029  0073 2420          	jruge	L143
1030                     ; 266     if (NewState != DISABLE)
1032  0075 2711          	jreq	L343
1033                     ; 268       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1035  0077 ad40          	call	LC004
1036  0079 2704          	jreq	L661
1037  007b               L071:
1038  007b 48            	sll	a
1039  007c 5a            	decw	x
1040  007d 26fc          	jrne	L071
1041  007f               L661:
1042  007f 43            	cpl	a
1043  0080 c45407        	and	a,21511
1044  0083               LC003:
1045  0083 c75407        	ld	21511,a
1047  0086 202f          	jra	L733
1048  0088               L343:
1049                     ; 272       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1051  0088 ad2f          	call	LC004
1052  008a 2704          	jreq	L271
1053  008c               L471:
1054  008c 48            	sll	a
1055  008d 5a            	decw	x
1056  008e 26fc          	jrne	L471
1057  0090               L271:
1058  0090 ca5407        	or	a,21511
1059  0093 20ee          	jp	LC003
1060  0095               L143:
1061                     ; 277     if (NewState != DISABLE)
1063  0095 2710          	jreq	L153
1064                     ; 279       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1066  0097 a008          	sub	a,#8
1067  0099 ad1e          	call	LC004
1068  009b 2704          	jreq	L671
1069  009d               L002:
1070  009d 48            	sll	a
1071  009e 5a            	decw	x
1072  009f 26fc          	jrne	L002
1073  00a1               L671:
1074  00a1 43            	cpl	a
1075  00a2 c45406        	and	a,21510
1077  00a5 200d          	jp	LC002
1078  00a7               L153:
1079                     ; 283       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1081  00a7 a008          	sub	a,#8
1082  00a9 ad0e          	call	LC004
1083  00ab 2704          	jreq	L202
1084  00ad               L402:
1085  00ad 48            	sll	a
1086  00ae 5a            	decw	x
1087  00af 26fc          	jrne	L402
1088  00b1               L202:
1089  00b1 ca5406        	or	a,21510
1090  00b4               LC002:
1091  00b4 c75406        	ld	21510,a
1092  00b7               L733:
1093                     ; 286 }
1096  00b7 85            	popw	x
1097  00b8 81            	ret	
1098  00b9               LC004:
1099  00b9 5f            	clrw	x
1100  00ba 97            	ld	xl,a
1101  00bb a601          	ld	a,#1
1102  00bd 5d            	tnzw	x
1103  00be 81            	ret	
1104  00bf               LC005:
1105  00bf 89            	pushw	x
1106  00c0 5f            	clrw	x
1107  00c1 89            	pushw	x
1108  00c2 ae0000        	ldw	x,#L542
1109  00c5 cd0000        	call	_assert_failed
1111  00c8 5b04          	addw	sp,#4
1112  00ca 81            	ret	
1170                     ; 301 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1170                     ; 302 {
1171                     .text:	section	.text,new
1172  0000               _ADC1_ConversionConfig:
1174  0000 89            	pushw	x
1175       00000000      OFST:	set	0
1178                     ; 304   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1180  0001 9e            	ld	a,xh
1181  0002 4d            	tnz	a
1182  0003 2709          	jreq	L412
1183  0005 9e            	ld	a,xh
1184  0006 4a            	dec	a
1185  0007 2705          	jreq	L412
1186  0009 ae0130        	ldw	x,#304
1187  000c ad6b          	call	LC006
1188  000e               L412:
1189                     ; 305   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1191  000e 7b02          	ld	a,(OFST+2,sp)
1192  0010 272d          	jreq	L422
1193  0012 a101          	cp	a,#1
1194  0014 2729          	jreq	L422
1195  0016 a102          	cp	a,#2
1196  0018 2725          	jreq	L422
1197  001a a103          	cp	a,#3
1198  001c 2721          	jreq	L422
1199  001e a104          	cp	a,#4
1200  0020 271d          	jreq	L422
1201  0022 a105          	cp	a,#5
1202  0024 2719          	jreq	L422
1203  0026 a106          	cp	a,#6
1204  0028 2715          	jreq	L422
1205  002a a107          	cp	a,#7
1206  002c 2711          	jreq	L422
1207  002e a108          	cp	a,#8
1208  0030 270d          	jreq	L422
1209  0032 a10c          	cp	a,#12
1210  0034 2709          	jreq	L422
1211  0036 a109          	cp	a,#9
1212  0038 2705          	jreq	L422
1213  003a ae0131        	ldw	x,#305
1214  003d ad3a          	call	LC006
1215  003f               L422:
1216                     ; 306   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1218  003f 7b05          	ld	a,(OFST+5,sp)
1219  0041 2709          	jreq	L432
1220  0043 a108          	cp	a,#8
1221  0045 2705          	jreq	L432
1222  0047 ae0132        	ldw	x,#306
1223  004a ad2d          	call	LC006
1224  004c               L432:
1225                     ; 309   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1227  004c 72175402      	bres	21506,#3
1228                     ; 311   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1230  0050 c65402        	ld	a,21506
1231  0053 1a05          	or	a,(OFST+5,sp)
1232  0055 c75402        	ld	21506,a
1233                     ; 313   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1235  0058 7b01          	ld	a,(OFST+1,sp)
1236  005a 4a            	dec	a
1237  005b 2606          	jrne	L304
1238                     ; 316     ADC1->CR1 |= ADC1_CR1_CONT;
1240  005d 72125401      	bset	21505,#1
1242  0061 2004          	jra	L504
1243  0063               L304:
1244                     ; 321     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1246  0063 72135401      	bres	21505,#1
1247  0067               L504:
1248                     ; 325   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1250  0067 c65400        	ld	a,21504
1251  006a a4f0          	and	a,#240
1252  006c c75400        	ld	21504,a
1253                     ; 327   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1255  006f c65400        	ld	a,21504
1256  0072 1a02          	or	a,(OFST+2,sp)
1257  0074 c75400        	ld	21504,a
1258                     ; 328 }
1261  0077 85            	popw	x
1262  0078 81            	ret	
1263  0079               LC006:
1264  0079 89            	pushw	x
1265  007a 5f            	clrw	x
1266  007b 89            	pushw	x
1267  007c ae0000        	ldw	x,#L542
1268  007f cd0000        	call	_assert_failed
1270  0082 5b04          	addw	sp,#4
1271  0084 81            	ret	
1318                     ; 342 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1318                     ; 343 {
1319                     .text:	section	.text,new
1320  0000               _ADC1_ExternalTriggerConfig:
1322  0000 89            	pushw	x
1323       00000000      OFST:	set	0
1326                     ; 345   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1328  0001 9e            	ld	a,xh
1329  0002 4d            	tnz	a
1330  0003 270a          	jreq	L642
1331  0005 9e            	ld	a,xh
1332  0006 a110          	cp	a,#16
1333  0008 2705          	jreq	L642
1334  000a ae0159        	ldw	x,#345
1335  000d ad2c          	call	LC007
1336  000f               L642:
1337                     ; 346   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1339  000f 7b02          	ld	a,(OFST+2,sp)
1340  0011 2708          	jreq	L652
1341  0013 4a            	dec	a
1342  0014 2705          	jreq	L652
1343  0016 ae015a        	ldw	x,#346
1344  0019 ad20          	call	LC007
1345  001b               L652:
1346                     ; 349   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1348  001b c65402        	ld	a,21506
1349  001e a4cf          	and	a,#207
1350  0020 c75402        	ld	21506,a
1351                     ; 351   if (NewState != DISABLE)
1353  0023 7b02          	ld	a,(OFST+2,sp)
1354  0025 2706          	jreq	L134
1355                     ; 354     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1357  0027 721c5402      	bset	21506,#6
1359  002b 2004          	jra	L334
1360  002d               L134:
1361                     ; 359     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1363  002d 721d5402      	bres	21506,#6
1364  0031               L334:
1365                     ; 363   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1367  0031 c65402        	ld	a,21506
1368  0034 1a01          	or	a,(OFST+1,sp)
1369  0036 c75402        	ld	21506,a
1370                     ; 364 }
1373  0039 85            	popw	x
1374  003a 81            	ret	
1375  003b               LC007:
1376  003b 89            	pushw	x
1377  003c 5f            	clrw	x
1378  003d 89            	pushw	x
1379  003e ae0000        	ldw	x,#L542
1380  0041 cd0000        	call	_assert_failed
1382  0044 5b04          	addw	sp,#4
1383  0046 81            	ret	
1407                     ; 376 void ADC1_StartConversion(void)
1407                     ; 377 {
1408                     .text:	section	.text,new
1409  0000               _ADC1_StartConversion:
1413                     ; 378   ADC1->CR1 |= ADC1_CR1_ADON;
1415  0000 72105401      	bset	21505,#0
1416                     ; 379 }
1419  0004 81            	ret	
1463                     ; 388 uint16_t ADC1_GetConversionValue(void)
1463                     ; 389 {
1464                     .text:	section	.text,new
1465  0000               _ADC1_GetConversionValue:
1467  0000 5205          	subw	sp,#5
1468       00000005      OFST:	set	5
1471                     ; 390   uint16_t temph = 0;
1473                     ; 391   uint8_t templ = 0;
1475                     ; 393   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1477  0002 720754020e    	btjf	21506,#3,L764
1478                     ; 396     templ = ADC1->DRL;
1480  0007 c65405        	ld	a,21509
1481  000a 6b03          	ld	(OFST-2,sp),a
1483                     ; 398     temph = ADC1->DRH;
1485  000c c65404        	ld	a,21508
1486  000f 97            	ld	xl,a
1488                     ; 400     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1490  0010 7b03          	ld	a,(OFST-2,sp)
1491  0012 02            	rlwa	x,a
1494  0013 201a          	jra	L174
1495  0015               L764:
1496                     ; 405     temph = ADC1->DRH;
1498  0015 c65404        	ld	a,21508
1499  0018 97            	ld	xl,a
1501                     ; 407     templ = ADC1->DRL;
1503  0019 c65405        	ld	a,21509
1504  001c 6b03          	ld	(OFST-2,sp),a
1506                     ; 409     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1508  001e 4f            	clr	a
1509  001f 02            	rlwa	x,a
1510  0020 1f01          	ldw	(OFST-4,sp),x
1512  0022 7b03          	ld	a,(OFST-2,sp)
1513  0024 97            	ld	xl,a
1514  0025 a640          	ld	a,#64
1515  0027 42            	mul	x,a
1516  0028 01            	rrwa	x,a
1517  0029 1a02          	or	a,(OFST-3,sp)
1518  002b 01            	rrwa	x,a
1519  002c 1a01          	or	a,(OFST-4,sp)
1520  002e 01            	rrwa	x,a
1522  002f               L174:
1523                     ; 412   return ((uint16_t)temph);
1527  002f 5b05          	addw	sp,#5
1528  0031 81            	ret	
1685                     ; 697 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
1685                     ; 698 {
1686                     .text:	section	.text,new
1687  0000               _ADC1_ClearITPendingBit:
1689  0000 89            	pushw	x
1690  0001 88            	push	a
1691       00000001      OFST:	set	1
1694                     ; 699   uint8_t temp = 0;
1696                     ; 702   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
1698  0002 a30080        	cpw	x,#128
1699  0005 274a          	jreq	L472
1700  0007 a30140        	cpw	x,#320
1701  000a 2745          	jreq	L472
1702  000c a30110        	cpw	x,#272
1703  000f 2740          	jreq	L472
1704  0011 a30111        	cpw	x,#273
1705  0014 273b          	jreq	L472
1706  0016 a30112        	cpw	x,#274
1707  0019 2736          	jreq	L472
1708  001b a30113        	cpw	x,#275
1709  001e 2731          	jreq	L472
1710  0020 a30114        	cpw	x,#276
1711  0023 272c          	jreq	L472
1712  0025 a30115        	cpw	x,#277
1713  0028 2727          	jreq	L472
1714  002a a30116        	cpw	x,#278
1715  002d 2722          	jreq	L472
1716  002f a30117        	cpw	x,#279
1717  0032 271d          	jreq	L472
1718  0034 a30118        	cpw	x,#280
1719  0037 2718          	jreq	L472
1720  0039 a3011c        	cpw	x,#284
1721  003c 2713          	jreq	L472
1722  003e a30119        	cpw	x,#281
1723  0041 270e          	jreq	L472
1724  0043 ae02be        	ldw	x,#702
1725  0046 89            	pushw	x
1726  0047 5f            	clrw	x
1727  0048 89            	pushw	x
1728  0049 ae0000        	ldw	x,#L542
1729  004c cd0000        	call	_assert_failed
1731  004f 5b04          	addw	sp,#4
1732  0051               L472:
1733                     ; 704   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
1735  0051 7b03          	ld	a,(OFST+2,sp)
1736  0053 a4f0          	and	a,#240
1737  0055 5f            	clrw	x
1738  0056 02            	rlwa	x,a
1739  0057 a30010        	cpw	x,#16
1740  005a 2634          	jrne	L755
1741                     ; 707     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
1743  005c 7b03          	ld	a,(OFST+2,sp)
1744  005e a40f          	and	a,#15
1745  0060 6b01          	ld	(OFST+0,sp),a
1747                     ; 708     if (temp < 8)
1749  0062 a108          	cp	a,#8
1750  0064 2414          	jruge	L165
1751                     ; 710       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
1753  0066 5f            	clrw	x
1754  0067 97            	ld	xl,a
1755  0068 a601          	ld	a,#1
1756  006a 5d            	tnzw	x
1757  006b 2704          	jreq	L003
1758  006d               L203:
1759  006d 48            	sll	a
1760  006e 5a            	decw	x
1761  006f 26fc          	jrne	L203
1762  0071               L003:
1763  0071 43            	cpl	a
1764  0072 c4540d        	and	a,21517
1765  0075 c7540d        	ld	21517,a
1767  0078 201f          	jra	L565
1768  007a               L165:
1769                     ; 714       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
1771  007a a008          	sub	a,#8
1772  007c 5f            	clrw	x
1773  007d 97            	ld	xl,a
1774  007e a601          	ld	a,#1
1775  0080 5d            	tnzw	x
1776  0081 2704          	jreq	L403
1777  0083               L603:
1778  0083 48            	sll	a
1779  0084 5a            	decw	x
1780  0085 26fc          	jrne	L603
1781  0087               L403:
1782  0087 43            	cpl	a
1783  0088 c4540c        	and	a,21516
1784  008b c7540c        	ld	21516,a
1785  008e 2009          	jra	L565
1786  0090               L755:
1787                     ; 719     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
1789  0090 7b03          	ld	a,(OFST+2,sp)
1790  0092 43            	cpl	a
1791  0093 c45400        	and	a,21504
1792  0096 c75400        	ld	21504,a
1793  0099               L565:
1794                     ; 721 }
1797  0099 5b03          	addw	sp,#3
1798  009b 81            	ret	
1811                     	xdef	_ADC1_ClearITPendingBit
1812                     	xdef	_ADC1_GetConversionValue
1813                     	xdef	_ADC1_StartConversion
1814                     	xdef	_ADC1_ExternalTriggerConfig
1815                     	xdef	_ADC1_ConversionConfig
1816                     	xdef	_ADC1_SchmittTriggerConfig
1817                     	xdef	_ADC1_PrescalerConfig
1818                     	xdef	_ADC1_Cmd
1819                     	xdef	_ADC1_Init
1820                     	xdef	_ADC1_DeInit
1821                     	xref	_assert_failed
1822                     .const:	section	.text
1823  0000               L542:
1824  0000 73746d38735f  	dc.b	"stm8s_adc1_sub.c",0
1844                     	end
