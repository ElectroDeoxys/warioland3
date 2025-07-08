OAM_1dc000:
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
	frame_oam -19, -16, $1c, 0
	frame_oam -35, -16, $1a, 0
	frame_oam -21,  -8, $1e, 0
	frame_oam -21,   0, $20, 0
	frame_oam -21,   8, $22, 0
	frame_oam  -5,   0, $26, 0
	frame_oam  -5,   8, $28, 0
	frame_oam  -5,  -8, $24, 0
	db $80

.frame_1
	frame_oam -19, -16, $2a, 0
	frame_oam -22,  -8, $2c, 0
	frame_oam -22,   0, $2e, 0
	frame_oam -22,   8, $30, 0
	frame_oam  -6,  -8, $32, 0
	frame_oam  -6,   0, $34, 0
	frame_oam  -6,   8, $36, 0
	db $80

.frame_2
	frame_oam -31, -14, $38, 0
	frame_oam -31,  -6, $3a, 0
	frame_oam -31,   2, $3c, 0
	frame_oam -15, -16, $3e, 0
	frame_oam -15,  -8, $40, 0
	frame_oam -15,   0, $42, 0
	frame_oam -17,   8, $44, 0
	db $80

.frame_3
	frame_oam -20, -15, $48, 0
	frame_oam -36, -15, $46, 0
	frame_oam -31,  -7, $4a, 0
	frame_oam -31,   1, $4c, 0
	frame_oam -15,  -7, $4e, 0
	frame_oam -15,   1, $50, 0
	frame_oam -18,   9, $52, 0
	db $80

.frame_4
	frame_oam -24, -14, $0e, 0
	frame_oam -24,  -6, $10, 0
	frame_oam -24,   2, $12, 0
	frame_oam  -8, -14, $14, 0
	frame_oam  -8,  -6, $16, 0
	frame_oam  -8,   2, $18, 0
	db $80

.frame_5
	frame_oam -22, -16, $00, 0
	frame_oam -22,  -8, $02, 0
	frame_oam  -6,  -9, $08, 0
	frame_oam -22,   0, $04, 0
	frame_oam -22,   8, $06, 0
	frame_oam  -6,  -1, $0a, 0
	frame_oam  -6,   7, $0c, 0
	db $80

.frame_6
	frame_oam -19, -16, $54, 0
	frame_oam -19,  -8, $56, 0
	frame_oam -19,   0, $58, 0
	frame_oam -19,   8, $5a, 0
	frame_oam  -3,  -8, $5c, 0
	frame_oam  -3,   0, $5e, 0
	frame_oam  -3,   8, $60, 0
	db $80

.frame_7
	frame_oam -19,   8, $54, 0 | OAMF_XFLIP
	frame_oam -19,   0, $56, 0 | OAMF_XFLIP
	frame_oam -19,  -8, $58, 0 | OAMF_XFLIP
	frame_oam -19, -16, $5a, 0 | OAMF_XFLIP
	frame_oam  -3,   0, $5c, 0 | OAMF_XFLIP
	frame_oam  -3,  -8, $5e, 0 | OAMF_XFLIP
	frame_oam  -3, -16, $60, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -20, -16, $62, 0
	frame_oam -20,  -8, $64, 0
	frame_oam -20,   0, $66, 0
	frame_oam -20,   8, $68, 0
	frame_oam  -4, -16, $6a, 0
	frame_oam  -4,  -8, $6c, 0
	frame_oam  -4,   0, $6e, 0
	db $80

.frame_9
	frame_oam -20,   8, $62, 0 | OAMF_XFLIP
	frame_oam -20,   0, $64, 0 | OAMF_XFLIP
	frame_oam -20,  -8, $66, 0 | OAMF_XFLIP
	frame_oam -20, -16, $68, 0 | OAMF_XFLIP
	frame_oam  -4,   8, $6a, 0 | OAMF_XFLIP
	frame_oam  -4,   0, $6c, 0 | OAMF_XFLIP
	frame_oam  -4,  -8, $6e, 0 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -19,   8, $1c, 0 | OAMF_XFLIP
	frame_oam -35,   8, $1a, 0 | OAMF_XFLIP
	frame_oam -21,   0, $1e, 0 | OAMF_XFLIP
	frame_oam -21,  -8, $20, 0 | OAMF_XFLIP
	frame_oam -21, -16, $22, 0 | OAMF_XFLIP
	frame_oam  -5,  -8, $26, 0 | OAMF_XFLIP
	frame_oam  -5, -16, $28, 0 | OAMF_XFLIP
	frame_oam  -5,   0, $24, 0 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -19,   8, $2a, 0 | OAMF_XFLIP
	frame_oam -22,   0, $2c, 0 | OAMF_XFLIP
	frame_oam -22,  -8, $2e, 0 | OAMF_XFLIP
	frame_oam -22, -16, $30, 0 | OAMF_XFLIP
	frame_oam  -6,   0, $32, 0 | OAMF_XFLIP
	frame_oam  -6,  -8, $34, 0 | OAMF_XFLIP
	frame_oam  -6, -16, $36, 0 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -31,   6, $38, 0 | OAMF_XFLIP
	frame_oam -31,  -2, $3a, 0 | OAMF_XFLIP
	frame_oam -31, -10, $3c, 0 | OAMF_XFLIP
	frame_oam -15,   8, $3e, 0 | OAMF_XFLIP
	frame_oam -15,   0, $40, 0 | OAMF_XFLIP
	frame_oam -15,  -8, $42, 0 | OAMF_XFLIP
	frame_oam -17, -16, $44, 0 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -20,   7, $48, 0 | OAMF_XFLIP
	frame_oam -36,   7, $46, 0 | OAMF_XFLIP
	frame_oam -31,  -1, $4a, 0 | OAMF_XFLIP
	frame_oam -31,  -9, $4c, 0 | OAMF_XFLIP
	frame_oam -15,  -1, $4e, 0 | OAMF_XFLIP
	frame_oam -15,  -9, $50, 0 | OAMF_XFLIP
	frame_oam -18, -17, $52, 0 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -24,   6, $0e, 0 | OAMF_XFLIP
	frame_oam -24,  -2, $10, 0 | OAMF_XFLIP
	frame_oam -24, -10, $12, 0 | OAMF_XFLIP
	frame_oam  -8,   6, $14, 0 | OAMF_XFLIP
	frame_oam  -8,  -2, $16, 0 | OAMF_XFLIP
	frame_oam  -8, -10, $18, 0 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -22,   8, $00, 0 | OAMF_XFLIP
	frame_oam -22,   0, $02, 0 | OAMF_XFLIP
	frame_oam  -6,   1, $08, 0 | OAMF_XFLIP
	frame_oam -22,  -8, $04, 0 | OAMF_XFLIP
	frame_oam -22, -16, $06, 0 | OAMF_XFLIP
	frame_oam  -6,  -7, $0a, 0 | OAMF_XFLIP
	frame_oam  -6, -15, $0c, 0 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -21, -16, $1c, 0
	frame_oam -37, -16, $1a, 0
	frame_oam -23,  -8, $1e, 0
	frame_oam -23,   0, $20, 0
	frame_oam -23,   8, $22, 0
	frame_oam  -7,   0, $26, 0
	frame_oam  -7,   8, $28, 0
	frame_oam  -7,  -8, $24, 0
	db $80

.frame_17
	frame_oam -21, -16, $54, 0
	frame_oam -21,  -8, $56, 0
	frame_oam -21,   0, $58, 0
	frame_oam -21,   8, $5a, 0
	frame_oam  -5,  -8, $5c, 0
	frame_oam  -5,   0, $5e, 0
	frame_oam  -5,   8, $60, 0
	db $80

.frame_18
	frame_oam -21,   8, $54, 0 | OAMF_XFLIP
	frame_oam -21,   0, $56, 0 | OAMF_XFLIP
	frame_oam -21,  -8, $58, 0 | OAMF_XFLIP
	frame_oam -21, -16, $5a, 0 | OAMF_XFLIP
	frame_oam  -5,   0, $5c, 0 | OAMF_XFLIP
	frame_oam  -5,  -8, $5e, 0 | OAMF_XFLIP
	frame_oam  -5, -16, $60, 0 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -21,   8, $1c, 0 | OAMF_XFLIP
	frame_oam -37,   8, $1a, 0 | OAMF_XFLIP
	frame_oam -23,   0, $1e, 0 | OAMF_XFLIP
	frame_oam -23,  -8, $20, 0 | OAMF_XFLIP
	frame_oam -23, -16, $22, 0 | OAMF_XFLIP
	frame_oam  -7,  -8, $26, 0 | OAMF_XFLIP
	frame_oam  -7, -16, $28, 0 | OAMF_XFLIP
	frame_oam  -7,   0, $24, 0 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -22, -16, $62, 0
	frame_oam -22,  -8, $64, 0
	frame_oam -22,   0, $66, 0
	frame_oam -22,   8, $68, 0
	frame_oam  -6, -16, $6a, 0
	frame_oam  -6,  -8, $6c, 0
	frame_oam  -6,   0, $6e, 0
	db $80

.frame_21
	frame_oam -22,   8, $62, 0 | OAMF_XFLIP
	frame_oam -22,   0, $64, 0 | OAMF_XFLIP
	frame_oam -22,  -8, $66, 0 | OAMF_XFLIP
	frame_oam -22, -16, $68, 0 | OAMF_XFLIP
	frame_oam  -6,   8, $6a, 0 | OAMF_XFLIP
	frame_oam  -6,   0, $6c, 0 | OAMF_XFLIP
	frame_oam  -6,  -8, $6e, 0 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -23, -16, $1c, 0
	frame_oam -39, -16, $1a, 0
	frame_oam -25,  -8, $1e, 0
	frame_oam -25,   0, $20, 0
	frame_oam -25,   8, $22, 0
	frame_oam  -9,   0, $26, 0
	frame_oam  -9,   8, $28, 0
	frame_oam  -9,  -8, $24, 0
	db $80

.frame_23
	frame_oam -23, -16, $54, 0
	frame_oam -23,  -8, $56, 0
	frame_oam -23,   0, $58, 0
	frame_oam -23,   8, $5a, 0
	frame_oam  -7,  -8, $5c, 0
	frame_oam  -7,   0, $5e, 0
	frame_oam  -7,   8, $60, 0
	db $80

.frame_24
	frame_oam -23,   8, $54, 0 | OAMF_XFLIP
	frame_oam -23,   0, $56, 0 | OAMF_XFLIP
	frame_oam -23,  -8, $58, 0 | OAMF_XFLIP
	frame_oam -23, -16, $5a, 0 | OAMF_XFLIP
	frame_oam  -7,   0, $5c, 0 | OAMF_XFLIP
	frame_oam  -7,  -8, $5e, 0 | OAMF_XFLIP
	frame_oam  -7, -16, $60, 0 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -23,   8, $1c, 0 | OAMF_XFLIP
	frame_oam -39,   8, $1a, 0 | OAMF_XFLIP
	frame_oam -25,   0, $1e, 0 | OAMF_XFLIP
	frame_oam -25,  -8, $20, 0 | OAMF_XFLIP
	frame_oam -25, -16, $22, 0 | OAMF_XFLIP
	frame_oam  -9,  -8, $26, 0 | OAMF_XFLIP
	frame_oam  -9, -16, $28, 0 | OAMF_XFLIP
	frame_oam  -9,   0, $24, 0 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -24, -16, $62, 0
	frame_oam -24,  -8, $64, 0
	frame_oam -24,   0, $66, 0
	frame_oam -24,   8, $68, 0
	frame_oam  -8, -16, $6a, 0
	frame_oam  -8,  -8, $6c, 0
	frame_oam  -8,   0, $6e, 0
	db $80

.frame_27
	frame_oam -24,   8, $62, 0 | OAMF_XFLIP
	frame_oam -24,   0, $64, 0 | OAMF_XFLIP
	frame_oam -24,  -8, $66, 0 | OAMF_XFLIP
	frame_oam -24, -16, $68, 0 | OAMF_XFLIP
	frame_oam  -8,   8, $6a, 0 | OAMF_XFLIP
	frame_oam  -8,   0, $6c, 0 | OAMF_XFLIP
	frame_oam  -8,  -8, $6e, 0 | OAMF_XFLIP
	db $80

Frameset_1dc374:
	db   0,  5
	db   1,  5
	db   2,  5
	db   3,  5
	db   1,  5
	db $ff

Frameset_1dc37f:
	db   4,  6
	db   5,  6
	db $ff

Frameset_1dc384:
	db   5,  6
	db   4,  6
	db $ff

Frameset_1dc389:
	db   6,  4
	db   7,  4
	db $ff

Frameset_1dc38e:
	db   7,  4
	db   6,  4
	db $ff

Frameset_1dc393:
	db   0,  3
	db   6,  3
	db   7,  3
	db  10,  3
	db   8,  3
	db   9,  3
	db  16,  3
	db  17,  3
	db  18,  3
	db  19,  3
	db  26,  3
	db  27,  3
	db  22,  3
	db  23,  3
	db  24,  3
	db  25,  3
	db  20,  3
	db  21,  3
	db $ff

Frameset_1dc3b8:
	db  10,  5
	db  11,  5
	db  12,  5
	db  13,  5
	db  11,  5
	db $ff

Frameset_1dc3c3:
	db  14,  6
	db  15,  6
	db $ff

Frameset_1dc3c8:
	db  15,  6
	db  14,  6
	db $ff

OAM_1dc3cd:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5

.frame_0
	frame_oam -24,  -8, $78, 0
	frame_oam -24,   0, $7a, 0
	db $80

.frame_1
	frame_oam -24,  -8, $7c, 0
	frame_oam -24,   0, $7e, 0
	db $80

.frame_2
	frame_oam -24,   0, $5e, 0
	frame_oam -24,  -8, $66, 0
	db $80

.frame_3
	frame_oam -24,   0, $78, 0 | OAMF_XFLIP
	frame_oam -24,  -8, $7a, 0 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -24,   0, $7c, 0 | OAMF_XFLIP
	frame_oam -24,  -8, $7e, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -24,  -8, $5e, 0 | OAMF_XFLIP
	frame_oam -24,   0, $66, 0 | OAMF_XFLIP
	db $80

Frameset_1dc40f:
	db   0,  6
	db   1,  6
	db   2,  4
	db   1,  4
	db   0,  6
	db   1,  6
	db   2,  2
	db   1,  2
	db   0,  2
	db   1,  2
	db   0,  4
	db   1, 12
	db   2,  8
	db   1, 30
	db $ff

Frameset_1dc42c:
	db   3,  6
	db   4,  6
	db   5,  4
	db   4,  4
	db   3,  6
	db   4,  6
	db   5,  2
	db   4,  2
	db   3,  2
	db   4,  2
	db   3,  4
	db   4, 12
	db   5,  8
	db   4, 30
	db $ff

OAM_1dc449:
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
	frame_oam -32, -16, $00, 0
	frame_oam -32,  -8, $02, 0
	frame_oam -32,   0, $04, 0
	frame_oam -32,   8, $06, 0
	frame_oam -16, -16, $20, 0
	frame_oam -16,  -8, $22, 0
	frame_oam -16,   0, $24, 0
	frame_oam -16,   8, $26, 0
	db $80

.frame_1
	frame_oam -32, -16, $08, 0
	frame_oam -32,  -8, $0a, 0
	frame_oam -32,   0, $0c, 0
	frame_oam -32,   8, $0e, 0
	frame_oam -16, -16, $28, 0
	frame_oam -16,  -8, $2a, 0
	frame_oam -16,   0, $2c, 0
	frame_oam -16,   8, $2e, 0
	db $80

.frame_2
	frame_oam -32, -16, $10, 0
	frame_oam -32,  -8, $12, 0
	frame_oam -32,   0, $14, 0
	frame_oam -32,   8, $16, 0
	frame_oam -16, -16, $30, 0
	frame_oam -16,  -8, $32, 0
	frame_oam -16,   0, $34, 0
	frame_oam -16,   8, $36, 0
	db $80

.frame_3
	frame_oam -32, -16, $18, 0
	frame_oam -32,  -8, $1a, 0
	frame_oam -32,   0, $1c, 0
	frame_oam -32,   8, $1e, 0
	frame_oam -16, -16, $38, 0
	frame_oam -16,  -8, $3a, 0
	frame_oam -16,   0, $3c, 0
	frame_oam -16,   8, $3e, 0
	db $80

.frame_4
	frame_oam -32,   8, $00, 0 | OAMF_XFLIP
	frame_oam -32,   0, $02, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $04, 0 | OAMF_XFLIP
	frame_oam -32, -16, $06, 0 | OAMF_XFLIP
	frame_oam -16,   8, $20, 0 | OAMF_XFLIP
	frame_oam -16,   0, $22, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $24, 0 | OAMF_XFLIP
	frame_oam -16, -16, $26, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -32,   8, $08, 0 | OAMF_XFLIP
	frame_oam -32,   0, $0a, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $0c, 0 | OAMF_XFLIP
	frame_oam -32, -16, $0e, 0 | OAMF_XFLIP
	frame_oam -16,   8, $28, 0 | OAMF_XFLIP
	frame_oam -16,   0, $2a, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $2c, 0 | OAMF_XFLIP
	frame_oam -16, -16, $2e, 0 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -32,   8, $10, 0 | OAMF_XFLIP
	frame_oam -32,   0, $12, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $14, 0 | OAMF_XFLIP
	frame_oam -32, -16, $16, 0 | OAMF_XFLIP
	frame_oam -16,   8, $30, 0 | OAMF_XFLIP
	frame_oam -16,   0, $32, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $34, 0 | OAMF_XFLIP
	frame_oam -16, -16, $36, 0 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -32,   8, $18, 0 | OAMF_XFLIP
	frame_oam -32,   0, $1a, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $1c, 0 | OAMF_XFLIP
	frame_oam -32, -16, $1e, 0 | OAMF_XFLIP
	frame_oam -16,   8, $38, 0 | OAMF_XFLIP
	frame_oam -16,   0, $3a, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $3c, 0 | OAMF_XFLIP
	frame_oam -16, -16, $3e, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -49,  -4, $58, 0
	frame_oam -41,  -9, $5a, 0
	frame_oam -32, -15, $40, 0
	frame_oam -32,  -7, $42, 0
	frame_oam -32,   1, $44, 0
	frame_oam -32,   9, $46, 0
	frame_oam -16, -12, $60, 0
	frame_oam -16,  -4, $62, 0
	frame_oam -16,   4, $64, 0
	db $80

.frame_9
	frame_oam -43, -11, $5c, 0
	frame_oam -58,  -6, $58, 0
	frame_oam -48,  -4, $5a, 0
	frame_oam -32, -17, $40, 0
	frame_oam -32,  -9, $42, 0
	frame_oam -32,  -1, $44, 0
	frame_oam -32,   7, $46, 0
	frame_oam -16, -14, $60, 0
	frame_oam -16,  -6, $62, 0
	frame_oam -16,   2, $64, 0
	db $80

.frame_10
	frame_oam -50, -15, $5c, 0
	frame_oam -59,  -4, $58, 0
	frame_oam -46,  -2, $5a, 0
	frame_oam -32, -15, $40, 0
	frame_oam -32,  -7, $42, 0
	frame_oam -32,   1, $44, 0
	frame_oam -32,   9, $46, 0
	frame_oam -16, -12, $60, 0
	frame_oam -16,  -4, $62, 0
	frame_oam -16,   4, $64, 0
	db $80

.frame_11
	frame_oam -54, -17, $5c, 0
	frame_oam -62,  -3, $58, 0
	frame_oam -49,   0, $5a, 0
	frame_oam -32, -16, $40, 0
	frame_oam -32,  -8, $42, 0
	frame_oam -32,   0, $44, 0
	frame_oam -32,   8, $46, 0
	frame_oam -16, -13, $60, 0
	frame_oam -16,  -5, $62, 0
	frame_oam -16,   3, $64, 0
	db $80

.frame_12
	frame_oam -56, -16, $5c, 0
	frame_oam -65,  -5, $58, 0
	frame_oam -53,   3, $5a, 0
	frame_oam -32, -16, $40, 0
	frame_oam -32,  -8, $42, 0
	frame_oam -32,   0, $44, 0
	frame_oam -32,   8, $46, 0
	frame_oam -16, -13, $60, 0
	frame_oam -16,  -5, $62, 0
	frame_oam -16,   3, $64, 0
	db $80

.frame_13
	frame_oam -59, -17, $5c, 0
	frame_oam -56,   2, $5a, 0
	frame_oam -32, -16, $40, 0
	frame_oam -32,  -8, $42, 0
	frame_oam -32,   0, $44, 0
	frame_oam -32,   8, $46, 0
	frame_oam -16, -13, $60, 0
	frame_oam -16,  -5, $62, 0
	frame_oam -16,   3, $64, 0
	frame_oam -69,  -4, $5a, 0
	db $80

.frame_14
	frame_oam -60, -16, $5c, 0
	frame_oam -32, -16, $40, 0
	frame_oam -32,  -8, $42, 0
	frame_oam -32,   0, $44, 0
	frame_oam -32,   8, $46, 0
	frame_oam -16, -13, $60, 0
	frame_oam -16,  -5, $62, 0
	frame_oam -16,   3, $64, 0
	frame_oam -71,  -5, $5a, 0
	frame_oam -62,   3, $5c, 0
	db $80

.frame_15
	frame_oam -62, -17, $5c, 0
	frame_oam -64,   2, $5c, 0
	frame_oam -78,  -5, $5c, 0
	frame_oam -32, -16, $48, 0
	frame_oam -32,  -8, $4a, 0
	frame_oam -32,   0, $4c, 0
	frame_oam -32,   8, $4e, 0
	frame_oam -16, -16, $68, 0
	frame_oam -16,  -8, $6a, 0
	frame_oam -16,   0, $6c, 0
	frame_oam -16,   8, $6e, 0
	db $80

.frame_16
	frame_oam -64, -18, $5c, 0
	frame_oam -80,  -6, $5c, 0
	frame_oam -32, -16, $48, 0
	frame_oam -32,  -8, $4a, 0
	frame_oam -32,   0, $4c, 0
	frame_oam -32,   8, $4e, 0
	frame_oam -16, -16, $68, 0
	frame_oam -16,  -8, $6a, 0
	frame_oam -16,   0, $6c, 0
	frame_oam -16,   8, $6e, 0
	db $80

.frame_17
	frame_oam -30, -17, $50, 0
	frame_oam -30,  -9, $52, 0
	frame_oam -30,  -1, $54, 0
	frame_oam -30,   7, $56, 0
	frame_oam -14, -17, $70, 0
	frame_oam -14,  -9, $72, 0
	frame_oam -14,  -1, $74, 0
	frame_oam -14,   7, $76, 0
	frame_oam -65, -17, $5c, 0
	db $80

.frame_18
	frame_oam -30, -17, $50, 0
	frame_oam -30,  -9, $52, 0
	frame_oam -30,  -1, $54, 0
	frame_oam -30,   7, $56, 0
	frame_oam -14, -17, $70, 0
	frame_oam -14,  -9, $72, 0
	frame_oam -14,  -1, $74, 0
	frame_oam -14,   7, $76, 0
	db $80

.frame_19
	frame_oam -49,  -4, $58, 0 | OAMF_XFLIP
	frame_oam -41,   1, $5a, 0 | OAMF_XFLIP
	frame_oam -32,   7, $40, 0 | OAMF_XFLIP
	frame_oam -32,  -1, $42, 0 | OAMF_XFLIP
	frame_oam -32,  -9, $44, 0 | OAMF_XFLIP
	frame_oam -32, -17, $46, 0 | OAMF_XFLIP
	frame_oam -16,   4, $60, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $62, 0 | OAMF_XFLIP
	frame_oam -16, -12, $64, 0 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -43,   3, $5c, 0 | OAMF_XFLIP
	frame_oam -58,  -2, $58, 0 | OAMF_XFLIP
	frame_oam -48,  -4, $5a, 0 | OAMF_XFLIP
	frame_oam -32,   9, $40, 0 | OAMF_XFLIP
	frame_oam -32,   1, $42, 0 | OAMF_XFLIP
	frame_oam -32,  -7, $44, 0 | OAMF_XFLIP
	frame_oam -32, -15, $46, 0 | OAMF_XFLIP
	frame_oam -16,   6, $60, 0 | OAMF_XFLIP
	frame_oam -16,  -2, $62, 0 | OAMF_XFLIP
	frame_oam -16, -10, $64, 0 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -50,   7, $5c, 0 | OAMF_XFLIP
	frame_oam -59,  -4, $58, 0 | OAMF_XFLIP
	frame_oam -46,  -6, $5a, 0 | OAMF_XFLIP
	frame_oam -32,   7, $40, 0 | OAMF_XFLIP
	frame_oam -32,  -1, $42, 0 | OAMF_XFLIP
	frame_oam -32,  -9, $44, 0 | OAMF_XFLIP
	frame_oam -32, -17, $46, 0 | OAMF_XFLIP
	frame_oam -16,   4, $60, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $62, 0 | OAMF_XFLIP
	frame_oam -16, -12, $64, 0 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -54,   9, $5c, 0 | OAMF_XFLIP
	frame_oam -62,  -5, $58, 0 | OAMF_XFLIP
	frame_oam -49,  -8, $5a, 0 | OAMF_XFLIP
	frame_oam -32,   8, $40, 0 | OAMF_XFLIP
	frame_oam -32,   0, $42, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $44, 0 | OAMF_XFLIP
	frame_oam -32, -16, $46, 0 | OAMF_XFLIP
	frame_oam -16,   5, $60, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $62, 0 | OAMF_XFLIP
	frame_oam -16, -11, $64, 0 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -56,   8, $5c, 0 | OAMF_XFLIP
	frame_oam -65,  -3, $58, 0 | OAMF_XFLIP
	frame_oam -53, -11, $5a, 0 | OAMF_XFLIP
	frame_oam -32,   8, $40, 0 | OAMF_XFLIP
	frame_oam -32,   0, $42, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $44, 0 | OAMF_XFLIP
	frame_oam -32, -16, $46, 0 | OAMF_XFLIP
	frame_oam -16,   5, $60, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $62, 0 | OAMF_XFLIP
	frame_oam -16, -11, $64, 0 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -59,   9, $5c, 0 | OAMF_XFLIP
	frame_oam -56, -10, $5a, 0 | OAMF_XFLIP
	frame_oam -32,   8, $40, 0 | OAMF_XFLIP
	frame_oam -32,   0, $42, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $44, 0 | OAMF_XFLIP
	frame_oam -32, -16, $46, 0 | OAMF_XFLIP
	frame_oam -16,   5, $60, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $62, 0 | OAMF_XFLIP
	frame_oam -16, -11, $64, 0 | OAMF_XFLIP
	frame_oam -69,  -4, $5a, 0 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -60,   8, $5c, 0 | OAMF_XFLIP
	frame_oam -32,   8, $40, 0 | OAMF_XFLIP
	frame_oam -32,   0, $42, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $44, 0 | OAMF_XFLIP
	frame_oam -32, -16, $46, 0 | OAMF_XFLIP
	frame_oam -16,   5, $60, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $62, 0 | OAMF_XFLIP
	frame_oam -16, -11, $64, 0 | OAMF_XFLIP
	frame_oam -71,  -3, $5a, 0 | OAMF_XFLIP
	frame_oam -62, -11, $5c, 0 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -62,   9, $5c, 0 | OAMF_XFLIP
	frame_oam -64, -10, $5c, 0 | OAMF_XFLIP
	frame_oam -78,  -3, $5c, 0 | OAMF_XFLIP
	frame_oam -32,   8, $48, 0 | OAMF_XFLIP
	frame_oam -32,   0, $4a, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $4c, 0 | OAMF_XFLIP
	frame_oam -32, -16, $4e, 0 | OAMF_XFLIP
	frame_oam -16,   8, $68, 0 | OAMF_XFLIP
	frame_oam -16,   0, $6a, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $6c, 0 | OAMF_XFLIP
	frame_oam -16, -16, $6e, 0 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -64,  10, $5c, 0 | OAMF_XFLIP
	frame_oam -80,  -2, $5c, 0 | OAMF_XFLIP
	frame_oam -32,   8, $48, 0 | OAMF_XFLIP
	frame_oam -32,   0, $4a, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $4c, 0 | OAMF_XFLIP
	frame_oam -32, -16, $4e, 0 | OAMF_XFLIP
	frame_oam -16,   8, $68, 0 | OAMF_XFLIP
	frame_oam -16,   0, $6a, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $6c, 0 | OAMF_XFLIP
	frame_oam -16, -16, $6e, 0 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam -30,   9, $50, 0 | OAMF_XFLIP
	frame_oam -30,   1, $52, 0 | OAMF_XFLIP
	frame_oam -30,  -7, $54, 0 | OAMF_XFLIP
	frame_oam -30, -15, $56, 0 | OAMF_XFLIP
	frame_oam -14,   9, $70, 0 | OAMF_XFLIP
	frame_oam -14,   1, $72, 0 | OAMF_XFLIP
	frame_oam -14,  -7, $74, 0 | OAMF_XFLIP
	frame_oam -14, -15, $76, 0 | OAMF_XFLIP
	frame_oam -65,   9, $5c, 0 | OAMF_XFLIP
	db $80

.frame_29
	frame_oam -30,   9, $50, 0 | OAMF_XFLIP
	frame_oam -30,   1, $52, 0 | OAMF_XFLIP
	frame_oam -30,  -7, $54, 0 | OAMF_XFLIP
	frame_oam -30, -15, $56, 0 | OAMF_XFLIP
	frame_oam -14,   9, $70, 0 | OAMF_XFLIP
	frame_oam -14,   1, $72, 0 | OAMF_XFLIP
	frame_oam -14,  -7, $74, 0 | OAMF_XFLIP
	frame_oam -14, -15, $76, 0 | OAMF_XFLIP
	db $80

Frameset_1dc8fb:
	db   0,  3
	db   1,  3
	db   2,  3
	db   3,  3
	db $ff

Frameset_1dc904:
	db   4,  3
	db   5,  3
	db   6,  3
	db   7,  3
	db $ff

Frameset_1dc90d:
	db   8,  2
	db   9,  2
	db  10,  2
	db  11,  2
	db  10,  4
	db  12,  6
	db  13,  6
	db  14,  6
	db  15,  6
	db  16,  6
	db  17,  6
	db  18,  6
	db $ff

Frameset_1dc926:
	db  19,  2
	db  20,  2
	db  21,  2
	db  22,  2
	db  21,  4
	db  23,  6
	db  24,  6
	db  25,  6
	db  26,  6
	db  27,  6
	db  28,  6
	db  29,  6
	db $ff

OAM_1dc93f:
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
	frame_oam -32, -11, $00, 0
	frame_oam -32,  -3, $02, 0
	frame_oam -32,   5, $04, 0
	frame_oam -16, -16, $06, 0
	frame_oam -16,  -8, $08, 0
	frame_oam -16,   0, $0a, 0
	frame_oam -16,   8, $0c, 0
	db $80

.frame_1
	frame_oam -33, -10, $0e, 0
	frame_oam -33,  -2, $10, 0
	frame_oam -33,   6, $12, 0
	frame_oam -17, -16, $14, 0
	frame_oam -17,  -8, $16, 0
	frame_oam -17,   0, $18, 0
	frame_oam -17,   8, $1a, 0
	db $80

.frame_2
	frame_oam -35, -13, $1c, 0
	frame_oam -35,  -5, $1e, 0
	frame_oam -35,   3, $20, 0
	frame_oam -19, -15, $22, 0
	frame_oam -19,  -7, $24, 0
	frame_oam -19,   1, $26, 0
	frame_oam -19,   9, $28, 0
	db $80

.frame_3
	frame_oam -39, -16, $2a, 0
	frame_oam -39,  -8, $2c, 0
	frame_oam -39,   0, $2e, 0
	frame_oam -39,   8, $30, 0
	frame_oam -23, -16, $32, 0
	frame_oam -23,  -8, $34, 0
	frame_oam -23,   0, $36, 0
	frame_oam -23,   8, $38, 0
	db $80

.frame_4
	frame_oam -39, -16, $3a, 0
	frame_oam -39,  -8, $3c, 0
	frame_oam -39,   0, $3e, 0
	frame_oam -39,   8, $40, 0
	frame_oam -23, -16, $42, 0
	frame_oam -23,  -8, $44, 0
	frame_oam -23,   0, $46, 0
	frame_oam -23,   8, $48, 0
	db $80

.frame_5
	frame_oam -39, -16, $4a, 0
	frame_oam -39,  -8, $4c, 0
	frame_oam -39,   8, $4a, 0 | OAMF_XFLIP
	frame_oam -39,   0, $4c, 0 | OAMF_XFLIP
	frame_oam -23, -16, $4e, 0
	frame_oam -23,  -8, $50, 0
	frame_oam -23,   8, $4e, 0 | OAMF_XFLIP
	frame_oam -23,   0, $50, 0 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -32,   3, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -5, $02, 0 | OAMF_XFLIP
	frame_oam -32, -13, $04, 0 | OAMF_XFLIP
	frame_oam -16,   8, $06, 0 | OAMF_XFLIP
	frame_oam -16,   0, $08, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $0a, 0 | OAMF_XFLIP
	frame_oam -16, -16, $0c, 0 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -33,   2, $0e, 0 | OAMF_XFLIP
	frame_oam -33,  -6, $10, 0 | OAMF_XFLIP
	frame_oam -33, -14, $12, 0 | OAMF_XFLIP
	frame_oam -17,   8, $14, 0 | OAMF_XFLIP
	frame_oam -17,   0, $16, 0 | OAMF_XFLIP
	frame_oam -17,  -8, $18, 0 | OAMF_XFLIP
	frame_oam -17, -16, $1a, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -35,   5, $1c, 0 | OAMF_XFLIP
	frame_oam -35,  -3, $1e, 0 | OAMF_XFLIP
	frame_oam -35, -11, $20, 0 | OAMF_XFLIP
	frame_oam -19,   7, $22, 0 | OAMF_XFLIP
	frame_oam -19,  -1, $24, 0 | OAMF_XFLIP
	frame_oam -19,  -9, $26, 0 | OAMF_XFLIP
	frame_oam -19, -17, $28, 0 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -39,   8, $2a, 0 | OAMF_XFLIP
	frame_oam -39,   0, $2c, 0 | OAMF_XFLIP
	frame_oam -39,  -8, $2e, 0 | OAMF_XFLIP
	frame_oam -39, -16, $30, 0 | OAMF_XFLIP
	frame_oam -23,   8, $32, 0 | OAMF_XFLIP
	frame_oam -23,   0, $34, 0 | OAMF_XFLIP
	frame_oam -23,  -8, $36, 0 | OAMF_XFLIP
	frame_oam -23, -16, $38, 0 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -39,   8, $3a, 0 | OAMF_XFLIP
	frame_oam -39,   0, $3c, 0 | OAMF_XFLIP
	frame_oam -39,  -8, $3e, 0 | OAMF_XFLIP
	frame_oam -39, -16, $40, 0 | OAMF_XFLIP
	frame_oam -23,   8, $42, 0 | OAMF_XFLIP
	frame_oam -23,   0, $44, 0 | OAMF_XFLIP
	frame_oam -23,  -8, $46, 0 | OAMF_XFLIP
	frame_oam -23, -16, $48, 0 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -39, -16, $2a, 0
	frame_oam -39,  -8, $2c, 0
	frame_oam -39,   0, $2e, 0
	frame_oam -39,   8, $30, 0
	frame_oam -23, -16, $32, 0
	frame_oam -23,   0, $36, 0
	frame_oam -23,   8, $38, 0
	frame_oam -23,  -8, $52, 0
	db $80

.frame_12
	frame_oam -39, -16, $2a, 0
	frame_oam -39,  -8, $2c, 0
	frame_oam -39,   0, $2e, 0
	frame_oam -39,   8, $30, 0
	frame_oam -23, -16, $32, 0
	frame_oam -23,   0, $36, 0
	frame_oam -23,   8, $38, 0
	frame_oam -23,  -8, $54, 0
	db $80

.frame_13
	frame_oam -40, -13, $1c, 0
	frame_oam -40,  -5, $1e, 0
	frame_oam -40,   3, $20, 0
	frame_oam -24, -15, $22, 0
	frame_oam -24,   1, $26, 0
	frame_oam -24,   9, $28, 0
	frame_oam -24,  -7, $56, 0
	db $80

.frame_14
	frame_oam -40, -13, $1c, 0
	frame_oam -40,  -5, $1e, 0
	frame_oam -40,   3, $20, 0
	frame_oam -24, -15, $22, 0
	frame_oam -24,  -7, $24, 0
	frame_oam -24,   1, $26, 0
	frame_oam -24,   9, $28, 0
	db $80

.frame_15
	frame_oam -39, -10, $0e, 0
	frame_oam -39,  -2, $10, 0
	frame_oam -39,   6, $12, 0
	frame_oam -23, -16, $14, 0
	frame_oam -23,  -8, $16, 0
	frame_oam -23,   0, $18, 0
	frame_oam -23,   8, $1a, 0
	db $80

.frame_16
	frame_oam -39,   8, $2a, 0 | OAMF_XFLIP
	frame_oam -39,   0, $2c, 0 | OAMF_XFLIP
	frame_oam -39,  -8, $2e, 0 | OAMF_XFLIP
	frame_oam -39, -16, $30, 0 | OAMF_XFLIP
	frame_oam -23,   8, $32, 0 | OAMF_XFLIP
	frame_oam -23,  -8, $36, 0 | OAMF_XFLIP
	frame_oam -23, -16, $38, 0 | OAMF_XFLIP
	frame_oam -23,   0, $52, 0 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -39,   8, $2a, 0 | OAMF_XFLIP
	frame_oam -39,   0, $2c, 0 | OAMF_XFLIP
	frame_oam -39,  -8, $2e, 0 | OAMF_XFLIP
	frame_oam -39, -16, $30, 0 | OAMF_XFLIP
	frame_oam -23,   8, $32, 0 | OAMF_XFLIP
	frame_oam -23,  -8, $36, 0 | OAMF_XFLIP
	frame_oam -23, -16, $38, 0 | OAMF_XFLIP
	frame_oam -23,   0, $54, 0 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -40,   5, $1c, 0 | OAMF_XFLIP
	frame_oam -40,  -3, $1e, 0 | OAMF_XFLIP
	frame_oam -40, -11, $20, 0 | OAMF_XFLIP
	frame_oam -24,   7, $22, 0 | OAMF_XFLIP
	frame_oam -24,  -9, $26, 0 | OAMF_XFLIP
	frame_oam -24, -17, $28, 0 | OAMF_XFLIP
	frame_oam -24,  -1, $56, 0 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -40,   5, $1c, 0 | OAMF_XFLIP
	frame_oam -40,  -3, $1e, 0 | OAMF_XFLIP
	frame_oam -40, -11, $20, 0 | OAMF_XFLIP
	frame_oam -24,   7, $22, 0 | OAMF_XFLIP
	frame_oam -24,  -1, $24, 0 | OAMF_XFLIP
	frame_oam -24,  -9, $26, 0 | OAMF_XFLIP
	frame_oam -24, -17, $28, 0 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -39,   2, $0e, 0 | OAMF_XFLIP
	frame_oam -39,  -6, $10, 0 | OAMF_XFLIP
	frame_oam -39, -14, $12, 0 | OAMF_XFLIP
	frame_oam -23,   8, $14, 0 | OAMF_XFLIP
	frame_oam -23,   0, $16, 0 | OAMF_XFLIP
	frame_oam -23,  -8, $18, 0 | OAMF_XFLIP
	frame_oam -23, -16, $1a, 0 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -39, -16, $2a, 0
	frame_oam -39,  -8, $2c, 0
	frame_oam -39,   0, $2e, 0
	frame_oam -39,   8, $30, 0
	frame_oam -23, -16, $60, 0
	frame_oam -23,  -8, $62, 0
	frame_oam -23,   0, $64, 0
	frame_oam -23,   8, $66, 0
	db $80

.frame_22
	frame_oam -38, -16, $2a, 0
	frame_oam -38,  -8, $2c, 0
	frame_oam -38,   0, $2e, 0
	frame_oam -38,   8, $30, 0
	frame_oam -22, -16, $68, 0
	frame_oam -22,  -8, $6a, 0
	frame_oam -22,   0, $6c, 0
	frame_oam -22,   8, $6e, 0
	db $80

.frame_23
	frame_oam -37, -16, $2a, 0
	frame_oam -37,  -8, $2c, 0
	frame_oam -37,   0, $2e, 0
	frame_oam -37,   8, $30, 0
	frame_oam -21, -16, $70, 0
	frame_oam -21,  -8, $72, 0
	frame_oam -21,   0, $74, 0
	frame_oam -21,   8, $76, 0
	db $80

.frame_24
	frame_oam -39,   8, $2a, 0 | OAMF_XFLIP
	frame_oam -39,   0, $2c, 0 | OAMF_XFLIP
	frame_oam -39,  -8, $2e, 0 | OAMF_XFLIP
	frame_oam -39, -16, $30, 0 | OAMF_XFLIP
	frame_oam -23,   8, $60, 0 | OAMF_XFLIP
	frame_oam -23,   0, $62, 0 | OAMF_XFLIP
	frame_oam -23,  -8, $64, 0 | OAMF_XFLIP
	frame_oam -23, -16, $66, 0 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -38,   8, $2a, 0 | OAMF_XFLIP
	frame_oam -38,   0, $2c, 0 | OAMF_XFLIP
	frame_oam -38,  -8, $2e, 0 | OAMF_XFLIP
	frame_oam -38, -16, $30, 0 | OAMF_XFLIP
	frame_oam -22,   8, $68, 0 | OAMF_XFLIP
	frame_oam -22,   0, $6a, 0 | OAMF_XFLIP
	frame_oam -22,  -8, $6c, 0 | OAMF_XFLIP
	frame_oam -22, -16, $6e, 0 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -37,   8, $2a, 0 | OAMF_XFLIP
	frame_oam -37,   0, $2c, 0 | OAMF_XFLIP
	frame_oam -37,  -8, $2e, 0 | OAMF_XFLIP
	frame_oam -37, -16, $30, 0 | OAMF_XFLIP
	frame_oam -21,   8, $70, 0 | OAMF_XFLIP
	frame_oam -21,   0, $72, 0 | OAMF_XFLIP
	frame_oam -21,  -8, $74, 0 | OAMF_XFLIP
	frame_oam -21, -16, $76, 0 | OAMF_XFLIP
	db $80

Frameset_1dccc0:
	db   0,  8
	db   1,  9
	db   2,  7
	db   3,  7
	db $ff

Frameset_1dccc9:
	db   6,  8
	db   7,  9
	db   8,  7
	db   9,  7
	db $ff

; unreferenced
Frameset_1dccd2:
	db   3,  4
	db $ff

; unreferenced
Frameset_1dccd5:
	db   9,  4
	db $ff

Frameset_1dccd8:
	db   3,  1
	db   4,  3
	db   5,  3
	db  10,  3
	db   9,  1
	db $ff

Frameset_1dcce3:
	db   9,  1
	db  10,  3
	db   5,  3
	db   4,  3
	db   3,  1
	db $ff

Frameset_1dccee:
	db  11,  3
	db  12,  3
	db   3,  1
	db  11,  3
	db  12,  3
	db   3,  1
	db  11,  3
	db  12,  3
	db   3,  1
	db $ff

Frameset_1dcd01:
	db  11,  1
	db  13,  2
	db  11,  1
	db  13,  2
	db  11,  1
	db  13,  1
	db  14,  1
	db  15,  2
	db  13,  1
	db  15,  1
	db  13,  1
	db  15,  6
	db   1, 20
	db   0,  8
	db $ff

Frameset_1dcd1e:
	db  16,  3
	db  17,  3
	db   9,  1
	db  16,  3
	db  17,  3
	db   9,  1
	db  16,  3
	db  17,  3
	db   9,  1
	db $ff

Frameset_1dcd31:
	db  16,  1
	db  18,  2
	db  16,  1
	db  18,  2
	db  16,  1
	db  18,  1
	db  19,  1
	db  20,  2
	db  18,  1
	db  20,  1
	db  18,  1
	db  20,  6
	db   7, 20
	db   6,  8
	db $ff

Frameset_1dcd4e:
	db  21,  7
	db  22,  7
	db  23,  7
	db  22,  7
	db $ff

Frameset_1dcd57:
	db  24,  7
	db  25,  7
	db  26,  7
	db  25,  7
	db $ff

OAM_1dcd60:
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
	frame_oam -32, -16, $00, 0
	frame_oam -32,  -8, $02, 0
	frame_oam -16, -16, $04, 0
	frame_oam -16,  -8, $06, 0
	frame_oam -32,   8, $00, 0 | OAMF_XFLIP
	frame_oam -32,   0, $02, 0 | OAMF_XFLIP
	frame_oam -16,   8, $04, 0 | OAMF_XFLIP
	frame_oam -16,   0, $06, 0 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -32, -16, $08, 0
	frame_oam -32,  -8, $0a, 0
	frame_oam -32,   0, $0c, 0
	frame_oam -32,   8, $0e, 0
	frame_oam -16, -16, $28, 0
	frame_oam -16,  -8, $2a, 0
	frame_oam -16,   0, $2c, 0
	frame_oam -16,   8, $2e, 0
	db $80

.frame_2
	frame_oam -32, -16, $10, 0
	frame_oam -32,  -8, $12, 0
	frame_oam -32,   0, $14, 0
	frame_oam -32,   8, $16, 0
	frame_oam -16, -16, $30, 0
	frame_oam -16,  -8, $32, 0
	frame_oam -16,   0, $34, 0
	frame_oam -16,   8, $36, 0
	db $80

.frame_3
	frame_oam -32, -16, $18, 0
	frame_oam -32,  -8, $1a, 0
	frame_oam -32,   0, $1c, 0
	frame_oam -32,   8, $1e, 0
	frame_oam -16, -16, $38, 0
	frame_oam -16,  -8, $3a, 0
	frame_oam -16,   0, $3c, 0
	frame_oam -16,   8, $3e, 0
	db $80

.frame_4
	frame_oam -32, -16, $20, 0
	frame_oam -32,  -8, $22, 0
	frame_oam -32,   0, $24, 0
	frame_oam -32,   8, $26, 0
	frame_oam -32, -16, $20, 0
	frame_oam -32,  -8, $22, 0
	frame_oam -32,   0, $24, 0
	frame_oam -32,   8, $26, 0
	frame_oam -16, -16, $20, 0 | OAMF_YFLIP
	frame_oam -16,  -8, $22, 0 | OAMF_YFLIP
	frame_oam -16,   0, $24, 0 | OAMF_YFLIP
	frame_oam -16,   8, $26, 0 | OAMF_YFLIP
	db $80

.frame_5
	frame_oam -16, -16, $18, 0 | OAMF_YFLIP
	frame_oam -16,  -8, $1a, 0 | OAMF_YFLIP
	frame_oam -16,   0, $1c, 0 | OAMF_YFLIP
	frame_oam -16,   8, $1e, 0 | OAMF_YFLIP
	frame_oam -32, -16, $38, 0 | OAMF_YFLIP
	frame_oam -32,  -8, $3a, 0 | OAMF_YFLIP
	frame_oam -32,   0, $3c, 0 | OAMF_YFLIP
	frame_oam -32,   8, $3e, 0 | OAMF_YFLIP
	db $80

.frame_6
	frame_oam -16, -16, $10, 0 | OAMF_YFLIP
	frame_oam -16,  -8, $12, 0 | OAMF_YFLIP
	frame_oam -16,   0, $14, 0 | OAMF_YFLIP
	frame_oam -16,   8, $16, 0 | OAMF_YFLIP
	frame_oam -32, -16, $30, 0 | OAMF_YFLIP
	frame_oam -32,  -8, $32, 0 | OAMF_YFLIP
	frame_oam -32,   0, $34, 0 | OAMF_YFLIP
	frame_oam -32,   8, $36, 0 | OAMF_YFLIP
	db $80

.frame_7
	frame_oam -16, -16, $08, 0 | OAMF_YFLIP
	frame_oam -16,  -8, $0a, 0 | OAMF_YFLIP
	frame_oam -16,   0, $0c, 0 | OAMF_YFLIP
	frame_oam -16,   8, $0e, 0 | OAMF_YFLIP
	frame_oam -32, -16, $28, 0 | OAMF_YFLIP
	frame_oam -32,  -8, $2a, 0 | OAMF_YFLIP
	frame_oam -32,   0, $2c, 0 | OAMF_YFLIP
	frame_oam -32,   8, $2e, 0 | OAMF_YFLIP
	db $80

.frame_8
	frame_oam -16, -16, $00, 0 | OAMF_YFLIP
	frame_oam -16,  -8, $02, 0 | OAMF_YFLIP
	frame_oam -32, -16, $04, 0 | OAMF_YFLIP
	frame_oam -32,  -8, $06, 0 | OAMF_YFLIP
	frame_oam -16,   8, $00, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $02, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   8, $04, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   0, $06, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_9
	frame_oam -16,   8, $08, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $0a, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $0c, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -16, $0e, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   8, $28, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   0, $2a, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,  -8, $2c, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32, -16, $2e, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_10
	frame_oam -16,   8, $10, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $12, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $14, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -16, $16, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   8, $30, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   0, $32, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,  -8, $34, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32, -16, $36, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_11
	frame_oam -16,   8, $18, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $1a, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $1c, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -16, $1e, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   8, $38, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   0, $3a, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,  -8, $3c, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32, -16, $3e, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_12
	frame_oam -32,   8, $20, 0 | OAMF_XFLIP
	frame_oam -32,   0, $22, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $24, 0 | OAMF_XFLIP
	frame_oam -32, -16, $26, 0 | OAMF_XFLIP
	frame_oam -32,   8, $20, 0 | OAMF_XFLIP
	frame_oam -32,   0, $22, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $24, 0 | OAMF_XFLIP
	frame_oam -32, -16, $26, 0 | OAMF_XFLIP
	frame_oam -16,   8, $20, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $22, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $24, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -16, $26, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_13
	frame_oam -32,   8, $18, 0 | OAMF_XFLIP
	frame_oam -32,   0, $1a, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $1c, 0 | OAMF_XFLIP
	frame_oam -32, -16, $1e, 0 | OAMF_XFLIP
	frame_oam -16,   8, $38, 0 | OAMF_XFLIP
	frame_oam -16,   0, $3a, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $3c, 0 | OAMF_XFLIP
	frame_oam -16, -16, $3e, 0 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -32,   8, $10, 0 | OAMF_XFLIP
	frame_oam -32,   0, $12, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $14, 0 | OAMF_XFLIP
	frame_oam -32, -16, $16, 0 | OAMF_XFLIP
	frame_oam -16,   8, $30, 0 | OAMF_XFLIP
	frame_oam -16,   0, $32, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $34, 0 | OAMF_XFLIP
	frame_oam -16, -16, $36, 0 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -32,   8, $08, 0 | OAMF_XFLIP
	frame_oam -32,   0, $0a, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $0c, 0 | OAMF_XFLIP
	frame_oam -32, -16, $0e, 0 | OAMF_XFLIP
	frame_oam -16,   8, $28, 0 | OAMF_XFLIP
	frame_oam -16,   0, $2a, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $2c, 0 | OAMF_XFLIP
	frame_oam -16, -16, $2e, 0 | OAMF_XFLIP
	db $80

Frameset_1dcfb0:
	db   0,  4
	db   1,  4
	db   2,  4
	db   3,  4
	db   4,  4
	db   5,  4
	db   6,  4
	db   7,  4
	db   8,  4
	db   9,  4
	db  10,  4
	db  11,  4
	db  12,  4
	db  13,  4
	db  14,  4
	db  15,  4
	db   0,  4
	db  15,  4
	db  14,  4
	db  13,  4
	db  12,  4
	db  11,  4
	db  10,  4
	db   9,  4
	db   8,  4
	db   7,  4
	db   6,  4
	db   5,  4
	db   4,  4
	db   3,  4
	db   2,  4
	db   1,  4
	db $ff

OAM_1dcff1:
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

.frame_0
	frame_oam -32,  -8, $00, 0
	frame_oam -32,   0, $02, 0
	frame_oam -16,  -8, $20, 0
	frame_oam -16,   0, $22, 0
	db $80

.frame_1
	frame_oam -32, -12, $04, 0
	frame_oam -32,  -4, $06, 0
	frame_oam -32,   4, $08, 0
	frame_oam -16, -12, $24, 0
	frame_oam -16,  -4, $26, 0
	frame_oam -16,   4, $28, 0
	db $80

.frame_2
	frame_oam -32, -12, $0a, 0
	frame_oam -32,  -4, $0c, 0
	frame_oam -32,   4, $0e, 0
	frame_oam -16, -12, $2a, 0
	frame_oam -16,  -4, $2c, 0
	frame_oam -16,   4, $2e, 0
	db $80

.frame_3
	frame_oam -16, -12, $10, 0
	frame_oam -16,  -4, $12, 0
	frame_oam -16,   4, $14, 0
	db $80

.frame_4
	frame_oam -16, -16, $30, 0
	frame_oam -16,  -8, $32, 0
	frame_oam -16,   0, $34, 0
	frame_oam -16,   8, $36, 0
	db $80

.frame_5
	frame_oam -16, -16, $16, 0
	frame_oam -16,  -8, $18, 0
	frame_oam -16,   0, $1a, 0
	frame_oam -16,   8, $1c, 0
	db $80

.frame_6
	frame_oam -32,  -5, $38, 0
	frame_oam -32,   3, $3a, 0
	frame_oam -16,  -5, $3c, 0
	frame_oam -16,   3, $3e, 0
	db $80

.frame_7
	frame_oam -32,  -8, $40, 0
	frame_oam -32,   0, $42, 0
	frame_oam -16,  -8, $44, 0
	frame_oam -16,   0, $46, 0
	db $80

.frame_8
	frame_oam -32, -12, $48, 0
	frame_oam -32,  -4, $4a, 0
	frame_oam -16, -12, $4c, 0
	frame_oam -16,  -4, $4e, 0
	frame_oam -16,   4, $50, 0
	frame_oam -32,   4, $48, 0 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -32,   0, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $02, 0 | OAMF_XFLIP
	frame_oam -16,   0, $20, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $22, 0 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -32,   4, $04, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $06, 0 | OAMF_XFLIP
	frame_oam -32, -12, $08, 0 | OAMF_XFLIP
	frame_oam -16,   4, $24, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $26, 0 | OAMF_XFLIP
	frame_oam -16, -12, $28, 0 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -32,   4, $0a, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $0c, 0 | OAMF_XFLIP
	frame_oam -32, -12, $0e, 0 | OAMF_XFLIP
	frame_oam -16,   4, $2a, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $2c, 0 | OAMF_XFLIP
	frame_oam -16, -12, $2e, 0 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -16,   4, $10, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $12, 0 | OAMF_XFLIP
	frame_oam -16, -12, $14, 0 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -16,   8, $30, 0 | OAMF_XFLIP
	frame_oam -16,   0, $32, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $34, 0 | OAMF_XFLIP
	frame_oam -16, -16, $36, 0 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16,   8, $16, 0 | OAMF_XFLIP
	frame_oam -16,   0, $18, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $1a, 0 | OAMF_XFLIP
	frame_oam -16, -16, $1c, 0 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -32,  -3, $38, 0 | OAMF_XFLIP
	frame_oam -32, -11, $3a, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $3c, 0 | OAMF_XFLIP
	frame_oam -16, -11, $3e, 0 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -32,   0, $40, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $42, 0 | OAMF_XFLIP
	frame_oam -16,   0, $44, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $46, 0 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -32, -12, $52, 0
	frame_oam -32,  -4, $54, 0
	frame_oam -32,   4, $0e, 0
	frame_oam -16, -12, $56, 0
	frame_oam -16,  -4, $58, 0
	frame_oam -16,   4, $5a, 0
	db $80

.frame_18
	frame_oam -32,   4, $52, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $54, 0 | OAMF_XFLIP
	frame_oam -32, -12, $0e, 0 | OAMF_XFLIP
	frame_oam -16,   4, $56, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $58, 0 | OAMF_XFLIP
	frame_oam -16, -12, $5a, 0 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -32,   4, $0e, 0
	frame_oam -32, -12, $0e, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $1e, 0
	frame_oam -16, -12, $5c, 0
	frame_oam -16,  -4, $5e, 0
	frame_oam -16,   4, $5c, 0 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -32, -12, $60, 0
	frame_oam -32,  -4, $62, 0
	frame_oam -32,   4, $64, 0
	frame_oam -16, -12, $66, 0
	frame_oam -16,  -4, $68, 0
	frame_oam -16,   4, $6a, 0
	db $80

.frame_21
	frame_oam -32, -12, $6c, 0
	frame_oam -32,  -4, $6e, 0
	frame_oam -32,   4, $70, 0
	frame_oam -16, -12, $72, 0
	frame_oam -16,  -4, $74, 0
	frame_oam -16,   4, $76, 0
	db $80

.frame_22
	frame_oam -32,   4, $60, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $62, 0 | OAMF_XFLIP
	frame_oam -32, -12, $64, 0 | OAMF_XFLIP
	frame_oam -16,   4, $66, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $68, 0 | OAMF_XFLIP
	frame_oam -16, -12, $6a, 0 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -32,   4, $6c, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $6e, 0 | OAMF_XFLIP
	frame_oam -32, -12, $70, 0 | OAMF_XFLIP
	frame_oam -16,   4, $72, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $74, 0 | OAMF_XFLIP
	frame_oam -16, -12, $76, 0 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam  -9, -12, $7c, 0
	frame_oam  -9,  -4, $7e, 0
	frame_oam  -9,   4, $7c, 0 | OAMF_XFLIP
	frame_oam -25, -16, $78, 0
	frame_oam -25,  -8, $7a, 0
	frame_oam -25,   8, $78, 0 | OAMF_XFLIP
	frame_oam -25,   0, $7a, 0 | OAMF_XFLIP
	db $80

Frameset_1dd230:
	db   3,  2
	db   4,  1
	db   5,  3
	db   4,  1
	db   3,  2
	db $ff

; unreferenced
Frameset_1dd23b:
	db   0,  3
	db   1,  2
	db   2,  2
	db   3,  3
	db   2,  2
	db   1,  2
	db   0,  3
	db   1,  2
	db   2,  2
	db   3,  3
	db   2,  2
	db   1,  2
	db   0,  2
	db   1,  1
	db   2,  1
	db   3,  2
	db   2,  1
	db   1,  1
	db   0,  2
	db   1,  1
	db   2,  2
	db   1,  1
	db   2,  2
	db   1,  2
	db $ff

Frameset_1dd26c:
	db   8, 60
	db $ff

; unreferenced
Frameset_1dd26f:
	db   1,  2
	db   0,  2
	db   6,  3
	db   7,  5
	db   1,  2
	db $ff

Frameset_1dd27a:
	db   8,  1
	db  11,  1
	db  18,  2
	db  19,  2
	db  17,  2
	db   2,  1
	db $ff

Frameset_1dd287:
	db   2,  2
	db   8,  3
	db  11,  2
	db $ff

Frameset_1dd28e:
	db  11,  2
	db   8,  3
	db   2,  2
	db $ff

Frameset_1dd295:
	db  12,  2
	db  13,  1
	db  14,  3
	db  13,  1
	db  12,  2
	db $ff

; unreferenced
Frameset_1dd2a0:
	db   9,  3
	db  10,  2
	db  11,  2
	db  12,  3
	db  11,  2
	db  10,  2
	db   9,  3
	db  10,  2
	db  11,  2
	db  12,  3
	db  11,  2
	db  10,  2
	db   9,  2
	db  10,  1
	db  11,  1
	db  12,  2
	db  11,  1
	db  10,  1
	db   9,  2
	db  10,  1
	db  11,  2
	db  10,  1
	db  11,  2
	db  10,  2
	db $ff

Frameset_1dd2d1:
	db  10,  2
	db   9,  2
	db  15,  3
	db  16,  5
	db  10,  2
	db $ff

; unreferenced
Frameset_1dd2dc:
	db   8,  1
	db   2,  1
	db  17,  2
	db  19,  2
	db  18,  2
	db  11,  1
	db $ff

; unreferenced
Frameset_1dd2e9:
	db  20,  7
	db  21,  7
	db $ff

Frameset_1dd2ee:
	db  22,  7
	db  23,  7
	db $ff

Frameset_1dd2f3:
	db   2,  2
	db $ff

Frameset_1dd2f6:
	db  11,  2
	db $ff

; unreferenced
Frameset_1dd2f9:
	db   8,  2
	db  11,  2
	db  18,  3
	db  19,  3
	db  17,  3
	db   2,  2
	db $ff

; unreferenced
Frameset_1dd306:
	db   8,  2
	db   2,  2
	db  17,  3
	db  19,  3
	db  18,  3
	db  11,  2
	db $ff

Frameset_1dd313:
	db  24,  4
	db $ff

Frameset_1dd316:
	db  24,  4
	db   3,  2
	db   4,  2
	db   5,  4
	db   4,  2
	db   3,  2
	db $ff

Frameset_1dd323:
	db  24,  4
	db  12,  2
	db  13,  2
	db  14,  4
	db  13,  2
	db  12,  2
	db $ff
