CountRichtertoffenFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 7
	ld [hld], a
	ld a, -8
	ld [hld], a ; OBJ_COLLBOX_LEFT
	ld a, -4
	ld [hl], a ; OBJ_COLLBOX_BOTTOM
	jp .Default

.Update:
	ld a, [wCurObjState]
	jumptable

	dw .Default ; OBJSTATE_00
	dw .Land ; OBJSTATE_LAND
	dw .Bump ; OBJSTATE_BUMP_LEFT_START
	dw .Bump ; OBJSTATE_BUMP_RIGHT_START
	dw .AttackedLeftStart ; OBJSTATE_ATTACKED_LEFT_START
	dw .AttackedRightStart ; OBJSTATE_ATTACKED_RIGHT_START
	dw .PickedUpLeftStart ; OBJSTATE_PICKED_UP_LEFT_START
	dw .PickedUpRightStart ; OBJSTATE_PICKED_UP_RIGHT_START
	dw .WobbleLeftStart ; OBJSTATE_WOBBLE_LEFT_START
	dw .WobbleRightStart ; OBJSTATE_WOBBLE_RIGHT_START
	dw .VanishTouch ; OBJSTATE_VANISH_TOUCH
	dw .State0b ; OBJSTATE_0B
	dw .State0c ; OBJSTATE_0C
	dw .Default ; OBJSTATE_0D
	dw .Default ; OBJSTATE_0E
	dw .State0f ; OBJSTATE_0F
	dw .State10 ; OBJSTATE_10
	dw .StandingFallStart ; OBJSTATE_STANDING_FALL_START
	dw .State12 ; OBJSTATE_12
	dw .TurnAroundStart ; OBJSTATE_TURN_AROUND_START
	dw .State14 ; OBJSTATE_14
	dw .State15 ; OBJSTATE_15
	dw .StunLeftStart ; OBJSTATE_STUN_LEFT_START
	dw .StunRightStart ; OBJSTATE_STUN_RIGHT_START
	dw .State18 ; OBJSTATE_18
	dw .State19 ; OBJSTATE_19
	dw Func_3263 ; OBJSTATE_1A
	dw Func_3272 ; OBJSTATE_1B
	dw Func_3281 ; OBJSTATE_1C
	dw .Default ; OBJSTATE_1D
	dw .Default ; OBJSTATE_1E
	dw .Default ; OBJSTATE_1F
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
	dw .Flatten ; OBJSTATE_ACTIVATE
	dw .Default ; OBJSTATE_2B
	dw .Default ; OBJSTATE_2C
	dw .JumpRise ; OBJSTATE_SPECIAL_1
	dw .JumpFall ; OBJSTATE_SPECIAL_2
	dw .FallBounce ; OBJSTATE_SPECIAL_3
	dw ObjState_Fall ; OBJSTATE_FALL
	dw .Walk ; OBJSTATE_WALK
	dw ObjState_BumpLeft ; OBJSTATE_BUMP_LEFT
	dw ObjState_BumpRight ; OBJSTATE_BUMP_RIGHT
	dw Func_3326 ; OBJSTATE_ATTACKED_LEFT
	dw Func_3317 ; OBJSTATE_ATTACKED_RIGHT
	dw Func_3335 ; OBJSTATE_PICKED_UP_LEFT
	dw Func_3344 ; OBJSTATE_PICKED_UP_RIGHT
	dw Func_31fa ; OBJSTATE_WOBBLE_LEFT
	dw Func_31dc ; OBJSTATE_WOBBLE_RIGHT
	dw .Default ; OBJSTATE_3A
	dw .Default ; OBJSTATE_3B
	dw .Default ; OBJSTATE_3C
	dw .Default ; OBJSTATE_3D
	dw .Default ; OBJSTATE_3E
	dw .State3f ; OBJSTATE_3F
	dw .State40 ; OBJSTATE_40
	dw ObjState_StandingFall ; OBJSTATE_STANDING_FALL
	dw Func_3371 ; OBJSTATE_42
	dw .TurnAround ; OBJSTATE_TURN_AROUND
	dw Func_32cc ; OBJSTATE_44
	dw Func_32db ; OBJSTATE_45
	dw .StunLeft ; OBJSTATE_STUN_LEFT
	dw .StunRight ; OBJSTATE_STUN_RIGHT
	dw .State48 ; OBJSTATE_48
	dw .State49 ; OBJSTATE_49
	dw Func_3380 ; OBJSTATE_4A
	dw Func_338f ; OBJSTATE_4B
	dw ObjState_FullThrowLeft ; OBJSTATE_FULL_THROW_LEFT_START
	dw ObjState_FullThrowRight ; OBJSTATE_FULL_THROW_RIGHT_START
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
	dw Func_33f8 ; OBJSTATE_58
	dw Func_3407 ; OBJSTATE_59
	dw .State5a ; OBJSTATE_5A
	dw .Default ; OBJSTATE_5B
	dw .Default ; OBJSTATE_5C

.VanishTouch:
	ld a, [wCurObjAction]
	and a
	jp z, VanishObject2
	ld a, [wTransformation]
	and a
	jp nz, VanishObject2
	ld a, [wEffectivePowerUp]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp nc, VanishObject2
	ld a, [wCurObjInteractionType]
	and INTERACTION_MASK
	jp z, VanishObject2
	play_sfx SFX_014
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jp nc, .WobbleLeftStart
	jp .WobbleRightStart

.State0b:
	ld hl, wCurObjSubState
	set OBJSUBFLAG_HDIR_F, [hl]
	jp .asm_41044

.State0c:
	ld hl, wCurObjSubState
	res OBJSUBFLAG_HDIR_F, [hl]
	jp .asm_41044

.Flatten:
	ld de, Frameset_683d4
	call SetObjectFramesetPtr
	ld a, 20
	ld [hli], a ; OBJ_STATE_DURATION
	ld l, OBJ_STATE
	ld a, OBJSTATE_5A
	ld [hld], a
	ld l, OBJ_Y_POS
	ld a, [wWarioYPos + 1]
	sub 8
	ld [hli], a
	ld a, [wWarioYPos + 0]
	sbc 0
	ld [hli], a
	ret

.State5a:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp 20
	jr nz, .asm_40f72
	ld a, [wAutoMoveState]
	and a
	jp nz, MoveObjectDown_Fast
	ld hl, wCurObjYPos
	ld a, [wWarioYPos + 1]
	sub 8
	ld [hli], a
	ld a, [wWarioYPos + 0]
	sbc 0
	ld [hli], a
.asm_40f72
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld a, NO_ACTIONS_FOR 31
	ld [wCurObjAction], a
	jp .asm_40fe9

.Default:
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_RICHTERTOFFEN
	ld [hld], a
	ld l, OBJ_STATE
	ld a, OBJSTATE_FALL
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_VAR_3
	ld de, Frameset_683e1
	call SetObjectFramesetPtr
	ret

.StandingFallStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_STANDING_FALL
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_VAR_3
	ld de, Frameset_683de
	call SetObjectFramesetPtr
	ret

.Land:
	ld a, [wCurObjFlags]
	and OBJFLAG_ACTIVE | OBJFLAG_ON_SCREEN
	cp OBJFLAG_ACTIVE | OBJFLAG_ON_SCREEN
	ret nz
	ld hl, wCurObjState
	ld a, OBJSTATE_WALK
	ld [hld], a
	ld de, Frameset_683bc
	call SetObjectFramesetPtr
	ld a, 44
	ld [hli], a ; OBJ_STATE_DURATION
	ret

.Walk:
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_40fe9
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
	jr nz, .asm_40fdf
	ld a, OBJSTATE_STANDING_FALL_START
	ld [wCurObjState], a
	ret

.asm_40fdf
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ret

.asm_40fe9
	ld l, OBJ_STATE
	ld a, OBJSTATE_SPECIAL_1
	ld [hld], a
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jr nz, .asm_40ffa
	ld a, [hl] ; OBJ_SUBSTATE
	rlca
	ccf
	jr .asm_41006
.asm_40ffa
	ld c, $2a
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
.asm_41006
	jr c, .asm_41012
	res OBJSUBFLAG_HDIR_F, [hl] ; OBJ_SUBSTATE
	ld de, Frameset_683c1
	call SetObjectFramesetPtr
	jr .asm_4101a
.asm_41012
	set OBJSUBFLAG_HDIR_F, [hl] ; OBJ_SUBSTATE
	ld de, Frameset_683c4
	call SetObjectFramesetPtr
.asm_4101a
	ld a, 22
	ld [hli], a ; OBJ_STATE_DURATION
	ld l, OBJ_VAR_3
	xor a
	ld [hld], a
	play_sfx SFX_066
	ret

.Bump:
	ld hl, wCurObjState
	ld a, OBJSTATE_SPECIAL_1
	ld [hld], a
	ld c, $2a
	ld a, [wCurObjScreenXPos]
	add c
	ld b, a
	ld a, [wWarioScreenXPos]
	add c
	sub b
	jr .asm_41006

.JumpRise:
	ld hl, wCurObjStateDuration
	dec [hl]
	jr nz, .asm_41053

.asm_41044
	ld de, Frameset_683c7
	call SetObjectFramesetPtr
	ld l, OBJ_STATE
	ld a, OBJSTATE_SPECIAL_2
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_VAR_3
	ret

.asm_41053
	ld l, OBJ_Y_POS
	ld a, [hli]
	sub 18
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_358b
	and $0f
	jr z, .asm_4107a
	ld hl, wCurObjVar2
	ld a, $01
	ld [hl], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	jr .asm_41044

.asm_4107a
	ld bc, Data_603d0
	call ApplyObjYMovement
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 10
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .jump_right
; jump left
	ld a, [hli]
	sub 8
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jp z, MoveObjectLeft
	ld de, Frameset_683c4
	call SetObjectFramesetPtr
	ld l, OBJ_SUBSTATE
	set OBJSUBFLAG_HDIR_F, [hl]
	ret
.jump_right
	ld a, [hli]
	add 7
	ldh [hXPosLo], a
	ld a, [hli]
	adc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jp z, MoveObjectRight
	ld de, Frameset_683c1
	call SetObjectFramesetPtr
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_HDIR_F, [hl]
	ret

.JumpFall:
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
	jr z, .continue_fall

; fall bounce
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_STATE
	ld a, OBJSTATE_SPECIAL_3
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_683d4
	call SetObjectFramesetPtr
	ld a, 24
	ld [hli], a ; OBJ_STATE_DURATION
	play_sfx SFX_075
	ld b, 24
	jp DoGroundShake

.continue_fall
	ld a, [wc0dd]
	and a
	jp nz, VanishObject2
	ld bc, Data_603e0
	call ApplyObjYMovement
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 10
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .fall_right

; fall left
	ld a, [hli]
	sub 8
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jp z, MoveObjectLeft
	ld de, Frameset_683c4
	call SetObjectFramesetPtr
	ld l, OBJ_SUBSTATE
	set OBJSUBFLAG_HDIR_F, [hl]
	ret

.fall_right
	ld a, [hli]
	add 7
	ldh [hXPosLo], a
	ld a, [hli]
	adc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jp z, MoveObjectRight
	ld de, Frameset_683c1
	call SetObjectFramesetPtr
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_HDIR_F, [hl]
	ret

.FallBounce:
	ld a, [wCurObjVar3]
	cp 15
	jr z, .check_bounce_end
	cp 14
	jr z, .reset_bounce_animation
.do_bounce_movement
	ld bc, Data_604b0
	jp ApplyObjYMovement
.reset_bounce_animation
	ld de, Frameset_683e1
	call SetObjectFramesetPtr
	jr .do_bounce_movement
.check_bounce_end
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, OBJSTATE_LAND
	ld [wCurObjState], a
	ret

.StunLeftStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_STUN_LEFT
	ld [hld], a
	ld de, Frameset_683d9
	call SetObjectFramesetPtr
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
.StunLeft:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, OBJ_INTERACTION_RICHTERTOFFEN
	ld [wCurObjState], a
	ret

.StunRightStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_STUN_RIGHT
	ld [hld], a
	ld de, Frameset_683d9
	call SetObjectFramesetPtr
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
.StunRight:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, OBJ_INTERACTION_RICHTERTOFFEN
	ld [wCurObjState], a
	ret

.State14:
	ld hl, wCurObjState
	ld a, OBJSTATE_44
	ld [hld], a
	jr .asm_411d9
.State15:
	ld hl, wCurObjState
	ld a, OBJSTATE_45
	ld [hld], a
.asm_411d9
	ld de, Frameset_683d9
	call SetObjectFramesetPtr
	inc l
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

.State0f:
	ld a, OBJSTATE_3F
	ld [wCurObjState], a
	ld a, 100
	ld [wCurObjStateDuration], a
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
.State3f:
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_32ea
	ld a, OBJSTATE_10
	ld [wCurObjState], a
	ret

.State10:
	ld hl, wCurObjState
	ld a, OBJSTATE_40
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_VAR_3
	ld a, 7
	ld [wCurObjStateDuration], a
.State40:
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_32f9
	ld a, OBJSTATE_00
	ld [wCurObjState], a
	ret

.TurnAroundStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_TURN_AROUND
	ld [hld], a
	ld de, Frameset_683e1
	call SetObjectFramesetPtr
	ld a, 48
	ld [hli], a ; OBJ_STATE_DURATION
	ret

.TurnAround:
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_3308
	ld a, OBJ_INTERACTION_01
	ld [wCurObjState], a
	ret

.WobbleLeftStart:
	ld hl, wCurObjAction
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_WOBBLE_LEFT
	jr .asm_41255
.WobbleRightStart:
	ld hl, wCurObjAction
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_WOBBLE_RIGHT
.asm_41255
	ld [hld], a ; OBJ_STATE
	ld de, Frameset_683d9
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

.State29:
	ld hl, wCurObjState
	ld a, OBJSTATE_59
	ld [hld], a
	ld b, $02
	jr .asm_412a4
.State28:
	ld hl, wCurObjState
	ld a, OBJSTATE_58
	ld [hld], a
	ld b, $02
	jr .asm_412a4

.AttackedLeftStart:
	ld a, [wTransformation]
	and a
	jr nz, .asm_4129c
	ld a, [wEffectivePowerUp]
	cp GARLIC
	jr nc, .asm_4129c
	ld a, [wCurObjInteractionType]
	and INTERACTION_MASK
	jr z, .asm_4129c
	ld a, OBJSTATE_WOBBLE_LEFT_START
	ld [wCurObjState], a
	ret
.asm_4129c
	ld hl, wCurObjState
	ld a, OBJSTATE_ATTACKED_LEFT
	ld [hld], a
	ld b, $01

.asm_412a4
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [hl] ; OBJ_SUBSTATE
	and OBJSUBFLAGS_MASK
	ld [hld], a
	xor a
	ld [hld], a ; OBJ_VAR_3
	ld a, b
	ld [hld], a ; OBJ_VAR_2
	ld de, Frameset_683ca
	jp SetObjectFramesetPtr

.AttackedRightStart:
	ld a, [wTransformation]
	and a
	jr nz, .asm_412d1
	ld a, [wEffectivePowerUp]
	cp GARLIC
	jr nc, .asm_412d1
	ld a, [wCurObjInteractionType]
	and INTERACTION_MASK
	jr z, .asm_412d1
	ld a, OBJSTATE_WOBBLE_RIGHT_START
	ld [wCurObjState], a
	ret
.asm_412d1
	ld hl, wCurObjState
	ld a, OBJSTATE_ATTACKED_RIGHT
	ld [hld], a
	ld b, $01
	jr .asm_412a4

.PickedUpLeftStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_PICKED_UP_LEFT
	ld [hld], a
	dec l
	ld a, $41
	ld [hld], a ; OBJ_VAR_3
	ld a, $d0
	ld [hld], a ; OBJ_VAR_2
	ld a, $01
	ld [hld], a ; OBJ_VAR_1
	jp Func_3335

.PickedUpRightStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_PICKED_UP_RIGHT
	ld [hld], a
	dec l
	ld a, $41
	ld [hld], a ; OBJ_VAR_3
	ld a, $f0
	ld [hld], a ; OBJ_VAR_2
	ld a, $01
	ld [hld], a ; OBJ_VAR_1
	jp Func_3344

.State19:
	ld hl, wCurObjState
	ld a, OBJSTATE_49
	ld [hld], a
	ld de, Frameset_683d9
	call SetObjectFramesetPtr
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.State49:
	ld a, [wDirection]
	and a
	jp nz, Func_3353
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	jr .State18 ; unnecessary jump
.State18:
	ld hl, wCurObjState
	ld a, OBJSTATE_48
	ld [hld], a
	ld de, Frameset_683d9
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
	ld [hld], a ; OBJ_VAR_3
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00 ; unnecessary
	ld [hld], a
	ret
