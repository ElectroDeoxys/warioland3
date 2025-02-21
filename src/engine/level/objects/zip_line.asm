ZipLineFunc:
	ld hl, wCurObjSubState
	ld a, [wCurObjUnk07]
	cp $27
	jr c, .asm_49338
	ld a, $03
	jr nz, .asm_4933a
	res OBJSUBFLAG_HDIR_F, [hl]
	jr .asm_4933c
.asm_49338
	ld a, $01
.asm_4933a
	set OBJSUBFLAG_HDIR_F, [hl]
.asm_4933c
	ld [wCurObjVar2], a
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_FLAGS
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $03
	ld [hld], a
	ld a, $fc
	ld [hld], a
	ld a, $fe
	ld [hl], a
	xor a
	ld [wCurObjVar1], a
.Func_49356:
	ld de, Frameset_691c4
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_49369)
	ld [hld], a
	ld a, LOW(.Func_49369)
	ld [hld], a
	xor a
	ld [wCurObjState], a
	ret

.Func_49369:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	call .Func_49418
	ld a, [wCurObjVar1]
	cp $03
	jr z, .asm_493cd
	ld a, [wCurObjState]
	and a
	jr nz, .asm_49393
	ld a, [wCurObjScreenYPos]
	add c
	ld b, a
	ld a, [wWarioScreenYPos]
	add c
	sub b
	cp $10
	ret c
	cp $18
	ret nc
	xor a
	ld [wCurObjAction], a
	ret

.asm_49393
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_493dc)
	ld [hld], a
	ld a, LOW(.Func_493dc)
	ld [hld], a
	ld a, $01
	ld [wCurObjVar1], a
	ld l, OBJ_Y_POS
	ld a, [hli]
	add $1b
	ld [wWarioYPos + 1], a
	ld a, [hli]
	adc $00
	ld [wWarioYPos + 0], a
	ld a, [hli]
	add $04
	ld [wWarioXPos + 1], a
	ld a, [hl]
	adc $00
	ld [wWarioXPos + 0], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_493c7
	ld de, Frameset_691c9
	jp SetObjectFramesetPtr

.asm_493c7
	ld de, Frameset_691d2
	jp SetObjectFramesetPtr

.asm_493cd
	ld de, Frameset_691db
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_49412)
	ld [hld], a
	ld a, LOW(.Func_49412)
	ld [hld], a
	ret

.Func_493dc:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	call .Func_49418
	ld a, [wCurObjVar1]
	cp $03
	jr z, .asm_493cd
	ld a, [wTransformation]
	cp TRANSFORMATION_RAIL
	ret z
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_49405)
	ld [hld], a
	ld a, LOW(.Func_49405)
	ld [hld], a
	ld a, $0a
	ld [wCurObjStateDuration], a
	ld a, $02
	ld [wCurObjVar1], a
	ret

.Func_49405:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	jp .Func_49356

.Func_49412:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

.Func_49418:
	ld a, [wCurObjVar1]
	and a
	ret z
	ld a, [wCurObjSubState]
	rlca
	jr nc, .asm_49450
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $10
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	add $07
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr nz, .asm_4947b
	call .Func_494cb
	ld a, [wCurObjUnk07]
	cp $24
	ret z
	rra
	jp nc, .asm_494f5
	jp .asm_494e7
.asm_49450
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $10
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	sub $08
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr nz, .asm_4947b
	call .Func_494af
	ld a, [wCurObjUnk07]
	cp $24
	ret z
	rra
	jr nc, .asm_494e7
	jr .asm_494f5
.asm_4947b
	ld a, [wCurObjUnk07]
	cp $27
	jr nc, .asm_49499
	ld hl, wCurObjSubState
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr nz, .asm_49491
	set OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_691d2
	jp SetObjectFramesetPtr
.asm_49491
	res OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_691c9
	jp SetObjectFramesetPtr

.asm_49499
	ld hl, wCurObjVar1
	ld a, [hl]
	dec a
	jr nz, .asm_494ab
	ld [wAutoMoveState], a
	play_sfx SFX_129
.asm_494ab
	ld a, $03
	ld [hl], a
	ret

.Func_494af:
	call MoveObjectLeftByVar2
	ld a, [wCurObjVar1]
	dec a
	ret nz
	call MoveWarioLeft
	farcall Func_19713
	jr .asm_49518

.Func_494cb:
	call MoveObjectRightByVar2
	ld a, [wCurObjVar1]
	dec a
	ret nz
	call MoveWarioRight
	farcall Func_19706
	jr .asm_49518
.asm_494e7
	call MoveObjectUpByVar2
	ld a, [wCurObjVar1]
	dec a
	ret nz
	call MoveWarioUp
	jp HandleUpwardsFloorTransition
.asm_494f5
	call MoveObjectDownByVar2
	ld a, [wCurObjVar1]
	dec a
	ret nz
	call MoveWarioDown
	call HandleDownwardsFloorTransition
	ld a, [wCurObjUnk07]
	cp $27
	ret c
	ld a, [wGlobalCounter]
	and %111
	ret nz
	play_sfx SFX_ZIP_LINE_SLIDE
	ret

.asm_49518
	ld a, [wCurObjUnk07]
	cp $27
	ret nc
	ld a, [wGlobalCounter]
	and %11111
	ret nz
	play_sfx SFX_08C
	ret
