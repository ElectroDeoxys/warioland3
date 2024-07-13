OAM_d4e26:
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
	frame_oam -16,  -8, $90, 7
	frame_oam -16,   0, $92, 7
	frame_oam -16, -12, $ba, 0
	frame_oam -16,   4, $ba, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $d6, 0
	db $80

.frame_1
	frame_oam -16,  -8, $90, 7
	frame_oam -16,   0, $92, 7
	frame_oam -16, -12, $b6, 0
	frame_oam -16,   4, $b6, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $d8, 0
	db $80

.frame_2
	frame_oam -16,  -8, $94, 7
	frame_oam -16,   0, $96, 7
	frame_oam -16, -12, $ba, 0
	frame_oam -16,   4, $ba, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $d6, 0
	db $80

.frame_3
	frame_oam -16,  -8, $94, 7
	frame_oam -16,   0, $96, 7
	frame_oam -16, -12, $b6, 0
	frame_oam -16,   4, $b6, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $d8, 0
	db $80

.frame_4
	frame_oam -16,  -8, $98, 7
	frame_oam -16,   0, $9a, 7
	frame_oam -16, -12, $ba, 0
	frame_oam -16,   4, $ba, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $d6, 0
	db $80

.frame_5
	frame_oam -16,  -8, $98, 7
	frame_oam -16,   0, $9a, 7
	frame_oam -16, -12, $b6, 0
	frame_oam -16,   4, $b6, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $d8, 0
	db $80

.frame_6
	frame_oam -16,  -8, $9c, 7
	frame_oam -16,   0, $9e, 7
	frame_oam -16, -12, $ba, 0
	frame_oam -16,   4, $ba, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $d6, 0
	db $80

.frame_7
	frame_oam -16,  -8, $9c, 7
	frame_oam -16,   0, $9e, 7
	frame_oam -16, -12, $b6, 0
	frame_oam -16,   4, $b6, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $d8, 0
	db $80

.frame_8
	frame_oam -34, -12, $d0, 3
	frame_oam -34,  -4, $d2, 3
	frame_oam -34,   4, $d4, 3
	frame_oam -18, -14, $f0, 3
	frame_oam -18,  -6, $f2, 3
	frame_oam -18,   2, $f4, 3
	frame_oam -18,  10, $f6, 3
	frame_oam -34,  50, $da, 3
	frame_oam -34,  58, $dc, 3
	frame_oam -34,  66, $de, 3
	frame_oam -18,  46, $f8, 3
	frame_oam -18,  54, $fa, 3
	frame_oam -18,  62, $fc, 3
	frame_oam -18,  70, $fe, 3
	db $80

.frame_9
	frame_oam -16,  -8, $c0, 4
	frame_oam -16,   0, $c2, 4
	db $80

.frame_10
	frame_oam -16,  -8, $c4, 2
	frame_oam -16,   0, $c6, 2
	db $80

.frame_11
	frame_oam -16,  -8, $c8, 6
	frame_oam -16,   0, $ca, 6
	db $80

.frame_12
	frame_oam -16,  -8, $cc, 5
	frame_oam -16,   0, $ce, 5
	db $80

.frame_13
	frame_oam -16,  -8, $e0, 4
	frame_oam -16,   0, $e2, 4
	db $80

.frame_14
	frame_oam -22, -16, $e4, 0
	frame_oam -16,  -8, $e6, 0
	frame_oam -16,   0, $e8, 0
	frame_oam -22,   8, $ea, 0
	db $80

.frame_15
	frame_oam -24, -16, $e4, 0
	frame_oam -18,  -8, $e6, 0
	frame_oam -18,   0, $e8, 0
	frame_oam -24,   8, $ea, 0
	db $80

.frame_16
	frame_oam -25, -16, $e4, 0
	frame_oam -19,  -8, $e6, 0
	frame_oam -19,   0, $e8, 0
	frame_oam -25,   8, $ea, 0
	db $80

.frame_17
	frame_oam -20, -16, $e4, 0
	frame_oam -14,  -8, $e6, 0
	frame_oam -14,   0, $e8, 0
	frame_oam -20,   8, $ea, 0
	db $80

.frame_18
	frame_oam -19, -16, $e4, 0
	frame_oam -13,  -8, $e6, 0
	frame_oam -13,   0, $e8, 0
	frame_oam -19,   8, $ea, 0
	db $80

.frame_19
	frame_oam -16, -16, $e0, 0 | OAMF_BANK1
	frame_oam -16,  -8, $e2, 0 | OAMF_BANK1
	frame_oam -16,   0, $e4, 0 | OAMF_BANK1
	frame_oam -16,   8, $e6, 0 | OAMF_BANK1
	db $80

.frame_20
	frame_oam -18, -16, $e0, 0 | OAMF_BANK1
	frame_oam -18,  -8, $e2, 0 | OAMF_BANK1
	frame_oam -18,   0, $e4, 0 | OAMF_BANK1
	frame_oam -18,   8, $e6, 0 | OAMF_BANK1
	db $80

.frame_21
	frame_oam -19, -16, $e0, 0 | OAMF_BANK1
	frame_oam -19,  -8, $e2, 0 | OAMF_BANK1
	frame_oam -19,   0, $e4, 0 | OAMF_BANK1
	frame_oam -19,   8, $e6, 0 | OAMF_BANK1
	db $80

.frame_22
	frame_oam -14, -16, $e0, 0 | OAMF_BANK1
	frame_oam -14,  -8, $e2, 0 | OAMF_BANK1
	frame_oam -14,   0, $e4, 0 | OAMF_BANK1
	frame_oam -14,   8, $e6, 0 | OAMF_BANK1
	db $80

.frame_23
	frame_oam -13, -16, $e0, 0 | OAMF_BANK1
	frame_oam -13,  -8, $e2, 0 | OAMF_BANK1
	frame_oam -13,   0, $e4, 0 | OAMF_BANK1
	frame_oam -13,   8, $e6, 0 | OAMF_BANK1
	db $80

.frame_24
	frame_oam -16,  -8, $ec, 4
	frame_oam -16,   0, $ee, 4
	db $80

.frame_25
	frame_oam -16,  -8, $ec, 5
	frame_oam -16,   0, $ee, 5
	db $80

.frame_26
	frame_oam -16,  -8, $ec, 6
	frame_oam -16,   0, $ee, 6
	db $80

.frame_27
	frame_oam -16,  -8, $ec, 2
	frame_oam -16,   0, $ee, 2
	db $80

.frame_28
	frame_oam -16,  -8, $e8, 7 | OAMF_BANK1
	frame_oam -16,  -1, $e8, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80
