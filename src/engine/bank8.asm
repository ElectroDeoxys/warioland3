Func_21f51:
	ld a, [wBGMapTileQueueSize]
	ld b, a
	ld a, HIGH(wBGMapTileVRAM0Queue)
	ld [wcce7 + 0], a
	ld a, LOW(wBGMapTileVRAM0Queue)
	add b
	ld [wcce7 + 1], a
	ld a, [wc0a3 + 1]
	and $08
	jr nz, .asm_21fa3
	ld b, $10
.asm_21f69
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockTiles
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_21f9f
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_21f9f
	dec b
	jr nz, .asm_21f69
	ret

.asm_21fa3
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockTiles
	add hl, de
	inc l
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	inc a
	ld [wcce7 + 1], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_21fd6
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_21fd6
	ld b, $10
.asm_21fd8
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockTiles
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_2200e
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_2200e
	dec b
	jr nz, .asm_21fd8
	ret

Func_22012:
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [wBGMapTileQueueSize]
	ld b, a
	ld a, HIGH(wBGMapTileVRAM1Queue)
	ld [wc0b3 + 0], a
	ld a, LOW(wBGMapTileVRAM1Queue)
	add b
	ld [wc0b3 + 1], a
	ld a, [wc0a3 + 1]
	and $08
	jp nz, Func_2208a
	ld b, $10
.asm_22032
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22068
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22068
	dec b
	jr nz, .asm_22032
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	ld a, [hl]
	ld [de], a
	pop hl
	pop af
	ldh [rSVBK], a
	ret

Func_2208a:
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wBGMapTileVRAM1Queue
	add hl, de
	inc l
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	inc a
	ld [wc0b3 + 1], a
	ld a, [hl]
	ld [de], a
	pop hl

	inc h
	ld a, h
	cp $c0
	jr nz, .asm_220bd
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_220bd
	ld b, $10
.asm_220bf
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_220f5
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_220f5
	dec b
	jr nz, .asm_220bf
	pop af
	ldh [rSVBK], a
	ret

Func_220fc:
	ld a, [wBGMapTileQueueSize]
	ld b, a
	ld a, HIGH(wBGMapTileVRAM0Queue)
	ld [wcce7 + 0], a
	ld a, LOW(wBGMapTileVRAM0Queue)
	add b
	ld [wcce7 + 1], a
	ld a, [wc0a3 + 1]
	and $08
	jp nz, Func_2214e
	ld b, $10
.asm_22115
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockTiles
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_2214a
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_2214a
	dec b
	jr nz, .asm_22115
	ret

Func_2214e:
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockTiles
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	inc a
	ld [wcce7 + 1], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22180
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22180
	ld b, $10
.asm_22182
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockTiles
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_221b7
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_221b7
	dec b
	jr nz, .asm_22182
	ret

Func_221bb:
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [wBGMapTileQueueSize]
	ld b, a
	ld a, HIGH(wBGMapTileVRAM1Queue)
	ld [wc0b3 + 0], a
	ld a, LOW(wBGMapTileVRAM1Queue)
	add b
	ld [wc0b3 + 1], a
	ld a, [wc0a3 + 1]
	and $08
	jp nz, Func_22217
	ld b, $10
.asm_221db
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22210
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22210
	dec b
	jr nz, .asm_221db
	pop af
	ldh [rSVBK], a
	ret

Func_22217:
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	inc a
	ld [wc0b3 + 1], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22249
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22249
	ld b, $10
.asm_2224b
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22280
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22280
	dec b
	jr nz, .asm_2224b
	pop af
	ldh [rSVBK], a
	ret
