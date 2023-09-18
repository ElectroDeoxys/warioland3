MusicalCoinFunc: ; 4c9d4 (13:49d4)
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
	ld de, Frameset_68036
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 1
	ld [hld], a
	ld a, -17
	ld [hld], a ; OBJ_COLLBOX_LEFT
	ld a, -7
	ld [hl], a ; OBJ_COLLBOX_BOTTOM
	ret

.Update:
	ld a, [wCurObjState]
	cp OBJSTATE_18
	ret nz
	xor a
	ld [wCurObjFlags], a
	ld hl, wCurObjUnk02
	farcall Func_bb2d
	ret
