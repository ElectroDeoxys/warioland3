BrrrBearFunc:
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
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $08
	ld [hld], a
	ld a, $f7
	ld [hld], a
	ld a, $f9
	ld [hl], a
	jp .Func_4811f

.Update:
	ld a, [wCurObjState]
	jumptable

	dw .Func_4811f
	dw .Func_481aa
	dw .Func_482b2
	dw .Func_482ba
	dw .Func_48434
	dw .Func_48458
	dw .Func_4848e
	dw .Func_484a1
	dw .Func_483f5
	dw .Func_483ff
	dw .Func_480e7
	dw .Func_4811f
	dw .Func_4811f
	dw .Func_4811f
	dw .Func_4811f
	dw .Func_48341
	dw .Func_4836a
	dw .Func_48153
	dw .Func_484f3
	dw .Func_483a4
	dw .Func_48322
	dw .Func_48326
	dw .Func_482e0
	dw .Func_48301
	dw .Func_484d3
	dw .Func_484b4
	dw Func_3263
	dw Func_3272
	dw Func_3281
	dw .Func_4811f
	dw .Func_4811f
	dw .Func_4811f
	dw Func_3191
	dw Func_31af
	dw Func_31cd
	dw Func_31eb
	dw Func_3209
	dw Func_3227
	dw Func_3245
	dw Func_3254
	dw .Func_4842a
	dw .Func_48420
	dw .Func_4811f
	dw .Func_4811f
	dw .Func_4811f
	dw .Func_4816f
	dw .Func_4811f
	dw .Func_4811f
	dw ObjState_Fall
	dw .Func_481ca
	dw ObjState_BumpLeft
	dw ObjState_BumpRight
	dw Func_3326
	dw Func_3317
	dw Func_3335
	dw Func_3344
	dw Func_31fa
	dw Func_31dc
	dw .Func_4811f
	dw .Func_4811f
	dw .Func_4811f
	dw .Func_4811f
	dw .Func_4811f
	dw .Func_48350
	dw .Func_48399
	dw ObjState_StandingFall
	dw Func_3371
	dw .Func_483c5
	dw Func_32cc
	dw Func_32db
	dw .Func_482f3
	dw .Func_48314
	dw .Func_484e2
	dw .Func_484c3
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
	dw .Func_4811f
	dw .Func_4811f
	dw .Func_4811f

.Func_480e7:
	ld a, [wCurObjAction]
	and a
	jp z, VanishObject2
	ld a, [wTransformation]
	and a
	jp nz, VanishObject2
	ld a, [wEffectivePowerUp]
	cp $06
	jp nc, VanishObject2
	ld a, [wCurObjInteractionType]
	and $7f
	jp z, VanishObject2
	play_sfx SFX_014
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jp nc, .Func_483f5
	jp .Func_483ff

.Func_4811f:
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
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
	jr c, .asm_48147
	res OBJSUBFLAG_HDIR_F, [hl]
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_69115
	call SetObjectFramesetPtr
	ret
.asm_48147
	set OBJSUBFLAG_HDIR_F, [hl]
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_69126
	call SetObjectFramesetPtr
	ret

.Func_48153:
	ld hl, wCurObjState
	ld a, $41
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_48166
	xor a
	ld [hld], a
	ld de, Frameset_69115
	call SetObjectFramesetPtr
	ret

.asm_48166
	xor a
	ld [hld], a
	ld de, Frameset_69126
	call SetObjectFramesetPtr
	ret

.Func_4816f:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_48180
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_48180
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_481a4
	ld a, [hl]
	cp $22
	ret nz
	play_sfx SFX_07E
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_4819e
	ld bc, ObjParams_SnowflakeLeft
	jp CreateObjectAtRelativePos
.asm_4819e
	ld bc, ObjParams_SnowflakeRight
	jp CreateObjectAtRelativePos
.asm_481a4
	ld a, $13
	ld [wCurObjState], a
	ret

.Func_481aa:
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
	jr c, .asm_481c3
	ld de, Frameset_69115
	call SetObjectFramesetPtr
	ret

.asm_481c3
	ld de, Frameset_69126
	call SetObjectFramesetPtr
	ret

.Func_481ca:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_481db
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_481db
	ld c, $2a
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp $18
	jr c, .asm_481ef
	cp $e8
	jr c, .asm_48222
.asm_481ef
	ld hl, wCurObjSubState
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
	cp $b8
	jr nc, .asm_48211
	cp $48
	jr nc, .asm_48222
	ld a, [hli]
	rlca
	jr c, .asm_4820d
	ld de, Frameset_6913d
	jr .asm_48218
.asm_4820d
	ld a, $13
	ld [hl], a
	ret

.asm_48211
	ld a, [hli]
	rlca
	jr nc, .asm_4820d
	ld de, Frameset_6914c
.asm_48218
	ld a, $2d
	ld [hl], a
	call SetObjectFramesetPtr
	ld a, $39
	ld [hli], a
	ret

.asm_48222
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
	jr nz, .asm_4823d
	ld a, $11
	ld [wCurObjState], a
	ret

.asm_4823d
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_4827e
	ld a, [hl]
	and $0f
	sub $08
	jr nc, .asm_4825a
	call ProcessBlockOnLeft
	and $0f
	jr z, .asm_48278
.asm_4825a
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
.asm_48278
	ld a, $13
	ld [wCurObjState], a
	ret

.asm_4827e
	ld a, [hl]
	and $0f
	add $07
	cp $10
	jr c, .asm_4828e
	call ProcessBlockOnRight
	and $0f
	jr z, .asm_482ac
.asm_4828e
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
.asm_482ac
	ld a, $13
	ld [wCurObjState], a
	ret

.Func_482b2:
	ld hl, wCurObjState
	ld a, $32
	ld [hld], a
	jr .asm_482c0
.Func_482ba:
	ld hl, wCurObjState
	ld a, $33
	ld [hld], a
.asm_482c0
	ld a, [hld]
	rlca
	jr c, .asm_482c9
	ld de, Frameset_69137
	jr .asm_482cc
.asm_482c9
	ld de, Frameset_6913a
.asm_482cc
	call SetObjectFramesetPtr
	ld a, $0c
	ld [hld], a
	ld a, $02
	ld [wCurObjVar2], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ret

.Func_482e0:
	ld a, $46
	ld [wCurObjState], a
	ld de, Frameset_6915b
	call SetObjectFramesetPtr
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
.Func_482f3:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, $0f
	ld [wCurObjState], a
	ret

.Func_48301:
	ld a, $47
	ld [wCurObjState], a
	ld de, Frameset_6915b
	call SetObjectFramesetPtr
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
.Func_48314:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, $0f
	ld [wCurObjState], a
	ret

.Func_48322:
	ld a, $44
	jr .asm_48328
.Func_48326:
	ld a, $45
.asm_48328
	ld [wCurObjState], a
	ld de, Frameset_6915b
	call SetObjectFramesetPtr
	inc l
	inc l
	ld a, $02
	ld [hli], a
	xor a
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
	ret

.Func_48341:
	ld a, $3f
	ld [wCurObjState], a
	ld a, $64
	ld [wCurObjStateDuration], a
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
.Func_48350:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_4835d
	ld a, $1c
	ld [wCurObjState], a
	ret

.asm_4835d
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_32ea
	ld a, $10
	ld [wCurObjState], a
	ret

.Func_4836a:
	ld hl, wCurObjState
	ld a, $40
	ld [hld], a
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_48385
	ld de, Frameset_69183
	res OBJSUBFLAG_HDIR_F, [hl]
	jr .asm_4838a
.asm_48385
	ld de, Frameset_6918e
	set OBJSUBFLAG_HDIR_F, [hl]
.asm_4838a
	call SetObjectFramesetPtr
	ld a, $28
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ret

.Func_48399:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $01
	ld [wCurObjState], a
	ret

.Func_483a4:
	ld hl, wCurObjState
	ld a, $43
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_483b3
	ld de, Frameset_69175
	jr .asm_483b6
.asm_483b3
	ld de, Frameset_6917c
.asm_483b6
	call SetObjectFramesetPtr
	ld a, $16
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ret

.Func_483c5:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_483d6
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_483d6
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $06
	jr z, .asm_483e8
	dec [hl]
	jp nz, Func_3308
	ld a, $01
	ld [wCurObjState], a
	ret

.asm_483e8
	dec [hl]
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	jr c, .asm_483f2
	set OBJSUBFLAG_HDIR_F, [hl]
	ret
.asm_483f2
	res OBJSUBFLAG_HDIR_F, [hl]
	ret

.Func_483f5:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $38
	jr .asm_48407

.Func_483ff:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $39
.asm_48407
	ld [hld], a
	ld de, Frameset_6915b
	call SetObjectFramesetPtr
	ld a, $04
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
	ld [hld], a
	ret

.Func_48420:
	ld hl, wCurObjState
	ld a, $59
	ld [hld], a
	ld b, $02
	jr .asm_4847a
.Func_4842a:
	ld hl, wCurObjState
	ld a, $58
	ld [hld], a
	ld b, $02
	jr .asm_4847a
.Func_48434:
	ld a, [wTransformation]
	and a
	jr nz, .asm_4844e
	ld a, [wEffectivePowerUp]
	cp $05
	jr nc, .asm_4844e
	ld a, [wCurObjInteractionType]
	and $7f
	jr z, .asm_4844e
	ld a, $08
	ld [wCurObjState], a
	ret

.asm_4844e
	ld hl, wCurObjState
	ld a, $34
	ld [hld], a
	ld b, $01
	jr .asm_4847a
.Func_48458:
	ld a, [wTransformation]
	and a
	jr nz, .asm_48472
	ld a, [wEffectivePowerUp]
	cp $05
	jr nc, .asm_48472
	ld a, [wCurObjInteractionType]
	and $7f
	jr z, .asm_48472
	ld a, $09
	ld [wCurObjState], a
	ret

.asm_48472
	ld hl, wCurObjState
	ld a, $35
	ld [hld], a
	ld b, $01
.asm_4847a
	ld a, [hl]
	and $f0
	ld [hld], a
	xor a
	ld [hld], a
	ld a, b
	ld [hld], a
	ld de, Frameset_69164
	call SetObjectFramesetPtr
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

.Func_4848e:
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
.Func_484a1:
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

.Func_484b4:
	ld a, $49
	ld [wCurObjState], a
	ld de, Frameset_6915b
	call SetObjectFramesetPtr
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_484c3:
	ld a, [wDirection]
	and a
	jp nz, Func_3353
	ld hl, wCurObjSubState
	ld a, [hl]
	xor $80
	ld [hl], a
	jr .Func_484d3

.Func_484d3:
	ld a, $48
	ld [wCurObjState], a
	ld de, Frameset_6915b
	call SetObjectFramesetPtr
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_484e2:
	ld a, [wDirection]
	and a
	jp z, Func_3362
	ld hl, wCurObjSubState
	ld a, [hl]
	xor $80
	ld [hl], a
	jp .Func_484b4

.Func_484f3:
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

SnowflakeFunc_Left:
	call MoveObjectLeft_Fast
	jr SnowflakeFunc
SnowflakeFunc_Right:
	call MoveObjectRight_Fast
SnowflakeFunc:
	ld hl, wCurObjFlags
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld a, [wCurObjState]
	and a
	ret z
	ld de, Frameset_6916e
	call SetObjectFramesetPtr
	ld a, $0c
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ret

.Update:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret
