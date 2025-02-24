StartRoom_FromTransition:
	ld a, [wRoomTransitionParam]
	and ROOMTRANSITION_MASK
	cp ROOMTRANSITION_GOLF
	jr nz, .not_golf

	; enter Golf minigame
	push_wram $03
	ld a, [wAnimatedTilesFrameDuration]
	ld [wTempAnimatedTilesFrameDuration], a
	ld a, [wAnimatedTilesGfx]
	ld [wTempAnimatedTilesGroup], a
	pop_wram
	
	ld a, [wSubState]
	ld [wPendingSubState], a
	ld hl, wState
	ld [hl], ST_GOLF
	xor a
	ld [wSubState], a
	ret

.not_golf
	call DisableLCD
	farcall DespawnAllObjects

	push_wram BANK("Level Objects WRAM")
	farcall InitObjectVars_FromTransition
	pop_wram

	ld a, $00
	sramswitch
	ld a, [wRoomTransitionParam]
	and ROOMTRANSITION_MASK
	cp ROOMTRANSITION_TELEPORT
	jr nz, .not_teleport
	ld a, $01
	ld [wWarioYPos + 0], a
	xor a
	ld [wWarioXPos + 0], a
.not_teleport
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

	; get next room ID from Wario's position
	ld hl, wWarioPos
	call GetNextLevelRoomID

	xor a
	ld [wFloorTransitionDir], a
	ld [wFloorTransitionTimer], a
	ld [wCameraYDelta], a
	ld [wCameraXDelta], a
	ld [wScrollUpEdge], a
	ld [wScrollDownEdge], a
	ld [wGroundShakeCounter], a
	ld [wSCYShake], a
	ld a, [wLevelRoomID]
	ld [wTempLevelRoomID], a

	push_wram BANK("GFX RAM")
	call LoadRoom
	pop_wram

	call FillBGMap0_With7f
	call ClearVirtualOAM
	call ClearParticles
	call SetWarioPositionToSpawn

	call SetInitialCameraScroll
	call ApplyInitialCameraScroll

	ld a, [wRoomTransitionParam]
	bit ROOMTRANSITIONF_RELOAD_OBJECTS_F, a
	jr z, .no_object_reloading
	call ReloadLevelObjects
.no_object_reloading
	xor a
	ld [wRoomTransitionParam], a

	call UpdateSwitchableBlocks

	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	call DrawRoom_FromStart
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
	jr nz, .not_entering_door
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

.not_entering_door
	call UpdateLevelMusic
	xor a ; FALSE
	ld [wBlockFuncWarioFlag], a
	ld [wIsFloorTransition], a
	push_wram BANK("Level Objects WRAM")
	farcall UpdateObjects
	farcall UpdateObjects
	pop_wram
	push_wram BANK("Level Objects WRAM")
	farcall DrawObjects_NoPriority
	pop_wram
	call DrawWario
	push_wram BANK("Level Objects WRAM")
	farcall DrawObjects_WithPriority
	pop_wram
	xor a
	ld [wIsIntangible], a
	ld a, $02
	ld [wSubState], a
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ret

ProcessMultiBlock:
	call .ProcessBlocks

	; do normal level stuff

	farcall UpdateParticles

	push_wram BANK("Level Objects WRAM")
	farcall DrawObjects_NoPriority
	pop_wram

	call DrawWario

	push_wram BANK("Level Objects WRAM")
	farcall DrawObjects_WithPriority
	pop_wram

	call ClearUnusedVirtualOAM

	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	di
	call SetTileQueueProcessingFunctions
	ei
	pop af
	sramswitch
	ret

.ProcessBlocks:
	ld a, [wMultiBlockParam]
	and %1111
	add $10
	ld [wMultiBlockParam], a
	and $08
	ld [wcede], a

.loop
	ld a, [wMultiBlockParam]
	and %111
	dec a
	jr z, .right_block
	dec a
	jr z, .left_block
	dec a
	jr z, .down_block

; up block
	; get block above
	ld a, [wcedc + 0]
	inc a
	ld h, a
	ld [wBlockPtr + 0], a
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	ld a, [wcedb]
	jr nz, .no_wrap_1
	ld a, HIGH(sLevelBlockObjectMap)
	ld h, a
	ld [wBlockPtr + 0], a
	ld a, [wcedb]
	inc a
.no_wrap_1
	ld [wBlockPtrBank], a
	ld a, [wcedc + 1]
	ld l, a
	ld [wBlockPtr + 1], a
	jr .process_block

.right_block
	; get block on right
	ld a, [wcedb]
	ld [wBlockPtrBank], a
	ld a, [wcedc + 0]
	ld h, a
	ld [wBlockPtr + 0], a
	ld a, [wcedc + 1]
	inc a
	ld l, a
	ld [wBlockPtr + 1], a
	jr .process_block

.left_block
	; get block on left
	ld a, [wcedb]
	ld [wBlockPtrBank], a
	ld a, [wcedc + 1]
	dec a
	ld l, a
	ld [wBlockPtr + 1], a
	ld a, [wcedc + 0]
	ld h, a
	ld [wBlockPtr + 0], a
	jr .process_block

.down_block
	; get block below
	ld a, [wcedc + 0]
	dec a
	ld h, a
	ld [wBlockPtr + 0], a
	cp HIGH(STARTOF(SRAM)) - 1
	ld a, [wcedb]
	jr nz, .no_wrap_2
	ld a, HIGH(STARTOF(SRAM) + SIZEOF(SRAM)) - 1
	ld h, a
	ld [wBlockPtr + 0], a
	ld a, [wcedb]
	dec a
.no_wrap_2
	ld [wBlockPtrBank], a
	ld a, [wcedc + 1]
	ld l, a
	ld [wBlockPtr + 1], a

.process_block
	ld a, [wMultiBlockParam]
	and $ff ^ %111
	ld [wMultiBlockParam], a
	farcall ProcessBlock
	ld a, [wMultiBlockParam]
	and %111
	jr nz, .continue_loop
	jp .break ; can be jr
.continue_loop
	call Func_bb85
	jp .loop

.break
	xor a
	ld [wMultiBlockParam], a
	ld [wIsFloorTransition], a
	ld a, [wPendingSubState]
	ld [wSubState], a
	ret

StartRoom_FromLevelStart:
	xor a ; FALSE
	ld [wIsBossBattle], a

	; if from saved level, don't init start level vars
	ld a, [wceef]
	and %00111100
	jp nz, .skip_init_vars_and_objects

	xor a
	ld [wLevelRoomID], a
	ld [wca6c], a
	ld [wTempLevelRoomID], a
	xor a ; unnecessary
	ld [wLevelEndScreen], a
	ld [wNumMusicalCoins], a
	ld [wFloorTransitionDir], a
	ld [wFloorTransitionTimer], a
	ld [wCameraYDelta], a
	ld [wCameraXDelta], a
	ld [wScrollUpEdge], a
	ld [wScrollDownEdge], a
	ld [wIsIntangible], a
	ld [wInvincibleCounter], a
	ld [wIsMinigameCleared], a
	ld [wIsRolling], a
	ld [wIsGettingOffLadder], a
	ld [wca66], a
	ld [wSwitchStateUpdated], a
	ld [wLevelTime + 0], a
	ld [wLevelTime + 1], a
	ld [wLevelTime + 2], a
	ld [wBossBattleMusic], a
	ld [wSwimVelIndex], a
	ld [wWaterSurfaceFloatingCounter], a
	call ClearTransformationValues
	; assumes ClearTransformationValues returns with a = 0
	ld [wInvisibleFrame], a
	ld [wCameraRoomYScrollLimit], a
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

	; init variables from level start
	; as well as everything related to objects
	push_wram BANK("Level Objects WRAM")
	farcall InitObjectVars_FromLevelStart
	pop_wram
	jr .load_blocks_and_objects

.skip_init_vars_and_objects
	ld a, [wTempLevelRoomID]
	ld [wLevelRoomID], a
	call LoadWarioGfx

.load_blocks_and_objects
	call LoadLevelBlockMapAndObjects

	push_wram BANK("GFX RAM")
	call LoadRoom
	pop_wram

	ld a, [wceef]
	and %00111100
	jr nz, .asm_883a
	call SetWarioPositionToSpawn
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	farcall SetState_Idling
	ld hl, WarioDefaultPal
	ld a, h
	ld [wWarioPalsPtr + 0], a
	ld a, l
	ld [wWarioPalsPtr + 1], a
	ld de, wTempPals2
	ld b, 2 palettes
	ld a, BANK(WarioDefaultPal)
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
	ld a, BANK(WarioDefaultPal)
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

	call SetInitialCameraScroll
	call ApplyInitialCameraScroll

	call VBlank_Level
	call SetTileQueueProcessingFunctions

	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	call DrawRoom_FromStart
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
	ld [wHiddenFigureSCYShake], a
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
	ld [wBlockFuncWarioFlag], a

	ld a, [wceef]
	and %00111100
	jr nz, .asm_8917
	xor a ; FALSE
	ld [wIsFloorTransition], a
	push_wram BANK("Level Objects WRAM")
	; for some reason updates objects twice?
	farcall UpdateObjects
	farcall UpdateObjects
	pop_wram
	jr .draw_objs

.asm_8917
	ld a, TRUE
	ld [wIsFloorTransition], a
	push_wram BANK("Level Objects WRAM")
	farcall UpdateObjects
	pop_wram

.draw_objs
	xor a ; FALSE
	ld [wIsFloorTransition], a

	push_wram BANK("Level Objects WRAM")
	farcall DrawObjects_NoPriority
	pop_wram

	call DrawWario

	push_wram BANK("Level Objects WRAM")
	farcall DrawObjects_WithPriority
	pop_wram
	ret

Func_896f:
	; load block X pos to hPos
	ld de, wBlockXPos + 1
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
	ld a, [wObjectSpawnBlockY]
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr c, .asm_8996
	inc c
	sub $20
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr c, .asm_8996
	inc c
	sub $20
.asm_8996
	ld h, a
	ld a, c
	ld [wccec], a
	sramswitch
	ld a, $01
	ld [wUnused_ccef], a
	ld b, a
	ld d, $10
.loop_search
	ld e, 16 / 2
.loop_row
	ld a, [hl]
	and $f0
	swap a
	call nz, .Func_89e2
	ld a, b
	xor $01
	ld b, a
	ld a, [hl]
	and $0f
	call nz, .Func_89e2
	inc l
	ld a, b
	xor $01
	ld b, a
	dec e
	jr nz, .loop_row
	ld a, l
	sub $08
	ld l, a
	inc h
	ld a, h
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, .asm_89de
	ld h, HIGH(sLevelBlockObjectMap)
	ld a, [wccec]
	inc a
	ld [wccec], a
	sramswitch
.asm_89de
	dec d
	jr nz, .loop_search
	ret

.Func_89e2:
	cp $0f
	ret nc ; is Wario spawn block
	ld c, a ; object index
	ld a, [wc0c7]
	dec a
	cp l
	ret c
	; wc0c7 > l
	ld a, [wc0c6]
	cp l
	jr z, .asm_89f3
	ret nc
.asm_89f3
	; wc0c6 <= l
	ld a, [wccec]
	dec a
	jr nz, .asm_8a08
	ld a, [wc0c4]
	dec a
	cp h
	ret c
	ld a, [wc0c5]
	cp h
	jr z, .spawn
	ret nc
	jr .spawn

.asm_8a08
	ld a, [wc0c4]
	sub $20
	dec a
	cp h
	ret c
	ld a, [wc0c5]
	sub $20
	cp h
	jr z, .spawn
	ret nc

.spawn
	push de
	push bc
	call Func_cf8
	push hl
	call Func_d81
	ld d, h
	ld e, l
	push_wram BANK("Level Objects WRAM")
	farcall SpawnObject
	pop_wram
	pop hl
	pop bc
	pop de
	ret

SetWarioPositionToSpawn:
	ld hl, hXPosLo
	xor a
	ld [hld], a ; hXPosLo
	ld a, [wWarioSpawnPos]
	and $0f
	ld [hld], a ; hXPosHi
	xor a
	ld [hld], a ; hYPosLo
	ld a, [wWarioSpawnPos]
	and $f0
	swap a
	ld [hl], a ; hYPosHi
	call Func_cc0

	ld c, $01
	ld a, [wObjectSpawnBlockY]
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr c, .asm_8a6c
	inc c
	sub $20
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr c, .asm_8a6c
	inc c
	sub $20
.asm_8a6c
	ld h, a
	ld a, c
	ld [wccec], a
	sramswitch

.loop_search
	ld e, 16 / 2
.loop_row
	ld a, [hl]
	and $f0
	swap a
	cp $0f
	jr nc, .found_spawn_block
	ld a, b
	xor $01
	ld b, a

	ld a, [hl]
	and $0f
	cp $0f
	jr nc, .found_spawn_block
	inc l
	ld a, b
	xor $01
	ld b, a

	dec e
	jr nz, .loop_row

	ld a, l
	sub $08
	ld l, a
	inc h
	ld a, h
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, .loop_search
	ld h, HIGH(sLevelBlockObjectMap)
	ld a, [wccec]
	inc a
	ld [wccec], a
	sramswitch
	jr .loop_search

.found_spawn_block
	ld c, a
	call Func_cf8
	update_pos

	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .skip_floor_update
	ld a, [wceef]
	and %00111100
	jr nz, .skip_floor_update
	call UpdateFloor
.skip_floor_update
	ret

; sets the initial camera scroll values
; when entering a new room or level starts
SetInitialCameraScroll:
	xor a
	ld [wCameraRoomXScrollLimit], a
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_XSCROLL2 | CAM_TRANSITIONS
	jr z, .cam_xscroll_or_cam_yscroll
	cp CAM_YSCROLL
	jr nz, .else
.cam_xscroll_or_cam_yscroll
	; snap camera X scroll to Wario's x position
	ld a, [wWarioXPos + 0]
	ld [wCameraSCX + 0], a
	ld a, $30
	ld [wCameraSCX + 1], a
	jr .check_if_saved_level

.else
	ld a, [wDirection]
	and a
	jr nz, .dir_right
; dir_left
	ld a, [wCamLeftSpacing]
	sub 8
	ld b, a ; wCamLeftSpacing - 8
	jr .got_x_spacing
.dir_right
	ld a, [wCamRightSpacing]
	sub 8
	ld b, a ; wCamRightSpacing - 8
.got_x_spacing
	; subtract spacing from Wario's X position
	; and apply it to the camera X scroll
	ld a, [wWarioXPos + 1]
	sub b
	ld [wCameraSCX + 1], a
	ld l, a
	ld a, [wWarioXPos + 0]
	sbc 0
	ld [wCameraSCX + 0], a
	ld h, a

	; next limit the camera to the left and right sides

	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_LEFT_F, a
	jr z, .no_left_border
	ld de, -$20
	add hl, de
.no_left_border
	ld a, [wRoomLeftXLimit]
	ld b, a
	ld a, h
	bit 7, a
	jr nz, .cap_left_side ; is less than 0, cap it
	cp b
	jr c, .cap_left_side ; over room limit, cap it
	jr nz, .check_right_limit
	; h == b, test low byte
	ld a, l
	and a
	jr nz, .check_right_limit
.cap_left_side
	ld a, b
	ld [wCameraSCX + 0], a
	ld a, 1
	ld [wCameraRoomXScrollLimit], a
	jr .check_if_saved_level

.check_right_limit
	ld hl, wCameraSCX
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld de, HIGH(STARTOF(SRAM))
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_RIGHT_F, a
	jr z, .no_right_border
	ld e, $c0
.no_right_border
	add hl, de
	ld a, [wRoomRightXLimit]
	ld b, a
	ld a, h
	cp b
	jr c, .check_if_saved_level
	ld a, b
	dec a
	ld [wCameraSCX + 0], a
	ld a, -1
	ld [wCameraRoomXScrollLimit], a

.check_if_saved_level
	ld a, [wceef]
	and %00111100
	jr z, .handle_cam_y_scroll
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	ret nc ; no need to handle Y scroll

.handle_cam_y_scroll
	xor a
	ld [wCameraRoomYScrollLimit], a

	; next limit the camera to the upper and lower sides

	ld a, [wWarioYPos + 1]
	sub $60
	ld [wCameraSCY + 1], a
	ld l, a
	ld a, [wWarioYPos + 0]
	sbc 0
	ld [wCameraSCY + 0], a
	ld h, a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_UP_F, a
	jr z, .no_up_border
	ld de, -$20
	add hl, de
.no_up_border
	ld a, [wRoomUpperYLimit]
	ld b, a
	ld a, h
	bit 7, a
	jr nz, .cap_up_side ; is less than 0, cap it
	cp b
	jr c, .cap_up_side ; over room limit, cap it
	jr nz, .check_lower_limit
	; h == b, test low byte
	ld a, l
	and a
	jr nz, .check_lower_limit
.cap_up_side
	ld a, b
	ld [wCameraSCY + 0], a
	ld a, 1
	ld [wCameraRoomYScrollLimit], a
	ret

.check_lower_limit
	ld hl, wCameraSCY
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld de, $90
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_DOWN_F, a
	jr z, .no_down_border
	ld e, $b0
.no_down_border
	add hl, de
	ld a, [wRoomLowerYLimit]
	ld b, a
	ld a, h
	cp b
	jr c, .check_transitions
	ld a, b
	dec a
	ld [wCameraSCY + 0], a
	ld a, -1
	ld [wCameraRoomYScrollLimit], a
	ret

.check_transitions
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	ret c ; not CAM_TRANSITIONS
	ld a, [wWarioYPos + 1]
	cp $80
	jr nc, .asm_8c0c
	ld a, [wRoomUpperYLimit]
	ld b, a
	ld a, [wWarioYPos + 0]
	dec a
	ld [wCameraSCY + 0], a
	cp b
	jr c, .cap_up_side
	bit 7, a
	jr z, .asm_8c06

	xor a
	ld [wCameraSCY + 0], a
	ld a, 1
	ld [wCameraRoomYScrollLimit], a
	ret

.asm_8c06
	ld a, $e8
	ld [wCameraSCY + 1], a
	ret

.asm_8c0c
	ld a, $68
	ld [wCameraSCY + 1], a
	ret

; applies the camera scroll set in SetInitialCameraScroll
; to the actual scroll registers rSCY and rSCX
ApplyInitialCameraScroll:
	ld a, [wCameraSCY + 0]
	ld h, a
	ld a, [wCameraSCY + 1]
	ld l, a
	ld a, [wCameraRoomYScrollLimit]
	cp 1
	jr z, .on_upper_edge
	cp -1
	jr z, .on_lower_edge

	ld a, l
	ldh [rSCY], a
	ld [wSCY], a
	sub $18
	ld [wBlockYPos + 1], a
	ld a, h
	sbc 0
	ld [wBlockYPos + 0], a
	jr .cam_x_scroll

.on_upper_edge
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_UP_F, a
	ld a, $00
	jr z, .asm_8c43
	ld a, $20
.asm_8c43
	ld [wCameraSCY + 1], a
	ldh [rSCY], a
	ld [wSCY], a
	ld [wBlockYPos + 1], a
	ld a, h
	ld [wBlockYPos + 0], a
	jr .cam_x_scroll

.on_lower_edge
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_DOWN_F, a
	ld a, $68
	jr z, .asm_8c5f
	ld a, $48
.asm_8c5f
	ld [wCameraSCY + 1], a
	ldh [rSCY], a
	ld [wSCY], a
	sub $20
	ld [wBlockYPos + 1], a
	ld a, h
	ld [wBlockYPos + 0], a

.cam_x_scroll
	ld a, [wCameraSCX + 0]
	ld h, a
	ld a, [wCameraSCX + 1]
	ld l, a
	ld a, [wCameraRoomXScrollLimit]
	cp 1
	jr z, .on_left_edge
	cp -1
	jr z, .on_right_edge
	ld a, l
	ldh [rSCX], a
	ld [wSCX], a
	sub $10
	ld [wBlockXPos + 1], a
	ld a, h
	sbc $00
	ld [wBlockXPos + 0], a
	bit 7, a
	ret z
	xor a
	ld [wBlockXPos + 1], a
	ld [wBlockXPos + 0], a
	ret

.on_left_edge
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_LEFT_F, a
	ld a, $00
	jr z, .asm_8caa
	ld a, $20
.asm_8caa
	ld [wCameraSCX + 1], a
	ldh [rSCX], a
	ld [wSCX], a
	ld [wBlockXPos + 1], a
	ld a, h
	ld [wBlockXPos + 0], a
	ret

.on_right_edge
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_RIGHT_F, a
	ld a, $60
	jr z, .asm_8cc5
	ld a, $40
.asm_8cc5
	ld [wCameraSCX + 1], a
	ldh [rSCX], a
	ld [wSCX], a
	sub $28
	ld [wBlockXPos + 1], a
	ld a, h
	ld [wBlockXPos + 0], a
	ret

; loads all room tiles that are visible in the BGMap
; this routine goes row by row, collecting all tiles/attributes
; for all blocks in each row and loads them to VRAM
DrawRoom_FromStart:
	; back up coords in wBlockYPos to wBackupBlockPos
	ld hl, wBlockPos
	ld de, wBackupBlockPos
	ld a, [hli] ; wBlockYPos
	ld [de], a  ; wBackupBlockPos
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli] ; wBlockXPos
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a

	ld a, BG_MAP_WIDTH
	ld [wDrawRoomWidthLoopVar], a
.loop_row
	call .QueueRowTilesAndAttributes

	ld a, [wBGPtr + 0]
	ld d, a
	ld a, [wBGPtr + 1]
	ld e, a
	ld hl, wBGMapTileVRAM0Queue
	ld b, BG_MAP_HEIGHT
.loop_col_vram0
	ld a, [hli]
	ld [de], a
	ld a, e
	add BG_MAP_WIDTH
	ld e, a
	ld a, d
	adc 0
	ld d, a
	cp HIGH(v0BGMap1)
	jr nz, .continue_vram0
	ld d, HIGH(v0BGMap0)
.continue_vram0
	dec b
	jr nz, .loop_col_vram0

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [wBGPtr + 0]
	ld d, a
	ld a, [wBGPtr + 1]
	ld e, a
	ld hl, wBGMapTileVRAM1Queue
	ld b, BG_MAP_HEIGHT
.loop_col_vram1
	ld a, [hli]
	ld [de], a
	ld a, e
	add BG_MAP_WIDTH
	ld e, a
	ld a, d
	adc 0
	ld d, a
	cp HIGH(v0BGMap1)
	jr nz, .continue_vram1
	ld d, HIGH(v0BGMap0)
.continue_vram1
	dec b
	jr nz, .loop_col_vram1
	xor a
	ldh [rVBK], a

	xor a
	ld [wBGMapAddressQueueSize], a
	ld [wBGMapTileQueueSize], a
	ld a, [wBlockXPos + 1]
	add $08
	ld [wBlockXPos + 1], a
	ld a, [wBlockXPos + 0]
	adc $00
	ld [wBlockXPos + 0], a
	ld a, [wDrawRoomWidthLoopVar]
	dec a
	ld [wDrawRoomWidthLoopVar], a
	jr nz, .loop_row

	; restore backed up coords
	ld hl, wBackupBlockPos
	ld de, wBlockYPos
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

.QueueRowTilesAndAttributes:
	call GetBlockBGPtr
	ld a, [wBGMapAddressQueueSize]
	ld b, a
	ld de, wBGMapAddressQueue
	ld a, e
	add b
	ld e, a
	ld b, BG_MAP_HEIGHT
.loop_col
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, BG_MAP_WIDTH
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	dec b
	jr nz, .loop_col

	ld a, [wBGMapAddressQueueSize]
	add 2 * BG_MAP_HEIGHT
	ld [wBGMapAddressQueueSize], a

	ld hl, wBlockPos
	call GetBlockPtr
	ld a, [wBlockPtrBank]
	sramswitch
	ld a, [wBlockXPos + 1]
	and $08
	jr z, .starting_even_column

; starting from odd column
	push hl
	farcall QueueBlockTilesAlongRow_OddColumn
	pop hl
	ld a, [wBlockPtrBank]
	sramswitch
	farcall QueueBlockAttributesAlongRow_OddColumn
	jr .done_queuing

.starting_even_column
	push hl
	farcall QueueBlockTilesAlongRow_EvenColumn
	pop hl
	ld a, [wBlockPtrBank]
	sramswitch
	farcall QueueBlockAttributesAlongRow_EvenColumn

.done_queuing
	ld a, [wBGMapTileQueueSize]
	add BG_MAP_WIDTH
	ld [wBGMapTileQueueSize], a
	ret
