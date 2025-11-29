KushimushiVerticalFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld de, Frameset_6861b
	call SetObjectFramesetPtr
	ld a, $60
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 3
	ld [hld], a
	ld a, -4
	ld [hld], a
	ld a, -3
	ld [hl], a
	ret

.Update:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_42a68
	cp $0e
	jr z, .asm_42a16
	cp $0d
	jr z, .asm_42a16
	cp $0a
	jp z, VanishObject2
	cp $28
	jr z, .asm_42a2d
	cp $29
	jr z, .asm_42a35
	cp $04
	jr z, .asm_42a45
	cp $05
	jr z, .asm_42a3d
	rra
	jr nc, .asm_42a35
	jr .asm_42a2d

.asm_42a16
	xor a
	ld [hl], a
	ld l, OBJ_VAR_2
	ld a, $3c
	ld [hld], a
	ld a, [hl]
	and a
	jr z, .asm_42a27
	ld de, Frameset_6862a
	jp SetObjectFramesetPtr
.asm_42a27
	ld de, Frameset_6862f
	jp SetObjectFramesetPtr
.asm_42a2d
	ld a, HIGH(Func_33f8)
	ld c, LOW(Func_33f8)
	ld b, $02
	jr .asm_42a4b

.asm_42a35
	ld a, HIGH(Func_3407)
	ld c, LOW(Func_3407)
	ld b, $02
	jr .asm_42a4b

.asm_42a3d
	ld a, HIGH(Func_3317)
	ld c, LOW(Func_3317)
	ld b, $02
	jr .asm_42a4b

.asm_42a45
	ld a, HIGH(Func_3326)
	ld c, LOW(Func_3326)
	ld b, $02
.asm_42a4b
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld [hld], a
	ld [hl], c
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and $f0
	ld [hld], a
	xor a
	ld [hld], a
	ld a, b
	ld [hld], a
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld de, Frameset_68698
	jp SetObjectFramesetPtr

.asm_42a68
	ld l, OBJ_VAR_2
	ld a, [hl]
	and a
	jr z, .asm_42a75
	dec [hl]
	ld a, 2
	ld [wCurObjFrameDuration], a
	ret

.asm_42a75
	ld a, [wGlobalCounter]
	rra
	ret c
	ld l, OBJ_VAR_1
	ld a, [hld]
	and a
	jr z, .move_down
	cp $01
	jr z, .turn_around_up
	cp $02
	jr z, .move_up
	cp $03
	jr z, .turn_around_down
	ret

.move_down
	dec [hl] ; OBJ_STATE_DURATION
	jp nz, MoveObjectDown
	ld de, Frameset_6863f
	ld b, $1
	ld c, OBJ_INTERACTION_01
	ld a, 22
	jr .asm_42ac3
.turn_around_up
	dec [hl] ; OBJ_STATE_DURATION
	ret nz
	ld de, Frameset_68616
	ld b, $2
	ld c, OBJ_INTERACTION_TOP_STING
	ld a, 96
	jr .asm_42ac3
.move_up
	dec [hl] ; OBJ_STATE_DURATION
	jp nz, MoveObjectUp
	ld de, Frameset_68634
	ld b, $3
	ld c, OBJ_INTERACTION_01
	ld a, 22
	jr .asm_42ac3
.turn_around_down
	dec [hl] ; OBJ_STATE_DURATION
	ret nz
	ld de, Frameset_6861b
	ld b, $0
	ld c, OBJ_INTERACTION_BOTTOM_STING
	ld a, 96
.asm_42ac3
	ld [hli], a ; OBJ_STATE_DURATION
	ld [hl], b ; OBJ_VAR_1
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or c
	ld [hl], a
	jp SetObjectFramesetPtr

.Func_42acf:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_42b15
	cp $0b
	jr z, .asm_42afe
	cp $0c
	jr z, .asm_42afe
	cp $0a
	jp z, VanishObject2
	cp $28
	jp z, .asm_42a2d
	cp $29
	jp z, .asm_42a35
	cp $04
	jp z, .asm_42a45
	cp $05
	jp z, .asm_42a3d
	rra
	jp nc, .asm_42a35
	jp .asm_42a2d
.asm_42afe
	xor a
	ld [hl], a
	ld l, OBJ_VAR_2
	ld a, $3c
	ld [hld], a
	ld a, [hl]
	and a
	jr z, .asm_42b0f
	ld de, Frameset_68620
	jp SetObjectFramesetPtr
.asm_42b0f
	ld de, Frameset_68625
	jp SetObjectFramesetPtr
.asm_42b15
	ld l, OBJ_VAR_2
	ld a, [hl]
	and a
	jr z, .asm_42b1d
	dec [hl]
	ret

.asm_42b1d
	ld a, [wGlobalCounter]
	rra
	ret c
	ld l, OBJ_VAR_1
	ld a, [hld]
	and a
	jr z, .move_right
	cp $01
	jr z, .turn_around_left
	cp $02
	jr z, .move_left
	cp $03
	jr z, .turn_around_right
	ret

.move_right
	dec [hl] ; OBJ_STATE_DURATION
	jp nz, MoveObjectRight
	ld de, Frameset_68655
	ld b, $1
	ld c, OBJ_INTERACTION_01
	ld a, 22
	jr .asm_42b71
.turn_around_left
	dec [hl] ; OBJ_STATE_DURATION
	ret nz
	ld de, Frameset_6860c
	ld b, $2
	ld c, OBJ_INTERACTION_FRONT_STING
	jr .flip_direction
.move_left
	dec [hl] ; OBJ_STATE_DURATION
	jp nz, MoveObjectLeft
	ld de, Frameset_6864a
	ld b, $3
	ld c, OBJ_INTERACTION_01
	ld a, 22
	jr .asm_42b71
.turn_around_right
	dec [hl] ; OBJ_STATE_DURATION
	ret nz
	ld de, Frameset_68611
	ld b, $0
	ld c, OBJ_INTERACTION_FRONT_STING
.flip_direction
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	ld l, OBJ_STATE_DURATION
	ld a, 96
.asm_42b71
	ld [hli], a ; OBJ_STATE_DURATION
	ld [hl], b ; OBJ_VAR_1
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or c
	ld [hl], a
	jp SetObjectFramesetPtr

KushimushiHorizontalFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(KushimushiVerticalFunc.Func_42acf)
	ld [hld], a
	ld a, LOW(KushimushiVerticalFunc.Func_42acf)
	ld [hld], a
	ld de, Frameset_68611
	call SetObjectFramesetPtr
	ld a, $60
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_HDIR_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 4
	ld [hld], a
	ld a, -5
	ld [hld], a
	ld a, -4
	ld [hl], a
	ret
