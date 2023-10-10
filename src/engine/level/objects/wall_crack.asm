WallCrackClosedFunc:
	ld de, Frameset_6a052
	jr WallCrackFunc
WallCrackOpenFunc:
	ld de, Frameset_6a05f
WallCrackFunc:
	call SetObjectFramesetPtr
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
.Update:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret
