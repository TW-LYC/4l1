/* Copyright (c) all rights reserved
*******************************************************************************
* @file    mcu_int.c
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
#include "mcu_int.h"

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void MCU_IntInit(void)
{
	//中断控制寄存器 INTCON (0BH)
	//	Bit7 GIE: 全局中断允许位；
	//	Bit6 PEIE: 外设中断允许位；
	//	Bit5 T0IE: TIMER0溢出中断允许位；
	//	Bit4 INTE: INT外部中断允许位；
	//	Bit3 RBIE: PORTB电平变化中断允许位（1）；IOCB 寄存器也必须使能，相应的口线需设置为输入态
	//	Bit2 T0IF: TIMER0溢出中断标志位（2）；（必须由软件清零）复位不会使 TMR0 发生改变,需要手动清零
	//	Bit1 INTF: INT外部中断标志位；（必须由软件清零）
	//	Bit0 RBIF: PORTB电平变化中断标志位；
	//		1= PORTB端口中至少有一个引脚的电平状态发生了改变（必须由软件清零） ；
	//		0= 没有一个PORTB通用I/O引脚的状态发生了改变。
	#define G_IE			(1<<7)
	#define PE_IE			(1<<6)
	#define T0_IE			(1<<5)
	#define IN_TE			(1<<4)
	#define RB_IE			(1<<3)
	#define T0_IF			(1<<2)
	#define IN_TF			(1<<1)
	#define RB_IF			(1<<0)
	INTCON = PE_IE;
	
	//外设中断允许寄存器 PIE1(8CH)
	//	Bit7 RAIE: PORTA电平变化中断允许位；
	//	Bit6 ADIE: AD转换器（ADC）中断允许位；
	//	Bit5~Bit4 保留
	//	Bit3 EEIE: EEDATA写中断允许位；
	//	Bit2 PWMIE: PWM中断允许位；
	//	Bit1 TMR2IE: TIMER2与PR2匹配中断允许位；
	//	Bit0 TMR1IE: TIMER1溢出中断允许位；
	#define RA_IE			(1<<7)
	#define AD_IE			(1<<6)
	#define EE_IE			(1<<3)
	#define PWM_IE			(1<<2)
	#define T2_IE			(1<<1)
	#define T1_IE			(1<<0)
	PIE1 = T2_IE;
	
	//外设中断允许寄存器 PIE2(8DH)
	//	Bit7~Bit1 未用。
	//	Bit0 LVDIE: LVD中断允许位；
	#define LVD_IE			(1<<0)
	PIE2 = 0;
	
	//外设中断请求寄存器 PIR1(0CH)
	//Bit7 RAIF: PORTA电平变化中断标志位；
	//Bit6 ADIF: AD转换器中断标志位；
	//	1= AD转换完成（必须由软件清零）；
	//	0= AD转换未完成或尚未启动。
	//Bit5~Bit4 保留
	//Bit3 EEIF: 程序EEPROM写操作中断标志位；
	//	1= 写操作完成（必须由软件清零）；
	//	0= 写操作未完成或尚未启动。
	//Bit2 PWMIF: PWM中断标志位；（必须由软件清零）
	//Bit1 TMR2IF: TIMER2与PR2匹配中断标志位。（必须由软件清零）
	//Bit1 TMR1IF: TIMER1与PR1匹配中断标志位。（必须由软件清零）****规格书有误，已改
	#define RA_IF				(1<<7)
	#define AD_IF				(1<<6)
	#define EE_IF				(1<<3)
	#define PWM_IF				(1<<2)
	#define T2_IF				(1<<1)
	#define T1_IF				(1<<0)
	PIR1 = 0;
	
	//外设中断请求寄存器 PIR2(0DH)
	#define LVD_IF			(1<<0)
	PIR2 = 0;
	
	
}
//

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void interrupt ISR(void)
{
	if (T0IE && T0IF)
	{
		T0IF = 0;//在此加入TMR0 中断服务
	}
	if (TMR1IE && TMR1IF)
	{
		TMR1IF = 0;//在此加入TMR1 中断服务
	}
	
	if(TMR2IF)
	{
		TMR2IF = 0;
		//--------------------------------------100us
	//	PIN_TP1 = ~PIN_TP1;
	
		if (++gTimeCntFor10ms >= 100) {
			gTimeCntFor10ms = 0;
			gbTime10ms = 1;
			
		}

	}
	if(RAIF || RBIF)
	{
		RAIF = 0;
		RBIF = 0;
	}
}
//