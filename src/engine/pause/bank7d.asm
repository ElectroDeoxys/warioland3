LoadPauseMenuPals:
	ld hl, Pals_1f4182
	call LoadPalsToTempPals1
	ld hl, Pals_1f41c2
	call LoadPalsToTempPals2
	ret

LoadPauseMenuGfx:
	ld hl, PauseMenuGfx
	ld bc, v0Tiles0
	call Decompress

	ld a, [wTransformation]
	cp TRANSFORMATION_OWL_WARIO
	jr z, .owl
	cp TRANSFORMATION_RAIL
	jr z, .rail
	cp TRANSFORMATION_VAMPIRE_WARIO
	jr z, .vampire
	ret
.owl
	ld hl, ActionHelpOwlGfx
	jr .got_tiles
.rail
	ld hl, ActionHelpRailGfx
	jr .got_tiles
.vampire
	ld hl, ActionHelpVampireGfx
	jr .got_tiles ; unnecessary
.got_tiles
	ld de, v0Tiles0
	ld bc, $20 tiles
	call CopyHLToDE_BC
	ret

Func_1f403f:
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jr nz, .asm_1f4060
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, PauseMenuAttrmap
	ld bc, v1BGMap1
	call Decompress
	xor a
	ldh [rVBK], a
	ld hl, PauseMenuTilemap
	ld bc, v1BGMap1
	call Decompress
	ret

.asm_1f4060
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, TimeAttackPauseMenuAttrmap
	ld bc, v0BGMap1
	call Decompress
	xor a
	ldh [rVBK], a
	ld hl, TimeAttackPauseMenuTilemap
	ld bc, v0BGMap1
	call Decompress

	ld a, [wLevel]
	srl a
	srl a
	srl a
	add a
	ld e, a
	ld d, $00
	ld hl, wLevelTimeAttackScores
	add hl, de
	ld a, [hli]
	ld [w3d511 + 0], a
	ld a, [hl]
	ld [w3d511 + 1], a
	hlbgcoord 4, 2, v1BGMap1
	ld bc, -TILEMAP_WIDTH
	ld de, TILEMAP_WIDTH
	ld a, [w3d511 + 0]
	swap a
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [w3d511 + 0]
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	inc l
	ld a, [w3d511 + 1]
	swap a
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [w3d511 + 1]
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc

	hlbgcoord 11, 2, v1BGMap1
	ld bc, -TILEMAP_WIDTH
	ld de, TILEMAP_WIDTH
	ld a, [wLevelTime + 0]
	swap a
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [wLevelTime + 0]
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	inc l
	ld a, [wLevelTime + 1]
	swap a
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [wLevelTime + 1]
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ret

LoadSaveScreenPals:
	ld hl, Pals_1f628c
	call LoadPalsToTempPals1
	ld hl, Pals_1f628c
	call LoadPalsToTempPals2
	ret

LoadSaveScreenGfx:
	xor a
	ldh [rVBK], a
	; unnecessary bankswitch...
	; SaveBoxGfx is located in this bank
	ld hl, SaveBoxGfx
	ld bc, v0Tiles0
	ld a, BANK(SaveBoxGfx)
	ldh [hCallFuncBank], a
	hcall Decompress

	ld hl, WarioSleepGfx
	ld de, v0Tiles0
	ld bc, $800
	ld a, BANK(WarioSleepGfx)
	ld [wTempBank], a
	call FarCopyHLToDE_BC
	ret

DrawSaveInProgressBox:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, SaveInProgressBoxAttrmap
	ld bc, v0BGMap0
	call Decompress
	xor a
	ldh [rVBK], a
	ld hl, SaveInProgressBoxTilemap
	ld bc, v0BGMap0
	call Decompress
	ret

DrawSaveCompleteBox:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, SaveCompleteBoxAttrmap
	ld bc, v0BGMap0
	call Decompress
	xor a
	ldh [rVBK], a
	ld hl, SaveCompleteBoxTilemap
	ld bc, v0BGMap0
	call Decompress
	ret

Pals_1f4182:
	rgb 31, 31, 31
	rgb 21, 21, 19
	rgb 10, 10,  8
	rgb  0,  0,  0

	rgb 27, 31, 18
	rgb 16, 26,  8
	rgb  4, 18,  2
	rgb  0, 14,  0

	rgb 31, 17, 17
	rgb 29, 14, 12
	rgb 27,  7,  5
	rgb 10,  2,  0

	rgb 31, 31, 31
	rgb  9, 10, 31
	rgb  7,  2, 23
	rgb  0,  0,  0

	rgb 31, 27,  0
	rgb 26, 11,  1
	rgb 11,  0,  1
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 23,  0
	rgb 31,  0,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 13, 30, 31
	rgb 11, 19, 31
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 11, 19, 31
	rgb  9, 10, 31
	rgb  0,  0,  0

Pals_1f41c2:
	rgb  0, 22, 16
	rgb 21, 21, 19
	rgb 10, 10,  8
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb  0, 27, 31
	rgb 31,  0, 12
	rgb  5,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 20
	rgb 31, 27,  0
	rgb  9,  5,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 16, 16, 16
	rgb 31,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb  0, 20,  0
	rgb  0, 12, 31

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 30, 15, 31
	rgb 17,  0, 18
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

PauseMenuGfx:
INCBIN "gfx/pause/pause_menu.2bpp.rle"

ActionHelpOwlGfx::
INCBIN "gfx/pause/action_help_owl.2bpp"

ActionHelpRailGfx:
INCBIN "gfx/pause/action_help_rail.2bpp"

ActionHelpVampireGfx:
INCBIN "gfx/pause/action_help_vampire.2bpp"

PauseMenuTilemap: INCBIN "data/bgmaps/pause_menu.tilemap.rle"
PauseMenuAttrmap: INCBIN "data/bgmaps/pause_menu.attrmap.rle"

TimeAttackPauseMenuTilemap: INCBIN "data/bgmaps/time_attack_pause_menu.tilemap.rle"
TimeAttackPauseMenuAttrmap: INCBIN "data/bgmaps/time_attack_pause_menu.attrmap.rle"

Pals_1f628c:
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 30,  0,  3
	rgb 31, 30, 12
	rgb  6,  5, 26

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10

	rgb  0,  0,  0
	rgb 16, 30, 31
	rgb 18,  3, 31
	rgb 31, 30, 12

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 29, 28,  0
	rgb 31, 13,  0

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 28,  0,  4
	rgb 31, 31, 31

	rgb  0,  0,  0
	rgb 31, 30, 12
	rgb 18,  3, 31
	rgb 31, 13,  0

	rgb  0,  0,  0
	rgb 31, 13,  0
	rgb 18,  3, 31
	rgb 28,  0,  4

SaveBoxGfx: INCBIN "gfx/save_box.2bpp.rle"

SaveInProgressBoxTilemap: INCBIN "data/bgmaps/save_in_progress_box.tilemap.rle"
SaveInProgressBoxAttrmap: INCBIN "data/bgmaps/save_in_progress_box.attrmap.rle"

SaveCompleteBoxTilemap: INCBIN "data/bgmaps/save_complete_box.tilemap.rle"
SaveCompleteBoxAttrmap: INCBIN "data/bgmaps/save_complete_box.attrmap.rle"
