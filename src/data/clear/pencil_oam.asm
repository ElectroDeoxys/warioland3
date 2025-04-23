OAM_d65e1:
	dw .frame_0

.frame_0
	frame_oam -16,   0, $b6, 0
	frame_oam -16,   8, $b8, 0
	frame_oam  -8,   0, $ba, 1
	db $80

Frameset_d65f0:
	db   0,  4
	db $ff
