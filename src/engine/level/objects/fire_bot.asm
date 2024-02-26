FireBotFunc:
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
	jp .Func_46c42

.Update:
	ld a, [wCurObjState]
	jumptable

	dw .Func_46c42
	dw .Func_46e6f
	dw .Func_46f7c
	dw .Func_46f84
	dw .Func_47180
	dw .Func_4718a
	dw .Func_471b0
	dw .Func_471c3
	dw .Func_470ea
	dw .Func_470f4
	dw VanishObject2
	dw .Func_47126
	dw .Func_4712d
	dw .Func_46c42
	dw .Func_46c42
	dw .Func_4704d
	dw .Func_47076
	dw .Func_46c7e
	dw .Func_47239
	dw .Func_47091
	dw .Func_47018
	dw .Func_47020
	dw .Func_46fb2
	dw .Func_46fe5
	dw .Func_47207
	dw .Func_471d6
	dw Func_3263
	dw Func_3272
	dw Func_3281
	dw .Func_46c42
	dw .Func_46c42
	dw .Func_46c42
	dw Func_3191
	dw Func_31af
	dw Func_31cd
	dw Func_31eb
	dw Func_3209
	dw Func_3227
	dw Func_3245
	dw Func_3254
	dw .Func_47176
	dw .Func_4716c
	dw .Func_46c42
	dw .Func_46c42
	dw .Func_46c42
	dw .Func_46ce4
	dw .Func_46d38
	dw .Func_46c42
	dw ObjState_Fall
	dw .Func_46e8d
	dw ObjState_BumpLeft
	dw ObjState_BumpRight
	dw Func_3326
	dw Func_3317
	dw Func_3335
	dw Func_3344
	dw Func_31fa
	dw Func_31dc
	dw .Func_46c42
	dw .Func_4713e
	dw .Func_47150
	dw .Func_46c42
	dw .Func_46c42
	dw .Func_4705c
	dw .Func_47084
	dw .Func_46cc6
	dw Func_3371
	dw .Func_470ba
	dw Func_32cc
	dw Func_32db
	dw .Func_46fd7
	dw .Func_4700a
	dw .Func_47228
	dw .Func_471f7
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
	dw .Func_46e1e
	dw .Func_46e02
	dw .Func_46c42

.Func_46c42:
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
	jr c, .asm_46c72
	res OBJSUBFLAG_HDIR_F, [hl]
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_6893d
	call SetObjectFramesetPtr
	ret

.asm_46c72
	set OBJSUBFLAG_HDIR_F, [hl]
	dec l
	xor a
	ld [hld], a
	ld de, Frameset_68946
	call SetObjectFramesetPtr
	ret
.Func_46c7e:
	ld hl, wCurObjState
	ld a, $41
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_46ca7
	xor a
	ld [hld], a
	ld l, OBJ_COLLBOX_LEFT
	ld a, [hl]
	cp $f6
	jr nz, .asm_46c9e
	ld a, $fa
	ld [hl], a
	ld de, Frameset_689db
	call SetObjectFramesetPtr
	ld a, 14
	ld [hli], a
	ret

.asm_46c9e
	ld de, Frameset_6893d
	call SetObjectFramesetPtr
	xor a
	ld [hl], a
	ret

.asm_46ca7
	xor a
	ld [hld], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, [hl]
	cp $09
	jr nz, .asm_46cbd
	ld a, $05
	ld [hl], a
	ld de, Frameset_689e2
	call SetObjectFramesetPtr
	ld a, 14
	ld [hli], a
	ret

.asm_46cbd
	ld de, Frameset_68946
	call SetObjectFramesetPtr
	xor a
	ld [hl], a
	ret
.Func_46cc6:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jp z, ObjState_StandingFall
	dec [hl]
	ret nz
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_46cdd
	ld de, Frameset_6893d
	call SetObjectFramesetPtr
	ret

.asm_46cdd
	ld de, Frameset_68946
	call SetObjectFramesetPtr
	ret
.Func_46ce4:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_46cf5
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_46cf5
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_STATE
	ld a, $2e
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_46d10
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $f6
	ld [hld], a
	ld de, Frameset_689c9
	jr .asm_46d1b
.asm_46d10
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $09
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld de, Frameset_689d2
.asm_46d1b
	call SetObjectFramesetPtr
	inc l
	ld a, $02
	ld [hl], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_FIRE_BOT
	ld [hld], a
	ld l, OBJ_FLAGS
	bit OBJFLAG_ON_SCREEN_F, [hl]
	ret z
	play_sfx SFX_073
	ret
.Func_46d38:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_46d49
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_46d49
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
	jr nz, .asm_46d64
	ld a, $11
	ld [wCurObjState], a
	ret

.asm_46d64
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_46daf
	ld a, [hl]
	and $0f
	sub $06
	jr nc, .asm_46d81
	call ProcessBlockOnLeft
	and $0f
	jr z, .asm_46d9f
.asm_46d81
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
.asm_46d9f
	ld a, [wCurObjVar1]
	and a
	jr z, .asm_46daa
	ld de, Frameset_689b3
	jr .asm_46de6
.asm_46daa
	ld de, Frameset_68969
	jr .asm_46df6
.asm_46daf
	ld a, [hl]
	and $0f
	add $05
	cp $10
	jr c, .asm_46dbf
	call ProcessBlockOnRight
	and $0f
	jr z, .asm_46ddd
.asm_46dbf
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
.asm_46ddd
	ld a, [wCurObjVar1]
	and a
	jr z, .asm_46df3
	ld de, Frameset_689be
.asm_46de6
	call SetObjectFramesetPtr
	ld a, 36
	ld [hli], a
	dec [hl]
	ld a, $5a
	ld [wCurObjState], a
	ret

.asm_46df3
	ld de, Frameset_68976
.asm_46df6
	call SetObjectFramesetPtr
	ld a, 61
	ld [hli], a
	ld a, $5b
	ld [wCurObjState], a
	ret
.Func_46e02:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_46e13
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_46e13
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $13
	ld [wCurObjState], a
	ret
.Func_46e1e:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_46e2f
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_46e2f
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $0f
	jr z, .asm_46e52
	dec [hl]
	jp nz, Func_3308
	ld l, OBJ_STATE
	ld a, $2e
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_46e4b
	ld de, Frameset_689c9
	call SetObjectFramesetPtr
	ret

.asm_46e4b
	ld de, Frameset_689d2
	call SetObjectFramesetPtr
	ret

.asm_46e52
	dec [hl]
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	jr c, .asm_46e64
	set OBJSUBFLAG_HDIR_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $09
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ret

.asm_46e64
	res OBJSUBFLAG_HDIR_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $f6
	ld [hld], a
	ret
.Func_46e6f:
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
	jr c, .asm_46e87
	ld de, Frameset_6893d
	jp SetObjectFramesetPtr
.asm_46e87
	ld de, Frameset_68946
	jp SetObjectFramesetPtr
.Func_46e8d:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_46e9e
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_46e9e
	ld a, [wTransformation]
	cp TRANSFORMATION_HOT_WARIO
	jr z, .asm_46eec
	ld c, $2a
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp $18
	jr c, .asm_46eb9
	cp $e8
	jr c, .asm_46eec
.asm_46eb9
	ld hl, wCurObjSubState
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
	cp $c0
	jr nc, .asm_46edb
	cp $40
	jr nc, .asm_46eec
	ld a, [hli]
	rlca
	jr c, .asm_46ed7
	ld de, Frameset_6894f
	jr .asm_46ee2
.asm_46ed7
	ld a, $13
	ld [hl], a
	ret

.asm_46edb
	ld a, [hli]
	rlca
	jr nc, .asm_46ed7
	ld de, Frameset_6895c
.asm_46ee2
	ld a, $2d
	ld [hl], a
	call SetObjectFramesetPtr
	ld a, 23
	ld [hli], a
	ret

.asm_46eec
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
	jr nz, .asm_46f07
	ld a, $11
	ld [wCurObjState], a
	ret

.asm_46f07
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_46f48
	ld a, [hl]
	and $0f
	sub $06
	jr nc, .asm_46f24
	call ProcessBlockOnLeft
	and $0f
	jr z, .asm_46f42
.asm_46f24
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
.asm_46f42
	ld a, $13
	ld [wCurObjState], a
	ret

.asm_46f48
	ld a, [hl]
	and $0f
	add $05
	cp $10
	jr c, .asm_46f58
	call ProcessBlockOnRight
	and $0f
	jr z, .asm_46f76
.asm_46f58
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
.asm_46f76
	ld a, $13
	ld [wCurObjState], a
	ret
.Func_46f7c:
	ld hl, wCurObjState
	ld a, $32
	ld [hld], a
	jr .asm_46f8a
.Func_46f84:
	ld hl, wCurObjState
	ld a, $33
	ld [hld], a
.asm_46f8a
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_68983, Frameset_68986
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
.Func_46fb2:
	ld hl, wCurObjState
	ld a, $46
	ld [hld], a
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_68989, Frameset_68992
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
.Func_46fd7:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, $0f
	ld [wCurObjState], a
	ret
.Func_46fe5:
	ld hl, wCurObjState
	ld a, $47
	ld [hld], a
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_68989, Frameset_68992
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
.Func_4700a:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, $0f
	ld [wCurObjState], a
	ret
.Func_47018:
	ld hl, wCurObjState
	ld a, $44
	ld [hld], a
	jr .asm_47026
.Func_47020:
	ld hl, wCurObjState
	ld a, $45
	ld [hld], a
.asm_47026
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_68989, Frameset_68992
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
.Func_4704d:
	ld a, $3f
	ld [wCurObjState], a
	ld a, $64
	ld [wCurObjStateDuration], a
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
.Func_4705c:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_47069
	ld a, $1c
	ld [wCurObjState], a
	ret

.asm_47069
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_32ea
	ld a, $10
	ld [wCurObjState], a
	ret
.Func_47076:
	ld hl, wCurObjState
	ld a, $40
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ld a, $07
	ld [wCurObjStateDuration], a
.Func_47084:
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_32f9
	ld a, $00
	ld [wCurObjState], a
	ret
.Func_47091:
	ld hl, wCurObjState
	ld a, $43
	ld [hld], a
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_689a5, Frameset_689ac
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
.Func_470ba:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_470cb
	ldh a, [rDIV]
	rra
	ld a, $04
	rla
	ld [wCurObjState], a
	ret

.asm_470cb
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $09
	jr z, .asm_470dd
	dec [hl]
	jp nz, Func_3308
	ld a, $01
	ld [wCurObjState], a
	ret

.asm_470dd
	dec [hl]
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	jr c, .asm_470e7
	set OBJSUBFLAG_HDIR_F, [hl]
	ret

.asm_470e7
	res OBJSUBFLAG_HDIR_F, [hl]
	ret
.Func_470ea:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $38
	jr .asm_470fc
.Func_470f4:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $39
.asm_470fc
	ld [hld], a
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_68989, Frameset_68992
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
.Func_47126:
	ld a, $3b
	ld [wCurObjState], a
	jr .asm_47132
.Func_4712d:
	ld a, $3c
	ld [wCurObjState], a
.asm_47132
	ld hl, wCurObjFrameDuration
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $02
	ld [wCurObjVar2], a
	ret
.Func_4713e:
	ld hl, wCurObjFrameDuration
	xor a
	ld [hli], a
	ld [hli], a
	ld l, OBJ_VAR_2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld de, Frameset_68969
	jr .asm_47160
.Func_47150:
	ld hl, wCurObjFrameDuration
	xor a
	ld [hli], a
	ld [hli], a
	ld l, OBJ_VAR_2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld de, Frameset_68976
.asm_47160
	call SetObjectFramesetPtr
	ld a, 61
	ld [hli], a
	ld a, $5b
	ld [wCurObjState], a
	ret
.Func_4716c:
	ld hl, wCurObjState
	ld a, $59
	ld [hld], a
	ld b, $02
	jr .asm_47192
.Func_47176:
	ld hl, wCurObjState
	ld a, $58
	ld [hld], a
	ld b, $02
	jr .asm_47192
.Func_47180:
	ld hl, wCurObjState
	ld a, $34
	ld [hld], a
	ld b, $02
	jr .asm_47192
.Func_4718a:
	ld hl, wCurObjState
	ld a, $35
	ld [hld], a
	ld b, $02
.asm_47192
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
	jr c, .asm_471aa
	ld de, Frameset_6899b
	jp SetObjectFramesetPtr
.asm_471aa
	ld de, Frameset_689a0
	jp SetObjectFramesetPtr
.Func_471b0:
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
.Func_471c3:
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

.Func_471d6:
	ld hl, wCurObjState
	ld a, $49
	ld [hld], a
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_68989, Frameset_68992
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_471f7:
	ld a, [wDirection]
	and a
	jp nz, Func_3353
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	jr .Func_47207
.Func_47207:
	ld hl, wCurObjState
	ld a, $48
	ld [hld], a
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_68989, Frameset_68992
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
.Func_47228:
	ld a, [wDirection]
	and a
	jp z, Func_3362
	ld hl, wCurObjSubState
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	jp .Func_471d6
.Func_47239:
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
