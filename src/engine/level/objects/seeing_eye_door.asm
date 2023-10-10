SeeingEyeDoorFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.CheckWarioDistance)
	ld [hld], a
	ld a, LOW(.CheckWarioDistance)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, 24
	ld [wCurObjVar2], a
	call MoveObjectDownByVar2
	ld de, Frameset_68c47
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $02
	ld [hld], a
	ld a, $fd
	ld [hld], a
	ld a, $17
	ld [hl], a
	ret

.CheckWarioDistance:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Default)
	ld [hld], a
	ld a, LOW(.Default)
	ld [hld], a
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_454e9
	ld a, $5a
	ld de, Frameset_68c47
	jr .asm_454ee
.asm_454e9
	ld a, $2e
	ld de, Frameset_68c59
.asm_454ee
	ld [wCurObjVar1], a
	call SetObjectFramesetPtr
	jr .Default

	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wTransformation]
	cp TRANSFORMATION_INVISIBLE_WARIO
	ret z
	ld a, [wCurObjScreenYPos]
	sub $19
	ld b, a
	ld a, [wWarioScreenYPos]
	sub b
	cp $36
	ret nc
	jr .CheckWarioDistance

.set_look_around
	ld a, [wCurObjVar1]
	cp $2e
	jr z, .asm_45545
	cp $5a
	jr z, .asm_45545
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_4552e
	ld de, Frameset_68c4a
	jr .asm_45531
.asm_4552e
	ld de, Frameset_68c56
.asm_45531
	call SetObjectFramesetPtr
	ld a, 8
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.LookAround)
	ld [hld], a
	ld a, LOW(.LookAround)
	ld [hld], a
	ret

.LookAround
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
.asm_45545
	ld de, Frameset_68c36
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $54
	ld [hld], a
	ld a, $f6
	ld [hld], a
	ret

.Default:
	ld a, [wTransformation]
	cp TRANSFORMATION_INVISIBLE_WARIO
	jr z, .set_look_around
	ld a, [wCurObjScreenYPos]
	sub $19
	ld b, a
	ld a, [wWarioScreenYPos]
	sub b
	cp $36
	jr nc, .set_look_around
	ld a, [wWarioScreenXPos]
	ld d, a
	ld a, [wCurObjScreenXPos]
	ld e, a
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_4557e
	xor a
	ld [hl], a
	ld l, OBJ_FLAGS
	res OBJFLAG_NO_COLLISION_F, [hl]
.asm_4557e
	ld l, OBJ_VAR_1
	ld a, [hl]
	cp $5c
	jr z, .asm_45597
	cp $2d
	jr z, .asm_455ba
	cp $2e
	jr z, .asm_455e7
	cp $5b
	jr z, .asm_45602
	cp $5a
	jp z, .asm_4562f
	ret

.asm_45597
	ld a, e
	add $17
	cp d
	jr c, .asm_455a9
	ld a, e
	sub $18
	cp d
	ret c
	ld a, $5b
	ld de, Frameset_68c4a
	jr .asm_455ae
.asm_455a9
	ld a, $2d
	ld de, Frameset_68c56
.asm_455ae
	ld [hl], a
	play_sfx SFX_07A
	jp SetObjectFramesetPtr

.asm_455ba
	ld a, e
	add $46
	cp d
	jr c, .asm_455d6
	ld a, e
	add $17
	cp d
	ret c
	play_sfx SFX_07B
	ld a, $5c
	ld [hl], a
	ld de, Frameset_68c50
	jp SetObjectFramesetPtr

.asm_455d6
	play_sfx SFX_07A
	ld a, $2e
	ld [hl], a
	ld de, Frameset_68c59
	jp SetObjectFramesetPtr

.asm_455e7
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, e
	add $46
	cp d
	ret c
	play_sfx SFX_07A
	ld a, $2d
	ld [hl], a
	ld de, Frameset_68c56
	jp SetObjectFramesetPtr

.asm_45602
	ld a, e
	sub $18
	cp d
	jr c, .asm_4561e
	ld a, e
	sub $47
	cp d
	ret c
	play_sfx SFX_07A
	ld a, $5a
	ld [hl], a
	ld de, Frameset_68c47
	jp SetObjectFramesetPtr

.asm_4561e
	play_sfx SFX_07B
	ld a, $5c
	ld [hl], a
	ld de, Frameset_68c50
	jp SetObjectFramesetPtr

.asm_4562f
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, e
	sub $47
	cp d
	ret nc
	play_sfx SFX_07A
	ld a, $5b
	ld [hl], a
	ld de, Frameset_68c4a
	jp SetObjectFramesetPtr
