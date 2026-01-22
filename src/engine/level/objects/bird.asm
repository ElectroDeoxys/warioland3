BirdFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Init)
	ld [hld], a
	ld a, LOW(.Init)
	ld [hld], a
	ret

.Init:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $06
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld a, $fa
	ld [hl], a
	xor a
	ld [wCurObjStateDuration], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_432b9
	res OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_687d3
	call SetObjectFramesetPtr
	ret

.asm_432b9
	set OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_687e4
	call SetObjectFramesetPtr
	ret

.Func_432c2:
	ld l, OBJ_FLAGS
	bit OBJFLAG_ON_SCREEN_F, [hl]
	ret z
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	and a
	jr z, .asm_432e7
	dec [hl]
	ret nz
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	jr c, .asm_432df
	set OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_687e4
	call SetObjectFramesetPtr
	jr .asm_432e7

.asm_432df
	res OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_687d3
	call SetObjectFramesetPtr
.asm_432e7
	ld c, $2a
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp $18
	jr c, .asm_432fa
	cp $e8
	ret c
.asm_432fa
	ld l, OBJ_SUBSTATE
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
	ld b, a
	jr c, .asm_43319
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr nz, .asm_43338
	ld a, b
	cp $70
	ret nc
	ld de, Frameset_687c9
	call SetObjectFramesetPtr
	jr .asm_43327

.asm_43319
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr z, .asm_43338
	ld a, b
	cp $90
	ret c
	ld de, Frameset_687ce
	call SetObjectFramesetPtr
.asm_43327
	ld a, $23
	ld [hli], a
	ld a, $2f
	ld [wCurObjState], a
	play_sfx SFX_06F
	ret

.asm_43338
	ld de, Frameset_687ff
	call SetObjectFramesetPtr
	ld a, $0c
	ld [hli], a
	ret

.Func_43342:
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	and a
	jr z, .asm_43358
	dec [hl]
	ret nz
	play_sfx SFX_070
	ret

.Func_43353:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
.asm_43358
	ld a, [wCurObjSubState]
	rlca
	jp c, MoveObjectRight_Fast
	jp MoveObjectLeft_Fast

.Update:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jp z, .Func_432c2
	cp $2f
	jr z, .Func_43342
	cp $0b
	jr z, .asm_4338f
	cp $0c
	jr z, .asm_43394
	cp $0a
	jr z, .asm_433c7
	cp $28
	jr z, .asm_433ca
	cp $29
	jr z, .asm_433d2
	cp $04
	jr z, .asm_433e2
	cp $05
	jr z, .asm_433da
	rra
	jr nc, .asm_433d2
	jr .asm_433ca


.asm_4338f
	ld bc, ObjParams_BirdStars1
	jr .asm_43397

.asm_43394
	ld bc, ObjParams_BirdStars2
.asm_43397
	xor a
	ld [hl], a
	ld l, OBJ_FLAGS
	bit OBJFLAG_NO_COLLISION_F, [hl]
	jr z, .asm_433a7
	ld l, OBJ_SUBSTATE
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr z, .asm_433d2
	jr .asm_433ca

.asm_433a7
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, [wCurObjId]
	cp BLUE_BIRD
	jr z, .blue_bird
	ld a, HIGH(.Func_43353)
	ld [hld], a
	ld a, LOW(.Func_43353)
	ld [hld], a
	jp CreateObjectAtRelativePos
.blue_bird
	ld a, HIGH(.Func_4340b)
	ld [hld], a
	ld a, LOW(.Func_4340b)
	ld [hld], a
	ld a, $14
	ld [wCurObjStateDuration], a
	ret

.asm_433c7
	jp Func_3173

.asm_433ca
	ld a, HIGH(Func_33f8)
	ld c, LOW(Func_33f8)
	ld b, $02
	jr .asm_433e8

.asm_433d2
	ld a, HIGH(Func_3407)
	ld c, LOW(Func_3407)
	ld b, $02
	jr .asm_433e8

.asm_433da
	ld a, HIGH(Func_3317)
	ld c, LOW(Func_3317)
	ld b, $02
	jr .asm_433e8

.asm_433e2
	ld a, HIGH(Func_3326)
	ld c, LOW(Func_3326)
	ld b, $02
.asm_433e8
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld [hld], a
	ld [hl], c
	ld l, OBJ_VAR_2
	ld a, b
	ld [hli], a
	xor a
	ld [hli], a
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld a, [hl]
	rlca
	jr c, .asm_43405
	ld de, Frameset_687f5
	jp SetObjectFramesetPtr
.asm_43405
	ld de, Frameset_687fa
	jp SetObjectFramesetPtr

.Func_4340b:
	ld hl, wCurObjAction
	ld a, $81
	ld [hld], a
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld de, Frameset_687ff
	call SetObjectFramesetPtr
	ld a, $0c
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_43427)
	ld [hld], a
	ld a, LOW(.Func_43427)
	ld [hld], a
	ret

.Func_43427:
	ld hl, wCurObjAction
	ld a, $81
	ld [hld], a
	ld a, [hl]
	and a
	jp nz, .Func_43342
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld l, OBJ_STATE
	ld a, $01
	ld [hld], a
	ld a, [hl]
	rlca
	jr c, .asm_43448
	set OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_687ce
	call SetObjectFramesetPtr
	ret

.asm_43448
	res OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_687c9
	call SetObjectFramesetPtr
	ret
