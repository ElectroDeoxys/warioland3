AnonsterFunc:
	ld a, TRUE
	ld [wIsBossBattle], a
	ld a, 27
	ld [wCurObjVar2], a
	call MoveObjectUpByVar2
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, [hl]
	and $f0
	or $04
	ld [hl], a
	ld a, $28
	ld [wCurObjStateDuration], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_50024)
	ld [hld], a
	ld a, LOW(.Func_50024)
	ld [hld], a
.Func_50024:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $02
	ld [wBossBattleMusic], a
	call UpdateLevelMusic

.asm_50031
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_5003c
	ld de, Frameset_693c4
	jr .asm_5003f
.asm_5003c
	ld de, Frameset_693d5
.asm_5003f
	call SetObjectFramesetPtr
	ld a, $50
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5005e)
	ld [hld], a
	ld a, LOW(.Func_5005e)
	ld [hld], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $08
	ld [hld], a
	ld a, $f7
	ld [hld], a
	ld a, $fc
	ld [hld], a
	ld a, $e3
	ld [hld], a
	res 7, [hl]
	ret

.Func_5005e:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5007f)
	ld [hld], a
	ld a, LOW(.Func_5007f)
	ld [hld], a
	ld l, OBJ_STATE
	xor a
	ld [hld], a
	dec l
	ld [hld], a
	ld [hld], a
	dec l
	ld [hld], a
	ret

.Func_5007f:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjState
	ld a, [hld]
	and $fe
	cp $28
	jr nz, .asm_500a8
	ld a, [hld]
	rlca
	jr c, .asm_50097
	ld de, Frameset_6943c
	jr .asm_5009a
.asm_50097
	ld de, Frameset_69441
.asm_5009a
	call SetObjectFramesetPtr
	xor a
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_50282)
	ld [hld], a
	ld a, LOW(.Func_50282)
	ld [hld], a
	ret

.asm_500a8
	ld l, OBJ_FLAGS
	res OBJFLAG_NO_COLLISION_F, [hl]
	ld bc, Data_60790
	call ApplyObjYMovement_Loop
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_500cd
	dec [hl]
	ret nz
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_500c7
	ld de, Frameset_693c4
	jp SetObjectFramesetPtr
.asm_500c7
	ld de, Frameset_693d5
	jp SetObjectFramesetPtr
.asm_500cd
	ld l, OBJ_VAR_3
	ld a, [hld]
	cp $4f
	jr nz, .asm_50118
	inc [hl]
	ld a, [hl]
	cp $02
	jr c, .asm_50118
	farcall _CountActiveTransientObjects
	ld a, e
	and a
	jr nz, .asm_50118
	xor a
	ld [hli], a
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5016f)
	ld [hld], a
	ld a, LOW(.Func_5016f)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_50110
	res OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_693e6
	jp SetObjectFramesetPtr
.asm_50110
	set OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_69411
	jp SetObjectFramesetPtr
.asm_50118
	inc l
	ld a, [hl]
	dec a
	play_sfx z, SFX_0B0
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_5014e
	ld a, [hli]
	sub $11
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectLeft
	ld de, Frameset_69446
	jr .asm_50162
.asm_5014e
	ld a, [hli]
	add $10
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectRight
	ld de, Frameset_69512
.asm_50162
	call SetObjectFramesetPtr
	ld a, $0a
	ld [hli], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	ret

.Func_5016f:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjVar3]
	cp $1f
	jr z, .asm_50185
	cp $4f
	jr z, .asm_501a3
.asm_5017f
	ld bc, Data_60790
	jp ApplyObjYMovement_Loop
.asm_50185
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_501c4)
	ld [hld], a
	ld a, LOW(.Func_501c4)
	ld [hld], a

.asm_5018e
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_50199
	ld de, Frameset_693f9
	jr .asm_5019c
.asm_50199
	ld de, Frameset_69424
.asm_5019c
	call SetObjectFramesetPtr
	ld a, $20
	ld [hli], a
	ret

.asm_501a3
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_5007f)
	ld [hld], a
	ld a, LOW(.Func_5007f)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	ld a, [hld]
	rlca
	jr c, .asm_501b9
	xor a
	ld [hld], a
	ld de, Frameset_693c4
	jr .asm_501be
.asm_501b9
	xor a
	ld [hld], a
	ld de, Frameset_693d5
.asm_501be
	call SetObjectFramesetPtr
	xor a
	ld [hl], a
	ret

.Func_501c4:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_501ed
	ld a, [hl]
	cp $18
	ret nz
	play_sfx SFX_07E
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_501e7
	ld bc, ObjParams_AnonsterSilk1Left
	jp CreateObjectAtRelativePos
.asm_501e7
	ld bc, ObjParams_AnonsterSilk1Right
	jp CreateObjectAtRelativePos
.asm_501ed
	ld a, [wCurObjSubState]
	and $0f
	cp $04
	jr z, .asm_50266
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_50200)
	ld [hld], a
	ld a, LOW(.Func_50200)
	ld [hld], a
	jr .asm_5018e
.Func_50200:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_50229
	ld a, [hl]
	cp $18
	ret nz
	play_sfx SFX_07E
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_50223
	ld bc, ObjParams_AnonsterSilk2Left
	jp CreateObjectAtRelativePos
.asm_50223
	ld bc, ObjParams_AnonsterSilk2Right
	jp CreateObjectAtRelativePos
.asm_50229
	ld a, [wCurObjSubState]
	and $0f
	cp $03
	jr z, .asm_50266
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5023d)
	ld [hld], a
	ld a, LOW(.Func_5023d)
	ld [hld], a
	jp .asm_5018e
.Func_5023d:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_50266
	ld a, [hl]
	cp $18
	ret nz
	play_sfx SFX_07E
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_50260
	ld bc, ObjParams_AnonsterSilk3Left
	jp CreateObjectAtRelativePos
.asm_50260
	ld bc, ObjParams_AnonsterSilk3Right
	jp CreateObjectAtRelativePos
.asm_50266
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5016f)
	ld [hld], a
	ld a, LOW(.Func_5016f)
	ld [hld], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_50279
	ld de, Frameset_69402
	jr .asm_5027c
.asm_50279
	ld de, Frameset_6942d
.asm_5027c
	call SetObjectFramesetPtr
	jp .asm_5017f

.Func_50282:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_50293)
	ld [hld], a
	ld a, LOW(.Func_50293)
	ld [hld], a
	play_sfx SFX_0B1
.Func_50293:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_502ae
	dec [hl]
	ret nz
	inc l
	ld a, $03
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_502d1)
	ld [hld], a
	ld a, LOW(.Func_502d1)
	ld [hld], a
	ret

.asm_502ae
	ld a, [wCurObjScreenYPos]
	cp $08
	jp nc, MoveObjectUp_Slow
	ld a, $3c
	ld [wCurObjStateDuration], a
	ld l, OBJ_SUBSTATE
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_502ce
	res OBJSUBFLAG_HDIR_F, [hl]
	ret

.asm_502ce
	set OBJSUBFLAG_HDIR_F, [hl]
	ret

.Func_502d1:
	ld a, [wWarioScreenXPos]
	and $fe
	ld b, a
	ld a, [wCurObjScreenXPos]
	and $fe
	cp b
	jr z, .asm_50321
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_50305
	ld a, [hli]
	sub $11
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectLeft_Fast
	jr .asm_50316
.asm_50305
	ld a, [hli]
	add $10
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectRight_Fast
.asm_50316
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	ld l, OBJ_VAR_1
	dec [hl]
	ret nz
.asm_50321
	ld hl, wCurObjFlags
	res OBJFLAG_NO_COLLISION_F, [hl]
	xor a
	ld [wCurObjVar3], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5034c)
	ld [hld], a
	ld a, LOW(.Func_5034c)
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_48 | HEAVY_OBJ
	ld [hli], a
	ld a, $e8
	ld [hli], a
	ld a, $f8
	ld [hli], a
	ld a, $f4
	ld [hli], a
	ld a, $0b
	ld [hli], a
	ld de, Frameset_6944d
	jp SetObjectFramesetPtr

.Func_5034c:
	ld a, [wCurObjScreenYPos]
	cp $50
	jr c, .asm_50368
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
	jr nz, .asm_5036e
.asm_50368
	ld bc, Data_607f0
	jp ApplyObjYMovement
.asm_5036e
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_50397)
	ld [hld], a
	ld a, LOW(.Func_50397)
	ld [hld], a
	ld de, Frameset_69450
	call SetObjectFramesetPtr
	ld a, $20
	ld [hli], a
.asm_50388
	ld l, OBJ_COLLBOX_TOP
	ld a, $f0
	ld [hli], a
	ld a, $00
	ld [hli], a
	ld a, $f0
	ld [hli], a
	ld a, $0f
	ld [hli], a
	ret

.Func_50397:
	ld hl, wCurObjStateDuration
	dec [hl]
	ld a, [hl]
	cp $18
	jr z, .asm_503d3
	and a
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5041d)
	ld [hld], a
	ld a, LOW(.Func_5041d)
	ld [hld], a
	ld l, OBJ_STATE
	ld a, $5a
	ld [hld], a
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_503c4
	res 7, [hl]
	ld de, Frameset_694d0
	jr .asm_503c9
.asm_503c4
	set 7, [hl]
	ld de, Frameset_694c9
.asm_503c9
	call SetObjectFramesetPtr
	ld a, $07
	ld [hli], a
	ld a, $02
	ld [hl], a
	ret

.asm_503d3
	play_sfx SFX_061
	ld b, $18
	jp DoGroundShake

.asm_503e0
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jr z, .asm_50403
	ld a, [hl]
	cp $2b
	ret nz
	play_sfx SFX_07E
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_503fd
	ld bc, ObjParams_AnonsterWaveLeft
	jp CreateObjectAtRelativePos
.asm_503fd
	ld bc, ObjParams_AnonsterWaveRight
	jp CreateObjectAtRelativePos
.asm_50403
	inc l
	dec [hl]
	jp z, .asm_504b1
	ld l, OBJ_STATE
	ld a, $5c
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_50417
	ld de, Frameset_69485
	jp SetObjectFramesetPtr
.asm_50417
	ld de, Frameset_69496
	jp SetObjectFramesetPtr

.Func_5041d:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_5046b
	cp $5b
	jr z, .asm_503e0
	cp $5c
	jr z, .asm_504aa
	cp $5a
	jr z, .asm_50437
	cp $0a
	jp z, .asm_5054b
	jr .asm_5043b
.asm_50437
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
.asm_5043b
	ld l, OBJ_COLLBOX_RIGHT
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_5044d
	ld de, Frameset_69485
	ld a, $10
	ld [hld], a
	ld a, $f8
	jr .asm_50455
.asm_5044d
	ld de, Frameset_69496
	ld a, $07
	ld [hld], a
	ld a, $ef
.asm_50455
	ld [hld], a
	ld a, $00
	ld [hld], a
	ld a, $f0
	ld [hld], a
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_48
	ld [hli], a
	call SetObjectFramesetPtr
	xor a
	ld [hl], a
	ld [wCurObjState], a
	ret

.asm_5046b
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	and a
	jr z, .asm_5047f
	dec [hl]
	jr z, .asm_5043b
	ld a, [hl]
	cp $07
	ret nz
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	ret

.asm_5047f
	ld a, [wGlobalCounter]
	rra
	ret c
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wCurObjScreenXPos]
	sub b
	ld l, OBJ_SUBSTATE
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr nz, .asm_50499
	jr c, .asm_504fe
	ld de, Frameset_69463
	jr .asm_5049e
.asm_50499
	jr nc, .asm_504fe
	ld de, Frameset_69474
.asm_5049e
	call SetObjectFramesetPtr
	ld a, $5d
	ld [hli], a
	ld a, $5b
	ld [wCurObjState], a
	ret

.asm_504aa
	ld a, [wTransformation]
	cp TRANSFORMATION_BALL_O_STRING_WARIO
	jr nz, .asm_504d0

.asm_504b1
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_504bc
	ld de, Frameset_69554
	jr .asm_504bf
.asm_504bc
	ld de, Frameset_6954d
.asm_504bf
	call SetObjectFramesetPtr
	ld a, $07
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_50650)
	ld [hld], a
	ld a, LOW(.Func_50650)
	ld [hld], a
	jp .asm_50388

.asm_504d0
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	and a
	jr z, .asm_504e5
	dec [hl]
	jp z, .asm_5043b
	ld a, [hl]
	cp $07
	ret nz
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	ret

.asm_504e5
	ld l, OBJ_FRAME_DURATION
	ld a, [hl]
	cp $03
	jr c, .asm_504ef
	sub $03
	ld [hl], a
.asm_504ef
	ld a, [wGlobalCounter]
	and %1111
	play_sfx z, SFX_0AF
.asm_504fe
	ld l, OBJ_SUBSTATE
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr nz, .asm_50527
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	sub $14
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectLeft
	ld de, Frameset_69573
	jr .asm_50544
.asm_50527
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	add $17
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3543
	and a
	jp nz, MoveObjectRight
	ld de, Frameset_69568
.asm_50544
	call SetObjectFramesetPtr
	ld a, $0e
	ld [hli], a
	ret

.asm_5054b
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	sub b
	dec l
	bit 7, [hl]
	jr nz, .asm_50561
	jr c, .asm_50564
	jp .asm_5043b
.asm_50561
	jp c, .asm_5043b
.asm_50564
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_0B
	ld [hld], a
	play_sfx SFX_VANISH
	call Func_30fb
	ld a, [hld]
	rlca
	jr c, .asm_50580
	ld de, Frameset_694a7
	jr .asm_50583
.asm_50580
	ld de, Frameset_694b8
.asm_50583
	call SetObjectFramesetPtr
	ld a, [wCurObjSubState]
	and $0f
	dec a
	jr z, .asm_505a0
	ld a, $56
	ld [hl], a
	ld l, OBJ_FLAGS
	res OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_505be)
	ld [hld], a
	ld a, LOW(.Func_505be)
	ld [hld], a
	jp UpdateAnonsterPal
.asm_505a0
	ld a, $ac
	ld [hl], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and OBJSUBFLAG_HDIR
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_50689)
	ld [hld], a
	ld a, LOW(.Func_50689)
	ld [hld], a
	stop_music2
	ret

.Func_505be:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $4e
	play_sfx z, SFX_0B1
	dec [hl]
	ret nz
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_505e0
	ld de, Frameset_6953c
	jr .asm_505e3
.asm_505e0
	ld de, Frameset_69543
.asm_505e3
	call SetObjectFramesetPtr
	ld a, $0e
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_505f4)
	ld [hld], a
	ld a, LOW(.Func_505f4)
	ld [hld], a
	jp .asm_50388

.Func_505f4:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_6951e
	call SetObjectFramesetPtr
	ld a, $33
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_50610)
	ld [hld], a
	ld a, LOW(.Func_50610)
	ld [hld], a
	ret

.Func_50610:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_69519
	call SetObjectFramesetPtr
	xor a
	ld [wCurObjVar3], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_50635)
	ld [hld], a
	ld a, LOW(.Func_50635)
	ld [hld], a
	play_sfx SFX_0B2
	ret

.Func_50635:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjScreenYPos]
	cp $10
	jr c, .asm_50647
	ld bc, Data_607e0
	jp ApplyObjYMovement
.asm_50647
	ld a, [wTransformation]
	cp TRANSFORMATION_BALL_O_STRING_WARIO
	jp nz, .asm_50031
	ret

.Func_50650:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_694e1
	call SetObjectFramesetPtr
	ld a, $2d
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5066c)
	ld [hld], a
	ld a, LOW(.Func_5066c)
	ld [hld], a
	ret

.Func_5066c:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_6944d
	call SetObjectFramesetPtr
	xor a
	ld [wCurObjVar3], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_50635)
	ld [hld], a
	ld a, LOW(.Func_50635)
	ld [hld], a
	ret

.Func_50689:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_506f5
	cp $a4
	play_sfx z, SFX_0B1
	dec [hl]
	ret nz
	ld hl, wCurObjUnk02
	ld e, $05
	farcall Func_ba42
	ld a, $03
	ld [wBossBattleMusic], a
	call UpdateLevelMusic
	xor a
	ld [wIsBossBattle], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_506ce
	ld de, Frameset_694d7
	jr .asm_506d1
.asm_506ce
	ld de, Frameset_694dc
.asm_506d1
	call SetObjectFramesetPtr
	ld l, OBJ_STATE
	ld a, $48
	ld [hld], a
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_506eb
	res OBJSUBFLAG_HDIR_F, [hl]
	jr .asm_506ed
.asm_506eb
	set OBJSUBFLAG_HDIR_F, [hl]
.asm_506ed
	dec l
	xor a
	ld [hl], a
	ld l, OBJ_FLAGS
	set OBJFLAG_PRIORITY_F, [hl]
	ret

.asm_506f5
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_50705)
	ld [hld], a
	ld a, LOW(.Func_50705)
	ld [hld], a
	play_sfx SFX_0A3
.Func_50705:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld bc, Data_60180
	call ApplyObjYMovement
	ld a, [wCurObjSubState]
	rlca
	jp nc, MoveObjectRight
	jp MoveObjectLeft

SilkPlatformsFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.CreatePlatform1)
	ld [hld], a
	ld a, LOW(.CreatePlatform1)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld a, $28
	ld [wCurObjStateDuration], a
	jr .asm_50746

.CreatePlatform3:
	ld bc, ObjParams_SilkPlatform3
	ld de, .Wait
	jr .asm_50746
.CreatePlatform2:
	ld bc, ObjParams_SilkPlatform2
	ld de, .CreatePlatform3
	jr .asm_50746
.CreatePlatform1:
	ld bc, ObjParams_SilkPlatform1
	ld de, .CreatePlatform2
.asm_50746
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $32
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, d
	ld [hld], a
	ld a, e
	ld [hld], a
	jp CreateObjectAtRelativePos

.Wait:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, 2
	ld [wCurObjFrameDuration], a
	ret

SilkPlatformFunc:
	call SetOneWayPlatformAction
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	ret z
	dec [hl]
	jp MoveObjectDown_Slow

AnonsterSilkFunc:
.FloatLeft:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_507f7
	call MoveObjectLeft_Fast
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	sub $05
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr z, .asm_507ae
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.FloatRight)
	ld [hld], a
	ld a, LOW(.FloatRight)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	set OBJSUBFLAG_HDIR_F, [hl]
	ret

.asm_507ae
	ld hl, wCurObjStateDuration
	dec [hl]
	jp z, .asm_50849
	jp .asm_50855

.FloatRight:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_507f7
	call MoveObjectRight_Fast
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	add $04
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr z, .asm_507ed
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.FloatLeft)
	ld [hld], a
	ld a, LOW(.FloatLeft)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_HDIR_F, [hl]
	ret

.asm_507ed
	ld hl, wCurObjStateDuration
	dec [hl]
	jp z, .asm_50849
	jp .asm_50855
.asm_507f7
	ld a, [wCurObjScreenYPos]
	cp $b0
	jr c, .asm_50803
	xor a
	ld [wCurObjFlags], a
	ret

.asm_50803
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [wCurObjSubState]
	rlca
	jr nc, .asm_5082a
	ld bc, Data_60800
	call Func_34a0
	ld l, OBJ_X_POS
	ld a, [hli]
	sub $05
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	jr .asm_5083c
.asm_5082a
	ld bc, Data_60830
	call Func_34a0
	ld l, OBJ_X_POS
	ld a, [hli]
	add $04
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
.asm_5083c
	call Func_3513
	and a
	jr nz, .asm_5084e
	ld a, [wCurObjVar2]
	cp $2e
	jr nz, .asm_50855
.asm_50849
	ldh a, [rDIV]
	rra
	jr c, .asm_50855
.asm_5084e
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
.asm_50855
	ld a, [wCurObjState]
	and a
	jr z, .asm_50861
	cp $0b
	jr c, .Func_50898
	jr .destroy
.asm_50861
	ld a, [wGlobalCounter]
	and %11
	ret nz
	call MoveObjectDown
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
	ld de, Frameset_694f5
	call SetObjectFramesetPtr
	ld a, $64
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_508cd)
	ld [hld], a
	ld a, LOW(.Func_508cd)
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
	ret

.Func_50898:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_508be)
	ld [hld], a
	ld a, LOW(.Func_508be)
	ld [hld], a
	ld de, Frameset_6955b
	call SetObjectFramesetPtr
	ld a, $1d
	ld [hli], a
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	play_sfx SFX_0A1
	ret

.Func_508be:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz

.destroy
	xor a
	ld [wCurObjFlags], a
	ret

.Func_508cd:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld a, [wCurObjScreenYPos]
	cp $b0
	jr c, .asm_508dd
	cp $c0
	jr c, .Func_50898
.asm_508dd
	ld a, [wCurObjState]
	jumptable

	dw .Func_509ab
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw .Func_50a01
	dw .Func_50a0b
	dw .Func_50a1e
	dw .Func_50a31
	dw .Func_50898
	dw .Func_50898
	dw VanishObject2
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw .Func_509ab
	dw .Func_50898
	dw .Func_50898
	dw .Func_50a79
	dw .Func_50898
	dw .Func_50995
	dw .Func_5099d
	dw .Func_50898
	dw .Func_50898
	dw .Func_50a5e
	dw .Func_50a44
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw Func_3245
	dw Func_3254
	dw .Func_509ef
	dw .Func_509dd
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw ObjState_Fall
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw Func_3326
	dw Func_3317
	dw Func_3335
	dw Func_3344
	dw Func_31fa
	dw Func_31dc
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw .Func_50898
	dw .Func_509bb
	dw .Func_50898
	dw .Func_50898
	dw Func_3371
	dw .Func_50898
	dw Func_32cc
	dw Func_32db
	dw .Func_50898
	dw .Func_50898
	dw .Func_50a68
	dw .Func_50a4e
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

.Func_50995:
	ld hl, wCurObjState
	ld a, $44
	ld [hld], a
	jr .asm_509a3
.Func_5099d:
	ld hl, wCurObjState
	ld a, $45
	ld [hld], a
.asm_509a3
	ld l, OBJ_VAR_2
	ld a, $02
	ld [hli], a
	xor a
	ld [hli], a
	ret

.Func_509ab:
	ld a, $3f
	ld [wCurObjState], a
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld a, $78
	ld [wCurObjStateDuration], a
	ret

.Func_509bb:
	ld hl, wCurObjStateDuration
	dec [hl]
	jp z, .destroy
	ld a, [hl]
	cp $3c
	jp nc, Func_32ea
	ld l, OBJ_FLAGS
	ld a, [wGlobalCounter]
	and %111
	cp $04
	jr c, .asm_509d8
	res OBJFLAG_INVISIBLE_F, [hl]
	jp Func_32ea
.asm_509d8
	set OBJFLAG_INVISIBLE_F, [hl]
	jp Func_32ea

.Func_509dd:
	ld a, [wCurObjScreenYPos]
	cp $50
	jp c, VanishObject2
	ld hl, wCurObjState
	ld a, $59
	ld [hld], a
	ld b, $02
	jr .asm_50a13

.Func_509ef:
	ld a, [wCurObjScreenYPos]
	cp $50
	jp c, VanishObject2
	ld hl, wCurObjState
	ld a, $58
	ld [hld], a
	ld b, $02
	jr .asm_50a13

.Func_50a01:
	ld hl, wCurObjState
	ld a, $34
	ld [hld], a
	ld b, $02
	jr .asm_50a13

.Func_50a0b:
	ld hl, wCurObjState
	ld a, $35
	ld [hld], a
	ld b, $02
.asm_50a13
	dec l
	xor a
	ld [hld], a
	ld a, b
	ld [hld], a
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

.Func_50a1e:
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

.Func_50a31:
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

.Func_50a44:
	ld hl, wCurObjState
	ld a, $49
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_50a4e:
	ld a, [wDirection]
	and a
	jp nz, Func_3353
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	jr .Func_50a5e
.Func_50a5e:
	ld hl, wCurObjState
	ld a, $48
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_50a68:
	ld a, [wDirection]
	and a
	jp z, Func_3362
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	jp .Func_50a44
.Func_50a79:
	ld hl, wCurObjAction
	ld a, NO_ACTIONS_FOR 31
	ld [hld], a
	ld a, $42
	ld [hld], a ; OBJ_STATE
	dec l
	xor a
	ld [hld], a
	ret

AnonsteWaveLFunc_Left:
	call MoveObjectLeft_Fast
	jr AnonsteWaveFunc
AnonsterWaveFunc_Right:
	call MoveObjectRight_Fast
AnonsteWaveFunc:
	ld a, [wCurObjState]
	and a
	jp nz, AnonsterSilkFunc.destroy
	ret

UpdateAnonsterPal:
	ld a, [wCurObjSubState]
	and $0f
	cp $03
	jr nz, .asm_50aa4
	ld hl, .Pals_50ab4
	jr .got_pal
.asm_50aa4
	cp $02
	ret nz
	ld hl, .Pals_50abc
.got_pal
	ld de, wTempPals2 palette 7
	ld c, 7
	ld b, 1
	jp CopyAndApplyOBPals

.Pals_50ab4:
	rgb  0, 20, 12
	rgb  0, 31,  5
	rgb  0, 11,  0
	rgb  1,  0,  0

.Pals_50abc:
	rgb  0, 20, 12
	rgb 31,  0,  0
	rgb 14,  0,  0
	rgb  1,  0,  0
