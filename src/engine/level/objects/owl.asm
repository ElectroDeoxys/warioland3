OwlFunc:
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
	ld a, $fe
	ld [hl], a
	ld a, [wca3b]
	rra
	jr c, .asm_491fd
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_4920f)
	ld [hld], a
	ld a, LOW(.Func_4920f)
	ld [hld], a
	ld de, Frameset_692e7
	jp SetObjectFramesetPtr

.asm_491fd
	play_sfx SFX_077
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and $80
	or $0b
	ld [hld], a
	jr .asm_49253

.Func_4920f:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	ret z
	xor a
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_49239)
	ld [hld], a
	ld a, LOW(.Func_49239)
	ld [hld], a
	ld de, Frameset_69318
	call SetObjectFramesetPtr
	ld a, $28
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and $80
	or $0b
	ld [hld], a
	play_sfx SFX_077
	ret

.Func_49239:
	ld a, [wCurObjFrame]
	cp $0c
	jr nz, .asm_4924e
	ld a, [wCurObjFrameDuration]
	dec a
	play_sfx z, SFX_071
.asm_4924e
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
.asm_49253
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_49265)
	ld [hld], a
	ld a, LOW(.Func_49265)
	ld [hld], a
	ld de, Frameset_69335
	call SetObjectFramesetPtr
	ld a, $36
	ld [hli], a
	ret

.Func_49265:
	ld a, [wCurObjFrame]
	cp $0c
	jr nz, .asm_4927a
	ld a, [wCurObjFrameDuration]
	dec a
	play_sfx z, SFX_071
.asm_4927a
	call MoveObjectUp
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld a, $1e
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_492b4)
	ld [hld], a
	ld a, LOW(.Func_492b4)
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and $80
	or $28
	ld [hld], a
	ld l, OBJ_SUBSTATE
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_492ac
	res OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_6936c
	jp SetObjectFramesetPtr
.asm_492ac
	set OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_69377
	jp SetObjectFramesetPtr

.Func_492b4:
	ld a, [wCurObjState]
	cp $18
	jr z, .asm_4930f
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_492f7
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_492df
	ld a, [wCurObjFrame]
	cp $1e
	jr nz, .asm_492dc
	ld a, [wCurObjFrameDuration]
	dec a
	play_sfx z, SFX_071
.asm_492dc
	jp MoveObjectLeft
.asm_492df
	ld a, [wCurObjFrame]
	cp $23
	jr nz, .asm_492f4
	ld a, [wCurObjFrameDuration]
	dec a
	play_sfx z, SFX_071
.asm_492f4
	jp MoveObjectRight
.asm_492f7
	ld a, $3c
	ld [hl], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor $80
	ld [hl], a
	rla
	jr c, .asm_49309
	ld de, Frameset_6936c
	jp SetObjectFramesetPtr

.asm_49309
	ld de, Frameset_69377
	jp SetObjectFramesetPtr

.asm_4930f
	xor a
	ld [wCurObjFlags], a
	ld hl, wCurObjUnk02
	farcall DespawnObject
	ret
