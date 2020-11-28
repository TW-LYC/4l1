/* Copyright (c) all rights reserved
*******************************************************************************
* @file    global.h
* @author  wangxq
* @version v1.0.1
* @date    2020-04-23
* @brief   
*******************************************************************************
* @attention
*
* #include "global.h"
*
*******************************************************************************
*/
#ifndef __GLOBAL__H
#define __GLOBAL__H

#include "sc.h" 
#include "base.h"
#include "string.h"
//------------------------------------------------------------------------------
#define _XTAL_FREQ		16000000
//#define CLRWDT()		asm("clrwdt")
//#define SLEEP()		asm("sleep")
//#define NOP()			asm("nop")
//------------------------------------------------------------------------------
#define PIN_LEDB		RA1
#define PIN_LEDR		RB4
//#define PIN_DCLK		RB2
//#define PIN_DDAT		RB3
#define PIN_USB_IN		RB0
//#define PIN_TP1			RB5

#define PIN_CUP			RB7
#define PIN_KEY_SW1     RA3
#define PIN_KEY_SW2     RB5
#define PIN_MOTO1		RA6
#define PIN_MOTO2		RA0
#define PIN_BAT_I		RA5 //AN5-MO-I
#define PIN_MID_V2		RA4 //AN4-MID-V
//#define PIN_MID_V3		RA1 //AN4-MID-V
#define PIN_CHR_I		RB1 //AN12-CHR-I
#define PIN_BAT_V		RA2 //AN2-BAT-V
#define PIN_CHR_PWM		RA7	//PWMB2

//------------------------------------------------------------------------------
#define ADCH_BAT_I		5
#define ADCH_MID_V2		4
#define ADCH_CHR_I		12
#define ADCH_BAT_V		2

//------------------------------------------------------------------------------
#define LEDR_ON()			PIN_LEDR=0
#define LEDR_OFF()			PIN_LEDR=1
#define LEDB_ON()			PIN_LEDB=0
#define LEDB_OFF()			PIN_LEDB=1

#define MOTO1_ON()			PIN_MOTO1=1
#define MOTO2_ON()			PIN_MOTO2=1
#define MOTO1_OFF()			PIN_MOTO1=0
#define MOTO2_OFF()			PIN_MOTO1=0
#define IS_USB_IN()			(PIN_USB_IN==0)
#define IS_USB_NOT()			(PIN_USB_IN==1)
#define IS_CUP_OK()			(PIN_KEY_SW2==0)//’˝≥£
#define IS_CUP_NOT()		(PIN_KEY_SW2==1)//’˝≥£
//#define IS_CUP_OK()			(PIN_CUP==1)//±≠◊”ºÏ≤‚Ω·π˚∑¥◊™
#define KEYSW1_IS_GET()		    (PIN_KEY_SW1==0)
#define KEYSW1_NOT_GET()		(PIN_KEY_SW1==1)
#define KEYSW2_IS_GET()		    (PIN_KEY_SW2==0)
#define KEYSW2_NOT_GET()		(PIN_KEY_SW2==1)
//------------------------------------------------------------------------------Type define start
typedef enum
{
	WM_Poweroff,
	WM_Standby,
	WM_Work	,
	WM_Sleep,
	WM_Charge,
} _WorkMode;

typedef enum
{
	CS_ChrNull 		= 0,
	CS_ChrPre		= 1,
	CS_ChrCC		= 2,
	CS_ChrCV		= 3,
	CS_ChrEnd		= 4,
	CS_ChrError		= 5,
} ChrState; 

typedef enum
{
	LM_Off = 0,					//
	LM_Red_On,             		//∫Ïµ∆≥£¡¡
	LM_white_On,           		//¿∂µ∆≥£¡¡ 
	LM_white_1Hz,
	LM_white_2Hz,           		//¿∂µ∆…¡À∏2Hz
	LM_white_1Hz_3T,
	LM_Red_1HZ_3T,             	//∫Ïµ∆…¡À∏3¥Œ 1Hz 
	LM_white_1HZ_5T,            	//¿∂µ∆…¡À∏3¥Œ 1Hz
	LM_Red_1HZ_10T,           	//∫Ïµ∆…¡À∏10¥Œ 1Hz
	LM_Red_2HZ_10T,           	//∫Ïµ∆…¡À∏10¥Œ 2Hz
	LM_Redwhite_1HZ_1T,       	//∫Ï¿∂ΩªÃÊ…¡À∏1¥Œ 1Hz 
} _LedMode;
//------------------------------------------------------------------------------Type define end
#include "var_define.h"
//------------------------------------------------------------------------------
extern u16                   adStart5sCnt;
//------------------------------------------------------------------------------

#endif //__GLOBAL__H
