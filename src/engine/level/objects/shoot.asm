DEF NUM_SHOOT_GOALS_NEEDED        EQU   3 ; number of goals Shoot needs to win
DEF NUM_WARIO_GOALS_NEEDED        EQU   3 ; number of goals Wario needs to win

DEF SHOOT_JUMP_X_SPEED            EQU   1 ; how fast Shoot moves horizontally while jumping
DEF SHOOT_PRESHOOT_X_SPEED        EQU   1 ; how fast Shoot moves horizontally when it has Wario ball
DEF SHOOT_OUT_OF_BALL_X_SPEED     EQU   2 ; how fast Shoot moves when jumping out of ball form

DEF SHOOT_TAUNT_DURATION          EQU  80 ; duration of taunt animation
DEF SHOOT_JUMP_DELAY_LONG         EQU  25 ; delay between jumps when Wario has 0 goals
DEF SHOOT_JUMP_DELAY_SHORT        EQU   2 ; delay between jumps when Wario has at least 1 goal
DEF SHOOT_IDLE_DURATION           EQU  27 ; duration of staying in standing state
DEF SHOOT_JUMP_UP_DURATION        EQU  22 ; duration of moving up while jumping
DEF SHOOT_TURN_AROUND_DURATION    EQU  42 ; duration of moving up while jumping
DEF SHOOT_REGULAR_BALL_DURATION   EQU 256 ; duration switching direction while following Wario
DEF SHOOT_LAST_GOAL_BALL_DURATION EQU 160 ; duration of ball form when Wario already has 2 goals
DEF SHOOT_DEFEAT_RISE_DURATION    EQU  28 ; duration of rising while playing defeated animation
DEF SHOOT_DEFEAT_SUSPENDED_DURATION EQU  70 ; duration of staying suspended while playing defeated animation

; Shoot phases controlled by Var1, when not in ball form
	const_def
	const SHOOTPHASE_STANDING
	const SHOOTPHASE_JUMPING_UP
	const SHOOTPHASE_JUMPING_DOWN
	const SHOOTPHASE_BETWEEN_JUMPS
	const SHOOTPHASE_TURNING
	const SHOOTPHASE_PREKICK_JUMP
	const SHOOTPHASE_PREKICK_ANIMATION
	const SHOOTPHASE_KICKING
	const SHOOTPHASE_SCORE_GOAL
	const SHOOTPHASE_WON

; wShootBallState constants
	const_def 5
	const SHOOTBALL_WARIO_KICKED ; Wario is moving towards goal after being kicked
	const SHOOTBALL_WARIO_GOAL   ; Wario entered the net zone and Shoot scores a goal

; GK Tortoise phases controlled by Var1
	const_def
	const GKTORTOISEPHASE_0
	const GKTORTOISEPHASE_1
	const GKTORTOISEPHASE_2
	const GKTORTOISEPHASE_3
	const GKTORTOISEPHASE_4
	const GKTORTOISEPHASE_5
	const GKTORTOISEPHASE_6
	const GKTORTOISEPHASE_DUCKING
	const GKTORTOISEPHASE_8
	const GKTORTOISEPHASE_9

ShootFunc:
	ld a, TRUE
	ld [wIsBossBattle], a
	stop_music2

	xor a
	ld [wShootCanTurnAround], a ; FALSE
	ld [wShootBallState], a

	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.StartWait)
	ld [hld], a
	ld a, LOW(.StartWait)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	or $5
	ld [hl], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 7
	ld [hld], a
	ld a, -8
	ld [hld], a
	ld a, -8
	ld [hl], a
	ld de, Frameset_69f7c
	call SetObjectFramesetPtr
	ld a, SHOOT_TAUNT_DURATION
	ld [hli], a

	; position Shoot 32 pixels up
	; and 96 pixels right
	ld a, 32
	ld [wCurObjVar2], a
	call MoveObjectUpByVar2
	ld a, 96
	ld [wCurObjVar2], a
	jp MoveObjectRightByVar2

.StartWait:
	; wait until is on screen to advance to next function
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	ret z
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Taunt)
	ld [hld], a
	ld a, LOW(.Taunt)
	ld [hld], a
	ret

.Taunt:
	; play SFX every 16 frames
	ld a, [wGlobalCounter]
	and %1111
	play_sfx z, SFX_0C6

	; wait for this state to finish
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz

	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Main)
	ld [hld], a
	ld a, LOW(.Main)
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_SHOOT
	ld [hli], a
	ld a, $01
	ld [wShootBallState], a
	ld a, $02
	ld [wBossBattleMusic], a
	call UpdateLevelMusic
	jp .set_standing

.asm_566a9
	play_sfx SFX_0C9
	ld a, [wCurObjSubState]
	rlca
	jr nc, .asm_566bd
.asm_566b7
	xor a
	ld [hld], a ; OBJ_STATE
	res OBJSUBFLAG_VDIR_F, [hl]
	jr .jump_out_of_ball
.asm_566bd
	xor a
	ld [hld], a ; OBJ_STATE
	set OBJSUBFLAG_VDIR_F, [hl]
.jump_out_of_ball
	ld a, [hld] ; OBJ_SUBSTATE
	rlca
	ld_obj_frameset Frameset_6a022 + $2, Frameset_6a03a + $2
	ld a, SHOOT_OUT_OF_BALL_X_SPEED
	ld [wCurObjVar2], a
	jp .set_jumping_up

.interacted_with_ball_wario
	xor a
	ld [hld], a ; OBJ_STATE
	dec l
	ld [hld], a ; OBJ_VAR_3

	; move up 16 pixels
	ld a, 16
	ld [hl], a ; OBJ_VAR_2
	call MoveObjectUpByVar2

	ld de, Frameset_69ffd
	call SetObjectFramesetPtr
	inc l
	ld a, SHOOTPHASE_PREKICK_JUMP
	ld [hli], a ; OBJ_VAR_1
	ld a, SHOOT_PRESHOOT_X_SPEED
	ld [hl], a ; OBJ_VAR_2

	; place Wario 16 pixels below Shoot
	ld l, OBJ_Y_POS
	ld a, [hli]
	add 16
	ld [wWarioYPos + 1], a
	ld a, [wWarioYPos + 0]
	adc 0
	ld [wWarioYPos + 0], a
	inc l
	ld a, [hli]
	ld [wWarioXPos + 1], a

	play_sfx SFX_FAT_WALK

	ld l, OBJ_SUBSTATE
	set OBJSUBFLAG_HDIR_F, [hl]
	; bug, this expects x position in register a
	; but the play_sfx macro cobbles it
	cp 123
	jr c, .nove_closer_to_net ; jump is always taken
; move farther from net
	res OBJSUBFLAG_VDIR_F, [hl]
	ret
.nove_closer_to_net
	set OBJSUBFLAG_VDIR_F, [hl]
	ret

.Main:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .HandleNormalState
	cp $0e
	jr z, .asm_566a9
	cp $04
	jr z, .asm_566bd
	cp $05
	jr z, .asm_566b7
	cp OBJSTATE_SPECIAL_3
	jr z, .interacted_with_ball_wario
	and $fe
	cp OBJSTATE_WOBBLE_LEFT_START ; aka OBJSTATE_WOBBLE_RIGHT_START
	jp z, .stepped_on
	cp OBJSTATE_VANISH_TOUCH
	jp z, .stepped_on
	xor a
	ld [hl], a
	ret

.HandleNormalState:
	ld a, [wCurObjVar1]
	jumptable
	dw .Standing         ; SHOOTPHASE_STANDING
	dw .JumpingUp        ; SHOOTPHASE_JUMPING_UP
	dw .JumpingDown      ; SHOOTPHASE_JUMPING_DOWN
	dw .BetweenJumps     ; SHOOTPHASE_BETWEEN_JUMPS
	dw .Turning          ; SHOOTPHASE_TURNING
	dw .PreKickJump      ; SHOOTPHASE_PREKICK_JUMP
	dw .PreKickAnimation ; SHOOTPHASE_PREKICK_ANIMATION
	dw .Kicking          ; SHOOTPHASE_KICKING
	dw .ScoreGoal        ; SHOOTPHASE_SCORE_GOAL
	dw .Won              ; SHOOTPHASE_WON

.set_standing
	ld hl, wCurObjSubState
	ld a, [hl]
	rlca
	jr c, .asm_56763
	res OBJSUBFLAG_VDIR_F, [hl]
	ld de, Frameset_6a022
	jr .asm_56768
.asm_56763
	set OBJSUBFLAG_VDIR_F, [hl]
	ld de, Frameset_6a03a
.asm_56768
	call SetObjectFramesetPtr
	ld a, SHOOT_IDLE_DURATION
	ld [hli], a ; OBJ_STATE_DURATION
	xor a ; SHOOTPHASE_STANDING
	ld [hli], a ; OBJ_VAR_1
	ld a, SHOOT_JUMP_X_SPEED
	ld [hl], a ; OBJ_VAR_2
	ret

.Standing:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz ; not finished yet
	ld a, [wCurObjSubState]
	rlca
	ld_obj_frameset Frameset_6a02b, Frameset_6a043
.set_jumping_up
	call SetObjectFramesetPtr
	ld a, SHOOT_JUMP_UP_DURATION
	ld [hli], a ; OBJ_STATE_DURATION
	ld a, SHOOTPHASE_JUMPING_UP
	ld [hli], a ; OBJ_VAR_1
	inc l
	xor a
	ld [hl], a ; OBJ_VAR_3
	play_sfx SFX_0C8
	ret

.JumpingUp:
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .set_jumping_down
	ld bc, Data_603d0
	call ApplyObjYMovement
	jp .MoveLeftOrRight
.set_jumping_down
	inc l
	ld a, SHOOTPHASE_JUMPING_DOWN
	ld [hli], a ; OBJ_VAR_1
	inc l
	xor a
	ld [hl], a ; OBJ_VAR_3
	ret

.JumpingDown:
	ld bc, Data_603e0
	call ApplyObjYMovement
	call .MoveLeftOrRight

	; check centre collision
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_352b
	and a
	jr nz, .grounded

	; check 16 pixels down collision
	ld hl, wCurObjYPos
	ld a, [hli]
	add 16
	ldh [hYPosLo], a
	ld a, [hli]
	adc 0
	ldh [hYPosHi], a
	call Func_352b
	and a
	jr nz, .high_16_px

	; check 32 pixels down collision
	ld hl, wCurObjYPos
	ld a, [hli]
	add 32
	ldh [hYPosLo], a
	ld a, [hli]
	adc 0
	ldh [hYPosHi], a
	call Func_352b
	and a
	jr nz, .high_32_px

	; check 48 pixels down collision
	ld hl, wCurObjYPos
	ld a, [hli]
	add 48
	ldh [hYPosLo], a
	ld a, [hli]
	adc 0
	ldh [hYPosHi], a
	call Func_352b
	and a
	jr nz, .high_48_px
	ret

.high_48_px
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_56817
	ld de, Frameset_6a02e
	jp SetObjectFramesetPtr
.asm_56817
	ld de, Frameset_6a046
	jp SetObjectFramesetPtr

.high_32_px
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_56829
	ld de, Frameset_6a031
	jp SetObjectFramesetPtr
.asm_56829
	ld de, Frameset_6a049
	jp SetObjectFramesetPtr

.high_16_px
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_5683b
	ld de, Frameset_6a034
	jp SetObjectFramesetPtr
.asm_5683b
	ld de, Frameset_6a04c
	jp SetObjectFramesetPtr

.grounded
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
.still_more_goals_needed
	ld hl, wCurObjSubState
	ld a, [wWarioXPos + 1]
	cp 192
	jr nc, .maybe_turn_around ; x >= 192
	; x < 192
	ld b, a
	ld a, [wCurObjXPos]
	cp b
	; carry set if Wario is left of Shoot
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr nz, .facing_right
	; turn around if Wario to right
	jr c, .turn_around
	jr .maybe_turn_around
.facing_right
	; turn around if Wario to left
	jr nc, .turn_around
.maybe_turn_around
	; only turn around if wShootCanTurnAround == TRUE
	ld a, [wShootCanTurnAround]
	and a
	jr nz, .turn_around
	; else do a jump
	ld a, [hl] ; OBJ_SUBSTATE
	rlca
	ld_obj_frameset Frameset_6a037, Frameset_6a04f
	call SetObjectFramesetPtr

	; set jumping delay
	ld a, [wWarioGoals]
	and a
	jr nz, .at_least_1_goal
; 0 goals
	ld a, SHOOT_JUMP_DELAY_LONG
	jr .got_jump_delay
.at_least_1_goal
	ld a, SHOOT_JUMP_DELAY_SHORT
.got_jump_delay
	ld [hli], a ; OBJ_STATE_DURATION

	ld a, SHOOTPHASE_BETWEEN_JUMPS
	ld [hli], a ; OBJ_VAR_1
	ret

.turn_around
	ld a, [hl]
	rlca
	ld_obj_frameset Frameset_69f35, Frameset_69f40
	call SetObjectFramesetPtr
	ld a, SHOOT_TURN_AROUND_DURATION
	ld [hli], a ; OBJ_STATE_DURATION
	ld a, SHOOTPHASE_TURNING
	ld [hli], a ; OBJ_VAR_1
	xor a ; FALSE
	ld [wShootCanTurnAround], a
	ret

.BetweenJumps:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	jp .set_standing

.Turning:
	ld hl, wCurObjStateDuration
	dec [hl]
	jp z, .set_standing
	ld a, [hl]
	cp SHOOT_TURN_AROUND_DURATION / 2
	ret nz
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	ret

.PreKickJump:
	; handle movement in x and y axis
	call .DoPreKickingXMovement
	ld bc, Data_54000
	call DoPreKickingJumpYMovement

	ld hl, wCurObjYPos
	ld a, [hl]
	ld b, 224
	cp b
	ret c ; y < 224

	; y >= 224
	ld de, Frameset_6a000
	call SetObjectFramesetPtr
	inc l
	ld a, SHOOTPHASE_PREKICK_ANIMATION
	ld [hli], a ; OBJ_VAR_1

	; move down 16 pixels
	ld a, 16
	ld [hl], a ; OBJ_VAR_2
	call MoveObjectDownByVar2

	; snap Shoot and Wario to y = 240
	; and position Wario to (Shoot's x + 8)
	ld l, OBJ_Y_POS
	ld a, 240
	ld [hli], a
	ld [wWarioYPos + 1], a
	ld a, [hli]
	ld [wWarioYPos + 0], a
	ld a, [hli] ; OBJ_X_POS
	add 8
	ld [wWarioXPos + 1], a
	ret

.PreKickAnimation:
	; wait frame to finish
	ld hl, wCurObjFrameDuration
	ld a, [hli]
	and a
	ret nz

	; is it frame 6?
	ld a, [hli] ; OBJ_FRAMESET_OFFSET
	cp 6
	jr z, .frame_6
	; is it frame 10?
	cp 10
	ret nz
	inc l
	ld a, SHOOTPHASE_KICKING
	ld [hl], a ; OBJ_VAR_1
	ld de, Frameset_69f54
	jp SetObjectFramesetPtr
.frame_6
	; move Wario 8 pixels right
	ld a, [wWarioXPos + 1]
	add 8
	ld [wWarioXPos + 1], a
	play_sfx SFX_HANG_GRAB
	ret

.Kicking:
	ld a, [wShootBallState]
	cp SHOOTBALL_WARIO_KICKED
	call z, .MoveWarioBallAfterKick
	ld hl, wCurObjFrameDuration
	ld a, [hli] ; OBJ_FRAME_DURATION
	and a
	ret nz
	ld a, [hli] ; OBJ_FRAMESET_OFFSET
	cp 4
	jr z, .shoot_wario
	cp 8
	ret nz
	inc l
	ld a, SHOOTPHASE_SCORE_GOAL
	ld [hl], a ; OBJ_VAR_1
	ld de, Frameset_6a00b
	jp SetObjectFramesetPtr
.shoot_wario
	ld a, SHOOTBALL_WARIO_KICKED
	ld [wShootBallState], a
	xor a
	ld [wCurObjVar3], a
	ld a, $2 | (1 << 7)
	ld [wAutoMoveState], a
	play_sfx SFX_034
	ret

.ScoreGoal:
	ld a, [wShootBallState]
	cp SHOOTBALL_WARIO_GOAL
	jp nz, .MoveWarioBallAfterKick
	ld hl, wShootGoals
	ld a, [hl]
	cp NUM_SHOOT_GOALS_NEEDED
	jr z, .no_goal_increment
	inc [hl]
	ld b, [hl]
.no_goal_increment
	ld a, $1 | (1 << 7)
	ld [wAutoMoveState], a
	play_sfx SFX_0C7
	ld a, TRUE
	ld [wShootCanTurnAround], a
	ld hl, wCurObjSubState
	res OBJSUBFLAG_VDIR_F, [hl]
	ld a, b
	cp NUM_SHOOT_GOALS_NEEDED
	jp nz, .still_more_goals_needed
	; reached target num of goals
	ld a, SHOOTPHASE_WON
	ld [wCurObjVar1], a
	ret

.Won:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ret

.MoveWarioBallAfterKick:
	ld a, [wWarioXPos + 1]
	cp 237
	jr nc, .ball_wario_inside_net
; move Wario right
	ld bc, Data_54010
	call ApplyYOffsetOnKickedWarioBall
	ld b, 3
	jp MoveWarioRight
.ball_wario_inside_net
; move Wario down to the ground
	ld a, [wWarioYPos + 1]
	cp 240
	jr nc, .set_wario_ball_goal_state
	ld b, 3
	jp MoveWarioDown
.set_wario_ball_goal_state
; if on ground, set goal state
	ld a, SHOOTBALL_WARIO_GOAL
	ld [wShootBallState], a
	ret

.DoPreKickingXMovement:
	ld a, [wCurObjVar2]
	ld b, a
	ld hl, wCurObjSubState
	bit OBJSUBFLAG_VDIR_F, [hl]
	jr nz, .move_with_wario_right
; move with Wario left
	call MoveObjectLeftByVar2
	jp MoveWarioLeft
.move_with_wario_right
	call MoveObjectRightByVar2
	jp MoveWarioRight

.MoveLeftOrRight:
	ld a, [wCurObjSubState]
	rlca
	rlca
	ld a, [wCurObjXPos]
	jr c, .moving_right ; OBJSUBFLAG_VDIR_F
; moving left
	cp 27
	jp nc, MoveObjectLeftByVar2
	play_sfx SFX_08D
	ld hl, wCurObjSubState
	set OBJSUBFLAG_VDIR_F, [hl]
	bit OBJSUBFLAG_HDIR_F, [hl]
	ret nz
	jr .set_can_turn_around
.moving_right
	cp 219
	jp c, MoveObjectRightByVar2
	play_sfx SFX_08D
	ld hl, wCurObjSubState
	res OBJSUBFLAG_VDIR_F, [hl]
	bit OBJSUBFLAG_HDIR_F, [hl]
	ret z
.set_can_turn_around
	ld a, TRUE
	ld [wShootCanTurnAround], a
	ret

.stepped_on
	ld de, Frameset_69f5d
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.BallForm)
	ld [hld], a
	ld a, LOW(.BallForm)
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, OBJ_INTERACTION_01
	ld [hli], a
	ld a, -18
	ld [hli], a ; OBJ_COLLBOX_TOP
	ld a, 0
	ld [hl], a ; OBJ_COLLBOX_BOTTOM
.BallForm:
	ld hl, wCurObjFlags
	ld a, [wCurObjXPos]
	cp 219
	jr nc, .asm_56a2a
	set OBJFLAG_GRABBED_F, [hl]
	jr .asm_56a2c
.asm_56a2a
	res OBJFLAG_GRABBED_F, [hl]
.asm_56a2c
	ld a, [wCurObjState]
	jumptable
	dw .Func_56b20
	dw .Func_56b2a
	dw .Func_56bae
	dw .Func_56bb8
	dw .Func_56c1b
	dw .Func_56c3d
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56bae
	dw .Func_56bb8
	dw .Func_56b96
	dw .Func_56bae
	dw .Func_56bb8
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56bd1
	dw .Func_56bd1
	dw .Func_56b20
	dw .Func_56bdb
	dw .Func_56be3
	dw .Func_56bf1
	dw .Func_56bf8
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw Func_3191
	dw Func_31af
	dw Func_31cd
	dw Func_31eb
	dw Func_3209
	dw Func_3227
	dw Func_3245
	dw Func_3254
	dw .Func_56af0
	dw .Func_56af0
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56d1c
	dw .Func_56b20
	dw .Func_56b20
	dw ObjState_Fall
	dw .Func_56b47
	dw ObjState_BumpLeft
	dw ObjState_BumpRight
	dw .Func_56c49
	dw .Func_56c49
	dw Func_3335
	dw Func_3344
	dw Func_31fa
	dw Func_31dc
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw ObjState_StandingFall
	dw Func_3371
	dw .Func_56b20
	dw Func_32cc
	dw Func_32db
	dw .Func_56bff
	dw .Func_56c0d
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw Func_31a0
	dw Func_31be
	dw Func_31dc
	dw Func_31fa
	dw Func_3218
	dw Func_3236
	dw Func_32cc
	dw Func_32db
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20

.Func_56af0:
	ld a, $2d
	ld [wCurObjState], a
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld de, Frameset_69f5d
	jp SetObjectFramesetPtr

.return_to_regular_form
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Main)
	ld [hld], a
	ld a, LOW(.Main)
	ld [hld], a
	ld l, OBJ_STATE
	ld a, $05
	ld [hld], a
	res 7, [hl]
	ld l, OBJ_INTERACTION_TYPE
	ld a, OBJ_INTERACTION_SHOOT | HEAVY_OBJ
	ld [hli], a
	ld a, -32
	ld [hli], a
	ld a, -8
	ld [hl], a
	ret

.Func_56b20:
	ld hl, wCurObjState
	ld a, $30
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ret

.Func_56b2a:
	ld hl, wCurObjState
	ld a, $31
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_VAR_3
	dec l
	ld a, [wWarioGoals]
	cp 2
	jr nc, .at_least_2_goals
	xor a ; treated as $100 (SHOOT_REGULAR_BALL_DURATION)
	jr .got_ball_form_duration
.at_least_2_goals
	ld a, SHOOT_LAST_GOAL_BALL_DURATION
.got_ball_form_duration
	ld [hl], a ; OBJ_VAR_1
	ld de, Frameset_69f5d
	call SetObjectFramesetPtr
.Func_56b47:
	ld a, [wCurObjVar3]
	cp $22
	play_sfx z, SFX_075
	ld hl, wCurObjVar1
	dec [hl]
	jr z, .return_to_regular_form
	ld a, [hl]
	cp $12
	jr nz, .asm_56b71
	ld de, Frameset_69f93
	call SetObjectFramesetPtr
	play_sfx SFX_0B7
	jr .asm_56b90
.asm_56b71
	jr c, .asm_56b90
	cp $64
	jr nz, .asm_56b7f
	ld de, Frameset_69f66
	call SetObjectFramesetPtr
	jr .asm_56b81
.asm_56b7f
	jr nc, .asm_56b90
.asm_56b81
	ld a, [wGlobalCounter]
	and %1111
	play_sfx z, SFX_06A
.asm_56b90
	ld bc, Data_60e40
	jp ApplyObjYMovement_Loop

.Func_56b96:
	play_sfx SFX_014
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr nc, .Func_56bae
	jr .Func_56bb8
.Func_56bae:
	ld hl, wCurObjAction
	ld a, no_actions_for 15
	ld [hld], a
	ld a, $38
	jr .asm_56bc0
.Func_56bb8:
	ld hl, wCurObjAction
	ld a, no_actions_for 15
	ld [hld], a
	ld a, $39
.asm_56bc0
	ld [hld], a ; OBJ_STATE
	ld de, Frameset_69f5d
	call SetObjectFramesetPtr
	ld a, 4
	ld [hli], a
	inc l
	ld a, $02
	ld [hli], a ; OBJ_VAR_2
	xor a
	ld [hli], a
	ret

.Func_56bd1:
	ld hl, wCurObjState
	ld a, $41
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ret

.Func_56bdb:
	ld hl, wCurObjState
	ld a, $44
	ld [hld], a
	jr .asm_56be9
.Func_56be3:
	ld hl, wCurObjState
	ld a, $45
	ld [hld], a
.asm_56be9
	ld l, OBJ_VAR_2
	ld a, $02
	ld [hli], a
	xor a
	ld [hli], a
	ret

.Func_56bf1:
	ld hl, wCurObjState
	ld a, $46
	ld [hld], a
	ret

.Func_56bf8:
	ld hl, wCurObjState
	ld a, $47
	ld [hld], a
	ret

.Func_56bff:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, $0f
	ld [wCurObjState], a
	ret

.Func_56c0d:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, $0f
	ld [wCurObjState], a
	ret

.Func_56c1b:
	ld a, $34
	ld de, Frameset_69f9f
	ld hl, wCurObjSubState
	set OBJSUBFLAG_VDIR_F, [hl]
.asm_56c25
	inc l
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ld a, [wCurObjYPos]
	cp 216
	jr c, .asm_56c37
	ld a, $02
	ld [hld], a
	jp SetObjectFramesetPtr
.asm_56c37
	ld a, $04
	ld [hld], a
	jp SetObjectFramesetPtr

.Func_56c3d:
	ld a, $35
	ld de, Frameset_69fa4
	ld hl, wCurObjSubState
	res OBJSUBFLAG_VDIR_F, [hl]
	jr .asm_56c25

.Func_56c49:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld a, [wShootCanTurnAround]
	and a
	jr z, .asm_56c5e
	xor a ; FALSE
	ld [wShootCanTurnAround], a
	ld de, Frameset_69f5d
	call SetObjectFramesetPtr
.asm_56c5e
	call .Func_56cdb
	ld a, [wCurObjVar2]
	cp $04
	jr z, .asm_56c6d
	ld bc, Data_60e20
	jr .asm_56c70
.asm_56c6d
	ld bc, Data_60e70
.asm_56c70
	call ApplyObjYMovement
	ld hl, wCurObjYPos
	ld a, [hl]
	ld b, 240
	cp b
	ret c ; y < 240
	; y >= 240

	; snap Shoot to y = 240
	ld [hl], b

	ld a, [wShootBallState]
	cp $04
	jr nz, .asm_56c93
	ld a, [wWarioGoals]
	cp NUM_WARIO_GOALS_NEEDED
	jp z, .set_defeated
	ld a, $01
	ld [wShootBallState], a
	jp .return_to_regular_form
.asm_56c93
	ld l, OBJ_SUBSTATE
	bit OBJSUBFLAG_VDIR_F, [hl]
	jr nz, .asm_56c9e
	inc l
	ld a, $09
	ld [hl], a ; OBJ_STATE
	ret
.asm_56c9e
	ld a, [wCurObjXPos]
	cp 219
	jr nc, .asm_56caa
	inc l
	ld a, $08
	ld [hl], a ; OBJ_STATE
	ret
.asm_56caa
	inc l
	ld a, $2d
	ld [hl], a ; OBJ_STATE

	ld a, $02
	ld [wShootBallState], a

	play_sfx SFX_0C7

	ld hl, wWarioGoals
	ld a, [hl]
	cp NUM_WARIO_GOALS_NEEDED
	jr z, .asm_56cd5
	inc [hl]
	ld a, [hl]
	cp NUM_WARIO_GOALS_NEEDED
	jr nz, .asm_56cd5
	stop_music2
.asm_56cd5
	ld de, Frameset_69f9a
	jp SetObjectFramesetPtr

.Func_56cdb:
	ld a, [wCurObjSubState]
	rlca
	rlca
	jr c, .asm_56cf1
	ld a, [wCurObjXPos]
	cp 27
	jp nc, MoveObjectLeftByVar2
	ld hl, wCurObjSubState
	set OBJSUBFLAG_VDIR_F, [hl]
	jr .asm_56d05
.asm_56cf1
	ld a, [wCurObjYPos]
	cp 208
	jr nc, .asm_56d13
	ld a, [wCurObjXPos]
	cp 219
	jp c, MoveObjectRightByVar2
	ld hl, wCurObjSubState
	res OBJSUBFLAG_VDIR_F, [hl]
.asm_56d05
	ld a, TRUE
	ld [wShootCanTurnAround], a
	play_sfx SFX_01A
	ret
.asm_56d13
	ld a, [wCurObjXPos]
	cp 243
	jp c, MoveObjectRightByVar2
	ret

.Func_56d1c:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld a, [wShootBallState]
	cp $04
	ret nz
	ld de, Frameset_69fa4
	call SetObjectFramesetPtr
	ld l, OBJ_STATE
	ld a, $35
	ld [hld], a
	res OBJSUBFLAG_VDIR_F, [hl] ; OBJ_SUBSTATE
	dec l
	xor a
	ld [hld], a ; OBJ_VAR_3
	ld a, [wWarioGoals]
	cp NUM_WARIO_GOALS_NEEDED
	jr nz, .asm_56d47
	ld a, $01
	jr .asm_56d49
.asm_56d47
	ld a, $03
.asm_56d49
	ld [hl], a ; OBJ_VAR_2
	ret

.set_defeated
	ld de, Frameset_69f8a
	call SetObjectFramesetPtr
	ld a, SHOOT_DEFEAT_RISE_DURATION
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.DefeatRise)
	ld [hld], a
	ld a, LOW(.DefeatRise)
	ld [hld], a
	ld l, OBJ_STATE
	ld a, $48
	ld [hld], a
	ld a, [hl] ; OBJ_SUBSTATE
	and OBJSUBFLAG_UNINITIALISED | OBJSUBFLAG_VDIR | OBJSUBFLAG_HDIR
	ld [hld], a
	xor a
	ld [hl], a ; OBJ_VAR_3
	ld l, OBJ_FLAGS
	set OBJFLAG_PRIORITY_F, [hl]
	ld hl, wCurObjUnk02
	ld e, $09
	farcall Func_ba42
	play_sfx SFX_0A9
	ret

.DefeatRise:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_56d99
	ld bc, Data_60e90
	jp ApplyObjYMovement
.asm_56d99
	xor a
	ld [wCurObjVar3], a
	ld de, Frameset_69f6f
	call SetObjectFramesetPtr
	ld a, SHOOT_DEFEAT_SUSPENDED_DURATION
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.DefeatSuspendAndFall)
	ld [hld], a
	ld a, LOW(.DefeatSuspendAndFall)
	ld [hld], a
	ret

.DefeatSuspendAndFall:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .fall
; still supsended in air
	dec [hl]
	ret nz
	play_sfx SFX_0A3
	ret
.fall
	ld bc, Data_60ea0
	jp ApplyObjYMovement

GKTortoisePlatformFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.MoveLeft)
	ld [hld], a
	ld a, LOW(.MoveLeft)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 5
	ld [hld], a
	ld a, -6
	ld [hld], a
	ld de, Frameset_69fdc
	call SetObjectFramesetPtr
	ld a, 32
	ld [hli], a
	ld a, 60
	ld [hli], a ; OBJ_VAR_1

	; move 64 pixels right and 16 pixels down
	ld a, 64
	ld [hl], a ; OBJ_VAR_2
	call MoveObjectRightByVar2
	ld a, 16
	ld [wCurObjVar2], a
	jp MoveObjectDownByVar2

.MoveLeft:
	call SetOneWayPlatformAction
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .wait_set_move_up_and_down
	dec [hl]
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	jp MoveObjectLeft
.wait_set_move_up_and_down
	inc l
	dec [hl] ; OBJ_VAR_1
	ret nz
	dec l
	ld a, 176
	ld [hl], a ; OBJ_STATE_DURATION
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.MoveUpAndDown)
	ld [hld], a
	ld a, LOW(.MoveUpAndDown)
	ld [hld], a
	ret

.MoveUpAndDown:
	call SetOneWayPlatformAction
	ld hl, wCurObjVar1
	ld a, [hld]
	and a
	jr z, .moving_up
	inc [hl] ; OBJ_STATE_DURATION
	ld a, [hli]
	cp 176
	jr z, .set_move_up
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	jp z, MoveObjectDown
	res OBJFLAG_STEPPED_F, [hl]
	ld b, 1
	call MoveWarioDown
	call HandleDownwardsFloorTransition
	jp MoveObjectDown
.set_move_up
	xor a
	ld [hl], a ; OBJ_VAR_1
	ld [wCurObjState], a
	ret

.moving_up
	dec [hl] ; OBJ_STATE_DURATION
	jr z, .set_move_down
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	jp z, MoveObjectUp
	res OBJFLAG_STEPPED_F, [hl]
	ld b, 1
	call MoveWarioUp
	call HandleUpwardsFloorTransition
	jp MoveObjectUp
.set_move_down
	inc l
	ld a, $01
	ld [hl], a ; OBJ_VAR_1
	ret

GKTortoiseFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Main)
	ld [hld], a
	ld a, LOW(.Main)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 5
	ld [hld], a
	ld a, -6
	ld [hld], a
	ld de, Frameset_69fed
	call SetObjectFramesetPtr
	inc l
	xor a ; GKTORTOISEPHASE_0
	ld [hli], a ; OBJ_VAR_1

	; move 64 pixels right and 16 pixels down
	ld a, 64
	ld [hl], a
	call MoveObjectRightByVar2
	ld a, 16
	ld [wCurObjVar2], a
	jp MoveObjectDownByVar2

.set_ducking
	ld de, Frameset_6a017
	call SetObjectFramesetPtr
	inc l
	ld a, GKTORTOISEPHASE_DUCKING
	ld [hl], a ; OBJ_VAR_1
	ld a, -10
	ld [wCurObjCollBoxTop], a
	ret

.Main:
	ld a, [wTransformation]
	and a
	jr z, .wario_not_transformed
	ld a, no_actions_for 1
	ld [wCurObjAction], a
.wario_not_transformed
	; GK Tortoise will automatically duck
	; if Shoot kicks Wario towards net
	ld a, [wShootBallState]
	cp SHOOTBALL_WARIO_KICKED
	jr nz, .no_kicked_wario
	; is it already ducking?
	ld a, [wCurObjVar1]
	cp GKTORTOISEPHASE_DUCKING
	jr nz, .set_ducking
.no_kicked_wario
	ld a, [wCurObjVar1]
	jumptable
	dw .Func_56f27 ; GKTORTOISEPHASE_0
	dw .Func_56f2e ; GKTORTOISEPHASE_1
	dw .Func_56fef ; GKTORTOISEPHASE_2
	dw .Func_57021 ; GKTORTOISEPHASE_3
	dw .Func_5707b ; GKTORTOISEPHASE_4
	dw .Func_57039 ; GKTORTOISEPHASE_5
	dw .Func_57198 ; GKTORTOISEPHASE_6
	dw .Ducking ; GKTORTOISEPHASE_DUCKING
	dw .Func_56edd ; GKTORTOISEPHASE_8
	dw .Func_5710f ; GKTORTOISEPHASE_9

.Func_56edd:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ld hl, wCurObjUnk02
	ld e, $08
	farcall Func_ba42
	ld a, $03
	ld [wBossBattleMusic], a
	call UpdateLevelMusic
	xor a
	ld [wIsBossBattle], a
	ret

.Ducking:
	ld hl, wCurObjFramesetOffset
	ld a, [hld]
	cp 10
	jr z, .duck_delay
	cp 6
	ret c ; < 6
	; add delay if Wario still didn't enter net
	ld a, [wShootBallState]
	cp SHOOTBALL_WARIO_GOAL
	ret z
	ld a, 16
	ld [hl], a ; OBJ_FRAME_DURATION
	ret
.duck_delay
	ld a, [hl] ; OBJ_FRAME_DURATION
	and a
	ret nz
	jp .asm_56fd2

.Func_56f27:
	ld a, [wShootBallState]
	and a
	jp nz, .asm_57009
.Func_56f2e:
	ld a, [wShootBallState]
	cp $02
	jr z, .asm_56f93
	ld hl, wCurObjAction
	xor a
	ld [hld], a
	ld a, [hl] ; OBJ_STATE
	and a
	ret z
	cp $2f
	jr z, .asm_56fa3
	and $fe
	cp $08
	jr nz, .asm_56f7d
	xor a
	ld [hl], a ; OBJ_STATE
	ld de, Frameset_69ff2
	call SetObjectFramesetPtr
	inc l
	ld a, GKTORTOISEPHASE_9
	ld [hl], a ; OBJ_VAR_1
	ld a, $03
	ld [wShootBallState], a
	play_sfx SFX_FAT_WALK
	call .Func_57170

.set_shoot_pos_11x_16y
	call .GetShootPosPtr

	; set Shoot.y = GK.y - 16
	ld de, wCurObjYPos
	ld a, [de]
	sub 16
	ld [hli], a
	inc e
	ld a, [de]
	sbc 0
	ld [hli], a

	; set Shoot.x = GK.x - 11
	inc e
	ld a, [de]
	sub 11
	ld [hli], a
	inc e
	ld a, [de]
	sbc 0
	ld [hli], a
	ret

.asm_56f7d
	xor a
	ld [hl], a
	ld de, Frameset_69fcf
	call SetObjectFramesetPtr
	inc l
	ld a, $02
	ld [hl], a
	ld a, -10
	ld [wCurObjCollBoxTop], a
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ret
.asm_56f93
	ld a, $03
	ld [wShootBallState], a
	ld de, Frameset_69fba
	call SetObjectFramesetPtr
	inc l
	ld a, $04
	ld [hl], a
	ret

.asm_56fa3
	xor a
	ld [hl], a ; OBJ_STATE
	ld de, Frameset_69ff2
	call SetObjectFramesetPtr
	inc l
	ld a, GKTORTOISEPHASE_5
	ld [hl], a ; OBJ_VAR_1
	play_sfx SFX_FAT_WALK
.set_wario_pos_11x_16y
	; set Wario.y = GK.y - 16
	ld l, OBJ_Y_POS
	ld a, [hli]
	sub 16
	ld [wWarioYPos + 1], a
	ld a, [hli]
	sbc 0
	ld [wWarioYPos + 0], a

	; set Wario.x = GK.x - 11
	ld a, [hli]
	sub 11
	ld [wWarioXPos + 1], a
	ld a, [hli]
	sbc 0
	ld [wWarioXPos + 0], a
	ret

.asm_56fd2
	ld a, $07
	ld [wShootBallState], a
	ld de, Frameset_69fba
	call SetObjectFramesetPtr
	inc l
	ld a, $06
	ld [hl], a
	ld a, -20
	ld [wCurObjCollBoxTop], a
	play_sfx SFX_FAT_WALK
	ret

.Func_56fef:
	ld a, [wShootBallState]
	cp $02
	jr z, .asm_56fff
	ld hl, wCurObjState
	ld a, [hl]
	and $fe
	jp nz, .asm_56f7d
.asm_56fff
	ld hl, wCurObjFramesetOffset
	ld a, [hld]
	cp $0c
	ret nz
	ld a, [hld]
	and a
	ret nz
.asm_57009
	ld de, Frameset_69fa9
	call SetObjectFramesetPtr
	inc l
	ld a, GKTORTOISEPHASE_1
	ld [hl], a ; OBJ_VAR_1
	xor a
	ld [wCurObjState], a
	ld a, -20
	ld [wCurObjCollBoxTop], a
	ld l, OBJ_FLAGS
	res OBJFLAG_NO_COLLISION_F, [hl]
	ret

.Func_57021:
	ld hl, wCurObjFlags
	res 3, [hl]
	ld l, OBJ_STATE
	ld a, [hl]
	and $fe
	jp nz, .asm_56f7d
	ld l, OBJ_FRAMESET_OFFSET
	ld a, [hld]
	cp $06
	ret nz
	ld a, [hld]
	and a
	ret nz
	jr .asm_57009

.Func_57039:
	ld hl, wCurObjFrameDuration
	ld a, [hli]
	and a
	ret nz
	; end of frame
	ld a, [hl]
	cp 2
	jr z, .set_wario_pos_22y
	cp 4
	jp z, .set_wario_pos_11x_16y
	cp 6
	jr z, .asm_57069
	cp 10
	ret nz
	jr .asm_57009

.set_wario_pos_22y
	; set Wario.y = GK.y - 16
	ld l, OBJ_Y_POS
	ld a, [hli]
	sub 22
	ld [wWarioYPos + 1], a
	ld a, [hli]
	sbc 0
	ld [wWarioYPos + 0], a

	; set Wario.x = GK.x
	ld a, [hli]
	ld [wWarioXPos + 1], a
	ld a, [hli]
	ld [wWarioXPos + 0], a
	ret

.asm_57069
	xor a
	ld [wAutoMoveState], a
	ld a, no_actions_for 15
	ld [wCurObjAction], a
	play_sfx SFX_067
	ret

.Func_5707b:
	ld hl, wCurObjFlags
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_FRAME_DURATION
	ld a, [hli]
	and a
	ret nz
	ld a, [hl]
	cp $06
	jr z, .asm_570c1
	cp $08
	jr z, .asm_570df
	cp $0e
	jr z, .asm_570f5
	cp $10
	jr z, .asm_570b3
	cp $14
	ret nz
	ld a, [wWarioGoals]
	cp NUM_WARIO_GOALS_NEEDED
	jp nz, .asm_57009
	ld de, Frameset_6a00e
	call SetObjectFramesetPtr
	ld a, 180
	ld [hli], a ; OBJ_STATE_DURATION
	ld a, GKTORTOISEPHASE_8
	ld [hl], a ; OBJ_VAR_1
	ld a, -10
	ld [wCurObjCollBoxTop], a
	ret

.asm_570b3
	ld a, $04
	ld [wShootBallState], a
	play_sfx SFX_067
	ret

.asm_570c1
	play_sfx SFX_FAT_WALK
	call .GetShootPosPtr
	ld de, wCurObjYPos
	ld a, [de]
	ld [hli], a
	inc e
	ld a, [de]
	ld [hli], a
	inc e
	ld a, [de]
	add $0c
	ld [hli], a
	inc e
	ld a, [de]
	adc $00
	ld [hli], a
	ret
.asm_570df
	call .GetShootPosPtr
	ld de, wCurObjYPos
	ld a, [de]
	sub $16
	ld [hli], a
	inc e
	ld a, [de]
	sbc $00
	ld [hli], a
	inc e
	ld a, [de]
	ld [hli], a
	inc e
	ld a, [de]
	ld [hli], a
	ret
.asm_570f5
	call .GetShootPosPtr
	ld de, wCurObjYPos
	ld a, [de]
	sub $10
	ld [hli], a
	inc e
	ld a, [de]
	sbc $00
	ld [hli], a
	inc e
	ld a, [de]
	sub $0b
	ld [hli], a
	inc e
	ld a, [de]
	sbc $00
	ld [hli], a
	ret

.Func_5710f:
	ld hl, wCurObjFrameDuration
	ld a, [hli]
	and a
	ret nz
	; end of a frame
	ld a, [hl] ; OBJ_FRAMESET_OFFSET
	cp 2
	jr z, .set_shoot_pos_22y
	cp 4
	jp z, .set_shoot_pos_11x_16y
	cp 6
	jr z, .asm_5713f
	cp 10
	ret nz
	jp .asm_57009

.set_shoot_pos_22y
	call .GetShootPosPtr

	; set Shoot.y = GK.y - 22
	ld de, wCurObjYPos
	ld a, [de]
	sub 22
	ld [hli], a
	inc e
	ld a, [de]
	sbc 0
	ld [hli], a

	; set Shoot.x = GK.x
	inc e
	ld a, [de]
	ld [hli], a
	inc e
	ld a, [de]
	ld [hli], a
	ret

.asm_5713f
	ld a, $04
	ld [wShootBallState], a
	play_sfx SFX_067
	ret

.GetShootPosPtr:
	ld a, LOW(wObj1)
	ld b, LOW(wObj1)
	ld h, HIGH(wObj1)
.loop_find_shoot_obj_1
	ld l, OBJ_ID
	add l
	ld l, a
	ld a, [hl] ; OBJ_ID
	cp SHOOT
	jr nz, .next_obj_1
	ld a, l
	sub OBJ_ID - OBJ_FLAGS
	ld l, a
	ld a, [hli] ; OBJ_FLAGS
	rra
	jr c, .got_obj_1
.next_obj_1
	ld a, b
	cp LOW(wObj8)
	ret z
	add OBJ_STRUCT_LENGTH
	ld b, a
	jr .loop_find_shoot_obj_1
.got_obj_1
	inc l
	inc l
	ret

.Func_57170:
	ld a, LOW(wObj1)
	ld b, LOW(wObj1)
	ld h, HIGH(wObj1)
.loop_find_shoot_obj_2
	ld l, OBJ_ID
	add l
	ld l, a
	ld a, [hl] ; OBJ_ID
	cp SHOOT
	jr nz, .next_obj_2
	ld a, l
	sub OBJ_ID - OBJ_FLAGS
	ld l, a
	ld a, [hl] ; OBJ_FLAGS
	rra
	jr c, .got_obj_2
.next_obj_2
	ld a, b
	cp LOW(wObj8)
	ret z
	add OBJ_STRUCT_LENGTH
	ld b, a
	jr .loop_find_shoot_obj_2
.got_obj_2
	ld a, l
	add OBJ_ACTION - OBJ_FLAGS
	ld l, a
	ld a, no_actions_for 8
	ld [hl], a
	ret

.Func_57198:
	ld hl, wCurObjFrameDuration
	ld a, [hli]
	and a
	ret nz
	ld a, [hl]
	cp $06
	jr z, .asm_571c7
	cp $08
	jr z, .asm_571df
	cp $0e
	jr z, .asm_571f7
	cp $10
	jr z, .asm_571b5
	cp $14
	ret nz
	jp .asm_57009
.asm_571b5
	ld a, $01
	ld [wShootBallState], a
	xor a
	ld [wAutoMoveState], a
	play_sfx SFX_067
	ret
.asm_571c7
	ld hl, wCurObjYPos
	ld a, [hli]
	ld [wWarioYPos + 1], a
	ld a, [hli]
	ld [wWarioYPos + 0], a
	ld a, [hli]
	add $0c
	ld [wWarioXPos + 1], a
	ld a, [hli]
	adc $00
	ld [wWarioXPos + 0], a
	ret
.asm_571df
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $16
	ld [wWarioYPos + 1], a
	ld a, [hli]
	sbc $00
	ld [wWarioYPos + 0], a
	ld a, [hli]
	ld [wWarioXPos + 1], a
	ld a, [hli]
	ld [wWarioXPos + 0], a
	ret
.asm_571f7
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $10
	ld [wWarioYPos + 1], a
	ld a, [hli]
	sbc $00
	ld [wWarioYPos + 0], a
	ld a, [hli]
	sub $0b
	ld [wWarioXPos + 1], a
	ld a, [hli]
	sbc $00
	ld [wWarioXPos + 0], a
	ret

; input:
; - bc = movement data
DoPreKickingJumpYMovement:
	ld hl, wCurObjVar3
	ld a, [hl]
	add c
	ld c, a
	ld a, [bc]

	; if already past end of list, get last valid offset
	cp $80
	jr nz, .valid_index
	dec c
	ld a, [bc]
	jr .got_offset
.valid_index
	inc [hl] ; OBJ_VAR_3
.got_offset
	ld b, a
	ld l, OBJ_Y_POS
	cp -128
	ld c, [hl] ; OBJ_Y_POS
	jr nc, .moving_up

; moving down
	add c
	ld [hli], a
	jr nc, .move_wario_down
	inc [hl]
.move_wario_down
	call MoveWarioDown
	jp HandleDownwardsFloorTransition

.moving_up
	add c
	ld [hli], a
	jr c, .move_wario_up
	dec [hl]
.move_wario_up
	xor a
	sub b
	ld b, a ; b = -b
	call MoveWarioUp
	jp HandleUpwardsFloorTransition

ApplyYOffsetOnKickedWarioBall:
	ld hl, wCurObjVar3
	ld a, [hl]
	add c
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_57253
	dec c
	ld a, [bc]
	jr .asm_57254
.asm_57253
	inc [hl]
.asm_57254
	ld b, a
	call MoveWarioDown
	jp HandleDownwardsFloorTransition

; unreferenced
Func_5725b:
	xor a
	sub b
	ld b, a
	call MoveWarioUp
	jp HandleUpwardsFloorTransition

ShootGoalCounterFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.UpdateScore)
	ld [hld], a
	ld a, LOW(.UpdateScore)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld a, $3c
	ld [wCurObjFrame], a

	; move up $58 pixels
	ld a, $58
	ld [wCurObjVar2], a
	jp MoveObjectUpByVar2

.UpdateScore:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld a, $7f
	ld [wCurObjFrameDuration], a
	ld a, [wShootGoals]
	cp 1
	jr z, .one_goal
	cp 2
	jr z, .two_goals
	cp 3
	jr z, .three_goals
	ret
.one_goal
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ret
.two_goals
	ld a, $3d
	ld [wCurObjFrame], a
	ret
.three_goals
	ld a, $3e
	ld [wCurObjFrame], a
	xor a
	ld [wBossBattleMusic], a
	ret

WarioGoalCounterFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.UpdateScore)
	ld [hld], a
	ld a, LOW(.UpdateScore)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld a, $3c
	ld [wCurObjFrame], a

	; move up $58 pixels
	ld a, $58
	ld [wCurObjVar2], a
	jp MoveObjectUpByVar2

.UpdateScore:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld a, $7f
	ld [wCurObjFrameDuration], a
	ld a, [wWarioGoals]
	cp 1
	jr z, .one_goal
	cp 2
	jr z, .two_goals
	cp 3
	jr z, .three_goals
	ret
.one_goal
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ret
.two_goals
	ld a, $3d
	ld [wCurObjFrame], a
	ret
.three_goals
	ld a, $3e
	ld [wCurObjFrame], a
	ret
