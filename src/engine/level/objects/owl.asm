OwlFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $06
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld a, $fe
	ld [hl], a
	ld a, [wDayNight]
	rra
	jr c, .night
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Sleep)
	ld [hld], a
	ld a, LOW(.Sleep)
	ld [hld], a
	ld de, Frameset_692e7
	jp SetObjectFramesetPtr

.night
	; at night Owl immediately flies upwards
	play_sfx SFX_OWL_HOOT
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_0B
	ld [hld], a
	jr .set_fly_upwards

.Sleep:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	ret z
	xor a
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.WakeUp)
	ld [hld], a
	ld a, LOW(.WakeUp)
	ld [hld], a
	ld de, Frameset_69318
	call SetObjectFramesetPtr
	ld a, $28
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_0B
	ld [hld], a
	play_sfx SFX_OWL_HOOT
	ret

.WakeUp:
	ld a, [wCurObjFrame]
	cp $0c
	jr nz, .asm_4924e
	ld a, [wCurObjFrameDuration]
	dec a
	play_sfx z, SFX_FLAP
.asm_4924e
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
.set_fly_upwards
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.FlyUpwards)
	ld [hld], a
	ld a, LOW(.FlyUpwards)
	ld [hld], a
	ld de, Frameset_69335
	call SetObjectFramesetPtr
	ld a, 54
	ld [hli], a
	ret

.FlyUpwards:
	ld a, [wCurObjFrame]
	cp $0c
	jr nz, .asm_4927a
	ld a, [wCurObjFrameDuration]
	dec a
	play_sfx z, SFX_FLAP
.asm_4927a
	call MoveObjectUp
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld a, 30
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_492b4)
	ld [hld], a
	ld a, LOW(.Func_492b4)
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_OWL
	ld [hld], a
	ld l, OBJ_SUBSTATE
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_492ac
	res OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_6936c
	jp SetObjectFramesetPtr
.asm_492ac
	set OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_69377
	jp SetObjectFramesetPtr

.Func_492b4:
	ld a, [wCurObjState]
	cp $18
	jr z, .despawn
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_492f7
	ld a, [wCurObjSubState]
	rlca
	jr c, .flying_right
	ld a, [wCurObjFrame]
	cp $1e
	jr nz, .move_left
	ld a, [wCurObjFrameDuration]
	dec a
	play_sfx z, SFX_FLAP
.move_left
	jp MoveObjectLeft

.flying_right
	ld a, [wCurObjFrame]
	cp $23
	jr nz, .move_right
	ld a, [wCurObjFrameDuration]
	dec a
	play_sfx z, SFX_FLAP
.move_right
	jp MoveObjectRight

.asm_492f7
	ld a, 60
	ld [hl], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor $80
	ld [hl], a
	rla
	jr c, .asm_49309
	ld de, Frameset_6936c
	jp SetObjectFramesetPtr
.asm_49309
	ld de, Frameset_69377
	jp SetObjectFramesetPtr

.despawn
	xor a
	ld [wCurObjFlags], a
	ld hl, wCurObjUnk02
	farcall DespawnObject
	ret
