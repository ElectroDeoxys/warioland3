ZombieFunc:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Init)
	ld [hld], a
	ld a, LOW(.Init)
	ld [hld], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 3
	ld [hld], a
	ld a, -4
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	xor a
	ld [wCurObjStateDuration], a
	ret

.Init:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.OnUnderground)
	ld [hld], a
	ld a, LOW(.OnUnderground)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .set_right
	res OBJSUBFLAG_HDIR_F, [hl]
	ld a, $17
	ld [wCurObjFrame], a
	ret
.set_right
	set OBJSUBFLAG_HDIR_F, [hl]
	ld a, $18
	ld [wCurObjFrame], a
	ret

.OnUnderground:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, 2
	ld [wCurObjFrameDuration], a
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
	jr nz, .asm_45b27
	xor a
	ld [wCurObjFlags], a
	ret
.asm_45b27
	ld hl, wCurObjXPos
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_45b69
	ld a, [hl]
	and $0f
	sub 4
	jr nc, .asm_45b3f
	call Func_355b
	and $0f
	jp z, .asm_45b61
.asm_45b3f
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	sub 4
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr nz, .asm_45b61
	call MoveObjectLeft
	jr .asm_45b99
.asm_45b61
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	ret

.asm_45b69
	ld a, [hl]
	and $0f
	add 3
	cp 16
	jr c, .asm_45b79
	call Func_3573
	and $0f
	jr z, .asm_45b61
.asm_45b79
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	add 3
	ldh [hXPosLo], a
	ld a, [hli]
	adc 0
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr nz, .asm_45b61
	call MoveObjectRight
.asm_45b99
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_45ba2
	dec [hl]
	ret
.asm_45ba2
	ld c, $2a
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp 24
	jr c, .in_y_range
	cp -24
	ret c
.in_y_range
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
	cp -32
	ret nc
	cp 32
	ret c
	cp -64
	jr nc, .in_x_range
	cp 64
	ret nc
.in_x_range
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.StartRise)
	ld [hld], a
	ld a, LOW(.StartRise)
	ld [hld], a
	ld a, 20
	ld [wCurObjStateDuration], a
	ret

.StartRise:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_SUBSTATE
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_45c01
	res OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_68d93
	jr .asm_45c06
.asm_45c01
	set OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_68d9c
.asm_45c06
	call SetObjectFramesetPtr
	ld a, 20
	ld [hli], a ; state duration
	ld l, OBJ_FLAGS
	res OBJFLAG_INVISIBLE_F, [hl]
	res OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Rising)
	ld [hld], a
	ld a, LOW(.Rising)
	ld [hld], a
	play_sfx SFX_074
	ret

.Rising:
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_ZOMBIE_WARIO
	jr nz, .asm_45c2f
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
.asm_45c2f
	ld hl, wCurObjStateDuration
	dec [hl]
	ld a, [hl]
	cp 12
	jr z, .coll_box_low
	cp 6
	jr z, .coll_box_mid
	and a
	ret nz
; coll box high
	ld a, -24
	ld [wCurObjCollBoxTop], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.OnSurface)
	ld [hld], a
	ld a, LOW(.OnSurface)
	ld [hld], a
	xor a
	ld [wCurObjState], a
	jr .asm_45cca
.coll_box_low
	ld a, -12
	ld [wCurObjCollBoxTop], a
	ret
.coll_box_mid
	ld a, -18
	ld [wCurObjCollBoxTop], a
	ret

.OnSurface:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .substate_table
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_ZOMBIE_WARIO
	jr nz, .asm_45cb2
	ld a, [hl]
	cp $0a
	jr nz, .asm_45cba
.asm_45c70
	dec l
	ld a, [hl]
	and $0f
	cp $3
	jr z, .asm_45c7d
	ld de, Frameset_68d1a
	jr .asm_45c80
.asm_45c7d
	ld de, Frameset_68d1f
.asm_45c80
	call SetObjectFramesetPtr

.asm_45c83
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	ld [hld], a
	xor a
	ld [hld], a
	ld a, $02
	ld [hld], a
	play_sfx SFX_017
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_45ca9
	ld bc, Func_3407
	jr .asm_45cac
.asm_45ca9
	ld bc, Func_33f8
.asm_45cac
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, b
	ld [hld], a
	ld [hl], c
	ret

.asm_45cb2
	ld a, [hl]
	cp $0a
	jp z, Func_3173
	jr .asm_45c70
.asm_45cba
	xor a
	ld [hl], a
.substate_table
	ld a, [wCurObjSubState]
	and $0f
	jumptable

	dw .Func_45ce2
	dw .Func_45ce2
	dw .Func_45ddc
	dw .ThrowHead

.asm_45cca
	ld hl, wCurObjSubState
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	or $01
	ld [hl], a
	rlca
	jr c, .asm_45cdc
	ld de, Frameset_68d81
	jp SetObjectFramesetPtr
.asm_45cdc
	ld de, Frameset_68d8a
	jp SetObjectFramesetPtr

.Func_45ce2:
	ld c, $2a
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp 32
	jr c, .asm_45cf6
	cp -32
	jr c, .asm_45d32
.asm_45cf6
	ld hl, wCurObjSubState
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
	cp -48
	jr nc, .asm_45d15
	cp 48
	jr nc, .asm_45d32
	ld a, [hl]
	rlca
	jp c, .asm_45dc4
	ld de, Frameset_68da5
	jr .asm_45d1d
.asm_45d15
	ld a, [hl]
	rlca
	jp nc, .asm_45dc9
	ld de, Frameset_68dac
.asm_45d1d
	rrca
	and OBJSUBFLAGS_MASK
	or $3
	ld [hl], a
	call SetObjectFramesetPtr
	ld a, 50
	ld [hli], a
	play_sfx SFX_064
	ret

.asm_45d32
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
	jr nz, .asm_45d56
	ld a, $30
	ld [wCurObjStateDuration], a
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Headless)
	ld [hld], a
	ld a, LOW(.Headless)
	ld [hld], a
	ret

.asm_45d56
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_45d94
	ld a, [hl]
	and $0f
	sub $04
	jr nc, .asm_45d74
	call Func_355b
	and $0f
	jp z, .asm_45dc9
.asm_45d74
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	sub $04
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectLeft_Fast
	jr .asm_45dc9
.asm_45d94
	ld a, [hl]
	and $0f
	add $03
	cp $10
	jr c, .asm_45da4
	call Func_3573
	and $0f
	jr z, .asm_45dc4
.asm_45da4
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	add $03
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectRight_Fast
	jr .asm_45dc4
.asm_45dc4
	ld de, Frameset_68d2b
	jr .asm_45dcc
.asm_45dc9
	ld de, Frameset_68d24
.asm_45dcc
	ld hl, wCurObjSubState
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	or $2
	ld [hl], a
	call SetObjectFramesetPtr
	ld a, 32
	ld [hli], a
	ret

.Func_45ddc:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp 20
	jr z, .asm_45deb
	dec [hl]
	jp nz, Func_3308
	jp .asm_45cca
.asm_45deb
	dec [hl]
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	jr c, .asm_45df5
	set OBJSUBFLAG_HDIR_F, [hl]
	ret
.asm_45df5
	res OBJSUBFLAG_HDIR_F, [hl]
	ret

.ThrowHead:
	ld hl, wCurObjStateDuration
	dec [hl]
	ld a, [hl]
	cp 16
	jr z, .throw_head
	and a
	ret nz
	ld a, 48
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Headless)
	ld [hld], a
	ld a, LOW(.Headless)
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ret
.throw_head
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_45e1f
	ld bc, ObjParams_ZombieHeadLeft
	jp CreateObjectAtRelativePos
.asm_45e1f
	ld bc, ObjParams_ZombieHeadRight
	jp CreateObjectAtRelativePos

.Headless:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ld l, OBJ_FLAGS
	jr z, .go_underground
	; flicker
	ld a, [wGlobalCounter]
	and %1
	ret nz
	ld a, [hl]
	xor OBJFLAG_INVISIBLE
	ld [hl], a
	ret
.go_underground
	ld hl, wCurObjFlags
	set OBJFLAG_INVISIBLE_F, [hl]
	xor a
	ld [wCurObjState], a
	ld a, 100
	ld [wCurObjStateDuration], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.OnUnderground)
	ld [hld], a
	ld a, LOW(.OnUnderground)
	ld [hld], a
	ret

ZombieHeadFunc_Left:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr nz, .asm_45e64
	ld l, OBJ_FLAGS
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jr nz, .asm_45e73
	xor a
	ld [hl], a
	ret
.asm_45e64
	dec [hl]
	jr nz, .asm_45e73
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	ld de, Frameset_68dda
	call SetObjectFramesetPtr
.asm_45e73
	ld bc, Data_605a0
	jr ZombieHeadFunc

ZombieHeadFunc_Right:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr nz, .asm_45e88
	ld l, OBJ_FLAGS
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jr nz, .asm_45e97
	xor a
	ld [hl], a
	ret
.asm_45e88
	dec [hl]
	jr nz, .asm_45e97
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	ld de, Frameset_68dd5
	call SetObjectFramesetPtr
.asm_45e97
	ld bc, Data_60560
;	fallthrough

ZombieHeadFunc:
	call ApplyObjXMovement
	ld hl, wCurObjState
	ld a, [hld]
	and a
	ret z
	cp $0b
	jp c, ZombieFunc.asm_45c83
	cp $0f
	jp nc, ZombieFunc.asm_45c83
	ld a, [hld]
	rlca
	jr c, .asm_45eb6
	ld de, Frameset_68dd5
	jr .asm_45eb9
.asm_45eb6
	ld de, Frameset_68dda
.asm_45eb9
	call SetObjectFramesetPtr
	ld a, 40
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Flicker)
	ld [hld], a
	ld a, LOW(.Flicker)
	ld [hld], a
	ret

.Flicker:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ld l, OBJ_FLAGS
	jr z, .destroy
	ld a, [wGlobalCounter]
	and %1
	ret nz
	ld a, [hl]
	xor OBJFLAG_INVISIBLE
	ld [hl], a
	ret
.destroy
	xor a
	ld [hl], a
	ret
