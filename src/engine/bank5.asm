OAM_14000: ; 14000 (5:4000)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19

.frame_0
	frame_oam -31, -12, $00, $00

	INCROM $1402c, $14041

.frame_1
	frame_oam -31, -12, $06, $00

	INCROM $14045, $1405a

.frame_2
	frame_oam -32, -12, $0c, $00

	INCROM $1405e, $14073

.frame_3
	frame_oam -32, -15, $12, $00

	INCROM $14077, $1408c

.frame_4
	frame_oam -31,   4, $00, $20

	INCROM $14090, $140a5

.frame_5
	frame_oam -31,   4, $06, $20

	INCROM $140a9, $140be

.frame_6
	frame_oam -32,   4, $0c, $20

	INCROM $140c2, $140d7

.frame_7
	frame_oam -32,   7, $12, $20

	INCROM $140db, $140f0

.frame_8
	frame_oam -32,  -7, $14, $00

	INCROM $140f4, $14109

.frame_9
	frame_oam -32, -15, $18, $00

	INCROM $1410d, $14122

.frame_10
	frame_oam -32,  -1, $14, $20

	INCROM $14126, $1413b

.frame_11
	frame_oam -32,   7, $18, $20

	INCROM $1413f, $14154

.frame_12
	frame_oam -32,  -7, $1a, $00

	INCROM $14158, $1416d

.frame_13
	frame_oam -32,  -1, $1a, $20

	INCROM $14171, $14186

.frame_14
	frame_oam -15, -12, $20, $00

	INCROM $1418a, $1419f

.frame_15
	frame_oam -31, -12, $06, $00

	INCROM $141a3, $141b8

.frame_16
	frame_oam -15,   4, $20, $20

	INCROM $141bc, $141d1

.frame_17
	frame_oam -31,   4, $06, $20

	INCROM $141d5, $141ea

.frame_18
	frame_oam -31, -12, $40, $00

	INCROM $141ee, $14203

.frame_19
	frame_oam -31,   4, $40, $20
; 0x14207

	INCROM $14207, $1421c

Frameset_1421c: ; 1421c (5:421c)
	db $12,  4
	db $01, 12
	db $02, 12
	db $03, 12
	db $ff

Frameset_14225: ; 14225 (5:4225)
	db $13,  4
	db $05, 12
	db $06, 12
	db $07, 12
	db $ff

Frameset_1422e: ; 1422e (5:422e)
	db $03, 30
	db $08, 30
	db $09, 40
	db $08, 30
	db $ff

Frameset_14237: ; 14237 (5:4237)
	db $07, 30
	db $0a, 30
	db $0b, 40
	db $0a, 30
	db $ff

Frameset_14240: ; 14240 (5:4240)
	db $0c,  6
	db $02,  6
	db $01,  6
	db $12,  2
	db $ff

Frameset_14249: ; 14249 (5:4249)
	db $0d,  6
	db $06,  6
	db $05,  6
	db $13,  2
	db $ff

Frameset_14252: ; 14252 (5:4252)
	db $00, 60
	db $0e, 20
	db $0f, 10
	db $0e, 30
	db $0f, 12
	db $0e, 60
	db $ff

Frameset_1425f: ; 1425f (5:425f)
	db $04, 60
	db $10, 20
	db $11, 10
	db $10, 30
	db $11, 12
	db $10, 60
	db $ff
; 0x1426c

OAM_1426c: ; 1426c (5:426c)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23
	dw .frame_24
	dw .frame_25
	dw .frame_26
	dw .frame_27
	dw .frame_28
	dw .frame_29
	dw .frame_30
	dw .frame_31
	dw .frame_32
	dw .frame_33
	dw .frame_34
	dw .frame_35
	dw .frame_36
	dw .frame_37
	dw .frame_38
	dw .frame_39
	dw .frame_40
	dw .frame_41
	dw .frame_42
	dw .frame_43
	dw .frame_44
	dw .frame_45
	dw .frame_46
	dw .frame_47
	dw .frame_48
	dw .frame_49
	dw .frame_50
	dw .frame_51
	dw .frame_52
	dw .frame_53
	dw .frame_54
	dw .frame_55
	dw .frame_56
	dw .frame_57
	dw .frame_58
	dw .frame_59
	dw .frame_60
	dw .frame_61
	dw .frame_62
	dw .frame_63

.frame_0
	frame_oam -32, -12, $00, $00

	INCROM $142f0, $14305

.frame_1
	frame_oam -32, -12, $06, $00

	INCROM $14309, $1431e

.frame_2
	frame_oam -34,  -4, $0e, $00

	INCROM $14322, $14337

.frame_3
	frame_oam -32, -13, $12, $00

	INCROM $1433b, $14350

.frame_4
	frame_oam -32,   4, $00, $20

	INCROM $14354, $14369

.frame_5
	frame_oam -32,   4, $06, $20

	INCROM $1436d, $14382

.frame_6
	frame_oam -34,  -4, $0e, $20

	INCROM $14386, $1439b

.frame_7
	frame_oam -32,   5, $12, $20

	INCROM $1439f, $143b4

.frame_8
	frame_oam -32, -12, $00, $00

	INCROM $143b8, $143d1

.frame_9
	frame_oam -32, -12, $06, $00

	INCROM $143d5, $143ee

.frame_10
	frame_oam -34,  -4, $0e, $00

	INCROM $143f2, $1440b

.frame_11
	frame_oam -32, -13, $12, $00

	INCROM $1440f, $14428

.frame_12
	frame_oam -32, -12, $00, $00

	INCROM $1442c, $14445

.frame_13
	frame_oam -32, -12, $06, $00

	INCROM $14449, $14462

.frame_14
	frame_oam -34,  -4, $0e, $00

	INCROM $14466, $1447f

.frame_15
	frame_oam -32, -13, $12, $00

	INCROM $14483, $1449c

.frame_16
	frame_oam -32,   4, $00, $20

	INCROM $144a0, $144b9

.frame_17
	frame_oam -32,   4, $06, $20

	INCROM $144bd, $144d6

.frame_18
	frame_oam -34,  -4, $0e, $20

	INCROM $144da, $144f3

.frame_19
	frame_oam -32,   5, $12, $20

	INCROM $144f7, $14510

.frame_20
	frame_oam -32,   4, $00, $20

	INCROM $14514, $1452d

.frame_21
	frame_oam -32,   4, $06, $20

	INCROM $14531, $1454a

.frame_22
	frame_oam -34,  -4, $0e, $20

	INCROM $1454e, $14567

.frame_23
	frame_oam -32,   5, $12, $20

	INCROM $1456b, $14584

.frame_24
	frame_oam -32, -12, $18, $00

	INCROM $14588, $1459d

.frame_25
	frame_oam -33, -12, $1e, $00

	INCROM $145a1, $145b6

.frame_26
	frame_oam -32, -13, $40, $00

	INCROM $145ba, $145cf

.frame_27
	frame_oam -32,   4, $18, $20

	INCROM $145d3, $145e8

.frame_28
	frame_oam -33,   4, $1e, $20

	INCROM $145ec, $14601

.frame_29
	frame_oam -32,   5, $40, $20

	INCROM $14605, $1461a

.frame_30
	frame_oam -32, -12, $18, $00

	INCROM $1461e, $14633

.frame_31
	frame_oam -32,   4, $18, $20

	INCROM $14637, $1464c

.frame_32
	frame_oam -31, -12, $44, $00

	INCROM $14650, $14665

.frame_33
	frame_oam -32, -12, $44, $00

	INCROM $14669, $1467e

.frame_34
	frame_oam -32, -12, $44, $00

	INCROM $14682, $14697

.frame_35
	frame_oam -31, -13, $44, $00

	INCROM $1469b, $146b0

.frame_36
	frame_oam -31,   4, $44, $20

	INCROM $146b4, $146c9

.frame_37
	frame_oam -32,   4, $44, $20

	INCROM $146cd, $146e2

.frame_38
	frame_oam -32,   4, $44, $20

	INCROM $146e6, $146fb

.frame_39
	frame_oam -31,   5, $44, $20

	INCROM $146ff, $14714

.frame_40
	frame_oam -31, -12, $44, $00

	INCROM $14718, $14731

.frame_41
	frame_oam -32, -12, $44, $00

	INCROM $14735, $1474e

.frame_42
	frame_oam -32, -12, $44, $00

	INCROM $14752, $1476b

.frame_43
	frame_oam -31, -13, $44, $00

	INCROM $1476f, $14788

.frame_44
	frame_oam -31, -12, $44, $00

	INCROM $1478c, $147a5

.frame_45
	frame_oam -32, -12, $44, $00

	INCROM $147a9, $147c2

.frame_46
	frame_oam -32, -12, $44, $00

	INCROM $147c6, $147df

.frame_47
	frame_oam -31, -13, $44, $00

	INCROM $147e3, $147fc

.frame_48
	frame_oam -31,   4, $44, $20

	INCROM $14800, $14819

.frame_49
	frame_oam -32,   4, $44, $20

	INCROM $1481d, $14836

.frame_50
	frame_oam -32,   4, $44, $20

	INCROM $1483a, $14853

.frame_51
	frame_oam -31,   5, $44, $20

	INCROM $14857, $14870

.frame_52
	frame_oam -31,   4, $44, $20

	INCROM $14874, $1488d

.frame_53
	frame_oam -32,   4, $44, $20

	INCROM $14891, $148aa

.frame_54
	frame_oam -32,   4, $44, $20

	INCROM $148ae, $148c7

.frame_55
	frame_oam -31,   4, $44, $20

	INCROM $148cb, $148e4

.frame_56
	frame_oam -32, -11, $64, $00

	INCROM $148e8, $148fd

.frame_57
	frame_oam -32,   3, $64, $20

	INCROM $14901, $14916

.frame_58
	frame_oam -32, -12, $06, $00

	INCROM $1491a, $1492f

.frame_59
	frame_oam -32,   4, $06, $20

	INCROM $14933, $14948

.frame_60
	frame_oam -32,   4, $1c, $00

	INCROM $1494c, $14965

.frame_61
	frame_oam -32, -12, $1c, $20

	INCROM $14969, $14982

.frame_62
	frame_oam -32,   4, $04, $00

	INCROM $14986, $1499b

.frame_63
	frame_oam -32, -12, $04, $20
; 0x1499f

	INCROM $1499f, $149b4

Frameset_149b4: ; 149b4 (5:49b4)
	db $00,  3
	db $01,  3
	db $02,  3
	db $03,  3
	db $00,  3
	db $01,  3
	db $02,  3
	db $03,  3
	db $ff

Frameset_149c5: ; 149c5 (5:49c5)
	db $04,  3
	db $05,  3
	db $06,  3
	db $07,  3
	db $04,  3
	db $05,  3
	db $06,  3
	db $07,  3
	db $ff

Frameset_149d6: ; 149d6 (5:49d6)
	db $02,  4
	db $ff

Frameset_149d9: ; 149d9 (5:49d9)
	db $06,  4
	db $ff

Frameset_149dc: ; 149dc (5:49dc)
	db $08,  3
	db $09,  3
	db $0a,  3
	db $0b,  3
	db $0c,  3
	db $0d,  3
	db $0e,  3
	db $0f,  3
	db $ff

Frameset_149ed: ; 149ed (5:49ed)
	db $10,  3
	db $11,  3
	db $12,  3
	db $13,  3
	db $14,  3
	db $15,  3
	db $16,  3
	db $17,  3
	db $ff

Frameset_149fe: ; 149fe (5:49fe)
	db $3e,  3
	db $18,  3
	db $19,  3
	db $1a,  3
	db $3e,  3
	db $18,  3
	db $19,  3
	db $1a,  3
	db $ff

Frameset_14a0f: ; 14a0f (5:4a0f)
	db $3f,  3
	db $1b,  3
	db $1c,  3
	db $1d,  3
	db $3f,  3
	db $1b,  3
	db $1c,  3
	db $1d,  3
	db $ff

Frameset_14a20: ; 14a20 (5:4a20)
	db $1e,  4
	db $ff

Frameset_14a23: ; 14a23 (5:4a23)
	db $1f,  4
	db $ff

Frameset_14a26: ; 14a26 (5:4a26)
	db $20,  5
	db $21,  5
	db $22,  5
	db $23,  5
	db $ff

Frameset_14a2f: ; 14a2f (5:4a2f)
	db $24,  5
	db $25,  5
	db $26,  5
	db $27,  5
	db $ff

Frameset_14a38: ; 14a38 (5:4a38)
	db $20,  4
	db $ff

Frameset_14a3b: ; 14a3b (5:4a3b)
	db $24,  4
	db $ff

Frameset_14a3e: ; 14a3e (5:4a3e)
	db $28,  3
	db $29,  3
	db $2a,  3
	db $2b,  3
	db $2c,  3
	db $2d,  3
	db $2e,  3
	db $2f,  3
	db $ff

Frameset_14a4f: ; 14a4f (5:4a4f)
	db $30,  3
	db $31,  3
	db $32,  3
	db $33,  3
	db $34,  3
	db $35,  3
	db $36,  3
	db $37,  3
	db $ff

Frameset_14a60: ; 14a60 (5:4a60)
	db $28,  4
	db $ff

Frameset_14a63: ; 14a63 (5:4a63)
	db $30,  4
	db $ff

Frameset_14a66: ; 14a66 (5:4a66)
	db $08,  4
	db $ff

Frameset_14a69: ; 14a69 (5:4a69)
	db $10,  4
	db $ff

Frameset_14a6c: ; 14a6c (5:4a6c)
	db $00,  2
	db $38,  2
	db $ff

Frameset_14a71: ; 14a71 (5:4a71)
	db $04,  2
	db $39,  2
	db $ff

Frameset_14a76: ; 14a76 (5:4a76)
	db $3a,  4
	db $ff

Frameset_14a79: ; 14a79 (5:4a79)
	db $3b,  4
	db $ff

Frameset_14a7c: ; 14a7c (5:4a7c)
	db $3c,  4
	db $ff

Frameset_14a7f: ; 14a7f (5:4a7f)
	db $3d,  4
	db $ff
; 0x14a82

OAM_14a82: ; 14a82 (5:4a82)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19

.frame_0
	frame_oam -31,   4, $00, $20

	INCROM $14aae, $14ac3

.frame_1
	frame_oam -32,   4, $46, $20

	INCROM $14ac7, $14adc

.frame_2
	frame_oam -32, -16, $4c, $00

	INCROM $14ae0, $14afd

.frame_3
	frame_oam -32, -12, $46, $00

	INCROM $14b01, $14b16

.frame_4
	frame_oam -31, -12, $00, $00

	INCROM $14b1a, $14b2f

.frame_5
	frame_oam -32,  -4, $5c, $00

	INCROM $14b33, $14b48

.frame_6
	frame_oam -32, -12, $54, $00

	INCROM $14b4c, $14b61

.frame_7
	frame_oam -32,   0, $50, $00

	INCROM $14b65, $14b82

.frame_8
	frame_oam -32,   4, $54, $20

	INCROM $14b86, $14b9b

.frame_9
	frame_oam -32,  -4, $5c, $20

	INCROM $14b9f, $14bb4

.frame_10
	frame_oam -31,  -4, $00, $20

	INCROM $14bb8, $14bcd

.frame_11
	frame_oam -32,  -4, $46, $20

	INCROM $14bd1, $14be6

.frame_12
	frame_oam -32, -24, $4c, $00

	INCROM $14bea, $14c07

.frame_13
	frame_oam -32, -20, $46, $00

	INCROM $14c0b, $14c20

.frame_14
	frame_oam -31, -20, $00, $00

	INCROM $14c24, $14c39

.frame_15
	frame_oam -32, -12, $5c, $00

	INCROM $14c3d, $14c52

.frame_16
	frame_oam -32, -20, $54, $00

	INCROM $14c56, $14c6b

.frame_17
	frame_oam -32,  -8, $50, $00

	INCROM $14c6f, $14c8c

.frame_18
	frame_oam -32,  -4, $54, $20

	INCROM $14c90, $14ca5

.frame_19
	frame_oam -32, -12, $5c, $20
; 0x14ca9

	INCROM $14ca9, $14cbe

Frameset_14cbe: ; 14cbe (5:4cbe)
	db $01,  1
	db $02,  2
	db $03,  1
	db $ff

Frameset_14cc5: ; 14cc5 (5:4cc5)
	db $03,  1
	db $02,  1
	db $01,  1
	db $ff

Frameset_14ccc: ; 14ccc (5:4ccc)
	db $00,  1
	db $01,  1
	db $02,  2
	db $03,  1
	db $04,  1
	db $05,  1
	db $06,  1
	db $07,  2
	db $08,  1
	db $09,  1
	db $ff

Frameset_14ce1: ; 14ce1 (5:4ce1)
	db $09,  1
	db $08,  1
	db $07,  2
	db $06,  1
	db $05,  1
	db $04,  1
	db $03,  1
	db $02,  2
	db $01,  1
	db $00,  1
	db $ff

Frameset_14cf6: ; 14cf6 (5:4cf6)
	db $0a,  2
	db $0b,  2
	db $0c,  4
	db $0d,  2
	db $0e,  2
	db $0f,  2
	db $10,  2
	db $11,  4
	db $12,  2
	db $13,  2
	db $ff

Frameset_14d0b: ; 14d0b (5:4d0b)
	db $06,  3
	db $07,  3
	db $ff

Frameset_14d10: ; 14d10 (5:4d10)
	db $08,  3
	db $07,  3
	db $ff

Frameset_14d15: ; 14d15 (5:4d15)
	db $07,  4
	db $ff

Frameset_14d18: ; 14d18 (5:4d18)
	db $02,  4
	db $ff
; 0x14d1b

OAM_14d1b: ; 14d1b (5:4d1b)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23
	dw .frame_24
	dw .frame_25
	dw .frame_26
	dw .frame_27
	dw .frame_28
	dw .frame_29
	dw .frame_30
	dw .frame_31
	dw .frame_32
	dw .frame_33
	dw .frame_34

.frame_0
	frame_oam -40, -16, $00, $00

	INCROM $14d65, $14d82

.frame_1
	frame_oam -31,  -9, $0a, $00

	INCROM $14d86, $14da3

.frame_2
	frame_oam -32,  -9, $12, $00

	INCROM $14da7, $14dc4

.frame_3
	frame_oam -40, -15, $18, $00

	INCROM $14dc8, $14de5

.frame_4
	frame_oam -40, -16, $00, $00

	INCROM $14de9, $14e06

.frame_5
	frame_oam -31,   7, $0e, $00

	INCROM $14e0a, $14e27

.frame_6
	frame_oam -32,   7, $16, $00

	INCROM $14e2b, $14e48

.frame_7
	frame_oam -40, -15, $18, $00

	INCROM $14e4c, $14e69

.frame_8
	frame_oam -40,   8, $00, $20

	INCROM $14e6d, $14e8a

.frame_9
	frame_oam -31,   1, $0a, $20

	INCROM $14e8e, $14eab

.frame_10
	frame_oam -32,   1, $12, $20

	INCROM $14eaf, $14ecc

.frame_11
	frame_oam -40,   7, $18, $20

	INCROM $14ed0, $14eed

.frame_12
	frame_oam -40,   8, $00, $20

	INCROM $14ef1, $14f0e

.frame_13
	frame_oam -31, -15, $0e, $20

	INCROM $14f12, $14f2f

.frame_14
	frame_oam -32, -15, $16, $20

	INCROM $14f33, $14f50

.frame_15
	frame_oam -40,   7, $18, $20

	INCROM $14f54, $14f71

.frame_16
	frame_oam -31,  -8, $02, $00

	INCROM $14f75, $14f92

.frame_17
	frame_oam -32, -15, $52, $01

	INCROM $14f96, $14fb3

.frame_18
	frame_oam -32,  -1, $14, $00

	INCROM $14fb7, $14fd4

.frame_19
	frame_oam -31,   9, $1e, $00

	INCROM $14fd8, $14ff5

.frame_20
	frame_oam -40, -16, $00, $00

	INCROM $14ff9, $15016

.frame_21
	frame_oam -31,  -9, $0a, $00

	INCROM $1501a, $15037

.frame_22
	frame_oam -31,   0, $02, $20

	INCROM $1503b, $15058

.frame_23
	frame_oam -32,   7, $52, $21

	INCROM $1505c, $15079

.frame_24
	frame_oam -32,  -7, $14, $20

	INCROM $1507d, $1509a

.frame_25
	frame_oam -31, -17, $1e, $20

	INCROM $1509e, $150bb

.frame_26
	frame_oam -40,   8, $00, $20

	INCROM $150bf, $150dc

.frame_27
	frame_oam -31,   1, $0a, $20

	INCROM $150e0, $150fd

.frame_28
	frame_oam -33, -17, $50, $01

	INCROM $15101, $1511e

.frame_29
	frame_oam -33, -15, $52, $01

	INCROM $15122, $1513f

.frame_30
	frame_oam -41, -17, $18, $01

	INCROM $15143, $15160

.frame_31
	frame_oam -33,   9, $50, $21

	INCROM $15164, $15181

.frame_32
	frame_oam -33,   7, $52, $21

	INCROM $15185, $151a2

.frame_33
	frame_oam -32,  -7, $14, $20

	INCROM $151a6, $151c3

.frame_34
	frame_oam -41,   9, $18, $21
; 0x151c7

	INCROM $151c7, $151e4

Frameset_151e4: ; 151e4 (5:51e4)
	db $00,  1
	db $01,  1
	db $02,  1
	db $03,  1
	db $00,  1
	db $01,  1
	db $02,  1
	db $03,  1
	db $04,  1
	db $05,  1
	db $06,  1
	db $07,  1
	db $ff

Frameset_151fd: ; 151fd (5:51fd)
	db $08,  1
	db $09,  2
	db $0a,  1
	db $0b,  1
	db $08,  1
	db $09,  2
	db $0a,  1
	db $0b,  1
	db $0c,  2
	db $0d,  1
	db $0e,  1
	db $0f,  1
	db $ff

Frameset_15216: ; 15216 (5:5216)
	db $02,  4
	db $ff

Frameset_15219: ; 15219 (5:5219)
	db $0a,  1
	db $ff

Frameset_1521c: ; 1521c (5:521c)
	db $10,  1
	db $11,  1
	db $12,  1
	db $13,  1
	db $14,  1
	db $15,  1
	db $02,  1
	db $03,  1
	db $ff

Frameset_1522d: ; 1522d (5:522d)
	db $16,  1
	db $17,  1
	db $18,  1
	db $19,  1
	db $1a,  1
	db $1b,  1
	db $0a,  1
	db $0b,  1
	db $ff

Frameset_1523e: ; 1523e (5:523e)
	db $1c,  1
	db $1d,  1
	db $12,  1
	db $1e,  1
	db $02,  1
	db $ff

Frameset_15249: ; 15249 (5:5249)
	db $1f,  1
	db $20,  1
	db $21,  1
	db $22,  1
	db $0a,  1
	db $ff
; 0x15254

OAM_15254: ; 15254 (5:5254)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23

.frame_0
	frame_oam -32,  -4, $02, $00

	INCROM $15288, $152a9

.frame_1
	frame_oam -33,   3, $0c, $00

	INCROM $152ad, $152ca

.frame_2
	frame_oam -32,  -4, $02, $00

	INCROM $152ce, $152ef

.frame_3
	frame_oam -32,  -4, $02, $20

	INCROM $152f3, $15314

.frame_4
	frame_oam -33, -11, $0c, $20

	INCROM $15318, $15335

.frame_5
	frame_oam -32,  -4, $02, $20

	INCROM $15339, $1535a

.frame_6
	frame_oam -31, -14, $32, $00

	INCROM $1535e, $15373

.frame_7
	frame_oam -31, -14, $32, $00

	INCROM $15377, $1538c

.frame_8
	frame_oam -31, -14, $32, $00

	INCROM $15390, $153a5

.frame_9
	frame_oam -31, -14, $32, $00

	INCROM $153a9, $153be

.frame_10
	frame_oam -31, -14, $32, $00

	INCROM $153c2, $153d7

.frame_11
	frame_oam -31,   6, $32, $20

	INCROM $153db, $153f0

.frame_12
	frame_oam -31,   6, $32, $20

	INCROM $153f4, $15409

.frame_13
	frame_oam -31,   6, $32, $20

	INCROM $1540d, $15422

.frame_14
	frame_oam -31,   6, $32, $20

	INCROM $15426, $1543b

.frame_15
	frame_oam -31,   6, $32, $20

	INCROM $1543f, $15454

.frame_16
	frame_oam -32, -15, $58, $00

	INCROM $15458, $15471

.frame_17
	frame_oam -32, -15, $66, $00

	INCROM $15475, $15496

.frame_18
	frame_oam -16,  -8, $78, $00

	INCROM $1549a, $154bb

.frame_19
	frame_oam -32,   7, $58, $20

	INCROM $154bf, $154d8

.frame_20
	frame_oam -32,   7, $66, $20

	INCROM $154dc, $154fd

.frame_21
	frame_oam -16,   0, $78, $20

	INCROM $15501, $15522

.frame_22
	frame_oam -32, -14, $32, $00

	INCROM $15526, $1553b

.frame_23
	frame_oam -32,   6, $32, $20
; 0x1553f

	INCROM $1553f, $15554

Frameset_15554: ; 15554 (5:5554)
	db $00,  5
	db $01,  5
	db $02,  5
	db $ff

Frameset_1555b: ; 1555b (5:555b)
	db $03,  5
	db $04,  5
	db $05,  5
	db $ff

Frameset_15562: ; 15562 (5:5562)
	db $08,  6
	db $07,  5
	db $16, 30
	db $ff

Frameset_15569: ; 15569 (5:5569)
	db $09,  4
	db $ff

Frameset_1556c: ; 1556c (5:556c)
	db $0d,  6
	db $0c,  5
	db $17, 30
	db $ff

Frameset_15573: ; 15573 (5:5573)
	db $0e,  4
	db $ff

Frameset_15576: ; 15576 (5:5576)
	db $09, 10
	db $06, 12
	db $07, 17
	db $06,  9
	db $09,  7
	db $0a,  7
	db $09,  7
	db $0a,  7
	db $09,  7
	db $0a,  7
	db $ff

Frameset_1558b: ; 1558b (5:558b)
	db $0e, 10
	db $0b, 12
	db $0c, 17
	db $0b,  9
	db $0e,  7
	db $0f,  7
	db $0e,  7
	db $0f,  7
	db $0e,  7
	db $0f,  7
	db $ff

Frameset_155a0: ; 155a0 (5:55a0)
	db $10,  8
	db $ff

Frameset_155a3: ; 155a3 (5:55a3)
	db $13,  8
	db $ff

Frameset_155a6: ; 155a6 (5:55a6)
	db $11,  5
	db $12,  5
	db $ff

Frameset_155ab: ; 155ab (5:55ab)
	db $14,  5
	db $15,  5
	db $ff

Frameset_155b0: ; 155b0 (5:55b0)
	db $00,  3
	db $01,  3
	db $02,  3
	db $ff

Frameset_155b7: ; 155b7 (5:55b7)
	db $03,  3
	db $04,  3
	db $05,  3
	db $ff

Frameset_155be: ; 155be (5:55be)
	db $09,  3
	db $0a,  3
	db $16,  2
	db $ff

Frameset_155c5: ; 155c5 (5:55c5)
	db $0e,  3
	db $0f,  3
	db $17,  2
	db $ff
; 0x155cc

OAM_155cc: ; 155cc (5:55cc)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23
	dw .frame_24
	dw .frame_25

.frame_0
	frame_oam -32, -12, $00, $00

	INCROM $15604, $15619

.frame_1
	frame_oam -32, -12, $06, $00

	INCROM $1561d, $15632

.frame_2
	frame_oam -32, -12, $0c, $00

	INCROM $15636, $1564b

.frame_3
	frame_oam -32,   4, $00, $20

	INCROM $1564f, $15664

.frame_4
	frame_oam -32,   4, $06, $20

	INCROM $15668, $1567d

.frame_5
	frame_oam -32,   4, $0c, $20

	INCROM $15681, $15696

.frame_6
	frame_oam -32, -16, $12, $00

	INCROM $1569a, $156b7

.frame_7
	frame_oam -32,   8, $12, $20

	INCROM $156bb, $156d8

.frame_8
	frame_oam -32, -16, $1a, $00

	INCROM $156dc, $156f9

.frame_9
	frame_oam -32,   8, $1a, $20

	INCROM $156fd, $1571a

.frame_10
	frame_oam -16,   4, $2c, $20

	INCROM $1571e, $15733

.frame_11
	frame_oam -32, -12, $40, $20

	INCROM $15737, $15750

.frame_12
	frame_oam -16,   4, $44, $20

	INCROM $15754, $1576d

.frame_13
	frame_oam -32, -12, $4a, $20

	INCROM $15771, $15786

.frame_14
	frame_oam -16,   4, $44, $20

	INCROM $1578a, $1579f

.frame_15
	frame_oam -16,   4, $44, $20

	INCROM $157a3, $157b8

.frame_16
	frame_oam -16, -12, $2c, $00

	INCROM $157bc, $157d1

.frame_17
	frame_oam -32,   4, $40, $00

	INCROM $157d5, $157ee

.frame_18
	frame_oam -16, -12, $44, $00

	INCROM $157f2, $1580b

.frame_19
	frame_oam -32,   4, $4a, $00

	INCROM $1580f, $15824

.frame_20
	frame_oam -16, -12, $44, $00

	INCROM $15828, $1583d

.frame_21
	frame_oam -16, -12, $44, $00

	INCROM $15841, $15856

.frame_22
	frame_oam -16,  -8, $78, $00

	INCROM $1585a, $15877

.frame_23
	frame_oam -32,   7, $72, $20

	INCROM $1587b, $15898

.frame_24
	frame_oam -32, -12, $6e, $00

	INCROM $1589c, $158b5

.frame_25
	frame_oam -32, -15, $72, $00
; 0x158b9

	INCROM $158b9, $158d6

Frameset_158d6: ; 158d6 (5:58d6)
	db $00,  3
	db $01,  3
	db $02,  2
	db $00,  2
	db $03,  3
	db $04,  3
	db $05,  2
	db $03,  2
	db $ff

Frameset_158e7: ; 158e7 (5:58e7)
	db $01,  3
	db $06,  3
	db $07,  3
	db $08,  3
	db $00,  3
	db $ff

Frameset_158f2: ; 158f2 (5:58f2)
	db $04,  3
	db $07,  3
	db $06,  3
	db $09,  3
	db $03,  3
	db $ff

Frameset_158fd: ; 158fd (5:58fd)
	db $00,  4
	db $ff

Frameset_15900: ; 15900 (5:5900)
	db $03,  4
	db $ff

Frameset_15903: ; 15903 (5:5903)
	db $0a,  8
	db $0b, 10
	db $0c, 10
	db $0d,  6
	db $0e,  6
	db $0d,  6
	db $0e,  6
	db $0d,  6
	db $0e,  6
	db $0f,  6
	db $0d,  3
	db $0e,  3
	db $0f, 10
	db $0e,  6
	db $0c,  8
	db $0b,  8
	db $ff

Frameset_15924: ; 15924 (5:5924)
	db $10,  8
	db $11, 10
	db $12, 10
	db $13,  6
	db $14,  6
	db $13,  6
	db $14,  6
	db $13,  6
	db $14,  6
	db $15,  6
	db $13,  3
	db $14,  3
	db $15, 10
	db $14,  6
	db $12,  8
	db $11,  8
	db $ff

Frameset_15945: ; 15945 (5:5945)
	db $18,  4
	db $ff

Frameset_15948: ; 15948 (5:5948)
	db $16,  2
	db $17,  1
	db $06,  2
	db $18,  2
	db $19,  1
	db $07,  2
	db $ff
; 0x15955

OAM_15955: ; 15955 (5:5955)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23
	dw .frame_24
	dw .frame_25
	dw .frame_26
	dw .frame_27
	dw .frame_28
	dw .frame_29
	dw .frame_30
	dw .frame_31
	dw .frame_32
	dw .frame_33
	dw .frame_34
	dw .frame_35
	dw .frame_36
	dw .frame_37
	dw .frame_38
	dw .frame_39
	dw .frame_40
	dw .frame_41
	dw .frame_42
	dw .frame_43
	dw .frame_44
	dw .frame_45
	dw .frame_46
	dw .frame_47
	dw .frame_48
	dw .frame_49
	dw .frame_50
	dw .frame_51
	dw .frame_52
	dw .frame_53
	dw .frame_54
	dw .frame_55
	dw .frame_56

.frame_0
	frame_oam -14, -12, $20, $00

	INCROM $159cb, $159e0

.frame_1
	frame_oam -33, -12, $06, $00

	INCROM $159e4, $159f9

.frame_2
	frame_oam -34, -12, $12, $00

	INCROM $159fd, $15a1a

.frame_3
	frame_oam -34, -12, $0c, $00

	INCROM $15a1e, $15a33

.frame_4
	frame_oam -32, -12, $0c, $00

	INCROM $15a37, $15a4c

.frame_5
	frame_oam -31, -12, $00, $00

	INCROM $15a50, $15a65

.frame_6
	frame_oam -33, -12, $00, $00

	INCROM $15a69, $15a7e

.frame_7
	frame_oam -14,   4, $20, $20

	INCROM $15a82, $15a97

.frame_8
	frame_oam -33,   4, $06, $20

	INCROM $15a9b, $15ab0

.frame_9
	frame_oam -34,   4, $12, $20

	INCROM $15ab4, $15ad1

.frame_10
	frame_oam -34,   4, $0c, $20

	INCROM $15ad5, $15aea

.frame_11
	frame_oam -32,   4, $0c, $20

	INCROM $15aee, $15b03

.frame_12
	frame_oam -31,   4, $00, $20

	INCROM $15b07, $15b1c

.frame_13
	frame_oam -33,   4, $00, $20

	INCROM $15b20, $15b35

.frame_14
	frame_oam -32, -12, $36, $00

	INCROM $15b39, $15b4e

.frame_15
	frame_oam -33, -12, $36, $00

	INCROM $15b52, $15b67

.frame_16
	frame_oam -32, -12, $4a, $00

	INCROM $15b6b, $15b80

.frame_17
	frame_oam -32, -10, $56, $00

	INCROM $15b84, $15b95

.frame_18
	frame_oam -32,   4, $36, $20

	INCROM $15b99, $15bae

.frame_19
	frame_oam -33,   4, $36, $20

	INCROM $15bb2, $15bc7

.frame_20
	frame_oam -32,   4, $4a, $20

	INCROM $15bcb, $15be0

.frame_21
	frame_oam -32,   2, $56, $20

	INCROM $15be4, $15bf5

.frame_22
	frame_oam -33,   4, $42, $00

	INCROM $15bf9, $15c0e

.frame_23
	frame_oam -33, -12, $42, $20

	INCROM $15c12, $15c27

.frame_24
	frame_oam -33,   4, $42, $00

	INCROM $15c2b, $15c40

.frame_25
	frame_oam -33,   4, $42, $00

	INCROM $15c44, $15c59

.frame_26
	frame_oam -33,   4, $42, $00

	INCROM $15c5d, $15c72

.frame_27
	frame_oam -33, -12, $42, $20

	INCROM $15c76, $15c8b

.frame_28
	frame_oam -33, -12, $42, $20

	INCROM $15c8f, $15ca4

.frame_29
	frame_oam -30, -12, $06, $00

	INCROM $15ca8, $15cbd

.frame_30
	frame_oam -14, -12, $20, $00

	INCROM $15cc1, $15cd6

.frame_31
	frame_oam -30,   4, $06, $20

	INCROM $15cda, $15cef

.frame_32
	frame_oam -14,   4, $20, $20

	INCROM $15cf3, $15d08

.frame_33
	frame_oam -14, -12, $20, $00

	INCROM $15d0c, $15d21

.frame_34
	frame_oam -30,  -4, $08, $00

	INCROM $15d25, $15d3a

.frame_35
	frame_oam -14, -12, $20, $00

	INCROM $15d3e, $15d53

.frame_36
	frame_oam -14,   4, $20, $20

	INCROM $15d57, $15d6c

.frame_37
	frame_oam -30,  -4, $08, $20

	INCROM $15d70, $15d85

.frame_38
	frame_oam -14,   4, $20, $20

	INCROM $15d89, $15d9e

.frame_39
	frame_oam -16, -12, $20, $00

	INCROM $15da2, $15db7

.frame_40
	frame_oam -18, -12, $20, $00

	INCROM $15dbb, $15dd0

.frame_41
	frame_oam -16,   4, $20, $20

	INCROM $15dd4, $15de9

.frame_42
	frame_oam -34,  -4, $08, $20

	INCROM $15ded, $15e02

.frame_43
	frame_oam -16, -12, $20, $00

	INCROM $15e06, $15e1b

.frame_44
	frame_oam -34, -12, $0c, $00

	INCROM $15e1f, $15e34

.frame_45
	frame_oam -16,   4, $20, $20

	INCROM $15e38, $15e4d

.frame_46
	frame_oam -34,   4, $0c, $20

	INCROM $15e51, $15e66

.frame_47
	frame_oam -18, -12, $20, $00

	INCROM $15e6a, $15e7f

.frame_48
	frame_oam -18,   4, $20, $20

	INCROM $15e83, $15e98

.frame_49
	frame_oam -14, -16, $74, $00

	INCROM $15e9c, $15eb5

.frame_50
	frame_oam -30, -12, $00, $01

	INCROM $15eb9, $15ece

.frame_51
	frame_oam -14,   8, $74, $20

	INCROM $15ed2, $15eeb

.frame_52
	frame_oam -30,   4, $00, $21

	INCROM $15eef, $15f04

.frame_53
	frame_oam -30,   4, $04, $01

	INCROM $15f08, $15f21

.frame_54
	frame_oam -30,   4, $04, $01

	INCROM $15f25, $15f3a

.frame_55
	frame_oam -30, -12, $04, $21

	INCROM $15f3e, $15f57

.frame_56
	frame_oam -30, -12, $04, $21
; 0x15f5b

	INCROM $15f5b, $15f70

Frameset_15f70: ; 15f70 (5:5f70)
	db $00,  2
	db $01,  2
	db $02,  3
	db $03,  2
	db $04,  2
	db $05,  5
	db $06,  3
	db $ff

Frameset_15f7f: ; 15f7f (5:5f7f)
	db $07,  2
	db $08,  2
	db $09,  3
	db $0a,  2
	db $0b,  2
	db $0c,  5
	db $0d,  3
	db $ff

Frameset_15f8e: ; 15f8e (5:5f8e)
	db $00,  4
	db $ff

Frameset_15f91: ; 15f91 (5:5f91)
	db $07,  4
	db $ff

Frameset_15f94: ; 15f94 (5:5f94)
	db $0f,  4
	db $ff

Frameset_15f97: ; 15f97 (5:5f97)
	db $13,  4
	db $ff

Frameset_15f9a: ; 15f9a (5:5f9a)
	db $10,  2
	db $11,  2
	db $0e,  2
	db $ff

Frameset_15fa1: ; 15fa1 (5:5fa1)
	db $14,  2
	db $15,  2
	db $12,  2
	db $ff

Frameset_15fa8: ; 15fa8 (5:5fa8)
	db $16,  4
	db $ff

Frameset_15fab: ; 15fab (5:5fab)
	db $17,  4
	db $ff

Frameset_15fae: ; 15fae (5:5fae)
	db $19,  2
	db $1a,  2
	db $ff

Frameset_15fb3: ; 15fb3 (5:5fb3)
	db $1b,  2
	db $1c,  2
	db $ff

Frameset_15fb8: ; 15fb8 (5:5fb8)
	db $1e,  2
	db $1d,  1
	db $00,  1
	db $1d,  1
	db $1e,  2
	db $1d,  2
	db $ff

Frameset_15fc5: ; 15fc5 (5:5fc5)
	db $20,  2
	db $1f,  1
	db $07,  1
	db $1f,  1
	db $20,  2
	db $1f,  2
	db $ff

Frameset_15fd2: ; 15fd2 (5:5fd2)
	db $23,  2
	db $22,  1
	db $21,  1
	db $22,  1
	db $23,  2
	db $22,  2
	db $ff

Frameset_15fdf: ; 15fdf (5:5fdf)
	db $26,  2
	db $25,  1
	db $24,  1
	db $25,  1
	db $26,  2
	db $25,  2
	db $ff

Frameset_15fec: ; 15fec (5:5fec)
	db $21,  4
	db $ff

Frameset_15fef: ; 15fef (5:5fef)
	db $24,  4
	db $ff

Frameset_15ff2: ; 15ff2 (5:5ff2)
	db $04,  3
	db $03,  4
	db $2c,  3
	db $2b,  3
	db $00,  2
	db $2b,  2
	db $2c,  3
	db $2b,  2
	db $00,  2
	db $2b,  2
	db $00,  1
	db $ff

Frameset_16009: ; 16009 (5:6009)
	db $0b,  3
	db $0a,  4
	db $2e,  3
	db $2d,  3
	db $07,  2
	db $2d,  2
	db $2e,  3
	db $2d,  2
	db $07,  2
	db $2d,  2
	db $07,  1
	db $ff

Frameset_16020: ; 16020 (5:6020)
	db $27,  3
	db $28,  4
	db $2f,  3
	db $27,  3
	db $21,  2
	db $27,  2
	db $28,  3
	db $27,  2
	db $21,  2
	db $27,  2
	db $21,  1
	db $ff

Frameset_16037: ; 16037 (5:6037)
	db $29,  3
	db $2a,  4
	db $30,  3
	db $29,  3
	db $24,  2
	db $29,  2
	db $2a,  3
	db $29,  2
	db $24,  2
	db $29,  2
	db $24,  1
	db $ff

Frameset_1604e: ; 1604e (5:604e)
	db $00,  1
	db $31,  2
	db $32,  1
	db $ff

Frameset_16055: ; 16055 (5:6055)
	db $07,  1
	db $33,  2
	db $34,  1
	db $ff

Frameset_1605c: ; 1605c (5:605c)
	db $21,  1
	db $35,  2
	db $36,  1
	db $ff

Frameset_16063: ; 16063 (5:6063)
	db $24,  1
	db $37,  2
	db $38,  1
	db $ff
; 0x1606a

OAM_1606a: ; 1606a (5:606a)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23
	dw .frame_24
	dw .frame_25
	dw .frame_26
	dw .frame_27
	dw .frame_28
	dw .frame_29

.frame_0
	frame_oam -30, -12, $08, $00

	INCROM $160aa, $160c3

.frame_1
	frame_oam -32, -12, $0e, $00

	INCROM $160c7, $160dc

.frame_2
	frame_oam -16, -12, $34, $00

	INCROM $160e0, $160f5

.frame_3
	frame_oam -32, -12, $1a, $00

	INCROM $160f9, $1610e

.frame_4
	frame_oam -30,  -4, $0a, $00

	INCROM $16112, $1612f

.frame_5
	frame_oam -32, -12, $0e, $00

	INCROM $16133, $16148

.frame_6
	frame_oam -32, -12, $0e, $00

	INCROM $1614c, $16161

.frame_7
	frame_oam -31,  -4, $0a, $00

	INCROM $16165, $1617a

.frame_8
	frame_oam -32,   4, $1e, $00

	INCROM $1617e, $16193

.frame_9
	frame_oam -32, -12, $66, $00

	INCROM $16197, $161ac

.frame_10
	frame_oam -32, -20, $40, $00

	INCROM $161b0, $161d1

.frame_11
	frame_oam -32, -20, $5e, $00

	INCROM $161d5, $161f2

.frame_12
	frame_oam -30,   4, $08, $20

	INCROM $161f6, $1620f

.frame_13
	frame_oam -32,   4, $0e, $20

	INCROM $16213, $16228

.frame_14
	frame_oam -16,   4, $34, $20

	INCROM $1622c, $16241

.frame_15
	frame_oam -32,   4, $1a, $20

	INCROM $16245, $1625a

.frame_16
	frame_oam -30,  -4, $0a, $20

	INCROM $1625e, $1627b

.frame_17
	frame_oam -32,   4, $0e, $20

	INCROM $1627f, $16294

.frame_18
	frame_oam -32,   4, $0e, $20

	INCROM $16298, $162ad

.frame_19
	frame_oam -31,  -4, $0a, $20

	INCROM $162b1, $162c6

.frame_20
	frame_oam -32, -12, $1e, $20

	INCROM $162ca, $162df

.frame_21
	frame_oam -32,   4, $66, $20

	INCROM $162e3, $162f8

.frame_22
	frame_oam -32,  12, $40, $20

	INCROM $162fc, $1631d

.frame_23
	frame_oam -32,  12, $5e, $20

	INCROM $16321, $1633e

.frame_24
	frame_oam -32, -12, $66, $01

	INCROM $16342, $1635b

.frame_25
	frame_oam -32,   4, $66, $21

	INCROM $1635f, $16378

.frame_26
	frame_oam -32, -12, $66, $01

	INCROM $1637c, $16395

.frame_27
	frame_oam -32, -12, $66, $00

	INCROM $16399, $163b2

.frame_28
	frame_oam -32,   4, $66, $21

	INCROM $163b6, $163cf

.frame_29
	frame_oam -32,   4, $66, $20
; 0x163d3

	INCROM $163d3, $163ec

Frameset_163ec: ; 163ec (5:63ec)
	db $00,  3
	db $01,  3
	db $02,  1
	db $03,  1
	db $ff

Frameset_163f5: ; 163f5 (5:63f5)
	db $04,  7
	db $05,  6
	db $02,  2
	db $03,  2
	db $ff

Frameset_163fe: ; 163fe (5:63fe)
	db $06,  2
	db $07,  2
	db $ff

Frameset_16403: ; 16403 (5:6403)
	db $08,  4
	db $04,  4
	db $0a,  2
	db $0b,  2
	db $ff

Frameset_1640c: ; 1640c (5:640c)
	db $0c,  3
	db $0d,  3
	db $0e,  3
	db $0f,  1
	db $ff

Frameset_16415: ; 16415 (5:6415)
	db $10,  7
	db $11,  6
	db $0e,  2
	db $0f,  2
	db $ff

Frameset_1641e: ; 1641e (5:641e)
	db $12,  2
	db $13,  2
	db $ff

Frameset_16423: ; 16423 (5:6423)
	db $14,  4
	db $10,  4
	db $16,  2
	db $17,  2
	db $ff

Frameset_1642c: ; 1642c (5:642c)
	db $03,  4
	db $ff

Frameset_1642f: ; 1642f (5:642f)
	db $0f,  4
	db $ff

Frameset_16432: ; 16432 (5:6432)
	db $08,  4
	db $ff

Frameset_16435: ; 16435 (5:6435)
	db $14,  4
	db $ff

Frameset_16438: ; 16438 (5:6438)
	db $18,  2
	db $1a,  1
	db $1b,  1
	db $09,  2
	db $ff

Frameset_16441: ; 16441 (5:6441)
	db $19,  2
	db $1c,  1
	db $1d,  1
	db $15,  2
	db $ff
; 0x1644a

OAM_1644a: ; 1644a (5:644a)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23
	dw .frame_24
	dw .frame_25
	dw .frame_26
	dw .frame_27

.frame_0
	frame_oam -24,  -8, $46, $00

	INCROM $16486, $16493

.frame_1
	frame_oam -16, -15, $40, $00

	INCROM $16497, $164a0

.frame_2
	frame_oam -10,   0, $46, $60

	INCROM $164a4, $164b1

.frame_3
	frame_oam -16,   7, $40, $60

	INCROM $164b5, $164be

.frame_4
	frame_oam -24,   0, $46, $20

	INCROM $164c2, $164cf

.frame_5
	frame_oam -16,   7, $40, $20

	INCROM $164d3, $164dc

.frame_6
	frame_oam -10,  -8, $46, $40

	INCROM $164e0, $164ed

.frame_7
	frame_oam -16, -15, $40, $40

	INCROM $164f1, $164fa

.frame_8
	frame_oam -32, -14, $60, $00

	INCROM $164fe, $16517

.frame_9
	frame_oam -31, -15, $60, $00

	INCROM $1651b, $16534

.frame_10
	frame_oam -32,   6, $60, $20

	INCROM $16538, $16551

.frame_11
	frame_oam -31,   7, $60, $20

	INCROM $16555, $1656e

.frame_12
	frame_oam -37, -16, $4e, $00

	INCROM $16572, $1658b

.frame_13
	frame_oam -43, -17, $4e, $00

	INCROM $1658f, $165a8

.frame_14
	frame_oam -34, -16, $6e, $00

	INCROM $165ac, $165c9

.frame_15
	frame_oam -13,   2, $60, $60

	INCROM $165cd, $165e6

.frame_16
	frame_oam -34,   8, $6e, $20

	INCROM $165ea, $16607

.frame_17
	frame_oam -13, -10, $60, $40

	INCROM $1660b, $16624

.frame_18
	frame_oam -37,   8, $4e, $20

	INCROM $16628, $16641

.frame_19
	frame_oam -43,   9, $4e, $20

	INCROM $16645, $1665e

.frame_20
	frame_oam -16, -15, $56, $00

	INCROM $16662, $1666f

.frame_21
	frame_oam -16,  -7, $5c, $00

	INCROM $16673, $16680

.frame_22
	frame_oam -16,   8, $56, $60

	INCROM $16684, $16691

.frame_23
	frame_oam -16,   0, $5c, $60

	INCROM $16695, $166a2

.frame_24
	frame_oam -16,   7, $56, $20

	INCROM $166a6, $166b3

.frame_25
	frame_oam -16,  -1, $5c, $20

	INCROM $166b7, $166c4

.frame_26
	frame_oam -16, -16, $56, $40

	INCROM $166c8, $166d5

.frame_27
	frame_oam -16,  -8, $5c, $40
; 0x166d9

	INCROM $166d9, $166e6

Frameset_166e6: ; 166e6 (5:66e6)
	db $00,  2
	db $14,  1
	db $01,  2
	db $15,  1
	db $02,  2
	db $16,  1
	db $03,  2
	db $17,  1
	db $ff

Frameset_166f7: ; 166f7 (5:66f7)
	db $04,  2
	db $18,  1
	db $05,  2
	db $19,  1
	db $06,  2
	db $1a,  1
	db $07,  2
	db $1b,  1
	db $ff

Frameset_16708: ; 16708 (5:6708)
	db $08,  3
	db $09,  2
	db $08,  3
	db $09,  2
	db $08,  3
	db $09,  2
	db $08,  3
	db $09,  2
	db $08,  3
	db $09,  2
	db $ff

Frameset_1671d: ; 1671d (5:671d)
	db $0a,  3
	db $0b,  2
	db $0a,  3
	db $0b,  2
	db $0a,  3
	db $0b,  2
	db $0a,  3
	db $0b,  2
	db $0a,  3
	db $0b,  2
	db $ff

Frameset_16732: ; 16732 (5:6732)
	db $0e,  8
	db $0f,  6
	db $ff

Frameset_16737: ; 16737 (5:6737)
	db $10,  8
	db $11,  6
	db $ff
; 0x1673c

OAM_1673c: ; 1673c (5:673c)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23
	dw .frame_24
	dw .frame_25
	dw .frame_26
	dw .frame_27
	dw .frame_28
	dw .frame_29
	dw .frame_30
	dw .frame_31

.frame_0
	frame_oam -32, -12, $00, $00

	INCROM $16780, $1679d

.frame_1
	frame_oam -33, -12, $00, $00

	INCROM $167a1, $167be

.frame_2
	frame_oam -31, -12, $00, $00

	INCROM $167c2, $167df

.frame_3
	frame_oam -31, -12, $00, $00

	INCROM $167e3, $16800

.frame_4
	frame_oam -32,   4, $00, $20

	INCROM $16804, $16821

.frame_5
	frame_oam -33,   4, $00, $20

	INCROM $16825, $16842

.frame_6
	frame_oam -31,   4, $00, $20

	INCROM $16846, $16863

.frame_7
	frame_oam -31,   4, $00, $20

	INCROM $16867, $16884

.frame_8
	frame_oam -32, -11, $30, $01

	INCROM $16888, $1689d

.frame_9
	frame_oam -32, -11, $3c, $01

	INCROM $168a1, $168b6

.frame_10
	frame_oam -32, -11, $48, $01

	INCROM $168ba, $168cf

.frame_11
	frame_oam -32, -11, $54, $01

	INCROM $168d3, $168e8

.frame_12
	frame_oam -32,   5, $30, $21

	INCROM $168ec, $16901

.frame_13
	frame_oam -32,   5, $3c, $21

	INCROM $16905, $1691a

.frame_14
	frame_oam -32,   5, $48, $21

	INCROM $1691e, $16933

.frame_15
	frame_oam -32,   5, $54, $21

	INCROM $16937, $1694c

.frame_16
	frame_oam -32, -12, $00, $00

	INCROM $16950, $16969

.frame_17
	frame_oam -33, -12, $00, $00

	INCROM $1696d, $16986

.frame_18
	frame_oam -31, -12, $00, $00

	INCROM $1698a, $169a3

.frame_19
	frame_oam -31, -12, $00, $00

	INCROM $169a7, $169c0

.frame_20
	frame_oam -32,   4, $00, $20

	INCROM $169c4, $169dd

.frame_21
	frame_oam -33,   4, $00, $20

	INCROM $169e1, $169fa

.frame_22
	frame_oam -31,   4, $00, $20

	INCROM $169fe, $16a17

.frame_23
	frame_oam -31,   4, $00, $20

	INCROM $16a1b, $16a34

.frame_24
	frame_oam -32, -12, $00, $00

	INCROM $16a38, $16a51

.frame_25
	frame_oam -33, -12, $00, $00

	INCROM $16a55, $16a6e

.frame_26
	frame_oam -31, -12, $00, $00

	INCROM $16a72, $16a8b

.frame_27
	frame_oam -31, -12, $00, $00

	INCROM $16a8f, $16aa4

.frame_28
	frame_oam -32,   4, $00, $20

	INCROM $16aa8, $16ac1

.frame_29
	frame_oam -33,   4, $00, $20

	INCROM $16ac5, $16ade

.frame_30
	frame_oam -31,   4, $00, $20

	INCROM $16ae2, $16afb

.frame_31
	frame_oam -31,   4, $00, $20
; 0x16aff

	INCROM $16aff, $16b14

Frameset_16b14:
	db $00,  2
	db $01,  2
	db $02,  2
	db $03,  2
	db $ff

Frameset_16b1d:
	db $04,  2
	db $05,  2
	db $06,  2
	db $07,  2
	db $ff

Frameset_16b26:
	db $08,  4
	db $09,  4
	db $0a,  4
	db $0b,  4
	db $ff

Frameset_16b2f:
	db $0c,  4
	db $0d,  4
	db $0e,  4
	db $0f,  4
	db $ff

Frameset_16b38:
	db $10,  2
	db $11,  2
	db $12,  2
	db $13,  2
	db $10,  2
	db $11,  2
	db $12,  2
	db $13,  2
	db $ff

Frameset_16b49:
	db $14,  2
	db $15,  2
	db $16,  2
	db $17,  2
	db $14,  2
	db $15,  2
	db $16,  2
	db $17,  2
	db $ff

Frameset_16b5a:
	db $18,  2
	db $19,  2
	db $1a,  2
	db $1b,  2
	db $ff

Frameset_16b63:
	db $1c,  2
	db $1d,  2
	db $1e,  2
	db $1f,  2
	db $ff
; 0x16b6c

OAM_16b6c: ; 16b6c (5:6b6c)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20

.frame_0
	frame_oam -32, -12, $00, $00

	INCROM $16b9a, $16bbb

.frame_1
	frame_oam -32, -12, $00, $00

	INCROM $16bbf, $16be0

.frame_2
	frame_oam -32, -12, $00, $00

	INCROM $16be4, $16bfd

.frame_3
	frame_oam -32, -12, $00, $00

	INCROM $16c01, $16c1a

.frame_4
	frame_oam -32, -12, $00, $00

	INCROM $16c1e, $16c37

.frame_5
	frame_oam -32,   4, $04, $00

	INCROM $16c3b, $16c54

.frame_6
	frame_oam -35, -16, $14, $00

	INCROM $16c58, $16c75

.frame_7
	frame_oam -32, -16, $14, $00

	INCROM $16c79, $16c96

.frame_8
	frame_oam -32, -16, $14, $00

	INCROM $16c9a, $16cb7

.frame_9
	frame_oam -32, -16, $1c, $00

	INCROM $16cbb, $16cd8

.frame_10
	frame_oam -32, -16, $20, $00

	INCROM $16cdc, $16cf9

.frame_11
	frame_oam -32, -16, $38, $00

	INCROM $16cfd, $16d1e

.frame_12
	frame_oam -32, -16, $38, $00

	INCROM $16d22, $16d43

.frame_13
	frame_oam -32, -16, $38, $00

	INCROM $16d47, $16d68

.frame_14
	frame_oam -32, -16, $38, $00

	INCROM $16d6c, $16d89

.frame_15
	frame_oam -32,   4, $00, $20

	INCROM $16d8d, $16da6

.frame_16
	frame_oam -32,   4, $00, $20

	INCROM $16daa, $16dc3

.frame_17
	frame_oam -32,   4, $00, $20

	INCROM $16dc7, $16de0

.frame_18
	frame_oam -32, -12, $04, $20

	INCROM $16de4, $16dfd

.frame_19
	frame_oam -32,   4, $00, $20

	INCROM $16e01, $16e22

.frame_20
	frame_oam -32,   4, $00, $20
; 0x16e26

	INCROM $16e26, $16e47

Frameset_16e47: ; 16e47 (5:6e47)
	db $00,  5
	db $01,  6
	db $02,  3
	db $03,  2
	db $04,  6
	db $05,  7
	db $02,  1
	db $03,  1
	db $05,  3
	db $02,  1
	db $03,  1
	db $04,  1
	db $06,  3
	db $07,  8
	db $08,  2
	db $09,  3
	db $0a,  3
	db $0b,  3
	db $0c,  3
	db $0d,  4
	db $0e,  1
	db $ff

Frameset_16e72: ; 16e72 (5:6e72)
	db $13,  5
	db $14,  6
	db $0f,  3
	db $10,  2
	db $11,  6
	db $12,  7
	db $0f,  1
	db $10,  1
	db $12,  3
	db $0f,  1
	db $10,  1
	db $12,  1
	db $06,  3
	db $07,  8
	db $08,  2
	db $09,  3
	db $0a,  3
	db $0b,  3
	db $0c,  3
	db $0d,  4
	db $0e,  1
	db $ff
; 0x16e9d

	INCROM $16e9d, $1715f

Frameset_1715f: ; 1715f (5:715f)
	db $01,  6
	db $02,  4
	db $03,  2
	db $04,  2
	db $03,  2
	db $04,  4
	db $ff
; 0x1716c

	INCROM $1716c, $17175

Frameset_17175: ; 17175 (5:7175)
	db $08,  3
	db $09,  2
	db $0a,  1
	db $0b,  2
	db $0c,  3
	db $0b,  2
	db $0a,  1
	db $09,  2
	db $ff
; 0x17186

Frameset_17186: ; 17186 (5:7186)
	db $0d, 12
	db $0e, 10
	db $ff
; 0x1718b

Frameset_1718b: ; 1718b (5:718b)
	db $0a,  3
	db $1d,  3
	db $ff
; 0x17190

Frameset_17190: ; 17190 (5:7190)
	db $12,  4
	db $ff
; 0x17193

	INCROM $17193, $1719a

Frameset_1719a: ; 1719a (5:719a)
	db $14, 11
	db $15, 11
	db $16, 11
	db $17, 11
	db $ff
; 0x171a3

Frameset_171a3: ; 171a3 (5:71a3)
	db $14,  7
	db $15,  7
	db $16,  5
	db $17,  5
	db $15,  4
	db $18,  4
	db $19,  4
	db $1a,  5
	db $1b,  6
	db $1c,  8
	db $ff
; 0x171b8

Frameset_171b8: ; 171b8 (5:71b8)
	db $11, 12
	db $10, 10
	db $ff
; 0x171bd

	INCROM $171bd, $173fe

Frameset_173fe: ; 173fe (5:73fe)
	db $00,  3
	db $01,  3
	db $02,  3
	db $03,  3
	db $04,  3
	db $ff

Frameset_17409: ; 17409 (5:7409)
	db $05, 12
	db $06,  8
	db $07,  6
	db $08,  6
	db $09,  8
	db $ff

Frameset_17414: ; 17414 (5:7414)
	db $0a,  5
	db $0b,  5
	db $0c,  6
	db $06,  7
	db $05,  8
	db $ff

Frameset_1741f: ; 1741f (5:741f)
	db $0d,  3
	db $0e,  3
	db $0f,  3
	db $10,  3
	db $11,  3
	db $ff

Frameset_1742a: ; 1742a (5:742a)
	db $05,  4
	db $ff
; 0x1742d

	INCROM $1742d, $1781c

Frameset_1781c: ; 1781c (5:781c)
	db $00,  7
	db $ff
; 0x1781f

Frameset_1781f: ; 1781f (5:781f)
	db $04,  7
	db $ff
; 0x17822

Frameset_17822: ; 17822 (5:7822)
	db $00,  7
	db $01,  7
	db $02,  7
	db $03,  7
	db $ff
; 0x1782b

Frameset_1782b: ; 1782b (5:782b)
	db $04,  7
	db $05,  7
	db $06,  7
	db $07,  7
	db $ff
; 0x17834

Frameset_17834: ; 17834 (5:7834)
	db $01,  4
	db $02,  4
	db $ff
; 0x17839

Frameset_17839: ; 17839 (5:7839)
	db $05,  4
	db $06,  4
	db $ff
; 0x1783e

Frameset_1783e: ; 1783e (5:783e)
	db $08,  4
	db $ff
; 0x17841

Frameset_17841: ; 17841 (5:7841)
	db $0a,  4
	db $ff
; 0x17844

Frameset_17844: ; 17844 (5:7844)
	db $00,  1
	db $23,  2
	db $00,  1
	db $23,  2
	db $21,  1
	db $23,  2
	db $21,  2
	db $23,  1
	db $21,  3
	db $23,  1
	db $21, 14
	db $ff
; 0x1785b

Frameset_1785b: ; 1785b (5:785b)
	db $04,  1
	db $24,  2
	db $04,  1
	db $24,  2
	db $22,  1
	db $24,  2
	db $22,  2
	db $24,  1
	db $22,  3
	db $24,  1
	db $22, 14
	db $ff
; 0x17872

Frameset_17872: ; 17872 (5:7872)
	db $0c,  7
	db $0d,  3
	db $0c,  3
	db $09,  2
	db $0c,  2
	db $0d,  3
	db $0c,  2
	db $09,  2
	db $0c,  2
	db $09,  1
	db $ff
; 0x17887

Frameset_17887: ; 17887 (5:7887)
	db $0e,  7
	db $0f,  3
	db $0e,  3
	db $0b,  2
	db $0e,  2
	db $0f,  3
	db $0e,  2
	db $0b,  2
	db $0e,  2
	db $0b,  1
	db $ff
; 0x1789c

	INCROM $1789c, $178ea

Frameset_178ea: ; 178ea (5:78ea)
	db $00,  1
	db $1e,  2
	db $1f,  2
	db $20,  2
	db $ff
; 0x178f3

Frameset_178f3: ; 178f3 (5:78f3)
	db $04,  1
	db $20,  2
	db $1f,  2
	db $1e,  2
	db $ff
; 0x178fc

	INCROM $178fc, $17b76

Frameset_17b76: ; 17b76 (5:7b76)
	db $00,  4
	db $ff

Frameset_17b79: ; 17b79 (5:7b79)
	db $08,  4
	db $ff

Frameset_17b7c: ; 17b7c (5:7b7c)
	db $02,  2
	db $01,  2
	db $02,  2
	db $01,  2
	db $04,  2
	db $03,  2
	db $04,  2
	db $03,  2
	db $ff

Frameset_17b8d: ; 17b8d (5:7b8d)
	db $0a,  2
	db $09,  2
	db $0a,  2
	db $09,  2
	db $0c,  2
	db $0b,  2
	db $0c,  2
	db $0b,  2
	db $ff

Frameset_17b9e: ; 17b9e (5:7b9e)
	db $00,  4
	db $05,  7
	db $06,  7
	db $07,  7
	db $06,  7
	db $05,  7
	db $06,  7
	db $ff

Frameset_17bad: ; 17bad (5:7bad)
	db $08,  4
	db $0d,  7
	db $0e,  7
	db $0f,  7
	db $0e,  7
	db $0d,  7
	db $0e,  7
	db $ff
; 0x17bbc

OAM_17bbc: ; 17bbc (5:7bbc)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9

.frame_0
	frame_oam -16, -12, $46, $00

	INCROM $17bd4, $17be9

.frame_1
	frame_oam -32, -13, $4a, $00

	INCROM $17bed, $17c06

.frame_2
	frame_oam -32, -15, $56, $00

	INCROM $17c0a, $17c23

.frame_3
	frame_oam -32, -15, $64, $00

	INCROM $17c27, $17c40

.frame_4
	frame_oam -16, -13, $76, $00

	INCROM $17c44, $17c59

.frame_5
	frame_oam -16, -12, $46, $00

	INCROM $17c5d, $17c72

.frame_6
	frame_oam -32,   5, $4a, $20

	INCROM $17c76, $17c8f

.frame_7
	frame_oam -32,   7, $56, $20

	INCROM $17c93, $17cac

.frame_8
	frame_oam -32,   7, $64, $20

	INCROM $17cb0, $17cc9

.frame_9
	frame_oam -16,   5, $76, $20
; 0x17ccd

	INCROM $17ccd, $17ce2

Frameset_17ce2:
	db $00,  6
	db $01,  7
	db $02,  8
	db $03, 10
	db $04,  8
	db $05,  6
	db $06,  7
	db $07,  8
	db $08, 10
	db $09,  8
	db $ff
; 0x17cf7

	INCROM $17cf7, $17e1b

Frameset_17e1b:
	db $05,  6
	db $00,  6
	db $01,  4
	db $02,  4
	db $03,  3
	db $04,  3
	db $00,  4
	db $01,  2
	db $02,  2
	db $03,  2
	db $04,  3
	db $01,  2
	db $02,  2
	db $03,  2
	db $04,  3
	db $ff

Frameset_17e3a:
	db $0b,  6
	db $06,  6
	db $07,  4
	db $08,  4
	db $09,  3
	db $0a,  3
	db $06,  4
	db $07,  2
	db $08,  2
	db $09,  2
	db $0a,  3
	db $07,  2
	db $08,  2
	db $09,  2
	db $0a,  3
	db $ff

Frameset_17e59:
	db $04,  2
	db $03,  2
	db $02,  2
	db $01,  3
	db $04,  4
	db $03,  2
	db $02,  2
	db $01,  2
	db $00,  3
	db $04,  3
	db $03,  4
	db $02,  4
	db $01,  4
	db $00,  6
	db $05,  6
	db $ff

Frameset_17e78:
	db $0a,  2
	db $09,  2
	db $08,  2
	db $07,  3
	db $0a,  4
	db $09,  2
	db $08,  2
	db $07,  2
	db $06,  3
	db $0a,  3
	db $09,  4
	db $08,  4
	db $07,  4
	db $06,  6
	db $0b,  6
	db $ff
; 0x17e97
