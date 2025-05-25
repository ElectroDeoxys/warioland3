OverworldClouds1Gfx:: INCBIN "gfx/overworld/clouds1.2bpp"
OverworldClouds2Gfx:: INCBIN "gfx/overworld/clouds2.2bpp"
OverworldSeaGfx::     INCBIN "gfx/overworld/sea.2bpp"
OverworldCliffs1Gfx:: INCBIN "gfx/overworld/cliffs1.2bpp"
OverworldCliffs2Gfx:: INCBIN "gfx/overworld/cliffs2.2bpp"
UnusedOverworldCliffsGfx:: INCBIN "gfx/overworld/unused_cliffs.2bpp" ; unreferenced

; updates animations for clouds, sea and cliffs
UpdateCommonOWAnimations:
	xor a
	ld [w2d031], a

	ld hl, w2d032
	ld c, $00
	call .UpdateBigClouds
	ld hl, w2d035
	ld c, $20
	call .UpdateBigClouds
	ld hl, w2d038
	ld c, $40
	call .UpdateBigClouds
	ld hl, w2d03b
	ld c, $60
	call .UpdateBigClouds
	ld hl, w2d03e
	ld c, $00
	call .UpdateSea
	ld hl, w2d041
	ld c, $20
	call .UpdateSmallClouds

	xor a
	ld [w2d044], a
	ld hl, w2d046
	ld a, [hli]
	and a
	ret z
	dec a
	inc [hl] ; w2d047
	cp [hl]
	ret nc
	xor a
	ld [hli], a ; w2d047
	ld a, [hl] ; w2d048
	inc a
	cp $3 + $1
	jr nz, .asm_1d8b4b
	xor a
.asm_1d8b4b
	ld [hl], a
	ld b, a
	add HIGH(OverworldCliffs1Gfx)
	ld [w2d044 + 0], a
	ld a, b
	rrca
	rrca
	ld [w2d044 + 1], a
	ret

.UpdateBigClouds:
	ld a, [hli]
	and a
	ret z ; no animation
	dec a
	inc [hl]
	cp [hl]
	ret nc ; no frame update
	xor a
	ld [hli], a ; reset counter
	ld a, [hl]
	inc a
	and %11
	ld [hl], a ; current frame

	ld hl, wCloudType
	ld d, [hl]
	sla d ; *2
	ld e, $00
	rra
	rr e
	add d
	ld d, a
	ld hl, OverworldClouds1Gfx
	add hl, de
	ld b, $00
	add hl, bc

	ld d, HIGH(wTilemap tile $24)
	ld a, LOW(wTilemap tile $24)
	add c
	ld e, a
	ld b, 2 tiles
	call CopyHLToDE

	ld hl, w2d031
	set 0, [hl]
	ret

.UpdateSmallClouds:
	ld a, [hli]
	and a
	ret z ; no animation
	dec a
	inc [hl]
	cp [hl]
	ret nc ; no frame update
	xor a
	ld [hli], a ; reset counter
	ld a, [hl]
	inc a
	and %11
	ld [hl], a ; current frame

	ld hl, w2d049
	ld d, [hl]
	rlca
	rlca
	swap a
	ld e, a
	ld hl, OverworldSeaGfx
	add hl, de
	ld b, $00
	add hl, bc

	ld d, HIGH(wTilemap tile $2c)
	ld a, LOW(wTilemap tile $2c)
	add c
	ld e, a
	ld b, 2 tiles
	call CopyHLToDE

	ld hl, w2d031
	set 1, [hl]
	ret

.UpdateSea:
	ld a, [hli]
	and a
	ret z ; no animation
	dec a
	inc [hl]
	cp [hl]
	ret nc ; no frame update
	xor a
	ld [hli], a ; reset counter
	ld a, [hl]
	inc a
	cp $5 + $1
	jr nz, .skip_reset
	xor a ; reset to $0
.skip_reset
	ld [hl], a
	cp $4
	jr z, .rotate_once
	cp $5
	jr z, .no_rotate
; rotate twice
	rlca
.rotate_once
	rlca
.no_rotate
	and %1100
; %0000 -> %0100 -> %1000 -> %1100 -> %1000 -> %0100
	swap a ; *$10
	ld e, a
	ld hl, w2d049
	ld d, [hl]
	ld hl, OverworldSeaGfx
	add hl, de
	ld b, $00
	add hl, bc
	ld d, HIGH(wTilemap tile $2c)
	ld a, LOW(wTilemap tile $2c)
	add c
	ld e, a
	ld b, 2 tiles
	call CopyHLToDE

	ld hl, w2d031
	set 1, [hl]
	ret

_LoadCloudAndSeaGfx:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [wCloudType]
	add a ; *2
	ld d, a
	ld e, $00
	ld hl, OverworldClouds1Gfx
	add hl, de
	push hl
	ld de, v1Tiles2 tile $70
	ld b, 8 tiles
	call CopyHLToDE
	ld hl, OverworldSeaGfx
	ld b, 4 tiles
	call CopyHLToDE
	pop hl
	ld de, wTilemap tile $24
	ld b, 8 tiles
	call CopyHLToDE
	ld hl, OverworldSeaGfx
	ld b, 4 tiles
	call CopyHLToDE
	xor a
	ldh [rVBK], a
	ret

Func_1d8c2c:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld c, LOW(rHDMA1)
	ld a, HIGH(wTilemap tile $24)
	ld [$ff00+c], a
	ld a, LOW(wTilemap tile $24)
	inc c
	ld [$ff00+c], a
	ld a, $17
	inc c
	ld [$ff00+c], a
	xor a
	inc c
	ld [$ff00+c], a
	ld a, $0b
	inc c
	ld [$ff00+c], a

	ld a, [w2d044 + 0]
	and a
	jr z, .done
	ld c, LOW(rHDMA1)
	ld [$ff00+c], a
	ld a, [w2d044 + 1]
	inc c
	ld [$ff00+c], a
	ld a, $0e
	inc c
	ld [$ff00+c], a
	ld a, $c0
	inc c
	ld [$ff00+c], a
	ld a, $13
	inc c
	ld [$ff00+c], a
.done
	xor a
	ldh [rVBK], a
	ret

	ds $39e, $00

WarioUnk2Gfx:
INCBIN "gfx/wario/unk2.2bpp"

WarioUnk3Gfx:
INCBIN "gfx/wario/unk3.2bpp"

WarioUnk4Gfx:
INCBIN "gfx/wario/unk4.2bpp"

WarioSleepGfx::
INCBIN "gfx/wario/sleep.2bpp"

WarioUnk5Gfx:
INCBIN "gfx/wario/unk5.2bpp"
