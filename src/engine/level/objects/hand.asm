HandFunc:
	ld hl, wCurObjFlags
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_COLLBOX_BOTTOM
	ld a, -12
	ld [hli], a
	ld a, -6
	ld [hli], a
	ld a, 5
	ld [hl], a
	ld l, OBJ_STATE_DURATION
	ld a, 50
	ld [hli], a
	xor a
	ld [hl], a ; var1
	ret

.Update:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_4778e
	cp $2e
	jr z, .asm_4778e
	cp $2f
	jr nz, .asm_4778c
	ld a, $2e
	ld [hl], a
	ld b, 11
	call .ApplyOffsetToWario
	jr .asm_4778e
.asm_4778c
	xor a
	ld [hl], a
.asm_4778e
	ld a, [wCurObjVar1]
	jumptable

	dw .Func_477b2
	dw .Func_477de
	dw .Func_477f3
	dw .Func_4780e
	dw .Func_47825
	dw .Func_4783c
	dw .Func_47853
	dw .Func_4786a
	dw .Func_47881
	dw .Func_47896
	dw .Func_478e1
	dw .Func_47903
	dw .Func_47925
	dw .Func_47947
	dw .Func_47966
	dw .Invisible

.Func_477b2:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [wIsInSand]
	and a
	jr nz, .in_sand
	dec [hl]
	ret nz
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld de, Frameset_690ab
	call SetObjectFramesetPtr
	ld a, 41
	ld [hli], a
	inc [hl]
	play_sfx SFX_081
	ret
.in_sand
	ld a, 50
	ld [hl], a
	ret

.Func_477de:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_690b4
	call SetObjectFramesetPtr
	ld a, 1
	ld [hli], a
	inc [hl]
	ret

.Func_477f3:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_690b7
	call SetObjectFramesetPtr
	ld a, 1
	ld [hli], a
	inc [hl]
	inc l
	ld a, 4
	ld [hl], a
	jp MoveObjectUpByVar2

.Func_4780e:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_690ba
	call SetObjectFramesetPtr
	ld a, 1
	ld [hli], a
	inc [hl]
	jp MoveObjectUpByVar2

.Func_47825:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_690bd
	call SetObjectFramesetPtr
	ld a, 1
	ld [hli], a
	inc [hl]
	jp MoveObjectUpByVar2

.Func_4783c:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_690c0
	call SetObjectFramesetPtr
	ld a, 1
	ld [hli], a
	inc [hl]
	jp MoveObjectUpByVar2

.Func_47853:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_690c3
	call SetObjectFramesetPtr
	ld a, 1
	ld [hli], a
	inc [hl]
	jp MoveObjectUpByVar2

.Func_4786a:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_690c6
	call SetObjectFramesetPtr
	ld a, 1
	ld [hli], a
	inc [hl]
	jp MoveObjectUpByVar2

.Func_47881:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_690c9
	call SetObjectFramesetPtr
	ld a, 56
	ld [hli], a
	inc [hl]
	ret

.Func_47896:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp 49
	jr nc, .asm_478be
	cp 26
	jr c, .asm_478b0
	ld a, [wCurObjScreenYPos]
	sub 4
	ld b, a
	ld a, [wWarioScreenYPos]
	cp b
	jr nc, .asm_478be
	dec [hl]
	ret

.asm_478b0
	ld a, [wCurObjState]
	cp $2e
	jr nz, .asm_478be
	ld b, 7
	call .ApplyOffsetToWario
	ld l, OBJ_STATE_DURATION
.asm_478be
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	dec [hl]
	ret nz
	ld de, Frameset_690dc
	call SetObjectFramesetPtr
	ld a, 2
	ld [hli], a
	inc [hl]
	inc l
	ld a, 6
	ld [hl], a
	call MoveObjectDownByVar2
	ld a, [wCurObjState]
	cp $2e
	ret nz
	ld b, 9
	jp .ApplyOffsetToWario

.Func_478e1:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_690df
	call SetObjectFramesetPtr
	ld a, 2
	ld [hli], a
	inc [hl]
	call MoveObjectDownByVar2
	ld a, [wCurObjState]
	cp $2e
	ret nz
	ld b, 8
	jp .ApplyOffsetToWario

.Func_47903:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_690e2
	call SetObjectFramesetPtr
	ld a, 2
	ld [hli], a
	inc [hl]
	call MoveObjectDownByVar2
	ld a, [wCurObjState]
	cp $2e
	ret nz
	ld b, 6
	jp .ApplyOffsetToWario

.Func_47925:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_690e5
	call SetObjectFramesetPtr
	ld a, 2
	ld [hli], a
	inc [hl]
	call MoveObjectDownByVar2
	ld a, [wCurObjState]
	cp $2e
	ret nz
	ld b, 8
	jp .ApplyOffsetToWario

.Func_47947:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_690e8
	call SetObjectFramesetPtr
	ld a, 2
	ld [hli], a
	inc [hl]
	ld a, [wCurObjState]
	cp $2e
	ret nz
	ld b, 0
	jp .ApplyOffsetToWario

.Func_47966:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_690eb
	call SetObjectFramesetPtr
	ld a, 41
	ld [hli], a
	inc [hl]
	ld a, [wCurObjState]
	cp $2e
	ret nz
	xor a
	ld [wAutoMoveState], a
	ld [wCurObjState], a
	ret
	ld b, 0
	jp .ApplyOffsetToWario

.Invisible:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, 50
	ld [hli], a
	xor a
	ld [hl], a
	ld hl, wCurObjFlags
	set OBJFLAG_INVISIBLE_F, [hl]
	ret

.ApplyOffsetToWario:
	ld l, OBJ_Y_POS
	ld a, [hli]
	sub b
	ld [wWarioYPos + 1], a
	ld a, [hli]
	sbc 0
	ld [wWarioYPos + 0], a
	ld a, [hli]
	ld [wWarioXPos + 1], a
	ld a, [hl]
	ld [wWarioXPos + 0], a
	ret
