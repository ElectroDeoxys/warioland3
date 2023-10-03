WaterDropFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_49d83)
	ld [hld], a
	ld a, LOW(.Func_49d83)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $04
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld a, $ff
	ld [hl], a
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	jp .asm_49ddd

.Func_49d83:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_49df7
	cp $5a
	jr z, .asm_49da6
	cp $5b
	jr z, .asm_49dbd
.asm_49d92
	ld a, $5a
	ld [hl], a
	ld de, Frameset_69775
	call SetObjectFramesetPtr
	ld a, $18
	ld [hli], a
	play_sfx SFX_0A1
.asm_49da6
	ld a, $81
	ld [wCurObjAction], a
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld l, OBJ_FLAGS
	set OBJFLAG_INVISIBLE_F, [hl]
	ld a, $5b
	ld [wCurObjState], a
	ld a, $3c
	ld [wCurObjStateDuration], a
.asm_49dbd
	ld a, $81
	ld [wCurObjAction], a
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	ld e, a
	and a
	jr z, .asm_49dca
	dec [hl]
.asm_49dca
	inc l
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ld l, OBJ_Y_POS
	ld a, [hli]
	cp c
	jp nz, MoveObjectUp
	ld a, [hl]
	cp b
	jp nz, MoveObjectUp
	ld a, e
	and a
	ret nz
.asm_49ddd
	ld de, Frameset_69761
	call SetObjectFramesetPtr
	ld a, $41
	ld [hli], a
	ld a, [wCurObjYPos + 0]
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	ld [hli], a
	xor a
	ld [hli], a
	inc l
	ld [hl], a
	ld l, OBJ_FLAGS
	res OBJFLAG_INVISIBLE_F, [hl]
	ret

.asm_49df7
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	and a
	jr z, .asm_49e05
	dec [hl]
	ret nz
	ld de, Frameset_69772
	jp SetObjectFramesetPtr

.asm_49e05
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_352b
	and a
	jr nz, .asm_49e26
	ld a, [wc0dd]
	and a
	jr nz, .asm_49e26
	ld bc, FallingYVel_Light
	jp ApplyObjYMovement

.asm_49e26
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_STATE
	jp .asm_49d92
