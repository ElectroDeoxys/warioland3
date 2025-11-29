SpearheadFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Init)
	ld [hld], a
	ld a, LOW(.Init)
	ld [hld], a
	xor a
	ld [wCurObjVar1], a
	ret

.Init:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, [wDayNight]
	rra
	jp c, .SleepStart ; night
	jp .Default ; day

.Update:
	ld a, [wCurObjState]
	jumptable

	dw .Default ; OBJSTATE_00
	dw .Land ; OBJSTATE_LAND
	dw .BumpLeftStart ; OBJSTATE_BUMP_LEFT_START
	dw .BumpRightStart ; OBJSTATE_BUMP_RIGHT_START
	dw .AttackedLeftStart ; OBJSTATE_ATTACKED_LEFT_START
	dw .AttackedRightStart ; OBJSTATE_ATTACKED_RIGHT_START
	dw .PickedUpLeftStart ; OBJSTATE_PICKED_UP_LEFT_START
	dw .PickedUpRightStart ; OBJSTATE_PICKED_UP_RIGHT_START
	dw .WobbleLeftStart ; OBJSTATE_WOBBLE_LEFT_START
	dw .WobbleRightStart ; OBJSTATE_WOBBLE_RIGHT_START
	dw VanishObject2 ; OBJSTATE_VANISH_TOUCH
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
	dw .Default ; OBJSTATE_ACTIVATE
	dw .Default ; OBJSTATE_2B
	dw .Default ; OBJSTATE_2C
	dw .Sleep ; OBJSTATE_SPECIAL_1
	dw .Angry ; OBJSTATE_SPECIAL_2
	dw .WakeUp ; OBJSTATE_SPECIAL_3
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
	dw .State3b ; OBJSTATE_3B
	dw .State3c ; OBJSTATE_3C
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
	dw Func_33f8 ; OBJSTATE_58
	dw Func_3407 ; OBJSTATE_59
	dw .Default ; OBJSTATE_5A
	dw .Default ; OBJSTATE_5B
	dw .Default ; OBJSTATE_5C
	dw .Default ; OBJSTATE_5D
	dw ObjState_FullThrowLeft ; OBJSTATE_FULL_THROW_LEFT
	dw ObjState_FullThrowRight ; OBJSTATE_FULL_THROW_RIGHT

.FullThrowLeftStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_FULL_THROW_LEFT
	ld [hld], a
	ld a, [hld] ; OBJ_SUBSTATE
	rlca
	jr c, .asm_40140
	ld de, Frameset_68292
	call SetObjectFramesetPtr
	jp ObjState_FullThrowLeft
.asm_40140
	ld de, Frameset_6829b
	call SetObjectFramesetPtr
	jp ObjState_FullThrowLeft

.FullThrowRightStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_FULL_THROW_RIGHT
	ld [hld], a
	ld a, [hld] ; OBJ_SUBSTATE
	rlca
	jr c, .asm_4015c
	ld de, Frameset_68292
	call SetObjectFramesetPtr
	jp ObjState_FullThrowRight
.asm_4015c
	ld de, Frameset_6829b
	call SetObjectFramesetPtr
	jp ObjState_FullThrowRight

.SleepStart:
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a

	ld l, OBJ_STATE
	ld a, OBJSTATE_SPECIAL_1
	ld [hld], a

	ld de, Frameset_68234
	call SetObjectFramesetPtr

	ld l, OBJ_COLLBOX_RIGHT
	ld a, 5
	ld [hld], a
	ld a, -6
	ld [hld], a ; OBJ_COLLBOX_LEFT
	ret

.Sleep:
	ld hl, wCurObjSubState
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .on_left1
; on right
	set OBJSUBFLAG_HDIR_F, [hl]
	jr .asm_40199
.on_left1
	res OBJSUBFLAG_HDIR_F, [hl]
.asm_40199
	ld c, $2a
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp 32
	jr c, .asm_401ad
	cp -32
	jr c, .check_shake
.asm_401ad
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
	cp -32
	jr nc, .wake_up
	cp 32
	jr c, .wake_up

.check_shake
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .no_shake1
	ldh a, [rDIV]
	rra
	ld a, OBJSTATE_WOBBLE_LEFT_START >> 1
	rla ; either OBJSTATE_WOBBLE_LEFT_START or OBJSTATE_WOBBLE_RIGHT_START
	ld [wCurObjState], a
	ret

.no_shake1
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
	jr nz, .has_ground1
	ld a, OBJSTATE_STANDING_FALL_START
	ld [wCurObjState], a
	ret

.has_ground1
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ret

.wake_up
	ld a, [hli] ; OBJ_SUBSTATE
	rlca
	ld a, OBJSTATE_SPECIAL_3
	ld [hl], a ; OBJ_STATE
	jr c, .asm_40201
	ld de, Frameset_6827c
	jr .asm_4020c
.asm_40201
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 9
	ld [hld], a
	ld a, -7
	ld [hld], a ; OBJ_COLLBOX_LEFT
	ld de, Frameset_68287
.asm_4020c
	call SetObjectFramesetPtr
	ld a, 32
	ld [hli], a ; OBJ_STATE_DURATION
	ret

.WakeUp:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	jp .TurnAroundStart

.Default:
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a

	ld l, OBJ_STATE
	ld a, OBJSTATE_FALL
	ld [hld], a

	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .on_left2
; on right
	res OBJSUBFLAG_HDIR_F, [hl] ; OBJ_SUBSTATE
	dec l
	xor a
	ld [hld], a ; OBJ_VAR_3

	ld l, OBJ_COLLBOX_RIGHT
	ld a, 6
	ld [hld], a
	ld a, -10
	ld [hld], a ; OBJ_COLLBOX_LEFT

	ld de, Frameset_681d2
	jp SetObjectFramesetPtr

.on_left2
	set OBJSUBFLAG_HDIR_F, [hl] ; OBJ_SUBSTATE
	dec l
	xor a
	ld [hld], a ; OBJ_VAR_3

	ld l, OBJ_COLLBOX_RIGHT
	ld a, 9
	ld [hld], a
	ld a, -7
	ld [hld], a ; OBJ_COLLBOX_LEFT

	ld de, Frameset_681db
	jp SetObjectFramesetPtr

.StandingFallStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_STANDING_FALL
	ld [hld], a
	ld a, [hld] ; OBJ_SUBSTATE
	rlca
	jr c, .asm_40270
	xor a
	ld [hld], a ; OBJ_VAR_3
	ld de, Frameset_681d2
	call SetObjectFramesetPtr
	ret
.asm_40270
	xor a
	ld [hld], a ; OBJ_VAR_3
	ld de, Frameset_681db
	call SetObjectFramesetPtr
	ret

.LandWithSting:
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_FRONT_STING
	ld [hld], a
	ld l, OBJ_STATE
	ld a, OBJSTATE_SPECIAL_2
	ld [hld], a
	ld a, [hld] ; OBJ_SUBSTATE
	rlca
	jr c, .asm_40298
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 6
	ld [hld], a
	ld a, -10
	ld [hld], a
	ld de, Frameset_68208
	jr .asm_402a3
.asm_40298
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 9
	ld [hld], a
	ld a, -7
	ld [hld], a
	ld de, Frameset_68213
.asm_402a3
	call SetObjectFramesetPtr

	ld a, 32
	ld [hli], a ; OBJ_STATE_DURATION
	ret

.Angry:
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
	inc l
	xor a
	ld [hl], a ; OBJ_VAR_1
	ld l, OBJ_STATE
	ld a, OBJSTATE_WALK
	ld [hld], a
	ld a, [hld] ; OBJ_SUBSTATE
	rlca
	ld_obj_frameset Frameset_681d2, Frameset_681db
	call SetObjectFramesetPtr
	ret

.Land:
	ld a, [wCurObjVar1]
	inc a
	jr z, .LandWithSting
; without sting
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ld l, OBJ_STATE
	ld a, OBJSTATE_WALK
	ld [hld], a
	ld a, [hld] ; OBJ_SUBSTATE
	rlca
	jr c, .asm_402fd
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 6
	ld [hld], a
	ld a, -10
	ld [hld], a
	ld de, Frameset_681d2
	jr .asm_40308
.asm_402fd
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 9
	ld [hld], a
	ld a, -7
	ld [hld], a
	ld de, Frameset_681db
.asm_40308
	call SetObjectFramesetPtr

	ld a, 10
	ld [hli], a ; OBJ_STATE_DURATION
	ret

.Walk:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .no_shake3
	ldh a, [rDIV]
	rra
	ld a, OBJSTATE_WOBBLE_LEFT_START >> 1
	rla ; either OBJSTATE_WOBBLE_LEFT_START or OBJSTATE_WOBBLE_RIGHT_START
	ld [wCurObjState], a
	ret

.no_shake3
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .has_sting
	dec [hl]
	ret nz
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_FRONT_STING
	ld [hld], a
	ret

.has_sting
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
	jr nz, .has_ground
	ld a, OBJSTATE_STANDING_FALL_START
	ld [wCurObjState], a
	ret

.has_ground
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .go_right

; go left
	ld a, [hl] ; x lo
	and $f
	sub 10
	jr nc, .asm_4036a
	call ProcessBlockOnLeft
	and $f
	jr z, .turn_around1
.asm_4036a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	sub 10
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectLeft_Slow
.turn_around1
	ld a, OBJSTATE_TURN_AROUND_START
	ld [wCurObjState], a
	ret

.go_right
	ld a, [hl] ; x lo
	and $f
	add 9
	cp 16
	jr c, .asm_4039e
	call ProcessBlockOnRight
	and $f
	jr z, .turn_around2
.asm_4039e
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	add 9
	ldh [hXPosLo], a
	ld a, [hli]
	adc 0
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectRight_Slow
.turn_around2
	ld a, OBJSTATE_TURN_AROUND_START
	ld [wCurObjState], a
	ret

.BumpLeftStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_BUMP_LEFT
	ld [hld], a
	ld a, [hld] ; OBJ_SUBSTATE
	rlca
	jr c, .asm_403d1
	ld de, Frameset_6826e
	jr .asm_403e8
.asm_403d1
	ld de, Frameset_681f6
	jr .asm_403e8

.BumpRightStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_BUMP_RIGHT
	ld [hld], a
	ld a, [hld] ; OBJ_SUBSTATE
	rlca
	ld_obj_frameset Frameset_681ff, Frameset_68265
.asm_403e8
	call SetObjectFramesetPtr

	ld a, 12
	ld [hld], a ; OBJ_VAR_3
	ld a, $02
	ld [wCurObjVar2], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 5
	ld [hld], a
	ld a, -6
	ld [hld], a ; OBJ_COLLBOX_LEFT
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ret

.StunLeftStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_STUN_LEFT
	ld [hld], a
	ld a, [hld] ; OBJ_SUBSTATE
	rlca
	ld_obj_frameset Frameset_681e4, Frameset_681ed
	call SetObjectFramesetPtr

	ld l, OBJ_COLLBOX_RIGHT
	ld a, 5
	ld [hld], a
	ld a, -6
	ld [hld], a ; OBJ_COLLBOX_LEFT
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
	ld a, OBJSTATE_0F
	ld [wCurObjState], a
	ret

.StunRightStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_STUN_RIGHT
	ld [hld], a
	ld a, [hld] ; OBJ_SUBSTATE
	rlca
	ld_obj_frameset Frameset_681e4, Frameset_681ed
	call SetObjectFramesetPtr

	ld l, OBJ_COLLBOX_RIGHT
	ld a, 5
	ld [hld], a
	ld a, -6
	ld [hld], a ; OBJ_COLLBOX_LEFT
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
	ld a, OBJSTATE_0F
	ld [wCurObjState], a
	ret

.State14:
	ld hl, wCurObjState
	ld a, OBJSTATE_44
	ld [hld], a
	jr .Func_40478
.State15:
	ld hl, wCurObjState
	ld a, OBJSTATE_45
	ld [hld], a
.Func_40478:
	ld a, [hld] ; OBJ_SUBSTATE
	rlca
	jr c, .asm_40484
	ld de, Frameset_681e4
	call SetObjectFramesetPtr
	jr .asm_4048a
.asm_40484
	ld de, Frameset_681ed
	call SetObjectFramesetPtr
.asm_4048a
	inc l
	inc l
	ld a, $02
	ld [hli], a ; OBJ_VAR_2
	xor a
	ld [hli], a ; OBJ_VAR_3
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 5
	ld [hld], a
	ld a, -6
	ld [hld], a ; OBJ_COLLBOX_LEFT
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
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .no_shake4
	ld a, OBJSTATE_1C
	ld [wCurObjState], a
	ret
.no_shake4
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
	ld a, $ff
	ld [wCurObjVar1], a
	ret

.TurnAroundStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_TURN_AROUND
	ld [hld], a
	ld a, [hld] ; OBJ_SUBSTATE
	rlca
	jr c, .asm_404fd
	ld de, Frameset_6824f
	call SetObjectFramesetPtr
	jr .asm_40503
.asm_404fd
	ld de, Frameset_6825a
	call SetObjectFramesetPtr
.asm_40503
	ld a, 48
	ld [hli], a ; OBJ_STATE_DURATION
	ld a, $1c
	ld [hl], a ; OBJ_VAR_1
	ret

.TurnAround:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .no_shake5
	ldh a, [rDIV]
	rra
	ld a, OBJSTATE_WOBBLE_LEFT_START >> 1
	rla
	ld [wCurObjState], a ; either OBJSTATE_WOBBLE_LEFT_START or OBJSTATE_WOBBLE_RIGHT_START
	ret

.no_shake5
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_4054e
	dec [hl]
	jp nz, Func_3308
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 5
	ld [hld], a
	ld a, -6
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_40545
	ld de, Frameset_6821e
	call SetObjectFramesetPtr
	jp Func_3308
.asm_40545
	ld de, Frameset_68229
	call SetObjectFramesetPtr
	jp Func_3308

.asm_4054e
	inc l
	dec [hl] ; OBJ_VAR_1
	jp nz, Func_3308
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_40562
	ld hl, wCurObjState
	ld a, OBJSTATE_LAND
	ld [hld], a
	set OBJSUBFLAG_HDIR_F, [hl] ; OBJ_SUBSTATE
	ret
.asm_40562
	ld hl, wCurObjState
	ld a, OBJSTATE_LAND
	ld [hld], a
	res OBJSUBFLAG_HDIR_F, [hl] ; OBJ_SUBSTATE
	ret

.WobbleLeftStart:
	ld hl, wCurObjAction
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_WOBBLE_LEFT
	jr .Func_4057d
.WobbleRightStart:
	ld hl, wCurObjAction
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_WOBBLE_RIGHT
.Func_4057d:
	ld [hld], a ; OBJ_STATE
	ld a, [hld] ; OBJ_SUBSTATE
	rlca
	jr c, .asm_4058a
	ld de, Frameset_681e4
	call SetObjectFramesetPtr
	jr .asm_40590
.asm_4058a
	ld de, Frameset_681ed
	call SetObjectFramesetPtr

.asm_40590
	ld a, 4
	ld [hli], a ; OBJ_STATE_DURATION
	inc l
	ld a, $02
	ld [hli], a ; OBJ_VAR_2
	xor a
	ld [hli], a ; OBJ_VAR_3
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 5
	ld [hld], a
	ld a, -6
	ld [hld], a ; OBJ_COLLBOX_LEFT
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00 ; unnecessary
	ld [hld], a
	ret

.State0b:
	ld a, OBJSTATE_3B
	ld [wCurObjState], a
	jr .Func_405b6
.State0c:
	ld a, OBJSTATE_3C
	ld [wCurObjState], a
.Func_405b6:
	ld hl, wCurObjFrameDuration
	xor a
	ld [hli], a
	ld [hli], a ; OBJ_FRAMESET_OFFSET
	ld a, $02
	ld [wCurObjVar2], a
	ret

.State3b:
	ld hl, wCurObjFrameDuration
	xor a
	ld [hli], a
	ld [hli], a
	ld l, OBJ_VAR_2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, OBJSTATE_TURN_AROUND_START
	ld [wCurObjState], a
	ret

.State3c:
	ld hl, wCurObjFrameDuration
	xor a
	ld [hli], a
	ld [hli], a
	ld l, OBJ_VAR_2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, OBJSTATE_TURN_AROUND_START
	ld [wCurObjState], a
	ret

.State29:
	ld hl, wCurObjState
	ld a, OBJSTATE_59
	ld [hld], a
	ld b, $02
	jr .asm_4060e

.State28:
	ld hl, wCurObjState
	ld a, OBJSTATE_58
	ld [hld], a
	ld b, $02
	jr .asm_4060e

.AttackedLeftStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_ATTACKED_LEFT
	ld [hld], a
	ld b, $02
	jr .asm_4060e

.AttackedRightStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_ATTACKED_RIGHT
	ld [hld], a
	ld b, $02

.asm_4060e
	ld a, [hl] ; OBJ_SUBSTATE
	and OBJSUBFLAGS_MASK
	ld [hld], a
	xor a
	ld [hld], a ; OBJ_VAR_3
	ld [hl], b ; OBJ_VAR_2
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld de, Frameset_68277
	jp SetObjectFramesetPtr

.PickedUpLeftStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_PICKED_UP_LEFT
	ld [hld], a
	dec l
	ld a, HIGH(Data_601c0)
	ld [hld], a ; OBJ_VAR_3
	ld a, LOW(Data_601c0)
	ld [hld], a ; OBJ_VAR_2
	ld a, $01
	ld [hld], a ; OBJ_VAR_1
	jp Func_3335

.PickedUpRightStart:
	ld hl, wCurObjState
	ld a, OBJSTATE_PICKED_UP_RIGHT
	ld [hld], a
	dec l
	ld a, HIGH(Data_601e0)
	ld [hld], a
	ld a, LOW(Data_601e0)
	ld [hld], a
	ld a, $01
	ld [hld], a
	jp Func_3344

.State19:
	ld hl, wCurObjState
	ld a, OBJSTATE_49
	ld [hld], a
	ld a, [hld] ; OBJ_SUBSTATE
	rlca
	jr c, .asm_40658
	ld de, Frameset_681e4
	call SetObjectFramesetPtr
	jr .asm_4065e
.asm_40658
	ld de, Frameset_681ed
	call SetObjectFramesetPtr

.asm_4065e
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 5
	ld [hld], a
	ld a, -6
	ld [hld], a ; OBJ_COLLBOX_LEFT
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
	ld a, [hld] ; OBJ_SUBSTATE
	rlca
	jr c, .asm_4068c
	ld de, Frameset_681e4
	call SetObjectFramesetPtr
	jr .asm_40692
.asm_4068c
	ld de, Frameset_681ed
	call SetObjectFramesetPtr

.asm_40692
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 5
	ld [hld], a
	ld a, -6
	ld [hld], a ; OBJ_COLLBOX_LEFT
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
