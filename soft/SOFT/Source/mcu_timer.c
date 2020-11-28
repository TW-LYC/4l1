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
	//8 λ��ʱ��/������ TMR0(01H)
	//OPTION_REG �Ĵ���(81H)
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
	//TIMER1 ���ƼĴ��� T1CON(10H)
	//	Bit7 T1GINV: TIMER1 �ſ��źż���λ��
	//		1= TIMER1 �ſ��źŸߵ�ƽ��Ч�����ſ��ź�Ϊ�ߵ�ƽʱ TIMER1 ��������
	//		0= TIMER1 �ſ��źŵ͵�ƽ��Ч�����ſ��ź�Ϊ�͵�ƽʱ TIMER1 ��������
	//	Bit6 TMR1GE: TIMER1 �ſ�ʹ��λ��
	//		���TMR1ON=0�� ��λ�����ԡ�
	//		��� TMR1ON=1: 1=TIMER1 ������ TIMER1 �ſع��ܿ��ƣ�
	//		0=TIMER1 ʼ�ռ�����
	//	Bit5~Bit4 T1CKPS<1:0>: TIMER1 ����ʱ��Ԥ��Ƶ��ѡ��λ��
	//		11= 1:8 Ԥ��Ƶ�ȣ�
	//		10= 1:4 Ԥ��Ƶ�ȣ�
	//		01= 1:2 Ԥ��Ƶ�ȣ�
	//		00= 1:1 Ԥ��Ƶ�ȡ�
	//	Bit3 ����λ������
	//	Bit2 T1SYNC: TIMER1 �ⲿʱ������ͬ������λ��
	//		TMR1CS=1: 1= �����ⲿʱ������ͬ����
	//		0= ���ⲿʱ������ͬ����
	//		TMR1CS=0�����Դ�λ�� TIMER1 ʹ���ڲ�ʱ�ӡ�
	//	Bit1 TMR1CS: TIMER1 ʱ��Դѡ��λ��
	//		1= ���� T1CKI ���ŵ�ʱ��Դ�������ش�������
	//		0= �ڲ�ʱ��Դ FSYS��
	//	Bit0 TMR1ON: TIMER1 ʹ��λ��
	//		1= ʹ�� TIMER1��
	//		0= ��ֹ TIMER1��
	#define T1_HIGH_ACT		(1<<7)	//1= TIMER1 �ſ��źŸߵ�ƽ��Ч�����ſ��ź�Ϊ�ߵ�ƽʱ TIMER1 ��������
	#define T1_GPIO_EN		(1<<6)	//1=TIMER1 ������ TIMER1 �ſع��ܿ���
	#define T1_CLK_DIV8		(3<<4)	//11= 1:8 Ԥ��Ƶ�ȣ�FSYS/8
	#define T1_CLK_DIV4		(2<<4)	//10= 1:4 Ԥ��Ƶ�ȣ�
	#define T1_CLK_DIV2		(1<<4)	//01= 1:2 Ԥ��Ƶ�ȣ�
	#define T1_CLK_DIV1		(0<<4)	//00= 1:1 Ԥ��Ƶ�ȡ�
	#define T1_SYNC_DIS		(1<<2)	//1= �����ⲿʱ������ͬ����
	#define T1_CLK_GPIO_EN	(1<<1)	//1= ���� T1CKI ���ŵ�ʱ��Դ�������ش�������
	#define T1_ON			(1<<0)	//1= ʹ�� TIMER1��
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
	//TIMER2 ���ƼĴ��� T2CON(12H)
	//	Bit7 δ��
	//	Bit6~Bit3 TOUTPS<3:0>: TIMER2 ������Ƶ��ѡ��λ��
	//  	0000= 1:1 ���Ƶ�ȣ�
	//  	0001= 1:2 ���Ƶ�ȣ�
	//  	0010= 1:3���Ƶ�ȣ�
	//  	0011= 1:4 ���Ƶ�ȣ�
	//  	0100= 1:5 ���Ƶ�ȣ�
	//  	0101= 1:6 ���Ƶ�ȣ�
	//  	0110= 1:7 ���Ƶ�ȣ�
	//  	0111= 1:8 ���Ƶ�ȣ�
	//  	1000= 1:9 ���Ƶ�ȣ�
	//  	1001= 1:10 ���Ƶ�ȣ�
	//  	1010= 1:11 ���Ƶ�ȣ�
	//  	1011= 1:12 ���Ƶ�ȣ�
	//  	1100= 1:13 ���Ƶ�ȣ�
	//  	1101= 1:14 ���Ƶ�ȣ�
	//  	1110= 1:15 ���Ƶ�ȣ�
	//  	1111= 1:16 ���Ƶ�ȡ�
	//Bit2 TMR2ON: TIMER2 ʹ��λ��
	//		1= ʹ�� TIMER2��
	//		0= ��ֹ TIMER2��
	//Bit1~Bit0 T2CKPS<1:0>: TIMER2 ʱ��Ԥ��Ƶ��ѡ��λ��
	//		00= Ԥ��ƵֵΪ 1��
	//		01= Ԥ��ƵֵΪ 4��
	//		1x= Ԥ��ƵֵΪ 16��
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
	TMR2IE = 1;					//ʹ��Timer2����ж�
	T2CON = T2_CLK_DIV1 | T2_PCLK_DIV16 | T2_ON; //16M/16=1M=1US
	PR2 = 100; //100US
	TMR2 = 1;
	INTCON = 0XC0;				//�������ж�

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