LoadPauseMenuSprite::
	ld a, [hli]
	add OAM_Y_OFS
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	add OAM_X_OFS
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, OAM_1f156c
	call LoadSprite
	ret

PrintNumberMusicCoins:
	ld a, [wNumMusicalCoins]
	add a ; *2
	add $a0
	ldcoord_a 7, 15, v0BGMap1
	inc a
	ldcoord_a 7, 16, v0BGMap1
	ret

DrawLevelObjectsAfterLevelReturn::
	farcall VBlank_Level
	farcall SetTileQueueProcessingFunctions

	push_wram BANK("Level Objects WRAM")
	farcall DrawObjects_NoPriority
	pop_wram

	call DrawWario

	push_wram BANK("Level Objects WRAM")
	farcall DrawObjects_WithPriority
	pop_wram

	ret

HandlePauseMenuInput:
	ld a, [wPauseMenuSelection]
	bit PAUSEMENUF_SELECT_F, a
	ret nz
	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, .Return

	ld a, [wPauseMenuSelection]
	cp PAUSEMENU_SAVE
	jr z, .asm_1f09f0
	cp PAUSEMENU_ACTION_HELP
	jr z, .asm_1f0a02
	cp PAUSEMENU_TO_MAP
	jr z, .asm_1f0a1d

	; PAUSEMENU_RETURN
	ld a, [wJoypadPressed]
	bit D_RIGHT_F, a
	jr nz, .asm_1f09e7
	bit A_BUTTON_F, a
	ret z
	jp .Return
.asm_1f09e7
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jr nz, .highlight_action_help_button
	jr .highlight_save_button

.asm_1f09f0
	ld a, [wJoypadPressed]
	bit D_LEFT_F, a
	jp nz, .highlight_return_button
	bit D_RIGHT_F, a
	jr nz, .highlight_action_help_button
	bit A_BUTTON_F, a
	ret z
	jp .Save

.asm_1f0a02
	ld a, [wJoypadPressed]
	bit D_LEFT_F, a
	jr nz, .asm_1f0a13
	bit D_RIGHT_F, a
	jr nz, .highlight_to_map_button
	bit A_BUTTON_F, a
	ret z
	jp .ActionHelp
.asm_1f0a13
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jp nz, .highlight_return_button
	jr .highlight_save_button

.asm_1f0a1d
	ld a, [wJoypadPressed]
	bit D_LEFT_F, a
	jr nz, .highlight_action_help_button
	bit A_BUTTON_F, a
	ret z
	jp .ToMap

.highlight_save_button
	ld a, PAUSEMENU_SAVE
	ld [wPauseMenuSelection], a
	ld hl, wMenuObj2
	ld a, $40
	ld [hli], a
	ld a, $40
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1c9c)
	ld [hli], a
	ld a, LOW(Frameset_1f1c9c)
	ld [hl], a
	jr .play_sfx

.highlight_action_help_button
	ld a, PAUSEMENU_ACTION_HELP
	ld [wPauseMenuSelection], a
	ld hl, wMenuObj2
	ld a, $38
	ld [hli], a
	ld a, $60
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, [wTransformation]
	cp TRANSFORMATION_OWL_WARIO
	jr z, .owl_1
	cp TRANSFORMATION_RAIL
	jr z, .rail_1
	cp TRANSFORMATION_VAMPIRE_WARIO
	jr z, .vampire_1
	ld bc, Frameset_1f1c50
	jr .asm_1f0a79
.owl_1
	ld bc, Frameset_1f1cf9
	jr .asm_1f0a79
.rail_1
	ld bc, Frameset_1f1d1b
	jr .asm_1f0a79
.vampire_1
	ld bc, Frameset_1f1d41
.asm_1f0a79
	ld a, b
	ld [hli], a
	ld a, c
	ld [hl], a
	jr .play_sfx

.highlight_to_map_button
	ld a, PAUSEMENU_TO_MAP
	ld [wPauseMenuSelection], a
	ld hl, wMenuObj2
	ld a, $40
	ld [hli], a
	ld a, $80
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1c74)
	ld [hli], a
	ld a, LOW(Frameset_1f1c74)
	ld [hl], a

.play_sfx
	play_sfx SFX_0E2
	ret

.highlight_return_button
	ld a, PAUSEMENU_RETURN
	ld [wPauseMenuSelection], a
	ld hl, wMenuObj2
	ld a, $38
	ld [hli], a
	ld a, $20
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1cb8)
	ld [hli], a
	ld a, LOW(Frameset_1f1cb8)
	ld [hl], a
	jr .play_sfx

.Return:
	ld a, PAUSEMENU_RETURN
	ld [wPauseMenuSelection], a
	ld hl, wMenuObj2
	ld a, $38
	ld [hli], a
	ld a, $20
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1cbb)
	ld [hli], a
	ld a, LOW(Frameset_1f1cbb)
	ld [hl], a

	ld hl, wPauseMenuSelection
	set PAUSEMENUF_SELECT_F, [hl]
	play_sfx SFX_0E7
	ret

.Save:
	ld hl, wMenuObj2FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1c9f)
	ld [hli], a
	ld a, LOW(Frameset_1f1c9f)
	ld [hl], a
	jr .do_selection

.ActionHelp:
	ld hl, wMenuObj2FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wTransformation]
	cp TRANSFORMATION_OWL_WARIO
	jr z, .owl_2
	cp TRANSFORMATION_RAIL
	jr z, .rail_2
	cp TRANSFORMATION_VAMPIRE_WARIO
	jr z, .vampire_2
	ld bc, Frameset_1f1c69
	jr .asm_1f0b18
.owl_2
	ld bc, Frameset_1f1d0a
	jr .asm_1f0b18
.rail_2
	ld bc, Frameset_1f1d20
	jr .asm_1f0b18
.vampire_2
	ld bc, Frameset_1f1d4c
.asm_1f0b18
	ld a, b
	ld [hli], a
	ld a, c
	ld [hl], a
	jr .do_selection

.ToMap:
	ld hl, wMenuObj2FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1c77)
	ld [hli], a
	ld a, LOW(Frameset_1f1c77)
	ld [hl], a
	jr .do_selection ; useless jump

.do_selection
	ld hl, wPauseMenuSelection
	set PAUSEMENUF_SELECT_F, [hl]
	play_sfx SFX_SELECTION
	ret
