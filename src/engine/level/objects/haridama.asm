HaridamaFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Init)
	ld [hld], a
	ld a, LOW(.Init)
	ld [hld], a
	ret

.Init:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f8
	ld [hld], a
	ld a, $fd
	ld [hl], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_48f20
	res OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_6927f
	jp SetObjectFramesetPtr
.asm_48f20
	set OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_69290
	jp SetObjectFramesetPtr

.Func_48f28:
	ld c, $2a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_48f60
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp $08
	jr c, .asm_48f42
	cp $e8
	jr c, .asm_48f55
.asm_48f42
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
	cp $40
	jr nc, .asm_48f55
	ld de, Frameset_692c7
	jr .asm_48fa2
.asm_48f55
	call .Func_49199
	jp z, MoveObjectLeft_Slow
	ld de, Frameset_692a1
	jr .asm_48f8e
.asm_48f60
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp $08
	jr c, .asm_48f72
	cp $e8
	jr c, .asm_48f85
.asm_48f72
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
	cp $c0
	jr c, .asm_48f85
	ld de, Frameset_692ce
	jr .asm_48fa2
.asm_48f85
	call .Func_491b6
	jp z, MoveObjectRight_Slow
	ld de, Frameset_692aa
.asm_48f8e
	call SetObjectFramesetPtr
	ld a, $1b
	ld [hli], a
	ld a, $5a
	ld [wCurObjState], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_06
	ld [hld], a
	ret

.asm_48fa2
	call SetObjectFramesetPtr
	ld a, $12
	ld [hli], a
	ld a, $5b
	ld [wCurObjState], a
	ret

.Func_48fae:
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_2A
	ld [hld], a
	ld l, OBJ_STATE
	ld a, $32
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_48fc9
	ld de, Frameset_692bd
	jp SetObjectFramesetPtr

.asm_48fc9
	ld de, Frameset_692c2
	jp SetObjectFramesetPtr

.Update:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jp z, .Func_48f28
	cp $5a
	jr z, .asm_4903e
	cp $5b
	jr z, .Func_48fae
	cp $02
	jr z, .asm_49013
	cp $03
	jr z, .asm_49006
	and $fe
	cp $08
	jr z, .asm_49069
	cp $32
	jr z, .asm_49020
	cp $38
	jp z, .Func_49094
.asm_48ff6
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_49001
	ld de, Frameset_692a1
	jr .asm_48f8e
.asm_49001
	ld de, Frameset_692aa
	jr .asm_48f8e
.asm_49006
	ld a, $32
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_48ff6
	ld de, Frameset_692b3
	jp SetObjectFramesetPtr

.asm_49013
	ld a, $32
	ld [hld], a
	ld a, [hld]
	rlca
	jr nc, .asm_48ff6
	ld de, Frameset_692b8
	jp SetObjectFramesetPtr

.asm_49020
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_49032
	call .Func_49199
	jp z, MoveObjectLeft_Fast
	ld de, Frameset_692a1
	jp .asm_48f8e
.asm_49032
	call .Func_491b6
	jp z, MoveObjectRight_Fast
	ld de, Frameset_692aa
	jp .asm_48f8e
.asm_4903e
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	cp $0d
	jr nz, .asm_49052
	dec [hl]
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	jr c, .asm_4904f
	set OBJSUBFLAG_HDIR_F, [hl]
	ret
.asm_4904f
	res OBJSUBFLAG_HDIR_F, [hl]
	ret

.asm_49052
	dec [hl]
	ret nz
.asm_49054
	ld hl, wCurObjState
	xor a
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_49063
	ld de, Frameset_6927f
	jp SetObjectFramesetPtr

.asm_49063
	ld de, Frameset_69290
	jp SetObjectFramesetPtr

.asm_49069
	ld l, OBJ_UNK_1D
	bit 7, [hl]
	jr nz, .asm_49077
	ld l, OBJ_SUBSTATE
	ld a, [hli]
	rlca
	jr c, .asm_49013
	jr .asm_49006
.asm_49077
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_06
	ld [hld], a
	ld l, OBJ_STATE
	ld a, $38
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_4908e
	ld de, Frameset_692d5
	jp SetObjectFramesetPtr

.asm_4908e
	ld de, Frameset_692de
	jp SetObjectFramesetPtr

.Func_49094:
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $11
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	sub $08
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_358b
	and a
	jr nz, .asm_490d5
	ld a, [wc0dd]
	and a
	jr z, .asm_490d5
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $11
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	add $07
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_358b
	and a
	jp z, MoveObjectUp_Slow
.asm_490d5
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_490e8)
	ld [hld], a
	ld a, LOW(.Func_490e8)
	ld [hld], a
	ld a, $64
	ld [wCurObjStateDuration], a
	xor a
	ld [wCurObjState], a
	ret

.Func_490e8:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_49118
	cp $32
	jr z, .asm_4916a
	cp $33
	jp z, .Func_49184
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr nc, .asm_4910d
	ld a, $32
	ld [hld], a
	res OBJSUBFLAG_HDIR_F, [hl]
	jr .asm_49112
.asm_4910d
	ld a, $33
	ld [hld], a
	set OBJSUBFLAG_HDIR_F, [hl]
.asm_49112
	ld a, $3c
	ld [wCurObjVar1], a
	ret

.asm_49118
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jr z, .asm_4913f
	ld a, [wGlobalCounter]
	and %11
	ret nz
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_49131
	call .Func_49199
	jp z, MoveObjectLeft
	jr .asm_49137
.asm_49131
	call .Func_491b6
	jp z, MoveObjectRight
.asm_49137
	ld hl, wCurObjSubState
	ld a, [hl]
	xor $80
	ld [hl], a
	ret

.asm_4913f
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	ld a, [wCurObjFrame]
	jr c, .asm_4915d
	cp $1a
	jp c, .asm_49054
	set OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_692aa
	jp .asm_48f8e
.asm_4915d
	cp $1a
	jp nc, .asm_49054
	res OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_692a1
	jp .asm_48f8e
.asm_4916a
	ld hl, wCurObjVar1
	dec [hl]
	jr z, .asm_4917f
	call .Func_49199
	jp z, MoveObjectLeft
	ld hl, wCurObjState
	ld a, $33
	ld [hld], a
	set OBJSUBFLAG_HDIR_F, [hl]
	ret

.asm_4917f
	xor a
	ld [wCurObjState], a
	ret

.Func_49184:
	ld hl, wCurObjVar1
	dec [hl]
	jr z, .asm_4917f
	call .Func_491b6
	jp z, MoveObjectRight
	ld hl, wCurObjState
	ld a, $32
	ld [hld], a
	res OBJSUBFLAG_HDIR_F, [hl]
	ret

.Func_49199:
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $08
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	sub $09
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	ret

.Func_491b6:
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $08
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	add $08
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	ret
