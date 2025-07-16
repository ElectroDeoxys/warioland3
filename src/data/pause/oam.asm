OAM_1f156c:
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
	dw EmptyOAMFrame
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

.frame_0
	frame_oam -16,  -8, $c0, 0
	frame_oam -16,   0, $c2, 0
	db $80

.frame_1
	frame_oam -16,  -8, $c6, 0
	frame_oam -16,   0, $c8, 0
	db $80

.frame_2
	frame_oam -16,  -8, $d6, 0
	frame_oam -16,   0, $d6, 0 | OAM_XFLIP
	db $80

.frame_3
	frame_oam -16,  -8, $d8, 0
	frame_oam -16,   0, $d8, 0 | OAM_XFLIP
	db $80

.frame_4
	frame_oam -16,  -8, $da, 0
	frame_oam -16,   0, $da, 0 | OAM_XFLIP
	db $80

.frame_5
	frame_oam -16,  -8, $dc, 0
	frame_oam -16,   0, $dc, 0 | OAM_XFLIP
	db $80

.frame_6
	frame_oam -27,  -8, $10, 7
	frame_oam -11,  -4, $12, 1
	frame_oam -27,   0, $10, 7 | OAM_XFLIP
	frame_oam -16, -20, $20, 6
	frame_oam -16, -12, $00, 5
	frame_oam -16,  -4, $02, 5
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16,   4, $00, 5 | OAM_XFLIP
	db $80

.frame_7
	frame_oam -27,  -8, $10, 7
	frame_oam -11,  -4, $12, 1
	frame_oam -27,   0, $10, 7 | OAM_XFLIP
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16, -12, $04, 5
	frame_oam -16,   4, $04, 5 | OAM_XFLIP
	frame_oam -16,  -4, $06, 5
	db $80

.frame_8
	frame_oam -27,  -8, $10, 7
	frame_oam -11,  -4, $12, 1
	frame_oam -27,   0, $10, 7 | OAM_XFLIP
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16, -12, $08, 5
	frame_oam -16,  -4, $0a, 5
	frame_oam -16,   4, $08, 5 | OAM_XFLIP
	db $80

.frame_9
	frame_oam -27,  -8, $10, 7
	frame_oam -11,  -4, $12, 1
	frame_oam -27,   0, $10, 7 | OAM_XFLIP
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16, -12, $0c, 5
	frame_oam -16,  -4, $0e, 5
	frame_oam -16,   4, $0c, 5 | OAM_XFLIP
	frame_oam -14,  -4, $3c, 5
	db $80

.frame_10
	frame_oam -16, -16, $28, 1
	frame_oam -16,  -8, $2a, 1
	frame_oam -16,   0, $2c, 1
	frame_oam -16,   8, $2e, 1
	db $80

.frame_11
	frame_oam -18, -16, $6a, 7
	frame_oam -16, -16, $28, 1
	frame_oam -16,  -8, $2a, 1
	frame_oam -16,   0, $2c, 1
	frame_oam -16,   8, $2e, 1
	db $80

.frame_12
	frame_oam -18, -11, $70, 7
	frame_oam -16, -16, $28, 1
	frame_oam -16,  -8, $2a, 1
	frame_oam -16,   0, $2c, 1
	frame_oam -16,   8, $2e, 1
	db $80

.frame_13
	frame_oam -18,  -3, $50, 7
	frame_oam -18,   5, $52, 7
	frame_oam -16, -16, $28, 1
	frame_oam -16,  -8, $2a, 1
	frame_oam -16,   0, $2c, 1
	frame_oam -16,   8, $2e, 1
	db $80

.frame_14
	frame_oam -18,   3, $62, 7
	frame_oam -16, -16, $28, 1
	frame_oam -16,  -8, $2a, 1
	frame_oam -16,   0, $2c, 1
	frame_oam -16,   8, $2e, 1
	db $80

.frame_15
	frame_oam -18,   8, $72, 7
	frame_oam -16, -16, $28, 1
	frame_oam -16,  -8, $2a, 1
	frame_oam -16,   0, $2c, 1
	frame_oam -16,   8, $2e, 1
	db $80

.frame_17
	frame_oam -16, -16, $48, 1
	frame_oam -16,  -8, $4a, 1
	frame_oam -16,   0, $4c, 1
	frame_oam -16,   8, $4e, 1
	db $80

.frame_18
	frame_oam -18, -13, $60, 7
	frame_oam -16, -16, $48, 1
	frame_oam -16,  -8, $4a, 1
	frame_oam -16,   0, $4c, 1
	frame_oam -16,   8, $4e, 1
	db $80

.frame_19
	frame_oam -18,  -7, $62, 7
	frame_oam -16, -16, $48, 1
	frame_oam -16,  -8, $4a, 1
	frame_oam -16,   0, $4c, 1
	frame_oam -16,   8, $4e, 1
	db $80

.frame_20
	frame_oam -18,  -1, $64, 7
	frame_oam -16, -16, $48, 1
	frame_oam -16,  -8, $4a, 1
	frame_oam -16,   0, $4c, 1
	frame_oam -16,   8, $4e, 1
	db $80

.frame_21
	frame_oam -18,   5, $66, 7
	frame_oam -16, -16, $48, 1
	frame_oam -16,  -8, $4a, 1
	frame_oam -16,   0, $4c, 1
	frame_oam -16,   8, $4e, 1
	db $80

.frame_22
	frame_oam -16, -16, $40, 1
	frame_oam -16,  -8, $42, 1
	frame_oam -16,   0, $44, 1
	frame_oam -16,   8, $46, 1
	db $80

.frame_23
	frame_oam -18, -15, $68, 7
	frame_oam -16,  -8, $42, 1
	frame_oam -16,   0, $44, 1
	frame_oam -16,   8, $46, 1
	frame_oam -16, -16, $40, 1
	db $80

.frame_24
	frame_oam -18, -11, $66, 7
	frame_oam -16, -16, $40, 1
	frame_oam -16,  -8, $42, 1
	frame_oam -16,   0, $44, 1
	frame_oam -16,   8, $46, 1
	db $80

.frame_25
	frame_oam -18,  -6, $6a, 7
	frame_oam -16, -16, $40, 1
	frame_oam -16,  -8, $42, 1
	frame_oam -16,   0, $44, 1
	frame_oam -16,   8, $46, 1
	db $80

.frame_26
	frame_oam -18,  -1, $6c, 7
	frame_oam -16, -16, $40, 1
	frame_oam -16,  -8, $42, 1
	frame_oam -16,   0, $44, 1
	frame_oam -16,   8, $46, 1
	db $80

.frame_27
	frame_oam -18,   3, $68, 7
	frame_oam -16, -16, $40, 1
	frame_oam -16,  -8, $42, 1
	frame_oam -16,   0, $44, 1
	frame_oam -16,   8, $46, 1
	db $80

.frame_28
	frame_oam -18,   7, $6e, 7
	frame_oam -16, -16, $40, 1
	frame_oam -16,  -8, $42, 1
	frame_oam -16,   0, $44, 1
	frame_oam -16,   8, $46, 1
	db $80

.frame_29
	frame_oam -32, -16, $e0, 2
	frame_oam -32,  -8, $e2, 2
	frame_oam -32,   0, $e4, 2
	frame_oam -16,  -8, $e6, 2
	frame_oam -16,   0, $e8, 2
	frame_oam -32,   8, $e0, 2 | OAM_XFLIP
	frame_oam -16, -16, $e0, 2 | OAM_YFLIP
	frame_oam -16,   8, $e0, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam -48,   8, $c4, 2
	db $80

.frame_30
	frame_oam -32, -12, $ea, 2
	frame_oam -16, -12, $ea, 2 | OAM_YFLIP
	frame_oam -40,  -4, $ec, 2
	frame_oam -24,  -4, $ee, 2
	frame_oam  -8,  -4, $ec, 2 | OAM_YFLIP
	frame_oam -32,   4, $ea, 2 | OAM_XFLIP
	frame_oam -16,   4, $ea, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam -48,   8, $cc, 2
	db $80

.frame_31
	frame_oam -32, -12, $f0, 2
	frame_oam -16, -12, $f0, 2 | OAM_YFLIP
	frame_oam -40,  -4, $f2, 2
	frame_oam  -8,  -4, $f2, 2 | OAM_YFLIP
	frame_oam -24,  -4, $f4, 2
	frame_oam -32,   4, $f0, 2 | OAM_XFLIP
	frame_oam -16,   4, $f0, 2 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_32
	frame_oam -32,  -4, $f6, 2
	frame_oam -16,  -4, $f6, 2 | OAM_YFLIP
	db $80

.frame_33
	frame_oam -32, -12, $f0, 2
	frame_oam -16, -12, $f0, 2 | OAM_YFLIP
	frame_oam -40,  -4, $f2, 2
	frame_oam  -8,  -4, $f2, 2 | OAM_YFLIP
	frame_oam -24,  -4, $f4, 2 | OAM_XFLIP
	frame_oam -32,   4, $f0, 2 | OAM_XFLIP
	frame_oam -16,   4, $f0, 2 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_34
	frame_oam -32, -12, $ea, 2
	frame_oam -16, -12, $ea, 2 | OAM_YFLIP
	frame_oam -40,  -4, $ec, 2
	frame_oam -24,  -4, $ee, 2 | OAM_XFLIP
	frame_oam  -8,  -4, $ec, 2 | OAM_YFLIP
	frame_oam -32,   4, $ea, 2 | OAM_XFLIP
	frame_oam -16,   4, $ea, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam -48, -16, $cc, 2
	db $80

.frame_35
	frame_oam -32, -16, $e0, 2
	frame_oam -32,   0, $e2, 2 | OAM_XFLIP
	frame_oam -32,  -8, $e4, 2 | OAM_XFLIP
	frame_oam -16,   0, $e6, 2 | OAM_XFLIP
	frame_oam -16,  -8, $e8, 2 | OAM_XFLIP
	frame_oam -32,   8, $e0, 2 | OAM_XFLIP
	frame_oam -16, -16, $e0, 2 | OAM_YFLIP
	frame_oam -16,   8, $e0, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam -48, -16, $c4, 2
	db $80

.frame_36
	frame_oam -16,  -4, $7c, 7
	frame_oam -16, -16, $24, 6
	frame_oam -16,   8, $26, 6
	frame_oam -16,  -8, $58, 5
	frame_oam -16,   0, $58, 5 | OAM_XFLIP
	db $80

.frame_37
	frame_oam -16,  -4, $7e, 7
	frame_oam -16, -16, $24, 6
	frame_oam -16,   8, $26, 6
	frame_oam -16,  -8, $58, 5
	frame_oam -16,   0, $58, 5 | OAM_XFLIP
	db $80

.frame_38
	frame_oam -16,  -4, $98, 7
	frame_oam -16, -16, $24, 6
	frame_oam -16,   8, $26, 6
	frame_oam -16,  -8, $58, 5
	frame_oam -16,   0, $58, 5 | OAM_XFLIP
	db $80

.frame_39
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam  -5,  -4, $04, 7
	frame_oam -16, -12, $00, 5
	frame_oam -16,  -4, $02, 5
	frame_oam -16,   4, $00, 5 | OAM_XFLIP
	frame_oam -16, -12, $1c, 6
	frame_oam -16,  -4, $1c, 6
	frame_oam -16,   4, $1c, 6
	db $80

.frame_40
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam  -6,  -4, $0a, 7
	frame_oam -16, -12, $06, 5
	frame_oam -16,  -4, $08, 5
	frame_oam -16,   4, $06, 5 | OAM_XFLIP
	frame_oam -16, -12, $1c, 6
	frame_oam -16,  -4, $1c, 6
	frame_oam -16,   4, $1c, 6
	db $80

.frame_41
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32, -12, $12, 0
	frame_oam -32,   4, $12, 0 | OAM_XFLIP
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam  -7,  -4, $10, 7
	frame_oam -16, -12, $0c, 5
	frame_oam -16,  -4, $0e, 5
	frame_oam -16,   4, $0c, 5 | OAM_XFLIP
	frame_oam -16, -12, $1c, 6
	frame_oam -16,  -4, $1c, 6
	frame_oam -16,   4, $1c, 6
	db $80

.frame_42
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32, -12, $12, 0
	frame_oam -32,   4, $12, 0 | OAM_XFLIP
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam  -7,  -4, $1a, 7
	frame_oam -16, -12, $14, 5
	frame_oam -16,  -4, $16, 5
	frame_oam -16,   4, $18, 5
	frame_oam -16, -12, $1c, 6
	frame_oam -16,  -4, $1c, 6
	frame_oam -16,   4, $1c, 6
	db $80

.frame_43
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32, -12, $12, 0
	frame_oam -32,   4, $12, 0 | OAM_XFLIP
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam  -7,  -4, $1a, 7
	frame_oam -16,   4, $14, 5 | OAM_XFLIP
	frame_oam -16,  -4, $16, 5 | OAM_XFLIP
	frame_oam -16, -12, $18, 5 | OAM_XFLIP
	frame_oam -16, -12, $1c, 6
	frame_oam -16,  -4, $1c, 6
	frame_oam -16,   4, $1c, 6
	db $80

.frame_44
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16,  -8, $0e, 3
	frame_oam -16,   0, $0e, 3 | OAM_XFLIP
	frame_oam -16, -12, $02, 5
	frame_oam -16,  -4, $04, 5
	frame_oam -16,   4, $02, 5 | OAM_XFLIP
	frame_oam -32,  -4, $00, 5
	frame_oam   0,  -4, $06, 5
	db $80

.frame_45
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -32,  -4, $00, 5
	frame_oam   0,  -4, $06, 5
	frame_oam -16,  -8, $0c, 3
	frame_oam -16,   0, $0c, 3 | OAM_XFLIP
	frame_oam -16, -12, $08, 5
	frame_oam -16,  -4, $0a, 5
	frame_oam -16,   4, $08, 5 | OAM_XFLIP
	db $80

.frame_46
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16,  -8, $10, 3
	frame_oam -16,   0, $12, 3
	frame_oam -16, -12, $02, 5
	frame_oam -16,  -4, $04, 5
	frame_oam -16,   4, $02, 5 | OAM_XFLIP
	frame_oam -32,  -4, $00, 5
	frame_oam   0,  -4, $06, 5
	db $80

.frame_47
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16,  -8, $14, 3
	frame_oam -16,   0, $14, 3 | OAM_XFLIP
	frame_oam -16, -12, $02, 5
	frame_oam -16,  -4, $04, 5
	frame_oam -16,   4, $02, 5 | OAM_XFLIP
	frame_oam -32,  -4, $00, 5
	frame_oam   0,  -4, $06, 5
	db $80

.frame_48
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16,   0, $10, 3 | OAM_XFLIP
	frame_oam -16,  -8, $12, 3 | OAM_XFLIP
	frame_oam -16, -12, $02, 5
	frame_oam -16,  -4, $04, 5
	frame_oam -16,   4, $02, 5 | OAM_XFLIP
	frame_oam -32,  -4, $00, 5
	frame_oam   0,  -4, $06, 5
	db $80

.frame_49
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16, -12, $00, 6
	frame_oam -16,  -4, $02, 6
	frame_oam -16,   4, $04, 6
	frame_oam -16,  -8, $06, 7
	frame_oam -16,   0, $06, 7
	db $80

.frame_50
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16, -12, $00, 6
	frame_oam -16,   4, $04, 6
	frame_oam -16,  -4, $08, 6
	frame_oam -16,  -8, $06, 7
	frame_oam -16,   0, $06, 7
	db $80

.frame_51
	frame_oam -16, -20, $0a, 6
	frame_oam -16,  12, $10, 6
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16,  -4, $02, 6
	frame_oam -16, -12, $0c, 6
	frame_oam -16,   4, $0e, 6
	frame_oam -16,  -8, $06, 7
	frame_oam -16,   0, $06, 7
	db $80

.frame_52
	frame_oam  -7, -20, $16, 6
	frame_oam  -8,  12, $1c, 6
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16,  -4, $02, 6
	frame_oam -16, -12, $12, 6
	frame_oam -16,   4, $14, 6
	frame_oam -16,  -8, $06, 7
	frame_oam -16,   0, $06, 7
	frame_oam   0, -12, $18, 6
	frame_oam   0,   4, $1a, 6
	db $80

Frameset_1f1c4a:
	db   0,  1
	db $ff

Frameset_1f1c4d:
	db   1,  1
	db $ff

Frameset_1f1c50:
	db   6, 100
	db   7,  3
	db   8,  3
	db   7,  3
	db   6,  3
	db   7,  3
	db   8,  3
	db   7,  3
	db   6, 50
	db   7,  4
	db   8,  4
	db   7,  4
	db $ff

Frameset_1f1c69:
	db   6,  8
	db   9,  8
	db   6,  8
	db   9,  8
	db   6, 50
	db $ff

Frameset_1f1c74:
	db  10, 50
	db $ff

Frameset_1f1c77:
	db  11,  4
	db  12,  4
	db  10,  4
	db  13,  4
	db  14,  4
	db  15,  4
	db  11,  4
	db  12,  4
	db  10,  4
	db  13,  4
	db  14,  4
	db  15,  4
	db  11,  4
	db  12,  4
	db  10,  4
	db  13,  4
	db  14,  4
	db  15,  4
	db $ff

Frameset_1f1c9c:
	db  17, 50
	db $ff

Frameset_1f1c9f:
	db  18,  4
	db  19,  4
	db  20,  4
	db  21,  4
	db  18,  4
	db  19,  4
	db  20,  4
	db  21,  4
	db  18,  4
	db  19,  4
	db  20,  4
	db  21,  4
	db $ff

Frameset_1f1cb8:
	db  22, 50
	db $ff

Frameset_1f1cbb:
	db  23,  4
	db  24,  4
	db  25,  4
	db  26,  4
	db  27,  4
	db  28,  4
	db  23,  4
	db  24,  4
	db  25,  4
	db  26,  4
	db  27,  4
	db  28,  4
	db $ff

Frameset_1f1cd4::
	db  29, 10
	db  30,  9
	db  31,  8
	db  32,  7
	db  33,  8
	db  34,  9
	db  35, 10
	db  34,  9
	db  33,  8
	db  32,  7
	db  31,  8
	db  30,  9
	db $ff

Frameset_1f1ced:
	db   2,  4
	db $ff

Frameset_1f1cf0:
	db   3,  4
	db $ff

Frameset_1f1cf3:
	db   4,  4
	db $ff

Frameset_1f1cf6:
	db   5,  4
	db $ff

Frameset_1f1cf9:
	db  39, 17
	db  40, 20
	db  41, 20
	db  40, 16
	db  39, 15
	db  40, 18
	db  41, 18
	db  40, 14
	db $ff

Frameset_1f1d0a:
	db  42,  4
	db  43,  4
	db  42,  4
	db  43,  4
	db  42,  4
	db  43,  4
	db  42,  4
	db  43,  4
	db $ff

Frameset_1f1d1b:
	db  44, 18
	db  45, 18
	db $ff

Frameset_1f1d20:
	db  44,  3
	db  46,  3
	db  47,  3
	db  48,  3
	db  44,  3
	db  46,  3
	db  47,  3
	db  48,  3
	db  44,  3
	db  46,  3
	db  47,  3
	db  48,  3
	db  44,  3
	db  46,  3
	db  47,  3
	db  48,  3
	db $ff

Frameset_1f1d41:
	db  49, 30
	db  50,  4
	db  49,  4
	db  50,  4
	db  49,  4
	db $ff

Frameset_1f1d4c:
	db  51,  4
	db  52,  4
	db  51,  4
	db  52,  4
	db  51,  4
	db  52,  4
	db  51,  4
	db  52,  4
	db $ff
