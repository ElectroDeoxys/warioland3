Func_28000: ; 28000 (a:4000)
	ld a, [wWarioState]
	sub $60
	jumptable

	dw UpdateState_OnFire                   ; ST_ON_FIRE
	dw UpdateState_OnFireAirborne           ; ST_ON_FIRE_AIRBORNE
	dw UpdateState_Hot                      ; ST_HOT
	dw UpdateState_HotAirborne              ; ST_HOT_AIRBORNE
	dw UpdateState_Burnt                    ; ST_BURNT
	dw $4511                                ; ST_UNKNOWN_65
	dw $4599                                ; ST_UNKNOWN_66
	dw $4601                                ; ST_UNKNOWN_67
	dw $4672                                ; ST_UNKNOWN_68
	dw $471f                                ; ST_UNKNOWN_69
	dw $47a2                                ; ST_UNKNOWN_6A
	dw $48e5                                ; ST_UNKNOWN_6B
	dw $494e                                ; ST_UNKNOWN_6C
	dw $4a39                                ; ST_UNKNOWN_6D
	dw $4a5a                                ; ST_UNKNOWN_6E
	dw $4a8a                                ; ST_UNKNOWN_6F
	dw UpdateState_GettingWrappedInString   ; ST_GETTING_WRAPPED_IN_STRING
	dw UpdateState_BallOString              ; ST_BALL_O_STRING
	dw UpdateState_BallOStringAirborne      ; ST_BALL_O_STRING_AIRBORNE
	dw UpdateState_BallOStringKnockBack     ; ST_BALL_O_STRING_KNOCK_BACK
	dw UpdateState_GettingUnwrappedInString ; ST_GETTING_UNWRAPPED_IN_STRING
	dw UpdateState_BallOStringDizzy         ; ST_BALL_O_STRING_DIZZY
	dw $4e70                                ; ST_UNKNOWN_76
	dw $4e87                                ; ST_UNKNOWN_77
	dw $4f39                                ; ST_UNKNOWN_78
	dw $4fc0                                ; ST_UNKNOWN_79
	dw $506d                                ; ST_UNKNOWN_7A
	dw $5123                                ; ST_UNKNOWN_7B
	dw $5243                                ; ST_UNKNOWN_7C
	dw $52e5                                ; ST_UNKNOWN_7D
	dw $53b9                                ; ST_UNKNOWN_7E
	dw $53d0                                ; ST_UNKNOWN_7F
	dw UpdateState_Electric                 ; ST_ELECTRIC
	dw UpdateState_ElectricDizzy            ; ST_ELECTRIC_DIZZY
	dw $572e                                ; ST_UNKNOWN_82
	dw $5816                                ; ST_UNKNOWN_83
	dw $5871                                ; ST_UNKNOWN_84
	dw $58f3                                ; ST_UNKNOWN_85
	dw $5975                                ; ST_UNKNOWN_86
	dw $5a74                                ; ST_UNKNOWN_87
	dw $5b06                                ; ST_UNKNOWN_88
	dw $5ba2                                ; ST_UNKNOWN_89
	dw $5c29                                ; ST_UNKNOWN_8A
	dw $5d6f                                ; ST_UNKNOWN_8B
	dw $5dd3                                ; ST_UNKNOWN_8C
	dw $5e7e                                ; ST_UNKNOWN_8D
	dw $5ef3                                ; ST_UNKNOWN_8E
	dw $5f42                                ; ST_UNKNOWN_8F
	dw $5ffa                                ; ST_UNKNOWN_90
	dw $6087                                ; ST_UNKNOWN_91
	dw $60f9                                ; ST_UNKNOWN_92
	dw $61f5                                ; ST_UNKNOWN_93
	dw $6267                                ; ST_UNKNOWN_94
	dw $62d3                                ; ST_UNKNOWN_95
	dw $6362                                ; ST_UNKNOWN_96
	dw $6489                                ; ST_UNKNOWN_97
	dw $6544                                ; ST_UNKNOWN_98
	dw $65d8                                ; ST_UNKNOWN_99
	dw $6657                                ; ST_UNKNOWN_9A
	dw $66c0                                ; ST_UNKNOWN_9B
	dw $677b                                ; ST_UNKNOWN_9C
	dw $6804                                ; ST_UNKNOWN_9D
	dw $6890                                ; ST_UNKNOWN_9E
	dw $68d2                                ; ST_UNKNOWN_9F
	dw $69b2                                ; ST_UNKNOWN_A0
	dw $6a08                                ; ST_UNKNOWN_A1
	dw $6b18                                ; ST_UNKNOWN_A2
	dw $6b42                                ; ST_UNKNOWN_A3
	dw $6c04                                ; ST_UNKNOWN_A4
	dw $6d06                                ; ST_UNKNOWN_A5
	dw Func_156d                            ; ST_UNKNOWN_A6
	dw Func_156d                            ; ST_UNKNOWN_A7
	dw Func_156d                            ; ST_UNKNOWN_A8
	dw Func_156d                            ; ST_UNKNOWN_A9
	dw Func_156d                            ; ST_UNKNOWN_AA
	dw Func_156d                            ; ST_UNKNOWN_AB
	dw Func_156d                            ; ST_UNKNOWN_AC
	dw Func_156d                            ; ST_UNKNOWN_AD
	dw Func_156d                            ; ST_UNKNOWN_AE
	dw Func_156d                            ; ST_UNKNOWN_AF
; 0x280a6

UpdateState_OnFire: ; 280a6 (a:40a6)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_280d3
	ld a, $0e
	ld [wceed], a
	load_sound SFX_1E

.asm_280d3
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_28100
	ld a, [wc1a8]
	and a
	jr z, .asm_28100
	ld a, $01
	ld [wWarioStateCounter], a

	ld a, [wDirection]
	and a
	jr nz, .asm_280f6
	load_frameset_ptr Frameset_16b14
	jr .asm_28100
.asm_280f6
	load_frameset_ptr Frameset_16b1d
.asm_28100
	update_anim

	call Func_2ae2f
	ld hl, wca90
	ld a, [hli]
	cp $01
	jr nz, .asm_28121
	ld a, [hl]
	cp $2c
	jr nz, .asm_28121
	jr SetState_Hot
.asm_28121
	call Func_2ae8a

	ld a, [wWarioState]
	cp ST_ON_FIRE
	ret nz ; done if not on fire anymore

	farcall Func_198e0
	ld a, b
	and a
	jp z, Func_2af75
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret
; 0x2814a

Func_2814a: ; 2814a (a:414a)
	ld a, $01
	ld [wca90], a
	ld a, $2c
	ld [wca91], a
;	fallthrough

SetState_Hot: ; 28154 (a:4154)
	ld a, $02
	ld [wca8f], a
	ld a, ST_HOT
	ld [wWarioState], a
	xor a
	ld [wceed], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, $04
	ld [wca92], a
	ld a, $04
	ld [wca93], a
	ld a, $02
	ld [wca94], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jr z, .asm_28195
	bit D_RIGHT_F, a
	jr nz, .asm_28190
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jr .asm_28195
.asm_28190
	ld a, DIRECTION_RIGHT
	ld [wDirection], a

.asm_28195
	ld a, [wDirection]
	and a
	jr nz, .asm_281b5
	load_frameset_ptr Frameset_16b26
.asm_281a5
	update_anim
	ret
.asm_281b5
	load_frameset_ptr Frameset_16b2f
	jr .asm_281a5
; 0x281c1

UpdateState_OnFireAirborne: ; 281c1 (a:41c1)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_2ade4
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_2820b
	ld a, [wc1a8]
	and a
	jr z, .asm_2820b
	ld a, $01
	ld [wWarioStateCounter], a

	ld a, [wDirection]
	and a
	jr nz, .asm_28201
	load_frameset_ptr Frameset_16b14
	jr .asm_2820b
.asm_28201
	load_frameset_ptr Frameset_16b1d
.asm_2820b
	update_anim

	call Func_2af9c
	ld a, [wWarioState]
	cp ST_ON_FIRE_AIRBORNE
	ret nz ; done if not on fire and airborne

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_28245
	farcall Func_1996e
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp ST_ON_FIRE_AIRBORNE
	ret nz ; done if not on fire and airborne

	jp Func_2af75
.asm_28245
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_28261
	ld a, [wWarioState]
	cp ST_ON_FIRE_AIRBORNE
	ret nz ; done if not on fire and airborne

	jp Func_14de
.asm_28261
	call Func_14f6
	ld a, [wWarioState]
	cp ST_ON_FIRE_AIRBORNE
	ret nz ; done if not on fire and airborne

	farcall SetState_OnFire
	ret
; 0x2827a

UpdateState_Hot: ; 2827a (a:427a)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_282a7
	ld a, $10
	ld [wceed], a
	load_sound SFX_1F
.asm_282a7
	update_anim
	call Func_2ae2f

	ld hl, wca90
	ld a, [hli]
	cp $00
	jr nz, .asm_282ea
	ld a, [hl]
	cp $e0
	jr z, .asm_282d4
	cp $a4
	jr z, .asm_282dc
	cp $3c
	jr z, .asm_282e4
	cp $01
	jr nz, .asm_282ea
	jr .asm_28313
.asm_282d4
	ld hl, Pals_c830
	call Func_1af6
	jr .asm_282ea
.asm_282dc
	ld hl, Pals_c840
	call Func_1af6
	jr .asm_282ea
.asm_282e4
	ld hl, Pals_c850
	call Func_1af6
.asm_282ea
	call Func_2b07a

	ld a, [wWarioState]
	cp ST_HOT
	ret nz ; done if not in hot state anymore

	farcall Func_198e0
	ld a, b
	and a
	jp z, Func_28380
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret

.asm_28313
	load_sound SFX_22

	ld a, ST_BURNT
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld hl, Pals_c820
	call Func_1af6
	ld a, $09
	ld [wca7b], a
	ld a, $48
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $6b
	ld [wSpritePtr + 0], a
	ld a, $6c
	ld [wSpritePtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_28366
	load_frameset_ptr Frameset_16e47
	jr .asm_28370
.asm_28366
	load_frameset_ptr Frameset_16e72
.asm_28370
	update_anim
	ret
; 0x28380

Func_28380: ; 28380 (a:4380)
	ld a, [wca64]
	and $f0
	add $08
	ld [wca64], a
;	fallthrough

Func_2838a: ; 2838a (a:438a)
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a
	ld a, ST_HOT_AIRBORNE
	ld [wWarioState], a
	ld a, $08
	ld [wWarioStateCounter], a
	ret
; 0x2839f

UpdateState_HotAirborne: ; 2839f (a:439f)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_2ade4
	update_anim
	call Func_2b027
	ld a, [wWarioState]
	cp ST_HOT_AIRBORNE
	ret nz ; done if not hot airborne anymore

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .falling

; raising
	farcall Func_1996e
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp ST_HOT_AIRBORNE
	ret nz ; done if not hot airborne anymore
	jp Func_2838a

.falling
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_28412
	ld a, [wWarioState]
	cp ST_HOT_AIRBORNE
	ret nz ; done if not hot airborne anymore

	jp Func_14de
.asm_28412
	call Func_14f6
	ld a, [wWarioState]
	cp ST_HOT_AIRBORNE
	ret nz ; done if not hot airborne anymore

	jp SetState_Hot
; 0x2841e

UpdateState_Burnt: ; 2841e (a:441e)
	update_anim
	ld a, [wc1a8]
	and a
	ret z
	jp Func_1570
; 0x28435

	INCROM $28435, $28aad

UpdateState_GettingWrappedInString: ; 28aad (a:4aad)
	update_anim
	ld a, [wc1a8]
	and a
	ret z
	farcall Func_198e0

	ld a, b
	and a
	jp z, Func_28c15
;	fallthrough

SetState_BallOString: ; 28ad5 (a:4ad5)
	ld a, ST_BALL_O_STRING
	ld [wWarioState], a
	ld a, $01
	ld [wca8f], a
	xor a
	ld [wceed], a
	ld [wca86], a
	ld [wWarioStateCycles], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ld a, $ff
	ld [wca70], a
	ld a, $e8
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_28b2a
	load_frameset_ptr Frameset_1741f
.asm_28b1a
	update_anim
	ret
.asm_28b2a
	load_frameset_ptr Frameset_173fe
	jr .asm_28b1a
; 0x28b36

UpdateState_BallOString: ; 28b36 (a:4b36)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_28b63
	ld a, $0c
	ld [wceed], a
	load_sound SFX_0A
.asm_28b63
	update_anim
	ld a, [wDirection]
	and a
	jr nz, .asm_28b80
	call Func_151e.asm_153f
	call Func_1270
	jr .asm_28b86
.asm_28b80
	call Func_151e
	call Func_1259
.asm_28b86
	ld a, [wca86]
	cp $18
	jr c, .asm_28b92
	ld a, $14
	ld [wca86], a
.asm_28b92
	farcall Func_19734
	ld a, b
	and $0f
	jr nz, Func_28bd5
	farcall Func_198e0
	ld a, b
	and a
	jp z, Func_28c15

	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [wIsStandingOnSlope]
	and a
	ret z
	and $0f
	dec a
	ld b, a
	ld a, [wDirection]
	xor b
	jr nz, Func_28bd5
	ret

Func_28bd5: ; 28bd5 (a:4bd5) 
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $05
	jr nc, .asm_28c12
	ld a, [wDirection]
	and a
	jr nz, .asm_28c06
	load_frameset_ptr Frameset_1741f
.asm_28bf6
	update_anim
	ret
.asm_28c06
	load_frameset_ptr Frameset_173fe
	jr .asm_28bf6

.asm_28c12
	jp SetState_BallOStringKnockBack
; 0x28c15

Func_28c15: ; 28c15 (a:4c15)
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_HIGH_JUMP
	ld [wJumpVelTable], a
	ld a, ST_BALL_O_STRING_AIRBORNE
	ld [wWarioState], a
	ret
; 0x28c25

UpdateState_BallOStringAirborne: ; 28c25 (a:4c25)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_1570
	update_anim

	farcall Func_19734
	ld a, b
	and $0f
	jp nz, Func_28bd5
	call Func_1488
	call Func_2b1a6
	ld a, [wca86]
	cp $18
	jr c, .asm_28c78
	ld a, $14
	ld [wca86], a
.asm_28c78
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_28c8e
	jp Func_14de
.asm_28c8e
	call Func_14f6
	jp SetState_BallOString
; 0x28c94

SetState_BallOStringKnockBack: ; 28c94 (a:4c94)
	xor a
	ld [wca8f], a
	load_sound SFX_03
	ld a, ST_BALL_O_STRING_KNOCK_BACK
	ld [wWarioState], a
	ld a, $0a
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a

	ld a, $ff
	ld [wca70], a
	ld a, $e5
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_1742a
	update_anim
	ret
; 0x28ceb

UpdateState_BallOStringKnockBack: ; 28ceb (a:4ceb)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_1570
	update_anim
	call Func_2b1cc
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_28d22
	ret

.asm_28d22
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_28d38
	jp Func_14de

.asm_28d38
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	call Func_14f6
	load_sound SFX_3C

	ld a, ST_GETTING_UNWRAPPED_IN_STRING
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
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_17409
	update_anim
	ret
; 0x28d92

UpdateState_GettingUnwrappedInString: ; 28d92 (a:4d92)
	update_anim
	ld a, [wc1a8]
	and a
	ret z

	load_sound SFX_3D
	ld a, ST_BALL_O_STRING_DIZZY
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
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	inc a

	ld [wca8a], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, $04
	ld [wca7b], a
	ld a, $50
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $7b
	ld [wSpritePtr + 0], a
	ld a, $bc
	ld [wSpritePtr + 1], a
	load_frameset_ptr Frameset_17ce2
	update_anim
	ret
; 0x28e1a

UpdateState_BallOStringDizzy: ; 28e1a (a:4e1a)
	update_anim
	ld a, [wc1a8]
	and a
	ret z
	jp Func_1570
; 0x28e31

	INCROM $28e31, $294bf

UpdateState_Electric: ; 294bf (a:54bf)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_1570
	update_anim

	farcall Func_19734
	ld a, b
	and a
	jr nz, .asm_29522
	ld a, [wDirection]
	and a
	jr nz, .asm_29513
	ld b, $01
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_2950e
	inc b
.asm_2950e
	call Func_1270
	jr .asm_29534

.asm_29513
	ld b, $01
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_2951d
	inc b
.asm_2951d
	call Func_1259
	jr .asm_29534

.asm_29522
	ld a, [wDirection]
	and a
	jr nz, .asm_2952f
	ld b, $01
	call Func_1259
	jr .asm_29534
.asm_2952f
	ld b, $01
	call Func_1270
.asm_29534
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_29562
	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp MAX_JUMP_VEL_INDEX
	jp nc, .asm_295d8
	farcall Func_198e0
	ld a, b
	and $0f
	ret nz
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a
	ret

.asm_29562
	ld a, [wJumpVelIndex]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	bit 7, [hl]
	jr z, .falling

; raising
	ld a, [hl]
	cpl
	inc a
	ld b, a
	call Func_129e
	ld hl, wJumpVelIndex
	inc [hl]
	farcall Func_1996e
	ld a, b
	and a
	ret z
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	jr .asm_29562

.falling
	ld b, [hl]
	call Func_1287
	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp MAX_JUMP_VEL_INDEX
	jr c, .asm_295a3
	ld [hl], MAX_JUMP_VEL_INDEX
.asm_295a3
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_295b9
	jp Func_14de
.asm_295b9
	call Func_14f6
	ld a, [wJumpVelTable]
	inc a
	ld [wJumpVelTable], a
	sub $02
	jr z, .asm_295cc
	dec a
	jr z, .asm_295d2
	jr .asm_295d8
.asm_295cc
	ld a, $0a
	ld [wJumpVelIndex], a
	ret
.asm_295d2
	ld a, $0e
	ld [wJumpVelIndex], a
	ret

.asm_295d8
	load_sound SFX_41

	ld a, [wDirection]
	and a
	jr nz, .asm_29601
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	sub $08
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [hld]
	sub $20
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr .asm_2961a

.asm_29601
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	add $08
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [hld]
	sub $20
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
.asm_2961a
	ld b, $08
	farcall Func_c9f3

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a

	ld a, ST_ELECTRIC_DIZZY
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_29658
	load_frameset_ptr Frameset_17b9e
	jr .asm_29662
.asm_29658
	load_frameset_ptr Frameset_17bad
.asm_29662
	update_anim
	ret
; 0x29672

UpdateState_ElectricDizzy: ; 29672 (a:5672)
	update_anim
	ld a, [wc1a8]
	and a
	ret z
	jp Func_1570
; 0x29689

	INCROM $29689, $2ade4

Func_2ade4: ; 2ade4 (a:6de4)
	call Func_1079
	ld a, $10
	ld [wca8c], a
	call Func_161a
	ld hl, wca61
	ld de, hffa8
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ldh a, [hffa9]
	and $f0
	ldh [hffa9], a
	ld b, $07
	farcall Func_c9f3
	load_sound SFX_0D
	farcall Func_1cd7c
	ret
; 0x2ae2f

Func_2ae2f: ; 2ae2f (a:6e2f)
	ld hl, wca91
	ld a, [hl]
	sub $01
	ld [hld], a
	ld a, [hl]
	sbc $00
	ld [hl], a
	ret
; 0x2ae3b

	INCROM $2ae3b, $2ae8a

Func_2ae8a: ; 2ae8a (a:6e8a)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .asm_2aea7
	farcall Func_1996e
	ld a, b
	and a
	jr nz, .asm_2aea7
	jp Func_2af81
.asm_2aea7
	ld a, [wDirection]
	and a
	jr nz, .asm_2aecb
	jr .asm_2aeaf
.asm_2aeaf
	farcall Func_19734
	ld a, b
	and a
	jr nz, .asm_2aef1
	call Func_151e.asm_153f
	call Func_1270
	jp .asm_2aee4 ; should be jr
.asm_2aecb
	farcall Func_19734
	ld a, b
	and a
	jr nz, .asm_2af19
	call Func_151e
	call Func_1259

.asm_2aee4
	ld a, [wca86]
	cp $14
	jr c, .asm_2aef0
	ld a, $10
	ld [wca86], a
.asm_2aef0
	ret

.asm_2aef1
	ld b, $02
	call Func_1259
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_2af0d
	load_frameset_ptr Frameset_16b49
	jr .asm_2af3f
.asm_2af0d
	load_frameset_ptr Frameset_16b1d
	jr .asm_2af3f

.asm_2af19
	ld b, $02
	call Func_1270
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_2af35
	load_frameset_ptr Frameset_16b38
	jr .asm_2af3f
.asm_2af35
	load_frameset_ptr Frameset_16b14
.asm_2af3f
	update_anim

	farcall Func_198e0
	ld a, b
	and a
	ret z
	farcall Func_19734
	ld a, b
	and a
	jp nz, Func_2814a
	ret
; 0x2af75

Func_2af75: ; 2af75 (a:6f75)
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_HIGH_JUMP
	ld [wJumpVelTable], a
	jr SetState_OnFireAirborne

Func_2af81: ; 2af81 (a:6f81)
	load_sound SFX_01

	xor a
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a
;	fallthrough

SetState_OnFireAirborne: ; 2af92 (a:6f92)
	xor a
	ld [wWarioStateCycles], a
	ld a, ST_ON_FIRE_AIRBORNE
	ld [wWarioState], a
	ret
; 0x2af9c

Func_2af9c: ; 2af9c (a:6f9c)
	call Func_1488
	call Func_2b1a6
	ld a, [wca86]
	cp $14
	jr c, .asm_2afae
	ld a, $10
	ld [wca86], a
.asm_2afae
	farcall Func_19734
	ld a, b
	and a
	ret z
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a

	ld a, [wDirection]
	and a
	jr nz, .asm_2aff6
	ld b, $03
	call Func_1270
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_2afea
	load_frameset_ptr Frameset_16b38
	jr .asm_2b017
.asm_2afea
	load_frameset_ptr Frameset_16b14
	jr .asm_2b017
.asm_2aff6
	ld b, $03
	call Func_1259
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_2b00d
	load_frameset_ptr Frameset_16b49
	jr .asm_2b017
.asm_2b00d
	load_frameset_ptr Frameset_16b1d
.asm_2b017
	update_anim
	ret
; 0x2b027

Func_2b027: ; 2b027 (a:7027)
	call Func_1488
	ld hl, wWarioStateCounter
	ld a, [hl]
	and a
	jr z, .asm_2b033
	dec [hl]
	ret

.asm_2b033
	call Func_2b17a
	ld a, [wca86]
	cp $08
	jr c, .asm_2b042
	ld a, $04
	ld [wca86], a
.asm_2b042
	ld a, [wca95]
	and a
	ret z
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_2b060
	load_frameset_ptr Frameset_16b26
	jr .asm_2b06a
.asm_2b060
	load_frameset_ptr Frameset_16b2f
.asm_2b06a
	update_anim
	ret
; 0x2b07a

Func_2b07a: ; 2b07a (a:707a)
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	ret z
	and D_RIGHT
	jr nz, .asm_2b0c7
	ld a, [wDirection]
	and a
	jr z, .asm_2b0af

	ld a, DIRECTION_LEFT
	ld [wDirection], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_16b26
	update_anim
.asm_2b0af
	farcall Func_19734
	ld a, b
	and a
	ret nz
	ld b, $01
	call Func_1270
	ret

.asm_2b0c7
	ld a, [wDirection]
	and a
	jr nz, .asm_2b0f2

	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_16b2f
	update_anim

.asm_2b0f2
	farcall Func_19734
	ld a, b
	and a
	ret nz
	ld b, $01
	call Func_1259
	ret
; 0x2b10a

	INCROM $2b10a, $2b17a

Func_2b17a: ; 2b17a (a:717a)
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_2b186
	bit D_LEFT_F, a
	jr nz, .asm_2b196
	ret
.asm_2b186
	farcall Func_1f0ed
	ret
.asm_2b196
	farcall Func_1f104
	ret
; 0x2b1a6

Func_2b1a6: ; 2b1a6 (a:71a6)
	ld a, [wDirection]
	and a
	jr nz, .asm_2b1bc
	farcall Func_1f104
	ret

.asm_2b1bc
	farcall Func_1f0ed
	ret
; 0x2b1cc

Func_2b1cc: ; 2b1cc (a:71cc)
	ld a, [wDirection]
	and a
	jr nz, .asm_2b1f1
	ld b, $02
	call Func_1270
	farcall Func_197b1

	ld a, b
	and a
	jr z, .asm_2b20e
	ld b, $02
	call Func_1259
	jr .asm_2b20e
.asm_2b1f1
	ld b, $02
	call Func_1259
	farcall Func_19741
	ld a, b
	and a
	jr z, .asm_2b20e
	ld b, $02
	call Func_1270

.asm_2b20e
	ld a, [wJumpVelIndex]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	bit 7, [hl]
	jr z, .falling

; raising
	ld a, [hl]
	cpl
	inc a
	ld b, a
	call Func_129e
	ld hl, wJumpVelIndex
	inc [hl]
	jr .asm_2b238
.falling
	ld b, [hl]
	call Func_1287
	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp MAX_JUMP_VEL_INDEX
	jr c, .asm_2b238
	ld [hl], MAX_JUMP_VEL_INDEX
.asm_2b238
	ret
; 0x2b239

	INCROM $2b239, $2c000
