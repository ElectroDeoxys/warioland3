ParaGoomFunc:
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
	jp .Default

.Update:
	ld a, [wCurObjState]
	jumptable

	dw .Default
	dw .Func_41567
	dw .Func_416b0
	dw .Func_416b8
	dw .Func_419a6
	dw .Func_419b0
	dw .Func_419d5
	dw .Func_419e8
	dw .Func_41912
	dw .Func_4191c
	dw VanishObject2
	dw .Func_41954
	dw .Func_4195b
	dw .Func_41904
	dw .Default
	dw .Func_417a2
	dw .Func_417cb
	dw .Func_414c0
	dw .Func_41a64
	dw .Func_4188b
	dw .Func_41767
	dw .Func_4176f
	dw .Func_416fb
	dw .Func_41731
	dw .Func_41a2f
	dw .Func_419fb
	dw Func_3263
	dw Func_3272
	dw Func_3281
	dw .Default
	dw .Default
	dw .Default
	dw Func_3191
	dw Func_31af
	dw Func_31cd
	dw Func_31eb
	dw Func_3209
	dw Func_3227
	dw Func_3245
	dw Func_3254
	dw .Func_4199c
	dw .Func_41992
	dw .Default
	dw .Default
	dw .Default
	dw .Func_4152f
	dw .Func_41517
	dw .Default
	dw ObjState_Fall
	dw .Func_41598
	dw ObjState_BumpLeft
	dw ObjState_BumpRight
	dw Func_3326
	dw Func_3317
	dw Func_3335
	dw Func_3344
	dw Func_31fa
	dw Func_31dc
	dw .Default
	dw .Func_4196c
	dw .Func_4197f
	dw .Default
	dw .Default
	dw .Func_417b1
	dw .Func_417e8
	dw .Func_414fb
	dw Func_3371
	dw .Func_418c4
	dw Func_32cc
	dw Func_32db
	dw .Func_41723
	dw .Func_41759
	dw .Func_41a53
	dw .Func_41a1f
	dw Func_3380
	dw Func_338f
	dw .Func_41439
	dw .Func_41447
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
	dw .Func_4181c
	dw .Func_41830
	dw .Func_4186f
	dw .Default
	dw ObjState_FullThrowLeft
	dw ObjState_FullThrowRight

.Func_41439:
	ld a, $5e
	ld [wCurObjState], a
	ld de, Frameset_684a1
	call SetObjectFramesetPtr
	jp ObjState_FullThrowLeft

.Func_41447:
	ld a, $5f
	ld [wCurObjState], a
	ld de, Frameset_684a1
	call SetObjectFramesetPtr
	jp ObjState_FullThrowRight

.Default:
	xor a
	ld [wCurObjVar1], a
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hli], a
	ld a, $f4
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
	jr c, .asm_4148d
	res OBJFLAG_PRIORITY_F, [hl]
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_68439
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $06
	ld [hld], a
	ld a, $f6
	ld [hld], a
	jr .asm_414a0

.asm_4148d
	set OBJFLAG_PRIORITY_F, [hl]
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_68442
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $09
	ld [hld], a
	ld a, $f9
	ld [hld], a
.asm_414a0
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
	ret nz
	ld hl, wCurObjState
	ld a, $41
	ld [hld], a
	xor a
	ld [wCurObjStateDuration], a
	jr .asm_41505

.Func_414c0:
	ld hl, wCurObjState
	ld a, $41
	ld [hld], a
	ld a, [wCurObjCollBoxTop]
	cp $ef
	jr z, .asm_414e4
	ld a, [hld]
	rlca
	jr c, .asm_414d8
	xor a
	ld [hld], a
	ld de, Frameset_684e7
	jr .asm_414dd

.asm_414d8
	xor a
	ld [hld], a
	ld de, Frameset_6850a
.asm_414dd
	call SetObjectFramesetPtr
	ld a, $38
	ld [hld], a
	ret

.asm_414e4
	ld a, [hld]
	rlca
	jr c, .asm_414ef
	xor a
	ld [hld], a
	ld de, Frameset_6852d
	jr .asm_414f4

.asm_414ef
	xor a
	ld [hld], a
	ld de, Frameset_68546
.asm_414f4
	call SetObjectFramesetPtr
	ld a, $29
	ld [hld], a
	ret

.Func_414fb:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jp z, .Func_41830
	dec [hl]
	ret nz
.asm_41505
	ld de, Frameset_684ba
	call SetObjectFramesetPtr
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_TOP_STING
	ld [hli], a
	ld a, $ef
	ld [hl], a
	ret

.Func_41517:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_41528
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_41528
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	jr .asm_41570

.Func_4152f:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_41540
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_41540
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
.asm_41545
	ld l, OBJ_STATE
	ld a, $31
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_41553
	ld de, Frameset_6844b
	jr .asm_41556

.asm_41553
	ld de, Frameset_68454
.asm_41556
	call SetObjectFramesetPtr
	xor a
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_TOP_STING
	ld [hli], a
	ld a, $ef
	ld [hl], a
	ret

.Func_41567:
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
.asm_41570
	ld l, OBJ_STATE
	ld a, $31
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_41586
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $06
	ld [hld], a
	ld a, $f6
	ld [hld], a
	ld de, Frameset_68439
	jr .asm_41591

.asm_41586
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $09
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld de, Frameset_68442
.asm_41591
	call SetObjectFramesetPtr
	ld a, $0a
	ld [hli], a
	ret

.Func_41598:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_415a9
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_415a9
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_415bb
	dec [hl]
	ret nz
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_FRONT_STING
	ld [hld], a
	ret

.asm_415bb
	inc l
	inc [hl]
	jr nz, .asm_41611
	ld a, [wCurObjCollBoxTop]
	cp $ef
	jr nz, .asm_415e9
	ld l, OBJ_STATE
	ld a, $2e
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_415d4
	ld de, Frameset_6846e
	jr .asm_415d7

.asm_415d4
	ld de, Frameset_68490
.asm_415d7
	call SetObjectFramesetPtr
	ld a, $a3
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hli], a
	ld a, $f4
	ld [hl], a
	ret

.asm_415e9
	ld l, OBJ_STATE
	ld a, $2d
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_415f7
	ld de, Frameset_6845d
	jr .asm_415fa

.asm_415f7
	ld de, Frameset_6847f
.asm_415fa
	call SetObjectFramesetPtr
	ld a, $a3
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ret

.asm_41611
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
	jr nz, .asm_4162c
	ld a, $11
	ld [wCurObjState], a
	ret

.asm_4162c
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_41677
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld a, [hl]
	and $0f
	sub b
	jr nc, .asm_4164e
	call ProcessCellOnLeft
	and $0f
	jr z, .asm_41671
.asm_4164e
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectLeft_Slow
.asm_41671
	ld a, $13
	ld [wCurObjState], a
	ret

.asm_41677
	ld a, [wCurObjCollBoxRight]
	ld b, a
	ld a, [hl]
	and $0f
	add b
	cp $10
	jr c, .asm_4168a
	call ProcessCellOnRight
	and $0f
	jr z, .asm_416aa
.asm_4168a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectRight_Slow
.asm_416aa
	ld a, $13
	ld [wCurObjState], a
	ret

.Func_416b0:
	ld hl, wCurObjState
	ld a, $32
	ld [hld], a
	jr .asm_416be

.Func_416b8:
	ld hl, wCurObjState
	ld a, $33
	ld [hld], a
.asm_416be
	ld a, [wCurObjCollBoxTop]
	cp $ef
	jr z, .asm_416ed
	ld a, [hld]
	rlca
	jr c, .asm_416ce
	ld de, Frameset_68439
	jr .asm_416d1

.asm_416ce
	ld de, Frameset_68442
.asm_416d1
	call SetObjectFramesetPtr
	ld a, $0c
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

.asm_416ed
	ld a, [hld]
	rlca
	jr c, .asm_416f6
	ld de, Frameset_6844b
	jr .asm_416d1

.asm_416f6
	ld de, Frameset_68454
	jr .asm_416d1

.Func_416fb:
	ld hl, wCurObjState
	ld a, $46
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_4170a
	ld de, Frameset_684aa
	jr .asm_4170d

.asm_4170a
	ld de, Frameset_684af
.asm_4170d
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
	ld [hli], a
	ld a, $f4
	ld [hl], a
.Func_41723:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, $0f
	ld [wCurObjState], a
	ret

.Func_41731:
	ld hl, wCurObjState
	ld a, $47
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_41740
	ld de, Frameset_684aa
	jr .asm_41743

.asm_41740
	ld de, Frameset_684af
.asm_41743
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
	ld [hli], a
	ld a, $f4
	ld [hl], a
.Func_41759:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, $0f
	ld [wCurObjState], a
	ret

.Func_41767:
	ld hl, wCurObjState
	ld a, $44
	ld [hld], a
	jr .asm_41775

.Func_4176f:
	ld hl, wCurObjState
	ld a, $45
	ld [hld], a
.asm_41775
	ld a, [hld]
	rlca
	jr c, .asm_41781
	ld de, Frameset_684aa
	call SetObjectFramesetPtr
	jr .asm_41787

.asm_41781
	ld de, Frameset_684af
	call SetObjectFramesetPtr
.asm_41787
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
	ld [hli], a
	ld a, $f4
	ld [hl], a
	ret

.Func_417a2:
	ld a, $3f
	ld [wCurObjState], a
	ld a, $64
	ld [wCurObjStateDuration], a
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
.Func_417b1:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_417be
	ld a, $1c
	ld [wCurObjState], a
	ret

.asm_417be
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_32ea
	ld a, $10
	ld [wCurObjState], a
	ret

.Func_417cb:
	ld hl, wCurObjState
	ld a, $40
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_684b4
	call SetObjectFramesetPtr
	ld a, $08
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_TOP_STING
	ld [hli], a
	ld a, $ef
	ld [hl], a
.Func_417e8:
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_4180d
	ld l, OBJ_Y_POS
	ld a, [hli]
	sub $08
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_358b
	and $0f
	jr nz, .asm_4180d
	ld bc, Data_60530
	jp ApplyObjYMovement
.asm_4180d
	ld a, $5a
	ld [wCurObjState], a
	ld de, Frameset_684b7
	call SetObjectFramesetPtr
	ld a, $04
	ld [hli], a
	ret

.Func_4181c:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_STATE
	ld a, $5b
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_684ba
	call SetObjectFramesetPtr
	ret

.Func_41830:
	call MoveObjectDown_Slow
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc18c], a
	call Func_352b
	and a
	jr nz, .asm_41857
	ld a, [wc0dd]
	and a
	ret z
	ld a, $0a
	ld [wCurObjState], a
	ret

.asm_41857
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_STATE
	ld a, $5c
	ld [hld], a
	ld de, Frameset_6855f
	call SetObjectFramesetPtr
	ld a, $0a
	ld [hli], a
	ret

.Func_4186f:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_41880
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_41880
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $00
	ld [wCurObjState], a
	ret

.Func_4188b:
	ld hl, wCurObjState
	ld a, $43
	ld [hld], a
	ld a, [wCurObjCollBoxTop]
	cp $ef
	jr z, .asm_418ae
	ld a, [hld]
	rlca
	jr c, .asm_418a4
	ld de, Frameset_684cb
	call SetObjectFramesetPtr
	jr .asm_418aa

.asm_418a4
	ld de, Frameset_684d2
	call SetObjectFramesetPtr
.asm_418aa
	ld a, $44
	ld [hli], a
	ret

.asm_418ae
	ld a, [hld]
	rlca
	jr c, .asm_418ba
	ld de, Frameset_684d9
	call SetObjectFramesetPtr
	jr .asm_418c0

.asm_418ba
	ld de, Frameset_684e0
	call SetObjectFramesetPtr
.asm_418c0
	ld a, $44
	ld [hli], a
	ret

.Func_418c4:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_418d5
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_418d5
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $27
	jr z, .asm_418ef
	dec [hl]
	jp nz, Func_3308
	ld a, [wCurObjCollBoxTop]
	cp $ef
	jp z, .asm_41545
	ld a, $01
	ld [wCurObjState], a
	ret

.asm_418ef
	dec [hl]
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	jr c, .asm_41901
	set OBJSUBFLAG_HDIR_F, [hl]
	ret

.asm_41901
	res OBJSUBFLAG_HDIR_F, [hl]
	ret

.Func_41904:
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .Func_4191c
.Func_41912:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $38
	jr .asm_41924

.Func_4191c:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $39
.asm_41924
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_41931
	ld de, Frameset_684aa
	call SetObjectFramesetPtr
	jr .asm_41937

.asm_41931
	ld de, Frameset_684af
	call SetObjectFramesetPtr
.asm_41937
	ld a, $04
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
	ld [hli], a
	ld a, $f4
	ld [hl], a
	ret

.Func_41954:
	ld a, $3b
	ld [wCurObjState], a
	jr .asm_41960

.Func_4195b:
	ld a, $3c
	ld [wCurObjState], a
.asm_41960
	ld hl, wCurObjFrameDuration
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $02
	ld [wCurObjVar2], a
	ret

.Func_4196c:
	ld hl, wCurObjFrameDuration
	xor a
	ld [hli], a
	ld [hli], a
	ld l, OBJ_VAR_2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, $13
	ld [wCurObjState], a
	ret

.Func_4197f:
	ld hl, wCurObjFrameDuration
	xor a
	ld [hli], a
	ld [hli], a
	ld l, OBJ_VAR_2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, $13
	ld [wCurObjState], a
	ret

.Func_41992:
	ld hl, wCurObjState
	ld a, $59
	ld [hld], a
	ld b, $02
	jr .asm_419b8

.Func_4199c:
	ld hl, wCurObjState
	ld a, $58
	ld [hld], a
	ld b, $02
	jr .asm_419b8

.Func_419a6:
	ld hl, wCurObjState
	ld a, $34
	ld [hld], a
	ld b, $02
	jr .asm_419b8

.Func_419b0:
	ld hl, wCurObjState
	ld a, $35
	ld [hld], a
	ld b, $02
.asm_419b8
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [hl]
	and $f0
	ld [hld], a
	ld c, a
	xor a
	ld [hld], a
	ld [hl], b
	ld a, c
	rlca
	jr c, .asm_419cf
	ld de, Frameset_684aa
	jp SetObjectFramesetPtr
.asm_419cf
	ld de, Frameset_684af
	jp SetObjectFramesetPtr
.Func_419d5:
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

.Func_419e8:
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

.Func_419fb:
	ld hl, wCurObjState
	ld a, $49
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_41a0d
	ld de, Frameset_684aa
	call SetObjectFramesetPtr
	jr .asm_41a13

.asm_41a0d
	ld de, Frameset_684af
	call SetObjectFramesetPtr
.asm_41a13
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_41a1f:
	ld a, [wDirection]
	and a
	jp nz, Func_3353
	ld hl, wCurObjSubState
	ld a, [hl]
	xor $80
	ld [hl], a
	jr .Func_41a2f

.Func_41a2f:
	ld hl, wCurObjState
	ld a, $48
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_41a41
	ld de, Frameset_684aa
	call SetObjectFramesetPtr
	jr .asm_41a47

.asm_41a41
	ld de, Frameset_684af
	call SetObjectFramesetPtr
.asm_41a47
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_41a53:
	ld a, [wDirection]
	and a
	jp z, Func_3362
	ld hl, wCurObjSubState
	ld a, [hl]
	xor $80
	ld [hl], a
	jp .Func_419fb
.Func_41a64:
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
	ld [hli], a
	ld a, $f4
	ld [hl], a
	ret
