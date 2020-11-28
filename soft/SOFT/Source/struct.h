#ifndef _struct_h_
#define _struct_h_
#include "base.h"
//-----------------------------------------------------------------------------
typedef struct 
{
    u8    index;
    u8    chAisle;
    u8    chIndex;
    u16   adcBuffer;
    u16   adcBufferTemp;
    u8    quantity;
    u16   batTotal;
    u16   batV1;
    u16   batV2;
    u16   batILoad;
    u16   batChar;
    u16   batCharBank;
    u8    adcpwmDuty;
    u8    pwmDuty;
    u16   aVolTemp;
    u8    volCnt;
    u16   aVolBank;
}_ADC;
extern _ADC adc;
//-----------------------------------------------------------------------------
typedef struct 
{
    u8 sw1Temp;
    u8 sw1Index;
    u8 sw2Temp;
    u8 sw2Index;
    u8 testmpp;
}_KEY;
extern _KEY key;
//-----------------------------------------------------------------------------
typedef struct 
{
    u16    sw1Cnt;
    u16    sw2Cnt;
    u16    stanbyCnt;
    u16    work;
    u16    workStopCnt;
    u16    ledStopTime;
    u16    ledStopCnt;
    u16    low6_4v3sCnt;
}_TIMER;
extern _TIMER timer;
//-----------------------------------------------------------------------------
typedef struct 
{
    u8   flicker1hzCnt;
    u8   flicker2hzCnt;
    u8   tempBank;
}_LED;
extern _LED led;
//-----------------------------------------------------------------------------
typedef struct 
{
    u8    inWorkIndex;
    u8    motorLock;
}_WORK;
extern _WORK work;
//-----------------------------------------------------------------------------
typedef struct 
{
    u8 pwmValue;
    u8 pwmCycle;

}_SOFT;
extern _SOFT soft;
//-----------------------------------------------------------------------------

#endif // !
