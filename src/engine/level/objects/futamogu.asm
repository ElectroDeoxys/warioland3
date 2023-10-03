FutamoguFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]

	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a

	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]

	ld de, Frameset_68319
	call SetObjectFramesetPtr

	; save starting position
	inc l
	ld a, [wCurObjYPos + 0]
	ld [hli], a ; OBJ_VAR_1
	ld a, [wCurObjYPos + 1]
	ld [hli], a ; OBJ_VAR_2

	ld l, OBJ_COLLBOX_RIGHT
	ld a, 5
	ld [hld], a
	ld a, -21
	ld [hld], a ; OBJ_COLLBOX_LEFT
	ld a, 4
	ld [hl], a ; OBJ_COLLBOX_BOTTOM
	ret

.Climb:
	ld a, [wGroundShakeCounter]
	cp $10
	jp nc, .set_shake
	ld l, OBJ_VAR_1
	ld c, [hl]
	ld a, [wCurObjYPos + 0]
	cp c
	jr nz, .check_stepped_on
	inc l
	ld b, [hl]
	ld a, [wCurObjYPos + 1]
	cp b
	jr z, .set_idle
.check_stepped_on
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	jr z, .not_stepped_on
	res OBJFLAG_STEPPED_F, [hl]

	; move upwards at 0.5 pixels
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld b, 1
	call SubYOffset
	call HandleUpwardsFloorTransition
	jp MoveObjectUp

.not_stepped_on
	; double speed animation
	ld l, OBJ_FRAME_DURATION
	ld a, [hl]
	and a
	jr z, .skip_animation_speed_up
	dec [hl]
.skip_animation_speed_up
	jp MoveObjectUp

.Angry:
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	jr z, .set_idle
	res OBJFLAG_STEPPED_F, [hl]
	ret

.set_idle
	ld de, Frameset_68319
	call SetObjectFramesetPtr
	ld l, OBJ_FLAGS
	res OBJFLAG_NO_COLLISION_F, [hl]
	xor a
	ld [wCurObjState], a
	ret

.Update:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .Idle
	cp OBJSTATE_SPECIAL_3
	jr z, .Climb
	cp OBJSTATE_SPECIAL_2
	jr z, .Angry
	cp OBJSTATE_ATTACKED_LEFT
	jr z, .Shake
	cp OBJSTATE_VANISH_TOUCH
	jr z, .asm_407bf
	cp OBJSTATE_3A
	jp z, .Fall
	and $fe
	cp OBJSTATE_ATTACKED_LEFT_START
	jr z, .Attacked
	jr .set_idle

.Idle
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .no_shake

.set_shake
	ld a, OBJSTATE_ATTACKED_LEFT
	ld [hl], a ; OBJ_STATE

	ld de, Frameset_68348
	call SetObjectFramesetPtr
	ld a, 32
	ld [hli], a ; OBJ_STATE_DURATION
	ret

.no_shake
	ld l, OBJ_VAR_1
	ld c, [hl]
	ld a, [wCurObjYPos + 0]
	cp c
	jr nz, .asm_4078c
	inc l
	ld b, [hl] ; OBJ_VAR_2
	ld a, [wCurObjYPos + 1]
	cp b
	jr z, .asm_4079a
.asm_4078c
	ld l, OBJ_STATE
	ld a, OBJSTATE_SPECIAL_3
	ld [hld], a
	res OBJSUBFLAG_HDIR_F, [hl] ; OBJ_SUBSTATE
	ld de, Frameset_68336
	call SetObjectFramesetPtr
	ret

.asm_4079a
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	ret z
	ld a, OBJSTATE_SPECIAL_2
	ld [wCurObjState], a
	ld de, Frameset_68343
	call SetObjectFramesetPtr
	ret

.Attacked
	ld a, OBJSTATE_ATTACKED_LEFT
	ld [hl], a ; OBJ_STATE
	ld de, Frameset_68351
	call SetObjectFramesetPtr
	ld a, 16
	ld [hli], a ; OBJ_STATE_DURATION
	ret

.Shake
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	jp .set_idle

.asm_407bf
	dec l
	ld a, [hli] ; OBJ_SUBSTATE
	rlca
	jr c, .vanish
	ld a, OBJSTATE_3A
	ld [hld], a ; OBJ_STATE
	dec l
	xor a
	ld [hl], a ; OBJ_VAR_3
	ld de, Frameset_68348
	call SetObjectFramesetPtr
	ld a, 48
	ld [hli], a ; OBJ_STATE_DURATION
	ret

.Fall:
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jp z, .set_idle
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	ret c ; already as low as possible
	ld a, [wEffectivePowerUp]
	cp SUPER_JUMP_SLAM_OVERALLS
	jr nc, .has_super_jump_slam
	ld bc, Data_603f0
	jr .asm_407ee
.has_super_jump_slam
	ld bc, Data_60490
.asm_407ee
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
	jr nc, .vanish
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_SUBSTATE
	set OBJSUBFLAG_HDIR_F, [hl] ; can't go lower
	ret

.vanish
	ld a, $08
	ld [wCurObjVar2], a
	call MoveObjectLeftByVar2
	jp VanishObject
