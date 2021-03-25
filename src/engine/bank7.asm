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
	cp $30 ; ST_UNKNOWN_30
	jr c, .asm_1c04d
	cp $60 ; ST_ON_FIRE
	jr c, .asm_1c03d
	cp $b0 ; ST_UNKNOWN_B0
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

	dw UpdateState_Idling              ; ST_IDLING
	dw UpdateState_Walking             ; ST_WALKING
	dw UpdateState_Turning             ; ST_TURNING
	dw Func_156d                       ; ST_UNKNOWN_03
	dw UpdateState_Airborne            ; ST_AIRBORNE
	dw UpdateState_Landing             ; ST_LANDING
	dw UpdateState_CrouchSliding       ; ST_CROUCH_SLIDING
	dw UpdateState_Attacking           ; ST_ATTACKING
	dw UpdateState_AttackingAirborne   ; ST_ATTACKING_AIRBORNE
	dw UpdateState_AttackKnockBack     ; ST_ATTACK_KNOCK_BACK
	dw UpdateState_Diving              ; ST_DIVING
	dw UpdateState_Submerged           ; ST_SUBMERGED
	dw UpdateState_WaterSurfaceIdling  ; ST_WATER_SURFACE_IDLING
	dw UpdateState_WaterSurfaceMoving  ; ST_WATER_SURFACE_MOVING
	dw UpdateState_UnderwaterThrusting ; ST_UNDERWATER_THRUSTING
	dw UpdateState_SwimKnockBack       ; ST_SWIM_KNOCK_BACK
	dw UpdateState_WaterStung          ; ST_WATER_STUNG
	dw UpdateState_TryingSubmerge      ; ST_TRYING_SUBMERGE
	dw UpdateState_Crouching           ; ST_CROUCHING
	dw UpdateState_CrouchWalking       ; ST_CROUCH_WALKING
	dw UpdateState_CrouchAirborne      ; ST_CROUCH_AIRBORNE
	dw UpdateState_Stung               ; ST_STUNG
	dw UpdateState_StungRecovery       ; ST_STUNG_RECOVERY
	dw UpdateState_PipeGoingDown       ; ST_PIPE_GOING_DOWN
	dw UpdateState_PipeGoingUp         ; ST_PIPE_GOING_UP
	dw $585c                           ; ST_UNKNOWN_19
	dw UpdateState_SmashAttacking      ; ST_SMASH_ATTACKING
	dw Func_156d                       ; ST_UNKNOWN_1B
	dw Func_156d                       ; ST_UNKNOWN_1C
	dw Func_156d                       ; ST_UNKNOWN_1D
	dw UpdateState_PickingUp           ; ST_PICKING_UP
	dw UpdateState_GrabIdling          ; ST_GRAB_IDLING
	dw UpdateState_GrabWalking         ; ST_GRAB_WALKING
	dw UpdateState_GrabAirborne        ; ST_GRAB_AIRBORNE
	dw UpdateState_ThrowCharging       ; ST_THROW_CHARGING
	dw UpdateState_ThrowFullyCharged   ; ST_THROW_FULLY_CHARGED
	dw UpdateState_Throwing            ; ST_THROWING
	dw UpdateState_ThrowingAirborne    ; ST_THROWING_AIRBORNE
	dw UpdateState_GrabSmashAttacking  ; ST_GRAB_SMASH_ATTACKING
	dw UpdateState_Sliding             ; ST_SLIDING
	dw UpdateState_Rolling             ; ST_ROLLING
	dw UpdateState_RollingAirborne     ; ST_ROLLING_AIRBORNE
	dw $62c5                           ; ST_UNKNOWN_2A
	dw UpdateState_GroundShakeStunned  ; ST_GROUND_SHAKE_STUNNED
	dw UpdateState_EnteringDoor        ; ST_ENTERING_DOOR
	dw Func_156d                       ; ST_UNKNOWN_2D
	dw Func_156d                       ; ST_UNKNOWN_2E
	dw Func_156d                       ; ST_UNKNOWN_2F
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
	update_anim_1

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
	update_anim_1

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
	update_anim_1
	ld a, [wc1a8]
	and a
	ret z
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, HandleInput_Idling.no_turning
	jp SetState_Idling
; 0x1c270

Func_1c270: ; 1c270 (7:4270)
	load_sound SFX_0D
	ld a, $01
	ld [wJumpVelIndex], a
	ld a, TRUE
	ld [wJumpingUpwards], a
	ld a, $01
	ld [wca76], a
	jr StartJump

	xor a
	ld [wJumpVelIndex], a
	ld a, TRUE
	ld [wJumpingUpwards], a
	ld a, $01
	ld [wca76], a
	ld a, [wPowerUpLevel]
	cp POWER_UP_HIGH_JUMP_BOOTS
	ld a, JUMP_VEL_KNOCK_BACK
	jr c, .asm_1c2a9
	ld hl, wJoypadDown
	bit D_UP_F, [hl]
	jr z, .asm_1c2a9
	ld a, JUMP_VEL_NORMAL
.asm_1c2a9
	ld [wJumpVelTable], a
	jr SetState_Airborne

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
;	fallthrough

SetState_Airborne: ; 1c2e2 (7:42e2)
	xor a
	ld [wIsStandingOnSlope], a
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
	update_anim_1
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
	update_anim_1

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
	update_anim_1
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
	update_anim_1
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
	update_anim_1
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
	update_anim_1
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
	update_anim_1
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
	ld a, [wIsStandingOnSlope]
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
	update_anim_1

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

Func_1c9fa: ; 1c9fa (7:49fa)
	ld a, [wDirection]
	and a
	jr nz, .asm_1ca07
	ld b, $03
	call Func_1259
	jr .asm_1ca0c
.asm_1ca07
	ld b, $03
	call Func_1270
.asm_1ca0c
	jr Func_1ca20
; 0x1ca0e

Func_1ca0e: ; 1ca0e (7:4a0e)
	ld a, [wDirection]
	and a
	jr nz, .asm_1ca1b
	ld b, $02
	call Func_1259
	jr Func_1ca20
.asm_1ca1b
	ld b, $02
	call Func_1270
;	fallthrough

Func_1ca20: ; 1ca20 (7:4a20)
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
	update_anim_1
	jr .asm_1cabe
.asm_1caa4
	load_frameset_ptr Frameset_15216
	update_anim_1
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
	update_anim_1

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
	ld [wIsStandingOnSlope], a
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
	update_anim_1

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
	update_anim_1

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
;	fallthrough

Func_1cd7c: ; 1cd7c (7:4d7c)
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
	update_anim_1
	jr SetState_Diving
; 0x1cdc4

Func_1cdc4: ; 1cdc4 (7:4dc4)
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
	update_anim_1
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
	jr SetState_Submerged
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
;	fallthrough

SetState_Submerged: ; 1ce95 (7:4e95)
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
	update_anim_1
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
	update_anim_1
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
;	fallthrough

SetState_WaterSurfaceIdling: ; 1cfa2 (7:4fa2)
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
	update_anim_1
	ret
; 0x1d008

UpdateState_WaterSurfaceIdling: ; 1d008 (7:5008)
	xor a
	ld [wc0e1], a
	farcall Func_19b25
	ld a, [wWarioState]
	cp ST_WATER_SURFACE_IDLING
	ret nz ; done if not water idling anymore

	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_1d03f
	ld a, $1c
	ld [wceed], a
	load_sound SFX_37
.asm_1d03f
	update_anim_1
	call Func_1d1bc
	call Func_1f40f
	ld a, [wWarioState]
	cp ST_WATER_SURFACE_IDLING
	ret nz ; done if not water idling anymore

	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jr nz, SetState_WaterSurfaceMoving
	call Func_1e46a
	ret
; 0x1d065

SetState_WaterSurfaceMoving: ; 1d065 (7:5065)
	ld a, ST_WATER_SURFACE_MOVING
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
	ld a, [wDirection]
	and a
	jr nz, .asm_1d0a0
	load_frameset_ptr Frameset_15554
	jr .asm_1d0aa
.asm_1d0a0
	load_frameset_ptr Frameset_1555b
.asm_1d0aa
	update_anim_1
	ret
; 0x1d0ba

UpdateState_WaterSurfaceMoving: ; 1d0ba (7:50ba)
	xor a
	ld [wc0e1], a
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_1d0eb
	ld a, $1c
	ld [wceed], a
	load_sound SFX_37
.asm_1d0eb
	update_anim_1

	call Func_1d1bc
	call Func_1e46a
	call Func_1d107
	call Func_1f40f
	ret
; 0x1d107

Func_1d107: ; 1d107 (7:5107)
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	jp SetState_WaterSurfaceIdling

.d_right
	ld a, [wDirection]
	and a
	jr nz, .asm_1d141
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_1555b
	update_anim_1
	ret

.asm_1d141
	farcall Func_19734
	ld a, b
	and a
	ret nz
	ld hl, wcee2
	ld a, [hld]
	or [hl]
	and $03
	ret nz
	call Func_151e
	call Func_1259
.asm_1d161
	ld a, [wca86]
	cp $04
	jr c, .asm_1d16d
	ld a, $00
	ld [wca86], a
.asm_1d16d
	ret

.d_left
	ld a, [wDirection]
	and a
	jr z, .asm_1d19a
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_15554
	update_anim_1
	ret

.asm_1d19a
	farcall Func_19734
	ld a, b
	and a
	ret nz
	ld hl, wcee2
	ld a, [hld]
	or [hl]
	and $03
	ret nz
	call Func_151e.asm_153f
	call Func_1270
	jr .asm_1d161
; 0x1d1bc

Func_1d1bc: ; 1d1bc (7:51bc)
	ld a, [wc08f]
	and $03
	ret nz
	ld hl, wca6e
	inc [hl]
	ld a, [hl]
	cp $07
	jr nc, .asm_1d1d1
	ld b, $01
	call Func_128e
	ret

.asm_1d1d1
	cp $0c
	jr c, .asm_1d1d7
	xor a
	ld [hl], a
.asm_1d1d7
	ld b, $01
	call Func_12a5
	ret
; 0x1d1dd

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
	update_anim_1
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

UpdateState_UnderwaterThrusting: ; 1d297 (7:5297)
	xor a
	ld [wc0e1], a
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wWarioState]
	cp ST_UNDERWATER_THRUSTING
	ret nz ; done if not underwater thrusting anymore

	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_1d2ce
	ld a, $0f
	ld [wceed], a
	load_sound SFX_0F
.asm_1d2ce
	update_anim_1
	call Func_1f470
	ld a, [wWarioState]
	cp ST_UNDERWATER_THRUSTING
	ret nz ; done if not underwater thrusting anymore

	call Func_1e46a
	ret
; 0x1d2ea

SetState_SwimKnockBack: ; 1d2ea (7:52ea)
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	load_sound SFX_03
	ld a, ST_SWIM_KNOCK_BACK
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca6d], a
	ld [wca9c], a
	ld [wc0e0], a
	ld a, $04
	ld [wca7b], a
	ld a, $60
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1d33a
	load_frameset_ptr Frameset_15573
	jr .asm_1d344
.asm_1d33a
	load_frameset_ptr Frameset_15569
.asm_1d344
	update_anim_1
	ret
; 0x1d354

UpdateState_SwimKnockBack: ; 1d354 (7:5354)
	farcall Func_19734
	ld a, b
	and a
	jr nz, .asm_1d38a
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $04
	jr c, .asm_1d376
	cp $08
	jr c, .asm_1d37a
	jr .asm_1d38a
.asm_1d376
	ld b, $02
	jr .asm_1d37c
.asm_1d37a
	ld b, $01
.asm_1d37c
	ld a, [wDirection]
	and a
	jr nz, .asm_1d386
	call Func_1270
	ret
.asm_1d386
	call Func_1259
	ret

.asm_1d38a
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	jp SetState_Submerged
; 0x1d395

UpdateState_WaterStung: ; 1d395 (7:5395)
	update_anim_1

	ld hl, wWarioStateCounter
	inc [hl]
	farcall Func_1996e
	ld a, b
	and a
	jr nz, .asm_1d3ed
	farcall Func_19acd
	ld a, [wc0db]
	and a
	jr z, .asm_1d404
	ld a, [wWarioStateCounter]
	cp $78
	jr nc, .asm_1d3f8
	ld a, [wc08f]
	and $01
	ret nz
	ld b, $01
	call Func_129e
	ld a, [wcee0]
	and a
	ret z
	xor a
	ld [wcee0], a
	jr .asm_1d3f8

.asm_1d3ed
	ld a, [wWarioStateCounter]
	cp $78
	ret c
	ld a, $40
	ld [wc0e1], a
.asm_1d3f8
	xor a
	ld [wca8a], a
	ld a, $10
	ld [wca8c], a
	jp SetState_Submerged

.asm_1d404
	ld a, [wWarioStateCounter]
	cp $78
	ret c
	xor a
	ld [wca8a], a
	ld a, $10
	ld [wca8c], a
	jp Func_1cf7a
; 0x1d416

SetState_TryingSubmerge: ; 1d416 (7:5416)
	ld a, ST_TRYING_SUBMERGE
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1d43b
	load_frameset_ptr Frameset_155b0
	jr .asm_1d445
.asm_1d43b
	load_frameset_ptr Frameset_155b7
.asm_1d445
	update_anim_1
	ret
; 0x1d455

UpdateState_TryingSubmerge: ; 1d455 (7:5455)
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jp z, SetState_WaterSurfaceIdling
	update_anim_1
	ret
; 0x1d46d

UpdateState_Crouching: ; 1d46d (7:546d)
	farcall Func_19b25
	ld a, [wWarioState]
	cp ST_CROUCHING
	ret nz ; done if not crouching anymore

	ld a, [wc0db]
	and a
	jp nz, Func_1cd48
	call Func_1eb46
	ld a, [wWarioState]
	cp ST_CROUCHING
	ret nz ; done if not crouching anymore

	farcall Func_198e0
	ld a, b
	and a
	jp z, Func_1ed34
	ret
; 0x1d4a7

UpdateState_CrouchWalking: ; 1d4a7 (7:54a7)
	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_1d4be
	ld a, $15
	ld [wceed], a
	load_sound SFX_4A
.asm_1d4be
	update_anim_1

	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wWarioState]
	cp ST_CROUCH_WALKING
	ret nz ; done if not crouch walking anymore

	ld a, [wc0db]
	and a
	jp nz, Func_1cd48
	call Func_1ec6c
	ld a, [wWarioState]
	cp ST_CROUCH_WALKING
	ret nz ; done if not crouch walking anymore

	farcall Func_198e0
	ld a, b
	and a
	jp z, Func_1ed34
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [wIsStandingOnSlope]
	and a
	jr nz, .asm_1d51f
	ret
.asm_1d51f
	jp SetState_Sliding
; 0x1d522

UpdateState_CrouchAirborne: ; 1d522 (7:5522)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_1cd48
	ld a, [wcaa0]
	and a
	jr z, .asm_1d555
	farcall Func_1a0e8
	ret
.asm_1d555
	ld a, [wWarioState]
	cp ST_CROUCH_AIRBORNE
	ret nz ; done if not crouch jumping anymore

	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr nz, .asm_1d583
	ld a, $e5
	ld [wca6f], a
	farcall Func_1996e
	ld a, [wWarioState]
	cp ST_CROUCH_AIRBORNE
	ret nz ; done if not crouch jumping anymore

	ld a, b
	and a
	jr nz, .asm_1d583
	jp StartJump
.asm_1d583
	ld a, $f1
	ld [wca6f], a
	call Func_1f077
	ld a, [wWarioState]
	cp ST_CROUCH_AIRBORNE
	ret nz ; done if not crouch jumping anymore

	ld a, [wca95]
	and a
	jr z, .asm_1d5c9
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1d5b0
	load_frameset_ptr Frameset_14a38
	jr .asm_1d5ba
.asm_1d5b0
	load_frameset_ptr Frameset_14a3b
.asm_1d5ba
	update_anim_1
.asm_1d5c9
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .falling

; raising
	farcall Func_1996e
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp ST_CROUCH_AIRBORNE
	ret nz ; done if not crouch jumping anymore

	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ret

.falling
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_1d60a
	ld a, [wWarioState]
	cp ST_CROUCH_AIRBORNE
	ret nz ; done if not crouch jumping anymore
	jp Func_14de

.asm_1d60a
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [wWarioState]
	cp ST_CROUCH_AIRBORNE
	ret nz ; done if not crouch jumping anymore

	call UpdateState_Airborne.asm_1c541
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	ret z
	jp Func_1e855
; 0x1d627

UpdateState_Stung: ; 1d627 (7:5627)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_1cd48
	ld a, [wcaa0]
	and a
	jr z, .asm_1d65a
	farcall Func_1a0e8
	ret

.asm_1d65a
	call Func_1f6c2
	update_anim_1
	farcall Func_19734
	ld a, b
	and a
	jr nz, .asm_1d6a3
	ld a, [wDirection]
	and a
	jr nz, .asm_1d694
	ld b, $01
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1d68f
	inc b
.asm_1d68f
	call Func_1270
	jr .asm_1d6b5
.asm_1d694
	ld b, $01
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1d69e
	inc b
.asm_1d69e
	call Func_1259
	jr .asm_1d6b5
.asm_1d6a3
	ld a, [wDirection]
	and a
	jr nz, .asm_1d6b0
	ld b, $01
	call Func_1259
	jr .asm_1d6b5

.asm_1d6b0
	ld b, $01
	call Func_1270
.asm_1d6b5
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_1d6e3
	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp MAX_JUMP_VEL_INDEX
	jp nc, .asm_1d759
	farcall Func_198e0
	ld a, b
	and $0f
	ret nz
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a
	ret

.asm_1d6e3
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
	jr .asm_1d6e3

.falling
	ld b, [hl]
	call Func_1287
	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp MAX_JUMP_VEL_INDEX
	jr c, .asm_1d724
	ld [hl], MAX_JUMP_VEL_INDEX
.asm_1d724
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_1d73a
	jp Func_14de

.asm_1d73a
	call Func_14f6
	ld a, [wJumpVelTable]
	inc a
	ld [wJumpVelTable], a
	sub $02
	jr z, .asm_1d74d
	dec a
	jr z, .asm_1d753
	jr .asm_1d759
.asm_1d74d
	ld a, $0a
	ld [wJumpVelIndex], a
	ret

.asm_1d753
	ld a, $0e
	ld [wJumpVelIndex], a
	ret

.asm_1d759
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, ST_STUNG_RECOVERY
	ld [wWarioState], a
	ret
; 0x1d766

UpdateState_StungRecovery: ; 1d766 (7:5766)
	call Func_1f6c2
	update_anim_1
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $14
	ret c

	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a

	ld a, $10
	ld [wca8c], a
	ld hl, Pals_c800
	call Func_1af6
	ld a, $e5
	ld [wca6f], a
	farcall Func_1996e
	ld a, [wWarioState]
	cp ST_STUNG_RECOVERY
	ret nz ; done if not stung recovering anymore

	ld a, b
	and a
	jr nz, .asm_1d7b9
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jp z, SetState_Idling
.asm_1d7b9
	ld a, $f1
	ld [wca6f], a
	jp Func_1e855
; 0x1d7c1

UpdateState_PipeGoingDown: ; 1d7c1 (7:57c1)
	ld a, $01
	ld [wca8a], a
	update_anim_1
	ld b, $01
	call Func_1287

	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $20
	jr z, .asm_1d7f9
	cp $21
	jr z, .asm_1d804
	cp $40
	ret c
	ld a, [wca64]
	sub $08
	ld [wca64], a
	xor a
	ld [wca8a], a
	jp SetState_Idling

.asm_1d7f9
	call Func_1079
	ld hl, wc0d7
	res 7, [hl]
	jp Func_11f6
.asm_1d804
	load_sound SFX_E1
	ret
; 0x1d80d

UpdateState_PipeGoingUp: ; 1d80d (7:580d)
	ld a, $01
	ld [wca8a], a
	update_anim_1
	ld b, $01
	call Func_129e

	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $20
	jr z, .asm_1d848
	cp $21
	jr z, .asm_1d853
	cp $40
	ret c
	ld a, [wca64]
	sub $08
	ld [wca64], a
	xor a
	ld [wca8a], a
	call Func_1146
	jp SetState_Idling

.asm_1d848
	call Func_1079
	ld hl, wc0d7
	res 7, [hl]
	jp Func_11f6
.asm_1d853
	load_sound SFX_E1
	ret
; 0x1d85c

	INCROM $1d85c, $1d8f8

UpdateState_SmashAttacking: ; 1d8f8 (7:58f8)
	update_anim_1
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $1b
	ret c
	xor a
	ld [wca96], a
	jp SetState_Idling
; 0x1d916

UpdateState_PickingUp: ; 1d916 (7:5916)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, Func_1dd78
	ld a, [wca9a]
	and a
	jp z, SetState_Idling
	and $0f
	cp $02
	jp z, Func_1efe7
	update_anim_1
	ld a, [wc1a8]
	and a
	ret z
	jp Func_1efe7
; 0x1d943

UpdateState_GrabIdling: ; 1d943 (7:5943)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wWarioState]
	cp ST_GRAB_IDLING
	ret nz ; done not grab idling anymore

	ld a, [wca9a]
	and a
	jp z, SetState_Idling
	call Func_1ee88
	ld a, [wWarioState]
	cp ST_GRAB_IDLING
	ret nz ; done not grab idling anymore

	farcall Func_198e0
	ld a, [wWarioState]
	cp ST_GRAB_IDLING
	ret nz ; done not grab idling anymore

	ld a, b
	and a
	jp z, Func_1edd3
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret
; 0x1d995

UpdateState_GrabWalking: ; 1d995 (7:5995)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wWarioState]
	cp ST_GRAB_WALKING
	ret nz ; done if not grab walking anymore

	ld a, [wca9a]
	and a
	jp z, HandleInput_Idling.no_turning
	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_1d9cf
	ld a, $24
	ld [wceed], a
	load_sound SFX_04
.asm_1d9cf
	update_anim_1
	call Func_1eefc
	ld a, [wWarioState]
	cp ST_GRAB_WALKING
	ret nz ; done if not grab walking anymore

	farcall Func_198e0
	ld a, b
	and a
	jp z, Func_1edd3
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret
; 0x1da07

SetState_ThrowingAirborne: ; 1da07 (7:5a07)
	ld a, ST_THROWING_AIRBORNE
	ld [wWarioState], a
	ld a, [wca9a]
	and $f0
	or $07
	ld [wca9a], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1da43
	load_frameset_ptr Frameset_15fae
.asm_1da33
	update_anim_1
	ret
.asm_1da43
	load_frameset_ptr Frameset_15fb3
	jr .asm_1da33
; 0x1da4f

UpdateState_GrabAirborne: ; 1da4f (7:5a4f)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wWarioState]
	cp ST_GRAB_AIRBORNE
	ret nz ; done if not grabbing airborne anymore

	ld a, [wc0db]
	and a
	jp nz, Func_1cd48
	ld a, [wca9a]
	and a
	jp z, Func_1c2ae
	ld a, [wcaa0]
	and a
	jr z, .asm_1da8f
	farcall Func_1a0e8
	ret

.asm_1da8f
	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, SetState_ThrowingAirborne
	call Func_1f077
	ld a, [wWarioState]
	cp ST_GRAB_AIRBORNE
	ret nz ; done if not grabbing airborne anymore

	ld a, [wPowerUpLevel]
	cp POWER_UP_LEAD_OVERALLS
	jr c, .asm_1dadc
	ld a, [wca96]
	and a
	jr nz, .asm_1dacf
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr c, .asm_1dadc
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr z, .asm_1dadc
	ld a, $01
	ld [wca96], a

.asm_1dac0
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1db2c
	jr .asm_1db0d

.asm_1dacf
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr nz, .asm_1dadc
	xor a
	ld [wca96], a
	jr .asm_1dae8
.asm_1dadc
	ld a, [wca95]
	and a
	jr z, .asm_1db49
	ld a, [wca96]
	and a
	jr nz, .asm_1dac0
.asm_1dae8
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1db01
	load_frameset_ptr Frameset_15fa8
	jr .asm_1db49
.asm_1db01
	load_frameset_ptr Frameset_15fab
	jr .asm_1db49

.asm_1db0d
	ld a, [wPowerUpLevel]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jr nc, .asm_1db20
	load_frameset_ptr Frameset_15fec
	jr .asm_1db49
.asm_1db20
	load_frameset_ptr Frameset_1605c
	jr .asm_1db49
.asm_1db2c
	ld a, [wPowerUpLevel]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jr nc, .asm_1db3f
	load_frameset_ptr Frameset_15fef
	jr .asm_1db49
.asm_1db3f
	load_frameset_ptr Frameset_16063
.asm_1db49
	update_anim_1

	ld a, [wca9a]
	bit 7, a
	jr z, .asm_1db6b
	ld a, [wca86]
	cp $08
	jr c, .asm_1db6b
	ld a, $04
	ld [wca86], a
.asm_1db6b
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1db8a
	farcall Func_1996e
	ld a, b
	and a
	ret z
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ret

.asm_1db8a
	farcall Func_199e9
	ld a, [wWarioState]
	cp ST_GRAB_AIRBORNE
	ret nz ; done if not grabbing airborne anymore

	ld a, b
	and a
	jr nz, .asm_1dba6
	jp Func_14de
.asm_1dba6
	call Func_14f6
	ld a, [wc1aa]
	and a
	jr nz, .asm_1dbb7
	load_sound SFX_10
.asm_1dbb7
	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wca86], a
	ld a, [wca96]
	and a
	jr z, .asm_1dbd0
	ld a, [wPowerUpLevel]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jr c, .asm_1dc25
	jr .asm_1dbd3
.asm_1dbd0
	jp Func_1efe7

.asm_1dbd3
	ld a, [wca97]
	and a
	jr nz, .asm_1dbe3
	ld a, $20
	ld [wca97], a
	ld a, $01
	ld [wca98], a
.asm_1dbe3
	ld a, [wc1aa]
	and a
	jr nz, .asm_1dbf1
	load_sound SFX_02
.asm_1dbf1
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1dc0a
	load_frameset_ptr Frameset_15fd2
	jr .asm_1dc14
.asm_1dc0a
	load_frameset_ptr Frameset_15fdf
.asm_1dc14
	update_anim_1
	jr .asm_1dc5f

.asm_1dc25
	load_sound SFX_33
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1dc46
	load_frameset_ptr Frameset_16020
	jr .asm_1dc50
.asm_1dc46
	load_frameset_ptr Frameset_16037
.asm_1dc50
	update_anim_1

.asm_1dc5f
	ld a, $81
	ld [wca96], a
	ld a, ST_GRAB_SMASH_ATTACKING
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
; 0x1dc8b

SetState_ThrowCharging: ; 1dc8b (7:5c8b)
	load_sound SFX_2C
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, ST_THROW_CHARGING
	ld [wWarioState], a
	ld a, [wca9a]
	and $f0
	add $04
	ld [wca9a], a
	ld a, $04
	ld [wca7b], a
	ld a, $70
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $60
	ld [wSpritePtr + 0], a
	ld a, $6a
	ld [wSpritePtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1dce2
	load_frameset_ptr Frameset_1642c
	jr .asm_1dcec
.asm_1dce2
	load_frameset_ptr Frameset_1642f
.asm_1dcec
	update_anim_1
	ret
; 0x1dcfc

UpdateState_ThrowCharging: ; 1dcfc (7:5cfc)
	ld a, [wca9a]
	and a
	jp z, SetState_Idling
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jp z, Func_1de3f
	bit A_BUTTON_F, a
	jp nz, Func_1dd78
	bit D_DOWN_F, a
	jp nz, Func_1e855

	ld a, [wca9a]
	bit 7, a
	jr nz, .asm_1dd20
	ld b, $1e
	jr .asm_1dd22
.asm_1dd20
	ld b, $3c
.asm_1dd22
	ld a, [wWarioStateCounter]
	inc a
	ld [wWarioStateCounter], a
	cp b
	jr nc, .asm_1dd2d
	ret

.asm_1dd2d
	xor a
	ld [wceed], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a

	ld a, ST_THROW_FULLY_CHARGED
	ld [wWarioState], a
	ld a, [wca9a]
	and $f0
	add $05
	ld [wca9a], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1dd5e
	load_frameset_ptr Frameset_16432
	jr .asm_1dd68
.asm_1dd5e
	load_frameset_ptr Frameset_16435
.asm_1dd68
	update_anim_1
	ret
; 0x1dd78

Func_1dd78: ; 1dd78 (7:5d78)
	xor a
	ld [wca9a], a
	jp StartJump_FromInput
; 0x1dd7f

UpdateState_ThrowFullyCharged: ; 1dd7f (7:5d7f)
	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_1dd96
	ld a, $1e
	ld [wceed], a
	load_sound SFX_2D
.asm_1dd96
	ld a, [wca9a]
	and a
	jp z, SetState_Idling
	and $0f
	cp $06
	jr z, .asm_1dde0
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_1dde0
	ld a, [wc1a8]
	and a
	jr z, .asm_1dde0
	ld a, [wca9a]
	and $f0
	add $06
	ld [wca9a], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	inc a
	ld [wWarioStateCounter], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1ddd6
	load_frameset_ptr Frameset_16438
	jr .asm_1dde0
.asm_1ddd6
	load_frameset_ptr Frameset_16441
.asm_1dde0
	update_anim_1

	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jr z, .asm_1de01
	bit A_BUTTON_F, a
	jp nz, Func_1dd78
	bit D_DOWN_F, a
	jp nz, Func_1e855
	ret

.asm_1de01
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1de1a
	load_frameset_ptr Frameset_16403
	jr .asm_1de24
.asm_1de1a
	load_frameset_ptr Frameset_16423
.asm_1de24
	update_anim_1

	ld a, [wca9a]
	and $f0
	add $47
	ld [wca9a], a
	jr SetState_Throwing

Func_1de3f: ; 1de3f (7:5e3f)
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1de58
	load_frameset_ptr Frameset_163fe
	jr .asm_1de62
.asm_1de58
	load_frameset_ptr Frameset_1641e
.asm_1de62
	update_anim_1

	ld a, [wca9a]
	and $f0
	add $07
	ld [wca9a], a
;	fallthrough

SetState_Throwing: ; 1de7b (7:5e7b)
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, ST_THROWING
	ld [wWarioState], a
	ret
; 0x1de88

UpdateState_Throwing: ; 1de88 (7:5e88)
	ld a, [wca9a]
	and a
	jp z, SetState_Idling
	update_anim_1
	ld a, [wc1a8]
	and a
	ret z
	xor a
	ld [wca9a], a
	jp SetState_Idling
; 0x1deaa

UpdateState_ThrowingAirborne: ; 1deaa (7:5eaa)
	ld a, [wca9a]
	and a
	jp z, Func_1c2ae
	update_anim_1
	ld a, [wc1a8]
	and a
	ret z
	xor a
	ld [wca9a], a
	jp Func_1c2ae
; 0x1decc

UpdateState_GrabSmashAttacking: ; 1decc (7:5ecc)
	ld a, [wca9a]
	and a
	jp z, SetState_Idling
	update_anim_1
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $1b
	ret c
	xor a
	ld [wca96], a
	jp Func_1efe7
; 0x1def1

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
	ld a, [wIsStandingOnSlope]
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
	update_anim_1
	ret
; 0x1dfd4

UpdateState_Sliding: ; 1dfd4 (7:5fd4)
	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_1dfeb
	ld a, $0c
	ld [wceed], a
	load_sound SFX_0B
.asm_1dfeb
	update_anim_1
	call Func_1f825
	ld a, [wWarioState]
	cp ST_SLIDING
	ret nz ; done if not sliding anymore

	farcall Func_198c7
	ld a, b
	and a
	jp z, Func_1e174

	ld hl, hffa8
	ld de, wca61
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
	farcall Func_19734
	ld a, b
	and $0f
	jp nz, Func_1ca0e
	ld a, [wc1a8]
	and a
	ret z
;	fallthrough

SetState_Rolling: ; 1e042 (7:6042)
	xor a
	ld [wceed], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a

	ld a, ST_ROLLING
	ld [wWarioState], a
	ld a, $ff
	ld [wca70], a
	ld a, $f2
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $02
	ld [wca9d], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1e083
	load_frameset_ptr Frameset_166e6
	jr .asm_1e08d
.asm_1e083
	load_frameset_ptr Frameset_166f7
.asm_1e08d
	update_anim_1
	ret
; 0x1e09d

UpdateState_Rolling: ; 1e09d (7:609d)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_1e0ca
	ld a, $0c
	ld [wceed], a
	load_sound SFX_0A
.asm_1e0ca
	update_anim_1

	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .asm_1e145
	ld a, [wDirection]
	and a
	jr nz, .asm_1e0ee
	call Func_151e.asm_153f
	call Func_1270
	jr .asm_1e0f4
.asm_1e0ee
	call Func_151e
	call Func_1259

.asm_1e0f4
	ld a, [wca86]
	cp $18
	jr c, .asm_1e100
	ld a, $14
	ld [wca86], a
.asm_1e100
	farcall Func_19734
	ld a, b
	and $0f
	jp nz, Func_1c9fa
	farcall Func_198e0
	ld a, b
	and a
	jp z, Func_1e174

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
	jp nz, Func_1ca0e
	ret

.asm_1e145
	farcall Func_198e0
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [wIsStandingOnSlope]
	and a
	jp z, Func_1e1e3
	and $0f
	dec a
	ld b, a
	ld a, [wDirection]
	xor b
	jp nz, Func_1ca0e
	jp Func_1e1e3
; 0x1e174

Func_1e174: ; 1e174 (7:6174)
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
;	fallthrough

SetState_Unknown29: ; 1e179 (7:6179)
	xor a
	ld [wIsStandingOnSlope], a
	ld [wca9a], a
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a
	ld a, ST_ROLLING_AIRBORNE
	ld [wWarioState], a
	ld a, $02
	ld [wca9d], a
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
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1e1c9
	load_frameset_ptr Frameset_166e6
	jr .asm_1e1d3
.asm_1e1c9
	load_frameset_ptr Frameset_166f7
.asm_1e1d3
	update_anim_1
	ret
; 0x1e1e3

Func_1e1e3: ; 1e1e3 (7:61e3)
	xor a
	ld [wJumpVelIndex], a
	jr SetState_Unknown29
; 0x1e1e9

UpdateState_RollingAirborne: ; 1e1e9 (7:61e9)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_1cd48
	ld a, [wcaa0]
	and a
	jr z, .asm_1e21c
	farcall Func_1a0e8
	ret

.asm_1e21c
	update_anim_1
	ld a, [wDirection]
	and a
	jr nz, .asm_1e239
	call Func_151e.asm_153f
	call Func_1270
	jr .asm_1e23f
.asm_1e239
	call Func_151e
	call Func_1259

.asm_1e23f
	ld a, [wca86]
	cp $18
	jr c, .asm_1e24b
	ld a, $14
	ld [wca86], a
.asm_1e24b
	farcall Func_19734
	ld a, b
	and $0f
	jp nz, Func_1c9fa

	ld a, [wJumpVelIndex]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_HighJump
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
	jr .asm_1e28a

.falling
	ld b, [hl]
	call Func_1287
	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp MAX_JUMP_VEL_INDEX
	jr c, .asm_1e28a
	ld [hl], MAX_JUMP_VEL_INDEX

.asm_1e28a
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1e2a9
	farcall Func_1996e
	ld a, b
	and a
	ret z
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ret

.asm_1e2a9
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_1e2bf
	jp Func_14de
.asm_1e2bf
	call Func_14f6
	jp SetState_Rolling
; 0x1e2c5

	INCROM $1e2c5, $1e347

UpdateState_GroundShakeStunned: ; 1e347 (7:6347)
	update_anim_1
	ld a, [wca97]
	and a
	jr z, .asm_1e3b6
	ld a, [wJumpVelTable]
	and a
	ret z
	call Func_1488
	farcall Func_2b1a6
	call Func_1762
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1e395
	farcall Func_1996e
	ld a, b
	and a
	ret z
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ret

.asm_1e395
	farcall Func_198e0
	ld a, b
	and a
	jr nz, .asm_1e3ab
	jp Func_14de
.asm_1e3ab
	call Func_14f6
	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ret
.asm_1e3b6
	ld a, $e5
	ld [wca6f], a
	farcall Func_1996e
	ld a, b
	and a
	jr z, .asm_1e3d1
	jp Func_1e855
.asm_1e3d1
	farcall Func_198e0
	ld a, b
	and a
	jp z, Func_1c2ae
	jp SetState_Idling
; 0x1e3e8

UpdateState_EnteringDoor: ; 1e3e8 (7:63e8)
	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_1e3ff
	ld a, $24
	ld [wceed], a
	load_sound SFX_04
.asm_1e3ff
	update_anim_1

	ld a, [wWarioStateCounter]
	dec a
	jr z, .asm_1e444
	dec a
	jr z, .asm_1e455
	dec a
	jr z, .asm_1e45a
	ld a, [wc1a8]
	and a
	ret z

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_14d15
	update_anim_1
	ld hl, wWarioStateCounter
	inc [hl]
	ret

.asm_1e444
	ld a, [wc1a8]
	and a
	ret z
	ld hl, wWarioStateCounter
	inc [hl]
	ld hl, wc0d7
	res 7, [hl]
	jp Func_11f6

.asm_1e455
	ld hl, wWarioStateCounter
	inc [hl]
	ret

.asm_1e45a
	ld a, [wc1a8]
	and a
	ret z
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, HandleInput_Idling.no_turning
	jp SetState_Idling
; 0x1e46a

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
	update_anim_1
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
	update_anim_1
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
	update_anim_1
	ret
; 0x1e855

Func_1e855: ; 1e855 (7:6855)
	ld a, [wIsStandingOnSlope]
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
	update_anim_1
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
	update_anim_1
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

Func_1eb46: ; 1eb46 (7:6b46)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, Func_1ec19
	bit B_BUTTON_F, a
	jp nz, Func_1ec4b
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr nz, .asm_1eb79

	ld a, $e5
	ld [wca6f], a
	farcall Func_1996e
	ld a, [wWarioState]
	cp ST_CROUCHING
	ret nz ; done if not crouching anymore

	ld a, b
	and a
	jp z, SetState_Idling

.asm_1eb79
	ld a, $f1
	ld [wca6f], a
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	ret z
	bit D_RIGHT_F, a
	jr nz, .asm_1eb8f
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jr SetState_CrouchWalking
.asm_1eb8f
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
;	fallthrough

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
	update_anim_1
	ret
.asm_1ec0d
	load_frameset_ptr Frameset_14a2f
	jr .asm_1ebfd
; 0x1ec19

Func_1ec19: ; 1ec19 (7:6c19)
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a
	ld a, $e5
	ld [wca6f], a
	farcall Func_1996e

	ld a, [wWarioState]
	cp ST_CROUCHING
	jr z, .asm_1ec3c
	cp ST_CROUCH_WALKING
	ret nz

.asm_1ec3c
	ld a, b
	and a
	jp z, Func_1ed3f
	xor a
	ld [wJumpVelTable], a
	ld a, $f1
	ld [wca6f], a
	ret
; 0x1ec4b

Func_1ec4b: ; 1ec4b (7:6c4b)
	ld a, $e5
	ld [wca6f], a
	farcall Func_1996e
	ld a, b
	and a
	jr nz, .asm_1ec66
	jp SetState_Attacking
.asm_1ec66
	ld a, $f1
	ld [wca6f], a
	ret
; 0x1ec6c

Func_1ec6c: ; 1ec6c (7:6c6c)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, Func_1ec19
	bit B_BUTTON_F, a
	jr nz, Func_1ec4b
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr nz, .asm_1ec9d

	ld a, $e5
	ld [wca6f], a
	farcall Func_1996e
	ld a, [wWarioState]
	cp ST_CROUCH_WALKING
	ret nz ; done if not crouch walking anymore

	ld a, b
	and a
	jp z, SetState_Idling

.asm_1ec9d
	ld a, $f1
	ld [wca6f], a
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_1ecb0
	bit D_LEFT_F, a
	jr nz, .asm_1ecf2
	jp Func_1e855

.asm_1ecb0
	ld a, [wDirection]
	and a
	jr nz, .asm_1eccc
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_14a2f
.asm_1eccc
	farcall Func_19734
	ld a, b
	and $0f
	ret nz
	call Func_151e
	call Func_1259
	ld a, [wca86]
	cp $04
	jr c, .asm_1ecf1
	ld a, $00
	ld [wca86], a
.asm_1ecf1
	ret

.asm_1ecf2
	ld a, [wDirection]
	and a
	jr z, .asm_1ed0e
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_14a26
.asm_1ed0e
	farcall Func_19734
	ld a, b
	and $0f
	ret nz
	call Func_151e.asm_153f
	call Func_1270
	ld a, [wca86]
	cp $04
	jr c, .asm_1ed33
	ld a, $00
	ld [wca86], a
.asm_1ed33
	ret
; 0x1ed34

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
	ld a, ST_CROUCH_AIRBORNE
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
	update_anim_1

	ld a, [wcac9]
	and a
	ret z
	ld b, $02
	call Func_129e
	ret
; 0x1edd3

Func_1edd3: ; 1edd3 (7:6dd3)
	ld a, [wca9a]
	and $f0
	add $03
	ld [wca9a], a
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_HIGH_JUMP
	ld [wJumpVelTable], a
	jr SetState_GrabAirborne
;	fallthrough

Func_1ede9: ; 1ede9 (7:6de9)
	load_sound SFX_01
	xor a
	ld [wJumpVelIndex], a
	ld [wca96], a
	ld a, [wPowerUpLevel]
	cp POWER_UP_HIGH_JUMP_BOOTS
	ld a, JUMP_VEL_NORMAL
	jr c, .asm_1ee0a
	ld hl, wJoypadDown
	bit D_UP_F, [hl]
	jr z, .asm_1ee0a
	ld a, JUMP_VEL_HIGH_JUMP
.asm_1ee0a
	ld [wJumpVelTable], a
;	fallthrough

SetState_GrabAirborne: ; 1ee0d (7:6e0d)
	ld a, ST_GRAB_AIRBORNE
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
	jr nz, .asm_1ee66
	load_frameset_ptr Frameset_15fa8
	jr .asm_1ee70
.asm_1ee66
	load_frameset_ptr Frameset_15fab
.asm_1ee70
	update_anim_1
	ld a, [wcac9]
	and a
	ret z
	call UpdateState_GrabAirborne
	ret
; 0x1ee88

Func_1ee88: ; 1ee88 (7:6e88)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, Func_1ede9
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jp nz, SetState_ThrowCharging
	bit D_DOWN_F, a
	jp nz, Func_1e855
	and D_RIGHT | D_LEFT
	jr nz, .asm_1eea2
	ret

.asm_1eea2
	ld a, ST_GRAB_WALKING
	ld [wWarioState], a
	xor a
	ld [wceed], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, $ff
	ld [wca70], a
	ld a, $e5
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a

	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_1eeeb
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	load_frameset_ptr Frameset_149fe
.asm_1eedb
	update_anim_1
	ret
.asm_1eeeb
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	load_frameset_ptr Frameset_14a0f
	jr .asm_1eedb
; 0x1eefc

Func_1eefc: ; 1eefc (7:6efc)
	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, SetState_ThrowCharging
	bit A_BUTTON_F, a
	jp nz, Func_1ede9
	bit D_DOWN_F, a
	jp nz, .asm_1efaf
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_1ef31
	bit D_LEFT_F, a
	jr nz, .asm_1ef4d
	call Func_1700
	jr z, .asm_1ef2e
	farcall Func_1a773
	ret
.asm_1ef2e
	jp Func_1efe7

.asm_1ef31
	ld a, [wDirection]
	and a
	jp z, Func_1efe7
	farcall Func_19734
	ld a, b
	and $0f
	ret nz
	jr .asm_1ef69

.asm_1ef4d
	ld a, [wDirection]
	and a
	jp nz, Func_1efe7
	farcall Func_19734
	ld a, b
	and $0f
	ret nz
	jr .asm_1ef7b

.asm_1ef69
	call Func_151e
	call Func_1259
	ld a, [wIsStandingOnSlope]
	and a
	jr z, .asm_1ef8d
	bit 0, a
	jr z, .asm_1ef8d
	jr .asm_1efc5

.asm_1ef7b
	call Func_151e.asm_153f
	call Func_1270
	ld a, [wIsStandingOnSlope]
	and a
	jr z, .asm_1ef8d
	bit 0, a
	jr nz, .asm_1ef8d
	jr .asm_1efc5
.asm_1ef8d
	ld a, [wca9a]
	bit 7, a
	jr nz, .asm_1efa1
	ld a, [wca86]
	cp $10
	jr c, .asm_1efa0
	ld a, $0c
	ld [wca86], a
.asm_1efa0
	ret

.asm_1efa1
	ld a, [wca86]
	cp $08
	jr c, .asm_1efa0
	ld a, $04
	ld [wca86], a
	jr .asm_1efa0

.asm_1efaf
	call Func_1700
	jp z, Func_1e855
	farcall Func_19e7f
	ret

.asm_1efc5
	ld a, [wca9a]
	bit 7, a
	jr nz, .asm_1efd9
	ld a, [wca86]
	cp $08
	jr c, .asm_1efd8
	ld a, $04
	ld [wca86], a
.asm_1efd8
	ret

.asm_1efd9
	ld a, [wca86]
	cp $04
	jr c, .asm_1efd8
	ld a, $00
	ld [wca86], a
	jr .asm_1efd8
; 0x1efe7

Func_1efe7: ; 1efe7 (7:6fe7)
	ld a, [wca9a]
	and a
	jp z, SetState_Idling
	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wca96], a
	ld [wca8b], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, [wca9a]
	and $f0
	add $03
	ld [wca9a], a

	ld a, ST_GRAB_IDLING
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
	jr nz, .asm_1f05d
	load_frameset_ptr Frameset_14a20
	jr .asm_1f067
.asm_1f05d
	load_frameset_ptr Frameset_14a23
.asm_1f067
	update_anim_1
	ret
; 0x1f077

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
	update_anim_1

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
	update_anim_1

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
	cp ST_WATER_STUNG
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
	update_anim_1
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
	cp ST_WATER_STUNG
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
	update_anim_1
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

Func_1f40f: ; 1f40f (7:740f)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, Func_1c270
	bit B_BUTTON_F, a
	jr z, .asm_1f448

	ld a, [wPowerUpLevel]
	cp POWER_UP_SWIMMING_FLIPPERS
	jp c, .asm_1f448 ; should be jr
	ld a, [wJoypadDown]
	bit D_UP_F, a
	ret nz
	farcall Func_19b12
	ld a, [wc0db]
	cp $02
	jp z, SetState_TryingSubmerge
	ld b, $03
	call Func_1287
	jp Func_1d1e4

.asm_1f448
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	ret z
	ld a, [wPowerUpLevel]
	cp POWER_UP_SWIMMING_FLIPPERS
	jp c, SetState_TryingSubmerge
	farcall Func_19b12
	ld a, [wc0db]
	cp $02
	jp z, SetState_TryingSubmerge
	jp SetState_Submerged
; 0x1f470

Func_1f470: ; 1f470 (7:7470)
	ld hl, wca6d
	inc [hl]
	ld a, [hl]
	cp $28
	jr c, .asm_1f47e
	xor a
	ld [hl], a
	jp SetState_Submerged

.asm_1f47e
	ld a, [wJoypadDown]
	and A_BUTTON | B_BUTTON
	jp z, SetState_Submerged

	ld a, [wca9c]
	bit 4, a
	jr nz, .asm_1f49c
	bit 5, a
	jr nz, .asm_1f4fb
	bit 6, a
	jp nz, .asm_1f600
	bit 7, a
	jp nz, .asm_1f5c3
	ret

.asm_1f49c
	farcall Func_198e0
	ld a, b
	and a
	jr z, .asm_1f4ba
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
.asm_1f4ba
	ld a, [wWarioState]
	cp ST_WATER_STUNG
	ret z

	farcall Func_19741
	ld a, b
	and a
	jp nz, SetState_SwimKnockBack
	ld a, [wca6d]
	ld e, a
	ld d, $00
	ld hl, Data_1f86c
	ld a, [wca9c]
	and $c0
	jr z, .asm_1f4e7
	ld hl, Data_1f8bc
.asm_1f4e7
	add hl, de
	ld b, [hl]
	call Func_1259

	ld a, [wca9c]
	bit 6, a
	jp nz, .asm_1f600
	bit 7, a
	jp nz, .asm_1f5c3
	jr .asm_1f55a
.asm_1f4fb
	farcall Func_198e0
	ld a, b
	and a
	jr z, .asm_1f519
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
.asm_1f519
	ld a, [wWarioState]
	cp ST_WATER_STUNG
	ret z

	farcall Func_197b1
	ld a, b
	and a
	jp nz, SetState_SwimKnockBack
	ld a, [wca6d]
	ld e, a
	ld d, $00
	ld hl, Data_1f86c
	ld a, [wca9c]
	and $c0
	jr z, .asm_1f546
	ld hl, Data_1f8bc
.asm_1f546
	add hl, de
	ld b, [hl]
	call Func_1270

	ld a, [wca9c]
	bit 6, a
	jp nz, .asm_1f600
	bit 7, a
	jp nz, .asm_1f5c3
	jr .asm_1f55a

.asm_1f55a
	ld a, [wJoypadDown]
	and $c0
	ret z
	bit 7, a
	jr nz, .asm_1f599
	farcall Func_1996e
	ld a, b
	and a
	jr nz, .asm_1f593
	farcall Func_19acd
	ld a, [wc0db]
	and a
	jp z, Func_1cf7a
	ld b, $01
	call Func_129e
	ret

.asm_1f593
	ld hl, wc0e1
	set 6, [hl]
	ret

.asm_1f599
	farcall Func_198e0
	ld a, b
	and a
	jr nz, .asm_1f5b2
	ld b, $01
	call Func_1287
	ret

.asm_1f5b2
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld hl, wc0e1
	set 7, [hl]
	ret

.asm_1f5c3
	farcall Func_198e0
	ld a, b
	and a
	jr nz, .asm_1f5ef
	ld a, [wca6d]
	ld e, a
	ld d, $00
	ld hl, Data_1f86c
	ld a, [wca9c]
	and $30
	jr z, .asm_1f5e9
	ld hl, Data_1f894
.asm_1f5e9
	add hl, de
	ld b, [hl]
	call Func_1287
	ret

.asm_1f5ef
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld hl, wc0e1
	set 7, [hl]
	ret

.asm_1f600
	farcall Func_1996e
	ld a, b
	and a
	jr nz, .asm_1f642
	farcall Func_19acd
	ld a, [wc0db]
	and a
	jp z, Func_1cf7a
	ld a, [wca6d]
	ld e, a
	ld d, $00
	ld hl, Data_1f86c
	ld a, [wca9c]
	and $30
	jr z, .asm_1f63c
	ld hl, Data_1f894
.asm_1f63c
	add hl, de
	ld b, [hl]
	call Func_129e
	ret

.asm_1f642
	ld hl, wc0e1
	set 6, [hl]
	jp Func_1cdc4
; 0x1f64a

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
	cp ST_STUNG_RECOVERY
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

Func_1f6c2: ; 1f6c2 (7:76c2)
	ld a, [wc08f]
	and $07
	jr z, .asm_1f6ce
	cp $03
	jr z, .asm_1f6d5
	ret

.asm_1f6ce
	ld hl, Pals_c810
	call Func_1af6
	ret

.asm_1f6d5
	ld hl, Pals_c800
	call Func_1af6
	ret
; 0x1f6dc

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
	cp ST_GROUND_SHAKE_STUNNED
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
	jp z, SetState_LadderShakeStunned
	cp ST_LADDER_IDLING
	jp z, SetState_LadderShakeStunned
	cp ST_LADDER_SCRATCHING
	jp z, SetState_LadderShakeStunned

	ld a, ST_GROUND_SHAKE_STUNNED
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
	ld a, JUMP_VEL_KNOCK_BACK
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
	update_anim_1
	ret
; 0x1f7e6

SetState_LadderShakeStunned: ; 1f7e6 (7:77e6)
	ld a, ST_LADDER_SHAKE_STUNNED
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
	update_anim_1
	ret
; 0x1f825

Func_1f825: ; 1f825 (7:7825)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .a_btn
	ld a, [wDirection]
	and a
	jr nz, .dir_right

; dir left
	ld a, [wJoypadPressed]
	bit D_RIGHT_F, a
	jr nz, .asm_1f855
	call Func_1f135
.asm_1f83c
	ld a, [wca86]
	cp $08
	jr c, .asm_1f848
	ld a, $04
	ld [wca86], a
.asm_1f848
	ret

.dir_right
	ld a, [wJoypadPressed]
	bit D_LEFT_F, a
	jr nz, .asm_1f855
	call Func_1f11b
	jr .asm_1f83c
.asm_1f855
	xor a
	ld [wca9d], a
	jp SetState_Idling

.a_btn
	xor a
	ld [wca9d], a
	jp StartJump_FromInput
; 0x1f863

	INCROM $1f863, $1f86c

Data_1f86c: ; 1f86c (7:786c)
	db $01, $01, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00

Data_1f894: ; 1f894 (7:7894)
	db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00

Data_1f8bc: ; 1f8bc (7:78bc)
	db $01, $01, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00
; 0x1f8e4
