GBIncompatible:
	call DisableLCD
	call ClearBGMap0
	call ClearVirtualOAM

	farcall LoadGBIncompatibleScreenGfx
	farcall LoadGBIncompatibleScreenMap
	call VBlank_GBIncompatible

	xor a
	ld [wSCX], a
	ldh [rSCX], a
	ld [wSCY], a
	ldh [rSCY], a
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret

ExitGBIncompatible:
	ret
