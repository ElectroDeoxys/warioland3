MadSciensteinFunc:
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
	jp .Func_44fd9

.Update:
	ld a, [wCurObjState]
	jumptable

	dw .Func_44fd9
	dw .Func_45034
	dw .Func_45140
	dw .Func_45186
	dw .Func_45342
	dw .Func_45366
	dw .Func_453a6
	dw .Func_453b9
	dw .Func_452f7
	dw .Func_45301
	dw .Func_44e18
	dw .Func_44fd9
	dw .Func_44fd9
	dw .Func_44fd9
	dw .Func_44fd9
	dw .Func_4526b
	dw .Func_45294
	dw .Func_45018
	dw .Func_45425
	dw .Func_452af
	dw .Func_4523b
	dw .Func_45243
	dw .Func_451e5
	dw .Func_45210
	dw .Func_453f8
	dw .Func_453cc
	dw Func_3263
	dw Func_3272
	dw Func_3281
	dw .Func_44fd9
	dw .Func_44fd9
	dw .Func_44fd9
	dw Func_3191
	dw Func_31af
	dw Func_31cd
	dw Func_31eb
	dw Func_3209
	dw Func_3227
	dw Func_3245
	dw Func_3254
	dw .Func_45338
	dw .Func_4532e
	dw .Func_44fd9
	dw .Func_44eaa
	dw .Func_44f89
	dw .Func_44fd9
	dw .Func_44fd9
	dw .Func_44fd9
	dw ObjState_Fall
	dw .Func_45054
	dw .Func_4515d
	dw .Func_451bc
	dw Func_3326
	dw Func_3317
	dw Func_3335
	dw Func_3344
	dw Func_31fa
	dw Func_31dc
	dw .Func_44fd9
	dw .Func_44fd9
	dw .Func_44fd9
	dw .Func_44fd9
	dw .Func_44fd9
	dw .Func_4527a
	dw .Func_452a2
	dw ObjState_StandingFall
	dw Func_3371
	dw .Func_452cb
	dw Func_32cc
	dw Func_32db
	dw .Func_45202
	dw .Func_4522d
	dw .Func_45414
	dw .Func_453e8
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
	dw .Func_44e50
	dw .Func_44eda
	dw .Func_44fbf

.Func_44e18:
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
	jp nc, .Func_452f7
	jp .Func_45301

.Func_44e50:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_44e5d
	ld a, $1c
	ld [wCurObjState], a
	ret

.asm_44e5d
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $18
	jr z, .asm_44e86
	dec [hl]
	jp nz, Func_3308
	ld l, OBJ_STATE
	ld a, $2b
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_44e7c
	ld de, Frameset_68c25
	call SetObjectFramesetPtr
	ld a, 28
	ld [hli], a
	ret

.asm_44e7c
	ld de, Frameset_68c2c
	call SetObjectFramesetPtr
	ld a, 28
	ld [hli], a
	ret

.asm_44e86
	dec [hl]
	ld l, OBJ_FLAGS
	bit OBJFLAG_ON_SCREEN_F, [hl]
	play_sfx nz, SFX_067

	ld l, OBJ_STATE
	ld a, $5a
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_44ea4
	ld bc, ObjParams_InvisibilityPotionLeft
	jp CreateObjectAtRelativePos
.asm_44ea4
	ld bc, ObjParams_InvisibilityPotionRight
	jp CreateObjectAtRelativePos

.Func_44eaa:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $08
	jr z, .asm_44ecd
	dec [hl]
	jp nz, Func_3308
	ld l, OBJ_STATE
	ld a, $5b
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_44ec6
	ld de, Frameset_68bd1
	call SetObjectFramesetPtr
	ret

.asm_44ec6
	ld de, Frameset_68bda
	call SetObjectFramesetPtr
	ret

.asm_44ecd
	dec [hl]
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	jr c, .asm_44ed7
	set OBJSUBFLAG_HDIR_F, [hl]
	ret

.asm_44ed7
	res OBJSUBFLAG_HDIR_F, [hl]
	ret

.Func_44eda:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_44ee7
	ld a, $1c
	ld [wCurObjState], a
	ret

.asm_44ee7
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
	jr nz, .asm_44f02
	ld a, $11
	ld [wCurObjState], a
	ret

.asm_44f02
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_44f4c
	ld a, [hl]
	and $0f
	sub $07
	jr nc, .asm_44f1f
	call ProcessCellOnLeft
	and $0f
	jr z, .asm_44f3d
.asm_44f1f
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	sub $07
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectLeft
.asm_44f3d
	ld a, $2c
	ld [wCurObjState], a
	ld de, Frameset_68c25
	call SetObjectFramesetPtr
	ld a, 28
	ld [hli], a
	ret

.asm_44f4c
	ld a, [hl]
	and $0f
	add $06
	cp $10
	jr c, .asm_44f5c
	call ProcessCellOnRight
	and $0f
	jr z, .asm_44f7a
.asm_44f5c
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	add $06
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectRight
.asm_44f7a
	ld a, $2c
	ld [wCurObjState], a
	ld de, Frameset_68c2c
	call SetObjectFramesetPtr
	ld a, 28
	ld [hli], a
	ret

.Func_44f89:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $08
	jr z, .asm_44fb2
	dec [hl]
	jp nz, Func_3308
	ld l, OBJ_STATE
	ld a, $5c
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_44fa8
	ld de, Frameset_68bff
	call SetObjectFramesetPtr
	ld a, 63
	ld [hli], a
	ret

.asm_44fa8
	ld de, Frameset_68c08
	call SetObjectFramesetPtr
	ld a, 63
	ld [hli], a
	ret

.asm_44fb2
	dec [hl]
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	jr c, .asm_44fbc
	set OBJSUBFLAG_HDIR_F, [hl]
	ret

.asm_44fbc
	res OBJSUBFLAG_HDIR_F, [hl]
	ret

.Func_44fbf:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_44fcc
	ld a, $1c
	ld [wCurObjState], a
	ret

.asm_44fcc
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_3308
	ld a, $01
	ld [wCurObjState], a
	ret

.Func_44fd9:
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $06
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld a, $ff
	ld [hl], a
	ld l, OBJ_STATE
	ld a, $30
	ld [hld], a
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_4500c
	res OBJSUBFLAG_HDIR_F, [hl]
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_68bb5
	call SetObjectFramesetPtr
	ret

.asm_4500c
	set OBJSUBFLAG_HDIR_F, [hl]
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_68bbe
	call SetObjectFramesetPtr
	ret

.Func_45018:
	ld hl, wCurObjState
	ld a, $41
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_4502b
	xor a
	ld [hld], a
	ld de, Frameset_68bb5
	call SetObjectFramesetPtr
	ret

.asm_4502b
	xor a
	ld [hld], a
	ld de, Frameset_68bbe
	call SetObjectFramesetPtr
	ret

.Func_45034:
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
	jr c, .asm_4504d
	ld de, Frameset_68bb5
	call SetObjectFramesetPtr
	ret

.asm_4504d
	ld de, Frameset_68bbe
	call SetObjectFramesetPtr
	ret

.Func_45054:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_45061
	ld a, $1a
	ld [wCurObjState], a
	ret

.asm_45061
	ld c, $2a
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp $20
	jr c, .asm_45075
	cp $e0
	jr c, .asm_450b0
.asm_45075
	ld hl, wCurObjSubState
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
	cp $c0
	jr nc, .asm_4509f
	cp $40
	jr nc, .asm_450b0
	ld a, [hli]
	rlca
	jr c, .asm_4509b
	ld a, $5a
	ld [hl], a
	ld de, Frameset_68bed
	call SetObjectFramesetPtr
	ld a, 63
	ld [hli], a
	ret

.asm_4509b
	ld a, $13
	ld [hl], a
	ret

.asm_4509f
	ld a, [hli]
	rlca
	jr nc, .asm_4509b
	ld a, $5a
	ld [hl], a
	ld de, Frameset_68bf6
	call SetObjectFramesetPtr
	ld a, 63
	ld [hli], a
	ret

.asm_450b0
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
	jr nz, .asm_450cb
	ld a, $11
	ld [wCurObjState], a
	ret

.asm_450cb
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_4510c
	ld a, [hl]
	and $0f
	sub $07
	jr nc, .asm_450e8
	call ProcessCellOnLeft
	and $0f
	jr z, .asm_45106
.asm_450e8
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	sub $07
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectLeft_Slow
.asm_45106
	ld a, $13
	ld [wCurObjState], a
	ret

.asm_4510c
	ld a, [hl]
	and $0f
	add $06
	cp $10
	jr c, .asm_4511c
	call ProcessCellOnRight
	and $0f
	jr z, .asm_4513a
.asm_4511c
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	add $06
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectRight_Slow
.asm_4513a
	ld a, $13
	ld [wCurObjState], a
	ret

.Func_45140:
	ld a, [wCurObjFrame]
	cp $19
	jr nc, .asm_45155
	cp $14
	jr nc, .asm_4514f
	cp $06
	jr nc, .asm_45155
.asm_4514f
	ld bc, ObjParams_InvisibilityPotionDropLeft
	call CreateObjectAtRelativePos
.asm_45155
	ld hl, wCurObjState
	ld a, $32
	ld [hld], a
	jr .asm_451a1

.Func_4515d:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, ObjState_BumpLeft
	dec l
	dec l
	dec [hl]
	ret nz
	ld l, OBJ_SUBSTATE
	ld a, [hli]
	rlca
	jr c, .asm_4517c
	ld a, $2b
	ld [hl], a
	ld de, Frameset_68c25
	call SetObjectFramesetPtr
	ld a, 28
	ld [hli], a
	ret

.asm_4517c
	ld a, $5b
	ld [hl], a
	ld de, Frameset_68bda
	call SetObjectFramesetPtr
	ret

.Func_45186:
	ld a, [wCurObjFrame]
	cp $19
	jr nc, .asm_4519b
	cp $14
	jr nc, .asm_45195
	cp $06
	jr nc, .asm_4519b
.asm_45195
	ld bc, ObjParams_InvisibilityPotionDropRight
	call CreateObjectAtRelativePos
.asm_4519b
	ld hl, wCurObjState
	ld a, $33
	ld [hld], a
.asm_451a1
	ld a, [hld]
	rlca
	jr c, .asm_451ad
	ld de, Frameset_68bc7
	call SetObjectFramesetPtr
	jr .asm_451b3
.asm_451ad
	ld de, Frameset_68bcc
	call SetObjectFramesetPtr
.asm_451b3
	ld a, $0c
	ld [hld], a
	ld a, $02
	ld [wCurObjVar2], a
	ret

.Func_451bc:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, ObjState_BumpRight
	dec l
	dec l
	dec [hl]
	ret nz
	ld l, OBJ_SUBSTATE
	ld a, [hli]
	rlca
	jr c, .asm_451d8
	ld a, $5b
	ld [hl], a
	ld de, Frameset_68bd1
	call SetObjectFramesetPtr
	ret

.asm_451d8
	ld a, $2b
	ld [hl], a
	ld de, Frameset_68c2c
	call SetObjectFramesetPtr
	ld a, 28
	ld [hli], a
	ret

.Func_451e5:
	ld hl, wCurObjState
	ld a, $46
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_451f4
	ld de, Frameset_68be3
	jr .asm_451f7
.asm_451f4
	ld de, Frameset_68be8
.asm_451f7
	call SetObjectFramesetPtr
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
.Func_45202:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, $0f
	ld [wCurObjState], a
	ret

.Func_45210:
	ld hl, wCurObjState
	ld a, $47
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_4521f
	ld de, Frameset_68be3
	jr .asm_45222
.asm_4521f
	ld de, Frameset_68be8
.asm_45222
	call SetObjectFramesetPtr
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
.Func_4522d:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, $0f
	ld [wCurObjState], a
	ret

.Func_4523b:
	ld hl, wCurObjState
	ld a, $44
	ld [hld], a
	jr .asm_45249

.Func_45243:
	ld hl, wCurObjState
	ld a, $45
	ld [hld], a
.asm_45249
	ld a, [hld]
	rlca
	jr c, .asm_45255
	ld de, Frameset_68be3
	call SetObjectFramesetPtr
	jr .asm_4525b
.asm_45255
	ld de, Frameset_68be8
	call SetObjectFramesetPtr
.asm_4525b
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

.Func_4526b:
	ld a, $3f
	ld [wCurObjState], a
	ld a, $64
	ld [wCurObjStateDuration], a
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
.Func_4527a:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_45287
	ld a, $1c
	ld [wCurObjState], a
	ret

.asm_45287
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_32ea
	ld a, $10
	ld [wCurObjState], a
	ret

.Func_45294:
	ld hl, wCurObjState
	ld a, $40
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ld a, $07
	ld [wCurObjStateDuration], a
.Func_452a2:
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_32f9
	ld a, $00
	ld [wCurObjState], a
	ret

.Func_452af:
	ld hl, wCurObjState
	ld a, $43
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_452c1
	ld de, Frameset_68c17
	call SetObjectFramesetPtr
	jr .asm_452c7
.asm_452c1
	ld de, Frameset_68c1e
	call SetObjectFramesetPtr
.asm_452c7
	ld a, $1c
	ld [hli], a
	ret

.Func_452cb:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_452d8
	ld a, $1a
	ld [wCurObjState], a
	ret

.asm_452d8
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $08
	jr z, .asm_452ea
	dec [hl]
	jp nz, Func_3308
	ld a, $01
	ld [wCurObjState], a
	ret

.asm_452ea
	dec [hl]
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	jr c, .asm_452f4
	set OBJSUBFLAG_HDIR_F, [hl]
	ret

.asm_452f4
	res OBJSUBFLAG_HDIR_F, [hl]
	ret

.Func_452f7:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $38
	jr .asm_45309
.Func_45301:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $39
.asm_45309
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_45316
	ld de, Frameset_68be3
	call SetObjectFramesetPtr
	jr .asm_4531c
.asm_45316
	ld de, Frameset_68be8
	call SetObjectFramesetPtr
.asm_4531c
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

.Func_4532e:
	ld hl, wCurObjState
	ld a, $59
	ld [hld], a
	ld b, $02
	jr .asm_45388

.Func_45338:
	ld hl, wCurObjState
	ld a, $58
	ld [hld], a
	ld b, $02
	jr .asm_45388

.Func_45342:
	ld a, [wTransformation]
	and a
	jr nz, .asm_4535c
	ld a, [wEffectivePowerUp]
	cp GARLIC
	jr nc, .asm_4535c
	ld a, [wCurObjInteractionType]
	and INTERACTION_MASK
	jr z, .asm_4535c
	ld a, $08
	ld [wCurObjState], a
	ret

.asm_4535c
	ld hl, wCurObjState
	ld a, $34
	ld [hld], a
	ld b, $01
	jr .asm_45388

.Func_45366:
	ld a, [wTransformation]
	and a
	jr nz, .asm_45380
	ld a, [wEffectivePowerUp]
	cp GARLIC
	jr nc, .asm_45380
	ld a, [wCurObjInteractionType]
	and INTERACTION_MASK
	jr z, .asm_45380
	ld a, $09
	ld [wCurObjState], a
	ret

.asm_45380
	ld hl, wCurObjState
	ld a, $35
	ld [hld], a
	ld b, $01
.asm_45388
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
	jr c, .asm_453a0
	ld de, Frameset_68c11
	jp SetObjectFramesetPtr
.asm_453a0
	ld de, Frameset_68c14
	jp SetObjectFramesetPtr

.Func_453a6:
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

.Func_453b9:
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

.Func_453cc:
	ld hl, wCurObjState
	ld a, $49
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_453de
	ld de, Frameset_68be3
	call SetObjectFramesetPtr
	jr .asm_453e4
.asm_453de
	ld de, Frameset_68be8
	call SetObjectFramesetPtr
.asm_453e4
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_453e8:
	ld a, [wDirection]
	and a
	jp nz, Func_3353
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	jr .Func_453f8

.Func_453f8:
	ld hl, wCurObjState
	ld a, $48
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_4540a
	ld de, Frameset_68be3
	call SetObjectFramesetPtr
	jr .asm_45410
.asm_4540a
	ld de, Frameset_68be8
	call SetObjectFramesetPtr
.asm_45410
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_45414:
	ld a, [wDirection]
	and a
	jp z, Func_3362
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	jp .Func_453cc

.Func_45425:
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

InvisibilityPotionFunc_Left:
	call MoveObjectLeft_Fast
	jr InvisibilityPotionFunc
InvisibilityPotionFunc_Right:
	call MoveObjectRight_Fast
InvisibilityPotionFunc:
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld a, [wCurObjState]
	cp $18
	jr z, DestroyInvisibilityPotion
	ld bc, Data_60510
	jp ApplyObjYMovement

Func_45453:
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
DestroyInvisibilityPotion:
	farcall VanishObject_NoSFX
	ret

InvisibilityPotionFunc_Drop:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	dec l
	ld a, $8f
	ld [hl], a
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]

.Update:
	ld a, [wCurObjState]
	cp $18
	jr z, DestroyInvisibilityPotion
	ld bc, Data_60540
	call ApplyObjYMovement
	jr Func_45453
