OAM_1fc000::
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
	frame_oam -32, -16, $00, 0
	frame_oam -32,  -8, $02, 0
	frame_oam -16, -16, $20, 0
	frame_oam -16,  -8, $22, 0
	frame_oam -32,   8, $00, 0 | OAM_XFLIP
	frame_oam -32,   0, $02, 0 | OAM_XFLIP
	frame_oam -16,   8, $20, 0 | OAM_XFLIP
	frame_oam -16,   0, $22, 0 | OAM_XFLIP
	db $80

.frame_1
	frame_oam -16, -16, $24, 0
	frame_oam -16,  -8, $26, 0
	frame_oam -32, -12, $04, 0
	frame_oam -32,  -4, $06, 0
	frame_oam -32,   4, $04, 0 | OAM_XFLIP
	frame_oam -16,   8, $24, 0 | OAM_XFLIP
	frame_oam -16,   0, $26, 0 | OAM_XFLIP
	db $80

.frame_2
	frame_oam -16,   0, $08, 0
	frame_oam -16,   8, $0a, 0
	frame_oam -32, -12, $04, 0
	frame_oam -32,  -4, $06, 0
	frame_oam -32,   4, $04, 0 | OAM_XFLIP
	frame_oam -16, -16, $20, 0
	frame_oam -16,  -8, $22, 0
	db $80

.frame_3
	frame_oam -16,  -8, $08, 0 | OAM_XFLIP
	frame_oam -16, -16, $0a, 0 | OAM_XFLIP
	frame_oam -32,   4, $04, 0 | OAM_XFLIP
	frame_oam -32,  -4, $06, 0 | OAM_XFLIP
	frame_oam -32, -12, $04, 0
	frame_oam -16,   8, $20, 0 | OAM_XFLIP
	frame_oam -16,   0, $22, 0 | OAM_XFLIP
	db $80

.frame_4
	frame_oam -32,   6, $0e, 0 | OAM_XFLIP
	frame_oam -32,  -1, $10, 0 | OAM_XFLIP
	frame_oam -32,  -9, $12, 0 | OAM_XFLIP
	frame_oam -16,   7, $2e, 0 | OAM_XFLIP
	frame_oam -16,  -1, $30, 0 | OAM_XFLIP
	frame_oam -16,  -9, $32, 0 | OAM_XFLIP
	frame_oam -21, -17, $14, 0 | OAM_XFLIP
	db $80

.frame_5
	frame_oam -16,  -8, $36, 0
	frame_oam -16,   0, $36, 0 | OAM_XFLIP
	frame_oam -16, -16, $34, 0
	frame_oam -16,   8, $34, 0 | OAM_XFLIP
	frame_oam -32,   0, $18, 0 | OAM_XFLIP
	frame_oam -32,  -8, $1a, 0 | OAM_XFLIP
	frame_oam -32,   7, $0e, 0 | OAM_XFLIP
	frame_oam -32, -16, $0e, 0
	db $80

.frame_6
	frame_oam -32,  -8, $16, 0
	frame_oam -16,  -8, $36, 0
	frame_oam -32,   0, $16, 0 | OAM_XFLIP
	frame_oam -16,   0, $36, 0 | OAM_XFLIP
	frame_oam -16, -16, $34, 0
	frame_oam -16,   8, $34, 0 | OAM_XFLIP
	frame_oam -32, -16, $00, 0
	frame_oam -32,   8, $00, 0 | OAM_XFLIP
	db $80

.frame_7
	frame_oam -16,   0, $36, 0 | OAM_XFLIP
	frame_oam -16,  -8, $36, 0
	frame_oam -16,   8, $34, 0 | OAM_XFLIP
	frame_oam -16, -16, $34, 0
	frame_oam -32,  -8, $18, 0
	frame_oam -32,   0, $1a, 0
	frame_oam -32, -15, $0e, 0
	frame_oam -32,   8, $0e, 0 | OAM_XFLIP
	db $80

.frame_8
	frame_oam -32, -14, $0e, 0
	frame_oam -32,  -7, $10, 0
	frame_oam -32,   1, $12, 0
	frame_oam -16, -15, $2e, 0
	frame_oam -16,  -7, $30, 0
	frame_oam -16,   1, $32, 0
	frame_oam -21,   9, $14, 0
	db $80

.frame_9
	frame_oam -16, -16, $3c, 0
	frame_oam -16,   8, $3c, 0 | OAM_XFLIP
	frame_oam -32, -12, $38, 0
	frame_oam -32,  -4, $3a, 0
	frame_oam -32,   4, $38, 0 | OAM_XFLIP
	frame_oam -16,  -8, $1c, 0
	frame_oam -16,   0, $1c, 0 | OAM_XFLIP
	db $80

.frame_10
	frame_oam -16,  -8, $3e, 0
	frame_oam -16,   8, $3c, 0 | OAM_XFLIP
	frame_oam -16,   0, $3e, 0 | OAM_XFLIP
	frame_oam -32, -12, $40, 0
	frame_oam -32,  -4, $42, 0
	frame_oam -32,   4, $40, 0 | OAM_XFLIP
	frame_oam -16, -16, $1e, 0
	db $80

.frame_11
	frame_oam -16,   0, $3e, 0 | OAM_XFLIP
	frame_oam -16, -16, $3c, 0
	frame_oam -16,  -8, $3e, 0
	frame_oam -32,   4, $40, 0 | OAM_XFLIP
	frame_oam -32,  -4, $42, 0
	frame_oam -32, -12, $40, 0
	frame_oam -16,   8, $1e, 0 | OAM_XFLIP
	db $80

.frame_12
	frame_oam -42,   2, $44, 0
	frame_oam -32, -12, $38, 0
	frame_oam -32,  -4, $3a, 0
	frame_oam -32,   4, $38, 0 | OAM_XFLIP
	frame_oam -16, -16, $3c, 0
	frame_oam -16,   8, $3c, 0 | OAM_XFLIP
	frame_oam -16,  -8, $1c, 0
	frame_oam -16,   0, $1c, 0 | OAM_XFLIP
	db $80

.frame_13
	frame_oam -16,  -8, $3e, 0
	frame_oam -16,   0, $3e, 0 | OAM_XFLIP
	frame_oam -16, -16, $4c, 0
	frame_oam -16,   8, $4c, 0 | OAM_XFLIP
	frame_oam -32, -12, $40, 0
	frame_oam -32,  -4, $42, 0
	frame_oam -32,   4, $40, 0 | OAM_XFLIP
	db $80

.frame_14
	frame_oam -16, -16, $50, 0
	frame_oam -16,   8, $50, 0 | OAM_XFLIP
	frame_oam -32, -12, $38, 0
	frame_oam -32,  -4, $3a, 0
	frame_oam -32,   4, $38, 0 | OAM_XFLIP
	frame_oam -16,  -8, $1c, 0
	frame_oam -16,   0, $1c, 0 | OAM_XFLIP
	db $80

.frame_15
	frame_oam -44,   2, $44, 0
	frame_oam -32, -12, $38, 0
	frame_oam -32,  -4, $3a, 0
	frame_oam -32,   4, $38, 0 | OAM_XFLIP
	frame_oam -16,   8, $1e, 0 | OAM_XFLIP
	frame_oam -16, -16, $1e, 0
	frame_oam -16,  -8, $1c, 0
	frame_oam -16,   0, $1c, 0 | OAM_XFLIP
	db $80

.frame_16
	frame_oam -32, -12, $54, 0
	frame_oam -32,  -4, $56, 0
	frame_oam -16, -16, $5c, 0
	frame_oam -16,  -8, $5e, 0
	frame_oam -16,   0, $28, 0
	db $80

.frame_17
	frame_oam -45,  -2, $48, 0
	frame_oam -45,   6, $48, 0 | OAM_XFLIP
	frame_oam -16,   8, $1e, 0 | OAM_XFLIP
	frame_oam -16, -16, $1e, 0
	frame_oam -32, -12, $38, 0
	frame_oam -32,   4, $38, 0 | OAM_XFLIP
	frame_oam -32,  -4, $52, 0
	frame_oam -16,  -8, $1c, 0
	frame_oam -16,   0, $1c, 0 | OAM_XFLIP
	db $80

.frame_18
	frame_oam -45,  -2, $46, 0
	frame_oam -45,   6, $46, 0 | OAM_XFLIP
	frame_oam -16,   8, $1e, 0 | OAM_XFLIP
	frame_oam -16, -16, $1e, 0
	frame_oam -32, -12, $38, 0
	frame_oam -32,   4, $38, 0 | OAM_XFLIP
	frame_oam -32,  -4, $52, 0
	frame_oam -16,  -8, $1c, 0
	frame_oam -16,   0, $1c, 0 | OAM_XFLIP
	db $80

.frame_19
	frame_oam -32, -12, $38, 0
	frame_oam -32,  -4, $3a, 0
	frame_oam -32,   4, $38, 0 | OAM_XFLIP
	frame_oam -16,   8, $1e, 0 | OAM_XFLIP
	frame_oam -16, -16, $1e, 0
	frame_oam -16,  -8, $3e, 0
	frame_oam -16,   0, $3e, 0 | OAM_XFLIP
	db $80

.frame_20
	frame_oam -16,   8, $1e, 0 | OAM_XFLIP
	frame_oam -16, -16, $1e, 0
	frame_oam -32, -12, $38, 0
	frame_oam -32,   4, $38, 0 | OAM_XFLIP
	frame_oam -32,  -4, $52, 0
	frame_oam -16,  -8, $1c, 0
	frame_oam -16,   0, $1c, 0 | OAM_XFLIP
	db $80

Frameset_1fc2ab:
	db   0, 30
	db   1, 18
	db   0,  4
	db   1,  3
	db   0,  4
	db   1,  3
	db   0,  4
	db   1,  3
	db   0,  4
	db   1,  3
	db   0,  4
	db   1,  3
	db $ff

Frameset_1fc2c4:
	db   6, 10
	db   5,  3
	db   4,  8
	db   5,  3
	db   6,  6
	db   7,  3
	db   8,  8
	db   7,  3
	db   6, 30
	db   9, 14
	db  19,  8
	db  13,  8
	db  10,  5
	db  11,  5
	db  10,  5
	db  11,  5
	db   9,  5
	db  10,  5
	db  11,  5
	db  10,  5
	db  11,  5
	db   9,  5
	db  10,  5
	db  11,  5
	db  10,  6
	db  11,  8
	db  12,  2
	db  15,  2
	db  17,  6
	db  18,  3
	db  17,  6
	db  18,  3
	db  20, 30
	db  19, 30
	db  14,  8
	db   6,  1
	db $ff

Frameset_1fc30d:
	db   0, 60
	db   1,  8
	db   2,  8
	db  16,  1
	db $ff

Frameset_1fc316::
	db   0, 20
	db   1, 20
	db $ff

OAM_1fc31b::
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
	frame_oam -31,   4, $00, 0 | OAM_XFLIP
	frame_oam -31,  -4, $02, 0 | OAM_XFLIP
	frame_oam -31, -12, $04, 0 | OAM_XFLIP
	frame_oam -15,   4, $20, 0 | OAM_XFLIP
	frame_oam -15,  -4, $22, 0 | OAM_XFLIP
	frame_oam -15, -12, $24, 0 | OAM_XFLIP
	db $80

.frame_1
	frame_oam -32,   4, $46, 0 | OAM_XFLIP
	frame_oam -32,  -4, $48, 0 | OAM_XFLIP
	frame_oam -32, -12, $4a, 0 | OAM_XFLIP
	frame_oam -16,   4, $66, 0 | OAM_XFLIP
	frame_oam -16,  -4, $68, 0 | OAM_XFLIP
	frame_oam -16, -12, $6a, 0 | OAM_XFLIP
	db $80

.frame_2
	frame_oam -32, -16, $4c, 0
	frame_oam -32,  -8, $4e, 0
	frame_oam -16, -16, $6c, 0
	frame_oam -16,  -8, $6e, 0
	frame_oam -32,   8, $4c, 0 | OAM_XFLIP
	frame_oam -32,   0, $4e, 0 | OAM_XFLIP
	frame_oam -16,   8, $6c, 0 | OAM_XFLIP
	frame_oam -16,   0, $6e, 0 | OAM_XFLIP
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
	frame_oam -31, -12, $40, 0
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
	frame_oam -32,   8, $4c, 0 | OAM_XFLIP
	frame_oam -32,  -8, $50, 0 | OAM_XFLIP
	frame_oam -16,  -8, $70, 0 | OAM_XFLIP
	frame_oam -16, -16, $72, 0 | OAM_XFLIP
	frame_oam -32, -16, $4c, 0
	db $80

.frame_8
	frame_oam -32,   4, $54, 0 | OAM_XFLIP
	frame_oam -32,  -4, $56, 0 | OAM_XFLIP
	frame_oam -32, -12, $58, 0 | OAM_XFLIP
	frame_oam -16,   4, $74, 0 | OAM_XFLIP
	frame_oam -16,  -4, $76, 0 | OAM_XFLIP
	frame_oam -16, -12, $78, 0 | OAM_XFLIP
	db $80

.frame_9
	frame_oam -32,  -4, $5c, 0 | OAM_XFLIP
	frame_oam -32, -12, $5e, 0 | OAM_XFLIP
	frame_oam -16,   4, $7a, 0 | OAM_XFLIP
	frame_oam -16,  -4, $7c, 0 | OAM_XFLIP
	frame_oam -16, -12, $7e, 0 | OAM_XFLIP
	frame_oam -31,   4, $40, 0 | OAM_XFLIP
	db $80

Frameset_1fc439::
	db   2,  2
	db   1,  1
	db   0,  1
	db   9,  1
	db   8,  1
	db   7,  2
	db $ff

Frameset_1fc446::
	db   2,  2
	db   3,  1
	db   4,  1
	db   5,  1
	db   6,  1
	db   7,  2
	db $ff

Frameset_1fc453::
	db   7,  4
	db   8,  2
	db   9,  4
	db $ff

Frameset_1fc45a::
	db   7,  4
	db   6,  2
	db   5,  4
	db $ff

Frameset_1fc461::
	db   9,  2
	db   0,  1
	db   1,  1
	db   2,  2
	db $ff

Frameset_1fc46a::
	db   5,  2
	db   4,  1
	db   3,  1
	db   2,  2
	db $ff

Frameset_1fc473::
	db   2,  2
	db   3,  1
	db   4,  1
	db   5,  2
	db $ff

Frameset_1fc47c::
	db   2,  2
	db   1,  1
	db   0,  1
	db   9,  2
	db $ff

Frameset_1fc485::
	db   9,  4
	db $ff

Frameset_1fc488::
	db   5,  4
	db $ff

OAM_1fc48b:
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

.frame_0
	frame_oam -32, -13, $00, 0
	frame_oam -32,  -5, $02, 0
	frame_oam -32,   3, $04, 0
	frame_oam -16, -13, $20, 0
	frame_oam -16,  -5, $22, 0
	frame_oam -16,   3, $24, 0
	db $80

.frame_1
	frame_oam -32, -13, $06, 0
	frame_oam -32,  -5, $08, 0
	frame_oam -32,   3, $0a, 0
	frame_oam -16, -13, $26, 0
	frame_oam -16,  -5, $28, 0
	frame_oam -16,   3, $2a, 0
	db $80

.frame_2
	frame_oam -32, -13, $0c, 0
	frame_oam -32,  -5, $0e, 0
	frame_oam -32,   3, $10, 0
	frame_oam -16, -13, $2c, 0
	frame_oam -16,  -5, $2e, 0
	frame_oam -16,   3, $30, 0
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
	frame_oam -32,   5, $00, 0 | OAM_XFLIP
	frame_oam -32,  -3, $02, 0 | OAM_XFLIP
	frame_oam -32, -11, $04, 0 | OAM_XFLIP
	frame_oam -16,   5, $20, 0 | OAM_XFLIP
	frame_oam -16,  -3, $22, 0 | OAM_XFLIP
	frame_oam -16, -11, $24, 0 | OAM_XFLIP
	db $80

.frame_5
	frame_oam -32,   5, $06, 0 | OAM_XFLIP
	frame_oam -32,  -3, $08, 0 | OAM_XFLIP
	frame_oam -32, -11, $0a, 0 | OAM_XFLIP
	frame_oam -16,   5, $26, 0 | OAM_XFLIP
	frame_oam -16,  -3, $28, 0 | OAM_XFLIP
	frame_oam -16, -11, $2a, 0 | OAM_XFLIP
	db $80

.frame_6
	frame_oam -32,   5, $0c, 0 | OAM_XFLIP
	frame_oam -32,  -3, $0e, 0 | OAM_XFLIP
	frame_oam -32, -11, $10, 0 | OAM_XFLIP
	frame_oam -16,   5, $2c, 0 | OAM_XFLIP
	frame_oam -16,  -3, $2e, 0 | OAM_XFLIP
	frame_oam -16, -11, $30, 0 | OAM_XFLIP
	db $80

.frame_7
	frame_oam -32,   5, $12, 0 | OAM_XFLIP
	frame_oam -32,  -3, $14, 0 | OAM_XFLIP
	frame_oam -32, -11, $16, 0 | OAM_XFLIP
	frame_oam -16,   5, $32, 0 | OAM_XFLIP
	frame_oam -16,  -3, $34, 0 | OAM_XFLIP
	frame_oam -16, -11, $36, 0 | OAM_XFLIP
	db $80

.frame_8
	frame_oam -32, -13, $00, 0
	frame_oam -32,  -5, $02, 0
	frame_oam -32,   3, $04, 0
	frame_oam -16, -13, $1e, 0
	frame_oam -16,   3, $3e, 0
	frame_oam -16,  -5, $22, 0
	db $80

.frame_9
	frame_oam -32, -13, $06, 0
	frame_oam -32,  -5, $08, 0
	frame_oam -32,   3, $0a, 0
	frame_oam -16, -13, $40, 0
	frame_oam -16,  -5, $42, 0
	frame_oam -16,   3, $44, 0
	db $80

.frame_10
	frame_oam -32, -13, $0c, 0
	frame_oam -32,  -5, $0e, 0
	frame_oam -32,   3, $10, 0
	frame_oam -16, -13, $46, 0
	frame_oam -16,  -5, $48, 0
	frame_oam -16,   3, $4a, 0
	db $80

.frame_11
	frame_oam -32, -13, $12, 0
	frame_oam -32,  -5, $14, 0
	frame_oam -32,   3, $16, 0
	frame_oam -16, -13, $4c, 0
	frame_oam -16,  -5, $4e, 0
	frame_oam -16,   3, $50, 0
	db $80

.frame_12
	frame_oam -32,   5, $00, 0 | OAM_XFLIP
	frame_oam -32,  -3, $02, 0 | OAM_XFLIP
	frame_oam -32, -11, $04, 0 | OAM_XFLIP
	frame_oam -16,   5, $1e, 0 | OAM_XFLIP
	frame_oam -16, -11, $3e, 0 | OAM_XFLIP
	frame_oam -16,  -3, $22, 0 | OAM_XFLIP
	db $80

.frame_13
	frame_oam -32,   5, $06, 0 | OAM_XFLIP
	frame_oam -32,  -3, $08, 0 | OAM_XFLIP
	frame_oam -32, -11, $0a, 0 | OAM_XFLIP
	frame_oam -16,   5, $40, 0 | OAM_XFLIP
	frame_oam -16,  -3, $42, 0 | OAM_XFLIP
	frame_oam -16, -11, $44, 0 | OAM_XFLIP
	db $80

.frame_14
	frame_oam -32,   5, $0c, 0 | OAM_XFLIP
	frame_oam -32,  -3, $0e, 0 | OAM_XFLIP
	frame_oam -32, -11, $10, 0 | OAM_XFLIP
	frame_oam -16,   5, $46, 0 | OAM_XFLIP
	frame_oam -16,  -3, $48, 0 | OAM_XFLIP
	frame_oam -16, -11, $4a, 0 | OAM_XFLIP
	db $80

.frame_15
	frame_oam -32,   5, $12, 0 | OAM_XFLIP
	frame_oam -32,  -3, $14, 0 | OAM_XFLIP
	frame_oam -32, -11, $16, 0 | OAM_XFLIP
	frame_oam -16,   5, $4c, 0 | OAM_XFLIP
	frame_oam -16,  -3, $4e, 0 | OAM_XFLIP
	frame_oam -16, -11, $50, 0 | OAM_XFLIP
	db $80

.frame_16
	frame_oam -32, -12, $52, 0
	frame_oam -32,  -4, $54, 0
	frame_oam -32,   4, $56, 0
	frame_oam -16, -12, $58, 0
	frame_oam -16,  -4, $5a, 0
	frame_oam -16,   4, $5c, 0
	db $80

.frame_17
	frame_oam -32, -12, $5e, 0
	frame_oam -32,  -4, $60, 0
	frame_oam -32,   4, $5e, 0 | OAM_XFLIP
	frame_oam -16, -12, $62, 0
	frame_oam -16,  -4, $64, 0
	frame_oam -16,   4, $62, 0 | OAM_XFLIP
	db $80

.frame_18
	frame_oam -32,   4, $52, 0 | OAM_XFLIP
	frame_oam -32,  -4, $54, 0 | OAM_XFLIP
	frame_oam -32, -12, $56, 0 | OAM_XFLIP
	frame_oam -16,   4, $58, 0 | OAM_XFLIP
	frame_oam -16,  -4, $5a, 0 | OAM_XFLIP
	frame_oam -16, -12, $5c, 0 | OAM_XFLIP
	db $80

.frame_19
	frame_oam -32, -13, $18, 0
	frame_oam -32,  -5, $1a, 0
	frame_oam -32,   3, $1c, 0
	frame_oam -16, -13, $38, 0
	frame_oam -16,  -5, $3a, 0
	frame_oam -16,   3, $3c, 0
	db $80

.frame_20
	frame_oam -32,   5, $18, 0 | OAM_XFLIP
	frame_oam -32,  -3, $1a, 0 | OAM_XFLIP
	frame_oam -32, -11, $1c, 0 | OAM_XFLIP
	frame_oam -16,   5, $38, 0 | OAM_XFLIP
	frame_oam -16,  -3, $3a, 0 | OAM_XFLIP
	frame_oam -16, -11, $3c, 0 | OAM_XFLIP
	db $80

.frame_21
	frame_oam -16, -13, $6a, 0
	frame_oam -16,  -5, $6c, 0
	frame_oam -16,   3, $6e, 0
	frame_oam -32,  -9, $66, 0
	frame_oam -32,  -1, $68, 0
	db $80

.frame_22
	frame_oam -16,   3, $74, 0
	frame_oam -16, -13, $76, 0
	frame_oam -16,  -5, $78, 0
	db $80

.frame_23
	frame_oam -16, -13, $70, 0
	frame_oam -16,  -5, $72, 0
	frame_oam -16,   3, $74, 0
	db $80

.frame_24
	frame_oam -16,  -5, $7c, 0 | OAM_XFLIP
	frame_oam -16, -13, $7e, 0 | OAM_XFLIP
	frame_oam -16,   3, $7e, 0
	frame_oam -28, -11, $66, 0
	frame_oam -28,  -3, $68, 0
	db $80

.frame_25
	frame_oam -17, -13, $7a, 0
	frame_oam -15,  -5, $7c, 0
	frame_oam -16,   3, $7a, 0 | OAM_XFLIP
	frame_oam -34, -11, $66, 0
	frame_oam -34,  -3, $68, 0
	db $80

.frame_26
	frame_oam -16, -13, $7a, 0
	frame_oam -16,  -5, $7c, 0 | OAM_XFLIP
	frame_oam -17,   3, $7a, 0 | OAM_XFLIP
	frame_oam -39, -10, $66, 0
	frame_oam -39,  -2, $68, 0
	db $80

.frame_27
	frame_oam -31,  -1, $66, 0 | OAM_XFLIP
	frame_oam -31,  -9, $68, 0 | OAM_XFLIP
	db $80

.frame_28
	frame_oam -25,   1, $66, 0 | OAM_XFLIP
	frame_oam -25,  -7, $68, 0 | OAM_XFLIP
	db $80

.frame_29
	frame_oam -21,  -1, $66, 0 | OAM_XFLIP
	frame_oam -21,  -9, $68, 0 | OAM_XFLIP
	db $80

.frame_30
	frame_oam -19, -10, $66, 0
	frame_oam -19,  -2, $68, 0
	db $80

.frame_31
	frame_oam -16, -11, $66, 0
	frame_oam -16,  -3, $68, 0
	db $80

.frame_32
	frame_oam -16,   5, $6a, 0 | OAM_XFLIP
	frame_oam -16,  -3, $6c, 0 | OAM_XFLIP
	frame_oam -16, -11, $6e, 0 | OAM_XFLIP
	frame_oam -32,   1, $66, 0 | OAM_XFLIP
	frame_oam -32,  -7, $68, 0 | OAM_XFLIP
	db $80

.frame_33
	frame_oam -16, -11, $74, 0 | OAM_XFLIP
	frame_oam -16,   5, $76, 0 | OAM_XFLIP
	frame_oam -16,  -3, $78, 0 | OAM_XFLIP
	db $80

.frame_34
	frame_oam -16,   5, $70, 0 | OAM_XFLIP
	frame_oam -16,  -3, $72, 0 | OAM_XFLIP
	frame_oam -16, -11, $74, 0 | OAM_XFLIP
	db $80

.frame_35
	frame_oam -16,  -3, $7c, 0
	frame_oam -16,   5, $7e, 0
	frame_oam -16, -11, $7e, 0 | OAM_XFLIP
	frame_oam -28,   3, $66, 0 | OAM_XFLIP
	frame_oam -28,  -5, $68, 0 | OAM_XFLIP
	db $80

.frame_36
	frame_oam -17,   5, $7a, 0 | OAM_XFLIP
	frame_oam -15,  -3, $7c, 0 | OAM_XFLIP
	frame_oam -16, -11, $7a, 0
	frame_oam -34,   3, $66, 0 | OAM_XFLIP
	frame_oam -34,  -5, $68, 0 | OAM_XFLIP
	db $80

.frame_37
	frame_oam -16,   5, $7a, 0 | OAM_XFLIP
	frame_oam -16,  -3, $7c, 0
	frame_oam -17, -11, $7a, 0
	frame_oam -39,   2, $66, 0 | OAM_XFLIP
	frame_oam -39,  -6, $68, 0 | OAM_XFLIP
	db $80

.frame_38
	frame_oam -31,  -7, $66, 0
	frame_oam -31,   1, $68, 0
	db $80

.frame_39
	frame_oam -25,  -9, $66, 0
	frame_oam -25,  -1, $68, 0
	db $80

.frame_40
	frame_oam -21,  -7, $66, 0
	frame_oam -21,   1, $68, 0
	db $80

.frame_41
	frame_oam -19,   2, $66, 0 | OAM_XFLIP
	frame_oam -19,  -6, $68, 0 | OAM_XFLIP
	db $80

.frame_42
	frame_oam -16,   3, $66, 0 | OAM_XFLIP
	frame_oam -16,  -5, $68, 0 | OAM_XFLIP
	db $80

.frame_43
	frame_oam -18, -11, $66, 0
	frame_oam -18,  -3, $68, 0
	db $80

.frame_44
	frame_oam -18,   3, $66, 0 | OAM_XFLIP
	frame_oam -18,  -5, $68, 0 | OAM_XFLIP
	db $80

.frame_45
	frame_oam -33, -14, $18, 0
	frame_oam -33,  -6, $1a, 0
	frame_oam -33,   2, $1c, 0
	frame_oam -17, -14, $38, 0
	frame_oam -17,  -6, $3a, 0
	frame_oam -17,   2, $3c, 0
	db $80

.frame_46
	frame_oam -33,   6, $18, 0 | OAM_XFLIP
	frame_oam -33,  -2, $1a, 0 | OAM_XFLIP
	frame_oam -33, -10, $1c, 0 | OAM_XFLIP
	frame_oam -17,   6, $38, 0 | OAM_XFLIP
	frame_oam -17,  -2, $3a, 0 | OAM_XFLIP
	frame_oam -17, -10, $3c, 0 | OAM_XFLIP
	db $80

Frameset_1fc870:
	db   1,  9
	db   2, 15
	db   3, 12
	db   0, 11
	db $ff

Frameset_1fc879:
	db   5,  9
	db   6, 15
	db   7, 12
	db   4, 11
	db $ff

Frameset_1fc882:
	db   8, 12
	db   9, 12
	db  10, 12
	db  11, 12
	db $ff

Frameset_1fc88b:
	db  12, 12
	db  13, 12
	db  14, 12
	db  15, 12
	db $ff

Frameset_1fc894:
	db   0,  1
	db  16,  8
	db  17,  8
	db  18,  8
	db $ff

Frameset_1fc89d:
	db   4,  1
	db  18,  8
	db  17,  8
	db  16,  8
	db $ff

Frameset_1fc8a6:
	db   0,  6
	db   1,  8
	db $ff

Frameset_1fc8ab:
	db   4,  6
	db   5,  8
	db $ff

Frameset_1fc8b0:
	db  19,  4
	db $ff

Frameset_1fc8b3:
	db  20,  4
	db $ff

Frameset_1fc8b6:
	db   0,  4
	db $ff

Frameset_1fc8b9:
	db   4,  4
	db $ff

Frameset_1fc8bc:
	db   1,  7
	db  21,  6
	db  23,  2
	db  22,  2
	db  24,  2
	db  25,  1
	db  26,  2
	db  24,  3
	db  27,  5
	db  28,  5
	db  29,  5
	db  30,  5
	db $ff

Frameset_1fc8d5:
	db   5,  7
	db  32,  6
	db  34,  2
	db  33,  2
	db  35,  2
	db  36,  1
	db  37,  2
	db  35,  3
	db  38,  5
	db  39,  5
	db  40,  5
	db  41,  5
	db $ff

Frameset_1fc8ee:
	db  31,  2
	db  43,  2
	db  31,  2
	db  43,  3
	db  31,  2
	db  43,  3
	db  22,  2
	db  23,  4
	db  21,  6
	db   8,  5
	db   9,  5
	db  10,  5
	db  11,  5
	db   0, 10
	db $ff

Frameset_1fc90b:
	db  42,  2
	db  44,  2
	db  42,  2
	db  44,  3
	db  42,  2
	db  44,  3
	db  33,  2
	db  33,  4
	db  32,  6
	db  12,  5
	db  13,  5
	db  14,  5
	db  15,  5
	db   4, 10
	db $ff

Frameset_1fc928:
	db  31,  4
	db $ff

Frameset_1fc92b:
	db  42,  4
	db $ff

Frameset_1fc92e:
	db   0,  1
	db   9,  3
	db  45,  5
	db  19,  2
	db  10,  3
	db   8,  3
	db $ff

Frameset_1fc93b:
	db   4,  1
	db  13,  3
	db  46,  5
	db  20,  2
	db  14,  3
	db  12,  3
	db $ff

Frameset_1fc948:
	db   1,  6
	db  21,  4
	db  23,  3
	db  22,  4
	db  21,  8
	db $ff

Frameset_1fc953:
	db   5,  6
	db  32,  4
	db  34,  3
	db  33,  4
	db  32,  8
	db $ff

OAM_1fc95e:
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
	frame_oam -16, -16, $00, 0
	frame_oam -16,  -8, $02, 0
	frame_oam -16,   8, $00, 0 | OAM_XFLIP
	frame_oam -16,   0, $02, 0 | OAM_XFLIP
	db $80

.frame_1
	frame_oam -16,   8, $04, 0 | OAM_XFLIP
	frame_oam -16,   0, $06, 0 | OAM_XFLIP
	frame_oam -16, -16, $04, 0
	frame_oam -16,  -8, $06, 0
	db $80

.frame_2
	frame_oam -21, -16, $08, 0
	frame_oam -21,  -8, $0a, 0
	frame_oam -21,   8, $08, 0 | OAM_XFLIP
	frame_oam -21,   0, $0a, 0 | OAM_XFLIP
	frame_oam  -5,  -8, $0c, 0
	frame_oam  -5,   0, $0c, 0 | OAM_XFLIP
	db $80

.frame_3
	frame_oam -28, -16, $0e, 0
	frame_oam -28,   8, $0e, 0 | OAM_XFLIP
	frame_oam -28,  -8, $12, 0
	frame_oam -28,   0, $12, 0 | OAM_XFLIP
	frame_oam -12,  -8, $14, 0
	frame_oam -12,   0, $14, 0 | OAM_XFLIP
	db $80

.frame_4
	frame_oam -30, -16, $10, 0
	frame_oam -30,  -8, $12, 0
	frame_oam -30,   8, $10, 0 | OAM_XFLIP
	frame_oam -30,   0, $12, 0 | OAM_XFLIP
	frame_oam -14,  -8, $16, 0
	frame_oam -14,   0, $16, 0 | OAM_XFLIP
	db $80

.frame_5
	frame_oam -32, -16, $10, 0
	frame_oam -32,  -8, $12, 0
	frame_oam -32,   8, $10, 0 | OAM_XFLIP
	frame_oam -32,   0, $12, 0 | OAM_XFLIP
	frame_oam -16,  -8, $18, 0
	frame_oam -16,   0, $18, 0 | OAM_XFLIP
	db $80

.frame_6
	frame_oam -32, -16, $10, 0
	frame_oam -32,  -8, $12, 0
	frame_oam -32,   8, $10, 0 | OAM_XFLIP
	frame_oam -32,   0, $12, 0 | OAM_XFLIP
	frame_oam -16,  -8, $16, 0
	frame_oam -16,   0, $16, 0 | OAM_XFLIP
	db $80

.frame_7
	frame_oam -32, -16, $0e, 0
	frame_oam -32,   8, $0e, 0 | OAM_XFLIP
	frame_oam -32,  -8, $12, 0
	frame_oam -32,   0, $12, 0 | OAM_XFLIP
	frame_oam -16,  -8, $14, 0
	frame_oam -16,   0, $14, 0 | OAM_XFLIP
	db $80

.frame_8
	frame_oam -32, -16, $08, 0
	frame_oam -32,  -8, $0a, 0
	frame_oam -32,   8, $08, 0 | OAM_XFLIP
	frame_oam -32,   0, $0a, 0 | OAM_XFLIP
	frame_oam -16,  -8, $0c, 0
	frame_oam -16,   0, $0c, 0 | OAM_XFLIP
	db $80

.frame_9
	frame_oam -36,   8, $04, 0 | OAM_XFLIP
	frame_oam -36,   0, $06, 0 | OAM_XFLIP
	frame_oam -36, -16, $04, 0
	frame_oam -36,  -8, $06, 0
	db $80

.frame_10
	frame_oam -38, -16, $00, 0
	frame_oam -38,  -8, $02, 0
	frame_oam -38,   8, $00, 0 | OAM_XFLIP
	frame_oam -38,   0, $02, 0 | OAM_XFLIP
	db $80

.frame_11
	frame_oam -48,  -6, $1a, 0
	frame_oam -48,   2, $1c, 0
	frame_oam -32, -17, $1e, 0
	frame_oam -32,  -9, $20, 0
	frame_oam -32,  -1, $22, 0
	frame_oam -32,   7, $24, 0
	frame_oam -16,  -9, $26, 0
	frame_oam -16,  -1, $28, 0
	frame_oam -16,   7, $2a, 0
	db $80

.frame_12
	frame_oam -48,  -6, $1a, 0
	frame_oam -48,   2, $1c, 0
	frame_oam -32, -17, $1e, 0
	frame_oam -32,  -9, $20, 0
	frame_oam -32,   7, $24, 0
	frame_oam -16,   7, $2a, 0
	frame_oam -16,  -9, $2e, 0
	frame_oam -16,  -1, $30, 0
	frame_oam -32,  -1, $2c, 0
	db $80

.frame_13
	frame_oam -36, -12, $32, 0
	frame_oam -36,  -4, $34, 0
	frame_oam -36,   4, $36, 0
	frame_oam -36,  12, $38, 0
	frame_oam -20,  -9, $3a, 0
	frame_oam -20,  -1, $3c, 0
	frame_oam -20,   7, $3e, 0
	frame_oam  -4, -12, $40, 0
	db $80

.frame_14
	frame_oam -15, -20, $42, 0
	frame_oam -24, -12, $44, 0
	frame_oam -32,  -4, $46, 0
	frame_oam -32,   4, $48, 0
	frame_oam -21,  12, $4a, 0
	frame_oam -16,  -4, $4c, 0
	frame_oam -16,   4, $4e, 0
	db $80

.frame_15
	frame_oam -31, -16, $50, 0
	frame_oam -31,  -8, $52, 0
	frame_oam -31,   0, $54, 0
	frame_oam -31,   8, $56, 0
	frame_oam -15, -13, $58, 0
	frame_oam -15,  -5, $5a, 0
	frame_oam -15,   3, $5c, 0
	frame_oam -15,  11, $5e, 0
	db $80

.frame_16
	frame_oam -16, -16, $10, 0 | OAM_YFLIP
	frame_oam -16,  -8, $12, 0 | OAM_YFLIP
	frame_oam -16,   8, $10, 0 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,   0, $12, 0 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,  -8, $18, 0 | OAM_YFLIP
	frame_oam -32,   0, $18, 0 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_17
	frame_oam -48,  -2, $1a, 0 | OAM_XFLIP
	frame_oam -48, -10, $1c, 0 | OAM_XFLIP
	frame_oam -32,   9, $1e, 0 | OAM_XFLIP
	frame_oam -32,   1, $20, 0 | OAM_XFLIP
	frame_oam -32,  -7, $22, 0 | OAM_XFLIP
	frame_oam -32, -15, $24, 0 | OAM_XFLIP
	frame_oam -16,   1, $26, 0 | OAM_XFLIP
	frame_oam -16,  -7, $28, 0 | OAM_XFLIP
	frame_oam -16, -15, $2a, 0 | OAM_XFLIP
	db $80

.frame_18
	frame_oam -48,  -2, $1a, 0 | OAM_XFLIP
	frame_oam -48, -10, $1c, 0 | OAM_XFLIP
	frame_oam -32,   9, $1e, 0 | OAM_XFLIP
	frame_oam -32,   1, $20, 0 | OAM_XFLIP
	frame_oam -32, -15, $24, 0 | OAM_XFLIP
	frame_oam -16, -15, $2a, 0 | OAM_XFLIP
	frame_oam -16,   1, $2e, 0 | OAM_XFLIP
	frame_oam -16,  -7, $30, 0 | OAM_XFLIP
	frame_oam -32,  -7, $2c, 0 | OAM_XFLIP
	db $80

.frame_19
	frame_oam -36,   4, $32, 0 | OAM_XFLIP
	frame_oam -36,  -4, $34, 0 | OAM_XFLIP
	frame_oam -36, -12, $36, 0 | OAM_XFLIP
	frame_oam -36, -20, $38, 0 | OAM_XFLIP
	frame_oam -20,   1, $3a, 0 | OAM_XFLIP
	frame_oam -20,  -7, $3c, 0 | OAM_XFLIP
	frame_oam -20, -15, $3e, 0 | OAM_XFLIP
	frame_oam  -4,   4, $40, 0 | OAM_XFLIP
	db $80

.frame_20
	frame_oam -15,  12, $42, 0 | OAM_XFLIP
	frame_oam -24,   4, $44, 0 | OAM_XFLIP
	frame_oam -32,  -4, $46, 0 | OAM_XFLIP
	frame_oam -32, -12, $48, 0 | OAM_XFLIP
	frame_oam -21, -20, $4a, 0 | OAM_XFLIP
	frame_oam -16,  -4, $4c, 0 | OAM_XFLIP
	frame_oam -16, -12, $4e, 0 | OAM_XFLIP
	db $80

.frame_21
	frame_oam -31,   8, $50, 0 | OAM_XFLIP
	frame_oam -31,   0, $52, 0 | OAM_XFLIP
	frame_oam -31,  -8, $54, 0 | OAM_XFLIP
	frame_oam -31, -16, $56, 0 | OAM_XFLIP
	frame_oam -15,   5, $58, 0 | OAM_XFLIP
	frame_oam -15,  -3, $5a, 0 | OAM_XFLIP
	frame_oam -15, -11, $5c, 0 | OAM_XFLIP
	frame_oam -15, -19, $5e, 0 | OAM_XFLIP
	db $80

.frame_22
	frame_oam -16, -16, $10, 0 | OAM_YFLIP
	frame_oam -16,  -8, $12, 0 | OAM_YFLIP
	frame_oam -16,   8, $10, 0 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,   0, $12, 0 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,  -8, $16, 0 | OAM_YFLIP
	frame_oam -32,   0, $16, 0 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_23
	frame_oam -16, -16, $0e, 0 | OAM_YFLIP
	frame_oam -16,   8, $0e, 0 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,  -8, $12, 0 | OAM_YFLIP
	frame_oam -16,   0, $12, 0 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,  -8, $14, 0 | OAM_YFLIP
	frame_oam -32,   0, $14, 0 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_24
	frame_oam -16, -16, $08, 0 | OAM_YFLIP
	frame_oam -16,  -8, $0a, 0 | OAM_YFLIP
	frame_oam -16,   8, $08, 0 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,   0, $0a, 0 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,  -8, $0c, 0 | OAM_YFLIP
	frame_oam -32,   0, $0c, 0 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_25
	frame_oam -12,   8, $04, 0 | OAM_XFLIP | OAM_YFLIP
	frame_oam -12,   0, $06, 0 | OAM_XFLIP | OAM_YFLIP
	frame_oam -12, -16, $04, 0 | OAM_YFLIP
	frame_oam -12,  -8, $06, 0 | OAM_YFLIP
	db $80

.frame_26
	frame_oam -10, -16, $00, 0 | OAM_YFLIP
	frame_oam -10,  -8, $02, 0 | OAM_YFLIP
	frame_oam -10,   8, $00, 0 | OAM_XFLIP | OAM_YFLIP
	frame_oam -10,   0, $02, 0 | OAM_XFLIP | OAM_YFLIP
	db $80

Frameset_1fcc5f:
	db   4,  1
	db   3,  1
	db   2,  1
	db   1,  2
	db   0,  7
	db   1,  2
	db $ff

Frameset_1fcc6c:
	db   2,  1
	db   3,  1
	db   4,  1
	db   5,  2
	db $ff

Frameset_1fcc75:
	db   6,  1
	db   7,  1
	db   8,  1
	db   9,  2
	db  10,  7
	db   9,  2
	db $ff

Frameset_1fcc82:
	db  16,  4
	db $ff

Frameset_1fcc85:
	db  22,  1
	db  23,  1
	db  24,  1
	db  25,  2
	db  26,  7
	db  25,  2
	db  24,  1
	db  23,  1
	db  22,  1
	db $ff

Frameset_1fcc98:
	db  16,  1
	db  21,  4
	db  20,  4
	db  19,  6
	db  17,  4
	db  18,  3
	db $ff

Frameset_1fcca5:
	db  16,  1
	db  15,  4
	db  14,  4
	db  13,  6
	db  11,  4
	db  12,  3
	db $ff

Frameset_1fccb2:
	db  11,  3
	db  12,  4
	db  13,  6
	db  14,  4
	db  15,  4
	db  16,  1
	db $ff

Frameset_1fccbf:
	db  17,  3
	db  18,  4
	db  19,  6
	db  20,  4
	db  21,  4
	db  16,  1
	db $ff

; unreferenced
Frameset_1fcccc:
	db   8,  2
	db   7,  1
	db   6,  1
	db   5,  4
	db $ff

OAM_1fccd5:
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

.frame_0
	frame_oam -32, -16, $00, 0
	frame_oam -32,  -8, $02, 0
	frame_oam -32,   0, $04, 0
	frame_oam -32,   8, $06, 0
	frame_oam -16,  -8, $08, 0
	frame_oam -16,   0, $0a, 0
	frame_oam -16,   8, $0c, 0
	frame_oam -16,  16, $0e, 0
	db $80

.frame_1
	frame_oam -32, -16, $10, 0
	frame_oam -32,  -8, $12, 0
	frame_oam -32,   0, $14, 0
	frame_oam -32,   8, $16, 0
	frame_oam -16,  -8, $18, 0
	frame_oam -16,   0, $1a, 0
	frame_oam -16,   8, $1c, 0
	frame_oam -16,  16, $1e, 0
	db $80

.frame_2
	frame_oam -32, -15, $20, 0
	frame_oam -32,  -7, $22, 0
	frame_oam -32,   1, $24, 0
	frame_oam -32,   9, $26, 0
	frame_oam -16,  -9, $28, 0
	frame_oam -16,  -1, $2a, 0
	frame_oam -16,   7, $2c, 0
	frame_oam -16,  15, $2e, 0
	db $80

.frame_3
	frame_oam -32, -16, $30, 0
	frame_oam -32,  -8, $32, 0
	frame_oam -32,   0, $34, 0
	frame_oam -32,   8, $36, 0
	frame_oam -16,  -8, $38, 0
	frame_oam -16,   0, $3a, 0
	frame_oam -16,   8, $3c, 0
	frame_oam -18,  16, $3e, 0
	db $80

.frame_4
	frame_oam -32, -16, $00, 0
	frame_oam -32,   8, $06, 0
	frame_oam -16,  -8, $08, 0
	frame_oam -16,   0, $0a, 0
	frame_oam -16,   8, $0c, 0
	frame_oam -16,  16, $0e, 0
	frame_oam -32,  -8, $40, 0
	frame_oam -32,   0, $42, 0
	db $80

.frame_5
	frame_oam -32, -16, $10, 0
	frame_oam -32,   8, $16, 0
	frame_oam -16,  -8, $18, 0
	frame_oam -16,   0, $1a, 0
	frame_oam -16,   8, $1c, 0
	frame_oam -16,  16, $1e, 0
	frame_oam -32,  -8, $44, 0
	frame_oam -32,   0, $46, 0
	db $80

.frame_6
	frame_oam -32, -15, $20, 0
	frame_oam -32,   9, $26, 0
	frame_oam -16,  -9, $28, 0
	frame_oam -16,  -1, $2a, 0
	frame_oam -16,   7, $2c, 0
	frame_oam -16,  15, $2e, 0
	frame_oam -32,  -7, $48, 0
	frame_oam -32,   1, $4a, 0
	db $80

.frame_7
	frame_oam -32, -16, $30, 0
	frame_oam -32,   8, $36, 0
	frame_oam -16,  -8, $38, 0
	frame_oam -16,   0, $3a, 0
	frame_oam -16,   8, $3c, 0
	frame_oam -18,  16, $3e, 0
	frame_oam -32,  -8, $4c, 0
	frame_oam -32,   0, $4e, 0
	db $80

.frame_8
	frame_oam -32, -16, $50, 0
	frame_oam -32,  -8, $52, 0
	frame_oam -16, -16, $54, 0
	frame_oam -16,  -8, $56, 0
	frame_oam -32,   8, $50, 0 | OAM_XFLIP
	frame_oam -32,   0, $52, 0 | OAM_XFLIP
	frame_oam -16,   8, $54, 0 | OAM_XFLIP
	frame_oam -16,   0, $56, 0 | OAM_XFLIP
	db $80

.frame_9
	frame_oam -32,   8, $00, 0 | OAM_XFLIP
	frame_oam -32,   0, $02, 0 | OAM_XFLIP
	frame_oam -32,  -8, $04, 0 | OAM_XFLIP
	frame_oam -32, -16, $06, 0 | OAM_XFLIP
	frame_oam -16,   0, $08, 0 | OAM_XFLIP
	frame_oam -16,  -8, $0a, 0 | OAM_XFLIP
	frame_oam -16, -16, $0c, 0 | OAM_XFLIP
	frame_oam -16, -24, $0e, 0 | OAM_XFLIP
	db $80

.frame_10
	frame_oam -32,   8, $10, 0 | OAM_XFLIP
	frame_oam -32,   0, $12, 0 | OAM_XFLIP
	frame_oam -32,  -8, $14, 0 | OAM_XFLIP
	frame_oam -32, -16, $16, 0 | OAM_XFLIP
	frame_oam -16,   0, $18, 0 | OAM_XFLIP
	frame_oam -16,  -8, $1a, 0 | OAM_XFLIP
	frame_oam -16, -16, $1c, 0 | OAM_XFLIP
	frame_oam -16, -24, $1e, 0 | OAM_XFLIP
	db $80

.frame_11
	frame_oam -32,   7, $20, 0 | OAM_XFLIP
	frame_oam -32,  -1, $22, 0 | OAM_XFLIP
	frame_oam -32,  -9, $24, 0 | OAM_XFLIP
	frame_oam -32, -17, $26, 0 | OAM_XFLIP
	frame_oam -16,   1, $28, 0 | OAM_XFLIP
	frame_oam -16,  -7, $2a, 0 | OAM_XFLIP
	frame_oam -16, -15, $2c, 0 | OAM_XFLIP
	frame_oam -16, -23, $2e, 0 | OAM_XFLIP
	db $80

.frame_12
	frame_oam -32,   8, $30, 0 | OAM_XFLIP
	frame_oam -32,   0, $32, 0 | OAM_XFLIP
	frame_oam -32,  -8, $34, 0 | OAM_XFLIP
	frame_oam -32, -16, $36, 0 | OAM_XFLIP
	frame_oam -16,   0, $38, 0 | OAM_XFLIP
	frame_oam -16,  -8, $3a, 0 | OAM_XFLIP
	frame_oam -16, -16, $3c, 0 | OAM_XFLIP
	frame_oam -18, -24, $3e, 0 | OAM_XFLIP
	db $80

.frame_13
	frame_oam -32,   8, $00, 0 | OAM_XFLIP
	frame_oam -32, -16, $06, 0 | OAM_XFLIP
	frame_oam -16,   0, $08, 0 | OAM_XFLIP
	frame_oam -16,  -8, $0a, 0 | OAM_XFLIP
	frame_oam -16, -16, $0c, 0 | OAM_XFLIP
	frame_oam -16, -24, $0e, 0 | OAM_XFLIP
	frame_oam -32,   0, $40, 0 | OAM_XFLIP
	frame_oam -32,  -8, $42, 0 | OAM_XFLIP
	db $80

.frame_14
	frame_oam -32,   8, $10, 0 | OAM_XFLIP
	frame_oam -32, -16, $16, 0 | OAM_XFLIP
	frame_oam -16,   0, $18, 0 | OAM_XFLIP
	frame_oam -16,  -8, $1a, 0 | OAM_XFLIP
	frame_oam -16, -16, $1c, 0 | OAM_XFLIP
	frame_oam -16, -24, $1e, 0 | OAM_XFLIP
	frame_oam -32,   0, $44, 0 | OAM_XFLIP
	frame_oam -32,  -8, $46, 0 | OAM_XFLIP
	db $80

.frame_15
	frame_oam -32,   7, $20, 0 | OAM_XFLIP
	frame_oam -32, -17, $26, 0 | OAM_XFLIP
	frame_oam -16,   1, $28, 0 | OAM_XFLIP
	frame_oam -16,  -7, $2a, 0 | OAM_XFLIP
	frame_oam -16, -15, $2c, 0 | OAM_XFLIP
	frame_oam -16, -23, $2e, 0 | OAM_XFLIP
	frame_oam -32,  -1, $48, 0 | OAM_XFLIP
	frame_oam -32,  -9, $4a, 0 | OAM_XFLIP
	db $80

.frame_16
	frame_oam -32,   8, $30, 0 | OAM_XFLIP
	frame_oam -32, -16, $36, 0 | OAM_XFLIP
	frame_oam -16,   0, $38, 0 | OAM_XFLIP
	frame_oam -16,  -8, $3a, 0 | OAM_XFLIP
	frame_oam -16, -16, $3c, 0 | OAM_XFLIP
	frame_oam -18, -24, $3e, 0 | OAM_XFLIP
	frame_oam -32,   0, $4c, 0 | OAM_XFLIP
	frame_oam -32,  -8, $4e, 0 | OAM_XFLIP
	db $80

.frame_17
	frame_oam -26, -20, $58, 0
	frame_oam -32, -12, $5a, 0
	frame_oam -32,  -4, $5c, 0
	frame_oam -32,   4, $5e, 0
	frame_oam -16, -12, $60, 0
	frame_oam -16,  -4, $62, 0
	frame_oam -16,   4, $64, 0
	frame_oam -16,  12, $66, 0
	db $80

.frame_18
	frame_oam -26,  12, $58, 0 | OAM_XFLIP
	frame_oam -32,   4, $5a, 0 | OAM_XFLIP
	frame_oam -32,  -4, $5c, 0 | OAM_XFLIP
	frame_oam -32, -12, $5e, 0 | OAM_XFLIP
	frame_oam -16,   4, $60, 0 | OAM_XFLIP
	frame_oam -16,  -4, $62, 0 | OAM_XFLIP
	frame_oam -16, -12, $64, 0 | OAM_XFLIP
	frame_oam -16, -20, $66, 0 | OAM_XFLIP
	db $80

Frameset_1fcf6e:
	db   0,  3
	db   1,  3
	db   2,  3
	db   3,  3
	db   0,  3
	db   1,  3
	db   2,  3
	db   3,  3
	db   0,  3
	db   4,  2
	db   1,  3
	db   5,  2
	db   2,  3
	db   6,  2
	db   3,  3
	db   7,  2
	db   0,  3
	db   4,  2
	db   1,  3
	db   5,  2
	db   2,  3
	db   6,  2
	db   3,  3
	db   7,  2
	db $ff

Frameset_1fcf9f:
	db   9,  3
	db  10,  3
	db  11,  3
	db  12,  3
	db   9,  3
	db  10,  3
	db  11,  3
	db  12,  3
	db   9,  3
	db  13,  2
	db  10,  3
	db  14,  2
	db  11,  3
	db  15,  2
	db  12,  3
	db  16,  2
	db   9,  3
	db  13,  2
	db  10,  3
	db  14,  2
	db  11,  3
	db  15,  2
	db  12,  3
	db  16,  2
	db $ff

Frameset_1fcfd0:
	db  17,  3
	db   8,  3
	db  18,  3
	db $ff

Frameset_1fcfd7:
	db  18,  3
	db   8,  3
	db  17,  3
	db $ff

; unreferenced
Frameset_1fcfde:
	db   0,  3
	db   4,  2
	db   1,  3
	db   5,  2
	db   2,  3
	db   6,  2
	db   3,  3
	db   7,  2
	db $ff

; unreferenced
Frameset_1fcfef:
	db   9,  3
	db  13,  2
	db  10,  3
	db  14,  2
	db  11,  3
	db  15,  2
	db  12,  3
	db  16,  2
	db $ff

; unreferenced
Frameset_1fd000:
	db   9,  3
	db  10,  3
	db  11,  3
	db  12,  3
	db   9,  3
	db  10,  3
	db  11,  3
	db  12,  3
	db   9,  3
	db  13,  2
	db  10,  3
	db  14,  2
	db  11,  3
	db  15,  2
	db  12,  3
	db  16,  2
	db   9,  3
	db  13,  2
	db  10,  3
	db  14,  2
	db  11,  3
	db  15,  2
	db  12,  3
	db  16,  2
	db $ff

OAM_1fd031::
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
	frame_oam -29, -16, $64, 0
	frame_oam -13, -16, $66, 0
	frame_oam -29,   8, $64, 0 | OAM_XFLIP
	frame_oam -13,   8, $66, 0 | OAM_XFLIP
	frame_oam -29,  -8, $42, 0
	frame_oam -29,   0, $42, 0 | OAM_XFLIP
	frame_oam -13,  -8, $68, 0
	frame_oam -13,   0, $68, 0 | OAM_XFLIP
	db $80

.frame_1
	frame_oam -29, -16, $64, 0
	frame_oam -13, -16, $66, 0
	frame_oam -29,  -8, $42, 0
	frame_oam -13,  -8, $68, 0
	frame_oam -29,   8, $64, 0 | OAM_XFLIP
	frame_oam -29,   0, $42, 0 | OAM_XFLIP
	frame_oam -13,   0, $72, 0
	frame_oam -13,   8, $74, 1
	frame_oam -13,  16, $76, 1
	db $80

.frame_2
	frame_oam -29, -16, $64, 0
	frame_oam -13, -16, $66, 0
	frame_oam -29,  -8, $42, 0
	frame_oam -29,   0, $42, 0 | OAM_XFLIP
	frame_oam -13,  -8, $68, 0
	frame_oam -30,   8, $6a, 0
	frame_oam -13,   0, $6c, 1
	frame_oam -14,   8, $6e, 1
	frame_oam -25,  16, $70, 1
	db $80

.frame_3
	frame_oam -26, -16, $40, 0
	frame_oam -26,  -8, $42, 0
	frame_oam -26,   0, $42, 0 | OAM_XFLIP
	frame_oam -10, -16, $44, 0
	frame_oam -10,  -8, $46, 0
	frame_oam -32,   8, $48, 0
	frame_oam -21,  16, $4e, 1
	frame_oam -10,   0, $4a, 1
	frame_oam -16,   8, $4c, 1
	db $80

.frame_4
	frame_oam -32, -16, $50, 0
	frame_oam -24,  -8, $42, 0
	frame_oam -24,   0, $42, 0 | OAM_XFLIP
	frame_oam -25,   8, $58, 0
	frame_oam -16, -16, $54, 0
	frame_oam  -8,  -8, $56, 0
	frame_oam  -8,   0, $5a, 1
	frame_oam  -9,   8, $5c, 1
	frame_oam -16,  16, $5e, 1
	db $80

.frame_5
	frame_oam -32, -16, $50, 0
	frame_oam -24,  -8, $42, 0
	frame_oam -32,   0, $52, 0 | OAM_XFLIP
	frame_oam -16, -16, $54, 0
	frame_oam  -8,  -8, $56, 0
	frame_oam -32,   8, $50, 0 | OAM_XFLIP
	frame_oam -16,   0, $60, 0
	frame_oam -16,   8, $62, 0
	db $80

.frame_6
	frame_oam -16,  -8, $00, 1
	frame_oam -16,   0, $00, 1 | OAM_XFLIP
	frame_oam -32, -16, $50, 0
	frame_oam -32,  -8, $52, 0
	frame_oam -32,   0, $52, 0 | OAM_XFLIP
	frame_oam -16, -16, $54, 0
	frame_oam -32,   8, $50, 0 | OAM_XFLIP
	frame_oam -16,   8, $62, 0
	db $80

.frame_7
	frame_oam -16, -12, $02, 1
	frame_oam -16,  -4, $04, 1
	frame_oam -16,   4, $02, 1 | OAM_XFLIP
	frame_oam -32, -16, $50, 0
	frame_oam -32,  -8, $52, 0
	frame_oam -32,   0, $52, 0 | OAM_XFLIP
	frame_oam -16, -16, $54, 0
	frame_oam -32,   8, $50, 0 | OAM_XFLIP
	frame_oam -16,   8, $62, 0
	db $80

.frame_8
	frame_oam -16,  -6, $0a, 1
	frame_oam -16,   2, $0c, 1
	frame_oam -16,  10, $0e, 1
	frame_oam -32,  -6, $06, 1
	frame_oam -32,   2, $06, 1 | OAM_XFLIP
	frame_oam -16, -14, $08, 1
	db $80

.frame_9
	frame_oam -32,  -4, $12, 1
	frame_oam -32,   4, $14, 1
	frame_oam -16,   4, $1a, 1
	frame_oam -32, -12, $10, 1
	frame_oam -32,  12, $0e, 1
	frame_oam -16, -12, $16, 1
	frame_oam -16,  -4, $18, 1
	frame_oam -14,  12, $0e, 1
	db $80

.frame_10
	frame_oam -37, -11, $1c, 1
	frame_oam -37,  -3, $1e, 1
	frame_oam -37,   5, $20, 1
	frame_oam -13, -12, $22, 1
	frame_oam -21,  -4, $24, 1
	frame_oam -13,   6, $26, 1
	db $80

.frame_11
	frame_oam -44,   4, $26, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -41, -12, $28, 1
	frame_oam -41,  -4, $2a, 1
	frame_oam -42,  12, $2c, 1
	frame_oam -25,  -8, $2c, 1
	frame_oam -25,   6, $2e, 1
	frame_oam -16,  -8, $32, 1
	frame_oam -16,   0, $32, 1 | OAM_XFLIP
	db $80

.frame_12
	frame_oam -26,  -8, $2c, 1
	frame_oam -26,   6, $2e, 1
	frame_oam -16,  -8, $34, 1
	frame_oam -16,   0, $34, 1 | OAM_XFLIP
	frame_oam -42,   4, $2a, 1 | OAM_XFLIP
	frame_oam -44,  -4, $2e, 1 | OAM_XFLIP
	frame_oam -42, -12, $2e, 1 | OAM_YFLIP
	db $80

.frame_13
	frame_oam -20, -14, $36, 0
	frame_oam -20,  -6, $38, 0
	frame_oam -20,   2, $3a, 0
	frame_oam -20,  10, $3c, 0
	frame_oam  -4,   2, $3e, 0 | OAM_XFLIP
	frame_oam  -4,  -6, $3e, 0
	frame_oam -38,   4, $2c, 1 | OAM_YFLIP
	frame_oam -52,  -4, $2e, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -38, -12, $30, 1
	frame_oam -54,   6, $30, 1
	db $80

.frame_14
	frame_oam -20, -14, $36, 0
	frame_oam -20,  -6, $38, 0
	frame_oam -20,   2, $3a, 0
	frame_oam -20,  10, $3c, 0
	frame_oam  -4,  -6, $3e, 0
	frame_oam  -4,   2, $3e, 0 | OAM_XFLIP
	db $80

.frame_15
	frame_oam -22,  -6, $38, 0
	frame_oam -22,   2, $3a, 0
	frame_oam  -6,  -6, $3e, 0
	frame_oam  -6,   2, $3e, 0 | OAM_XFLIP
	frame_oam -12,  10, $7a, 0
	frame_oam -12, -14, $78, 0
	db $80

.frame_16
	frame_oam -20,   6, $36, 0 | OAM_XFLIP
	frame_oam -20,  -2, $38, 0 | OAM_XFLIP
	frame_oam -20, -10, $3a, 0 | OAM_XFLIP
	frame_oam -20, -18, $3c, 0 | OAM_XFLIP
	frame_oam  -4,  -2, $3e, 0 | OAM_XFLIP
	frame_oam  -4, -10, $3e, 0
	db $80

.frame_17
	frame_oam -22,  -2, $38, 0 | OAM_XFLIP
	frame_oam -22, -10, $3a, 0 | OAM_XFLIP
	frame_oam  -6,  -2, $3e, 0 | OAM_XFLIP
	frame_oam  -6, -10, $3e, 0
	frame_oam -12, -18, $7a, 0 | OAM_XFLIP
	frame_oam -12,   6, $78, 0 | OAM_XFLIP
	db $80

.frame_18
	frame_oam -16,  -8, $34, 1
	frame_oam -16,   0, $34, 1 | OAM_XFLIP
	db $80

.frame_19
	frame_oam -16,  -8, $7c, 1
	frame_oam -16,   0, $7c, 1 | OAM_XFLIP
	frame_oam -16, -16, $36, 0
	frame_oam -16,   8, $3c, 0
	db $80

.frame_20
	frame_oam -16, -12, $02, 1
	frame_oam -16,  -4, $04, 1
	frame_oam -16,   4, $02, 1 | OAM_XFLIP
	db $80

.frame_21
	frame_oam -16,  -8, $34, 1
	frame_oam -16,   0, $34, 1 | OAM_XFLIP
	frame_oam -37, -11, $1c, 1
	frame_oam -37,  -3, $1e, 1
	frame_oam -37,   5, $20, 1
	frame_oam -13, -12, $22, 1
	frame_oam -13,   6, $26, 1
	frame_oam -21,  -3, $7e, 1
	db $80

.frame_22
	frame_oam -32, -16, $50, 1
	frame_oam -24,  -8, $42, 1
	frame_oam -32,   0, $52, 1 | OAM_XFLIP
	frame_oam -16, -16, $54, 1
	frame_oam  -8,  -8, $56, 1
	frame_oam -32,   8, $50, 1 | OAM_XFLIP
	frame_oam -16,   0, $60, 1
	frame_oam -16,   8, $62, 1
	frame_oam -44,   4, $26, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -41, -12, $28, 1
	frame_oam -41,  -4, $2a, 1
	frame_oam -42,  12, $2c, 1
	db $80

.frame_23
	frame_oam -42,   4, $2a, 1 | OAM_XFLIP
	frame_oam -44,  -4, $2e, 1 | OAM_XFLIP
	frame_oam -42, -12, $2e, 1 | OAM_YFLIP
	frame_oam -32, -16, $50, 0
	frame_oam -24,  -8, $42, 0
	frame_oam -32,   0, $52, 0 | OAM_XFLIP
	frame_oam -16, -16, $54, 0
	frame_oam  -8,  -8, $56, 0
	frame_oam -32,   8, $50, 0 | OAM_XFLIP
	frame_oam -16,   0, $60, 0
	frame_oam -16,   8, $62, 0
	db $80

.frame_24
	frame_oam -52,  -4, $2e, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -54,   6, $30, 1
	frame_oam -32, -16, $50, 0
	frame_oam -24,  -8, $42, 0
	frame_oam -32,   0, $52, 0 | OAM_XFLIP
	frame_oam -16, -16, $54, 0
	frame_oam  -8,  -8, $56, 0
	frame_oam -32,   8, $50, 0 | OAM_XFLIP
	frame_oam -16,   0, $60, 0
	frame_oam -16,   8, $62, 0
	db $80

.frame_25
	frame_oam -29, -16, $64, 0
	frame_oam -13, -16, $66, 0
	frame_oam -29,  -8, $42, 0
	frame_oam -13,  -8, $68, 0
	frame_oam -29,   8, $64, 0 | OAM_XFLIP
	frame_oam -29,   0, $42, 0 | OAM_XFLIP
	frame_oam -13,   0, $72, 0
	frame_oam -13,   8, $74, 1
	frame_oam -24,  15, $76, 1 | OAM_YFLIP
	db $80

.frame_26
	frame_oam -17,  -6, $38, 0
	frame_oam -17,   2, $3a, 0
	frame_oam -16,  10, $40, 0 | OAM_XFLIP
	frame_oam -16, -14, $40, 0
	db $80

.frame_27
	frame_oam -16,  -6, $38, 0
	frame_oam -16,   2, $3a, 0
	frame_oam -10,  10, $44, 0 | OAM_XFLIP
	frame_oam -10, -14, $44, 0
	db $80

.frame_28
	frame_oam -17,  -2, $38, 0 | OAM_XFLIP
	frame_oam -17, -10, $3a, 0 | OAM_XFLIP
	frame_oam -16, -18, $40, 0
	frame_oam -16,   6, $40, 0 | OAM_XFLIP
	db $80

.frame_29
	frame_oam -16,  -2, $38, 0 | OAM_XFLIP
	frame_oam -16, -10, $3a, 0 | OAM_XFLIP
	frame_oam -10, -18, $44, 0
	frame_oam -10,   6, $44, 0 | OAM_XFLIP
	db $80

.frame_30
	frame_oam -20,   6, $36, 0 | OAM_XFLIP
	frame_oam -20,  -2, $38, 0 | OAM_XFLIP
	frame_oam -20, -10, $3a, 0 | OAM_XFLIP
	frame_oam -20, -18, $3c, 0 | OAM_XFLIP
	frame_oam  -4, -10, $3e, 0
	frame_oam  -4,  -2, $3e, 0 | OAM_XFLIP
	frame_oam -38,   4, $2c, 1 | OAM_YFLIP
	frame_oam -52,  -4, $2e, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -38, -12, $30, 1
	frame_oam -54,   6, $30, 1
	db $80

Frameset_1fd40a:
	db   0,  1
	db   1,  8
	db   2,  8
	db   3,  6
	db   4,  6
	db   5,  4
	db   6,  4
	db   7,  6
	db   8,  7
	db   9, 10
	db  10, 10
	db  11,  8
	db  12,  8
	db  13,  8
	db  14,  1
	db $ff

; unreferenced
Frameset_1fd429:
	db  14,  4
	db $ff

Frameset_1fd42c::
	db  14,  3
	db  15,  4
	db $ff

; unreferenced
Frameset_1fd431:
	db  16,  4
	db $ff

Frameset_1fd434:
	db  16,  3
	db  17,  4
	db $ff

Frameset_1fd439::
	db  19,  4
	db  20,  6
	db   8,  7
	db   9, 10
	db  21, 10
	db  11,  2
	db  22,  1
	db  11,  2
	db  22,  1
	db  11,  2
	db  22,  1
	db  23,  6
	db  24,  5
	db  25,  3
	db   2, 12
	db  25, 10
	db   0,  1
	db $ff

; unreferenced
Frameset_1fd45c:
	db   0,  4
	db $ff

Frameset_1fd45f:
	db  26,  8
	db  14,  5
	db  27,  3
	db  26,  2
	db  14,  5
	db  27,  4
	db $ff

Frameset_1fd46c::
	db  28,  8
	db  16,  5
	db  29,  3
	db  28,  2
	db  16,  5
	db  29,  4
	db $ff

Frameset_1fd479::
	db   0,  1
	db   1,  8
	db   2,  8
	db   3,  6
	db   4,  6
	db   5,  4
	db   6,  4
	db   7,  6
	db   8,  7
	db   9, 10
	db  10, 10
	db  11,  8
	db  12,  8
	db  30,  8
	db  16,  1
	db $ff

OAM_1fd498::
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
	frame_oam  -8,  -8, $08, 0
	frame_oam  -8,   0, $0a, 0
	frame_oam -40, -12, $00, 0
	frame_oam -40,  -4, $02, 0
	frame_oam -24, -12, $04, 0
	frame_oam -24,  -4, $06, 0
	frame_oam -40,   4, $00, 0 | OAM_XFLIP
	frame_oam -24,   4, $04, 0 | OAM_XFLIP
	db $80

.frame_1
	frame_oam  -9,  -8, $0c, 0
	frame_oam  -9,   0, $0e, 0
	frame_oam -41, -12, $00, 0
	frame_oam -41,  -4, $02, 0
	frame_oam -25, -12, $04, 0
	frame_oam -25,  -4, $06, 0
	frame_oam -41,   4, $00, 0 | OAM_XFLIP
	frame_oam -25,   4, $04, 0 | OAM_XFLIP
	db $80

.frame_2
	frame_oam -10,  -8, $10, 0
	frame_oam -10,   0, $12, 0
	frame_oam -42, -12, $00, 0
	frame_oam -42,  -4, $02, 0
	frame_oam -26, -12, $04, 0
	frame_oam -26,  -4, $06, 0
	frame_oam -42,   4, $00, 0 | OAM_XFLIP
	frame_oam -26,   4, $04, 0 | OAM_XFLIP
	db $80

.frame_3
	frame_oam  -9,  -8, $14, 0
	frame_oam  -9,   0, $16, 0
	frame_oam -41, -12, $00, 0
	frame_oam -41,  -4, $02, 0
	frame_oam -25, -12, $04, 0
	frame_oam -25,  -4, $06, 0
	frame_oam -41,   4, $00, 0 | OAM_XFLIP
	frame_oam -25,   4, $04, 0 | OAM_XFLIP
	db $80

.frame_4
	frame_oam -40,  -9, $18, 0
	frame_oam -40,  -1, $1a, 0
	frame_oam -24, -12, $1c, 0
	frame_oam -24,  -4, $1e, 0
	frame_oam -24,   4, $20, 0
	frame_oam  -8,  -8, $08, 0
	frame_oam  -8,   0, $0a, 0
	db $80

.frame_5
	frame_oam -41,  -9, $18, 0
	frame_oam -41,  -1, $1a, 0
	frame_oam -25, -12, $1c, 0
	frame_oam -25,  -4, $1e, 0
	frame_oam -25,   4, $20, 0
	frame_oam  -9,  -8, $0c, 0
	frame_oam  -9,   0, $0e, 0
	db $80

.frame_6
	frame_oam -42,  -9, $18, 0
	frame_oam -42,  -1, $1a, 0
	frame_oam -26, -12, $1c, 0
	frame_oam -26,  -4, $1e, 0
	frame_oam -26,   4, $20, 0
	frame_oam -10,  -8, $10, 0
	frame_oam -10,   0, $12, 0
	db $80

.frame_7
	frame_oam -41,  -9, $18, 0
	frame_oam -41,  -1, $1a, 0
	frame_oam -25, -12, $1c, 0
	frame_oam -25,  -4, $1e, 0
	frame_oam -25,   4, $20, 0
	frame_oam  -9,  -8, $14, 0
	frame_oam  -9,   0, $16, 0
	db $80

.frame_8
	frame_oam -40,   1, $18, 0 | OAM_XFLIP
	frame_oam -40,  -7, $1a, 0 | OAM_XFLIP
	frame_oam -24,   4, $1c, 0 | OAM_XFLIP
	frame_oam -24,  -4, $1e, 0 | OAM_XFLIP
	frame_oam -24, -12, $20, 0 | OAM_XFLIP
	frame_oam  -8,  -8, $08, 0
	frame_oam  -8,   0, $0a, 0
	db $80

.frame_9
	frame_oam -41,   1, $18, 0 | OAM_XFLIP
	frame_oam -41,  -7, $1a, 0 | OAM_XFLIP
	frame_oam -25,   4, $1c, 0 | OAM_XFLIP
	frame_oam -25,  -4, $1e, 0 | OAM_XFLIP
	frame_oam -25, -12, $20, 0 | OAM_XFLIP
	frame_oam  -9,  -8, $0c, 0
	frame_oam  -9,   0, $0e, 0
	db $80

.frame_10
	frame_oam -42,   1, $18, 0 | OAM_XFLIP
	frame_oam -42,  -7, $1a, 0 | OAM_XFLIP
	frame_oam -26,   4, $1c, 0 | OAM_XFLIP
	frame_oam -26,  -4, $1e, 0 | OAM_XFLIP
	frame_oam -26, -12, $20, 0 | OAM_XFLIP
	frame_oam -10,  -8, $10, 0
	frame_oam -10,   0, $12, 0
	db $80

.frame_11
	frame_oam -41,   1, $18, 0 | OAM_XFLIP
	frame_oam -41,  -7, $1a, 0 | OAM_XFLIP
	frame_oam -25,   4, $1c, 0 | OAM_XFLIP
	frame_oam -25,  -4, $1e, 0 | OAM_XFLIP
	frame_oam -25, -12, $20, 0 | OAM_XFLIP
	frame_oam  -9,  -8, $14, 0
	frame_oam  -9,   0, $16, 0
	db $80

.frame_12
	frame_oam -40, -12, $22, 0
	frame_oam -40,  -4, $24, 0
	frame_oam -40,   4, $26, 0
	frame_oam -24, -12, $28, 0
	frame_oam -24,  -4, $2a, 0
	frame_oam -24,   4, $2c, 0
	frame_oam  -8,  -8, $08, 0
	frame_oam  -8,   0, $0a, 0
	db $80

.frame_13
	frame_oam -40,   4, $22, 0 | OAM_XFLIP
	frame_oam -40,  -4, $24, 0 | OAM_XFLIP
	frame_oam -40, -12, $26, 0 | OAM_XFLIP
	frame_oam -24,   4, $28, 0 | OAM_XFLIP
	frame_oam -24,  -4, $2a, 0 | OAM_XFLIP
	frame_oam -24, -12, $2c, 0 | OAM_XFLIP
	frame_oam  -8,  -8, $08, 0
	frame_oam  -8,   0, $0a, 0
	db $80

.frame_14
	frame_oam -40, -12, $2e, 0
	frame_oam -40,  -4, $30, 0
	frame_oam -40,   4, $32, 0
	frame_oam -24, -12, $34, 0
	frame_oam -24,  -4, $36, 0
	frame_oam -24,   4, $38, 0
	frame_oam  -8,  -8, $08, 0
	frame_oam  -8,   0, $0a, 0
	db $80

.frame_15
	frame_oam -41, -12, $2e, 0
	frame_oam -41,  -4, $30, 0
	frame_oam -41,   4, $32, 0
	frame_oam -25, -12, $34, 0
	frame_oam -25,  -4, $36, 0
	frame_oam -25,   4, $38, 0
	frame_oam  -9,  -8, $0c, 0
	frame_oam  -9,   0, $0e, 0
	db $80

.frame_16
	frame_oam -42, -12, $2e, 0
	frame_oam -42,  -4, $30, 0
	frame_oam -42,   4, $32, 0
	frame_oam -26, -12, $34, 0
	frame_oam -26,  -4, $36, 0
	frame_oam -26,   4, $38, 0
	frame_oam -10,  -8, $10, 0
	frame_oam -10,   0, $12, 0
	db $80

.frame_17
	frame_oam -41, -12, $2e, 0
	frame_oam -41,  -4, $30, 0
	frame_oam -41,   4, $32, 0
	frame_oam -25, -12, $34, 0
	frame_oam -25,  -4, $36, 0
	frame_oam -25,   4, $38, 0
	frame_oam  -9,  -8, $14, 0
	frame_oam  -9,   0, $16, 0
	db $80

.frame_18
	frame_oam -40,   4, $2e, 0 | OAM_XFLIP
	frame_oam -40,  -4, $30, 0 | OAM_XFLIP
	frame_oam -40, -12, $32, 0 | OAM_XFLIP
	frame_oam -24,   4, $34, 0 | OAM_XFLIP
	frame_oam -24,  -4, $36, 0 | OAM_XFLIP
	frame_oam -24, -12, $38, 0 | OAM_XFLIP
	frame_oam  -8,  -8, $08, 0
	frame_oam  -8,   0, $0a, 0
	db $80

.frame_19
	frame_oam -41,   4, $2e, 0 | OAM_XFLIP
	frame_oam -41,  -4, $30, 0 | OAM_XFLIP
	frame_oam -41, -12, $32, 0 | OAM_XFLIP
	frame_oam -25,   4, $34, 0 | OAM_XFLIP
	frame_oam -25,  -4, $36, 0 | OAM_XFLIP
	frame_oam -25, -12, $38, 0 | OAM_XFLIP
	frame_oam  -9,  -8, $0c, 0
	frame_oam  -9,   0, $0e, 0
	db $80

.frame_20
	frame_oam -42,   4, $2e, 0 | OAM_XFLIP
	frame_oam -42,  -4, $30, 0 | OAM_XFLIP
	frame_oam -42, -12, $32, 0 | OAM_XFLIP
	frame_oam -26,   4, $34, 0 | OAM_XFLIP
	frame_oam -26,  -4, $36, 0 | OAM_XFLIP
	frame_oam -26, -12, $38, 0 | OAM_XFLIP
	frame_oam -10,  -8, $10, 0
	frame_oam -10,   0, $12, 0
	db $80

.frame_21
	frame_oam -41,   4, $2e, 0 | OAM_XFLIP
	frame_oam -41,  -4, $30, 0 | OAM_XFLIP
	frame_oam -41, -12, $32, 0 | OAM_XFLIP
	frame_oam -25,   4, $34, 0 | OAM_XFLIP
	frame_oam -25,  -4, $36, 0 | OAM_XFLIP
	frame_oam -25, -12, $38, 0 | OAM_XFLIP
	frame_oam  -9,  -8, $14, 0
	frame_oam  -9,   0, $16, 0
	db $80

.frame_22
	frame_oam -24, -12, $3a, 0
	frame_oam -24,  -4, $3c, 0
	frame_oam -24,   4, $3e, 0
	frame_oam  -8, -12, $40, 0
	frame_oam  -8,  -4, $42, 0
	frame_oam  -8,   4, $44, 0
	db $80

.frame_23
	frame_oam -23, -12, $3a, 0
	frame_oam -23,  -4, $3c, 0
	frame_oam  -7,  -3, $42, 0
	frame_oam -23,   4, $46, 0
	frame_oam  -7, -11, $48, 0
	frame_oam  -7,   5, $4a, 0
	db $80

.frame_24
	frame_oam -23, -13, $3a, 0
	frame_oam -23,  -5, $3c, 0
	frame_oam  -7,  -3, $42, 0
	frame_oam -23,   3, $46, 0
	frame_oam  -7,   5, $4e, 0
	frame_oam  -7, -11, $4c, 0
	db $80

.frame_25
	frame_oam -24,   4, $3a, 0 | OAM_XFLIP
	frame_oam -24,  -4, $3c, 0 | OAM_XFLIP
	frame_oam -24, -12, $3e, 0 | OAM_XFLIP
	frame_oam  -8,   4, $40, 0 | OAM_XFLIP
	frame_oam  -8,  -4, $42, 0 | OAM_XFLIP
	frame_oam  -8, -12, $44, 0 | OAM_XFLIP
	db $80

.frame_26
	frame_oam -23,   4, $3a, 0 | OAM_XFLIP
	frame_oam -23,  -4, $3c, 0 | OAM_XFLIP
	frame_oam  -7,  -5, $42, 0 | OAM_XFLIP
	frame_oam -23, -12, $46, 0 | OAM_XFLIP
	frame_oam  -7,   3, $48, 0 | OAM_XFLIP
	frame_oam  -7, -13, $4a, 0 | OAM_XFLIP
	db $80

.frame_27
	frame_oam -23,   5, $3a, 0 | OAM_XFLIP
	frame_oam -23,  -3, $3c, 0 | OAM_XFLIP
	frame_oam  -7,  -5, $42, 0 | OAM_XFLIP
	frame_oam -23, -11, $46, 0 | OAM_XFLIP
	frame_oam  -7, -13, $4e, 0 | OAM_XFLIP
	frame_oam  -7,   3, $4c, 0 | OAM_XFLIP
	db $80

Frameset_1fd81c:
	db   0,  6
	db   1,  6
	db   2,  6
	db   3,  6
	db $ff

Frameset_1fd825:
	db   7,  6
	db   4,  6
	db   5,  6
	db   6,  6
	db $ff

Frameset_1fd82e::
	db  11,  6
	db   8,  6
	db   9,  6
	db  10,  6
	db $ff

; unreferenced
Frameset_1fd837:
	db   0,  4
	db $ff

Frameset_1fd83a:
	db  12,  2
	db   0,  1
	db  13,  2
	db $ff

Frameset_1fd841:
	db  13,  2
	db   0,  1
	db  12,  2
	db $ff

; unreferenced
Frameset_1fd848:
	db  14,  6
	db  15,  6
	db  16,  6
	db  17,  6
	db $ff

; unreferenced
Frameset_1fd851:
	db  18,  6
	db  19,  6
	db  20,  6
	db  21,  6
	db $ff

; unreferenced
Frameset_1fd85a:
	db  22,  4
	db $ff

; unreferenced
Frameset_1fd85d:
	db  25,  4
	db $ff

; unreferenced
Frameset_1fd860:
	db  22,  4
	db  23,  4
	db  24,  6
	db  23,  4
	db $ff

; unreferenced
Frameset_1fd869:
	db  25,  4
	db  26,  4
	db  27,  6
	db  26,  4
	db $ff

; unreferenced
Frameset_1fd872:
	db   0,  1
	db  12,  2
	db $ff

; unreferenced
Frameset_1fd877:
	db   0,  1
	db  13,  2
	db $ff

OAM_1fd87c:
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
	frame_oam -27, -11, $90, 6 | OAM_BANK1
	frame_oam -12,   3, $94, 0 | OAM_BANK1
	frame_oam -32, -16, $00, 1
	frame_oam -32,  -8, $02, 1
	frame_oam -16, -16, $04, 1
	frame_oam -16,  -8, $06, 1
	frame_oam -32,   8, $00, 1 | OAM_XFLIP
	frame_oam -32,   0, $02, 1 | OAM_XFLIP
	frame_oam -16,   8, $04, 1 | OAM_XFLIP
	frame_oam -16,   0, $06, 1 | OAM_XFLIP
	db $80

.frame_1
	frame_oam -12,   2, $94, 0 | OAM_BANK1
	frame_oam -27, -10, $90, 6 | OAM_BANK1
	frame_oam -32, -16, $08, 1
	frame_oam -32,  -8, $0a, 1
	frame_oam -32,   0, $0c, 1
	frame_oam -32,   8, $0e, 1
	frame_oam -16, -16, $28, 1
	frame_oam -16,  -8, $2a, 1
	frame_oam -16,   0, $2c, 1
	frame_oam -16,   8, $2e, 1
	db $80

.frame_2
	frame_oam -26, -10, $90, 6 | OAM_BANK1
	frame_oam -13,   2, $94, 0 | OAM_BANK1
	frame_oam -32, -16, $10, 1
	frame_oam -32,  -8, $12, 1
	frame_oam -32,   0, $14, 1
	frame_oam -32,   8, $16, 1
	frame_oam -16, -16, $30, 1
	frame_oam -16,  -8, $32, 1
	frame_oam -16,   0, $34, 1
	frame_oam -16,   8, $36, 1
	db $80

.frame_3
	frame_oam -13,   3, $94, 0 | OAM_BANK1
	frame_oam -26, -10, $90, 6 | OAM_BANK1
	frame_oam -32, -16, $18, 1
	frame_oam -32,  -8, $1a, 1
	frame_oam -32,   0, $1c, 1
	frame_oam -32,   8, $1e, 1
	frame_oam -16, -16, $38, 1
	frame_oam -16,  -8, $3a, 1
	frame_oam -16,   0, $3c, 1
	frame_oam -16,   8, $3e, 1
	db $80

.frame_4
	frame_oam -27, -10, $90, 6 | OAM_BANK1
	frame_oam -12,   3, $94, 0 | OAM_BANK1
	frame_oam -32, -16, $20, 1
	frame_oam -32,  -8, $22, 1
	frame_oam -32,   0, $24, 1
	frame_oam -32,   8, $26, 1
	frame_oam -16, -16, $20, 1 | OAM_YFLIP
	frame_oam -16,  -8, $22, 1 | OAM_YFLIP
	frame_oam -16,   0, $24, 1 | OAM_YFLIP
	frame_oam -16,   8, $26, 1 | OAM_YFLIP
	db $80

.frame_5
	frame_oam -13,   3, $94, 0 | OAM_BANK1
	frame_oam -26, -10, $90, 6 | OAM_BANK1
	frame_oam -16, -16, $18, 1 | OAM_YFLIP
	frame_oam -16,  -8, $1a, 1 | OAM_YFLIP
	frame_oam -16,   0, $1c, 1 | OAM_YFLIP
	frame_oam -16,   8, $1e, 1 | OAM_YFLIP
	frame_oam -32, -16, $38, 1 | OAM_YFLIP
	frame_oam -32,  -8, $3a, 1 | OAM_YFLIP
	frame_oam -32,   0, $3c, 1 | OAM_YFLIP
	frame_oam -32,   8, $3e, 1 | OAM_YFLIP
	db $80

.frame_6
	frame_oam -26,  -9, $90, 6 | OAM_BANK1
	frame_oam -13,   2, $94, 0 | OAM_BANK1
	frame_oam -16, -16, $10, 1 | OAM_YFLIP
	frame_oam -16,  -8, $12, 1 | OAM_YFLIP
	frame_oam -16,   0, $14, 1 | OAM_YFLIP
	frame_oam -16,   8, $16, 1 | OAM_YFLIP
	frame_oam -32, -16, $30, 1 | OAM_YFLIP
	frame_oam -32,  -8, $32, 1 | OAM_YFLIP
	frame_oam -32,   0, $34, 1 | OAM_YFLIP
	frame_oam -32,   8, $36, 1 | OAM_YFLIP
	db $80

.frame_7
	frame_oam -12,   2, $94, 0 | OAM_BANK1
	frame_oam -27,  -9, $90, 6 | OAM_BANK1
	frame_oam -16, -16, $08, 1 | OAM_YFLIP
	frame_oam -16,  -8, $0a, 1 | OAM_YFLIP
	frame_oam -16,   0, $0c, 1 | OAM_YFLIP
	frame_oam -16,   8, $0e, 1 | OAM_YFLIP
	frame_oam -32, -16, $28, 1 | OAM_YFLIP
	frame_oam -32,  -8, $2a, 1 | OAM_YFLIP
	frame_oam -32,   0, $2c, 1 | OAM_YFLIP
	frame_oam -32,   8, $2e, 1 | OAM_YFLIP
	db $80

.frame_8
	frame_oam -27, -10, $90, 6 | OAM_BANK1
	frame_oam -12,   3, $94, 0 | OAM_BANK1
	frame_oam -16, -16, $00, 1 | OAM_YFLIP
	frame_oam -16,  -8, $02, 1 | OAM_YFLIP
	frame_oam -32, -16, $04, 1 | OAM_YFLIP
	frame_oam -32,  -8, $06, 1 | OAM_YFLIP
	frame_oam -16,   8, $00, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,   0, $02, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,   8, $04, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,   0, $06, 1 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_9
	frame_oam -12,   2, $94, 0 | OAM_BANK1
	frame_oam -27,  -9, $90, 6 | OAM_BANK1
	frame_oam -16,   8, $08, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,   0, $0a, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,  -8, $0c, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16, -16, $0e, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,   8, $28, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,   0, $2a, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,  -8, $2c, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32, -16, $2e, 1 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_10
	frame_oam -26,  -9, $90, 6 | OAM_BANK1
	frame_oam -13,   2, $94, 0 | OAM_BANK1
	frame_oam -16,   8, $10, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,   0, $12, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,  -8, $14, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16, -16, $16, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,   8, $30, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,   0, $32, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,  -8, $34, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32, -16, $36, 1 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_11
	frame_oam -13,   3, $94, 0 | OAM_BANK1
	frame_oam -26, -10, $90, 6 | OAM_BANK1
	frame_oam -16,   8, $18, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,   0, $1a, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,  -8, $1c, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16, -16, $1e, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,   8, $38, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,   0, $3a, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,  -8, $3c, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32, -16, $3e, 1 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_12
	frame_oam -27, -10, $90, 6 | OAM_BANK1
	frame_oam -12,   3, $94, 0 | OAM_BANK1
	frame_oam -32,   8, $20, 1 | OAM_XFLIP
	frame_oam -32,   0, $22, 1 | OAM_XFLIP
	frame_oam -32,  -8, $24, 1 | OAM_XFLIP
	frame_oam -32, -16, $26, 1 | OAM_XFLIP
	frame_oam -16,   8, $20, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,   0, $22, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,  -8, $24, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16, -16, $26, 1 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_13
	frame_oam -13,   3, $94, 0 | OAM_BANK1
	frame_oam -26, -10, $90, 6 | OAM_BANK1
	frame_oam -32,   8, $18, 1 | OAM_XFLIP
	frame_oam -32,   0, $1a, 1 | OAM_XFLIP
	frame_oam -32,  -8, $1c, 1 | OAM_XFLIP
	frame_oam -32, -16, $1e, 1 | OAM_XFLIP
	frame_oam -16,   8, $38, 1 | OAM_XFLIP
	frame_oam -16,   0, $3a, 1 | OAM_XFLIP
	frame_oam -16,  -8, $3c, 1 | OAM_XFLIP
	frame_oam -16, -16, $3e, 1 | OAM_XFLIP
	db $80

.frame_14
	frame_oam -26,  -9, $90, 6 | OAM_BANK1
	frame_oam -13,   2, $94, 0 | OAM_BANK1
	frame_oam -32,   8, $10, 1 | OAM_XFLIP
	frame_oam -32,   0, $12, 1 | OAM_XFLIP
	frame_oam -32,  -8, $14, 1 | OAM_XFLIP
	frame_oam -32, -16, $16, 1 | OAM_XFLIP
	frame_oam -16,   8, $30, 1 | OAM_XFLIP
	frame_oam -16,   0, $32, 1 | OAM_XFLIP
	frame_oam -16,  -8, $34, 1 | OAM_XFLIP
	frame_oam -16, -16, $36, 1 | OAM_XFLIP
	db $80

.frame_15
	frame_oam -11,   2, $94, 0 | OAM_BANK1
	frame_oam -27,  -9, $90, 6 | OAM_BANK1
	frame_oam -32,   8, $08, 1 | OAM_XFLIP
	frame_oam -32,   0, $0a, 1 | OAM_XFLIP
	frame_oam -32,  -8, $0c, 1 | OAM_XFLIP
	frame_oam -32, -16, $0e, 1 | OAM_XFLIP
	frame_oam -16,   8, $28, 1 | OAM_XFLIP
	frame_oam -16,   0, $2a, 1 | OAM_XFLIP
	frame_oam -16,  -8, $2c, 1 | OAM_XFLIP
	frame_oam -16, -16, $2e, 1 | OAM_XFLIP
	db $80

Frameset_1fdb2c:
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

OAM_1fdb6d:
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

.frame_0
	frame_oam -32, -16, $40, 0
	frame_oam -32,  -8, $42, 0
	frame_oam -32,   0, $44, 0
	frame_oam -32,   8, $46, 0
	frame_oam -16, -16, $48, 0
	frame_oam -16,  -8, $4a, 0
	frame_oam -16,   0, $4c, 0
	frame_oam -16,   8, $4e, 0
	db $80

.frame_1
	frame_oam -33,   0, $44, 0
	frame_oam -33,   8, $46, 0
	frame_oam -17, -16, $48, 0
	frame_oam -17,  -8, $4a, 0
	frame_oam -17,   0, $4c, 0
	frame_oam -17,   8, $4e, 0
	frame_oam -33, -16, $50, 1
	frame_oam -33,  -8, $58, 1
	db $80

.frame_2
	frame_oam -32,   7, $46, 0
	frame_oam -16,  -1, $4c, 0
	frame_oam -16,   7, $4e, 0
	frame_oam -32, -17, $50, 1
	frame_oam -32,  -9, $58, 1
	frame_oam -16, -17, $5e, 1
	frame_oam -16,  -9, $52, 1
	frame_oam -32,  -1, $5a, 1
	db $80

.frame_3
	frame_oam -16,   9, $4e, 0
	frame_oam -32, -15, $50, 1
	frame_oam -32,  -7, $58, 1
	frame_oam -16, -15, $5e, 1
	frame_oam -16,  -7, $52, 1
	frame_oam -32,   1, $5a, 1
	frame_oam -32,   9, $5c, 1
	frame_oam -16,   1, $54, 1
	db $80

.frame_4
	frame_oam -32, -16, $56, 1
	frame_oam -32,  -8, $58, 1
	frame_oam -32,   0, $5a, 1
	frame_oam -32,   8, $5c, 1
	frame_oam -16, -16, $5e, 1
	frame_oam -16,  -8, $60, 1
	frame_oam -16,   0, $62, 1
	frame_oam -16,   8, $64, 1
	db $80

.frame_5
	frame_oam -32,   8, $40, 0 | OAM_XFLIP
	frame_oam -32,   0, $42, 0 | OAM_XFLIP
	frame_oam -32,  -8, $44, 0 | OAM_XFLIP
	frame_oam -32, -16, $46, 0 | OAM_XFLIP
	frame_oam -16,   8, $48, 0 | OAM_XFLIP
	frame_oam -16,   0, $4a, 0 | OAM_XFLIP
	frame_oam -16,  -8, $4c, 0 | OAM_XFLIP
	frame_oam -16, -16, $4e, 0 | OAM_XFLIP
	db $80

.frame_6
	frame_oam -33,  -8, $44, 0 | OAM_XFLIP
	frame_oam -33, -16, $46, 0 | OAM_XFLIP
	frame_oam -17,   8, $48, 0 | OAM_XFLIP
	frame_oam -17,   0, $4a, 0 | OAM_XFLIP
	frame_oam -17,  -8, $4c, 0 | OAM_XFLIP
	frame_oam -17, -16, $4e, 0 | OAM_XFLIP
	frame_oam -33,   8, $50, 1 | OAM_XFLIP
	frame_oam -33,   0, $58, 1 | OAM_XFLIP
	db $80

.frame_7
	frame_oam -32, -15, $46, 0 | OAM_XFLIP
	frame_oam -16,  -7, $4c, 0 | OAM_XFLIP
	frame_oam -16, -15, $4e, 0 | OAM_XFLIP
	frame_oam -32,   9, $50, 1 | OAM_XFLIP
	frame_oam -32,   1, $58, 1 | OAM_XFLIP
	frame_oam -16,   9, $5e, 1 | OAM_XFLIP
	frame_oam -16,   1, $52, 1 | OAM_XFLIP
	frame_oam -32,  -7, $5a, 1 | OAM_XFLIP
	db $80

.frame_8
	frame_oam -16, -17, $4e, 0 | OAM_XFLIP
	frame_oam -32,   7, $50, 1 | OAM_XFLIP
	frame_oam -32,  -1, $58, 1 | OAM_XFLIP
	frame_oam -16,   7, $5e, 1 | OAM_XFLIP
	frame_oam -16,  -1, $52, 1 | OAM_XFLIP
	frame_oam -32,  -9, $5a, 1 | OAM_XFLIP
	frame_oam -32, -17, $5c, 1 | OAM_XFLIP
	frame_oam -16,  -9, $54, 1 | OAM_XFLIP
	db $80

.frame_9
	frame_oam -32,   8, $56, 1 | OAM_XFLIP
	frame_oam -32,   0, $58, 1 | OAM_XFLIP
	frame_oam -32,  -8, $5a, 1 | OAM_XFLIP
	frame_oam -32, -16, $5c, 1 | OAM_XFLIP
	frame_oam -16,   8, $5e, 1 | OAM_XFLIP
	frame_oam -16,   0, $60, 1 | OAM_XFLIP
	frame_oam -16,  -8, $62, 1 | OAM_XFLIP
	frame_oam -16, -16, $64, 1 | OAM_XFLIP
	db $80

.frame_10
	frame_oam -25,  -8, $78, 2
	frame_oam -25,   0, $7a, 2
	db $80

.frame_11
	frame_oam -32, -16, $66, 2
	frame_oam -32,  -8, $68, 2
	frame_oam -32,   0, $6a, 2
	frame_oam -16, -16, $6c, 2
	frame_oam -16,  -8, $6e, 2
	frame_oam -16,   0, $70, 2
	frame_oam -16,   8, $72, 2
	db $80

.frame_12
	frame_oam -40, -16, $76, 2
	frame_oam -19, -18, $76, 2 | OAM_YFLIP
	frame_oam -41,   7, $76, 1
	frame_oam -18,   0, $76, 2 | OAM_XFLIP
	frame_oam -31, -26, $76, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16, -10, $6a, 1 | OAM_YFLIP
	frame_oam -40,  -4, $6a, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam -17,   9, $74, 1
	db $80

.frame_13
	frame_oam -24,  -7, $7c, 2
	frame_oam -24,   1, $7c, 2 | OAM_XFLIP
	db $80

.frame_14
	frame_oam -16,  -4, $7e, 2
	db $80

.frame_15
	frame_oam -25,   0, $78, 2 | OAM_XFLIP
	frame_oam -25,  -8, $7a, 2 | OAM_XFLIP
	db $80

.frame_16
	frame_oam -32,   8, $66, 2 | OAM_XFLIP
	frame_oam -32,   0, $68, 2 | OAM_XFLIP
	frame_oam -32,  -8, $6a, 2 | OAM_XFLIP
	frame_oam -16,   8, $6c, 2 | OAM_XFLIP
	frame_oam -16,   0, $6e, 2 | OAM_XFLIP
	frame_oam -16,  -8, $70, 2 | OAM_XFLIP
	frame_oam -16, -16, $72, 2 | OAM_XFLIP
	db $80

.frame_17
	frame_oam -40,   8, $76, 2 | OAM_XFLIP
	frame_oam -19,  10, $76, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam -41, -15, $76, 1 | OAM_XFLIP
	frame_oam -18,  -8, $76, 2
	frame_oam -31,  18, $76, 1 | OAM_YFLIP
	frame_oam -16,   2, $6a, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -40,  -4, $6a, 2 | OAM_YFLIP
	frame_oam -17, -17, $74, 1 | OAM_XFLIP
	db $80

.frame_18
	frame_oam -24,  -1, $7c, 2 | OAM_XFLIP
	frame_oam -24,  -9, $7c, 2
	db $80

Frameset_1fdd82:
	db   0,  2
	db   1,  2
	db   2,  2
	db   3,  2
	db $ff

Frameset_1fdd8b:
	db   5,  2
	db   6,  2
	db   7,  2
	db   8,  2
	db $ff

Frameset_1fdd94:
	db   4,  4
	db $ff

Frameset_1fdd97:
	db   9,  4
	db $ff

Frameset_1fdd9a:
	db  13,  3
	db  11,  3
	db  13,  3
	db  10,  2
	db  12,  3
	db  14,  1
	db $ff

Frameset_1fdda7:
	db  18,  3
	db  16,  3
	db  18,  3
	db  15,  2
	db  17,  3
	db  14,  1
	db $ff

OAM_1fddb4::
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

.frame_0
	frame_oam -33,   5, $04, 0
	frame_oam -27,  13, $0e, 0
	frame_oam -17, -11, $14, 0
	frame_oam -17,  -3, $2a, 0
	frame_oam -17,   5, $2c, 0
	frame_oam -33,  -3, $42, 0
	frame_oam -33, -11, $40, 0
	frame_oam -60, -11, $12, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -44, -11, $18, 0 | OAM_BANK1
	frame_oam -44,  -3, $18, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -53, -19, $20, 4 | OAM_BANK1
	frame_oam -53,   5, $20, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -60,  -3, $12, 4 | OAM_BANK1
	frame_oam -11,  13, $58, 0
	db $80

.frame_1
	frame_oam -17,  14, $2e, 0
	frame_oam -33,   6, $04, 0
	frame_oam -33,  14, $06, 0
	frame_oam -17, -10, $16, 0
	frame_oam -17,  -2, $18, 0
	frame_oam -17,   6, $1a, 0
	frame_oam -33,  -2, $42, 0
	frame_oam -33, -10, $40, 0
	frame_oam -61,  -2, $10, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -61, -10, $12, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -45, -10, $18, 0 | OAM_BANK1
	frame_oam -45,  -2, $18, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -54,   6, $22, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -53, -18, $1e, 4 | OAM_BANK1
	db $80

.frame_2
	frame_oam -17,  13, $2e, 0
	frame_oam -33,   5, $04, 0
	frame_oam -33,  13, $06, 0
	frame_oam -17, -11, $16, 0
	frame_oam -17,  -3, $18, 0
	frame_oam -17,   5, $1a, 0
	frame_oam -33,  -3, $42, 0
	frame_oam -33, -11, $40, 0
	frame_oam -60, -11, $12, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -44, -11, $18, 0 | OAM_BANK1
	frame_oam -44,  -3, $18, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -53, -19, $20, 4 | OAM_BANK1
	frame_oam -53,   5, $20, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -60,  -3, $12, 4 | OAM_BANK1
	db $80

.frame_3
	frame_oam -33,   4, $04, 0
	frame_oam -27,  12, $0e, 0
	frame_oam -17, -12, $14, 0
	frame_oam -17,  -4, $2a, 0
	frame_oam -17,   4, $2c, 0
	frame_oam -33,  -4, $42, 0
	frame_oam -33, -12, $40, 0
	frame_oam -61, -12, $10, 4 | OAM_BANK1
	frame_oam -61,  -4, $12, 4 | OAM_BANK1
	frame_oam -45, -12, $18, 0 | OAM_BANK1
	frame_oam -45,  -4, $18, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -54, -20, $22, 4 | OAM_BANK1
	frame_oam -53,   4, $1e, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -11,  12, $58, 0
	db $80

.frame_4
	frame_oam -33,   5, $04, 0
	frame_oam -27,  13, $0e, 0
	frame_oam -17, -11, $14, 0
	frame_oam -17,  -3, $2a, 0
	frame_oam -17,   5, $2c, 0
	frame_oam -33,  -3, $42, 0
	frame_oam -33, -11, $40, 0
	frame_oam -50,   4, $24, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $28, 4 | OAM_BANK1
	frame_oam -59,  -3, $2a, 4 | OAM_BANK1
	frame_oam -43, -11, $2c, 0 | OAM_BANK1
	frame_oam -43,  -3, $2e, 0 | OAM_BANK1
	frame_oam -50, -19, $3e, 4 | OAM_BANK1
	frame_oam -11,  13, $58, 0
	db $80

.frame_5
	frame_oam -34,  -8, $10, 0
	frame_oam -34,   0, $12, 0
	frame_oam -18,  -8, $30, 0
	frame_oam -18,   0, $32, 0
	frame_oam -34,   8, $04, 0
	frame_oam -18,   8, $0c, 0
	frame_oam -28,  16, $0e, 0
	frame_oam -46,   4, $3a, 4 | OAM_BANK1
	frame_oam -60, -11, $28, 4 | OAM_BANK1
	frame_oam -60,  -3, $2a, 4 | OAM_BANK1
	frame_oam -44, -11, $2c, 0 | OAM_BANK1
	frame_oam -44,  -3, $2e, 0 | OAM_BANK1
	frame_oam -46, -18, $1c, 4 | OAM_BANK1
	frame_oam -12,  16, $58, 0
	db $80

.frame_6
	frame_oam -32,   6, $04, 0
	frame_oam -26,  14, $0e, 0
	frame_oam -16, -10, $14, 0
	frame_oam -16,  -2, $2a, 0
	frame_oam -16,   6, $2c, 0
	frame_oam -32,  -2, $42, 0
	frame_oam -32, -10, $40, 0
	frame_oam -50,   4, $3c, 4 | OAM_BANK1
	frame_oam -59, -11, $28, 4 | OAM_BANK1
	frame_oam -59,  -3, $2a, 4 | OAM_BANK1
	frame_oam -43, -11, $2c, 0 | OAM_BANK1
	frame_oam -43,  -3, $2e, 0 | OAM_BANK1
	frame_oam -50, -18, $1e, 4 | OAM_BANK1
	frame_oam -10,  14, $58, 0
	db $80

.frame_7
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50,   4, $20, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $28, 4 | OAM_BANK1
	frame_oam -59,  -3, $2a, 4 | OAM_BANK1
	frame_oam -43, -11, $2c, 0 | OAM_BANK1
	frame_oam -43,  -3, $2e, 0 | OAM_BANK1
	frame_oam -50, -18, $20, 4 | OAM_BANK1
	db $80

.frame_8
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50,   4, $22, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -58, -11, $28, 4 | OAM_BANK1
	frame_oam -58,  -3, $2a, 4 | OAM_BANK1
	frame_oam -42, -11, $2c, 0 | OAM_BANK1
	frame_oam -42,  -3, $2e, 0 | OAM_BANK1
	frame_oam -50, -18, $22, 4 | OAM_BANK1
	db $80

.frame_9
	frame_oam -17,  -7, $3a, 0
	frame_oam -17,   1, $3c, 0
	frame_oam -17,   9, $3e, 0
	frame_oam -17, -15, $38, 0
	frame_oam -33, -15, $1c, 0
	frame_oam -33,  -7, $1e, 0
	frame_oam -33,   1, $04, 0
	frame_oam -33,   9, $06, 0
	frame_oam -50,   4, $24, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $28, 4 | OAM_BANK1
	frame_oam -59,  -3, $2a, 4 | OAM_BANK1
	frame_oam -43, -11, $2c, 0 | OAM_BANK1
	frame_oam -43,  -3, $2e, 0 | OAM_BANK1
	frame_oam -50, -19, $3e, 4 | OAM_BANK1
	db $80

.frame_10
	frame_oam -18, -15, $38, 0
	frame_oam -18,  -7, $3a, 0
	frame_oam -18,   1, $3c, 0
	frame_oam -34, -15, $1c, 0
	frame_oam -34,  -7, $1e, 0
	frame_oam -18,   9, $3e, 0
	frame_oam -34,   1, $04, 0
	frame_oam -34,   9, $06, 0
	frame_oam -46,   4, $3a, 4 | OAM_BANK1
	frame_oam -60, -11, $28, 4 | OAM_BANK1
	frame_oam -60,  -3, $2a, 4 | OAM_BANK1
	frame_oam -44, -11, $2c, 0 | OAM_BANK1
	frame_oam -44,  -3, $2e, 0 | OAM_BANK1
	frame_oam -46, -18, $1c, 4 | OAM_BANK1
	db $80

.frame_11
	frame_oam -16,  -7, $3a, 0
	frame_oam -16,   1, $3c, 0
	frame_oam -16,   9, $3e, 0
	frame_oam -16, -15, $38, 0
	frame_oam -32, -15, $1c, 0
	frame_oam -32,  -7, $1e, 0
	frame_oam -32,   1, $04, 0
	frame_oam -32,   9, $06, 0
	frame_oam -50,   4, $3c, 4 | OAM_BANK1
	frame_oam -59, -11, $28, 4 | OAM_BANK1
	frame_oam -59,  -3, $2a, 4 | OAM_BANK1
	frame_oam -43, -11, $2c, 0 | OAM_BANK1
	frame_oam -43,  -3, $2e, 0 | OAM_BANK1
	frame_oam -50, -18, $1e, 4 | OAM_BANK1
	db $80

.frame_12
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50,   4, $20, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $28, 4 | OAM_BANK1
	frame_oam -59,  -3, $2a, 4 | OAM_BANK1
	frame_oam -43, -11, $2c, 0 | OAM_BANK1
	frame_oam -43,  -3, $2e, 0 | OAM_BANK1
	frame_oam -50, -18, $20, 4 | OAM_BANK1
	db $80

.frame_13
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50,   4, $22, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -58, -11, $28, 4 | OAM_BANK1
	frame_oam -58,  -3, $2a, 4 | OAM_BANK1
	frame_oam -42, -11, $2c, 0 | OAM_BANK1
	frame_oam -42,  -3, $2e, 0 | OAM_BANK1
	frame_oam -50, -18, $22, 4 | OAM_BANK1
	db $80

.frame_14
	frame_oam -33,   5, $04, 0
	frame_oam -27,  13, $0e, 0
	frame_oam -17, -11, $14, 0
	frame_oam -17,  -3, $2a, 0
	frame_oam -17,   5, $2c, 0
	frame_oam -33,  -3, $42, 0
	frame_oam -33, -11, $40, 0
	frame_oam -50, -18, $24, 4 | OAM_BANK1
	frame_oam -59,  -3, $28, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $2a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43,  -3, $2c, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43, -11, $2e, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50,   5, $3e, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -11,  13, $58, 0
	db $80

.frame_15
	frame_oam -34,  -8, $10, 0
	frame_oam -34,   0, $12, 0
	frame_oam -18,  -8, $30, 0
	frame_oam -18,   0, $32, 0
	frame_oam -34,   8, $04, 0
	frame_oam -18,   8, $0c, 0
	frame_oam -28,  16, $0e, 0
	frame_oam -46, -18, $3a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -60,  -3, $28, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -60, -11, $2a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -44,  -3, $2c, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -44, -11, $2e, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -46,   4, $1c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -12,  16, $58, 0
	db $80

.frame_16
	frame_oam -32,   6, $04, 0
	frame_oam -26,  14, $0e, 0
	frame_oam -16, -10, $14, 0
	frame_oam -16,  -2, $2a, 0
	frame_oam -16,   6, $2c, 0
	frame_oam -32,  -2, $42, 0
	frame_oam -32, -10, $40, 0
	frame_oam -50, -18, $3c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59,  -3, $28, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $2a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43,  -3, $2c, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43, -11, $2e, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50,   4, $1e, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -10,  14, $58, 0
	db $80

.frame_17
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50, -18, $20, 4 | OAM_BANK1
	frame_oam -59,  -3, $28, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $2a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43,  -3, $2c, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43, -11, $2e, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50,   4, $20, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_18
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50, -18, $22, 4 | OAM_BANK1
	frame_oam -58,  -3, $28, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -58, -11, $2a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -42,  -3, $2c, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -42, -11, $2e, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50,   4, $22, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_19
	frame_oam -17,  -7, $3a, 0
	frame_oam -17,   1, $3c, 0
	frame_oam -17,   9, $3e, 0
	frame_oam -17, -15, $38, 0
	frame_oam -33, -15, $1c, 0
	frame_oam -33,  -7, $1e, 0
	frame_oam -33,   1, $04, 0
	frame_oam -33,   9, $06, 0
	frame_oam -50, -18, $24, 4 | OAM_BANK1
	frame_oam -59,  -3, $28, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $2a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43,  -3, $2c, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43, -11, $2e, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50,   5, $3e, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_20
	frame_oam -18, -15, $38, 0
	frame_oam -18,  -7, $3a, 0
	frame_oam -18,   1, $3c, 0
	frame_oam -34, -15, $1c, 0
	frame_oam -34,  -7, $1e, 0
	frame_oam -18,   9, $3e, 0
	frame_oam -34,   1, $04, 0
	frame_oam -34,   9, $06, 0
	frame_oam -46, -18, $3a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -60,  -3, $28, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -60, -11, $2a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -44,  -3, $2c, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -44, -11, $2e, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -46,   4, $1c, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_21
	frame_oam -16,  -7, $3a, 0
	frame_oam -16,   1, $3c, 0
	frame_oam -16,   9, $3e, 0
	frame_oam -16, -15, $38, 0
	frame_oam -32, -15, $1c, 0
	frame_oam -32,  -7, $1e, 0
	frame_oam -32,   1, $04, 0
	frame_oam -32,   9, $06, 0
	frame_oam -50, -18, $3c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59,  -3, $28, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $2a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43,  -3, $2c, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43, -11, $2e, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50,   4, $1e, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_22
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50, -18, $20, 4 | OAM_BANK1
	frame_oam -59,  -3, $28, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $2a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43,  -3, $2c, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43, -11, $2e, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50,   4, $20, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_23
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50, -18, $22, 4 | OAM_BANK1
	frame_oam -58,  -3, $28, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -58, -11, $2a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -42,  -3, $2c, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -42, -11, $2e, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50,   4, $22, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_24
	frame_oam -33,   5, $04, 0
	frame_oam -27,  13, $0e, 0
	frame_oam -17, -11, $14, 0
	frame_oam -17,  -3, $2a, 0
	frame_oam -17,   5, $2c, 0
	frame_oam -33,  -3, $42, 0
	frame_oam -33, -11, $40, 0
	frame_oam -50,   4, $24, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $28, 4 | OAM_BANK1
	frame_oam -59,  -3, $2a, 4 | OAM_BANK1
	frame_oam -43, -11, $2c, 0 | OAM_BANK1
	frame_oam -43,  -3, $2e, 0 | OAM_BANK1
	frame_oam -50, -19, $3e, 4 | OAM_BANK1
	frame_oam -11,  13, $58, 0
	db $80

.frame_25
	frame_oam -34,  -8, $10, 0
	frame_oam -34,   0, $12, 0
	frame_oam -18,  -8, $30, 0
	frame_oam -18,   0, $32, 0
	frame_oam -34,   8, $04, 0
	frame_oam -18,   8, $0c, 0
	frame_oam -28,  16, $0e, 0
	frame_oam -12,  16, $58, 0
	frame_oam -46,   4, $3a, 4 | OAM_BANK1
	frame_oam -59, -11, $16, 4 | OAM_BANK1
	frame_oam -43, -11, $36, 0 | OAM_BANK1
	frame_oam -59,  -3, $34, 4 | OAM_BANK1
	frame_oam -43,  -3, $38, 0 | OAM_BANK1
	frame_oam -46, -18, $1c, 4 | OAM_BANK1
	db $80

.frame_26
	frame_oam -32,   6, $04, 0
	frame_oam -26,  14, $0e, 0
	frame_oam -16, -10, $14, 0
	frame_oam -16,  -2, $2a, 0
	frame_oam -16,   6, $2c, 0
	frame_oam -32,  -2, $42, 0
	frame_oam -32, -10, $40, 0
	frame_oam -10,  14, $58, 0
	frame_oam -50,   4, $3c, 4 | OAM_BANK1
	frame_oam -59, -11, $28, 4 | OAM_BANK1
	frame_oam -59,  -3, $2a, 4 | OAM_BANK1
	frame_oam -43, -11, $30, 0 | OAM_BANK1
	frame_oam -43,  -3, $32, 0 | OAM_BANK1
	frame_oam -50, -18, $1e, 4 | OAM_BANK1
	db $80

.frame_27
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50,   4, $20, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $28, 4 | OAM_BANK1
	frame_oam -59,  -3, $2a, 4 | OAM_BANK1
	frame_oam -43, -11, $30, 0 | OAM_BANK1
	frame_oam -43,  -3, $32, 0 | OAM_BANK1
	frame_oam -50, -18, $20, 4 | OAM_BANK1
	db $80

.frame_28
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50,   4, $22, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -58, -11, $28, 4 | OAM_BANK1
	frame_oam -58,  -3, $2a, 4 | OAM_BANK1
	frame_oam -42, -11, $2c, 0 | OAM_BANK1
	frame_oam -42,  -3, $2e, 0 | OAM_BANK1
	frame_oam -50, -18, $22, 4 | OAM_BANK1
	db $80

.frame_29
	frame_oam -17,  -7, $3a, 0
	frame_oam -17,   1, $3c, 0
	frame_oam -17,   9, $3e, 0
	frame_oam -17, -15, $38, 0
	frame_oam -33, -15, $1c, 0
	frame_oam -33,  -7, $1e, 0
	frame_oam -33,   1, $04, 0
	frame_oam -33,   9, $06, 0
	frame_oam -50,   4, $24, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -58, -11, $16, 4 | OAM_BANK1
	frame_oam -42, -11, $36, 0 | OAM_BANK1
	frame_oam -58,  -3, $34, 4 | OAM_BANK1
	frame_oam -42,  -3, $38, 0 | OAM_BANK1
	frame_oam -50, -19, $3e, 4 | OAM_BANK1
	db $80

.frame_30
	frame_oam -18, -15, $38, 0
	frame_oam -18,  -7, $3a, 0
	frame_oam -18,   1, $3c, 0
	frame_oam -34, -15, $1c, 0
	frame_oam -34,  -7, $1e, 0
	frame_oam -18,   9, $3e, 0
	frame_oam -34,   1, $04, 0
	frame_oam -34,   9, $06, 0
	frame_oam -46,   4, $3a, 4 | OAM_BANK1
	frame_oam -59, -11, $16, 4 | OAM_BANK1
	frame_oam -43, -11, $36, 0 | OAM_BANK1
	frame_oam -59,  -3, $34, 4 | OAM_BANK1
	frame_oam -43,  -3, $38, 0 | OAM_BANK1
	frame_oam -46, -18, $1c, 4 | OAM_BANK1
	db $80

.frame_31
	frame_oam -16,  -7, $3a, 0
	frame_oam -16,   1, $3c, 0
	frame_oam -16,   9, $3e, 0
	frame_oam -16, -15, $38, 0
	frame_oam -32, -15, $1c, 0
	frame_oam -32,  -7, $1e, 0
	frame_oam -32,   1, $04, 0
	frame_oam -32,   9, $06, 0
	frame_oam -50,   4, $3c, 4 | OAM_BANK1
	frame_oam -59, -11, $28, 4 | OAM_BANK1
	frame_oam -59,  -3, $2a, 4 | OAM_BANK1
	frame_oam -43, -11, $30, 0 | OAM_BANK1
	frame_oam -43,  -3, $32, 0 | OAM_BANK1
	frame_oam -50, -18, $1e, 4 | OAM_BANK1
	db $80

.frame_32
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50,   4, $20, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $28, 4 | OAM_BANK1
	frame_oam -59,  -3, $2a, 4 | OAM_BANK1
	frame_oam -43, -11, $30, 0 | OAM_BANK1
	frame_oam -43,  -3, $32, 0 | OAM_BANK1
	frame_oam -50, -18, $20, 4 | OAM_BANK1
	db $80

.frame_33
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50,   4, $22, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -58, -11, $28, 4 | OAM_BANK1
	frame_oam -58,  -3, $2a, 4 | OAM_BANK1
	frame_oam -42, -11, $2c, 0 | OAM_BANK1
	frame_oam -42,  -3, $2e, 0 | OAM_BANK1
	frame_oam -50, -18, $22, 4 | OAM_BANK1
	db $80

.frame_34
	frame_oam -33,   5, $04, 0
	frame_oam -27,  13, $0e, 0
	frame_oam -17, -11, $14, 0
	frame_oam -17,  -3, $2a, 0
	frame_oam -17,   5, $2c, 0
	frame_oam -33,  -3, $42, 0
	frame_oam -33, -11, $40, 0
	frame_oam -50, -18, $24, 4 | OAM_BANK1
	frame_oam -59,  -3, $28, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $2a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43,  -3, $2c, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43, -11, $2e, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50,   5, $3e, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -11,  13, $58, 0
	db $80

.frame_35
	frame_oam -34,  -8, $10, 0
	frame_oam -34,   0, $12, 0
	frame_oam -18,  -8, $30, 0
	frame_oam -18,   0, $32, 0
	frame_oam -34,   8, $04, 0
	frame_oam -18,   8, $0c, 0
	frame_oam -28,  16, $0e, 0
	frame_oam -12,  16, $58, 0
	frame_oam -46, -18, $3a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59,  -3, $16, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43,  -3, $36, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $34, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43, -11, $38, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -46,   4, $1c, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_36
	frame_oam -32,   6, $04, 0
	frame_oam -26,  14, $0e, 0
	frame_oam -16, -10, $14, 0
	frame_oam -16,  -2, $2a, 0
	frame_oam -16,   6, $2c, 0
	frame_oam -32,  -2, $42, 0
	frame_oam -32, -10, $40, 0
	frame_oam -10,  14, $58, 0
	frame_oam -50, -18, $3c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59,  -3, $28, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $2a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43,  -3, $30, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43, -11, $32, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50,   4, $1e, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_37
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50, -18, $20, 4 | OAM_BANK1
	frame_oam -59,  -3, $28, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $2a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43,  -3, $30, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43, -11, $32, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50,   4, $20, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_38
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50, -18, $22, 4 | OAM_BANK1
	frame_oam -58,  -3, $28, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -58, -11, $2a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -42,  -3, $2c, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -42, -11, $2e, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50,   4, $22, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_39
	frame_oam -17,  -7, $3a, 0
	frame_oam -17,   1, $3c, 0
	frame_oam -17,   9, $3e, 0
	frame_oam -17, -15, $38, 0
	frame_oam -33, -15, $1c, 0
	frame_oam -33,  -7, $1e, 0
	frame_oam -33,   1, $04, 0
	frame_oam -33,   9, $06, 0
	frame_oam -50, -18, $24, 4 | OAM_BANK1
	frame_oam -58,  -3, $16, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -42,  -3, $36, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -58, -11, $34, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -42, -11, $38, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50,   5, $3e, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_40
	frame_oam -18, -15, $38, 0
	frame_oam -18,  -7, $3a, 0
	frame_oam -18,   1, $3c, 0
	frame_oam -34, -15, $1c, 0
	frame_oam -34,  -7, $1e, 0
	frame_oam -18,   9, $3e, 0
	frame_oam -34,   1, $04, 0
	frame_oam -34,   9, $06, 0
	frame_oam -46, -18, $3a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59,  -3, $16, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43,  -3, $36, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $34, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43, -11, $38, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -46,   4, $1c, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_41
	frame_oam -16,  -7, $3a, 0
	frame_oam -16,   1, $3c, 0
	frame_oam -16,   9, $3e, 0
	frame_oam -16, -15, $38, 0
	frame_oam -32, -15, $1c, 0
	frame_oam -32,  -7, $1e, 0
	frame_oam -32,   1, $04, 0
	frame_oam -32,   9, $06, 0
	frame_oam -50, -18, $3c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59,  -3, $28, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $2a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43,  -3, $30, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43, -11, $32, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50,   4, $1e, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_42
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50, -18, $20, 4 | OAM_BANK1
	frame_oam -59,  -3, $28, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -59, -11, $2a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43,  -3, $30, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43, -11, $32, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50,   4, $20, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_43
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50, -18, $22, 4 | OAM_BANK1
	frame_oam -58,  -3, $28, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -58, -11, $2a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -42,  -3, $2c, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -42, -11, $2e, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50,   4, $22, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_44
	frame_oam -33,   5, $04, 0
	frame_oam -27,  13, $0e, 0
	frame_oam -17, -11, $14, 0
	frame_oam -17,  -3, $2a, 0
	frame_oam -17,   5, $2c, 0
	frame_oam -33,  -3, $42, 0
	frame_oam -33, -11, $40, 0
	frame_oam -11,  13, $58, 0
	frame_oam -50, -19, $24, 4 | OAM_BANK1
	frame_oam -50,   5, $24, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -56, -11, $26, 4 | OAM_BANK1
	frame_oam -40, -11, $08, 0 | OAM_BANK1
	frame_oam -56,  -3, $26, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -40,  -3, $08, 0 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_45
	frame_oam -34,  -8, $10, 0
	frame_oam -34,   0, $12, 0
	frame_oam -18,  -8, $30, 0
	frame_oam -18,   0, $32, 0
	frame_oam -34,   8, $04, 0
	frame_oam -18,   8, $0c, 0
	frame_oam -28,  16, $0e, 0
	frame_oam -12,  16, $58, 0
	frame_oam -46, -19, $1c, 4 | OAM_BANK1
	frame_oam -46,   5, $1c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -57, -11, $26, 4 | OAM_BANK1
	frame_oam -41, -11, $08, 0 | OAM_BANK1
	frame_oam -57,  -3, $26, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -41,  -3, $08, 0 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_46
	frame_oam -32,   6, $04, 0
	frame_oam -26,  14, $0e, 0
	frame_oam -16, -10, $14, 0
	frame_oam -16,  -2, $2a, 0
	frame_oam -16,   6, $2c, 0
	frame_oam -32,  -2, $42, 0
	frame_oam -32, -10, $40, 0
	frame_oam -10,  14, $58, 0
	frame_oam -50, -19, $1e, 4 | OAM_BANK1
	frame_oam -50,   5, $1e, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -56, -11, $26, 4 | OAM_BANK1
	frame_oam -40, -11, $08, 0 | OAM_BANK1
	frame_oam -56,  -3, $26, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -40,  -3, $08, 0 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_47
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50, -19, $20, 4 | OAM_BANK1
	frame_oam -50,   5, $20, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -56, -11, $26, 4 | OAM_BANK1
	frame_oam -40, -11, $08, 0 | OAM_BANK1
	frame_oam -56,  -3, $26, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -40,  -3, $08, 0 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_48
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50, -19, $22, 4 | OAM_BANK1
	frame_oam -50,   5, $22, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -55, -11, $26, 4 | OAM_BANK1
	frame_oam -39, -11, $08, 0 | OAM_BANK1
	frame_oam -55,  -3, $26, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -39,  -3, $08, 0 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_49
	frame_oam -17,  -7, $3a, 0
	frame_oam -17,   1, $3c, 0
	frame_oam -17,   9, $3e, 0
	frame_oam -17, -15, $38, 0
	frame_oam -33, -15, $1c, 0
	frame_oam -33,  -7, $1e, 0
	frame_oam -33,   1, $04, 0
	frame_oam -33,   9, $06, 0
	frame_oam -50, -19, $24, 4 | OAM_BANK1
	frame_oam -50,   5, $24, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -56, -11, $26, 4 | OAM_BANK1
	frame_oam -40, -11, $08, 0 | OAM_BANK1
	frame_oam -56,  -3, $26, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -40,  -3, $08, 0 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_50
	frame_oam -18, -15, $38, 0
	frame_oam -18,  -7, $3a, 0
	frame_oam -18,   1, $3c, 0
	frame_oam -34, -15, $1c, 0
	frame_oam -34,  -7, $1e, 0
	frame_oam -18,   9, $3e, 0
	frame_oam -34,   1, $04, 0
	frame_oam -34,   9, $06, 0
	frame_oam -46, -19, $1c, 4 | OAM_BANK1
	frame_oam -46,   5, $1c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -57, -11, $26, 4 | OAM_BANK1
	frame_oam -41, -11, $08, 0 | OAM_BANK1
	frame_oam -57,  -3, $26, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -41,  -3, $08, 0 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_51
	frame_oam -16,  -7, $3a, 0
	frame_oam -16,   1, $3c, 0
	frame_oam -16,   9, $3e, 0
	frame_oam -16, -15, $38, 0
	frame_oam -32, -15, $1c, 0
	frame_oam -32,  -7, $1e, 0
	frame_oam -32,   1, $04, 0
	frame_oam -32,   9, $06, 0
	frame_oam -50, -19, $1e, 4 | OAM_BANK1
	frame_oam -50,   5, $1e, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -56, -11, $26, 4 | OAM_BANK1
	frame_oam -40, -11, $08, 0 | OAM_BANK1
	frame_oam -56,  -3, $26, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -40,  -3, $08, 0 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_52
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50, -19, $20, 4 | OAM_BANK1
	frame_oam -50,   5, $20, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -56, -11, $26, 4 | OAM_BANK1
	frame_oam -40, -11, $08, 0 | OAM_BANK1
	frame_oam -56,  -3, $26, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -40,  -3, $08, 0 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_53
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50, -19, $22, 4 | OAM_BANK1
	frame_oam -50,   5, $22, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -55, -11, $26, 4 | OAM_BANK1
	frame_oam -39, -11, $08, 0 | OAM_BANK1
	frame_oam -55,  -3, $26, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -39,  -3, $08, 0 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_54
	frame_oam -33,   5, $04, 0
	frame_oam -27,  13, $0e, 0
	frame_oam -17, -11, $14, 0
	frame_oam -17,  -3, $2a, 0
	frame_oam -17,   5, $2c, 0
	frame_oam -33,  -3, $42, 0
	frame_oam -33, -11, $40, 0
	frame_oam -11,  13, $58, 0
	frame_oam -50, -19, $24, 4 | OAM_BANK1
	frame_oam -50,   5, $24, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -56, -11, $26, 4 | OAM_BANK1
	frame_oam -40, -11, $08, 0 | OAM_BANK1
	frame_oam -56,  -3, $26, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -40,  -3, $08, 0 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_55
	frame_oam -34,  -8, $10, 0
	frame_oam -34,   0, $12, 0
	frame_oam -18,  -8, $30, 0
	frame_oam -18,   0, $32, 0
	frame_oam -34,   8, $04, 0
	frame_oam -18,   8, $0c, 0
	frame_oam -28,  16, $0e, 0
	frame_oam -12,  16, $58, 0
	frame_oam -59, -11, $1a, 4 | OAM_BANK1
	frame_oam -59,  -3, $1a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -46, -19, $1c, 4 | OAM_BANK1
	frame_oam -46,   5, $1c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43, -11, $14, 0 | OAM_BANK1
	frame_oam -43,  -3, $14, 0 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_56
	frame_oam -32,   6, $04, 0
	frame_oam -26,  14, $0e, 0
	frame_oam -16, -10, $14, 0
	frame_oam -16,  -2, $2a, 0
	frame_oam -16,   6, $2c, 0
	frame_oam -32,  -2, $42, 0
	frame_oam -32, -10, $40, 0
	frame_oam -10,  14, $58, 0
	frame_oam -58, -11, $1a, 4 | OAM_BANK1
	frame_oam -42, -11, $18, 0 | OAM_BANK1
	frame_oam -58,  -3, $1a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -42,  -3, $18, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50, -19, $1e, 4 | OAM_BANK1
	frame_oam -50,   5, $1e, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_57
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -58, -11, $1a, 4 | OAM_BANK1
	frame_oam -42, -11, $18, 0 | OAM_BANK1
	frame_oam -58,  -3, $1a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -42,  -3, $18, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50, -19, $20, 4 | OAM_BANK1
	frame_oam -50,   5, $20, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_58
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -57, -11, $1a, 4 | OAM_BANK1
	frame_oam -57,  -3, $1a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50, -19, $22, 4 | OAM_BANK1
	frame_oam -50,   5, $22, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -41, -11, $14, 0 | OAM_BANK1
	frame_oam -41,  -3, $14, 0 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_59
	frame_oam -17,  -7, $3a, 0
	frame_oam -17,   1, $3c, 0
	frame_oam -17,   9, $3e, 0
	frame_oam -17, -15, $38, 0
	frame_oam -33, -15, $1c, 0
	frame_oam -33,  -7, $1e, 0
	frame_oam -33,   1, $04, 0
	frame_oam -33,   9, $06, 0
	frame_oam -50, -19, $24, 4 | OAM_BANK1
	frame_oam -50,   5, $24, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -56, -11, $26, 4 | OAM_BANK1
	frame_oam -40, -11, $08, 0 | OAM_BANK1
	frame_oam -56,  -3, $26, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -40,  -3, $08, 0 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_60
	frame_oam -18, -15, $38, 0
	frame_oam -18,  -7, $3a, 0
	frame_oam -18,   1, $3c, 0
	frame_oam -34, -15, $1c, 0
	frame_oam -34,  -7, $1e, 0
	frame_oam -18,   9, $3e, 0
	frame_oam -34,   1, $04, 0
	frame_oam -34,   9, $06, 0
	frame_oam -59, -11, $1a, 4 | OAM_BANK1
	frame_oam -59,  -3, $1a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -46, -19, $1c, 4 | OAM_BANK1
	frame_oam -46,   5, $1c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -43, -11, $14, 0 | OAM_BANK1
	frame_oam -43,  -3, $14, 0 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_61
	frame_oam -16,  -7, $3a, 0
	frame_oam -16,   1, $3c, 0
	frame_oam -16,   9, $3e, 0
	frame_oam -16, -15, $38, 0
	frame_oam -32, -15, $1c, 0
	frame_oam -32,  -7, $1e, 0
	frame_oam -32,   1, $04, 0
	frame_oam -32,   9, $06, 0
	frame_oam -58, -11, $1a, 4 | OAM_BANK1
	frame_oam -42, -11, $18, 0 | OAM_BANK1
	frame_oam -58,  -3, $1a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -42,  -3, $18, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50, -19, $1e, 4 | OAM_BANK1
	frame_oam -50,   5, $1e, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_62
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -58, -11, $1a, 4 | OAM_BANK1
	frame_oam -42, -11, $18, 0 | OAM_BANK1
	frame_oam -58,  -3, $1a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -42,  -3, $18, 0 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50, -19, $20, 4 | OAM_BANK1
	frame_oam -50,   5, $20, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_63
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -57, -11, $1a, 4 | OAM_BANK1
	frame_oam -57,  -3, $1a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -50, -19, $22, 4 | OAM_BANK1
	frame_oam -50,   5, $22, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -41, -11, $14, 0 | OAM_BANK1
	frame_oam -41,  -3, $14, 0 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_64
	frame_oam -34,  -8, $10, 0
	frame_oam -34,   0, $12, 0
	frame_oam -18,  -8, $30, 0
	frame_oam -18,   0, $32, 0
	frame_oam -34,   8, $04, 0
	frame_oam -18,   8, $0c, 0
	frame_oam -28,  16, $0e, 0
	frame_oam -12,  16, $58, 0
	frame_oam -46, -19, $1c, 4 | OAM_BANK1
	frame_oam -46,   5, $1c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -57, -11, $26, 4 | OAM_BANK1
	frame_oam -41, -11, $08, 0 | OAM_BANK1
	frame_oam -57,  -3, $26, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -41,  -3, $08, 0 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_65
	frame_oam -18, -15, $38, 0
	frame_oam -18,  -7, $3a, 0
	frame_oam -18,   1, $3c, 0
	frame_oam -34, -15, $1c, 0
	frame_oam -34,  -7, $1e, 0
	frame_oam -18,   9, $3e, 0
	frame_oam -34,   1, $04, 0
	frame_oam -34,   9, $06, 0
	frame_oam -46, -19, $1c, 4 | OAM_BANK1
	frame_oam -46,   5, $1c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -57, -11, $26, 4 | OAM_BANK1
	frame_oam -41, -11, $08, 0 | OAM_BANK1
	frame_oam -57,  -3, $26, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -41,  -3, $08, 0 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_66
	frame_oam -16, -14, $14, 0
	frame_oam -16,  -6, $2a, 0
	frame_oam -32, -14, $08, 0
	frame_oam -32,  -6, $0a, 0
	frame_oam -16,  10, $2e, 0
	frame_oam -32,   2, $04, 0
	frame_oam -32,  10, $06, 0
	frame_oam -16,   2, $1a, 0
	db $80

.frame_67
	frame_oam -16, -15, $16, 0
	frame_oam -16,  -7, $18, 0
	frame_oam -32, -15, $44, 0
	frame_oam -32,  -7, $46, 0
	frame_oam -32,   1, $04, 0
	frame_oam -26,   9, $0e, 0
	frame_oam -16,   1, $2c, 0
	frame_oam -10,   9, $58, 0
	db $80

.frame_68
	frame_oam -32, -15, $48, 0
	frame_oam -32,  -7, $4a, 0
	frame_oam -32,   1, $4c, 0
	frame_oam -32,   9, $4e, 0
	frame_oam -16, -15, $50, 0
	frame_oam -16,  -7, $52, 0
	frame_oam -16,   1, $54, 0
	frame_oam -16,   9, $56, 0
	db $80

Frameset_1fed53:
	db   0,  2
	db   1,  2
	db   2,  2
	db   3,  2
	db   0,  2
	db   1,  2
	db   2,  2
	db   3,  2
	db   0,  2
	db   1,  2
	db   2,  2
	db   3,  2
	db   0,  2
	db   1,  2
	db   2,  2
	db   3,  2
	db   0,  2
	db   1,  2
	db   2,  2
	db   3,  2
	db $ff

Frameset_1fed7c::
	db   4,  5
	db   5,  5
	db   6,  5
	db   7,  5
	db   8,  5
	db   9,  5
	db  10,  5
	db  11,  5
	db  12,  5
	db  13,  5
	db $ff

Frameset_1fed91::
	db  14,  5
	db  15,  5
	db  16,  5
	db  17,  5
	db  18,  5
	db  19,  5
	db  20,  5
	db  21,  5
	db  22,  5
	db  23,  5
	db $ff

Frameset_1feda6::
	db  24,  3
	db  25,  3
	db  26,  3
	db  27,  3
	db  28,  3
	db  29,  3
	db  30,  3
	db  31,  3
	db  32,  3
	db  33,  3
	db $ff

Frameset_1fedbb::
	db  34,  3
	db  35,  3
	db  36,  3
	db  37,  3
	db  38,  3
	db  39,  3
	db  40,  3
	db  41,  3
	db  42,  3
	db  43,  3
	db $ff

Frameset_1fedd0::
	db  46,  5
	db  47,  5
	db  48,  5
	db  49,  5
	db  50,  5
	db  51,  5
	db  52,  5
	db  53,  5
	db  44,  5
	db  45,  5
	db $ff

Frameset_1fede5:
	db  56,  3
	db  57,  3
	db  58,  3
	db  59,  3
	db  65,  1
	db  60,  2
	db  61,  3
	db  62,  3
	db  63,  3
	db  54,  3
	db  64,  1
	db  55,  2
	db $ff

Frameset_1fedfe::
	db  66,  2
	db  67,  3
	db  68,  4
	db $ff

OAM_1fee05::
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4

.frame_0
	frame_oam -19,  13, $2e, 0
	frame_oam -35,   5, $04, 0
	frame_oam -35,  13, $06, 0
	frame_oam -35,  -3, $42, 0
	frame_oam -35, -11, $40, 0
	frame_oam -19, -11, $38, 0
	frame_oam -19,  -3, $3a, 0
	frame_oam -19,   5, $5a, 0
	db $80

.frame_1
	frame_oam -18,  12, $2e, 0
	frame_oam -34,   4, $04, 0
	frame_oam -34,  12, $06, 0
	frame_oam -34,  -4, $42, 0
	frame_oam -34, -12, $40, 0
	frame_oam -18, -12, $20, 0
	frame_oam -18,  -4, $2a, 0
	frame_oam -18,   4, $2c, 0
	db $80

.frame_2
	frame_oam -35, -14, $1c, 0
	frame_oam -35,  -6, $1e, 0
	frame_oam -19,   2, $34, 0
	frame_oam -19,  10, $36, 0
	frame_oam -35,   2, $04, 0
	frame_oam -35,  10, $06, 0
	frame_oam -19,  -6, $18, 0
	frame_oam -19, -14, $20, 0
	db $80

.frame_3
	frame_oam -19, -10, $14, 0
	frame_oam -19,  -2, $2a, 0
	frame_oam -35, -10, $08, 0
	frame_oam -35,  -2, $0a, 0
	frame_oam -19,  14, $2e, 0
	frame_oam -35,   6, $04, 0
	frame_oam -35,  14, $06, 0
	frame_oam -19,   6, $1a, 0
	db $80

.frame_4
	frame_oam -17, -11, $16, 0
	frame_oam -17,  -3, $18, 0
	frame_oam -33, -11, $44, 0
	frame_oam -33,  -3, $46, 0
	frame_oam -33,   5, $04, 0
	frame_oam -27,  13, $0e, 0
	frame_oam -17,   5, $2c, 0
	frame_oam -11,  13, $58, 0
	db $80

Frameset_1feeb4::
	db   0,  4
	db   1,  6
	db   2,  4
	db   1,  6
	db $ff

; unreferenced
Frameset_1feebd:
	db   0,  1
	db   3,  8
	db   4,  8
	db $ff

Frameset_1feec4::
	db   1,  2
	db $ff

OAM_1feec7:
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

.frame_0
	frame_oam -41,  -4, $12, 1
	frame_oam -41, -11, $10, 1
	frame_oam -41,   3, $10, 1 | OAM_XFLIP
	frame_oam -57,   0, $0e, 1
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32,   4, $04, 0
	frame_oam -57,  -8, $0c, 1
	frame_oam -16, -12, $06, 0
	frame_oam -16,  -4, $08, 0
	frame_oam -16,   4, $0a, 0
	db $80

.frame_1
	frame_oam -52,   0, $0e, 1
	frame_oam -36, -12, $10, 1
	frame_oam -36,  -4, $12, 1
	frame_oam -36,   4, $10, 1 | OAM_XFLIP
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -52,  -8, $0c, 1
	frame_oam -32,   4, $04, 0
	frame_oam -16, -12, $06, 0
	frame_oam -16,  -4, $08, 0
	frame_oam -16,   4, $0a, 0
	db $80

.frame_2
	frame_oam -30, -12, $10, 1
	frame_oam -30,  -4, $12, 1
	frame_oam -30,   4, $10, 1 | OAM_XFLIP
	frame_oam -46,  -8, $0c, 1
	frame_oam -46,   0, $0e, 1
	frame_oam -16, -12, $06, 0
	frame_oam -16,  -4, $08, 0
	frame_oam -16,   4, $0a, 0
	db $80

.frame_3
	frame_oam -49,  -8, $4c, 0
	frame_oam -49,   0, $4e, 0
	frame_oam -32, -12, $14, 1
	frame_oam -32,  -4, $16, 1
	frame_oam -32,   4, $18, 1
	frame_oam -16, -12, $1a, 1
	frame_oam -16,  -4, $1c, 1
	frame_oam -16,   4, $1e, 1
	frame_oam -29, -22, $38, 1 | OAM_XFLIP
	db $80

.frame_4
	frame_oam -68,  -8, $4c, 0
	frame_oam -68,   0, $4e, 0
	frame_oam -32,  -8, $0c, 1
	frame_oam -30,   0, $0e, 1
	frame_oam -16,   4, $22, 1
	frame_oam -42,  13, $38, 1
	frame_oam -32, -36, $38, 1 | OAM_XFLIP
	frame_oam -16, -12, $10, 1
	frame_oam -16,  -4, $20, 1
	db $80

.frame_5
	frame_oam -62,  -8, $4c, 0
	frame_oam -63,   0, $4e, 0
	frame_oam -16,  -4, $28, 1
	frame_oam -43,  29, $38, 1
	frame_oam -16, -12, $24, 1
	frame_oam -16,   4, $24, 1 | OAM_XFLIP
	db $80

.frame_6
	frame_oam -57,   0, $4c, 0 | OAM_XFLIP
	frame_oam -57,  -8, $4e, 0 | OAM_XFLIP
	frame_oam -16,  -4, $28, 1
	frame_oam -16, -12, $26, 1
	frame_oam -16,   4, $26, 1 | OAM_XFLIP
	db $80

.frame_7
	frame_oam -51,  -8, $4c, 0
	frame_oam -51,   0, $4e, 0
	frame_oam -16, -12, $2a, 1
	frame_oam -16,   4, $2a, 1 | OAM_XFLIP
	frame_oam -16,  -4, $2c, 1
	db $80

.frame_8
	frame_oam -29,  -8, $4e, 0 | OAM_XFLIP
	frame_oam -29,   0, $4c, 0 | OAM_XFLIP
	frame_oam -16, -12, $2a, 1
	frame_oam -16,   4, $2a, 1 | OAM_XFLIP
	frame_oam -16,  -4, $2c, 1
	db $80

.frame_9
	frame_oam -30,   0, $4e, 0
	frame_oam -29,  -8, $4c, 0
	frame_oam -16,  -4, $28, 1
	frame_oam -16, -12, $26, 1
	frame_oam -16,   4, $26, 1 | OAM_XFLIP
	db $80

.frame_10
	frame_oam -29,   0, $4e, 0
	frame_oam -29,  -8, $4c, 0
	frame_oam -16, -12, $2e, 1
	frame_oam -16,   4, $2e, 1 | OAM_XFLIP
	frame_oam -16,  -4, $30, 1
	db $80

.frame_11
	frame_oam -30,  -8, $4c, 0
	frame_oam -30,   0, $4e, 0
	frame_oam -17, -12, $2e, 1
	frame_oam -17,   4, $2e, 1 | OAM_XFLIP
	frame_oam -17,  -4, $30, 1
	db $80

.frame_12
	frame_oam -31,  -8, $4c, 0
	frame_oam -32,   0, $4e, 0
	frame_oam -16, -12, $2e, 1
	frame_oam -16,   4, $2e, 1 | OAM_XFLIP
	frame_oam -16,  -4, $30, 1
	db $80

.frame_13
	frame_oam -20, -12, $3a, 1
	frame_oam -20,  -4, $3c, 1
	frame_oam -20,   4, $3e, 1
	frame_oam -36, -13, $34, 0
	frame_oam -36,  -5, $36, 0
	frame_oam -36,   3, $04, 0
	db $80

.frame_14
	frame_oam -38, -13, $34, 0
	frame_oam -38,  -5, $36, 0
	frame_oam -22, -12, $3a, 1
	frame_oam -22,  -4, $3c, 1
	frame_oam -22,   4, $3e, 1
	frame_oam -38,   3, $04, 0
	db $80

.frame_15
	frame_oam -24,  -4, $48, 1
	frame_oam -24,   4, $4a, 1
	frame_oam -24, -12, $46, 1
	frame_oam -40, -12, $00, 0
	frame_oam -40,  -4, $02, 0
	frame_oam -40,   4, $04, 0
	db $80

.frame_16
	frame_oam -18,  -4, $48, 1
	frame_oam -18,   4, $4a, 1
	frame_oam -18, -12, $46, 1
	frame_oam -34, -12, $40, 0
	frame_oam -34,  -4, $42, 0
	frame_oam -34,   4, $44, 0
	db $80

.frame_17
	frame_oam -15,  -4, $48, 1
	frame_oam -15,   4, $4a, 1
	frame_oam -15, -12, $46, 1
	frame_oam -31, -11, $00, 0
	frame_oam -31,  -3, $02, 0
	frame_oam -31,   5, $04, 0
	db $80

.frame_18
	frame_oam -29, -12, $40, 0
	frame_oam -29,  -4, $42, 0
	frame_oam -29,   4, $44, 0
	frame_oam -13, -12, $50, 1
	frame_oam -13,  -4, $52, 1
	frame_oam -13,   4, $54, 1
	db $80

.frame_19
	frame_oam -27, -12, $40, 0
	frame_oam -27,  -4, $42, 0
	frame_oam -27,   4, $44, 0
	frame_oam -11, -12, $68, 1
	frame_oam -11,  -4, $6a, 1
	frame_oam -11,   4, $6c, 1
	db $80

.frame_20
	frame_oam -32, -12, $40, 0
	frame_oam -32,  -4, $42, 0
	frame_oam -32,   4, $44, 0
	frame_oam -16, -12, $46, 1
	frame_oam -16,  -4, $5c, 1
	frame_oam -16,   4, $5e, 1
	db $80

.frame_21
	frame_oam -17, -12, $60, 1
	frame_oam -17,  -4, $5c, 1
	frame_oam -17,   4, $62, 1
	frame_oam -33, -12, $40, 0
	frame_oam -33,  -4, $42, 0
	frame_oam -33,   4, $44, 0
	db $80

.frame_22
	frame_oam -32, -12, $40, 0
	frame_oam -32,  -4, $42, 0
	frame_oam -32,   4, $44, 0
	frame_oam -16, -12, $64, 1
	frame_oam -16,  -4, $58, 1
	frame_oam -16,   4, $66, 1
	db $80

.frame_23
	frame_oam -15, -12, $56, 1
	frame_oam -15,  -4, $58, 1
	frame_oam -15,   4, $5a, 1
	frame_oam -31, -12, $40, 0
	frame_oam -31,  -4, $42, 0
	frame_oam -31,   4, $44, 0
	db $80

.frame_24
	frame_oam -41,  -4, $12, 1 | OAM_XFLIP
	frame_oam -41,   3, $10, 1 | OAM_XFLIP
	frame_oam -41, -11, $10, 1
	frame_oam -57,  -8, $0e, 1 | OAM_XFLIP
	frame_oam -32,   4, $00, 0 | OAM_XFLIP
	frame_oam -32,  -4, $02, 0 | OAM_XFLIP
	frame_oam -32, -12, $04, 0 | OAM_XFLIP
	frame_oam -57,   0, $0c, 1 | OAM_XFLIP
	frame_oam -16,   4, $06, 0 | OAM_XFLIP
	frame_oam -16,  -4, $08, 0 | OAM_XFLIP
	frame_oam -16, -12, $0a, 0 | OAM_XFLIP
	db $80

.frame_25
	frame_oam -52,  -8, $0e, 1 | OAM_XFLIP
	frame_oam -36,   4, $10, 1 | OAM_XFLIP
	frame_oam -36,  -4, $12, 1 | OAM_XFLIP
	frame_oam -36, -12, $10, 1
	frame_oam -32,   4, $00, 0 | OAM_XFLIP
	frame_oam -32,  -4, $02, 0 | OAM_XFLIP
	frame_oam -52,   0, $0c, 1 | OAM_XFLIP
	frame_oam -32, -12, $04, 0 | OAM_XFLIP
	frame_oam -16,   4, $06, 0 | OAM_XFLIP
	frame_oam -16,  -4, $08, 0 | OAM_XFLIP
	frame_oam -16, -12, $0a, 0 | OAM_XFLIP
	db $80

.frame_26
	frame_oam -30,   4, $10, 1 | OAM_XFLIP
	frame_oam -30,  -4, $12, 1 | OAM_XFLIP
	frame_oam -30, -12, $10, 1
	frame_oam -46,   0, $0c, 1 | OAM_XFLIP
	frame_oam -46,  -8, $0e, 1 | OAM_XFLIP
	frame_oam -16,   4, $06, 0 | OAM_XFLIP
	frame_oam -16,  -4, $08, 0 | OAM_XFLIP
	frame_oam -16, -12, $0a, 0 | OAM_XFLIP
	db $80

.frame_27
	frame_oam -49,   0, $4c, 0 | OAM_XFLIP
	frame_oam -49,  -8, $4e, 0 | OAM_XFLIP
	frame_oam -32,   4, $14, 1 | OAM_XFLIP
	frame_oam -32,  -4, $16, 1 | OAM_XFLIP
	frame_oam -32, -12, $18, 1 | OAM_XFLIP
	frame_oam -16,   4, $1a, 1 | OAM_XFLIP
	frame_oam -16,  -4, $1c, 1 | OAM_XFLIP
	frame_oam -16, -12, $1e, 1 | OAM_XFLIP
	frame_oam -29,  14, $38, 1
	db $80

.frame_28
	frame_oam -68,   0, $4c, 0 | OAM_XFLIP
	frame_oam -68,  -8, $4e, 0 | OAM_XFLIP
	frame_oam -32,   0, $0c, 1 | OAM_XFLIP
	frame_oam -30,  -8, $0e, 1 | OAM_XFLIP
	frame_oam -16, -12, $22, 1 | OAM_XFLIP
	frame_oam -42, -21, $38, 1 | OAM_XFLIP
	frame_oam -32,  28, $38, 1
	frame_oam -16,   4, $10, 1 | OAM_XFLIP
	frame_oam -16,  -4, $20, 1 | OAM_XFLIP
	db $80

.frame_29
	frame_oam -62,   0, $4c, 0 | OAM_XFLIP
	frame_oam -63,  -8, $4e, 0 | OAM_XFLIP
	frame_oam -16,   4, $26, 1 | OAM_XFLIP
	frame_oam -16,  -4, $28, 1 | OAM_XFLIP
	frame_oam -16, -12, $26, 1
	frame_oam -43, -37, $38, 1 | OAM_XFLIP
	db $80

.frame_30
	frame_oam -57,  -8, $4c, 0
	frame_oam -57,   0, $4e, 0
	frame_oam -16,  -4, $28, 1 | OAM_XFLIP
	frame_oam -16,   4, $26, 1 | OAM_XFLIP
	frame_oam -16, -12, $26, 1
	db $80

.frame_31
	frame_oam -51,   0, $4c, 0 | OAM_XFLIP
	frame_oam -51,  -8, $4e, 0 | OAM_XFLIP
	frame_oam -16, -12, $2a, 1
	frame_oam -16,   4, $2a, 1 | OAM_XFLIP
	frame_oam -16,  -4, $2c, 1
	db $80

.frame_32
	frame_oam -29,   0, $4e, 0
	frame_oam -29,  -8, $4c, 0
	frame_oam -16, -12, $2a, 1
	frame_oam -16,   4, $2a, 1 | OAM_XFLIP
	frame_oam -16,  -4, $2c, 1
	db $80

.frame_33
	frame_oam -30,  -8, $4e, 0 | OAM_XFLIP
	frame_oam -29,   0, $4c, 0 | OAM_XFLIP
	frame_oam -16,  -4, $28, 1 | OAM_XFLIP
	frame_oam -16,   4, $26, 1 | OAM_XFLIP
	frame_oam -16, -12, $26, 1
	db $80

.frame_34
	frame_oam -29,  -8, $4e, 0 | OAM_XFLIP
	frame_oam -29,   0, $4c, 0 | OAM_XFLIP
	frame_oam -16, -12, $2e, 1
	frame_oam -16,   4, $2e, 1 | OAM_XFLIP
	frame_oam -16,  -4, $30, 1
	db $80

.frame_35
	frame_oam -30,   0, $4c, 0 | OAM_XFLIP
	frame_oam -30,  -8, $4e, 0 | OAM_XFLIP
	frame_oam -17, -12, $2e, 1
	frame_oam -17,   4, $2e, 1 | OAM_XFLIP
	frame_oam -17,  -4, $30, 1
	db $80

.frame_36
	frame_oam -31,   0, $4c, 0 | OAM_XFLIP
	frame_oam -32,  -8, $4e, 0 | OAM_XFLIP
	frame_oam -16, -12, $2e, 1
	frame_oam -16,   4, $2e, 1 | OAM_XFLIP
	frame_oam -16,  -4, $30, 1
	db $80

.frame_37
	frame_oam -20,   4, $3a, 1 | OAM_XFLIP
	frame_oam -20,  -4, $3c, 1 | OAM_XFLIP
	frame_oam -20, -12, $3e, 1 | OAM_XFLIP
	frame_oam -36,   5, $34, 0 | OAM_XFLIP
	frame_oam -36,  -3, $36, 0 | OAM_XFLIP
	frame_oam -36, -11, $04, 0 | OAM_XFLIP
	db $80

.frame_38
	frame_oam -38,   5, $34, 0 | OAM_XFLIP
	frame_oam -38,  -3, $36, 0 | OAM_XFLIP
	frame_oam -22,   4, $3a, 1 | OAM_XFLIP
	frame_oam -22,  -4, $3c, 1 | OAM_XFLIP
	frame_oam -22, -12, $3e, 1 | OAM_XFLIP
	frame_oam -38, -11, $04, 0 | OAM_XFLIP
	db $80

.frame_39
	frame_oam -24,  -4, $48, 1 | OAM_XFLIP
	frame_oam -24, -12, $4a, 1 | OAM_XFLIP
	frame_oam -24,   4, $46, 1 | OAM_XFLIP
	frame_oam -40,   4, $00, 0 | OAM_XFLIP
	frame_oam -40,  -4, $02, 0 | OAM_XFLIP
	frame_oam -40, -12, $04, 0 | OAM_XFLIP
	db $80

.frame_40
	frame_oam -18,  -4, $48, 1 | OAM_XFLIP
	frame_oam -18, -12, $4a, 1 | OAM_XFLIP
	frame_oam -18,   4, $46, 1 | OAM_XFLIP
	frame_oam -34,   4, $40, 0 | OAM_XFLIP
	frame_oam -34,  -4, $42, 0 | OAM_XFLIP
	frame_oam -34, -12, $44, 0 | OAM_XFLIP
	db $80

.frame_41
	frame_oam -15,  -4, $48, 1 | OAM_XFLIP
	frame_oam -15, -12, $4a, 1 | OAM_XFLIP
	frame_oam -15,   4, $46, 1 | OAM_XFLIP
	frame_oam -31,   3, $00, 0 | OAM_XFLIP
	frame_oam -31,  -5, $02, 0 | OAM_XFLIP
	frame_oam -31, -13, $04, 0 | OAM_XFLIP
	db $80

.frame_42
	frame_oam -29,   4, $40, 0 | OAM_XFLIP
	frame_oam -29,  -4, $42, 0 | OAM_XFLIP
	frame_oam -29, -12, $44, 0 | OAM_XFLIP
	frame_oam -13,   4, $50, 1 | OAM_XFLIP
	frame_oam -13,  -4, $52, 1 | OAM_XFLIP
	frame_oam -13, -12, $54, 1 | OAM_XFLIP
	db $80

.frame_43
	frame_oam -27,   4, $40, 0 | OAM_XFLIP
	frame_oam -27,  -4, $42, 0 | OAM_XFLIP
	frame_oam -27, -12, $44, 0 | OAM_XFLIP
	frame_oam -11,   4, $68, 1 | OAM_XFLIP
	frame_oam -11,  -4, $6a, 1 | OAM_XFLIP
	frame_oam -11, -12, $6c, 1 | OAM_XFLIP
	db $80

.frame_44
	frame_oam -32,   4, $40, 0 | OAM_XFLIP
	frame_oam -32,  -4, $42, 0 | OAM_XFLIP
	frame_oam -32, -12, $44, 0 | OAM_XFLIP
	frame_oam -16,   4, $46, 1 | OAM_XFLIP
	frame_oam -16,  -4, $5c, 1 | OAM_XFLIP
	frame_oam -16, -12, $5e, 1 | OAM_XFLIP
	db $80

.frame_45
	frame_oam -17,   4, $60, 1 | OAM_XFLIP
	frame_oam -17,  -4, $5c, 1 | OAM_XFLIP
	frame_oam -17, -12, $62, 1 | OAM_XFLIP
	frame_oam -33,   4, $40, 0 | OAM_XFLIP
	frame_oam -33,  -4, $42, 0 | OAM_XFLIP
	frame_oam -33, -12, $44, 0 | OAM_XFLIP
	db $80

.frame_46
	frame_oam -32,   4, $40, 0 | OAM_XFLIP
	frame_oam -32,  -4, $42, 0 | OAM_XFLIP
	frame_oam -32, -12, $44, 0 | OAM_XFLIP
	frame_oam -16,   4, $64, 1 | OAM_XFLIP
	frame_oam -16,  -4, $58, 1 | OAM_XFLIP
	frame_oam -16, -12, $66, 1 | OAM_XFLIP
	db $80

.frame_47
	frame_oam -15,   4, $56, 1 | OAM_XFLIP
	frame_oam -15,  -4, $58, 1 | OAM_XFLIP
	frame_oam -15, -12, $5a, 1 | OAM_XFLIP
	frame_oam -31,   4, $40, 0 | OAM_XFLIP
	frame_oam -31,  -4, $42, 0 | OAM_XFLIP
	frame_oam -31, -12, $44, 0 | OAM_XFLIP
	db $80

.frame_48
	frame_oam -32, -12, $6e, 0
	frame_oam -32,  -4, $70, 0
	frame_oam -32,   4, $72, 0
	frame_oam -16, -12, $74, 1
	frame_oam -16,  -4, $76, 1
	frame_oam -16,   4, $78, 1
	db $80

.frame_49
	frame_oam -32, -16, $7a, 0
	frame_oam -32,  -8, $7c, 0
	frame_oam -16, -16, $32, 1
	frame_oam -16,  -8, $7e, 1
	frame_oam -32,   8, $7a, 0 | OAM_XFLIP
	frame_oam -32,   0, $7c, 0 | OAM_XFLIP
	frame_oam -16,   8, $32, 1 | OAM_XFLIP
	frame_oam -16,   0, $7e, 1 | OAM_XFLIP
	db $80

.frame_50
	frame_oam -32,   4, $6e, 0 | OAM_XFLIP
	frame_oam -32,  -4, $70, 0 | OAM_XFLIP
	frame_oam -32, -12, $72, 0 | OAM_XFLIP
	frame_oam -16,   4, $74, 1 | OAM_XFLIP
	frame_oam -16,  -4, $76, 1 | OAM_XFLIP
	frame_oam -16, -12, $78, 1 | OAM_XFLIP
	db $80

.frame_51
	frame_oam -26, -12, $40, 0
	frame_oam -26,  -4, $42, 0
	frame_oam -26,   4, $44, 0
	frame_oam -16, -12, $2e, 1
	frame_oam -16,   4, $2e, 1 | OAM_XFLIP
	frame_oam -16,  -4, $30, 1
	db $80

.frame_52
	frame_oam -26,   4, $40, 0 | OAM_XFLIP
	frame_oam -26,  -4, $42, 0 | OAM_XFLIP
	frame_oam -26, -12, $44, 0 | OAM_XFLIP
	frame_oam -16,   4, $2e, 1 | OAM_XFLIP
	frame_oam -16, -12, $2e, 1
	frame_oam -16,  -4, $30, 1 | OAM_XFLIP
	db $80

.frame_53
	frame_oam -15, -13, $46, 1
	frame_oam -15,  -5, $48, 1
	frame_oam -15,   3, $4a, 1
	frame_oam -31, -12, $40, 0
	frame_oam -31,  -4, $42, 0
	frame_oam -31,   4, $44, 0
	db $80

.frame_54
	frame_oam -15,  -3, $48, 1
	frame_oam -15,   5, $4a, 1
	frame_oam -15, -11, $46, 1
	frame_oam -31, -11, $00, 0
	frame_oam -31,  -3, $02, 0
	frame_oam -31,   5, $04, 0
	db $80

.frame_55
	frame_oam -15, -11, $46, 1
	frame_oam -15,  -4, $48, 1
	frame_oam -15,   4, $4a, 1
	frame_oam -31, -12, $40, 0
	frame_oam -31,  -4, $42, 0
	frame_oam -31,   4, $44, 0
	db $80

.frame_56
	frame_oam -15,   5, $46, 1 | OAM_XFLIP
	frame_oam -15,  -3, $48, 1 | OAM_XFLIP
	frame_oam -15, -11, $4a, 1 | OAM_XFLIP
	frame_oam -31,   4, $40, 0 | OAM_XFLIP
	frame_oam -31,  -4, $42, 0 | OAM_XFLIP
	frame_oam -31, -12, $44, 0 | OAM_XFLIP
	db $80

.frame_57
	frame_oam -15,  -5, $48, 1 | OAM_XFLIP
	frame_oam -15, -13, $4a, 1 | OAM_XFLIP
	frame_oam -15,   3, $46, 1 | OAM_XFLIP
	frame_oam -31,   3, $00, 0 | OAM_XFLIP
	frame_oam -31,  -5, $02, 0 | OAM_XFLIP
	frame_oam -31, -13, $04, 0 | OAM_XFLIP
	db $80

.frame_58
	frame_oam -15,   3, $46, 1 | OAM_XFLIP
	frame_oam -15,  -4, $48, 1 | OAM_XFLIP
	frame_oam -15, -12, $4a, 1 | OAM_XFLIP
	frame_oam -31,   4, $40, 0 | OAM_XFLIP
	frame_oam -31,  -4, $42, 0 | OAM_XFLIP
	frame_oam -31, -12, $44, 0 | OAM_XFLIP
	db $80

Frameset_1ff560:
	db   0,  1
	db   1,  1
	db   2,  2
	db   3,  5
	db   4,  3
	db   5,  2
	db   6,  2
	db   7,  2
	db   8,  4
	db   9,  4
	db   8,  4
	db  10, 16
	db  11,  2
	db  12,  2
	db  10,  2
	db  11,  2
	db  12,  2
	db  10,  2
	db  11,  2
	db  12,  2
	db  10,  2
	db  11,  2
	db  12,  2
	db  13,  4
	db  14,  6
	db  15,  8
	db  16,  6
	db  17,  4
	db  18,  4
	db  19,  8
	db  18,  4
	db  17,  4
	db  16,  6
	db $ff

Frameset_1ff5a3:
	db  24,  1
	db  25,  1
	db  26,  2
	db  27,  5
	db  28,  3
	db  29,  2
	db  30,  2
	db  31,  2
	db  32,  4
	db  33,  4
	db  32,  4
	db  34, 16
	db  35,  2
	db  36,  2
	db  34,  2
	db  35,  2
	db  36,  2
	db  34,  2
	db  35,  2
	db  36,  2
	db  34,  2
	db  35,  2
	db  36,  2
	db  37,  4
	db  38,  6
	db  39,  8
	db  40,  6
	db  41,  4
	db  42,  4
	db  43,  8
	db  42,  4
	db  41,  4
	db  40,  6
	db $ff

Frameset_1ff5e6:
	db  21,  6
	db  22,  6
	db  23,  6
	db  20,  6
	db $ff

Frameset_1ff5ef:
	db  45,  6
	db  46,  6
	db  47,  6
	db  44,  6
	db $ff

Frameset_1ff5f8:
	db  20,  4
	db $ff

Frameset_1ff5fb:
	db  44,  4
	db $ff

Frameset_1ff5fe:
	db  48,  2
	db  49,  2
	db  50,  2
	db $ff

Frameset_1ff605:
	db  50,  2
	db  48,  2
	db  49,  2
	db $ff

Frameset_1ff60c:
	db  18,  1
	db  19,  2
	db  51,  3
	db  19,  1
	db  18,  1
	db $ff

Frameset_1ff617:
	db  42,  1
	db  43,  2
	db  52,  3
	db  43,  1
	db  42,  1
	db $ff

Frameset_1ff622:
	db  17,  4
	db $ff

Frameset_1ff625:
	db  41,  4
	db $ff

Frameset_1ff628:
	db  53,  2
	db  54,  1
	db  53,  2
	db  54,  1
	db  55,  2
	db  53,  2
	db  54,  1
	db  55,  2
	db $ff

Frameset_1ff639:
	db  56,  2
	db  57,  1
	db  56,  2
	db  57,  1
	db  58,  2
	db  56,  2
	db  57,  1
	db  58,  2
	db $ff

OAM_1ff64a:
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
	frame_oam -26, -12, $00, 1
	frame_oam -26,  -4, $02, 1
	frame_oam -26,   4, $04, 1
	frame_oam -10, -12, $00, 1 | OAM_YFLIP
	frame_oam -10,  -4, $22, 1
	frame_oam -10,   4, $24, 1
	db $80

.frame_1
	frame_oam -10, -12, $00, 1 | OAM_YFLIP
	frame_oam -10,  -4, $02, 1 | OAM_YFLIP
	frame_oam -10,   4, $04, 1 | OAM_YFLIP
	frame_oam -26, -12, $00, 1
	frame_oam -26,  -4, $22, 1 | OAM_YFLIP
	frame_oam -26,   4, $24, 1 | OAM_YFLIP
	db $80

.frame_2
	frame_oam  -6, -12, $06, 1 | OAM_YFLIP
	frame_oam  -6,  -4, $08, 1 | OAM_YFLIP
	frame_oam -22, -12, $26, 1 | OAM_YFLIP
	frame_oam -22,  -4, $28, 1 | OAM_YFLIP
	frame_oam  -6,   4, $06, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -22,   4, $26, 1 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_3
	frame_oam -10,   4, $00, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -10,  -4, $02, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -10, -12, $04, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -26,   4, $00, 1 | OAM_XFLIP
	frame_oam -26,  -4, $22, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -26, -12, $24, 1 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_4
	frame_oam -26,   4, $00, 1 | OAM_XFLIP
	frame_oam -26,  -4, $02, 1 | OAM_XFLIP
	frame_oam -26, -12, $04, 1 | OAM_XFLIP
	frame_oam -10,   4, $00, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -10,  -4, $22, 1 | OAM_XFLIP
	frame_oam -10, -12, $24, 1 | OAM_XFLIP
	db $80

.frame_5
	frame_oam -33, -12, $06, 1
	frame_oam -33,  -4, $08, 1
	frame_oam -17, -12, $26, 1
	frame_oam -17,  -4, $28, 1
	frame_oam -33,   4, $06, 1 | OAM_XFLIP
	frame_oam -17,   4, $26, 1 | OAM_XFLIP
	db $80

.frame_6
	frame_oam -29, -12, $20, 1
	frame_oam -13, -12, $20, 1 | OAM_YFLIP
	frame_oam -29,  -4, $0a, 1
	frame_oam -29,   4, $0c, 1
	frame_oam -13,  -4, $2a, 1
	frame_oam -13,   4, $2c, 1
	db $80

.frame_7
	frame_oam -29, -12, $20, 1
	frame_oam -13, -12, $20, 1 | OAM_YFLIP
	frame_oam -13,  -4, $0a, 1 | OAM_YFLIP
	frame_oam -13,   4, $0c, 1 | OAM_YFLIP
	frame_oam -29,  -4, $2a, 1 | OAM_YFLIP
	frame_oam -29,   4, $2c, 1 | OAM_YFLIP
	db $80

.frame_8
	frame_oam -12, -12, $0e, 1 | OAM_YFLIP
	frame_oam -12,  -4, $10, 1 | OAM_YFLIP
	frame_oam -28, -12, $2e, 1 | OAM_YFLIP
	frame_oam -28,  -4, $30, 1 | OAM_YFLIP
	frame_oam -12,   4, $0e, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -28,   4, $2e, 1 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_9
	frame_oam -29,   4, $20, 1 | OAM_XFLIP
	frame_oam -13,   4, $20, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -13,  -4, $0a, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -13, -12, $0c, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -29,  -4, $2a, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -29, -12, $2c, 1 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_10
	frame_oam -29,   4, $20, 1 | OAM_XFLIP
	frame_oam -13,   4, $20, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -29,  -4, $0a, 1 | OAM_XFLIP
	frame_oam -29, -12, $0c, 1 | OAM_XFLIP
	frame_oam -13,  -4, $2a, 1 | OAM_XFLIP
	frame_oam -13, -12, $2c, 1 | OAM_XFLIP
	db $80

.frame_11
	frame_oam -33, -12, $0e, 1
	frame_oam -33,  -4, $10, 1
	frame_oam -17, -12, $2e, 1
	frame_oam -17,  -4, $30, 1
	frame_oam -33,   4, $0e, 1 | OAM_XFLIP
	frame_oam -17,   4, $2e, 1 | OAM_XFLIP
	db $80

.frame_12
	frame_oam -33, -16, $12, 1
	frame_oam -33,  -8, $14, 1
	frame_oam -33,   0, $16, 1
	frame_oam -33,   8, $12, 1 | OAM_XFLIP
	frame_oam -17, -16, $12, 1 | OAM_YFLIP
	frame_oam -17,  -8, $14, 1 | OAM_YFLIP
	frame_oam -17,   0, $18, 1
	frame_oam -17,   8, $1a, 1
	db $80

.frame_13
	frame_oam -16, -16, $12, 1 | OAM_YFLIP
	frame_oam -16,  -8, $14, 1 | OAM_YFLIP
	frame_oam -16,   0, $16, 1 | OAM_YFLIP
	frame_oam -16,   8, $12, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32, -16, $12, 1
	frame_oam -32,  -8, $14, 1
	frame_oam -32,   0, $18, 1 | OAM_YFLIP
	frame_oam -32,   8, $1a, 1 | OAM_YFLIP
	db $80

.frame_14
	frame_oam -15, -16, $32, 1
	frame_oam -15,  -8, $34, 1
	frame_oam -31, -16, $1c, 1
	frame_oam -31,  -8, $1e, 1
	frame_oam -31,   8, $1c, 1 | OAM_XFLIP
	frame_oam -31,   0, $1e, 1 | OAM_XFLIP
	frame_oam -15,   0, $36, 1
	frame_oam -15,   8, $38, 1
	db $80

.frame_15
	frame_oam -15,   8, $32, 1 | OAM_XFLIP
	frame_oam -15,   0, $34, 1 | OAM_XFLIP
	frame_oam -31, -16, $1c, 1
	frame_oam -31,  -8, $1e, 1
	frame_oam -31,   8, $1c, 1 | OAM_XFLIP
	frame_oam -31,   0, $1e, 1 | OAM_XFLIP
	frame_oam -15,  -8, $36, 1 | OAM_XFLIP
	frame_oam -15, -16, $38, 1 | OAM_XFLIP
	db $80

.frame_16
	frame_oam -16,   8, $12, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,   0, $14, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,  -8, $16, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16, -16, $12, 1 | OAM_YFLIP
	frame_oam -32,   8, $12, 1 | OAM_XFLIP
	frame_oam -32,   0, $14, 1 | OAM_XFLIP
	frame_oam -32,  -8, $18, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32, -16, $1a, 1 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_17
	frame_oam -33,   8, $12, 1 | OAM_XFLIP
	frame_oam -33,   0, $14, 1 | OAM_XFLIP
	frame_oam -33,  -8, $16, 1 | OAM_XFLIP
	frame_oam -33, -16, $12, 1
	frame_oam -17,   8, $12, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -17,   0, $14, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -17,  -8, $18, 1 | OAM_XFLIP
	frame_oam -17, -16, $1a, 1 | OAM_XFLIP
	db $80

.frame_18
	frame_oam -31,   8, $32, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -31,   0, $34, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -15, -16, $1c, 1 | OAM_YFLIP
	frame_oam -15,  -8, $1e, 1 | OAM_YFLIP
	frame_oam -15,   8, $1c, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -15,   0, $1e, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -31,  -8, $36, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -31, -16, $38, 1 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_19
	frame_oam -31, -16, $32, 1 | OAM_YFLIP
	frame_oam -31,  -8, $34, 1 | OAM_YFLIP
	frame_oam -15, -16, $1c, 1 | OAM_YFLIP
	frame_oam -15,  -8, $1e, 1 | OAM_YFLIP
	frame_oam -15,   8, $1c, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -15,   0, $1e, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -31,   0, $36, 1 | OAM_YFLIP
	frame_oam -31,   8, $38, 1 | OAM_YFLIP
	db $80

.frame_20
	frame_oam -20, -14, $3a, 1
	frame_oam -20,  -6, $3a, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -11,  -6, $3a, 1
	frame_oam -11,   2, $3a, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -28,  -2, $3a, 1
	frame_oam -28,   6, $3a, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -36, -10, $3a, 1
	frame_oam -36,  -2, $3a, 1 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_21
	frame_oam -33, -21, $3a, 1
	frame_oam -33, -13, $3a, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -20,   3, $3a, 1
	frame_oam -20,  11, $3a, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16, -11, $3c, 1
	frame_oam  -8, -20, $3c, 1
	frame_oam -51,  -5, $3c, 1 | OAM_YFLIP
	frame_oam -40,  15, $3c, 1 | OAM_YFLIP
	frame_oam -45,  11, $3c, 1 | OAM_XFLIP
	frame_oam -58,  19, $3e, 1 | OAM_YFLIP
	db $80

.frame_22
	frame_oam -18, -17, $3c, 1
	frame_oam -24,   9, $3c, 1
	frame_oam  -3,   4, $3c, 1
	frame_oam -44, -18, $3c, 1
	frame_oam -43, -30, $3c, 1 | OAM_YFLIP
	frame_oam -18, -31, $3e, 1
	frame_oam -15,  18, $3e, 1 | OAM_YFLIP
	frame_oam -37,  25, $3e, 1 | OAM_YFLIP
	frame_oam -63, -26, $3e, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -66,  -9, $3e, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -51,   0, $3e, 1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -61,  24, $3e, 1
	frame_oam -44,  14, $3e, 1
	db $80

Frameset_1ff92b:
	db   0,  3
	db   1,  3
	db   2,  4
	db   3,  3
	db   4,  3
	db   5,  4
	db $ff

Frameset_1ff938:
	db   6,  3
	db   7,  3
	db   8,  4
	db   9,  3
	db  10,  3
	db  11,  4
	db $ff

Frameset_1ff945:
	db  19,  3
	db  12,  2
	db  13,  2
	db  14,  3
	db  15,  3
	db  16,  2
	db  17,  2
	db  18,  3
	db $ff

Frameset_1ff956:
	db   4,  3
	db   3,  3
	db   2,  4
	db   1,  3
	db   0,  3
	db   5,  4
	db $ff

Frameset_1ff963:
	db  10,  3
	db   9,  3
	db   8,  4
	db   7,  3
	db   6,  3
	db  11,  4
	db $ff

Frameset_1ff970:
	db  18,  3
	db  17,  2
	db  16,  2
	db  15,  3
	db  14,  3
	db  13,  2
	db  12,  2
	db  19,  3
	db $ff

Frameset_1ff981:
	db  20,  4
	db  21,  4
	db  22,  4
	db $ff

; unreferenced
Frameset_1ff988:
	db   0,  3
	db   1,  3
	db   2,  4
	db   3,  3
	db   4,  3
	db   5,  4
	db   0,  3
	db   1,  3
	db   2,  4
	db   3,  3
	db   4,  3
	db   5,  4
	db   6,  3
	db   7,  3
	db   8,  4
	db   9,  3
	db  10,  3
	db  11,  4
	db  19,  3
	db  12,  2
	db  13,  2
	db  14,  3
	db  15,  3
	db  16,  2
	db  17,  2
	db  18,  3
	db  19,  3
	db  12,  2
	db  13,  2
	db  14,  3
	db  15,  3
	db  16,  2
	db  17,  2
	db  18,  3
	db $ff

; unreferenced
Frameset_1ff9cd:
	db   4,  3
	db   3,  3
	db   2,  4
	db   1,  3
	db   0,  3
	db   5,  4
	db   4,  3
	db   3,  3
	db   2,  4
	db   1,  3
	db   0,  3
	db   5,  4
	db  10,  3
	db   9,  3
	db   8,  4
	db   7,  3
	db   6,  3
	db  11,  4
	db  18,  3
	db  17,  2
	db  16,  2
	db  15,  3
	db  14,  3
	db  13,  2
	db  12,  2
	db  19,  3
	db  18,  3
	db  17,  2
	db  16,  2
	db  15,  3
	db  14,  3
	db  13,  2
	db  12,  2
	db  19,  3
	db $ff

OAM_1ffa12:
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
	frame_oam -33, -13, $40, 0
	frame_oam -33,  -5, $42, 0
	frame_oam -33,   3, $44, 0
	frame_oam -17,   4, $4a, 0
	frame_oam -17, -12, $4c, 0
	frame_oam -17,  -4, $4e, 0
	db $80

.frame_1
	frame_oam -34, -13, $40, 0
	frame_oam -34,  -5, $42, 0
	frame_oam -34,   3, $44, 0
	frame_oam -18, -12, $46, 0
	frame_oam -18,  -4, $48, 0
	frame_oam -18,   4, $4a, 0
	db $80

.frame_2
	frame_oam -32,  -4, $42, 0
	frame_oam -32,   4, $44, 0
	frame_oam -16,   4, $4a, 0
	frame_oam -32, -12, $50, 0
	frame_oam -16, -12, $52, 0
	frame_oam -16,  -4, $54, 0
	db $80

.frame_3
	frame_oam -32,  -3, $42, 0
	frame_oam -32,   5, $44, 0
	frame_oam -16,   5, $4a, 0
	frame_oam -32, -11, $50, 0
	frame_oam -16, -11, $52, 0
	frame_oam -16,  -3, $54, 0
	db $80

.frame_4
	frame_oam -32,   3, $44, 0
	frame_oam -32, -13, $56, 0
	frame_oam -32,  -5, $58, 0
	frame_oam -16, -13, $5a, 0
	frame_oam -16,  -5, $5c, 0
	frame_oam -16,   3, $5e, 0
	db $80

.frame_5
	frame_oam -32,   3, $44, 0
	frame_oam -16, -13, $5a, 0
	frame_oam -16,  -5, $5c, 0
	frame_oam -16,   3, $5e, 0
	frame_oam -32, -13, $60, 0
	frame_oam -32,  -5, $62, 0
	db $80

.frame_6
	frame_oam -16,  -5, $5c, 0
	frame_oam -16,   3, $5e, 0
	frame_oam -32, -13, $64, 0
	frame_oam -32,  -5, $66, 0
	frame_oam -32,   3, $68, 0
	frame_oam -16, -13, $6a, 0
	db $80

.frame_7
	frame_oam -16, -13, $6c, 0
	frame_oam -16,  -5, $6e, 0
	frame_oam -16,   3, $70, 0
	db $80

.frame_8
	frame_oam -16, -12, $78, 0
	frame_oam -16,  -4, $7a, 0
	frame_oam -16,   4, $78, 0 | OAM_XFLIP
	db $80

.frame_9
	frame_oam -16, -12, $7c, 0
	frame_oam -16,  -4, $7e, 0
	frame_oam -16,   4, $7c, 0 | OAM_XFLIP
	db $80

.frame_10
	frame_oam -17,  -8, $74, 0
	frame_oam -17,   0, $76, 0
	frame_oam  -9, -13, $72, 0
	frame_oam  -9,   5, $72, 0 | OAM_XFLIP
	db $80

.frame_11
	frame_oam  -8, -17, $72, 0
	frame_oam  -8,  -9, $72, 0 | OAM_XFLIP
	frame_oam  -8,   0, $72, 0
	frame_oam  -8,   8, $72, 0 | OAM_XFLIP
	db $80

.frame_12
	frame_oam  -9, -17, $72, 0
	frame_oam  -9,  -9, $72, 0 | OAM_XFLIP
	frame_oam  -9,   0, $72, 0
	frame_oam  -9,   8, $72, 0 | OAM_XFLIP
	db $80

.frame_13
	frame_oam -33,   5, $40, 0 | OAM_XFLIP
	frame_oam -33,  -3, $42, 0 | OAM_XFLIP
	frame_oam -33, -11, $44, 0 | OAM_XFLIP
	frame_oam -17, -12, $4a, 0 | OAM_XFLIP
	frame_oam -17,   4, $4c, 0 | OAM_XFLIP
	frame_oam -17,  -4, $4e, 0 | OAM_XFLIP
	db $80

.frame_14
	frame_oam -34,   5, $40, 0 | OAM_XFLIP
	frame_oam -34,  -3, $42, 0 | OAM_XFLIP
	frame_oam -34, -11, $44, 0 | OAM_XFLIP
	frame_oam -18,   4, $46, 0 | OAM_XFLIP
	frame_oam -18,  -4, $48, 0 | OAM_XFLIP
	frame_oam -18, -12, $4a, 0 | OAM_XFLIP
	db $80

.frame_15
	frame_oam -32,  -4, $42, 0 | OAM_XFLIP
	frame_oam -32, -12, $44, 0 | OAM_XFLIP
	frame_oam -16, -12, $4a, 0 | OAM_XFLIP
	frame_oam -32,   4, $50, 0 | OAM_XFLIP
	frame_oam -16,   4, $52, 0 | OAM_XFLIP
	frame_oam -16,  -4, $54, 0 | OAM_XFLIP
	db $80

.frame_16
	frame_oam -32,  -5, $42, 0 | OAM_XFLIP
	frame_oam -32, -13, $44, 0 | OAM_XFLIP
	frame_oam -16, -13, $4a, 0 | OAM_XFLIP
	frame_oam -32,   3, $50, 0 | OAM_XFLIP
	frame_oam -16,   3, $52, 0 | OAM_XFLIP
	frame_oam -16,  -5, $54, 0 | OAM_XFLIP
	db $80

.frame_17
	frame_oam -32, -11, $44, 0 | OAM_XFLIP
	frame_oam -32,   5, $56, 0 | OAM_XFLIP
	frame_oam -32,  -3, $58, 0 | OAM_XFLIP
	frame_oam -16,   5, $5a, 0 | OAM_XFLIP
	frame_oam -16,  -3, $5c, 0 | OAM_XFLIP
	frame_oam -16, -11, $5e, 0 | OAM_XFLIP
	db $80

.frame_18
	frame_oam -32, -11, $44, 0 | OAM_XFLIP
	frame_oam -16,   5, $5a, 0 | OAM_XFLIP
	frame_oam -16,  -3, $5c, 0 | OAM_XFLIP
	frame_oam -16, -11, $5e, 0 | OAM_XFLIP
	frame_oam -32,   5, $60, 0 | OAM_XFLIP
	frame_oam -32,  -3, $62, 0 | OAM_XFLIP
	db $80

.frame_19
	frame_oam -16,  -3, $5c, 0 | OAM_XFLIP
	frame_oam -16, -11, $5e, 0 | OAM_XFLIP
	frame_oam -32,   5, $64, 0 | OAM_XFLIP
	frame_oam -32,  -3, $66, 0 | OAM_XFLIP
	frame_oam -32, -11, $68, 0 | OAM_XFLIP
	frame_oam -16,   5, $6a, 0 | OAM_XFLIP
	db $80

.frame_20
	frame_oam -16,   5, $6c, 0 | OAM_XFLIP
	frame_oam -16,  -3, $6e, 0 | OAM_XFLIP
	frame_oam -16, -11, $70, 0 | OAM_XFLIP
	db $80

.frame_21
	frame_oam -16,   4, $78, 0 | OAM_XFLIP
	frame_oam -16,  -4, $7a, 0 | OAM_XFLIP
	frame_oam -16, -12, $78, 0
	db $80

.frame_22
	frame_oam -16,   4, $7c, 0 | OAM_XFLIP
	frame_oam -16,  -4, $7e, 0 | OAM_XFLIP
	frame_oam -16, -12, $7c, 0
	db $80

.frame_23
	frame_oam -17,   0, $74, 0 | OAM_XFLIP
	frame_oam -17,  -8, $76, 0 | OAM_XFLIP
	frame_oam  -9,   5, $72, 0 | OAM_XFLIP
	frame_oam  -9, -13, $72, 0
	db $80

.frame_24
	frame_oam  -8,   9, $72, 0 | OAM_XFLIP
	frame_oam  -8,   1, $72, 0
	frame_oam  -8,  -8, $72, 0 | OAM_XFLIP
	frame_oam  -8, -16, $72, 0
	db $80

.frame_25
	frame_oam  -9,   9, $72, 0 | OAM_XFLIP
	frame_oam  -9,   1, $72, 0
	frame_oam  -9,  -8, $72, 0 | OAM_XFLIP
	frame_oam  -9, -16, $72, 0
	db $80

.frame_26
	frame_oam -33, -13, $40, 1
	frame_oam -33,  -5, $42, 1
	frame_oam -33,   3, $44, 1
	frame_oam -17,   4, $4a, 1
	frame_oam -17, -12, $4c, 1
	frame_oam -17,  -4, $4e, 1
	db $80

.frame_27
	frame_oam -33,   5, $40, 1 | OAM_XFLIP
	frame_oam -33,  -3, $42, 1 | OAM_XFLIP
	frame_oam -33, -11, $44, 1 | OAM_XFLIP
	frame_oam -17, -12, $4a, 1 | OAM_XFLIP
	frame_oam -17,   4, $4c, 1 | OAM_XFLIP
	frame_oam -17,  -4, $4e, 1 | OAM_XFLIP
	db $80

Frameset_1ffc8e:
	db   0,  3
	db   1,  3
	db   2,  2
	db   3,  2
	db   2,  2
	db   3,  2
	db   2,  2
	db   4,  5
	db   5,  4
	db   6,  4
	db   7,  4
	db   8,  3
	db   9,  3
	db  10,  3
	db  11, 30
	db  12,  2
	db  11,  2
	db  12,  2
	db  11,  2
	db  12,  2
	db  11,  2
	db  12,  2
	db  11,  2
	db  12,  2
	db  11,  2
	db  10,  2
	db   9,  2
	db   8,  2
	db   7,  2
	db   6,  3
	db   5,  4
	db   4,  5
	db $ff

Frameset_1ffccf:
	db  13,  3
	db  14,  3
	db  15,  2
	db  16,  2
	db  15,  2
	db  16,  2
	db  15,  2
	db  17,  5
	db  18,  4
	db  19,  4
	db  20,  4
	db  21,  3
	db  22,  3
	db  23,  3
	db  24, 30
	db  25,  2
	db  24,  2
	db  25,  2
	db  24,  2
	db  25,  2
	db  24,  2
	db  25,  2
	db  24,  2
	db  25,  2
	db  24,  2
	db  23,  2
	db  22,  2
	db  21,  2
	db  20,  2
	db  19,  3
	db  18,  4
	db  17,  5
	db $ff

Frameset_1ffd10:
	db  26,  2
	db $ff

Frameset_1ffd13:
	db   0,  4
	db $ff

Frameset_1ffd16:
	db  27,  2
	db $ff

Frameset_1ffd19:
	db  13,  4
	db $ff
