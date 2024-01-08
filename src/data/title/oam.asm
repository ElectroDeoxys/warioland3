OAM_6b5f::
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
