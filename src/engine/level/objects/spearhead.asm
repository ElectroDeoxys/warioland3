SpearheadFunc: ; 40040 (10:4040)
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Init)
	ld [hld], a
	ld a, LOW(.Init)
	ld [hld], a
	xor a
	ld [wCurObjUnk17], a
	ret

.Init:
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld a, [wca3b]
	rra
	jp c, .SleepStart ; night
	jp .Default ; day

.Update:
	ld a, [wCurObjAction]
	jumptable

	dw .Default ; OBJACTION_00
	dw .Land ; OBJACTION_LAND
	dw .BumpLeftStart ; OBJACTION_BUMP_LEFT_START
	dw .BumpRightStart ; OBJACTION_BUMP_RIGHT_START
	dw .Action04 ; OBJACTION_04
	dw .Action05 ; OBJACTION_05
	dw .GrabLeftStart ; OBJACTION_GRAB_LEFT_START
	dw .GrabRightStart ; OBJACTION_GRAB_RIGHT_START
	dw .Action08 ; OBJACTION_08
	dw .Action09 ; OBJACTION_09
	dw ObjAction_Vanish2 ; OBJACTION_VANISH
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
	dw .Default ; OBJACTION_2A
	dw .Default ; OBJACTION_2B
	dw .Default ; OBJACTION_2C
	dw .Sleep ; OBJACTION_SLEEP
	dw .Angry ; OBJACTION_ANGRY
	dw .WakeUp ; OBJACTION_WAKE_UP
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
	dw .Action3b ; OBJACTION_3B
	dw .Action3c ; OBJACTION_3C
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
	dw .FullThrowLeftStart ; OBJACTION_FULL_THROW_LEFT_START
	dw .FullThrowRightStart ; OBJACTION_FULL_THROW_RIGHT_START
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
	dw .Default ; OBJACTION_5A
	dw .Default ; OBJACTION_5B
	dw .Default ; OBJACTION_5C
	dw .Default ; OBJACTION_5D
	dw ObjAction_FullThrowLeft ; OBJACTION_FULL_THROW_LEFT
	dw ObjAction_FullThrowRight ; OBJACTION_FULL_THROW_RIGHT

.FullThrowLeftStart:
	ld hl, wCurObjAction
	ld a, OBJACTION_FULL_THROW_LEFT
	ld [hld], a
	ld a, [hld] ; OBJ_UNK_1A
	rlca
	jr c, .asm_40140
	ld de, Frameset_68292
	call SetObjectFramesetPtr
	jp ObjAction_FullThrowLeft
.asm_40140
	ld de, Frameset_6829b
	call SetObjectFramesetPtr
	jp ObjAction_FullThrowLeft

.FullThrowRightStart:
	ld hl, wCurObjAction
	ld a, OBJACTION_FULL_THROW_RIGHT
	ld [hld], a
	ld a, [hld] ; OBJ_UNK_1A
	rlca
	jr c, .asm_4015c
	ld de, Frameset_68292
	call SetObjectFramesetPtr
	jp ObjAction_FullThrowRight
.asm_4015c
	ld de, Frameset_6829b
	call SetObjectFramesetPtr
	jp ObjAction_FullThrowRight

.SleepStart:
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a

	ld l, OBJ_ACTION
	ld a, OBJACTION_SLEEP
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
	ld hl, wCurObjUnk1a
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .on_left1
; on right
	set 7, [hl]
	jr .asm_40199
.on_left1
	res 7, [hl]
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
	ld a, OBJACTION_08 >> 1
	rla ; either OBJACTION_08 or OBJACTION_09
	ld [wCurObjAction], a
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
	ld a, OBJACTION_STANDING_FALL_START
	ld [wCurObjAction], a
	ret

.has_ground1
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ret

.wake_up
	ld a, [hli] ; OBJ_UNK_1A
	rlca
	ld a, OBJACTION_WAKE_UP
	ld [hl], a ; OBJ_ACTION
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
	ld [hli], a ; OBJ_ACTION_DURATION
	ret

.WakeUp:
	ld hl, wCurObjActionDuration
	dec [hl]
	ret nz
	jp .TurnAroundStart

.Default:
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a

	ld l, OBJ_ACTION
	ld a, OBJACTION_FALL
	ld [hld], a

	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .on_left2
; on right
	res 7, [hl] ; OBJ_UNK_1A
	dec l
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX

	ld l, OBJ_COLLBOX_RIGHT
	ld a, 6
	ld [hld], a
	ld a, -10
	ld [hld], a ; OBJ_COLLBOX_LEFT

	ld de, Frameset_681d2
	jp SetObjectFramesetPtr

.on_left2
	set 7, [hl] ; OBJ_UNK_1A
	dec l
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX

	ld l, OBJ_COLLBOX_RIGHT
	ld a, 9
	ld [hld], a
	ld a, -7
	ld [hld], a ; OBJ_COLLBOX_LEFT

	ld de, Frameset_681db
	jp SetObjectFramesetPtr

.StandingFallStart:
	ld hl, wCurObjAction
	ld a, OBJACTION_STANDING_FALL
	ld [hld], a
	ld a, [hld] ; OBJ_UNK_1A
	rlca
	jr c, .asm_40270
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld de, Frameset_681d2
	call SetObjectFramesetPtr
	ret
.asm_40270
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld de, Frameset_681db
	call SetObjectFramesetPtr
	ret

.LandWithSting:
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_FRONT_STING
	ld [hld], a
	ld l, OBJ_ACTION
	ld a, OBJACTION_ANGRY
	ld [hld], a
	ld a, [hld] ; OBJ_UNK_1A
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
	ld [hli], a ; OBJ_ACTION_DURATION
	ret

.Angry:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .no_shake2
	ldh a, [rDIV]
	rra
	ld a, OBJACTION_08 >> 1
	rla ; either OBJACTION_08 or OBJACTION_09
	ld [wCurObjAction], a
	ret

.no_shake2
	ld hl, wCurObjActionDuration
	dec [hl]
	ret nz
	inc l
	xor a
	ld [hl], a ; OBJ_UNK_17
	ld l, OBJ_ACTION
	ld a, OBJACTION_WALK
	ld [hld], a
	ld a, [hld] ; OBJ_UNK_1A
	rlca
	jr c, .asm_402d1
	ld de, Frameset_681d2
	jr .asm_402d4
.asm_402d1
	ld de, Frameset_681db
.asm_402d4
	call SetObjectFramesetPtr
	ret

.Land:
	ld a, [wCurObjUnk17]
	inc a
	jr z, .LandWithSting
; without sting
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ld l, OBJ_ACTION
	ld a, OBJACTION_WALK
	ld [hld], a
	ld a, [hld] ; OBJ_UNK_1A
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
	ld [hli], a ; OBJ_ACTION_DURATION
	ret

.Walk:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .no_shake3
	ldh a, [rDIV]
	rra
	ld a, OBJACTION_08 >> 1
	rla ; either OBJACTION_08 or OBJACTION_09
	ld [wCurObjAction], a
	ret

.no_shake3
	ld hl, wCurObjActionDuration
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
	ld a, OBJACTION_STANDING_FALL_START
	ld [wCurObjAction], a
	ret

.has_ground
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ld a, [wCurObjUnk1a]
	rlca
	jr c, .go_right

; go left
	ld a, [hl] ; x lo
	and $f
	sub 10
	jr nc, .asm_4036a
	call Func_355b
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
	jp z, MoveObjectLeft
.turn_around1
	ld a, OBJACTION_TURN_AROUND_START
	ld [wCurObjAction], a
	ret

.go_right
	ld a, [hl] ; x lo
	and $f
	add 9
	cp 16
	jr c, .asm_4039e
	call Func_3573
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
	jp z, MoveObjectRight
.turn_around2
	ld a, OBJACTION_TURN_AROUND_START
	ld [wCurObjAction], a
	ret

.BumpLeftStart:
	ld hl, wCurObjAction
	ld a, OBJACTION_BUMP_LEFT
	ld [hld], a
	ld a, [hld] ; OBJ_UNK_1A
	rlca
	jr c, .asm_403d1
	ld de, Frameset_6826e
	jr .asm_403e8
.asm_403d1
	ld de, Frameset_681f6
	jr .asm_403e8

.BumpRightStart:
	ld hl, wCurObjAction
	ld a, OBJACTION_BUMP_RIGHT
	ld [hld], a
	ld a, [hld] ; OBJ_UNK_1A
	rlca
	jr c, .asm_403e5
	ld de, Frameset_681ff
	jr .asm_403e8
.asm_403e5
	ld de, Frameset_68265
.asm_403e8
	call SetObjectFramesetPtr

	ld a, 12
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld a, $02
	ld [wCurObjUnk18], a
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
	ld hl, wCurObjAction
	ld a, OBJACTION_STUN_LEFT
	ld [hld], a
	ld a, [hld] ; OBJ_UNK_1A
	rlca
	jr c, .asm_40413
	ld de, Frameset_681e4
	jr .asm_40416
.asm_40413
	ld de, Frameset_681ed
.asm_40416
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
	ld hl, wCurObjUnk18
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, OBJACTION_0F
	ld [wCurObjAction], a
	ret

.StunRightStart:
	ld hl, wCurObjAction
	ld a, OBJACTION_STUN_RIGHT
	ld [hld], a
	ld a, [hld] ; OBJ_UNK_1A
	rlca
	jr c, .asm_40446
	ld de, Frameset_681e4
	jr .asm_40449
.asm_40446
	ld de, Frameset_681ed
.asm_40449
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
	ld hl, wCurObjUnk18
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, OBJACTION_0F
	ld [wCurObjAction], a
	ret

.Action14:
	ld hl, wCurObjAction
	ld a, OBJACTION_44
	ld [hld], a
	jr .Func_40478
.Action15:
	ld hl, wCurObjAction
	ld a, OBJACTION_45
	ld [hld], a
.Func_40478:
	ld a, [hld] ; OBJ_UNK_1A
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
	ld [hli], a ; OBJ_UNK_18
	xor a
	ld [hli], a ; OBJ_MOVEMENT_INDEX
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

.Action0f:
	ld a, OBJACTION_3F
	ld [wCurObjAction], a
	ld a, 100
	ld [wCurObjActionDuration], a
	ld hl, wCurObjFlags
	res OBJFLAG_UNK2_F, [hl]
.Action3f:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .no_shake4
	ld a, OBJACTION_1C
	ld [wCurObjAction], a
	ret
.no_shake4
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
	ld a, $ff
	ld [wCurObjUnk17], a
	ret

.TurnAroundStart:
	ld hl, wCurObjAction
	ld a, OBJACTION_TURN_AROUND
	ld [hld], a
	ld a, [hld] ; OBJ_UNK_1A
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
	ld [hli], a ; OBJ_ACTION_DURATION
	ld a, $1c
	ld [hl], a ; OBJ_UNK_17
	ret

.TurnAround: ; 4050a (10:450a)
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .no_shake5
	ldh a, [rDIV]
	rra
	ld a, OBJACTION_08 >> 1
	rla
	ld [wCurObjAction], a ; either OBJACTION_08 or OBJACTION_09
	ret

.no_shake5
	ld hl, wCurObjActionDuration
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
	ld a, [wCurObjUnk1a]
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
	dec [hl] ; OBJ_UNK_17
	jp nz, Func_3308
	ld a, [wCurObjUnk1a]
	rlca
	jr c, .asm_40562
	ld hl, wCurObjAction
	ld a, OBJACTION_LAND
	ld [hld], a
	set 7, [hl] ; OBJ_UNK_1A
	ret
.asm_40562
	ld hl, wCurObjAction
	ld a, OBJACTION_LAND
	ld [hld], a
	res 7, [hl] ; OBJ_UNK_1A
	ret

.Action08:
	ld hl, wCurObjUnk1c
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJ_INTERACTION_38
	jr .Func_4057d
.Action09:
	ld hl, wCurObjUnk1c
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJ_INTERACTION_39
.Func_4057d:
	ld [hld], a ; OBJ_ACTION
	ld a, [hld] ; OBJ_UNK_1A
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
	ld [hli], a ; OBJ_ACTION_DURATION
	inc l
	ld a, $02
	ld [hli], a ; OBJ_UNK_18
	xor a
	ld [hli], a ; OBJ_MOVEMENT_INDEX
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

.Action0b:
	ld a, OBJ_INTERACTION_3B
	ld [wCurObjAction], a
	jr .Func_405b6
.Action0c:
	ld a, OBJ_INTERACTION_3C
	ld [wCurObjAction], a
.Func_405b6:
	ld hl, wCurObjFrameDuration
	xor a
	ld [hli], a
	ld [hli], a ; OBJ_FRAMESET_OFFSET
	ld a, $02
	ld [wCurObjUnk18], a
	ret

.Action3b:
	ld hl, wCurObjFrameDuration
	xor a
	ld [hli], a
	ld [hli], a
	ld l, OBJ_UNK_18
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, OBJACTION_TURN_AROUND_START
	ld [wCurObjAction], a
	ret

.Action3c:
	ld hl, wCurObjFrameDuration
	xor a
	ld [hli], a
	ld [hli], a
	ld l, OBJ_UNK_18
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, OBJACTION_TURN_AROUND_START
	ld [wCurObjAction], a
	ret

.Action29:
	ld hl, wCurObjAction
	ld a, OBJACTION_59
	ld [hld], a
	ld b, $02
	jr .asm_4060e

.Action28:
	ld hl, wCurObjAction
	ld a, OBJACTION_58
	ld [hld], a
	ld b, $02
	jr .asm_4060e

.Action04:
	ld hl, wCurObjAction
	ld a, OBJACTION_34
	ld [hld], a
	ld b, $02
	jr .asm_4060e

.Action05:
	ld hl, wCurObjAction
	ld a, OBJACTION_35
	ld [hld], a
	ld b, $02

.asm_4060e
	ld a, [hl] ; OBJ_UNK_1A
	and $f0
	ld [hld], a
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld [hl], b ; OBJ_UNK_18
	ld a, 1 | (1 << 7)
	ld [wCurObjUnk1c], a
	ld de, Frameset_68277
	jp SetObjectFramesetPtr

.GrabLeftStart: ; 40620 (10:4620)
	ld hl, wCurObjAction
	ld a, OBJACTION_36
	ld [hld], a
	dec l
	ld a, HIGH(Data_601c0)
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld a, LOW(Data_601c0)
	ld [hld], a ; OBJ_UNK_18
	ld a, $01
	ld [hld], a ; OBJ_UNK_17
	jp Func_3335

.GrabRightStart:
	ld hl, wCurObjAction
	ld a, OBJACTION_37
	ld [hld], a
	dec l
	ld a, HIGH(Data_601e0)
	ld [hld], a
	ld a, LOW(Data_601e0)
	ld [hld], a
	ld a, $01
	ld [hld], a
	jp Func_3344

.Action19:
	ld hl, wCurObjAction
	ld a, OBJACTION_49
	ld [hld], a
	ld a, [hld] ; OBJ_UNK_1A
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
	set OBJFLAG_UNK2_F, [hl]
.Action49:
	ld a, [wDirection]
	and a
	jp nz, Func_3353
	ld hl, wCurObjUnk1a
	ld a, [hl]
	xor $80 ; switch direction
	ld [hl], a
	jr .Action18 ; unnecessary jump

.Action18:
	ld hl, wCurObjAction
	ld a, OBJACTION_48
	ld [hld], a
	ld a, [hld] ; OBJ_UNK_1A
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
	set OBJFLAG_UNK2_F, [hl]
.Action48:
	ld a, [wDirection]
	and a
	jp z, Func_3362
	ld hl, wCurObjUnk1a
	ld a, [hl]
	xor $80 ; switch direction
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
; 0x406c4
