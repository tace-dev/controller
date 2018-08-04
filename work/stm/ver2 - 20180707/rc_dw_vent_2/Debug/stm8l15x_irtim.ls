   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 94 void IRTIM_DeInit(void)
  50                     ; 95 {
  51                     .text:	section	.text,new
  52  0000               f_IRTIM_DeInit:
  56                     ; 96   IRTIM->CR = IRTIM_CR_RESET_VALUE;
  58  0000 725f52ff      	clr	21247
  59                     ; 97 }
  62  0004 87            	retf	
 116                     ; 105 void IRTIM_Cmd(FunctionalState NewState)
 116                     ; 106 {
 117                     .text:	section	.text,new
 118  0000               f_IRTIM_Cmd:
 122                     ; 108   assert_param(IS_FUNCTIONAL_STATE(NewState));
 124                     ; 111   if (NewState ==   DISABLE)
 126  0000 4d            	tnz	a
 127  0001 2605          	jrne	L74
 128                     ; 113     IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN) ;
 130  0003 721152ff      	bres	21247,#0
 133  0007 87            	retf	
 134  0008               L74:
 135                     ; 117     IRTIM->CR |= IRTIM_CR_EN ;
 137  0008 721052ff      	bset	21247,#0
 138                     ; 119 }
 141  000c 87            	retf	
 176                     ; 127 void IRTIM_HighSinkODCmd(FunctionalState NewState)
 176                     ; 128 {
 177                     .text:	section	.text,new
 178  0000               f_IRTIM_HighSinkODCmd:
 182                     ; 130   assert_param(IS_FUNCTIONAL_STATE(NewState));
 184                     ; 133   if (NewState == DISABLE)
 186  0000 4d            	tnz	a
 187  0001 2605          	jrne	L17
 188                     ; 135     IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN) ;
 190  0003 721352ff      	bres	21247,#1
 193  0007 87            	retf	
 194  0008               L17:
 195                     ; 139     IRTIM->CR |= IRTIM_CR_HSEN ;
 197  0008 721252ff      	bset	21247,#1
 198                     ; 141 }
 201  000c 87            	retf	
 224                     ; 165 FunctionalState IRTIM_GetStatus(void)
 224                     ; 166 {
 225                     .text:	section	.text,new
 226  0000               f_IRTIM_GetStatus:
 230                     ; 167   return ((FunctionalState) (IRTIM->CR & IRTIM_CR_EN));
 232  0000 c652ff        	ld	a,21247
 233  0003 a401          	and	a,#1
 236  0005 87            	retf	
 260                     ; 175 FunctionalState IRTIM_GetHighSinkODStatus(void)
 260                     ; 176 {
 261                     .text:	section	.text,new
 262  0000               f_IRTIM_GetHighSinkODStatus:
 266                     ; 177   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
 268  0000 c652ff        	ld	a,21247
 269  0003 a402          	and	a,#2
 272  0005 87            	retf	
 284                     	xdef	f_IRTIM_GetHighSinkODStatus
 285                     	xdef	f_IRTIM_GetStatus
 286                     	xdef	f_IRTIM_HighSinkODCmd
 287                     	xdef	f_IRTIM_Cmd
 288                     	xdef	f_IRTIM_DeInit
 307                     	end
