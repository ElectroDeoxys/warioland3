YellowBellyBodyFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5139d)
	ld [hld], a
	ld a, LOW(.Func_5139d)
	ld [hld], a
	ld de, Frameset_69780
	call SetObjectFramesetPtr
	ld a, $3c
	ld [hli], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, [hl]
	and $f0
	or $04
	ld [hl], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f8
	ld [hld], a
	ld a, $0a
	ld [hl], a
	xor a
	ld [wDollBoyActiveBarrels], a
	ld [w1d147], a
	ld [wDollBoyHammerRange], a
	ld a, TRUE
	ld [wIsBossBattle], a
	stop_music2
	ret

.Func_5139d:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $1e
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_513bf)
	ld [hld], a
	ld a, LOW(.Func_513bf)
	ld [hld], a
	play_sfx SFX_0CA
	ld hl, Pals_51c81
	jr .asm_513f1

.Func_513bf:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $1e
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_513d9)
	ld [hld], a
	ld a, LOW(.Func_513d9)
	ld [hld], a
	ld hl, Pals_51c99
	jr .asm_513f1
.Func_513d9:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $1e
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_513fb)
	ld [hld], a
	ld a, LOW(.Func_513fb)
	ld [hld], a
	ld hl, Pals_51cb1
.asm_513f1
	ld de, wTempPals2 palette 4
	ld c, 4
	ld b, 3
	jp CopyAndApplyOBPals

.Func_513fb:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $20
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_51419)
	ld [hld], a
	ld a, LOW(.Func_51419)
	ld [hld], a
	ld a, $02
	ld [wBossBattleMusic], a
	call UpdateLevelMusic
	ret

.Func_51419:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, MoveObjectUp_Slow
	ld b, $03
	ldh a, [rDIV]
	and $01
	add b
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $01
	ld [hli], a
	xor a
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_51652)
	ld [hld], a
	ld a, LOW(.Func_51652)
	ld [hld], a
	ld bc, ObjParams_YellowBellyHead
	jp CreateObjectFromCurObjPos

.asm_51442
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_514a4)
	ld [hld], a
	ld a, LOW(.Func_514a4)
	ld [hld], a
	ld a, [wDollBoyHammerRange]
	and a
	jr z, .asm_5145c
	xor a
	ld [wCurObjVar1], a
	ld l, OBJ_SUBSTATE
	bit OBJSUBFLAG_VDIR_F, [hl]
	jr nz, .asm_5147e
	jr .asm_5149a
.asm_5145c
	ld l, OBJ_X_POS
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [wWarioXPos + 0]
	ld b, a
	ld a, [wWarioXPos + 1]
	ld c, a
	ld a, b
	cp d
	jr c, .asm_51483
	jr nz, .asm_51473
	ld a, c
	cp e
	jr c, .asm_51483
.asm_51473
	ld l, OBJ_SUBSTATE
	bit OBJSUBFLAG_VDIR_F, [hl]
	jr nz, .asm_5147e
	ld de, Frameset_697b0
	jr .asm_5148c
.asm_5147e
	ld de, Frameset_697a1
	jr .asm_5149d
.asm_51483
	ld l, OBJ_SUBSTATE
	bit OBJSUBFLAG_VDIR_F, [hl]
	jr z, .asm_5149a
	ld de, Frameset_697bb
.asm_5148c
	call SetObjectFramesetPtr
	inc l
	ld a, $44
	ld [hl], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor OBJSUBFLAG_VDIR | OBJSUBFLAG_HDIR
	ld [hl], a
	ret
.asm_5149a
	ld de, Frameset_69792
.asm_5149d
	call SetObjectFramesetPtr
	ld a, $62
	ld [hli], a
	ret

.Func_514a4:
	ld a, [w1d147]
	and a
	jp nz, .asm_5179a
	ld hl, wCurObjVar1
	ld a, [hl]
	and a
	jr z, .asm_514c9
	dec [hl]
	ret nz
	ld l, OBJ_SUBSTATE
	bit OBJSUBFLAG_VDIR_F, [hl]
	jr nz, .asm_514bf
	ld de, Frameset_69792
	jr .asm_514c2
.asm_514bf
	ld de, Frameset_697a1
.asm_514c2
	call SetObjectFramesetPtr
	ld a, $62
	ld [hli], a
	ret
.asm_514c9
	dec l
	dec [hl]
	jr z, .asm_514eb
	ld a, [hl]
	cp $2f
	ret nz
	play_sfx SFX_07C
	ld l, OBJ_SUBSTATE
	bit OBJSUBFLAG_VDIR_F, [hl]
	jr nz, .asm_514e5
	ld bc, ObjParams_YellowBellyArrowLeft
	jp CreateObjectAtRelativePos
.asm_514e5
	ld bc, ObjParams_YellowBellyArrowRight
	jp CreateObjectAtRelativePos
.asm_514eb
	ld a, [wDollBoyHammerRange]
	and a
	jr nz, .asm_51523
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_51652)
	ld [hld], a
	ld a, LOW(.Func_51652)
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_PRIORITY_F, [hl]
	ld l, OBJ_STATE_DURATION
	ld b, $03
	ldh a, [rDIV]
	and $01
	add b
	ld [hli], a
	inc l
	ld a, $01
	ld [hli], a
	ld [hli], a
	xor a
	ld [wCurObjState], a
	ld l, OBJ_SUBSTATE
	bit OBJSUBFLAG_VDIR_F, [hl]
	jr nz, .asm_5151d
	ld de, Frameset_697e6
	jp SetObjectFramesetPtr
.asm_5151d
	ld de, Frameset_697eb
	jp SetObjectFramesetPtr
.asm_51523
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_515dd)
	ld [hld], a
	ld a, LOW(.Func_515dd)
	ld [hld], a
	ld l, OBJ_STATE_DURATION
	ld a, $03
	ld [hli], a
	inc l
	ld a, $02
	ld [hli], a
	ld a, $02
	ld [hli], a
	xor a
	ld [wCurObjState], a
	ld l, OBJ_SUBSTATE
	bit OBJSUBFLAG_VDIR_F, [hl]
	jr nz, .asm_51548
	ld de, Frameset_69780
	jp SetObjectFramesetPtr
.asm_51548
	ld de, Frameset_69789
	jp SetObjectFramesetPtr

.asm_5154e
	stop_sfx
	ld a, $01
	ld [wDollBoyHammerRange], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_51572)
	ld [hld], a
	ld a, LOW(.Func_51572)
	ld [hld], a
	ld l, OBJ_FLAGS
	res OBJFLAG_PRIORITY_F, [hl]
	ld a, $a6
	ld [wCurObjVar1], a
	ld de, Frameset_697c6
	jp SetObjectFramesetPtr

.Func_51572:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjVar1]
	cp $a6
	jr nz, .asm_51588
	play_sfx SFX_VANISH
	jr .asm_515a8
.asm_51588
	cp $88
	jr nz, .asm_51596
	play_sfx SFX_0A9
	jr .asm_515a8
.asm_51596
	cp $25
	jr nz, .asm_515ab
	play_sfx SFX_0A5
	ld bc, ObjParams_Pump
	call CreateObjectFromCurObjPos
.asm_515a8
	ld a, [wCurObjVar1]
.asm_515ab
	cp $92
	jr nc, .asm_515b7
	ld a, [wCurObjScreenYPos]
	cp $39
	call nc, MoveObjectUp
.asm_515b7
	ld hl, wCurObjVar1
	dec [hl]
	jp z, .asm_514eb
	ld a, [hl]
	cp $37
	ret c
	jr z, .asm_515d0
	and $0f
	jr z, .asm_515d0
	cp $08
	ret nz
	ld hl, Pals_51cc9
	jr .asm_515d3
.asm_515d0
	ld hl, Pals_51cb1
.asm_515d3
	ld de, wTempPals2 palette 4
	ld c, 4
	ld b, 3
	jp CopyAndApplyOBPals

.Func_515dd:
	ld a, [wTransformation]
	cp TRANSFORMATION_PUFFY_WARIO
	jr nz, .asm_515eb
	xor a
	ld [wDollBoyHammerRange], a
	jp .asm_514eb
.asm_515eb
	ld a, [w1d147]
	and a
	jp nz, .asm_5179a
	ld a, [wDollBoyHammerRange]
	and a
	jp z, .asm_514eb
	ld a, LOW(wObj1)
	ld b, LOW(wObj1)
	ld h, HIGH(wObj1)
.asm_515ff
	ld l, OBJ_UNK_07
	add l
	ld l, a
	ld a, [hl] ; OBJ_UNK_07
	cp $4e
	jr nz, .asm_51610
	ld a, l
	sub OBJ_UNK_07 - OBJ_FLAGS
	ld l, a
	ld a, [hli] ; OBJ_FLAGS
	rra
	jr c, .asm_51619
.asm_51610
	ld a, b
	cp LOW(wObj8)
	ret z
	add OBJ_STRUCT_LENGTH
	ld b, a
	jr .asm_515ff
.asm_51619
	inc l
	inc l
	inc l
	inc l
	ld a, [hli]
	and $fe
	ld e, a
	ld d, [hl]
	ld hl, wCurObjXPos
	ld a, [hli]
	and $fe
	ld c, a
	ld b, [hl]
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	jr c, .asm_5163a
	ld a, c
	sub $38
	ld c, a
	ld a, b
	sbc $00
	ld b, a
	jr .asm_51642
.asm_5163a
	ld a, c
	add $38
	ld c, a
	ld a, b
	adc $00
	ld b, a
.asm_51642
	ld a, e
	cp c
	jr nz, .asm_5164b
	ld a, d
	cp b
	jp z, .asm_51442
.asm_5164b
	ld a, $02
	ld [wCurObjVar2], a
	jr .asm_5168e

.Func_51652:
	ld a, [wDollBoyActiveBarrels]
	and a
	jr z, .asm_51662
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	xor a
	ld [wCurObjState], a
	ret
.asm_51662
	ld a, [w1d147]
	and a
	jp nz, .asm_5179a
	ld hl, wCurObjVar1
	ld a, [hli]
	and a
	jr nz, .asm_51688
	inc l
	ld a, [hl]
	dec a
	jr nz, .asm_51688
	ld a, [wWarioScreenYPos]
	ld b, a
	ld a, [wCurObjScreenYPos]
	sub b
	jr c, .asm_51688
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5178c)
	ld [hld], a
	ld a, LOW(.Func_5178c)
	ld [hld], a
	ret
.asm_51688
	ld bc, Data_60950
	call ApplyObjYMovement_Loop
.asm_5168e
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_516bf
	cp $0a
	jp z, .asm_5154e
	xor a
	ld [hld], a
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	ld c, a
	ld a, [hl]
	rlca
	jr c, .asm_516b2
	ld a, c
	cp b
	jr c, .asm_516ba
	jr .asm_516b6
.asm_516b2
	ld a, b
	cp c
	jr c, .asm_516ba
.asm_516b6
	ld a, [hl]
	xor $80
	ld [hl], a
.asm_516ba
	ld a, $02
	ld [wCurObjVar2], a
.asm_516bf
	ld l, OBJ_VAR_1
	ld a, [hl]
	and a
	jr z, .asm_51704
	dec [hl]
	ret nz
	ld a, [wGlobalCounter]
	rra
	jr c, .asm_516d4
	dec l
	ld a, [hl]
	cp $02
	jr c, .asm_516d4
	dec [hl]
.asm_516d4
	ld l, OBJ_SUBSTATE
	ld a, [wDollBoyHammerRange]
	dec a
	jr z, .asm_516ec
	bit OBJSUBFLAG_VDIR_F, [hl]
	jr nz, .asm_516e6
	ld de, Frameset_697e6
	jp SetObjectFramesetPtr
.asm_516e6
	ld de, Frameset_697eb
	jp SetObjectFramesetPtr
.asm_516ec
	play_sfx SFX_101
	bit OBJSUBFLAG_VDIR_F, [hl]
	jr nz, .asm_516fe
	ld de, Frameset_69780
	jp SetObjectFramesetPtr
.asm_516fe
	ld de, Frameset_69789
	jp SetObjectFramesetPtr
.asm_51704
	ld l, OBJ_VAR_3
	ld a, [hl]
	dec a
	jr nz, .asm_51729
	ld a, [wTransformation]
	cp TRANSFORMATION_PUFFY_WARIO
	jr z, .asm_51729
	ld a, [wWarioScreenYPos]
	ld b, a
	ld a, [wCurObjScreenYPos]
	sub b
	jr nc, .asm_51729
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jp z, .asm_51442
	play_sfx SFX_0A8
.asm_51729
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_51759
	ld a, [hli]
	sub $18
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectLeftByVar2
	ld hl, wCurObjSubState
	bit OBJSUBFLAG_VDIR_F, [hl]
	jr nz, .asm_51782
	ld de, Frameset_697b0
	jr .asm_51774
.asm_51759
	ld a, [hli]
	add $18
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectRightByVar2
	ld hl, wCurObjSubState
	bit OBJSUBFLAG_VDIR_F, [hl]
	jr z, .asm_51782
	ld de, Frameset_697bb
.asm_51774
	call SetObjectFramesetPtr
	inc l
	ld a, $44
	ld [hl], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor OBJSUBFLAG_VDIR | OBJSUBFLAG_HDIR
	jr .asm_51785
.asm_51782
	ld a, [hl]
	xor $80
.asm_51785
	ld [hl], a
	ld a, $01
	ld [wCurObjVar2], a
	ret

.Func_5178c:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjScreenXPos]
	cp $c8
	ret nc
	jp MoveObjectDown

.asm_5179a
	xor a
	ld [w1d147], a
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_517ee)
	ld [hld], a
	ld a, LOW(.Func_517ee)
	ld [hld], a
	call Func_30fb
	ld a, [hl]
	and $0f
	dec a
	jr z, .asm_517bd
	ld de, Frameset_697d5
	call SetObjectFramesetPtr
	ld a, $64
	ld [hli], a
	ld a, $01
	ld [hl], a
	ret
.asm_517bd
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5184a)
	ld [hld], a
	ld a, LOW(.Func_5184a)
	ld [hld], a
	ld de, Frameset_69845
	call SetObjectFramesetPtr
	ld a, $65
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_0B
	ld [hli], a
	play_sfx SFX_0A9
	stop_music2
	ret

.Func_517ee:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_5181f
	dec [hl]
	jr z, .asm_5180a
	ld a, [hl]
	and $0f
	jr z, .asm_51812
	cp $08
	ret nz
	ld hl, Pals_51ce1
	jr .asm_51815
.asm_5180a
	play_sfx SFX_0B9
.asm_51812
	ld hl, Pals_51cb1
.asm_51815
	ld de, wTempPals2 palette 4
	ld c, 4
	ld b, 3
	jp CopyAndApplyOBPals
.asm_5181f
	dec l
	ld a, [hld]
	cp $10
	ret nz
	ld a, [hld]
	and a
	ret nz
	xor a
	ld [wCurObjVar1], a
	call .asm_514eb
	ld a, [wCurObjSubState]
	and $0f
	cp $03
	jr z, .asm_5183c
	cp $02
	jr z, .asm_51841
	ret
.asm_5183c
	ld de, OAM_191940
	jr .asm_51844
.asm_51841
	ld de, OAM_191f04
.asm_51844
	ld l, OBJ_OAM_PTR
	ld a, e
	ld [hli], a
	ld [hl], d
	ret

.Func_5184a:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_5186e
	dec [hl]
	jr z, .asm_51861
	ld a, [hl]
	and $0f
	jr z, .asm_51861
	cp $08
	ret nz
	ld hl, Pals_51ce1
	jr .asm_51864
.asm_51861
	ld hl, Pals_51cb1
.asm_51864
	ld de, wTempPals2 palette 4
	ld c, 4
	ld b, 3
	jp CopyAndApplyOBPals
.asm_5186e
	dec l
	ld a, [hld]
	cp $14
	jr nz, .asm_51880
	ld a, [hld]
	and a
	play_sfx z, SFX_0AA
.asm_51880
	ld l, OBJ_FRAMESET_OFFSET
	ld a, [hld]
	cp $20
	ret nz
	ld a, [hld]
	and a
	ret nz
	xor a
	ld [wCurObjFlags], a
	ld a, LOW(wObj1)
	ld b, LOW(wObj1)
	ld h, HIGH(wObj1)
.asm_51893
	ld l, OBJ_UNK_07
	add l
	ld l, a
	ld a, [hl] ; OBJ_UNK_07
	cp $4f
	jr nz, .asm_518a4
	ld a, l
	sub OBJ_UNK_07 - OBJ_FLAGS
	ld l, a
	ld a, [hli] ; OBJ_FLAGS
	rra
	jr c, .asm_518ad
.asm_518a4
	ld a, b
	cp LOW(wObj8)
	ret z
	add OBJ_STRUCT_LENGTH
	ld b, a
	jr .asm_51893
.asm_518ad
	ld a, l
	add $1a
	ld l, a
	ld a, $2f
	ld [hl], a
	jp Func_51c62

PumpFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_518c6)
	ld [hld], a
	ld a, LOW(.Func_518c6)
	ld [hld], a
	ld a, [wGlobalCounter]
	ld [wCurObjVar1], a
.Func_518c6:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld bc, Data_609e0
	call ApplyObjYMovement
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_518db
	dec [hl]
	jr .asm_518f0
.asm_518db
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
	jr nz, .asm_51927
.asm_518f0
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [wCurObjVar1]
	rra
	jr c, .asm_51915
	ld a, [hli]
	sub $06
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	ret nz
	jp MoveObjectLeft_Slow
.asm_51915
	ld a, [hli]
	add $05
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	ret nz
	jp MoveObjectRight_Slow
.asm_51927
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld de, Frameset_6987f
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_51947)
	ld [hld], a
	ld a, LOW(.Func_51947)
	ld [hld], a
	xor a
	ld [wCurObjState], a
	ld l, OBJ_FLAGS
	res OBJFLAG_PRIORITY_F, [hl]
	ret

.Func_51947:
	ld hl, wCurObjState
	ld a, [hl]
	cp $31
	jr z, .asm_5198b
	cp $0a
	jp z, .asm_519e3
	cp $3a
	jp z, .asm_51a03
	cp $58
	jp z, .asm_51a1d
	and $fe
	ret z
	cp $28
	jp z, .asm_51a16
	ld a, $31
	ld [hld], a
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_5197b
	set OBJSUBFLAG_HDIR_F, [hl]
	jr .asm_5197d
.asm_5197b
	res OBJSUBFLAG_HDIR_F, [hl]
.asm_5197d
	xor a
	ld [wCurObjVar2], a
	ld a, $3c
	ld [wCurObjStateDuration], a
	ld l, OBJ_FLAGS
	res OBJFLAG_NO_COLLISION_F, [hl]
	ret
.asm_5198b
	ld hl, wCurObjStateDuration
	dec [hl]
	jr nz, .asm_51996
	xor a
	ld [wCurObjState], a
	ret
.asm_51996
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_519c6
	ld a, [hli]
	sub $06
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr nz, .asm_519bf
.asm_519b9
	ld bc, Data_60a00
	jp ApplyObjXMovement
.asm_519bf
	ld hl, wCurObjSubState
	set 7, [hl]
	jr .asm_519d6
.asm_519c6
	ld a, [hli]
	add $05
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr nz, .asm_519dc
.asm_519d6
	ld bc, Data_60a10
	jp ApplyObjXMovement
.asm_519dc
	ld hl, wCurObjSubState
	res 7, [hl]
	jr .asm_519b9

.asm_519e3
	ld a, $3a
	ld [hl], a
	ld [w1d147], a
	xor a
	ld [wDollBoyHammerRange], a
	ld de, Frameset_69882
	call SetObjectFramesetPtr
	ld a, $1d
	ld [hli], a
	xor a
	ld [wCurObjVar3], a
	play_sfx SFX_0BA
	ret

.asm_51a03
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	and a
	jr z, .asm_51a10
	dec [hl]
	ret
.asm_51a10
	ld bc, Data_60040
	jp ApplyObjYMovement

.asm_51a16
	ld a, $58
	ld [hl], a
	xor a
	ld [wDollBoyHammerRange], a
.asm_51a1d
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjScreenYPos]
	cp $48
	jr nc, .asm_51a2e
	xor a
	ld [wCurObjFlags], a
	ret

.asm_51a2e
	ld a, LOW(wObj1)
	ld b, LOW(wObj1)
	ld h, HIGH(wObj1)
.asm_51a34
	ld l, OBJ_UNK_07
	add l
	ld l, a
	ld a, [hl] ; OBJ_UNK_07
	cp $4d
	jr nz, .asm_51a45
	ld a, l
	sub OBJ_UNK_07 - OBJ_FLAGS
	ld l, a
	ld a, [hli] ; OBJ_FLAGS
	rra
	jr c, .asm_51a4e
.asm_51a45
	ld a, b
	cp LOW(wObj8)
	ret z
	add OBJ_STRUCT_LENGTH
	ld b, a
	jr .asm_51a34
.asm_51a4e
	inc l
	inc l
	ld a, [hli]
	add $08
	ld [wCurObjYPos + 0], a
	ld a, [hli]
	adc $00
	ld [wCurObjYPos + 1], a
	ld a, [hli]
	ld [wCurObjXPos + 0], a
	ld a, [hl]
	ld [wCurObjXPos + 1], a
	ret

YellowBellyArrowFunc:
.Left:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_51a7d)
	ld [hld], a
	ld a, LOW(.Func_51a7d)
	ld [hld], a
	ld a, [wDollBoyHammerRange]
	and a
	jr z, .Func_51a7d
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
	ld a, $02
	ld [wCurObjVar2], a
.Func_51a7d:
	call .Func_51b4b
	ld a, [wCurObjState]
	cp $28
	jr z, .asm_51a9b
	cp $29
	jr z, .asm_51a9b
	and a
	jr nz, .asm_51af7
	call MoveObjectDownByVar2
	ld a, [wDollBoyHammerRange]
	and a
	jp z, MoveObjectLeftByVar2
	jp MoveObjectLeft
.asm_51a9b
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_51aaa)
	ld [hld], a
	ld a, LOW(.Func_51aaa)
	ld [hld], a
	ld a, $04
	ld [wCurObjVar2], a
	ret
.Func_51aaa:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjScreenYPos]
	cp $40
	jr nc, .asm_51abb
	xor a
	ld [wCurObjFlags], a
	ret
.asm_51abb
	call MoveObjectUpByVar2
	jp MoveObjectRight_Fast

.Right:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_51ad9)
	ld [hld], a
	ld a, LOW(.Func_51ad9)
	ld [hld], a
	ld a, [wDollBoyHammerRange]
	and a
	jr z, .Func_51ad9
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
	ld a, $02
	ld [wCurObjVar2], a
.Func_51ad9:
	call .Func_51b4b
	ld a, [wCurObjState]
	cp $28
	jr z, .asm_51b25
	cp $29
	jr z, .asm_51b25
	and a
	jr nz, .asm_51af7
	call MoveObjectDownByVar2
	ld a, [wDollBoyHammerRange]
	and a
	jp z, MoveObjectRightByVar2
	jp MoveObjectRight
.asm_51af7
	ld a, $1e
	ld [wCurObjStateDuration], a
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_51b16)
	ld [hld], a
	ld a, LOW(.Func_51b16)
	ld [hld], a
	stop_music2
	xor a
	ld [wBossBattleMusic], a
	ret

.Func_51b16:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret
.asm_51b25
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_51b34)
	ld [hld], a
	ld a, LOW(.Func_51b34)
	ld [hld], a
	ld a, $04
	ld [wCurObjVar2], a
	ret

.Func_51b34:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjScreenYPos]
	cp $40
	jr nc, .asm_51b45
	xor a
	ld [wCurObjFlags], a
	ret
.asm_51b45
	call MoveObjectUpByVar2
	jp MoveObjectLeft_Fast

.Func_51b4b:
	ld a, [wWarioScreenYPos]
	ld b, a
	ld a, [wCurObjScreenYPos]
	cp b
	jr nc, .asm_51b68
	ld a, [wCurObjSubState]
	rlca
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wCurObjScreenXPos]
	jr c, .asm_51b66
	cp b
	jr c, .asm_51b68
	ret
.asm_51b66
	cp b
	ret c
.asm_51b68
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

YellowBellyHeadFunc:
	ld hl, wCurObjFlags
	set OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_51b7b)
	ld [hld], a
	ld a, LOW(.Func_51b7b)
	ld [hld], a
.Func_51b7b:
	ld a, [wTransformation]
	cp TRANSFORMATION_PUFFY_WARIO
	jr nz, .asm_51b87
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
.asm_51b87
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_51baa
	xor a
	ld [hl], a
	ld a, $1e
	ld [wCurObjStateDuration], a
	ld a, $01
	ld [wDollBoyActiveBarrels], a
	stop_music2
	xor a
	ld [wBossBattleMusic], a
.asm_51baa
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_51bb8
	dec [hl]
	jr nz, .asm_51bb8
	xor a
	ld [wDollBoyActiveBarrels], a
.asm_51bb8
	ld a, LOW(wObj1)
	ld b, LOW(wObj1)
	ld h, HIGH(wObj1)
.asm_51bbe
	ld l, OBJ_UNK_07
	add l
	ld l, a
	ld a, [hl] ; OBJ_UNK_07
	cp $4b
	jr nz, .asm_51bcf
	ld a, l
	sub OBJ_UNK_07 - OBJ_FLAGS
	ld l, a
	ld a, [hli] ; OBJ_FLAGS
	rra
	jr c, .asm_51bd8
.asm_51bcf
	ld a, b
	cp LOW(wObj8)
	ret z
	add OBJ_STRUCT_LENGTH
	ld b, a
	jr .asm_51bbe
.asm_51bd8
	inc l
	inc l
	ld a, [hli]
	add $10
	ld [wCurObjYPos + 0], a
	ld a, [hli]
	adc $00
	ld [wCurObjYPos + 1], a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, l
	add OBJ_VAR_1 - (OBJ_X_POS + 1)
	ld l, a
	ld a, [hli] ; OBJ_VAR_1
	and a
	jr z, .asm_51bf9
	inc a
	jr z, .asm_51c13
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
.asm_51bf9
	inc l
	inc l
	bit OBJSUBFLAG_VDIR_F, [hl]
	ld hl, wCurObjXPos
	ld a, e
	jr nz, .asm_51c0b
	sub $08
	ld [hli], a
	ld a, d
	sbc $00
	ld [hl], a
	ret
.asm_51c0b
	add $08
	ld [hli], a
	ld a, d
	adc $00
	ld [hl], a
	ret
.asm_51c13
	xor a
	ld [wCurObjFlags], a
	ret

YellowBellyPlatformFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set 3, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_51c3f)
	ld [hld], a
	ld a, LOW(.Func_51c3f)
	ld [hld], a
	ld de, Frameset_69893
	call SetObjectFramesetPtr
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f8
	ld [hld], a
	ld a, $f6
	ld [hl], a
	ret

.Func_51c3f:
	ld a, [wCurObjState]
	cp $2f
	ret nz
	ld de, Frameset_69896
	call SetObjectFramesetPtr
	ld a, $5a
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(Func_51c77)
	ld [hld], a
	ld a, LOW(Func_51c77)
	ld [hld], a
	ld a, $03
	ld [wBossBattleMusic], a
	call UpdateLevelMusic
	xor a
	ld [wIsBossBattle], a
;	fallthrough

Func_51c62:
	ld hl, wCurObjUnk02
	ld e, $07
	farcall Func_ba42
	ret

Func_51c77:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret

Pals_51c81:
	rgb  0, 25,  1
	rgb  8,  8,  7
	rgb  9,  5,  0
	rgb  0,  0,  0

	rgb  0, 25,  1
	rgb  8,  8,  7
	rgb  0,  5,  9
	rgb  0,  0,  0

	rgb  0, 25,  1
	rgb  4,  2,  0
	rgb  9,  5,  0
	rgb  0,  0,  0

Pals_51c99:
	rgb  0, 25,  1
	rgb 17, 17, 17
	rgb 20, 10,  0
	rgb  0,  0,  0

	rgb  0, 25,  1
	rgb 17, 17, 17
	rgb  0, 10, 20
	rgb  0,  0,  0

	rgb  0, 25,  1
	rgb 11,  5,  0
	rgb 20, 10,  0
	rgb  0,  0,  0

Pals_51cb1:
	rgb  0, 25,  1
	rgb 31, 31, 28
	rgb 31, 15,  0
	rgb  0,  0,  0

	rgb  0, 25,  1
	rgb 31, 31, 28
	rgb  0, 17, 31
	rgb  0,  0,  0

	rgb  0, 25,  1
	rgb 17,  5,  0
	rgb 31, 15,  0
	rgb  0,  0,  0

Pals_51cc9:
	rgb  0, 25,  1
	rgb 31, 15, 15
	rgb  0, 15, 31
	rgb  0,  0,  0

	rgb  0, 25,  1
	rgb 15, 31, 15
	rgb 30, 30,  0
	rgb  0,  0,  0

	rgb  0, 25,  1
	rgb  0,  5, 17
	rgb  0, 15, 31
	rgb  0,  0,  0

Pals_51ce1:
	rgb  0, 25,  1
	rgb 31, 31, 31
	rgb 17, 31, 17
	rgb 31,  0,  0

	rgb  0, 25,  1
	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  0,  0

	rgb  0, 25,  1
	rgb  0, 25,  0
	rgb 17, 31, 17
	rgb 31,  0,  0
