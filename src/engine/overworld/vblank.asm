VBlank_Overworld:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, BANK("WRAM2")
	ldh [rWBK], a
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, [wWY]
	ldh [rWY], a
	ld a, [wWX]
	add WX_OFS
	ldh [rWX], a

	ld b, BANK(Func_1d8c2c)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call Func_1d8c2c
	pop af
	bankswitch

	ld hl, wPalConfig1
	ld a, [hl]
	and a
	jr z, .asm_80c5b
	ld c, a
	xor a
	ld [hli], a
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld l, [hl]
	ld h, a
.asm_80c48
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .asm_80c48

.asm_80c5b
	ld a, [wHDMABank]
	ld b, a
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld hl, wHDMA
	ld a, [hl]
	and a
	jr z, .asm_80c84
	ld b, [hl]
	xor a
	ld [hli], a
	ld a, b
	ld c, LOW(rVDMA_SRC_HIGH)
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a

.asm_80c84
	ld hl, w2d0b5
	ld a, [hl]
	and a
	jr z, .asm_80ca2
	ld b, a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	xor a
	ld [hli], a
	ld a, b
	ld c, LOW(rVDMA_SRC_HIGH)
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
.asm_80ca2
	pop af
	bankswitch
	xor a
	ldh [rVBK], a

	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.end

VBlank_OWScene:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, $02
	ldh [rWBK], a
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a

	ld a, [wOWPendingTileUpdate]
	and a
	jr z, .skip_update_tiles
	ld c, LOW(rVDMA_SRC_HIGH)
	ld a, HIGH(wTilemap)
	ld [$ff00+c], a ; rVDMA_SRC_HIGH
	inc c
	xor a ; LOW(wTilemap)
	ld [$ff00+c], a ; rVDMA_SRC_LOW
	inc c
	ld a, HIGH(v0BGMap0) - $80
	ld [$ff00+c], a ; rVDMA_DEST_HIGH
	inc c
	xor a ; LOW(v0BGMap0)
	ld [$ff00+c], a
	inc c
	ld a, 15 dma_rows
	ld [$ff00+c], a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld c, LOW(rVDMA_SRC_HIGH)
	ld a, HIGH(wAttrmap)
	ld [$ff00+c], a ; rVDMA_SRC_HIGH
	inc c
	xor a ; LOW(wAttrmap)
	ld [$ff00+c], a ; rVDMA_SRC_LOW
	inc c
	ld a, HIGH(v1BGMap0) - $80
	ld [$ff00+c], a ; rVDMA_DEST_HIGH
	inc c
	xor a ; LOW(v1BGMap0)
	ld [$ff00+c], a
	inc c
	ld a, 15 dma_rows
	ld [$ff00+c], a
	xor a
	ld [wOWPendingTileUpdate], a

.skip_update_tiles
	ld a, [wHDMABank]
	and a
	jr z, .asm_80d1b
	ld b, a
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call Func_3c03
	pop af
	bankswitch

.asm_80d1b
	xor a
	ldh [rVBK], a
	ld b, BANK(Func_1d8c2c)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call Func_1d8c2c
	pop af
	bankswitch

	ld b, BANK(ApplyPalConfig1)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld a, [wPalConfig1Register]
	and a
	call nz, ApplyPalConfig1
	ld a, [wPalConfig2]
	and a
	call nz, ApplyPalConfig2
	pop af
	bankswitch

	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.end
