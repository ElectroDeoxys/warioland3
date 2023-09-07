ElectricLampFunc: ; 459a9 (11:59a9)
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Discharged)
	ld [hld], a
	ld a, LOW(.Discharged)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld de, Frameset_68cc4
	call SetObjectFramesetPtr
	ret

.Discharged:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wGlobalCounter]
	and a
	ret nz
	ld de, Frameset_68ccd
	call SetObjectFramesetPtr
	ld a, 30
	ld [hli], a ; state duration
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Charging)
	ld [hld], a
	ld a, LOW(.Charging)
	ld [hld], a
	ret

.Charging:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and %11
	play_sfx z, SFX_06A
	dec [hl]
	ret nz
	ld de, Frameset_68cc4
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Discharged)
	ld [hld], a
	ld a, LOW(.Discharged)
	ld [hld], a
	play_sfx SFX_06B
	ld bc, ObjParams_ElectricLampSpark
	jp CreateObjectFromCurObjPos

ElectricLampSparkFunc: ; 45a12 (11:5a12)
	ld hl, wCurObjFlags
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld bc, Data_60040
	call ApplyObjYMovement
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

	; reached ground
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_COLLBOX_TOP
	ld a, -6
	ld [hli], a
	ld a, 5
	ld [hl], a
	ld de, Frameset_68ca0
	call SetObjectFramesetPtr
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .go_right
; go left
	ld de, .GoLeft
	jr .update_function
.go_right
	ld de, .GoRight
.update_function
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, d
	ld [hld], a
	ld [hl], e
	play_sfx SFX_06C
	ret

.GoLeft
	ld hl, wCurObjXPos
	ld a, [hl]
	sub 2
	ld [hli], a
	jr nc, .check_destroy
	dec [hl]
	jr .check_destroy
.GoRight
	ld hl, wCurObjXPos
	ld a, [hl]
	add 2
	ld [hli], a
	jr nc, .check_destroy
	inc [hl]
.check_destroy
	ld a, [wCurObjState]
	and a
	jr nz, .destroy
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
	jr z, .destroy
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	call Func_3513
	and a
	ret z
.destroy
	xor a
	ld [wCurObjFlags], a
	ret
; 0x45ab4
