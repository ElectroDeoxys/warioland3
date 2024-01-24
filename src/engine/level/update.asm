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
	jr z, .shake_override
	ld a, [wCameraSCY + 1]
	ld [wSCY], a
	ld a, [wCameraSCX + 1]
	ld [wSCX], a
	jr .applied_cam_scrolling
.shake_override
	ld hl, wSCYShake
	ld a, [wc089]
	add [hl]
	ld [wSCY], a
	ld a, [wc08b]
	ld [wSCX], a
	ld a, [wc08d]
	add [hl]
	ldh [rWY], a

.applied_cam_scrolling
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

	; if we are in Hidden Figure fight
	; and wAutoMoveState == $02, then
	; set state to Fence Shake Sliding
	ld a, [wLevel]
	cp THE_TEMPLE
	jr nz, .process_interactions
	ld a, [wAutoMoveState]
	cp $02
	jr nz, .process_interactions
	farcall SetState_FenceShakeSliding

.process_interactions
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
	ld a, [wMultiCellBlockParam]
	and a
	jr z, .tick_time

	; set next frame to process multi-cell block
	ld a, [wSubState]
	ld [wPendingSubState], a
	ld a, SST_LEVEL_MULTI_CELL_BLOCK
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
