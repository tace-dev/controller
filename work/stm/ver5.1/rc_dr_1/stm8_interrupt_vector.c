#include "stdafx.h"
#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_)

typedef void @far (*interrupt_handler_t)(void);

struct interrupt_vector {
	unsigned char interrupt_instruction;
	interrupt_handler_t interrupt_handler;
};

#ifdef _COSMIC_
/**
  * @brief Dummy interrupt routine
  * @par Parameters:
  * None
  * @retval 
  * None
*/
INTERRUPT_HANDLER(NonHandledInterrupt,0)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
#endif

/**
  * @brief TRAP interrupt routine
  * @par Parameters:
  * None
  * @retval 
  * None
*/
INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler) { }

/**
  * @brief FLASH Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(FLASH_IRQHandler,1) { }

/**
  * @brief DMA1 channel0 and channel1 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2) { }

/**
  * @brief DMA1 channel2 and channel3 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3) { }

/**
  * @brief RTC / CSS_LSE Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4) { }

/**
  * @brief External IT PORTE/F and PVD Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5) 
{
}

/**
  * @brief External IT PORTB / PORTG Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6) 
{
}

/**
  * @brief External IT PORTD /PORTH Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTID_H_IRQHandler,7) 
{
}

/**
  * @brief External IT PIN0 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI0_IRQHandler,8) 
{ 
}

/**
  * @brief External IT PIN1 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
{ 
}


/**
  * @brief External IT PIN2 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI2_IRQHandler,10) 
{ 
}

/**
  * @brief External IT PIN3 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI3_IRQHandler,11) 
{ 
}

/**
  * @brief External IT PIN4 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI4_IRQHandler,12) 
{ 
}

/**
  * @brief External IT PIN5 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI5_IRQHandler,13) 
{ 
//	timer2CiCb();
//	EXTI_ClearITPendingBit(EXTI_IT_Pin5);
}

/**
  * @brief External IT PIN6 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI6_IRQHandler,14) 
{ 
}

/**
  * @brief External IT PIN7 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI7_IRQHandler,15) 
{ 
}

/**
  * @brief LCD /AES Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(LCD_AES_IRQHandler,16) { }

/**
  * @brief CLK switch/CSS/TIM1 break Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17) { }

/**
  * @brief ADC1/Comparator Interrupt routine.
  * @param  None
  * @retval None
  */
extern uint16_t	_adcBuf[];
extern uint8_t	_adci;

INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18) 
{
#if	0
	uint16_t	i;
	i = ADC_GetConversionValue(ADC1);
	_adcBuf[_adci++] = i;
	if( _adci == 17 )
		_adci = 0;
#endif	
}

/**
  * @brief TIM2 Update/Overflow/Trigger/Break /USART2 TX Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19) 
{
	timer2_UpdateCb();
	TIM2_ClearITPendingBit(TIM2_IT_Update);
}

/**
  * @brief Timer2 Capture/Compare / USART2 RX Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20) 
{
}

/**
  * @brief Timer3 Update/Overflow/Trigger/Break Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21) { }

/**
  * @brief Timer3 Capture/Compare /USART3 RX Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22) { }

/**
  * @brief TIM1 Update/Overflow/Trigger/Commutation Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23) 
{
	encoder_irq();
	TIM1_ClearFlag(TIM1_FLAG_Trigger);
}

/**
  * @brief TIM1 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
{
	/*
	*/
	timer2CiCb();
	TIM1_ClearFlag(TIM1_FLAG_CC3);
	TIM1_ClearITPendingBit(TIM1_FLAG_CC3);
}

/**
  * @brief TIM4 Update/Overflow/Trigger Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25) 
{
	timer4_UpdateCb();
	TIM4_ClearITPendingBit(TIM4_IT_Update);
}

/**
  * @brief SPI1 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(SPI1_IRQHandler,26) { }

/**
  * @brief USART1 TX / TIM5 Update/Overflow/Trigger/Break Interrupt  routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27) 
{
	uart1_tx_irq();
}

/**
  * @brief USART1 RX / Timer5 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28) 
{
	uart1_rx_irq();
	USART_ClearITPendingBit(USART1, USART_FLAG_RXNE);
}

/**
  * @brief I2C1 / SPI2 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29) { }

extern void	_stext();	//	startup routine

struct interrupt_vector const _vectab[] = {
  {0x82, (interrupt_handler_t)_stext},		/* Reset */
  {0x82, (interrupt_handler_t)TRAP_IRQHandler},			/* TRAP - Software interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},		/* Reserved */
  {0x82, (interrupt_handler_t)FLASH_IRQHandler},			/* irq1 - FLASH interrupt */
  {0x82, (interrupt_handler_t)DMA1_CHANNEL0_1_IRQHandler},			/* irq2 - DMA1 channel0 and channel1 interrupt */
	{0x82, (interrupt_handler_t)DMA1_CHANNEL2_3_IRQHandler},			/* irq3 - DMA1 channel2 and channel3 interrupt */
  {0x82, (interrupt_handler_t)RTC_CSSLSE_IRQHandler},			/* irq4 - RTC/ CSS on LSE interrupt */
  {0x82, (interrupt_handler_t)EXTIE_F_PVD_IRQHandler},    /* irq5 - External IT PORTE/F interrupt /PVD interrupt*/
  {0x82, (interrupt_handler_t)EXTIB_G_IRQHandler},      /* irq6 - External IT PORTB / PORTG interrupt */
  {0x82, (interrupt_handler_t)EXTID_H_IRQHandler},			/* irq7 - External IT PORTD / PORTH interrupt */
  {0x82, (interrupt_handler_t)EXTI0_IRQHandler},			/* irq8 - External IT PIN0 interrupt */
  {0x82, (interrupt_handler_t)EXTI1_IRQHandler},			/* irq9 - External IT PIN1 interrupt */
  {0x82, (interrupt_handler_t)EXTI2_IRQHandler},			/* irq10 - External IT PIN2 interrupt */
  {0x82, (interrupt_handler_t)EXTI3_IRQHandler},		  /* irq11 - External IT PIN3 interrupt */
  {0x82, (interrupt_handler_t)EXTI4_IRQHandler},      /* irq12 - External IT PIN4 interrupt */
  {0x82, (interrupt_handler_t)EXTI5_IRQHandler},      /* irq13 - External IT PIN5 interrupt */
  {0x82, (interrupt_handler_t)EXTI6_IRQHandler},      /* irq14 - External IT PIN6 interrupt */
  {0x82, (interrupt_handler_t)EXTI7_IRQHandler},      /* irq15 - External IT PIN7 interrupt */
  {0x82, (interrupt_handler_t)LCD_AES_IRQHandler},      /* irq16 - LCD / AES interrupt */
  {0x82, (interrupt_handler_t)SWITCH_CSS_BREAK_DAC_IRQHandler},      /* irq17 - CLK switch/CSS interrupt/ TIM1 Break interrupt / DAC */
  {0x82, (interrupt_handler_t)ADC1_COMP_IRQHandler},      /* irq18 - ADC1 and Comparator interrupt */
  {0x82, (interrupt_handler_t)TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler},      /* irq19 - TIM2 Update/Overflow/Trigger/Break / USART2 TX interrupt */
  {0x82, (interrupt_handler_t)TIM2_CC_USART2_RX_IRQHandler},      /* irq20 - TIM2 Capture/Compare / USART2 RX interrupt */
  {0x82, (interrupt_handler_t)TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler},      /* irq21 - TIM3 Update/Overflow/Trigger/Break / USART3 TX interrupt */
  {0x82, (interrupt_handler_t)TIM3_CC_USART3_RX_IRQHandler},			/* irq22 - TIM3 Capture/Compare /USART3 RX interrupt */
  {0x82, (interrupt_handler_t)TIM1_UPD_OVF_TRG_COM_IRQHandler},      /* irq23 - TIM1 Update/Overflow/Trigger/Commutation interrupt */
  {0x82, (interrupt_handler_t)TIM1_CC_IRQHandler},      /* irq24 - TIM1 Capture/Compare interrupt */
  {0x82, (interrupt_handler_t)TIM4_UPD_OVF_TRG_IRQHandler},     /* irq25 - TIM4 Update/Overflow/Trigger interrupt */
  {0x82, (interrupt_handler_t)SPI1_IRQHandler},      /* irq26 - SPI1 interrupt */
  {0x82, (interrupt_handler_t)USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler},      /* irq27 - USART1 TX / TIM5 Update/Overflow/Trigger/Break interrupt */
  {0x82, (interrupt_handler_t)USART1_RX_TIM5_CC_IRQHandler},      /* irq28 - USART1 RX / TIM1 Capture/Compare interrupt */
  {0x82, (interrupt_handler_t)I2C1_SPI2_IRQHandler},      /* irq29 - I2C1 / SPI2 interrupt */

};

#endif	//	_RC_WD_
