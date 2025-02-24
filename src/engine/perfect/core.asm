InitPerfectScreen:
	call DisableLCD
	call FillBGMap0_With7f
	call ClearVirtualOAM

	call LoadPerfectPals
	call LoadPerfectGfx
	call Func_dc13e
	call VBlank_Perfect

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

UpdatePerfectScreen:
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
	ld [wUnused_c186], a
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
	call LoadSprite
	ret
