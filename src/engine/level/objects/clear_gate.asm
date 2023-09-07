ClearGate3Func: ; 4379b (10:779b)
	ld de, Frameset_698ae
	jr ClearGateFunc
ClearGate2Func: ; 437a0 (10:77a0)
	ld de, Frameset_698ab
	jr ClearGateFunc
ClearGate1Func: ; 437a5 (10:77a5)
	ld de, Frameset_698a8
;	fallthrough
ClearGateFunc: ; 437a8 (10:77a8)
	call SetObjectFramesetPtr
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $ea
	ld [hld], a
	ld a, $fe
	ld [hl], a
	ld a, [wIsMinigameCleared]
	and a
	ret z
	ld a, 32
	ld [wCurObjVar2], a
	jp MoveObjectUpByVar2

.Update:
	ret
