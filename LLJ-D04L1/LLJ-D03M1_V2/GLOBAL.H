#ifndef __GLOBAL__H
#define __GLOBAL__H

#include "SYSCFG.h";
#include "string.h"
//---------------------------------------------------------------------------------
typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed long s32;
typedef unsigned long u32;
#define __V 			volatile
#define TRUE		1
#define FLASE		0
#define BIT8(v0,v1,v2,v3,v4,v5,v6,v7) ((v0)|((v1)<<1)|((v2)<<2)|((v3)<<3)|((v4)<<4)|((v5)<<5)|((v6)<<6)|((v7)<<7))

//---------------------------------------------------------------------------------
#define PIN_MOTO				RA4
#define PIN_LED_R				RC3
#define PIN_LED_B				RC2
#define PIN_HALL					RA2
#define PIN_KEY					RA3
#define PIN_CURR				RC0
#define PIN_VOL					RC1
#define PIN_CHR_S1_D			RA0
#define PIN_CHR_S2_D			RA1

#define PIN_CHR_S1			RA7
#define PIN_CHR_S2			RA6
#define PIN_VOL_AD_EN		RC4
//---------------------------------------------------------------------------------
#define MOTO_ON()				PIN_MOTO=1
#define MOTO_OFF()			PIN_MOTO=0

#define LEDR_ON()				PIN_LED_R=1
#define LEDR_OFF()				PIN_LED_R=0
#define LEDB_ON()				PIN_LED_B=1
#define LEDB_OFF()				PIN_LED_B=0

#define KEY_IS_GET()			(PIN_KEY==0)

//#################################################################################
#define CUP_IS_EXIST()		(PIN_HALL==0) //Õý³£
//#define CUP_IS_EXIST()		(PIN_HALL==1) //±­×Ó¼ì²â½á¹û·´×ª
//#################################################################################

#define BAT_IS_CHR()			(PIN_CHR_S1==0)
#define BAT_IS_STD()			(PIN_CHR_S2==0)
#define BAT_IS_CHR_D()			(PIN_CHR_S1_D==0)
#define BAT_IS_STD_D()			(PIN_CHR_S2_D==0)
#define VOL_AD_EN()			PIN_VOL_AD_EN=0
#define VOL_AD_DIS()			PIN_VOL_AD_EN=1

//---------------------------------------------------------------------------------
typedef enum
{
    WM_Error = 0,
	WM_Standby,
    WM_Work	,
    WM_Sleep,
    WM_Charge,
} WorkMode;

typedef enum
{						//		std   chr
    CS_Null 		= 0,	//0     0
	CS_Charge	= 1,  //0     1
    CS_End		= 2, 	//1     0
    CS_Error		= 3,	//1     1
} ChrState; 

typedef enum
{
    LM_Off = 0,					//²»ÁÁµÆ
    LM_Red_On,                   //ºìµÆ³£ÁÁ
    LM_Blue_On,                   //À¶µÆ³£ÁÁ 
    LM_Red_1HZ_3T,             //ºìµÆÉÁË¸3´Î 1Hz 
    LM_Blue_1HZ_3T,            //À¶µÆÉÁË¸3´Î 1Hz
    LM_Red_1HZ_10T,           //ºìµÆÉÁË¸10´Î 1Hz
	LM_Red_2HZ_10T,           //ºìµÆÉÁË¸10´Î 2Hz
	LM_RedBlue_1HZ_1T,       //ºìÀ¶½»ÌæÉÁË¸1´Î 1Hz 
} LedMode;
//---------------------------------------------------------------------------------
extern WorkMode				gFun_workMode;
extern u8  					gFun_workTimeCntFor1s;
extern u16 					gFun_workTimeCnt;
extern u8  					gFun_adcIndex;
extern u8  					gFun_adcChIndex;
extern u16 					gFun_adcBuffer;
extern u16 					gFun_adcBufferSum;
extern u16					gFun_adCurrent;
extern u16					gFun_adBatVol;
extern u8  					gFun_batVolState;
extern u8  					gFun_motoCurrState;
extern u8  					gFun_adcDealDelay;
extern u8  					gFun_ocpTimeCnt;
extern u8  					gFun_ucpTimeCnt;
			
extern u8  					gFun_keyTimeCnt;
extern u8  					gFun_keyIdleCnt;

extern ChrState				gFun_chrState;
extern u8					gFun_cupchrCodeBuff;
extern u8					gFun_cupchrCode;
extern u8					gFun_cupchrState;
extern u8					gFun_cupchrTimeCnt;

extern u8					gFun_ledCnt_1hz;
extern u8					gFun_ledCnt_2hz;
extern LedMode				gFun_ledMode;
extern u16					gFun_ledTimeCnt;
extern u16					gFun_ledStopCnt;
//---------------------------------------------------------------------------------

#endif //__GLOBAL__H
