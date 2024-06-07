; input:
; - e = ?
Func_ba42:
	ldh a, [rSVBK]
	push af
	ld a, BANK("Level Objects WRAM")
	ldh [rSVBK], a
	ld a, [wSRAMBank]
	push af
	ld a, $01
	sramswitch
	push de
	push hl
	ld c, $01
	ld a, [hld]
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr c, .asm_ba68
	inc c
	sub $20
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr c, .asm_ba68
	inc c
	sub $20
.asm_ba68
	ld l, [hl]
	ld h, a
	ld a, c
	ld [wBlockPtrBank], a
	call Func_d8c
	ld a, [wccec]
	sramswitch
	bit 0, b
	jr z, .asm_ba85
	swap e
	ld a, [hl]
	and $0f
	jr .asm_ba88
.asm_ba85
	ld a, [hl]
	and $f0
.asm_ba88
	or e
	ld [hl], a
	pop hl

	ldh a, [rSVBK]
	push af
	ld a, BANK("Level Objects WRAM")
	ldh [rSVBK], a
	ld a, [wSRAMBank]
	push af
	ld a, $01
	sramswitch
	ld c, $01
	ld a, [hld]
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr c, .asm_baaf
	inc c
	sub $20
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr c, .asm_baaf
	inc c
	sub $20
.asm_baaf
	ld d, a
	ld a, [hld]
	ld e, a
	ld a, c
	sramswitch
	ld a, [de]
	or $80
	ld [de], a
	pop af
	sramswitch
	pop af
	ldh [rSVBK], a
	ld a, c
	ld [wBlockPtrBank], a
	ld h, d
	ld l, e
	call Func_d3e
	pop de

	ld c, e
	ld d, h
	ld e, l
	farcall SpawnObject
	pop af
	sramswitch
	pop af
	ldh [rSVBK], a
	ret

; hl = obj unk02
DespawnObject:
	ldh a, [rSVBK]
	push af
	ld a, BANK("Level Objects WRAM")
	ldh [rSVBK], a
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	ld c, $01
	ld a, [hld] ; OBJ_UNK_02
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr c, .asm_bb12
	inc c
	sub $20
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr c, .asm_bb12
	inc c
	sub $20
.asm_bb12
	ld d, a
	ld a, [hld] ; OBJ_UNK_01
	ld e, a
	xor a
	ld [hl], a
	ld a, c
	sramswitch
	ld a, [de]
	or $80
	ld [de], a
	pop af
	sramswitch
	pop af
	ldh [rSVBK], a
	ret

Func_bb2d:
	ldh a, [rSVBK]
	push af
	ld a, BANK("Level Objects WRAM")
	ldh [rSVBK], a
	ld a, [wSRAMBank]
	push af
	ld a, $01
	sramswitch
	ld c, $01
	ld a, [hld]
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr c, .asm_bb51
	inc c
	sub $20
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr c, .asm_bb51
	inc c
	sub $20
.asm_bb51
	ld l, [hl]
	ld h, a
	ld a, c
	ld [wBlockPtrBank], a
	call Func_d8c
	ld a, [wccec]
	sramswitch
	bit 0, b
	jr z, .asm_bb76
	ld a, [hl]
	and $0f
	ld [hl], a
	pop af
	sramswitch
	pop af
	ldh [rSVBK], a
	ret

.asm_bb76
	ld a, [hl]
	and $f0
	ld [hl], a
	pop af
	sramswitch
	pop af
	ldh [rSVBK], a
	ret

Func_bb85:
	ld a, [wIsDMATransferPending]
	and a
	ret nz ; exit if DMA pending

	ld b, BANK("SRAM1")
	ld a, [wc19f]
	ld e, a
	ld d, $00
	ld hl, wc18e
	add hl, de
	ld a, [hli]
	and a
	ret z ; nothing to do

	ld l, [hl]
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr c, .got_sram_bank
	inc b ; BANK("SRAM2")
	sub HIGH(SIZEOF(SRAM))
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr c, .got_sram_bank
	inc b ; BANK("SRAM3")
	sub HIGH(SIZEOF(SRAM))
.got_sram_bank
	ld h, a
	ld a, b
	ld [wBlockPtrBank], a
	sramswitch
	push hl
	call GetBlockPtrBGMapAddress
	ld a, [wBGMapAddressQueueSize]
	ld b, a
	ld de, wBGMapAddressQueue
	ld a, e
	add b
	ld e, a

	; each block is 2x2 tiles
	; current address points to the top-left corner tile

	; top-left tile
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e

	; top-right tile
	ld a, h
	ld [de], a
	inc e
	ld a, l
	and $e0
	ld c, a
	ld a, l
	inc a
	and $1f
	add c
	ld [de], a
	inc e

	; bottom-left tile
	ld bc, BG_MAP_WIDTH
	add hl, bc
	ld a, h
	and $fb
	ld h, a
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e

	; bottom-right tile
	ld a, h
	ld [de], a
	inc e
	ld a, l
	and $e0
	ld c, a
	ld a, l
	inc a
	and $1f
	add c
	ld [de], a

	ld a, [wBGMapAddressQueueSize]
	add $2 * 4
	ld [wBGMapAddressQueueSize], a
	pop hl

	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d ; *4
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	push de
	ld hl, wRoomBlockTiles
	add hl, de
	ld a, [wBGMapTileQueueSize]
	ld e, a
	ld d, HIGH(wBGMapTileVRAM0Queue)
	ld a, LOW(wBGMapTileVRAM0Queue)
	add e
	ld e, a ; wBGMapTileVRAM0Queue + wBGMapTileQueueSize
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop de

	ld hl, w3d300
	add hl, de
	ld a, [wBGMapTileQueueSize]
	ld e, a
	ld d, HIGH(wBGMapTileVRAM1Queue)
	ld a, LOW(wBGMapTileVRAM1Queue)
	add e
	ld e, a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a

	ld a, [wBGMapTileQueueSize]
	add 4
	ld [wBGMapTileQueueSize], a

	ld a, [wc19f]
	ld e, a
	ld d, $00
	ld hl, wc18e
	add hl, de
	xor a
	ld [hli], a
	ld [hl], a
	ld a, e
	add 2
	and $0f
	ld [wc19f], a
	pop af
	ldh [rSVBK], a
	ret
