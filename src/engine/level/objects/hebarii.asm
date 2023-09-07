HebariiFunc: ; 49fc4 (12:5fc4)
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Init)
	ld [hld], a
	ld a, LOW(.Init)
	ld [hld], a
	ret

.Init:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]

	ld l, OBJ_COLLBOX_RIGHT
	ld a, 5
	ld [hld], a
	ld a, -7
	ld [hld], a
	ld a, -12
	ld [hl], a

	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.AttachedUpdate)
	ld [hld], a
	ld a, LOW(.AttachedUpdate)
	ld [hld], a

	ld de, Frameset_683e4
	call SetObjectFramesetPtr

	ld a, 20
	ld [hli], a ; OBJ_STATE_DURATION
	xor a
	ld [hl], a ; OBJ_VAR_1
	ld l, OBJ_SUBSTATE
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .set_right
; set left
	res OBJSUBFLAG_HDIR_F, [hl]
	ret
.set_right
	set OBJSUBFLAG_HDIR_F, [hl]
	ret

.StartAttackedLeftStart:
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.DetachedUpdate)
	ld [hld], a
	ld a, LOW(.DetachedUpdate)
	ld [hld], a
	jp .AttackedLeftStart

.StartAttackedRightStart:
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.DetachedUpdate)
	ld [hld], a
	ld a, LOW(.DetachedUpdate)
	ld [hld], a
	jp .AttackedRightStart

.StartState28:
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.DetachedUpdate)
	ld [hld], a
	ld a, LOW(.DetachedUpdate)
	ld [hld], a
	jp .State28

.StartState29:
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.DetachedUpdate)
	ld [hld], a
	ld a, LOW(.DetachedUpdate)
	ld [hld], a
	jp z, .State29

.AttachedUpdate:
; for when Hebarii is still attached to the ceiling
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .no_shake1
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.DetachedUpdate)
	ld [hld], a
	ld a, LOW(.DetachedUpdate)
	ld [hld], a
	ld de, Frameset_683f8
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 5
	ld [hld], a
	ld a, -6
	ld [hld], a
	ld a, -1
	ld [hld], a
	ld a, -14
	ld [hld], a
	ld a, [hl] ; OBJ_INTERACTION_TYPE
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ld a, OBJSTATE_SPECIAL_1
	ld [wCurObjState], a
	xor a
	ld [wCurObjVar3], a
	ret

.no_shake1
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_4a08d
	cp OBJSTATE_ATTACKED_LEFT_START
	jr z, .StartAttackedLeftStart
	cp OBJSTATE_ATTACKED_RIGHT_START
	jr z, .StartAttackedRightStart
	cp OBJSTATE_28
	jr z, .StartState28
	cp OBJSTATE_29
	jr z, .StartState29
	cp OBJSTATE_VANISH_TOUCH
	jp z, VanishObject2
	xor a
	ld [hl], a
	ld l, OBJ_FLAGS
	res OBJFLAG_NO_COLLISION_F, [hl]
.asm_4a08d
	ld l, OBJ_VAR_1
	ld a, [hld]
	dec a
	jr z, .asm_4a0fd
	dec [hl]
	jr nz, .asm_4a0a3
	ld de, Frameset_683ed
	call SetObjectFramesetPtr
	ld a, 41
	ld [hli], a ; OBJ_STATE_DURATION
	ld a, $01
	ld [hl], a ; OBJ_VAR_1
	ret

.asm_4a0a3
	ld a, [wGlobalCounter]
	and %11
	ret nz
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 18
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_4a0c8
	ld a, [hli]
	sub 11
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	jr .asm_4a0d2
.asm_4a0c8
	ld a, [hli]
	add 9
	ldh [hXPosLo], a
	ld a, [hli]
	adc 0
	ldh [hXPosHi], a
.asm_4a0d2
	call Func_3513
	and a
	jr z, .switch_direction
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	call Func_3513
	and a
	jr nz, .switch_direction
	ld a, [wCurObjSubState]
	rlca
	jp c, MoveObjectRight
	jp MoveObjectLeft

.switch_direction
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	ret

.asm_4a0fd
	ld a, [hl] ; OBJ_STATE_DURATION
	cp 30
	jr z, .asm_4a10f
	dec [hl]
	ret nz
	ld a, 126
	ld [hli], a
	xor a
	ld [hl], a ; OBJ_VAR_1
	ld de, Frameset_683e4
	jp SetObjectFramesetPtr

.asm_4a10f
	dec [hl]
	ld l, OBJ_FLAGS
	bit OBJFLAG_ON_SCREEN_F, [hl]
	ret z
	ld bc, ObjParams_HebariiProjectile
	jp CreateObjectAtRelativePos

.DetachedUpdate:
; functions for when Hebarii is detached from the ceiling 
	ld a, [wCurObjState]
	jumptable

	dw .Vanish ; OBJSTATE_00
	dw .Vanish ; OBJSTATE_LAND
	dw .Func_4a26d ; OBJSTATE_BUMP_LEFT_START
	dw .Func_4a277 ; OBJSTATE_BUMP_RIGHT_START
	dw .AttackedLeftStart ; OBJSTATE_ATTACKED_LEFT_START
	dw .AttackedRightStart ; OBJSTATE_ATTACKED_RIGHT_START
	dw .PickedUpLeftStart ; OBJSTATE_PICKED_UP_LEFT_START
	dw .PickedUpRightStart ; OBJSTATE_PICKED_UP_RIGHT_START
	dw .Func_4a26d ; OBJSTATE_WOBBLE_LEFT_START
	dw .Func_4a277 ; OBJSTATE_WOBBLE_RIGHT_START
	dw .Vanish ; OBJSTATE_VANISH_TOUCH
	dw .Vanish ; OBJSTATE_0B
	dw .Vanish ; OBJSTATE_0C
	dw .Vanish ; OBJSTATE_0D
	dw .Vanish ; OBJSTATE_0E
	dw .State0f ; OBJSTATE_0F
	dw .Vanish ; OBJSTATE_10
	dw .Vanish ; OBJSTATE_STANDING_FALL_START
	dw .State12 ; OBJSTATE_12
	dw .Func_4a224 ; OBJSTATE_TURN_AROUND_START
	dw .State14 ; OBJSTATE_14
	dw .State15 ; OBJSTATE_15
	dw .StunLeftStart ; OBJSTATE_STUN_LEFT_START
	dw .StunRightStart ; OBJSTATE_STUN_RIGHT_START
	dw .State18 ; OBJSTATE_18
	dw .State19 ; OBJSTATE_19
	dw .Vanish ; OBJSTATE_1A
	dw .Vanish ; OBJSTATE_1B
	dw .Vanish ; OBJSTATE_1C
	dw .Vanish ; OBJSTATE_1D
	dw .Vanish ; OBJSTATE_1E
	dw .Vanish ; OBJSTATE_1F
	dw Func_3191 ; OBJSTATE_20
	dw Func_31af ; OBJSTATE_21
	dw Func_31cd ; OBJSTATE_22
	dw Func_31eb ; OBJSTATE_23
	dw Func_3209 ; OBJSTATE_24
	dw Func_3227 ; OBJSTATE_25
	dw Func_3245 ; OBJSTATE_26
	dw Func_3254 ; OBJSTATE_27
	dw .State28 ; OBJSTATE_28
	dw .State29 ; OBJSTATE_29
	dw .Vanish ; OBJSTATE_ACTIVATE
	dw .Vanish ; OBJSTATE_2B
	dw .Vanish ; OBJSTATE_2C
	dw .FallFromCeiling ; OBJSTATE_SPECIAL_1
	dw .Vanish ; OBJSTATE_SPECIAL_2
	dw .Vanish ; OBJSTATE_SPECIAL_3
	dw .Vanish ; OBJSTATE_FALL
	dw .Func_4a224 ; OBJSTATE_WALK
	dw ObjState_BumpLeft ; OBJSTATE_BUMP_LEFT
	dw ObjState_BumpRight ; OBJSTATE_BUMP_RIGHT
	dw .Vanish ; OBJSTATE_ATTACKED_LEFT
	dw .Vanish ; OBJSTATE_ATTACKED_RIGHT
	dw Func_3335 ; OBJSTATE_PICKED_UP_LEFT
	dw Func_3344 ; OBJSTATE_PICKED_UP_RIGHT
	dw Func_31fa ; OBJSTATE_WOBBLE_LEFT
	dw Func_31dc ; OBJSTATE_WOBBLE_RIGHT
	dw .Vanish ; OBJSTATE_3A
	dw .Vanish ; OBJSTATE_3B
	dw .Vanish ; OBJSTATE_3C
	dw .Vanish ; OBJSTATE_3D
	dw .Vanish ; OBJSTATE_3E
	dw .State3f ; OBJSTATE_3F
	dw .Vanish ; OBJSTATE_40
	dw .Vanish ; OBJSTATE_STANDING_FALL
	dw Func_3371 ; OBJSTATE_42
	dw .Vanish ; OBJSTATE_TURN_AROUND
	dw Func_32cc ; OBJSTATE_44
	dw Func_32db ; OBJSTATE_45
	dw .StunLeft ; OBJSTATE_STUN_LEFT
	dw .StunRight ; OBJSTATE_STUN_RIGHT
	dw .State48 ; OBJSTATE_48
	dw .State49 ; OBJSTATE_49
	dw Func_3380 ; OBJSTATE_4A
	dw Func_338f ; OBJSTATE_4B
	dw .FullThrowLeftStart ; OBJSTATE_FULL_THROW_LEFT_START
	dw .FullThrowRightStart ; OBJSTATE_FULL_THROW_RIGHT_START
	dw Func_339e ; OBJSTATE_4E
	dw Func_33ad ; OBJSTATE_4F
	dw Func_31a0 ; OBJSTATE_50
	dw Func_31be ; OBJSTATE_51
	dw Func_31dc ; OBJSTATE_52
	dw Func_31fa ; OBJSTATE_53
	dw Func_3218 ; OBJSTATE_54
	dw Func_3236 ; OBJSTATE_55
	dw Func_32cc ; OBJSTATE_56
	dw Func_32db ; OBJSTATE_57
	dw .Vanish ; OBJSTATE_58
	dw .Vanish ; OBJSTATE_59
	dw .Vanish ; OBJSTATE_5A
	dw .Vanish ; OBJSTATE_5B
	dw .Vanish ; OBJSTATE_5C
	dw .Vanish ; OBJSTATE_5D
	dw ObjState_FullThrowLeft ; OBJSTATE_FULL_THROW_LEFT
	dw ObjState_FullThrowRight ; OBJSTATE_FULL_THROW_RIGHT

.Vanish:
	jp VanishObject2

.FallFromCeiling:
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
	jr nz, .asm_4a204
	ld a, [wc0dd]
	and a
	jp nz, VanishObject2
	ld bc, FallingYVel_Light
	jp ApplyObjYMovement

.asm_4a204
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld a, OBJSTATE_WALK
	ld [wCurObjState], a
	ld de, Frameset_683fb
	call SetObjectFramesetPtr
	ld a, 160
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hli], a
	ret

.Func_4a224:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .no_shake2
	ldh a, [rDIV]
	rra
	ld a, OBJSTATE_WOBBLE_LEFT_START >> 1
	rla ; either OBJSTATE_WOBBLE_LEFT_START or OBJSTATE_WOBBLE_RIGHT_START
	ld [wCurObjState], a
	ret

.no_shake2
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
.State0f:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a ; redundant, already done below
	ld a, OBJSTATE_3F
	ld [wCurObjState], a
	ld de, Frameset_68430
	call SetObjectFramesetPtr
	ld a, 35
	ld [hli], a
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
.State3f:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UNK_02
	farcall DespawnObject
	ret

.Func_4a26d:
	ld hl, wCurObjAction
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_WOBBLE_LEFT
	jr .asm_4a27f
.Func_4a277:
	ld hl, wCurObjAction
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_WOBBLE_RIGHT
.asm_4a27f
	ld [hld], a
	ld de, Frameset_683fb
	call SetObjectFramesetPtr
	ld a, 4
	ld [hli], a ; OBJ_STATE_DURATION
	inc l
	ld a, $02
	ld [hli], a ; OBJ_VAR_2
	xor a
	ld [hli], a ; OBJ_VAR_3
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
	ret

.StunLeftStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_STUN_LEFT
	ld [hld], a
	ld de, Frameset_683fb
	call SetObjectFramesetPtr
.StunLeft:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, OBJSTATE_0F
	ld [wCurObjState], a
	ret

.StunRightStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_STUN_RIGHT
	ld [hld], a
	ld de, Frameset_683fb
	call SetObjectFramesetPtr
.StunRight:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, OBJSTATE_0F
	ld [wCurObjState], a
	ret

.State14:
	ld a, OBJSTATE_44
	jr .asm_4a2d2
.State15:
	ld a, OBJSTATE_45
.asm_4a2d2
	ld [wCurObjState], a
	xor a
	ld [wCurObjVar3], a
	ld a, $02
	ld [wCurObjVar2], a
	ret

.PickedUpLeftStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_PICKED_UP_LEFT
	ld [hld], a
	dec l
	ld a, 65
	ld [hld], a ; OBJ_VAR_3
	ld a, $c0
	ld [hld], a ; OBJ_VAR_2
	ld a, $01
	ld [hld], a ; OBJ_VAR_1
	ld de, Frameset_683fb
	call SetObjectFramesetPtr
	jp Func_3335

.PickedUpRightStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_PICKED_UP_RIGHT
	ld [hld], a
	dec l
	ld a, 65
	ld [hld], a ; OBJ_VAR_3
	ld a, $e0
	ld [hld], a ; OBJ_VAR_2
	ld a, $01
	ld [hld], a ; OBJ_VAR_1
	ld de, Frameset_683fb
	call SetObjectFramesetPtr
	jp Func_3344

.State19:
	ld a, OBJSTATE_49
	ld [wCurObjState], a
	ld de, Frameset_683fb
	call SetObjectFramesetPtr
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.State49:
	ld a, [wDirection]
	and a
	jp nz, Func_3353
; change direction
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	jr .State18 ; useless jump

.State18:
	ld a, OBJSTATE_48
	ld [wCurObjState], a
	ld de, Frameset_683fb
	call SetObjectFramesetPtr
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.State48:
	ld a, [wDirection]
	and a
	jp z, Func_3362
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	jp .State19

.State12:
	ld hl, wCurObjAction
	ld a, 31 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_42
	ld [hld], a ; OBJ_STATE
	dec l
	xor a
	ld [hl], a ; OBJ_VAR_3
	ret

.FullThrowLeftStart:
	ld a, OBJSTATE_FULL_THROW_LEFT
	ld [wCurObjState], a
	ld de, Frameset_68421
	call SetObjectFramesetPtr
	jp ObjState_FullThrowLeft

.FullThrowRightStart:
	ld a, OBJSTATE_FULL_THROW_RIGHT
	ld [wCurObjState], a
	ld de, Frameset_68418
	call SetObjectFramesetPtr
	jp ObjState_FullThrowRight

.State28:
	ld de, Frameset_6842d
	call SetObjectFramesetPtr
	ld a, HIGH(Func_33f8)
	ld c, LOW(Func_33f8)
	ld b, $02
	jr .asm_4a3af

.State29:
	ld de, Frameset_6842a
	call SetObjectFramesetPtr
	ld a, HIGH(Func_3407)
	ld c, LOW(Func_3407)
	ld b, $02
	jr .asm_4a3af

.AttackedRightStart:
	ld de, Frameset_6842d
	call SetObjectFramesetPtr
	ld a, HIGH(Func_3317)
	ld c, LOW(Func_3317)
	ld b, $02
	jr .asm_4a3af

.AttackedLeftStart:
	ld de, Frameset_6842a
	call SetObjectFramesetPtr
	ld a, HIGH(Func_3326)
	ld c, LOW(Func_3326)
	ld b, $02
.asm_4a3af
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld [hld], a
	ld [hl], c
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	ld [hld], a
	xor a
	ld [hld], a ; OBJ_VAR_3
	ld [hl], b ; OBJ_VAR_2
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret
; 0x4a3c2

HebariiProjectileFunc: ; 4a3c2 (12:63c2)
	ld hl, wCurObjFlags
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld a, 100
	ld [hl], a
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	sub b
	cp $18
	jr c, .straight_down
	cp $e8
	jr nc, .straight_down
	cp $80
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.MoveWithLateral)
	ld [hld], a
	ld a, LOW(.MoveWithLateral)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	jr nc, .set_right
; set left
	res OBJSUBFLAG_HDIR_F, [hl]
	ret
.set_right
	set OBJSUBFLAG_HDIR_F, [hl]
	ret
.straight_down
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.MoveWithoutLateral)
	ld [hld], a
	ld a, LOW(.MoveWithoutLateral)
	ld [hld], a
	ret

.MoveWithLateral:
	ld a, [wCurObjSubState]
	rlca
	jr c, .move_right
; move left
	call MoveObjectLeft_Slow
	jr .MoveWithoutLateral
.move_right
	call MoveObjectRight_Slow

.MoveWithoutLateral:
	call MoveObjectDown_Slow

	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .set_destroy
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
	ld de, Frameset_6840d
	call SetObjectFramesetPtr
	ld a, $18
	ld [hli], a
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
; 0x4a45d
