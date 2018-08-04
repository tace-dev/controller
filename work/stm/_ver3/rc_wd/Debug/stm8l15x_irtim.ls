   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  49                     ; 94 void IRTIM_DeInit(void)
  49                     ; 95 {
  51                     	switch	.text
  52  0000               _IRTIM_DeInit:
  56                     ; 96   IRTIM->CR = IRTIM_CR_RESET_VALUE;
  58  0000 725f52ff      	clr	21247
  59                     ; 97 }
  62  0004 81            	ret	
 117                     ; 105 void IRTIM_Cmd(FunctionalState NewState)
 117                     ; 106 {
 118                     	switch	.text
 119  0005               _IRTIM_Cmd:
 123                     ; 108   assert_param(IS_FUNCTIONAL_STATE(NewState));
 125                     ; 111   if (NewState ==   DISABLE)
 127  0005 4d            	tnz	a
 128  0006 2605          	jrne	L74
 129                     ; 113     IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN) ;
 131  0008 721152ff      	bres	21247,#0
 134  000c 81            	ret	
 135  000d               L74:
 136                     ; 117     IRTIM->CR |= IRTIM_CR_EN ;
 138  000d 721052ff      	bset	21247,#0
 139                     ; 119 }
 142  0011 81            	ret	
 178                     ; 127 void IRTIM_HighSinkODCmd(FunctionalState NewState)
 178                     ; 128 {
 179                     	switch	.text
 180  0012               _IRTIM_HighSinkODCmd:
 184                     ; 130   assert_param(IS_FUNCTIONAL_STATE(NewState));
 186                     ; 133   if (NewState == DISABLE)
 188  0012 4d            	tnz	a
 189  0013 2605          	jrne	L17
 190                     ; 135     IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN) ;
 192  0015 721352ff      	bres	21247,#1
 195  0019 81            	ret	
 196  001a               L17:
 197                     ; 139     IRTIM->CR |= IRTIM_CR_HSEN ;
 199  001a 721252ff      	bset	21247,#1
 200                     ; 141 }
 203  001e 81            	ret	
 227                     ; 165 FunctionalState IRTIM_GetStatus(void)
 227                     ; 166 {
 228                     	switch	.text
 229  001f               _IRTIM_GetStatus:
 233                     ; 167   return ((FunctionalState) (IRTIM->CR & IRTIM_CR_EN));
 235  001f c652ff        	ld	a,21247
 236  0022 a401          	and	a,#1
 239  0024 81            	ret	
 264                     ; 175 FunctionalState IRTIM_GetHighSinkODStatus(void)
 264                     ; 176 {
 265                     	switch	.text
 266  0025               _IRTIM_GetHighSinkODStatus:
 270                     ; 177   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
 272  0025 c652ff        	ld	a,21247
 273  0028 a402          	and	a,#2
 276  002a 81            	ret	
 289                     	xdef	_IRTIM_GetHighSinkODStatus
 290                     	xdef	_IRTIM_GetStatus
 291                     	xdef	_IRTIM_HighSinkODCmd
 292                     	xdef	_IRTIM_Cmd
 293                     	xdef	_IRTIM_DeInit
 312                     	end
