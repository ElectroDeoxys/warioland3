	INCROM $40000, $40040

Func_40040: ; 40040 (10:4040)
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(Func_4004e)
	ld [hld], a
	ld a, LOW(Func_4004e)
	ld [hld], a
	xor a
	ld [wCurObjUnk17], a
	ret
; 0x4004e

Func_4004e: ; 4004e (10:404e)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK04_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(Func_40069)
	ld [hld], a
	ld a, LOW(Func_40069)
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld a, [wca3b]
	rra
	jp c, Func_40165 ; night
	jp Func_4021b ; day
; 0x40069

Func_40069: ; 40069 (10:4069)
	ld a, [wCurObjAction]
	jumptable

	dw Func_4021b ; OBJ_ACTION_00
	dw $42d8 ; OBJ_ACTION_01
	dw $43c2 ; OBJ_ACTION_02
	dw $43d6 ; OBJ_ACTION_03
	dw $45fc ; OBJ_ACTION_04
	dw $4606 ; OBJ_ACTION_05
	dw $4620 ; OBJ_ACTION_06
	dw $4633 ; OBJ_ACTION_07
	dw $456b ; OBJ_ACTION_08
	dw $4575 ; OBJ_ACTION_09
	dw $3182 ; OBJ_ACTION_0A
	dw $45aa ; OBJ_ACTION_0B
	dw $45b1 ; OBJ_ACTION_0C
	dw Func_4021b ; OBJ_ACTION_0D
	dw Func_4021b ; OBJ_ACTION_0E
	dw $44a2 ; OBJ_ACTION_0F
	dw $44cb ; OBJ_ACTION_10
	dw Func_4025d ; OBJ_ACTION_11
	dw $46af ; OBJ_ACTION_12
	dw $44eb ; OBJ_ACTION_13
	dw $446a ; OBJ_ACTION_14
	dw $4472 ; OBJ_ACTION_15
	dw $4404 ; OBJ_ACTION_16
	dw $4437 ; OBJ_ACTION_17
	dw $467a ; OBJ_ACTION_18
	dw $4646 ; OBJ_ACTION_19
	dw $3263 ; OBJ_ACTION_1A
	dw $3272 ; OBJ_ACTION_1B
	dw $3281 ; OBJ_ACTION_1C
	dw Func_4021b ; OBJ_ACTION_1D
	dw Func_4021b ; OBJ_ACTION_1E
	dw Func_4021b ; OBJ_ACTION_1F
	dw $3191 ; OBJ_ACTION_20
	dw $31af ; OBJ_ACTION_21
	dw $31cd ; OBJ_ACTION_22
	dw $31eb ; OBJ_ACTION_23
	dw $3209 ; OBJ_ACTION_24
	dw $3227 ; OBJ_ACTION_25
	dw $3245 ; OBJ_ACTION_26
	dw $3254 ; OBJ_ACTION_27
	dw $45f2 ; OBJ_ACTION_28
	dw $45e8 ; OBJ_ACTION_29
	dw Func_4021b ; OBJ_ACTION_2A
	dw Func_4021b ; OBJ_ACTION_2B
	dw Func_4021b ; OBJ_ACTION_2C
	dw Func_40182 ; OBJ_ACTION_2D
	dw $42aa ; OBJ_ACTION_2E
	dw $4213 ; OBJ_ACTION_2F
	dw $3290 ; OBJ_ACTION_30
	dw $430f ; OBJ_ACTION_31
	dw $33da ; OBJ_ACTION_32
	dw $33e9 ; OBJ_ACTION_33
	dw $3326 ; OBJ_ACTION_34
	dw $3317 ; OBJ_ACTION_35
	dw $3335 ; OBJ_ACTION_36
	dw $3344 ; OBJ_ACTION_37
	dw $31fa ; OBJ_ACTION_38
	dw $31dc ; OBJ_ACTION_39
	dw Func_4021b ; OBJ_ACTION_3A
	dw $45c2 ; OBJ_ACTION_3B
	dw $45d5 ; OBJ_ACTION_3C
	dw Func_4021b ; OBJ_ACTION_3D
	dw Func_4021b ; OBJ_ACTION_3E
	dw $44b1 ; OBJ_ACTION_3F
	dw Func_404d9 ; OBJ_ACTION_40
	dw Func_329f ; OBJ_ACTION_41
	dw $3371 ; OBJ_ACTION_42
	dw $450a ; OBJ_ACTION_43
	dw $32cc ; OBJ_ACTION_44
	dw $32db ; OBJ_ACTION_45
	dw $4429 ; OBJ_ACTION_46
	dw $445c ; OBJ_ACTION_47
	dw $469e ; OBJ_ACTION_48
	dw $466a ; OBJ_ACTION_49
	dw $3380 ; OBJ_ACTION_4A
	dw $338f ; OBJ_ACTION_4B
	dw $412d ; OBJ_ACTION_4C
	dw $4149 ; OBJ_ACTION_4D
	dw $339e ; OBJ_ACTION_4E
	dw $33ad ; OBJ_ACTION_4F
	dw $31a0 ; OBJ_ACTION_50
	dw $31be ; OBJ_ACTION_51
	dw $31dc ; OBJ_ACTION_52
	dw $31fa ; OBJ_ACTION_53
	dw $3218 ; OBJ_ACTION_54
	dw $3236 ; OBJ_ACTION_55
	dw $32cc ; OBJ_ACTION_56
	dw $32db ; OBJ_ACTION_57
	dw $33f8 ; OBJ_ACTION_58
	dw $3407 ; OBJ_ACTION_59
	dw Func_4021b ; OBJ_ACTION_5A
	dw Func_4021b ; OBJ_ACTION_5B
	dw Func_4021b ; OBJ_ACTION_5C
	dw Func_4021b ; OBJ_ACTION_5D
	dw $33bc ; OBJ_ACTION_5E
	dw $33cb ; OBJ_ACTION_5F
	dw $1b21 ; OBJ_ACTION_60
	dw $3ed1 ; OBJ_ACTION_61
	dw $325e ; OBJ_ACTION_62
	dw $073a ; OBJ_ACTION_63
	dw $0938 ; OBJ_ACTION_64
; 0x40137

	INCROM $40137, $40165

Func_40165: ; 40165 (10:4165)
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a

	ld l, OBJ_ACTION
	ld a, OBJ_ACTION_2D
	ld [hld], a

	ld de, $4234
	call Func_30f0

	ld l, OBJ_UNK_0C
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a ; OBJ_UNK_0B
	ret
; 0x40182

Func_40182: ; 40182 (10:4182)
	ld hl, wCurObjUnk1a
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .on_left
; on right
	set 7, [hl]
	jr .asm_40199
.on_left
	res 7, [hl]

.asm_40199
	ld c, $2a
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp $20
	jr c, .asm_401ad
	cp -$20
	jr c, .check_shake
.asm_401ad
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
	cp $e0
	jr nc, .asm_401f5
	cp $20
	jr c, .asm_401f5

.check_shake
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_401d0
	ldh a, [rDIV]
	rra
	ld a, OBJ_ACTION_08 >> 1
	rla ; either OBJ_ACTION_08 or OBJ_ACTION_09
	ld [wCurObjAction], a
	ret

.asm_401d0
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
	jr nz, .asm_401eb
	ld a, OBJ_ACTION_11
	ld [wCurObjAction], a
	ret

.asm_401eb
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ret

.asm_401f5
	ld a, [hli] ; OBJ_UNK_1A
	rlca
	ld a, OBJ_ACTION_2F
	ld [hl], a ; OBJ_ACTION
	jr c, .asm_40201
	ld de, $427c
	jr .asm_4020c
.asm_40201
	ld l, OBJ_UNK_0C
	ld a, $09
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld de, $4287
.asm_4020c
	call Func_30f0
	ld a, $20
	ld [hli], a ; OBJ_UNK_16
	ret
; 0x40213

	INCROM $40213, $4021b

Func_4021b: ; 4021b (10:421b)
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a

	ld l, OBJ_ACTION
	ld a, OBJ_ACTION_30
	ld [hld], a

	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .on_left
; on right
	res 7, [hl] ; OBJ_UNK_1A
	dec l
	xor a
	ld [hld], a ; OBJ_UNK_19

	ld l, OBJ_UNK_0C
	ld a, $06
	ld [hld], a
	ld a, $f6
	ld [hld], a ; OBJ_UNK_0B

	ld de, $41d2
	jp Func_30f0

.on_left
	set 7, [hl] ; OBJ_UNK_1A
	dec l
	xor a
	ld [hld], a ; OBJ_UNK_19

	ld l, OBJ_UNK_0C
	ld a, $09
	ld [hld], a
	ld a, $f9
	ld [hld], a ; OBJ_UNK_0B

	ld de, $41db
	jp Func_30f0
; 0x4025d

Func_4025d: ; 4025d (10:425d)
	ld hl, wCurObjAction
	ld a, OBJ_ACTION_41
	ld [hld], a
	ld a, [hld] ; OBJ_UNK_1A
	rlca
	jr c, .asm_40270
	xor a
	ld [hld], a ; OBJ_UNK_19
	ld de, $41d2
	call Func_30f0
	ret
.asm_40270
	xor a
	ld [hld], a ; OBJ_UNK_19
	ld de, $41db
	call Func_30f0
	ret
; 0x40279

	INCROM $40279, $404d9

Func_404d9: ; 404d9 (10:44d9)
	ld hl, wCurObjUnk16
	dec [hl]
	jp nz, Func_32f9
	ld a, OBJ_ACTION_00 ; should be xor a
	ld [wCurObjAction], a
	ld a, $ff
	ld [wCurObjUnk17], a
	ret
; 0x404eb

	INCROM $404eb, $406c4

Func_406c4: ; 406c4 (10:46c4)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK04_F, [hl]

	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $47
	ld [hld], a
	ld a, $43
	ld [hld], a

	ld l, OBJ_UNK_1A
	res 5, [hl]

	ld de, $4319
	call Func_30f0
	inc l
	ld a, [wCurObjYPos + 0]
	ld [hli], a ; OBJ_UNK_17
	ld a, [wCurObjYPos + 1]
	ld [hli], a ; OBJ_UNK_18

	ld l, OBJ_UNK_0C
	ld a, $05
	ld [hld], a
	ld a, $eb
	ld [hld], a ; OBJ_UNK_0B
	ld a, $04
	ld [hl], a ; OBJ_UNK_0A
	ret
; 0x406f0

Func_406f0: ; 406f0 (10:46f0)
	ld a, [wGroundShakeCounter]
	cp $10
	jp nc, Func_40743.asm_4076e
	ld l, OBJ_UNK_17
	ld c, [hl]
	ld a, [wCurObjYPos + 0]
	cp c
	jr nz, .asm_40709
	inc l
	ld b, [hl]
	ld a, [wCurObjYPos + 1]
	cp b
	jr z, Func_40734
.asm_40709
	ld l, OBJ_FLAGS
	bit OBJFLAG_UNK05_F, [hl]
	jr z, .asm_40721
	res OBJFLAG_UNK05_F, [hl]
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld b, $01
	call SubYOffset
	call Func_1197
	jp Func_30e6
.asm_40721
	ld l, OBJ_UNK_14
	ld a, [hl]
	and a
	jr z, .asm_40728
	dec [hl]
.asm_40728
	jp Func_30e6
; 0x4072b

Func_4072b: ; 4072b (10:472b)
	ld l, OBJ_FLAGS
	bit OBJFLAG_UNK05_F, [hl]
	jr z, Func_40734
	res OBJFLAG_UNK05_F, [hl]
	ret
; 0x40734

Func_40734: ; 40734 (10:4734)
	ld de, $4319
	call Func_30f0
	ld l, OBJ_FLAGS
	res OBJFLAG_UNK03_F, [hl]
	xor a
	ld [wCurObjAction], a
	ret
; 0x40743

Func_40743: ; 40743 (10:4743)
	ld hl, wCurObjAction
	ld a, [hl]
	and a
	jr z, .asm_40767
	cp OBJ_ACTION_2F
	jr z, Func_406f0
	cp OBJ_ACTION_2E
	jr z, Func_4072b
	cp OBJ_ACTION_34
	jr z, .asm_407b8
	cp OBJ_ACTION_0A
	jr z, .asm_407bf
	cp OBJ_ACTION_3A
	jp z, .asm_407d4
	and $fe
	cp OBJ_ACTION_04
	jr z, .asm_407ab
	jr Func_40734

.asm_40767
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_4077b

.asm_4076e
	ld a, OBJ_ACTION_34
	ld [hl], a ; OBJ_ACTION

	ld de, $4348
	call Func_30f0
	ld a, $20
	ld [hli], a ; OBJ_UNK_16
	ret

.asm_4077b
	ld l, OBJ_UNK_17
	ld c, [hl]
	ld a, [wCurObjYPos + 0]
	cp c
	jr nz, .asm_4078c
	inc l
	ld b, [hl] ; OBJ_UNK_18
	ld a, [wCurObjYPos + 1]
	cp b
	jr z, .asm_4079a
.asm_4078c
	ld l, OBJ_ACTION
	ld a, OBJ_ACTION_2F
	ld [hld], a
	res 7, [hl] ; OBJ_UNK_16
	ld de, $4336
	call Func_30f0
	ret
.asm_4079a
	ld l, OBJ_FLAGS
	bit OBJFLAG_UNK05_F, [hl]
	ret z
	ld a, OBJ_ACTION_2E
	ld [wCurObjAction], a
	ld de, $4343
	call Func_30f0
	ret

.asm_407ab
	ld a, OBJ_ACTION_34
	ld [hl], a ; OBJ_ACTION
	ld de, $4351
	call Func_30f0
	ld a, $10
	ld [hli], a ; OBJ_UNK_16
	ret

.asm_407b8
	ld l, OBJ_UNK_16
	dec [hl]
	ret nz
	jp Func_40734

.asm_407bf
	dec l
	ld a, [hli] ; OBJ_UNK_1A
	rlca
	jr c, .asm_4081a
	ld a, OBJ_ACTION_3A
	ld [hld], a ; OBJ_ACTION
	dec l
	xor a
	ld [hl], a ; OBJ_UNK_19
	ld de, $4348
	call Func_30f0
	ld a, $30
	ld [hli], a ; OBJ_UNK_16
	ret

.asm_407d4
	ld l, OBJ_UNK_16
	dec [hl]
	jp z, Func_40734
	ld l, OBJ_UNK_1A
	ld a, [hl]
	rlca
	ret c
	ld a, [w1d14a]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jr nc, .asm_407eb

	ld bc, $43f0
	jr .asm_407ee
.asm_407eb
	ld bc, $4490
.asm_407ee
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

	ld a, [w1d14a]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jr nc, .asm_4081a
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_UNK_1A
	set 7, [hl]
	ret

.asm_4081a
	ld a, $08
	ld [wCurObjUnk18], a
	call Func_305c
	jp Func_34e5
; 0x40825

Func_40825: ; 40825 (10:4825)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK04_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $48
	ld [hld], a
	ld a, $95
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_UNK_0C
	ld a, $fe
	ld [hld], a
	ld a, $f0
	ld [hld], a
	ld a, $fc
	ld [hl], a
	ld l, OBJ_UNK_17
	ld a, [wCurObjYPos + 0]
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	ld [hli], a
	ld a, $04
	ld [hl], a
	jp Func_40a41
; 0x40851

	INCROM $40851, $40a41

Func_40a41: ; 40a41 (10:4a41)
	ld hl, wCurObjUnk1a
	ld a, [hl]
	and $f0
	or $02
	ld [hld], a
	ld de, $42b7
	call Func_30f0
	ld a, $40
	ld [hli], a
	ret
; 0x40a54

	INCROM $40a54, $43a48
