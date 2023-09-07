SparkFunc: ; 4a8a2 (12:68a2)
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
	ld de, Frameset_69bd9
	call SetObjectFramesetPtr
	ld a, $28
	ld [hli], a
	ld a, $01
	ld [hl], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $02
	ld [hld], a
	ld a, $fc
	ld [hld], a
	ld a, $fb
	ld [hl], a
	ret

.Update:
	ld a, [wGlobalCounter]
	rra
	ret c
	ld hl, wCurObjVar1
	ld a, [hld]
	and a
	jr z, .asm_4a8ed
	dec [hl]
	jr z, .asm_4a8e7
	ld a, [wCurObjUnk07]
	cp $22
	jp z, MoveObjectRight
	jp MoveObjectUp
.asm_4a8e7
	ld a, $50
	ld [hli], a
	xor a
	ld [hl], a
	ret
.asm_4a8ed
	dec [hl]
	jr z, .asm_4a8fb
	ld a, [wCurObjUnk07]
	cp $22
	jp z, MoveObjectLeft
	jp MoveObjectDown
.asm_4a8fb
	ld a, $50
	ld [hli], a
	ld a, $01
	ld [hl], a
	ret
; 0x4a902
