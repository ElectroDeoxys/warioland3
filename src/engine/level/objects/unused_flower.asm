UnusedFlowerFunc:
.Init
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Grow)
	ld [hld], a
	ld a, LOW(.Grow)
	ld [hld], a
	ld de, Frameset_6837a
	call SetObjectFramesetPtr
	ld a, 30
	ld [hli], a ; OBJ_STATE_DURATION
	ld a, [wGlobalCounter]
	ld [hl], a ; OBJ_VAR_1
	ret

.Grow:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld hl, wCurObjFlags
	ld a, [hl]
	and OBJFLAG_ACTIVE | OBJFLAG_ON_SCREEN
	cp OBJFLAG_ACTIVE | OBJFLAG_ON_SCREEN
	ret nz
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Idle)
	ld [hld], a
	ld a, LOW(.Idle)
	ld [hld], a
	ld de, Frameset_6837a
	call SetObjectFramesetPtr
	ld a, 49
	ld [hli], a ; OBJ_STATE_DURATION
	ret

.Idle:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .next1
	dec [hl]
	ret nz
.next1
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld a, [wGlobalCounter]
	ld e, a
	ld a, [wCurObjVar1]
	cp e
	ret nz
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.PreparingAttack)
	ld [hld], a
	ld a, LOW(.PreparingAttack)
	ld [hld], a
	ld de, Frameset_683ac
	call SetObjectFramesetPtr
	ld a, 68
	ld [hli], a ; OBJ_STATE_DURATION
	ret

.PreparingAttack:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Attack)
	ld [hld], a
	ld a, LOW(.Attack)
	ld [hld], a
	ld de, Frameset_683b1
	call SetObjectFramesetPtr
	ld a, 35
	ld [hli], a ; OBJ_STATE_DURATION
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .attack_right
	ld bc, ObjParams_UnusedFlowerProjectileLeft
	jr .create_projectile
.attack_right
	ld bc, ObjParams_UnusedFlowerProjectileRight
.create_projectile
	jp CreateObjectAtRelativePos

.Attack:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .next2
	dec [hl]
	ret nz
.next2
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld a, [wGlobalCounter]
	ld e, a
	ld a, [wCurObjVar1]
	cp e
	ret nz
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Init)
	ld [hld], a
	ld a, LOW(.Init)
	ld [hld], a
	ret

UnusedFlowerProjectileRightFunc:
	call MoveObjectRight
	jr UnusedFlowerProjectileCommonFunc
UnusedFlowerProjectileLeftFunc:
	call MoveObjectLeft
UnusedFlowerProjectileCommonFunc:
	ld a, [wCurObjState]
	and a
	jr z, .Thrown
	cp OBJSTATE_SPECIAL_1
	jr z, .Roll
	cp OBJSTATE_SPECIAL_2
	jr z, .Jump
.set_destroy
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Destroy)
	ld [hld], a
	ld a, LOW(.Destroy)
	ld [hld], a
	ld de, Frameset_68389
	call SetObjectFramesetPtr
	ld a, 8
	ld [hli], a ; OBJ_STATE_DURATION
	ret

.Roll
	ld l, OBJ_Y_POS
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr nz, .set_destroy
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_3543
	and a
	ret nz
	ld a, OBJSTATE_SPECIAL_2
	ld [wCurObjState], a
	xor a
	ld [wCurObjVar3], a
	ret

.Jump
	ld bc, Data_60320 + $8
	jr .asm_40ddd
.Thrown:
	ld bc, Data_60320
.asm_40ddd
	call ApplyObjYMovement

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
	ret z
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld a, OBJSTATE_SPECIAL_1
	ld [wCurObjState], a
	ret

.Destroy:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret
