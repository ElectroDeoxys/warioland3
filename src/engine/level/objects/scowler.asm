ScowlerFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_54520)
	ld [hld], a
	ld a, LOW(.Func_54520)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, [hl]
	and $f0
	or $04
	ld [hld], a
	and $0f
	swap a
	add a
	add $48
	ld [hl], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $08
	ld [hld], a
	ld a, $f7
	ld [hld], a
	ld a, $f8
	ld [hl], a
	ld de, Frameset_69a5f
	call SetObjectFramesetPtr
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [wDollBoyActiveBarrels], a
	ld [w1d147], a
	ret

.Func_54520:
	ld a, TRUE
	ld [wIsBossBattle], a
	ld a, $02
	ld [wBossBattleMusic], a
	call UpdateLevelMusic
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_5458a)
	ld [hld], a
	ld a, LOW(.Func_5458a)
	ld [hld], a
	ld bc, ObjParams_ScrowlerTentacleRight
	call CreateObjectFromCurObjPos
	ld bc, ObjParams_ScrowlerTentacleLeft
	jp CreateObjectFromCurObjPos

.Func_54542:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret nz
	ld de, Frameset_69b03
	call SetObjectFramesetPtr
	ld l, OBJ_Y_POS
	ld a, [hli]
	ld [wWarioYPos + 1], a
	ld a, [hli]
	ld [wWarioYPos + 0], a
	ld a, [hli]
	ld [wWarioXPos + 1], a
	ld a, [hl]
	ld [wWarioXPos + 0], a
	ret

.asm_54563
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_54542)
	ld [hld], a
	ld a, LOW(.Func_54542)
	ld [hld], a
	ld a, $1e
	ld [wCurObjStateDuration], a
	ret

.asm_54572
	ld a, $5a
	ld [hl], a
	play_sfx SFX_040
	stop_music2
	ret

.Func_5458a:
	call Func_54c07
	ld hl, wCurObjState
	ld a, [hl]
	cp $2a
	jr z, .asm_54572
	ld b, a
	ld a, [wRoomTransitionParam]
	and a
	jr nz, .asm_54563
	ld a, b
	and a
	jr z, .asm_545f8
	cp $2f
	jr z, .asm_545d3
	and $fe
	cp $08
	jr z, .asm_545ab
	ret
.asm_545ab
	ld de, Frameset_69a95
	call SetObjectFramesetPtr
	ld a, $44
	ld [hli], a
	ld a, $fd
	ld [hli], a
	inc l
	xor a
	ld [hl], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_07
	ld [hld], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_546e0)
	ld [hld], a
	ld a, LOW(.Func_546e0)
	ld [hld], a
	play_sfx SFX_0B3
	ret
.asm_545d3
	ld hl, wCurObjStateDuration
	dec [hl]
	jp z, .asm_54895
	ld a, [hl]
	cp $20
	ret nz
	play_sfx SFX_07E
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_545f2
	ld bc, ObjParams_InkLeft
	jp CreateObjectAtRelativePos
.asm_545f2
	ld bc, ObjParams_InkRight
	jp CreateObjectAtRelativePos
.asm_545f8
	ld hl, wCurObjVar1
	ld a, [hl]
	and a
	jr z, .asm_54615
	dec [hl]
	jp nz, .asm_5468e
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_5460f
	ld de, Frameset_69a5f
	jp SetObjectFramesetPtr
.asm_5460f
	ld de, Frameset_69a68
	jp SetObjectFramesetPtr
.asm_54615
	ld a, [w1d147]
	and a
	jr nz, .asm_54646
	ld l, OBJ_VAR_3
	dec [hl]
	jr nz, .asm_54646
	inc l
	ld a, [hld]
	and $0f
	swap a
	add a
	add $48
	ld [hl], a
	ld a, [wWarioScreenYPos]
	ld b, a
	ld a, [wCurObjScreenYPos]
	cp b
	jr c, .asm_54646
	ld a, $2f
	ld [wCurObjState], a
	ld de, Frameset_69a7a
	call SetObjectFramesetPtr
	ld a, $48
	ld [hli], a
	ld a, $fe
	ld [hl], a
	ret
.asm_54646
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_5466c
	ld a, [hli]
	sub $11
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectLeft
	jr .asm_5467d
.asm_5466c
	ld a, [hli]
	add $10
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectRight
.asm_5467d
	ld de, Frameset_69a71
	call SetObjectFramesetPtr
	inc l
	ld a, $2b
	ld [hl], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	ret

.asm_5468e
	ld a, [wWarioScreenYPos]
	and $fe
	ld b, a
	ld a, [wCurObjScreenYPos]
	and $fe
	cp b
	ret z
	jr nc, .Func_546bd

.Func_5469d:
	ld hl, wCurObjYPos
	ld a, [hli]
	add $05
	ldh [hYPosLo], a
	ld a, [hli]
	adc $00
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_352b
	and a
	jp z, MoveObjectDown
	ld hl, wCurObjSubState
	res OBJSUBFLAG_VDIR_F, [hl]
	ret

.Func_546bd:
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $2c
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_358b
	ld a, [wc0dd]
	and a
	jp nz, MoveObjectUp
	ld hl, wCurObjSubState
	set OBJSUBFLAG_VDIR_F, [hl]
	ret

.Func_546e0:
	call Func_54c07
	ld hl, wCurObjYPos
	ld a, [hli]
	add $05
	ldh [hYPosLo], a
	ld a, [hli]
	adc $00
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_352b
	and a
	ld bc, Data_60a60
	call z, ApplyObjYMovement
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_69ab3
	call SetObjectFramesetPtr
	ld a, $ff
	ld [hli], a
	ld a, $fc
	ld [hli], a
	ld a, $02
	ld [hl], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_06
	ld [hld], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_54770)
	ld [hld], a
	ld a, LOW(.Func_54770)
	ld [hld], a
	ld l, OBJ_STATE
	xor a
	ld [hld], a
	ld a, [wWarioScreenYPos]
	ld b, a
	ld a, [wCurObjScreenYPos]
	cp b
	jr nc, .asm_54734
	set 6, [hl]
.asm_54734
	res 6, [hl]
	ret

.asm_54737
	ld a, [wWarioScreenYPos]
	ld b, a
	ld a, [wCurObjScreenYPos]
	cp b
	jr nc, .asm_54765
	play_sfx SFX_0B4
	ld de, Frameset_69abc
	call SetObjectFramesetPtr
	ld a, $1e
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_54806)
	ld [hld], a
	ld a, LOW(.Func_54806)
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_07
	ld [hld], a
	jp Func_30fb
.asm_54765
	xor a
	ld [hld], a
	set 6, [hl]
	ld a, $02
	ld [wCurObjVar2], a
	jr .asm_54782

.Func_54770:
	call Func_54c07
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_54782
	and $fe
	cp $08
	jr z, .asm_54737
	xor a
	ld [hl], a
.asm_54782
	ld a, [wGlobalCounter]
	and %111
	play_sfx z, SFX_0AB
	ld hl, wCurObjStateDuration
	dec [hl]
	jr nz, .asm_5479c
	ld l, OBJ_VAR_2
	dec [hl]
	jr z, .asm_547e9
.asm_5479c
	ld l, OBJ_SUBSTATE
	bit OBJSUBFLAG_VDIR_F, [hl]
	jr z, .asm_547a7
	call .Func_5469d
	jr .asm_547aa
.asm_547a7
	call .Func_546bd
.asm_547aa
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_547d0
	ld a, [hli]
	sub $11
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectLeft
	jr .asm_547e1
.asm_547d0
	ld a, [hli]
	add $10
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectRight
.asm_547e1
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	ret
.asm_547e9
	ld de, Frameset_69aa8
	call SetObjectFramesetPtr
	ld a, $28
	ld [hli], a
	ld a, $fe
	ld [hl], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_07
	ld [hld], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5487d)
	ld [hld], a
	ld a, LOW(.Func_5487d)
	ld [hld], a
	ret

.Func_54806:
	call Func_54c07
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_VAR_3
	xor a
	ld [hli], a
	ld a, [hl]
	and $0f
	dec a
	jr z, .asm_5482a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_54853)
	ld [hld], a
	ld a, LOW(.Func_54853)
	ld [hld], a
	ld de, Frameset_69b08
	call SetObjectFramesetPtr
	ld a, $78
	ld [hli], a
	ret
.asm_5482a
	ld a, [hl]
	and $80
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_548c5)
	ld [hld], a
	ld a, LOW(.Func_548c5)
	ld [hld], a
	ld de, Frameset_69ac3
	call SetObjectFramesetPtr
	inc l
	ld a, $ff
	ld [hli], a
	ld a, $14
	ld [hl], a
	call MoveObjectUpByVar2
	stop_music2
	ret

.Func_54853:
	call Func_54c07
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_547e9
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $2c
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_358b
	ld a, [wc0dd]
	and a
	ret z
	ld bc, Data_60a70
	jp ApplyObjYMovement

.Func_5487d:
	call Func_54c07
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_41
	ld [hld], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5458a)
	ld [hld], a
	ld a, LOW(.Func_5458a)
	ld [hld], a

.asm_54895
	ld l, OBJ_SUBSTATE
	ld a, [hld]
	and $0f
	swap a
	add a
	add $48
	ld [hl], a
	ld l, OBJ_STATE
	xor a
	ld [wCurObjVar1], a
	ld [hld], a
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_548bd
	res 7, [hl]
	ld de, Frameset_69a5f
	jp SetObjectFramesetPtr
.asm_548bd
	set 7, [hl]
	ld de, Frameset_69a68
	jp SetObjectFramesetPtr

.Func_548c5:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	call Func_54c07
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $18
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_358b
	ld a, [wc0dd]
	and a
	ld bc, Data_60a70
	jp nz, ApplyObjYMovement
	ld hl, wCurObjStateDuration
	ld a, $0f
	ld [hli], a
	inc l
	xor a
	ld [hl], a
	ld l, OBJ_FLAGS
	set OBJFLAG_PRIORITY_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5490b)
	ld [hld], a
	ld a, LOW(.Func_5490b)
	ld [hld], a
	play_sfx SFX_0AC
	ret

.Func_5490b:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	call Func_54c07
	call MoveObjectDown_Slow
	ld bc, Data_60a80
	call ApplyObjXMovement
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $b4
	ld [hl], a
	xor a
	ld [wCurObjVar2], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_54931)
	ld [hld], a
	ld a, LOW(.Func_54931)
	ld [hld], a
	ret

.Func_54931:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	call Func_54c07
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_54978
	dec [hl]
	jr nz, .asm_54978
	ld hl, wCurObjUnk02
	ld e, $05
	farcall Func_ba42
	ld a, $03
	ld [wBossBattleMusic], a
	call UpdateLevelMusic
	xor a
	ld [wIsBossBattle], a
	ld hl, w1d147
	ld a, [hl]
	and a
	jr z, .asm_54978
	xor a
	ld [hl], a
	ld hl, Pals_54c87
	call WriteScowlerOBPals
	ld hl, Pals_54cb7
	call WriteScowlerBGPals
.asm_54978
	call MoveObjectDown_Slow
	ld bc, Data_60a90
	jp Func_34a0

FloatingRingSpawnerFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_54997)
	ld [hld], a
	ld a, LOW(.Func_54997)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld a, $40
	ld [wCurObjStateDuration], a
	jr .Func_549ab

.Func_54997:
	ld hl, wCurObjStateDuration
	dec [hl]
	jr nz, .Func_549ab
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_549ab)
	ld [hld], a
	ld a, LOW(.Func_549ab)
	ld [hld], a
	ld bc, ObjParams_FloatingRing
	call CreateObjectAtRelativePos
;	fallthrough

.Func_549ab:
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

FloatingRingFunc:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_549c7)
	ld [hld], a
	ld a, LOW(.Func_549c7)
	ld [hld], a
	jp MoveObjectLeftByVar2

.Func_549c7:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wGlobalCounter]
	rra
	ret c
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, MoveObjectUp
	ld a, $3c
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_549ee)
	ld [hld], a
	ld a, LOW(.Func_549ee)
	ld [hld], a
	ld l, OBJ_Y_POS
	ld a, [hli]
	ld [wCurObjVar2], a
	ld a, [hl]
	ld [wCurObjVar3], a
	ret

.Func_549ee:
	call SetOneWayPlatformAction
	ld hl, wCurObjFlags
	bit OBJFLAG_STEPPED_F, [hl]
	ret z
	res OBJFLAG_STEPPED_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_54a02)
	ld [hld], a
	ld a, LOW(.Func_54a02)
	ld [hld], a
	ret

.Func_54a02:
	call SetOneWayPlatformAction
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_54a24
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	jp z, MoveObjectUp
	res OBJFLAG_STEPPED_F, [hl]
	ld b, $01
	call SubYOffset
	call HandleUpwardsFloorTransition
	jp MoveObjectUp
.asm_54a24
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_54a2d)
	ld [hld], a
	ld a, LOW(.Func_54a2d)
	ld [hld], a
	ret

.Func_54a2d:
	call SetOneWayPlatformAction
	ld hl, wCurObjVar2
	ld b, [hl]
	ld a, [wCurObjYPos + 0]
	cp b
	jr nz, .asm_54a42
	inc l
	ld b, [hl]
	ld a, [wCurObjYPos + 1]
	cp b
	jr z, .asm_54a5b
.asm_54a42
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	jp z, MoveObjectDown_Slow
	res 5, [hl]
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld b, $01
	call AddYOffset
	call HandleDownwardsFloorTransition
	jp MoveObjectDown
.asm_54a5b
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	ret z
	res OBJFLAG_STEPPED_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_54a02)
	ld [hld], a
	ld a, LOW(.Func_54a02)
	ld [hld], a
	ld a, $3c
	ld [wCurObjStateDuration], a
	ret

ScrowlerTentacleFunc:
	ld hl, wCurObjFlags
	set 4, [hl]
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_54a97)
	ld [hld], a
	ld a, LOW(.Func_54a97)
	ld [hld], a
	ret

.asm_54a7f
	ld a, $5a
	ld [hl], a
	play_sfx SFX_040
	stop_music2
	ret

.Func_54a97:
	ld hl, wCurObjState
	ld a, [hl]
	cp $2a
	jr z, .asm_54a7f
	ld a, [wRoomTransitionParam]
	and a
	ret nz
	xor a
	ld [hl], a
	ld a, LOW(wObj1)
	ld b, LOW(wObj1)
	ld h, HIGH(wObj1)
.asm_54aac
	ld l, OBJ_UNK_07
	add l
	ld l, a
	ld a, [hl] ; OBJ_UNK_07
	cp $50
	jr nz, .asm_54abd
	ld a, l
	sub OBJ_UNK_07 - OBJ_FLAGS
	ld l, a
	ld a, [hli] ; OBJ_FLAGS
	rra
	jr c, .asm_54ac6
.asm_54abd
	ld a, b
	cp LOW(wObj8)
	ret z
	add OBJ_STRUCT_LENGTH
	ld b, a
	jr .asm_54aac
.asm_54ac6
	inc l
	inc l
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, l
	add OBJ_VAR_1 - (OBJ_X_POS + 1)
	ld l, a
	ld a, [hli] ; OBJ_VAR_1
	and a
	jr z, .asm_54b28
	cp $fc
	jr z, .asm_54b05
	cp $fd
	jr z, .asm_54af0
	cp $fe
	jr z, .asm_54b0e
	cp $ff
	jr z, .asm_54b23
	ld a, [wCurObjUnk07]
	cp $51
	jr z, .asm_54b5a
	jr .asm_54b2e
.asm_54af0
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and $80
	or $43
	ld [hli], a
	ld a, $fd
	ld [hli], a
	ld a, $02
	ld [hli], a
	ret
.asm_54b05
	ld a, [wCurObjUnk07]
	cp $51
	jr z, .asm_54b5a
	jr .asm_54b2e
.asm_54b0e
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and $80
	or $40
	ld [hli], a
	ld a, $f6
	ld [hli], a
	ld a, $fe
	ld [hli], a
	ret
.asm_54b23
	xor a
	ld [wCurObjFlags], a
	ret
.asm_54b28
	inc l
	inc l
	bit 7, [hl] ; OBJ_SUBSTATE
	jr nz, .asm_54b5a
.asm_54b2e
	ld hl, wCurObjYPos
	ld a, [wCurObjUnk07]
	cp $51
	jr z, .asm_54b49
	ld a, c
	sub $0b
	ld [hli], a
	ld a, b
	sbc $00
	ld [hli], a
	ld a, e
	add $0f
	ld [hli], a
	ld a, d
	adc $00
	ld [hli], a
	ret
.asm_54b49
	ld a, c
	sub $04
	ld [hli], a
	ld a, b
	sbc $00
	ld [hli], a
	ld a, e
	sub $17
	ld [hli], a
	ld a, d
	sbc $00
	ld [hli], a
	ret
.asm_54b5a
	ld hl, wCurObjYPos
	ld a, [wCurObjUnk07]
	cp $51
	jr z, .asm_54b75
	ld a, c
	sub $04
	ld [hli], a
	ld a, b
	sbc $00
	ld [hli], a
	ld a, e
	add $16
	ld [hli], a
	ld a, d
	adc $00
	ld [hli], a
	ret
.asm_54b75
	ld a, c
	sub $0b
	ld [hli], a
	ld a, b
	sbc $00
	ld [hli], a
	ld a, e
	sub $10
	ld [hli], a
	ld a, d
	sbc $00
	ld [hli], a
	ret

InkFunc:
.Left:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_54ba0
	dec [hl]
	call MoveObjectLeft_Slow
	jr .asm_54bb6
.Right:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_54ba0
	dec [hl]
	call MoveObjectRight_Slow
	jr .asm_54bb6
.asm_54ba0
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_54bb3
	call MoveObjectLeft_Slow
	jr .asm_54bb6
.asm_54bb3
	call MoveObjectRight_Slow
.asm_54bb6
	ld a, [wCurObjState]
	and a
	jr nz, .asm_54be1
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $10
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_358b
	ld a, [wc0dd]
	and a
	jr z, .asm_54be6
	ld a, [wGlobalCounter]
	and %11
	ret nz
	jp MoveObjectUp
.asm_54be1
	ld a, $01
	ld [w1d147], a
.asm_54be6
	ld de, Frameset_69af5
	call SetObjectFramesetPtr
	ld a, $19
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_54bf8)
	ld [hld], a
	ld a, LOW(.Func_54bf8)
	ld [hld], a
	ret

.Func_54bf8:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret

Func_54c07:
	ld hl, w1d147
	ld a, [hl]
	and a
	ret z
	ld b, a
	ld a, [wDollBoyActiveBarrels]
	and a
	jr nz, .asm_54c74
	inc [hl]
	ld a, b
	cp $02
	jr z, .asm_54c31
	cp $3c
	jr z, .asm_54c44
	cp $3d
	jr z, .asm_54c27
	cp $78
	jr z, .asm_54c5f
	ret
.asm_54c27
	play_sfx SFX_0B7
	jr .asm_54c39
.asm_54c31
	play_sfx SFX_0B5
.asm_54c39
	ld hl, Pals_54c9f
	call WriteScowlerOBPals
	ld hl, Pals_54cf7
	jr WriteScowlerBGPals

.asm_54c44
	play_sfx SFX_0B6
	ld a, $ff
	ld [wDollBoyActiveBarrels], a
	ld c, 5
	ld b, 3
	call Func_360f
	ld c, 0
	ld b, 8
	jp Func_3632

.asm_54c5f
	play_sfx SFX_0B8
	xor a
	ld [hl], a
	ld hl, Pals_54c87
	call WriteScowlerOBPals
	ld hl, Pals_54cb7
	jr WriteScowlerBGPals
.asm_54c74
	ld hl, wDollBoyActiveBarrels
	dec [hl]
	ret

WriteScowlerOBPals:
	ld c, 5
	ld b, 3
	jp Func_35bb

WriteScowlerBGPals:
	ld c, 0
	ld b, 8
	jp Func_35e5

Pals_54c87:
	rgb  0, 20,  0
	rgb 31, 27,  0
	rgb  0, 17, 31
	rgb  0,  0,  0

	rgb  0, 20,  0
	rgb 31, 27,  0
	rgb 29,  1, 29
	rgb  0,  0,  0

	rgb  0, 20,  0
	rgb 31, 31, 20
	rgb  0, 28,  0
	rgb  0,  0,  0

Pals_54c9f:
	rgb  0, 10,  0
	rgb 31, 13,  0
	rgb 16, 24, 15
	rgb  0,  0,  0

	rgb  0, 10,  0
	rgb 31, 13,  0
	rgb 30, 16, 14
	rgb  0,  0,  0

	rgb  0, 10,  0
	rgb 31, 15, 10
	rgb  0, 14,  0
	rgb  0,  0,  0

Pals_54cb7:
	rgb  1, 11, 23
	rgb  2,  8, 19
	rgb  0,  6, 15
	rgb  0,  3, 10

	rgb 31, 31, 31
	rgb 19, 22, 25
	rgb  5,  9, 13
	rgb  0,  0,  0

	rgb 14,  4, 12
	rgb  7, 16,  7
	rgb  2, 10,  3
	rgb  0,  0,  0

	rgb 16,  4, 14
	rgb 11,  2,  9
	rgb  8,  0,  6
	rgb  6,  0,  3

	rgb 11,  2,  9
	rgb 17, 23, 30
	rgb  1, 11, 23
	rgb  0,  1, 12

	rgb 30, 20, 29
	rgb 23,  2, 22
	rgb 12,  0, 10
	rgb  0,  0,  0

	rgb 27, 29, 31
	rgb 29, 15, 21
	rgb  9,  0,  2
	rgb  0,  0,  4

	rgb 29, 15, 21
	rgb 22,  2,  5
	rgb 10,  0,  6
	rgb  2,  0,  0

Pals_54cf7:
	rgb  1,  5, 13
	rgb  0,  3,  8
	rgb  0,  1,  5
	rgb  0,  0,  0

	rgb 14, 17, 19
	rgb  6,  8, 10
	rgb  0,  2,  4
	rgb  0,  0,  0

	rgb 10,  0, 10
	rgb  0,  8,  1
	rgb  0,  4,  0
	rgb  0,  0,  0

	rgb  8,  0,  6
	rgb  6,  0,  3
	rgb  5,  0,  3
	rgb  2,  0,  0

	rgb  6,  0,  3
	rgb  3,  9, 15
	rgb  0,  3,  8
	rgb  0,  0,  4

	rgb 17,  9, 17
	rgb 10,  0, 10
	rgb  4,  0,  4
	rgb  0,  0,  0

	rgb 27, 29, 31
	rgb 21,  8, 13
	rgb  4,  0,  0
	rgb  0,  0,  4

	rgb 21,  8, 13
	rgb 12,  0,  0
	rgb  4,  0,  0
	rgb  2,  0,  0
