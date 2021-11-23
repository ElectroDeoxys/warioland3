HiddenFigure1Gfx:: ; d8000 (36:4000)
INCBIN "gfx/enemies/hidden_figure1.2bpp"

HiddenFigure2Gfx:: ; d9800 (36:5800)
INCBIN "gfx/enemies/hidden_figure2.2bpp"

Pals_db000: ; db000 (36:7000)
	rgb  1,  4,  9
	rgb 31,  0,  0
	rgb  6, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb  0, 30, 31
	rgb  6, 10, 10
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb  0, 31, 18
	rgb  6, 10, 10
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb 28, 20,  6
	rgb  6, 10, 10
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb  0, 11, 21
	rgb 31, 25,  0
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb 15,  0,  0
	rgb 31, 25,  0
	rgb  0,  0,  0

	rgb 31, 19, 23
	rgb 21,  8, 17
	rgb 12,  2,  6
	rgb  0,  0,  0

	rgb 27, 23, 11
	rgb 22, 13,  2
	rgb 13,  6,  1
	rgb  5,  2,  0
; 0xdb040

Pals_db040: ; db040 (36:7040)
	rgb 21, 21, 21
	rgb 31, 31, 31
	rgb 31,  0,  0
	rgb  0,  0,  0

	rgb 21, 21, 21
	rgb  4, 24, 12
	rgb  4, 11, 12
	rgb  0,  0,  0

	rgb 21, 21, 21
	rgb 15,  0,  0
	rgb 31, 25,  0
	rgb  0,  0,  0

	rgb 21, 21, 21
	rgb 25, 10,  0
	rgb 31, 25,  0
	rgb  0,  0,  0

	rgb 21, 21, 21
	rgb  0, 21, 31
	rgb 31, 25,  0
	rgb  0,  0,  0
; 0xdb068

HiddenFigure1Map:: ; db068 (36:7068)
INCBIN "gfx/bgmaps/hidden_figure1.bin"
	
HiddenFigure2Map:: ; db193 (36:7193)
INCBIN "gfx/bgmaps/hidden_figure2.bin"

HiddenFigure3Map:: ; db23b (36:723b)
INCBIN "gfx/bgmaps/hidden_figure3.bin"
	
HiddenFigure4Map:: ; db268 (36:7268)
INCBIN "gfx/bgmaps/hidden_figure4.bin"

Func_db277: ; db277 (36:7277)
	ld a, [wSubSequence]
	jumptable

	dw FastFadeToWhite
	dw $729b
	dw SlowFadeFromWhite
	dw $7317
	dw $73e4
	dw FastFadeToWhite
	dw $741b
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
; 0xdb29b

	INCROM $db29b, $db41e

LoadHiddenFigureGfx: ; db41e (36:741e)
	call .LoadPals
	call .LoadTiles
	call .LoadMap
	ret

.LoadPals
	ld hl, Pals_db000
	call LoadPalsToTempPals1
	ld hl, Pals_db040
	ld de, wTempPals2 + palette 3
	ld b, 5 palettes
	call CopyHLToDE_Short
	ret

.LoadTiles
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

.LoadMap
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
; 0xdb486

	INCROM $db486, $dbbf7
