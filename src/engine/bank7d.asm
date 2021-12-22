LoadPauseMenuPals: ; 1f4000 (7d:4000)
	ld hl, Pals_1f4182
	call LoadPalsToTempPals1
	ld hl, Pals_1f41c2
	call LoadPalsToTempPals2
	ret
; 0x1f400d

LoadPauseMenuGfx: ; 1f400d (7d:400d)
	ld hl, PauseMenuGfx
	ld bc, v0Tiles0
	call Decompress

	ld a, [wTransformation]
	cp TRANSFORMATION_OWL_WARIO
	jr z, .owl
	cp TRANSFORMATION_RAIL
	jr z, .rail
	cp (1 << 6) | TRANSFORMATION_VAMPIRE_WARIO
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
	ld bc, $200
	call CopyHLToDE_BC
	ret
; 0x1f403f

Func_1f403f: ; 1f403f (7d:403f)
	ld a, [wca3d]
	bit 1, a
	jr nz, .asm_1f4060
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, BGMap_1f5f49
	ld bc, v1BGMap1
	call Decompress
	xor a
	ldh [rVBK], a
	ld hl, BGMap_1f5de1
	ld bc, v1BGMap1
	call Decompress
	ret

.asm_1f4060
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, BGMap_1f6194
	ld bc, v0BGMap1
	call Decompress
	xor a
	ldh [rVBK], a
	ld hl, BGMap_1f603a
	ld bc, v0BGMap1
	call Decompress

	ld a, [wLevel]
	srl a
	srl a
	srl a
	add a
	ld e, a
	ld d, $00
	ld hl, wca07
	add hl, de
	ld a, [hli]
	ld [w3d511 + 0], a
	ld a, [hl]
	ld [w3d511 + 1], a
	ld hl, v1BGMap1 + $44
	ld bc, -BG_MAP_WIDTH
	ld de, BG_MAP_WIDTH
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

	ld hl, v1BGMap1 + $4b
	ld bc, -BG_MAP_WIDTH
	ld de, BG_MAP_WIDTH
	ld a, [wc0e2]
	swap a
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [wc0e2]
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	inc l
	ld a, [wc0e3]
	swap a
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [wc0e3]
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ret
; 0x1f4117

LoadSaveScreenPals: ; 1f4117 (7d:4117)
	ld hl, Pals_1f628c
	call LoadPalsToTempPals1
	ld hl, Pals_1f628c
	call LoadPalsToTempPals2
	ret
; 0x1f4124

LoadSaveScreenGfx: ; 1f4124 (7d:4124)
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
; 0x1f414e

PrintNowSavingBox: ; 1f414e (7d:414e)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, BGMap_1f69f9
	ld bc, v0BGMap0
	call Decompress
	xor a
	ldh [rVBK], a
	ld hl, BGMap_1f6949
	ld bc, v0BGMap0
	call Decompress
	ret
; 0x1f4168

PrintSaveCompleteBox: ; 1f4168 (7d:4168)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, BGMap_1f6ac2
	ld bc, v0BGMap0
	call Decompress
	xor a
	ldh [rVBK], a
	ld hl, BGMap_1f6a2e
	ld bc, v0BGMap0
	call Decompress
	ret
; 0x1f4182

Pals_1f4182: ; 1f4182 (7d:4182)
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
; 0x1f41c2

Pals_1f41c2: ; 1f41c2 (7d:41c2)
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
; 0x1f4202

PauseMenuGfx: ; 1f4202 (7d:4202)
INCBIN "gfx/pause/pause_menu.2bpp.lz"

ActionHelpOwlGfx: ; 1f57e1 (7d:47e1)
INCBIN "gfx/pause/action_help_owl.2bpp"

ActionHelpRailGfx: ; 1f59e1 (7d:49e1)
INCBIN "gfx/pause/action_help_rail.2bpp"

ActionHelpVampireGfx: ; 1f5be1 (7d:4be1)
INCBIN "gfx/pause/action_help_vampire.2bpp"

BGMap_1f5de1: ; 1f5de1 (7d:5de1)
INCBIN "gfx/bgmaps/map_1f5de1.bin"

BGMap_1f5f49: ; 1f5f49 (7d:5f49)
INCBIN "gfx/bgmaps/map_1f5f49.bin"

BGMap_1f603a: ; 1f603a (7d:603a)
INCBIN "gfx/bgmaps/map_1f603a.bin"

BGMap_1f6194: ; 1f6194 (7d:6194)
INCBIN "gfx/bgmaps/map_1f6194.bin"
; 0x1f628c

Pals_1f628c: ; 1f628c (7d:628c)
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
; 0x1f62cc

SaveBoxGfx: ; 1f62cc (7d:62cc)
INCBIN "gfx/save_box.2bpp.lz"

BGMap_1f6949: ; 1f6949 (7d:6949)
INCBIN "gfx/bgmaps/map_1f6949.bin"

BGMap_1f69f9: ; 1f69f9 (7d:69f9)
INCBIN "gfx/bgmaps/map_1f69f9.bin"

BGMap_1f6a2e: ; 1f6a2e (7d:6a2e)
INCBIN "gfx/bgmaps/map_1f6a2e.bin"

BGMap_1f6ac2: ; 1f6ac2 (7d:6ac2)
INCBIN "gfx/bgmaps/map_1f6ac2.bin"
