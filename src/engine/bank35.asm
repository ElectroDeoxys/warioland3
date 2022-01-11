Func_d4000: ; d4000 (35:4000)
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw $402a
	dw SlowFadeFromWhite
	dw $41bb
	dw SlowFadeBGToWhite
	dw $4261
	dw DarkenBGToPal_Fast
	dw $434c
	dw SlowFadeBGToWhite
	dw $43e6
	dw DarkenBGToPal_Fast
	dw $4472
	dw $4507
	dw $454c
	dw $45f0
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
; 0xd402a

	INCROM $d402a, $d4876

; check if a bit is set in wMusicalCoinFlags
; for the level in wOWLevel
_CheckLevelMusicalCoinFlag:: ; d4876 (35:4876)
	ld hl, wMusicalCoinFlags
	ld a, [wOWLevel]
	dec a
	ld c, a
	srl a
	srl a
	srl a ; /8
	ld e, a
	ld d, $00
	add hl, de
	ld a, c
	and %111
	ld c, a
	jr z, .check_flag
.loop_1
	rrc [hl]
	dec c
	jr nz, .loop_1
.check_flag
	ld c, a
	bit 0, [hl]
	jr nz, .flag_set
	ld b, FALSE
	jr .got_result
.flag_set
	ld b, TRUE
.got_result
	ld a, c
	and a
	ret z
.loop_2
	rlc [hl]
	dec a
	jr nz, .loop_2
	ret
; 0xd48a7

	INCROM $d48a7, $d49cc

OAM_d49cc:: ; d49cc (35:49cc)
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
	frame_oam -32, -16, $00, 0
	frame_oam -32,  -8, $02, 0
	frame_oam -16, -16, $20, 0
	frame_oam -16,  -8, $22, 0
	frame_oam -32,   8, $00, 0 | X_FLIP
	frame_oam -32,   0, $02, 0 | X_FLIP
	frame_oam -16,   8, $20, 0 | X_FLIP
	frame_oam -16,   0, $22, 0 | X_FLIP
	db $80

.frame_1
	frame_oam -16, -16, $24, 0
	frame_oam -16,  -8, $26, 0
	frame_oam -32, -12, $04, 0
	frame_oam -32,  -4, $06, 0
	frame_oam -32,   4, $04, 0 | X_FLIP
	frame_oam -16,   8, $24, 0 | X_FLIP
	frame_oam -16,   0, $26, 0 | X_FLIP
	db $80

.frame_2
	frame_oam -16,   0, $08, 0
	frame_oam -16,   8, $0a, 0
	frame_oam -32, -12, $04, 0
	frame_oam -32,  -4, $06, 0
	frame_oam -32,   4, $04, 0 | X_FLIP
	frame_oam -16, -16, $20, 0
	frame_oam -16,  -8, $22, 0
	db $80

.frame_3
	frame_oam -32, -12, $54, 0
	frame_oam -32,  -4, $56, 0
	frame_oam -16, -16, $5c, 0
	frame_oam -16,  -8, $5e, 0
	frame_oam -16,   0, $28, 0
	frame_oam -29,   4, $58, 0
	frame_oam -32,  12, $5a, 0
	db $80

.frame_4
	frame_oam -32, -12, $54, 0
	frame_oam -32,  -4, $56, 0
	frame_oam -16, -16, $5c, 0
	frame_oam -16,  -8, $5e, 0
	frame_oam -16,   0, $28, 0
	frame_oam -29,   4, $58, 0
	frame_oam -32,  12, $5a, 0
	frame_oam -40,   8, $4a, 0
	frame_oam -40,  16, $4a, 0 | X_FLIP
	db $80

.frame_5
	frame_oam -29,   4, $58, 0
	frame_oam -32,  12, $5a, 0
	frame_oam -39,   8, $0c, 4
	frame_oam -39,  16, $0c, 4 | X_FLIP
	frame_oam -32, -12, $54, 0
	frame_oam -32,  -4, $56, 0
	frame_oam -16, -16, $5c, 0
	frame_oam -16,  -8, $5e, 0
	frame_oam -16,   0, $28, 0
	db $80

.frame_6
	frame_oam -32, -12, $54, 0
	frame_oam -32,  -4, $56, 0
	frame_oam -16, -16, $5c, 0
	frame_oam -16,  -8, $5e, 0
	frame_oam -16,   0, $28, 0
	frame_oam -29,   4, $58, 0
	frame_oam -32,  12, $5a, 0
	frame_oam -39,  16, $2c, 4
	frame_oam -39,   8, $2c, 4 | X_FLIP
	db $80

.frame_7
	frame_oam -32,   6, $0e, 0 | X_FLIP
	frame_oam -32,  -1, $10, 0 | X_FLIP
	frame_oam -32,  -9, $12, 0 | X_FLIP
	frame_oam -16,   7, $2e, 0 | X_FLIP
	frame_oam -16,  -1, $30, 0 | X_FLIP
	frame_oam -16,  -9, $32, 0 | X_FLIP
	frame_oam -21, -17, $14, 0 | X_FLIP
	db $80

.frame_8
	frame_oam -16,  -8, $36, 0
	frame_oam -16,   0, $36, 0 | X_FLIP
	frame_oam -16, -16, $34, 0
	frame_oam -16,   8, $34, 0 | X_FLIP
	frame_oam -32,   0, $18, 0 | X_FLIP
	frame_oam -32,  -8, $1a, 0 | X_FLIP
	frame_oam -32,   7, $0e, 0 | X_FLIP
	frame_oam -32, -16, $0e, 0
	db $80

.frame_9
	frame_oam -32,  -8, $16, 0
	frame_oam -16,  -8, $36, 0
	frame_oam -32,   0, $16, 0 | X_FLIP
	frame_oam -16,   0, $36, 0 | X_FLIP
	frame_oam -16, -16, $34, 0
	frame_oam -16,   8, $34, 0 | X_FLIP
	frame_oam -32, -16, $00, 0
	frame_oam -32,   8, $00, 0 | X_FLIP
	db $80

.frame_10
	frame_oam -32, -12, $60, 0
	frame_oam -32,  -4, $62, 0
	frame_oam -32,   4, $60, 0 | X_FLIP
	frame_oam -16, -12, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -16,   4, $64, 0 | X_FLIP
	db $80

.frame_11
	frame_oam -32, -12, $60, 0
	frame_oam -32,  -4, $62, 0
	frame_oam -32,   4, $60, 0 | X_FLIP
	frame_oam -16, -12, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -16,   4, $68, 0
	db $80

.frame_12
	frame_oam -32, -12, $60, 0
	frame_oam -32,  -4, $62, 0
	frame_oam -32,   4, $60, 0 | X_FLIP
	frame_oam -16, -12, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -16,   4, $6a, 0
	db $80

.frame_13
	frame_oam -16, -12, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -16,   4, $64, 0 | X_FLIP
	frame_oam -32, -12, $72, 0
	frame_oam -32,  -4, $74, 0
	frame_oam -32,   4, $72, 0 | X_FLIP
	db $80

.frame_14
	frame_oam -16, -12, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -32, -12, $72, 0
	frame_oam -32,  -4, $74, 0
	frame_oam -32,   4, $72, 0 | X_FLIP
	frame_oam -16,   4, $68, 0
	db $80

.frame_15
	frame_oam -16, -12, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -16,   4, $64, 0 | X_FLIP
	frame_oam -32, -12, $6c, 0
	frame_oam -32,  -4, $6e, 0
	frame_oam -32,   4, $70, 0
	db $80

.frame_16
	frame_oam -16, -12, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -32, -12, $6c, 0
	frame_oam -32,  -4, $6e, 0
	frame_oam -32,   4, $70, 0
	frame_oam -16,   4, $68, 0
	db $80

.frame_17
	frame_oam -16, -12, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -32, -12, $6c, 0
	frame_oam -32,  -4, $6e, 0
	frame_oam -32,   4, $70, 0
	frame_oam -16,   4, $6a, 0
	db $80

.frame_18
	frame_oam -16, -12, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -16,   4, $64, 0 | X_FLIP
	frame_oam -32,   4, $6c, 0 | X_FLIP
	frame_oam -32,  -4, $6e, 0 | X_FLIP
	frame_oam -32, -12, $70, 0 | X_FLIP
	db $80

.frame_19
	frame_oam -32,   4, $60, 0 | X_FLIP
	frame_oam -32,  -4, $62, 0 | X_FLIP
	frame_oam -32, -12, $60, 0
	frame_oam -16,   4, $64, 0 | X_FLIP
	frame_oam -16,  -4, $66, 0 | X_FLIP
	frame_oam -16, -12, $68, 0 | X_FLIP
	db $80

.frame_20
	frame_oam -32,   4, $60, 0 | X_FLIP
	frame_oam -32,  -4, $62, 0 | X_FLIP
	frame_oam -32, -12, $60, 0
	frame_oam -16,   4, $64, 0 | X_FLIP
	frame_oam -16,  -4, $66, 0 | X_FLIP
	frame_oam -16, -12, $6a, 0 | X_FLIP
	db $80

.frame_21
	frame_oam -16,   4, $64, 0 | X_FLIP
	frame_oam -16,  -4, $66, 0 | X_FLIP
	frame_oam -32,   4, $72, 0 | X_FLIP
	frame_oam -32,  -4, $74, 0 | X_FLIP
	frame_oam -32, -12, $72, 0
	frame_oam -16, -12, $68, 0 | X_FLIP
	db $80

.frame_22
	frame_oam -16,   4, $64, 0 | X_FLIP
	frame_oam -16,  -4, $66, 0 | X_FLIP
	frame_oam -16, -12, $64, 0
	frame_oam -32,   4, $6c, 0 | X_FLIP
	frame_oam -32,  -4, $6e, 0 | X_FLIP
	frame_oam -32, -12, $70, 0 | X_FLIP
	db $80

.frame_23
	frame_oam -16,   4, $64, 0 | X_FLIP
	frame_oam -16,  -4, $66, 0 | X_FLIP
	frame_oam -32,   4, $6c, 0 | X_FLIP
	frame_oam -32,  -4, $6e, 0 | X_FLIP
	frame_oam -32, -12, $70, 0 | X_FLIP
	frame_oam -16, -12, $68, 0 | X_FLIP
	db $80

.frame_24
	frame_oam -16,   4, $64, 0 | X_FLIP
	frame_oam -16,  -4, $66, 0 | X_FLIP
	frame_oam -32,   4, $6c, 0 | X_FLIP
	frame_oam -32,  -4, $6e, 0 | X_FLIP
	frame_oam -32, -12, $70, 0 | X_FLIP
	frame_oam -16, -12, $6a, 0 | X_FLIP
	db $80

.frame_25
	frame_oam -16,   4, $64, 0 | X_FLIP
	frame_oam -16,  -4, $66, 0 | X_FLIP
	frame_oam -16, -12, $64, 0
	frame_oam -32, -12, $6c, 0
	frame_oam -32,  -4, $6e, 0
	frame_oam -32,   4, $70, 0
	db $80

.frame_26
	frame_oam -32, -12, $54, 0
	frame_oam -32,  -4, $56, 0
	frame_oam -16, -16, $5c, 0
	frame_oam -16,  -8, $5e, 0
	frame_oam -16,   0, $28, 0
	frame_oam -16,   8, $2a, 0
	frame_oam -32,   4, $76, 0
	frame_oam -32,  12, $78, 0
	db $80

.frame_27
	frame_oam -16, -16, $5c, 0
	frame_oam -16,  -8, $5e, 0
	frame_oam -16,   0, $28, 0
	frame_oam -32, -12, $54, 0
	frame_oam -32,   4, $7a, 0
	frame_oam -32,  -4, $56, 0
	frame_oam -16,   8, $7c, 0
	db $80
; 0xd4d18

	INCROM $d4d18, $d5124

GolfMenuGfx: INCBIN "gfx/golf/golf_menu.2bpp.lz"

	INCROM $d63fd, $d65f2
