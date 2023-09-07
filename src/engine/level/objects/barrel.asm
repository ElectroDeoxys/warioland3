Barrel1Func: ; 43451 (10:7451)
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update1)
	ld [hld], a
	ld a, LOW(.Update1)
	ld [hld], a
	ld de, Frameset_68a7b
	call SetObjectFramesetPtr
	ld a, $0a
	ld [hli], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $06
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld a, $f7
	ld [hl], a
	ret

.Update1:
	ld hl, wCurObjFlags
	bit OBJFLAG_STEPPED_F, [hl]
	jr z, .asm_4349c
	res OBJFLAG_STEPPED_F, [hl]
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld de, Frameset_68a7e
	call SetObjectFramesetPtr
	ld a, $11
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update2)
	ld [hld], a
	ld a, LOW(.Update2)
	ld [hld], a
	xor a
	ld [wCurObjVar3], a
	ret

.asm_4349c
	ld a, $0a
	ld [wCurObjStateDuration], a
	ret

.Update2:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_434b4
	dec [hl]
	ret nz
	play_sfx SFX_086
	ret

.asm_434b4
	ld bc, Data_60a50
	jp Func_34fc
; 0x434ba

Barrel2Func: ; 434ba (10:74ba)
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld de, Frameset_68a78
	call SetObjectFramesetPtr
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $06
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld a, $00
	ld [hl], a
	ld a, $31
	ld [wCurObjState], a
	ret

.Update:
	ld a, [wCurObjState]
	jumptable

	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435df
	dw .Func_435e7
	dw .Func_436cf
	dw .Func_436c1
	dw .Func_4360b
	dw .Func_43624
	dw .Func_435df
	dw .Func_435e7
	dw Func_3173
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_4367c
	dw .Func_435de
	dw .Func_435f8
	dw .Func_435fc
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_4365c
	dw .Func_4363d
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_436a5
	dw .Func_436b3
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435c2
	dw .Func_435a6
	dw .Func_435de
	dw ObjState_BumpLeft
	dw ObjState_BumpRight
	dw .Func_435a6
	dw .Func_435a6
	dw Func_3335
	dw Func_3344
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw Func_3371
	dw .Func_435a6
	dw Func_32cc
	dw Func_32db
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_4366b
	dw .Func_4364c
	dw Func_3380
	dw Func_338f
	dw .Func_43689
	dw .Func_43697
	dw Func_339e
	dw Func_33ad
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw .Func_435a6
	dw ObjState_FullThrowLeft
	dw ObjState_FullThrowRight

.Func_435a6:
	ld a, $2f
	ld [wCurObjState], a
	ld de, Frameset_68a8b
	call SetObjectFramesetPtr
	ld a, $0e
	ld [hli], a
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	play_sfx SFX_TEMPLE_ROCK
.Func_435c2:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UNK_02
	farcall DespawnObject
	ret
.Func_435de:
	ret

.Func_435df:
	ld hl, wCurObjState
	ld a, $32
	ld [hld], a
	jr .asm_435ed

.Func_435e7:
	ld hl, wCurObjState
	ld a, $33
	ld [hld], a
.asm_435ed
	ld a, $0c
	ld [wCurObjStateDuration], a
	ld a, $02
	ld [wCurObjVar2], a
	ret

.Func_435f8:
	ld a, $44
	jr .asm_435fe

.Func_435fc:
	ld a, $45
.asm_435fe
	ld [wCurObjState], a
	xor a
	ld [wCurObjVar3], a
	ld a, $02
	ld [wCurObjVar2], a
	ret

.Func_4360b:
	ld hl, wCurObjState
	ld a, $36
	ld [hld], a
	dec l
	ld a, $41
	ld [hld], a
	ld a, $c0
	ld [hld], a
	ld a, $01
	ld [hld], a
	ld de, Frameset_68a78
	call SetObjectFramesetPtr
	jp Func_3335
.Func_43624:
	ld hl, wCurObjState
	ld a, $37
	ld [hld], a
	dec l
	ld a, $41
	ld [hld], a
	ld a, $e0
	ld [hld], a
	ld a, $01
	ld [hld], a
	ld de, Frameset_68a78
	call SetObjectFramesetPtr
	jp Func_3344

.Func_4363d:
	ld a, $49
	ld [wCurObjState], a
	ld de, Frameset_68a78
	call SetObjectFramesetPtr
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_4364c:
	ld a, [wDirection]
	and a
	jp nz, Func_3353
	ld hl, wCurObjSubState
	ld a, [hl]
	xor $80
	ld [hl], a
	jr .Func_4365c

.Func_4365c:
	ld a, $48
	ld [wCurObjState], a
	ld de, Frameset_68a78
	call SetObjectFramesetPtr
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_4366b:
	ld a, [wDirection]
	and a
	jp z, Func_3362
	ld hl, wCurObjSubState
	ld a, [hl]
	xor $80
	ld [hl], a
	jp .Func_4363d

.Func_4367c:
	ld hl, wCurObjAction
	ld a, $9f
	ld [hld], a
	ld a, $42
	ld [hld], a
	dec l
	xor a
	ld [hl], a
	ret

.Func_43689:
	ld a, $5e
	ld [wCurObjState], a
	ld de, Frameset_68a6f
	call SetObjectFramesetPtr
	jp ObjState_FullThrowLeft
.Func_43697:
	ld a, $5f
	ld [wCurObjState], a
	ld de, Frameset_68a66
	call SetObjectFramesetPtr
	jp ObjState_FullThrowRight
.Func_436a5:
	ld de, Frameset_68a6f
	call SetObjectFramesetPtr
	ld a, HIGH(Func_33f8)
	ld c, LOW(Func_33f8)
	ld b, $02
	jr .asm_436db

.Func_436b3:
	ld de, Frameset_68a66
	call SetObjectFramesetPtr
	ld a, HIGH(Func_3407)
	ld c, LOW(Func_3407)
	ld b, $02
	jr .asm_436db

.Func_436c1:
	ld de, Frameset_68a6f
	call SetObjectFramesetPtr
	ld a, HIGH(Func_3317)
	ld c, LOW(Func_3317)
	ld b, $02
	jr .asm_436db

.Func_436cf:
	ld de, Frameset_68a66
	call SetObjectFramesetPtr
	ld a, HIGH(Func_3326)
	ld c, LOW(Func_3326)
	ld b, $02
.asm_436db
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld [hld], a
	ld [hl], c
	ld l, OBJ_VAR_3
	xor a
	ld [hld], a
	ld [hl], b
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret
; 0x436ea
