JamanoFunc: ; 54d37 (15:4d37)
	ld a, TRUE
	ld [wIsBossBattle], a
	stop_music2
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_54d7d)
	ld [hld], a
	ld a, LOW(.Func_54d7d)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $03
	ld [hld], a
	ld a, $fc
	ld [hld], a
	ld a, $06
	ld [hl], a
	ld de, Frameset_69ce9
	call SetObjectFramesetPtr
	ld a, $ff
	ld [hli], a
	ld a, $08
	ld [wCurObjVar2], a
	call MoveObjectLeftByVar2
	ld a, $04
	ld [wCurObjVar2], a
	jp MoveObjectUpByVar2

.Func_54d7d:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $c0
	jr nz, .asm_54d96
	play_music2 MUSIC_BOSS_REVEAL
.asm_54d96
	dec [hl]
	ret nz
	ld de, Frameset_69cdb
	call SetObjectFramesetPtr
	ld a, $ff
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_54daa)
	ld [hld], a
	ld a, LOW(.Func_54daa)
	ld [hld], a
	ret

.Func_54daa:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $30
	jr nz, .asm_54dc3
	stop_music2
.asm_54dc3
	dec [hl]
	ret nz
	ld a, $02
	ld [wcac3], a
	call UpdateLevelMusic
	ld hl, wCurObjFlags
	set 7, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_54e10)
	ld [hld], a
	ld a, LOW(.Func_54e10)
	ld [hld], a
	xor a
	ld l, OBJ_STATE_DURATION
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [$d149], a
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_54dfe
	res 7, [hl]
	inc l
	ld a, $5a
	ld [hl], a
	ld de, Frameset_69c1c
	jp SetObjectFramesetPtr
.asm_54dfe
	set 7, [hl]
	inc l
	ld a, $5b
	ld [hl], a
	ld de, Frameset_69ca1
	jp SetObjectFramesetPtr

.Func_54e0a:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

.Func_54e10:
	ld hl, wCurObjFlags
	ld a, [wGlobalCounter]
	rra
	jr c, .asm_54e1c
	res 4, [hl]
	ret
.asm_54e1c
	set 4, [hl]
	ld a, [wDollBoyHammerStage]
	and a
	jr nz, .asm_54e46
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_54f9d)
	ld [hld], a
	ld a, LOW(.Func_54f9d)
	ld [hld], a
	ld l, OBJ_FLAGS
	res OBJFLAG_INVISIBLE_F, [hl]
	ld de, Frameset_69ce0
	call SetObjectFramesetPtr
	ld a, $a0
	ld [hli], a
	stop_music2
	ret
.asm_54e46
	ld l, OBJ_STATE
	ld a, [hld]
	cp $5a
	jr z, .asm_54e78
	cp $5b
	jr z, .asm_54eae
	bit 7, [hl]
	jr nz, .asm_54e5a
	ld de, Frameset_69c92
	jr .asm_54e5d
.asm_54e5a
	ld de, Frameset_69c7a
.asm_54e5d
	ld l, OBJ_FLAGS
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_54e0a)
	ld [hld], a
	ld a, LOW(.Func_54e0a)
	ld [hld], a
	stop_music2
	jp SetObjectFramesetPtr
.asm_54e78
	call .Func_54f55
	ld a, [wCurObjVar2]
	dec a
	jr nz, .asm_54e87
	ld l, OBJ_SUBSTATE
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr nz, .asm_54e9f
.asm_54e87
	ld l, OBJ_Y_POS
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	sub $08
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr z, .asm_54ea6
.asm_54e9f
	ld a, $5b
	ld [wCurObjState], a
	jr .asm_54efb
.asm_54ea6
	ld bc, $4c80
	call Func_34a0
	jr .asm_54efb
.asm_54eae
	call .Func_54f55
	ld a, [wCurObjVar2]
	dec a
	jr nz, .asm_54ebd
	ld l, OBJ_SUBSTATE
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr z, .asm_54ed5
.asm_54ebd
	ld l, OBJ_Y_POS
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	add $08
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr z, .asm_54edc
.asm_54ed5
	ld a, $5a
	ld [wCurObjState], a
	jr .asm_54efb
.asm_54edc
	ld bc, $4c20
	call Func_34a0
	jr .asm_54efb

.Func_54ee4:
	ld hl, wCurObjSubState
	ld a, [wWarioScreenYPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenYPos]
	add $2a
	cp b
	jr nc, .asm_54ef8
	set 6, [hl]
	ret
.asm_54ef8
	res 6, [hl]
	ret

.asm_54efb
	ld a, [wCurObjVar3]
	dec a
	jr nz, .asm_54f04
	call .Func_54ee4
.asm_54f04
	ld a, [wCurObjScreenYPos]
	ld hl, wCurObjSubState
	bit 6, [hl]
	jr nz, .asm_54f20
	cp $28
	jr nc, .asm_54f1a
	set 6, [hl]
	xor a
	ld [wCurObjVar3], a
	jr .asm_54f4f
.asm_54f1a
	ld bc, $4c80
	jp ApplyObjYMovement_Loop
.asm_54f20
	cp $98
	jr nc, .asm_54f47
	cp $7c
	jr c, .asm_54f4f
	cp $80
	jr nc, .asm_54f4f
	ld l, OBJ_Y_POS
	ld a, [hli]
	add $0a
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
	jr z, .asm_54f4f
	ld hl, wCurObjSubState
.asm_54f47
	res 6, [hl]
	xor a
	ld [wCurObjVar3], a
	jr .asm_54f1a
.asm_54f4f
	ld bc, $4c20
	jp ApplyObjYMovement_Loop

.Func_54f55:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_54f6d
	dec [hl]
	ret nz
	ld l, OBJ_SUBSTATE
	ld e, $13
	call Func_554bc
	xor a
	ld [wCurObjFrameDuration], a
	ld [wCurObjFramesetOffset], a
	ret
.asm_54f6d
	ld l, OBJ_SUBSTATE
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	ld a, [hl]
	jr c, .asm_54f87
	rlca
	ret nc
	res 7, [hl]
	ld de, Frameset_69c7a
	jr .asm_54f8e
.asm_54f87
	rlca
	ret c
	set 7, [hl]
	ld de, Frameset_69c92
.asm_54f8e
	call SetObjectFramesetPtr
	ld a, $14
	ld [hl], a
	play_sfx SFX_0BC
	ret

.Func_54f9d:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_54fac
	dec [hl]
	jr .asm_54fcd
.asm_54fac
	ld a, [wCurObjScreenXPos]
	cp $58
	jr nz, .asm_54fcd
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5507b)
	ld [hld], a
	ld a, LOW(.Func_5507b)
	ld [hld], a
	ld de, Frameset_69c40
	call SetObjectFramesetPtr
	ld a, $28
	ld [hli], a
	play_sfx SFX_0BD
	ret
.asm_54fcd
	ld a, [wCurObjState]
	cp $5a
	jr z, .asm_54fd9
	cp $5b
	jr z, .asm_55006
	ret
.asm_54fd9
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	sub $08
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr z, .asm_55001
	play_sfx SFX_BUMP
	ld a, $5b
	ld [wCurObjState], a
	jr .asm_55031
.asm_55001
	call MoveObjectLeft
	jr .asm_55031
.asm_55006
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	add $08
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr z, .asm_5502e
	play_sfx SFX_BUMP
	ld a, $5a
	ld [wCurObjState], a
	jr .asm_55031
.asm_5502e
	call MoveObjectRight
.asm_55031
	ld a, [wCurObjScreenYPos]
	ld hl, wCurObjSubState
	bit 6, [hl]
	jr nz, .asm_5504d
	cp $30
	jp nc, MoveObjectUp
	set 6, [hl]
	play_sfx SFX_BUMP
	jp MoveObjectDown
.asm_5504d
	cp $7c
	jp c, MoveObjectDown
	ld l, OBJ_Y_POS
	ld a, [hli]
	add $0a
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
	play_sfx SFX_BUMP
	jp MoveObjectUp

.Func_5507b:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_55097)
	ld [hld], a
	ld a, LOW(.Func_55097)
	ld [hld], a
	ld de, Frameset_69c45
	call SetObjectFramesetPtr
	ld a, $28
	ld [hli], a
	ret

.Func_55097:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_550b3)
	ld [hld], a
	ld a, LOW(.Func_550b3)
	ld [hld], a
	ld de, Frameset_69c4a
	call SetObjectFramesetPtr
	ld a, $28
	ld [hli], a
	ret

.Func_550b3:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_550db)
	ld [hld], a
	ld a, LOW(.Func_550db)
	ld [hld], a
	ld de, Frameset_69c4f
	call SetObjectFramesetPtr
	ld a, $28
	ld [hli], a
	inc l
	ld a, $0f
	ld [hl], a
	call MoveObjectUpByVar2
	ld bc, ObjParams_JamanoHat
	jp CreateObjectAtRelativePos

.Func_550db:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_550ff)
	ld [hld], a
	ld a, LOW(.Func_550ff)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and $f0
	ld [hld], a
	xor a
	ld [hld], a
	ld [hl], a
	play_sfx SFX_0A3
	ret

.Func_550ff:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld bc, $4d20
	jp ApplyObjYMovement

JamanoHatFunc: ; 5510a (15:510a)
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $3c
	ld [hl], a
	ld a, $03
	ld [wCurObjVar2], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_55125)
	ld [hld], a
	ld a, LOW(.Func_55125)
	ld [hld], a
	ret

.Func_55125:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jp nz, MoveObjectUpByVar2
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ld hl, wCurObjUnk02
	ld e, $06
	farcall Func_ba42
	ld a, $03
	ld [wcac3], a
	call UpdateLevelMusic
	xor a
	ld [wIsBossBattle], a
	ret

HatPlatformFunc: ; 5515b (15:515b)
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_55194)
	ld [hld], a
	ld a, LOW(.Func_55194)
	ld [hld], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld a, $00
	ld [hl], a
	ld de, Frameset_69cef
	call SetObjectFramesetPtr
	xor a
	ld [hli], a
	ld [wCurObjState], a
	inc a
	ld [hl], a
	ld a, $08
	ld [wCurObjVar2], a
	call MoveObjectLeftByVar2
	ld a, $5a
	ld [wCurObjVar2], a
	jp MoveObjectUpByVar2

.Func_55194:
	call SetOneWayPlatformAction
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld hl, wCurObjVar1
	ld a, [hld]
	and a
	jr z, .asm_551c9
	inc [hl]
	ld a, [hli]
	cp $30
	jr z, .asm_551c3
	ld a, [wCurObjState]
	and a
	jr nz, .asm_551c3
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	jp z, MoveObjectDown
	res OBJFLAG_STEPPED_F, [hl]
	ld b, $01
	call AddYOffset
	call HandleDownwardsFloorTransition
	jp MoveObjectDown
.asm_551c3
	xor a
	ld [hl], a
	ld [wCurObjState], a
	ret
.asm_551c9
	dec [hl]
	jr z, .asm_551e0
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	jp z, MoveObjectUp
	res OBJFLAG_STEPPED_F, [hl]
	ld b, $01
	call SubYOffset
	call HandleUpwardsFloorTransition
	jp MoveObjectUp
.asm_551e0
	inc l
	ld a, $01
	ld [hl], a
	ret

SkullSpawnerFunc: ; 551e5 (15:51e5)
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_5522c)
	ld [hld], a
	ld a, LOW(.Func_5522c)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, $08
	ld [wCurObjVar2], a
	call MoveObjectLeftByVar2
	ld a, $14
	ld [wCurObjVar2], a
	call MoveObjectUpByVar2
	ld bc, ObjParams_Skull1
	call CreateObjectAtRelativePos
	ld bc, ObjParams_Skull2
	call CreateObjectAtRelativePos
	ld bc, ObjParams_Skull3
	call CreateObjectAtRelativePos
	ld bc, ObjParams_Skull4
	call CreateObjectAtRelativePos
	ld a, $0f
	ld [wDollBoyActiveBarrels], a
	xor a
	ld [w1d147], a
	ld [wDollBoyHammerStage], a
	ld a, $01
	ld [$d149], a
	ret

.Func_5522c:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld a, [$d149]
	and a
	jr nz, .asm_5525b
	ld a, [wDollBoyHammerStage]
	and a
	jr nz, .asm_5525b
	xor a
	ld [wCurObjFlags], a
	ld hl, wCurObjUnk02
	ld e, $07
	farcall Func_ba42
	ret
.asm_5525b
	call Func_55407
	ld hl, wDollBoyActiveBarrels
	ld a, [hl]
	rra
	jr nc, .asm_55275
	rra
	jr nc, .asm_5527d
	rra
	jr nc, .asm_55285
	rra
	ret c
	set 3, [hl]
	ld bc, ObjParams_Skull4
	jp CreateObjectAtRelativePos
.asm_55275
	set 0, [hl]
	ld bc, ObjParams_Skull1
	jp CreateObjectAtRelativePos
.asm_5527d
	set 1, [hl]
	ld bc, ObjParams_Skull2
	jp CreateObjectAtRelativePos
.asm_55285
	set 2, [hl]
	ld bc, ObjParams_Skull3
	jp CreateObjectAtRelativePos

SkullFunc: ; 5528d (15:528d)
	call .Func_553e8
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_5529f)
	ld [hld], a
	ld a, LOW(.Func_5529f)
	ld [hld], a
	ret

.Func_5529f:
	call .Func_553e8
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_552ba)
	ld [hld], a
	ld a, LOW(.Func_552ba)
	ld [hld], a
	ret

.Func_552ba:
	call .Func_553e8
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjVar1
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_552d4)
	ld [hld], a
	ld a, LOW(.Func_552d4)
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_PRIORITY_F, [hl]
	ret

.Func_552d4:
	call .Func_553e8
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjUnk07]
	ld b, a
	cp $52
	ld a, [wCurObjScreenXPos]
	jr nc, .asm_552f8
	cp $10
	jr z, .asm_55309
	call MoveObjectLeft
	ld a, b
	rra
	jr c, .asm_55303
.asm_552f2
	ld bc, $4ce0
	jp ApplyObjYMovement
.asm_552f8
	cp $a0
	jr z, .asm_55309
	call MoveObjectRight
	ld a, b
	rra
	jr nc, .asm_552f2
.asm_55303
	ld bc, $4d00
	jp ApplyObjYMovement
.asm_55309
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_5531c)
	ld [hld], a
	ld a, LOW(.Func_5531c)
	ld [hld], a
	ld a, $27
	ld [wCurObjStateDuration], a
	ld hl, w1d147
	inc [hl]
	ret

.Func_5531c:
	call .Func_553e8
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_5532d
	dec [hl]
	ret
.asm_5532d
	ld a, [wCurObjFramesetOffset]
	cp $02
	ret nz
	ld l, OBJ_FLAGS
	res 7, [hl]
	res 4, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_55347)
	ld [hld], a
	ld a, LOW(.Func_55347)
	ld [hld], a
	ld de, Frameset_69cd6
	jp SetObjectFramesetPtr

.Func_55347:
	ld a, [$d149]
	and a
	jr z, .asm_55355
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	jp .Func_553e8
.asm_55355
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld a, [wCurObjState]
	cp $04
	jr z, .asm_5536c
	cp $05
	jr z, .asm_55366
	ret
.asm_55366
	ld a, HIGH(.Func_55396)
	ld c, LOW(.Func_55396)
	jr .asm_55370
.asm_5536c
	ld a, HIGH(.Func_553a0)
	ld c, LOW(.Func_553a0)
.asm_55370
	ld hl, wCurObjUpdateFunction + 1
	ld [hld], a
	ld [hl], c
	ld l, OBJ_VAR_3
	xor a
	ld [hld], a
	inc a
	ld [hl], a
	ld de, Frameset_69cec
	call SetObjectFramesetPtr
	ld a, $ff
	ld [hli], a
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	play_sfx SFX_017
	ld hl, w1d147
	dec [hl]
	ret

.Func_55396:
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jp nz, Func_3317
	jr .asm_553a8

.Func_553a0:
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jp nz, Func_3326

.asm_553a8
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $f7
	jr nz, .asm_553bd
	play_sfx SFX_0BF
.asm_553bd
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ld a, [wCurObjUnk07]
	cp $50
	jr z, .asm_553d6
	cp $51
	jr z, .asm_553da
	cp $52
	jr z, .asm_553de
	ld b, $f7
	jr .asm_553e0
.asm_553d6
	ld b, $fe
	jr .asm_553e0
.asm_553da
	ld b, $fd
	jr .asm_553e0
.asm_553de
	ld b, $fb
.asm_553e0
	ld a, [wDollBoyActiveBarrels]
	and b
	ld [wDollBoyActiveBarrels], a
	ret

.Func_553e8:
	ld a, [$d149]
	and a
	jr nz, .asm_553f4
	ld a, [wDollBoyHammerStage]
	and a
	jr z, .asm_55403
.asm_553f4
	ld hl, wCurObjFlags
	ld a, [wGlobalCounter]
	rra
	jr nc, .asm_55400
	res 4, [hl]
	ret
.asm_55400
	set 4, [hl]
	ret
.asm_55403
	ld [wCurObjFlags], a
	ret

Func_55407:
	ld a, [w1d147]
	ld b, a
	ld hl, wDollBoyHammerStage
	ld a, [hl]
	and a
	jr z, .asm_5542b
	cp $01
	jr z, .asm_55438
	cp $02
	jr z, .asm_5544e
	cp $03
	jr z, .asm_55468
	ld a, b
	cp $03
	ret nz
	dec [hl]
	call .Func_5548b
	ld hl, Pals_555d1
	jr .asm_55484
.asm_5542b
	ld a, b
	cp $01
	ret nz
	inc [hl]
	call .Func_5548b
	ld hl, Pals_55551
	jr .asm_55484
.asm_55438
	ld a, b
	cp $02
	jr nz, .asm_55446
	inc [hl]
	call .Func_5548b
	ld hl, Pals_55591
	jr .asm_55484
.asm_55446
	and a
	ret nz
	dec [hl]
	ld hl, Pals_55511
	jr .asm_55484
.asm_5544e
	ld a, b
	cp $03
	jr nz, .asm_5545c
	inc [hl]
	call .Func_5548b
	ld hl, Pals_555d1
	jr .asm_55484
.asm_5545c
	cp $01
	ret nz
	dec [hl]
	call .Func_5548b
	ld hl, Pals_55551
	jr .asm_55484
.asm_55468
	ld a, b
	cp $04
	jr nz, .asm_55478
	inc [hl]
	call .Func_5548b
	ld c, 0
	ld b, 8
	jp Func_3632
.asm_55478
	cp $02
	ret nz
	dec [hl]
	call .Func_5548b
	ld hl, Pals_55591
	jr .asm_55484 ; unnecessary jr
.asm_55484
	ld c, 0
	ld b, 8
	jp Func_35e5

.Func_5548b:
	ld a, [$d149]
	and a
	ret nz
	xor a
	ld b, a
	ld h, HIGH(wObj1)
.asm_55494
	ld l, OBJ_UNK_07
	add l
	ld l, a
	ld a, [hl] ; OBJ_UNK_07
	cp $56
	jr nz, .asm_554a5
	ld a, l
	sub $07
	ld l, a
	ld a, [hl]
	rra
	jr c, .asm_554ae
.asm_554a5
	ld a, b
	cp LOW(wObj8)
	ret z
	add OBJ_STRUCT_LENGTH
	ld b, a
	jr .asm_55494
.asm_554ae
	ld a, l
	add $16
	ld l, a
	ld a, [hld]
	and a
	ret nz
	dec l
	dec l
	ld e, l
	ld a, l
	add $07
	ld l, a
;	fallthrough

Func_554bc: ; 554bc (15:54bc)
	ld a, [wDollBoyHammerStage]
	cp $01
	jr z, .asm_554de
	cp $02
	jr z, .asm_554ee
	cp $03
	jr z, .asm_554fe
	cp $04
	ret nz
	bit 7, [hl]
	jr nz, .asm_554d8
	ld b, $5c
	ld c, $1c
	jr .asm_5550c
.asm_554d8
	ld b, $5c
	ld c, $a1
	jr .asm_5550c
.asm_554de
	bit 7, [hl]
	jr nz, .asm_554e8
	ld b, $5c
	ld c, $37
	jr .asm_5550c
.asm_554e8
	ld b, $5c
	ld c, $bc
	jr .asm_5550c
.asm_554ee
	bit 7, [hl]
	jr nz, .asm_554f8
	ld b, $5c
	ld c, $2e
	jr .asm_5550c
.asm_554f8
	ld b, $5c
	ld c, $b3
	jr .asm_5550c
.asm_554fe
	bit 7, [hl]
	jr nz, .asm_55508
	ld b, $5c
	ld c, $25
	jr .asm_5550c
.asm_55508
	ld b, $5c
	ld c, $aa
.asm_5550c
	ld l, e
	ld a, b
	ld [hld], a
	ld [hl], c
	ret
; 0x55511

Pals_55511: ; 55511 (15:5511)
	rgb 10,  6,  0
	rgb 31, 31,  8
	rgb 25, 16,  0
	rgb  0,  0,  0

	rgb  4, 22, 21
	rgb  0, 11,  9
	rgb  0,  8,  6
	rgb  0,  6,  4

	rgb 11,  7,  0
	rgb 13, 18, 25
	rgb  6,  6, 13
	rgb  0,  0,  0

	rgb 19, 18,  7
	rgb 14, 12,  1
	rgb  9,  7,  0
	rgb  8,  4, 13

	rgb  0,  6,  4
	rgb 16, 10,  0
	rgb 11,  7,  0
	rgb  9,  5,  0

	rgb 31, 23, 29
	rgb 25,  4, 23
	rgb 13,  0, 10
	rgb  0,  0,  0

	rgb 21, 17, 11
	rgb 14,  7,  3
	rgb  7,  4,  3
	rgb  0,  0,  0

	rgb 24, 26, 17
	rgb  8, 13,  4
	rgb  5,  7,  1
	rgb  0,  0,  0
; 0x55551

Pals_55551: ; 55551 (15:5551)
	rgb  8,  4,  0
	rgb 31, 31,  8
	rgb 25, 16,  0
	rgb  0,  0,  0

	rgb  4, 18, 17
	rgb  0,  9,  7
	rgb  0,  6,  4
	rgb  0,  5,  2

	rgb  9,  5,  0
	rgb 10, 15, 22
	rgb  4,  4, 11
	rgb  0,  0,  0

	rgb 16, 15,  5
	rgb 12, 10,  1
	rgb  7,  5,  0
	rgb  6,  1, 11

	rgb  0,  5,  3
	rgb 14,  8,  0
	rgb  9,  5,  0
	rgb  7,  3,  0

	rgb 27, 19, 25
	rgb 21,  2, 19
	rgb 10,  0,  7
	rgb  0,  0,  0

	rgb 18, 14,  8
	rgb 11,  5,  1
	rgb  5,  2,  0
	rgb  0,  0,  0

	rgb 24, 26, 17
	rgb  8, 13,  4
	rgb  5,  7,  1
	rgb  0,  0,  0
; 0x55591

Pals_55591: ; 55591 (15:5591)
	rgb  7,  2,  0
	rgb 31, 31,  8
	rgb 25, 16,  0
	rgb  0,  0,  0

	rgb  1, 14, 13
	rgb  0,  7,  5
	rgb  0,  4,  2
	rgb  0,  3,  0

	rgb  7,  3,  0
	rgb  7, 12, 19
	rgb  2,  2,  8
	rgb  0,  0,  0

	rgb 13, 12,  2
	rgb  9,  7,  0
	rgb  5,  3,  0
	rgb  3,  0,  8

	rgb  0,  4,  2
	rgb 11,  5,  0
	rgb  8,  3,  0
	rgb  5,  1,  0

	rgb 24, 11, 22
	rgb 17,  0, 15
	rgb  7,  0,  5
	rgb  0,  0,  0

	rgb 15, 11,  5
	rgb  9,  3,  0
	rgb  4,  0,  0
	rgb  0,  0,  0

	rgb 24, 26, 17
	rgb  8, 13,  4
	rgb  5,  7,  1
	rgb  0,  0,  0
; 0x555d1

Pals_555d1: ; 555d1 (15:55d1)
	rgb  3,  0,  0
	rgb 31, 31,  8
	rgb 25, 16,  0
	rgb  0,  0,  0

	rgb  0, 10,  8
	rgb  0,  5,  3
	rgb  0,  2,  0
	rgb  0,  3,  0

	rgb  4,  1,  0
	rgb  3,  7, 13
	rgb  0,  0,  5
	rgb  0,  0,  0

	rgb  9,  8,  0
	rgb  5,  4,  0
	rgb  2,  1,  0
	rgb  1,  0,  4

	rgb  0,  2,  0
	rgb  7,  3,  0
	rgb  5,  0,  0
	rgb  5,  1,  0

	rgb 19,  5, 17
	rgb 12,  0, 11
	rgb  4,  0,  2
	rgb  0,  0,  0

	rgb 11,  7,  1
	rgb  6,  1,  0
	rgb  1,  0,  0
	rgb  0,  0,  0

	rgb 24, 26, 17
	rgb  8, 13,  4
	rgb  5,  7,  1
	rgb  0,  0,  0
; 0x55611
