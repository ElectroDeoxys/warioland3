WebberFunc: ; 40825 (10:4825)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]

	ld l, OBJ_COLLBOX_RIGHT
	ld a, -2
	ld [hld], a
	ld a, -16
	ld [hld], a
	ld a, -4
	ld [hl], a

	; save starting position
	ld l, OBJ_UNK_17
	ld a, [wCurObjYPos + 0]
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	ld [hli], a ; OBJ_UNK_18
	ld a, 4
	ld [hl], a ; OBJ_MOVEMENT_INDEX
	jp .set_fire_projectile

.Func_40851:
	ld a, HIGH(Func_3326)
	ld c, LOW(Func_3326)
	ld b, $02
	ld de, Frameset_682c2
	jr .asm_40865

.Func_4085c:
	ld a, HIGH(Func_3317)
	ld c, LOW(Func_3317)
	ld b, $02
	ld de, Frameset_682c5

.asm_40865
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld [hld], a
	ld [hl], c
	call SetObjectFramesetPtr
	ld l, OBJ_UNK_1A
	ld a, [hl]
	and $f0
	ld [hld], a
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld a, b
	ld [hld], a ; OBJ_UNK_18
	ld a, 1 | (1 << 7)
	ld [wCurObjUnk1c], a
	ret

.set_smash_attacked:
	xor a
	ld [hld], a
	ld a, [hl] ; OBJ_UNK_1A
	rlca
	jp c, ObjAction_Vanish
	ld a, [hl]
	and $f0
	or $5
	ld [hld], a
	xor a
	ld [hl], a ; OBJ_MOVEMENT_INDEX
	ld de, Frameset_682a9
	call SetObjectFramesetPtr
	ld a, 48
	ld [hli], a ; OBJ_ACTION_DURATION
	ret

.Update:
	ld hl, wCurObjAction
	ld a, [hl]
	and a
	jr z, .Default
	cp OBJACTION_04
	jr z, .Func_40851
	cp OBJACTION_05
	jr z, .Func_4085c
	cp OBJACTION_VANISH
	jr z, .set_smash_attacked

	xor a
	ld [hld], a
	ld a, [hl] ; OBJ_UNK_1A
	and $f0
	or $6
	ld [hld], a
	ld de, Frameset_682d1
	call SetObjectFramesetPtr
	ld a, 50
	ld [hli], a ; OBJ_ACTION_DURATION
	ld l, OBJ_FLAGS
	res OBJFLAG_UNK3_F, [hl]

.Default:
	ld l, OBJ_UNK_1A
	ld a, [hl]
	and $0f
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
	ld hl, wCurObjUnk1a
	ld a, [hl]
	and $70
	or $3
	ld [hld], a
	ld a, 5
	ld [hl], a ; OBJ_MOVEMENT_INDEX
	ld de, Frameset_682b2
	jp SetObjectFramesetPtr

.MoveBackToStartPosition:
	ld a, [wGroundShakeCounter]
	cp $10
	jp nc, .set_shake
	ld hl, wCurObjUnk17
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
	ld l, OBJ_UNK_1A
	ld a, [hl]
	and $f0
	or $1
	ld [hld], a
	ld de, Frameset_682a4
	jp SetObjectFramesetPtr

.move_up
	ld hl, wCurObjFlags
	bit OBJFLAG_UNK5_F, [hl]
	jr z, .not_stepped1
	res OBJFLAG_UNK5_F, [hl]
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld b, 1
	call SubYOffset
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
	bit OBJFLAG_UNK5_F, [hl]
	jr z, .not_stepped2
	res OBJFLAG_UNK5_F, [hl]
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld b, 1
	call AddYOffset
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
	ld hl, wCurObjUnk1a
	ld a, [hl]
	and $f0
	or $4
	ld [hld], a
	xor a
	ld [hl], a ; OBJ_MOVEMENT_INDEX
	ld de, Frameset_682a9
	call SetObjectFramesetPtr
	ld a, 48
	ld [hli], a ; OBJ_ACTION_DURATION
	ret

.Shake:
	ld a, [wCurObjMovementIndex]
	cp 15
	jr z, .end_shake
	ld bc, Data_604a0
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
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_UNK_1A
	set 7, [hl]
.end_shake
	ld hl, wCurObjActionDuration
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
	bit OBJFLAG_UNK5_F, [hl]
	jr z, .not_stepped3
	ld l, OBJ_UNK_1A
	ld a, [hl]
	and $f0
	or $7
	ld [hld], a
	ld de, Frameset_682d6
	jp SetObjectFramesetPtr

.not_stepped3
	ld a, [wGlobalCounter]
	and %01111111
	ret nz
	ld l, OBJ_MOVEMENT_INDEX
	dec [hl]
	jp nz, .set_fire_projectile
	inc l
	ld a, [hl]
	and $f0
	or $8
	ld [hld], a ; OBJ_UNK_1A
	ld de, Frameset_682e2
	call SetObjectFramesetPtr
	ld a, 162
	ld [hli], a ; OBJ_ACTION_DURATION
	ret

.SteppedOn:
	ld hl, wCurObjFlags
	bit 5, [hl]
	jp z, .set_move_to_start_pos
	res 5, [hl]
	ret
; 0x409f1

.SmashAttacked:
	ld a, [wGroundShakeCounter]
	cp $10
	jp nc, .set_shake
	ld hl, wCurObjActionDuration
	dec [hl]
	jp z, .set_move_to_start_pos
	ld l, OBJ_UNK_1A
	ld a, [hl]
	rlca
	ret c
	ld a, [wEffectivePowerUp]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jr nc, .has_super_jump_slam
	ld bc, Data_603f0
	jr .asm_40a14
.has_super_jump_slam
	ld bc, Data_60490
.asm_40a14
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
	ld a, [wEffectivePowerUp]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jp nc, ObjAction_Vanish
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_UNK_1A
	set 7, [hl]
	ret

.set_fire_projectile
	ld hl, wCurObjUnk1a
	ld a, [hl]
	and $f0
	or $2
	ld [hld], a
	ld de, Frameset_682b7
	call SetObjectFramesetPtr
	ld a, 64
	ld [hli], a ; OBJ_ACTION_DURATION
	ret

.FireProjectile:
	ld a, [wGroundShakeCounter]
	cp $10
	jp nc, .set_shake
	ld hl, wCurObjActionDuration
	dec [hl]
	jp z, .set_idle
	ld a, [hl]
	cp 40
	ret nz
	ld bc, ObjParams_WebberProjectile
	jp CreateObjectAtRelativePos

.Climb:
	ld a, 1 | (1 << 7)
	ld [wCurObjUnk1c], a
	ld a, [wGroundShakeCounter]
	cp $10
	jp nc, .set_shake
	ld hl, wCurObjActionDuration
	dec [hl]
	jp z, .set_move_to_start_pos
	ld a, [hl]
	cp 20
	jp nc, MoveObjectUp
	ret

.SpecialIdle:
	ld hl, wCurObjActionDuration
	dec [hl]
	jr z, .asm_40aa9
	ld a, [wGroundShakeCounter]
	cp $10
	jp nc, .set_shake
	ld l, OBJ_FLAGS
	bit OBJFLAG_UNK5_F, [hl]
	ret z
	ld l, OBJ_UNK_1A
	ld a, [hl]
	and $f0
	or $7
	ld [hld], a
	ld de, Frameset_682d6
	jp SetObjectFramesetPtr
.asm_40aa9
	ld a, 5
	ld [wCurObjMovementIndex], a
	jp .set_idle
; 0x40ab1

WebberProjectileFunc: ; 40ab1 (10:4ab1)
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
	set OBJFLAG_UNK3_F, [hl]

	ld a, [wCurObjAction]
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
	ld [hli], a ; OBJ_ACTION_DURATION
	ret

.Destroy:
	ld a, 1 | (1 << 7)
	ld [wCurObjUnk1c], a
	ld hl, wCurObjActionDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret
; 0x40b14
