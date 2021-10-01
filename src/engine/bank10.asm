; sequence of y-offsets used in Func_42725
Data_40000: ; 40000 (10:4000)
	db  0,  0,  0,  0,  0,  0,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1
	db  0,  0,  0,  0,  0,  0, -1,  0, -1,  0, -1,  0, -1,  0, -1,  0
	db  0,  0,  0,  0,  0,  0,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1
	db  0,  0,  0,  0,  0,  0, -1,  0, -1,  0, -1,  0, -1,  0, -1, $80
; 0x40040

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
	res OBJFLAG_UNK4_F, [hl]
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
	dw Func_402d8 ; OBJ_ACTION_01
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
	dw Func_402aa ; OBJ_ACTION_2E
	dw $4213 ; OBJ_ACTION_2F
	dw Func_3290 ; OBJ_ACTION_30
	dw Func_4030f ; OBJ_ACTION_31
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

Func_40279: ; 40279 (10:4279)
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_FRONT_STING
	ld [hld], a
	ld l, OBJ_ACTION
	ld a, OBJ_ACTION_2E
	ld [hld], a
	ld a, [hld] ; OBJ_UNK_1A
	rlca
	jr c, .asm_40298
	ld l, OBJ_UNK_0C
	ld a, $06
	ld [hld], a
	ld a, $f6
	ld [hld], a
	ld de, $4208
	jr .asm_402a3
.asm_40298
	ld l, OBJ_UNK_0C
	ld a, $09
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld de, $4213
.asm_402a3
	call Func_30f0
	ld a, $20
	ld [hli], a
	ret
; 0x402aa

Func_402aa: ; 402aa (10:42aa)
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_402bb
	ldh a, [rDIV]
	rra
	ld a, OBJ_ACTION_08 >> 1
	rla ; either OBJ_ACTION_08 or OBJ_ACTION_09
	ld [wCurObjAction], a
	ret
.asm_402bb
	ld hl, wCurObjUnk16
	dec [hl]
	ret nz
	inc l
	xor a
	ld [hl], a ; OBJ_UNK_17
	ld l, OBJ_ACTION
	ld a, OBJ_ACTION_31
	ld [hld], a
	ld a, [hld] ; OBJ_UNK_1A
	rlca
	jr c, .asm_402d1
	ld de, $41d2
	jr .asm_402d4
.asm_402d1
	ld de, $41db
.asm_402d4
	call Func_30f0
	ret
; 0x402d8

Func_402d8: ; 402d8 (10:42d8)
	ld a, [wCurObjUnk17]
	inc a
	jr z, Func_40279
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ld l, OBJ_ACTION
	ld a, OBJ_ACTION_31
	ld [hld], a
	ld a, [hld] ; OBJ_UNK_1A
	rlca
	jr c, .asm_402fd
	ld l, OBJ_UNK_0C
	ld a, $06
	ld [hld], a
	ld a, $f6
	ld [hld], a
	ld de, $41d2
	jr .asm_40308
.asm_402fd
	ld l, OBJ_UNK_0C
	ld a, $09
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld de, $41db
.asm_40308
	call Func_30f0
	ld a, $0a
	ld [hli], a
	ret
; 0x4030f

Func_4030f: ; 4030f (10:430f)
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_40320
	ldh a, [rDIV]
	rra
	ld a, OBJ_ACTION_08 >> 1
	rla ; either OBJ_ACTION_08 or OBJ_ACTION_09
	ld [wCurObjAction], a
	ret
.asm_40320
	ld hl, wCurObjUnk16
	ld a, [hl]
	and a
	jr z, .asm_40332
	dec [hl]
	ret nz
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_FRONT_STING
	ld [hld], a
	ret
.asm_40332
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
	jr nz, .asm_4034d
	ld a, OBJ_ACTION_11
	ld [wCurObjAction], a
	ret
.asm_4034d
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ld a, [wCurObjUnk1a]
	rlca
	jr c, .asm_4038e
	ld a, [hl]
	and $0f
	sub $0a
	jr nc, .asm_4036a
	call Func_355b
	and $0f
	jr z, .asm_40388
.asm_4036a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	sub $0a
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveCurObjLeft
.asm_40388
	ld a, OBJ_ACTION_13
	ld [wCurObjAction], a
	ret
.asm_4038e
	ld a, [hl]
	and $0f
	add $09
	cp $10
	jr c, .asm_4039e
	call Func_3573
	and $0f
	jr z, .asm_403bc
.asm_4039e
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	add $09
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, MoveCurObjRight
.asm_403bc
	ld a, OBJ_ACTION_13
	ld [wCurObjAction], a
	ret
; 0x403c2

	INCROM $403c2, $404d9

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
	res OBJFLAG_UNK4_F, [hl]

	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(Func_40743)
	ld [hld], a
	ld a, LOW(Func_40743)
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
	bit OBJFLAG_UNK5_F, [hl]
	jr z, .asm_40721
	res OBJFLAG_UNK5_F, [hl]
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
	bit OBJFLAG_UNK5_F, [hl]
	jr z, Func_40734
	res OBJFLAG_UNK5_F, [hl]
	ret
; 0x40734

Func_40734: ; 40734 (10:4734)
	ld de, $4319
	call Func_30f0
	ld l, OBJ_FLAGS
	res OBJFLAG_UNK3_F, [hl]
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
	bit OBJFLAG_UNK5_F, [hl]
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
	res OBJFLAG_UNK4_F, [hl]
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
	ld [hli], a ; OBJ_UNK_16
	ret
; 0x40a54

	INCROM $40a54, $40b8c

Func_40b8c: ; 40b8c (10:4b8c)
	ld hl, wCurObjUpdateFunction + 1
	ld a, $4b
	ld [hld], a
	ld a, $14
	ld [hld], a
	ld de, $4369
	call Func_30f0
	jr Func_40bb8

Func_40b9d: ; 40b9d (10:4b9d)
	ld hl, wCurObjUpdateFunction + 1
	ld a, $4b
	ld [hld], a
	ld a, $a8
	ld [hld], a
	jr Func_40bb2

	ret ; stray ret

Func_40ba9: ; 40ba9 (10:4ba9)
	ld hl, wCurObjUpdateFunction + 1
	ld a, $4b
	ld [hld], a
	ld a, $d1
	ld [hld], a
;	fallthrough

Func_40bb2: ; 40bb2 (10:4bb2)
	ld de, $4360
	call Func_30f0
;	fallthrough

Func_40bb8: ; 40bb8 (10:4bb8)
	xor a
	ld [hl], a ; OBJ_UNK_16
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	set OBJFLAG_UNK3_F, [hl]
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_UNK_0C
	ld a, $06
	ld [hld], a
	ld a, $f9
	ld [hld], a ; OBJ_UNK_0B
	ld a, $fd
	ld [hl], a ; OBJ_UNK_0A
	ret
; 0x40bd1

	INCROM $40bd1, $40ca1

Func_40ca1: ; 40ca1 (10:4ca1)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	set OBJFLAG_UNK3_F, [hl]
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $4c
	ld [hld], a
	ld a, $c2
	ld [hld], a
	ld de, $437a
	call Func_30f0
	ld a, $1e
	ld [hli], a ; OBJ_UNK_16
	ld a, [wGlobalCounter]
	ld [hl], a ; OBJ_UNK_17
	ret
; 0x40cc2

	INCROM $40cc2, $40e12

Func_40e12: ; 40e12 (10:4e12)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $4e
	ld [hld], a
	ld a, $31
	ld [hld], a
	ld l, OBJ_UNK_0C
	ld a, $07
	ld [hld], a
	ld a, $f8
	ld [hld], a ; OBJ_UNK_0B
	ld a, $fc
	ld [hl], a ; OBJ_UNK_0A
	jp Func_40f7e
; 0x40e31

	INCROM $40e31, $40f7e

Func_40f7e: ; 40f7e (10:4f7e)
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_0F
	ld [hld], a
	ld l, OBJ_ACTION
	ld a, OBJ_ACTION_30
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_UNK_19
	ld de, $43e1
	call Func_30f0
	ret
; 0x40f96

	INCROM $40f96, $41357

Func_41357: ; 41357 (10:5357)
	ld hl, wCurObjUpdateFunction + 1
	ld a, $53
	ld [hld], a
	ld a, $61
	ld [hld], a
	ret
; 0x41361

	INCROM $41361, $41a7c

Func_41a7c: ; 41a7c (10:5a7c)
	ld hl, wCurObjUpdateFunction + 1
	ld a, $5a
	ld [hld], a
	ld a, $86
	ld [hld], a
	ret
; 0x41a86

	INCROM $41a86, $42170

Func_42170: ; 42170 (10:6170)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $62
	ld [hld], a
	ld a, $18
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_UNK_0C
	ld a, $fd
	ld [hld], a
	ld a, $f3
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld l, $17
	ld a, [wCurObjYPos + 0]
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	ld [hli], a
	jp Func_42432
; 0x42199

	INCROM $42199, $42432

Func_42432: ; 42432 (10:6432)
	ld hl, wCurObjUnk1a
	ld a, [hl]
	and $f0
	or $01
	ld [hld], a
	xor a
	ld [hl], a
	ld de, $4f0b
	call Func_30f0
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_18
	ld [hld], a
	ret
; 0x4244c

	INCROM $4244c, $42478

Func_42478: ; 42478 (10:6478)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $64
	ld [hld], a
	ld a, $ea
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_UNK_0C
	ld a, $fd
	ld [hld], a
	ld a, $f3
	ld [hld], a
	ld a, $f9
	ld [hld], a
	call Func_3444
	ld a, e
	and a
	jp nz, Func_42559
	ld bc, $4e1b
	call Func_3416
	ld de, $4f14
	call Func_30f0
	ld a, $00
	ld [hli], a
	ld [wCurObjUnk19], a
	jp Func_42535
; 0x424b1

Func_424b1: ; 424b1 (10:64b1)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $64
	ld [hld], a
	ld a, $ea
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_UNK_0C
	ld a, $fd
	ld [hld], a
	ld a, $f3
	ld [hld], a
	ld a, $f9
	ld [hld], a
	call Func_3444
	ld a, e
	and a
	jp nz, Func_42559
	ld bc, $4e06
	call Func_3416
	ld de, $4f14
	call Func_30f0
	ld a, $00
	ld [hli], a
	ld [wCurObjUnk19], a
	jp Func_42535
; 0x424ea

	INCROM $424ea, $42535

Func_42535: ; 42535 (10:6535)
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jp z, Func_42725
	ld hl, wCurObjUnk1a
	ld a, [hl]
	and $f0
	or $02
	ld [hld], a
	ld de, $4f26
	call Func_30f0
	ld a, $3c
	ld [hli], a
	ld l, OBJ_FLAGS
	res OBJFLAG_UNK5_F, [hl]
	ret
; 0x42554

	INCROM $42554, $42559

Func_42559: ; 42559 (10:6559)
	ld hl, wCurObjUnk1a
	ld a, [hl]
	and $f0
	or $03
	ld [hld], a
	ld de, $4f2b
	call Func_30f0
	ld a, $28
	ld [hli], a
	ret
; 0x4256c

	INCROM $4256c, $42725

Func_42725: ; 42725 (10:6725)
	ld hl, wCurObjUnk19
	ld a, [hl]
	ld b, HIGH(Data_40000)
	add LOW(Data_40000)
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_42740
	ld a, c
	sub $3f
	ld c, a
	ld a, [bc]
	ld c, $01
	ld [hl], c
	ld l, OBJ_UNK_16
	dec [hl]
	jr .apply_y_offset
.asm_42740
	inc [hl]
.apply_y_offset
	and a
	ret z
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .negative
	add c
	ld [hli], a
	ret nc
	inc [hl]
	ret
.negative
	add c
	ld [hli], a
	ret c
	dec [hl]
	ret
; 0x42754

	INCROM $42754, $429c4

Func_429c4: ; 429c4 (10:69c4)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $69
	ld [hld], a
	ld a, $ed
	ld [hld], a
	ld de, $461b
	call Func_30f0
	ld a, $60
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_UNK_0C
	ld a, $03
	ld [hld], a
	ld a, $fc
	ld [hld], a
	ld a, $fd
	ld [hl], a
	ret
; 0x429ed

	INCROM $429ed, $42b7d

Func_42b7d: ; 42b7d (10:6b7d)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $6a
	ld [hld], a
	ld a, $cf
	ld [hld], a
	ld de, $4611
	call Func_30f0
	ld a, $60
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	set 7, [hl]
	ld l, OBJ_UNK_0C
	ld a, $04
	ld [hld], a
	ld a, $fb
	ld [hld], a
	ld a, $fc
	ld [hl], a
	ret
; 0x42ba8

Func_42ba8: ; 42ba8 (10:6ba8)
	ld hl, wCurObjUpdateFunction + 1
	ld a, $6b
	ld [hld], a
	ld a, $bf
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld a, $14
	ld [wCurObjUnk16], a
	ld l, $00
	set 3, [hl]
	ret
; 0x42bbf

	INCROM $42bbf, $42d1d

Func_42d1d: ; 42d1d (10:6d1d)
	ld hl, wCurObjUpdateFunction + 1
	ld a, $6d
	ld [hld], a
	ld a, $27
	ld [hld], a
	ret
; 0x42d27

	INCROM $42d27, $43278

Func_43278: ; 43278 (10:7278)
	ld hl, wCurObjUpdateFunction + 1
	ld a, $72
	ld [hld], a
	ld a, $82
	ld [hld], a
	ret
; 0x43282

	INCROM $43282, $43451

Func_43451: ; 43451 (10:7451)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	set 3, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $74
	ld [hld], a
	ld a, $79
	ld [hld], a
	ld de, $4a7b
	call Func_30f0
	ld a, $0a
	ld [hli], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_UNK_0C
	ld a, $06
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld a, $f7
	ld [hl], a
	ret
; 0x43479

	INCROM $43479, $434ba

Func_434ba: ; 434ba (10:74ba)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $74
	ld [hld], a
	ld a, $e2
	ld [hld], a
	ld de, $4a78
	call Func_30f0
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_UNK_0C
	ld a, $06
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld a, $00
	ld [hl], a
	ld a, $31
	ld [wCurObjAction], a
	ret
; 0x434e2

	INCROM $434e2, $436ea

Func_436ea: ; 436ea (10:76ea)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	set 3, [hl]
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_UNK_0C
	ld a, $06
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld a, $f3
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $77
	ld [hld], a
	ld a, $1b
	ld [hld], a
	ld de, $4a9f
	call Func_30f0
	ret
; 0x4370f

	INCROM $4370f, $4379b

Func_4379b: ; 4379b (10:779b)
	ld de, $58ae
	jr Func_437a8

Func_437a0: ; 437a0 (10:77a0)
	ld de, $58ab
	jr Func_437a8

Func_437a5: ; 437a5 (10:77a5)
	ld de, $58a8
;	fallthrough

Func_437a8: ; 437a8 (10:77a8)
	call Func_30f0
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	set 3, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $77
	ld [hld], a
	ld a, $d6
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_UNK_0C
	ld a, $05
	ld [hld], a
	ld a, $ea
	ld [hld], a
	ld a, $fe
	ld [hl], a
	ld a, [wcac1]
	and a
	ret z
	ld a, $20
	ld [wCurObjUnk18], a
	jp Func_3076
; 0x437d6

	ret ; stray ret

Func_437d7: ; 437d7 (10:77d7)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	set 3, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $78
	ld [hld], a
	ld a, $0e
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld a, [wCurObjUnk07]
	cp $0a
	jr nz, .asm_437f5
	res 7, [hl]
	jr .asm_437f7
.asm_437f5
	set 7, [hl]
.asm_437f7
	ld l, $0a
	ld a, $fc
	ld [hli], a
	ld a, $fd
	ld [hli], a
	ld a, $02
	ld [hl], a
	ld de, $58ff
	call Func_30f0
	ld a, $3c
	ld [hli], a
	xor a
	ld [hl], a
	ret
; 0x4380e

	INCROM $4380e, $43a48
