/* Copyright (c) all rights reserved
*******************************************************************************
* @file    mcu_pwm.h
* @author  wangxq
* @version v1.0.1
* @date    2020-04-23
* @brief   
*******************************************************************************
* @attention
*
* #include "mcu_pwm.h"
*
*******************************************************************************
*/
#include "global.h"
#ifndef __MCU_PWM__H
#define __MCU_PWM__H



#define PWM_IO_IN	1
#define PWM_IO_OUT	0

#define PWM_IO_C0	TRISB0	
#define PWM_IO_C1	TRISB1
#define PWM_IO_C2	TRISB3
#define PWM_IO_C3	TRISB4
#define PWM_IO_C4	TRISB2	
#define PWM_IO_B3	TRISB5
#define PWM_IO_B2	TRISA7
#define PWM_IO_A0	TRISA1
#define PWM_IO_A1	TRISA2	
#define PWM_IO_A2	TRISA3
#define PWM_IO_A3	TRISA4
#define PWM_IO_B0	TRISA5
#define PWM_IO_B1	TRISA6


#define PWM_IO_0	PWM_IO_B0
#define PWM_IO_1	PWM_IO_B1
#define PWM_IO_2	PWM_IO_B2
#define PWM_IO_3	PWM_IO_B3
#define PWM_IO_4	PWM_IO_B4	


/* 编译器不支持这种写法
#define PWM_GROUP_A
#define PWM_GROUP_B
#define PWM_GROUP_C
#define PWM_GROUP_SEL	PWM_GROUP_B	



#if PWM_GROUP_SEL==PWM_GROUP_A
#define PWM_IO_0	PWM_IO_A0
#define PWM_IO_1	PWM_IO_A1
#define PWM_IO_2	PWM_IO_A2
#define PWM_IO_3	PWM_IO_A3
#define PWM_IO_4	PWM_IO_A4	
#elif PWM_GROUP_SEL==PWM_GROUP_B
#define PWM_IO_0	PWM_IO_B0
#define PWM_IO_1	PWM_IO_B1
#define PWM_IO_2	PWM_IO_B2
#define PWM_IO_3	PWM_IO_B3
#define PWM_IO_4	PWM_IO_B4	
#else PWM_GROUP_SEL==PWM_GROUP_C
#define PWM_IO_0	PWM_IO_C0
#define PWM_IO_1	PWM_IO_C1
#define PWM_IO_2	PWM_IO_C2
#define PWM_IO_3	PWM_IO_C3
#define PWM_IO_4	PWM_IO_C4	
#endif
*/

//###################################################
#define PWM4_PERIOD		100 //10BIT
#define PWM4_DEAD		100 //10BIT
#define PWM0_3_PERIOD	130 //10BIT
#define PWM0_DUTY		0 //10BIT
#define PWM1_DUTY		0 //10BIT
#define PWM2_DUTY		0 //10BIT
#define PWM3_DUTY		0 //10BIT

#define PWM0_1_DEAD		0 //6BIT
#define PWM2_3_DEAD		0 //6BIT

//###################################################
#define PWM0_EN			0
#define PWM1_EN			0
#define PWM2_EN			1
#define PWM3_EN			0
#define PWM4_EN			0
//###################################################

extern void MCU_PwmInit(void);
extern void MCU_PWM2_SetDuty(u8 duty);


#endif //__MCU_PWM__H
