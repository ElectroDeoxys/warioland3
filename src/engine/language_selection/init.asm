InitLanguageSelection:
	call DisableLCD
	call FillBGMap0_With7f
	call ClearVirtualOAM

	farcall LoadFontPals
	farcall LoadFontTiles
	farcall LoadLanguageSelectionText
	call VBlank_LanguageSelection

	xor a
	ld [wSCY], a
	ldh [rSCY], a
	ld [wSCX], a
	ldh [rSCX], a
	ld a, ENGLISH
	ld [wLanguage], a

	ld hl, wMenuObj1
	ld a, 70
	ld [hli], a
	ld a, 24
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_76b5)
	ld [hli], a
	ld a, LOW(Frameset_76b5)
	ld [hl], a
	call UpdateObjAnim
	ld hl, wMenuObj1
	call LoadLanguageSelectionSprite
	call ClearUnusedVirtualOAM
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a

	ld hl, wSubState
	inc [hl]
	ret
