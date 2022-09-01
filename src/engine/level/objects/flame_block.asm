FlameBlockFunc: ; 496bd (12:56bd)
	ld a, [w1d140]
	and a
	jr z, .init
	xor a
	ld [wCurObjFlags], a
	ret
.init
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld de, Frameset_695de
	call SetObjectFramesetPtr
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNK_5_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 13
	ld [hld], a
	ld a, -14
	ld [hld], a
	ld a, -1
	ld [hl], a
	ret

.Update:
	ld a, [wNumLitTorches]
	cp NUM_FLAME_BLOCK_TORCHES
	ret nz
	ld [w1d140], a
	ld de, Frameset_695e7
	call SetObjectFramesetPtr
	ld a, 159
	ld [hli], a ; OBJ_STATE_DURATION
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Detroy)
	ld [hld], a
	ld a, LOW(.Detroy)
	ld [hld], a
	ret

.Detroy:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp 25
	jr nc, .asm_49715
	ld a, 1 | (1 << 7)
	ld [wCurObjAction], a
.asm_49715
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret
; 0x4971c
