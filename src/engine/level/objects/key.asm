KeyFunc: ; 4c992 (13:4992)
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
	ld de, Frameset_6804f
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $04
	ld [hld], a
	ld a, $fb
	ld [hld], a ; OBJ_COLLBOX_LEFT
	ld a, $fc
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
; 0x4c9d4
