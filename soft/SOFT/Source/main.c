/* Copyright (c) all rights reserved
*******************************************************************************
* @file    main.c
* @author  wangxq
* @version v1.0.1
* @date    2020-04-23
* @brief   
*******************************************************************************
* @attention
*
*
*
*******************************************************************************
*/
#define MAIN_FILE
#include "mcu_config.h"
#include "function.h"
#include "var_define.h"
#include "function_work.h"
#include "struct.h"
/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void main(void)
{
//	asm("sleep");
	MCU_Config();
//	FUN_Init();
	GIE = 1;
//	MCU_EnterSleep();
	ledMode = LM_Redwhite_1HZ_1T;
	while(1)
	{
		if (gbTime10ms) {
			gbTime10ms = 0;
			asm("clrwdt");
			
			//-----------------------	
/**/
			if (IS_USB_NOT()){
				KEY_Driver();
				KEY_WorkDriver();				
			}
			Run_State();
			ADC_Driver();
			CUP_USB_Driver();
			LED_Display();
			MCU_PwmInit();

		}
	}
}
//
