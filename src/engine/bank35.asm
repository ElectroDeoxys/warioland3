_ClearScreenStateTable: ; d4000 (35:4000)
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw InitClearScreen
	dw SlowFadeFromWhite
	dw Func_d41bb

	dw SlowFadeBGToWhite ; SST_CLEAR_TIME_ATTACK
	dw InitTimeAttackClearScreen
	dw DarkenBGToPal_Fast
	dw Func_d434c

	dw SlowFadeBGToWhite ; SST_CLEAR_MUSICAL_COINS
	dw InitMusicalCoinScreen
	dw DarkenBGToPal_Fast
	dw Func_d4472
	dw Func_d4507
	dw Func_d454c
	dw Func_d45f0 ; SST_CLEAR_EXIT
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
; 0xd402a

InitClearScreen: ; d402a (35:402a)
	ld a, TRUE
	ld [wResetDisabled], a

	call DisableLCD
	call ClearBGMap0
	call ClearVirtualOAM

	call SetTreasureTransitionParam

	ldh a, [rSVBK]
	push af
	ld a, BANK(wTreasuresCollected)
	ldh [rSVBK], a
	ld a, [wTransitionParam]
	cp TRANSITION_RETURN_TO_MAP
	jr z, .return_to_map
	call IsTreasureCollected
	ld a, [hl]
	or d
	ld [hl], a
.return_to_map
	ld a, [wTreasuresCollected]
	rlca
	rlca
	rlca
	jr c, .has_gold_music_box
	rlca
	jr c, .has_red_music_box
	rlca
	jr c, .has_green_music_box
	rlca
	jr c, .has_blue_music_box
	rlca
	jr c, .has_yellow_music_box
	xor a
	jr .got_number_music_boxes
.has_gold_music_box
	ld a, 5
	jr .got_number_music_boxes
.has_red_music_box
	ld a, 4
	jr .got_number_music_boxes
.has_green_music_box
	ld a, 3
	jr .got_number_music_boxes
.has_blue_music_box
	ld a, 2
	jr .got_number_music_boxes
.has_yellow_music_box
	ld a, 1
.got_number_music_boxes
	ld [wNumMusicBoxes], a
	pop af
	ldh [rSVBK], a

	farcall LoadClearScreenPals
	call LoadCollectedTreasurePal_ClearScreen
	farcall LoadClearScreenGfx
	farcall LoadLevelTreasureData
	farcall Func_1e0045

	hlbgcoord 6, 16
	farcall PrintNumberCoins

	ld a, [wKeyAndTreasureFlags]
	ld b, a
	bit GREY_TREASURE_F, b
	jr z, .check_red
	hlbgcoord 3, 8
	ld a, $54
	ld [hli], a
	inc a
	ld [hl], a
.check_red
	bit RED_TREASURE_F, b
	jr z, .check_green
	hlbgcoord 7, 8
	ld a, $54
	ld [hli], a
	inc a
	ld [hl], a
.check_green
	bit GREEN_TREASURE_F, b
	jr z, .check_blue
	hlbgcoord 11, 8
	ld a, $5c
	ld [hli], a
	inc a
	ld [hl], a
.check_blue
	bit BLUE_TREASURE_F, b
	jr z, .ok
	hlbgcoord 15, 8
	ld a, $5c
	ld [hli], a
	inc a
	ld [hl], a

.ok
	call UpdateNumCollectedTreasures
	call VBlank_d4764

	xor a
	ld [wSCX], a
	ldh [rSCX], a
	ld a, $04
	ld [wSCY], a
	ldh [rSCY], a
	farcall Func_1e015b

	ld a, [wPowerUpLevel]
	and ACTION_HELP_LEVEL_CLEAR
	jr z, .no_power_up
	ld hl, wMenuObj8FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj8
	call AddClearScreenSprite
.no_power_up
	ld hl, wClearScreenWarioFramesetPtr + 1
	call UpdateObjAnim
	ld hl, wClearScreenWario
	call AddClearScreenWarioSprite

	ld a, [wLevelEndScreen]
	cp LVLEND_NO_TREASURE
	jr z, .no_treasure
	ld hl, wMenuObj1FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj1
	call AddClearScreenSprite

.no_treasure
	ld hl, wMenuObj2FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj2
	call AddClearScreenSprite

	ld a, [wNumMusicBoxes]
	and a
	jp z, .no_music_boxes
	dec a
	jr z, .one_music_box
	dec a
	jr z, .two_music_boxes
	dec a
	jr z, .three_music_boxes
	dec a
	jr z, .four_music_boxes
; all music boxes
	ld hl, wMenuObj3FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj3
	call AddClearScreenSprite
.four_music_boxes
	ld hl, wMenuObj4FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj4
	call AddClearScreenSprite
.three_music_boxes
	ld hl, wMenuObj5FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj5
	call AddClearScreenSprite
.two_music_boxes
	ld hl, wMenuObj6FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj6
	call AddClearScreenSprite
.one_music_box
	ld hl, wMenuObj7FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj7
	call AddClearScreenSprite

.no_music_boxes
	ld a, LCDCF_BGON | LCDCF_OBJON | LCDCF_OBJ16 | LCDCF_ON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret
; 0xd41bb

Func_d41bb: ; d41bb (35:41bb)
	ld a, [wPowerUpLevel]
	and ACTION_HELP_LEVEL_CLEAR
	jr z, .asm_d41ce
	ld hl, wMenuObj8FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj8
	call AddClearScreenSprite

.asm_d41ce
	ld hl, wClearScreenWarioFramesetPtr + 1
	call UpdateObjAnim
	ld a, [wClearScreenWarioVar]
	and a
	jr nz, .asm_d4203
	ld a, [wObjAnimWasReset]
	and a
	jr z, .asm_d4203
	ld a, $01
	ld [wClearScreenWarioVar], a
	; reset animation
	ld hl, wClearScreenWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wTransitionParam]
	cp TRANSITION_RETURN_TO_MAP
	jr z, .asm_d41fa
	ld a, HIGH(Frameset_d4d1b)
	ld [hli], a
	ld a, LOW(Frameset_d4d1b)
	ld [hl], a
	jr .asm_d4200
.asm_d41fa
	ld a, HIGH(Frameset_d4d5f)
	ld [hli], a
	ld a, LOW(Frameset_d4d5f)
	ld [hl], a
.asm_d4200
	call UpdateObjAnim
.asm_d4203
	ld hl, wClearScreenWario
	call AddClearScreenWarioSprite

	ld hl, wMenuObj2
	call AddClearScreenSprite
	ld a, [wLevelEndScreen]
	cp LVLEND_NO_TREASURE
	jr z, .asm_d4222
	ld hl, wMenuObj1FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj1
	call AddClearScreenSprite

.asm_d4222
	ld a, [wNumMusicBoxes]
	and a
	jr z, .asm_d4252
	dec a
	jr z, .asm_d424c
	dec a
	jr z, .asm_d4246
	dec a
	jr z, .asm_d4240
	dec a
	jr z, .asm_d423a
	ld hl, wMenuObj3
	call AddClearScreenSprite
.asm_d423a
	ld hl, wMenuObj4
	call AddClearScreenSprite
.asm_d4240
	ld hl, wMenuObj5
	call AddClearScreenSprite
.asm_d4246
	ld hl, wMenuObj6
	call AddClearScreenSprite
.asm_d424c
	ld hl, wMenuObj7
	call AddClearScreenSprite
.asm_d4252
	call ClearUnusedVirtualOAM

	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
;	fallthrough

OpenMusicalCoinsScreen: ; d425b (35:425b)
	ld a, SST_CLEAR_MUSICAL_COINS
	ld [wSubState], a
	ret
; 0xd4261

InitTimeAttackClearScreen: ; d4261 (35:4261)
	ld a, TRUE
	ld [wResetDisabled], a

	call DisableLCD
	call ClearBGMap0
	call ClearVirtualOAM

	ld a, TRANSITION_RETURN_TO_MAP
	ld [wTransitionParam], a

	farcall Func_1e000d
	farcall LoadClearScreenGfx
	farcall Func_1e005f
	call VBlank_d4764

	xor a
	ld [wSCX], a
	ldh [rSCX], a
	ld a, $04
	ld [wSCY], a
	ldh [rSCY], a
	farcall Func_1e028a

	ld a, [wTimeAttackResult]
	cp TIME_ATTACK_GOT_HIGH_SCORE
	jr nz, .asm_d42d3
	ld hl, wMenuObj8FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj8
	call AddClearScreenSprite

.asm_d42d3
	ld hl, wClearScreenWarioFramesetPtr + 1
	call UpdateObjAnim
	ld hl, wClearScreenWario
	call AddClearScreenWarioSprite

	ld hl, wMenuObj2FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj2
	call AddClearScreenSprite

	ld hl, wMenuObj3FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj3
	call AddClearScreenSprite

	ld a, [wKeyAndTreasureFlags]
	bit GREY_KEY_F, a
	jr z, .red_key
	ld hl, wMenuObj4FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj4
	call AddClearScreenSprite

.red_key
	ld a, [wKeyAndTreasureFlags]
	bit RED_KEY_F, a
	jr z, .green_key
	ld hl, wMenuObj5FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj5
	call AddClearScreenSprite

.green_key
	ld a, [wKeyAndTreasureFlags]
	bit GREEN_KEY_F, a
	jr z, .blue_key
	ld hl, wMenuObj6FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj6
	call AddClearScreenSprite

.blue_key
	ld a, [wKeyAndTreasureFlags]
	bit BLUE_KEY_F, a
	jr z, .done_keys
	ld hl, wMenuObj7FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj7
	call AddClearScreenSprite

.done_keys
	ld a, LCDCF_BGON | LCDCF_OBJON | LCDCF_OBJ16 | LCDCF_ON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret
; 0xd434c

Func_d434c: ; d434c (35:434c)
	ld a, [wTimeAttackResult]
	cp TIME_ATTACK_GOT_HIGH_SCORE
	jr nz, .asm_d435f
	ld hl, wMenuObj8FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj8
	call AddClearScreenSprite

.asm_d435f
	ld hl, wClearScreenWarioFramesetPtr + 1
	call UpdateObjAnim
	ld a, [wActionHelpWarioVar]
	and a
	jr nz, .asm_d4394
	ld a, [wObjAnimWasReset]
	and a
	jr z, .asm_d4394
	ld a, $01
	ld [wActionHelpWarioVar], a
	ld hl, wClearScreenWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a

	ld a, [wTimeAttackResult]
	cp TIME_ATTACK_GOT_HIGH_SCORE
	jr nz, .asm_d438b
	ld a, HIGH(Frameset_d4d1b)
	ld [hli], a
	ld a, LOW(Frameset_d4d1b)
	ld [hl], a
	jr .asm_d4391
.asm_d438b
	ld a, HIGH(Frameset_d4d5f)
	ld [hli], a
	ld a, LOW(Frameset_d4d5f)
	ld [hl], a
.asm_d4391
	call UpdateObjAnim
.asm_d4394
	ld hl, wClearScreenWario
	call AddClearScreenWarioSprite

	ld hl, wMenuObj2
	call AddClearScreenSprite
	ld hl, wMenuObj3
	call AddClearScreenSprite

	ld a, [wKeyAndTreasureFlags]
	bit GREY_KEY_F, a
	jr z, .red_key
	ld hl, wMenuObj4
	call AddClearScreenSprite

.red_key
	ld a, [wKeyAndTreasureFlags]
	bit RED_KEY_F, a
	jr z, .green_key
	ld hl, wMenuObj5
	call AddClearScreenSprite

.green_key
	ld a, [wKeyAndTreasureFlags]
	bit GREEN_KEY_F, a
	jr z, .blue_key
	ld hl, wMenuObj6
	call AddClearScreenSprite

.blue_key
	ld a, [wKeyAndTreasureFlags]
	bit BLUE_KEY_F, a
	jr z, .done_keys
	ld hl, wMenuObj7
	call AddClearScreenSprite
.done_keys
	call ClearUnusedVirtualOAM

	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	jp OpenMusicalCoinsScreen
; 0xd43e6

InitMusicalCoinScreen: ; d43e6 (35:43e6)
	call DisableLCD
	call ClearBGMap0
	call ClearVirtualOAM

	call Func_d464e
	call Func_d465b
	call Func_d4668
	call Func_d47f1

	ld a, $ff
	ld [wAllMusicalCoinsLevel], a
	ld a, [wNumMusicalCoins]
	cp NUM_LEVEL_MUSICAL_COINS
	call z, SetMusicalCoinFlag

	call VBlank_d47a7

	xor a
	ld [wSCX], a
	ldh [rSCX], a
	ld [wSCY], a
	ldh [rSCY], a

	ld hl, wMenuObj3
	ld a, $38
	ld [hli], a ; y
	ld a, $40
	ld [hli], a ; x
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1cd4)
	ld [hli], a
	ld a, LOW(Frameset_1f1cd4)
	ld [hl], a
	farcall $7c, UpdateObjAnim
	ld hl, wMenuObj3
	farcall AddPauseMenuSprite

	ld a, 8
	ld [wAnimatedTilesFrameDuration], a
	ld a, ANIMATED_TILES_GFX_15
	ld [wAnimatedTilesGfx], a
	xor a
	ld [wAnimatedTilesFrameCount], a
	ld [wAnimatedTilesFrame], a
	inc a ; TRUE
	ld [wRoomAnimatedTilesEnabled], a
	ld a, LCDCF_BGON | LCDCF_OBJON | LCDCF_OBJ16 | LCDCF_ON
	ldh [rLCDC], a
	xor a
	ld [wc0e8], a
	ld a, 60
	ld [wTimer], a
	ld hl, wSubState
	inc [hl]
	ret
; 0xd4472

Func_d4472: ; d4472 (35:4472)
	ld hl, wMenuObj3FramesetPtr + 1
	farcall $7c, UpdateObjAnim
	ld hl, wMenuObj3
	farcall AddPauseMenuSprite
	call ClearUnusedVirtualOAM

	ld hl, wNumMusicalCoins
	ld a, [wc0e8]
	cp [hl]
	jr z, .asm_d44dc
	ld hl, wTimer
	ld a, [hl]
	and a
	jr z, .asm_d44ab
	dec [hl]
	ret

.asm_d44ab
	ld a, [wGlobalCounter]
	and %11
	ret nz
	play_sfx SFX_REGULAR_COIN
	ld hl, wce01
	ld a, $98
	ld [hli], a
	ld a, $8b
	ld [hli], a

	ld a, [wc0e8]
	inc a
	ld [wc0e8], a
	add a ; *2
	add $a0
	ld b, a
	ld [hli], a
	ld a, $98
	ld [hli], a
	ld a, $ab
	ld [hli], a
	inc b
	ld [hl], b
	ld a, $80
	ld [wcee4], a
	ret

.asm_d44dc
	ld a, [wAllMusicalCoinsLevel]
	inc a
	jp z, Func_d45e1

	play_sfx SFX_03A

	ld hl, wMenuObj1
	ld a, $42
	ld [hli], a ; y
	ld a, $60
	ld [hli], a ; x
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d65f0)
	ld [hli], a
	ld a, LOW(Frameset_d65f0)
	ld [hl], a
	call UpdateObjAnim

	ld hl, wSubState
	inc [hl]
	ret
; 0xd4507

Func_d4507: ; d4507 (35:4507)
	call DoPencilMovement
	push af
	ld hl, wMenuObj1
	call AddPencilSprite
	ld hl, wMenuObj3FramesetPtr + 1
	farcall $7c, UpdateObjAnim
	ld hl, wMenuObj3
	farcall AddPauseMenuSprite
	call ClearUnusedVirtualOAM
	pop af
	and a
	ret z

	xor a
	ld [wTimer], a
	play_sfx SFX_03A
	ld hl, wSubState
	inc [hl]
	ret
; 0xd454c

Func_d454c: ; d454c (35:454c)
	call DoPencilScribbling

	ld hl, wMenuObj1
	call AddPencilSprite

	ld hl, wMenuObj3FramesetPtr + 1
	farcall $7c, UpdateObjAnim
	ld hl, wMenuObj3YCoord
	farcall AddPauseMenuSprite
	call ClearUnusedVirtualOAM

	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp 52
	jr nc, .done
	cp 20
	ret nz
	ld a, [wAllMusicalCoinsLevel]
	ld e, a
	ld d, $00
	ld hl, MusicalCoinLevelBGPals
	add hl, de
	ld b, [hl]
	ld a, [wAllMusicalCoinsLevel]
	cp NUM_LEVELS - 5
	jr nc, .row_4
	cp NUM_LEVELS - 10
	jr nc, .row_3
	cp NUM_LEVELS - 15
	jr nc, .row_2
	cp NUM_LEVELS - 20
	jr nc, .row_1
; row 0
	hlbgcoord 8, 9
	jr .got_coords
.row_1
	sub 5
	hlbgcoord 8, 10
	jr .got_coords
.row_2
	sub 10
	hlbgcoord 8, 11
	jr .got_coords
.row_3
	sub 15
	hlbgcoord 8, 12
	jr .got_coords
.row_4
	sub 20
	hlbgcoord 8, 13
.got_coords
	ld e, a
	ld d, $00
	add hl, de
	ld d, h
	ld e, l
	ld hl, wce01
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ld [hl], b
	ld a, $81
	ld [wcee4], a
	ret

.done
	play_sfx SFX_MUSICAL_COIN
;	fallthrough

Func_d45e1: ; d45e1 (35:45e1)
	xor a
	ld [wTimer + 0], a
	ld a, 2
	ld [wTimer + 1], a
	ld hl, wSubState
	ld [hl], SST_CLEAR_EXIT
	ret
; 0xd45f0

Func_d45f0: ; d45f0 (35:45f0)
	ld hl, wMenuObj3FramesetPtr + 1
	farcall $7c, UpdateObjAnim
	ld hl, wMenuObj3
	farcall AddPauseMenuSprite
	call ClearUnusedVirtualOAM

	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .skip_timer
	ld hl, wTimer
	dec [hl]
	ret nz
	ld hl, wTimer + 1
	dec [hl]
	ret nz

.skip_timer
	xor a
	ld [wTimer + 0], a
	ld [wTimer + 1], a
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jr nz, .asm_d463e
	ld a, [wPowerUpLevel]
	and ACTION_HELP_LEVEL_CLEAR
	jp nz, OpenActionHelp
.asm_d463e
	farcall Func_4628
	ret
; 0xd464e

Func_d464e: ; d464e (35:464e)
	ld hl, Pals_d50a4
	call LoadPalsToTempPals1
	ld hl, Pals_d50e4
	call LoadPalsToTempPals2
	ret
; 0xd465b

Func_d465b: ; d465b (35:465b)
	xor a
	ldh [rVBK], a
	ld hl, GolfMenuGfx
	ld bc, v0Tiles0
	call Decompress
	ret
; 0xd4668

Func_d4668: ; d4668 (35:4668)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, BGMap_d6502
	ld bc, v1BGMap0
	call Decompress
	xor a
	ldh [rVBK], a
	ld hl, BGMap_d63fd
	ld bc, v0BGMap0
	call Decompress
	ret
; 0xd4682

AddClearScreenSprite: ; d4682 (35:4682)
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	add $10
	sub b
	ld [wCurSprite], a
	ld a, [hli]
	add $08
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, OAM_d4e26
	call TryAddSprite
	ret
; 0xd46a2

AddClearScreenWarioSprite: ; d46a2 (35:46a2)
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	add $10
	sub b
	ld [wCurSprite], a
	ld a, [hli]
	add $08
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, OAM_d49cc
	call TryAddSprite
	ret
; 0xd46c2

SetTreasureTransitionParam: ; d46c2 (35:46c2)
	ld a, [wLevelEndScreen]
	cp LVLEND_NO_TREASURE
	jr z, .no_treasure
	dec a
	ld b, a
	ld a, [wLevel]
	srl a
	srl a
	srl a
	add a
	add a
	add b
	ld e, a
	ld d, $00
	ld hl, LevelTreasureIDs_WithoutTemple
	add hl, de
	ld a, [hl]
	ld [wTransitionParam], a
	cp LEAD_OVERALLS_T
	jr z, .lead_overalls
	cp SWIMMING_FLIPPERS_T
	jr z, .swimming_flippers
	cp HEAD_SMASH_HELMET_T
	jr z, .head_smash
	cp GRAB_GLOVE_T
	jr z, .grab_glove
	cp GARLIC_T
	jr z, .garlic
	cp SUPER_JUMP_SLAM_OVERALLS_T
	jr z, .super_jump_slam_overalls
	cp HIGH_JUMP_BOOTS_T
	jr z, .high_jump_boots
	cp PRINCE_FROGS_GLOVES_T
	jr z, .prince_frogs_gloves
	cp SUPER_GRAB_GLOVES_T
	jr z, .super_grab_gloves
	ret
.no_treasure
	ld a, TRANSITION_RETURN_TO_MAP
	ld [wTransitionParam], a
	ret

.lead_overalls
	ld a, LEAD_OVERALLS | ACTION_HELP_LEVEL_CLEAR
	jr .set_power_up_level
.swimming_flippers
	ld a, SWIMMING_FLIPPERS | ACTION_HELP_LEVEL_CLEAR
	jr .set_power_up_level
.head_smash
	ld a, HEAD_SMASH_HELMET | ACTION_HELP_LEVEL_CLEAR
	jr .set_power_up_level
.grab_glove
	ld a, GRAB_GLOVE | ACTION_HELP_LEVEL_CLEAR
	jr .set_power_up_level
.garlic
	ld a, GARLIC | ACTION_HELP_LEVEL_CLEAR
	jr .set_power_up_level
.super_jump_slam_overalls
	ld a, SUPER_JUMP_SLAM_OVERALLS | ACTION_HELP_LEVEL_CLEAR
	jr .set_power_up_level
.high_jump_boots
	ld a, HIGH_JUMP_BOOTS | ACTION_HELP_LEVEL_CLEAR
	jr .set_power_up_level
.prince_frogs_gloves
	ld a, PRINCE_FROGS_GLOVES | ACTION_HELP_LEVEL_CLEAR
	jr .set_power_up_level
.super_grab_gloves
	ld a, SUPER_GRAB_GLOVES | ACTION_HELP_LEVEL_CLEAR
.set_power_up_level
	ld [wPowerUpLevel], a
	ret
; 0xd4733

UpdateNumCollectedTreasures: ; d4733 (35:4733)
	ldh a, [rSVBK]
	push af
	ld a, $02
	ldh [rSVBK], a
	xor a
	ld [wNumCollectedTreasures + 1], a
	ld [wNumCollectedTreasures + 0], a
	ld a, NUM_TREASURES
.loop_treasures
	push af
	call IsTreasureCollected
	and a
	jr z, .next_treasure
	ld a, [wNumCollectedTreasures + 1]
	add 1
	daa
	ld [wNumCollectedTreasures + 1], a
	ld a, [wNumCollectedTreasures + 0]
	adc 0
	daa
	ld [wNumCollectedTreasures + 0], a
.next_treasure
	pop af
	dec a
	jr nz, .loop_treasures
	pop af
	ldh [rSVBK], a
	ret
; 0xd4764

VBlank_d4764: ; d4764 (35:4764)
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a

	xor a
	ldh [rVBK], a
	ld hl, v0Tiles2 tile $71 + (TILE_SIZE - 2)
	ld c, [hl]
	ld b, TILE_SIZE - 1
	ld de, v0Tiles2 tile $71 + (TILE_SIZE - 4)
.loop1
	ld a, [de]
	ld [hld], a
	dec l
	dec e
	dec e
	dec b
	jr nz, .loop1
	ld [hl], c

	ld hl, v0Tiles2 tile $71 + (TILE_SIZE - 1)
	ld c, [hl]
	ld b, TILE_SIZE - 1
	ld de, v0Tiles2 tile $71 + (TILE_SIZE - 3)
.loop2
	ld a, [de]
	ld [hld], a
	dec l
	dec e
	dec e
	dec b
	jr nz, .loop2
	ld [hl], c

	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.end
; 0xd47a7

VBlank_d47a7: ; d47a7 (35:47a7)
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, [wcee4]
	bit 7, a
	jr z, .dma_transfer
	and $7f
	jr nz, .asm_d47d9
	ld hl, wce01
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld [de], a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld [de], a
	jr .asm_d47e6
.asm_d47d9
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, wce01
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld [de], a
.asm_d47e6
	ld hl, wcee4
	res 7, [hl]
.dma_transfer
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.end
; 0xd47f1

Func_d47f1: ; d47f1 (35:47f1)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, wMusicalCoinFlags
	lb bc, (NUM_LEVELS / 8), 8
	debgcoord 8, 9
	ld a, -1
	ldh [hffa0], a
.loop_bits
	ldh a, [hffa0]
	inc a
	ldh [hffa0], a
	rrc [hl]
	call c, .ApplyBGPal
	inc e
	ld a, e
	and $1f
	cp 13
	jr nz, .next_bit
	ld a, e
	add BG_MAP_WIDTH - 5
	ld e, a
.next_bit
	dec c
	jr nz, .loop_bits
	inc hl ; next byte in wMusicalCoinFlags
	ld c, 8
	dec b
	jr nz, .loop_bits
	bit 0, [hl]
	call nz, .ApplyBGPal
	xor a
	ldh [rVBK], a
	ret

.ApplyBGPal:
	push bc
	push hl
	ldh a, [hffa0]
	ld c, a
	ld b, $00
	ld hl, MusicalCoinLevelBGPals
	add hl, bc
	ld a, [hl]
	ld [de], a
	pop hl
	pop bc
	ret
; 0xd483a

SetMusicalCoinFlag: ; d483a (35:483a)
	ld a, [wLevel]
	srl a
	srl a
	srl a
	ld c, a
	ld [wAllMusicalCoinsLevel], a ; LEVEL_* constant
	srl a
	srl a
	srl a
	ld e, a ; /8
	ld d, $00
	ld hl, wMusicalCoinFlags
	add hl, de
	ld a, c
	and %111
	ld c, a
	jr z, .got_flag
.rotate_flags_right
	rrc [hl]
	dec c
	jr nz, .rotate_flags_right
.got_flag
	bit 0, [hl]
	jr z, .set_flag
	; already set
	push af
	ld a, $ff
	ld [wAllMusicalCoinsLevel], a
	pop af
	jr .restore_flags
.set_flag
	set 0, [hl]
.restore_flags
	and a
	ret z ; no need to rotate back
.rotate_flags_left
	rlc [hl]
	dec a
	jr nz, .rotate_flags_left
	ret
; 0xd4876

; check if a bit is set in wMusicalCoinFlags
; for the level in wOWLevel
_CheckLevelMusicalCoinFlag:: ; d4876 (35:4876)
	ld hl, wMusicalCoinFlags
	ld a, [wOWLevel]
	dec a
	ld c, a
	srl a
	srl a
	srl a ; /8
	ld e, a
	ld d, $00
	add hl, de
	ld a, c
	and %111
	ld c, a
	jr z, .check_flag
.loop_1
	rrc [hl]
	dec c
	jr nz, .loop_1
.check_flag
	ld c, a
	bit 0, [hl]
	jr nz, .flag_set
	ld b, FALSE
	jr .got_result
.flag_set
	ld b, TRUE
.got_result
	ld a, c
	and a
	ret z
.loop_2
	rlc [hl]
	dec a
	jr nz, .loop_2
	ret
; 0xd48a7

AddPencilSprite: ; d48a7 (35:48a7)
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	add $10
	sub b
	ld [wCurSprite], a
	ld a, [hli]
	add $8
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, OAM_d65e1
	call TryAddSprite
	ret
; 0xd48c7

; returns TRUE in a if done movement
DoPencilMovement: ; d48c7 (35:48c7)
	ld a, [wAllMusicalCoinsLevel]
	cp NUM_LEVELS - 5
	jr nc, .row_4
	cp NUM_LEVELS - 10
	jr nc, .row_3
	cp NUM_LEVELS - 15
	jr nc, .row_2
	cp NUM_LEVELS - 20
	jr nc, .row_1
; row 0
	ld b, a
	ld d, $48
	jr .got_y
.row_1
	sub 5
	ld b, a
	ld d, $50
	jr .got_y
.row_2
	sub 10
	ld b, a
	ld d, $58
	jr .got_y
.row_3
	sub 15
	ld b, a
	ld d, $60
	jr .got_y
.row_4
	sub 20
	ld b, a
	ld d, $68
.got_y
	ld hl, wMenuObj1YCoord
	ld a, [hl] ; y
	cp d
	jr z, .check_column
	; move down
	inc [hl]
	xor a
	ret

.check_column
	dec b
	jr z, .col_1
	dec b
	jr z, .col_2
	dec b
	jr z, .col_3
	dec b
	jr z, .col_4
; col 0
	ld e, $40
	jr .got_x
.col_1
	ld e, $48
	jr .got_x
.col_2
	ld e, $50
	jr .got_x
.col_3
	ld e, $58
	jr .got_x
.col_4
	ld e, $60
.got_x
	ld hl, wMenuObj1XCoord
	ld a, [hl]
	cp e
	jr z, .done_movement
	; move left
	dec [hl]
	xor a
	ret
.done_movement
	ld a, TRUE
	ret
; 0xd492e

DoPencilScribbling: ; d492e (35:492e)
	ld a, [wTimer]
	ld e, a
	ld d, $00
	ld hl, PencilScribbleXOffsets
	add hl, de
	ld a, [wMenuObj1YCoord]
	add [hl]
	ld [wMenuObj1YCoord], a
	ld hl, PencilScribbleYOffsets
	add hl, de
	ld a, [wMenuObj1XCoord]
	add [hl]
	ld [wMenuObj1XCoord], a
	ret
; 0xd494b

MusicalCoinLevelBGPals: ; d494b (35:494b)
	db 4 ; LEVEL_OUT_OF_THE_WOODS
	db 4 ; LEVEL_THE_PEACEFUL_VILLAGE
	db 4 ; LEVEL_THE_VAST_PLAIN
	db 4 ; LEVEL_BANK_OF_THE_WILD_RIVER
	db 4 ; LEVEL_THE_TIDAL_COAST
	db 6 ; LEVEL_SEA_TURTLE_ROCKS
	db 7 ; LEVEL_DESERT_RUINS
	db 6 ; LEVEL_THE_VOLCANOS_BASE
	db 7 ; LEVEL_THE_POOL_OF_RAIN
	db 7 ; LEVEL_A_TOWN_IN_CHAOS
	db 6 ; LEVEL_BENEATH_THE_WAVES
	db 6 ; LEVEL_THE_WEST_CRATER
	db 6 ; LEVEL_THE_GRASSLANDS
	db 7 ; LEVEL_THE_BIG_BRIDGE
	db 7 ; LEVEL_TOWER_OF_REVIVAL
	db 7 ; LEVEL_THE_STEEP_CANYON
	db 7 ; LEVEL_CAVE_OF_FLAMES
	db 7 ; LEVEL_ABOVE_THE_CLOUDS
	db 7 ; LEVEL_THE_STAGNANT_SWAMP
	db 7 ; LEVEL_THE_FRIGID_SEA
	db 7 ; LEVEL_CASTLE_OF_ILLUSIONS
	db 7 ; LEVEL_THE_COLOSSAL_HOLE
	db 7 ; LEVEL_THE_WARPED_VOID
	db 7 ; LEVEL_THE_EAST_CRATER
	db 7 ; LEVEL_FOREST_OF_FEAR
; 0xd4964

PencilScribbleXOffsets: ; d4964 (35:4964)
	db  0
	db  0
	db  0
	db  0
	db  1
	db  1
	db  1
	db  1
	db  0
	db  0
	db  0
	db  0
	db  0
	db  0
	db  0
	db  0
	db  1
	db  1
	db  1
	db  1
	db  0
	db  0
	db  0
	db  0
	db -1
	db -1
	db -1
	db -1
	db -1
	db -1
	db -1
	db -1
	db  0
	db  0
	db  0
	db  0
	db  0
	db  0
	db  0
	db  0
	db  1
	db  1
	db  1
	db  1
	db  1
	db  1
	db  1
	db  1
	db  0
	db  0
	db  0
	db  0
; 0xd4998

PencilScribbleYOffsets: ; d4998 (35:4998)
	db  1
	db  1
	db  1
	db  1
	db -1
	db -1
	db -1
	db -1
	db  1
	db  1
	db  1
	db  1
	db  1
	db  1
	db  1
	db  1
	db -1
	db -1
	db -1
	db -1
	db -1
	db -1
	db -1
	db -1
	db  0
	db  0
	db  0
	db  0
	db  0
	db  0
	db  0
	db  0
	db  1
	db  1
	db  1
	db  1
	db  1
	db  1
	db  1
	db  1
	db  0
	db  0
	db  0
	db  0
	db  0
	db  0
	db  0
	db  0
	db -1
	db -1
	db -1
	db -1
; 0xd49cc

OAM_d49cc:: ; d49cc (35:49cc)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23
	dw .frame_24
	dw .frame_25
	dw .frame_26
	dw .frame_27

.frame_0
	frame_oam -32, -16, $00, 0
	frame_oam -32,  -8, $02, 0
	frame_oam -16, -16, $20, 0
	frame_oam -16,  -8, $22, 0
	frame_oam -32,   8, $00, 0 | OAMF_XFLIP
	frame_oam -32,   0, $02, 0 | OAMF_XFLIP
	frame_oam -16,   8, $20, 0 | OAMF_XFLIP
	frame_oam -16,   0, $22, 0 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -16, -16, $24, 0
	frame_oam -16,  -8, $26, 0
	frame_oam -32, -12, $04, 0
	frame_oam -32,  -4, $06, 0
	frame_oam -32,   4, $04, 0 | OAMF_XFLIP
	frame_oam -16,   8, $24, 0 | OAMF_XFLIP
	frame_oam -16,   0, $26, 0 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -16,   0, $08, 0
	frame_oam -16,   8, $0a, 0
	frame_oam -32, -12, $04, 0
	frame_oam -32,  -4, $06, 0
	frame_oam -32,   4, $04, 0 | OAMF_XFLIP
	frame_oam -16, -16, $20, 0
	frame_oam -16,  -8, $22, 0
	db $80

.frame_3
	frame_oam -32, -12, $54, 0
	frame_oam -32,  -4, $56, 0
	frame_oam -16, -16, $5c, 0
	frame_oam -16,  -8, $5e, 0
	frame_oam -16,   0, $28, 0
	frame_oam -29,   4, $58, 0
	frame_oam -32,  12, $5a, 0
	db $80

.frame_4
	frame_oam -32, -12, $54, 0
	frame_oam -32,  -4, $56, 0
	frame_oam -16, -16, $5c, 0
	frame_oam -16,  -8, $5e, 0
	frame_oam -16,   0, $28, 0
	frame_oam -29,   4, $58, 0
	frame_oam -32,  12, $5a, 0
	frame_oam -40,   8, $4a, 0
	frame_oam -40,  16, $4a, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -29,   4, $58, 0
	frame_oam -32,  12, $5a, 0
	frame_oam -39,   8, $0c, 4
	frame_oam -39,  16, $0c, 4 | OAMF_XFLIP
	frame_oam -32, -12, $54, 0
	frame_oam -32,  -4, $56, 0
	frame_oam -16, -16, $5c, 0
	frame_oam -16,  -8, $5e, 0
	frame_oam -16,   0, $28, 0
	db $80

.frame_6
	frame_oam -32, -12, $54, 0
	frame_oam -32,  -4, $56, 0
	frame_oam -16, -16, $5c, 0
	frame_oam -16,  -8, $5e, 0
	frame_oam -16,   0, $28, 0
	frame_oam -29,   4, $58, 0
	frame_oam -32,  12, $5a, 0
	frame_oam -39,  16, $2c, 4
	frame_oam -39,   8, $2c, 4 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -32,   6, $0e, 0 | OAMF_XFLIP
	frame_oam -32,  -1, $10, 0 | OAMF_XFLIP
	frame_oam -32,  -9, $12, 0 | OAMF_XFLIP
	frame_oam -16,   7, $2e, 0 | OAMF_XFLIP
	frame_oam -16,  -1, $30, 0 | OAMF_XFLIP
	frame_oam -16,  -9, $32, 0 | OAMF_XFLIP
	frame_oam -21, -17, $14, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -16,  -8, $36, 0
	frame_oam -16,   0, $36, 0 | OAMF_XFLIP
	frame_oam -16, -16, $34, 0
	frame_oam -16,   8, $34, 0 | OAMF_XFLIP
	frame_oam -32,   0, $18, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $1a, 0 | OAMF_XFLIP
	frame_oam -32,   7, $0e, 0 | OAMF_XFLIP
	frame_oam -32, -16, $0e, 0
	db $80

.frame_9
	frame_oam -32,  -8, $16, 0
	frame_oam -16,  -8, $36, 0
	frame_oam -32,   0, $16, 0 | OAMF_XFLIP
	frame_oam -16,   0, $36, 0 | OAMF_XFLIP
	frame_oam -16, -16, $34, 0
	frame_oam -16,   8, $34, 0 | OAMF_XFLIP
	frame_oam -32, -16, $00, 0
	frame_oam -32,   8, $00, 0 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -32, -12, $60, 0
	frame_oam -32,  -4, $62, 0
	frame_oam -32,   4, $60, 0 | OAMF_XFLIP
	frame_oam -16, -12, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -16,   4, $64, 0 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -32, -12, $60, 0
	frame_oam -32,  -4, $62, 0
	frame_oam -32,   4, $60, 0 | OAMF_XFLIP
	frame_oam -16, -12, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -16,   4, $68, 0
	db $80

.frame_12
	frame_oam -32, -12, $60, 0
	frame_oam -32,  -4, $62, 0
	frame_oam -32,   4, $60, 0 | OAMF_XFLIP
	frame_oam -16, -12, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -16,   4, $6a, 0
	db $80

.frame_13
	frame_oam -16, -12, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -16,   4, $64, 0 | OAMF_XFLIP
	frame_oam -32, -12, $72, 0
	frame_oam -32,  -4, $74, 0
	frame_oam -32,   4, $72, 0 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16, -12, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -32, -12, $72, 0
	frame_oam -32,  -4, $74, 0
	frame_oam -32,   4, $72, 0 | OAMF_XFLIP
	frame_oam -16,   4, $68, 0
	db $80

.frame_15
	frame_oam -16, -12, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -16,   4, $64, 0 | OAMF_XFLIP
	frame_oam -32, -12, $6c, 0
	frame_oam -32,  -4, $6e, 0
	frame_oam -32,   4, $70, 0
	db $80

.frame_16
	frame_oam -16, -12, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -32, -12, $6c, 0
	frame_oam -32,  -4, $6e, 0
	frame_oam -32,   4, $70, 0
	frame_oam -16,   4, $68, 0
	db $80

.frame_17
	frame_oam -16, -12, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -32, -12, $6c, 0
	frame_oam -32,  -4, $6e, 0
	frame_oam -32,   4, $70, 0
	frame_oam -16,   4, $6a, 0
	db $80

.frame_18
	frame_oam -16, -12, $64, 0
	frame_oam -16,  -4, $66, 0
	frame_oam -16,   4, $64, 0 | OAMF_XFLIP
	frame_oam -32,   4, $6c, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $6e, 0 | OAMF_XFLIP
	frame_oam -32, -12, $70, 0 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -32,   4, $60, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $62, 0 | OAMF_XFLIP
	frame_oam -32, -12, $60, 0
	frame_oam -16,   4, $64, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $66, 0 | OAMF_XFLIP
	frame_oam -16, -12, $68, 0 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -32,   4, $60, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $62, 0 | OAMF_XFLIP
	frame_oam -32, -12, $60, 0
	frame_oam -16,   4, $64, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $66, 0 | OAMF_XFLIP
	frame_oam -16, -12, $6a, 0 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -16,   4, $64, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $66, 0 | OAMF_XFLIP
	frame_oam -32,   4, $72, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $74, 0 | OAMF_XFLIP
	frame_oam -32, -12, $72, 0
	frame_oam -16, -12, $68, 0 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -16,   4, $64, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $66, 0 | OAMF_XFLIP
	frame_oam -16, -12, $64, 0
	frame_oam -32,   4, $6c, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $6e, 0 | OAMF_XFLIP
	frame_oam -32, -12, $70, 0 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -16,   4, $64, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $66, 0 | OAMF_XFLIP
	frame_oam -32,   4, $6c, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $6e, 0 | OAMF_XFLIP
	frame_oam -32, -12, $70, 0 | OAMF_XFLIP
	frame_oam -16, -12, $68, 0 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -16,   4, $64, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $66, 0 | OAMF_XFLIP
	frame_oam -32,   4, $6c, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $6e, 0 | OAMF_XFLIP
	frame_oam -32, -12, $70, 0 | OAMF_XFLIP
	frame_oam -16, -12, $6a, 0 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -16,   4, $64, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $66, 0 | OAMF_XFLIP
	frame_oam -16, -12, $64, 0
	frame_oam -32, -12, $6c, 0
	frame_oam -32,  -4, $6e, 0
	frame_oam -32,   4, $70, 0
	db $80

.frame_26
	frame_oam -32, -12, $54, 0
	frame_oam -32,  -4, $56, 0
	frame_oam -16, -16, $5c, 0
	frame_oam -16,  -8, $5e, 0
	frame_oam -16,   0, $28, 0
	frame_oam -16,   8, $2a, 0
	frame_oam -32,   4, $76, 0
	frame_oam -32,  12, $78, 0
	db $80

.frame_27
	frame_oam -16, -16, $5c, 0
	frame_oam -16,  -8, $5e, 0
	frame_oam -16,   0, $28, 0
	frame_oam -32, -12, $54, 0
	frame_oam -32,   4, $7a, 0
	frame_oam -32,  -4, $56, 0
	frame_oam -16,   8, $7c, 0
	db $80
; 0xd4d18

Frameset_d4d18: ; d4d18 (35:4d18)
	db $00, 30
	db $ff
; 0xd4d1b

Frameset_d4d1b:: ; d4d1b (35:4d1b)
	db $01,  8
	db $02,  8
	db $03,  1
	db $04,  1
	db $05,  1
	db $06,  1
	db $03,  1
	db $04,  1
	db $05,  1
	db $06,  1
	db $03,  1
	db $04,  1
	db $05,  1
	db $06,  1
	db $03,  1
	db $04,  1
	db $05,  1
	db $06,  1
	db $03,  1
	db $04,  1
	db $05,  1
	db $06,  1
	db $03,  1
	db $04,  1
	db $05,  1
	db $06,  1
	db $03,  8
	db $1a,  4
	db $1b,  6
	db $00, 180
	db $ff
; 0xd4d58

Frameset_d4d58: ; d4d58 (35:4d58)
	db $07, 20
	db $08, 10
	db $09, 10
	db $ff
; 0xd4d5f

Frameset_d4d5f:: ; d4d5f (35:4d5f)
	db $0a,  8
	db $0b,  4
	db $0c,  4
	db $0a,  4
	db $0b,  4
	db $0c,  4
	db $0a,  4
	db $0b,  4
	db $0c,  4
	db $0a,  4
	db $0b,  4
	db $0c,  4
	db $0d,  4
	db $0e,  4
	db $0c,  4
	db $0d,  4
	db $0e,  4
	db $0c,  4
	db $0f,  4
	db $10,  4
	db $11,  4
	db $0f,  4
	db $10,  4
	db $11,  4
	db $0a,  4
	db $12,  8
	db $0a,  4
	db $10,  4
	db $11,  4
	db $0f,  4
	db $0d, 30
	db $09, 60
	db $0d, 10
	db $0a,  8
	db $13,  4
	db $14,  4
	db $0a,  4
	db $13,  4
	db $14,  4
	db $0a,  4
	db $13,  4
	db $14,  4
	db $0a,  4
	db $13,  4
	db $14,  4
	db $0d,  4
	db $15,  4
	db $14,  4
	db $0d,  4
	db $15,  4
	db $14,  4
	db $16,  4
	db $17,  4
	db $18,  4
	db $16,  4
	db $17,  4
	db $18,  4
	db $0a,  4
	db $19,  8
	db $0a,  4
	db $17,  4
	db $18,  4
	db $16,  4
	db $0d, 30
	db $0a,  8
	db $0b,  4
	db $ff
; 0xd4de4

Frameset_d4de4:: ; d4de4 (35:4de4)
	db $0a,  8
	db $0b,  4
	db $0c,  4
	db $0a,  4
	db $0b,  4
	db $0c,  4
	db $0a,  4
	db $0b,  4
	db $0c,  4
	db $0a,  4
	db $0b,  4
	db $0c,  4
	db $0d,  4
	db $0e,  4
	db $0c,  4
	db $0d,  4
	db $0e,  4
	db $0c,  4
	db $0f,  4
	db $10,  4
	db $11,  4
	db $0f,  4
	db $10,  4
	db $11,  4
	db $0a,  4
	db $12,  8
	db $0a,  4
	db $10,  4
	db $11,  4
	db $0f,  4
	db $0d, 30
	db $ff
; 0xd4e23

	INCROM $d4e23, $d4e26

OAM_d4e26: ; d4e26 (35:4e26)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23
	dw .frame_24
	dw .frame_25
	dw .frame_26
	dw .frame_27
	dw .frame_28

.frame_0
	frame_oam -16,  -8, $90, 7
	frame_oam -16,   0, $92, 7
	frame_oam -16, -12, $ba, 0
	frame_oam -16,   4, $ba, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $d6, 0
	db $80

.frame_1
	frame_oam -16,  -8, $90, 7
	frame_oam -16,   0, $92, 7
	frame_oam -16, -12, $b6, 0
	frame_oam -16,   4, $b6, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $d8, 0
	db $80

.frame_2
	frame_oam -16,  -8, $94, 7
	frame_oam -16,   0, $96, 7
	frame_oam -16, -12, $ba, 0
	frame_oam -16,   4, $ba, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $d6, 0
	db $80

.frame_3
	frame_oam -16,  -8, $94, 7
	frame_oam -16,   0, $96, 7
	frame_oam -16, -12, $b6, 0
	frame_oam -16,   4, $b6, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $d8, 0
	db $80

.frame_4
	frame_oam -16,  -8, $98, 7
	frame_oam -16,   0, $9a, 7
	frame_oam -16, -12, $ba, 0
	frame_oam -16,   4, $ba, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $d6, 0
	db $80

.frame_5
	frame_oam -16,  -8, $98, 7
	frame_oam -16,   0, $9a, 7
	frame_oam -16, -12, $b6, 0
	frame_oam -16,   4, $b6, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $d8, 0
	db $80

.frame_6
	frame_oam -16,  -8, $9c, 7
	frame_oam -16,   0, $9e, 7
	frame_oam -16, -12, $ba, 0
	frame_oam -16,   4, $ba, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $d6, 0
	db $80

.frame_7
	frame_oam -16,  -8, $9c, 7
	frame_oam -16,   0, $9e, 7
	frame_oam -16, -12, $b6, 0
	frame_oam -16,   4, $b6, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $d8, 0
	db $80

.frame_8
	frame_oam -34, -12, $d0, 3
	frame_oam -34,  -4, $d2, 3
	frame_oam -34,   4, $d4, 3
	frame_oam -18, -14, $f0, 3
	frame_oam -18,  -6, $f2, 3
	frame_oam -18,   2, $f4, 3
	frame_oam -18,  10, $f6, 3
	frame_oam -34,  50, $da, 3
	frame_oam -34,  58, $dc, 3
	frame_oam -34,  66, $de, 3
	frame_oam -18,  46, $f8, 3
	frame_oam -18,  54, $fa, 3
	frame_oam -18,  62, $fc, 3
	frame_oam -18,  70, $fe, 3
	db $80

.frame_9
	frame_oam -16,  -8, $c0, 4
	frame_oam -16,   0, $c2, 4
	db $80

.frame_10
	frame_oam -16,  -8, $c4, 2
	frame_oam -16,   0, $c6, 2
	db $80

.frame_11
	frame_oam -16,  -8, $c8, 6
	frame_oam -16,   0, $ca, 6
	db $80

.frame_12
	frame_oam -16,  -8, $cc, 5
	frame_oam -16,   0, $ce, 5
	db $80

.frame_13
	frame_oam -16,  -8, $e0, 4
	frame_oam -16,   0, $e2, 4
	db $80

.frame_14
	frame_oam -22, -16, $e4, 0
	frame_oam -16,  -8, $e6, 0
	frame_oam -16,   0, $e8, 0
	frame_oam -22,   8, $ea, 0
	db $80

.frame_15
	frame_oam -24, -16, $e4, 0
	frame_oam -18,  -8, $e6, 0
	frame_oam -18,   0, $e8, 0
	frame_oam -24,   8, $ea, 0
	db $80

.frame_16
	frame_oam -25, -16, $e4, 0
	frame_oam -19,  -8, $e6, 0
	frame_oam -19,   0, $e8, 0
	frame_oam -25,   8, $ea, 0
	db $80

.frame_17
	frame_oam -20, -16, $e4, 0
	frame_oam -14,  -8, $e6, 0
	frame_oam -14,   0, $e8, 0
	frame_oam -20,   8, $ea, 0
	db $80

.frame_18
	frame_oam -19, -16, $e4, 0
	frame_oam -13,  -8, $e6, 0
	frame_oam -13,   0, $e8, 0
	frame_oam -19,   8, $ea, 0
	db $80

.frame_19
	frame_oam -16, -16, $e0, 0 | OAMF_BANK1
	frame_oam -16,  -8, $e2, 0 | OAMF_BANK1
	frame_oam -16,   0, $e4, 0 | OAMF_BANK1
	frame_oam -16,   8, $e6, 0 | OAMF_BANK1
	db $80

.frame_20
	frame_oam -18, -16, $e0, 0 | OAMF_BANK1
	frame_oam -18,  -8, $e2, 0 | OAMF_BANK1
	frame_oam -18,   0, $e4, 0 | OAMF_BANK1
	frame_oam -18,   8, $e6, 0 | OAMF_BANK1
	db $80

.frame_21
	frame_oam -19, -16, $e0, 0 | OAMF_BANK1
	frame_oam -19,  -8, $e2, 0 | OAMF_BANK1
	frame_oam -19,   0, $e4, 0 | OAMF_BANK1
	frame_oam -19,   8, $e6, 0 | OAMF_BANK1
	db $80

.frame_22
	frame_oam -14, -16, $e0, 0 | OAMF_BANK1
	frame_oam -14,  -8, $e2, 0 | OAMF_BANK1
	frame_oam -14,   0, $e4, 0 | OAMF_BANK1
	frame_oam -14,   8, $e6, 0 | OAMF_BANK1
	db $80

.frame_23
	frame_oam -13, -16, $e0, 0 | OAMF_BANK1
	frame_oam -13,  -8, $e2, 0 | OAMF_BANK1
	frame_oam -13,   0, $e4, 0 | OAMF_BANK1
	frame_oam -13,   8, $e6, 0 | OAMF_BANK1
	db $80

.frame_24
	frame_oam -16,  -8, $ec, 4
	frame_oam -16,   0, $ee, 4
	db $80

.frame_25
	frame_oam -16,  -8, $ec, 5
	frame_oam -16,   0, $ee, 5
	db $80

.frame_26
	frame_oam -16,  -8, $ec, 6
	frame_oam -16,   0, $ee, 6
	db $80

.frame_27
	frame_oam -16,  -8, $ec, 2
	frame_oam -16,   0, $ee, 2
	db $80

.frame_28
	frame_oam -16,  -8, $e8, 7 | OAMF_BANK1
	frame_oam -16,  -1, $e8, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80
; 0xd5045

	INCROM $d5045, $d5059

Frameset_d5059: ; d5059 (35:5059)
	db $08,  4
	db $ff
; 0xd505c

Frameset_d505c: ; d505c (35:505c)
	db $09,  4
	db $ff
; 0xd505f

Frameset_d505f: ; d505f (35:505f)
	db $0a,  4
	db $ff
; 0xd5062

Frameset_d5062: ; d5062 (35:5062)
	db $0b,  4
	db $ff
; 0xd5065

Frameset_d5065: ; d5065 (35:5065)
	db $0c,  4
	db $ff
; 0xd5068

Frameset_d5068: ; d5068 (35:5068)
	db $0d,  4
	db $ff
; 0xd506b

Frameset_d506b: ; d506b (35:506b)
	db $0e,  4
	db $0f,  4
	db $10,  4
	db $10,  4
	db $0f,  4
	db $0e,  4
	db $11,  4
	db $12,  4
	db $12,  4
	db $11,  4
	db $ff
; 0xd5080

Frameset_d5080: ; d5080 (35:5080)
	db $13,  4
	db $14,  4
	db $15,  4
	db $15,  4
	db $14,  4
	db $13,  4
	db $16,  4
	db $17,  4
	db $17,  4
	db $16,  4
	db $ff
; 0xd5095

Frameset_d5095: ; d5095 (35:5095)
	db $18,  4
	db $ff
; 0xd5098

Frameset_d5098: ; d5098 (35:5098)
	db $19,  4
	db $ff
; 0xd509b

Frameset_d509b: ; d509b (35:509b)
	db $1a,  4
	db $ff
; 0xd509e

Frameset_d509e: ; d509e (35:509e)
	db $1b,  4
	db $ff
; 0xd50a1

Frameset_d50a1: ; d50a1 (35:50a1)
	db $1c,  4
	db $ff
; 0xd50a4

Pals_d50a4: ; d50a4 (35:50a4)
	rgb 31, 31, 31
	rgb 27, 27, 27
	rgb 22, 22, 22
	rgb 17, 17, 17

	rgb 31, 21, 19
	rgb 13, 21, 31
	rgb  0,  0, 23
	rgb  0,  0,  0

	rgb  3, 13,  0
	rgb 21, 31, 14
	rgb  8, 23,  1
	rgb  0,  2,  0

	rgb 31, 21, 19
	rgb 10,  4, 17
	rgb 30,  8,  4
	rgb  0,  0,  0

	rgb 31, 29, 15
	rgb 28, 21,  1
	rgb 10, 10, 10
	rgb  0,  4,  0

	rgb 31, 21, 19
	rgb  0,  0, 29
	rgb  0,  0, 12
	rgb  0,  0,  0

	rgb  6, 30,  0
	rgb  0, 16,  0
	rgb  0, 10,  0
	rgb  0,  4,  0

	rgb  6, 30,  0
	rgb  0, 16,  0
	rgb 30,  0,  0
	rgb  0,  4,  0
; 0xd50e4

Pals_d50e4: ; d50e4 (35:50e4)
	rgb  0, 22, 16
	rgb 27, 12,  0
	rgb 27, 20,  0
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb  6, 23, 27
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 20
	rgb 31, 27,  0
	rgb  9,  5,  0

	rgb  0, 22, 16
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0
; 0xd5124

; TODO in its own section to be added to golf.o?
GolfMenuGfx:: INCBIN "gfx/golf/golf_menu.2bpp.lz"

BGMap_d63fd: ; d63fd (1:63fd)
INCBIN "gfx/bgmaps/map_d63fd.bin"

BGMap_d6502: ; d6502 (1:6502)
INCBIN "gfx/bgmaps/map_d6502.bin"

OAM_d65e1: ; d65e1 (35:65e1)
	dw .frame_0

.frame_0
	frame_oam -16,   0, $b6, 0
	frame_oam -16,   8, $b8, 0
	frame_oam  -8,   0, $ba, 1
	db $80
; 0xd65f0

Frameset_d65f0: ; d65f0 (35:65f0)
	db $00,  4
	db $ff
; 0xd65f3
