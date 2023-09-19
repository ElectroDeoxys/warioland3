FallingSnowSpawnerFunc: ; 4952d (12:552d)
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_49544)
	ld [hld], a
	ld a, LOW(.Func_49544)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld a, $1e
	ld [wCurObjStateDuration], a
	ret

.Func_49544:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $56
	ld [hli], a
	xor a
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_49566)
	ld [hld], a
	ld a, LOW(.Func_49566)
	ld [hld], a
	ld bc, ObjParams_FallingSnow
	jp CreateObjectFromCurObjPos

.Func_49566:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $0a
	ld [wCurObjVar2], a
	call MoveObjectUpByVar2
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_4959d)
	ld [hld], a
	ld a, LOW(.Func_4959d)
	ld [hld], a
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld de, Frameset_695c0
	call SetObjectFramesetPtr
	ld a, $1d
	ld [hli], a
	ldh a, [rDIV]
	rra
	ret nc
	ld a, $01
	ld [hl], a
	jp MoveObjectLeftByVar2

.Func_4959d:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $3c
	ld [hli], a
	ld a, [hl]
	and a
	jr z, .asm_495b1
	call MoveObjectRightByVar2
.asm_495b1
	call MoveObjectDownByVar2
	ld hl, wCurObjFlags
	set OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_49544)
	ld [hld], a
	ld a, LOW(.Func_49544)
	ld [hld], a
	ret
; 0x495c2

FallingSnowFunc: ; 495c2 (12:55c2)
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjFlags
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld de, Frameset_6958f
	call SetObjectFramesetPtr
	ld a, $20
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_495ef)
	ld [hld], a
	ld a, LOW(.Func_495ef)
	ld [hld], a
	ld l, OBJ_FLAGS
	bit OBJFLAG_ON_SCREEN_F, [hl]
	ret z
	play_sfx SFX_080
	ret

.Func_495ef:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_695a6
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_49610)
	ld [hld], a
	ld a, LOW(.Func_49610)
	ld [hld], a
	ld l, OBJ_Y_POS
	ld a, [hl]
	add $08
	ld [hli], a
	ret nc
	inc [hl]
	ret

.Func_49610:
	ld a, [wCurObjState]
	and a
	jr z, .asm_49625
	cp $18
	jr z, .asm_49666
	ld de, Frameset_695cb
	call SetObjectFramesetPtr
	ld a, $11
	ld [hli], a
	jr .asm_49650
.asm_49625
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
	and a
	ld bc, Data_603e0
	jp z, ApplyObjYMovement
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld de, Frameset_695af
	call SetObjectFramesetPtr
	ld a, $2d
	ld [hli], a
.asm_49650
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_496ae)
	ld [hld], a
	ld a, LOW(.Func_496ae)
	ld [hld], a
	ld l, OBJ_FLAGS
	bit OBJFLAG_ON_SCREEN_F, [hl]
	ret z
	play_sfx SFX_0A1
	ret

.asm_49666
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_49675)
	ld [hld], a
	ld a, LOW(.Func_49675)
	ld [hld], a
	ld de, Frameset_695d6
	jp SetObjectFramesetPtr

.Func_49675:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
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
	and a
	ld bc, Data_603e0
	jp z, ApplyObjYMovement
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld de, Frameset_695d9
	call SetObjectFramesetPtr
	ld a, $07
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_496ae)
	ld [hld], a
	ld a, LOW(.Func_496ae)
	ld [hld], a
	ret

.Func_496ae:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret
; 0x496bd
