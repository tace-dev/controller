   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 131                     ; 96 FlagStatus RST_GetFlagStatus(RST_FLAG_TypeDef RST_Flag)
 131                     ; 97 {
 133                     .text:	section	.text,new
 134  0000               _RST_GetFlagStatus:
 138                     ; 99   assert_param(IS_RST_FLAG(RST_Flag));
 140                     ; 103   return ((FlagStatus)((uint8_t)RST->SR & (uint8_t)RST_Flag));
 142  0000 c450b1        	and	a,20657
 145  0003 81            	ret	
 180                     ; 118 void RST_ClearFlag(RST_FLAG_TypeDef RST_Flag)
 180                     ; 119 {
 181                     .text:	section	.text,new
 182  0000               _RST_ClearFlag:
 186                     ; 121   assert_param(IS_RST_FLAG(RST_Flag));
 188                     ; 123   RST->SR = (uint8_t)RST_Flag;
 190  0000 c750b1        	ld	20657,a
 191                     ; 124 }
 194  0003 81            	ret	
 217                     ; 147 void RST_GPOutputEnable(void)
 217                     ; 148 {
 218                     .text:	section	.text,new
 219  0000               _RST_GPOutputEnable:
 223                     ; 150   RST->CR = RST_CR_MASK;
 225  0000 35d050b0      	mov	20656,#208
 226                     ; 151 }
 229  0004 81            	ret	
 242                     	xdef	_RST_GPOutputEnable
 243                     	xdef	_RST_ClearFlag
 244                     	xdef	_RST_GetFlagStatus
 263                     	end
