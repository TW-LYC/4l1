/* Copyright (c) all rights reserved
*******************************************************************************
* @file    var_define.h
* @author  wangxq
* @version v1.0.1
* @date    2020-04-28
* @brief   
*******************************************************************************
* @attention
*
* #include "var_define.h"
*
*******************************************************************************
*/

#ifdef MAIN_FILE
	#define EXTERN
#else
	#define EXTERN extern
#endif

//------------------------------------------------------------------------------Var define start
EXTERN bit 			gbTime10ms;
EXTERN __V 			u8 gTimeCntFor10ms;

EXTERN __V bit 		gIsCupOk;
EXTERN __V bit 		gbCupEvent;
EXTERN __V bit 		gbLedWait; 
EXTERN __V bit 		gbOcp; 
EXTERN __V bit 		gbUcp;
EXTERN __V bit 		gbUsbPlugIn;
EXTERN __V bit 		gbUsbPlugInEvent;
EXTERN __V bit 		gbBatCharge;
EXTERN __V bit 		gIsCharging;
EXTERN __V bit 		gbitChrPwmDuty;
EXTERN bit 			gbKeyClick;
EXTERN bit 			gbKeyDouClick;
EXTERN bit 			gbWorkLowVol;

EXTERN _WorkMode		workMode;
EXTERN u8			gFun_workTimeCntFor1s;
EXTERN u16 			gFun_workTimeCnt;
EXTERN u8  			gFun_adcIndex;
EXTERN u8  			gFun_adcChIndex;
EXTERN u8  			gFun_adcCh;
EXTERN u16 			gFun_adcBuffer;
EXTERN u16 			gFun_adcBufferSum;
EXTERN u16			gFun_adBatCur;
EXTERN u16			gFun_adBatVol;
EXTERN u16			gFun_adChrCur;
EXTERN u16			gFun_adMidVol2;
EXTERN u16			gFun_adMidVol3;
EXTERN u16			gFun_chrBatCur;
EXTERN u16			gFun_chrUsbCur;
EXTERN u16			gFun_batCur;
EXTERN u16			gFun_batVol;
EXTERN u16			gFun_batMidVol;
EXTERN u16			gFun_batMidVol2;
EXTERN u16			gFun_batMidVol3;
EXTERN u8  			gFun_batVolState;
EXTERN u8  			gFun_motoCurrState;
EXTERN u8  			gFun_adcDealDelay;
EXTERN u8  			gFun_ocpTimeCnt;
EXTERN u8  			gFun_ucpTimeCnt;

EXTERN u8  			gFun_keyTimeCnt;
EXTERN u8  			gFun_keyIdleCnt;
EXTERN u8			gFun_cupUsbCodeBuff;
EXTERN u8			gFun_cupUsbCode;
EXTERN u8			gFun_cupUsbState;
EXTERN u8			gFun_cupUsbTimeCnt;

EXTERN u8			gFun_ledCnt_1hz;
EXTERN u8			gFun_ledCnt_2hz;
EXTERN _LedMode		ledMode;
EXTERN u16			gFun_ledTimeCnt;
EXTERN u16			gFun_ledStopCnt;
EXTERN ChrState		gBat_chrState;
EXTERN u16			gBat_chrPwmDuty;
EXTERN u16			gBat_chrPwmAimCur;	//充电目标电流
EXTERN u8			gBat_chrPwmDelayCnt; 
EXTERN u8 			gBat_chrPwmDelay;
EXTERN u8 			gBat_chrCvDelayCnt;
//------------------------------------------------------------------------------Var define end

