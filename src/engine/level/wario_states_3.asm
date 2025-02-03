UpdateWarioStates_Group3:
	ld a, [wWarioState]
	sub $60
	jumptable

	dw UpdateState_OnFire                     ; WST_ON_FIRE
	dw UpdateState_OnFireAirborne             ; WST_ON_FIRE_AIRBORNE
	dw UpdateState_Hot                        ; WST_HOT
	dw UpdateState_HotAirborne                ; WST_HOT_AIRBORNE
	dw UpdateState_Burnt                      ; WST_BURNT
	dw UpdateState_GettingFlatAirborne        ; WST_GETTING_FLAT_AIRBORNE
	dw UpdateState_GettingFlat                ; WST_GETTING_FLAT
	dw UpdateState_FlatIdling                 ; WST_FLAT_IDLING
	dw UpdateState_FlatWalking                ; WST_FLAT_WALKING
	dw UpdateState_FlatJumping                ; WST_FLAT_JUMPING
	dw UpdateState_FlatFalling                ; WST_FLAT_FALLING
	dw UpdateState_FlatStretching             ; WST_FLAT_STRETCHING
	dw UpdateState_FlatSinking                ; WST_FLAT_SINKING
	dw UpdateState_FlatStretchingUnderwater   ; WST_FLAT_STRETCHING_UNDERWATER
	dw UpdateState_FlatSquished               ; WST_FLAT_SQUISHED
	dw UpdateState_FlatSquishedLifting        ; WST_FLAT_SQUISHED_LIFTING
	dw UpdateState_GettingWrappedInString     ; WST_GETTING_WRAPPED_IN_STRING
	dw UpdateState_BallOString                ; WST_BALL_O_STRING
	dw UpdateState_BallOStringAirborne        ; WST_BALL_O_STRING_AIRBORNE
	dw UpdateState_BallOStringKnockBack       ; WST_BALL_O_STRING_KNOCK_BACK
	dw UpdateState_GettingUnwrappedInString   ; WST_GETTING_UNWRAPPED_IN_STRING
	dw UpdateState_BallOStringDizzy           ; WST_BALL_O_STRING_DIZZY
	dw UpdateState_FatBumping                 ; WST_FAT_BUMPING
	dw UpdateState_FatEating                  ; WST_FAT_EATING
	dw UpdateState_FatIdling                  ; WST_FAT_IDLING
	dw UpdateState_FatWalking                 ; WST_FAT_WALKING
	dw UpdateState_FatTurning                 ; WST_FAT_TURNING
	dw UpdateState_FatAirborne                ; WST_FAT_AIRBORNE
	dw UpdateState_FatLanding                 ; WST_FAT_LANDING
	dw UpdateState_FatSinking                 ; WST_FAT_SINKING
	dw UpdateState_FatRecovering              ; WST_FAT_RECOVERING
	dw UpdateState_ElectricStart              ; WST_ELECTRIC_START
	dw UpdateState_Electric                   ; WST_ELECTRIC
	dw UpdateState_ElectricDizzy              ; WST_ELECTRIC_DIZZY
	dw UpdateState_TurningInvisible           ; WST_TURNING_INVISIBLE
	dw UpdateState_PuffyInflating             ; WST_PUFFY_INFLATING
	dw UpdateState_PuffyRising                ; WST_PUFFY_RISING
	dw UpdateState_PuffyTurning               ; WST_PUFFY_TURNING
	dw UpdateState_PuffyDeflating             ; WST_PUFFY_DEFLATING
	dw UpdateState_ZombieIdling               ; WST_ZOMBIE_IDLING
	dw UpdateState_ZombieWalking              ; WST_ZOMBIE_WALKING
	dw UpdateState_ZombieTurning              ; WST_ZOMBIE_TURNING
	dw UpdateState_ZombieAirborne             ; WST_ZOMBIE_AIRBORNE
	dw UpdateState_ZombieLanding              ; WST_ZOMBIE_LANDING
	dw UpdateState_ZombieSlippingThroughFloor ; WST_ZOMBIE_SLIPPING_THROUGH_FLOOR
	dw UpdateState_ZombieRecovering           ; WST_ZOMBIE_RECOVERING
	dw UpdateState_ZombieKnockBack            ; WST_ZOMBIE_KNOCK_BACK
	dw UpdateState_ZombieWrithing             ; WST_ZOMBIE_WRITHING
	dw UpdateState_BouncyStart                ; WST_BOUNCY_START
	dw UpdateState_BouncyFloor                ; WST_BOUNCY_FLOOR
	dw UpdateState_BouncyAirborne             ; WST_BOUNCY_AIRBORNE
	dw UpdateState_BouncyCeiling              ; WST_BOUNCY_CEILING
	dw UpdateState_BouncyUpsideDown           ; WST_BOUNCY_UPSIDE_DOWN
	dw UpdateState_BouncyUpsideLanding        ; WST_BOUNCY_UPSIDE_DOWN_LANDING
	dw UpdateState_BouncyLastBounce           ; WST_BOUNCY_LAST_BOUNCE
	dw UpdateState_CrazySpinning              ; WST_CRAZY_SPINNING
	dw UpdateState_CrazyDizzy                 ; WST_CRAZY_DIZZY
	dw UpdateState_Crazy                      ; WST_CRAZY
	dw UpdateState_CrazyTurning               ; WST_CRAZY_TURNING
	dw UpdateState_CrazyAirborne              ; WST_CRAZY_AIRBORNE
	dw UpdateState_VampireIdling              ; WST_VAMPIRE_IDLING
	dw UpdateState_VampireWalking             ; WST_VAMPIRE_WALKING
	dw UpdateState_VampireTurning             ; WST_VAMPIRE_TURNING
	dw UpdateState_VampireAirborne            ; WST_VAMPIRE_AIRBORNE
	dw UpdateState_BatTransforming            ; WST_BAT_TRANSFORMING
	dw UpdateState_BatIdling                  ; WST_BAT_IDLING
	dw UpdateState_VampireTransforming        ; WST_VAMPIRE_TRANSFORMING
	dw UpdateState_BatFlying                  ; WST_BAT_FLYING
	dw UpdateState_BatFalling                 ; WST_BAT_FALLING
	dw UpdateState_InBubble                   ; WST_IN_BUBBLE
	dw InvalidWarioStateReset                 ; WST_UNUSED_A6
	dw InvalidWarioStateReset                 ; WST_UNUSED_A7
	dw InvalidWarioStateReset                 ; WST_UNUSED_A8
	dw InvalidWarioStateReset                 ; WST_UNUSED_A9
	dw InvalidWarioStateReset                 ; WST_UNUSED_AA
	dw InvalidWarioStateReset                 ; WST_UNUSED_AB
	dw InvalidWarioStateReset                 ; WST_UNUSED_AC
	dw InvalidWarioStateReset                 ; WST_UNUSED_AD
	dw InvalidWarioStateReset                 ; WST_UNUSED_AE
	dw InvalidWarioStateReset                 ; WST_UNUSED_AF

UpdateState_OnFire:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 14
	ld [wSFXLoopCounter], a
	play_sfx SFX_01E
.skip_sfx

	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_28100
	ld a, [wAnimationEnded]
	and a
	jr z, .asm_28100
	ld a, $01
	ld [wWarioStateCounter], a

	ld a, [wDirection]
	and a
	jr nz, .asm_280f6
	ld a, HIGH(Frameset_16b14)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b14)
	ld [wFramesetPtr + 1], a
	jr .asm_28100
.asm_280f6
	ld a, HIGH(Frameset_16b1d)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b1d)
	ld [wFramesetPtr + 1], a
.asm_28100
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	call DecrementTransformationDuration
	ld hl, wTransformationDuration
	ld a, [hli]
	cp HIGH(HOT_WARIO_TRANSITION_DURATION)
	jr nz, .continue
	ld a, [hl]
	cp LOW(HOT_WARIO_TRANSITION_DURATION)
	jr nz, .continue
	jr SetState_Hot
.continue
	call Func_2ae8a

	ld a, [wWarioState]
	cp WST_ON_FIRE
	ret nz ; done if not on fire anymore

	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, Func_2af75
	update_pos_y
	ret

SetState_Hot_ResetDuration:
	ld a, HIGH(HOT_WARIO_TRANSITION_DURATION)
	ld [wTransformationDuration + 0], a
	ld a, LOW(HOT_WARIO_TRANSITION_DURATION)
	ld [wTransformationDuration + 1], a
;	fallthrough

SetState_Hot:
	ld a, 2
	ld [wWarioTransformationProgress], a
	ld a, WST_HOT
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, TOUCH_VANISH
	ld [wStingTouchState], a
	ld a, TOUCH_VANISH
	ld [wTouchState], a
	ld a, $02
	ld [wca94], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

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
	ld a, HIGH(Frameset_16b26)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b26)
	ld [wFramesetPtr + 1], a
.asm_281a5
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret
.asm_281b5
	ld a, HIGH(Frameset_16b2f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b2f)
	ld [wFramesetPtr + 1], a
	jr .asm_281a5

UpdateState_OnFireAirborne:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, Func_2ade4
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_2820b
	ld a, [wAnimationEnded]
	and a
	jr z, .asm_2820b
	ld a, $01
	ld [wWarioStateCounter], a

	ld a, [wDirection]
	and a
	jr nz, .asm_28201
	ld a, HIGH(Frameset_16b14)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b14)
	ld [wFramesetPtr + 1], a
	jr .asm_2820b
.asm_28201
	ld a, HIGH(Frameset_16b1d)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b1d)
	ld [wFramesetPtr + 1], a
.asm_2820b
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	call Func_2af9c
	ld a, [wWarioState]
	cp WST_ON_FIRE_AIRBORNE
	ret nz ; done if not on fire and airborne

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_28245
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp WST_ON_FIRE_AIRBORNE
	ret nz ; done if not on fire and airborne

	jp Func_2af75
.asm_28245
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_28261
	ld a, [wWarioState]
	cp WST_ON_FIRE_AIRBORNE
	ret nz ; done if not on fire and airborne

	jp TriggerDownwardsFloorTransition
.asm_28261
	call TriggerFloorTransition
	ld a, [wWarioState]
	cp WST_ON_FIRE_AIRBORNE
	ret nz ; done if not on fire and airborne

	farcall SetState_OnFire
	ret

UpdateState_Hot:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 16
	ld [wSFXLoopCounter], a
	play_sfx SFX_01F
.skip_sfx
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	call DecrementTransformationDuration
	ld hl, wTransformationDuration
	ld a, [hli]
	cp 0
	jr nz, .ok
	ld a, [hl]
	cp 224
	jr z, .pal_1
	cp 164
	jr z, .pal_2
	cp 60
	jr z, .pal_3
	cp 1
	jr nz, .ok
	jr .burnt

.pal_1
	ld hl, WarioHot1Pal
	call SetWarioPal
	jr .ok
.pal_2
	ld hl, WarioHot2Pal
	call SetWarioPal
	jr .ok
.pal_3
	ld hl, WarioHot3Pal
	call SetWarioPal
.ok
	call HandleHotWarioInput

	ld a, [wWarioState]
	cp WST_HOT
	ret nz ; done if not in hot state anymore

	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, Func_28380
	update_pos_y
	ret

.burnt
	play_sfx SFX_022

	ld a, WST_BURNT
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld hl, WarioOnFirePal
	call SetWarioPal
	ld a, BANK(WarioBurntGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioBurntGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioBurntGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_16b6c)
	ld [wOAMBank], a
	ld a, HIGH(OAM_16b6c)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_16b6c)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_28366
	ld a, HIGH(Frameset_16e47)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16e47)
	ld [wFramesetPtr + 1], a
	jr .asm_28370
.asm_28366
	ld a, HIGH(Frameset_16e72)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16e72)
	ld [wFramesetPtr + 1], a
.asm_28370
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

Func_28380:
	ld a, [wWarioXPos + 1]
	and $f0
	add $08
	ld [wWarioXPos + 1], a
;	fallthrough

Func_2838a:
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a
	ld a, WST_HOT_AIRBORNE
	ld [wWarioState], a
	ld a, $08
	ld [wWarioStateCounter], a
	ret

UpdateState_HotAirborne:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, Func_2ade4
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	call Func_2b027
	ld a, [wWarioState]
	cp WST_HOT_AIRBORNE
	ret nz ; done if not hot airborne anymore

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .falling

; rising
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp WST_HOT_AIRBORNE
	ret nz ; done if not hot airborne anymore
	jp Func_2838a

.falling
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_28412
	ld a, [wWarioState]
	cp WST_HOT_AIRBORNE
	ret nz ; done if not hot airborne anymore

	jp TriggerDownwardsFloorTransition
.asm_28412
	call TriggerFloorTransition
	ld a, [wWarioState]
	cp WST_HOT_AIRBORNE
	ret nz ; done if not hot airborne anymore

	jp SetState_Hot

UpdateState_Burnt:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	jp RecoverFromTransformation

SetState_FlatAirborne:
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
	ret nz
	ld a, [wTransformation]
	cp TRANSFORMATION_OWL_WARIO
	call z, ReleaseOwl

	push_wram BANK("Level Objects WRAM")
	ld a, [wObjPtr + 0]
	ld h, a
	ld a, [wObjPtr + 1]
	ld l, a
	ld de, OBJ_X_POS
	add hl, de
	ld b, $0
	ld a, [wObjInteractionType]
	and INTERACTION_MASK
	sub OBJ_INTERACTION_RICHTERTOFFEN
	jr z, .asm_2846a
	ld a, $01
	ld [wWarioStateCounter], a
	ld b, $8
	jr .got_x_offset
.asm_2846a
	ld [wWarioStateCounter], a
.got_x_offset
	ld a, [hli] ; OBJ_X_POS
	sub b
	ld [wWarioXPos + 1], a
	ld a, [hl]
	sbc $00
	ld [wWarioXPos + 0], a
	pop_wram

	ld a, TRANSFORMATION_FLAT_WARIO
	ld [wTransformation], a
	play_sfx SFX_01B
	call UpdateLevelMusic

	ld a, TOUCH_BUMP
	ld [wTouchState], a
	ld a, TOUCH_BUMP
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wJumpVelIndex], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a

	inc a
	ld [wAutoMoveState], a

	ld [wJumpVelTable], a
	ld a, WST_GETTING_FLAT_AIRBORNE
	ld [wWarioState], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -8
	ld [wCollisionBoxTop], a
	ld a, -11
	ld [wCollisionBoxLeft], a
	ld a, 11
	ld [wCollisionBoxRight], a
	ld a, BANK(WarioSlideGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioSlideGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioSlideGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_16e9d)
	ld [wOAMBank], a
	ld a, HIGH(OAM_16e9d)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_16e9d)
	ld [wOAMPtr + 1], a
	ld a, HIGH(Frameset_171bd)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_171bd)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_GettingFlatAirborne:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, SetState_FlatSinking
	ld b, $02
	call AddYOffset
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_28549
	jp TriggerDownwardsFloorTransition

.asm_28549
	call TriggerFloorTransition

	ld a, WST_GETTING_FLAT
	ld [wWarioState], a

	xor a
	ld [wWalkVelIndex], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCycles], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wAutoMoveState], a
	inc a ; TRUE
	ld [wIsIntangible], a

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -8
	ld [wCollisionBoxTop], a
	ld a, -11
	ld [wCollisionBoxLeft], a
	ld a, 11
	ld [wCollisionBoxRight], a

	ld a, HIGH(Frameset_1715f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1715f)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_GettingFlat:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wAnimationEnded]
	and a
	ret z
	xor a
	ld [wIsIntangible], a
	ld a, [wWarioStateCounter]
	and a
	jp nz, SetState_FlatSquished
;	fallthrough

SetState_FlatIdling:
	ld a, WST_FLAT_IDLING
	ld [wWarioState], a

	xor a
	ld [wWalkVelIndex], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -8
	ld [wCollisionBoxTop], a
	ld a, -11
	ld [wCollisionBoxLeft], a
	ld a, 11
	ld [wCollisionBoxRight], a

	ld a, HIGH(Frameset_1718b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1718b)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_FlatIdling:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	call Func_2b10a
	farcall CheckCentreCollision
	ld a, b
	and a
	ret nz
	jp SetState_FlatFalling

SetState_FlatWalking:
	ld a, WST_FLAT_WALKING
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWalkVelIndex], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

	ld a, HIGH(Frameset_17175)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17175)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

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

UpdateState_FlatWalking:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 10
	ld [wSFXLoopCounter], a
	play_sfx SFX_FLAT_WALK
.skip_sfx
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	call Func_2b11b
	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, SetState_FlatFalling

	update_pos_y
	ret

SetState_FlatJumping:
	play_sfx SFX_01D

	ld a, WST_FLAT_JUMPING
	ld [wWarioState], a

	xor a
	ld [wWalkVelIndex], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
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

	ld a, HIGH(Frameset_17190)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17190)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wIsOnSteppableObject]
	and a
	ret z
;	fallthrough

UpdateState_FlatJumping:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	call ApplyJumpVelocity
	call Func_2b17a
	call Func_1762
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, SetState_FlatFalling
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
;	fallthrough

SetState_FlatFalling:
	ld a, WST_FLAT_FALLING
	ld [wWarioState], a

	xor a
	ld [wWalkVelIndex], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wWarioSlopeInteraction], a
	inc a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld a, [wDirection]
	and a
	jr nz, .asm_28796

	ld a, HIGH(Frameset_171b8)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_171b8)
	ld [wFramesetPtr + 1], a
.asm_28786
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret
.asm_28796
	ld a, HIGH(Frameset_17186)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17186)
	ld [wFramesetPtr + 1], a
	jr .asm_28786

UpdateState_FlatFalling:
	farcall Func_19b25

	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, SetState_FlatSinking

	ld a, [wAnimationEnded]
	and a
	jr nz, .asm_287ff
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wAnimationEnded]
	and a
	jr z, .asm_287ff

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, HIGH(Frameset_17190)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17190)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, $01
	ld [wAnimationEnded], a
.asm_287ff
	ld hl, wWalkVelIndex
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
	call SubXOffset

.asm_28816
	ld a, [wWalkVelIndex]
	cp $28
	jr nc, .asm_28857
	farcall CheckFrontCollision
	ld a, b
	and a
	jp z, .asm_288b8
	play_sfx SFX_BUMP

	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a

	ld a, [wDirection]
	and a
	jr nz, .asm_2884e
	ld b, $03
	call SubXOffset
	jr .asm_28853
.asm_2884e
	ld b, $03
	call AddXOffset
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
	ld [wAnimationFrame], a
	ld [wAnimationEnded], a

	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	and a
	jr nz, .asm_2888e
	ld a, HIGH(Frameset_171b8)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_171b8)
	ld [wFramesetPtr + 1], a
	jr .asm_28898
.asm_2888e
	ld a, HIGH(Frameset_17186)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17186)
	ld [wFramesetPtr + 1], a
.asm_28898
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

.asm_288a7
	xor a
.asm_288a8
	ld [wWalkVelIndex], a
	pop de
	ret

.asm_288ad
	ld hl, Data_2b68c
	add hl, de
	ld b, [hl]
	call AddXOffset
	jp .asm_28816

.asm_288b8
	pop de
	ld hl, Data_2b664
	add hl, de
	ld b, [hl]
	call AddYOffset
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_288d7
	jp TriggerDownwardsFloorTransition
.asm_288d7
	play_sfx SFX_020
	call TriggerFloorTransition
	jp SetState_FlatIdling

UpdateState_FlatStretching:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wAnimationEnded]
	and a
	ret z
	xor a
	ld [wAutoMoveState], a
	jp RecoverFromTransformation

SetState_FlatSinking:
	ld a, WST_FLAT_SINKING
	ld [wWarioState], a

	xor a
	ld [wWalkVelIndex], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	inc a ; TRUE
	ld [wIsIntangible], a

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -8
	ld [wCollisionBoxTop], a
	ld a, -11
	ld [wCollisionBoxLeft], a
	ld a, 11
	ld [wCollisionBoxRight], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, HIGH(Frameset_1719a)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1719a)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_FlatSinking:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	farcall Func_19b25

	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wGlobalCounter]
	and %1111
	call z, .Func_2899a

	ld a, [wGlobalCounter]
	and %1
	ret nz
	ld b, $01
	call AddYOffset
	farcall CheckCentreCollision
	ld a, b
	and a
	ret z
	jr Func_289c5

.Func_2899a
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
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
	ld b, PARTICLE_BUBBLES
	farcall CreateParticle
	ret

Func_289c5:
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
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
	ld b, PARTICLE_BUBBLES
	farcall CreateParticle

	ld a, WST_FLAT_STRETCHING_UNDERWATER
	ld [wWarioState], a

	xor a
	ld [wWalkVelIndex], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -8
	ld [wCollisionBoxTop], a
	ld a, -11
	ld [wCollisionBoxLeft], a
	ld a, 11
	ld [wCollisionBoxRight], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, HIGH(Frameset_171a3)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_171a3)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_FlatStretchingUnderwater:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wAnimationEnded]
	and a
	ret z
	jp Func_2ad6a

SetState_FlatSquished:
	ld a, WST_FLAT_SQUISHED
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	ret

UpdateState_FlatSquished:
	ret

SetState_FlatSquishedLifting:
	ld a, TRUE
	ld [wIsIntangible], a
	ld a, WST_FLAT_SQUISHED_LIFTING
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, HIGH(Frameset_1716c)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1716c)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_FlatSquishedLifting:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld b, $01
	call SubYOffset
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $32
	ret c
	xor a
	ld [wIsIntangible], a
	jp SetState_FlatFalling

UpdateState_GettingWrappedInString:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	farcall CheckCentreCollision

	ld a, b
	and a
	jp z, Func_28c15
;	fallthrough

SetState_BallOString:
	ld a, WST_BALL_O_STRING
	ld [wWarioState], a
	ld a, 1
	ld [wWarioTransformationProgress], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wWalkVelIndex], a
	ld [wWarioStateCycles], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -24
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
	jr nz, .asm_28b2a
	ld a, HIGH(Frameset_1741f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1741f)
	ld [wFramesetPtr + 1], a
.asm_28b1a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret
.asm_28b2a
	ld a, HIGH(Frameset_173fe)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_173fe)
	ld [wFramesetPtr + 1], a
	jr .asm_28b1a

UpdateState_BallOString:
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

	ld a, [wDirection]
	and a
	jr nz, .asm_28b80
	call ApplyWalkVelocity_Left
	call SubXOffset
	jr .asm_28b86
.asm_28b80
	call ApplyWalkVelocity_Right
	call AddXOffset
.asm_28b86
	ld a, [wWalkVelIndex]
	cp $18
	jr c, .asm_28b92
	ld a, $14
	ld [wWalkVelIndex], a
.asm_28b92
	farcall CheckFrontCollision
	ld a, b
	and $0f
	jr nz, Func_28bd5
	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, Func_28c15

	update_pos_y
	ld a, [wWarioSlopeInteraction]
	and a
	ret z
	and $0f
	dec a
	ld b, a
	ld a, [wDirection]
	xor b
	jr nz, Func_28bd5
	ret

Func_28bd5: 
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
	ld a, HIGH(Frameset_1741f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1741f)
	ld [wFramesetPtr + 1], a
.asm_28bf6
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret
.asm_28c06
	ld a, HIGH(Frameset_173fe)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_173fe)
	ld [wFramesetPtr + 1], a
	jr .asm_28bf6

.asm_28c12
	jp SetState_BallOStringKnockBack

Func_28c15:
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_HIGH_JUMP
	ld [wJumpVelTable], a
	ld a, WST_BALL_O_STRING_AIRBORNE
	ld [wWarioState], a
	ret

UpdateState_BallOStringAirborne:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	farcall CheckFrontCollision
	ld a, b
	and $0f
	jp nz, Func_28bd5
	call ApplyJumpVelocity
	call HandleWalk
	ld a, [wWalkVelIndex]
	cp $18
	jr c, .asm_28c78
	ld a, $14
	ld [wWalkVelIndex], a
.asm_28c78
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_28c8e
	jp TriggerDownwardsFloorTransition
.asm_28c8e
	call TriggerFloorTransition
	jp SetState_BallOString

SetState_BallOStringKnockBack:
	xor a
	ld [wWarioTransformationProgress], a
	play_sfx SFX_BUMP
	ld a, WST_BALL_O_STRING_KNOCK_BACK
	ld [wWarioState], a
	ld a, $0a
	ld [wJumpVelIndex], a
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
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, HIGH(Frameset_1742a)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1742a)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_BallOStringKnockBack:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	call Func_2b1cc
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_28d22
	ret

.asm_28d22
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_28d38
	jp TriggerDownwardsFloorTransition

.asm_28d38
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	call TriggerFloorTransition
	play_sfx SFX_03C

	ld a, WST_GETTING_UNWRAPPED_IN_STRING
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
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, HIGH(Frameset_17409)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17409)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_GettingUnwrappedInString:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z

	play_sfx SFX_03D
	ld a, WST_BALL_O_STRING_DIZZY
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
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	inc a ; TRUE
	ld [wIsIntangible], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, BANK(WarioDizzyGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioDizzyGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioDizzyGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_17bbc)
	ld [wOAMBank], a
	ld a, HIGH(OAM_17bbc)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_17bbc)
	ld [wOAMPtr + 1], a
	ld a, HIGH(Frameset_17ce2)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17ce2)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_BallOStringDizzy:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	jp RecoverFromTransformation

SetState_FatBumping:
	ld a, WST_FAT_BUMPING
	ld [wWarioState], a
	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_28e64
	ld a, HIGH(Frameset_178fc)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_178fc)
	ld [wFramesetPtr + 1], a
.asm_28e54
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret
.asm_28e64
	ld a, HIGH(Frameset_17905)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17905)
	ld [wFramesetPtr + 1], a
	jr .asm_28e54

UpdateState_FatBumping:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	jp SetState_FatIdling

UpdateState_FatEating:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, Func_2926a
	ld a, [wJumpVelTable]
	and a
	jr z, .asm_28ecd
	call ApplyJumpVelocity
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_28ec3
	jp TriggerDownwardsFloorTransition

.asm_28ec3
	call TriggerFloorTransition
	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
.asm_28ecd
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
;	fallthrough

SetState_FatIdling:
	ld a, WST_FAT_IDLING
	ld [wWarioState], a
	ld a, TOUCH_ATTACK
	ld [wTouchState], a
	ld a, TOUCH_ATTACK
	ld [wStingTouchState], a
	ld a, $01
	ld [wca94], a

	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_28f2d
	ld a, HIGH(Frameset_1781c)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1781c)
	ld [wFramesetPtr + 1], a
.asm_28f1d
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret
.asm_28f2d
	ld a, HIGH(Frameset_1781f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1781f)
	ld [wFramesetPtr + 1], a
	jr .asm_28f1d

UpdateState_FatIdling:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	call Func_28f6d
	ld a, [wWarioState]
	cp WST_FAT_IDLING
	ret nz ; done if not fat idling anymore

	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, Func_290d6
	ret

Func_28f6d:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, Func_290a1
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jr nz, SetState_FatWalking
	ret

SetState_FatWalking:
	xor a
	ld [wWalkVelIndex], a
	ld a, WST_FAT_WALKING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wJumpVelIndex], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_28fb4
	ld a, HIGH(Frameset_17822)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17822)
	ld [wFramesetPtr + 1], a
.asm_28fa4
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret
.asm_28fb4
	ld a, HIGH(Frameset_1782b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1782b)
	ld [wFramesetPtr + 1], a
	jr .asm_28fa4

UpdateState_FatWalking:
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
	play_sfx SFX_FAT_WALK
.skip_sfx
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	call DecrementTransformationDuration
	ld hl, wTransformationDuration
	ld a, [hli]
	cp HIGH(FAT_WARIO_DURATION) + 1 ; in case it underflowed
	jp nc, SetState_FatRecovering
	or [hl]
	jp z, SetState_FatRecovering
	call Func_2b239
	ld a, [wWarioState]
	cp WST_FAT_WALKING
	ret nz ; done if not fat walking anymore
	farcall CheckCentreCollision

	ld a, b
	and a
	jp z, Func_290d6
	update_pos_y
	ret

SetState_FatTurning:
	ld a, WST_FAT_TURNING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_29061
	ld a, HIGH(Frameset_178f3)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_178f3)
	ld [wFramesetPtr + 1], a
.asm_29051
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret
.asm_29061
	ld a, HIGH(Frameset_178ea)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_178ea)
	ld [wFramesetPtr + 1], a
	jr .asm_29051

UpdateState_FatTurning:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, Func_290a1
	ld a, [wAnimationEnded]
	and a
	ret z
	jp SetState_FatWalking

Func_290a1:
	play_sfx SFX_JUMP

	xor a
	ld [wJumpVelIndex], a
	ld [wIsSmashAttacking], a
	ld [wWarioStateCounter], a
	ld a, $01
	ld [wJumpVelTable], a
	ld a, [wDirection]
	and a
	jr nz, .asm_290ca
	ld a, HIGH(Frameset_17834)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17834)
	ld [wFramesetPtr + 1], a
	jr .asm_290d4
.asm_290ca
	ld a, HIGH(Frameset_17839)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17839)
	ld [wFramesetPtr + 1], a
.asm_290d4
	jr SetState_FatAirborne

Func_290d6:
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, TRUE
	ld [wIsSmashAttacking], a
	ld [wWarioStateCounter], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a

	ld a, [wDirection]
	and a
	jr nz, .asm_290fa
	ld a, HIGH(Frameset_1783e)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1783e)
	ld [wFramesetPtr + 1], a
	jr SetState_FatAirborne
.asm_290fa
	ld a, HIGH(Frameset_17841)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17841)
	ld [wFramesetPtr + 1], a
;	fallthrough

SetState_FatAirborne:
	xor a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, WST_FAT_AIRBORNE
	ld [wWarioState], a
	ret

UpdateState_FatAirborne:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, Func_2926a
	call DecrementTransformationDuration
	ld hl, wTransformationDuration
	ld a, [hli]
	or [hl]
	jr nz, .asm_2914b
	inc [hl]
.asm_2914b
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_2919d
	ld a, [wAnimationEnded]
	and a
	jr z, .asm_2919d
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, $01
	ld [wWarioStateCounter], a
	ld a, [wDirection]
	and a
	jr nz, .asm_29184
	ld a, HIGH(Frameset_1783e)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1783e)
	ld [wFramesetPtr + 1], a
	jr .asm_2918e
.asm_29184
	ld a, HIGH(Frameset_17841)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17841)
	ld [wFramesetPtr + 1], a
.asm_2918e
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

.asm_2919d
	call Func_2b2a4
	ld a, [wWarioState]
	cp WST_FAT_AIRBORNE
	ret nz ; done if not fat airborne anymore

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_291c8
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp WST_FAT_AIRBORNE
	ret nz ; done if not fat airborne anymore
	jp Func_290d6

.asm_291c8
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_291de
	jp TriggerDownwardsFloorTransition
.asm_291de
	call TriggerFloorTransition
	ld a, [wGroundShakeCounter]
	and a
	jr nz, .asm_291f1
	ld a, $20
	ld [wGroundShakeCounter], a
	ld a, TRUE
	ld [wIsWarioGroundShaking], a
.asm_291f1
	ld a, [wFloorTransitionDir]
	and a
	jr nz, SetState_FatLanding
	play_sfx SFX_024
;	fallthrough

SetState_FatLanding:
	ld a, WST_FAT_LANDING
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
	jr nz, .asm_29229
	ld a, HIGH(Frameset_17872)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17872)
	ld [wFramesetPtr + 1], a
	jr .asm_29233
.asm_29229
	ld a, HIGH(Frameset_17887)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17887)
	ld [wFramesetPtr + 1], a
.asm_29233
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_FatLanding:
	call DecrementTransformationDuration
	ld hl, wTransformationDuration
	ld a, [hli]
	cp $02
	jp nc, SetState_FatRecovering
	or [hl]
	jp z, SetState_FatRecovering
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wGroundShakeCounter]
	and a
	ret nz
	jp SetState_FatIdling

Func_2926a:
	get_pos
	ldh a, [hYPosLo]
	and $f0
	ldh [hYPosLo], a
	ld b, PARTICLE_SPLASH
	farcall CreateParticle
	play_sfx SFX_SPLASH

	ld a, WST_FAT_SINKING
	ld [wWarioState], a
	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ld [wIsSmashAttacking], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	inc a ; TRUE
	ld [wIsIntangible], a

	ld a, [wDirection]
	and a
	jr nz, .asm_292cb
	ld a, HIGH(Frameset_17872)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17872)
	ld [wFramesetPtr + 1], a
	jr .asm_292d5
.asm_292cb
	ld a, HIGH(Frameset_17887)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17887)
	ld [wFramesetPtr + 1], a
.asm_292d5
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_FatSinking:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wGlobalCounter]
	and %1111
	call z, Func_29317
	ld b, $01
	call AddYOffset
	farcall CheckCentreCollision
	ld a, b
	and a
	ret z
	call Func_2ad6a
	ret

Func_29317:
	ld a, [wDirection]
	and a
	jr nz, .asm_29338
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
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
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
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
	ld b, PARTICLE_BUBBLES
	farcall CreateParticle
	ret

SetState_FatRecovering:
	ld a, WST_FAT_RECOVERING
	ld [wWarioState], a
	ld a, TOUCH_BUMP
	ld [wTouchState], a
	ld a, TOUCH_BUMP
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a

	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ld [wIsSmashAttacking], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_2939f
	ld a, HIGH(Frameset_17844)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17844)
	ld [wFramesetPtr + 1], a
	jr .asm_293a9
.asm_2939f
	ld a, HIGH(Frameset_1785b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1785b)
	ld [wFramesetPtr + 1], a
.asm_293a9
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_FatRecovering:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	jp RecoverFromTransformation

UpdateState_ElectricStart:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wAnimationEnded]
	and a
	ret z

	ld a, $01
	ld [wInvincibleCounter], a
	ld a, WST_ELECTRIC
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, $06
	ld [wJumpVelIndex], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ld a, [wIsCrouching]
	and a
	jr z, .asm_2946e
	ld a, -27
	ld [wCollisionBoxTop], a
	ldh a, [hYPosHi]
	ldh [hYPosHiBackup], a
	ldh a, [hYPosLo]
	ldh [hYPosLoBackup], a
	ldh a, [hXPosHi]
	ldh [hXPosHiBackup], a
	ldh a, [hXPosLo]
	ldh [hXPosLoBackup], a
	farcall CheckUpCollision
	ld a, [wWarioState]
	cp WST_ELECTRIC
	ret nz
	ld a, b
	and a
	jr nz, .asm_2947a

	xor a
	ld [wIsCrouching], a

	ldh a, [hYPosHiBackup]
	ldh [hYPosHi], a
	ldh a, [hYPosLoBackup]
	ldh [hYPosLo], a
	ldh a, [hXPosHiBackup]
	ldh [hXPosHi], a
	ldh a, [hXPosLoBackup]
	ldh [hXPosLo], a
.asm_2946e
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, $01
	ld [wJumpVelTable], a
	jr .asm_29493
.asm_2947a
	ld a, -15
	ld [wCollisionBoxTop], a
	xor a
	ld [wJumpVelTable], a
	ldh a, [hYPosHiBackup]
	ldh [hYPosHi], a
	ldh a, [hYPosLoBackup]
	ldh [hYPosLo], a
	ldh a, [hXPosHiBackup]
	ldh [hXPosHi], a
	ldh a, [hXPosLoBackup]
	ldh [hXPosLo], a

.asm_29493
	ld a, [wDirection]
	and a
	jr nz, .asm_294a5
	ld a, HIGH(Frameset_17b8d)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17b8d)
	ld [wFramesetPtr + 1], a
	jr .asm_294af
.asm_294a5
	ld a, HIGH(Frameset_17b7c)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17b7c)
	ld [wFramesetPtr + 1], a
.asm_294af
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_Electric:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	farcall CheckFrontCollision
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
	call SubXOffset
	jr .asm_29534

.asm_29513
	ld b, $01
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_2951d
	inc b
.asm_2951d
	call AddXOffset
	jr .asm_29534

.asm_29522
	ld a, [wDirection]
	and a
	jr nz, .asm_2952f
	ld b, $01
	call AddXOffset
	jr .asm_29534
.asm_2952f
	ld b, $01
	call SubXOffset
.asm_29534
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_29562
	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp MAX_JUMP_VEL_INDEX
	jp nc, .asm_295d8
	farcall CheckCentreCollision
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
	jr .asm_29562

.falling
	ld b, [hl]
	call AddYOffset
	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp MAX_JUMP_VEL_INDEX
	jr c, .asm_295a3
	ld [hl], MAX_JUMP_VEL_INDEX
.asm_295a3
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_295b9
	jp TriggerDownwardsFloorTransition
.asm_295b9
	call TriggerFloorTransition
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
	play_sfx SFX_041

	ld a, [wDirection]
	and a
	jr nz, .asm_29601
	ld hl, wWarioXPos + 1
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
	sub $20
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr .asm_2961a

.asm_29601
	ld hl, wWarioXPos + 1
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
	sub $20
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
.asm_2961a
	ld b, PARTICLE_SMOKE_SMALL
	farcall CreateParticle

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a

	ld a, WST_ELECTRIC_DIZZY
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_29658
	ld a, HIGH(Frameset_17b9e)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17b9e)
	ld [wFramesetPtr + 1], a
	jr .asm_29662
.asm_29658
	ld a, HIGH(Frameset_17bad)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17bad)
	ld [wFramesetPtr + 1], a
.asm_29662
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_ElectricDizzy:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	jp RecoverFromTransformation

SetState_TurningInvisible:
	play_sfx SFX_03F

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a

	inc a ; TRUE
	ld [wIsIntangible], a

	ld a, WST_TURNING_INVISIBLE
	ld [wWarioState], a

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	xor a ; TOUCH_NONE
	ld [wTouchState], a
	ld [wStingTouchState], a
	ld [wca94], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld hl, WarioDefaultPal
	call SetWarioPal

	ld a, BANK(WarioDizzyGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioDizzyGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioDizzyGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx

	ld a, BANK(OAM_17cf7)
	ld [wOAMBank], a
	ld a, HIGH(OAM_17cf7)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_17cf7)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_29714
	ld a, HIGH(Frameset_17e1b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17e1b)
	ld [wFramesetPtr + 1], a
	jr .asm_2971e
.asm_29714
	ld a, HIGH(Frameset_17e3a)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17e3a)
	ld [wFramesetPtr + 1], a
.asm_2971e
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_TurningInvisible:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	xor a
	ld [wIsIntangible], a
	ld a, TRANSFORMATION_INVISIBLE_WARIO
	ld [wTransformation], a
	call UpdateLevelMusic
	farcall SetState_Idling
	ret

SetState_PuffyInflating:
	ld a, TRANSFORMATION_PUFFY_WARIO
	ld [wTransformation], a

	ld a, TOUCH_VULNERABLE
	ld [wStingTouchState], a
	ld a, TOUCH_BUMP
	ld [wTouchState], a
	ld a, $01
	ld [wca94], a

	play_sfx SFX_025

	ld a, WST_PUFFY_INFLATING
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
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	ld [wSwimVelIndex], a
	ld [wWaterSurfaceFloatingCounter], a
	ld [wWaterCurrent], a
	ld [wLastWaterCurrent], a
	ld [wCurWaterCurrent], a
	call UpdateLevelMusic

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, BANK(WarioPuffyGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioPuffyGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioPuffyGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx

	ld a, BANK(OAM_1dc93f)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1dc93f)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1dc93f)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_297fb
	ld a, HIGH(Frameset_1dccc0)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1dccc0)
	ld [wFramesetPtr + 1], a
	jr .asm_29805
.asm_297fb
	ld a, HIGH(Frameset_1dccc9)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1dccc9)
	ld [wFramesetPtr + 1], a
.asm_29805
	ld a, [wOAMBank]
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_PuffyInflating:
	ld a, [wOAMBank]
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wAnimationEnded]
	and a
	ret z
;	fallthrough

SetState_PuffyRising:
	ld a, WST_PUFFY_RISING
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	inc a
	ld [wJumpVelTable], a

	ld hl, WarioDefaultPal
	call SetWarioPal

	ld a, [wDirection]
	and a
	jr nz, .asm_29856
	ld a, HIGH(Frameset_1dcd4e)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1dcd4e)
	ld [wFramesetPtr + 1], a
	jr .asm_29860
.asm_29856
	ld a, HIGH(Frameset_1dcd57)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1dcd57)
	ld [wFramesetPtr + 1], a
.asm_29860
	ld a, [wOAMBank]
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_PuffyRising:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 32
	ld [wSFXLoopCounter], a
	play_sfx SFX_PUFF_RAISE
.skip_sfx

	ld a, [wOAMBank]
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	call Func_2b2c2
	ret

SetState_PuffyTurning:
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a

	ld a, WST_PUFFY_TURNING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_298d8
	ld a, HIGH(Frameset_1dcce3)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1dcce3)
	ld [wFramesetPtr + 1], a
	jr .asm_298e2
.asm_298d8
	ld a, HIGH(Frameset_1dccd8)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1dccd8)
	ld [wFramesetPtr + 1], a
.asm_298e2
	ld a, [wOAMBank]
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_PuffyTurning:
	ld a, [wOAMBank]
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	call Func_2b342
	farcall CheckUpCollision

	ld a, [wWarioState]
	cp WST_PUFFY_TURNING
	ret nz ; done if not puffy turning any more

	ld a, b
	and a
	jr z, .asm_29922
	jp SetState_PuffyDeflating

.asm_29922
	ld a, [wAnimationEnded]
	and a
	ret z
	jp SetState_PuffyRising

SetState_PuffyDeflating:
	play_sfx SFX_027

	ld a, WST_PUFFY_DEFLATING
	ld [wWarioState], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	inc a ; TRUE
	ld [wIsIntangible], a

	ld a, [wDirection]
	and a
	jr nz, .asm_2995a
	ld a, HIGH(Frameset_1dccee)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1dccee)
	ld [wFramesetPtr + 1], a
	jr .asm_29964
.asm_2995a
	ld a, HIGH(Frameset_1dcd1e)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1dcd1e)
	ld [wFramesetPtr + 1], a
.asm_29964
	ld a, [wOAMBank]
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_PuffyDeflating:
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_299b8

	ld a, [wOAMBank]
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, $01
	ld [wWarioStateCounter], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_299ae
	ld a, HIGH(Frameset_1dcd01)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1dcd01)
	ld [wFramesetPtr + 1], a
	jr .asm_299b8
.asm_299ae
	ld a, HIGH(Frameset_1dcd31)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1dcd31)
	ld [wFramesetPtr + 1], a
.asm_299b8
	ld a, [wOAMBank]
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wAnimationEnded]
	and a
	ret z
	jp RecoverFromTransformation

SetState_ZombieIdling:
	ld a, WST_ZOMBIE_IDLING
	ld [wWarioState], a

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	ld a, TOUCH_VANISH
	ld [wTouchState], a
	ld a, TOUCH_VANISH
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wInvisibleFrame], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	call UpdateLevelMusic

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld hl, WarioZombiePal
	call SetWarioPal

	ld a, BANK(WarioZombieGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioZombieGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioZombieGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1fc48b)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1fc48b)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1fc48b)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_29a5a
	ld a, HIGH(Frameset_1fc8b6)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc8b6)
	ld [wFramesetPtr + 1], a
	jr .asm_29a64
.asm_29a5a
	ld a, HIGH(Frameset_1fc8b9)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc8b9)
	ld [wFramesetPtr + 1], a
.asm_29a64
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_ZombieIdling:
	farcall Func_19b25
	ld a, [wWarioState]
	cp WST_ZOMBIE_IDLING
	ret nz ; done if not zombie idling anymore

	farcall CheckCentreCollision
	ld a, [wWarioState]
	cp WST_ZOMBIE_IDLING
	ret nz ; done if not zombie idling anymore

	ld a, b
	and a
	jp z, Func_29bb9
	update_pos_y
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	call Func_2b34e
	ret

SetState_ZombieWalking:
	xor a
	ld [wSFXLoopCounter], a
	ld [wWalkVelIndex], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a

	ld a, WST_ZOMBIE_WALKING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_29aec
	ld a, HIGH(Frameset_1fc870)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc870)
	ld [wFramesetPtr + 1], a
	jr .asm_29af6
.asm_29aec
	ld a, HIGH(Frameset_1fc879)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc879)
	ld [wFramesetPtr + 1], a
.asm_29af6
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_ZombieWalking:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 36
	ld [wSFXLoopCounter], a
	play_sfx SFX_ZOMBIE_WALK
.skip_sfx
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	call Func_2b381

	ld a, [wWarioState]
	cp WST_ZOMBIE_WALKING
	ret nz ; done if not zombie walking anymore

	farcall CheckCentreCollision
	ld a, b
	and a
	jr z, Func_29bb9

	update_pos_y
	ret

SetState_ZombieTurning:
	ld a, WST_ZOMBIE_TURNING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_29b88
	ld a, HIGH(Frameset_1fc89d)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc89d)
	ld [wFramesetPtr + 1], a
	jr .asm_29b92
.asm_29b88
	ld a, HIGH(Frameset_1fc894)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc894)
	ld [wFramesetPtr + 1], a
.asm_29b92
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_ZombieTurning:
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	jp SetState_ZombieWalking

Func_29bb9:
	ld a, [wDirection]
	and a
	jr nz, .asm_29bcb
	ld a, HIGH(Frameset_1fc8b0)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc8b0)
	ld [wFramesetPtr + 1], a
	jr .asm_29bd5
.asm_29bcb
	ld a, HIGH(Frameset_1fc8b3)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc8b3)
	ld [wFramesetPtr + 1], a

.asm_29bd5
	ld a, $01
	ld [wWarioStateCounter], a
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	jr SetState_ZombieAirborne

Func_29be1:
	ld a, [wDirection]
	and a
	jr nz, .asm_29bf3
	ld a, HIGH(Frameset_1fc8a6)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc8a6)
	ld [wFramesetPtr + 1], a
	jr .asm_29bfd
.asm_29bf3
	ld a, HIGH(Frameset_1fc8ab)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc8ab)
	ld [wFramesetPtr + 1], a

.asm_29bfd
	xor a
	ld [wWarioStateCounter], a
	ld [wJumpVelIndex], a
;	fallthrough

SetState_ZombieAirborne:
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a
	xor a
	ld [wWarioStateCycles], a
	ld a, WST_ZOMBIE_AIRBORNE
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_ZombieAirborne:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	ld a, [wWarioState]
	cp WST_ZOMBIE_AIRBORNE
	ret nz ; done if not zombie airborne anymore

	call Func_2b3dd
	ld a, [wWarioState]
	cp WST_ZOMBIE_AIRBORNE
	ret nz ; done if not zombie airborne anymore

	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_29c88
	ld a, [wAnimationEnded]
	and a
	jr z, .asm_29c88
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	inc a
	ld [wWarioStateCounter], a

	ld a, [wDirection]
	and a
	jr nz, .asm_29c7e
	ld a, HIGH(Frameset_1fc8b0)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc8b0)
	ld [wFramesetPtr + 1], a
	jr .asm_29c88
.asm_29c7e
	ld a, HIGH(Frameset_1fc8b3)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc8b3)
	ld [wFramesetPtr + 1], a
.asm_29c88
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wWarioState]
	cp WST_ZOMBIE_AIRBORNE
	ret nz ; done if not zombie airborne anymore

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_29cbf
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp WST_ZOMBIE_AIRBORNE
	ret nz ; done if not zombie airborne anymore
	jp Func_29bb9

.asm_29cbf
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_29cd5
	jp TriggerDownwardsFloorTransition
.asm_29cd5
	call TriggerFloorTransition
	ld a, [wWarioState]
	cp WST_ZOMBIE_AIRBORNE
	ret nz ; done if not zombie airborne anymore
;	fallthrough

SetState_ZombieLanding:
	play_sfx SFX_02A

	ld a, TOUCH_BUMP
	ld [wTouchState], a
	ld a, TOUCH_BUMP
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a

	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a

	ld a, WST_ZOMBIE_LANDING
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	farcall Func_19a77
	ld a, [wc1ca]
	and a
	jr z, .asm_29d43

	ld a, $01
	ld [wWarioStateCounter], a

	ld a, [wDirection]
	and a
	jr nz, .asm_29d37
	ld a, HIGH(Frameset_1fc8bc)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc8bc)
	ld [wFramesetPtr + 1], a
	jr .asm_29d5f
.asm_29d37
	ld a, HIGH(Frameset_1fc8d5)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc8d5)
	ld [wFramesetPtr + 1], a
	jr .asm_29d5f

.asm_29d43
	ld a, [wDirection]
	and a
	jr nz, .asm_29d55
	ld a, HIGH(Frameset_1fc948)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc948)
	ld [wFramesetPtr + 1], a
	jr .asm_29d5f
.asm_29d55
	ld a, HIGH(Frameset_1fc953)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc953)
	ld [wFramesetPtr + 1], a
.asm_29d5f
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_ZombieLanding:
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
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

	ld a, WST_ZOMBIE_SLIPPING_THROUGH_FLOOR
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_29db9
	ld a, HIGH(Frameset_1fc928)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc928)
	ld [wFramesetPtr + 1], a
	jr .asm_29dc3
.asm_29db9
	ld a, HIGH(Frameset_1fc92b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc92b)
	ld [wFramesetPtr + 1], a
.asm_29dc3
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_ZombieSlippingThroughFloor:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	ld a, [wWarioState]
	cp WST_ZOMBIE_SLIPPING_THROUGH_FLOOR
	ret nz ; done if not slipping through floor anymore

	call Func_2b3dd
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wWarioState]
	cp WST_ZOMBIE_SLIPPING_THROUGH_FLOOR
	ret nz ; done if not slipping through floor anymore

	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_29e2a
	ld a, [wWarioState]
	cp WST_ZOMBIE_SLIPPING_THROUGH_FLOOR
	ret nz ; done if not slipping through floor anymore
	jp TriggerDownwardsFloorTransition

.asm_29e2a
	call TriggerFloorTransition
	ld a, [wWarioState]
	cp WST_ZOMBIE_SLIPPING_THROUGH_FLOOR
	ret nz ; done if not slipping through floor anymore

	call SetState_ZombieLanding

	ld a, [wDirection]
	and a
	jr nz, .asm_29e48
	ld a, HIGH(Frameset_1fc8ee)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc8ee)
	ld [wFramesetPtr + 1], a
	jr .asm_29e52
.asm_29e48
	ld a, HIGH(Frameset_1fc90b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc90b)
	ld [wFramesetPtr + 1], a
.asm_29e52
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wAnimationEnded], a
	ld a, $02
	ld [wWarioStateCounter], a
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

SetState_ZombieRecovering:
	ld a, WST_ZOMBIE_RECOVERING
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ret

UpdateState_ZombieRecovering:
	ld a, [wGlobalCounter]
	and %11
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
	ld hl, WarioZombiePal
	add hl, de
	call SetWarioPal
	ret

.asm_29ea5
	jp RecoverFromTransformation

SetState_ZombieKnockBack:
	ld a, [wWarioState]
	cp WST_ZOMBIE_KNOCK_BACK
	ret z
	cp WST_ZOMBIE_SLIPPING_THROUGH_FLOOR
	ret z
	cp WST_ZOMBIE_LANDING
	ret z

	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld a, WST_ZOMBIE_KNOCK_BACK
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_29ed9
	ld a, HIGH(Frameset_1fc92e)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc92e)
	ld [wFramesetPtr + 1], a
	jr .asm_29ee3
.asm_29ed9
	ld a, HIGH(Frameset_1fc93b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc93b)
	ld [wFramesetPtr + 1], a
.asm_29ee3
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_ZombieKnockBack:
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	jp SetState_ZombieIdling

SetState_ZombieWrithing:
	ld a, WST_ZOMBIE_WRITHING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_29f28
	ld a, HIGH(Frameset_1fc882)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc882)
	ld [wFramesetPtr + 1], a
	jr .asm_29f32
.asm_29f28
	ld a, HIGH(Frameset_1fc88b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc88b)
	ld [wFramesetPtr + 1], a
.asm_29f32
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_ZombieWrithing:
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wJoypadDown]
	and a
	jp nz, SetState_ZombieIdling
	ret

SetState_BouncyStart:
	ld a, WST_BOUNCY_START
	ld [wWarioState], a
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, $02
	ld [wJumpVelTable], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -29
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	xor a
	ld [wInvisibleFrame], a
	ld [wWalkVelIndex], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	call UpdateLevelMusic

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld hl, WarioBouncyPal
	call SetWarioPal

	ld a, BANK(WarioBouncyGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioBouncyGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioBouncyGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx

	ld a, BANK(OAM_1fc95e)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1fc95e)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1fc95e)
	ld [wOAMPtr + 1], a

	ld a, HIGH(Frameset_1fcc6c)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fcc6c)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	farcall Func_197b1
	ld a, b
	and a
	ret z
	ld b, $02
	call AddXOffset
	ret

UpdateState_BouncyStart:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	call ApplyJumpVelocity
	call HandleWalk
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_2a029
	ld a, $04
	ld [wWalkVelIndex], a

.asm_2a029
	ld a, [wWarioState]
	cp WST_BOUNCY_START
	ret nz ; done if not bouncy start anymore

	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_2a04b
	ld a, [wWarioState]
	cp WST_BOUNCY_START
	ret nz ; done if not bouncy start anymore
	jp TriggerDownwardsFloorTransition

.asm_2a04b
	call TriggerFloorTransition
	ld a, [wWarioState]
	cp WST_BOUNCY_START
	ret nz ; done if not bouncy start anymore
;	fallthrough

SetState_BouncyFloor:
	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWalkVelIndex], a
	ld a, WST_BOUNCY_FLOOR
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, HIGH(Frameset_1fcc5f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fcc5f)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_BouncyFloor:
	call DecrementTransformationDuration
	ld hl, wTransformationDuration
	ld a, [hli]
	or [hl]
	jp z, Func_2a2e7
	call Func_2ae3b
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wAnimationEnded]
	and a
	ret z

	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jr nz, Func_2a0bb
	jr Func_2a0c2

Func_2a0b2:
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jr nz, Func_2a0bb
	jr Func_2a0c2

Func_2a0bb:
	ld a, JUMP_VEL_BOUNCY_HIGH_JUMP
	ld [wJumpVelTable], a
	jr Func_2a0c7

Func_2a0c2:
	ld a, JUMP_VEL_BOUNCY_JUMP
	ld [wJumpVelTable], a
;	fallthrough

Func_2a0c7:
	xor a
	ld [wJumpVelIndex], a
;	fallthrough

SetState_BouncyAirborne:
	ld a, WST_BOUNCY_AIRBORNE
	ld [wWarioState], a
	play_sfx SFX_02B

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, HIGH(Frameset_1fcc6c)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fcc6c)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_BouncyAirborne:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	ld a, [wAnimationEnded]
	and a
	jr nz, .asm_2a15a
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wJumpVelTable]
	cp JUMP_VEL_BOUNCY_HIGH_JUMP
	jr nz, .asm_2a15a
	ld a, [wAnimationEnded]
	and a
	jr z, .asm_2a15a

	get_pos
	ld b, PARTICLE_BOUNCY_JUMP
	farcall CreateParticle

.asm_2a15a
	call DecrementTransformationDuration
	ld hl, wTransformationDuration
	ld a, [hli]
	or [hl]
	jp z, SetState_BouncyUpsideDown
	call Func_2ae3b
	call ApplyJumpVelocity
	call Func_2b17a
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_2a17a
	ld a, $04
	ld [wWalkVelIndex], a
.asm_2a17a
	ld a, [wWarioState]
	cp WST_BOUNCY_AIRBORNE
	ret nz ; done if not bouncy airborne any more

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .falling

; rising
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp WST_BOUNCY_AIRBORNE
	ret nz ; done if not bouncy airborne any more

	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	jr .asm_2a1ce

.falling
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_2a1c2
	ld a, [wWarioState]
	cp WST_BOUNCY_AIRBORNE
	ret nz ; done if not bouncy airborne any more
	jp TriggerDownwardsFloorTransition

.asm_2a1c2
	call TriggerFloorTransition
	ld a, [wWarioState]
	cp WST_BOUNCY_AIRBORNE
	ret nz ; done if not bouncy airborne any more
	jp SetState_BouncyFloor

.asm_2a1ce
	xor a
	ld a, WST_BOUNCY_CEILING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, HIGH(Frameset_1fcc75)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fcc75)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_BouncyCeiling:
	call DecrementTransformationDuration
	ld hl, wTransformationDuration
	ld a, [hli]
	or [hl]
	jr z, SetState_BouncyUpsideDown
	call Func_2ae3b
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	jp SetState_BouncyAirborne

SetState_BouncyUpsideDown:
	ld a, WST_BOUNCY_UPSIDE_DOWN
	ld [wWarioState], a
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a

	xor a
	ld [wWarioStateCycles], a

	ld a, TOUCH_PASS_THROUGH
	ld [wTouchState], a
	ld a, TOUCH_PASS_THROUGH
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld hl, WarioBouncyPal
	call SetWarioPal

	ld a, HIGH(Frameset_1fcc82)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fcc82)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_BouncyUpsideDown:
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
	jr nz, .asm_2a29d
	jp TriggerDownwardsFloorTransition

.asm_2a29d
	call TriggerFloorTransition
	ld a, [wWarioState]
	cp WST_BOUNCY_UPSIDE_DOWN
	ret nz ; done if not bouncy upside down

	ld a, WST_BOUNCY_UPSIDE_DOWN_LANDING
	ld [wWarioState], a
	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, HIGH(Frameset_1fcc85)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fcc85)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_BouncyUpsideLanding:
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
;	fallthrough

Func_2a2e7:
	ld a, TOUCH_PASS_THROUGH
	ld [wTouchState], a
	ld a, TOUCH_PASS_THROUGH
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a

	ld hl, WarioBouncyPal
	call SetWarioPal

	ld a, [wDirection]
	and a
	jr nz, .asm_2a30e
	ld a, HIGH(Frameset_1fccbf)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fccbf)
	ld [wFramesetPtr + 1], a
	jr .asm_2a318
.asm_2a30e
	ld a, HIGH(Frameset_1fccb2)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fccb2)
	ld [wFramesetPtr + 1], a
.asm_2a318
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	jr SetState_BouncyLastBounce

	ld a, [wDirection]
	and a
	jr nz, .asm_2a333
	ld a, HIGH(Frameset_1fcca5)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fcca5)
	ld [wFramesetPtr + 1], a
	jr .asm_2a33d
.asm_2a333
	ld a, HIGH(Frameset_1fcc98)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fcc98)
	ld [wFramesetPtr + 1], a
.asm_2a33d
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
;	fallthrough

SetState_BouncyLastBounce:
	ld a, WST_BOUNCY_LAST_BOUNCE
	ld [wWarioState], a
	xor a
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_BouncyLastBounce:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	ld a, [wAnimationEnded]
	and a
	jr nz, .asm_2a394
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

.asm_2a394
	call ApplyJumpVelocity
	call HandleWalk
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_2a3a6
	ld a, $04
	ld [wWalkVelIndex], a
.asm_2a3a6
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_2a3cb
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp WST_BOUNCY_LAST_BOUNCE
	ret nz ; done if not in last bouncy any more

	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ret

.asm_2a3cb
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_2a3e1
	jp TriggerDownwardsFloorTransition

.asm_2a3e1
	call TriggerFloorTransition
	ld a, [wWarioState]
	cp WST_BOUNCY_LAST_BOUNCE
	ret nz ; done if not in last bouncy any more
	jp RecoverFromTransformation

SetState_CrazySpinning:
	play_sfx SFX_042
	ld a, WST_CRAZY_SPINNING
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
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a

	ld a, [wJumpVelTable]
	and a
	jr z, .asm_2a42f
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
.asm_2a42f
	call UpdateLevelMusic

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

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

	ld a, [wObjDirection]
	ld [wDirection], a
	and a
	jr nz, .asm_2a46f
	ld a, HIGH(Frameset_14ccc)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14ccc)
	ld [wFramesetPtr + 1], a
	jr .asm_2a479
.asm_2a46f
	ld a, HIGH(Frameset_14ce1)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14ce1)
	ld [wFramesetPtr + 1], a
.asm_2a479
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_CrazySpinning:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation

	ld a, [wJumpVelTable]
	and a
	jr z, .asm_2a4cf
	call ApplyJumpVelocity
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_2a4c5
	jp TriggerDownwardsFloorTransition

.asm_2a4c5
	call TriggerFloorTransition
	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
.asm_2a4cf
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $80
	ret c
	ld [hl], $00

	play_sfx SFX_043
	ld a, WST_CRAZY_DIZZY
	ld [wWarioState], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, BANK(WarioDizzyGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioDizzyGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioDizzyGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_17bbc)
	ld [wOAMBank], a
	ld a, HIGH(OAM_17bbc)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_17bbc)
	ld [wOAMPtr + 1], a

	ld a, HIGH(Frameset_17ce2)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17ce2)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_CrazyDizzy:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
;	fallthrough

SetState_Crazy:
	play_sfx SFX_043
	ld a, WST_CRAZY
	ld [wWarioState], a

	ld a, TOUCH_BUMP
	ld [wTouchState], a
	ld a, TOUCH_VULNERABLE
	ld [wStingTouchState], a
	ld a, $01
	ld [wca94], a

	xor a
	ld [wWalkVelIndex], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, BANK(WarioCrazyGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioCrazyGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioCrazyGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	
	ld a, BANK(OAM_1fccd5)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1fccd5)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1fccd5)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_2a5be
	ld a, HIGH(Frameset_1fcf9f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fcf9f)
	ld [wFramesetPtr + 1], a
	jr .asm_2a5c8
.asm_2a5be
	ld a, HIGH(Frameset_1fcf6e)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fcf6e)
	ld [wFramesetPtr + 1], a
.asm_2a5c8
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_Crazy:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	call Func_2b3f9
	ld a, [wWarioState]
	cp WST_CRAZY
	ret nz ; done if not crazy any more

	farcall CheckCentreCollision
	ld a, b
	and a
	jr z, Func_2a67b
	ret

SetState_CrazyTurning:
	ld a, WST_CRAZY_TURNING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	and a
	jr nz, .asm_2a63d
	ld a, HIGH(Frameset_1fcfd0)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fcfd0)
	ld [wFramesetPtr + 1], a
	jr .asm_2a647
.asm_2a63d
	ld a, HIGH(Frameset_1fcfd7)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fcfd7)
	ld [wFramesetPtr + 1], a
.asm_2a647
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_CrazyTurning:
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, Func_2a675
	ld a, [wAnimationEnded]
	and a
	ret z
	jp SetState_Crazy

Func_2a675:
	xor a
	ld [wJumpVelIndex], a
	jr SetState_CrazyAirborne

Func_2a67b:
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
;	fallthrough

SetState_CrazyAirborne:
	ld a, WST_CRAZY_AIRBORNE
	ld [wWarioState], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a

	xor a
	ld [wWalkVelIndex], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_2a6a6
	ld a, HIGH(Frameset_1fcf9f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fcf9f)
	ld [wFramesetPtr + 1], a
	jr .asm_2a6b0
.asm_2a6a6
	ld a, HIGH(Frameset_1fcf6e)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fcf6e)
	ld [wFramesetPtr + 1], a
.asm_2a6b0
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_CrazyAirborne:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	call ApplyJumpVelocity
	call HandleWalk
	ld a, [wWalkVelIndex]
	cp $10
	jr c, .asm_2a6fe
	ld a, $0c
	ld [wWalkVelIndex], a
.asm_2a6fe
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .falling
; rising
	farcall CheckUpCollision
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
	jr nz, .asm_2a733
	jp TriggerDownwardsFloorTransition
.asm_2a733
	call TriggerFloorTransition
	jp SetState_Crazy

SetState_VampireIdling:
	ld a, WST_VAMPIRE_IDLING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, BANK(WarioVampireGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioVampireGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioVampireGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, HIGH(OAM_1fd498)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1fd498)
	ld [wOAMPtr + 1], a
	ld a, HIGH(Frameset_1fd81c)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fd81c)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_VampireIdling:
	farcall CheckCentreCollision
	ld a, [wWarioState]
	cp WST_VAMPIRE_IDLING
	ret nz ; done if not vampire idling any more

	ld a, b
	and a
	jp z, Func_2a8a7
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	call Func_2b4f3
	ret

SetState_VampireWalking:
	ld a, WST_VAMPIRE_WALKING
	ld [wWarioState], a

	xor a
	ld [wWalkVelIndex], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

	ld a, [wJoypadDown]
	bit D_LEFT_F, a
	jr nz, .asm_2a7d4
	bit D_RIGHT_F, a
	jr nz, .asm_2a7e5

	ld a, [wDirection]
	and a
	jr nz, .asm_2a7e5
.asm_2a7d4
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	ld a, HIGH(Frameset_1fd825)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fd825)
	ld [wFramesetPtr + 1], a
	jr .asm_2a7f4
.asm_2a7e5
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	ld a, HIGH(Frameset_1fd82e)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fd82e)
	ld [wFramesetPtr + 1], a
.asm_2a7f4
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_VampireWalking:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWarioState]
	cp WST_VAMPIRE_WALKING
	ret nz ; done if not vampire walking any more

	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	call Func_2b509
	ld a, [wWarioState]
	cp WST_VAMPIRE_WALKING
	ret nz ; done if not vampire walking any more

	farcall CheckCentreCollision

	ld a, [wWarioState]
	cp WST_VAMPIRE_WALKING
	ret nz ; done if not vampire walking any more

	ld a, b
	and a
	ret nz
	jp Func_2a8a7

SetState_VampireTurning:
	ld a, WST_VAMPIRE_TURNING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	and a
	jr nz, .asm_2a876
	ld a, HIGH(Frameset_1fd841)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fd841)
	ld [wFramesetPtr + 1], a
	jr .asm_2a880
.asm_2a876
	ld a, HIGH(Frameset_1fd83a)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fd83a)
	ld [wFramesetPtr + 1], a
.asm_2a880
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_VampireTurning:
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	jp SetState_VampireWalking

Func_2a8a7:
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	jr SetState_VampireAirborne

Func_2a8ae:
	play_sfx SFX_01D
	xor a
	ld [wJumpVelIndex], a
;	fallthrough

SetState_VampireAirborne:
	ld a, WST_VAMPIRE_AIRBORNE
	ld [wWarioState], a
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ret

UpdateState_VampireAirborne:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	ld a, [wWarioState]
	cp WST_VAMPIRE_AIRBORNE
	ret nz ; done if not vampire airborne any more

	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	call Func_2b55c
	ld a, [wWarioState]
	cp WST_VAMPIRE_AIRBORNE
	ret nz ; done if not vampire airborne any more

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_2a92f
	farcall CheckUpCollision
	ld a, [wWarioState]
	cp WST_VAMPIRE_AIRBORNE
	ret nz ; done if not vampire airborne any more

	ld a, b
	and a
	ret z
	jp Func_2a8a7
.asm_2a92f
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr nz, .asm_2a945
	jp TriggerDownwardsFloorTransition

.asm_2a945
	call TriggerFloorTransition
	ld a, [wWarioState]
	cp WST_VAMPIRE_AIRBORNE
	ret nz ; done if not vampire airborne any more
	jp SetState_VampireIdling

SetState_BatTransforming:
	play_sfx SFX_046
	ld a, WST_BAT_TRANSFORMING
	ld [wWarioState], a

	ld a, -15
	ld [wCollisionBoxTop], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, BANK(WarioBatGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioBatGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioBatGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, HIGH(OAM_1fd031)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1fd031)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_2a998
	ld a, HIGH(Frameset_1fd40a)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fd40a)
	ld [wFramesetPtr + 1], a
	jr .asm_2a9a2
.asm_2a998
	ld a, HIGH(Frameset_1fd479)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fd479)
	ld [wFramesetPtr + 1], a
.asm_2a9a2
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_BatTransforming:
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
;	fallthrough

SetState_BatIdling:
	ld a, WST_BAT_IDLING
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_2a9ee
	ld a, HIGH(Frameset_1fd45f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fd45f)
	ld [wFramesetPtr + 1], a
	jr .asm_2a9f8
.asm_2a9ee
	ld a, HIGH(Frameset_1fd46c)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fd46c)
	ld [wFramesetPtr + 1], a
.asm_2a9f8
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_BatIdling:
	farcall CheckCentreCollision
	ld a, [wWarioState]
	cp WST_BAT_IDLING
	ret nz ; done if not bat idling any more

	ld a, b
	and a
	jp z, SetState_BatFalling

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, $20
	ld [wSFXLoopCounter], a
	play_sfx SFX_071
.skip_sfx
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jr nz, .asm_2aa55
	bit A_BUTTON_F, a
	jp nz, SetState_BatFlying
	ret

.asm_2aa55
	ld a, -27
	ld [wCollisionBoxTop], a
	farcall CheckUpCollision
	ld a, [wWarioState]
	cp WST_BAT_IDLING
	ret nz ; done if not bat idling any more

	ld a, b
	and a
	jr z, SetState_VampireTransforming
	ld a, -15
	ld [wCollisionBoxTop], a
	play_sfx SFX_0E5
	ret

SetState_VampireTransforming:
	play_sfx SFX_045

	ld a, WST_VAMPIRE_TRANSFORMING
	ld [wWarioState], a

	ld a, TOUCH_VANISH
	ld [wTouchState], a
	ld a, TOUCH_VANISH
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	xor a
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
	ld hl, WarioVampirePal
	call SetWarioPal
	ld a, BANK(WarioBatGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioBatGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioBatGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1fd031)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1fd031)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1fd031)
	ld [wOAMPtr + 1], a
	ld a, HIGH(Frameset_1fd439)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fd439)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_VampireTransforming:
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	jp SetState_VampireIdling

SetState_BatFlying:
	ld a, WST_BAT_FLYING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wJumpVelIndex], a
	inc a
	ld [wJumpVelTable], a
	jp Func_2abc1

UpdateState_BatFlying:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	ld a, [wWarioState]
	cp WST_BAT_FLYING
	ret nz ; done if not bat flying any more

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, $10
	ld [wSFXLoopCounter], a
	play_sfx SFX_071
.skip_sfx
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	farcall CheckUpCollision
	ld a, [wWarioState]
	cp WST_BAT_FLYING
	ret nz ; done if not bat flying any more

	ld a, b
	and a
	jr nz, SetState_BatFalling
	call Func_2b63b
	ld a, [wWarioState]
	cp WST_BAT_FLYING
	ret nz ; done if not bat flying any more

	call Func_2b17a
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_2abbc
	ld a, $04
	ld [wWalkVelIndex], a
.asm_2abbc
	ld a, [wIsTurning]
	and a
	ret z
;	fallthrough

Func_2abc1:
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_2abda
	ld a, HIGH(Frameset_1fd42c)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fd42c)
	ld [wFramesetPtr + 1], a
	jr .asm_2abe4
.asm_2abda
	ld a, HIGH(Frameset_1fd434)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fd434)
	ld [wFramesetPtr + 1], a
.asm_2abe4
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

SetState_BatFalling:
	ld a, WST_BAT_FALLING
	ld [wWarioState], a
	ld a, JUMP_VEL_HIGH_JUMP
	ld [wJumpVelTable], a
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ret

UpdateState_BatFalling:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wWaterInteraction]
	and a
	jp nz, RecoverFromTransformation
	ld a, [wWarioState]
	cp WST_BAT_FALLING
	ret nz ; done if not bat falling any more
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, SetState_BatFlying
	call ApplyJumpVelocity
	call Func_2b17a
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_2ac50
	ld a, $04
	ld [wWalkVelIndex], a

.asm_2ac50
	ld a, [wIsTurning]
	and a
	call nz, Func_2abc1
	farcall CheckAirborneCollision
	ld a, [wWarioState]
	cp WST_BAT_FALLING
	ret nz ; done if not bat falling any more

	ld a, b
	and a
	ret z
	update_pos_y
	jp SetState_BatIdling

Func_2ac7d:
	ld a, WST_IN_BUBBLE
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

	ld hl, WarioBubblePal
	call SetWarioPal
	ld a, BANK(WarioBubbleGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioBubbleGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioBubbleGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1fd87c)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1fd87c)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1fd87c)
	ld [wOAMPtr + 1], a

	ld a, [wObjDirection]
	ld [wDirection], a
	ld [wWarioStateCounter], a
	ld a, HIGH(Frameset_1fdb2c)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fdb2c)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_InBubble:
	farcall Func_19b25
	ld a, [wWaterInteraction]
	and a
	jr z, .asm_2ad45

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, $0e
	ld [wSFXLoopCounter], a
	play_sfx SFX_023
.skip_sfx
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	call Func_2b56f
	ret

.asm_2ad45
	get_pos
	ld b, PARTICLE_BUBBLE_BURST
	farcall CreateParticle
	jp RecoverFromTransformation

Func_2ad6a:
	call ClearTransformationValues
	ld a, $10
	ld [wInvincibleCounter], a
	call UpdateLevelMusic
	farcall SetState_Submerged

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	inc a
	ld [wWarioStateCycles], a
	ld hl, WarioDefaultPal
	call SetWarioPal
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

	ld a, [wDirection]
	and a
	jr nz, .asm_2adc8
	ld a, HIGH(Frameset_155a6)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_155a6)
	ld [wFramesetPtr + 1], a
	jr .asm_2add2
.asm_2adc8
	ld a, HIGH(Frameset_155ab)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_155ab)
	ld [wFramesetPtr + 1], a
.asm_2add2
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	jp PlayRecoverySFX

Func_2ade4:
	call ClearTransformationValues
	ld a, $10
	ld [wInvincibleCounter], a
	call UpdateLevelMusic
	get_pos
	ldh a, [hYPosLo]
	and $f0
	ldh [hYPosLo], a
	ld b, PARTICLE_SMOKE_LARGE
	farcall CreateParticle
	play_sfx SFX_SPLASH
	farcall DiveFromSurface_SkipSplash
	ret

DecrementTransformationDuration:
	ld hl, wTransformationDuration + 1
	ld a, [hl]
	sub 1
	ld [hld], a
	ld a, [hl]
	sbc 0
	ld [hl], a
	ret

Func_2ae3b:
	call Func_2ae5c
	ret nc
	ld de, $0
	ld a, [wWarioStateCycles]
	xor $1
	ld [wWarioStateCycles], a
	jr z, .asm_2ae54
	ld hl, WarioBouncyRedPal
	add hl, de
	call SetWarioPal
	ret

.asm_2ae54
	ld hl, WarioBouncyPal
	add hl, de
	call SetWarioPal
	ret

Func_2ae5c:
	ld hl, wTransformationDuration
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
	ld a, [wGlobalCounter]
	and %11
	jr nz, .no_carry
	ld a, $01
	jr .set_carry
.asm_2ae7e
	ld a, [wGlobalCounter]
	and %1111
	jr nz, .no_carry

.set_carry
	scf
	ret

.no_carry
	scf
	ccf
	ret

Func_2ae8a:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .asm_2aea7
	farcall CheckUpCollision
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
	farcall CheckFrontCollision
	ld a, b
	and a
	jr nz, .asm_2aef1
	call ApplyWalkVelocity_Left
	call SubXOffset
	jp .asm_2aee4 ; should be jr
.asm_2aecb
	farcall CheckFrontCollision
	ld a, b
	and a
	jr nz, .asm_2af19
	call ApplyWalkVelocity_Right
	call AddXOffset

.asm_2aee4
	ld a, [wWalkVelIndex]
	cp $14
	jr c, .asm_2aef0
	ld a, $10
	ld [wWalkVelIndex], a
.asm_2aef0
	ret

.asm_2aef1
	ld b, $02
	call AddXOffset
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_2af0d
	ld a, HIGH(Frameset_16b49)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b49)
	ld [wFramesetPtr + 1], a
	jr .asm_2af3f
.asm_2af0d
	ld a, HIGH(Frameset_16b1d)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b1d)
	ld [wFramesetPtr + 1], a
	jr .asm_2af3f

.asm_2af19
	ld b, $02
	call SubXOffset
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_2af35
	ld a, HIGH(Frameset_16b38)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b38)
	ld [wFramesetPtr + 1], a
	jr .asm_2af3f
.asm_2af35
	ld a, HIGH(Frameset_16b14)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b14)
	ld [wFramesetPtr + 1], a
.asm_2af3f
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	farcall CheckCentreCollision
	ld a, b
	and a
	ret z
	farcall CheckFrontCollision
	ld a, b
	and a
	jp nz, SetState_Hot_ResetDuration
	ret

Func_2af75:
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_HIGH_JUMP
	ld [wJumpVelTable], a
	jr SetState_OnFireAirborne

Func_2af81:
	play_sfx SFX_JUMP

	xor a
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a
;	fallthrough

SetState_OnFireAirborne:
	xor a
	ld [wWarioStateCycles], a
	ld a, WST_ON_FIRE_AIRBORNE
	ld [wWarioState], a
	ret

Func_2af9c:
	call ApplyJumpVelocity
	call HandleWalk
	ld a, [wWalkVelIndex]
	cp $14
	jr c, .asm_2afae
	ld a, $10
	ld [wWalkVelIndex], a
.asm_2afae
	farcall CheckFrontCollision
	ld a, b
	and a
	ret z
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
;	fallthrough

Func_2afc5:
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a

	ld a, [wDirection]
	and a
	jr nz, .asm_2aff6
	ld b, $03
	call SubXOffset
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_2afea
	ld a, HIGH(Frameset_16b38)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b38)
	ld [wFramesetPtr + 1], a
	jr .asm_2b017
.asm_2afea
	ld a, HIGH(Frameset_16b14)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b14)
	ld [wFramesetPtr + 1], a
	jr .asm_2b017
.asm_2aff6
	ld b, $03
	call AddXOffset
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_2b00d
	ld a, HIGH(Frameset_16b49)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b49)
	ld [wFramesetPtr + 1], a
	jr .asm_2b017
.asm_2b00d
	ld a, HIGH(Frameset_16b1d)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b1d)
	ld [wFramesetPtr + 1], a
.asm_2b017
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

Func_2b027:
	call ApplyJumpVelocity
	ld hl, wWarioStateCounter
	ld a, [hl]
	and a
	jr z, .asm_2b033
	dec [hl]
	ret

.asm_2b033
	call Func_2b17a
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_2b042
	ld a, $04
	ld [wWalkVelIndex], a
.asm_2b042
	ld a, [wIsTurning]
	and a
	ret z
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_2b060
	ld a, HIGH(Frameset_16b26)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b26)
	ld [wFramesetPtr + 1], a
	jr .asm_2b06a
.asm_2b060
	ld a, HIGH(Frameset_16b2f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b2f)
	ld [wFramesetPtr + 1], a
.asm_2b06a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

HandleHotWarioInput:
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
	ld [wAnimationFrame], a
	ld a, HIGH(Frameset_16b26)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b26)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
.asm_2b0af
	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	ld b, 1
	call SubXOffset
	ret

.asm_2b0c7
	ld a, [wDirection]
	and a
	jr nz, .asm_2b0f2

	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, HIGH(Frameset_16b2f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b2f)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

.asm_2b0f2
	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	ld b, 1
	call AddXOffset
	ret

Func_2b10a:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, SetState_FlatJumping
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_FlatWalking
	ret

Func_2b11b:
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
	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	call ApplyWalkVelocity_Left
	call SubXOffset
	jr .asm_2b16d

.asm_2b150
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	call ApplyWalkVelocity_Right
	call AddXOffset

.asm_2b16d
	ld a, [wWalkVelIndex]
	cp $04
	jr c, .asm_2b179
	ld a, $00
	ld [wWalkVelIndex], a
.asm_2b179
	ret

Func_2b17a:
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .right
	bit D_LEFT_F, a
	jr nz, .left
	ret
.right
	farcall WalkRight
	ret
.left
	farcall WalkLeft
	ret

HandleWalk:
	ld a, [wDirection]
	and a
	jr nz, .dir_right
	farcall WalkLeft
	ret
.dir_right
	farcall WalkRight
	ret

Func_2b1cc:
	ld a, [wDirection]
	and a
	jr nz, .asm_2b1f1
	ld b, $02
	call SubXOffset
	farcall Func_197b1

	ld a, b
	and a
	jr z, .asm_2b20e
	ld b, $02
	call AddXOffset
	jr .asm_2b20e
.asm_2b1f1
	ld b, $02
	call AddXOffset
	farcall Func_19741
	ld a, b
	and a
	jr z, .asm_2b20e
	ld b, $02
	call SubXOffset

.asm_2b20e
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
	jr .asm_2b238
.falling
	ld b, [hl]
	call AddYOffset
	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp MAX_JUMP_VEL_INDEX
	jr c, .asm_2b238
	ld [hl], MAX_JUMP_VEL_INDEX
.asm_2b238
	ret

Func_2b239:
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
	farcall WalkIfPossible_Right
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_2b270
	ld a, $04
	ld [wWalkVelIndex], a
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
	farcall WalkIfPossible_Left
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_2b29b
	ld a, $04
	ld [wWalkVelIndex], a
.asm_2b29b
	ret
.asm_2b29c
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jp SetState_FatTurning

Func_2b2a4:
	call ApplyJumpVelocity
	call Func_2b17a
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_2b2b6
	ld a, $04
	ld [wWalkVelIndex], a
.asm_2b2b6
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	ret nz
	ld a, TRUE
	ld [wIsSmashAttacking], a
	ret

Func_2b2c2:
	call Func_2b342
	farcall CheckUpCollision
	ld a, [wWarioState]
	cp WST_PUFFY_RISING
	ret nz ; done if not puffy rising

	ld a, b
	and a
	jr z, .asm_2b2e1
	jp SetState_PuffyDeflating

.asm_2b2e1
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .asm_2b2f6
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr nc, .asm_2b2f6
	call StartUpwardsFloorTransition

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
	call SubXOffset
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
	call AddXOffset
	ret

Func_2b342:
	ld a, [wGlobalCounter]
	and %1
	ret nz
	ld b, $01
	call SubYOffset
	ret

Func_2b34e:
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jp nz, Func_29be1
	and D_RIGHT | D_LEFT
	jp nz, SetState_ZombieWalking

	farcall CheckCentreCollision
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

Func_2b381:
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
	farcall WalkIfPossible_Right
	jr .asm_2b3c8

.asm_2b3ab
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jp SetState_ZombieTurning
.asm_2b3b3
	ld a, [wDirection]
	and a
	jr nz, .asm_2b3d5
	farcall WalkIfPossible_Left
.asm_2b3c8
	ld a, [wWalkVelIndex]
	cp $04
	jr c, .asm_2b3d4
	ld a, $00
	ld [wWalkVelIndex], a
.asm_2b3d4
	ret
.asm_2b3d5
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jp SetState_ZombieTurning

Func_2b3dd:
	call ApplyJumpVelocity
	ld hl, wWarioStateCycles
	ld a, [hl]
	and a
	jr z, .asm_2b3e9
	dec [hl]
	ret

.asm_2b3e9
	call Func_2b17a
	ld a, [wWalkVelIndex]
	cp $04
	jr c, .asm_2b3f8
	ld a, $00
	ld [wWalkVelIndex], a
.asm_2b3f8
	ret

Func_2b3f9:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, Func_2a675
	call Func_2b42b
	ld a, [wWarioState]
	cp WST_CRAZY
	ret nz ; done if not crazy any more

	ld a, [wAnimationEnded]
	and a
	ret z

	ld a, [wDirection]
	and a
	jr nz, .asm_2b421
	ld a, [wJoypadDown]
	bit D_LEFT_F, a
	jr z, .asm_2b428
.asm_2b41c
	xor a
	ld [wWalkVelIndex], a
	ret
.asm_2b421
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_2b41c
.asm_2b428
	jp SetState_CrazyTurning

Func_2b42b:
	ld hl, wWalkVelIndex
	inc [hl]
	ld a, [hl]
	cp $06
	jr c, .asm_2b495
	jp z, Func_2b4d0
	cp $09
	ret c
	cp $12
	jr c, .asm_2b495
	jp z, Func_2b4d0
	cp $15
	ret c
	cp $18
	jr c, .asm_2b495
	cp $22
	jr c, .asm_2b45d
	jp z, Func_2b4d0
	cp $25
	ret c
	cp $2c
	jr c, .asm_2b457
	ret

.asm_2b457
	ld a, [wGlobalCounter]
	and %1
	ret z
.asm_2b45d
	ld a, [wDirection]
	and a
	jr nz, .asm_2b47c
	farcall Func_197b1
	ld a, b
	and a
	jr nz, .asm_2b4cd
	ld b, $01
	call SubXOffset
	ret

.asm_2b47c
	farcall Func_19741
	ld a, b
	and a
	jr nz, .asm_2b4cd
	ld b, $01
	call AddXOffset
	ret

.asm_2b495
	ld a, [wDirection]
	and a
	jr nz, .asm_2b4b4
	farcall Func_197b1
	ld a, b
	and a
	jr nz, .asm_2b4cd
	ld b, $02
	call SubXOffset
	ret

.asm_2b4b4
	farcall Func_19741
	ld a, b
	and a
	jr nz, .asm_2b4cd
	ld b, $02
	call AddXOffset
	ret
.asm_2b4cd
	jp SetState_CrazyTurning

Func_2b4d0:
	get_pos
	ld b, PARTICLE_DUST
	farcall CreateParticle
	ret

Func_2b4f3:
	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, SetState_BatTransforming
	bit A_BUTTON_F, a
	jp nz, Func_2a8ae
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_VampireWalking
	ret

Func_2b509:
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jp nz, SetState_BatTransforming
	bit A_BUTTON_F, a
	jp nz, Func_2a8ae
	bit D_RIGHT_F, a
	jr nz, .asm_2b521
	bit D_LEFT_F, a
	jr nz, .asm_2b539
	jp SetState_VampireIdling

.asm_2b521
	ld a, [wDirection]
	and a
	jp z, SetState_VampireTurning
	farcall WalkIfPossible_Right
	jr .asm_2b54f
.asm_2b539
	ld a, [wDirection]
	and a
	jp nz, SetState_VampireTurning
	farcall WalkIfPossible_Left
.asm_2b54f
	ld a, [wWalkVelIndex]
	cp $10
	jr c, .asm_2b55b
	ld a, $0c
	ld [wWalkVelIndex], a
.asm_2b55b
	ret

Func_2b55c:
	call ApplyJumpVelocity
	call Func_2b17a
	ld a, [wWalkVelIndex]
	cp $10
	jr c, .asm_2b56e
	ld a, $0c
	ld [wWalkVelIndex], a
.asm_2b56e
	ret

Func_2b56f:
	ld a, [wGlobalCounter]
	and %1
	jr z, .asm_2b5b2
	ld b, $01
	call SubYOffset
	farcall CheckUpCollision
	ld a, b
	and a
	ret z

	get_pos
	ld b, PARTICLE_BUBBLE_BURST
	farcall CreateParticle
	jp RecoverFromTransformation

.asm_2b5b2
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_2b607
	bit D_LEFT_F, a
	jr nz, .asm_2b621

	ld a, [wWarioStateCounter]
	ld [wDirection], a
	farcall CheckFrontCollision
	ld a, b
	and a
	jr nz, .asm_2b5f7

	ld hl, Data_2b6b4
	ld a, [wJumpVelIndex]
	ld e, a
	ld d, $00
	add hl, de
	ld b, [hl]
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_2b5ec
	call SubXOffset
	jr .asm_2b5ef
.asm_2b5ec
	call AddXOffset
.asm_2b5ef
	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp $2f
	ret c

.asm_2b5f7
	ld a, [wWarioStateCounter]
	xor $1
	ld [wWarioStateCounter], a
	ld [wDirection], a
.asm_2b602
	xor a
	ld [wJumpVelIndex], a
	ret

.asm_2b607
	farcall Func_19741
	ld a, b
	and a
	jr nz, .asm_2b5f7
	ld b, $01
	call AddXOffset
	jr .asm_2b602
.asm_2b621
	farcall Func_197b1
	ld a, b
	and a
	jr nz, .asm_2b5f7
	ld b, $01
	call SubXOffset
	jr .asm_2b602

Func_2b63b:
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jp z, SetState_BatFalling

	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp MAX_JUMP_VEL_INDEX + 1
	jr c, .asm_2b651
	jp SetState_BatFalling

	xor a
	ld [hl], a
.asm_2b651
	ld e, a
	ld d, $00
	farcall Func_1f863
	ret

Data_2b664:
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

Data_2b68c:
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

Data_2b6b4:
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
