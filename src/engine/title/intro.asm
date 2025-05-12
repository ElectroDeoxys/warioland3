InitIntroSequence:
	call DisableLCD
	call FillBGMap0_With7f
	call ClearVirtualOAM
	call LoadTitleScreenPals
	call LoadTitleScreenTiles
	call LoadTitleScreenTileMap
	call VBlank_Title

	ld a, $04
	ld [wSCY], a
	ldh [rSCY], a
	xor a
	ld [wSCX], a
	ldh [rSCX], a
	ld a, [wceef]
	and a
	jr nz, .no_intro

	ld hl, wPlaneWario
	ld a, 64
	ld [hli], a ; y coord
	ld a, 208
	ld [hli], a ; x coord
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_712c)
	ld [hli], a
	ld a, LOW(Frameset_712c)
	ld [hli], a
	xor a
	ld [hld], a ; state
	ld [wSFXTimer], a
	call UpdateObjAnim

	ld hl, wMenuObj1
	ld a, 128
	ld [hli], a ; y coord
	ld a, 80
	ld [hli], a ; x coord
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_6ce6)
	ld [hli], a
	ld a, LOW(Frameset_6ce6)
	ld [hl], a
	call UpdateObjAnim

	ld hl, wMenuObj4
	ld a, 16
	ld [hli], a ; y coord
	ld a, 0
	ld [hli], a ; x coord
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_71a1)
	ld [hli], a
	ld a, LOW(Frameset_71a1)
	ld [hl], a
	call UpdateObjAnim

	ld hl, wMenuObj5
	ld a, 8
	ld [hli], a ; y coord
	ld a, 32
	ld [hli], a ; x coord
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_71a4)
	ld [hli], a
	ld a, LOW(Frameset_71a4)
	ld [hl], a
	call UpdateObjAnim

	ld hl, wMenuObj4
	call LoadIntroSprite
	ld hl, wMenuObj5
	call LoadIntroSprite

	ld a, STARTMENU_NEW_GAME
	ld [wStartMenuSelection], a
	jp .asm_41a8

.no_intro
	ld hl, wPlaneWario
	ld a, 108
	ld [hli], a ; y coord
	ld a, 128
	ld [hli], a ; x coord
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_7198)
	ld [hli], a
	ld a, LOW(Frameset_7198)
	ld [hli], a
	xor a
	ld [hld], a
	ld [wSFXTimer], a

; set priority flag to hide
; the menu options behind scenery
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	hlbgcoord 4, 12
	ld de, BG_MAP_WIDTH
	ld c, 2
.loop_outer
	push hl
	ld b, 11
.loop_inner_1
	ld a, [hl]
	or %10000000
	ld [hli], a
	dec b
	jr nz, .loop_inner_1
	pop hl
	add hl, de
	push hl
	ld b, 11
.loop_inner_2
	ld a, [hl]
	or %10000000
	ld [hli], a
	dec b
	jr nz, .loop_inner_2
	pop hl
	add hl, de
	add hl, de
	add hl, de
	dec c
	jr nz, .loop_outer

; get darker tone behind menu options
	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, BGMap_6b47
	debgcoord 4, 14
	push de
	ld b, 12
	call CopyHLToDE
	pop de
	ld a, e
	add BG_MAP_WIDTH
	ld e, a
	ld a, d
	adc 0
	ld d, a
	ld b, 12
	call CopyHLToDE

	ld hl, wMenuObj1
	ld a, $82
	ld [hli], a
	ld a, $50
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jr nz, .time_attack_enabled_1
	ld a, HIGH(Frameset_6ce9)
	ld [hli], a
	ld a, LOW(Frameset_6ce9)
	ld [hl], a
	jr .got_menu_frameset
.time_attack_enabled_1
	ld a, HIGH(Frameset_6d1e)
	ld [hli], a
	ld a, LOW(Frameset_6d1e)
	ld [hl], a
.got_menu_frameset
	call UpdateObjAnim

	ld hl, wMenuObj2
	ld a, $86
	ld [hli], a ; y
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jr nz, .time_attack_enabled_2
	ld a, $44 ; x
	jr .apply_x
.time_attack_enabled_2
	ld a, $40 ; x
.apply_x
	ld [hli], a

	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_6d1b)
	ld [hli], a
	ld a, LOW(Frameset_6d1b)
	ld [hl], a
	call UpdateObjAnim

	ld a, STARTMENU_CONTINUE
	ld [wStartMenuSelection], a

.asm_41a8
	ld hl, wMenuObj3
	ld a, 36
	ld [hli], a ; y coord
	ld a, 104
	ld [hli], a ; x coord
	xor a
	ld [hli], a ; frame
	ld [hli], a
	ld [hli], a ; frameset offset
	ld [hli], a ; duration
	ld a, HIGH(Frameset_6d18)
	ld [hli], a
	ld a, LOW(Frameset_6d18)
	ld [hl], a
	call UpdateObjAnim

	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	xor a
	ld [wTimer], a
	ld [wGlobalCounter], a
	ld hl, wSubState
	inc [hl]
	ret

; phase 1 of Intro sequence has Wario's plane
; fly to the centre of the screen from the right
; then exiting after hovering for a while
IntroSequencePhase1:
	ld a, [wceef]
	and a
	jp nz, StartTitleScreen
	call PlayIntroSFXPlane_Close
	call Func_4d45

	ld a, [wPlaneWarioVar]
	dec a
	jr z, .State1 ; 1
	dec a
	jr z, .State2 ; 2
	dec a
	jr z, .State3 ; 3
	dec a
	jr z, .State4 ; 4
	dec a
	jp z, .State5 ; 5

; State0
; start playing Intro music
; when timer reaches 180
; then advance to next state
	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp 180
	jp c, .continue
	ld [hl], 0 ; reset timer
	play_music MUSIC_INTRO
	ld hl, wPlaneWarioVar
	inc [hl]
	jp .continue

.State1:
; move left up to 48 units
; then set timer to 48 and advance state
	ld hl, wPlaneWarioXCoord
	ld a, [hl]
	cp 72
	jr nc, .move_left_quick
	cp 56
	jr nc, .move_left_slow
	cp 48
	jr z, .go_to_state2
	; only move every 4 ticks
	ld a, [wGlobalCounter]
	and %11
	jp nz, .continue
	jr .move_left_slow
.move_left_quick
	dec [hl]
.move_left_slow
	dec [hl]
	jp .continue

.go_to_state2
	ld a, 48
	ld [wTimer], a
	ld hl, wPlaneWarioVar
	inc [hl]
	jp .continue

.State2:
; wait for timer then change frameset and advance state
	ld hl, wTimer
	dec [hl]
	jp nz, .continue
	ld [hl], 3
	ld hl, wPlaneWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a ; duration
	ld a, HIGH(Frameset_71a7)
	ld [hli], a
	ld a, LOW(Frameset_71a7)
	ld [hl], a
	ld hl, wPlaneWarioVar
	inc [hl]
	jr .continue

.State3:
; move 1 unit down every 8 ticks up to 70
; then go to state 4
	ld a, [wGlobalCounter]
	and %111
	jr nz, .continue
	ld hl, wPlaneWarioYCoord
	inc [hl]
	ld a, [hl]
	cp 70
	jr nz, .continue
	ld hl, wPlaneWarioVar
	inc [hl]
	jr .continue

.State4:
; move 1 unit up every 8 ticks up to 64
; then go to state 3
; if timer reaches 0, then advance to state 5
	ld a, [wGlobalCounter]
	and %111
	jr nz, .continue
	ld hl, wPlaneWario
	dec [hl]
	ld a, [hl]
	cp 64
	jr nz, .continue
	ld hl, wTimer
	dec [hl]
	jr z, .go_to_state5
	ld hl, wPlaneWarioVar
	dec [hl]
	jr .continue

.go_to_state5
	ld hl, wPlaneWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a ; duration
	ld a, HIGH(Frameset_712c)
	ld [hli], a
	ld a, LOW(Frameset_712c)
	ld [hl], a
	ld hl, wPlaneWarioVar
	inc [hl]
	jr .continue

.State5:
; move to the right and then
; set to new coordinates when off the screen
	ld hl, wPlaneWarioXCoord
	ld a, [hl]
	cp 192
	jr z, .skip_move_right
	; move 1 unit if x >= 56
	cp 56
	jr nc, .move_right
	; else move every 4 ticks
	ld a, [wGlobalCounter]
	and %11
	jr nz, .continue
.move_right
	inc [hl]
	jr .continue

.skip_move_right
	; set plane coordinate on top of screen
	ld hl, wPlaneWarioYCoord
	ld a, 16
	ld [hli], a
	ld a, 192
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_713d)
	ld [hli], a
	ld a, LOW((Frameset_713d))
	ld [hli], a
	xor a
	ld [hl], a ; state
	ld [wSFXTimer], a
	ld a, 28
	ld [wTimer], a
	ld hl, wSubState
	inc [hl]
	; fallthrough

.continue
	call ScrollIntroBackgroundLayers
	ld hl, wPlaneWarioEnd - 1
	call UpdateObjAnim
	ld hl, wPlaneWario
	call LoadIntroSprite
	ld hl, wMenuObj4
	call LoadIntroSprite
	ld hl, wMenuObj5
	call LoadIntroSprite
	call ClearUnusedVirtualOAM
	jp PanIntroBackgroundLayers

; phase 2 of Intro sequence, where Wario's plane
; comes into the centre while far away from the foreground
IntroSequencePhase2:
	call Func_4d45
	call PlayIntroSFXPlane_Far

	ld a, [wPlaneWarioVar]
	dec a
	jr z, .State1
	dec a
	jr z, .State2

; State0
; wait for timer, then slowly move plane towards centre
; when reaches the centre, advance to next state
	ld hl, wTimer
	ld a, [hl]
	and a
	jr z, .move_to_centre
	dec [hl]
	jp .continue

.move_to_centre
	ld hl, wPlaneWarioXCoord
	ld a, [hl]
	cp 64
	jr z, .go_to_state1
	cp 72
	jr nc, .move_left_slow
	; move every 4 ticks
	ld a, [wGlobalCounter]
	and %11
	jp nz, .continue
	jr .move_left
.move_left_slow
	; move every 2 ticks
	ld a, [wGlobalCounter]
	and %1
	jp nz, .continue
.move_left
	ld hl, wPlaneWarioXCoord
	dec [hl]
	jr .continue

.go_to_state1
	ld a, 48
	ld [wTimer], a
	ld hl, wPlaneWarioVar
	inc [hl]
	jr .continue

.State1:
; wait for timer, then change frameset and advance state
	ld hl, wTimer
	dec [hl]
	jr nz, .continue
	ld hl, wPlaneWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_7144)
	ld [hli], a
	ld a, LOW(Frameset_7144)
	ld [hli], a
	xor a
	ld [wSFXTimer], a
	ld a, 224
	ld [wTimer], a
	ld hl, wPlaneWarioVar
	inc [hl]
	jr .continue

.State2:
; plays plane exploding animation
	ld a, [wPlaneWarioFramesetOffset]
	cp $18
	jr nz, .skip_sfx
	ld a, [wPlaneWarioDuration]
	and a
	play_sfx z, SFX_023
.skip_sfx

	ld hl, wTimer
	dec [hl]
	jr nz, .continue

	play_sfx SFX_PLANE_EXPLOSION
	ld hl, wPlaneWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a ; duration
	ld a, HIGH(Frameset_7165)
	ld [hli], a
	ld a, LOW(Frameset_7165)
	ld [hli], a
	xor a
	ld [hl], a ; state
	ld [wSFXTimer], a
	ld a, 48
	ld [wTimer], a
	ld hl, wSubState
	inc [hl]

.continue
	call ScrollIntroBackgroundLayers
	ld hl, wPlaneWarioEnd - 1
	call UpdateObjAnim
	ld hl, wMenuObj4
	call LoadIntroSprite
	ld hl, wPlaneWario
	call LoadIntroSprite
	ld hl, wMenuObj5
	call LoadIntroSprite
	call ClearUnusedVirtualOAM
	jp PanIntroBackgroundLayers

; phase 3 of the Intro sequence where Wario's plane
; starts wobbling and then explodes, making it nosedive
IntroSequencePhase3:
	call Func_4d45

	ld a, [wPlaneWarioVar]
	dec a
	jr z, .State1
	dec a
	jr z, .State2
	dec a
	jr z, .State3
	dec a
	jp z, .State4

; State0
; waits for the animation of the plane to end
; then advances to the next state
	ld a, [wPlaneWarioAnimationEnded]
	and a
	jp z, .continue
	play_sfx SFX_119
	ld hl, wPlaneWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a ; duration
	ld a, HIGH(Frameset_7172)
	ld [hli], a
	ld a, LOW(Frameset_7172)
	ld [hli], a
	inc [hl] ; next state
	jp .continue

.State1:
; moves plane right every 4 ticks
; moves plane down 1 unit
; once y offset reaches 16, set new frameset and advance state
	ld a, [wGlobalCounter]
	and %11
	jr nz, .skip_x1
	ld hl, wPlaneWarioXCoord
	inc [hl]
.skip_x1
	ld hl, wPlaneWarioYCoord
	inc [hl]
	ld a, [hl]
	cp 16
	jp c, .continue
	ld hl, wPlaneWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_717b)
	ld [hli], a
	ld a, LOW(Frameset_717b)
	ld [hli], a
	inc [hl] ; next state
	jp .continue

.State2:
; moves plane right every 4 ticks
; moves plane down 1 unit
; once y offset reaches 48, set new frameset and advance state
	ld a, [wGlobalCounter]
	and %11
	jr nz, .skip_x2
	ld hl, wPlaneWarioXCoord
	inc [hl]
.skip_x2
	ld hl, wPlaneWarioYCoord
	inc [hl]
	ld a, [hl]
	cp 48
	jr c, .continue
	ld hl, wPlaneWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_7184)
	ld [hli], a
	ld a, LOW(Frameset_7184)
	ld [hli], a
	inc [hl] ; next state
	jr .continue

.State3:
; moves plane right every 4 ticks
; moves plane down 1 unit
; once y offset reaches 112, set new frameset and advance state
	ld a, [wGlobalCounter]
	and %11
	jr nz, .skip_x3
	ld hl, wPlaneWarioXCoord
	inc [hl]
.skip_x3
	ld hl, wPlaneWarioYCoord
	inc [hl]
	ld a, [hl]
	cp 112
	jr c, .continue
	play_sfx SFX_061
	ld hl, wPlaneWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_718d)
	ld [hli], a
	ld a, LOW(Frameset_718d)
	ld [hli], a
	inc [hl] ; next state
	jr .continue

.State4:
	ld a, [wIntroBGXOffsetNear]
	cp 224
	jr z, .skip_x4
	; make plane x offset follow the near layer
	ld hl, wPlaneWarioXCoord
	inc [hl]
	inc [hl]
.skip_x4
	ld a, [wPlaneWarioAnimationEnded]
	and a
	jr z, .finish_scroll

	; animation ended, load new frameset
	; and play the Title Screen music
	ld hl, wPlaneWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_7198)
	ld [hli], a
	ld a, LOW(Frameset_7198)
	ld [hli], a
	xor a
	ld [hld], a ; state
	ld [wTimer], a

	ld hl, Pals_5002
	call LoadPalsToTempPals1
	ld hl, Pals_5042
	call LoadPalsToTempPals2

	play_music MUSIC_TITLE_SCREEN
	ld hl, wSubState
	inc [hl]
	jr .finish_scroll

.continue
	call ScrollIntroBackgroundLayers
	jr .update_anim

.finish_scroll
	call FinishIntroBackgroundScroll

.update_anim
	ld hl, wPlaneWarioEnd - 1
	call UpdateObjAnim
	ld a, [wObjAnimWasReset]
	ld [wPlaneWarioAnimationEnded], a
	ld hl, wMenuObj4
	call LoadIntroSprite
	ld hl, wPlaneWario
	call LoadIntroSprite
	ld hl, wMenuObj5
	call LoadIntroSprite
	call ClearUnusedVirtualOAM
	jp PanIntroBackgroundLayers

EndIntroSequence:
	ld hl, wPlaneWarioEnd - 1
	call UpdateObjAnim
	ld hl, wPlaneWario
	call LoadIntroSprite
	call ClearUnusedVirtualOAM

	ld a, [wceef]
	and a
	jr nz, StartTitleScreen
	ld hl, wTimer
	ld a, [hl]
	cp 120
	jr nc, .fade_in_title
	inc [hl]
	ret

.fade_in_title
	ld a, [wGlobalCounter]
	and %11
	call z, SlowFadeInScreen
	; continue when substate is advanced
	; after the title has faded in completely
	ld a, [wSubState]
	cp SST_START_MENU
	ret nz
;	fallthrough

; loads TitleScreen music
; then starts Action Help timer
StartTitleScreen:
	play_music MUSIC_TITLE_SCREEN
	ld a, HIGH(ACTION_HELP_TIMER)
	ld [wTimer + 1], a
	ld a, LOW(ACTION_HELP_TIMER)
	ld [wTimer], a
	ld hl, wSubState
	ld [hl], SST_START_MENU
	ret
