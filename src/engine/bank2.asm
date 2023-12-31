_LevelStateTable:
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw InitLevel
	dw SlowFadeFromWhite
	dw UpdateLevel
	dw DoorTransition
	dw FastFadeToWhite
	dw Func_846e
	dw Func_861c ; SST_LEVEL_07
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset

InitLevel:
	call DisableLCD
	call FillBGMap0_With7f
	call ClearVirtualOAM
	call ClearParticles

	xor a
	ldh [rSCY], a
	ld [wSCY], a
	ldh [rSCX], a
	ld [wSCX], a

	farcall LoadLevelCommonGfxAndTreasures

	call Func_8747
	call UpdateLevelMusic

	ld a, TRUE
	ld [wRoomAnimatedTilesEnabled], a
	xor a
	ld [wceef], a

	ld a, [wSRAMBank]
	push af
	ld a, $00
	sramswitch
	xor a
	ld hl, s0a000
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, s0a800
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	pop af
	sramswitch

	ld hl, wSubState
	inc [hl]
	ld a, [wLevel]
	cp THE_TEMPLE
	jr z, .final_battle
	ld a, LCDCF_ON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ret

.final_battle
	farcall LoadHiddenFigureGfx

	ld a, $88
	ld [wc08d], a
	ldh [rWY], a
	ld a, $07
	ldh [rWX], a
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_WINON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ret

UpdateLevel:
	ld a, TRUE
	ld [wRoomAnimatedPalsEnabled], a

	farcall UpdateParticles

	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_FREE
	jp z, .free_camera
	cp CAM_YSCROLL
	jp z, .yscroll_camera

	ld a, [wFloorTransitionDir]
	and a
	jr nz, .skip_update_wario_state
	ld a, TRUE
	ld [wc0da], a
	farcall UpdateWarioStates

.skip_update_wario_state
	ld a, [wCameraConfigFlags]
	cp HIDDEN_FIGURE_CAMCONFIG
	jr z, .asm_80fc
	ld a, [wCameraSCY + 1]
	ld [wSCY], a
	ld a, [wCameraSCX + 1]
	ld [wSCX], a
	jr .asm_8112
.asm_80fc
	ld hl, wSCYShake
	ld a, [wc089]
	add [hl]
	ld [wSCY], a
	ld a, [wc08b]
	ld [wSCX], a
	ld a, [wc08d]
	add [hl]
	ldh [rWY], a

.asm_8112
	xor a ; FALSE
	ld [wc0da], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall UpdateObjects
	pop af
	ldh [rSVBK], a

	call SetWarioScreenPos
	ld a, [wLevel]
	cp THE_TEMPLE
	jr nz, .asm_814f
	ld a, [wAutoMoveState]
	cp $02
	jr nz, .asm_814f
	farcall SetState_FenceShakeSliding

.asm_814f
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	ld a, TRUE
	ld [wc0da], a
	farcall ProcessInteractions
	xor a ; FALSE
	ld [wc0da], a
	pop af
	ldh [rSVBK], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall DrawObjects_NoPriority
	pop af
	ldh [rSVBK], a

	call DrawWario

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall DrawObjects_WithPriority
	pop af
	ldh [rSVBK], a

	call ClearUnusedVirtualOAM

	ld a, [wFloorTransitionDir]
	and FLOOR_TRANSITION_DOWN | FLOOR_TRANSITION_UP
	jr z, .no_floor_transition
	ld a, [wIsDMATransferPending]
	and a
	jr nz, .no_floor_transition
	xor a
	ld [wc0c2], a
	ld a, [wWarioScreenYPos]
	ld [wca5e], a

	ld a, [wFloorTransitionDir]
	bit FLOOR_TRANSITION_UP_F, a
	jr nz, .transition_up
; transition down
	ld b, 4
	ld a, [wc0c2]
	sub b
	ld [wc0c2], a
	ld a, [wFloorTransitionTimer]
	sub b
	ld [wFloorTransitionTimer], a
	jr nz, .asm_8209
	ld hl, wFloorTransitionDir
	res FLOOR_TRANSITION_DOWN_F, [hl]
	xor a ; FALSE
	ld [wIsFloorTransition], a
	jr .asm_8209
.transition_up
	ld b, 4
	ld a, [wc0c2]
	add b
	ld [wc0c2], a
	ld a, [wFloorTransitionTimer]
	sub b
	ld [wFloorTransitionTimer], a
	jr z, .end_up_transition
	ld a, [wc0bd]
	dec a
	jr nz, .asm_8209
	xor a
	ld [wFloorTransitionTimer], a
.end_up_transition
	ld hl, wFloorTransitionDir
	res FLOOR_TRANSITION_UP_F, [hl]
	xor a ; FALSE
	ld [wIsFloorTransition], a

.asm_8209
	xor a
	ld [wc0be], a
	ld [wc0bd], a
	call Func_b915
	jr .asm_8229

.no_floor_transition
	ld a, [wCameraConfigFlags]
	cp HIDDEN_FIGURE_CAMCONFIG
	jr z, .asm_8227
	and CAM_SCROLLING_MASK
	cp CAM_XSCROLL2 | CAM_TRANSITIONS
	jr z, .asm_8229
	call Func_b9a6
	jr .asm_8229
.asm_8227
	jr .check_end_screen

.asm_8229
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	call Func_8ed9
	call Func_bb85
	di
	call Func_b681
	ei
	pop af
	sramswitch

.check_end_screen
	ld a, [wState]
	cp ST_LEVEL
	ret nz
	ld hl, wLevelEndScreen
	ld a, [hl]
	and a
	jr z, .no_end_screen
	bit 7, a
	ret nz

	ld a, TRUE
	ld [wResetDisabled], a

	xor a
	ld [wGroundShakeCounter], a
	ld [wSCYShake], a
	ld [wAnimatedTilesFrameDuration], a
	ld [wRoomPalCycleDuration], a
	ld [wRoomAnimatedTilesEnabled], a
	ld [wRoomAnimatedPalsEnabled], a
	ld [wWaterCurrent], a
	ld [wLastWaterCurrent], a
	ld [wCurWaterCurrent], a
	ld [wSwimmingDirectionInput], a

	ld hl, wGameModeFlags
	ld a, [wLevelEndScreen]
	cp LVLEND_GAME_OVER
	jr z, .game_over
	cp LVLEND_EPILOGUE
	jr z, .epilogue

	ld hl, wState
	inc [hl] ; ST_CLEAR
	xor a
	ld [wSubState], a
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	ret z
	ld a, SST_CLEAR_TIME_ATTACK
	ld [wSubState], a
	ret

.game_over
	ld a, TRANSITION_GAME_OVER
	ld [wTransitionParam], a
	jr .set_fought_a_hidden_figure

.epilogue
	ld a, [wNumCollectedTreasures]
	dec a
	jr z, .got_all_treasures
	ld a, TRANSITION_EPILOGUE_NOT_PERFECT
	ld [wTransitionParam], a
	jr .set_game_cleared
.got_all_treasures
	ld a, TRANSITION_EPILOGUE_PERFECT
	ld [wTransitionParam], a
	set MODE_TIME_ATTACK_F, [hl]
.set_game_cleared
	set MODE_GAME_CLEARED_F, [hl]
.set_fought_a_hidden_figure
	set MODE_FOUGHT_A_HIDDEN_FIGURE_F, [hl]

	ld hl, wState
	ld [hl], ST_EPILOGUE
	xor a
	ld [wSubState], a
	ret

.no_end_screen
	ld a, [wceda]
	and a
	jr z, .tick_time
	ld a, [wSubState]
	ld [wPendingSubState], a
	ld a, SST_LEVEL_07
	ld [wSubState], a
	ret

.tick_time
	call TickLevelTime

	ld a, [wFloorTransitionDir]
	and a
	ret nz
	ld a, [wRoomTransitionParam]
	and a
	ret nz

	ld a, [wJoypadPressed]
	and SELECT | START
	ret z
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_BLIND
	jr z, .no_pause
	ld a, [wIsBossBattle]
	and a
	jr nz, .no_pause
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_BLIND
	jr nz, .pause ; this jump will always happen
.no_pause
	play_sfx SFX_0E5
	ret

.pause
	play_sfx SFX_0E4
	stop_music
	xor a
	ld [wRoomAnimatedPalsEnabled], a
	ld a, $01
	ld [wced6], a
	ld a, [wSubState]
	ld [wPendingSubState], a
	ld a, ST_PAUSE_MENU
	ld [wState], a
	xor a
	ld [wSubState], a
	ret

.free_camera
	ld a, TRUE
	ld [wc0da], a
	farcall UpdateWarioStates

	ld a, [wCameraSCY + 1]
	ld [wSCY], a
	ld a, [wCameraSCX + 1]
	ld [wSCX], a

	xor a ; FALSE
	ld [wc0da], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall UpdateObjects
	pop af
	ldh [rSVBK], a

	call SetWarioScreenPos
	ld a, TRUE
	ld [wc0da], a
	farcall ProcessInteractions

	xor a ; FALSE
	ld [wc0da], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall DrawObjects_NoPriority
	pop af
	ldh [rSVBK], a

	call DrawWario

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall DrawObjects_WithPriority
	pop af
	ldh [rSVBK], a

	call ClearUnusedVirtualOAM
	xor a
	ld [wc0be], a
	ld [wc0bd], a
	call Func_b915
	call Func_b9a6
	jp .asm_8229

.yscroll_camera
	ld a, TRUE
	ld [wc0da], a
	farcall UpdateWarioStates

	ld a, [wCameraSCY + 1]
	ld [wSCY], a
	ld a, [wCameraSCX + 1]
	ld [wSCX], a

	xor a ; FALSE
	ld [wc0da], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall UpdateObjects
	pop af
	ldh [rSVBK], a

	call SetWarioScreenPos
	ld a, TRUE
	ld [wc0da], a
	farcall ProcessInteractions

	xor a ; FALSE
	ld [wc0da], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall DrawObjects_NoPriority
	pop af
	ldh [rSVBK], a

	call DrawWario

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall DrawObjects_WithPriority
	pop af
	ldh [rSVBK], a

	call ClearUnusedVirtualOAM

	xor a
	ld [wc0be], a
	ld [wc0bd], a
	call Func_b915
	jp .asm_8229

Func_846e:
	ld a, [wRoomTransitionParam]
	and ROOMTRANSITION_MASK
	cp ROOMTRANSITION_3
	jr nz, .asm_849d
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [wAnimatedTilesFrameDuration]
	ld [wTempAnimatedTilesFrameDuration], a
	ld a, [wAnimatedTilesGfx]
	ld [wTempAnimatedTilesGroup], a
	pop af
	ldh [rSVBK], a
	ld a, [wSubState]
	ld [wPendingSubState], a
	ld hl, wState
	ld [hl], ST_GOLF
	xor a
	ld [wSubState], a
	ret

.asm_849d
	call DisableLCD
	farcall DespawnAllObjects
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall Func_61f2a
	pop af
	ldh [rSVBK], a
	ld a, $00
	sramswitch
	ld a, [wRoomTransitionParam]
	and ROOMTRANSITION_MASK
	cp ROOMTRANSITION_7
	jr nz, .asm_84e2

	ld a, $01
	ld [wWarioYPos + 0], a
	xor a
	ld [wWarioXPos + 0], a
.asm_84e2
	ld a, [wWarioYPos + 1]
	sub $10
	ld [wWarioYPos + 1], a
	ld a, [wWarioYPos + 0]
	sbc $00
	ld [wWarioYPos + 0], a
	ld b, a
	swap b
	ld a, [wWarioXPos + 0]
	or b
	ld [wca6c], a

	ld hl, wWarioPos
	call GetNextInternalRoomID

	xor a
	ld [wFloorTransitionDir], a
	ld [wFloorTransitionTimer], a
	ld [wc0c2], a
	ld [wc0c3], a
	ld [wc0be], a
	ld [wc0bd], a
	ld [wGroundShakeCounter], a
	ld [wSCYShake], a
	ld a, [wInternalRoomID]
	ld [wTempInternalRoomID], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call Func_285c
	pop af
	ldh [rSVBK], a

	call FillBGMap0_With7f
	call ClearVirtualOAM
	call ClearParticles
	call Func_8a41
	call Func_8ad9
	call Func_8c12
	ld a, [wRoomTransitionParam]
	bit ROOMTRANSITIONFLAG_2_F, a
	jr z, .asm_854a
	call Func_edb
.asm_854a
	xor a
	ld [wRoomTransitionParam], a
	call Func_bc5e
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	call Func_8cd7
	pop af
	sramswitch
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	call Func_896f
	pop af
	sramswitch
	call SetWarioScreenPos

	ld a, [wWarioState]
	cp WST_ENTERING_DOOR
	jr nz, .asm_85a7
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, HIGH(Frameset_14d18)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14d18)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

.asm_85a7
	call UpdateLevelMusic
	xor a ; FALSE
	ld [wc0da], a
	ld [wIsFloorTransition], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall UpdateObjects
	farcall UpdateObjects
	pop af
	ldh [rSVBK], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall DrawObjects_NoPriority
	pop af
	ldh [rSVBK], a
	call DrawWario
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall DrawObjects_WithPriority
	pop af
	ldh [rSVBK], a
	xor a
	ld [wIsIntangible], a
	ld a, $02
	ld [wSubState], a
	ld a, LCDCF_ON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ret

Func_861c:
	call .Func_867f
	farcall UpdateParticles

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall DrawObjects_NoPriority
	pop af
	ldh [rSVBK], a

	call DrawWario

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall DrawObjects_WithPriority
	pop af
	ldh [rSVBK], a

	call ClearUnusedVirtualOAM

	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	di
	call Func_b681
	ei
	pop af
	sramswitch
	ret

.Func_867f:
	ld a, [wceda]
	and $0f
	add $10
	ld [wceda], a
	and $08
	ld [wcede], a
.loop
	ld a, [wceda]
	and $07
	dec a
	jr z, .asm_86c1
	dec a
	jr z, .asm_86d8
	dec a
	jr z, .asm_86ef
	ld a, [wcedc]
	inc a
	ld h, a
	ld [wYCell], a
	cp $c0
	ld a, [wcedb]
	jr nz, .asm_86b5
	ld a, $a0
	ld h, a
	ld [wYCell], a
	ld a, [wcedb]
	inc a
.asm_86b5
	ld [wFloorSRAMBank], a
	ld a, [wcedd]
	ld l, a
	ld [wXCell], a
	jr .asm_8712
.asm_86c1
	ld a, [wcedb]
	ld [wFloorSRAMBank], a
	ld a, [wcedc]
	ld h, a
	ld [wYCell], a
	ld a, [wcedd]
	inc a
	ld l, a
	ld [wXCell], a
	jr .asm_8712
.asm_86d8
	ld a, [wcedb]
	ld [wFloorSRAMBank], a
	ld a, [wcedd]
	dec a
	ld l, a
	ld [wXCell], a
	ld a, [wcedc]
	ld h, a
	ld [wYCell], a
	jr .asm_8712
.asm_86ef
	ld a, [wcedc]
	dec a
	ld h, a
	ld [wYCell], a
	cp $9f
	ld a, [wcedb]
	jr nz, .asm_8708
	ld a, $bf
	ld h, a
	ld [wYCell], a
	ld a, [wcedb]
	dec a
.asm_8708
	ld [wFloorSRAMBank], a
	ld a, [wcedd]
	ld l, a
	ld [wXCell], a
.asm_8712
	ld a, [wceda]
	and $f8
	ld [wceda], a
	farcall Func_18000
	ld a, [wceda]
	and $07
	jr nz, .asm_8733
	jp .asm_8739 ; can be jr
.asm_8733
	call Func_bb85
	jp .loop

.asm_8739
	xor a
	ld [wceda], a
	ld [wIsFloorTransition], a
	ld a, [wPendingSubState]
	ld [wSubState], a
	ret

Func_8747:
	xor a
	ld [wIsBossBattle], a
	ld a, [wceef]
	and %00111100
	jp nz, .asm_87e2

	xor a
	ld [wInternalRoomID], a
	ld [wca6c], a
	ld [wTempInternalRoomID], a

	xor a
	ld [wLevelEndScreen], a
	ld [wNumMusicalCoins], a
	ld [wFloorTransitionDir], a
	ld [wFloorTransitionTimer], a
	ld [wc0c2], a
	ld [wc0c3], a
	ld [wc0be], a
	ld [wc0bd], a
	ld [wIsIntangible], a
	ld [wInvincibleCounter], a
	ld [wIsMinigameCleared], a
	ld [wIsRolling], a
	ld [wIsGettingOffLadder], a
	ld [wca66], a
	ld [wca6a], a
	ld [wLevelTime + 0], a
	ld [wLevelTime + 1], a
	ld [wLevelTime + 2], a
	ld [wcac3], a
	ld [wSwimVelIndex], a
	ld [wWaterSurfaceFloatingCounter], a
	call ClearTransformationValues
	ld [wInvisibleFrame], a
	ld [wcac8], a
	ld [wIsOnSteppableObject], a
	ld [wGroundShakeCounter], a
	ld [wSCYShake], a
	ld [wSwimmingDirectionInput], a
	ld [wAnimatedTilesFrameDuration], a
	ld [wRoomPalCycleDuration], a
	ld [wRoomAnimatedTilesEnabled], a
	ld [wRoomAnimatedPalsEnabled], a
	ld [wWaterCurrent], a
	ld [wLastWaterCurrent], a
	ld [wCurWaterCurrent], a

	ldh a, [rSVBK]
	push af
	ld a, 1 ; WRAM1
	ldh [rSVBK], a
	farcall Func_61f10
	pop af
	ldh [rSVBK], a
	jr .load_layout

.asm_87e2
	ld a, [wTempInternalRoomID]
	ld [wInternalRoomID], a
	call LoadWarioGfx

.load_layout
	call LoadLevelLayoutAndObjects

	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call Func_285c
	pop af
	ldh [rSVBK], a

	ld a, [wceef]
	and %00111100
	jr nz, .asm_883a
	call Func_8a41
	ld a, DIRECTION_RIGHT
	ld [wDirection], a

	farcall SetState_Idling

	ld hl, Pals_c800
	ld a, h
	ld [wWarioPalsPtr + 0], a
	ld a, l
	ld [wWarioPalsPtr + 1], a
	ld de, wTempPals2
	ld b, 2 palettes
	ld a, BANK(Pals_c800)
	ldh [hCallFuncBank], a
	hcall CopyHLToDE_Short
	jr .asm_8861

.asm_883a
	ld a, [wWarioPalsPtr + 0]
	ld h, a
	ld a, [wWarioPalsPtr + 1]
	ld l, a
	ld de, wTempPals2
	ld b, 2 palettes
	ld a, BANK(Pals_c800)
	ldh [hCallFuncBank], a
	hcall CopyHLToDE_Short

	ld hl, wcaa1
	ld de, wTempPals2 palette 4
	ld b, 4 palettes
	call CopyHLToDE

.asm_8861
	ld hl, Pals_d1fe
	ld de, wTempPals2 palette 2
	ld b, 1 palettes
	ld a, BANK(Pals_d1fe)
	ldh [hCallFuncBank], a
	hcall CopyHLToDE_Short

	call Func_8ad9
	call Func_8c12
	call VBlank_b672
	call Func_b681

	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	call Func_8cd7
	pop af
	sramswitch

	ld a, [wceef]
	and %00111100
	jr nz, .asm_88b7
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	call Func_896f
	pop af
	sramswitch

.asm_88b7
	ld a, [wLevel]
	cp THE_TEMPLE
	jr nz, .not_the_temple

	xor a
	ld a, [wCameraSCY + 1]
	ld [wc08a], a
	ld [wc089], a
	ld [wSCY], a
	ldh [rSCY], a
	ld a, [wCameraSCX + 1]
	ld [wc08c], a
	ld [wc08b], a
	ld [wSCX], a
	ldh [rSCX], a

.not_the_temple
	call SetWarioScreenPos
	xor a ; FALSE
	ld [wc0da], a

	ld a, [wceef]
	and %00111100
	jr nz, .asm_8917
	xor a ; FALSE
	ld [wIsFloorTransition], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a

	farcall UpdateObjects
	farcall UpdateObjects

	pop af
	ldh [rSVBK], a
	jr .asm_8935

.asm_8917
	ld a, TRUE
	ld [wIsFloorTransition], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall UpdateObjects
	pop af
	ldh [rSVBK], a

.asm_8935
	xor a ; FALSE
	ld [wIsFloorTransition], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall DrawObjects_NoPriority
	pop af
	ldh [rSVBK], a

	call DrawWario
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall DrawObjects_WithPriority
	pop af
	ldh [rSVBK], a
	ret

Func_896f:
	ld de, wc0a5 + 1
	ld hl, hXPosLo
	ld a, [de]
	ld [hld], a
	dec de
	ld a, [de]
	ld [hld], a
	dec de
	ld a, [de]
	ld [hld], a
	dec de
	ld a, [de]
	ld [hl], a
	call Func_cc0
	ld c, $01
	ld a, [wSpawnYCell]
	cp $c0
	jr c, .asm_8996
	inc c
	sub $20
	cp $c0
	jr c, .asm_8996
	inc c
	sub $20
.asm_8996
	ld h, a
	ld a, c
	ld [wccec], a
	sramswitch
	ld a, $01
	ld [wccef], a
	ld b, a
	ld d, $10
.asm_89a9
	ld e, $08
.asm_89ab
	ld a, [hl]
	and $f0
	swap a
	call nz, Func_89e2
	ld a, b
	xor $01
	ld b, a
	ld a, [hl]
	and $0f
	call nz, Func_89e2
	inc l
	ld a, b
	xor $01
	ld b, a
	dec e
	jr nz, .asm_89ab
	ld a, l
	sub $08
	ld l, a
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_89de
	ld h, $a0
	ld a, [wccec]
	inc a
	ld [wccec], a
	sramswitch
.asm_89de
	dec d
	jr nz, .asm_89a9
	ret

Func_89e2:
	cp $0f
	ret nc
	ld c, a
	ld a, [wc0c7]
	dec a
	cp l
	ret c
	ld a, [wc0c6]
	cp l
	jr z, .asm_89f3
	ret nc

.asm_89f3
	ld a, [wccec]
	dec a
	jr nz, .asm_8a08
	ld a, [wc0c4]
	dec a
	cp h
	ret c
	ld a, [wc0c5]
	cp h
	jr z, .asm_8a19
	ret nc
	jr .asm_8a19

.asm_8a08
	ld a, [wc0c4]
	sub $20
	dec a
	cp h
	ret c
	ld a, [wc0c5]
	sub $20
	cp h
	jr z, .asm_8a19
	ret nc

.asm_8a19
	push de
	push bc
	call Func_cf8
	push hl
	call Func_d81
	ld d, h
	ld e, l
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall SpawnObject
	pop af
	ldh [rSVBK], a
	pop hl
	pop bc
	pop de
	ret

Func_8a41:
	ld hl, hXPosLo
	xor a
	ld [hld], a ; hXPosLo
	ld a, [wSpawnPos]
	and $0f
	ld [hld], a ; hXPosHi
	xor a
	ld [hld], a ; hYPosLo
	ld a, [wSpawnPos]
	and $f0
	swap a
	ld [hl], a ; hYPosHi
	call Func_cc0

	ld c, $01
	ld a, [wSpawnYCell]
	cp $c0
	jr c, .asm_8a6c
	inc c
	sub $20
	cp $c0
	jr c, .asm_8a6c
	inc c
	sub $20
.asm_8a6c
	ld h, a
	ld a, c
	ld [wccec], a
	sramswitch

.asm_8a77
	ld e, $08
.asm_8a79
	ld a, [hl]
	and $f0
	swap a
	cp $0f
	jr nc, .asm_8ab0
	ld a, b
	xor $01
	ld b, a

	ld a, [hl]
	and $0f
	cp $0f
	jr nc, .asm_8ab0
	inc l
	ld a, b
	xor $01
	ld b, a

	dec e
	jr nz, .asm_8a79

	ld a, l
	sub $08
	ld l, a
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_8a77
	ld h, $a0
	ld a, [wccec]
	inc a
	ld [wccec], a
	sramswitch
	jr .asm_8a77

.asm_8ab0
	ld c, a
	call Func_cf8
	update_pos
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .asm_8ad8
	ld a, [wceef]
	and %00111100
	jr nz, .asm_8ad8
	call Func_1146
.asm_8ad8
	ret

Func_8ad9:
	xor a
	ld [wc0b5], a
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_XSCROLL2 | CAM_TRANSITIONS
	jr z, .cam_xscroll_or_cam_yscroll
	cp CAM_YSCROLL
	jr nz, .else
.cam_xscroll_or_cam_yscroll
	ld a, [wWarioXPos + 0]
	ld [wCameraSCX + 0], a
	ld a, $30
	ld [wCameraSCX + 1], a
	jr .asm_8b69

.else
	ld a, [wDirection]
	and a
	jr nz, .dir_right
; dir_left
	ld a, [wca60]
	sub 8
	ld b, a
	jr .asm_8b0b
.dir_right
	ld a, [wca5f]
	sub 8
	ld b, a
.asm_8b0b
	ld a, [wWarioXPos + 1]
	sub b
	ld [wCameraSCX + 1], a
	ld l, a
	ld a, [wWarioXPos + 0]
	sbc $00
	ld [wCameraSCX + 0], a
	ld h, a
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_LEFT_F, a
	jr z, .asm_8b27
	ld de, -$20
	add hl, de
.asm_8b27
	ld a, [wc0b8]
	ld b, a
	ld a, h
	bit 7, a
	jr nz, .asm_8b39
	cp b
	jr c, .asm_8b39
	jr nz, .asm_8b44
	; h > b
	ld a, l
	and a
	jr nz, .asm_8b44
.asm_8b39
	ld a, b
	ld [wCameraSCX + 0], a
	ld a, $01
	ld [wc0b5], a
	jr .asm_8b69
.asm_8b44
	ld hl, wCameraSCX
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld de, $a0
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_RIGHT_F, a
	jr z, .asm_8b56
	ld e, $c0
.asm_8b56
	add hl, de
	ld a, [wc0b9]
	ld b, a
	ld a, h
	cp b
	jr c, .asm_8b69
	ld a, b
	dec a
	ld [wCameraSCX + 0], a
	ld a, $ff
	ld [wc0b5], a

.asm_8b69
	ld a, [wceef]
	and %00111100
	jr z, .asm_8b78
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	ret nc

.asm_8b78
	xor a
	ld [wcac8], a

	ld a, [wWarioYPos + 1]
	sub $60
	ld [wCameraSCY + 1], a
	ld l, a
	ld a, [wWarioYPos + 0]
	sbc $00
	ld [wCameraSCY + 0], a
	ld h, a
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_UP_F, a
	jr z, .asm_8b99
	ld de, -$20
	add hl, de

.asm_8b99
	ld a, [wc0b7]
	ld b, a
	ld a, h
	bit 7, a
	jr nz, .asm_8bab
	cp b
	jr c, .asm_8bab
	jr nz, .asm_8bb5
	ld a, l
	and a
	jr nz, .asm_8bb5
.asm_8bab
	ld a, b
	ld [wCameraSCY + 0], a
	ld a, $01
	ld [wcac8], a
	ret
.asm_8bb5
	ld hl, wCameraSCY
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld de, $90
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_DOWN_F, a
	jr z, .asm_8bc7
	ld e, $b0
.asm_8bc7
	add hl, de
	ld a, [wc0b6]
	ld b, a
	ld a, h
	cp b
	jr c, .asm_8bdb
	ld a, b
	dec a
	ld [wCameraSCY + 0], a
	ld a, $ff
	ld [wcac8], a
	ret
.asm_8bdb
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	ret c
	ld a, [wWarioYPos + 1]
	cp $80
	jr nc, .asm_8c0c
	ld a, [wc0b7]
	ld b, a
	ld a, [wWarioYPos + 0]
	dec a
	ld [wCameraSCY + 0], a
	cp b
	jr c, .asm_8bab
	bit 7, a
	jr z, .asm_8c06

	xor a
	ld [wCameraSCY + 0], a
	ld a, $01
	ld [wcac8], a
	ret

.asm_8c06
	ld a, $e8
	ld [wCameraSCY + 1], a
	ret

.asm_8c0c
	ld a, $68
	ld [wCameraSCY + 1], a
	ret

Func_8c12:
	ld a, [wCameraSCY + 0]
	ld h, a
	ld a, [wCameraSCY + 1]
	ld l, a
	ld a, [wcac8]
	cp $01
	jr z, .asm_8c38
	cp $ff
	jr z, .asm_8c54

	ld a, l
	ldh [rSCY], a
	ld [wSCY], a
	sub $18
	ld [wc0a3 + 1], a
	ld a, h
	sbc $00
	ld [wc0a3 + 0], a
	jr .asm_8c70

.asm_8c38
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_UP_F, a
	ld a, $00
	jr z, .asm_8c43
	ld a, $20
.asm_8c43
	ld [wCameraSCY + 1], a
	ldh [rSCY], a
	ld [wSCY], a
	ld [wc0a3 + 1], a
	ld a, h
	ld [wc0a3 + 0], a
	jr .asm_8c70

.asm_8c54
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_DOWN_F, a
	ld a, $68
	jr z, .asm_8c5f
	ld a, $48
.asm_8c5f
	ld [wCameraSCY + 1], a
	ldh [rSCY], a
	ld [wSCY], a
	sub $20
	ld [wc0a3 + 1], a
	ld a, h
	ld [wc0a3 + 0], a
.asm_8c70
	ld a, [wCameraSCX + 0]
	ld h, a
	ld a, [wCameraSCX + 1]
	ld l, a
	ld a, [wc0b5]
	cp $01
	jr z, .asm_8c9f
	cp $ff
	jr z, .asm_8cba
	ld a, l
	ldh [rSCX], a
	ld [wSCX], a
	sub $10
	ld [wc0a5 + 1], a
	ld a, h
	sbc $00
	ld [wc0a5 + 0], a
	bit 7, a
	ret z
	xor a
	ld [wc0a5 + 1], a
	ld [wc0a5 + 0], a
	ret

.asm_8c9f
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_LEFT_F, a
	ld a, $00
	jr z, .asm_8caa
	ld a, $20
.asm_8caa
	ld [wCameraSCX + 1], a
	ldh [rSCX], a
	ld [wSCX], a
	ld [wc0a5 + 1], a
	ld a, h
	ld [wc0a5 + 0], a
	ret

.asm_8cba
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_RIGHT_F, a
	ld a, $60
	jr z, .asm_8cc5
	ld a, $40
.asm_8cc5
	ld [wCameraSCX + 1], a
	ldh [rSCX], a
	ld [wSCX], a
	sub $28
	ld [wc0a5 + 1], a
	ld a, h
	ld [wc0a5 + 0], a
	ret

Func_8cd7:
	ld hl, wc0a3
	ld de, wc0a7
	ld a, [hli] ; wc0a3
	ld [de], a  ; wc0a7
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli] ; wc0a5
	ld [de], a  ; wc0a9
	inc de
	ld a, [hl]
	ld [de], a

	ld a, $20
	ld [wc0a2], a
.asm_8ced
	call Func_8d69
	ld a, [wccf0 + 0]
	ld d, a
	ld a, [wccf0 + 1]
	ld e, a
	ld hl, wce01
	ld b, $20
.asm_8cfd
	ld a, [hli]
	ld [de], a
	ld a, e
	add $20
	ld e, a
	ld a, d
	adc $00
	ld d, a
	cp $9c
	jr nz, .asm_8d0d
	ld d, $98
.asm_8d0d
	dec b
	jr nz, .asm_8cfd

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [wccf0 + 0]
	ld d, a
	ld a, [wccf0 + 1]
	ld e, a
	ld hl, wce35
	ld b, $20
.asm_8d21
	ld a, [hli]
	ld [de], a
	ld a, e
	add $20
	ld e, a
	ld a, d
	adc $00
	ld d, a
	cp $9c
	jr nz, .asm_8d31
	ld d, $98
.asm_8d31
	dec b
	jr nz, .asm_8d21

	xor a
	ldh [rVBK], a
	xor a
	ld [wce69], a
	ld [wce00], a
	ld a, [wc0a5 + 1]
	add $08
	ld [wc0a5 + 1], a
	ld a, [wc0a5 + 0]
	adc $00
	ld [wc0a5 + 0], a
	ld a, [wc0a2]
	dec a
	ld [wc0a2], a
	jr nz, .asm_8ced
	ld hl, wc0a7
	ld de, wc0a3
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret

Func_8d69:
	call Func_8e5b
	ld a, [wce69]
	ld b, a
	ld de, wce6a
	ld a, e
	add b
	ld e, a
	ld b, $20
.asm_8d78
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	dec b
	jr nz, .asm_8d78
	ld a, [wce69]
	add $40
	ld [wce69], a
	ld hl, wc0a3
	call GetCell
	ld a, [wFloorSRAMBank]
	sramswitch
	ld a, [wc0a5 + 1]
	and $08
	jr z, .asm_8dd4

	push hl
	farcall Func_21f51
	pop hl

	ld a, [wFloorSRAMBank]
	sramswitch
	farcall Func_22012
	jr .asm_8dfd

.asm_8dd4
	push hl
	farcall Func_220fc
	pop hl

	ld a, [wFloorSRAMBank]
	sramswitch
	farcall Func_221bb
.asm_8dfd
	ld a, [wce00]
	add $20
	ld [wce00], a
	ret

Func_8e06::
	ld a, [wWarioYPos + 1]
	sub $18
	ld l, a
	ld a, [wWarioYPos + 0]
	sbc $00
	ld h, a

; hl = ypos - 24
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	ld a, h
	and $03
	ld d, a
	ld e, l

	ld a, [wWarioXPos + 0]
	ld h, a
	ld a, [wWarioXPos + 1]
	ld l, a
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	ld a, l
	and $1f
	ld l, a
	ld h, HIGH(v0BGMap0)
	add hl, de
	ld a, h
	ld [wccf0 + 0], a
	ld a, l
	ld [wccf0 + 1], a
	ret

Func_8e5b:
	ld a, [wc0a3 + 0]
	ld h, a
	ld a, [wc0a3 + 1]
	ld l, a
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	ld a, h
	and $03
	ld d, a
	ld e, l
	ld a, [wc0a5 + 0]
	ld h, a
	ld a, [wc0a5 + 1]
	ld l, a
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	ld a, l
	and $1f
	ld l, a
	ld h, HIGH(v0BGMap0)
	add hl, de
	ld a, h
	ld [wccf0 + 0], a
	ld a, l
	ld [wccf0 + 1], a
	ret

; unreferenced
Func_8eac:
	srl l
	jr c, .asm_8eba
	ld a, l
	add $b0
	ld l, a
	ld a, [hl]
	swap a
	and $0f
	ret
.asm_8eba
	ld a, l
	add $b0
	ld l, a
	ld a, [hl]
	and $0f
	ret

GetNextInternalRoomID:
	ld a, [hli] ; hi y
	and a
	jr z, .skip_multiplication
	ld b, a
	inc hl
	ld a, [hl] ; hi x
	ld c, 10
.loop_multiplication
	add c
	dec b
	jr nz, .loop_multiplication
	; a = XPosHi + 10 * wWarioYPos
	ld [wInternalRoomID], a
	ret
.skip_multiplication
	inc hl
	ld a, [hl] ; hi x
	ld [wInternalRoomID], a
	ret

Func_8ed9:
	ld a, [wc0bb]
	and a
	ret z
	ld b, a
	and $03
	jr nz, .asm_8eec
.asm_8ee3
	bit 2, b
	jr nz, .asm_8f11
	bit 3, b
	jr nz, .asm_8ef6
	ret

.asm_8eec
	bit 0, b
	jr nz, .asm_8f2c
	bit 1, b
	jr nz, .asm_8f52
	jr .asm_8ee3

.asm_8ef6
	call Func_8f79
	call Func_9085
	ld hl, wc0bb
	res 3, [hl]
	farcall Func_d186
	ret

.asm_8f11
	call Func_8fb3
	call Func_9085
	ld hl, wc0bb
	res 2, [hl]
	farcall Func_d186
	ret

.asm_8f2c
	call Func_8fec
	call Func_a0e2
	ld hl, wc0bb
	res 0, [hl]
	farcall Func_d11a
	ld a, [wc0bb]
	bit 2, a
	jr nz, .asm_8f11
	bit 3, a
	jr nz, .asm_8ef6
	ret

.asm_8f52
	call Func_9039
	call Func_a0e2
	ld hl, wc0bb
	res 1, [hl]
	farcall Func_d11a
	ld a, [wc0bb]
	bit 2, a
	jr nz, .asm_8f11
	bit 3, a
	jp nz, .asm_8ef6
	ret

Func_8f79:
	ld hl, wCameraSCY + 1
	ld a, [hld]
	and $f8
	ld e, a
	ld h, [hl]
	ld l, e
	ld de, $a0
	add hl, de
	ld a, h
	cp $03
	jr c, .asm_8f8f
	ld hl, $2f8
	ld a, h
.asm_8f8f
	ld [wc0a3 + 0], a
	ld a, l
	ld [wc0a3 + 1], a

	ld hl, wCameraSCX + 1
	ld a, [hld]
	and $f8
	ld e, a
	ld h, [hl]
	ld l, e
	ld de, -$10
	add hl, de
	bit 7, h
	jr z, .asm_8faa
	ld hl, $0
.asm_8faa
	ld a, h
	ld [wc0a5 + 0], a
	ld a, l
	ld [wc0a5 + 1], a
	ret

Func_8fb3:
	ld hl, wCameraSCY + 1
	ld a, [hld]
	and $f8
	ld e, a
	ld h, [hl]
	ld l, e
	ld de, -$10
	add hl, de
	bit 7, h
	jr z, .asm_8fc7
	ld hl, $0
.asm_8fc7
	ld a, h
	ld [wc0a3 + 0], a
	ld a, l
	ld [wc0a3 + 1], a
	ld hl, wCameraSCX + 1
	ld a, [hld]
	and $f8
	ld e, a
	ld h, [hl]
	ld l, e
	ld de, -$10
	add hl, de
	bit 7, h
	jr z, .asm_8fe3
	ld hl, $0
.asm_8fe3
	ld a, h
	ld [wc0a5 + 0], a
	ld a, l
	ld [wc0a5 + 1], a
	ret

Func_8fec:
	ld hl, wCameraSCY + 1
	ld a, [hld]
	and $f8
	ld e, a
	ld h, [hl]
	ld l, e
	ld de, -$10
	add hl, de
	bit 7, h
	jr z, .asm_9002
	ld hl, $0
	jr .asm_9013
.asm_9002
	ld de, $b8
	push hl
	add hl, de
	ld a, h
	cp $03
	jr c, .asm_9012
	pop hl
	ld hl, $240
	jr .asm_9013
.asm_9012
	pop hl
.asm_9013
	ld a, h
	ld [wc0a3 + 0], a
	ld a, l
	ld [wc0a3 + 1], a
	ld hl, wCameraSCX + 1
	ld a, [hld]
	and $f8
	ld e, a
	ld h, [hl]
	ld l, e
	ld de, $b0
	add hl, de
	ld a, h
	cp $0a
	jr c, .asm_9031
	ld hl, $9f8
	ld a, h
.asm_9031
	ld [wc0a5 + 0], a
	ld a, l
	ld [wc0a5 + 1], a
	ret

Func_9039:
	ld hl, wCameraSCY + 1
	ld a, [hld]
	and $f8
	ld e, a
	ld h, [hl]
	ld l, e
	ld de, -$10
	add hl, de
	bit 7, h
	jr z, .asm_904f
	ld hl, $0
	jr .asm_9060
.asm_904f
	ld de, $b8
	push hl
	add hl, de
	ld a, h
	cp $03
	jr c, .asm_905f
	pop hl
	ld hl, $240
	jr .asm_9060
.asm_905f
	pop hl
.asm_9060
	ld a, h
	ld [wc0a3 + 0], a
	ld a, l
	ld [wc0a3 + 1], a
	ld hl, wCameraSCX + 1
	ld a, [hld]
	and $f8
	ld e, a
	ld h, [hl]
	ld l, e
	ld de, -$10
	add hl, de
	bit 7, h
	jr z, .asm_907c
	ld hl, $0
.asm_907c
	ld a, h
	ld [wc0a5 + 0], a
	ld a, l
	ld [wc0a5 + 1], a
	ret

Func_9085:
	call Func_8e5b
	ld a, [wce69]
	ld b, a
	ld de, wce6a
	ld a, e
	add b
	ld e, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	and $e0
	ld c, a
	inc e
	inc l
	ld a, l
	and $1f
	add c
	ld l, a
	ld a, [wce69]
	add $32
	ld [wce69], a
	ld hl, wc0a3
	call GetCell

	ld a, [wFloorSRAMBank]
	sramswitch
	ld a, [wc0a3 + 1]
	and $08
	jr z, .asm_923a
	push hl
	call Func_9254
	pop hl
	ld a, [wFloorSRAMBank]
	sramswitch
	call Func_9605
	jr .asm_924b

.asm_923a
	push hl
	call Func_99ca
	pop hl
	ld a, [wFloorSRAMBank]
	sramswitch
	call Func_9d4c
.asm_924b
	ld a, [wce00]
	add $19
	ld [wce00], a
	ret

Func_9254:
	ld a, [wce00]
	ld b, a
	ld a, HIGH(wce01)
	ld [wcce7 + 0], a
	ld a, LOW(wce01)
	add b
	ld [wcce7 + 1], a
	ld a, [wc0a5 + 1]
	and $08
	jp nz, Func_9438
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	ld a, [hl]
	ld [de], a
	pop hl
	ret

Func_9438:
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	inc a
	ld [wcce7 + 1], a
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ret

Func_9605:
	ld a, [wce00]
	ld b, a
	ld a, HIGH(wce35)
	ld [wc0b3 + 0], a
	ld a, LOW(wce35)
	add b
	ld [wc0b3 + 1], a
	ld a, [wc0a5 + 1]
	and $08
	jp nz, Func_97f3
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	ld a, [hl]
	ld [de], a
	pop hl
	pop af
	ldh [rSVBK], a
	ret

Func_97f3:
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	inc a
	ld [wc0b3 + 1], a
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	pop af
	ldh [rSVBK], a
	ret

Func_99ca:
	ld a, [wce00]
	ld b, a
	ld a, HIGH(wce01)
	ld [wcce7 + 0], a
	ld a, LOW(wce01)
	add b
	ld [wcce7 + 1], a
	ld a, [wc0a5 + 1]
	and $08
	jp nz, Func_9b94
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	ld a, [hl]
	ld [de], a
	pop hl
	ret

Func_9b94:
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	inc a
	ld [wcce7 + 1], a
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ret

Func_9d4c:
	ld a, [wce00]
	ld b, a
	ld a, HIGH(wce35)
	ld [wc0b3 + 0], a
	ld a, LOW(wce35)
	add b
	ld [wc0b3 + 1], a
	ld a, [wc0a5 + 1]
	and $08
	jp nz, Func_9f20
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	ld a, [hl]
	ld [de], a
	pop hl
	pop af
	ldh [rSVBK], a
	ret

Func_9f20:
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	inc a
	ld [wc0b3 + 1], a
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ld a, [hli]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	pop af
	ldh [rSVBK], a
	ret

Func_a0e2:
	call Func_8e5b
	ld a, [wce69]
	ld b, a
	ld de, wce6a
	ld a, e
	add b
	ld e, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	ld a, [wce69]
	add $2e
	ld [wce69], a
	ld hl, wc0a3
	call GetCell
	ld a, [wFloorSRAMBank]
	sramswitch
	ld a, [wc0a5 + 1]
	and $08
	jr z, .asm_a290
	push hl
	call Func_a2aa
	pop hl
	ld a, [wFloorSRAMBank]
	sramswitch
	call Func_a79e
	jr .asm_a2a1
.asm_a290
	push hl
	call Func_aca6
	pop hl
	ld a, [wFloorSRAMBank]
	sramswitch
	call Func_b182
.asm_a2a1
	ld a, [wce00]
	add $17
	ld [wce00], a
	ret

Func_a2aa:
	ld a, [wce00]
	ld b, a
	ld a, HIGH(wce01)
	ld [wcce7 + 0], a
	ld a, LOW(wce01)
	add b
	ld [wcce7 + 1], a
	ld a, [wc0a3 + 1]
	and $08
	jp nz, Func_a52f
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a2f7
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a2f7
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a32d
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a32d
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a363
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a363
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a399
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a399
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a3cf
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a3cf
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a405
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a405
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a43b
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a43b
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a471
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a471
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a4a7
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a4a7
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a4dd
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a4dd
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a513
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a513
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	ld a, [hl]
	ld [de], a
	pop hl
	ret

Func_a52f:
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	inc a
	ld [wcce7 + 1], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a562
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a562
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a598
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a598
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a5ce
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a5ce
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a604
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a604
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a63a
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a63a
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a670
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a670
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a6a6
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a6a6
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a6dc
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a6dc
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a712
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a712
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a748
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a748
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a77e
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a77e
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ret

Func_a79e:
	ld a, [wce00]
	ld b, a
	ld a, HIGH(wce35)
	ld [wc0b3 + 0], a
	ld a, LOW(wce35)
	add b
	ld [wc0b3 + 1], a
	ld a, [wc0a3 + 1]
	and $08
	jp nz, Func_aa2d
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a7f2
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a7f2
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a828
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a828
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a85e
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a85e
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a894
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a894
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a8ca
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a8ca
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a900
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a900
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a936
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a936
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a96c
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a96c
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a9a2
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a9a2
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_a9d8
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_a9d8
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_aa0e
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_aa0e
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	ld a, [hl]
	ld [de], a
	pop hl
	pop af
	ldh [rSVBK], a
	ret

Func_aa2d:
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	inc a
	ld [wc0b3 + 1], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_aa67
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_aa67
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_aa9d
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_aa9d
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_aad3
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_aad3
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_ab09
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_ab09
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_ab3f
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_ab3f
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_ab75
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_ab75
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_abab
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_abab
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_abe1
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_abe1
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_ac17
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_ac17
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_ac4d
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_ac4d
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_ac83
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_ac83
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	pop af
	ldh [rSVBK], a
	ret

Func_aca6:
	ld a, [wce00]
	ld b, a
	ld a, HIGH(wce01)
	ld [wcce7 + 0], a
	ld a, LOW(wce01)
	add b
	ld [wcce7 + 1], a
	ld a, [wc0a3 + 1]
	and $08
	jp nz, Func_af1f
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_acf2
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_acf2
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_ad27
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_ad27
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_ad5c
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_ad5c
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_ad91
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_ad91
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_adc6
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_adc6
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_adfb
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_adfb
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_ae30
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_ae30
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_ae65
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_ae65
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_ae9a
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_ae9a
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_aecf
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_aecf
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_af04
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_af04
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	ld a, [hl]
	ld [de], a
	pop hl
	ret

Func_af1f:
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	inc a
	ld [wcce7 + 1], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_af51
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_af51
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_af86
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_af86
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_afbb
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_afbb
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_aff0
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_aff0
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b025
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b025
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b05a
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b05a
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b08f
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b08f
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b0c4
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b0c4
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b0f9
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b0f9
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b12e
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b12e
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	add $02
	ld [wcce7 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b163
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b163
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7 + 0]
	ld d, a
	ld a, [wcce7 + 1]
	ld e, a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	ret

Func_b182:
	ld a, [wce00]
	ld b, a
	ld a, HIGH(wce35)
	ld [wc0b3 + 0], a
	ld a, LOW(wce35)
	add b
	ld [wc0b3 + 1], a
	ld a, [wc0a3 + 1]
	and $08
	jp nz, Func_b405
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b1d5
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b1d5
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b20a
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b20a
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b23f
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b23f
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b274
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b274
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b2a9
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b2a9
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b2de
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b2de
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b313
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b313
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b348
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b348
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b37d
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b37d
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b3b2
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b3b2
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b3e7
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b3e7
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	ld a, [hl]
	ld [de], a
	pop hl
	pop af
	ldh [rSVBK], a
	ret

Func_b405:
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	inc a
	ld [wc0b3 + 1], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b43e
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b43e
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b473
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b473
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b4a8
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b4a8
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b4dd
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b4dd
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b512
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b512
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b547
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b547
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b57c
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b57c
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b5b1
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b5b1
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b5e6
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b5e6
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b61b
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b61b
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	add $02
	ld [wc0b3 + 1], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_b650
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b650
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3 + 0]
	ld d, a
	ld a, [wc0b3 + 1]
	ld e, a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	pop af
	ldh [rSVBK], a
	ret

VBlank_b672:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	jp DoPendingDMATransfer
.end

Func_b681:
	ld hl, wVBlankFunc + $10
	ld a, [wce00]
	and a
	jr z, .asm_b6cb

	ld c, a
.loop_1
	ld a, $2a ; ld a, [hli]
	ld [hli], a
	ld a, $57 ; ld d, a
	ld [hli], a
	ld a, $2a ; ld a, [hli]
	ld [hli], a
	ld a, $5f ; ld e, a
	ld [hli], a
	ld a, $0a ; ld a, [bc]
	ld [hli], a
	ld a, $12 ; ld [de], a
	ld [hli], a
	ld a, $0c ; inc c
	ld [hli], a
	dec c
	jr nz, .loop_1

	ld a, $c3 ; jp
	ld [hli], a
	ld a, LOW(Func_cab)
	ld [hli], a
	ld a, HIGH(Func_cab)
	ld [hl], a

	ld a, [wce00]
	ld c, a
	ld hl, wVBlankFuncExtended
.loop_2
	ld a, $2a ; ld a, [hli]
	ld [hli], a
	ld a, $57 ; ld d, a
	ld [hli], a
	ld a, $2a ; ld a, [hli]
	ld [hli], a
	ld a, $5f ; ld e, a
	ld [hli], a
	ld a, $0a ; ld a, [bc]
	ld [hli], a
	ld a, $12 ; ld [de], a
	ld [hli], a
	ld a, $0c ; inc c
	ld [hli], a
	dec c
	jr nz, .loop_2

.asm_b6cb
	ld a, $c3 ; jp
	ld [hli], a
	ld a, LOW(Func_cb8)
	ld [hli], a
	ld a, HIGH(Func_cb8)
	ld [hl], a
	ret

Func_b6d5:
	xor a
	ld [wc0c0], a
	ld a, [wc0b9]
	dec a
	ld c, a
	ld a, [wCameraSCX + 1]
	add b
	ld [wCameraSCX + 1], a
	ld a, [wCameraSCX + 0]
	adc $00
	ld [wCameraSCX + 0], a
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_RIGHT_F, a
	ld b, $60
	jr z, .asm_b6f8
	ld b, $40
.asm_b6f8
	ld a, [wCameraSCX + 0]
	cp c
	jr c, .asm_b70e
	ld a, [wCameraSCX + 1]
	cp b
	jr c, .asm_b70e
	ld a, b
	ld [wCameraSCX + 1], a
	ld a, $01
	ld [wc0c0], a
	ret
.asm_b70e
	ld a, [wc0b8]
	ld c, a
	ld a, [wWarioXPos + 0]
	cp c
	ret nz
	ld a, [wDirection]
	and a
	jr nz, .asm_b722
	ld a, [wca60]
	jr .asm_b725
.asm_b722
	ld a, [wca5f]
.asm_b725
	sub $08
	ld c, a
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_LEFT_F, a
	jr z, .asm_b733
	ld a, c
	add $20
	ld c, a
.asm_b733
	ld a, [wWarioXPos + 1]
	cp c
	ret nc
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_LEFT_F, a
	ld a, $00
	jr z, .asm_b743
	ld a, $20
.asm_b743
	ld [wCameraSCX + 1], a
	ld a, $02
	ld [wc0c0], a
	ret

Func_b74c:
	xor a
	ld [wc0bf], a
	ld a, [wc0b8]
	ld c, a
	ld a, [wCameraSCX + 1]
	sub b
	ld [wCameraSCX + 1], a
	ld a, [wCameraSCX + 0]
	sbc $00
	ld [wCameraSCX + 0], a
	ld a, [wCameraSCX + 1]
	add $10
	ld l, a
	ld a, [wCameraSCX + 0]
	adc $00
	cp c
	jr nz, .asm_b790
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_LEFT_F, a
	ld b, $10
	jr z, .asm_b77c
	ld b, $30
.asm_b77c
	ld a, l
	cp b
	jr nc, .asm_b790
	ld a, c
	ld [wCameraSCX + 0], a
	ld a, b
	sub $10
	ld [wCameraSCX + 1], a
	ld a, $01
	ld [wc0bf], a
	ret
.asm_b790
	ld a, [wc0b9]
	dec a
	ld c, a
	ld a, [wWarioXPos + 0]
	cp c
	ret nz
	ld a, [wDirection]
	and a
	jr nz, .asm_b7a5
	ld a, [wca60]
	jr .asm_b7a8
.asm_b7a5
	ld a, [wca5f]
.asm_b7a8
	ld c, a
	ld a, $a8
	sub c
	ld c, a
	xor a
	sub c
	ld c, a
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_RIGHT_F, a
	jr z, .asm_b7bb
	ld a, c
	sub $20
	ld c, a
.asm_b7bb
	ld a, [wWarioXPos + 1]
	cp c
	ret c
	ld a, $02
	ld [wc0bf], a
	ld a, [wc0b9]
	dec a
	ld [wCameraSCX + 0], a
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_RIGHT_F, a
	ld a, $60
	jr z, .asm_b7d7
	ld a, $40
.asm_b7d7
	ld [wCameraSCX + 1], a
	ret

Func_b7db:
	ld a, [wc0b6]
	dec a
	ld c, a
	ld a, [wCameraSCY + 1]
	add b
	ld [wCameraSCY + 1], a
	ld a, [wCameraSCY + 0]
	adc $00
	ld [wCameraSCY + 0], a
	cp c
	jr c, .asm_b80d
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_DOWN_F, a
	ld b, $68
	jr z, .asm_b7fd
	ld b, $48
.asm_b7fd
	ld a, [wCameraSCY + 1]
	cp b
	jr c, .asm_b80d
	ld a, b
	ld [wCameraSCY + 1], a
	ld a, $01
	ld [wc0bd], a
	ret
.asm_b80d
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	ret nc
	ld a, [wc0b7]
	ld c, a
	ld a, [wWarioYPos + 0]
	cp c
	jr c, .asm_b836
	ret nz
	ld a, [wca5e]
	sub $10
	ld c, a
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_UP_F, a
	jr z, .asm_b831
	ld a, c
	add $20
	ld c, a
.asm_b831
	ld a, [wWarioYPos + 1]
	cp c
	ret nc
.asm_b836
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_UP_F, a
	ld a, $00
	jr z, .asm_b841
	ld a, $20
.asm_b841
	ld [wCameraSCY + 1], a
	ld a, [wc0b7]
	ld [wCameraSCY + 0], a
	ld a, $02
	ld [wc0bd], a
	ret

Func_b850:
	ld a, [wc0b7]
	ld c, a
	ld a, [wCameraSCY + 1]
	sub b
	ld [wCameraSCY + 1], a
	ld a, [wCameraSCY + 0]
	sbc $00
	ld [wCameraSCY + 0], a
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_UP_F, a
	ld b, $10
	jr z, .asm_b86e
	ld b, $30
.asm_b86e
	ld a, [wCameraSCY + 1]
	add $10
	ld l, a
	ld a, [wCameraSCY + 0]
	adc $00
	cp c
	jr c, .asm_b882
	jr nz, .asm_b892
	ld a, l
	cp b
	jr nc, .asm_b892
.asm_b882
	ld a, c
	ld [wCameraSCY + 0], a
	ld a, b
	sub $10
	ld [wCameraSCY + 1], a
	ld a, $01
	ld [wc0be], a
	ret
.asm_b892
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	ret nc
	ld a, [wc0b6]
	dec a
	ld c, a
	ld a, [wWarioYPos + 0]
	cp c
	ret nz
	ld a, [wca5e]
	ld c, a
	ld a, $a0
	sub c
	ld c, a
	xor a
	sub c
	ld c, a
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_DOWN_F, a
	jr z, .asm_b8ba
	ld a, c
	sub $20
	ld c, a
.asm_b8ba
	ld a, [wWarioYPos + 1]
	cp c
	ret c
	ld a, $02
	ld [wc0be], a
	ld a, [wCameraConfigFlags]
	bit CAM_EDGE_DOWN_F, a
	ld a, $68
	jr z, .asm_b8cf
	ld a, $48
.asm_b8cf
	ld [wCameraSCY + 1], a
	ret

SetWarioScreenPos:
	ld a, [wCameraConfigFlags]
	cp HIDDEN_FIGURE_CAMCONFIG
	jr z, .hidden_figure_camconfig
	ld a, [wSCY]
	ld b, a
	ld a, [wWarioYPos + 1]
	add $10
	sub b ; wWarioYPos + 1 + $10 - wSCY
	ld [wWarioScreenYPos], a
	ld a, [wSCX]
	ld b, a
	ld a, [wWarioXPos + 1]
	add $08
	sub b
	ld [wWarioScreenXPos], a
	ret

.hidden_figure_camconfig
	ld a, [wSCYShake]
	ld c, a
	ld a, [wc08a]
	add c
	ld b, a
	ld a, [wWarioYPos + 1]
	add $10
	sub b
	ld [wWarioScreenYPos], a
	ld a, [wc08c]
	ld b, a
	ld a, [wWarioXPos + 1]
	add $08
	sub b
	ld [wWarioScreenXPos], a
	ret

Func_b915:
	ld a, [wc0c2]
	ld b, a
	and a
	jr z, .asm_b964
	xor a
	ld [wc0d4], a
	bit 7, b
	jr nz, .asm_b941
	ld hl, wWarioScreenYPos
	ld a, [wca5e]
	cp [hl]
	jr nc, .asm_b92e
	inc b
.asm_b92e
	call Func_b7db
	ld a, [wc0bd]
	and a
	jr nz, .asm_b93c
	ld hl, wc0bb
	set 3, [hl]
.asm_b93c
	xor a
	ld [wc0c2], a
	ret
.asm_b941
	ld a, b
	cpl
	inc a
	ld b, a
	ld hl, wWarioScreenYPos
	ld a, [wca5e]
	cp [hl]
	jr c, .asm_b951
	jr z, .asm_b951
	inc b
.asm_b951
	call Func_b850
	ld a, [wc0be]
	and a
	jr nz, .asm_b95f
	ld hl, wc0bb
	set 2, [hl]
.asm_b95f
	xor a
	ld [wc0c2], a
	ret

.asm_b964
	ld a, [wWaterInteraction]
	and a
	ret nz
	ld a, [wJumpVelIndex]
	and a
	ret nz
	ld a, [wWarioState]
	cp WST_LADDER_SCRATCHING
	ret z
	cp WST_LADDER_CLIMBING
	jr c, .asm_b97b
	cp WST_GRAB_SLIPPING
	ret c

.asm_b97b
	ld a, [wc0d4]
	inc a
	ld [wc0d4], a
	dec a
	ret z
	ld hl, wWarioScreenYPos
	ld a, [wca5e]
	sub [hl]
	jr nc, .asm_b98f
	cpl
	inc a
.asm_b98f
	ld b, a
	ld a, [wIsStandingOnSlope]
	and a
	jr nz, .asm_b99c
	ld a, b
	cp $08
	ret c
	ld b, $07
.asm_b99c
	ld a, [wca5e]
	cp [hl]
	jr c, .asm_b92e
	ret z
	jp .asm_b951

Func_b9a6:
	ld a, [wc0c3]
	ld b, a
	and a
	jr z, .asm_ba13
	xor a
	ld [wc0d5], a
	bit 7, b
	jr nz, .asm_b9e2
	ld hl, wWarioScreenXPos
	ld a, [wDirection]
	and a
	jr nz, .asm_b9c3
	ld a, [wca60]
	jr .asm_b9c6
.asm_b9c3
	ld a, [wca5f]
.asm_b9c6
	cp [hl]
	jr z, .asm_b9cf
	jr c, .asm_b9ce
	dec b
	jr .asm_b9cf
.asm_b9ce
	inc b
.asm_b9cf
	call Func_b6d5
	ld a, [wc0c0]
	and a
	jr nz, .asm_b9dd
	ld hl, wc0bb
	set 0, [hl]
.asm_b9dd
	xor a
	ld [wc0c3], a
	ret
.asm_b9e2
	ld a, b
	cpl
	inc a
	ld b, a
	ld hl, wWarioScreenXPos
	ld a, [wDirection]
	and a
	jr nz, .asm_b9f4
	ld a, [wca60]
	jr .asm_b9f7
.asm_b9f4
	ld a, [wca5f]
.asm_b9f7
	cp [hl]
	jr z, .asm_ba00
	jr c, .asm_b9ff
	inc b
	jr .asm_ba00
.asm_b9ff
	dec b
.asm_ba00
	call Func_b74c
	ld a, [wc0bf]
	and a
	jr nz, .asm_ba0e
	ld hl, wc0bb
	set 1, [hl]
.asm_ba0e
	xor a
	ld [wc0c3], a
	ret
.asm_ba13
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jr nz, .asm_ba1f
	ld a, [wJumpVelTable]
	and a
	ret nz
.asm_ba1f
	ld a, [wc0d5]
	inc a
	ld [wc0d5], a
	dec a
	ret z
	ld b, $01
	ld hl, wWarioScreenXPos
	ld a, [wDirection]
	and a
	jr nz, .asm_ba38
	ld a, [wca60]
	jr .asm_ba3b
.asm_ba38
	ld a, [wca5f]
.asm_ba3b
	cp [hl]
	jr c, .asm_b9cf
	ret z
	jp .asm_ba00

Func_ba42:
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	ld a, [wSRAMBank]
	push af
	ld a, $01
	sramswitch
	push de
	push hl
	ld c, $01
	ld a, [hld]
	cp $c0
	jr c, .asm_ba68
	inc c
	sub $20
	cp $c0
	jr c, .asm_ba68
	inc c
	sub $20
.asm_ba68
	ld l, [hl]
	ld h, a
	ld a, c
	ld [wFloorSRAMBank], a
	call Func_d8c
	ld a, [wccec]
	sramswitch
	bit 0, b
	jr z, .asm_ba85
	swap e
	ld a, [hl]
	and $0f
	jr .asm_ba88
.asm_ba85
	ld a, [hl]
	and $f0
.asm_ba88
	or e
	ld [hl], a
	pop hl

	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	ld a, [wSRAMBank]
	push af
	ld a, $01
	sramswitch
	ld c, $01
	ld a, [hld]
	cp $c0
	jr c, .asm_baaf
	inc c
	sub $20
	cp $c0
	jr c, .asm_baaf
	inc c
	sub $20
.asm_baaf
	ld d, a
	ld a, [hld]
	ld e, a
	ld a, c
	sramswitch
	ld a, [de]
	or $80
	ld [de], a
	pop af
	sramswitch
	pop af
	ldh [rSVBK], a
	ld a, c
	ld [wFloorSRAMBank], a
	ld h, d
	ld l, e
	call Func_d3e
	pop de

	ld c, e
	ld d, h
	ld e, l
	farcall SpawnObject
	pop af
	sramswitch
	pop af
	ldh [rSVBK], a
	ret

; hl = obj unk02
DespawnObject:
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	ld c, $01
	ld a, [hld] ; OBJ_UNK_02
	cp $c0
	jr c, .asm_bb12
	inc c
	sub $20
	cp $c0
	jr c, .asm_bb12
	inc c
	sub $20
.asm_bb12
	ld d, a
	ld a, [hld] ; OBJ_UNK_01
	ld e, a
	xor a
	ld [hl], a
	ld a, c
	sramswitch
	ld a, [de]
	or $80
	ld [de], a
	pop af
	sramswitch
	pop af
	ldh [rSVBK], a
	ret

Func_bb2d:
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	ld a, [wSRAMBank]
	push af
	ld a, $01
	sramswitch
	ld c, $01
	ld a, [hld]
	cp $c0
	jr c, .asm_bb51
	inc c
	sub $20
	cp $c0
	jr c, .asm_bb51
	inc c
	sub $20
.asm_bb51
	ld l, [hl]
	ld h, a
	ld a, c
	ld [wFloorSRAMBank], a
	call Func_d8c
	ld a, [wccec]
	sramswitch
	bit 0, b
	jr z, .asm_bb76
	ld a, [hl]
	and $0f
	ld [hl], a
	pop af
	sramswitch
	pop af
	ldh [rSVBK], a
	ret

.asm_bb76
	ld a, [hl]
	and $f0
	ld [hl], a
	pop af
	sramswitch
	pop af
	ldh [rSVBK], a
	ret

Func_bb85:
	ld a, [wIsDMATransferPending]
	and a
	ret nz
	ld b, $01
	ld a, [wc19f]
	ld e, a
	ld d, $00
	ld hl, wc18e
	add hl, de
	ld a, [hli]
	and a
	ret z
	ld l, [hl]
	cp $c0
	jr c, .asm_bba8
	inc b
	sub $20
	cp $c0
	jr c, .asm_bba8
	inc b
	sub $20
.asm_bba8
	ld h, a
	ld a, b
	ld [wFloorSRAMBank], a
	sramswitch
	push hl
	call Func_c19
	ld a, [wce69]
	ld b, a
	ld de, wce6a
	ld a, e
	add b
	ld e, a
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	ld a, h
	ld [de], a
	inc e
	ld a, l
	and $e0
	ld c, a
	ld a, l
	inc a
	and $1f
	add c
	ld [de], a
	inc e
	ld bc, $20
	add hl, bc
	ld a, h
	and $fb
	ld h, a
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	ld a, h
	ld [de], a
	inc e
	ld a, l
	and $e0
	ld c, a
	ld a, l
	inc a
	and $1f
	add c
	ld [de], a
	ld a, [wce69]
	add $08
	ld [wce69], a
	pop hl
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d

	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	push de
	ld hl, wc600
	add hl, de
	ld a, [wce00]
	ld e, a
	ld d, $ce
	ld a, $01
	add e
	ld e, a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop de
	ld hl, w3d300
	add hl, de
	ld a, [wce00]
	ld e, a
	ld d, $ce
	ld a, $35
	add e
	ld e, a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	ld a, [wce00]
	add $04
	ld [wce00], a
	ld a, [wc19f]
	ld e, a
	ld d, $00
	ld hl, wc18e
	add hl, de
	xor a
	ld [hli], a
	ld [hl], a
	ld a, e
	add $02
	and $0f
	ld [wc19f], a
	pop af
	ldh [rSVBK], a
	ret

Func_bc5e:
	ld a, [wca6a]
	and a
	ret z
	xor a
	ld [wca6a], a
	ld a, [wca6b]
	cp $68
	jr z, .asm_bcd5
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	ld hl, s0a000
.asm_bc7d
	ld a, [hli]
	and $7f
	cp $60
	jr c, .asm_bc8d
	cp $68
	jr nc, .asm_bc8d
	dec l
	ld a, [hl]
	add $08
	ld [hli], a
.asm_bc8d
	ld a, l
	cp $a0
	jr c, .asm_bc7d
	ld l, $00
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_bc7d
	pop af
	sramswitch
	ld a, [wSRAMBank]
	push af
	ld a, $02
	sramswitch
	ld hl, s0a000
.asm_bcb0
	ld a, [hli]
	and $7f
	cp $60
	jr c, .asm_bcc0
	cp $68
	jr nc, .asm_bcc0
	dec l
	ld a, [hl]
	add $08
	ld [hli], a
.asm_bcc0
	ld a, l
	cp $a0
	jr c, .asm_bcb0
	ld l, $00
	inc h
	ld a, h
	cp $b0
	jr nz, .asm_bcb0
	pop af
	sramswitch
	ret
.asm_bcd5
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	ld hl, s0a000
.asm_bce4
	ld a, [hli]
	and $7f
	cp $68
	jr c, .asm_bcf4
	cp $70
	jr nc, .asm_bcf4
	dec l
	ld a, [hl]
	sub $08
	ld [hli], a
.asm_bcf4
	ld a, l
	cp $a0
	jr c, .asm_bce4
	ld l, $00
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_bce4
	pop af
	sramswitch
	ld a, [wSRAMBank]
	push af
	ld a, $02
	sramswitch
	ld hl, s0a000
.asm_bd17
	ld a, [hli]
	and $7f
	cp $68
	jr c, .asm_bd27
	cp $70
	jr nc, .asm_bd27
	dec l
	ld a, [hl]
	sub $08
	ld [hli], a
.asm_bd27
	ld a, l
	cp $a0
	jr c, .asm_bd17
	ld l, $00
	inc h
	ld a, h
	cp $b0
	jr nz, .asm_bd17
	pop af
	sramswitch
	ret

TickLevelTime:
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	ret z
	ld a, [wLevelEndScreen]
	and a
	ret nz
	ld a, [wLevelTime + 2]
	add 1
	daa
	ld [wLevelTime + 2], a
	cp $60
	ret c
	xor a
	ld [wLevelTime + 2], a
	ld a, [wLevelTime + 1]
	add 1
	daa
	ld [wLevelTime + 1], a
	cp $60
	ret c
	xor a
	ld [wLevelTime + 1], a
	ld a, [wLevelTime + 0]
	add 1
	daa
	ld [wLevelTime + 0], a
	cp $60
	ret c
	ld a, $59
	ld [wLevelTime + 0], a
	ld [wLevelTime + 1], a
	ret
