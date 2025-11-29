DEF WORMWOULD_NUM_HITS             EQU  3 ; number of hits to defeat
DEF WORMWOULD_IDLE_DURATION        EQU 43 ; duration between shooting rocks when above ground
DEF WORMWOULD_SHOOT_ROCK_DURATION  EQU 69 ; how long it takes for the whole shooting animation
DEF WORMWOULD_SHOOT_ROCK_DELAY     EQU 48 ; delay between starting shooting animation and spawning a rock
DEF WORMWOULD_BURROW_DELAY         EQU 26 ; delay of starting to burrow after being attacked
DEF WORMWOULD_UNDERGROUND_DURATION EQU 30 ; duration of waiting underground before popping up
DEF WORMWOULD_HURT_DURATION        EQU 50 ; duration of hurt state

WormwouldFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Init)
	ld [hld], a
	ld a, LOW(.Init)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	or (WORMWOULD_NUM_HITS + 1) | OBJSUBFLAG_UNK_4 | OBJSUBFLAG_HDIR
	ld [hl], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 7
	ld [hld], a
	ld a, -8
	ld [hld], a
	ld a, 30
	ld [hld], a
	ld de, Frameset_696ce
	jp SetObjectFramesetPtr

.Init:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld a, [wWarioYPos + 1]
	ld c, a
	ld hl, wCurObjYPos
	ld a, [hli]
	cp c
	ret nz
	ld c, [hl]
	ld a, [wWarioYPos + 0]
	ret nz
	ld a, $20
	ld [wCurObjVar2], a
	call MoveObjectDownByVar2
	ld a, $02
	ld [wBossBattleMusic], a
	call UpdateLevelMusic
	ld a, TRUE
	ld [wIsBossBattle], a

.check_change_side
	ld hl, wCurObjSubState
	ld a, [hl]
	rlca
	jr nc, .check_if_change_to_left_side ; OBJSUBFLAG_HDIR_F

	; checks whether to continue on the left side
	; or to change position to right side
	ld a, [wCurObjFlags]
	rra
	rra
	jr nc, .not_on_screen_1 ; OBJFLAG_ON_SCREEN_F
	ld a, [wCurObjScreenXPos]
	add $2a
	ld b, a
	ld a, [wWarioScreenXPos]
	add $2a
	sub b
	jr c, .place_on_right_side
	cp $38
	jr c, .place_on_right_side
.not_on_screen_1
	ld de, Frameset_696ce
	jr .set_direction_frameset
.place_on_right_side
	res OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_6970a
	ld l, OBJ_X_POS
	ld a, [hl]
	add $70
	ld [hli], a
	jr nc, .set_direction_frameset
	inc [hl]
	jr .set_direction_frameset

.check_if_change_to_left_side
	; checks whether to continue on the right side
	; or to change position to left side
	ld a, [wCurObjFlags]
	rra
	rra
	jr nc, .not_on_screen_2
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	sub b
	jr c, .place_on_left_side
	cp $38
	jr c, .place_on_left_side
.not_on_screen_2
	ld de, Frameset_6970a
	jr .set_direction_frameset
.place_on_left_side
	set OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_696ce
	ld l, OBJ_X_POS
	ld a, [hl]
	sub $70
	ld [hli], a
	jr nc, .set_direction_frameset
	dec [hl]

.set_direction_frameset
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Main)
	ld [hld], a
	ld a, LOW(.Main)
	ld [hld], a
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_STATE_DURATION
	xor a
	ld [hli], a ; wCurObjStateDuration
	ld a, [wCurObjYPos + 0]
	ld [hli], a ; wCurObjVar1
	ld a, [wCurObjYPos + 1]
	ld [hli], a ; wCurObjVar2
	ld a, $41
	ld [hl], a ; wCurObjVar3
	ld a, $2d
	ld [wCurObjState], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_WORMWOULD
	ld [hli], a
	play_sfx SFX_11A
	ret

.DoNothing:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ret

.shoot_rock_low
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ld a, [hl]
	ld l, OBJ_SUBSTATE
	cp $0a
	jr z, .spawn_low_rock
	and a
	ret nz
	ld l, OBJ_STATE
	jr .asm_5414b
.spawn_low_rock
	play_sfx SFX_TEMPLE_ROCK
	ld a, [hld]
	rlca
	jr c, .asm_5412b
	ld bc, ObjParams_LowRollingRockLeft
	jp CreateObjectAtRelativePos
.asm_5412b
	ld bc, ObjParams_LowRollingRockRight
	jp CreateObjectAtRelativePos

.asm_54131
	ld a, [wCurObjSubState]
	rlca
	ld_obj_frameset Frameset_696bc, Frameset_696c5
	call SetObjectFramesetPtr
	ld a, 34
	ld [hli], a
	ld a, $5b
	ld [wCurObjState], a
	ret

.asm_5414b
	ld a, 1
	ld [wCurObjStateDuration], a
.set_burrowing
	ld a, $5c
	ld [hld], a ; wCurObjState
	ld a, [hld] ; wCurObjSubState
	rlca
	jr c, .asm_5415d
	ld de, Frameset_69734
	jp SetObjectFramesetPtr
.asm_5415d
	ld de, Frameset_69701
	jp SetObjectFramesetPtr

.attacked
	ld a, $34
	ld [hld], a
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_6971c, Frameset_696e0
	call SetObjectFramesetPtr
	ld a, WORMWOULD_BURROW_DELAY
	ld [hli], a
	ret

.after_attack
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	cp 16
	play_sfx z, SFX_0A6
	dec [hl]
	ret nz
	ld l, OBJ_STATE
	jr .set_burrowing

.raising
	ld l, OBJ_VAR_3
	ld a, [wCurObjSubState]
	and $0f
	cp (WORMWOULD_NUM_HITS + 1) - 1
	jr nc, .raise
	; has only 1 remaining hit
	ld a, [hl] ; wCurObjVar3
	cp $1e
	jr z, .asm_54131
.raise
	dec [hl]
	jp nz, MoveObjectUp
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and $0f
	cp WORMWOULD_NUM_HITS + 1
	jr c, .asm_54209
.set_idle
	xor a
	ld [wCurObjState], a
	ld a, WORMWOULD_IDLE_DURATION
	ld [wCurObjStateDuration], a
	ret

.Main:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_541e9
	cp $34
	jr z, .after_attack
	cp $5a
	jr z, .shoot_rock_high
	cp $2d
	jr z, .raising
	cp $5b
	jp z, .shoot_rock_low
	cp $5c
	jp z, .burrowing
	and $fe
	cp OBJSTATE_ATTACKED_LEFT_START ; or OBJSTATE_ATTACKED_RIGHT_START
	jr z, .attacked
	cp $08
	jp z, .asm_5414b
	cp OBJSTATE_VANISH_TOUCH
	jr z, .smash_attacked
	cp $3a
	jp z, .hurt
	xor a
	ld [hl], a
	ret

.asm_541e9
	ld a, [wCurObjScreenYPos]
	add $20
	cp $20
	jr nc, .not_on_upper_part
	; wCurObjScreenYPos < 0
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.DoNothing)
	ld [hld], a
	ld a, LOW(.DoNothing)
	ld [hld], a
	ld a, $00
	ld [wBossBattleMusic], a
	call UpdateLevelMusic
	ret

.not_on_upper_part
	; wCurObjScreenYPos >= 0
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld l, OBJ_SUBSTATE
.asm_54209
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_69713, Frameset_696d7
	call SetObjectFramesetPtr
	ld a, WORMWOULD_SHOOT_ROCK_DURATION
	ld [hli], a ; wCurObjFrameDuration
	ld a, $5a
	ld [wCurObjState], a
	ret

.shoot_rock_high
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ld a, [hl]
	ld l, OBJ_SUBSTATE
	cp WORMWOULD_SHOOT_ROCK_DURATION - WORMWOULD_SHOOT_ROCK_DELAY
	jr z, .spawn_high_rock
	and a
	ret nz
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_6970a, Frameset_696ce
	call SetObjectFramesetPtr
	jp .set_idle

.spawn_high_rock
	play_sfx SFX_TEMPLE_ROCK
	ld a, [hld]
	rlca
	jr c, .asm_54251
	ld bc, ObjParams_HighRollingRockLeft
	jp CreateObjectAtRelativePos
.asm_54251
	ld bc, ObjParams_HighRollingRockRight
	jp CreateObjectAtRelativePos

.smash_attacked
	ld a, $3a
	ld [hld], a ; wCurObjState
	ld a, [hld] ; wCurObjSubState
	rlca
	ld_obj_frameset Frameset_69721, Frameset_696e5
	call SetObjectFramesetPtr
	ld a, WORMWOULD_HURT_DURATION
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_0B
	ld [hli], a
	ld a, -16
	ld [hl], a ; OBJ_COLLBOX_TOP
	call DecrementRemainingBossHits
	dec l
	xor a
	ld [hl], a
	play_sfx SFX_VANISH
	ret

.hurt
	ld bc, Data_60dd0
	call ApplyObjYMovement
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp 30
	play_sfx z, SFX_0A7
	dec [hl]
	ret nz
	ld l, OBJ_STATE
	ld a, $5c
	ld [hld], a
	ld a, [hl]
	and $0f
	dec a
	jr nz, .asm_542b6
	; no more remaining hits
	stop_music2
	ret
.asm_542b6
	ld a, -26
	ld [wCurObjCollBoxTop], a
	ld a, [hld]
	rlca
	jr c, .asm_542c5
	ld de, Frameset_69726
	jp SetObjectFramesetPtr
.asm_542c5
	ld de, Frameset_696ea
	jp SetObjectFramesetPtr

.burrowing
	ld l, OBJ_VAR_1
	ld a, [wCurObjSubState]
	and $0f
	cp WORMWOULD_NUM_HITS + 1
	jr c, .lower_quickly
	dec l
	ld a, [hli] ; wCurObjStateDuration
	and a
	jr nz, .lower_quickly
; lower slowly
	ld a, [wGlobalCounter]
	rra
	ret nc
.lower_quickly
	ld a, [wCurObjYPos + 0]
	ld c, a
	ld a, [hli] ; wCurObjVar1
	cp c
	jp nz, MoveObjectDown
	ld a, [wCurObjYPos + 1]
	ld c, [hl]
	cp c
	jp nz, MoveObjectDown

	; y pos == y pos in var 1 and 2
	ld a, [wCurObjSubState]
	and $0f
	dec a
	jr z, .set_defeated
	ld a, WORMWOULD_UNDERGROUND_DURATION
	ld [wCurObjStateDuration], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Underground)
	ld [hld], a
	ld a, LOW(.Underground)
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_INVISIBLE_F, [hl]
	ret

.set_defeated
	ld a, $21
	ld [wCurObjVar3], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.DefeatedRaise)
	ld [hld], a
	ld a, LOW(.DefeatedRaise)
	ld [hld], a
	ld hl, wCurObjUnk02
	ld e, $05
	farcall Func_ba42
	play_sfx SFX_0A7
	ret

.Underground:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld a, [wCurObjScreenYPos]
	cp $3a
	jr nc, .wait_underground
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.DoNothing)
	ld [hld], a
	ld a, LOW(.DoNothing)
	ld [hld], a
	ld a, $00
	ld [wBossBattleMusic], a
	call UpdateLevelMusic
	ret

.wait_underground
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_FLAGS
	res OBJFLAG_INVISIBLE_F, [hl]
	jp .check_change_side

.DefeatedRaise:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld hl, wCurObjVar3
	dec [hl]
	jp nz, MoveObjectUp_Fast
	inc l
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_6972f, Frameset_696f3
	call SetObjectFramesetPtr
	ld a, 30
	ld [hli], a ; wCurObjStateDuration
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.DefeatedWait)
	ld [hld], a
	ld a, LOW(.DefeatedWait)
	ld [hld], a
	ret

.DefeatedWait:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .defeat_wait_over
	dec [hl]
	ret nz
	ld l, OBJ_SUBSTATE
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_543a9
	res OBJSUBFLAG_HDIR_F, [hl]
	jr .asm_543ab
.asm_543a9
	set OBJSUBFLAG_HDIR_F, [hl]
.asm_543ab
	res OBJSUBFLAG_UNK_4_F, [hl]
	ld a, [hl]
	and $80
	ld [hld], a
	xor a
	ld [hl], a ; wCurObjVar3
	ld l, OBJ_FLAGS
	set OBJFLAG_PRIORITY_F, [hl]
	ld a, $03
	ld [wBossBattleMusic], a
	call UpdateLevelMusic
	xor a
	ld [wIsBossBattle], a
	ret

.defeat_wait_over
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.DefeatedFall)
	ld [hld], a
	ld a, LOW(.DefeatedFall)
	ld [hld], a
	play_sfx SFX_0A3
.DefeatedFall:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld bc, Data_60180
	call ApplyObjYMovement
	ld a, [wCurObjSubState]
	rlca
	jp nc, MoveObjectRight
	jp MoveObjectLeft

RollingRockFunc_Left:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jr nz, .MoveLeft
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.MoveLeft)
	ld [hld], a
	ld a, LOW(.MoveLeft)
	ld [hld], a
.MoveLeft:
	call MoveObjectLeft_Fast
	jr RollingRockFunc

RollingRockFunc_Right:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jr nz, .MoveRight
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.MoveRight)
	ld [hld], a
	ld a, LOW(.MoveRight)
	ld [hld], a
.MoveRight:
	call MoveObjectRight_Fast
;	fallthrough

RollingRockFunc:
	ld a, [wCurObjVar1]
	and a
	jr nz, .low_rock
	ld bc, Data_608b0
	jr .got_y_movement
.low_rock
	ld bc, Data_60900
.got_y_movement
	ld a, [wCurObjState]
	and a
	jp z, ApplyObjYMovement
	xor a
	ld [wCurObjVar3], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Hit)
	ld [hld], a
	ld a, LOW(.Hit)
	ld [hld], a
	play_sfx SFX_016
	ret

.Hit:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld bc, Data_60180
	call ApplyObjYMovement
	ld a, [wCurObjSubState]
	rlca
	jp c, MoveObjectRight_Fast
	jp MoveObjectLeft_Fast

PalmTreeSpawnerFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.SpawnTrees)
	ld [hld], a
	ld a, LOW(.SpawnTrees)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld a, 240
	ld [wCurObjStateDuration], a
	jr .Wait

.SpawnTrees:
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .tall
	ld a, [hl]
	cp 180
	jr nc, .Wait
	cp 60
	jr z, .medium
	cp 120
	jr nz, .Wait
; short
	ld bc, ObjParams_PalmTreeShort
	jr .create
.medium
	ld bc, ObjParams_PalmTreeMedium
	jr .create
.tall
	ld bc, ObjParams_PalmTreeTall
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Wait)
	ld [hld], a
	ld a, LOW(.Wait)
	ld [hld], a
.create
	call CreateObjectAtRelativePos
.Wait:
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ret

PalmTreeFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld hl, PalmTreePals
	ld de, wTempPals2 palette 7
	ld c, 7
	ld b, 1
	jp CopyAndApplyOBPals

.Update:
	call SetOneWayPlatformAction
	ld hl, wCurObjVar1
	ld a, [hl]
	and a
	jr z, .open
; grow
	dec [hl]
	call MoveObjectUp
	ld a, no_actions_for 1
	ld [wCurObjAction], a
.set_frame_duration
	ld a, 10
	ld [wCurObjFrameDuration], a
	ret
.open
	inc l
	ld a, [hl] ; var2
	and a
	jr z, .set_frame_duration
	dec [hl]
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ret

PalmTreePals:
	rgb 31, 31, 31
	rgb  0, 23,  5
	rgb  0, 12,  5
	rgb  0,  5,  0
