SpearBotFunc:
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
	jp .Func_45fbf

.Update:
	ld a, [wCurObjState]
	jumptable

	dw .Func_45fbf
	dw .Func_461db
	dw .Func_462e3
	dw .Func_462eb
	dw .Func_464e7
	dw .Func_464f1
	dw .Func_46517
	dw .Func_4652a
	dw .Func_46451
	dw .Func_4645b
	dw VanishObject2
	dw .Func_4648d
	dw .Func_46494
	dw .Func_45fbf
	dw .Func_45fbf
	dw .Func_463b4
	dw .Func_463dd
	dw .Func_45ffb
	dw .Func_465a0
	dw .Func_463f8
	dw .Func_4637f
	dw .Func_46387
	dw .Func_46319
	dw .Func_4634c
	dw .Func_4656e
	dw .Func_4653d
	dw Func_3263
	dw Func_3272
	dw Func_3281
	dw .Func_45fbf
	dw .Func_45fbf
	dw .Func_45fbf
	dw Func_3191
	dw Func_31af
	dw Func_31cd
	dw Func_31eb
	dw Func_3209
	dw Func_3227
	dw Func_3245
	dw Func_3254
	dw .Func_464dd
	dw .Func_464d3
	dw .Func_45fbf
	dw .Func_45fbf
	dw .Func_45fbf
	dw .Func_4605f
	dw .Func_460a6
	dw .Func_45fbf
	dw ObjState_Fall
	dw .Func_461fb
	dw ObjState_BumpLeft
	dw ObjState_BumpRight
	dw Func_3326
	dw Func_3317
	dw Func_3335
	dw Func_3344
	dw Func_31fa
	dw Func_31dc
	dw .Func_45fbf
	dw .Func_464a5
	dw .Func_464b7
	dw .Func_45fbf
	dw .Func_45fbf
	dw .Func_463c3
	dw .Func_463eb
	dw .Func_46043
	dw Func_3371
	dw .Func_46421
	dw Func_32cc
	dw Func_32db
	dw .Func_4633e
	dw .Func_46371
	dw .Func_4658f
	dw .Func_4655e
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
	dw .Func_4618c
	dw .Func_46170
	dw .Func_45fbf

.Func_45fbf:
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
	jr c, .asm_45fef
	res OBJSUBFLAG_HDIR_F, [hl]
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_68ddf
	call SetObjectFramesetPtr
	ret

.asm_45fef
	set OBJSUBFLAG_HDIR_F, [hl]
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_68de8
	call SetObjectFramesetPtr
	ret
.Func_45ffb:
	ld hl, wCurObjState
	ld a, $41
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_46024
	xor a
	ld [hld], a
	ld l, OBJ_COLLBOX_LEFT
	ld a, [hl]
	cp $f6
	jr nz, .asm_4601b
	ld a, $fa
	ld [hl], a
	ld de, Frameset_68e69
	call SetObjectFramesetPtr
	ld a, 14
	ld [hli], a
	ret

.asm_4601b
	ld de, Frameset_68ddf
	call SetObjectFramesetPtr
	xor a
	ld [hl], a
	ret

.asm_46024
	xor a
	ld [hld], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, [hl]
	cp $09
	jr nz, .asm_4603a
	ld a, $05
	ld [hl], a
	ld de, Frameset_68e70
	call SetObjectFramesetPtr
	ld a, 14
	ld [hli], a
	ret

.asm_4603a
	ld de, Frameset_68de8
	call SetObjectFramesetPtr
	xor a
	ld [hl], a
	ret
.Func_46043:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jp z, ObjState_StandingFall
	dec [hl]
	ret nz
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_46059
	ld de, Frameset_68ddf
	jp SetObjectFramesetPtr
.asm_46059
	ld de, Frameset_68de8
	jp SetObjectFramesetPtr
.Func_4605f:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_46070
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_46070
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_STATE
	ld a, $2e
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_4608b
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $f6
	ld [hld], a
	ld de, Frameset_68e57
	jr .asm_46096
.asm_4608b
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $09
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld de, Frameset_68e60
.asm_46096
	call SetObjectFramesetPtr
	inc l
	ld a, $02
	ld [hl], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_FRONT_STING
	ld [hld], a
	ret
.Func_460a6:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_460b7
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_460b7
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
	jr nz, .asm_460d2
	ld a, $11
	ld [wCurObjState], a
	ret

.asm_460d2
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_4611d
	ld a, [hl]
	and $0f
	sub $06
	jr nc, .asm_460ef
	call ProcessBlockOnLeft
	and $0f
	jr z, .asm_4610d
.asm_460ef
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
	jp z, MoveObjectLeft
.asm_4610d
	ld a, [wCurObjVar1]
	and a
	jr z, .asm_46118
	ld de, Frameset_68e41
	jr .asm_46154
.asm_46118
	ld de, Frameset_68dff
	jr .asm_46164
.asm_4611d
	ld a, [hl]
	and $0f
	add $05
	cp $10
	jr c, .asm_4612d
	call ProcessBlockOnRight
	and $0f
	jr z, .asm_4614b
.asm_4612d
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
	jp z, MoveObjectRight
.asm_4614b
	ld a, [wCurObjVar1]
	and a
	jr z, .asm_46161
	ld de, Frameset_68e4c
.asm_46154
	call SetObjectFramesetPtr
	ld a, 36
	ld [hli], a
	dec [hl]
	ld a, $5a
	ld [wCurObjState], a
	ret

.asm_46161
	ld de, Frameset_68e08
.asm_46164
	call SetObjectFramesetPtr
	ld a, 38
	ld [hli], a
	ld a, $5b
	ld [wCurObjState], a
	ret
.Func_46170:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_46181
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_46181
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $13
	ld [wCurObjState], a
	ret
.Func_4618c:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_4619d
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_4619d
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $0f
	jr z, .asm_461be
	dec [hl]
	jp nz, Func_3308
	ld l, OBJ_STATE
	ld a, $2e
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_461b8
	ld de, Frameset_68e57
	jp SetObjectFramesetPtr
.asm_461b8
	ld de, Frameset_68e60
	jp SetObjectFramesetPtr
.asm_461be
	dec [hl]
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	jr c, .asm_461d0
	set OBJSUBFLAG_HDIR_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $09
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ret

.asm_461d0
	res OBJSUBFLAG_HDIR_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $f6
	ld [hld], a
	ret
.Func_461db:
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
	jr c, .asm_461f4
	ld de, Frameset_68ddf
	call SetObjectFramesetPtr
	ret

.asm_461f4
	ld de, Frameset_68de8
	call SetObjectFramesetPtr
	ret
.Func_461fb:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_4620c
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_4620c
	ld c, $2a
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp $18
	jr c, .asm_46220
	cp $e8
	jr c, .asm_46253
.asm_46220
	ld hl, wCurObjSubState
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
	cp $c0
	jr nc, .asm_46242
	cp $40
	jr nc, .asm_46253
	ld a, [hli]
	rlca
	jr c, .asm_4623e
	ld de, Frameset_68df1
	jr .asm_46249
.asm_4623e
	ld a, $13
	ld [hl], a
	ret

.asm_46242
	ld a, [hli]
	rlca
	jr nc, .asm_4623e
	ld de, Frameset_68df8
.asm_46249
	ld a, $2d
	ld [hl], a
	call SetObjectFramesetPtr
	ld a, 20
	ld [hli], a
	ret

.asm_46253
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
	jr nz, .asm_4626e
	ld a, $11
	ld [wCurObjState], a
	ret

.asm_4626e
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_462af
	ld a, [hl]
	and $0f
	sub $06
	jr nc, .asm_4628b
	call ProcessBlockOnLeft
	and $0f
	jr z, .asm_462a9
.asm_4628b
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
.asm_462a9
	ld a, $13
	ld [wCurObjState], a
	ret

.asm_462af
	ld a, [hl]
	and $0f
	add $05
	cp $10
	jr c, .asm_462bf
	call ProcessBlockOnRight
	and $0f
	jr z, .asm_462dd
.asm_462bf
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
.asm_462dd
	ld a, $13
	ld [wCurObjState], a
	ret
.Func_462e3:
	ld hl, wCurObjState
	ld a, $32
	ld [hld], a
	jr .asm_462f1
.Func_462eb:
	ld hl, wCurObjState
	ld a, $33
	ld [hld], a
.asm_462f1
	ld a, [hld]
	rlca
	jr c, .asm_462fa
	ld de, Frameset_68e11
	jr .asm_462fd
.asm_462fa
	ld de, Frameset_68e14
.asm_462fd
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
.Func_46319:
	ld hl, wCurObjState
	ld a, $46
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_46328
	ld de, Frameset_68e17
	jr .asm_4632b
.asm_46328
	ld de, Frameset_68e20
.asm_4632b
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
.Func_4633e:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, $0f
	ld [wCurObjState], a
	ret
.Func_4634c:
	ld hl, wCurObjState
	ld a, $47
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_4635b
	ld de, Frameset_68e17
	jr .asm_4635e
.asm_4635b
	ld de, Frameset_68e20
.asm_4635e
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
.Func_46371:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, $0f
	ld [wCurObjState], a
	ret
.Func_4637f:
	ld hl, wCurObjState
	ld a, $44
	ld [hld], a
	jr .asm_4638d
.Func_46387:
	ld hl, wCurObjState
	ld a, $45
	ld [hld], a
.asm_4638d
	ld a, [hld]
	rlca
	jr c, .asm_46396
	ld de, Frameset_68e17
	jr .asm_46399
.asm_46396
	ld de, Frameset_68e20
.asm_46399
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
.Func_463b4:
	ld a, $3f
	ld [wCurObjState], a
	ld a, $64
	ld [wCurObjStateDuration], a
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
.Func_463c3:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_463d0
	ld a, $1c
	ld [wCurObjState], a
	ret

.asm_463d0
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_32ea
	ld a, $10
	ld [wCurObjState], a
	ret
.Func_463dd:
	ld hl, wCurObjState
	ld a, $40
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ld a, $07
	ld [wCurObjStateDuration], a
.Func_463eb:
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_32f9
	ld a, $00
	ld [wCurObjState], a
	ret
.Func_463f8:
	ld hl, wCurObjState
	ld a, $43
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_46407
	ld de, Frameset_68e33
	jr .asm_4640a
.asm_46407
	ld de, Frameset_68e3a
.asm_4640a
	call SetObjectFramesetPtr
	ld a, 26
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
.Func_46421:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_46432
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_46432
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $09
	jr z, .asm_46444
	dec [hl]
	jp nz, Func_3308
	ld a, $01
	ld [wCurObjState], a
	ret

.asm_46444
	dec [hl]
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	jr c, .asm_4644e
	set OBJSUBFLAG_HDIR_F, [hl]
	ret

.asm_4644e
	res OBJSUBFLAG_HDIR_F, [hl]
	ret
.Func_46451:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $38
	jr .asm_46463
.Func_4645b:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $39
.asm_46463
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_4646d
	ld de, Frameset_68e17
	jr .asm_46470
.asm_4646d
	ld de, Frameset_68e20
.asm_46470
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
.Func_4648d:
	ld a, $3b
	ld [wCurObjState], a
	jr .asm_46499
.Func_46494:
	ld a, $3c
	ld [wCurObjState], a
.asm_46499
	ld hl, wCurObjFrameDuration
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $02
	ld [wCurObjVar2], a
	ret
.Func_464a5:
	ld hl, wCurObjFrameDuration
	xor a
	ld [hli], a
	ld [hli], a
	ld l, OBJ_VAR_2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld de, Frameset_68dff
	jr .asm_464c7
.Func_464b7:
	ld hl, wCurObjFrameDuration
	xor a
	ld [hli], a
	ld [hli], a
	ld l, OBJ_VAR_2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld de, Frameset_68e08
.asm_464c7
	call SetObjectFramesetPtr
	ld a, 38
	ld [hli], a
	ld a, $5b
	ld [wCurObjState], a
	ret
.Func_464d3:
	ld hl, wCurObjState
	ld a, $59
	ld [hld], a
	ld b, $02
	jr .asm_464f9
.Func_464dd:
	ld hl, wCurObjState
	ld a, $58
	ld [hld], a
	ld b, $02
	jr .asm_464f9
.Func_464e7:
	ld hl, wCurObjState
	ld a, $34
	ld [hld], a
	ld b, $02
	jr .asm_464f9
.Func_464f1:
	ld hl, wCurObjState
	ld a, $35
	ld [hld], a
	ld b, $02
.asm_464f9
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
	jr c, .asm_46511
	ld de, Frameset_68e29
	jp SetObjectFramesetPtr
.asm_46511
	ld de, Frameset_68e2e
	jp SetObjectFramesetPtr
.Func_46517:
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
.Func_4652a:
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

.Func_4653d:
	ld hl, wCurObjState
	ld a, $49
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_4654c
	ld de, Frameset_68e17
	jr .asm_4654f
.asm_4654c
	ld de, Frameset_68e20
.asm_4654f
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_4655e:
	ld a, [wDirection]
	and a
	jp nz, Func_3353
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	jr .Func_4656e
.Func_4656e:
	ld hl, wCurObjState
	ld a, $48
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_4657d
	ld de, Frameset_68e17
	jr .asm_46580
.asm_4657d
	ld de, Frameset_68e20
.asm_46580
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_4658f:
	ld a, [wDirection]
	and a
	jp z, Func_3362
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	jp .Func_4653d

.Func_465a0:
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
