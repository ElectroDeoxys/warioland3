	INCROM $18c000, $18c806

OAM_18c806: ; 18c806 (63:4806)
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

.frame_0
	frame_oam -16,  -8, $80, 6 | OAMF_BANK1
	frame_oam -16,   0, $82, 6 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,  -8, $84, 6 | OAMF_BANK1
	frame_oam -16,   0, $86, 6 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,  -8, $88, 6 | OAMF_BANK1
	frame_oam -16,   0, $8a, 6 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,  -8, $8c, 6 | OAMF_BANK1
	frame_oam -16,   0, $8e, 6 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -16,  -8, $90, 6 | OAMF_BANK1
	frame_oam -16,   0, $92, 6 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16,  -8, $94, 6 | OAMF_BANK1
	frame_oam -16,   0, $96, 6 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16,  -8, $a0, 6 | OAMF_BANK1
	frame_oam -16,   0, $a2, 6 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16,  -8, $a4, 6 | OAMF_BANK1
	frame_oam -16,   0, $a6, 6 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -16,  -8, $a8, 6 | OAMF_BANK1
	frame_oam -16,   0, $aa, 6 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -16,  -8, $ac, 6 | OAMF_BANK1
	frame_oam -16,   0, $ae, 6 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -16,  -8, $b0, 6 | OAMF_BANK1
	frame_oam -16,   0, $b2, 6 | OAMF_BANK1
	db $80

.frame_11
	frame_oam -16,  -8, $b4, 6 | OAMF_BANK1
	frame_oam -16,   0, $b6, 6 | OAMF_BANK1
	db $80
; 0x18c88a

OAM_18c88a: ; 18c88a (63:488a)
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

.frame_0
	frame_oam -16, -16, $0c, 4 | OAMF_BANK1
	frame_oam -16,  -8, $0e, 4 | OAMF_BANK1
	frame_oam -15,   8, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $06, 3 | OAMF_BANK1
	frame_oam -32,   0, $08, 3 | OAMF_BANK1
	frame_oam -48,  -8, $02, 3 | OAMF_BANK1
	frame_oam -48,   0, $04, 3 | OAMF_BANK1
	frame_oam -37, -16, $00, 3 | OAMF_BANK1
	frame_oam -36,   8, $0a, 3 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,   8, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -16, $0c, 4 | OAMF_BANK1
	frame_oam -16,  -8, $0e, 4 | OAMF_BANK1
	frame_oam -32,   0, $06, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $08, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,   0, $02, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  -8, $04, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -37,   8, $00, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -36, -16, $0a, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -32,  -8, $06, 3 | OAMF_BANK1
	frame_oam -32,   0, $08, 3 | OAMF_BANK1
	frame_oam -48,  -8, $02, 3 | OAMF_BANK1
	frame_oam -48,   0, $04, 3 | OAMF_BANK1
	frame_oam -37, -16, $00, 3 | OAMF_BANK1
	frame_oam -36,   8, $0a, 3 | OAMF_BANK1
	frame_oam -20,  -8, $14, 4 | OAMF_BANK1
	frame_oam  -4,  -8, $16, 4 | OAMF_BANK1
	frame_oam -10, -16, $12, 4 | OAMF_BANK1
	frame_oam -26, -16, $10, 4 | OAMF_BANK1
	frame_oam -20,   0, $14, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -4,   0, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,   8, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26,   8, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -37,   8, $00, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -36, -16, $0a, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $20, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $22, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,   0, $02, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  -8, $04, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,  -8, $1c, 4 | OAMF_BANK1
	frame_oam  -7,  -8, $1e, 4 | OAMF_BANK1
	frame_oam  -9, -16, $1a, 4 | OAMF_BANK1
	frame_oam -25, -16, $18, 4 | OAMF_BANK1
	frame_oam -23,   0, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,   0, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -9,   8, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -25,   8, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -32,   0, $06, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $08, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,   0, $02, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  -8, $04, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -37,   8, $00, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -36, -16, $0a, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,  -8, $14, 4 | OAMF_BANK1
	frame_oam  -4,  -8, $16, 4 | OAMF_BANK1
	frame_oam -10, -16, $12, 4 | OAMF_BANK1
	frame_oam -26, -16, $10, 4 | OAMF_BANK1
	frame_oam -20,   0, $14, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -4,   0, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,   8, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26,   8, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -15, -16, $0c, 4 | OAMF_BANK1
	frame_oam -16,  -8, $0e, 4 | OAMF_BANK1
	frame_oam -16,   8, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $c6, 3 | OAMF_BANK1
	frame_oam -32,   0, $c8, 3 | OAMF_BANK1
	frame_oam -48,  -8, $c2, 3 | OAMF_BANK1
	frame_oam -48,   0, $c4, 3 | OAMF_BANK1
	frame_oam -36, -16, $c0, 3 | OAMF_BANK1
	frame_oam -37,   8, $ca, 3 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16, -16, $0c, 4 | OAMF_BANK1
	frame_oam -16,  -8, $0e, 4 | OAMF_BANK1
	frame_oam -15,   8, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $d2, 3 | OAMF_BANK1
	frame_oam -32,   0, $d4, 3 | OAMF_BANK1
	frame_oam -48,  -8, $ce, 3 | OAMF_BANK1
	frame_oam -48,   0, $d0, 3 | OAMF_BANK1
	frame_oam -37, -16, $cc, 3 | OAMF_BANK1
	frame_oam -36,   8, $d6, 3 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -15,   8, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $0c, 4 | OAMF_BANK1
	frame_oam -16,  -8, $0e, 4 | OAMF_BANK1
	frame_oam -32,   0, $c6, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $c8, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,   0, $c2, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  -8, $c4, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -36,   8, $c0, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -37, -16, $ca, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -16,   8, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -16, $0c, 4 | OAMF_BANK1
	frame_oam -16,  -8, $0e, 4 | OAMF_BANK1
	frame_oam -32,   0, $d2, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $d4, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,   0, $ce, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  -8, $d0, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -37,   8, $cc, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -36, -16, $d6, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -32,  -8, $e2, 3 | OAMF_BANK1
	frame_oam -32,   0, $e4, 3 | OAMF_BANK1
	frame_oam -36, -16, $e0, 3 | OAMF_BANK1
	frame_oam -48,  -8, $f4, 3 | OAMF_BANK1
	frame_oam -36,   8, $e0, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,   0, $f4, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,  -8, $ee, 4 | OAMF_BANK1
	frame_oam  -7,  -8, $f0, 4 | OAMF_BANK1
	frame_oam -14, -16, $ea, 4 | OAMF_BANK1
	frame_oam   1, -16, $ec, 4 | OAMF_BANK1
	frame_oam -23,   0, $ee, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,   0, $f0, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,   8, $ea, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   1,   8, $ec, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -35, -16, $e0, 3 | OAMF_BANK1
	frame_oam -37,   8, $e0, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -8, $f0, 4 | OAMF_BANK1
	frame_oam -15, -16, $ea, 4 | OAMF_BANK1
	frame_oam   0, -16, $ec, 4 | OAMF_BANK1
	frame_oam  -8,   0, $f0, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   8, $ea, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   8, $ec, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -34,  -8, $e6, 3 | OAMF_BANK1
	frame_oam -36,   0, $e8, 3 | OAMF_BANK1
	frame_oam -24,  -8, $f2, 4 | OAMF_BANK1
	frame_oam -24,   0, $f2, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -35,   8, $e0, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -37, -16, $e0, 3 | OAMF_BANK1
	frame_oam  -8,   0, $f0, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   8, $ea, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   8, $ec, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -8, $f0, 4 | OAMF_BANK1
	frame_oam -15, -16, $ea, 4 | OAMF_BANK1
	frame_oam   0, -16, $ec, 4 | OAMF_BANK1
	frame_oam -34,   0, $e6, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -36,  -8, $e8, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,   0, $f2, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -8, $f2, 4 | OAMF_BANK1
	db $80

.frame_12
	frame_oam -16, -16, $f6, 4 | OAMF_BANK1
	frame_oam -16,  -8, $f8, 4 | OAMF_BANK1
	frame_oam -15,   8, $f6, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $f8, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $06, 3 | OAMF_BANK1
	frame_oam -32,   0, $08, 3 | OAMF_BANK1
	frame_oam -48,  -8, $02, 3 | OAMF_BANK1
	frame_oam -48,   0, $04, 3 | OAMF_BANK1
	frame_oam -37, -16, $00, 3 | OAMF_BANK1
	frame_oam -36,   8, $0a, 3 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -32,   0, $06, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $08, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,   0, $02, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  -8, $04, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -37,   8, $00, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -36, -16, $0a, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -16, $f6, 4 | OAMF_BANK1
	frame_oam -16,  -8, $f8, 4 | OAMF_BANK1
	frame_oam -16,   8, $f6, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $f8, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -32,  -8, $c6, 3 | OAMF_BANK1
	frame_oam -32,   0, $c8, 3 | OAMF_BANK1
	frame_oam -48,  -8, $c2, 3 | OAMF_BANK1
	frame_oam -48,   0, $c4, 3 | OAMF_BANK1
	frame_oam -36, -16, $c0, 3 | OAMF_BANK1
	frame_oam -37,   8, $ca, 3 | OAMF_BANK1
	frame_oam -15, -16, $f6, 4 | OAMF_BANK1
	frame_oam -16,  -8, $f8, 4 | OAMF_BANK1
	frame_oam -16,   8, $f6, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $f8, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -32,  -8, $d2, 3 | OAMF_BANK1
	frame_oam -32,   0, $d4, 3 | OAMF_BANK1
	frame_oam -48,  -8, $ce, 3 | OAMF_BANK1
	frame_oam -48,   0, $d0, 3 | OAMF_BANK1
	frame_oam -37, -16, $cc, 3 | OAMF_BANK1
	frame_oam -36,   8, $d6, 3 | OAMF_BANK1
	frame_oam -16, -16, $f6, 4 | OAMF_BANK1
	frame_oam -16,  -8, $f8, 4 | OAMF_BANK1
	frame_oam -15,   8, $f6, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $f8, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -32,   0, $c6, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $c8, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,   0, $c2, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  -8, $c4, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -36,   8, $c0, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -37, -16, $ca, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $f6, 4 | OAMF_BANK1
	frame_oam -16,  -8, $f8, 4 | OAMF_BANK1
	frame_oam -15,   8, $f6, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $f8, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -32,   0, $d2, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $d4, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,   0, $ce, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  -8, $d0, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -37,   8, $cc, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -36, -16, $d6, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -16, $f6, 4 | OAMF_BANK1
	frame_oam -16,  -8, $f8, 4 | OAMF_BANK1
	frame_oam -16,   8, $f6, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $f8, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -32, -12, $24, 7 | OAMF_BANK1
	frame_oam -32,  -4, $26, 6 | OAMF_BANK1
	frame_oam -32,   4, $28, 6 | OAMF_BANK1
	frame_oam -16, -12, $44, 7 | OAMF_BANK1
	frame_oam -16,  -4, $46, 6 | OAMF_BANK1
	frame_oam -16,   4, $48, 6 | OAMF_BANK1
	db $80

.frame_19
	frame_oam -32, -16, $a0, 6 | OAMF_BANK1
	frame_oam -32,  -8, $a2, 6 | OAMF_BANK1
	frame_oam -32,   0, $a4, 6 | OAMF_BANK1
	frame_oam -32,   8, $a6, 6 | OAMF_BANK1
	frame_oam -16, -16, $a8, 6 | OAMF_BANK1
	frame_oam -16,  -8, $aa, 7 | OAMF_BANK1
	frame_oam -16,   0, $ac, 7 | OAMF_BANK1
	frame_oam -16,   8, $ae, 6 | OAMF_BANK1
	db $80

.frame_20
	frame_oam -32, -16, $60, 6 | OAMF_BANK1
	frame_oam -32,  -8, $62, 6 | OAMF_BANK1
	frame_oam -32,   0, $64, 6 | OAMF_BANK1
	frame_oam -32,   8, $66, 6 | OAMF_BANK1
	frame_oam -16, -16, $80, 6 | OAMF_BANK1
	frame_oam -16,  -8, $82, 6 | OAMF_BANK1
	frame_oam -16,   0, $84, 7 | OAMF_BANK1
	frame_oam -16,   8, $86, 7 | OAMF_BANK1
	db $80

.frame_21
	frame_oam -32, -16, $2a, 6 | OAMF_BANK1
	frame_oam -32,  -8, $2c, 6 | OAMF_BANK1
	frame_oam -32,   0, $2e, 6 | OAMF_BANK1
	frame_oam -32,   8, $30, 7 | OAMF_BANK1
	frame_oam -16, -16, $4a, 6 | OAMF_BANK1
	frame_oam -16,  -8, $4c, 6 | OAMF_BANK1
	frame_oam -16,   0, $4e, 6 | OAMF_BANK1
	frame_oam -16,   8, $50, 7 | OAMF_BANK1
	db $80

.frame_22
	frame_oam -32, -16, $68, 6 | OAMF_BANK1
	frame_oam -32,  -8, $6a, 6 | OAMF_BANK1
	frame_oam -32,   0, $6c, 7 | OAMF_BANK1
	frame_oam -32,   8, $6e, 7 | OAMF_BANK1
	frame_oam -16, -16, $88, 6 | OAMF_BANK1
	frame_oam -16,  -8, $8a, 6 | OAMF_BANK1
	frame_oam -16,   0, $8c, 6 | OAMF_BANK1
	frame_oam -16,   8, $8e, 6 | OAMF_BANK1
	db $80

.frame_23
	frame_oam -16,   8, $a0, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -16, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   8, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   0, $aa, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,  -8, $ac, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32, -16, $ae, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_24
	frame_oam -16,   8, $60, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $62, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $64, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -16, $66, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   8, $80, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   0, $82, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,  -8, $84, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32, -16, $86, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_25
	frame_oam -16,   8, $2a, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $2c, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $2e, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -16, $30, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   8, $4a, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   0, $4c, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,  -8, $4e, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32, -16, $50, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_26
	frame_oam -16,   8, $68, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $6a, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $6c, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -16, $6e, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   8, $88, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   0, $8a, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,  -8, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32, -16, $8e, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_27
	frame_oam -48,  -8, $3c, 6 | OAMF_BANK1
	frame_oam -48,   0, $3e, 6 | OAMF_BANK1
	frame_oam -32, -16, $5a, 6 | OAMF_BANK1
	frame_oam -32,  -8, $5c, 6 | OAMF_BANK1
	frame_oam -32,   0, $5e, 6 | OAMF_BANK1
	frame_oam -16, -16, $7a, 6 | OAMF_BANK1
	frame_oam -16,  -8, $7c, 6 | OAMF_BANK1
	frame_oam -16,   0, $7e, 6 | OAMF_BANK1
	db $80

.frame_28
	frame_oam -48,  -4, $bc, 6 | OAMF_BANK1
	frame_oam -48,   4, $be, 6 | OAMF_BANK1
	frame_oam -32, -12, $da, 7 | OAMF_BANK1
	frame_oam -32,  -4, $dc, 6 | OAMF_BANK1
	frame_oam -32,   4, $de, 6 | OAMF_BANK1
	frame_oam -16, -12, $fa, 7 | OAMF_BANK1
	frame_oam -16,  -4, $fc, 6 | OAMF_BANK1
	frame_oam -16,   4, $fe, 6 | OAMF_BANK1
	db $80

.frame_29
	frame_oam -31, -12, $96, 7 | OAMF_BANK1
	frame_oam -31,  -4, $98, 6 | OAMF_BANK1
	frame_oam -31,   4, $9a, 6 | OAMF_BANK1
	frame_oam -15, -12, $b6, 6 | OAMF_BANK1
	frame_oam -15,  -4, $b8, 6 | OAMF_BANK1
	frame_oam -15,   4, $ba, 6 | OAMF_BANK1
	db $80

.frame_30
	frame_oam -32, -12, $70, 7 | OAMF_BANK1
	frame_oam -32,  -4, $72, 6 | OAMF_BANK1
	frame_oam -32,   4, $74, 6 | OAMF_BANK1
	frame_oam -16, -12, $90, 6 | OAMF_BANK1
	frame_oam -16,  -4, $92, 6 | OAMF_BANK1
	frame_oam -16,   4, $94, 6 | OAMF_BANK1
	db $80

.frame_31
	frame_oam -32, -16, $40, 6 | OAMF_BANK1
	frame_oam -32,  -8, $42, 6 | OAMF_BANK1
	frame_oam -32,   0, $76, 7 | OAMF_BANK1
	frame_oam -32,   8, $78, 7 | OAMF_BANK1
	frame_oam -16, -16, $b2, 6 | OAMF_BANK1
	frame_oam -16,  -8, $b4, 7 | OAMF_BANK1
	frame_oam -16,   0, $9c, 7 | OAMF_BANK1
	frame_oam -16,   8, $9e, 6 | OAMF_BANK1
	db $80

.frame_32
	frame_oam -28, -16, $32, 7 | OAMF_BANK1
	frame_oam -28,  -8, $34, 7 | OAMF_BANK1
	frame_oam -28,   0, $36, 7 | OAMF_BANK1
	frame_oam -28,   8, $38, 7 | OAMF_BANK1
	frame_oam -12, -16, $52, 7 | OAMF_BANK1
	frame_oam -12,  -8, $54, 7 | OAMF_BANK1
	frame_oam -12,   0, $56, 7 | OAMF_BANK1
	frame_oam -12,   8, $58, 7 | OAMF_BANK1
	db $80

.frame_33
	frame_oam -32,   4, $24, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -4, $26, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $28, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $44, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $46, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $48, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_34
	frame_oam -32,   8, $a0, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $aa, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $ac, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ae, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_35
	frame_oam -32,   8, $60, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $62, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $64, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $66, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $84, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $86, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_36
	frame_oam -32,   8, $2a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $2c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $2e, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $30, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $4a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $4c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $4e, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $50, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_37
	frame_oam -32,   8, $68, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $6a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $6c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $6e, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $88, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $8a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $8e, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_38
	frame_oam -16, -16, $a0, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -8, $a2, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   0, $a4, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   8, $a6, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32, -16, $a8, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32,  -8, $aa, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32,   0, $ac, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32,   8, $ae, 6 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_39
	frame_oam -16, -16, $60, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -8, $62, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   0, $64, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   8, $66, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32, -16, $80, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32,  -8, $82, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32,   0, $84, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32,   8, $86, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_40
	frame_oam -16, -16, $2a, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -8, $2c, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   0, $2e, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   8, $30, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32, -16, $4a, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32,  -8, $4c, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32,   0, $4e, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32,   8, $50, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_41
	frame_oam -16, -16, $68, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -8, $6a, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   0, $6c, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   8, $6e, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32, -16, $88, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32,  -8, $8a, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32,   0, $8c, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32,   8, $8e, 6 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_42
	frame_oam -48,   0, $3c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  -8, $3e, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   8, $5a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $5c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $5e, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $7a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $7c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $7e, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_43
	frame_oam -48,  -4, $bc, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48, -12, $be, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   4, $da, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -4, $dc, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $de, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $fa, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $fc, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $fe, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_44
	frame_oam -31,   4, $96, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -4, $98, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31, -12, $9a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   4, $b6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -4, $b8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -12, $ba, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_45
	frame_oam -32,   4, $70, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -4, $72, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $74, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $90, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $92, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $94, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_46
	frame_oam -32,   8, $40, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $42, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $76, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $78, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $b2, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $b4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $9c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $9e, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_47
	frame_oam -28,   8, $32, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,   0, $34, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,  -8, $36, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28, -16, $38, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,   8, $52, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,   0, $54, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,  -8, $56, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12, -16, $58, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_48
	frame_oam -38, -12, $24, 7 | OAMF_BANK1
	frame_oam -38,  -4, $26, 6 | OAMF_BANK1
	frame_oam -38,   4, $28, 6 | OAMF_BANK1
	frame_oam -22, -12, $44, 7 | OAMF_BANK1
	frame_oam -22,  -4, $46, 6 | OAMF_BANK1
	frame_oam -22,   4, $48, 6 | OAMF_BANK1
	db $80

.frame_49
	frame_oam -46, -12, $96, 7 | OAMF_BANK1
	frame_oam -46,  -4, $98, 6 | OAMF_BANK1
	frame_oam -46,   4, $9a, 6 | OAMF_BANK1
	frame_oam -30, -12, $b6, 6 | OAMF_BANK1
	frame_oam -30,  -4, $b8, 6 | OAMF_BANK1
	frame_oam -30,   4, $ba, 6 | OAMF_BANK1
	db $80

.frame_50
	frame_oam -38,   4, $24, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -38,  -4, $26, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -38, -12, $28, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22,   4, $44, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22,  -4, $46, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22, -12, $48, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_51
	frame_oam -46,   4, $96, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -46,  -4, $98, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -46, -12, $9a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30,   4, $b6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30,  -4, $b8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30, -12, $ba, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_52
	frame_oam -28, -16, $40, 6 | OAMF_BANK1
	frame_oam -28,  -8, $42, 6 | OAMF_BANK1
	frame_oam -28,   0, $76, 7 | OAMF_BANK1
	frame_oam -28,   8, $78, 7 | OAMF_BANK1
	frame_oam -12, -16, $b2, 6 | OAMF_BANK1
	frame_oam -12,  -8, $b4, 7 | OAMF_BANK1
	frame_oam -12,   0, $9c, 7 | OAMF_BANK1
	frame_oam -12,   8, $9e, 6 | OAMF_BANK1
	db $80

.frame_53
	frame_oam -28,   8, $40, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,   0, $42, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,  -8, $76, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28, -16, $78, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,   8, $b2, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,   0, $b4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,  -8, $9c, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12, -16, $9e, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80
; 0x18d07c
