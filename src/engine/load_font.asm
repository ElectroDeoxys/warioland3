LoadFontTiles::
	ld hl, FontGfx
	ld bc, v0Tiles0
	call Decompress
	ret

LoadGBIncompatibleScreenGfx::
	ld hl, GBIncompatibleGfx
	ld bc, v0Tiles0
	call Decompress
	ret

LoadGBIncompatibleScreenMap::
	ld hl, GBIncompatibleTilemap
	ld bc, v0BGMap0
	call Decompress
	ld a, %11100100
	ldh [rBGP], a
	ret

LoadFontPals:
	ld hl, Pals_1f3610
	call LoadPalsToTempPals1
	ld hl, Pals_1f3610
	call LoadPalsToTempPals2
	ret

LoadLanguageSelectionText:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, LanguageSelection2TextMap
	ld bc, v1BGMap0
	call Decompress

	xor a
	ldh [rVBK], a
	ld hl, LanguageSelection1TextMap
	ld bc, v0BGMap0
	call Decompress
	ret
