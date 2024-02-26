BeamBotFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Init)
	ld [hld], a
	ld a, LOW(.Init)
	ld [hld], a
	ret

.Init:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	jp .Func_46691

.Update:
	ld a, [wCurObjState]
	jumptable

	dw .Func_46691
	dw .Func_46748
	dw .Func_46874
	dw .Func_4687c
	dw .Func_46a32
	dw .Func_46a3c
	dw .Func_46a62
	dw .Func_46a75
	dw .Func_469e2
	dw .Func_469ec
	dw VanishObject2
	dw .Func_46691
	dw .Func_46691
	dw .Func_46691
	dw .Func_46691
	dw .Func_46945
	dw .Func_4696e
	dw .Func_466cb
	dw .Func_46aeb
	dw .Func_46989
	dw .Func_46910
	dw .Func_46918
	dw .Func_468aa
	dw .Func_468dd
	dw .Func_46ab9
	dw .Func_46a88
	dw Func_3263
	dw Func_3272
	dw Func_3281
	dw .Func_46691
	dw .Func_46691
	dw .Func_46691
	dw Func_3191
	dw Func_31af
	dw Func_31cd
	dw Func_31eb
	dw Func_3209
	dw Func_3227
	dw Func_3245
	dw Func_3254
	dw .Func_46a28
	dw .Func_46a1e
	dw .Func_46691
	dw .Func_46691
	dw .Func_46691
	dw .Func_466e7
	dw .Func_4672c
	dw .Func_46691
	dw ObjState_Fall
	dw .Func_46769
	dw ObjState_BumpLeft
	dw ObjState_BumpRight
	dw Func_3326
	dw Func_3317
	dw Func_3335
	dw Func_3344
	dw Func_31fa
	dw Func_31dc
	dw .Func_46691
	dw .Func_46691
	dw .Func_46691
	dw .Func_46691
	dw .Func_46691
	dw .Func_46954
	dw .Func_4697c
	dw ObjState_StandingFall
	dw Func_3371
	dw .Func_469b2
	dw Func_32cc
	dw Func_32db
	dw .Func_468cf
	dw .Func_46902
	dw .Func_46ada
	dw .Func_46aa9
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
	dw .Func_46691
	dw .Func_46691
	dw .Func_46691

.Func_46691:
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld l, OBJ_STATE
	ld a, $30
	ld [hld], a
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_466c0
	res OBJSUBFLAG_HDIR_F, [hl]
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_68e77
	jp SetObjectFramesetPtr
.asm_466c0
	set OBJSUBFLAG_HDIR_F, [hl]
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_68e80
	jp SetObjectFramesetPtr
.Func_466cb:
	ld hl, wCurObjState
	ld a, $41
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_466de
	xor a
	ld [hld], a
	ld de, Frameset_68e77
	call SetObjectFramesetPtr
	ret

.asm_466de
	xor a
	ld [hld], a
	ld de, Frameset_68e80
	call SetObjectFramesetPtr
	ret
.Func_466e7:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_466f8
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_466f8
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_46714
	ld a, [hl]
	cp $19
	ret nz
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_4670e
	ld bc, ObjParams_BeamLeft
	jp CreateObjectAtRelativePos
.asm_4670e
	ld bc, ObjParams_BeamRight
	jp CreateObjectAtRelativePos
.asm_46714
	ld l, OBJ_STATE
	ld a, $2e
	ld [hld], a
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_68ea3, Frameset_68eaa
	call SetObjectFramesetPtr
	ld a, 50
	ld [hli], a
	ret
.Func_4672c:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_4673d
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_4673d
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $13
	ld [wCurObjState], a
	ret
.Func_46748:
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ld l, OBJ_STATE
	ld a, $31
	ld [hld], a
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_68e77, Frameset_68e80
	call SetObjectFramesetPtr
	ld a, 100
	ld [hli], a
	ret
.Func_46769:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_4677a
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_4677a
	ld a, [wTransformation]
	cp TRANSFORMATION_SPLIT
	jr z, .asm_467cf
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jr z, .asm_467cf
	ld c, $2a
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp $1c
	jr c, .asm_4679c
	cp $e4
	jr c, .asm_467cf
.asm_4679c
	ld hl, wCurObjSubState
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
	cp $b8
	jr nc, .asm_467be
	cp $48
	jr nc, .asm_467cf
	ld a, [hli]
	rlca
	jr c, .asm_467ba
	ld de, Frameset_68e89
	jr .asm_467c5
.asm_467ba
	ld a, $13
	ld [hl], a
	ret

.asm_467be
	ld a, [hli]
	rlca
	jr nc, .asm_467ba
	ld de, Frameset_68e96
.asm_467c5
	ld a, $2d
	ld [hl], a
	call SetObjectFramesetPtr
	ld a, 41
	ld [hli], a
	ret

.asm_467cf
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_3543
	and a
	jr nz, .asm_467ea
	ld a, $11
	ld [wCurObjState], a
	ret

.asm_467ea
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_4682b
	ld a, [hl]
	and $0f
	sub $06
	jr nc, .asm_46807
	call ProcessBlockOnLeft
	and $0f
	jr z, .asm_4685f
.asm_46807
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	sub $06
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectLeft_Slow
	ld a, $13
	ld [wCurObjState], a
	ret

.asm_4682b
	ld a, [hl]
	and $0f
	add $05
	cp $10
	jr c, .asm_4683b
	call ProcessBlockOnRight
	and $0f
	jr z, .asm_4685f
.asm_4683b
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	add $05
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectRight_Slow
	ld a, $13
	ld [wCurObjState], a
	ret

.asm_4685f
	ld a, [wGlobalCounter]
	rra
	jr c, .asm_46869
	ld hl, wCurObjFrameDuration
	inc [hl]
.asm_46869
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $13
	ld [wCurObjState], a
	ret
.Func_46874:
	ld hl, wCurObjState
	ld a, $32
	ld [hld], a
	jr .asm_46882
.Func_4687c:
	ld hl, wCurObjState
	ld a, $33
	ld [hld], a
.asm_46882
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_68eb1, Frameset_68eb4
	call SetObjectFramesetPtr
	ld a, 12
	ld [hld], a
	ld a, $02
	ld [wCurObjVar2], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ret
.Func_468aa:
	ld hl, wCurObjState
	ld a, $46
	ld [hld], a
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_68eb7, Frameset_68ec0
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
.Func_468cf:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, $0f
	ld [wCurObjState], a
	ret
.Func_468dd:
	ld hl, wCurObjState
	ld a, $47
	ld [hld], a
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_68eb7, Frameset_68ec0
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
.Func_46902:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, $0f
	ld [wCurObjState], a
	ret
.Func_46910:
	ld hl, wCurObjState
	ld a, $44
	ld [hld], a
	jr .asm_4691e
.Func_46918:
	ld hl, wCurObjState
	ld a, $45
	ld [hld], a
.asm_4691e
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_68eb7, Frameset_68ec0
	call SetObjectFramesetPtr
	inc l
	inc l
	ld a, $02
	ld [hli], a
	xor a
	ld [hli], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
	ret
.Func_46945:
	ld a, $3f
	ld [wCurObjState], a
	ld a, $64
	ld [wCurObjStateDuration], a
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
.Func_46954:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_46961
	ld a, $1c
	ld [wCurObjState], a
	ret

.asm_46961
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_32ea
	ld a, $10
	ld [wCurObjState], a
	ret
.Func_4696e:
	ld hl, wCurObjState
	ld a, $40
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ld a, $07
	ld [wCurObjStateDuration], a
.Func_4697c:
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_32f9
	ld a, $00
	ld [wCurObjState], a
	ret
.Func_46989:
	ld hl, wCurObjState
	ld a, $43
	ld [hld], a
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_68ed3, Frameset_68eda
	call SetObjectFramesetPtr
	ld a, 17
	ld [hli], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ret
.Func_469b2:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_469c3
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_469c3
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $06
	jr z, .asm_469d5
	dec [hl]
	jp nz, Func_3308
	ld a, $01
	ld [wCurObjState], a
	ret

.asm_469d5
	dec [hl]
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	jr c, .asm_469df
	set OBJSUBFLAG_HDIR_F, [hl]
	ret

.asm_469df
	res OBJSUBFLAG_HDIR_F, [hl]
	ret
.Func_469e2:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $38
	jr .asm_469f4
.Func_469ec:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $39
.asm_469f4
	ld [hld], a
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_68eb7, Frameset_68ec0
	call SetObjectFramesetPtr
	ld a, 4
	ld [hli], a
	inc l
	ld a, $02
	ld [hli], a
	xor a
	ld [hli], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
	ret
.Func_46a1e:
	ld hl, wCurObjState
	ld a, $59
	ld [hld], a
	ld b, $02
	jr .asm_46a44
.Func_46a28:
	ld hl, wCurObjState
	ld a, $58
	ld [hld], a
	ld b, $02
	jr .asm_46a44
.Func_46a32:
	ld hl, wCurObjState
	ld a, $34
	ld [hld], a
	ld b, $02
	jr .asm_46a44
.Func_46a3c:
	ld hl, wCurObjState
	ld a, $35
	ld [hld], a
	ld b, $02
.asm_46a44
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [hl]
	and $f0
	ld [hld], a
	ld c, a
	xor a
	ld [hld], a
	ld a, b
	ld [hld], a
	ld a, c
	rlca
	jr c, .asm_46a5c
	ld de, Frameset_68ec9
	jp SetObjectFramesetPtr
.asm_46a5c
	ld de, Frameset_68ece
	jp SetObjectFramesetPtr
.Func_46a62:
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
.Func_46a75:
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

.Func_46a88:
	ld hl, wCurObjState
	ld a, $49
	ld [hld], a
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_68eb7, Frameset_68ec0
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_46aa9:
	ld a, [wDirection]
	and a
	jp nz, Func_3353
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	jr .Func_46ab9
.Func_46ab9:
	ld hl, wCurObjState
	ld a, $48
	ld [hld], a
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_68eb7, Frameset_68ec0
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_46ada:
	ld a, [wDirection]
	and a
	jp z, Func_3362
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	jp .Func_46a88
.Func_46aeb:
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

BeamFunc_Left:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	play_sfx SFX_07C
.Update:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .ok
	dec [hl]
	jr nz, .ok
	ld de, Frameset_68ef3
	call SetObjectFramesetPtr
.ok
	ld bc, Data_60610
	jr BeamFunc

BeamFunc_Right:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	play_sfx SFX_07C
.Update:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .ok
	dec [hl]
	jr nz, .ok
	ld de, Frameset_68ef8
	call SetObjectFramesetPtr
.ok
	ld bc, Data_60630
;	fallthrough

BeamFunc:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .apply_movement
	xor a
	ld [hl], a
	play_sfx SFX_07D
.apply_movement
	jp ApplyObjXMovement
