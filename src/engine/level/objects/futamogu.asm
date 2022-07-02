FutamoguFunc: ; 406c4 (10:46c4)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]

	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a

	ld l, OBJ_UNK_1A
	res 5, [hl]

	ld de, Frameset_68319
	call SetObjectFramesetPtr

	; save starting position
	inc l
	ld a, [wCurObjYPos + 0]
	ld [hli], a ; OBJ_UNK_17
	ld a, [wCurObjYPos + 1]
	ld [hli], a ; OBJ_UNK_18

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
	ld l, OBJ_UNK_17
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
	bit OBJFLAG_UNK5_F, [hl]
	jr z, .not_stepped_on
	res OBJFLAG_UNK5_F, [hl]

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
	bit OBJFLAG_UNK5_F, [hl]
	jr z, .set_idle
	res OBJFLAG_UNK5_F, [hl]
	ret

.set_idle
	ld de, Frameset_68319
	call SetObjectFramesetPtr
	ld l, OBJ_FLAGS
	res OBJFLAG_UNK3_F, [hl]
	xor a
	ld [wCurObjAction], a
	ret

.Update:
	ld hl, wCurObjAction
	ld a, [hl]
	and a
	jr z, .Idle
	cp OBJACTION_WAKE_UP
	jr z, .Climb
	cp OBJACTION_ANGRY
	jr z, .Angry
	cp OBJACTION_34
	jr z, .Shake
	cp OBJACTION_VANISH
	jr z, .asm_407bf
	cp OBJACTION_3A
	jp z, .Fall
	and $fe
	cp OBJACTION_04
	jr z, .asm_407ab
	jr .set_idle

.Idle
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .no_shake

.set_shake
	ld a, OBJACTION_34
	ld [hl], a ; OBJ_ACTION

	ld de, Frameset_68348
	call SetObjectFramesetPtr
	ld a, 32
	ld [hli], a ; OBJ_ACTION_DURATION
	ret

.no_shake
	ld l, OBJ_UNK_17
	ld c, [hl]
	ld a, [wCurObjYPos + 0]
	cp c
	jr nz, .asm_4078c
	inc l
	ld b, [hl] ; OBJ_UNK_18
	ld a, [wCurObjYPos + 1]
	cp b
	jr z, .asm_4079a
.asm_4078c
	ld l, OBJ_ACTION
	ld a, OBJACTION_WAKE_UP
	ld [hld], a
	res 7, [hl] ; OBJ_UNK_1A
	ld de, Frameset_68336
	call SetObjectFramesetPtr
	ret

.asm_4079a
	ld l, OBJ_FLAGS
	bit OBJFLAG_UNK5_F, [hl]
	ret z
	ld a, OBJACTION_ANGRY
	ld [wCurObjAction], a
	ld de, Frameset_68343
	call SetObjectFramesetPtr
	ret

.asm_407ab
	ld a, OBJACTION_34
	ld [hl], a ; OBJ_ACTION
	ld de, Frameset_68351
	call SetObjectFramesetPtr
	ld a, $10
	ld [hli], a ; OBJ_ACTION_DURATION
	ret

.Shake
	ld l, OBJ_ACTION_DURATION
	dec [hl]
	ret nz
	jp .set_idle

.asm_407bf
	dec l
	ld a, [hli] ; OBJ_UNK_1A
	rlca
	jr c, .vanish
	ld a, OBJACTION_3A
	ld [hld], a ; OBJ_ACTION
	dec l
	xor a
	ld [hl], a ; OBJ_MOVEMENT_INDEX
	ld de, Frameset_68348
	call SetObjectFramesetPtr
	ld a, 48
	ld [hli], a ; OBJ_ACTION_DURATION
	ret

.Fall:
	ld l, OBJ_ACTION_DURATION
	dec [hl]
	jp z, .set_idle
	ld l, OBJ_UNK_1A
	ld a, [hl]
	rlca
	ret c ; already as low as possible
	ld a, [w1d14a]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jr nc, .has_super_jump_slam
	ld bc, Data_603f0
	jr .asm_407ee
.has_super_jump_slam
	ld bc, Data_60490
.asm_407ee
	call Func_34b7

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

	ld a, [w1d14a]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jr nc, .vanish
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_UNK_1A
	set 7, [hl] ; can't go lower
	ret

.vanish
	ld a, $08
	ld [wCurObjUnk18], a
	call Func_305c
	jp ObjAction_Vanish
; 0x40825
