WolfenbossFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_55e8d)
	ld [hld], a
	ld a, LOW(.Func_55e8d)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, [hl]
	and $f0
	or $04
	ld [hl], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $02
	ld [hld], a
	ld a, $fd
	ld [hld], a
	ld a, $01
	ld [hl], a
	ld de, Frameset_69e97
	call SetObjectFramesetPtr
	ld a, $14
	ld [hli], a
	inc l
	xor a
	ld [hl], a
	ld [wDollBoyActiveBarrels], a
	ld [w1d147], a
	ld a, $04
	ld [wDollBoyHammerStage], a
	ld a, $02
	ld [w1d149], a
	ret

.Func_55e8d:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	ret z
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ld bc, Data_60650
	jp nz, Func_34a0
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_55ec4)
	ld [hld], a
	ld a, LOW(.Func_55ec4)
	ld [hld], a
	ld de, Frameset_69ea0
	call SetObjectFramesetPtr
	ld a, $40
	ld [hli], a
	ld a, TRUE
	ld [wIsBossBattle], a
	stop_music2
	ret

.Func_55ec4:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, MoveObjectUp
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_55eea)
	ld [hld], a
	ld a, LOW(.Func_55eea)
	ld [hld], a
	ld de, Frameset_69ea9
	call SetObjectFramesetPtr
	ld a, $13
	ld [hli], a
	play_sfx SFX_0AA
	ret

.Func_55eea:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_55f20)
	ld [hld], a
	ld a, LOW(.Func_55f20)
	ld [hld], a
	ld l, OBJ_FRAMESET_PTR
	ld a, $0e
	ld [hli], a
	ld a, $5e
	ld [hli], a
	xor a
	ld [hli], a
	inc a
	inc a
	ld [hli], a
	ld l, OBJ_COLLBOX_TOP
	ld a, $f8
	ld [hli], a
	ld a, $0c
	ld [hli], a
	ld a, $f8
	ld [hli], a
	ld a, $07
	ld [hli], a
	ld a, $02
	ld [wcac3], a
	call UpdateLevelMusic
	ret

.Func_55f20:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjFrame]
	and a
	jp nz, MoveObjectUp_Slow
	ld de, Frameset_69dcb
	call SetObjectFramesetPtr
	ld a, $28
	ld [hli], a
	xor a
	ld [hli], a
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_55f41)
	ld [hld], a
	ld a, LOW(.Func_55f41)
	ld [hld], a
	ret

.Func_55f41:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	inc l
	xor a
	ld [hli], a
	inc l
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_55fb3)
	ld [hld], a
	ld a, LOW(.Func_55fb3)
	ld [hld], a
	ld de, Frameset_69dec
	call SetObjectFramesetPtr
	ret

.Func_55f5f:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret

.Func_55f6e:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_69ea9
	call SetObjectFramesetPtr
	ld a, $0e
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_55f5f)
	ld [hld], a
	ld a, LOW(.Func_55f5f)
	ld [hld], a
	play_sfx SFX_0AA
	ret

.asm_55f92
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_55f9d
	ld de, Frameset_69e0e
	jr .asm_55fa0
.asm_55f9d
	ld de, Frameset_69e1f
.asm_55fa0
	call SetObjectFramesetPtr
	ld a, $46
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_55f6e)
	ld [hld], a
	ld a, LOW(.Func_55f6e)
	ld [hld], a
	xor a
	ld [wcac3], a
	ret

.Func_55fb3:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wTransformation]
	and a
	jr nz, .asm_55f92
	ld hl, wCurObjState
	ld a, [hl]
	and $fe
	jr z, .asm_56025
	cp $08
	jr nz, .asm_55fec
	ld a, $38
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_55fd6
	ld de, Frameset_69e85
	jr .asm_55fd9
.asm_55fd6
	ld de, Frameset_69e8e
.asm_55fd9
	call SetObjectFramesetPtr
	ld a, $3c
	ld [hli], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and $0f
	dec a
	ret z
	dec [hl]
	ld hl, wDollBoyHammerStage
	dec [hl]
	ret
.asm_55fec
	cp $38
	jr nz, .asm_56023
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jr z, .asm_56005
	ld a, [hl]
	cp $29
	jp c, MoveObjectDown_Slow
	ret nz
	play_sfx SFX_0A9
	ret
.asm_56005
	ld a, $28
	ld [hli], a
	ld a, $04
	ld [hl], a
	ld l, OBJ_FLAGS
	res OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_STATE
	xor a
	ld [hld], a
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr nz, .asm_5601d
	ld de, Frameset_69e0e
	jp SetObjectFramesetPtr
.asm_5601d
	ld de, Frameset_69e1f
	jp SetObjectFramesetPtr
.asm_56023
	xor a
	ld [hl], a
.asm_56025
	ld l, OBJ_VAR_1
	ld a, [hl]
	and a
	jp z, .asm_560e3
	cp $01
	jr z, .asm_5605b
	cp $02
	jr z, .asm_56055
	cp $03
	jr z, .asm_560ac
	cp $04
	jr z, .asm_5603d
	ret
.asm_5603d
	call MoveObjectUp_Slow
	ld l, OBJ_FRAMESET_OFFSET
	ld a, [hld]
	cp $04
	jr nz, .asm_56055
	ld a, [hld]
	and a
	jr nz, .asm_56055
	ld a, [wCurObjSubState]
	and $0f
	cp $01
	jp z, .Func_56183
.asm_56055
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	jr .asm_560c3
.asm_5605b
	ld a, [wDollBoyActiveBarrels]
	ld c, a
	and a
	jr z, .asm_56066
	ld b, $38
	jr .asm_56068
.asm_56066
	ld b, $57
.asm_56068
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	cp b
	jr z, .asm_56088
	dec [hl]
	ret nz
	ld a, $13
	ld [hli], a
	ld a, $02
	ld [hl], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_56082
	ld de, Frameset_69dfb
	jp SetObjectFramesetPtr
.asm_56082
	ld de, Frameset_69e00
	jp SetObjectFramesetPtr
.asm_56088
	dec [hl]
	ld a, [wCurObjSubState]
	rlca
	dec c
	jr c, .asm_5609e
	jr z, .asm_56098
	ld bc, ObjParams_MagicSpiralLeft
	jp CreateObjectAtRelativePos
.asm_56098
	ld bc, ObjParams_IgaguriLeft
	jp CreateObjectAtRelativePos
.asm_5609e
	jr z, .asm_560a6
	ld bc, ObjParams_MagicSpiralRight
	jp CreateObjectAtRelativePos
.asm_560a6
	ld bc, ObjParams_IgaguriRight
	jp CreateObjectAtRelativePos
.asm_560ac
	ld bc, Data_604c0
	call ApplyObjYMovement_Loop
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	ld a, [wCurObjVar2]
	and a
	jr nz, .asm_560d9
.asm_560c3
	xor a
	ld [wCurObjVar1], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_560d3
	ld de, Frameset_69dec
	jp SetObjectFramesetPtr
.asm_560d3
	ld de, Frameset_69de7
	jp SetObjectFramesetPtr
.asm_560d9
	xor a
	ld [wCurObjVar2], a
	bit 7, [hl]
	jr z, .asm_56115
	jr .asm_5613e
.asm_560e3
	ld a, [wGlobalCounter]
	and $1f
	play_sfx z, SFX_0C3
	ld bc, Data_604c0
	call ApplyObjYMovement_Loop
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_56127
	ld a, [wGlobalCounter]
	and a
	jr nz, .asm_5611a
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wCurObjScreenXPos]
	cp b
	jr nc, .asm_56115
	ld a, $01
	ld [wCurObjVar2], a
	jr .asm_56122
.asm_56115
	ld de, Frameset_69df1
	jr .asm_56141
.asm_5611a
	ld a, [wCurObjScreenXPos]
	cp $18
	jp nz, MoveObjectLeft_Slow
.asm_56122
	ld de, Frameset_69dd5
	jr .asm_56179
.asm_56127
	ld a, [wGlobalCounter]
	and a
	jr nz, .asm_5616e
	ld a, [wCurObjScreenXPos]
	ld b, a
	ld a, [wWarioScreenXPos]
	cp b
	jr nc, .asm_5613e
	ld a, $01
	ld [wCurObjVar2], a
	jr .asm_56176
.asm_5613e
	ld de, Frameset_69df6
.asm_56141
	call SetObjectFramesetPtr
	ld a, [w1d149]
	and a
	jr z, .asm_56150
	dec a
	ld [w1d149], a
	jr .asm_56156
.asm_56150
	ld a, [w1d147]
	and a
	jr z, .asm_5615c
.asm_56156
	ld b, $00
	ld a, $67
	jr .asm_56165
.asm_5615c
	ld a, $01
	ld [w1d147], a
	ld b, $01
	ld a, $48
.asm_56165
	ld [hli], a
	ld a, $01
	ld [hl], a
	ld a, b
	ld [wDollBoyActiveBarrels], a
	ret
.asm_5616e
	ld a, [wCurObjScreenXPos]
	cp $98
	jp nz, MoveObjectRight_Slow
.asm_56176
	ld de, Frameset_69dde
.asm_56179
	call SetObjectFramesetPtr
	ld a, $1b
	ld [hli], a
	ld a, $03
	ld [hl], a
	ret

.Func_56183:
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_561a9)
	ld [hld], a
	ld a, LOW(.Func_561a9)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and $80
	ld [hld], a
	xor a
	ld [hl], a
	ld l, OBJ_FLAGS
	set OBJFLAG_PRIORITY_F, [hl]
	stop_music2
	ld de, Frameset_69e05
	jp SetObjectFramesetPtr

.Func_561a9:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjScreenYPos]
	cp $c0
	jr nc, .asm_561ca
	ld a, [wCurObjVar3]
	cp $2b
	play_sfx z, SFX_0A3
	ld bc, Data_60da0
	jp ApplyObjYMovement
.asm_561ca
	ld a, $03
	ld [wcac3], a
	call UpdateLevelMusic
	xor a
	ld [wIsBossBattle], a
	call Func_56326

	ld a, LOW(wObj1)
	ld b, LOW(wObj1)
	ld h, HIGH(wObj1)
.asm_561df
	ld l, OBJ_UNK_07
	add l
	ld l, a
	ld a, [hl] ; OBJ_UNK_07
	cp $5a
	jr nz, .asm_561f0
	ld a, l
	sub OBJ_UNK_07 - OBJ_FLAGS
	ld l, a
	ld a, [hli] ; OBJ_FLAGS
	rra
	jr c, .asm_561f9
.asm_561f0
	ld a, b
	cp LOW(wObj8)
	ret z
	add OBJ_STRUCT_LENGTH
	ld b, a
	jr .asm_561df
.asm_561f9
	ld a, l
	add $1a
	ld l, a
	ld a, $2f
	ld [hl], a
	ret

MagicSpiralFunc:
	ld hl, wCurObjFlags
	set 3, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_56216)
	ld [hld], a
	ld a, LOW(.Func_56216)
	ld [hld], a
	play_sfx SFX_0C2
.Func_56216:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_56235
	ld a, [hl]
	cp $45
	jr nz, .asm_5622c
	ld de, Frameset_69e39
	jp SetObjectFramesetPtr
.asm_5622c
	cp $26
	ret nz
	ld de, Frameset_69e42
	jp SetObjectFramesetPtr
.asm_56235
	ld a, $08
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_56241)
	ld [hld], a
	ld a, LOW(.Func_56241)
	ld [hld], a
	ret

.Func_56241:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_56253
	dec [hl]
	play_sfx z, SFX_07C
.asm_56253
	ld a, [wTransformation]
	and a
	jr nz, .asm_562a2
	ld a, [wDollBoyHammerStage]
	dec a
	jr z, .asm_562c3
	ld hl, wCurObjSubState
	bit 6, [hl]
	ld a, [wCurObjScreenYPos]
	jr nz, .asm_56276
	cp $18
	jr c, .asm_56272
	call MoveObjectUp
	jr .asm_56284
.asm_56272
	set 6, [hl]
	jr .asm_56281
.asm_56276
	cp SCREEN_HEIGHT_PX
	jr nc, .asm_5627f
	call MoveObjectDown
	jr .asm_56284
.asm_5627f
	res 6, [hl]
.asm_56281
	call .asm_5629d
.asm_56284
	ld l, OBJ_SUBSTATE
	bit OBJSUBFLAG_HDIR_F, [hl]
	ld a, [wCurObjScreenXPos]
	jr nz, .asm_56296
	cp $10
	jp nc, MoveObjectLeft
	set 7, [hl]
	jr .asm_5629d
.asm_56296
	cp SCREEN_WIDTH_PX
	jp c, MoveObjectRight
	res 7, [hl]
.asm_5629d
	dec [hl]
	ld a, [hl]
	and $0f
	ret nz
.asm_562a2
	ld de, Frameset_69eb2
	call SetObjectFramesetPtr
	ld a, $1b
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_562b9)
	ld [hld], a
	ld a, LOW(.Func_562b9)
	ld [hld], a
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

.Func_562b9:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
.asm_562c3
	xor a
	ld [wCurObjFlags], a
	ret

WolfenbossPlatformFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_562ef)
	ld [hld], a
	ld a, LOW(.Func_562ef)
	ld [hld], a
	ld de, Frameset_69e72
	call SetObjectFramesetPtr
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f8
	ld [hld], a
	ld a, $08
	ld [hl], a
	ret

.Func_562ef:
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld a, [wCurObjState]
	cp $2f
	ret nz
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_56309)
	ld [hld], a
	ld a, LOW(.Func_56309)
	ld [hld], a
	ld a, $50
	ld [wCurObjStateDuration], a
	ret

.Func_56309:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_VAR_2
	ld a, $02
	ld [hli], a
	xor a
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5631e)
	ld [hld], a
	ld a, LOW(.Func_5631e)
	ld [hld], a
	ret

.Func_5631e:
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jp nz, Func_3326
;	fallthrough

Func_56326:
	xor a
	ld [wCurObjFlags], a
	ld hl, wCurObjUnk02
	ld e, $07
	farcall Func_ba42
	ret

IgaguriFunc:
	ld a, [wGlobalCounter]
	and $07
	play_sfx z, SFX_06B
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_5636d
	ld a, [hl]
	cp $2b
	jr nz, .asm_56364
	ld de, Frameset_69e80
	jp SetObjectFramesetPtr
.asm_56364
	cp $18
	ret nz
	ld de, Frameset_69e4b
	jp SetObjectFramesetPtr
.asm_5636d
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_563a2)
	ld [hld], a
	ld a, LOW(.Func_563a2)
	ld [hld], a
	ld de, Frameset_69e4b
	call SetObjectFramesetPtr
	ld a, $28
	ld [hli], a
	ld a, $03
	ld [hli], a
	ld a, [wDollBoyHammerStage]
	cp $03
	jr c, .asm_56394
	play_sfx SFX_101
	ld a, $02
	jr .asm_5639e
.asm_56394
	play_sfx SFX_067
	ld a, $01
.asm_5639e
	ld [hli], a
	xor a
	ld [hl], a
	ret

.Func_563a2:
	ld a, [wTransformation]
	and a
	jr z, .asm_563ad
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
.asm_563ad
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld a, [wDollBoyHammerStage]
	cp $03
	jr c, .asm_563c5
	ld hl, wCurObjYPos
	ld a, [hl]
	add $04
	ld [hli], a
	jr nc, .asm_563cb
	inc [hl]
	jr .asm_563cb
.asm_563c5
	ld bc, Data_60d80
	call ApplyObjYMovement
.asm_563cb
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
	jr z, .asm_56416
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	call .Func_5647b
	ld a, [wDollBoyHammerStage]
	cp $03
	jr nc, .asm_56469
	ld hl, wCurObjSubState
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_56408
	res 7, [hl]
	jr .asm_5640a
.asm_56408
	set 7, [hl]
.asm_5640a
	dec l
	xor a
	ld [hld], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_56430)
	ld [hld], a
	ld a, LOW(.Func_56430)
	ld [hld], a
	ret
.asm_56416
	ld hl, wCurObjSubState
	bit OBJSUBFLAG_HDIR_F, [hl]
	ld a, [wCurObjScreenXPos]
	jr nz, .asm_56428
	cp $10
	jp nc, MoveObjectLeftByVar2
	set 7, [hl]
	ret
.asm_56428
	cp SCREEN_WIDTH_PX
	jp c, MoveObjectRightByVar2
	res 7, [hl]
	ret

.Func_56430
	ld a, [wTransformation]
	and a
	jr z, .asm_5643b
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
.asm_5643b
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld bc, Data_60e00
	call ApplyObjYMovement
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
	jr z, .asm_56416
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_VAR_1
	dec [hl]
	jr nz, .asm_56477
.asm_56469
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_56488)
	ld [hld], a
	ld a, LOW(.Func_56488)
	ld [hld], a
	xor a
	ld [wCurObjVar1], a
	ret
.asm_56477
	xor a
	ld [wCurObjVar3], a
.Func_5647b:
	play_sfx SFX_061
	ld b, $18
	jp DoGroundShake

.Func_56488:
	ld a, [wTransformation]
	and a
	jr z, .asm_56493
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
.asm_56493
	ld hl, wCurObjVar1
	ld a, [hl]
	and a
	jr z, .asm_564a3
	cp $01
	jr z, .asm_564b1
	cp $02
	jr z, .asm_564ce
	ret
.asm_564a3
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld a, $3c
	ld [hli], a
	inc [hl]
	ret
.asm_564b1
	ld a, [wGlobalCounter]
	and $1f
	play_sfx z, SFX_0C5
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld a, $0e
	ld [hli], a
	inc [hl]
	ld de, Frameset_69e59
	jp SetObjectFramesetPtr
.asm_564ce
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jr z, .asm_564e5
	ld a, [hl]
	cp $05
	ret nz
	play_sfx SFX_0C4
	ld bc, ObjParams_Kuri
	jp CreateObjectFromCurObjPos
.asm_564e5
	xor a
	ld [wCurObjFlags], a
	ret

KuriFunc:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld bc, Data_60d60
	call ApplyObjYMovement
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
	ret z
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5653c)
	ld [hld], a
	ld a, LOW(.Func_5653c)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_5652d
	set 7, [hl]
	ret
.asm_5652d
	res 7, [hl]
	ret

.asm_56530
	bit 7, [hl]
	jr z, .asm_56562
	jr .asm_56566
.asm_56536
	bit 7, [hl]
	jr nz, .asm_56562
	jr .asm_56566

.Func_5653c:
	ld a, [wTransformation]
	and a
	jr z, .asm_56547
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
.asm_56547
	ld hl, wCurObjState
	ld a, [hld]
	and a
	jr z, .asm_56569
	cp $02
	jr z, .asm_56530
	cp $03
	jr z, .asm_56536
	cp $0a
	jr z, .asm_565a0
	cp $04
	jr z, .asm_565a7
	cp $05
	jr z, .asm_565ae
.asm_56562
	ld a, [hl]
	xor $80
	ld [hl], a
.asm_56566
	inc l
	xor a
	ld [hld], a
.asm_56569
	ld l, OBJ_FLAGS
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jr nz, .asm_56572
	xor a
	ld [hl], a
	ret
.asm_56572
	ld a, [wTransformation]
	and a
	jr nz, .asm_56587
	ld a, [wGlobalCounter]
	and $07
	play_sfx z, SFX_06A
.asm_56587
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	ld a, [wCurObjScreenXPos]
	jr c, .asm_56598
	cp $10
	jp nc, MoveObjectLeft
	set 7, [hl]
	ret
.asm_56598
	cp SCREEN_WIDTH_PX
	jp c, MoveObjectRight
	res 7, [hl]
	ret
.asm_565a0
	ld hl, w1d147
	dec [hl]
	jp VanishObject2
.asm_565a7
	set 7, [hl]
	ld de, Frameset_69e60
	jr .asm_565b3
.asm_565ae
	res 7, [hl]
	ld de, Frameset_69e60
.asm_565b3
	inc l
	xor a
	ld [hl], a
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
	ld a, $03
	ld [wCurObjVar2], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_565ca)
	ld [hld], a
	ld a, LOW(.Func_565ca)
	ld [hld], a
	jp SetObjectFramesetPtr

.Func_565ca:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjState]
	and $fe
	cp $28
	jr z, .asm_565a0
	call MoveObjectUp_Fast
	ld l, OBJ_FLAGS
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jr nz, .asm_565e8
	xor a
	ld [hl], a
	ld hl, w1d147
	dec [hl]
	ret
.asm_565e8
	ld hl, wCurObjSubState
	bit OBJSUBFLAG_HDIR_F, [hl]
	ld a, [wCurObjScreenXPos]
	jr nz, .asm_565fb
	cp $10
	jp nc, MoveObjectLeftByVar2
	set 7, [hl]
	jr .asm_56602
.asm_565fb
	cp SCREEN_WIDTH_PX
	jp c, MoveObjectRightByVar2
	res 7, [hl]
.asm_56602
	ld a, [wCurObjScreenYPos]
	cp $11
	ret c
	play_sfx SFX_01A
	ret
