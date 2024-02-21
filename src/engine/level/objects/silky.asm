SilkyFunc:
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
	dw .Func_42eca
	dw .Func_43126
	dw .Func_43130
	dw .Func_431b4
	dw .Func_431be
	dw .Func_431da
	dw .Func_431ed
	dw .Func_43126
	dw .Func_43130
	dw VanishObject2
	dw .Func_43162
	dw .Func_43169
	dw .Default
	dw .Default
	dw .Func_43083
	dw .Func_430ba
	dw .Func_42e7b
	dw .Func_43263
	dw .Func_430d5
	dw .Func_4304b
	dw .Func_43053
	dw .Func_42fe5
	dw .Func_43018
	dw .Func_43231
	dw .Func_43200
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
	dw .Func_431aa
	dw .Func_431a0
	dw .Default
	dw .Default
	dw .Default
	dw .Func_42e95
	dw .Default
	dw .Default
	dw ObjState_Fall
	dw .Func_42ef8
	dw ObjState_BumpLeft
	dw ObjState_BumpRight
	dw Func_3326
	dw Func_3317
	dw Func_3335
	dw Func_3344
	dw Func_31fa
	dw Func_31dc
	dw .Default
	dw .Func_4317a
	dw .Func_4318d
	dw .Default
	dw .Default
	dw .Func_430a0
	dw .Func_430c8
	dw ObjState_StandingFall
	dw Func_3371
	dw .Func_430f6
	dw Func_32cc
	dw Func_32db
	dw .Func_4300a
	dw .Func_4303d
	dw .Func_43252
	dw .Func_43221
	dw Func_3380
	dw Func_338f
	dw .Func_42dff
	dw .Func_42e1b
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
	dw .Default
	dw .Default
	dw .Default
	dw .Default
	dw ObjState_FullThrowLeft
	dw ObjState_FullThrowRight

.Func_42dff:
	ld hl, wCurObjState
	ld a, $5e
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_42e12
	ld de, Frameset_6879e
	call SetObjectFramesetPtr
	jp ObjState_FullThrowLeft
.asm_42e12
	ld de, Frameset_687a7
	call SetObjectFramesetPtr
	jp ObjState_FullThrowLeft

.Func_42e1b:
	ld hl, wCurObjState
	ld a, $5f
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_42e2e
	ld de, Frameset_6879e
	call SetObjectFramesetPtr
	jp ObjState_FullThrowRight
.asm_42e2e
	ld de, Frameset_687a7
	call SetObjectFramesetPtr
	jp ObjState_FullThrowRight

.Default:
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
	jr c, .asm_42e67
	res OBJSUBFLAG_HDIR_F, [hl]
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_68744
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $06
	ld [hld], a
	ld a, $f8
	ld [hld], a
	ret

.asm_42e67
	set OBJSUBFLAG_HDIR_F, [hl]
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_6874d
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ret

.Func_42e7b:
	ld hl, wCurObjState
	ld a, $41
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_42e8d
	xor a
	ld [hld], a
	ld de, Frameset_68744
	jp SetObjectFramesetPtr
.asm_42e8d
	xor a
	ld [hld], a
	ld de, Frameset_6874d
	jp SetObjectFramesetPtr
.Func_42e95:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jp z, .asm_42f44
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_42eae
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_42eae
	dec [hl]
	ret nz
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_SILKY
	ld [hld], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_42ec4
	ld de, Frameset_68756
	jp SetObjectFramesetPtr
.asm_42ec4
	ld de, Frameset_6875f
	jp SetObjectFramesetPtr

.Func_42eca:
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
	jr c, .asm_42eea
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $06
	ld [hld], a
	ld a, $f8
	ld [hld], a
	ld de, Frameset_68744
	jp SetObjectFramesetPtr
.asm_42eea
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld de, Frameset_6874d
	jp SetObjectFramesetPtr

.Func_42ef8:
	ld a, [wTransformation]
	cp TRANSFORMATION_BALL_O_STRING_WARIO
	jr z, .asm_42f44
	ld c, $2a
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp $0f
	jr c, .asm_42f13
	cp $f1
	jr c, .asm_42f44
.asm_42f13
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	cp b
	ld hl, wCurObjSubState
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr c, .asm_42f2b
	jr nz, .asm_42f32
	ld de, Frameset_687b0
	jr .asm_42f38

.asm_42f2b
	jr z, .asm_42f32
	ld de, Frameset_687bb
	jr .asm_42f38

.asm_42f32
	ld a, $13
	ld [wCurObjState], a
	ret

.asm_42f38
	call SetObjectFramesetPtr
	ld a, $23
	ld [hli], a
	ld a, $2d
	ld [wCurObjState], a
	ret

.asm_42f44
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_42f55
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_42f55
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
	jr nz, .asm_42f70
	ld a, $11
	ld [wCurObjState], a
	ret

.asm_42f70
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_42fb1
	ld a, [hl]
	and $0f
	sub $08
	jr nc, .asm_42f8d
	call ProcessBlockOnLeft
	and $0f
	jr z, .asm_42fab
.asm_42f8d
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
.asm_42fab
	ld a, $13
	ld [wCurObjState], a
	ret

.asm_42fb1
	ld a, [hl]
	and $0f
	add $07
	cp $10
	jr c, .asm_42fc1
	call ProcessBlockOnRight
	and $0f
	jr z, .asm_42fdf
.asm_42fc1
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
.asm_42fdf
	ld a, $13
	ld [wCurObjState], a
	ret

.Func_42fe5:
	ld hl, wCurObjState
	ld a, $46
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_42ff4
	ld de, Frameset_6877a
	jr .asm_42ff7

.asm_42ff4
	ld de, Frameset_68783
.asm_42ff7
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
.Func_4300a:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, $0f
	ld [wCurObjState], a
	ret

.Func_43018:
	ld hl, wCurObjState
	ld a, $47
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_43027
	ld de, Frameset_6877a
	jr .asm_4302a

.asm_43027
	ld de, Frameset_68783
.asm_4302a
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
.Func_4303d:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, $0f
	ld [wCurObjState], a
	ret

.Func_4304b:
	ld hl, wCurObjState
	ld a, $44
	ld [hld], a
	jr .asm_43059

.Func_43053:
	ld hl, wCurObjState
	ld a, $45
	ld [hld], a
.asm_43059
	ld a, [hld]
	rlca
	jr c, .asm_43065
	ld de, Frameset_6877a
	call SetObjectFramesetPtr
	jr .asm_4306b

.asm_43065
	ld de, Frameset_68783
	call SetObjectFramesetPtr
.asm_4306b
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

.Func_43083:
	ld hl, wCurObjState
	ld a, $3f
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_43092
	ld de, Frameset_6877a
	jr .asm_43095

.asm_43092
	ld de, Frameset_68783
.asm_43095
	call SetObjectFramesetPtr
	ld a, $64
	ld [hli], a
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
.Func_430a0:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_430ad
	ld a, $1c
	ld [wCurObjState], a
	ret

.asm_430ad
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_32ea
	ld a, $10
	ld [wCurObjState], a
	ret

.Func_430ba:
	ld hl, wCurObjState
	ld a, $40
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ld a, $07
	ld [wCurObjStateDuration], a
.Func_430c8:
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_32f9
	ld a, $00
	ld [wCurObjState], a
	ret

.Func_430d5:
	ld hl, wCurObjState
	ld a, $43
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_430e4
	ld de, Frameset_68768
	jr .asm_430e7

.asm_430e4
	ld de, Frameset_68771
.asm_430e7
	call SetObjectFramesetPtr
	ld a, $23
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ret

.Func_430f6:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_43107
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_43107
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_3308
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_4311d
	ld hl, wCurObjState
	ld a, $01
	ld [hld], a
	set OBJSUBFLAG_HDIR_F, [hl]
	ret

.asm_4311d
	ld hl, wCurObjState
	ld a, $01
	ld [hld], a
	res OBJSUBFLAG_HDIR_F, [hl]
	ret

.Func_43126:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $38
	jr .asm_43138

.Func_43130:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $39
.asm_43138
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_43142
	ld de, Frameset_6878c
	jr .asm_43145

.asm_43142
	ld de, Frameset_68795
.asm_43145
	call SetObjectFramesetPtr
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
	ld [hld], a
	ret

.Func_43162:
	ld a, $3b
	ld [wCurObjState], a
	jr .asm_4316e

.Func_43169:
	ld a, $3c
	ld [wCurObjState], a
.asm_4316e
	ld hl, wCurObjFrameDuration
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $02
	ld [wCurObjVar2], a
	ret

.Func_4317a:
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

.Func_4318d:
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

.Func_431a0:
	ld hl, wCurObjState
	ld a, $59
	ld [hld], a
	ld b, $02
	jr .asm_431c6

.Func_431aa:
	ld hl, wCurObjState
	ld a, $58
	ld [hld], a
	ld b, $02
	jr .asm_431c6

.Func_431b4:
	ld hl, wCurObjState
	ld a, $34
	ld [hld], a
	ld b, $02
	jr .asm_431c6

.Func_431be:
	ld hl, wCurObjState
	ld a, $35
	ld [hld], a
	ld b, $02
.asm_431c6
	ld a, [hl]
	and $f0
	ld [hld], a
	xor a
	ld [hld], a
	ld a, b
	ld [hld], a
	ld de, Frameset_687c6
	call SetObjectFramesetPtr
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

.Func_431da:
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
.Func_431ed:
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

.Func_43200:
	ld hl, wCurObjState
	ld a, $49
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_4320f
	ld de, Frameset_6877a
	jr .asm_43212

.asm_4320f
	ld de, Frameset_68783
.asm_43212
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_43221:
	ld a, [wDirection]
	and a
	jp nz, Func_3353
	ld hl, wCurObjSubState
	ld a, [hl]
	xor $80
	ld [hl], a
	jr .Func_43231

.Func_43231:
	ld hl, wCurObjState
	ld a, $48
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_43240
	ld de, Frameset_6877a
	jr .asm_43243

.asm_43240
	ld de, Frameset_68783
.asm_43243
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_43252:
	ld a, [wDirection]
	and a
	jp z, Func_3362
	ld hl, wCurObjSubState
	ld a, [hl]
	xor $80
	ld [hl], a
	jp .Func_43200

.Func_43263:
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
