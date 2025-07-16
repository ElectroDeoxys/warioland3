SunFunc:
	ld de, Frameset_68f6b
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.CheckDirection)
	ld [hld], a
	ld a, LOW(.CheckDirection)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 7
	ld [hld], a
	ld a, -8
	ld [hld], a
	ld a, -4
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ret

.CheckDirection:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_472a6)
	ld [hld], a
	ld a, LOW(.Func_472a6)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_47296
	res OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_68f74
	jr .asm_4729b
.asm_47296
	set OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_68f6b
.asm_4729b
	call SetObjectFramesetPtr
	ld a, 50
	ld [hli], a ; state duration
	xor a
	ld [hli], a ; var1
	inc a ; 1
	ld [hl], a ; var2
	ret

.Func_472a6:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjVar1]
	jumptable

	dw .Func_4731e
	dw .Func_47378
	dw .Func_4739c
	dw .Func_47388
	dw .Func_473ac
	dw .Func_472bb

.Func_472bb:
	call SunMoon_XMovement
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc1ca], a
	call Func_352b
	and a
	jr z, .asm_472dd
	ld a, [wc1ca]
	and a
	jr z, .asm_472e3
.asm_472dd
	ld bc, Data_60690
	call ApplyObjYMovement
.asm_472e3
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_47307
	ld a, [hl]
	cp 52
	ret nz
	play_sfx SFX_068
	ld a, [wCurObjSubState]
	rlca
	jr c, .shoot_right
; shoot left
	ld bc, ObjParams_SunFlameLeft
	jp CreateObjectAtRelativePos
.shoot_right
	ld bc, ObjParams_SunFlameRight
	jp CreateObjectAtRelativePos

.asm_47307
	ld a, 50
	ld [hli], a
	xor a
	ld [hl], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_47318
	ld de, Frameset_68f74
	jp SetObjectFramesetPtr
.asm_47318
	ld de, Frameset_68f6b
	jp SetObjectFramesetPtr

.Func_4731e:
	call SunMoon_GeneralMovement
	ld a, [wJoypadPressed]
	and $ff ^ (PAD_SELECT | PAD_START)
	jr z, .asm_4732d
	; reset duration
	ld a, 50
	ld [wCurObjStateDuration], a
.asm_4732d
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_47336
	dec [hl]
	ret

.asm_47336
	ld l, OBJ_FLAGS
	bit OBJFLAG_ON_SCREEN_F, [hl]
	ret z
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	sub b
	cp 64
	jr c, .asm_4734e
	cp -64
	ret c
.asm_4734e
	ld a, [wCurObjScreenYPos]
	add $2a
	ld b, a
	ld a, [wWarioScreenYPos]
	add $2a
	sub b
	cp 43
	ret nc
	ld l, OBJ_STATE_DURATION
	ld a, 82
	ld [hli], a
	ld a, $05
	ld [hli], a ; var1
	inc l
	xor a
	ld [hli], a
	ld a, [hld]
	rlca
	jr c, .asm_47372
	ld de, Frameset_68f9e
	jp SetObjectFramesetPtr
.asm_47372
	ld de, Frameset_68f8f
	jp SetObjectFramesetPtr

.Func_47378:
	call SunMoon_GeneralMovement
	ld de, Frameset_68fc0
	call SetObjectFramesetPtr
	ld a, 35
	ld [hli], a
	ld a, $03
	ld [hl], a ; var1
	ret

.Func_47388:
	call SunMoon_GeneralMovement
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_68f6b
	call SetObjectFramesetPtr
	ld a, 50
	ld [hli], a
	xor a
	ld [hl], a
	ret

.Func_4739c:
	call SunMoon_GeneralMovement
	ld de, Frameset_68fb7
	call SetObjectFramesetPtr
	ld a, 35
	ld [hli], a
	ld a, $04
	ld [hl], a
	ret

.Func_473ac:
	call SunMoon_GeneralMovement
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_68f74
	call SetObjectFramesetPtr
	ld a, 50
	ld [hli], a
	xor a
	ld [hl], a
	ret

SunMoon_GeneralMovement:
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jr nz, .on_screen
	ld a, 2
	ld [wCurObjVar2], a
.on_screen
	ld l, OBJ_X_POS
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [wWarioXPos + 0]
	ld b, a
	ld a, [wWarioXPos + 1]
	ld c, a
	ld a, b
	cp d
	jr c, .asm_4740b
	jr nz, .asm_473e3
	ld a, c
	cp e
	jr c, .asm_4740b

.asm_473e3
	ld hl, 32
	add hl, de
	ld a, b
	cp h
	jr c, .asm_473f1
	jr nz, .asm_473f8
	ld a, c
	cp l
	jr nc, .asm_473f8
.asm_473f1
	ld a, 1
	ld [wCurObjVar2], a
	jr .asm_473fb
.asm_473f8
	call SunMoon_MoveRight
.asm_473fb
	ld hl, wCurObjSubState
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr nz, .asm_47431
	set OBJSUBFLAG_HDIR_F, [hl]
	ld a, $01
	ld [wCurObjVar1], a
	jr .asm_47431

.asm_4740b
	ld hl, -32
	add hl, de
	ld a, b
	cp h
	jr c, .asm_47420
	jr nz, .asm_47419
	ld a, c
	cp l
	jr c, .asm_47420
.asm_47419
	ld a, 1
	ld [wCurObjVar2], a
	jr .asm_47423
.asm_47420
	call SunMoon_MoveLeft
.asm_47423
	ld hl, wCurObjSubState
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr z, .asm_47431
	res OBJSUBFLAG_HDIR_F, [hl]
	ld a, $02
	ld [wCurObjVar1], a

.asm_47431
	ld l, OBJ_Y_POS
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, $2a
	add hl, de
	ld a, [wWarioYPos + 0]
	ld b, a
	ld a, [wWarioYPos + 1]
	ld c, a
	ld a, b
	cp h
	jp c, SunMoon_MoveUp
	jp nz, SunMoon_MoveDown
	ld a, c
	cp l
	ret z
	jp c, SunMoon_MoveUp
	jp SunMoon_MoveDown

SunMoon_XMovement:
	; moves quicker when outside screen
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jr z, .outside_screen
	ld a, 1
	jr .got_vel
.outside_screen
	ld a, 2
.got_vel
	ld [wCurObjVar2], a

	ld l, OBJ_X_POS
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [wWarioXPos + 0]
	ld b, a
	ld a, [wWarioXPos + 1]
	ld c, a
	ld a, b
	cp d
	jr c, .going_left
	jr nz, .going_right
	ld a, c
	cp e
	jr c, .going_left
.going_right
	ld hl, 32
	add hl, de
	ld a, b
	cp h
	ret c
	jp nz, SunMoon_MoveRight
	ld a, c
	cp l
	ret c
	jp SunMoon_MoveRight
.going_left
	ld hl, -32
	add hl, de
	ld a, b
	cp h
	jp c, SunMoon_MoveLeft
	ret nz
	ld a, c
	cp l
	ret nc
	jp SunMoon_MoveLeft

SunMoon_MoveRight:
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 6
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	add 12
	ldh [hXPosLo], a
	ld a, [hli]
	adc 0
	ldh [hXPosHi], a
	call Func_3513
	and a
	ret nz
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 20
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	call Func_3513
	and a
	ret nz
	jp MoveObjectRightByVar2

SunMoon_MoveLeft:
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 6
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	sub 12
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_3513
	and a
	ret nz
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 20
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	call Func_3513
	and a
	ret nz
	jp MoveObjectLeftByVar2

SunMoon_MoveDown:
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc1ca], a
	call Func_352b
	and a
	jr z, .asm_4751a
	ld a, [wc1ca]
	and a
	ret z
.asm_4751a
	jp MoveObjectDownByVar2

SunMoon_MoveUp:
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 24
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_358b
	and a
	ret nz
	jp MoveObjectUpByVar2

SunFlameFunc_Left:
	ld bc, Data_606e0
	jr SunFlameFunc
SunFlameFunc_Right:
	ld bc, Data_606f0
SunFlameFunc:
	call ApplyObjXMovement
	ld hl, wCurObjFlags
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld a, [wCurObjState]
	and a
	ret z
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld de, Frameset_68fc9
	call SetObjectFramesetPtr
	ld a, 14
	ld [hli], a
	ret

.Update:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret

MoonFunc:
	ld de, Frameset_68fd0
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.CheckDirection)
	ld [hld], a
	ld a, LOW(.CheckDirection)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 7
	ld [hld], a
	ld a, -8
	ld [hld], a
	ld a, -4
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ret

.CheckDirection:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_475c7)
	ld [hld], a
	ld a, LOW(.Func_475c7)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_475b7
	res OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_68fd9
	jr .asm_475bc
.asm_475b7
	set OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_68fd0
.asm_475bc
	call SetObjectFramesetPtr
	ld a, 50
	ld [hli], a ; state duration
	xor a
	ld [hli], a ; var1
	inc a ; 1
	ld [hl], a ; var2
	ret

.Func_475c7:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjVar1]
	jumptable

	dw .Func_4763f
	dw .Func_47699
	dw .Func_476bd
	dw .Func_476a9
	dw .Func_476cd
	dw .Func_475dc

.Func_475dc:
	call SunMoon_XMovement
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc1ca], a
	call Func_352b
	and a
	jr z, .asm_475fe
	ld a, [wc1ca]
	and a
	jr z, .asm_47604
.asm_475fe
	ld bc, Data_60690
	call ApplyObjYMovement
.asm_47604
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_47628
	ld a, [hl]
	cp 52
	ret nz
	play_sfx SFX_06E
	ld a, [wCurObjSubState]
	rlca
	jr c, .shoot_right
; shoot left
	ld bc, ObjParams_MoonStarLeft
	jp CreateObjectAtRelativePos
.shoot_right
	ld bc, ObjParams_MoonStarRight
	jp CreateObjectAtRelativePos

.asm_47628
	ld a, 50
	ld [hli], a
	xor a
	ld [hl], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_47639
	ld de, Frameset_68fd9
	jp SetObjectFramesetPtr
.asm_47639
	ld de, Frameset_68fd0
	jp SetObjectFramesetPtr

.Func_4763f:
	call SunMoon_GeneralMovement
	ld a, [wJoypadPressed]
	and $ff ^ (PAD_SELECT | PAD_START)
	jr z, .asm_4764e
	; reset duration
	ld a, 50
	ld [wCurObjStateDuration], a
.asm_4764e
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_47657
	dec [hl]
	ret

.asm_47657
	ld l, OBJ_FLAGS
	bit OBJFLAG_ON_SCREEN_F, [hl]
	ret z
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	sub b
	cp 64
	jr c, .asm_4766f
	cp -64
	ret c
.asm_4766f
	ld a, [wCurObjScreenYPos]
	add $2a
	ld b, a
	ld a, [wWarioScreenYPos]
	add $2a
	sub b
	cp 43
	ret nc
	ld l, OBJ_STATE_DURATION
	ld a, 82
	ld [hli], a
	ld a, $05
	ld [hli], a ; var1
	inc l
	xor a
	ld [hli], a
	ld a, [hld]
	rlca
	jr c, .asm_47693
	ld de, Frameset_69003
	jp SetObjectFramesetPtr
.asm_47693
	ld de, Frameset_68ff4
	jp SetObjectFramesetPtr

.Func_47699:
	call SunMoon_GeneralMovement
	ld de, Frameset_69036
	call SetObjectFramesetPtr
	ld a, 40
	ld [hli], a
	ld a, $03
	ld [hl], a ; var1
	ret

.Func_476a9:
	call SunMoon_GeneralMovement
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_68fd0
	call SetObjectFramesetPtr
	ld a, 50
	ld [hli], a
	xor a
	ld [hl], a
	ret

.Func_476bd:
	call SunMoon_GeneralMovement
	ld de, Frameset_6902b
	call SetObjectFramesetPtr
	ld a, 40
	ld [hli], a
	ld a, $04
	ld [hl], a
	ret

.Func_476cd:
	call SunMoon_GeneralMovement
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_68fd9
	call SetObjectFramesetPtr
	ld a, 50
	ld [hli], a
	xor a
	ld [hl], a
	ret

MoonStarFunc_Left:
	ld bc, Data_606e0
	jr MoonStarFunc
MoonStarFunc_Right:
	ld bc, Data_606f0
MoonStarFunc:
	call ApplyObjXMovement
	ld hl, wCurObjFlags
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld a, [wCurObjState]
	and a
	ret z
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld de, Frameset_69024
	call SetObjectFramesetPtr
	ld a, 14
	ld [hli], a
	ret

.Update:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret
