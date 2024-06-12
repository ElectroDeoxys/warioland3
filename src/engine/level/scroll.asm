; hl = Wario's position
GetNextLevelRoomID:
	ld a, [hli] ; hi y
	and a
	jr z, .skip_multiplication
	ld b, a
	inc hl
	ld a, [hl] ; hi x
	ld c, 10
.loop_multiplication
	add c
	dec b
	jr nz, .loop_multiplication
	; a = XPosHi + 10 * YPosHi
	ld [wLevelRoomID], a
	ret
.skip_multiplication
	inc hl
	ld a, [hl] ; hi x
	ld [wLevelRoomID], a
	ret

Func_8ed9:
	ld a, [wc0bb]
	and a
	ret z
	ld b, a
	and $03
	jr nz, .asm_8eec
.asm_8ee3
	bit 2, b
	jr nz, .asm_8f11
	bit 3, b
	jr nz, .asm_8ef6
	ret

.asm_8eec
	bit 0, b
	jr nz, .asm_8f2c
	bit 1, b
	jr nz, .asm_8f52
	jr .asm_8ee3

.asm_8ef6
	call .Func_8f79
	call .Func_9085
	ld hl, wc0bb
	res 3, [hl]
	farcall SpawnColEdgeObjects
	ret

.asm_8f11
	call .Func_8fb3
	call .Func_9085
	ld hl, wc0bb
	res 2, [hl]
	farcall SpawnColEdgeObjects
	ret

.asm_8f2c
	call .Func_8fec
	call Func_a0e2
	ld hl, wc0bb
	res 0, [hl]
	farcall SpawnRowEdgeObjects
	ld a, [wc0bb]
	bit 2, a
	jr nz, .asm_8f11
	bit 3, a
	jr nz, .asm_8ef6
	ret

.asm_8f52
	call .Func_9039
	call Func_a0e2
	ld hl, wc0bb
	res 1, [hl]
	farcall SpawnRowEdgeObjects
	ld a, [wc0bb]
	bit 2, a
	jr nz, .asm_8f11
	bit 3, a
	jp nz, .asm_8ef6
	ret

.Func_8f79:
	ld hl, wCameraSCY + 1
	ld a, [hld]
	and $f8
	ld e, a
	ld h, [hl]
	ld l, e
	ld de, $a0
	add hl, de
	ld a, h
	cp $03
	jr c, .asm_8f8f
	ld hl, $2f8
	ld a, h
.asm_8f8f
	ld [wBlockYPos + 0], a
	ld a, l
	ld [wBlockYPos + 1], a

	ld hl, wCameraSCX + 1
	ld a, [hld]
	and $f8
	ld e, a
	ld h, [hl]
	ld l, e
	ld de, -$10
	add hl, de
	bit 7, h
	jr z, .asm_8faa
	ld hl, $0
.asm_8faa
	ld a, h
	ld [wBlockXPos + 0], a
	ld a, l
	ld [wBlockXPos + 1], a
	ret

.Func_8fb3:
	ld hl, wCameraSCY + 1
	ld a, [hld]
	and $f8
	ld e, a
	ld h, [hl]
	ld l, e
	ld de, -$10
	add hl, de
	bit 7, h
	jr z, .asm_8fc7
	ld hl, $0
.asm_8fc7
	ld a, h
	ld [wBlockYPos + 0], a
	ld a, l
	ld [wBlockYPos + 1], a
	ld hl, wCameraSCX + 1
	ld a, [hld]
	and $f8
	ld e, a
	ld h, [hl]
	ld l, e
	ld de, -$10
	add hl, de
	bit 7, h
	jr z, .asm_8fe3
	ld hl, $0
.asm_8fe3
	ld a, h
	ld [wBlockXPos + 0], a
	ld a, l
	ld [wBlockXPos + 1], a
	ret

.Func_8fec:
	ld hl, wCameraSCY + 1
	ld a, [hld]
	and $f8
	ld e, a
	ld h, [hl]
	ld l, e
	ld de, -$10
	add hl, de
	bit 7, h
	jr z, .asm_9002
	ld hl, $0
	jr .asm_9013
.asm_9002
	ld de, $b8
	push hl
	add hl, de
	ld a, h
	cp $03
	jr c, .asm_9012
	pop hl
	ld hl, $240
	jr .asm_9013
.asm_9012
	pop hl
.asm_9013
	ld a, h
	ld [wBlockYPos + 0], a
	ld a, l
	ld [wBlockYPos + 1], a
	ld hl, wCameraSCX + 1
	ld a, [hld]
	and $f8
	ld e, a
	ld h, [hl]
	ld l, e
	ld de, $b0
	add hl, de
	ld a, h
	cp $0a
	jr c, .asm_9031
	ld hl, $9f8
	ld a, h
.asm_9031
	ld [wBlockXPos + 0], a
	ld a, l
	ld [wBlockXPos + 1], a
	ret

.Func_9039:
	ld hl, wCameraSCY + 1
	ld a, [hld]
	and $f8
	ld e, a
	ld h, [hl]
	ld l, e
	ld de, -$10
	add hl, de
	bit 7, h
	jr z, .asm_904f
	ld hl, $0
	jr .asm_9060
.asm_904f
	ld de, $b8
	push hl
	add hl, de
	ld a, h
	cp $03
	jr c, .asm_905f
	pop hl
	ld hl, $240
	jr .asm_9060
.asm_905f
	pop hl
.asm_9060
	ld a, h
	ld [wBlockYPos + 0], a
	ld a, l
	ld [wBlockYPos + 1], a
	ld hl, wCameraSCX + 1
	ld a, [hld]
	and $f8
	ld e, a
	ld h, [hl]
	ld l, e
	ld de, -$10
	add hl, de
	bit 7, h
	jr z, .asm_907c
	ld hl, $0
.asm_907c
	ld a, h
	ld [wBlockXPos + 0], a
	ld a, l
	ld [wBlockXPos + 1], a
	ret

.Func_9085:
	call GetBlockBGPtr
	ld a, [wBGMapAddressQueueSize]
	ld b, a
	ld de, wBGMapAddressQueue
	ld a, e
	add b
	ld e, a ; wBGMapAddressQueue + wBGMapAddressQueueSize

	; fill row
REPT 25
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
ENDR

	ld a, [wBGMapAddressQueueSize]
	add $2 * 25
	ld [wBGMapAddressQueueSize], a

	ld hl, wBlockPos
	call GetBlockPtr
	ld a, [wBlockPtrBank]
	sramswitch
	ld a, [wBlockYPos + 1]
	and $08
	jr z, .asm_923a
	push hl
	call .AddRowBottomTiles
	pop hl
	ld a, [wBlockPtrBank]
	sramswitch
	call .Func_9605
	jr .update_queue_size

.asm_923a
	push hl
	call .AddRowTopTiles
	pop hl
	ld a, [wBlockPtrBank]
	sramswitch
	call .Func_9d4c

.update_queue_size
	ld a, [wBGMapTileQueueSize]
	add 25
	ld [wBGMapTileQueueSize], a
	ret

.AddRowBottomTiles:
	ld a, [wBGMapTileQueueSize]
	ld b, a
	ld a, HIGH(wBGMapTileVRAM0Queue)
	ld [wcce7 + 0], a
	ld a, LOW(wBGMapTileVRAM0Queue)
	add b
	ld [wcce7 + 1], a ; wBGMapTileVRAM0Queue + wBGMapTileQueueSize
	ld a, [wBlockXPos + 1]
	and $08
	jp nz, .asm_9438

REPT 12
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d ; *$4
	push hl
	ld hl, wRoomBlockTiles
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $2
	ld [wcce7 + 1], a
	ld a, [hli] ; bottom-left tile
	ld [de], a
	inc e
	ld a, [hl] ; bottom-right tile
	ld [de], a
	pop hl
ENDR

	ld a, [hli]
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
	ld a, [hl] ; bottom-left tile
	ld [de], a
	pop hl
	ret

.asm_9438
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d ; *$4
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
	ld a, [hl] ; bottom-right tile
	ld [de], a
	pop hl

REPT 11
	ld a, [hli]
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
	add $2
	ld [wcce7 + 1], a
	ld a, [hli] ; bottom-left tile
	ld [de], a
	inc e
	ld a, [hl] ; bottom-right tile
	ld [de], a
	pop hl
ENDR

	ld a, [hli]
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
	ld a, [hli] ; bottom-left tile
	ld [de], a
	inc e
	ld a, [hl] ; bottom-right tile
	ld [de], a
	pop hl
	ret

.Func_9605:
	ld a, [wBGMapTileQueueSize]
	ld b, a
	ld a, HIGH(wBGMapTileVRAM1Queue)
	ld [wc0b3 + 0], a
	ld a, LOW(wBGMapTileVRAM1Queue)
	add b
	ld [wc0b3 + 1], a
	ld a, [wBlockXPos + 1]
	and $08
	jp nz, .asm_97f3
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a

REPT 12
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockAttributes
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $2
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
ENDR

	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockAttributes
	add hl, de
	inc l
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

.asm_97f3
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockAttributes
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

REPT 11
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockAttributes
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $2
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
ENDR

	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockAttributes
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	pop af
	ldh [rSVBK], a
	ret

.AddRowTopTiles:
	ld a, [wBGMapTileQueueSize]
	ld b, a
	ld a, HIGH(wBGMapTileVRAM0Queue)
	ld [wcce7 + 0], a
	ld a, LOW(wBGMapTileVRAM0Queue)
	add b
	ld [wcce7 + 1], a ; wBGMapTileVRAM0Queue + wBGMapTileQueueSize
	ld a, [wBlockXPos + 1]
	and $08
	jp nz, .asm_9b94

REPT 12
	ld a, [hli]
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
	add $2
	ld [wcce7 + 1], a
	ld a, [hli] ; top-left
	ld [de], a
	inc e
	ld a, [hl] ; top-right
	ld [de], a
	pop hl
ENDR

	ld a, [hli]
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
	ld a, [hl] ; top-left
	ld [de], a
	pop hl
	ret

.asm_9b94
	ld a, [hli]
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
	inc a
	ld [wcce7 + 1], a
	ld a, [hl] ; top-right
	ld [de], a
	pop hl

REPT 12
	ld a, [hli]
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
	add $2
	ld [wcce7 + 1], a
	ld a, [hli] ; top-left
	ld [de], a
	inc e
	ld a, [hl] ; top-right
	ld [de], a
	pop hl
ENDR

	ret

.Func_9d4c:
	ld a, [wBGMapTileQueueSize]
	ld b, a
	ld a, HIGH(wBGMapTileVRAM1Queue)
	ld [wc0b3 + 0], a
	ld a, LOW(wBGMapTileVRAM1Queue)
	add b
	ld [wc0b3 + 1], a
	ld a, [wBlockXPos + 1]
	and $08
	jp nz, .asm_9f20
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a

REPT 12
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d ; *$4
	push hl
	ld hl, wRoomBlockAttributes
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $2
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
ENDR
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockAttributes
	add hl, de
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

.asm_9f20
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockAttributes
	add hl, de
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

REPT 12
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockAttributes
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $2
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
ENDR

	pop af
	ldh [rSVBK], a
	ret

Func_a0e2:
	call GetBlockBGPtr
	ld a, [wBGMapAddressQueueSize]
	ld b, a
	ld de, wBGMapAddressQueue
	ld a, e
	add b
	ld e, a

REPT 23
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, BG_MAP_WIDTH
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
ENDR

	ld a, [wBGMapAddressQueueSize]
	add $2 * 23
	ld [wBGMapAddressQueueSize], a

	ld hl, wBlockPos
	call GetBlockPtr
	ld a, [wBlockPtrBank]
	sramswitch
	ld a, [wBlockXPos + 1]
	and $08
	jr z, .asm_a290
	push hl
	call Func_a2aa
	pop hl
	ld a, [wBlockPtrBank]
	sramswitch
	call Func_a79e
	jr .asm_a2a1
.asm_a290
	push hl
	call Func_aca6
	pop hl
	ld a, [wBlockPtrBank]
	sramswitch
	call Func_b182
.asm_a2a1
	ld a, [wBGMapTileQueueSize]
	add 23
	ld [wBGMapTileQueueSize], a
	ret

Func_a2aa:
	ld a, [wBGMapTileQueueSize]
	ld b, a
	ld a, HIGH(wBGMapTileVRAM0Queue)
	ld [wcce7 + 0], a
	ld a, LOW(wBGMapTileVRAM0Queue)
	add b
	ld [wcce7 + 1], a ; wBGMapTileVRAM0Queue + wBGMapTileQueueSize
	ld a, [wBlockYPos + 1]
	and $08
	jp nz, .asm_a52f

REPT 11
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
	add $2
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
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, :+
	ld h, HIGH(sLevelBlockObjectMap)
	ld a, [wSRAMBank]
	inc a
	sramswitch
:
ENDR

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
	ld a, [hl]
	ld [de], a
	pop hl
	ret

.asm_a52f:
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
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, .asm_a562
	ld h, HIGH(sLevelBlockObjectMap)
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a562

REPT 10
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
	add $2
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
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, :+
	ld h, HIGH(sLevelBlockObjectMap)
	ld a, [wSRAMBank]
	inc a
	sramswitch
:
ENDR

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
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ret

Func_a79e:
	ld a, [wBGMapTileQueueSize]
	ld b, a
	ld a, HIGH(wBGMapTileVRAM1Queue)
	ld [wc0b3 + 0], a
	ld a, LOW(wBGMapTileVRAM1Queue)
	add b
	ld [wc0b3 + 1], a
	ld a, [wBlockYPos + 1]
	and $08
	jp nz, .asm_aa2d
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a

REPT 11
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockAttributes
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $2
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
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, :+
	ld h, HIGH(sLevelBlockObjectMap)
	ld a, [wSRAMBank]
	inc a
	sramswitch
:
ENDR

	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockAttributes
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

.asm_aa2d
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockAttributes
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
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, .asm_aa67
	ld h, HIGH(sLevelBlockObjectMap)
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_aa67

	REPT 10
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockAttributes
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $2
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
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, :+
	ld h, HIGH(sLevelBlockObjectMap)
	ld a, [wSRAMBank]
	inc a
	sramswitch
:
ENDR

	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockAttributes
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	pop af
	ldh [rSVBK], a
	ret

Func_aca6:
	ld a, [wBGMapTileQueueSize]
	ld b, a
	ld a, HIGH(wBGMapTileVRAM0Queue)
	ld [wcce7 + 0], a
	ld a, LOW(wBGMapTileVRAM0Queue)
	add b
	ld [wcce7 + 1], a ; wBGMapTileVRAM0Queue + wBGMapTileQueueSize
	ld a, [wBlockYPos + 1]
	and $08
	jp nz, .asm_af1f

REPT 11
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
	add $2
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
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, :+
	ld h, HIGH(sLevelBlockObjectMap)
	ld a, [wSRAMBank]
	inc a
	sramswitch
:
ENDR

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
	ld a, [hl]
	ld [de], a
	pop hl
	ret

.asm_af1f
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
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, .asm_af51
	ld h, HIGH(sLevelBlockObjectMap)
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_af51

REPT 10
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
	add $2
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
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, :+
	ld h, HIGH(sLevelBlockObjectMap)
	ld a, [wSRAMBank]
	inc a
	sramswitch
:
ENDR

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
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ret

Func_b182:
	ld a, [wBGMapTileQueueSize]
	ld b, a
	ld a, HIGH(wBGMapTileVRAM1Queue)
	ld [wc0b3 + 0], a
	ld a, LOW(wBGMapTileVRAM1Queue)
	add b
	ld [wc0b3 + 1], a
	ld a, [wBlockYPos + 1]
	and $08
	jp nz, .asm_b405
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a

REPT 11
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockAttributes
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $2
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
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, :+
	ld h, HIGH(sLevelBlockObjectMap)
	ld a, [wSRAMBank]
	inc a
	sramswitch
:
ENDR

	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockAttributes
	add hl, de
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

.asm_b405
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockAttributes
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
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, .asm_b43e
	ld h, HIGH(sLevelBlockObjectMap)
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b43e

REPT 10
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockAttributes
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $2
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
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, :+
	ld h, HIGH(sLevelBlockObjectMap)
	ld a, [wSRAMBank]
	inc a
	sramswitch
:
ENDR

	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wRoomBlockAttributes
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	pop af
	ldh [rSVBK], a
	ret
