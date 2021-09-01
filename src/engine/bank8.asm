Func_20000: ; 20000 (8:4000)
	ld a, [wca8a]
	and a
	ret nz
	ld a, [wca73]
	and a
	ret nz
	ld a, [wca9b]
	and a
	ret nz
	xor a
	ld [wcac9], a

	ld hl, wObjects
.loop_objects
	ld a, h
	cp HIGH(wCurObj)
	ret z
	ld [wObjPtr + 0], a
	ld a, l
	ld [wObjPtr + 1], a
	ld a, [hl]
	and %11
	cp %11
	jr z, .asm_20036
.next_obj
	ld a, [wObjPtr + 0]
	ld h, a
	ld a, [wObjPtr + 1]
	ld l, a
	ld de, OBJ_STRUCT_LENGTH
	add hl, de
	jr .loop_objects

.asm_20036
	push hl
	ld e, OBJ_UNK_1D
	ld d, $00
	add hl, de
	ld a, [hld]
	ld [wc1b8], a
	ld a, [hl] ; OBJ_UNK_1c
	pop hl
	and a
	jr nz, .next_obj

	ld e, OBJ_INTERACTION_TYPE
	ld d, $00
	add hl, de
	ld a, [hli] ; OBJ_INTERACTION_TYPE
	ld [wObjInteractionType], a
	ld a, [hli] ; OBJ_UNK_09
	ld [wc1ba], a
	ld a, [hli] ; OBJ_UNK_0A
	ld [wc1bb], a
	ld a, [hli] ; OBJ_UNK_0B
	ld [wc1bc], a
	ld a, [hli] ; OBJ_UNK_0C
	ld [wc1bd], a
	ld a, [hli] ; OBJ_UNK_0D
	ld [wc1be], a
	ld a, [hl] ; OBJ_UNK_0E
	ld [wc1bf], a

	ld e, OBJ_UNK_1A - OBJ_UNK_0E
	ld d, $00
	add hl, de
	ld a, [hl] ; OBJ_UNK_1A
	bit 7, a
	jr nz, .asm_20074
	ld a, DIRECTION_LEFT
	jr .asm_20076
.asm_20074
	ld a, DIRECTION_RIGHT
.asm_20076
	ld [wEnemyDirection], a

	xor a
	ld [wc1c0], a
	ld a, $ff
	ld [wc1c2], a
	ld [wc1c1], a
	ld [wc1c3], a
	ld [wc1c4], a

	ld e, $d0
	ld hl, wc1ba
	ld a, [wc1be]
	add [hl]
	sub e
	ld b, a ; wc1ba + wc1be - $d0
	ld hl, wca70
	ld a, [wWarioScreenYPos]
	add [hl]
	sub e
	sub b
	jp c, .next_obj
	ld c, a
	ld hl, wca6f
	ld a, [wWarioScreenYPos]
	add [hl]
	sub e
	ld b, a
	ld hl, wc1bb
	ld a, [wc1be]
	add [hl]
	sub e
	sub b
	jp c, .next_obj
	ld d, a
	ld a, d
	sub c
	jr c, .asm_200c9
	jr z, .asm_200c5

	ld a, c
	ld [wc1c1], a
	jr .asm_200cd
.asm_200c5
	ld a, c
	ld [wc1c1], a
.asm_200c9
	ld a, d
	ld [wc1c2], a
.asm_200cd

	ld hl, wc1bc
	ld a, [wc1bf]
	add [hl]
	sub e
	ld b, a
	ld hl, wca72
	ld a, [wWarioScreenXPos]
	add [hl]
	sub e
	sub b
	jp c, .next_obj
	ld c, a
	ld hl, wca71
	ld a, [wWarioScreenXPos]
	add [hl]
	sub e
	ld b, a
	ld hl, wc1bd
	ld a, [wc1bf]
	add [hl]
	sub e
	sub b
	jp c, .next_obj
	ld d, a
	sub c
	jr c, .asm_20108
	jr z, .asm_20104

	ld a, c
	ld [wc1c3], a
	jr .asm_2010c
.asm_20104
	ld a, c
	ld [wc1c3], a
.asm_20108
	ld a, d
	ld [wc1c4], a
.asm_2010c

	ld hl, wc1c0
	ld a, $f0
	ld [hl], a
	ld a, [wc1c4]
	ld b, a
	ld a, [wc1c3]
	ld c, a
	cp b
	jr z, .asm_20126
	jr c, .asm_20123
	res 5, [hl]
	jr .asm_20126
.asm_20123
	res 4, [hl]
	ld b, c
.asm_20126
	ld a, [wc1c2]
	ld d, a
	ld a, [wc1c1]
	ld e, a
	cp d
	jr z, .asm_2013a
	jr c, .asm_20137
	res 6, [hl]
	jr .asm_2013a
.asm_20137
	res 7, [hl]
	ld d, e
.asm_2013a
	ld a, b
	cp d
	jr z, .asm_2014a
	jr c, .asm_20146
	res 4, [hl]
	res 5, [hl]
	jr .asm_2014a
.asm_20146
	res 6, [hl]
	res 7, [hl]

.asm_2014a
	ld a, [wObjInteractionType]
	and $ff ^ (HEAVY_OBJ)
	jumptable

	dw Func_20b6b ; OBJ_INTERACTION_00
	dw Func_20d1d ; OBJ_INTERACTION_01
	dw ObjInteraction_FrontSting ; OBJ_INTERACTION_02
	dw ObjInteraction_BackSting ; OBJ_INTERACTION_03
	dw ObjInteraction_TopSting ; OBJ_INTERACTION_04
	dw ObjInteraction_FullSting ; OBJ_INTERACTION_05
	dw Func_20d81 ; OBJ_INTERACTION_06
	dw Func_20d8c ; OBJ_INTERACTION_07
	dw Func_20deb ; OBJ_INTERACTION_08
	dw Func_20e39 ; OBJ_INTERACTION_09
	dw Func_20e60 ; OBJ_INTERACTION_0A
	dw Func_20e6a ; OBJ_INTERACTION_0B
	dw Func_20e77 ; OBJ_INTERACTION_0C
	dw ObjInteraction_MusicalCoin ; OBJ_INTERACTION_0D
	dw Func_20e97 ; OBJ_INTERACTION_0E
	dw Func_20f6a ; OBJ_INTERACTION_0F
	dw ObjInteraction_GreyKey       ; OBJ_INTERACTION_10
	dw ObjInteraction_RedKey        ; OBJ_INTERACTION_11
	dw ObjInteraction_GreenKey      ; OBJ_INTERACTION_12
	dw ObjInteraction_BlueKey       ; OBJ_INTERACTION_13
	dw ObjInteraction_GreyTreasure  ; OBJ_INTERACTION_14
	dw ObjInteraction_RedTreasure   ; OBJ_INTERACTION_15
	dw ObjInteraction_GreenTreasure ; OBJ_INTERACTION_16
	dw ObjInteraction_BlueTreasure  ; OBJ_INTERACTION_17
	dw Func_21156 ; OBJ_INTERACTION_18
	dw Func_21245 ; OBJ_INTERACTION_19
	dw Func_21358 ; OBJ_INTERACTION_1A
	dw $5433      ; OBJ_INTERACTION_1B
	dw $5455      ; OBJ_INTERACTION_1C
	dw $5548      ; OBJ_INTERACTION_1D
	dw $5569      ; OBJ_INTERACTION_1E
	dw $55a2      ; OBJ_INTERACTION_1F
	dw $55e7      ; OBJ_INTERACTION_20
	dw $564f      ; OBJ_INTERACTION_21
	dw $5675      ; OBJ_INTERACTION_22
	dw $5774      ; OBJ_INTERACTION_23
	dw $57b9      ; OBJ_INTERACTION_24
	dw $5819      ; OBJ_INTERACTION_25
	dw $5853      ; OBJ_INTERACTION_26
	dw $5887      ; OBJ_INTERACTION_27
	dw $58e7      ; OBJ_INTERACTION_28
	dw $5999      ; OBJ_INTERACTION_29
	dw $4e0f      ; OBJ_INTERACTION_2A
	dw $5a4f      ; OBJ_INTERACTION_2B
	dw $5a47      ; OBJ_INTERACTION_2C
	dw $5a52      ; OBJ_INTERACTION_2D
	dw $5a8c      ; OBJ_INTERACTION_2E
	dw $5a97      ; OBJ_INTERACTION_2F
	dw $5ac3      ; OBJ_INTERACTION_30
	dw $5af1      ; OBJ_INTERACTION_31
	dw $5b08      ; OBJ_INTERACTION_32
	dw $5b0b      ; OBJ_INTERACTION_33
	dw $5b2b      ; OBJ_INTERACTION_34
	dw $5b42      ; OBJ_INTERACTION_35
	dw $5b78      ; OBJ_INTERACTION_36
	dw $5573      ; OBJ_INTERACTION_37
	dw $5b89      ; OBJ_INTERACTION_38
	dw $5c17      ; OBJ_INTERACTION_39
	dw $5c26      ; OBJ_INTERACTION_3A
	dw $5c56      ; OBJ_INTERACTION_3B
	dw $5c61      ; OBJ_INTERACTION_3C
	dw $5c86      ; OBJ_INTERACTION_3D
	dw $5c98      ; OBJ_INTERACTION_3E
	dw $5ca8      ; OBJ_INTERACTION_3F
	dw $5ccf      ; OBJ_INTERACTION_40
	dw $5ce9      ; OBJ_INTERACTION_41
	dw $5cf8      ; OBJ_INTERACTION_42
	dw $47ed      ; OBJ_INTERACTION_43
	dw $5cfd      ; OBJ_INTERACTION_44
	dw $5d17      ; OBJ_INTERACTION_45
	dw $5d3b      ; OBJ_INTERACTION_46
	dw $5d64      ; OBJ_INTERACTION_47
	dw $5d6f      ; OBJ_INTERACTION_48
	dw $5d88      ; OBJ_INTERACTION_49
	dw $5dd3      ; OBJ_INTERACTION_4A
	dw $5df8      ; OBJ_INTERACTION_4B
	dw $5e2e      ; OBJ_INTERACTION_4C
	dw $5e3e      ; OBJ_INTERACTION_4D
	dw $5e9c      ; OBJ_INTERACTION_4E
	dw $5ea6      ; OBJ_INTERACTION_4F
	dw $5ecd      ; OBJ_INTERACTION_50
	dw $5f01      ; OBJ_INTERACTION_51
	dw $5f28      ; OBJ_INTERACTION_52
	dw Func_20202 ; OBJ_INTERACTION_53
	dw Func_20202 ; OBJ_INTERACTION_54
	dw Func_20202 ; OBJ_INTERACTION_55
	dw Func_20202 ; OBJ_INTERACTION_56
	dw Func_20202 ; OBJ_INTERACTION_57
	dw Func_20202 ; OBJ_INTERACTION_58
; 0x20202

Func_20202: ; 20202 (8:4202)
	ret
; 0x20203

Func_20203: ; 20203 (8:4203)
	ld hl, wObjects
	ld de, OBJ_STRUCT_LENGTH
.loop_objects
	ld a, h
	cp HIGH(wCurObj)
	ret z
	ld a, [hl]
	and $03
	cp $01
	jr z, .asm_2021b
	cp $03
	jr z, .asm_2021b
.next_obj
	add hl, de
	jr .loop_objects
.asm_2021b
	ld a, [wObjPtr + 1]
	cp l
	jr z, .next_obj
	push hl
	ld c, OBJ_UNK_1C
	ld b, $00
	add hl, bc
	ld [hl], $08
	pop hl
	jr .next_obj
; 0x2022c

Func_2022c: ; 2022c (8:422c)
	ld a, [wca9d]
	and a
	jp nz, Func_20350
	ld a, [wc1c0]
	and $c0
	jp nz, Func_20447
;	fallthrough

Func_2023b: ; 2023b (8:423b)
	ld a, [wca93]
	and a
	jr z, .asm_20257
	cp $02
	jr z, .asm_20257
	cp $01
	jp z, Func_20939
	cp $03
	jp z, Func_20350
	cp $04
	jp z, Func_205e7
	jp Func_20000.next_obj

.asm_20257
	ld a, [wca89]
	and a
	jp nz, Func_20350
	ld b, $01
	call SetObjUnk1C
	ld a, [wca8c]
	cp $01
	ret z
	ld a, [wTransformation]
	cp (1 << 6) | TRANFORMATION_FLAT_WARIO
	jr z, Func_2028a
	and a
	ret nz
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_20283
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jr .bump
.asm_20283
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
.bump
	jr SetState_EnemyBumping
; 0x2028a

Func_2028a: ; 2028a (8:428a)
	ld a, [wJumpVelTable]
	and a
	ret z
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_202a0
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jr .asm_202a5
.asm_202a0
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
.asm_202a5
	farcall SetState_FlatFalling
	ret
; 0x202b5

SetState_EnemyBumping: ; 202b5 (8:42b5)
	load_sfx SFX_BUMP
	ld a, $0e
	ld [wJumpVelIndex], a
	ld a, $01
	ld [wJumpVelTable], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld [wca9a], a
	ld a, ST_ENEMY_BUMPING
	ld [wWarioState], a
	ld a, $04
	ld [wca7b], a
	ld a, $48
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_1426c
	ld a, [wca8b]
	and a
	jr nz, .asm_20332
	ld a, [wDirection]
	and a
	jr nz, .asm_20326
	load_frameset_ptr Frameset_14a71
.asm_20316
	update_anim_1
	ret
.asm_20326
	load_frameset_ptr Frameset_14a6c
	jr .asm_20316
.asm_20332
	ld a, [wDirection]
	and a
	jr nz, .asm_20344
	load_frameset_ptr Frameset_14a3b
	jr .asm_20316
.asm_20344
	load_frameset_ptr Frameset_14a38
	jr .asm_20316
; 0x20350

Func_20350: ; 20350 (8:4350)
	load_sfx SFX_017
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_20382
	ld a, $20
	ld [wc1c0], a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	add $08
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [hld]
	sub $08
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr .asm_203a0
.asm_20382
	ld a, $10
	ld [wc1c0], a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	sub $08
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [hld]
	sub $08
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
.asm_203a0
	ld b, $02
	farcall Func_c9f3
	ld b, $02
	call SetObjUnk1C
	ld a, [wTransformation]
	cp (1 << 7) | TRANFORMATION_FAT_WARIO
	jr z, .asm_20422
	cp (1 << 6) | TRANFORMATION_SNOWMAN_WARIO
	jr z, .asm_20432
	and a
	ret nz
	ld a, [wca9d]
	and a
	jr z, .asm_203e5
	ld a, [wObjInteractionType]
	bit HEAVY_OBJ_F, a
	ret z
	ld a, [wPowerUpLevel]
	cp POWER_UP_GARLIC
	ret nc
	farcall Func_1ca41
	ret

.asm_203e5
	ld a, [wObjInteractionType]
	bit HEAVY_OBJ_F, a
	jr z, .asm_203fc
	farcall Func_1ca41
	ret

.asm_203fc
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_20412
	farcall SetState_Idling
	ret

.asm_20412
	farcall StartFall
	ret

.asm_20422
	farcall SetState_FatBumping
	ret

.asm_20432
	ld a, [wca8f]
	and a
	ret nz
	farcall SetState_UnknownCA
	ret
; 0x20447

Func_20447: ; 20447 (8:4447)
	ld a, [wca8c]
	cp $01
	ret z
	ld a, [wIsSmashAttacking]
	dec a
	jr nz, .asm_2045e
	ld a, [wTransformation]
	cp (1 << 7) | TRANFORMATION_FAT_WARIO
	jp z, Func_205e7
	jp Func_20602

.asm_2045e
	ld a, [wTransformation]
	and a
	jp nz, Func_20585
	xor a
	ld [wca89], a
	ld a, [wca9d]
	and a
	jp nz, Func_20350
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_20484
	ld a, [wc1c0]
	or $20
	ld [wc1c0], a
	jr .asm_2048c
.asm_20484
	ld a, [wc1c0]
	or $10
	ld [wc1c0], a
.asm_2048c
	ld a, [wc1c0]
	bit 7, a
	jr nz, .asm_20506
	ld a, [wWarioScreenYPos]
	ld b, a
	ld a, [wc1be]
	cp b
	jr c, .asm_20506
	ld a, [wca9a]
	and $0f
	cp $03
	jr z, .asm_204d9
	xor a
	ld [wca9a], a
	ld a, [wca8b]
	and a
	jr nz, .asm_204c8
	ld a, [wJoypadDown]
	and a
	jp z, .asm_20575
	farcall StartJump_FromInput
	jr .asm_204e8

.asm_204c8
	farcall Func_1ed3f
	jr .asm_204e8

.asm_204d9
	farcall Func_1ede9
.asm_204e8
	ld a, $01
	ld [wca76], a
	ld a, $0a
	ld [wJumpVelIndex], a
	ld a, [wJoypadDown]
	bit 0, a
	jr z, .asm_20578
	ld a, [wPowerUpLevel]
	cp POWER_UP_HIGH_JUMP_BOOTS
	jr c, .asm_20578
	xor a
	ld [wJumpVelIndex], a
	jr .asm_20578

.asm_20506
	ld a, [wca8c]
	cp $01
	ret z
	ld a, [wca8b]
	and a
	jr nz, .asm_2055e
	ld a, [wca9a]
	and $0f
	cp $03
	jr z, .asm_20547
	xor a
	ld [wca9a], a
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_20536
	farcall SetState_Idling
	jr .asm_20578

.asm_20536
	farcall StartFall
	jr .asm_20578

.asm_20547
	ld a, [wJumpVelTable]
	and a
	jr z, .asm_20578
	farcall Func_1edd3
	jr .asm_20578

.asm_2055e
	ld a, [wJumpVelTable]
	and a
	jr z, .asm_20578
	farcall Func_1ed34
	jr .asm_20578

.asm_20575
	call Func_20939
.asm_20578
	load_sfx SFX_014
	ld b, $04
	jp SetObjUnk1C
; 0x20585

Func_20585: ; 20585 (8:4585)
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANFORMATION_HOT_WARIO
	jr nz, .asm_20593
	ld a, [wca8f]
	cp $02
	jr nc, Func_205e7
.asm_20593
	ld a, [wTransformation]
	cp (1 << 7) | TRANFORMATION_FAT_WARIO
	jp z, Func_20350
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_205af
	ld a, [wc1c0]
	or $20
	ld [wc1c0], a
	jr .asm_205b7
.asm_205af
	ld a, [wc1c0]
	or $10
	ld [wc1c0], a
.asm_205b7
	load_sfx SFX_014
	ld b, $04
	call SetObjUnk1C
	ld a, [wTransformation]
	cp (1 << 6) | TRANFORMATION_FLAT_WARIO
	jp z, Func_2028a
	cp TRANFORMATION_BOUNCY_WARIO
	jr z, .asm_205d1
	ret
.asm_205d1
	ld a, [wca93]
	cp $05
	ret z
	farcall Func_2a0b2
	ret
; 0x205e7

Func_205e7: ; 205e7 (8:45e7)
	ld b, $05
	call SetObjUnk1C
	ld a, [wTransformation]
	cp (1 << 6) | TRANFORMATION_ZOMBIE_WARIO
	ret nz
	farcall SetState_ZombieKnockBack
	ret
; 0x20602

Func_20602: ; 20602 (8:4602)
	ld a, [wTransformation]
	cp TRANFORMATION_INVISIBLE_WARIO
	jr z, .asm_2060c
	and a
	jr nz, Func_205e7
.asm_2060c
	ld a, [wca9a]
	and $0f
	cp $03
	jr z, .asm_2062a
	xor a
	ld [wca9a], a
	farcall StartJump_FromInput
	jr .asm_20639
.asm_2062a
	farcall Func_1ede9
.asm_20639
	ld a, $01
	ld [wca76], a
	ld a, $0a
	ld [wJumpVelIndex], a
	ld a, [wJoypadDown]
	bit 0, a
	jr z, .asm_20655
	ld a, [wPowerUpLevel]
	cp POWER_UP_HIGH_JUMP_BOOTS
	jr c, .asm_20655
	xor a
	ld [wJumpVelIndex], a
.asm_20655
	ld b, $05
;	fallthrough

SetObjUnk1C: ; 20657 (8:4657)
	ld a, [wObjPtr + 0]
	ld h, a
	ld a, [wObjPtr + 1]
	ld l, a
	ld e, OBJ_UNK_1C
	ld d, $00
	add hl, de
	ld [hl], b
	inc l
	ld a, [wc1c0]
	ld b, a
	ld a, [hl] ; OBJ_UNK_1D
	and $0f
	or b
	ld [hl], a
	ret
; 0x20670

Func_20670: ; 20670 (8:4670)
	ld a, [wca8c]
	and a
	jp nz, Func_20939
	ld a, [wPowerUpLevel]
	cp POWER_UP_GARLIC
	jr nc, .asm_20685
	ld a, [wObjInteractionType]
	bit HEAVY_OBJ_F, a
	jr nz, .asm_2068c
.asm_20685
	ld a, [wca9d]
	and a
	jp nz, Func_20350
.asm_2068c
	ld a, [wca92]
	and a
	jr z, .asm_206a8
	cp $01
	jr z, .asm_206a8
	cp $02
	jp z, Func_2023b
	cp $03
	jp z, Func_20350
	cp $04
	jp z, Func_205e7
	jp Func_20000.next_obj

.asm_206a8
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_206bc
	ld a, [wc1c0]
	or $20
	ld [wc1c0], a
	jr .asm_206c4
.asm_206bc
	ld a, [wc1c0]
	or $10
	ld [wc1c0], a
.asm_206c4
	ld a, [wc1c0]
	bit 5, a
	jr nz, .asm_206d2
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jr .asm_206d7
.asm_206d2
	ld a, DIRECTION_LEFT
	ld [wDirection], a
.asm_206d7
	ld b, $06
	call SetObjUnk1C
	ld a, [wca8c]
	cp $01
	ret z
	ld a, [wca92]
	cp $01
	jr z, Func_206eb
	jr SetState_Stung
; 0x206eb

Func_206eb: ; 206eb (8:46eb)
	ld a, [wTransformation]
	cp TRANFORMATION_OWL_WARIO
	call z, Func_16d9
	call Func_1079
	call UpdateLevelMusic
;	fallthrough

SetState_Stung: ; 206f9 (8:46f9)
	ld a, $01
	ld [wca8c], a

	load_sfx SFX_STING

	ld a, ST_STUNG
	ld [wWarioState], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca9a], a
	ld [wca89], a
	ld [wca9d], a
	ld [wIsSmashAttacking], a
	ld a, $6
	ld [wJumpVelIndex], a
	ld a, $ff
	ld [wca70], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, [wca8b]
	and a
	jr z, .asm_20774
	ld a, $e5
	ld [wca6f], a

	ldh a, [hYPosHi]
	ldh [hffad], a
	ldh a, [hYPosLo]
	ldh [hffae], a
	ldh a, [hXPosHi]
	ldh [hffaf], a
	ldh a, [hXPosLo]
	ldh [hffb0], a

	farcall Func_1996e
	ld a, b
	and a
	jr nz, .asm_20780

	xor a
	ld [wca8b], a
	ldh a, [hffad]
	ldh [hYPosHi], a
	ldh a, [hffae]
	ldh [hYPosLo], a
	ldh a, [hffaf]
	ldh [hXPosHi], a
	ldh a, [hffb0]
	ldh [hXPosLo], a

.asm_20774
	ld a, $e5
	ld [wca6f], a
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a
	jr .asm_20799

.asm_20780
	ld a, $f1
	ld [wca6f], a
	xor a ; JUMP_VEL_NONE
	ld [wJumpVelTable], a

	ldh a, [hffad]
	ldh [hYPosHi], a
	ldh a, [hffae]
	ldh [hYPosLo], a
	ldh a, [hffaf]
	ldh [hXPosHi], a
	ldh a, [hffb0]
	ldh [hXPosLo], a

.asm_20799
	ld a, $04
	ld [wca7b], a
	ld a, $78
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_15955

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_207d3
	load_frameset_ptr Frameset_15f7f
	jr .asm_207dd
.asm_207d3
	load_frameset_ptr Frameset_15f70
.asm_207dd
	update_anim_1
	ret
; 0x207ed

Func_207ed: ; 207ed (8:47ed)
	ld a, [wca8c]
	and a
	ret nz
	ld a, [wWaterInteraction]
	and a
	ret z
	ld a, [wca92]
	and a
	jr z, .asm_20808
	cp $02
	jp z, Func_208f2.start
	cp $04
	jp z, Func_2092d
	ret

.asm_20808
	ld b, $06
	call SetObjUnk1C
	load_sfx SFX_STING
	ld a, $01
	ld [wca8c], a
	ld a, ST_WATER_STUNG
	ld [wWarioState], a
	xor a
	ld [wca6d], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, $01
	ld [wca8a], a
	ld a, $ff
	ld [wca70], a
	ld a, $f1
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $04
	ld [wca7b], a
	ld a, $78
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_15955
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_2087f
	load_frameset_ptr Frameset_15f70
	jr .asm_20889
.asm_2087f
	load_frameset_ptr Frameset_15f7f
.asm_20889
	update_anim_1
	ret
; 0x20899

Func_20899: ; 20899 (8:4899)
	ld a, [wca92]
	and a
	jr z, .asm_208a9
	cp $02
	jr z, .asm_208a9
	cp $04
	jp z, Func_2092d
	ret

.asm_208a9
	ld a, [wWaterInteraction]
	and a
	ret z
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_208c2
	ld a, [wc1c0]
	or $20
	ld [wc1c0], a
	jr .asm_208ca
.asm_208c2
	ld a, [wc1c0]
	or $10
	ld [wc1c0], a
.asm_208ca
	load_sfx SFX_014
	ld b, $04
	call SetObjUnk1C
	ld a, [wTransformation]
	and a
	ret nz
	ld a, [wc1c0]
	bit 6, a
	ret nz
	farcall Func_1cdc4
	ret
; 0x208f2

Func_208f2: ; 208f2 (8:48f2)
	jr .start

.Func_208f4
	ld b, $01
	call SetObjUnk1C
	ret

.start
	ld a, [wca92]
	and a
	jr z, .asm_2090a
	cp $02
	jr z, .asm_2090a
	cp $04
	jp z, Func_2092d
	ret

.asm_2090a
	ld a, [wWaterInteraction]
	and a
	ret z
	call .Func_208f4
	ld a, [wca8c]
	cp $01
	ret z
	ld a, [wTransformation]
	and a
	ret nz
	farcall Func_1cdc4
	ret
; 0x2092d

Func_2092d: ; 2092d (8:492d)
	ld b, $05
	jp SetObjUnk1C
; 0x20932

Func_20932: ; 20932 (8:4932)
	ld a, [wca89]
	and a
	jp nz, Func_20350
;	fallthrough

Func_20939: ; 20939 (8:4939)
	ld a, [wca93]
	and a
	jp nz, Func_2023b
	ld b, $06
	call SetObjUnk1C
	ld a, [wca8c]
	cp $01
	ret z
	farcall Func_1ca39
	ld a, $04
	ld [wca7b], a
	ld a, $48
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_oam_ptr OAM_1426c
	xor a
	ld [wca9a], a
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_209b4
	ld a, $20
	ld [wc1c0], a
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	load_frameset_ptr Frameset_14a79
.asm_209a4
	update_anim_1
	ret
.asm_209b4
	ld a, $10
	ld [wc1c0], a
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	load_frameset_ptr Frameset_14a76
	jr .asm_209a4
; 0x209ca

Func_209ca: ; 209ca (8:49ca)
	ld a, [wWarioState]
	cp ST_ATTACKING_AIRBORNE
	jr nz, .asm_209d5
	; airborne
	xor a
	ld [wca89], a
.asm_209d5
	ld a, [wWaterInteraction]
	and a
	ret nz
	ld a, [wWarioState]
	cp ST_DIVING
	ret z
	ld a, $01
	ld [wcac9], a
	ld a, [wc1c1]
	and a
	jr z, .asm_209f5
	cp $03
	jr c, .asm_209f1
	ld a, $02
.asm_209f1
	ld b, a
	call SubYOffset
.asm_209f5
	ld b, $09
	call SetObjUnk1C
	ld a, [wJumpVelTable]
	and a
	jr z, .asm_20a60
	ld a, [wca89]
	and a
	jr nz, .asm_20a60
	ld a, [wca9d]
	and a
	jr nz, .asm_20a60
	call Func_1501
	ld a, [wca8c]
	cp $01
	jr z, .asm_20a60
	ld a, [wTransformation]
	and a
	ret nz
	ld a, [wca9a]
	and a
	jr nz, .asm_20a51
	ld a, [wca8b]
	and a
	jr nz, .asm_20a3c
	xor a
	ld [wWaterInteraction], a
	farcall SetState_Idling
	jr .asm_20a60
.asm_20a3c
	xor a
	ld [wWaterInteraction], a
	farcall Func_1e855
	jr .asm_20a60
.asm_20a51
	farcall Func_1efe7
.asm_20a60
	jp Func_20000.next_obj
; 0x20a63

Func_20a63: ; 20a63 (8:4a63)
	ld b, $07
	call SetObjUnk1C
	ret
; 0x20a69

Func_20a69: ; 20a69 (8:4a69)
	ld b, $0d
	call SetObjUnk1C
	ret
; 0x20a6f

Func_20a6f: ; 20a6f (8:4a6f)
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_20aa5
.asm_20a79
	ld a, [wDirection]
	and a
	jp z, Func_20000.next_obj
	ld a, $20
	ld [wc1c0], a
	farcall Func_197b1
	ld a, b
	and a
	jr nz, .asm_20acf
	ld a, [wc1c3]
	cp $ff
	jr z, .asm_20aa5
	ld b, a
	call SubXOffset
	jr .asm_20acf

.asm_20aa5
	ld a, [wDirection]
	and a
	jp nz, Func_20000.next_obj
	ld a, $10
	ld [wc1c0], a
	farcall Func_19741
	ld a, b
	and a
	jr nz, .asm_20acf
	ld a, [wc1c4]
	cp $ff
	jr z, .asm_20a79
	ld b, a
	call AddXOffset
.asm_20acf
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANFORMATION_BALL_O_STRING_WARIO
	jr z, .asm_20aff
	cp (1 << 6) | (1 << 7) | TRANFORMATION_HOT_WARIO
	jr z, .asm_20b15
	cp (1 << 6) | TRANFORMATION_UNK_0D
	jr z, .asm_20b2b
	xor a
	ld [wca86], a
	ld a, [wca9d]
	and a
	jr nz, .asm_20aef
	ld a, [wca89]
	and a
	jp z, Func_20000.next_obj

.asm_20aef
	farcall Func_1ca39
	ret

.asm_20aff
	ld a, [wca8f]
	cp $01
	ret nz
	farcall Func_28bd5
	ret

.asm_20b15
	ld a, [wca8f]
	cp $01
	ret nz
	farcall Func_2afc5
	ret

.asm_20b2b
	ld a, [wWarioState]
	cp ST_ICE_SKATIN_CRASH
	ret z
	farcall Func_1ec215
	ret
; 0x20b41

	INCROM $20b41, $20b6b

Func_20b6b: ; 20b6b (8:4b6b)
	ld a, [wc1c0]
	bit 6, a
	jp nz, Func_20447
	ld a, [wca93]
	and a
	jr z, .asm_20b8b
	cp $03
	jp z, Func_20350
	cp $04
	jp z, Func_205e7
	cp $05
	jp z, Func_20000.next_obj
	jp .asm_20c41

.asm_20b8b
	ld a, [wWarioState]
	cp ST_DIVING
	jr c, .asm_20b97
	cp ST_TRYING_SUBMERGE + 1
	jp c, Func_20899

.asm_20b97
	ld a, [wca9d]
	ld b, a
	ld a, [wca89]
	or b
	jp nz, Func_20350
	ld a, [wca8b]
	ld b, a
	ld a, [wca9a]
	or b
	jp nz, .asm_20c41

	ld a, [wPowerUpLevel]
	cp POWER_UP_GRAB_GLOVE
	jp c, .asm_20c41
	ld a, [wWarioState]
	cp ST_LADDER_SCRATCHING
	jp z, .asm_20c41
	cp ST_LADDER_CLIMBING
	jr c, .asm_20bc6
	cp ST_LADDER_SLIDING + 1
	jp c, .asm_20c41
.asm_20bc6
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_20bdd
	ld a, $20
	ld [wc1c0], a
	ld a, [wDirection]
	and a
	jr nz, .asm_20be8
	jr .asm_20c41
.asm_20bdd
	ld a, $10
	ld [wc1c0], a
	ld a, [wDirection]
	and a
	jr nz, .asm_20c41
.asm_20be8
	ld a, [wca8c]
	cp $01
	ret z
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub $08
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	ld a, [wObjInteractionType]
	bit HEAVY_OBJ_F, a
	jr nz, .asm_20c11
	ld a, $01
	ld [wca9a], a
	jr .asm_20c1d

.asm_20c11
	ld a, [wPowerUpLevel]
	cp POWER_UP_SUPER_GRAB_GLOVES
	jr c, .asm_20c41
	ld a, $81
	ld [wca9a], a
.asm_20c1d
	ld b, $03
	call SetObjUnk1C
	ld a, [wJumpVelTable]
	and a
	jr z, .pick_up
	ld a, [wObjInteractionType]
	bit HEAVY_OBJ_F, a
	jr z, .asm_20c31
	jr .asm_20c41
.asm_20c31
	farcall Func_1edd3
	ret

.asm_20c41
	jp Func_20447
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_20c56
	ld a, $20
	ld [wc1c0], a
	jp Func_2023b

.asm_20c56
	ld a, $10
	ld [wc1c0], a
	jp Func_2023b

.pick_up
	load_sfx SFX_GRAB
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, ST_PICKING_UP
	ld [wWarioState], a
	ld a, $ff
	ld [wca70], a
	ld a, $e5
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $04
	ld [wca7b], a
	ld a, $70
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_1606a
	ld a, [wDirection]
	and a
	jr nz, .asm_20cdb
	ld a, [wIsStandingOnSlope]
	bit 1, a
	jr nz, .asm_20cf5
	ld a, [wca9a]
	and $80
	jr nz, .asm_20d05
	load_frameset_ptr Frameset_163ec
.asm_20ccb
	update_anim_1
	ret
.asm_20cdb
	ld a, [wIsStandingOnSlope]
	bit 0, a
	jr nz, .asm_20cf5
	ld a, [wca9a]
	and $80
	jr nz, .asm_20d11
	load_frameset_ptr Frameset_1640c
	jr .asm_20ccb
.asm_20cf5
	farcall Func_1efe7
	ret
.asm_20d05
	load_frameset_ptr Frameset_163f5
	jr .asm_20ccb
.asm_20d11
	load_frameset_ptr Frameset_16415
	jr .asm_20ccb
; 0x20d1d

Func_20d1d: ; 20d1d (8:4d1d)
	jp Func_2022c
; 0x20d20

ObjInteraction_FrontSting: ; 20d20 (8:4d20)
	ld a, [wc1c0]
	and $c0
	jr nz, .asm_20d44
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_20d39
	ld a, [wc1c0]
	bit 5, a
	jp nz, Func_20670
	jp Func_2022c
.asm_20d39
	ld a, [wc1c0]
	bit 4, a
	jp nz, Func_20670
	jp Func_2022c
.asm_20d44
	jp Func_20447
; 0x20d47

ObjInteraction_BackSting: ; 20d47 (8:4d47)
	ld a, [wc1c0]
	and $c0
	jr nz, .asm_20d6b
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_20d60
	ld a, [wc1c0]
	bit 4, a
	jp nz, Func_20670
	jp Func_2022c
.asm_20d60
	ld a, [wc1c0]
	bit 5, a
	jp nz, Func_20670
	jp Func_2022c
.asm_20d6b
	jp Func_20447
; 0x20d6e

ObjInteraction_TopSting: ; 20d6e (8:4d6e)
	ld a, [wc1c0]
	bit 6, a
	jp nz, Func_20670
	bit 7, a
	jp nz, Func_20447
	jp Func_2022c
; 0x20d7e

ObjInteraction_FullSting: ; 20d7e (8:4d7e)
	jp Func_20670
; 0x20d81

Func_20d81: ; 20d81 (8:4d81)
	ld a, [wc1c0]
	and $c0
	jp nz, Func_20899
	jp Func_208f2
; 0x20d8c

Func_20d8c: ; 20d8c (8:4d8c)
	ld a, [wWaterInteraction]
	and a
	ret z
	ld a, [wc1c0]
	bit 6, a
	jp nz, Func_207ed

	ld a, [wTransformation]
	and a
	ret nz
	ld a, [wc1c0]
	bit 7, a
	jr nz, .asm_20ddb
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_20dbe
	ld a, [wc1c0]
	or $20
	ld [wc1c0], a
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jr .asm_20dcb
.asm_20dbe
	ld a, [wc1c0]
	or $10
	ld [wc1c0], a
	ld a, DIRECTION_RIGHT
	ld [wDirection], a

.asm_20dcb
	farcall SetState_SwimKnockBack
	ret

.asm_20ddb
	farcall Func_1cdc4
	ret
; 0x20deb

Func_20deb: ; 20deb (8:4deb)
	ld a, [wc1c0]
	and $c0
	jp nz, Func_20899
	ld a, [wEnemyDirection]
	and a
	jr nz, .asm_20e04
	ld a, [wc1c0]
	bit 5, a
	jp nz, Func_207ed
	jp Func_208f2
.asm_20e04
	ld a, [wc1c0]
	bit 4, a
	jp nz, Func_207ed
	jp Func_208f2
; 0x20e0f

	INCROM $20e0f, $20e39

Func_20e39: ; 20e39 (8:4e39)
	ld a, [wc1c0]
	and $c0
	jr nz, .asm_20e5d
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_20e52
	ld a, [wc1c0]
	bit 5, a
	jp nz, Func_20939
	jp Func_2022c
.asm_20e52
	ld a, [wc1c0]
	bit 4, a
	jp nz, Func_20939
	jp Func_2022c
.asm_20e5d
	jp Func_20447
; 0x20e60

Func_20e60: ; 20e60 (8:4e60)
	jp Func_20939
; 0x20e63

	INCROM $20e63, $20e6a

Func_20e6a: ; 20e6a (8:4e6a)
	call Func_20939
	ld a, [wca93]
	and a
	ret nz
	ld b, $0a
	jp SetObjUnk1C
; 0x20e77

Func_20e77: ; 20e77 (8:4e77)
	ld a, [wc1c0]
	bit 6, a
	jp nz, Func_21aac
	jp Func_20932
; 0x20e82

ObjInteraction_MusicalCoin: ; 20e82 (8:4e82)
	ld hl, wNumMusicalCoins
	ld a, [hl]
	cp NUM_LEVEL_MUSICAL_COINS
	jp nc, Func_20000.next_obj
	inc [hl]
	load_sfx SFX_MUSICAL_COIN
	jp CollectMusicalCoin
; 0x20e97

Func_20e97: ; 20e97 (8:4e97)
	ld b, $06
	call SetObjUnk1C

	ld a, [wca8c]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2022c
	ld a, (1 << 6) | (1 << 7) | TRANFORMATION_HOT_WARIO
	ld [wTransformation], a
	ld a, $01
	ld [wca8f], a
	ld a, $02
	ld [wca93], a
	ld a, $02
	ld [wca92], a
	ld a, $02
	ld [wca94], a
	ld a, $02
	ld [wca90], a
	ld a, $58
	ld [wca91], a
	call UpdateLevelMusic
	xor a
	ld [wWarioStateCounter], a
;	fallthrough

SetState_OnFire: ; 20ed3 (8:4ed3)
	ld a, ST_ON_FIRE
	ld [wWarioState], a

	xor a
	ld [wca8d], a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCycles], a
	ld [wca9a], a
	ld [wca89], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wca8b], a
	ld [wca9d], a
	ld [wIsSmashAttacking], a
	ld a, $ff
	ld [wca70], a
	ld a, $e5
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, [wWarioStateCounter]
	and a
	ret nz

	ld hl, Pals_c820
	call Func_1af6

	ld a, $09
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_1673c

	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_20f50
	load_frameset_ptr Frameset_16b38
	jr .asm_20f5a
.asm_20f50
	load_frameset_ptr Frameset_16b49
.asm_20f5a
	update_anim_1
	ret
; 0x20f6a

Func_20f6a: ; 20f6a (8:4f6a)
	ld a, [wc1c0]
	bit 6, a
	jr nz, .asm_20f78
	bit 7, a
	jr nz, .asm_20f82
	jp Func_20932

.asm_20f78
	ld a, [wIsSmashAttacking]
	dec a
	jp z, Func_20602
	jp Func_20447
.asm_20f82
	ld a, [wca8c]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2022c
	ld a, $f5
	ld [wca71], a
	ld a, $0b
	ld [wca72], a
	ld a, [wLadderInteraction]
	cp $02
	jr z, .asm_20fdb
	farcall Func_197b1
	ld a, b
	and a
	jr nz, .asm_20fdb
	farcall Func_19741
	ld a, b
	and a
	jr nz, .asm_20fdb
	ld b, $0b
	call SetObjUnk1C
	farcall SetState_FlatAirborne
	ret

.asm_20fdb
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	jp Func_20447
; 0x20fe8

	INCROM $20fe8, $20fed

ObjInteraction_GreyKey: ; 20fed (8:4fed)
	ld hl, wKeys
	set GREY_KEY_F, [hl]
	jr CollectKey
; 0x20ff4

ObjInteraction_RedKey: ; 20ff4 (8:4ff4)
	ld hl, wKeys
	set RED_KEY_F, [hl]
	jr CollectKey
; 0x20ffb

ObjInteraction_GreenKey: ; 20ffb (8:4ffb)
	ld hl, wKeys
	set GREEN_KEY_F, [hl]
	jr CollectKey
; 0x21002

ObjInteraction_BlueKey: ; 21002 (8:5002)
	ld hl, wKeys
	set BLUE_KEY_F, [hl]
;	fallthrough

CollectKey: ; 21007 (8:5007)
	load_sfx SFX_KEY
	call Func_20a63
	ld a, MAIN_SEQTABLE_COLLECT_KEY
	ld [wSequence], a
	xor a
	ld [wIntroSeqTimer], a
	ret
; 0x2101c

ObjInteraction_GreyTreasure: ; 2101c (8:501c)
	ld a, [wc1c0]
	bit 6, a
	jp nz, Func_209ca
	ld a, [wTransformation]
	and a
	jp nz, Func_20a6f
	ld hl, wKeys
	bit GREY_KEY_F, [hl]
	jp z, Func_20a6f
	set 4, [hl]
	ld a, LEVEL_END_GREY_TREASURE
	ld [wLevelEndScreen], a
	jr GetTreasure
; 0x2103c

ObjInteraction_RedTreasure: ; 2103c (8:503c)
	ld a, [wc1c0]
	bit 6, a
	jp nz, Func_209ca
	ld a, [wTransformation]
	and a
	jp nz, Func_20a6f
	ld hl, wKeys
	bit RED_KEY_F, [hl]
	jp z, Func_20a6f
	set 5, [hl]
	ld a, LEVEL_END_RED_TREASURE
	ld [wLevelEndScreen], a
	jr GetTreasure
; 0x2105c

ObjInteraction_GreenTreasure: ; 2105c (8:505c)
	ld a, [wc1c0]
	bit 6, a
	jp nz, Func_209ca
	ld a, [wTransformation]
	and a
	jp nz, Func_20a6f
	ld hl, wKeys
	bit GREEN_KEY_F, [hl]
	jp z, Func_20a6f
	set 6, [hl]
	ld a, LEVEL_END_GREEN_TREASURE
	ld [wLevelEndScreen], a
	jr GetTreasure
; 0x2107c

ObjInteraction_BlueTreasure: ; 2107c (8:507c)
	ld a, [wc1c0]
	bit 6, a
	jp nz, Func_209ca
	ld a, [wTransformation]
	and a
	jp nz, Func_20a6f
	ld hl, wKeys
	bit BLUE_KEY_F, [hl]
	jp z, Func_20a6f
	set 7, [hl]
	ld a, LEVEL_END_BLUE_TREASURE
	ld [wLevelEndScreen], a
;	fallthrough

GetTreasure: ; 2109a (8:509a)
	stop_music
	call Func_20a63
	call Func_20203

	ld hl, wLevelEndScreen
	ld a, [hl]
	cp LEVEL_END_NO_TREASURE
	ret z
	set 7, [hl]
	ld a, TRUE
	ld [wResetDisabled], a
	xor a
	ld [wca86], a
	ld a, ST_UNKNOWN_40
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wJumpVelIndex], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld [wca8b], a
	ld [wca89], a
	inc a
	ld [wca8a], a
	ld [wca9b], a
	ld a, [wJumpVelTable]
	and a
	jr z, .asm_210ea
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
.asm_210ea
	ld hl, Pals_c800
	call Func_1af6
	ld a, $04
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0

	load_oam_ptr OAM_14000

	ld a, [wc1c0]
	bit 4, a
	jr nz, .asm_21130
	ld a, [wc1c3]
	ld b, a
	call SubXOffset
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	load_frameset_ptr Frameset_1425f
	jr .asm_21146
.asm_21130
	ld a, [wc1c4]
	ld b, a
	call AddXOffset
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	load_frameset_ptr Frameset_14252
.asm_21146
	update_anim_1
	ret
; 0x21156

Func_21156: ; 21156 (8:5156)
	ld a, [wJumpVelTable]
	and a
	jp nz, Func_2022c
	ld b, $0c
	call SetObjUnk1C
	ld a, [wTransformation]
	cp (1 << 6) | TRANFORMATION_FLAT_WARIO
	jp z, SetState_FlatStretching
	and a
	jp nz, Func_2022c

	ld a, $01
	ld [wca9b], a
	ld a, ST_PICKED_UP
	ld [wWarioState], a
	ld a, $ff
	ld [wca70], a
	ld a, $e5
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	xor a
	ld [wIsSmashAttacking], a
	ld [wca89], a
	ld [wca8b], a
	ld [wca9a], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wca68], a
	inc a
	ld [wJumpVelTable], a
	ld a, NUM_WIGGLES_TO_ESCAPE
	ld [wPickedUpWiggleCounter], a

	ld a, $04
	ld [wca7b], a
	ld a, $78
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0

	load_oam_ptr OAM_15955

	ld a, [wDirection]
	and a
	jr nz, .asm_211e1
	load_frameset_ptr Frameset_15f70
	jr .asm_211eb
.asm_211e1
	load_frameset_ptr Frameset_15f7f
.asm_211eb
	update_anim_1
	ret
; 0x211fb

SetState_FlatStretching: ; 211fb (8:51fb)
	ld a, $01
	ld [wca9b], a
	ld a, ST_FLAT_STRETCHING
	ld [wWarioState], a
	ld a, $ff
	ld [wca70], a
	ld a, $f8
	ld [wca6f], a
	ld a, $f5
	ld [wca71], a
	ld a, $0b
	ld [wca72], a
	ld a, NUM_WIGGLES_TO_ESCAPE
	ld [wPickedUpWiggleCounter], a
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wca68], a

	load_frameset_ptr Frameset_17193
	update_anim_1
	ret
; 0x21245

Func_21245: ; 21245 (8:5245)
	ld a, [wc1c0]
	and $c0
	jr nz, .asm_21267
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_2125d
	ld a, [wc1c0]
	bit 5, a
	jr nz, .asm_2126a
	jp Func_2022c

.asm_2125d
	ld a, [wc1c0]
	bit 4, a
	jr nz, .asm_2126a
	jp Func_2022c

.asm_21267
	jp Func_20447

.asm_2126a
	ld a, [wca8b]
	and a
	jr z, .asm_21290
	ld a, $e5
	ld [wca6f], a
	farcall Func_1996e
	ld a, b
	and a
	jr z, .asm_21290
	ld a, $f1
	ld [wca6f], a
	jp Func_2022c

.asm_21290
	ld b, $06
	call SetObjUnk1C

	ld a, [wca8c]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2023b
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_212b3

	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jr .asm_212b8
.asm_212b3
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
.asm_212b8
	load_sfx SFX_039

	ld a, (1 << 6) | (1 << 7) | TRANFORMATION_BALL_O_STRING_WARIO
	ld [wTransformation], a
	xor a
	ld [wca8f], a
	ld a, $03
	ld [wca93], a
	ld a, $03
	ld [wca92], a
	ld a, $01
	ld [wca94], a
	call UpdateLevelMusic

	ld a, ST_GETTING_WRAPPED_IN_STRING
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca9a], a
	ld [wca89], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wca8b], a
	ld [wca9d], a
	ld [wIsSmashAttacking], a
	ld a, $ff
	ld [wca70], a
	ld a, $e5
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld hl, Pals_c860
	call Func_1af6

	ld a, $09
	ld [wca7b], a
	ld a, $58
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0

	load_oam_ptr OAM_171c0

	load_frameset_ptr Frameset_17414
	update_anim_1
	ret
; 0x21358

Func_21358: ; 21358 (8:5358)
	ld a, [wca8b]
	and a
	jp nz, Func_20a69
	ld a, [wca8c]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_20a69
	cp $84
	jr nz, .asm_21373
	jp Func_20a69

.asm_21373
	call Func_20a63
	ld a, (1 << 7) | TRANFORMATION_FAT_WARIO
	ld [wTransformation], a
	ld a, $02
	ld [wca93], a
	ld a, $02
	ld [wca92], a
	ld a, $02
	ld [wca94], a
	ld a, $01
	ld [wca90], a
	ld a, $a4
	ld [wca91], a
	xor a
	ld [wca8d], a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca9a], a
	ld [wca89], a
	ld [wca8b], a
	ld [wca9d], a
	ld [wIsSmashAttacking], a
	ld a, [wJumpVelTable]
	and a
	jr z, .asm_213bb
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
.asm_213bb
	load_sfx SFX_03A
	call UpdateLevelMusic

	ld a, ST_FAT_EATING
	ld [wWarioState], a
	ld a, $ff
	ld [wca70], a
	ld a, $e5
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, $09
	ld [wca7b], a
	ld a, $60
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0

	load_oam_ptr OAM_1742d

	ld a, [wDirection]
	and a
	jr nz, .asm_21419
	load_frameset_ptr Frameset_1789c
	jr .asm_21423
.asm_21419
	load_frameset_ptr Frameset_178c3
.asm_21423
	update_anim_1
	ret
; 0x21433

	INCROM $21433, $21aac

Func_21aac: ; 21aac (8:5aac)
	ld a, [wIsSmashAttacking]
	dec a
	jp nz, Func_209ca
	call Func_20602
	ld b, $0f
	jp SetObjUnk1C
; 0x21abb

	INCROM $21abb, $21ddb

; adds 10 to coin count
CollectMusicalCoin: ; 21ddb (8:5ddb)
	ld hl, wNumCoins + 1
	ld a, [hl]
	add $10
	daa
	ld [hld], a
	ld a, [hl]
	adc $00
	daa
	ld [hl], a
	and $f0
	jr z, .no_cap
	ld a, HIGH(MAX_NUM_COINS)
	ld [hli], a
	ld a, LOW(MAX_NUM_COINS)
	ld [hl], a
.no_cap
	call Func_20a63
	jp Func_20000.next_obj
; 0x21df8

	INCROM $21df8, $21f51

Func_21f51: ; 21f51 (8:5f51)
	ld a, [wce00]
	ld b, a
	ld a, $ce
	ld [wcce7], a
	ld a, $01
	add b
	ld [wcce8], a
	ld a, [wc0a4]
	and $08
	jr nz, .asm_21fa3
	ld b, $10
.asm_21f69
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	add $02
	ld [wcce8], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_21f9f
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_21f9f
	dec b
	jr nz, .asm_21f69
	ret

.asm_21fa3
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	inc l
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	inc a
	ld [wcce8], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_21fd6
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_21fd6
	ld b, $10
.asm_21fd8
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	add $02
	ld [wcce8], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_2200e
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_2200e
	dec b
	jr nz, .asm_21fd8
	ret
; 0x22012

Func_22012: ; 22012 (8:6012)
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [wce00]
	ld b, a
	ld a, $ce
	ld [wc0b3], a
	ld a, $35
	add b
	ld [wc0b4], a
	ld a, [wc0a4]
	and $08
	jp nz, Func_2208a
	ld b, $10
.asm_22032
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	add $02
	ld [wc0b4], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22068
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22068
	dec b
	jr nz, .asm_22032
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	ld a, [hl]
	ld [de], a
	pop hl
	pop af
	ldh [rSVBK], a
	ret
; 0x2208a

Func_2208a: ; 2208a (8:608a)
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wce35
	add hl, de
	inc l
	inc l
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	inc a
	ld [wc0b4], a
	ld a, [hl]
	ld [de], a
	pop hl

	inc h
	ld a, h
	cp $c0
	jr nz, .asm_220bd
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_220bd
	ld b, $10
.asm_220bf
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	add $02
	ld [wc0b4], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_220f5
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_220f5
	dec b
	jr nz, .asm_220bf
	pop af
	ldh [rSVBK], a
	ret
; 0x220fc

Func_220fc: ; 220fc (8:60fc)
	ld a, [wce00]
	ld b, a
	ld a, $ce
	ld [wcce7], a
	ld a, $01
	add b
	ld [wcce8], a
	ld a, [wc0a4]
	and $08
	jp nz, Func_2214e
	ld b, $10
.asm_22115
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	add $02
	ld [wcce8], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_2214a
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_2214a
	dec b
	jr nz, .asm_22115
	ret
; 0x2214e

Func_2214e: ; 2214e (8:614e)
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	inc a
	ld [wcce8], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22180
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22180
	ld b, $10
.asm_22182
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	add $02
	ld [wcce8], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_221b7
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_221b7
	dec b
	jr nz, .asm_22182
	ret
; 0x221bb

Func_221bb: ; 221bb (8:61bb)
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [wce00]
	ld b, a
	ld a, $ce
	ld [wc0b3], a
	ld a, $35
	add b
	ld [wc0b4], a
	ld a, [wc0a4]
	and $08
	jp nz, Func_22217
	ld b, $10
.asm_221db
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	add $02
	ld [wc0b4], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22210
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22210
	dec b
	jr nz, .asm_221db
	pop af
	ldh [rSVBK], a
	ret
; 0x22217

Func_22217: ; 22217 (8:6217)
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	inc a
	ld [wc0b4], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22249
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22249
	ld b, $10
.asm_2224b
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	add $02
	ld [wc0b4], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22280
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22280
	dec b
	jr nz, .asm_2224b
	pop af
	ldh [rSVBK], a
	ret
; 0x22287
