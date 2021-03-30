	INCROM $1fc000, $1fc48b

OAM_1fc48b: ; 1fc48b (127:448b)
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

.frame_0
	frame_oam -32, -13, $00, $00

	INCROM $1fc4ed, $1fc502

.frame_1
	frame_oam -32, -13, $06, $00

	INCROM $1fc506, $1fc51b

.frame_2
	frame_oam -32, -13, $0c, $00

	INCROM $1fc51f, $1fc534

.frame_3
	frame_oam -32, -13, $12, $00

	INCROM $1fc538, $1fc54d

.frame_4
	frame_oam -32,   5, $00, $20

	INCROM $1fc551, $1fc566

.frame_5
	frame_oam -32,   5, $06, $20

	INCROM $1fc56a, $1fc57f

.frame_6
	frame_oam -32,   5, $0c, $20

	INCROM $1fc583, $1fc598

.frame_7
	frame_oam -32,   5, $12, $20

	INCROM $1fc59c, $1fc5b1

.frame_8
	frame_oam -32, -13, $00, $00

	INCROM $1fc5b5, $1fc5ca

.frame_9
	frame_oam -32, -13, $06, $00

	INCROM $1fc5ce, $1fc5e3

.frame_10
	frame_oam -32, -13, $0c, $00

	INCROM $1fc5e7, $1fc5fc

.frame_11
	frame_oam -32, -13, $12, $00

	INCROM $1fc600, $1fc615

.frame_12
	frame_oam -32,   5, $00, $20

	INCROM $1fc619, $1fc62e

.frame_13
	frame_oam -32,   5, $06, $20

	INCROM $1fc632, $1fc647

.frame_14
	frame_oam -32,   5, $0c, $20

	INCROM $1fc64b, $1fc660

.frame_15
	frame_oam -32,   5, $12, $20

	INCROM $1fc664, $1fc679

.frame_16
	frame_oam -32, -12, $52, $00

	INCROM $1fc67d, $1fc692

.frame_17
	frame_oam -32, -12, $5e, $00

	INCROM $1fc696, $1fc6ab

.frame_18
	frame_oam -32,   4, $52, $20

	INCROM $1fc6af, $1fc6c4

.frame_19
	frame_oam -32, -13, $18, $00

	INCROM $1fc6c8, $1fc6dd

.frame_20
	frame_oam -32,   5, $18, $20

	INCROM $1fc6e1, $1fc6f6

.frame_21
	frame_oam -16, -13, $6a, $00

	INCROM $1fc6fa, $1fc70b

.frame_22
	frame_oam -16,   3, $74, $00

	INCROM $1fc70f, $1fc718

.frame_23
	frame_oam -16, -13, $70, $00

	INCROM $1fc71c, $1fc725

.frame_24
	frame_oam -16,  -5, $7c, $20

	INCROM $1fc729, $1fc73a

.frame_25
	frame_oam -17, -13, $7a, $00

	INCROM $1fc73e, $1fc74f

.frame_26
	frame_oam -16, -13, $7a, $00

	INCROM $1fc753, $1fc764

.frame_27
	frame_oam -31,  -1, $66, $20

	INCROM $1fc768, $1fc76d

.frame_28
	frame_oam -25,   1, $66, $20

	INCROM $1fc771, $1fc776

.frame_29
	frame_oam -21,  -1, $66, $20

	INCROM $1fc77a, $1fc77f

.frame_30
	frame_oam -19, -10, $66, $00

	INCROM $1fc783, $1fc788

.frame_31
	frame_oam -16, -11, $66, $00

	INCROM $1fc78c, $1fc791

.frame_32
	frame_oam -16,   5, $6a, $20

	INCROM $1fc795, $1fc7a6

.frame_33
	frame_oam -16, -11, $74, $20

	INCROM $1fc7aa, $1fc7b3

.frame_34
	frame_oam -16,   5, $70, $20

	INCROM $1fc7b7, $1fc7c0

.frame_35
	frame_oam -16,  -3, $7c, $00

	INCROM $1fc7c4, $1fc7d5

.frame_36
	frame_oam -17,   5, $7a, $20

	INCROM $1fc7d9, $1fc7ea

.frame_37
	frame_oam -16,   5, $7a, $20

	INCROM $1fc7ee, $1fc7ff

.frame_38
	frame_oam -31,  -7, $66, $00

	INCROM $1fc803, $1fc808

.frame_39
	frame_oam -25,  -9, $66, $00

	INCROM $1fc80c, $1fc811

.frame_40
	frame_oam -21,  -7, $66, $00

	INCROM $1fc815, $1fc81a

.frame_41
	frame_oam -19,   2, $66, $20

	INCROM $1fc81e, $1fc823

.frame_42
	frame_oam -16,   3, $66, $20

	INCROM $1fc827, $1fc82c

.frame_43
	frame_oam -18, -11, $66, $00

	INCROM $1fc830, $1fc835

.frame_44
	frame_oam -18,   3, $66, $20

	INCROM $1fc839, $1fc83e

.frame_45
	frame_oam -33, -14, $18, $00

	INCROM $1fc842, $1fc857

.frame_46
	frame_oam -33,   6, $18, $20
; 0x1fc85b

	INCROM $1fc85b, $1fc870

Frameset_1fc870: ; 1fc870 (127:4870)
	db $01,  9
	db $02, 15
	db $03, 12
	db $00, 11
	db $ff
; 0x1fc879

Frameset_1fc879: ; 1fc879 (127:4879)
	db $05,  9
	db $06, 15
	db $07, 12
	db $04, 11
	db $ff
; 0x1fc882

Frameset_1fc882: ; 1fc882 (127:4882)
	db $08, 12
	db $09, 12
	db $0a, 12
	db $0b, 12
	db $ff
; 0x1fc88b

Frameset_1fc88b: ; 1fc88b (127:488b)
	db $0c, 12
	db $0d, 12
	db $0e, 12
	db $0f, 12
	db $ff
; 0x1fc894

Frameset_1fc894: ; 1fc894 (127:4894)
	db $00,  1
	db $10,  8
	db $11,  8
	db $12,  8
	db $ff
; 0x1fc89d

Frameset_1fc89d: ; 1fc89d (127:489d)
	db $04,  1
	db $12,  8
	db $11,  8
	db $10,  8
	db $ff
; 0x1fc8a6

Frameset_1fc8a6: ; 1fc8a6 (127:48a6)
	db $00,  6
	db $01,  8
	db $ff
; 0x1fc8ab

Frameset_1fc8ab: ; 1fc8ab (127:48ab)
	db $04,  6
	db $05,  8
	db $ff
; 0x1fc8b0

Frameset_1fc8b0: ; 1fc8b0 (127:48b0)
	db $13,  4
	db $ff
; 0x1fc8b3

Frameset_1fc8b3: ; 1fc8b3 (127:48b3)
	db $14,  4
	db $ff
; 0x1fc8b6

Frameset_1fc8b6: ; 1fc8b6 (127:48b6)
	db $00,  4
	db $ff
; 0x1fc8b9

Frameset_1fc8b9: ; 1fc8b9 (127:48b9)
	db $04,  4
	db $ff
; 0x1fc8bc

Frameset_1fc8bc: ; 1fc8bc (127:48bc)
	db $01,  7
	db $15,  6
	db $17,  2
	db $16,  2
	db $18,  2
	db $19,  1
	db $1a,  2
	db $18,  3
	db $1b,  5
	db $1c,  5
	db $1d,  5
	db $1e,  5
	db $ff
; 0x1fc8d5

Frameset_1fc8d5: ; 1fc8d5 (127:48d5)
	db $05,  7
	db $20,  6
	db $22,  2
	db $21,  2
	db $23,  2
	db $24,  1
	db $25,  2
	db $23,  3
	db $26,  5
	db $27,  5
	db $28,  5
	db $29,  5
	db $ff
; 0x1fc8ee

Frameset_1fc8ee: ; 1fc8ee (127:48ee)
	db $1f,  2
	db $2b,  2
	db $1f,  2
	db $2b,  3
	db $1f,  2
	db $2b,  3
	db $16,  2
	db $17,  4
	db $15,  6
	db $08,  5
	db $09,  5
	db $0a,  5
	db $0b,  5
	db $00, 10
	db $ff
; 0x1fc90b

Frameset_1fc90b: ; 1fc90b (127:490b)
	db $2a,  2
	db $2c,  2
	db $2a,  2
	db $2c,  3
	db $2a,  2
	db $2c,  3
	db $21,  2
	db $21,  4
	db $20,  6
	db $0c,  5
	db $0d,  5
	db $0e,  5
	db $0f,  5
	db $04, 10
	db $ff
; 0x1fc928

Frameset_1fc928: ; 1fc928 (127:4928)
	db $1f,  4
	db $ff
; 0x1fc92b

Frameset_1fc92b: ; 1fc92b (127:492b)
	db $2a,  4
	db $ff
; 0x1fc92e

	INCROM $1fc92e, $1fc948

Frameset_1fc948: ; 1fc948 (127:4948)
	db $01,  6
	db $15,  4
	db $17,  3
	db $16,  4
	db $15,  8
	db $ff
; 0x1fc953

Frameset_1fc953: ; 1fc953 (127:4953)
	db $05,  6
	db $20,  4
	db $22,  3
	db $21,  4
	db $20,  8
	db $ff
; 0x1fc95e

	INCROM $1fc95e, $1fcc5f

Frameset_1fcc5f: ; 1fcc5f (127:4c5f)
	db $04,  1
	db $03,  1
	db $02,  1
	db $01,  2
	db $00,  7
	db $01,  2
	db $ff
; 0x1fcc6c

Frameset_1fcc6c: ; 1fcc6c (127:4c6c)
	db $02,  1
	db $03,  1
	db $04,  1
	db $05,  2
	db $ff
; 0x1fcc75

Frameset_1fcc75: ; 1fcc75 (127:4c75)
	db $06,  1
	db $07,  1
	db $08,  1
	db $09,  2
	db $0a,  7
	db $09,  2
	db $ff
; 0x1fcc82

Frameset_1fcc82: ; 1fcc82 (127:4c82)
	db $10,  4
	db $ff
; 0x1fcc85

Frameset_1fcc85: ; 1fcc85 (127:4c85)
	db $16,  1
	db $17,  1
	db $18,  1
	db $19,  2
	db $1a,  7
	db $19,  2
	db $18,  1
	db $17,  1
	db $16,  1
	db $ff
; 0x1fcc98

Frameset_1fcc98: ; 1fcc98 (127:4c98)
	db $10,  1
	db $15,  4
	db $14,  4
	db $13,  6
	db $11,  4
	db $12,  3
	db $ff
; 0x1fcca5

Frameset_1fcca5: ; 1fcca5 (127:4ca5)
	db $10,  1
	db $0f,  4
	db $0e,  4
	db $0d,  6
	db $0b,  4
	db $0c,  3
	db $ff
; 0x1fccb2

Frameset_1fccb2: ; 1fccb2 (127:4cb2)
	db $0b,  3
	db $0c,  4
	db $0d,  6
	db $0e,  4
	db $0f,  4
	db $10,  1
	db $ff
; 0x1fccbf

Frameset_1fccbf: ; 1fccbf (127:4cbf)
	db $11,  3
	db $12,  4
	db $13,  6
	db $14,  4
	db $15,  4
	db $10,  1
	db $ff
; 0x1fcccc

	INCROM $1fcccc, $1fd40a

Frameset_1fd40a: ; 1fd40a (127:540a)
	db $00,  1
	db $01,  8
	db $02,  8
	db $03,  6
	db $04,  6
	db $05,  4
	db $06,  4
	db $07,  6
	db $08,  7
	db $09, 10
	db $0a, 10
	db $0b,  8
	db $0c,  8
	db $0d,  8
	db $0e,  1
	db $ff
; 0x1fd429

	INCROM $1fd429, $1fd42c

Frameset_1fd42c: ; 1fd42c (127:542c)
	db $0e,  3
	db $0f,  4
	db $ff
; 0x1fd431

	INCROM $1fd431, $1fd434

Frameset_1fd434: ; 1fd434 (127:5434)
	db $10,  3
	db $11,  4
	db $ff
; 0x1fd439

Frameset_1fd439: ; 1fd439 (127:5439)
	db $13,  4
	db $14,  6
	db $08,  7
	db $09, 10
	db $15, 10
	db $0b,  2
	db $16,  1
	db $0b,  2
	db $16,  1
	db $0b,  2
	db $16,  1
	db $17,  6
	db $18,  5
	db $19,  3
	db $02, 12
	db $19, 10
	db $00,  1
	db $ff
; 0x1fd45c

	INCROM $1fd45c, $1fd45f

Frameset_1fd45f: ; 1fd45f (127:545f)
	db $1a,  8
	db $0e,  5
	db $1b,  3
	db $1a,  2
	db $0e,  5
	db $1b,  4
	db $ff
; 0x1fd46c

Frameset_1fd46c: ; 1fd46c (127:546c)
	db $1c,  8
	db $10,  5
	db $1d,  3
	db $1c,  2
	db $10,  5
	db $1d,  4
	db $ff
; 0x1fd479

Frameset_1fd479: ; 1fd479 (127:5479)
	db $00,  1
	db $01,  8
	db $02,  8
	db $03,  6
	db $04,  6
	db $05,  4
	db $06,  4
	db $07,  6
	db $08,  7
	db $09, 10
	db $0a, 10
	db $0b,  8
	db $0c,  8
	db $1e,  8
	db $10,  1
	db $ff
; 0x1fd498

	INCROM $1fd498, $1fd81c

Frameset_1fd81c: ; 1fd81c (127:581c)
	db $00,  6
	db $01,  6
	db $02,  6
	db $03,  6
	db $ff
; 0x1fd825

Frameset_1fd825: ; 1fd825 (127:5825)
	db $07,  6
	db $04,  6
	db $05,  6
	db $06,  6
	db $ff
; 0x1fd82e

Frameset_1fd82e: ; 1fd82e (127:582e)
	db $0b,  6
	db $08,  6
	db $09,  6
	db $0a,  6
	db $ff
; 0x1fd837

	INCROM $1fd837, $1fd83a

Frameset_1fd83a: ; 1fd83a (127:583a)
	db $0c,  2
	db $00,  1
	db $0d,  2
	db $ff
; 0x1fd841

Frameset_1fd841: ; 1fd841 (127:5841)
	db $0d,  2
	db $00,  1
	db $0c,  2
	db $ff
; 0x1fd848

	INCROM $1fd848, $1ffc8e

Frameset_1ffc8e: ; 1ffc8e (127:7c8e)
	db $00,  3
	db $01,  3
	db $02,  2
	db $03,  2
	db $02,  2
	db $03,  2
	db $02,  2
	db $04,  5
	db $05,  4
	db $06,  4
	db $07,  4
	db $08,  3
	db $09,  3
	db $0a,  3
	db $0b, 30
	db $0c,  2
	db $0b,  2
	db $0c,  2
	db $0b,  2
	db $0c,  2
	db $0b,  2
	db $0c,  2
	db $0b,  2
	db $0c,  2
	db $0b,  2
	db $0a,  2
	db $09,  2
	db $08,  2
	db $07,  2
	db $06,  3
	db $05,  4
	db $04,  5
	db $ff
; 0x1ffccf

Frameset_1ffccf: ; 1ffccf (127:7ccf)
	db $0d,  3
	db $0e,  3
	db $0f,  2
	db $10,  2
	db $0f,  2
	db $10,  2
	db $0f,  2
	db $11,  5
	db $12,  4
	db $13,  4
	db $14,  4
	db $15,  3
	db $16,  3
	db $17,  3
	db $18, 30
	db $19,  2
	db $18,  2
	db $19,  2
	db $18,  2
	db $19,  2
	db $18,  2
	db $19,  2
	db $18,  2
	db $19,  2
	db $18,  2
	db $17,  2
	db $16,  2
	db $15,  2
	db $14,  2
	db $13,  3
	db $12,  4
	db $11,  5
	db $ff
; 0x1ffd10

	INCROM $1ffd10, $1ffd13

Frameset_1ffd13: ; 1ffd13 (127:7d13)
	db $00,  4
	db $ff
; 0x1ffd16

	INCROM $1ffd16, $1ffd19

Frameset_1ffd19: ; 1ffd19 (127:7d19)
	db $0d,  4
	db $ff
; 0x1ffd1c

	INCROM $1ffd1c, $200000
