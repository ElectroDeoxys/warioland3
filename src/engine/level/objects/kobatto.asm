KobattoFunc: ; 47718 (11:7718)
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld de, Frameset_69041
	call SetObjectFramesetPtr

	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]

	ld l, OBJ_COLLBOX_RIGHT
	ld a, 6
	ld [hld], a
	ld a, -7
	ld [hld], a
	ld a, -4
	ld [hl], a

	ld l, OBJ_VAR_1
	ld a, $01
	ld [hli], a ; var1
	ld a, LOW(Data_60ec9)
	ld [hli], a ; var2
	ld a, HIGH(Data_60ec9)
	ld [hli], a ; var3
	ret

.Update:
	ld de, Data_60ec9
	call ApplyObjSetMovement
	ret
; 0x4774f
