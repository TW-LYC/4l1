/* Copyright (c) all rights reserved
*******************************************************************************
* @file    base.h
* @author  wangxq
* @version v1.0.1
* @date    2019-12-20
* @brief   
*******************************************************************************
* @attention
*
* #include "base.h"
*
*******************************************************************************
*/

#ifndef __BASE__H
#define __BASE__H

typedef unsigned char 	uchar;
typedef unsigned short 	ushort;
typedef unsigned int 	uint;
typedef unsigned long 	ulong;

typedef signed long 					s32;
typedef signed short 					s16;
typedef signed char 					s8;
#if defined(__C51__) || defined(__CX51__) 
typedef signed long code 				sc32; 	/* Read Only */
typedef signed short code 				sc16; 	/* Read Only */
typedef signed char code 				sc8; 	/* Read Only */
#else
typedef signed long const 				sc32; 	/* Read Only */
typedef signed short const 				sc16; 	/* Read Only */
typedef signed char const 				sc8; 	/* Read Only */
#endif
typedef volatile signed long 			vs32;
typedef volatile signed short 			vs16;
typedef volatile signed char 			vs8;

#if defined(__C51__) || defined(__CX51__) 
typedef volatile signed long code		vsc32; 	/* Read Only */
typedef volatile signed short code 		vsc16; 	/* Read Only */
typedef volatile signed char code		vsc8; 	/* Read Only */
#else
typedef volatile signed long const		vsc32; 	/* Read Only */
typedef volatile signed short const 	vsc16; 	/* Read Only */
typedef volatile signed char const		vsc8; 	/* Read Only */
#endif
typedef unsigned long 					u32;
typedef unsigned short 					u16;
typedef unsigned char 					u8;
#if defined(__C51__) || defined(__CX51__) 
typedef unsigned long code 				uc32; 	/* Read Only */
typedef unsigned short code 			uc16; 	/* Read Only */
typedef unsigned char code 				uc8; 	/* Read Only */
#else
typedef unsigned long const 			uc32; 	/* Read Only */
typedef unsigned short const 			uc16; 	/* Read Only */
typedef unsigned char const 			uc8; 	/* Read Only */
#endif
typedef volatile unsigned long 			vu32;
typedef volatile unsigned short 		vu16;
typedef volatile unsigned char 			vu8;
#if defined(__C51__) || defined(__CX51__) 
typedef volatile unsigned long code 	vuc32; 	/* Read Only */
typedef volatile unsigned short code	vuc16; 	/* Read Only */
typedef volatile unsigned char code 	vuc8; 	/* Read Only */
#else
typedef volatile unsigned long const 	vuc32; 	/* Read Only */
typedef volatile unsigned short const	vuc16; 	/* Read Only */
typedef volatile unsigned char const 	vuc8; 	/* Read Only */
#endif

typedef u8  uint8;
typedef u16 uint16;
typedef u32 uint32;
typedef s8  int8;
typedef s16 int16;
typedef s32 int32;

#ifdef uint8_t
#undef uint8_t
#endif
#ifdef uint16_t
#undef uint16_t
#endif
#ifdef uint32_t
#undef uint32_t
#endif
#ifdef int8_t
#undef int8_t
#endif
#ifdef int16_t
#undef int16_t
#endif
#ifdef int32_t
#undef int32_t
#endif

typedef u8  uint8_t;
typedef u16 uint16_t;
typedef u32 uint32_t;
typedef s8  int8_t;    
typedef s16 int16_t;
typedef s32 int32_t;

#define __V		volatile
#define __I
#define __IO

#define U8_MAX     (255)
#define S8_MAX     (127)
#define S8_MIN     (-128)
#define U16_MAX    (65535u)
#define S16_MAX    (32767)
#define S16_MIN    (-32768)
#define U32_MAX    (4294967295uL)
#define S32_MAX    (2147483647)
#define S32_MIN    (-2147483648uL)



typedef enum	//布尔型
{
	FALSE = 0,
	TRUE = !FALSE
} bool;

typedef enum 	//标志位状态类型
{
	RESET = 0,
	SET = !RESET
} FlagStatus;

typedef enum	//功能状态类型
{
	DISABLE = 0,
	ENABLE = !DISABLE
} FunctionalState;

typedef enum	//错误状态类型
{
	ERROR = 0,
	SUCCESS = !ERROR
} ErrorStatus;



//通用位操作宏
#define BIT_SET_1(p,n) 			(p) |= (1<<n);
#define BIT_SET_0(p,n)			(p) &= (~(1<<n));
#define BIT_SET(p,n,b)			(p) = b ? ((p) | (1<<n)) : ((p) &= (~(1<<n)));
#define BIT_SET_1_EQU(p,n) 		(p) | (1<<n);
#define BIT_SET_0_EQU(p,n)		(p) &(~(1<<n));
#define BIT_SET_EQU(p,n,b)		b ? ((p) | (1<<n)) : ((p) &= (~(1<<n)));

#define BGET(b,n,v)     		((b >> n) & 1)
#define BSET(b,n,v)     		b = v ? (b | (1<<n)):(b & (~(1<<n)));

#define B0_H	0X01
#define B1_H	0X02
#define B2_H	0X04
#define B3_H	0X08
#define B4_H	0X10
#define B5_H	0X20
#define B6_H	0X40
#define B7_H	0X80
#define B0_L	0XFE
#define B1_L	0XFD
#define B2_L	0XFB
#define B3_L	0XF7
#define B4_L	0XEF
#define B5_L	0XDF
#define B6_L	0XBF
#define B7_L	0X7F

#define MK_U16(vh,vl)	((((u16)(vh))<<8)|(vl))
#define HIBYTE(w) ((u8)((w)>>8))
#define LOBYTE(w) ((u8)((w)&0X00FF))

#define MAX(A,B) ((A)>(B)?(A):(B)) 
#define MIN(A,B) ((A)<(B)?(A):(B))

#define CALL_ADDR(addr) (*((void (*)())addr))()	//LCall addr;

//---

typedef union
{
	struct
	{
		u8 h1:4;
		u8 h2:4;
	} hex;
	u8 num;
} HEX_U8;

typedef union
{
	struct
	{
		u8 h3:4;
		u8 h4:4;
		u8 h1:4;
		u8 h2:4;
	} hex;
	struct
	{
		u8 b2; //0-7H
        u8 b1; //0-7L
	} byte;
	u8 bytes[2];
	u16 num;
} HEX_U16;

typedef union
{
	struct
	{
		u8 h7:4;
		u8 h8:4;
		u8 h5:4;
		u8 h6:4;
		u8 h3:4;
		u8 h4:4;
		u8 h1:4;
		u8 h2:4;
	} hex;
	struct
	{
		u8 b4; //0-7H
        u8 b3; //0-7L
		u8 b2; //0-7H
        u8 b1; //0-7L
	} byte;
	u8 bytes[4];
	u32 num;
} HEX_U32;


typedef union
{
	struct
	{
		u8 b0:1;
		u8 b1:1;
		u8 b2:1;
		u8 b3:1;
		u8 b4:1;
		u8 b5:1;
		u8 b6:1;
		u8 b7:1;
	} bits;
	u8 allBits;
} FLAGS8;

typedef union
{
	struct
	{
		u8 H; //0-7H
        u8 L; //0-7L
	} byte;
    struct
	{
		u8 b8:1;
		u8 b9:1;
		u8 b10:1;
		u8 b11:1;
		u8 b12:1;
		u8 b13:1;
		u8 b14:1;
		u8 b15:1;
        u8 b0:1;
		u8 b1:1;
		u8 b2:1;
		u8 b3:1;
		u8 b4:1;
		u8 b5:1;
		u8 b6:1;
		u8 b7:1;
	} bits;
	u16 allBits;
} FLAGS16;

#define LONG_TO_BIN(n)      \
(                           \
    ((n >> 21) & 0X80) |    \
    ((n >> 18) & 0X40) |    \
    ((n >> 15) & 0X20) |    \
    ((n >> 12) & 0X10) |    \
    ((n >> 9) & 0X08)  |    \
    ((n >> 6) & 0X04)  |    \
    ((n >> 3) & 0X02)  |    \
    ((n ) & 0X01)           \
)

#define BIN(n) LONG_TO_BIN(0X##n##l)

#define     DELAY_10T()     \
{                           \
    _nop_();                \
    _nop_();                \
    _nop_();                \
    _nop_();                \
    _nop_();                \
    _nop_();                \
    _nop_();                \
    _nop_();                \
    _nop_();                \
    _nop_();                \
}

#define     DELAY_5T()      \
{                           \
    _nop_();                \
    _nop_();                \
    _nop_();                \
    _nop_();                \
    _nop_();                \
}

// 8M/0.125us ///5uS=40T
#define     DELAY_5US()     \
{                           \
    DELAY_10T()				\
    DELAY_10T()				\
    DELAY_10T()				\
    DELAY_10T()				\
}

#define PTR8(p)  ((u8*)p)
#define PTR16(p) ((u16*)p)
#define PTR32(p) ((u32*)p)

#define VAL8(p) (*((u8*)p))
#define VAL16(p) (*((u16*)p))
#define VAL32(p) (*((u32*)p))

//bit operations 
#define REG32(addr)					(*(volatile u32 *)(u32)(addr))
#define REG16(addr)					(*(volatile u16 *)(u32)(addr))
#define REG8(addr) 					(*(volatile u8 *)(u32)(addr))
//#define BIT32(x)					((u32)((u32)0x01U<<(x)))
//#define BIT16(x)					((u16)((u16)0x01U<<(x)))
//#define BIT8(x)					((u8)((u8)0x01U<<(x)))


#define BITS(start, end)			((0xFFFFFFFFUL << (start)) & (0xFFFFFFFFUL >> (31U - (u32)(end)))) 
#define BITS32(start, end)			((u32)BITS(start, end))
#define BITS16(start, end)			((u16)BITS(start, end))
#define BITS8(start, end)			((u8)BITS(start, end))
#define GET_BITS32(regval, start, end) (((regval) & BITS32((start),(end))) >> (start))
#define GET_BITS16(regval, start, end) (((regval) & BITS16((start),(end))) >> (start))
#define GET_BITS8(regval, start, end) (((regval) & BITS8((start),(end))) >> (start))

#define MASK8(start,end)			((((u8)0xFF)<<(start)) & (((u8)0xFF)>>(7-(end))))
#define MASK16(start,end)			((((u16)0xFFFF)<<(start)) & (((u16)0xFFFF)>>(15-(end))))
#define MASK32(start,end)			((((u32)0xFFFFFFFF)<<(start)) & (((u32)0xFFFFFFFF)>>(31-(end))))

#endif //__BASE__H

