Func_8e06::
	ld a, [wWarioYPos + 1]
	sub $18
	ld l, a
	ld a, [wWarioYPos + 0]
	sbc $00
	ld h, a
; hl = ypos - 24
REPT 3
	srl h
	rr l
ENDR

REPT 5
	sla l
	rl h
ENDR
	ld a, h
	and $03
	ld d, a
	ld e, l

	ld a, [wWarioXPos + 0]
	ld h, a
	ld a, [wWarioXPos + 1]
	ld l, a
REPT 3
	srl h
	rr l
ENDR
	ld a, l
	and $1f
	ld l, a
	ld h, HIGH(v0BGMap0)
	add hl, de
	ld a, h
	ld [wccf0 + 0], a
	ld a, l
	ld [wccf0 + 1], a
	ret

Func_8e5b:
	ld a, [wc0a3 + 0]
	ld h, a
	ld a, [wc0a3 + 1]
	ld l, a
REPT 3
	srl h
	rr l
ENDR

REPT 5
	sla l
	rl h
ENDR
	ld a, h
	and $03
	ld d, a
	ld e, l
	ld a, [wc0a5 + 0]
	ld h, a
	ld a, [wc0a5 + 1]
	ld l, a
REPT 3
	srl h
	rr l
ENDR
	ld a, l
	and $1f
	ld l, a
	ld h, HIGH(v0BGMap0)
	add hl, de
	ld a, h
	ld [wccf0 + 0], a
	ld a, l
	ld [wccf0 + 1], a
	ret

; unreferenced
Func_8eac:
	srl l
	jr c, .asm_8eba
	ld a, l
	add $b0
	ld l, a
	ld a, [hl]
	swap a
	and $0f
	ret
.asm_8eba
	ld a, l
	add $b0
	ld l, a
	ld a, [hl]
	and $0f
	ret

; hl = Wario's position
GetNextInternalRoomID:
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
	ld [wInternalRoomID], a
	ret
.skip_multiplication
	inc hl
	ld a, [hl] ; hi x
	ld [wInternalRoomID], a
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
	farcall Func_d186
	ret

.asm_8f11
	call .Func_8fb3
	call .Func_9085
	ld hl, wc0bb
	res 2, [hl]
	farcall Func_d186
	ret

.asm_8f2c
	call .Func_8fec
	call Func_a0e2
	ld hl, wc0bb
	res 0, [hl]
	farcall Func_d11a
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
	farcall Func_d11a
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
	ld [wc0a3 + 0], a
	ld a, l
	ld [wc0a3 + 1], a

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
	ld [wc0a5 + 0], a
	ld a, l
	ld [wc0a5 + 1], a
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
	ld [wc0a3 + 0], a
	ld a, l
	ld [wc0a3 + 1], a
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
	ld [wc0a5 + 0], a
	ld a, l
	ld [wc0a5 + 1], a
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
	ld [wc0a3 + 0], a
	ld a, l
	ld [wc0a3 + 1], a
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
	ld [wc0a5 + 0], a
	ld a, l
	ld [wc0a5 + 1], a
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
	ld [wc0a3 + 0], a
	ld a, l
	ld [wc0a3 + 1], a
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
	ld [wc0a5 + 0], a
	ld a, l
	ld [wc0a5 + 1], a
	ret

.Func_9085:
	call Func_8e5b
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

	ld hl, wc0a3
	call GetBlockPtr
	ld a, [wBlockPtrBank]
	sramswitch
	ld a, [wc0a3 + 1]
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
	ld a, [wc0a5 + 1]
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
	ld a, [wc0a5 + 1]
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
	ld hl, w3d300
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
	ld hl, w3d300
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
	ld hl, w3d300
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
	ld hl, w3d300
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
	ld hl, w3d300
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
	ld a, [wc0a5 + 1]
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
	ld a, [wc0a5 + 1]
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
	ld hl, w3d300
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
	ld hl, w3d300
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
	ld hl, w3d300
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
	ld hl, w3d300
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
	call Func_8e5b
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

	ld hl, wc0a3
	call GetBlockPtr
	ld a, [wBlockPtrBank]
	sramswitch
	ld a, [wc0a5 + 1]
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
	ld a, [wc0a3 + 1]
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
	ld h, HIGH(STARTOF(SRAM))
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
	ld h, HIGH(STARTOF(SRAM))
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
	ld h, HIGH(STARTOF(SRAM))
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
	ld a, [wc0a3 + 1]
	and $08
	jp nz, Func_aa2d
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
	ld hl, w3d300
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
	ld h, HIGH(STARTOF(SRAM))
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

Func_aa2d:
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
	ld hl, w3d300
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
	ld h, HIGH(STARTOF(SRAM))
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
	ld hl, w3d300
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
	ld h, HIGH(STARTOF(SRAM))
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
	ld hl, w3d300
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
	ld a, [wc0a3 + 1]
	and $08
	jp nz, Func_af1f

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
	ld h, HIGH(STARTOF(SRAM))
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

Func_af1f:
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
	ld h, HIGH(STARTOF(SRAM))
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
	ld h, HIGH(STARTOF(SRAM))
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
	ld a, [wc0a3 + 1]
	and $08
	jp nz, Func_b405
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
	ld hl, w3d300
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
	ld h, HIGH(STARTOF(SRAM))
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
	ld hl, w3d300
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

Func_b405:
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
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, .asm_b43e
	ld h, HIGH(STARTOF(SRAM))
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
	ld hl, w3d300
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
	ld h, HIGH(STARTOF(SRAM))
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
	ld hl, w3d300
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

VBlank_b672:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	jp DoPendingDMATransfer
.end

Func_b681:
	ld hl, wVBlankFunc + $10
	ld a, [wBGMapTileQueueSize]
	and a
	jr z, .asm_b6cb

	ld c, a
.loop_1
	ld a, $2a ; ld a, [hli]
	ld [hli], a
	ld a, $57 ; ld d, a
	ld [hli], a
	ld a, $2a ; ld a, [hli]
	ld [hli], a
	ld a, $5f ; ld e, a
	ld [hli], a
	ld a, $0a ; ld a, [bc]
	ld [hli], a
	ld a, $12 ; ld [de], a
	ld [hli], a
	ld a, $0c ; inc c
	ld [hli], a
	dec c
	jr nz, .loop_1

	ld a, $c3 ; jp
	ld [hli], a
	ld a, LOW(Func_cab)
	ld [hli], a
	ld a, HIGH(Func_cab)
	ld [hl], a

	ld a, [wBGMapTileQueueSize]
	ld c, a
	ld hl, wVBlankFuncExtended
.loop_2
	ld a, $2a ; ld a, [hli]
	ld [hli], a
	ld a, $57 ; ld d, a
	ld [hli], a
	ld a, $2a ; ld a, [hli]
	ld [hli], a
	ld a, $5f ; ld e, a
	ld [hli], a
	ld a, $0a ; ld a, [bc]
	ld [hli], a
	ld a, $12 ; ld [de], a
	ld [hli], a
	ld a, $0c ; inc c
	ld [hli], a
	dec c
	jr nz, .loop_2

.asm_b6cb
	ld a, $c3 ; jp
	ld [hli], a
	ld a, LOW(Func_cb8)
	ld [hli], a
	ld a, HIGH(Func_cb8)
	ld [hl], a
	ret

Func_b6d5:
	xor a
	ld [wc0c0], a
	ld a, [wc0b9]
	dec a
	ld c, a
	ld a, [wCameraSCX + 1]
	add b
	ld [wCameraSCX + 1], a
	ld a, [wCameraSCX + 0]
	adc $00
	ld [wCameraSCX + 0], a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_RIGHT_F, a
	ld b, $60
	jr z, .asm_b6f8
	ld b, $40
.asm_b6f8
	ld a, [wCameraSCX + 0]
	cp c
	jr c, .asm_b70e
	ld a, [wCameraSCX + 1]
	cp b
	jr c, .asm_b70e
	ld a, b
	ld [wCameraSCX + 1], a
	ld a, $01
	ld [wc0c0], a
	ret
.asm_b70e
	ld a, [wc0b8]
	ld c, a
	ld a, [wWarioXPos + 0]
	cp c
	ret nz
	ld a, [wDirection]
	and a
	jr nz, .asm_b722
	ld a, [wca60]
	jr .asm_b725
.asm_b722
	ld a, [wca5f]
.asm_b725
	sub $08
	ld c, a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_LEFT_F, a
	jr z, .asm_b733
	ld a, c
	add $20
	ld c, a
.asm_b733
	ld a, [wWarioXPos + 1]
	cp c
	ret nc
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_LEFT_F, a
	ld a, $00
	jr z, .asm_b743
	ld a, $20
.asm_b743
	ld [wCameraSCX + 1], a
	ld a, $02
	ld [wc0c0], a
	ret

Func_b74c:
	xor a
	ld [wc0bf], a
	ld a, [wc0b8]
	ld c, a
	ld a, [wCameraSCX + 1]
	sub b
	ld [wCameraSCX + 1], a
	ld a, [wCameraSCX + 0]
	sbc $00
	ld [wCameraSCX + 0], a
	ld a, [wCameraSCX + 1]
	add $10
	ld l, a
	ld a, [wCameraSCX + 0]
	adc $00
	cp c
	jr nz, .asm_b790
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_LEFT_F, a
	ld b, $10
	jr z, .asm_b77c
	ld b, $30
.asm_b77c
	ld a, l
	cp b
	jr nc, .asm_b790
	ld a, c
	ld [wCameraSCX + 0], a
	ld a, b
	sub $10
	ld [wCameraSCX + 1], a
	ld a, $01
	ld [wc0bf], a
	ret
.asm_b790
	ld a, [wc0b9]
	dec a
	ld c, a
	ld a, [wWarioXPos + 0]
	cp c
	ret nz
	ld a, [wDirection]
	and a
	jr nz, .asm_b7a5
	ld a, [wca60]
	jr .asm_b7a8
.asm_b7a5
	ld a, [wca5f]
.asm_b7a8
	ld c, a
	ld a, $a8
	sub c
	ld c, a
	xor a
	sub c
	ld c, a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_RIGHT_F, a
	jr z, .asm_b7bb
	ld a, c
	sub $20
	ld c, a
.asm_b7bb
	ld a, [wWarioXPos + 1]
	cp c
	ret c
	ld a, $02
	ld [wc0bf], a
	ld a, [wc0b9]
	dec a
	ld [wCameraSCX + 0], a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_RIGHT_F, a
	ld a, $60
	jr z, .asm_b7d7
	ld a, $40
.asm_b7d7
	ld [wCameraSCX + 1], a
	ret

Func_b7db:
	ld a, [wc0b6]
	dec a
	ld c, a

	; add offset to camera Y scroll
	ld a, [wCameraSCY + 1]
	add b
	ld [wCameraSCY + 1], a
	ld a, [wCameraSCY + 0]
	adc 0
	ld [wCameraSCY + 0], a

	cp c
	jr c, .asm_b80d
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_DOWN_F, a
	ld b, $68
	jr z, .asm_b7fd
	ld b, $48
.asm_b7fd
	ld a, [wCameraSCY + 1]
	cp b
	jr c, .asm_b80d
	ld a, b
	ld [wCameraSCY + 1], a
	ld a, $01
	ld [wc0bd], a
	ret

.asm_b80d
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	ret nc

	; not CAM_TRANSITIONS
	ld a, [wc0b7]
	ld c, a
	ld a, [wWarioYPos + 0]
	cp c
	jr c, .asm_b836
	ret nz
	ld a, [wca5e]
	sub $10
	ld c, a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_UP_F, a
	jr z, .asm_b831
	ld a, c
	add $20
	ld c, a
.asm_b831
	ld a, [wWarioYPos + 1]
	cp c
	ret nc
.asm_b836
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_UP_F, a
	ld a, $00
	jr z, .asm_b841
	ld a, $20
.asm_b841
	ld [wCameraSCY + 1], a
	ld a, [wc0b7]
	ld [wCameraSCY + 0], a
	ld a, $02
	ld [wc0bd], a
	ret

Func_b850:
	ld a, [wc0b7]
	ld c, a
	ld a, [wCameraSCY + 1]
	sub b
	ld [wCameraSCY + 1], a
	ld a, [wCameraSCY + 0]
	sbc $00
	ld [wCameraSCY + 0], a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_UP_F, a
	ld b, $10
	jr z, .asm_b86e
	ld b, $30
.asm_b86e
	ld a, [wCameraSCY + 1]
	add $10
	ld l, a
	ld a, [wCameraSCY + 0]
	adc $00
	cp c
	jr c, .asm_b882
	jr nz, .asm_b892
	ld a, l
	cp b
	jr nc, .asm_b892
.asm_b882
	ld a, c
	ld [wCameraSCY + 0], a
	ld a, b
	sub $10
	ld [wCameraSCY + 1], a
	ld a, $01
	ld [wc0be], a
	ret
.asm_b892
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	ret nc
	ld a, [wc0b6]
	dec a
	ld c, a
	ld a, [wWarioYPos + 0]
	cp c
	ret nz
	ld a, [wca5e]
	ld c, a
	ld a, $a0
	sub c
	ld c, a
	xor a
	sub c
	ld c, a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_DOWN_F, a
	jr z, .asm_b8ba
	ld a, c
	sub $20
	ld c, a
.asm_b8ba
	ld a, [wWarioYPos + 1]
	cp c
	ret c
	ld a, $02
	ld [wc0be], a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_DOWN_F, a
	ld a, $68
	jr z, .asm_b8cf
	ld a, $48
.asm_b8cf
	ld [wCameraSCY + 1], a
	ret

SetWarioScreenPos:
	ld a, [wCameraConfigFlags]
	cp HIDDEN_FIGURE_CAMCONFIG
	jr z, .hidden_figure_camconfig
	ld a, [wSCY]
	ld b, a
	ld a, [wWarioYPos + 1]
	add OAM_Y_OFS
	sub b ; [wWarioYPos + 1] + $10 - wSCY
	ld [wWarioScreenYPos], a
	ld a, [wSCX]
	ld b, a
	ld a, [wWarioXPos + 1]
	add OAM_X_OFS
	sub b
	ld [wWarioScreenXPos], a
	ret

.hidden_figure_camconfig
	ld a, [wSCYShake]
	ld c, a
	ld a, [wc08a]
	add c
	ld b, a
	ld a, [wWarioYPos + 1]
	add OAM_Y_OFS
	sub b
	ld [wWarioScreenYPos], a
	ld a, [wc08c]
	ld b, a
	ld a, [wWarioXPos + 1]
	add OAM_X_OFS
	sub b
	ld [wWarioScreenXPos], a
	ret

Func_b915:
	ld a, [wc0c2]
	ld b, a
	and a
	jr z, .asm_b964
	xor a
	ld [wc0d4], a

	bit 7, b
	jr nz, .negative

; positive
	ld hl, wWarioScreenYPos
	ld a, [wca5e]
	cp [hl]
	jr nc, .asm_b92e
	; wca5e < wWarioScreenYPos
	inc b
.asm_b92e
	call Func_b7db
	ld a, [wc0bd]
	and a
	jr nz, .asm_b93c
	ld hl, wc0bb
	set 3, [hl]
.asm_b93c
	xor a
	ld [wc0c2], a
	ret

.negative
	ld a, b
	cpl
	inc a
	ld b, a ; = -b
	ld hl, wWarioScreenYPos
	ld a, [wca5e]
	cp [hl]
	jr c, .asm_b951
	jr z, .asm_b951
	; wca5e > wWarioScreenYPos
	inc b
.asm_b951
	call Func_b850
	ld a, [wc0be]
	and a
	jr nz, .asm_b95f
	ld hl, wc0bb
	set 2, [hl]
.asm_b95f
	xor a
	ld [wc0c2], a
	ret

.asm_b964
	ld a, [wWaterInteraction]
	and a
	ret nz ; is in water
	ld a, [wJumpVelIndex]
	and a
	ret nz ; is jumping

	; return if Wario state is WST_LADDER_SCRATCHING
	; or between WST_LADDER_CLIMBING and WST_LADDER_SLIDING
	ld a, [wWarioState]
	cp WST_LADDER_SCRATCHING
	ret z
	cp WST_LADDER_CLIMBING
	jr c, .not_in_ladder
	cp WST_LADDER_SLIDING + 1
	ret c

.not_in_ladder
	ld a, [wc0d4]
	inc a
	ld [wc0d4], a
	dec a
	ret z
	ld hl, wWarioScreenYPos
	ld a, [wca5e]
	sub [hl]
	jr nc, .asm_b98f
	cpl
	inc a
.asm_b98f
	ld b, a
	ld a, [wSlopeInteraction]
	and a
	jr nz, .on_slope
	ld a, b
	cp $08
	ret c
	ld b, $07
.on_slope
	ld a, [wca5e]
	cp [hl]
	jr c, .asm_b92e
	ret z
	jp .asm_b951

Func_b9a6:
	ld a, [wc0c3]
	ld b, a
	and a
	jr z, .asm_ba13
	xor a
	ld [wc0d5], a
	bit 7, b
	jr nz, .asm_b9e2
	ld hl, wWarioScreenXPos
	ld a, [wDirection]
	and a
	jr nz, .asm_b9c3
	ld a, [wca60]
	jr .asm_b9c6
.asm_b9c3
	ld a, [wca5f]
.asm_b9c6
	cp [hl]
	jr z, .asm_b9cf
	jr c, .asm_b9ce
	dec b
	jr .asm_b9cf
.asm_b9ce
	inc b
.asm_b9cf
	call Func_b6d5
	ld a, [wc0c0]
	and a
	jr nz, .asm_b9dd
	ld hl, wc0bb
	set 0, [hl]
.asm_b9dd
	xor a
	ld [wc0c3], a
	ret
.asm_b9e2
	ld a, b
	cpl
	inc a
	ld b, a
	ld hl, wWarioScreenXPos
	ld a, [wDirection]
	and a
	jr nz, .asm_b9f4
	ld a, [wca60]
	jr .asm_b9f7
.asm_b9f4
	ld a, [wca5f]
.asm_b9f7
	cp [hl]
	jr z, .asm_ba00
	jr c, .asm_b9ff
	inc b
	jr .asm_ba00
.asm_b9ff
	dec b
.asm_ba00
	call Func_b74c
	ld a, [wc0bf]
	and a
	jr nz, .asm_ba0e
	ld hl, wc0bb
	set 1, [hl]
.asm_ba0e
	xor a
	ld [wc0c3], a
	ret
.asm_ba13
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jr nz, .asm_ba1f
	ld a, [wJumpVelTable]
	and a
	ret nz
.asm_ba1f
	ld a, [wc0d5]
	inc a
	ld [wc0d5], a
	dec a
	ret z
	ld b, $01
	ld hl, wWarioScreenXPos
	ld a, [wDirection]
	and a
	jr nz, .asm_ba38
	ld a, [wca60]
	jr .asm_ba3b
.asm_ba38
	ld a, [wca5f]
.asm_ba3b
	cp [hl]
	jr c, .asm_b9cf
	ret z
	jp .asm_ba00

Func_ba42:
	ldh a, [rSVBK]
	push af
	ld a, $01
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
	ld a, $01
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
	ld a, $01
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
	ld a, $01
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
	call GetBlockPtrPtrBGMapAddress
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

; if wSwitchStateUpdated is set, then update blocks
; this update revolves around the assumption that
; if $8 is added to the block, then it corresponds
; to a new block for its off state, and subtracting $8
; will revert it to a block corresponding to on state
UpdateSwitchableBlocks:
	ld a, [wSwitchStateUpdated]
	and a
	ret z
	xor a
	ld [wSwitchStateUpdated], a
	ld a, [wSwitchState]
	cp $68
	jr z, .switch_on

; switch off
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	ld hl, s0a000
.loop_1
	ld a, [hli]
	and $7f
	cp $60
	jr c, .next_block_1
	cp $68
	jr nc, .next_block_1
	; between $60 and $67
	dec l
	ld a, [hl]
	add $08
	ld [hli], a
.next_block_1
	ld a, l
	cp LEVEL_WIDTH
	jr c, .loop_1
	ld l, $00
	inc h
	ld a, h
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, .loop_1
	pop af
	sramswitch

	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM2")
	sramswitch
	ld hl, s0a000
.loop_2
	ld a, [hli]
	and $7f
	cp $60
	jr c, .next_block_2
	cp $68
	jr nc, .next_block_2
	dec l
	ld a, [hl]
	add $08
	ld [hli], a
.next_block_2
	ld a, l
	cp LEVEL_WIDTH
	jr c, .loop_2
	ld l, $00
	inc h
	ld a, h
	cp $b0
	jr nz, .loop_2
	pop af
	sramswitch
	ret

.switch_on
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	ld hl, s0a000
.loop_3
	ld a, [hli]
	and $7f
	cp $68
	jr c, .next_block_3
	cp $70
	jr nc, .next_block_3
	dec l
	ld a, [hl]
	sub $08
	ld [hli], a
.next_block_3
	ld a, l
	cp LEVEL_WIDTH
	jr c, .loop_3
	ld l, $00
	inc h
	ld a, h
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, .loop_3
	pop af
	sramswitch

	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM2")
	sramswitch
	ld hl, s0a000
.loop_4
	ld a, [hli]
	and $7f
	cp $68
	jr c, .next_block_4
	cp $70
	jr nc, .next_block_4
	dec l
	ld a, [hl]
	sub $08
	ld [hli], a
.next_block_4
	ld a, l
	cp LEVEL_WIDTH
	jr c, .loop_4
	ld l, $00
	inc h
	ld a, h
	cp $b0
	jr nz, .loop_4
	pop af
	sramswitch
	ret
