; load 8 animated tiles to v1Tiles2
; these are blocks of tiles with 4 subsets, made of 8 tiles each
; (8 * $10 * 4 = $200 bytes each block)
; wAnimatedTilesGfx determines which of these blocks to load
; wAnimatedTilesFrame determines which of the subset (frame) to load
UpdateRoomAnimatedTiles::
	ldh a, [rLY]
	cp $7c
	jr nc, .done
	jr .useless_jump ; can be fallthrough

.useless_jump
; check whether to advance frame
	ld a, [wAnimatedTilesFrameDuration]
	and a
	jr z, .done
	ld b, a
	ld a, [wAnimatedTilesFrameCount]
	inc a
	ld [wAnimatedTilesFrameCount], a
	cp b
	jr c, .done

; do frame
	xor a
	ld [wAnimatedTilesFrameCount], a
	ld hl, AnimatedTilesGfx
	ld a, [wAnimatedTilesGfx]
	add a
	add h
	ld h, a
	ld a, [wAnimatedTilesFrame]
	inc a
	cp $4
	jr nz, .ok
	xor a ; reset to 0
.ok
	ld [wAnimatedTilesFrame], a
	swap a
	add a
	add a
	add a ; *$80
	ld e, a
	ld d, $00
	rl d
	add hl, de

	ld de, v1Tiles2 tile $70
	ld b, TILE_SIZE
	ld a, BANK("VRAM1")
	ldh [rVBK], a
.loop_copy_tiles
	wait_ppu_busy
	wait_ppu_free
REPT 8
	ld a, [hli]
	ld [de], a
	inc e
ENDR
	dec b
	jr nz, .loop_copy_tiles

	xor a ; VRAM0
	ldh [rVBK], a
.done
	ret
