BigLeafSpawnerFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.SpawnSet1)
	ld [hld], a
	ld a, LOW(.SpawnSet1)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, 20
	ld [wCurObjStateDuration], a
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ret

; waits state duration then spawns 2 leaves
.SpawnSet1:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld hl, wCurObjXPos
	ld a, [hli]
	add 22
	ld e, a
	ld a, [hl]
	jr nc, .asm_42bd4
	inc a
.asm_42bd4
	ld d, a
	ld a, [wWarioXPos + 0]
	cp d
	jr c, .asm_42be1
	ret nz
	ld a, [wWarioXPos + 1]
	cp e
	ret nc
.asm_42be1
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	and a
	jr z, .spawn_leaves
	dec [hl]
	ret
.spawn_leaves
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.SpawnSet2)
	ld [hld], a
	ld a, LOW(.SpawnSet2)
	ld [hld], a
	ld a, 160
	ld [wCurObjStateDuration], a
	ld bc, ObjParams_BigLeaf1
	call CreateObjectAtRelativePos
	ld bc, ObjParams_BigLeaf3
	jp CreateObjectAtRelativePos

; waits state duration then spawns 1 leaf
.SpawnSet2:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.SpawnSet1)
	ld [hld], a
	ld a, LOW(.SpawnSet1)
	ld [hld], a
	ld a, 80
	ld [wCurObjStateDuration], a
	ld bc, ObjParams_BigLeaf2
	jp CreateObjectAtRelativePos

BigLeaf1Func:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjFlags
	set OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld a, 18
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(BigLeafFunc)
	ld [hld], a
	ld a, LOW(BigLeafFunc)
	ld [hld], a
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld de, Frameset_68732
	call SetObjectFramesetPtr
	ret

BigLeafFunc:
BigLeaf2Func:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjFlags
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld de, Frameset_68729
	call SetObjectFramesetPtr
	ret

.destroy:
	xor a
	ld [wCurObjFlags], a
	ret

.Update:
	call SetOneWayPlatformAction
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_42c9a
	cp $0a
	jp z, VanishObject2
	cp $0b
	jr c, .destroy
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_42c93
	ld a, $01
	jr .asm_42c95
.asm_42c93
	ld a, $02
.asm_42c95
	ld [wCurObjStateDuration], a
	xor a
	ld [hl], a
.asm_42c9a
	ld a, [wCurObjStateDuration]
	and a
	jr z, .asm_42cab
	dec a
	jr nz, .asm_42ca8
	call MoveObjectRight
	jr .asm_42cab

.asm_42ca8
	call MoveObjectLeft
.asm_42cab
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	jr z, .asm_42cc5
	res OBJFLAG_STEPPED_F, [hl]
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld b, $01
	call AddYOffset
	call HandleDownwardsFloorTransition
	call MoveObjectDown
	jr .asm_42ccd

.asm_42cc5
	ld a, [wGlobalCounter]
	rra
	ret nc
	call MoveObjectDown
.asm_42ccd
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
	ret z
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_42d0e)
	ld [hld], a
	ld a, LOW(.Func_42d0e)
	ld [hld], a
	ld de, Frameset_6873b
	call SetObjectFramesetPtr
	ld a, $14
	ld [hli], a
	ld l, OBJ_SCREEN_Y_POS
	ld a, [hli]
	cp $b8
	ret nc
	ld a, [hl]
	cp $b8
	ret nc
	play_sfx SFX_08F
	ret

.Func_42d0e:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret
