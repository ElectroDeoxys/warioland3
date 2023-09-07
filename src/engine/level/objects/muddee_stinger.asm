MuddeeStingerFunc: ; 4ca16 (13:4a16)
	ld hl, wCurObjFlags
	set OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_SUBSTATE
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_4ca2a)
	ld [hld], a
	ld a, LOW(.Func_4ca2a)
	ld [hld], a
	ret

.Func_4ca2a:
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld a, [wCurObjState]
	cp $0a
	jr nz, .asm_4ca3b
	ld a, $01
	ld [w1d147], a
.asm_4ca3b
	ld a, [w1d147]
	and a
	jr z, .asm_4ca46
	xor a
	ld [wCurObjFlags], a
	ret
.asm_4ca46
	ld a, LOW(wObj1)
	ld b, LOW(wObj1)
	ld h, HIGH(wObj1)
.asm_4ca4c
	ld l, OBJ_UNK_07
	add l
	ld l, a
	ld a, [hl] ; OBJ_UNK_07
	cp $5a
	jr nz, .asm_4ca5d
	ld a, l
	sub OBJ_UNK_07 - OBJ_FLAGS
	ld l, a
	ld a, [hl] ; OBJ_FLAGS
	rra
	jr c, .asm_4ca66
.asm_4ca5d
	ld a, b
	cp LOW(wObj8)
	ret z
	add OBJ_STRUCT_LENGTH
	ld b, a
	jr .asm_4ca4c
.asm_4ca66
	ld a, l
	add $0f
	ld l, a
	ld c, [hl]
	ld a, l
	sub $0c
	ld l, a
	ld a, [wCurObjUnk07]
	cp $35
	jr z, .asm_4ca7b
	ld de, $4aed
	jr .asm_4ca7e
.asm_4ca7b
	ld de, $4b0d
.asm_4ca7e
	ld a, c
	cp $10
	jr c, .asm_4ca99
	ld a, [hli]
	ld [wCurObjYPos + 0], a
	ld a, [hli]
	ld [wCurObjYPos + 1], a
	ld a, [hli]
	ld [wCurObjXPos + 0], a
	ld a, [hl]
	ld [wCurObjXPos + 1], a
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret
.asm_4ca99
	add a
	add e
	ld e, a
	ld a, d
	adc $00
	ld d, a
	ld a, [de]
	ld c, a
	cp $80
	jr nc, .asm_4cab4
	ld a, [hli]
	add c
	ld [wCurObjYPos + 0], a
	jr nc, .asm_4cac2
	ld a, [hl]
	inc a
	ld [wCurObjYPos + 1], a
	jr .asm_4cac6
.asm_4cab4
	ld a, [hli]
	add c
	ld [wCurObjYPos + 0], a
	jr c, .asm_4cac2
	ld a, [hl]
	dec a
	ld [wCurObjYPos + 1], a
	jr .asm_4cac6
.asm_4cac2
	ld a, [hl]
	ld [wCurObjYPos + 1], a
.asm_4cac6
	inc l
	inc de
	ld a, [de]
	ld c, a
	cp $80
	jr nc, .asm_4cadb
	ld a, [hli]
	add c
	ld [wCurObjXPos + 0], a
	jr nc, .asm_4cae8
	ld a, [hl]
	inc a
	ld [wCurObjXPos + 1], a
	ret
.asm_4cadb
	ld a, [hli]
	add c
	ld [wCurObjXPos + 0], a
	jr c, .asm_4cae8
	ld a, [hl]
	dec a
	ld [wCurObjXPos + 1], a
	ret
.asm_4cae8
	ld a, [hl]
	ld [wCurObjXPos + 1], a
	ret
; 0x4caed

	INCROM $4caed, $4cb2d
