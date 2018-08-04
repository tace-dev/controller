   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 94 void IRTIM_DeInit(void)
  50                     ; 95 {
  52                     .text:	section	.text,new
  53  0000               _IRTIM_DeInit:
  57                     ; 96   IRTIM->CR = IRTIM_CR_RESET_VALUE;
  59  0000 725f52ff      	clr	21247
  60                     ; 97 }
  63  0004 81            	ret	
 118                     ; 105 void IRTIM_Cmd(FunctionalState NewState)
 118                     ; 106 {
 119                     .text:	section	.text,new
 120  0000               _IRTIM_Cmd:
 124                     ; 108   assert_param(IS_FUNCTIONAL_STATE(NewState));
 126                     ; 111   if (NewState ==   DISABLE)
 128  0000 4d            	tnz	a
 129  0001 2605          	jrne	L74
 130                     ; 113     IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN) ;
 132  0003 721152ff      	bres	21247,#0
 135  0007 81            	ret	
 136  0008               L74:
 137                     ; 117     IRTIM->CR |= IRTIM_CR_EN ;
 139  0008 721052ff      	bset	21247,#0
 140                     ; 119 }
 143  000c 81            	ret	
 179                     ; 127 void IRTIM_HighSinkODCmd(FunctionalState NewState)
 179                     ; 128 {
 180                     .text:	section	.text,new
 181  0000               _IRTIM_HighSinkODCmd:
 185                     ; 130   assert_param(IS_FUNCTIONAL_STATE(NewState));
 187                     ; 133   if (NewState == DISABLE)
 189  0000 4d            	tnz	a
 190  0001 2605          	jrne	L17
 191                     ; 135     IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN) ;
 193  0003 721352ff      	bres	21247,#1
 196  0007 81            	ret	
 197  0008               L17:
 198                     ; 139     IRTIM->CR |= IRTIM_CR_HSEN ;
 200  0008 721252ff      	bset	21247,#1
 201                     ; 141 }
 204  000c 81            	ret	
 228                     ; 165 FunctionalState IRTIM_GetStatus(void)
 228                     ; 166 {
 229                     .text:	section	.text,new
 230  0000               _IRTIM_GetStatus:
 234                     ; 167   return ((FunctionalState) (IRTIM->CR & IRTIM_CR_EN));
 236  0000 c652ff        	ld	a,21247
 237  0003 a401          	and	a,#1
 240  0005 81            	ret	
 265                     ; 175 FunctionalState IRTIM_GetHighSinkODStatus(void)
 265                     ; 176 {
 266                     .text:	section	.text,new
 267  0000               _IRTIM_GetHighSinkODStatus:
 271                     ; 177   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
 273  0000 c652ff        	ld	a,21247
 274  0003 a402          	and	a,#2
 277  0005 81            	ret	
 290                     	xdef	_IRTIM_GetHighSinkODStatus
 291                     	xdef	_IRTIM_GetStatus
 292                     	xdef	_IRTIM_HighSinkODCmd
 293                     	xdef	_IRTIM_Cmd
 294                     	xdef	_IRTIM_DeInit
 313                     	end
