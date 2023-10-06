StrongWaterCurrentFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_51d2d)
	ld [hld], a
	ld a, LOW(.Func_51d2d)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $0f
	ld [hld], a
	ld a, $f0
	ld [hld], a
	ld a, $fe
	ld [hl], a
	ld de, Frameset_69965
	call SetObjectFramesetPtr
	ld a, $2a
	ld [wCurObjVar2], a
	call MoveObjectDownByVar2
	ld a, $69
	ld [wCurObjVar2], a
	jp MoveObjectLeftByVar2

.Func_51d2d:
	ret

PesceFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_51e28)
	ld [hld], a
	ld a, LOW(.Func_51e28)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $0f
	ld [hld], a
	ld a, $f0
	ld [hld], a
	ld a, $fe
	ld [hl], a
	ld de, Frameset_6990a
	call SetObjectFramesetPtr
	xor a
	ld [w1d147], a
	ld [wDollBoyHammerStage], a
	ld [hli], a
	ld [hli], a
	ld a, $0a
	ld [hli], a
	xor a
	ld [hl], a
	call MoveObjectDownByVar2
	ld a, $3c
	ld [wCurObjVar2], a
	ld a, $02
	ld [wcac3], a
	call UpdateLevelMusic
	ld a, TRUE
	ld [wIsBossBattle], a
	ret

.asm_51d76
	xor a
	ld [hl], a
	ld [wCurObjStateDuration], a
	play_sfx SFX_0BB
	ld hl, w1d147
	inc [hl]
	ld a, [hl]
	cp $01
	jr z, .asm_51d9a
	cp $02
	jr z, .asm_51d9e
	cp $03
	jr z, .asm_51da6
	xor a
	ld [hl], a
	ld a, $f2
	jr .asm_51da0
.asm_51d9a
	ld a, $ef
	jr .asm_51da0
.asm_51d9e
	ld a, $eb
.asm_51da0
	ld [wCurObjCollBoxTop], a
	jp .asm_51e67
.asm_51da6
	ld a, $e6
	ld [wCurObjCollBoxTop], a
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_521d0)
	ld [hld], a
	ld a, LOW(.Func_521d0)
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_51
	ld [hld], a
	stop_music2
	jp .asm_51e67

.asm_51dcb
	stop_music2
	play_sfx SFX_FAT_WALK
	xor a
	ld [hl], a
	ld l, OBJ_Y_POS
	ld a, [hli]
	add $04
	ld [wWarioYPos + 1], a
	ld a, [hli]
	adc $00
	ld [wWarioYPos + 0], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_51e0e
	ld a, [hli]
	sub $14
	ld [wWarioXPos + 1], a
	ld a, [hl]
	sbc $00
	ld [wWarioXPos + 0], a
	ld de, Frameset_6992d
	call SetObjectFramesetPtr
	ld a, $3c
	ld [hli], a
	ld a, $03
	ld [hl], a
	ret
.asm_51e0e
	ld a, [hli]
	ld [wWarioXPos + 1], a
	ld a, [hl]
	ld [wWarioXPos + 0], a
	ld de, Frameset_69a15
	call SetObjectFramesetPtr
	ld a, $0d
	ld [hli], a
	ld a, $02
	ld [hl], a
	ld a, TRUE
	ld [wIsTurning], a
	ret

.Func_51e28:
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld l, OBJ_STATE
	ld a, [hl]
	and a
	jr z, .asm_51e40
	cp $2a
	jr z, .asm_51dcb
	and $fe
	cp $08
	jp z, .asm_51d76
	xor a
	ld [hl], a
.asm_51e40
	ld l, OBJ_VAR_1
	ld a, [hl]
	and a
	jp z, .asm_51f8a
	cp $01
	jp z, .asm_51efc
	cp $02
	jr z, .asm_51e6e
	cp $03
	jr z, .asm_51e97
	cp $04
	jr z, .asm_51e91
	cp $05
	jr z, .asm_51e5d
	ret
.asm_51e5d
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jp nz, .asm_51f46
.asm_51e67
	xor a
	ld [wCurObjVar1], a
	jp .asm_52155
.asm_51e6e
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld l, OBJ_X_POS
	ld a, [hli]
	sub $14
	ld [wWarioXPos + 1], a
	ld a, [hl]
	sbc $00
	ld [wWarioXPos + 0], a
	ld de, Frameset_6992d
	call SetObjectFramesetPtr
	ld a, $3c
	ld [hli], a
	ld a, $03
	ld [hl], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_HDIR_F, [hl]
	ret
.asm_51e91
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret
.asm_51e97
	ld a, [wGlobalCounter]
	and $5f
	play_sfx z, SFX_WATER_SURFACE
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	and a
	jr z, .asm_51eae
	dec [hl]
	ret
.asm_51eae
	ld l, OBJ_Y_POS
	ld a, [hli]
	add $06
	ldh [hYPosLo], a
	ld a, [hli]
	adc $00
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_352b
	and a
	jr nz, .asm_51ed4
	ld a, [wGlobalCounter]
	and $03
	ret nz
	ld b, $01
	call AddYOffset
	jp MoveObjectDown
.asm_51ed4
	xor a
	ld [wAutoMoveState], a
	play_sfx SFX_0B9
	ld hl, wCurObjVar1
	ld a, $04
	ld [hli], a
	ld [hl], a
	call MoveObjectUpByVar2
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_51ef6
	ld de, Frameset_6990a
	jp SetObjectFramesetPtr
.asm_51ef6
	ld de, Frameset_69942
	jp SetObjectFramesetPtr

.asm_51efc
	ld a, [wCurObjFramesetOffset]
	cp $02
	jr nz, .asm_51f12
	ld a, [wCurObjFrameDuration]
	cp $01
	play_sfx z, SFX_0AE
.asm_51f12
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
	jr z, .asm_51f46
	ld a, [wWarioScreenYPos]
	ld b, a
	ld a, [wCurObjScreenYPos]
	cp b
	jr c, .asm_51f46
	ld a, [wGlobalCounter]
	and $03
	jr nz, .asm_51f46
	ld hl, wCurObjVar3
	inc [hl]
	call MoveObjectUp
.asm_51f46
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_51f6c
	ld a, [hli]
	sub $10
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectLeft
	jr .asm_51f7d
.asm_51f6c
	ld a, [hli]
	add $0f
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectRight
.asm_51f7d
	ld hl, wCurObjVar2
	dec [hl]
	ret nz
	ld a, $3c
	ld [hld], a
	xor a
	ld [hl], a
	jp .asm_52068

.asm_51f8a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_51f96
	dec [hl]
	ret nz
	jp .asm_52155
.asm_51f96
	ld l, OBJ_VAR_3
	ld a, [hl]
	and a
	jr z, .asm_51fae
	ld a, [wGlobalCounter]
	rra
	jr c, .asm_51fa6
	dec [hl]
	call MoveObjectDown
.asm_51fa6
	ld a, [wCurObjSubState]
	rlca
	jr nc, .asm_51fcb
	jr .asm_5201c
.asm_51fae
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	ld c, a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_52011
	ld a, [wWaterInteraction]
	and a
	jr z, .asm_51fcb
	ld a, c
	cp b
	jp nc, .asm_520c5
.asm_51fcb
	call .Func_521a5
	ld a, d
	cp $d0
	jr z, .asm_51ff1
	ld c, $2a
	add c
	ld d, a
	ld a, [wCurObjScreenYPos]
	add c
	cp d
	jr c, .asm_51ff1
	sub d
	cp $18
	jr nc, .asm_51ff1
	ld a, e
	add c
	ld e, a
	ld a, [wCurObjScreenXPos]
	add $0a
	sub e
	cp $30
	jp c, .asm_52108
.asm_51ff1
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	sub $10
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectLeft_Slow
	jr .asm_52060
.asm_52011
	ld a, [wWaterInteraction]
	and a
	jr z, .asm_5201c
	ld a, c
	cp b
	jp c, .asm_520c5
.asm_5201c
	call .Func_521a5
	ld a, d
	cp $d0
	jr z, .asm_52042
	ld c, $2a
	add c
	ld d, a
	ld a, [wCurObjScreenYPos]
	add c
	cp d
	jr c, .asm_52042
	sub d
	cp $18
	jr nc, .asm_52042
	ld a, [wCurObjScreenXPos]
	add $4a
	ld b, a
	ld a, e
	add c
	sub b
	cp $30
	jp c, .asm_52108
.asm_52042
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	add $0f
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectRight_Slow
.asm_52060
	ld hl, wCurObjVar2
	dec [hl]
	ret nz
	ld a, $3c
	ld [hl], a
.asm_52068
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	ld b, a
	ld a, [w1d147]
	cp $01
	jr z, .asm_52092
	cp $02
	jr z, .asm_520a2
	cp $03
	jr z, .asm_520b2
	xor a
	ld [w1d147], a
	ld c, $17
	sla b
	jr c, .asm_5208d
	ld de, Frameset_69981
	jr .asm_520c0
.asm_5208d
	ld de, Frameset_6997a
	jr .asm_520c0
.asm_52092
	ld c, $1b
	sla b
	jr c, .asm_5209d
	ld de, Frameset_6998f
	jr .asm_520c0
.asm_5209d
	ld de, Frameset_69988
	jr .asm_520c0
.asm_520a2
	ld c, $1f
	sla b
	jr c, .asm_520ad
	ld de, Frameset_6999d
	jr .asm_520c0
.asm_520ad
	ld de, Frameset_69996
	jr .asm_520c0
.asm_520b2
	ld c, $25
	sla b
	jr c, .asm_520bd
	ld de, Frameset_699ab
	jr .asm_520c0
.asm_520bd
	ld de, Frameset_699a4
.asm_520c0
	call SetObjectFramesetPtr
	ld [hl], c
	ret

.asm_520c5
	ld a, $01
	ld [wCurObjVar1], a
	ld a, [wCurObjSubState]
	ld b, a
	ld a, [w1d147]
	cp $01
	jr z, .asm_520eb
	cp $02
	jr z, .asm_520f9
	xor a
	ld [w1d147], a
	sla b
	jr c, .asm_520e6
	ld de, Frameset_69911
	jr .asm_52105
.asm_520e6
	ld de, Frameset_69949
	jr .asm_52105
.asm_520eb
	sla b
	jr c, .asm_520f4
	ld de, Frameset_69934
	jr .asm_52105
.asm_520f4
	ld de, Frameset_6996c
	jr .asm_52105
.asm_520f9
	sla b
	jr c, .asm_52102
	ld de, Frameset_6993b
	jr .asm_52105
.asm_52102
	ld de, Frameset_69973
.asm_52105
	jp SetObjectFramesetPtr

.asm_52108
	play_sfx SFX_0AD
	ld a, [wCurObjSubState]
	ld b, a
	ld a, [w1d147]
	cp $01
	jr z, .asm_52131
	cp $02
	jr z, .asm_5213f
	xor a
	ld [w1d147], a
	sla b
	jr c, .asm_5212c
	ld de, Frameset_699b2
	jr .asm_5214b
.asm_5212c
	ld de, Frameset_699c1
	jr .asm_5214b
.asm_52131
	sla b
	jr c, .asm_5213a
	ld de, Frameset_699b7
	jr .asm_5214b
.asm_5213a
	ld de, Frameset_699c6
	jr .asm_5214b
.asm_5213f
	sla b
	jr c, .asm_52148
	ld de, Frameset_699bc
	jr .asm_5214b
.asm_52148
	ld de, Frameset_699cb
.asm_5214b
	call SetObjectFramesetPtr
	ld a, $3c
	ld [hli], a
	ld a, $05
	ld [hl], a
	ret

.asm_52155
	ld a, [wCurObjSubState]
	ld b, a
	ld a, [w1d147]
	cp $01
	jr z, .asm_5217a
	cp $02
	jr z, .asm_52188
	cp $03
	jr z, .asm_52196
	xor a
	ld [w1d147], a
	sla b
	jr c, .asm_52175
	ld de, Frameset_6990a
	jr .asm_521a2
.asm_52175
	ld de, Frameset_69942
	jr .asm_521a2
.asm_5217a
	sla b
	jr c, .asm_52183
	ld de, Frameset_69918
	jr .asm_521a2
.asm_52183
	ld de, Frameset_69950
	jr .asm_521a2
.asm_52188
	sla b
	jr c, .asm_52191
	ld de, Frameset_6991f
	jr .asm_521a2
.asm_52191
	ld de, Frameset_69957
	jr .asm_521a2
.asm_52196
	sla b
	jr c, .asm_5219f
	ld de, Frameset_69926
	jr .asm_521a2
.asm_5219f
	ld de, Frameset_6995e
.asm_521a2
	jp SetObjectFramesetPtr

.Func_521a5:
	xor a
	ld b, a
	ld h, HIGH(wObj1)
.asm_521a9
	ld l, OBJ_UNK_07
	add l
	ld l, a
	ld a, [hl] ; OBJ_UNK_07
	cp $4a
	jr c, .asm_521ba
	ld a, l
	sub OBJ_UNK_07 - OBJ_FLAGS
	ld l, a
	ld a, [hl]
	rra
	jr c, .asm_521c4
.asm_521ba
	ld a, b
	cp LOW(wObj8)
	jr z, .asm_521cc
	add OBJ_STRUCT_LENGTH
	ld b, a
	jr .asm_521a9
.asm_521c4
	ld a, l
	add $0d
	ld l, a
	ld a, [hli]
	ld d, a
	ld e, [hl]
	ret
.asm_521cc
	ld d, $d0
	ld e, d
	ret

.Func_521d0:
	ld hl, wCurObjVar1
	ld a, [hl]
	and a
	jr z, .asm_52239
	cp $01
	jr z, .asm_5222b
	cp $02
	jr z, .asm_521e9
	cp $03
	jr z, .asm_521e4
	ret
.asm_521e4
	xor a
	ld [wCurObjFlags], a
	ret
.asm_521e9
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $30
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectLeft_Slow
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_51
	ld [hli], a
	ld a, $03
	ld [wCurObjVar1], a
	ld hl, wCurObjUnk02
	ld e, $07
	farcall Func_ba42
	ld a, $01
	ld [wDollBoyHammerStage], a
	ret
.asm_5222b
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	inc l
	ld a, $02
	ld [hl], a
	ld de, Frameset_6995e
	jp SetObjectFramesetPtr
.asm_52239
	ld l, OBJ_Y_POS
	ld a, [hli]
	add $06
	ldh [hYPosLo], a
	ld a, [hli]
	adc $00
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_352b
	and a
	jp z, MoveObjectDown_Slow
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_52265
	ld de, Frameset_699a4
	call SetObjectFramesetPtr
	ld a, $25
	ld [hli], a
	ld a, $01
	ld [hl], a
	ret
.asm_52265
	ld a, $02
	ld [wCurObjVar1], a
	ret

DragonflySpawnerFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_52282)
	ld [hld], a
	ld a, LOW(.Func_52282)
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, $3c
	ld [wCurObjStateDuration], a
	ret

.Func_52282:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5229a)
	ld [hld], a
	ld a, LOW(.Func_5229a)
	ld [hld], a
	ret

.Func_5229a:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld a, [w1d147]
	cp $03
	jr z, .asm_522cf
	xor a
	ld b, a
	ld h, HIGH(wObj1)
.asm_522af
	ld l, OBJ_UNK_07
	add l
	ld l, a
	ld a, [hl] ; OBJ_UNK_07
	cp $48
	jr nz, .asm_522bf
	ld a, l
	sub OBJ_UNK_07 - OBJ_FLAGS
	ld l, a
	ld a, [hli] ; OBJ_FLAGS
	rra
	ret c
.asm_522bf
	ld a, b
	cp LOW(wObj8)
	jr z, .spawn_dragonfly
	add OBJ_STRUCT_LENGTH
	ld b, a
	jr .asm_522af
.spawn_dragonfly
	ld bc, ObjParams_Dragonfly1
	jp CreateObjectAtRelativePos

.asm_522cf
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_522d9)
	ld [hld], a
	ld a, LOW(.Func_522d9)
	ld [hld], a
	ret

.Func_522d9:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld a, [wDollBoyHammerStage]
	and a
	ret z
	xor a
	ld [wCurObjFlags], a
	ld hl, wCurObjUnk02
	ld e, $08
	farcall Func_ba42
	ld a, $03
	ld [wcac3], a
	call UpdateLevelMusic
	xor a
	ld [wIsBossBattle], a
	ld a, $01
	ld [wca6a], a
	ld a, $60
	ld [wca6b], a
	ret

Dragonfly1Func:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_52321)
	ld [hld], a
	ld a, LOW(.Func_52321)
	ld [hld], a
	ret

.Func_52321:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, MoveObjectDown_Fast
	ld a, $70
	ld [hli], a
	xor a
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5233b)
	ld [hld], a
	ld a, LOW(.Func_5233b)
	ld [hld], a
	ret

.Func_5233b:
	call SetOneWayPlatformAction
	ld hl, wCurObjVar1
	ld a, [hl]
	and a
	jr z, .asm_52359
	dec [hl]
	ret nz
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_52353
	ld de, Frameset_699d0
	jp SetObjectFramesetPtr
.asm_52353
	ld de, Frameset_699d5
	jp SetObjectFramesetPtr
.asm_52359
	ld a, [w1d147]
	cp $03
	jr z, .asm_523a3
	dec l
	dec [hl]
	jr z, .asm_52388
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_52379
	call MoveObjectLeft
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	ret z
	res OBJFLAG_STEPPED_F, [hl]
	ld b, $01
	jp SubXOffset
.asm_52379
	call MoveObjectRight
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	ret z
	res OBJFLAG_STEPPED_F, [hl]
	ld b, $01
	jp AddXOffset
.asm_52388
	ld a, $70
	ld [hli], a
	ld a, $11
	ld [hl], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	rlca
	jr c, .asm_5239d
	ld de, Frameset_699df
	jp SetObjectFramesetPtr
.asm_5239d
	ld de, Frameset_699da
	jp SetObjectFramesetPtr
.asm_523a3
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_523b1)
	ld [hld], a
	ld a, LOW(.Func_523b1)
	ld [hld], a
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

.Func_523b1:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjSubState]
	rlca
	jp c, MoveObjectRight_Fast
	jp MoveObjectLeft_Fast

Dragonfly2Func:
	ld de, Frameset_699d0
	call SetObjectFramesetPtr
	ld a, $28
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_523f2)
	ld [hld], a
	ld a, LOW(.Func_523f2)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $06
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld a, $f9
	ld [hl], a
	ld a, $40
	ld [wCurObjVar2], a
	call MoveObjectLeftByVar2
	ld a, $50
	ld [wCurObjVar2], a
	jp MoveObjectUpByVar2

.Func_523f2:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $50
	ld [hli], a
	xor a
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5240f)
	ld [hld], a
	ld a, LOW(.Func_5240f)
	ld [hld], a
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ret

.Func_5240f:
	call SetOneWayPlatformAction
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld hl, wCurObjVar1
	ld a, [hl]
	and a
	jr z, .asm_52423
	cp $01
	jr z, .asm_52441
	ret
.asm_52423
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jr z, .asm_5243a
	call MoveObjectDown
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	ret z
	res OBJFLAG_STEPPED_F, [hl]
	ld b, $01
	call AddYOffset
	jp HandleDownwardsFloorTransition
.asm_5243a
	ld a, $50
	ld [hli], a
	ld a, $01
	ld [hl], a
	ret
.asm_52441
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jr z, .asm_52458
	call MoveObjectUp
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	ret z
	res OBJFLAG_STEPPED_F, [hl]
	ld b, $01
	call SubYOffset
	jp HandleUpwardsFloorTransition
.asm_52458
	ld a, $50
	ld [hli], a
	xor a
	ld [hl], a
	ret

FlySpawnerFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_52475)
	ld [hld], a
	ld a, LOW(.Func_52475)
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, $c8
	ld [wCurObjStateDuration], a
	ret

.Func_52475:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld a, [wCurObjScreenYPos]
	cp $a0
	ret nc
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_52497)
	ld [hld], a
	ld a, LOW(.Func_52497)
	ld [hld], a
	xor a
	ld [wDollBoyActiveBarrels], a
	ret

.Func_52497:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld a, [w1d147]
	cp $03
	jr z, .asm_524dc
	ld a, [wDollBoyActiveBarrels]
	and a
	ret nz
	ld a, [wTransformation]
	and a
	ret nz
	ld a, [wAutoMoveState]
	and a
	jr nz, .asm_524e6

	xor a ; LOW(wObj1)
	ld b, a
	ld h, HIGH(wObj1)
.loop_objs
	ld l, OBJ_UNK_07
	add l
	ld l, a
	ld a, [hl] ; OBJ_UNK_07
	cp $49
	jr nz, .next_obj
	ld a, l
	sub OBJ_UNK_07 - OBJ_FLAGS
	ld l, a
	ld a, [hli] ; OBJ_FLAGS
	rra
	ret c
.next_obj
	ld a, b
	cp LOW(wObj8)
	jr z, .spawn_fly
	add OBJ_STRUCT_LENGTH
	ld b, a
	jr .loop_objs
.spawn_fly
	ld bc, ObjParams_Fly
	jp CreateObjectAtRelativePos
.asm_524dc
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_524eb)
	ld [hld], a
	ld a, LOW(.Func_524eb)
	ld [hld], a
	ret
.asm_524e6
	xor a
	ld [wCurObjFlags], a
	ret

.Func_524eb:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld a, [wDollBoyHammerStage]
	and a
	ret z
	ld hl, wCurObjUnk02
	ld e, $09
	farcall Func_ba42
	xor a
	ld [wCurObjFlags], a
	ret

FlyFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_52533)
	ld [hld], a
	ld a, LOW(.Func_52533)
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld a, $03
	ld [wDollBoyActiveBarrels], a
	play_sfx SFX_0BE
	ld bc, ObjParams_Cheese
	jp CreateObjectFromCurObjPos

.Func_52533:
	ld hl, wCurObjState
	ld a, [hl]
	cp $5a
	jr z, .asm_52545
	cp $5b
	jr z, .asm_5255e
	cp $5c
	jr z, .asm_5257d
	jr .asm_52591
.asm_52545
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jp nz, MoveObjectDown
	ld a, $70
	ld [hl], a
	ld a, $5b
	ld [wCurObjState], a
	ld a, $01
	ld [wDollBoyActiveBarrels], a
	ret
.asm_5255e
	ld bc, Data_604c0
	call ApplyObjYMovement_Loop
	ld a, [wDollBoyActiveBarrels]
	and a
	jr z, .asm_5256f
	ld a, [wGlobalCounter]
	rra
	ret nc
.asm_5256f
	call MoveObjectLeft
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $5c
	ld [wCurObjState], a
	ret
.asm_5257d
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld l, OBJ_FLAGS
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jp nz, MoveObjectUp
	xor a
	ld [wCurObjFlags], a
	ld [wDollBoyActiveBarrels], a
	ret
.asm_52591
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_525a5
	ld a, HIGH(Func_3407)
	ld c, LOW(Func_3407)
	jr .asm_525a9
.asm_525a5
	ld a, HIGH(Func_33f8)
	ld c, LOW(Func_33f8)
.asm_525a9
	ld hl, wCurObjUpdateFunction + 1
	ld [hld], a
	ld [hl], c
	ld l, OBJ_VAR_3
	xor a
	ld [hld], a
	ld a, $01
	ld [hl], a
	ld hl, wDollBoyActiveBarrels
	ld a, [hl]
	and a
	ret z
	ld a, $02
	ld [hl], a
	ret

CheeseFunc:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjState]
	and a
	jr nz, .asm_52634
	ld a, [wDollBoyActiveBarrels]
	and a
	jr z, .asm_52638
	cp $02
	jr z, .asm_52614
	cp $03
	jr nz, .find_fly_obj
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a

.find_fly_obj
	ld a, LOW(wObj1)
	ld b, LOW(wObj1)
	ld h, HIGH(wObj1)
.loop_objs
	ld l, OBJ_UNK_07
	add l
	ld l, a
	ld a, [hl] ; OBJ_UNK_07
	cp $49
	jr nz, .next_obj
	ld a, l
	sub OBJ_UNK_07 - OBJ_FLAGS
	ld l, a
	ld a, [hli] ; OBJ_FLAGS
	rra
	jr c, .adjust_coord
.next_obj
	ld a, b
	cp LOW(wObj8)
	ret z
	add OBJ_STRUCT_LENGTH
	ld b, a
	jr .loop_objs
.adjust_coord
	inc l
	inc l
	ld a, [hli] ; OBJ_Y_POS
	add $0b
	ld [wCurObjYPos + 0], a
	ld a, [hli]
	adc $00
	ld [wCurObjYPos + 1], a
	ld a, [hli] ; OBJ_X_POS
	ld [wCurObjXPos + 0], a
	ld a, [hl]
	ld [wCurObjXPos + 1], a
	ret

.asm_52614
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
	ld a, [wc0dd]
	and a
	jr nz, .asm_5263d
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jp nz, MoveObjectDown_Fast
.asm_52634
	xor a
	ld [wDollBoyActiveBarrels], a
.asm_52638
	xor a
	ld [wCurObjFlags], a
	ret
.asm_5263d
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jr z, .asm_52634
	call MoveObjectDown_Slow
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld a, $18
	ld [hl], a
	ld b, PARTICLE_BUBBLES
	farcall CreateParticle
	ret
