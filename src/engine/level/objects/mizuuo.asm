MizuuoFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update1)
	ld [hld], a
	ld a, LOW(.Update1)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld de, Frameset_686e5
	call SetObjectFramesetPtr
	inc l
	ld a, $30
	ld [hli], a
	ld a, $08
	ld [hl], a
	jp MoveObjectLeftByVar2

.Update1:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_48776
	dec [hl]
	ret nz
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor $80
	ld [hl], a
	rlca
	jr c, .asm_48770
	ld de, Frameset_686e5
	jp SetObjectFramesetPtr

.asm_48770
	ld de, Frameset_686ea
	jp SetObjectFramesetPtr

.asm_48776
	inc l
	ld a, [hl]
	cp $5f
	jr z, .asm_487a1
	dec [hl]
	jr z, .asm_48789
	ld a, [wCurObjSubState]
	rlca
	jp c, MoveObjectRight
	jp MoveObjectLeft
.asm_48789
	ld a, [wCurObjSubState]
	rlca
	ld_obj_frameset Frameset_68713, Frameset_6871e
	call SetObjectFramesetPtr
	ld a, $22
	ld [hli], a
	ld a, $60
	ld [hl], a
	ret

.asm_487a1
	dec [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update2)
	ld [hld], a
	ld a, LOW(.Update2)
	ld [hld], a
	ld a, [wCurObjSubState]
	rlca
	ld_obj_frameset Frameset_686ef, Frameset_686f8
	call SetObjectFramesetPtr
	ld a, $19
	ld [hli], a
	ret

.Update2:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update3)
	ld [hld], a
	ld a, LOW(.Update3)
	ld [hld], a
	ld a, [wCurObjSubState]
	rlca
	ld_obj_frameset Frameset_686a4, Frameset_686b9
	call SetObjectFramesetPtr
	ld a, $5d
	ld [hli], a
	ret

.Update3:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr nz, .asm_48810
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jr z, .asm_48812
	ld a, [hl]
	cp $24
	ret nz
	play_sfx SFX_07F
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_4880a
	ld bc, ObjParams_MizzouProjectileLeft
	jp CreateObjectAtRelativePos
.asm_4880a
	ld bc, ObjParams_MizzouProjectileRight
	jp CreateObjectAtRelativePos
.asm_48810
	xor a
	ld [hl], a
.asm_48812
	ld a, [wCurObjSubState]
	rlca
	ld_obj_frameset Frameset_68701, Frameset_6870a
	call SetObjectFramesetPtr
	ld a, $19
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update4)
	ld [hld], a
	ld a, LOW(.Update4)
	ld [hld], a
	ret

.Update4:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update1)
	ld [hld], a
	ld a, LOW(.Update1)
	ld [hld], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_4884d
	ld de, Frameset_686e5
	jp SetObjectFramesetPtr

.asm_4884d
	ld de, Frameset_686ea
	jp SetObjectFramesetPtr

MizzouProjectileFunc_Left:
	call MoveObjectLeft_Fast
	jr MizzouProjectileFunc
MizzouProjectileFunc_Right:
	call MoveObjectRight_Fast
MizzouProjectileFunc:
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr nz, .asm_488b5
	ld a, [wCurObjVar1]
	and a
	jr z, .asm_4888b
	call Func_3543
	and a
	jr nz, .asm_488b5
	ld a, [wIsInWaterOrSand]
	and a
	jr nz, .in_water
	ld bc, Data_60740
	jr .asm_4888e
.asm_4888b
	ld bc, Data_60700
.asm_4888e
	call ApplyObjYMovement
	ld a, [wCurObjState]
	and a
	jr nz, .asm_488b5
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret nz
	inc l
	ld a, $01
	ld [hl], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_488af
	ld de, Frameset_686d8
	jp SetObjectFramesetPtr

.asm_488af
	ld de, Frameset_686db
	jp SetObjectFramesetPtr

.asm_488b5
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld de, Frameset_686de
	call SetObjectFramesetPtr
	ld a, $17
	ld [hli], a
	ret

.in_water
	xor a
	ld [wCurObjFlags], a
	ret

.Update:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret
