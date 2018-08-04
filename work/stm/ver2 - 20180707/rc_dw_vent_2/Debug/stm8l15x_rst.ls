   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 131                     ; 96 FlagStatus RST_GetFlagStatus(RST_FLAG_TypeDef RST_Flag)
 131                     ; 97 {
 132                     .text:	section	.text,new
 133  0000               f_RST_GetFlagStatus:
 137                     ; 99   assert_param(IS_RST_FLAG(RST_Flag));
 139                     ; 103   return ((FlagStatus)((uint8_t)RST->SR & (uint8_t)RST_Flag));
 141  0000 c450b1        	and	a,20657
 144  0003 87            	retf	
 178                     ; 118 void RST_ClearFlag(RST_FLAG_TypeDef RST_Flag)
 178                     ; 119 {
 179                     .text:	section	.text,new
 180  0000               f_RST_ClearFlag:
 184                     ; 121   assert_param(IS_RST_FLAG(RST_Flag));
 186                     ; 123   RST->SR = (uint8_t)RST_Flag;
 188  0000 c750b1        	ld	20657,a
 189                     ; 124 }
 192  0003 87            	retf	
 214                     ; 147 void RST_GPOutputEnable(void)
 214                     ; 148 {
 215                     .text:	section	.text,new
 216  0000               f_RST_GPOutputEnable:
 220                     ; 150   RST->CR = RST_CR_MASK;
 222  0000 35d050b0      	mov	20656,#208
 223                     ; 151 }
 226  0004 87            	retf	
 238                     	xdef	f_RST_GPOutputEnable
 239                     	xdef	f_RST_ClearFlag
 240                     	xdef	f_RST_GetFlagStatus
 259                     	end
