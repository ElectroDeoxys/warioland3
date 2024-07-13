; loads a room's function table, tilemap
; main and special tiles and its palettes
LoadRoomGfx::
	ld d, $00
	ld a, [wRoom]
	add a
	ld e, a
	rl d
	ld hl, RoomBlockAndGfxData
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	debug_assert_not $ff
	ld a, [hli]
	ld [wRoomBlockFunctionTable], a
	ld a, [hli]
	ld [wRoomTileMap], a
	ld a, [hli]
	ld [wRoomMainTiles], a
	ld a, [hli]
	ld [wRoomSpecialTiles], a
	ld a, [hl]
	ld [wRoomPalettes], a

; divide wRoomBlockFunctionTable by 6
	ld b, 0
	ld a, [wRoomBlockFunctionTable]
.loop
	sub $6
	jr c, .div_done
	inc b
	jr .loop
.div_done
	ld a, BANK("Level Data 1")
	add b
	ld [wRoomBlockFunctionTableBank], a
	call Func_298d
	call LoadBlockFunctionTable
	ld a, [wRoomBlockFunctionTableBank]
	ld [wc0d0], a
	call LoadRoomTileMap

	ld a, [wRoomMainTiles]
	srl a
	srl a
	srl a ; /8
	add BANK("Room Main Tiles 1")
	ld [wRoomMainTilesBank], a
	call LoadRoomMainTiles

	ld a, [wRoomSpecialTiles]
	srl a
	srl a
	srl a ; /8
	add BANK("Room Special Tiles 1")
	ld [wRoomSpecialTilesBank], a
	call LoadRoomSpecialTiles

	ld a, BANK("Level Palettes")
	ld [wPaletteBank], a
	call LoadRoomPalettes
	ret

InitRoomAnimatedTiles::
	ld hl, AnimatedTilesGroups
	ld d, $00
	ld a, [wAnimatedTilesGroup]
	add a ; *2
	ld e, a
	rl d
	add hl, de
	ld a, [hli]
	ld [wAnimatedTilesFrameDuration], a
	ld a, [hl]
	ld [wAnimatedTilesGfx], a
	xor a
	ld [wAnimatedTilesFrame], a
	ld [wAnimatedTilesFrameCount], a
	ret

InitRoomAnimatedPals::
	ld hl, RoomPalCycles
	ld d, $00
	ld a, [wRoomPalCycle]
	add a ; *2
	ld e, a
	rl d
	add hl, de
	ld a, [hli]
	ld [wRoomPalCyclePtr + 1], a
	ld a, [hld]
	ld [wRoomPalCyclePtr + 0], a
	ld l, [hl]
	ld h, a
	ld de, ROOM_PAL_CYCLE_LENGTH
	add hl, de
	ld a, [hl]
	ld [wRoomPalCycleDuration], a
	srl a ; /2
	ld [wRoomPalCycleCounter], a
	xor a
	ld [wRoomPalCycleIndex], a
	ret
