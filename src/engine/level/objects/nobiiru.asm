NobiiruFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_4380e)
	ld [hld], a
	ld a, LOW(.Func_4380e)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, [wCurObjId]
	cp NOBIIRU_LEFT
	jr nz, .left_variant
; right variant
	res OBJSUBFLAG_HDIR_F, [hl]
	jr .asm_437f7
.left_variant
	set OBJSUBFLAG_HDIR_F, [hl]

.asm_437f7
	ld l, OBJ_COLLBOX_BOTTOM
	ld a, $fc
	ld [hli], a
	ld a, $fd
	ld [hli], a
	ld a, $02
	ld [hl], a
	ld de, Frameset_698ff
	call SetObjectFramesetPtr
	ld a, 60
	ld [hli], a
	xor a
	ld [hl], a
	ret

.Func_4380e:
	ld a, [wCurObjVar1]
	jumptable

	dw .Func_4382e
	dw .Func_43876
	dw .Func_438a0
	dw .Func_438c5
	dw .Func_438ea
	dw .Func_43910
	dw .Func_43936
	dw .Func_43956
	dw .Func_4396e
	dw .Func_43994
	dw .Func_439ba
	dw .Func_439e0
	dw .Func_43a06
	dw .Func_43a2c

.Func_4382e:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	play_sfx SFX_079
	ld a, $0c
	ld [wCurObjVar2], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_43857
	call MoveObjectLeftByVar2
	ld de, Frameset_698d8
	ld a, $ff
	ld c, $02
	jr .asm_43861

.asm_43857
	call MoveObjectRightByVar2
	ld de, Frameset_698b1
	ld a, $fd
	ld c, $00
.asm_43861
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_FULL_STING
	ld [hld], a
	ld b, $02

; a = left col
; c = right col
; b = duration
; de = frameset
.SetCollisionAndFrameset:
	ld l, OBJ_COLLBOX_LEFT
	ld [hli], a
	ld [hl], c
.SetFrameset:
	call SetObjectFramesetPtr
	ld a, b
	ld [hli], a
	inc [hl]
	ret

.Func_43876:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $04
	ld [wCurObjVar2], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_43892
	call MoveObjectLeftByVar2
	ld de, Frameset_698db
	ld a, $fc
	ld c, $07
	jr .asm_4389c

.asm_43892
	call MoveObjectRightByVar2
	ld de, Frameset_698b4
	ld a, $f8
	ld c, $03
.asm_4389c
	ld b, $02
	jr .SetCollisionAndFrameset

.Func_438a0:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_438b7
	call MoveObjectLeftByVar2
	ld de, Frameset_698de
	ld a, $f8
	ld c, $0b
	jr .asm_438c1

.asm_438b7
	call MoveObjectRightByVar2
	ld de, Frameset_698b7
	ld a, $f4
	ld c, $07
.asm_438c1
	ld b, $02
	jr .SetCollisionAndFrameset

.Func_438c5:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_438dc
	call MoveObjectLeftByVar2
	ld de, Frameset_698e1
	ld a, $f4
	ld c, $0f
	jr .asm_438e6

.asm_438dc
	call MoveObjectRightByVar2
	ld de, Frameset_698ba
	ld a, $f0
	ld c, $0b
.asm_438e6
	ld b, $02
	jr .SetCollisionAndFrameset

.Func_438ea:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_43901
	call MoveObjectLeftByVar2
	ld de, Frameset_698e4
	ld a, $f0
	ld c, $13
	jr .asm_4390b

.asm_43901
	call MoveObjectRightByVar2
	ld de, Frameset_698bd
	ld a, $ec
	ld c, $0f
.asm_4390b
	ld b, $02
	jp .SetCollisionAndFrameset

.Func_43910:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_43927
	call MoveObjectLeftByVar2
	ld de, Frameset_698e7
	ld a, $ec
	ld c, $17
	jr .asm_43931

.asm_43927
	call MoveObjectRightByVar2
	ld de, Frameset_698c0
	ld a, $e8
	ld c, $13
.asm_43931
	ld b, $14
	jp .SetCollisionAndFrameset

.Func_43936:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, [wCurObjSubState]
	rlca
	ld_obj_frameset Frameset_698ea, Frameset_698c3
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_0B
	ld [hld], a
	ld b, $08
	jp .SetFrameset

.Func_43956:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, [wCurObjSubState]
	rlca
	ld_obj_frameset Frameset_698ed, Frameset_698c6
	ld b, $14
	jp .SetFrameset

.Func_4396e:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_43985
	call MoveObjectRightByVar2
	ld de, Frameset_698f0
	ld a, $f0
	ld c, $13
	jr .asm_4398f

.asm_43985
	call MoveObjectLeftByVar2
	ld de, Frameset_698c9
	ld a, $ec
	ld c, $0f
.asm_4398f
	ld b, $02
	jp .SetCollisionAndFrameset

.Func_43994:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_439ab
	call MoveObjectRightByVar2
	ld de, Frameset_698f3
	ld a, $f4
	ld c, $0f
	jr .asm_439b5

.asm_439ab
	call MoveObjectLeftByVar2
	ld de, Frameset_698cc
	ld a, $f0
	ld c, $0b
.asm_439b5
	ld b, $02
	jp .SetCollisionAndFrameset

.Func_439ba:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_439d1
	call MoveObjectRightByVar2
	ld de, Frameset_698f6
	ld a, $f8
	ld c, $0b
	jr .asm_439db

.asm_439d1
	call MoveObjectLeftByVar2
	ld de, Frameset_698cf
	ld a, $f4
	ld c, $07
.asm_439db
	ld b, $02
	jp .SetCollisionAndFrameset

.Func_439e0:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_439f7
	call MoveObjectRightByVar2
	ld de, Frameset_698f9
	ld a, $fc
	ld c, $07
	jr .asm_43a01

.asm_439f7
	call MoveObjectLeftByVar2
	ld de, Frameset_698d2
	ld a, $f8
	ld c, $03
.asm_43a01
	ld b, $02
	jp .SetCollisionAndFrameset

.Func_43a06:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_43a1d
	call MoveObjectRightByVar2
	ld de, Frameset_698fc
	ld a, $ff
	ld c, $02
	jr .asm_43a27

.asm_43a1d
	call MoveObjectLeftByVar2
	ld de, Frameset_698d5
	ld a, $fd
	ld c, $00
.asm_43a27
	ld b, $02
	jp .SetCollisionAndFrameset

.Func_43a2c:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $0c
	ld [wCurObjVar2], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_43a42
	call MoveObjectRightByVar2
	jp .asm_437f7
.asm_43a42
	call MoveObjectLeftByVar2
	jp .asm_437f7
