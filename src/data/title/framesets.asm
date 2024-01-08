Frameset_6ce6::
	db 0, 4
	db $ff

Frameset_6ce9::
	db 1, 4
	db $ff

Frameset_6cec::
	db 2, 4
	db $ff

Frameset_6cef::
	db 3, 4
	db $ff

Frameset_6cf2::
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

Frameset_6d05::
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

Frameset_6d18::
	db 6, 4
	db $ff

Frameset_6d1b::
	db 7, 4
	db $ff

Frameset_6d1e::
	db 8, 4
	db $ff

OAM_6d21::
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
	frame_oam   0,  27, $12, 6 | OAMF_BANK1
	frame_oam   0,  35, $14, 6 | OAMF_BANK1
	frame_oam   0,   8, $00, 3 | OAMF_BANK1
	frame_oam   0,  16, $02, 3 | OAMF_BANK1
	frame_oam   0,  24, $04, 3 | OAMF_BANK1
	frame_oam   0,  40, $08, 3 | OAMF_BANK1
	frame_oam  16,   8, $0a, 3 | OAMF_BANK1
	frame_oam  16,  16, $0c, 3 | OAMF_BANK1
	frame_oam  16,  24, $0e, 3 | OAMF_BANK1
	frame_oam  16,  40, $10, 3 | OAMF_BANK1
	frame_oam   7,  32, $06, 3 | OAMF_BANK1
	frame_oam   0,   0, $16, 6 | OAMF_BANK1
	frame_oam  16,   0, $18, 6 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_1
	frame_oam   0,  27, $12, 6 | OAMF_BANK1
	frame_oam   0,  35, $14, 6 | OAMF_BANK1
	frame_oam   0,   8, $00, 3 | OAMF_BANK1
	frame_oam   0,  16, $02, 3 | OAMF_BANK1
	frame_oam   0,  24, $04, 3 | OAMF_BANK1
	frame_oam   0,  40, $08, 3 | OAMF_BANK1
	frame_oam  16,   8, $0a, 3 | OAMF_BANK1
	frame_oam  16,  16, $0c, 3 | OAMF_BANK1
	frame_oam  16,  24, $0e, 3 | OAMF_BANK1
	frame_oam  16,  40, $10, 3 | OAMF_BANK1
	frame_oam   7,  32, $06, 3 | OAMF_BANK1
	frame_oam  16,   0, $16, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,   0, $18, 6 | OAMF_BANK1
	db $80

.frame_2
	frame_oam   0,  27, $12, 6 | OAMF_BANK1
	frame_oam   0,  35, $14, 6 | OAMF_BANK1
	frame_oam   0,   8, $00, 3 | OAMF_BANK1
	frame_oam   0,  16, $02, 3 | OAMF_BANK1
	frame_oam   0,  24, $04, 3 | OAMF_BANK1
	frame_oam   0,  40, $08, 3 | OAMF_BANK1
	frame_oam  16,   8, $0a, 3 | OAMF_BANK1
	frame_oam  16,  16, $0c, 3 | OAMF_BANK1
	frame_oam  16,  24, $0e, 3 | OAMF_BANK1
	frame_oam  16,  40, $10, 3 | OAMF_BANK1
	frame_oam   7,  32, $06, 3 | OAMF_BANK1
	frame_oam   0,   0, $1a, 6 | OAMF_BANK1
	frame_oam  16,   0, $1c, 6 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_3
	frame_oam   0,  27, $12, 6 | OAMF_BANK1
	frame_oam   0,  35, $14, 6 | OAMF_BANK1
	frame_oam   0,   8, $00, 3 | OAMF_BANK1
	frame_oam   0,  16, $02, 3 | OAMF_BANK1
	frame_oam   0,  24, $04, 3 | OAMF_BANK1
	frame_oam   0,  40, $08, 3 | OAMF_BANK1
	frame_oam  16,   8, $0a, 3 | OAMF_BANK1
	frame_oam  16,  16, $0c, 3 | OAMF_BANK1
	frame_oam  16,  24, $0e, 3 | OAMF_BANK1
	frame_oam  16,  40, $10, 3 | OAMF_BANK1
	frame_oam   7,  32, $06, 3 | OAMF_BANK1
	frame_oam  16,   0, $1a, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,   0, $1c, 6 | OAMF_BANK1
	db $80

.frame_4
	frame_oam   1,  27, $12, 6 | OAMF_BANK1
	frame_oam   1,  35, $14, 6 | OAMF_BANK1
	frame_oam   1,   8, $00, 3 | OAMF_BANK1
	frame_oam   1,  16, $02, 3 | OAMF_BANK1
	frame_oam   1,  24, $04, 3 | OAMF_BANK1
	frame_oam   1,  40, $08, 3 | OAMF_BANK1
	frame_oam  17,   8, $0a, 3 | OAMF_BANK1
	frame_oam  17,  16, $0c, 3 | OAMF_BANK1
	frame_oam  17,  24, $0e, 3 | OAMF_BANK1
	frame_oam  17,  40, $10, 3 | OAMF_BANK1
	frame_oam   8,  32, $06, 3 | OAMF_BANK1
	frame_oam   1,   0, $16, 6 | OAMF_BANK1
	frame_oam  17,   0, $18, 6 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_5
	frame_oam   1,  27, $12, 6 | OAMF_BANK1
	frame_oam   1,  35, $14, 6 | OAMF_BANK1
	frame_oam   1,   8, $00, 3 | OAMF_BANK1
	frame_oam   1,  16, $02, 3 | OAMF_BANK1
	frame_oam   1,  24, $04, 3 | OAMF_BANK1
	frame_oam   1,  40, $08, 3 | OAMF_BANK1
	frame_oam  17,   8, $0a, 3 | OAMF_BANK1
	frame_oam  17,  16, $0c, 3 | OAMF_BANK1
	frame_oam  17,  24, $0e, 3 | OAMF_BANK1
	frame_oam  17,  40, $10, 3 | OAMF_BANK1
	frame_oam   8,  32, $06, 3 | OAMF_BANK1
	frame_oam  17,   0, $16, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   1,   0, $18, 6 | OAMF_BANK1
	db $80

.frame_6
	frame_oam   1,  27, $12, 6 | OAMF_BANK1
	frame_oam   1,  35, $14, 6 | OAMF_BANK1
	frame_oam   1,   8, $00, 3 | OAMF_BANK1
	frame_oam   1,  16, $02, 3 | OAMF_BANK1
	frame_oam   1,  24, $04, 3 | OAMF_BANK1
	frame_oam   1,  40, $08, 3 | OAMF_BANK1
	frame_oam  17,   8, $0a, 3 | OAMF_BANK1
	frame_oam  17,  16, $0c, 3 | OAMF_BANK1
	frame_oam  17,  24, $0e, 3 | OAMF_BANK1
	frame_oam  17,  40, $10, 3 | OAMF_BANK1
	frame_oam   8,  32, $06, 3 | OAMF_BANK1
	frame_oam   1,   0, $1a, 6 | OAMF_BANK1
	frame_oam  17,   0, $1c, 6 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_7
	frame_oam   1,  27, $12, 6 | OAMF_BANK1
	frame_oam   1,  35, $14, 6 | OAMF_BANK1
	frame_oam   1,   8, $00, 3 | OAMF_BANK1
	frame_oam   1,  16, $02, 3 | OAMF_BANK1
	frame_oam   1,  24, $04, 3 | OAMF_BANK1
	frame_oam   1,  40, $08, 3 | OAMF_BANK1
	frame_oam  17,   8, $0a, 3 | OAMF_BANK1
	frame_oam  17,  16, $0c, 3 | OAMF_BANK1
	frame_oam  17,  24, $0e, 3 | OAMF_BANK1
	frame_oam  17,  40, $10, 3 | OAMF_BANK1
	frame_oam   8,  32, $06, 3 | OAMF_BANK1
	frame_oam  17,   0, $1a, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   1,   0, $1c, 6 | OAMF_BANK1
	db $80

.frame_8
	frame_oam   0,   0, $20, 4 | OAMF_BANK1
	frame_oam   0,   8, $1e, 4 | OAMF_BANK1
	db $80

.frame_9
	frame_oam   0,   0, $22, 4 | OAMF_BANK1
	frame_oam   0,   8, $1e, 4 | OAMF_BANK1
	db $80

.frame_10
	frame_oam   0,   0, $24, 4 | OAMF_BANK1
	frame_oam   0,   8, $1e, 4 | OAMF_BANK1
	db $80

.frame_11
	frame_oam   1,   0, $26, 4 | OAMF_BANK1
	frame_oam   1,   8, $28, 4 | OAMF_BANK1
	db $80

.frame_12
	frame_oam   2,   0, $2a, 4 | OAMF_BANK1
	frame_oam   2,   8, $2c, 4 | OAMF_BANK1
	db $80

.frame_13
	frame_oam  -4,   8, $38, 7 | OAMF_BANK1
	frame_oam  -4,  16, $3a, 7 | OAMF_BANK1
	frame_oam   1,   8, $1e, 4 | OAMF_BANK1
	frame_oam   1,   0, $22, 4 | OAMF_BANK1
	db $80

.frame_14
	frame_oam  -6,   8, $3c, 7 | OAMF_BANK1
	frame_oam  -6,  16, $3e, 7 | OAMF_BANK1
	frame_oam  -6,  24, $40, 7 | OAMF_BANK1
	frame_oam   1,   0, $24, 4 | OAMF_BANK1
	frame_oam   1,   8, $1e, 4 | OAMF_BANK1
	db $80

.frame_15
	frame_oam  -8,   9, $42, 7 | OAMF_BANK1
	frame_oam  -8,  23, $44, 7 | OAMF_BANK1
	frame_oam   5,  21, $46, 7 | OAMF_BANK1
	frame_oam   0,   0, $2a, 4 | OAMF_BANK1
	frame_oam   0,   8, $2c, 4 | OAMF_BANK1
	db $80

.frame_16
	frame_oam   0,   0, $48, 4 | OAMF_BANK1
	frame_oam   0,   8, $4a, 4 | OAMF_BANK1
	db $80

.frame_17
	frame_oam -10,  10, $30, 7 | OAMF_BANK1
	frame_oam  -4,  18, $36, 7 | OAMF_BANK1
	frame_oam   0,   0, $48, 4 | OAMF_BANK1
	frame_oam   0,   8, $4a, 4 | OAMF_BANK1
	db $80

.frame_18
	frame_oam -10,  10, $2e, 7 | OAMF_BANK1
	frame_oam  -9,  16, $34, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -14,  26, $36, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,   0, $48, 4 | OAMF_BANK1
	frame_oam   0,   8, $4a, 4 | OAMF_BANK1
	db $80

.frame_19
	frame_oam -10,  10, $30, 7 | OAMF_BANK1
	frame_oam -15,  20, $32, 7 | OAMF_BANK1
	frame_oam -13,  31, $36, 7 | OAMF_BANK1
	frame_oam   0,   0, $48, 4 | OAMF_BANK1
	frame_oam   0,   8, $4a, 4 | OAMF_BANK1
	db $80

.frame_20
	frame_oam -10,  10, $2e, 7 | OAMF_BANK1
	frame_oam -16,  33, $36, 7 | OAMF_BANK1
	frame_oam -12,  18, $32, 7 | OAMF_BANK1
	frame_oam   0,   0, $48, 4 | OAMF_BANK1
	frame_oam   0,   8, $4a, 4 | OAMF_BANK1
	db $80

.frame_21
	frame_oam -10,  10, $30, 7 | OAMF_BANK1
	frame_oam  -4,  18, $36, 7 | OAMF_BANK1
	frame_oam   0,   0, $4c, 4 | OAMF_BANK1
	frame_oam   0,   8, $4e, 4 | OAMF_BANK1
	db $80

.frame_22
	frame_oam -10,  10, $2e, 3 | OAMF_BANK1
	frame_oam -12,  16, $34, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -18,  25, $36, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,   0, $4c, 4 | OAMF_BANK1
	frame_oam   0,   8, $4e, 4 | OAMF_BANK1
	db $80

.frame_23
	frame_oam -10,  10, $30, 7 | OAMF_BANK1
	frame_oam -18,  19, $32, 7 | OAMF_BANK1
	frame_oam -21,  29, $36, 7 | OAMF_BANK1
	frame_oam   0,   0, $4c, 4 | OAMF_BANK1
	frame_oam   0,   8, $4e, 4 | OAMF_BANK1
	db $80

.frame_24
	frame_oam -10,  10, $2e, 7 | OAMF_BANK1
	frame_oam -24,  32, $36, 7 | OAMF_BANK1
	frame_oam -17,  18, $32, 7 | OAMF_BANK1
	frame_oam   0,   0, $4c, 4 | OAMF_BANK1
	frame_oam   0,   8, $4e, 4 | OAMF_BANK1
	db $80

.frame_25
	frame_oam -10,   9, $30, 7 | OAMF_BANK1
	frame_oam  -4,  17, $36, 7 | OAMF_BANK1
	frame_oam   1,   9, $4c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   1,   1, $4e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -10,   9, $2e, 7 | OAMF_BANK1
	frame_oam -12,  15, $34, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -18,  24, $36, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   1,   9, $4c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   1,   1, $4e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -10,   9, $30, 7 | OAMF_BANK1
	frame_oam -18,  18, $32, 7 | OAMF_BANK1
	frame_oam -21,  28, $36, 7 | OAMF_BANK1
	frame_oam   1,   9, $4c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   1,   1, $4e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam -10,   9, $2e, 7 | OAMF_BANK1
	frame_oam -24,  31, $36, 7 | OAMF_BANK1
	frame_oam -17,  17, $32, 7 | OAMF_BANK1
	frame_oam   1,   9, $4c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   1,   1, $4e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_29
	frame_oam   0,   0, $3c, 7 | OAMF_BANK1
	frame_oam   0,   8, $3e, 7 | OAMF_BANK1
	db $80

.frame_30
	frame_oam -16,   2, $60, 7 | OAMF_BANK1
	frame_oam   0,   2, $62, 7 | OAMF_BANK1
	frame_oam  -3,  10, $64, 7 | OAMF_BANK1
	db $80

.frame_31
	frame_oam -16,   2, $66, 7 | OAMF_BANK1
	frame_oam   0,   2, $68, 7 | OAMF_BANK1
	frame_oam  -6,  10, $6a, 7 | OAMF_BANK1
	db $80

.frame_32
	frame_oam  -8,  10, $70, 7 | OAMF_BANK1
	frame_oam   8,   6, $74, 7 | OAMF_BANK1
	frame_oam   0,  14, $76, 7 | OAMF_BANK1
	frame_oam  -8,  -2, $72, 7 | OAMF_BANK1
	db $80

.frame_33
	frame_oam -20,  11, $70, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -9,  10, $6e, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -8,  -2, $6c, 7 | OAMF_BANK1
	frame_oam   1,  15, $6c, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   8,   5, $70, 7 | OAMF_BANK1
	db $80

.frame_34
	frame_oam  -8,   6, $6e, 7 | OAMF_BANK1
	frame_oam -13,  14, $70, 7 | OAMF_BANK1
	frame_oam   8,   6, $74, 7 | OAMF_BANK1
	frame_oam -19,  24, $36, 7 | OAMF_BANK1
	db $80

.frame_35
	frame_oam -27,  30, $36, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -25,  19, $32, 7 | OAMF_BANK1
	frame_oam -19,  11, $6e, 7 | OAMF_BANK1
	frame_oam   1,   6, $70, 7 | OAMF_BANK1
	db $80

.frame_36
	frame_oam   8,   6, $74, 7 | OAMF_BANK1
	frame_oam -28,  28, $32, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -25,  14, $6c, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -30,  20, $44, 7 | OAMF_BANK1
	frame_oam  -2,   9, $76, 7 | OAMF_BANK1
	db $80

.frame_37
	frame_oam  -8,   9, $70, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -13,  17, $34, 7 | OAMF_BANK1
	frame_oam -37,  24, $36, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -30,  36, $36, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_38
	frame_oam   2,   0, $26, 4 | OAMF_BANK1
	frame_oam   2,   8, $28, 4 | OAMF_BANK1
	db $80

.frame_39
	frame_oam   0,   0, $56, 5 | OAMF_BANK1
	frame_oam   0,   8, $58, 5 | OAMF_BANK1
	frame_oam   0,  16, $5a, 5 | OAMF_BANK1
	db $80

.frame_40
	frame_oam   0,   0, $5c, 5 | OAMF_BANK1
	frame_oam   0,   8, $5e, 5 | OAMF_BANK1
	db $80

Frameset_712c::
	db 0, 2
	db 1, 2
	db 2, 2
	db 3, 2
	db 4, 2
	db 5, 2
	db 6, 2
	db 7, 2
	db $ff

Frameset_713d::
	db  8, 3
	db  9, 3
	db 10, 3
	db $ff

Frameset_7144::
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

Frameset_7165::
	db 13,  6
	db 14,  6
	db 13,  6
	db 14,  6
	db 15,  6
	db 16, 40
	db $ff

Frameset_7172::
	db 17, 2
	db 18, 2
	db 19, 2
	db 20, 2
	db $ff

Frameset_717b::
	db 21, 2
	db 22, 2
	db 23, 2
	db 24, 2
	db $ff

Frameset_7184::
	db 25, 2
	db 26, 2
	db 27, 2
	db 28, 2
	db $ff

Frameset_718d::
	db 29, 9
	db 30, 9
	db 31, 9
	db 32, 9
	db 33, 9
	db $ff

Frameset_7198::
	db 34, 9
	db 35, 9
	db 36, 9
	db 37, 9
	db $ff

Frameset_71a1::
	db 39, 4
	db $ff

Frameset_71a4::
	db 40, 4
	db $ff

Frameset_71a7::
	db 0, 2
	db 1, 2
	db 2, 2
	db 3, 2
	db $ff

Pal_71b0::
	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  7,  0

	rgb 31, 25, 9
	rgb 21, 15, 4
	rgb 13,  8, 1
	rgb 0,   0, 0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

TimeAttack1JPTextMap::
INCBIN "gfx/bgmaps/text/time_attack1_en.bin"

TimeAttack2JPTextMap::
INCBIN "gfx/bgmaps/text/time_attack2_en.bin"

TimeAttack1ENTextMap::
INCBIN "gfx/bgmaps/text/time_attack1_jp.bin"

TimeAttack2ENTextMap::
INCBIN "gfx/bgmaps/text/time_attack2_jp.bin"

OAM_75c3::
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
	frame_oam -16,  -4, $18, 3
	frame_oam -16,  -8, $20, 4
	frame_oam -16,   0, $22, 4
	frame_oam -16,  -8, $00, 2
	frame_oam -16,   0, $02, 2
	db $80

.frame_1
	frame_oam  -6,  -5, $e0, 0 | OAMF_BANK1
	db $80

.frame_2
	frame_oam  -6,  -5, $e4, 0 | OAMF_BANK1
	db $80

.frame_3
	frame_oam  -6,  -5, $e6, 0 | OAMF_BANK1
	db $80

.frame_4
	frame_oam  -6,  -5, $ea, 0 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16,  -8, $1a, 3
	frame_oam -16,  -8, $24, 4
	frame_oam -16,   0, $26, 4
	frame_oam -16,  -8, $04, 2
	frame_oam -16,   0, $06, 2
	db $80

.frame_6
	frame_oam -16,  -8, $1c, 3
	frame_oam -16,  -8, $28, 4
	frame_oam -16,   0, $2a, 4
	frame_oam -16,  -8, $08, 2
	frame_oam -16,   0, $0a, 2
	db $80

.frame_7
	frame_oam -16,  -8, $2c, 4
	frame_oam -16,   0, $2e, 4
	frame_oam -16,  -8, $0c, 2
	frame_oam -16,   0, $0e, 2
	db $80

.frame_8
	frame_oam -16,  -8, $30, 4
	frame_oam -16,   0, $32, 4
	frame_oam -16,  -8, $10, 2
	frame_oam -16,   0, $12, 2
	db $80

.frame_9
	frame_oam -16,   0, $30, 4 | OAMF_XFLIP
	frame_oam -16,  -8, $32, 4 | OAMF_XFLIP
	frame_oam -16,   0, $10, 2 | OAMF_XFLIP
	frame_oam -16,  -8, $12, 2 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -16,   0, $2c, 4 | OAMF_XFLIP
	frame_oam -16,  -8, $2e, 4 | OAMF_XFLIP
	frame_oam -16,   0, $0c, 2 | OAMF_XFLIP
	frame_oam -16,  -8, $0e, 2 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -16,   0, $28, 4 | OAMF_XFLIP
	frame_oam -16,  -8, $2a, 4 | OAMF_XFLIP
	frame_oam -16,   0, $1c, 3 | OAMF_XFLIP
	frame_oam -16,   0, $08, 2 | OAMF_XFLIP
	frame_oam -16,  -8, $0a, 2 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -16,   0, $24, 4 | OAMF_XFLIP
	frame_oam -16,  -8, $26, 4 | OAMF_XFLIP
	frame_oam -16,   0, $1a, 3 | OAMF_XFLIP
	frame_oam -16,   0, $04, 2 | OAMF_XFLIP
	frame_oam -16,  -8, $06, 2 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -16,  -4, $18, 3 | OAMF_XFLIP
	frame_oam -16,   0, $20, 4 | OAMF_XFLIP
	frame_oam -16,  -8, $22, 4 | OAMF_XFLIP
	frame_oam -16,   0, $00, 2 | OAMF_XFLIP
	frame_oam -16,  -8, $02, 2 | OAMF_XFLIP
	db $80

Frameset_76b5::
	db $00,  8
	db $05,  8
	db $06,  8
	db $07,  8
	db $08,  8
	db $09,  8
	db $0a,  8
	db $0b,  8
	db $0c,  8
	db $0d,  8
	db $ff

Frameset_76ca::
	db $01,  4
	db $02,  4
	db $03,  4
	db $04,  4
	db $03,  4
	db $02,  4
	db $ff
