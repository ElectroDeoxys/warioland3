MainSequenceTable: ; 4000 (1:4000)
	ld a, [wSequence]
	jumptable

	dw TitleSequence             ; MAIN_SEQTABLE_TITLE
	dw Func_4686                 ; MAIN_SEQTABLE_01
	dw Func_46cc                 ; MAIN_SEQTABLE_02
	dw Func_46dc                 ; MAIN_SEQTABLE_03
	dw Func_46f6                 ; MAIN_SEQTABLE_04
	dw Func_4710                 ; MAIN_SEQTABLE_05
	dw Func_472a                 ; MAIN_SEQTABLE_06
	dw Func_474c                 ; MAIN_SEQTABLE_07
	dw CollectKeySequence        ; MAIN_SEQTABLE_COLLECT_KEY
	dw Func_4776                 ; MAIN_SEQTABLE_09
	dw Func_4790                 ; MAIN_SEQTABLE_0a
	dw Func_47aa                 ; MAIN_SEQTABLE_0b
	dw Func_47fd                 ; MAIN_SEQTABLE_0c
	dw Func_4817                 ; MAIN_SEQTABLE_0d
	dw LanguageSelectionSequence ; MAIN_SEQTABLE_LANGUAGE_SELECTION
	dw Func_4028                 ; MAIN_SEQTABLE_0f
	dw Func_4028                 ; MAIN_SEQTABLE_10
	dw Func_4028                 ; MAIN_SEQTABLE_11
; 0x4028

Func_4028: ; 4028 (1:4028)
	jp Init
; 0x402b

TitleSequence: ; 402b (1:402b)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call .jump
	pop af
	ldh [rSVBK], a
	ret

.jump
	ld a, [wSubSequence]
	jumptable

	dw FastFadeToWhite
	dw InitIntroSequence
	dw SlowFadeFromWhite
	dw IntroSequencePhase1
	dw IntroSequencePhase2
	dw IntroSequencePhase3
	dw EndIntroSequence
	dw StartMenu
	dw SlowFadeBGToWhite
	dw InitTimeAttackDescription
	dw TimeAttackDescription
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
; 0x405f

InitIntroSequence: ; 405f (1:405f)
	call DisableLCD
	call FillBGMap0_With7f
	call ClearWholeVirtualOAM
	call LoadTitleScreenPals
	call LoadTitleScreenTiles
	call LoadTitleScreenTileMap
	call VBlank_49db

	ld a, $04
	ld [wTempSCY], a
	ldh [rSCY], a
	xor a
	ld [wTempSCX], a
	ldh [rSCX], a
	ld a, [wceef]
	and a
	jr nz, .asm_40fc

	ld hl, wWarioPlane
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
	ld [wIntroSeqSFXTimer], a
	call UpdateObjAnim

	ld hl, wIntroObj0
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

	ld hl, wIntroObj3
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

	ld hl, wIntroObj4
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

	ld hl, wIntroObj3
	call Func_4b93
	ld hl, wIntroObj4
	call Func_4b93

	ld a, $00
	ld [wStartMenuSelection], a
	jp .asm_41a8

.asm_40fc
	ld hl, wWarioPlane
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
	ld [wIntroSeqSFXTimer], a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, v1BGMap0 + $184
	ld de, $20
	ld c, 2
.asm_4121
	push hl
	ld b, 11
.asm_4124
	ld a, [hl]
	or %10000000
	ld [hli], a
	dec b
	jr nz, .asm_4124
	pop hl
	add hl, de
	push hl
	ld b, 11
.asm_4130
	ld a, [hl]
	or %10000000
	ld [hli], a
	dec b
	jr nz, .asm_4130
	pop hl
	add hl, de
	add hl, de
	add hl, de
	dec c
	jr nz, .asm_4121

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, Data_6b47
	ld de, v0BGMap0 + $1c4
	push de
	ld b, 12
	call CopyHLToDE
	pop de
	ld a, e
	add $20
	ld e, a
	ld a, d
	adc $00
	ld d, a
	ld b, 12
	call CopyHLToDE

	ld hl, wIntroObj0
	ld a, $82
	ld [hli], a
	ld a, $50
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, [wca3d]
	bit 1, a
	jr nz, .asm_4178
	ld a, HIGH(Frameset_6ce9)
	ld [hli], a
	ld a, LOW(Frameset_6ce9)
	ld [hl], a
	jr .asm_417e
.asm_4178
	ld a, HIGH(Frameset_6d1e)
	ld [hli], a
	ld a, LOW(Frameset_6d1e)
	ld [hl], a
.asm_417e
	call UpdateObjAnim

	ld hl, wIntroObj1
	ld a, $86
	ld [hli], a
	ld a, [wca3d]
	bit 1, a
	jr nz, .asm_4192
	ld a, $44
	jr .asm_4194
.asm_4192
	ld a, $40
.asm_4194
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

	ld a, $01
	ld [wStartMenuSelection], a

.asm_41a8
	ld hl, wIntroObj2
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

	ld a, LCDC_ON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
	ldh [rLCDC], a
	xor a
	ld [wIntroSeqTimer], a
	ld [wGlobalCounter], a
	ld hl, wSubSequence
	inc [hl]
	ret
; 0x41cf

; phase 1 of Intro sequence has Wario's plane
; fly to the center of the screen from the right
; then exiting after hovering for a while
IntroSequencePhase1: ; 41cf (1:41cf)
	ld a, [wceef]
	and a
	jp nz, StartTitleScreen
	call PlayIntroSFXPlane_Close
	call Func_4d45

	ld a, [wWarioPlaneState]
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
	ld hl, wIntroSeqTimer
	inc [hl]
	ld a, [hl]
	cp 180
	jp c, .continue
	ld [hl], 0 ; reset timer
	load_music MUSIC_INTRO
	ld hl, wWarioPlaneState
	inc [hl]
	jp .continue

.State1
; move left up to 48 units
; then set timer to 48 and advance state
	ld hl, wWarioPlaneXCoord
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
	ld [wIntroSeqTimer], a
	ld hl, wWarioPlaneState
	inc [hl]
	jp .continue

.State2
; wait for timer then change frameset and advance state
	ld hl, wIntroSeqTimer
	dec [hl]
	jp nz, .continue
	ld [hl], 3
	ld hl, wWarioPlaneFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a ; duration
	ld a, HIGH(Frameset_71a7)
	ld [hli], a
	ld a, LOW(Frameset_71a7)
	ld [hl], a
	ld hl, wWarioPlaneState
	inc [hl]
	jr .continue

.State3
; move 1 unit down every 8 ticks up to 70
; then go to state 4
	ld a, [wGlobalCounter]
	and %111
	jr nz, .continue
	ld hl, wWarioPlaneYCoord
	inc [hl]
	ld a, [hl]
	cp 70
	jr nz, .continue
	ld hl, wWarioPlaneState
	inc [hl]
	jr .continue

.State4
; move 1 unit up every 8 ticks up to 64
; then go to state 3
; if timer reaches 0, then advance to state 5
	ld a, [wGlobalCounter]
	and %111
	jr nz, .continue
	ld hl, wWarioPlane
	dec [hl]
	ld a, [hl]
	cp 64
	jr nz, .continue
	ld hl, wIntroSeqTimer
	dec [hl]
	jr z, .go_to_state5
	ld hl, wWarioPlaneState
	dec [hl]
	jr .continue

.go_to_state5
	ld hl, wWarioPlaneFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a ; duration
	ld a, HIGH(Frameset_712c)
	ld [hli], a
	ld a, LOW(Frameset_712c)
	ld [hl], a
	ld hl, wWarioPlaneState
	inc [hl]
	jr .continue

.State5
; move to the right and then
; set to new coordinates when off the screen
	ld hl, wWarioPlaneXCoord
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
	ld hl, wWarioPlaneYCoord
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
	ld [wIntroSeqSFXTimer], a
	ld a, 28
	ld [wIntroSeqTimer], a
	ld hl, wSubSequence
	inc [hl]
	; fallthrough

.continue
	call ScrollIntroBackgroundLayers
	ld hl, wWarioPlaneEnd - 1
	call UpdateObjAnim
	ld hl, wWarioPlane
	call Func_4b93
	ld hl, wIntroObj3
	call Func_4b93
	ld hl, wIntroObj4
	call Func_4b93
	call ClearVirtualOAM
	jp DrawIntroBackgroundLayers
; 0x42ed

; phase 2 of Intro sequence, where Wario's plane
; comes into the centre while far away from the foreground
IntroSequencePhase2: ; 42ed (1:42ed)
	call Func_4d45
	call PlayIntroSFXPlane_Far

	ld a, [wWarioPlaneState]
	dec a
	jr z, .State1
	dec a
	jr z, .State2

; State0
; wait for timer, then slowly move plane towards centre
; when reaches the centre, advance to next state
	ld hl, wIntroSeqTimer
	ld a, [hl]
	and a
	jr z, .move_to_centre
	dec [hl]
	jp .continue

.move_to_centre
	ld hl, wWarioPlaneXCoord
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
	ld hl, wWarioPlaneXCoord
	dec [hl]
	jr .continue

.go_to_state1
	ld a, 48
	ld [wIntroSeqTimer], a
	ld hl, wWarioPlaneState
	inc [hl]
	jr .continue

.State1
; wait for timer, then change frameset and advance state
	ld hl, wIntroSeqTimer
	dec [hl]
	jr nz, .continue
	ld hl, wWarioPlaneFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_7144)
	ld [hli], a
	ld a, LOW(Frameset_7144)
	ld [hli], a
	xor a
	ld [wIntroSeqSFXTimer], a
	ld a, 224
	ld [wIntroSeqTimer], a
	ld hl, wWarioPlaneState
	inc [hl]
	jr .continue

.State2
; plays plane exploding animation
	ld a, [wWarioPlaneFramesetOffset]
	cp $18
	jr nz, .skip_sfx
	ld a, [wWarioPlaneDuration]
	and a
	jr nz, .skip_sfx
	load_sfx SFX_023
.skip_sfx

	ld hl, wIntroSeqTimer
	dec [hl]
	jr nz, .continue

	load_sfx SFX_PLANE_EXPLOSION
	ld hl, wWarioPlaneFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a ; duration
	ld a, HIGH(Frameset_7165)
	ld [hli], a
	ld a, LOW(Frameset_7165)
	ld [hli], a
	xor a
	ld [hl], a ; state
	ld [wIntroSeqSFXTimer], a
	ld a, 48
	ld [wIntroSeqTimer], a
	ld hl, wSubSequence
	inc [hl]

.continue
	call ScrollIntroBackgroundLayers
	ld hl, wWarioPlaneEnd - 1
	call UpdateObjAnim
	ld hl, wIntroObj3
	call Func_4b93
	ld hl, wWarioPlane
	call Func_4b93
	ld hl, wIntroObj4
	call Func_4b93
	call ClearVirtualOAM
	jp DrawIntroBackgroundLayers
; 0x43b5

; phase 3 of the Intro sequence where Wario's plane
; starts wobbling and then explodes, making it nosedive
IntroSequencePhase3: ; 43b5 (1:43b5)
	call Func_4d45

	ld a, [wWarioPlaneState]
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
	ld a, [wPlaneAnimationEnded]
	and a
	jp z, .continue
	load_sfx SFX_119
	ld hl, wWarioPlaneFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a ; duration
	ld a, HIGH(Frameset_7172)
	ld [hli], a
	ld a, LOW(Frameset_7172)
	ld [hli], a
	inc [hl] ; next state
	jp .continue

.State1
; moves plane right every 4 ticks
; moves plane down 1 unit
; once y offset reaches 16, set new frameset and advance state
	ld a, [wGlobalCounter]
	and %11
	jr nz, .skip_x1
	ld hl, wWarioPlaneXCoord
	inc [hl]
.skip_x1
	ld hl, wWarioPlaneYCoord
	inc [hl]
	ld a, [hl]
	cp 16
	jp c, .continue
	ld hl, wWarioPlaneFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_717b)
	ld [hli], a
	ld a, LOW(Frameset_717b)
	ld [hli], a
	inc [hl] ; next state
	jp .continue

.State2
; moves plane right every 4 ticks
; moves plane down 1 unit
; once y offset reaches 48, set new frameset and advance state
	ld a, [wGlobalCounter]
	and %11
	jr nz, .skip_x2
	ld hl, wWarioPlaneXCoord
	inc [hl]
.skip_x2
	ld hl, wWarioPlaneYCoord
	inc [hl]
	ld a, [hl]
	cp 48
	jr c, .continue
	ld hl, wWarioPlaneFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_7184)
	ld [hli], a
	ld a, LOW(Frameset_7184)
	ld [hli], a
	inc [hl] ; next state
	jr .continue

.State3
; moves plane right every 4 ticks
; moves plane down 1 unit
; once y offset reaches 112, set new frameset and advance state
	ld a, [wGlobalCounter]
	and %11
	jr nz, .skip_x3
	ld hl, wWarioPlaneXCoord
	inc [hl]
.skip_x3
	ld hl, wWarioPlaneYCoord
	inc [hl]
	ld a, [hl]
	cp 112
	jr c, .continue
	load_sfx SFX_061
	ld hl, wWarioPlaneFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_718d)
	ld [hli], a
	ld a, LOW(Frameset_718d)
	ld [hli], a
	inc [hl] ; next state
	jr .continue

.State4
	ld a, [wIntroBGXOffsetNear]
	cp 224
	jr z, .skip_x4
	; make plane x offset follow the near layer
	ld hl, wWarioPlaneXCoord
	inc [hl]
	inc [hl]
.skip_x4
	ld a, [wPlaneAnimationEnded]
	and a
	jr z, .finish_scroll

	; animation ended, load new frameset
	; and play the Title Screen music
	ld hl, wWarioPlaneFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_7198)
	ld [hli], a
	ld a, LOW(Frameset_7198)
	ld [hli], a
	xor a
	ld [hld], a ; state
	ld [wIntroSeqTimer], a

	ld hl, Pals_5002
	call LoadPalsToTempPals1
	ld hl, Pals_5042
	call LoadPalsToTempPals2

	load_music MUSIC_TITLE_SCREEN
	ld hl, wSubSequence
	inc [hl]
	jr .finish_scroll

.continue
	call ScrollIntroBackgroundLayers
	jr .update_anim

.finish_scroll
	call FinishIntroBackgroundScroll

.update_anim
	ld hl, wWarioPlaneEnd - 1
	call UpdateObjAnim
	ld a, [wObjAnimWasReset]
	ld [wPlaneAnimationEnded], a
	ld hl, wIntroObj3
	call Func_4b93
	ld hl, wWarioPlane
	call Func_4b93
	ld hl, wIntroObj4
	call Func_4b93
	call ClearVirtualOAM
	jp DrawIntroBackgroundLayers
; 0x44c3

EndIntroSequence: ; 44c3 (1:44c3)
	ld hl, wWarioPlaneEnd - 1
	call UpdateObjAnim
	ld hl, wWarioPlane
	call Func_4b93
	call ClearVirtualOAM

	ld a, [wceef]
	and a
	jr nz, StartTitleScreen
	ld hl, wIntroSeqTimer
	ld a, [hl]
	cp 120
	jr nc, .asm_44e2
	inc [hl]
	ret

.asm_44e2
	ld a, [wGlobalCounter]
	and %11
	call z, FadeInTitle
	; continue when subsequence is advanced
	; after the title has faded in completely
	ld a, [wSubSequence]
	cp $07
	ret nz
;	fallthrough

; loads TitleScreen music
; then starts demo timer
StartTitleScreen: ; 44f0 (1:44f0)
	load_music MUSIC_TITLE_SCREEN
	ld a, 8
	ld [wIntroSeqTimer + 1], a
	ld a, 68
	ld [wIntroSeqTimer], a
	ld hl, wSubSequence
	ld [hl], $07
	ret
; 0x4508

StartMenu: ; 4508 (1:4508)
	ld hl, wWarioPlaneEnd - 1
	call UpdateObjAnim
	ld hl, wWarioPlane
	call Func_4b93
	ld hl, wIntroObj2
	call Func_4b73

	call HandleStartMenuSelection

	ld hl, wIntroObj0
	call Func_4b73

	ld a, [wceef]
	and a
	jr z, .asm_453e

	ld a, [wGlobalCounter]
	and %111
	jr nz, .asm_4538
	ld a, [wIntroObj1Attributes]
	xor %11
	ld [wIntroObj1Attributes], a
.asm_4538
	ld hl, wIntroObj1
	call Func_4b73

.asm_453e
	call ClearVirtualOAM
	ld hl, wStartMenuSelection
	bit 7, [hl]
	jr nz, .asm_4578
	ld a, [hl]
	cp $00
	jr z, .demo_timer
	cp $01
	jr z, .demo_timer
	; start demo timer
	ld a, 8
	ld [wIntroSeqTimer + 1], a
	ld a, 68
	ld [wIntroSeqTimer], a
	ret

.demo_timer
	; decrement timer
	ld hl, wIntroSeqTimer
	ld a, [hl]
	sub 1
	ld [hli], a
	ld b, a
	ld a, [hl]
	sbc 0
	ld [hl], a
	or b
	ret nz ; return if still not 0

; enter Demo mode
	xor a
	ld [hld], a
	ld [hl], a
	ld a, [wPowerUpLevel]
	or %1000000
	ld [wPowerUpLevel], a
	jp Func_16d0

.asm_4578
	ld hl, wStartMenuSelection
	ld a, [hl]
	and $f
	cp $00
	jr z, .NewGame
	cp $01
	jr z, .asm_45ed
	cp $02
	jr z, .asm_45b1
	cp $04
	jp z, Func_1698

	ld a, 134
	ld [wIntroObj1YCoord], a
	ld a, 130
	ld [wIntroObj0YCoord], a

	ld a, [wca3d]
	bit 1, a
	jr nz, .asm_45aa
	ld a, $80
	ld [wcee4], a
	ld bc, Frameset_6ce9
	jr .got_frameset
.asm_45aa
	ld bc, Frameset_6d1e
.got_frameset
	ld a, $01
	jr .asm_45c5
.asm_45b1
	ld a, $81
	ld [wcee4], a
	ld a, 144
	ld [wIntroObj1YCoord], a
	ld a, 120
	ld [wIntroObj0YCoord], a
	ld bc, Frameset_6cec
	ld a, $03
.asm_45c5
	ld [wStartMenuSelection], a
	ld hl, wIntroObj0FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a ; duration
	ld a, b     ;
	ld [hli], a ; frameset ptr
	ld a, c     ;
	ld [hl], a  ;
	call UpdateObjAnim
	ret

.NewGame
	ld a, MAIN_SEQTABLE_LANGUAGE_SELECTION
	ld [wSequence], a
	xor a
	ld [wSubSequence], a
	ret

	ld a, POWER_UP_SUPER_GRAB_GLOVES
	ld [wPowerUpLevel], a
	ld a, [wceef]
	and $03
	ld [wceef], a

.asm_45ed
	ld a, [wca3d]
	bit 1, a
	jr nz, .TimeAttack
	ld a, [wceef]
	and $3c
	jr nz, .asm_45fd
	jr Func_461e
.asm_45fd
	ld a, MAIN_SEQTABLE_02
	ld [wSequence], a
	xor a
	ld [wSubSequence], a
	ret

.TimeAttack
	call DisableLCD
	call FillWhiteBGPal
	call FillWhiteOBPal
	ld a, LCDC_ON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
	ldh [rLCDC], a
	ld hl, wSubSequence
	inc [hl]
	ret

Func_4619: ; 4619 (1:4619)
	ld a, $ff
	ld [wcee3], a
	; fallthrough

Func_461e: ; 461e (1:461e)
	ld a, MAIN_SEQTABLE_01
	ld [wSequence], a
	xor a
	ld [wSubSequence], a
	ret
; 0x4628

Func_4628: ; 4628 (1:4628)
	xor a
	ld [wAnimatedTilesFrameDuration], a
	ld [wAnimatedTilesGroup], a
	ld [wAnimatedTilesFrameCount], a
	ld [wAnimatedTilesFrame], a
	xor a
	ld [w3d50d], a
	ld hl, wca3b
	set 7, [hl]
	jr Func_461e
; 0x4640

InitTimeAttackDescription: ; 4640 (1:4640)
	call DisableLCD
	call FillBGMap0_With7f
	call ClearWholeVirtualOAM
	call LoadTimeAttackDescriptionPals
	call Func_1c4a
	call LoadTimeAttackDescriptionTiles
	call LoadTimeAttackText
	call VBlank_354

	xor a
	ld [wTempSCY], a
	ldh [rSCY], a
	ld [wTempSCX], a
	ldh [rSCX], a
	ld a, LCDC_ON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
	ldh [rLCDC], a
	xor a
	ld [wIntroSeqTimer], a
	ld hl, wSubSequence
	inc [hl]
	ret
; 0x4670

TimeAttackDescription: ; 4670 (1:4670)
	call AdjustJapaneseTimeAttackDescriptionWindow
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	call DisableLCD
	call FillWhiteBGPal
	ld a, LCDC_ON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
	ldh [rLCDC], a
	jp Func_461e
; 0x4686

Func_4686: ; 4686 (1:4686)
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	farcall Func_80392
	pop af
	ldh [rSVBK], a

	ld hl, wSequence
	ld a, [hl]
	cp MAIN_SEQTABLE_02
	ret nz
	load_sfx SFX_0E3
	call Func_4ae7
	ld a, [wLevel]
	cp $ff
	jr z, .asm_46bd
	cp THE_TEMPLE
	jr z, .final_battle
	ret

.asm_46bd
	ld a, MAIN_SEQTABLE_0a
	ld [wSequence], a
	ret

.final_battle
	stop_sfx
	ret
; 0x46cc

Func_46cc: ; 46cc (1:46cc)
	farcall Func_8000
	ret
; 0x46dc

Func_46dc: ; 46dc (1:46dc)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	farcall Func_d4000
	pop af
	ldh [rSVBK], a
	ret
; 0x46f6

Func_46f6: ; 46f6 (1:46f6)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	farcall Func_1f0000
	pop af
	ldh [rSVBK], a
	ret
; 0x4710

Func_4710: ; 4710 (1:4710)
	ldh a, [rSVBK]
	push af
	ld a, 1 ; WRAM1
	ldh [rSVBK], a
	farcall Func_1c8000
	pop af
	ldh [rSVBK], a
	ret
; 0x472a

Func_472a: ; 472a (1:472a)
	ld a, [wSubSequence]
	jumptable

	dw Func_4732
	dw Func_473c
; 0x4732

Func_4732: ; 4732 (1:4732)
	ld a, [wGlobalCounter]
	and $03
	ret nz
	call FastFadeToWhite
	ret
; 0x473c

Func_473c: ; 473c (1:473c)
	farcall Func_4628
	ret
; 0x474c

Func_474c: ; 474c (1:474c)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	farcall Func_1f8000
	pop af
	ldh [rSVBK], a
	ret
; 0x4766

; pauses game for 100 ticks
CollectKeySequence: ; 4766 (1:4766)
	ld hl, wIntroSeqTimer
	inc [hl]
	ld a, [hl]
	cp 100
	ret c
	ld [hl], 0
	ld a, MAIN_SEQTABLE_02
	ld [wSequence], a
	ret
; 0x4776

Func_4776: ; 4776 (1:4776)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	farcall Func_160000
	pop af
	ldh [rSVBK], a
	ret
; 0x4790

Func_4790: ; 4790 (1:4790)
	ldh a, [rSVBK]
	push af
	ld a, 1 ; WRAM1
	ldh [rSVBK], a
	farcall Func_1c8570
	pop af
	ldh [rSVBK], a
	ret
; 0x47aa

Func_47aa: ; 47aa (1:47aa)
	ld a, [wSubSequence]
	jumptable

	dw  FastFadeToWhite
	dw  SubSeq_GBIncompatibleScreen
	dw  SlowFadeFromWhite
	dw  Func_47fc
	dw  DebugReset
	dw  DebugReset
	dw  DebugReset
	dw  DebugReset
; 0x47be

SubSeq_GBIncompatibleScreen: ; 47be (1:47be)
	call DisableLCD
	call ClearBGMap0
	call ClearWholeVirtualOAM

	farcall LoadGBIncompatibleScreenGfx
	farcall LoadGBIncompatibleScreenMap
	call VBlank_354

	xor a
	ld [wTempSCX], a
	ldh [rSCX], a
	ld [wTempSCY], a
	ldh [rSCY], a
	ld a, LCDC_ON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
	ldh [rLCDC], a
	ld hl, wSubSequence
	inc [hl]
	ret
; 0x47fc

Func_47fc: ; 47fc (1:47fc)
	ret
; 0x47fd

Func_47fd: ; 47fd (1:47fd)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	farcall Func_db277
	pop af
	ldh [rSVBK], a
	ret
; 0x4817

Func_4817: ; 4817 (1:4817)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	farcall Func_dc000
	pop af
	ldh [rSVBK], a
	ret
; 0x4831

LanguageSelectionSequence: ; 4831 (1:4831)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call .asm_483f
	pop af
	ldh [rSVBK], a
	ret

.asm_483f
	ld a, [wSubSequence]
	jumptable

	dw FastFadeToWhite
	dw InitLanguageSelection
	dw SlowFadeFromWhite
	dw LanguageSelection
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
; 0x4857

InitLanguageSelection: ; 4857 (1:4857)
	call DisableLCD
	call FillBGMap0_With7f
	call ClearWholeVirtualOAM

	farcall LoadFontPals
	farcall LoadFontTiles
	farcall LoadLanguageSelectionText
	call VBlank_4ddf

	xor a
	ld [wTempSCY], a
	ldh [rSCY], a
	ld [wTempSCX], a
	ldh [rSCX], a
	ld a, $01
	ld [wLanguage], a

	ld hl, wIntroObj0YCoord
	ld a, 70
	ld [hli], a
	ld a, 24
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_76b5)
	ld [hli], a
	ld a, LOW(Frameset_76b5)
	ld [hl], a
	call UpdateObjAnim
	ld hl, wIntroObj0
	call Func_4e3e
	call ClearVirtualOAM
	ld a, LCDC_ON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
	ldh [rLCDC], a

	ld hl, wSubSequence
	inc [hl]
	ret
; 0x48c9

LanguageSelection: ; 48c9 (1:48c9)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, Func_4619
	bit D_DOWN_F, a
	jr nz, .d_down
	bit D_UP_F, a
	jr nz, .d_up
	jr .update_anim

.d_down
	ld a, [wLanguage]
	and a
	ret z ; can't go down
	ld a, 86
	ld [wIntroObj0YCoord], a
	xor a
	jr .got_language

.d_up
	ld a, [wLanguage]
	dec a
	ret z ; can't go up
	ld hl, wIntroObj0
	ld a, 70
	ld [wIntroObj0YCoord], a
	ld a, $01

.got_language
	ld [wLanguage], a
	add $80
	ld [wcee4], a
	load_sfx SFX_0E2

.update_anim
	ld hl, wIntroObj0End - 1
	call UpdateObjAnim
	ld hl, wIntroObj0
	call Func_4e3e
	call ClearVirtualOAM
	ret
; 0x4917

LoadTitleScreenPals: ; 4917 (1:4917)
	ld a, [wceef]
	and a
	jr nz, .asm_492a
	ld hl, Pals_4f82
	call LoadPalsToTempPals1
	ld hl, Pals_4fc2
	call LoadPalsToTempPals2
	ret

.asm_492a
	ld hl, Pals_5002
	call LoadPalsToTempPals1
	ld hl, Pals_5042
	call LoadPalsToTempPals2
	ret
; 0x4937

LoadTitleScreenTiles: ; 4937 (1:4937)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, Data_635c
	ld bc, v1Tiles0
	call Decompress

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, Data_5082
	ld bc, v0Tiles0
	call Decompress
	ret
; 0x4951

LoadTitleScreenTileMap: ; 4951 (1:4951)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, Data_6ae7
	ld bc, v1BGMap0
	call Decompress

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, Data_697a
	ld bc, v0BGMap0
	call Decompress
	ret
; 0x496b

LoadTimeAttackDescriptionPals: ; 496b (1:496b)
	ld hl, Pal_71b0
	call LoadPalsToTempPals1
	ret
; 0x4972

LoadTimeAttackDescriptionTiles: ; 4972 (1:4972)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	farcall LoadFontTiles

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, Tiles_b0f80
	ld de, v0Tiles2
	ld bc, $800
	ld a, BANK(Tiles_b0f80)
	ldh [hCallFuncBank], a
	call_hram CopyHLToDE_BC
	ret
; 0x49a1

LoadTimeAttackText: ; 49a1 (1:49a1)
	ld a, [wLanguage]
	and a
	jr nz, .japanese

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, TimeAttack2ENTextMap
	ld bc, v1BGMap0
	call Decompress

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, TimeAttack1ENTextMap
	ld bc, v0BGMap0
	call Decompress
	ret

.japanese
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, TimeAttack2JPTextMap
	ld bc, v1BGMap0
	call Decompress

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, TimeAttack1JPTextMap
	ld bc, v0BGMap0
	call Decompress
	ret
; 0x49db

VBlank_49db: ; 49db (1:49db)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ld a, [wROMBank]
	push af
	ld a, BANK(Data_6b47)
	bankswitch
	ld a, [wcee4]
	bit 7, a
	jr z, .skip
	ld hl, Data_6b47
	xor a ; VRAM0
	ldh [rVBK], a
	ld de, v0BGMap0 + $1c4
	push de
	ld b, $0c
	call CopyHLToDE
	pop de
	ld a, e
	add $20
	ld e, a
	ld a, d
	adc $00
	ld d, a
	ld b, $0c
	call CopyHLToDE
	ld hl, wcee4
	res 7, [hl]
.skip
	pop af
	bankswitch
	ld a, [wTempSCY]
	ldh [rSCY], a
	ld a, [wTempSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.func_end
; 0x4a33

Func_4a33: ; 4a33 (1:4a33)
	ld bc, -$20
	ld de, $20
	ld a, [wNumCoins]
	and $0f ; hundreds
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [wNumCoins + 1]
	swap a
	and $0f ; tens
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [wNumCoins + 1]
	and $0f ; ones
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ret
; 0x4a63

	INCROM $4a63, $4ae7

Func_4ae7: ; 4ae7 (1:4ae7)
	ldh a, [rSVBK]
	push af
	ld a, 2 ; WRAM2
	ldh [rSVBK], a
	ld a, [wOWLevel]
	and a
	jr z, .the_temple
	cp LEVEL_GOLF_BUILDING
	jr z, .golf_building

	dec a
	add a
	add a
	add a ; *8
	ld [wLevel], a
	ld e, a
	ld d, $00
	ld hl, LevelTreasureRequisites
	add hl, de
	ld a, [hli]

	push hl
	call IsTreasureCollected
	pop hl
	ld c, a
	ld a, [hli]
	push hl
	call IsTreasureCollected
	pop hl
	and c
	jr nz, .variant_4

	ld a, [hli]
	push hl
	call IsTreasureCollected
	pop hl
	ld c, a
	ld a, [hli]
	push hl
	call IsTreasureCollected
	pop hl
	and c
	jr nz, .variant_3

	ld a, [hli]
	push hl
	call IsTreasureCollected
	pop hl
	ld c, a
	ld a, [hli]
	push hl
	call IsTreasureCollected
	pop hl
	and c
	jr nz, .variant_2

.day_night
; all levels have 4 states for day and night respectively
; setting bit 2 yields the night time levels
	ld a, [wca3b]
	and %1
	add a
	add a ; << 2
	ld b, a
	ld a, [wLevel]
	or b
	ld [wLevel], a
	pop af
	ldh [rSVBK], a
	ret

.variant_4
	ld a, [wLevel]
	add 3
	ld [wLevel], a
	jr .day_night

.variant_3
	ld a, [wLevel]
	add 2
	ld [wLevel], a
	jr .day_night

.variant_2
	ld a, [wLevel]
	inc a ; add 1
	ld [wLevel], a
	jr .day_night

.the_temple
	ld a, THE_TEMPLE
	jr .got_level
.golf_building
	ld a, GOLF_BUILDING
.got_level
	ld [wLevel], a
	pop af
	ldh [rSVBK], a
	ret
; 0x4b73

Func_4b73: ; 4b73 (1:4b73)
	; y coord
	ld a, [wTempSCY]
	ld b, a
	ld a, [hli]
	add $10
	sub b
	ld [wCurSpriteYOffset], a

	; x coord
	ld a, [hli]
	add $08
	ld [wCurSpriteXOffset], a

	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, Data_6b5f
	call TryAddSprite
	ret
; 0x4b93

Func_4b93: ; 4b93 (1:4b93)
	; y coord
	ld a, [wTempSCY]
	ld b, a
	ld a, [hli]
	add $10
	sub b
	ld [wCurSpriteYOffset], a

	; x coord
	ld a, [hli]
	add $08
	ld [wCurSpriteXOffset], a

	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, Data_6d21
	call TryAddSprite
	ret
; 0x4bb3

HandleStartMenuSelection: ; 4bb3 (1:4bb3)
	ld a, [wStartMenuSelection]
	bit 4, a
	jp nz, .MoveVertical
	bit 5, a
	jp nz, .UpdateAnim
	bit 6, a
	jp nz, .asm_4c96

	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .a_btn
	bit D_DOWN_F, a
	jr nz, .d_down
	bit D_UP_F, a
	jr nz, .d_up
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	ret

.a_btn
	load_sfx SFX_0E3
	ld hl, wStartMenuSelection
	ld a, [hl]
	and $f
	cp $03
	jr z, .asm_4bfa
	cp $04
	jr z, .asm_4c01
	set 6, [hl]
	xor a
	ld [wIntroObj0FramesetOffset], a
	ret

.asm_4bfa
	ld bc, Frameset_6cf2
	ld a, $23
	jr .update_obj
.asm_4c01
	ld bc, Frameset_6d05
	ld a, $24
	jr .update_obj

.d_down
	ld a, [wStartMenuSelection]
	cp $01
	ret nz
	ld a, $12
	ld [wStartMenuSelection], a
	jr .asm_4c20

.d_up
	ld a, [wStartMenuSelection]
	cp $02
	ret nz
	ld a, $11
	ld [wStartMenuSelection], a

.asm_4c20
	load_sfx SFX_0E2
	ret

.d_left
	ld a, [wStartMenuSelection]
	cp $03
	ret nz
	call .asm_4c20
	ld bc, Frameset_6cef
	ld a, $04
	jr .update_obj

.d_right
	ld a, [wStartMenuSelection]
	cp $04
	ret nz
	call .asm_4c20
	ld bc, Frameset_6cec
	ld a, $03

.update_obj
	ld [wStartMenuSelection], a
	ld hl, wIntroObj0FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hl], a
	call UpdateObjAnim
	ret

.MoveVertical
	ld a, [wStartMenuSelection]
	cp $12
	jr z, .move_up

; move down
	ld hl, wIntroObj0YCoord
	inc [hl]
	ld a, [hl]
	cp 130
	ret nz
	ld a, 134
	ld [wIntroObj1YCoord], a
	jr .reset_move_vertical_flag

.move_up
	ld hl, wIntroObj0YCoord
	dec [hl]
	ld a, [hl]
	cp 116
	ret nz
	ld a, 118
	ld [wIntroObj1YCoord], a

.reset_move_vertical_flag
	ld hl, wStartMenuSelection
	res 4, [hl]
	ret

.UpdateAnim
	ld hl, wIntroObj0End - 1
	call UpdateObjAnim
	ld a, [wObjAnimWasReset]
	and a
	ret z

.asm_4c8c
	ld hl, wStartMenuSelection
	set 7, [hl]
	xor a
	ld [wIntroObj0FramesetOffset], a
	ret

.asm_4c96
	ld a, [wGlobalCounter]
	and %1
	ret nz
	ld hl, wIntroObj0FramesetOffset
	ld a, [hl]
	cp $10
	jr z, .asm_4c8c
	inc [hl]
	and $03
	jr z, .asm_4cb2
	dec a
	jr z, .asm_4caf
	dec a
	jr z, .asm_4cb6
.asm_4caf
	xor a
	jr .asm_4cb8
.asm_4cb2
	ld a, $03
	jr .asm_4cb8
.asm_4cb6
	ld a, $01
.asm_4cb8
	dec l
	ld [hl], a
	ret
; 0x4cbb

; decreases wIntroBGXOffsetFar every 4 ticks
; decreases wIntroBGXOffsetCentre by 1
; decreases wIntroBGXOffsetNear by 2
ScrollIntroBackgroundLayers: ; 4cbb (1:4cbb)
	ld a, [wGlobalCounter]
	and %11
	jr nz, .asm_4cc6
	ld hl, wIntroBGXOffsetFar
	dec [hl]
.asm_4cc6
	ld hl, wIntroBGXOffsetCentre
	dec [hl]
	ld hl, wIntroBGXOffsetNear
	dec [hl]
	dec [hl]
	ret
; 0x4cd0

; scrolls the intro background layers
; until they align to the centre
FinishIntroBackgroundScroll: ; 4cd0 (1:4cd0)
; only update far layer evert 4 ticks
	ld a, [wGlobalCounter]
	and %11
	jr nz, .centre_layer
	ld hl, wIntroBGXOffsetFar
	ld a, [hl]
	and %11111
	jr nz, .scroll_far
	ld a, [wTempSCX]
	ld [hl], a
	jr .centre_layer
.scroll_far
	dec [hl]

.centre_layer
	ld hl, wIntroBGXOffsetCentre
	ld a, [hl]
	and %11111
	jr nz, .scroll_centre
	ld a, [wTempSCX]
	ld [hl], a
	jr .far_layer
.scroll_centre
	dec [hl]

.far_layer
	ld hl, wIntroBGXOffsetNear
	ld a, [hl]
	cp 224
	jr z, .asm_4cff
	jr .scroll_near
.asm_4cff
	ld a, 224
	ld [hl], a
	jr .done
.scroll_near
	dec [hl]
	dec [hl]
.done
	ret
; 0x4d07

; pans the background of the intro airplane scene
; each horizontal layer scrolls at different speed
DrawIntroBackgroundLayers: ; 4d07 (1:4d07)
	ld a, [wceef]
	and a
	ret nz
.asm_4d0c
	ldh a, [rLY]
	cp $5b
	jr c, .asm_4d0c
	call WaitVBlank

	ld a, [wIntroBGXOffsetFar]
	ldh [rSCX], a
.asm_4d1a
	ldh a, [rLY]
	cp $63
	jr c, .asm_4d1a
	call WaitVBlank

	ld a, [wIntroBGXOffsetCentre]
	ldh [rSCX], a
.asm_4d28
	ldh a, [rLY]
	cp $73
	jr c, .asm_4d28
	call WaitVBlank

	ld a, [wIntroBGXOffsetNear]
	ldh [rSCX], a
.asm_4d36
	ldh a, [rLY]
	cp $83
	jr c, .asm_4d36
	call WaitVBlank

	ld a, [wTempSCX]
	ldh [rSCX], a
	ret
; 0x4d45

Func_4d45: ; 4d45 (1:4d45)
	ld a, [wGlobalCounter]
	and %1
	jr z, .asm_4d66

	ld hl, wIntroObj4XCoord
	ld a, [hl]
	cp 176
	jr c, .incr_x1
	ld a, [wSubSequence]
	cp $05
	jr nc, .asm_4d66
	cp $04
	jr c, .incr_x1
	ld a, [wWarioPlaneState]
	and a
	jr nz, .asm_4d66
.incr_x1
	inc [hl]

.asm_4d66
	ld hl, wIntroObj3XCoord
	ld a, [hl]
	cp 176
	jr c, .incr_x2
	ld a, [wSubSequence]
	cp $05
	ret nc
	cp $04
	jr c, .incr_x2
	ld a, [wWarioPlaneState]
	and a
	ret nz
.incr_x2
	inc [hl]
	ret
; 0x4d7f

AdjustJapaneseTimeAttackDescriptionWindow: ; 4d7f (1:4d7f)
	ld a, [wLanguage]
	and a
	ret nz ; return if English

.asm_4d84
	ldh a, [rLY]
	cp $2f
	jr c, .asm_4d84
	call WaitVBlank
	ldh a, [rSCY]
	add $07
	ldh [rSCY], a
.asm_4d93
	ldh a, [rLY]
	cp $38
	jr c, .asm_4d93
	call WaitVBlank
	ldh a, [rSCY]
	add $07
	ldh [rSCY], a
.asm_4da2
	ldh a, [rLY]
	cp $41
	jr c, .asm_4da2
	call WaitVBlank
	ldh a, [rSCY]
	add $07
	ldh [rSCY], a
.asm_4db1
	ldh a, [rLY]
	cp $5a
	jr c, .asm_4db1
	call WaitVBlank
	ldh a, [rSCY]
	add $07
	ldh [rSCY], a
.asm_4dc0
	ldh a, [rLY]
	cp $63
	jr c, .asm_4dc0
	call WaitVBlank
	ldh a, [rSCY]
	add $07
	ldh [rSCY], a
.asm_4dcf
	ldh a, [rLY]
	cp $6c
	jr c, .asm_4dcf
	call WaitVBlank
	ldh a, [rSCY]
	add $07
	ldh [rSCY], a
	ret
; 0x4ddf

VBlank_4ddf: ; 4ddf (1:4ddf)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ld a, [wcee4]
	bit 7, a
	jr z, .asm_4e2e
	and $7f
	dec a
	jr z, .asm_4e11
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, $98e5
	ld b, $0d
	ld a, $07
	call WriteAToHL_BTimes
	ld hl, $9925
	ld b, $0d
	ld a, $06
	call WriteAToHL_BTimes
	jr .asm_4e29
.asm_4e11
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, $98e5
	ld b, $0d
	ld a, $06
	call WriteAToHL_BTimes
	ld hl, $9925
	ld b, $0d
	ld a, $07
	call WriteAToHL_BTimes
.asm_4e29
	ld hl, wcee4
	res 7, [hl]
.asm_4e2e
	ld a, [wTempSCY]
	ldh [rSCY], a
	ld a, [wTempSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.func_end
; 0x4e3e

Func_4e3e: ; 4e3e (1:4e3e)
	ld a, [wTempSCY]
	ld b, a
	ld a, [hli]
	add $10
	sub b
	ld [wCurSpriteYOffset], a
	ld a, [hli]
	add $08
	ld [wCurSpriteXOffset], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, $75c3
	call TryAddSprite
	ret
; 0x4e5e

PlayIntroSFXPlane_Close: ; 4e5e (1:4e5e)
	ld a, [wWarioPlaneXCoord]
	cp 160
	jr nc, PlayIntroSFXPlane3
	cp 112
	jr nc, PlayIntroSFXPlane2

; play plane1
	ld a, [wIntroSeqSFXTimer]
	sub 1
	ld [wIntroSeqSFXTimer], a
	jr nc, .no_sfx
	ld a, 12
	ld [wIntroSeqSFXTimer], a
	load_sfx SFX_PLANE1
.no_sfx
	ret

PlayIntroSFXPlane2: ; 4e81 (1:4e81)
	ld a, [wIntroSeqSFXTimer]
	sub 1
	ld [wIntroSeqSFXTimer], a
	jr nc, .no_sfx
	ld a, 12
	ld [wIntroSeqSFXTimer], a
	load_sfx SFX_PLANE2
.no_sfx
	ret

PlayIntroSFXPlane3: ; 4e99 (1:4e99)
	ld a, [wIntroSeqSFXTimer]
	sub 1
	ld [wIntroSeqSFXTimer], a
	jr nc, .no_sfx
	ld a, 12
	ld [wIntroSeqSFXTimer], a
	load_sfx SFX_PLANE3
.no_sfx
	ret
; 0x4eb1

PlayIntroSFXPlane_Far: ; 4eb1 (1:4eb1)
	ld a, [wWarioPlaneXCoord]
	cp 160
	jr nc, PlayIntroSFXPlane3
	jr PlayIntroSFXPlane2
; 0x4eba

; the treasure requistes for each variant of a level
; if both treasures are collected, then that variant is unlocked
LevelTreasureRequisites: ; 4eba (1:4eba)
	; LEVEL_OUT_OF_THE_WOODS
	db TREASURE_GOLD_MAGIC,               TREASURE_NONE ; variant 4
	db TREASURE_MAGIC_SEEDS,              TREASURE_EYE_OF_THE_STORM ; variant 3
	db TREASURE_LEAD_OVERALLS,            TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_THE_PEACEFUL_VILLAGE
	db TREASURE_SUPER_JUMP_SLAM_OVERALLS, TREASURE_NONE ; variant 4
	db TREASURE_FLUTE,                    TREASURE_NONE ; variant 3
	db TREASURE_FLUTE,                    TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_THE_VAST_PLAIN
	db TREASURE_BLUE_CHEMICAL,            TREASURE_RED_CHEMICAL ; variant 4
	db TREASURE_POUCH,                    TREASURE_NONE ; variant 3
	db TREASURE_LEAD_OVERALLS,            TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_BANK_OF_THE_WILD_RIVER
	db TREASURE_AIR_PUMP,                 TREASURE_NONE ; variant 4
	db TREASURE_PRINCE_FROGS_GLOVE,       TREASURE_NONE ; variant 3
	db TREASURE_SUPER_SMASH,              TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_THE_TIDAL_COAST
	db TREASURE_SAPLING_OF_GROWTH,        TREASURE_NONE ; variant 4
	db TREASURE_STATUE,                   TREASURE_NONE ; variant 3
	db TREASURE_GRAB_GLOVE,               TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_SEA_TURTLE_ROCKS
	db TREASURE_NIGHT_VISION_SCOPE,       TREASURE_NONE ; variant 4
	db TREASURE_SUPER_JUMP_SLAM_OVERALLS, TREASURE_NONE ; variant 3
	db TREASURE_SCEPTER,                  TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_DESERT_RUINS
	db TREASURE_SUPER_JUMP_SLAM_OVERALLS, TREASURE_NONE ; variant 4
	db TREASURE_HEAD_SMASH_HELMET,        TREASURE_NONE ; variant 3
	db TREASURE_BLUE_TABLET,              TREASURE_GREEN_TABLET ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_THE_VOLCANOS_BASE
	db TREASURE_FOOT_OF_STONE,            TREASURE_NONE ; variant 4
	db TREASURE_FLUTE,                    TREASURE_NONE ; variant 3
	db TREASURE_TRUCK_WHEEL,              TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_THE_POOL_OF_RAIN
	db TREASURE_AIR_PUMP,                 TREASURE_NONE ; variant 4
	db TREASURE_SWIMMING_FLIPPERS,        TREASURE_NONE ; variant 3
	db TREASURE_POUCH,                    TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_A_TOWN_IN_CHAOS
	db TREASURE_ELECTRIC_FAN_PROPELLER,   TREASURE_NONE ; variant 4
	db TREASURE_SUPER_GRAB_GLOVES,        TREASURE_NONE ; variant 3
	db TREASURE_HEAD_SMASH_HELMET,        TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_BENEATH_THE_WAVES
	db TREASURE_BLUE_CHEMICAL,            TREASURE_RED_CHEMICAL ; variant 4
	db TREASURE_SAPLING_OF_GROWTH,        TREASURE_NONE ; variant 3
	db TREASURE_PRINCE_FROGS_GLOVE,       TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_THE_WEST_CRATER
	db TREASURE_RUST_SPRAY,               TREASURE_NONE ; variant 4
	db TREASURE_FIRE_DRENCHER,            TREASURE_NONE ; variant 3
	db TREASURE_SUPER_JUMP_SLAM_OVERALLS, TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_THE_GRASSLANDS
	db TREASURE_HIGH_JUMP_BOOTS,          TREASURE_NONE ; variant 4
	db TREASURE_FLUTE,                    TREASURE_NONE ; variant 3
	db TREASURE_POUCH,                    TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_THE_BIG_BRIDGE
	db TREASURE_SCEPTER,                  TREASURE_NONE ; variant 4
	db TREASURE_GRAB_GLOVE,               TREASURE_NONE ; variant 3
	db TREASURE_SWIMMING_FLIPPERS,        TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_TOWER_OF_REVIVAL
	db TREASURE_GOLDEN_LEFT_EYE,          TREASURE_GOLDEN_RIGHT_EYE ; variant 4
	db TREASURE_STATUE,                   TREASURE_NONE ; variant 3
	db TREASURE_RIGHT_GLASS_EYE,          TREASURE_LEFT_GLASS_EYE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_THE_STEEP_CANYON
	db TREASURE_RUST_SPRAY,               TREASURE_NONE ; variant 4
	db TREASURE_PRINCE_FROGS_GLOVE,       TREASURE_NONE ; variant 3
	db TREASURE_FOOT_OF_STONE,            TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_CAVE_OF_FLAMES
	db TREASURE_RUST_SPRAY,               TREASURE_NONE ; variant 4
	db TREASURE_EXPLOSIVE_PLUNGER_BOX,    TREASURE_NONE ; variant 3
	db TREASURE_HIGH_JUMP_BOOTS,          TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_ABOVE_THE_CLOUDS
	db TREASURE_FULL_MOON_GONG,           TREASURE_NONE ; variant 4
	db TREASURE_SCISSORS,                 TREASURE_NONE ; variant 3
	db TREASURE_MAGIC_WAND,               TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_THE_STAGNANT_SWAMP
	db TREASURE_EXPLOSIVE_PLUNGER_BOX,    TREASURE_NONE ; variant 4
	db TREASURE_HIGH_JUMP_BOOTS,          TREASURE_NONE ; variant 3
	db TREASURE_FOOT_OF_STONE,            TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_THE_FRIGID_SEA
	db TREASURE_SUN_MEDALLION_TOP,        TREASURE_SUN_MEDALLION_BOTTOM ; variant 4
	db TREASURE_SCEPTER,                  TREASURE_NONE ; variant 3
	db TREASURE_GRAB_GLOVE,               TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_CASTLE_OF_ILLUSIONS
	db TREASURE_CASTLE_BRICK,             TREASURE_NONE ; variant 4
	db TREASURE_SUPER_GRAB_GLOVES,        TREASURE_NONE ; variant 3
	db TREASURE_SUN_MEDALLION_TOP,        TREASURE_SUN_MEDALLION_BOTTOM ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_THE_COLOSSAL_HOLE
	db TREASURE_EXPLOSIVE_PLUNGER_BOX,    TREASURE_NONE ; variant 4
	db TREASURE_SUN_MEDALLION_TOP,        TREASURE_SUN_MEDALLION_BOTTOM ; variant 3
	db TREASURE_SUPER_SMASH,              TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_THE_WARPED_VOID
	db TREASURE_KEY_CARD_RED,             TREASURE_KEY_CARD_BLUE ; variant 4
	db TREASURE_WARP_REMOVAL_APPARATUS,   TREASURE_NONE ; variant 3
	db TREASURE_WARP_REMOVAL_APPARATUS,   TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_THE_EAST_CRATER
	db TREASURE_PICK_AXE,                 TREASURE_NONE ; variant 4
	db TREASURE_JACKHAMMER,               TREASURE_NONE ; variant 3
	db TREASURE_FIRE_DRENCHER,            TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1

	; LEVEL_FOREST_OF_FEAR
	db TREASURE_DEMONS_BLOOD,             TREASURE_NONE ; variant 4
	db TREASURE_MYSTERY_HANDLE,           TREASURE_NONE ; variant 3
	db TREASURE_SUPER_GRAB_GLOVES,        TREASURE_NONE ; variant 2
	db TREASURE_NONE,                     TREASURE_NONE ; variant 1
; 0x4f82

Pals_4f82: ; 4f82 (1:4f82)
	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31

	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31

	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31

	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31

	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31

	rgb 16, 30, 31
	rgb  8, 19, 31
	rgb  5, 14, 23
	rgb  8, 19, 31

	rgb 31, 31, 31
	rgb  8, 19, 31
	rgb  0,  8,  0
	rgb  0,  4,  0

	rgb  0,  4, 0
	rgb 10, 15, 0
	rgb  0,  8, 0
	rgb 14, 23, 0

Pals_4fc2: ; 4fc2 (1:4fc2)
	rgb 21, 30, 31
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb 21, 30, 31
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb 21, 30, 31
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb 21, 30, 31
	rgb 31, 27,  2
	rgb 27,  0,  2
	rgb  7,  0, 13

	rgb 21, 30, 31
	rgb 30, 23, 19
	rgb 31,  4, 11
	rgb  7,  0, 13

	rgb 21, 30, 31
	rgb 31, 31, 31
	rgb 21, 30, 31
	rgb 13, 18, 30

	rgb 21, 30, 31
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  7,  0, 13

	rgb 21, 30, 31
	rgb 31, 31, 31
	rgb 31, 22,  0
	rgb 13,  7, 10

Pals_5002: ; 5002 (1:5002)
	rgb 16, 30, 31
	rgb 31, 31, 31
	rgb 18,  3, 31
	rgb  0,  0,  0

	rgb 31, 25, 2
	rgb 29, 12, 7
	rgb 27,  0, 2
	rgb  0,  0, 0

	rgb 18,  3, 31
	rgb 31, 25,  2
	rgb 27,  0,  2
	rgb  0,  0,  0

	rgb 29, 12,  7
	rgb 31, 25,  2
	rgb 18,  3, 31
	rgb  0,  0,  0

	rgb 31, 31, 19
	rgb 31, 25,  2
	rgb 18,  3, 31
	rgb  0,  0,  0

	rgb 16, 30, 31
	rgb  8, 19, 31
	rgb  5, 14, 23
	rgb  8, 19, 31

	rgb 31, 31, 31
	rgb  8, 19, 31
	rgb  0,  8,  0
	rgb  0,  4,  0

	rgb  0,  4, 0
	rgb 10, 15, 0
	rgb  0,  8, 0
	rgb 14, 23, 0

Pals_5042: ; 5042 (1:5042)
	rgb  0, 20, 15
	rgb  0,  0,  0
	rgb 31, 27,  2
	rgb 30,  0, 14

	rgb 16, 30, 31
	rgb  0,  0,  0
	rgb 10,  0, 18
	rgb  4, 15, 31

	rgb  0, 20, 15
	rgb  0,  0,  0
	rgb 27,  0,  2
	rgb 31, 31, 31

	rgb  0, 20, 15
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb  0,  0,  0

	rgb  0, 20, 15
	rgb 21, 21, 21
	rgb  0,  0,  0
	rgb 31, 31, 31

	rgb  0, 20, 15
	rgb 31, 31, 31
	rgb 21, 30, 31
	rgb 13, 18, 30

	rgb  0,  0,  0
	rgb 21, 30, 31
	rgb 27, 30, 31
	rgb  0,  0,  0

	rgb 21, 30, 31
	rgb 31, 31, 31
	rgb 31, 22,  0
	rgb 13,  7, 10
; 0x5082

Data_5082: ; 5082 (1:5082)
	INCROM $5082, $635c

Data_635c: ; 635c (1:635c)
	INCROM $635c, $697a

Data_697a: ; 697a (1:697a)
	INCROM $697a, $6ae7

Data_6ae7: ; 6ae7 (1:6ae7)
	INCROM $6ae7, $6b47

Data_6b47: ; 6b47 (1:6b47)
	db $7c, $7c, $7c, $7c, $7c, $7c, $7c, $7c, $7c, $7c, $7c, $7c
	db $10, $11, $12, $1f, $10, $11, $12, $1f, $10, $11, $12, $1f
; 0x6b5f

Data_6b5f: ; 6b5f (1:6b5f)
	dw .data_6b71
	dw .data_6b8a
	dw .data_6bbf
	dw .data_6bf4
	dw .data_6c29
	dw .data_6c5e
	dw .data_6c93
	dw .data_6ca4
	dw .data_6ca9

.data_6b71
	db $f0, $ea, $00, $00
	db $f0, $f2, $02, $00
	db $f0, $fa, $04, $00
	db $f0, $02, $06, $00
	db $f0, $0a, $08, $00
	db $f0, $12, $0a, $00
	db $80

.data_6b8a
	db $eb, $e8, $0c, $00
	db $eb, $f0, $0e, $00
	db $eb, $f8, $10, $00
	db $eb, $00, $12, $00
	db $eb, $08, $14, $00
	db $eb, $10, $16, $00
	db $00, $e4, $18, $00
	db $00, $ec, $1a, $00
	db $00, $f4, $1c, $00
	db $00, $fc, $1e, $00
	db $00, $05, $20, $00
	db $00, $0d, $22, $00
	db $00, $15, $24, $00
	db $80

.data_6bbf
	db $00, $06, $3c, $00
	db $00, $10, $48, $00
	db $00, $18, $4a, $00
	db $00, $e0, $42, $01
	db $00, $e8, $44, $01
	db $00, $f0, $46, $01
	db $f0, $e5, $52, $04
	db $f0, $ed, $54, $04
	db $f0, $f5, $56, $04
	db $f0, $fd, $58, $04
	db $f0, $05, $5a, $04
	db $f0, $0d, $5c, $04
	db $f0, $15, $5e, $04
	db $80

.data_6bf4
	db $00, $d6, $3c, $00
	db $00, $10, $48, $01
	db $00, $18, $4a, $01
	db $00, $e0, $42, $00
	db $00, $e8, $44, $00
	db $00, $f0, $46, $00
	db $f0, $e5, $52, $04
	db $f0, $ed, $54, $04
	db $f0, $f5, $56, $04
	db $f0, $fd, $58, $04
	db $f0, $05, $5a, $04
	db $f0, $0d, $5c, $04
	db $f0, $15, $5e, $04
	db $80

.data_6c29
	db $00, $06, $3e, $00
	db $00, $10, $48, $02
	db $00, $18, $4a, $02
	db $00, $e0, $42, $01
	db $00, $e8, $44, $01
	db $00, $f0, $46, $01
	db $f0, $e5, $52, $04
	db $f0, $ed, $54, $04
	db $f0, $f5, $56, $04
	db $f0, $fd, $58, $04
	db $f0, $05, $5a, $04
	db $f0, $0d, $5c, $04
	db $f0, $15, $5e, $04
	db $80

.data_6c5e
	db $00, $d6, $3e, $00
	db $00, $e0, $42, $02
	db $00, $e8, $44, $02
	db $00, $f0, $46, $02
	db $00, $10, $48, $01
	db $00, $18, $4a, $01
	db $f0, $e5, $52, $04
	db $f0, $ed, $54, $04
	db $f0, $f5, $56, $04
	db $f0, $fd, $58, $04
	db $f0, $05, $5a, $04
	db $f0, $0d, $5c, $04
	db $f0, $15, $5e, $04
	db $80

.data_6c93
	db $00, $02, $4e, $02
	db $1c, $c8, $4c, $02
	db $ec, $15, $50, $02
	db $00, $fa, $60, $02
	db $80

.data_6ca4
	db $f0, $e8, $40, $02
	db $80

.data_6ca9
	db $00, $05, $20, $00
	db $00, $0d, $22, $00
	db $00, $15, $24, $00
	db $00, $e4, $18, $00
	db $00, $ec, $1a, $00
	db $00, $f4, $1c, $00
	db $00, $fc, $1e, $00
	db $eb, $e0, $2c, $00
	db $eb, $e8, $2e, $00
	db $eb, $f8, $30, $00
	db $eb, $00, $32, $00
	db $eb, $08, $34, $00
	db $eb, $10, $36, $00
	db $eb, $18, $38, $00
	db $ee, $f0, $0a, $00
	db $80
; 0x6ce6

Frameset_6ce6: ; 6ce6 (1:6ce6)
	db 0, 4
	db $ff

Frameset_6ce9: ; 6ce9 (1:6ce9)
	db 1, 4
	db $ff

Frameset_6cec: ; 6cec (1:6cec)
	db 2, 4
	db $ff

Frameset_6cef: ; 6cef (1:6cef)
	db 3, 4
	db $ff

Frameset_6cf2: ; 6cf2 (1:6cf2)
	db 4, 30
	db 2,  3
	db 4,  3
	db 2,  3
	db 4,  3
	db 2,  3
	db 4,  3
	db 2,  3
	db 4,  3
	db $ff

Frameset_6d05: ; 6d05 (1:6d05)
	db 5, 30
	db 3,  3
	db 5,  3
	db 3,  3
	db 5,  3
	db 3,  3
	db 5,  3
	db 3,  3
	db 5,  3
	db $ff

Frameset_6d18: ; 6d18 (1:6d18)
	db 6, 4
	db $ff

Frameset_6d1b: ; 6d1b (1:6d1b)
	db 7, 4
	db $ff

Frameset_6d1e: ; 6d1e (1:6d1e)
	db 8, 4
	db $ff

Data_6d21: ; 6d21 (1:6d21)
	dw .data_6d73
	dw .data_6da8
	dw .data_6ddd
	dw .data_6e12
	dw .data_6e47
	dw .data_6e7c
	dw .data_6eb1
	dw .data_6ee6
	dw .data_6f1b
	dw .data_6f24
	dw .data_6f2d
	dw .data_6f36
	dw .data_6f3f
	dw .data_6f48
	dw .data_6f59
	dw .data_6f6e
	dw .data_6f83
	dw .data_6f8c
	dw .data_6f9d
	dw .data_6fb2
	dw .data_6fc7
	dw .data_6fdc
	dw .data_6fed
	dw .data_7002
	dw .data_7017
	dw .data_702c
	dw .data_703d
	dw .data_7052
	dw .data_7067
	dw .data_707c
	dw .data_7085
	dw .data_7092
	dw .data_709f
	dw .data_70b0
	dw .data_70c5
	dw .data_70d6
	dw .data_70e7
	dw .data_70fc
	dw .data_710d
	dw .data_7116
	dw .data_7123

.data_6d73
	db $00, $1b, $12, $0e
	db $00, $23, $14, $0e
	db $00, $08, $00, $0b
	db $00, $10, $02, $0b
	db $00, $18, $04, $0b
	db $00, $28, $08, $0b
	db $10, $08, $0a, $0b
	db $10, $10, $0c, $0b
	db $10, $18, $0e, $0b
	db $10, $28, $10, $0b
	db $07, $20, $06, $0b
	db $00, $00, $16, $0e
	db $10, $00, $18, $4e
	db $80

.data_6da8
	db $00, $1b, $12, $0e
	db $00, $23, $14, $0e
	db $00, $08, $00, $0b
	db $00, $10, $02, $0b
	db $00, $18, $04, $0b
	db $00, $28, $08, $0b
	db $10, $08, $0a, $0b
	db $10, $10, $0c, $0b
	db $10, $18, $0e, $0b
	db $10, $28, $10, $0b
	db $07, $20, $06, $0b
	db $10, $00, $16, $4e
	db $00, $00, $18, $0e
	db $80

.data_6ddd
	db $00, $1b, $12, $0e
	db $00, $23, $14, $0e
	db $00, $08, $00, $0b
	db $00, $10, $02, $0b
	db $00, $18, $04, $0b
	db $00, $28, $08, $0b
	db $10, $08, $0a, $0b
	db $10, $10, $0c, $0b
	db $10, $18, $0e, $0b
	db $10, $28, $10, $0b
	db $07, $20, $06, $0b
	db $00, $00, $1a, $0e
	db $10, $00, $1c, $4e
	db $80

.data_6e12
	db $00, $1b, $12, $0e
	db $00, $23, $14, $0e
	db $00, $08, $00, $0b
	db $00, $10, $02, $0b
	db $00, $18, $04, $0b
	db $00, $28, $08, $0b
	db $10, $08, $0a, $0b
	db $10, $10, $0c, $0b
	db $10, $18, $0e, $0b
	db $10, $28, $10, $0b
	db $07, $20, $06, $0b
	db $10, $00, $1a, $4e
	db $00, $00, $1c, $0e
	db $80

.data_6e47
	db $01, $1b, $12, $0e
	db $01, $23, $14, $0e
	db $01, $08, $00, $0b
	db $01, $10, $02, $0b
	db $01, $18, $04, $0b
	db $01, $28, $08, $0b
	db $11, $08, $0a, $0b
	db $11, $10, $0c, $0b
	db $11, $18, $0e, $0b
	db $11, $28, $10, $0b
	db $08, $20, $06, $0b
	db $01, $00, $16, $0e
	db $11, $00, $18, $4e
	db $80

.data_6e7c
	db $01, $1b, $12, $0e
	db $01, $23, $14, $0e
	db $01, $08, $00, $0b
	db $01, $10, $02, $0b
	db $01, $18, $04, $0b
	db $01, $28, $08, $0b
	db $11, $08, $0a, $0b
	db $11, $10, $0c, $0b
	db $11, $18, $0e, $0b
	db $11, $28, $10, $0b
	db $08, $20, $06, $0b
	db $11, $00, $16, $4e
	db $01, $00, $18, $0e
	db $80

.data_6eb1
	db $01, $1b, $12, $0e
	db $01, $23, $14, $0e
	db $01, $08, $00, $0b
	db $01, $10, $02, $0b
	db $01, $18, $04, $0b
	db $01, $28, $08, $0b
	db $11, $08, $0a, $0b
	db $11, $10, $0c, $0b
	db $11, $18, $0e, $0b
	db $11, $28, $10, $0b
	db $08, $20, $06, $0b
	db $01, $00, $1a, $0e
	db $11, $00, $1c, $4e
	db $80

.data_6ee6
	db $01, $1b, $12, $0e
	db $01, $23, $14, $0e
	db $01, $08, $00, $0b
	db $01, $10, $02, $0b
	db $01, $18, $04, $0b
	db $01, $28, $08, $0b
	db $11, $08, $0a, $0b
	db $11, $10, $0c, $0b
	db $11, $18, $0e, $0b
	db $11, $28, $10, $0b
	db $08, $20, $06, $0b
	db $11, $00, $1a, $4e
	db $01, $00, $1c, $0e
	db $80

.data_6f1b
	db $00, $00, $20, $0c
	db $00, $08, $1e, $0c
	db $80

.data_6f24
	db $00, $00, $22, $0c
	db $00, $08, $1e, $0c
	db $80

.data_6f2d
	db $00, $00, $24, $0c
	db $00, $08, $1e, $0c
	db $80

.data_6f36
	db $01, $00, $26, $0c
	db $01, $08, $28, $0c
	db $80

.data_6f3f
	db $02, $00, $2a, $0c
	db $02, $08, $2c, $0c
	db $80

.data_6f48
	db $fc, $08, $38, $0f
	db $fc, $10, $3a, $0f
	db $01, $08, $1e, $0c
	db $01, $00, $22, $0c
	db $80

.data_6f59
	db $fa, $08, $3c, $0f
	db $fa, $10, $3e, $0f
	db $fa, $18, $40, $0f
	db $01, $00, $24, $0c
	db $01, $08, $1e, $0c
	db $80

.data_6f6e
	db $f8, $09, $42, $0f
	db $f8, $17, $44, $0f
	db $05, $15, $46, $0f
	db $00, $00, $2a, $0c
	db $00, $08, $2c, $0c
	db $80

.data_6f83
	db $00, $00, $48, $0c
	db $00, $08, $4a, $0c
	db $80

.data_6f8c
	db $f6, $0a, $30, $0f
	db $fc, $12, $36, $0f
	db $00, $00, $48, $0c
	db $00, $08, $4a, $0c
	db $80

.data_6f9d
	db $f6, $0a, $2e, $0f
	db $f7, $10, $34, $6f
	db $f2, $1a, $36, $4f
	db $00, $00, $48, $0c
	db $00, $08, $4a, $0c
	db $80

.data_6fb2
	db $f6, $0a, $30, $0f
	db $f1, $14, $32, $0f
	db $f3, $1f, $36, $0f
	db $00, $00, $48, $0c
	db $00, $08, $4a, $0c
	db $80

.data_6fc7
	db $f6, $0a, $2e, $0f
	db $f0, $21, $36, $0f
	db $f4, $12, $32, $0f
	db $00, $00, $48, $0c
	db $00, $08, $4a, $0c
	db $80

.data_6fdc
	db $f6, $0a, $30, $0f
	db $fc, $12, $36, $0f
	db $00, $00, $4c, $0c
	db $00, $08, $4e, $0c
	db $80

.data_6fed
	db $f6, $0a, $2e, $0b
	db $f4, $10, $34, $6f
	db $ee, $19, $36, $4f
	db $00, $00, $4c, $0c
	db $00, $08, $4e, $0c
	db $80

.data_7002
	db $f6, $0a, $30, $0f
	db $ee, $13, $32, $0f
	db $eb, $1d, $36, $0f
	db $00, $00, $4c, $0c
	db $00, $08, $4e, $0c
	db $80

.data_7017
	db $f6, $0a, $2e, $0f
	db $e8, $20, $36, $0f
	db $ef, $12, $32, $0f
	db $00, $00, $4c, $0c
	db $00, $08, $4e, $0c
	db $80

.data_702c
	db $f6, $09, $30, $0f
	db $fc, $11, $36, $0f
	db $01, $09, $4c, $2c
	db $01, $01, $4e, $2c
	db $80

.data_703d
	db $f6, $09, $2e, $0f
	db $f4, $0f, $34, $6f
	db $ee, $18, $36, $4f
	db $01, $09, $4c, $2c
	db $01, $01, $4e, $2c
	db $80

.data_7052
	db $f6, $09, $30, $0f
	db $ee, $12, $32, $0f
	db $eb, $1c, $36, $0f
	db $01, $09, $4c, $2c
	db $01, $01, $4e, $2c
	db $80

.data_7067
	db $f6, $09, $2e, $0f
	db $e8, $1f, $36, $0f
	db $ef, $11, $32, $0f
	db $01, $09, $4c, $2c
	db $01, $01, $4e, $2c
	db $80

.data_707c
	db $00, $00, $3c, $0f
	db $00, $08, $3e, $0f
	db $80

.data_7085
	db $f0, $02, $60, $0f
	db $00, $02, $62, $0f
	db $fd, $0a, $64, $0f
	db $80

.data_7092
	db $f0, $02, $66, $0f
	db $00, $02, $68, $0f
	db $fa, $0a, $6a, $0f
	db $80

.data_709f
	db $f8, $0a, $70, $0f
	db $08, $06, $74, $0f
	db $00, $0e, $76, $0f
	db $f8, $fe, $72, $0f
	db $80

.data_70b0
	db $ec, $0b, $70, $6f
	db $f7, $0a, $6e, $6f
	db $f8, $fe, $6c, $0f
	db $01, $0f, $6c, $6f
	db $08, $05, $70, $0f
	db $80

.data_70c5
	db $f8, $06, $6e, $0f
	db $f3, $0e, $70, $0f
	db $08, $06, $74, $0f
	db $ed, $18, $36, $0f
	db $80

.data_70d6
	db $e5, $1e, $36, $4f
	db $e7, $13, $32, $0f
	db $ed, $0b, $6e, $0f
	db $01, $06, $70, $0f
	db $80

.data_70e7
	db $08, $06, $74, $0f
	db $e4, $1c, $32, $2f
	db $e7, $0e, $6c, $4f
	db $e2, $14, $44, $0f
	db $fe, $09, $76, $0f
	db $80

.data_70fc
	db $f8, $09, $70, $6f
	db $f3, $11, $34, $0f
	db $db, $18, $36, $4f
	db $e2, $24, $36, $4f
	db $80

.data_710d
	db $02, $00, $26, $0c
	db $02, $08, $28, $0c
	db $80

.data_7116
	db $00, $00, $56, $0d
	db $00, $08, $58, $0d
	db $00, $10, $5a, $0d
	db $80

.data_7123
	db $00, $00, $5c, $0d
	db $00, $08, $5e, $0d
	db $80
; 0x712c

Frameset_712c: ; 712c (1:712c)
	db 0, 2
	db 1, 2
	db 2, 2
	db 3, 2
	db 4, 2
	db 5, 2
	db 6, 2
	db 7, 2
	db $ff

Frameset_713d: ; 713d (1:713d)
	db  8, 3
	db  9, 3
	db 10, 3
	db $ff

Frameset_7144: ; 7144 (1:7144)
	db  8, 3
	db  9, 3
	db 10, 3
	db  8, 3
	db  9, 3
	db 10, 3
	db  8, 3
	db  9, 3
	db 10, 3
	db  8, 3
	db  9, 3
	db 10, 3
	db 11, 4
	db 12, 7
	db 38, 5
	db 11, 4
	db $ff

Frameset_7165: ; 7165 (1:7165)
	db 13,  6
	db 14,  6
	db 13,  6
	db 14,  6
	db 15,  6
	db 16, 40
	db $ff

Frameset_7172: ; 7172 (1:7172)
	db 17, 2
	db 18, 2
	db 19, 2
	db 20, 2
	db $ff

Frameset_717b: ; 717b (1:717b)
	db 21, 2
	db 22, 2
	db 23, 2
	db 24, 2
	db $ff

Frameset_7184: ; 7184 (1:7184)
	db 25, 2
	db 26, 2
	db 27, 2
	db 28, 2
	db $ff

Frameset_718d: ; 718d (1:718d)
	db 29, 9
	db 30, 9
	db 31, 9
	db 32, 9
	db 33, 9
	db $ff

Frameset_7198: ; 7198 (1:7198)
	db 34, 9
	db 35, 9
	db 36, 9
	db 37, 9
	db $ff

Frameset_71a1: ; 71a1 (1:71a1)
	db 39, 4
	db $ff

Frameset_71a4: ; 71a4 (1:71a4)
	db 40, 4
	db $ff

Frameset_71a7: ; 71a7 (1:71a7)
	db 0, 2
	db 1, 2
	db 2, 2
	db 3, 2
	db $ff
; 0x71b0

Pal_71b0: ; 71b0 (1:71b0)
	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  7,  0

	rgb 31, 25, 9
	rgb 21, 15, 4
	rgb 13,  8, 1
	rgb 0,   0, 0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0
; 0x71f0

TimeAttack1ENTextMap: ; 71f0 (2c:71f0)
INCBIN "gfx/bgmaps/text/time_attack1_en.bin"
; 0x7316

TimeAttack2ENTextMap: ; 7316 (2c:7316)
INCBIN "gfx/bgmaps/text/time_attack2_en.bin"
; 0x73e7

TimeAttack1JPTextMap: ; 73e7 (2c:73e7)
INCBIN "gfx/bgmaps/text/time_attack1_jp.bin"
; 0x74e8

TimeAttack2JPTextMap: ; 74e8 (2c:74e8)
INCBIN "gfx/bgmaps/text/time_attack2_jp.bin"
; 0x73e7

	INCROM $75c3, $76b5

Frameset_76b5: ; 76b5 (01:76b5)
	db $00,  8
	db $05,  8
	db $06,  8
	db $07,  8
	db $08,  8
	db $09,  8
	db $0a,  8
	db $0b,  8
	db $0c,  8
	db $0d,  8
	db $ff
; 0x76ca

	INCROM $76ca, $76d6
