/* Copyright (c) all rights reserved
*******************************************************************************
* @file    mcu_timer.c
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
#include "mcu_timer.h"

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void MCU_Timer0_Init(void)
{
	//8 位定时器/计数器 TMR0(01H)
	//OPTION_REG 寄存器(81H)
	//T0IE
	TMR0 = 0;
}
//

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void MCU_Timer1_Init(void)
{
	//TIMER1 控制寄存器 T1CON(10H)
	//	Bit7 T1GINV: TIMER1 门控信号极性位；
	//		1= TIMER1 门控信号高电平有效（当门控信号为高电平时 TIMER1 计数）；
	//		0= TIMER1 门控信号低电平有效（当门控信号为低电平时 TIMER1 计数）。
	//	Bit6 TMR1GE: TIMER1 门控使能位；
	//		如果TMR1ON=0， 此位被忽略。
	//		如果 TMR1ON=1: 1=TIMER1 计数由 TIMER1 门控功能控制；
	//		0=TIMER1 始终计数。
	//	Bit5~Bit4 T1CKPS<1:0>: TIMER1 输入时钟预分频比选择位；
	//		11= 1:8 预分频比；
	//		10= 1:4 预分频比；
	//		01= 1:2 预分频比；
	//		00= 1:1 预分频比。
	//	Bit3 保留位，禁用
	//	Bit2 T1SYNC: TIMER1 外部时钟输入同步控制位。
	//		TMR1CS=1: 1= 不与外部时钟输入同步；
	//		0= 与外部时钟输入同步。
	//		TMR1CS=0：忽略此位， TIMER1 使用内部时钟。
	//	Bit1 TMR1CS: TIMER1 时钟源选择位；
	//		1= 来自 T1CKI 引脚的时钟源（上升沿触发）；
	//		0= 内部时钟源 FSYS。
	//	Bit0 TMR1ON: TIMER1 使能位；
	//		1= 使能 TIMER1；
	//		0= 禁止 TIMER1。
	#define T1_HIGH_ACT		(1<<7)	//1= TIMER1 门控信号高电平有效（当门控信号为高电平时 TIMER1 计数）；
	#define T1_GPIO_EN		(1<<6)	//1=TIMER1 计数由 TIMER1 门控功能控制
	#define T1_CLK_DIV8		(3<<4)	//11= 1:8 预分频比；FSYS/8
	#define T1_CLK_DIV4		(2<<4)	//10= 1:4 预分频比；
	#define T1_CLK_DIV2		(1<<4)	//01= 1:2 预分频比；
	#define T1_CLK_DIV1		(0<<4)	//00= 1:1 预分频比。
	#define T1_SYNC_DIS		(1<<2)	//1= 不与外部时钟输入同步；
	#define T1_CLK_GPIO_EN	(1<<1)	//1= 来自 T1CKI 引脚的时钟源（上升沿触发）；
	#define T1_ON			(1<<0)	//1= 使能 TIMER1；
	//T1CON = T1_CLK_DIV8; //16/8=2M=0.5us
	//TMR1H = 0;//HIBYTE(200); //100us=0.5us*200
	//TMR1L = 0;//LOBYTE(200); //100us=0.5us*200
}
//

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void MCU_Timer2_Init(void)
{
	//TIMER2 控制寄存器 T2CON(12H)
	//	Bit7 未用
	//	Bit6~Bit3 TOUTPS<3:0>: TIMER2 输出后分频比选择位。
	//  	0000= 1:1 后分频比；
	//  	0001= 1:2 后分频比；
	//  	0010= 1:3后分频比；
	//  	0011= 1:4 后分频比；
	//  	0100= 1:5 后分频比；
	//  	0101= 1:6 后分频比；
	//  	0110= 1:7 后分频比；
	//  	0111= 1:8 后分频比；
	//  	1000= 1:9 后分频比；
	//  	1001= 1:10 后分频比；
	//  	1010= 1:11 后分频比；
	//  	1011= 1:12 后分频比；
	//  	1100= 1:13 后分频比；
	//  	1101= 1:14 后分频比；
	//  	1110= 1:15 后分频比；
	//  	1111= 1:16 后分频比。
	//Bit2 TMR2ON: TIMER2 使能位；
	//		1= 使能 TIMER2；
	//		0= 禁止 TIMER2。
	//Bit1~Bit0 T2CKPS<1:0>: TIMER2 时钟预分频比选择位；
	//		00= 预分频值为 1；
	//		01= 预分频值为 4；
	//		1x= 预分频值为 16。
	#define T2_CLK_DIV1			(0 <<3)
	#define T2_CLK_DIV2			(1 <<3)
	#define T2_CLK_DIV3			(2 <<3)
	#define T2_CLK_DIV4			(3 <<3)
	#define T2_CLK_DIV5			(4 <<3)
	#define T2_CLK_DIV6			(5 <<3)
	#define T2_CLK_DIV7			(6 <<3)
	#define T2_CLK_DIV8			(7 <<3)
	#define T2_CLK_DIV9			(8 <<3)
	#define T2_CLK_DIV10		(9 <<3)
	#define T2_CLK_DIV11		(10<<3)
	#define T2_CLK_DIV12		(11<<3)
	#define T2_CLK_DIV13		(12<<3)
	#define T2_CLK_DIV14		(13<<3)
	#define T2_CLK_DIV15		(14<<3)
	#define T2_CLK_DIV16		(15<<3)
	#define T2_ON				(1<<2)
	#define T2_PCLK_DIV4		(0<<0) //Fsys/4/1
	#define T2_PCLK_DIV16		(1<<0) //Fsys/4/4
	#define T2_PCLK_DIV64		(2<<0) //Fsys/4/16

	asm("nop");
	asm("clrwdt");
	TMR2IF = 0;
	TMR2IE = 1;					//使能Timer2溢出中断
	T2CON = T2_CLK_DIV1 | T2_PCLK_DIV16 | T2_ON; //16M/16=1M=1US
	PR2 = 100; //100US
	TMR2 = 1;
	INTCON = 0XC0;				//开启总中断

}
//

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void MCU_TimerInit(void)
{
	MCU_Timer0_Init();
	MCU_Timer1_Init();
	MCU_Timer2_Init();
}
//
