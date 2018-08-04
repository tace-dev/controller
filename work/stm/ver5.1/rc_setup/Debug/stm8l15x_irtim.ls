   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  47                     ; 94 void IRTIM_DeInit(void)
  47                     ; 95 {
  49                     .text:	section	.text,new
  50  0000               _IRTIM_DeInit:
  54                     ; 96   IRTIM->CR = IRTIM_CR_RESET_VALUE;
  56  0000 725f52ff      	clr	21247
  57                     ; 97 }
  60  0004 81            	ret
 115                     ; 105 void IRTIM_Cmd(FunctionalState NewState)
 115                     ; 106 {
 116                     .text:	section	.text,new
 117  0000               _IRTIM_Cmd:
 121                     ; 108   assert_param(IS_FUNCTIONAL_STATE(NewState));
 123                     ; 111   if (NewState ==   DISABLE)
 125  0000 4d            	tnz	a
 126  0001 2606          	jrne	L74
 127                     ; 113     IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN) ;
 129  0003 721152ff      	bres	21247,#0
 131  0007 2004          	jra	L15
 132  0009               L74:
 133                     ; 117     IRTIM->CR |= IRTIM_CR_EN ;
 135  0009 721052ff      	bset	21247,#0
 136  000d               L15:
 137                     ; 119 }
 140  000d 81            	ret
 176                     ; 127 void IRTIM_HighSinkODCmd(FunctionalState NewState)
 176                     ; 128 {
 177                     .text:	section	.text,new
 178  0000               _IRTIM_HighSinkODCmd:
 182                     ; 130   assert_param(IS_FUNCTIONAL_STATE(NewState));
 184                     ; 133   if (NewState == DISABLE)
 186  0000 4d            	tnz	a
 187  0001 2606          	jrne	L17
 188                     ; 135     IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN) ;
 190  0003 721352ff      	bres	21247,#1
 192  0007 2004          	jra	L37
 193  0009               L17:
 194                     ; 139     IRTIM->CR |= IRTIM_CR_HSEN ;
 196  0009 721252ff      	bset	21247,#1
 197  000d               L37:
 198                     ; 141 }
 201  000d 81            	ret
 225                     ; 165 FunctionalState IRTIM_GetStatus(void)
 225                     ; 166 {
 226                     .text:	section	.text,new
 227  0000               _IRTIM_GetStatus:
 231                     ; 167   return ((FunctionalState) (IRTIM->CR & IRTIM_CR_EN));
 233  0000 c652ff        	ld	a,21247
 234  0003 a401          	and	a,#1
 237  0005 81            	ret
 262                     ; 175 FunctionalState IRTIM_GetHighSinkODStatus(void)
 262                     ; 176 {
 263                     .text:	section	.text,new
 264  0000               _IRTIM_GetHighSinkODStatus:
 268                     ; 177   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
 270  0000 c652ff        	ld	a,21247
 271  0003 a402          	and	a,#2
 274  0005 81            	ret
 287                     	xdef	_IRTIM_GetHighSinkODStatus
 288                     	xdef	_IRTIM_GetStatus
 289                     	xdef	_IRTIM_HighSinkODCmd
 290                     	xdef	_IRTIM_Cmd
 291                     	xdef	_IRTIM_DeInit
 310                     	end
