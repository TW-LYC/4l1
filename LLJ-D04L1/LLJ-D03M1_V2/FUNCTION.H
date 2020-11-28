#include "global.h"
#ifndef __FUNCTION__H
#define __FUNCTION__H
#include "motor.h"

//typedef struct
//{
//	WorkMode		workMode;
//	u16 			workTimeCnt;
//}Fun_t;

//extern Fun_t gFun;

__V bit bTime10ms;
__V u8  gTimeCntFor10ms ;
__V u8  bakPORTA;


extern void DelayUs(u8 time);
extern void FUN_Init(void);
extern void FUN_Driver(void);
extern void MCU_SleepConfig(u8 isSleep);
extern void MCU_EnterSleep(void);
extern u16  GetAd (u8 ch);
void KEY_Driver(void);
void CUP_CHR_Driver(void);
void LED_Display(void);
void ADC_Deal(void);
void ADC_Driver(void);

#endif //__FUNCTION__H
