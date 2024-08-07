OAM_d20e::
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

.frame_0
	frame_oam -16,  -8, $c0, 0
	frame_oam -16,   0, $c0, 0
	db $80

.frame_1
	frame_oam -26, -17, $c0, 0
	frame_oam -26,   9, $c0, 0
	db $80

.frame_2
	frame_oam -29, -31, $c0, 0
	frame_oam -29,  23, $c0, 0
	db $80

.frame_3
	frame_oam -16,   0, $c2, 2
	frame_oam -16,  -8, $c2, 2
	db $80

.frame_4
	frame_oam -20, -11, $c2, 2
	frame_oam -20,   3, $c2, 2
	db $80

.frame_5
	frame_oam -28,   5, $c2, 2
	frame_oam -28, -13, $c2, 2
	frame_oam  -8,   4, $c2, 2 | OAMF_YFLIP
	frame_oam  -8, -11, $c2, 2 | OAMF_YFLIP
	db $80

.frame_6
	frame_oam -37, -17, $c2, 2
	frame_oam -37, -17, $c2, 2
	frame_oam -19,  11, $c2, 2
	frame_oam -19, -19, $c2, 2
	frame_oam -37,   9, $c2, 2
	frame_oam -37,   9, $c2, 2
	db $80

.frame_7
	frame_oam -38,  11, $c2, 2
	frame_oam -38, -19, $c2, 2
	frame_oam -38,  11, $c2, 2
	frame_oam -38, -19, $c2, 2
	frame_oam -18,  18, $c2, 2
	frame_oam -18, -26, $c2, 2
	db $80

.frame_8
	frame_oam -18,  18, $c2, 2
	frame_oam -18, -26, $c2, 2
	db $80

.frame_9
	frame_oam -24, -47, $c0, 0
	frame_oam -24,  39, $c0, 0
	db $80

.frame_10
	frame_oam  -8, -56, $c0, 0
	frame_oam  -8,  48, $c0, 0
	db $80

.frame_11
	frame_oam -16,  -4, $c6, 0
	db $80

.frame_12
	frame_oam -16,  -8, $c8, 0
	frame_oam -16,   0, $ca, 0
	frame_oam -32,  -4, $c6, 0
	db $80

.frame_13
	frame_oam -32,  -4, $c6, 0
	frame_oam -48,  -4, $c4, 0
	db $80

.frame_14
	frame_oam -40,  -4, $c4, 0
	db $80

.frame_15
	frame_oam -34,  -4, $c4, 0
	db $80

.frame_16
	frame_oam -16,  -4, $d2, 2 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -16,  -4, $ce, 2
	db $80

.frame_18
	frame_oam -16,  -4, $d0, 2
	db $80

.frame_19
	frame_oam -16,  -4, $d2, 2
	db $80

.frame_20
	frame_oam -48,  12, $d4, 2
	db $80

.frame_21
	frame_oam -48,  12, $d6, 2
	db $80

.frame_22
	frame_oam -48,  12, $d4, 2 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_23
	frame_oam -32,  12, $d4, 2
	db $80

.frame_24
	frame_oam -32,  12, $d6, 2
	db $80

.frame_25
	frame_oam -32,  12, $d4, 2 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_26
	frame_oam -48, -20, $d4, 2 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -48, -20, $d6, 2 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam -48, -20, $d4, 2 | OAMF_YFLIP
	db $80

.frame_29
	frame_oam -32, -20, $d4, 2 | OAMF_XFLIP
	db $80

.frame_30
	frame_oam -32, -20, $d6, 2 | OAMF_XFLIP
	db $80

.frame_31
	frame_oam -32, -20, $d4, 2 | OAMF_YFLIP
	db $80

.frame_32
	frame_oam -12,  -4, $d8, 0 | OAMF_YFLIP
	db $80

.frame_33
	frame_oam -16,  -8, $d8, 0
	frame_oam -16,   0, $da, 0
	db $80

.frame_34
	frame_oam -28,  -4, $da, 0 | OAMF_XFLIP
	frame_oam -12,  -8, $dc, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_35
	frame_oam -36,  -4, $dc, 0
	db $80

.frame_36
	frame_oam -32,  -4, $c6, 0
	frame_oam -48,  -4, $c4, 0
	frame_oam -12,  -4, $d8, 0 | OAMF_YFLIP
	db $80

.frame_37
	frame_oam -40,  -4, $c4, 0
	frame_oam -16,  -8, $d8, 0
	frame_oam -16,   0, $da, 0
	db $80

.frame_38
	frame_oam -34,  -4, $c4, 0
	frame_oam -12,  -8, $dc, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -18,   0, $da, 0
	db $80

.frame_39
	frame_oam -16,  -4, $fe, 0
	db $80

.frame_40
	frame_oam -24,  -4, $fe, 0 | OAMF_XFLIP
	db $80

.frame_41
	frame_oam -29,  -5, $fe, 0
	db $80

.frame_42
	frame_oam -35,  -8, $fe, 0 | OAMF_XFLIP
	db $80

.frame_43
	frame_oam -16,  -4, $fe, 0 | OAMF_XFLIP
	db $80

.frame_44
	frame_oam -24,  -4, $fe, 0
	db $80

.frame_45
	frame_oam -29,  -3, $fe, 0 | OAMF_XFLIP
	db $80

.frame_46
	frame_oam -35,   0, $fe, 0
	db $80

.frame_47
	frame_oam -16, -12, $b6, 0
	frame_oam -16,   4, $b6, 0 | OAMF_XFLIP
	frame_oam -24,  -4, $b8, 0
	frame_oam  -8,  -4, $b8, 0 | OAMF_YFLIP
	db $80

.frame_48
	frame_oam -24,  -4, $bc, 0
	frame_oam  -8,  -4, $bc, 0 | OAMF_YFLIP
	frame_oam -16, -12, $ba, 0
	frame_oam -16,   4, $ba, 0 | OAMF_XFLIP
	db $80

.frame_49
	frame_oam -16,  -8, $90, 0
	frame_oam -16,   0, $92, 0
	db $80

.frame_50
	frame_oam -16,  -8, $94, 0
	frame_oam -16,   0, $96, 0
	db $80

.frame_51
	frame_oam -16,  -8, $98, 0
	frame_oam -16,   0, $9a, 0
	db $80

.frame_52
	frame_oam -16,  -8, $9c, 0
	frame_oam -16,   0, $9e, 0
	db $80

.frame_53
	frame_oam   1,  -3, $de, 2 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -15,  -8, $de, 2
	frame_oam -15,   0, $de, 2 | OAMF_XFLIP
	db $80

.frame_54
	frame_oam   2,   0, $de, 2 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -12, -10, $de, 2
	frame_oam -17,  -1, $de, 2 | OAMF_XFLIP
	db $80

.frame_55
	frame_oam -19,  -7, $de, 2 | OAMF_XFLIP
	frame_oam   0,   5, $de, 2 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   6,  -3, $de, 2 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0, -12, $de, 2 | OAMF_YFLIP
	frame_oam -19,   3, $de, 2 | OAMF_XFLIP
	db $80

.frame_56
	frame_oam -11,  -3, $c2, 2
	db $80

.frame_57
	frame_oam -14,   1, $c2, 2
	frame_oam -15,  -8, $c2, 2 | OAMF_XFLIP
	frame_oam   2,  -5, $c2, 2 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_58
	frame_oam -18,  -2, $c2, 2
	frame_oam -10, -11, $c2, 2 | OAMF_XFLIP
	frame_oam   1,   1, $c2, 2 | OAMF_YFLIP
	db $80

.frame_59
	frame_oam   2,   5, $c2, 2 | OAMF_YFLIP
	frame_oam -21,  -5, $c2, 2 | OAMF_XFLIP
	frame_oam   6,  -6, $c2, 2 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -17,   5, $c2, 2
	frame_oam -11, -13, $c2, 2 | OAMF_XFLIP
	db $80

Frameset_d49a::
	db $00,  2
	db $01,  3
	db $02,  3
	db $09,  2
	db $0a,  2
	db $ff

Frameset_d4a5::
	db $35,  2
	db $36,  1
	db $37,  2
	db $38,  3
	db $39,  2
	db $3a,  2
	db $38,  3
	db $39,  2
	db $3a,  2
	db $3b,  2
	db $ff

Frameset_d4ba:
	db $0b,  4
	db $0c,  4
	db $0d,  6
	db $0e,  6
	db $0f,  4
	db $ff

Frameset_d4c5:
	db $10,  2
	db $11,  3
	db $12,  6
	db $13,  3
	db $ff

; unreferenced
Frameset_d4ce:
	db $14,  3
	db $15,  3
	db $16,  3
	db $ff

; unreferenced
Frameset_d4d5:
	db $17,  3
	db $18,  3
	db $19,  3
	db $ff

; unreferenced
Frameset_d4dc:
	db $1a,  3
	db $1b,  3
	db $1c,  3
	db $ff

; unreferenced
Frameset_d4e3:
	db $1d,  3
	db $1e,  3
	db $1f,  3
	db $ff

Frameset_d4ea:
	db $20,  9
	db $21,  8
	db $22,  7
	db $23,  7
	db $ff

Frameset_d4f3:
	db $0b,  4
	db $0c,  4
	db $24,  6
	db $25,  6
	db $26,  4
	db $22,  4
	db $23,  7
	db $ff

Frameset_d502:
	db $27,  6
	db $28,  6
	db $29,  6
	db $2a,  6
	db $ff

Frameset_d50b:
	db $2b,  6
	db $2c,  6
	db $2d,  6
	db $2e,  6
	db $ff

; unreferenced
Frameset_d514:
	db $2f,  3
	db $30,  3
	db $ff

; unreferenced
Frameset_d519:
	db $31,  4
	db $ff

; unreferenced
Frameset_d51c:
	db $32,  4
	db $ff

; unreferenced
Frameset_d51f:
	db $33,  4
	db $ff

; unreferenced
Frameset_d522:
	db $34,  4
	db $ff

Frameset_d525:
	db $03,  1
	db $04,  1
	db $05,  2
	db $06,  2
	db $07,  1
	db $08,  1
	db $ff

OAM_d532:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8

.frame_0
	frame_oam   0,   0, $60, 1 | OAMF_XFLIP
	frame_oam   0,  -8, $60, 1
	db $80

.frame_1
	frame_oam   0,   0, $62, 1 | OAMF_XFLIP
	frame_oam   0,  -8, $62, 1
	db $80

.frame_2
	frame_oam   0,  -8, $64, 1
	frame_oam   0,   0, $64, 1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam   0,  -8, $66, 1
	frame_oam   0,   0, $66, 1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam   8,   0, $6c, 1 | OAMF_XFLIP
	frame_oam   8,  -8, $6c, 1
	db $80

.frame_5
	frame_oam   8,   0, $6a, 1 | OAMF_XFLIP
	frame_oam   8,  -8, $6a, 1
	db $80

.frame_6
	frame_oam   8,   0, $6e, 1 | OAMF_XFLIP
	frame_oam   8,  -8, $6e, 1
	db $80

.frame_7
	frame_oam   8,   0, $68, 1 | OAMF_XFLIP
	frame_oam   8,  -8, $68, 1
	db $80

.frame_8
	frame_oam -16,   0, $70, 1
	db $80

Frameset_d591:
	db $00,  2
	db $01,  2
	db $02,  1
	db $03,  1
	db $04,  1
	db $05,  1
	db $04,  2
	db $06,  1
	db $08,  1
	db $07,  2
	db $08,  1
	db $07,  1
	db $08,  1
	db $07,  1
	db $ff

OAM_d5ae:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3

.frame_0
	frame_oam -32,   0, $9e, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -33,  -9, $a0, 6 | OAMF_BANK1
	frame_oam -16,  -8, $9e, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -15,   1, $a0, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_1
	frame_oam -32, -12, $a2, 6 | OAMF_BANK1
	frame_oam -32,  -4, $a4, 6 | OAMF_BANK1
	frame_oam -16, -12, $a2, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -4, $a4, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32,   4, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_2
	frame_oam -33, -18, $a6, 6 | OAMF_BANK1
	frame_oam -43,  -9, $a8, 6 | OAMF_BANK1
	frame_oam -15, -18, $a6, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -5,  -9, $a8, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -33,  10, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43,   1, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  10, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -5,   1, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_3
	frame_oam -36, -24, $aa, 6 | OAMF_BANK1
	frame_oam -48, -12, $ac, 6 | OAMF_BANK1
	frame_oam -12,  16, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0,   4, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -36,  16, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,   4, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12, -24, $aa, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0, -12, $ac, 6 | OAMF_BANK1 | OAMF_YFLIP
	db $80

Frameset_d622:
	db $00,  2
	db $01,  3
	db $02,  5
	db $03,  3
	db $ff

OAM_d62b:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6

.frame_0
	frame_oam -54,  -2, $b4, 0
	frame_oam -50, -20, $b2, 0
	frame_oam -35, -32, $b2, 0
	frame_oam -17, -29, $b2, 0
	frame_oam  -6,   7, $b2, 0
	frame_oam -20,  16, $b2, 0
	frame_oam -43,  12, $b2, 0
	frame_oam -11, -15, $b4, 0
	db $80

.frame_1
	frame_oam -16,  -8, $be, 2
	db $80

.frame_2
	frame_oam -49, -35, $b2, 0
	frame_oam -21, -32, $b2, 0 | OAMF_YFLIP
	frame_oam -63,   4, $b2, 0 | OAMF_XFLIP
	frame_oam -55,  22, $b2, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -22,  26, $b2, 0 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -54,  -6, $b4, 0 | OAMF_XFLIP
	frame_oam -50,  12, $b2, 0 | OAMF_XFLIP
	frame_oam -35,  24, $b2, 0 | OAMF_XFLIP
	frame_oam -17,  21, $b2, 0 | OAMF_XFLIP
	frame_oam  -6, -15, $b2, 0 | OAMF_XFLIP
	frame_oam -20, -24, $b2, 0 | OAMF_XFLIP
	frame_oam -43, -20, $b2, 0 | OAMF_XFLIP
	frame_oam -11,   7, $b4, 0 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -49,  27, $b2, 0 | OAMF_XFLIP
	frame_oam -21,  24, $b2, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -63, -12, $b2, 0
	frame_oam -55, -30, $b2, 0 | OAMF_YFLIP
	frame_oam -22, -34, $b2, 0
	db $80

.frame_5
	frame_oam -46, -40, $b2, 0 | OAMF_XFLIP
	frame_oam -17, -40, $b2, 0 | OAMF_YFLIP
	frame_oam -18,  32, $b2, 0 | OAMF_XFLIP
	frame_oam -56,  16, $b2, 0
	frame_oam  -7,  18, $b2, 0 | OAMF_XFLIP
	frame_oam -23, -51, $b2, 0
	frame_oam -41,  28, $b2, 0 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -46,  32, $b2, 0
	frame_oam -17,  32, $b2, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -18, -40, $b2, 0
	frame_oam -56, -24, $b2, 0 | OAMF_XFLIP
	frame_oam  -7, -26, $b2, 0
	frame_oam -23,  43, $b2, 0 | OAMF_XFLIP
	frame_oam -41, -36, $b2, 0
	db $80

Frameset_d6e4:
	db $00,  2
	db $01,  2
	db $02,  2
	db $01,  2
	db $02,  2
	db $01,  1
	db $02,  1
	db $01,  2
	db $05,  2
	db $01,  2
	db $05,  1
	db $01,  8
	db $ff

Frameset_d6fd:
	db $03,  2
	db $01,  2
	db $04,  2
	db $01,  2
	db $04,  2
	db $01,  1
	db $04,  1
	db $01,  2
	db $06,  2
	db $01,  2
	db $06,  1
	db $01,  8
	db $ff

OAM_d716:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3

.frame_0
	frame_oam -29,   4, $58, 0
	frame_oam -32,  12, $5a, 0
	frame_oam -40,   8, $4a, 2
	frame_oam -40,  16, $4a, 2 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -29,   4, $58, 0
	frame_oam -32,  12, $5a, 0
	frame_oam -39,   8, $0c, 2
	frame_oam -39,  16, $0c, 2 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -29,   4, $58, 0
	frame_oam -32,  12, $5a, 0
	frame_oam -39,  16, $2c, 2
	frame_oam -39,   8, $2c, 2 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -29,   4, $58, 0
	frame_oam -32,  12, $5a, 0
	db $80

Frameset_d75a:
	db $00,  1
	db $01,  1
	db $02,  1
	db $03,  1
	db $ff

OAM_d763::
	dw .frame_0
	dw .frame_1
	dw .frame_2

.frame_0
	frame_oam -26,  -8, $10, 4 | OAMF_BANK1
	frame_oam -26,   0, $12, 4 | OAMF_BANK1
	frame_oam -10,  -8, $18, 0 | OAMF_BANK1
	frame_oam -10,   0, $18, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -16, $22, 4 | OAMF_BANK1
	frame_oam -18,   8, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -26,   0, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26,  -8, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  -8, $18, 0 | OAMF_BANK1
	frame_oam -10,   0, $18, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,   8, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18, -16, $1e, 4 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -25,  -8, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -9,  -8, $18, 0 | OAMF_BANK1
	frame_oam  -9,   0, $18, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18, -16, $20, 4 | OAMF_BANK1
	frame_oam -18,   8, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -25,   0, $12, 4 | OAMF_BANK1
	db $80

Frameset_d7b4::
	db $00,  2
	db $02,  2
	db $01,  2
	db $02,  2
	db $ff

OAM_d7bd:
	dw .frame_0
	dw .frame_1
	dw .frame_2

.frame_0
	frame_oam -54, -25, $b4, 2 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -14, -23, $b2, 2 | OAMF_YFLIP
	frame_oam -17, -41, $b2, 2 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  13, $b2, 2 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -33,  29, $b2, 2
	frame_oam -60,   0, $b2, 2 | OAMF_YFLIP
	frame_oam -65, -18, $b2, 2 | OAMF_XFLIP
	frame_oam -50, -40, $b2, 2
	db $80

.frame_1
	frame_oam -57, -29, $b2, 2
	frame_oam -10, -28, $b2, 2 | OAMF_YFLIP
	frame_oam -11,  24, $b2, 2
	frame_oam -44,  27, $b2, 2
	db $80

.frame_2
	frame_oam  -8,  33, $b2, 2
	frame_oam  -8, -40, $b2, 2 | OAMF_YFLIP
	frame_oam -51, -39, $b2, 2
	frame_oam -37,  34, $b2, 2
	db $80

Frameset_d806:
	db $00,  4
	db $01,  4
	db $02,  4
	db $ff

OAM_d80d:
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

.frame_0
	frame_oam -40,  -8, $40, 1
	frame_oam -24, -16, $44, 1
	db $80

.frame_1
	frame_oam -40,  -8, $42, 1
	frame_oam -24, -16, $46, 1
	db $80

.frame_2
	frame_oam -40,  -8, $44, 1
	frame_oam -18,   8, $40, 1
	db $80

.frame_3
	frame_oam -40,  -8, $46, 1
	frame_oam -18,   8, $42, 1
	db $80

.frame_4
	frame_oam -18,   8, $44, 1
	frame_oam -24, -16, $40, 1
	db $80

.frame_5
	frame_oam -18,   8, $46, 1
	frame_oam -24, -16, $42, 1
	db $80

.frame_6
	frame_oam  -8,   0, $40, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -24,   8, $44, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_7
	frame_oam  -8,   0, $42, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -24,   8, $46, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_8
	frame_oam  -8,   0, $44, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -30, -16, $40, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_9
	frame_oam  -8,   0, $46, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -30, -16, $42, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_10
	frame_oam -30, -16, $44, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -24,   8, $40, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_11
	frame_oam -30, -16, $46, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -24,   8, $42, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_12
	frame_oam -24,  -8, $48, 1
	frame_oam -24,   0, $48, 1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -24,   3, $4e, 1
	frame_oam -24, -11, $4e, 1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -37,   8, $4a, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -37, -16, $4a, 1 | OAMF_XFLIP
	frame_oam -12,   8, $4a, 1 | OAMF_YFLIP
	frame_oam -12, -16, $4a, 1
	db $80

.frame_15
	frame_oam -37, -16, $4a, 1 | OAMF_YFLIP
	frame_oam -37,   8, $4a, 1
	frame_oam -12, -16, $4a, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -12,   8, $4a, 1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam  -5,  14, $4c, 1
	frame_oam  -5, -22, $4c, 1 | OAMF_XFLIP
	frame_oam -43,  14, $4c, 1 | OAMF_YFLIP
	frame_oam -43, -22, $4c, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_17
	frame_oam -32,  -4, $50, 1
	db $80
