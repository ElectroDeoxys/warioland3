UpdateWarioStates_Group4:
	ld a, [wWarioState]
	sub $b0
	jumptable

	dw UpdateState_IceSkatinStart    ; WST_ICE_SKATIN_START
	dw UpdateState_IceSkatin         ; WST_ICE_SKATIN
	dw UpdateState_IceSkatinAirborne ; WST_ICE_SKATIN_AIRBORNE
	dw UpdateState_IceSkatinCrash    ; WST_ICE_SKATIN_CRASH
	dw InvalidWarioStateReset        ; WST_UNUSED_B4
	dw InvalidWarioStateReset        ; WST_UNUSED_B5
	dw InvalidWarioStateReset        ; WST_UNUSED_B6
	dw InvalidWarioStateReset        ; WST_UNUSED_B7
	dw UpdateState_GrabbingOwl       ; WST_GRABBING_OWL
	dw UpdateState_OwlSlow           ; WST_OWL_SLOW
	dw UpdateState_OwlFast           ; WST_OWL_FAST
	dw UpdateState_ReleasingOwl      ; WST_RELEASING_OWL
	dw UpdateState_FallingFromOwl    ; WST_FALLING_FROM_OWL
	dw InvalidWarioStateReset        ; WST_UNUSED_BD
	dw InvalidWarioStateReset        ; WST_UNUSED_BE
	dw InvalidWarioStateReset        ; WST_UNUSED_BF
	dw UpdateState_HangingRail       ; WST_HANGING_RAIL
	dw InvalidWarioStateReset        ; WST_UNUSED_C1
	dw InvalidWarioStateReset        ; WST_UNUSED_C2
	dw InvalidWarioStateReset        ; WST_UNUSED_C3
	dw UpdateState_SnowmanStart      ; WST_SNOWMAN_START
	dw UpdateState_SnowmanIdle       ; WST_SNOWMAN_IDLE
	dw UpdateState_SnowmanWalking    ; WST_SNOWMAN_WALKING
	dw UpdateState_SnowmanTurning    ; WST_SNOWMAN_TURNING
	dw UpdateState_SnowmanAirborne   ; WST_SNOWMAN_AIRBORNE
	dw UpdateState_SnowmanLanding    ; WST_SNOWMAN_LANDING
	dw UpdateState_SnowmanBumped     ; WST_SNOWMAN_BUMPED
	dw UpdateState_SnowballRolling   ; WST_SNOWBALL_ROLLING
	dw UpdateState_SnowballAirborne  ; WST_SNOWBALL_AIRBORNE
	dw UpdateState_SnowballCrash     ; WST_SNOWBALL_CRASH
	dw InvalidWarioStateReset        ; WST_UNUSED_CE
	dw InvalidWarioStateReset        ; WST_UNUSED_CF
	dw UpdateState_SplitHit          ; WST_SPLIT_HIT
	dw UpdateState_SplitKnockedBack  ; WST_SPLIT_KNOCKED_BACK
	dw UpdateState_Splitting         ; WST_SPLITTING
	dw UpdateState_SplittingAirborne ; WST_SPLITTING_AIRBORNE
	dw UpdateState_FanStart          ; WST_FAN_START
	dw UpdateStart_FanLifting        ; WST_FAN_LIFTING
	dw UpdateStart_FanTurning        ; WST_FAN_TURNING
	dw UpdateState_FanSpinning       ; WST_FAN_SPINNING
	dw UpdateStart_FanRecovering     ; WST_FAN_RECOVERING
	dw InvalidWarioStateReset        ; WST_UNUSED_D9
	dw InvalidWarioStateReset        ; WST_UNUSED_DA
	dw InvalidWarioStateReset        ; WST_UNUSED_DB
	dw UpdateState_BlindIdling       ; WST_BLIND_IDLING
	dw UpdateState_BlindWalking      ; WST_BLIND_WALKING
	dw UpdateState_BlindTurning      ; WST_BLIND_TURNING
	dw UpdateState_BlindAirborne     ; WST_BLIND_AIRBORNE
	dw UpdateState_Swallowed         ; WST_SWALLOWED
	dw UpdateState_Launched          ; WST_LAUNCHED
	dw UpdateState_LaunchCrash       ; WST_LAUCH_CRASH
	dw InvalidWarioStateReset        ; WST_UNUSED_E3
	dw UpdateState_MagicRising       ; WST_MAGIC_RISING
	dw UpdateState_MagicStopping     ; WST_MAGIC_STOPPING
	dw UpdateState_MagicRecovering   ; WST_MAGIC_RECOVERING
	dw InvalidWarioStateReset        ; WST_UNUSED_E7
	dw UpdateState_BallStart         ; WST_BALL_START
	dw UpdateState_BallBouncing      ; WST_BALL_BOUNCING
	dw UpdateState_BallAirborne      ; WST_BALL_AIRBORNE
	dw UpdateState_BallShot          ; WST_BALL_SHOT
	dw UpdateState_BallThrown        ; WST_BALL_THROWN
	dw UpdateState_BallSentUpwards   ; WST_BALL_SENT_UPWARDS
	dw UpdateState_BallTurning       ; WST_BALL_TURNING
	dw InvalidWarioStateReset        ; WST_UNUSED_EF
	dw InvalidWarioStateReset        ; WST_UNUSED_F0
	dw InvalidWarioStateReset        ; WST_UNUSED_F1
	dw InvalidWarioStateReset        ; WST_UNUSED_F2

SetState_IceSkatinStart:
	ld a, WST_ICE_SKATIN_START
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
	ld [wInvisibleFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

	call UpdateLevelMusic

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld hl, Pals_c990
	call SetWarioPal
	load_gfx WarioBubbleGfx
	call LoadWarioGfx
	load_oam OAM_1fdb6d

	ld a, [wEnemyDirection]
	ld [wDirection], a
	and a
	jr nz, .asm_1ec10a
	load_frameset Frameset_1fdd8b
	jr .asm_1ec114
.asm_1ec10a
	load_frameset Frameset_1fdd82
.asm_1ec114
	update_anim_2
	ret

UpdateState_IceSkatinStart:
	update_anim_2
	ld a, [wAnimationEnded]
	and a
	ret z

	xor a
	ld [wWalkVelIndex], a
;	fallthrough

SetState_IceSkatin:
	ld a, WST_ICE_SKATIN
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1ec15d
	load_frameset Frameset_1fdd97
	jr .asm_1ec167
.asm_1ec15d
	load_frameset Frameset_1fdd94
.asm_1ec167
	update_anim_2
	ret

UpdateState_IceSkatin:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	farcall CheckFrontCollision
	ld a, b
	and a
	jr nz, Func_1ec215

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, $0c
	ld [wSFXLoopCounter], a
	play_sfx SFX_ZIP_LINE_SLIDE
.skip_sfx
	update_anim_2

	ld a, [wDirection]
	and a
	jr nz, .asm_1ec1d4
	call ApplyWalkVelocity_Left
	call SubXOffset
	jr .asm_1ec1da
.asm_1ec1d4
	call ApplyWalkVelocity_Right
	call AddXOffset
.asm_1ec1da
	ld a, [wWalkVelIndex]
	cp $14
	jr c, .asm_1ec1e6
	ld a, $10
	ld [wWalkVelIndex], a
.asm_1ec1e6
	farcall CheckCentreCollision
	ld a, b
	and a
	jr z, .asm_1ec205
	update_pos_y
	ret

.asm_1ec205
	ld a, WST_ICE_SKATIN_AIRBORNE
	ld [wWarioState], a
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a
	ret

Func_1ec215:
	ld a, [wDirection]
	and a
	jr nz, .asm_1ec223
	ld b, 3
	call AddXOffset
	jp SetState_IceSkatinCrash
.asm_1ec223
	ld b, 3
	call SubXOffset
	jp SetState_IceSkatinCrash

UpdateState_IceSkatinAirborne:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, SetState_IceSkatinCrash

	farcall CheckFrontCollision
	ld a, b
	and a
	jr nz, Func_1ec215
	update_anim_2
	call ApplyJumpVelocity
	farcall HandleWalk
	ld a, [wWalkVelIndex]
	cp $14
	jr c, .asm_1ec288
	ld a, $10
	ld [wWalkVelIndex], a
.asm_1ec288
	ld a, [wWarioState]
	cp WST_ICE_SKATIN_AIRBORNE
	ret nz ; done if not ice skatin airborne any more

	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_1ec2aa
	ld a, [wWarioState]
	cp WST_ICE_SKATIN_AIRBORNE
	ret nz ; done if not ice skatin airborne any more
	jp TriggerDownwardsFloorTransition

.asm_1ec2aa
	call TriggerFloorTransition
	ld a, [wWarioState]
	cp WST_ICE_SKATIN_AIRBORNE
	ret nz ; done if not ice skatin airborne any more

	ld a, $10
	ld [wWalkVelIndex], a
	jp SetState_IceSkatin

SetState_IceSkatinCrash:
	play_sfx SFX_02E

	ld a, WST_ICE_SKATIN_CRASH
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	and a
	jr nz, .asm_1ec2e6
	load_frameset Frameset_1fdda7
	jr .asm_1ec2f0
.asm_1ec2e6
	load_frameset Frameset_1fdd9a
.asm_1ec2f0
	update_anim_2
	ret

UpdateState_IceSkatinCrash:
	update_anim_2
	ld a, [wAnimationEnded]
	and a
	ret z
	get_pos
	ld b, PARTICLE_ICE
	farcall CreateParticle
	jp RecoverFromTransformation

UpdateState_GrabbingOwl:
	update_anim_2
	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, [wJoypadDown]
	and D_PAD
	jp nz, HandleWarioOwlInput
UpdateWarioOwlDirection:
	ld a, [wDirection]
	and a
	jr nz, .right
; left
	ld a, D_LEFT
	ld [wSwimmingDirectionInput], a
	jr SetState_OwlWario
.right
	ld a, D_RIGHT
	ld [wSwimmingDirectionInput], a
;	fallthrough

SetState_OwlWario:
	ld a, WST_OWL_SLOW
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wSwimmingDirectionInput]
	and D_UP | D_DOWN
	jr nz, .asm_1ec3b0
	ld a, [wDirection]
	and a
	jr nz, .asm_1ec396
	load_frameset Frameset_1fed7c
	jr .asm_1ec3a0
.asm_1ec396
	load_frameset Frameset_1fed91
.asm_1ec3a0
	update_anim_2
	ret
.asm_1ec3b0
	load_frameset Frameset_1fedd0
	jr .asm_1ec3a0

UpdateState_OwlSlow:
	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, Func_1ec64d
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, Func_1ec64d
	ld a, [wWarioState]
	cp WST_OWL_SLOW
	ret nz
	ld a, [wJoypadDown]
	and D_PAD
	jp nz, HandleWarioOwlInput
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .asm_1ec406
	ld a, $20
	ld [wSFXLoopCounter], a
	play_sfx SFX_071
.asm_1ec406
	update_anim_2
	ld a, [wSwimmingDirectionInput]
	bit D_RIGHT_F, a
	jr nz, .go_right
	bit D_UP_F, a
	jr nz, .go_up
	bit D_DOWN_F, a
	jr nz, .go_down

; go left
	farcall Func_197b1
	ld a, [wWarioState]
	cp WST_OWL_SLOW
	ret nz
	ld a, b
	and a
	jr nz, .asm_1ec443
	ld b, 1
	call SubXOffset
	ret
.asm_1ec443
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jp UpdateWarioOwlDirection

.go_right
	farcall Func_19741
	ld a, [wWarioState]
	cp WST_OWL_SLOW
	ret nz
	ld a, b
	and a
	jr nz, .asm_1ec46a
	ld b, 1
	call AddXOffset
	ret
.asm_1ec46a
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jp UpdateWarioOwlDirection

.go_up
	farcall CheckUpCollision
	ld a, [wWarioState]
	cp WST_OWL_SLOW
	ret nz
	ld a, b
	and a
	jr nz, .asm_1ec4b0
	ld b, 1
	call SubYOffset
	ret

.go_down
	farcall CheckCentreCollision
	ld a, [wWarioState]
	cp WST_OWL_SLOW
	ret nz
	ld a, b
	and a
	jr nz, .asm_1ec4b8
	ld b, 1
	call AddYOffset
	ret

.asm_1ec4b0
	ld a, D_DOWN
	ld [wSwimmingDirectionInput], a
	jp SetState_OwlWario

.asm_1ec4b8
	ld a, D_UP
	ld [wSwimmingDirectionInput], a
	jp SetState_OwlWario

HandleWarioOwlInput:
	ld a, WST_OWL_FAST
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr nz, .d_up
	bit D_DOWN_F, a
	jr nz, .d_down
	bit D_RIGHT_F, a
	jr nz, .d_right
; d_left
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	ld a, D_LEFT
	jr .asm_1ec4f0
.d_right
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	ld a, D_RIGHT
	jr .asm_1ec4f0
.d_up
	ld a, D_UP
	jr .asm_1ec4f0
.d_down
	ld a, D_DOWN
.asm_1ec4f0
	ld [wSwimmingDirectionInput], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wSwimmingDirectionInput]
	and D_UP | D_DOWN
	jr nz, .up_or_down
	ld a, [wDirection]
	and a
	jr nz, .asm_1ec51a
	load_frameset Frameset_1feda6
	jr .asm_1ec524
.asm_1ec51a
	load_frameset Frameset_1fedbb
.asm_1ec524
	update_anim_2
	ret
.up_or_down
	load_frameset Frameset_1fede5
	jr .asm_1ec524

UpdateState_OwlFast:
	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, Func_1ec64d
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, Func_1ec64d
	ld a, [wWarioState]
	cp WST_OWL_FAST
	ret nz
	ld a, [wJoypadDown]
	and D_PAD
	jp z, SetState_OwlWario
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .asm_1ec58a
	ld a, $10
	ld [wSFXLoopCounter], a
	play_sfx SFX_071
.asm_1ec58a
	update_anim_2
	ld a, [wSwimmingDirectionInput]
	bit D_RIGHT_F, a
	jr nz, .going_right
	bit D_UP_F, a
	jr nz, .going_up
	bit D_DOWN_F, a
	jr nz, .going_down

; going left
	ld a, [wJoypadDown]
	and D_LEFT
	jp z, HandleWarioOwlInput
	farcall Func_197b1
	ld a, [wWarioState]
	cp WST_OWL_FAST
	ret nz
	ld a, b
	and a
	ret nz
	ld b, 2
	call SubXOffset
	ret

.going_right
	ld a, [wJoypadDown]
	and D_RIGHT
	jp z, HandleWarioOwlInput
	farcall Func_19741
	ld a, [wWarioState]
	cp WST_OWL_FAST
	ret nz
	ld a, b
	and a
	ret nz
	ld b, 2
	call AddXOffset
	ret

.going_up
	ld a, [wJoypadDown]
	and D_UP
	jp z, HandleWarioOwlInput
	farcall CheckUpCollision
	ld a, [wWarioState]
	cp WST_OWL_FAST
	ret nz
	ld a, b
	and a
	ret nz
	ld b, 2
	call SubYOffset
	ret

.going_down
	ld a, [wJoypadDown]
	and D_DOWN
	jp z, HandleWarioOwlInput
	farcall CheckCentreCollision
	ld a, [wWarioState]
	cp WST_OWL_FAST
	ret nz
	ld a, b
	and a
	jr z, .asm_1ec647
	ld hl, hYPosHi
	ld de, wPos
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret
.asm_1ec647
	ld b, 2
	call AddYOffset
	ret

Func_1ec64d:
	ld a, WST_RELEASING_OWL
	ld [wWarioState], a
	call ReleaseOwl
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_1fedfe
	update_anim_2
	ret

UpdateState_ReleasingOwl:
	update_anim_2
	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, WST_FALLING_FROM_OWL
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, $02
	ld [wJumpVelTable], a
	ld a, $18
	ld [wJumpVelIndex], a
	ret

UpdateState_FallingFromOwl:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	call ApplyJumpVelocity
	farcall Func_2b17a
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_1ec6e3
	ld a, $04
	ld [wWalkVelIndex], a
.asm_1ec6e3
	farcall CheckAirborneCollision
	ld a, b
	and a
	ret z
	ld hl, hYPosHi
	ld de, wPos
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	jp RecoverFromTransformation

UpdateState_HangingRail:
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_1ec725
	ld a, [wAnimationEnded]
	and a
	jr z, .asm_1ec725
	ld a, $01
	ld [wWarioStateCounter], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_1feeb4
.asm_1ec725
	update_anim_2

	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, RecoverFromTransformation_WithoutInvincibility
	bit A_BUTTON_F, a
	jp nz, Func_1ede4d
	ld a, [wAutoMoveState]
	and a
	jp z, Func_1ede69
	ret

SetState_TurningIntoSnowman:
	play_sfx SFX_047

	ld a, WST_SNOWMAN_START
	ld [wWarioState], a

	ld a, $ff
	ld [wCollisionBoxBottom], a
	ld a, $e5
	ld [wCollisionBoxTop], a
	ld a, $f7
	ld [wCollisionBoxLeft], a
	ld a, $09
	ld [wCollisionBoxRight], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	ld [wJumpVelIndex], a

	ld a, [wJumpVelTable]
	and a
	jr z, .asm_1ec78e
	ld a, $18
	ld [wJumpVelIndex], a

.asm_1ec78e
	call UpdateLevelMusic

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld hl, Pals_c9a0
	call SetWarioPal
	load_gfx WarioSnowmanGfx
	call LoadWarioGfx
	load_oam OAM_1feec7

	ld a, [wDirection]
	and a
	jr nz, .asm_1ec7d1
	load_frameset Frameset_1ff560
	jr .asm_1ec7db
.asm_1ec7d1
	load_frameset Frameset_1ff5a3
.asm_1ec7db
	update_anim_2
	ret

UpdateState_SnowmanStart:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	ld a, [wJumpVelTable]
	and a
	jr z, .asm_1ec831
	call ApplyJumpVelocity
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_1ec827
	jp TriggerDownwardsFloorTransition
.asm_1ec827
	call TriggerFloorTransition
	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
.asm_1ec831
	update_anim_2
	ld a, [wAnimationEnded]
	and a
	ret z
;	fallthrough

SetState_SnowmanIdle:
	xor a
	ld [wWalkVelIndex], a
	ld a, WST_SNOWMAN_IDLE
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1ec86a
	load_frameset Frameset_1ff5f8
	jr .asm_1ec874
.asm_1ec86a
	load_frameset Frameset_1ff5fb
.asm_1ec874
	update_anim_2
	ret

UpdateState_SnowmanIdle:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	call HandleSnowmanInput
	ld a, [wWarioState]
	cp WST_SNOWMAN_IDLE
	ret nz
	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, SetState_SnowmanAirborne_Fall
	ret

SetState_SnowmanWalking:
	xor a
	ld [wWalkVelIndex], a
	ld a, WST_SNOWMAN_WALKING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wJumpVelIndex], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wJoypadDown]
	bit D_LEFT_F, a
	jr nz, .left
	bit D_RIGHT_F, a
	jr nz, .right
	ld a, [wDirection]
	and a
	jr nz, .right
.left
	load_frameset Frameset_1ff5e6
	jr .asm_1ec8fd
.right
	load_frameset Frameset_1ff5ef
.asm_1ec8fd
	update_anim_2
	ret

UpdateState_SnowmanWalking:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .asm_1ec93a
	ld a, $1c
	ld [wSFXLoopCounter], a
	play_sfx SFX_FAT_WALK
.asm_1ec93a
	update_anim_2
	call Func_1ede96
	ld a, [wWarioState]
	cp WST_SNOWMAN_WALKING
	ret nz
	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, SetState_SnowmanAirborne_Fall
	ld a, [wIsStandingOnSlope]
	and a
	ret z
	ld hl, hYPosHi
	ld de, wPos
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	jp Func_1ecc08

SetState_SnowmanTurning:
	ld a, WST_SNOWMAN_TURNING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1ec997
	load_frameset Frameset_1ff605
	jr .asm_1ec9a1
.asm_1ec997
	load_frameset Frameset_1ff5fe
.asm_1ec9a1
	update_anim_2
	ret

UpdateState_SnowmanTurning:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	update_anim_2
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, SetState_SnowmanAirborne_Jump
	ld a, [wAnimationEnded]
	and a
	ret z
	jp SetState_SnowmanWalking

SetState_SnowmanAirborne_Jump:
	play_sfx SFX_JUMP
	xor a
	ld [wJumpVelIndex], a
	ld [wIsSmashAttacking], a
	ld [wWarioStateCounter], a
	ld a, $01
	ld [wJumpVelTable], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1eca15
	load_frameset Frameset_1ff60c
	jr .asm_1eca1f
.asm_1eca15
	load_frameset Frameset_1ff617
.asm_1eca1f
	jr SetState_SnowmanAirborne
SetState_SnowmanAirborne_Fall:
	ld a, $18
	ld [wJumpVelIndex], a
	ld a, $01
	ld [wIsSmashAttacking], a
	ld [wWarioStateCounter], a
	ld a, $02
	ld [wJumpVelTable], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1eca45
	load_frameset Frameset_1ff622
	jr SetState_SnowmanAirborne
.asm_1eca45
	load_frameset Frameset_1ff625
;	fallthrough
SetState_SnowmanAirborne:
	ld a, WST_SNOWMAN_AIRBORNE
	ld [wWarioState], a
	xor a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	update_anim_2
	ret

UpdateState_SnowmanAirborne:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	update_anim_2
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_1ecadd
	ld a, [wAnimationEnded]
	and a
	jr z, .asm_1ecadd
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, 1
	ld [wWarioStateCounter], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1ecac4
	load_frameset Frameset_1ff622
	jr .asm_1ecace
.asm_1ecac4
	load_frameset Frameset_1ff625
.asm_1ecace
	update_anim_2
.asm_1ecadd
	call Func_1edf01
	ld a, [wWarioState]
	cp WST_SNOWMAN_AIRBORNE
	ret nz
	ld a, [wJumpVelIndex]
	cp $18
	jr nc, .asm_1ecb08
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp WST_SNOWMAN_AIRBORNE
	ret nz
	jp SetState_SnowmanAirborne_Fall
.asm_1ecb08
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_1ecb1e
	jp TriggerDownwardsFloorTransition
.asm_1ecb1e
	call TriggerFloorTransition
	farcall CheckCentreCollision
	ld a, [wIsStandingOnSlope]
	and a
	jr z, .asm_1ecb39
	jp Func_1ecc08
.asm_1ecb39
	ld a, [wGroundShakeCounter]
	and a
	jr nz, .asm_1ecb49
	ld a, $20
	ld [wGroundShakeCounter], a
	ld a, TRUE
	ld [wIsWarioGroundShaking], a
.asm_1ecb49
	ld a, [wFloorTransitionDir]
	and a
	jr nz, .asm_1ecb57
	play_sfx SFX_024
.asm_1ecb57
	ld a, WST_SNOWMAN_LANDING
	ld [wWarioState], a
	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ld [wIsSmashAttacking], a
	ld [wWarioStateCounter], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1ecb81
	load_frameset Frameset_1ff60c
	jr .asm_1ecb8b
.asm_1ecb81
	load_frameset Frameset_1ff617
.asm_1ecb8b
	update_anim_2
	ret

UpdateState_SnowmanLanding:
	update_anim_2
	ld a, [wGroundShakeCounter]
	and a
	ret nz
	jp SetState_SnowmanIdle

SetState_SnowmanBumped:
	ld a, WST_SNOWMAN_BUMPED
	ld [wWarioState], a
	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1ecbd7
	load_frameset Frameset_1ff628
	jr .asm_1ecbe1
.asm_1ecbd7
	load_frameset Frameset_1ff639
.asm_1ecbe1
	update_anim_2
	ret

UpdateState_SnowmanBumped:
	update_anim_2
	ld a, [wAnimationEnded]
	and a
	ret z
	jp SetState_SnowmanIdle

Func_1ecc08:
	ld a, $01
	ld [wca8f], a
	xor a
	ld [wWarioStateCounter], a
	load_gfx WarioSnowballGfx
	call LoadWarioGfx
	load_oam OAM_1ff64a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wIsStandingOnSlope]
	and $0f
	dec a
	ld [wDirection], a
	and a
	jr nz, .asm_1ecc51
	load_frameset Frameset_1ff956
	jr .asm_1ecc5b
.asm_1ecc51
	load_frameset Frameset_1ff92b
.asm_1ecc5b
	update_anim_2
;	fallthrough
SetState_SnowballRolling:
	ld a, WST_SNOWBALL_ROLLING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ld [wIsSmashAttacking], a
	ret

UpdateState_SnowballRolling:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wca8f]
	cp $02
	jr z, .asm_1ecccc
	cp $03
	jr z, .asm_1ecd00
	ld a, [wWarioStateCounter]
	cp $70
	jr c, .asm_1ecd00
	ld a, $02
	ld [wca8f], a
	xor a
	ld [wFrameDuration], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1eccc0
	load_frameset Frameset_1ff963
	jr .asm_1ecd00
.asm_1eccc0
	load_frameset Frameset_1ff938
	jr .asm_1ecd00
.asm_1ecccc
	ld a, [wWarioStateCounter]
	cp $e0
	jr c, .asm_1ecd00
	ld a, $03
	ld [wca8f], a
	xor a
	ld [wFrameDuration], a
	ld a, [wAnimationFrame]
	add $02
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1eccf6
	load_frameset Frameset_1ff970
	jr .asm_1ecd00
.asm_1eccf6
	load_frameset Frameset_1ff945
.asm_1ecd00
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .asm_1ecd17
	ld a, $0c
	ld [wSFXLoopCounter], a
	play_sfx SFX_ROLL
.asm_1ecd17
	update_anim_2
	ld a, [wDirection]
	and a
	jr nz, .asm_1ecd34
	call ApplyWalkVelocity_Left
	call SubXOffset
	jr .asm_1ecd3a
.asm_1ecd34
	call ApplyWalkVelocity_Right
	call AddXOffset
.asm_1ecd3a
	ld a, [wca8f]
	cp $03
	jr nc, .asm_1ecd4b
	ld hl, wWarioStateCounter
	ld a, [hl]
	cp $f8
	jr nc, .asm_1ecd4b
	add b
	ld [hl], a
.asm_1ecd4b
	ld a, [wWalkVelIndex]
	cp $18
	jr c, .asm_1ecd57
	ld a, $14
	ld [wWalkVelIndex], a
.asm_1ecd57
	farcall CheckFrontCollision
	ld a, b
	and $0f
	jp nz, SetState_SnowballCrash
	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, .asm_1ecd8c
	ld hl, hYPosHi
	ld de, wPos
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret

.asm_1ecd8c
	ld a, WST_SNOWBALL_AIRBORNE
	ld [wWarioState], a
	ld a, $18
	ld [wJumpVelIndex], a
	ld a, $03
	ld [wJumpVelTable], a
	ret

UpdateState_SnowballAirborne:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	update_anim_2
	farcall CheckFrontCollision
	ld a, b
	and $0f
	jr nz, SetState_SnowballCrash
	call ApplyJumpVelocity
	farcall HandleWalk
	ld a, [wWalkVelIndex]
	cp $18
	jr c, .asm_1ecdfa
	ld a, $14
	ld [wWalkVelIndex], a
.asm_1ecdfa
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_1ece10
	jp TriggerDownwardsFloorTransition
.asm_1ece10
	call TriggerFloorTransition
	jp SetState_SnowballRolling

SetState_SnowballCrash:
	xor a
	ld [wca8f], a
	ld a, WST_SNOWBALL_CRASH
	ld [wWarioState], a
	ld a, [wDirection]
	xor $1
	ld [wDirection], a
	and a
	jr nz, .asm_1ece31
	ld b, 2
	call SubXOffset
	jr .asm_1ece36
.asm_1ece31
	ld b, 2
	call AddXOffset
.asm_1ece36
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_1ff981
	update_anim_2
	ret

UpdateState_SnowballCrash:
	update_anim_2
	ld a, [wAnimationEnded]
	and a
	ret z
	ld hl, wPos
	ld de, hYPosHi
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
	ld b, PARTICLE_SNOW
	farcall CreateParticle
	jp RecoverFromTransformation

SetState_SplitHit:
	ld a, WST_SPLIT_HIT
	ld [wWarioState], a

	ld a, $ff
	ld [wCollisionBoxBottom], a
	ld a, $e5
	ld [wCollisionBoxTop], a
	ld a, $f7
	ld [wCollisionBoxLeft], a
	ld a, $09
	ld [wCollisionBoxRight], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a

	ld a, $01
	ld [wJumpVelTable], a
	ld a, $0e
	ld [wJumpVelIndex], a

	call UpdateLevelMusic

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld hl, Pals_c9e0
	call SetWarioPal
	load_gfx WarioSnowballGfx
	call LoadWarioGfx
	load_oam OAM_1ffa12

	ld a, [wEnemyDirection]
	ld [wDirection], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1ecf20
	load_frameset Frameset_1ffd16
	jr .asm_1ecf2a
.asm_1ecf20
	load_frameset Frameset_1ffd10
.asm_1ecf2a
	update_anim_2
	ret

UpdateState_SplitHit:
	update_anim_2
	ld a, [wAnimationEnded]
	and a
	ret z

	ld a, WST_SPLIT_KNOCKED_BACK
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1ecf6c
	load_frameset Frameset_1ffd19
	jr .asm_1ecf76
.asm_1ecf6c
	load_frameset Frameset_1ffd13
.asm_1ecf76
	update_anim_2
	ret

UpdateState_SplitKnockedBack:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	call ApplyJumpVelocity
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .play_sfx
	farcall HandleWalk
	call Func_1762
	jp TriggerDownwardsFloorTransition

.play_sfx
	play_sfx SFX_044

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1ecfef
	load_frameset Frameset_1ffccf
	jr .asm_1ecff9
.asm_1ecfef
	load_frameset Frameset_1ffc8e
.asm_1ecff9
	update_anim_2
;	fallthrough

SetState_Splitting:
	call TriggerFloorTransition
	ld a, WST_SPLITTING
	ld [wWarioState], a
	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ret

UpdateState_Splitting:
	update_anim_2
	ld a, [wAnimationEnded]
	and a
	jr nz, Func_1ed09b

	farcall CheckCentreCollision
	ld a, b
	and a
	ret nz

	ld a, WST_SPLITTING_AIRBORNE
	ld [wWarioState], a

	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ret

UpdateState_SplittingAirborne:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	update_anim_2
	ld a, [wAnimationEnded]
	and a
	jr nz, Func_1ed09b
	call ApplyJumpVelocity
	farcall CheckAirborneCollision
	ld a, b
	and a
	jp nz, SetState_Splitting
	jp TriggerDownwardsFloorTransition

Func_1ed09b:
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	jp RecoverFromTransformation

SetState_FanStart:
	ld a, WST_FAN_START
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
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	ld [wJumpVelIndex], a
	inc a
	ld [wJumpVelTable], a
	call UpdateLevelMusic
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	load_gfx WarioFanGfx
	call LoadWarioGfx
	load_oam OAM_1dc000
	ld a, [wDirection]
	and a
	jr nz, .asm_1ed11c
	load_frameset Frameset_1dc37f
	jr .asm_1ed126
.asm_1ed11c
	load_frameset Frameset_1dc3c3
.asm_1ed126
	update_anim_3
	ret

UpdateState_FanStart:
	farcall Func_19b25
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .asm_1ed15c
	ld a, $0c
	ld [wSFXLoopCounter], a
	play_sfx SFX_07D
.asm_1ed15c
	update_anim_3
	ld a, [wAnimationEnded]
	and a
	ret z
;	fallthrough
SetState_FanLifting:
	xor a
	ld [wWalkVelIndex], a
	ld a, WST_FAN_LIFTING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1ed195
	load_frameset Frameset_1dc374
	jr .asm_1ed19f
.asm_1ed195
	load_frameset Frameset_1dc3b8
.asm_1ed19f
	update_anim_3
	ret

UpdateStart_FanLifting:
	farcall Func_19b25
	ld a, [wIsInAirCurrent]
	and a
	jp z, SetState_FanRecovering
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .asm_1ed1dc
	ld a, $0c
	ld [wSFXLoopCounter], a
	play_sfx SFX_07D
.asm_1ed1dc
	update_anim_3
	call Func_1edf2b
	ld a, [wWarioState]
	cp WST_FAN_LIFTING
	ret nz
	call Func_1edf47
	ret

SetState_FanTurning:
	ld a, [wDirection]
	xor $1
	ld [wDirection], a
	ld a, WST_FAN_TURNING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1ed225
	load_frameset Frameset_1dc38e
	jr .asm_1ed22f
.asm_1ed225
	load_frameset Frameset_1dc389
.asm_1ed22f
	update_anim_3
	ret

UpdateStart_FanTurning:
	call Func_1edf2b
	ld a, [wWarioState]
	cp WST_FAN_TURNING
	ret nz
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .asm_1ed25f
	ld a, $0c
	ld [wSFXLoopCounter], a
	play_sfx SFX_07D
.asm_1ed25f
	update_anim_3
	ld a, [wAnimationEnded]
	and a
	ret z
	jp SetState_FanLifting

SetState_FanSpinning:
	ld a, WST_FAN_SPINNING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_1dc393
	update_anim_3
	ret

UpdateState_FanSpinning:
	farcall Func_19b25
	ld a, [wIsInAirCurrent]
	and a
	jr z, SetState_FanRecovering
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .asm_1ed2cf
	ld a, $0c
	ld [wSFXLoopCounter], a
	play_sfx SFX_07D
.asm_1ed2cf
	update_anim_3
	call Func_1edf47
	ret

SetState_FanRecovering:
	ld a, WST_FAN_RECOVERING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1ed300
	load_frameset Frameset_1dc384
	jr .asm_1ed30a
.asm_1ed300
	load_frameset Frameset_1dc3c8
.asm_1ed30a
	update_anim_3
	ret

UpdateStart_FanRecovering:
	update_anim_3
	ld a, [wAnimationEnded]
	and a
	ret z
	jp RecoverFromTransformation_WithoutInvincibility

SetState_BlindIdling:
	ld a, WST_BLIND_IDLING
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWalkVelIndex], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ld [wInvisibleFrame], a

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	xor a ; unnecessary
	call UpdateLevelMusic

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld hl, Pals_c800
	call SetWarioPal
	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14000

	ld a, [wDirection]
	and a
	jr nz, .asm_1ed3b3
	load_frameset Frameset_14252
	jr .asm_1ed3bd
.asm_1ed3b3
	load_frameset Frameset_1425f
.asm_1ed3bd
	update_anim_1
	ret

UpdateState_BlindIdling:
	update_anim_1
	call Func_1edf93
	ld a, [wWarioState]
	cp WST_BLIND_IDLING
	ret nz ; done if not blind idling any more

	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, Func_1ed548
	ret

SetState_BlindWalking:
	xor a
	ld [wWalkVelIndex], a
	ld a, WST_BLIND_WALKING
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wJumpVelIndex], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_gfx WarioWalkGfx
	call LoadWarioGfx
	load_oam OAM_1426c

	ld a, [wJoypadDown]
	bit D_LEFT_F, a
	jr nz, .asm_1ed443
	bit D_RIGHT_F, a
	jr nz, .asm_1ed44f

	ld a, [wDirection]
	and a
	jr nz, .asm_1ed44f
.asm_1ed443
	load_frameset Frameset_149b4
	jr .asm_1ed459
.asm_1ed44f
	load_frameset Frameset_149c5
.asm_1ed459
	update_anim_1
	ret

UpdateState_BlindWalking:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	update_anim_1

	farcall CheckFrontCollision
	ld a, [wWarioState]
	cp WST_BLIND_WALKING
	ret nz ; done if not blind walking any more

	ld a, b
	and a
	jp nz, RecoverFromTransformation
	call Func_1edfa4
	ld a, [wWarioState]
	cp WST_BLIND_WALKING
	ret nz ; done if not blind walking any more

	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, Func_1ed548
	update_pos_y
	ret

SetState_BlindTurning:
	ld a, WST_BLIND_TURNING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14a82

	ld a, [wDirection]
	and a
	jr nz, .asm_1ed510
	load_frameset Frameset_14cbe
	jr .asm_1ed51a
.asm_1ed510
	load_frameset Frameset_14cc5
.asm_1ed51a
	update_anim_1
	ret

UpdateState_BlindTurning:
	update_anim_1
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, Func_1ed558
	ld a, [wAnimationEnded]
	and a
	ret z
	jp SetState_BlindWalking

Func_1ed548:
	xor a
	ld [wJumpingUpwards], a
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_HIGH_JUMP
	ld [wJumpVelTable], a
	jr SetState_BlindAirborne

Func_1ed558:
	play_sfx SFX_JUMP

	xor a
	ld [wJumpVelIndex], a
	ld [wIsSmashAttacking], a
	ld a, TRUE
	ld [wJumpingUpwards], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a
;	fallthrough

SetState_BlindAirborne:
	xor a ; FALSE
	ld [wIsStandingOnSlope], a

	ld a, WST_BLIND_AIRBORNE
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsCrouching], a
	ld [wAttackCounter], a

	load_gfx WarioAirborneGfx
	call LoadWarioGfx
	load_oam OAM_15955

	ld a, [wDirection]
	and a
	jr nz, .asm_1ed5c0
	load_frameset Frameset_15f94
	jr .asm_1ed5ca
.asm_1ed5c0
	load_frameset Frameset_15f97
.asm_1ed5ca
	update_anim_1

	ld a, [wIsOnSteppableObject]
	and a
	ret z
	call UpdateState_BlindAirborne
	ret

UpdateState_BlindAirborne:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	farcall CheckFrontCollision
	ld a, [wWarioState]
	cp WST_BLIND_AIRBORNE
	ret nz ; done if not blind airborne any more

	ld a, b
	and a
	jp nz, RecoverFromTransformation
	call Func_1ee00f
	ld a, [wWarioState]
	cp WST_BLIND_AIRBORNE
	ret nz ; done if not blind airborne any more

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1ed644
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp WST_BLIND_AIRBORNE
	ret nz ; done if not blind airborne any more
	jp Func_1ed548

.asm_1ed644
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_1ed65a
	jp TriggerDownwardsFloorTransition
.asm_1ed65a
	call TriggerFloorTransition
	jp SetState_BlindIdling

SetState_Swallowed:
	ld a, WST_SWALLOWED
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWalkVelIndex], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

	inc a ; TRUE
	ld [wIsIntangible], a
	ld [wAutoMoveState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wIsTurning], a

	ld hl, Pals_c800
	call SetWarioPal
	load_gfx WarioLaunchGfx
	call LoadWarioGfx
	load_oam OAM_1dc3cd

	ld a, [wEnemyDirection]
	ld [wDirection], a
	and a
	jr nz, .asm_1ed6d4
	load_frameset Frameset_1dc40f
	jr .asm_1ed6de
.asm_1ed6d4
	load_frameset Frameset_1dc42c
.asm_1ed6de
	update_anim_3
	ret

UpdateState_Swallowed:
	ld a, [wIsTurning]
	and a
	jr z, .spit_out
	xor a
	ld [wIsTurning], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	xor $1
	ld [wDirection], a
	and a
	jr nz, .asm_1ed715
	load_frameset Frameset_1dc40f
	jr .spit_out
.asm_1ed715
	load_frameset Frameset_1dc42c

.spit_out
	update_anim_3
	ld a, [wAutoMoveState]
	and a
	ret nz
	ld a, DIRECTION_LEFT
	ld [wDirection], a
;	fallthrough

SetState_Launched:
	xor a
	ld [wIsIntangible], a

	ld a, (1 << 6) | TRANSFORMATION_UNK_14
	ld [wTransformation], a

	ld a, TOUCH_VANISH
	ld [wTouchState], a
	ld a, TOUCH_VANISH
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a

	ld a, WST_LAUNCHED
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWalkVelIndex], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

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

	ld hl, Pals_c800
	call SetWarioPal
	load_gfx WarioLaunchGfx
	call LoadWarioGfx
	load_oam OAM_1dc449

	ld a, [wDirection]
	and a
	jr nz, .asm_1ed7cb
	load_frameset Frameset_1dc904
	jr .asm_1ed7d5
.asm_1ed7cb
	load_frameset Frameset_1dc8fb
.asm_1ed7d5
	update_anim_3
	ret

UpdateState_Launched:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .asm_1ed812
	ld a, $86
	ld [wSFXLoopCounter], a
	play_sfx SFX_04C
.asm_1ed812
	update_anim_3
	farcall CheckFrontCollision
	ld a, b
	and a
	jr nz, .asm_1ed846
	ld a, [wDirection]
	and a
	jr nz, .asm_1ed840
	ld b, 2
	call SubXOffset
	ret
.asm_1ed840
	ld b, 2
	call AddXOffset
	ret

.asm_1ed846
	play_sfx SFX_048
	ld a, WST_LAUCH_CRASH
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1ed86c
	load_frameset Frameset_1dc926
	jr .asm_1ed876
.asm_1ed86c
	load_frameset Frameset_1dc90d
.asm_1ed876
	update_anim_3
	ret

UpdateState_LaunchCrash:
	update_anim_3
	ld a, [wAnimationEnded]
	and a
	ret z
	farcall Func_2ad6a
	ret

SetState_MagicRising:
	ld hl, wPos
	ld de, hPos
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
	ld b, PARTICLE_MAGIC_1
	farcall CreateParticle

	ld hl, wPos
	ld de, hPos
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
	ld b, PARTICLE_MAGIC_2
	farcall CreateParticle

	ld a, WST_MAGIC_RISING
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
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	ld [wJumpVelIndex], a

	inc a
	ld [wJumpVelTable], a

	call UpdateLevelMusic

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld hl, Pals_c9b0
	call SetWarioPal
	load_gfx WarioMagicGfx
	call LoadWarioGfx
	load_oam OAM_1dcd60

	load_frameset Frameset_1dcfb0
	update_anim_3
	ret

UpdateState_MagicRising:
	farcall Func_19b25
	farcall CheckUpCollision
	ld a, b
	and a
	jr nz, .asm_1ed9d5

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, $0c
	ld [wSFXLoopCounter], a
	play_sfx SFX_07D
.skip_sfx

	ld a, $77
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld b, 1
	call SubYOffset
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .asm_1ed9d4
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr nc, .asm_1ed9d4
	call StartUpwardsFloorTransition
.asm_1ed9d4
	ret

.asm_1ed9d5
	get_pos
	ld b, PARTICLE_MAGIC_STOP
	farcall CreateParticle

	ld a, WST_MAGIC_STOPPING
	ld [wWarioState], a

	xor a
	ld [wWarioStateCounter], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, $77
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_MagicStopping:
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $20
	ret c
UpdateState_MagicRecovering:
	jp RecoverFromTransformation

SetState_BallStart:
	call UpdateLevelMusic

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -20
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	xor a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a

	ld hl, Pals_c9c0
	call SetWarioPal
	load_gfx WarioBallGfx
	call LoadWarioGfx
	load_oam OAM_1dcff1

	ld a, [wJumpVelTable]
	and a
	jr z, Func_1edaca

	ld a, WST_BALL_START
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a

	ld a, $18
	ld [wJumpVelIndex], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	load_frameset Frameset_1dd313
	update_anim_3
	ret

UpdateState_BallStart:
	call ApplyJumpVelocity
	farcall CheckAirborneCollision
	ld a, b
	and a
	ret z

	ld hl, hPos
	ld de, wPos
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
;	fallthrough

Func_1edaca:
	ld a, [wDirection]
	and a
	jr nz, .asm_1edae4
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jp nz, SetState_BallTurning
	load_frameset Frameset_1dd316
	jr Func_1edd24
.asm_1edae4
	ld a, [wJoypadDown]
	bit D_LEFT_F, a
	jp nz, SetState_BallTurning
	load_frameset Frameset_1dd323
	jr Func_1edd24

Func_1edaf8:
	ld a, [wDirection]
	and a
	jr nz, .asm_1edb12
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jp nz, SetState_BallTurning
	load_frameset Frameset_1dd230
	jr Func_1edd24
.asm_1edb12
	ld a, [wJoypadDown]
	bit D_LEFT_F, a
	jp nz, SetState_BallTurning
	load_frameset Frameset_1dd295
;	fallthrough

Func_1edd24:
	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

	ld a, WST_BALL_BOUNCING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	update_anim_3
	ret

UpdateState_BallBouncing:
	update_anim_3
	ld a, [wAnimationEnded]
	and a
	ret z
;	fallthrough

SetState_BallAirborne:
	play_sfx SFX_066
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a

	ld a, WST_BALL_AIRBORNE
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1edb86
	load_frameset Frameset_1dd2f3
	jr .asm_1edb90
.asm_1edb86
	load_frameset Frameset_1dd2f6
.asm_1edb90
	update_anim_3
	ret

UpdateState_BallAirborne:
	update_anim_3

	call Func_1ee02e
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	ret c
	farcall CheckAirborneCollision
	ld a, b
	and a
	ret z
	update_pos_y
	jp Func_1edaf8

SetState_BallShot:
	ld a, WST_BALL_SHOT
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

	inc a ; TRUE
	ld [wAutoMoveState], a
	ld [wIsIntangible], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	load_frameset Frameset_1dd26c
	update_anim_3
	ret

UpdateState_BallShot:
	ld a, [wAutoMoveState]
	and a
	jr z, .asm_1edc91
	bit 7, a
	jr z, .asm_1edc71
	and $7f
	ld [wAutoMoveState], a
	dec a
	jr z, .asm_1edc5a
	dec a
	jr z, .asm_1edc2e
	dec a
	jr z, .asm_1edc41
	ret

.asm_1edc2e
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_1dd2d1
	jr .asm_1edc71

.asm_1edc41
	ld hl, Pals_c9d0
	call SetWarioPal

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_1dd27a
	jr .asm_1edc71

.asm_1edc5a
	ld hl, Pals_c9c0
	call SetWarioPal

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_1dd26c

.asm_1edc71
	update_anim_3

	ld a, [wAutoMoveState]
	cp $02
	ret nz
	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, (1 << 7) | $03
	ld [wAutoMoveState], a
	ret

.asm_1edc91
	ld a, DIRECTION_LEFT
	ld [wDirection], a

	ld a, WST_BALL_THROWN
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a

	ld a, $6
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_HIGH_JUMP
	ld [wJumpVelTable], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_1dd2ee
	update_anim_3
	ret

UpdateState_BallThrown:
	update_anim_3

	call ApplyJumpVelocity
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .falling
; rising
	ld b, 3
	call SubXOffset
	ret

.falling
	ld b, 2
	call SubXOffset
	farcall CheckAirborneCollision
	ld a, b
	and a
	ret z
	update_pos_y

	xor a
	ld [wIsIntangible], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	ld a, [wNumShootGoals]
	cp 3
	jr z, .asm_1edd3c
	pop af
	ldh [rSVBK], a
	farcall Func_206eb
	ret

.asm_1edd3c
	pop af
	ldh [rSVBK], a

	ld a, WST_BALL_SENT_UPWARDS
	ld [wWarioState], a
	play_sfx SFX_066

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelIndex], a
	inc a ; TRUE
	ld [wIsIntangible], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	load_frameset Frameset_1dd2ee
	update_anim_3
	ret

UpdateState_BallSentUpwards:
	update_anim_3

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .falling
; rising
	ld b, 3
	call SubYOffset
	farcall CheckUpCollision
	ld a, b
	and a
	jp z, HandleUpwardsFloorTransition
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a
	ret

.falling
	call ApplyJumpVelocity
	farcall CheckAirborneCollision
	ld a, b
	and a
	ret z
	update_pos_y
	xor a
	ld [wIsIntangible], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	farcall Func_206eb
	ret

SetState_BallTurning:
	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

	ld a, WST_BALL_TURNING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	and a
	jr nz, .asm_1ede1c
	load_frameset Frameset_1dd28e
	jr .asm_1ede26
.asm_1ede1c
	load_frameset Frameset_1dd287
.asm_1ede26
	update_anim_3
	ret

UpdateState_BallTurning:
	update_anim_3
	ld a, [wAnimationEnded]
	and a
	ret z
	jp SetState_BallAirborne

Func_1ede4d:
	call ClearTransformationValues
	call UpdateLevelMusic
	ld hl, Pals_c800
	call SetWarioPal
	farcall StartJump_FromInput
	ret

Func_1ede69:
	call ClearTransformationValues
	call UpdateLevelMusic
	ld hl, Pals_c800
	call SetWarioPal
	farcall Func_1e174
	ret

HandleSnowmanInput:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, SetState_SnowmanAirborne_Jump
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_SnowmanWalking
	ret

Func_1ede96:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, SetState_SnowmanAirborne_Jump
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	jp SetState_SnowmanIdle
.d_right
	ld a, [wDirection]
	and a
	jr z, .asm_1edece
	farcall WalkIfPossible_Right
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_1edecd
	ld a, $04
	ld [wWalkVelIndex], a
.asm_1edecd
	ret
.asm_1edece
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jp SetState_SnowmanTurning
.d_left
	ld a, [wDirection]
	cp DIRECTION_LEFT
	jr nz, .asm_1edef9
	farcall WalkIfPossible_Left
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_1edef8
	ld a, $04
	ld [wWalkVelIndex], a
.asm_1edef8
	ret
.asm_1edef9
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jp SetState_SnowmanTurning

Func_1edf01:
	call ApplyJumpVelocity
	farcall Func_2b17a
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_1edf1f
	ld a, $04
	ld [wWalkVelIndex], a
.asm_1edf1f
	ld a, [wJumpVelIndex]
	cp $18
	ret nz
	ld a, TRUE
	ld [wIsSmashAttacking], a
	ret

Func_1edf2b:
	farcall Func_19acd
	ld a, [wIsInAirCurrent]
	and a
	jp z, SetState_FanSpinning
	ld b, 1
	call SubYOffset
	ret

Func_1edf47:
	ld a, [wDirection]
	and a
	jr nz, .asm_1edf70
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jp nz, SetState_FanTurning
	bit D_LEFT_F, a
	ret z
	farcall Func_197b1
	ld a, b
	and a
	ret nz
	ld b, 1
	call SubXOffset
	ret
.asm_1edf70
	ld a, [wJoypadDown]
	bit D_LEFT_F, a
	jp nz, SetState_FanTurning
	bit D_RIGHT_F, a
	ret z
	farcall Func_19741
	ld a, b
	and a
	ret nz
	ld b, 1
	call AddXOffset
	ret

Func_1edf93:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, Func_1ed558
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_BlindWalking
	ret

Func_1edfa4:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, Func_1ed558
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_1edfba
	bit D_LEFT_F, a
	jr nz, .asm_1edfe4
	jp SetState_BlindIdling

.asm_1edfba
	ld a, [wDirection]
	and a
	jr z, .asm_1edfdc
	farcall WalkIfPossible_Right
	ld a, [wWalkVelIndex]
	cp $10
	jr c, .asm_1edfdb
	ld a, $0c
	ld [wWalkVelIndex], a
.asm_1edfdb
	ret

.asm_1edfdc
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jp SetState_BlindTurning

.asm_1edfe4
	ld a, [wDirection]
	cp DIRECTION_LEFT
	jr nz, .asm_1ee007
	farcall WalkIfPossible_Left
	ld a, [wWalkVelIndex]
	cp $10
	jr c, .asm_1ee006
	ld a, $0c
	ld [wWalkVelIndex], a
.asm_1ee006
	ret

.asm_1ee007
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jp SetState_BlindTurning

Func_1ee00f:
	call ApplyJumpVelocity
	farcall Func_2b17a
	ld a, [wWalkVelIndex]
	cp $10
	jr c, .asm_1ee02d
	ld a, $0c
	ld [wWalkVelIndex], a
.asm_1ee02d
	ret

Func_1ee02e:
	call ApplyJumpVelocity
	farcall HandleWalk
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_1ee04c
	ld a, $04
	ld [wWalkVelIndex], a
.asm_1ee04c
	ret
