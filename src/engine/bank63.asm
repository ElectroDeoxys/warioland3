	INCROM $18c000, $18c806

OAM_18c806: ; 18c806 (63:4806)
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
	frame_oam -16,  -8, $80, 6 | OAMF_BANK1
	frame_oam -16,   0, $82, 6 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,  -8, $84, 6 | OAMF_BANK1
	frame_oam -16,   0, $86, 6 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,  -8, $88, 6 | OAMF_BANK1
	frame_oam -16,   0, $8a, 6 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,  -8, $8c, 6 | OAMF_BANK1
	frame_oam -16,   0, $8e, 6 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -16,  -8, $90, 6 | OAMF_BANK1
	frame_oam -16,   0, $92, 6 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16,  -8, $94, 6 | OAMF_BANK1
	frame_oam -16,   0, $96, 6 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16,  -8, $a0, 6 | OAMF_BANK1
	frame_oam -16,   0, $a2, 6 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16,  -8, $a4, 6 | OAMF_BANK1
	frame_oam -16,   0, $a6, 6 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -16,  -8, $a8, 6 | OAMF_BANK1
	frame_oam -16,   0, $aa, 6 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -16,  -8, $ac, 6 | OAMF_BANK1
	frame_oam -16,   0, $ae, 6 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -16,  -8, $b0, 6 | OAMF_BANK1
	frame_oam -16,   0, $b2, 6 | OAMF_BANK1
	db $80

.frame_11
	frame_oam -16,  -8, $b4, 6 | OAMF_BANK1
	frame_oam -16,   0, $b6, 6 | OAMF_BANK1
	db $80
; 0x18c88a

	INCROM $18c88a, $18d07c
