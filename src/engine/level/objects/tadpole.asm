TadpoleSpawnerFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_49e4b)
	ld [hld], a
	ld a, LOW(.Func_49e4b)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, 180
	ld [wCurObjStateDuration], a
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ret

.Func_49e4b:
	ld a, $81
	ld [wCurObjAction], a
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	ret c
	ld a, [wWarioScreenYPos]
	ld b, a
	ld a, [wCurObjScreenYPos]
	sub b
	cp $50
	ret nc
	cp $28
	ret c
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_49e7f)
	ld [hld], a
	ld a, LOW(.Func_49e7f)
	ld [hld], a
	ld bc, ObjParams_Tadpole
	jp CreateObjectAtRelativePos

.Func_49e7f:
	ld a, $81
	ld [wCurObjAction], a
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UNK_02
	farcall DespawnObject
	ret

TadpoleFunc:
	ld a, $81
	ld [wCurObjAction], a
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_49eb3)
	ld [hld], a
	ld a, LOW(.Func_49eb3)
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_INVISIBLE_F, [hl]
	ret

.Func_49eb3:
	ld a, $81
	ld [wCurObjAction], a
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	ret z
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_49ece)
	ld [hld], a
	ld a, LOW(.Func_49ece)
	ld [hld], a
	ld de, Frameset_69a33
	jp SetObjectFramesetPtr

.Func_49ece:
	ld a, $81
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_49ee2
	dec [hl]
	ret nz
	ld de, Frameset_69a3d
	jp SetObjectFramesetPtr
.asm_49ee2
	ld de, Frameset_69a1a
	call SetObjectFramesetPtr
	ld a, $20
	ld [hli], a
	xor a
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_49f34)
	ld [hld], a
	ld a, LOW(.Func_49f34)
	ld [hld], a
	play_sfx SFX_07F
	ret

.asm_49efe
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(Func_3407)
	ld [hld], a
	ld a, LOW(Func_3407)
	ld [hl], a
	ld l, OBJ_VAR_3
	xor a
	ld [hld], a
	ld a, $01
	ld [hl], a
	ret

.asm_49f0e
	ld a, HIGH(Func_33f8)
	ld c, LOW(Func_33f8)
	ld b, $02
	jr .asm_49f1c
.asm_49f16
	ld a, HIGH(Func_3407)
	ld c, LOW(Func_3407)
	ld b, $02
.asm_49f1c
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld [hld], a
	ld [hl], c
	ld l, OBJ_VAR_3
	xor a
	ld [hld], a
	ld [hl], b
	ld a, $81
	ld [wCurObjAction], a
	ld de, Frameset_69a30
	jp SetObjectFramesetPtr

.Func_49f34:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_49f5e
	cp $0b
	jr z, .asm_49efe
	cp $08
	jr z, .asm_49f16
	cp $09
	jr z, .asm_49f0e
	cp $28
	jr z, .asm_49f0e
	cp $29
	jr z, .asm_49f16
	cp $0a
	jp z, Func_3173
	cp $04
	jr z, .asm_49f16
	cp $05
	jr z, .asm_49f0e
	xor a
	ld [hl], a
.asm_49f5e
	ld l, OBJ_VAR_1
	ld a, [hl]
	and a
	jr z, .asm_49f97
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_352b
	ld a, [wIsInWaterOrSand]
	and a
	jr nz, .asm_49f85
	ld bc, Data_60a40
	call ApplyObjYMovement
	jp MoveObjectLeft_Fast

.asm_49f85
	ld de, Frameset_69a26
	call SetObjectFramesetPtr
	ld a, $09
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_49fb5)
	ld [hld], a
	ld a, LOW(.Func_49fb5)
	ld [hld], a
	ret

.asm_49f97
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	and a
	jr z, .asm_49fa7
	dec [hl]
	ld bc, Data_60a20
	call ApplyObjYMovement
	jp MoveObjectLeft_Fast

.asm_49fa7
	xor a
	ld [wCurObjVar3], a
	inc a
	ld [wCurObjVar1], a
	ld de, Frameset_69a1d
	jp SetObjectFramesetPtr

.Func_49fb5:
	ld a, $81
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret
