InitActionHelp:
	call DisableLCD
	play_music MUSIC_ACTION_HELP

	xor a
	ld [wActionHelpState], a
	ld [wTimer], a

	ld b, NO_POWER_UP
	ld a, [wPowerUpLevel]
	and ACTION_HELP_TITLE_SCREEN
	jr z, .not_title_screen
	ldh a, [hDemoPowerUp]
	ld b, a
.not_title_screen
	ld a, [wTransformation]
	cp TRANSFORMATION_OWL_WARIO
	jr z, .owl_wario
	cp TRANSFORMATION_RAIL
	jr z, .rail
	cp TRANSFORMATION_VAMPIRE_WARIO
	jr z, .vampire_wario
	ld a, [wPowerUpLevel]
	and POWER_UP_MASK
	jr .got_power_up
.owl_wario
	ld a, POWER_UP_OWL
	jr .got_power_up
.rail
	ld a, POWER_UP_RAIL
	jr .got_power_up
.vampire_wario
	ld a, POWER_UP_VAMPIRE
.got_power_up
	add b
	cp NUM_TOTAL_POWER_UPS
	jr c, .skip_sub
	sub NUM_TOTAL_POWER_UPS
.skip_sub
	ld [wActionHelpPowerUp], a
	ldh a, [hDemoPowerUp]
	inc a
	cp NUM_TOTAL_POWER_UPS
	jr c, .got_next_demo_power_up
	xor a
.got_next_demo_power_up
	ldh [hDemoPowerUp], a

	xor a
	ld [wAnimatedTilesFrameDuration], a
	ld [wAnimatedTilesGfx], a
	ld [wAnimatedTilesFrameCount], a
	ld [wAnimatedTilesFrame], a
	ld [wRoomAnimatedTilesEnabled], a

	call ClearBGMap0
	call ClearVirtualOAM
	farcall LoadActionHelpCommonPals
	farcall LoadActionHelpPowerUpPals
	farcall LoadActionHelpGfx
	farcall LoadActionHelpBGMaps
	call VBlank_1fb6b7

	xor a
	ldh [rSCX], a
	ld [wSCX], a
	ld a, $04
	ldh [rSCY], a
	ld [wSCY], a

	ld hl, wMenuObj1
	ld a, SCREEN_HEIGHT_PX
	ld [hli], a ; y coord
	ld a, [wActionHelpPowerUp]
	swap a
	add $08
	ld [hli], a ; x coord
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b8e)
	ld [hli], a
	ld a, LOW(Frameset_1e6b8e)
	ld [hl], a

	ld hl, wMenuObj2
	ld a, $77
	ld [hli], a ; y coord
	ld a, $3f
	ld [hli], a ; x coord
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b76)
	ld [hli], a
	ld a, LOW(Frameset_1e6b76)
	ld [hl], a

	ld hl, wMenuObj3
	ld a, $7d
	ld [hli], a ; y coord
	ld a, $67
	ld [hli], a ; x coord
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b6d)
	ld [hli], a
	ld a, LOW(Frameset_1e6b6d)
	ld [hl], a

	ld hl, wMenuObj3FramesetPtr + 1
	farcall $79, UpdateObjAnim

	ld hl, wMenuObj3
	farcall LoadActionHelpSprite

	ld a, [wPowerUpLevel]
	and ACTION_HELP_TITLE_SCREEN
	jr z, .finish
	ld a, [wActionHelpPowerUp]
	cp NUM_MAIN_POWER_UPS
	jr nc, .finish
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [wPowerUpLevel]
	and POWER_UP_MASK
	ld e, a
	hlbgcoord 0, 16, v1BGMap1
	sla e
	ld d, $00
	add hl, de
	ld e, TILEMAP_WIDTH
	ld a, $03
	ld [hli], a
	ld [hld], a
	add hl, de
	ld [hli], a
	ld [hl], a

	ld a, [wActionHelpPowerUp]
	ld e, a
	ld a, [wPowerUpLevel]
	and POWER_UP_MASK
	cp e
	jr c, .finish
	ld hl, PowerUpOBPals
	ld d, $00
	add hl, de
	ld b, [hl]
	hlbgcoord 0, 16, v1BGMap1
	sla e
	add hl, de
	ld e, TILEMAP_WIDTH
	ld a, b
	ld [hli], a
	ld [hld], a
	add hl, de
	ld [hli], a
	ld [hl], a

.finish
	xor a
	ldh [rVBK], a
	call ClearUnusedVirtualOAM
	ld a, LCDC_ON | LCDC_BG_9C00 | LCDC_OBJ_16 | LCDC_OBJ_ON | LCDC_BG_ON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret

UpdateActionHelp:
	; lower overall volume
	ld a, AUDIOMOD_VOLUME
	ld b, 0.5q6 ; volume modifier
	ld d, SFX_CHANNELS ; sfx channels
	ld e, MUSIC_CHANNELS >> 4 ; music channels
	call ExecuteAudioMod

	ld a, [wPowerUpLevel]
	and $80
	jr nz, .skip_handle_input
	ld a, [wJoypadPressed]
	and PAD_A | PAD_B | PAD_START
	jp nz, .CloseActionHelp

.skip_handle_input
	ld hl, wActionHelpCounter
	inc [hl]

	ld a, [wActionHelpPowerUp]
	and POWER_UP_MASK
	cp NUM_MAIN_POWER_UPS
	jr c, .main_power_up
	farcall ExecuteSpecialPowerUpActionHelp
	jr .update_input_anim

.main_power_up
	call ProcessDPadRepeat
	ld a, [wPowerUpLevel]
	and ACTION_HELP_TITLE_SCREEN | ACTION_HELP_LEVEL_CLEAR
	jr nz, .asm_1f81d9
	call Func_1fb6f7
.asm_1f81d9
	call ExecuteMainPowerUpActionHelp

	; bottom cursor
	ld hl, wMenuObj1FramesetPtr + 1
	farcall $79, UpdateObjAnim
	ld hl, wMenuObj1
	farcall LoadActionHelpSprite

.update_input_anim
	; d-pad animation
	ld hl, wMenuObj2FramesetPtr + 1
	farcall $79, UpdateObjAnim
	ld hl, wMenuObj2
	farcall LoadActionHelpSprite

	; buttons animation
	ld hl, wMenuObj3FramesetPtr + 1
	farcall $79, UpdateObjAnim
	ld hl, wMenuObj3
	farcall LoadActionHelpSprite

	call ClearUnusedVirtualOAM
	ret

.CloseActionHelp:
	ld a, [wPowerUpLevel]
	and ACTION_HELP_TITLE_SCREEN
	jp nz, InitWithoutDemoPowerUpReset

	; return to Pause Menu
	xor a
	ld [wAnimatedTilesFrameDuration], a
	ld [wAnimatedTilesGfx], a
	ld [wAnimatedTilesFrameCount], a
	ld [wAnimatedTilesFrame], a
	xor a ; unnecessary
	ld [w3d50d], a

	call ResumeNormalVolume
	ld hl, wSubState
	inc [hl]
	ret
