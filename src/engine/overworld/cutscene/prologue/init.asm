_InitPrologue:
    ; clear RAM
	call ClearGeneralSceneRAM
	call ClearSceneObjsRAM

    ; set V-Blank handler
	call VBlank_PrologueEpilogue

    ; load BG maps for the prologue
	decompress_attrmap PrologueAttrmap, v1BGMap1
	decompress_tilemap PrologueTilemap, v0BGMap1

    ; load gfx
	ld hl, PrologueBackgroundGfx
	ld b, BANK(PrologueBackgroundGfx)
	call LoadFarTiles

	decompress_tiles1 FontGfx, v1Tiles0
	decompress_tiles1 PrologueGfx, v1Tiles0

    ; load BG maps for the Music Box scene
	decompress_attrmap MusicBoxAttrmap, v1BGMap0
	decompress_tilemap MusicBoxTilemap, v0BGMap0

    ; load gfx
	ld hl, MusicBoxGfx
	ld de, v0Tiles1
	ld b, BANK(MusicBoxGfx)
	ld c, HIGH($30 tiles)
	call CopyFarBytes_Long

    ; load the prologue text to buffer
	ld a, [wLanguage]
	and a
	jr z, .japanese
; english
	decompress_tilemap TextEN_HiddenFigureAreYouAware, wTextBuffer
	jr .asm_adf63
.japanese
	decompress_tilemap TextJP_HiddenFigureAreYouAware, wTextBuffer
.asm_adf63
	call FillClearedTextBuffer

	; clear temp pals
	xor a
	ld hl, wTempPals1
	ld bc, 8 palettes
	call WriteAToHL_BCTimes
	xor a
	ld hl, wTempPals2
	ld bc, 8 palettes
	call WriteAToHL_BCTimes

    ; init scene Wario object
	ld hl, wSceneWarioYCoord
	ld a, 96
	ld [hli], a ; y
	ld a, 96
	ld [hli], a ; x
	ld a, SCENEWARIO_GROUP_NONE
	ld [wSceneWarioStateGroup], a
	xor a ; SCENEWARIO_NONE
	call SetSceneWarioState

	ld a, LCDC_BG_MAP
	ld [wLCDCFlagsToFlip], a
	ret
