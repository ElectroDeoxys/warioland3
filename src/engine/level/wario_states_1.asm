UpdateWarioStates:
	ld hl, wCoinCooldown
	ld a, [hl]
	and a
	jr z, .no_coin_cooldown
	dec [hl]
.no_coin_cooldown
	call HandleGroundShake
	call HandleInvincibility

	ld a, [wWarioState]
	cp WARIO_STATES_GROUP_1 ; WST_SLIPPING
	jr c, UpdateWarioStates_Group1
	cp WARIO_STATES_GROUP_2 ; WST_ON_FIRE
	jr c, .group_2
	cp WARIO_STATES_GROUP_3 ; WST_ICE_SKATIN_START
	jr c, .group_3
	farcall UpdateWarioStates_Group4
	ret
.group_3
	farcall UpdateWarioStates_Group3
	ret
.group_2
	farcall UpdateWarioStates_Group2
	ret

UpdateWarioStates_Group1:
	jumptable

	dw UpdateState_Idling              ; WST_IDLING
	dw UpdateState_Walking             ; WST_WALKING
	dw UpdateState_Turning             ; WST_TURNING
	dw InvalidWarioStateReset          ; WST_UNUSED_03
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
	dw InvalidWarioStateReset          ; WST_UNUSED_1B
	dw InvalidWarioStateReset          ; WST_UNUSED_1C
	dw InvalidWarioStateReset          ; WST_UNUSED_1D
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
	dw InvalidWarioStateReset          ; WST_UNUSED_2D
	dw InvalidWarioStateReset          ; WST_UNUSED_2E
	dw InvalidWarioStateReset          ; WST_UNUSED_2F
	dw InvalidWarioStateReset
	dw InvalidWarioStateReset
	dw InvalidWarioStateReset
	dw InvalidWarioStateReset
; 1c0b6

UpdateState_Idling:
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
	jp nz, CrouchOrSlide
	farcall SetState_LadderClimbing
	ret

.not_pressing_down
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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

UpdateState_Walking:
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 36
	ld [wSFXLoopCounter], a
	play_sfx SFX_WALK
.skip_sfx
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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

UpdateState_Turning:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, StartJump_FromInput
	bit B_BUTTON_F, a
	jp nz, SetState_Attacking
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_Walking_ResetWalkVel
	jp SetState_Idling

StartJump_FromWaterSurface:
	play_sfx SFX_SPLASH
	ld a, $01
	ld [wJumpVelIndex], a
	ld a, TRUE
	ld [wJumpingUpwards], a
	ld a, TRUE
	ld [wDoFullJump], a
	jr StartJump

StartJump_FromSand:
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

StartFall::
	xor a ; FALSE
	ld [wJumpingUpwards], a
StartFall_SkipResetJumpUpwards:
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	jr StartJump

StartJump_FromInput:
	play_sfx SFX_JUMP
	xor a
	ld [wJumpVelIndex], a
	ld [wIsSmashAttacking], a
	ld a, TRUE
	ld [wJumpingUpwards], a
;	fallthrough

StartJump:
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

SetState_Airborne:
	xor a
	ld [wSlopeInteraction], a

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

	ld a, BANK(WarioAirborneGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioAirborneGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioAirborneGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_15955)
	ld [wOAMBank], a
	ld a, HIGH(OAM_15955)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_15955)
	ld [wOAMPtr + 1], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1c345
	ld a, HIGH(Frameset_15f94)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f94)
	ld [wFramesetPtr + 1], a
	jr .asm_1c34f
.asm_1c345
	ld a, HIGH(Frameset_15f97)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f97)
	ld [wFramesetPtr + 1], a
.asm_1c34f
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wIsOnSteppableObject]
	and a
	ret z
	ld b, 2
	call SubYOffset
	ret

UpdateState_Airborne:
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
	ld a, HIGH(Frameset_15f94)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f94)
	ld [wFramesetPtr + 1], a
	jr .asm_1c4aa
.asm_1c462
	ld a, HIGH(Frameset_15f97)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f97)
	ld [wFramesetPtr + 1], a
	jr .asm_1c4aa

.smash_attack_left
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jr nc, .asm_1c481
	ld a, HIGH(Frameset_15f8e)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f8e)
	ld [wFramesetPtr + 1], a
	jr .asm_1c4aa
.asm_1c481
	ld a, HIGH(Frameset_1604e)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1604e)
	ld [wFramesetPtr + 1], a
	jr .asm_1c4aa
.smash_attack_right
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jr nc, .asm_1c4a0
	ld a, HIGH(Frameset_15f91)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f91)
	ld [wFramesetPtr + 1], a
	jr .asm_1c4aa
.asm_1c4a0
	ld a, HIGH(Frameset_16055)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16055)
	ld [wFramesetPtr + 1], a
.asm_1c4aa
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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

	ld a, [wWarioXPos + 1]
	and $f0
	add $08
	ld [wWarioXPos + 1], a
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

DoSoftLand:
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
	jp nz, CrouchOrSlide
	ld a, -27
	ld [wCollisionBoxTop], a
	farcall CheckUpCollision
	ld a, b
	and a
	jr z, .no_collision_on_top
	jp CrouchOrSlide
.no_collision_on_top
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_Walking
	jp SetState_Idling

DoHardLand:
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
	jp nz, CrouchOrSlide

	play_sfx SFX_LAND
	ld a, WST_LANDING
	ld [wWarioState], a
	ld a, BANK(OAM_15955)
	ld [wOAMBank], a
	ld a, HIGH(OAM_15955)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_15955)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1c5e3
	ld a, HIGH(Frameset_15f9a)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f9a)
	ld [wFramesetPtr + 1], a
	jr .asm_1c5ed
.asm_1c5e3
	ld a, HIGH(Frameset_15fa1)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15fa1)
	ld [wFramesetPtr + 1], a
.asm_1c5ed
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

DoWarioGroundShake:
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
	ld a, BANK(WarioAirborneGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioAirborneGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioAirborneGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, HIGH(OAM_15955)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_15955)
	ld [wOAMPtr + 1], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1c650
	ld a, HIGH(Frameset_15fb8)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15fb8)
	ld [wFramesetPtr + 1], a
	jr .asm_1c65a
.asm_1c650
	ld a, HIGH(Frameset_15fc5)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15fc5)
	ld [wFramesetPtr + 1], a
.asm_1c65a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	jr SetState_SmashAttacking

DoGroundPound:
	play_sfx SFX_GROUND_POUND
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, BANK(WarioAirborneGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioAirborneGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioAirborneGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, HIGH(OAM_15955)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_15955)
	ld [wOAMPtr + 1], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1c6a8
	ld a, HIGH(Frameset_15ff2)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15ff2)
	ld [wFramesetPtr + 1], a
	jr .asm_1c6b2
.asm_1c6a8
	ld a, HIGH(Frameset_16009)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16009)
	ld [wFramesetPtr + 1], a
.asm_1c6b2
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
;	fallthrough

SetState_SmashAttacking:
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

UpdateState_Landing:
	ld a, [wJoypadPressed]
	and D_RIGHT | D_LEFT
	jr nz, .walk
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
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
	jp nz, CrouchOrSlide
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

SetState_CrouchSliding:
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

	ld a, BANK(WarioWalkGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioWalkGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioWalkGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1426c)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1426c)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1426c)
	ld [wOAMPtr + 1], a
	ld a, [wDirection]
	cp DIRECTION_RIGHT
	jr z, .dir_right
; dir left
	ld a, HIGH(Frameset_14a38)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a38)
	ld [wFramesetPtr + 1], a
.asm_1c7a7
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret
.dir_right
	ld a, HIGH(Frameset_14a3b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a3b)
	ld [wFramesetPtr + 1], a
	jr .asm_1c7a7

UpdateState_CrouchSliding:
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
	ld a, [wSlopeInteraction]
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
	jp CrouchOrSlide

UpdateState_Attacking:
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
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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

DoBumpWithBigBackOffset:
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

DoBumpWithSmallBackOffset:
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

DoBumpOrJumpingBump:
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

DoJumpingBump:
	play_sfx SFX_BUMP
;	fallthrough

DoJumpingBump_NoSFX:
	ld a, 10
	ld [wJumpVelIndex], a
;	fallthrough

SetState_Bumping:
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
	ld a, HIGH(Frameset_15219)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15219)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	jr .asm_1cabe
.asm_1caa4
	ld a, HIGH(Frameset_15216)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15216)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
.asm_1cabd
	ret
.asm_1cabe
	ret

.asm_1cabf
	xor a
	ld [wIsRolling], a
	ld a, BANK(WarioAirborneGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioAirborneGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioAirborneGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_15955)
	ld [wOAMBank], a
	ld a, HIGH(OAM_15955)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_15955)
	ld [wOAMPtr + 1], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1caf9
	call .asm_1cabe
	ld a, HIGH(Frameset_15f7f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f7f)
	ld [wFramesetPtr + 1], a
	jr .asm_1cb06
.asm_1caf9
	call .asm_1cabd
	ld a, HIGH(Frameset_15f70)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f70)
	ld [wFramesetPtr + 1], a
.asm_1cb06
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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

StartFallingAirborneAttack:
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	jr SetState_AttackingAirborne

StartJumpingAirborneAttack:
	xor a
	ld [wJumpVelIndex], a
	ld a, TRUE
	ld [wJumpingUpwards], a
SetState_AttackingAirborne:
	xor a
	ld [wSlopeInteraction], a
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
	ld a, HIGH(Frameset_15216)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15216)
	ld [wFramesetPtr + 1], a
	jr .asm_1cba1
.asm_1cb79
	ld a, HIGH(Frameset_15219)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15219)
	ld [wFramesetPtr + 1], a
	jr .asm_1cba1
.asm_1cb85
	ld a, [wDirection]
	and a
	jr nz, .asm_1cb97
	ld a, HIGH(Frameset_1523e)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1523e)
	ld [wFramesetPtr + 1], a
	jr .asm_1cba1
.asm_1cb97
	ld a, HIGH(Frameset_15249)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15249)
	ld [wFramesetPtr + 1], a
.asm_1cba1
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wIsOnSteppableObject]
	and a
	ret z
	call UpdateState_AttackingAirborne ; can be fallthrough
	ret

UpdateState_AttackingAirborne:
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
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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

UpdateState_Bumping:
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

DiveFromSurface:
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

DiveFromSurface_SkipSplash:
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, BANK(OAM_15254)
	ld [wOAMBank], a
	ld a, HIGH(OAM_15254)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_15254)
	ld [wOAMPtr + 1], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1cda9
	ld a, HIGH(Frameset_155a0)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_155a0)
	ld [wFramesetPtr + 1], a
	jr .asm_1cdb3
.asm_1cda9
	ld a, HIGH(Frameset_155a3)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_155a3)
	ld [wFramesetPtr + 1], a
.asm_1cdb3
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	jr SetState_Diving

StartDive:
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1cddd
	ld a, HIGH(Frameset_15569)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15569)
	ld [wFramesetPtr + 1], a
	jr .asm_1cde7
.asm_1cddd
	ld a, HIGH(Frameset_15573)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15573)
	ld [wFramesetPtr + 1], a
.asm_1cde7
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
;	fallthrough

SetState_Diving:
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
	ld a, BANK(WarioSwimGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioSwimGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioSwimGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ret

UpdateState_Diving:
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

SetState_Submerged:
	ld a, WST_SUBMERGED
	ld [wWarioState], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wSwimVelIndex], a
	ld [wc0e0], a
	ld [wSwimmingDirectionInput], a

	ld a, BANK(WarioSwimGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioSwimGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioSwimGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_15254)
	ld [wOAMBank], a
	ld a, HIGH(OAM_15254)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_15254)
	ld [wOAMPtr + 1], a

	ld a, [wPowerUpLevel]
	cp SWIMMING_FLIPPERS
	jr c, .cannot_swim_underwater
	ld a, [wWaterInteraction]
	cp NON_SUBMERSIBLE_WATER
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
	ld a, HIGH(Frameset_15576)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15576)
	ld [wFramesetPtr + 1], a
	jr .asm_1cf10
.asm_1cf06
	ld a, HIGH(Frameset_1558b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1558b)
	ld [wFramesetPtr + 1], a
.asm_1cf10
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

.cannot_swim_underwater
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1cf39
	ld a, HIGH(Frameset_155a0)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_155a0)
	ld [wFramesetPtr + 1], a
	jr .asm_1cf43
.asm_1cf39
	ld a, HIGH(Frameset_155a3)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_155a3)
	ld [wFramesetPtr + 1], a
.asm_1cf43
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_Submerged:
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

SurfaceFromUnderwater:
	xor a
	ld [wSFXLoopCounter], a
	ld [wWaterSurfaceFloatingCounter], a
	ld a, BANK(WarioSwimGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioSwimGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioSwimGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_15254)
	ld [wOAMBank], a
	ld a, HIGH(OAM_15254)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_15254)
	ld [wOAMPtr + 1], a
;	fallthrough

SetState_WaterSurfaceIdling:
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
	ld a, SUBMERSIBLE_WATER
	ld [wWaterInteraction], a

.asm_1cfdc
	ld a, [wDirection]
	and a
	jr nz, .asm_1cfee
	ld a, HIGH(Frameset_15554)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15554)
	ld [wFramesetPtr + 1], a
	jr .asm_1cff8
.asm_1cfee
	ld a, HIGH(Frameset_1555b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1555b)
	ld [wFramesetPtr + 1], a
.asm_1cff8
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_WaterSurfaceIdling:
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
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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

SetState_WaterSurfaceMoving:
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
	ld a, HIGH(Frameset_15554)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15554)
	ld [wFramesetPtr + 1], a
	jr .asm_1d0aa
.asm_1d0a0
	ld a, HIGH(Frameset_1555b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1555b)
	ld [wFramesetPtr + 1], a
.asm_1d0aa
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_WaterSurfaceMoving:
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
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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
	ld a, HIGH(Frameset_1555b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1555b)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
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
	ld a, HIGH(Frameset_15554)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15554)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
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

HandleWaterSurfaceFloatingMovement:
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

StartUpwardsUnderwaterThrusting:
	ld a, D_UP
	ld [wSwimmingDirectionInput], a
	jr SetState_UnderwaterThrusting

StartUnderwaterThrusting:
	ld a, [wJoypadDown]
	and D_PAD
	ld [wSwimmingDirectionInput], a
;	fallthrough

SetState_UnderwaterThrusting:
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
	ld a, HIGH(Frameset_15562)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15562)
	ld [wFramesetPtr + 1], a
	jr .asm_1d272
.asm_1d244
	ld a, HIGH(Frameset_155be)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_155be)
	ld [wFramesetPtr + 1], a
	jr .asm_1d272
.thrust_right
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	ld a, [wPowerUpLevel]
	cp PRINCE_FROGS_GLOVES
	jr c, .asm_1d268
	ld a, HIGH(Frameset_1556c)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1556c)
	ld [wFramesetPtr + 1], a
	jr .asm_1d272
.asm_1d268
	ld a, HIGH(Frameset_155c5)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_155c5)
	ld [wFramesetPtr + 1], a
.asm_1d272
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
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

UpdateState_UnderwaterThrusting:
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
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	call HandleUnderwaterThrustingInput
	ld a, [wWarioState]
	cp WST_UNDERWATER_THRUSTING
	ret nz ; not underwater thrusting anymore

	call ApplyWaterCurrentMovement
	ret

SetState_SwimKnockBack_SwitchDirection:
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
;	fallthrough

SetState_SwimKnockBack:
	play_sfx SFX_BUMP
	ld a, WST_SWIM_KNOCK_BACK
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wSwimVelIndex], a
	ld [wSwimmingDirectionInput], a
	ld [wc0e0], a
	ld a, BANK(WarioSwimGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioSwimGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioSwimGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1d33a
	ld a, HIGH(Frameset_15573)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15573)
	ld [wFramesetPtr + 1], a
	jr .asm_1d344
.asm_1d33a
	ld a, HIGH(Frameset_15569)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15569)
	ld [wFramesetPtr + 1], a
.asm_1d344
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_SwimKnockBack:
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

UpdateState_WaterStung:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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

SetState_TryingSubmerge:
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
	ld a, HIGH(Frameset_155b0)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_155b0)
	ld [wFramesetPtr + 1], a
	jr .asm_1d445
.asm_1d43b
	ld a, HIGH(Frameset_155b7)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_155b7)
	ld [wFramesetPtr + 1], a
.asm_1d445
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_TryingSubmerge:
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jp z, SetState_WaterSurfaceIdling
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_Crouching:
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

UpdateState_CrouchWalking:
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 21
	ld [wSFXLoopCounter], a
	play_sfx SFX_CROUCH_WALK
.skip_sfx
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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
	ld a, [wSlopeInteraction]
	and a
	jr nz, .asm_1d51f
	ret
.asm_1d51f
	jp SetState_Sliding

UpdateState_CrouchAirborne:
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
	ld a, HIGH(Frameset_14a38)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a38)
	ld [wFramesetPtr + 1], a
	jr .asm_1d5ba
.asm_1d5b0
	ld a, HIGH(Frameset_14a3b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a3b)
	ld [wFramesetPtr + 1], a
.asm_1d5ba
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
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
	jp CrouchOrSlide

UpdateState_Stung:
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
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
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

UpdateState_StungRecovery:
	call Func_1f6c2
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
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
	jp CrouchOrSlide

UpdateState_PipeGoingDown:
	ld a, TRUE
	ld [wIsIntangible], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
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
	ld a, [wWarioXPos + 1]
	sub $08
	ld [wWarioXPos + 1], a
	xor a
	ld [wIsIntangible], a
	jp SetState_Idling

.asm_1d7f9
	call ClearTransformationValues
	ld hl, wRoomTransitionParam
	res ROOMTRANSITIONF_3_F, [hl]
	jp TriggerRoomTransition
.asm_1d804
	play_sfx SFX_0E1
	ret

UpdateState_PipeGoingUp:
	ld a, TRUE
	ld [wIsIntangible], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
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
	ld a, [wWarioXPos + 1]
	sub $08
	ld [wWarioXPos + 1], a
	xor a
	ld [wIsIntangible], a
	call UpdateFloor
	jp SetState_Idling

.asm_1d848
	call ClearTransformationValues
	ld hl, wRoomTransitionParam
	res ROOMTRANSITIONF_3_F, [hl]
	jp TriggerRoomTransition
.asm_1d853
	play_sfx SFX_0E1
	ret

UpdateState_EnemyBumping:
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
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
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
	ld de, wWarioPos
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	jp DoSoftLand

UpdateState_SmashAttacking:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $1b
	ret c
	xor a ; FALSE
	ld [wIsSmashAttacking], a
	jp SetState_Idling

UpdateState_PickingUp:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, Func_1dd78
	ld a, [wGrabState]
	and a
	jp z, SetState_Idling
	and $0f
	cp $02
	jp z, SetState_GrabIdling
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	jp SetState_GrabIdling

UpdateState_GrabIdling:
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

UpdateState_GrabWalking:
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
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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

SetState_ThrowingAirborne:
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
	ld a, HIGH(Frameset_15fae)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15fae)
	ld [wFramesetPtr + 1], a
.asm_1da33
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret
.asm_1da43
	ld a, HIGH(Frameset_15fb3)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15fb3)
	ld [wFramesetPtr + 1], a
	jr .asm_1da33

UpdateState_GrabAirborne:
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
	ld a, HIGH(Frameset_15fa8)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15fa8)
	ld [wFramesetPtr + 1], a
	jr .asm_1db49
.asm_1db01
	ld a, HIGH(Frameset_15fab)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15fab)
	ld [wFramesetPtr + 1], a
	jr .asm_1db49

.asm_1db0d
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jr nc, .asm_1db20
	ld a, HIGH(Frameset_15fec)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15fec)
	ld [wFramesetPtr + 1], a
	jr .asm_1db49
.asm_1db20
	ld a, HIGH(Frameset_1605c)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1605c)
	ld [wFramesetPtr + 1], a
	jr .asm_1db49
.asm_1db2c
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jr nc, .asm_1db3f
	ld a, HIGH(Frameset_15fef)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15fef)
	ld [wFramesetPtr + 1], a
	jr .asm_1db49
.asm_1db3f
	ld a, HIGH(Frameset_16063)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16063)
	ld [wFramesetPtr + 1], a
.asm_1db49
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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
	ld a, HIGH(Frameset_15fd2)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15fd2)
	ld [wFramesetPtr + 1], a
	jr .asm_1dc14
.asm_1dc0a
	ld a, HIGH(Frameset_15fdf)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15fdf)
	ld [wFramesetPtr + 1], a
.asm_1dc14
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	jr .asm_1dc5f

.asm_1dc25
	play_sfx SFX_GROUND_POUND
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1dc46
	ld a, HIGH(Frameset_16020)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16020)
	ld [wFramesetPtr + 1], a
	jr .asm_1dc50
.asm_1dc46
	ld a, HIGH(Frameset_16037)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16037)
	ld [wFramesetPtr + 1], a
.asm_1dc50
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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

SetState_ThrowCharging:
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
	ld a, BANK(WarioThrowGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioThrowGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioThrowGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1606a)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1606a)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1606a)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1dce2
	ld a, HIGH(Frameset_1642c)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1642c)
	ld [wFramesetPtr + 1], a
	jr .asm_1dcec
.asm_1dce2
	ld a, HIGH(Frameset_1642f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1642f)
	ld [wFramesetPtr + 1], a
.asm_1dcec
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_ThrowCharging:
	ld a, [wGrabState]
	and a
	jp z, SetState_Idling
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jp z, Func_1de3f
	bit A_BUTTON_F, a
	jp nz, Func_1dd78
	bit D_DOWN_F, a
	jp nz, CrouchOrSlide

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
	ld a, HIGH(Frameset_16432)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16432)
	ld [wFramesetPtr + 1], a
	jr .asm_1dd68
.asm_1dd5e
	ld a, HIGH(Frameset_16435)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16435)
	ld [wFramesetPtr + 1], a
.asm_1dd68
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

Func_1dd78:
	xor a
	ld [wGrabState], a
	jp StartJump_FromInput

UpdateState_ThrowFullyCharged:
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
	ld a, HIGH(Frameset_16438)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16438)
	ld [wFramesetPtr + 1], a
	jr .asm_1dde0
.asm_1ddd6
	ld a, HIGH(Frameset_16441)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16441)
	ld [wFramesetPtr + 1], a
.asm_1dde0
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jr z, .asm_1de01
	bit A_BUTTON_F, a
	jp nz, Func_1dd78
	bit D_DOWN_F, a
	jp nz, CrouchOrSlide
	ret

.asm_1de01
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1de1a
	ld a, HIGH(Frameset_16403)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16403)
	ld [wFramesetPtr + 1], a
	jr .asm_1de24
.asm_1de1a
	ld a, HIGH(Frameset_16423)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16423)
	ld [wFramesetPtr + 1], a
.asm_1de24
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wGrabState]
	and GRAB_FLAGS_MASK
	add GRAB_THROW | (1 << GRAB_FULL_CHARGE_F)
	ld [wGrabState], a
	jr SetState_Throwing

Func_1de3f:
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1de58
	ld a, HIGH(Frameset_163fe)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_163fe)
	ld [wFramesetPtr + 1], a
	jr .asm_1de62
.asm_1de58
	ld a, HIGH(Frameset_1641e)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1641e)
	ld [wFramesetPtr + 1], a
.asm_1de62
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wGrabState]
	and GRAB_FLAGS_MASK
	add GRAB_THROW
	ld [wGrabState], a
;	fallthrough

SetState_Throwing:
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, WST_THROWING
	ld [wWarioState], a
	ret

UpdateState_Throwing:
	ld a, [wGrabState]
	and a
	jp z, SetState_Idling
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	xor a
	ld [wGrabState], a
	jp SetState_Idling

UpdateState_ThrowingAirborne:
	ld a, [wGrabState]
	and a
	jp z, StartFall
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	xor a
	ld [wGrabState], a
	jp StartFall

UpdateState_GrabSmashAttacking:
	ld a, [wGrabState]
	and a
	jp z, SetState_Idling
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $1b
	ret c
	xor a ; FALSE
	ld [wIsSmashAttacking], a
	jp SetState_GrabIdling

SetState_Sliding:
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
	ld a, BANK(WarioSlideGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioSlideGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioSlideGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1644a)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1644a)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1644a)
	ld [wOAMPtr + 1], a
	ld a, [wSlopeInteraction]
	bit LEFT_SLOPE_F, a
	jr nz, .asm_1df8b
	ld hl, wWarioXPos + 1
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
	ld a, HIGH(Frameset_16708)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16708)
	ld [wFramesetPtr + 1], a
	jr .asm_1dfc4

.asm_1df8b
	ld hl, wWarioXPos + 1
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
	ld a, HIGH(Frameset_1671d)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1671d)
	ld [wFramesetPtr + 1], a
.asm_1dfc4
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_Sliding:
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 12
	ld [wSFXLoopCounter], a
	play_sfx SFX_ZIP_LINE_SLIDE
.skip_sfx
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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

SetState_Rolling:
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
	ld a, HIGH(Frameset_166e6)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_166e6)
	ld [wFramesetPtr + 1], a
	jr .asm_1e08d
.asm_1e083
	ld a, HIGH(Frameset_166f7)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_166f7)
	ld [wFramesetPtr + 1], a
.asm_1e08d
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_Rolling:
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
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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

	ld a, [wSlopeInteraction]
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
	ld a, [wSlopeInteraction]
	and a
	jp z, Func_1e1e3
	and $0f
	dec a
	ld b, a
	ld a, [wDirection]
	xor b
	jp nz, DoBumpWithSmallBackOffset
	jp Func_1e1e3

Func_1e174:
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
;	fallthrough

SetState_RollingAirborne:
	xor a
	ld [wSlopeInteraction], a
	ld [wGrabState], a
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a
	ld a, WST_ROLLING_AIRBORNE
	ld [wWarioState], a
	ld a, $02
	ld [wIsRolling], a
	ld a, BANK(WarioSlideGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioSlideGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioSlideGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1644a)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1644a)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1644a)
	ld [wOAMPtr + 1], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1e1c9
	ld a, HIGH(Frameset_166e6)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_166e6)
	ld [wFramesetPtr + 1], a
	jr .asm_1e1d3
.asm_1e1c9
	ld a, HIGH(Frameset_166f7)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_166f7)
	ld [wFramesetPtr + 1], a
.asm_1e1d3
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

Func_1e1e3:
	xor a
	ld [wJumpVelIndex], a
	jr SetState_RollingAirborne

UpdateState_RollingAirborne:
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
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
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

UpdateState_PickedUp:
	ld a, [wDirection]
	and a
	jr nz, .dir_right

; dir left
	ld a, [wJoypadPressed]
	and A_BUTTON | B_BUTTON | D_RIGHT
	jr nz, .wiggle_right

.asm_1e2d2
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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
	ld a, HIGH(Frameset_15f7f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f7f)
	ld [wFramesetPtr + 1], a
.wiggle_left
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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
	ld a, HIGH(Frameset_15f70)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f70)
	ld [wFramesetPtr + 1], a
	jr .wiggle_left

UpdateState_GroundShakeStunned:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
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
	jp CrouchOrSlide
.asm_1e3d1
	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, StartFall
	jp SetState_Idling

UpdateState_EnteringDoor:
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 36
	ld [wSFXLoopCounter], a
	play_sfx SFX_WALK
.skip_sfx
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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
	ld a, HIGH(Frameset_14d15)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14d15)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
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
	res ROOMTRANSITIONF_3_F, [hl]
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

ApplyWaterCurrentMovement:
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

; water currents have a "lingering" effect
; this routine applies the movements and
; decreases the counter for the duration of the effect
ApplyLastWaterCurrentMovement:
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

HandleInput_Idling:
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

SetState_Walking_ResetWalkVel:
	xor a
	ld [wWalkVelIndex], a
;	fallthrough

SetState_Walking:
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

Func_1e6ea:
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, BANK(WarioWalkGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioWalkGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioWalkGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1426c)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1426c)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1426c)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .dir_right
; dir_left
	ld a, HIGH(Frameset_149b4)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_149b4)
	ld [wFramesetPtr + 1], a
	jr .got_frameset
.dir_right
	ld a, HIGH(Frameset_149c5)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_149c5)
	ld [wFramesetPtr + 1], a
.got_frameset
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

SetState_Turning:
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
	ld a, BANK(WarioIdleGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioIdleGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioIdleGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_14a82)
	ld [wOAMBank], a
	ld a, HIGH(OAM_14a82)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_14a82)
	ld [wOAMPtr + 1], a
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	and a
	jr nz, .asm_1e791
	ld a, HIGH(Frameset_14cbe)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14cbe)
	ld [wFramesetPtr + 1], a
	jr .asm_1e79b
.asm_1e791
	ld a, HIGH(Frameset_14cc5)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14cc5)
	ld [wFramesetPtr + 1], a
.asm_1e79b
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

SetState_Attacking:
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

	ld a, BANK(OAM_14d1b)
	ld [wOAMBank], a
	ld a, HIGH(OAM_14d1b)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_14d1b)
	ld [wOAMPtr + 1], a
	ld a, BANK(WarioAttackGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioAttackGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioAttackGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx

	ld a, [wPowerUpLevel]
	cp GARLIC
	jr nc, .asm_1e829
	ld a, [wDirection]
	and a
	jr nz, .asm_1e81d
	ld a, HIGH(Frameset_151e4)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_151e4)
	ld [wFramesetPtr + 1], a
	jr .asm_1e845
.asm_1e81d
	ld a, HIGH(Frameset_151fd)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_151fd)
	ld [wFramesetPtr + 1], a
	jr .asm_1e845
.asm_1e829
	ld a, [wDirection]
	and a
	jr nz, .asm_1e83b
	ld a, HIGH(Frameset_1521c)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1521c)
	ld [wFramesetPtr + 1], a
	jr .asm_1e845
.asm_1e83b
	ld a, HIGH(Frameset_1522d)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1522d)
	ld [wFramesetPtr + 1], a
.asm_1e845
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

CrouchOrSlide:
	ld a, [wSlopeInteraction]
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

	ld a, BANK(WarioWalkGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioWalkGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioWalkGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1426c)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1426c)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1426c)
	ld [wOAMPtr + 1], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_1e8d3
	ld a, HIGH(Frameset_14a38)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a38)
	ld [wFramesetPtr + 1], a
	jr .asm_1e8dd
.asm_1e8d3
	ld a, HIGH(Frameset_14a3b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a3b)
	ld [wFramesetPtr + 1], a
.asm_1e8dd
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

HandleInput_Walking:
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
	jp z, CrouchOrSlide
	farcall SetState_CrouchSlipping
	ret

SetState_Idling::
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
	jp nz, CrouchOrSlide
	ld a, BANK(WarioIdleGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioIdleGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioIdleGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_14000)
	ld [wOAMBank], a
	ld a, HIGH(OAM_14000)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_14000)
	ld [wOAMPtr + 1], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1ea24
	ld a, HIGH(Frameset_14252)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14252)
	ld [wFramesetPtr + 1], a
	jr .asm_1ea2e
.asm_1ea24
	ld a, HIGH(Frameset_1425f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1425f)
	ld [wFramesetPtr + 1], a
.asm_1ea2e
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

HandleInput_Attacking:
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

HandleAttackingAirborneMovement:
	call ApplyJumpVelocity
	farcall HandleWalk
	ld a, [wWalkVelIndex]
	cp $14
	jr c, .done
	ld a, $10
	ld [wWalkVelIndex], a
.done
	ret

HandleBumpMovement:
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

Func_1eb46:
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

SetState_CrouchWalking:
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

	ld a, BANK(OAM_1426c)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1426c)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1426c)
	ld [wOAMPtr + 1], a
	ld a, BANK(WarioWalkGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioWalkGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioWalkGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, [wDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_1ec0d
	ld a, HIGH(Frameset_14a26)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a26)
	ld [wFramesetPtr + 1], a
.asm_1ebfd
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret
.asm_1ec0d
	ld a, HIGH(Frameset_14a2f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a2f)
	ld [wFramesetPtr + 1], a
	jr .asm_1ebfd

Func_1ec19:
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

Func_1ec4b:
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

Func_1ec6c:
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
	jp CrouchOrSlide

.asm_1ecb0
	ld a, [wDirection]
	and a
	jr nz, .asm_1eccc
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, HIGH(Frameset_14a2f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a2f)
	ld [wFramesetPtr + 1], a
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
	ld a, HIGH(Frameset_14a26)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a26)
	ld [wFramesetPtr + 1], a
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

StartCrouchFall:
	xor a
	ld [wWalkVelIndex], a
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	jr SetState_CrouchAirborne

StartCrouchJump:
	play_sfx SFX_JUMP
	xor a
	ld [wJumpVelIndex], a
;	fallthrough

SetState_CrouchAirborne:
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
	ld a, BANK(WarioWalkGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioWalkGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioWalkGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1426c)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1426c)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1426c)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1edaf
	ld a, HIGH(Frameset_14a38)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a38)
	ld [wFramesetPtr + 1], a
	jr .asm_1edb9
.asm_1edaf
	ld a, HIGH(Frameset_14a3b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a3b)
	ld [wFramesetPtr + 1], a
.asm_1edb9
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wIsOnSteppableObject]
	and a
	ret z
	ld b, $02
	call SubYOffset
	ret

Func_1edd3:
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

Func_1ede9:
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

SetState_GrabAirborne:
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
	ld a, BANK(WarioAirborneGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioAirborneGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioAirborneGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_15955)
	ld [wOAMBank], a
	ld a, HIGH(OAM_15955)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_15955)
	ld [wOAMPtr + 1], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1ee66
	ld a, HIGH(Frameset_15fa8)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15fa8)
	ld [wFramesetPtr + 1], a
	jr .asm_1ee70
.asm_1ee66
	ld a, HIGH(Frameset_15fab)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15fab)
	ld [wFramesetPtr + 1], a
.asm_1ee70
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wIsOnSteppableObject]
	and a
	ret z
	call UpdateState_GrabAirborne
	ret

Func_1ee88:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, Func_1ede9
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jp nz, SetState_ThrowCharging
	bit D_DOWN_F, a
	jp nz, CrouchOrSlide
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
	ld a, HIGH(Frameset_149fe)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_149fe)
	ld [wFramesetPtr + 1], a
.asm_1eedb
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret
.asm_1eeeb
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	ld a, HIGH(Frameset_14a0f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a0f)
	ld [wFramesetPtr + 1], a
	jr .asm_1eedb

Func_1eefc:
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
	ld a, [wSlopeInteraction]
	and a
	jr z, .asm_1ef8d
	bit RIGHT_SLOPE_F, a
	jr z, .asm_1ef8d
	jr .asm_1efc5

.asm_1ef7b
	call ApplyWalkVelocity_Left
	call SubXOffset
	ld a, [wSlopeInteraction]
	and a
	jr z, .asm_1ef8d
	bit RIGHT_SLOPE_F, a
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
	jp z, CrouchOrSlide
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

SetState_GrabIdling:
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
	ld a, BANK(WarioWalkGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioWalkGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioWalkGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1426c)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1426c)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1426c)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1f05d
	ld a, HIGH(Frameset_14a20)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a20)
	ld [wFramesetPtr + 1], a
	jr .asm_1f067
.asm_1f05d
	ld a, HIGH(Frameset_14a23)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a23)
	ld [wFramesetPtr + 1], a
.asm_1f067
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

HandleInput_Airborne:
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

WalkRight:
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

WalkLeft:
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

WalkIfPossible_Right:
	farcall CheckFrontCollision
	ld a, b
	and $0f
	ret nz
	call ApplyWalkVelocity_Right
	call AddXOffset
	ret

WalkIfPossible_Left:
	farcall CheckFrontCollision
	ld a, b
	and $0f
	ret nz
	call ApplyWalkVelocity_Left
	call SubXOffset
	ret

HandleDivingHorizontalMovement:
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

Func_1f1a9:
	ld a, [wWaterInteraction]
	cp NON_SUBMERSIBLE_WATER
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
	ld a, HIGH(Frameset_15569)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15569)
	ld [wFramesetPtr + 1], a
	jr .asm_1f1f5
.asm_1f1eb
	ld a, HIGH(Frameset_15573)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15573)
	ld [wFramesetPtr + 1], a
.asm_1f1f5
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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

Func_1f24c:
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
	ld a, HIGH(Frameset_15576)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15576)
	ld [wFramesetPtr + 1], a
	jr .asm_1f28f
.asm_1f285
	ld a, HIGH(Frameset_1558b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1558b)
	ld [wFramesetPtr + 1], a
.asm_1f28f
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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
	ld a, HIGH(Frameset_1558b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1558b)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

Func_1f310:
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

Func_1f357:
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
	ld a, HIGH(Frameset_15576)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15576)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

Func_1f3a7:
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

Func_1f3d9:
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

HandleWaterSurfaceInput:
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
	cp NON_SUBMERSIBLE_WATER
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
	cp NON_SUBMERSIBLE_WATER
	jp z, SetState_TryingSubmerge
	jp SetState_Submerged

HandleUnderwaterThrustingInput:
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

HandleInvincibility:
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

Func_1f6c2:
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

HandleGroundShake:
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

	ld a, BANK(WarioAirborneGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioAirborneGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioAirborneGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_15955)
	ld [wOAMBank], a
	ld a, HIGH(OAM_15955)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_15955)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1f7cc
	ld a, HIGH(Frameset_15f70)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f70)
	ld [wFramesetPtr + 1], a
	jr .asm_1f7d6
.asm_1f7cc
	ld a, HIGH(Frameset_15f7f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f7f)
	ld [wFramesetPtr + 1], a
.asm_1f7d6
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

SetState_LadderShakeStunned:
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
	ld a, HIGH(Frameset_15948)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15948)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

Func_1f825:
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

Func_1f863:
	ld hl, SwimStraightVelTable
	add hl, de
	ld b, [hl]
	call SubYOffset
	ret

SwimStraightVelTable:
	db $01, $01, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00

Data_1f894:
	db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00

SwimDiagonalVelTable:
	db $01, $01, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00
