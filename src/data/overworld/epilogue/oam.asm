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
	frame_oam  -6,  -5, $e0, 0 | OAM_BANK1
	db $80

.frame_2
	frame_oam  -6,  -5, $e4, 0 | OAM_BANK1
	db $80

.frame_3
	frame_oam  -6,  -5, $e6, 0 | OAM_BANK1
	db $80

.frame_4
	frame_oam  -6,  -5, $ea, 0 | OAM_BANK1
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
	frame_oam -16,   0, $30, 4 | OAM_XFLIP
	frame_oam -16,  -8, $32, 4 | OAM_XFLIP
	frame_oam -16,   0, $10, 2 | OAM_XFLIP
	frame_oam -16,  -8, $12, 2 | OAM_XFLIP
	db $80

.frame_10
	frame_oam -16,   0, $2c, 4 | OAM_XFLIP
	frame_oam -16,  -8, $2e, 4 | OAM_XFLIP
	frame_oam -16,   0, $0c, 2 | OAM_XFLIP
	frame_oam -16,  -8, $0e, 2 | OAM_XFLIP
	db $80

.frame_11
	frame_oam -16,   0, $28, 4 | OAM_XFLIP
	frame_oam -16,  -8, $2a, 4 | OAM_XFLIP
	frame_oam -16,   0, $1c, 3 | OAM_XFLIP
	frame_oam -16,   0, $08, 2 | OAM_XFLIP
	frame_oam -16,  -8, $0a, 2 | OAM_XFLIP
	db $80

.frame_12
	frame_oam -16,   0, $24, 4 | OAM_XFLIP
	frame_oam -16,  -8, $26, 4 | OAM_XFLIP
	frame_oam -16,   0, $1a, 3 | OAM_XFLIP
	frame_oam -16,   0, $04, 2 | OAM_XFLIP
	frame_oam -16,  -8, $06, 2 | OAM_XFLIP
	db $80

.frame_13
	frame_oam -16,  -4, $18, 3 | OAM_XFLIP
	frame_oam -16,   0, $20, 4 | OAM_XFLIP
	frame_oam -16,  -8, $22, 4 | OAM_XFLIP
	frame_oam -16,   0, $00, 2 | OAM_XFLIP
	frame_oam -16,  -8, $02, 2 | OAM_XFLIP
	db $80
