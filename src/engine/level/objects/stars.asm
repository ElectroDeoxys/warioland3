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
	ld a, [wWarioYPos + 1]
	add 4
	ld [hli], a
	ld a, [wWarioYPos + 0]
	adc 0
	ld [hli], a
	ld a, [wWarioXPos + 1]
	ld [hli], a
	ld a, [wWarioXPos + 0]
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
