OAM_188000::
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

.frame_0
	frame_oam -15, -11, $e0, 7 | OAMF_BANK1
	frame_oam -15,  -3, $e2, 7 | OAMF_BANK1
	frame_oam -15,   5, $e4, 7 | OAMF_BANK1
	frame_oam -31,  -9, $c0, 7 | OAMF_BANK1
	frame_oam -31,  -1, $c2, 7 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16, -11, $e6, 7 | OAMF_BANK1
	frame_oam -16,  -3, $e8, 7 | OAMF_BANK1
	frame_oam -16,   5, $ea, 7 | OAMF_BANK1
	frame_oam -32,  -9, $c0, 7 | OAMF_BANK1
	frame_oam -32,  -1, $c2, 7 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -32,  -9, $c0, 7 | OAMF_BANK1
	frame_oam -32,  -1, $c2, 7 | OAMF_BANK1
	frame_oam -16, -11, $ec, 7 | OAMF_BANK1
	frame_oam -16,  -3, $ee, 7 | OAMF_BANK1
	frame_oam -16,   5, $f0, 7 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -15,   3, $e0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -5, $e2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -13, $e4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,   1, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -7, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -16,   3, $e6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -5, $e8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -13, $ea, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   1, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -7, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -32,   1, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -7, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   3, $ec, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -5, $ee, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -13, $f0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -15, -11, $e0, 7 | OAMF_BANK1
	frame_oam -15,  -3, $ca, 7 | OAMF_BANK1
	frame_oam -15,   5, $cc, 7 | OAMF_BANK1
	frame_oam -31,  -9, $da, 7 | OAMF_BANK1
	frame_oam -31,  -1, $c6, 7 | OAMF_BANK1
	frame_oam -31,   7, $c8, 7 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -15,   3, $e0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -5, $ca, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -13, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,   1, $da, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -7, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31, -15, $c8, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -15, -11, $e0, 7 | OAMF_BANK1
	frame_oam -15,  -3, $ca, 7 | OAMF_BANK1
	frame_oam -15,   5, $cc, 7 | OAMF_BANK1
	frame_oam -31,  -1, $c6, 7 | OAMF_BANK1
	frame_oam -31,   7, $c8, 7 | OAMF_BANK1
	frame_oam -31,  -9, $c4, 7 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -15,  -3, $e2, 7 | OAMF_BANK1
	frame_oam -15,   5, $e4, 7 | OAMF_BANK1
	frame_oam -31,  -9, $ce, 7 | OAMF_BANK1
	frame_oam -31,  -1, $d0, 7 | OAMF_BANK1
	frame_oam -15, -11, $e0, 7 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -15,   3, $e0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -5, $ca, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -13, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -7, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31, -15, $c8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,   1, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -15,   3, $e0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -5, $e2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -13, $e4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,   1, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -7, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -30, -12, $d2, 7 | OAMF_BANK1
	frame_oam -30,  -4, $d4, 7 | OAMF_BANK1
	frame_oam -14, -12, $f2, 7 | OAMF_BANK1
	frame_oam -30,   3, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,   3, $f2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,  -4, $f4, 7 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -30, -12, $d6, 7 | OAMF_BANK1
	frame_oam -30,  -4, $d8, 7 | OAMF_BANK1
	frame_oam -14, -12, $f6, 7 | OAMF_BANK1
	frame_oam -30,   3, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,   3, $f6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,  -4, $f4, 7 | OAMF_BANK1
	db $80

.frame_14
	frame_oam -30,   3, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30,  -5, $d8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,   3, $f6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30, -12, $d6, 7 | OAMF_BANK1
	frame_oam -14, -12, $f6, 7 | OAMF_BANK1
	frame_oam -14,  -4, $f4, 7 | OAMF_BANK1
	db $80

.frame_15
	frame_oam -15,  -3, $e2, 7 | OAMF_BANK1
	frame_oam -15,   5, $e4, 7 | OAMF_BANK1
	frame_oam -31,  -9, $c0, 7 | OAMF_BANK1
	frame_oam -31,  -1, $c2, 7 | OAMF_BANK1
	frame_oam -15, -11, $f8, 7 | OAMF_BANK1
	db $80

.frame_16
	frame_oam -15,  -5, $e2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -13, $e4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,   1, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -7, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   3, $f8, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -15,  -3, $e2, 7 | OAMF_BANK1
	frame_oam -15,   5, $e4, 7 | OAMF_BANK1
	frame_oam -31,  -9, $ce, 7 | OAMF_BANK1
	frame_oam -31,  -1, $d0, 7 | OAMF_BANK1
	frame_oam -15, -11, $f8, 7 | OAMF_BANK1
	db $80

.frame_18
	frame_oam -15,  -5, $e2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -13, $e4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,   1, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -7, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   3, $f8, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam  -9, -12, $d6, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -9,  -4, $d8, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -25, -12, $f6, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -9,   3, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -25,   3, $f6, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -25,  -4, $f4, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_20
	frame_oam  -9,   3, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -9,  -5, $d8, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -25,   3, $f6, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -9, -12, $d6, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -25, -12, $f6, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -25,  -5, $f4, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_21
	frame_oam -16,  -8, $dc, 7 | OAMF_BANK1
	frame_oam -16,  -1, $dc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -16,  -8, $de, 7 | OAMF_BANK1
	frame_oam -16,  -1, $de, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -24,  -8, $fe, 7 | OAMF_BANK1
	frame_oam -24,  -1, $fe, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -8, $fe, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -8,  -1, $fe, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_24
	frame_oam -26,  -8, $fe, 7 | OAMF_BANK1
	frame_oam -26,  -1, $fe, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -6,  -8, $fe, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -6,  -1, $fe, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_25
	frame_oam -16, -12, $fa, 7 | OAMF_BANK1
	frame_oam -16,  -4, $fc, 7 | OAMF_BANK1
	frame_oam -16,   3, $fa, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $d2, 7 | OAMF_BANK1
	frame_oam -32,  -4, $d4, 7 | OAMF_BANK1
	frame_oam -32,   3, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -29, -12, $d2, 7 | OAMF_BANK1
	frame_oam -29,  -4, $d4, 7 | OAMF_BANK1
	frame_oam -29,   3, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -12, $f6, 7 | OAMF_BANK1
	frame_oam -13,   3, $f6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -4, $f4, 7 | OAMF_BANK1
	db $80

OAM_188279::
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

.frame_0
	frame_oam -16, -16, $80, 6 | OAMF_BANK1
	frame_oam -16,  -8, $82, 6 | OAMF_BANK1
	frame_oam -16,   8, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -16, -16, $84, 6 | OAMF_BANK1
	frame_oam -16,  -8, $86, 6 | OAMF_BANK1
	frame_oam -16,   0, $88, 6 | OAMF_BANK1
	frame_oam -16,   8, $8a, 6 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,   8, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $88, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $8a, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -17, -16, $8c, 6 | OAMF_BANK1
	frame_oam -17,   8, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,  -8, $8e, 6 | OAMF_BANK1
	frame_oam -17,   0, $8e, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -20, -16, $a0, 6 | OAMF_BANK1
	frame_oam -20,  -8, $a2, 6 | OAMF_BANK1
	frame_oam -20,   8, $a0, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,   0, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -20, -16, $90, 6 | OAMF_BANK1
	frame_oam -20,  -8, $92, 6 | OAMF_BANK1
	frame_oam -20,   8, $90, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,   0, $92, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -20, -16, $98, 6 | OAMF_BANK1
	frame_oam -20,  -8, $9a, 6 | OAMF_BANK1
	frame_oam -20,   0, $9c, 6 | OAMF_BANK1
	frame_oam -20,   8, $9e, 6 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -20, -16, $94, 6 | OAMF_BANK1
	frame_oam -20,  -8, $96, 6 | OAMF_BANK1
	frame_oam -20,   8, $94, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,   0, $96, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -20,   8, $98, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,   0, $9a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,  -8, $9c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -16, $9e, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -20, -16, $a0, 6 | OAMF_BANK1
	frame_oam -20,  -8, $a2, 6 | OAMF_BANK1
	frame_oam -20,   8, $90, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,   0, $92, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -20, -16, $a4, 6 | OAMF_BANK1
	frame_oam -20,  -8, $a6, 6 | OAMF_BANK1
	frame_oam -20,   8, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,   0, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_18834a::
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4

.frame_0
	frame_oam  -8,  -4, $88, 6 | OAMF_BANK1
	frame_oam -24,  -8, $8c, 6 | OAMF_BANK1
	frame_oam -24,   0, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -24,  -8, $80, 6 | OAMF_BANK1
	frame_oam -24,   0, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -4, $8a, 6 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -24,  -8, $82, 6 | OAMF_BANK1
	frame_oam -24,   0, $84, 6 | OAMF_BANK1
	frame_oam  -8,  -4, $8a, 6 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -24,  -8, $86, 6 | OAMF_BANK1
	frame_oam -24,   0, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -4, $8a, 6 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -24,   0, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -8, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -4, $8a, 6 | OAMF_BANK1
	db $80

OAM_188395::
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
	frame_oam -17, -14, $00, 4 | OAMF_BANK1
	frame_oam -17,  -6, $02, 4 | OAMF_BANK1
	frame_oam -17,   2, $04, 4 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -15,   2, $04, 4 | OAMF_BANK1
	frame_oam -15, -14, $06, 4 | OAMF_BANK1
	frame_oam -15,  -6, $08, 4 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -17,   6, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,  -2, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17, -10, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -15, -10, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   6, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -2, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -17,   2, $04, 4 | OAMF_BANK1
	frame_oam -17, -14, $0a, 4 | OAMF_BANK1
	frame_oam -17,  -6, $0c, 4 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -17, -10, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,   6, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,  -2, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -13,  -8, $1a, 4 | OAMF_BANK1
	frame_oam -13,   0, $1c, 4 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -13,   0, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -13,  -8, $1a, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -13,   0, $1c, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_9
	frame_oam -13,   0, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -13,  -8, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_10
	frame_oam -16,   0, $34, 4 | OAMF_BANK1
	frame_oam -16,  -8, $34, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_11
	frame_oam  -7,   1, $1e, 4 | OAMF_BANK1
	frame_oam  -7,  -9, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -25,   1, $1e, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -25,  -9, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_12
	frame_oam  -4,   4, $36, 4 | OAMF_BANK1
	frame_oam -28, -12, $36, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -28,   4, $36, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -4, -12, $36, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam  -2, -10, $12, 4 | OAMF_BANK1
	frame_oam  -2,  -2, $14, 4 | OAMF_BANK1
	frame_oam  -2,   6, $16, 4 | OAMF_BANK1
	db $80

.frame_14
	frame_oam  -1, -10, $12, 4 | OAMF_BANK1
	frame_oam  -1,  -2, $14, 4 | OAMF_BANK1
	frame_oam  -1,   6, $18, 4 | OAMF_BANK1
	db $80

.frame_15
	frame_oam  -2,   2, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2,  -6, $14, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2, -14, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam  -1,   2, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -1,  -6, $14, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -1, -14, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam  -2,  -8, $38, 4 | OAMF_BANK1
	frame_oam  -2,  -1, $38, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam  -7, -14, $28, 4 | OAMF_BANK1
	frame_oam  -7,  -6, $2a, 4 | OAMF_BANK1
	frame_oam  -7,   2, $2c, 4 | OAMF_BANK1
	db $80

.frame_19
	frame_oam -10, -11, $2e, 4 | OAMF_BANK1
	frame_oam -10,  -3, $30, 4 | OAMF_BANK1
	frame_oam -10,   5, $32, 4 | OAMF_BANK1
	db $80

.frame_20
	frame_oam  -8,   6, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -2, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8, -10, $2c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -10,   3, $2e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  -5, $30, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10, -13, $32, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -16,   2, $04, 4 | OAMF_BANK1
	frame_oam -16, -14, $20, 4 | OAMF_BANK1
	frame_oam -16,  -6, $22, 4 | OAMF_BANK1
	db $80

.frame_23
	frame_oam -16,   2, $04, 4 | OAMF_BANK1
	frame_oam -16, -14, $24, 4 | OAMF_BANK1
	frame_oam -16,  -6, $26, 4 | OAMF_BANK1
	db $80

.frame_24
	frame_oam -16, -10, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   6, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -2, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -16, -10, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   6, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -2, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -13,  -6, $0e, 4 | OAMF_BANK1
	frame_oam -13,   2, $10, 4 | OAMF_BANK1
	db $80

.frame_27
	frame_oam -13,  -2, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -10, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam  -4, -12, $12, 4 | OAMF_BANK1
	frame_oam  -4,  -4, $14, 4 | OAMF_BANK1
	frame_oam  -4,   4, $18, 4 | OAMF_BANK1
	db $80

.frame_29
	frame_oam  -4,   4, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -4,  -4, $14, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -4, -12, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_30
	frame_oam  -2,  -7, $3a, 4 | OAMF_BANK1
	frame_oam  -2,   1, $3c, 4 | OAMF_BANK1
	db $80

.frame_31
	frame_oam  -2,  -1, $3a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2,  -9, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_188555::
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

.frame_0
	frame_oam -32, -16, $00, 5 | OAMF_BANK1
	frame_oam -32,  -8, $02, 5 | OAMF_BANK1
	frame_oam -32,   0, $04, 4 | OAMF_BANK1
	frame_oam -32,   8, $06, 4 | OAMF_BANK1
	frame_oam -16, -16, $20, 4 | OAMF_BANK1
	frame_oam -16,  -8, $22, 4 | OAMF_BANK1
	frame_oam -16,   0, $24, 4 | OAMF_BANK1
	frame_oam -16,   8, $26, 4 | OAMF_BANK1
	frame_oam -16,  16, $28, 5 | OAMF_BANK1
	frame_oam -48, -19, $08, 4 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -48, -26, $0a, 4 | OAMF_BANK1
	frame_oam -48, -23, $0c, 4 | OAMF_BANK1
	frame_oam -48, -11, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48, -15, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $00, 5 | OAMF_BANK1
	frame_oam -32,  -8, $02, 5 | OAMF_BANK1
	frame_oam -32,   0, $04, 4 | OAMF_BANK1
	frame_oam -32,   8, $06, 4 | OAMF_BANK1
	frame_oam -16, -16, $40, 4 | OAMF_BANK1
	frame_oam -16,  -8, $42, 4 | OAMF_BANK1
	frame_oam -16,   0, $44, 4 | OAMF_BANK1
	frame_oam -16,   8, $46, 4 | OAMF_BANK1
	frame_oam -16,  16, $48, 5 | OAMF_BANK1
	frame_oam -48, -19, $08, 4 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -47, -31, $0a, 4 | OAMF_BANK1
	frame_oam -47, -23, $0c, 4 | OAMF_BANK1
	frame_oam -47,  -7, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -47, -15, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -16, $60, 4 | OAMF_BANK1
	frame_oam -15,  -8, $62, 4 | OAMF_BANK1
	frame_oam -15,   0, $64, 4 | OAMF_BANK1
	frame_oam -15,   8, $66, 4 | OAMF_BANK1
	frame_oam -15,  16, $68, 5 | OAMF_BANK1
	frame_oam -31, -16, $00, 5 | OAMF_BANK1
	frame_oam -31,  -8, $12, 5 | OAMF_BANK1
	frame_oam -31,   0, $14, 4 | OAMF_BANK1
	frame_oam -31,   8, $16, 4 | OAMF_BANK1
	frame_oam -47, -19, $08, 4 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16, -16, $40, 4 | OAMF_BANK1
	frame_oam -32,   8, $1a, 4 | OAMF_BANK1
	frame_oam -32,  16, $1c, 4 | OAMF_BANK1
	frame_oam -32,  24, $1e, 4 | OAMF_BANK1
	frame_oam -16,  -8, $36, 4 | OAMF_BANK1
	frame_oam -16,   0, $38, 4 | OAMF_BANK1
	frame_oam -16,   8, $3a, 4 | OAMF_BANK1
	frame_oam -32,   0, $18, 4 | OAMF_BANK1
	frame_oam -32, -16, $00, 5 | OAMF_BANK1
	frame_oam -32,  -8, $02, 5 | OAMF_BANK1
	frame_oam -16,  16, $48, 5 | OAMF_BANK1
	frame_oam -48, -26, $0a, 4 | OAMF_BANK1
	frame_oam -48, -23, $0c, 4 | OAMF_BANK1
	frame_oam -48, -12, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48, -15, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48, -19, $08, 4 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -47, -31, $0a, 4 | OAMF_BANK1
	frame_oam -47, -23, $0c, 4 | OAMF_BANK1
	frame_oam -47,  -7, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -47, -15, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -16, $60, 4 | OAMF_BANK1
	frame_oam -15,   0, $2e, 4 | OAMF_BANK1
	frame_oam -15,   8, $30, 4 | OAMF_BANK1
	frame_oam -15,  16, $32, 4 | OAMF_BANK1
	frame_oam -15,  24, $34, 4 | OAMF_BANK1
	frame_oam -31,   0, $0e, 4 | OAMF_BANK1
	frame_oam -31,   8, $10, 4 | OAMF_BANK1
	frame_oam -31, -16, $00, 5 | OAMF_BANK1
	frame_oam -31,  -8, $02, 5 | OAMF_BANK1
	frame_oam -47, -19, $08, 4 | OAMF_BANK1
	frame_oam -15,  -8, $2c, 4 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16, -16, $40, 4 | OAMF_BANK1
	frame_oam -16,   8, $46, 4 | OAMF_BANK1
	frame_oam -16,  16, $48, 5 | OAMF_BANK1
	frame_oam -32,   0, $2a, 4 | OAMF_BANK1
	frame_oam -32, -16, $00, 5 | OAMF_BANK1
	frame_oam -32,  -8, $12, 5 | OAMF_BANK1
	frame_oam -16,   0, $64, 4 | OAMF_BANK1
	frame_oam -32,   8, $4c, 4 | OAMF_BANK1
	frame_oam -32,  16, $4e, 4 | OAMF_BANK1
	frame_oam -16,  -8, $4a, 4 | OAMF_BANK1
	frame_oam -48, -27, $0a, 4 | OAMF_BANK1
	frame_oam -48, -23, $0c, 4 | OAMF_BANK1
	frame_oam -48, -12, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48, -15, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48, -19, $08, 4 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -47, -31, $0a, 4 | OAMF_BANK1
	frame_oam -47, -23, $0c, 4 | OAMF_BANK1
	frame_oam -47,  -7, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -47, -15, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -16, $60, 4 | OAMF_BANK1
	frame_oam -15,  -8, $62, 4 | OAMF_BANK1
	frame_oam -15,   0, $64, 4 | OAMF_BANK1
	frame_oam -15,   8, $6a, 4 | OAMF_BANK1
	frame_oam -15,  16, $68, 5 | OAMF_BANK1
	frame_oam -15,  16, $6c, 4 | OAMF_BANK1
	frame_oam -15,  24, $6e, 4 | OAMF_BANK1
	frame_oam -31,  -8, $12, 5 | OAMF_BANK1
	frame_oam -31,   8, $16, 4 | OAMF_BANK1
	frame_oam -31, -16, $00, 5 | OAMF_BANK1
	frame_oam -47, -19, $08, 4 | OAMF_BANK1
	frame_oam -31,   0, $2a, 4 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -15,   1, $78, 5 | OAMF_BANK1
	frame_oam -47,  -6, $08, 4 | OAMF_BANK1
	frame_oam -31, -14, $50, 4 | OAMF_BANK1
	frame_oam -31,  -6, $52, 4 | OAMF_BANK1
	frame_oam -31,   2, $54, 4 | OAMF_BANK1
	frame_oam -31,  10, $56, 4 | OAMF_BANK1
	frame_oam -15, -14, $70, 4 | OAMF_BANK1
	frame_oam -15,  -6, $72, 4 | OAMF_BANK1
	frame_oam -15,   2, $74, 4 | OAMF_BANK1
	frame_oam -15,  10, $76, 4 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -15,  -9, $78, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -47,  -2, $08, 4 | OAMF_BANK1
	frame_oam -31,   6, $50, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -2, $52, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31, -10, $54, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31, -18, $56, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   6, $70, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -2, $72, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -10, $74, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -18, $76, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -32,   8, $00, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $02, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -24, $28, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  11, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -16, -16, $40, 4 | OAMF_BANK1
	frame_oam -32,  16, $1c, 4 | OAMF_BANK1
	frame_oam -32,  24, $1e, 4 | OAMF_BANK1
	frame_oam -16,  -8, $36, 4 | OAMF_BANK1
	frame_oam -16,   0, $38, 4 | OAMF_BANK1
	frame_oam -16,   8, $3a, 4 | OAMF_BANK1
	frame_oam -32, -16, $00, 5 | OAMF_BANK1
	frame_oam -32,  -8, $02, 5 | OAMF_BANK1
	frame_oam -16,  16, $48, 5 | OAMF_BANK1
	frame_oam -48, -31, $0a, 4 | OAMF_BANK1
	frame_oam -48, -23, $0c, 4 | OAMF_BANK1
	frame_oam -48,  -7, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48, -15, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48, -19, $08, 4 | OAMF_BANK1
	frame_oam -32,   0, $58, 4 | OAMF_BANK1
	frame_oam -32,   8, $5a, 4 | OAMF_BANK1
	db $80

.frame_11
	frame_oam -15, -16, $60, 4 | OAMF_BANK1
	frame_oam -15,  -8, $62, 4 | OAMF_BANK1
	frame_oam -15,   0, $64, 4 | OAMF_BANK1
	frame_oam -15,   8, $66, 4 | OAMF_BANK1
	frame_oam -15,  16, $68, 5 | OAMF_BANK1
	frame_oam -31, -16, $00, 5 | OAMF_BANK1
	frame_oam -31,  -8, $12, 5 | OAMF_BANK1
	frame_oam -31,   8, $16, 4 | OAMF_BANK1
	frame_oam -47, -19, $08, 4 | OAMF_BANK1
	frame_oam -31,   0, $2a, 4 | OAMF_BANK1
	db $80

.frame_12
	frame_oam -16,   8, $40, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -24, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -32, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $36, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $38, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $3a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   8, $00, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $02, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -24, $48, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  23, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  15, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  -1, $0a, 4 | OAMF_BANK1
	frame_oam -48,   7, $0c, 4 | OAMF_BANK1
	frame_oam -48,  11, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $58, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $5a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -15,   8, $60, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   0, $62, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -8, $64, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -16, $66, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -24, $68, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,   8, $00, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,   0, $12, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31, -16, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -47,  11, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -8, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -44, -31, $0a, 5 | OAMF_BANK1
	frame_oam -44, -23, $0c, 5 | OAMF_BANK1
	frame_oam -44,  -7, $0a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -44, -15, $0c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $00, 5 | OAMF_BANK1
	frame_oam -29,  -8, $02, 5 | OAMF_BANK1
	frame_oam -29,   0, $3c, 4 | OAMF_BANK1
	frame_oam -29,   8, $3e, 4 | OAMF_BANK1
	frame_oam -15, -16, $60, 4 | OAMF_BANK1
	frame_oam -13,   0, $2e, 4 | OAMF_BANK1
	frame_oam -44, -19, $08, 5 | OAMF_BANK1
	frame_oam -15,  -8, $2c, 4 | OAMF_BANK1
	frame_oam -13,   8, $7a, 4 | OAMF_BANK1
	frame_oam -13,  16, $7c, 4 | OAMF_BANK1
	frame_oam -13,  24, $7e, 4 | OAMF_BANK1
	db $80

.frame_15
	frame_oam -44,  23, $0a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -44,  15, $0c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -44,  -1, $0a, 5 | OAMF_BANK1
	frame_oam -44,   7, $0c, 5 | OAMF_BANK1
	frame_oam -29,   8, $00, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $02, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $3e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   8, $60, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $2e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -44,  11, $08, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   0, $2c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $7a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -24, $7c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -32, $7e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -32,   8, $00, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $02, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -24, $28, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  11, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -16,   8, $40, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -24, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -32, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $36, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $38, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $3a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   8, $00, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $02, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -24, $48, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  18, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  15, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,   4, $0a, 4 | OAMF_BANK1
	frame_oam -48,   7, $0c, 4 | OAMF_BANK1
	frame_oam -48,  11, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -47,  23, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -47,  15, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -47,  -1, $0a, 4 | OAMF_BANK1
	frame_oam -47,   7, $0c, 4 | OAMF_BANK1
	frame_oam -15,   8, $60, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -8, $2e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -16, $30, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -24, $32, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -32, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -8, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31, -16, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,   8, $00, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,   0, $02, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -47,  11, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   0, $2c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -16,   8, $40, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $46, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -24, $48, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   8, $00, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $12, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $64, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $4c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -24, $4e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $4a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  19, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  15, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,   4, $0a, 4 | OAMF_BANK1
	frame_oam -48,   7, $0c, 4 | OAMF_BANK1
	frame_oam -48,  11, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -47,  23, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -47,  15, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -47,  -1, $0a, 4 | OAMF_BANK1
	frame_oam -47,   7, $0c, 4 | OAMF_BANK1
	frame_oam -15,   8, $60, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   0, $62, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -8, $64, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -16, $6a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -24, $68, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -24, $6c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -32, $6e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,   0, $12, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31, -16, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,   8, $00, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -47,  11, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -8, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -48,  18, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  15, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,   3, $0a, 4 | OAMF_BANK1
	frame_oam -48,   7, $0c, 4 | OAMF_BANK1
	frame_oam -32,   8, $00, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $02, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $40, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $42, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $44, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $46, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -24, $48, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  11, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -47,  23, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -47,  15, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -47,  -1, $0a, 4 | OAMF_BANK1
	frame_oam -47,   7, $0c, 4 | OAMF_BANK1
	frame_oam -15,   8, $60, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   0, $62, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -8, $64, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -16, $66, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -24, $68, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,   8, $00, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,   0, $12, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -8, $14, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31, -16, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -47,  11, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -44, -27, $0a, 5 | OAMF_BANK1
	frame_oam -44, -23, $0c, 5 | OAMF_BANK1
	frame_oam -44, -11, $0a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -44, -15, $0c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $00, 5 | OAMF_BANK1
	frame_oam -29,  -8, $02, 5 | OAMF_BANK1
	frame_oam -29,   0, $3c, 4 | OAMF_BANK1
	frame_oam -29,   8, $3e, 4 | OAMF_BANK1
	frame_oam -15, -16, $60, 4 | OAMF_BANK1
	frame_oam -13,   0, $2e, 4 | OAMF_BANK1
	frame_oam -44, -19, $08, 5 | OAMF_BANK1
	frame_oam -15,  -8, $2c, 4 | OAMF_BANK1
	frame_oam -13,   8, $7a, 4 | OAMF_BANK1
	frame_oam -13,  16, $7c, 4 | OAMF_BANK1
	frame_oam -13,  24, $7e, 4 | OAMF_BANK1
	db $80

.frame_24
	frame_oam -29, -16, $00, 5 | OAMF_BANK1
	frame_oam -29,  -8, $02, 5 | OAMF_BANK1
	frame_oam -29,   0, $3c, 4 | OAMF_BANK1
	frame_oam -29,   8, $3e, 4 | OAMF_BANK1
	frame_oam -15, -16, $60, 4 | OAMF_BANK1
	frame_oam -13,   0, $2e, 4 | OAMF_BANK1
	frame_oam -44, -19, $08, 5 | OAMF_BANK1
	frame_oam -15,  -8, $2c, 4 | OAMF_BANK1
	frame_oam -13,   8, $7a, 4 | OAMF_BANK1
	frame_oam -13,  16, $7c, 4 | OAMF_BANK1
	frame_oam -13,  24, $7e, 4 | OAMF_BANK1
	db $80

.frame_25
	frame_oam -44,  19, $0a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -44,  15, $0c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -44,   3, $0a, 5 | OAMF_BANK1
	frame_oam -44,   7, $0c, 5 | OAMF_BANK1
	frame_oam -29,   8, $00, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $02, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $3e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   8, $60, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $2e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -44,  11, $08, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   0, $2c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $7a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -24, $7c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -32, $7e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -29,   8, $00, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $02, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $3e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   8, $60, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $2e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -44,  11, $08, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   0, $2c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $7a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -24, $7c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -32, $7e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_188b56::
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

.frame_0
	frame_oam -10, -16, $c0, 7 | OAMF_BANK1
	frame_oam -10,  -8, $c2, 7 | OAMF_BANK1
	frame_oam -10,   7, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  -1, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -10, -16, $c0, 7 | OAMF_BANK1
	frame_oam -10,   7, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  -8, $c4, 7 | OAMF_BANK1
	frame_oam -10,  -1, $c6, 7 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -10,   7, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10, -16, $c0, 7 | OAMF_BANK1
	frame_oam -10,  -1, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  -8, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -10, -16, $c0, 7 | OAMF_BANK1
	frame_oam -10,   7, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  -8, $c8, 7 | OAMF_BANK1
	frame_oam -10,  -1, $c8, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -10, -16, $c0, 7 | OAMF_BANK1
	frame_oam -10,   7, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10, -16, $c0, 7 | OAMF_BANK1
	frame_oam -10,   7, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  -8, $ca, 7 | OAMF_BANK1
	frame_oam -10,  -1, $ca, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -11, -16, $cc, 7 | OAMF_BANK1
	frame_oam -11,  -8, $ce, 7 | OAMF_BANK1
	frame_oam -11,   7, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,  -1, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -12, -16, $cc, 7 | OAMF_BANK1
	frame_oam -12,  -8, $ce, 7 | OAMF_BANK1
	frame_oam -12,   7, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,  -1, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -10, -16, $d0, 7 | OAMF_BANK1
	frame_oam -10,  -8, $d2, 7 | OAMF_BANK1
	frame_oam -10,   7, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  -1, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -10, -16, $d4, 7 | OAMF_BANK1
	frame_oam -10,  -8, $d6, 7 | OAMF_BANK1
	frame_oam -10,   7, $d4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  -1, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -10,  -8, $d6, 7 | OAMF_BANK1
	frame_oam -10,  -1, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -6, -16, $d8, 7 | OAMF_BANK1
	frame_oam  -6,   7, $d8, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -10,  -8, $d6, 7 | OAMF_BANK1
	frame_oam -10,  -1, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -6, -16, $da, 7 | OAMF_BANK1
	frame_oam  -6,   7, $da, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam  -6, -16, $d8, 7 | OAMF_BANK1
	frame_oam  -6,   7, $d8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  -8, $dc, 7 | OAMF_BANK1
	frame_oam -10,  -1, $dc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -10,  -8, $de, 7 | OAMF_BANK1
	frame_oam -10,  -1, $de, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -6, -16, $da, 7 | OAMF_BANK1
	frame_oam  -6,   7, $da, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -16, -12, $e0, 7 | OAMF_BANK1
	frame_oam -16,  -4, $e2, 7 | OAMF_BANK1
	frame_oam -16,   3, $e0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16,  -8, $e4, 7 | OAMF_BANK1
	frame_oam -16,  -1, $e4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -16,  -8, $e6, 7 | OAMF_BANK1
	frame_oam -16,  -1, $e6, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_188c7a::
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
	frame_oam -16,   4, $04, 4 | OAMF_BANK1
	frame_oam -16,  -4, $02, 4 | OAMF_BANK1
	frame_oam -16, -12, $00, 4 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,   4, $08, 4 | OAMF_BANK1
	frame_oam -16,  -4, $06, 4 | OAMF_BANK1
	frame_oam -16, -12, $00, 4 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16, -12, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -16, -12, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -17, -12, $00, 4 | OAMF_BANK1
	frame_oam -17,  -4, $02, 4 | OAMF_BANK1
	frame_oam -17,   4, $04, 4 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -17, -12, $00, 4 | OAMF_BANK1
	frame_oam -17,  -4, $06, 4 | OAMF_BANK1
	frame_oam -17,   4, $08, 4 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -15, -12, $00, 4 | OAMF_BANK1
	frame_oam -15,  -4, $02, 4 | OAMF_BANK1
	frame_oam -15,   4, $04, 4 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -15, -12, $00, 4 | OAMF_BANK1
	frame_oam -15,  -4, $06, 4 | OAMF_BANK1
	frame_oam -15,   4, $08, 4 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -17,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,  -4, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17, -12, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -17,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,  -4, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17, -12, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -15,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -4, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -12, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -15,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -4, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -12, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -16,  -9, $0a, 4 | OAMF_BANK1
	frame_oam -16,  -1, $0c, 4 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -16,   1, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16,   4, $04, 4 | OAMF_BANK1
	frame_oam -16,  -4, $0e, 4 | OAMF_BANK1
	frame_oam -16, -12, $2e, 4 | OAMF_BANK1
	db $80

.frame_15
	frame_oam -16,   4, $08, 4 | OAMF_BANK1
	frame_oam -16,  -4, $20, 4 | OAMF_BANK1
	frame_oam -16, -12, $30, 4 | OAMF_BANK1
	db $80

.frame_16
	frame_oam -16, -12, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $2e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -16, -12, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $30, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -16, -12, $16, 4 | OAMF_BANK1
	frame_oam -16,  -4, $18, 4 | OAMF_BANK1
	frame_oam -16,   4, $1a, 4 | OAMF_BANK1
	db $80

.frame_19
	frame_oam -16, -12, $16, 4 | OAMF_BANK1
	frame_oam -16,  -4, $1c, 4 | OAMF_BANK1
	frame_oam -16,   4, $1e, 4 | OAMF_BANK1
	db $80

.frame_20
	frame_oam -16,   4, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -16,   4, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -16, -12, $10, 4 | OAMF_BANK1
	frame_oam -16,  -4, $12, 4 | OAMF_BANK1
	frame_oam -16,   4, $14, 4 | OAMF_BANK1
	db $80

.frame_23
	frame_oam -16,   4, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $14, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -15, -12, $22, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -15,  -4, $24, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -17,   4, $26, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_25
	frame_oam -15, -12, $28, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -15,  -4, $2a, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -17,   4, $2c, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_26
	frame_oam -15,   4, $22, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -15,  -4, $24, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -17, -12, $26, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_27
	frame_oam -15,   4, $28, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -15,  -4, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -17, -12, $2c, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

OAM_188e16::
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

.frame_0
	frame_oam -16, -16, $00, 4 | OAMF_BANK1
	frame_oam -16,   8, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26,  -8, $02, 4 | OAMF_BANK1
	frame_oam -26,   0, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  -8, $04, 2 | OAMF_BANK1
	frame_oam -10,   0, $04, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -17, -16, $00, 4 | OAMF_BANK1
	frame_oam -17,   8, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  -8, $08, 2 | OAMF_BANK1
	frame_oam -10,   0, $08, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26,  -8, $06, 4 | OAMF_BANK1
	frame_oam -26,   0, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -18, -16, $00, 4 | OAMF_BANK1
	frame_oam -18,   8, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  -8, $08, 2 | OAMF_BANK1
	frame_oam -10,   0, $08, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26,  -8, $0a, 4 | OAMF_BANK1
	frame_oam -26,   0, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -18, -16, $00, 4 | OAMF_BANK1
	frame_oam -18,   8, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,  -8, $0c, 2 | OAMF_BANK1
	frame_oam -11,   0, $0c, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -27,  -8, $0a, 4 | OAMF_BANK1
	frame_oam -27,   0, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -12,  -8, $14, 2 | OAMF_BANK1
	frame_oam -12,   0, $14, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17, -16, $0e, 4 | OAMF_BANK1
	frame_oam -17,   8, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,  -8, $10, 4 | OAMF_BANK1
	frame_oam -28,   0, $12, 4 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -12,  -8, $14, 2 | OAMF_BANK1
	frame_oam -12,   0, $14, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17, -16, $0e, 4 | OAMF_BANK1
	frame_oam -17,   8, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,  -8, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,   0, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -28,  -8, $10, 4 | OAMF_BANK1
	frame_oam -28,   0, $12, 4 | OAMF_BANK1
	frame_oam -12,  -8, $18, 2 | OAMF_BANK1
	frame_oam -12,   0, $18, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,   8, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -16, $1e, 4 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -28,   0, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,  -8, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,  -8, $18, 2 | OAMF_BANK1
	frame_oam -12,   0, $18, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,   8, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -16, $1e, 4 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -28,  -8, $1a, 4 | OAMF_BANK1
	frame_oam -28,   0, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -16, $1c, 4 | OAMF_BANK1
	frame_oam -15,   8, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,  -8, $14, 2 | OAMF_BANK1
	frame_oam -12,   0, $14, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -27,  -8, $1a, 4 | OAMF_BANK1
	frame_oam -27,   0, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -16, $1e, 4 | OAMF_BANK1
	frame_oam -19,   8, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,  -8, $14, 2 | OAMF_BANK1
	frame_oam -11,   0, $14, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -27,  -8, $1a, 4 | OAMF_BANK1
	frame_oam -27,   0, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -16, $20, 4 | OAMF_BANK1
	frame_oam -19,   8, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,  -8, $14, 2 | OAMF_BANK1
	frame_oam -11,   0, $14, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -26,  -8, $1a, 4 | OAMF_BANK1
	frame_oam -26,   0, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -16, $22, 4 | OAMF_BANK1
	frame_oam -19,   8, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  -8, $14, 2 | OAMF_BANK1
	frame_oam -10,   0, $14, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -19, -16, $24, 4 | OAMF_BANK1
	frame_oam -19,   8, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -27,  -8, $1a, 4 | OAMF_BANK1
	frame_oam -27,   0, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,  -8, $14, 2 | OAMF_BANK1
	frame_oam -11,   0, $14, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -28,  -8, $1a, 4 | OAMF_BANK1
	frame_oam -28,   0, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -16, $1c, 4 | OAMF_BANK1
	frame_oam -15,   8, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,  -8, $18, 2 | OAMF_BANK1
	frame_oam -12,   0, $18, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -27,  -8, $1a, 4 | OAMF_BANK1
	frame_oam -11,  -8, $18, 2 | OAMF_BANK1
	frame_oam -27,   0, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,   0, $18, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -16, $1e, 4 | OAMF_BANK1
	frame_oam -19,   8, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -27,  -8, $1a, 4 | OAMF_BANK1
	frame_oam -11,  -8, $18, 2 | OAMF_BANK1
	frame_oam -27,   0, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,   0, $18, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -16, $20, 4 | OAMF_BANK1
	frame_oam -19,   8, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -26,  -8, $1a, 4 | OAMF_BANK1
	frame_oam -26,   0, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -16, $22, 4 | OAMF_BANK1
	frame_oam -19,   8, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  -8, $18, 2 | OAMF_BANK1
	frame_oam -10,   0, $18, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -19, -16, $24, 4 | OAMF_BANK1
	frame_oam -19,   8, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -27,  -8, $1a, 4 | OAMF_BANK1
	frame_oam -11,  -8, $18, 2 | OAMF_BANK1
	frame_oam -27,   0, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,   0, $18, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -15, -16, $1c, 4 | OAMF_BANK1
	frame_oam -15,   8, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26,  -8, $26, 4 | OAMF_BANK1
	frame_oam -10,  -8, $08, 2 | OAMF_BANK1
	frame_oam -26,   0, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,   0, $08, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -19, -16, $1e, 4 | OAMF_BANK1
	frame_oam -19,   8, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -25,  -8, $26, 4 | OAMF_BANK1
	frame_oam  -9,  -8, $08, 2 | OAMF_BANK1
	frame_oam -25,   0, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -9,   0, $08, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -19, -16, $20, 4 | OAMF_BANK1
	frame_oam -19,   8, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -25,  -8, $26, 4 | OAMF_BANK1
	frame_oam  -9,  -8, $08, 2 | OAMF_BANK1
	frame_oam -25,   0, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -9,   0, $08, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -19, -16, $22, 4 | OAMF_BANK1
	frame_oam -19,   8, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -8, $26, 4 | OAMF_BANK1
	frame_oam  -8,  -8, $08, 2 | OAMF_BANK1
	frame_oam -24,   0, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,   0, $08, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -19, -16, $24, 4 | OAMF_BANK1
	frame_oam -19,   8, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -25,  -8, $26, 4 | OAMF_BANK1
	frame_oam  -9,  -8, $08, 2 | OAMF_BANK1
	frame_oam -25,   0, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -9,   0, $08, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -27,  -8, $10, 4 | OAMF_BANK1
	frame_oam -27,   0, $12, 4 | OAMF_BANK1
	frame_oam -11,  -8, $18, 2 | OAMF_BANK1
	frame_oam -11,   0, $18, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -16, $22, 4 | OAMF_BANK1
	frame_oam -19,   8, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -27,   0, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -27,  -8, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,  -8, $18, 2 | OAMF_BANK1
	frame_oam -11,   0, $18, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,   8, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -16, $1e, 4 | OAMF_BANK1
	db $80

.frame_25
	frame_oam -26,  -8, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  -8, $18, 2 | OAMF_BANK1
	frame_oam -10,   0, $18, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -16, $20, 4 | OAMF_BANK1
	frame_oam -19,   8, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26,   0, $12, 4 | OAMF_BANK1
	db $80

.frame_26
	frame_oam -15,   7, $3a, 4 | OAMF_BANK1
	frame_oam -29,  -8, $28, 4 | OAMF_BANK1
	frame_oam -29,   0, $2a, 4 | OAMF_BANK1
	frame_oam -13,  -8, $2c, 2 | OAMF_BANK1
	frame_oam -13,   0, $2e, 2 | OAMF_BANK1
	frame_oam -15, -15, $1c, 4 | OAMF_BANK1
	db $80

.frame_27
	frame_oam -19,   7, $3c, 4 | OAMF_BANK1
	frame_oam -28,  -8, $28, 4 | OAMF_BANK1
	frame_oam -28,   0, $2a, 4 | OAMF_BANK1
	frame_oam -12,  -8, $2c, 2 | OAMF_BANK1
	frame_oam -12,   0, $2e, 2 | OAMF_BANK1
	frame_oam -19, -15, $1e, 4 | OAMF_BANK1
	db $80

.frame_28
	frame_oam -19,   7, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,  -8, $28, 4 | OAMF_BANK1
	frame_oam -28,   0, $2a, 4 | OAMF_BANK1
	frame_oam -12,  -8, $2c, 2 | OAMF_BANK1
	frame_oam -12,   0, $2e, 2 | OAMF_BANK1
	frame_oam -19, -15, $20, 4 | OAMF_BANK1
	db $80

.frame_29
	frame_oam -19,   7, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -27,  -8, $28, 4 | OAMF_BANK1
	frame_oam -27,   0, $2a, 4 | OAMF_BANK1
	frame_oam -11,  -8, $2c, 2 | OAMF_BANK1
	frame_oam -11,   0, $2e, 2 | OAMF_BANK1
	frame_oam -19, -15, $22, 4 | OAMF_BANK1
	db $80

.frame_30
	frame_oam -19,   7, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,  -8, $28, 4 | OAMF_BANK1
	frame_oam -28,   0, $2a, 4 | OAMF_BANK1
	frame_oam -12,  -8, $2c, 2 | OAMF_BANK1
	frame_oam -12,   0, $2e, 2 | OAMF_BANK1
	frame_oam -19, -16, $3e, 4 | OAMF_BANK1
	db $80

.frame_31
	frame_oam -15, -15, $3a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $2c, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $2e, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   7, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_32
	frame_oam -19, -15, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,   0, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,  -8, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,   0, $2c, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,  -8, $2e, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,   7, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_33
	frame_oam -19, -15, $20, 4 | OAMF_BANK1
	frame_oam -28,   0, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,  -8, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,   0, $2c, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,  -8, $2e, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,   7, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_34
	frame_oam -19, -15, $22, 4 | OAMF_BANK1
	frame_oam -27,   0, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -27,  -8, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,   0, $2c, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,  -8, $2e, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,   7, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_35
	frame_oam -19, -15, $24, 4 | OAMF_BANK1
	frame_oam -28,   0, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,  -8, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,   0, $2c, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,  -8, $2e, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,   8, $3e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_36
	frame_oam -15,   7, $3a, 4 | OAMF_BANK1
	frame_oam -29,  -8, $28, 4 | OAMF_BANK1
	frame_oam -29,   0, $2a, 4 | OAMF_BANK1
	frame_oam -13,  -8, $30, 2 | OAMF_BANK1
	frame_oam -13,   0, $32, 2 | OAMF_BANK1
	frame_oam -15, -15, $1c, 4 | OAMF_BANK1
	db $80

.frame_37
	frame_oam -19,   7, $3c, 4 | OAMF_BANK1
	frame_oam -28,  -8, $28, 4 | OAMF_BANK1
	frame_oam -28,   0, $2a, 4 | OAMF_BANK1
	frame_oam -12,  -8, $30, 2 | OAMF_BANK1
	frame_oam -12,   0, $32, 2 | OAMF_BANK1
	frame_oam -19, -15, $1e, 4 | OAMF_BANK1
	db $80

.frame_38
	frame_oam -19,   7, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,  -8, $28, 4 | OAMF_BANK1
	frame_oam -28,   0, $2a, 4 | OAMF_BANK1
	frame_oam -12,  -8, $30, 2 | OAMF_BANK1
	frame_oam -12,   0, $32, 2 | OAMF_BANK1
	frame_oam -19, -15, $20, 4 | OAMF_BANK1
	db $80

.frame_39
	frame_oam -19,   7, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -27,  -8, $28, 4 | OAMF_BANK1
	frame_oam -27,   0, $2a, 4 | OAMF_BANK1
	frame_oam -11,  -8, $30, 2 | OAMF_BANK1
	frame_oam -11,   0, $32, 2 | OAMF_BANK1
	frame_oam -19, -15, $22, 4 | OAMF_BANK1
	db $80

.frame_40
	frame_oam -19,   7, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,  -8, $28, 4 | OAMF_BANK1
	frame_oam -28,   0, $2a, 4 | OAMF_BANK1
	frame_oam -12,  -8, $30, 2 | OAMF_BANK1
	frame_oam -12,   0, $32, 2 | OAMF_BANK1
	frame_oam -19, -16, $3e, 4 | OAMF_BANK1
	db $80

.frame_41
	frame_oam -15, -15, $3a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $30, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $32, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   7, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_42
	frame_oam -19, -15, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,   0, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,  -8, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,   0, $30, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,  -8, $32, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,   7, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_43
	frame_oam -19, -15, $20, 4 | OAMF_BANK1
	frame_oam -28,   0, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,  -8, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,   0, $30, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,  -8, $32, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,   7, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_44
	frame_oam -19, -15, $22, 4 | OAMF_BANK1
	frame_oam -27,   0, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -27,  -8, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,   0, $30, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,  -8, $32, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,   7, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_45
	frame_oam -19, -15, $24, 4 | OAMF_BANK1
	frame_oam -28,   0, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,  -8, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,   0, $30, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,  -8, $32, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,   8, $3e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_46
	frame_oam -15,   7, $3a, 4 | OAMF_BANK1
	frame_oam -28,  -8, $16, 4 | OAMF_BANK1
	frame_oam -12,  -8, $36, 2 | OAMF_BANK1
	frame_oam -28,   0, $34, 4 | OAMF_BANK1
	frame_oam -12,   0, $38, 2 | OAMF_BANK1
	frame_oam -15, -15, $1c, 4 | OAMF_BANK1
	db $80

.frame_47
	frame_oam -20,   7, $3c, 4 | OAMF_BANK1
	frame_oam -27,  -8, $16, 4 | OAMF_BANK1
	frame_oam -11,  -8, $36, 2 | OAMF_BANK1
	frame_oam -27,   0, $34, 4 | OAMF_BANK1
	frame_oam -11,   0, $38, 2 | OAMF_BANK1
	frame_oam -20, -15, $1e, 4 | OAMF_BANK1
	db $80

.frame_48
	frame_oam -19,   7, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -27,  -8, $16, 4 | OAMF_BANK1
	frame_oam -11,  -8, $36, 2 | OAMF_BANK1
	frame_oam -27,   0, $34, 4 | OAMF_BANK1
	frame_oam -11,   0, $38, 2 | OAMF_BANK1
	frame_oam -19, -15, $20, 4 | OAMF_BANK1
	db $80

.frame_49
	frame_oam -19,   7, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26,  -8, $16, 4 | OAMF_BANK1
	frame_oam -10,  -8, $36, 2 | OAMF_BANK1
	frame_oam -26,   0, $34, 4 | OAMF_BANK1
	frame_oam -10,   0, $38, 2 | OAMF_BANK1
	frame_oam -19, -15, $22, 4 | OAMF_BANK1
	db $80

.frame_50
	frame_oam -19,   7, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -27,  -8, $16, 4 | OAMF_BANK1
	frame_oam -11,  -8, $36, 2 | OAMF_BANK1
	frame_oam -27,   0, $34, 4 | OAMF_BANK1
	frame_oam -11,   0, $38, 2 | OAMF_BANK1
	frame_oam -19, -16, $3e, 4 | OAMF_BANK1
	db $80

.frame_51
	frame_oam -15, -15, $3a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,   0, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,   0, $36, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,  -8, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,  -8, $38, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   7, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_52
	frame_oam -20, -15, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -27,   0, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,   0, $36, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -27,  -8, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,  -8, $38, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,   7, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_53
	frame_oam -19, -15, $20, 4 | OAMF_BANK1
	frame_oam -27,   0, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,   0, $36, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -27,  -8, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,  -8, $38, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,   7, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_54
	frame_oam -19, -15, $22, 4 | OAMF_BANK1
	frame_oam -26,   0, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,   0, $36, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26,  -8, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  -8, $38, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,   7, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_55
	frame_oam -19, -15, $24, 4 | OAMF_BANK1
	frame_oam -27,   0, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,   0, $36, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -27,  -8, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,  -8, $38, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,   8, $3e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_1893fe::
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

.frame_0
	frame_oam -16,  -8, $c0, 7 | OAMF_BANK1
	frame_oam -16,   0, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -16,  -9, $c2, 7 | OAMF_BANK1
	frame_oam -16,  -1, $c4, 7 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16, -10, $c2, 7 | OAMF_BANK1
	frame_oam -16,  -2, $c4, 7 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,   2, $ca, 7 | OAMF_BANK1
	frame_oam -16, -11, $c6, 7 | OAMF_BANK1
	frame_oam -16,  -4, $c8, 7 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -16, -12, $cc, 7 | OAMF_BANK1
	frame_oam -16,  -5, $ce, 7 | OAMF_BANK1
	frame_oam -16,   2, $d0, 7 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16, -12, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   3, $d2, 7 | OAMF_BANK1
	frame_oam -16,  -4, $d4, 7 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16, -12, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $d2, 7 | OAMF_BANK1
	frame_oam -16,  -4, $d6, 7 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16,   5, $d2, 7 | OAMF_BANK1
	frame_oam -16, -11, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -3, $d6, 7 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -16,   3, $d2, 7 | OAMF_BANK1
	frame_oam -16, -13, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -5, $d6, 7 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -18, -12, $d8, 7 | OAMF_BANK1
	frame_oam -16,  -4, $da, 7 | OAMF_BANK1
	frame_oam -18,   4, $dc, 7 | OAMF_BANK1
	frame_oam -39, -12, $f8, 7 | OAMF_BANK1
	frame_oam -32,  -4, $de, 7 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -18, -12, $d8, 7 | OAMF_BANK1
	frame_oam -16,  -4, $da, 7 | OAMF_BANK1
	frame_oam -18,   4, $dc, 7 | OAMF_BANK1
	frame_oam -36, -11, $fc, 7 | OAMF_BANK1
	frame_oam -44,   1, $f8, 7 | OAMF_BANK1
	frame_oam -32,  -4, $de, 7 | OAMF_BANK1
	db $80

.frame_11
	frame_oam -18, -12, $d8, 7 | OAMF_BANK1
	frame_oam -16,  -4, $da, 7 | OAMF_BANK1
	frame_oam -18,   4, $dc, 7 | OAMF_BANK1
	frame_oam -32,  -4, $de, 7 | OAMF_BANK1
	frame_oam -42,   3, $fc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -18, -12, $d8, 7 | OAMF_BANK1
	frame_oam -16,  -4, $da, 7 | OAMF_BANK1
	frame_oam -18,   4, $dc, 7 | OAMF_BANK1
	frame_oam -32,  -4, $de, 7 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -16, -12, $e0, 7 | OAMF_BANK1
	frame_oam -16,  -4, $e2, 7 | OAMF_BANK1
	frame_oam -16,   4, $e0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16, -12, $c6, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -4, $c8, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   4, $ca, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_15
	frame_oam -16, -16, $e8, 7 | OAMF_BANK1
	frame_oam -16,  -8, $ea, 7 | OAMF_BANK1
	frame_oam -16,   8, $e8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $ea, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -16, -16, $ec, 7 | OAMF_BANK1
	frame_oam -16,  -8, $ee, 7 | OAMF_BANK1
	frame_oam -16,   8, $ec, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $ee, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -16, -16, $f0, 7 | OAMF_BANK1
	frame_oam -16,  -8, $f2, 7 | OAMF_BANK1
	frame_oam -16,   8, $f0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $f2, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -20,  -8, $f4, 7 | OAMF_BANK1
	frame_oam -20,   0, $f4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -21, -19, $fc, 7 | OAMF_BANK1
	frame_oam -21,  11, $fc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -11,  -8, $f4, 7 | OAMF_BANK1
	frame_oam -11,   0, $f4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -16,   0, $ca, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -8, $ca, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_21
	frame_oam -16,  -8, $c0, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   0, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_22
	frame_oam  -2,   4, $f8, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_23
	frame_oam   5,   4, $fc, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_24
	frame_oam  10,   3, $fc, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  27,  -2, $fa, 7 | OAMF_BANK1
	db $80

.frame_25
	frame_oam  21,   4, $fa, 7 | OAMF_BANK1
	frame_oam  40,   2, $fa, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam   0,  -4, $fe, 7 | OAMF_BANK1
	db $80

.frame_27
	frame_oam -16, -12, $e4, 7 | OAMF_BANK1
	frame_oam -16,  -4, $e6, 7 | OAMF_BANK1
	frame_oam -16,   4, $e4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam -20,  -8, $b4, 7
	frame_oam -20,   0, $b4, 7 | OAMF_XFLIP
	db $80

.frame_29
	frame_oam -19, -12, $b2, 7 | OAMF_YFLIP
	frame_oam -27, -27, $b4, 7 | OAMF_XFLIP
	frame_oam -19,   4, $b2, 7 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -27,  19, $b4, 7
	db $80

.frame_30
	frame_oam -25, -16, $b2, 7 | OAMF_YFLIP
	frame_oam -22, -43, $b2, 7
	frame_oam -25,   8, $b2, 7 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -22,  35, $b2, 7 | OAMF_XFLIP
	db $80

.frame_31
	frame_oam -40,  24, $b2, 7
	frame_oam -40, -32, $b2, 7 | OAMF_XFLIP
	db $80

.frame_32
	frame_oam -16,  -8, $d8, 7 | OAMF_BANK1
	frame_oam -14,   0, $dc, 7 | OAMF_BANK1
	db $80

.frame_33
	frame_oam -16,   0, $d0, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -8, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

OAM_1895ec::
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6

.frame_0
	frame_oam -32, -16, $80, 6 | OAMF_BANK1
	frame_oam -32,  -8, $82, 6 | OAMF_BANK1
	frame_oam -32,   7, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -1, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $84, 6 | OAMF_BANK1
	frame_oam -16,  -8, $86, 6 | OAMF_BANK1
	frame_oam -16,   7, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -1, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -32, -16, $88, 6 | OAMF_BANK1
	frame_oam -32,  -8, $8a, 6 | OAMF_BANK1
	frame_oam -32,   7, $88, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -1, $8a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $8c, 6 | OAMF_BANK1
	frame_oam -16,  -8, $8e, 6 | OAMF_BANK1
	frame_oam -16,   7, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -1, $8e, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -32, -16, $90, 6 | OAMF_BANK1
	frame_oam -32,  -8, $92, 6 | OAMF_BANK1
	frame_oam -32,   7, $90, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -1, $92, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $94, 6 | OAMF_BANK1
	frame_oam -16,  -8, $96, 6 | OAMF_BANK1
	frame_oam -16,   7, $94, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -1, $96, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -32, -16, $b0, 6 | OAMF_BANK1
	frame_oam -32,  -8, $b2, 6 | OAMF_BANK1
	frame_oam -32,   7, $b0, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -1, $b2, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $b4, 6 | OAMF_BANK1
	frame_oam -16,  -8, $b6, 6 | OAMF_BANK1
	frame_oam -16,   7, $b4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -1, $b6, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -32, -16, $98, 6 | OAMF_BANK1
	frame_oam -32,  -8, $9a, 6 | OAMF_BANK1
	frame_oam -32,   7, $98, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -1, $9a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $9c, 6 | OAMF_BANK1
	frame_oam -16,  -8, $9e, 6 | OAMF_BANK1
	frame_oam -16,   7, $9c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -1, $9e, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -32, -16, $a0, 6 | OAMF_BANK1
	frame_oam -32,  -8, $a2, 6 | OAMF_BANK1
	frame_oam -32,   7, $a0, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -1, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $a4, 6 | OAMF_BANK1
	frame_oam -16,  -8, $a6, 6 | OAMF_BANK1
	frame_oam -16,   7, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -1, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -32, -16, $a8, 6 | OAMF_BANK1
	frame_oam -32,  -8, $aa, 6 | OAMF_BANK1
	frame_oam -32,   7, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -1, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ac, 6 | OAMF_BANK1
	frame_oam -16,  -8, $ae, 6 | OAMF_BANK1
	frame_oam -16,   7, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -1, $ae, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_1896e1::
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5

.frame_0
	frame_oam -32, -12, $00, 4 | OAMF_BANK1
	frame_oam -32,  -4, $02, 4 | OAMF_BANK1
	frame_oam -32,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $04, 4 | OAMF_BANK1
	frame_oam -16,  -4, $06, 4 | OAMF_BANK1
	frame_oam -16,   4, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -34, -12, $00, 4 | OAMF_BANK1
	frame_oam -34,  -4, $02, 4 | OAMF_BANK1
	frame_oam -34,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18, -12, $04, 4 | OAMF_BANK1
	frame_oam -18,  -4, $06, 4 | OAMF_BANK1
	frame_oam -18,   4, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -36, -12, $00, 4 | OAMF_BANK1
	frame_oam -36,  -4, $02, 4 | OAMF_BANK1
	frame_oam -36,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -12, $04, 4 | OAMF_BANK1
	frame_oam -20,  -4, $06, 4 | OAMF_BANK1
	frame_oam -20,   4, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -37, -12, $00, 4 | OAMF_BANK1
	frame_oam -37,  -4, $02, 4 | OAMF_BANK1
	frame_oam -37,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -21, -12, $04, 4 | OAMF_BANK1
	frame_oam -21,  -4, $06, 4 | OAMF_BANK1
	frame_oam -21,   4, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -15, -12, $08, 4 | OAMF_BANK1
	frame_oam -15,  -4, $0a, 4 | OAMF_BANK1
	frame_oam -15,   4, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31, -12, $00, 4 | OAMF_BANK1
	frame_oam -31,  -4, $02, 4 | OAMF_BANK1
	frame_oam -31,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -14, -12, $10, 4 | OAMF_BANK1
	frame_oam -14,  -4, $12, 4 | OAMF_BANK1
	frame_oam -14,   4, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30, -12, $0c, 4 | OAMF_BANK1
	frame_oam -30,  -4, $0e, 4 | OAMF_BANK1
	frame_oam -30,   4, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_189783::
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
	dw .frame_64
	dw .frame_65
	dw .frame_66
	dw .frame_67
	dw .frame_68
	dw .frame_69
	dw .frame_70
	dw .frame_71
	dw .frame_72
	dw .frame_73
	dw .frame_74
	dw .frame_75
	dw .frame_76
	dw .frame_77
	dw .frame_78
	dw .frame_79
	dw .frame_80
	dw .frame_81
	dw .frame_82
	dw .frame_83
	dw .frame_84
	dw .frame_85
	dw .frame_86
	dw .frame_87
	dw .frame_88
	dw .frame_89
	dw .frame_90
	dw .frame_91
	dw .frame_92

.frame_0
	frame_oam   0, -15, $04, 4 | OAMF_BANK1
	frame_oam   0,  -7, $06, 4 | OAMF_BANK1
	frame_oam -16, -15, $08, 4 | OAMF_BANK1
	frame_oam -16,  -7, $0a, 4 | OAMF_BANK1
	frame_oam -32, -25, $0c, 4 | OAMF_BANK1
	frame_oam -32, -17, $0e, 4 | OAMF_BANK1
	frame_oam -32,  -9, $10, 4 | OAMF_BANK1
	db $80

.frame_1
	frame_oam   0, -17, $04, 4 | OAMF_BANK1
	frame_oam   0,  -9, $06, 4 | OAMF_BANK1
	frame_oam -16, -13, $00, 4 | OAMF_BANK1
	frame_oam -16,  -5, $02, 4 | OAMF_BANK1
	frame_oam -32, -23, $0c, 4 | OAMF_BANK1
	frame_oam -32, -15, $0e, 4 | OAMF_BANK1
	frame_oam -32,  -7, $10, 4 | OAMF_BANK1
	db $80

.frame_2
	frame_oam   0, -17, $00, 4 | OAMF_BANK1
	frame_oam   0,  -9, $02, 4 | OAMF_BANK1
	frame_oam -16, -15, $04, 4 | OAMF_BANK1
	frame_oam -16,  -7, $06, 4 | OAMF_BANK1
	frame_oam -32, -21, $0c, 4 | OAMF_BANK1
	frame_oam -32, -13, $0e, 4 | OAMF_BANK1
	frame_oam -32,  -5, $10, 4 | OAMF_BANK1
	db $80

.frame_3
	frame_oam   0, -17, $08, 4 | OAMF_BANK1
	frame_oam   0,  -9, $0a, 4 | OAMF_BANK1
	frame_oam -16, -17, $04, 4 | OAMF_BANK1
	frame_oam -16,  -9, $06, 4 | OAMF_BANK1
	frame_oam -32, -21, $0c, 4 | OAMF_BANK1
	frame_oam -32, -13, $0e, 4 | OAMF_BANK1
	frame_oam -32,  -5, $10, 4 | OAMF_BANK1
	db $80

.frame_4
	frame_oam   0, -15, $08, 4 | OAMF_BANK1
	frame_oam   0,  -7, $0a, 4 | OAMF_BANK1
	frame_oam -16, -17, $00, 4 | OAMF_BANK1
	frame_oam -16,  -9, $02, 4 | OAMF_BANK1
	frame_oam -32, -23, $0c, 4 | OAMF_BANK1
	frame_oam -32, -15, $0e, 4 | OAMF_BANK1
	frame_oam -32,  -7, $10, 4 | OAMF_BANK1
	db $80

.frame_5
	frame_oam   0, -13, $00, 4 | OAMF_BANK1
	frame_oam   0,  -5, $02, 4 | OAMF_BANK1
	frame_oam -16, -17, $08, 4 | OAMF_BANK1
	frame_oam -16,  -9, $0a, 4 | OAMF_BANK1
	frame_oam -32, -25, $0c, 4 | OAMF_BANK1
	frame_oam -32, -17, $0e, 4 | OAMF_BANK1
	frame_oam -32,  -9, $10, 4 | OAMF_BANK1
	db $80

.frame_6
	frame_oam   0, -17, $04, 4 | OAMF_BANK1
	frame_oam   0,  -9, $06, 4 | OAMF_BANK1
	frame_oam -16, -13, $00, 4 | OAMF_BANK1
	frame_oam -16,  -5, $02, 4 | OAMF_BANK1
	frame_oam -32, -15, $0e, 4 | OAMF_BANK1
	frame_oam -32, -23, $12, 4 | OAMF_BANK1
	frame_oam -32,  -7, $14, 4 | OAMF_BANK1
	db $80

.frame_7
	frame_oam   0, -17, $00, 4 | OAMF_BANK1
	frame_oam   0,  -9, $02, 4 | OAMF_BANK1
	frame_oam -16, -15, $04, 4 | OAMF_BANK1
	frame_oam -16,  -7, $06, 4 | OAMF_BANK1
	frame_oam -32, -13, $0e, 4 | OAMF_BANK1
	frame_oam -32, -21, $16, 4 | OAMF_BANK1
	frame_oam -32,  -5, $18, 4 | OAMF_BANK1
	db $80

.frame_8
	frame_oam   0, -17, $08, 4 | OAMF_BANK1
	frame_oam   0,  -9, $0a, 4 | OAMF_BANK1
	frame_oam -16, -17, $04, 4 | OAMF_BANK1
	frame_oam -16,  -9, $06, 4 | OAMF_BANK1
	frame_oam -32, -13, $0e, 4 | OAMF_BANK1
	frame_oam -32, -21, $12, 4 | OAMF_BANK1
	frame_oam -32,  -5, $14, 4 | OAMF_BANK1
	db $80

.frame_9
	frame_oam   0,  -9, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -17, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -9, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -17, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   1, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -7, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -15, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam   0,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -11, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -19, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -1, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -9, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -17, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam   0,  -7, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -9, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -17, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -3, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -11, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -19, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam   0,  -7, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -3, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -11, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -19, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam   0,  -9, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -17, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -1, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -9, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -17, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam   0, -11, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -19, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   1, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -7, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -15, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam   0,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -11, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -19, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -9, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -1, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -17, $14, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam   0,  -7, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -9, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -17, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -11, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -3, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -19, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam   0,  -7, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -11, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -3, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -19, $14, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -32, -19, $0c, 4 | OAMF_BANK1
	frame_oam -32, -11, $0e, 4 | OAMF_BANK1
	frame_oam -32,  -6, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $00, 4 | OAMF_BANK1
	frame_oam -16,  -9, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $00, 4 | OAMF_BANK1
	frame_oam   0,  -9, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam   0, -15, $04, 4 | OAMF_BANK1
	frame_oam   0,  -7, $06, 4 | OAMF_BANK1
	frame_oam -16, -15, $08, 4 | OAMF_BANK1
	frame_oam -16,  -7, $0a, 4 | OAMF_BANK1
	frame_oam -32, -26, $0c, 7 | OAMF_BANK1
	frame_oam -32, -18, $0e, 7 | OAMF_BANK1
	frame_oam -32, -10, $10, 7 | OAMF_BANK1
	db $80

.frame_20
	frame_oam -32, -19, $0c, 7 | OAMF_BANK1
	frame_oam -32, -11, $0e, 7 | OAMF_BANK1
	frame_oam -32,  -6, $0c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $00, 4 | OAMF_BANK1
	frame_oam -16,  -9, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $00, 4 | OAMF_BANK1
	frame_oam   0,  -9, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam   0,  -9, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -17, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -9, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -17, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   2, $0c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -6, $0e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -14, $10, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -32, -24, $1a, 7 | OAMF_BANK1
	frame_oam -32, -16, $1c, 7 | OAMF_BANK1
	frame_oam -32,  -8, $1e, 7 | OAMF_BANK1
	frame_oam -16, -18, $2a, 7 | OAMF_BANK1
	frame_oam -26, -10, $2c, 7 | OAMF_BANK1
	frame_oam   0, -17, $04, 4 | OAMF_BANK1
	frame_oam   0,  -9, $06, 4 | OAMF_BANK1
	frame_oam -16, -13, $00, 4 | OAMF_BANK1
	frame_oam -16,  -5, $02, 4 | OAMF_BANK1
	db $80

.frame_23
	frame_oam -32, -24, $1a, 7 | OAMF_BANK1
	frame_oam -32,  -8, $1e, 7 | OAMF_BANK1
	frame_oam -32, -16, $24, 7 | OAMF_BANK1
	frame_oam -16, -18, $2a, 7 | OAMF_BANK1
	frame_oam -26, -10, $2c, 7 | OAMF_BANK1
	frame_oam   0, -17, $04, 4 | OAMF_BANK1
	frame_oam   0,  -9, $06, 4 | OAMF_BANK1
	frame_oam -16, -13, $00, 4 | OAMF_BANK1
	frame_oam -16,  -5, $02, 4 | OAMF_BANK1
	db $80

.frame_24
	frame_oam -32, -24, $1a, 7 | OAMF_BANK1
	frame_oam -32,  -8, $1e, 7 | OAMF_BANK1
	frame_oam -32, -16, $26, 7 | OAMF_BANK1
	frame_oam -16, -18, $2e, 7 | OAMF_BANK1
	frame_oam -26, -10, $2c, 7 | OAMF_BANK1
	frame_oam   0, -17, $04, 4 | OAMF_BANK1
	frame_oam   0,  -9, $06, 4 | OAMF_BANK1
	frame_oam -16, -13, $00, 4 | OAMF_BANK1
	frame_oam -16,  -5, $02, 4 | OAMF_BANK1
	db $80

.frame_25
	frame_oam -32, -22, $1a, 7 | OAMF_BANK1
	frame_oam -32, -14, $1c, 7 | OAMF_BANK1
	frame_oam -32,  -6, $1e, 7 | OAMF_BANK1
	frame_oam -16, -14, $20, 7 | OAMF_BANK1
	frame_oam -20,  -6, $22, 7 | OAMF_BANK1
	frame_oam   0, -17, $00, 4 | OAMF_BANK1
	frame_oam   0,  -9, $02, 4 | OAMF_BANK1
	frame_oam -16, -15, $04, 4 | OAMF_BANK1
	frame_oam -16,  -7, $06, 4 | OAMF_BANK1
	db $80

.frame_26
	frame_oam -32, -22, $1a, 7 | OAMF_BANK1
	frame_oam -32,  -6, $1e, 7 | OAMF_BANK1
	frame_oam -32, -14, $24, 7 | OAMF_BANK1
	frame_oam -16, -14, $20, 7 | OAMF_BANK1
	frame_oam -20,  -6, $22, 7 | OAMF_BANK1
	frame_oam   0, -17, $00, 4 | OAMF_BANK1
	frame_oam   0,  -9, $02, 4 | OAMF_BANK1
	frame_oam -16, -15, $04, 4 | OAMF_BANK1
	frame_oam -16,  -7, $06, 4 | OAMF_BANK1
	db $80

.frame_27
	frame_oam -32, -22, $1a, 7 | OAMF_BANK1
	frame_oam -32,  -6, $1e, 7 | OAMF_BANK1
	frame_oam -16, -14, $28, 7 | OAMF_BANK1
	frame_oam -32, -14, $26, 7 | OAMF_BANK1
	frame_oam -20,  -6, $22, 7 | OAMF_BANK1
	frame_oam   0, -17, $00, 4 | OAMF_BANK1
	frame_oam   0,  -9, $02, 4 | OAMF_BANK1
	frame_oam -16, -15, $04, 4 | OAMF_BANK1
	frame_oam -16,  -7, $06, 4 | OAMF_BANK1
	db $80

.frame_28
	frame_oam -32, -22, $1a, 7 | OAMF_BANK1
	frame_oam -32, -14, $1c, 7 | OAMF_BANK1
	frame_oam -32,  -6, $1e, 7 | OAMF_BANK1
	frame_oam -16, -14, $20, 7 | OAMF_BANK1
	frame_oam -20,  -6, $22, 7 | OAMF_BANK1
	frame_oam   0, -17, $08, 4 | OAMF_BANK1
	frame_oam   0,  -9, $0a, 4 | OAMF_BANK1
	frame_oam -16, -17, $04, 4 | OAMF_BANK1
	frame_oam -16,  -9, $06, 4 | OAMF_BANK1
	db $80

.frame_29
	frame_oam -32, -22, $1a, 7 | OAMF_BANK1
	frame_oam -32,  -6, $1e, 7 | OAMF_BANK1
	frame_oam -32, -14, $24, 7 | OAMF_BANK1
	frame_oam -16, -14, $20, 7 | OAMF_BANK1
	frame_oam -20,  -6, $22, 7 | OAMF_BANK1
	frame_oam   0, -17, $08, 4 | OAMF_BANK1
	frame_oam   0,  -9, $0a, 4 | OAMF_BANK1
	frame_oam -16, -17, $04, 4 | OAMF_BANK1
	frame_oam -16,  -9, $06, 4 | OAMF_BANK1
	db $80

.frame_30
	frame_oam -32, -22, $1a, 7 | OAMF_BANK1
	frame_oam -32,  -6, $1e, 7 | OAMF_BANK1
	frame_oam -16, -14, $28, 7 | OAMF_BANK1
	frame_oam -32, -14, $26, 7 | OAMF_BANK1
	frame_oam -20,  -6, $22, 7 | OAMF_BANK1
	frame_oam   0, -17, $08, 4 | OAMF_BANK1
	frame_oam   0,  -9, $0a, 4 | OAMF_BANK1
	frame_oam -16, -17, $04, 4 | OAMF_BANK1
	frame_oam -16,  -9, $06, 4 | OAMF_BANK1
	db $80

.frame_31
	frame_oam -32, -24, $1a, 7 | OAMF_BANK1
	frame_oam -32, -16, $1c, 7 | OAMF_BANK1
	frame_oam -32,  -8, $1e, 7 | OAMF_BANK1
	frame_oam -16, -18, $2a, 7 | OAMF_BANK1
	frame_oam -26, -10, $2c, 7 | OAMF_BANK1
	frame_oam   0, -15, $08, 4 | OAMF_BANK1
	frame_oam   0,  -7, $0a, 4 | OAMF_BANK1
	frame_oam -16, -17, $00, 4 | OAMF_BANK1
	frame_oam -16,  -9, $02, 4 | OAMF_BANK1
	db $80

.frame_32
	frame_oam -32, -24, $1a, 7 | OAMF_BANK1
	frame_oam -32,  -8, $1e, 7 | OAMF_BANK1
	frame_oam -32, -16, $24, 7 | OAMF_BANK1
	frame_oam -16, -18, $2a, 7 | OAMF_BANK1
	frame_oam -26, -10, $2c, 7 | OAMF_BANK1
	frame_oam   0, -15, $08, 4 | OAMF_BANK1
	frame_oam   0,  -7, $0a, 4 | OAMF_BANK1
	frame_oam -16, -17, $00, 4 | OAMF_BANK1
	frame_oam -16,  -9, $02, 4 | OAMF_BANK1
	db $80

.frame_33
	frame_oam -32, -24, $1a, 7 | OAMF_BANK1
	frame_oam -32,  -8, $1e, 7 | OAMF_BANK1
	frame_oam -32, -16, $26, 7 | OAMF_BANK1
	frame_oam -16, -18, $2e, 7 | OAMF_BANK1
	frame_oam -26, -10, $2c, 7 | OAMF_BANK1
	frame_oam   0, -15, $08, 4 | OAMF_BANK1
	frame_oam   0,  -7, $0a, 4 | OAMF_BANK1
	frame_oam -16, -17, $00, 4 | OAMF_BANK1
	frame_oam -16,  -9, $02, 4 | OAMF_BANK1
	db $80

.frame_34
	frame_oam   0, -13, $00, 4 | OAMF_BANK1
	frame_oam   0,  -5, $02, 4 | OAMF_BANK1
	frame_oam -16, -17, $08, 4 | OAMF_BANK1
	frame_oam -16,  -9, $0a, 4 | OAMF_BANK1
	frame_oam -32, -26, $0c, 7 | OAMF_BANK1
	frame_oam -32, -18, $0e, 7 | OAMF_BANK1
	frame_oam -32, -10, $10, 7 | OAMF_BANK1
	db $80

.frame_35
	frame_oam -32, -24, $1a, 7 | OAMF_BANK1
	frame_oam -32, -16, $1c, 7 | OAMF_BANK1
	frame_oam -32,  -8, $1e, 7 | OAMF_BANK1
	frame_oam -16, -16, $20, 7 | OAMF_BANK1
	frame_oam -20,  -8, $22, 7 | OAMF_BANK1
	frame_oam   0, -15, $08, 4 | OAMF_BANK1
	frame_oam   0,  -7, $0a, 4 | OAMF_BANK1
	frame_oam -16, -17, $00, 4 | OAMF_BANK1
	frame_oam -16,  -9, $02, 4 | OAMF_BANK1
	db $80

.frame_36
	frame_oam -32, -24, $1a, 7 | OAMF_BANK1
	frame_oam -32,  -8, $1e, 7 | OAMF_BANK1
	frame_oam -32, -16, $24, 7 | OAMF_BANK1
	frame_oam -16, -16, $20, 7 | OAMF_BANK1
	frame_oam -20,  -8, $22, 7 | OAMF_BANK1
	frame_oam   0, -15, $08, 4 | OAMF_BANK1
	frame_oam   0,  -7, $0a, 4 | OAMF_BANK1
	frame_oam -16, -17, $00, 4 | OAMF_BANK1
	frame_oam -16,  -9, $02, 4 | OAMF_BANK1
	db $80

.frame_37
	frame_oam -32, -24, $1a, 7 | OAMF_BANK1
	frame_oam -32,  -8, $1e, 7 | OAMF_BANK1
	frame_oam -16, -16, $28, 7 | OAMF_BANK1
	frame_oam -32, -16, $26, 7 | OAMF_BANK1
	frame_oam -20,  -8, $22, 7 | OAMF_BANK1
	frame_oam   0, -15, $08, 4 | OAMF_BANK1
	frame_oam   0,  -7, $0a, 4 | OAMF_BANK1
	frame_oam -16, -17, $00, 4 | OAMF_BANK1
	frame_oam -16,  -9, $02, 4 | OAMF_BANK1
	db $80

.frame_38
	frame_oam -32, -26, $1a, 7 | OAMF_BANK1
	frame_oam -32, -18, $1c, 7 | OAMF_BANK1
	frame_oam -32, -10, $1e, 7 | OAMF_BANK1
	frame_oam -16, -18, $20, 7 | OAMF_BANK1
	frame_oam -20, -10, $22, 7 | OAMF_BANK1
	frame_oam   0, -13, $00, 4 | OAMF_BANK1
	frame_oam   0,  -5, $02, 4 | OAMF_BANK1
	frame_oam -16, -17, $08, 4 | OAMF_BANK1
	frame_oam -16,  -9, $0a, 4 | OAMF_BANK1
	db $80

.frame_39
	frame_oam   0, -34, $34, 7 | OAMF_BANK1
	frame_oam  -2, -26, $36, 7 | OAMF_BANK1
	frame_oam -32, -26, $1a, 7 | OAMF_BANK1
	frame_oam -32, -18, $1c, 7 | OAMF_BANK1
	frame_oam -32, -10, $1e, 7 | OAMF_BANK1
	frame_oam -16, -18, $20, 7 | OAMF_BANK1
	frame_oam -20, -10, $22, 7 | OAMF_BANK1
	frame_oam   0, -15, $04, 7 | OAMF_BANK1
	frame_oam   0,  -7, $06, 7 | OAMF_BANK1
	frame_oam -16, -15, $08, 7 | OAMF_BANK1
	frame_oam -16,  -7, $0a, 7 | OAMF_BANK1
	db $80

.frame_40
	frame_oam   0, -32, $38, 7 | OAMF_BANK1
	frame_oam  -2, -24, $3a, 7 | OAMF_BANK1
	frame_oam -32, -16, $1c, 7 | OAMF_BANK1
	frame_oam -16, -16, $20, 7 | OAMF_BANK1
	frame_oam -20,  -8, $22, 7 | OAMF_BANK1
	frame_oam -32, -24, $30, 7 | OAMF_BANK1
	frame_oam -32,  -8, $32, 7 | OAMF_BANK1
	frame_oam   0, -17, $04, 4 | OAMF_BANK1
	frame_oam   0,  -9, $06, 4 | OAMF_BANK1
	frame_oam -16, -13, $00, 4 | OAMF_BANK1
	frame_oam -16,  -5, $02, 4 | OAMF_BANK1
	db $80

.frame_41
	frame_oam   0, -32, $38, 7 | OAMF_BANK1
	frame_oam  -2, -24, $3a, 7 | OAMF_BANK1
	frame_oam -32, -16, $24, 7 | OAMF_BANK1
	frame_oam -16, -16, $20, 7 | OAMF_BANK1
	frame_oam -20,  -8, $22, 7 | OAMF_BANK1
	frame_oam -32, -24, $30, 7 | OAMF_BANK1
	frame_oam -32,  -8, $32, 7 | OAMF_BANK1
	frame_oam   0, -17, $04, 4 | OAMF_BANK1
	frame_oam   0,  -9, $06, 4 | OAMF_BANK1
	frame_oam -16, -13, $00, 4 | OAMF_BANK1
	frame_oam -16,  -5, $02, 4 | OAMF_BANK1
	db $80

.frame_42
	frame_oam   0, -32, $38, 7 | OAMF_BANK1
	frame_oam  -2, -24, $3a, 7 | OAMF_BANK1
	frame_oam -16, -16, $28, 7 | OAMF_BANK1
	frame_oam -32, -16, $26, 7 | OAMF_BANK1
	frame_oam -32, -24, $30, 7 | OAMF_BANK1
	frame_oam -32,  -8, $32, 7 | OAMF_BANK1
	frame_oam -20,  -8, $22, 7 | OAMF_BANK1
	frame_oam   0, -17, $04, 4 | OAMF_BANK1
	frame_oam   0,  -9, $06, 4 | OAMF_BANK1
	frame_oam -16, -13, $00, 4 | OAMF_BANK1
	frame_oam -16,  -5, $02, 4 | OAMF_BANK1
	db $80

.frame_43
	frame_oam   0, -30, $3c, 7 | OAMF_BANK1
	frame_oam  -2, -22, $3e, 7 | OAMF_BANK1
	frame_oam -32, -14, $1c, 7 | OAMF_BANK1
	frame_oam -16, -14, $20, 7 | OAMF_BANK1
	frame_oam -20,  -6, $22, 7 | OAMF_BANK1
	frame_oam -32, -22, $30, 7 | OAMF_BANK1
	frame_oam -32,  -6, $32, 7 | OAMF_BANK1
	frame_oam   0, -17, $00, 7 | OAMF_BANK1
	frame_oam   0,  -9, $02, 7 | OAMF_BANK1
	frame_oam -16, -15, $04, 7 | OAMF_BANK1
	frame_oam -16,  -7, $06, 7 | OAMF_BANK1
	db $80

.frame_44
	frame_oam   0, -30, $3c, 7 | OAMF_BANK1
	frame_oam  -2, -22, $3e, 7 | OAMF_BANK1
	frame_oam -32, -14, $24, 7 | OAMF_BANK1
	frame_oam -16, -14, $20, 7 | OAMF_BANK1
	frame_oam -20,  -6, $22, 7 | OAMF_BANK1
	frame_oam -32, -22, $30, 7 | OAMF_BANK1
	frame_oam -32,  -6, $32, 7 | OAMF_BANK1
	frame_oam   0, -17, $00, 7 | OAMF_BANK1
	frame_oam   0,  -9, $02, 7 | OAMF_BANK1
	frame_oam -16, -15, $04, 7 | OAMF_BANK1
	frame_oam -16,  -7, $06, 7 | OAMF_BANK1
	db $80

.frame_45
	frame_oam   0, -30, $3c, 7 | OAMF_BANK1
	frame_oam  -2, -22, $3e, 7 | OAMF_BANK1
	frame_oam -16, -14, $28, 7 | OAMF_BANK1
	frame_oam -32, -14, $26, 7 | OAMF_BANK1
	frame_oam -32, -22, $30, 7 | OAMF_BANK1
	frame_oam -32,  -6, $32, 7 | OAMF_BANK1
	frame_oam -20,  -6, $22, 7 | OAMF_BANK1
	frame_oam   0, -17, $00, 7 | OAMF_BANK1
	frame_oam   0,  -9, $02, 7 | OAMF_BANK1
	frame_oam -16, -15, $04, 7 | OAMF_BANK1
	frame_oam -16,  -7, $06, 7 | OAMF_BANK1
	db $80

.frame_46
	frame_oam   0, -30, $34, 7 | OAMF_BANK1
	frame_oam  -2, -22, $36, 7 | OAMF_BANK1
	frame_oam -32, -14, $1c, 7 | OAMF_BANK1
	frame_oam -16, -14, $20, 7 | OAMF_BANK1
	frame_oam -20,  -6, $22, 7 | OAMF_BANK1
	frame_oam -32, -22, $30, 7 | OAMF_BANK1
	frame_oam -32,  -6, $32, 7 | OAMF_BANK1
	frame_oam   0, -17, $08, 4 | OAMF_BANK1
	frame_oam   0,  -9, $0a, 4 | OAMF_BANK1
	frame_oam -16, -17, $04, 4 | OAMF_BANK1
	frame_oam -16,  -9, $06, 4 | OAMF_BANK1
	db $80

.frame_47
	frame_oam   0, -30, $34, 7 | OAMF_BANK1
	frame_oam  -2, -22, $36, 7 | OAMF_BANK1
	frame_oam -32, -14, $24, 7 | OAMF_BANK1
	frame_oam -16, -14, $20, 7 | OAMF_BANK1
	frame_oam -20,  -6, $22, 7 | OAMF_BANK1
	frame_oam -32, -22, $30, 7 | OAMF_BANK1
	frame_oam -32,  -6, $32, 7 | OAMF_BANK1
	frame_oam   0, -17, $08, 4 | OAMF_BANK1
	frame_oam   0,  -9, $0a, 4 | OAMF_BANK1
	frame_oam -16, -17, $04, 4 | OAMF_BANK1
	frame_oam -16,  -9, $06, 4 | OAMF_BANK1
	db $80

.frame_48
	frame_oam   0, -30, $34, 7 | OAMF_BANK1
	frame_oam  -2, -22, $36, 7 | OAMF_BANK1
	frame_oam -16, -14, $28, 7 | OAMF_BANK1
	frame_oam -32, -14, $26, 7 | OAMF_BANK1
	frame_oam -32, -22, $30, 7 | OAMF_BANK1
	frame_oam -32,  -6, $32, 7 | OAMF_BANK1
	frame_oam -20,  -6, $22, 7 | OAMF_BANK1
	frame_oam   0, -17, $08, 4 | OAMF_BANK1
	frame_oam   0,  -9, $0a, 4 | OAMF_BANK1
	frame_oam -16, -17, $04, 4 | OAMF_BANK1
	frame_oam -16,  -9, $06, 4 | OAMF_BANK1
	db $80

.frame_49
	frame_oam   0, -32, $38, 7 | OAMF_BANK1
	frame_oam  -2, -24, $3a, 7 | OAMF_BANK1
	frame_oam -32, -16, $1c, 7 | OAMF_BANK1
	frame_oam -16, -16, $20, 7 | OAMF_BANK1
	frame_oam -20,  -8, $22, 7 | OAMF_BANK1
	frame_oam -32, -24, $30, 7 | OAMF_BANK1
	frame_oam -32,  -8, $32, 7 | OAMF_BANK1
	frame_oam   0, -15, $08, 7 | OAMF_BANK1
	frame_oam   0,  -7, $0a, 7 | OAMF_BANK1
	frame_oam -16, -17, $00, 7 | OAMF_BANK1
	frame_oam -16,  -9, $02, 7 | OAMF_BANK1
	db $80

.frame_50
	frame_oam   0, -32, $38, 7 | OAMF_BANK1
	frame_oam  -2, -24, $3a, 7 | OAMF_BANK1
	frame_oam -32, -16, $24, 7 | OAMF_BANK1
	frame_oam -16, -16, $20, 7 | OAMF_BANK1
	frame_oam -20,  -8, $22, 7 | OAMF_BANK1
	frame_oam -32, -24, $30, 7 | OAMF_BANK1
	frame_oam -32,  -8, $32, 7 | OAMF_BANK1
	frame_oam   0, -15, $08, 7 | OAMF_BANK1
	frame_oam   0,  -7, $0a, 7 | OAMF_BANK1
	frame_oam -16, -17, $00, 7 | OAMF_BANK1
	frame_oam -16,  -9, $02, 7 | OAMF_BANK1
	db $80

.frame_51
	frame_oam   0, -32, $38, 7 | OAMF_BANK1
	frame_oam  -2, -24, $3a, 7 | OAMF_BANK1
	frame_oam -16, -16, $28, 7 | OAMF_BANK1
	frame_oam -32, -16, $26, 7 | OAMF_BANK1
	frame_oam -32, -24, $30, 7 | OAMF_BANK1
	frame_oam -32,  -8, $32, 7 | OAMF_BANK1
	frame_oam -20,  -8, $22, 7 | OAMF_BANK1
	frame_oam   0, -15, $08, 7 | OAMF_BANK1
	frame_oam   0,  -7, $0a, 7 | OAMF_BANK1
	frame_oam -16, -17, $00, 7 | OAMF_BANK1
	frame_oam -16,  -9, $02, 7 | OAMF_BANK1
	db $80

.frame_52
	frame_oam   0, -34, $3c, 7 | OAMF_BANK1
	frame_oam  -2, -26, $3e, 7 | OAMF_BANK1
	frame_oam -32, -26, $1a, 7 | OAMF_BANK1
	frame_oam -32, -18, $1c, 7 | OAMF_BANK1
	frame_oam -32, -10, $1e, 7 | OAMF_BANK1
	frame_oam -16, -18, $20, 7 | OAMF_BANK1
	frame_oam -20, -10, $22, 7 | OAMF_BANK1
	frame_oam   0, -13, $00, 4 | OAMF_BANK1
	frame_oam   0,  -5, $02, 4 | OAMF_BANK1
	frame_oam -16, -17, $08, 4 | OAMF_BANK1
	frame_oam -16,  -9, $0a, 4 | OAMF_BANK1
	db $80

.frame_53
	frame_oam -32, -26, $1a, 7 | OAMF_BANK1
	frame_oam -32, -18, $1c, 7 | OAMF_BANK1
	frame_oam -32, -10, $1e, 7 | OAMF_BANK1
	frame_oam -16, -18, $20, 7 | OAMF_BANK1
	frame_oam -20, -10, $22, 7 | OAMF_BANK1
	frame_oam   0, -15, $04, 4 | OAMF_BANK1
	frame_oam   0,  -7, $06, 4 | OAMF_BANK1
	frame_oam -16, -15, $08, 4 | OAMF_BANK1
	frame_oam -16,  -7, $0a, 4 | OAMF_BANK1
	db $80

.frame_54
	frame_oam -32, -24, $1a, 7 | OAMF_BANK1
	frame_oam -32, -16, $1c, 7 | OAMF_BANK1
	frame_oam -32,  -8, $1e, 7 | OAMF_BANK1
	frame_oam -16, -16, $20, 7 | OAMF_BANK1
	frame_oam -20,  -8, $22, 7 | OAMF_BANK1
	frame_oam   0, -17, $04, 4 | OAMF_BANK1
	frame_oam   0,  -9, $06, 4 | OAMF_BANK1
	frame_oam -16, -13, $00, 4 | OAMF_BANK1
	frame_oam -16,  -5, $02, 4 | OAMF_BANK1
	db $80

.frame_55
	frame_oam -32, -24, $1a, 7 | OAMF_BANK1
	frame_oam -32,  -8, $1e, 7 | OAMF_BANK1
	frame_oam -32, -16, $24, 7 | OAMF_BANK1
	frame_oam -16, -16, $20, 7 | OAMF_BANK1
	frame_oam -20,  -8, $22, 7 | OAMF_BANK1
	frame_oam   0, -17, $04, 4 | OAMF_BANK1
	frame_oam   0,  -9, $06, 4 | OAMF_BANK1
	frame_oam -16, -13, $00, 4 | OAMF_BANK1
	frame_oam -16,  -5, $02, 4 | OAMF_BANK1
	db $80

.frame_56
	frame_oam -32, -24, $1a, 7 | OAMF_BANK1
	frame_oam -32,  -8, $1e, 7 | OAMF_BANK1
	frame_oam -16, -16, $28, 7 | OAMF_BANK1
	frame_oam -32, -16, $26, 7 | OAMF_BANK1
	frame_oam -20,  -8, $22, 7 | OAMF_BANK1
	frame_oam   0, -17, $04, 4 | OAMF_BANK1
	frame_oam   0,  -9, $06, 4 | OAMF_BANK1
	frame_oam -16, -13, $00, 4 | OAMF_BANK1
	frame_oam -16,  -5, $02, 4 | OAMF_BANK1
	db $80

.frame_57
	frame_oam -32,   0, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $1c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -6, $2a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26, -14, $2c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -11, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -19, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_58
	frame_oam -32,   0, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $24, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -6, $2a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26, -14, $2c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -11, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -19, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_59
	frame_oam -32,   0, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $26, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -6, $2e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26, -14, $2c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -11, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -19, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_60
	frame_oam -32,  -2, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -10, $1c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -18, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -10, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -18, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -9, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -17, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_61
	frame_oam -32,  -2, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -18, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -10, $24, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -10, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -18, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -9, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -17, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_62
	frame_oam -32,  -2, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -18, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -10, $28, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -10, $26, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -18, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -9, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -17, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_63
	frame_oam -32,  -2, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -10, $1c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -18, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -10, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -18, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_64
	frame_oam -32,  -2, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -18, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -10, $24, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -10, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -18, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_65
	frame_oam -32,  -2, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -18, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -10, $28, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -10, $26, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -18, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_66
	frame_oam -32,   0, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $1c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -6, $2a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26, -14, $2c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -9, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -17, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_67
	frame_oam -32,   0, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $24, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -6, $2a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26, -14, $2c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -9, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -17, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_68
	frame_oam -32,   0, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $26, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -6, $2e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26, -14, $2c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -9, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -17, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_69
	frame_oam   0, -11, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -19, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   2, $0c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -6, $0e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -14, $10, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_70
	frame_oam -32,   0, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $1c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -16, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -9, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -17, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_71
	frame_oam -32,   0, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $24, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -16, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -9, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -17, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_72
	frame_oam -32,   0, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $28, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $26, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -16, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -9, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -17, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_73
	frame_oam -32,   2, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -6, $1c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -14, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -6, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -14, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -11, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -19, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_74
	frame_oam   0,  10, $34, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2,   2, $36, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   2, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -6, $1c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -14, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -6, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -14, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -9, $04, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -17, $06, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -9, $08, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -17, $0a, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_75
	frame_oam   0,   8, $38, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2,   0, $3a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $1c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -16, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $30, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $32, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -11, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -19, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_76
	frame_oam   0,   8, $38, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2,   0, $3a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $24, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -16, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $30, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $32, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -11, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -19, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_77
	frame_oam   0,   8, $38, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2,   0, $3a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $28, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $26, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $30, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $32, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -16, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -11, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -19, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_78
	frame_oam   0,   6, $3c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2,  -2, $3e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -10, $1c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -10, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -18, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -2, $30, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -18, $32, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $00, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $02, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -9, $04, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -17, $06, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_79
	frame_oam   0,   6, $3c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2,  -2, $3e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -10, $24, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -10, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -18, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -2, $30, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -18, $32, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $00, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $02, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -9, $04, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -17, $06, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_80
	frame_oam   0,   6, $3c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2,  -2, $3e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -10, $28, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -10, $26, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -2, $30, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -18, $32, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -18, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $00, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $02, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -9, $04, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -17, $06, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_81
	frame_oam   0,   6, $34, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2,  -2, $36, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -10, $1c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -10, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -18, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -2, $30, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -18, $32, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_82
	frame_oam   0,   6, $34, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2,  -2, $36, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -10, $24, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -10, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -18, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -2, $30, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -18, $32, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_83
	frame_oam   0,   6, $34, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2,  -2, $36, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -10, $28, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -10, $26, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -2, $30, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -18, $32, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -18, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_84
	frame_oam   0,   8, $38, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2,   0, $3a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $1c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -16, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $30, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $32, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -9, $08, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -17, $0a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $00, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $02, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_85
	frame_oam   0,   8, $38, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2,   0, $3a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $24, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -16, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $30, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $32, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -9, $08, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -17, $0a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $00, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $02, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_86
	frame_oam   0,   8, $38, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2,   0, $3a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $28, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $26, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $30, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $32, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -16, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -9, $08, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -17, $0a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $00, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $02, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_87
	frame_oam   0,  10, $3c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2,   2, $3e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   2, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -6, $1c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -14, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -6, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -14, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -11, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -19, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -15, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_88
	frame_oam -32,   2, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -6, $1c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -14, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -6, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -14, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -9, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -17, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -9, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -17, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_89
	frame_oam -32,   0, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $1c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -16, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -11, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -19, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_90
	frame_oam -32,   0, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $24, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $20, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -16, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -11, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -19, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_91
	frame_oam -32,   0, $1a, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $1e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $28, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $26, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -16, $22, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -7, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -15, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -11, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -19, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_92
	frame_oam -16,  -4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_18a5ae::
	dw .frame_0
	dw .frame_1

.frame_0
	frame_oam   0,  -8, $c4, 7 | OAMF_BANK1
	frame_oam -16, -12, $c0, 7 | OAMF_BANK1
	frame_oam -16,  -4, $c2, 7 | OAMF_BANK1
	db $80

.frame_1
	frame_oam   0,  -8, $c4, 6 | OAMF_BANK1
	frame_oam -16, -12, $c0, 6 | OAMF_BANK1
	frame_oam -16,  -4, $c2, 6 | OAMF_BANK1
	db $80

OAM_18a5cc::
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
	frame_oam -16,  -8, $c0, 7 | OAMF_BANK1
	frame_oam -16,   0, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -16,  -8, $c2, 7 | OAMF_BANK1
	frame_oam -16,   0, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -16,  -8, $c4, 7 | OAMF_BANK1
	frame_oam -16,   0, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -16,  -8, $c6, 7 | OAMF_BANK1
	frame_oam -16,  -1, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -16,  -8, $c8, 7 | OAMF_BANK1
	frame_oam -16,  -1, $c8, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16,  -8, $ca, 7 | OAMF_BANK1
	frame_oam -16,   0, $ca, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -16,  -8, $c4, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   0, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_7
	frame_oam -16,   0, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $c2, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_8
	frame_oam -16, -12, $cc, 7 | OAMF_BANK1
	frame_oam -16,  -4, $ce, 7 | OAMF_BANK1
	frame_oam -16,   4, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -16, -12, $d0, 7 | OAMF_BANK1
	frame_oam -16,  -4, $d2, 7 | OAMF_BANK1
	frame_oam -16,   4, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_18a642::
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

.frame_0
	frame_oam -16,  -8, $80, 6 | OAMF_BANK1
	frame_oam -16,   0, $82, 6 | OAMF_BANK1
	frame_oam -12,   8, $84, 6 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,  -8, $86, 6 | OAMF_BANK1
	frame_oam -16,   0, $88, 6 | OAMF_BANK1
	frame_oam -20,   8, $8a, 6 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,   0, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12, -16, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -16,   0, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $88, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -16, $8a, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -13,  -8, $8c, 6 | OAMF_BANK1
	frame_oam -13,   0, $8e, 6 | OAMF_BANK1
	frame_oam -29,  -1, $90, 6 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -13,   0, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $8e, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -7, $90, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -15,  -8, $92, 6 | OAMF_BANK1
	frame_oam -15,  -1, $92, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -16,  -8, $94, 6 | OAMF_BANK1
	frame_oam -16,   0, $94, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -4, $96, 6 | OAMF_BANK1
	db $80

.frame_8
	frame_oam  -4,  -8, $98, 6 | OAMF_BANK1
	frame_oam  -4,   0, $9a, 6 | OAMF_BANK1
	db $80

.frame_9
	frame_oam  -8,  -8, $9c, 6 | OAMF_BANK1
	frame_oam  -8,   0, $9e, 6 | OAMF_BANK1
	db $80

.frame_10
	frame_oam  -4,   0, $98, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -4,  -8, $9a, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam  -8,   0, $9c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -8, $9e, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam  -7,  -8, $a0, 6 | OAMF_BANK1
	frame_oam  -7,   0, $a2, 6 | OAMF_BANK1
	db $80

.frame_13
	frame_oam  -7,   0, $a0, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,  -8, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam  -8,  -8, $a4, 6 | OAMF_BANK1
	frame_oam  -8,   0, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_18a703::
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

.frame_0
	frame_oam -21,   3, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -21,  -4, $82, 6 | OAMF_BANK1
	frame_oam -21, -12, $80, 6 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -22,   3, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22,  -4, $86, 6 | OAMF_BANK1
	frame_oam -22, -12, $84, 6 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -20,   3, $88, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,  -4, $8a, 6 | OAMF_BANK1
	frame_oam -20, -12, $88, 6 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -19,   3, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,  -4, $8e, 6 | OAMF_BANK1
	frame_oam -19, -12, $8c, 6 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -16,   3, $90, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $92, 6 | OAMF_BANK1
	frame_oam -16, -12, $90, 6 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16,  -1, $96, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $96, 6 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16,  -1, $94, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $94, 6 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16,   0, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $a4, 6 | OAMF_BANK1
	db $80

.frame_8
	frame_oam  -8,  -4, $a6, 6 | OAMF_BANK1
	db $80

.frame_9
	frame_oam  -8,  -3, $a8, 6 | OAMF_BANK1
	db $80

.frame_10
	frame_oam  -4,  -4, $aa, 2 | OAMF_BANK1
	db $80

.frame_11
	frame_oam  -4,  -4, $ac, 2 | OAMF_BANK1
	db $80

.frame_12
	frame_oam  -4,  -4, $ae, 2 | OAMF_BANK1
	db $80

.frame_13
	frame_oam  -4,  -4, $b0, 2 | OAMF_BANK1
	db $80

.frame_14
	frame_oam -23,  -4, $9e, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,  -4, $9e, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -15,   4, $9c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -12, $9c, 6 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_15
	frame_oam -23,  -4, $9e, 6 | OAMF_BANK1
	frame_oam  -7,  -4, $9e, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -15, -12, $9c, 6 | OAMF_BANK1
	frame_oam -15,   4, $9c, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_16
	frame_oam -16,   0, $9a, 6 | OAMF_BANK1
	frame_oam -16,  -8, $98, 6 | OAMF_BANK1
	db $80

.frame_17
	frame_oam -15,  -1, $96, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -15,  -8, $96, 6 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_18
	frame_oam -16,  -9, $9a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -1, $98, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -16,  -1, $a0, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -4, $a2, 6 | OAMF_BANK1
	frame_oam -16,  -8, $a0, 6 | OAMF_BANK1
	db $80

.frame_20
	frame_oam  -4,  -4, $b2, 2 | OAMF_BANK1
	db $80

.frame_21
	frame_oam  -4,  -4, $b4, 2 | OAMF_BANK1
	db $80

OAM_18a7fd::
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7

.frame_0
	frame_oam -16,  -8, $00, 4 | OAMF_BANK1
	frame_oam -16,  -1, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -16,  -8, $02, 4 | OAMF_BANK1
	frame_oam -16,  -1, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -16,  -8, $04, 4 | OAMF_BANK1
	frame_oam -16,  -1, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -16,  -8, $06, 4 | OAMF_BANK1
	frame_oam -16,  -1, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -28, -12, $08, 4 | OAMF_BANK1
	frame_oam -28,  -4, $0a, 4 | OAMF_BANK1
	frame_oam -12, -12, $0c, 4 | OAMF_BANK1
	frame_oam -12,  -4, $0e, 4 | OAMF_BANK1
	frame_oam -28,   3, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,   3, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -28, -12, $10, 4 | OAMF_BANK1
	frame_oam -28,  -4, $12, 4 | OAMF_BANK1
	frame_oam -28,   3, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12, -12, $14, 4 | OAMF_BANK1
	frame_oam -12,  -4, $16, 4 | OAMF_BANK1
	frame_oam -12,   3, $14, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -28, -12, $18, 4 | OAMF_BANK1
	frame_oam -28,  -4, $1a, 4 | OAMF_BANK1
	frame_oam -28,   3, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12, -12, $1c, 4 | OAMF_BANK1
	frame_oam -12,  -4, $1e, 4 | OAMF_BANK1
	frame_oam -12,   3, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -28,   3, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,  -5, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28, -12, $18, 4 | OAMF_BANK1
	frame_oam -12,   3, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,  -5, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12, -12, $1c, 4 | OAMF_BANK1
	db $80

OAM_18a895::
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

.frame_0
	frame_oam  -8,  -6, $c0, 7 | OAMF_BANK1
	frame_oam  -8,   2, $c2, 7 | OAMF_BANK1
	db $80

.frame_1
	frame_oam  -8,  -6, $c4, 7 | OAMF_BANK1
	frame_oam  -8,   2, $c6, 7 | OAMF_BANK1
	db $80

.frame_2
	frame_oam  -8,  -6, $c8, 7 | OAMF_BANK1
	frame_oam  -8,   2, $ca, 7 | OAMF_BANK1
	db $80

.frame_3
	frame_oam  -8,  -2, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8, -10, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam  -8,  -2, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8, -10, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam  -8,  -2, $c8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8, -10, $ca, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam  -7,  -7, $cc, 7 | OAMF_BANK1
	frame_oam  -7,   1, $ce, 7 | OAMF_BANK1
	db $80

.frame_7
	frame_oam  -6,  -8, $d0, 7 | OAMF_BANK1
	frame_oam  -6,   0, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam  -7,  -1, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,  -9, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -16, -12, $d2, 7 | OAMF_BANK1
	frame_oam -16,  -4, $d4, 7 | OAMF_BANK1
	frame_oam -16,   4, $d6, 7 | OAMF_BANK1
	frame_oam   0, -12, $d2, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,  -4, $d4, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,   4, $d6, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_10
	frame_oam -16,  -4, $da, 7 | OAMF_BANK1
	frame_oam -16,   4, $dc, 7 | OAMF_BANK1
	frame_oam   0,  -4, $da, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,   4, $dc, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16, -11, $d2, 7 | OAMF_BANK1
	frame_oam   0, -11, $d2, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_11
	frame_oam -16, -12, $d2, 7 | OAMF_BANK1
	frame_oam   0, -12, $d2, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -4, $de, 7 | OAMF_BANK1
	frame_oam   0,  -4, $de, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   4, $e0, 7 | OAMF_BANK1
	frame_oam   0,   4, $e0, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_12
	frame_oam -16,   4, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $d4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   4, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0,  -4, $d4, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0, -12, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_13
	frame_oam -16,  -4, $da, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $dc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -4, $da, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0, -12, $dc, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   3, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   3, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_14
	frame_oam   0,   4, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   4, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -4, $de, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -4, $de, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -12, $e0, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -12, $e0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -14, -11, $ea, 7 | OAMF_BANK1
	frame_oam -14,  -3, $ec, 7 | OAMF_BANK1
	frame_oam -14,   5, $ee, 7 | OAMF_BANK1
	frame_oam   2, -11, $f2, 7 | OAMF_BANK1
	frame_oam   2,  -3, $f4, 7 | OAMF_BANK1
	frame_oam   2,   5, $f6, 7 | OAMF_BANK1
	db $80

.frame_16
	frame_oam -19, -12, $e2, 7 | OAMF_BANK1
	frame_oam -19,  -4, $e4, 7 | OAMF_BANK1
	frame_oam -19,   4, $e2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3, -12, $e6, 7 | OAMF_BANK1
	frame_oam  -3,  -4, $e8, 7 | OAMF_BANK1
	frame_oam  -3,   4, $e6, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -14,   3, $ea, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,  -5, $ec, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14, -13, $ee, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   2,   3, $f2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   2,  -5, $f4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   2, -13, $f6, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -16, -12, $d2, 7 | OAMF_BANK1
	frame_oam -16,   4, $d6, 7 | OAMF_BANK1
	frame_oam   0, -12, $d2, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,   4, $d6, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -4, $f8, 7 | OAMF_BANK1
	frame_oam   0,  -4, $f8, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_19
	frame_oam -16, -12, $d2, 7 | OAMF_BANK1
	frame_oam   0, -12, $d2, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   4, $e0, 7 | OAMF_BANK1
	frame_oam   0,   4, $e0, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -4, $f8, 7 | OAMF_BANK1
	frame_oam   0,  -4, $f8, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_20
	frame_oam -16,   4, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   4, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0, -12, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -4, $f8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -4, $f8, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_21
	frame_oam -16,   4, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   4, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -12, $e0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -12, $e0, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -4, $f8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -4, $f8, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_22
	frame_oam -16, -11, $fa, 7 | OAMF_BANK1
	frame_oam -16,  -3, $fc, 7 | OAMF_BANK1
	frame_oam -16,   5, $fe, 7 | OAMF_BANK1
	frame_oam   0, -11, $fa, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,  -3, $fc, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,   5, $fe, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_23
	frame_oam -16,   3, $fa, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -5, $fc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -13, $fe, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   3, $fa, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0,  -5, $fc, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0, -13, $fe, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_24
	frame_oam -16, -11, $d2, 7 | OAMF_BANK1
	frame_oam   0, -11, $d2, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   4, $dc, 7 | OAMF_BANK1
	frame_oam   0,   4, $dc, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -4, $f0, 7 | OAMF_BANK1
	frame_oam   0,  -4, $f0, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_25
	frame_oam -16, -12, $dc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -12, $dc, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   3, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   3, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -4, $f0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -4, $f0, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_26
	frame_oam  -8,  -2, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -9, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -16,   2, $fa, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -5, $fc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $fe, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   2, $fa, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0,  -5, $fc, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0, -12, $fe, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_28
	frame_oam -16,   3, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $d4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -11, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   3, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0,  -4, $d4, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0, -11, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

OAM_18ab04::
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7

.frame_0
	frame_oam -16,  -8, $c0, 7 | OAMF_BANK1
	frame_oam -16,  -1, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -16,  -8, $c2, 7 | OAMF_BANK1
	frame_oam -16,  -1, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -16,  -8, $c4, 7 | OAMF_BANK1
	frame_oam -16,  -1, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -16,  -8, $c6, 7 | OAMF_BANK1
	frame_oam -16,  -1, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -16,  -8, $c8, 7 | OAMF_BANK1
	frame_oam -16,  -1, $c8, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16,  -8, $ca, 7 | OAMF_BANK1
	frame_oam -16,  -1, $ca, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -16,  -8, $cc, 7 | OAMF_BANK1
	frame_oam -16,   0, $ce, 7 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16,  -8, $d0, 7 | OAMF_BANK1
	frame_oam -16,   0, $d2, 7 | OAMF_BANK1
	db $80

OAM_18ab5c::
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3

.frame_0
	frame_oam -16,  -8, $80, 6 | OAMF_BANK1
	frame_oam -16,   0, $82, 6 | OAMF_BANK1
	frame_oam -32,  -8, $8e, 6 | OAMF_BANK1
	frame_oam -32,   0, $90, 6 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -17,  -8, $84, 6 | OAMF_BANK1
	frame_oam -17,   0, $84, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_2
	frame_oam -25, -12, $86, 6 | OAMF_BANK1
	frame_oam  -9,   4, $86, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -9, -12, $88, 6 | OAMF_BANK1
	frame_oam -25,   4, $88, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_3
	frame_oam -25, -16, $8a, 6 | OAMF_BANK1
	frame_oam  -9,   8, $8a, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -9, -16, $8c, 6 | OAMF_BANK1
	frame_oam -25,   8, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

OAM_18aba0::
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7

.frame_0
	frame_oam -32, -12, $80, 6 | OAMF_BANK1
	frame_oam -32,  -4, $82, 6 | OAMF_BANK1
	frame_oam -32,   4, $84, 6 | OAMF_BANK1
	frame_oam -16, -12, $a0, 6 | OAMF_BANK1
	frame_oam -16,  -4, $a2, 6 | OAMF_BANK1
	frame_oam -16,   4, $a4, 6 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -32, -12, $86, 6 | OAMF_BANK1
	frame_oam -32,  -4, $88, 6 | OAMF_BANK1
	frame_oam -32,   4, $8a, 6 | OAMF_BANK1
	frame_oam -16, -12, $a6, 6 | OAMF_BANK1
	frame_oam -16,  -4, $a8, 6 | OAMF_BANK1
	frame_oam -16,   4, $aa, 6 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -32, -12, $8c, 6 | OAMF_BANK1
	frame_oam -32,  -4, $8e, 6 | OAMF_BANK1
	frame_oam -32,   4, $90, 6 | OAMF_BANK1
	frame_oam -16, -12, $ac, 6 | OAMF_BANK1
	frame_oam -16,  -4, $ae, 6 | OAMF_BANK1
	frame_oam -16,   4, $b0, 6 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -32, -12, $92, 6 | OAMF_BANK1
	frame_oam -32,  -4, $94, 6 | OAMF_BANK1
	frame_oam -32,   4, $96, 6 | OAMF_BANK1
	frame_oam -16, -12, $b2, 6 | OAMF_BANK1
	frame_oam -16,  -4, $b4, 6 | OAMF_BANK1
	frame_oam -16,   4, $b6, 6 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -16,  -8, $98, 6 | OAMF_BANK1
	frame_oam -16,   0, $9a, 6 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16,  -8, $9c, 6 | OAMF_BANK1
	frame_oam -16,   0, $9e, 6 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16,  -8, $b8, 6 | OAMF_BANK1
	frame_oam -16,   0, $ba, 6 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16,  -8, $bc, 6 | OAMF_BANK1
	frame_oam -16,   0, $be, 6 | OAMF_BANK1
	db $80
