OAM_184000::
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

.frame_0
	frame_oam -19, -28, $00, 4 | OAMF_BANK1
	frame_oam -19, -20, $02, 4 | OAMF_BANK1
	frame_oam -19, -12, $04, 4 | OAMF_BANK1
	frame_oam  -3, -28, $20, 4 | OAMF_BANK1
	frame_oam  -3, -20, $22, 4 | OAMF_BANK1
	frame_oam  -3, -12, $24, 4 | OAMF_BANK1
	frame_oam -19,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,  -4, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3,   4, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3,  -4, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -19, -28, $00, 4 | OAMF_BANK1
	frame_oam -19, -12, $04, 4 | OAMF_BANK1
	frame_oam  -3, -28, $20, 4 | OAMF_BANK1
	frame_oam  -3, -20, $22, 4 | OAMF_BANK1
	frame_oam  -3, -12, $24, 4 | OAMF_BANK1
	frame_oam -19,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3,   4, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3,  -4, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -20, $06, 4 | OAMF_BANK1
	frame_oam -19,  -4, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -22, -28, $08, 4 | OAMF_BANK1
	frame_oam -22, -20, $0a, 4 | OAMF_BANK1
	frame_oam -22, -12, $0c, 4 | OAMF_BANK1
	frame_oam  -6, -28, $28, 4 | OAMF_BANK1
	frame_oam  -6, -20, $2a, 4 | OAMF_BANK1
	frame_oam  -6, -12, $2c, 4 | OAMF_BANK1
	frame_oam -22,   4, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22,  -4, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -6,   4, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -6,  -4, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -19, -28, $00, 4 | OAMF_BANK1
	frame_oam -19, -12, $04, 4 | OAMF_BANK1
	frame_oam  -3, -28, $20, 4 | OAMF_BANK1
	frame_oam  -3, -20, $22, 4 | OAMF_BANK1
	frame_oam  -3, -12, $24, 4 | OAMF_BANK1
	frame_oam -19,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3,   4, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3,  -4, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -20, $26, 4 | OAMF_BANK1
	frame_oam -19,  -4, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -31, -12, $0c, 4 | OAMF_BANK1
	frame_oam -15, -12, $2c, 4 | OAMF_BANK1
	frame_oam -31, -28, $0e, 4 | OAMF_BANK1
	frame_oam -31, -20, $10, 4 | OAMF_BANK1
	frame_oam -15, -28, $2e, 4 | OAMF_BANK1
	frame_oam -15, -20, $30, 4 | OAMF_BANK1
	frame_oam -31,   4, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -4, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   4, $2e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -4, $30, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -32, -28, $12, 4 | OAMF_BANK1
	frame_oam -32, -20, $14, 4 | OAMF_BANK1
	frame_oam -32, -12, $16, 4 | OAMF_BANK1
	frame_oam -16, -28, $32, 4 | OAMF_BANK1
	frame_oam -16, -20, $34, 4 | OAMF_BANK1
	frame_oam -16, -12, $36, 4 | OAMF_BANK1
	frame_oam -32,   4, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $32, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -4, $14, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -32, -28, $12, 4 | OAMF_BANK1
	frame_oam -16, -28, $32, 4 | OAMF_BANK1
	frame_oam -32,   4, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $32, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -20, $18, 4 | OAMF_BANK1
	frame_oam -16, -20, $38, 4 | OAMF_BANK1
	frame_oam -16, -12, $3a, 4 | OAMF_BANK1
	frame_oam -32,  -4, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $38, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $16, 4 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -32, -28, $12, 4 | OAMF_BANK1
	frame_oam -16, -28, $32, 4 | OAMF_BANK1
	frame_oam -32,   4, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $32, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -20, $1c, 4 | OAMF_BANK1
	frame_oam -32, -12, $1e, 4 | OAMF_BANK1
	frame_oam -16, -20, $3c, 4 | OAMF_BANK1
	frame_oam -16, -12, $3e, 4 | OAMF_BANK1
	frame_oam -32,  -4, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -23, -28, $00, 4 | OAMF_BANK1
	frame_oam -23, -12, $04, 4 | OAMF_BANK1
	frame_oam  -7, -28, $20, 4 | OAMF_BANK1
	frame_oam  -7, -20, $22, 4 | OAMF_BANK1
	frame_oam  -7, -12, $24, 4 | OAMF_BANK1
	frame_oam -23,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,   4, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,  -4, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23, -20, $06, 4 | OAMF_BANK1
	frame_oam -23,  -4, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -26, -28, $00, 4 | OAMF_BANK1
	frame_oam -26, -12, $04, 4 | OAMF_BANK1
	frame_oam -10, -28, $20, 4 | OAMF_BANK1
	frame_oam -10, -20, $22, 4 | OAMF_BANK1
	frame_oam -10, -12, $24, 4 | OAMF_BANK1
	frame_oam -26,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,   4, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  -4, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26, -20, $06, 4 | OAMF_BANK1
	frame_oam -26,  -4, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -30, -28, $08, 4 | OAMF_BANK1
	frame_oam -30, -20, $0a, 4 | OAMF_BANK1
	frame_oam -30, -12, $0c, 4 | OAMF_BANK1
	frame_oam -14, -28, $28, 4 | OAMF_BANK1
	frame_oam -14, -20, $2a, 4 | OAMF_BANK1
	frame_oam -14, -12, $2c, 4 | OAMF_BANK1
	frame_oam -30,   4, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30,  -4, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,   4, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,  -4, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -32, -28, $12, 4 | OAMF_BANK1
	frame_oam -32, -12, $16, 4 | OAMF_BANK1
	frame_oam -16, -28, $32, 4 | OAMF_BANK1
	frame_oam -16, -20, $34, 4 | OAMF_BANK1
	frame_oam -16, -12, $36, 4 | OAMF_BANK1
	frame_oam -32,   4, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $32, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -20, $18, 4 | OAMF_BANK1
	frame_oam -32,  -4, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -32, -28, $12, 4 | OAMF_BANK1
	frame_oam -32, -12, $16, 4 | OAMF_BANK1
	frame_oam -16, -28, $32, 4 | OAMF_BANK1
	frame_oam -16, -20, $34, 4 | OAMF_BANK1
	frame_oam -16, -12, $36, 4 | OAMF_BANK1
	frame_oam -32,   4, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $32, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -20, $1a, 4 | OAMF_BANK1
	frame_oam -32,  -4, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_18422f::
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

.frame_0
	frame_oam -16,   4, $64, 5 | OAMF_BANK1
	frame_oam -16,  -4, $62, 5 | OAMF_BANK1
	frame_oam -16, -12, $60, 5 | OAMF_BANK1
	frame_oam -32,   4, $44, 5 | OAMF_BANK1
	frame_oam -32,  -4, $42, 5 | OAMF_BANK1
	frame_oam -32, -12, $40, 5 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,   4, $6a, 5 | OAMF_BANK1
	frame_oam -16,  -4, $68, 5 | OAMF_BANK1
	frame_oam -16, -12, $66, 5 | OAMF_BANK1
	frame_oam -32,   4, $4a, 5 | OAMF_BANK1
	frame_oam -32,  -4, $48, 5 | OAMF_BANK1
	frame_oam -32, -12, $46, 5 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16, -12, $64, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $62, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $60, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $44, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -4, $42, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   4, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -16, -12, $6a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $68, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $66, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $4a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -4, $48, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   4, $46, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -16,   4, $70, 5 | OAMF_BANK1
	frame_oam -16,  -4, $6e, 5 | OAMF_BANK1
	frame_oam -16, -12, $6c, 5 | OAMF_BANK1
	frame_oam -32,   4, $50, 5 | OAMF_BANK1
	frame_oam -32,  -4, $4e, 5 | OAMF_BANK1
	frame_oam -32, -12, $4c, 5 | OAMF_BANK1
	frame_oam -32, -20, $72, 5 | OAMF_BANK1
	frame_oam -32, -28, $52, 5 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16, -12, $70, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $6e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $6c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $50, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -4, $4e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   4, $4c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  20, $52, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  12, $72, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -16, -12, $66, 5 | OAMF_BANK1
	frame_oam -16,  -4, $68, 5 | OAMF_BANK1
	frame_oam -16,   4, $6a, 5 | OAMF_BANK1
	frame_oam -32, -12, $7a, 5 | OAMF_BANK1
	frame_oam -32,  -4, $7c, 5 | OAMF_BANK1
	frame_oam -32,   4, $7e, 5 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16,   4, $66, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $68, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $6a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   4, $7a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -4, $7c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $7e, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -16, -12, $66, 5 | OAMF_BANK1
	frame_oam -16,  -4, $68, 5 | OAMF_BANK1
	frame_oam -16,   4, $6a, 5 | OAMF_BANK1
	frame_oam -32,   4, $7e, 5 | OAMF_BANK1
	frame_oam -32, -12, $5c, 5 | OAMF_BANK1
	frame_oam -32,  -4, $5e, 5 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -16,   4, $66, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $68, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $6a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $7e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   4, $5c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -4, $5e, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -26, -12, $66, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -26,  -4, $68, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -26,   4, $6a, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -10, -12, $7a, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -10,  -4, $7c, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -10,   4, $7e, 5 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_11
	frame_oam -26,   4, $66, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -26,  -4, $68, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -26, -12, $6a, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -10,   4, $7a, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -10,  -4, $7c, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -10, -12, $7e, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_12
	frame_oam -26, -12, $66, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -26,  -4, $68, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -26,   4, $6a, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -10,   4, $7e, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -10, -12, $5c, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -10,  -4, $5e, 5 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_13
	frame_oam -26,   4, $66, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -26,  -4, $68, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -26, -12, $6a, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -10, -12, $7e, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -10,   4, $5c, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -10,  -4, $5e, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_14
	frame_oam -16,   4, $70, 5 | OAMF_BANK1
	frame_oam -32,   4, $50, 5 | OAMF_BANK1
	frame_oam -32, -12, $58, 5 | OAMF_BANK1
	frame_oam -32,  -4, $5a, 5 | OAMF_BANK1
	frame_oam -16, -12, $78, 5 | OAMF_BANK1
	frame_oam -16,  -4, $6e, 5 | OAMF_BANK1
	db $80

.frame_15
	frame_oam -16, -12, $70, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $50, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   4, $58, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -4, $5a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $78, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $6e, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -32, -12, $54, 5 | OAMF_BANK1
	frame_oam -32,  -4, $56, 5 | OAMF_BANK1
	frame_oam -16, -12, $74, 5 | OAMF_BANK1
	frame_oam -16,  -4, $76, 5 | OAMF_BANK1
	frame_oam -32,   4, $54, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $74, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_18440a::
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
	frame_oam -16,   0, $82, 6 | OAMF_BANK1
	frame_oam -16,  -8, $80, 6 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,   0, $86, 6 | OAMF_BANK1
	frame_oam -16,  -8, $84, 6 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,   0, $8a, 6 | OAMF_BANK1
	frame_oam -16,  -8, $88, 6 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,  -7, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -16,  -7, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16,  -7, $8a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $88, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -16,   0, $82, 6 | OAMF_BANK1
	frame_oam -16,  -8, $8c, 6 | OAMF_BANK1
	frame_oam -16, -15, $92, 6 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16,   0, $86, 6 | OAMF_BANK1
	frame_oam -16,  -8, $8e, 6 | OAMF_BANK1
	frame_oam -16, -16, $92, 6 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -16,   0, $8a, 6 | OAMF_BANK1
	frame_oam -16,  -8, $90, 6 | OAMF_BANK1
	frame_oam -16, -16, $92, 6 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -16,  -7, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $92, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -16,  -7, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $8e, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   9, $92, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -16,  -7, $8a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $90, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   9, $92, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -16,   0, $9c, 6 | OAMF_BANK1
	frame_oam -16,  -8, $9a, 6 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -16,  -7, $9c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $9a, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -15,   0, $a2, 6 | OAMF_BANK1
	frame_oam -15,  -8, $a0, 6 | OAMF_BANK1
	db $80

.frame_15
	frame_oam -15,   0, $a6, 6 | OAMF_BANK1
	frame_oam -15,  -8, $a4, 6 | OAMF_BANK1
	db $80

.frame_16
	frame_oam -15,  -8, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   0, $a0, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -15,  -8, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   0, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -16,  -8, $ae, 6 | OAMF_BANK1
	frame_oam -16,   0, $b0, 6 | OAMF_BANK1
	db $80

.frame_19
	frame_oam -16,   1, $ae, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $b0, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -16,  -8, $96, 6 | OAMF_BANK1
	frame_oam -16,   0, $98, 6 | OAMF_BANK1
	db $80

.frame_21
	frame_oam -17, -11, $b2, 6 | OAMF_BANK1
	frame_oam -17,   4, $b2, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,  -3, $94, 6 | OAMF_BANK1
	db $80

.frame_22
	frame_oam -16,   1, $96, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $98, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -15, -13, $a8, 6 | OAMF_BANK1
	frame_oam -23,  -5, $aa, 6 | OAMF_BANK1
	frame_oam  -7,  -5, $ac, 6 | OAMF_BANK1
	frame_oam -15,   0, $9e, 6 | OAMF_BANK1
	db $80

.frame_24
	frame_oam -15, -13, $a8, 6 | OAMF_BANK1
	frame_oam -23,  -5, $aa, 6 | OAMF_BANK1
	frame_oam  -7,  -5, $ac, 6 | OAMF_BANK1
	frame_oam -15,   3, $9e, 6 | OAMF_BANK1
	db $80

.frame_25
	frame_oam -15,   5, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,  -3, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,  -3, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -8, $9e, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -15,   5, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,  -3, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,  -3, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -11, $9e, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -16, -11, $b2, 6 | OAMF_BANK1
	frame_oam -16,  -3, $b4, 6 | OAMF_BANK1
	frame_oam -16,   4, $b2, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam -16,  -8, $b6, 6 | OAMF_BANK1
	frame_oam -16,   0, $b8, 6 | OAMF_BANK1
	db $80

.frame_29
	frame_oam -16,   1, $b6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $b8, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_30
	frame_oam -15,  -8, $ba, 6 | OAMF_BANK1
	frame_oam -15,   0, $bc, 6 | OAMF_BANK1
	db $80

.frame_31
	frame_oam -15,   0, $ba, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -8, $bc, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_1845aa::
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
	frame_oam -16,   0, $c2, 7 | OAMF_BANK1
	frame_oam -16,  -8, $c0, 7 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,   0, $c6, 7 | OAMF_BANK1
	frame_oam -16,  -8, $c4, 7 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,   0, $ca, 7 | OAMF_BANK1
	frame_oam -16,  -8, $c8, 7 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,  -7, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -16,  -7, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16,  -7, $ca, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $c8, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -15,   0, $e2, 7 | OAMF_BANK1
	frame_oam -15,  -8, $e0, 7 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -15,   0, $e6, 7 | OAMF_BANK1
	frame_oam -15,  -8, $e4, 7 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -15,  -8, $e2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   0, $e0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -15,  -8, $e6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   0, $e4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -16,  -8, $ee, 7 | OAMF_BANK1
	frame_oam -16,   0, $f0, 7 | OAMF_BANK1
	db $80

.frame_11
	frame_oam -16,   0, $dc, 7 | OAMF_BANK1
	frame_oam -16,  -8, $da, 7 | OAMF_BANK1
	db $80

.frame_12
	frame_oam -16,   1, $ee, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $f0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -16,  -7, $dc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $da, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16,  -4, $d4, 7 | OAMF_BANK1
	db $80

.frame_15
	frame_oam -16,  -4, $d2, 7 | OAMF_BANK1
	db $80

.frame_16
	frame_oam -16,  -4, $d4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -16,  -4, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam  -8,  -4, $d6, 7 | OAMF_BANK1
	frame_oam -24,  -4, $d6, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_19
	frame_oam  -8,  -4, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -4, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_20
	frame_oam -15, -12, $e8, 7 | OAMF_BANK1
	frame_oam -23,  -4, $ea, 7 | OAMF_BANK1
	frame_oam  -7,  -4, $ec, 7 | OAMF_BANK1
	frame_oam -15,   1, $de, 7 | OAMF_BANK1
	db $80

.frame_21
	frame_oam -15, -12, $e8, 7 | OAMF_BANK1
	frame_oam -23,  -4, $ea, 7 | OAMF_BANK1
	frame_oam  -7,  -4, $ec, 7 | OAMF_BANK1
	frame_oam -15,   4, $de, 7 | OAMF_BANK1
	db $80

.frame_22
	frame_oam -15,   4, $e8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,  -4, $ea, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,  -4, $ec, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -9, $de, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -15,   4, $e8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,  -4, $ea, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,  -4, $ec, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -12, $de, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -16, -11, $f2, 7 | OAMF_BANK1
	frame_oam -16,  -3, $f4, 7 | OAMF_BANK1
	frame_oam -16,   4, $f2, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -16,  -8, $f6, 7 | OAMF_BANK1
	frame_oam -16,   0, $f8, 7 | OAMF_BANK1
	db $80

.frame_26
	frame_oam -16,   1, $f6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $f8, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -16,   0, $dc, 7 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 7 | OAMF_BANK1
	db $80

.frame_28
	frame_oam -16,  -8, $ce, 7 | OAMF_BANK1
	frame_oam -16,   0, $d0, 7 | OAMF_BANK1
	db $80

.frame_29
	frame_oam -16,  -7, $dc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_30
	frame_oam -16,   1, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_31
	frame_oam -15,  -8, $fa, 7 | OAMF_BANK1
	frame_oam -15,   0, $fc, 7 | OAMF_BANK1
	db $80

.frame_32
	frame_oam -15,   0, $fa, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -8, $fc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_33
	frame_oam  -8,  -4, $d8, 7 | OAMF_BANK1
	frame_oam -24,  -4, $d8, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_34
	frame_oam  -8,  -4, $fe, 7 | OAMF_BANK1
	frame_oam -24,  -4, $fe, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_35
	frame_oam  -8,  -4, $d8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -4, $d8, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_36
	frame_oam  -8,  -4, $fe, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -4, $fe, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

OAM_184755::
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

.frame_0
	frame_oam -16,   0, $c2, 7 | OAMF_BANK1
	frame_oam -16,  -8, $c0, 7 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,   0, $c6, 7 | OAMF_BANK1
	frame_oam -16,  -8, $c4, 7 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,   0, $ca, 7 | OAMF_BANK1
	frame_oam -16,  -8, $c8, 7 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,  -7, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -16,  -7, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16,  -7, $ca, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $c8, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -15, -13, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -21, $d6, 7 | OAMF_BANK1
	frame_oam -16,   0, $c2, 7 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 7 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16, -13, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -21, $d6, 7 | OAMF_BANK1
	frame_oam -16,   0, $c6, 7 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 7 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -19, -13, $d8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -21, $d8, 7 | OAMF_BANK1
	frame_oam -16,   0, $ca, 7 | OAMF_BANK1
	frame_oam -16,  -8, $d0, 7 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -15,   6, $d6, 7 | OAMF_BANK1
	frame_oam -15,  14, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -16,  14, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   6, $d6, 7 | OAMF_BANK1
	frame_oam -16,  -7, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -19,   6, $d8, 7 | OAMF_BANK1
	frame_oam -19,  14, $d8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $ca, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -16,   0, $dc, 7 | OAMF_BANK1
	frame_oam -16,  -8, $da, 7 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -16,  -7, $dc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $da, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -15,   0, $e2, 7 | OAMF_BANK1
	frame_oam -15,  -8, $e0, 7 | OAMF_BANK1
	db $80

.frame_15
	frame_oam -15,   0, $e6, 7 | OAMF_BANK1
	frame_oam -15,  -8, $e4, 7 | OAMF_BANK1
	db $80

.frame_16
	frame_oam -15,  -8, $e2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   0, $e0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -15,  -8, $e6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   0, $e4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -16,  -8, $ee, 7 | OAMF_BANK1
	frame_oam -16,   0, $f0, 7 | OAMF_BANK1
	db $80

.frame_19
	frame_oam -16,   1, $ee, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $f0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -16,   0, $c2, 7 | OAMF_BANK1
	frame_oam -16, -14, $d2, 7 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 7 | OAMF_BANK1
	db $80

.frame_21
	frame_oam -16, -14, $d4, 7 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 7 | OAMF_BANK1
	frame_oam -16,   0, $c6, 7 | OAMF_BANK1
	db $80

.frame_22
	frame_oam -16, -14, $d4, 7 | OAMF_BANK1
	frame_oam -16,   0, $ca, 7 | OAMF_BANK1
	frame_oam -16,  -8, $d0, 7 | OAMF_BANK1
	db $80

.frame_23
	frame_oam -16,   7, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -16,   7, $d4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -16,   7, $d4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $ca, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -15,  -8, $fa, 7 | OAMF_BANK1
	frame_oam -15,   0, $fc, 7 | OAMF_BANK1
	db $80

.frame_27
	frame_oam -15,   0, $fa, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -8, $fc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam -15, -11, $e8, 7 | OAMF_BANK1
	frame_oam -15,  -3, $ea, 7 | OAMF_BANK1
	frame_oam -15,   5, $ec, 7 | OAMF_BANK1
	db $80

.frame_29
	frame_oam -15,   3, $e8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -5, $ea, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -13, $ec, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_30
	frame_oam -16, -11, $f2, 7 | OAMF_BANK1
	frame_oam -16,  -3, $f4, 7 | OAMF_BANK1
	frame_oam -16,   4, $f2, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_31
	frame_oam -19,  -7, $d8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -15, $d8, 7 | OAMF_BANK1
	frame_oam -16,   0, $c6, 7 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 7 | OAMF_BANK1
	db $80

.frame_32
	frame_oam -16,  -3, $fe, 7 | OAMF_BANK1
	frame_oam -16, -11, $de, 7 | OAMF_BANK1
	frame_oam -16,   4, $de, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_33
	frame_oam -19,   0, $d8, 7 | OAMF_BANK1
	frame_oam -19,   8, $d8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_34
	frame_oam -16,  -8, $f6, 7 | OAMF_BANK1
	frame_oam -16,   0, $f8, 7 | OAMF_BANK1
	db $80

.frame_35
	frame_oam -16,   1, $f6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $f8, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_36
	frame_oam -18, -21, $d8, 7 | OAMF_BANK1
	frame_oam -18, -13, $d8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $c2, 7 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 7 | OAMF_BANK1
	db $80

.frame_37
	frame_oam -18,  14, $d8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18,   6, $d8, 7 | OAMF_BANK1
	frame_oam -16,  -7, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_18496f::
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

.frame_0
	frame_oam -23,  -8, $c0, 7 | OAMF_BANK1
	frame_oam -23,   0, $c2, 7 | OAMF_BANK1
	frame_oam  -7,  -8, $e0, 7 | OAMF_BANK1
	frame_oam  -7,   0, $e2, 7 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -23,  -8, $c4, 7 | OAMF_BANK1
	frame_oam -23,   0, $c6, 7 | OAMF_BANK1
	frame_oam  -7,  -8, $e4, 7 | OAMF_BANK1
	frame_oam  -7,   0, $e6, 7 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -23,  -8, $c8, 7 | OAMF_BANK1
	frame_oam -23,   0, $ca, 7 | OAMF_BANK1
	frame_oam  -7,  -8, $e8, 7 | OAMF_BANK1
	frame_oam  -7,   0, $ea, 7 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -23,   0, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,  -8, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,   0, $e0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,  -8, $e2, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -23,   0, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,  -8, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,   0, $e4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,  -8, $e6, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -23,   0, $c8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,  -8, $ca, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,   0, $e8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,  -8, $ea, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -23,  -8, $cc, 7 | OAMF_BANK1
	frame_oam  -7,  -8, $ec, 7 | OAMF_BANK1
	frame_oam -23,  -1, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,  -1, $ec, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -23,  -8, $ce, 7 | OAMF_BANK1
	frame_oam  -7,  -8, $ee, 7 | OAMF_BANK1
	frame_oam -23,  -1, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,  -1, $ee, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -34,  -8, $fc, 7 | OAMF_BANK1
	frame_oam -34,  -1, $fc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18, -12, $d0, 7 | OAMF_BANK1
	frame_oam -18,  -4, $d2, 7 | OAMF_BANK1
	frame_oam -18,   3, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -23,  -8, $d4, 7 | OAMF_BANK1
	frame_oam  -7,  -8, $f4, 7 | OAMF_BANK1
	frame_oam -23,  -1, $d4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,  -1, $f4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -23,  -8, $d4, 7 | OAMF_BANK1
	frame_oam -23,  -1, $d4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,  -1, $f6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,  -8, $f6, 7 | OAMF_BANK1
	db $80

.frame_11
	frame_oam -23,  -8, $d6, 7 | OAMF_BANK1
	frame_oam -23,  -1, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,  -8, $f4, 7 | OAMF_BANK1
	frame_oam  -7,  -1, $f4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -23,  -8, $d6, 7 | OAMF_BANK1
	frame_oam -23,  -1, $d6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,  -8, $f6, 7 | OAMF_BANK1
	frame_oam  -7,  -1, $f6, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -23, -12, $d8, 7 | OAMF_BANK1
	frame_oam -23,  -4, $da, 7 | OAMF_BANK1
	frame_oam  -7, -12, $f8, 7 | OAMF_BANK1
	frame_oam  -7,  -4, $fa, 7 | OAMF_BANK1
	frame_oam -23,   3, $d8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -7,   3, $f8, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16,  -8, $dc, 7 | OAMF_BANK1
	frame_oam -16,  -1, $dc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -16,  -8, $de, 7 | OAMF_BANK1
	frame_oam -16,  -1, $de, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -34,  -8, $fe, 7 | OAMF_BANK1
	frame_oam -34,  -1, $fe, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18, -12, $f0, 7 | OAMF_BANK1
	frame_oam -18,  -4, $f2, 7 | OAMF_BANK1
	frame_oam -18,   3, $f0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_184ab2::
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

.frame_0
	frame_oam -32,  -8, $08, 4 | OAMF_BANK1
	frame_oam -32,   0, $0a, 4 | OAMF_BANK1
	frame_oam -16,  -8, $28, 4 | OAMF_BANK1
	frame_oam -16,   0, $2a, 4 | OAMF_BANK1
	frame_oam -25, -16, $24, 2 | OAMF_BANK1
	frame_oam -25, -21, $00, 2 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -32,  -8, $0c, 4 | OAMF_BANK1
	frame_oam -32,   0, $0e, 4 | OAMF_BANK1
	frame_oam -16,  -8, $2c, 4 | OAMF_BANK1
	frame_oam -16,   0, $2e, 4 | OAMF_BANK1
	frame_oam -24, -16, $24, 2 | OAMF_BANK1
	frame_oam -24, -21, $00, 2 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,  -8, $20, 4 | OAMF_BANK1
	frame_oam -16,   0, $22, 4 | OAMF_BANK1
	frame_oam -32,  -8, $0c, 4 | OAMF_BANK1
	frame_oam -32,   0, $0e, 4 | OAMF_BANK1
	frame_oam -24, -16, $24, 2 | OAMF_BANK1
	frame_oam -24, -21, $00, 2 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -32,   1, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -7, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -25,   9, $24, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -25,  14, $00, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -32,   1, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -7, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $2c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $2e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,   9, $24, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  14, $00, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16,   1, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   1, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -7, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,   9, $24, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  14, $00, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -16,  -8, $34, 4 | OAMF_BANK1
	frame_oam -16,   0, $36, 4 | OAMF_BANK1
	frame_oam -31,  -8, $18, 4 | OAMF_BANK1
	frame_oam -31,   0, $1a, 4 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16,   0, $2a, 4 | OAMF_BANK1
	frame_oam -16,  -8, $10, 4 | OAMF_BANK1
	frame_oam -32,  -7, $0c, 4 | OAMF_BANK1
	frame_oam -32,   1, $0e, 4 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -16,   1, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $36, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,   1, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -7, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -16,  -7, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -32,  -8, $08, 4 | OAMF_BANK1
	frame_oam -32,   0, $0a, 4 | OAMF_BANK1
	frame_oam -16,   0, $2a, 4 | OAMF_BANK1
	frame_oam -16,  -8, $10, 4 | OAMF_BANK1
	db $80

.frame_11
	frame_oam -32,  -8, $0c, 4 | OAMF_BANK1
	frame_oam -32,   0, $0e, 4 | OAMF_BANK1
	frame_oam -16,   0, $2e, 4 | OAMF_BANK1
	frame_oam -16,  -8, $12, 4 | OAMF_BANK1
	db $80

.frame_12
	frame_oam -32,  -8, $0c, 4 | OAMF_BANK1
	frame_oam -32,   0, $0e, 4 | OAMF_BANK1
	frame_oam -16,   0, $22, 4 | OAMF_BANK1
	frame_oam -16,  -8, $3c, 4 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -32,   1, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -7, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -32,   1, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -7, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $2e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -32,   1, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -7, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -30,  -8, $18, 4 | OAMF_BANK1
	frame_oam -30,   0, $1a, 4 | OAMF_BANK1
	frame_oam -14,  -8, $38, 4 | OAMF_BANK1
	frame_oam -14,   0, $3a, 4 | OAMF_BANK1
	db $80

.frame_17
	frame_oam -29,   0, $1a, 4 | OAMF_BANK1
	frame_oam -14,  -8, $1c, 4 | OAMF_BANK1
	frame_oam -14,   0, $1e, 4 | OAMF_BANK1
	frame_oam -29,  -8, $18, 4 | OAMF_BANK1
	db $80

.frame_18
	frame_oam -30,   1, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30,  -7, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,   1, $38, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,  -7, $3a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -14,   1, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,  -7, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   1, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -7, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -32,   0, $16, 4 | OAMF_BANK1
	frame_oam -32,  -8, $02, 4 | OAMF_BANK1
	frame_oam -29, -16, $00, 2 | OAMF_BANK1
	frame_oam -16,  -8, $34, 4 | OAMF_BANK1
	frame_oam -16,   0, $36, 4 | OAMF_BANK1
	db $80

.frame_21
	frame_oam -32,  -7, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   1, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   9, $00, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $36, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -16,  -8, $34, 4 | OAMF_BANK1
	frame_oam -16,   0, $36, 4 | OAMF_BANK1
	frame_oam -32,  -8, $18, 4 | OAMF_BANK1
	frame_oam -32,   0, $1a, 4 | OAMF_BANK1
	db $80

.frame_23
	frame_oam -16,   1, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $36, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   1, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -7, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -32,  -8, $04, 2 | OAMF_BANK1
	frame_oam -32,   0, $04, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $06, 4 | OAMF_BANK1
	frame_oam -16,   0, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -32,  -8, $3e, 4 | OAMF_BANK1
	frame_oam -32,   0, $3e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $06, 4 | OAMF_BANK1
	frame_oam -16,   0, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -16,  -6, $00, 2 | OAMF_BANK1
	frame_oam -16,  -2, $00, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -16, -16, $26, 4 | OAMF_BANK1
	frame_oam -16,  -8, $28, 4 | OAMF_BANK1
	frame_oam -16,   0, $2a, 4 | OAMF_BANK1
	frame_oam -32,  -8, $14, 4 | OAMF_BANK1
	frame_oam -32,   0, $16, 4 | OAMF_BANK1
	db $80

.frame_28
	frame_oam -16,   9, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   1, $14, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -7, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_29
	frame_oam -16, -16, $26, 4 | OAMF_BANK1
	frame_oam -16,  -8, $28, 4 | OAMF_BANK1
	frame_oam -16,   0, $2a, 4 | OAMF_BANK1
	frame_oam -32,  -7, $0c, 4 | OAMF_BANK1
	frame_oam -32,   1, $0e, 4 | OAMF_BANK1
	db $80

.frame_30
	frame_oam -16,   9, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   1, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -7, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_31
	frame_oam -44,  -4, $30, 4 | OAMF_BANK1
	db $80

.frame_32
	frame_oam -44,  -6, $30, 4 | OAMF_BANK1
	db $80

.frame_33
	frame_oam -45,  -7, $30, 4 | OAMF_BANK1
	db $80

.frame_34
	frame_oam -44,  -2, $30, 4 | OAMF_BANK1
	db $80

.frame_35
	frame_oam -45,  -1, $30, 4 | OAMF_BANK1
	db $80

.frame_36
	frame_oam -44,  -6, $30, 4 | OAMF_BANK1
	frame_oam -25,  -4, $32, 4 | OAMF_BANK1
	frame_oam   9,  -4, $32, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_37
	frame_oam -44,  -6, $30, 4 | OAMF_BANK1
	frame_oam -24,  -4, $32, 4 | OAMF_BANK1
	frame_oam   8,  -4, $32, 4 | OAMF_BANK1
	frame_oam  -8,  -4, $32, 4 | OAMF_BANK1
	db $80

.frame_38
	frame_oam -44,  -4, $30, 4 | OAMF_BANK1
	frame_oam -24,  -4, $32, 4 | OAMF_BANK1
	frame_oam  -8,  -4, $32, 4 | OAMF_BANK1
	frame_oam   8,  -4, $32, 4 | OAMF_BANK1
	db $80

.frame_39
	frame_oam -44,  -2, $30, 4 | OAMF_BANK1
	frame_oam -24,  -4, $32, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   8,  -4, $32, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -4, $32, 4 | OAMF_BANK1
	db $80

.frame_40
	frame_oam -44,  -2, $30, 4 | OAMF_BANK1
	frame_oam -25,  -4, $32, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   9,  -4, $32, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

OAM_184db9::
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

.frame_0
	frame_oam -19,   3, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3,  -1, $44, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3,  -8, $44, 5 | OAMF_BANK1
	frame_oam -19,  -4, $42, 5 | OAMF_BANK1
	frame_oam -19, -12, $40, 5 | OAMF_BANK1
	db $80

.frame_1
	frame_oam  -3,   0, $4e, 5 | OAMF_BANK1
	frame_oam  -3,  -9, $4c, 5 | OAMF_BANK1
	frame_oam -19,   4, $4a, 5 | OAMF_BANK1
	frame_oam -19,  -4, $48, 5 | OAMF_BANK1
	frame_oam -19, -12, $46, 5 | OAMF_BANK1
	db $80

.frame_2
	frame_oam  -2,  -6, $56, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2, -13, $56, 5 | OAMF_BANK1
	frame_oam -18,   4, $54, 5 | OAMF_BANK1
	frame_oam -18,  -4, $52, 5 | OAMF_BANK1
	frame_oam -18, -12, $50, 5 | OAMF_BANK1
	db $80

.frame_3
	frame_oam  -3,  -9, $4e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3,   0, $4c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -13, $4a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,  -5, $48, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,   3, $46, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam  -2,  -3, $56, 5 | OAMF_BANK1
	frame_oam  -2,   4, $56, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18, -13, $54, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18,  -5, $52, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18,   3, $50, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam  -1,  -8, $60, 5 | OAMF_BANK1
	frame_oam -17,   3, $58, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,  -4, $5a, 5 | OAMF_BANK1
	frame_oam -17, -12, $58, 5 | OAMF_BANK1
	db $80

.frame_6
	frame_oam  -2,  -8, $60, 5 | OAMF_BANK1
	frame_oam -17,   3, $5c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,  -4, $5e, 5 | OAMF_BANK1
	frame_oam -17, -12, $5c, 5 | OAMF_BANK1
	db $80

.frame_7
	frame_oam  -1,  -1, $60, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17, -12, $58, 5 | OAMF_BANK1
	frame_oam -17,  -5, $5a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,   3, $58, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam  -2,  -1, $60, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17, -12, $5c, 5 | OAMF_BANK1
	frame_oam -17,  -5, $5e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,   3, $5c, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -31,  -1, $66, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -8, $66, 5 | OAMF_BANK1
	frame_oam -15,   3, $62, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -4, $64, 5 | OAMF_BANK1
	frame_oam -15, -12, $62, 5 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -31,  -1, $6c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -8, $6c, 5 | OAMF_BANK1
	frame_oam -15,   3, $68, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -4, $6a, 5 | OAMF_BANK1
	frame_oam -15, -12, $68, 5 | OAMF_BANK1
	db $80

.frame_11
	frame_oam  -2,  -1, $72, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2,  -8, $72, 5 | OAMF_BANK1
	frame_oam -18,   3, $6e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18,  -4, $70, 5 | OAMF_BANK1
	frame_oam -18, -12, $6e, 5 | OAMF_BANK1
	db $80

.frame_12
	frame_oam  -2,  -1, $78, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -2,  -8, $78, 5 | OAMF_BANK1
	frame_oam -18,   3, $74, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18,  -4, $76, 5 | OAMF_BANK1
	frame_oam -18, -12, $74, 5 | OAMF_BANK1
	db $80

.frame_13
	frame_oam  -3,  -1, $7e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3,  -8, $7e, 5 | OAMF_BANK1
	frame_oam -19,   3, $7a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,  -4, $7c, 5 | OAMF_BANK1
	frame_oam -19, -12, $7a, 5 | OAMF_BANK1
	db $80

OAM_184eeb::
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
	frame_oam -16,  -8, $c0, 7 | OAMF_BANK1
	frame_oam -16,   0, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -8, $c0, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,   0, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_1
	frame_oam -16,  -8, $c2, 7 | OAMF_BANK1
	frame_oam -16,   0, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -8, $c2, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,   0, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_2
	frame_oam -16,  -8, $c4, 7 | OAMF_BANK1
	frame_oam -16,   0, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -8, $c4, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,   0, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_3
	frame_oam -16,  -8, $c6, 7 | OAMF_BANK1
	frame_oam -16,   0, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -8, $c6, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,   0, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_4
	frame_oam  -8,  -8, $c8, 7 | OAMF_BANK1
	frame_oam  -8,   0, $c8, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_5
	frame_oam  -8,  -8, $ca, 7 | OAMF_BANK1
	frame_oam  -8,   0, $ca, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_6
	frame_oam  -8,  -8, $cc, 7 | OAMF_BANK1
	frame_oam  -8,   0, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_7
	frame_oam  -8,  -8, $ce, 7 | OAMF_BANK1
	frame_oam  -8,   0, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_8
	frame_oam  -8,  -8, $d0, 7 | OAMF_BANK1
	frame_oam  -8,   0, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_9
	frame_oam  -8,  -8, $d2, 7 | OAMF_BANK1
	frame_oam  -8,   0, $d2, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_10
	frame_oam  -4,  -4, $d4, 7 | OAMF_BANK1
	db $80

.frame_11
	frame_oam  -4,  -4, $d6, 7 | OAMF_BANK1
	db $80

.frame_12
	frame_oam -15, -12, $d8, 7 | OAMF_BANK1
	frame_oam -15,  -4, $da, 7 | OAMF_BANK1
	frame_oam -15,   3, $d8, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -15, -12, $dc, 7 | OAMF_BANK1
	frame_oam -15,  -4, $de, 7 | OAMF_BANK1
	frame_oam -15,   3, $dc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -15, -12, $e0, 7 | OAMF_BANK1
	frame_oam -15,  -4, $e2, 7 | OAMF_BANK1
	frame_oam -15,   3, $e0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -15, -12, $e4, 7 | OAMF_BANK1
	frame_oam -15,  -4, $e6, 7 | OAMF_BANK1
	frame_oam -15,   3, $e4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -16,  -8, $e8, 7 | OAMF_BANK1
	frame_oam -16,   0, $e8, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -16,  -8, $ea, 7 | OAMF_BANK1
	frame_oam -16,   0, $ea, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -16,  -8, $ec, 7 | OAMF_BANK1
	frame_oam -16,   0, $ec, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -16,  -8, $ee, 7 | OAMF_BANK1
	frame_oam -16,   0, $ee, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -16,  -8, $f0, 7 | OAMF_BANK1
	frame_oam -16,   0, $f0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_184ffa::
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

.frame_0
	frame_oam -32,  -8, $80, 6 | OAMF_BANK1
	frame_oam -32,   0, $82, 6 | OAMF_BANK1
	frame_oam -16,  -8, $86, 6 | OAMF_BANK1
	frame_oam -16,   0, $88, 6 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -32,  -1, $82, 6 | OAMF_BANK1
	frame_oam -32,  -9, $84, 6 | OAMF_BANK1
	frame_oam -16,  -8, $8e, 6 | OAMF_BANK1
	frame_oam -16,   0, $90, 6 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -32,  -1, $82, 6 | OAMF_BANK1
	frame_oam -32,  -9, $84, 6 | OAMF_BANK1
	frame_oam -16,  -8, $8a, 6 | OAMF_BANK1
	frame_oam -16,   0, $8c, 6 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,  -8, $94, 6 | OAMF_BANK1
	frame_oam -16,   0, $96, 6 | OAMF_BANK1
	frame_oam -32,   0, $82, 6 | OAMF_BANK1
	frame_oam -32,  -8, $92, 6 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -32,   0, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $88, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -32,  -7, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   1, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $8e, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $90, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -32,  -7, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   1, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $8a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -16,   0, $94, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $96, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $92, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -16,  -8, $80, 6 | OAMF_BANK1
	frame_oam -16,   0, $82, 6 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -14,  -8, $98, 6 | OAMF_BANK1
	frame_oam -14,   0, $9a, 6 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -16,   0, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -14,   0, $98, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,  -8, $9a, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -16,  -8, $a0, 6 | OAMF_BANK1
	frame_oam -16,   0, $a2, 6 | OAMF_BANK1
	db $80

.frame_13
	frame_oam  -8,  -8, $a4, 6 | OAMF_BANK1
	frame_oam  -8,   0, $a6, 6 | OAMF_BANK1
	frame_oam -24,  -8, $80, 6 | OAMF_BANK1
	frame_oam -24,   0, $82, 6 | OAMF_BANK1
	db $80

.frame_14
	frame_oam -16,   0, $a0, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam  -8,   0, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -8, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,   0, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -8, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -14,  -1, $ae, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,  -8, $ae, 6 | OAMF_BANK1
	frame_oam -30,  -1, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30,  -8, $aa, 6 | OAMF_BANK1
	frame_oam -26,   7, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22, -16, $a8, 6 | OAMF_BANK1
	db $80

.frame_17
	frame_oam -14,  -1, $ae, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,  -8, $ae, 6 | OAMF_BANK1
	frame_oam -30,  -1, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30,  -8, $aa, 6 | OAMF_BANK1
	frame_oam -22,   7, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26, -16, $a8, 6 | OAMF_BANK1
	db $80

.frame_18
	frame_oam -32,  -8, $9c, 6 | OAMF_BANK1
	frame_oam -32,  -1, $9c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $9e, 6 | OAMF_BANK1
	frame_oam -16,  -1, $9e, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -16,   0, $88, 6 | OAMF_BANK1
	frame_oam -16,  -8, $86, 6 | OAMF_BANK1
	db $80

.frame_20
	frame_oam -16,  -8, $88, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -30,  -1, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30,  -8, $ac, 6 | OAMF_BANK1
	frame_oam -14,  -1, $ae, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,  -8, $ae, 6 | OAMF_BANK1
	frame_oam -26,   7, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22, -16, $a8, 6 | OAMF_BANK1
	db $80

.frame_22
	frame_oam -30,  -8, $ac, 6 | OAMF_BANK1
	frame_oam -30,  -1, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,  -8, $ae, 6 | OAMF_BANK1
	frame_oam -14,  -1, $ae, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -26, -16, $a8, 6 | OAMF_BANK1
	frame_oam -22,   7, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -16,   0, $b2, 6 | OAMF_BANK1
	frame_oam -16,  -8, $b0, 6 | OAMF_BANK1
	db $80

.frame_24
	frame_oam -16,  -8, $b2, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $b0, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -14,  -1, $b4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,  -8, $b4, 6 | OAMF_BANK1
	db $80

.frame_26
	frame_oam -14,  -1, $b6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,  -8, $b6, 6 | OAMF_BANK1
	db $80

.frame_27
	frame_oam -14,  -1, $b8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,  -8, $b8, 6 | OAMF_BANK1
	db $80

.frame_28
	frame_oam -14,  -4, $ba, 6 | OAMF_BANK1
	db $80

.frame_29
	frame_oam -14,  -4, $bc, 6 | OAMF_BANK1
	db $80

.frame_30
	frame_oam -16,  -1, $9c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $9c, 6 | OAMF_BANK1
	db $80

OAM_1851df::
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
	frame_oam -13,   8, $26, 4 | OAMF_BANK1
	frame_oam -13,   0, $24, 4 | OAMF_BANK1
	frame_oam -13,  -8, $22, 4 | OAMF_BANK1
	frame_oam -13, -16, $20, 4 | OAMF_BANK1
	frame_oam -29,   8, $06, 4 | OAMF_BANK1
	frame_oam -29,   0, $04, 4 | OAMF_BANK1
	frame_oam -29,  -8, $02, 4 | OAMF_BANK1
	frame_oam -29, -16, $00, 4 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -13,   8, $2e, 4 | OAMF_BANK1
	frame_oam -13,   0, $2c, 4 | OAMF_BANK1
	frame_oam -13,  -8, $2a, 4 | OAMF_BANK1
	frame_oam -13, -16, $28, 4 | OAMF_BANK1
	frame_oam -29,   8, $0e, 4 | OAMF_BANK1
	frame_oam -29,   0, $0c, 4 | OAMF_BANK1
	frame_oam -29,  -8, $0a, 4 | OAMF_BANK1
	frame_oam -29, -16, $08, 4 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -13, -16, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   8, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   8, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -13, -16, $2e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $2c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   8, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   8, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -29, -16, $00, 4 | OAMF_BANK1
	frame_oam -29,   8, $06, 4 | OAMF_BANK1
	frame_oam -13,   8, $36, 4 | OAMF_BANK1
	frame_oam -13,   0, $34, 4 | OAMF_BANK1
	frame_oam -13,  -8, $32, 4 | OAMF_BANK1
	frame_oam -29,   0, $14, 4 | OAMF_BANK1
	frame_oam -29,  -8, $12, 4 | OAMF_BANK1
	frame_oam -13, -16, $20, 4 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -29, -16, $08, 4 | OAMF_BANK1
	frame_oam -29,   8, $0e, 4 | OAMF_BANK1
	frame_oam -13,   8, $3e, 4 | OAMF_BANK1
	frame_oam -13,   0, $3c, 4 | OAMF_BANK1
	frame_oam -13,  -8, $3a, 4 | OAMF_BANK1
	frame_oam -13, -16, $38, 4 | OAMF_BANK1
	frame_oam -29,   0, $1c, 4 | OAMF_BANK1
	frame_oam -29,  -8, $1a, 4 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -29,   8, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $36, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $32, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $14, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   8, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -29,   8, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $3e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $3a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   8, $38, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -14,  -8, $10, 4 | OAMF_BANK1
	frame_oam -14,   0, $30, 4 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -14,  -8, $78, 4 | OAMF_BANK1
	frame_oam -14,   0, $7a, 4 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -14,  -8, $16, 4 | OAMF_BANK1
	frame_oam -14,   0, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -14,  -8, $18, 4 | OAMF_BANK1
	frame_oam -14,   0, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -14,  -8, $1e, 4 | OAMF_BANK1
	frame_oam -14,   0, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -29, -16, $40, 4 | OAMF_BANK1
	frame_oam -29,  -8, $42, 4 | OAMF_BANK1
	frame_oam -29,   0, $44, 4 | OAMF_BANK1
	frame_oam -29,   8, $46, 4 | OAMF_BANK1
	frame_oam -13, -16, $48, 4 | OAMF_BANK1
	frame_oam -13,  -8, $4a, 4 | OAMF_BANK1
	frame_oam -13,   0, $4c, 4 | OAMF_BANK1
	frame_oam -13,   8, $4e, 4 | OAMF_BANK1
	db $80

.frame_14
	frame_oam -29,   8, $40, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $42, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $44, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $46, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   8, $48, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $4a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $4c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $4e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -29, -16, $40, 4 | OAMF_BANK1
	frame_oam -29,   8, $46, 4 | OAMF_BANK1
	frame_oam -13, -16, $48, 4 | OAMF_BANK1
	frame_oam -29,  -8, $50, 4 | OAMF_BANK1
	frame_oam -29,   0, $52, 4 | OAMF_BANK1
	frame_oam -13,  -8, $54, 4 | OAMF_BANK1
	frame_oam -13,   0, $56, 4 | OAMF_BANK1
	frame_oam -13,   8, $68, 4 | OAMF_BANK1
	db $80

.frame_16
	frame_oam -29,   8, $40, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $46, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   8, $48, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $50, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $52, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $54, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $56, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $68, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -29, -16, $58, 5 | OAMF_BANK1
	frame_oam -29,  -8, $5a, 5 | OAMF_BANK1
	frame_oam -29,   0, $5c, 5 | OAMF_BANK1
	frame_oam -29,   8, $5e, 5 | OAMF_BANK1
	frame_oam -13, -16, $60, 5 | OAMF_BANK1
	frame_oam -13,  -8, $62, 5 | OAMF_BANK1
	frame_oam -13,   0, $64, 5 | OAMF_BANK1
	frame_oam -13,   8, $66, 5 | OAMF_BANK1
	db $80

.frame_18
	frame_oam -29,   8, $58, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $5a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $5c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $5e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   8, $60, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $62, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $64, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $66, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -29,  -8, $6a, 4 | OAMF_BANK1
	frame_oam -29,   0, $6c, 4 | OAMF_BANK1
	frame_oam -29,   8, $6e, 4 | OAMF_BANK1
	frame_oam -13, -16, $70, 4 | OAMF_BANK1
	frame_oam -13,  -8, $72, 4 | OAMF_BANK1
	frame_oam -13,   0, $74, 4 | OAMF_BANK1
	frame_oam -13,   8, $76, 4 | OAMF_BANK1
	frame_oam -29, -16, $58, 4 | OAMF_BANK1
	db $80

.frame_20
	frame_oam -29,   0, $6a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $6c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $6e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   8, $70, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $72, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $74, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $76, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   8, $58, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -29, -16, $00, 5 | OAMF_BANK1
	frame_oam -29,   8, $06, 5 | OAMF_BANK1
	frame_oam -13,   8, $36, 5 | OAMF_BANK1
	frame_oam -13,   0, $34, 5 | OAMF_BANK1
	frame_oam -13,  -8, $32, 5 | OAMF_BANK1
	frame_oam -29,   0, $14, 5 | OAMF_BANK1
	frame_oam -29,  -8, $12, 5 | OAMF_BANK1
	frame_oam -13, -16, $20, 5 | OAMF_BANK1
	db $80

.frame_22
	frame_oam -29,   8, $00, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $06, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $36, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $34, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $32, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $14, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $12, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   8, $20, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -14,   0, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,  -8, $30, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -14,   0, $78, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,  -8, $7a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_1854a2::
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
	frame_oam -29, -16, $00, 4 | OAMF_BANK1
	frame_oam -29,  -8, $02, 4 | OAMF_BANK1
	frame_oam -29,   0, $04, 4 | OAMF_BANK1
	frame_oam -29,   8, $06, 4 | OAMF_BANK1
	frame_oam -13, -16, $20, 4 | OAMF_BANK1
	frame_oam -13,  -8, $22, 4 | OAMF_BANK1
	frame_oam -13,   0, $24, 4 | OAMF_BANK1
	frame_oam -13,   8, $26, 4 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -29, -16, $08, 4 | OAMF_BANK1
	frame_oam -29,  -8, $0a, 4 | OAMF_BANK1
	frame_oam -29,   0, $0c, 4 | OAMF_BANK1
	frame_oam -29,   8, $0e, 4 | OAMF_BANK1
	frame_oam -13, -16, $28, 4 | OAMF_BANK1
	frame_oam -13,  -8, $2a, 4 | OAMF_BANK1
	frame_oam -13,   0, $2c, 4 | OAMF_BANK1
	frame_oam -13,   8, $2e, 4 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -29,   8, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   8, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -29,   8, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   8, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $2c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $2e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -13, -16, $30, 4 | OAMF_BANK1
	frame_oam -13,  -8, $32, 4 | OAMF_BANK1
	frame_oam -13,   0, $34, 4 | OAMF_BANK1
	frame_oam -29,  -8, $12, 4 | OAMF_BANK1
	frame_oam -29,   0, $14, 4 | OAMF_BANK1
	frame_oam -29, -16, $00, 4 | OAMF_BANK1
	frame_oam -29,   8, $06, 4 | OAMF_BANK1
	frame_oam -13,   8, $26, 4 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -13, -16, $38, 4 | OAMF_BANK1
	frame_oam -13,  -8, $3a, 4 | OAMF_BANK1
	frame_oam -13,   0, $3c, 4 | OAMF_BANK1
	frame_oam -13,   8, $2e, 4 | OAMF_BANK1
	frame_oam -29,  -8, $1a, 4 | OAMF_BANK1
	frame_oam -29,   0, $1c, 4 | OAMF_BANK1
	frame_oam -29,   8, $0e, 4 | OAMF_BANK1
	frame_oam -29, -16, $08, 4 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -13,   8, $30, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $32, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $14, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   8, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -13,   8, $38, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $3a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $2e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   8, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -15,  -8, $36, 4 | OAMF_BANK1
	frame_oam -15,   0, $36, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -15,  -8, $16, 4 | OAMF_BANK1
	frame_oam -15,   0, $18, 4 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -15,   0, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -8, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -15,   0, $36, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -15,  -8, $36, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_12
	frame_oam -15,  -8, $1e, 4 | OAMF_BANK1
	frame_oam -15,   0, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -16,  -8, $3e, 4 | OAMF_BANK1
	frame_oam -16,   0, $3e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -15,  -8, $10, 4 | OAMF_BANK1
	frame_oam -15,   0, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -29, -16, $40, 4 | OAMF_BANK1
	frame_oam -29,  -8, $42, 4 | OAMF_BANK1
	frame_oam -29,   0, $44, 4 | OAMF_BANK1
	frame_oam -29,   8, $46, 4 | OAMF_BANK1
	frame_oam -13, -16, $48, 4 | OAMF_BANK1
	frame_oam -13,  -8, $4a, 4 | OAMF_BANK1
	frame_oam -13,   0, $4c, 4 | OAMF_BANK1
	frame_oam -13,   8, $4e, 4 | OAMF_BANK1
	db $80

.frame_16
	frame_oam -29,   8, $40, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $42, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $44, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $46, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   8, $48, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $4a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $4c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $4e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -29,  -8, $50, 4 | OAMF_BANK1
	frame_oam -29,   0, $52, 4 | OAMF_BANK1
	frame_oam -13,  -8, $54, 4 | OAMF_BANK1
	frame_oam -13,   0, $56, 4 | OAMF_BANK1
	frame_oam -29, -16, $40, 4 | OAMF_BANK1
	frame_oam -29,   8, $46, 4 | OAMF_BANK1
	frame_oam -13, -16, $48, 4 | OAMF_BANK1
	frame_oam -13,   8, $4e, 4 | OAMF_BANK1
	db $80

.frame_18
	frame_oam -29,   0, $50, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $52, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $54, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $56, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   8, $40, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $46, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   8, $48, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $4e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -13, -16, $5a, 5 | OAMF_BANK1
	frame_oam -13,  -8, $5c, 5 | OAMF_BANK1
	frame_oam -13,   0, $5e, 5 | OAMF_BANK1
	frame_oam -29,  -8, $58, 5 | OAMF_BANK1
	frame_oam -29, -16, $40, 5 | OAMF_BANK1
	frame_oam -29,   8, $46, 5 | OAMF_BANK1
	frame_oam -13,   8, $4e, 5 | OAMF_BANK1
	frame_oam -29,   0, $52, 5 | OAMF_BANK1
	db $80

.frame_20
	frame_oam -13,   8, $5a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $5c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $5e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $58, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   8, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $46, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $4e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $52, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -29,  -8, $64, 4 | OAMF_BANK1
	frame_oam -29,   0, $66, 4 | OAMF_BANK1
	frame_oam -13,  -8, $68, 4 | OAMF_BANK1
	frame_oam -13,   0, $6a, 4 | OAMF_BANK1
	frame_oam -29, -16, $60, 4 | OAMF_BANK1
	frame_oam -29,   8, $60, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $62, 4 | OAMF_BANK1
	frame_oam -13,   8, $62, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -29,   0, $64, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $66, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $68, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $6a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   8, $60, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $60, 4 | OAMF_BANK1
	frame_oam -13,   8, $62, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $62, 4 | OAMF_BANK1
	db $80

.frame_23
	frame_oam -29, -16, $60, 4 | OAMF_BANK1
	frame_oam -29,   8, $60, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $62, 4 | OAMF_BANK1
	frame_oam -13,   8, $62, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $6c, 4 | OAMF_BANK1
	frame_oam -29,   0, $6c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $6e, 4 | OAMF_BANK1
	frame_oam -13,   0, $6e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -13,   8, $30, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,   0, $32, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13,  -8, $34, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   0, $12, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $14, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   8, $00, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -16, $06, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -16, $26, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -13, -16, $30, 5 | OAMF_BANK1
	frame_oam -13,  -8, $32, 5 | OAMF_BANK1
	frame_oam -13,   0, $34, 5 | OAMF_BANK1
	frame_oam -29,  -8, $12, 5 | OAMF_BANK1
	frame_oam -29,   0, $14, 5 | OAMF_BANK1
	frame_oam -29, -16, $00, 5 | OAMF_BANK1
	frame_oam -29,   8, $06, 5 | OAMF_BANK1
	frame_oam -13,   8, $26, 5 | OAMF_BANK1
	db $80

OAM_185788::
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
	frame_oam -24,  -8, $82, 6 | OAMF_BANK1
	frame_oam -24,  -1, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $80, 6 | OAMF_BANK1
	frame_oam -16,   7, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -8, $80, 6 | OAMF_BANK1
	frame_oam  -8,  -1, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -24,  -8, $86, 6 | OAMF_BANK1
	frame_oam -24,  -1, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $84, 6 | OAMF_BANK1
	frame_oam -16,   7, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -8, $84, 6 | OAMF_BANK1
	frame_oam  -8,  -1, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -24,  -8, $8a, 6 | OAMF_BANK1
	frame_oam -24,  -1, $8a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $88, 6 | OAMF_BANK1
	frame_oam  -8,  -8, $88, 6 | OAMF_BANK1
	frame_oam  -8,  -1, $88, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   7, $88, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -24, -14, $8c, 6 | OAMF_BANK1
	frame_oam -24,  -6, $8e, 6 | OAMF_BANK1
	frame_oam -24,   2, $90, 6 | OAMF_BANK1
	frame_oam  -8, -14, $92, 6 | OAMF_BANK1
	frame_oam  -8,  -6, $94, 6 | OAMF_BANK1
	frame_oam  -8,   2, $96, 6 | OAMF_BANK1
	frame_oam -16,  10, $98, 6 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -24, -14, $9a, 6 | OAMF_BANK1
	frame_oam -24,  -6, $9c, 6 | OAMF_BANK1
	frame_oam -24,   2, $9e, 6 | OAMF_BANK1
	frame_oam  -8, -14, $a0, 6 | OAMF_BANK1
	frame_oam  -8,  -6, $a2, 6 | OAMF_BANK1
	frame_oam  -8,   2, $a4, 6 | OAMF_BANK1
	frame_oam -16,  10, $a6, 6 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -24, -14, $a8, 6 | OAMF_BANK1
	frame_oam -24,  -6, $aa, 6 | OAMF_BANK1
	frame_oam -24,   2, $ac, 6 | OAMF_BANK1
	frame_oam  -8, -14, $ae, 6 | OAMF_BANK1
	frame_oam  -8,  -6, $b0, 6 | OAMF_BANK1
	frame_oam  -8,   2, $b2, 6 | OAMF_BANK1
	frame_oam -16,  10, $b4, 6 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -24,   5, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -3, $8e, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24, -11, $90, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,   5, $92, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -3, $94, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8, -11, $96, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -19, $98, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -24,   5, $9a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -3, $9c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24, -11, $9e, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,   5, $a0, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -3, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8, -11, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -19, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -24,   5, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -3, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24, -11, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,   5, $ae, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -3, $b0, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8, -11, $b2, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -19, $b4, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_185893::
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

.frame_0
	frame_oam  -3,  -8, $a2, 6 | OAMF_BANK1
	frame_oam  -3,   0, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam  -4,  -8, $a4, 6 | OAMF_BANK1
	frame_oam  -4,   0, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam  -8,  -8, $a6, 6 | OAMF_BANK1
	frame_oam  -8,   0, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam  -4,  -8, $92, 6 | OAMF_BANK1
	frame_oam  -4,   0, $94, 6 | OAMF_BANK1
	frame_oam -20,  -4, $a8, 6 | OAMF_BANK1
	db $80

.frame_4
	frame_oam   0,  -8, $92, 6 | OAMF_BANK1
	frame_oam   0,   0, $94, 6 | OAMF_BANK1
	frame_oam -16,  -4, $aa, 6 | OAMF_BANK1
	db $80

.frame_5
	frame_oam   4,  -8, $92, 6 | OAMF_BANK1
	frame_oam   4,   0, $94, 6 | OAMF_BANK1
	frame_oam -12,  -4, $90, 6 | OAMF_BANK1
	frame_oam -28,  -4, $ac, 6 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -24,  -8, $80, 6 | OAMF_BANK1
	frame_oam -24,   0, $82, 6 | OAMF_BANK1
	frame_oam   8,  -8, $92, 6 | OAMF_BANK1
	frame_oam   8,   0, $94, 6 | OAMF_BANK1
	frame_oam  -8,  -4, $90, 6 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -24,  -8, $84, 6 | OAMF_BANK1
	frame_oam -24,   0, $86, 6 | OAMF_BANK1
	frame_oam   8,  -8, $92, 6 | OAMF_BANK1
	frame_oam   8,   0, $94, 6 | OAMF_BANK1
	frame_oam  -8,  -4, $90, 6 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -24,  -8, $88, 6 | OAMF_BANK1
	frame_oam -24,   0, $8a, 6 | OAMF_BANK1
	frame_oam   8,  -8, $92, 6 | OAMF_BANK1
	frame_oam   8,   0, $94, 6 | OAMF_BANK1
	frame_oam  -8,  -4, $90, 6 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -24,  -8, $8c, 6 | OAMF_BANK1
	frame_oam -24,   0, $8e, 6 | OAMF_BANK1
	frame_oam   8,  -8, $92, 6 | OAMF_BANK1
	frame_oam   8,   0, $94, 6 | OAMF_BANK1
	frame_oam  -8,  -4, $90, 6 | OAMF_BANK1
	db $80

.frame_10
	db $80

.frame_11
	frame_oam -12,  -8, $ae, 6 | OAMF_BANK1
	frame_oam -12,  -1, $ae, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam  -7,  -8, $b0, 6 | OAMF_BANK1
	frame_oam  -7,   0, $b0, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam  -4,  -8, $b2, 6 | OAMF_BANK1
	frame_oam  -4,   0, $b2, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -22,  -8, $84, 6 | OAMF_BANK1
	frame_oam -22,   0, $86, 6 | OAMF_BANK1
	frame_oam   2,  -8, $92, 6 | OAMF_BANK1
	frame_oam   2,   0, $94, 6 | OAMF_BANK1
	frame_oam  -6,  -4, $90, 6 | OAMF_BANK1
	db $80

.frame_15
	frame_oam -20,  -8, $84, 6 | OAMF_BANK1
	frame_oam -20,   0, $86, 6 | OAMF_BANK1
	frame_oam  -4,  -8, $92, 6 | OAMF_BANK1
	frame_oam  -4,   0, $94, 6 | OAMF_BANK1
	db $80

.frame_16
	frame_oam -18,  -8, $84, 6 | OAMF_BANK1
	frame_oam -18,   0, $86, 6 | OAMF_BANK1
	frame_oam  -2,  -8, $a4, 6 | OAMF_BANK1
	frame_oam  -2,   0, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -20,  -8, $84, 6 | OAMF_BANK1
	frame_oam -20,   0, $86, 6 | OAMF_BANK1
	frame_oam  -3,  -8, $a2, 6 | OAMF_BANK1
	frame_oam  -3,   0, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -12,  -8, $84, 6 | OAMF_BANK1
	frame_oam -12,   0, $86, 6 | OAMF_BANK1
	db $80

.frame_19
	frame_oam   8,  -8, $98, 6 | OAMF_BANK1
	frame_oam   8,   0, $9a, 6 | OAMF_BANK1
	frame_oam  -8,  -4, $96, 6 | OAMF_BANK1
	frame_oam -24,  -8, $b4, 6 | OAMF_BANK1
	frame_oam -24,   0, $b6, 6 | OAMF_BANK1
	db $80

.frame_20
	frame_oam   8,  -8, $9e, 6 | OAMF_BANK1
	frame_oam   8,   0, $a0, 6 | OAMF_BANK1
	frame_oam  -8,  -4, $9c, 6 | OAMF_BANK1
	frame_oam -24,  -8, $b8, 6 | OAMF_BANK1
	frame_oam -24,   0, $ba, 6 | OAMF_BANK1
	db $80

.frame_21
	frame_oam -24,  -8, $84, 6 | OAMF_BANK1
	frame_oam -24,   0, $86, 6 | OAMF_BANK1
	frame_oam   8,  -8, $98, 6 | OAMF_BANK1
	frame_oam   8,   0, $9a, 6 | OAMF_BANK1
	frame_oam  -8,  -4, $96, 6 | OAMF_BANK1
	db $80

.frame_22
	frame_oam -24,  -8, $84, 6 | OAMF_BANK1
	frame_oam -24,   0, $86, 6 | OAMF_BANK1
	frame_oam   8,  -8, $9e, 6 | OAMF_BANK1
	frame_oam   8,   0, $a0, 6 | OAMF_BANK1
	frame_oam  -8,  -4, $9c, 6 | OAMF_BANK1
	db $80

OAM_185a1c::
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
	frame_oam -16,   4, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $42, 5 | OAMF_BANK1
	frame_oam -16, -12, $40, 5 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,   4, $44, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $46, 5 | OAMF_BANK1
	frame_oam -16, -12, $44, 5 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,  -4, $48, 5 | OAMF_BANK1
	frame_oam -16,   4, $44, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $44, 5 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,  -4, $48, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $44, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $44, 5 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -16,   4, $4a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $4c, 5 | OAMF_BANK1
	frame_oam -16, -12, $4a, 5 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16,   4, $4e, 5 | OAMF_BANK1
	frame_oam -16,  -4, $4c, 5 | OAMF_BANK1
	frame_oam -16, -12, $4a, 5 | OAMF_BANK1
	frame_oam -30,   8, $62, 5 | OAMF_BANK1
	frame_oam -30,   0, $60, 5 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16, -12, $4e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $4c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $4a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30, -16, $62, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30,  -8, $60, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -16,   4, $50, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $52, 5 | OAMF_BANK1
	frame_oam -16, -12, $50, 5 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -16,   4, $54, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $56, 5 | OAMF_BANK1
	frame_oam -16, -12, $54, 5 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -14,   4, $58, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,  -4, $5a, 5 | OAMF_BANK1
	frame_oam -14, -12, $58, 5 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -16,  -4, $68, 5 | OAMF_BANK1
	db $80

.frame_11
	frame_oam -16,   0, $6a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $6a, 5 | OAMF_BANK1
	db $80

.frame_12
	frame_oam -16,   0, $6c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $6c, 5 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -16,   0, $6e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $6e, 5 | OAMF_BANK1
	db $80

.frame_14
	frame_oam -16,   0, $72, 5 | OAMF_BANK1
	frame_oam -16,  -8, $70, 5 | OAMF_BANK1
	db $80

.frame_15
	frame_oam -16,  -8, $72, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $70, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -15,   0, $62, 5 | OAMF_BANK1
	frame_oam -15,  -8, $60, 5 | OAMF_BANK1
	db $80

.frame_17
	frame_oam -29,   8, $62, 5 | OAMF_BANK1
	frame_oam -29,   0, $60, 5 | OAMF_BANK1
	frame_oam -16, -12, $74, 5 | OAMF_BANK1
	frame_oam -16,  -4, $76, 5 | OAMF_BANK1
	frame_oam -16,   4, $78, 5 | OAMF_BANK1
	db $80

.frame_18
	frame_oam -29, -16, $62, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $60, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $74, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $76, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $78, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -16, -12, $74, 5 | OAMF_BANK1
	frame_oam -16,  -4, $7a, 5 | OAMF_BANK1
	frame_oam -16,   4, $7c, 5 | OAMF_BANK1
	frame_oam -32,  -3, $64, 5 | OAMF_BANK1
	frame_oam -32,   2, $64, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -16,   4, $74, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $7a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $7c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -10, $64, 5 | OAMF_BANK1
	frame_oam -32,  -5, $64, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -16, -12, $4a, 5 | OAMF_BANK1
	frame_oam -16,  -4, $5e, 5 | OAMF_BANK1
	frame_oam -16,   4, $4a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -4, $5c, 5 | OAMF_BANK1
	db $80

.frame_22
	frame_oam -16, -12, $74, 5 | OAMF_BANK1
	frame_oam -16,  -4, $76, 5 | OAMF_BANK1
	frame_oam -16,   4, $66, 5 | OAMF_BANK1
	db $80

.frame_23
	frame_oam -16,   4, $74, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $76, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $66, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_185b98::
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
	frame_oam -27, -11, $90, 6 | OAMF_BANK1
	frame_oam -12,   3, $92, 6 | OAMF_BANK1
	frame_oam -32, -16, $80, 6 | OAMF_BANK1
	frame_oam -40,  -8, $82, 6 | OAMF_BANK1
	frame_oam -32,   8, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -40,   0, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $80, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -8,  -8, $82, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   8, $80, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -8,   0, $82, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_1
	frame_oam -12,   2, $92, 6 | OAMF_BANK1
	frame_oam -27, -10, $90, 6 | OAMF_BANK1
	frame_oam -32, -16, $84, 6 | OAMF_BANK1
	frame_oam -40,  -8, $86, 6 | OAMF_BANK1
	frame_oam -32,   8, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -40,   0, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $84, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -8,  -8, $86, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   8, $84, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -8,   0, $86, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_2
	frame_oam -26, -10, $90, 6 | OAMF_BANK1
	frame_oam -13,   2, $92, 6 | OAMF_BANK1
	frame_oam -32, -16, $88, 6 | OAMF_BANK1
	frame_oam -40,  -8, $8a, 6 | OAMF_BANK1
	frame_oam -32,   8, $88, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -40,   0, $8a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $88, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -8,   0, $8a, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -16, $88, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -8,  -8, $8a, 6 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_3
	frame_oam -26, -10, $90, 6 | OAMF_BANK1
	frame_oam -13,   3, $92, 6 | OAMF_BANK1
	frame_oam -32, -16, $8c, 6 | OAMF_BANK1
	frame_oam -40,  -8, $8e, 6 | OAMF_BANK1
	frame_oam -32,   8, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -40,   0, $8e, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -8,   0, $8e, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -16, $8c, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -8,  -8, $8e, 6 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_4
	frame_oam -24,  -4, $96, 6 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -24,  -8, $98, 6 | OAMF_BANK1
	frame_oam -24,   0, $98, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_6
	frame_oam -32, -12, $9a, 6 | OAMF_BANK1
	frame_oam -32,  -4, $9c, 6 | OAMF_BANK1
	frame_oam -16,   4, $9a, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -4, $9c, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   4, $9a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $9a, 6 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_7
	frame_oam -32,   0, $9e, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -33,  -9, $a0, 6 | OAMF_BANK1
	frame_oam -16,  -8, $9e, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -15,   1, $a0, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_8
	frame_oam -32, -12, $a2, 6 | OAMF_BANK1
	frame_oam -32,  -4, $a4, 6 | OAMF_BANK1
	frame_oam -16, -12, $a2, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -4, $a4, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32,   4, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_9
	frame_oam -33, -18, $a6, 6 | OAMF_BANK1
	frame_oam -43,  -9, $a8, 6 | OAMF_BANK1
	frame_oam -15, -18, $a6, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -5,  -9, $a8, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -33,  10, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43,   1, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  10, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -5,   1, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_10
	frame_oam -36, -24, $aa, 6 | OAMF_BANK1
	frame_oam -48, -12, $ac, 6 | OAMF_BANK1
	frame_oam -12,  16, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0,   4, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -36,  16, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,   4, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12, -24, $aa, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0, -12, $ac, 6 | OAMF_BANK1 | OAMF_YFLIP
	db $80
