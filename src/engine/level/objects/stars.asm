Func_4c860:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UNK_02
	farcall DespawnObject
	ret

StarsFunc_WithYOffset:
	ld hl, wCurObjYPos
	ld a, [wYPosLo]
	add 4
	ld [hli], a
	ld a, [wYPosHi]
	adc 0
	ld [hli], a
	ld a, [wXPosLo]
	ld [hli], a
	ld a, [wXPosHi]
	ld [hli], a
;	fallthrough

StarsFunc_SetFlags:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(StarsFunc)
	ld [hld], a
	ld a, LOW(StarsFunc)
	ld [hld], a
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
;	fallthrough

StarsFunc:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret
