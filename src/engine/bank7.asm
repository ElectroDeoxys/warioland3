Func_1c000: ; 1c000 (7:4000)
	ld hl, wcac2
	ld a, [hl]
	and a
	jr z, .asm_1c008
	dec [hl]
.asm_1c008
	call Func_1f6dc
	call Func_1f64a
	ld a, [wWarioState]
	cp $30
	jr c, .asm_1c04d
	cp $60
	jr c, .asm_1c03d
	cp $b0
	jr c, .asm_1c02d
	farcall Func_1ec000
	ret

.asm_1c02d
	farcall Func_28000
	ret

.asm_1c03d
	farcall Func_19c1b
	ret

.asm_1c04d
	jumptable

	dw UpdateState_Idling ; ST_IDLING
	dw UpdateState_Walking ; ST_WALKING
	dw UpdateState_Turning ; ST_TURNING
	dw Func_156d ; ST_UNKNOWN_03
	dw UpdateState_Airborne ; ST_AIRBORNE
	dw UpdateState_Landing ; ST_LANDING
	dw UpdateState_CrouchSliding ; ST_CROUCH_SLIDING
	dw UpdateState_Attacking ; ST_ATTACKING
	dw UpdateState_AttackingAirborne ; ST_ATTACKING_AIRBORNE
	dw UpdateState_AttackKnockBack ; ST_ATTACK_KNOCK_BACK
	dw UpdateState_Diving ; ST_DIVING
	dw UpdateState_Submerged ; ST_SUBMERGED
	dw $5008 ; ST_WATER_SURFACE_IDLING
	dw $50ba ; ST_WATER_SURFACE_MOVING
	dw $5297 ; ST_UNDERWATER_THRUSTING
	dw $5354 ; ST_UNKNOWN_0F
	dw $5395 ; ST_UNKNOWN_10
	dw $5455 ; ST_UNKNOWN_11
	dw $546d ; ST_CROUCHING
	dw $54a7 ; ST_CROUCH_WALKING
	dw $5522 ; ST_UNKNOWN_14
	dw $5627 ; ST_STUNG
	dw $5766 ; ST_UNKNOWN_16
	dw $57c1 ; ST_UNKNOWN_17
	dw $580d ; ST_UNKNOWN_18
	dw $585c ; ST_UNKNOWN_19
	dw $58f8 ; ST_SMASH_ATTACKING
	dw Func_156d ; ST_UNKNOWN_1B
	dw Func_156d ; ST_UNKNOWN_1C
	dw Func_156d ; ST_UNKNOWN_1D
	dw $5916 ; ST_UNKNOWN_1E
	dw $5943 ; ST_UNKNOWN_1F
	dw $5995 ; ST_UNKNOWN_20
	dw $5a4f ; ST_UNKNOWN_21
	dw $5cfc ; ST_UNKNOWN_22
	dw $5d7f ; ST_UNKNOWN_23
	dw $5e88 ; ST_UNKNOWN_24
	dw $5eaa ; ST_UNKNOWN_25
	dw $5ecc ; ST_UNKNOWN_26
	dw $5fd4 ; ST_SLIDING
	dw $609d ; ST_ROLLING
	dw $61e9 ; ST_UNKNOWN_29
	dw $62c5 ; ST_UNKNOWN_2A
	dw $6347 ; ST_UNKNOWN_2B
	dw $63e8 ; ST_ENTERING_DOOR
	dw Func_156d ; ST_UNKNOWN_2D
	dw Func_156d ; ST_UNKNOWN_2E
	dw Func_156d ; ST_UNKNOWN_2F
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
; 1c0b6

UpdateState_Idling: ; 1c0b6 (7:40b6)
	farcall Func_198e0
	ld a, [wWarioState]
	cp ST_IDLING
	ret nz ; not idling
	ld a, b
	and a
	jp z, Func_1c2ae

	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [wWarioState]
	cp ST_IDLING
	ret nz ; not idling
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr z, .asm_1c115

; pressing down, handle what state to change to
	farcall Func_19b12
	ld a, [wWarioState]
	cp ST_IDLING
	ret nz ; not idling
	ld a, [wLadderInteraction]
	cp $02
	jp nz, Func_1e855
	farcall SetState_LadderClimbing
	ret

.asm_1c115
	update_anim

	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wLadderInteraction]
	and a
	jr z, .skip_ladder
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .skip_ladder
	farcall SetState_LadderClimbing
	ret
.skip_ladder
	ld a, [wc1c8]
	and a
	jr z, .asm_1c174
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .asm_1c174
	farcall Func_1ae68
	ret

.asm_1c174
	ld a, [wWarioState]
	cp ST_IDLING
	ret nz ; not idling
	call HandleInput_Idling
	ld a, [wWarioState]
	cp ST_IDLING
	ret nz ; not idling

; still idling, increment idle counter
	ld a, [wcac9]
	and a
	ret nz
	ld a, [wWarioStateCounter]
	add 1
	ld [wWarioStateCounter], a
	ld a, [wWarioStateCycles]
	adc 0
	ld [wWarioStateCycles], a
; if the idle cycles reaches a certain value
; then change the state to sleeping
	cp NUM_SLEEPING_IDLE_CYCLES
	ret c
	farcall SetState_Sleeping
	ret
; 0x1c1ab

UpdateState_Walking: ; 1c1ab (7:41ab)
	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_1c1c2
	ld a, $24
	ld [wceed], a
	load_sound SFX_04
.asm_1c1c2
	update_anim

	ld a, [wc1a8]
	and a
	jr z, .asm_1c1f9
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
	ld b, $04
	farcall Func_c9f3

.asm_1c1f9
	call HandleInput_Walking
	ld a, [wWarioState]
	cp ST_WALKING
	ret nz ; return if not walking anymore

	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wWarioState]
	cp ST_WALKING
	ret nz ; return if not walking anymore

	farcall Func_198e0
	ld a, [wWarioState]
	cp ST_WALKING
	ret nz ; return if not walking anymore

	ld a, b
	and a
	jp z, Func_1c2ae
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret
; 0x1c244

UpdateState_Turning: ; 1c244 (7:4244)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, StartJump_FromInput
	bit B_BUTTON_F, a
	jp nz, SetState_Attacking
	update_anim
	ld a, [wc1a8]
	and a
	ret z
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, HandleInput_Idling.no_turning
	jp SetState_Idling
; 0x1c270

	INCROM $1c270, $1c2ae

Func_1c2ae: ; 1c2ae (7:42ae)
	xor a ; FALSE
	ld [wJumpingUpwards], a
;	fallthrough

Func_1c2b2: ; 1c2b2 (7:42b2)
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	jr StartJump

StartJump_FromInput: ; 1c2b9 (7:42b9)
	load_sound SFX_01
	xor a
	ld [wJumpVelIndex], a
	ld [wca96], a
	ld a, TRUE
	ld [wJumpingUpwards], a
;	fallthrough

StartJump: ; 1c2cd (7:42cd)
	ld a, [wPowerUpLevel]
	cp POWER_UP_HIGH_JUMP_BOOTS
	ld a, JUMP_VEL_NORMAL
	jr c, .asm_1c2df
	ld hl, wJoypadDown
	bit D_UP_F, [hl]
	jr z, .asm_1c2df
	ld a, JUMP_VEL_HIGH_JUMP
.asm_1c2df
	ld [wJumpVelTable], a

	xor a
	ld [wc189], a
	ld a, ST_AIRBORNE
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca8b], a
	ld [wca89], a
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
	ld a, $78
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $59
	ld [wSpritePtr + 0], a
	ld a, $55
	ld [wSpritePtr + 1], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1c345
	load_frameset_ptr Frameset_15f94
	jr .asm_1c34f
.asm_1c345
	load_frameset_ptr Frameset_15f97
.asm_1c34f
	update_anim
	ld a, [wcac9]
	and a
	ret z
	ld b, $02
	call Func_129e
	ret
; 0x1c369

UpdateState_Airborne: ; 1c369 (7:4369)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr c, .asm_1c3f2
	ld a, [wc0db]
	and a
	jp nz, Func_1cd48
	ld a, [wcaa0]
	and a
	jr z, .asm_1c3a3
	farcall Func_1a0e8
	ret

.asm_1c3a3
	ld a, [wLadderInteraction]
	and a
	jr z, .asm_1c3c0
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .asm_1c3c0
	farcall SetState_LadderClimbing
	ret

.asm_1c3c0
	ld a, [wWarioState]
	cp ST_AIRBORNE
	ret nz ; done if not airborne anymore

	farcall Func_19afb
	ld a, [wc1c8]
	and a
	jr z, .asm_1c3f2
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .asm_1c3f2
	farcall Func_1ae68
	ret

.asm_1c3f2
	ld a, [wWarioState]
	cp ST_AIRBORNE
	ret nz ; done if not airborne anymore

	call Func_1f077
	ld a, [wWarioState]
	cp ST_AIRBORNE
	ret nz ; done if not airborne anymore

	ld a, [wPowerUpLevel]
	cp POWER_UP_LEAD_OVERALLS
	jr c, .asm_1c43d
	ld a, [wca96]
	and a
	jr nz, .asm_1c430
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr c, .asm_1c43d
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr z, .asm_1c43d
	ld a, $01
	ld [wca96], a
.asm_1c421
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1c48d
	jr .asm_1c46e

.asm_1c430
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr nz, .asm_1c43d
	xor a
	ld [wca96], a
	jr .asm_1c449
.asm_1c43d
	ld a, [wca95]
	and a
	jr z, .asm_1c4aa
	ld a, [wca96]
	and a
	jr nz, .asm_1c421
.asm_1c449

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1c462
	load_frameset_ptr Frameset_15f94
	jr .asm_1c4aa
.asm_1c462
	load_frameset_ptr Frameset_15f97
	jr .asm_1c4aa
.asm_1c46e
	ld a, [wPowerUpLevel]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jr nc, .asm_1c481
	load_frameset_ptr Frameset_15f8e
	jr .asm_1c4aa
.asm_1c481
	load_frameset_ptr Frameset_1604e
	jr .asm_1c4aa
.asm_1c48d
	ld a, [wPowerUpLevel]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jr nc, .asm_1c4a0
	load_frameset_ptr Frameset_15f91
	jr .asm_1c4aa
.asm_1c4a0
	load_frameset_ptr Frameset_16055
.asm_1c4aa
	update_anim

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1c4ea
	farcall Func_1996e
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp ST_AIRBORNE
	ret nz ; done if not airborne anymore

	ld a, [wced2]
	and a
	jp nz, Func_1c2b2
	ld a, [wca64]
	and $f0
	add $08
	ld [wca64], a
	ret

.asm_1c4ea
	farcall Func_199e9
	ld a, [wWarioState]
	cp ST_AIRBORNE
	ret nz ; done if not airborne anymore

	ld a, b
	and a
	jr nz, .asm_1c506
	jp Func_14de
.asm_1c506

	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
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
	ld b, $04
	farcall Func_c9f3

	ld a, [wJumpVelIndex]
	cp MAX_JUMP_VEL_INDEX
	jr c, .asm_1c541
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jr z, .asm_1c58a
.asm_1c541
	call Func_1501
	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld a, [wca96]
	and a
	jr z, .asm_1c55c
	ld a, [wPowerUpLevel]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jp c, Func_1c66b
	jp Func_1c5fd
.asm_1c55c
	ld a, [wJoypadDown]
	and D_DOWN
	jp nz, Func_1e855
	ld a, $e5
	ld [wca6f], a
	farcall Func_1996e
	ld a, b
	and a
	jr z, .asm_1c57f
	jp Func_1e855
.asm_1c57f
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_Walking
	jp SetState_Idling

.asm_1c58a
	call Func_1501
	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wca86], a
	ld a, [wca96]
	and a
	jr z, .asm_1c5ad
	ld a, [wPowerUpLevel]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jp c, Func_1c66b
	jr Func_1c5fd
.asm_1c5ad
	ld a, [wJoypadDown]
	and D_DOWN
	jp nz, Func_1e855
	load_sound SFX_10
	ld a, ST_LANDING
	ld [wWarioState], a
	ld a, $05
	ld [wSpriteBank], a
	ld a, $59
	ld [wSpritePtr + 0], a
	ld a, $55
	ld [wSpritePtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1c5e3
	load_frameset_ptr Frameset_15f9a
	jr .asm_1c5ed
.asm_1c5e3
	load_frameset_ptr Frameset_15fa1
.asm_1c5ed
	update_anim
	ret
; 0x1c5fd

Func_1c5fd: ; 1c5fd (7:45fd)
	ld a, [wca97]
	and a
	jr nz, .asm_1c60d
	ld a, $20
	ld [wca97], a
	ld a, $01
	ld [wca98], a
.asm_1c60d
	ld a, [wc1aa]
	and a
	jr nz, .asm_1c61b
	load_sound SFX_02
.asm_1c61b
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, $04
	ld [wca7b], a
	ld a, $78
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $59
	ld [wSpritePtr + 0], a
	ld a, $55
	ld [wSpritePtr + 1], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1c650
	load_frameset_ptr Frameset_15fb8
	jr .asm_1c65a
.asm_1c650
	load_frameset_ptr Frameset_15fc5
.asm_1c65a
	update_anim
	jr SetState_SmashAttacking

Func_1c66b: ; 1c66b (7:466b)
	load_sound SFX_33
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, $04
	ld [wca7b], a
	ld a, $78
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $59
	ld [wSpritePtr + 0], a
	ld a, $55
	ld [wSpritePtr + 1], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1c6a8
	load_frameset_ptr Frameset_15ff2
	jr .asm_1c6b2
.asm_1c6a8
	load_frameset_ptr Frameset_16009
.asm_1c6b2
	update_anim
;	fallthrough

SetState_SmashAttacking: ; 1c6c1 (7:46c1)
	ld a, $81
	ld [wca96], a
	ld a, ST_SMASH_ATTACKING
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld a, $ff
	ld [wca70], a
	ld a, $e5
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ret
; 0x1c6ed

UpdateState_Landing: ; 1c6ed (7:46ed)
	ld a, [wJoypadPressed]
	and D_RIGHT | D_LEFT
	jr nz, .asm_1c70a
	update_anim
	ld a, [wc1a8]
	and a
	jr nz, .asm_1c70d
	ret
.asm_1c70a
	jp HandleInput_Idling.no_turning

.asm_1c70d
	ld a, [wJumpingUpwards]
	and a
	jr nz, .jumping_upwards
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jr nz, .jump
.jumping_upwards
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .jump
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jp nz, Func_1e855
	jp SetState_Idling

.jump
	call StartJump_FromInput
	ld a, [wPowerUpLevel]
	cp POWER_UP_HIGH_JUMP_BOOTS
	ret c
	ld a, JUMP_VEL_HIGH_JUMP
	ld [wJumpVelTable], a
	ret
; 0x1c73b

SetState_CrouchSliding: ; 1c73b (7:473b)
	xor a
	ld [wceed], a
	ld [wca89], a
	load_sound SFX_0C
	ld a, ST_CROUCH_SLIDING
	ld [wWarioState], a
	ld a, $01
	ld [wca8b], a
	ld a, $ff
	ld [wca70], a
	ld a, $f1
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, $04
	ld [wca7b], a
	ld a, $48
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $42
	ld [wSpritePtr + 0], a
	ld a, $6c
	ld [wSpritePtr + 1], a
	ld a, [wDirection]
	cp DIRECTION_RIGHT
	jr z, .dir_right

; dir left
	load_frameset_ptr Frameset_14a38
.asm_1c7a7
	update_anim
	ret

.dir_right
	load_frameset_ptr Frameset_14a3b
	jr .asm_1c7a7
; 0x1c7c3

UpdateState_CrouchSliding: ; 1c7c3 (7:47c3)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wWarioState]
	cp ST_CROUCH_SLIDING
	ret nz ; done if not crouch sliding anymore

	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, .asm_1c885
	farcall Func_198e0
	ld a, [wWarioState]
	cp ST_CROUCH_SLIDING
	ret nz ; done if not crouch sliding anymore

	ld a, b
	and a
	jp z, Func_1ed34
	ld a, [wc189]
	and a
	jr z, .asm_1c815
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	jp SetState_Sliding

.asm_1c815
	farcall Func_19734
	ld a, [wWarioState]
	cp ST_CROUCH_SLIDING
	ret nz ; done if not crouch sliding anymore

	ld a, b
	and a
	jp nz, .asm_1c8b1
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [wPowerUpLevel]
	cp POWER_UP_GARLIC
	jr nc, .asm_1c84b
	ld a, [hl]
	cp $14
	jr c, .asm_1c85b
	cp $24
	jr c, .asm_1c86b
	cp $28
	jr c, .asm_1c875
	jp z, .asm_1c8b1
	ret

.asm_1c84b
	ld a, [hl]
	cp $1e
	jr c, .asm_1c85b
	cp $36
	jr c, .asm_1c86b
	cp $3c
	jr c, .asm_1c875
	jr z, .asm_1c8b1
	ret

.asm_1c85b
	ld b, $02
	ld a, [wDirection]
	and a
	jr nz, .asm_1c867
.asm_1c863
	call Func_1270
	ret
.asm_1c867
	call Func_1259
	ret

.asm_1c86b
	ld b, $01
	ld a, [wDirection]
	and a
	jr nz, .asm_1c867
	jr .asm_1c863

.asm_1c875
	ld a, [wc08f]
	and $01
	ret z
	ld b, $01
	ld a, [wDirection]
	and a
	jr nz, .asm_1c867
	jr .asm_1c863

.asm_1c885
	ld a, $e5
	ld [wca6f], a
	farcall Func_1996e
	ld a, [wWarioState]
	cp ST_CROUCH_SLIDING
	ret nz ; done if not crouch sliding anymore
	ld a, b
	and a
	jr nz, .asm_1c8ab
	ld a, $f1
	ld [wca6f], a
	jp Func_1ed3f

.asm_1c8ab
	ld a, $f1
	ld [wca6f], a
	ret

.asm_1c8b1
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr nz, .asm_1c8d7
	ld a, $e5
	ld [wca6f], a
	farcall Func_1996e
	ld a, [wWarioState]
	cp ST_CROUCH_SLIDING
	ret nz ; done if not crouch sliding anymore
	ld a, b
	and a
	jp z, SetState_Idling
.asm_1c8d7
	ld a, $f1
	ld [wca6f], a
	jp Func_1e855
; 0x1c8df

UpdateState_Attacking: ; 1c8df (7:48df)
	ld a, [wPowerUpLevel]
	cp POWER_UP_GARLIC
	jr nc, .asm_1c8ff
	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_1c8fd
	ld a, $06
	ld [wceed], a
	load_sound SFX_07
.asm_1c8fd
	jr .asm_1c916

.asm_1c8ff
	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_1c916
	ld a, $06
	ld [wceed], a
	load_sound SFX_08

.asm_1c916
	update_anim

	call HandleInput_Attacking
	ld a, [wWarioState]
	cp ST_ATTACKING
	ret nz ; done if not attacking anymore

	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wWarioState]
	cp ST_ATTACKING
	ret nz ; done if not attacking anymore

	farcall Func_19734
	ld a, [wWarioState]
	cp ST_ATTACKING
	ret nz ; done if not attacking anymore

	ld a, b
	and $0f
	jp nz, Func_1c9f7
	farcall Func_198e0
	ld a, b
	and a
	jp z, Func_1cb33
	ld a, [wWarioState]
	cp ST_ATTACKING
	ret nz ; done if not attacking anymore
	ld a, [wca89]
	cp $2b
	jr nc, .asm_1c9b2
	ld a, [wDirection]
	and a
	jr nz, .asm_1c9a0
	call Func_151e.asm_153f
	call Func_1270
	ld a, [wca86]
	cp $14
	jr c, .asm_1c99e
	ld a, $10
	ld [wca86], a
.asm_1c99e
	jr .asm_1c9b2
.asm_1c9a0
	call Func_151e
	call Func_1259
	ld a, [wca86]
	cp $14
	jr c, .asm_1c9b2
	ld a, $10
	ld [wca86], a
.asm_1c9b2
	farcall Func_198e0
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [wWarioState]
	cp ST_ATTACKING
	ret nz ; done if not attacking anymore
	ld hl, wca89
	dec [hl]
	ret nz
	call Func_1700
	jr z, .asm_1c9ec
	farcall Func_19c81
	ret
.asm_1c9ec
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, HandleInput_Idling.no_turning
	jp SetState_Idling
; 0x1c9f7

Func_1c9f7: ; 1c9f7 (7:49f7)
	jp Func_1ca0e
; 0x1c9fa

	INCROM $1c9fa, $1ca0e

Func_1ca0e: ; 1ca0e (7:4a0e)
	ld a, [wDirection]
	and a
	jr nz, .asm_1ca1b
	ld b, $02
	call Func_1259
	jr .asm_1ca20
.asm_1ca1b
	ld b, $02
	call Func_1270

.asm_1ca20
	load_sound SFX_03
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_1ca32
	ld a, 10
	jr .asm_1ca34
.asm_1ca32
	ld a, FALLING_JUMP_VEL_INDEX
.asm_1ca34
	ld [wJumpVelIndex], a
	jr .asm_1ca46
	load_sound SFX_03
	ld a, 10
	ld [wJumpVelIndex], a

.asm_1ca46
	ld a, ST_ATTACK_KNOCK_BACK
	ld [wWarioState], a
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
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
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca89], a
	ld a, [wca9d]
	and a
	jp nz, .asm_1cabf

	ld a, [wDirection]
	and a
	jr nz, .asm_1caa4
	load_frameset_ptr Frameset_15219
	update_anim
	jr .asm_1cabe
.asm_1caa4
	load_frameset_ptr Frameset_15216
	update_anim
.asm_1cabd
	ret
.asm_1cabe
	ret

.asm_1cabf
	xor a
	ld [wca9d], a
	ld a, $04
	ld [wca7b], a
	ld a, $78
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $59
	ld [wSpritePtr + 0], a
	ld a, $55
	ld [wSpritePtr + 1], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1caf9
	call .asm_1cabe
	load_frameset_ptr Frameset_15f7f
	jr .asm_1cb06
.asm_1caf9
	call .asm_1cabd
	load_frameset_ptr Frameset_15f70
.asm_1cb06
	update_anim

	ld a, $e5
	ld [wca6f], a
	farcall Func_1996e
	ld a, b
	and a
	jr z, .asm_1cb32
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
.asm_1cb32
	ret
; 0x1cb33

Func_1cb33: ; 1cb33 (7:4b33)
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	jr SetState_AttackingAirborne

Func_1cb3a: ; 1cb3a (7:4b3a)
	xor a
	ld [wJumpVelIndex], a
	ld a, TRUE
	ld [wJumpingUpwards], a
;	fallthrough

SetState_AttackingAirborne: ; 1cb43 (7:4b43)
	xor a
	ld [wc189], a
	ld a, ST_ATTACKING_AIRBORNE
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wPowerUpLevel]
	cp POWER_UP_HIGH_JUMP_BOOTS
	ld a, JUMP_VEL_NORMAL
	jr c, .asm_1cb5d
	inc a ; JUMP_VEL_HIGH_JUMP
.asm_1cb5d
	ld [wJumpVelTable], a

	ld a, [wPowerUpLevel]
	cp POWER_UP_GARLIC
	jr nc, .asm_1cb85
	ld a, [wDirection]
	and a
	jr nz, .asm_1cb79
	load_frameset_ptr Frameset_15216
	jr .asm_1cba1
.asm_1cb79
	load_frameset_ptr Frameset_15219
	jr .asm_1cba1
.asm_1cb85
	ld a, [wDirection]
	and a
	jr nz, .asm_1cb97
	load_frameset_ptr Frameset_1523e
	jr .asm_1cba1
.asm_1cb97
	load_frameset_ptr Frameset_15249
.asm_1cba1
	update_anim

	ld a, [wcac9]
	and a
	ret z
	call UpdateState_AttackingAirborne
	ret
; 0x1cbb9

UpdateState_AttackingAirborne: ; 1cbb9 (7:4bb9)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_1cd48
	ld a, [wcaa0]
	and a
	jr z, .asm_1cbec
	farcall Func_1a0e8
	ret

.asm_1cbec
	ld a, [wWarioState]
	cp ST_ATTACKING_AIRBORNE
	ret nz ; done if nor attacking airborne anymore

	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_1cc09
	ld a, $06
	ld [wceed], a
	load_sound SFX_07
.asm_1cc09
	update_anim

	call Func_1ea64
	ld a, [wWarioState]
	cp ST_ATTACKING_AIRBORNE
	ret nz ; done if nor attacking airborne anymore

	farcall Func_19734
	ld a, [wWarioState]
	cp ST_ATTACKING_AIRBORNE
	ret nz ; done if nor attacking airborne anymore

	ld a, b
	and $0f
	jr nz, .asm_1ccac
	ld a, [wca89]
	dec a
	jr z, .asm_1cc44
	ld [wca89], a
.asm_1cc44
	ld a, [wDirection]
	and a
	jr nz, .asm_1cc58
	ld a, [wJoypadPressed]
	bit D_RIGHT_F, a
	jr z, .asm_1cc5f
.asm_1cc51
	xor a
	ld [wca89], a
	jp Func_1c2ae

.asm_1cc58
	ld a, [wJoypadPressed]
	bit D_LEFT_F, a
	jr nz, .asm_1cc51
.asm_1cc5f
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1cc8a
	farcall Func_1996e
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp ST_ATTACKING_AIRBORNE
	ret nz ; done if nor attacking airborne anymore

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	ret nc
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ret

.asm_1cc8a
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_1cca0
	jp Func_14de

.asm_1cca0
	call Func_14f6
	ld a, [wWarioState]
	cp ST_ATTACKING_AIRBORNE
	ret nz ; done if nor attacking airborne anymore

	jp SetState_Idling

.asm_1ccac
	jp Func_1ca0e
; 0x1ccaf

UpdateState_AttackKnockBack: ; 1ccaf (7:4caf)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_1cd48
	ld a, [wcaa0]
	and a
	jr z, .asm_1cce2
	farcall Func_1a0e8
	ret

.asm_1cce2
	ld a, [wWarioState]
	cp ST_ATTACK_KNOCK_BACK
	ret nz ; done if not knocked back anymore

	call Func_1ea83
	ld a, [wWarioState]
	cp ST_ATTACK_KNOCK_BACK
	ret nz ; done if not knocked back anymore

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1cd16
	farcall Func_1996e
	ld a, [wWarioState]
	cp ST_ATTACK_KNOCK_BACK
	ret nz ; done if not knocked back anymore

	ld a, b
	and a
	ret z
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ret

.asm_1cd16
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_1cd2c
	jp Func_14de
.asm_1cd2c
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	ld a, [wWarioState]
	cp ST_ATTACK_KNOCK_BACK
	ret nz ; done if not knocked back anymore
	jp UpdateState_Airborne.asm_1c541
; 0x1cd48

Func_1cd48: ; 1cd48 (7:4d48)
	xor a
	ld [wca9a], a
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
	ld a, $e5
	ld [wca6f], a
	ld a, $05
	ld [wSpriteBank], a
	ld a, $52
	ld [wSpritePtr + 0], a
	ld a, $54
	ld [wSpritePtr + 1], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1cda9
	load_frameset_ptr Frameset_155a0
	jr .asm_1cdb3
.asm_1cda9
	load_frameset_ptr Frameset_155a3
.asm_1cdb3
	update_anim
	jr SetState_Diving

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1cddd
	load_frameset_ptr Frameset_15569
	jr .asm_1cde7
.asm_1cddd
	load_frameset_ptr Frameset_15573
.asm_1cde7
	update_anim
;	fallthrough

SetState_Diving: ; 1cdf6 (7:4df6)
	ld a, ST_DIVING
	ld [wWarioState], a
	ld a, $ff
	ld [wca70], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca96], a
	ld [wca89], a
	ld [wca9d], a
	ld [wca6d], a
	ld [wca8b], a
	ld [wc0e0], a
	ld hl, Pals_c800
	call Func_1af6
	ld a, $04
	ld [wca7b], a
	ld a, $60
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ret
; 0x1ce42

UpdateState_Diving: ; 1ce42 (7:4e42)
	farcall Func_198e0
	ld a, [wWarioState]
	cp ST_DIVING
	ret nz ; done if not diving anymore

	ld a, b
	and a
	jr nz, .asm_1ce8a
	call Func_1f14f
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp 10
	jr c, .asm_1ce6d
	cp 14
	jr c, .asm_1ce71
	jr .asm_1ce95
.asm_1ce6d
	ld b, $02
	jr .asm_1ce73
.asm_1ce71
	ld b, $01
.asm_1ce73
	call Func_1287
	farcall Func_198e0
	ld a, b
	and a
	jr nz, .asm_1ce8a
	ret

.asm_1ce8a
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a

.asm_1ce95
	ld a, ST_SUBMERGED
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca6d], a
	ld [wc0e0], a
	ld [wca9c], a
	ld a, $04
	ld [wca7b], a
	ld a, $60
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $52
	ld [wSpritePtr + 0], a
	ld a, $54
	ld [wSpritePtr + 1], a
	ld a, [wPowerUpLevel]
	cp POWER_UP_SWIMMING_FLIPPERS
	jr c, .asm_1cf20
	ld a, [wc0db]
	cp $02
	jr z, .asm_1cf20
	ld a, $ff
	ld [wca70], a
	ld a, $f1
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
	jr nz, .asm_1cf06
	load_frameset_ptr Frameset_15576
	jr .asm_1cf10
.asm_1cf06
	load_frameset_ptr Frameset_1558b
.asm_1cf10
	update_anim
	ret

.asm_1cf20
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1cf39
	load_frameset_ptr Frameset_155a0
	jr .asm_1cf43
.asm_1cf39
	load_frameset_ptr Frameset_155a3
.asm_1cf43
	update_anim
	ret
; 0x1cf53

UpdateState_Submerged: ; 1cf53 (7:4f53)
	xor a
	ld [wc0e1], a
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wWarioState]
	cp ST_SUBMERGED
	ret nz
	call Func_1e46a
	call Func_1f1a9
	ret
; 0x1cf7a

Func_1cf7a: ; 1cf7a (7:4f7a)
	xor a
	ld [wceed], a
	ld [wca6e], a
	ld a, $04
	ld [wca7b], a
	ld a, $60
	ld [wca7c], a
	ld a, $00
	ld [$ca7d], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $52
	ld [wSpritePtr + 0], a
	ld a, $54
	ld [wSpritePtr + 1], a
	ld a, ST_WATER_SURFACE_IDLING
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
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca6d], a
	ld [wc0e0], a
	ld [wca9c], a
	ld a, [wc0db]
	and a
	jr nz, .asm_1cfdc
	ld a, $01
	ld [wc0db], a

.asm_1cfdc
	ld a, [wDirection]
	and a
	jr nz, .asm_1cfee
	load_frameset_ptr Frameset_15554
	jr .asm_1cff8
.asm_1cfee
	load_frameset_ptr Frameset_1555b
.asm_1cff8
	update_anim
	ret
; 0x1d008

	INCROM $1d008, $1d1dd

Func_1d1dd: ; 1d1dd (7:51dd)
	ld a, $40
	ld [wca9c], a
	jr SetState_UnderwaterThrusting

Func_1d1e4: ; 1d1e4 (7:51e4)
	ld a, [wJoypadDown]
	and D_PAD
	ld [wca9c], a
;	fallthrough

SetState_UnderwaterThrusting: ; 1d1ec (7:51ec)
	ld a, ST_UNDERWATER_THRUSTING
	ld [wWarioState], a
	ld a, $ff
	ld [wca70], a
	ld a, $f1
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	xor a
	ld [wceed], a
	ld [wca6d], a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wca9c]
	and a
	jr z, .asm_1d282
	ld a, [wca9c]
	bit 5, a
	jr nz, .asm_1d22c
	bit 4, a
	jr nz, .asm_1d250
	ld a, [wDirection]
	and a
	jr nz, .asm_1d250
.asm_1d22c
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	ld a, [wPowerUpLevel]
	cp POWER_UP_PRINCE_FROGS_GLOVES
	jr c, .asm_1d244
	load_frameset_ptr Frameset_15562
	jr .asm_1d272
.asm_1d244
	load_frameset_ptr Frameset_155be
	jr .asm_1d272
.asm_1d250
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	ld a, [wPowerUpLevel]
	cp POWER_UP_PRINCE_FROGS_GLOVES
	jr c, .asm_1d268
	load_frameset_ptr Frameset_1556c
	jr .asm_1d272
.asm_1d268
	load_frameset_ptr Frameset_155c5
.asm_1d272
	update_anim
	ret

.asm_1d282
	ld a, [wDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_1d290
	ld a, $20
	ld [wca9c], a
	jr .asm_1d22c
.asm_1d290
	ld a, $10
	ld [wca9c], a
	jr .asm_1d250
; 0x1d297

	INCROM $1d297, $1def1

SetState_Sliding: ; 1def1 (7:5ef1)
	ld a, ST_SLIDING
	ld [wWarioState], a
	xor a
	ld [wceed], a
	ld [wca8b], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca86], a
	ld [wca9a], a
	ld a, $01
	ld [wca9d], a
	ld a, $ff
	ld [wca70], a
	ld a, $e5
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $09
	ld [wca7b], a
	ld a, $50
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $64
	ld [wSpritePtr + 0], a
	ld a, $4a
	ld [wSpritePtr + 1], a
	ld a, [wc189]
	bit 1, a
	jr nz, .asm_1df8b
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	add $0c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [hld]
	sub $0c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	ld b, $06
	farcall Func_c9f3

	ld a, DIRECTION_LEFT
	ld [wDirection], a
	load_frameset_ptr Frameset_16708
	jr .asm_1dfc4
.asm_1df8b
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	sub $0c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [hld]
	sub $0c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	ld b, $05
	farcall Func_c9f3

	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	load_frameset_ptr Frameset_1671d
.asm_1dfc4
	update_anim
	ret
; 0x1dfd4

	INCROM $1dfd4, $1e46a

Func_1e46a: ; 1e46a (7:646a)
	call Func_1e598
	ld a, [wcee0]
	bit 0, a
	jr nz, .asm_1e48e
	bit 1, a
	jr nz, .asm_1e4cd
	bit 2, a
	jp nz, .asm_1e50c
	bit 3, a
	jp nz, .asm_1e54b
	ld a, [wcee2]
	and a
	call nz, .asm_1e58a
	xor a
	ld [wcee2], a
	ret

.asm_1e48e
	ld a, [wcee2]
	and $0e
	call nz, .asm_1e58a
	ld hl, wcee0
	ld a, [hl]
	ld [wcee2], a
	res 0, [hl]
	ld a, [wc0e1]
	bit 4, a
	ret nz
	farcall Func_19741
	ld a, b
	and a
	ret nz
	ld a, [wca9c]
	bit 4, a
	ret nz
	bit 5, a
	jr z, .asm_1e4c7
	ld a, [wPowerUpLevel]
	cp POWER_UP_PRINCE_FROGS_GLOVES
	ret nc
.asm_1e4c7
	ld b, $02
	call Func_1259
	ret

.asm_1e4cd
	ld a, [wcee2]
	and $0d
	call nz, .asm_1e58a
	ld hl, wcee0
	ld a, [hl]
	ld [wcee2], a
	res 1, [hl]
	ld a, [wc0e1]
	bit 5, a
	ret nz
	farcall Func_197b1
	ld a, b
	and a
	ret nz
	ld a, [wca9c]
	bit 5, a
	ret nz
	bit 4, a
	jr z, .asm_1e506
	ld a, [wPowerUpLevel]
	cp POWER_UP_PRINCE_FROGS_GLOVES
	ret nc
.asm_1e506
	ld b, $02
	call Func_1270
	ret

.asm_1e50c
	ld a, [wcee2]
	and $0b
	call nz, .asm_1e58a
	ld hl, wcee0
	ld a, [hl]
	ld [wcee2], a
	res 2, [hl]
	ld a, [wc0e1]
	bit 6, a
	ret nz
	farcall Func_1996e
	ld a, b
	and a
	ret nz
	ld a, [wca9c]
	bit 6, a
	ret nz
	bit 7, a
	jr z, .asm_1e545
	ld a, [wPowerUpLevel]
	cp POWER_UP_PRINCE_FROGS_GLOVES
	ret nc
.asm_1e545
	ld b, $02
	call Func_129e
	ret

.asm_1e54b
	ld a, [wcee2]
	and $07
	call nz, .asm_1e58a
	ld hl, wcee0
	ld a, [hl]
	ld [wcee2], a
	res 3, [hl]
	ld a, [wc0e1]
	bit 7, a
	ret nz
	farcall Func_198e0
	ld a, b
	and a
	ret nz
	ld a, [wca9c]
	bit 7, a
	ret nz
	bit 6, a
	jr z, .asm_1e584
	ld a, [wPowerUpLevel]
	cp POWER_UP_PRINCE_FROGS_GLOVES
	ret nc
.asm_1e584
	ld b, $02
	call Func_1287
	ret

.asm_1e58a
	ld a, [wcee1]
	and a
	ret nz
	ld a, [wcee2]
	add $f0
	ld [wcee1], a
	ret
; 0x1e598

Func_1e598: ; 1e598 (7:6598)
	ld a, [wcee1]
	and a
	ret z
	bit 0, a
	jr nz, .asm_1e5b0
	bit 1, a
	jr nz, .asm_1e5e3
	bit 2, a
	jp nz, .asm_1e624
	bit 3, a
	jp nz, .asm_1e657
	ret

.asm_1e5b0
	ld a, [wc0e1]
	bit 4, a
	jr nz, .asm_1e61f
	farcall Func_19741
	ld a, b
	and a
	jr nz, .asm_1e61f
	ld a, [wca9c]
	bit 4, a
	jr nz, .asm_1e614
	bit 5, a
	jr z, .asm_1e5dc
	ld a, [wPowerUpLevel]
	cp POWER_UP_PRINCE_FROGS_GLOVES
	jr nc, .asm_1e614
.asm_1e5dc
	ld b, $01
	call Func_1259
	jr .asm_1e614

.asm_1e5e3
	ld a, [wc0e1]
	bit 5, a
	jr nz, .asm_1e61f
	farcall Func_197b1
	ld a, b
	and a
	jr nz, .asm_1e61f
	ld a, [wca9c]
	bit 5, a
	jr nz, .asm_1e614
	bit 4, a
	jr z, .asm_1e60f
	ld a, [wPowerUpLevel]
	cp POWER_UP_PRINCE_FROGS_GLOVES
	jr nc, .asm_1e614
.asm_1e60f
	ld b, $01
	call Func_1270
.asm_1e614
	ld a, [wcee1]
	sub $10
	ld [wcee1], a
	and $f0
	ret nz

.asm_1e61f
	xor a
	ld [wcee1], a
	ret

.asm_1e624
	ld a, [wc0e1]
	bit 6, a
	jr nz, .asm_1e61f
	farcall Func_1996e
	ld a, b
	and a
	jr nz, .asm_1e61f
	ld a, [wca9c]
	bit 6, a
	jr nz, .asm_1e614
	bit 7, a
	jr z, .asm_1e650
	ld a, [wPowerUpLevel]
	cp POWER_UP_PRINCE_FROGS_GLOVES
	jr nc, .asm_1e614
.asm_1e650
	ld b, $01
	call Func_129e
	jr .asm_1e614

.asm_1e657
	ld a, [wc0e1]
	bit 7, a
	jr nz, .asm_1e61f
	farcall Func_198e0
	ld a, b
	and a
	jr nz, .asm_1e61f
	ld a, [wca9c]
	bit 7, a
	jr nz, .asm_1e614
	bit 6, a
	jr z, .asm_1e683
	ld a, [wPowerUpLevel]
	cp POWER_UP_PRINCE_FROGS_GLOVES
	jr nc, .asm_1e614
.asm_1e683
	ld b, $01
	call Func_1287
	jr .asm_1e614
; 0x1e68a

HandleInput_Idling: ; 1e68a (7:668a)
	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, SetState_Attacking
	bit A_BUTTON_F, a
	jp nz, StartJump_FromInput
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right_1
	bit D_LEFT_F, a
	jr nz, .d_left_1
	ret

.d_right_1
	ld a, [wDirection]
	and a
	jr nz, .no_turning
	jp SetState_Turning
.d_left_1
	ld a, [wDirection]
	and a
	jr z, .no_turning
	jp SetState_Turning
.no_turning

	xor a
	ld [wca86], a
;	fallthrough

SetState_Walking: ; 1e6b9 (7:66b9)
	ld a, ST_WALKING
	ld [wWarioState], a
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right_2
	bit D_LEFT_F, a
	jr nz, .d_left_2
	jr .ok
.d_right_2
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jr .ok
.d_left_2
	ld a, DIRECTION_LEFT
	ld [wDirection], a

.ok
	xor a
	ld [wceed], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wca96], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, $04
	ld [wca7b], a
	ld a, $48
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $42
	ld [wSpritePtr + 0], a
	ld a, $6c
	ld [wSpritePtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .dir_right
; dir_left
	load_frameset_ptr Frameset_149b4
	jr .got_frameset
.dir_right
	load_frameset_ptr Frameset_149c5
.got_frameset
	update_anim
	ret
; 0x1e73e

SetState_Turning: ; 1e73e (7:673e)
	ld a, ST_TURNING
	ld [wWarioState], a
	xor a
	ld [wca89], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld a, $04
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $4a
	ld [wSpritePtr + 0], a
	ld a, $82
	ld [wSpritePtr + 1], a
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	and a
	jr nz, .asm_1e791
	load_frameset_ptr Frameset_14cbe
	jr .asm_1e79b
.asm_1e791
	load_frameset_ptr Frameset_14cc5
.asm_1e79b
	update_anim
	ret
; 0x1e7ab

SetState_Attacking: ; 1e7ab (7:67ab)
	ld a, $30
	ld [wca89], a
	xor a
	ld [wceed], a
	ld a, ST_ATTACKING
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
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wca8b], a
	ld a, $05
	ld [wSpriteBank], a
	ld a, $4d
	ld [wSpritePtr + 0], a
	ld a, $1b
	ld [wSpritePtr + 1], a
	ld a, $04
	ld [wca7b], a
	ld a, $58
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0

	ld a, [wPowerUpLevel]
	cp POWER_UP_GARLIC
	jr nc, .asm_1e829
	ld a, [wDirection]
	and a
	jr nz, .asm_1e81d
	load_frameset_ptr Frameset_151e4
	jr .asm_1e845
.asm_1e81d
	load_frameset_ptr Frameset_151fd
	jr .asm_1e845
.asm_1e829
	ld a, [wDirection]
	and a
	jr nz, .asm_1e83b
	load_frameset_ptr Frameset_1521c
	jr .asm_1e845
.asm_1e83b
	load_frameset_ptr Frameset_1522d
.asm_1e845
	update_anim
	ret
; 0x1e855

Func_1e855: ; 1e855 (7:6855)
	ld a, [wc189]
	and a
	jp nz, SetState_Sliding
	ld a, $ff
	ld [wca70], a
	ld a, $f1
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, ST_CROUCHING
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca9a], a
	ld [wca89], a
	ld [wca86], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ld a, $01
	ld [wca8b], a

	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_CrouchWalking

	ld a, $04
	ld [wca7b], a
	ld a, $48
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $42
	ld [wSpritePtr + 0], a
	ld a, $6c
	ld [wSpritePtr + 1], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_1e8d3
	load_frameset_ptr Frameset_14a38
	jr .asm_1e8dd
.asm_1e8d3
	load_frameset_ptr Frameset_14a3b
.asm_1e8dd
	update_anim
	ret
; 0x1e8ed

HandleInput_Walking: ; 1e8ed (7:68ed)
	ld a, [wJumpingUpwards]
	and a
	jr nz, .skip_jump
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jp nz, StartJump_FromInput
.skip_jump

	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, SetState_Attacking
	bit A_BUTTON_F, a
	jp nz, StartJump_FromInput

	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr nz, .d_down
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	jr .asm_1e970

.d_right
	ld a, [wDirection]
	and a
	jp z, SetState_Turning
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	farcall Func_19734
	ld a, b
	and a
	ret nz
	call Func_151e
	call Func_1259
.asm_1e93d
	ld a, [wca86]
	cp $10
	jr c, .asm_1e949
	ld a, $0c
	ld [wca86], a
.asm_1e949
	ret

.d_left
	ld a, [wDirection]
	and a
	jp nz, SetState_Turning
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	farcall Func_19734
	ld a, b
	and a
	ret nz
	call Func_151e.asm_153f
	call Func_1270
	jr .asm_1e93d

.asm_1e970
	call Func_1700
	jr z, SetState_Idling
	farcall Func_19c81
	ret

.d_down
	call Func_1700
	jp z, Func_1e855
	farcall Func_19e7f
	ret

SetState_Idling: ; 1e99b (7:699b)
	xor a
	ld [wca86], a
	ld a, ST_IDLING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca96], a
	ld [wca8b], a
	ld [wca89], a
	ld [wca9a], a
	ld a, $ff
	ld [wca70], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $e5
	ld [wca6f], a

	farcall Func_1996e
	ld a, [wWarioState]
	cp ST_IDLING
	ret nz
	ld a, b
	and a
	jp nz, Func_1e855
	ld a, $04
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $40
	ld [wSpritePtr + 0], a
	ld a, $00
	ld [wSpritePtr + 1], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1ea24
	load_frameset_ptr Frameset_14252
	jr .asm_1ea2e
.asm_1ea24
	load_frameset_ptr Frameset_1425f
.asm_1ea2e
	update_anim
	ret
; 0x1ea3e

HandleInput_Attacking: ; 1ea3e (7:6a3e)
	ld a, [wDirection]
	and a
	jr nz, .dir_left
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jp nz, SetState_Turning

.check_pressed
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, Func_1cb3a
	bit D_DOWN_F, a
	jp nz, SetState_CrouchSliding
	ret

.dir_left
	ld a, [wJoypadDown]
	bit D_LEFT_F, a
	jp nz, SetState_Turning
	jr .check_pressed
; 0x1ea64

Func_1ea64: ; 1ea64 (7:6a64)
	call Func_1488
	farcall Func_2b1a6
	ld a, [wca86]
	cp $14
	jr c, .done
	ld a, $10
	ld [wca86], a
.done
	ret
; 0x1ea83

Func_1ea83: ; 1ea83 (7:6a83)
	ld a, [wJumpVelIndex]
	cp 28
	jr c, .asm_1ead8
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jr z, .asm_1ead8
	bit D_RIGHT_F, a
	jr nz, .asm_1eab4
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	farcall Func_19741
	ld a, b
	and a
	jr nz, .asm_1ead1
	ld b, $01
	call Func_1259
	jr .asm_1ead1

.asm_1eab4
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	farcall Func_197b1
	ld a, b
	and a
	jr nz, .asm_1ead1
	ld b, $01
	call Func_1270
.asm_1ead1
	xor a
	ld [wca86], a
	jp Func_1c2ae

.asm_1ead8
	ld a, [wDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_1eafe
	ld b, $01
	call Func_1270
	farcall Func_197b1
	ld a, b
	and a
	jr z, .asm_1eb1b
	ld b, $01
	call Func_1259
	jr .asm_1eb1b
.asm_1eafe
	ld b, $01
	call Func_1259
	farcall Func_19741
	ld a, b
	and a
	jr z, .asm_1eb1b
	ld b, $01
	call Func_1270
.asm_1eb1b

	ld a, [wJumpVelIndex]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	bit 7, [hl]
	jr z, .asm_1eb36
	ld a, [hl]
	cpl
	inc a
	ld b, a
	call Func_129e
	ld hl, wJumpVelIndex
	inc [hl]
	jr .done
.asm_1eb36
	ld b, [hl]
	call Func_1287
	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp MAX_JUMP_VEL_INDEX
	jr c, .done
	ld [hl], MAX_JUMP_VEL_INDEX
.done
	ret
; 0x1eb46

	INCROM $1eb46, $1eb94

SetState_CrouchWalking: ; 1eb94 (7:6b94)
	ld a, $ff
	ld [wca70], a
	ld a, $f1
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, ST_CROUCH_WALKING
	ld [wWarioState], a
	ld a, $01
	ld [wca8b], a
	xor a
	ld [wceed], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca89], a
	ld [wca9a], a
	ld [wceed], a

	ld a, $05
	ld [wSpriteBank], a
	ld a, $42
	ld [wSpritePtr + 0], a
	ld a, $6c
	ld [wSpritePtr + 1], a
	ld a, $04
	ld [wca7b], a
	ld a, $48
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, [wDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_1ec0d
	load_frameset_ptr Frameset_14a26
.asm_1ebfd
	update_anim
	ret
.asm_1ec0d
	load_frameset_ptr Frameset_14a2f
	jr .asm_1ebfd
; 0x1ec19

	INCROM $1ec19, $1ed34

Func_1ed34: ; 1ed34 (7:6d34)
	xor a
	ld [wca86], a
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	jr Func_1ed4b

Func_1ed3f: ; 1ed3f (7:6d3f)
	load_sound SFX_01
	xor a
	ld [wJumpVelIndex], a

Func_1ed4b: ; 1ed4b (7:6d4b)
	ld a, ST_UNKNOWN_14
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca9a], a
	ld [wca89], a
	ld a, $ff
	ld [wca70], a
	ld a, $f1
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a
	ld a, $04
	ld [wca7b], a
	ld a, $48
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $42
	ld [wSpritePtr + 0], a
	ld a, $6c
	ld [wSpritePtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1edaf
	load_frameset_ptr Frameset_14a38
	jr .asm_1edb9
.asm_1edaf
	load_frameset_ptr Frameset_14a3b
.asm_1edb9
	update_anim

	ld a, [wcac9]
	and a
	ret z
	ld b, $02
	call Func_129e
	ret
; 0x1edd3

	INCROM $1edd3, $1f077

Func_1f077: ; 1f077 (7:7077)
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jr nz, .asm_1f094
	xor a ; FALSE
	ld [wJumpingUpwards], a
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1f094
	ld a, [wca76]
	and a
	jr nz, .asm_1f094
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
.asm_1f094
	ld a, [wJumpVelIndex]
	ld e, a
	ld d, $00
	ld a, [wJumpVelTable]
	dec a
	jr z, .asm_1f0ad
	dec a
	jr z, .asm_1f0a8
	ld hl, JumpVelTable_HighJump ; JUMP_VEL_HIGH_JUMP
	jr .asm_1f0b0
.asm_1f0a8
	ld hl, JumpVelTable_Normal ; JUMP_VEL_NORMAL
	jr .asm_1f0b0
.asm_1f0ad
	ld hl, JumpVelTable_KnockBack ; JUMP_VEL_KNOCK_BACK
.asm_1f0b0
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
	jr .asm_1f0d5

.falling
	xor a
	ld [wca76], a
	ld b, [hl]
	call Func_1287
	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp MAX_JUMP_VEL_INDEX
	jr c, .asm_1f0d5
	ld [hl], MAX_JUMP_VEL_INDEX

.asm_1f0d5
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	ret

.d_right
	call Func_1f0ed
	jp Func_1762

.d_left
	call Func_1f104
	jp Func_1762
; 0x1f0ed

Func_1f0ed: ; 1f0ed (7:70ed)
	xor a
	ld [wca95], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1f101
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	ld a, $01
	ld [wca95], a
.asm_1f101
	jp Func_1f11b
; 0x1f104

Func_1f104: ; 1f104 (7:7104)
	xor a
	ld [wca95], a
	ld a, [wDirection]
	and a
	jr z, .asm_1f118
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	ld a, $01
	ld [wca95], a
.asm_1f118
	jp Func_1f135
; 0x1f11b

Func_1f11b: ; 1f11b (7:711b)
	farcall Func_19734
	ld a, b
	and $0f
	ret nz
	call Func_151e
	call Func_1259
	ret
; 0x1f135

Func_1f135: ; 1f135 (7:7135)
	farcall Func_19734
	ld a, b
	and $0f
	ret nz
	call Func_151e.asm_153f
	call Func_1270
	ret
; 0x1f14f

Func_1f14f: ; 1f14f (7:714f)
	ld a, [wPowerUpLevel]
	cp POWER_UP_SWIMMING_FLIPPERS
	ret c
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_1f161
	bit D_LEFT_F, a
	jr nz, .asm_1f185
	ret

.asm_1f161
	ld a, [wDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_1f16d
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
.asm_1f16d
	farcall Func_19734
	ld a, b
	and a
	ret nz
	ld b, $01
	call Func_1259
	ret

.asm_1f185
	ld a, [wDirection]
	cp DIRECTION_LEFT
	jr z, .asm_1f191
	ld a, DIRECTION_LEFT
	ld [wDirection], a
.asm_1f191
	farcall Func_19734
	ld a, b
	and a
	ret nz
	ld b, $01
	call Func_1270
	ret
; 0x1f1a9

Func_1f1a9: ; 1f1a9 (7:71a9)
	ld a, [wc0db]
	cp $02
	jr z, .asm_1f1f5
	ld a, [wPowerUpLevel]
	cp POWER_UP_SWIMMING_FLIPPERS
	jr c, .asm_1f1f5
	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, Func_1d1e4
	bit A_BUTTON_F, a
	jp nz, Func_1d1dd
	ld a, [wJoypadDown]
	and D_PAD
	jp nz, Func_1f24c

	ld a, [wWarioStateCycles]
	and a
	jr nz, .asm_1f1f5
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1f1eb
	load_frameset_ptr Frameset_15569
	jr .asm_1f1f5
.asm_1f1eb
	load_frameset_ptr Frameset_15573
.asm_1f1f5
	update_anim

	ld a, $01
	ld [wWarioStateCycles], a
	farcall Func_1996e
	ld a, b
	and a
	jr nz, .asm_1f246
	farcall Func_19acd
	ld a, [wc0db]
	and a
	jp z, Func_1cf7a
	ld a, [wc08f]
	and $01
	ret nz
	ld hl, wcee2
	ld a, [hld]
	or [hl]
	and $0c
	ret nz
	ld b, $01
	call Func_129e
	ret

.asm_1f246
	ld a, $40
	ld [wc0e1], a
	ret
; 0x1f24c

Func_1f24c: ; 1f24c (7:724c)
	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_1f263
	ld a, $25
	ld [wceed], a
	load_sound SFX_0E
.asm_1f263
	ld a, [wWarioStateCycles]
	and a
	jr z, .asm_1f28f
	xor a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1f285
	load_frameset_ptr Frameset_15576
	jr .asm_1f28f
.asm_1f285
	load_frameset_ptr Frameset_1558b
.asm_1f28f
	update_anim

	ld a, [wc08f]
	and $01
	jr z, .asm_1f2b2
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_1f2c0
	bit D_LEFT_F, a
	jp nz, Func_1f357
	ret

.asm_1f2b2
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jp nz, Func_1f3d9
	bit D_DOWN_F, a
	jp nz, Func_1f3a7
	ret

.asm_1f2c0
	farcall Func_198e0
	ld a, b
	and a
	jr z, .asm_1f2de
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
.asm_1f2de
	ld a, [wWarioState]
	cp ST_UNKNOWN_10
	ret z
	ld a, [wDirection]
	and a
	jr nz, Func_1f310
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_1558b
	update_anim
	ret
; 0x1f310

Func_1f310: ; 1f310 (7:7310)
	farcall Func_19734
	ld a, b
	and a
	jr nz, .asm_1f345
	ld a, [wDirection]
	and a
	jr z, .asm_1f337
	ld hl, wcee2
	ld a, [hld]
	or [hl]
	and $03
	ret nz
	ld b, $01
	call Func_1259
	ret

.asm_1f337
	ld hl, wcee2
	ld a, [hld]
	or [hl]
	and $03
	ret nz
	ld b, $01
	call Func_1270
	ret

.asm_1f345
	ld a, [wDirection]
	and a
	jr z, .asm_1f351
	ld a, $10
	ld [wc0e1], a
	ret

.asm_1f351
	ld a, $20
	ld [wc0e1], a
	ret
; 0x1f357

Func_1f357: ; 1f357 (7:7357)
	farcall Func_198e0
	ld a, b
	and a
	jr z, .asm_1f375
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
.asm_1f375
	ld a, [wWarioState]
	cp ST_UNKNOWN_10
	ret z
	ld a, [wDirection]
	and a
	jr z, Func_1f310
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_15576
	update_anim
	ret
; 0x1f3a7

Func_1f3a7: ; 1f3a7 (7:73a7)
	farcall Func_198e0
	ld a, b
	and a
	jr z, .asm_1f3cb
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld a, $80
	ld [wc0e1], a
	ret

.asm_1f3cb
	ld hl, wcee2
	ld a, [hld]
	or [hl]
	and $0c
	ret nz
	ld b, $01
	call Func_1287
	ret
; 0x1f3d9

Func_1f3d9: ; 1f3d9 (7:73d9)
	farcall Func_1996e
	ld a, b
	and a
	ret nz
	farcall Func_19acd
	ld a, [wc0db]
	and a
	jp z, Func_1cf7a
	ld hl, wcee2
	ld a, [hld]
	or [hl]
	and $0c
	ret nz
	ld b, $01
	call Func_129e
	ret
; 0x1f40f

	INCROM $1f40f, $1f64a

Func_1f64a: ; 1f64a (7:764a)
	ld a, [wca8c]
	and a
	ret z
	cp $16
	jr nc, .asm_1f68b
	cp $10
	jr nc, .asm_1f67c

	ld a, [wWarioState]
	cp ST_STUNG
	jr z, .asm_1f67b
	cp ST_UNKNOWN_16
	jr z, .asm_1f67b

	ld a, $10
	ld [wca8c], a
	ld a, [wca79 + 0]
	cp $48
	jr nz, .asm_1f67b
	ld a, [wca79 + 1]
	cp $10
	jr nz, .asm_1f67b

	ld hl, Pals_c800
	call Func_1af6
.asm_1f67b
	ret

.asm_1f67c
	ld a, [wc08f]
	and $03
	ret nz
	ld a, [wca8c]
	inc a
	ld [wca8c], a
	jr .asm_1f6b9

.asm_1f68b
	ld a, [wc08f]
	and $01
	ret nz
	ld a, [wca8c]
	inc a
	ld [wca8c], a
	cp $28
	jr c, .asm_1f6b9
	xor a
	ld [wca8c], a
	ld [wca8d], a

	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT | D_DOWN
	ret nz

	farcall Func_1996e
	ret

.asm_1f6b9
	ld a, [wca8d]
	xor $01
	ld [wca8d], a
	ret
; 0x1f6c2

	INCROM $1f6c2, $1f6dc

Func_1f6dc: ; 1f6dc (7:76dc)
	ld a, [wced4]
	and a
	ret nz

	ld hl, wca97
	ld a, [hl]
	and a
	jr z, .asm_1f726
	cp $10
	jr c, .asm_1f72b
	ld a, [wca99]
	and a
	jr nz, .asm_1f72b
	ld a, [wca98]
	and a
	jr nz, .asm_1f72b
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_1f72b
	ld a, [wc0db]
	and a
	jr nz, .asm_1f72b
	ld a, [wca8e]
	and a
	jr nz, .asm_1f72b
	ld a, [wc0d7]
	and a
	jr nz, .asm_1f72b
	ld a, [wca8a]
	and a
	jr nz, .asm_1f72b
	ld a, [wcac9]
	and a
	jr nz, .asm_1f72b
	ld a, [wWarioState]
	cp ST_UNKNOWN_2B
	jr z, .asm_1f72b
	jr .asm_1f73c
	ret ; unnecessary

.asm_1f726
	xor a
	ld [wca98], a
	ret

.asm_1f72b
	dec [hl]
	ld a, [hl]
	and $02
	jr nz, .asm_1f736
	xor a
	ld [wc0bc], a
	ret

.asm_1f736
	ld a, $02
	ld [wc0bc], a
	ret

.asm_1f73c
	ld a, [wWarioState]
	cp ST_LADDER_CLIMBING
	jp z, Func_1f7e6
	cp ST_LADDER_IDLING
	jp z, Func_1f7e6
	cp ST_LADDER_SCRATCHING
	jp z, Func_1f7e6
	ld a, ST_UNKNOWN_2B
	ld [wWarioState], a
	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wca89], a
	ld [wca9d], a
	ld [wca9a], a
	ld a, $f1
	ld [wca6f], a
	ld a, [wca8b]
	and a
	jr nz, .asm_1f77d
	ld a, $e5
	ld [wca6f], a
	ld a, 10
	ld [wJumpVelIndex], a
	ld a, $01
	ld [wJumpVelTable], a
.asm_1f77d
	ld a, $ff
	ld [wca70], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, $04
	ld [wca7b], a
	ld a, $78
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $59
	ld [wSpritePtr + 0], a
	ld a, $55
	ld [wSpritePtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1f7cc
	load_frameset_ptr Frameset_15f70
	jr .asm_1f7d6
.asm_1f7cc
	load_frameset_ptr Frameset_15f7f
.asm_1f7d6
	update_anim
	ret
; 0x1f7e6

Func_1f7e6: ; 1f7e6 (7:77e6)
	ld a, ST_UNKNOWN_3C
	ld [wWarioState], a
	load_sound SFX_0C
	xor a
	ld [wceed], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca99], a
	inc a
	ld [wJumpVelTable], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_15948
	update_anim
	ret
; 0x1f825

	INCROM $1f825, $20000
