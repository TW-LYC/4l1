opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F685
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_MCU_Init
	FNCALL	_main,_FUN_Init
	FNCALL	_main,_KEY_Driver
	FNCALL	_main,_CUP_CHR_Driver
	FNCALL	_main,_FUN_Driver
	FNCALL	_main,_ADC_Driver
	FNCALL	_main,_ADC_Deal
	FNCALL	_main,_LED_Display
	FNCALL	_main,_MOTO_Driver
	FNCALL	_FUN_Driver,_FUN_EnterStandby
	FNCALL	_FUN_Driver,_LED_SetMode
	FNCALL	_FUN_Driver,_FUN_EnterWorkMode
	FNCALL	_FUN_Driver,_MCU_EnterSleep
	FNCALL	_ADC_Driver,_GetAd
	FNCALL	_MCU_EnterSleep,_MCU_SleepConfig
	FNCALL	_MCU_EnterSleep,_DelayUs
	FNCALL	_MCU_SleepConfig,_DelayUs
	FNCALL	_GetAd,_DelayUs
	FNCALL	_CUP_CHR_Driver,_DelayUs
	FNCALL	_MCU_Init,_CLK_Init
	FNCALL	_MCU_Init,_TIM_Init
	FNCALL	_MCU_Init,_ADC_Init
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_gFun_adBatVol
	global	_gFun_adCurrent
	global	_gFun_adcBuffer
	global	_gFun_adcBufferSum
	global	_gFun_ledStopCnt
	global	_gFun_ledTimeCnt
	global	_gFun_workTimeCnt
	global	_bakPORTA
	global	_gFun_adcChIndex
	global	_gFun_adcDealDelay
	global	_gFun_adcIndex
	global	_gFun_batVolState
	global	_gFun_chrState
	global	_gFun_cupchrCodeBuff
	global	_gFun_cupchrTimeCnt
	global	_gFun_keyTimeCnt
	global	_gFun_ledCnt_1hz
	global	_gFun_ledCnt_2hz
	global	_gFun_ledMode
	global	_gFun_ocpTimeCnt
	global	_gFun_ucpTimeCnt
	global	_gFun_workTimeCntFor1s
	global	_gTimeCntFor10ms
	global	_gFun_workMode
	global	_bTime10ms
	global	_bkeyBuff
	global	_bkeyCode
	global	_bkeyDou
	global	_bkeyTemp
	global	_bkeyUp
	global	_gIsCupOk
	global	_gbCupEvent
	global	_gbKeyClick
	global	_gbKeyDouClick
	global	_gbLed1hz
	global	_gbLed2hz
	global	_gbLedEnd
	global	_gbLedWait
	global	_gbOcp
	global	_gbUcp
	global	_PSTRCON
psect	text600,local,class=CODE,delta=2
global __ptext600
__ptext600:
_PSTRCON	set	413
	DABS	1,413,1	;_PSTRCON

	global	_SRCON
_SRCON	set	414
	DABS	1,414,1	;_SRCON

	global	_C1SEN
_C1SEN	set	3317
	DABS	1,414,1	;_C1SEN

	global	_C2REN
_C2REN	set	3316
	DABS	1,414,1	;_C2REN

	global	_EEPGD
_EEPGD	set	3175
	DABS	1,396,1	;_EEPGD

	global	_PULSR
_PULSR	set	3314
	DABS	1,414,1	;_PULSR

	global	_PULSS
_PULSS	set	3315
	DABS	1,414,1	;_PULSS

	global	_SR0
_SR0	set	3318
	DABS	1,414,1	;_SR0

	global	_SR1
_SR1	set	3319
	DABS	1,414,1	;_SR1

	global	_STRA
_STRA	set	3304
	DABS	1,413,1	;_STRA

	global	_STRB
_STRB	set	3305
	DABS	1,413,1	;_STRB

	global	_STRC
_STRC	set	3306
	DABS	1,413,1	;_STRC

	global	_STRD
_STRD	set	3307
	DABS	1,413,1	;_STRD

	global	_STRSYNC
_STRSYNC	set	3308
	DABS	1,413,1	;_STRSYNC

	global	_WREN
_WREN	set	3170
	DABS	1,396,1	;_WREN

	global	_gFun_keyIdleCnt
psect	nvBANK0,class=BANK0,space=1
global __pnvBANK0
__pnvBANK0:
_gFun_keyIdleCnt:
       ds      1

	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_CMCON0
_CMCON0	set	25
	global	_INTCON
_INTCON	set	11
	global	_MSCKCON
_MSCKCON	set	27
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_T2CON
_T2CON	set	18
	global	_TMR2
_TMR2	set	17
	global	_ADON
_ADON	set	248
	global	_GIE
_GIE	set	95
	global	_GO_DONE
_GO_DONE	set	249
	global	_PAIE
_PAIE	set	91
	global	_PAIF
_PAIF	set	88
	global	_PEIE
_PEIE	set	94
	global	_RA0
_RA0	set	40
	global	_RA1
_RA1	set	41
	global	_RA2
_RA2	set	42
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_TMR2IF
_TMR2IF	set	97
	global	_TMR2ON
_TMR2ON	set	146
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_ANSEL
_ANSEL	set	145
	global	_IOCA
_IOCA	set	150
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_PR2
_PR2	set	146
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WPUA
_WPUA	set	149
	global	_WPUC
_WPUC	set	136
	global	_IOCA0
_IOCA0	set	1200
	global	_IOCA1
_IOCA1	set	1201
	global	_IOCA2
_IOCA2	set	1202
	global	_IOCA3
_IOCA3	set	1203
	global	_TMR2IE
_TMR2IE	set	1121
	file	"ft61f02x.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_bTime10ms:
       ds      1

_bkeyBuff:
       ds      1

_bkeyCode:
       ds      1

_bkeyDou:
       ds      1

_bkeyTemp:
       ds      1

_bkeyUp:
       ds      1

_gIsCupOk:
       ds      1

_gbCupEvent:
       ds      1

_gbKeyClick:
       ds      1

_gbKeyDouClick:
       ds      1

_gbLed1hz:
       ds      1

_gbLed2hz:
       ds      1

_gbLedEnd:
       ds      1

_gbLedWait:
       ds      1

_gbOcp:
       ds      1

_gbUcp:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_gFun_workMode:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_gFun_adBatVol:
       ds      2

_gFun_adCurrent:
       ds      2

_gFun_adcBuffer:
       ds      2

_gFun_adcBufferSum:
       ds      2

_gFun_ledStopCnt:
       ds      2

_gFun_ledTimeCnt:
       ds      2

_gFun_workTimeCnt:
       ds      2

_bakPORTA:
       ds      1

_gFun_adcChIndex:
       ds      1

_gFun_adcDealDelay:
       ds      1

_gFun_adcIndex:
       ds      1

_gFun_batVolState:
       ds      1

_gFun_chrState:
       ds      1

_gFun_cupchrCodeBuff:
       ds      1

_gFun_cupchrTimeCnt:
       ds      1

_gFun_keyTimeCnt:
       ds      1

_gFun_ledCnt_1hz:
       ds      1

_gFun_ledCnt_2hz:
       ds      1

_gFun_ledMode:
       ds      1

_gFun_ocpTimeCnt:
       ds      1

_gFun_ucpTimeCnt:
       ds      1

_gFun_workTimeCntFor1s:
       ds      1

_gTimeCntFor10ms:
       ds      1

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
	clrf	((__pbitbssCOMMON/8)+1)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+01Eh)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_MCU_SleepConfig
?_MCU_SleepConfig:	; 0 bytes @ 0x0
	global	?_MCU_Init
?_MCU_Init:	; 0 bytes @ 0x0
	global	?_MOTO_Driver
?_MOTO_Driver:	; 0 bytes @ 0x0
	global	?_DelayUs
?_DelayUs:	; 0 bytes @ 0x0
	global	?_CUP_CHR_Driver
?_CUP_CHR_Driver:	; 0 bytes @ 0x0
	global	?_MCU_EnterSleep
?_MCU_EnterSleep:	; 0 bytes @ 0x0
	global	?_KEY_Driver
?_KEY_Driver:	; 0 bytes @ 0x0
	global	?_ADC_Driver
?_ADC_Driver:	; 0 bytes @ 0x0
	global	?_ADC_Deal
?_ADC_Deal:	; 0 bytes @ 0x0
	global	?_FUN_Init
?_FUN_Init:	; 0 bytes @ 0x0
	global	?_LED_SetMode
?_LED_SetMode:	; 0 bytes @ 0x0
	global	?_LED_Display
?_LED_Display:	; 0 bytes @ 0x0
	global	?_FUN_EnterStandby
?_FUN_EnterStandby:	; 0 bytes @ 0x0
	global	?_FUN_EnterWorkMode
?_FUN_EnterWorkMode:	; 0 bytes @ 0x0
	global	?_FUN_Driver
?_FUN_Driver:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_CLK_Init
?_CLK_Init:	; 0 bytes @ 0x0
	global	?_TIM_Init
?_TIM_Init:	; 0 bytes @ 0x0
	global	?_ADC_Init
?_ADC_Init:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	ds	2
	global	??_MCU_Init
??_MCU_Init:	; 0 bytes @ 0x2
	global	??_MOTO_Driver
??_MOTO_Driver:	; 0 bytes @ 0x2
	global	??_DelayUs
??_DelayUs:	; 0 bytes @ 0x2
	global	??_KEY_Driver
??_KEY_Driver:	; 0 bytes @ 0x2
	global	??_ADC_Deal
??_ADC_Deal:	; 0 bytes @ 0x2
	global	??_FUN_Init
??_FUN_Init:	; 0 bytes @ 0x2
	global	??_LED_SetMode
??_LED_SetMode:	; 0 bytes @ 0x2
	global	??_LED_Display
??_LED_Display:	; 0 bytes @ 0x2
	global	??_FUN_EnterStandby
??_FUN_EnterStandby:	; 0 bytes @ 0x2
	global	??_FUN_EnterWorkMode
??_FUN_EnterWorkMode:	; 0 bytes @ 0x2
	global	??_CLK_Init
??_CLK_Init:	; 0 bytes @ 0x2
	global	??_TIM_Init
??_TIM_Init:	; 0 bytes @ 0x2
	global	??_ADC_Init
??_ADC_Init:	; 0 bytes @ 0x2
	global	DelayUs@time
DelayUs@time:	; 1 bytes @ 0x2
	global	LED_SetMode@mode
LED_SetMode@mode:	; 1 bytes @ 0x2
	ds	1
	global	??_MCU_SleepConfig
??_MCU_SleepConfig:	; 0 bytes @ 0x3
	global	??_CUP_CHR_Driver
??_CUP_CHR_Driver:	; 0 bytes @ 0x3
	global	?_GetAd
?_GetAd:	; 2 bytes @ 0x3
	global	CUP_CHR_Driver@cupchrStateCode
CUP_CHR_Driver@cupchrStateCode:	; 1 bytes @ 0x3
	global	MCU_SleepConfig@isSleep
MCU_SleepConfig@isSleep:	; 1 bytes @ 0x3
	ds	1
	global	??_MCU_EnterSleep
??_MCU_EnterSleep:	; 0 bytes @ 0x4
	global	??_FUN_Driver
??_FUN_Driver:	; 0 bytes @ 0x4
	ds	1
	global	??_GetAd
??_GetAd:	; 0 bytes @ 0x5
	global	??_ADC_Driver
??_ADC_Driver:	; 0 bytes @ 0x5
	global	??_main
??_main:	; 0 bytes @ 0x5
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	GetAd@ch
GetAd@ch:	; 1 bytes @ 0x0
	ds	1
	global	GetAd@tBuffer
GetAd@tBuffer:	; 2 bytes @ 0x1
	ds	2
	global	GetAd@ADCON0Buff
GetAd@ADCON0Buff:	; 1 bytes @ 0x3
	ds	1
	global	GetAd@ADC_DATA
GetAd@ADC_DATA:	; 2 bytes @ 0x4
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 31, persistent 1 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5       8
;; BANK0           80      6      37
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; ?_GetAd	unsigned short  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _ADC_Driver->_GetAd
;;   _MCU_EnterSleep->_MCU_SleepConfig
;;   _MCU_SleepConfig->_DelayUs
;;   _GetAd->_DelayUs
;;   _CUP_CHR_Driver->_DelayUs
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _ADC_Driver->_GetAd
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0     571
;;                           _MCU_Init
;;                           _FUN_Init
;;                         _KEY_Driver
;;                     _CUP_CHR_Driver
;;                         _FUN_Driver
;;                         _ADC_Driver
;;                           _ADC_Deal
;;                        _LED_Display
;;                        _MOTO_Driver
;; ---------------------------------------------------------------------------------
;; (1) _FUN_Driver                                           0     0      0     247
;;                   _FUN_EnterStandby
;;                        _LED_SetMode
;;                  _FUN_EnterWorkMode
;;                     _MCU_EnterSleep
;; ---------------------------------------------------------------------------------
;; (1) _ADC_Driver                                           0     0      0     185
;;                              _GetAd
;; ---------------------------------------------------------------------------------
;; (2) _MCU_EnterSleep                                       0     0      0      93
;;                    _MCU_SleepConfig
;;                            _DelayUs
;; ---------------------------------------------------------------------------------
;; (3) _MCU_SleepConfig                                      1     1      0      62
;;                                              3 COMMON     1     1      0
;;                            _DelayUs
;; ---------------------------------------------------------------------------------
;; (2) _GetAd                                                9     7      2     185
;;                                              3 COMMON     2     0      2
;;                                              0 BANK0      6     6      0
;;                            _DelayUs
;; ---------------------------------------------------------------------------------
;; (1) _CUP_CHR_Driver                                       1     1      0     139
;;                                              3 COMMON     1     1      0
;;                            _DelayUs
;; ---------------------------------------------------------------------------------
;; (1) _MCU_Init                                             0     0      0       0
;;                           _CLK_Init
;;                           _TIM_Init
;;                           _ADC_Init
;; ---------------------------------------------------------------------------------
;; (3) _DelayUs                                              1     1      0      31
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _ADC_Init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _TIM_Init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _CLK_Init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _MOTO_Driver                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _FUN_EnterWorkMode                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _FUN_EnterStandby                                     0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _LED_Display                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _LED_SetMode                                          1     1      0     154
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _FUN_Init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _ADC_Deal                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _KEY_Driver                                           1     1      0       0
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _ISR                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _MCU_Init
;;     _CLK_Init
;;     _TIM_Init
;;     _ADC_Init
;;   _FUN_Init
;;   _KEY_Driver
;;   _CUP_CHR_Driver
;;     _DelayUs
;;   _FUN_Driver
;;     _FUN_EnterStandby
;;     _LED_SetMode
;;     _FUN_EnterWorkMode
;;     _MCU_EnterSleep
;;       _MCU_SleepConfig
;;         _DelayUs
;;       _DelayUs
;;   _ADC_Driver
;;     _GetAd
;;       _DelayUs
;;   _ADC_Deal
;;   _LED_Display
;;   _MOTO_Driver
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       2       0       14.3%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      5       8       1       57.1%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50      6      25       4       46.3%
;;BITBANK1            20      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BANK1               20      0       0       6        0.0%
;;ABS                  0      0      2D       7        0.0%
;;DATA                 0      0      31       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 17 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_MCU_Init
;;		_FUN_Init
;;		_KEY_Driver
;;		_CUP_CHR_Driver
;;		_FUN_Driver
;;		_ADC_Driver
;;		_ADC_Deal
;;		_LED_Display
;;		_MOTO_Driver
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"main.c"
	line	17
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	18
	
l7962:	
;main.c: 18: MCU_Init();
	fcall	_MCU_Init
	line	19
;main.c: 19: FUN_Init();
	fcall	_FUN_Init
	line	20
	
l7964:	
;main.c: 20: GIE = 1;
	bsf	(95/8),(95)&7
	line	24
	
l7966:	
;main.c: 23: {
;main.c: 24: if (bTime10ms) {
	btfss	(_bTime10ms/8),(_bTime10ms)&7
	goto	u2611
	goto	u2610
u2611:
	goto	l7966
u2610:
	line	25
	
l7968:	
;main.c: 25: bTime10ms = 0;
	bcf	(_bTime10ms/8),(_bTime10ms)&7
	line	27
	
l7970:	
;main.c: 27: KEY_Driver();
	fcall	_KEY_Driver
	line	28
;main.c: 28: CUP_CHR_Driver();
	fcall	_CUP_CHR_Driver
	line	29
;main.c: 29: FUN_Driver();
	fcall	_FUN_Driver
	line	30
;main.c: 30: ADC_Driver();
	fcall	_ADC_Driver
	line	31
;main.c: 31: ADC_Deal();
	fcall	_ADC_Deal
	line	32
	
l7972:	
;main.c: 32: LED_Display();
	fcall	_LED_Display
	line	33
	
l7974:	
;main.c: 33: MOTO_Driver();
	fcall	_MOTO_Driver
	goto	l7966
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	36
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_FUN_Driver
psect	text601,local,class=CODE,delta=2
global __ptext601
__ptext601:

;; *************** function _FUN_Driver *****************
;; Defined at:
;;		line 531 in file "FUNCTION.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_FUN_EnterStandby
;;		_LED_SetMode
;;		_FUN_EnterWorkMode
;;		_MCU_EnterSleep
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text601
	file	"FUNCTION.C"
	line	531
	global	__size_of_FUN_Driver
	__size_of_FUN_Driver	equ	__end_of_FUN_Driver-_FUN_Driver
	
_FUN_Driver:	
	opt	stack 3
; Regs used in _FUN_Driver: [wreg+status,2+status,0+pclath+cstack]
	line	532
	
l7848:	
;FUNCTION.C: 532: if (gFun_workMode == WM_Error) {
	movf	(_gFun_workMode),f
	skipz
	goto	u2291
	goto	u2290
u2291:
	goto	l7856
u2290:
	line	533
	
l7850:	
;FUNCTION.C: 533: if (gbLedEnd) {
	btfss	(_gbLedEnd/8),(_gbLedEnd)&7
	goto	u2301
	goto	u2300
u2301:
	goto	l7854
u2300:
	line	534
	
l7852:	
;FUNCTION.C: 534: FUN_EnterStandby();
	fcall	_FUN_EnterStandby
	line	535
;FUNCTION.C: 535: } else {
	goto	l7928
	line	536
	
l7854:	
;FUNCTION.C: 536: LED_SetMode(LM_RedBlue_1HZ_1T);
	movlw	(07h)
	fcall	_LED_SetMode
	goto	l7928
	line	538
	
l7856:	
	decf	(_gFun_workMode),w
	skipz
	goto	u2311
	goto	u2310
u2311:
	goto	l7898
u2310:
	line	539
	
l7858:	
;FUNCTION.C: 539: LED_SetMode(LM_Off);
	movlw	(0)
	fcall	_LED_SetMode
	line	540
	
l7860:	
;FUNCTION.C: 540: if (gbKeyDouClick) {
	btfss	(_gbKeyDouClick/8),(_gbKeyDouClick)&7
	goto	u2321
	goto	u2320
u2321:
	goto	l7872
u2320:
	line	541
	
l7862:	
;FUNCTION.C: 541: if (gIsCupOk) {
	btfss	(_gIsCupOk/8),(_gIsCupOk)&7
	goto	u2331
	goto	u2330
u2331:
	goto	l7870
u2330:
	line	542
	
l7864:	
;FUNCTION.C: 542: if (gFun_adBatVol > ((320)*47ul*512/147/100)) {
	movlw	high(020Ch)
	subwf	(_gFun_adBatVol+1),w
	movlw	low(020Ch)
	skipnz
	subwf	(_gFun_adBatVol),w
	skipc
	goto	u2341
	goto	u2340
u2341:
	goto	l7868
u2340:
	line	543
	
l7866:	
;FUNCTION.C: 543: FUN_EnterWorkMode();
	fcall	_FUN_EnterWorkMode
	line	544
;FUNCTION.C: 544: } else {
	goto	l7872
	line	545
	
l7868:	
;FUNCTION.C: 545: LED_SetMode(LM_Red_1HZ_10T);
	movlw	(05h)
	fcall	_LED_SetMode
	goto	l7872
	line	548
	
l7870:	
;FUNCTION.C: 548: LED_SetMode(LM_Red_1HZ_3T);
	movlw	(03h)
	fcall	_LED_SetMode
	line	551
	
l7872:	
;FUNCTION.C: 549: }
;FUNCTION.C: 550: }
;FUNCTION.C: 551: if (gbCupEvent && gIsCupOk) {
	btfss	(_gbCupEvent/8),(_gbCupEvent)&7
	goto	u2351
	goto	u2350
u2351:
	goto	l7878
u2350:
	
l7874:	
	btfss	(_gIsCupOk/8),(_gIsCupOk)&7
	goto	u2361
	goto	u2360
u2361:
	goto	l7878
u2360:
	line	552
	
l7876:	
;FUNCTION.C: 552: LED_SetMode(LM_Blue_1HZ_3T);
	movlw	(04h)
	fcall	_LED_SetMode
	line	554
	
l7878:	
;FUNCTION.C: 553: }
;FUNCTION.C: 554: if(gbCupEvent && !gIsCupOk){
	btfss	(_gbCupEvent/8),(_gbCupEvent)&7
	goto	u2371
	goto	u2370
u2371:
	goto	l7884
u2370:
	
l7880:	
	btfsc	(_gIsCupOk/8),(_gIsCupOk)&7
	goto	u2381
	goto	u2380
u2381:
	goto	l7884
u2380:
	line	555
	
l7882:	
;FUNCTION.C: 555: LED_SetMode(LM_Red_1HZ_3T);
	movlw	(03h)
	fcall	_LED_SetMode
	line	557
	
l7884:	
;FUNCTION.C: 556: }
;FUNCTION.C: 557: if (gFun_chrState == 0 && gbLedWait==0&&gFun_ledMode==1) {
	movf	(_gFun_chrState),f
	skipz
	goto	u2391
	goto	u2390
u2391:
	goto	l7896
u2390:
	
l7886:	
	btfsc	(_gbLedWait/8),(_gbLedWait)&7
	goto	u2401
	goto	u2400
u2401:
	goto	l7896
u2400:
	
l7888:	
	decf	(_gFun_ledMode),w
	skipz
	goto	u2411
	goto	u2410
u2411:
	goto	l7896
u2410:
	line	558
	
l7890:	
;FUNCTION.C: 558: if (++gFun_workTimeCnt > 100*15) {
	incf	(_gFun_workTimeCnt),f
	skipnz
	incf	(_gFun_workTimeCnt+1),f
	movlw	high(05DDh)
	subwf	((_gFun_workTimeCnt+1)),w
	movlw	low(05DDh)
	skipnz
	subwf	((_gFun_workTimeCnt)),w
	skipc
	goto	u2421
	goto	u2420
u2421:
	goto	l7928
u2420:
	line	559
	
l7892:	
;FUNCTION.C: 559: gFun_workTimeCnt = 0;
	clrf	(_gFun_workTimeCnt)
	clrf	(_gFun_workTimeCnt+1)
	line	560
	
l7894:	
;FUNCTION.C: 560: MCU_EnterSleep();
	fcall	_MCU_EnterSleep
	goto	l7928
	line	563
	
l7896:	
;FUNCTION.C: 563: gFun_workTimeCnt = 0;
	clrf	(_gFun_workTimeCnt)
	clrf	(_gFun_workTimeCnt+1)
	goto	l7928
	line	565
	
l7898:	
	movf	(_gFun_workMode),w
	xorlw	02h
	skipz
	goto	u2431
	goto	u2430
u2431:
	goto	l7912
u2430:
	line	566
	
l7900:	
;FUNCTION.C: 566: LED_SetMode(LM_Blue_On);
	movlw	(02h)
	fcall	_LED_SetMode
	line	567
	
l7902:	
;FUNCTION.C: 567: if (gbKeyClick) {
	btfss	(_gbKeyClick/8),(_gbKeyClick)&7
	goto	u2441
	goto	u2440
u2441:
	goto	l7906
u2440:
	line	568
	
l7904:	
;FUNCTION.C: 568: FUN_EnterStandby();
	fcall	_FUN_EnterStandby
	line	570
	
l7906:	
;FUNCTION.C: 569: }
;FUNCTION.C: 570: if (gIsCupOk==0) {
	btfsc	(_gIsCupOk/8),(_gIsCupOk)&7
	goto	u2451
	goto	u2450
u2451:
	goto	l7928
u2450:
	line	571
	
l7908:	
;FUNCTION.C: 571: LED_SetMode(LM_Red_1HZ_3T);
	movlw	(03h)
	fcall	_LED_SetMode
	goto	l7852
	line	574
	
l7912:	
	movf	(_gFun_workMode),w
	xorlw	03h
	skipz
	goto	u2461
	goto	u2460
u2461:
	goto	l7916
u2460:
	line	575
	
l7914:	
;FUNCTION.C: 575: LED_SetMode(LM_Off);
	movlw	(0)
	fcall	_LED_SetMode
	line	576
;FUNCTION.C: 576: } else if (gFun_workMode == WM_Charge) {
	goto	l7928
	
l7916:	
	movf	(_gFun_workMode),w
	xorlw	04h
	skipz
	goto	u2471
	goto	u2470
u2471:
	goto	l7928
u2470:
	line	577
	
l7918:	
;FUNCTION.C: 577: if (gFun_chrState == CS_Charge){
	decf	(_gFun_chrState),w
	skipz
	goto	u2481
	goto	u2480
u2481:
	goto	l7922
u2480:
	line	578
	
l7920:	
;FUNCTION.C: 578: LED_SetMode(LM_Red_On);
	movlw	(01h)
	fcall	_LED_SetMode
	line	579
;FUNCTION.C: 579: } else if (gFun_chrState == CS_End){
	goto	l7928
	
l7922:	
	movf	(_gFun_chrState),w
	xorlw	02h
	skipz
	goto	u2491
	goto	u2490
u2491:
	goto	l7852
u2490:
	line	580
	
l7924:	
;FUNCTION.C: 580: LED_SetMode(LM_Blue_On);
	movlw	(02h)
	fcall	_LED_SetMode
	line	585
;FUNCTION.C: 581: } else {
	
l7928:	
;FUNCTION.C: 583: }
;FUNCTION.C: 584: }
;FUNCTION.C: 585: if (gFun_workMode != WM_Charge) {
	movf	(_gFun_workMode),w
	xorlw	04h
	skipnz
	goto	u2501
	goto	u2500
u2501:
	goto	l1328
u2500:
	line	586
	
l7930:	
;FUNCTION.C: 586: if (gFun_chrState > 0) {
	movf	(_gFun_chrState),w
	skipz
	goto	u2510
	goto	l1328
u2510:
	line	587
	
l7932:	
;FUNCTION.C: 587: gFun_workMode = WM_Charge;
	movlw	(04h)
	movwf	(_gFun_workMode)
	line	589
	
l1328:	
	line	591
;FUNCTION.C: 588: }
;FUNCTION.C: 589: }
;FUNCTION.C: 591: if (gFun_workMode == WM_Work) {
	movf	(_gFun_workMode),w
	xorlw	02h
	skipz
	goto	u2521
	goto	u2520
u2521:
	goto	l1330
u2520:
	line	592
	
l7934:	
;FUNCTION.C: 592: RA4=1;
	bsf	(44/8),(44)&7
	line	593
	
l7936:	
;FUNCTION.C: 593: if (++gFun_workTimeCntFor1s >=100) {
	movlw	(064h)
	incf	(_gFun_workTimeCntFor1s),f
	subwf	((_gFun_workTimeCntFor1s)),w
	skipc
	goto	u2531
	goto	u2530
u2531:
	goto	l7948
u2530:
	line	594
	
l7938:	
;FUNCTION.C: 594: gFun_workTimeCntFor1s = 0;
	clrf	(_gFun_workTimeCntFor1s)
	line	595
	
l7940:	
;FUNCTION.C: 595: if (gFun_workTimeCnt<65535)
	incf	(_gFun_workTimeCnt),w
	skipnz
	incf	(_gFun_workTimeCnt+1),w

	skipnz
	goto	u2541
	goto	u2540
u2541:
	goto	l7944
u2540:
	line	596
	
l7942:	
;FUNCTION.C: 596: gFun_workTimeCnt++;
	incf	(_gFun_workTimeCnt),f
	skipnz
	incf	(_gFun_workTimeCnt+1),f
	line	597
	
l7944:	
;FUNCTION.C: 597: if (gFun_workTimeCnt >= 40){
	movlw	high(028h)
	subwf	(_gFun_workTimeCnt+1),w
	movlw	low(028h)
	skipnz
	subwf	(_gFun_workTimeCnt),w
	skipc
	goto	u2551
	goto	u2550
u2551:
	goto	l7948
u2550:
	line	598
	
l7946:	
;FUNCTION.C: 598: FUN_EnterStandby();
	fcall	_FUN_EnterStandby
	line	601
	
l7948:	
;FUNCTION.C: 599: }
;FUNCTION.C: 600: }
;FUNCTION.C: 601: if (gbOcp || gbUcp || gFun_batVolState == 0) {
	btfsc	(_gbOcp/8),(_gbOcp)&7
	goto	u2561
	goto	u2560
u2561:
	goto	l1336
u2560:
	
l7950:	
	btfsc	(_gbUcp/8),(_gbUcp)&7
	goto	u2571
	goto	u2570
u2571:
	goto	l1336
u2570:
	
l7952:	
	movf	(_gFun_batVolState),f
	skipz
	goto	u2581
	goto	u2580
u2581:
	goto	l1340
u2580:
	
l1336:	
	line	602
;FUNCTION.C: 602: if (gbOcp) {
	btfss	(_gbOcp/8),(_gbOcp)&7
	goto	u2591
	goto	u2590
u2591:
	goto	l7956
u2590:
	line	603
	
l7954:	
;FUNCTION.C: 603: LED_SetMode(LM_Red_2HZ_10T);
	movlw	(06h)
	fcall	_LED_SetMode
	line	604
;FUNCTION.C: 604: } else {
	goto	l7960
	line	605
	
l7956:	
;FUNCTION.C: 605: if (gFun_batVolState == 0){
	movf	(_gFun_batVolState),f
	skipz
	goto	u2601
	goto	u2600
u2601:
	goto	l7960
u2600:
	line	606
	
l7958:	
;FUNCTION.C: 606: LED_SetMode(LM_Red_1HZ_10T);
	movlw	(05h)
	fcall	_LED_SetMode
	line	609
	
l7960:	
;FUNCTION.C: 607: }
;FUNCTION.C: 608: }
;FUNCTION.C: 609: FUN_EnterStandby();
	fcall	_FUN_EnterStandby
	goto	l1340
	line	612
	
l1330:	
	line	613
;FUNCTION.C: 613: RA4=0;
	bcf	(44/8),(44)&7
	line	614
	
l1340:	
	line	616
;FUNCTION.C: 614: }
;FUNCTION.C: 616: gbLedEnd = 0;
	bcf	(_gbLedEnd/8),(_gbLedEnd)&7
	line	617
;FUNCTION.C: 617: gbCupEvent = 0;
	bcf	(_gbCupEvent/8),(_gbCupEvent)&7
	line	618
;FUNCTION.C: 618: gbKeyClick = 0;
	bcf	(_gbKeyClick/8),(_gbKeyClick)&7
	line	619
;FUNCTION.C: 619: gbKeyDouClick = 0;
	bcf	(_gbKeyDouClick/8),(_gbKeyDouClick)&7
	line	620
	
l1341:	
	return
	opt stack 0
GLOBAL	__end_of_FUN_Driver
	__end_of_FUN_Driver:
;; =============== function _FUN_Driver ends ============

	signat	_FUN_Driver,88
	global	_ADC_Driver
psect	text602,local,class=CODE,delta=2
global __ptext602
__ptext602:

;; *************** function _ADC_Driver *****************
;; Defined at:
;;		line 271 in file "FUNCTION.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_GetAd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text602
	file	"FUNCTION.C"
	line	271
	global	__size_of_ADC_Driver
	__size_of_ADC_Driver	equ	__end_of_ADC_Driver-_ADC_Driver
	
_ADC_Driver:	
	opt	stack 4
; Regs used in _ADC_Driver: [wreg+status,2+status,0+pclath+cstack]
	line	272
	
l7820:	
;FUNCTION.C: 272: if (gFun_adcChIndex == 0) {
	movf	(_gFun_adcChIndex),f
	skipz
	goto	u2251
	goto	u2250
u2251:
	goto	l7824
u2250:
	line	273
	
l7822:	
;FUNCTION.C: 273: gFun_adcBuffer = GetAd(4);
	movlw	(04h)
	fcall	_GetAd
	movf	(1+(?_GetAd)),w
	movwf	(_gFun_adcBuffer+1)
	movf	(0+(?_GetAd)),w
	movwf	(_gFun_adcBuffer)
	line	274
;FUNCTION.C: 274: } else {
	goto	l7826
	line	275
	
l7824:	
;FUNCTION.C: 275: gFun_adcBuffer = GetAd(5);
	movlw	(05h)
	fcall	_GetAd
	movf	(1+(?_GetAd)),w
	movwf	(_gFun_adcBuffer+1)
	movf	(0+(?_GetAd)),w
	movwf	(_gFun_adcBuffer)
	line	277
	
l7826:	
;FUNCTION.C: 276: }
;FUNCTION.C: 277: gFun_adcBufferSum += gFun_adcBuffer;
	movf	(_gFun_adcBuffer),w
	addwf	(_gFun_adcBufferSum),f
	skipnc
	incf	(_gFun_adcBufferSum+1),f
	movf	(_gFun_adcBuffer+1),w
	addwf	(_gFun_adcBufferSum+1),f
	line	278
	
l7828:	
;FUNCTION.C: 278: if (++gFun_adcIndex >= 64) {
	movlw	(040h)
	incf	(_gFun_adcIndex),f
	subwf	((_gFun_adcIndex)),w
	skipc
	goto	u2261
	goto	u2260
u2261:
	goto	l1221
u2260:
	line	279
	
l7830:	
;FUNCTION.C: 279: gFun_adcIndex = 0;
	clrf	(_gFun_adcIndex)
	line	280
	
l7832:	
;FUNCTION.C: 280: gFun_adcBuffer = gFun_adcBufferSum>>6;
	movf	(_gFun_adcBufferSum+1),w
	movwf	(_gFun_adcBuffer+1)
	movf	(_gFun_adcBufferSum),w
	movwf	(_gFun_adcBuffer)
	
l7834:	
	movlw	06h
	
u2275:
	clrc
	rrf	(_gFun_adcBuffer+1),f
	rrf	(_gFun_adcBuffer),f
	addlw	-1
	skipz
	goto	u2275
	line	281
	
l7836:	
;FUNCTION.C: 281: if (gFun_adcChIndex == 0) {
	movf	(_gFun_adcChIndex),f
	skipz
	goto	u2281
	goto	u2280
u2281:
	goto	l7842
u2280:
	line	282
	
l7838:	
;FUNCTION.C: 282: gFun_adcChIndex = 1;
	clrf	(_gFun_adcChIndex)
	incf	(_gFun_adcChIndex),f
	line	283
	
l7840:	
;FUNCTION.C: 283: gFun_adCurrent = gFun_adcBuffer;
	movf	(_gFun_adcBuffer+1),w
	movwf	(_gFun_adCurrent+1)
	movf	(_gFun_adcBuffer),w
	movwf	(_gFun_adCurrent)
	line	284
;FUNCTION.C: 284: } else {
	goto	l7846
	line	285
	
l7842:	
;FUNCTION.C: 285: gFun_adcChIndex = 0;
	clrf	(_gFun_adcChIndex)
	line	286
	
l7844:	
;FUNCTION.C: 286: gFun_adBatVol = gFun_adcBuffer;
	movf	(_gFun_adcBuffer+1),w
	movwf	(_gFun_adBatVol+1)
	movf	(_gFun_adcBuffer),w
	movwf	(_gFun_adBatVol)
	line	288
	
l7846:	
;FUNCTION.C: 287: }
;FUNCTION.C: 288: gFun_adcBufferSum = 0;
	clrf	(_gFun_adcBufferSum)
	clrf	(_gFun_adcBufferSum+1)
	line	290
	
l1221:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_Driver
	__end_of_ADC_Driver:
;; =============== function _ADC_Driver ends ============

	signat	_ADC_Driver,88
	global	_MCU_EnterSleep
psect	text603,local,class=CODE,delta=2
global __ptext603
__ptext603:

;; *************** function _MCU_EnterSleep *****************
;; Defined at:
;;		line 151 in file "FUNCTION.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_MCU_SleepConfig
;;		_DelayUs
;; This function is called by:
;;		_FUN_Driver
;; This function uses a non-reentrant model
;;
psect	text603
	file	"FUNCTION.C"
	line	151
	global	__size_of_MCU_EnterSleep
	__size_of_MCU_EnterSleep	equ	__end_of_MCU_EnterSleep-_MCU_EnterSleep
	
_MCU_EnterSleep:	
	opt	stack 3
; Regs used in _MCU_EnterSleep: [wreg+status,2+status,0+pclath+cstack]
	line	152
	
l7814:	
;FUNCTION.C: 152: MCU_SleepConfig(1);
	movlw	(01h)
	fcall	_MCU_SleepConfig
	line	153
	
l7816:	
# 153 "FUNCTION.C"
sleep ;#
psect	text603
	line	154
;FUNCTION.C: 154: DelayUs(1000);
	movlw	(0E8h)
	fcall	_DelayUs
	line	155
;FUNCTION.C: 155: MCU_SleepConfig(0);
	movlw	(0)
	fcall	_MCU_SleepConfig
	line	156
	
l7818:	
;FUNCTION.C: 156: gFun_keyIdleCnt = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_gFun_keyIdleCnt)
	line	157
	
l1188:	
	return
	opt stack 0
GLOBAL	__end_of_MCU_EnterSleep
	__end_of_MCU_EnterSleep:
;; =============== function _MCU_EnterSleep ends ============

	signat	_MCU_EnterSleep,88
	global	_MCU_SleepConfig
psect	text604,local,class=CODE,delta=2
global __ptext604
__ptext604:

;; *************** function _MCU_SleepConfig *****************
;; Defined at:
;;		line 163 in file "FUNCTION.C"
;; Parameters:    Size  Location     Type
;;  isSleep         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  isSleep         1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DelayUs
;; This function is called by:
;;		_MCU_EnterSleep
;; This function uses a non-reentrant model
;;
psect	text604
	file	"FUNCTION.C"
	line	163
	global	__size_of_MCU_SleepConfig
	__size_of_MCU_SleepConfig	equ	__end_of_MCU_SleepConfig-_MCU_SleepConfig
	
_MCU_SleepConfig:	
	opt	stack 3
; Regs used in _MCU_SleepConfig: [wreg+status,2+status,0+pclath+cstack]
;MCU_SleepConfig@isSleep stored from wreg
	line	177
	movwf	(MCU_SleepConfig@isSleep)
	
l7786:	
;FUNCTION.C: 177: if (isSleep){
	movf	(MCU_SleepConfig@isSleep),w
	skipz
	goto	u2240
	goto	l1191
u2240:
	line	178
	
l7788:	
;FUNCTION.C: 178: ADON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(248/8),(248)&7
	line	179
	
l7790:	
;FUNCTION.C: 179: IOCA = 0B11001111;
	movlw	(0CFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(150)^080h	;volatile
	line	181
;FUNCTION.C: 181: PORTA = 0B11001111;
	movlw	(0CFh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	182
;FUNCTION.C: 182: TRISA = 0B11001111;
	movlw	(0CFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	183
;FUNCTION.C: 183: WPUA = 0B11001000;
	movlw	(0C8h)
	movwf	(149)^080h	;volatile
	line	185
;FUNCTION.C: 185: PORTC = 0B00010011;
	movlw	(013h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(7)	;volatile
	line	186
;FUNCTION.C: 186: TRISC = 0B00000011;
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	187
	
l7792:	
;FUNCTION.C: 187: WPUC = 0B00000000;
	clrf	(136)^080h	;volatile
	line	189
	
l7794:	
;FUNCTION.C: 189: DelayUs(1000);
	movlw	(0E8h)
	fcall	_DelayUs
	line	190
	
l7796:	
;FUNCTION.C: 190: PAIE = 1;
	bsf	(91/8),(91)&7
	line	191
	
l7798:	
;FUNCTION.C: 191: PAIF = 0;
	bcf	(88/8),(88)&7
	line	192
;FUNCTION.C: 192: } else {
	goto	l1193
	
l1191:	
	line	193
;FUNCTION.C: 193: ADON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(248/8),(248)&7
	line	194
;FUNCTION.C: 194: PAIE = 0;
	bcf	(91/8),(91)&7
	line	195
;FUNCTION.C: 195: PAIF = 0;
	bcf	(88/8),(88)&7
	line	196
	
l7800:	
;FUNCTION.C: 196: IOCA = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(150)^080h	;volatile
	line	198
	
l7802:	
;FUNCTION.C: 198: PORTA = 0B11001111;
	movlw	(0CFh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	199
	
l7804:	
;FUNCTION.C: 199: TRISA = 0B11001111;
	movlw	(0CFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	200
	
l7806:	
;FUNCTION.C: 200: WPUA = 0B11001000;
	movlw	(0C8h)
	movwf	(149)^080h	;volatile
	line	202
	
l7808:	
;FUNCTION.C: 202: PORTC = 0B00000011;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(7)	;volatile
	line	203
	
l7810:	
;FUNCTION.C: 203: TRISC = 0B00000011;
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	204
	
l7812:	
;FUNCTION.C: 204: WPUC = 0B00000000;
	clrf	(136)^080h	;volatile
	line	206
	
l1193:	
	return
	opt stack 0
GLOBAL	__end_of_MCU_SleepConfig
	__end_of_MCU_SleepConfig:
;; =============== function _MCU_SleepConfig ends ============

	signat	_MCU_SleepConfig,4216
	global	_GetAd
psect	text605,local,class=CODE,delta=2
global __ptext605
__ptext605:

;; *************** function _GetAd *****************
;; Defined at:
;;		line 122 in file "FUNCTION.C"
;; Parameters:    Size  Location     Type
;;  ch              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ch              1    0[BANK0 ] unsigned char 
;;  ADC_DATA        2    4[BANK0 ] unsigned short 
;;  tBuffer         2    1[BANK0 ] unsigned short 
;;  ADCON0Buff      1    3[BANK0 ] unsigned char 
;;  i               1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  2    3[COMMON] unsigned short 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         0       6       0
;;      Temps:          0       0       0
;;      Totals:         2       6       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DelayUs
;; This function is called by:
;;		_ADC_Driver
;; This function uses a non-reentrant model
;;
psect	text605
	file	"FUNCTION.C"
	line	122
	global	__size_of_GetAd
	__size_of_GetAd	equ	__end_of_GetAd-_GetAd
	
_GetAd:	
	opt	stack 4
; Regs used in _GetAd: [wreg+status,2+status,0+pclath+cstack]
;GetAd@ch stored from wreg
	line	126
	movwf	(GetAd@ch)
	line	125
	
l7766:	
	line	126
;FUNCTION.C: 126: u16 ADC_DATA=0;
	clrf	(GetAd@ADC_DATA)
	clrf	(GetAd@ADC_DATA+1)
	line	128
	
l7768:	
;FUNCTION.C: 128: ADCON0Buff = ADCON0 & 0B10100011;
	movf	(31),w
	movwf	(GetAd@ADCON0Buff)
	
l7770:	
	movlw	(0A3h)
	andwf	(GetAd@ADCON0Buff),f
	line	129
	
l7772:	
;FUNCTION.C: 129: ch <<=2;
	clrc
	rlf	(GetAd@ch),f
	clrc
	rlf	(GetAd@ch),f
	line	130
	
l7774:	
;FUNCTION.C: 130: ADCON0Buff |= ch;
	movf	(GetAd@ch),w
	iorwf	(GetAd@ADCON0Buff),f
	line	131
	
l7776:	
;FUNCTION.C: 131: ADCON0 = ADCON0Buff;
	movf	(GetAd@ADCON0Buff),w
	movwf	(31)	;volatile
	line	132
	
l7778:	
;FUNCTION.C: 132: DelayUs(20);
	movlw	(014h)
	fcall	_DelayUs
	line	134
	
l7780:	
;FUNCTION.C: 134: GO_DONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	135
;FUNCTION.C: 135: while( GO_DONE==1 );
	
l1179:	
	btfsc	(249/8),(249)&7
	goto	u2221
	goto	u2220
u2221:
	goto	l1179
u2220:
	
l1181:	
	line	137
;FUNCTION.C: 137: GO_DONE = 1;
	bsf	(249/8),(249)&7
	line	138
;FUNCTION.C: 138: while( GO_DONE==1 );
	
l1182:	
	btfsc	(249/8),(249)&7
	goto	u2231
	goto	u2230
u2231:
	goto	l1182
u2230:
	line	140
	
l7782:	
;FUNCTION.C: 140: ADC_DATA = ADRESH;
	movf	(30),w	;volatile
	movwf	(GetAd@ADC_DATA)
	clrf	(GetAd@ADC_DATA+1)
	line	141
;FUNCTION.C: 141: ADC_DATA <<=8;
	movf	(GetAd@ADC_DATA),w
	movwf	(GetAd@ADC_DATA+1)
	clrf	(GetAd@ADC_DATA)
	line	142
;FUNCTION.C: 142: ADC_DATA |= ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	iorwf	(GetAd@ADC_DATA),f
	line	143
;FUNCTION.C: 143: tBuffer = ADC_DATA;
	movf	(GetAd@ADC_DATA+1),w
	movwf	(GetAd@tBuffer+1)
	movf	(GetAd@ADC_DATA),w
	movwf	(GetAd@tBuffer)
	line	144
;FUNCTION.C: 144: return tBuffer;
	movf	(GetAd@tBuffer+1),w
	movwf	(?_GetAd+1)
	movf	(GetAd@tBuffer),w
	movwf	(?_GetAd)
	line	145
	
l1185:	
	return
	opt stack 0
GLOBAL	__end_of_GetAd
	__end_of_GetAd:
;; =============== function _GetAd ends ============

	signat	_GetAd,4218
	global	_CUP_CHR_Driver
psect	text606,local,class=CODE,delta=2
global __ptext606
__ptext606:

;; *************** function _CUP_CHR_Driver *****************
;; Defined at:
;;		line 77 in file "FUNCTION.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  cupchrStateC    1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DelayUs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text606
	file	"FUNCTION.C"
	line	77
	global	__size_of_CUP_CHR_Driver
	__size_of_CUP_CHR_Driver	equ	__end_of_CUP_CHR_Driver-_CUP_CHR_Driver
	
_CUP_CHR_Driver:	
	opt	stack 5
; Regs used in _CUP_CHR_Driver: [wreg+status,2+status,0+pclath+cstack]
	line	78
	
l7726:	
;FUNCTION.C: 78: u8 cupchrStateCode = 0;
	clrf	(CUP_CHR_Driver@cupchrStateCode)
	line	81
	
l7728:	
;FUNCTION.C: 81: if ((RA0==0)) cupchrStateCode|=(1<<0);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(40/8),(40)&7
	goto	u2121
	goto	u2120
u2121:
	goto	l1163
u2120:
	
l7730:	
	bsf	(CUP_CHR_Driver@cupchrStateCode)+(0/8),(0)&7
	
l1163:	
	line	82
;FUNCTION.C: 82: if ((RA1==0)) cupchrStateCode|=(1<<1);
	btfsc	(41/8),(41)&7
	goto	u2131
	goto	u2130
u2131:
	goto	l7734
u2130:
	
l7732:	
	bsf	(CUP_CHR_Driver@cupchrStateCode)+(1/8),(1)&7
	line	84
	
l7734:	
;FUNCTION.C: 84: if (cupchrStateCode == 0x03) {
	movf	(CUP_CHR_Driver@cupchrStateCode),w
	xorlw	03h
	skipz
	goto	u2141
	goto	u2140
u2141:
	goto	l7738
u2140:
	line	85
	
l7736:	
;FUNCTION.C: 85: cupchrStateCode = 0;
	clrf	(CUP_CHR_Driver@cupchrStateCode)
	line	88
	
l7738:	
;FUNCTION.C: 86: }
;FUNCTION.C: 88: if ((RA2==0)) cupchrStateCode|=(1<<2);
	btfsc	(42/8),(42)&7
	goto	u2151
	goto	u2150
u2151:
	goto	l7742
u2150:
	
l7740:	
	bsf	(CUP_CHR_Driver@cupchrStateCode)+(2/8),(2)&7
	line	90
	
l7742:	
;FUNCTION.C: 90: if (cupchrStateCode != gFun_cupchrCodeBuff) {
	movf	(CUP_CHR_Driver@cupchrStateCode),w
	xorwf	(_gFun_cupchrCodeBuff),w
	skipnz
	goto	u2161
	goto	u2160
u2161:
	goto	l7748
u2160:
	line	91
	
l7744:	
;FUNCTION.C: 91: gFun_cupchrTimeCnt = 0;
	clrf	(_gFun_cupchrTimeCnt)
	line	92
	
l7746:	
;FUNCTION.C: 92: gFun_cupchrCodeBuff = cupchrStateCode;
	movf	(CUP_CHR_Driver@cupchrStateCode),w
	movwf	(_gFun_cupchrCodeBuff)
	line	93
;FUNCTION.C: 93: } else {
	goto	l1176
	line	94
	
l7748:	
;FUNCTION.C: 94: if (gFun_cupchrTimeCnt < 10) {
	movlw	(0Ah)
	subwf	(_gFun_cupchrTimeCnt),w
	skipnc
	goto	u2171
	goto	u2170
u2171:
	goto	l1169
u2170:
	line	95
	
l7750:	
;FUNCTION.C: 95: gFun_cupchrTimeCnt++;
	incf	(_gFun_cupchrTimeCnt),f
	line	96
;FUNCTION.C: 96: } else {
	goto	l1176
	
l1169:	
	line	97
;FUNCTION.C: 97: if (gFun_cupchrCodeBuff &(1<<2)) {
	btfss	(_gFun_cupchrCodeBuff),(2)&7
	goto	u2181
	goto	u2180
u2181:
	goto	l1171
u2180:
	line	98
	
l7752:	
;FUNCTION.C: 98: if (gIsCupOk==0) {
	btfsc	(_gIsCupOk/8),(_gIsCupOk)&7
	goto	u2191
	goto	u2190
u2191:
	goto	l7762
u2190:
	line	99
	
l7754:	
;FUNCTION.C: 99: DelayUs(10000);
	movlw	(010h)
	fcall	_DelayUs
	line	100
	
l7756:	
;FUNCTION.C: 100: if (gIsCupOk==0) {
	btfsc	(_gIsCupOk/8),(_gIsCupOk)&7
	goto	u2201
	goto	u2200
u2201:
	goto	l7762
u2200:
	line	101
	
l7758:	
;FUNCTION.C: 101: gIsCupOk = 1;
	bsf	(_gIsCupOk/8),(_gIsCupOk)&7
	line	102
;FUNCTION.C: 102: gbCupEvent = 1;
	bsf	(_gbCupEvent/8),(_gbCupEvent)&7
	goto	l7762
	line	105
	
l1171:	
	line	106
;FUNCTION.C: 106: if (gIsCupOk) {
	btfss	(_gIsCupOk/8),(_gIsCupOk)&7
	goto	u2211
	goto	u2210
u2211:
	goto	l7762
u2210:
	line	107
	
l7760:	
;FUNCTION.C: 107: gIsCupOk = 0;
	bcf	(_gIsCupOk/8),(_gIsCupOk)&7
	line	108
;FUNCTION.C: 108: gbCupEvent = 1;
	bsf	(_gbCupEvent/8),(_gbCupEvent)&7
	line	111
	
l7762:	
;FUNCTION.C: 109: }
;FUNCTION.C: 110: }
;FUNCTION.C: 111: gFun_chrState = gFun_cupchrCodeBuff &0x03;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_gFun_cupchrCodeBuff),w
	movwf	(_gFun_chrState)
	
l7764:	
	movlw	(03h)
	andwf	(_gFun_chrState),f
	line	116
	
l1176:	
	return
	opt stack 0
GLOBAL	__end_of_CUP_CHR_Driver
	__end_of_CUP_CHR_Driver:
;; =============== function _CUP_CHR_Driver ends ============

	signat	_CUP_CHR_Driver,88
	global	_MCU_Init
psect	text607,local,class=CODE,delta=2
global __ptext607
__ptext607:

;; *************** function _MCU_Init *****************
;; Defined at:
;;		line 74 in file "MCU.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_CLK_Init
;;		_TIM_Init
;;		_ADC_Init
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text607
	file	"MCU.C"
	line	74
	global	__size_of_MCU_Init
	__size_of_MCU_Init	equ	__end_of_MCU_Init-_MCU_Init
	
_MCU_Init:	
	opt	stack 5
; Regs used in _MCU_Init: [wreg+status,2+status,0+pclath+cstack]
	line	75
	
l6948:	
;MCU.C: 75: CLK_Init();
	fcall	_CLK_Init
	line	76
;MCU.C: 76: TIM_Init();
	fcall	_TIM_Init
	line	77
;MCU.C: 77: ADC_Init();
	fcall	_ADC_Init
	line	78
	
l3508:	
	return
	opt stack 0
GLOBAL	__end_of_MCU_Init
	__end_of_MCU_Init:
;; =============== function _MCU_Init ends ============

	signat	_MCU_Init,88
	global	_DelayUs
psect	text608,local,class=CODE,delta=2
global __ptext608
__ptext608:

;; *************** function _DelayUs *****************
;; Defined at:
;;		line 67 in file "FUNCTION.C"
;; Parameters:    Size  Location     Type
;;  time            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  time            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_CUP_CHR_Driver
;;		_GetAd
;;		_MCU_EnterSleep
;;		_MCU_SleepConfig
;; This function uses a non-reentrant model
;;
psect	text608
	file	"FUNCTION.C"
	line	67
	global	__size_of_DelayUs
	__size_of_DelayUs	equ	__end_of_DelayUs-_DelayUs
	
_DelayUs:	
	opt	stack 4
; Regs used in _DelayUs: [wreg+status,2+status,0]
;DelayUs@time stored from wreg
	movwf	(DelayUs@time)
	line	68
	
l7722:	
;FUNCTION.C: 68: while(time--)
	goto	l7724
	
l1158:	
	line	70
;FUNCTION.C: 69: {
;FUNCTION.C: 70: _nop();
	nop
	line	68
	
l7724:	
	decf	(DelayUs@time),f
	movf	((DelayUs@time)),w
	xorlw	0FFh
	skipz
	goto	u2111
	goto	u2110
u2111:
	goto	l1158
u2110:
	line	72
	
l1160:	
	return
	opt stack 0
GLOBAL	__end_of_DelayUs
	__end_of_DelayUs:
;; =============== function _DelayUs ends ============

	signat	_DelayUs,4216
	global	_ADC_Init
psect	text609,local,class=CODE,delta=2
global __ptext609
__ptext609:

;; *************** function _ADC_Init *****************
;; Defined at:
;;		line 53 in file "MCU.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_MCU_Init
;; This function uses a non-reentrant model
;;
psect	text609
	file	"MCU.C"
	line	53
	global	__size_of_ADC_Init
	__size_of_ADC_Init	equ	__end_of_ADC_Init-_ADC_Init
	
_ADC_Init:	
	opt	stack 5
; Regs used in _ADC_Init: [wreg]
	line	58
	
l6914:	
;MCU.C: 58: ADCON1 = 0B01100000;
	movlw	(060h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	60
;MCU.C: 60: ADCON0 = 0B10111101;
	movlw	(0BDh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	67
;MCU.C: 67: ANSEL = 0B00110000;
	movlw	(030h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	68
	
l3505:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_Init
	__end_of_ADC_Init:
;; =============== function _ADC_Init ends ============

	signat	_ADC_Init,88
	global	_TIM_Init
psect	text610,local,class=CODE,delta=2
global __ptext610
__ptext610:

;; *************** function _TIM_Init *****************
;; Defined at:
;;		line 35 in file "MCU.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_MCU_Init
;; This function uses a non-reentrant model
;;
psect	text610
	file	"MCU.C"
	line	35
	global	__size_of_TIM_Init
	__size_of_TIM_Init	equ	__end_of_TIM_Init-_TIM_Init
	
_TIM_Init:	
	opt	stack 5
; Regs used in _TIM_Init: [wreg+status,2]
	line	36
	
l6900:	
;MCU.C: 36: T2CON = 0B00000001;
	movlw	(01h)
	movwf	(18)	;volatile
	line	38
	
l6902:	
;MCU.C: 38: TMR2 = 0;
	clrf	(17)	;volatile
	line	39
	
l6904:	
;MCU.C: 39: PR2 = 200;
	movlw	(0C8h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	41
	
l6906:	
;MCU.C: 41: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(97/8),(97)&7
	line	42
	
l6908:	
;MCU.C: 42: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	43
	
l6910:	
;MCU.C: 43: TMR2ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(146/8),(146)&7
	line	44
	
l6912:	
;MCU.C: 44: PEIE=1;
	bsf	(94/8),(94)&7
	line	47
	
l3502:	
	return
	opt stack 0
GLOBAL	__end_of_TIM_Init
	__end_of_TIM_Init:
;; =============== function _TIM_Init ends ============

	signat	_TIM_Init,88
	global	_CLK_Init
psect	text611,local,class=CODE,delta=2
global __ptext611
__ptext611:

;; *************** function _CLK_Init *****************
;; Defined at:
;;		line 6 in file "MCU.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_MCU_Init
;; This function uses a non-reentrant model
;;
psect	text611
	file	"MCU.C"
	line	6
	global	__size_of_CLK_Init
	__size_of_CLK_Init	equ	__end_of_CLK_Init-_CLK_Init
	
_CLK_Init:	
	opt	stack 5
; Regs used in _CLK_Init: [wreg+status,2]
	line	7
	
l6888:	
;MCU.C: 7: OSCCON = 0B01110001;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	10
	
l6890:	
;MCU.C: 10: INTCON = 0;
	clrf	(11)	;volatile
	line	12
	
l6892:	
;MCU.C: 12: ANSEL = 0X00;
	clrf	(145)^080h	;volatile
	line	14
;MCU.C: 14: PORTA =0B11001111;
	movlw	(0CFh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	15
;MCU.C: 15: TRISA = 0B11001111;
	movlw	(0CFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	16
;MCU.C: 16: WPUA = 0B11001000;
	movlw	(0C8h)
	movwf	(149)^080h	;volatile
	line	18
;MCU.C: 18: PORTC =0B00000011;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(7)	;volatile
	line	19
;MCU.C: 19: TRISC = 0B00000011;
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	20
	
l6894:	
;MCU.C: 20: WPUC = 0B00000000;
	clrf	(136)^080h	;volatile
	line	23
	
l6896:	
;MCU.C: 23: OPTION = 0B01001000;
	movlw	(048h)
	movwf	(129)^080h	;volatile
	line	25
;MCU.C: 25: MSCKCON = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(27)	;volatile
	line	28
	
l6898:	
;MCU.C: 28: CMCON0 = 0B00000111;
	movlw	(07h)
	movwf	(25)	;volatile
	line	29
	
l3499:	
	return
	opt stack 0
GLOBAL	__end_of_CLK_Init
	__end_of_CLK_Init:
;; =============== function _CLK_Init ends ============

	signat	_CLK_Init,88
	global	_MOTO_Driver
psect	text612,local,class=CODE,delta=2
global __ptext612
__ptext612:

;; *************** function _MOTO_Driver *****************
;; Defined at:
;;		line 6 in file "motor.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFFFFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text612
	file	"motor.c"
	line	6
	global	__size_of_MOTO_Driver
	__size_of_MOTO_Driver	equ	__end_of_MOTO_Driver-_MOTO_Driver
	
_MOTO_Driver:	
	opt	stack 6
; Regs used in _MOTO_Driver: []
	line	9
	
l5647:	
	return
	opt stack 0
GLOBAL	__end_of_MOTO_Driver
	__end_of_MOTO_Driver:
;; =============== function _MOTO_Driver ends ============

	signat	_MOTO_Driver,88
	global	_FUN_EnterWorkMode
psect	text613,local,class=CODE,delta=2
global __ptext613
__ptext613:

;; *************** function _FUN_EnterWorkMode *****************
;; Defined at:
;;		line 521 in file "FUNCTION.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_FUN_Driver
;; This function uses a non-reentrant model
;;
psect	text613
	file	"FUNCTION.C"
	line	521
	global	__size_of_FUN_EnterWorkMode
	__size_of_FUN_EnterWorkMode	equ	__end_of_FUN_EnterWorkMode-_FUN_EnterWorkMode
	
_FUN_EnterWorkMode:	
	opt	stack 5
; Regs used in _FUN_EnterWorkMode: [wreg+status,2]
	line	522
	
l7424:	
;FUNCTION.C: 522: gFun_workMode = WM_Work;
	movlw	(02h)
	movwf	(_gFun_workMode)
	line	523
	
l7426:	
;FUNCTION.C: 523: gFun_workTimeCnt = 0;
	clrf	(_gFun_workTimeCnt)
	clrf	(_gFun_workTimeCnt+1)
	line	524
	
l7428:	
;FUNCTION.C: 524: gFun_workTimeCntFor1s = 0;
	clrf	(_gFun_workTimeCntFor1s)
	line	525
	
l1298:	
	return
	opt stack 0
GLOBAL	__end_of_FUN_EnterWorkMode
	__end_of_FUN_EnterWorkMode:
;; =============== function _FUN_EnterWorkMode ends ============

	signat	_FUN_EnterWorkMode,88
	global	_FUN_EnterStandby
psect	text614,local,class=CODE,delta=2
global __ptext614
__ptext614:

;; *************** function _FUN_EnterStandby *****************
;; Defined at:
;;		line 510 in file "FUNCTION.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_FUN_Driver
;; This function uses a non-reentrant model
;;
psect	text614
	file	"FUNCTION.C"
	line	510
	global	__size_of_FUN_EnterStandby
	__size_of_FUN_EnterStandby	equ	__end_of_FUN_EnterStandby-_FUN_EnterStandby
	
_FUN_EnterStandby:	
	opt	stack 5
; Regs used in _FUN_EnterStandby: [status,2]
	line	511
	
l7416:	
;FUNCTION.C: 511: gFun_workMode = WM_Standby;
	clrf	(_gFun_workMode)
	incf	(_gFun_workMode),f
	line	512
	
l7418:	
;FUNCTION.C: 512: gFun_workTimeCnt = 0;
	clrf	(_gFun_workTimeCnt)
	clrf	(_gFun_workTimeCnt+1)
	line	513
	
l7420:	
;FUNCTION.C: 513: gbOcp = 0;
	bcf	(_gbOcp/8),(_gbOcp)&7
	line	514
	
l7422:	
;FUNCTION.C: 514: gbUcp = 0;
	bcf	(_gbUcp/8),(_gbUcp)&7
	line	515
	
l1295:	
	return
	opt stack 0
GLOBAL	__end_of_FUN_EnterStandby
	__end_of_FUN_EnterStandby:
;; =============== function _FUN_EnterStandby ends ============

	signat	_FUN_EnterStandby,88
	global	_LED_Display
psect	text615,local,class=CODE,delta=2
global __ptext615
__ptext615:

;; *************** function _LED_Display *****************
;; Defined at:
;;		line 425 in file "FUNCTION.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text615
	file	"FUNCTION.C"
	line	425
	global	__size_of_LED_Display
	__size_of_LED_Display	equ	__end_of_LED_Display-_LED_Display
	
_LED_Display:	
	opt	stack 6
; Regs used in _LED_Display: [wreg-fsr0h+status,2+status,0]
	line	426
	
l7370:	
;FUNCTION.C: 426: if (++gFun_ledCnt_1hz >=50) {
	movlw	(032h)
	incf	(_gFun_ledCnt_1hz),f
	subwf	((_gFun_ledCnt_1hz)),w
	skipc
	goto	u1461
	goto	u1460
u1461:
	goto	l7376
u1460:
	line	427
	
l7372:	
;FUNCTION.C: 427: gFun_ledCnt_1hz = 0;
	clrf	(_gFun_ledCnt_1hz)
	line	428
	
l7374:	
;FUNCTION.C: 428: gbLed1hz = ~gbLed1hz;
	movlw	1<<((_gbLed1hz)&7)
	xorwf	((_gbLed1hz)/8),f
	line	430
	
l7376:	
;FUNCTION.C: 429: }
;FUNCTION.C: 430: if (++gFun_ledCnt_2hz >=25) {
	movlw	(019h)
	incf	(_gFun_ledCnt_2hz),f
	subwf	((_gFun_ledCnt_2hz)),w
	skipc
	goto	u1471
	goto	u1470
u1471:
	goto	l7382
u1470:
	line	431
	
l7378:	
;FUNCTION.C: 431: gFun_ledCnt_2hz = 0;
	clrf	(_gFun_ledCnt_2hz)
	line	432
	
l7380:	
;FUNCTION.C: 432: gbLed2hz = ~gbLed2hz;
	movlw	1<<((_gbLed2hz)&7)
	xorwf	((_gbLed2hz)/8),f
	line	434
	
l7382:	
;FUNCTION.C: 433: }
;FUNCTION.C: 434: if (gFun_ledStopCnt !=0) {
	movf	(_gFun_ledStopCnt+1),w
	iorwf	(_gFun_ledStopCnt),w
	skipnz
	goto	u1481
	goto	u1480
u1481:
	goto	l7408
u1480:
	line	435
	
l7384:	
;FUNCTION.C: 435: if (gFun_ledTimeCnt <65535)
	incf	(_gFun_ledTimeCnt),w
	skipnz
	incf	(_gFun_ledTimeCnt+1),w

	skipnz
	goto	u1491
	goto	u1490
u1491:
	goto	l7388
u1490:
	line	436
	
l7386:	
;FUNCTION.C: 436: gFun_ledTimeCnt++;
	incf	(_gFun_ledTimeCnt),f
	skipnz
	incf	(_gFun_ledTimeCnt+1),f
	line	437
	
l7388:	
;FUNCTION.C: 437: if (gFun_ledTimeCnt >= gFun_ledStopCnt) {
	movf	(_gFun_ledStopCnt+1),w
	subwf	(_gFun_ledTimeCnt+1),w
	skipz
	goto	u1505
	movf	(_gFun_ledStopCnt),w
	subwf	(_gFun_ledTimeCnt),w
u1505:
	skipc
	goto	u1501
	goto	u1500
u1501:
	goto	l7408
u1500:
	line	438
	
l7390:	
;FUNCTION.C: 438: gFun_ledMode = 0;
	clrf	(_gFun_ledMode)
	line	439
;FUNCTION.C: 439: gFun_ledTimeCnt = 0;
	clrf	(_gFun_ledTimeCnt)
	clrf	(_gFun_ledTimeCnt+1)
	line	440
;FUNCTION.C: 440: gFun_ledStopCnt = 0;
	clrf	(_gFun_ledStopCnt)
	clrf	(_gFun_ledStopCnt+1)
	line	441
	
l7392:	
;FUNCTION.C: 441: gbLedEnd = 1;
	bsf	(_gbLedEnd/8),(_gbLedEnd)&7
	line	442
	
l7394:	
;FUNCTION.C: 442: gbLedWait = 0;
	bcf	(_gbLedWait/8),(_gbLedWait)&7
	goto	l7408
	line	447
;FUNCTION.C: 447: case LM_Off:
	
l1272:	
	line	448
;FUNCTION.C: 448: RC3=0;
	bcf	(59/8),(59)&7
	line	449
;FUNCTION.C: 449: RC2=0;
	bcf	(58/8),(58)&7
	line	450
;FUNCTION.C: 450: break;
	goto	l1292
	line	451
;FUNCTION.C: 451: case LM_Red_On:
	
l1274:	
	line	452
;FUNCTION.C: 452: RC3=1;
	bsf	(59/8),(59)&7
	line	453
;FUNCTION.C: 453: RC2=0;
	bcf	(58/8),(58)&7
	line	454
;FUNCTION.C: 454: break;
	goto	l1292
	line	455
;FUNCTION.C: 455: case LM_Blue_On:
	
l1275:	
	line	456
;FUNCTION.C: 456: RC3=0;
	bcf	(59/8),(59)&7
	line	457
;FUNCTION.C: 457: RC2=1;
	bsf	(58/8),(58)&7
	line	458
;FUNCTION.C: 458: break;
	goto	l1292
	line	459
;FUNCTION.C: 459: case LM_Red_1HZ_3T:
	
l1276:	
	line	460
;FUNCTION.C: 460: if (gbLed1hz){
	btfss	(_gbLed1hz/8),(_gbLed1hz)&7
	goto	u1511
	goto	u1510
u1511:
	goto	l1277
u1510:
	line	461
	
l7396:	
;FUNCTION.C: 461: RC3=1;
	bsf	(59/8),(59)&7
	line	462
;FUNCTION.C: 462: } else {
	goto	l1278
	
l1277:	
	line	463
;FUNCTION.C: 463: RC3=0;
	bcf	(59/8),(59)&7
	line	464
	
l1278:	
	line	465
;FUNCTION.C: 464: }
;FUNCTION.C: 465: RC2=0;
	bcf	(58/8),(58)&7
	line	466
;FUNCTION.C: 466: break;
	goto	l1292
	line	467
;FUNCTION.C: 467: case LM_Blue_1HZ_3T:
	
l1279:	
	line	468
;FUNCTION.C: 468: RC3=0;
	bcf	(59/8),(59)&7
	line	469
;FUNCTION.C: 469: if (gbLed1hz){
	btfss	(_gbLed1hz/8),(_gbLed1hz)&7
	goto	u1521
	goto	u1520
u1521:
	goto	l1278
u1520:
	line	470
	
l7398:	
;FUNCTION.C: 470: RC2=1;
	bsf	(58/8),(58)&7
	line	471
;FUNCTION.C: 471: } else {
	goto	l1292
	line	475
;FUNCTION.C: 475: case LM_Red_1HZ_10T:
	
l1282:	
	line	476
;FUNCTION.C: 476: if (gbLed1hz){
	btfss	(_gbLed1hz/8),(_gbLed1hz)&7
	goto	u1531
	goto	u1530
u1531:
	goto	l1277
u1530:
	goto	l7396
	line	483
;FUNCTION.C: 483: case LM_Red_2HZ_10T:
	
l1285:	
	line	484
;FUNCTION.C: 484: if (gbLed2hz){
	btfss	(_gbLed2hz/8),(_gbLed2hz)&7
	goto	u1541
	goto	u1540
u1541:
	goto	l1277
u1540:
	goto	l7396
	line	491
;FUNCTION.C: 491: case LM_RedBlue_1HZ_1T:
	
l1288:	
	line	492
;FUNCTION.C: 492: if (gbLed1hz){
	btfss	(_gbLed1hz/8),(_gbLed1hz)&7
	goto	u1551
	goto	u1550
u1551:
	goto	l1275
u1550:
	goto	l1274
	line	446
	
l7408:	
	movf	(_gFun_ledMode),w
	; Switch size 1, requested type "space"
; Number of cases is 8, Range of values is 0 to 7
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           14     6 (fixed)
; simple_byte           25    13 (average)
; jumptable            260     6 (fixed)
; rangetable            12     6 (fixed)
; spacedrange           22     9 (fixed)
; locatedrange           8     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	8
	subwf	fsr,w
skipnc
goto l1292
movlw high(S7986)
movwf pclath
	movlw low(S7986)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S7986:
	ljmp	l1272
	ljmp	l1274
	ljmp	l1275
	ljmp	l1276
	ljmp	l1279
	ljmp	l1282
	ljmp	l1285
	ljmp	l1288
psect	text615

	line	504
	
l1292:	
	return
	opt stack 0
GLOBAL	__end_of_LED_Display
	__end_of_LED_Display:
;; =============== function _LED_Display ends ============

	signat	_LED_Display,88
	global	_LED_SetMode
psect	text616,local,class=CODE,delta=2
global __ptext616
__ptext616:

;; *************** function _LED_SetMode *****************
;; Defined at:
;;		line 394 in file "FUNCTION.C"
;; Parameters:    Size  Location     Type
;;  mode            1    wreg     enum E1603
;; Auto vars:     Size  Location     Type
;;  mode            1    2[COMMON] enum E1603
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_FUN_Driver
;; This function uses a non-reentrant model
;;
psect	text616
	file	"FUNCTION.C"
	line	394
	global	__size_of_LED_SetMode
	__size_of_LED_SetMode	equ	__end_of_LED_SetMode-_LED_SetMode
	
_LED_SetMode:	
	opt	stack 5
; Regs used in _LED_SetMode: [wreg+status,2+status,0]
;LED_SetMode@mode stored from wreg
	movwf	(LED_SetMode@mode)
	line	395
	
l7326:	
;FUNCTION.C: 395: if (gFun_ledMode != mode && gFun_ledStopCnt==0) {
	movf	(_gFun_ledMode),w
	xorwf	(LED_SetMode@mode),w
	skipnz
	goto	u1391
	goto	u1390
u1391:
	goto	l1263
u1390:
	
l7328:	
	movf	((_gFun_ledStopCnt+1)),w
	iorwf	((_gFun_ledStopCnt)),w
	skipz
	goto	u1401
	goto	u1400
u1401:
	goto	l1263
u1400:
	line	396
	
l7330:	
;FUNCTION.C: 396: gFun_ledMode = mode;
	movf	(LED_SetMode@mode),w
	movwf	(_gFun_ledMode)
	line	397
	
l7332:	
;FUNCTION.C: 397: gFun_ledCnt_1hz = 0;
	clrf	(_gFun_ledCnt_1hz)
	line	398
	
l7334:	
;FUNCTION.C: 398: gFun_ledCnt_2hz = 0;
	clrf	(_gFun_ledCnt_2hz)
	line	399
	
l7336:	
;FUNCTION.C: 399: gbLed1hz = 1;
	bsf	(_gbLed1hz/8),(_gbLed1hz)&7
	line	400
	
l7338:	
;FUNCTION.C: 400: gbLed2hz = 1;
	bsf	(_gbLed2hz/8),(_gbLed2hz)&7
	line	401
	
l7340:	
;FUNCTION.C: 401: gFun_ledTimeCnt = 0;
	clrf	(_gFun_ledTimeCnt)
	clrf	(_gFun_ledTimeCnt+1)
	line	402
	
l7342:	
;FUNCTION.C: 402: gbLedWait = 0;
	bcf	(_gbLedWait/8),(_gbLedWait)&7
	line	403
	
l7344:	
;FUNCTION.C: 403: if (mode==LM_Red_1HZ_3T || mode==LM_Blue_1HZ_3T) {
	movf	(LED_SetMode@mode),w
	xorlw	03h
	skipnz
	goto	u1411
	goto	u1410
u1411:
	goto	l7348
u1410:
	
l7346:	
	movf	(LED_SetMode@mode),w
	xorlw	04h
	skipz
	goto	u1421
	goto	u1420
u1421:
	goto	l7350
u1420:
	line	404
	
l7348:	
;FUNCTION.C: 404: gFun_ledStopCnt = 300;
	movlw	low(012Ch)
	movwf	(_gFun_ledStopCnt)
	movlw	high(012Ch)
	movwf	((_gFun_ledStopCnt))+1
	line	405
;FUNCTION.C: 405: } else if (mode==LM_Red_1HZ_10T) {
	goto	l1263
	
l7350:	
	movf	(LED_SetMode@mode),w
	xorlw	05h
	skipz
	goto	u1431
	goto	u1430
u1431:
	goto	l7356
u1430:
	line	406
	
l7352:	
;FUNCTION.C: 406: gFun_ledStopCnt = 1000;
	movlw	low(03E8h)
	movwf	(_gFun_ledStopCnt)
	movlw	high(03E8h)
	movwf	((_gFun_ledStopCnt))+1
	line	407
	
l7354:	
;FUNCTION.C: 407: gbLedWait = 1;
	bsf	(_gbLedWait/8),(_gbLedWait)&7
	line	408
;FUNCTION.C: 408: } else if (mode==LM_Red_2HZ_10T) {
	goto	l1263
	
l7356:	
	movf	(LED_SetMode@mode),w
	xorlw	06h
	skipz
	goto	u1441
	goto	u1440
u1441:
	goto	l7362
u1440:
	line	409
	
l7358:	
;FUNCTION.C: 409: gFun_ledStopCnt = 500;
	movlw	low(01F4h)
	movwf	(_gFun_ledStopCnt)
	movlw	high(01F4h)
	movwf	((_gFun_ledStopCnt))+1
	goto	l7354
	line	411
	
l7362:	
	movf	(LED_SetMode@mode),w
	xorlw	07h
	skipz
	goto	u1451
	goto	u1450
u1451:
	goto	l7368
u1450:
	line	412
	
l7364:	
;FUNCTION.C: 412: gFun_ledStopCnt = 100;
	movlw	064h
	movwf	(_gFun_ledStopCnt)
	clrf	(_gFun_ledStopCnt+1)
	goto	l7354
	line	415
	
l7368:	
;FUNCTION.C: 415: gFun_ledStopCnt = 0;
	clrf	(_gFun_ledStopCnt)
	clrf	(_gFun_ledStopCnt+1)
	line	419
	
l1263:	
	return
	opt stack 0
GLOBAL	__end_of_LED_SetMode
	__end_of_LED_SetMode:
;; =============== function _LED_SetMode ends ============

	signat	_LED_SetMode,4216
	global	_FUN_Init
psect	text617,local,class=CODE,delta=2
global __ptext617
__ptext617:

;; *************** function _FUN_Init *****************
;; Defined at:
;;		line 381 in file "FUNCTION.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text617
	file	"FUNCTION.C"
	line	381
	global	__size_of_FUN_Init
	__size_of_FUN_Init	equ	__end_of_FUN_Init-_FUN_Init
	
_FUN_Init:	
	opt	stack 6
; Regs used in _FUN_Init: [wreg]
	line	383
	
l7324:	
;FUNCTION.C: 383: gFun_keyIdleCnt = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_gFun_keyIdleCnt)
	line	384
	
l1249:	
	return
	opt stack 0
GLOBAL	__end_of_FUN_Init
	__end_of_FUN_Init:
;; =============== function _FUN_Init ends ============

	signat	_FUN_Init,88
	global	_ADC_Deal
psect	text618,local,class=CODE,delta=2
global __ptext618
__ptext618:

;; *************** function _ADC_Deal *****************
;; Defined at:
;;		line 296 in file "FUNCTION.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text618
	file	"FUNCTION.C"
	line	296
	global	__size_of_ADC_Deal
	__size_of_ADC_Deal	equ	__end_of_ADC_Deal-_ADC_Deal
	
_ADC_Deal:	
	opt	stack 6
; Regs used in _ADC_Deal: [wreg+status,2+status,0]
	line	301
	
l7262:	
;FUNCTION.C: 301: if (gFun_workMode == WM_Sleep) {
	movf	(_gFun_workMode),w
	xorlw	03h
	skipz
	goto	u1241
	goto	u1240
u1241:
	goto	l7266
u1240:
	line	302
	
l7264:	
;FUNCTION.C: 302: gFun_ucpTimeCnt = 0;
	clrf	(_gFun_ucpTimeCnt)
	line	303
;FUNCTION.C: 303: gFun_ocpTimeCnt = 0;
	clrf	(_gFun_ocpTimeCnt)
	line	304
;FUNCTION.C: 304: } else {
	goto	l1227
	line	305
	
l7266:	
;FUNCTION.C: 305: if (gFun_adcDealDelay < 10) {
	movlw	(0Ah)
	subwf	(_gFun_adcDealDelay),w
	skipnc
	goto	u1251
	goto	u1250
u1251:
	goto	l7274
u1250:
	line	306
	
l7268:	
;FUNCTION.C: 306: gFun_adcDealDelay++;
	incf	(_gFun_adcDealDelay),f
	goto	l1227
	line	309
	
l7274:	
;FUNCTION.C: 309: gFun_adcDealDelay = 0;
	clrf	(_gFun_adcDealDelay)
	line	313
	
l7276:	
;FUNCTION.C: 310: }
;FUNCTION.C: 313: if (gFun_adBatVol < ((275)*47ul*512/147/100)) {
	movlw	high(01C2h)
	subwf	(_gFun_adBatVol+1),w
	movlw	low(01C2h)
	skipnz
	subwf	(_gFun_adBatVol),w
	skipnc
	goto	u1261
	goto	u1260
u1261:
	goto	l7280
u1260:
	line	314
	
l7278:	
;FUNCTION.C: 314: gFun_batVolState = 0;
	clrf	(_gFun_batVolState)
	line	315
;FUNCTION.C: 315: } else if (gFun_adBatVol < ((320)*47ul*512/147/100)) {
	goto	l1230
	
l7280:	
	movlw	high(020Bh)
	subwf	(_gFun_adBatVol+1),w
	movlw	low(020Bh)
	skipnz
	subwf	(_gFun_adBatVol),w
	skipnc
	goto	u1271
	goto	u1270
u1271:
	goto	l7284
u1270:
	line	316
	
l7282:	
;FUNCTION.C: 316: gFun_batVolState = 1;
	clrf	(_gFun_batVolState)
	incf	(_gFun_batVolState),f
	line	317
;FUNCTION.C: 317: } else {
	goto	l1230
	line	318
	
l7284:	
;FUNCTION.C: 318: gFun_batVolState = 2;
	movlw	(02h)
	movwf	(_gFun_batVolState)
	line	319
	
l1230:	
	line	325
;FUNCTION.C: 319: }
;FUNCTION.C: 325: if (gFun_workMode == WM_Work) {
	movf	(_gFun_workMode),w
	xorlw	02h
	skipz
	goto	u1281
	goto	u1280
u1281:
	goto	l7264
u1280:
	line	326
	
l7286:	
;FUNCTION.C: 327: gFun_motoCurrState = 0;
	movlw	high(0Fh)
	subwf	(_gFun_adCurrent+1),w
	movlw	low(0Fh)
	skipnz
	subwf	(_gFun_adCurrent),w
	skipnc
	goto	u1291
	goto	u1290
u1291:
	goto	l7296
u1290:
	line	328
	
l7288:	
;FUNCTION.C: 328: if (gFun_ocpTimeCnt)
	movf	(_gFun_ocpTimeCnt),w
	skipz
	goto	u1300
	goto	l7292
u1300:
	line	329
	
l7290:	
;FUNCTION.C: 329: gFun_ocpTimeCnt--;
	decf	(_gFun_ocpTimeCnt),f
	line	330
	
l7292:	
;FUNCTION.C: 330: if (gFun_ucpTimeCnt < 255)
	movf	(_gFun_ucpTimeCnt),w
	xorlw	0FFh
	skipnz
	goto	u1311
	goto	u1310
u1311:
	goto	l7314
u1310:
	line	331
	
l7294:	
;FUNCTION.C: 331: gFun_ucpTimeCnt++;
	incf	(_gFun_ucpTimeCnt),f
	goto	l7314
	line	332
	
l7296:	
;FUNCTION.C: 333: gFun_motoCurrState = 1;
	movlw	high(040h)
	subwf	(_gFun_adCurrent+1),w
	movlw	low(040h)
	skipnz
	subwf	(_gFun_adCurrent),w
	skipnc
	goto	u1321
	goto	u1320
u1321:
	goto	l7306
u1320:
	line	334
	
l7298:	
;FUNCTION.C: 334: if (gFun_ocpTimeCnt)
	movf	(_gFun_ocpTimeCnt),w
	skipz
	goto	u1330
	goto	l7302
u1330:
	line	335
	
l7300:	
;FUNCTION.C: 335: gFun_ocpTimeCnt--;
	decf	(_gFun_ocpTimeCnt),f
	line	336
	
l7302:	
;FUNCTION.C: 336: if (gFun_ucpTimeCnt)
	movf	(_gFun_ucpTimeCnt),w
	skipz
	goto	u1340
	goto	l7314
u1340:
	line	337
	
l7304:	
;FUNCTION.C: 337: gFun_ucpTimeCnt--;
	decf	(_gFun_ucpTimeCnt),f
	goto	l7314
	line	340
	
l7306:	
;FUNCTION.C: 340: if (gFun_ocpTimeCnt < 255)
	movf	(_gFun_ocpTimeCnt),w
	xorlw	0FFh
	skipnz
	goto	u1351
	goto	u1350
u1351:
	goto	l7310
u1350:
	line	341
	
l7308:	
;FUNCTION.C: 341: gFun_ocpTimeCnt++;
	incf	(_gFun_ocpTimeCnt),f
	line	342
	
l7310:	
;FUNCTION.C: 342: if (gFun_ucpTimeCnt)
	movf	(_gFun_ucpTimeCnt),w
	skipz
	goto	u1360
	goto	l7314
u1360:
	goto	l7304
	line	345
	
l7314:	
;FUNCTION.C: 344: }
;FUNCTION.C: 345: if (gFun_ocpTimeCnt >= 2) {
	movlw	(02h)
	subwf	(_gFun_ocpTimeCnt),w
	skipc
	goto	u1371
	goto	u1370
u1371:
	goto	l7318
u1370:
	line	346
	
l7316:	
;FUNCTION.C: 346: gbOcp = 1;
	bsf	(_gbOcp/8),(_gbOcp)&7
	line	348
	
l7318:	
;FUNCTION.C: 347: }
;FUNCTION.C: 348: if (gFun_ucpTimeCnt >= 50) {
	movlw	(032h)
	subwf	(_gFun_ucpTimeCnt),w
	skipc
	goto	u1381
	goto	u1380
u1381:
	goto	l1227
u1380:
	line	349
	
l7320:	
;FUNCTION.C: 349: gbUcp = 1;
	bsf	(_gbUcp/8),(_gbUcp)&7
	line	375
	
l1227:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_Deal
	__end_of_ADC_Deal:
;; =============== function _ADC_Deal ends ============

	signat	_ADC_Deal,88
	global	_KEY_Driver
psect	text619,local,class=CODE,delta=2
global __ptext619
__ptext619:

;; *************** function _KEY_Driver *****************
;; Defined at:
;;		line 217 in file "FUNCTION.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          1       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text619
	file	"FUNCTION.C"
	line	217
	global	__size_of_KEY_Driver
	__size_of_KEY_Driver	equ	__end_of_KEY_Driver-_KEY_Driver
	
_KEY_Driver:	
	opt	stack 6
; Regs used in _KEY_Driver: [wreg+status,2+status,0]
	line	218
	
l7220:	
;FUNCTION.C: 218: if ( (RA3==0) ) bkeyTemp = 1;
	btfsc	(43/8),(43)&7
	goto	u1061
	goto	u1060
u1061:
	goto	l1196
u1060:
	
l7222:	
	bsf	(_bkeyTemp/8),(_bkeyTemp)&7
	goto	l1197
	line	219
	
l1196:	
;FUNCTION.C: 219: else bkeyTemp = 0;
	bcf	(_bkeyTemp/8),(_bkeyTemp)&7
	
l1197:	
	line	221
;FUNCTION.C: 221: if (gbLedWait) {
	btfss	(_gbLedWait/8),(_gbLedWait)&7
	goto	u1071
	goto	u1070
u1071:
	goto	l7228
u1070:
	line	222
	
l7224:	
;FUNCTION.C: 222: gFun_keyTimeCnt = 0;
	clrf	(_gFun_keyTimeCnt)
	goto	l1199
	line	226
	
l7228:	
;FUNCTION.C: 224: }
;FUNCTION.C: 226: if (bkeyTemp != bkeyBuff) {
	btfsc	(_bkeyBuff/8),(_bkeyBuff)&7
	goto	u1081
	goto	u1080
u1081:
	movlw	1
	goto	u1082
u1080:
	movlw	0
u1082:
	movwf	(??_KEY_Driver+0)+0
	btfsc	(_bkeyTemp/8),(_bkeyTemp)&7
	goto	u1091
	goto	u1090
u1091:
	movlw	1
	goto	u1092
u1090:
	movlw	0
u1092:
	xorwf	(??_KEY_Driver+0)+0,w
	skipnz
	goto	u1101
	goto	u1100
u1101:
	goto	l7234
u1100:
	line	227
	
l7230:	
;FUNCTION.C: 227: gFun_keyTimeCnt = 0;
	clrf	(_gFun_keyTimeCnt)
	line	228
	
l7232:	
;FUNCTION.C: 228: bkeyBuff = bkeyTemp;
	bcf	(_bkeyBuff/8),(_bkeyBuff)&7
	btfss	(_bkeyTemp/8),(_bkeyTemp)&7
	goto	u1115
	bsf	(_bkeyBuff/8),(_bkeyBuff)&7
u1115:

	line	229
;FUNCTION.C: 229: } else {
	goto	l7250
	line	230
	
l7234:	
;FUNCTION.C: 230: if (gFun_keyTimeCnt < 5) {
	movlw	(05h)
	subwf	(_gFun_keyTimeCnt),w
	skipnc
	goto	u1121
	goto	u1120
u1121:
	goto	l7238
u1120:
	line	231
	
l7236:	
;FUNCTION.C: 231: gFun_keyTimeCnt++;
	incf	(_gFun_keyTimeCnt),f
	line	232
;FUNCTION.C: 232: } else {
	goto	l7250
	line	233
	
l7238:	
;FUNCTION.C: 233: if (bkeyBuff != bkeyCode) {
	btfsc	(_bkeyCode/8),(_bkeyCode)&7
	goto	u1131
	goto	u1130
u1131:
	movlw	1
	goto	u1132
u1130:
	movlw	0
u1132:
	movwf	(??_KEY_Driver+0)+0
	btfsc	(_bkeyBuff/8),(_bkeyBuff)&7
	goto	u1141
	goto	u1140
u1141:
	movlw	1
	goto	u1142
u1140:
	movlw	0
u1142:
	xorwf	(??_KEY_Driver+0)+0,w
	skipnz
	goto	u1151
	goto	u1150
u1151:
	goto	l7250
u1150:
	line	234
	
l7240:	
;FUNCTION.C: 234: bkeyCode = bkeyBuff;
	bcf	(_bkeyCode/8),(_bkeyCode)&7
	btfss	(_bkeyBuff/8),(_bkeyBuff)&7
	goto	u1165
	bsf	(_bkeyCode/8),(_bkeyCode)&7
u1165:

	line	235
;FUNCTION.C: 235: bkeyUp = 0;
	bcf	(_bkeyUp/8),(_bkeyUp)&7
	line	236
;FUNCTION.C: 236: if (bkeyBuff) {
	btfss	(_bkeyBuff/8),(_bkeyBuff)&7
	goto	u1171
	goto	u1170
u1171:
	goto	l1205
u1170:
	line	238
	
l7242:	
;FUNCTION.C: 238: if (gFun_keyIdleCnt <20) {
	movlw	(014h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_gFun_keyIdleCnt),w
	skipnc
	goto	u1181
	goto	u1180
u1181:
	goto	l1206
u1180:
	line	239
	
l7244:	
;FUNCTION.C: 239: gbKeyDouClick = 1;
	bsf	(_gbKeyDouClick/8),(_gbKeyDouClick)&7
	line	240
;FUNCTION.C: 240: bkeyDou = 1;
	bsf	(_bkeyDou/8),(_bkeyDou)&7
	line	241
;FUNCTION.C: 241: } else {
	goto	l7250
	
l1206:	
	line	242
;FUNCTION.C: 242: bkeyDou = 0;
	bcf	(_bkeyDou/8),(_bkeyDou)&7
	goto	l7250
	line	244
	
l1205:	
	line	246
;FUNCTION.C: 246: if (bkeyDou==0)
	btfsc	(_bkeyDou/8),(_bkeyDou)&7
	goto	u1191
	goto	u1190
u1191:
	goto	l7248
u1190:
	line	247
	
l7246:	
;FUNCTION.C: 247: bkeyUp = 1;
	bsf	(_bkeyUp/8),(_bkeyUp)&7
	line	248
	
l7248:	
;FUNCTION.C: 248: gFun_keyIdleCnt = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_gFun_keyIdleCnt)
	line	253
	
l7250:	
;FUNCTION.C: 249: }
;FUNCTION.C: 250: }
;FUNCTION.C: 251: }
;FUNCTION.C: 252: }
;FUNCTION.C: 253: if (bkeyCode==0) {
	btfsc	(_bkeyCode/8),(_bkeyCode)&7
	goto	u1201
	goto	u1200
u1201:
	goto	l1199
u1200:
	line	254
	
l7252:	
;FUNCTION.C: 254: if (gFun_keyIdleCnt < 255) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_gFun_keyIdleCnt),w
	xorlw	0FFh
	skipnz
	goto	u1211
	goto	u1210
u1211:
	goto	l7256
u1210:
	line	255
	
l7254:	
;FUNCTION.C: 255: gFun_keyIdleCnt++;
	incf	(_gFun_keyIdleCnt),f
	line	257
	
l7256:	
;FUNCTION.C: 256: }
;FUNCTION.C: 257: if (bkeyUp) {
	btfss	(_bkeyUp/8),(_bkeyUp)&7
	goto	u1221
	goto	u1220
u1221:
	goto	l1199
u1220:
	line	258
	
l7258:	
;FUNCTION.C: 258: if (gFun_keyIdleCnt > 25) {
	movlw	(01Ah)
	subwf	(_gFun_keyIdleCnt),w
	skipc
	goto	u1231
	goto	u1230
u1231:
	goto	l1199
u1230:
	line	259
	
l7260:	
;FUNCTION.C: 259: bkeyUp = 0;
	bcf	(_bkeyUp/8),(_bkeyUp)&7
	line	260
;FUNCTION.C: 260: gbKeyClick = 1;
	bsf	(_gbKeyClick/8),(_gbKeyClick)&7
	line	265
	
l1199:	
	return
	opt stack 0
GLOBAL	__end_of_KEY_Driver
	__end_of_KEY_Driver:
;; =============== function _KEY_Driver ends ============

	signat	_KEY_Driver,88
	global	_ISR
psect	text620,local,class=CODE,delta=2
global __ptext620
__ptext620:

;; *************** function _ISR *****************
;; Defined at:
;;		line 9 in file "MCU_ISR.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text620
	file	"MCU_ISR.c"
	line	9
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 3
; Regs used in _ISR: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text620
	line	10
	
i1l7430:	
;MCU_ISR.c: 10: if(TMR2IF)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(97/8),(97)&7
	goto	u156_21
	goto	u156_20
u156_21:
	goto	i1l7440
u156_20:
	line	12
	
i1l7432:	
;MCU_ISR.c: 11: {
;MCU_ISR.c: 12: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	14
	
i1l7434:	
;MCU_ISR.c: 14: if (++gTimeCntFor10ms >= 100) {
	movlw	(064h)
	incf	(_gTimeCntFor10ms),f	;volatile
	subwf	((_gTimeCntFor10ms)),w	;volatile
	skipc
	goto	u157_21
	goto	u157_20
u157_21:
	goto	i1l7440
u157_20:
	line	15
	
i1l7436:	
;MCU_ISR.c: 15: gTimeCntFor10ms = 0;
	clrf	(_gTimeCntFor10ms)	;volatile
	line	16
	
i1l7438:	
;MCU_ISR.c: 16: bTime10ms = 1;
	bsf	(_bTime10ms/8),(_bTime10ms)&7
	line	20
	
i1l7440:	
;MCU_ISR.c: 17: }
;MCU_ISR.c: 18: }
;MCU_ISR.c: 20: if(PAIE && PAIF)
	btfss	(91/8),(91)&7
	goto	u158_21
	goto	u158_20
u158_21:
	goto	i1l4582
u158_20:
	
i1l7442:	
	btfss	(88/8),(88)&7
	goto	u159_21
	goto	u159_20
u159_21:
	goto	i1l4582
u159_20:
	line	22
	
i1l7444:	
;MCU_ISR.c: 21: {
;MCU_ISR.c: 22: bakPORTA = PORTA;
	movf	(5),w	;volatile
	movwf	(_bakPORTA)	;volatile
	line	23
	
i1l7446:	
;MCU_ISR.c: 23: PAIF = 0;
	bcf	(88/8),(88)&7
	line	24
	
i1l7448:	
;MCU_ISR.c: 24: PAIE = 0;
	bcf	(91/8),(91)&7
	line	25
	
i1l7450:	
;MCU_ISR.c: 25: IOCA0 =0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1200/8)^080h,(1200)&7
	line	26
	
i1l7452:	
;MCU_ISR.c: 26: IOCA1 =0;
	bcf	(1201/8)^080h,(1201)&7
	line	27
	
i1l7454:	
;MCU_ISR.c: 27: IOCA2 =0;
	bcf	(1202/8)^080h,(1202)&7
	line	28
	
i1l7456:	
;MCU_ISR.c: 28: IOCA3=0;
	bcf	(1203/8)^080h,(1203)&7
	line	30
	
i1l4582:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text621,local,class=CODE,delta=2
global __ptext621
__ptext621:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
