RoboMouseFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_488f7)
	ld [hld], a
	ld a, LOW(.Func_488f7)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $0b
	ld [hld], a
	ld a, $f4
	ld [hld], a
	ld a, $fc
	ld [hl], a
	ret

.Func_488f7:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_4892a)
	ld [hld], a
	ld a, LOW(.Func_4892a)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_4891f
	res OBJSUBFLAG_HDIR_F, [hl]
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_69220
	jp SetObjectFramesetPtr
.asm_4891f
	set OBJSUBFLAG_HDIR_F, [hl]
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_691de
	jp SetObjectFramesetPtr

.Func_4892a:
	ld a, [wCurObjState]
	jumptable

	dw .Func_48b13
	dw .Func_48b2b
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48a47
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b21
	dw .Func_48b13
	dw .Func_48c4d
	dw Func_3245
	dw Func_3254
	dw .Func_48c4d
	dw .Func_48c4d
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw Func_3191
	dw Func_31af
	dw .Func_48a17
	dw .Func_48a23
	dw .Func_489ff
	dw .Func_48a0b
	dw .Func_48a2f
	dw .Func_48a3b
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_489e8
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48cc6
	dw .Func_48cd7
	dw .Func_48b13
	dw ObjState_Fall
	dw .Func_48b30
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48ae9
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw ObjState_StandingFall
	dw .Func_48b13
	dw .Func_48c60
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_48b13
	dw Func_31a0
	dw Func_31be
	dw .Func_48a1d
	dw .Func_48a29
	dw .Func_48a05
	dw .Func_48a11
	dw .Func_48a35
	dw .Func_48a41
	dw .Func_48b13
	dw .Func_48b13
	dw .Func_489fe
	dw .Func_48b13
	dw .Func_48b13

.Func_489e8:
	ld hl, wCurObjState
	ld a, $5a
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_489f7
	ld de, Frameset_69200
	jr .asm_489fa
.asm_489f7
	ld de, Frameset_691fb
.asm_489fa
	call SetObjectFramesetPtr
	ret

.Func_489fe:
	ret

.Func_489ff:
	call .Func_48cec
	jp Func_3209
.Func_48a05:
	call .Func_48cec
	jp Func_3218
.Func_48a0b:
	call .asm_48d3d
	jp Func_3227
.Func_48a11:
	call .asm_48d3d
	jp Func_3236
.Func_48a17:
	call .Func_48cec
	jp Func_31cd
.Func_48a1d:
	call .Func_48cec
	jp Func_31dc
.Func_48a23:
	call .asm_48d3d
	jp Func_31eb
.Func_48a29:
	call .asm_48d3d
	jp Func_31fa
.Func_48a2f:
	call .Func_48cec
	jp Func_3245
.Func_48a35:
	call .Func_48cec
	jp Func_32cc
.Func_48a3b:
	call .asm_48d3d
	jp Func_3254
.Func_48a41:
	call .asm_48d3d
	jp Func_32db
.Func_48a47:
	ld hl, wCurObjFlags
	bit OBJFLAG_NO_COLLISION_F, [hl]
	jr z, .asm_48a8e
	res OBJFLAG_NO_COLLISION_F, [hl]
	res OBJFLAG_PRIORITY_F, [hl]
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_48a5d
	ld de, Frameset_6920c
	jr .asm_48a60
.asm_48a5d
	ld de, Frameset_69205
.asm_48a60
	call SetObjectFramesetPtr
	ld a, $3c
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and $80
	or $0b
	ld [hld], a
	play_sfx SFX_VANISH
	ld bc, ObjParams_StarsAbove
	call CreateObjectFromCurObjPos
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jp c, .Func_489ff
	jp .Func_48a0b
.asm_48a8e
	ld l, OBJ_STATE
	ld a, $3a
	ld [hld], a
	ld a, [wCurObjInteractionType]
	and $7f
	cp $0b
	jr z, .asm_48aab
	ld a, [hld]
	rlca
	jr c, .asm_48aa5
	ld de, Frameset_69220
	jr .asm_48aa8
.asm_48aa5
	ld de, Frameset_691de
.asm_48aa8
	call SetObjectFramesetPtr
.asm_48aab
	ld l, OBJ_FLAGS
	bit OBJFLAG_ON_SCREEN_F, [hl]
	ret z
	ld l, OBJ_Y_POS
	ld a, [hli]
	and $f0
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	ld b, PARTICLE_SPLASH
	farcall CreateParticle
	play_sfx SFX_083
	ret

.Func_48ae9:
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
	call Func_352b
	and a
	ret z
	ld a, [wCurObjInteractionType]
	and $7f
	cp $0b
	jr z, .asm_48b0d
	ld a, $31
	jr .asm_48b0f
.asm_48b0d
	ld a, $13
.asm_48b0f
	ld [wCurObjState], a
	ret

.Func_48b13:
	ld hl, wCurObjState
	ld a, $30
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ld l, OBJ_FLAGS
	res OBJFLAG_NO_COLLISION_F, [hl]
	ret

.Func_48b21:
	ld hl, wCurObjState
	ld a, $41
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ret

.Func_48b2b:
	ld a, $31
	ld [wCurObjState], a
.Func_48b30:
	ld a, [wCurObjSubState]
	rlca
	jp c, .asm_48bc2
	call MoveObjectLeft
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
	jp z, .asm_48bb7
	cp $10
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ret z
	ld a, [hli]
	sub $08
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3543
	and a
	jr z, .asm_48ba2
	call .asm_48ce8
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
	ld a, [hl]
	sbc $00
	ldh [hXPosHi], a
	ld a, $03
	ld [wc0d9], a
	call Func_3513
	and $0f
	ret z
	ld hl, wCurObjYPos
	ld a, [hl]
	sub $06
	ld [hli], a
	jr nc, .asm_48b9b
	dec [hl]
.asm_48b9b
	ld a, $24
	ld [wCurObjState], a
	jr .asm_48ba7
.asm_48ba2
	ld a, $22
	ld [wCurObjState], a
.asm_48ba7
	ld a, $02
	ld [wCurObjVar2], a
	ld de, Frameset_69213
	ld a, [wCurObjFramesetPtr]
	cp e
	ret z
	jp SetObjectFramesetPtr

.asm_48bb7
	ld a, $11
	ld [wCurObjState], a
	ld de, Frameset_69220
	jp SetObjectFramesetPtr

.asm_48bc2
	call MoveObjectRight
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
	jp z, .asm_48c42
	cp $10
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ret z
	ld a, [hli]
	add $07
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3543
	and a
	jr z, .asm_48c2d
	call .asm_48d39
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	add $13
	ldh [hXPosLo], a
	ld a, [hl]
	adc $00
	ldh [hXPosHi], a
	ld a, $03
	ld [wc0d9], a
	call Func_3513
	and $0f
	ret z
	ld hl, wCurObjYPos
	ld a, [hl]
	sub $06
	ld [hli], a
	jr nc, .asm_48c26
	dec [hl]
.asm_48c26
	ld a, $25
	ld [wCurObjState], a
	jr .asm_48c32
.asm_48c2d
	ld a, $23
	ld [wCurObjState], a
.asm_48c32
	ld a, $02
	ld [wCurObjVar2], a
	ld de, Frameset_691e5
	ld a, [wCurObjFramesetPtr]
	cp e
	ret z
	jp SetObjectFramesetPtr

.asm_48c42
	ld a, $11
	ld [wCurObjState], a
	ld de, Frameset_691de
	jp SetObjectFramesetPtr
.Func_48c4d:
	ld a, $43
	ld [wCurObjState], a
	ld a, $01
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jr z, .asm_48c5d
	ld a, $0a
.asm_48c5d
	ld [wCurObjStateDuration], a
.Func_48c60:
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_3308
	ld l, OBJ_X_POS
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld l, OBJ_SUBSTATE
	ld a, [wXPosHi]
	cp d
	jr c, .asm_48c8a
	jr nz, .asm_48c7c
	ld a, [wXPosLo]
	cp e
	jr c, .asm_48c8a
.asm_48c7c
	ld a, [hli]
	rlca
	jr c, .asm_48ca5
	ld a, $2d
	ld [hld], a
	set OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_69227
	jr .asm_48c96
.asm_48c8a
	ld a, [hli]
	rlca
	jr nc, .asm_48ca5
	ld a, $2e
	ld [hld], a
	res OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_691f2
.asm_48c96
	call SetObjectFramesetPtr
	ld a, $31
	ld [hli], a
.asm_48c9c
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and $80
	or $30
	ld [hld], a
	ret

.asm_48ca5
	ld a, $31
	ld [hld], a
	ld a, [wCurObjInteractionType]
	and $7f
	cp $0b
	jr nz, .asm_48c9c
	ld a, [hld]
	rlca
	jr c, .asm_48cba
	ld de, Frameset_69220
	jr .asm_48cbd
.asm_48cba
	ld de, Frameset_691de
.asm_48cbd
	call SetObjectFramesetPtr
	ld l, OBJ_FLAGS
	set OBJFLAG_PRIORITY_F, [hl]
	jr .asm_48c9c
.Func_48cc6:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_691de
	call SetObjectFramesetPtr
	ld a, $31
	ld [wCurObjState], a
	ret

.Func_48cd7:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_69220
	call SetObjectFramesetPtr
	ld a, $31
	ld [wCurObjState], a
	ret

.asm_48ce8
	ld b, $0c
	jr .asm_48cee
.Func_48cec
	ld b, $0e
.asm_48cee
	ld hl, wCurObjXPos
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, $02
	ld [wc0d9], a
	call Func_3513
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $14
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, $02
	ld [wc0d9], a
	call Func_3513
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $24
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, $02
	ld [wc0d9], a
	jp Func_3513

.asm_48d39
	ld b, $0b
	jr .asm_48d3f
.asm_48d3d
	ld b, $0d
.asm_48d3f
	ld hl, wCurObjXPos
	ld a, [hli]
	add b
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, $02
	ld [wc0d9], a
	call Func_3513
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $14
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, $02
	ld [wc0d9], a
	call Func_3513
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $24
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, $02
	ld [wc0d9], a
	jp Func_3513
