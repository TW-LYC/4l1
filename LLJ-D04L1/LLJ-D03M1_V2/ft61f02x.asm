//Deviec:FT61F02X
//-----------------------Variable---------------------------------
		_gIsCupOk		EQU		70H
		_gbCupEvent		EQU		70H
		_gbLedWait		EQU		71H
		_gbOcp		EQU		71H
		_gbUcp		EQU		71H
		_gbKeyClick		EQU		71H
		_gbKeyDouClick		EQU		71H
		_gFun_workMode		EQU		77H
		_gFun_workTimeCntFor1s		EQU		3CH
		_gFun_workTimeCnt		EQU		2CH
		_gFun_adcIndex		EQU		31H
		_gFun_adcChIndex		EQU		2FH
		_gFun_adcBuffer		EQU		24H
		_gFun_adcBufferSum		EQU		26H
		_gFun_adCurrent		EQU		22H
		_gFun_adBatVol		EQU		20H
		_gFun_batVolState		EQU		32H
		_gFun_adcDealDelay		EQU		30H
		_gFun_ocpTimeCnt		EQU		3AH
		_gFun_ucpTimeCnt		EQU		3BH
		_gFun_keyTimeCnt		EQU		36H
		_gFun_keyIdleCnt		EQU		44H
		_gFun_chrState		EQU		33H
		_gFun_cupchrCodeBuff		EQU		34H
		_gFun_cupchrTimeCnt		EQU		35H
		_gFun_ledCnt_1hz		EQU		37H
		_gFun_ledCnt_2hz		EQU		38H
		_gFun_ledMode		EQU		39H
		_gFun_ledTimeCnt		EQU		2AH
		_gFun_ledStopCnt		EQU		28H
		_bkeyCode		EQU		70H
		_bkeyBuff		EQU		70H
		_bkeyTemp		EQU		70H
		_bkeyUp		EQU		70H
		_bkeyDou		EQU		70H
		_gbLed1hz		EQU		71H
		_gbLed2hz		EQU		71H
		_gbLedEnd		EQU		71H
		_bTime10ms		EQU		70H
		_gTimeCntFor10ms		EQU		3DH
		_bakPORTA		EQU		2EH
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	72H 			//0006 	01F2
		LDR 	PCLATH,0 		//0007 	080A
		STR 	73H 			//0008 	01F3
		LJUMP 	296H 			//0009 	3A96
		LJUMP 	2F8H 			//000A 	3AF8

		//;FUNCTION.C: 532: if (gFun_workMode == WM_Error) {
		LDR 	77H,1 			//000B 	08F7
		ORG		000CH
		BTSS 	STATUS,2 		//000C 	1D03
		LJUMP 	14H 			//000D 	3814

		//;FUNCTION.C: 533: if (gbLedEnd) {
		BTSS 	71H,4 			//000E 	1E71
		LJUMP 	12H 			//000F 	3812

		//;FUNCTION.C: 534: FUN_EnterStandby();
		LCALL 	324H 			//0010 	3324

		//;FUNCTION.C: 535: } else {
		LJUMP 	6DH 			//0011 	386D

		//;FUNCTION.C: 536: LED_SetMode(LM_RedBlue_1HZ_1T);
		LDWI 	7H 			//0012 	2A07
		LJUMP 	6CH 			//0013 	386C
		ORG		0014H
		DECR 	77H,0 			//0014 	0D77
		BTSS 	STATUS,2 		//0015 	1D03
		LJUMP 	4BH 			//0016 	384B

		//;FUNCTION.C: 539: LED_SetMode(LM_Off);
		LDWI 	0H 			//0017 	2A00
		LCALL 	1A8H 			//0018 	31A8

		//;FUNCTION.C: 540: if (gbKeyDouClick) {
		BTSS 	71H,1 			//0019 	1CF1
		LJUMP 	2AH 			//001A 	382A

		//;FUNCTION.C: 541: if (gIsCupOk) {
		BTSS 	70H,6 			//001B 	1F70
		ORG		001CH
		LJUMP 	28H 			//001C 	3828

		//;FUNCTION.C: 542: if (gFun_adBatVol > ((320)*47ul*512/147/100)) {
		LDWI 	2H 			//001D 	2A02
		SUBWR 	21H,0 			//001E 	0C21
		LDWI 	CH 			//001F 	2A0C
		BTSC 	STATUS,2 		//0020 	1503
		SUBWR 	20H,0 			//0021 	0C20
		BTSS 	STATUS,0 		//0022 	1C03
		LJUMP 	26H 			//0023 	3826
		ORG		0024H

		//;FUNCTION.C: 543: FUN_EnterWorkMode();
		LCALL 	32BH 			//0024 	332B

		//;FUNCTION.C: 544: } else {
		LJUMP 	2AH 			//0025 	382A

		//;FUNCTION.C: 545: LED_SetMode(LM_Red_1HZ_10T);
		LDWI 	5H 			//0026 	2A05
		LJUMP 	29H 			//0027 	3829

		//;FUNCTION.C: 548: LED_SetMode(LM_Red_1HZ_3T);
		LDWI 	3H 			//0028 	2A03
		LCALL 	1A8H 			//0029 	31A8

		//;FUNCTION.C: 549: }
		//;FUNCTION.C: 550: }
		//;FUNCTION.C: 551: if (gbCupEvent && gIsCupOk) {
		BTSC 	70H,7 			//002A 	17F0
		BTSS 	70H,6 			//002B 	1F70
		ORG		002CH
		LJUMP 	2FH 			//002C 	382F

		//;FUNCTION.C: 552: LED_SetMode(LM_Blue_1HZ_3T);
		LDWI 	4H 			//002D 	2A04
		LCALL 	1A8H 			//002E 	31A8

		//;FUNCTION.C: 553: }
		//;FUNCTION.C: 554: if(gbCupEvent && !gIsCupOk){
		BTSC 	70H,7 			//002F 	17F0
		BTSC 	70H,6 			//0030 	1770
		LJUMP 	34H 			//0031 	3834

		//;FUNCTION.C: 555: LED_SetMode(LM_Red_1HZ_3T);
		LDWI 	3H 			//0032 	2A03
		LCALL 	1A8H 			//0033 	31A8
		ORG		0034H

		//;FUNCTION.C: 556: }
		//;FUNCTION.C: 557: if (gFun_chrState == 0 && gbLedWait==0&&gFun_ledMode==1) {
		LDR 	33H,1 			//0034 	08B3
		BTSC 	STATUS,2 		//0035 	1503
		BTSC 	71H,5 			//0036 	16F1
		LJUMP 	48H 			//0037 	3848
		DECRSZ 	39H,0 		//0038 	0E39
		LJUMP 	48H 			//0039 	3848

		//;FUNCTION.C: 558: if (++gFun_workTimeCnt > 100*15) {
		INCR	2CH,1 			//003A 	09AC
		BTSC 	STATUS,2 		//003B 	1503
		ORG		003CH
		INCR	2DH,1 			//003C 	09AD
		LDWI 	5H 			//003D 	2A05
		SUBWR 	2DH,0 			//003E 	0C2D
		LDWI 	DDH 			//003F 	2ADD
		BTSC 	STATUS,2 		//0040 	1503
		SUBWR 	2CH,0 			//0041 	0C2C
		BTSS 	STATUS,0 		//0042 	1C03
		LJUMP 	6DH 			//0043 	386D
		ORG		0044H

		//;FUNCTION.C: 559: gFun_workTimeCnt = 0;
		CLRR 	2CH 			//0044 	012C
		CLRR 	2DH 			//0045 	012D

		//;FUNCTION.C: 560: MCU_EnterSleep();
		LCALL 	2ECH 			//0046 	32EC
		LJUMP 	6DH 			//0047 	386D

		//;FUNCTION.C: 563: gFun_workTimeCnt = 0;
		CLRR 	2CH 			//0048 	012C
		CLRR 	2DH 			//0049 	012D
		LJUMP 	6DH 			//004A 	386D
		LDR 	77H,0 			//004B 	0877
		ORG		004CH
		XORWI 	2H 			//004C 	2602
		BTSS 	STATUS,2 		//004D 	1D03
		LJUMP 	59H 			//004E 	3859

		//;FUNCTION.C: 566: LED_SetMode(LM_Blue_On);
		LDWI 	2H 			//004F 	2A02
		LCALL 	1A8H 			//0050 	31A8

		//;FUNCTION.C: 567: if (gbKeyClick) {
		BTSS 	71H,0 			//0051 	1C71
		LJUMP 	54H 			//0052 	3854

		//;FUNCTION.C: 568: FUN_EnterStandby();
		LCALL 	324H 			//0053 	3324
		ORG		0054H

		//;FUNCTION.C: 569: }
		//;FUNCTION.C: 570: if (gIsCupOk==0) {
		BTSC 	70H,6 			//0054 	1770
		LJUMP 	6DH 			//0055 	386D

		//;FUNCTION.C: 571: LED_SetMode(LM_Red_1HZ_3T);
		LDWI 	3H 			//0056 	2A03
		LCALL 	1A8H 			//0057 	31A8
		LJUMP 	10H 			//0058 	3810
		LDR 	77H,0 			//0059 	0877
		XORWI 	3H 			//005A 	2603
		BTSS 	STATUS,2 		//005B 	1D03
		ORG		005CH
		LJUMP 	5FH 			//005C 	385F

		//;FUNCTION.C: 575: LED_SetMode(LM_Off);
		LDWI 	0H 			//005D 	2A00
		LJUMP 	6CH 			//005E 	386C

		//;FUNCTION.C: 576: } else if (gFun_workMode == WM_Charge) {
		LDR 	77H,0 			//005F 	0877
		XORWI 	4H 			//0060 	2604
		BTSS 	STATUS,2 		//0061 	1D03
		LJUMP 	6DH 			//0062 	386D

		//;FUNCTION.C: 577: if (gFun_chrState == CS_Charge){
		DECRSZ 	33H,0 		//0063 	0E33
		ORG		0064H
		LJUMP 	67H 			//0064 	3867

		//;FUNCTION.C: 578: LED_SetMode(LM_Red_On);
		LDWI 	1H 			//0065 	2A01
		LJUMP 	6CH 			//0066 	386C

		//;FUNCTION.C: 579: } else if (gFun_chrState == CS_End){
		LDR 	33H,0 			//0067 	0833
		XORWI 	2H 			//0068 	2602
		BTSS 	STATUS,2 		//0069 	1D03
		LJUMP 	10H 			//006A 	3810

		//;FUNCTION.C: 580: LED_SetMode(LM_Blue_On);
		LDWI 	2H 			//006B 	2A02
		ORG		006CH
		LCALL 	1A8H 			//006C 	31A8

		//;FUNCTION.C: 581: } else {
		//;FUNCTION.C: 583: }
		//;FUNCTION.C: 584: }
		//;FUNCTION.C: 585: if (gFun_workMode != WM_Charge) {
		LDR 	77H,0 			//006D 	0877
		XORWI 	4H 			//006E 	2604
		BTSC 	STATUS,2 		//006F 	1503
		LJUMP 	76H 			//0070 	3876

		//;FUNCTION.C: 586: if (gFun_chrState > 0) {
		LDR 	33H,0 			//0071 	0833
		BTSC 	STATUS,2 		//0072 	1503
		LJUMP 	76H 			//0073 	3876
		ORG		0074H

		//;FUNCTION.C: 587: gFun_workMode = WM_Charge;
		LDWI 	4H 			//0074 	2A04
		STR 	77H 			//0075 	01F7

		//;FUNCTION.C: 588: }
		//;FUNCTION.C: 589: }
		//;FUNCTION.C: 591: if (gFun_workMode == WM_Work) {
		LDR 	77H,0 			//0076 	0877
		XORWI 	2H 			//0077 	2602
		BTSS 	STATUS,2 		//0078 	1D03
		LJUMP 	A2H 			//0079 	38A2
		LDWI 	64H 			//007A 	2A64

		//;FUNCTION.C: 592: RA4=1;
		BSR 	5H,4 			//007B 	1A05
		ORG		007CH

		//;FUNCTION.C: 593: if (++gFun_workTimeCntFor1s >=100) {
		INCR	3CH,1 			//007C 	09BC
		SUBWR 	3CH,0 			//007D 	0C3C
		BTSS 	STATUS,0 		//007E 	1C03
		LJUMP 	91H 			//007F 	3891

		//;FUNCTION.C: 594: gFun_workTimeCntFor1s = 0;
		CLRR 	3CH 			//0080 	013C

		//;FUNCTION.C: 595: if (gFun_workTimeCnt<65535)
		INCR	2CH,0 			//0081 	092C
		BTSC 	STATUS,2 		//0082 	1503
		INCR	2DH,0 			//0083 	092D
		ORG		0084H
		BTSC 	STATUS,2 		//0084 	1503
		LJUMP 	89H 			//0085 	3889

		//;FUNCTION.C: 596: gFun_workTimeCnt++;
		INCR	2CH,1 			//0086 	09AC
		BTSC 	STATUS,2 		//0087 	1503
		INCR	2DH,1 			//0088 	09AD

		//;FUNCTION.C: 597: if (gFun_workTimeCnt >= 40){
		LDWI 	0H 			//0089 	2A00
		SUBWR 	2DH,0 			//008A 	0C2D
		LDWI 	28H 			//008B 	2A28
		ORG		008CH
		BTSC 	STATUS,2 		//008C 	1503
		SUBWR 	2CH,0 			//008D 	0C2C
		BTSS 	STATUS,0 		//008E 	1C03
		LJUMP 	91H 			//008F 	3891

		//;FUNCTION.C: 598: FUN_EnterStandby();
		LCALL 	324H 			//0090 	3324

		//;FUNCTION.C: 599: }
		//;FUNCTION.C: 600: }
		//;FUNCTION.C: 601: if (gbOcp || gbUcp || gFun_batVolState == 0) {
		BTSS 	71H,6 			//0091 	1F71
		BTSC 	71H,7 			//0092 	17F1
		LJUMP 	97H 			//0093 	3897
		ORG		0094H
		LDR 	32H,1 			//0094 	08B2
		BTSS 	STATUS,2 		//0095 	1D03
		LJUMP 	A3H 			//0096 	38A3

		//;FUNCTION.C: 602: if (gbOcp) {
		BTSS 	71H,6 			//0097 	1F71
		LJUMP 	9BH 			//0098 	389B

		//;FUNCTION.C: 603: LED_SetMode(LM_Red_2HZ_10T);
		LDWI 	6H 			//0099 	2A06
		LJUMP 	9FH 			//009A 	389F

		//;FUNCTION.C: 604: } else {
		//;FUNCTION.C: 605: if (gFun_batVolState == 0){
		LDR 	32H,1 			//009B 	08B2
		ORG		009CH
		BTSS 	STATUS,2 		//009C 	1D03
		LJUMP 	A0H 			//009D 	38A0

		//;FUNCTION.C: 606: LED_SetMode(LM_Red_1HZ_10T);
		LDWI 	5H 			//009E 	2A05
		LCALL 	1A8H 			//009F 	31A8

		//;FUNCTION.C: 607: }
		//;FUNCTION.C: 608: }
		//;FUNCTION.C: 609: FUN_EnterStandby();
		LCALL 	324H 			//00A0 	3324
		LJUMP 	A3H 			//00A1 	38A3

		//;FUNCTION.C: 613: RA4=0;
		BCR 	5H,4 			//00A2 	1205

		//;FUNCTION.C: 614: }
		//;FUNCTION.C: 616: gbLedEnd = 0;
		BCR 	71H,4 			//00A3 	1271
		ORG		00A4H

		//;FUNCTION.C: 617: gbCupEvent = 0;
		BCR 	70H,7 			//00A4 	13F0

		//;FUNCTION.C: 618: gbKeyClick = 0;
		BCR 	71H,0 			//00A5 	1071

		//;FUNCTION.C: 619: gbKeyDouClick = 0;
		BCR 	71H,1 			//00A6 	10F1
		RET		 					//00A7 	0004

		//;FUNCTION.C: 218: if ( (RA3==0) ) bkeyTemp = 1;
		BTSC 	5H,3 			//00A8 	1585
		LJUMP 	ACH 			//00A9 	38AC
		BSR 	70H,4 			//00AA 	1A70
		LJUMP 	ADH 			//00AB 	38AD
		ORG		00ACH

		//;FUNCTION.C: 219: else bkeyTemp = 0;
		BCR 	70H,4 			//00AC 	1270

		//;FUNCTION.C: 221: if (gbLedWait) {
		BTSS 	71H,5 			//00AD 	1EF1
		LJUMP 	B1H 			//00AE 	38B1

		//;FUNCTION.C: 222: gFun_keyTimeCnt = 0;
		CLRR 	36H 			//00AF 	0136
		RET		 					//00B0 	0004

		//;FUNCTION.C: 224: }
		//;FUNCTION.C: 226: if (bkeyTemp != bkeyBuff) {
		BTSS 	70H,1 			//00B1 	1CF0
		LJUMP 	B5H 			//00B2 	38B5
		LDWI 	1H 			//00B3 	2A01
		ORG		00B4H
		LJUMP 	B6H 			//00B4 	38B6
		LDWI 	0H 			//00B5 	2A00
		STR 	74H 			//00B6 	01F4
		BTSS 	70H,4 			//00B7 	1E70
		LJUMP 	BBH 			//00B8 	38BB
		LDWI 	1H 			//00B9 	2A01
		LJUMP 	BCH 			//00BA 	38BC
		LDWI 	0H 			//00BB 	2A00
		ORG		00BCH
		XORWR 	74H,0 			//00BC 	0474
		BTSC 	STATUS,2 		//00BD 	1503
		LJUMP 	C4H 			//00BE 	38C4

		//;FUNCTION.C: 227: gFun_keyTimeCnt = 0;
		CLRR 	36H 			//00BF 	0136

		//;FUNCTION.C: 228: bkeyBuff = bkeyTemp;
		BCR 	70H,1 			//00C0 	10F0
		BTSC 	70H,4 			//00C1 	1670
		BSR 	70H,1 			//00C2 	18F0

		//;FUNCTION.C: 229: } else {
		LJUMP 	F0H 			//00C3 	38F0
		ORG		00C4H

		//;FUNCTION.C: 230: if (gFun_keyTimeCnt < 5) {
		LDWI 	5H 			//00C4 	2A05
		SUBWR 	36H,0 			//00C5 	0C36
		BTSC 	STATUS,0 		//00C6 	1403
		LJUMP 	CAH 			//00C7 	38CA

		//;FUNCTION.C: 231: gFun_keyTimeCnt++;
		INCR	36H,1 			//00C8 	09B6

		//;FUNCTION.C: 232: } else {
		LJUMP 	F0H 			//00C9 	38F0

		//;FUNCTION.C: 233: if (bkeyBuff != bkeyCode) {
		BTSS 	70H,2 			//00CA 	1D70
		LJUMP 	CEH 			//00CB 	38CE
		ORG		00CCH
		LDWI 	1H 			//00CC 	2A01
		LJUMP 	CFH 			//00CD 	38CF
		LDWI 	0H 			//00CE 	2A00
		STR 	74H 			//00CF 	01F4
		BTSS 	70H,1 			//00D0 	1CF0
		LJUMP 	D4H 			//00D1 	38D4
		LDWI 	1H 			//00D2 	2A01
		LJUMP 	D5H 			//00D3 	38D5
		ORG		00D4H
		LDWI 	0H 			//00D4 	2A00
		XORWR 	74H,0 			//00D5 	0474
		BTSC 	STATUS,2 		//00D6 	1503
		LJUMP 	F0H 			//00D7 	38F0

		//;FUNCTION.C: 234: bkeyCode = bkeyBuff;
		BCR 	70H,2 			//00D8 	1170
		BTSS 	70H,1 			//00D9 	1CF0
		LJUMP 	DCH 			//00DA 	38DC
		BSR 	70H,2 			//00DB 	1970
		ORG		00DCH

		//;FUNCTION.C: 235: bkeyUp = 0;
		BCR 	70H,5 			//00DC 	12F0

		//;FUNCTION.C: 236: if (bkeyBuff) {
		BTSS 	70H,1 			//00DD 	1CF0
		LJUMP 	EAH 			//00DE 	38EA

		//;FUNCTION.C: 238: if (gFun_keyIdleCnt <20) {
		LDWI 	14H 			//00DF 	2A14
		BCR 	STATUS,5 		//00E0 	1283
		BCR 	STATUS,6 		//00E1 	1303
		SUBWR 	44H,0 			//00E2 	0C44
		BTSC 	STATUS,0 		//00E3 	1403
		ORG		00E4H
		LJUMP 	E8H 			//00E4 	38E8

		//;FUNCTION.C: 239: gbKeyDouClick = 1;
		BSR 	71H,1 			//00E5 	18F1

		//;FUNCTION.C: 240: bkeyDou = 1;
		BSR 	70H,3 			//00E6 	19F0

		//;FUNCTION.C: 241: } else {
		LJUMP 	F0H 			//00E7 	38F0

		//;FUNCTION.C: 242: bkeyDou = 0;
		BCR 	70H,3 			//00E8 	11F0
		LJUMP 	F0H 			//00E9 	38F0

		//;FUNCTION.C: 246: if (bkeyDou==0)
		BTSC 	70H,3 			//00EA 	15F0
		LJUMP 	EDH 			//00EB 	38ED
		ORG		00ECH

		//;FUNCTION.C: 247: bkeyUp = 1;
		BSR 	70H,5 			//00EC 	1AF0

		//;FUNCTION.C: 248: gFun_keyIdleCnt = 0;
		BCR 	STATUS,5 		//00ED 	1283
		BCR 	STATUS,6 		//00EE 	1303
		CLRR 	44H 			//00EF 	0144

		//;FUNCTION.C: 249: }
		//;FUNCTION.C: 250: }
		//;FUNCTION.C: 251: }
		//;FUNCTION.C: 252: }
		//;FUNCTION.C: 253: if (bkeyCode==0) {
		BTSC 	70H,2 			//00F0 	1570
		RET		 					//00F1 	0004

		//;FUNCTION.C: 254: if (gFun_keyIdleCnt < 255) {
		BCR 	STATUS,5 		//00F2 	1283
		BCR 	STATUS,6 		//00F3 	1303
		ORG		00F4H
		LDR 	44H,0 			//00F4 	0844
		XORWI 	FFH 			//00F5 	26FF
		BTSS 	STATUS,2 		//00F6 	1D03

		//;FUNCTION.C: 255: gFun_keyIdleCnt++;
		INCR	44H,1 			//00F7 	09C4

		//;FUNCTION.C: 256: }
		//;FUNCTION.C: 257: if (bkeyUp) {
		BTSS 	70H,5 			//00F8 	1EF0
		RET		 					//00F9 	0004

		//;FUNCTION.C: 258: if (gFun_keyIdleCnt > 25) {
		LDWI 	1AH 			//00FA 	2A1A
		SUBWR 	44H,0 			//00FB 	0C44
		ORG		00FCH
		BTSS 	STATUS,0 		//00FC 	1C03
		RET		 					//00FD 	0004

		//;FUNCTION.C: 259: bkeyUp = 0;
		BCR 	70H,5 			//00FE 	12F0

		//;FUNCTION.C: 260: gbKeyClick = 1;
		BSR 	71H,0 			//00FF 	1871
		RET		 					//0100 	0004

		//;FUNCTION.C: 426: if (++gFun_ledCnt_1hz >=50) {
		LDWI 	32H 			//0101 	2A32
		INCR	37H,1 			//0102 	09B7
		SUBWR 	37H,0 			//0103 	0C37
		ORG		0104H
		BTSS 	STATUS,0 		//0104 	1C03
		LJUMP 	109H 			//0105 	3909
		LDWI 	4H 			//0106 	2A04

		//;FUNCTION.C: 427: gFun_ledCnt_1hz = 0;
		CLRR 	37H 			//0107 	0137

		//;FUNCTION.C: 428: gbLed1hz = ~gbLed1hz;
		XORWR 	71H,1 			//0108 	04F1

		//;FUNCTION.C: 429: }
		//;FUNCTION.C: 430: if (++gFun_ledCnt_2hz >=25) {
		LDWI 	19H 			//0109 	2A19
		INCR	38H,1 			//010A 	09B8
		SUBWR 	38H,0 			//010B 	0C38
		ORG		010CH
		BTSS 	STATUS,0 		//010C 	1C03
		LJUMP 	111H 			//010D 	3911
		LDWI 	8H 			//010E 	2A08

		//;FUNCTION.C: 431: gFun_ledCnt_2hz = 0;
		CLRR 	38H 			//010F 	0138

		//;FUNCTION.C: 432: gbLed2hz = ~gbLed2hz;
		XORWR 	71H,1 			//0110 	04F1

		//;FUNCTION.C: 433: }
		//;FUNCTION.C: 434: if (gFun_ledStopCnt !=0) {
		LDR 	29H,0 			//0111 	0829
		IORWR 	28H,0 			//0112 	0328
		BTSC 	STATUS,2 		//0113 	1503
		ORG		0114H
		LJUMP 	149H 			//0114 	3949

		//;FUNCTION.C: 435: if (gFun_ledTimeCnt <65535)
		INCR	2AH,0 			//0115 	092A
		BTSC 	STATUS,2 		//0116 	1503
		INCR	2BH,0 			//0117 	092B
		BTSC 	STATUS,2 		//0118 	1503
		LJUMP 	11DH 			//0119 	391D

		//;FUNCTION.C: 436: gFun_ledTimeCnt++;
		INCR	2AH,1 			//011A 	09AA
		BTSC 	STATUS,2 		//011B 	1503
		ORG		011CH
		INCR	2BH,1 			//011C 	09AB

		//;FUNCTION.C: 437: if (gFun_ledTimeCnt >= gFun_ledStopCnt) {
		LDR 	29H,0 			//011D 	0829
		SUBWR 	2BH,0 			//011E 	0C2B
		BTSS 	STATUS,2 		//011F 	1D03
		LJUMP 	123H 			//0120 	3923
		LDR 	28H,0 			//0121 	0828
		SUBWR 	2AH,0 			//0122 	0C2A
		BTSS 	STATUS,0 		//0123 	1C03
		ORG		0124H
		LJUMP 	149H 			//0124 	3949

		//;FUNCTION.C: 438: gFun_ledMode = 0;
		CLRR 	39H 			//0125 	0139

		//;FUNCTION.C: 439: gFun_ledTimeCnt = 0;
		CLRR 	2AH 			//0126 	012A
		CLRR 	2BH 			//0127 	012B

		//;FUNCTION.C: 440: gFun_ledStopCnt = 0;
		CLRR 	28H 			//0128 	0128
		CLRR 	29H 			//0129 	0129

		//;FUNCTION.C: 441: gbLedEnd = 1;
		BSR 	71H,4 			//012A 	1A71

		//;FUNCTION.C: 442: gbLedWait = 0;
		BCR 	71H,5 			//012B 	12F1
		ORG		012CH
		LJUMP 	149H 			//012C 	3949

		//;FUNCTION.C: 447: case LM_Off:
		//;FUNCTION.C: 448: RC3=0;
		BCR 	7H,3 			//012D 	1187

		//;FUNCTION.C: 449: RC2=0;
		BCR 	7H,2 			//012E 	1107

		//;FUNCTION.C: 450: break;
		RET		 					//012F 	0004

		//;FUNCTION.C: 451: case LM_Red_On:
		//;FUNCTION.C: 452: RC3=1;
		BSR 	7H,3 			//0130 	1987

		//;FUNCTION.C: 453: RC2=0;
		BCR 	7H,2 			//0131 	1107

		//;FUNCTION.C: 454: break;
		RET		 					//0132 	0004

		//;FUNCTION.C: 455: case LM_Blue_On:
		//;FUNCTION.C: 456: RC3=0;
		BCR 	7H,3 			//0133 	1187
		ORG		0134H

		//;FUNCTION.C: 457: RC2=1;
		BSR 	7H,2 			//0134 	1907

		//;FUNCTION.C: 458: break;
		RET		 					//0135 	0004

		//;FUNCTION.C: 459: case LM_Red_1HZ_3T:
		//;FUNCTION.C: 460: if (gbLed1hz){
		BTSS 	71H,2 			//0136 	1D71
		LJUMP 	13AH 			//0137 	393A

		//;FUNCTION.C: 461: RC3=1;
		BSR 	7H,3 			//0138 	1987

		//;FUNCTION.C: 462: } else {
		LJUMP 	13BH 			//0139 	393B

		//;FUNCTION.C: 463: RC3=0;
		BCR 	7H,3 			//013A 	1187

		//;FUNCTION.C: 464: }
		//;FUNCTION.C: 465: RC2=0;
		BCR 	7H,2 			//013B 	1107
		ORG		013CH

		//;FUNCTION.C: 466: break;
		RET		 					//013C 	0004

		//;FUNCTION.C: 467: case LM_Blue_1HZ_3T:
		//;FUNCTION.C: 468: RC3=0;
		BCR 	7H,3 			//013D 	1187

		//;FUNCTION.C: 469: if (gbLed1hz){
		BTSS 	71H,2 			//013E 	1D71
		LJUMP 	13BH 			//013F 	393B

		//;FUNCTION.C: 470: RC2=1;
		BSR 	7H,2 			//0140 	1907

		//;FUNCTION.C: 471: } else {
		RET		 					//0141 	0004

		//;FUNCTION.C: 475: case LM_Red_1HZ_10T:
		//;FUNCTION.C: 476: if (gbLed1hz){
		LJUMP 	136H 			//0142 	3936

		//;FUNCTION.C: 483: case LM_Red_2HZ_10T:
		//;FUNCTION.C: 484: if (gbLed2hz){
		BTSC 	71H,3 			//0143 	15F1
		ORG		0144H
		LJUMP 	138H 			//0144 	3938
		LJUMP 	13AH 			//0145 	393A

		//;FUNCTION.C: 491: case LM_RedBlue_1HZ_1T:
		//;FUNCTION.C: 492: if (gbLed1hz){
		BTSC 	71H,2 			//0146 	1571
		LJUMP 	130H 			//0147 	3930
		LJUMP 	133H 			//0148 	3933
		LDR 	39H,0 			//0149 	0839
		STR 	FSR 			//014A 	0184
		LDWI 	8H 			//014B 	2A08
		ORG		014CH
		SUBWR 	FSR,0 			//014C 	0C04
		BTSC 	STATUS,0 		//014D 	1403
		RET		 					//014E 	0004
		LDWI 	3H 			//014F 	2A03
		STR 	PCLATH 			//0150 	018A
		LDWI 	1CH 			//0151 	2A1C
		ADDWR 	FSR,0 			//0152 	0B04
		STR 	PCL 			//0153 	0182
		ORG		0154H
		RET		 					//0154 	0004

		//;FUNCTION.C: 301: if (gFun_workMode == WM_Sleep) {
		LDR 	77H,0 			//0155 	0877
		XORWI 	3H 			//0156 	2603
		BTSS 	STATUS,2 		//0157 	1D03
		LJUMP 	15CH 			//0158 	395C

		//;FUNCTION.C: 302: gFun_ucpTimeCnt = 0;
		CLRR 	3BH 			//0159 	013B

		//;FUNCTION.C: 303: gFun_ocpTimeCnt = 0;
		CLRR 	3AH 			//015A 	013A

		//;FUNCTION.C: 304: } else {
		RET		 					//015B 	0004
		ORG		015CH

		//;FUNCTION.C: 305: if (gFun_adcDealDelay < 10) {
		LDWI 	AH 			//015C 	2A0A
		SUBWR 	30H,0 			//015D 	0C30
		BTSC 	STATUS,0 		//015E 	1403
		LJUMP 	162H 			//015F 	3962

		//;FUNCTION.C: 306: gFun_adcDealDelay++;
		INCR	30H,1 			//0160 	09B0
		RET		 					//0161 	0004
		LDWI 	1H 			//0162 	2A01

		//;FUNCTION.C: 309: gFun_adcDealDelay = 0;
		CLRR 	30H 			//0163 	0130
		ORG		0164H

		//;FUNCTION.C: 310: }
		//;FUNCTION.C: 313: if (gFun_adBatVol < ((275)*47ul*512/147/100)) {
		SUBWR 	21H,0 			//0164 	0C21
		LDWI 	C2H 			//0165 	2AC2
		BTSC 	STATUS,2 		//0166 	1503
		SUBWR 	20H,0 			//0167 	0C20
		BTSC 	STATUS,0 		//0168 	1403
		LJUMP 	16CH 			//0169 	396C

		//;FUNCTION.C: 314: gFun_batVolState = 0;
		CLRR 	32H 			//016A 	0132

		//;FUNCTION.C: 315: } else if (gFun_adBatVol < ((320)*47ul*512/147/100)) {
		LJUMP 	178H 			//016B 	3978
		ORG		016CH
		LDWI 	2H 			//016C 	2A02
		SUBWR 	21H,0 			//016D 	0C21
		LDWI 	BH 			//016E 	2A0B
		BTSC 	STATUS,2 		//016F 	1503
		SUBWR 	20H,0 			//0170 	0C20
		BTSC 	STATUS,0 		//0171 	1403
		LJUMP 	176H 			//0172 	3976

		//;FUNCTION.C: 316: gFun_batVolState = 1;
		CLRR 	32H 			//0173 	0132
		ORG		0174H
		INCR	32H,1 			//0174 	09B2

		//;FUNCTION.C: 317: } else {
		LJUMP 	178H 			//0175 	3978

		//;FUNCTION.C: 318: gFun_batVolState = 2;
		LDWI 	2H 			//0176 	2A02
		STR 	32H 			//0177 	01B2

		//;FUNCTION.C: 319: }
		//;FUNCTION.C: 325: if (gFun_workMode == WM_Work) {
		LDR 	77H,0 			//0178 	0877
		XORWI 	2H 			//0179 	2602
		BTSS 	STATUS,2 		//017A 	1D03
		LJUMP 	159H 			//017B 	3959
		ORG		017CH

		//;FUNCTION.C: 327: gFun_motoCurrState = 0;
		LDWI 	0H 			//017C 	2A00
		SUBWR 	23H,0 			//017D 	0C23
		LDWI 	FH 			//017E 	2A0F
		BTSC 	STATUS,2 		//017F 	1503
		SUBWR 	22H,0 			//0180 	0C22
		BTSC 	STATUS,0 		//0181 	1403
		LJUMP 	18DH 			//0182 	398D

		//;FUNCTION.C: 328: if (gFun_ocpTimeCnt)
		LDR 	3AH,0 			//0183 	083A
		ORG		0184H
		BTSC 	STATUS,2 		//0184 	1503
		LJUMP 	187H 			//0185 	3987

		//;FUNCTION.C: 329: gFun_ocpTimeCnt--;
		DECR 	3AH,1 			//0186 	0DBA

		//;FUNCTION.C: 330: if (gFun_ucpTimeCnt < 255)
		LDR 	3BH,0 			//0187 	083B
		XORWI 	FFH 			//0188 	26FF
		BTSC 	STATUS,2 		//0189 	1503
		LJUMP 	19FH 			//018A 	399F

		//;FUNCTION.C: 331: gFun_ucpTimeCnt++;
		INCR	3BH,1 			//018B 	09BB
		ORG		018CH
		LJUMP 	19FH 			//018C 	399F

		//;FUNCTION.C: 333: gFun_motoCurrState = 1;
		LDWI 	0H 			//018D 	2A00
		SUBWR 	23H,0 			//018E 	0C23
		LDWI 	40H 			//018F 	2A40
		BTSC 	STATUS,2 		//0190 	1503
		SUBWR 	22H,0 			//0191 	0C22

		//;FUNCTION.C: 334: if (gFun_ocpTimeCnt)
		LDR 	3AH,0 			//0192 	083A
		BTSC 	STATUS,0 		//0193 	1403
		ORG		0194H
		LJUMP 	199H 			//0194 	3999
		BTSC 	STATUS,2 		//0195 	1503
		LJUMP 	19CH 			//0196 	399C

		//;FUNCTION.C: 335: gFun_ocpTimeCnt--;
		DECR 	3AH,1 			//0197 	0DBA
		LJUMP 	19CH 			//0198 	399C

		//;FUNCTION.C: 340: if (gFun_ocpTimeCnt < 255)
		//;FUNCTION.C: 336: if (gFun_ucpTimeCnt)
		XORWI 	FFH 			//0199 	26FF
		BTSS 	STATUS,2 		//019A 	1D03

		//;FUNCTION.C: 341: gFun_ocpTimeCnt++;
		INCR	3AH,1 			//019B 	09BA
		ORG		019CH

		//;FUNCTION.C: 342: if (gFun_ucpTimeCnt)
		LDR 	3BH,0 			//019C 	083B
		BTSS 	STATUS,2 		//019D 	1D03

		//;FUNCTION.C: 337: gFun_ucpTimeCnt--;
		DECR 	3BH,1 			//019E 	0DBB

		//;FUNCTION.C: 344: }
		//;FUNCTION.C: 345: if (gFun_ocpTimeCnt >= 2) {
		LDWI 	2H 			//019F 	2A02
		SUBWR 	3AH,0 			//01A0 	0C3A
		BTSC 	STATUS,0 		//01A1 	1403

		//;FUNCTION.C: 346: gbOcp = 1;
		BSR 	71H,6 			//01A2 	1B71

		//;FUNCTION.C: 347: }
		//;FUNCTION.C: 348: if (gFun_ucpTimeCnt >= 50) {
		LDWI 	32H 			//01A3 	2A32
		ORG		01A4H
		SUBWR 	3BH,0 			//01A4 	0C3B
		BTSC 	STATUS,0 		//01A5 	1403

		//;FUNCTION.C: 349: gbUcp = 1;
		BSR 	71H,7 			//01A6 	1BF1
		RET		 					//01A7 	0004
		STR 	74H 			//01A8 	01F4

		//;FUNCTION.C: 395: if (gFun_ledMode != mode && gFun_ledStopCnt==0) {
		XORWR 	39H,0 			//01A9 	0439
		BTSC 	STATUS,2 		//01AA 	1503
		RET		 					//01AB 	0004
		ORG		01ACH
		LDR 	29H,0 			//01AC 	0829
		IORWR 	28H,0 			//01AD 	0328
		BTSS 	STATUS,2 		//01AE 	1D03
		RET		 					//01AF 	0004

		//;FUNCTION.C: 396: gFun_ledMode = mode;
		LDR 	74H,0 			//01B0 	0874
		STR 	39H 			//01B1 	01B9

		//;FUNCTION.C: 397: gFun_ledCnt_1hz = 0;
		CLRR 	37H 			//01B2 	0137

		//;FUNCTION.C: 398: gFun_ledCnt_2hz = 0;
		CLRR 	38H 			//01B3 	0138
		ORG		01B4H

		//;FUNCTION.C: 399: gbLed1hz = 1;
		BSR 	71H,2 			//01B4 	1971

		//;FUNCTION.C: 400: gbLed2hz = 1;
		BSR 	71H,3 			//01B5 	19F1

		//;FUNCTION.C: 401: gFun_ledTimeCnt = 0;
		CLRR 	2AH 			//01B6 	012A
		CLRR 	2BH 			//01B7 	012B

		//;FUNCTION.C: 402: gbLedWait = 0;
		BCR 	71H,5 			//01B8 	12F1

		//;FUNCTION.C: 403: if (mode==LM_Red_1HZ_3T || mode==LM_Blue_1HZ_3T) {
		LDR 	74H,0 			//01B9 	0874
		XORWI 	3H 			//01BA 	2603
		BTSC 	STATUS,2 		//01BB 	1503
		ORG		01BCH
		LJUMP 	1C1H 			//01BC 	39C1
		LDR 	74H,0 			//01BD 	0874
		XORWI 	4H 			//01BE 	2604
		BTSS 	STATUS,2 		//01BF 	1D03
		LJUMP 	1C6H 			//01C0 	39C6

		//;FUNCTION.C: 404: gFun_ledStopCnt = 300;
		LDWI 	2CH 			//01C1 	2A2C
		STR 	28H 			//01C2 	01A8
		LDWI 	1H 			//01C3 	2A01
		ORG		01C4H
		STR 	29H 			//01C4 	01A9

		//;FUNCTION.C: 405: } else if (mode==LM_Red_1HZ_10T) {
		RET		 					//01C5 	0004
		LDR 	74H,0 			//01C6 	0874
		XORWI 	5H 			//01C7 	2605
		BTSS 	STATUS,2 		//01C8 	1D03
		LJUMP 	1D8H 			//01C9 	39D8

		//;FUNCTION.C: 406: gFun_ledStopCnt = 1000;
		LDWI 	E8H 			//01CA 	2AE8
		STR 	28H 			//01CB 	01A8
		ORG		01CCH
		LDWI 	3H 			//01CC 	2A03
		LJUMP 	1D1H 			//01CD 	39D1

		//;FUNCTION.C: 409: gFun_ledStopCnt = 500;
		LDWI 	F4H 			//01CE 	2AF4
		STR 	28H 			//01CF 	01A8
		LDWI 	1H 			//01D0 	2A01
		STR 	29H 			//01D1 	01A9
		LJUMP 	1D6H 			//01D2 	39D6

		//;FUNCTION.C: 412: gFun_ledStopCnt = 100;
		LDWI 	64H 			//01D3 	2A64
		ORG		01D4H
		STR 	28H 			//01D4 	01A8
		CLRR 	29H 			//01D5 	0129

		//;FUNCTION.C: 407: gbLedWait = 1;
		BSR 	71H,5 			//01D6 	1AF1

		//;FUNCTION.C: 408: } else if (mode==LM_Red_2HZ_10T) {
		RET		 					//01D7 	0004
		LDR 	74H,0 			//01D8 	0874
		XORWI 	6H 			//01D9 	2606
		BTSC 	STATUS,2 		//01DA 	1503
		LJUMP 	1CEH 			//01DB 	39CE
		ORG		01DCH
		LDR 	74H,0 			//01DC 	0874
		XORWI 	7H 			//01DD 	2607
		BTSC 	STATUS,2 		//01DE 	1503
		LJUMP 	1D3H 			//01DF 	39D3

		//;FUNCTION.C: 415: gFun_ledStopCnt = 0;
		CLRR 	28H 			//01E0 	0128
		CLRR 	29H 			//01E1 	0129
		RET		 					//01E2 	0004

		//;FUNCTION.C: 272: if (gFun_adcChIndex == 0) {
		LDR 	2FH,1 			//01E3 	08AF
		ORG		01E4H
		BTSS 	STATUS,2 		//01E4 	1D03
		LJUMP 	1E8H 			//01E5 	39E8

		//;FUNCTION.C: 273: gFun_adcBuffer = GetAd(4);
		LDWI 	4H 			//01E6 	2A04
		LJUMP 	1E9H 			//01E7 	39E9

		//;FUNCTION.C: 274: } else {
		//;FUNCTION.C: 275: gFun_adcBuffer = GetAd(5);
		LDWI 	5H 			//01E8 	2A05
		LCALL 	246H 			//01E9 	3246
		LDR 	76H,0 			//01EA 	0876
		STR 	25H 			//01EB 	01A5
		ORG		01ECH
		LDR 	75H,0 			//01EC 	0875
		STR 	24H 			//01ED 	01A4

		//;FUNCTION.C: 276: }
		//;FUNCTION.C: 277: gFun_adcBufferSum += gFun_adcBuffer;
		ADDWR 	26H,1 			//01EE 	0BA6
		BTSC 	STATUS,0 		//01EF 	1403
		INCR	27H,1 			//01F0 	09A7
		LDR 	25H,0 			//01F1 	0825
		ADDWR 	27H,1 			//01F2 	0BA7

		//;FUNCTION.C: 278: if (++gFun_adcIndex >= 64) {
		LDWI 	40H 			//01F3 	2A40
		ORG		01F4H
		INCR	31H,1 			//01F4 	09B1
		SUBWR 	31H,0 			//01F5 	0C31
		BTSS 	STATUS,0 		//01F6 	1C03
		RET		 					//01F7 	0004

		//;FUNCTION.C: 279: gFun_adcIndex = 0;
		CLRR 	31H 			//01F8 	0131

		//;FUNCTION.C: 280: gFun_adcBuffer = gFun_adcBufferSum>>6;
		LDR 	27H,0 			//01F9 	0827
		STR 	25H 			//01FA 	01A5
		LDR 	26H,0 			//01FB 	0826
		ORG		01FCH
		STR 	24H 			//01FC 	01A4
		LDWI 	6H 			//01FD 	2A06
		BCR 	STATUS,0 		//01FE 	1003
		RRR	25H,1 			//01FF 	06A5
		RRR	24H,1 			//0200 	06A4
		ADDWI 	FFH 			//0201 	27FF
		BTSS 	STATUS,2 		//0202 	1D03
		LJUMP 	1FEH 			//0203 	39FE
		ORG		0204H

		//;FUNCTION.C: 281: if (gFun_adcChIndex == 0) {
		LDR 	2FH,1 			//0204 	08AF
		BTSS 	STATUS,2 		//0205 	1D03
		LJUMP 	20EH 			//0206 	3A0E

		//;FUNCTION.C: 282: gFun_adcChIndex = 1;
		CLRR 	2FH 			//0207 	012F
		INCR	2FH,1 			//0208 	09AF

		//;FUNCTION.C: 283: gFun_adCurrent = gFun_adcBuffer;
		LDR 	25H,0 			//0209 	0825
		STR 	23H 			//020A 	01A3
		LDR 	24H,0 			//020B 	0824
		ORG		020CH
		STR 	22H 			//020C 	01A2

		//;FUNCTION.C: 284: } else {
		LJUMP 	213H 			//020D 	3A13

		//;FUNCTION.C: 285: gFun_adcChIndex = 0;
		CLRR 	2FH 			//020E 	012F

		//;FUNCTION.C: 286: gFun_adBatVol = gFun_adcBuffer;
		LDR 	25H,0 			//020F 	0825
		STR 	21H 			//0210 	01A1
		LDR 	24H,0 			//0211 	0824
		STR 	20H 			//0212 	01A0

		//;FUNCTION.C: 287: }
		//;FUNCTION.C: 288: gFun_adcBufferSum = 0;
		CLRR 	26H 			//0213 	0126
		ORG		0214H
		CLRR 	27H 			//0214 	0127
		RET		 					//0215 	0004

		//;FUNCTION.C: 78: u8 cupchrStateCode = 0;
		CLRR 	75H 			//0216 	0175

		//;FUNCTION.C: 81: if ((RA0==0)) cupchrStateCode|=(1<<0);
		BCR 	STATUS,5 		//0217 	1283
		BCR 	STATUS,6 		//0218 	1303
		BTSS 	5H,0 			//0219 	1C05
		BSR 	75H,0 			//021A 	1875

		//;FUNCTION.C: 82: if ((RA1==0)) cupchrStateCode|=(1<<1);
		BTSS 	5H,1 			//021B 	1C85
		ORG		021CH
		BSR 	75H,1 			//021C 	18F5

		//;FUNCTION.C: 84: if (cupchrStateCode == 0x03) {
		LDR 	75H,0 			//021D 	0875
		XORWI 	3H 			//021E 	2603
		BTSC 	STATUS,2 		//021F 	1503

		//;FUNCTION.C: 85: cupchrStateCode = 0;
		CLRR 	75H 			//0220 	0175

		//;FUNCTION.C: 86: }
		//;FUNCTION.C: 88: if ((RA2==0)) cupchrStateCode|=(1<<2);
		BTSS 	5H,2 			//0221 	1D05
		BSR 	75H,2 			//0222 	1975

		//;FUNCTION.C: 90: if (cupchrStateCode != gFun_cupchrCodeBuff) {
		LDR 	75H,0 			//0223 	0875
		ORG		0224H
		XORWR 	34H,0 			//0224 	0434
		BTSC 	STATUS,2 		//0225 	1503
		LJUMP 	22BH 			//0226 	3A2B

		//;FUNCTION.C: 91: gFun_cupchrTimeCnt = 0;
		CLRR 	35H 			//0227 	0135

		//;FUNCTION.C: 92: gFun_cupchrCodeBuff = cupchrStateCode;
		LDR 	75H,0 			//0228 	0875
		STR 	34H 			//0229 	01B4

		//;FUNCTION.C: 93: } else {
		RET		 					//022A 	0004

		//;FUNCTION.C: 94: if (gFun_cupchrTimeCnt < 10) {
		LDWI 	AH 			//022B 	2A0A
		ORG		022CH
		SUBWR 	35H,0 			//022C 	0C35
		BTSC 	STATUS,0 		//022D 	1403
		LJUMP 	231H 			//022E 	3A31

		//;FUNCTION.C: 95: gFun_cupchrTimeCnt++;
		INCR	35H,1 			//022F 	09B5

		//;FUNCTION.C: 96: } else {
		RET		 					//0230 	0004

		//;FUNCTION.C: 97: if (gFun_cupchrCodeBuff &(1<<2)) {
		BTSS 	34H,2 			//0231 	1D34
		LJUMP 	23BH 			//0232 	3A3B

		//;FUNCTION.C: 98: if (gIsCupOk==0) {
		BTSC 	70H,6 			//0233 	1770
		ORG		0234H
		LJUMP 	23FH 			//0234 	3A3F

		//;FUNCTION.C: 99: DelayUs(10000);
		LDWI 	10H 			//0235 	2A10
		LCALL 	314H 			//0236 	3314

		//;FUNCTION.C: 100: if (gIsCupOk==0) {
		BTSC 	70H,6 			//0237 	1770
		LJUMP 	23FH 			//0238 	3A3F

		//;FUNCTION.C: 101: gIsCupOk = 1;
		BSR 	70H,6 			//0239 	1B70
		LJUMP 	23EH 			//023A 	3A3E

		//;FUNCTION.C: 102: gbCupEvent = 1;
		//;FUNCTION.C: 106: if (gIsCupOk) {
		BTSS 	70H,6 			//023B 	1F70
		ORG		023CH
		LJUMP 	23FH 			//023C 	3A3F

		//;FUNCTION.C: 107: gIsCupOk = 0;
		BCR 	70H,6 			//023D 	1370

		//;FUNCTION.C: 108: gbCupEvent = 1;
		BSR 	70H,7 			//023E 	1BF0

		//;FUNCTION.C: 109: }
		//;FUNCTION.C: 110: }
		//;FUNCTION.C: 111: gFun_chrState = gFun_cupchrCodeBuff &0x03;
		BCR 	STATUS,5 		//023F 	1283
		BCR 	STATUS,6 		//0240 	1303
		LDR 	34H,0 			//0241 	0834
		STR 	33H 			//0242 	01B3
		LDWI 	3H 			//0243 	2A03
		ORG		0244H
		ANDWR 	33H,1 			//0244 	02B3
		RET		 					//0245 	0004
		STR 	3EH 			//0246 	01BE

		//;FUNCTION.C: 126: u16 ADC_DATA=0;
		CLRR 	42H 			//0247 	0142
		CLRR 	43H 			//0248 	0143

		//;FUNCTION.C: 128: ADCON0Buff = ADCON0 & 0B10100011;
		LDR 	1FH,0 			//0249 	081F
		STR 	41H 			//024A 	01C1
		LDWI 	A3H 			//024B 	2AA3
		ORG		024CH
		ANDWR 	41H,1 			//024C 	02C1

		//;FUNCTION.C: 129: ch <<=2;
		BCR 	STATUS,0 		//024D 	1003
		RLR 	3EH,1 			//024E 	05BE
		BCR 	STATUS,0 		//024F 	1003
		RLR 	3EH,1 			//0250 	05BE

		//;FUNCTION.C: 130: ADCON0Buff |= ch;
		LDR 	3EH,0 			//0251 	083E
		IORWR 	41H,1 			//0252 	03C1

		//;FUNCTION.C: 131: ADCON0 = ADCON0Buff;
		LDR 	41H,0 			//0253 	0841
		ORG		0254H
		STR 	1FH 			//0254 	019F

		//;FUNCTION.C: 132: DelayUs(20);
		LDWI 	14H 			//0255 	2A14
		LCALL 	314H 			//0256 	3314

		//;FUNCTION.C: 134: GO_DONE = 1;
		BCR 	STATUS,5 		//0257 	1283
		BCR 	STATUS,6 		//0258 	1303
		BSR 	1FH,1 			//0259 	189F

		//;FUNCTION.C: 135: while( GO_DONE==1 );
		BTSC 	1FH,1 			//025A 	149F
		LJUMP 	25AH 			//025B 	3A5A
		ORG		025CH

		//;FUNCTION.C: 137: GO_DONE = 1;
		BSR 	1FH,1 			//025C 	189F

		//;FUNCTION.C: 138: while( GO_DONE==1 );
		BTSC 	1FH,1 			//025D 	149F
		LJUMP 	25DH 			//025E 	3A5D

		//;FUNCTION.C: 140: ADC_DATA = ADRESH;
		LDR 	1EH,0 			//025F 	081E
		STR 	42H 			//0260 	01C2
		CLRR 	43H 			//0261 	0143

		//;FUNCTION.C: 141: ADC_DATA <<=8;
		STR 	43H 			//0262 	01C3
		CLRR 	42H 			//0263 	0142
		ORG		0264H

		//;FUNCTION.C: 142: ADC_DATA |= ADRESL;
		BSR 	STATUS,5 		//0264 	1A83
		LDR 	1EH,0 			//0265 	081E
		BCR 	STATUS,5 		//0266 	1283
		IORWR 	42H,1 			//0267 	03C2

		//;FUNCTION.C: 143: tBuffer = ADC_DATA;
		LDR 	43H,0 			//0268 	0843
		STR 	40H 			//0269 	01C0
		LDR 	42H,0 			//026A 	0842
		STR 	3FH 			//026B 	01BF
		ORG		026CH

		//;FUNCTION.C: 144: return tBuffer;
		LDR 	40H,0 			//026C 	0840
		STR 	76H 			//026D 	01F6
		LDR 	3FH,0 			//026E 	083F
		STR 	75H 			//026F 	01F5
		RET		 					//0270 	0004
		STR 	75H 			//0271 	01F5

		//;FUNCTION.C: 177: if (isSleep){
		LDR 	75H,0 			//0272 	0875

		//;FUNCTION.C: 178: ADON = 0;
		BCR 	STATUS,5 		//0273 	1283
		ORG		0274H
		BCR 	STATUS,6 		//0274 	1303
		BTSC 	STATUS,2 		//0275 	1503
		LJUMP 	288H 			//0276 	3A88
		LDWI 	CFH 			//0277 	2ACF
		BCR 	1FH,0 			//0278 	101F

		//;FUNCTION.C: 179: IOCA = 0B11001111;
		BSR 	STATUS,5 		//0279 	1A83
		STR 	16H 			//027A 	0196

		//;FUNCTION.C: 181: PORTA = 0B11001111;
		//;FUNCTION.C: 182: TRISA = 0B11001111;
		//;FUNCTION.C: 183: WPUA = 0B11001000;
		LCALL 	2C9H 			//027B 	32C9
		ORG		027CH

		//;FUNCTION.C: 185: PORTC = 0B00010011;
		LDWI 	13H 			//027C 	2A13
		BCR 	STATUS,5 		//027D 	1283
		STR 	7H 			//027E 	0187

		//;FUNCTION.C: 186: TRISC = 0B00000011;
		LDWI 	3H 			//027F 	2A03
		BSR 	STATUS,5 		//0280 	1A83
		STR 	7H 			//0281 	0187

		//;FUNCTION.C: 187: WPUC = 0B00000000;
		CLRR 	8H 			//0282 	0108

		//;FUNCTION.C: 189: DelayUs(1000);
		LDWI 	E8H 			//0283 	2AE8
		ORG		0284H
		LCALL 	314H 			//0284 	3314

		//;FUNCTION.C: 190: PAIE = 1;
		BSR 	INTCON,3 		//0285 	198B

		//;FUNCTION.C: 191: PAIF = 0;
		BCR 	INTCON,0 		//0286 	100B

		//;FUNCTION.C: 192: } else {
		RET		 					//0287 	0004

		//;FUNCTION.C: 193: ADON = 1;
		BSR 	1FH,0 			//0288 	181F

		//;FUNCTION.C: 194: PAIE = 0;
		BCR 	INTCON,3 		//0289 	118B

		//;FUNCTION.C: 195: PAIF = 0;
		BCR 	INTCON,0 		//028A 	100B

		//;FUNCTION.C: 196: IOCA = 0B00000000;
		BSR 	STATUS,5 		//028B 	1A83
		ORG		028CH
		CLRR 	16H 			//028C 	0116

		//;FUNCTION.C: 198: PORTA = 0B11001111;
		LDWI 	CFH 			//028D 	2ACF

		//;FUNCTION.C: 199: TRISA = 0B11001111;
		//;FUNCTION.C: 200: WPUA = 0B11001000;
		LCALL 	2C9H 			//028E 	32C9

		//;FUNCTION.C: 202: PORTC = 0B00000011;
		LDWI 	3H 			//028F 	2A03
		BCR 	STATUS,5 		//0290 	1283
		STR 	7H 			//0291 	0187

		//;FUNCTION.C: 203: TRISC = 0B00000011;
		BSR 	STATUS,5 		//0292 	1A83
		STR 	7H 			//0293 	0187
		ORG		0294H

		//;FUNCTION.C: 204: WPUC = 0B00000000;
		CLRR 	8H 			//0294 	0108
		RET		 					//0295 	0004

		//;MCU_ISR.c: 10: if(TMR2IF)
		BCR 	STATUS,5 		//0296 	1283
		BCR 	STATUS,6 		//0297 	1303
		BTSS 	CH,1 			//0298 	1C8C
		LJUMP 	2A2H 			//0299 	3AA2
		LDWI 	64H 			//029A 	2A64

		//;MCU_ISR.c: 11: {
		//;MCU_ISR.c: 12: TMR2IF = 0;
		BCR 	CH,1 			//029B 	108C
		ORG		029CH

		//;MCU_ISR.c: 14: if (++gTimeCntFor10ms >= 100) {
		INCR	3DH,1 			//029C 	09BD
		SUBWR 	3DH,0 			//029D 	0C3D
		BTSS 	STATUS,0 		//029E 	1C03
		LJUMP 	2A2H 			//029F 	3AA2

		//;MCU_ISR.c: 15: gTimeCntFor10ms = 0;
		CLRR 	3DH 			//02A0 	013D

		//;MCU_ISR.c: 16: bTime10ms = 1;
		BSR 	70H,0 			//02A1 	1870

		//;MCU_ISR.c: 17: }
		//;MCU_ISR.c: 18: }
		//;MCU_ISR.c: 20: if(PAIE && PAIF)
		BTSC 	INTCON,3 		//02A2 	158B
		BTSS 	INTCON,0 		//02A3 	1C0B
		ORG		02A4H
		LJUMP 	2AEH 			//02A4 	3AAE

		//;MCU_ISR.c: 21: {
		//;MCU_ISR.c: 22: bakPORTA = PORTA;
		LDR 	5H,0 			//02A5 	0805
		STR 	2EH 			//02A6 	01AE

		//;MCU_ISR.c: 23: PAIF = 0;
		BCR 	INTCON,0 		//02A7 	100B

		//;MCU_ISR.c: 24: PAIE = 0;
		BCR 	INTCON,3 		//02A8 	118B

		//;MCU_ISR.c: 25: IOCA0 =0;
		BSR 	STATUS,5 		//02A9 	1A83
		BCR 	16H,0 			//02AA 	1016

		//;MCU_ISR.c: 26: IOCA1 =0;
		BCR 	16H,1 			//02AB 	1096
		ORG		02ACH

		//;MCU_ISR.c: 27: IOCA2 =0;
		BCR 	16H,2 			//02AC 	1116

		//;MCU_ISR.c: 28: IOCA3=0;
		BCR 	16H,3 			//02AD 	1196
		LDR 	73H,0 			//02AE 	0873
		STR 	PCLATH 			//02AF 	018A
		SWAPR 	72H,0 			//02B0 	0772
		STR 	STATUS 			//02B1 	0183
		SWAPR 	7EH,1 			//02B2 	07FE
		SWAPR 	7EH,0 			//02B3 	077E
		ORG		02B4H
		RETI		 			//02B4 	0009

		//;MCU.C: 7: OSCCON = 0B01110001;
		LDWI 	71H 			//02B5 	2A71
		BSR 	STATUS,5 		//02B6 	1A83
		STR 	FH 			//02B7 	018F

		//;MCU.C: 10: INTCON = 0;
		CLRR 	INTCON 			//02B8 	010B

		//;MCU.C: 12: ANSEL = 0X00;
		CLRR 	11H 			//02B9 	0111

		//;MCU.C: 14: PORTA =0B11001111;
		LDWI 	CFH 			//02BA 	2ACF

		//;MCU.C: 15: TRISA = 0B11001111;
		//;MCU.C: 16: WPUA = 0B11001000;
		LCALL 	2C9H 			//02BB 	32C9
		ORG		02BCH

		//;MCU.C: 18: PORTC =0B00000011;
		LDWI 	3H 			//02BC 	2A03
		BCR 	STATUS,5 		//02BD 	1283
		STR 	7H 			//02BE 	0187

		//;MCU.C: 19: TRISC = 0B00000011;
		BSR 	STATUS,5 		//02BF 	1A83
		STR 	7H 			//02C0 	0187

		//;MCU.C: 20: WPUC = 0B00000000;
		CLRR 	8H 			//02C1 	0108

		//;MCU.C: 23: OPTION = 0B01001000;
		LDWI 	48H 			//02C2 	2A48
		STR 	1H 			//02C3 	0181
		ORG		02C4H

		//;MCU.C: 25: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//02C4 	1283
		CLRR 	1BH 			//02C5 	011B

		//;MCU.C: 28: CMCON0 = 0B00000111;
		LDWI 	7H 			//02C6 	2A07
		STR 	19H 			//02C7 	0199
		RET		 					//02C8 	0004
		BCR 	STATUS,5 		//02C9 	1283
		STR 	5H 			//02CA 	0185
		BSR 	STATUS,5 		//02CB 	1A83
		ORG		02CCH
		STR 	5H 			//02CC 	0185
		LDWI 	C8H 			//02CD 	2AC8
		STR 	15H 			//02CE 	0195
		RET		 					//02CF 	0004

		//;main.c: 18: MCU_Init();
		LCALL 	335H 			//02D0 	3335

		//;main.c: 19: FUN_Init();
		LCALL 	331H 			//02D1 	3331

		//;main.c: 20: GIE = 1;
		BSR 	INTCON,7 		//02D2 	1B8B

		//;main.c: 23: {
		//;main.c: 24: if (bTime10ms) {
		BTSS 	70H,0 			//02D3 	1C70
		ORG		02D4H
		LJUMP 	2D3H 			//02D4 	3AD3

		//;main.c: 25: bTime10ms = 0;
		BCR 	70H,0 			//02D5 	1070

		//;main.c: 27: KEY_Driver();
		LCALL 	A8H 			//02D6 	30A8

		//;main.c: 28: CUP_CHR_Driver();
		LCALL 	216H 			//02D7 	3216

		//;main.c: 29: FUN_Driver();
		LCALL 	BH 			//02D8 	300B

		//;main.c: 30: ADC_Driver();
		LCALL 	1E3H 			//02D9 	31E3

		//;main.c: 31: ADC_Deal();
		LCALL 	155H 			//02DA 	3155

		//;main.c: 32: LED_Display();
		LCALL 	101H 			//02DB 	3101
		ORG		02DCH

		//;main.c: 33: MOTO_Driver();
		LCALL 	338H 			//02DC 	3338
		LJUMP 	2D3H 			//02DD 	3AD3

		//;MCU.C: 36: T2CON = 0B00000001;
		LDWI 	1H 			//02DE 	2A01
		STR 	12H 			//02DF 	0192

		//;MCU.C: 38: TMR2 = 0;
		CLRR 	11H 			//02E0 	0111

		//;MCU.C: 39: PR2 = 200;
		LDWI 	C8H 			//02E1 	2AC8
		BSR 	STATUS,5 		//02E2 	1A83
		STR 	12H 			//02E3 	0192
		ORG		02E4H

		//;MCU.C: 41: TMR2IF = 0;
		BCR 	STATUS,5 		//02E4 	1283
		BCR 	CH,1 			//02E5 	108C

		//;MCU.C: 42: TMR2IE = 1;
		BSR 	STATUS,5 		//02E6 	1A83
		BSR 	CH,1 			//02E7 	188C

		//;MCU.C: 43: TMR2ON = 1;
		BCR 	STATUS,5 		//02E8 	1283
		BSR 	12H,2 			//02E9 	1912

		//;MCU.C: 44: PEIE=1;
		BSR 	INTCON,6 		//02EA 	1B0B
		RET		 					//02EB 	0004
		ORG		02ECH

		//;FUNCTION.C: 152: MCU_SleepConfig(1);
		LDWI 	1H 			//02EC 	2A01
		LCALL 	271H 			//02ED 	3271
		SLEEP	 			//02EE 	0002

		//;FUNCTION.C: 154: DelayUs(1000);
		LDWI 	E8H 			//02EF 	2AE8
		LCALL 	314H 			//02F0 	3314

		//;FUNCTION.C: 155: MCU_SleepConfig(0);
		LDWI 	0H 			//02F1 	2A00
		LCALL 	271H 			//02F2 	3271

		//;FUNCTION.C: 156: gFun_keyIdleCnt = 255;
		LDWI 	FFH 			//02F3 	2AFF
		ORG		02F4H
		BCR 	STATUS,5 		//02F4 	1283
		BCR 	STATUS,6 		//02F5 	1303
		STR 	44H 			//02F6 	01C4
		RET		 					//02F7 	0004
		LDWI 	20H 			//02F8 	2A20
		CLRR 	70H 			//02F9 	0170
		CLRR 	71H 			//02FA 	0171
		CLRR 	77H 			//02FB 	0177
		ORG		02FCH
		BCR 	STATUS,7 		//02FC 	1383
		STR 	FSR 			//02FD 	0184
		LDWI 	3EH 			//02FE 	2A3E
		LCALL 	30CH 			//02FF 	330C
		CLRR 	STATUS 			//0300 	0103
		LJUMP 	2D0H 			//0301 	3AD0

		//;MCU.C: 58: ADCON1 = 0B01100000;
		LDWI 	60H 			//0302 	2A60
		BSR 	STATUS,5 		//0303 	1A83
		ORG		0304H
		STR 	1FH 			//0304 	019F

		//;MCU.C: 60: ADCON0 = 0B10111101;
		LDWI 	BDH 			//0305 	2ABD
		BCR 	STATUS,5 		//0306 	1283
		STR 	1FH 			//0307 	019F

		//;MCU.C: 67: ANSEL = 0B00110000;
		LDWI 	30H 			//0308 	2A30
		BSR 	STATUS,5 		//0309 	1A83
		STR 	11H 			//030A 	0191
		RET		 					//030B 	0004
		ORG		030CH
		CLRWDT	 			//030C 	0001
		CLRR 	INDF 			//030D 	0100
		INCR	FSR,1 			//030E 	0984
		XORWR 	FSR,0 			//030F 	0404
		BTSC 	STATUS,2 		//0310 	1503
		RETW 	0H 			//0311 	2100
		XORWR 	FSR,0 			//0312 	0404
		LJUMP 	30DH 			//0313 	3B0D
		ORG		0314H
		STR 	74H 			//0314 	01F4

		//;FUNCTION.C: 68: while(time--)
		DECR 	74H,1 			//0315 	0DF4
		LDR 	74H,0 			//0316 	0874
		XORWI 	FFH 			//0317 	26FF
		BTSC 	STATUS,2 		//0318 	1503
		RET		 					//0319 	0004

		//;FUNCTION.C: 69: {
		//;FUNCTION.C: 70: _nop();
		NOP		 					//031A 	0000
		LJUMP 	315H 			//031B 	3B15
		ORG		031CH
		LJUMP 	12DH 			//031C 	392D
		LJUMP 	130H 			//031D 	3930
		LJUMP 	133H 			//031E 	3933
		LJUMP 	136H 			//031F 	3936
		LJUMP 	13DH 			//0320 	393D
		LJUMP 	142H 			//0321 	3942
		LJUMP 	143H 			//0322 	3943
		LJUMP 	146H 			//0323 	3946
		ORG		0324H

		//;FUNCTION.C: 511: gFun_workMode = WM_Standby;
		CLRR 	77H 			//0324 	0177
		INCR	77H,1 			//0325 	09F7

		//;FUNCTION.C: 512: gFun_workTimeCnt = 0;
		CLRR 	2CH 			//0326 	012C
		CLRR 	2DH 			//0327 	012D

		//;FUNCTION.C: 513: gbOcp = 0;
		BCR 	71H,6 			//0328 	1371

		//;FUNCTION.C: 514: gbUcp = 0;
		BCR 	71H,7 			//0329 	13F1
		RET		 					//032A 	0004

		//;FUNCTION.C: 522: gFun_workMode = WM_Work;
		LDWI 	2H 			//032B 	2A02
		ORG		032CH
		STR 	77H 			//032C 	01F7

		//;FUNCTION.C: 523: gFun_workTimeCnt = 0;
		CLRR 	2CH 			//032D 	012C
		CLRR 	2DH 			//032E 	012D

		//;FUNCTION.C: 524: gFun_workTimeCntFor1s = 0;
		CLRR 	3CH 			//032F 	013C
		RET		 					//0330 	0004

		//;FUNCTION.C: 383: gFun_keyIdleCnt = 255;
		LDWI 	FFH 			//0331 	2AFF
		BCR 	STATUS,5 		//0332 	1283
		STR 	44H 			//0333 	01C4
		ORG		0334H
		RET		 					//0334 	0004

		//;MCU.C: 75: CLK_Init();
		LCALL 	2B5H 			//0335 	32B5

		//;MCU.C: 76: TIM_Init();
		LCALL 	2DEH 			//0336 	32DE

		//;MCU.C: 77: ADC_Init();
		LJUMP 	302H 			//0337 	3B02
		RET		 					//0338 	0004
			END
