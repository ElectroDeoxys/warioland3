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

_GameOverStateTable: ; db277 (36:7277)
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw Func_db29b
	dw SlowFadeFromWhite
	dw Func_db317
	dw Func_db3e4
	dw FastFadeToWhite
	dw Func_db41b
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

Func_db29b: ; db29b (36:729b)
	call DisableLCD
	call FillBGMap0_With7f
	call ClearVirtualOAM

	call LoadGameOverPals
	call LoadGameOverGfx
	call Func_db4cf
	call VBlank_354

	xor a
	ldh [rSCX], a
	ld [wSCX], a
	ld a, $60
	ldh [rSCY], a
	ld [wSCY], a

	ld hl, $d515
	ld a, $80
	ld [hli], a
	ld a, $50
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [$d51d], a
	ld [$d522], a
	ld a, $6c
	ld [hli], a
	ld a, $cb
	ld [hl], a

	farcall $2a, UpdateObjAnim

	ld hl, $d515
	call Func_17be
	ld hl, $d523
	ld a, $18
	ld [hli], a
	ld a, $18
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $7b
	ld [hli], a
	ld a, $f5
	ld [hl], a
	call UpdateObjAnim
	ld hl, $d523
	call Func_db4e9

	ld a, LCDC_BGON | LCDC_OBJON | LCDC_OBJ16 | LCDC_ON
	ldh [rLCDC], a
	ld a, 64
	ld [wTimer], a
	ld hl, wSubState
	inc [hl]
	ret
; 0xdb317

Func_db317: ; db317 (36:7317)
	ld a, [$d51d]
	dec a
	jr z, .asm_db338
	dec a
	jr z, .asm_db35b
	dec a
	jr z, .asm_db38a
	ld hl, wTimer
	dec [hl]
	jp nz, .asm_db3a9

	play_sfx SFX_134
	ld hl, $d51d
	inc [hl]
	jr .asm_db3a9

.asm_db338
	ld hl, wSCY
	dec [hl]
	dec [hl]
	dec [hl]
	jr nz, .asm_db3a9
	play_sfx SFX_061
	play_music MUSIC_GAME_OVER
	ld a, 6
	ld [wTimer], a
	ld hl, $d51d
	inc [hl]
	jr .asm_db3a9

.asm_db35b
	ld a, [wGlobalCounter]
	and $03
	ret nz
	ld hl, wTimer
	dec [hl]
	ld a, [hl]
	and $01
	jr z, .asm_db371
	ld hl, wSCY
	inc [hl]
	inc [hl]
	jr .asm_db3a9
.asm_db371
	ld hl, wSCY
	dec [hl]
	dec [hl]
	ld a, [wTimer]
	and a
	jr nz, .asm_db3a9
	play_music MUSIC_48
	ld hl, $d51d
	inc [hl]
	jr .asm_db3a9

.asm_db38a
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .asm_db3a9
	play_sfx SFX_0E3
	ld hl, $d519
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $6c
	ld [hli], a
	ld a, $e2
	ld [hl], a
	ld hl, wSubState
	inc [hl]
.asm_db3a9
	ld hl, $d51c
	farcall $2a, UpdateObjAnim
	ld a, [$d514]
	ld [$d520], a
	and a
	call nz, .Func_db3db
	ld hl, $d515
	call Func_17be
	ld hl, $d52a
	call UpdateObjAnim
	ld hl, $d523
	call Func_db4e9
	call ClearUnusedVirtualOAM
	ret

.Func_db3db
	play_sfx SFX_0F5
	ret
; 0xdb3e4

Func_db3e4: ; db3e4 (36:73e4)
	ld hl, $d51c
	farcall $2a, UpdateObjAnim

	ld a, [$d514]
	ld [$d520], a
	ld hl, $d515
	call Func_17be
	ld hl, $d52a
	call UpdateObjAnim
	ld hl, $d523
	call Func_db4e9
	call ClearUnusedVirtualOAM
	ld a, [$d520]
	and a
	ret z
	ld hl, wSubState
	inc [hl]
	ret
; 0xdb41b

Func_db41b: ; db41b (36:741b)
	jp Init
; 0xdb41e

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

LoadGameOverPals: ; db486 (36:7486)
	ld hl, Pals_db509
	call LoadPalsToTempPals1
	ld hl, Pals_db549
	call LoadPalsToTempPals2

	ld hl, Pals_86ad5
	ld de, wTempPals2 palette 0
	ld b, 1 palettes
	farcall BANK(Pals_86ad5), CopyHLToDE_Short
	ret
; 0xdb4aa

LoadGameOverGfx: ; db4aa (36:74aa)
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
; 0xdb4cf

Func_db4cf: ; db4cf (36:74cf)
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
; 0xdb4e9

Func_db4e9: ; db4e9 (36:74e9)
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	add $10
	sub b
	ld [wCurSprite], a
	ld a, [hli]
	add $08
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, OAM_dbbd2
	call TryAddSprite
	ret
; 0xdb509

Pals_db509: ; db509 (36:7509)
	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 31,  3,  0
	rgb 10,  0, 24

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 28, 28,  0
	rgb 19, 11,  0

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 28, 28,  0
	rgb 31,  3,  0

	rgb  0,  0,  0
	rgb 19, 11,  0
	rgb 31,  3,  0
	rgb 10,  0, 24

	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0
; 0xdb549

Pals_db549: ; db549 (36:7549)
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 30,  0,  3
	rgb 31, 30, 12
	rgb  6,  5, 26

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 28, 31,  0
	rgb 22,  8,  0

	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0
; 0xdb589

GameOverGfx: INCBIN "gfx/game_over.2bpp.lz"

BGMap_dbaee: INCBIN "gfx/bgmaps/map_dbaee.bin"
BGMap_dbb8f: INCBIN "gfx/bgmaps/map_dbb8f.bin"

OAM_dbbd2: ; dbbd2 (36:7bd2)
	dw .frame_0

.frame_0
	frame_oam   0,   0, $80, 2
	frame_oam   0,   9, $82, 2
	frame_oam   0,  24, $84, 2
	frame_oam   0,  56, $86, 2
	frame_oam   0, 104, $88, 2
	frame_oam  32,   0, $8a, 2
	frame_oam  32,  56, $8c, 2
	frame_oam  32,  72, $8e, 2
	db $80
; 0xdbbf5

; unreferenced?
Frameset_dbbf5: ; dbbf5 (36:7bf5)
	db $00,  4
	db $ff
; 0xdbbf8
