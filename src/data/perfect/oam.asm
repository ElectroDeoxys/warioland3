OAM_dd710:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7

.frame_0
	frame_oam  -4, -43, $00, 1
	frame_oam  -4, -35, $02, 1
	frame_oam  -4, -27, $04, 1
	frame_oam  12, -37, $06, 1
	frame_oam  12, -29, $08, 1
	frame_oam  12,  93, $42, 1
	frame_oam   2, 101, $44, 1
	frame_oam  -4, 109, $46, 1
	db $80

.frame_1
	frame_oam -14, -18, $0a, 0
	frame_oam -14, -10, $0c, 0
	frame_oam   2, -14, $0e, 0
	frame_oam   2,  -6, $10, 0
	frame_oam  -4, -43, $00, 1
	frame_oam  -4, -35, $02, 1
	frame_oam  -4, -27, $04, 1
	frame_oam  12, -37, $06, 1
	frame_oam  12, -29, $08, 1
	db $80

.frame_2
	frame_oam -20,   3, $12, 0
	frame_oam -20,  11, $14, 0
	frame_oam -20,  19, $16, 0
	frame_oam  -4,   3, $18, 0
	frame_oam  -4,  11, $1a, 0
	frame_oam  -4,  19, $1c, 0
	frame_oam -14, -18, $0a, 2
	frame_oam -14, -10, $0c, 2
	frame_oam   2, -14, $0e, 2
	frame_oam   2,  -6, $10, 2
	db $80

.frame_3
	frame_oam -20,  28, $1e, 0
	frame_oam -20,  36, $20, 0
	frame_oam  -4,  28, $22, 0
	frame_oam  -4,  36, $24, 0
	frame_oam -20,   3, $12, 5
	frame_oam -20,  11, $14, 5
	frame_oam -20,  19, $16, 5
	frame_oam  -4,   3, $18, 5
	frame_oam  -4,  11, $1a, 5
	frame_oam  -4,  19, $1c, 5
	db $80

.frame_4
	frame_oam -20,  45, $26, 0
	frame_oam -20,  53, $28, 0
	frame_oam  -4,  45, $2a, 0
	frame_oam  -4,  53, $2c, 0
	frame_oam -20,  28, $1e, 3
	frame_oam -20,  36, $20, 3
	frame_oam  -4,  28, $22, 3
	frame_oam  -4,  36, $24, 3
	db $80

.frame_5
	frame_oam -15,  61, $2e, 0
	frame_oam -15,  69, $30, 0
	frame_oam -15,  77, $32, 0
	frame_oam   1,  62, $34, 0
	frame_oam   1,  70, $36, 0
	frame_oam -20,  45, $26, 4
	frame_oam -20,  53, $28, 4
	frame_oam  -4,  45, $2a, 4
	frame_oam  -4,  53, $2c, 4
	db $80

.frame_6
	frame_oam -12,  83, $38, 0
	frame_oam -12,  91, $3a, 0
	frame_oam -12,  99, $3c, 0
	frame_oam   4,  83, $3e, 0
	frame_oam   4,  91, $40, 0
	frame_oam -15,  61, $2e, 5
	frame_oam -15,  69, $30, 5
	frame_oam -15,  77, $32, 5
	frame_oam   1,  62, $34, 5
	frame_oam   1,  70, $36, 5
	db $80

.frame_7
	frame_oam  12,  93, $42, 1
	frame_oam   2, 101, $44, 1
	frame_oam  -4, 109, $46, 1
	frame_oam -12,  83, $38, 2
	frame_oam -12,  91, $3a, 2
	frame_oam -12,  99, $3c, 2
	frame_oam   4,  83, $3e, 2
	frame_oam   4,  91, $40, 2
	db $80
