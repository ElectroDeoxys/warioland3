TogebaFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $0b
	ld [hld], a
	ld a, $f4
	ld [hld], a
.Func_48d9b:
	ld de, Frameset_69230
	call SetObjectFramesetPtr
	xor a
	ld [hl], a
	ld [wCurObjState], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_48db7)
	ld [hld], a
	ld a, LOW(.Func_48db7)
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_FULL_STING
	ld [hld], a
	ret

.Func_48db7:
	ld a, [wGroundShakeCounter]
	cp $10
	jr nc, .asm_48de3
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr nz, .asm_48dda
	ld l, OBJ_STATE
	ld a, [hl]
	and a
	ret z
	xor a
	ld [hl], a
	ld de, Frameset_6924b
	call SetObjectFramesetPtr
	ld a, $16
	ld [hli], a
	ld l, OBJ_FLAGS
	res OBJFLAG_NO_COLLISION_F, [hl]
	ret

.asm_48dda
	dec [hl]
	ret nz
	ld de, Frameset_69230
	call SetObjectFramesetPtr
	ret

.asm_48de3
	ld hl, wCurObjUpdateFunction + 1
	ld a, $4e
	ld [hld], a
	ld a, $02
	ld [hld], a
	ld de, Frameset_69256
	call SetObjectFramesetPtr
	ld a, $30
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_0B
	ld [hld], a
	xor a
	ld [wCurObjVar3], a
	ret

.Func_48e02:
	ld bc, Data_60760
	call ApplyObjYMovement
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_48e46)
	ld [hld], a
	ld a, LOW(.Func_48e46)
	ld [hld], a
	ld de, Frameset_69263
	call SetObjectFramesetPtr
	xor a
	ld [wCurObjVar3], a
	ld [wCurObjState], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_WALKABLE
	ld [hld], a
	ret

.Func_48e2b:
	ld hl, wCurObjUpdateFunction + 1
	ld a, $4e
	ld [hld], a
	ld a, $3e
	ld [hld], a
	ld de, Frameset_69275
	call SetObjectFramesetPtr
	ld a, $10
	ld [hli], a
	ret

.Func_48e3e:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	jp .Func_48d9b

.Func_48e46:
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	sub $0c
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_352b
	and a
	jr nz, .Func_48e2b
	ld hl, wCurObjXPos
	ld a, [hli]
	add $0b
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_352b
	and a
	jr nz, .Func_48e2b
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_48e82
	dec [hl]
	jr nz, .asm_48e82
	ld de, Frameset_69263
	call SetObjectFramesetPtr
.asm_48e82
	ld l, OBJ_STATE
	ld a, [hl]
	and a
	jr z, .asm_48eb3
	cp $0a
	jr nz, .asm_48e99
	xor a
	ld [hl], a
	ld de, Frameset_6926c
	call SetObjectFramesetPtr
	ld a, $1b
	ld [hli], a
	jr .asm_48eb3
.asm_48e99
	xor a
	ld [hl], a
	ld de, Frameset_6927c
	call SetObjectFramesetPtr
	ld a, $0a
	ld [hli], a
	ld a, [wCurObjUnk1d]
	rla
	jr nc, .asm_48eb3
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_48ecc)
	ld [hld], a
	ld a, LOW(.Func_48ecc)
	ld [hld], a
	ret

.asm_48eb3
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	jp z, MoveObjectDown
	res OBJFLAG_STEPPED_F, [hl]
	ld b, $01
	call MoveWarioDown
	call HandleDownwardsFloorTransition
	jp MoveObjectDown

.Func_48ecc:
	call MoveObjectUp_Fast
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_48e46)
	ld [hld], a
	ld a, LOW(.Func_48e46)
	ld [hld], a
	ld de, Frameset_69263
	call SetObjectFramesetPtr
	ret
