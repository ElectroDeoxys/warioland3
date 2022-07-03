StoveFunc: ; 4971c (12:571c)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	set OBJFLAG_UNK3_F, [hl]
	ld l, OBJ_UNK_1A
	res 5, [hl]
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
	ld [wCurObjUnk17], a
	ret

.set_fall:
	ld a, OBJACTION_FALL
	ld [hld], a ; OBJ_ACTION
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
	ld a, OBJACTION_LAND
	ld [wCurObjAction], a
	ld a, [wCurObjUnk17]
	and a
	ret z
	play_sfx SFX_063
	ld b, 24
	jp DoGroundShake

.Update:
	ld hl, wCurObjAction
	ld a, [hl]
	cp OBJACTION_FALL
	jr z, .Fall
	and a
	jr z, .set_fall
	cp OBJACTION_LAND
	jp z, .Land
	cp OBJACTION_34
	jr z, .Action34
	cp OBJACTION_04
	jr z, .Action04
	cp OBJACTION_35
	jr z, .Action35
	cp OBJACTION_05
	jr z, .Action05
	cp OBJACTION_VANISH
	jr z, .asm_497b6
	cp OBJACTION_3A
	jr z, .Action3a
	jp .set_fall

.asm_497b6
	ld a, [wTransformation]
	and a
	jp nz, Func_3173
	ld a, OBJACTION_3A
	ld [hl], a
	ld de, Frameset_69625
	call SetObjectFramesetPtr
	ld a, 44
	ld [hli], a ; OBJ_ACTION_DURATION
	ret

.Action3a:
	ld l, OBJ_ACTION_DURATION
	dec [hl]
	ret nz
	jr .set_land

.Action04:
	ld a, OBJACTION_34
	jr .asm_49813

.Action34:
	ld l, OBJ_UNK_18
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
	ld a, OBJACTION_LAND
	ld [wCurObjAction], a
	ld de, Frameset_69615
	jp SetObjectFramesetPtr

.Action05:
	ld a, OBJACTION_35
.asm_49813
	ld [hl], a ; OBJ_ACTION
	ld a, $02
	ld [wCurObjUnk18], a
	ld de, Frameset_69618
	jp SetObjectFramesetPtr

.Action35:
	ld l, OBJ_UNK_18
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
	ld a, OBJACTION_00
	ld [wCurObjAction], a
	inc a ; $1
	ld [wCurObjUnk17], a
	ret
; 0x4989e
