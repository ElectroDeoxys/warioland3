SmallLeafFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $06
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld a, $f3
	ld [hl], a
.Init:
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update1)
	ld [hld], a
	ld a, LOW(.Update1)
	ld [hld], a
	ld de, Frameset_68a9f
	call SetObjectFramesetPtr
	ret

.Update4:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	jr .Init

.Update1:
	call SetOneWayPlatformAction
	ld hl, wCurObjState
	ld a, [hl]
	cp $0a
	jr z, .asm_43747
	and $fe
	cp $04
	jr z, .asm_43747
	xor a
	ld [hl], a
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	ret z
	res OBJFLAG_STEPPED_F, [hl]
	ld de, Frameset_68aa8
	call SetObjectFramesetPtr
	ld a, $28
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update2)
	ld [hld], a
	ld a, LOW(.Update2)
	ld [hld], a
	ret

.asm_43747
	jp Func_3173

.Update2:
	ld hl, wCurObjState
	ld a, [hl]
	cp $0a
	jr z, .asm_43747
	and $fe
	cp $04
	jr z, .asm_43747
	xor a
	ld [hl], a
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	cp $0f
	jr nc, .asm_43766
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
.asm_43766
	dec [hl]
	ret nz
	ld a, $9b
	ld [hli], a
	ld l, OBJ_FLAGS
	res OBJFLAG_STEPPED_F, [hl]
	set OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update3)
	ld [hld], a
	ld a, LOW(.Update3)
	ld [hld], a
	ret

.Update3:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld de, Frameset_68abb
	call SetObjectFramesetPtr
	ld a, $28
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update4)
	ld [hld], a
	ld a, LOW(.Update4)
	ld [hld], a
	ret
