HammerBotFunc:
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
	jp .Func_4434f

.Update:
	ld a, [wCurObjState]
	jumptable

	dw .Func_4434f
	dw .Func_4446c
	dw .Func_445c1
	dw .Func_445c9
	dw .Func_447d5
	dw .Func_447f9
	dw .Func_44839
	dw .Func_4484c
	dw .Func_4472f
	dw .Func_44739
	dw .Func_44317
	dw .Func_4476b
	dw .Func_44778
	dw .Func_4434f
	dw .Func_4434f
	dw .Func_44692
	dw .Func_446bb
	dw .Func_4438b
	dw .Func_448c2
	dw .Func_446d6
	dw .Func_4465d
	dw .Func_44665
	dw .Func_445f7
	dw .Func_4462a
	dw .Func_44890
	dw .Func_4485f
	dw Func_3263
	dw Func_3272
	dw Func_3281
	dw .Func_4434f
	dw .Func_4434f
	dw .Func_4434f
	dw Func_3191
	dw Func_31af
	dw Func_31cd
	dw Func_31eb
	dw Func_3209
	dw Func_3227
	dw Func_3245
	dw Func_3254
	dw .Func_447cb
	dw .Func_447c1
	dw .Func_4434f
	dw .Func_4434f
	dw .Func_4434f
	dw .Func_443a7
	dw .Func_443bf
	dw .Func_4434f
	dw ObjState_Fall
	dw .Func_4448c
	dw ObjState_BumpLeft
	dw ObjState_BumpRight
	dw Func_3326
	dw Func_3317
	dw Func_3335
	dw Func_3344
	dw Func_31fa
	dw Func_31dc
	dw .Func_4434f
	dw .Func_4479d
	dw .Func_447af
	dw .Func_4434f
	dw .Func_4434f
	dw .Func_446a1
	dw .Func_446c9
	dw ObjState_StandingFall
	dw Func_3371
	dw .Func_44703
	dw Func_32cc
	dw Func_32db
	dw .Func_4461c
	dw .Func_4464f
	dw .Func_448b1
	dw .Func_44880
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
	dw .Func_4434f
	dw .Func_4434f
	dw .Func_4434f

.Func_44317:
	ld a, [wCurObjAction]
	and a
	jp z, VanishObject2
	ld a, [wTransformation]
	and a
	jp nz, VanishObject2
	ld a, [wEffectivePowerUp]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp nc, VanishObject2
	ld a, [wCurObjInteractionType]
	and INTERACTION_MASK
	jp z, VanishObject2
	play_sfx SFX_014
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jp nc, .Func_4472f
	jp .Func_44739

.Func_4434f:
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f8
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
	jr c, .asm_4437f
	res OBJSUBFLAG_HDIR_F, [hl]
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_68b12
	call SetObjectFramesetPtr
	ret

.asm_4437f
	set OBJSUBFLAG_HDIR_F, [hl]
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_68b17
	call SetObjectFramesetPtr
	ret

.Func_4438b:
	ld hl, wCurObjState
	ld a, $41
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_4439e
	xor a
	ld [hld], a
	ld de, Frameset_68b12
	call SetObjectFramesetPtr
	ret

.asm_4439e
	xor a
	ld [hld], a
	ld de, Frameset_68b17
	call SetObjectFramesetPtr
	ret

.Func_443a7:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_443b4
	ld a, $1a
	ld [wCurObjState], a
	ret

.asm_443b4
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $2e
	ld [wCurObjState], a
	ret

.Func_443bf:
	ld a, [wGlobalCounter]
	ld b, a
	and $0f
	play_sfx z, SFX_107
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_443dc
	ld a, $1a
	ld [wCurObjState], a
	ret

.asm_443dc
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
	jr nz, .asm_443f7
	ld a, $11
	ld [wCurObjState], a
	ret

.asm_443f7
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_44438
	ld a, [hl]
	and $0f
	sub $10
	jr nc, .asm_44414
	call ProcessCellOnLeft
	and $0f
	jr z, .asm_44432
.asm_44414
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
	jp z, MoveObjectLeft
.asm_44432
	ld a, $13
	ld [wCurObjState], a
	ret

.asm_44438
	ld a, [hl]
	and $0f
	add $0f
	cp $10
	jr c, .asm_44448
	call ProcessCellOnRight
	and $0f
	jr z, .asm_44466
.asm_44448
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
	jp z, MoveObjectRight
.asm_44466
	ld a, $13
	ld [wCurObjState], a
	ret

.Func_4446c:
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
	jr c, .asm_44485
	ld de, Frameset_68b12
	call SetObjectFramesetPtr
	ret

.asm_44485
	ld de, Frameset_68b17
	call SetObjectFramesetPtr
	ret

.Func_4448c:
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jr z, .asm_444a3
	ld a, [wGlobalCounter]
	ld b, a
	and $1f
	play_sfx z, SFX_107
.asm_444a3
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_444b0
	ld a, $1a
	ld [wCurObjState], a
	ret

.asm_444b0
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
	jr nz, .asm_444cb
	ld a, $11
	ld [wCurObjState], a
	ret

.asm_444cb
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ld c, $2a
	ld a, [wCurObjSubState]
	rlca
	jp c, .asm_4454e
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp $18
	jr c, .asm_444ef
	cp $e8
	jr c, .asm_4451c
.asm_444ef
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
	cp $40
	jr nc, .asm_4451c
	ld de, Frameset_68b1c
	call SetObjectFramesetPtr
	ld a, 20
	ld [hli], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f0
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_BOUNCY
	ld [hld], a
	ld l, OBJ_STATE
	ld a, $2d
	ld [hld], a
	ret

.asm_4451c
	ld a, [hl]
	and $0f
	sub $08
	jr nc, .asm_4452a
	call ProcessCellOnLeft
	and $0f
	jr z, .asm_44548
.asm_4452a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	sub $08
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectLeft_Slow
.asm_44548
	ld a, $13
	ld [wCurObjState], a
	ret

.asm_4454e
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp $18
	jr c, .asm_44560
	cp $e8
	jr c, .asm_4458d
.asm_44560
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
	cp $c0
	jr c, .asm_4458d
	ld de, Frameset_68b25
	call SetObjectFramesetPtr
	ld a, 20
	ld [hli], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $0f
	ld [hld], a
	ld a, $f8
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_BOUNCY
	ld [hld], a
	ld l, OBJ_STATE
	ld a, $2d
	ld [hld], a
	ret

.asm_4458d
	ld a, [hl]
	and $0f
	add $07
	cp $10
	jr c, .asm_4459d
	call ProcessCellOnRight
	and $0f
	jr z, .asm_445bb
.asm_4459d
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	add $07
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectRight_Slow
.asm_445bb
	ld a, $13
	ld [wCurObjState], a
	ret

.Func_445c1:
	ld hl, wCurObjState
	ld a, $32
	ld [hld], a
	jr .asm_445cf
.Func_445c9:
	ld hl, wCurObjState
	ld a, $33
	ld [hld], a
.asm_445cf
	ld a, [hld]
	rlca
	jr c, .asm_445d8
	ld de, Frameset_68b58
	jr .asm_445db
.asm_445d8
	ld de, Frameset_68b5b
.asm_445db
	call SetObjectFramesetPtr
	ld a, 12
	ld [hld], a
	ld a, $02
	ld [wCurObjVar2], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f8
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ret

.Func_445f7:
	ld hl, wCurObjState
	ld a, $46
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_44606
	ld de, Frameset_68b2e
	jr .asm_44609
.asm_44606
	ld de, Frameset_68b37
.asm_44609
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f8
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
.Func_4461c:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, $0f
	ld [wCurObjState], a
	ret

.Func_4462a:
	ld hl, wCurObjState
	ld a, $47
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_44639
	ld de, Frameset_68b2e
	jr .asm_4463c
.asm_44639
	ld de, Frameset_68b37
.asm_4463c
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f8
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
.Func_4464f:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, $0f
	ld [wCurObjState], a
	ret

.Func_4465d:
	ld hl, wCurObjState
	ld a, $44
	ld [hld], a
	jr .asm_4466b
.Func_44665:
	ld hl, wCurObjState
	ld a, $45
	ld [hld], a
.asm_4466b
	ld a, [hld]
	rlca
	jr c, .asm_44674
	ld de, Frameset_68b2e
	jr .asm_44677
.asm_44674
	ld de, Frameset_68b37
.asm_44677
	call SetObjectFramesetPtr
	inc l
	inc l
	ld a, $02
	ld [hli], a
	xor a
	ld [hli], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f8
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
	ret

.Func_44692:
	ld a, $3f
	ld [wCurObjState], a
	ld a, $64
	ld [wCurObjStateDuration], a
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
.Func_446a1:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_446ae
	ld a, $1c
	ld [wCurObjState], a
	ret

.asm_446ae
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_32ea
	ld a, $10
	ld [wCurObjState], a
	ret

.Func_446bb:
	ld hl, wCurObjState
	ld a, $40
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ld a, $07
	ld [wCurObjStateDuration], a
.Func_446c9:
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_32f9
	ld a, $00
	ld [wCurObjState], a
	ret

.Func_446d6:
	ld hl, wCurObjState
	ld a, $43
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_446e5
	ld de, Frameset_68b4a
	jr .asm_446e8
.asm_446e5
	ld de, Frameset_68b51
.asm_446e8
	call SetObjectFramesetPtr
	ld a, 26
	ld [hli], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f8
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_PRIORITY_F, [hl]
	ret

.Func_44703:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_44710
	ld a, $1a
	ld [wCurObjState], a
	ret

.asm_44710
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $09
	jr z, .asm_44722
	dec [hl]
	jp nz, Func_3308
	ld a, $01
	ld [wCurObjState], a
	ret

.asm_44722
	dec [hl]
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	jr c, .asm_4472c
	set OBJSUBFLAG_HDIR_F, [hl]
	ret

.asm_4472c
	res OBJSUBFLAG_HDIR_F, [hl]
	ret

.Func_4472f:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $38
	jr .asm_44741

.Func_44739:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $39
.asm_44741
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_4474b
	ld de, Frameset_68b2e
	jr .asm_4474e
.asm_4474b
	ld de, Frameset_68b37
.asm_4474e
	call SetObjectFramesetPtr
	ld a, 4
	ld [hli], a
	inc l
	ld a, $02
	ld [hli], a
	xor a
	ld [hli], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f8
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
	ret

.Func_4476b:
	ld a, $3b
	ld [wCurObjState], a
	ld bc, ObjParams_StarsLeft
	ld de, Frameset_68b5e
	jr .asm_44783
.Func_44778:
	ld a, $3c
	ld [wCurObjState], a
	ld bc, ObjParams_StarsRight
	ld de, Frameset_68b61
.asm_44783
	call SetObjectFramesetPtr
	ld a, 20
	ld [hli], a
	ld a, $02
	ld [wCurObjVar2], a
	ld l, OBJ_FLAGS
	res OBJFLAG_PRIORITY_F, [hl]
	play_sfx SFX_049
	jp CreateObjectAtRelativePos

.Func_4479d:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld a, $13
	ld [wCurObjState], a
	ret

.Func_447af:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld a, $13
	ld [wCurObjState], a
	ret

.Func_447c1:
	ld hl, wCurObjState
	ld a, $59
	ld [hld], a
	ld b, $02
	jr .asm_4481b

.Func_447cb:
	ld hl, wCurObjState
	ld a, $58
	ld [hld], a
	ld b, $02
	jr .asm_4481b

.Func_447d5:
	ld a, [wTransformation]
	and a
	jr nz, .asm_447ef
	ld a, [wEffectivePowerUp]
	cp GARLIC
	jr nc, .asm_447ef
	ld a, [wCurObjInteractionType]
	and INTERACTION_MASK
	jr z, .asm_447ef
	ld a, $08
	ld [wCurObjState], a
	ret

.asm_447ef
	ld hl, wCurObjState
	ld a, $34
	ld [hld], a
	ld b, $01
	jr .asm_4481b

.Func_447f9:
	ld a, [wTransformation]
	and a
	jr nz, .asm_44813
	ld a, [wEffectivePowerUp]
	cp GARLIC
	jr nc, .asm_44813
	ld a, [wCurObjInteractionType]
	and INTERACTION_MASK
	jr z, .asm_44813
	ld a, $09
	ld [wCurObjState], a
	ret

.asm_44813
	ld hl, wCurObjState
	ld a, $35
	ld [hld], a
	ld b, $01
.asm_4481b
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
	jr c, .asm_44833
	ld de, Frameset_68b40
	jp SetObjectFramesetPtr
.asm_44833
	ld de, Frameset_68b45
	jp SetObjectFramesetPtr

.Func_44839:
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

.Func_4484c:
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

.Func_4485f:
	ld hl, wCurObjState
	ld a, $49
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_4486e
	ld de, Frameset_68b2e
	jr .asm_44871
.asm_4486e
	ld de, Frameset_68b37
.asm_44871
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f8
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_44880:
	ld a, [wDirection]
	and a
	jp nz, Func_3353
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	jr .Func_44890

.Func_44890
	ld hl, wCurObjState
	ld a, $48
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_4489f
	ld de, Frameset_68b2e
	jr .asm_448a2
.asm_4489f
	ld de, Frameset_68b37
.asm_448a2
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f8
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_448b1:
	ld a, [wDirection]
	and a
	jp z, Func_3362
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	jp .Func_4485f

.Func_448c2:
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
