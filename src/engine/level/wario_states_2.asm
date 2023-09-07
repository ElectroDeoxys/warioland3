UpdateWarioStates_Group2: ; 19c1b (6:5c1b)
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
	dw Func_156d                         ; WST_UNUSED_52
	dw Func_156d                         ; WST_UNUSED_53
	dw Func_156d                         ; WST_UNUSED_54
	dw Func_156d                         ; WST_UNUSED_55
	dw Func_156d                         ; WST_UNUSED_56
	dw Func_156d                         ; WST_UNUSED_57
	dw Func_156d                         ; WST_UNUSED_58
	dw Func_156d                         ; WST_UNUSED_59
	dw Func_156d                         ; WST_UNUSED_5A
	dw Func_156d                         ; WST_UNUSED_5B
	dw Func_156d                         ; WST_UNUSED_5C
	dw Func_156d                         ; WST_UNUSED_5D
	dw Func_156d                         ; WST_UNUSED_5E
	dw Func_156d                         ; WST_UNUSED_5F
; 0x19c81

SetState_Slipping: ; 19c81 (6:5c81)
	ld a, WST_SLIPPING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wAttackCounter], a
	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14000

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	ld [wWarioStateCycles], a
	and a
	jr nz, .asm_19ccd
	load_frameset Frameset_14252
	jr .got_frameset
.asm_19ccd
	load_frameset Frameset_1425f
.got_frameset
	update_anim_1
	ret
; 0x19ce7

UpdateState_Slipping: ; 19ce7 (6:5ce7)
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

	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14a82

	ld a, [wWarioStateCycles]
	and $01
	jr nz, .asm_19d56
	load_frameset Frameset_14cbe
	jr .asm_19daf
.asm_19d56
	load_frameset Frameset_14cc5
	jr .asm_19daf

.asm_19d62
	ld b, a
	ld a, [wAnimationEnded]
	and a
	jr z, .asm_19db6
	ld a, b
	add $02
	ld [wWarioStateCycles], a
	load_gfx WarioWalkGfx
	call LoadWarioGfx
	load_oam OAM_1426c

	ld a, [wWarioStateCycles]
	and $01
	jr nz, .asm_19da3
	load_frameset Frameset_149b4
	jr .asm_19daf
.asm_19da3
	load_frameset Frameset_149c5
	jr .asm_19daf

.asm_19daf
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
.asm_19db6
	update_anim_1
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
; 0x19e7f

SetState_CrouchSlipping: ; 19e7f (6:5e7f)
	xor a
	ld [wWarioStateCounter], a
	ld a, [wDirection]
	ld [wWarioStateCycles], a
;	fallthrough

Func_19e89: ; 19e89 (6:5e89)
	ld a, WST_CROUCH_SLIPPING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wAttackCounter], a
	ld [wGrabState], a
	inc a
	ld [wIsCrouching], a
	load_gfx WarioWalkGfx
	call LoadWarioGfx
	load_oam OAM_1426c

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wWarioStateCycles]
	cp $01
	jr z, .asm_19ed7
	load_frameset Frameset_14a38
	jr .got_frameset
.asm_19ed7
	load_frameset Frameset_14a3b
.got_frameset
	update_anim_1
	ret
; 0x19ef1

UpdateState_CrouchSlipping: ; 19ef1 (6:5ef1)
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
	farcall CrouchOrSlideIfOnSlope
	ret
; 0x19fb6

SetState_DraggedDown: ; 19fb6 (6:5fb6)
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

	load_gfx WarioAirborneGfx
	call LoadWarioGfx
	load_oam OAM_15955

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1a02c
	load_frameset Frameset_15f70
	jr .asm_1a036
.asm_1a02c
	load_frameset Frameset_15f7f
.asm_1a036
	update_anim_1
	ret
; 0x1a046

UpdateState_DraggedDown: ; 1a046 (6:6046)
	update_anim_1
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
; 0x1a077

UpdateState_Teleporting: ; 1a077 (6:6077)
	ld a, TRUE
	ld [wIsIntangible], a
	update_anim_1

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
	res ROOMTRANSITIONFLAG_3_F, [hl]
	jp TriggerRoomTransition

PlayTeleportingSFX: ; 1a0ab (6:60ab)
	play_sfx SFX_082
	ret
; 0x1a0b4

UpdateState_WaterTeleporting: ; 1a0b4 (6:60b4)
	ld a, TRUE
	ld [wIsIntangible], a
	update_anim_1

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
	res ROOMTRANSITIONFLAG_3_F, [hl]
	jp TriggerRoomTransition
; 0x1a0e8

SetState_SandFalling: ; 1a0e8 (6:60e8)
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
	ld hl, Pals_c800
	call SetWarioPal
;	fallthrough

Func_1a12a: ; 1a12a (6:612a)
	load_gfx WarioAirborneGfx
	call LoadWarioGfx
	load_oam OAM_15955
;	fallthrough

Func_1a14b: ; 1a14b (6:614b)
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1a164
	load_frameset Frameset_15f94
	jr .asm_1a16e
.asm_1a164
	load_frameset Frameset_15f97
.asm_1a16e
	update_anim_1
	ret
; 0x1a17e

UpdateState_SandFalling: ; 1a17e (6:617e)
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
; 0x1a1a7

SetState_SandJumping: ; 1a1a7 (6:61a7)
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
; 0x1a1c5

UpdateState_SandJumping: ; 1a1c5 (6:61c5)
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
; 0x1a236

SetState_SandIdling: ; 1a236 (6:6236)
	ld a, WST_SAND_IDLING
	ld [wWarioState], a

	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14000
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1a27c
	load_frameset Frameset_14252
	jr .asm_1a286
.asm_1a27c
	load_frameset Frameset_1425f
.asm_1a286
	update_anim_1
	ret
; 0x1a296

UpdateState_SandIdling: ; 1a296 (6:6296)
	call Func_1b322
	ret
; 0x1a29a

SetState_SandWalking: ; 1a29a (6:629a)
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
; 0x1a2d6

UpdateState_SandWalking: ; 1a2d6 (6:62d6)
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, $24
	ld [wSFXLoopCounter], a
	play_sfx SFX_WALK

.skip_sfx
	update_anim_1
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
; 0x1a330

SetState_SandTurning: ; 1a330 (6:6330)
	ld a, WST_SAND_TURNING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14a82

	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	and a
	jr nz, .asm_1a37a
	load_frameset Frameset_14cbe
	jr .asm_1a384
.asm_1a37a
	load_frameset Frameset_14cc5
.asm_1a384
	update_anim_1
	ret
; 0x1a394

UpdateState_SandTurning: ; 1a394 (6:6394)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, SetState_SandJumping
	update_anim_1
	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_SandWalking
	jp SetState_SandIdling
; 0x1a3bb

SetState_LadderClimbing: ; 1a3bb (6:63bb)
	ld a, WST_LADDER_CLIMBING
	ld [wWarioState], a
	ld a, [wXPosLo]
	and $f0
	add $08
	ld [wXPosLo], a

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
	load_gfx WarioLadderGfx
	call LoadWarioGfx
	load_oam OAM_155cc

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_158d6
	update_anim_1
	ret
; 0x1a436

UpdateState_LadderClimbing: ; 1a436 (6:6436)
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
	update_anim_1

	ld a, [wAnimationEnded]
	and a
	jr z, .asm_1a49a
	get_pos
	ld b, PARTICLE_DUST
	farcall CreateParticle
.asm_1a49a
	call HandleLadderInput
	ret
; 0x1a49e

SetState_LadderIdling: ; 1a49e (6:649e)
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
	load_gfx WarioLadderGfx
	call LoadWarioGfx
	load_oam OAM_155cc

	ld a, [wDirection]
	and a
	jr nz, .asm_1a511
	load_frameset Frameset_15900
.asm_1a501
	update_anim_1
	ret

.asm_1a511
	load_frameset Frameset_158fd
	jr .asm_1a501
; 0x1a51d

UpdateState_LadderIdling: ; 1a51d (6:651d)
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wLadderInteraction]
	and a
	jr nz, .asm_1a549
	farcall StartFall
	ret

.asm_1a549
	update_anim_1
	call Func_1b480
	ret
; 0x1a55c

UpdateState_LadderShakeSlipping: ; 1a55c (6:655c)
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wLadderInteraction]
	and a
	jr nz, .asm_1a588
	farcall StartFall
	ret
.asm_1a588
	update_anim_1

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
; 0x1a5ee

SetState_GettingOffLadder: ; 1a5ee (6:65ee)
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
; 0x1a617

UpdateState_GettingOffLadder: ; 1a617 (6:6617)
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
; 0x1a66b

SetState_LadderSliding: ; 1a66b (6:666b)
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
	load_frameset Frameset_15945
	update_anim_1
	ret
; 0x1a6b6

UpdateState_LadderSliding: ; 1a6b6 (6:66b6)
	farcall Func_19b25
	ld a, [wRoomTransitionParam]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wLadderInteraction]
	and a
	jr nz, .asm_1a6e6
	xor a ; FALSE
	ld [wIsSmashAttacking], a
	farcall StartFall
	ret

.asm_1a6e6
	update_anim_1

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
; 0x1a773

SetState_GrabSlipping: ; 1a773 (6:6773)
	ld a, WST_GRAB_SLIPPING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wAttackCounter], a
	load_gfx WarioWalkGfx
	call LoadWarioGfx
	load_oam OAM_1426c

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1a7bc
	load_frameset Frameset_14a20
	jr .asm_1a7c6
.asm_1a7bc
	load_frameset Frameset_14a23
.asm_1a7c6
	update_anim_1
	ret
; 0x1a7d6

UpdateState_GrabSlipping: ; 1a7d6 (6:67d6)
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
; 0x1a89e

UpdateState_GetTreasureStart: ; 1a89e (6:689e)
	update_anim_1
	ld a, [wJumpVelTable]
	and a
	jr z, .on_ground
	call ApplyJumpVelocity
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

SetNextGetTreasureState: ; 1a8e7 (6:68e7)
	ld hl, wWarioState
	inc [hl]
	xor a
	ld [wWarioStateCycles], a
	farcall Func_1e6ea
	ret
; 0x1a8ff

UpdateState_GetTreasureWalk: ; 1a8ff (6:68ff)
	update_anim_1
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
	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_1fc31b
	ld a, [wDirection]
	and a
	jr nz, .asm_1a966
	load_frameset Frameset_1fc46a
	jr .asm_1a970
.asm_1a966
	load_frameset Frameset_1fc461
.asm_1a970
	update_anim_2
	ret
; 0x1a980

UpdateState_GetTreasureTurnFront: ; 1a980 (6:6980)
	update_anim_2
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
	load_gfx WarioClearGfx
	call LoadWarioGfx
	load_oam OAM_1fc000
	load_frameset Frameset_1fc2ab
	update_anim_2
	ret
; 0x1a9e9

UpdateState_GetTreasureLaugh: ; 1a9e9 (6:69e9)
	update_anim_2
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
	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_1fc31b
	ld a, [wDirection]
	and a
	jr nz, .asm_1aa42
	load_frameset Frameset_1fc446
	jr .asm_1aa4c
.asm_1aa42
	load_frameset Frameset_1fc439
.asm_1aa4c
	update_anim_2
	ret
; 0x1aa5c

UpdateState_GetTreasureTurnBack: ; 1aa5c (6:6a5c)
	update_anim_2
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
	load_gfx WarioClearGfx
	call LoadWarioGfx
	load_oam OAM_1fc000
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_1fc2c4
	update_anim_2
	ret
; 0x1aac9

UpdateState_GetTreasureOpen: ; 1aac9 (6:6ac9)
	update_anim_2
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

	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_1fc31b

	ld a, [wDirection]
	xor $1
	ld [wDirection], a
	and a
	jr nz, .asm_1ab2a
	load_frameset Frameset_1fc45a
	jr .asm_1ab34
.asm_1ab2a
	load_frameset Frameset_1fc453
.asm_1ab34
	update_anim_2
	ret
; 0x1ab44

UpdateState_GetTreasureTurnWalk: ; 1ab44 (6:6b44)
	update_anim_2
	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, 32
	ld [wWarioStateCounter], a
	xor a
	ld [wAutoMoveState], a
	jp SetNextGetTreasureState
; 0x1ab64

SetState_GetTreasureLookFront: ; 1ab64 (6:6b64)
	ld a, WST_GET_TREASURE_LOOK_FRONT
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	load_gfx WarioClearGfx
	call LoadWarioGfx
	load_oam OAM_1fc000
	load_frameset Frameset_1fc30d
	update_anim_2
	ret
; 0x1abb1

UpdateState_GetTreasureLookFront: ; 1abb1 (6:6bb1)
	update_anim_2
	ld a, [wAnimationEnded]
	and a
	ret z
	ld a, WST_GET_TREASURE_CLEAR
	ld [wWarioState], a
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
	ld b, PARTICLE_TREASURE_GLOW
	farcall CreateParticle
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ret
; 0x1abf4

UpdateState_GetTreasureClear: ; 1abf4 (6:6bf4)
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
; 0x1ac10

SetState_Sleeping: ; 1ac10 (6:6c10)
	ld a, WST_SLEEPING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14000
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1ac59
	load_frameset Frameset_1421c
	jr .got_frameset
.asm_1ac59
	load_frameset Frameset_14225
.got_frameset
	update_anim_1
	ret
; 0x1ac73

UpdateState_Sleeping: ; 1ac73 (6:6c73)
	update_anim_1

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
	load_frameset Frameset_1422e
	jr .asm_1acc0
.asm_1acb6
	load_frameset Frameset_14237
.asm_1acc0
	update_anim_1
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
	load_frameset Frameset_14240
	jr .asm_1acc0
.asm_1ad00
	load_frameset Frameset_14249
	jr .asm_1acc0

.asm_1ad0c
	ld a, [wAnimationEnded]
	and a
	ret z
	farcall SetState_Idling
	ret
; 0x1ad21

SetState_LadderScratching: ; 1ad21 (6:6d21)
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
	load_frameset Frameset_15903
	jr .asm_1ad6d
.asm_1ad63
	load_frameset Frameset_15924
.asm_1ad6d
	update_anim_1
	ret
; 0x1ad7d

UpdateState_LadderScratching: ; 1ad7d (6:6d7d)
	update_anim_1
	ld a, [wJoypadDown]
	and a
	jr nz, .asm_1ad97
	ld a, [wAnimationEnded]
	and a
	ret z
.asm_1ad97
	jp SetState_LadderIdling
; 0x1ad9a

SetState_FenceShakeSliding: ; 1ad9a (6:6d9a)
	ld a, WST_FENCE_SHAKE_SLIDING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld a, $03
	ld [wAutoMoveState], a

	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14a82

	ld a, [wDirection]
	and a
	jr nz, .asm_1ade1
	load_frameset Frameset_14d0b
	jr .asm_1adeb
.asm_1ade1
	load_frameset Frameset_14d10
.asm_1adeb
	update_anim_1
	ret
; 0x1adfb

UpdateState_FenceShakeSliding: ; 1adfb (6:6dfb)
	update_anim_1
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_1ae3a
	ld a, [wAnimationEnded]
	and a
	jr z, .asm_1ae3a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_14d15
	update_anim_1

	ld hl, wWarioStateCounter
	inc [hl]
.asm_1ae3a
	ld a, [wJumpVelTable]
	and a
	jr z, .asm_1ae67
	call ApplyJumpVelocity
	farcall CheckAirborneCollision
	ld a, b
	and a
	ret z

	update_pos_y

	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

.asm_1ae67
	ret
; 0x1ae68

SetState_FenceMovingVertical: ; 1ae68 (6:6e68)
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
	load_gfx WarioLadderGfx
	call LoadWarioGfx
	load_oam OAM_155cc

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_158d6
	update_anim_1
	ret
; 0x1aed0

UpdateState_FenceMovingVertical:;1aed0 (6:6ed0)
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, $20
	ld [wSFXLoopCounter], a
	play_sfx SFX_CLIMB
.skip_sfx
	update_anim_1

	ld a, [wAnimationEnded]
	and a
	jr z, .asm_1af1e

	get_pos

	ld b, PARTICLE_DUST
	farcall CreateParticle
.asm_1af1e
	call Func_1b168
	ret
; 0x1af22

SetState_FenceIdling: ; 1af22 (6:6f22)
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
	load_gfx WarioLadderGfx
	call LoadWarioGfx
	load_oam OAM_155cc

	ld a, [wDirection]
	and a
	jr nz, .asm_1af7e
	load_frameset Frameset_15900
	jr .asm_1af88
.asm_1af7e
	load_frameset Frameset_158fd
.asm_1af88
	update_anim_1
	ret
; 0x1af98

UpdateState_FenceIdling: ; 1af98 (6:6f98)
	update_anim_1
	call Func_1b21a
	ret
; 0x1afab

SetState_FenceMovingHorizontal: ; 1afab (6:6fab)
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
	load_frameset Frameset_158f2
	jr .asm_1afff
.d_right
	load_frameset Frameset_158e7
.asm_1afff
	update_anim_1
	ret
; 0x1b00f

UpdateState_FenceMovingHorizontal: ; 1b00f (6:700f)
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
	update_anim_1
	call Func_1b24f
	ret
; 0x1b05e

SetState_FenceSliding: ; 1b05e (6:705e)
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
	load_frameset Frameset_15945
	update_anim_1
	ret
; 0x1b0a9

UpdateState_FenceSliding: ; 1b0a9 (6:70a9)
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
	update_anim_1
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
; 0x1b168

Func_1b168: ; 1b168 (6:7168)
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
; 0x1b21a

Func_1b21a: ; 1b21a (6:721a)
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
; 0x1b24f

Func_1b24f: ; 1b24f (6:724f)
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
; 0x1b2c0

Func_1b2c0: ; 1b2c0 (6:72c0)
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
; 0x1b302

Func_1b302: ; 1b302 (6:7302)
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
; 0x1b322

Func_1b322: ; 1b322 (6:7322)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, SetState_SandJumping
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_SandWalking
	ret
; 0x1b333

Func_1b333: ; 1b333 (6:7333)
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
; 0x1b3a0

HandleLadderInput: ; 1b3a0 (6:73a0)
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
	ld a, [wced2]
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
	jr z, .asm_1b45d
	farcall CheckCentreCollision
	ld a, b
	and a
	ret z
	ld a, [wXPosLo]
	and $f0
	add $08
	ld [wXPosLo], a
	ret

.asm_1b45d
	farcall CheckCentreCollision
	ld a, b
	and a
	jr nz, .asm_1b3ff
	farcall StartFall
	ret
; 0x1b480

Func_1b480: ; 1b480 (6:7480)
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
; 0x1b4f6
