//Project: FT61F02X.prj
//Device: FT61F02X
//Memory: Flash 2KX14b, EEPROM 256X8b, SRAM 128X8b
//Author: 
//Company: 
//Version:
//Date: 
//
//===========================================================
//===========================================================
#include "mcu.h"
#include "function.h"

/*********************************************************************************
*********************************************************************************/
void main(void)
{
	MCU_Init();
	FUN_Init();
	GIE = 1;	//使能全局中断
    
	while(1)
	{
        if (bTime10ms) {
			bTime10ms = 0;
			//------------------------------
            KEY_Driver();
            CUP_CHR_Driver();
            FUN_Driver();
			ADC_Driver();
			ADC_Deal();
			LED_Display();
			MOTO_Driver();
		}
	}
}
//
