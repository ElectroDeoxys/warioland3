DEF WOLFENBOSS_NUM_HITS                EQU   3  ; number of hits to defeat
DEF WOLFENBOSS_WHISP_WAIT_DURATION     EQU  20  ; duration of whisp waiting to rise
DEF WOLFENBOSS_WHISP_RISE_DURATION     EQU  64  ; duration of whisp rising
DEF WOLFENBOSS_SMOKE_ENTRANCE_DURATION EQU  19  ; duration of smoke animation when entering field
DEF WOLFENBOSS_SMOKE_EXIT_DURATION     EQU  14  ; duration of smoke animation when exiting field
DEF WOLFENBOSS_START_DELAY             EQU  40  ; delay before starting actions
DEF WOLFENBOSS_DISAPPEAR_DELAY         EQU  70  ; delay before exiting field
DEF WOLFENBOSS_SPIRAL_ATTACK_DURATION  EQU 103  ; duration of spiral attack
DEF WOLFENBOSS_IGUGARI_ATTACK_DURATION EQU  72  ; duration of igugari attack
DEF WOLFENBOSS_SPAWN_SPIRAL_DELAY      EQU  16  ; delay before spawning spiral
DEF WOLFENBOSS_SPAWN_IGUGARI_DELAY     EQU  16  ; delay before spawning igugari
DEF WOLFENBOSS_AFTER_ATTACK_DELAY      EQU  19  ; delay after attack animation
DEF WOLFENBOSS_HURT_DURATION           EQU  60  ; duration of hurt state
DEF WOLFENBOSS_AFTER_HURT_DELAY        EQU  40  ; delay after hurt animation

WolfenbossFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.WhispWaiting)
	ld [hld], a
	ld a, LOW(.WhispWaiting)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	or WOLFENBOSS_NUM_HITS + 1
	ld [hl], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 2
	ld [hld], a
	ld a, -3
	ld [hld], a
	ld a, 1
	ld [hl], a
	ld de, Frameset_69e97
	call SetObjectFramesetPtr
	ld a, WOLFENBOSS_WHISP_WAIT_DURATION
	ld [hli], a
	inc l

	xor a
	ld [hl], a ; OBJ_VAR_2
	ld [wWolfenbossNextAttack], a
	ld [wWolfenbossIgaguriOrKuriActive], a
	ld a, WOLFENBOSS_NUM_HITS + 1
	ld [wWolfenbossRemainingHits], a
	; set up so that there is always 2 spiral attacks at the start
	ld a, 2
	ld [wWolfenbossConsecutiveSpirals], a
	ret

.WhispWaiting:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	ret z
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ld bc, Data_60650
	jp nz, ApplyObjXMovement_Loop
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.WhispRising)
	ld [hld], a
	ld a, LOW(.WhispRising)
	ld [hld], a
	ld de, Frameset_69ea0
	call SetObjectFramesetPtr
	ld a, WOLFENBOSS_WHISP_RISE_DURATION
	ld [hli], a
	ld a, TRUE
	ld [wIsBossBattle], a
	stop_music2
	ret

.WhispRising:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, MoveObjectUp
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.SmokeEntrance)
	ld [hld], a
	ld a, LOW(.SmokeEntrance)
	ld [hld], a
	ld de, Frameset_69ea9
	call SetObjectFramesetPtr
	ld a, WOLFENBOSS_SMOKE_ENTRANCE_DURATION
	ld [hli], a
	play_sfx SFX_0AA
	ret

.SmokeEntrance:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.EmergeFromSmoke)
	ld [hld], a
	ld a, LOW(.EmergeFromSmoke)
	ld [hld], a
	ld l, OBJ_FRAMESET_PTR
	ld a, LOW(Frameset_69e0e)
	ld [hli], a
	ld a, HIGH(Frameset_69e0e)
	ld [hli], a
	xor a
	ld [hli], a ; OBJ_FRAME_DURATION
	inc a
	inc a
	; a = $2
	ld [hli], a ; OBJ_FRAMESET_OFFSET
	ld l, OBJ_COLLBOX_TOP
	ld a, -8
	ld [hli], a
	ld a, 12
	ld [hli], a
	ld a, -8
	ld [hli], a
	ld a, 7
	ld [hli], a
	ld a, BOSS_REGULAR
	ld [wBossState], a
	call UpdateLevelMusic
	ret

.EmergeFromSmoke:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	; move up slowly while animation plays
	ld a, [wCurObjFrame]
	and a
	jp nz, MoveObjectUp_Slow
	; animation is over, continue to next state
	ld de, Frameset_69dcb
	call SetObjectFramesetPtr
	ld a, WOLFENBOSS_START_DELAY
	ld [hli], a ; OBJ_STATE_DURATION
	xor a
	ld [hli], a ; OBJ_VAR_1
	ld [hl], a ; OBJ_VAR_2
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.StartWait)
	ld [hld], a
	ld a, LOW(.StartWait)
	ld [hld], a
	ret

.StartWait:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	inc l
	xor a
	ld [hli], a ; OBJ_STATE_DURATION
	inc l
	ld [hli], a ; OBJ_VAR_2
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Main)
	ld [hld], a
	ld a, LOW(.Main)
	ld [hld], a
	ld de, Frameset_69dec
	call SetObjectFramesetPtr
	ret

.SmokeExit:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret

.Disappear:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_69ea9
	call SetObjectFramesetPtr
	ld a, WOLFENBOSS_SMOKE_EXIT_DURATION
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.SmokeExit)
	ld [hld], a
	ld a, LOW(.SmokeExit)
	ld [hld], a
	play_sfx SFX_0AA
	ret

.start_disappear
	ld a, [wCurObjSubState]
	rlca
	ld_obj_frameset Frameset_69e0e, Frameset_69e1f
	call SetObjectFramesetPtr
	ld a, WOLFENBOSS_DISAPPEAR_DELAY
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Disappear)
	ld [hld], a
	ld a, LOW(.Disappear)
	ld [hld], a
	xor a
	ld [wBossState], a
	ret

.Main:
	ld a, no_actions_for 1
	ld [wCurObjAction], a

	; if Wario was hit, then exit the field
	ld a, [wTransformation]
	and a
	jr nz, .start_disappear

	ld hl, wCurObjState
	ld a, [hl]
	and $fe
	jr z, .do_attacks_and_movement
	cp $08
	jr nz, .check_hurt_animation
	ld a, $38
	ld [hld], a
	ld a, [hld]
	rlca
	ld_obj_frameset Frameset_69e85, Frameset_69e8e
	call SetObjectFramesetPtr
	ld a, WOLFENBOSS_HURT_DURATION
	ld [hli], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and $0f
	dec a
	ret z
	dec [hl]
	ld hl, wWolfenbossRemainingHits
	dec [hl]
	ret

.check_hurt_animation
	cp $38
	jr nz, .restart_attacks_and_movement
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jr z, .done_hurt
	ld a, [hl]
	cp 41
	jp c, MoveObjectDown_Slow
	ret nz
	play_sfx SFX_0A9
	ret

.done_hurt
	ld a, WOLFENBOSS_AFTER_HURT_DELAY
	ld [hli], a ; OBJ_STATE_DURATION
	ld a, $04
	ld [hl], a ; OBJ_VAR_1
	ld l, OBJ_FLAGS
	res OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_STATE
	xor a
	ld [hld], a
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr nz, .asm_5601d
	ld de, Frameset_69e0e
	jp SetObjectFramesetPtr
.asm_5601d
	ld de, Frameset_69e1f
	jp SetObjectFramesetPtr

.restart_attacks_and_movement
	xor a
	ld [hl], a
.do_attacks_and_movement
	ld l, OBJ_VAR_1
	ld a, [hl]
	and a
	jp z, .do_movement
	cp $01
	jr z, .do_attack
	cp $02
	jr z, .wait_then_start_movement
	cp $03
	jr z, .turning
	cp $04
	jr z, .after_hurt
	ret

.after_hurt
	call MoveObjectUp_Slow
	ld l, OBJ_FRAMESET_OFFSET
	ld a, [hld]
	cp $4
	jr nz, .wait_then_start_movement
	ld a, [hld]
	and a
	jr nz, .wait_then_start_movement
	ld a, [wCurObjSubState]
	and $0f
	cp 1 ; no more remaining hits
	jp z, .defeated

.wait_then_start_movement
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	jr .start_movement

.do_attack
	ld a, [wWolfenbossNextAttack]
	ld c, a
	and a
	jr z, .spiral_delay
; igugari delay
	ld b, WOLFENBOSS_IGUGARI_ATTACK_DURATION - WOLFENBOSS_SPAWN_IGUGARI_DELAY
	jr .got_attack_delay
.spiral_delay
	ld b, WOLFENBOSS_SPIRAL_ATTACK_DURATION - WOLFENBOSS_SPAWN_SPIRAL_DELAY
.got_attack_delay
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	cp b
	jr z, .spawn_igugari_or_spiral
	dec [hl]
	ret nz
	ld a, WOLFENBOSS_AFTER_ATTACK_DELAY
	ld [hli], a ; OBJ_STATE_DURATION
	ld a, $02
	ld [hl], a ; OBJ_VAR_1
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_56082
	ld de, Frameset_69dfb
	jp SetObjectFramesetPtr
.asm_56082
	ld de, Frameset_69e00
	jp SetObjectFramesetPtr

.spawn_igugari_or_spiral
	dec [hl]
	ld a, [wCurObjSubState]
	rlca
	dec c
	jr c, .spawn_on_right
; spawn on left
	jr z, .spawn_igugari_left
	ld bc, ObjParams_MagicSpiralLeft
	jp CreateObjectAtRelativePos
.spawn_igugari_left
	ld bc, ObjParams_IgaguriLeft
	jp CreateObjectAtRelativePos
.spawn_on_right
	jr z, .spawn_igugari_right
	ld bc, ObjParams_MagicSpiralRight
	jp CreateObjectAtRelativePos
.spawn_igugari_right
	ld bc, ObjParams_IgaguriRight
	jp CreateObjectAtRelativePos

.turning
	ld bc, Data_604c0
	call ApplyObjYMovement_Loop
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	ld a, [wCurObjVar2]
	and a
	jr nz, .asm_560d9
.start_movement
	xor a
	ld [wCurObjVar1], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_560d3
	ld de, Frameset_69dec
	jp SetObjectFramesetPtr
.asm_560d3
	ld de, Frameset_69de7
	jp SetObjectFramesetPtr
.asm_560d9
	xor a
	ld [wCurObjVar2], a
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr z, .asm_56115
	jr .asm_5613e

.do_movement
	ld a, [wGlobalCounter]
	and %11111
	play_sfx z, SFX_0C3
	ld bc, Data_604c0
	call ApplyObjYMovement_Loop

	ld a, [wCurObjSubState]
	rlca
	jr c, .moving_right
; moving left
	ld a, [wGlobalCounter]
	and a
	jr nz, .move_left
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wCurObjScreenXPos]
	cp b
	jr nc, .asm_56115
	ld a, $01
	ld [wCurObjVar2], a
	jr .asm_56122
.asm_56115
	ld de, Frameset_69df1
	jr .start_attack
.move_left
	ld a, [wCurObjScreenXPos]
	cp $18
	jp nz, MoveObjectLeft_Slow
.asm_56122
	ld de, Frameset_69dd5
	jr .start_turning

.moving_right
	ld a, [wGlobalCounter]
	and a
	jr nz, .move_right
	ld a, [wCurObjScreenXPos]
	ld b, a
	ld a, [wWarioScreenXPos]
	cp b
	jr nc, .asm_5613e
	ld a, $01
	ld [wCurObjVar2], a
	jr .asm_56176
.asm_5613e
	ld de, Frameset_69df6

.start_attack
	call SetObjectFramesetPtr

	; decide which attack to use
	ld a, [wWolfenbossConsecutiveSpirals]
	and a
	jr z, .alternate_attacks
	; forced spiral attack
	dec a
	ld [wWolfenbossConsecutiveSpirals], a
	jr .set_spiral_attack
.alternate_attacks
	; only attack with Igaguri if last attack was spiral
	ld a, [wWolfenbossIgaguriOrKuriActive]
	and a
	jr z, .set_igugari_attack
.set_spiral_attack
	ld b, $00 ; var 1
	ld a, WOLFENBOSS_SPIRAL_ATTACK_DURATION ; duration
	jr .got_next_attack
.set_igugari_attack
	ld a, TRUE
	ld [wWolfenbossIgaguriOrKuriActive], a
	ld b, $01 ; var 1
	ld a, WOLFENBOSS_IGUGARI_ATTACK_DURATION ; duration
.got_next_attack
	ld [hli], a ; OBJ_STATE_DURATION
	ld a, $01
	ld [hl], a ; OBJ_VAR_1
	ld a, b
	ld [wWolfenbossNextAttack], a
	ret

.move_right
	ld a, [wCurObjScreenXPos]
	cp $98
	jp nz, MoveObjectRight_Slow
.asm_56176
	ld de, Frameset_69dde
.start_turning
	call SetObjectFramesetPtr
	ld a, 27
	ld [hli], a ; OBJ_STATE_DURATION
	ld a, $03
	ld [hl], a ; OBJ_VAR_1
	ret

.defeated
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.DefeatFall)
	ld [hld], a
	ld a, LOW(.DefeatFall)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and $0 | OBJSUBFLAG_HDIR
	ld [hld], a
	xor a
	ld [hl], a
	ld l, OBJ_FLAGS
	set OBJFLAG_PRIORITY_F, [hl]
	stop_music2
	ld de, Frameset_69e05
	jp SetObjectFramesetPtr

.DefeatFall:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld a, [wCurObjScreenYPos]
	cp $c0
	jr nc, .asm_561ca
	ld a, [wCurObjVar3]
	cp $2b
	play_sfx z, SFX_0A3
	ld bc, Data_60da0
	jp ApplyObjYMovement
.asm_561ca
	ld a, BOSS_DEFEATED
	ld [wBossState], a
	call UpdateLevelMusic
	xor a
	ld [wIsBossBattle], a
	call Func_56326

	; search for Platform's object struct
	ld a, LOW(wObj1)
	ld b, LOW(wObj1)
	ld h, HIGH(wObj1)
.loop_objects
	ld l, OBJ_ID
	add l
	ld l, a
	ld a, [hl] ; OBJ_ID
	cp WOLFENBOSS_PLATFORM
	jr nz, .next_object
	ld a, l
	sub OBJ_ID - OBJ_FLAGS
	ld l, a
	ld a, [hli] ; OBJ_FLAGS
	rra
	jr c, .found_platform_obj
.next_object
	ld a, b
	cp LOW(wObj8)
	ret z
	add OBJ_STRUCT_LENGTH
	ld b, a
	jr .loop_objects
.found_platform_obj
	ld a, l
	add OBJ_STATE - OBJ_UNK_01
	ld l, a
	ld a, $2f
	ld [hl], a
	ret

MagicSpiralFunc:
	ld hl, wCurObjFlags
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Grow)
	ld [hld], a
	ld a, LOW(.Grow)
	ld [hld], a
	play_sfx SFX_0C2
.Grow:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .done_grow
	ld a, [hl]
	cp 69
	jr nz, .asm_5622c
	ld de, Frameset_69e39
	jp SetObjectFramesetPtr
.asm_5622c
	cp 38
	ret nz
	ld de, Frameset_69e42
	jp SetObjectFramesetPtr
.done_grow
	ld a, 8
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Move)
	ld [hld], a
	ld a, LOW(.Move)
	ld [hld], a
	ret

.Move:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .skip_sfx
	dec [hl]
	play_sfx z, SFX_07C
.skip_sfx
	ld a, [wTransformation]
	and a
	jr nz, .disappear
	ld a, [wWolfenbossRemainingHits]
	dec a
	jr z, .destroy
	ld hl, wCurObjSubState
	bit OBJSUBFLAG_VDIR_F, [hl]
	ld a, [wCurObjScreenYPos]
	jr nz, .moving_down
; moving up
	cp $18
	jr c, .set_move_down
	call MoveObjectUp
	jr .done_vertical_movement
.set_move_down
	set OBJSUBFLAG_VDIR_F, [hl]
	jr .asm_56281
.moving_down
	cp SCREEN_HEIGHT_PX
	jr nc, .set_move_up
	call MoveObjectDown
	jr .done_vertical_movement
.set_move_up
	res OBJSUBFLAG_VDIR_F, [hl]

.asm_56281
	call .reflect
.done_vertical_movement
	ld l, OBJ_SUBSTATE
	bit OBJSUBFLAG_HDIR_F, [hl]
	ld a, [wCurObjScreenXPos]
	jr nz, .moving_right
; moving left
	cp $10
	jp nc, MoveObjectLeft
	set OBJSUBFLAG_HDIR_F, [hl]
	jr .reflect
.moving_right
	cp SCREEN_WIDTH_PX
	jp c, MoveObjectRight
	res OBJSUBFLAG_HDIR_F, [hl]

.reflect
	; each time there is a reflection
	; (either horizontally or vertically)
	; then decrement substatus
	dec [hl]
	ld a, [hl]
	and $0f
	ret nz
.disappear
	ld de, Frameset_69eb2
	call SetObjectFramesetPtr
	ld a, 27
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Disappear)
	ld [hld], a
	ld a, LOW(.Disappear)
	ld [hld], a
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ret

.Disappear:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
.destroy
	xor a
	ld [wCurObjFlags], a
	ret

WolfenbossPlatformFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.WaitOpen)
	ld [hld], a
	ld a, LOW(.WaitOpen)
	ld [hld], a
	ld de, Frameset_69e72
	call SetObjectFramesetPtr
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 7
	ld [hld], a
	ld a, -8
	ld [hld], a
	ld a, 8
	ld [hl], a
	ret

.WaitOpen:
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld a, [wCurObjState]
	cp $2f
	ret nz
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Open)
	ld [hld], a
	ld a, LOW(.Open)
	ld [hld], a
	ld a, $50
	ld [wCurObjStateDuration], a
	ret

.Open:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_VAR_2
	ld a, $02
	ld [hli], a
	xor a
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Disappear)
	ld [hld], a
	ld a, LOW(.Disappear)
	ld [hld], a
	ret

.Disappear:
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jp nz, Func_3326
;	fallthrough

Func_56326:
	xor a
	ld [wCurObjFlags], a
	ld hl, wCurObjUnk02
	ld e, $07
	farcall Func_ba42
	ret

IgaguriFunc:
	ld a, [wGlobalCounter]
	and %111
	play_sfx z, SFX_06B
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .done_grow
	ld a, [hl]
	cp 43
	jr nz, .asm_56364
	ld de, Frameset_69e80
	jp SetObjectFramesetPtr
.asm_56364
	cp 24
	ret nz
	ld de, Frameset_69e4b
	jp SetObjectFramesetPtr

.done_grow
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Fall)
	ld [hld], a
	ld a, LOW(.Fall)
	ld [hld], a
	ld de, Frameset_69e4b
	call SetObjectFramesetPtr
	ld a, 40
	ld [hli], a
	ld a, $03
	ld [hli], a ; OBJ_VAR_1
	ld a, [wWolfenbossRemainingHits]
	cp 2 + 1
	jr c, .last_hit_1
	play_sfx SFX_101
	ld a, $02
	jr .got_var_2
.last_hit_1
	play_sfx SFX_067
	ld a, $01
.got_var_2
	ld [hli], a ; OBJ_VAR_2
	xor a
	ld [hl], a ; OBJ_VAR_3
	ret

.Fall:
	ld a, [wTransformation]
	and a
	jr z, .no_transformation_1
	ld a, no_actions_for 1
	ld [wCurObjAction], a
.no_transformation_1
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld a, [wWolfenbossRemainingHits]
	cp 2 + 1
	jr c, .arc_movement
	; adjust y position 4 pixels down
	ld hl, wCurObjYPos
	ld a, [hl]
	add $4
	ld [hli], a
	jr nc, .check_floor
	inc [hl]
	jr .check_floor
.arc_movement
	; igaguri is thrown upwards
	; before falling to the floor
	ld bc, Data_60d80
	call ApplyObjYMovement
.check_floor
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
	jr z, .do_horizontal_movement

	; collide with floor
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	call .ground_shake
	ld a, [wWolfenbossRemainingHits]
	cp 2 + 1
	jr nc, .skip_bounce
	; is on last hit, track Wario's position
	ld hl, wCurObjSubState
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .track_right
; track left
	res OBJSUBFLAG_HDIR_F, [hl]
	jr .do_bounce
.track_right
	set OBJSUBFLAG_HDIR_F, [hl]
.do_bounce
	dec l
	xor a
	ld [hld], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Bounce)
	ld [hld], a
	ld a, LOW(.Bounce)
	ld [hld], a
	ret

.do_horizontal_movement
	ld hl, wCurObjSubState
	bit OBJSUBFLAG_HDIR_F, [hl]
	ld a, [wCurObjScreenXPos]
	jr nz, .moving_right
; moving left
	cp $10
	jp nc, MoveObjectLeftByVar2
	; reverse horizontal direction
	set OBJSUBFLAG_HDIR_F, [hl]
	ret
.moving_right
	cp SCREEN_WIDTH_PX
	jp c, MoveObjectRightByVar2
	; reverse horizontal direction
	res OBJSUBFLAG_HDIR_F, [hl]
	ret

.Bounce:
	ld a, [wTransformation]
	and a
	jr z, .no_transformation_2
	ld a, no_actions_for 1
	ld [wCurObjAction], a
.no_transformation_2
	ld a, $2
	ld [wCurObjFrameDuration], a

	ld bc, Data_60e00
	call ApplyObjYMovement
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
	jr z, .do_horizontal_movement

	; collide with floor
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_VAR_1
	dec [hl]
	jr nz, .asm_56477
.skip_bounce
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Hatch)
	ld [hld], a
	ld a, LOW(.Hatch)
	ld [hld], a
	xor a
	ld [wCurObjVar1], a
	ret
.asm_56477
	xor a
	ld [wCurObjVar3], a
.ground_shake
	play_sfx SFX_061
	ld b, 24
	jp DoGroundShake

.Hatch:
	ld a, [wTransformation]
	and a
	jr z, .no_transformation_3
	ld a, no_actions_for 1
	ld [wCurObjAction], a
.no_transformation_3
	ld hl, wCurObjVar1
	ld a, [hl]
	and a
	jr z, .asm_564a3
	cp $01
	jr z, .asm_564b1
	cp $02
	jr z, .asm_564ce
	ret
.asm_564a3
	ld a, $2
	ld [wCurObjFrameDuration], a
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld a, 60
	ld [hli], a
	inc [hl] ; OBJ_VAR_1
	ret
.asm_564b1
	ld a, [wGlobalCounter]
	and %11111
	play_sfx z, SFX_0C5
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld a, 14
	ld [hli], a
	inc [hl] ; OBJ_VAR_1
	ld de, Frameset_69e59
	jp SetObjectFramesetPtr
.asm_564ce
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jr z, .destroy
	ld a, [hl]
	cp 5
	ret nz
	play_sfx SFX_0C4
	ld bc, ObjParams_Kuri
	jp CreateObjectFromCurObjPos
.destroy
	xor a
	ld [wCurObjFlags], a
	ret

KuriFunc:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld bc, Data_60d60
	call ApplyObjYMovement
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
	ret z ; not yet reach the floor
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Landed)
	ld [hld], a
	ld a, LOW(.Landed)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_5652d
	set OBJSUBFLAG_HDIR_F, [hl]
	ret
.asm_5652d
	res OBJSUBFLAG_HDIR_F, [hl]
	ret

.switch_direction_if_moving_left
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr z, .switch_direction
	jr .set_walking

.switch_direction_if_moving_right
	bit OBJSUBFLAG_HDIR_F, [hl]
	jr nz, .switch_direction
	jr .set_walking

.Landed:
	ld a, [wTransformation]
	and a
	jr z, .asm_56547
	ld a, no_actions_for 1
	ld [wCurObjAction], a
.asm_56547
	ld hl, wCurObjState
	ld a, [hld]
	and a
	jr z, .walking
	cp OBJSTATE_BUMP_LEFT_START
	jr z, .switch_direction_if_moving_left
	cp OBJSTATE_BUMP_RIGHT_START
	jr z, .switch_direction_if_moving_right
	cp OBJSTATE_VANISH_TOUCH
	jr z, .vanish
	cp OBJSTATE_ATTACKED_LEFT_START
	jr z, .attacked_left
	cp OBJSTATE_ATTACKED_RIGHT_START
	jr z, .attacked_right
.switch_direction
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a

.set_walking
	inc l
	xor a
	ld [hld], a

.walking
	ld l, OBJ_FLAGS
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jr nz, .on_screen_1
	; destroy itself
	xor a
	ld [hl], a
	ret
.on_screen_1
	ld a, [wTransformation]
	and a
	jr nz, .skip_sfx
	ld a, [wGlobalCounter]
	and %111
	play_sfx z, SFX_06A
.skip_sfx
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	rlca
	ld a, [wCurObjScreenXPos]
	jr c, .moving_right
; moving left
	cp $10
	jp nc, MoveObjectLeft
	set OBJSUBFLAG_HDIR_F, [hl]
	ret
.moving_right
	cp SCREEN_WIDTH_PX
	jp c, MoveObjectRight
	res OBJSUBFLAG_HDIR_F, [hl]
	ret

.vanish
	ld hl, wWolfenbossIgaguriOrKuriActive
	dec [hl]
	jp VanishObject2

.attacked_left
	set OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_69e60
	jr .asm_565b3
.attacked_right
	res OBJSUBFLAG_HDIR_F, [hl]
	ld de, Frameset_69e60
.asm_565b3
	inc l
	xor a
	ld [hl], a
	ld l, OBJ_FLAGS
	set OBJFLAG_GRABBED_F, [hl]
	ld a, 3
	ld [wCurObjVar2], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Launched)
	ld [hld], a
	ld a, LOW(.Launched)
	ld [hld], a
	jp SetObjectFramesetPtr

.Launched:
	ld a, no_actions_for 1
	ld [wCurObjAction], a
	ld a, [wCurObjState]
	and $fe
	cp $28
	jr z, .vanish
	call MoveObjectUp_Fast
	ld l, OBJ_FLAGS
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jr nz, .on_screen_2
	xor a
	ld [hl], a
	ld hl, wWolfenbossIgaguriOrKuriActive
	dec [hl]
	ret
.on_screen_2
	ld hl, wCurObjSubState
	bit OBJSUBFLAG_HDIR_F, [hl]
	ld a, [wCurObjScreenXPos]
	jr nz, .launched_right
; launched left
	cp $10
	jp nc, MoveObjectLeftByVar2
	set OBJSUBFLAG_HDIR_F, [hl]
	jr .launch_switch_direction
.launched_right
	cp SCREEN_WIDTH_PX
	jp c, MoveObjectRightByVar2
	res OBJSUBFLAG_HDIR_F, [hl]
.launch_switch_direction
	ld a, [wCurObjScreenYPos]
	cp $11
	ret c
	play_sfx SFX_01A
	ret
