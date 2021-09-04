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
	ld hl, wCurObjUnk00
	res 4, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(Func_40069)
	ld [hld], a
	ld a, LOW(Func_40069)
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld a, [wca3b]
	rra
	jp c, Func_40165
	jp Func_4021b
; 0x40069

Func_40069: ; 40069 (10:4069)
	ld a, [wCurObjUnk1b]
	jumptable

	dw $421b
	dw $42d8
	dw $43c2
	dw $43d6
	dw $45fc
	dw $4606
	dw $4620
	dw $4633
	dw $456b
	dw $4575
	dw $3182
	dw $45aa
	dw $45b1
	dw $421b
	dw $421b
	dw $44a2
	dw $44cb
	dw $425d
	dw $46af
	dw $44eb
	dw $446a
	dw $4472
	dw $4404
	dw $4437
	dw $467a
	dw $4646
	dw $3263
	dw $3272
	dw $3281
	dw $421b
	dw $421b
	dw $421b
	dw $3191
	dw $31af
	dw $31cd
	dw $31eb
	dw $3209
	dw $3227
	dw $3245
	dw $3254
	dw $45f2
	dw $45e8
	dw $421b
	dw $421b
	dw $421b
	dw $4182
	dw $42aa
	dw $4213
	dw $3290
	dw $430f
	dw $33da
	dw $33e9
	dw $3326
	dw $3317
	dw $3335
	dw $3344
	dw $31fa
	dw $31dc
	dw $421b
	dw $45c2
	dw $45d5
	dw $421b
	dw $421b
	dw $44b1
	dw $44d9
	dw $329f
	dw $3371
	dw $450a
	dw $32cc
	dw $32db
	dw $4429
	dw $445c
	dw $469e
	dw $466a
	dw $3380
	dw $338f
	dw $412d
	dw $4149
	dw $339e
	dw $33ad
	dw $31a0
	dw $31be
	dw $31dc
	dw $31fa
	dw $3218
	dw $3236
	dw $32cc
	dw $32db
	dw $33f8
	dw $3407
	dw $421b
	dw $421b
	dw $421b
	dw $421b
	dw $33bc
	dw $33cb
	dw $1b21
	dw $3ed1
	dw $325e
	dw $073a
	dw $0938
; 0x40137

	INCROM $40137, $40165

Func_40165: ; 40165 (10:4165)
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a

	ld l, OBJ_UNK_1B
	ld a, $2d
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

	INCROM $40182, $4021b

Func_4021b: ; 4021b (10:421b)
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a

	ld l, OBJ_UNK_1B
	ld a, $30
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

	INCROM $4025d, $406c4

Func_406c4: ; 406c4 (10:46c4)
	ld hl, wCurObjUnk00
	res 4, [hl]

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
	ld l, OBJ_UNK_00
	bit 5, [hl]
	jr z, .asm_40721
	res 5, [hl]
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
	ld l, OBJ_UNK_00
	bit 5, [hl]
	jr z, Func_40734
	res 5, [hl]
	ret
; 0x40734

Func_40734: ; 40734 (10:4734)
	ld de, $4319
	call Func_30f0
	ld l, OBJ_UNK_00
	res 3, [hl]
	xor a
	ld [wCurObjUnk1b], a
	ret
; 0x40743

Func_40743: ; 40743 (10:4743)
	ld hl, wCurObjUnk1b
	ld a, [hl]
	and a
	jr z, .asm_40767
	cp $2f
	jr z, Func_406f0
	cp $2e
	jr z, Func_4072b
	cp $34
	jr z, .asm_407b8
	cp $0a
	jr z, .asm_407bf
	cp $3a
	jp z, .asm_407d4
	and $fe
	cp $04
	jr z, .asm_407ab
	jr Func_40734

.asm_40767
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .asm_4077b

.asm_4076e
	ld a, $34
	ld [hl], a ; OBJ_UNK_1B

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
	ld l, OBJ_UNK_1B
	ld a, $2f
	ld [hld], a
	res 7, [hl] ; OBJ_UNK_16
	ld de, $4336
	call Func_30f0
	ret
.asm_4079a
	ld l, OBJ_UNK_00
	bit 5, [hl]
	ret z
	ld a, $2e
	ld [wCurObjUnk1b], a
	ld de, $4343
	call Func_30f0
	ret

.asm_407ab
	ld a, $34
	ld [hl], a ; OBJ_UNK_1B
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
	ld a, $3a
	ld [hld], a ; OBJ_UNK_1B
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
	ld hl, wCurObjUnk00
	res 4, [hl]
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
