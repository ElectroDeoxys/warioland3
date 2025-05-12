LoadHiddenFigureGfx::
	call .LoadPals
	call .LoadTiles
	call .LoadMap
	ret

.LoadPals:
	ld hl, Pals_db000
	call LoadPalsToTempPals1
	ld hl, Pals_db040
	ld de, wTempPals2 + palette 3
	ld b, 5 palettes
	call CopyHLToDE_Short
	ret

.LoadTiles:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, HiddenFigure2Gfx
	ld de, v1Tiles0
	ld bc, $180 tiles
	call CopyHLToDE_BC

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, HiddenFigure1Gfx
	ld de, v0Tiles0
	ld bc, $180 tiles
	call CopyHLToDE_BC
	ret

.LoadMap:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, HiddenFigure2Map
	ld bc, v1BGMap0
	call Decompress
	ld hl, HiddenFigure4Map
	ld bc, v1BGMap1
	call Decompress

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, HiddenFigure1Map
	ld bc, v0BGMap0
	call Decompress
	ld hl, HiddenFigure3Map
	ld bc, v0BGMap1
	call Decompress
	ret

LoadGameOverPals:
	ld hl, Pals_db509
	call LoadPalsToTempPals1
	ld hl, Pals_db549
	call LoadPalsToTempPals2

	ld hl, Pals_86ad5
	ld de, wTempPals2 palette 0
	ld b, 1 palettes
	farcall BANK(Pals_86ad5), CopyHLToDE_Short
	ret

LoadGameOverGfx:
	xor a
	ldh [rVBK], a
	ld hl, GameOverGfx
	ld bc, v0Tiles0
	call Decompress
	ld hl, WarioSleepGfx
	ld de, v0Tiles0
	ld bc, $80 tiles
	farcall BANK(WarioSleepGfx), CopyHLToDE_BC
	ret

Func_db4cf:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, BGMap_dbb8f
	ld bc, v0BGMap0
	call Decompress
	xor a
	ldh [rVBK], a
	ld hl, BGMap_dbaee
	ld bc, v0BGMap0
	call Decompress
	ret

Func_db4e9:
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	add OAM_Y_OFS
	sub b
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	add OAM_X_OFS
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, OAM_dbbd2
	call LoadSprite
	ret
