InitTimeAttackDescription:
	call DisableLCD
	call FillBGMap0_With7f
	call ClearVirtualOAM
	call LoadTimeAttackDescriptionPals
	call ApplyTempPals1ToBGPals
	call LoadTimeAttackDescriptionTiles
	call LoadTimeAttackText
	call VBlank_354

	xor a
	ld [wSCY], a
	ldh [rSCY], a
	ld [wSCX], a
	ldh [rSCX], a
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	xor a
	ld [wTimer], a
	ld hl, wSubState
	inc [hl]
	ret

TimeAttackDescription:
	call AdjustJapaneseTimeAttackDescriptionWindow
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	call DisableLCD
	call FillWhiteBGPal
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	jp StartOverworldState
