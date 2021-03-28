Func_28000: ; 28000 (a:4000)
	ld a, [wWarioState]
	sub $60
	jumptable

	dw UpdateState_OnFire                     ; ST_ON_FIRE
	dw UpdateState_OnFireAirborne             ; ST_ON_FIRE_AIRBORNE
	dw UpdateState_Hot                        ; ST_HOT
	dw UpdateState_HotAirborne                ; ST_HOT_AIRBORNE
	dw UpdateState_Burnt                      ; ST_BURNT
	dw UpdateState_GettingFlatAirborne        ; ST_GETTING_FLAT_AIRBORNE
	dw UpdateState_GettingFlat                ; ST_GETTING_FLAT
	dw UpdateState_FlatIdling                 ; ST_FLAT_IDLING
	dw UpdateState_FlatWalking                ; ST_FLAT_WALKING
	dw UpdateState_FlatJumping                ; ST_FLAT_JUMPING
	dw UpdateState_FlatFalling                ; ST_FLAT_FALLING
	dw UpdateState_FlatStretching             ; ST_FLAT_STRETCHING
	dw UpdateState_FlatSinking                ; ST_FLAT_SINKING
	dw UpdateState_FlatStretchingUnderwater   ; ST_FLAT_STRETCHING_UNDERWATER
	dw UpdateState_FlatSquished               ; ST_FLAT_SQUISHED
	dw UpdateState_FlatSquishedLifting        ; ST_FLAT_SQUISHED_LIFTING
	dw UpdateState_GettingWrappedInString     ; ST_GETTING_WRAPPED_IN_STRING
	dw UpdateState_BallOString                ; ST_BALL_O_STRING
	dw UpdateState_BallOStringAirborne        ; ST_BALL_O_STRING_AIRBORNE
	dw UpdateState_BallOStringKnockBack       ; ST_BALL_O_STRING_KNOCK_BACK
	dw UpdateState_GettingUnwrappedInString   ; ST_GETTING_UNWRAPPED_IN_STRING
	dw UpdateState_BallOStringDizzy           ; ST_BALL_O_STRING_DIZZY
	dw UpdateState_FatBumping                 ; ST_FAT_BUMPING
	dw UpdateState_FatEating                  ; ST_FAT_EATING
	dw UpdateState_FatIdling                  ; ST_FAT_IDLING
	dw UpdateState_FatWalking                 ; ST_FAT_WALKING
	dw UpdateState_FatTurning                 ; ST_FAT_TURNING
	dw UpdateState_FatAirborne                ; ST_FAT_AIRBORNE
	dw UpdateState_FatLanding                 ; ST_FAT_LANDING
	dw UpdateState_FatSinking                 ; ST_FAT_SINKING
	dw UpdateState_FatRecovering              ; ST_FAT_RECOVERING
	dw $53d0                                  ; ST_UNKNOWN_7F
	dw UpdateState_Electric                   ; ST_ELECTRIC
	dw UpdateState_ElectricDizzy              ; ST_ELECTRIC_DIZZY
	dw UpdateState_TurningInvisible           ; ST_TURNING_INVISIBLE
	dw UpdateState_PuffyInflating             ; ST_PUFFY_INFLATING
	dw UpdateState_PuffyRaising               ; ST_PUFFY_RAISING
	dw UpdateState_PuffyTurning               ; ST_PUFFY_TURNING
	dw UpdateState_PuffyDeflating             ; ST_PUFFY_DEFLATING
	dw UpdateState_ZombieIdling               ; ST_ZOMBIE_IDLING
	dw UpdateState_ZombieWalking              ; ST_ZOMBIE_WALKING
	dw UpdateState_ZombieTurning              ; ST_ZOMBIE_TURNING
	dw UpdateState_ZombieAirborne             ; ST_ZOMBIE_AIRBORNE
	dw UpdateState_ZombieLanding              ; ST_ZOMBIE_LANDING
	dw UpdateState_ZombieSlippingThroughFloor ; ST_ZOMBIE_SLIPPING_THROUGH_FLOOR
	dw UpdateState_ZombieRecovering           ; ST_ZOMBIE_RECOVERING
	dw UpdateState_ZombieKnockBack            ; ST_ZOMBIE_KNOCK_BACK
	dw UpdateState_ZombieWrithing             ; ST_ZOMBIE_WRITHING
	dw UpdateState_BouncyStart                ; ST_BOUNCY_START
	dw UpdateState_BouncyFloor                ; ST_BOUNCY_FLOOR
	dw UpdateState_BouncyAirborne             ; ST_BOUNCY_AIRBORNE
	dw UpdateState_BouncyCeiling              ; ST_BOUNCY_CEILING
	dw UpdateState_BouncyUpsideDown           ; ST_BOUNCY_UPSIDE_DOWN
	dw UpdateState_BouncyUpsideLanding        ; ST_BOUNCY_UPSIDE_DOWN_LANDING
	dw UpdateState_BouncyLastBounce           ; ST_BOUNCY_LAST_BOUNCE
	dw $6489                                  ; ST_UNKNOWN_97
	dw $6544                                  ; ST_UNKNOWN_98
	dw $65d8                                  ; ST_UNKNOWN_99
	dw $6657                                  ; ST_UNKNOWN_9A
	dw $66c0                                  ; ST_UNKNOWN_9B
	dw $677b                                  ; ST_UNKNOWN_9C
	dw $6804                                  ; ST_UNKNOWN_9D
	dw $6890                                  ; ST_UNKNOWN_9E
	dw $68d2                                  ; ST_UNKNOWN_9F
	dw $69b2                                  ; ST_UNKNOWN_A0
	dw $6a08                                  ; ST_UNKNOWN_A1
	dw $6b18                                  ; ST_UNKNOWN_A2
	dw $6b42                                  ; ST_UNKNOWN_A3
	dw $6c04                                  ; ST_UNKNOWN_A4
	dw $6d06                                  ; ST_UNKNOWN_A5
	dw Func_156d                              ; ST_UNKNOWN_A6
	dw Func_156d                              ; ST_UNKNOWN_A7
	dw Func_156d                              ; ST_UNKNOWN_A8
	dw Func_156d                              ; ST_UNKNOWN_A9
	dw Func_156d                              ; ST_UNKNOWN_AA
	dw Func_156d                              ; ST_UNKNOWN_AB
	dw Func_156d                              ; ST_UNKNOWN_AC
	dw Func_156d                              ; ST_UNKNOWN_AD
	dw Func_156d                              ; ST_UNKNOWN_AE
	dw Func_156d                              ; ST_UNKNOWN_AF
; 0x280a6

UpdateState_OnFire: ; 280a6 (a:40a6)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 14
	ld [wSFXLoopCounter], a
	load_sound SFX_1E
.skip_sfx

	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_28100
	ld a, [wAnimationHasFinished]
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
	update_anim_1

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
	ld [wSFXLoopCounter], a
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
	update_anim_1
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
	ld a, [wAnimationHasFinished]
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
	update_anim_1

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

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 16
	ld [wSFXLoopCounter], a
	load_sound SFX_1F
.skip_sfx
	update_anim_1

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
	load_oam_ptr OAM_16b6c

	ld a, [wDirection]
	and a
	jr nz, .asm_28366
	load_frameset_ptr Frameset_16e47
	jr .asm_28370
.asm_28366
	load_frameset_ptr Frameset_16e72
.asm_28370
	update_anim_1
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
	update_anim_1
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
	update_anim_1
	ld a, [wAnimationHasFinished]
	and a
	ret z
	jp Func_1570
; 0x28435

	INCROM $28435, $28511

UpdateState_GettingFlatAirborne: ; 28511 (a:4511)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, SetState_FlatSinking
	ld b, $02
	call Func_1287
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_28549
	jp Func_14de

.asm_28549
	call Func_14f6

	ld a, ST_GETTING_FLAT
	ld [wWarioState], a

	xor a
	ld [wca86], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCycles], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wca9b], a
	inc a
	ld [wca8a], a
	ld a, $ff
	ld [wca70], a
	ld a, $f8
	ld [wca6f], a
	ld a, $f5
	ld [wca71], a
	ld a, $0b
	ld [wca72], a

	load_frameset_ptr Frameset_1715f
	update_anim_1
	ret
; 0x28599

UpdateState_GettingFlat: ; 28599 (a:4599)
	update_anim_1

	ld a, [wAnimationHasFinished]
	and a
	ret z
	xor a
	ld [wca8a], a
	ld a, [wWarioStateCounter]
	and a
	jp nz, SetState_FlatSquished
;	fallthrough

SetState_FlatIdling: ; 285b8 (a:45b8)
	ld a, ST_FLAT_IDLING
	ld [wWarioState], a

	xor a
	ld [wca86], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ld a, $ff
	ld [wca70], a
	ld a, $f8
	ld [wca6f], a
	ld a, $f5
	ld [wca71], a
	ld a, $0b
	ld [wca72], a

	load_frameset_ptr Frameset_1718b
	update_anim_1
	ret
; 0x28601

UpdateState_FlatIdling: ; 28601 (a:4601)
	update_anim_1

	call Func_2b10a
	farcall Func_198e0
	ld a, b
	and a
	ret nz
	jp SetState_FlatFalling
; 0x28628

SetState_FlatWalking: ; 28628 (a:4628)
	ld a, ST_FLAT_WALKING
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wca86], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

	load_frameset_ptr Frameset_17175
	update_anim_1

	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_2866c
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	ret
.asm_2866c
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	ret
; 0x28672

UpdateState_FlatWalking: ; 28672 (a:4672)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 10
	ld [wSFXLoopCounter], a
	load_sound SFX_FLAT_WALK
.skip_sfx
	update_anim_1

	call Func_2b11b
	farcall Func_198e0
	ld a, b
	and a
	jp z, SetState_FlatFalling

	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret
; 0x286d1

SetState_FlatJumping: ; 286d1 (a:46d1)
	load_sound SFX_1D

	ld a, ST_FLAT_JUMPING
	ld [wWarioState], a

	xor a
	ld [wca86], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelIndex], a
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr nz, .asm_286fc
	ld a, JUMP_VEL_KNOCK_BACK
	jr .asm_286fe
.asm_286fc
	ld a, JUMP_VEL_NORMAL
.asm_286fe
	ld [wJumpVelTable], a

	load_frameset_ptr Frameset_17190
	update_anim_1

	ld a, [wcac9]
	and a
	ret z
;	fallthrough

UpdateState_FlatJumping: ; 2871f (a:471f)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	call Func_1488
	call Func_2b17a
	call Func_1762
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, SetState_FlatFalling
	farcall Func_1996e
	ld a, b
	and a
	ret z
;	fallthrough

SetState_FlatFalling: ; 28757 (a:4757)
	ld a, ST_FLAT_FALLING
	ld [wWarioState], a

	xor a
	ld [wca86], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsStandingOnSlope], a
	inc a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld a, [wDirection]
	and a
	jr nz, .asm_28796

	load_frameset_ptr Frameset_171b8
.asm_28786
	update_anim_1
	ret
.asm_28796
	load_frameset_ptr Frameset_17186
	jr .asm_28786
; 0x287a2

UpdateState_FlatFalling: ; 287a2 (a:47a2)
	farcall Func_19b25

	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, SetState_FlatSinking

	ld a, [wAnimationHasFinished]
	and a
	jr nz, .asm_287ff
	update_anim_1

	ld a, [wAnimationHasFinished]
	and a
	jr z, .asm_287ff

	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	load_frameset_ptr Frameset_17190
	update_anim_1

	ld a, $01
	ld [wAnimationHasFinished], a
.asm_287ff
	ld hl, wca86
	ld e, [hl]
	ld d, $00
	inc [hl]

	push de
	ld a, [wDirection]
	and a
	jp nz, .asm_288ad
	ld hl, Data_2b68c
	add hl, de
	ld b, [hl]
	call Func_1270

.asm_28816
	ld a, [wca86]
	cp $28
	jr nc, .asm_28857
	farcall Func_19734
	ld a, b
	and a
	jp z, .asm_288b8
	load_sound SFX_03

	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a

	ld a, [wDirection]
	and a
	jr nz, .asm_2884e
	ld b, $03
	call Func_1270
	jr .asm_28853
.asm_2884e
	ld b, $03
	call Func_1259
.asm_28853
	ld a, $00
	jr .asm_288a8
.asm_28857
	ld a, [wDirection]
	and a
	jr nz, .asm_28866

	ld a, [wJoypadDown]
	bit D_LEFT_F, a
	jr nz, .asm_288a7
	jr .asm_2886d
.asm_28866
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_288a7

.asm_2886d
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wAnimationHasFinished], a

	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	and a
	jr nz, .asm_2888e
	load_frameset_ptr Frameset_171b8
	jr .asm_28898
.asm_2888e
	load_frameset_ptr Frameset_17186
.asm_28898
	update_anim_1

.asm_288a7
	xor a
.asm_288a8
	ld [wca86], a
	pop de
	ret

.asm_288ad
	ld hl, Data_2b68c
	add hl, de
	ld b, [hl]
	call Func_1259
	jp .asm_28816

.asm_288b8
	pop de
	ld hl, Data_2b664
	add hl, de
	ld b, [hl]
	call Func_1287
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_288d7
	jp Func_14de
.asm_288d7
	load_sound SFX_20
	call Func_14f6
	jp SetState_FlatIdling
; 0x288e5

UpdateState_FlatStretching: ; 288e5 (a:48e5)
	update_anim_1

	ld a, [wAnimationHasFinished]
	and a
	ret z
	xor a
	ld [wca9b], a
	jp Func_1570
; 0x28900

SetState_FlatSinking: ; 28900 (a:4900)
	ld a, ST_FLAT_SINKING
	ld [wWarioState], a

	xor a
	ld [wca86], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	inc a
	ld [wca8a], a
	ld a, $ff
	ld [wca70], a
	ld a, $f8
	ld [wca6f], a
	ld a, $f5
	ld [wca71], a
	ld a, $0b
	ld [wca72], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	load_frameset_ptr Frameset_1719a
	update_anim_1
	ret
; 0x2894e

UpdateState_FlatSinking: ; 2894e (a:494e)
	update_anim_1

	farcall Func_19b25

	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc08f]
	and $0f
	call z, .Func_2899a

	ld a, [wc08f]
	and $01
	ret nz
	ld b, $01
	call Func_1287
	farcall Func_198e0
	ld a, b
	and a
	ret z
	jr Func_289c5

.Func_2899a
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	sub $04
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
	ld b, $09
	farcall Func_c9f3
	ret
; 0x289c5

Func_289c5: ; 289c5 (a:49c5)
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	sub $04
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
	ld b, $09
	farcall Func_c9f3

	ld a, ST_FLAT_STRETCHING_UNDERWATER
	ld [wWarioState], a

	xor a
	ld [wca86], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld a, $ff
	ld [wca70], a
	ld a, $f8
	ld [wca6f], a
	ld a, $f5
	ld [wca71], a
	ld a, $0b
	ld [wca72], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	load_frameset_ptr Frameset_171a3
	update_anim_1
	ret
; 0x28a39

UpdateState_FlatStretchingUnderwater: ; 28a39 (a:4a39)
	update_anim_1

	ld a, [wAnimationHasFinished]
	and a
	ret z
	jp Func_2ad6a
; 0x28a50

SetState_FlatSquished: ; 28a50 (a:4a50)
	ld a, ST_FLAT_SQUISHED
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	ret
; 0x28a5a

UpdateState_FlatSquished: ; 28a5a (a:4a5a)
	ret
; 0x28a5b

	INCROM $28a5b, $28a8a

UpdateState_FlatSquishedLifting: ; 28a8a (a:4a8a)
	update_anim_1

	ld b, $01
	call Func_129e
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $32
	ret c
	xor a
	ld [wca8a], a
	jp SetState_FlatFalling
; 0x28aad

UpdateState_GettingWrappedInString: ; 28aad (a:4aad)
	update_anim_1
	ld a, [wAnimationHasFinished]
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
	ld [wSFXLoopCounter], a
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
	update_anim_1
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

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 12
	ld [wSFXLoopCounter], a
	load_sound SFX_ROLL
.skip_sfx
	update_anim_1

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
	update_anim_1
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
	update_anim_1

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
	update_anim_1
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
	update_anim_1
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
	update_anim_1
	ret
; 0x28d92

UpdateState_GettingUnwrappedInString: ; 28d92 (a:4d92)
	update_anim_1
	ld a, [wAnimationHasFinished]
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
	load_oam_ptr OAM_17bbc
	load_frameset_ptr Frameset_17ce2
	update_anim_1
	ret
; 0x28e1a

UpdateState_BallOStringDizzy: ; 28e1a (a:4e1a)
	update_anim_1
	ld a, [wAnimationHasFinished]
	and a
	ret z
	jp Func_1570
; 0x28e31

	INCROM $28e31, $28e70

UpdateState_FatBumping: ; 28e70 (a:4e70)
	update_anim_1
	ld a, [wAnimationHasFinished]
	and a
	ret z
	jp SetState_FatIdling
; 0x28e87

UpdateState_FatEating: ; 28e87 (a:4e87)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_2926a
	ld a, [wJumpVelTable]
	and a
	jr z, .asm_28ecd
	call Func_1488
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_28ec3
	jp Func_14de

.asm_28ec3
	call Func_14f6
	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
.asm_28ecd
	update_anim_1
	ld a, [wAnimationHasFinished]
	and a
	ret z
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
;	fallthrough

SetState_FatIdling: ; 28eeb (a:4eeb)
	ld a, ST_FAT_IDLING
	ld [wWarioState], a
	ld a, $03
	ld [wca93], a
	ld a, $03
	ld [wca92], a
	ld a, $01
	ld [wca94], a

	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_28f2d
	load_frameset_ptr Frameset_1781c
.asm_28f1d
	update_anim_1
	ret
.asm_28f2d
	load_frameset_ptr Frameset_1781f
	jr .asm_28f1d
; 0x28f39

UpdateState_FatIdling: ; 28f39 (a:4f39)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	call Func_28f6d
	ld a, [wWarioState]
	cp ST_FAT_IDLING
	ret nz ; done if not fat idling anymore

	farcall Func_198e0
	ld a, b
	and a
	jp z, Func_290d6
	ret
; 0x28f6d

Func_28f6d: ; 28f6d (a:4f6d)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, Func_290a1
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jr nz, SetState_FatWalking
	ret
; 0x28f7d

SetState_FatWalking: ; 28f7d (a:4f7d)
	xor a
	ld [wca86], a
	ld a, ST_FAT_WALKING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wJumpVelIndex], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_28fb4
	load_frameset_ptr Frameset_17822
.asm_28fa4
	update_anim_1
	ret
.asm_28fb4
	load_frameset_ptr Frameset_1782b
	jr .asm_28fa4
; 0x28fc0

UpdateState_FatWalking: ; 28fc0 (a:4fc0)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 28
	ld [wSFXLoopCounter], a
	load_sound SFX_FAT_WALK
.skip_sfx
	update_anim_1

	call Func_2ae2f
	ld hl, wca90
	ld a, [hli]
	cp $02
	jp nc, SetState_FatRecovering
	or [hl]
	jp z, SetState_FatRecovering
	call Func_2b239
	ld a, [wWarioState]
	cp ST_FAT_WALKING
	ret nz ; done if not fat walking anymore
	farcall Func_198e0

	ld a, b
	and a
	jp z, Func_290d6
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret
; 0x29035

SetState_FatTurning: ; 29035 (a:5035)
	ld a, ST_FAT_TURNING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_29061
	load_frameset_ptr Frameset_178f3
.asm_29051
	update_anim_1
	ret
.asm_29061
	load_frameset_ptr Frameset_178ea
	jr .asm_29051
; 0x2906d

UpdateState_FatTurning: ; 2906d (a:506d)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	update_anim_1
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, Func_290a1
	ld a, [wAnimationHasFinished]
	and a
	ret z
	jp SetState_FatWalking

Func_290a1: ; 290a1 (a:50a1)
	ld a, $01
	ldh [hSoundID], a
	ld a, $01
	ldh [$ffb6], a
	xor a
	ld [wJumpVelIndex], a
	ld [wca96], a
	ld [wWarioStateCounter], a
	ld a, $01
	ld [wJumpVelTable], a
	ld a, [wDirection]
	and a
	jr nz, .asm_290ca
	load_frameset_ptr Frameset_17834
	jr .asm_290d4
.asm_290ca
	load_frameset_ptr Frameset_17839
.asm_290d4
	jr SetState_FatAirborne

Func_290d6: ; 290d6 (a:50d6)
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, $01
	ld [wca96], a
	ld [wWarioStateCounter], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a

	ld a, [wDirection]
	and a
	jr nz, .asm_290fa
	load_frameset_ptr Frameset_1783e
	jr SetState_FatAirborne
.asm_290fa
	load_frameset_ptr Frameset_17841
;	fallthrough

SetState_FatAirborne: ; 29104 (a:5104)
	xor a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wca68], a
	update_anim_1
	ld a, ST_FAT_AIRBORNE
	ld [wWarioState], a
	ret
; 0x29123

UpdateState_FatAirborne: ; 29123 (a:5123)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_2926a
	call Func_2ae2f
	ld hl, wca90
	ld a, [hli]
	or [hl]
	jr nz, .asm_2914b
	inc [hl]
.asm_2914b
	update_anim_1
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_2919d
	ld a, [wAnimationHasFinished]
	and a
	jr z, .asm_2919d
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, $01
	ld [wWarioStateCounter], a
	ld a, [wDirection]
	and a
	jr nz, .asm_29184
	load_frameset_ptr Frameset_1783e
	jr .asm_2918e
.asm_29184
	load_frameset_ptr Frameset_17841
.asm_2918e
	update_anim_1

.asm_2919d
	call Func_2b2a4
	ld a, [wWarioState]
	cp ST_FAT_AIRBORNE
	ret nz ; done if not fat airborne anymore

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_291c8
	farcall Func_1996e
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp ST_FAT_AIRBORNE
	ret nz ; done if not fat airborne anymore
	jp Func_290d6

.asm_291c8
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_291de
	jp Func_14de
.asm_291de
	call Func_14f6
	ld a, [wca97]
	and a
	jr nz, .asm_291f1
	ld a, $20
	ld [wca97], a
	ld a, $01
	ld [wca98], a
.asm_291f1
	ld a, [wc1aa]
	and a
	jr nz, SetState_FatLanding
	load_sound SFX_24
;	fallthrough

SetState_FatLanding: ; 291ff (a:51ff)
	ld a, ST_FAT_LANDING
	ld [wWarioState], a
	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ld [wca96], a
	ld [wWarioStateCounter], a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_29229
	load_frameset_ptr Frameset_17872
	jr .asm_29233
.asm_29229
	load_frameset_ptr Frameset_17887
.asm_29233
	update_anim_1
	ret
; 0x29243

UpdateState_FatLanding: ; 29243 (a:5243)
	call Func_2ae2f
	ld hl, wca90
	ld a, [hli]
	cp $02
	jp nc, SetState_FatRecovering
	or [hl]
	jp z, SetState_FatRecovering
	update_anim_1
	ld a, [wca97]
	and a
	ret nz
	jp SetState_FatIdling
; 0x2926a

Func_2926a: ; 2926a (a:526a)
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
	ld b, $03
	farcall Func_c9f3
	load_sound SFX_0D

	ld a, ST_FAT_SINKING
	ld [wWarioState], a
	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ld [wca96], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wca68], a
	inc a
	ld [wca8a], a

	ld a, [wDirection]
	and a
	jr nz, .asm_292cb
	load_frameset_ptr Frameset_17872
	jr .asm_292d5
.asm_292cb
	load_frameset_ptr Frameset_17887
.asm_292d5
	update_anim_1
	ret
; 0x292e5

UpdateState_FatSinking: ; 292e5 (a:52e5)
	update_anim_1
	ld a, [wc08f]
	and $0f
	call z, Func_29317
	ld b, $01
	call Func_1287
	farcall Func_198e0
	ld a, b
	and a
	ret z
	call Func_2ad6a
	ret
; 0x29317

Func_29317: ; 29317 (a:5317)
	ld a, [wDirection]
	and a
	jr nz, .asm_29338
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	sub $04
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [hld]
	sub $10
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr .asm_29351
.asm_29338
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	add $04
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [hld]
	sub $10
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
.asm_29351
	ld b, $09
	farcall Func_c9f3
	ret
; 0x29363

SetState_FatRecovering: ; 29363 (a:5363)
	ld a, ST_FAT_RECOVERING
	ld [wWarioState], a
	ld a, $02
	ld [wca93], a
	ld a, $02
	ld [wca92], a
	ld a, $02
	ld [wca94], a

	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ld [wca96], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_2939f
	load_frameset_ptr Frameset_17844
	jr .asm_293a9
.asm_2939f
	load_frameset_ptr Frameset_1785b
.asm_293a9
	update_anim_1
	ret
; 0x293b9

UpdateState_FatRecovering: ; 293b9 (a:53b9)
	update_anim_1
	ld a, [wAnimationHasFinished]
	and a
	ret z
	jp Func_1570
; 0x293d0

	INCROM $293d0, $294bf

UpdateState_Electric: ; 294bf (a:54bf)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_1570
	update_anim_1

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
	update_anim_1
	ret
; 0x29672

UpdateState_ElectricDizzy: ; 29672 (a:5672)
	update_anim_1
	ld a, [wAnimationHasFinished]
	and a
	ret z
	jp Func_1570
; 0x29689

	INCROM $29689, $2972e

UpdateState_TurningInvisible: ; 2972e (a:572e)
	update_anim_1
	ld a, [wAnimationHasFinished]
	and a
	ret z
	xor a
	ld [wca8a], a
	ld a, $06
	ld [wca8e], a
	call Func_161a
	farcall SetState_Idling
	ret
; 0x2975e

	INCROM $2975e, $29816

UpdateState_PuffyInflating: ; 29816 (a:5816)
	ld a, [wOAMBank]
	ldh [hCallFuncBank], a
	call_hram UpdateAnimation

	ld a, [wAnimationHasFinished]
	and a
	ret z
;	fallthrough

SetState_PuffyRaising: ; 2982b (a:582b)
	ld a, ST_PUFFY_RAISING
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wFrameDuration], a
	ld [wca68], a
	inc a
	ld [wJumpVelTable], a

	ld hl, Pals_c800
	call Func_1af6

	ld a, [wDirection]
	and a
	jr nz, .asm_29856
	ld a, $4d
	ld [wFramesetPtr], a
	ld a, $4e
	ld [$ca82], a
	jr .asm_29860
.asm_29856
	ld a, $4d
	ld [wFramesetPtr], a
	ld a, $57
	ld [$ca82], a
.asm_29860
	ld a, [wOAMBank]
	ldh [hCallFuncBank], a
	call_hram UpdateAnimation
	ret
; 0x29871

UpdateState_PuffyRaising: ; 29871 (a:5871)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 32
	ld [wSFXLoopCounter], a
	load_sound SFX_PUFF_RAISE
.skip_sfx

	ld a, [wOAMBank]
	ldh [hCallFuncBank], a
	call_hram UpdateAnimation

	call Func_2b2c2
	ret
; 0x298b2

SetState_PuffyTurning: ; 298b2 (a:58b2)
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a

	ld a, ST_PUFFY_TURNING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_298d8
	ld a, $4c
	ld [wFramesetPtr], a
	ld a, $e3
	ld [$ca82], a
	jr .asm_298e2
.asm_298d8
	ld a, $4c
	ld [wFramesetPtr], a
	ld a, $d8
	ld [$ca82], a
.asm_298e2
	ld a, [wOAMBank]
	ldh [hCallFuncBank], a
	call_hram UpdateAnimation
	ret
; 0x298f3

UpdateState_PuffyTurning: ; 298f3 (a:58f3)
	ld a, [wOAMBank]
	ldh [hCallFuncBank], a
	call_hram UpdateAnimation

	call Func_2b342
	farcall Func_1996e

	ld a, [wWarioState]
	cp ST_PUFFY_TURNING
	ret nz ; done if not puffy turning any more

	ld a, b
	and a
	jr z, .asm_29922
	jp SetState_PuffyDeflating

.asm_29922
	ld a, [wAnimationHasFinished]
	and a
	ret z
	jp SetState_PuffyRaising
; 0x2992a

SetState_PuffyDeflating: ; 2992a (a:592a)
	load_sound SFX_27

	ld a, ST_PUFFY_DEFLATING
	ld [wWarioState], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wca68], a
	inc a
	ld [wca8a], a

	ld a, [wDirection]
	and a
	jr nz, .asm_2995a
	ld a, $4c
	ld [wFramesetPtr], a
	ld a, $ee
	ld [$ca82], a
	jr .asm_29964
.asm_2995a
	ld a, $4d
	ld [wFramesetPtr], a
	ld a, $1e
	ld [$ca82], a
.asm_29964
	ld a, [wOAMBank]
	ldh [hCallFuncBank], a
	call_hram UpdateAnimation
	ret
; 0x29975

UpdateState_PuffyDeflating: ; 29975 (a:5975)
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_299b8

	ld a, [wOAMBank]
	ldh [hCallFuncBank], a
	call_hram UpdateAnimation

	ld a, [wAnimationHasFinished]
	and a
	ret z
	ld a, $01
	ld [wWarioStateCounter], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_299ae
	ld a, $4d
	ld [wFramesetPtr], a
	ld a, $01
	ld [$ca82], a
	jr .asm_299b8
.asm_299ae
	ld a, $4d
	ld [wFramesetPtr], a
	ld a, $31
	ld [$ca82], a
.asm_299b8
	ld a, [wOAMBank]
	ldh [hCallFuncBank], a
	call_hram UpdateAnimation

	ld a, [wAnimationHasFinished]
	and a
	ret z
	jp Func_1570
; 0x299d0

SetState_ZombieIdling: ; 299d0 (a:59d0)
	ld a, ST_ZOMBIE_IDLING
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
	ld [wca93], a
	ld a, $04
	ld [wca92], a
	ld a, $02
	ld [wca94], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca8d], a
	ld [wca9a], a
	ld [wca89], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wca8b], a
	ld [wca9d], a
	ld [wca96], a
	call Func_161a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld hl, Pals_c890
	call Func_1af6

	ld a, $0b
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_1fc48b

	ld a, [wDirection]
	and a
	jr nz, .asm_29a5a
	load_frameset_ptr Frameset_1fc8b6
	jr .asm_29a64
.asm_29a5a
	load_frameset_ptr Frameset_1fc8b9
.asm_29a64
	update_anim_2
	ret
; 0x29a74

UpdateState_ZombieIdling: ; 29a74 (a:5a74)
	farcall Func_19b25
	ld a, [wWarioState]
	cp ST_ZOMBIE_IDLING
	ret nz ; done if not zombie idling anymore

	farcall Func_198e0
	ld a, [wWarioState]
	cp ST_ZOMBIE_IDLING
	ret nz ; done if not zombie idling anymore

	ld a, b
	and a
	jp z, Func_29bb9
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	update_anim_2
	call Func_2b34e
	ret
; 0x29ac1

SetState_ZombieWalking: ; 29ac1 (a:5ac1)
	xor a
	ld [wSFXLoopCounter], a
	ld [wca86], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a

	ld a, ST_ZOMBIE_WALKING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_29aec
	load_frameset_ptr Frameset_1fc870
	jr .asm_29af6
.asm_29aec
	load_frameset_ptr Frameset_1fc879
.asm_29af6
	update_anim_2
	ret
; 0x29b06

UpdateState_ZombieWalking: ; 29b06 (a:5b06)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 36
	ld [wSFXLoopCounter], a
	load_sound SFX_ZOMBIE_WALK
.skip_sfx
	update_anim_2

	call Func_2b381

	ld a, [wWarioState]
	cp ST_ZOMBIE_WALKING
	ret nz ; done if not zombie walking anymore

	farcall Func_198e0
	ld a, b
	and a
	jr z, Func_29bb9

	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret
; 0x29b6a

SetState_ZombieTurning: ; 29b6a (a:5b6a)
	ld a, ST_ZOMBIE_TURNING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_29b88
	load_frameset_ptr Frameset_1fc89d
	jr .asm_29b92
.asm_29b88
	load_frameset_ptr Frameset_1fc894
.asm_29b92
	update_anim_2
	ret
; 0x29ba2

UpdateState_ZombieTurning: ; 29ba2 (a:5ba2)
	update_anim_2
	ld a, [wAnimationHasFinished]
	and a
	ret z
	jp SetState_ZombieWalking
; 0x29bb9

Func_29bb9: ; 29bb9 (a:5bb9)
	ld a, [wDirection]
	and a
	jr nz, .asm_29bcb
	load_frameset_ptr Frameset_1fc8b0
	jr .asm_29bd5
.asm_29bcb
	load_frameset_ptr Frameset_1fc8b3

.asm_29bd5
	ld a, $01
	ld [wWarioStateCounter], a
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	jr SetState_ZombieAirborne

Func_29be1: ; 29be1 (a:5be1)
	ld a, [wDirection]
	and a
	jr nz, .asm_29bf3
	load_frameset_ptr Frameset_1fc8a6
	jr .asm_29bfd
.asm_29bf3
	load_frameset_ptr Frameset_1fc8ab

.asm_29bfd
	xor a
	ld [wWarioStateCounter], a
	ld [wJumpVelIndex], a
;	fallthrough

SetState_ZombieAirborne: ; 29c04 (a:5c04)
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a
	xor a
	ld [wWarioStateCycles], a
	ld a, ST_ZOMBIE_AIRBORNE
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	update_anim_2
	ret
; 0x29c29

UpdateState_ZombieAirborne: ; 29c29 (a:5c29)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_1570
	ld a, [wWarioState]
	cp ST_ZOMBIE_AIRBORNE
	ret nz ; done if not zombie airborne anymore

	call Func_2b3dd
	ld a, [wWarioState]
	cp ST_ZOMBIE_AIRBORNE
	ret nz ; done if not zombie airborne anymore

	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_29c88
	ld a, [wAnimationHasFinished]
	and a
	jr z, .asm_29c88
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	inc a
	ld [wWarioStateCounter], a

	ld a, [wDirection]
	and a
	jr nz, .asm_29c7e
	load_frameset_ptr Frameset_1fc8b0
	jr .asm_29c88
.asm_29c7e
	load_frameset_ptr Frameset_1fc8b3
.asm_29c88
	update_anim_2
	ld a, [wWarioState]
	cp ST_ZOMBIE_AIRBORNE
	ret nz ; done if not zombie airborne anymore

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_29cbf
	farcall Func_1996e
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp ST_ZOMBIE_AIRBORNE
	ret nz ; done if not zombie airborne anymore
	jp Func_29bb9

.asm_29cbf
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_29cd5
	jp Func_14de
.asm_29cd5
	call Func_14f6
	ld a, [wWarioState]
	cp ST_ZOMBIE_AIRBORNE
	ret nz ; done if not zombie airborne anymore
;	fallthrough

SetState_ZombieLanding: ; 29cde (a:5cde)
	load_sound SFX_2A
	ld a, $02
	ld [wca93], a
	ld a, $02
	ld [wca92], a
	ld a, $02
	ld [wca94], a

	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a

	ld a, ST_ZOMBIE_LANDING
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	ld [wFrameDuration], a
	ld [wca68], a
	farcall Func_19a77
	ld a, [wc1ca]
	and a
	jr z, .asm_29d43

	ld a, $01
	ld [wWarioStateCounter], a

	ld a, [wDirection]
	and a
	jr nz, .asm_29d37
	load_frameset_ptr Frameset_1fc8bc
	jr .asm_29d5f
.asm_29d37
	load_frameset_ptr Frameset_1fc8d5
	jr .asm_29d5f

.asm_29d43
	ld a, [wDirection]
	and a
	jr nz, .asm_29d55
	load_frameset_ptr Frameset_1fc948
	jr .asm_29d5f
.asm_29d55
	load_frameset_ptr Frameset_1fc953
.asm_29d5f
	update_anim_2
	ret
; 0x29d6f

UpdateState_ZombieLanding: ; 29d6f (a:5d6f)
	update_anim_2
	ld a, [wAnimationHasFinished]
	and a
	ret z
	ld a, [wWarioStateCounter]
	dec a
	jr z, .asm_29d8c
	jp SetState_ZombieIdling

.asm_29d8c
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a
	ld a, $06
	ld [wWarioStateCycles], a

	ld a, ST_ZOMBIE_SLIPPING_THROUGH_FLOOR
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_29db9
	load_frameset_ptr Frameset_1fc928
	jr .asm_29dc3
.asm_29db9
	load_frameset_ptr Frameset_1fc92b
.asm_29dc3
	update_anim_2
	ret
; 0x29dd3

UpdateState_ZombieSlippingThroughFloor: ; 29dd3 (a:5dd3)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_1570
	ld a, [wWarioState]
	cp ST_ZOMBIE_SLIPPING_THROUGH_FLOOR
	ret nz ; done if not slipping through floor anymore

	call Func_2b3dd
	update_anim_2
	ld a, [wWarioState]
	cp ST_ZOMBIE_SLIPPING_THROUGH_FLOOR
	ret nz ; done if not slipping through floor anymore

	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_29e2a
	ld a, [wWarioState]
	cp ST_ZOMBIE_SLIPPING_THROUGH_FLOOR
	ret nz ; done if not slipping through floor anymore
	jp Func_14de

.asm_29e2a
	call Func_14f6
	ld a, [wWarioState]
	cp ST_ZOMBIE_SLIPPING_THROUGH_FLOOR
	ret nz ; done if not slipping through floor anymore

	call SetState_ZombieLanding

	ld a, [wDirection]
	and a
	jr nz, .asm_29e48
	load_frameset_ptr Frameset_1fc8ee
	jr .asm_29e52
.asm_29e48
	load_frameset_ptr Frameset_1fc90b
.asm_29e52
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wAnimationHasFinished], a
	ld a, $02
	ld [wWarioStateCounter], a
	update_anim_2
	ret
; 0x29e71

	INCROM $29e71, $29e7e

UpdateState_ZombieRecovering: ; 29e7e (a:5e7e)
	ld a, [wc08f]
	and $03
	ret nz
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hli]
	cp $08
	jr c, .asm_29e95
	cp $0b
	jr z, .asm_29ea5
	dec [hl]
	ld a, [hl]
	jr .asm_29e96
.asm_29e95
	ld [hl], a
.asm_29e96
	add a
	add a
	add a
	add a ; *16
	ld e, a
	ld d, $00
	ld hl, Pals_c890
	add hl, de
	call Func_1af6
	ret

.asm_29ea5
	jp Func_1570
; 0x29ea8

	INCROM $29ea8, $29ef3

UpdateState_ZombieKnockBack: ; 29ef3 (a:5ef3)
	update_anim_2
	ld a, [wAnimationHasFinished]
	and a
	ret z
	jp SetState_ZombieIdling
; 0x29f0a

SetState_ZombieWrithing: ; 29f0a (a:5f0a)
	ld a, ST_ZOMBIE_WRITHING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_29f28
	load_frameset_ptr Frameset_1fc882
	jr .asm_29f32
.asm_29f28
	load_frameset_ptr Frameset_1fc88b
.asm_29f32
	update_anim_2
	ret
; 0x29f42

UpdateState_ZombieWrithing: ; 29f42 (a:5f42)
	update_anim_2
	ld a, [wJoypadDown]
	and a
	jp nz, SetState_ZombieIdling
	ret
; 0x29f59

	INCROM $29f59, $29ffa

UpdateState_BouncyStart: ; 29ffa (a:5ffa)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_1570
	call Func_1488
	call Func_2b1a6
	ld a, [wca86]
	cp $08
	jr c, .asm_2a029
	ld a, $04
	ld [wca86], a

.asm_2a029
	ld a, [wWarioState]
	cp ST_BOUNCY_START
	ret nz ; done if not bouncy start anymore

	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_2a04b
	ld a, [wWarioState]
	cp ST_BOUNCY_START
	ret nz ; done if not bouncy start anymore
	jp Func_14de

.asm_2a04b
	call Func_14f6
	ld a, [wWarioState]
	cp ST_BOUNCY_START
	ret nz ; done if not bouncy start anymore
;	fallthrough

SetState_BouncyFloor: ; 2a054 (a:6054)
	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wca86], a
	ld a, ST_BOUNCY_FLOOR
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_1fcc5f
	update_anim_2
	ret
; 0x2a087

UpdateState_BouncyFloor: ; 2a087 (a:6087)
	call Func_2ae2f
	ld hl, wca90
	ld a, [hli]
	or [hl]
	jp z, Func_2a2e7
	call Func_2ae3b
	update_anim_2

	ld a, [wAnimationHasFinished]
	and a
	ret z

	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jr nz, .asm_2a0bb
	jr .asm_2a0c2

	; these lines are the same as above
	; and are completely redundant
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jr nz, .asm_2a0bb
	jr .asm_2a0c2

.asm_2a0bb
	ld a, JUMP_VEL_BOUNCY_HIGH_JUMP
	ld [wJumpVelTable], a
	jr .asm_2a0c7
.asm_2a0c2
	ld a, JUMP_VEL_BOUNCY_JUMP
	ld [wJumpVelTable], a
.asm_2a0c7
	xor a
	ld [wJumpVelIndex], a
;	fallthrough

SetState_BouncyAirborne: ; 2a0cb (a:60cb)
	ld a, ST_BOUNCY_AIRBORNE
	ld [wWarioState], a
	load_sound SFX_2B

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_1fcc6c
	update_anim_2
	ret
; 0x2a0f9

UpdateState_BouncyAirborne: ; 2a0f9 (a:60f9)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_1570
	ld a, [wAnimationHasFinished]
	and a
	jr nz, .asm_2a15a
	update_anim_2

	ld a, [wJumpVelTable]
	cp JUMP_VEL_BOUNCY_HIGH_JUMP
	jr nz, .asm_2a15a
	ld a, [wAnimationHasFinished]
	and a
	jr z, .asm_2a15a

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
	ld b, $0a
	farcall Func_c9f3

.asm_2a15a
	call Func_2ae2f
	ld hl, wca90
	ld a, [hli]
	or [hl]
	jp z, SetState_BouncyUpsideDown
	call Func_2ae3b
	call Func_1488
	call Func_2b17a
	ld a, [wca86]
	cp $08
	jr c, .asm_2a17a
	ld a, $04
	ld [wca86], a
.asm_2a17a
	ld a, [wWarioState]
	cp ST_BOUNCY_AIRBORNE
	ret nz ; done if not bouncy airborne any more

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .falling

; raising
	farcall Func_1996e
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp ST_BOUNCY_AIRBORNE
	ret nz ; done if not bouncy airborne any more

	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	jr .asm_2a1ce

.falling
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_2a1c2
	ld a, [wWarioState]
	cp ST_BOUNCY_AIRBORNE
	ret nz ; done if not bouncy airborne any more
	jp Func_14de

.asm_2a1c2
	call Func_14f6
	ld a, [wWarioState]
	cp ST_BOUNCY_AIRBORNE
	ret nz ; done if not bouncy airborne any more
	jp SetState_BouncyFloor

.asm_2a1ce
	xor a
	ld a, $93
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_1fcc75
	update_anim_2
	ret
; 0x2a1f5

UpdateState_BouncyCeiling: ; 2a1f5 (a:61f5)
	call Func_2ae2f
	ld hl, wca90
	ld a, [hli]
	or [hl]
	jr z, SetState_BouncyUpsideDown
	call Func_2ae3b
	update_anim_2

	ld a, [wAnimationHasFinished]
	and a
	ret z
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	jp SetState_BouncyAirborne
; 0x2a21e

SetState_BouncyUpsideDown: ; 2a21e (a:621e)
	ld a, ST_BOUNCY_UPSIDE_DOWN
	ld [wWarioState], a
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a

	xor a
	ld [wWarioStateCycles], a
	ld a, $05
	ld [wca93], a
	ld a, $05
	ld [wca92], a
	ld a, $02
	ld [wca94], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld hl, Pals_c910
	call Func_1af6

	load_frameset_ptr Frameset_1fcc82
	update_anim_2
	ret
; 0x2a267

UpdateState_BouncyUpsideDown: ; 2a267 (a:6267)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_1570
	call Func_1488
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_2a29d
	jp Func_14de

.asm_2a29d
	call Func_14f6
	ld a, [wWarioState]
	cp ST_BOUNCY_UPSIDE_DOWN
	ret nz ; done if not bouncy upside down

	ld a, ST_BOUNCY_UPSIDE_DOWN_LANDING
	ld [wWarioState], a
	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_1fcc85
	update_anim_2
	ret
; 0x2a2d3

UpdateState_BouncyUpsideLanding: ; 2a2d3 (a:62d3)
	update_anim_2
	ld a, [wAnimationHasFinished]
	and a
	ret z
;	fallthrough

Func_2a2e7: ; 2a2e7 (a:62e7)
	ld a, $05
	ld [wca93], a
	ld a, $05
	ld [wca92], a
	ld a, $02
	ld [wca94], a

	ld hl, Pals_c910
	call Func_1af6

	ld a, [wDirection]
	and a
	jr nz, .asm_2a30e
	load_frameset_ptr Frameset_1fccbf
	jr .asm_2a318
.asm_2a30e
	load_frameset_ptr Frameset_1fccb2
.asm_2a318
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	jr SetState_BouncyLastBounce

	ld a, [wDirection]
	and a
	jr nz, .asm_2a333
	load_frameset_ptr Frameset_1fcca5
	jr .asm_2a33d
.asm_2a333
	load_frameset_ptr Frameset_1fcc98
.asm_2a33d
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
;	fallthrough

SetState_BouncyLastBounce: ; 2a344 (a:6344)
	ld a, ST_BOUNCY_LAST_BOUNCE
	ld [wWarioState], a
	xor a
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a
	update_anim_2
	ret
; 0x2a362

UpdateState_BouncyLastBounce: ; 2a362 (a:6362)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_1570
	ld a, [wAnimationHasFinished]
	and a
	jr nz, .asm_2a394
	update_anim_2

.asm_2a394
	call Func_1488
	call Func_2b1a6
	ld a, [wca86]
	cp $08
	jr c, .asm_2a3a6
	ld a, $04
	ld [wca86], a
.asm_2a3a6
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_2a3cb
	farcall Func_1996e
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp ST_BOUNCY_LAST_BOUNCE
	ret nz ; done if not in last bouncy any more

	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ret

.asm_2a3cb
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_2a3e1
	jp Func_14de

.asm_2a3e1
	call Func_14f6
	ld a, [wWarioState]
	cp ST_BOUNCY_LAST_BOUNCE
	ret nz ; done if not in last bouncy any more
	jp Func_1570
; 0x2a3ed

	INCROM $2a3ed, $2ad6a

Func_2ad6a: ; 2ad6a (a:6d6a)
	call Func_1079
	ld a, $10
	ld [wca8c], a
	call Func_161a
	farcall SetState_Submerged

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	inc a
	ld [wWarioStateCycles], a
	ld hl, Pals_c800
	call Func_1af6
	ld a, $04
	ld [wca7b], a
	ld a, $60
	ld [wca7c], a
	ld a, $00
	ld [$ca7d], a
	call Func_15b0
	load_oam_ptr OAM_15254

	ld a, [wDirection]
	and a
	jr nz, .asm_2adc8
	load_frameset_ptr Frameset_155a6
	jr .asm_2add2
.asm_2adc8
	load_frameset_ptr Frameset_155ab
.asm_2add2
	update_anim_1
	jp Func_1070
; 0x2ade4

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

Func_2ae3b: ; 2ae3b (a:6e3b)
	call Func_2ae5c
	ret nc
	ld de, $0
	ld a, [wWarioStateCycles]
	xor $1
	ld [wWarioStateCycles], a
	jr z, .asm_2ae54
	ld hl, Pals_c920
	add hl, de
	call Func_1af6
	ret

.asm_2ae54
	ld hl, Pals_c910
	add hl, de
	call Func_1af6
	ret
; 0x2ae5c

Func_2ae5c: ; 2ae5c (a:6e5c)
	ld hl, wca90
	ld a, [hli]
	cp $02
	jr nc, .no_carry
	and a
	jr z, .asm_2ae6e
	ld a, [hl]
	cp $68
	jr nc, .no_carry
	jr .asm_2ae7e

.asm_2ae6e
	ld a, [hl]
	cp $78
	jr nc, .asm_2ae7e
	ld a, [wc08f]
	and $03
	jr nz, .no_carry
	ld a, $01
	jr .set_carry
.asm_2ae7e
	ld a, [wc08f]
	and $0f
	jr nz, .no_carry

.set_carry
	scf
	ret

.no_carry
	scf
	ccf
	ret
; 0x2ae8a

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
	update_anim_1

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
	load_sound SFX_JUMP

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
	update_anim_1
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
	update_anim_1
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
	update_anim_1
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
	update_anim_1

.asm_2b0f2
	farcall Func_19734
	ld a, b
	and a
	ret nz
	ld b, $01
	call Func_1259
	ret
; 0x2b10a

Func_2b10a: ; 2b10a (a:710a)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, SetState_FlatJumping
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_FlatWalking
	ret
; 0x2b11b

Func_2b11b: ; 2b11b (a:711b)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, SetState_FlatJumping
	ld a, [wJoypadDown]
	bit D_LEFT_F, a
	jr nz, .asm_2b131
	bit D_RIGHT_F, a
	jr nz, .asm_2b150
	jp SetState_FlatIdling

.asm_2b131
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	farcall Func_19734
	ld a, b
	and a
	ret nz
	call Func_151e.asm_153f
	call Func_1270
	jr .asm_2b16d

.asm_2b150
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	farcall Func_19734
	ld a, b
	and a
	ret nz
	call Func_151e
	call Func_1259

.asm_2b16d
	ld a, [wca86]
	cp $04
	jr c, .asm_2b179
	ld a, $00
	ld [wca86], a
.asm_2b179
	ret
; 0x2b17a

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

Func_2b239: ; 2b239 (a:7239)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, Func_290a1
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_2b24f
	bit D_LEFT_F, a
	jr nz, .asm_2b279
	jp SetState_FatIdling

.asm_2b24f
	ld a, [wDirection]
	and a
	jr z, .asm_2b271
	farcall Func_1f11b
	ld a, [wca86]
	cp $08
	jr c, .asm_2b270
	ld a, $04
	ld [wca86], a
.asm_2b270
	ret

.asm_2b271
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jp SetState_FatTurning

.asm_2b279
	ld a, [wDirection]
	cp $00
	jr nz, .asm_2b29c
	farcall Func_1f135
	ld a, [wca86]
	cp $08
	jr c, .asm_2b29b
	ld a, $04
	ld [wca86], a
.asm_2b29b
	ret
.asm_2b29c
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jp SetState_FatTurning
; 0x2b2a4

Func_2b2a4: ; 2b2a4 (a:72a4)
	call Func_1488
	call Func_2b17a
	ld a, [wca86]
	cp $08
	jr c, .asm_2b2b6
	ld a, $04
	ld [wca86], a
.asm_2b2b6
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	ret nz
	ld a, $01
	ld [wca96], a
	ret
; 0x2b2c2

Func_2b2c2: ; 2b2c2 (a:72c2)
	call Func_2b342
	farcall Func_1996e
	ld a, [wWarioState]
	cp ST_PUFFY_RAISING
	ret nz ; done if not puffy raising

	ld a, b
	and a
	jr z, .asm_2b2e1
	jp SetState_PuffyDeflating

.asm_2b2e1
	ld a, [wc0ba]
	and $0f
	cp $08
	jr c, .asm_2b2f6
	call Func_114e
	ld a, [wca78]
	sub c
	jr nc, .asm_2b2f6
	call Func_11d6

.asm_2b2f6
	ld a, [wDirection]
	and a
	jr nz, .asm_2b31f
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jp nz, SetState_PuffyTurning
	bit D_LEFT_F, a
	ret z
	farcall Func_197b1
	ld a, b
	and a
	ret nz
	ld b, $01
	call Func_1270
	ret

.asm_2b31f
	ld a, [wJoypadDown]
	bit D_LEFT_F, a
	jp nz, SetState_PuffyTurning
	bit D_RIGHT_F, a
	ret z
	farcall Func_19741
	ld a, b
	and a
	ret nz
	ld b, $01
	call Func_1259
	ret
; 0x2b342

Func_2b342: ; 2b342 (a:7342)
	ld a, [wc08f]
	and $01
	ret nz
	ld b, $01
	call Func_129e
	ret
; 0x2b34e

Func_2b34e: ; 2b34e (a:734e)
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jp nz, Func_29be1
	and D_RIGHT | D_LEFT
	jp nz, SetState_ZombieWalking

	farcall Func_198e0
	ld a, b
	and a
	jp z, Func_29bb9

	ld hl, wWarioStateCounter
	ld a, [hl]
	add $01
	ld [hli], a
	ld a, [hl]
	adc $00
	ld [hl], a
	cp $02
	ret c
	jp SetState_ZombieWrithing

	ret ; unnecessary
; 0x2b381

Func_2b381: ; 2b381 (a:7381)
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jp nz, Func_29be1
	bit D_RIGHT_F, a
	jr nz, .asm_2b394
	bit D_LEFT_F, a
	jr nz, .asm_2b3b3
	jp SetState_ZombieIdling

.asm_2b394
	ld a, [wDirection]
	and a
	jr z, .asm_2b3ab
	farcall Func_1f11b
	jr .asm_2b3c8

.asm_2b3ab
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jp SetState_ZombieTurning
.asm_2b3b3
	ld a, [wDirection]
	and a
	jr nz, .asm_2b3d5
	farcall Func_1f135
.asm_2b3c8
	ld a, [wca86]
	cp $04
	jr c, .asm_2b3d4
	ld a, $00
	ld [wca86], a
.asm_2b3d4
	ret
.asm_2b3d5
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jp SetState_ZombieTurning
; 0x2b3dd

Func_2b3dd: ; 2b3dd (a:73dd)
	call Func_1488
	ld hl, wWarioStateCycles
	ld a, [hl]
	and a
	jr z, .asm_2b3e9
	dec [hl]
	ret

.asm_2b3e9
	call Func_2b17a
	ld a, [wca86]
	cp $04
	jr c, .asm_2b3f8
	ld a, $00
	ld [wca86], a
.asm_2b3f8
	ret
; 0x2b3f9

	INCROM $2b3f9, $2b664

Data_2b664: ; 2b664 (a:7664)
	db $03
	db $02
	db $02
	db $01
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $01
	db $01
	db $02
	db $01
	db $01
	db $01
	db $01
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $01
	db $00
	db $01
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
; 0x2b68c

Data_2b68c: ; 2b68c (a:768c)
	db $03
	db $02
	db $01
	db $01
	db $00
	db $00
	db $01
	db $00
	db $00
	db $01
	db $01
	db $00
	db $01
	db $01
	db $01
	db $01
	db $01
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $02
	db $02
	db $02
	db $01
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $01
	db $00
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $00
	db $01
	db $00
	db $00
	db $00
; 0x2b6e4
