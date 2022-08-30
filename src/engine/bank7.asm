Func_1c000: ; 1c000 (7:4000)
	ld hl, wcac2
	ld a, [hl]
	and a
	jr z, .asm_1c008
	dec [hl]
.asm_1c008
	call HandleGroundShake
	call HandleInvincibility
	ld a, [wWarioState]
	cp $30 ; WST_SLIPPING
	jr c, .asm_1c04d
	cp $60 ; WST_ON_FIRE
	jr c, .asm_1c03d
	cp $b0 ; WST_ICE_SKATIN_START
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

	dw UpdateState_Idling              ; WST_IDLING
	dw UpdateState_Walking             ; WST_WALKING
	dw UpdateState_Turning             ; WST_TURNING
	dw Func_156d                       ; WST_UNUSED_03
	dw UpdateState_Airborne            ; WST_AIRBORNE
	dw UpdateState_Landing             ; WST_LANDING
	dw UpdateState_CrouchSliding       ; WST_CROUCH_SLIDING
	dw UpdateState_Attacking           ; WST_ATTACKING
	dw UpdateState_AttackingAirborne   ; WST_ATTACKING_AIRBORNE
	dw UpdateState_Bumping             ; WST_BUMPING
	dw UpdateState_Diving              ; WST_DIVING
	dw UpdateState_Submerged           ; WST_SUBMERGED
	dw UpdateState_WaterSurfaceIdling  ; WST_WATER_SURFACE_IDLING
	dw UpdateState_WaterSurfaceMoving  ; WST_WATER_SURFACE_MOVING
	dw UpdateState_UnderwaterThrusting ; WST_UNDERWATER_THRUSTING
	dw UpdateState_SwimKnockBack       ; WST_SWIM_KNOCK_BACK
	dw UpdateState_WaterStung          ; WST_WATER_STUNG
	dw UpdateState_TryingSubmerge      ; WST_TRYING_SUBMERGE
	dw UpdateState_Crouching           ; WST_CROUCHING
	dw UpdateState_CrouchWalking       ; WST_CROUCH_WALKING
	dw UpdateState_CrouchAirborne      ; WST_CROUCH_AIRBORNE
	dw UpdateState_Stung               ; WST_STUNG
	dw UpdateState_StungRecovery       ; WST_STUNG_RECOVERY
	dw UpdateState_PipeGoingDown       ; WST_PIPE_GOING_DOWN
	dw UpdateState_PipeGoingUp         ; WST_PIPE_GOING_UP
	dw UpdateState_EnemyBumping        ; WST_ENEMY_BUMPING
	dw UpdateState_SmashAttacking      ; WST_SMASH_ATTACKING
	dw Func_156d                       ; WST_UNUSED_1B
	dw Func_156d                       ; WST_UNUSED_1C
	dw Func_156d                       ; WST_UNUSED_1D
	dw UpdateState_PickingUp           ; WST_PICKING_UP
	dw UpdateState_GrabIdling          ; WST_GRAB_IDLING
	dw UpdateState_GrabWalking         ; WST_GRAB_WALKING
	dw UpdateState_GrabAirborne        ; WST_GRAB_AIRBORNE
	dw UpdateState_ThrowCharging       ; WST_THROW_CHARGING
	dw UpdateState_ThrowFullyCharged   ; WST_THROW_FULLY_CHARGED
	dw UpdateState_Throwing            ; WST_THROWING
	dw UpdateState_ThrowingAirborne    ; WST_THROWING_AIRBORNE
	dw UpdateState_GrabSmashAttacking  ; WST_GRAB_SMASH_ATTACKING
	dw UpdateState_Sliding             ; WST_SLIDING
	dw UpdateState_Rolling             ; WST_ROLLING
	dw UpdateState_RollingAirborne     ; WST_ROLLING_AIRBORNE
	dw UpdateState_PickedUp            ; WST_PICKED_UP
	dw UpdateState_GroundShakeStunned  ; WST_GROUND_SHAKE_STUNNED
	dw UpdateState_EnteringDoor        ; WST_ENTERING_DOOR
	dw Func_156d                       ; WST_UNUSED_2D
	dw Func_156d                       ; WST_UNUSED_2E
	dw Func_156d                       ; WST_UNUSED_2F
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
; 1c0b6

UpdateState_Idling: ; 1c0b6 (7:40b6)
	farcall CheckCentreCollision
	ld a, [wWarioState]
	cp WST_IDLING
	ret nz ; not idling
	ld a, b
	and a
	jp z, StartFall

	update_pos_y
	ld a, [wWarioState]
	cp WST_IDLING
	ret nz ; not idling

	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr z, .not_pressing_down
; pressing down, handle what state to change to
	farcall Func_19b12
	ld a, [wWarioState]
	cp WST_IDLING
	ret nz ; not idling
	ld a, [wLadderInteraction]
	cp $02
	jp nz, CrouchOrSlideIfOnSlope
	farcall SetState_LadderClimbing
	ret

.not_pressing_down
	update_anim_1

	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wLadderInteraction]
	and a
	jr z, .skip_ladder
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .skip_ladder
	farcall SetState_LadderClimbing
	ret

.skip_ladder
	ld a, [wIsNearFence]
	and a
	jr z, .handle_input
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .handle_input
	farcall SetState_FenceMovingVertical
	ret

.handle_input
	ld a, [wWarioState]
	cp WST_IDLING
	ret nz ; not idling
	call HandleInput_Idling
	ld a, [wWarioState]
	cp WST_IDLING
	ret nz ; not idling

; still idling, increment idle counter
	ld a, [wIsOnSteppableObject]
	and a
	ret nz ; unless Wario is on steppable object
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
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 36
	ld [wSFXLoopCounter], a
	play_sfx SFX_WALK
.skip_sfx
	update_anim_1

	ld a, [wAnimationEnded]
	and a
	jr z, .handle_input
	get_pos
	ld b, PARTICLE_DUST
	farcall CreateParticle

.handle_input
	call HandleInput_Walking
	ld a, [wWarioState]
	cp WST_WALKING
	ret nz ; return if not walking anymore

	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWarioState]
	cp WST_WALKING
	ret nz ; return if not walking anymore

	farcall CheckCentreCollision
	ld a, [wWarioState]
	cp WST_WALKING
	ret nz ; return if not walking anymore
	ld a, b
	and a
	jp z, StartFall

	update_pos_y
	ret
; 0x1c244

UpdateState_Turning: ; 1c244 (7:4244)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, StartJump_FromInput
	bit B_BUTTON_F, a
	jp nz, SetState_Attacking
	update_anim_1

	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_Walking_ResetWalkVel
	jp SetState_Idling
; 0x1c270

StartJump_FromWaterSurface: ; 1c270 (7:4270)
	play_sfx SFX_SPLASH
	ld a, $01
	ld [wJumpVelIndex], a
	ld a, TRUE
	ld [wJumpingUpwards], a
	ld a, TRUE
	ld [wDoFullJump], a
	jr StartJump

StartJump_FromSand: ; 1c289 (7:4289)
	xor a
	ld [wJumpVelIndex], a
	ld a, TRUE
	ld [wJumpingUpwards], a
	ld a, TRUE
	ld [wDoFullJump], a

	ld a, [wPowerUpLevel]
	cp HIGH_JUMP_BOOTS
	ld a, JUMP_VEL_KNOCK_BACK
	jr c, .got_jump_vel_table
	ld hl, wJoypadDown
	bit D_UP_F, [hl]
	jr z, .got_jump_vel_table
	ld a, JUMP_VEL_NORMAL
.got_jump_vel_table
	ld [wJumpVelTable], a
	jr SetState_Airborne
; 0x1c2ae

StartFall:: ; 1c2ae (7:42ae)
	xor a ; FALSE
	ld [wJumpingUpwards], a
StartFall_SkipResetJumpUpwards: ; 1c2b2 (7:42b2)
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	jr StartJump
; 0x1c2b9

StartJump_FromInput: ; 1c2b9 (7:42b9)
	play_sfx SFX_JUMP
	xor a
	ld [wJumpVelIndex], a
	ld [wIsSmashAttacking], a
	ld a, TRUE
	ld [wJumpingUpwards], a
;	fallthrough

StartJump: ; 1c2cd (7:42cd)
	ld a, [wPowerUpLevel]
	cp HIGH_JUMP_BOOTS
	ld a, JUMP_VEL_NORMAL
	jr c, .got_jump_vel_table
	ld hl, wJoypadDown
	bit D_UP_F, [hl]
	jr z, .got_jump_vel_table
	ld a, JUMP_VEL_HIGH_JUMP
.got_jump_vel_table
	ld [wJumpVelTable], a
;	fallthrough

SetState_Airborne: ; 1c2e2 (7:42e2)
	xor a
	ld [wIsStandingOnSlope], a

	ld a, WST_AIRBORNE
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsCrouching], a
	ld [wAttackCounter], a

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	load_gfx WarioAirborneGfx
	call LoadWarioGfx
	load_oam OAM_15955
	ld a, [wDirection]
	and a
	jr nz, .asm_1c345
	load_frameset Frameset_15f94
	jr .asm_1c34f
.asm_1c345
	load_frameset Frameset_15f97
.asm_1c34f
	update_anim_1

	ld a, [wIsOnSteppableObject]
	and a
	ret z
	ld b, 2
	call SubYOffset
	ret
; 0x1c369

UpdateState_Airborne: ; 1c369 (7:4369)
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr c, .handle_input

; falling
	ld a, [wWaterInteraction]
	and a
	jp nz, DiveFromSurface
	ld a, [wIsInSand]
	and a
	jr z, .not_in_sand
	farcall SetState_SandFalling
	ret

.not_in_sand
	ld a, [wLadderInteraction]
	and a
	jr z, .no_ladder
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .no_ladder
	farcall SetState_LadderClimbing
	ret

.no_ladder
	ld a, [wWarioState]
	cp WST_AIRBORNE
	ret nz ; not airborne anymore

	farcall Func_19afb
	ld a, [wIsNearFence]
	and a
	jr z, .handle_input
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .handle_input
	farcall SetState_FenceMovingVertical
	ret

.handle_input
	ld a, [wWarioState]
	cp WST_AIRBORNE
	ret nz ; not airborne anymore
	call HandleInput_Airborne
	ld a, [wWarioState]
	cp WST_AIRBORNE
	ret nz ; not airborne anymore

	ld a, [wPowerUpLevel]
	cp LEAD_OVERALLS
	jr c, .continue
	ld a, [wIsSmashAttacking]
	and a
	jr nz, .check_still_smash_attacking
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr c, .continue

	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr z, .continue
	ld a, TRUE
	ld [wIsSmashAttacking], a
.set_smash_attack
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .smash_attack_right
	jr .smash_attack_left

.check_still_smash_attacking
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr nz, .continue
	xor a ; FALSE
	ld [wIsSmashAttacking], a
	jr .no_smash_attack
.continue
	ld a, [wIsTurning]
	and a
	jr z, .asm_1c4aa
	ld a, [wIsSmashAttacking]
	and a
	jr nz, .set_smash_attack

.no_smash_attack
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1c462
	load_frameset Frameset_15f94
	jr .asm_1c4aa
.asm_1c462
	load_frameset Frameset_15f97
	jr .asm_1c4aa

.smash_attack_left
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jr nc, .asm_1c481
	load_frameset Frameset_15f8e
	jr .asm_1c4aa
.asm_1c481
	load_frameset Frameset_1604e
	jr .asm_1c4aa
.smash_attack_right
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jr nc, .asm_1c4a0
	load_frameset Frameset_15f91
	jr .asm_1c4aa
.asm_1c4a0
	load_frameset Frameset_16055
.asm_1c4aa
	update_anim_1

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .falling
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp WST_AIRBORNE
	ret nz ; not airborne anymore
	ld a, [wced2]
	and a
	jp nz, StartFall_SkipResetJumpUpwards

	ld a, [wXPosLo]
	and $f0
	add $08
	ld [wXPosLo], a
	ret

.falling
	farcall CheckAirborneCollision
	ld a, [wWarioState]
	cp WST_AIRBORNE
	ret nz ; not airborne anymore
	ld a, b
	and a
	jr nz, .land
	jp TriggerDownwardsFloorTransition
.land
	update_pos_y
	get_pos
	ld b, PARTICLE_DUST
	farcall CreateParticle

	ld a, [wJumpVelIndex]
	cp MAX_JUMP_VEL_INDEX
	jr c, DoSoftLand
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jr z, DoHardLand
;	fallthrough

DoSoftLand: ; 1c541 (7:5541)
	call TriggerFloorTransition_SkipUpdateYPos

	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a

	ld a, [wIsSmashAttacking]
	and a
	jr z, .not_smash_attacking
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp c, DoGroundPound
	jp DoWarioGroundShake

.not_smash_attacking
	ld a, [wJoypadDown]
	and D_DOWN
	jp nz, CrouchOrSlideIfOnSlope
	ld a, -27
	ld [wCollisionBoxTop], a
	farcall CheckUpCollision
	ld a, b
	and a
	jr z, .no_collision_on_top
	jp CrouchOrSlideIfOnSlope
.no_collision_on_top
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_Walking
	jp SetState_Idling
; 0x1d58a

DoHardLand: ; 1d58a (7:558a)
	call TriggerFloorTransition_SkipUpdateYPos

	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWalkVelIndex], a

	ld a, [wIsSmashAttacking]
	and a
	jr z, .not_smash_attacking
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp c, DoGroundPound
	jr DoWarioGroundShake

.not_smash_attacking
	ld a, [wJoypadDown]
	and D_DOWN
	jp nz, CrouchOrSlideIfOnSlope

	play_sfx SFX_LAND
	ld a, WST_LANDING
	ld [wWarioState], a
	load_oam OAM_15955

	ld a, [wDirection]
	and a
	jr nz, .asm_1c5e3
	load_frameset Frameset_15f9a
	jr .asm_1c5ed
.asm_1c5e3
	load_frameset Frameset_15fa1
.asm_1c5ed
	update_anim_1
	ret
; 0x1c5fd

DoWarioGroundShake: ; 1c5fd (7:45fd)
	ld a, [wGroundShakeCounter]
	and a
	jr nz, .asm_1c60d
	ld a, 32
	ld [wGroundShakeCounter], a
	ld a, TRUE
	ld [wIsWarioGroundShaking], a
.asm_1c60d
	ld a, [wFloorTransitionDir]
	and a
	play_sfx z, SFX_GROUND_SHAKE

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_gfx WarioAirborneGfx
	call LoadWarioGfx
	ld a, HIGH(OAM_15955)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_15955)
	ld [wOAMPtr + 1], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1c650
	load_frameset Frameset_15fb8
	jr .asm_1c65a
.asm_1c650
	load_frameset Frameset_15fc5
.asm_1c65a
	update_anim_1
	jr SetState_SmashAttacking

DoGroundPound: ; 1c66b (7:466b)
	play_sfx SFX_GROUND_POUND
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_gfx WarioAirborneGfx
	call LoadWarioGfx
	ld a, HIGH(OAM_15955)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_15955)
	ld [wOAMPtr + 1], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1c6a8
	load_frameset Frameset_15ff2
	jr .asm_1c6b2
.asm_1c6a8
	load_frameset Frameset_16009
.asm_1c6b2
	update_anim_1
;	fallthrough

SetState_SmashAttacking: ; 1c6c1 (7:46c1)
	ld a, $81
	ld [wIsSmashAttacking], a
	ld a, WST_SMASH_ATTACKING
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ret
; 0x1c6ed

UpdateState_Landing: ; 1c6ed (7:46ed)
	ld a, [wJoypadPressed]
	and D_RIGHT | D_LEFT
	jr nz, .walk
	update_anim_1
	ld a, [wAnimationEnded]
	and a
	jr nz, .end_land
	ret
.walk
	jp SetState_Walking_ResetWalkVel

.end_land
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
	jp nz, CrouchOrSlideIfOnSlope
	jp SetState_Idling

.jump
	; do a high jump if have High Jump Boots
	call StartJump_FromInput
	ld a, [wPowerUpLevel]
	cp HIGH_JUMP_BOOTS
	ret c
	ld a, JUMP_VEL_HIGH_JUMP
	ld [wJumpVelTable], a
	ret
; 0x1c73b

SetState_CrouchSliding: ; 1c73b (7:473b)
	xor a
	ld [wSFXLoopCounter], a
	ld [wAttackCounter], a
	play_sfx SFX_SLIDE
	ld a, WST_CROUCH_SLIDING
	ld [wWarioState], a
	ld a, TRUE
	ld [wIsCrouching], a

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -15
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a

	load_gfx WarioWalkGfx
	call LoadWarioGfx
	load_oam OAM_1426c
	ld a, [wDirection]
	cp DIRECTION_RIGHT
	jr z, .dir_right
; dir left
	load_frameset Frameset_14a38
.asm_1c7a7
	update_anim_1
	ret
.dir_right
	load_frameset Frameset_14a3b
	jr .asm_1c7a7
; 0x1c7c3

UpdateState_CrouchSliding: ; 1c7c3 (7:47c3)
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWarioState]
	cp WST_CROUCH_SLIDING
	ret nz ; not crouch sliding anymore

	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, .try_jump

	farcall CheckCentreCollision
	ld a, [wWarioState]
	cp WST_CROUCH_SLIDING
	ret nz ; not crouch sliding anymore
	ld a, b
	and a
	jp z, StartCrouchFall
	ld a, [wIsStandingOnSlope]
	and a
	jr z, .no_slope
	update_pos_y
	jp SetState_Sliding

.no_slope
	farcall CheckFrontCollision
	ld a, [wWarioState]
	cp WST_CROUCH_SLIDING
	ret nz ; not crouch sliding anymore
	ld a, b
	and a
	jp nz, .end_slide

; if Wario has Garlic power-up, then slide further
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [wPowerUpLevel]
	cp GARLIC
	jr nc, .has_garlic
	ld a, [hl]
	cp $14
	jr c, .slide_fast
	cp $24
	jr c, .slide_slow
	cp $28
	jr c, .slide_slower
	jp z, .end_slide
	ret

.has_garlic
	ld a, [hl]
	cp $1e
	jr c, .slide_fast
	cp $36
	jr c, .slide_slow
	cp $3c
	jr c, .slide_slower
	jr z, .end_slide
	ret

.slide_fast
	ld b, 2
	ld a, [wDirection]
	and a
	jr nz, .add_x_offset
.sub_x_offset
	call SubXOffset
	ret
.add_x_offset
	call AddXOffset
	ret
.slide_slow
	ld b, 1
	ld a, [wDirection]
	and a
	jr nz, .add_x_offset
	jr .sub_x_offset
.slide_slower
	ld a, [wGlobalCounter]
	and %1
	ret z
	ld b, 1
	ld a, [wDirection]
	and a
	jr nz, .add_x_offset
	jr .sub_x_offset

.try_jump
	ld a, -27
	ld [wCollisionBoxTop], a
	farcall CheckUpCollision
	ld a, [wWarioState]
	cp WST_CROUCH_SLIDING
	ret nz ; not crouch sliding anymore
	ld a, b
	and a
	jr nz, .no_jump
	ld a, -15
	ld [wCollisionBoxTop], a
	jp StartCrouchJump
.no_jump
	ld a, -15
	ld [wCollisionBoxTop], a
	ret

.end_slide
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr nz, .crouching
	ld a, -27
	ld [wCollisionBoxTop], a
	farcall CheckUpCollision
	ld a, [wWarioState]
	cp WST_CROUCH_SLIDING
	ret nz ; not crouch sliding anymore
	ld a, b
	and a
	jp z, SetState_Idling
.crouching
	ld a, -15
	ld [wCollisionBoxTop], a
	jp CrouchOrSlideIfOnSlope
; 0x1c8df

UpdateState_Attacking: ; 1c8df (7:48df)
	ld a, [wPowerUpLevel]
	cp GARLIC
	jr nc, .powered_up
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_SFX_01
	ld a, 6
	ld [wSFXLoopCounter], a
	play_sfx SFX_ATTACK
.skip_SFX_01
	jr .skip_SFX_02

.powered_up
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_SFX_02
	ld a, 6
	ld [wSFXLoopCounter], a
	play_sfx SFX_ATTACK_POWERED_UP

.skip_SFX_02
	update_anim_1

	call HandleInput_Attacking
	ld a, [wWarioState]
	cp WST_ATTACKING
	ret nz ; not attacking anymore
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWarioState]
	cp WST_ATTACKING
	ret nz ; not attacking anymore

	farcall CheckFrontCollision
	ld a, [wWarioState]
	cp WST_ATTACKING
	ret nz ; not attacking anymore
	ld a, b
	and $0f
	jp nz, .bump

	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, StartFallingAirborneAttack

	ld a, [wWarioState]
	cp WST_ATTACKING
	ret nz ; not attacking anymore
	ld a, [wAttackCounter]
	cp CHARGE_ATTACK_COUNTER
	jr nc, .check_collision
	ld a, [wDirection]
	and a
	jr nz, .dir_right
; dir left
	call ApplyWalkVelocity_Left
	call SubXOffset
	ld a, [wWalkVelIndex]
	cp $14
	jr c, .asm_1c99e
	ld a, $10
	ld [wWalkVelIndex], a
.asm_1c99e
	jr .check_collision
.dir_right
	call ApplyWalkVelocity_Right
	call AddXOffset
	ld a, [wWalkVelIndex]
	cp $14
	jr c, .check_collision
	ld a, $10
	ld [wWalkVelIndex], a

.check_collision
	farcall CheckCentreCollision
	update_pos_y
	ld a, [wWarioState]
	cp WST_ATTACKING
	ret nz ; not attacking anymore
	ld hl, wAttackCounter
	dec [hl]
	ret nz
	call IsOnSlipperyGround
	jr z, .not_slippery
	farcall SetState_Slipping
	ret
.not_slippery
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_Walking_ResetWalkVel
	jp SetState_Idling

.bump
	jp DoBumpWithSmallBackOffset
; 0x1c9fa

DoBumpWithBigBackOffset: ; 1c9fa (7:49fa)
	ld a, [wDirection]
	and a
	jr nz, .dir_right
	ld b, 3
	call AddXOffset
	jr .done_x_offset
.dir_right
	ld b, 3
	call SubXOffset
.done_x_offset
	jr DoBumpOrJumpingBump
; 0x1ca0e

DoBumpWithSmallBackOffset: ; 1ca0e (7:4a0e)
	ld a, [wDirection]
	and a
	jr nz, .dir_right
	ld b, 2
	call AddXOffset
	jr DoBumpOrJumpingBump
.dir_right
	ld b, 2
	call SubXOffset
;	fallthrough

DoBumpOrJumpingBump: ; 1ca20 (7:4a20)
	play_sfx SFX_BUMP
	ld a, [wJumpVelTable]
	and a
	jr nz, .fall
	ld a, 10
	jr .got_jump_vel
.fall
	ld a, FALLING_JUMP_VEL_INDEX
.got_jump_vel
	ld [wJumpVelIndex], a
	jr SetState_Bumping
; 0x1ca39

DoJumpingBump: ; 1ca39 (7:4a39)
	play_sfx SFX_BUMP
;	fallthrough

DoJumpingBump_NoSFX: ; 1ca41 (7:4a41)
	ld a, 10
	ld [wJumpVelIndex], a
;	fallthrough

SetState_Bumping: ; 1ca46 (7:4a46)
	ld a, WST_BUMPING
	ld [wWarioState], a
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wAttackCounter], a
	ld a, [wIsRolling]
	and a
	jp nz, .asm_1cabf

	ld a, [wDirection]
	and a
	jr nz, .asm_1caa4
	load_frameset Frameset_15219
	update_anim_1
	jr .asm_1cabe
.asm_1caa4
	load_frameset Frameset_15216
	update_anim_1
.asm_1cabd
	ret
.asm_1cabe
	ret

.asm_1cabf
	xor a
	ld [wIsRolling], a
	load_gfx WarioAirborneGfx
	call LoadWarioGfx
	load_oam OAM_15955
	ld a, [wDirection]
	and a
	jr nz, .asm_1caf9
	call .asm_1cabe
	load_frameset Frameset_15f7f
	jr .asm_1cb06
.asm_1caf9
	call .asm_1cabd
	load_frameset Frameset_15f70
.asm_1cb06
	update_anim_1

	ld a, -27
	ld [wCollisionBoxTop], a
	farcall CheckUpCollision
	ld a, b
	and a
	jr z, .asm_1cb32
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
.asm_1cb32
	ret
; 0x1cb33

StartFallingAirborneAttack: ; 1cb33 (7:4b33)
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	jr SetState_AttackingAirborne

StartJumpingAirborneAttack: ; 1cb3a (7:4b3a)
	xor a
	ld [wJumpVelIndex], a
	ld a, TRUE
	ld [wJumpingUpwards], a
SetState_AttackingAirborne: ; 1cb43 (7:4b43)
	xor a
	ld [wIsStandingOnSlope], a
	ld a, WST_ATTACKING_AIRBORNE
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wPowerUpLevel]
	cp HIGH_JUMP_BOOTS
	ld a, JUMP_VEL_NORMAL
	jr c, .asm_1cb5d
	inc a ; JUMP_VEL_HIGH_JUMP
.asm_1cb5d
	ld [wJumpVelTable], a

	ld a, [wPowerUpLevel]
	cp GARLIC
	jr nc, .asm_1cb85
	ld a, [wDirection]
	and a
	jr nz, .asm_1cb79
	load_frameset Frameset_15216
	jr .asm_1cba1
.asm_1cb79
	load_frameset Frameset_15219
	jr .asm_1cba1
.asm_1cb85
	ld a, [wDirection]
	and a
	jr nz, .asm_1cb97
	load_frameset Frameset_1523e
	jr .asm_1cba1
.asm_1cb97
	load_frameset Frameset_15249
.asm_1cba1
	update_anim_1

	ld a, [wIsOnSteppableObject]
	and a
	ret z
	call UpdateState_AttackingAirborne ; can be fallthrough
	ret
; 0x1cbb9

UpdateState_AttackingAirborne: ; 1cbb9 (7:4bb9)
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, DiveFromSurface
	ld a, [wIsInSand]
	and a
	jr z, .no_sand
	farcall SetState_SandFalling
	ret

.no_sand
	ld a, [wWarioState]
	cp WST_ATTACKING_AIRBORNE
	ret nz ; not attacking airborne anymore
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 6
	ld [wSFXLoopCounter], a
	play_sfx SFX_ATTACK
.skip_sfx
	update_anim_1

	call HandleAttackingAirborneMovement
	ld a, [wWarioState]
	cp WST_ATTACKING_AIRBORNE
	ret nz ; not attacking airborne anymore

	farcall CheckFrontCollision
	ld a, [wWarioState]
	cp WST_ATTACKING_AIRBORNE
	ret nz ; not attacking airborne anymore
	ld a, b
	and $0f
	jr nz, .bump

	ld a, [wAttackCounter]
	dec a
	jr z, .asm_1cc44
	ld [wAttackCounter], a
.asm_1cc44
	ld a, [wDirection]
	and a
	jr nz, .asm_1cc58
	ld a, [wJoypadPressed]
	bit D_RIGHT_F, a
	jr z, .asm_1cc5f
.asm_1cc51
	xor a
	ld [wAttackCounter], a
	jp StartFall
.asm_1cc58
	ld a, [wJoypadPressed]
	bit D_LEFT_F, a
	jr nz, .asm_1cc51

.asm_1cc5f
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1cc8a
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp WST_ATTACKING_AIRBORNE
	ret nz ; not attacking airborne anymore

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	ret nc
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ret

.asm_1cc8a
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_1cca0
	jp TriggerDownwardsFloorTransition
.asm_1cca0
	call TriggerFloorTransition
	ld a, [wWarioState]
	cp WST_ATTACKING_AIRBORNE
	ret nz ; not attacking airborne anymore
	jp SetState_Idling

.bump
	jp DoBumpWithSmallBackOffset
; 0x1ccaf

UpdateState_Bumping: ; 1ccaf (7:4caf)
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, DiveFromSurface
	ld a, [wIsInSand]
	and a
	jr z, .no_sand
	farcall SetState_SandFalling
	ret

.no_sand
	ld a, [wWarioState]
	cp WST_BUMPING
	ret nz ; not bumping anymore
	call HandleBumpMovement
	ld a, [wWarioState]
	cp WST_BUMPING
	ret nz ; not bumping anymore

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .falling
	farcall CheckUpCollision
	ld a, [wWarioState]
	cp WST_BUMPING
	ret nz ; not bumping anymore

	ld a, b
	and a
	ret z
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ret

.falling
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .skip_floor_transition
	jp TriggerDownwardsFloorTransition
.skip_floor_transition
	update_pos_y
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	ld a, [wWarioState]
	cp WST_BUMPING
	ret nz ; not bumping anymore
	jp DoSoftLand
; 0x1cd48

DiveFromSurface: ; 1cd48 (7:4d48)
	xor a
	ld [wGrabState], a
	get_pos

	ldh a, [hYPosLo]
	and $f0
	ldh [hYPosLo], a

	ld b, PARTICLE_SPLASH
	farcall CreateParticle
	play_sfx SFX_SPLASH
;	fallthrough

DiveFromSurface_SkipSplash: ; 1cd7c (7:4d7c)
	ld a, -27
	ld [wCollisionBoxTop], a
	load_oam OAM_15254
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1cda9
	load_frameset Frameset_155a0
	jr .asm_1cdb3
.asm_1cda9
	load_frameset Frameset_155a3
.asm_1cdb3
	update_anim_1
	jr SetState_Diving
; 0x1cdc4

StartDive: ; 1cdc4 (7:4dc4)
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1cddd
	load_frameset Frameset_15569
	jr .asm_1cde7
.asm_1cddd
	load_frameset Frameset_15573
.asm_1cde7
	update_anim_1
;	fallthrough

SetState_Diving: ; 1cdf6 (7:4df6)
	ld a, WST_DIVING
	ld [wWarioState], a

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld [wAttackCounter], a
	ld [wIsRolling], a
	ld [wSwimVelIndex], a
	ld [wIsCrouching], a
	ld [wc0e0], a

	ld hl, Pals_c800
	call SetWarioPal
	load_gfx WarioSwimGfx
	call LoadWarioGfx
	ret
; 0x1ce42

UpdateState_Diving: ; 1ce42 (7:4e42)
	farcall CheckCentreCollision
	ld a, [wWarioState]
	cp WST_DIVING
	ret nz ; not diving anymore

	ld a, b
	and a
	jr nz, .submerge
	call HandleDivingHorizontalMovement
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp 10
	jr c, .fast
	cp 14
	jr c, .slow
	jr SetState_Submerged
.fast
	ld b, 2
	jr .descend
.slow
	ld b, 1
.descend
	call AddYOffset

	farcall CheckCentreCollision
	ld a, b
	and a
	jr nz, .submerge
	ret

.submerge
	update_pos_y
;	fallthrough

SetState_Submerged: ; 1ce95 (7:4e95)
	ld a, WST_SUBMERGED
	ld [wWarioState], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wSwimVelIndex], a
	ld [wc0e0], a
	ld [wSwimmingDirectionInput], a

	load_gfx WarioSwimGfx
	call LoadWarioGfx
	load_oam OAM_15254

	ld a, [wPowerUpLevel]
	cp SWIMMING_FLIPPERS
	jr c, .cannot_swim_underwater
	ld a, [wWaterInteraction]
	cp $02
	jr z, .cannot_swim_underwater

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -15
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1cf06
	load_frameset Frameset_15576
	jr .asm_1cf10
.asm_1cf06
	load_frameset Frameset_1558b
.asm_1cf10
	update_anim_1
	ret

.cannot_swim_underwater
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1cf39
	load_frameset Frameset_155a0
	jr .asm_1cf43
.asm_1cf39
	load_frameset Frameset_155a3
.asm_1cf43
	update_anim_1
	ret
; 0x1cf53

UpdateState_Submerged: ; 1cf53 (7:4f53)
	xor a
	ld [wc0e1], a
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWarioState]
	cp WST_SUBMERGED
	ret nz
	call ApplyWaterCurrentMovement
	call Func_1f1a9
	ret
; 0x1cf7a

SurfaceFromUnderwater: ; 1cf7a (7:4f7a)
	xor a
	ld [wSFXLoopCounter], a
	ld [wWaterSurfaceFloatingCounter], a
	load_gfx WarioSwimGfx
	call LoadWarioGfx
	load_oam OAM_15254
;	fallthrough

SetState_WaterSurfaceIdling: ; 1cfa2 (7:4fa2)
	ld a, WST_WATER_SURFACE_IDLING
	ld [wWarioState], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wSwimVelIndex], a
	ld [wc0e0], a
	ld [wSwimmingDirectionInput], a
	ld a, [wWaterInteraction]
	and a
	jr nz, .asm_1cfdc
	ld a, $01
	ld [wWaterInteraction], a

.asm_1cfdc
	ld a, [wDirection]
	and a
	jr nz, .asm_1cfee
	load_frameset Frameset_15554
	jr .asm_1cff8
.asm_1cfee
	load_frameset Frameset_1555b
.asm_1cff8
	update_anim_1
	ret
; 0x1d008

UpdateState_WaterSurfaceIdling: ; 1d008 (7:5008)
	xor a
	ld [wc0e1], a
	farcall Func_19b25
	ld a, [wWarioState]
	cp WST_WATER_SURFACE_IDLING
	ret nz ; not water idling anymore

	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 28
	ld [wSFXLoopCounter], a
	play_sfx SFX_WATER_SURFACE
.skip_sfx
	update_anim_1

	call HandleWaterSurfaceFloatingMovement
	call HandleWaterSurfaceInput
	ld a, [wWarioState]
	cp WST_WATER_SURFACE_IDLING
	ret nz ; not water idling anymore

	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jr nz, SetState_WaterSurfaceMoving
	call ApplyWaterCurrentMovement
	ret
; 0x1d065

SetState_WaterSurfaceMoving: ; 1d065 (7:5065)
	ld a, WST_WATER_SURFACE_MOVING
	ld [wWarioState], a

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wSwimVelIndex], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1d0a0
	load_frameset Frameset_15554
	jr .asm_1d0aa
.asm_1d0a0
	load_frameset Frameset_1555b
.asm_1d0aa
	update_anim_1
	ret
; 0x1d0ba

UpdateState_WaterSurfaceMoving: ; 1d0ba (7:50ba)
	xor a
	ld [wc0e1], a
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 28
	ld [wSFXLoopCounter], a
	play_sfx SFX_WATER_SURFACE
.skip_sfx
	update_anim_1

	call HandleWaterSurfaceFloatingMovement
	call ApplyWaterCurrentMovement
	call .HandleDirectionalInput
	call HandleWaterSurfaceInput
	ret

.HandleDirectionalInput:
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	jp SetState_WaterSurfaceIdling

.d_right
	ld a, [wDirection]
	and a
	jr nz, .facing_right
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_1555b
	update_anim_1
	ret
.facing_right
	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	; current overrides player input
	ld hl, wCurWaterCurrent
	ld a, [hld]
	or [hl] ; wLastWaterCurrent
	and CURRENT_RIGHT | CURRENT_LEFT
	ret nz
	; no left/right current
	call ApplyWalkVelocity_Right
	call AddXOffset

.done_moving
	ld a, [wWalkVelIndex]
	cp $04
	jr c, .asm_1d16d
	ld a, $00
	ld [wWalkVelIndex], a
.asm_1d16d
	ret

.d_left
	ld a, [wDirection]
	and a
	jr z, .facing_left
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_15554
	update_anim_1
	ret
.facing_left
	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	; current overrides player input
	ld hl, wCurWaterCurrent
	ld a, [hld]
	or [hl] ; wLastWaterCurrent
	and CURRENT_RIGHT | CURRENT_LEFT
	ret nz
	; no left/right current
	call ApplyWalkVelocity_Left
	call SubXOffset
	jr .done_moving
; 0x1d1bc

HandleWaterSurfaceFloatingMovement: ; 1d1bc (7:51bc)
	ld a, [wGlobalCounter]
	and %11
	ret nz
	ld hl, wWaterSurfaceFloatingCounter
	inc [hl]
	ld a, [hl]
	cp 7
	jr nc, .go_up
; go down
	ld b, 1
	call AddYOffset_Sprite
	ret
.go_up
	cp 12
	jr c, .sub_y_offset
	xor a
	ld [hl], a
.sub_y_offset
	ld b, 1
	call SubYOffset_Sprite
	ret
; 0x1d1dd

StartUpwardsUnderwaterThrusting: ; 1d1dd (7:51dd)
	ld a, D_UP
	ld [wSwimmingDirectionInput], a
	jr SetState_UnderwaterThrusting

StartUnderwaterThrusting: ; 1d1e4 (7:51e4)
	ld a, [wJoypadDown]
	and D_PAD
	ld [wSwimmingDirectionInput], a
;	fallthrough

SetState_UnderwaterThrusting: ; 1d1ec (7:51ec)
	ld a, WST_UNDERWATER_THRUSTING
	ld [wWarioState], a

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -15
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wSwimVelIndex], a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wSwimmingDirectionInput]
	and a
	jr z, .no_input
	ld a, [wSwimmingDirectionInput] ; unnecessary
	bit D_LEFT_F, a
	jr nz, .thrust_left
	bit D_RIGHT_F, a
	jr nz, .thrust_right
	ld a, [wDirection]
	and a
	jr nz, .thrust_right
.thrust_left
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	ld a, [wPowerUpLevel]
	cp PRINCE_FROGS_GLOVES
	jr c, .asm_1d244
	load_frameset Frameset_15562
	jr .asm_1d272
.asm_1d244
	load_frameset Frameset_155be
	jr .asm_1d272
.thrust_right
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	ld a, [wPowerUpLevel]
	cp PRINCE_FROGS_GLOVES
	jr c, .asm_1d268
	load_frameset Frameset_1556c
	jr .asm_1d272
.asm_1d268
	load_frameset Frameset_155c5
.asm_1d272
	update_anim_1
	ret

.no_input
	ld a, [wDirection]
	cp DIRECTION_RIGHT
	jr z, .facing_right
	ld a, D_LEFT
	ld [wSwimmingDirectionInput], a
	jr .thrust_left
.facing_right
	ld a, D_RIGHT
	ld [wSwimmingDirectionInput], a
	jr .thrust_right
; 0x1d297

UpdateState_UnderwaterThrusting: ; 1d297 (7:5297)
	xor a
	ld [wc0e1], a
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWarioState]
	cp WST_UNDERWATER_THRUSTING
	ret nz ; not underwater thrusting anymore

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 15
	ld [wSFXLoopCounter], a
	play_sfx SFX_00F
.skip_sfx
	update_anim_1

	call HandleUnderwaterThrustingInput
	ld a, [wWarioState]
	cp WST_UNDERWATER_THRUSTING
	ret nz ; not underwater thrusting anymore

	call ApplyWaterCurrentMovement
	ret
; 0x1d2ea

SetState_SwimKnockBack_SwitchDirection: ; 1d2ea (7:52ea)
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
;	fallthrough

SetState_SwimKnockBack: ; 1d2f2 (7:52f2)
	play_sfx SFX_BUMP
	ld a, WST_SWIM_KNOCK_BACK
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wSwimVelIndex], a
	ld [wSwimmingDirectionInput], a
	ld [wc0e0], a
	load_gfx WarioSwimGfx
	call LoadWarioGfx
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1d33a
	load_frameset Frameset_15573
	jr .asm_1d344
.asm_1d33a
	load_frameset Frameset_15569
.asm_1d344
	update_anim_1
	ret
; 0x1d354

UpdateState_SwimKnockBack: ; 1d354 (7:5354)
	farcall CheckFrontCollision
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
	call SubXOffset
	ret
.asm_1d386
	call AddXOffset
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
	farcall CheckUpCollision
	ld a, b
	and a
	jr nz, .asm_1d3ed
	farcall Func_19acd
	ld a, [wWaterInteraction]
	and a
	jr z, .asm_1d404
	ld a, [wWarioStateCounter]
	cp $78
	jr nc, .asm_1d3f8
	ld a, [wGlobalCounter]
	and %1
	ret nz
	ld b, $01
	call SubYOffset
	ld a, [wWaterCurrent]
	and a
	ret z
	xor a
	ld [wWaterCurrent], a
	jr .asm_1d3f8

.asm_1d3ed
	ld a, [wWarioStateCounter]
	cp $78
	ret c
	ld a, D_UP
	ld [wc0e1], a
.asm_1d3f8
	xor a
	ld [wIsIntangible], a
	ld a, $10
	ld [wInvincibleCounter], a
	jp SetState_Submerged

.asm_1d404
	ld a, [wWarioStateCounter]
	cp $78
	ret c
	xor a
	ld [wIsIntangible], a
	ld a, $10
	ld [wInvincibleCounter], a
	jp SurfaceFromUnderwater
; 0x1d416

SetState_TryingSubmerge: ; 1d416 (7:5416)
	ld a, WST_TRYING_SUBMERGE
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1d43b
	load_frameset Frameset_155b0
	jr .asm_1d445
.asm_1d43b
	load_frameset Frameset_155b7
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
	cp WST_CROUCHING
	ret nz ; not crouching anymore

	ld a, [wWaterInteraction]
	and a
	jp nz, DiveFromSurface
	call Func_1eb46
	ld a, [wWarioState]
	cp WST_CROUCHING
	ret nz ; not crouching anymore

	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, StartCrouchFall
	ret
; 0x1d4a7

UpdateState_CrouchWalking: ; 1d4a7 (7:54a7)
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 21
	ld [wSFXLoopCounter], a
	play_sfx SFX_CROUCH_WALK
.skip_sfx
	update_anim_1

	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWarioState]
	cp WST_CROUCH_WALKING
	ret nz ; not crouch walking anymore

	ld a, [wWaterInteraction]
	and a
	jp nz, DiveFromSurface
	call Func_1ec6c
	ld a, [wWarioState]
	cp WST_CROUCH_WALKING
	ret nz ; not crouch walking anymore

	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, StartCrouchFall
	update_pos_y
	ld a, [wIsStandingOnSlope]
	and a
	jr nz, .asm_1d51f
	ret
.asm_1d51f
	jp SetState_Sliding
; 0x1d522

UpdateState_CrouchAirborne: ; 1d522 (7:5522)
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, DiveFromSurface
	ld a, [wIsInSand]
	and a
	jr z, .asm_1d555
	farcall SetState_SandFalling
	ret
.asm_1d555
	ld a, [wWarioState]
	cp WST_CROUCH_AIRBORNE
	ret nz ; not crouch jumping anymore

	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr nz, .asm_1d583
	ld a, -27
	ld [wCollisionBoxTop], a
	farcall CheckUpCollision
	ld a, [wWarioState]
	cp WST_CROUCH_AIRBORNE
	ret nz ; not crouch jumping anymore

	ld a, b
	and a
	jr nz, .asm_1d583
	jp StartJump
.asm_1d583
	ld a, -15
	ld [wCollisionBoxTop], a
	call HandleInput_Airborne
	ld a, [wWarioState]
	cp WST_CROUCH_AIRBORNE
	ret nz ; not crouch jumping anymore

	ld a, [wIsTurning]
	and a
	jr z, .asm_1d5c9
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1d5b0
	load_frameset Frameset_14a38
	jr .asm_1d5ba
.asm_1d5b0
	load_frameset Frameset_14a3b
.asm_1d5ba
	update_anim_1
.asm_1d5c9
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .falling

; rising
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp WST_CROUCH_AIRBORNE
	ret nz ; not crouch jumping anymore

	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ret

.falling
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_1d60a
	ld a, [wWarioState]
	cp WST_CROUCH_AIRBORNE
	ret nz ; not crouch jumping anymore
	jp TriggerDownwardsFloorTransition

.asm_1d60a
	update_pos_y
	ld a, [wWarioState]
	cp WST_CROUCH_AIRBORNE
	ret nz ; not crouch jumping anymore

	call DoSoftLand
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	ret z
	jp CrouchOrSlideIfOnSlope
; 0x1d627

UpdateState_Stung: ; 1d627 (7:5627)
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, DiveFromSurface
	ld a, [wIsInSand]
	and a
	jr z, .asm_1d65a
	farcall SetState_SandFalling
	ret

.asm_1d65a
	call Func_1f6c2
	update_anim_1
	farcall CheckFrontCollision
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
	call SubXOffset
	jr .asm_1d6b5
.asm_1d694
	ld b, $01
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1d69e
	inc b
.asm_1d69e
	call AddXOffset
	jr .asm_1d6b5
.asm_1d6a3
	ld a, [wDirection]
	and a
	jr nz, .asm_1d6b0
	ld b, $01
	call AddXOffset
	jr .asm_1d6b5

.asm_1d6b0
	ld b, $01
	call SubXOffset
.asm_1d6b5
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_1d6e3
	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp MAX_JUMP_VEL_INDEX
	jp nc, .asm_1d759
	farcall CheckCentreCollision
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

; rising
	ld a, [hl]
	cpl
	inc a
	ld b, a
	call SubYOffset
	ld hl, wJumpVelIndex
	inc [hl]
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	jr .asm_1d6e3

.falling
	ld b, [hl]
	call AddYOffset
	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp MAX_JUMP_VEL_INDEX
	jr c, .asm_1d724
	ld [hl], MAX_JUMP_VEL_INDEX
.asm_1d724
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_1d73a
	jp TriggerDownwardsFloorTransition

.asm_1d73a
	call TriggerFloorTransition
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
	ld a, WST_STUNG_RECOVERY
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
	ld [wInvincibleCounter], a
	ld hl, Pals_c800
	call SetWarioPal
	ld a, -27
	ld [wCollisionBoxTop], a
	farcall CheckUpCollision
	ld a, [wWarioState]
	cp WST_STUNG_RECOVERY
	ret nz ; not stung recovering anymore

	ld a, b
	and a
	jr nz, .asm_1d7b9
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jp z, SetState_Idling
.asm_1d7b9
	ld a, -15
	ld [wCollisionBoxTop], a
	jp CrouchOrSlideIfOnSlope
; 0x1d7c1

UpdateState_PipeGoingDown: ; 1d7c1 (7:57c1)
	ld a, TRUE
	ld [wIsIntangible], a
	update_anim_1
	ld b, $01
	call AddYOffset

	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $20
	jr z, .asm_1d7f9
	cp $21
	jr z, .asm_1d804
	cp $40
	ret c
	ld a, [wXPosLo]
	sub $08
	ld [wXPosLo], a
	xor a
	ld [wIsIntangible], a
	jp SetState_Idling

.asm_1d7f9
	call ClearTransformationValues
	ld hl, wRoomTransitionParam
	res ROOMTRANSITIONFLAG_3_F, [hl]
	jp TriggerRoomTransition
.asm_1d804
	play_sfx SFX_0E1
	ret
; 0x1d80d

UpdateState_PipeGoingUp: ; 1d80d (7:580d)
	ld a, TRUE
	ld [wIsIntangible], a
	update_anim_1
	ld b, $01
	call SubYOffset

	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $20
	jr z, .asm_1d848
	cp $21
	jr z, .asm_1d853
	cp $40
	ret c
	ld a, [wXPosLo]
	sub $08
	ld [wXPosLo], a
	xor a
	ld [wIsIntangible], a
	call Func_1146
	jp SetState_Idling

.asm_1d848
	call ClearTransformationValues
	ld hl, wRoomTransitionParam
	res ROOMTRANSITIONFLAG_3_F, [hl]
	jp TriggerRoomTransition
.asm_1d853
	play_sfx SFX_0E1
	ret
; 0x1d85c

UpdateState_EnemyBumping: ; 1d85c (7:585c)
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, DiveFromSurface
	ld a, [wIsInSand]
	and a
	jr z, .asm_1d88f
	farcall SetState_SandFalling
	ret

.asm_1d88f
	ld a, [wWarioState]
	cp WST_ENEMY_BUMPING
	ret nz
	update_anim_1
	call HandleBumpMovement
	ld a, [wWarioState]
	cp WST_ENEMY_BUMPING
	ret nz
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1d8cc
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ret

.asm_1d8cc
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_1d8e2
	jp TriggerDownwardsFloorTransition

.asm_1d8e2
	ld a, [wDirection]
	xor $1
	ld [wDirection], a
	ld hl, hYPosHi
	ld de, wPos
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	jp DoSoftLand
; 0x1d8f8

UpdateState_SmashAttacking: ; 1d8f8 (7:58f8)
	update_anim_1
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $1b
	ret c
	xor a ; FALSE
	ld [wIsSmashAttacking], a
	jp SetState_Idling
; 0x1d916

UpdateState_PickingUp: ; 1d916 (7:5916)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, Func_1dd78
	ld a, [wGrabState]
	and a
	jp z, SetState_Idling
	and $0f
	cp $02
	jp z, SetState_GrabIdling
	update_anim_1
	ld a, [wAnimationEnded]
	and a
	ret z
	jp SetState_GrabIdling
; 0x1d943

UpdateState_GrabIdling: ; 1d943 (7:5943)
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWarioState]
	cp WST_GRAB_IDLING
	ret nz ; done not grab idling anymore

	ld a, [wGrabState]
	and a
	jp z, SetState_Idling
	call Func_1ee88
	ld a, [wWarioState]
	cp WST_GRAB_IDLING
	ret nz ; done not grab idling anymore

	farcall CheckCentreCollision
	ld a, [wWarioState]
	cp WST_GRAB_IDLING
	ret nz ; done not grab idling anymore

	ld a, b
	and a
	jp z, Func_1edd3
	update_pos_y
	ret
; 0x1d995

UpdateState_GrabWalking: ; 1d995 (7:5995)
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWarioState]
	cp WST_GRAB_WALKING
	ret nz ; not grab walking anymore

	ld a, [wGrabState]
	and a
	jp z, SetState_Walking_ResetWalkVel
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .asm_1d9cf
	ld a, 36
	ld [wSFXLoopCounter], a
	play_sfx SFX_WALK
.asm_1d9cf
	update_anim_1

	call Func_1eefc
	ld a, [wWarioState]
	cp WST_GRAB_WALKING
	ret nz ; not grab walking anymore

	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, Func_1edd3
	update_pos_y
	ret
; 0x1da07

SetState_ThrowingAirborne: ; 1da07 (7:5a07)
	ld a, WST_THROWING_AIRBORNE
	ld [wWarioState], a
	ld a, [wGrabState]
	and GRAB_FLAGS_MASK
	or GRAB_THROW
	ld [wGrabState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1da43
	load_frameset Frameset_15fae
.asm_1da33
	update_anim_1
	ret
.asm_1da43
	load_frameset Frameset_15fb3
	jr .asm_1da33
; 0x1da4f

UpdateState_GrabAirborne: ; 1da4f (7:5a4f)
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWarioState]
	cp WST_GRAB_AIRBORNE
	ret nz ; not grabbing airborne anymore

	ld a, [wWaterInteraction]
	and a
	jp nz, DiveFromSurface
	ld a, [wGrabState]
	and a
	jp z, StartFall
	ld a, [wIsInSand]
	and a
	jr z, .asm_1da8f
	farcall SetState_SandFalling
	ret

.asm_1da8f
	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, SetState_ThrowingAirborne
	call HandleInput_Airborne
	ld a, [wWarioState]
	cp WST_GRAB_AIRBORNE
	ret nz ; not grabbing airborne anymore

	ld a, [wPowerUpLevel]
	cp LEAD_OVERALLS
	jr c, .asm_1dadc
	ld a, [wIsSmashAttacking]
	and a
	jr nz, .asm_1dacf
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr c, .asm_1dadc
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr z, .asm_1dadc
	ld a, TRUE
	ld [wIsSmashAttacking], a

.asm_1dac0
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1db2c
	jr .asm_1db0d

.asm_1dacf
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr nz, .asm_1dadc
	xor a ; FALSE
	ld [wIsSmashAttacking], a
	jr .asm_1dae8
.asm_1dadc
	ld a, [wIsTurning]
	and a
	jr z, .asm_1db49
	ld a, [wIsSmashAttacking]
	and a
	jr nz, .asm_1dac0
.asm_1dae8
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1db01
	load_frameset Frameset_15fa8
	jr .asm_1db49
.asm_1db01
	load_frameset Frameset_15fab
	jr .asm_1db49

.asm_1db0d
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jr nc, .asm_1db20
	load_frameset Frameset_15fec
	jr .asm_1db49
.asm_1db20
	load_frameset Frameset_1605c
	jr .asm_1db49
.asm_1db2c
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jr nc, .asm_1db3f
	load_frameset Frameset_15fef
	jr .asm_1db49
.asm_1db3f
	load_frameset Frameset_16063
.asm_1db49
	update_anim_1

	ld a, [wGrabState]
	bit GRAB_HEAVY_F, a
	jr z, .asm_1db6b
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_1db6b
	ld a, $04
	ld [wWalkVelIndex], a
.asm_1db6b
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1db8a
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ret

.asm_1db8a
	farcall CheckAirborneCollision
	ld a, [wWarioState]
	cp WST_GRAB_AIRBORNE
	ret nz ; not grabbing airborne anymore

	ld a, b
	and a
	jr nz, .asm_1dba6
	jp TriggerDownwardsFloorTransition
.asm_1dba6
	call TriggerFloorTransition
	ld a, [wFloorTransitionDir]
	and a
	play_sfx z, SFX_LAND
	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wWalkVelIndex], a
	ld a, [wIsSmashAttacking]
	and a
	jr z, .asm_1dbd0
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jr c, .asm_1dc25
	jr .continue
.asm_1dbd0
	jp SetState_GrabIdling

.continue
	ld a, [wGroundShakeCounter]
	and a
	jr nz, .asm_1dbe3
	ld a, $20
	ld [wGroundShakeCounter], a
	ld a, TRUE
	ld [wIsWarioGroundShaking], a
.asm_1dbe3
	ld a, [wFloorTransitionDir]
	and a
	play_sfx z, SFX_GROUND_SHAKE

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1dc0a
	load_frameset Frameset_15fd2
	jr .asm_1dc14
.asm_1dc0a
	load_frameset Frameset_15fdf
.asm_1dc14
	update_anim_1
	jr .asm_1dc5f

.asm_1dc25
	play_sfx SFX_GROUND_POUND
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1dc46
	load_frameset Frameset_16020
	jr .asm_1dc50
.asm_1dc46
	load_frameset Frameset_16037
.asm_1dc50
	update_anim_1

.asm_1dc5f
	ld a, $81
	ld [wIsSmashAttacking], a
	ld a, WST_GRAB_SMASH_ATTACKING
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ret
; 0x1dc8b

SetState_ThrowCharging: ; 1dc8b (7:5c8b)
	play_sfx SFX_02C
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, WST_THROW_CHARGING
	ld [wWarioState], a
	ld a, [wGrabState]
	and GRAB_FLAGS_MASK
	add GRAB_CHARGE_THROW
	ld [wGrabState], a
	load_gfx WarioThrowGfx
	call LoadWarioGfx
	load_oam OAM_1606a

	ld a, [wDirection]
	and a
	jr nz, .asm_1dce2
	load_frameset Frameset_1642c
	jr .asm_1dcec
.asm_1dce2
	load_frameset Frameset_1642f
.asm_1dcec
	update_anim_1
	ret
; 0x1dcfc

UpdateState_ThrowCharging: ; 1dcfc (7:5cfc)
	ld a, [wGrabState]
	and a
	jp z, SetState_Idling
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jp z, Func_1de3f
	bit A_BUTTON_F, a
	jp nz, Func_1dd78
	bit D_DOWN_F, a
	jp nz, CrouchOrSlideIfOnSlope

	ld a, [wGrabState]
	bit GRAB_HEAVY_F, a
	jr nz, .asm_1dd20
	ld b, THROW_CHARGE_FRAMES_LIGHT
	jr .asm_1dd22
.asm_1dd20
	ld b, THROW_CHARGE_FRAMES_HEAVY
.asm_1dd22
	ld a, [wWarioStateCounter]
	inc a
	ld [wWarioStateCounter], a
	cp b
	jr nc, .asm_1dd2d
	ret

.asm_1dd2d
	xor a
	ld [wSFXLoopCounter], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a

	ld a, WST_THROW_FULLY_CHARGED
	ld [wWarioState], a
	ld a, [wGrabState]
	and GRAB_FLAGS_MASK
	add GRAB_THROW_FULLY_CHARGED
	ld [wGrabState], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1dd5e
	load_frameset Frameset_16432
	jr .asm_1dd68
.asm_1dd5e
	load_frameset Frameset_16435
.asm_1dd68
	update_anim_1
	ret
; 0x1dd78

Func_1dd78: ; 1dd78 (7:5d78)
	xor a
	ld [wGrabState], a
	jp StartJump_FromInput
; 0x1dd7f

UpdateState_ThrowFullyCharged: ; 1dd7f (7:5d7f)
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 30
	ld [wSFXLoopCounter], a
	play_sfx SFX_FULLY_CHARGED_THROW
.skip_sfx

	ld a, [wGrabState]
	and a
	jp z, SetState_Idling
	and GRAB_STATE_MASK
	cp GRAB_HOLD_FULL_CHARGE
	jr z, .asm_1dde0
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_1dde0
	ld a, [wAnimationEnded]
	and a
	jr z, .asm_1dde0
	ld a, [wGrabState]
	and GRAB_FLAGS_MASK
	add GRAB_HOLD_FULL_CHARGE
	ld [wGrabState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	inc a
	ld [wWarioStateCounter], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1ddd6
	load_frameset Frameset_16438
	jr .asm_1dde0
.asm_1ddd6
	load_frameset Frameset_16441
.asm_1dde0
	update_anim_1

	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jr z, .asm_1de01
	bit A_BUTTON_F, a
	jp nz, Func_1dd78
	bit D_DOWN_F, a
	jp nz, CrouchOrSlideIfOnSlope
	ret

.asm_1de01
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1de1a
	load_frameset Frameset_16403
	jr .asm_1de24
.asm_1de1a
	load_frameset Frameset_16423
.asm_1de24
	update_anim_1

	ld a, [wGrabState]
	and GRAB_FLAGS_MASK
	add GRAB_THROW | (1 << GRAB_FULL_CHARGE_F)
	ld [wGrabState], a
	jr SetState_Throwing

Func_1de3f: ; 1de3f (7:5e3f)
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1de58
	load_frameset Frameset_163fe
	jr .asm_1de62
.asm_1de58
	load_frameset Frameset_1641e
.asm_1de62
	update_anim_1

	ld a, [wGrabState]
	and GRAB_FLAGS_MASK
	add GRAB_THROW
	ld [wGrabState], a
;	fallthrough

SetState_Throwing: ; 1de7b (7:5e7b)
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, WST_THROWING
	ld [wWarioState], a
	ret
; 0x1de88

UpdateState_Throwing: ; 1de88 (7:5e88)
	ld a, [wGrabState]
	and a
	jp z, SetState_Idling
	update_anim_1
	ld a, [wAnimationEnded]
	and a
	ret z
	xor a
	ld [wGrabState], a
	jp SetState_Idling
; 0x1deaa

UpdateState_ThrowingAirborne: ; 1deaa (7:5eaa)
	ld a, [wGrabState]
	and a
	jp z, StartFall
	update_anim_1
	ld a, [wAnimationEnded]
	and a
	ret z
	xor a
	ld [wGrabState], a
	jp StartFall
; 0x1decc

UpdateState_GrabSmashAttacking: ; 1decc (7:5ecc)
	ld a, [wGrabState]
	and a
	jp z, SetState_Idling
	update_anim_1
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $1b
	ret c
	xor a ; FALSE
	ld [wIsSmashAttacking], a
	jp SetState_GrabIdling
; 0x1def1

SetState_Sliding: ; 1def1 (7:5ef1)
	ld a, WST_SLIDING
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wIsCrouching], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wWalkVelIndex], a
	ld [wGrabState], a

	ld a, TRUE
	ld [wIsRolling], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	load_gfx WarioSlideGfx
	call LoadWarioGfx
	load_oam OAM_1644a
	ld a, [wIsStandingOnSlope]
	bit 1, a
	jr nz, .asm_1df8b
	ld hl, wXPosLo
	ld de, hXPosLo
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

	ld b, PARTICLE_SLIDE_DUST_LEFT
	farcall CreateParticle
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	load_frameset Frameset_16708
	jr .asm_1dfc4

.asm_1df8b
	ld hl, wXPosLo
	ld de, hXPosLo
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

	ld b, PARTICLE_SLIDE_DUST_RIGHT
	farcall CreateParticle
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	load_frameset Frameset_1671d
.asm_1dfc4
	update_anim_1
	ret
; 0x1dfd4

UpdateState_Sliding: ; 1dfd4 (7:5fd4)
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 12
	ld [wSFXLoopCounter], a
	play_sfx SFX_ZIP_LINE_SLIDE
.skip_sfx
	update_anim_1

	call Func_1f825
	ld a, [wWarioState]
	cp WST_SLIDING
	ret nz ; not sliding anymore

	farcall Func_198c7
	ld a, b
	and a
	jp z, Func_1e174

	update_pos
	farcall CheckFrontCollision
	ld a, b
	and $0f
	jp nz, DoBumpWithSmallBackOffset
	ld a, [wAnimationEnded]
	and a
	ret z
;	fallthrough

SetState_Rolling: ; 1e042 (7:6042)
	xor a
	ld [wSFXLoopCounter], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a

	ld a, WST_ROLLING
	ld [wWarioState], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -14
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ld a, $02
	ld [wIsRolling], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1e083
	load_frameset Frameset_166e6
	jr .asm_1e08d
.asm_1e083
	load_frameset Frameset_166f7
.asm_1e08d
	update_anim_1
	ret
; 0x1e09d

UpdateState_Rolling: ; 1e09d (7:609d)
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 12
	ld [wSFXLoopCounter], a
	play_sfx SFX_ROLL
.skip_sfx
	update_anim_1

	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .asm_1e145
	ld a, [wDirection]
	and a
	jr nz, .asm_1e0ee
	call ApplyWalkVelocity_Left
	call SubXOffset
	jr .asm_1e0f4
.asm_1e0ee
	call ApplyWalkVelocity_Right
	call AddXOffset

.asm_1e0f4
	ld a, [wWalkVelIndex]
	cp $18
	jr c, .asm_1e100
	ld a, $14
	ld [wWalkVelIndex], a
.asm_1e100
	farcall CheckFrontCollision
	ld a, b
	and $0f
	jp nz, DoBumpWithBigBackOffset
	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, Func_1e174

	update_pos_y

	ld a, [wIsStandingOnSlope]
	and a
	ret z
	and $0f
	dec a
	ld b, a
	ld a, [wDirection]
	xor b
	jp nz, DoBumpWithSmallBackOffset
	ret

.asm_1e145
	farcall CheckCentreCollision
	update_pos_y
	ld a, [wIsStandingOnSlope]
	and a
	jp z, Func_1e1e3
	and $0f
	dec a
	ld b, a
	ld a, [wDirection]
	xor b
	jp nz, DoBumpWithSmallBackOffset
	jp Func_1e1e3
; 0x1e174

Func_1e174: ; 1e174 (7:6174)
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
;	fallthrough

SetState_RollingAirborne: ; 1e179 (7:6179)
	xor a
	ld [wIsStandingOnSlope], a
	ld [wGrabState], a
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a
	ld a, WST_ROLLING_AIRBORNE
	ld [wWarioState], a
	ld a, $02
	ld [wIsRolling], a
	load_gfx WarioSlideGfx
	call LoadWarioGfx
	load_oam OAM_1644a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1e1c9
	load_frameset Frameset_166e6
	jr .asm_1e1d3
.asm_1e1c9
	load_frameset Frameset_166f7
.asm_1e1d3
	update_anim_1
	ret
; 0x1e1e3

Func_1e1e3: ; 1e1e3 (7:61e3)
	xor a
	ld [wJumpVelIndex], a
	jr SetState_RollingAirborne
; 0x1e1e9

UpdateState_RollingAirborne: ; 1e1e9 (7:61e9)
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, DiveFromSurface
	ld a, [wIsInSand]
	and a
	jr z, .asm_1e21c
	farcall SetState_SandFalling
	ret

.asm_1e21c
	update_anim_1
	ld a, [wDirection]
	and a
	jr nz, .asm_1e239
	call ApplyWalkVelocity_Left
	call SubXOffset
	jr .asm_1e23f
.asm_1e239
	call ApplyWalkVelocity_Right
	call AddXOffset

.asm_1e23f
	ld a, [wWalkVelIndex]
	cp $18
	jr c, .asm_1e24b
	ld a, $14
	ld [wWalkVelIndex], a
.asm_1e24b
	farcall CheckFrontCollision
	ld a, b
	and $0f
	jp nz, DoBumpWithBigBackOffset

	ld a, [wJumpVelIndex]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_HighJump
	add hl, de
	bit 7, [hl]
	jr z, .falling

; rising
	ld a, [hl]
	cpl
	inc a
	ld b, a
	call SubYOffset
	ld hl, wJumpVelIndex
	inc [hl]
	jr .asm_1e28a

.falling
	ld b, [hl]
	call AddYOffset
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
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ret

.asm_1e2a9
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_1e2bf
	jp TriggerDownwardsFloorTransition
.asm_1e2bf
	call TriggerFloorTransition
	jp SetState_Rolling
; 0x1e2c5

UpdateState_PickedUp: ; 1e2c5 (7:62c5)
	ld a, [wDirection]
	and a
	jr nz, .dir_right

; dir left
	ld a, [wJoypadPressed]
	and A_BUTTON | B_BUTTON | D_RIGHT
	jr nz, .wiggle_right

.asm_1e2d2
	update_anim_1

	ld hl, wPickedUpFrameCounter
	dec [hl]
	ret nz
	ld a, MAX_PICKED_UP_FRAME_COUNTER
	ld [hl], a ; reset frame counter
	ld a, NUM_WIGGLES_TO_ESCAPE
	ld [wPickedUpWiggleCounter], a
	ret

.wiggle_right
	ld a, MAX_PICKED_UP_FRAME_COUNTER
	ld [wPickedUpFrameCounter], a ; reset frame counter
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	load_frameset Frameset_15f7f
.wiggle_left
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	update_anim_1

	ld a, MAX_PICKED_UP_FRAME_COUNTER
	ld [wPickedUpFrameCounter], a ; reset frame counter
	ld hl, wPickedUpWiggleCounter
	dec [hl]
	ret nz
	xor a
	ld [wAutoMoveState], a
	jp StartFall

.dir_right
	ld a, [wJoypadPressed]
	and A_BUTTON | B_BUTTON | D_LEFT
	jr z, .asm_1e2d2
	ld a, MAX_PICKED_UP_FRAME_COUNTER
	ld [wPickedUpFrameCounter], a ; reset frame counter
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	load_frameset Frameset_15f70
	jr .wiggle_left
; 0x1e347

UpdateState_GroundShakeStunned: ; 1e347 (7:6347)
	update_anim_1
	ld a, [wGroundShakeCounter]
	and a
	jr z, .asm_1e3b6
	ld a, [wJumpVelTable]
	and a
	ret z
	call ApplyJumpVelocity
	farcall HandleWalk
	call Func_1762
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1e395
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ret

.asm_1e395
	farcall CheckCentreCollision
	ld a, b
	and a
	jr nz, .asm_1e3ab
	jp TriggerDownwardsFloorTransition
.asm_1e3ab
	call TriggerFloorTransition
	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ret
.asm_1e3b6
	ld a, -27
	ld [wCollisionBoxTop], a
	farcall CheckUpCollision
	ld a, b
	and a
	jr z, .asm_1e3d1
	jp CrouchOrSlideIfOnSlope
.asm_1e3d1
	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, StartFall
	jp SetState_Idling
; 0x1e3e8

UpdateState_EnteringDoor: ; 1e3e8 (7:63e8)
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 36
	ld [wSFXLoopCounter], a
	play_sfx SFX_WALK
.skip_sfx
	update_anim_1

	ld a, [wWarioStateCounter]
	dec a
	jr z, .asm_1e444
	dec a
	jr z, .asm_1e455
	dec a
	jr z, .asm_1e45a
	ld a, [wAnimationEnded]
	and a
	ret z

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_14d15
	update_anim_1
	ld hl, wWarioStateCounter
	inc [hl]
	ret

.asm_1e444
	ld a, [wAnimationEnded]
	and a
	ret z
	ld hl, wWarioStateCounter
	inc [hl]
	ld hl, wRoomTransitionParam
	res ROOMTRANSITIONFLAG_3_F, [hl]
	jp TriggerRoomTransition

.asm_1e455
	ld hl, wWarioStateCounter
	inc [hl]
	ret

.asm_1e45a
	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_Walking_ResetWalkVel
	jp SetState_Idling
; 0x1e46a

ApplyWaterCurrentMovement: ; 1e46a (7:646a)
	call ApplyLastWaterCurrentMovement

	ld a, [wWaterCurrent]
	bit CURRENT_RIGHT_F, a
	jr nz, .right_current
	bit CURRENT_LEFT_F, a
	jr nz, .left_current
	bit CURRENT_UP_F, a
	jp nz, .up_current
	bit CURRENT_DOWN_F, a
	jp nz, .down_current

; no current
	ld a, [wCurWaterCurrent]
	and a
	call nz, .ChangeCurrentDirection
	xor a
	ld [wCurWaterCurrent], a
	ret

.right_current
	ld a, [wCurWaterCurrent]
	and CURRENT_LEFT | CURRENT_UP | CURRENT_DOWN
	call nz, .ChangeCurrentDirection
	ld hl, wWaterCurrent
	ld a, [hl]
	ld [wCurWaterCurrent], a
	res CURRENT_RIGHT_F, [hl]
	ld a, [wc0e1]
	bit D_RIGHT_F, a
	ret nz
	farcall Func_19741
	ld a, b
	and a
	ret nz
	ld a, [wSwimmingDirectionInput]
	bit D_RIGHT_F, a
	ret nz
	bit D_LEFT_F, a
	jr z, .push_right
	ld a, [wPowerUpLevel]
	cp PRINCE_FROGS_GLOVES
	ret nc
.push_right
	ld b, 2
	call AddXOffset
	ret

.left_current
	ld a, [wCurWaterCurrent]
	and CURRENT_RIGHT | CURRENT_UP | CURRENT_DOWN
	call nz, .ChangeCurrentDirection
	ld hl, wWaterCurrent
	ld a, [hl]
	ld [wCurWaterCurrent], a
	res CURRENT_LEFT_F, [hl]
	ld a, [wc0e1]
	bit D_LEFT_F, a
	ret nz
	farcall Func_197b1
	ld a, b
	and a
	ret nz
	ld a, [wSwimmingDirectionInput]
	bit D_LEFT_F, a
	ret nz
	bit D_RIGHT_F, a
	jr z, .push_left
	ld a, [wPowerUpLevel]
	cp PRINCE_FROGS_GLOVES
	ret nc
.push_left
	ld b, 2
	call SubXOffset
	ret

.up_current
	ld a, [wCurWaterCurrent]
	and CURRENT_RIGHT | CURRENT_LEFT | CURRENT_DOWN
	call nz, .ChangeCurrentDirection
	ld hl, wWaterCurrent
	ld a, [hl]
	ld [wCurWaterCurrent], a
	res CURRENT_UP_F, [hl]
	ld a, [wc0e1]
	bit D_UP_F, a
	ret nz
	farcall CheckUpCollision
	ld a, b
	and a
	ret nz
	ld a, [wSwimmingDirectionInput]
	bit D_UP_F, a
	ret nz
	bit D_DOWN_F, a
	jr z, .push_up
	ld a, [wPowerUpLevel]
	cp PRINCE_FROGS_GLOVES
	ret nc
.push_up
	ld b, 2
	call SubYOffset
	ret

.down_current
	ld a, [wCurWaterCurrent]
	and CURRENT_RIGHT | CURRENT_LEFT | CURRENT_UP
	call nz, .ChangeCurrentDirection
	ld hl, wWaterCurrent
	ld a, [hl]
	ld [wCurWaterCurrent], a
	res CURRENT_DOWN_F, [hl]
	ld a, [wc0e1]
	bit D_DOWN_F, a
	ret nz
	farcall CheckCentreCollision
	ld a, b
	and a
	ret nz
	ld a, [wSwimmingDirectionInput]
	bit D_DOWN_F, a
	ret nz
	bit D_UP_F, a
	jr z, .push_down
	ld a, [wPowerUpLevel]
	cp PRINCE_FROGS_GLOVES
	ret nc
.push_down
	ld b, 2
	call AddYOffset
	ret

.ChangeCurrentDirection
	ld a, [wLastWaterCurrent]
	and a
	ret nz
	ld a, [wCurWaterCurrent]
	add 15 << 4
	ld [wLastWaterCurrent], a
	ret
; 0x1e598

; water currents have a "lingering" effect
; this routine applies the movements and
; decreases the counter for the duration of the effect
ApplyLastWaterCurrentMovement: ; 1e598 (7:6598)
	ld a, [wLastWaterCurrent]
	and a
	ret z
	bit CURRENT_RIGHT_F, a
	jr nz, .right_current
	bit CURRENT_LEFT_F, a
	jr nz, .left_current
	bit CURRENT_UP_F, a
	jp nz, .up_current
	bit CURRENT_DOWN_F, a
	jp nz, .down_current
	ret

.right_current
	ld a, [wc0e1]
	bit D_RIGHT_F, a
	jr nz, .reset_last_water_current
	farcall Func_19741
	ld a, b
	and a
	jr nz, .reset_last_water_current
	ld a, [wSwimmingDirectionInput]
	bit D_RIGHT_F, a
	jr nz, .decr_counter
	bit D_LEFT_F, a
	jr z, .push_right
	ld a, [wPowerUpLevel]
	cp PRINCE_FROGS_GLOVES
	jr nc, .decr_counter
.push_right
	ld b, 1
	call AddXOffset
	jr .decr_counter

.left_current
	ld a, [wc0e1]
	bit D_LEFT_F, a
	jr nz, .reset_last_water_current
	farcall Func_197b1
	ld a, b
	and a
	jr nz, .reset_last_water_current
	ld a, [wSwimmingDirectionInput]
	bit D_LEFT_F, a
	jr nz, .decr_counter
	bit D_RIGHT_F, a
	jr z, .push_left
	ld a, [wPowerUpLevel]
	cp PRINCE_FROGS_GLOVES
	jr nc, .decr_counter
.push_left
	ld b, 1
	call SubXOffset

.decr_counter
	ld a, [wLastWaterCurrent]
	sub 1 << 4
	ld [wLastWaterCurrent], a
	and $f0
	ret nz
.reset_last_water_current
	xor a
	ld [wLastWaterCurrent], a
	ret

.up_current
	ld a, [wc0e1]
	bit D_UP_F, a
	jr nz, .reset_last_water_current
	farcall CheckUpCollision
	ld a, b
	and a
	jr nz, .reset_last_water_current
	ld a, [wSwimmingDirectionInput]
	bit D_UP_F, a
	jr nz, .decr_counter
	bit D_DOWN_F, a
	jr z, .push_up
	ld a, [wPowerUpLevel]
	cp PRINCE_FROGS_GLOVES
	jr nc, .decr_counter
.push_up
	ld b, 1
	call SubYOffset
	jr .decr_counter

.down_current
	ld a, [wc0e1]
	bit D_DOWN_F, a
	jr nz, .reset_last_water_current
	farcall CheckCentreCollision
	ld a, b
	and a
	jr nz, .reset_last_water_current
	ld a, [wSwimmingDirectionInput]
	bit D_DOWN_F, a
	jr nz, .decr_counter
	bit D_UP_F, a
	jr z, .push_down
	ld a, [wPowerUpLevel]
	cp PRINCE_FROGS_GLOVES
	jr nc, .decr_counter
.push_down
	ld b, 1
	call AddYOffset
	jr .decr_counter
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
	jr nz, SetState_Walking_ResetWalkVel
	jp SetState_Turning
.d_left_1
	ld a, [wDirection]
	and a
	jr z, SetState_Walking_ResetWalkVel
	jp SetState_Turning
; 0x1e6b5

SetState_Walking_ResetWalkVel: ; 1e6b5 (7:66b5)
	xor a
	ld [wWalkVelIndex], a
;	fallthrough

SetState_Walking: ; 1e6b9 (7:66b9)
	ld a, WST_WALKING
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
	ld [wSFXLoopCounter], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wIsSmashAttacking], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
;	fallthrough

Func_1e6ea: ; 1e6ea (7:66ea)
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_gfx WarioWalkGfx
	call LoadWarioGfx
	load_oam OAM_1426c

	ld a, [wDirection]
	and a
	jr nz, .dir_right
; dir_left
	load_frameset Frameset_149b4
	jr .got_frameset
.dir_right
	load_frameset Frameset_149c5
.got_frameset
	update_anim_1
	ret
; 0x1e73e

SetState_Turning: ; 1e73e (7:673e)
	ld a, WST_TURNING
	ld [wWarioState], a
	xor a
	ld [wAttackCounter], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14a82
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	and a
	jr nz, .asm_1e791
	load_frameset Frameset_14cbe
	jr .asm_1e79b
.asm_1e791
	load_frameset Frameset_14cc5
.asm_1e79b
	update_anim_1
	ret
; 0x1e7ab

SetState_Attacking: ; 1e7ab (7:67ab)
	ld a, MAX_ATTACK_COUNTER
	ld [wAttackCounter], a
	xor a
	ld [wSFXLoopCounter], a
	ld a, WST_ATTACKING
	ld [wWarioState], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wIsCrouching], a

	load_oam OAM_14d1b
	load_gfx WarioAttackGfx
	call LoadWarioGfx

	ld a, [wPowerUpLevel]
	cp GARLIC
	jr nc, .asm_1e829
	ld a, [wDirection]
	and a
	jr nz, .asm_1e81d
	load_frameset Frameset_151e4
	jr .asm_1e845
.asm_1e81d
	load_frameset Frameset_151fd
	jr .asm_1e845
.asm_1e829
	ld a, [wDirection]
	and a
	jr nz, .asm_1e83b
	load_frameset Frameset_1521c
	jr .asm_1e845
.asm_1e83b
	load_frameset Frameset_1522d
.asm_1e845
	update_anim_1
	ret
; 0x1e855

CrouchOrSlideIfOnSlope: ; 1e855 (7:6855)
	ld a, [wIsStandingOnSlope]
	and a
	jp nz, SetState_Sliding
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -15
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	ld a, WST_CROUCHING
	ld [wWarioState], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wWalkVelIndex], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ld a, TRUE
	ld [wIsCrouching], a

	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_CrouchWalking

	load_gfx WarioWalkGfx
	call LoadWarioGfx
	load_oam OAM_1426c
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_1e8d3
	load_frameset Frameset_14a38
	jr .asm_1e8dd
.asm_1e8d3
	load_frameset Frameset_14a3b
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
	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	call ApplyWalkVelocity_Right
	call AddXOffset
.asm_1e93d
	ld a, [wWalkVelIndex]
	cp $10
	jr c, .asm_1e949
	ld a, $0c
	ld [wWalkVelIndex], a
.asm_1e949
	ret

.d_left
	ld a, [wDirection]
	and a
	jp nz, SetState_Turning
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	call ApplyWalkVelocity_Left
	call SubXOffset
	jr .asm_1e93d

.asm_1e970
	call IsOnSlipperyGround
	jr z, SetState_Idling
	farcall SetState_Slipping
	ret

.d_down
	call IsOnSlipperyGround
	jp z, CrouchOrSlideIfOnSlope
	farcall SetState_CrouchSlipping
	ret

SetState_Idling:: ; 1e99b (7:699b)
	xor a
	ld [wWalkVelIndex], a

	ld a, WST_IDLING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld [wIsCrouching], a
	ld [wAttackCounter], a
	ld [wGrabState], a

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ld a, -27
	ld [wCollisionBoxTop], a

	farcall CheckUpCollision
	ld a, [wWarioState]
	cp WST_IDLING
	ret nz
	ld a, b
	and a
	jp nz, CrouchOrSlideIfOnSlope
	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14000
	ld a, [wDirection]
	and a
	jr nz, .asm_1ea24
	load_frameset Frameset_14252
	jr .asm_1ea2e
.asm_1ea24
	load_frameset Frameset_1425f
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
	jp nz, StartJumpingAirborneAttack
	bit D_DOWN_F, a
	jp nz, SetState_CrouchSliding
	ret

.dir_left
	ld a, [wJoypadDown]
	bit D_LEFT_F, a
	jp nz, SetState_Turning
	jr .check_pressed
; 0x1ea64

HandleAttackingAirborneMovement: ; 1ea64 (7:6a64)
	call ApplyJumpVelocity
	farcall HandleWalk
	ld a, [wWalkVelIndex]
	cp $14
	jr c, .done
	ld a, $10
	ld [wWalkVelIndex], a
.done
	ret
; 0x1ea83

HandleBumpMovement: ; 1ea83 (7:6a83)
	ld a, [wJumpVelIndex]
	cp 28
	jr c, .no_control
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jr z, .no_control
	bit D_RIGHT_F, a
	jr nz, .d_right
; d-left
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	farcall Func_19741
	ld a, b
	and a
	jr nz, .start_fall
	ld b, 1
	call AddXOffset
	jr .start_fall

.d_right
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	farcall Func_197b1
	ld a, b
	and a
	jr nz, .start_fall
	ld b, 1
	call SubXOffset

.start_fall
	xor a
	ld [wWalkVelIndex], a
	jp StartFall

.no_control
	ld a, [wDirection]
	cp DIRECTION_RIGHT
	jr z, .dir_right
; dir left
	ld b, 1
	call SubXOffset
	farcall Func_197b1
	ld a, b
	and a
	jr z, .handle_vertical
	ld b, 1
	call AddXOffset
	jr .handle_vertical
.dir_right
	ld b, 1
	call AddXOffset
	farcall Func_19741
	ld a, b
	and a
	jr z, .handle_vertical
	ld b, 1
	call SubXOffset

.handle_vertical
	ld a, [wJumpVelIndex]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	bit 7, [hl]
	jr z, .rising
; falling
	ld a, [hl]
	cpl
	inc a
	ld b, a
	call SubYOffset
	ld hl, wJumpVelIndex
	inc [hl]
	jr .done
.rising
	ld b, [hl]
	call AddYOffset
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

	ld a, -27
	ld [wCollisionBoxTop], a
	farcall CheckUpCollision
	ld a, [wWarioState]
	cp WST_CROUCHING
	ret nz ; not crouching anymore

	ld a, b
	and a
	jp z, SetState_Idling

.asm_1eb79
	ld a, -15
	ld [wCollisionBoxTop], a
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
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -15
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	ld a, WST_CROUCH_WALKING
	ld [wWarioState], a

	ld a, TRUE
	ld [wIsCrouching], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wAttackCounter], a
	ld [wGrabState], a
	ld [wSFXLoopCounter], a ; redundant

	load_oam OAM_1426c
	load_gfx WarioWalkGfx
	call LoadWarioGfx
	ld a, [wDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_1ec0d
	load_frameset Frameset_14a26
.asm_1ebfd
	update_anim_1
	ret
.asm_1ec0d
	load_frameset Frameset_14a2f
	jr .asm_1ebfd
; 0x1ec19

Func_1ec19: ; 1ec19 (7:6c19)
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a
	ld a, -27
	ld [wCollisionBoxTop], a
	farcall CheckUpCollision

	ld a, [wWarioState]
	cp WST_CROUCHING
	jr z, .asm_1ec3c
	cp WST_CROUCH_WALKING
	ret nz

.asm_1ec3c
	ld a, b
	and a
	jp z, StartCrouchJump
	xor a
	ld [wJumpVelTable], a
	ld a, -15
	ld [wCollisionBoxTop], a
	ret
; 0x1ec4b

Func_1ec4b: ; 1ec4b (7:6c4b)
	ld a, -27
	ld [wCollisionBoxTop], a
	farcall CheckUpCollision
	ld a, b
	and a
	jr nz, .asm_1ec66
	jp SetState_Attacking
.asm_1ec66
	ld a, -15
	ld [wCollisionBoxTop], a
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

	ld a, -27
	ld [wCollisionBoxTop], a
	farcall CheckUpCollision
	ld a, [wWarioState]
	cp WST_CROUCH_WALKING
	ret nz ; not crouch walking anymore

	ld a, b
	and a
	jp z, SetState_Idling

.asm_1ec9d
	ld a, -15
	ld [wCollisionBoxTop], a
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_1ecb0
	bit D_LEFT_F, a
	jr nz, .asm_1ecf2
	jp CrouchOrSlideIfOnSlope

.asm_1ecb0
	ld a, [wDirection]
	and a
	jr nz, .asm_1eccc
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_14a2f
.asm_1eccc
	farcall CheckFrontCollision
	ld a, b
	and $0f
	ret nz
	call ApplyWalkVelocity_Right
	call AddXOffset
	ld a, [wWalkVelIndex]
	cp $04
	jr c, .asm_1ecf1
	ld a, $00
	ld [wWalkVelIndex], a
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
	ld [wAnimationFrame], a
	load_frameset Frameset_14a26
.asm_1ed0e
	farcall CheckFrontCollision
	ld a, b
	and $0f
	ret nz
	call ApplyWalkVelocity_Left
	call SubXOffset
	ld a, [wWalkVelIndex]
	cp $04
	jr c, .asm_1ed33
	ld a, $00
	ld [wWalkVelIndex], a
.asm_1ed33
	ret
; 0x1ed34

StartCrouchFall: ; 1ed34 (7:6d34)
	xor a
	ld [wWalkVelIndex], a
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	jr SetState_CrouchAirborne

StartCrouchJump: ; 1ed3f (7:6d3f)
	play_sfx SFX_JUMP
	xor a
	ld [wJumpVelIndex], a
;	fallthrough

SetState_CrouchAirborne: ; 1ed4b (7:6d4b)
	ld a, WST_CROUCH_AIRBORNE
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -15
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a
	load_gfx WarioWalkGfx
	call LoadWarioGfx
	load_oam OAM_1426c

	ld a, [wDirection]
	and a
	jr nz, .asm_1edaf
	load_frameset Frameset_14a38
	jr .asm_1edb9
.asm_1edaf
	load_frameset Frameset_14a3b
.asm_1edb9
	update_anim_1

	ld a, [wIsOnSteppableObject]
	and a
	ret z
	ld b, $02
	call SubYOffset
	ret
; 0x1edd3

Func_1edd3: ; 1edd3 (7:6dd3)
	ld a, [wGrabState]
	and GRAB_FLAGS_MASK
	add GRAB_IDLE
	ld [wGrabState], a
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_HIGH_JUMP
	ld [wJumpVelTable], a
	jr SetState_GrabAirborne
;	fallthrough

Func_1ede9: ; 1ede9 (7:6de9)
	play_sfx SFX_JUMP
	xor a
	ld [wJumpVelIndex], a
	ld [wIsSmashAttacking], a
	ld a, [wPowerUpLevel]
	cp HIGH_JUMP_BOOTS
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
	ld a, WST_GRAB_AIRBORNE
	ld [wWarioState], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	load_gfx WarioAirborneGfx
	call LoadWarioGfx
	load_oam OAM_15955
	ld a, [wDirection]
	and a
	jr nz, .asm_1ee66
	load_frameset Frameset_15fa8
	jr .asm_1ee70
.asm_1ee66
	load_frameset Frameset_15fab
.asm_1ee70
	update_anim_1
	ld a, [wIsOnSteppableObject]
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
	jp nz, CrouchOrSlideIfOnSlope
	and D_RIGHT | D_LEFT
	jr nz, .asm_1eea2
	ret

.asm_1eea2
	ld a, WST_GRAB_WALKING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_1eeeb
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	load_frameset Frameset_149fe
.asm_1eedb
	update_anim_1
	ret
.asm_1eeeb
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	load_frameset Frameset_14a0f
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
	call IsOnSlipperyGround
	jr z, .not_slippery
	farcall SetState_GrabSlipping
	ret

.not_slippery
	jp SetState_GrabIdling

.asm_1ef31
	ld a, [wDirection]
	and a
	jp z, SetState_GrabIdling
	farcall CheckFrontCollision
	ld a, b
	and $0f
	ret nz
	jr .asm_1ef69

.asm_1ef4d
	ld a, [wDirection]
	and a
	jp nz, SetState_GrabIdling
	farcall CheckFrontCollision
	ld a, b
	and $0f
	ret nz
	jr .asm_1ef7b

.asm_1ef69
	call ApplyWalkVelocity_Right
	call AddXOffset
	ld a, [wIsStandingOnSlope]
	and a
	jr z, .asm_1ef8d
	bit 0, a
	jr z, .asm_1ef8d
	jr .asm_1efc5

.asm_1ef7b
	call ApplyWalkVelocity_Left
	call SubXOffset
	ld a, [wIsStandingOnSlope]
	and a
	jr z, .asm_1ef8d
	bit 0, a
	jr nz, .asm_1ef8d
	jr .asm_1efc5
.asm_1ef8d
	ld a, [wGrabState]
	bit GRAB_HEAVY_F, a
	jr nz, .asm_1efa1
	ld a, [wWalkVelIndex]
	cp $10
	jr c, .asm_1efa0
	ld a, $0c
	ld [wWalkVelIndex], a
.asm_1efa0
	ret

.asm_1efa1
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_1efa0
	ld a, $04
	ld [wWalkVelIndex], a
	jr .asm_1efa0

.asm_1efaf
	call IsOnSlipperyGround
	jp z, CrouchOrSlideIfOnSlope
	farcall SetState_CrouchSlipping
	ret

.asm_1efc5
	ld a, [wGrabState]
	bit GRAB_HEAVY_F, a
	jr nz, .asm_1efd9
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_1efd8
	ld a, $04
	ld [wWalkVelIndex], a
.asm_1efd8
	ret

.asm_1efd9
	ld a, [wWalkVelIndex]
	cp $04
	jr c, .asm_1efd8
	ld a, $00
	ld [wWalkVelIndex], a
	jr .asm_1efd8
; 0x1efe7

SetState_GrabIdling: ; 1efe7 (7:6fe7)
	ld a, [wGrabState]
	and a
	jp z, SetState_Idling

	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wIsSmashAttacking], a
	ld [wIsCrouching], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a

	ld a, [wGrabState]
	and GRAB_FLAGS_MASK
	add GRAB_IDLE
	ld [wGrabState], a

	ld a, WST_GRAB_IDLING
	ld [wWarioState], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	load_gfx WarioWalkGfx
	call LoadWarioGfx
	load_oam OAM_1426c

	ld a, [wDirection]
	and a
	jr nz, .asm_1f05d
	load_frameset Frameset_14a20
	jr .asm_1f067
.asm_1f05d
	load_frameset Frameset_14a23
.asm_1f067
	update_anim_1
	ret
; 0x1f077

HandleInput_Airborne: ; 1f077 (7:7077)
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jr nz, .skip_set_fall

; not pressing A button any more, so
; set wJumpingUpwards to false and
; if still in a rising jump vel index
; then immediately set it to the falling index
	xor a ; FALSE
	ld [wJumpingUpwards], a
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .skip_set_fall
	ld a, [wDoFullJump]
	and a
	jr nz, .skip_set_fall
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
.skip_set_fall

	ld a, [wJumpVelIndex]
	ld e, a
	ld d, $00
	ld a, [wJumpVelTable]
	dec a
	jr z, .knock_back
	dec a
	jr z, .normal_jump
; high jump
	ld hl, JumpVelTable_HighJump ; JUMP_VEL_HIGH_JUMP
	jr .got_jump_vel_table
.normal_jump
	ld hl, JumpVelTable_Normal ; JUMP_VEL_NORMAL
	jr .got_jump_vel_table
.knock_back
	ld hl, JumpVelTable_KnockBack ; JUMP_VEL_KNOCK_BACK
.got_jump_vel_table
	add hl, de
	bit 7, [hl]
	jr z, .falling

; rising
	ld a, [hl]
	cpl
	inc a
	ld b, a
	call SubYOffset
	ld hl, wJumpVelIndex
	inc [hl]
	jr .check_input

.falling
	xor a
	ld [wDoFullJump], a
	ld b, [hl]
	call AddYOffset
	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp MAX_JUMP_VEL_INDEX
	jr c, .check_input
	ld [hl], MAX_JUMP_VEL_INDEX

.check_input
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	ret

.d_right
	call WalkRight
	jp Func_1762

.d_left
	call WalkLeft
	jp Func_1762
; 0x1f0ed

WalkRight: ; 1f0ed (7:70ed)
	xor a
	ld [wIsTurning], a
	ld a, [wDirection]
	and a
	jr nz, .walk
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	ld a, TRUE
	ld [wIsTurning], a
.walk
	jp WalkIfPossible_Right
; 0x1f104

WalkLeft: ; 1f104 (7:7104)
	xor a
	ld [wIsTurning], a
	ld a, [wDirection]
	and a
	jr z, .walk
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	ld a, TRUE
	ld [wIsTurning], a
.walk
	jp WalkIfPossible_Left
; 0x1f11b

WalkIfPossible_Right: ; 1f11b (7:711b)
	farcall CheckFrontCollision
	ld a, b
	and $0f
	ret nz
	call ApplyWalkVelocity_Right
	call AddXOffset
	ret
; 0x1f135

WalkIfPossible_Left: ; 1f135 (7:7135)
	farcall CheckFrontCollision
	ld a, b
	and $0f
	ret nz
	call ApplyWalkVelocity_Left
	call SubXOffset
	ret
; 0x1f14f

HandleDivingHorizontalMovement: ; 1f14f (7:714f)
	ld a, [wPowerUpLevel]
	cp SWIMMING_FLIPPERS
	ret c
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	ret

.d_right
	ld a, [wDirection]
	cp DIRECTION_RIGHT
	jr z, .has_right_dir
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
.has_right_dir
	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	ld b, 1
	call AddXOffset
	ret

.d_left
	ld a, [wDirection]
	cp DIRECTION_LEFT
	jr z, .has_left_dir
	ld a, DIRECTION_LEFT
	ld [wDirection], a
.has_left_dir
	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	ld b, 1
	call SubXOffset
	ret
; 0x1f1a9

Func_1f1a9: ; 1f1a9 (7:71a9)
	ld a, [wWaterInteraction]
	cp $02
	jr z, .asm_1f1f5
	ld a, [wPowerUpLevel]
	cp SWIMMING_FLIPPERS
	jr c, .asm_1f1f5
	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, StartUnderwaterThrusting
	bit A_BUTTON_F, a
	jp nz, StartUpwardsUnderwaterThrusting
	ld a, [wJoypadDown]
	and D_PAD
	jp nz, Func_1f24c

	ld a, [wWarioStateCycles]
	and a
	jr nz, .asm_1f1f5
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1f1eb
	load_frameset Frameset_15569
	jr .asm_1f1f5
.asm_1f1eb
	load_frameset Frameset_15573
.asm_1f1f5
	update_anim_1

	ld a, $01
	ld [wWarioStateCycles], a
	farcall CheckUpCollision
	ld a, b
	and a
	jr nz, .asm_1f246
	farcall Func_19acd
	ld a, [wWaterInteraction]
	and a
	jp z, SurfaceFromUnderwater
	ld a, [wGlobalCounter]
	and %1
	ret nz
	ld hl, wCurWaterCurrent
	ld a, [hld]
	or [hl] ; wLastWaterCurrent
	and CURRENT_UP | CURRENT_DOWN
	ret nz
	ld b, $01
	call SubYOffset
	ret

.asm_1f246
	ld a, D_UP
	ld [wc0e1], a
	ret
; 0x1f24c

Func_1f24c: ; 1f24c (7:724c)
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 37
	ld [wSFXLoopCounter], a
	play_sfx SFX_00E
.skip_sfx

	ld a, [wWarioStateCycles]
	and a
	jr z, .asm_1f28f
	xor a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1f285
	load_frameset Frameset_15576
	jr .asm_1f28f
.asm_1f285
	load_frameset Frameset_1558b
.asm_1f28f
	update_anim_1

	ld a, [wGlobalCounter]
	and %1
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
	farcall CheckCentreCollision
	ld a, b
	and a
	jr z, .asm_1f2de
	update_pos_y
.asm_1f2de
	ld a, [wWarioState]
	cp WST_WATER_STUNG
	ret z
	ld a, [wDirection]
	and a
	jr nz, Func_1f310
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_1558b
	update_anim_1
	ret
; 0x1f310

Func_1f310: ; 1f310 (7:7310)
	farcall CheckFrontCollision
	ld a, b
	and a
	jr nz, .asm_1f345
	ld a, [wDirection]
	and a
	jr z, .asm_1f337
	ld hl, wCurWaterCurrent
	ld a, [hld]
	or [hl] ; wLastWaterCurrent
	and CURRENT_RIGHT | CURRENT_LEFT
	ret nz
	ld b, $01
	call AddXOffset
	ret

.asm_1f337
	ld hl, wCurWaterCurrent
	ld a, [hld]
	or [hl] ; wLastWaterCurrent
	and CURRENT_RIGHT | CURRENT_LEFT
	ret nz
	ld b, $01
	call SubXOffset
	ret

.asm_1f345
	ld a, [wDirection]
	and a
	jr z, .asm_1f351
	ld a, D_RIGHT
	ld [wc0e1], a
	ret

.asm_1f351
	ld a, D_LEFT
	ld [wc0e1], a
	ret
; 0x1f357

Func_1f357: ; 1f357 (7:7357)
	farcall CheckCentreCollision
	ld a, b
	and a
	jr z, .asm_1f375
	update_pos_y
.asm_1f375
	ld a, [wWarioState]
	cp WST_WATER_STUNG
	ret z
	ld a, [wDirection]
	and a
	jr z, Func_1f310
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_15576
	update_anim_1
	ret
; 0x1f3a7

Func_1f3a7: ; 1f3a7 (7:73a7)
	farcall CheckCentreCollision
	ld a, b
	and a
	jr z, .asm_1f3cb
	update_pos_y
	ld a, D_DOWN
	ld [wc0e1], a
	ret

.asm_1f3cb
	ld hl, wCurWaterCurrent
	ld a, [hld]
	or [hl] ; wLastWaterCurrent
	and CURRENT_UP | CURRENT_DOWN
	ret nz
	ld b, $01
	call AddYOffset
	ret
; 0x1f3d9

Func_1f3d9: ; 1f3d9 (7:73d9)
	farcall CheckUpCollision
	ld a, b
	and a
	ret nz
	farcall Func_19acd
	ld a, [wWaterInteraction]
	and a
	jp z, SurfaceFromUnderwater
	ld hl, wCurWaterCurrent
	ld a, [hld]
	or [hl] ; wLastWaterCurrent
	and CURRENT_UP | CURRENT_DOWN
	ret nz
	ld b, $01
	call SubYOffset
	ret
; 0x1f40f

HandleWaterSurfaceInput: ; 1f40f (7:740f)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, StartJump_FromWaterSurface
	bit B_BUTTON_F, a
	jr z, .no_thrust

	ld a, [wPowerUpLevel]
	cp SWIMMING_FLIPPERS
	jp c, .no_thrust ; should be jr
	ld a, [wJoypadDown]
	bit D_UP_F, a
	ret nz
	farcall Func_19b12
	ld a, [wWaterInteraction]
	cp $02
	jp z, SetState_TryingSubmerge
	ld b, 3
	call AddYOffset
	jp StartUnderwaterThrusting

.no_thrust
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	ret z
	ld a, [wPowerUpLevel]
	cp SWIMMING_FLIPPERS
	jp c, SetState_TryingSubmerge
	farcall Func_19b12
	ld a, [wWaterInteraction]
	cp $02
	jp z, SetState_TryingSubmerge
	jp SetState_Submerged
; 0x1f470

HandleUnderwaterThrustingInput: ; 1f470 (7:7470)
	ld hl, wSwimVelIndex
	inc [hl]
	ld a, [hl]
	cp 40
	jr c, .continue
	xor a
	ld [hl], a
	jp SetState_Submerged
.continue
	ld a, [wJoypadDown]
	and A_BUTTON | B_BUTTON
	jp z, SetState_Submerged

	ld a, [wSwimmingDirectionInput]
	bit D_RIGHT_F, a
	jr nz, .right
	bit D_LEFT_F, a
	jr nz, .left
	bit D_UP_F, a
	jp nz, .up
	bit D_DOWN_F, a
	jp nz, .down
	ret

.right
	farcall CheckCentreCollision
	ld a, b
	and a
	jr z, .asm_1f4ba
	update_pos_y
.asm_1f4ba
	ld a, [wWarioState]
	cp WST_WATER_STUNG
	ret z
	farcall Func_19741
	ld a, b
	and a
	jp nz, SetState_SwimKnockBack_SwitchDirection
	ld a, [wSwimVelIndex]
	ld e, a
	ld d, $00
	ld hl, SwimStraightVelTable
	ld a, [wSwimmingDirectionInput]
	and D_UP | D_DOWN
	jr z, .not_diagonal_1
	ld hl, SwimDiagonalVelTable
.not_diagonal_1
	add hl, de
	ld b, [hl]
	call AddXOffset
	ld a, [wSwimmingDirectionInput]
	bit D_UP_F, a
	jp nz, .up
	bit D_DOWN_F, a
	jp nz, .down
	jr .handle_diagonal_movement

.left
	farcall CheckCentreCollision
	ld a, b
	and a
	jr z, .asm_1f519
	update_pos_y
.asm_1f519
	ld a, [wWarioState]
	cp WST_WATER_STUNG
	ret z
	farcall Func_197b1
	ld a, b
	and a
	jp nz, SetState_SwimKnockBack_SwitchDirection
	ld a, [wSwimVelIndex]
	ld e, a
	ld d, $00
	ld hl, SwimStraightVelTable
	ld a, [wSwimmingDirectionInput]
	and D_UP | D_DOWN
	jr z, .not_diagonal_2
	ld hl, SwimDiagonalVelTable
.not_diagonal_2
	add hl, de
	ld b, [hl]
	call SubXOffset
	ld a, [wSwimmingDirectionInput]
	bit D_UP_F, a
	jp nz, .up
	bit D_DOWN_F, a
	jp nz, .down
	jr .handle_diagonal_movement ; useless

.handle_diagonal_movement
	ld a, [wJoypadDown]
	and D_UP | D_DOWN
	ret z
	bit D_DOWN_F, a
	jr nz, .diagonal_down

; diagonal up
	farcall CheckUpCollision
	ld a, b
	and a
	jr nz, .asm_1f593
	farcall Func_19acd
	ld a, [wWaterInteraction]
	and a
	jp z, SurfaceFromUnderwater
	ld b, 1
	call SubYOffset
	ret

.asm_1f593
	ld hl, wc0e1
	set D_UP_F, [hl]
	ret

.diagonal_down
	farcall CheckCentreCollision
	ld a, b
	and a
	jr nz, .asm_1f5b2
	ld b, 1
	call AddYOffset
	ret

.asm_1f5b2
	update_pos_y
	ld hl, wc0e1
	set D_DOWN_F, [hl]
	ret

.down
	farcall CheckCentreCollision
	ld a, b
	and a
	jr nz, .asm_1f5ef
	ld a, [wSwimVelIndex]
	ld e, a
	ld d, $00
	ld hl, SwimStraightVelTable
	ld a, [wSwimmingDirectionInput]
	and D_RIGHT | D_LEFT
	jr z, .asm_1f5e9
	ld hl, Data_1f894
.asm_1f5e9
	add hl, de
	ld b, [hl]
	call AddYOffset
	ret

.asm_1f5ef
	update_pos_y
	ld hl, wc0e1
	set D_DOWN_F, [hl]
	ret

.up
	farcall CheckUpCollision
	ld a, b
	and a
	jr nz, .asm_1f642
	farcall Func_19acd
	ld a, [wWaterInteraction]
	and a
	jp z, SurfaceFromUnderwater
	ld a, [wSwimVelIndex]
	ld e, a
	ld d, $00
	ld hl, SwimStraightVelTable
	ld a, [wSwimmingDirectionInput]
	and D_RIGHT | D_LEFT
	jr z, .asm_1f63c
	ld hl, Data_1f894
.asm_1f63c
	add hl, de
	ld b, [hl]
	call SubYOffset
	ret

.asm_1f642
	ld hl, wc0e1
	set D_UP_F, [hl]
	jp StartDive
; 0x1f64a

HandleInvincibility: ; 1f64a (7:764a)
	ld a, [wInvincibleCounter]
	and a
	ret z
	cp $16
	jr nc, .fast
	cp $10
	jr nc, .slow

; if stung, then skip this
	ld a, [wWarioState]
	cp WST_STUNG
	jr z, .done
	cp WST_STUNG_RECOVERY
	jr z, .done

; set invicible counter
; and regular Wario palette
	ld a, $10
	ld [wInvincibleCounter], a
	ld a, [wWarioPalsPtr + 0]
	cp HIGH(Pals_c810)
	jr nz, .done
	ld a, [wWarioPalsPtr + 1]
	cp LOW(Pals_c810)
	jr nz, .done

	ld hl, Pals_c800
	call SetWarioPal
.done
	ret

.slow
	ld a, [wGlobalCounter]
	and %11
	ret nz
	ld a, [wInvincibleCounter]
	inc a
	ld [wInvincibleCounter], a
	jr .alternate_invisibility

.fast
	ld a, [wGlobalCounter]
	and %1
	ret nz
	ld a, [wInvincibleCounter]
	inc a
	ld [wInvincibleCounter], a
	cp $28
	jr c, .alternate_invisibility
	; not more invincibility
	xor a
	ld [wInvincibleCounter], a
	ld [wInvisibleFrame], a

	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT | D_DOWN
	ret nz
	farcall CheckUpCollision
	ret

.alternate_invisibility
	ld a, [wInvisibleFrame]
	xor $1
	ld [wInvisibleFrame], a
	ret
; 0x1f6c2

Func_1f6c2: ; 1f6c2 (7:76c2)
	ld a, [wGlobalCounter]
	and %111
	jr z, .asm_1f6ce
	cp $03
	jr z, .asm_1f6d5
	ret

.asm_1f6ce
	ld hl, Pals_c810
	call SetWarioPal
	ret

.asm_1f6d5
	ld hl, Pals_c800
	call SetWarioPal
	ret
; 0x1f6dc

HandleGroundShake: ; 1f6dc (7:76dc)
	ld a, [wLevelEndScreen]
	and a
	ret nz

	ld hl, wGroundShakeCounter
	ld a, [hl]
	and a
	jr z, .no_ground_shake
	cp $10
	jr c, .continue
	ld a, [wIsGettingOffLadder]
	and a
	jr nz, .continue
	ld a, [wIsWarioGroundShaking]
	and a
	jr nz, .continue
	ld a, [wJumpVelTable]
	and a
	jr nz, .continue
	ld a, [wWaterInteraction]
	and a
	jr nz, .continue
	ld a, [wTransformation]
	and a
	jr nz, .continue
	ld a, [wRoomTransitionParam]
	and a
	jr nz, .continue
	ld a, [wIsIntangible]
	and a
	jr nz, .continue
	ld a, [wIsOnSteppableObject]
	and a
	jr nz, .continue
	ld a, [wWarioState]
	cp WST_GROUND_SHAKE_STUNNED
	jr z, .continue
	jr .asm_1f73c
	ret ; unnecessary

.no_ground_shake
	xor a
	ld [wIsWarioGroundShaking], a
	ret

.continue
	dec [hl]
	ld a, [hl]
	and %10
	jr nz, .asm_1f736
	xor a
	ld [wSCYShake], a
	ret
.asm_1f736
	ld a, 2
	ld [wSCYShake], a
	ret

.asm_1f73c
	ld a, [wWarioState]
	cp WST_LADDER_CLIMBING
	jp z, SetState_LadderShakeStunned
	cp WST_LADDER_IDLING
	jp z, SetState_LadderShakeStunned
	cp WST_LADDER_SCRATCHING
	jp z, SetState_LadderShakeStunned

	ld a, WST_GROUND_SHAKE_STUNNED
	ld [wWarioState], a
	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wAttackCounter], a
	ld [wIsRolling], a
	ld [wGrabState], a
	ld a, -15
	ld [wCollisionBoxTop], a
	ld a, [wIsCrouching]
	and a
	jr nz, .crouching
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, 10
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a
.crouching
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	load_gfx WarioAirborneGfx
	call LoadWarioGfx
	load_oam OAM_15955

	ld a, [wDirection]
	and a
	jr nz, .asm_1f7cc
	load_frameset Frameset_15f70
	jr .asm_1f7d6
.asm_1f7cc
	load_frameset Frameset_15f7f
.asm_1f7d6
	update_anim_1
	ret
; 0x1f7e6

SetState_LadderShakeStunned: ; 1f7e6 (7:77e6)
	ld a, WST_LADDER_SHAKE_SLIDING
	ld [wWarioState], a
	play_sfx SFX_SLIDE

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsGettingOffLadder], a
	inc a
	ld [wJumpVelTable], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_15948
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
	call WalkIfPossible_Left
.asm_1f83c
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_1f848
	ld a, $04
	ld [wWalkVelIndex], a
.asm_1f848
	ret

.dir_right
	ld a, [wJoypadPressed]
	bit D_LEFT_F, a
	jr nz, .asm_1f855
	call WalkIfPossible_Right
	jr .asm_1f83c
.asm_1f855
	xor a
	ld [wIsRolling], a
	jp SetState_Idling

.a_btn
	xor a
	ld [wIsRolling], a
	jp StartJump_FromInput
; 0x1f863

Func_1f863: ; 1f863 (7:7863)
	ld hl, SwimStraightVelTable
	add hl, de
	ld b, [hl]
	call SubYOffset
	ret
; 0x1f86c

SwimStraightVelTable: ; 1f86c (7:786c)
	db $01, $01, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00

Data_1f894: ; 1f894 (7:7894)
	db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00

SwimDiagonalVelTable: ; 1f8bc (7:78bc)
	db $01, $01, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00
; 0x1f8e4
