UpdateWarioStates_Group2:
	ld a, [wWarioState]
	sub $30
	jumptable

	dw UpdateState_Slipping              ; WST_SLIPPING
	dw UpdateState_CrouchSlipping        ; WST_CROUCH_SLIPPING
	dw UpdateState_DraggedDown           ; WST_DRAGGED_DOWN
	dw UpdateState_Teleporting           ; WST_TELEPORTING
	dw UpdateState_WaterTeleporting      ; WST_WATER_TELEPORTING
	dw UpdateState_SandFalling           ; WST_SAND_FALLING
	dw UpdateState_SandJumping           ; WST_SAND_JUMPING
	dw UpdateState_SandIdling            ; WST_SAND_IDLING
	dw UpdateState_SandWalking           ; WST_SAND_WALKING
	dw UpdateState_SandTurning           ; WST_SAND_TURNING
	dw UpdateState_LadderClimbing        ; WST_LADDER_CLIMBING
	dw UpdateState_LadderIdling          ; WST_LADDER_IDLING
	dw UpdateState_LadderShakeSlipping   ; WST_LADDER_SHAKE_SLIDING
	dw UpdateState_GettingOffLadder      ; WST_GETTING_OFF_LADDER
	dw UpdateState_LadderSliding         ; WST_LADDER_SLIDING
	dw UpdateState_GrabSlipping          ; WST_GRAB_SLIPPING
	dw UpdateState_GetTreasureStart      ; WST_GET_TREASURE_START
	dw UpdateState_GetTreasureWalk       ; WST_GET_TREASURE_WALK_1
	dw UpdateState_GetTreasureTurnFront  ; WST_GET_TREASURE_TURN_FRONT_1
	dw UpdateState_GetTreasureLaugh      ; WST_GET_TREASURE_LAUGH
	dw UpdateState_GetTreasureTurnBack   ; WST_GET_TREASURE_TURN_BACK
	dw UpdateState_GetTreasureOpen       ; WST_GET_TREASURE_OPEN
	dw UpdateState_GetTreasureTurnWalk   ; WST_GET_TREASURE_TURN_WALK
	dw UpdateState_GetTreasureWalk       ; WST_GET_TREASURE_WALK_2
	dw UpdateState_GetTreasureTurnFront  ; WST_GET_TREASURE_TURN_FRONT_2
	dw UpdateState_GetTreasureLookFront  ; WST_GET_TREASURE_LOOK_FRONT
	dw UpdateState_GetTreasureClear      ; WST_GET_TREASURE_CLEAR
	dw UpdateState_Sleeping              ; WST_SLEEPING
	dw UpdateState_LadderScratching      ; WST_LADDER_SCRATCHING
	dw UpdateState_FenceShakeSliding     ; WST_FENCE_SHAKE_SLIDING
	dw UpdateState_FenceMovingVertical   ; WST_FENCE_MOVING_VERTICAL
	dw UpdateState_FenceIdling           ; WST_FENCE_IDLING
	dw UpdateState_FenceMovingHorizontal ; WST_FENCE_MOVING_HORIZONTAL
	dw UpdateState_FenceSliding          ; WST_FENCE_SLIDING
	dw InvalidWarioStateReset            ; WST_UNUSED_52
	dw InvalidWarioStateReset            ; WST_UNUSED_53
	dw InvalidWarioStateReset            ; WST_UNUSED_54
	dw InvalidWarioStateReset            ; WST_UNUSED_55
	dw InvalidWarioStateReset            ; WST_UNUSED_56
	dw InvalidWarioStateReset            ; WST_UNUSED_57
	dw InvalidWarioStateReset            ; WST_UNUSED_58
	dw InvalidWarioStateReset            ; WST_UNUSED_59
	dw InvalidWarioStateReset            ; WST_UNUSED_5A
	dw InvalidWarioStateReset            ; WST_UNUSED_5B
	dw InvalidWarioStateReset            ; WST_UNUSED_5C
	dw InvalidWarioStateReset            ; WST_UNUSED_5D
	dw InvalidWarioStateReset            ; WST_UNUSED_5E
	dw InvalidWarioStateReset            ; WST_UNUSED_5F

SetState_Slipping:
	ld a, WST_SLIPPING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wAttackCounter], a
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

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	ld [wWarioStateCycles], a
	and a
	jr nz, .asm_19ccd
	ld a, HIGH(Frameset_14252)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14252)
	ld [wFramesetPtr + 1], a
	jr .got_frameset
.asm_19ccd
	ld a, HIGH(Frameset_1425f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1425f)
	ld [wFramesetPtr + 1], a
.got_frameset
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_Slipping:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition

	ld a, [wWarioStateCycles]
	cp $04
	jp nc, .asm_19db6
	cp $02
	jr nc, .asm_19d62
	ld b, a

	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp z, .asm_19db6
	rlca
	rlca
	rlca
	and $01
	cp b
	jp nz, .asm_19db6
	xor $1
	add 2
	ld [wWarioStateCycles], a

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

	ld a, [wWarioStateCycles]
	and $01
	jr nz, .asm_19d56
	ld a, HIGH(Frameset_14cbe)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14cbe)
	ld [wFramesetPtr + 1], a
	jr .asm_19daf
.asm_19d56
	ld a, HIGH(Frameset_14cc5)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14cc5)
	ld [wFramesetPtr + 1], a
	jr .asm_19daf

.asm_19d62
	ld b, a
	ld a, [wAnimationEnded]
	and a
	jr z, .asm_19db6
	ld a, b
	add $02
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

	ld a, [wWarioStateCycles]
	and $01
	jr nz, .asm_19da3
	ld a, HIGH(Frameset_149b4)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_149b4)
	ld [wFramesetPtr + 1], a
	jr .asm_19daf
.asm_19da3
	ld a, HIGH(Frameset_149c5)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_149c5)
	ld [wFramesetPtr + 1], a
	jr .asm_19daf

.asm_19daf
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
.asm_19db6
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .asm_19ddc
	farcall StartJump_FromInput
	ret

.asm_19ddc
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr z, .asm_19de6
	jp Func_19e89

.asm_19de6
	farcall CheckCentreCollision
	ld a, [wWarioState]
	cp WST_SLIPPING
	ret nz ; done if not slipping any more

	ld a, b
	and a
	jr nz, .asm_19e0f
	farcall StartFall
	ret

.asm_19e0f
	update_pos_y
	farcall CheckFrontCollision
	ld a, [wWarioState]
	cp WST_SLIPPING
	ret nz ; done if not slipping any more

	ld a, b
	and a
	jr nz, .asm_19e67
	call IsOnSlipperyGround
	jr z, .asm_19e67
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	ld a, [hl]
	cp $08
	jr c, .asm_19e4d
	cp $0f
	jr c, .asm_19e57
	cp $15
	jr c, .asm_19e51
	jr z, .asm_19e67
	ret

.asm_19e4d
	ld b, $02
	jr .asm_19e59
.asm_19e51
	ld a, [wGlobalCounter]
	and %1
	ret z
.asm_19e57
	ld b, $01
.asm_19e59
	ld a, [wDirection]
	and a
	jr nz, .asm_19e63
	call SubXOffset
	ret

.asm_19e63
	call AddXOffset
	ret

.asm_19e67
	ld a, [wWarioStateCycles]
	and $01
	ld [wDirection], a
	farcall SetState_Idling
	ret

SetState_CrouchSlipping:
	xor a
	ld [wWarioStateCounter], a
	ld a, [wDirection]
	ld [wWarioStateCycles], a
;	fallthrough

Func_19e89:
	ld a, WST_CROUCH_SLIPPING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wAttackCounter], a
	ld [wGrabState], a
	inc a
	ld [wIsCrouching], a
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
	ld a, [wWarioStateCycles]
	cp $01
	jr z, .asm_19ed7
	ld a, HIGH(Frameset_14a38)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a38)
	ld [wFramesetPtr + 1], a
	jr .got_frameset
.asm_19ed7
	ld a, HIGH(Frameset_14a3b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a3b)
	ld [wFramesetPtr + 1], a
.got_frameset
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_CrouchSlipping:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .asm_19f1e
	farcall StartCrouchJump
	ret

.asm_19f1e
	farcall CheckCentreCollision
	ld a, [wWarioState]
	cp WST_CROUCH_SLIPPING
	ret nz ; done if not crouch slipping any more
	ld a, b
	and a
	jr nz, .asm_19f47
	farcall StartCrouchFall
	ret

.asm_19f47
	update_pos_y
	farcall CheckFrontCollision
	ld a, [wWarioState]
	cp WST_CROUCH_SLIPPING
	ret nz ; done if not crouch slipping any more
	ld a, b
	and a
	jr nz, .asm_19f9e
	call IsOnSlipperyGround
	jr z, .asm_19f9e

	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $06
	jr c, .asm_19f84
	cp $0a
	jr c, .asm_19f8e
	cp $0e
	jr c, .asm_19f88
	jr nc, .asm_19f9e
	ret

.asm_19f84
	ld b, $02
	jr .asm_19f90
.asm_19f88
	ld a, [wGlobalCounter]
	and %1
	ret z
.asm_19f8e
	ld b, $01
.asm_19f90
	ld a, [wDirection]
	and a
	jr nz, .asm_19f9a
	call SubXOffset
	ret

.asm_19f9a
	call AddXOffset
	ret

.asm_19f9e
	ld a, [wWarioStateCycles]
	and $01
	ld [wDirection], a
	farcall CrouchOrSlide
	ret

SetState_DraggedDown:
	ld a, WST_DRAGGED_DOWN
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wAttackCounter], a
	ld [wGrabState], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ld [wIsSmashAttacking], a
	ld [wIsCrouching], a
	ld [wIsRolling], a

	inc a
	ld [wAutoMoveState], a

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ld a, -27
	ld [wCollisionBoxTop], a

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

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1a02c
	ld a, HIGH(Frameset_15f70)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f70)
	ld [wFramesetPtr + 1], a
	jr .asm_1a036
.asm_1a02c
	ld a, HIGH(Frameset_15f7f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f7f)
	ld [wFramesetPtr + 1], a
.asm_1a036
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_DraggedDown:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAutoMoveState]
	and a
	ret nz
	ld a, [wLevel]
	cp THE_TEMPLE
	jr z, .set_game_over
	farcall StartFall
	ret

.set_game_over
	ld a, LVLEND_GAME_OVER
	ld [wLevelEndScreen], a
	ret

UpdateState_Teleporting:
	ld a, TRUE
	ld [wIsIntangible], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $01
	jr z, PlayTeleportingSFX
	cp $b4
	ret c
	ld [hl], $00
	ld a, WST_STUNG
	ld [wWarioState], a
	ld a, $01
	ld [wInvincibleCounter], a
	ld hl, wRoomTransitionParam
	res ROOMTRANSITIONF_DELAY_F, [hl]
	jp TriggerRoomTransition

PlayTeleportingSFX:
	play_sfx SFX_082
	ret

UpdateState_WaterTeleporting:
	ld a, TRUE
	ld [wIsIntangible], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $11
	jr z, PlayTeleportingSFX
	cp $b4
	ret c
	ld [hl], $00
	ld a, WST_WATER_STUNG
	ld [wWarioState], a
	ld a, $01
	ld [wInvincibleCounter], a
	ld hl, wRoomTransitionParam
	res ROOMTRANSITIONF_DELAY_F, [hl]
	jp TriggerRoomTransition

SetState_SandFalling:
	xor a
	ld [wGrabState], a
	ld a, WST_SAND_FALLING
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
	ld hl, WarioDefaultPal
	call SetWarioPal
;	fallthrough

Func_1a12a:
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
;	fallthrough

Func_1a14b:
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1a164
	ld a, HIGH(Frameset_15f94)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f94)
	ld [wFramesetPtr + 1], a
	jr .asm_1a16e
.asm_1a164
	ld a, HIGH(Frameset_15f97)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f97)
	ld [wFramesetPtr + 1], a
.asm_1a16e
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_SandFalling:
	call Func_1b2c0
	ld a, [wWarioState]
	cp WST_SAND_FALLING
	ret nz ; done if not falling in sand any more

	farcall CheckCentreCollision
	ld a, b
	and a
	ret z
	update_pos_y
	jp SetState_SandIdling

SetState_SandJumping:
	play_sfx SFX_JUMP
	ld a, WST_SAND_JUMPING
	ld [wWarioState], a
	xor a
	ld [wJumpVelIndex], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	inc a
	ld [wJumpVelTable], a
	jp Func_1a12a

UpdateState_SandJumping:
	farcall Func_19b25
	ld a, [wIsInSand]
	and a
	jr nz, .in_sand
; not in sand
	farcall StartJump_FromSand
	ret

.in_sand
	call ApplyJumpVelocity
	farcall Func_2b17a
	ld a, [wWalkVelIndex]
	cp $04
	jr c, .asm_1a208
	ld a, $00
	ld [wWalkVelIndex], a
.asm_1a208
	ld a, [wIsTurning]
	and a
	jr z, .asm_1a211
	call Func_1a14b

.asm_1a211
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jp z, SetState_SandFalling

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jp nc, SetState_SandFalling

; rising
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
	jp SetState_SandFalling

SetState_SandIdling:
	ld a, WST_SAND_IDLING
	ld [wWarioState], a

	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
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
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1a27c
	ld a, HIGH(Frameset_14252)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14252)
	ld [wFramesetPtr + 1], a
	jr .asm_1a286
.asm_1a27c
	ld a, HIGH(Frameset_1425f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1425f)
	ld [wFramesetPtr + 1], a
.asm_1a286
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_SandIdling:
	call Func_1b322
	ret

SetState_SandWalking:
	xor a
	ld [wWalkVelIndex], a

	ld a, WST_SAND_WALKING
	ld [wWarioState], a

	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	jr .asm_1a2bc

.d_right
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jr .asm_1a2bc
.d_left
	ld a, DIRECTION_LEFT
	ld [wDirection], a

.asm_1a2bc
	xor a
	ld [wSFXLoopCounter], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	farcall Func_1e6ea
	ret

UpdateState_SandWalking:
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, $24
	ld [wSFXLoopCounter], a
	play_sfx SFX_WALK

.skip_sfx
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	call Func_1b333
	ld a, [wWarioState]
	cp WST_SAND_WALKING
	ret nz ; done if not walking in sand any more

	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, SetState_SandFalling
	ret

SetState_SandTurning:
	ld a, WST_SAND_TURNING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
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
	jr nz, .asm_1a37a
	ld a, HIGH(Frameset_14cbe)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14cbe)
	ld [wFramesetPtr + 1], a
	jr .asm_1a384
.asm_1a37a
	ld a, HIGH(Frameset_14cc5)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14cc5)
	ld [wFramesetPtr + 1], a
.asm_1a384
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_SandTurning:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, SetState_SandJumping
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_SandWalking
	jp SetState_SandIdling

SetState_LadderClimbing:
	ld a, WST_LADDER_CLIMBING
	ld [wWarioState], a
	ld a, [wWarioXPos + 1]
	and $f0
	add $08
	ld [wWarioXPos + 1], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wIsGettingOffLadder], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, BANK(WarioLadderGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioLadderGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioLadderGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_155cc)
	ld [wOAMBank], a
	ld a, HIGH(OAM_155cc)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_155cc)
	ld [wOAMPtr + 1], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, HIGH(Frameset_158d6)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_158d6)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_LadderClimbing:
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
	play_sfx SFX_CLIMB
.skip_sfx
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wAnimationEnded]
	and a
	jr z, .asm_1a49a
	get_pos
	ld b, PARTICLE_DUST
	farcall CreateParticle
.asm_1a49a
	call HandleLadderInput
	ret

SetState_LadderIdling:
	ld a, WST_LADDER_IDLING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld [wIsGettingOffLadder], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, BANK(WarioLadderGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioLadderGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioLadderGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_155cc)
	ld [wOAMBank], a
	ld a, HIGH(OAM_155cc)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_155cc)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1a511
	ld a, HIGH(Frameset_15900)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15900)
	ld [wFramesetPtr + 1], a
.asm_1a501
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

.asm_1a511
	ld a, HIGH(Frameset_158fd)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_158fd)
	ld [wFramesetPtr + 1], a
	jr .asm_1a501

UpdateState_LadderIdling:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wLadderInteraction]
	and a
	jr nz, .continue_ladder
	farcall StartFall
	ret
.continue_ladder
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	call Func_1b480
	ret

UpdateState_LadderShakeSlipping:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wLadderInteraction]
	and a
	jr nz, .continue_ladder
	farcall StartFall
	ret
.continue_ladder
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld b, $02
	call AddYOffset
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .asm_1a5b3
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr z, .asm_1a5b3
	jr c, .asm_1a5b3
	call StartDownwardsFloorTransition
.asm_1a5b3
	farcall CheckAirborneCollision
	ld a, b
	and a
	jr z, .asm_1a5e1
	update_pos_y
	farcall SetState_Idling
	ret

.asm_1a5e1
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $40
	ret c
	ld [hl], $00
	jp SetState_LadderIdling

SetState_GettingOffLadder:
	ld a, WST_GETTING_OFF_LADDER
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	inc a ; TRUE
	ld [wIsGettingOffLadder], a
	ld [wIsIntangible], a

	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_1a611
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	ret
.asm_1a611
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	ret

UpdateState_GettingOffLadder:
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 32
	ld [wSFXLoopCounter], a
	play_sfx SFX_CLIMB
.skip_sfx

	ld a, [wDirection]
	and a
	jr nz, .asm_1a63b
	ld b, $01
	call SubXOffset
	jr .asm_1a640
.asm_1a63b
	ld b, $01
	call AddXOffset

.asm_1a640
	farcall Func_19b25
	ld a, [wLadderInteraction]
	and a
	ret nz
	xor a
	ld [wIsGettingOffLadder], a
	ld [wIsIntangible], a
	farcall StartFall
	ret

SetState_LadderSliding:
	ld a, WST_LADDER_SLIDING
	ld [wWarioState], a
	play_sfx SFX_SLIDE
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsGettingOffLadder], a
	inc a
	ld [wJumpVelTable], a
	ld a, [wPowerUpLevel]
	cp LEAD_OVERALLS
	jr c, .asm_1a695
	ld a, TRUE
	ld [wIsSmashAttacking], a
.asm_1a695

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, HIGH(Frameset_15945)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15945)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_LadderSliding:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wLadderInteraction]
	and a
	jr nz, .continue_ladder
	xor a ; FALSE
	ld [wIsSmashAttacking], a
	farcall StartFall
	ret
.continue_ladder
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wJoypadDown]
	bit D_UP_F, a
	jp nz, SetState_LadderClimbing

	ld b, $02
	call AddYOffset
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .asm_1a719
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr z, .asm_1a719
	jr c, .asm_1a719
	call StartDownwardsFloorTransition
.asm_1a719
	farcall CheckAirborneCollision

	ld a, b
	and a
	ret z
	update_pos_y
	ld a, [wIsSmashAttacking]
	and a
	jr z, .idle
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jr c, .ground_pound
	farcall DoWarioGroundShake
	ret
.idle
	farcall SetState_Idling
	ret
.ground_pound
	farcall DoGroundPound
	ret

SetState_GrabSlipping:
	ld a, WST_GRAB_SLIPPING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wAttackCounter], a
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
	and a
	jr nz, .asm_1a7bc
	ld a, HIGH(Frameset_14a20)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a20)
	ld [wFramesetPtr + 1], a
	jr .asm_1a7c6
.asm_1a7bc
	ld a, HIGH(Frameset_14a23)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a23)
	ld [wFramesetPtr + 1], a
.asm_1a7c6
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_GrabSlipping:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wGrabState]
	and a
	jr nz, .asm_1a802
	farcall SetState_Idling
	ret

.asm_1a802
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .asm_1a819
	farcall Func_1ede9
	ret

.asm_1a819
	farcall CheckCentreCollision
	ld a, [wWarioState]
	cp WST_GRAB_SLIPPING
	ret nz ; done if not grab slipping any more
	ld a, b
	and a
	jr nz, .asm_1a842
	farcall Func_1edd3
	ret

.asm_1a842
	farcall CheckFrontCollision
	ld a, [wWarioState]
	cp WST_GRAB_SLIPPING
	ret nz ; done if not grab slipping any more
	ld a, b
	and a
	jr nz, .asm_1a88e
	call IsOnSlipperyGround
	jr z, .asm_1a88e

	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $08
	jr c, .asm_1a874
	cp $0f
	jr c, .asm_1a87e
	cp $15
	jr c, .asm_1a878
	jr z, .asm_1a88e
	ret

.asm_1a874
	ld b, $02
	jr .asm_1a880
.asm_1a878
	ld a, [wGlobalCounter]
	and %1
	ret z
.asm_1a87e
	ld b, $01
.asm_1a880
	ld a, [wDirection]
	and a
	jr nz, .asm_1a88a
	call SubXOffset
	ret

.asm_1a88a
	call AddXOffset
	ret

.asm_1a88e
	farcall SetState_GrabIdling
	ret

UpdateState_GetTreasureStart:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wJumpVelTable]
	and a
	jr z, .on_ground
	call ApplyJumpVelocity
	farcall CheckAirborneCollision
	ld a, b
	and a
	ret z
	ld hl, hYPosHi
	ld de, wWarioPos
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
.on_ground
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp 48
	ret c
	ld a, 24
	ld [wWarioStateCounter], a
;	fallthrough

SetNextGetTreasureState:
	ld hl, wWarioState
	inc [hl]
	xor a
	ld [wWarioStateCycles], a
	farcall Func_1e6ea
	ret

UpdateState_GetTreasureWalk:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wDirection]
	and a
	jr nz, .go_right
; go left
	ld b, 1
	call SubXOffset
	jr .done_moving
.go_right
	ld b, 1
	call AddXOffset

.done_moving
	ld hl, wWarioStateCounter
	dec [hl]
	ret nz
	ld hl, wWarioState
	inc [hl] ; WST_GET_TREASURE_TURN_FRONT_1
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCycles], a
	ld a, BANK(WarioIdleGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioIdleGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioIdleGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1fc31b)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1fc31b)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1fc31b)
	ld [wOAMPtr + 1], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1a966
	ld a, HIGH(Frameset_1fc46a)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc46a)
	ld [wFramesetPtr + 1], a
	jr .asm_1a970
.asm_1a966
	ld a, HIGH(Frameset_1fc461)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc461)
	ld [wFramesetPtr + 1], a
.asm_1a970
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_GetTreasureTurnFront:
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, [wWarioState]
	cp WST_GET_TREASURE_TURN_FRONT_2
	jp z, SetState_GetTreasureLookFront
	ld a, WST_GET_TREASURE_LAUGH
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, BANK(WarioClearGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioClearGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioClearGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1fc000)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1fc000)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1fc000)
	ld [wOAMPtr + 1], a
	ld a, HIGH(Frameset_1fc2ab)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc2ab)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_GetTreasureLaugh:
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, WST_GET_TREASURE_TURN_BACK
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, BANK(WarioIdleGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioIdleGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioIdleGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1fc31b)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1fc31b)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1fc31b)
	ld [wOAMPtr + 1], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1aa42
	ld a, HIGH(Frameset_1fc446)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc446)
	ld [wFramesetPtr + 1], a
	jr .asm_1aa4c
.asm_1aa42
	ld a, HIGH(Frameset_1fc439)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc439)
	ld [wFramesetPtr + 1], a
.asm_1aa4c
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_GetTreasureTurnBack:
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, WST_GET_TREASURE_OPEN
	ld [wWarioState], a
	play_sfx SFX_03E
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, BANK(WarioClearGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioClearGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioClearGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1fc000)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1fc000)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1fc000)
	ld [wOAMPtr + 1], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, HIGH(Frameset_1fc2c4)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc2c4)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_GetTreasureOpen:
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, WST_GET_TREASURE_TURN_WALK
	ld [wWarioState], a
	call LoadCollectedTreasurePal_Level
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a

	ld a, BANK(WarioIdleGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioIdleGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioIdleGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1fc31b)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1fc31b)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1fc31b)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	xor $1
	ld [wDirection], a
	and a
	jr nz, .asm_1ab2a
	ld a, HIGH(Frameset_1fc45a)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc45a)
	ld [wFramesetPtr + 1], a
	jr .asm_1ab34
.asm_1ab2a
	ld a, HIGH(Frameset_1fc453)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc453)
	ld [wFramesetPtr + 1], a
.asm_1ab34
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_GetTreasureTurnWalk:
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, 32
	ld [wWarioStateCounter], a
	xor a
	ld [wAutoMoveState], a
	jp SetNextGetTreasureState

SetState_GetTreasureLookFront:
	ld a, WST_GET_TREASURE_LOOK_FRONT
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, BANK(WarioClearGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioClearGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioClearGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1fc000)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1fc000)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1fc000)
	ld [wOAMPtr + 1], a
	ld a, HIGH(Frameset_1fc30d)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fc30d)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_GetTreasureLookFront:
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, WST_GET_TREASURE_CLEAR
	ld [wWarioState], a
	ld hl, wWarioPos
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
	ld b, PARTICLE_TREASURE_GLOW
	farcall CreateParticle
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ret

UpdateState_GetTreasureClear:
	ld hl, wWarioStateCounter
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jr nz, .next
	inc [hl]
	ld a, [hl]
	cp 180
	ret c
.next
	ld a, [wCurParticleAnimEnded]
	and a
	ret z
	ld [hl], 0 ; wWarioStateCounter
	ld hl, wLevelEndScreen
	res 7, [hl]
	ret

SetState_Sleeping:
	ld a, WST_SLEEPING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
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
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1ac59
	ld a, HIGH(Frameset_1421c)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1421c)
	ld [wFramesetPtr + 1], a
	jr .got_frameset
.asm_1ac59
	ld a, HIGH(Frameset_14225)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14225)
	ld [wFramesetPtr + 1], a
.got_frameset
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_Sleeping:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wWarioStateCounter]
	dec a
	jr z, .asm_1acd0
	dec a
	jp z, .asm_1ad0c
	ld a, [wAnimationEnded]
	and a
	ret z
	play_sfx SFX_SLEEP
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld hl, wWarioStateCounter
	inc [hl]

	ld a, [wDirection]
	and a
	jr nz, .asm_1acb6
	ld a, HIGH(Frameset_1422e)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1422e)
	ld [wFramesetPtr + 1], a
	jr .asm_1acc0
.asm_1acb6
	ld a, HIGH(Frameset_14237)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14237)
	ld [wFramesetPtr + 1], a
.asm_1acc0
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

.asm_1acd0
	ld a, [wAnimationEnded]
	and a
	play_sfx nz, SFX_SLEEP
	ld a, [wJoypadDown]
	and a
	ret z
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [wDirection]
	and a
	jr nz, .asm_1ad00
	ld a, HIGH(Frameset_14240)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14240)
	ld [wFramesetPtr + 1], a
	jr .asm_1acc0
.asm_1ad00
	ld a, HIGH(Frameset_14249)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14249)
	ld [wFramesetPtr + 1], a
	jr .asm_1acc0

.asm_1ad0c
	ld a, [wAnimationEnded]
	and a
	ret z
	farcall SetState_Idling
	ret

SetState_LadderScratching:
	ld a, WST_LADDER_SCRATCHING
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
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsGettingOffLadder], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1ad63
	ld a, HIGH(Frameset_15903)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15903)
	ld [wFramesetPtr + 1], a
	jr .asm_1ad6d
.asm_1ad63
	ld a, HIGH(Frameset_15924)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15924)
	ld [wFramesetPtr + 1], a
.asm_1ad6d
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_LadderScratching:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wJoypadDown]
	and a
	jr nz, .asm_1ad97
	ld a, [wAnimationEnded]
	and a
	ret z
.asm_1ad97
	jp SetState_LadderIdling

SetState_FenceShakeSliding:
	ld a, WST_FENCE_SHAKE_SLIDING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld a, $03
	ld [wAutoMoveState], a

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
	and a
	jr nz, .asm_1ade1
	ld a, HIGH(Frameset_14d0b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14d0b)
	ld [wFramesetPtr + 1], a
	jr .asm_1adeb
.asm_1ade1
	ld a, HIGH(Frameset_14d10)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14d10)
	ld [wFramesetPtr + 1], a
.asm_1adeb
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_FenceShakeSliding:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_1ae3a
	ld a, [wAnimationEnded]
	and a
	jr z, .asm_1ae3a
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
.asm_1ae3a
	ld a, [wJumpVelTable]
	and a
	jr z, .done
	call ApplyJumpVelocity
	farcall CheckAirborneCollision
	ld a, b
	and a
	ret z

	update_pos_y

	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

.done
	ret

SetState_FenceMovingVertical:
	ld a, WST_FENCE_MOVING_VERTICAL
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, BANK(WarioLadderGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioLadderGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioLadderGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_155cc)
	ld [wOAMBank], a
	ld a, HIGH(OAM_155cc)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_155cc)
	ld [wOAMPtr + 1], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, HIGH(Frameset_158d6)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_158d6)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_FenceMovingVertical:;1aed0 (6:6ed0)
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, $20
	ld [wSFXLoopCounter], a
	play_sfx SFX_CLIMB
.skip_sfx
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

	ld a, [wAnimationEnded]
	and a
	jr z, .asm_1af1e

	get_pos

	ld b, PARTICLE_DUST
	farcall CreateParticle
.asm_1af1e
	call Func_1b168
	ret

SetState_FenceIdling:
	ld a, WST_FENCE_IDLING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, BANK(WarioLadderGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioLadderGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioLadderGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_155cc)
	ld [wOAMBank], a
	ld a, HIGH(OAM_155cc)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_155cc)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1af7e
	ld a, HIGH(Frameset_15900)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15900)
	ld [wFramesetPtr + 1], a
	jr .asm_1af88
.asm_1af7e
	ld a, HIGH(Frameset_158fd)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_158fd)
	ld [wFramesetPtr + 1], a
.asm_1af88
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_FenceIdling:
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	call Func_1b21a
	ret

SetState_FenceMovingHorizontal:
	ld a, WST_FENCE_MOVING_HORIZONTAL
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ld a, -27
	ld [wCollisionBoxTop], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left

	ld a, [wDirection]
	and a
	jr nz, .d_right
.d_left
	ld a, HIGH(Frameset_158f2)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_158f2)
	ld [wFramesetPtr + 1], a
	jr .asm_1afff
.d_right
	ld a, HIGH(Frameset_158e7)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_158e7)
	ld [wFramesetPtr + 1], a
.asm_1afff
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_FenceMovingHorizontal:
	farcall Func_19afb
	ld a, [wIsNearFence]
	and a
	jr nz, .asm_1b034
	farcall StartFall
	ret

.asm_1b034
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, $20
	ld [wSFXLoopCounter], a
	play_sfx SFX_CLIMB
.skip_sfx
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	call Func_1b24f
	ret

SetState_FenceSliding:
	ld a, WST_FENCE_SLIDING
	ld [wWarioState], a
	play_sfx SFX_SLIDE

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsGettingOffLadder], a
	inc a
	ld [wJumpVelTable], a

	ld a, [wPowerUpLevel]
	cp LEAD_OVERALLS
	jr c, .asm_1b088
	ld a, TRUE
	ld [wIsSmashAttacking], a
.asm_1b088
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, HIGH(Frameset_15945)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15945)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

UpdateState_FenceSliding:
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wIsNearFence]
	and a
	jr nz, .asm_1b0d9

	xor a ; FALSE
	ld [wIsSmashAttacking], a
	farcall StartFall
	ret

.asm_1b0d9
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .asm_1b0f2
	jp SetState_FenceMovingVertical

.asm_1b0f2
	ld b, $02
	call AddYOffset
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .asm_1b10e
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr z, .asm_1b10e
	jr c, .asm_1b10e
	call StartDownwardsFloorTransition
.asm_1b10e
	farcall CheckAirborneCollision
	ld a, b
	and a
	ret z

	update_pos_y

	ld a, [wIsSmashAttacking]
	and a
	jr z, .idle
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jr c, .ground_pound
	farcall DoWarioGroundShake
	ret
.idle
	farcall SetState_Idling
	ret
.ground_pound
	farcall DoGroundPound
	ret

Func_1b168:
	ld a, [wJoypadDown]
	and B_BUTTON | D_DOWN
	cp B_BUTTON | D_DOWN
	jp z, SetState_FenceSliding

	ld a, [wJumpingUpwards]
	and a
	jr nz, .asm_1b18f
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jr z, .asm_1b18f
.asm_1b17f
	farcall StartJump_FromInput
	ret

.asm_1b18f
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .asm_1b17f

	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr nz, .d_up
	bit D_DOWN_F, a
	jr nz, .d_down
	and D_RIGHT | D_LEFT
	jp nz, SetState_FenceMovingHorizontal
	jp SetState_FenceIdling

.d_up
	farcall Func_19ae4 ; unnecessary farcall
	ld a, [wIsNearFence]
	and a
	ret z
	ld b, $01
	call SubYOffset
	ret

.d_down
	ld b, $01
	call AddYOffset
	farcall CheckCentreCollision
	ld a, b
	and a
	jr nz, .asm_1b1ff
	farcall Func_19afb
	ld a, [wIsNearFence]
	and a
	ret nz
	farcall StartFall
	ret

.asm_1b1ff
	update_pos_y
	farcall SetState_Idling
	ret

Func_1b21a:
	ld a, [wJumpingUpwards]
	and a
	jr nz, .asm_1b237
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jr z, .asm_1b237
.asm_1b227
	farcall StartJump_FromInput
	ret

.asm_1b237
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .asm_1b227
	ld a, [wJoypadDown]
	and D_UP | D_DOWN
	jp nz, SetState_FenceMovingVertical
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_FenceMovingHorizontal
	ret

Func_1b24f:
	ld a, [wJumpingUpwards]
	and a
	jr nz, .asm_1b26c
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jr z, .asm_1b26c
.asm_1b25c
	farcall StartJump_FromInput
	ret

.asm_1b26c
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .asm_1b25c
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	and D_UP | D_DOWN
	jp nz, SetState_FenceMovingVertical
	jp SetState_FenceIdling

.d_right
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	ld b, $01
	call AddXOffset
	ret

.d_left
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	ld b, $01
	call SubXOffset
	ret

Func_1b2c0:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, SetState_SandJumping
	call Func_1b302

	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	farcall Func_2b17a

	ld a, [wWalkVelIndex]
	cp $04
	jr c, .asm_1b2f8
	ld a, $00
	ld [wWalkVelIndex], a
.asm_1b2f8
	ld a, [wIsTurning]
	and a
	jr z, .asm_1b301
	call Func_1a14b
.asm_1b301
	ret

Func_1b302:
	farcall CheckCentreCollision
	ld a, b
	and a
	ret nz

	ld b, $01
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr z, .asm_1b31e
	inc b
.asm_1b31e
	call AddYOffset
	ret

Func_1b322:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, SetState_SandJumping
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_SandWalking
	ret

Func_1b333:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, SetState_SandJumping
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	jp SetState_SandIdling

.d_right
	; this is buggy, wDirection is already
	; switched by input handling in the Sand Idling state
	; as a result, Sand Turning state will never be reached
	ld a, [wDirection]
	and a
	jp z, SetState_SandTurning
	ld a, DIRECTION_RIGHT
	ld [wDirection], a

	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	call ApplyWalkVelocity_Right
	call AddXOffset
.asm_1b36d
	ld a, [wWalkVelIndex]
	cp $04
	jr c, .asm_1b379
	ld a, $00
	ld [wWalkVelIndex], a
.asm_1b379
	ret

.d_left
	; this is buggy, wDirection is already
	; switched by input handling in the Sand Idling state
	; as a result, Sand Turning state will never be reached
	ld a, [wDirection]
	and a
	jp nz, SetState_SandTurning
	ld a, DIRECTION_LEFT
	ld [wDirection], a

	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	call ApplyWalkVelocity_Left
	call SubXOffset
	jr .asm_1b36d

HandleLadderInput:
	ld a, [wJoypadDown]
	and B_BUTTON | D_DOWN
	cp B_BUTTON | D_DOWN
	jp z, SetState_LadderSliding

	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr nz, .d_up
	bit D_DOWN_F, a
	jr nz, .d_down
	jp SetState_LadderIdling

.d_up
	farcall CheckUpCollision
	ld a, [wJumpCollision]
	and a
	ret nz
	ld b, 1
	call SubYOffset
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .asm_1b3e6
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr nc, .asm_1b3e6
	jp StartUpwardsFloorTransition

.asm_1b3e6
	ld a, [wLadderInteraction]
	and a
	ret nz
	farcall Func_19b12
	ld a, [wLadderInteraction]
	and a
	ret nz
.asm_1b3ff
	farcall SetState_Idling
	ret

.d_down
	ld b, $01
	call AddYOffset
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .asm_1b42b
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr z, .asm_1b42b
	jr c, .asm_1b42b
	jp StartDownwardsFloorTransition

.asm_1b42b
	farcall Func_19b12
	ld a, [wLadderInteraction]
	and a
	jr z, .no_more_ladder_interaction
	farcall CheckCentreCollision
	ld a, b
	and a
	ret z
	ld a, [wWarioXPos + 1]
	and $f0
	add $08
	ld [wWarioXPos + 1], a
	ret

.no_more_ladder_interaction
	farcall CheckCentreCollision
	ld a, b
	and a
	jr nz, .asm_1b3ff
	farcall StartFall
	ret

Func_1b480:
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jr z, .asm_1b48e
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jr nz, .asm_1b4a7

.asm_1b48e
	ld a, [wJoypadDown]
	and D_UP | D_DOWN
	jp nz, SetState_LadderClimbing
	ld hl, wWarioStateCounter
	ld a, [hl]
	add 1
	ld [hli], a
	ld a, [hl]
	adc 0
	ld [hl], a
	cp $02
	ret c
	jp SetState_LadderScratching

.asm_1b4a7
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_1b4d3
	ld a, -16
	ld [wCollisionBoxLeft], a
	farcall Func_197b1
	ld a, b
	and a
	jr nz, .asm_1b4eb
.asm_1b4c6
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	jp SetState_GettingOffLadder

.asm_1b4d3
	ld a, 16
	ld [wCollisionBoxRight], a
	farcall Func_19741
	ld a, b
	and a
	jr z, .asm_1b4c6
.asm_1b4eb
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ret
