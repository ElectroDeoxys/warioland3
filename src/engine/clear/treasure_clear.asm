InitClearScreen:
	ld a, TRUE
	ld [wResetDisabled], a

	call DisableLCD
	call ClearBGMap0
	call ClearVirtualOAM

	call SetTreasureTransitionParam

	push_wram BANK(wTreasuresCollected)
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
	pop_wram

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
	call VBlank_ClearScreen

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
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret

UpdateClearScreen:
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
	ld a, TRUE
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
	jr .got_frameset
.asm_d41fa
	ld a, HIGH(Frameset_d4d5f)
	ld [hli], a
	ld a, LOW(Frameset_d4d5f)
	ld [hl], a
.got_frameset
	call UpdateObjAnim
.asm_d4203
	ld hl, wClearScreenWario
	call AddClearScreenWarioSprite

	ld hl, wMenuObj2
	call AddClearScreenSprite
	ld a, [wLevelEndScreen]
	cp LVLEND_NO_TREASURE
	jr z, .draw_music_boxes
	ld hl, wMenuObj1FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj1
	call AddClearScreenSprite

.draw_music_boxes
	ld a, [wNumMusicBoxes]
	and a
	jr z, .no_music_boxes
	dec a
	jr z, .one_music_box
	dec a
	jr z, .two_music_boxes
	dec a
	jr z, .three_music_boxes
	dec a
	jr z, .four_music_boxes
; five music boxes
	ld hl, wMenuObj3
	call AddClearScreenSprite
.four_music_boxes
	ld hl, wMenuObj4
	call AddClearScreenSprite
.three_music_boxes
	ld hl, wMenuObj5
	call AddClearScreenSprite
.two_music_boxes
	ld hl, wMenuObj6
	call AddClearScreenSprite
.one_music_box
	ld hl, wMenuObj7
	call AddClearScreenSprite
.no_music_boxes
	call ClearUnusedVirtualOAM

	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
;	fallthrough

OpenMusicalCoinsScreen:
	ld a, SST_CLEAR_MUSICAL_COINS
	ld [wSubState], a
	ret
