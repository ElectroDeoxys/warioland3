; wDollBoyActiveBarrels flags
DEF DOLLBOY_BARREL1 EQU 1 << 0 ; top barrel
DEF DOLLBOY_BARREL2 EQU 1 << 1 ; middle barrel
DEF DOLLBOY_BARREL3 EQU 1 << 2 ; bottom barrel
DEF DOLLBOY_DOLL    EQU 1 << 3

; wDollBoyHammerRange constants
	const_def 1
	const HAMMER_SHORT     ; 1
	const HAMMER_MID_SHORT ; 2
	const HAMMER_MID_LONG  ; 3
	const HAMMER_LONG      ; 4

; every frame Doll Boy checks to decide whether
; to throw a hammer, if rDIV is bigger than or equal to
; this number, then throw hammer of next range
DEF DOLLBOY_THROW_HAMMER_ODDS EQU 250 ; out of 256

DEF DOLLBOY_START_DELAY         EQU  40 ; delay before starting actions
DEF DOLLBOY_THROW_HAMMER_DELAY  EQU  56 ; delay before throwing a hammer
DEF DOLLBOY_WALKING_PHASE_DELAY EQU  80 ; delay before beginning walking phase
DEF DOLLBOY_JUMP_DELAY          EQU  20 ; delay before jumping up/down
DEF DOLLBOY_TURN_DELAY          EQU  32 ; delay before turning around
DEF DOLLBOY_AFTER_HIT_DELAY     EQU  60 ; delay after hitting Wario with the hammer
DEF DOLLBOY_STUN_DURATION       EQU 120 ; stun duration where Doll Boy is vulnerable
DEF DOLLBOY_DEFEAT_DURATION     EQU  43 ; duration after getting defeated to fall off screen
DEF BARREL_FLASH_DELAY          EQU  70 ; delay before a barrel starts flashing
DEF BARREL_FLASH_DURATION       EQU 240 ; duration of barrel flashing
DEF HAMMER_PLATFORM_DURATION    EQU 140 ; duration for hammer platform movement (going up or down)

DollBoyFunc:
	ld a, TRUE
	ld [wIsBossBattle], a
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, [hl]
	and $f0
	or $5 | OBJSUBFLAG_HDIR
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Init)
	ld [hld], a
	ld a, LOW(.Init)
	ld [hld], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 11
	ld [hld], a
	ld a, -12
	ld [hld], a
	ld a, 0
	ld [hld], a
	ld a, -28
	ld [hld], a
	ld de, Frameset_69632
	call SetObjectFramesetPtr
	ld a, DOLLBOY_START_DELAY
	ld [hli], a
	ret

.Init:
	ld a, [wCurObjFlags]
	rra
	rra
	ret nc ; jump if OBJFLAG_ON_SCREEN_F not set

	; is on screen
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz

	; initialise some variables and set boss music
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.BarrelPhase)
	ld [hld], a
	ld a, LOW(.BarrelPhase)
	ld [hld], a

	ld a, TRUE
	ld [wDollBoyNoFlashingBarrel], a
	xor a
	ld [wCurObjVar1], a
	ld [wDollBoyFallImmediatelyMiddleBarrel], a
	ld [wDollBoyHammerRange], a
	ld a, DOLLBOY_BARREL1 | DOLLBOY_BARREL2 | DOLLBOY_BARREL3
	ld [wDollBoyActiveBarrels], a

	ld a, $02
	ld [wBossBattleMusic], a
	call UpdateLevelMusic
	ret

.BarrelPhase:
	ld a, [wCurObjVar1]
	and a
	jp z, .check_if_wario_is_bouncy
	cp $01
	jp z, .throw_hammer
	cp $08
	jr z, .start_fall
	cp $09
	jr z, .fall
	ret

.start_fall
	ld de, Frameset_69632
	call SetObjectFramesetPtr
	inc l
	ld a, $09
	ld [hli], a ; wCurObjVar1
	inc l
	xor a
	ld [hl], a ; wCurObjVar3
.fall
	ld a, [wCurObjSubState]
	and $0f
	cp $4
	jr nz, .asm_50b61
	ld a, [wDollBoyActiveBarrels]
	cp DOLLBOY_BARREL1 | DOLLBOY_BARREL2
	jr z, .fall_wait_2_barrels ; bottom barrel attacked
	cp DOLLBOY_BARREL1 | DOLLBOY_BARREL3
	jr z, .fall_wait_1_barrel ; middle barrel attacked
	jr .fall_immediately
.asm_50b61
	cp $3
	jr nz, .fall_immediately
	ld a, [wDollBoyActiveBarrels]
	cp DOLLBOY_BARREL1
	jr z, .fall_wait_1_barrel ; only top barrel
	cp DOLLBOY_BARREL3
	jr z, .fall_immediately ; only bottom barrel
	; only middle barrel is active, check whether
	; to fall immediately or wait for barrel to fall
	ld a, [wDollBoyFallImmediatelyMiddleBarrel]
	and a
	jr nz, .fall_immediately
.fall_wait_1_barrel
	ld a, [wCurObjVar3]
	cp 18
	jr nz, .wait_ground_shake_1
	ld de, Frameset_69646
	call SetObjectFramesetPtr
	jr .fall_movement_1
.wait_ground_shake_1
	cp 26
	jr nz, .wait_end_fall_1
	call DollBoyGroundShake
	jr .fall_movement_1
.wait_end_fall_1
	cp 30
	jr z, .after_fall
.fall_movement_1
	ld bc, Data_60b80
	jp ApplyObjYMovement

.fall_wait_2_barrels
	; mark middle barrel fall flag as true because
	; if the top barrel is attacked next, DollBoy has
	; to fall immediately
	ld a, TRUE
	ld [wDollBoyFallImmediatelyMiddleBarrel], a
	ld a, [wCurObjVar3]
	cp 34
	jr nz, .wait_ground_shake_2
	ld de, Frameset_69646
	call SetObjectFramesetPtr
	jr .fall_movement_2
.wait_ground_shake_2
	cp 42
	jr nz, .wait_end_fall_2
	call DollBoyGroundShake
	jr .fall_movement_2
.wait_end_fall_2
	cp 46
	jr z, .after_fall
.fall_movement_2
	ld bc, Data_60ba0
	jp ApplyObjYMovement

.fall_immediately
	ld a, [wCurObjVar3]
	cp 2
	jr nz, .wait_ground_shake_3
	ld de, Frameset_69646
	call SetObjectFramesetPtr
	jr .fall_movement_3
.wait_ground_shake_3
	cp 10
	jr nz, .wait_end_fall_3
	call DollBoyGroundShake
	jr .fall_movement_3
.wait_end_fall_3
	cp 14
	jr z, .after_fall
.fall_movement_3
	ld bc, Data_60880
	jp ApplyObjYMovement

.after_fall
	ld de, Frameset_69632
	call SetObjectFramesetPtr
	inc l
	xor a
	ld [hl], a
	ret

.throw_hammer
	call UpdateDollBoyRemainingParts
	ld a, [wCurObjVar1]
	cp $08
	ret z
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .after_hammer_throw
	ld a, [hl]
	cp $13
	ret nz
	ld hl, wDollBoyHammerRange
	ld a, [hl]
	cp HAMMER_LONG
	jr nz, .spawn_hammer
	; restart hammer range cycle
	xor a
	ld [hl], a
.spawn_hammer
	inc [hl] ; next hammer range
	play_sfx SFX_0A2
	ld bc, ObjParams_DollBoyHammer
	jp CreateObjectAtRelativePos

.after_hammer_throw
	ld de, Frameset_69632
	call SetObjectFramesetPtr
	inc l
	xor a
	ld [hl], a ; wCurObjVar1
	ret

.check_if_wario_is_bouncy
	ld a, [wTransformation]
	cp TRANSFORMATION_BOUNCY_WARIO
	jr nz, .not_bouncy
	; Wario is bouncy
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.DoNothing)
	ld [hld], a
	ld a, LOW(.DoNothing)
	ld [hld], a
	xor a
	ld [wBossBattleMusic], a
	ret

.not_bouncy
	ld a, [wCurObjSubState]
	cp $2 | OBJSUBFLAG_HDIR
	jr z, .walking_phase
	call UpdateDollBoyRemainingParts
	ld a, [wCurObjVar1]
	cp $08
	ret z
	ldh a, [rDIV]
	cp DOLLBOY_THROW_HAMMER_ODDS
	ret c
	; rDIV >= DOLLBOY_THROW_HAMMER_ODDS, throw hammer
	ld de, Frameset_6963b
	call SetObjectFramesetPtr
	ld a, DOLLBOY_THROW_HAMMER_DELAY
	ld [hli], a ; wCurObjStateDuration
	ld a, $01
	ld [hl], a ; wCurObjVar1
	ret

.walking_phase
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.InitWalkingPhase)
	ld [hld], a
	ld a, LOW(.InitWalkingPhase)
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_0B
	ld [hli], a
	ld a, DOLLBOY_WALKING_PHASE_DELAY
	ld [wCurObjStateDuration], a
	ret

.InitWalkingPhase:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_6964d
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.WalkingPhase)
	ld [hld], a
	ld a, LOW(.WalkingPhase)
	ld [hld], a
	xor a
	ld [wCurObjState], a
	ld [wCurObjVar1], a
	ld hl, DollBoyGreenPals
	ld de, wTempPals2 palette 4
	ld c, 4
	ld b, 2
	jp CopyAndApplyOBPals

.show_stars_left
	ld de, Frameset_696b9
	ld bc, ObjParams_DollBoyHammerStarsLeft
	jr .got_stars_params
.show_stars_right
	ld de, Frameset_696b6
	ld bc, ObjParams_DollBoyHammerStarsRight
.got_stars_params
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.HitWario)
	ld [hld], a
	ld a, LOW(.HitWario)
	ld [hld], a
	xor a
	ld [wCurObjVar3], a
	ld [wBossBattleMusic], a
	stop_sfx
	call SetObjectFramesetPtr
	ld a, 1
	ld [hli], a ; wCurObjStateDuration
	jp CreateObjectAtRelativePos

.asm_50cc4
	ld a, $32 ; wCurObjState
	ld [hld], a
	jr .asm_50ccc
.asm_50cc9
	ld a, $33
	ld [hld], a ; wCurObjState
.asm_50ccc
	ld a, 12
	ld [wCurObjStateDuration], a
	ld a, $02
	ld [wCurObjVar2], a
	ret

.set_stunned
	play_sfx SFX_0A4
	ld a, $5c
	ld [hld], a ; wCurObjState
	ld a, [hld] ; wCurObjSubState
	rlca
	ld_obj_frameset Frameset_6967a, Frameset_69675
	xor a
	ld [hl], a ; wCurObjVar3
	call SetObjectFramesetPtr
	ld a, DOLLBOY_STUN_DURATION
	ld [hli], a ; wCurObjStateDuration
	ld a, $ff
	ld [hl], a ; wCurObjVar1
	ld hl, DollBoyRedPals
	ld de, wTempPals2 palette 4
	ld c, 4
	ld b, 2
	jp CopyAndApplyOBPals

.update_stunned
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
	ld bc, FallingYVel_Light
	jp z, ApplyObjYMovement
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jr z, .end_stun
	ld a, [hl]
	cp 10
	ret nz
	ld hl, DollBoyGreenPals
	ld de, wTempPals2 palette 4
	ld c, 4
	ld b, 2
	jp CopyAndApplyOBPals

.end_stun
	ld l, OBJ_STATE
	xor a
	ld [hld], a
	ld a, [hl]
	rlca
	jr c, .asm_50d62
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_50d5b
	ld de, Frameset_69656
	ld b, 0
	jr .asm_50d7c
.asm_50d5b
	ld de, Frameset_6966a
	ld b, 32
	jr .asm_50d7c

.asm_50d62
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_50d77
	ld de, Frameset_6965f
	ld b, 32
	jr .asm_50d7c
.asm_50d77
	ld de, Frameset_6964d
	ld b, 0

.asm_50d7c
	call SetObjectFramesetPtr
	ld [hl], b ; wCurObjStateDuration
	xor a
	ld [wCurObjVar1], a
	ld [wCurObjVar3], a
	ret

.WalkingPhase:
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hli], a
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jp z, .switch_direction
	cp $5a
	jp z, .jump_platform_below
	cp $5b
	jp z, .jump_platform_above
	cp $5c
	jp z, .update_stunned
	cp $02
	jp z, .asm_50cc4
	cp $03
	jp z, .asm_50cc9
	cp $32
	jp z, ObjState_BumpLeft
	cp $33
	jp z, ObjState_BumpRight
	cp $0b
	jp z, .show_stars_left
	cp $0c
	jp z, .show_stars_right
	and $fe
	cp $08
	jp z, .set_stunned
	cp $04
	jr z, .asm_50de0
	ld a, [wCurObjVar1]
	inc a
	jp z, .set_stunned
	ld a, 1
	ld [wCurObjStateDuration], a
	jp .update_stunned

.asm_50de0
	ld a, [wCurObjVar1]
	inc a
	jp nz, .set_stunned
	ld a, $48
	ld [hld], a ; wCurObjState
	ld a, [hl] ; wCurObjSubState
	and $f0
	ld [hld], a
	xor a
	ld [hld], a ; wCurObjVar3
	ld a, DOLLBOY_DEFEAT_DURATION
	ld [wCurObjStateDuration], a
	ld bc, .Defeated
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, b
	ld [hld], a
	ld [hl], c
	ld l, OBJ_FLAGS
	set OBJFLAG_PRIORITY_F, [hl]
	ld l, OBJ_UNK_02
	ld e, $05
	farcall Func_ba42
	stop_music2
	ld de, Frameset_6967f
	jp SetObjectFramesetPtr

.jump_platform_below
	ld bc, Data_60890
	jr .got_jump_movement
.jump_platform_above
	ld bc, Data_608a0
.got_jump_movement
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	and a
	jr z, .asm_50e36
	dec [hl]
	ret
.asm_50e36
	call ApplyObjYMovement
	ld a, [wCurObjVar3]
	cp $0a
	call z, DollBoyGroundShake
	ld hl, wCurObjVar1
	dec [hl]
	ret nz
	ld a, $3c
	ld [hl], a
	xor a
	ld [wCurObjState], a
	ret

.switch_direction
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_50e7e
	dec [hl]
	jr z, .asm_50e6c
	ld l, OBJ_VAR_3
	ld a, [hli]
	cp $17
	jr nz, .short_hop_movement
	; switch horizontal directions
	ld a, [hl] ; wCurObjSubState
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	call DollBoyGroundShake
.short_hop_movement
	ld bc, Data_60c00
	jp ApplyObjYMovement
.asm_50e6c
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_50e78
	ld de, Frameset_69656
	jp SetObjectFramesetPtr
.asm_50e78
	ld de, Frameset_6964d
	jp SetObjectFramesetPtr
.asm_50e7e
	inc l
	ld a, [hl] ; wCurObjVar1
	and a
	jr z, .asm_50e86
	dec [hl]
	jr .handle_walk_movement
.asm_50e86

	; jump if x < $18 || x >= $78
	ld a, [wCurObjScreenXPos]
	cp $78
	jr nc, .handle_walk_movement
	cp $18
	jr c, .handle_walk_movement

	; jump if Wario's y < $28
	ld a, [wWarioScreenYPos]
	cp $28
	jr c, .handle_walk_movement
	ld b, a

	; jump if y >= $a0
	ld a, [wCurObjScreenYPos]
	cp $a0
	jr nc, .handle_walk_movement

	sub b
	jr nc, .asm_50eab ; y >= Wario's y

	; jump if y >= Wario's y - $1f
	cp -$1f
	jr nc, .handle_walk_movement
	; jump to platform below
	ld a, $5a
	jr .asm_50eb1
.asm_50eab
	cp $20
	jr c, .handle_walk_movement
	; jump to platform above
	ld a, $5b
.asm_50eb1
	ld l, OBJ_STATE
	ld [hld], a ; wCurObjState
	dec l
	xor a
	ld [hld], a ; wCurObjVar3
	dec l
	ld a, $1e
	ld [hld], a ; wCurObjVar1
	ld a, DOLLBOY_JUMP_DELAY
	ld [hl], a ; wCurObjStateDuration
	ret

.handle_walk_movement
	ld a, [wCurObjFramesetOffset]
	cp $06
	jr nz, .no_sfx
	ld a, [wCurObjFrameDuration]
	cp $01
	play_sfx z, SFX_0A2
.no_sfx
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .going_right
; going_left
	ld a, [hli]
	sub 12
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr nz, .turn_right
	ld a, [wCurObjFramesetOffset]
	cp $06
	jr c, .skip_move_left
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_BOUNCY
	ld [hli], a
	jp MoveObjectLeft
.skip_move_left
	ret

	; unreachable
	jp MoveObjectLeft

.turn_right
	ld de, Frameset_6966a
	jr .set_turn_frameset

.going_right
	ld a, [hli]
	add 11
	ldh [hXPosLo], a
	ld a, [hli]
	adc 0
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr nz, .turn_left
	ld a, [wCurObjFramesetOffset]
	cp $06
	jr c, .skip_move_right
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_BOUNCY
	ld [hli], a
	jp MoveObjectRight
.skip_move_right
	ret

	; unreachable
	jp MoveObjectRight

.turn_left
	ld de, Frameset_6965f
.set_turn_frameset
	call SetObjectFramesetPtr
	ld a, DOLLBOY_TURN_DELAY
	ld [hli], a ; wCurObjStateDuration
	xor a
	ld [wCurObjVar3], a
	ret

.HitWario:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_50f5e
	dec [hl]
	play_sfx SFX_049
.asm_50f5e
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
	ld bc, FallingYVel_Light
	jp z, ApplyObjYMovement
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.WaitThenDoNothing)
	ld [hld], a
	ld a, LOW(.WaitThenDoNothing)
	ld [hld], a
	ld a, DOLLBOY_AFTER_HIT_DELAY
	ld [wCurObjStateDuration], a
	ret

.WaitThenDoNothing:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.DoNothing)
	ld [hld], a
	ld a, LOW(.DoNothing)
	ld [hld], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_50fa7
	ld de, Frameset_6969a
	jp SetObjectFramesetPtr
.asm_50fa7
	ld de, Frameset_69695
	jp SetObjectFramesetPtr

.DoNothing:
	; Wario was hit by a hammer,
	; so no more actions to process
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

.Defeated:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjScreenYPos]
	cp $d0
	jr nc, .set_defeat_music
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .defeated_fall_movement
	cp 27
	jr nz, .asm_50fe2
	stop_sfx
	ld hl, DollBoyRedPals
	ld de, wTempPals2 palette 4
	ld c, 4
	ld b, 2
	call CopyAndApplyOBPals
	ld hl, wCurObjStateDuration
.asm_50fe2
	dec [hl]
	play_sfx z, SFX_0A3
.defeated_fall_movement
	ld bc, Data_60bd0
	jp ApplyObjYMovement

.set_defeat_music
	xor a
	ld [wCurObjFlags], a
	ld a, $03
	ld [wBossBattleMusic], a
	call UpdateLevelMusic
	xor a
	ld [wIsBossBattle], a
	jp DollBoyGroundShake

DollBoyBarrel1Func:
	ld a, $03
	jr DollBoyBarrelFunc
DollBoyBarrel2Func:
	ld a, $02
	jr DollBoyBarrelFunc
DollBoyBarrel3Func:
	ld a, $01
DollBoyBarrelFunc:
	ld [wCurObjSubState], a
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.StartDelay)
	ld [hld], a
	ld a, LOW(.StartDelay)
	ld [hld], a
	ld de, Frameset_6969f
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 7
	ld [hld], a
	ld a, -8
	ld [hld], a
	ld a, 0
	ld [hl], a
	xor a
	ld [wCurObjVar1], a
	ret

.StartDelay:
	; wait until it's possible to start flashing
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld a, [wDollBoyNoFlashingBarrel]
	and a
	ret z
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Main)
	ld [hld], a
	ld a, LOW(.Main)
	ld [hld], a
	ret

.Main:
	ld a, [wCurObjVar1]
	and a
	jr z, .not_flashing
	cp $01
	jp z, .wait_to_start_flashing
	cp $02
	jp z, .flashing
	cp $08
	jr z, .start_fall
	cp $09
	jr z, .fall
	ret

.start_fall
	ld hl, wCurObjVar1
	ld a, $09
	ld [hli], a
	inc l
	xor a
	ld [hl], a ; wCurObjVar3
.fall
	ld a, [wCurObjUnk07]
	cp $41
	jr nz, .no_delay_fall
	ld a, [wDollBoyActiveBarrels]
	cp DOLLBOY_BARREL1 | DOLLBOY_BARREL2
	jr z, .delay_then_fall

.no_delay_fall
	ld a, [wCurObjVar3]
	cp $0a
	jr nz, .no_shake_1
	call DollBoyGroundShake
	jr .fall_movement
.no_shake_1
	cp $0e
	jr z, .end_falling
.fall_movement
	ld bc, Data_60880
	jp ApplyObjYMovement

.delay_then_fall
	ld a, [wCurObjVar3]
	cp $1a
	jr nz, .no_shake_2
	call DollBoyGroundShake
	jr .fall_with_delay_movement
.no_shake_2
	cp $1e
	jr z, .end_falling
.fall_with_delay_movement
	ld bc, Data_60b80
	jp ApplyObjYMovement
.end_falling
	xor a
	ld [wCurObjVar1], a
	ret

.not_flashing
	call UpdateDollBoyRemainingParts
	ld a, [wCurObjVar1]
	cp $08
	ret z
	ld a, [wCurObjUnk07]
	and %11
	ld e, a
	ld a, [wGlobalCounter]
	and %11
	cp e
	ret nz
	ld a, [wDollBoyNoFlashingBarrel]
	and a
	ret z
	ld a, [wDollBoyActiveBarrels]
	cp DOLLBOY_BARREL1
	jr z, .set_flashing
	cp DOLLBOY_BARREL2
	jr z, .set_flashing
	cp DOLLBOY_BARREL3
	jr z, .set_flashing
	ld a, [wWarioScreenYPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenYPos]
	add $2a
	sub b
	cp 8
	ret c
	cp -8
	ret nc
	; |barrel y - Wario y| > 8
.set_flashing
	xor a ; FALSE
	ld [wDollBoyNoFlashingBarrel], a
	ldh a, [rDIV]
	and %11
	ld b, a
	ld a, BARREL_FLASH_DELAY
	add b
	; b = value between 70 and 73
	ld hl, wCurObjStateDuration
	ld [hli], a
	ld a, $01
	ld [hl], a ; wCurObjVar1
	ret

.wait_to_start_flashing
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_696a8
	call SetObjectFramesetPtr
	ld a, BARREL_FLASH_DURATION
	ld [hli], a ; wCurObjStateDuration
	ld a, $02
	ld [hl], a ; wCurObjVar1
	xor a
	ld [wCurObjState], a
	ret

.flashing
	ld a, [wTransformation]
	cp TRANSFORMATION_BOUNCY_WARIO
	jr nz, .not_bouncy
	ld hl, wCurObjStateDuration
	xor a
	ld [hli], a
	jr .end_flashing
.not_bouncy
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jr z, .not_on_screen
	ld a, [wGlobalCounter]
	and %111
	play_sfx z, SFX_06A
.not_on_screen
	ld l, OBJ_STATE
	ld a, [hld]
	cp $05
	jr z, .attacked
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	inc l
	xor a
.end_flashing
	ld [hl], a ; wCurObjVar1
	ld de, Frameset_6969f
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Main)
	ld [hld], a
	ld a, LOW(.Main)
	ld [hld], a
	jr .set_no_barrel_flashing

.attacked
	ld a, [hl] ; wCurObjSubState
	and $f0
	ld [hld], a
	xor a
	ld [hld], a ; wCurObjVar3
	ld a, $01
	ld [hld], a ; wCurObjVar2
	ld de, Frameset_6969f
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(Func_3317)
	ld [hld], a
	ld a, LOW(Func_3317)
	ld [hld], a
	play_sfx SFX_017
	ld hl, wDollBoyActiveBarrels
	ld a, [wCurObjUnk07]
	cp $41
	jr nz, .asm_5118a
	ld a, [hl]
	and $ff ^ DOLLBOY_BARREL1
	ld [hl], a
	ld a, DOLLBOY_DOLL
	jr .got_remaining_parts
.asm_5118a
	cp $42
	jr nz, .asm_51196
	ld a, [hl]
	and $ff ^ DOLLBOY_BARREL2
	ld [hl], a
	ld a, DOLLBOY_BARREL1 | DOLLBOY_DOLL
	jr .got_remaining_parts
.asm_51196
	ld a, [hl]
	and $ff ^ DOLLBOY_BARREL3
	ld [hl], a
	ld a, DOLLBOY_BARREL1 | DOLLBOY_BARREL2 | DOLLBOY_DOLL
.got_remaining_parts
	ld [wDollBoyRemainingParts], a
.set_no_barrel_flashing
	ld a, TRUE
	ld [wDollBoyNoFlashingBarrel], a
	ret

UpdateDollBoyRemainingParts:
	ld a, [wCurObjSubState]
	dec a
	ret z ; exit if wCurObjSubState == $1
	ld a, [wCurObjUnk07]
	and $0f
	ld b, a
	ld a, [wDollBoyRemainingParts]
	ld e, a
	and b
	ret z
	; unset flag in unk7 from wDollBoyRemainingParts
	ld a, b
	xor $ff
	and e
	ld [wDollBoyRemainingParts], a
	ld a, $08
	ld [wCurObjVar1], a
	ld hl, wCurObjSubState
	dec [hl]
	ret

DollBoyHammerFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Init)
	ld [hld], a
	ld a, LOW(.Init)
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ret

.Init:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld c, $2a
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp $ec
	ret c
	ld l, OBJ_VAR_1
	inc [hl]
	ret

.Update:
	ld a, [wCurObjState]
	and a
	jr nz, .hit

	; if var 1 is set, this hammer just moves right
	ld a, [wCurObjVar1]
	and a
	jp nz, MoveObjectRight_Fast

	ld bc, Data_60860
	call ApplyObjYMovement

	ld a, [wDollBoyHammerRange]
	cp HAMMER_SHORT
	jr nz, .check_mid_short
; short
	ld bc, Data_60ae0
	jp ApplyObjXMovement
.check_mid_short
	cp HAMMER_MID_SHORT
	jr nz, .check_mid_long
; mid-short
	ld bc, Data_60b00
	jp ApplyObjXMovement
.check_mid_long
	cp HAMMER_MID_LONG
	jr nz, .long
; mid-long
	ld bc, Data_60b30
	jp ApplyObjXMovement
.long
	ld bc, Data_60b60
	jp ApplyObjXMovement

.hit
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .set_hit_left
	ld de, .HitRight
	jr .got_hit_dir
.set_hit_left
	ld de, .HitLeft
.got_hit_dir
	ld hl, wCurObjUpdateFunction + 1
	ld a, d
	ld [hld], a
	ld [hl], e
	xor a
	ld [wCurObjVar3], a
	play_sfx SFX_049
	ld bc, ObjParams_StarsCentre
	jp CreateObjectFromCurObjPos

.HitLeft:
	call MoveObjectLeft
	jr .hit_fall
.HitRight:
	call MoveObjectRight
.hit_fall
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld bc, Data_60040
	jp ApplyObjYMovement

HammerPlatformSpawnerFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.SpawnHammerPlatform)
	ld [hld], a
	ld a, LOW(.SpawnHammerPlatform)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld a, 150
	ld [wCurObjStateDuration], a
	jr .DoNothing

.SpawnHammerPlatform:
	ld hl, wCurObjStateDuration
	dec [hl]
	jr nz, .DoNothing
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.DoNothing)
	ld [hld], a
	ld a, LOW(.DoNothing)
	ld [hld], a
	ld bc, ObjParams_HammerPlatform
	call CreateObjectAtRelativePos
.DoNothing:
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

HammerPlatformFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.MoveDown)
	ld [hld], a
	ld a, LOW(.MoveDown)
	ld [hld], a
	ld l, OBJ_Y_POS
	ld a, [hli]
	ld [wCurObjVar2], a
	ld a, [hl]
	ld [wCurObjVar3], a

.MoveDown:
	call SetOneWayPlatformAction
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr nz, .switch_direction_up
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jr z, .switch_direction_up
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	jp z, MoveObjectDown_Slow
	res OBJFLAG_STEPPED_F, [hl]
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld b, 1
	call MoveWarioDown
	call HandleDownwardsFloorTransition
	jp MoveObjectDown
.switch_direction_up
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.MoveUp)
	ld [hld], a
	ld a, LOW(.MoveUp)
	ld [hld], a
	xor a
	ld [wCurObjState], a
	ret

.MoveUp:
	call SetOneWayPlatformAction
	ld hl, wCurObjVar2
	ld b, [hl]
	ld a, [wCurObjYPos + 0]
	cp b
	jr nz, .continue_move_up
	inc l
	ld b, [hl]
	ld a, [wCurObjYPos + 1]
	cp b
	jr z, .switch_direction_down
.continue_move_up
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	jp z, MoveObjectUp_Slow
	res OBJFLAG_STEPPED_F, [hl]
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld b, 1
	call MoveWarioUp
	call HandleUpwardsFloorTransition
	jp MoveObjectUp
.switch_direction_down
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.MoveDown)
	ld [hld], a
	ld a, LOW(.MoveDown)
	ld [hld], a
	xor a
	ld [wCurObjState], a
	ld a, HAMMER_PLATFORM_DURATION
	ld [wCurObjStateDuration], a
	ret

DollBoyGroundShake:
	play_sfx SFX_061
	ld b, 24
	jp DoGroundShake

DollBoyGreenPals:
	rgb  0, 25,  1
	rgb 31, 31,  0
	rgb  0, 31, 20
	rgb  0,  0,  0

	rgb  0, 25,  1
	rgb  0,  0,  0
	rgb  0, 31, 20
	rgb 31, 31,  0

DollBoyRedPals:
	rgb  0, 25,  1
	rgb 31, 31, 25
	rgb 31,  5,  5
	rgb  0,  0,  0

	rgb  0, 25,  1
	rgb  0,  0,  0
	rgb 31,  5,  5
	rgb 31, 31, 25
