_PerfectStateTable:
	ld a, [wSubState]
	jumptable

	dw SlowFadeBGToWhite
	dw Func_dc01e
	dw DarkenBGToPal_Fast
	dw Func_dc073
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset

Func_dc01e:
	call DisableLCD
	call FillBGMap0_With7f
	call ClearVirtualOAM

	call LoadPerfectPals
	call LoadPerfectGfx
	call Func_dc13e
	call VBlank_354

	xor a
	ldh [rSCX], a
	ld [wSCX], a
	ldh [rSCY], a
	ld [wSCY], a

	ld hl, wMenuObj1
	ld a, $23
	ld [hli], a
	ld a, $2b
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_dd848)
	ld [hli], a
	ld a, LOW(Frameset_dd848)
	ld [hl], a
	call UpdateObjAnim

	ld hl, wMenuObj1
	call Func_dc158

	play_music MUSIC_PERFECT

	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	xor a
	ld [wTimer], a
	ld [wGameOverWarioVar], a
	ld hl, wSubState
	inc [hl]
	ret

Func_dc073:
	ld hl, wMenuObj1FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj1
	call Func_dc158
	call ClearUnusedVirtualOAM
	ld hl, wTimer
	ld a, [hl]
	and a
	jr z, .asm_dc08c
	dec [hl]
	jr nz, .asm_dc0cf
.asm_dc08c
	ld a, [wGlobalCounter]
	and %111
	jr nz, .asm_dc0cf
	call SlowFadeInScreen
	ld a, [wSubState]
	cp $03
	jr z, .asm_dc0cf
	ld a, $03
	ld [wSubState], a
	ld hl, wGameOverWarioVar
	inc [hl]
	ld a, [hl]
	dec a
	jr z, .asm_dc0bd
	dec a
	jr z, .asm_dc0c7
	dec a
	jr z, .asm_dc0cc
	dec a
	jr z, .asm_dc0c7
	dec a
	jr z, .asm_dc0c2
	ld [hl], $00
	call Func_dc101
	jr .asm_dc0cf
.asm_dc0bd
	ld a, 240
	ld [wTimer], a
.asm_dc0c2
	call Func_dc10d
	jr .asm_dc0cf
.asm_dc0c7
	call Func_dc119
	jr .asm_dc0cf
.asm_dc0cc
	call Func_dc125

.asm_dc0cf
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	ret nz
	ld a, [wJoypadPressed]
	and a
	ret z
	xor a
	ld [wFadeSpeed], a
	ld [wPalFadeCounter], a
	ld [wc186], a
	ld hl, wGameModeFlags
	set MODE_TIME_ATTACK_F, [hl]
	ld a, ST_PAUSE_MENU
	ld [wState], a
	ld a, SST_PAUSE_28
	ld [wSubState], a
	ret

LoadPerfectPals:
	ld hl, Pals_dc173
	call LoadPalsToTempPals1
	ld hl, Pals_dc1fb
	call LoadPalsToTempPals2
	ret

Func_dc101:
	ld hl, Pals_dc173 palette 5
	ld de, wTempPals1 palette 5
	ld b, 3 palettes
	call CopyHLToDE_Short
	ret

Func_dc10d:
	ld hl, Pals_dc1b3
	ld de, wTempPals1 palette 5
	ld b, 3 palettes
	call CopyHLToDE_Short
	ret

Func_dc119:
	ld hl, Pals_dc1cb
	ld de, wTempPals1 palette 5
	ld b, 3 palettes
	call CopyHLToDE_Short
	ret

Func_dc125:
	ld hl, Pals_dc1e3
	ld de, wTempPals1 palette 5
	ld b, 3 palettes
	call CopyHLToDE_Short
	ret

LoadPerfectGfx:
	xor a
	ldh [rVBK], a
	ld hl, PerfectGfx
	ld bc, v0Tiles0
	call Decompress
	ret

Func_dc13e:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, BGMap_dd5b5
	ld bc, v0BGMap0
	call Decompress
	xor a
	ldh [rVBK], a
	ld hl, BGMap_dd417
	ld bc, v0BGMap0
	call Decompress
	ret

Func_dc158:
	ld a, [hli]
	add OAM_Y_OFS
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	add OAM_X_OFS
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, OAM_dd710
	call TryAddSprite
	ret

Pals_dc173:
	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 31, 26,  2
	rgb 17,  0, 25

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 31, 26,  2
	rgb 31, 15, 12

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 31, 26,  2
	rgb  8, 16, 31

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 31,  8, 15
	rgb 21,  0, 11

	rgb  0,  0,  0
	rgb 31, 26,  2
	rgb 31, 15, 12
	rgb 17,  0,  0

	rgb  0,  0,  0
	rgb 29, 22,  0
	rgb 26,  4,  0
	rgb 13,  0,  0

	rgb  0,  0,  0
	rgb 11, 31,  0
	rgb 29, 13, 21
	rgb 17,  0, 13

	rgb  0,  0,  0
	rgb 11, 31,  0
	rgb  0, 14, 31
	rgb  0,  6, 17

Pals_dc1b3:
	rgb  0,  0,  0
	rgb 14, 27, 14
	rgb  0, 22,  0
	rgb  1, 13,  1

	rgb  0,  0,  0
	rgb 14, 27, 14
	rgb  0, 22,  0
	rgb  1, 13,  1

	rgb  0,  0,  0
	rgb 14, 27, 14
	rgb  0, 22,  0
	rgb  1, 13,  1

Pals_dc1cb:
	rgb  0,  0,  0
	rgb  0, 27, 27
	rgb  0, 18, 28
	rgb  0,  6, 26

	rgb  0,  0,  0
	rgb  0, 27, 27
	rgb  0, 18, 28
	rgb  0,  6, 26

	rgb  0,  0,  0
	rgb  0, 27, 27
	rgb  0, 18, 28
	rgb  0,  6, 26

Pals_dc1e3:
	rgb  0,  0,  0
	rgb 27, 17, 26
	rgb 26,  0, 24
	rgb 15,  0, 25

	rgb  0,  0,  0
	rgb 27, 17, 26
	rgb 26,  0, 24
	rgb 15,  0, 25

	rgb  0,  0,  0
	rgb 27, 17, 26
	rgb 26,  0, 24
	rgb 15,  0, 25

Pals_dc1fb:
	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 23, 23, 23
	rgb 14, 14, 14

	rgb  0,  0,  0
	rgb 30, 11, 24
	rgb 24,  6, 13
	rgb 18,  5,  2

	rgb  0,  0,  0
	rgb 31, 29, 17
	rgb 31, 23, 12
	rgb 21, 14,  0

	rgb  0,  0,  0
	rgb 18, 31, 18
	rgb  0, 27,  2
	rgb  6, 20,  6

	rgb  0,  0,  0
	rgb  2, 31, 31
	rgb  0, 21, 31
	rgb  4, 11, 31

	rgb  0,  0,  0
	rgb 31, 20, 26
	rgb 24, 13, 19
	rgb 21,  8, 15

	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31, 27,  0
	rgb 31,  0, 29
	rgb 19,  0, 29

PerfectGfx: INCBIN "gfx/perfect.2bpp.rle"

BGMap_dd417: INCBIN "gfx/bgmaps/map_dd417.bin"
BGMap_dd5b5: INCBIN "gfx/bgmaps/map_dd5b5.bin"

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

Frameset_dd848:
	db $00,  4
	db $01,  4
	db $02,  4
	db $03,  4
	db $04,  4
	db $05,  4
	db $06,  4
	db $07,  4
	db $ff
