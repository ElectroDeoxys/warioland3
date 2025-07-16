LoadBlockFunctionTable::
	ld a, [wRoomBlockFunctionTable]
	add a
	ld e, a
	ld d, $00
	ld hl, BlockFunctionTablePointers
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(BlockFunctionTablePointers)
	bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	cp $ff
	jr z, .reset
	ld a, [wRoomBlockFunctionTable]
	cp NUM_BLOCKSETS_GROUP_1 - 1
	jr nc, .group_2

; group_1
	ld de, wBlockFunctionTable
	ld b, $00
	call CopyHLToDE
	pop af
	bankswitch
	ret

.group_2
	ld a, [wROMBank]
	push af
	ld a, BANK("Block Function Tables 2")
	bankswitch
	ld de, wBlockFunctionTable
	ld b, $00
	call CopyHLToDE
	pop af
	bankswitch
	pop af
	bankswitch
	ret

.reset
	jp Init

LoadRoom::
	ld a, $70
	ld [wPrevWarioScreenYPos], a
	ld a, $58
	ld [wCamRightSpacing], a
	sub $58
	cpl
	inc a
	add $58
	ld [wCamLeftSpacing], a ; a will always be $58 here

	ld a, [wROMBank]
	push af
	ld a, BANK(LevelRooms)
	bankswitch
	ld a, [wLevel]
	add a ; *2
	ld e, a
	ld d, $00
	rl d
	ld hl, LevelRooms
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	debug_assert_not $ff
	pop af
	bankswitch

	ld a, [wLevel]
	cp THE_GRASSLANDS_NIGHT_1
	jr nc, .group_2
; group_1
	ld a, [wROMBank]
	push af
	ld a, $30
	bankswitch
	jr .got_bank
.group_2
	ld a, [wROMBank]
	push af
	ld a, $31
	bankswitch

.got_bank
	ld a, [wLevelRoomID]
	add a ; *2
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hli]
	ld e, a
	ld h, [hl]
	ld l, e
	ld a, h
	debug_assert_not $ff

	ld a, [hli]
	ld [wWarioSpawnPos], a
	ld a, [hl]
	swap a
	and $0f
	ld [wRoomUpperYLimit], a
	ld a, [hli]
	and $0f
	ld [wRoomLowerYLimit], a
	ld a, [hl]
	swap a
	and $0f
	ld [wRoomLeftXLimit], a
	ld a, [hli]
	and $0f
	ld [wRoomRightXLimit], a
	ld a, [hli]
	ld [wCameraConfigFlags], a

	ld a, [hli]
	ld [wObjectGroup], a
	push hl
	push_wram BANK("Level Objects WRAM")
	farcall LoadObjectGroupData
	pop_wram
	pop hl

	ld a, [hli]
	ld [wAnimatedTilesGroup], a
	push hl
	farcall InitRoomAnimatedTiles
	pop hl

	ld a, [hli]
	ld [wRoomPalCycle], a
	push hl
	farcall InitRoomAnimatedPals
	pop hl

	ld a, [hl]
	ld [wRoom], a
	farcall LoadRoomGfx
	pop af
	bankswitch

	ld a, [wRoomLowerYLimit]
	add a
	add a
	add a
	add a ; *16
	add $a0
	jr nz, .asm_2963
	ld a, $ff
.asm_2963
	ld [wc0c4], a

	ld a, [wRoomUpperYLimit]
	add a
	add a
	add a
	add a ; *16
	add $a0
	ld [wc0c5], a

	ld a, [wRoomRightXLimit]
	add a
	add a
	add a ; *8
	add $b0
	jr nz, .asm_297e
	ld a, $ff
.asm_297e
	ld [wc0c7], a

	ld a, [wRoomLeftXLimit]
	add a
	add a
	add a ; *8
	add $b0
	ld [wc0c6], a
	ret

Func_298d::
	ld a, [wRoomBlockFunctionTable]
	add a
	ld e, a
	ld d, $00
	ld hl, RoomBlockTilesPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wRoomBlockFunctionTableBank]
	ld [wTempBank], a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld de, wRoomBlockTiles
	ld bc, 4 * NUM_ROOM_BLOCK_TYPES
	call CopyHLToDE_BC
	pop af
	bankswitch
	ret

LoadRoomTileMap::
	ld a, [wRoomTileMap]
	add a
	ld e, a
	ld d, $00
	ld hl, RoomBlockAttributePointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc0d0]
	ld [wTempBank], a
	ld bc, wRoomBlockAttributes
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret

LoadRoomMainTiles::
	ld a, [wRoomMainTiles]
	add a
	ld e, a
	ld d, $00
	ld hl, LevelMainTilesPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wRoomMainTilesBank]
	ld [wTempBank], a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld de, v0Tiles2
	ld bc, $800
	call CopyHLToDE_BC
	pop af
	bankswitch
	ret

LoadRoomSpecialTiles::
	ld a, $1 ; VRAM1
	ldh [rVBK], a
	ld a, [wRoomSpecialTiles]
	add a
	ld e, a
	ld d, $00
	ld hl, SpecialTilesPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wRoomSpecialTilesBank]
	ld [wTempBank], a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld de, v0Tiles2
	ld bc, $800
	call CopyHLToDE_BC
	pop af
	bankswitch
	xor a
	ldh [rVBK], a
	ret

LoadRoomPalettes::
	ld a, [wRoomPalettes]
	add a ; *2
	ld e, a
	ld d, $00
	ld hl, RoomPals
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wPaletteBank]
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall LoadPalsToTempPals1
	ret

UpdateRoomAnimatedPals::
	ldh a, [rLY]
	cp $88
	jp nc, .done
	ld a, [wRoomPalCycleDuration]
	and a
	jp z, .done
	ld b, a
	ld a, [wRoomPalCycleCounter]
	inc a
	ld [wRoomPalCycleCounter], a
	cp b
	jp c, .done

	xor a
	ld [wRoomPalCycleCounter], a
	ld a, [wRoomPalCyclePtr + 0]
	ld h, a
	ld a, [wRoomPalCyclePtr + 1]
	ld l, a

	ld a, [wRoomPalCycleIndex]
	inc a
	cp ROOM_PAL_CYCLE_LENGTH
	jr c, .ok
	xor a ; reset to 0
.ok
	ld [wRoomPalCycleIndex], a

	ld e, a
	ld d, $00
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(RoomPalCycles)
	bankswitch
	ld d, $00
	ld a, [hl]
	add a ; *2
	ld e, a
	rl d
	ld hl, RoomPals
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	bankswitch

	ld a, [wROMBank]
	push af
	ld a, BANK("Level Palettes")
	bankswitch
	ld a, BGPI_AUTOINC | palette 0
	ldh [rBGPI], a
	ld b, 5
	ld c, LOW(rBGPD)
.loop_copy_pals
	wait_ppu_busy
	wait_ppu_free
REPT 12
	ld a, [hli]
	ld [$ff00+c], a
ENDR
	dec b
	jr nz, .loop_copy_pals

	wait_ppu_busy
	wait_ppu_free
REPT 3
	ld a, [hli]
	ld [$ff00+c], a
ENDR
	ld a, [hl]
	ld [$ff00+c], a
	pop af
	bankswitch
.done
	ret
