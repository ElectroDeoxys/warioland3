PillarPlatform2Func:
	ld b, $02
	ld hl, wCurObjYPos
	ld a, [hl]
	sub $10
	ld [hli], a
	jr nc, PillarPlatformFunc
	dec [hl]
	jr PillarPlatformFunc
PillarPlatform3Func:
	ld b, $00
	ld hl, wCurObjYPos
	ld a, [hl]
	add $10
	ld [hli], a
	jr nc, PillarPlatformFunc
	inc [hl]
	jr PillarPlatformFunc
PillarPlatform1Func:
	ld b, $01
PillarPlatformFunc:
	ld a, b
	ld [wCurObjVar1], a
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_49ce5)
	ld [hld], a
	ld a, LOW(.Func_49ce5)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $00
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld a, $f4
	ld [hl], a
	ld a, [wca3b]
	rra
	jr c, .asm_49cbc
	ld de, Frameset_6975b
	jp SetObjectFramesetPtr

.asm_49cbc
	ld de, Frameset_6975e
	jp SetObjectFramesetPtr

.Func_49cc2:
	call SetOneWayPlatformAction
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, MoveObjectUp_Fast
	jr .asm_49cd8
.Func_49cce:
	call SetOneWayPlatformAction
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, MoveObjectDown_Fast
.asm_49cd8
	xor a
	ld [wCurObjState], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_49ce5)
	ld [hld], a
	ld a, LOW(.Func_49ce5)
	ld [hld], a
	ret

.Func_49ce5:
	call SetOneWayPlatformAction
	ld hl, wCurObjState
	ld a, [hl]
	and a
	ret z
	cp $2b
	jr z, .asm_49cf9
	cp $0a
	jr z, .asm_49d13
	xor a
	ld [hl], a
	ret

.asm_49cf9
	ld l, OBJ_VAR_1
	ld a, [hl]
	cp $02
	jr c, .asm_49d05
	xor a
	ld [wCurObjState], a
	ret

.asm_49d05
	inc [hl]
	dec l
	ld a, $09
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_49cc2)
	ld [hld], a
	ld a, LOW(.Func_49cc2)
	ld [hld], a
	ret

.asm_49d13
	ld l, OBJ_VAR_1
	ld a, [hl]
	and a
	jr nz, .asm_49d1d
	ld [wCurObjState], a
	ret

.asm_49d1d
	dec [hl]
	dec l
	ld a, $09
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_49cce)
	ld [hld], a
	ld a, LOW(.Func_49cce)
	ld [hld], a
	ld a, [wCurObjUnk01]
	add $03
	ld e, a
	ld c, $2b
	ld a, $00
	ld b, $00
	call .Func_49d43
	ld a, [wCurObjUnk01]
	sub $03
	ld e, a
	ld a, $00
	ld b, $00
.Func_49d43:
	ld h, HIGH(wObjects)
.asm_49d45
	ld l, OBJ_UNK_01
	add l
	ld l, a
	ld a, [hl]
	cp e
	jr nz, .asm_49d5b
	ld a, l
	add $06
	ld l, a
	ld a, [hl]
	cp $20
	jr nz, .asm_49d5b
	ld a, l
	add $14
	ld l, a
	ld [hl], c
.asm_49d5b
	ld a, b
	cp $e0
	ret z
	add $20
	ld b, a
	jr .asm_49d45
; 0x49d64
