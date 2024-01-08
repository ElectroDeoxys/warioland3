InitLevel:
	call DisableLCD
	call FillBGMap0_With7f
	call ClearVirtualOAM
	call ClearParticles

	xor a
	ldh [rSCY], a
	ld [wSCY], a
	ldh [rSCX], a
	ld [wSCX], a

	farcall LoadLevelCommonGfxAndTreasures

	call StartRoom_FromLevelStart
	call UpdateLevelMusic

	ld a, TRUE
	ld [wRoomAnimatedTilesEnabled], a
	xor a
	ld [wceef], a

	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM0")
	sramswitch
	xor a
	ld hl, s0a000
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, s0a800
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	pop af
	sramswitch

	ld hl, wSubState
	inc [hl]
	ld a, [wLevel]
	cp THE_TEMPLE
	jr z, .final_battle
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ret

.final_battle
	farcall LoadHiddenFigureGfx

	ld a, $88
	ld [wc08d], a
	ldh [rWY], a
	ld a, $07
	ldh [rWX], a
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_WINON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ret
