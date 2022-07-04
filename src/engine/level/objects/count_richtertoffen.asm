CountRichtertoffenFunc: ; 40e12 (10:4e12)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	ld l, OBJ_UNK_1A
	res 5, [hl]
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
	ld a, [wCurObjAction]
	jumptable

	dw .Default ; OBJACTION_00
	dw .Land ; OBJACTION_LAND
	dw .Bump ; OBJACTION_BUMP_LEFT_START
	dw .Bump ; OBJACTION_BUMP_RIGHT_START
	dw .Action04 ; OBJACTION_04
	dw .Action05 ; OBJACTION_05
	dw .GrabLeftStart ; OBJACTION_GRAB_LEFT_START
	dw .GrabRightStart ; OBJACTION_GRAB_RIGHT_START
	dw .Action08 ; OBJACTION_08
	dw .Action09 ; OBJACTION_09
	dw .Func_40eef ; OBJACTION_VANISH
	dw .Action0b ; OBJACTION_0B
	dw .Action0c ; OBJACTION_0C
	dw .Default ; OBJACTION_0D
	dw .Default ; OBJACTION_0E
	dw .Action0f ; OBJACTION_0F
	dw .Action10 ; OBJACTION_10
	dw .StandingFallStart ; OBJACTION_STANDING_FALL_START
	dw .Action12 ; OBJACTION_12
	dw .TurnAroundStart ; OBJACTION_TURN_AROUND_START
	dw .Action14 ; OBJACTION_14
	dw .Action15 ; OBJACTION_15
	dw .StunLeftStart ; OBJACTION_STUN_LEFT_START
	dw .StunRightStart ; OBJACTION_STUN_RIGHT_START
	dw .Action18 ; OBJACTION_18
	dw .Action19 ; OBJACTION_19
	dw Func_3263 ; OBJACTION_1A
	dw Func_3272 ; OBJACTION_1B
	dw Func_3281 ; OBJACTION_1C
	dw .Default ; OBJACTION_1D
	dw .Default ; OBJACTION_1E
	dw .Default ; OBJACTION_1F
	dw Func_3191 ; OBJACTION_20
	dw Func_31af ; OBJACTION_21
	dw Func_31cd ; OBJACTION_22
	dw Func_31eb ; OBJACTION_23
	dw Func_3209 ; OBJACTION_24
	dw Func_3227 ; OBJACTION_25
	dw Func_3245 ; OBJACTION_26
	dw Func_3254 ; OBJACTION_27
	dw .Action28 ; OBJACTION_28
	dw .Action29 ; OBJACTION_29
	dw .Action2a ; OBJACTION_2A
	dw .Default ; OBJACTION_2B
	dw .Default ; OBJACTION_2C
	dw .JumpRise ; OBJACTION_SPECIAL_1
	dw .JumpFall ; OBJACTION_SPECIAL_2
	dw .FallBounce ; OBJACTION_SPECIAL_3
	dw ObjAction_Fall ; OBJACTION_FALL
	dw .Walk ; OBJACTION_WALK
	dw ObjAction_BumpLeft ; OBJACTION_BUMP_LEFT
	dw ObjAction_BumpRight ; OBJACTION_BUMP_RIGHT
	dw Func_3326 ; OBJACTION_34
	dw Func_3317 ; OBJACTION_35
	dw Func_3335 ; OBJACTION_36
	dw Func_3344 ; OBJACTION_37
	dw Func_31fa ; OBJACTION_38
	dw Func_31dc ; OBJACTION_39
	dw .Default ; OBJACTION_3A
	dw .Default ; OBJACTION_3B
	dw .Default ; OBJACTION_3C
	dw .Default ; OBJACTION_3D
	dw .Default ; OBJACTION_3E
	dw .Action3f ; OBJACTION_3F
	dw .Action40 ; OBJACTION_40
	dw ObjAction_StandingFall ; OBJACTION_STANDING_FALL
	dw Func_3371 ; OBJACTION_42
	dw .TurnAround ; OBJACTION_TURN_AROUND
	dw Func_32cc ; OBJACTION_44
	dw Func_32db ; OBJACTION_45
	dw .StunLeft ; OBJACTION_STUN_LEFT
	dw .StunRight ; OBJACTION_STUN_RIGHT
	dw .Action48 ; OBJACTION_48
	dw .Action49 ; OBJACTION_49
	dw Func_3380 ; OBJACTION_4A
	dw Func_338f ; OBJACTION_4B
	dw ObjAction_FullThrowLeft ; OBJACTION_FULL_THROW_LEFT_START
	dw ObjAction_FullThrowRight ; OBJACTION_FULL_THROW_RIGHT_START
	dw Func_339e ; OBJACTION_4E
	dw Func_33ad ; OBJACTION_4F
	dw Func_31a0 ; OBJACTION_50
	dw Func_31be ; OBJACTION_51
	dw Func_31dc ; OBJACTION_52
	dw Func_31fa ; OBJACTION_53
	dw Func_3218 ; OBJACTION_54
	dw Func_3236 ; OBJACTION_55
	dw Func_32cc ; OBJACTION_56
	dw Func_32db ; OBJACTION_57
	dw Func_33f8 ; OBJACTION_58
	dw Func_3407 ; OBJACTION_59
	dw .Action5a ; OBJACTION_5A
	dw .Default ; OBJACTION_5B
	dw .Default ; OBJACTION_5C

.Func_40eef:
	ld a, [wCurObjUnk1c]
	and a
	jp z, ObjAction_Vanish2
	ld a, [wTransformation]
	and a
	jp nz, ObjAction_Vanish2
	ld a, [wEffectivePowerUp]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jp nc, ObjAction_Vanish2
	ld a, [wCurObjInteractionType]
	and INTERACTION_MASK
	jp z, ObjAction_Vanish2
	play_sfx SFX_014
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jp nc, .Action08
	jp .Action09

.Action0b:
	ld hl, wCurObjUnk1a
	set 7, [hl]
	jp .asm_41044

.Action0c:
	ld hl, wCurObjUnk1a
	res 7, [hl]
	jp .asm_41044

.Action2a:
	ld de, Frameset_683d4
	call SetObjectFramesetPtr
	ld a, 20
	ld [hli], a ; OBJ_ACTION_DURATION
	ld l, OBJ_ACTION
	ld a, OBJACTION_5A
	ld [hld], a
	ld l, OBJ_Y_POS
	ld a, [wYPosLo]
	sub 8
	ld [hli], a
	ld a, [wYPosHi]
	sbc 0
	ld [hli], a
	ret

.Action5a:
	ld hl, wCurObjActionDuration
	ld a, [hl]
	cp 20
	jr nz, .asm_40f72
	ld a, [wAutoMoveState]
	and a
	jp nz, MoveObjectDown_Fast
	ld hl, wCurObjYPos
	ld a, [wYPosLo]
	sub 8
	ld [hli], a
	ld a, [wYPosHi]
	sbc 0
	ld [hli], a
.asm_40f72
	ld l, OBJ_ACTION_DURATION
	dec [hl]
	ret nz
	ld a, 31 | (1 << 7)
	ld [wCurObjUnk1c], a
	jp .asm_40fe9

.Default:
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_0F
	ld [hld], a
	ld l, OBJ_ACTION
	ld a, OBJACTION_FALL
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld de, Frameset_683e1
	call SetObjectFramesetPtr
	ret

.StandingFallStart:
	ld hl, wCurObjAction
	ld a, OBJACTION_STANDING_FALL
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld de, Frameset_683de
	call SetObjectFramesetPtr
	ret

.Land:
	ld a, [wCurObjFlags]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	ret nz
	ld hl, wCurObjAction
	ld a, OBJACTION_WALK
	ld [hld], a
	ld de, Frameset_683bc
	call SetObjectFramesetPtr
	ld a, 44
	ld [hli], a ; OBJ_ACTION_DURATION
	ret

.Walk:
	ld hl, wCurObjActionDuration
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
	ld a, OBJACTION_STANDING_FALL_START
	ld [wCurObjAction], a
	ret

.asm_40fdf
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ret

.asm_40fe9
	ld l, OBJ_ACTION
	ld a, OBJACTION_SPECIAL_1
	ld [hld], a
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jr nz, .asm_40ffa
	ld a, [hl] ; OBJ_UNK_1A
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
	res 7, [hl] ; OBJ_UNK_1A
	ld de, Frameset_683c1
	call SetObjectFramesetPtr
	jr .asm_4101a
.asm_41012
	set 7, [hl] ; OBJ_UNK_1A
	ld de, Frameset_683c4
	call SetObjectFramesetPtr
.asm_4101a
	ld a, 22
	ld [hli], a ; OBJ_ACTION_DURATION
	ld l, OBJ_MOVEMENT_INDEX
	xor a
	ld [hld], a
	play_sfx SFX_066
	ret

.Bump:
	ld hl, wCurObjAction
	ld a, OBJACTION_SPECIAL_1
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
	ld hl, wCurObjActionDuration
	dec [hl]
	jr nz, .asm_41053

.asm_41044
	ld de, Frameset_683c7
	call SetObjectFramesetPtr
	ld l, OBJ_ACTION
	ld a, OBJACTION_SPECIAL_2
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
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
	ld hl, wCurObjUnk18
	ld a, $01
	ld [hl], a
	ld l, OBJ_UNK_1A
	ld a, [hl]
	xor $80
	ld [hl], a
	jr .asm_41044

.asm_4107a
	ld bc, Data_603d0
	call Func_34b7
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 10
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjUnk1a]
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
	ld l, OBJ_UNK_1A
	set 7, [hl]
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
	ld l, OBJ_UNK_1A
	res 7, [hl]
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
	ld l, OBJ_ACTION
	ld a, OBJACTION_SPECIAL_3
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_683d4
	call SetObjectFramesetPtr
	ld a, 24
	ld [hli], a ; OBJ_ACTION_DURATION
	play_sfx SFX_075
	ld b, 24
	jp DoGroundShake

.continue_fall
	ld a, [wc0dd]
	and a
	jp nz, ObjAction_Vanish2
	ld bc, Data_603e0
	call Func_34b7
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 10
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjUnk1a]
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
	ld l, OBJ_UNK_1A
	set 7, [hl]
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
	ld l, OBJ_UNK_1A
	res 7, [hl]
	ret

.FallBounce:
	ld a, [wCurObjMovementIndex]
	cp 15
	jr z, .check_bounce_end
	cp 14
	jr z, .reset_bounce_animation
.do_bounce_movement
	ld bc, Data_604b0
	jp Func_34b7
.reset_bounce_animation
	ld de, Frameset_683e1
	call SetObjectFramesetPtr
	jr .do_bounce_movement
.check_bounce_end
	ld hl, wCurObjActionDuration
	dec [hl]
	ret nz
	ld a, OBJACTION_LAND
	ld [wCurObjAction], a
	ret

.StunLeftStart:
	ld hl, wCurObjAction
	ld a, OBJACTION_STUN_LEFT
	ld [hld], a
	ld de, Frameset_683d9
	call SetObjectFramesetPtr
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
.StunLeft:
	ld hl, wCurObjUnk18
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, OBJ_INTERACTION_0F
	ld [wCurObjAction], a
	ret

.StunRightStart:
	ld hl, wCurObjAction
	ld a, OBJACTION_STUN_RIGHT
	ld [hld], a
	ld de, Frameset_683d9
	call SetObjectFramesetPtr
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
.StunRight:
	ld hl, wCurObjUnk18
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, OBJ_INTERACTION_0F
	ld [wCurObjAction], a
	ret

.Action14:
	ld hl, wCurObjAction
	ld a, OBJACTION_44
	ld [hld], a
	jr .asm_411d9
.Action15:
	ld hl, wCurObjAction
	ld a, OBJACTION_45
	ld [hld], a
.asm_411d9
	ld de, Frameset_683d9
	call SetObjectFramesetPtr
	inc l
	inc l
	ld a, $02
	ld [hli], a ; OBJ_UNK_18
	xor a
	ld [hli], a ; OBJ_MOVEMENT_INDEX
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
	ret

.Action0f:
	ld a, OBJACTION_3F
	ld [wCurObjAction], a
	ld a, 100
	ld [wCurObjActionDuration], a
	ld hl, wCurObjFlags
	res OBJFLAG_UNK2_F, [hl]
.Action3f:
	ld hl, wCurObjActionDuration
	dec [hl]
	jp nz, Func_32ea
	ld a, OBJACTION_10
	ld [wCurObjAction], a
	ret

.Action10:
	ld hl, wCurObjAction
	ld a, OBJACTION_40
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld a, 7
	ld [wCurObjActionDuration], a
.Action40:
	ld hl, wCurObjActionDuration
	dec [hl]
	jp nz, Func_32f9
	ld a, OBJACTION_00
	ld [wCurObjAction], a
	ret

.TurnAroundStart:
	ld hl, wCurObjAction
	ld a, OBJACTION_TURN_AROUND
	ld [hld], a
	ld de, Frameset_683e1
	call SetObjectFramesetPtr
	ld a, 48
	ld [hli], a ; OBJ_ACTION_DURATION
	ret

.TurnAround:
	ld hl, wCurObjActionDuration
	dec [hl]
	jp nz, Func_3308
	ld a, OBJ_INTERACTION_01
	ld [wCurObjAction], a
	ret

.Action08:
	ld hl, wCurObjUnk1c
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJACTION_38
	jr .asm_41255
.Action09:
	ld hl, wCurObjUnk1c
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJACTION_39
.asm_41255
	ld [hld], a ; OBJ_ACTION
	ld de, Frameset_683d9
	call SetObjectFramesetPtr
	ld a, 4
	ld [hli], a ; OBJ_ACTION_DURATION
	inc l
	ld a, $02
	ld [hli], a ; OBJ_UNK_18
	xor a
	ld [hli], a ; OBJ_MOVEMENT_INDEX
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
	ret

.Action29:
	ld hl, wCurObjAction
	ld a, OBJACTION_59
	ld [hld], a
	ld b, $02
	jr .asm_412a4
.Action28:
	ld hl, wCurObjAction
	ld a, OBJACTION_58
	ld [hld], a
	ld b, $02
	jr .asm_412a4
.Action04:
	ld a, [wTransformation]
	and a
	jr nz, .asm_4129c
	ld a, [wEffectivePowerUp]
	cp POWER_UP_GARLIC
	jr nc, .asm_4129c
	ld a, [wCurObjInteractionType]
	and INTERACTION_MASK
	jr z, .asm_4129c
	ld a, OBJACTION_08
	ld [wCurObjAction], a
	ret
.asm_4129c
	ld hl, wCurObjAction
	ld a, OBJACTION_34
	ld [hld], a
	ld b, $01

.asm_412a4
	ld a, 1 | (1 << 7)
	ld [wCurObjUnk1c], a
	ld a, [hl] ; OBJ_UNK_1A
	and $f0
	ld [hld], a
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld a, b
	ld [hld], a ; OBJ_UNK_18
	ld de, Frameset_683ca
	jp SetObjectFramesetPtr

.Action05:
	ld a, [wTransformation]
	and a
	jr nz, .asm_412d1
	ld a, [wEffectivePowerUp]
	cp POWER_UP_GARLIC
	jr nc, .asm_412d1
	ld a, [wCurObjInteractionType]
	and INTERACTION_MASK
	jr z, .asm_412d1
	ld a, OBJACTION_09
	ld [wCurObjAction], a
	ret
.asm_412d1
	ld hl, wCurObjAction
	ld a, OBJACTION_35
	ld [hld], a
	ld b, $01
	jr .asm_412a4

.GrabLeftStart:
	ld hl, wCurObjAction
	ld a, OBJACTION_36
	ld [hld], a
	dec l
	ld a, $41
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld a, $d0
	ld [hld], a ; OBJ_UNK_18
	ld a, $01
	ld [hld], a ; OBJ_UNK_17
	jp Func_3335

.GrabRightStart:
	ld hl, wCurObjAction
	ld a, OBJACTION_37
	ld [hld], a
	dec l
	ld a, $41
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld a, $f0
	ld [hld], a ; OBJ_UNK_18
	ld a, $01
	ld [hld], a ; OBJ_UNK_17
	jp Func_3344

.Action19:
	ld hl, wCurObjAction
	ld a, OBJACTION_49
	ld [hld], a
	ld de, Frameset_683d9
	call SetObjectFramesetPtr
	ld l, OBJ_FLAGS
	set OBJFLAG_UNK2_F, [hl]
.Action49:
	ld a, [wDirection]
	and a
	jp nz, Func_3353
	ld hl, wCurObjUnk1a
	ld a, [hl]
	xor $80
	ld [hl], a
	jr .Action18 ; unnecessary jump
.Action18:
	ld hl, wCurObjAction
	ld a, OBJACTION_48
	ld [hld], a
	ld de, Frameset_683d9
	call SetObjectFramesetPtr
	ld l, OBJ_FLAGS
	set OBJFLAG_UNK2_F, [hl]
.Action48:
	ld a, [wDirection]
	and a
	jp z, Func_3362
	ld hl, wCurObjUnk1a
	ld a, [hl]
	xor $80
	ld [hl], a
	jp .Action19

.Action12:
	ld hl, wCurObjUnk1c
	ld a, 31 | (1 << 7)
	ld [hld], a
	ld a, OBJACTION_42
	ld [hld], a ; OBJ_ACTION
	dec l
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00 ; unnecessary
	ld [hld], a
	ret
; 0x41357
