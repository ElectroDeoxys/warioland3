StartMenu:
	ld hl, wPlaneWarioEnd - 1
	call UpdateObjAnim
	ld hl, wPlaneWario
	call LoadIntroSprite
	ld hl, wMenuObj3
	call LoadStartMenuSprite

	call HandleStartMenuSelection

	ld hl, wMenuObj1
	call LoadStartMenuSprite

	ld a, [wceef]
	and a
	jr z, .asm_453e

	ld a, [wGlobalCounter]
	and %111
	jr nz, .asm_4538
	ld a, [wMenuObj2Attributes]
	xor %11
	ld [wMenuObj2Attributes], a
.asm_4538
	ld hl, wMenuObj2
	call LoadStartMenuSprite

.asm_453e
	call ClearUnusedVirtualOAM
	ld hl, wStartMenuSelection
	bit STARTMENUF_SELECT_F, [hl]
	jr nz, .select
	ld a, [hl]
	cp STARTMENU_NEW_GAME
	jr z, .tick_action_help_timer
	cp STARTMENU_CONTINUE
	jr z, .tick_action_help_timer
	; start Action Help timer
	ld a, 8
	ld [wTimer + 1], a
	ld a, 68
	ld [wTimer], a
	ret

.tick_action_help_timer
	; decrement timer
	ld hl, wTimer
	ld a, [hl]
	sub 1
	ld [hli], a
	ld b, a
	ld a, [hl]
	sbc 0
	ld [hl], a
	or b
	ret nz ; return if still not 0

; enter Action Help mode
	xor a
	ld [hld], a
	ld [hl], a
	ld a, [wPowerUpLevel]
	or ACTION_HELP_TITLE_SCREEN
	ld [wPowerUpLevel], a
	jp OpenActionHelp

.select
	ld hl, wStartMenuSelection
	ld a, [hl]
	and $f
	cp STARTMENU_NEW_GAME
	jr z, .NewGame
	cp STARTMENU_CONTINUE
	jr z, .ContinueOrTimeAttack
	cp STARTMENU_CLEAR_DATA
	jr z, .ClearData
	cp STARTMENU_CLEAR_DATA_YES
	jp z, ClearSaveData

	ld a, 134
	ld [wMenuObj2YCoord], a
	ld a, 130
	ld [wMenuObj1YCoord], a

	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jr nz, .time_attack_enabled
	ld a, $80
	ld [wcee4], a
	ld bc, Frameset_6ce9
	jr .got_frameset
.time_attack_enabled
	ld bc, Frameset_6d1e
.got_frameset
	ld a, STARTMENU_CONTINUE
	jr .asm_45c5

.ClearData:
	ld a, $81
	ld [wcee4], a
	ld a, SCREEN_HEIGHT_PX
	ld [wMenuObj2YCoord], a
	ld a, 120
	ld [wMenuObj1YCoord], a
	ld bc, Frameset_6cec
	ld a, STARTMENU_CLEAR_DATA_NO

.asm_45c5
	ld [wStartMenuSelection], a
	ld hl, wMenuObj1FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a ; duration
	ld a, b     ;
	ld [hli], a ; frameset ptr
	ld a, c     ;
	ld [hl], a  ;
	call UpdateObjAnim
	ret

.NewGame:
	ld a, ST_LANGUAGE_SELECTION
	ld [wState], a
	xor a
	ld [wSubState], a
	ret

	; unreachable
	; seems like debug code to start
	; game with all power ups
	ld a, SUPER_GRAB_GLOVES
	ld [wPowerUpLevel], a
	ld a, [wceef]
	and $03
	ld [wceef], a

.ContinueOrTimeAttack:
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jr nz, .TimeAttack
	ld a, [wceef]
	and %111100
	jr nz, .asm_45fd
	jr StartOverworldState
.asm_45fd
	ld a, ST_LEVEL
	ld [wState], a
	xor a
	ld [wSubState], a
	ret

.TimeAttack:
	call DisableLCD
	call FillWhiteBGPal
	call FillWhiteOBPal
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret

StartOverworldStateAndNewGameParam:
	ld a, TRANSITION_NEW_GAME
	ld [wTransitionParam], a
	; fallthrough

StartOverworldState::
	ld a, ST_OVERWORLD
	ld [wState], a
	xor a
	ld [wSubState], a
	ret

Func_4628::
	xor a
	ld [wAnimatedTilesFrameDuration], a
	ld [wAnimatedTilesGfx], a
	ld [wAnimatedTilesFrameCount], a
	ld [wAnimatedTilesFrame], a
	xor a
	ld [w3d50d], a
	ld hl, wDayNight
	set 7, [hl]
	jr StartOverworldState
