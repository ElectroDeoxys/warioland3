WebberFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]

	ld l, OBJ_COLLBOX_RIGHT
	ld a, -2
	ld [hld], a
	ld a, -16
	ld [hld], a
	ld a, -4
	ld [hl], a

	; save starting position
	ld l, OBJ_VAR_1
	ld a, [wCurObjYPos + 0]
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	ld [hli], a ; OBJ_VAR_2
	ld a, 4
	ld [hl], a ; OBJ_VAR_3
	jp .set_fire_projectile

.AttackedLeftStart:
	ld a, HIGH(Func_3326)
	ld c, LOW(Func_3326)
	ld b, $02
	ld de, Frameset_682c2
	jr .asm_40865

.AttackedRightStart:
	ld a, HIGH(Func_3317)
	ld c, LOW(Func_3317)
	ld b, $02
	ld de, Frameset_682c5

.asm_40865
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld [hld], a
	ld [hl], c
	call SetObjectFramesetPtr
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	ld [hld], a
	xor a
	ld [hld], a ; OBJ_VAR_3
	ld a, b
	ld [hld], a ; OBJ_VAR_2
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

.set_smash_attacked:
	xor a
	ld [hld], a
	ld a, [hl] ; OBJ_SUBSTATE
	rlca
	jp c, VanishObject
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	or $5
	ld [hld], a
	xor a
	ld [hl], a ; OBJ_VAR_3
	ld de, Frameset_682a9
	call SetObjectFramesetPtr
	ld a, 48
	ld [hli], a ; OBJ_STATE_DURATION
	ret

.Update:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .Default
	cp OBJSTATE_ATTACKED_LEFT_START
	jr z, .AttackedLeftStart
	cp OBJSTATE_ATTACKED_RIGHT_START
	jr z, .AttackedRightStart
	cp OBJSTATE_VANISH_TOUCH
	jr z, .set_smash_attacked

	xor a
	ld [hld], a
	ld a, [hl] ; OBJ_SUBSTATE
	and OBJSUBFLAGS_MASK
	or $6
	ld [hld], a
	ld de, Frameset_682d1
	call SetObjectFramesetPtr
	ld a, 50
	ld [hli], a ; OBJ_STATE_DURATION
	ld l, OBJ_FLAGS
	res OBJFLAG_NO_COLLISION_F, [hl]

.Default:
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and $ff ^ OBJSUBFLAGS_MASK
	jumptable

	dw .Idle
	dw .Idle
	dw .FireProjectile
	dw .MoveBackToStartPosition
	dw .Shake
	dw .SmashAttacked
	dw .Climb
	dw .SteppedOn
	dw .SpecialIdle

.set_move_to_start_pos
	ld hl, wCurObjSubState
	ld a, [hl]
	and OBJSUBFLAGS_MASK ^ OBJSUBFLAG_HDIR
	or $3
	ld [hld], a
	ld a, 5
	ld [hl], a ; OBJ_VAR_3
	ld de, Frameset_682b2
	jp SetObjectFramesetPtr

.MoveBackToStartPosition:
	ld a, [wGroundShakeCounter]
	cp $10
	jp nc, .set_shake
	ld hl, wCurObjVar1
	ld e, [hl]
	inc l
	ld d, [hl]
	ld l, OBJ_Y_POS + 1
	ld a, [hld]
	cp d
	jr z, .compare_lo_y
	jr nc, .move_up
	jr .move_down
.compare_lo_y
	ld a, [hl]
	cp e
	jr z, .set_idle
	jr nc, .move_up
	jr .move_down

.set_idle
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	or $1
	ld [hld], a
	ld de, Frameset_682a4
	jp SetObjectFramesetPtr

.move_up
	ld hl, wCurObjFlags
	bit OBJFLAG_STEPPED_F, [hl]
	jr z, .not_stepped1
	res OBJFLAG_STEPPED_F, [hl]
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld b, 1
	call MoveWarioUp
	call HandleUpwardsFloorTransition
	jr .obj_move_up
.not_stepped1
	; speed up animation
	ld l, OBJ_FRAME_DURATION
	ld a, [hl]
	and a
	jr z, .obj_move_up
	dec [hl]
.obj_move_up
	jp MoveObjectUp

.move_down
	ld hl, wCurObjFlags
	bit OBJFLAG_STEPPED_F, [hl]
	jr z, .not_stepped2
	res OBJFLAG_STEPPED_F, [hl]
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld b, 1
	call MoveWarioDown
	call HandleDownwardsFloorTransition
	jr .obj_move_down
.not_stepped2
	; speed up animation
	ld l, OBJ_FRAME_DURATION
	ld a, [hl]
	and a
	jr z, .obj_move_down
	dec [hl]
.obj_move_down
	jp MoveObjectDown

.set_shake
	ld hl, wCurObjSubState
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	or $4
	ld [hld], a
	xor a
	ld [hl], a ; OBJ_VAR_3
	ld de, Frameset_682a9
	call SetObjectFramesetPtr
	ld a, 48
	ld [hli], a ; OBJ_STATE_DURATION
	ret

.Shake:
	ld a, [wCurObjVar3]
	cp 15
	jr z, .end_shake
	ld bc, Data_604a0
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
	ld l, OBJ_SUBSTATE
	set OBJSUBFLAG_HDIR_F, [hl]
.end_shake
	ld hl, wCurObjStateDuration
	dec [hl]
	jp z, .set_move_to_start_pos
	ld a, [wGroundShakeCounter]
	cp $11
	jp nc, .set_shake
	ret

.Idle:
	ld a, [wGroundShakeCounter]
	cp $10
	jp nc, .set_shake
	ld hl, wCurObjFlags
	bit OBJFLAG_STEPPED_F, [hl]
	jr z, .not_stepped3
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	or $7
	ld [hld], a
	ld de, Frameset_682d6
	jp SetObjectFramesetPtr

.not_stepped3
	ld a, [wGlobalCounter]
	and %1111111
	ret nz
	ld l, OBJ_VAR_3
	dec [hl]
	jp nz, .set_fire_projectile
	inc l
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	or $8
	ld [hld], a ; OBJ_SUBSTATE
	ld de, Frameset_682e2
	call SetObjectFramesetPtr
	ld a, 162
	ld [hli], a ; OBJ_STATE_DURATION
	ret

.SteppedOn:
	ld hl, wCurObjFlags
	bit OBJFLAG_STEPPED_F, [hl]
	jp z, .set_move_to_start_pos
	res OBJFLAG_STEPPED_F, [hl]
	ret

.SmashAttacked:
	ld a, [wGroundShakeCounter]
	cp $10
	jp nc, .set_shake
	ld hl, wCurObjStateDuration
	dec [hl]
	jp z, .set_move_to_start_pos
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	ret c
	ld a, [wEffectivePowerUp]
	cp SUPER_JUMP_SLAM_OVERALLS
	jr nc, .has_super_jump_slam
	ld bc, Data_603f0
	jr .asm_40a14
.has_super_jump_slam
	ld bc, Data_60490
.asm_40a14
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
	ld a, [wEffectivePowerUp]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp nc, VanishObject
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_SUBSTATE
	set OBJSUBFLAG_HDIR_F, [hl]
	ret

.set_fire_projectile
	ld hl, wCurObjSubState
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	or $2
	ld [hld], a
	ld de, Frameset_682b7
	call SetObjectFramesetPtr
	ld a, 64
	ld [hli], a ; OBJ_STATE_DURATION
	ret

.FireProjectile:
	ld a, [wGroundShakeCounter]
	cp $10
	jp nc, .set_shake
	ld hl, wCurObjStateDuration
	dec [hl]
	jp z, .set_idle
	ld a, [hl]
	cp 40
	ret nz
	ld bc, ObjParams_WebberProjectile
	jp CreateObjectAtRelativePos

.Climb:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wGroundShakeCounter]
	cp $10
	jp nc, .set_shake
	ld hl, wCurObjStateDuration
	dec [hl]
	jp z, .set_move_to_start_pos
	ld a, [hl]
	cp 20
	jp nc, MoveObjectUp
	ret

.SpecialIdle:
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_40aa9
	ld a, [wGroundShakeCounter]
	cp $10
	jp nc, .set_shake
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	ret z
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	or $7
	ld [hld], a
	ld de, Frameset_682d6
	jp SetObjectFramesetPtr
.asm_40aa9
	ld a, 5
	ld [wCurObjVar3], a
	jp .set_idle

WebberProjectileFunc:
; home into Wario
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .right
; left
	call MoveObjectLeft_Slow
	jr .move_down
.right
	call MoveObjectRight_Slow
.move_down
	call MoveObjectDown

	ld hl, wCurObjFlags
	set OBJFLAG_NO_COLLISION_F, [hl]

	ld a, [wCurObjState]
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
	call Func_352b
	and a
	ret z
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a

.set_destroy
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Destroy)
	ld [hld], a
	ld a, LOW(.Destroy)
	ld [hld], a
	ld de, Frameset_682db
	call SetObjectFramesetPtr
	ld a, 24
	ld [hli], a ; OBJ_STATE_DURATION
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
