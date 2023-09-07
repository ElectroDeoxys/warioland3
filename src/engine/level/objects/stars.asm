Func_4c860: ; 4c860 (13:4860)
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UNK_02
	farcall DespawnObject
	ret
; 0x4c87c

StarsFunc_WithYOffset: ; 4c87c (13:487c)
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

StarsFunc_SetFlags: ; 4c893 (13:4893)
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(StarsFunc)
	ld [hld], a
	ld a, LOW(StarsFunc)
	ld [hld], a
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
;	fallthrough

StarsFunc: ; 4c8a2 (13:48a2)
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret
; 0x4c8b1
