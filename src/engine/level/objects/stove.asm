StoveFunc: ; 4971c (12:571c)
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNK_5_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 10
	ld [hld], a
	ld a, -9
	ld [hld], a
	ld a, -9
	ld [hl], a
	ld de, Frameset_69615
	call SetObjectFramesetPtr
	xor a
	ld [wCurObjVar1], a
	ret

.set_fall:
	ld a, OBJSTATE_FALL
	ld [hld], a ; OBJ_STATE
	dec l
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld de, Frameset_69615
	jp SetObjectFramesetPtr

.Fall:
	ld bc, Data_605e0
	call Func_34b7

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
	ld a, OBJSTATE_LAND
	ld [wCurObjState], a
	ld a, [wCurObjVar1]
	and a
	ret z
	play_sfx SFX_063
	ld b, 24
	jp DoGroundShake

.Update:
	ld hl, wCurObjState
	ld a, [hl]
	cp OBJSTATE_FALL
	jr z, .Fall
	and a
	jr z, .set_fall
	cp OBJSTATE_LAND
	jp z, .Land
	cp OBJSTATE_ATTACKED_LEFT
	jr z, .State34
	cp OBJSTATE_ATTACKED_LEFT_START
	jr z, .AttackedLeftStart
	cp OBJSTATE_ATTACKED_RIGHT
	jr z, .AttackedRightStart
	cp OBJSTATE_ATTACKED_RIGHT_START
	jr z, .State05
	cp OBJSTATE_VANISH_TOUCH
	jr z, .VanishTouch
	cp OBJSTATE_3A
	jr z, .State3a
	jp .set_fall

.VanishTouch
	ld a, [wTransformation]
	and a
	jp nz, Func_3173
	ld a, OBJSTATE_3A
	ld [hl], a
	ld de, Frameset_69625
	call SetObjectFramesetPtr
	ld a, 44
	ld [hli], a ; OBJ_STATE_DURATION
	ret

.State3a:
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	jr .set_land

.AttackedLeftStart:
	ld a, OBJSTATE_ATTACKED_LEFT
	jr .asm_49813

.State34:
	ld l, OBJ_VAR_2
	ld a, [wGlobalCounter]
	and %111
	jr nz, .asm_497e8
	play_sfx SFX_078
	dec [hl]
	jr z, .set_land
.asm_497e8
	ld l, OBJ_Y_POS
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	add 10
	ldh [hXPosLo], a
	ld a, [hli]
	adc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jp z, Func_3069

.set_land
	ld a, OBJSTATE_LAND
	ld [wCurObjState], a
	ld de, Frameset_69615
	jp SetObjectFramesetPtr

.State05:
	ld a, OBJSTATE_ATTACKED_RIGHT
.asm_49813
	ld [hl], a ; OBJ_STATE
	ld a, $02
	ld [wCurObjVar2], a
	ld de, Frameset_69618
	jp SetObjectFramesetPtr

.AttackedRightStart:
	ld l, OBJ_VAR_2
	ld a, [wGlobalCounter]
	and %111
	jr nz, .asm_49833
	play_sfx SFX_078
	dec [hl]
	jr z, .set_land
.asm_49833
	ld l, OBJ_Y_POS
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	sub 9
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jp z, Func_305c
	jr .set_land

.Land:
	ld l, OBJ_Y_POS
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_3543
	cp $10
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ret z
	ld hl, wCurObjXPos
	ld a, [hli]
	sub 7
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_35a3
	and a
	ret nz
	ld hl, wCurObjXPos
	ld a, [hli]
	add 8
	ldh [hXPosLo], a
	ld a, [hli]
	adc 0
	ldh [hXPosHi], a
	call Func_35a3
	and a
	ret nz
	ld a, OBJSTATE_00
	ld [wCurObjState], a
	inc a ; $1
	ld [wCurObjVar1], a
	ret
; 0x4989e
