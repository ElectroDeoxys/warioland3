VBlank_ClearScreen:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a

	xor a
	ldh [rVBK], a
	ld hl, v0Tiles2 tile $71 + (TILE_SIZE - 2)
	ld c, [hl]
	ld b, TILE_SIZE - 1
	ld de, v0Tiles2 tile $71 + (TILE_SIZE - 4)
.loop1
	ld a, [de]
	ld [hld], a
	dec l
	dec e
	dec e
	dec b
	jr nz, .loop1
	ld [hl], c

	ld hl, v0Tiles2 tile $71 + (TILE_SIZE - 1)
	ld c, [hl]
	ld b, TILE_SIZE - 1
	ld de, v0Tiles2 tile $71 + (TILE_SIZE - 3)
.loop2
	ld a, [de]
	ld [hld], a
	dec l
	dec e
	dec e
	dec b
	jr nz, .loop2
	ld [hl], c

	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.end

VBlank_MusicalCoinsScreen:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, [wcee4]
	bit 7, a
	jr z, .dma_transfer
	and $7f
	jr nz, .asm_d47d9
	ld hl, wBGMapTileVRAM0Queue
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld [de], a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld [de], a
	jr .asm_d47e6
.asm_d47d9
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, wBGMapTileVRAM0Queue
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld [de], a
.asm_d47e6
	ld hl, wcee4
	res 7, [hl]
.dma_transfer
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.end
