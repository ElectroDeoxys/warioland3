TeruteruFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Init)
	ld [hld], a
	ld a, LOW(.Init)
	ld [hld], a
	ret

.Init:
	ld a, [wTransformation]
	cp TRANSFORMATION_BLIND
	jr z, .asm_448ed
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
.asm_448ed
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, [hl]
	and $f0
	or $08
	ld [hl], a
	jp .Func_44a72

.Update:
	ld hl, wCurObjFlags
	ld a, [wTransformation]
	cp TRANSFORMATION_BLIND
	jr nz, .asm_44911
	set OBJFLAG_INVISIBLE_F, [hl]
	jr .asm_44913
.asm_44911
	res OBJFLAG_INVISIBLE_F, [hl]
.asm_44913
	ld a, [wCurObjState]
	jumptable

	dw .Func_44a72
	dw .Func_44a97
	dw .Func_44c3f
	dw .Func_44c49
	dw .Func_44c84
	dw .Func_44c8e
	dw .Func_44caa
	dw .Func_44cbd
	dw .Func_44c3f
	dw .Func_44c49
	dw VanishObject2
	dw .Func_44a72
	dw .Func_44a72
	dw .Func_44a72
	dw .Func_449d1
	dw .Func_44be1
	dw .Func_44c12
	dw .Func_44a72
	dw .Func_44d27
	dw .Func_44a72
	dw .Func_44bb9
	dw .Func_44bc0
	dw .Func_44b61
	dw .Func_44b8d
	dw .Func_44cff
	dw .Func_44cd0
	dw Func_3263
	dw Func_3272
	dw Func_3281
	dw .Func_44a72
	dw .Func_44a72
	dw .Func_44a72
	dw Func_3191
	dw Func_31af
	dw Func_31cd
	dw Func_31eb
	dw Func_3209
	dw Func_3227
	dw Func_3245
	dw Func_3254
	dw .Func_44c7a
	dw .Func_44c70
	dw .Func_44a72
	dw .Func_44a72
	dw .Func_44a72
	dw .Func_44a09
	dw .Func_44a25
	dw .Func_44a5d
	dw ObjState_Fall
	dw .Func_44ac1
	dw ObjState_BumpLeft
	dw ObjState_BumpRight
	dw Func_3326
	dw Func_3317
	dw Func_3335
	dw Func_3344
	dw Func_31fa
	dw Func_31dc
	dw .Func_44a72
	dw .Func_44a72
	dw .Func_44a72
	dw .Func_44a72
	dw .Func_44a72
	dw .Func_44bf8
	dw .Func_44c32
	dw ObjState_StandingFall
	dw Func_3371
	dw .Func_44a72
	dw Func_32cc
	dw Func_32db
	dw .Func_44b7f
	dw .Func_44bab
	dw .Func_44d16
	dw .Func_44cef
	dw Func_3380
	dw Func_338f
	dw ObjState_FullThrowLeft
	dw ObjState_FullThrowRight
	dw Func_339e
	dw Func_33ad
	dw Func_31a0
	dw Func_31be
	dw Func_31dc
	dw Func_31fa
	dw Func_3218
	dw Func_3236
	dw Func_32cc
	dw Func_32db
	dw Func_33f8
	dw Func_3407
	dw .Func_44b2d
	dw .Func_449d7
	dw .Func_44a72

.Func_449d1:
	ld a, $5b
	ld [wCurObjState], a
	ret

.Func_449d7:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wTransformation]
	cp TRANSFORMATION_BLIND
	jr nz, .asm_449ff
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_Y_POS
	ld a, [wWarioYPos + 1]
	sub $0c
	ld [hli], a
	ld a, [wWarioYPos + 0]
	sbc $00
	ld [hli], a
	ld a, [wWarioXPos + 1]
	ld [hli], a
	ld a, [wWarioXPos + 0]
	ld [hli], a
	ret

.asm_449ff
	ld a, [wDirection]
	and a
	jp z, .Func_44c3f
	jp .Func_44c49

.Func_44a09:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $2e
	ld [wCurObjState], a
	ld de, Frameset_68b8b
	call SetObjectFramesetPtr
	ld a, 40
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_38
	ld [hli], a
	ret

.Func_44a25:
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_44a46
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr z, .asm_44a43
	jr c, .asm_44a40
	call MoveObjectLeft
	jr .asm_44a43
.asm_44a40
	call MoveObjectRight
.asm_44a43
	jp MoveObjectDown_Fast
.asm_44a46
	ld a, $2f
	ld [wCurObjState], a
	ld de, Frameset_68bae
	call SetObjectFramesetPtr
	ld a, 80
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hli], a
	ret

.Func_44a5d:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $3c
	jr nz, .asm_44a6b
	ld de, Frameset_68b90
	call SetObjectFramesetPtr
.asm_44a6b
	dec [hl]
	jp nz, MoveObjectUp
	jp .asm_44b4c

.Func_44a72:
	ld hl, wCurObjCollBoxRight
	ld a, $06
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld a, $f1
	ld [hld], a
	ld a, $ec
	ld [hld], a
	ld l, OBJ_SUBSTATE
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_44a95
	res OBJSUBFLAG_HDIR_F, [hl]
	jr .Func_44a97
.asm_44a95
	set OBJSUBFLAG_HDIR_F, [hl]
.Func_44a97:
	ld hl, wCurObjState
	ld a, $31
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_44aa6
	ld de, Frameset_68b64
	jr .asm_44aa9
.asm_44aa6
	ld de, Frameset_68b6d
.asm_44aa9
	xor a
	ld [hld], a
	call SetObjectFramesetPtr
	inc l
	ld a, $32
	ld [hl], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hli], a
	ld a, $ec
	ld [hli], a
	ld a, $f1
	ld [hl], a
	ret

.Func_44ac1:
	ld a, [wTransformation]
	cp TRANSFORMATION_BLIND
	jr z, .asm_44afd
	ld c, $2a
	ld a, [wCurObjScreenYPos]
	add c
	ld b, a
	ld a, [wWarioScreenYPos]
	add c
	sub b
	cp $18
	jr c, .asm_44afd
	cp $80
	jr nc, .asm_44afd
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
	cp $e8
	jr nc, .asm_44aee
	cp $18
	jr nc, .asm_44afd
.asm_44aee
	ld a, $2d
	ld [wCurObjState], a
	ld de, Frameset_68b84
	call SetObjectFramesetPtr
	ld a, 20
	ld [hli], a
	ret

.asm_44afd
	ld bc, Data_604c0
	call ApplyObjYMovement_Loop
	ld hl, wCurObjVar1
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_44b17
	dec [hl]
	ld a, [hl]
	and a
	jp nz, MoveObjectLeft
	ld de, Frameset_68b76
	jr .asm_44b21
.asm_44b17
	inc [hl]
	ld a, [hl]
	cp $64
	jp nz, MoveObjectRight
	ld de, Frameset_68b7d
.asm_44b21
	call SetObjectFramesetPtr
	ld a, 26
	ld [hli], a
	ld a, $5a
	ld [wCurObjState], a
	ret

.Func_44b2d:
	ld bc, Data_604c0
	call ApplyObjYMovement_Loop
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $09
	jr z, .asm_44b3f
	dec [hl]
	jr z, .asm_44b4c
	ret

.asm_44b3f
	dec [hl]
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	jr c, .asm_44b49
	set OBJSUBFLAG_HDIR_F, [hl]
	ret

.asm_44b49
	res OBJSUBFLAG_HDIR_F, [hl]
	ret

.asm_44b4c
	ld l, OBJ_STATE
	ld a, $31
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_44b5b
	ld de, Frameset_68b64
	jp SetObjectFramesetPtr
.asm_44b5b
	ld de, Frameset_68b6d
	jp SetObjectFramesetPtr

.Func_44b61:
	ld hl, wCurObjState
	ld a, $46
	ld [hld], a
	call Func_30fb
	ld a, [hl]
	and $0f
	dec a
	jp z, VanishObject2
	ld de, Frameset_68ba5
	call SetObjectFramesetPtr
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
.Func_44b7f:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, $0f
	ld [wCurObjState], a
	ret

.Func_44b8d:
	ld hl, wCurObjState
	ld a, $47
	ld [hld], a
	call Func_30fb
	ld a, [hl]
	and $0f
	dec a
	jp z, VanishObject2
	ld de, Frameset_68ba5
	call SetObjectFramesetPtr
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
.Func_44bab:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, $0f
	ld [wCurObjState], a
	ret

.Func_44bb9:
	ld a, $44
	ld [wCurObjState], a
	jr .asm_44bc5
.Func_44bc0:
	ld a, $45
	ld [wCurObjState], a
.asm_44bc5
	ld de, Frameset_68ba5
	call SetObjectFramesetPtr
	ld l, OBJ_VAR_2
	ld a, $02
	ld [hli], a
	xor a
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hli], a
	ld a, $f9
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ret

.Func_44be1:
	ld a, $3f
	ld [wCurObjState], a
	ld a, $64
	ld [wCurObjStateDuration], a
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	or $08
	ld [hl], a
.Func_44bf8:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_44c05
	ld a, $1c
	ld [wCurObjState], a
	ret

.asm_44c05
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_32ea
	ld a, $10
	ld [wCurObjState], a
	ret

.Func_44c12:
	ld hl, wCurObjState
	ld a, $40
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_68b99
	call SetObjectFramesetPtr
	ld a, 80
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hli], a
	ld a, $ec
	ld [hli], a
	ld a, $f1
	ld [hl], a
.Func_44c32:
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, MoveObjectUp
	ld a, $00
	ld [wCurObjState], a
	ret

.Func_44c3f:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $38
	jr .asm_44c51
.Func_44c49:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $39
.asm_44c51
	ld [hld], a
	ld de, Frameset_68ba5
	call SetObjectFramesetPtr
	ld a, 4
	ld [hli], a
	inc l
	ld a, $02
	ld [hli], a
	xor a
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hli], a
	ld a, $f9
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ret

.Func_44c70:
	ld hl, wCurObjState
	ld a, $59
	ld [hld], a
	ld b, $02
	jr .asm_44c96
.Func_44c7a:
	ld hl, wCurObjState
	ld a, $58
	ld [hld], a
	ld b, $02
	jr .asm_44c96
.Func_44c84:
	ld hl, wCurObjState
	ld a, $34
	ld [hld], a
	ld b, $02
	jr .asm_44c96
.Func_44c8e:
	ld hl, wCurObjState
	ld a, $35
	ld [hld], a
	ld b, $02
.asm_44c96
	ld a, [hl]
	and $f0
	ld [hld], a
	xor a
	ld [hld], a
	ld a, b
	ld [hld], a
	ld de, Frameset_68ba2
	call SetObjectFramesetPtr
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

.Func_44caa:
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
	jp Func_3335

.Func_44cbd:
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
	jp Func_3344

.Func_44cd0:
	ld a, $49
	ld [wCurObjState], a
	ld de, Frameset_68ba5
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_TOP
	ld a, $f9
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	or $08
	ld [hl], a
.Func_44cef:
	ld a, [wDirection]
	and a
	jp nz, Func_3353
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	jr .Func_44cff

.Func_44cff:
	ld a, $48
	ld [wCurObjState], a
	ld de, Frameset_68ba5
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_TOP
	ld a, $f9
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_44d16:
	ld a, [wDirection]
	and a
	jp z, Func_3362
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	jp .Func_44cd0

.Func_44d27:
	ld hl, wCurObjAction
	ld a, $9f
	ld [hld], a
	ld a, $42
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
	ret
