OAM_6b5f:
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
	frame_oam -16, -22, $00, 0
	frame_oam -16, -14, $02, 0
	frame_oam -16,  -6, $04, 0
	frame_oam -16,   2, $06, 0
	frame_oam -16,  10, $08, 0
	frame_oam -16,  18, $0a, 0
	db $80

.frame_1
	frame_oam -21, -24, $0c, 0
	frame_oam -21, -16, $0e, 0
	frame_oam -21,  -8, $10, 0
	frame_oam -21,   0, $12, 0
	frame_oam -21,   8, $14, 0
	frame_oam -21,  16, $16, 0
	frame_oam   0, -28, $18, 0
	frame_oam   0, -20, $1a, 0
	frame_oam   0, -12, $1c, 0
	frame_oam   0,  -4, $1e, 0
	frame_oam   0,   5, $20, 0
	frame_oam   0,  13, $22, 0
	frame_oam   0,  21, $24, 0
	db $80

.frame_2
	frame_oam   0,   6, $3c, 0
	frame_oam   0,  16, $48, 0
	frame_oam   0,  24, $4a, 0
	frame_oam   0, -32, $42, 1
	frame_oam   0, -24, $44, 1
	frame_oam   0, -16, $46, 1
	frame_oam -16, -27, $52, 4
	frame_oam -16, -19, $54, 4
	frame_oam -16, -11, $56, 4
	frame_oam -16,  -3, $58, 4
	frame_oam -16,   5, $5a, 4
	frame_oam -16,  13, $5c, 4
	frame_oam -16,  21, $5e, 4
	db $80

.frame_3
	frame_oam   0, -42, $3c, 0
	frame_oam   0,  16, $48, 1
	frame_oam   0,  24, $4a, 1
	frame_oam   0, -32, $42, 0
	frame_oam   0, -24, $44, 0
	frame_oam   0, -16, $46, 0
	frame_oam -16, -27, $52, 4
	frame_oam -16, -19, $54, 4
	frame_oam -16, -11, $56, 4
	frame_oam -16,  -3, $58, 4
	frame_oam -16,   5, $5a, 4
	frame_oam -16,  13, $5c, 4
	frame_oam -16,  21, $5e, 4
	db $80

.frame_4
	frame_oam   0,   6, $3e, 0
	frame_oam   0,  16, $48, 2
	frame_oam   0,  24, $4a, 2
	frame_oam   0, -32, $42, 1
	frame_oam   0, -24, $44, 1
	frame_oam   0, -16, $46, 1
	frame_oam -16, -27, $52, 4
	frame_oam -16, -19, $54, 4
	frame_oam -16, -11, $56, 4
	frame_oam -16,  -3, $58, 4
	frame_oam -16,   5, $5a, 4
	frame_oam -16,  13, $5c, 4
	frame_oam -16,  21, $5e, 4
	db $80

.frame_5
	frame_oam   0, -42, $3e, 0
	frame_oam   0, -32, $42, 2
	frame_oam   0, -24, $44, 2
	frame_oam   0, -16, $46, 2
	frame_oam   0,  16, $48, 1
	frame_oam   0,  24, $4a, 1
	frame_oam -16, -27, $52, 4
	frame_oam -16, -19, $54, 4
	frame_oam -16, -11, $56, 4
	frame_oam -16,  -3, $58, 4
	frame_oam -16,   5, $5a, 4
	frame_oam -16,  13, $5c, 4
	frame_oam -16,  21, $5e, 4
	db $80

.frame_6
	frame_oam   0,   2, $4e, 2
	frame_oam  28, -56, $4c, 2
	frame_oam -20,  21, $50, 2
	frame_oam   0,  -6, $60, 2
	db $80

.frame_7
	frame_oam -16, -24, $40, 2
	db $80

.frame_8
	frame_oam   0,   5, $20, 0
	frame_oam   0,  13, $22, 0
	frame_oam   0,  21, $24, 0
	frame_oam   0, -28, $18, 0
	frame_oam   0, -20, $1a, 0
	frame_oam   0, -12, $1c, 0
	frame_oam   0,  -4, $1e, 0
	frame_oam -21, -32, $2c, 0
	frame_oam -21, -24, $2e, 0
	frame_oam -21,  -8, $30, 0
	frame_oam -21,   0, $32, 0
	frame_oam -21,   8, $34, 0
	frame_oam -21,  16, $36, 0
	frame_oam -21,  24, $38, 0
	frame_oam -18, -16, $0a, 0
	db $80

Frameset_6ce6:
	db 0, 4
	db $ff

Frameset_6ce9:
	db 1, 4
	db $ff

Frameset_6cec:
	db 2, 4
	db $ff

Frameset_6cef:
	db 3, 4
	db $ff

Frameset_6cf2:
	db 4, 30
	db 2,  3
	db 4,  3
	db 2,  3
	db 4,  3
	db 2,  3
	db 4,  3
	db 2,  3
	db 4,  3
	db $ff

Frameset_6d05:
	db 5, 30
	db 3,  3
	db 5,  3
	db 3,  3
	db 5,  3
	db 3,  3
	db 5,  3
	db 3,  3
	db 5,  3
	db $ff

Frameset_6d18:
	db 6, 4
	db $ff

Frameset_6d1b:
	db 7, 4
	db $ff

Frameset_6d1e:
	db 8, 4
	db $ff

OAM_6d21:
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
	frame_oam   0,  27, $12, 6 | OAM_BANK1
	frame_oam   0,  35, $14, 6 | OAM_BANK1
	frame_oam   0,   8, $00, 3 | OAM_BANK1
	frame_oam   0,  16, $02, 3 | OAM_BANK1
	frame_oam   0,  24, $04, 3 | OAM_BANK1
	frame_oam   0,  40, $08, 3 | OAM_BANK1
	frame_oam  16,   8, $0a, 3 | OAM_BANK1
	frame_oam  16,  16, $0c, 3 | OAM_BANK1
	frame_oam  16,  24, $0e, 3 | OAM_BANK1
	frame_oam  16,  40, $10, 3 | OAM_BANK1
	frame_oam   7,  32, $06, 3 | OAM_BANK1
	frame_oam   0,   0, $16, 6 | OAM_BANK1
	frame_oam  16,   0, $18, 6 | OAM_BANK1 | OAM_YFLIP
	db $80

.frame_1
	frame_oam   0,  27, $12, 6 | OAM_BANK1
	frame_oam   0,  35, $14, 6 | OAM_BANK1
	frame_oam   0,   8, $00, 3 | OAM_BANK1
	frame_oam   0,  16, $02, 3 | OAM_BANK1
	frame_oam   0,  24, $04, 3 | OAM_BANK1
	frame_oam   0,  40, $08, 3 | OAM_BANK1
	frame_oam  16,   8, $0a, 3 | OAM_BANK1
	frame_oam  16,  16, $0c, 3 | OAM_BANK1
	frame_oam  16,  24, $0e, 3 | OAM_BANK1
	frame_oam  16,  40, $10, 3 | OAM_BANK1
	frame_oam   7,  32, $06, 3 | OAM_BANK1
	frame_oam  16,   0, $16, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam   0,   0, $18, 6 | OAM_BANK1
	db $80

.frame_2
	frame_oam   0,  27, $12, 6 | OAM_BANK1
	frame_oam   0,  35, $14, 6 | OAM_BANK1
	frame_oam   0,   8, $00, 3 | OAM_BANK1
	frame_oam   0,  16, $02, 3 | OAM_BANK1
	frame_oam   0,  24, $04, 3 | OAM_BANK1
	frame_oam   0,  40, $08, 3 | OAM_BANK1
	frame_oam  16,   8, $0a, 3 | OAM_BANK1
	frame_oam  16,  16, $0c, 3 | OAM_BANK1
	frame_oam  16,  24, $0e, 3 | OAM_BANK1
	frame_oam  16,  40, $10, 3 | OAM_BANK1
	frame_oam   7,  32, $06, 3 | OAM_BANK1
	frame_oam   0,   0, $1a, 6 | OAM_BANK1
	frame_oam  16,   0, $1c, 6 | OAM_BANK1 | OAM_YFLIP
	db $80

.frame_3
	frame_oam   0,  27, $12, 6 | OAM_BANK1
	frame_oam   0,  35, $14, 6 | OAM_BANK1
	frame_oam   0,   8, $00, 3 | OAM_BANK1
	frame_oam   0,  16, $02, 3 | OAM_BANK1
	frame_oam   0,  24, $04, 3 | OAM_BANK1
	frame_oam   0,  40, $08, 3 | OAM_BANK1
	frame_oam  16,   8, $0a, 3 | OAM_BANK1
	frame_oam  16,  16, $0c, 3 | OAM_BANK1
	frame_oam  16,  24, $0e, 3 | OAM_BANK1
	frame_oam  16,  40, $10, 3 | OAM_BANK1
	frame_oam   7,  32, $06, 3 | OAM_BANK1
	frame_oam  16,   0, $1a, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam   0,   0, $1c, 6 | OAM_BANK1
	db $80

.frame_4
	frame_oam   1,  27, $12, 6 | OAM_BANK1
	frame_oam   1,  35, $14, 6 | OAM_BANK1
	frame_oam   1,   8, $00, 3 | OAM_BANK1
	frame_oam   1,  16, $02, 3 | OAM_BANK1
	frame_oam   1,  24, $04, 3 | OAM_BANK1
	frame_oam   1,  40, $08, 3 | OAM_BANK1
	frame_oam  17,   8, $0a, 3 | OAM_BANK1
	frame_oam  17,  16, $0c, 3 | OAM_BANK1
	frame_oam  17,  24, $0e, 3 | OAM_BANK1
	frame_oam  17,  40, $10, 3 | OAM_BANK1
	frame_oam   8,  32, $06, 3 | OAM_BANK1
	frame_oam   1,   0, $16, 6 | OAM_BANK1
	frame_oam  17,   0, $18, 6 | OAM_BANK1 | OAM_YFLIP
	db $80

.frame_5
	frame_oam   1,  27, $12, 6 | OAM_BANK1
	frame_oam   1,  35, $14, 6 | OAM_BANK1
	frame_oam   1,   8, $00, 3 | OAM_BANK1
	frame_oam   1,  16, $02, 3 | OAM_BANK1
	frame_oam   1,  24, $04, 3 | OAM_BANK1
	frame_oam   1,  40, $08, 3 | OAM_BANK1
	frame_oam  17,   8, $0a, 3 | OAM_BANK1
	frame_oam  17,  16, $0c, 3 | OAM_BANK1
	frame_oam  17,  24, $0e, 3 | OAM_BANK1
	frame_oam  17,  40, $10, 3 | OAM_BANK1
	frame_oam   8,  32, $06, 3 | OAM_BANK1
	frame_oam  17,   0, $16, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam   1,   0, $18, 6 | OAM_BANK1
	db $80

.frame_6
	frame_oam   1,  27, $12, 6 | OAM_BANK1
	frame_oam   1,  35, $14, 6 | OAM_BANK1
	frame_oam   1,   8, $00, 3 | OAM_BANK1
	frame_oam   1,  16, $02, 3 | OAM_BANK1
	frame_oam   1,  24, $04, 3 | OAM_BANK1
	frame_oam   1,  40, $08, 3 | OAM_BANK1
	frame_oam  17,   8, $0a, 3 | OAM_BANK1
	frame_oam  17,  16, $0c, 3 | OAM_BANK1
	frame_oam  17,  24, $0e, 3 | OAM_BANK1
	frame_oam  17,  40, $10, 3 | OAM_BANK1
	frame_oam   8,  32, $06, 3 | OAM_BANK1
	frame_oam   1,   0, $1a, 6 | OAM_BANK1
	frame_oam  17,   0, $1c, 6 | OAM_BANK1 | OAM_YFLIP
	db $80

.frame_7
	frame_oam   1,  27, $12, 6 | OAM_BANK1
	frame_oam   1,  35, $14, 6 | OAM_BANK1
	frame_oam   1,   8, $00, 3 | OAM_BANK1
	frame_oam   1,  16, $02, 3 | OAM_BANK1
	frame_oam   1,  24, $04, 3 | OAM_BANK1
	frame_oam   1,  40, $08, 3 | OAM_BANK1
	frame_oam  17,   8, $0a, 3 | OAM_BANK1
	frame_oam  17,  16, $0c, 3 | OAM_BANK1
	frame_oam  17,  24, $0e, 3 | OAM_BANK1
	frame_oam  17,  40, $10, 3 | OAM_BANK1
	frame_oam   8,  32, $06, 3 | OAM_BANK1
	frame_oam  17,   0, $1a, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam   1,   0, $1c, 6 | OAM_BANK1
	db $80

.frame_8
	frame_oam   0,   0, $20, 4 | OAM_BANK1
	frame_oam   0,   8, $1e, 4 | OAM_BANK1
	db $80

.frame_9
	frame_oam   0,   0, $22, 4 | OAM_BANK1
	frame_oam   0,   8, $1e, 4 | OAM_BANK1
	db $80

.frame_10
	frame_oam   0,   0, $24, 4 | OAM_BANK1
	frame_oam   0,   8, $1e, 4 | OAM_BANK1
	db $80

.frame_11
	frame_oam   1,   0, $26, 4 | OAM_BANK1
	frame_oam   1,   8, $28, 4 | OAM_BANK1
	db $80

.frame_12
	frame_oam   2,   0, $2a, 4 | OAM_BANK1
	frame_oam   2,   8, $2c, 4 | OAM_BANK1
	db $80

.frame_13
	frame_oam  -4,   8, $38, 7 | OAM_BANK1
	frame_oam  -4,  16, $3a, 7 | OAM_BANK1
	frame_oam   1,   8, $1e, 4 | OAM_BANK1
	frame_oam   1,   0, $22, 4 | OAM_BANK1
	db $80

.frame_14
	frame_oam  -6,   8, $3c, 7 | OAM_BANK1
	frame_oam  -6,  16, $3e, 7 | OAM_BANK1
	frame_oam  -6,  24, $40, 7 | OAM_BANK1
	frame_oam   1,   0, $24, 4 | OAM_BANK1
	frame_oam   1,   8, $1e, 4 | OAM_BANK1
	db $80

.frame_15
	frame_oam  -8,   9, $42, 7 | OAM_BANK1
	frame_oam  -8,  23, $44, 7 | OAM_BANK1
	frame_oam   5,  21, $46, 7 | OAM_BANK1
	frame_oam   0,   0, $2a, 4 | OAM_BANK1
	frame_oam   0,   8, $2c, 4 | OAM_BANK1
	db $80

.frame_16
	frame_oam   0,   0, $48, 4 | OAM_BANK1
	frame_oam   0,   8, $4a, 4 | OAM_BANK1
	db $80

.frame_17
	frame_oam -10,  10, $30, 7 | OAM_BANK1
	frame_oam  -4,  18, $36, 7 | OAM_BANK1
	frame_oam   0,   0, $48, 4 | OAM_BANK1
	frame_oam   0,   8, $4a, 4 | OAM_BANK1
	db $80

.frame_18
	frame_oam -10,  10, $2e, 7 | OAM_BANK1
	frame_oam  -9,  16, $34, 7 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -14,  26, $36, 7 | OAM_BANK1 | OAM_YFLIP
	frame_oam   0,   0, $48, 4 | OAM_BANK1
	frame_oam   0,   8, $4a, 4 | OAM_BANK1
	db $80

.frame_19
	frame_oam -10,  10, $30, 7 | OAM_BANK1
	frame_oam -15,  20, $32, 7 | OAM_BANK1
	frame_oam -13,  31, $36, 7 | OAM_BANK1
	frame_oam   0,   0, $48, 4 | OAM_BANK1
	frame_oam   0,   8, $4a, 4 | OAM_BANK1
	db $80

.frame_20
	frame_oam -10,  10, $2e, 7 | OAM_BANK1
	frame_oam -16,  33, $36, 7 | OAM_BANK1
	frame_oam -12,  18, $32, 7 | OAM_BANK1
	frame_oam   0,   0, $48, 4 | OAM_BANK1
	frame_oam   0,   8, $4a, 4 | OAM_BANK1
	db $80

.frame_21
	frame_oam -10,  10, $30, 7 | OAM_BANK1
	frame_oam  -4,  18, $36, 7 | OAM_BANK1
	frame_oam   0,   0, $4c, 4 | OAM_BANK1
	frame_oam   0,   8, $4e, 4 | OAM_BANK1
	db $80

.frame_22
	frame_oam -10,  10, $2e, 3 | OAM_BANK1
	frame_oam -12,  16, $34, 7 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -18,  25, $36, 7 | OAM_BANK1 | OAM_YFLIP
	frame_oam   0,   0, $4c, 4 | OAM_BANK1
	frame_oam   0,   8, $4e, 4 | OAM_BANK1
	db $80

.frame_23
	frame_oam -10,  10, $30, 7 | OAM_BANK1
	frame_oam -18,  19, $32, 7 | OAM_BANK1
	frame_oam -21,  29, $36, 7 | OAM_BANK1
	frame_oam   0,   0, $4c, 4 | OAM_BANK1
	frame_oam   0,   8, $4e, 4 | OAM_BANK1
	db $80

.frame_24
	frame_oam -10,  10, $2e, 7 | OAM_BANK1
	frame_oam -24,  32, $36, 7 | OAM_BANK1
	frame_oam -17,  18, $32, 7 | OAM_BANK1
	frame_oam   0,   0, $4c, 4 | OAM_BANK1
	frame_oam   0,   8, $4e, 4 | OAM_BANK1
	db $80

.frame_25
	frame_oam -10,   9, $30, 7 | OAM_BANK1
	frame_oam  -4,  17, $36, 7 | OAM_BANK1
	frame_oam   1,   9, $4c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam   1,   1, $4e, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_26
	frame_oam -10,   9, $2e, 7 | OAM_BANK1
	frame_oam -12,  15, $34, 7 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -18,  24, $36, 7 | OAM_BANK1 | OAM_YFLIP
	frame_oam   1,   9, $4c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam   1,   1, $4e, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_27
	frame_oam -10,   9, $30, 7 | OAM_BANK1
	frame_oam -18,  18, $32, 7 | OAM_BANK1
	frame_oam -21,  28, $36, 7 | OAM_BANK1
	frame_oam   1,   9, $4c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam   1,   1, $4e, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_28
	frame_oam -10,   9, $2e, 7 | OAM_BANK1
	frame_oam -24,  31, $36, 7 | OAM_BANK1
	frame_oam -17,  17, $32, 7 | OAM_BANK1
	frame_oam   1,   9, $4c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam   1,   1, $4e, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_29
	frame_oam   0,   0, $3c, 7 | OAM_BANK1
	frame_oam   0,   8, $3e, 7 | OAM_BANK1
	db $80

.frame_30
	frame_oam -16,   2, $60, 7 | OAM_BANK1
	frame_oam   0,   2, $62, 7 | OAM_BANK1
	frame_oam  -3,  10, $64, 7 | OAM_BANK1
	db $80

.frame_31
	frame_oam -16,   2, $66, 7 | OAM_BANK1
	frame_oam   0,   2, $68, 7 | OAM_BANK1
	frame_oam  -6,  10, $6a, 7 | OAM_BANK1
	db $80

.frame_32
	frame_oam  -8,  10, $70, 7 | OAM_BANK1
	frame_oam   8,   6, $74, 7 | OAM_BANK1
	frame_oam   0,  14, $76, 7 | OAM_BANK1
	frame_oam  -8,  -2, $72, 7 | OAM_BANK1
	db $80

.frame_33
	frame_oam -20,  11, $70, 7 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam  -9,  10, $6e, 7 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam  -8,  -2, $6c, 7 | OAM_BANK1
	frame_oam   1,  15, $6c, 7 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam   8,   5, $70, 7 | OAM_BANK1
	db $80

.frame_34
	frame_oam  -8,   6, $6e, 7 | OAM_BANK1
	frame_oam -13,  14, $70, 7 | OAM_BANK1
	frame_oam   8,   6, $74, 7 | OAM_BANK1
	frame_oam -19,  24, $36, 7 | OAM_BANK1
	db $80

.frame_35
	frame_oam -27,  30, $36, 7 | OAM_BANK1 | OAM_YFLIP
	frame_oam -25,  19, $32, 7 | OAM_BANK1
	frame_oam -19,  11, $6e, 7 | OAM_BANK1
	frame_oam   1,   6, $70, 7 | OAM_BANK1
	db $80

.frame_36
	frame_oam   8,   6, $74, 7 | OAM_BANK1
	frame_oam -28,  28, $32, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -25,  14, $6c, 7 | OAM_BANK1 | OAM_YFLIP
	frame_oam -30,  20, $44, 7 | OAM_BANK1
	frame_oam  -2,   9, $76, 7 | OAM_BANK1
	db $80

.frame_37
	frame_oam  -8,   9, $70, 7 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -13,  17, $34, 7 | OAM_BANK1
	frame_oam -37,  24, $36, 7 | OAM_BANK1 | OAM_YFLIP
	frame_oam -30,  36, $36, 7 | OAM_BANK1 | OAM_YFLIP
	db $80

.frame_38
	frame_oam   2,   0, $26, 4 | OAM_BANK1
	frame_oam   2,   8, $28, 4 | OAM_BANK1
	db $80

.frame_39
	frame_oam   0,   0, $56, 5 | OAM_BANK1
	frame_oam   0,   8, $58, 5 | OAM_BANK1
	frame_oam   0,  16, $5a, 5 | OAM_BANK1
	db $80

.frame_40
	frame_oam   0,   0, $5c, 5 | OAM_BANK1
	frame_oam   0,   8, $5e, 5 | OAM_BANK1
	db $80

Frameset_712c:
	db 0, 2
	db 1, 2
	db 2, 2
	db 3, 2
	db 4, 2
	db 5, 2
	db 6, 2
	db 7, 2
	db $ff

Frameset_713d:
	db  8, 3
	db  9, 3
	db 10, 3
	db $ff

Frameset_7144:
	db  8, 3
	db  9, 3
	db 10, 3
	db  8, 3
	db  9, 3
	db 10, 3
	db  8, 3
	db  9, 3
	db 10, 3
	db  8, 3
	db  9, 3
	db 10, 3
	db 11, 4
	db 12, 7
	db 38, 5
	db 11, 4
	db $ff

Frameset_7165:
	db 13,  6
	db 14,  6
	db 13,  6
	db 14,  6
	db 15,  6
	db 16, 40
	db $ff

Frameset_7172:
	db 17, 2
	db 18, 2
	db 19, 2
	db 20, 2
	db $ff

Frameset_717b:
	db 21, 2
	db 22, 2
	db 23, 2
	db 24, 2
	db $ff

Frameset_7184:
	db 25, 2
	db 26, 2
	db 27, 2
	db 28, 2
	db $ff

Frameset_718d:
	db 29, 9
	db 30, 9
	db 31, 9
	db 32, 9
	db 33, 9
	db $ff

Frameset_7198:
	db 34, 9
	db 35, 9
	db 36, 9
	db 37, 9
	db $ff

Frameset_71a1:
	db 39, 4
	db $ff

Frameset_71a4:
	db 40, 4
	db $ff

Frameset_71a7:
	db 0, 2
	db 1, 2
	db 2, 2
	db 3, 2
	db $ff
