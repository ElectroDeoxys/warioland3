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
	or $4 | OBJSUBFLAG_UNK_4 | OBJSUBFLAG_HDIR
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
	ld a, NO_ACTIONS_FOR 1
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

.asm_5406d
	ld hl, wCurObjSubState
	ld a, [hl]
	rlca
	jr nc, .asm_540a2 ; OBJSUBFLAG_HDIR_F
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

.asm_540a2
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
	ld a, HIGH(.Func_541b5)
	ld [hld], a
	ld a, LOW(.Func_541b5)
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
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

.shoot_rock_low
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ld a, [hl]
	ld l, OBJ_SUBSTATE
	cp $0a
	jr z, .spaw_low_rock
	and a
	ret nz
	ld l, OBJ_STATE
	jr .asm_5414b
.spaw_low_rock
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
	jr c, .asm_5413c
	ld de, Frameset_696bc
	jr .asm_5413f
.asm_5413c
	ld de, Frameset_696c5
.asm_5413f
	call SetObjectFramesetPtr
	ld a, 34
	ld [hli], a
	ld a, $5b
	ld [wCurObjState], a
	ret

.asm_5414b
	ld a, 1
	ld [wCurObjStateDuration], a
.asm_54150
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

.asm_54163
	ld a, $34
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_5416f
	ld de, Frameset_6971c
	jr .asm_54172
.asm_5416f
	ld de, Frameset_696e0
.asm_54172
	call SetObjectFramesetPtr
	ld a, $1a
	ld [hli], a
	ret

.asm_54179
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	cp $10
	play_sfx z, SFX_0A6
	dec [hl]
	ret nz
	ld l, OBJ_STATE
	jr .asm_54150

.asm_5418e
	ld l, OBJ_VAR_3
	ld a, [wCurObjSubState]
	and $0f
	cp $03
	jr nc, .raise
	ld a, [hl] ; wCurObjVar3
	cp $1e
	jr z, .asm_54131
.raise
	dec [hl]
	jp nz, MoveObjectUp
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and $0f
	cp $04
	jr c, .asm_54209
.asm_541ab
	xor a
	ld [wCurObjState], a
	ld a, 43
	ld [wCurObjStateDuration], a
	ret

.Func_541b5:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_541e9
	cp $34
	jr z, .asm_54179
	cp $5a
	jr z, .shoot_rock_high
	cp $2d
	jr z, .asm_5418e
	cp $5b
	jp z, .shoot_rock_low
	cp $5c
	jp z, .asm_542cb
	and $fe
	cp $04
	jr z, .asm_54163
	cp $08
	jp z, .asm_5414b
	cp $0a
	jr z, .asm_54257
	cp $3a
	jp z, .asm_54286
	xor a
	ld [hl], a
	ret

.asm_541e9
	ld a, [wCurObjScreenYPos]
	add $20
	cp $20
	jr nc, .asm_54203
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

.asm_54203
	; wCurObjScreenYPos >= 0
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld l, OBJ_SUBSTATE
.asm_54209
	ld a, [hld]
	rlca
	jr c, .asm_54212
	ld de, Frameset_69713
	jr .asm_54215
.asm_54212
	ld de, Frameset_696d7
.asm_54215
	call SetObjectFramesetPtr
	ld a, 69
	ld [hli], a ; wCurObjFrameDuration
	ld a, $5a
	ld [wCurObjState], a
	ret

.shoot_rock_high
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ld a, [hl]
	ld l, OBJ_SUBSTATE
	cp $15
	jr z, .spawn_high_rock
	and a
	ret nz
	ld a, [hld]
	rlca
	jr c, .asm_54236
	ld de, Frameset_6970a
	jr .asm_54239
.asm_54236
	ld de, Frameset_696ce
.asm_54239
	call SetObjectFramesetPtr
	jp .asm_541ab

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

.asm_54257
	ld a, $3a
	ld [hld], a ; wCurObjState
	ld a, [hld] ; wCurObjSubState
	rlca
	jr c, .asm_54263
	ld de, Frameset_69721
	jr .asm_54266
.asm_54263
	ld de, Frameset_696e5
.asm_54266
	call SetObjectFramesetPtr
	ld a, $32
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_0B
	ld [hli], a
	ld a, $f0
	ld [hl], a
	call Func_30fb
	dec l
	xor a
	ld [hl], a
	play_sfx SFX_VANISH
	ret

.asm_54286
	ld bc, Data_60dd0
	call ApplyObjYMovement
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $1e
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
	stop_music2
	ret
.asm_542b6
	ld a, $e6
	ld [wCurObjCollBoxTop], a
	ld a, [hld]
	rlca
	jr c, .asm_542c5
	ld de, Frameset_69726
	jp SetObjectFramesetPtr
.asm_542c5
	ld de, Frameset_696ea
	jp SetObjectFramesetPtr

.asm_542cb
	ld l, OBJ_VAR_1
	ld a, [wCurObjSubState]
	and $0f
	cp $04
	jr c, .asm_542e0
	dec l
	ld a, [hli] ; wCurObjStateDuration
	and a
	jr nz, .asm_542e0
	; lower slowly
	ld a, [wGlobalCounter]
	rra
	ret nc
.asm_542e0
	ld a, [wCurObjYPos + 0]
	ld c, a
	ld a, [hli] ; wCurObjVar1
	cp c
	jp nz, MoveObjectDown
	ld a, [wCurObjYPos + 1]
	ld c, [hl]
	cp c
	jp nz, MoveObjectDown
	ld a, [wCurObjSubState]
	and $0f
	dec a
	jr z, .asm_5430b
	ld a, 30
	ld [wCurObjStateDuration], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_54335)
	ld [hld], a
	ld a, LOW(.Func_54335)
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_INVISIBLE_F, [hl]
	ret

.asm_5430b
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

.Func_54335:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjScreenYPos]
	cp $3a
	jr nc, .asm_54353
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.DoNothing)
	ld [hld], a
	ld a, LOW(.DoNothing)
	ld [hld], a
	ld a, $00
	ld [wBossBattleMusic], a
	call UpdateLevelMusic
	ret

.asm_54353
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_FLAGS
	res OBJFLAG_INVISIBLE_F, [hl]
	jp .asm_5406d

.DefeatedRaise:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjVar3
	dec [hl]
	jp nz, MoveObjectUp_Fast
	inc l
	ld a, [hld]
	rlca
	jr c, .asm_54375
	ld de, Frameset_6972f
	jr .asm_54378
.asm_54375
	ld de, Frameset_696f3
.asm_54378
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
	ld a, NO_ACTIONS_FOR 1
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
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld bc, Data_60180
	call ApplyObjYMovement
	ld a, [wCurObjSubState]
	rlca
	jp nc, MoveObjectRight
	jp MoveObjectLeft

RollingRockFunc_Left:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jr nz, .MoveLeft
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.MoveLeft)
	ld [hld], a
	ld a, LOW(.MoveLeft)
	ld [hld], a
.MoveLeft
	call MoveObjectLeft_Fast
	jr RollingRockFunc

RollingRockFunc_Right:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jr nz, .MoveRight
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.MoveRight)
	ld [hld], a
	ld a, LOW(.MoveRight)
	ld [hld], a
.MoveRight
	call MoveObjectRight_Fast
;	fallthrough

RollingRockFunc:
	ld a, [wCurObjVar1]
	and a
	jr nz, .asm_54422
	ld bc, Data_608b0
	jr .asm_54425
.asm_54422
	ld bc, Data_60900
.asm_54425
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
	ld a, NO_ACTIONS_FOR 1
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
.Wait
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

PalmTreeFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld hl, Pals_544dd
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
	ld a, NO_ACTIONS_FOR 1
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
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

Pals_544dd:
	rgb 31, 31, 31
	rgb  0, 23,  5
	rgb  0, 12,  5
	rgb  0,  5,  0
