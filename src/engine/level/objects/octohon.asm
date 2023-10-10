SmallOctohonFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_4a4d4)
	ld [hld], a
	ld a, LOW(.Func_4a4d4)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $00
	ld [hld], a
	ld a, $00
	ld [hld], a
	ld a, $00
	ld [hl], a
	ret

.Func_4a4d4:
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_4a4e9
	ld de, Frameset_69b2f
	ld b, $00
	jr .asm_4a4ee
.asm_4a4e9
	ld de, Frameset_69b38
	ld b, $01
.asm_4a4ee
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_4a50f)
	ld [hld], a
	ld a, LOW(.Func_4a50f)
	ld [hld], a
.asm_4a4f7
	ld hl, wCurObjStateDuration
	ld a, $ac
	ld [hli], a
	ld a, b
	ld [hli], a
	xor a
	ld [hl], a
	ldh a, [rDIV]
	rra
	jr nc, .asm_4a50c
	ld l, OBJ_FLAGS
	ld a, [hl]
	xor $80
	ld [hl], a
.asm_4a50c
	jp SetObjectFramesetPtr

.Func_4a50f:
	ld a, $81
	ld [wCurObjAction], a
	ld hl, wCurObjVar1
	ld a, [hl]
	and a
	jr z, .asm_4a521
	cp $01
	jr z, .asm_4a53f
	xor a
	ld [hl], a
.asm_4a521
	dec l
	ld a, [hl]
	and a
	jr z, .asm_4a531
	dec [hl]
	jr nz, .asm_4a55d
	ld de, Frameset_69b41
	call SetObjectFramesetPtr
	jr .asm_4a55d
.asm_4a531
	ld l, OBJ_VAR_2
	ld a, [hl]
	cp $ee
	jr nz, .asm_4a55d
	ld de, Frameset_69b38
	ld b, $01
	jr .asm_4a4f7
.asm_4a53f
	dec l
	ld a, [hl]
	and a
	jr z, .asm_4a54f
	dec [hl]
	jr nz, .asm_4a55d
	ld de, Frameset_69b4c
	call SetObjectFramesetPtr
	jr .asm_4a55d
.asm_4a54f
	ld l, OBJ_VAR_2
	ld a, [hl]
	cp $ee
	jr nz, .asm_4a55d
	ld de, Frameset_69b2f
	ld b, $00
	jr .asm_4a4f7
.asm_4a55d
	ld a, [wCurObjVar2]
	and a
	jr z, .asm_4a57d
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr z, .asm_4a57d
	ld hl, wCurObjVar2
	inc [hl]
	ret

.asm_4a57d
	ld de, Data_4a5a9
	ld hl, wCurObjVar2
	ld a, [hl]
	ld b, d
	ld c, e
	add c
	ld c, a
	jr nc, .asm_4a58b
	inc b
.asm_4a58b
	ld a, [bc]
	cp $80
	jr nz, .asm_4a595
	xor a
	ld [hl], a
	ld b, d
	ld c, e
	ld a, [bc]
.asm_4a595
	inc [hl]
	ld b, a
	dec l
	ld a, [hl]
	and a
	ld l, OBJ_X_POS
	ld a, [hl]
	jr nz, .asm_4a5a4
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret

.asm_4a5a4
	add b
	ld [hli], a
	ret nc
	inc [hl]
	ret

Data_4a5a9:
	db $02, $01, $01, $01, $01, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01
	db $01, $00, $01, $00, $00, $01, $00, $00
	db $01, $00, $01, $00, $01, $00, $01, $00
	db $00, $01, $00, $01, $00, $01, $00, $00
	db $01, $00, $00, $01, $00, $00, $01, $00
	db $00, $01, $00, $00, $00, $01, $00, $00
	db $00, $01, $00, $00, $00, $00, $01, $00
	db $00, $00, $00, $01, $00, $00, $00, $00
	db $01, $00, $00, $00, $00, $00, $01, $00
	db $00, $00, $00, $00, $00, $01, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $01, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $01, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $01, $01, $01, $01, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01
	db $01, $00, $01, $00, $00, $01, $00, $00
	db $01, $00, $01, $00, $01, $00, $01, $00
	db $00, $01, $00, $01, $00, $01, $00, $00
	db $01, $00, $00, $01, $00, $00, $01, $00
	db $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00
	db $00, $01, $00, $00, $01, $00, $00, $01
	db $00, $00, $00, $01, $00, $00, $00, $01
	db $00, $00, $00, $01, $00, $00, $00, $00
	db $01, $00, $00, $00, $00, $01, $00, $00
	db $00, $00, $00, $01, $00, $00, $00, $00
	db $80
	
BigOctohonFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_4a6b9)
	ld [hld], a
	ld a, LOW(.Func_4a6b9)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $08
	ld [hld], a
	ld a, $f7
	ld [hld], a
	ld a, $08
	ld [hl], a
	ret

.Func_4a6b9:
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	ld hl, wCurObjSubState
	jr c, .asm_4a6d1
	res OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_69b57
	jr .asm_4a6d6
.asm_4a6d1
	set OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_69b60
.asm_4a6d6
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_4a729)
	ld [hld], a
	ld a, LOW(.Func_4a729)
	ld [hld], a
.asm_4a6df
	ld hl, wCurObjStateDuration
	ld a, $ac
	ld [hli], a
	xor a
	ld [hli], a
	ld [hl], a
	jp SetObjectFramesetPtr

.asm_4a6eb
	ld de, Frameset_69b69
	jr .asm_4a6f3
.asm_4a6f0
	ld de, Frameset_69b74
.asm_4a6f3
	xor a
	ld [hl], a
	call SetObjectFramesetPtr
	ld a, $43
	ld [hli], a
	ld a, $04
	ld [hli], a
	xor a
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and $80
	or $06
	ld [hld], a
	play_sfx SFX_08D
	ret

.asm_4a711
	xor a
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_4a71c
	ld de, Frameset_69b7f
	jr .asm_4a71f
.asm_4a71c
	ld de, Frameset_69b88
.asm_4a71f
	call SetObjectFramesetPtr
	ld a, $3c
	ld [hli], a
	ld a, $03
	ld [hl], a
	ret

.Func_4a729:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_4a73f
	cp $0b
	jr z, .asm_4a6eb
	cp $0c
	jr z, .asm_4a6f0
	cp $0a
	jp z, Func_3173
	jr .asm_4a711
.asm_4a73f
	ld l, OBJ_VAR_1
	ld a, [hl]
	and a
	jr z, .asm_4a7c2
	cp $01
	jr z, .asm_4a77f
	cp $02
	jr z, .asm_4a774
	cp $03
	jr z, .asm_4a756
	cp $04
	jr z, .asm_4a76c
	ret
.asm_4a756
	dec l
	dec [hl]
	jr nz, .asm_4a78b
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_4a766
	ld de, Frameset_69b57
	jp .asm_4a6df
.asm_4a766
	ld de, Frameset_69b60
	jp .asm_4a6df
.asm_4a76c
	ld bc, Data_60d50
	call ApplyObjXMovement
	ld l, OBJ_VAR_1
.asm_4a774
	ld a, $81
	ld [wCurObjAction], a
	dec l
	dec [hl]
	ret nz
	jp .asm_4a860
.asm_4a77f
	dec l
	ld a, [hl]
	and a
	jr z, .asm_4a786
	dec [hl]
	ret
.asm_4a786
	ld a, $02
	ld [wCurObjFrameDuration], a
.asm_4a78b
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_4a7ae
	ld a, [hli]
	sub $06
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectLeft_Fast
	jp .asm_4a6eb
.asm_4a7ae
	ld a, [hli]
	add $06
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveObjectRight_Fast
	jp .asm_4a6f0
.asm_4a7c2
	dec l
	ld a, [hl]
	and a
	jp z, .asm_4a859
	dec [hl]
	jr z, .asm_4a812
	ld c, $2a
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp $14
	jr c, .asm_4a7df
	cp $ec
	jr c, .asm_4a823
.asm_4a7df
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
	ld hl, wCurObjSubState
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr nz, .asm_4a7f9
	cp $40
	jr nc, .asm_4a823
	ld de, Frameset_69bc3
	jr .asm_4a800
.asm_4a7f9
	cp $c0
	jr c, .asm_4a823
	ld de, Frameset_69bce
.asm_4a800
	call SetObjectFramesetPtr
	ld a, $24
	ld [hli], a
	ld a, $01
	ld [hl], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and $80
	or $49
	ld [hld], a
	ret
.asm_4a812
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_4a81d
	ld de, Frameset_69b69
	jr .asm_4a820
.asm_4a81d
	ld de, Frameset_69b74
.asm_4a820
	call SetObjectFramesetPtr
.asm_4a823
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_4a844
	ld a, [hli]
	sub $06
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr z, .asm_4a875
	jr .asm_4a854
.asm_4a844
	ld a, [hli]
	add $06
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr z, .asm_4a875
.asm_4a854
	ld hl, wCurObjVar2
	inc [hl]
	ret

.asm_4a859
	ld l, OBJ_VAR_2
	ld a, [hl]
	cp $ee
	jr nz, .asm_4a823
.asm_4a860
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor $80
	ld [hl], a
	rlca
	jr c, .asm_4a86f
	ld de, Frameset_69b57
	jp .asm_4a6df
.asm_4a86f
	ld de, Frameset_69b60
	jp .asm_4a6df
.asm_4a875
	ld de, Data_4a5a9
	ld hl, wCurObjVar2
	ld a, [hl]
	ld b, d
	ld c, e
	add c
	ld c, a
	jr nc, .asm_4a883
	inc b
.asm_4a883
	ld a, [bc]
	cp $80
	jr nz, .asm_4a88d
	xor a
	ld [hl], a
	ld b, d
	ld c, e
	ld a, [bc]
.asm_4a88d
	inc [hl]
	ld b, a
	ld a, [wCurObjSubState]
	rlca
	ld l, OBJ_X_POS
	ld a, [hl]
	jr c, .asm_4a89d
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret
.asm_4a89d
	add b
	ld [hli], a
	ret nc
	inc [hl]
	ret
