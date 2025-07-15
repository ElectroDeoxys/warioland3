Func_803e6:
	ld a, [wTransitionParam]
	and a
	ret z
	ld a, [wOWBarsState]
	and a
	ret nz
	ld a, [wMapSideLevelID]
	cp OW_EXITS
	ret nc
	jp SaveGameOrEnterPerfectScreen

InitOverworld:
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	stop_music2

	ld a, [wTransitionParam]
	ld [wLastTransitionParam], a
	xor a
	ld [wRoomAnimatedTilesEnabled], a

	; if transition was from New Game,
	; set 0th treasure as collected
	ld a, [wLastTransitionParam]
	inc a
	jr nz, .skip_set_first_treasure_flag
	; TRANSITION_NEW_GAME
	ld hl, wTreasuresCollected
	set 0, [hl]
.skip_set_first_treasure_flag

	; load crayon flags from collected treasures
	call GetCrayonFlags

	ld a, [wOWBarsState]
	cp OWBARS_INPUT_TOP
	jr z, .skip_get_level_index
	ld a, [wOWLevel]
	cp LEVEL_GOLF_BUILDING
	jp nc, .golf_building
	ld b, a
	call GetMapLevelID
	ld a, b
	ld [wNextMapSide], a
	ld a, d
	ld [wMapSideLevelID], a
.skip_get_level_index
	call ClearOWWRAM

	; jump to corresponding handler depending
	; on what transition to map it is
	ld a, [wLastTransitionParam]
	and a
	jr z, .load_map_without_scene ; == 0
	cp TRANSITION_RETURN_TO_MAP
	jr z, .load_map_without_scene
	cp TRANSITION_EPILOGUE_NOT_PERFECT
	jr z, .epilogue
	cp TRANSITION_EPILOGUE_PERFECT
	jr z, .epilogue
	cp TRANSITION_GAME_OVER
	jr z, .game_over
	inc a
	jr nz, .check_if_unlocked_event

	; TRANSITION_NEW_GAME
	ld a, EVENT_PROLOGUE
	ld [wCurEvent], a
	jr .cutscene_check
.check_if_unlocked_event
	; transition was from collected treasure
	; if an event is unlocked, play cutscene
	call CheckIfTreasureUnlocksEvent
	jr nz, .cutscene_check
	jr .load_map_without_scene
.cutscene_check
	call SetStoredTransitionParamAsReturnToMap
	farcall CheckIfEventHasCutscene
	ld a, [wEventWithCutscene]
	and a
	jr z, .after_cutscene
	jr .play_cutscene

.after_cutscene
	; check if there's a OW scene to play
	ld a, [wCurEvent]
	call GetOWSceneParams
	jr z, .load_map_without_scene
	jr .play_ow_scene

.load_map_without_scene
	; simply loads and shows the overworld map
	; for player to navigate
	xor a ; EVENT_00
	ld [wCurEvent], a
	ld a, SST_OVERWORLD_09
	ld [wSubState], a
	call Func_803e6
	ret

.play_ow_scene
	; plays the OW scene
	call UpdateStoredTransitionParam
	ld a, SST_OVERWORLD_OW_SCENE
	ld [wSubState], a
	ret

.play_cutscene
	; plays the cutscene
	call UpdateStoredTransitionParam
	ld a, SST_OVERWORLD_CUTSCENE
	ld [wSubState], a
	ret

.epilogue
	; plays epilogue sequence
	ld a, TRANSITION_RETURN_TO_MAP
	ld [wStoredTransitionParam], a
	ld a, EVENT_EPILOGUE
	ld [wCurEvent], a
	jr .after_cutscene

.game_over
	call Func_803e6
	ret

.golf_building
	xor a
	ld [wNextMapSide], a
	ld [wMapSideLevelID], a
	ld a, SST_OVERWORLD_GOLF_BUILDING
	ld [wSubState], a
	call Func_803e6
	ret

SetStoredTransitionParamAsReturnToMap:
	ld a, [wOWBarsState]
	and a
	ret nz ; is manual cutscene
	ld a, TRANSITION_RETURN_TO_MAP
	ld [wStoredTransitionParam], a
	ret

UpdateStoredTransitionParam:
	ld a, [wOWBarsState]
	and a
	ret nz ; exit if any bar is open
	ld a, [wOWSceneAction]
	cp SPECIAL_ACTION
	ret z
	ld a, [wLastTransitionParam]
	cp TRANSITION_EPILOGUE_NOT_PERFECT
	ret z
	cp TRANSITION_EPILOGUE_PERFECT
	ret z
	ld [wStoredTransitionParam], a
	ret

; waits for A button input
Func_804ec:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	ld hl, wSubState
	inc [hl]
	ret

InitOWScene:
	call DisableLCD
	stop_music2

	call ClearOWWRAM
	call VBlank_OWScene
	call ClearVirtualOAM

	xor a
	ld [w2d011], a
	ld a, [w2d015]
	ld [w2d018], a
	ld a, [wOWSceneActionParam]
	ld [wTempUnlockableConnectionID], a
	ld a, [wOWSceneAction]
	ld [wTempOWSceneAction], a
	ld a, [wOWSceneParamsPtr + 0]
	ld [wTempOWSceneParamsPtr + 0], a
	ld a, [wOWSceneParamsPtr + 1]
	ld [wTempOWSceneParamsPtr + 1], a

	ld a, [wOWSceneMapSide]
	ld [wCurMapSide], a
	jumptable

	dw InitMapSideForScene_North ; NORTH
	dw InitMapSideForScene_West  ; WEST
	dw InitMapSideForScene_South ; SOUTH
	dw InitMapSideForScene_East  ; EAST

Func_80540:
	call Func_818ad
	call Func_82bb8
	call Func_82bda
	farcall Func_b4a37
	call LoadCompassSprite
	call ClearUnusedVirtualOAM
	ret

InitMapSide:
	call DisableLCD
	call FillBGMap0_With7f

	stop_music2

	ld a, $02
	ldh [rSVBK], a
	call ClearVirtualOAM
	call VBlank_Overworld

	call ClearOWWRAM
	call GetNextTreasureToCollect

	ld a, [wDayNight]
	ld b, a
	bit 7, a
	jr nz, .asm_8059b
	ld hl, wDayNight
	ld a, [hl]
	swap a
	and $0f
	ld [w2d011], a
	; swap bit 0 in a and [hl]
	srl [hl]
	rra
	rl [hl]
	jr .asm_805be
.asm_8059b
	call SwitchDayNight
	ld a, b
	res 7, a
	res 4, a
	ld [w2d011], a

	ld a, [wTransitionParam]
	and a
	jr nz, .asm_805be
	ld a, [w2d011]
	xor $1
	ld [w2d011], a
	ld hl, wDayNight
	srl [hl]
	rra
	rl [hl]
	res 7, [hl]
.asm_805be
	ld a, [w2d011]
	ld [w2d07c], a
	xor a
	ld [w2d07d], a
	ld a, [wNextMapSide]
	ld [wCurMapSide], a
	jumptable

	dw InitNorthMapSide ; NORTH
	dw InitWestMapSide  ; WEST
	dw InitSouthMapSide ; SOUTH
	dw InitEastMapSide  ; EAST

Func_805d7:
	call Func_80e89
	call LoadCompassSprite
	call ClearUnusedVirtualOAM
	ret

InitNorthMapSide:
	call LoadMapSidePals
	call LoadOverworld1Gfx
	call LoadOverworldCommonGfx
	call LoadOverworldArrowsGfx
	ld bc, OverworldNorthTilemap
	ld d, BANK(OverworldNorthTilemap)
	ld hl, OverworldNorthAttrmap
	ld e, BANK(OverworldNorthAttrmap)
	call LoadBGMapsToWRAM
	jp Func_8065e

InitWestMapSide:
	call LoadMapSidePals
	call LoadOverworld2Gfx
	call LoadOverworldCommonGfx
	call LoadOverworldArrowsGfx
	call Func_80ae7
	jp Func_8065e

InitSouthMapSide:
	call LoadMapSidePals
	call LoadOverworld5Gfx
	call LoadOverworldCommonGfx
	call LoadOverworldArrowsGfx
	call Func_80af5
	jp Func_8065e

InitEastMapSide:
	ld a, EVENT_SUMMON_SUN
	call Func_819c6
	ld [wGotSunMedallion], a
	ld a, [wGotSunMedallion] ; unnecessary
	and a
	jr nz, .got_medallion
	ld a, $01
	ld [w2d011], a
	ld hl, wDayNight
	set 0, [hl]
	res 7, [hl]
.got_medallion
	ld a, [wTransitionParam]
	cp KEY_CARD_BLUE
	call z, .Func_80655
	call LoadMapSidePals
	call LoadOverworld6Gfx
	call LoadOverworldCommonGfx
	call LoadOverworldArrowsGfx
	call Func_80b1b
	jp Func_8065e

.Func_80655:
	ld a, KEY_CARD_RED
	call IsTreasureCollected
	jp z, SetStoredTransitionParamAsReturnToMap
	ret

Func_8065e:
	ld a, [wGameModeFlags]
	ld c, a
	and MODE_GAME_CLEARED
	bit MODE_TIME_ATTACK_F, c
	jr z, .asm_80669
	xor a
.asm_80669
	ld [wMissingTreasureIndicatorsEnabled], a
	call Func_80b54

	decompress_tilemap OverworldTopBarTilemap, v0BGMap0, 29
	decompress_attrmap OverworldTopBarAttrmap, v1BGMap0, 29

	ld a, [wOWBarsState]
	and a
	ld a, $ec
	jr nz, .asm_806b6
	ld a, $04
.asm_806b6
	ldh [rSCY], a
	ld [wSCY], a
	xor a
	ldh [rSCX], a
	ld [wSCX], a
	xor a
	ld [wVirtualOAMByteSize], a

	ld a, [wCurMapSide] ; a gets overwritten
	call Func_81dce
	call ShowMissingTreasureIndicators
	call Func_80bd9
	call WriteBGMapFromWRAM

	call Func_8212c
	ld a, [wMapSideLevelID]
	ld [wLevel2], a
	ld [w2d068], a
	xor a
	ld [wLevelArrowDirections1], a

	ld a, OWWARIO_DOWN
	call SetOWWarioOAM
	farcall Func_b4a3d
	call Func_82041
	farcall Func_b4aa9
	call LoadCloudAndSeaGfx

	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jr nz, .asm_80753
	decompress_tilemap OverworldBottomBarTreasuresTilemap, v0BGMap1
	decompress_attrmap OverworldBottomBarTreasuresAttrmap, v1BGMap1
	jr .asm_80790
.asm_80753
	decompress_tilemap OverworldBottomBarTimeAttackTilemap, v0BGMap1
	decompress_attrmap OverworldBottomBarTimeAttackAttrmap, v1BGMap1
.asm_80790
	xor a
	ld [wWX], a
	ldh [rWX], a
	ld a, SCREEN_HEIGHT_PX
	ld [wWY], a
	ldh [rWY], a
	xor a ; BOTBAR_CLOSED
	ld [wBottomBarAction], a

	ld a, MAGNIFYING_GLASS
	call IsTreasureCollected
	ld [wHasMagnifyingGlass], a

	; collection button is always selectable
	xor a
	ld hl, wTopBarSelectableButtons
	ld [hl], a
	set TOPBAR_COLLECTION_F, [hl]

	call SetDayNightSpellSelectable
	call SetCutsceneButtonSelectable
	call SetNextPrevMapButtonsSelectable
	call UpdateNextPrevMapButtonsSelectable

	hlbgcoord 0, 30
	debgcoord 0, 21, wAttrmap
	ld b, 2 * BG_MAP_WIDTH
	call CopyHLToDE
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	hlbgcoord 0, 30
	debgcoord 0, 19, wAttrmap
	ld b, 2 * BG_MAP_WIDTH
	call CopyHLToDE
	xor a
	ldh [rVBK], a

	ld a, [wOWBarsState]
	cp OWBARS_INPUT_TOP
	jr nz, .asm_80809
	call UpdateTopBar.InitTopBarButtons
	hlbgcoord 0, 21, wAttrmap
	debgcoord 0, 30
	ld b, 2 * BG_MAP_WIDTH
	call CopyHLToDE
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	hlbgcoord 0, 19, wAttrmap
	debgcoord 0, 30
	ld b, 2 * BG_MAP_WIDTH
	call CopyHLToDE
	xor a
	ldh [rVBK], a

	ld a, [w2d02c]
	ld [wTransitionParam], a
	call PlayOverworldMusic

.asm_80809
	call LoadLevelNameIfValid
	ld a, [wMapSideLevelID]
	cp OW_EXITS
	ld b, $01
	jr c, .asm_80821
	xor a
	ld hl, wTempPals1 palette 7 color 1
	ld bc, $6
	call WriteAToHL_BCTimes
	ld b, $00
.asm_80821
	ld a, b
	ld [w2d0e0], a
	farcall DrawCoinCount
	call SetCompassSprite

	ld a, [wOWBarsState]
	and a
	call z, DrawBottomBar

	xor a
	ld [wLevelArrowDirections1], a
	ld [wOWPalTransitionState], a
	ld [w2d013], a

	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_WINON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a

	ld hl, wSubState
	inc [hl]
	ret

InitMapSideForScene_North:
	call LoadPalsForOWScene
	call LoadOverworldCommonGfx
	call LoadOverworld1Gfx
	ld a, [wCurEvent]
	cp EVENT_DAY_OR_NIGHT_SPELL
	call nz, LoadOverworldGlowGfx

	ld bc, OverworldNorthTilemap
	ld d, BANK(OverworldNorthTilemap)
	ld hl, OverworldNorthAttrmap
	ld e, BANK(OverworldNorthAttrmap)
	call LoadBGMapsToWRAM
;	fallthrough

Func_8086f:
	call Func_80b54

	ld a, [wCurMapSide] ; a gets overwritten
	call Func_81dce
	call WriteBGMapFromWRAM

	ld a, $04
	ldh [rSCY], a
	ld [wSCY], a
	xor a
	ldh [rSCX], a
	ld [wSCX], a
	ld a, [w2d018]
	ld [w2d015], a
	ld a, [wTempUnlockableConnectionID]
	ld [wOWSceneActionParam], a
	ld a, [wTempOWSceneAction]
	ld [wOWSceneAction], a
	ld a, [wCurMapSide]
	ld [wOWSceneMapSide], a
	ld a, [wTempOWSceneParamsPtr + 0]
	ld [wOWSceneParamsPtr + 0], a
	ld a, [wTempOWSceneParamsPtr + 1]
	ld [wOWSceneParamsPtr + 1], a

	farcall Func_b4a37
	call LoadCloudAndSeaGfx

	xor a
	ld hl, wTempPals1 palette 7 color 1
	ld bc, $6
	call WriteAToHL_BCTimes

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld b, $24
	ld a, [wLanguage]
	add b
	ld b, a
	ld c, $00 ; $10 tiles
	ld hl, LevelNamesNorthJPGfx + (7 * $20 tiles)
	ld de, v1Tiles2 tile $50
	call CopyFarBytes
	ld b, $24
	ld a, [wLanguage]
	add b
	ld b, a
	ld c, $00 ; $10 tiles
	ld hl, LevelNamesNorthJPGfx + (7 * $20 tiles)
	ld de, v1Tiles2 tile $60
	call CopyFarBytes
	xor a
	ldh [rVBK], a

	xor a
	ld [w2d0e0], a
	call SetCompassSprite
	xor a
	ld [wLevelArrowDirections1], a
	ld [wOWPalTransitionState], a
	ld [w2d013], a

	ld a, [wCurMapSide]
	and a
	jr nz, .no_window_display
	ld a, [wCurEvent]
	cp EVENT_MAGNIFYING_GLASS
	jr nz, .no_window_display
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_WINON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	jr .apply_lcd
.no_window_display
	ld a, LCDC_DEFAULT
.apply_lcd
	ldh [rLCDC], a

	ld hl, wSubState
	inc [hl]
	ret

InitMapSideForScene_West:
	call LoadPalsForOWScene
	call LoadOverworld2Gfx
	call LoadOverworldCommonGfx
	call LoadOverworldGlowGfx
	call Func_80ae7
	jp Func_8086f

InitMapSideForScene_South:
	ld a, [wCurEvent]
	cp EVENT_SUMMON_MOON
	jr nz, .asm_8093c
	ld a, $01
	ld [w2d011], a
.asm_8093c
	call LoadPalsForOWScene
	call LoadOverworld5Gfx
	call LoadOverworldCommonGfx
	call LoadOverworldGlowGfx
	call Func_80af5
	jp Func_8086f

InitMapSideForScene_East:
	ld a, EVENT_SUMMON_SUN
	call Func_819c6
	ld [wGotSunMedallion], a
	ld a, [wGotSunMedallion] ; unnecessary
	and a
	jr nz, .got_medallion
	ld a, $01
	ld [w2d011], a
.got_medallion
	call LoadPalsForOWScene
	call LoadOverworld6Gfx
	call LoadOverworldCommonGfx
	call LoadOverworldGlowGfx
	call Func_80b1b
	jp Func_8086f

LoadBGMapsToWRAM:
	push bc
	ld a, d
	ld [w2dfff], a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, e
	ld [wTempBank], a
	ld bc, wAttrmap
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	xor a
	ldh [rVBK], a
	pop hl

	ld a, [w2dfff]
	ld [wTempBank], a
	ld bc, w3d500
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret

LoadOverworldCommonGfx:
	decompress_tiles1 OverworldCommonGfx, v1Tiles0
	decompress_tiles1 OverworldNumbersGfx, v1Tiles0, $60
	ret

LoadOverworld1Gfx:
	decompress_tiles0 Overworld1Gfx, v0Tiles0
	ret

LoadOverworld2Gfx:
	decompress_tiles0 Overworld2Gfx, v0Tiles0
	ret

LoadOverworld5Gfx:
	decompress_tiles0 Overworld5Gfx, v0Tiles0
	ret

LoadOverworld6Gfx:
	decompress_tiles0 Overworld6Gfx, v0Tiles0
	ret

LoadOverworldArrowsGfx:
	decompress_tiles0 OverworldArrowsGfx, v0Tiles1
	ret

LoadOverworldGlowGfx:
	decompress_tiles1 OverworldGlowGfx, v1Tiles0, $20
	ret

LoadMapSidePals:
	farcall _LoadMapSidePals
	ret

LoadPalsForOWScene:
	call .CheckIfIsUnlockedExit
	farcall _LoadPalsForOWScene
	ret

.CheckIfIsUnlockedExit:
	xor a ; FALSE
	ld [wOWExitUnlocked], a
	ld a, [wOWSceneAction]
	cp UNLOCK_LEVEL
	ret nz
	ld hl, wOWSceneMapSide
	ld a, [hli]
	ld c, [hl] ; wOWSceneActionParam
	ld hl, UnlockableConnections
	call GetCthWordFromAthTable
	ld a, [hl]
	cp OW_EXITS
	ret c
	; either OW_EXIT_RIGHT or OW_EXIT_LEFT
	ld a, TRUE
	ld [wOWExitUnlocked], a
	ret

Func_80ae7:
	ld bc, OverworldWestTilemap
	ld d, BANK(OverworldWestTilemap)
	ld hl, OverworldWestAttrmap
	ld e, BANK(OverworldWestAttrmap)
	call LoadBGMapsToWRAM
	ret

Func_80af5:
	ld bc, OverworldSouthTilemap
	ld d, BANK(OverworldSouthTilemap)
	ld hl, OverworldSouthAttrmap
	ld e, BANK(OverworldSouthAttrmap)
	call LoadBGMapsToWRAM
	ld a, EVENT_REVEAL_CASTLE
	call Func_819c6
	ret z
	ld hl, Data_8561f
	farcall Func_854ee
	ret

Func_80b1b:
	ld bc, OverworldEastTilemap
	ld d, BANK(OverworldEastTilemap)
	ld hl, OverworldEastAttrmap
	ld e, BANK(OverworldEastAttrmap)
	call LoadBGMapsToWRAM
	ret

ClearOWWRAM:
	ld hl, STARTOF("OW WRAM")
	ld bc, SIZEOF("OW WRAM")
	xor a
	call WriteAToHL_BCTimes
	ret

; copies from wTilemap to v0BGMap0
; and from wAttrmap to v1BGMap0
WriteBGMapFromWRAM:
	ld hl, wTilemap
	ld de, v0BGMap0
	ld bc, 19 * BG_MAP_WIDTH
	call CopyHLToDE_BC
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, wAttrmap
	ld de, v1BGMap0
	ld bc, 19 * BG_MAP_WIDTH
	call CopyHLToDE_BC
	xor a
	ldh [rVBK], a
	ret

Func_80b54:
	ld a, $1e
	ld [w2d032], a
	ld a, $04
	ld [w2d035], a
	ld a, $24
	ld [w2d038], a
	ld [w2d03b], a
	ld a, $0e
	ld [w2d03e], a
	ld a, $14
	ld [w2d041], a

	xor a
	ld [w2d031], a
	ld [wCloudType], a
	ld [w2d049], a
	ld [w2d033], a
	ld [w2d036], a
	ld [w2d039], a
	ld [w2d03c], a
	ld [w2d03f], a
	ld [w2d042], a
	ld [w2d034], a
	ld [w2d037], a
	ld [w2d03a], a
	ld [w2d03d], a
	ld [w2d040], a
	ld [w2d043], a

	ld a, $10
	ld [w2d046], a

	xor a
	ld [w2d044], a
	ld [w2d047], a
	ld [w2d048], a

	ld a, [wCurMapSide]
	cp WEST
	jr z, .asm_80bbd
	cp SOUTH
	jr z, .asm_80bc3
	cp EAST
	jr z, .asm_80bbd
	ret
.asm_80bbd
	ld a, $01
	ld [wCloudType], a
	ret
.asm_80bc3
	ld a, $04
	ld [w2d03b], a
	ret

LoadCloudAndSeaGfx:
	farcall _LoadCloudAndSeaGfx
	ret

Func_80bd9:
	hlbgcoord 0, 14, wAttrmap
	res BGB_PRI, [hl]

	; reset BG priority inside a
	; 3x4 rectangle, at coord (0, 15)
	ld de, 15 * BG_MAP_WIDTH
	ld c, 4
.loop_outer
	ld hl, wAttrmap
	add hl, de
	ld b, 3
.loop_inner
	res BGB_PRI, [hl]
	inc hl
	dec b
	jr nz, .loop_inner
	dec c
	ret z
	ld hl, BG_MAP_WIDTH
	add hl, de
	ld e, l
	ld d, h
	jr .loop_outer
