OAM_14000::
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
	frame_oam -31, -12, $00, 0
	frame_oam -31,  -4, $02, 0
	frame_oam -31,   4, $04, 0
	frame_oam -15, -12, $20, 0
	frame_oam -15,  -4, $22, 0
	frame_oam -15,   4, $24, 0
	db $80

.frame_1
	frame_oam -31, -12, $06, 0
	frame_oam -31,  -4, $08, 0
	frame_oam -15, -12, $26, 0
	frame_oam -15,  -4, $28, 0
	frame_oam -15,   4, $2a, 0
	frame_oam -31,   4, $04, 0
	db $80

.frame_2
	frame_oam -32, -12, $0c, 0
	frame_oam -32,  -4, $0e, 0
	frame_oam -32,   4, $10, 0
	frame_oam -16, -12, $2c, 0
	frame_oam -16,  -4, $2e, 0
	frame_oam -16,   4, $30, 0
	db $80

.frame_3
	frame_oam -32, -15, $12, 0
	frame_oam -32,  -7, $14, 0
	frame_oam -32,   1, $16, 0
	frame_oam -16, -15, $32, 0
	frame_oam -16,  -7, $34, 0
	frame_oam -16,   1, $36, 0
	db $80

.frame_4
	frame_oam -31,   4, $00, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -31, -12, $04, 0 | OAMF_XFLIP
	frame_oam -15,   4, $20, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -15, -12, $24, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -31,   4, $06, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -15,   4, $26, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $28, 0 | OAMF_XFLIP
	frame_oam -15, -12, $2a, 0 | OAMF_XFLIP
	frame_oam -31, -12, $04, 0 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -32,   4, $0c, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $0e, 0 | OAMF_XFLIP
	frame_oam -32, -12, $10, 0 | OAMF_XFLIP
	frame_oam -16,   4, $2c, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $2e, 0 | OAMF_XFLIP
	frame_oam -16, -12, $30, 0 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -32,   7, $12, 0 | OAMF_XFLIP
	frame_oam -32,  -1, $14, 0 | OAMF_XFLIP
	frame_oam -32,  -9, $16, 0 | OAMF_XFLIP
	frame_oam -16,   7, $32, 0 | OAMF_XFLIP
	frame_oam -16,  -1, $34, 0 | OAMF_XFLIP
	frame_oam -16,  -9, $36, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -32,  -7, $14, 0
	frame_oam -32,   1, $16, 0
	frame_oam -16, -15, $32, 0
	frame_oam -16,  -7, $34, 0
	frame_oam -16,   1, $36, 0
	frame_oam -32, -15, $1e, 0
	db $80

.frame_9
	frame_oam -32, -15, $18, 0
	frame_oam -32,  -7, $1a, 0
	frame_oam -32,   1, $1c, 0
	frame_oam -16, -15, $38, 0
	frame_oam -16,  -7, $3a, 0
	frame_oam -16,   1, $3c, 0
	db $80

.frame_10
	frame_oam -32,  -1, $14, 0 | OAMF_XFLIP
	frame_oam -32,  -9, $16, 0 | OAMF_XFLIP
	frame_oam -16,   7, $32, 0 | OAMF_XFLIP
	frame_oam -16,  -1, $34, 0 | OAMF_XFLIP
	frame_oam -16,  -9, $36, 0 | OAMF_XFLIP
	frame_oam -32,   7, $1e, 0 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -32,   7, $18, 0 | OAMF_XFLIP
	frame_oam -32,  -1, $1a, 0 | OAMF_XFLIP
	frame_oam -32,  -9, $1c, 0 | OAMF_XFLIP
	frame_oam -16,   7, $38, 0 | OAMF_XFLIP
	frame_oam -16,  -1, $3a, 0 | OAMF_XFLIP
	frame_oam -16,  -9, $3c, 0 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -32,  -7, $1a, 0
	frame_oam -32,   1, $1c, 0
	frame_oam -16, -15, $38, 0
	frame_oam -16,  -7, $3a, 0
	frame_oam -16,   1, $3c, 0
	frame_oam -32, -15, $3e, 0
	db $80

.frame_13
	frame_oam -32,  -1, $1a, 0 | OAMF_XFLIP
	frame_oam -32,  -9, $1c, 0 | OAMF_XFLIP
	frame_oam -16,   7, $38, 0 | OAMF_XFLIP
	frame_oam -16,  -1, $3a, 0 | OAMF_XFLIP
	frame_oam -16,  -9, $3c, 0 | OAMF_XFLIP
	frame_oam -32,   7, $3e, 0 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -15, -12, $20, 0
	frame_oam -15,  -4, $22, 0
	frame_oam -15,   4, $24, 0
	frame_oam -31, -12, $06, 0
	frame_oam -31,  -4, $08, 0
	frame_oam -31,   4, $04, 0
	db $80

.frame_15
	frame_oam -31, -12, $06, 0
	frame_oam -31,   4, $04, 0
	frame_oam -15, -12, $20, 0
	frame_oam -15,  -4, $22, 0
	frame_oam -15,   4, $24, 0
	frame_oam -31,  -4, $0a, 0
	db $80

.frame_16
	frame_oam -15,   4, $20, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -15, -12, $24, 0 | OAMF_XFLIP
	frame_oam -31,   4, $06, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -31, -12, $04, 0 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -31,   4, $06, 0 | OAMF_XFLIP
	frame_oam -31, -12, $04, 0 | OAMF_XFLIP
	frame_oam -15,   4, $20, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -15, -12, $24, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $0a, 0 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -31, -12, $40, 0
	frame_oam -31,  -4, $42, 0
	frame_oam -31,   4, $44, 0
	frame_oam -15, -12, $60, 0
	frame_oam -15,  -4, $62, 0
	frame_oam -15,   4, $64, 0
	db $80

.frame_19
	frame_oam -31,   4, $40, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $42, 0 | OAMF_XFLIP
	frame_oam -31, -12, $44, 0 | OAMF_XFLIP
	frame_oam -15,   4, $60, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $62, 0 | OAMF_XFLIP
	frame_oam -15, -12, $64, 0 | OAMF_XFLIP
	db $80

Frameset_1421c::
	db $12,  4
	db $01, 12
	db $02, 12
	db $03, 12
	db $ff

Frameset_14225::
	db $13,  4
	db $05, 12
	db $06, 12
	db $07, 12
	db $ff

Frameset_1422e::
	db $03, 30
	db $08, 30
	db $09, 40
	db $08, 30
	db $ff

Frameset_14237::
	db $07, 30
	db $0a, 30
	db $0b, 40
	db $0a, 30
	db $ff

Frameset_14240::
	db $0c,  6
	db $02,  6
	db $01,  6
	db $12,  2
	db $ff

Frameset_14249::
	db $0d,  6
	db $06,  6
	db $05,  6
	db $13,  2
	db $ff

Frameset_14252::
	db $00, 60
	db $0e, 20
	db $0f, 10
	db $0e, 30
	db $0f, 12
	db $0e, 60
	db $ff

Frameset_1425f::
	db $04, 60
	db $10, 20
	db $11, 10
	db $10, 30
	db $11, 12
	db $10, 60
	db $ff

OAM_1426c::
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
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32,   4, $04, 0
	frame_oam -16, -12, $20, 0
	frame_oam -16,  -4, $22, 0
	frame_oam -16,   4, $24, 0
	db $80

.frame_1
	frame_oam -32, -12, $06, 0
	frame_oam -32,  -4, $08, 0
	frame_oam -32,   4, $0a, 0
	frame_oam -16, -12, $26, 0
	frame_oam -16,  -4, $28, 0
	frame_oam -16,   4, $2a, 0
	db $80

.frame_2
	frame_oam -34,  -4, $0e, 0
	frame_oam -34,   4, $10, 0
	frame_oam -18, -12, $2c, 0
	frame_oam -18,  -4, $2e, 0
	frame_oam -18,   4, $30, 0
	frame_oam -34, -12, $00, 0
	db $80

.frame_3
	frame_oam -32, -13, $12, 0
	frame_oam -32,  -5, $14, 0
	frame_oam -32,   3, $16, 0
	frame_oam -16, -13, $32, 0
	frame_oam -16,  -5, $34, 0
	frame_oam -16,   3, $36, 0
	db $80

.frame_4
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	frame_oam -16,   4, $20, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -16, -12, $24, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -32,   4, $06, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -32, -12, $0a, 0 | OAMF_XFLIP
	frame_oam -16,   4, $26, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $28, 0 | OAMF_XFLIP
	frame_oam -16, -12, $2a, 0 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -34,  -4, $0e, 0 | OAMF_XFLIP
	frame_oam -34, -12, $10, 0 | OAMF_XFLIP
	frame_oam -18,   4, $2c, 0 | OAMF_XFLIP
	frame_oam -18,  -4, $2e, 0 | OAMF_XFLIP
	frame_oam -18, -12, $30, 0 | OAMF_XFLIP
	frame_oam -34,   4, $00, 0 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -32,   5, $12, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $14, 0 | OAMF_XFLIP
	frame_oam -32, -11, $16, 0 | OAMF_XFLIP
	frame_oam -16,   5, $32, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $34, 0 | OAMF_XFLIP
	frame_oam -16, -11, $36, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32,   4, $04, 0
	frame_oam -16, -12, $20, 0
	frame_oam -16,  -4, $22, 0
	frame_oam -16,   4, $24, 0
	frame_oam -18, -16, $0c, 0
	db $80

.frame_9
	frame_oam -32, -12, $06, 0
	frame_oam -32,  -4, $08, 0
	frame_oam -32,   4, $0a, 0
	frame_oam -16, -12, $26, 0
	frame_oam -16,  -4, $28, 0
	frame_oam -16,   4, $2a, 0
	frame_oam -17, -16, $0c, 0
	db $80

.frame_10
	frame_oam -34,  -4, $0e, 0
	frame_oam -34,   4, $10, 0
	frame_oam -18, -12, $2c, 0
	frame_oam -18,  -4, $2e, 0
	frame_oam -18,   4, $30, 0
	frame_oam -34, -12, $00, 0
	frame_oam -17, -16, $0c, 0
	db $80

.frame_11
	frame_oam -32, -13, $12, 0
	frame_oam -32,  -5, $14, 0
	frame_oam -32,   3, $16, 0
	frame_oam -16, -13, $32, 0
	frame_oam -16,  -5, $34, 0
	frame_oam -16,   3, $36, 0
	frame_oam -17, -16, $0c, 0
	db $80

.frame_12
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32,   4, $04, 0
	frame_oam -16, -12, $20, 0
	frame_oam -16,  -4, $22, 0
	frame_oam -16,   4, $24, 0
	frame_oam -17, -15, $0c, 0
	db $80

.frame_13
	frame_oam -32, -12, $06, 0
	frame_oam -32,  -4, $08, 0
	frame_oam -32,   4, $0a, 0
	frame_oam -16, -12, $26, 0
	frame_oam -16,  -4, $28, 0
	frame_oam -16,   4, $2a, 0
	frame_oam -17, -15, $0c, 0
	db $80

.frame_14
	frame_oam -34,  -4, $0e, 0
	frame_oam -34,   4, $10, 0
	frame_oam -18, -12, $2c, 0
	frame_oam -18,  -4, $2e, 0
	frame_oam -18,   4, $30, 0
	frame_oam -34, -12, $00, 0
	frame_oam -18, -15, $0c, 0
	db $80

.frame_15
	frame_oam -32, -13, $12, 0
	frame_oam -32,  -5, $14, 0
	frame_oam -32,   3, $16, 0
	frame_oam -16, -13, $32, 0
	frame_oam -16,  -5, $34, 0
	frame_oam -16,   3, $36, 0
	frame_oam -17, -15, $0c, 0
	db $80

.frame_16
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	frame_oam -16,   4, $20, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -16, -12, $24, 0 | OAMF_XFLIP
	frame_oam -18,   8, $0c, 0 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -32,   4, $06, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -32, -12, $0a, 0 | OAMF_XFLIP
	frame_oam -16,   4, $26, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $28, 0 | OAMF_XFLIP
	frame_oam -16, -12, $2a, 0 | OAMF_XFLIP
	frame_oam -17,   8, $0c, 0 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -34,  -4, $0e, 0 | OAMF_XFLIP
	frame_oam -34, -12, $10, 0 | OAMF_XFLIP
	frame_oam -18,   4, $2c, 0 | OAMF_XFLIP
	frame_oam -18,  -4, $2e, 0 | OAMF_XFLIP
	frame_oam -18, -12, $30, 0 | OAMF_XFLIP
	frame_oam -34,   4, $00, 0 | OAMF_XFLIP
	frame_oam -17,   8, $0c, 0 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -32,   5, $12, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $14, 0 | OAMF_XFLIP
	frame_oam -32, -11, $16, 0 | OAMF_XFLIP
	frame_oam -16,   5, $32, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $34, 0 | OAMF_XFLIP
	frame_oam -16, -11, $36, 0 | OAMF_XFLIP
	frame_oam -17,   8, $0c, 0 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	frame_oam -16,   4, $20, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -16, -12, $24, 0 | OAMF_XFLIP
	frame_oam -17,   7, $0c, 0 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -32,   4, $06, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -32, -12, $0a, 0 | OAMF_XFLIP
	frame_oam -16,   4, $26, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $28, 0 | OAMF_XFLIP
	frame_oam -16, -12, $2a, 0 | OAMF_XFLIP
	frame_oam -17,   7, $0c, 0 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -34,  -4, $0e, 0 | OAMF_XFLIP
	frame_oam -34, -12, $10, 0 | OAMF_XFLIP
	frame_oam -18,   4, $2c, 0 | OAMF_XFLIP
	frame_oam -18,  -4, $2e, 0 | OAMF_XFLIP
	frame_oam -18, -12, $30, 0 | OAMF_XFLIP
	frame_oam -34,   4, $00, 0 | OAMF_XFLIP
	frame_oam -18,   7, $0c, 0 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -32,   5, $12, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $14, 0 | OAMF_XFLIP
	frame_oam -32, -11, $16, 0 | OAMF_XFLIP
	frame_oam -16,   5, $32, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $34, 0 | OAMF_XFLIP
	frame_oam -16, -11, $36, 0 | OAMF_XFLIP
	frame_oam -17,   7, $0c, 0 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -32, -12, $18, 0
	frame_oam -32,  -4, $1a, 0
	frame_oam -16, -12, $26, 0
	frame_oam -16,  -4, $28, 0
	frame_oam -16,   4, $2a, 0
	frame_oam -32,   4, $0a, 0
	db $80

.frame_25
	frame_oam -33, -12, $1e, 0
	frame_oam -33,  -4, $3e, 0
	frame_oam -33,   4, $10, 0
	frame_oam -17, -12, $2c, 0
	frame_oam -17,  -4, $2e, 0
	frame_oam -17,   4, $30, 0
	db $80

.frame_26
	frame_oam -32, -13, $40, 0
	frame_oam -32,  -5, $42, 0
	frame_oam -32,   3, $16, 0
	frame_oam -16, -13, $32, 0
	frame_oam -16,  -5, $34, 0
	frame_oam -16,   3, $36, 0
	db $80

.frame_27
	frame_oam -32,   4, $18, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $1a, 0 | OAMF_XFLIP
	frame_oam -16,   4, $26, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $28, 0 | OAMF_XFLIP
	frame_oam -16, -12, $2a, 0 | OAMF_XFLIP
	frame_oam -32, -12, $0a, 0 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam -33,   4, $1e, 0 | OAMF_XFLIP
	frame_oam -33,  -4, $3e, 0 | OAMF_XFLIP
	frame_oam -33, -12, $10, 0 | OAMF_XFLIP
	frame_oam -17,   4, $2c, 0 | OAMF_XFLIP
	frame_oam -17,  -4, $2e, 0 | OAMF_XFLIP
	frame_oam -17, -12, $30, 0 | OAMF_XFLIP
	db $80

.frame_29
	frame_oam -32,   5, $40, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $42, 0 | OAMF_XFLIP
	frame_oam -32, -11, $16, 0 | OAMF_XFLIP
	frame_oam -16,   5, $32, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $34, 0 | OAMF_XFLIP
	frame_oam -16, -11, $36, 0 | OAMF_XFLIP
	db $80

.frame_30
	frame_oam -32, -12, $18, 0
	frame_oam -32,  -4, $1a, 0
	frame_oam -32,   4, $1c, 0
	frame_oam -16, -12, $38, 0
	frame_oam -16,  -4, $3a, 0
	frame_oam -16,   4, $3c, 0
	db $80

.frame_31
	frame_oam -32,   4, $18, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $1a, 0 | OAMF_XFLIP
	frame_oam -32, -12, $1c, 0 | OAMF_XFLIP
	frame_oam -16,   4, $38, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $3a, 0 | OAMF_XFLIP
	frame_oam -16, -12, $3c, 0 | OAMF_XFLIP
	db $80

.frame_32
	frame_oam -31, -12, $44, 0
	frame_oam -31,  -4, $46, 0
	frame_oam -31,   4, $48, 0
	frame_oam -15, -12, $4c, 0
	frame_oam -15,  -4, $4e, 0
	frame_oam -15,   4, $50, 0
	db $80

.frame_33
	frame_oam -32, -12, $44, 0
	frame_oam -32,  -4, $46, 0
	frame_oam -32,   4, $4a, 0
	frame_oam -16, -12, $52, 0
	frame_oam -16,  -4, $54, 0
	frame_oam -16,   4, $56, 0
	db $80

.frame_34
	frame_oam -32, -12, $44, 0
	frame_oam -32,  -4, $46, 0
	frame_oam -32,   4, $4a, 0
	frame_oam -16, -12, $58, 0
	frame_oam -16,  -4, $5a, 0
	frame_oam -16,   4, $5c, 0
	db $80

.frame_35
	frame_oam -31, -13, $44, 0
	frame_oam -31,  -5, $46, 0
	frame_oam -31,   3, $48, 0
	frame_oam -15, -13, $5e, 0
	frame_oam -15,  -5, $60, 0
	frame_oam -15,   3, $62, 0
	db $80

.frame_36
	frame_oam -31,   4, $44, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -31, -12, $48, 0 | OAMF_XFLIP
	frame_oam -15,   4, $4c, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $4e, 0 | OAMF_XFLIP
	frame_oam -15, -12, $50, 0 | OAMF_XFLIP
	db $80

.frame_37
	frame_oam -32,   4, $44, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -32, -12, $4a, 0 | OAMF_XFLIP
	frame_oam -16,   4, $52, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $54, 0 | OAMF_XFLIP
	frame_oam -16, -12, $56, 0 | OAMF_XFLIP
	db $80

.frame_38
	frame_oam -32,   4, $44, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -32, -12, $4a, 0 | OAMF_XFLIP
	frame_oam -16,   4, $58, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $5a, 0 | OAMF_XFLIP
	frame_oam -16, -12, $5c, 0 | OAMF_XFLIP
	db $80

.frame_39
	frame_oam -31,   5, $44, 0 | OAMF_XFLIP
	frame_oam -31,  -3, $46, 0 | OAMF_XFLIP
	frame_oam -31, -11, $48, 0 | OAMF_XFLIP
	frame_oam -15,   5, $5e, 0 | OAMF_XFLIP
	frame_oam -15,  -3, $60, 0 | OAMF_XFLIP
	frame_oam -15, -11, $62, 0 | OAMF_XFLIP
	db $80

.frame_40
	frame_oam -31, -12, $44, 0
	frame_oam -31,  -4, $46, 0
	frame_oam -31,   4, $48, 0
	frame_oam -15, -12, $4c, 0
	frame_oam -15,  -4, $4e, 0
	frame_oam -15,   4, $50, 0
	frame_oam -15, -18, $0c, 0
	db $80

.frame_41
	frame_oam -32, -12, $44, 0
	frame_oam -32,  -4, $46, 0
	frame_oam -32,   4, $4a, 0
	frame_oam -16, -12, $52, 0
	frame_oam -16,  -4, $54, 0
	frame_oam -16,   4, $56, 0
	frame_oam -15, -18, $0c, 0
	db $80

.frame_42
	frame_oam -32, -12, $44, 0
	frame_oam -32,  -4, $46, 0
	frame_oam -32,   4, $4a, 0
	frame_oam -16, -12, $58, 0
	frame_oam -16,  -4, $5a, 0
	frame_oam -16,   4, $5c, 0
	frame_oam -15, -18, $0c, 0
	db $80

.frame_43
	frame_oam -31, -13, $44, 0
	frame_oam -31,  -5, $46, 0
	frame_oam -31,   3, $48, 0
	frame_oam -15, -13, $5e, 0
	frame_oam -15,  -5, $60, 0
	frame_oam -15,   3, $62, 0
	frame_oam -15, -19, $0c, 0
	db $80

.frame_44
	frame_oam -31, -12, $44, 0
	frame_oam -31,  -4, $46, 0
	frame_oam -31,   4, $48, 0
	frame_oam -15, -12, $4c, 0
	frame_oam -15,  -4, $4e, 0
	frame_oam -15,   4, $50, 0
	frame_oam -15, -17, $0c, 0
	db $80

.frame_45
	frame_oam -32, -12, $44, 0
	frame_oam -32,  -4, $46, 0
	frame_oam -32,   4, $4a, 0
	frame_oam -16, -12, $52, 0
	frame_oam -16,  -4, $54, 0
	frame_oam -16,   4, $56, 0
	frame_oam -15, -17, $0c, 0
	db $80

.frame_46
	frame_oam -32, -12, $44, 0
	frame_oam -32,  -4, $46, 0
	frame_oam -32,   4, $4a, 0
	frame_oam -16, -12, $58, 0
	frame_oam -16,  -4, $5a, 0
	frame_oam -16,   4, $5c, 0
	frame_oam -15, -17, $0c, 0
	db $80

.frame_47
	frame_oam -31, -13, $44, 0
	frame_oam -31,  -5, $46, 0
	frame_oam -31,   3, $48, 0
	frame_oam -15, -13, $5e, 0
	frame_oam -15,  -5, $60, 0
	frame_oam -15,   3, $62, 0
	frame_oam -15, -18, $0c, 0
	db $80

.frame_48
	frame_oam -31,   4, $44, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -31, -12, $48, 0 | OAMF_XFLIP
	frame_oam -15,   4, $4c, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $4e, 0 | OAMF_XFLIP
	frame_oam -15, -12, $50, 0 | OAMF_XFLIP
	frame_oam -15,  10, $0c, 0 | OAMF_XFLIP
	db $80

.frame_49
	frame_oam -32,   4, $44, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -32, -12, $4a, 0 | OAMF_XFLIP
	frame_oam -16,   4, $52, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $54, 0 | OAMF_XFLIP
	frame_oam -16, -12, $56, 0 | OAMF_XFLIP
	frame_oam -15,  10, $0c, 0 | OAMF_XFLIP
	db $80

.frame_50
	frame_oam -32,   4, $44, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -32, -12, $4a, 0 | OAMF_XFLIP
	frame_oam -16,   4, $58, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $5a, 0 | OAMF_XFLIP
	frame_oam -16, -12, $5c, 0 | OAMF_XFLIP
	frame_oam -15,  10, $0c, 0 | OAMF_XFLIP
	db $80

.frame_51
	frame_oam -31,   5, $44, 0 | OAMF_XFLIP
	frame_oam -31,  -3, $46, 0 | OAMF_XFLIP
	frame_oam -31, -11, $48, 0 | OAMF_XFLIP
	frame_oam -15,   5, $5e, 0 | OAMF_XFLIP
	frame_oam -15,  -3, $60, 0 | OAMF_XFLIP
	frame_oam -15, -11, $62, 0 | OAMF_XFLIP
	frame_oam -15,  11, $0c, 0 | OAMF_XFLIP
	db $80

.frame_52
	frame_oam -31,   4, $44, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -31, -12, $48, 0 | OAMF_XFLIP
	frame_oam -15,   4, $4c, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $4e, 0 | OAMF_XFLIP
	frame_oam -15, -12, $50, 0 | OAMF_XFLIP
	frame_oam -15,   9, $0c, 0 | OAMF_XFLIP
	db $80

.frame_53
	frame_oam -32,   4, $44, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -32, -12, $4a, 0 | OAMF_XFLIP
	frame_oam -16,   4, $52, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $54, 0 | OAMF_XFLIP
	frame_oam -16, -12, $56, 0 | OAMF_XFLIP
	frame_oam -15,   9, $0c, 0 | OAMF_XFLIP
	db $80

.frame_54
	frame_oam -32,   4, $44, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -32, -12, $4a, 0 | OAMF_XFLIP
	frame_oam -16,   4, $58, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $5a, 0 | OAMF_XFLIP
	frame_oam -16, -12, $5c, 0 | OAMF_XFLIP
	frame_oam -15,   9, $0c, 0 | OAMF_XFLIP
	db $80

.frame_55
	frame_oam -31,   4, $44, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -31, -12, $48, 0 | OAMF_XFLIP
	frame_oam -15,   4, $5e, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $60, 0 | OAMF_XFLIP
	frame_oam -15, -12, $62, 0 | OAMF_XFLIP
	frame_oam -15,   9, $0c, 0 | OAMF_XFLIP
	db $80

.frame_56
	frame_oam -32, -11, $64, 0
	frame_oam -32,  -3, $66, 0
	frame_oam -32,   5, $68, 0
	frame_oam -16, -11, $6a, 0
	frame_oam -16,  -3, $6c, 0
	frame_oam -16,   5, $6e, 0
	db $80

.frame_57
	frame_oam -32,   3, $64, 0 | OAMF_XFLIP
	frame_oam -32,  -5, $66, 0 | OAMF_XFLIP
	frame_oam -32, -13, $68, 0 | OAMF_XFLIP
	frame_oam -16,   3, $6a, 0 | OAMF_XFLIP
	frame_oam -16,  -5, $6c, 0 | OAMF_XFLIP
	frame_oam -16, -13, $6e, 0 | OAMF_XFLIP
	db $80

.frame_58
	frame_oam -32, -12, $06, 0
	frame_oam -32,  -4, $70, 0
	frame_oam -32,   4, $72, 0
	frame_oam -16, -12, $74, 0
	frame_oam -16,  -4, $76, 0
	frame_oam -16,   4, $78, 0
	db $80

.frame_59
	frame_oam -32,   4, $06, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $70, 0 | OAMF_XFLIP
	frame_oam -32, -12, $72, 0 | OAMF_XFLIP
	frame_oam -16,   4, $74, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $76, 0 | OAMF_XFLIP
	frame_oam -16, -12, $78, 0 | OAMF_XFLIP
	db $80

.frame_60
	frame_oam -32,   4, $1c, 0
	frame_oam -16, -12, $38, 0
	frame_oam -16,  -4, $3a, 0
	frame_oam -16,   4, $3c, 0
	frame_oam -32, -12, $06, 0
	frame_oam -32,  -4, $08, 0
	frame_oam -19, -16, $0c, 0
	db $80

.frame_61
	frame_oam -32, -12, $1c, 0 | OAMF_XFLIP
	frame_oam -16,   4, $38, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $3a, 0 | OAMF_XFLIP
	frame_oam -16, -12, $3c, 0 | OAMF_XFLIP
	frame_oam -32,   4, $06, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -19,   8, $0c, 0 | OAMF_XFLIP
	db $80

.frame_62
	frame_oam -32,   4, $04, 0
	frame_oam -16, -12, $20, 0
	frame_oam -16,  -4, $22, 0
	frame_oam -16,   4, $24, 0
	frame_oam -32, -12, $7a, 0
	frame_oam -32,  -4, $7c, 0
	db $80

.frame_63
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	frame_oam -16,   4, $20, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -16, -12, $24, 0 | OAMF_XFLIP
	frame_oam -32,   4, $7a, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $7c, 0 | OAMF_XFLIP
	db $80

Frameset_149b4::
	db $00,  3
	db $01,  3
	db $02,  3
	db $03,  3
	db $00,  3
	db $01,  3
	db $02,  3
	db $03,  3
	db $ff

Frameset_149c5::
	db $04,  3
	db $05,  3
	db $06,  3
	db $07,  3
	db $04,  3
	db $05,  3
	db $06,  3
	db $07,  3
	db $ff

Frameset_149d6::
	db $02,  4
	db $ff

Frameset_149d9::
	db $06,  4
	db $ff

Frameset_149dc::
	db $08,  3
	db $09,  3
	db $0a,  3
	db $0b,  3
	db $0c,  3
	db $0d,  3
	db $0e,  3
	db $0f,  3
	db $ff

Frameset_149ed::
	db $10,  3
	db $11,  3
	db $12,  3
	db $13,  3
	db $14,  3
	db $15,  3
	db $16,  3
	db $17,  3
	db $ff

Frameset_149fe::
	db $3e,  3
	db $18,  3
	db $19,  3
	db $1a,  3
	db $3e,  3
	db $18,  3
	db $19,  3
	db $1a,  3
	db $ff

Frameset_14a0f::
	db $3f,  3
	db $1b,  3
	db $1c,  3
	db $1d,  3
	db $3f,  3
	db $1b,  3
	db $1c,  3
	db $1d,  3
	db $ff

Frameset_14a20::
	db $1e,  4
	db $ff

Frameset_14a23::
	db $1f,  4
	db $ff

Frameset_14a26::
	db $20,  5
	db $21,  5
	db $22,  5
	db $23,  5
	db $ff

Frameset_14a2f::
	db $24,  5
	db $25,  5
	db $26,  5
	db $27,  5
	db $ff

Frameset_14a38::
	db $20,  4
	db $ff

Frameset_14a3b::
	db $24,  4
	db $ff

Frameset_14a3e::
	db $28,  3
	db $29,  3
	db $2a,  3
	db $2b,  3
	db $2c,  3
	db $2d,  3
	db $2e,  3
	db $2f,  3
	db $ff

Frameset_14a4f::
	db $30,  3
	db $31,  3
	db $32,  3
	db $33,  3
	db $34,  3
	db $35,  3
	db $36,  3
	db $37,  3
	db $ff

Frameset_14a60::
	db $28,  4
	db $ff

Frameset_14a63::
	db $30,  4
	db $ff

Frameset_14a66::
	db $08,  4
	db $ff

Frameset_14a69::
	db $10,  4
	db $ff

Frameset_14a6c::
	db $00,  2
	db $38,  2
	db $ff

Frameset_14a71::
	db $04,  2
	db $39,  2
	db $ff

Frameset_14a76::
	db $3a,  4
	db $ff

Frameset_14a79::
	db $3b,  4
	db $ff

Frameset_14a7c::
	db $3c,  4
	db $ff

Frameset_14a7f::
	db $3d,  4
	db $ff

OAM_14a82::
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
	frame_oam -31,   4, $00, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -31, -12, $04, 0 | OAMF_XFLIP
	frame_oam -15,   4, $20, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -15, -12, $24, 0 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -32,   4, $46, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $48, 0 | OAMF_XFLIP
	frame_oam -32, -12, $4a, 0 | OAMF_XFLIP
	frame_oam -16,   4, $66, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $68, 0 | OAMF_XFLIP
	frame_oam -16, -12, $6a, 0 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -32, -16, $4c, 0
	frame_oam -32,  -8, $4e, 0
	frame_oam -16, -16, $6c, 0
	frame_oam -16,  -8, $6e, 0
	frame_oam -32,   8, $4c, 0 | OAMF_XFLIP
	frame_oam -32,   0, $4e, 0 | OAMF_XFLIP
	frame_oam -16,   8, $6c, 0 | OAMF_XFLIP
	frame_oam -16,   0, $6e, 0 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -32, -12, $46, 0
	frame_oam -32,  -4, $48, 0
	frame_oam -32,   4, $4a, 0
	frame_oam -16, -12, $66, 0
	frame_oam -16,  -4, $68, 0
	frame_oam -16,   4, $6a, 0
	db $80

.frame_4
	frame_oam -31, -12, $00, 0
	frame_oam -31,  -4, $02, 0
	frame_oam -31,   4, $04, 0
	frame_oam -15, -12, $20, 0
	frame_oam -15,  -4, $22, 0
	frame_oam -15,   4, $24, 0
	db $80

.frame_5
	frame_oam -32,  -4, $5c, 0
	frame_oam -32,   4, $5e, 0
	frame_oam -16, -12, $7a, 0
	frame_oam -16,  -4, $7c, 0
	frame_oam -16,   4, $7e, 0
	frame_oam -31, -12, $00, 0
	db $80

.frame_6
	frame_oam -32, -12, $54, 0
	frame_oam -32,  -4, $56, 0
	frame_oam -32,   4, $58, 0
	frame_oam -16, -12, $74, 0
	frame_oam -16,  -4, $76, 0
	frame_oam -16,   4, $78, 0
	db $80

.frame_7
	frame_oam -32,   0, $50, 0
	frame_oam -16,   0, $70, 0
	frame_oam -16,   8, $72, 0
	frame_oam -32,   8, $4c, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $50, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $70, 0 | OAMF_XFLIP
	frame_oam -16, -16, $72, 0 | OAMF_XFLIP
	frame_oam -32, -16, $4c, 0
	db $80

.frame_8
	frame_oam -32,   4, $54, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $56, 0 | OAMF_XFLIP
	frame_oam -32, -12, $58, 0 | OAMF_XFLIP
	frame_oam -16,   4, $74, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $76, 0 | OAMF_XFLIP
	frame_oam -16, -12, $78, 0 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -32,  -4, $5c, 0 | OAMF_XFLIP
	frame_oam -32, -12, $5e, 0 | OAMF_XFLIP
	frame_oam -16,   4, $7a, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $7c, 0 | OAMF_XFLIP
	frame_oam -16, -12, $7e, 0 | OAMF_XFLIP
	frame_oam -32,   4, $40, 0 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -31,  -4, $00, 0 | OAMF_XFLIP
	frame_oam -31, -12, $02, 0 | OAMF_XFLIP
	frame_oam -31, -20, $04, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $20, 0 | OAMF_XFLIP
	frame_oam -15, -12, $22, 0 | OAMF_XFLIP
	frame_oam -15, -20, $24, 0 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -32,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -32, -12, $48, 0 | OAMF_XFLIP
	frame_oam -32, -20, $4a, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $66, 0 | OAMF_XFLIP
	frame_oam -16, -12, $68, 0 | OAMF_XFLIP
	frame_oam -16, -20, $6a, 0 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -32, -24, $4c, 0
	frame_oam -32, -16, $4e, 0
	frame_oam -16, -24, $6c, 0
	frame_oam -16, -16, $6e, 0
	frame_oam -32,   0, $4c, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $4e, 0 | OAMF_XFLIP
	frame_oam -16,   0, $6c, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $6e, 0 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -32, -20, $46, 0
	frame_oam -32, -12, $48, 0
	frame_oam -32,  -4, $4a, 0
	frame_oam -16, -20, $66, 0
	frame_oam -16, -12, $68, 0
	frame_oam -16,  -4, $6a, 0
	db $80

.frame_14
	frame_oam -31, -20, $00, 0
	frame_oam -31, -12, $02, 0
	frame_oam -31,  -4, $04, 0
	frame_oam -15, -20, $20, 0
	frame_oam -15, -12, $22, 0
	frame_oam -15,  -4, $24, 0
	db $80

.frame_15
	frame_oam -32, -12, $5c, 0
	frame_oam -32,  -4, $5e, 0
	frame_oam -16, -20, $7a, 0
	frame_oam -16, -12, $7c, 0
	frame_oam -16,  -4, $7e, 0
	frame_oam -31, -20, $40, 0
	db $80

.frame_16
	frame_oam -32, -20, $54, 0
	frame_oam -32, -12, $56, 0
	frame_oam -32,  -4, $58, 0
	frame_oam -16, -20, $74, 0
	frame_oam -16, -12, $76, 0
	frame_oam -16,  -4, $78, 0
	db $80

.frame_17
	frame_oam -32,  -8, $50, 0
	frame_oam -16,  -8, $70, 0
	frame_oam -16,   0, $72, 0
	frame_oam -32,   0, $4c, 0 | OAMF_XFLIP
	frame_oam -32, -16, $50, 0 | OAMF_XFLIP
	frame_oam -16, -16, $70, 0 | OAMF_XFLIP
	frame_oam -16, -24, $72, 0 | OAMF_XFLIP
	frame_oam -32, -24, $4c, 0
	db $80

.frame_18
	frame_oam -32,  -4, $54, 0 | OAMF_XFLIP
	frame_oam -32, -12, $56, 0 | OAMF_XFLIP
	frame_oam -32, -20, $58, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $74, 0 | OAMF_XFLIP
	frame_oam -16, -12, $76, 0 | OAMF_XFLIP
	frame_oam -16, -20, $78, 0 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -32, -12, $5c, 0 | OAMF_XFLIP
	frame_oam -32, -20, $5e, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $7a, 0 | OAMF_XFLIP
	frame_oam -16, -12, $7c, 0 | OAMF_XFLIP
	frame_oam -16, -20, $7e, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $40, 0 | OAMF_XFLIP
	db $80

Frameset_14cbe::
	db $01,  1
	db $02,  2
	db $03,  1
	db $ff

Frameset_14cc5::
	db $03,  1
	db $02,  1
	db $01,  1
	db $ff

Frameset_14ccc::
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

Frameset_14ce1::
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

Frameset_14cf6::
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

Frameset_14d0b::
	db $06,  3
	db $07,  3
	db $ff

Frameset_14d10::
	db $08,  3
	db $07,  3
	db $ff

Frameset_14d15::
	db $07,  4
	db $ff

Frameset_14d18::
	db $02,  4
	db $ff

OAM_14d1b::
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
	frame_oam -40, -16, $00, 0
	frame_oam -31,  -8, $02, 0
	frame_oam -31,   0, $04, 0
	frame_oam -31,   8, $06, 0
	frame_oam -24, -16, $20, 0
	frame_oam -15,  -8, $22, 0
	frame_oam -15,   0, $24, 0
	frame_oam -15,   8, $26, 0
	db $80

.frame_1
	frame_oam -31,  -9, $0a, 0
	frame_oam -31,  -1, $0c, 0
	frame_oam -31,   7, $0e, 0
	frame_oam -25, -17, $28, 0
	frame_oam -15,  -9, $2a, 0
	frame_oam -15,  -1, $2c, 0
	frame_oam -15,   7, $2e, 0
	frame_oam -41, -17, $00, 0
	db $80

.frame_2
	frame_oam -32,  -9, $12, 0
	frame_oam -32,  -1, $14, 0
	frame_oam -32,   7, $16, 0
	frame_oam -26, -17, $30, 0
	frame_oam -16,  -9, $32, 0
	frame_oam -16,  -1, $34, 0
	frame_oam -16,   7, $36, 0
	frame_oam -42, -17, $00, 0
	db $80

.frame_3
	frame_oam -40, -15, $18, 0
	frame_oam -31,  -7, $1a, 0
	frame_oam -31,   1, $1c, 0
	frame_oam -31,   9, $1e, 0
	frame_oam -24, -15, $38, 0
	frame_oam -15,  -7, $3a, 0
	frame_oam -15,   1, $3c, 0
	frame_oam -15,   9, $3e, 0
	db $80

.frame_4
	frame_oam -40, -16, $00, 0
	frame_oam -31,   8, $06, 0
	frame_oam -24, -16, $20, 0
	frame_oam -15,  -8, $22, 0
	frame_oam -15,   0, $24, 0
	frame_oam -15,   8, $26, 0
	frame_oam -31,  -8, $40, 0
	frame_oam -31,   0, $42, 0
	db $80

.frame_5
	frame_oam -31,   7, $0e, 0
	frame_oam -25, -17, $28, 0
	frame_oam -15,  -9, $2a, 0
	frame_oam -15,  -1, $2c, 0
	frame_oam -15,   7, $2e, 0
	frame_oam -31,  -9, $44, 0
	frame_oam -31,  -1, $46, 0
	frame_oam -41, -17, $00, 0
	db $80

.frame_6
	frame_oam -32,   7, $16, 0
	frame_oam -26, -17, $30, 0
	frame_oam -16,  -9, $32, 0
	frame_oam -16,  -1, $34, 0
	frame_oam -16,   7, $36, 0
	frame_oam -32,  -9, $48, 0
	frame_oam -32,  -1, $4a, 0
	frame_oam -42, -17, $00, 0
	db $80

.frame_7
	frame_oam -40, -15, $18, 0
	frame_oam -31,   9, $1e, 0
	frame_oam -24, -15, $38, 0
	frame_oam -15,  -7, $3a, 0
	frame_oam -15,   1, $3c, 0
	frame_oam -15,   9, $3e, 0
	frame_oam -31,  -7, $4c, 0
	frame_oam -31,   1, $4e, 0
	db $80

.frame_8
	frame_oam -40,   8, $00, 0 | OAMF_XFLIP
	frame_oam -31,   0, $02, 0 | OAMF_XFLIP
	frame_oam -31,  -8, $04, 0 | OAMF_XFLIP
	frame_oam -31, -16, $06, 0 | OAMF_XFLIP
	frame_oam -24,   8, $20, 0 | OAMF_XFLIP
	frame_oam -15,   0, $22, 0 | OAMF_XFLIP
	frame_oam -15,  -8, $24, 0 | OAMF_XFLIP
	frame_oam -15, -16, $26, 0 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -31,   1, $0a, 0 | OAMF_XFLIP
	frame_oam -31,  -7, $0c, 0 | OAMF_XFLIP
	frame_oam -31, -15, $0e, 0 | OAMF_XFLIP
	frame_oam -25,   9, $28, 0 | OAMF_XFLIP
	frame_oam -15,   1, $2a, 0 | OAMF_XFLIP
	frame_oam -15,  -7, $2c, 0 | OAMF_XFLIP
	frame_oam -15, -15, $2e, 0 | OAMF_XFLIP
	frame_oam -41,   9, $00, 0 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -32,   1, $12, 0 | OAMF_XFLIP
	frame_oam -32,  -7, $14, 0 | OAMF_XFLIP
	frame_oam -32, -15, $16, 0 | OAMF_XFLIP
	frame_oam -26,   9, $30, 0 | OAMF_XFLIP
	frame_oam -16,   1, $32, 0 | OAMF_XFLIP
	frame_oam -16,  -7, $34, 0 | OAMF_XFLIP
	frame_oam -16, -15, $36, 0 | OAMF_XFLIP
	frame_oam -42,   9, $00, 0 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -40,   7, $18, 0 | OAMF_XFLIP
	frame_oam -31,  -1, $1a, 0 | OAMF_XFLIP
	frame_oam -31,  -9, $1c, 0 | OAMF_XFLIP
	frame_oam -31, -17, $1e, 0 | OAMF_XFLIP
	frame_oam -24,   7, $38, 0 | OAMF_XFLIP
	frame_oam -15,  -1, $3a, 0 | OAMF_XFLIP
	frame_oam -15,  -9, $3c, 0 | OAMF_XFLIP
	frame_oam -15, -17, $3e, 0 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -40,   8, $00, 0 | OAMF_XFLIP
	frame_oam -31, -16, $06, 0 | OAMF_XFLIP
	frame_oam -24,   8, $20, 0 | OAMF_XFLIP
	frame_oam -15,   0, $22, 0 | OAMF_XFLIP
	frame_oam -15,  -8, $24, 0 | OAMF_XFLIP
	frame_oam -15, -16, $26, 0 | OAMF_XFLIP
	frame_oam -31,   0, $40, 0 | OAMF_XFLIP
	frame_oam -31,  -8, $42, 0 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -31, -15, $0e, 0 | OAMF_XFLIP
	frame_oam -25,   9, $28, 0 | OAMF_XFLIP
	frame_oam -15,   1, $2a, 0 | OAMF_XFLIP
	frame_oam -15,  -7, $2c, 0 | OAMF_XFLIP
	frame_oam -15, -15, $2e, 0 | OAMF_XFLIP
	frame_oam -31,   1, $44, 0 | OAMF_XFLIP
	frame_oam -31,  -7, $46, 0 | OAMF_XFLIP
	frame_oam -41,   9, $00, 0 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -32, -15, $16, 0 | OAMF_XFLIP
	frame_oam -26,   9, $30, 0 | OAMF_XFLIP
	frame_oam -16,   1, $32, 0 | OAMF_XFLIP
	frame_oam -16,  -7, $34, 0 | OAMF_XFLIP
	frame_oam -16, -15, $36, 0 | OAMF_XFLIP
	frame_oam -32,   1, $48, 0 | OAMF_XFLIP
	frame_oam -32,  -7, $4a, 0 | OAMF_XFLIP
	frame_oam -42,   9, $00, 0 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -40,   7, $18, 0 | OAMF_XFLIP
	frame_oam -31, -17, $1e, 0 | OAMF_XFLIP
	frame_oam -24,   7, $38, 0 | OAMF_XFLIP
	frame_oam -15,  -1, $3a, 0 | OAMF_XFLIP
	frame_oam -15,  -9, $3c, 0 | OAMF_XFLIP
	frame_oam -15, -17, $3e, 0 | OAMF_XFLIP
	frame_oam -31,  -1, $4c, 0 | OAMF_XFLIP
	frame_oam -31,  -9, $4e, 0 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -31,  -8, $02, 0
	frame_oam -31,   0, $04, 0
	frame_oam -15,  -8, $22, 0
	frame_oam -15,   0, $24, 0
	frame_oam -31,   8, $06, 0
	frame_oam -15,   8, $26, 0
	frame_oam -32, -16, $50, 1
	frame_oam -16, -16, $50, 1 | OAMF_YFLIP
	db $80

.frame_17
	frame_oam -32, -15, $52, 1
	frame_oam -16, -15, $52, 1 | OAMF_YFLIP
	frame_oam -31,   7, $0e, 0
	frame_oam -15,  -1, $2c, 0
	frame_oam -15,   7, $2e, 0
	frame_oam -31,  -1, $46, 0
	frame_oam -15,  -9, $2a, 0
	frame_oam -31,  -9, $44, 0
	db $80

.frame_18
	frame_oam -32,  -1, $14, 0
	frame_oam -32,   7, $16, 0
	frame_oam -16,  -1, $34, 0
	frame_oam -16,   7, $36, 0
	frame_oam -33,  -9, $56, 0
	frame_oam -17,  -9, $56, 0 | OAMF_YFLIP
	frame_oam -33, -17, $54, 1
	frame_oam -17, -17, $54, 1 | OAMF_YFLIP
	db $80

.frame_19
	frame_oam -31,   9, $1e, 0
	frame_oam -15,   9, $3e, 0
	frame_oam -40, -15, $18, 1
	frame_oam -32,   1, $58, 0
	frame_oam -16,   1, $58, 0 | OAMF_YFLIP
	frame_oam -32,  -7, $56, 0
	frame_oam -16,  -7, $56, 0 | OAMF_YFLIP
	frame_oam -24, -15, $5e, 1
	db $80

.frame_20
	frame_oam -40, -16, $00, 0
	frame_oam -31,  -8, $02, 0
	frame_oam -31,   0, $04, 0
	frame_oam -31,   8, $06, 0
	frame_oam -15,  -8, $22, 0
	frame_oam -15,   0, $24, 0
	frame_oam -15,   8, $26, 0
	frame_oam -24, -16, $5a, 0
	db $80

.frame_21
	frame_oam -31,  -9, $0a, 0
	frame_oam -31,  -1, $0c, 0
	frame_oam -31,   7, $0e, 0
	frame_oam -15,  -9, $2a, 0
	frame_oam -15,  -1, $2c, 0
	frame_oam -15,   7, $2e, 0
	frame_oam -41, -17, $00, 0
	frame_oam -25, -17, $5c, 0
	db $80

.frame_22
	frame_oam -31,   0, $02, 0 | OAMF_XFLIP
	frame_oam -31,  -8, $04, 0 | OAMF_XFLIP
	frame_oam -15,   0, $22, 0 | OAMF_XFLIP
	frame_oam -15,  -8, $24, 0 | OAMF_XFLIP
	frame_oam -31, -16, $06, 0 | OAMF_XFLIP
	frame_oam -15, -16, $26, 0 | OAMF_XFLIP
	frame_oam -32,   8, $50, 1 | OAMF_XFLIP
	frame_oam -16,   8, $50, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_23
	frame_oam -32,   7, $52, 1 | OAMF_XFLIP
	frame_oam -16,   7, $52, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -31, -15, $0e, 0 | OAMF_XFLIP
	frame_oam -15,  -7, $2c, 0 | OAMF_XFLIP
	frame_oam -15, -15, $2e, 0 | OAMF_XFLIP
	frame_oam -31,  -7, $46, 0 | OAMF_XFLIP
	frame_oam -15,   1, $2a, 0 | OAMF_XFLIP
	frame_oam -31,   1, $44, 0 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -32,  -7, $14, 0 | OAMF_XFLIP
	frame_oam -32, -15, $16, 0 | OAMF_XFLIP
	frame_oam -16,  -7, $34, 0 | OAMF_XFLIP
	frame_oam -16, -15, $36, 0 | OAMF_XFLIP
	frame_oam -33,   1, $56, 0 | OAMF_XFLIP
	frame_oam -17,   1, $56, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -33,   9, $54, 1 | OAMF_XFLIP
	frame_oam -17,   9, $54, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_25
	frame_oam -31, -17, $1e, 0 | OAMF_XFLIP
	frame_oam -15, -17, $3e, 0 | OAMF_XFLIP
	frame_oam -40,   7, $18, 1 | OAMF_XFLIP
	frame_oam -32,  -9, $58, 0 | OAMF_XFLIP
	frame_oam -16,  -9, $58, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,  -1, $56, 0 | OAMF_XFLIP
	frame_oam -16,  -1, $56, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -24,   7, $5e, 1 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -40,   8, $00, 0 | OAMF_XFLIP
	frame_oam -31,   0, $02, 0 | OAMF_XFLIP
	frame_oam -31,  -8, $04, 0 | OAMF_XFLIP
	frame_oam -31, -16, $06, 0 | OAMF_XFLIP
	frame_oam -15,   0, $22, 0 | OAMF_XFLIP
	frame_oam -15,  -8, $24, 0 | OAMF_XFLIP
	frame_oam -15, -16, $26, 0 | OAMF_XFLIP
	frame_oam -24,   8, $5a, 0 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -31,   1, $0a, 0 | OAMF_XFLIP
	frame_oam -31,  -7, $0c, 0 | OAMF_XFLIP
	frame_oam -31, -15, $0e, 0 | OAMF_XFLIP
	frame_oam -15,   1, $2a, 0 | OAMF_XFLIP
	frame_oam -15,  -7, $2c, 0 | OAMF_XFLIP
	frame_oam -15, -15, $2e, 0 | OAMF_XFLIP
	frame_oam -41,   9, $00, 0 | OAMF_XFLIP
	frame_oam -25,   9, $5c, 0 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam -33, -17, $50, 1
	frame_oam -17, -17, $50, 1 | OAMF_YFLIP
	frame_oam -32,  -9, $12, 0
	frame_oam -32,  -1, $14, 0
	frame_oam -32,   7, $16, 0
	frame_oam -16,  -9, $32, 0
	frame_oam -16,  -1, $34, 0
	frame_oam -16,   7, $36, 0
	db $80

.frame_29
	frame_oam -33, -15, $52, 1
	frame_oam -17, -15, $52, 1 | OAMF_YFLIP
	frame_oam -32,  -9, $12, 0
	frame_oam -32,  -1, $14, 0
	frame_oam -32,   7, $16, 0
	frame_oam -16,  -9, $32, 0
	frame_oam -16,  -1, $34, 0
	frame_oam -16,   7, $36, 0
	db $80

.frame_30
	frame_oam -41, -17, $18, 1
	frame_oam -33,  -1, $58, 0
	frame_oam -17,  -1, $58, 0 | OAMF_YFLIP
	frame_oam -33,  -9, $56, 0
	frame_oam -17,  -9, $56, 0 | OAMF_YFLIP
	frame_oam -25, -17, $5e, 1
	frame_oam -32,   7, $16, 0
	frame_oam -16,   7, $36, 0
	db $80

.frame_31
	frame_oam -33,   9, $50, 1 | OAMF_XFLIP
	frame_oam -17,   9, $50, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   1, $12, 0 | OAMF_XFLIP
	frame_oam -32,  -7, $14, 0 | OAMF_XFLIP
	frame_oam -32, -15, $16, 0 | OAMF_XFLIP
	frame_oam -16,   1, $32, 0 | OAMF_XFLIP
	frame_oam -16,  -7, $34, 0 | OAMF_XFLIP
	frame_oam -16, -15, $36, 0 | OAMF_XFLIP
	db $80

.frame_32
	frame_oam -33,   7, $52, 1 | OAMF_XFLIP
	frame_oam -17,   7, $52, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   1, $12, 0 | OAMF_XFLIP
	frame_oam -32,  -7, $14, 0 | OAMF_XFLIP
	frame_oam -32, -15, $16, 0 | OAMF_XFLIP
	frame_oam -16,   1, $32, 0 | OAMF_XFLIP
	frame_oam -16,  -7, $34, 0 | OAMF_XFLIP
	frame_oam -16, -15, $36, 0 | OAMF_XFLIP
	db $80

.frame_33
	frame_oam -32,  -7, $14, 0 | OAMF_XFLIP
	frame_oam -32, -15, $16, 0 | OAMF_XFLIP
	frame_oam -16,  -7, $34, 0 | OAMF_XFLIP
	frame_oam -16, -15, $36, 0 | OAMF_XFLIP
	frame_oam -33,   1, $56, 0 | OAMF_XFLIP
	frame_oam -17,   1, $56, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -33,   9, $54, 1 | OAMF_XFLIP
	frame_oam -17,   9, $54, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_34
	frame_oam -41,   9, $18, 1 | OAMF_XFLIP
	frame_oam -33,  -7, $58, 0 | OAMF_XFLIP
	frame_oam -17,  -7, $58, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -33,   1, $56, 0 | OAMF_XFLIP
	frame_oam -17,   1, $56, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -25,   9, $5e, 1 | OAMF_XFLIP
	frame_oam -32, -15, $16, 0 | OAMF_XFLIP
	frame_oam -16, -15, $36, 0 | OAMF_XFLIP
	db $80

Frameset_151e4::
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

Frameset_151fd::
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

Frameset_15216::
	db $02,  4
	db $ff

Frameset_15219::
	db $0a,  1
	db $ff

Frameset_1521c::
	db $10,  1
	db $11,  1
	db $12,  1
	db $13,  1
	db $14,  1
	db $15,  1
	db $02,  1
	db $03,  1
	db $ff

Frameset_1522d::
	db $16,  1
	db $17,  1
	db $18,  1
	db $19,  1
	db $1a,  1
	db $1b,  1
	db $0a,  1
	db $0b,  1
	db $ff

Frameset_1523e::
	db $1c,  1
	db $1d,  1
	db $12,  1
	db $1e,  1
	db $02,  1
	db $ff

Frameset_15249::
	db $1f,  1
	db $20,  1
	db $21,  1
	db $22,  1
	db $0a,  1
	db $ff

OAM_15254::
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
	frame_oam -32,  -4, $02, 0
	frame_oam -32,   4, $04, 0
	frame_oam -32,  12, $06, 0
	frame_oam -32, -12, $00, 0
	frame_oam -16, -12, $16, 0
	frame_oam -16,  -4, $18, 0
	frame_oam -16,   4, $1a, 0
	frame_oam -19, -20, $14, 0
	frame_oam  -8,  12, $1c, 0
	db $80

.frame_1
	frame_oam -33,   3, $0c, 0
	frame_oam -33, -13, $08, 0
	frame_oam -33,  -5, $0a, 0
	frame_oam -19, -21, $1e, 0
	frame_oam -17, -13, $20, 0
	frame_oam -17,  -5, $22, 0
	frame_oam -17,   3, $24, 0
	frame_oam -18,  11, $26, 0
	db $80

.frame_2
	frame_oam -32,  -4, $02, 0
	frame_oam -32, -20, $0e, 0
	frame_oam -32, -12, $10, 0
	frame_oam -32,   4, $12, 0
	frame_oam -16, -20, $28, 0
	frame_oam -16, -12, $2a, 0
	frame_oam -16,  -4, $2c, 0
	frame_oam -16,   4, $2e, 0
	frame_oam -18,  12, $30, 0
	db $80

.frame_3
	frame_oam -32,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	frame_oam -32, -20, $06, 0 | OAMF_XFLIP
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -16,   4, $16, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $18, 0 | OAMF_XFLIP
	frame_oam -16, -12, $1a, 0 | OAMF_XFLIP
	frame_oam -19,  12, $14, 0 | OAMF_XFLIP
	frame_oam  -8, -20, $1c, 0 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -33, -11, $0c, 0 | OAMF_XFLIP
	frame_oam -33,   5, $08, 0 | OAMF_XFLIP
	frame_oam -33,  -3, $0a, 0 | OAMF_XFLIP
	frame_oam -19,  13, $1e, 0 | OAMF_XFLIP
	frame_oam -17,   5, $20, 0 | OAMF_XFLIP
	frame_oam -17,  -3, $22, 0 | OAMF_XFLIP
	frame_oam -17, -11, $24, 0 | OAMF_XFLIP
	frame_oam -18, -19, $26, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -32,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -32,  12, $0e, 0 | OAMF_XFLIP
	frame_oam -32,   4, $10, 0 | OAMF_XFLIP
	frame_oam -32, -12, $12, 0 | OAMF_XFLIP
	frame_oam -16,  12, $28, 0 | OAMF_XFLIP
	frame_oam -16,   4, $2a, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $2c, 0 | OAMF_XFLIP
	frame_oam -16, -12, $2e, 0 | OAMF_XFLIP
	frame_oam -18, -20, $30, 0 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -31, -14, $32, 0
	frame_oam -31,  -6, $34, 0
	frame_oam -15, -16, $36, 0
	frame_oam -15,  -8, $38, 0
	frame_oam -15,   0, $3a, 0
	frame_oam -15,   8, $3c, 0
	db $80

.frame_7
	frame_oam -31, -14, $32, 0
	frame_oam -31,  -6, $34, 0
	frame_oam -15, -16, $36, 0
	frame_oam -15,  -8, $3e, 0
	frame_oam -15,   0, $40, 0
	frame_oam -15,   8, $42, 0
	db $80

.frame_8
	frame_oam -31, -14, $32, 0
	frame_oam -31,  -6, $34, 0
	frame_oam -15, -16, $44, 0
	frame_oam -15,  -8, $46, 0
	frame_oam -15,   0, $48, 0
	frame_oam -15,   8, $4a, 0
	db $80

.frame_9
	frame_oam -31, -14, $32, 0
	frame_oam -31,  -6, $34, 0
	frame_oam -15, -16, $36, 0
	frame_oam -15,  -8, $4c, 0
	frame_oam -15,   0, $4e, 0
	frame_oam -14,   7, $50, 0
	db $80

.frame_10
	frame_oam -31, -14, $32, 0
	frame_oam -31,  -6, $34, 0
	frame_oam -15, -16, $36, 0
	frame_oam -15,  -8, $52, 0
	frame_oam -15,   8, $56, 0
	frame_oam -15,   0, $54, 0
	db $80

.frame_11
	frame_oam -31,   6, $32, 0 | OAMF_XFLIP
	frame_oam -31,  -2, $34, 0 | OAMF_XFLIP
	frame_oam -15,   8, $36, 0 | OAMF_XFLIP
	frame_oam -15,   0, $38, 0 | OAMF_XFLIP
	frame_oam -15,  -8, $3a, 0 | OAMF_XFLIP
	frame_oam -15, -16, $3c, 0 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -31,   6, $32, 0 | OAMF_XFLIP
	frame_oam -31,  -2, $34, 0 | OAMF_XFLIP
	frame_oam -15,   8, $36, 0 | OAMF_XFLIP
	frame_oam -15,   0, $3e, 0 | OAMF_XFLIP
	frame_oam -15,  -8, $40, 0 | OAMF_XFLIP
	frame_oam -15, -16, $42, 0 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -31,   6, $32, 0 | OAMF_XFLIP
	frame_oam -31,  -2, $34, 0 | OAMF_XFLIP
	frame_oam -15,   8, $44, 0 | OAMF_XFLIP
	frame_oam -15,   0, $46, 0 | OAMF_XFLIP
	frame_oam -15,  -8, $48, 0 | OAMF_XFLIP
	frame_oam -15, -16, $4a, 0 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -31,   6, $32, 0 | OAMF_XFLIP
	frame_oam -31,  -2, $34, 0 | OAMF_XFLIP
	frame_oam -15,   8, $36, 0 | OAMF_XFLIP
	frame_oam -15,   0, $4c, 0 | OAMF_XFLIP
	frame_oam -15,  -8, $4e, 0 | OAMF_XFLIP
	frame_oam -14, -15, $50, 0 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -31,   6, $32, 0 | OAMF_XFLIP
	frame_oam -31,  -2, $34, 0 | OAMF_XFLIP
	frame_oam -15,   8, $36, 0 | OAMF_XFLIP
	frame_oam -15,   0, $52, 0 | OAMF_XFLIP
	frame_oam -15,  -8, $54, 0 | OAMF_XFLIP
	frame_oam -15, -16, $56, 0 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -32, -15, $58, 0
	frame_oam -32,  -7, $5a, 0
	frame_oam -32,   1, $5c, 0
	frame_oam -26,   9, $5e, 0
	frame_oam -16, -15, $60, 0
	frame_oam -16,  -7, $62, 0
	frame_oam -16,   1, $64, 0
	db $80

.frame_17
	frame_oam -32, -15, $66, 0
	frame_oam -32,  -7, $68, 0
	frame_oam -32,   1, $6a, 0
	frame_oam -32,   9, $6c, 0
	frame_oam -16, -15, $6e, 0
	frame_oam -16,  -7, $70, 0
	frame_oam -16,   1, $72, 0
	frame_oam -16,   9, $74, 0
	frame_oam   0,  -4, $7e, 0
	db $80

.frame_18
	frame_oam -16,  -8, $78, 0
	frame_oam -16,   0, $7a, 0
	frame_oam -16,   8, $7c, 0
	frame_oam -32, -16, $66, 0
	frame_oam -32,  -8, $68, 0
	frame_oam -32,   0, $6a, 0
	frame_oam -32,   8, $6c, 0
	frame_oam -16, -16, $76, 0
	frame_oam   1,  -3, $7e, 0 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -32,   7, $58, 0 | OAMF_XFLIP
	frame_oam -32,  -1, $5a, 0 | OAMF_XFLIP
	frame_oam -32,  -9, $5c, 0 | OAMF_XFLIP
	frame_oam -26, -17, $5e, 0 | OAMF_XFLIP
	frame_oam -16,   7, $60, 0 | OAMF_XFLIP
	frame_oam -16,  -1, $62, 0 | OAMF_XFLIP
	frame_oam -16,  -9, $64, 0 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -32,   7, $66, 0 | OAMF_XFLIP
	frame_oam -32,  -1, $68, 0 | OAMF_XFLIP
	frame_oam -32,  -9, $6a, 0 | OAMF_XFLIP
	frame_oam -32, -17, $6c, 0 | OAMF_XFLIP
	frame_oam -16,   7, $6e, 0 | OAMF_XFLIP
	frame_oam -16,  -1, $70, 0 | OAMF_XFLIP
	frame_oam -16,  -9, $72, 0 | OAMF_XFLIP
	frame_oam -16, -17, $74, 0 | OAMF_XFLIP
	frame_oam   0,  -4, $7e, 0 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -16,   0, $78, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $7a, 0 | OAMF_XFLIP
	frame_oam -16, -16, $7c, 0 | OAMF_XFLIP
	frame_oam -32,   8, $66, 0 | OAMF_XFLIP
	frame_oam -32,   0, $68, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $6a, 0 | OAMF_XFLIP
	frame_oam -32, -16, $6c, 0 | OAMF_XFLIP
	frame_oam -16,   8, $76, 0 | OAMF_XFLIP
	frame_oam   1,  -5, $7e, 0
	db $80

.frame_22
	frame_oam -32, -14, $32, 0
	frame_oam -32,  -6, $34, 0
	frame_oam -16, -16, $36, 0
	frame_oam -16,  -8, $4c, 0
	frame_oam -15,  -1, $4e, 0
	frame_oam -15,   7, $50, 0
	db $80

.frame_23
	frame_oam -32,   6, $32, 0 | OAMF_XFLIP
	frame_oam -32,  -2, $34, 0 | OAMF_XFLIP
	frame_oam -16,   8, $36, 0 | OAMF_XFLIP
	frame_oam -16,   0, $4c, 0 | OAMF_XFLIP
	frame_oam -15,  -7, $4e, 0 | OAMF_XFLIP
	frame_oam -15, -15, $50, 0 | OAMF_XFLIP
	db $80

Frameset_15554::
	db $00,  5
	db $01,  5
	db $02,  5
	db $ff

Frameset_1555b::
	db $03,  5
	db $04,  5
	db $05,  5
	db $ff

Frameset_15562::
	db $08,  6
	db $07,  5
	db $16, 30
	db $ff

Frameset_15569::
	db $09,  4
	db $ff

Frameset_1556c::
	db $0d,  6
	db $0c,  5
	db $17, 30
	db $ff

Frameset_15573::
	db $0e,  4
	db $ff

Frameset_15576::
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

Frameset_1558b::
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

Frameset_155a0::
	db $10,  8
	db $ff

Frameset_155a3::
	db $13,  8
	db $ff

Frameset_155a6::
	db $11,  5
	db $12,  5
	db $ff

Frameset_155ab::
	db $14,  5
	db $15,  5
	db $ff

Frameset_155b0::
	db $00,  3
	db $01,  3
	db $02,  3
	db $ff

Frameset_155b7::
	db $03,  3
	db $04,  3
	db $05,  3
	db $ff

Frameset_155be::
	db $09,  3
	db $0a,  3
	db $16,  2
	db $ff

Frameset_155c5::
	db $0e,  3
	db $0f,  3
	db $17,  2
	db $ff

OAM_155cc::
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
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32,   4, $04, 0
	frame_oam -16, -12, $20, 0
	frame_oam -16,  -4, $22, 0
	frame_oam -16,   4, $24, 0
	db $80

.frame_1
	frame_oam -32, -12, $06, 0
	frame_oam -32,  -4, $08, 0
	frame_oam -32,   4, $0a, 0
	frame_oam -16, -11, $26, 0
	frame_oam -16,  -3, $28, 0
	frame_oam -16,   5, $2a, 0
	db $80

.frame_2
	frame_oam -32, -12, $0c, 0
	frame_oam -32,  -4, $0e, 0
	frame_oam -32,   4, $10, 0
	frame_oam -16, -12, $2c, 0
	frame_oam -16,  -4, $2e, 0
	frame_oam -16,   4, $30, 0
	db $80

.frame_3
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	frame_oam -16,   4, $20, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -16, -12, $24, 0 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -32,   4, $06, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -32, -12, $0a, 0 | OAMF_XFLIP
	frame_oam -16,   3, $26, 0 | OAMF_XFLIP
	frame_oam -16,  -5, $28, 0 | OAMF_XFLIP
	frame_oam -16, -13, $2a, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -32,   4, $0c, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $0e, 0 | OAMF_XFLIP
	frame_oam -32, -12, $10, 0 | OAMF_XFLIP
	frame_oam -16,   4, $2c, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $2e, 0 | OAMF_XFLIP
	frame_oam -16, -12, $30, 0 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -32, -16, $12, 0
	frame_oam -32,  -8, $14, 0
	frame_oam -32,   0, $16, 0
	frame_oam -32,   8, $18, 0
	frame_oam -16, -16, $32, 0
	frame_oam -16,  -8, $34, 0
	frame_oam -16,   0, $36, 0
	frame_oam -16,   8, $38, 0
	db $80

.frame_7
	frame_oam -32,   8, $12, 0 | OAMF_XFLIP
	frame_oam -32,   0, $14, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $16, 0 | OAMF_XFLIP
	frame_oam -32, -16, $18, 0 | OAMF_XFLIP
	frame_oam -16,   8, $32, 0 | OAMF_XFLIP
	frame_oam -16,   0, $34, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $36, 0 | OAMF_XFLIP
	frame_oam -16, -16, $38, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -32, -16, $1a, 0
	frame_oam -32,  -8, $1c, 0
	frame_oam -32,   0, $1e, 0
	frame_oam -16, -16, $3a, 0
	frame_oam -16,  -8, $3c, 0
	frame_oam -16,   0, $3e, 0
	frame_oam -32,   8, $6a, 0
	frame_oam -16,   8, $6c, 0
	db $80

.frame_9
	frame_oam -32,   8, $1a, 0 | OAMF_XFLIP
	frame_oam -32,   0, $1c, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $1e, 0 | OAMF_XFLIP
	frame_oam -16,   8, $3a, 0 | OAMF_XFLIP
	frame_oam -16,   0, $3c, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $3e, 0 | OAMF_XFLIP
	frame_oam -32, -16, $6a, 0 | OAMF_XFLIP
	frame_oam -16, -16, $6c, 0 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -16,   4, $2c, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $2e, 0 | OAMF_XFLIP
	frame_oam -16, -12, $30, 0 | OAMF_XFLIP
	frame_oam -32,   4, $50, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $52, 0 | OAMF_XFLIP
	frame_oam -32, -12, $54, 0 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -32, -12, $40, 0 | OAMF_XFLIP
	frame_oam -29, -20, $42, 0 | OAMF_XFLIP
	frame_oam -16,   4, $44, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -16, -12, $48, 0 | OAMF_XFLIP
	frame_oam -32,   4, $50, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $52, 0 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -16,   4, $44, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -32,   4, $50, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $52, 0 | OAMF_XFLIP
	frame_oam -32, -12, $56, 0 | OAMF_XFLIP
	frame_oam -28, -20, $58, 0 | OAMF_XFLIP
	frame_oam -16, -12, $5a, 0 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -32, -12, $4a, 0 | OAMF_XFLIP
	frame_oam -16,   4, $44, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $4c, 0 | OAMF_XFLIP
	frame_oam -16, -12, $4e, 0 | OAMF_XFLIP
	frame_oam -32,   4, $50, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $52, 0 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16,   4, $44, 0 | OAMF_XFLIP
	frame_oam -32,   4, $50, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $52, 0 | OAMF_XFLIP
	frame_oam -32, -12, $64, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $66, 0 | OAMF_XFLIP
	frame_oam -16, -12, $68, 0 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -16,   4, $44, 0 | OAMF_XFLIP
	frame_oam -32,   4, $50, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $5c, 0 | OAMF_XFLIP
	frame_oam -32, -12, $5e, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $60, 0 | OAMF_XFLIP
	frame_oam -16, -12, $62, 0 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -16, -12, $2c, 0
	frame_oam -16,  -4, $2e, 0
	frame_oam -16,   4, $30, 0
	frame_oam -32, -12, $50, 0
	frame_oam -32,  -4, $52, 0
	frame_oam -32,   4, $54, 0
	db $80

.frame_17
	frame_oam -32,   4, $40, 0
	frame_oam -29,  12, $42, 0
	frame_oam -16, -12, $44, 0
	frame_oam -16,  -4, $46, 0
	frame_oam -16,   4, $48, 0
	frame_oam -32, -12, $50, 0
	frame_oam -32,  -4, $52, 0
	db $80

.frame_18
	frame_oam -16, -12, $44, 0
	frame_oam -16,  -4, $46, 0
	frame_oam -32, -12, $50, 0
	frame_oam -32,  -4, $52, 0
	frame_oam -32,   4, $56, 0
	frame_oam -28,  12, $58, 0
	frame_oam -16,   4, $5a, 0
	db $80

.frame_19
	frame_oam -32,   4, $4a, 0
	frame_oam -16, -12, $44, 0
	frame_oam -16,  -4, $4c, 0
	frame_oam -16,   4, $4e, 0
	frame_oam -32, -12, $50, 0
	frame_oam -32,  -4, $52, 0
	db $80

.frame_20
	frame_oam -16, -12, $44, 0
	frame_oam -32, -12, $50, 0
	frame_oam -32,  -4, $52, 0
	frame_oam -32,   4, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -16,   4, $68, 0
	db $80

.frame_21
	frame_oam -16, -12, $44, 0
	frame_oam -32, -12, $50, 0
	frame_oam -32,  -4, $5c, 0
	frame_oam -32,   4, $5e, 0
	frame_oam -16,  -4, $60, 0
	frame_oam -16,   4, $62, 0
	db $80

.frame_22
	frame_oam -16,  -8, $78, 0
	frame_oam -16,   0, $78, 0 | OAMF_XFLIP
	frame_oam -32, -16, $72, 0
	frame_oam -32,  -8, $74, 0
	frame_oam -32,   8, $72, 0 | OAMF_XFLIP
	frame_oam -32,   0, $74, 0 | OAMF_XFLIP
	frame_oam -16, -16, $76, 0
	frame_oam -16,   8, $76, 0 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -32,   7, $72, 0 | OAMF_XFLIP
	frame_oam -32,  -1, $74, 0 | OAMF_XFLIP
	frame_oam -16, -14, $32, 0
	frame_oam -16,  -6, $34, 0
	frame_oam -16,   7, $76, 0 | OAMF_XFLIP
	frame_oam -16,  -1, $78, 0 | OAMF_XFLIP
	frame_oam -32,  -5, $70, 0 | OAMF_XFLIP
	frame_oam -32, -13, $6e, 0
	db $80

.frame_24
	frame_oam -32, -12, $6e, 0
	frame_oam -32,  -4, $70, 0
	frame_oam -32,   4, $6e, 0 | OAMF_XFLIP
	frame_oam -16, -16, $7a, 0
	frame_oam -16,  -8, $7c, 0
	frame_oam -16,   8, $7a, 0 | OAMF_XFLIP
	frame_oam -16,   0, $7c, 0 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -32, -15, $72, 0
	frame_oam -32,  -7, $74, 0
	frame_oam -16,   6, $32, 0 | OAMF_XFLIP
	frame_oam -16,  -2, $34, 0 | OAMF_XFLIP
	frame_oam -16, -15, $76, 0
	frame_oam -16,  -7, $78, 0
	frame_oam -32,  -3, $70, 0
	frame_oam -32,   5, $6e, 0 | OAMF_XFLIP
	db $80

Frameset_158d6::
	db $00,  3
	db $01,  3
	db $02,  2
	db $00,  2
	db $03,  3
	db $04,  3
	db $05,  2
	db $03,  2
	db $ff

Frameset_158e7::
	db $01,  3
	db $06,  3
	db $07,  3
	db $08,  3
	db $00,  3
	db $ff

Frameset_158f2::
	db $04,  3
	db $07,  3
	db $06,  3
	db $09,  3
	db $03,  3
	db $ff

Frameset_158fd::
	db $00,  4
	db $ff

Frameset_15900::
	db $03,  4
	db $ff

Frameset_15903::
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

Frameset_15924::
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

Frameset_15945::
	db $18,  4
	db $ff

Frameset_15948::
	db $16,  2
	db $17,  1
	db $06,  2
	db $18,  2
	db $19,  1
	db $07,  2
	db $ff

OAM_15955::
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
	frame_oam -14, -12, $20, 0
	frame_oam -14,  -4, $22, 0
	frame_oam -14,   4, $24, 0
	frame_oam -30, -12, $00, 0
	frame_oam -30,  -4, $02, 0
	frame_oam -30,   4, $04, 0
	db $80

.frame_1
	frame_oam -33, -12, $06, 0
	frame_oam -33,  -4, $08, 0
	frame_oam -33,   4, $0a, 0
	frame_oam -17, -12, $20, 0
	frame_oam -17,  -4, $22, 0
	frame_oam -17,   4, $24, 0
	db $80

.frame_2
	frame_oam -34, -12, $12, 0
	frame_oam -34,  -4, $14, 0
	frame_oam -34,   4, $16, 0
	frame_oam -50,  -8, $1c, 0
	frame_oam -50,   0, $1e, 0
	frame_oam -18, -12, $20, 0
	frame_oam -18,  -4, $26, 0
	frame_oam -18,   4, $28, 0
	db $80

.frame_3
	frame_oam -34, -12, $0c, 0
	frame_oam -34,  -4, $0e, 0
	frame_oam -34,   4, $10, 0
	frame_oam -18, -10, $2a, 0
	frame_oam -18,  -2, $30, 0
	frame_oam -18,   6, $32, 0
	db $80

.frame_4
	frame_oam -32, -12, $0c, 0
	frame_oam -32,  -4, $0e, 0
	frame_oam -32,   4, $10, 0
	frame_oam -16, -10, $2a, 0
	frame_oam -16,  -2, $30, 0
	frame_oam -16,   6, $32, 0
	db $80

.frame_5
	frame_oam -31, -12, $00, 0
	frame_oam -31,   4, $04, 0
	frame_oam -15, -10, $2a, 0
	frame_oam -15,  -2, $2c, 0
	frame_oam -15,   6, $2e, 0
	frame_oam -31,  -4, $34, 0
	db $80

.frame_6
	frame_oam -33, -12, $00, 0
	frame_oam -33,   4, $04, 0
	frame_oam -33,  -4, $34, 0
	frame_oam -17,  -2, $30, 0
	frame_oam -17,   6, $32, 0
	frame_oam -17, -10, $2a, 0
	db $80

.frame_7
	frame_oam -14,   4, $20, 0 | OAMF_XFLIP
	frame_oam -14,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -14, -12, $24, 0 | OAMF_XFLIP
	frame_oam -30,   4, $00, 0 | OAMF_XFLIP
	frame_oam -30,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -30, -12, $04, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -33,   4, $06, 0 | OAMF_XFLIP
	frame_oam -33,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -33, -12, $0a, 0 | OAMF_XFLIP
	frame_oam -17,   4, $20, 0 | OAMF_XFLIP
	frame_oam -17,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -17, -12, $24, 0 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -34,   4, $12, 0 | OAMF_XFLIP
	frame_oam -34,  -4, $14, 0 | OAMF_XFLIP
	frame_oam -34, -12, $16, 0 | OAMF_XFLIP
	frame_oam -50,   0, $1c, 0 | OAMF_XFLIP
	frame_oam -50,  -8, $1e, 0 | OAMF_XFLIP
	frame_oam -18,   4, $20, 0 | OAMF_XFLIP
	frame_oam -18,  -4, $26, 0 | OAMF_XFLIP
	frame_oam -18, -12, $28, 0 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -34,   4, $0c, 0 | OAMF_XFLIP
	frame_oam -34,  -4, $0e, 0 | OAMF_XFLIP
	frame_oam -34, -12, $10, 0 | OAMF_XFLIP
	frame_oam -18,   2, $2a, 0 | OAMF_XFLIP
	frame_oam -18,  -6, $30, 0 | OAMF_XFLIP
	frame_oam -18, -14, $32, 0 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -32,   4, $0c, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $0e, 0 | OAMF_XFLIP
	frame_oam -32, -12, $10, 0 | OAMF_XFLIP
	frame_oam -16,   2, $2a, 0 | OAMF_XFLIP
	frame_oam -16,  -6, $30, 0 | OAMF_XFLIP
	frame_oam -16, -14, $32, 0 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -31,   4, $00, 0 | OAMF_XFLIP
	frame_oam -31, -12, $04, 0 | OAMF_XFLIP
	frame_oam -15,   2, $2a, 0 | OAMF_XFLIP
	frame_oam -15,  -6, $2c, 0 | OAMF_XFLIP
	frame_oam -15, -14, $2e, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $34, 0 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -33,   4, $00, 0 | OAMF_XFLIP
	frame_oam -33, -12, $04, 0 | OAMF_XFLIP
	frame_oam -33,  -4, $34, 0 | OAMF_XFLIP
	frame_oam -17,  -6, $30, 0 | OAMF_XFLIP
	frame_oam -17, -14, $32, 0 | OAMF_XFLIP
	frame_oam -17,   2, $2a, 0 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -32, -12, $36, 0
	frame_oam -32,  -4, $38, 0
	frame_oam -32,   4, $3a, 0
	frame_oam -16, -12, $3c, 0
	frame_oam -16,  -4, $3e, 0
	frame_oam -16,   4, $40, 0
	db $80

.frame_15
	frame_oam -33, -12, $36, 0
	frame_oam -33,  -4, $38, 0
	frame_oam -33,   4, $42, 0
	frame_oam -17, -12, $44, 0
	frame_oam -17,  -4, $46, 0
	frame_oam -17,   4, $48, 0
	db $80

.frame_16
	frame_oam -32, -12, $4a, 0
	frame_oam -32,  -4, $4c, 0
	frame_oam -32,   4, $4e, 0
	frame_oam -16, -12, $50, 0
	frame_oam -16,  -4, $52, 0
	frame_oam -16,   4, $54, 0
	db $80

.frame_17
	frame_oam -32, -10, $56, 0
	frame_oam -32,  -2, $58, 0
	frame_oam -16, -12, $5a, 0
	frame_oam -16,  -4, $5c, 0
	frame_oam -16,   4, $5e, 0
	db $80

.frame_18
	frame_oam -32,   4, $36, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $38, 0 | OAMF_XFLIP
	frame_oam -32, -12, $3a, 0 | OAMF_XFLIP
	frame_oam -16,   4, $3c, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $3e, 0 | OAMF_XFLIP
	frame_oam -16, -12, $40, 0 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -33,   4, $36, 0 | OAMF_XFLIP
	frame_oam -33,  -4, $38, 0 | OAMF_XFLIP
	frame_oam -33, -12, $42, 0 | OAMF_XFLIP
	frame_oam -17,   4, $44, 0 | OAMF_XFLIP
	frame_oam -17,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -17, -12, $48, 0 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -32,   4, $4a, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $4c, 0 | OAMF_XFLIP
	frame_oam -32, -12, $4e, 0 | OAMF_XFLIP
	frame_oam -16,   4, $50, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $52, 0 | OAMF_XFLIP
	frame_oam -16, -12, $54, 0 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -32,   2, $56, 0 | OAMF_XFLIP
	frame_oam -32,  -6, $58, 0 | OAMF_XFLIP
	frame_oam -16,   4, $5a, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $5c, 0 | OAMF_XFLIP
	frame_oam -16, -12, $5e, 0 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -33,   4, $42, 0
	frame_oam -17, -12, $44, 0
	frame_oam -17,  -4, $46, 0
	frame_oam -17,   4, $48, 0
	frame_oam -33, -12, $60, 0
	frame_oam -33,  -4, $62, 0
	db $80

.frame_23
	frame_oam -33, -12, $42, 0 | OAMF_XFLIP
	frame_oam -17,   4, $44, 0 | OAMF_XFLIP
	frame_oam -17,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -17, -12, $48, 0 | OAMF_XFLIP
	frame_oam -33,   4, $60, 0 | OAMF_XFLIP
	frame_oam -33,  -4, $62, 0 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -33,   4, $42, 0
	frame_oam -17, -12, $44, 0
	frame_oam -17,  -4, $46, 0
	frame_oam -17,   4, $48, 0
	frame_oam -33, -12, $60, 0
	frame_oam -33,  -4, $62, 0
	db $80

.frame_25
	frame_oam -33,   4, $42, 0
	frame_oam -17, -12, $44, 0
	frame_oam -17,  -4, $46, 0
	frame_oam -17,   4, $48, 0
	frame_oam -33, -12, $64, 0
	frame_oam -33,  -4, $66, 0
	db $80

.frame_26
	frame_oam -33,   4, $42, 0
	frame_oam -17,  -4, $46, 0
	frame_oam -17,   4, $48, 0
	frame_oam -33,  -4, $66, 0
	frame_oam -33, -12, $36, 0
	frame_oam -17, -12, $68, 0
	db $80

.frame_27
	frame_oam -33, -12, $42, 0 | OAMF_XFLIP
	frame_oam -17,   4, $44, 0 | OAMF_XFLIP
	frame_oam -17,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -17, -12, $48, 0 | OAMF_XFLIP
	frame_oam -33,   4, $64, 0 | OAMF_XFLIP
	frame_oam -33,  -4, $66, 0 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam -33, -12, $42, 0 | OAMF_XFLIP
	frame_oam -17,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -17, -12, $48, 0 | OAMF_XFLIP
	frame_oam -33,  -4, $66, 0 | OAMF_XFLIP
	frame_oam -33,   4, $36, 0 | OAMF_XFLIP
	frame_oam -17,   4, $68, 0 | OAMF_XFLIP
	db $80

.frame_29
	frame_oam -30, -12, $06, 0
	frame_oam -30,  -4, $08, 0
	frame_oam -30,   4, $0a, 0
	frame_oam -14, -12, $20, 0
	frame_oam -14,  -4, $22, 0
	frame_oam -14,   4, $24, 0
	db $80

.frame_30
	frame_oam -14, -12, $20, 0
	frame_oam -14,  -4, $22, 0
	frame_oam -14,   4, $24, 0
	frame_oam -30, -12, $0c, 0
	frame_oam -30,  -4, $0e, 0
	frame_oam -30,   4, $10, 0
	db $80

.frame_31
	frame_oam -30,   4, $06, 0 | OAMF_XFLIP
	frame_oam -30,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -30, -12, $0a, 0 | OAMF_XFLIP
	frame_oam -14,   4, $20, 0 | OAMF_XFLIP
	frame_oam -14,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -14, -12, $24, 0 | OAMF_XFLIP
	db $80

.frame_32
	frame_oam -14,   4, $20, 0 | OAMF_XFLIP
	frame_oam -14,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -14, -12, $24, 0 | OAMF_XFLIP
	frame_oam -30,   4, $0c, 0 | OAMF_XFLIP
	frame_oam -30,  -4, $0e, 0 | OAMF_XFLIP
	frame_oam -30, -12, $10, 0 | OAMF_XFLIP
	db $80

.frame_33
	frame_oam -14, -12, $20, 0
	frame_oam -14,  -4, $22, 0
	frame_oam -14,   4, $24, 0
	frame_oam -30,   4, $04, 0
	frame_oam -30, -12, $6a, 0
	frame_oam -30,  -4, $6c, 0
	db $80

.frame_34
	frame_oam -30,  -4, $08, 0
	frame_oam -30,   4, $0a, 0
	frame_oam -14, -12, $20, 0
	frame_oam -14,  -4, $22, 0
	frame_oam -14,   4, $24, 0
	frame_oam -30, -12, $6e, 0
	db $80

.frame_35
	frame_oam -14, -12, $20, 0
	frame_oam -14,  -4, $22, 0
	frame_oam -14,   4, $24, 0
	frame_oam -30,   4, $10, 0
	frame_oam -30, -12, $70, 0
	frame_oam -30,  -4, $72, 0
	db $80

.frame_36
	frame_oam -14,   4, $20, 0 | OAMF_XFLIP
	frame_oam -14,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -14, -12, $24, 0 | OAMF_XFLIP
	frame_oam -30, -12, $04, 0 | OAMF_XFLIP
	frame_oam -30,   4, $6a, 0 | OAMF_XFLIP
	frame_oam -30,  -4, $6c, 0 | OAMF_XFLIP
	db $80

.frame_37
	frame_oam -30,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -30, -12, $0a, 0 | OAMF_XFLIP
	frame_oam -14,   4, $20, 0 | OAMF_XFLIP
	frame_oam -14,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -14, -12, $24, 0 | OAMF_XFLIP
	frame_oam -30,   4, $6e, 0 | OAMF_XFLIP
	db $80

.frame_38
	frame_oam -14,   4, $20, 0 | OAMF_XFLIP
	frame_oam -14,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -14, -12, $24, 0 | OAMF_XFLIP
	frame_oam -30, -12, $10, 0 | OAMF_XFLIP
	frame_oam -30,   4, $70, 0 | OAMF_XFLIP
	frame_oam -30,  -4, $72, 0 | OAMF_XFLIP
	db $80

.frame_39
	frame_oam -16, -12, $20, 0
	frame_oam -16,  -4, $22, 0
	frame_oam -16,   4, $24, 0
	frame_oam -32,   4, $04, 0
	frame_oam -32, -12, $6a, 0
	frame_oam -32,  -4, $6c, 0
	db $80

.frame_40
	frame_oam -18, -12, $20, 0
	frame_oam -18,  -4, $22, 0
	frame_oam -18,   4, $24, 0
	frame_oam -34,  -4, $08, 0
	frame_oam -34,   4, $0a, 0
	frame_oam -34, -12, $6e, 0
	db $80

.frame_41
	frame_oam -16,   4, $20, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -16, -12, $24, 0 | OAMF_XFLIP
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	frame_oam -32,   4, $6a, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $6c, 0 | OAMF_XFLIP
	db $80

.frame_42
	frame_oam -34,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -34, -12, $0a, 0 | OAMF_XFLIP
	frame_oam -18,   4, $20, 0 | OAMF_XFLIP
	frame_oam -18,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -18, -12, $24, 0 | OAMF_XFLIP
	frame_oam -34,   4, $6e, 0 | OAMF_XFLIP
	db $80

.frame_43
	frame_oam -16, -12, $20, 0
	frame_oam -16,  -4, $22, 0
	frame_oam -16,   4, $24, 0
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32,   4, $04, 0
	db $80

.frame_44
	frame_oam -34, -12, $0c, 0
	frame_oam -34,  -4, $0e, 0
	frame_oam -34,   4, $10, 0
	frame_oam -18, -12, $20, 0
	frame_oam -18,  -4, $22, 0
	frame_oam -18,   4, $24, 0
	db $80

.frame_45
	frame_oam -16,   4, $20, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -16, -12, $24, 0 | OAMF_XFLIP
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	db $80

.frame_46
	frame_oam -34,   4, $0c, 0 | OAMF_XFLIP
	frame_oam -34,  -4, $0e, 0 | OAMF_XFLIP
	frame_oam -34, -12, $10, 0 | OAMF_XFLIP
	frame_oam -18,   4, $20, 0 | OAMF_XFLIP
	frame_oam -18,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -18, -12, $24, 0 | OAMF_XFLIP
	db $80

.frame_47
	frame_oam -18, -12, $20, 0
	frame_oam -18,  -4, $22, 0
	frame_oam -18,   4, $24, 0
	frame_oam -34, -12, $70, 0
	frame_oam -34,  -4, $72, 0
	frame_oam -34,   4, $10, 0
	db $80

.frame_48
	frame_oam -18,   4, $20, 0 | OAMF_XFLIP
	frame_oam -18,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -18, -12, $24, 0 | OAMF_XFLIP
	frame_oam -34,   4, $70, 0 | OAMF_XFLIP
	frame_oam -34,  -4, $72, 0 | OAMF_XFLIP
	frame_oam -34, -12, $10, 0 | OAMF_XFLIP
	db $80

.frame_49
	frame_oam -14, -16, $74, 0
	frame_oam -14,  -8, $76, 0
	frame_oam -14,   0, $78, 0
	frame_oam -14,   8, $7a, 0
	frame_oam -30, -12, $00, 1
	frame_oam -30,  -4, $02, 1
	frame_oam -30,   4, $04, 1
	db $80

.frame_50
	frame_oam -30, -12, $00, 1
	frame_oam -30,  -4, $02, 1
	frame_oam -30,   4, $04, 1
	frame_oam -14,  -4, $22, 1
	frame_oam -14, -12, $7c, 1
	frame_oam -14,   4, $7e, 1
	db $80

.frame_51
	frame_oam -14,   8, $74, 0 | OAMF_XFLIP
	frame_oam -14,   0, $76, 0 | OAMF_XFLIP
	frame_oam -14,  -8, $78, 0 | OAMF_XFLIP
	frame_oam -14, -16, $7a, 0 | OAMF_XFLIP
	frame_oam -30,   4, $00, 1 | OAMF_XFLIP
	frame_oam -30,  -4, $02, 1 | OAMF_XFLIP
	frame_oam -30, -12, $04, 1 | OAMF_XFLIP
	db $80

.frame_52
	frame_oam -30,   4, $00, 1 | OAMF_XFLIP
	frame_oam -30,  -4, $02, 1 | OAMF_XFLIP
	frame_oam -30, -12, $04, 1 | OAMF_XFLIP
	frame_oam -14,  -4, $22, 1 | OAMF_XFLIP
	frame_oam -14,   4, $7c, 1 | OAMF_XFLIP
	frame_oam -14, -12, $7e, 1 | OAMF_XFLIP
	db $80

.frame_53
	frame_oam -30,   4, $04, 1
	frame_oam -30, -12, $6a, 1
	frame_oam -30,  -4, $6c, 1
	frame_oam -14, -16, $74, 0
	frame_oam -14,  -8, $76, 0
	frame_oam -14,   0, $78, 0
	frame_oam -14,   8, $7a, 0
	db $80

.frame_54
	frame_oam -30,   4, $04, 1
	frame_oam -30, -12, $6a, 1
	frame_oam -30,  -4, $6c, 1
	frame_oam -14,  -4, $22, 1
	frame_oam -14, -12, $7c, 1
	frame_oam -14,   4, $7e, 1
	db $80

.frame_55
	frame_oam -30, -12, $04, 1 | OAMF_XFLIP
	frame_oam -30,   4, $6a, 1 | OAMF_XFLIP
	frame_oam -30,  -4, $6c, 1 | OAMF_XFLIP
	frame_oam -14,   8, $74, 0 | OAMF_XFLIP
	frame_oam -14,   0, $76, 0 | OAMF_XFLIP
	frame_oam -14,  -8, $78, 0 | OAMF_XFLIP
	frame_oam -14, -16, $7a, 0 | OAMF_XFLIP
	db $80

.frame_56
	frame_oam -30, -12, $04, 1 | OAMF_XFLIP
	frame_oam -30,   4, $6a, 1 | OAMF_XFLIP
	frame_oam -30,  -4, $6c, 1 | OAMF_XFLIP
	frame_oam -14,  -4, $22, 1 | OAMF_XFLIP
	frame_oam -14,   4, $7c, 1 | OAMF_XFLIP
	frame_oam -14, -12, $7e, 1 | OAMF_XFLIP
	db $80

Frameset_15f70::
	db $00,  2
	db $01,  2
	db $02,  3
	db $03,  2
	db $04,  2
	db $05,  5
	db $06,  3
	db $ff

Frameset_15f7f::
	db $07,  2
	db $08,  2
	db $09,  3
	db $0a,  2
	db $0b,  2
	db $0c,  5
	db $0d,  3
	db $ff

Frameset_15f8e::
	db $00,  4
	db $ff

Frameset_15f91::
	db $07,  4
	db $ff

Frameset_15f94::
	db $0f,  4
	db $ff

Frameset_15f97::
	db $13,  4
	db $ff

Frameset_15f9a::
	db $10,  2
	db $11,  2
	db $0e,  2
	db $ff

Frameset_15fa1::
	db $14,  2
	db $15,  2
	db $12,  2
	db $ff

Frameset_15fa8::
	db $16,  4
	db $ff

Frameset_15fab::
	db $17,  4
	db $ff

Frameset_15fae::
	db $19,  2
	db $1a,  2
	db $ff

Frameset_15fb3::
	db $1b,  2
	db $1c,  2
	db $ff

Frameset_15fb8::
	db $1e,  2
	db $1d,  1
	db $00,  1
	db $1d,  1
	db $1e,  2
	db $1d,  2
	db $ff

Frameset_15fc5::
	db $20,  2
	db $1f,  1
	db $07,  1
	db $1f,  1
	db $20,  2
	db $1f,  2
	db $ff

Frameset_15fd2::
	db $23,  2
	db $22,  1
	db $21,  1
	db $22,  1
	db $23,  2
	db $22,  2
	db $ff

Frameset_15fdf::
	db $26,  2
	db $25,  1
	db $24,  1
	db $25,  1
	db $26,  2
	db $25,  2
	db $ff

Frameset_15fec::
	db $21,  4
	db $ff

Frameset_15fef::
	db $24,  4
	db $ff

Frameset_15ff2::
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

Frameset_16009::
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

Frameset_16020::
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

Frameset_16037::
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

Frameset_1604e::
	db $00,  1
	db $31,  2
	db $32,  1
	db $ff

Frameset_16055::
	db $07,  1
	db $33,  2
	db $34,  1
	db $ff

Frameset_1605c::
	db $21,  1
	db $35,  2
	db $36,  1
	db $ff

Frameset_16063::
	db $24,  1
	db $37,  2
	db $38,  1
	db $ff

OAM_1606a::
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
	frame_oam -30, -12, $08, 0
	frame_oam -30,  -4, $0a, 0
	frame_oam -30,   4, $0c, 0
	frame_oam -14, -12, $28, 0
	frame_oam -14,  -4, $2a, 0
	frame_oam -14,   4, $2c, 0
	frame_oam -18, -20, $00, 0
	db $80

.frame_1
	frame_oam -32, -12, $0e, 0
	frame_oam -16, -12, $2e, 0
	frame_oam -16,  -4, $30, 0
	frame_oam -16,   4, $32, 0
	frame_oam -32,   4, $0c, 0
	frame_oam -32,  -4, $0a, 0
	db $80

.frame_2
	frame_oam -16, -12, $34, 0
	frame_oam -16,  -4, $36, 0
	frame_oam -16,   4, $38, 0
	frame_oam -32,   4, $0c, 0
	frame_oam -32, -12, $10, 0
	frame_oam -32,  -4, $12, 0
	db $80

.frame_3
	frame_oam -32, -12, $1a, 0
	frame_oam -32,  -4, $1c, 0
	frame_oam -32,   4, $1e, 0
	frame_oam -16, -12, $14, 0
	frame_oam -16,  -4, $16, 0
	frame_oam -16,   4, $18, 0
	db $80

.frame_4
	frame_oam -30,  -4, $0a, 0
	frame_oam -30,   4, $0c, 0
	frame_oam -18, -20, $00, 0
	frame_oam -30, -12, $08, 0
	frame_oam -14, -12, $22, 0
	frame_oam -14,  -4, $24, 0
	frame_oam -14,   4, $26, 0
	frame_oam -30, -17, $c6, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -32, -12, $0e, 0
	frame_oam -32,  -4, $0a, 0
	frame_oam -32,   4, $0c, 0
	frame_oam -16, -12, $3a, 0
	frame_oam -16,  -4, $3c, 0
	frame_oam -16,   4, $3e, 0
	db $80

.frame_6
	frame_oam -32, -12, $0e, 0
	frame_oam -16,   4, $32, 0
	frame_oam -32,   4, $0c, 0
	frame_oam -32,  -4, $20, 0
	frame_oam -16, -12, $50, 0
	frame_oam -16,  -4, $52, 0
	db $80

.frame_7
	frame_oam -31,  -4, $0a, 0
	frame_oam -31,   4, $0c, 0
	frame_oam -31, -12, $54, 0
	frame_oam -15, -12, $56, 0
	frame_oam -15,  -4, $58, 0
	frame_oam -15,   4, $5a, 0
	db $80

.frame_8
	frame_oam -32,   4, $1e, 0
	frame_oam -16, -12, $60, 0
	frame_oam -16,  -4, $62, 0
	frame_oam -16,   4, $64, 0
	frame_oam -32, -12, $1a, 0
	frame_oam -32,  -4, $5c, 0
	db $80

.frame_9
	frame_oam -32, -12, $66, 0
	frame_oam -32,  -4, $68, 0
	frame_oam -32,   4, $6a, 0
	frame_oam -16, -12, $6c, 0
	frame_oam -16,  -4, $6e, 0
	frame_oam -16,   4, $70, 0
	db $80

.frame_10
	frame_oam -32, -20, $40, 0
	frame_oam -32, -12, $42, 0
	frame_oam -32,  -4, $44, 0
	frame_oam -32,   4, $46, 0
	frame_oam -16, -20, $48, 0
	frame_oam -16, -12, $4a, 0
	frame_oam -16,  -4, $4c, 0
	frame_oam -16,   4, $4e, 0
	frame_oam -32, -27, $fe, 0
	db $80

.frame_11
	frame_oam -32, -20, $5e, 0
	frame_oam -32, -12, $72, 0
	frame_oam -32,  -4, $74, 0
	frame_oam -32,   4, $76, 0
	frame_oam -16, -20, $78, 0
	frame_oam -16, -12, $7a, 0
	frame_oam -16,  -4, $7c, 0
	frame_oam -16,   4, $7e, 0
	db $80

.frame_12
	frame_oam -30,   4, $08, 0 | OAMF_XFLIP
	frame_oam -30,  -4, $0a, 0 | OAMF_XFLIP
	frame_oam -30, -12, $0c, 0 | OAMF_XFLIP
	frame_oam -14,   4, $28, 0 | OAMF_XFLIP
	frame_oam -14,  -4, $2a, 0 | OAMF_XFLIP
	frame_oam -14, -12, $2c, 0 | OAMF_XFLIP
	frame_oam -18,  12, $00, 0 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -32,   4, $0e, 0 | OAMF_XFLIP
	frame_oam -16,   4, $2e, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $30, 0 | OAMF_XFLIP
	frame_oam -16, -12, $32, 0 | OAMF_XFLIP
	frame_oam -32, -12, $0c, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $0a, 0 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16,   4, $34, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $36, 0 | OAMF_XFLIP
	frame_oam -16, -12, $38, 0 | OAMF_XFLIP
	frame_oam -32, -12, $0c, 0 | OAMF_XFLIP
	frame_oam -32,   4, $10, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $12, 0 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -32,   4, $1a, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $1c, 0 | OAMF_XFLIP
	frame_oam -32, -12, $1e, 0 | OAMF_XFLIP
	frame_oam -16,   4, $14, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $16, 0 | OAMF_XFLIP
	frame_oam -16, -12, $18, 0 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -30,  -4, $0a, 0 | OAMF_XFLIP
	frame_oam -30, -12, $0c, 0 | OAMF_XFLIP
	frame_oam -18,  12, $00, 0 | OAMF_XFLIP
	frame_oam -30,   4, $08, 0 | OAMF_XFLIP
	frame_oam -14,   4, $22, 0 | OAMF_XFLIP
	frame_oam -14,  -4, $24, 0 | OAMF_XFLIP
	frame_oam -14, -12, $26, 0 | OAMF_XFLIP
	frame_oam -30,   9, $c6, 0
	db $80

.frame_17
	frame_oam -32,   4, $0e, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $0a, 0 | OAMF_XFLIP
	frame_oam -32, -12, $0c, 0 | OAMF_XFLIP
	frame_oam -16,   4, $3a, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $3c, 0 | OAMF_XFLIP
	frame_oam -16, -12, $3e, 0 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -32,   4, $0e, 0 | OAMF_XFLIP
	frame_oam -16, -12, $32, 0 | OAMF_XFLIP
	frame_oam -32, -12, $0c, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $20, 0 | OAMF_XFLIP
	frame_oam -16,   4, $50, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $52, 0 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -31,  -4, $0a, 0 | OAMF_XFLIP
	frame_oam -31, -12, $0c, 0 | OAMF_XFLIP
	frame_oam -31,   4, $54, 0 | OAMF_XFLIP
	frame_oam -15,   4, $56, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $58, 0 | OAMF_XFLIP
	frame_oam -15, -12, $5a, 0 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -32, -12, $1e, 0 | OAMF_XFLIP
	frame_oam -16,   4, $60, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $62, 0 | OAMF_XFLIP
	frame_oam -16, -12, $64, 0 | OAMF_XFLIP
	frame_oam -32,   4, $1a, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $5c, 0 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -32,   4, $66, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $68, 0 | OAMF_XFLIP
	frame_oam -32, -12, $6a, 0 | OAMF_XFLIP
	frame_oam -16,   4, $6c, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $6e, 0 | OAMF_XFLIP
	frame_oam -16, -12, $70, 0 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -32,  12, $40, 0 | OAMF_XFLIP
	frame_oam -32,   4, $42, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $44, 0 | OAMF_XFLIP
	frame_oam -32, -12, $46, 0 | OAMF_XFLIP
	frame_oam -16,  12, $48, 0 | OAMF_XFLIP
	frame_oam -16,   4, $4a, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $4c, 0 | OAMF_XFLIP
	frame_oam -16, -12, $4e, 0 | OAMF_XFLIP
	frame_oam -32,  19, $fe, 0 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -32,  12, $5e, 0 | OAMF_XFLIP
	frame_oam -32,   4, $72, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $74, 0 | OAMF_XFLIP
	frame_oam -32, -12, $76, 0 | OAMF_XFLIP
	frame_oam -16,  12, $78, 0 | OAMF_XFLIP
	frame_oam -16,   4, $7a, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $7c, 0 | OAMF_XFLIP
	frame_oam -16, -12, $7e, 0 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -32, -12, $66, 1
	frame_oam -32,  -4, $68, 1
	frame_oam -32,   4, $6a, 1
	frame_oam -16, -12, $6c, 1
	frame_oam -16,  -4, $6e, 1
	frame_oam -16,   4, $70, 1
	frame_oam -30,   6, $b6, 0 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -32,   4, $66, 1 | OAMF_XFLIP
	frame_oam -32,  -4, $68, 1 | OAMF_XFLIP
	frame_oam -32, -12, $6a, 1 | OAMF_XFLIP
	frame_oam -16,   4, $6c, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $6e, 1 | OAMF_XFLIP
	frame_oam -16, -12, $70, 1 | OAMF_XFLIP
	frame_oam -30, -14, $b6, 0
	db $80

.frame_26
	frame_oam -32, -12, $66, 1
	frame_oam -32,  -4, $68, 1
	frame_oam -32,   4, $6a, 1
	frame_oam -16, -12, $6c, 1
	frame_oam -16,  -4, $6e, 1
	frame_oam -16,   4, $70, 1
	frame_oam -30,   7, $ba, 0 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -32, -12, $66, 0
	frame_oam -32,  -4, $68, 0
	frame_oam -32,   4, $6a, 0
	frame_oam -16, -12, $6c, 0
	frame_oam -16,  -4, $6e, 0
	frame_oam -16,   4, $70, 0
	frame_oam -27,  10, $fe, 0 | OAMF_YFLIP
	db $80

.frame_28
	frame_oam -32,   4, $66, 1 | OAMF_XFLIP
	frame_oam -32,  -4, $68, 1 | OAMF_XFLIP
	frame_oam -32, -12, $6a, 1 | OAMF_XFLIP
	frame_oam -16,   4, $6c, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $6e, 1 | OAMF_XFLIP
	frame_oam -16, -12, $70, 1 | OAMF_XFLIP
	frame_oam -30, -15, $ba, 0
	db $80

.frame_29
	frame_oam -32,   4, $66, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $68, 0 | OAMF_XFLIP
	frame_oam -32, -12, $6a, 0 | OAMF_XFLIP
	frame_oam -16,   4, $6c, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $6e, 0 | OAMF_XFLIP
	frame_oam -16, -12, $70, 0 | OAMF_XFLIP
	frame_oam -27, -18, $fe, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

Frameset_163ec::
	db $00,  3
	db $01,  3
	db $02,  1
	db $03,  1
	db $ff

Frameset_163f5::
	db $04,  7
	db $05,  6
	db $02,  2
	db $03,  2
	db $ff

Frameset_163fe::
	db $06,  2
	db $07,  2
	db $ff

Frameset_16403::
	db $08,  4
	db $04,  4
	db $0a,  2
	db $0b,  2
	db $ff

Frameset_1640c::
	db $0c,  3
	db $0d,  3
	db $0e,  3
	db $0f,  1
	db $ff

Frameset_16415::
	db $10,  7
	db $11,  6
	db $0e,  2
	db $0f,  2
	db $ff

Frameset_1641e::
	db $12,  2
	db $13,  2
	db $ff

Frameset_16423::
	db $14,  4
	db $10,  4
	db $16,  2
	db $17,  2
	db $ff

Frameset_1642c::
	db $03,  4
	db $ff

Frameset_1642f::
	db $0f,  4
	db $ff

Frameset_16432::
	db $08,  4
	db $ff

Frameset_16435::
	db $14,  4
	db $ff

Frameset_16438::
	db $18,  2
	db $1a,  1
	db $1b,  1
	db $09,  2
	db $ff

Frameset_16441::
	db $19,  2
	db $1c,  1
	db $1d,  1
	db $15,  2
	db $ff

OAM_1644a::
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
	frame_oam -24,  -8, $46, 0
	frame_oam -24,   0, $48, 0
	frame_oam  -8,  -8, $4a, 0
	frame_oam  -8,   0, $4c, 0
	db $80

.frame_1
	frame_oam -16, -15, $40, 0
	frame_oam -16,  -7, $42, 0
	frame_oam -16,   1, $44, 0
	db $80

.frame_2
	frame_oam -10,   0, $46, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -10,  -8, $48, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -26,   0, $4a, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -26,  -8, $4c, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_3
	frame_oam -16,   7, $40, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -1, $42, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -9, $44, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_4
	frame_oam -24,   0, $46, 0 | OAMF_XFLIP
	frame_oam -24,  -8, $48, 0 | OAMF_XFLIP
	frame_oam  -8,   0, $4a, 0 | OAMF_XFLIP
	frame_oam  -8,  -8, $4c, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16,   7, $40, 0 | OAMF_XFLIP
	frame_oam -16,  -1, $42, 0 | OAMF_XFLIP
	frame_oam -16,  -9, $44, 0 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -10,  -8, $46, 0 | OAMF_YFLIP
	frame_oam -10,   0, $48, 0 | OAMF_YFLIP
	frame_oam -26,  -8, $4a, 0 | OAMF_YFLIP
	frame_oam -26,   0, $4c, 0 | OAMF_YFLIP
	db $80

.frame_7
	frame_oam -16, -15, $40, 0 | OAMF_YFLIP
	frame_oam -16,  -7, $42, 0 | OAMF_YFLIP
	frame_oam -16,   1, $44, 0 | OAMF_YFLIP
	db $80

.frame_8
	frame_oam -32, -14, $60, 0
	frame_oam -32,  -6, $62, 0
	frame_oam -32,   2, $64, 0
	frame_oam -16, -16, $66, 0
	frame_oam -16,  -8, $68, 0
	frame_oam -16,   0, $6a, 0
	frame_oam -16,   8, $6c, 0
	db $80

.frame_9
	frame_oam -31, -15, $60, 0
	frame_oam -31,  -7, $62, 0
	frame_oam -31,   1, $64, 0
	frame_oam -15, -17, $66, 0
	frame_oam -15,  -9, $68, 0
	frame_oam -15,  -1, $6a, 0
	frame_oam -15,   7, $6c, 0
	db $80

.frame_10
	frame_oam -32,   6, $60, 0 | OAMF_XFLIP
	frame_oam -32,  -2, $62, 0 | OAMF_XFLIP
	frame_oam -32, -10, $64, 0 | OAMF_XFLIP
	frame_oam -16,   8, $66, 0 | OAMF_XFLIP
	frame_oam -16,   0, $68, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $6a, 0 | OAMF_XFLIP
	frame_oam -16, -16, $6c, 0 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -31,   7, $60, 0 | OAMF_XFLIP
	frame_oam -31,  -1, $62, 0 | OAMF_XFLIP
	frame_oam -31,  -9, $64, 0 | OAMF_XFLIP
	frame_oam -15,   9, $66, 0 | OAMF_XFLIP
	frame_oam -15,   1, $68, 0 | OAMF_XFLIP
	frame_oam -15,  -7, $6a, 0 | OAMF_XFLIP
	frame_oam -15, -15, $6c, 0 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -37, -16, $4e, 0
	frame_oam -37,  -8, $50, 0
	frame_oam -21, -18, $52, 0
	frame_oam -21, -10, $7e, 0
	frame_oam -21,  -2, $6a, 0
	frame_oam -21,   6, $6c, 0
	frame_oam -37,   0, $64, 0
	db $80

.frame_13
	frame_oam -43, -17, $4e, 0
	frame_oam -43,  -9, $50, 0
	frame_oam -27, -19, $52, 0
	frame_oam -27, -11, $7e, 0
	frame_oam -27,  -3, $6a, 0
	frame_oam -27,   5, $6c, 0
	frame_oam -43,  -1, $64, 0
	db $80

.frame_14
	frame_oam -34, -16, $6e, 0
	frame_oam -34,  -8, $70, 0
	frame_oam -32,   0, $72, 0
	frame_oam -32,   8, $74, 0
	frame_oam -18, -16, $76, 0
	frame_oam -18,  -8, $78, 0
	frame_oam -16,   0, $7a, 0
	frame_oam -16,   8, $7c, 0
	db $80

.frame_15
	frame_oam -13,   2, $60, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -13,  -6, $62, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -13, -14, $64, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -29,   4, $66, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -29,  -4, $68, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -29, -12, $6a, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -29, -20, $6c, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_16
	frame_oam -34,   8, $6e, 0 | OAMF_XFLIP
	frame_oam -34,   0, $70, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $72, 0 | OAMF_XFLIP
	frame_oam -32, -16, $74, 0 | OAMF_XFLIP
	frame_oam -18,   8, $76, 0 | OAMF_XFLIP
	frame_oam -18,   0, $78, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $7a, 0 | OAMF_XFLIP
	frame_oam -16, -16, $7c, 0 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -13, -10, $60, 0 | OAMF_YFLIP
	frame_oam -13,  -2, $62, 0 | OAMF_YFLIP
	frame_oam -13,   6, $64, 0 | OAMF_YFLIP
	frame_oam -29, -12, $66, 0 | OAMF_YFLIP
	frame_oam -29,  -4, $68, 0 | OAMF_YFLIP
	frame_oam -29,   4, $6a, 0 | OAMF_YFLIP
	frame_oam -29,  12, $6c, 0 | OAMF_YFLIP
	db $80

.frame_18
	frame_oam -37,   8, $4e, 0 | OAMF_XFLIP
	frame_oam -37,   0, $50, 0 | OAMF_XFLIP
	frame_oam -21,  10, $52, 0 | OAMF_XFLIP
	frame_oam -21,   2, $7e, 0 | OAMF_XFLIP
	frame_oam -21,  -6, $6a, 0 | OAMF_XFLIP
	frame_oam -21, -14, $6c, 0 | OAMF_XFLIP
	frame_oam -37,  -8, $64, 0 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -43,   9, $4e, 0 | OAMF_XFLIP
	frame_oam -43,   1, $50, 0 | OAMF_XFLIP
	frame_oam -27,  11, $52, 0 | OAMF_XFLIP
	frame_oam -27,   3, $7e, 0 | OAMF_XFLIP
	frame_oam -27,  -5, $6a, 0 | OAMF_XFLIP
	frame_oam -27, -13, $6c, 0 | OAMF_XFLIP
	frame_oam -43,  -7, $64, 0 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -16, -15, $56, 0
	frame_oam -16,  -7, $58, 0
	frame_oam -16,   1, $5a, 0
	frame_oam -32,  -7, $54, 0
	db $80

.frame_21
	frame_oam -16,  -7, $5c, 0
	frame_oam -16,   1, $5e, 0
	frame_oam -10, -15, $56, 0
	frame_oam   0,  -7, $54, 0 | OAMF_YFLIP
	db $80

.frame_22
	frame_oam -16,   8, $56, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $58, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $5a, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0,   0, $54, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_23
	frame_oam -16,   0, $5c, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $5e, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -22,   8, $56, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   0, $54, 0 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -16,   7, $56, 0 | OAMF_XFLIP
	frame_oam -16,  -1, $58, 0 | OAMF_XFLIP
	frame_oam -16,  -9, $5a, 0 | OAMF_XFLIP
	frame_oam -32,  -1, $54, 0 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -16,  -1, $5c, 0 | OAMF_XFLIP
	frame_oam -16,  -9, $5e, 0 | OAMF_XFLIP
	frame_oam -10,   7, $56, 0 | OAMF_XFLIP
	frame_oam   0,  -1, $54, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_26
	frame_oam -16, -16, $56, 0 | OAMF_YFLIP
	frame_oam -16,  -8, $58, 0 | OAMF_YFLIP
	frame_oam -16,   0, $5a, 0 | OAMF_YFLIP
	frame_oam   0,  -8, $54, 0 | OAMF_YFLIP
	db $80

.frame_27
	frame_oam -16,  -8, $5c, 0 | OAMF_YFLIP
	frame_oam -16,   0, $5e, 0 | OAMF_YFLIP
	frame_oam -22, -16, $56, 0 | OAMF_YFLIP
	frame_oam -32,  -8, $54, 0
	db $80

Frameset_166e6::
	db $00,  2
	db $14,  1
	db $01,  2
	db $15,  1
	db $02,  2
	db $16,  1
	db $03,  2
	db $17,  1
	db $ff

Frameset_166f7::
	db $04,  2
	db $18,  1
	db $05,  2
	db $19,  1
	db $06,  2
	db $1a,  1
	db $07,  2
	db $1b,  1
	db $ff

Frameset_16708::
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

Frameset_1671d::
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

Frameset_16732::
	db $0e,  8
	db $0f,  6
	db $ff

Frameset_16737::
	db $10,  8
	db $11,  6
	db $ff

OAM_1673c::
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
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $16, 0
	frame_oam -32,   4, $18, 0
	frame_oam -16, -12, $1a, 0
	frame_oam -16,  -4, $1c, 0
	frame_oam -16,   4, $1e, 0
	frame_oam -22,   7, $20, 1
	frame_oam -22,  15, $22, 1
	db $80

.frame_1
	frame_oam -33, -12, $00, 0
	frame_oam -33,  -4, $02, 0
	frame_oam -33,   4, $04, 0
	frame_oam -17, -12, $06, 0
	frame_oam -17,  -4, $08, 0
	frame_oam -17,   4, $0a, 0
	frame_oam -23,   7, $24, 1
	frame_oam -23,  15, $26, 1
	db $80

.frame_2
	frame_oam -31, -12, $00, 0
	frame_oam -31,  -4, $0c, 0
	frame_oam -31,   4, $0e, 0
	frame_oam -15, -12, $10, 0
	frame_oam -15,  -4, $12, 0
	frame_oam -15,   4, $14, 0
	frame_oam -20,   7, $28, 1
	frame_oam -20,  15, $2a, 1
	db $80

.frame_3
	frame_oam -31, -12, $00, 0
	frame_oam -31,  -4, $0c, 0
	frame_oam -31,   4, $0e, 0
	frame_oam -15, -12, $10, 0
	frame_oam -15,  -4, $12, 0
	frame_oam -15,   4, $14, 0
	frame_oam -20,   7, $2c, 1
	frame_oam -20,  15, $2e, 1
	db $80

.frame_4
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $16, 0 | OAMF_XFLIP
	frame_oam -32, -12, $18, 0 | OAMF_XFLIP
	frame_oam -16,   4, $1a, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $1c, 0 | OAMF_XFLIP
	frame_oam -16, -12, $1e, 0 | OAMF_XFLIP
	frame_oam -22, -15, $20, 1 | OAMF_XFLIP
	frame_oam -22, -23, $22, 1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -33,   4, $00, 0 | OAMF_XFLIP
	frame_oam -33,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -33, -12, $04, 0 | OAMF_XFLIP
	frame_oam -17,   4, $06, 0 | OAMF_XFLIP
	frame_oam -17,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -17, -12, $0a, 0 | OAMF_XFLIP
	frame_oam -23, -15, $24, 1 | OAMF_XFLIP
	frame_oam -23, -23, $26, 1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -31,   4, $00, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $0c, 0 | OAMF_XFLIP
	frame_oam -31, -12, $0e, 0 | OAMF_XFLIP
	frame_oam -15,   4, $10, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $12, 0 | OAMF_XFLIP
	frame_oam -15, -12, $14, 0 | OAMF_XFLIP
	frame_oam -20, -15, $28, 1 | OAMF_XFLIP
	frame_oam -20, -23, $2a, 1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -31,   4, $00, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $0c, 0 | OAMF_XFLIP
	frame_oam -31, -12, $0e, 0 | OAMF_XFLIP
	frame_oam -15,   4, $10, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $12, 0 | OAMF_XFLIP
	frame_oam -15, -12, $14, 0 | OAMF_XFLIP
	frame_oam -20, -15, $2c, 1 | OAMF_XFLIP
	frame_oam -20, -23, $2e, 1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -32, -11, $30, 1
	frame_oam -32,  -3, $32, 1
	frame_oam -32,   5, $34, 1
	frame_oam -16, -11, $36, 1
	frame_oam -16,  -3, $38, 1
	frame_oam -16,   5, $3a, 1
	db $80

.frame_9
	frame_oam -32, -11, $3c, 1
	frame_oam -32,  -3, $3e, 1
	frame_oam -32,   5, $40, 1
	frame_oam -16, -11, $42, 1
	frame_oam -16,  -3, $44, 1
	frame_oam -16,   5, $46, 1
	db $80

.frame_10
	frame_oam -32, -11, $48, 1
	frame_oam -32,  -3, $4a, 1
	frame_oam -32,   5, $4c, 1
	frame_oam -16, -11, $4e, 1
	frame_oam -16,  -3, $50, 1
	frame_oam -16,   5, $52, 1
	db $80

.frame_11
	frame_oam -32, -11, $54, 1
	frame_oam -32,  -3, $56, 1
	frame_oam -32,   5, $58, 1
	frame_oam -16, -11, $5a, 1
	frame_oam -16,  -3, $5c, 1
	frame_oam -16,   5, $5e, 1
	db $80

.frame_12
	frame_oam -32,   5, $30, 1 | OAMF_XFLIP
	frame_oam -32,  -3, $32, 1 | OAMF_XFLIP
	frame_oam -32, -11, $34, 1 | OAMF_XFLIP
	frame_oam -16,   5, $36, 1 | OAMF_XFLIP
	frame_oam -16,  -3, $38, 1 | OAMF_XFLIP
	frame_oam -16, -11, $3a, 1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -32,   5, $3c, 1 | OAMF_XFLIP
	frame_oam -32,  -3, $3e, 1 | OAMF_XFLIP
	frame_oam -32, -11, $40, 1 | OAMF_XFLIP
	frame_oam -16,   5, $42, 1 | OAMF_XFLIP
	frame_oam -16,  -3, $44, 1 | OAMF_XFLIP
	frame_oam -16, -11, $46, 1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -32,   5, $48, 1 | OAMF_XFLIP
	frame_oam -32,  -3, $4a, 1 | OAMF_XFLIP
	frame_oam -32, -11, $4c, 1 | OAMF_XFLIP
	frame_oam -16,   5, $4e, 1 | OAMF_XFLIP
	frame_oam -16,  -3, $50, 1 | OAMF_XFLIP
	frame_oam -16, -11, $52, 1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -32,   5, $54, 1 | OAMF_XFLIP
	frame_oam -32,  -3, $56, 1 | OAMF_XFLIP
	frame_oam -32, -11, $58, 1 | OAMF_XFLIP
	frame_oam -16,   5, $5a, 1 | OAMF_XFLIP
	frame_oam -16,  -3, $5c, 1 | OAMF_XFLIP
	frame_oam -16, -11, $5e, 1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $16, 0
	frame_oam -32,   4, $18, 0
	frame_oam -16, -12, $1a, 0
	frame_oam -16,  -4, $1c, 0
	frame_oam -16,   4, $1e, 0
	frame_oam -21,   8, $60, 1
	db $80

.frame_17
	frame_oam -33, -12, $00, 0
	frame_oam -33,  -4, $02, 0
	frame_oam -33,   4, $04, 0
	frame_oam -17, -12, $06, 0
	frame_oam -17,  -4, $08, 0
	frame_oam -17,   4, $0a, 0
	frame_oam -22,   8, $62, 1
	db $80

.frame_18
	frame_oam -31, -12, $00, 0
	frame_oam -31,  -4, $0c, 0
	frame_oam -31,   4, $0e, 0
	frame_oam -15, -12, $10, 0
	frame_oam -15,  -4, $12, 0
	frame_oam -15,   4, $14, 0
	frame_oam -19,   8, $64, 1
	db $80

.frame_19
	frame_oam -31, -12, $00, 0
	frame_oam -31,  -4, $0c, 0
	frame_oam -31,   4, $0e, 0
	frame_oam -15, -12, $10, 0
	frame_oam -15,  -4, $12, 0
	frame_oam -15,   4, $14, 0
	frame_oam -18,   8, $66, 1
	db $80

.frame_20
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $16, 0 | OAMF_XFLIP
	frame_oam -32, -12, $18, 0 | OAMF_XFLIP
	frame_oam -16,   4, $1a, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $1c, 0 | OAMF_XFLIP
	frame_oam -16, -12, $1e, 0 | OAMF_XFLIP
	frame_oam -21, -16, $60, 1 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -33,   4, $00, 0 | OAMF_XFLIP
	frame_oam -33,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -33, -12, $04, 0 | OAMF_XFLIP
	frame_oam -17,   4, $06, 0 | OAMF_XFLIP
	frame_oam -17,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -17, -12, $0a, 0 | OAMF_XFLIP
	frame_oam -22, -16, $62, 1 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -31,   4, $00, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $0c, 0 | OAMF_XFLIP
	frame_oam -31, -12, $0e, 0 | OAMF_XFLIP
	frame_oam -15,   4, $10, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $12, 0 | OAMF_XFLIP
	frame_oam -15, -12, $14, 0 | OAMF_XFLIP
	frame_oam -19, -16, $64, 1 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -31,   4, $00, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $0c, 0 | OAMF_XFLIP
	frame_oam -31, -12, $0e, 0 | OAMF_XFLIP
	frame_oam -15,   4, $10, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $12, 0 | OAMF_XFLIP
	frame_oam -15, -12, $14, 0 | OAMF_XFLIP
	frame_oam -18, -16, $66, 1 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $16, 0
	frame_oam -32,   4, $18, 0
	frame_oam -16, -12, $1a, 0
	frame_oam -16,  -4, $1c, 0
	frame_oam -16,   4, $1e, 0
	frame_oam -44,   5, $68, 0
	db $80

.frame_25
	frame_oam -33, -12, $00, 0
	frame_oam -33,  -4, $02, 0
	frame_oam -33,   4, $04, 0
	frame_oam -17, -12, $06, 0
	frame_oam -17,  -4, $08, 0
	frame_oam -17,   4, $0a, 0
	frame_oam -44,   7, $6a, 0
	db $80

.frame_26
	frame_oam -31, -12, $00, 0
	frame_oam -31,  -4, $0c, 0
	frame_oam -31,   4, $0e, 0
	frame_oam -15, -12, $10, 0
	frame_oam -15,  -4, $12, 0
	frame_oam -15,   4, $14, 0
	frame_oam -44,   8, $6c, 0
	db $80

.frame_27
	frame_oam -31, -12, $00, 0
	frame_oam -31,  -4, $0c, 0
	frame_oam -31,   4, $0e, 0
	frame_oam -15, -12, $10, 0
	frame_oam -15,  -4, $12, 0
	frame_oam -15,   4, $14, 0
	db $80

.frame_28
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $16, 0 | OAMF_XFLIP
	frame_oam -32, -12, $18, 0 | OAMF_XFLIP
	frame_oam -16,   4, $1a, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $1c, 0 | OAMF_XFLIP
	frame_oam -16, -12, $1e, 0 | OAMF_XFLIP
	frame_oam -44, -13, $68, 0 | OAMF_XFLIP
	db $80

.frame_29
	frame_oam -33,   4, $00, 0 | OAMF_XFLIP
	frame_oam -33,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -33, -12, $04, 0 | OAMF_XFLIP
	frame_oam -17,   4, $06, 0 | OAMF_XFLIP
	frame_oam -17,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -17, -12, $0a, 0 | OAMF_XFLIP
	frame_oam -44, -15, $6a, 0 | OAMF_XFLIP
	db $80

.frame_30
	frame_oam -31,   4, $00, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $0c, 0 | OAMF_XFLIP
	frame_oam -31, -12, $0e, 0 | OAMF_XFLIP
	frame_oam -15,   4, $10, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $12, 0 | OAMF_XFLIP
	frame_oam -15, -12, $14, 0 | OAMF_XFLIP
	frame_oam -44, -16, $6c, 0 | OAMF_XFLIP
	db $80

.frame_31
	frame_oam -31,   4, $00, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $0c, 0 | OAMF_XFLIP
	frame_oam -31, -12, $0e, 0 | OAMF_XFLIP
	frame_oam -15,   4, $10, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $12, 0 | OAMF_XFLIP
	frame_oam -15, -12, $14, 0 | OAMF_XFLIP
	db $80

Frameset_16b14::
	db $00,  2
	db $01,  2
	db $02,  2
	db $03,  2
	db $ff

Frameset_16b1d::
	db $04,  2
	db $05,  2
	db $06,  2
	db $07,  2
	db $ff

Frameset_16b26::
	db $08,  4
	db $09,  4
	db $0a,  4
	db $0b,  4
	db $ff

Frameset_16b2f::
	db $0c,  4
	db $0d,  4
	db $0e,  4
	db $0f,  4
	db $ff

Frameset_16b38::
	db $10,  2
	db $11,  2
	db $12,  2
	db $13,  2
	db $10,  2
	db $11,  2
	db $12,  2
	db $13,  2
	db $ff

Frameset_16b49::
	db $14,  2
	db $15,  2
	db $16,  2
	db $17,  2
	db $14,  2
	db $15,  2
	db $16,  2
	db $17,  2
	db $ff

Frameset_16b5a::
	db $18,  2
	db $19,  2
	db $1a,  2
	db $1b,  2
	db $ff

Frameset_16b63::
	db $1c,  2
	db $1d,  2
	db $1e,  2
	db $1f,  2
	db $ff

OAM_16b6c::
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
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32,   4, $04, 0
	frame_oam -16,  -8, $08, 0
	frame_oam -16, -16, $06, 0
	frame_oam -16,   0, $08, 0 | OAMF_XFLIP
	frame_oam -16,   8, $06, 0 | OAMF_XFLIP
	frame_oam -48, -11, $40, 0
	frame_oam -48,   4, $42, 0
	db $80

.frame_1
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32,   4, $04, 0
	frame_oam -16,  -8, $08, 0
	frame_oam -16, -16, $06, 0
	frame_oam -16,   0, $08, 0 | OAMF_XFLIP
	frame_oam -16,   8, $06, 0 | OAMF_XFLIP
	frame_oam -50, -12, $40, 0
	frame_oam -52,   3, $40, 0 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32,   4, $04, 0
	frame_oam -16,  -8, $08, 0
	frame_oam -16, -16, $06, 0
	frame_oam -16,   0, $08, 0 | OAMF_XFLIP
	frame_oam -16,   8, $06, 0 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -32, -12, $00, 0
	frame_oam -32,   4, $04, 0
	frame_oam -16, -16, $06, 0
	frame_oam -16,  -8, $08, 0
	frame_oam -16,   8, $06, 0 | OAMF_XFLIP
	frame_oam -16,   0, $08, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $0a, 0
	db $80

.frame_4
	frame_oam -32, -12, $00, 0
	frame_oam -32,   4, $04, 0
	frame_oam -16, -16, $06, 0
	frame_oam -16,   8, $06, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $0c, 0
	frame_oam -16,   0, $0e, 0
	frame_oam -32,  -4, $0a, 0
	db $80

.frame_5
	frame_oam -32,   4, $04, 0
	frame_oam -16, -16, $06, 0
	frame_oam -16,   8, $06, 0 | OAMF_XFLIP
	frame_oam -32, -12, $10, 0
	frame_oam -32,  -4, $12, 0
	frame_oam -16,  -8, $0c, 0
	frame_oam -16,   0, $0e, 0
	db $80

.frame_6
	frame_oam -35, -16, $14, 0
	frame_oam -35,  -8, $16, 0
	frame_oam -19, -16, $18, 0
	frame_oam -19,  -8, $1a, 0
	frame_oam -35,   8, $14, 0 | OAMF_XFLIP
	frame_oam -35,   0, $16, 0 | OAMF_XFLIP
	frame_oam -19,   8, $18, 0 | OAMF_XFLIP
	frame_oam -19,   0, $1a, 0 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -32, -16, $14, 0
	frame_oam -32,  -8, $16, 0
	frame_oam -16, -16, $18, 0
	frame_oam -16,  -8, $1a, 0
	frame_oam -32,   8, $14, 0 | OAMF_XFLIP
	frame_oam -32,   0, $16, 0 | OAMF_XFLIP
	frame_oam -16,   8, $18, 0 | OAMF_XFLIP
	frame_oam -16,   0, $1a, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -32, -16, $14, 0
	frame_oam -32,  -8, $16, 0
	frame_oam -16, -16, $18, 0
	frame_oam -32,   8, $14, 0 | OAMF_XFLIP
	frame_oam -32,   0, $16, 0 | OAMF_XFLIP
	frame_oam -16,   8, $18, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $08, 0
	frame_oam -16,   0, $08, 0 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -32, -16, $1c, 0
	frame_oam -32,  -8, $1e, 0
	frame_oam -16, -16, $18, 0
	frame_oam -16,  -8, $08, 0
	frame_oam -32,   8, $1c, 0 | OAMF_XFLIP
	frame_oam -32,   0, $1e, 0 | OAMF_XFLIP
	frame_oam -16,   8, $18, 0 | OAMF_XFLIP
	frame_oam -16,   0, $08, 0 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -32, -16, $20, 0
	frame_oam -32,  -8, $22, 0
	frame_oam -32,   0, $24, 0
	frame_oam -32,   8, $26, 0
	frame_oam -16, -16, $18, 0
	frame_oam -16,  -8, $08, 0
	frame_oam -16,   0, $08, 0 | OAMF_XFLIP
	frame_oam -16,   8, $18, 0 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -32, -16, $38, 0
	frame_oam -32,  -8, $3a, 0
	frame_oam -32,   0, $22, 0 | OAMF_XFLIP
	frame_oam -32,   8, $28, 0
	frame_oam -16, -16, $2a, 0
	frame_oam -16,  -8, $2c, 0
	frame_oam -16,   0, $08, 0 | OAMF_XFLIP
	frame_oam -16,   8, $2e, 0
	frame_oam -16,  16, $30, 0
	db $80

.frame_12
	frame_oam -32, -16, $38, 0
	frame_oam -32,  -8, $3a, 0
	frame_oam -16, -16, $3c, 0
	frame_oam -16,  -8, $3e, 0
	frame_oam -32,   0, $3a, 0 | OAMF_XFLIP
	frame_oam -32,   8, $20, 0 | OAMF_XFLIP
	frame_oam -16,   0, $2c, 0 | OAMF_XFLIP
	frame_oam -16,   8, $32, 0
	frame_oam -16,  16, $34, 0
	db $80

.frame_13
	frame_oam -32, -16, $38, 0
	frame_oam -32,  -8, $3a, 0
	frame_oam -32,   8, $38, 0 | OAMF_XFLIP
	frame_oam -32,   0, $3a, 0 | OAMF_XFLIP
	frame_oam -16, -16, $3c, 0
	frame_oam -16,  -8, $3e, 0
	frame_oam -16,   0, $3e, 0 | OAMF_XFLIP
	frame_oam -16,   8, $36, 0
	frame_oam -15,  19, $34, 0
	db $80

.frame_14
	frame_oam -32, -16, $38, 0
	frame_oam -32,  -8, $3a, 0
	frame_oam -32,   8, $38, 0 | OAMF_XFLIP
	frame_oam -32,   0, $3a, 0 | OAMF_XFLIP
	frame_oam -16, -16, $3c, 0
	frame_oam -16,  -8, $3e, 0
	frame_oam -16,   8, $3c, 0 | OAMF_XFLIP
	frame_oam -16,   0, $3e, 0 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $08, 0
	frame_oam -16, -16, $06, 0
	frame_oam -16,   0, $08, 0 | OAMF_XFLIP
	frame_oam -16,   8, $06, 0 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	frame_oam -16, -16, $06, 0
	frame_oam -16,  -8, $08, 0
	frame_oam -16,   8, $06, 0 | OAMF_XFLIP
	frame_oam -16,   0, $08, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $0a, 0 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	frame_oam -16, -16, $06, 0
	frame_oam -16,   8, $06, 0 | OAMF_XFLIP
	frame_oam -16,   0, $0c, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $0e, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $0a, 0 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	frame_oam -16, -16, $06, 0
	frame_oam -16,   8, $06, 0 | OAMF_XFLIP
	frame_oam -32,   4, $10, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $12, 0 | OAMF_XFLIP
	frame_oam -16,   0, $0c, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $0e, 0 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $08, 0
	frame_oam -16, -16, $06, 0
	frame_oam -16,   0, $08, 0 | OAMF_XFLIP
	frame_oam -16,   8, $06, 0 | OAMF_XFLIP
	frame_oam -48,   3, $40, 0 | OAMF_XFLIP
	frame_oam -48, -12, $42, 0 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $08, 0
	frame_oam -16, -16, $06, 0
	frame_oam -16,   0, $08, 0 | OAMF_XFLIP
	frame_oam -16,   8, $06, 0 | OAMF_XFLIP
	frame_oam -50,   4, $40, 0 | OAMF_XFLIP
	frame_oam -52, -11, $40, 0
	db $80

Frameset_16e47::
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

Frameset_16e72::
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

OAM_16e9d::
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
	frame_oam -16,   0, $06, 0 | OAMF_XFLIP
	frame_oam -16,   8, $04, 0 | OAMF_XFLIP
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $06, 0
	frame_oam -16, -16, $04, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32, -12, $00, 0
	db $80

.frame_1
	frame_oam -16,   4, $0a, 0 | OAMF_XFLIP
	frame_oam -16,  12, $08, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $0c, 0
	frame_oam -16, -12, $0a, 0
	frame_oam -16, -20, $08, 0
	db $80

.frame_2
	frame_oam -16,   4, $10, 0 | OAMF_XFLIP
	frame_oam -16,  12, $0e, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $12, 0
	frame_oam -16, -12, $10, 0
	frame_oam -16, -20, $0e, 0
	db $80

.frame_3
	frame_oam -15,  -4, $1e, 0
	frame_oam -16,  12, $18, 0 | OAMF_XFLIP
	frame_oam -16, -20, $18, 0
	frame_oam -15,   4, $16, 0 | OAMF_XFLIP
	frame_oam -15, -12, $16, 0
	db $80

.frame_4
	frame_oam -16,  -4, $1e, 0
	frame_oam -16,  12, $18, 0 | OAMF_XFLIP
	frame_oam -16, -20, $18, 0
	frame_oam -16,   4, $16, 0 | OAMF_XFLIP
	frame_oam -16, -12, $16, 0
	db $80

.frame_5
	frame_oam -15,  -4, $1e, 0
	frame_oam -16,   4, $1c, 0 | OAMF_XFLIP
	frame_oam -16,  12, $18, 0 | OAMF_XFLIP
	frame_oam -17, -20, $14, 0
	frame_oam -15, -12, $16, 0
	db $80

.frame_6
	frame_oam -16,  -4, $1e, 0
	frame_oam -17,  12, $18, 0 | OAMF_XFLIP
	frame_oam -17, -20, $18, 0
	frame_oam -16,   4, $1a, 0 | OAMF_XFLIP
	frame_oam -16, -12, $1a, 0
	db $80

.frame_7
	frame_oam -15,  -4, $1e, 0
	frame_oam -16, -12, $1c, 0
	frame_oam -16, -20, $18, 0
	frame_oam -17,  12, $14, 0 | OAMF_XFLIP
	frame_oam -15,   4, $16, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -16,  12, $18, 0 | OAMF_XFLIP
	frame_oam -16,   4, $1c, 0 | OAMF_XFLIP
	frame_oam -17,  -4, $1e, 0
	frame_oam -17, -12, $20, 0
	frame_oam -18, -20, $14, 0
	db $80

.frame_9
	frame_oam -16,   4, $20, 0 | OAMF_XFLIP
	frame_oam -16, -12, $20, 0
	frame_oam -16,  -4, $1e, 0
	frame_oam -16,  12, $18, 0 | OAMF_XFLIP
	frame_oam -17, -20, $18, 0
	db $80

.frame_10
	frame_oam -15,   4, $20, 0 | OAMF_XFLIP
	frame_oam -15, -12, $20, 0
	frame_oam -15,  -4, $1e, 0
	frame_oam -16,  12, $18, 0 | OAMF_XFLIP
	frame_oam -16, -20, $18, 0
	db $80

.frame_11
	frame_oam -16, -12, $20, 0
	frame_oam -17,  12, $18, 0 | OAMF_XFLIP
	frame_oam -16, -20, $18, 0
	frame_oam -16,  -4, $1e, 0 | OAMF_XFLIP
	frame_oam -16,   4, $20, 0 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -18,  12, $14, 0 | OAMF_XFLIP
	frame_oam -16, -20, $18, 0
	frame_oam -16, -12, $1c, 0
	frame_oam -17,  -4, $1e, 0 | OAMF_XFLIP
	frame_oam -17,   4, $20, 0 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -16,  11, $18, 0 | OAMF_XFLIP
	frame_oam -18, -21, $14, 0
	frame_oam -18, -13, $1a, 0
	frame_oam -16,  -5, $24, 0 | OAMF_XFLIP
	frame_oam -16,   3, $22, 0 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16,   4, $20, 0 | OAMF_XFLIP
	frame_oam -18, -20, $18, 0
	frame_oam -17, -12, $1c, 0
	frame_oam -16,  12, $18, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $24, 0 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -15,  12, $18, 0 | OAMF_XFLIP
	frame_oam -15, -20, $18, 0
	frame_oam -15,   4, $20, 0 | OAMF_XFLIP
	frame_oam -15, -12, $20, 0
	frame_oam -15,  -4, $1e, 0
	db $80

.frame_16
	frame_oam -16, -12, $20, 0
	frame_oam -18,  12, $18, 0 | OAMF_XFLIP
	frame_oam -17,   4, $1c, 0 | OAMF_XFLIP
	frame_oam -16, -20, $18, 0
	frame_oam -15,  -4, $24, 0
	db $80

.frame_17
	frame_oam -16, -19, $18, 0
	frame_oam -18,  13, $14, 0 | OAMF_XFLIP
	frame_oam -18,   5, $1a, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $24, 0
	frame_oam -16, -11, $22, 0
	db $80

.frame_18
	frame_oam -16,  12, $14, 0 | OAMF_XFLIP
	frame_oam -16, -20, $14, 0
	frame_oam -16,   4, $20, 0 | OAMF_XFLIP
	frame_oam -16, -12, $20, 0
	frame_oam -16,  -4, $1e, 0
	db $80

.frame_19
	frame_oam -16,   4, $28, 0 | OAMF_XFLIP
	frame_oam -16,  12, $26, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $2a, 0
	frame_oam -16, -12, $28, 0
	frame_oam -16, -20, $26, 0
	db $80

.frame_20
	frame_oam -15,  -4, $1e, 0
	frame_oam -16,   4, $1c, 0 | OAMF_XFLIP
	frame_oam -16,  12, $18, 0 | OAMF_XFLIP
	frame_oam -16, -20, $14, 0
	frame_oam -15, -12, $16, 0
	db $80

.frame_21
	frame_oam -14,  11, $14, 0 | OAMF_XFLIP
	frame_oam -15,   3, $1c, 0 | OAMF_XFLIP
	frame_oam -16,  -5, $1e, 0
	frame_oam -17, -21, $18, 0
	frame_oam -16, -13, $1a, 0
	db $80

.frame_22
	frame_oam -14, -20, $14, 0
	frame_oam -15, -12, $1c, 0
	frame_oam -16,  -4, $1e, 0
	frame_oam -17,  12, $18, 0 | OAMF_XFLIP
	frame_oam -16,   4, $1a, 0 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -15,  -3, $1e, 0
	frame_oam -16, -11, $1c, 0
	frame_oam -16, -19, $18, 0
	frame_oam -16,  13, $14, 0 | OAMF_XFLIP
	frame_oam -15,   5, $16, 0 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -15,   2, $28, 0 | OAMF_XFLIP
	frame_oam -15,  10, $26, 0 | OAMF_XFLIP
	frame_oam -16,  -6, $2a, 0
	frame_oam -17, -14, $28, 0
	frame_oam -16, -22, $26, 0
	db $80

.frame_25
	frame_oam -16,   3, $28, 0 | OAMF_XFLIP
	frame_oam -15,  11, $26, 0 | OAMF_XFLIP
	frame_oam -16,  -5, $2a, 0
	frame_oam -16, -13, $28, 0
	frame_oam -16, -21, $26, 0
	db $80

.frame_26
	frame_oam -16, -11, $28, 0
	frame_oam -15, -19, $26, 0
	frame_oam -16,  -3, $2a, 0
	frame_oam -16,   5, $28, 0 | OAMF_XFLIP
	frame_oam -16,  13, $26, 0 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -15, -10, $28, 0
	frame_oam -15, -18, $26, 0
	frame_oam -16,  -2, $2a, 0
	frame_oam -17,   6, $28, 0 | OAMF_XFLIP
	frame_oam -16,  14, $26, 0 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam -15,  10, $38, 0
	frame_oam -15,   2, $36, 0
	frame_oam -15,  -6, $34, 0
	frame_oam -15, -14, $32, 0
	frame_oam -31,  10, $30, 0
	frame_oam -31,   2, $2e, 0
	frame_oam -31,  -6, $2c, 0
	db $80

.frame_29
	frame_oam -16,   4, $20, 0 | OAMF_XFLIP
	frame_oam -16, -12, $20, 0
	frame_oam -16,  -4, $1e, 0
	frame_oam -16,  12, $18, 0 | OAMF_XFLIP
	frame_oam -16, -20, $18, 0
	db $80

Frameset_1715f::
	db $01,  6
	db $02,  4
	db $03,  2
	db $04,  2
	db $03,  2
	db $04,  4
	db $ff

Frameset_1716c::
	db $05,  3
	db $06,  3
	db $07,  3
	db $06,  3
	db $ff

Frameset_17175::
	db $08,  3
	db $09,  2
	db $0a,  1
	db $0b,  2
	db $0c,  3
	db $0b,  2
	db $0a,  1
	db $09,  2
	db $ff

Frameset_17186::
	db $0d, 12
	db $0e, 10
	db $ff

Frameset_1718b::
	db $0a,  3
	db $1d,  3
	db $ff

Frameset_17190::
	db $12,  4
	db $ff

Frameset_17193::
	db $06,  8
	db $13,  8
	db $00,  8
	db $ff

Frameset_1719a::
	db $14, 11
	db $15, 11
	db $16, 11
	db $17, 11
	db $ff

Frameset_171a3::
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

Frameset_171b8::
	db $11, 12
	db $10, 10
	db $ff

Frameset_171bd::
	db $00,  4
	db $ff

OAM_171c0::
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
	frame_oam -16,   4, $0a, 1
	frame_oam -16,  -4, $08, 1
	frame_oam -16, -12, $06, 1
	frame_oam -32,   4, $04, 1
	frame_oam -32,  -4, $02, 1
	frame_oam -32, -12, $00, 1
	db $80

.frame_1
	frame_oam -20,   4, $16, 1
	frame_oam -20,  -4, $14, 1
	frame_oam -20, -12, $12, 1
	frame_oam -36,   4, $10, 1
	frame_oam -36,  -4, $0e, 1
	frame_oam -36, -12, $0c, 1
	db $80

.frame_2
	frame_oam -24,   4, $16, 1 | OAMF_YFLIP
	frame_oam -24,  -4, $14, 1 | OAMF_YFLIP
	frame_oam -24, -12, $12, 1 | OAMF_YFLIP
	frame_oam  -8,   4, $10, 1 | OAMF_YFLIP
	frame_oam  -8,  -4, $0e, 1 | OAMF_YFLIP
	frame_oam  -8, -12, $0c, 1 | OAMF_YFLIP
	db $80

.frame_3
	frame_oam -26,   4, $0a, 1 | OAMF_YFLIP
	frame_oam -26,  -4, $08, 1 | OAMF_YFLIP
	frame_oam -26, -12, $06, 1 | OAMF_YFLIP
	frame_oam -10,   4, $04, 1 | OAMF_YFLIP
	frame_oam -10,  -4, $02, 1 | OAMF_YFLIP
	frame_oam -10, -12, $00, 1 | OAMF_YFLIP
	db $80

.frame_4
	frame_oam -25, -12, $16, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -25,  -4, $14, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -25,   4, $12, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -9, -12, $10, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -9,  -4, $0e, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -9,   4, $0c, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_5
	frame_oam -16,   4, $1e, 1
	frame_oam -16,  -4, $1c, 1
	frame_oam -16, -12, $06, 1
	frame_oam -32,   4, $18, 1 | OAMF_XFLIP
	frame_oam -32,  -4, $1a, 1
	frame_oam -32, -12, $18, 1
	db $80

.frame_6
	frame_oam -16, -20, $28, 1 | OAMF_XFLIP
	frame_oam -16,  12, $30, 1
	frame_oam -16,   4, $2e, 1
	frame_oam -16,  -4, $2c, 1
	frame_oam -16, -12, $2a, 1
	frame_oam -32,  12, $28, 1
	frame_oam -32,   4, $26, 1
	frame_oam -32,  -4, $24, 1
	frame_oam -32, -12, $22, 1
	frame_oam -32, -20, $20, 1
	db $80

.frame_7
	frame_oam -32,   4, $46, 0
	frame_oam -32,  -4, $44, 0
	frame_oam -32, -12, $42, 0
	frame_oam -16,  12, $34, 1 | OAMF_XFLIP
	frame_oam -16,   4, $3a, 1
	frame_oam -16,  -4, $38, 1
	frame_oam -16, -12, $36, 1
	frame_oam -16, -20, $34, 1
	frame_oam -32,  12, $32, 1 | OAMF_XFLIP
	frame_oam -32, -20, $32, 1
	db $80

.frame_8
	frame_oam -16,   4, $40, 1
	frame_oam -16,  -4, $3e, 1
	frame_oam -16, -12, $3c, 1
	frame_oam -32,   4, $46, 0
	frame_oam -32,  -4, $44, 0
	frame_oam -32, -12, $42, 0
	frame_oam -16,  12, $30, 1 | OAMF_YFLIP
	frame_oam -16, -20, $30, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_9
	frame_oam -16,   4, $4c, 0 | OAMF_XFLIP
	frame_oam -32,   4, $46, 0
	frame_oam -32,  -4, $44, 0
	frame_oam -32, -12, $42, 0
	frame_oam -16,  -4, $4e, 0
	frame_oam -16, -12, $4c, 0
	frame_oam -16,  12, $4a, 1
	frame_oam -16, -20, $48, 1
	db $80

.frame_10
	frame_oam -11, -20, $32, 1 | OAMF_YFLIP
	frame_oam -17,  12, $32, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -33,  12, $28, 1 | OAMF_YFLIP
	frame_oam -16,   4, $4c, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $4e, 0
	frame_oam -16, -12, $4c, 0
	frame_oam -32,   4, $26, 1
	frame_oam -32,  -4, $24, 1
	frame_oam -32, -12, $22, 1
	frame_oam -31, -20, $20, 1
	db $80

.frame_11
	frame_oam -17,  11, $30, 1
	frame_oam -24, -20, $30, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   4, $50, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $52, 1
	frame_oam -16, -12, $50, 1
	frame_oam -32,   4, $46, 0
	frame_oam -32,  -4, $44, 0
	frame_oam -32, -12, $42, 0
	db $80

.frame_12
	frame_oam -36,  12, $20, 1 | OAMF_XFLIP
	frame_oam -32, -20, $32, 1
	frame_oam -16, -20, $30, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -20,  12, $30, 1 | OAMF_YFLIP
	frame_oam -16,   4, $2e, 1
	frame_oam -16,  -4, $2c, 1
	frame_oam -16, -12, $2a, 1
	frame_oam -32,   4, $46, 0
	frame_oam -32,  -4, $44, 0
	frame_oam -32, -12, $42, 0
	db $80

.frame_13
	frame_oam -16, -12, $0a, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $08, 1 | OAMF_XFLIP
	frame_oam -16,   4, $06, 1 | OAMF_XFLIP
	frame_oam -32, -12, $04, 1 | OAMF_XFLIP
	frame_oam -32,  -4, $02, 1 | OAMF_XFLIP
	frame_oam -32,   4, $00, 1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -20, -12, $16, 1 | OAMF_XFLIP
	frame_oam -20,  -4, $14, 1 | OAMF_XFLIP
	frame_oam -20,   4, $12, 1 | OAMF_XFLIP
	frame_oam -36, -12, $10, 1 | OAMF_XFLIP
	frame_oam -36,  -4, $0e, 1 | OAMF_XFLIP
	frame_oam -36,   4, $0c, 1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -24, -12, $16, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -24,  -4, $14, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -24,   4, $12, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -8, -12, $10, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -8,  -4, $0e, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -8,   4, $0c, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_16
	frame_oam -26,   4, $0a, 1 | OAMF_YFLIP
	frame_oam -26,  -4, $08, 1 | OAMF_YFLIP
	frame_oam -26, -12, $06, 1 | OAMF_YFLIP
	frame_oam -10,   4, $04, 1 | OAMF_YFLIP
	frame_oam -10,  -4, $02, 1 | OAMF_YFLIP
	frame_oam -10, -12, $00, 1 | OAMF_YFLIP
	db $80

.frame_17
	frame_oam -25,   4, $16, 1 | OAMF_YFLIP
	frame_oam -25,  -4, $14, 1 | OAMF_YFLIP
	frame_oam -25, -12, $12, 1 | OAMF_YFLIP
	frame_oam  -9,   4, $10, 1 | OAMF_YFLIP
	frame_oam  -9,  -4, $0e, 1 | OAMF_YFLIP
	frame_oam  -9, -12, $0c, 1 | OAMF_YFLIP
	db $80

Frameset_173fe::
	db $00,  3
	db $01,  3
	db $02,  3
	db $03,  3
	db $04,  3
	db $ff

Frameset_17409::
	db $05, 12
	db $06,  8
	db $07,  6
	db $08,  6
	db $09,  8
	db $ff

Frameset_17414::
	db $0a,  5
	db $0b,  5
	db $0c,  6
	db $06,  7
	db $05,  8
	db $ff

Frameset_1741f::
	db $0d,  3
	db $0e,  3
	db $0f,  3
	db $10,  3
	db $11,  3
	db $ff

Frameset_1742a::
	db $05,  4
	db $ff

OAM_1742d::
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

.frame_0
	frame_oam -32,   4, $04, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32, -12, $00, 0
	frame_oam -16,   4, $0a, 0
	frame_oam -16,  -4, $08, 0
	frame_oam -16, -12, $06, 0
	db $80

.frame_1
	frame_oam -32,   4, $38, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32, -12, $00, 0
	frame_oam -16,   4, $10, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -16, -12, $0c, 0
	db $80

.frame_2
	frame_oam -33,   4, $7a, 0
	frame_oam -33,  -4, $02, 0
	frame_oam -33, -12, $00, 0
	frame_oam -17,   4, $16, 0
	frame_oam -17,  -4, $14, 0
	frame_oam -17, -12, $12, 0
	db $80

.frame_3
	frame_oam -32,   4, $3a, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32, -12, $00, 0
	frame_oam -16,   4, $1c, 0
	frame_oam -16,  -4, $1a, 0
	frame_oam -16, -12, $18, 0
	db $80

.frame_4
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -16, -12, $0a, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -16,   4, $06, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -32, -12, $38, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -16, -12, $10, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $0e, 0 | OAMF_XFLIP
	frame_oam -16,   4, $0c, 0 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -33, -12, $7a, 0 | OAMF_XFLIP
	frame_oam -33,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -33,   4, $00, 0 | OAMF_XFLIP
	frame_oam -17, -12, $16, 0 | OAMF_XFLIP
	frame_oam -17,  -4, $14, 0 | OAMF_XFLIP
	frame_oam -17,   4, $12, 0 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -32, -12, $3a, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -16, -12, $1c, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $1a, 0 | OAMF_XFLIP
	frame_oam -16,   4, $18, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -14,   4, $24, 0
	frame_oam -14,  -4, $22, 0
	frame_oam -14, -12, $20, 0
	frame_oam -30,   4, $04, 0
	frame_oam -30,  -4, $02, 0
	frame_oam -30, -12, $00, 0
	db $80

.frame_9
	frame_oam -14,   4, $2a, 0
	frame_oam -14,  -4, $28, 0
	frame_oam -14, -12, $26, 0
	frame_oam -30,   4, $04, 0
	frame_oam -30,  -4, $02, 0
	frame_oam -30, -12, $00, 0
	db $80

.frame_10
	frame_oam -14, -12, $24, 0 | OAMF_XFLIP
	frame_oam -14,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -14,   4, $20, 0 | OAMF_XFLIP
	frame_oam -30, -12, $04, 0 | OAMF_XFLIP
	frame_oam -30,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -30,   4, $00, 0 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -14, -12, $2a, 0 | OAMF_XFLIP
	frame_oam -14,  -4, $28, 0 | OAMF_XFLIP
	frame_oam -14,   4, $26, 0 | OAMF_XFLIP
	frame_oam -30, -12, $04, 0 | OAMF_XFLIP
	frame_oam -30,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -30,   4, $00, 0 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -30,   4, $30, 0
	frame_oam -30,  -4, $2e, 0
	frame_oam -30, -12, $2c, 0
	frame_oam -14,   4, $2a, 0
	frame_oam -14,  -4, $28, 0
	frame_oam -14, -12, $26, 0
	db $80

.frame_13
	frame_oam -30,   4, $36, 0
	frame_oam -30,  -4, $34, 0
	frame_oam -30, -12, $32, 0
	frame_oam -14,   4, $2a, 0
	frame_oam -14,  -4, $28, 0
	frame_oam -14, -12, $26, 0
	db $80

.frame_14
	frame_oam -30, -12, $30, 0 | OAMF_XFLIP
	frame_oam -30,  -4, $2e, 0 | OAMF_XFLIP
	frame_oam -30,   4, $2c, 0 | OAMF_XFLIP
	frame_oam -14, -12, $2a, 0 | OAMF_XFLIP
	frame_oam -14,  -4, $28, 0 | OAMF_XFLIP
	frame_oam -14,   4, $26, 0 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -30, -12, $36, 0 | OAMF_XFLIP
	frame_oam -30,  -4, $34, 0 | OAMF_XFLIP
	frame_oam -30,   4, $32, 0 | OAMF_XFLIP
	frame_oam -14, -12, $2a, 0 | OAMF_XFLIP
	frame_oam -14,  -4, $28, 0 | OAMF_XFLIP
	frame_oam -14,   4, $26, 0 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -32,   4, $48, 0
	frame_oam -32,  -4, $42, 0
	frame_oam -32, -12, $40, 0
	frame_oam -16,   4, $1e, 0
	frame_oam -16,  -4, $3e, 0
	frame_oam -16, -12, $3c, 0
	db $80

.frame_17
	frame_oam -32,   4, $50, 0
	frame_oam -32,  -4, $4c, 0
	frame_oam -32, -12, $4a, 0
	frame_oam -16,   4, $1e, 0
	frame_oam -16,  -4, $3e, 0
	frame_oam -16, -12, $3c, 0
	db $80

.frame_18
	frame_oam -32, -12, $4a, 0
	frame_oam -32,   4, $50, 0
	frame_oam -32,  -4, $4e, 0
	frame_oam -16,   4, $1e, 0
	frame_oam -16,  -4, $3e, 0
	frame_oam -16, -12, $3c, 0
	db $80

.frame_19
	frame_oam -32,   4, $48, 0
	frame_oam -32,  -4, $46, 0
	frame_oam -32, -12, $44, 0
	frame_oam -16,   4, $1e, 0
	frame_oam -16,  -4, $3e, 0
	frame_oam -16, -12, $3c, 0
	db $80

.frame_20
	frame_oam -32,  -4, $5e, 0
	frame_oam -32,   4, $48, 0
	frame_oam -32, -12, $44, 0
	frame_oam -16,   4, $1e, 0
	frame_oam -16,  -4, $3e, 0
	frame_oam -16, -12, $3c, 0
	db $80

.frame_21
	frame_oam -31,  -4, $5e, 0
	frame_oam -15,   4, $56, 0
	frame_oam -15,  -4, $54, 0
	frame_oam -15, -12, $52, 0
	frame_oam -31,   4, $48, 0
	frame_oam -31, -12, $44, 0
	db $80

.frame_22
	frame_oam -15,   4, $5c, 0
	frame_oam -31,  -4, $5e, 0
	frame_oam -15,  -4, $5a, 0
	frame_oam -15, -12, $58, 0
	frame_oam -31,   4, $48, 0
	frame_oam -31, -12, $44, 0
	db $80

.frame_23
	frame_oam -32, -12, $48, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $42, 0 | OAMF_XFLIP
	frame_oam -32,   4, $40, 0 | OAMF_XFLIP
	frame_oam -16, -12, $1e, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $3e, 0 | OAMF_XFLIP
	frame_oam -16,   4, $3c, 0 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -32, -12, $50, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $4c, 0 | OAMF_XFLIP
	frame_oam -32,   4, $4a, 0 | OAMF_XFLIP
	frame_oam -16, -12, $1e, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $3e, 0 | OAMF_XFLIP
	frame_oam -16,   4, $3c, 0 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -32,   4, $4a, 0 | OAMF_XFLIP
	frame_oam -32, -12, $50, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $4e, 0 | OAMF_XFLIP
	frame_oam -16, -12, $1e, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $3e, 0 | OAMF_XFLIP
	frame_oam -16,   4, $3c, 0 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -32, -12, $48, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -32,   4, $44, 0 | OAMF_XFLIP
	frame_oam -16, -12, $1e, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $3e, 0 | OAMF_XFLIP
	frame_oam -16,   4, $3c, 0 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -32,  -4, $5e, 0 | OAMF_XFLIP
	frame_oam -32, -12, $48, 0 | OAMF_XFLIP
	frame_oam -32,   4, $44, 0 | OAMF_XFLIP
	frame_oam -16, -12, $1e, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $3e, 0 | OAMF_XFLIP
	frame_oam -16,   4, $3c, 0 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam -31,  -4, $5e, 0 | OAMF_XFLIP
	frame_oam -15, -12, $56, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $54, 0 | OAMF_XFLIP
	frame_oam -15,   4, $52, 0 | OAMF_XFLIP
	frame_oam -31, -12, $48, 0 | OAMF_XFLIP
	frame_oam -31,   4, $44, 0 | OAMF_XFLIP
	db $80

.frame_29
	frame_oam -15, -12, $5c, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $5e, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $5a, 0 | OAMF_XFLIP
	frame_oam -15,   4, $58, 0 | OAMF_XFLIP
	frame_oam -31, -12, $48, 0 | OAMF_XFLIP
	frame_oam -31,   4, $44, 0 | OAMF_XFLIP
	db $80

.frame_30
	frame_oam -16,   4, $72, 0
	frame_oam -16,  -4, $70, 0
	frame_oam -16, -12, $6e, 0
	frame_oam -32,   4, $6c, 0
	frame_oam -32,  -4, $6a, 0
	frame_oam -32, -12, $68, 0
	db $80

.frame_31
	frame_oam -16,   0, $66, 0 | OAMF_XFLIP
	frame_oam -16,   8, $64, 0 | OAMF_XFLIP
	frame_oam -32,   0, $62, 0 | OAMF_XFLIP
	frame_oam -32,   8, $60, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $66, 0
	frame_oam -16, -16, $64, 0
	frame_oam -32,  -8, $62, 0
	frame_oam -32, -16, $60, 0
	db $80

.frame_32
	frame_oam -16, -12, $72, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $70, 0 | OAMF_XFLIP
	frame_oam -16,   4, $6e, 0 | OAMF_XFLIP
	frame_oam -32, -12, $6c, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $6a, 0 | OAMF_XFLIP
	frame_oam -32,   4, $68, 0 | OAMF_XFLIP
	db $80

.frame_33
	frame_oam -16, -12, $52, 0
	frame_oam -32,   4, $78, 0
	frame_oam -32,  -4, $76, 0
	frame_oam -32, -12, $74, 0
	frame_oam -16,   4, $7e, 0
	frame_oam -16,  -4, $7c, 0
	db $80

.frame_34
	frame_oam -16,   4, $52, 0 | OAMF_XFLIP
	frame_oam -32, -12, $78, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $76, 0 | OAMF_XFLIP
	frame_oam -32,   4, $74, 0 | OAMF_XFLIP
	frame_oam -16, -12, $7e, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $7c, 0 | OAMF_XFLIP
	db $80

.frame_35
	frame_oam -31,   4, $78, 0
	frame_oam -31,  -4, $76, 0
	frame_oam -31, -12, $74, 0
	frame_oam -15,   4, $56, 0
	frame_oam -15,  -4, $54, 0
	frame_oam -15, -12, $52, 0
	db $80

.frame_36
	frame_oam -31, -12, $78, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $76, 0 | OAMF_XFLIP
	frame_oam -31,   4, $74, 0 | OAMF_XFLIP
	frame_oam -15, -12, $56, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $54, 0 | OAMF_XFLIP
	frame_oam -15,   4, $52, 0 | OAMF_XFLIP
	db $80

Frameset_1781c::
	db $00,  7
	db $ff

Frameset_1781f::
	db $04,  7
	db $ff

Frameset_17822::
	db $00,  7
	db $01,  7
	db $02,  7
	db $03,  7
	db $ff

Frameset_1782b::
	db $04,  7
	db $05,  7
	db $06,  7
	db $07,  7
	db $ff

Frameset_17834::
	db $01,  4
	db $02,  4
	db $ff

Frameset_17839::
	db $05,  4
	db $06,  4
	db $ff

Frameset_1783e::
	db $08,  4
	db $ff

Frameset_17841::
	db $0a,  4
	db $ff

Frameset_17844::
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

Frameset_1785b::
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

Frameset_17872::
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

Frameset_17887::
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

Frameset_1789c::
	db $10,  4
	db $11,  3
	db $12,  2
	db $13,  8
	db $10,  2
	db $13,  3
	db $10,  2
	db $13,  3
	db $10,  2
	db $13,  4
	db $14, 36
	db $15,  1
	db $14,  2
	db $15,  1
	db $16,  2
	db $15,  1
	db $16,  2
	db $15,  1
	db $16, 14
	db $ff

Frameset_178c3::
	db $17,  4
	db $18,  3
	db $19,  2
	db $1a,  8
	db $17,  2
	db $1a,  3
	db $17,  2
	db $1a,  3
	db $17,  2
	db $1a,  4
	db $1b, 36
	db $1c,  1
	db $1b,  2
	db $1c,  1
	db $1d,  2
	db $1c,  1
	db $1d,  2
	db $1c,  1
	db $1d, 14
	db $ff

Frameset_178ea::
	db $00,  1
	db $1e,  2
	db $1f,  2
	db $20,  2
	db $ff

Frameset_178f3::
	db $04,  1
	db $20,  2
	db $1f,  2
	db $1e,  2
	db $ff

Frameset_178fc::
	db $00,  1
	db $23,  2
	db $21,  1
	db $23,  2
	db $ff

Frameset_17905::
	db $04,  1
	db $24,  2
	db $22,  1
	db $24,  2
	db $ff

OAM_1790e::
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
	frame_oam -30, -18, $00, 0
	frame_oam -32, -10, $02, 0
	frame_oam -32,  -2, $04, 0
	frame_oam -32,   6, $06, 0
	frame_oam -18,  14, $08, 0
	frame_oam -16, -10, $0a, 0
	frame_oam -16,  -2, $0c, 0
	frame_oam -16,   6, $0e, 0
	db $80

.frame_1
	frame_oam -32, -16, $10, 0
	frame_oam -32,  -8, $12, 0
	frame_oam -32,   0, $14, 0
	frame_oam -32,   8, $16, 0
	frame_oam -32,  16, $18, 0
	frame_oam -16, -16, $1a, 0
	frame_oam -16,  -8, $1c, 0
	frame_oam -16,   0, $1e, 0
	frame_oam -16,   8, $20, 0
	frame_oam -16,  16, $22, 0
	db $80

.frame_2
	frame_oam -32, -16, $24, 1
	frame_oam -32,  -8, $26, 1
	frame_oam -32,   0, $28, 1
	frame_oam -32,   8, $2a, 1
	frame_oam -32,  16, $2c, 1
	frame_oam -16, -16, $2e, 1
	frame_oam -16,  -8, $30, 1
	frame_oam -16,   0, $32, 1
	frame_oam -16,   8, $34, 1
	frame_oam -16,  16, $36, 1
	db $80

.frame_3
	frame_oam -32,  -8, $12, 0
	frame_oam -16,  -8, $1c, 0
	frame_oam -16,   8, $42, 0
	frame_oam -32,   0, $14, 0
	frame_oam -32,   8, $3c, 0
	frame_oam -32, -16, $3a, 0
	frame_oam -16, -16, $3e, 0
	frame_oam -18,  16, $44, 0
	frame_oam -16,   0, $40, 0
	db $80

.frame_4
	frame_oam -32, -16, $24, 1
	frame_oam -32,  -8, $26, 1
	frame_oam -32,   0, $28, 1
	frame_oam -32,   8, $2a, 1
	frame_oam -32,  16, $2c, 1
	frame_oam -16, -16, $2e, 1
	frame_oam -16,  -8, $30, 1
	frame_oam -16,   8, $34, 1
	frame_oam -16,  16, $36, 1
	frame_oam -16,   0, $38, 1
	db $80

.frame_5
	frame_oam -16,  -5, $50, 0
	frame_oam -16,   3, $52, 0
	frame_oam -32, -13, $56, 0
	frame_oam -32,  -5, $58, 0
	frame_oam -32,   3, $5a, 0
	frame_oam -32,  11, $5c, 0
	frame_oam -16, -13, $5e, 0
	frame_oam -16,  11, $60, 0
	db $80

.frame_6
	frame_oam -32, -13, $46, 0
	frame_oam -32,  -5, $48, 0
	frame_oam -32,   3, $4a, 0
	frame_oam -32,  11, $4c, 0
	frame_oam -16, -13, $4e, 0
	frame_oam -16,  -5, $50, 0
	frame_oam -16,   3, $52, 0
	frame_oam -16,  11, $54, 0
	db $80

.frame_7
	frame_oam -32, -13, $62, 0
	frame_oam -32,  -5, $64, 0
	frame_oam -32,   3, $66, 0
	frame_oam -32,  11, $68, 0
	frame_oam -16, -13, $6a, 0
	frame_oam -16,  11, $6c, 0
	frame_oam -16,  -5, $50, 0
	frame_oam -16,   3, $52, 0
	db $80

.frame_8
	frame_oam -30,  10, $00, 0 | OAMF_XFLIP
	frame_oam -32,   2, $02, 0 | OAMF_XFLIP
	frame_oam -32,  -6, $04, 0 | OAMF_XFLIP
	frame_oam -32, -14, $06, 0 | OAMF_XFLIP
	frame_oam -18, -22, $08, 0 | OAMF_XFLIP
	frame_oam -16,   2, $0a, 0 | OAMF_XFLIP
	frame_oam -16,  -6, $0c, 0 | OAMF_XFLIP
	frame_oam -16, -14, $0e, 0 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -32,   8, $10, 0 | OAMF_XFLIP
	frame_oam -32,   0, $12, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $14, 0 | OAMF_XFLIP
	frame_oam -32, -16, $16, 0 | OAMF_XFLIP
	frame_oam -32, -24, $18, 0 | OAMF_XFLIP
	frame_oam -16,   8, $1a, 0 | OAMF_XFLIP
	frame_oam -16,   0, $1c, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $1e, 0 | OAMF_XFLIP
	frame_oam -16, -16, $20, 0 | OAMF_XFLIP
	frame_oam -16, -24, $22, 0 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -32,   8, $24, 1 | OAMF_XFLIP
	frame_oam -32,   0, $26, 1 | OAMF_XFLIP
	frame_oam -32,  -8, $28, 1 | OAMF_XFLIP
	frame_oam -32, -16, $2a, 1 | OAMF_XFLIP
	frame_oam -32, -24, $2c, 1 | OAMF_XFLIP
	frame_oam -16,   8, $2e, 1 | OAMF_XFLIP
	frame_oam -16,   0, $30, 1 | OAMF_XFLIP
	frame_oam -16,  -8, $32, 1 | OAMF_XFLIP
	frame_oam -16, -16, $34, 1 | OAMF_XFLIP
	frame_oam -16, -24, $36, 1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -32,   0, $12, 0 | OAMF_XFLIP
	frame_oam -16,   0, $1c, 0 | OAMF_XFLIP
	frame_oam -16, -16, $42, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $14, 0 | OAMF_XFLIP
	frame_oam -32, -16, $3c, 0 | OAMF_XFLIP
	frame_oam -32,   8, $3a, 0 | OAMF_XFLIP
	frame_oam -16,   8, $3e, 0 | OAMF_XFLIP
	frame_oam -18, -24, $44, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $40, 0 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -32,   8, $24, 1 | OAMF_XFLIP
	frame_oam -32,   0, $26, 1 | OAMF_XFLIP
	frame_oam -32,  -8, $28, 1 | OAMF_XFLIP
	frame_oam -32, -16, $2a, 1 | OAMF_XFLIP
	frame_oam -32, -24, $2c, 1 | OAMF_XFLIP
	frame_oam -16,   8, $2e, 1 | OAMF_XFLIP
	frame_oam -16,   0, $30, 1 | OAMF_XFLIP
	frame_oam -16, -16, $34, 1 | OAMF_XFLIP
	frame_oam -16, -24, $36, 1 | OAMF_XFLIP
	frame_oam -16,  -8, $38, 1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -16,  -3, $50, 0 | OAMF_XFLIP
	frame_oam -16, -11, $52, 0 | OAMF_XFLIP
	frame_oam -32,   5, $56, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $58, 0 | OAMF_XFLIP
	frame_oam -32, -11, $5a, 0 | OAMF_XFLIP
	frame_oam -32, -19, $5c, 0 | OAMF_XFLIP
	frame_oam -16,   5, $5e, 0 | OAMF_XFLIP
	frame_oam -16, -19, $60, 0 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -32,   5, $46, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $48, 0 | OAMF_XFLIP
	frame_oam -32, -11, $4a, 0 | OAMF_XFLIP
	frame_oam -32, -19, $4c, 0 | OAMF_XFLIP
	frame_oam -16,   5, $4e, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $50, 0 | OAMF_XFLIP
	frame_oam -16, -11, $52, 0 | OAMF_XFLIP
	frame_oam -16, -19, $54, 0 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -32,   5, $62, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $64, 0 | OAMF_XFLIP
	frame_oam -32, -11, $66, 0 | OAMF_XFLIP
	frame_oam -32, -19, $68, 0 | OAMF_XFLIP
	frame_oam -16,   5, $6a, 0 | OAMF_XFLIP
	frame_oam -16, -19, $6c, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $50, 0 | OAMF_XFLIP
	frame_oam -16, -11, $52, 0 | OAMF_XFLIP
	db $80

Frameset_17b76::
	db $00,  4
	db $ff

Frameset_17b79::
	db $08,  4
	db $ff

Frameset_17b7c::
	db $02,  2
	db $01,  2
	db $02,  2
	db $01,  2
	db $04,  2
	db $03,  2
	db $04,  2
	db $03,  2
	db $ff

Frameset_17b8d::
	db $0a,  2
	db $09,  2
	db $0a,  2
	db $09,  2
	db $0c,  2
	db $0b,  2
	db $0c,  2
	db $0b,  2
	db $ff

Frameset_17b9e::
	db $00,  4
	db $05,  7
	db $06,  7
	db $07,  7
	db $06,  7
	db $05,  7
	db $06,  7
	db $ff

Frameset_17bad::
	db $08,  4
	db $0d,  7
	db $0e,  7
	db $0f,  7
	db $0e,  7
	db $0d,  7
	db $0e,  7
	db $ff

OAM_17bbc::
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
	frame_oam -16, -12, $46, 0
	frame_oam -16,  -4, $48, 0
	frame_oam -16,   4, $46, 0 | OAMF_XFLIP
	frame_oam -32, -12, $40, 0
	frame_oam -32,  -4, $42, 0
	frame_oam -32,   4, $44, 0
	db $80

.frame_1
	frame_oam -32, -13, $4a, 0
	frame_oam -32,   3, $4c, 0
	frame_oam -32,  -5, $42, 0
	frame_oam -16, -16, $4e, 0
	frame_oam -16,  -8, $50, 0
	frame_oam -16,   0, $52, 0
	frame_oam -16,   8, $54, 0
	db $80

.frame_2
	frame_oam -32, -15, $56, 0
	frame_oam -32,  -7, $58, 0
	frame_oam -32,   1, $5a, 0
	frame_oam -16, -16, $5c, 0
	frame_oam -16,  -8, $5e, 0
	frame_oam -16,   0, $60, 0
	frame_oam -16,   8, $62, 0
	db $80

.frame_3
	frame_oam -32, -15, $64, 0
	frame_oam -32,  -7, $66, 0
	frame_oam -32,   1, $68, 0
	frame_oam -16, -16, $6a, 0
	frame_oam -16,  -8, $6c, 0
	frame_oam -16,   0, $6e, 0
	frame_oam -16,   8, $70, 0
	db $80

.frame_4
	frame_oam -16, -13, $76, 0
	frame_oam -16,  -5, $78, 0
	frame_oam -16,   3, $7a, 0
	frame_oam -32,  -5, $72, 0
	frame_oam -32,   3, $74, 0
	frame_oam -32, -13, $68, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16, -12, $46, 0
	frame_oam -16,  -4, $48, 0
	frame_oam -16,   4, $46, 0 | OAMF_XFLIP
	frame_oam -32,   4, $40, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $42, 0 | OAMF_XFLIP
	frame_oam -32, -12, $44, 0 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -32,   5, $4a, 0 | OAMF_XFLIP
	frame_oam -32, -11, $4c, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $42, 0 | OAMF_XFLIP
	frame_oam -16,   8, $4e, 0 | OAMF_XFLIP
	frame_oam -16,   0, $50, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $52, 0 | OAMF_XFLIP
	frame_oam -16, -16, $54, 0 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -32,   7, $56, 0 | OAMF_XFLIP
	frame_oam -32,  -1, $58, 0 | OAMF_XFLIP
	frame_oam -32,  -9, $5a, 0 | OAMF_XFLIP
	frame_oam -16,   8, $5c, 0 | OAMF_XFLIP
	frame_oam -16,   0, $5e, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $60, 0 | OAMF_XFLIP
	frame_oam -16, -16, $62, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -32,   7, $64, 0 | OAMF_XFLIP
	frame_oam -32,  -1, $66, 0 | OAMF_XFLIP
	frame_oam -32,  -9, $68, 0 | OAMF_XFLIP
	frame_oam -16,   8, $6a, 0 | OAMF_XFLIP
	frame_oam -16,   0, $6c, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $6e, 0 | OAMF_XFLIP
	frame_oam -16, -16, $70, 0 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -16,   5, $76, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $78, 0 | OAMF_XFLIP
	frame_oam -16, -11, $7a, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $72, 0 | OAMF_XFLIP
	frame_oam -32, -11, $74, 0 | OAMF_XFLIP
	frame_oam -32,   5, $68, 0
	db $80

Frameset_17ce2::
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

OAM_17cf7::
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
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32,   4, $04, 0
	frame_oam -16, -12, $06, 0
	frame_oam -16,  -4, $08, 0
	frame_oam -16,   4, $0a, 0
	db $80

.frame_1
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32,   4, $04, 0
	frame_oam -16, -12, $0c, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -16,   4, $10, 0
	db $80

.frame_2
	frame_oam -32, -12, $12, 0
	frame_oam -32,  -4, $14, 0
	frame_oam -32,   4, $16, 0
	frame_oam -16, -12, $18, 0
	frame_oam -16,  -4, $1a, 0
	frame_oam -16,   4, $1c, 0
	db $80

.frame_3
	frame_oam -32, -12, $1e, 0
	frame_oam -32,  -4, $20, 0
	frame_oam -32,   4, $22, 0
	frame_oam -16, -12, $24, 0
	frame_oam -16,  -4, $26, 0
	frame_oam -16,   4, $28, 0
	db $80

.frame_4
	frame_oam -32,  -8, $2a, 0
	frame_oam -32,   0, $2c, 0
	db $80

.frame_5
	frame_oam -32, -12, $2e, 0
	frame_oam -32,  -4, $30, 0
	frame_oam -32,   4, $32, 0
	frame_oam -16, -12, $34, 0
	frame_oam -16,  -4, $36, 0
	frame_oam -16,   4, $38, 0
	db $80

.frame_6
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	frame_oam -16,   4, $06, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -16, -12, $0a, 0 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	frame_oam -16,   4, $0c, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $0e, 0 | OAMF_XFLIP
	frame_oam -16, -12, $10, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -32,   4, $12, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $14, 0 | OAMF_XFLIP
	frame_oam -32, -12, $16, 0 | OAMF_XFLIP
	frame_oam -16,   4, $18, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $1a, 0 | OAMF_XFLIP
	frame_oam -16, -12, $1c, 0 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -32,   4, $1e, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $20, 0 | OAMF_XFLIP
	frame_oam -32, -12, $22, 0 | OAMF_XFLIP
	frame_oam -16,   4, $24, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $26, 0 | OAMF_XFLIP
	frame_oam -16, -12, $28, 0 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -32,   0, $2a, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $2c, 0 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -32,   4, $2e, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $30, 0 | OAMF_XFLIP
	frame_oam -32, -12, $32, 0 | OAMF_XFLIP
	frame_oam -16,   4, $34, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $36, 0 | OAMF_XFLIP
	frame_oam -16, -12, $38, 0 | OAMF_XFLIP
	db $80

Frameset_17e1b::
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

Frameset_17e3a::
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

Frameset_17e59::
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

Frameset_17e78::
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
