SnakeFunc: ; 4989e (12:589e)
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Init)
	ld [hld], a
	ld a, LOW(.Init)
	ld [hld], a
	ld l, OBJ_VAR_2
	ld a, [wCurObjYPos + 0]
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	ld [hl], a
	ret

.Init:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_498d8
	res OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_68804
	jr .asm_498dd
.asm_498d8
	set OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_6881d
.asm_498dd
	call SetObjectFramesetPtr
	ld a, $78
	ld [hli], a
	xor a
	ld [hl], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $ff
	ld [hld], a
	ld a, $f1
	ld [hld], a
	ld a, $0f
	ld [hl], a
	ret

.Update:
	call SetOneWayPlatformAction
	ld a, $0f
	ld [wCurObjCollBoxBottom], a
	call .Func_49af0
	ld hl, wCurObjState
	ld a, [hld]
	and a
	jr z, .asm_49920
	inc l
	ld b, $00
	ld [hl], b
	ld l, OBJ_FLAGS
	res OBJFLAG_NO_COLLISION_F, [hl]
	cp $0a
	jr z, .asm_49936
	and $fe
	cp $04
	jr z, .asm_49919
	cp $28
	jr nz, .asm_4991e
.asm_49919
	ld l, OBJ_VAR_1
	jp .Func_49a85
.asm_4991e
	ld l, OBJ_SUBSTATE
.asm_49920
	ld a, [hl]
	and $0f
	jumptable
	dw .Func_49943
	dw .Func_49943
	dw .Func_49957
	dw .Func_49984
	dw .Func_499b8
	dw .Func_499f8
	dw .Func_49a57
	dw .Func_49a7c
	dw .Func_49aa1

.asm_49936
	play_sfx SFX_VANISH
	ld l, OBJ_VAR_1
	jp .Func_49a85

.Func_49943:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $3e
	ld [hl], a
	ld l, OBJ_SUBSTATE
	inc [hl]
	play_sfx SFX_11A
	ret

.Func_49957:
	call .Func_49b76
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_4997d
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	jp z, MoveObjectUp_Slow
	res OBJFLAG_STEPPED_F, [hl]
	xor a
	ld [wCurObjCollBoxBottom], a
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld b, $01
	call SubYOffset
	call HandleUpwardsFloorTransition
	jp MoveObjectUp
.asm_4997d
	ld a, $53
	ld [hli], a
	ld l, OBJ_SUBSTATE
	inc [hl]
	ret

.Func_49984:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_4998d
	dec [hl]
	ret

.asm_4998d
	inc l
	ld a, [hl]
	and a
	ld l, OBJ_SUBSTATE
	jr nz, .asm_499b1
	ld a, [wCurObjFrame]
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr nz, .asm_499a3
	cp $05
	ret nz
	ld de, Frameset_68852
	jr .asm_499a9
.asm_499a3
	cp $0e
	ret nz
	ld de, Frameset_688c6
.asm_499a9
	inc [hl]
	call SetObjectFramesetPtr
	ld a, $31
	ld [hli], a
	ret

.asm_499b1
	inc [hl]
	ld a, $31
	ld [wCurObjStateDuration], a
	ret

.Func_499b8:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_499d2
	dec [hl]
	ld l, OBJ_FRAMESET_OFFSET
	ld a, [hld]
	cp $0a
	ret nz
	ld a, [hld]
	and a
	ret nz
	play_sfx SFX_08A
	ret

.asm_499d2
	inc l
	ld a, [hl]
	and a
	ret nz
	ld a, [wCurObjFrame]
	ld l, OBJ_SUBSTATE
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr nz, .asm_499e7
	cp $22
	ret nz
	ld de, Frameset_6886f
	jr .asm_499ed
.asm_499e7
	cp $45
	ret nz
	ld de, Frameset_688e3
.asm_499ed
	inc [hl]
	call SetObjectFramesetPtr
	ld a, $31
	ld [hli], a
	ld a, $02
	ld [hl], a
	ret

.Func_499f8:
	ld hl, wCurObjVar1
	ld a, $02
	ld [hld], a
	dec [hl]
	jr z, .asm_49a12
	dec l
	ld a, [hld]
	cp $0a
	ret nz
	ld a, [hld]
	and a
	ret nz
	play_sfx SFX_08A
	ret

.asm_49a12
	ld a, LOW(wObj1)
	ld b, LOW(wObj1)
	ld h, HIGH(wObj1)
.asm_49a18
	ld l, OBJ_FLAGS
	add l
	ld l, a
	bit OBJFLAG_ACTIVE_F, [hl]
	jr z, .asm_49a2a
	ld a, b
	cp LOW(wObj8)
	jr z, .asm_49a5f
	add OBJ_STRUCT_LENGTH
	ld b, a
	jr .asm_49a18
.asm_49a2a
	ld a, $93
	ld [wCurObjStateDuration], a
	play_sfx SFX_089
	ld hl, wCurObjSubState
	inc [hl]
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr nz, .asm_49a4b
	ld de, Frameset_6888c
	call SetObjectFramesetPtr
	ld bc, ObjParams_SnakeFireLeft
	jp CreateObjectAtRelativePos
.asm_49a4b
	ld de, Frameset_68900
	call SetObjectFramesetPtr
	ld bc, ObjParams_SnakeFireRight
	jp CreateObjectAtRelativePos

.Func_49a57:
	ld hl, wCurObjVar1
	ld a, $02
	ld [hld], a
	dec [hl]
	ret nz
.asm_49a5f
	ld a, $31
	ld [wCurObjStateDuration], a
	ld hl, wCurObjSubState
	ld a, [hl]
	and $f0
	or $07
	ld [hl], a
	rlca
	jr c, .asm_49a76
	ld de, Frameset_688a9
	jp SetObjectFramesetPtr

.asm_49a76
	ld de, Frameset_6891d
	jp SetObjectFramesetPtr

.Func_49a7c:
	ld hl, wCurObjVar1
	ld a, $02
	ld [hld], a
	dec [hl]
	ret nz
	inc l
.Func_49a85:
	xor a
	ld [hl], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and $f0
	or $08
	ld [hl], a
	rlca
	jr c, .asm_49a97
	ld de, Frameset_68804
	jr .asm_49a9a
.asm_49a97
	ld de, Frameset_6881d
.asm_49a9a
	call SetObjectFramesetPtr
	ld a, $01
	ld [hli], a
	ret

.Func_49aa1:
	call .Func_49b76
	ld hl, wCurObjVar2
	ld a, [hli]
	ld b, a
	ld a, [wCurObjYPos + 0]
	cp b
	jr nz, .asm_49ab6
	ld b, [hl]
	ld a, [wCurObjYPos + 1]
	cp b
	jr z, .asm_49ae2
.asm_49ab6
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	and a
	jr z, .asm_49ac5
	dec [hl]
	play_sfx SFX_08B
.asm_49ac5
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	jp z, MoveObjectDown_Slow
	res OBJFLAG_STEPPED_F, [hl]
	xor a
	ld [wCurObjCollBoxBottom], a
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld b, $01
	call AddYOffset
	call HandleDownwardsFloorTransition
	jp MoveObjectDown
.asm_49ae2
	ld l, OBJ_STATE_DURATION
	ld a, $78
	ld [hl], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and $f0
	or $01
	ld [hld], a
	ret

.Func_49af0:
	ld hl, wCurObjVar1
	ld a, [hl]
	and a
	jr z, .asm_49b22
	dec [hl]
	ret nz
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and $0f
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr nz, .asm_49b12
	cp $04
	jr nz, .asm_49b0c
	ld de, Frameset_68852
	jp SetObjectFramesetPtr

.asm_49b0c
	ld de, Frameset_68804
	jp SetObjectFramesetPtr

.asm_49b12
	cp $04
	jr nz, .asm_49b1c
	ld de, Frameset_688c6
	jp SetObjectFramesetPtr

.asm_49b1c
	ld de, Frameset_6881d
	jp SetObjectFramesetPtr

.asm_49b22
	ld c, $2a
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp $28
	jr c, .asm_49b35
	cp $e8
	ret c
.asm_49b35
	ld hl, wCurObjSubState
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
	jr c, .asm_49b5a
	bit OBJSUBFLAG_HDIR_F, [hl]
	ret z
	res OBJSUBFLAG_HDIR_F, [hl]
	ld a, [hl]
	and $0f
	cp $04
	jr nz, .asm_49b55
	ld de, Frameset_6884b
	jr .asm_49b6e
.asm_49b55
	ld de, Frameset_6883d
	jr .asm_49b6e
.asm_49b5a
	bit OBJSUBFLAG_HDIR_F, [hl]
	ret nz
	set OBJSUBFLAG_HDIR_F, [hl]
	ld a, [hl]
	and $0f
	cp $04
	jr nz, .asm_49b6b
	ld de, Frameset_68844
	jr .asm_49b6e
.asm_49b6b
	ld de, Frameset_68836
.asm_49b6e
	call SetObjectFramesetPtr
	inc l
	ld a, $14
	ld [hl], a
	ret

.Func_49b76:
	ld a, [wCurObjScreenYPos]
	cp $10
	jr c, .asm_49b8a
	cp $c0
	jr nc, .asm_49b85
	cp $a0
	jr nc, .asm_49b8a
.asm_49b85
	xor a
	ld [wCurObjState], a
	ret

.asm_49b8a
	ld a, $48
	ld [wCurObjState], a
	ret
; 0x49b90

SnakeFireFunc: ; 49b90 (12:5b90)
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjFlags
	set OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ret

.Update:
	ld hl, wCurObjUnk01
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ld e, OBJFLAG_ACTIVE | OBJFLAG_TRANSIENT
	ld d, $2d
	ld h, HIGH(wObjects)

FOR n, 1, NUM_OBJECTS + 1
	ld l, LOW(wObj{u:n}Unk02)
	ld a, [hld] ; unk02
	cp b
	jr nz, :+
	ld a, [hld] ; unk01
	cp c
	jr nz, :+
	ld a, [hl]
	and e
	dec a
	jr nz, :+ ; jump if !active || transient
	ld a, [wObj{u:n}Unk07]
	cp d
	jp z, .got_snake_obj
:
ENDR

	jr .destroy
.got_snake_obj
	ld a, l
	add OBJ_SUBSTATE - OBJ_FLAGS
	ld l, a
	ld a, [hl]
	and $0f
	cp $06
	ret z
.destroy
	xor a
	ld [wCurObjFlags], a
	ret
; 0x49c70
