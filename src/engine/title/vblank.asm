VBlank_Title:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, [wROMBank]
	push af
	ld a, BANK(TitleScreenBoxTilemap)
	bankswitch
	ld a, [wcee4]
	bit 7, a
	jr z, .skip
	ld hl, TitleScreenBoxTilemap
	xor a ; VRAM0
	ldh [rVBK], a
	debgcoord 4, 14
	push de
	ld b, 12
	call CopyHLToDE
	pop de
	ld a, e
	add BG_MAP_WIDTH
	ld e, a
	ld a, d
	adc 0
	ld d, a
	ld b, 12
	call CopyHLToDE
	ld hl, wcee4
	res 7, [hl]
.skip
	pop af
	bankswitch
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.end
