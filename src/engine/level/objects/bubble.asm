BubbleHoleFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	jr .asm_47c08

.Update:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
.asm_47c08
	call CountActiveTransientObjects
	ld a, [wTransformation]
	cp TRANSFORMATION_BUBBLE
	ld a, e
	jr nz, .asm_47c19
	cp 1
	jr nc, .wait
	jr .create_bubble
.asm_47c19
	cp 2
	jr nc, .wait
.create_bubble
	ld a, 208
	ld [wCurObjStateDuration], a
	play_sfx SFX_069
	ld bc, ObjParams_Bubble
	jp CreateObjectFromCurObjPos

.wait
	ld a, 1
	ld [wCurObjStateDuration], a
	ret

BubbleFunc:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjFlags
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jp nz, .Func_47c88
	ld de, Frameset_690f4
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ret

.Update:
	ld a, [wCurObjState]
	and a
	jr nz, .destroy
	call .Func_47c88
	ret

.set_burst
	ld de, Frameset_6910c
	call SetObjectFramesetPtr
	ld a, 16
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Burst)
	ld [hld], a
	ld a, LOW(.Burst)
	ld [hld], a
	play_sfx SFX_072
	ret

.Burst:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
.destroy
	xor a
	ld [wCurObjFlags], a
	ret

.Func_47c88:
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jr z, .asm_47c96
	ld a, [wGlobalCounter]
	and %1
	jr nz, .asm_47ce0
.asm_47c96
	ld l, OBJ_Y_POS
	ld a, [hl]
	sub $01
	ld [hli], a
	jr nc, .asm_47c9f
	dec [hl]
.asm_47c9f
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $18
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_358b
	and a
	jp nz, .set_burst
	ld a, [wIsInWaterOrSand]
	ldh [hIsInWaterOrSandBackup], a

	ld hl, wCurObjYPos
	ld a, [hli]
	sub $0c
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_358b
	ld a, [wIsInWaterOrSand]
	and a
	ret nz ; still underwater
	ldh a, [hIsInWaterOrSandBackup]
	and a
	ret nz ; still underwater
	jp .set_burst

.asm_47ce0
	ld hl, wCurObjVar1
	dec [hl]
	ld l, OBJ_SUBSTATE
	jr nz, .asm_47cf4
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	ld l, OBJ_VAR_1
	ld a, $30
	ld [hli], a
	xor a
	ld [hl], a
	ret

.asm_47cf4
	ld a, [hl]
	rla
	jp c, .Func_47d56
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $18
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	sub $0c
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jr nz, .asm_47d2b
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $07
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	call Func_3513
	and $0f
	jr z, .asm_47d38
.asm_47d2b
	ld hl, wCurObjSubState
	set OBJSUBFLAG_HDIR_F, [hl]
	ld l, OBJ_VAR_1
	ld a, $30
	ld [hli], a
	xor a
	ld [hl], a
	ret

.asm_47d38
	ld hl, wCurObjVar2
	ld a, [hl]
	ld b, $40
	add $20
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_47d4a
	dec c
	ld a, [bc]
	jr .asm_47d4b
.asm_47d4a
	inc [hl]
.asm_47d4b
	ld b, a
	and a
	ret z
	ld l, OBJ_X_POS
	ld a, [hl]
	add b
	ld [hli], a
	ret c
	dec [hl]
	ret

.Func_47d56:
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $18
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	add $0b
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jr nz, .asm_47d88
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $07
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	call Func_3513
	and $0f
	jr z, .asm_47d95
.asm_47d88
	ld hl, wCurObjSubState
	res OBJSUBFLAG_HDIR_F, [hl]
	ld l, OBJ_VAR_1
	ld a, $30
	ld [hli], a
	xor a
	ld [hl], a
	ret

.asm_47d95
	ld hl, wCurObjVar2
	ld a, [hl]
	ld b, $40
	add $50
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_47da7
	dec c
	ld a, [bc]
	jr .asm_47da8
.asm_47da7
	inc [hl]
.asm_47da8
	ld b, a
	and a
	ret z
	ld l, OBJ_X_POS
	ld a, [hl]
	add b
	ld [hli], a
	ret nc
	inc [hl]
	ret
