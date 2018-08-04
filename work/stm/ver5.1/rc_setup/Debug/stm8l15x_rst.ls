   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
 128                     ; 96 FlagStatus RST_GetFlagStatus(RST_FLAG_TypeDef RST_Flag)
 128                     ; 97 {
 130                     .text:	section	.text,new
 131  0000               _RST_GetFlagStatus:
 135                     ; 99   assert_param(IS_RST_FLAG(RST_Flag));
 137                     ; 103   return ((FlagStatus)((uint8_t)RST->SR & (uint8_t)RST_Flag));
 139  0000 c450b1        	and	a,20657
 142  0003 81            	ret
 177                     ; 118 void RST_ClearFlag(RST_FLAG_TypeDef RST_Flag)
 177                     ; 119 {
 178                     .text:	section	.text,new
 179  0000               _RST_ClearFlag:
 183                     ; 121   assert_param(IS_RST_FLAG(RST_Flag));
 185                     ; 123   RST->SR = (uint8_t)RST_Flag;
 187  0000 c750b1        	ld	20657,a
 188                     ; 124 }
 191  0003 81            	ret
 214                     ; 147 void RST_GPOutputEnable(void)
 214                     ; 148 {
 215                     .text:	section	.text,new
 216  0000               _RST_GPOutputEnable:
 220                     ; 150   RST->CR = RST_CR_MASK;
 222  0000 35d050b0      	mov	20656,#208
 223                     ; 151 }
 226  0004 81            	ret
 239                     	xdef	_RST_GPOutputEnable
 240                     	xdef	_RST_ClearFlag
 241                     	xdef	_RST_GetFlagStatus
 260                     	end
