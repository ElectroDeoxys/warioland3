; \1 = x coord
; \2 = y coord
; \3 = unknown 1
; \4 = unknown 2
MACRO ow_coord
IF (\1) != -1
DEF x = \1 + (\2 * BG_MAP_WIDTH)
	db ((x & $1e0) >> 2)
	db ((x & $01f) << 3)
ELSE
	db -1
	db -1
ENDC
	db \3, \4
ENDM

MapLevelCoords:
	dw .North
	dw .West
	dw .South
	dw .East

.North:
	ow_coord  7,  5, 8,  8 ; OWNORTH_THE_TEMPLE
	ow_coord  3,  5, 8, -4 ; OWNORTH_OUT_OF_THE_WOODS
	ow_coord  3, 10, 4, -4 ; OWNORTH_THE_PEACEFUL_VILLAGE
	ow_coord 10,  8, 4,  4 ; OWNORTH_THE_VAST_PLAIN
	ow_coord  8, 10, 4,  4 ; OWNORTH_BANK_OF_THE_WILD_RIVER
	ow_coord 11, 12, 4,  4 ; OWNORTH_THE_TIDAL_COAST
	ow_coord 17, 12, 4,  4 ; OWNORTH_SEA_TURTLE_ROCKS
	ow_coord  3,  8, 4, -4 ; OWNORTH_JUNCTION
	ow_coord -1, -1, 0,  0
	ow_coord -1, -1, 0,  0
	ow_coord -1, -1, 0,  0
	ow_coord -1, -1, 0,  0
	ow_coord -1, -1, 0,  0
	ow_coord -1, -1, 0,  0
	ow_coord 19,  7, 0,  0 ; OW_EXIT_RIGHT
	ow_coord  0, 10, 4,  0 ; OW_EXIT_LEFT

.West:
	ow_coord  2, 10,  8, 12 ; OWWEST_DESERT_RUINS
	ow_coord  7,  7,  8, 12 ; OWWEST_THE_VOLCANOS_BASE
	ow_coord  9, 10,  4, 12 ; OWWEST_THE_POOL_OF_RAIN
	ow_coord 15,  8,  8, -4 ; OWWEST_A_TOWN_IN_CHAOS
	ow_coord  9, 14,  4, 12 ; OWWEST_BENEATH_THE_WAVES
	ow_coord  9,  2, 12, 12 ; OWWEST_THE_WEST_CRATER
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord 19,  5, -1,  0 ; OW_EXIT_RIGHT
	ow_coord  0, 10,  8,  0 ; OW_EXIT_LEFT

.South:
	ow_coord  2,  8,  4,  4 ; OWSOUTH_THE_GRASSLANDS
	ow_coord  6,  8,  4, 12 ; OWSOUTH_THE_BIG_BRIDGE
	ow_coord 13,  8,  4, 12 ; OWSOUTH_TOWER_OF_REVIVAL
	ow_coord 10, 11,  4,  4 ; OWSOUTH_THE_STEEP_CANYON
	ow_coord  8,  3,  8, 12 ; OWSOUTH_CAVE_OF_FLAMES
	ow_coord 17,  2, 12,  4 ; OWSOUTH_ABOVE_THE_CLOUDS
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord 19,  8,  4,  0 ; OW_EXIT_RIGHT
	ow_coord  0,  8,  4,  0 ; OW_EXIT_LEFT

.East:
	ow_coord  2, 10,  8, 12 ; OWEAST_THE_STAGNANT_SWAMP
	ow_coord 11, 13,  4, 12 ; OWEAST_THE_FRIGID_SEA
	ow_coord  7,  7,  4, 12 ; OWEAST_CASTLE_OF_ILLUSIONS
	ow_coord 11,  9,  8, 12 ; OWEAST_THE_COLOSSAL_HOLE
	ow_coord 16, 11,  4, 12 ; OWEAST_THE_WARPED_VOID
	ow_coord  7,  2, 12, 12 ; OWEAST_THE_EAST_CRATER
	ow_coord 16,  7,  4, 12 ; OWEAST_FOREST_OF_FEAR
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord 19,  7,  4,  0 ; OW_EXIT_RIGHT
	ow_coord  0, 10,  8,  0 ; OW_EXIT_LEFT

Data_8023e:
	dw .North
	dw .West
	dw .South
	dw .East

.North
; OWNORTH_THE_TEMPLE
	db $80 ; right
	db OWNORTH_OUT_OF_THE_WOODS ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $01 ; left
	db $00 ; up
	db $00 ; down

; OWNORTH_OUT_OF_THE_WOODS
	db OWNORTH_THE_TEMPLE ; right
	db $80 ; left
	db $80 ; up
	db OWNORTH_JUNCTION ; down

	db $01 ; right
	db $00 ; left
	db $00 ; up
	db $01 ; down

; OWNORTH_THE_PEACEFUL_VILLAGE
	db $80 ; right
	db OW_EXIT_LEFT ; left
	db OWNORTH_JUNCTION ; up
	db $80 ; down

	db $00 ; right
	db $01 ; left
	db $01 ; up
	db $00 ; down

; OWNORTH_THE_VAST_PLAIN
	db OW_EXIT_RIGHT ; right
	db OWNORTH_JUNCTION ; left
	db $80 ; up
	db OWNORTH_BANK_OF_THE_WILD_RIVER ; down

	db $04 ; right
	db $01 ; left
	db $00 ; up
	db $02 ; down

; OWNORTH_BANK_OF_THE_WILD_RIVER
	db OWNORTH_THE_VAST_PLAIN ; right
	db $80 ; left
	db $80 ; up
	db OWNORTH_THE_TIDAL_COAST ; down

	db $03 ; right
	db $00 ; left
	db $00 ; up
	db $02 ; down

; OWNORTH_THE_TIDAL_COAST
	db OWNORTH_SEA_TURTLE_ROCKS ; right
	db OWNORTH_BANK_OF_THE_WILD_RIVER ; left
	db $80 ; up
	db $80 ; down

	db $01 ; right
	db $03 ; left
	db $00 ; up
	db $00 ; down

; OWNORTH_SEA_TURTLE_ROCKS
	db $80 ; right
	db OWNORTH_THE_TIDAL_COAST ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $01 ; left
	db $00 ; up
	db $00 ; down

; OWNORTH_JUNCTION
	db OWNORTH_THE_VAST_PLAIN ; right
	db $80 ; left
	db OWNORTH_OUT_OF_THE_WOODS ; up
	db OWNORTH_THE_PEACEFUL_VILLAGE ; down

	db $01 ; right
	db $00 ; left
	db $01 ; up
	db $01 ; down


.West
; OWWEST_DESERT_RUINS
	db $80 ; right
	db OW_EXIT_LEFT ; left
	db OWWEST_THE_VOLCANOS_BASE ; up
	db $80 ; down

	db $00 ; right
	db $01 ; left
	db $02 ; up
	db $00 ; down

; OWWEST_THE_VOLCANOS_BASE
	db $80 ; right
	db OWWEST_DESERT_RUINS ; left
	db OWWEST_THE_WEST_CRATER ; up
	db OWWEST_THE_POOL_OF_RAIN ; down

	db $00 ; right
	db $03 ; left
	db $02 ; up
	db $02 ; down

; OWWEST_THE_POOL_OF_RAIN
	db OWWEST_A_TOWN_IN_CHAOS ; right
	db OWWEST_THE_VOLCANOS_BASE ; left
	db $80 ; up
	db OWWEST_BENEATH_THE_WAVES ; down

	db $03 ; right
	db $03 ; left
	db $00 ; up
	db $01 ; down

; OWWEST_A_TOWN_IN_CHAOS
	db $80 ; right
	db $80 ; left
	db OW_EXIT_RIGHT ; up
	db OWWEST_THE_POOL_OF_RAIN ; down

	db $00 ; right
	db $00 ; left
	db $02 ; up
	db $02 ; down

; OWWEST_BENEATH_THE_WAVES
	db $80 ; right
	db $80 ; left
	db OWWEST_THE_POOL_OF_RAIN ; up
	db $80 ; down

	db $00 ; right
	db $00 ; left
	db $01 ; up
	db $00 ; down

; OWWEST_THE_WEST_CRATER
	db $80 ; right
	db OWWEST_THE_VOLCANOS_BASE ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $03 ; left
	db $00 ; up
	db $00 ; down


.South
; OWSOUTH_THE_GRASSLANDS
	db OWSOUTH_THE_BIG_BRIDGE ; right
	db OW_EXIT_LEFT ; left
	db $80 ; up
	db $80 ; down

	db $01 ; right
	db $01 ; left
	db $00 ; up
	db $00 ; down

; OWSOUTH_THE_BIG_BRIDGE
	db OWSOUTH_TOWER_OF_REVIVAL ; right
	db OWSOUTH_THE_GRASSLANDS ; left
	db OWSOUTH_CAVE_OF_FLAMES ; up
	db OWSOUTH_THE_STEEP_CANYON ; down

	db $01 ; right
	db $01 ; left
	db $02 ; up
	db $02 ; down

; OWSOUTH_TOWER_OF_REVIVAL
	db OW_EXIT_RIGHT ; right
	db OWSOUTH_THE_BIG_BRIDGE ; left
	db OWSOUTH_ABOVE_THE_CLOUDS ; up
	db $80 ; down

	db $01 ; right
	db $01 ; left
	db $02 ; up
	db $00 ; down

; OWSOUTH_THE_STEEP_CANYON
	db $80 ; right
	db OWSOUTH_THE_BIG_BRIDGE ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $03 ; left
	db $00 ; up
	db $00 ; down

; OWSOUTH_CAVE_OF_FLAMES
	db $80 ; right
	db OWSOUTH_THE_BIG_BRIDGE ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $03 ; left
	db $00 ; up
	db $00 ; down

; OWSOUTH_ABOVE_THE_CLOUDS
	db $80 ; right
	db OWSOUTH_TOWER_OF_REVIVAL ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $03 ; left
	db $00 ; up
	db $00 ; down


.East
; OWEAST_THE_STAGNANT_SWAMP
	db $80 ; right
	db OW_EXIT_LEFT ; left
	db OWEAST_CASTLE_OF_ILLUSIONS ; up
	db OWEAST_THE_FRIGID_SEA ; down

	db $00 ; right
	db $01 ; left
	db $02 ; up
	db $02 ; down

; OWEAST_THE_FRIGID_SEA
	db $80 ; right
	db OWEAST_THE_STAGNANT_SWAMP ; left
	db OWEAST_THE_COLOSSAL_HOLE ; up
	db $80 ; down

	db $00 ; right
	db $03 ; left
	db $01 ; up
	db $00 ; down

; OWEAST_CASTLE_OF_ILLUSIONS
	db $80 ; right
	db OWEAST_THE_STAGNANT_SWAMP ; left
	db OWEAST_THE_EAST_CRATER ; up
	db $80 ; down

	db $00 ; right
	db $03 ; left
	db $01 ; up
	db $00 ; down

; OWEAST_THE_COLOSSAL_HOLE
	db $80 ; right
	db $80 ; left
	db OWEAST_FOREST_OF_FEAR ; up
	db OWEAST_THE_FRIGID_SEA ; down

	db $00 ; right
	db $00 ; left
	db $02 ; up
	db $01 ; down

; OWEAST_THE_WARPED_VOID
	db $80 ; right
	db $80 ; left
	db OWEAST_FOREST_OF_FEAR ; up
	db $80 ; down

	db $00 ; right
	db $00 ; left
	db $01 ; up
	db $00 ; down

; OWEAST_THE_EAST_CRATER
	db $80 ; right
	db $80 ; left
	db $80 ; up
	db OWEAST_CASTLE_OF_ILLUSIONS ; down

	db $00 ; right
	db $00 ; left
	db $00 ; up
	db $01 ; down

; OWEAST_FOREST_OF_FEAR
	db OW_EXIT_RIGHT ; right
	db OWEAST_THE_COLOSSAL_HOLE ; left
	db $80 ; up
	db OWEAST_THE_WARPED_VOID ; down

	db $01 ; right
	db $03 ; left
	db $00 ; up
	db $01 ; down

Data_8031e:
	dw .North ; NORTH
	dw .West ; WEST
	dw .South ; SOUTH
	dw .East ; EAST

.North
; OW_EXIT_RIGHT
	db $80 ; right
	db OWNORTH_THE_VAST_PLAIN ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $04 ; left
	db $00 ; up
	db $00 ; down

; OW_EXIT_LEFT
	db OWNORTH_THE_PEACEFUL_VILLAGE ; right
	db $80 ; left
	db $80 ; up
	db $80 ; down

	db $01 ; right
	db $00 ; left
	db $00 ; up
	db $00 ; down

.West
; OW_EXIT_RIGHT
	db $80 ; right
	db OWWEST_A_TOWN_IN_CHAOS ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $03 ; left
	db $00 ; up
	db $00 ; down

; OW_EXIT_LEFT
	db OWWEST_DESERT_RUINS ; right
	db $80 ; left
	db $80 ; up
	db $80 ; down

	db $01 ; right
	db $00 ; left
	db $00 ; up
	db $00 ; down

.South
; OW_EXIT_RIGHT
	db $80 ; right
	db OWSOUTH_TOWER_OF_REVIVAL ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $01 ; left
	db $00 ; up
	db $00 ; down

; OW_EXIT_LEFT
	db OWSOUTH_THE_GRASSLANDS ; right
	db $80 ; left
	db $80 ; up
	db $80 ; down

	db $01 ; right
	db $00 ; left
	db $00 ; up
	db $00 ; down

.East
; OW_EXIT_RIGHT
	db $80 ; right
	db OWEAST_FOREST_OF_FEAR ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $01 ; left
	db $00 ; up
	db $00 ; down

; OW_EXIT_LEFT
	db OWEAST_THE_STAGNANT_SWAMP ; right
	db $80 ; left
	db $80 ; up
	db $80 ; down

	db $01 ; right
	db $00 ; left
	db $00 ; up
	db $00 ; down

; gets from wTreasuresCollected the flags
; related to the crayon treasures
; and saves it in wCrayonFlags
GetCrayonFlags:
	ld hl, wTreasuresCollected + (CRAYON_YELLOW_T / 8)
	ld a, [hld]
	ld c, [hl]
	sla c
	rla
	sla c
	rla
	res 7, a
	ld [wCrayonFlags], a
	ret

; switches day/night in the overworld
; except if it's the East side and
; the Sun Medallion hasn't been collected yet
DoDayNightSpell:
	ld a, [wCurMapSide]
	cp EAST
	jr nz, SwitchDayNight
	; east side
	ld a, [wGotSunMedallion]
	and a
	jr nz, SwitchDayNight
	ld hl, wDayNight
	res 4, [hl]
	ret

; flips bit 4 of wDayNight
SwitchDayNight:
	ld hl, wDayNight
	ld a, $1 << 4
	xor [hl]
	ld [hl], a
	ret

OverworldStateTable::
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw InitOverworld
	dw SlowFadeFromWhite
	dw Func_804ec
	dw FastFadeToWhite

	dw Func_804f7           ; SST_OVERWORLD_05
	dw SlowFadeFromWhite
	dw Func_80540

	dw FadeBGToWhite_Normal ; SST_OVERWORLD_08
	dw InitMapSide           ; SST_OVERWORLD_09
	dw DarkenBGToPal_Normal
	dw Func_805d7           ; SST_OVERWORLD_0B

	dw FadeBGToWhite_Normal ; SST_OVERWORLD_COLLECTION
	dw InitTreasureCollection
	dw DarkenBGToPal_Normal
	dw TreasureCollection
	dw FadeBGToWhite_Normal

	dw Func_80d6c           ; SST_OVERWORLD_11
	dw DarkenBGToPal_Normal
	dw Func_80d7c
	dw FadeBGToWhite_Normal
	dw Func_80db1

	dw FadeBGToWhite_Normal ; SST_OVERWORLD_BEST_TIME_LIST
	dw InitBestTimeList
	dw DarkenBGToPal_Normal
	dw BestTimeList

	dw FadeBGToWhite_Normal ; SST_OVERWORLD_1A
	dw InitTempleScene
	dw DarkenBGToPal_Normal
	dw UpdateTempleScene
	dw Func_80e33

	dw FadeBGToWhite_Normal
	dw GolfBuilding           ; SST_OVERWORLD_20
	dw DarkenBGToPal_Normal
	dw Func_80e55

	dw FastFadeToWhite ; SST_OVERWORLD_EPILOGUE
	dw InitEpilogue
	dw SlowFadeFromWhite
	dw Func_80e75
	dw Func_80e85

Func_803e6:
	ld a, [wTransitionParam]
	and a
	ret z
	ld a, [wTopBarState]
	and a
	ret nz
	ld a, [wMapSideLevelID]
	cp OW_EXITS
	ret nc
	jp Func_15dc

InitOverworld:
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	stop_music2

	ld a, [wTransitionParam]
	ld [wLastTransitionParam], a
	xor a
	ld [wRoomAnimatedTilesEnabled], a

	ld a, [wLastTransitionParam]
	inc a
	jr nz, .skip_set_first_treasure_flag
	; TRANSITION_NEW_GAME
	ld hl, wTreasuresCollected
	set 0, [hl]
.skip_set_first_treasure_flag

	call GetCrayonFlags

	ld a, [wTopBarState]
	cp TOPBARST_INPUT
	jr z, .skip_get_level_index
	ld a, [wOWLevel]
	cp LEVEL_GOLF_BUILDING
	jp nc, .GolfBuilding
	ld b, a
	call GetMapLevelID
	ld a, b
	ld [wNextMapSide], a
	ld a, d
	ld [wMapSideLevelID], a
.skip_get_level_index
	call Func_80b29

	ld a, [wLastTransitionParam]
	and a
	jr z, .asm_8048a ; == 0
	cp TRANSITION_RETURN_TO_MAP
	jr z, .asm_8048a
	cp TRANSITION_EPILOGUE_NOT_PERFECT
	jr z, .asm_804a9
	cp TRANSITION_EPILOGUE_PERFECT
	jr z, .asm_804a9
	cp TRANSITION_GAME_OVER
	jr z, .asm_804b5
	inc a
	jr nz, .asm_8045f

	; TRANSITION_NEW_GAME
	ld a, CUTSCENE_01
	ld [w2d025], a
	jr .asm_80466
.asm_8045f
	call Func_8197e
	jr nz, .asm_80466
	jr .asm_8048a

.asm_80466
	call Func_804c9
	farcall Func_9c005
	ld a, [w2d01e]
	and a
	jr z, .asm_80480
	jr .asm_804a0

.asm_80480
	ld a, [w2d025]
	call GetCutsceneOWParams
	jr z, .asm_8048a
	jr .asm_80497

.asm_8048a
	xor a ; CUTSCENE_00
	ld [w2d025], a
	ld a, SST_OVERWORLD_09
	ld [wSubState], a
	call Func_803e6
	ret

.asm_80497
	call Func_804d4
	ld a, SST_OVERWORLD_05
	ld [wSubState], a
	ret

.asm_804a0
	call Func_804d4
	ld a, SST_OVERWORLD_11
	ld [wSubState], a
	ret

.asm_804a9
	ld a, TRANSITION_RETURN_TO_MAP
	ld [w2d00d], a
	ld a, CUTSCENE_5A
	ld [w2d025], a
	jr .asm_80480

.asm_804b5
	call Func_803e6
	ret

.GolfBuilding
	xor a
	ld [wNextMapSide], a
	ld [wMapSideLevelID], a
	ld a, SST_OVERWORLD_20
	ld [wSubState], a
	call Func_803e6
	ret

Func_804c9:
	ld a, [wTopBarState]
	and a
	ret nz
	ld a, TRANSITION_RETURN_TO_MAP
	ld [w2d00d], a
	ret

Func_804d4:
	ld a, [wTopBarState]
	and a
	ret nz
	ld a, [wOWCutsceneAction]
	cp SPECIAL_ACTION
	ret z
	ld a, [wLastTransitionParam]
	cp TRANSITION_EPILOGUE_NOT_PERFECT
	ret z
	cp TRANSITION_EPILOGUE_PERFECT
	ret z
	ld [w2d00d], a
	ret

; waits for A button input
Func_804ec:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	ld hl, wSubState
	inc [hl]
	ret

Func_804f7:
	call DisableLCD
	stop_music2

	call Func_80b29
	call VBlank_80cb1
	call ClearVirtualOAM

	xor a
	ld [w2d011], a
	ld a, [w2d015]
	ld [w2d018], a
	ld a, [wCutsceneActionParam]
	ld [wTempUnlockableConnectionID], a
	ld a, [wOWCutsceneAction]
	ld [wTempOWCutsceneAction], a
	ld a, [wCutsceneOWParamsPtr + 0]
	ld [wTempCutsceneOWParamsPtr + 0], a
	ld a, [wCutsceneOWParamsPtr + 1]
	ld [wTempCutsceneOWParamsPtr + 1], a

	ld a, [wCutsceneMapSide]
	ld [wCurMapSide], a
	jumptable

	dw Func_80851 ; NORTH
	dw Func_8091e ; WEST
	dw Func_80930 ; SOUTH
	dw Func_8094e ; EAST

Func_80540:
	call Func_818ad
	call Func_82bb8
	call Func_82bda
	farcall Func_b4a37
	call AddCompassSprite
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

	call Func_80b29
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
	call AddCompassSprite
	call ClearUnusedVirtualOAM
	ret

InitNorthMapSide:
	call LoadMapSidePals
	call LoadOverworld1Gfx
	call LoadOverworldCommonGfx
	call LoadOverworldArrowsGfx
	ld bc, BGMap_85bef
	ld d, BANK(BGMap_85bef)
	ld hl, BGMap_85d79
	ld e, BANK(BGMap_85d79)
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
	ld a, CUTSCENE_1B
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

.Func_80655
	ld a, KEY_CARD_RED
	call IsTreasureCollected
	jp z, Func_804c9
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

	decompress_vram0 BGMap_85b91, v0BGMap0 + $3a0
	decompress_vram1 BGMap_85bc4, v1BGMap0 + $3a0

	ld a, [wTopBarState]
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
	call Func_80bc9

	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jr nz, .asm_80753
	decompress_vram0 BGMap_86868, v0BGMap1
	decompress_vram1 BGMap_868b2, v1BGMap1
	jr .asm_80790
.asm_80753
	decompress_vram0 BGMap_868f5, v0BGMap1
	decompress_vram1 BGMap_86929, v1BGMap1
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

	ld a, [wTopBarState]
	cp TOPBARST_INPUT
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

	ld a, [wTopBarState]
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

Func_80851:
	call Func_80ab5
	call LoadOverworldCommonGfx
	call LoadOverworld1Gfx
	ld a, [w2d025]
	cp CUTSCENE_35
	call nz, LoadOverworldGlowGfx

	ld bc, BGMap_85bef
	ld d, BANK(BGMap_85bef)
	ld hl, BGMap_85d79
	ld e, BANK(BGMap_85d79)
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
	ld [wCutsceneActionParam], a
	ld a, [wTempOWCutsceneAction]
	ld [wOWCutsceneAction], a
	ld a, [wCurMapSide]
	ld [wCutsceneMapSide], a
	ld a, [wTempCutsceneOWParamsPtr + 0]
	ld [wCutsceneOWParamsPtr + 0], a
	ld a, [wTempCutsceneOWParamsPtr + 1]
	ld [wCutsceneOWParamsPtr + 1], a

	farcall Func_b4a37
	call Func_80bc9

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
	ld c, $00
	ld hl, LevelNamesNorthJPGfx + (7 * $200)
	ld de, v1Tiles2 + $500
	call CopyFarBytes
	ld b, $24
	ld a, [wLanguage]
	add b
	ld b, a
	ld c, $00
	ld hl, LevelNamesNorthJPGfx + (7 * $200)
	ld de, v1Tiles2 + $600
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
	ld a, [w2d025]
	cp CUTSCENE_2F
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

Func_8091e:
	call Func_80ab5
	call LoadOverworld2Gfx
	call LoadOverworldCommonGfx
	call LoadOverworldGlowGfx
	call Func_80ae7
	jp Func_8086f

Func_80930:
	ld a, [w2d025]
	cp CUTSCENE_57
	jr nz, .asm_8093c
	ld a, $01
	ld [w2d011], a
.asm_8093c
	call Func_80ab5
	call LoadOverworld5Gfx
	call LoadOverworldCommonGfx
	call LoadOverworldGlowGfx
	call Func_80af5
	jp Func_8086f

Func_8094e:
	ld a, CUTSCENE_1B
	call Func_819c6
	ld [wGotSunMedallion], a
	ld a, [wGotSunMedallion] ; unnecessary
	and a
	jr nz, .got_medallion
	ld a, $01
	ld [w2d011], a
.got_medallion
	call Func_80ab5
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
	decompress_vram1 OverworldCommonGfx, v1Tiles0
	decompress_vram1 OverworldNumbersGfx, v1Tiles0 tile $60
	ret

LoadOverworld1Gfx:
	decompress_vram0 Overworld1Gfx, v0Tiles0
	ret

LoadOverworld2Gfx:
	decompress_vram0 Overworld2Gfx, v0Tiles0
	ret

LoadOverworld5Gfx:
	decompress_vram0 Overworld5Gfx, v0Tiles0
	ret

LoadOverworld6Gfx:
	decompress_vram0 Overworld6Gfx, v0Tiles0
	ret

LoadOverworldArrowsGfx:
	decompress_vram0 OverworldArrowsGfx, v0Tiles1
	ret

LoadOverworldGlowGfx:
	decompress_vram1 OverworldGlowGfx, v1Tiles0 tile $20
	ret

LoadMapSidePals:
	farcall _LoadMapSidePals
	ret

Func_80ab5:
	call .Func_80ac8
	farcall Func_8540a
	ret

.Func_80ac8:
	xor a ; FALSE
	ld [w2dfff], a
	ld a, [wOWCutsceneAction]
	cp UNLOCK_LEVEL
	ret nz
	ld hl, wCutsceneMapSide
	ld a, [hli]
	ld c, [hl] ; wCutsceneActionParam
	ld hl, UnlockableConnections
	call GetCthWordFromAthTable
	ld a, [hl]
	cp OW_EXITS
	ret c
	; either OW_EXIT_RIGHT or OW_EXIT_LEFT
	ld a, TRUE
	ld [w2dfff], a
	ret

Func_80ae7:
	ld bc, BGMap_85f07
	ld d, BANK(BGMap_85f07)
	ld hl, BGMap_860ff
	ld e, BANK(BGMap_860ff)
	call LoadBGMapsToWRAM
	ret

Func_80af5:
	ld bc, BGMap_86292
	ld d, BANK(BGMap_86292)
	ld hl, BGMap_86417
	ld e, BANK(BGMap_86417)
	call LoadBGMapsToWRAM
	ld a, CUTSCENE_19
	call Func_819c6
	ret z
	ld hl, Data_8561f
	farcall Func_854ee
	ret

Func_80b1b:
	ld bc, BGMap_86546
	ld d, BANK(BGMap_86546)
	ld hl, BGMap_86700
	ld e, BANK(BGMap_86700)
	call LoadBGMapsToWRAM
	ret

; clears wOWPendingTileUpdate onwards
; seems like level-related stuff
Func_80b29:
	ld hl, wOWPendingTileUpdate
	ld bc, $7a0
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
	ld [w2d030], a
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
	ld [w2d030], a
	ret
.asm_80bc3
	ld a, $04
	ld [w2d03b], a
	ret

Func_80bc9:
	farcall Func_1d8bf7
	ret

Func_80bd9:
	hlbgcoord 0, 14, wAttrmap
	res 7, [hl]

	; reset BG priority inside a
	; 3x4 rectangle, at coord (0, 15)
	ld de, 15 * BG_MAP_WIDTH
	ld c, 4
.loop_outer
	ld hl, wAttrmap
	add hl, de
	ld b, 3
.loop_inner
	res 7, [hl]
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

VBlank_Overworld:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, [wWY]
	ldh [rWY], a
	ld a, [wWX]
	add $07
	ldh [rWX], a

	ld b, BANK(Func_1d8c2c)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call Func_1d8c2c
	pop af
	bankswitch

	ld hl, wPalConfig1
	ld a, [hl]
	and a
	jr z, .asm_80c5b
	ld c, a
	xor a
	ld [hli], a
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld l, [hl]
	ld h, a
.asm_80c48
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .asm_80c48

.asm_80c5b
	ld a, [wHDMABank]
	ld b, a
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld hl, wHDMA
	ld a, [hl]
	and a
	jr z, .asm_80c84
	ld b, [hl]
	xor a
	ld [hli], a
	ld a, b
	ld c, LOW(rHDMA1)
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a

.asm_80c84
	ld hl, w2d0b5
	ld a, [hl]
	and a
	jr z, .asm_80ca2
	ld b, a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	xor a
	ld [hli], a
	ld a, b
	ld c, LOW(rHDMA1)
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
.asm_80ca2
	pop af
	bankswitch
	xor a
	ldh [rVBK], a

	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.end

VBlank_80cb1:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, $02
	ldh [rSVBK], a
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a

	ld a, [wOWPendingTileUpdate]
	and a
	jr z, .skip_update_tiles
	ld c, LOW(rHDMA1)
	ld a, HIGH(wTilemap)
	ld [$ff00+c], a
	inc c
	xor a ; LOW(wTilemap)
	ld [$ff00+c], a
	inc c
	ld a, $18
	ld [$ff00+c], a
	inc c
	xor a
	ld [$ff00+c], a
	inc c
	ld a, $1d
	ld [$ff00+c], a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld c, LOW(rHDMA1)
	ld a, HIGH(wAttrmap)
	ld [$ff00+c], a
	inc c
	xor a ; LOW(wAttrmap)
	ld [$ff00+c], a
	inc c
	ld a, $18
	ld [$ff00+c], a
	inc c
	xor a
	ld [$ff00+c], a
	inc c
	ld a, $1d
	ld [$ff00+c], a
	xor a
	ld [wOWPendingTileUpdate], a

.skip_update_tiles
	ld a, [wHDMABank]
	and a
	jr z, .asm_80d1b
	ld b, a
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call Func_3c03
	pop af
	bankswitch

.asm_80d1b
	xor a
	ldh [rVBK], a
	ld b, BANK(Func_1d8c2c)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call Func_1d8c2c
	pop af
	bankswitch

	ld b, BANK(ApplyPalConfig1)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld a, [wPalConfig1Register]
	and a
	call nz, ApplyPalConfig1
	ld a, [wPalConfig2]
	and a
	call nz, ApplyPalConfig2
	pop af
	bankswitch

	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.end

; unreferenced
UnreferencedOpenTreasureCollection:
	ld a, [wSubState]
	jumptable
	dw FadeBGToWhite_Normal
	dw InitTreasureCollection
	dw DarkenBGToPal_Normal
	dw TreasureCollection
	dw FadeBGToWhite_Normal
	dw ReturnToPauseMenuFromActionHelp

Func_80d6c:
	farcall Func_9c021
	ret

Func_80d7c:
	call Func_80d92
	farcall Func_9ce28
	call ClearUnusedVirtualOAM
	ret

Func_80d92:
	ld a, [wTopBarState]
	and a
	ret z
	ld a, [w2d013]
	cp $01
	ret c
	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	ret z
	pop hl
	ld hl, wSubState
	inc [hl]
	stop_sfx
	ret

Func_80db1:
	jp InitOverworld.asm_80480

; de = scene obj
; c = level index in wCurMapSide
SetObjPositionToLevelCoords:
	ld a, c
	push de
	call GetMapLevelCoords
	pop de
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	ret

InitTreasureCollection:
	farcall _InitTreasureCollection
	ret

TreasureCollection:
	farcall _TreasureCollection
	ret

Func_80de0:
	xor a
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	ret z
	ld a, [wJoypadPressed]
	bit START_F, a
	ret z
	ld a, SST_OVERWORLD_BEST_TIME_LIST
	ld [wSubState], a
	ret

InitBestTimeList:
	farcall _InitBestTimeList
	ret

BestTimeList:
	farcall _BestTimeList
	ret

InitTempleScene:
	farcall _InitTempleScene
	ret

UpdateTempleScene:
	farcall _UpdateTempleScene
	ret

Func_80e33:
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jr nz, .b_btn
	ld hl, wSubState
	inc [hl]
	ret
.b_btn
	ld a, SST_OVERWORLD_08
	ld [wSubState], a
	ret

GolfBuilding:
	farcall _GolfBuilding
	ret

Func_80e55:
	farcall Func_adbfe
	ret

InitEpilogue:
	farcall _InitEpilogue
	ret

Func_80e75:
	farcall Func_af13c
	ret

Func_80e85:
	call Func_803e6
	ret

Func_80e89:
	call ProcessDPadRepeat
	farcall UpdateMapSideOWAnimations
	farcall UpdateCommonOWAnimations

	call UpdateTopBar
	ld a, [wTopBarState]
	and a
	jp nz, Func_81055

	call HandleBottomBar
	call DrawBottomBar

	farcall Func_852e5
	ld hl, w2d014
	inc [hl]
	ld a, [w2d013]
	jumptable

	dw Func_80ee7
	dw Func_80f0d
	dw Func_80f3c
	dw Func_80fb8
	dw Func_80fd6
	dw Func_80ff7
	dw Func_810bb
	dw Func_8115c
	dw Func_811cf
	dw Func_81200
	dw Func_81346

Func_80ee7:
	call Func_8212c
	call GetOWAllowedDPadInput
	ld a, [wMapSideLevelID]
	ld [wLevel2], a
	ld [w2d068], a
	xor a
	ld [wPalConfig1TotalSteps], a
	ld [w2d0e0], a
	ld [wOWPalTransitionState], a
	call Func_81055
	ld hl, w2d014
	xor a
	ld [hl], a
	ld hl, w2d013
	inc [hl]
	ret

Func_80f0d:
	ld a, [wDayNight]
	bit 7, a
	jr nz, .asm_80f1f
	call PlayOverworldMusic
	call Func_81055
	ld hl, w2d013
	inc [hl]
	ret
.asm_80f1f
	farcall DayNightTransition
	call Func_81055
	ld a, [wOWPalTransitionState]
	and a
	ret nz
	di
	call VBlank_Overworld
	ei
	ret

Func_80f3c:
	xor a
	ld [wMagnifyingGlassCounter], a
	call Func_8212c
	call GetOWAllowedDPadInput
	ld c, $00
	ld b, $00
	ld a, [wMapSideLevelID]
	set D_LEFT_F, c
	cp OW_EXIT_RIGHT
	jr z, .is_exit
	ld c, b
	set D_RIGHT_F, c
	cp OW_EXIT_LEFT
	jr z, .is_exit

	call LoadMapLevelFromLevelIndex
	farcall Func_9aab5

	xor a
	ld [w2d014], a
	call .GetDirectionalInput
	ld b, a
	ld a, [wOWAllowedDPadInput]
	and b
	and a
	jr z, .not_allowed
	ld hl, w2d013
	ld [hl], $05
	jp Func_81034

.not_allowed
	call Func_81055
	xor a
	ld [wLevelArrowDirections1], a
	ld [w2d10e], a
	ld hl, w2d013
	inc [hl]
	ret

.is_exit
	ld a, c
	ld [wLevelArrowDirections1], a
	call Func_820e6
	call Func_81055
	xor a
	ld [w2d014], a
	ld a, $06
	ld [w2d013], a
	ret

.GetDirectionalInput
	ld a, [wJoypadDown]
	and D_PAD
	ld b, a
	rla
	jr c, .up_down ; down
	rla
	jr c, .up_down ; up
; right/left
	ld a, b
	ret
.up_down
	ld a, D_UP | D_DOWN
	and b
	ret

Func_80fb8:
	call Func_81055
	ld a, [w2d0e0]
	and a
	ret nz
	call LoadLevelNameIfValid
	ld hl, w2d013
	inc [hl]
	ret

LoadLevelNameIfValid:
	ld a, [wNextMapSide]
	ld b, a
	ld a, [wMapSideLevelID]
	ld d, a
	cp $08
	ret nc
	jp LoadLevelName

Func_80fd6:
	call Func_81055
	ld a, [wMapSideLevelID]
	cp OW_EXITS
	jr nc, .asm_80ff2
	farcall FadeInLevelName
	srl c
	ret c
.asm_80ff2
	ld hl, w2d013
	inc [hl]
	ret

Func_80ff7:
	call Func_81240
	jr c, Func_81055
	ld a, [wOWPalTransitionState]
	and a
	jr nz, Func_81055
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jr nz, .asm_81016
	ld a, [wJoypadPressed]
	bit SELECT_F, a
	jr z, .asm_81016
	ld hl, wTopBarState
	inc [hl]
	jr Func_81055

.asm_81016
	call Func_81477
	ld a, [w2d0e3]
	and a
	jr nz, Func_81055
	call Func_81077
	jr c, Func_81055
	call Func_80de0
	jr c, Func_81055
	call Func_810a9
	ld b, a
	ld a, [wOWAllowedDPadInput]
	and b
	and a
	jr z, Func_81055
;	fallthrough

Func_81034:
	ld [wLevelArrowDirections1], a
	call Func_820e6
	ld a, [w2d068]
	ld [wLevel2], a
	ld a, $03
	ld [w2d0e0], a
	xor a
	ld [wPalConfig1TotalSteps], a
	call Func_81055
	xor a
	ld [w2d014], a
	ld hl, w2d013
	inc [hl]
	ret

Func_81055:
	farcall Func_b4a3d
	call Func_82041
	farcall Func_b4aa9
	ret

Func_81077:
	ld hl, wMapSideLevelID
	ld a, [wNextMapSide]
	or [hl]
	ret nz
	; OW position is in The Temple
	ld a, [wJoypadPressed]
	bit D_UP_F, a
	ret z
	ld a, [wNextTreasure]
	cp TREASURES_END
	jr nz, .asm_81092
	ld a, [wGameModeFlags]
	bit MODE_GAME_CLEARED_F, a
	ret nz
.asm_81092
	call Func_3c76
	ld a, OWWARIO_UP
	call SetOWWarioOAM
	play_sfx SFX_113
	ld a, $0a
	ld [w2d013], a
	scf
	ret

Func_810a9:
	ld a, [wJoypadPressed]
	and D_PAD
	ld b, a
	rla
	jr c, .up_down
	rla
	jr c, .up_down
	ld a, b
	ret
.up_down
	ld a, D_UP | D_DOWN
	and b
	ret

Func_810bb:
	ld a, [wLevel1YCoord]
	ld [wLevel2YCoord], a
	ld a, [wLevel1XCoord]
	ld [wLevel2XCoord], a

	ld a, [w2d068]
	call GetMapLevelCoords
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	add b
	ld [w2d06f], a
	ld a, [hli]
	add c
	ld [w2d070], a

	ld bc, w2d071
	call Func_810fc
	call Func_821a1
	call Func_81055
	xor a
	ld [w2d014], a
	ld hl, w2d013
	inc [hl]
	ret

; a = map side level index
GetMapLevelCoords:
	add a ; *2
	ld c, a
	ld a, [wCurMapSide]
	ld hl, MapLevelCoords
	call GetCthWordFromAthTable
	ret

Func_810fc:
	ld a, [bc]
	jumptable
	dw Func_81108
	dw Func_8110d
	dw Func_8111c
	dw Func_81126
	dw Func_81130

Func_81108:
	inc c
	ld a, $ff
	ld [bc], a
	ret

Func_8110d:
	ld a, [w2d06f]
	ld [wLevel2YCoord], a
	ld a, [w2d070]
	ld [wLevel2XCoord], a
	xor a
	ld [bc], a
	ret

Func_8111c:
	ld a, [w2d06f]
	ld [wLevel2YCoord], a
	ld a, $01
	ld [bc], a
	ret

Func_81126:
	ld a, [w2d070]
	ld [wLevel2XCoord], a
	ld a, $01
	ld [bc], a
	ret

Func_81130:
	ld a, [wLevel1XCoord]
	ld e, a
	ld a, [w2d070]
	sub e
	sra a
	add e
	ld [wLevel2XCoord], a
	ld a, $02
	ld [bc], a
	ret

Func_81142:
	ld hl, w2d0a0
	bit 0, [hl]
	jr nz, .asm_81151
	ld a, $40
	bit 1, [hl]
	jr z, .asm_81157
	jr .done
.asm_81151
	ld a, $10
	bit 2, [hl]
	jr z, .done
.asm_81157
	rlca
.done
	ld [wLevelArrowDirections1], a
	ret

Func_8115c:
	call Func_82208
	ld hl, w2d10e
	bit 7, [hl]
	jr nz, .asm_81177

	ld a, [wJoypadDown]
	and D_PAD
	jr z, .asm_81175
	inc [hl]
	ld a, [hl]
	cp $06
	jr c, .asm_81175
	set 7, [hl]
.asm_81175
	bit 7, [hl]
.asm_81177
	call nz, Func_82208

	ld a, [wLevel1YCoord]
	ld [w2d100], a
	ld a, [wLevel1XCoord]
	ld [w2d101], a
	ld a, [w2d0a1]
	and a
	jr nz, .asm_8119c
	ld bc, w2d071
	call Func_810fc
	cp $ff
	jr z, .asm_811a0
	call Func_821a1
	call Func_81142
.asm_8119c
	call Func_81055
	ret

.asm_811a0
	ld a, [w2d068]
	ld [wMapSideLevelID], a
	cp OW_EXITS
	jr nc, .asm_811b1
	ld a, $02
	ld [w2d013], a
	jr .asm_8119c

.asm_811b1
	stop_music2
	play_sfx SFX_0EB

	xor a
	ld [w2d014], a
	ld hl, w2d013
	inc [hl]
	jr .asm_8119c

Func_811cf:
	ld a, [w2d014]
	cp $02
	jr c, .asm_811fc
	xor a
	ld [hl], a
	ld a, [wMapSideLevelID]
	ld b, $01
	ld c, $a8
	cp OW_EXIT_RIGHT
	jr z, .is_exit
	ld b, $ff
	ld c, $f0
	cp OW_EXIT_LEFT
	jr z, .is_exit
	debug_nop
.is_exit
	ld a, [w2d101]
	add b
	ld [w2d101], a
	cp c
	jr nz, .asm_811fc
	ld hl, w2d013
	inc [hl]
.asm_811fc
	call Func_81055
	ret

Func_81200:
	call Func_81055
	ld a, [wMapSideLevelID]
	ld b, 1
	cp OW_EXIT_RIGHT
	jr z, .is_exit
	ld b, -1
	cp OW_EXIT_LEFT
	jr z, .is_exit
	debug_nop
.is_exit
	ld a, [wNextMapSide]
	add b
	and $3
	ld [wNextMapSide], a
	ld a, [wMapSideLevelID]
	add b
	ld [wMapSideLevelID], a
	ld [w2d068], a
	ld a, [wNextMapSide]
	bit 1, a
	jr nz, .asm_81234 ; south or east?
	add b
	bit 1, a
	jr nz, .asm_8123a
.asm_81234
	ld a, SST_OVERWORLD_08
	ld [wSubState], a
	ret
.asm_8123a
	ld a, SST_OVERWORLD_1E
	ld [wSubState], a
	ret

Func_81240:
	ld a, [wOWPalTransitionState]
	and a
	jr nz, .no_carry
	ld a, [wOWLevel]
	cp $80
	jr z, .no_carry
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .no_carry
	call LoadMapLevelFromLevelIndex
	ld a, [wOWLevel]
	and a
	jr z, .temple
	xor a
	ld [wSubState], a
	ld hl, wState
	inc [hl] ; ST_LEVEL
	scf
	ret

.no_carry
	and a
	ret

.temple
	play_sfx SFX_SELECTION
	ld a, SST_OVERWORLD_1A
	ld [wSubState], a
	scf
	ret

; input:
; - b = LEVEL_* constant
; output:
; - d = map side level index
; - b and c = map side
GetMapLevelID:
; loop until a larger value than b is found
	ld hl, MapSideInitialLevels
	ld c, -1
.loop
	ld e, [hl]
	inc hl
	inc c
	ld a, [hl]
	dec a
	cp b
	jr c, .loop
; next calculate the difference
; from the previous entry in list
	ld a, b
	sub e
	ld d, a ; difference
	ld b, c ; list index
	ret

; converts the level index in wMapSideLevelID
; to a valid OW level value corresponding
; to the map side in wNextMapSide
LoadMapLevelFromLevelIndex:
	ld a, [wNextMapSide]
	ld c, a
	and a
	jr z, .north
.get_ow_level
	ld b, $00
	ld hl, MapSideInitialLevels
	add hl, bc
	ld a, [wMapSideLevelID]
	add [hl]
	ld [wOWLevel], a
	ret

.north
	ld a, [wMapSideLevelID]
	cp OWNORTH_JUNCTION
	jr c, .get_ow_level
	ld a, $80
	ld [wOWLevel], a
	ret

MapSideInitialLevels:
	db LEVEL_THE_TEMPLE         ; NORTH
	db LEVEL_DESERT_RUINS       ; WEST
	db LEVEL_THE_GRASSLANDS     ; SOUTH
	db LEVEL_THE_STAGNANT_SWAMP ; EAST

; unreferenced
Func_812b0:
	ld hl, .data
	ld a, [wNextMapSide]
	ld b, $00
	ld c, a
	add hl, bc
	ld c, [hl]
	ret

.data
	db $06 ; NORTH
	db $05 ; WEST
	db $05 ; SOUTH
	db $06 ; EAST

; when game is cleared, show indicators on level
; where some treasures are still missing
ShowMissingTreasureIndicators:
	ld a, [wMissingTreasureIndicatorsEnabled]
	and a
	ret z ; game not cleared OR all treasures collected
	ld a, [wOWLevel]
	ld [w2dffd], a
	ld a, [wCurMapSide]
	ld c, a
	ld b, $00
	ld hl, MapSideInitialLevels
	add hl, bc
	ld a, [hl]
	ld [wOWLevel], a

	ld a, [wNextMapSide]
	ld b, NUM_WEST_LEVELS
	dec a
	jr z, .got_level_count ; west
	ld b, NUM_SOUTH_LEVELS
	dec a
	jr z, .got_level_count ; south
	ld b, NUM_EAST_LEVELS
	dec a
	jr z, .got_level_count ; east
	ld b, NUM_NORTH_LEVELS
.got_level_count
	ld a, b
	ld [w2dfff], a
	xor a
	ld [w2dffe], a

	; if in North, skip The Temple
	ld a, [wOWLevel]
	and a
	jr z, .skip_level
.loop_levels
	farcall GetOWLevelCollectedTreasures
	ld a, [wKeyAndTreasureFlags]
	and TREASURES_MASK
	xor TREASURES_MASK
	; nz means at least 1 treasure missing
	call nz, .PlaceTreasureMissingIndicator
.skip_level
	ld a, [wOWLevel]
	inc a
	ld [wOWLevel], a
	ld hl, w2dffe
	inc [hl]
	ld a, [hli]
	cp [hl] ; w2dfff
	jr nz, .loop_levels
	ld a, [w2dffd]
	ld [wOWLevel], a
	ret

.PlaceTreasureMissingIndicator:
	ld a, [w2dffe]
	call GetMapLevelCoords
	ld a, [hli]
	ld [wLevel1YCoord], a
	ld a, [hl]
	ld [wLevel1XCoord], a
	ld hl, wLevel1Coords
	call GetOWCoordInTilemap
	ld [hl], $7b ; tile index
	dec h
	dec h
	dec h
	ld [hl], $0d ; attribute
	ret

Func_81346:
	farcall Func_852e5
	call Func_8137a
	farcall Func_b4a3d
	call Func_8208d
	farcall Func_b4aa9
	ret

Func_8137a:
	ld hl, w2d0e5
	inc [hl]
	ld a, [w2d0e4]
	jumptable

	dw Func_81398
	dw Func_8139f
	dw Func_813ad
	dw Func_813b4
	dw Func_813ef
	dw Func_813f6
	dw Func_813ef
	dw Func_81413
	dw Func_8139f
	dw Func_813ad
	dw Func_8142d

Func_81398:
	xor a
	ld hl, w2d0e5
	ld [hld], a
	inc [hl] ; w2d0e4
	ret

Func_8139f:
	ld hl, w2d0e5
	ld a, [hl]
	cp $08
	ret c
	ld a, $03
	ld [w2d0e0], a
	jr Func_81398

Func_813ad:
	ld a, [w2d0e0]
	and a
	ret nz
	jr Func_81398

Func_813b4:
	call GetMapSideAndLevelForNextTreasure
	call LoadLevelName
	jr Func_81398

GetMapSideAndLevelForNextTreasure:
	ld a, [wNextTreasure]
	cp TREASURES_END
	jr z, .no_more_treasures
	ld b, a
	call GetCutsceneWithTreasure
	ld a, CUTSCENE_25
	cp c
	jr nc, .get_level
	ld a, [wGameModeFlags]
	bit MODE_GAME_CLEARED_F, a
	jr nz, .get_level
.no_more_treasures
	ld b, NORTH
	ld d, OWNORTH_THE_TEMPLE
	ret
.get_level
	ld a, [wNextTreasure]
	ld c, a
	farcall GetLevelThatContainsTreasure
	call GetMapLevelID
	ret

Func_813ef:
	xor a
	ld [wPalConfig1TotalSteps], a
	jp Func_81398

Func_813f6:
	farcall FadeInLevelName
	srl c
	ret c
	ld a, $1c
	ld hl, wSceneObj13State
	call SetSceneObjState
	jp Func_81398

Func_81413:
	ld a, [wJoypadPressed]
	and B_BUTTON | D_RIGHT | D_LEFT | D_DOWN
	jr nz, .asm_81423
	ld hl, wSceneObj13State
	ld a, [hl]
	and a
	jp z, Func_81398
	ret
.asm_81423
	xor a
	ld hl, wSceneObj13State
	call SetSceneObjState
	jp Func_81398

Func_8142d:
	ld a, OWWARIO_DOWN
	call SetOWWarioOAM
	xor a
	ld [w2d013], a
	ld [w2d014], a
	ld [w2d0e4], a
	ret

; unreferenced
Func_8143d:
	ld hl, wPalFade2Colour2RedUnk3
	ld a, [w2d100]
	ld [hli], a
	ld a, [w2d101]
	ld [hl], a
	ld a, [w2d069]
	ld [wLevel1YCoord], a
	ld [w2d100], a
	ld a, [w2d06a]
	ld [wLevel1XCoord], a
	ld [w2d101], a
	call .Func_8146f
	ld hl, wPalFade2Colour2RedUnk3
	ld a, [hli]
	ld [wLevel1YCoord], a
	ld [w2d100], a
	ld a, [hl]
	ld [wLevel1XCoord], a
	ld [w2d101], a
	ret

.Func_8146f:
	ld a, [w2d0e3]
	jumptable
	dw Func_814ec
	dw Func_8150c

Func_81477:
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jr z, .asm_8148e
	ld hl, w2d0e2
	inc [hl]

	ld a, [w2d0e3]
	jumptable
	dw Func_814b2
	dw Func_814c4
	dw Func_814ec
	dw Func_8150c

.asm_8148e
	ld a, [w2d0e3]
	and a
	ret z
	ld a, OWWARIO_DOWN
	ld hl, w2d106
	cp [hl]
	call nz, SetOWWarioOAM
	ld hl, w2d88e
	ld a, [hli] ; w2d88e
	ld [wLevel1YCoord], a
	ld [w2d100], a
	ld a, [hl] ; w2d88f
	ld [wLevel1XCoord], a
	ld [w2d101], a
	xor a
	ld [w2d0e3], a
	ret

Func_814b2:
	ld hl, w2d88e
	ld a, [w2d100]
	ld [hli], a ; w2d88e
	ld a, [w2d101]
	ld [hl], a ; w2d88f
;	fallthrough

Func_814bd:
	xor a
	ld hl, w2d0e2
	ld [hli], a
	inc [hl] ; w2d0e3
	ret

Func_814c4:
	ld b, $0a
	ld a, [w2d0e2]
	cp b
	ret c
	play_sfx SFX_113
	ld a, [w2d069]
	ld [wLevel1YCoord], a
	ld [w2d100], a
	ld a, [w2d06a]
	ld [wLevel1XCoord], a
	ld [w2d101], a
	ld a, OWWARIO_ARROWS
	call SetOWWarioOAM
	jr Func_814bd

Func_814ec:
	xor a
	ld hl, w2d800
	ld bc, $8e
	call WriteAToHL_BCTimes
	ld hl, wOWUIObj1
	ld bc, $40
	call WriteAToHL_BCTimes
	call Func_82111
	ld a, l
	ld [w2d889 + 0], a
	ld a, h
	ld [w2d889 + 1], a
	jr Func_814bd

Func_8150c:
	ld a, $00
	call .Func_81576
	call .Func_81615
	call .Func_81595
	ld a, $01
	call .Func_81576
	call .Func_81615
	call .Func_81595
	ld a, $02
	call .Func_81576
	call .Func_81615
	call .Func_81595
	ld a, $03
	call .Func_81576
	call .Func_81615
	call .Func_81595

	ld a, [w2d0e2]
	cp $14
	call z, .Func_815c1
	ld a, [w2d0e2]
	cp $28
	call z, .Func_815e5
	ld a, [w2d0e2]
	cp $2c
	ld hl, wOWUIObj1State
	call z, .Func_81609
	ld a, [w2d0e2]
	cp $40
	ld hl, w2d160 + $6
	call z, .Func_81609
	call Func_81714

	ld hl, w2d807
	ld c, $04
.loop
	ld a, [hl]
	cp $05
	ret nz
	ld de, $20
	add hl, de
	dec c
	jr nz, .loop

	ld hl, w2d0e3
	dec [hl]
	ret

.Func_81576
	ld [w2d88b], a
	call .Func_815b6
	ld de, w2d880
	ld b, $9
	call CopyHLToDE
	ld de, w2d0a0
	ld b, $7
	call CopyHLToDE
	ld de, wLevel1Coords
	ld b, $8
	call CopyHLToDE
	ret

.Func_81595
	ld a, [w2d88b]
	call .Func_815b6
	ld e, l
	ld d, h
	ld hl, w2d880
	ld b, $9
	call CopyHLToDE
	ld hl, w2d0a0
	ld b, $07
	call CopyHLToDE
	ld hl, wLevel1Coords
	ld b, $08
	call CopyHLToDE
	ret

.Func_815b6
	rlca
	swap a
	ld e, a
	ld d, $00
	ld hl, w2d800
	add hl, de
	ret

.Func_815c1
	ld hl, w2d800
	ld de, wOWUIObj1
	ld b, $08
	call CopyHLToDE
	ld hl, wFadePals + $10
	ld b, $08
	call CopyHLToDE
	ld hl, wFadePals + $30
	ld b, $08
	call CopyHLToDE
	ld hl, wFadePals + $50
	ld b, $08
	call CopyHLToDE
	ret

.Func_815e5
	ld hl, w2d800
	ld de, w2d160
	ld b, $08
	call CopyHLToDE
	ld hl, wFadePals + $10
	ld b, $08
	call CopyHLToDE
	ld hl, wFadePals + $30
	ld b, $08
	call CopyHLToDE
	ld hl, wFadePals + $50
	ld b, $08
	call CopyHLToDE
	ret

.Func_81609
	ld de, $8
	xor a
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	ret

.Func_81615
	ld a, [w2d880 + $7]
	jumptable
	dw .Func_81625
	dw .Func_8167f
	dw .Func_816b3
	dw .Func_816be
	dw .Func_816ea
	dw .Func_816f5

.Func_81625:
	ld a, [w2d100]
	ld d, a
	ld a, [w2d101]
	ld e, a
	ld b, $08
	ld a, [wPalFade2Colour2RedDiff]
	inc a
	bit 1, a
	jr z, .asm_81639
	ld b, $f8
.asm_81639
	cp $03
	jr nc, .asm_81642
	ld a, e
	add b
	ld e, a
	jr .asm_81645
.asm_81642
	ld a, d
	add b
	ld d, a
.asm_81645
	ld a, d
	ld [w2d880], a
	ld [wLevel1YCoord], a
	ld [wLevel2YCoord], a
	ld [w2d06f], a
	ld a, e
	ld [wPalFade2Colour1BlueTarget], a
	ld [wLevel1XCoord], a
	ld [wLevel2XCoord], a
	ld [w2d070], a
	ld hl, wPalFade2Colour1BlueUnk1
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wPalFade2Colour2RedDiff]
	inc a
	ld b, a
	ld c, a
	ld a, [wOWAllowedDPadInput]
	swap a
.asm_81670
	rrca
	dec b
	jr nz, .asm_81670
	ld a, $00
	jr nc, .asm_81679
	ld a, c
.asm_81679
	ld [hl], a
.asm_8167a
	ld hl, wPalFade2Colour1BlueUnk4
	inc [hl]
	ret

.Func_8167f:
	ld a, [wPalFade2Colour1BlueUnk3]
	and a
	jr z, .asm_816ad
	ld hl, wPalFade2Colour2RedTarget
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wPalFade2Colour2RedDiff]
	ld e, a
	ld d, $00
	add hl, de
	ld b, [hl]
	ld de, $4
	add hl, de
	ld a, [hl]
	ld [w2d071], a
	ld a, b
	cp $80
	jr z, .asm_816ad
	call GetMapLevelCoords
	ld a, [hli]
	ld [w2d06f], a
	ld a, [hl]
	ld [w2d070], a
	jr .asm_8167a
.asm_816ad
	ld a, $05
	ld [wPalFade2Colour1BlueUnk4], a
	ret

.Func_816b3:
	ld bc, w2d071
	call Func_810fc
	call Func_821a1
	jr .asm_8167a

.Func_816be:
	call Func_82208
	ld a, [wLevel1YCoord]
	ld [w2d880], a
	ld a, [wLevel1XCoord]
	ld [wPalFade2Colour1BlueTarget], a
	ld a, [w2d0a1]
	and a
	ret nz
	ld bc, w2d071
	call Func_810fc
	cp $ff
	jr z, .asm_816e3
	call Func_821a1
	call .Func_816f6
	ret
.asm_816e3
	xor a
	ld [wPalFade2Colour2RedCurrent], a
	jp .asm_8167a

.Func_816ea:
	ld hl, wPalFade2Colour2RedCurrent
	inc [hl]
	ld a, [hl]
	cp $08
	ret c
	jp .asm_8167a

.Func_816f5:
	ret

.Func_816f6:
	ld hl, w2d0a0
	bit 0, [hl]
	jr nz, .asm_81705
	ld a, $03
	bit 1, [hl]
	jr z, .asm_8170b
	jr .asm_8170c
.asm_81705
	ld a, $01
	bit 2, [hl]
	jr z, .asm_8170c
.asm_8170b
	inc a
.asm_8170c
	ld hl, wPalFade2Colour1BlueUnk3
	ld [hld], a
	xor a
	ld [hld], a
	ld [hl], a
	ret

Func_81714:
	ld hl, wDayNightTransistionSteps
	call .Func_8175d
	ld hl, wPalFade1Colour1BlueUnk3
	call .Func_8175d
	ld hl, wPalFade1Colour3RedUnk3
	call .Func_8175d
	ld hl, wPalFade1Colour4GreenUnk3
	call .Func_8175d
	ld hl, wOWUIObj1State
	call .Func_8175d
	ld hl, wOWUIObj2State
	call .Func_8175d
	ld hl, wd156
	call .Func_8175d
	ld hl, w2d15e
	call .Func_8175d
	ld hl, w2d166
	call .Func_8175d
	ld hl, w2d16e
	call .Func_8175d
	ld hl, w2d176
	call .Func_8175d
	ld hl, w2d17e
	call .Func_8175d
	ret

.Func_8175d:
	ld a, [hld]
	and a
	ret z
	ld bc, .framesets
	dec a
	add a
	add c
	ld c, a
	ld a, $00
	adc b
	ld b, a
	ld a, [bc]
	ld e, a
	inc bc
	ld a, [bc]
	ld d, a
	dec l
	ld b, $2a
	call UpdateOWAnimation
	ld a, $f8
	and l
	ld l, a
	ld de, OAM_aa0cf
	ld b, BANK(OAM_aa0cf)
	call AddOWSpriteWithScroll
	ret

.framesets
	dw Frameset_aa26a
	dw Frameset_aa267
	dw Frameset_aa261
	dw Frameset_aa264

SetDayNightSpellSelectable:
	ld a, DAY_OR_NIGHT_SPELL
	call IsTreasureCollected
	ret z
	ld a, [wCurMapSide]
	cp EAST
	jr nz, .set_selectable
	ld a, [wGotSunMedallion]
	and a
	ret z
.set_selectable
	ld hl, wTopBarSelectableButtons
	set TOPBAR_DAY_NIGHT_F, [hl]
	ret

SetCutsceneButtonSelectable:
	ld a, [w2d00d]
	cp TRANSITION_RETURN_TO_MAP
	ret z
Func_817a9:
	and a
	ret z
	ld hl, wTopBarSelectableButtons
	set TOPBAR_CUTSCENE_F, [hl]
	ret

; unreferenced
Func_817b1:
	ld a, [wGameModeFlags]
	bit MODE_GAME_CLEARED_F, a
	ret nz
	ld a, CUTSCENE_01
.loop
	ld [w2dffc], a
	call CheckAllCutsceneTreasures
	ld a, [w2dffc]
	jr z, .asm_817cb
	inc a
	ld b, CUTSCENE_26
	cp b
	jr c, .loop
	ld a, b
.asm_817cb
	dec a
	call LoadCutsceneTreasures
	ld a, [w2dfff]
	ld [w2d00d], a
	jr Func_817a9

SetNextPrevMapButtonsSelectable:
	call .CheckAccessibleMapSides
	call GetAccessibleMapFlags
	ld hl, wTopBarSelectableButtons
	or [hl]
	ld [hl], a
	ret

.CheckAccessibleMapSides
	; check west side accessible
	ld a, CUTSCENE_03
	call CheckAllCutsceneTreasures
	rlca
	rlca
	rlca
	ld hl, wAccessibleMapSides
	or [hl]
	ld [hl], a

	; check south side accessible
	ld a, CUTSCENE_07
	call CheckAllCutsceneTreasures
	rlca
	rlca
	ld hl, wAccessibleMapSides
	or [hl]
	ld [hl], a

	; check east side accessible
	ld a, CUTSCENE_0C
	call CheckAllCutsceneTreasures
	rlca
	ld hl, wAccessibleMapSides
	or [hl]
	ld [hl], a

	; check north side accessible
	ld a, CUTSCENE_37
	call CheckAllCutsceneTreasures
	ld hl, wAccessibleMapSides
	or [hl]
	ld [hl], a
	and $1
	swap a
	or [hl]
	ld [hl], a
	ret

GetAccessibleMapFlags:
	ld a, [wAccessibleMapSides]
	ld b, a
	ld a, [wCurMapSide]
.loop
	sub 1
	jr c, .done
	sla b
	jr .loop
.done
	ld a, b
	and TOPBAR_NEXT_MAP | TOPBAR_PREV_MAP
	ret

UpdateNextPrevMapButtonsSelectable:
	ld a, [wTopBarState]
	and a
	ret z
	ld a, [wTopBarSelection]
	and TOPBAR_NEXT_MAP | TOPBAR_PREV_MAP
	ret z
	ld c, a
	call GetAccessibleMapFlags
	and c
	ret nz
	ld hl, wTopBarSelection
	bit TOPBAR_NEXT_MAP_F, [hl]
	jr nz, .set_prev
; set next
	res TOPBAR_PREV_MAP_F, [hl]
	set TOPBAR_NEXT_MAP_F, [hl]
	ret
.set_prev
	res TOPBAR_NEXT_MAP_F, [hl]
	set TOPBAR_PREV_MAP_F, [hl]
	ret

GetNextTreasureToCollect:
	ld a, [wNextTreasure]
	call IsTreasureCollected
	ld hl, wNextTreasure
	jr nz, .collected
	ld a, [wTransitionParam]
	and a
	ret z
	cp TRANSITION_RETURN_TO_MAP
	ret z
	cp TRANSITION_EPILOGUE_NOT_PERFECT
	ret z
	cp TRANSITION_EPILOGUE_PERFECT
	ret z
	cp TRANSITION_GAME_OVER
	ret z
	inc a
	jr z, .asm_8186d ; == TRANSITION_NEW_GAME
	dec a
.asm_8186d
	cp [hl]
	ret nz
.collected

	ld b, [hl]
	call GetCutsceneWithTreasure
; loop until a treasure
; that hasn't been collected
; is found in the table
.next_treasure
	ld a, [hl]
	cp INVALID_TREASURE
	jr z, .check_end
	push hl
	call IsTreasureCollected
	pop hl
	jr z, .not_collected
.check_end
	ld a, [hli]
	cp TREASURES_END
	jr z, .all_collected
	jr .next_treasure
.not_collected
	ld a, [hl]
	ld [wNextTreasure], a
	ret
.all_collected
	ld a, TREASURES_END
	ld [wNextTreasure], a
	ret

; input:
; - b = * constant
; output:
; - c = CUTSCENE_* constant
GetCutsceneWithTreasure:
	ld c, CUTSCENE_00
	ld hl, CutsceneTreasures
.loop
	ld a, [hli]
	cp TREASURES_END
	jr z, .not_found
	cp b
	jr z, .found
	ld a, [hli]
	cp b
	jr z, .found
	ld a, [hli]
	cp b
	jr z, .found
	inc c
	jr .loop
.found
	ret
.not_found
	ld c, CUTSCENE_00
	ret

Func_818ad:
	farcall UpdateCommonOWAnimations
	farcall UpdateMapSideOWAnimations

	ld a, [wTopBarState]
	and a
	jr z, .no_top_bar
	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, Func_81931
.no_top_bar
	ld hl, w2d014
	inc [hl]
	ld a, [w2d013]
	jumptable
	dw Func_818e7
	dw Func_818f6
	dw Func_81900

Func_818e7:
	ld a, [w2d014]
	cp $04
	ret c

Func_818ed:
	xor a
	ld [w2d014], a
	ld hl, w2d013
	inc [hl]
	ret

Func_818f6:
	call Func_8195d
	ld a, [wCutsceneActionParam]
	and a
	ret nz
	jr Func_818ed

Func_81900:
	ld a, [w2d014]
	cp $04
	ret c
	ld hl, wCutsceneOWParamsPtr
	call GetByteFromPointerInHL
	call GetCutsceneOWParams_GotPtr
	jr z, Func_81931
	ld a, [wCurMapSide]
	ld b, a
	ld a, [wCutsceneMapSide]
	cp b
	jr nz, .asm_81923
	xor a
	ld [w2d014], a
	ld [w2d013], a
	ret
.asm_81923
	stop_sfx
	ld a, $04
	ld [wSubState], a
	ret

Func_81931:
	stop_sfx
	ld a, [w2d025]
	ld b, a
	xor a
	ld [wLastTransitionParam], a
	ld [w2d025], a
	ld [wOWCutsceneAction], a
	ld [wTempOWCutsceneAction], a
	ld a, CUTSCENE_5A
	cp b
	jr z, .epilogue
	ld hl, wSubState
	inc [hl]
	call Func_803e6
	ret
.epilogue
	ld a, SST_OVERWORLD_EPILOGUE
	ld [wSubState], a
	ret

Func_8195d:
	ld a, [wOWCutsceneAction]
	jumptable

	dw .InvalidAction
	dw UnlockLevel ; UNLOCK_LEVEL
	dw DoOWFunction ; DO_OW_FUNC
	dw Func_82c33 ; HIGHLIGHT_LEVEL
	dw DoOWFunction ; SPECIAL_ACTION

.InvalidAction:
	debug_nop

DoOWFunction:
	farcall _DoOWFunction
	ret

Func_8197e:
	ld a, [wLastTransitionParam]
	ld b, a
	xor a
	ld c, a ; CUTSCENE_00
	ld [w2d025], a

	ld hl, CutsceneTreasures
.loop
	ld a, [hli]
	cp TREASURES_END
	jr z, .asm_819a7
	cp b
	jr z, .found
	ld a, [hli]
	cp b
	jr z, .found
	ld a, [hli]
	cp b
	jr z, .found
	inc c
	jr .loop

.found
	ld a, c
	ld [w2d025], a
	call CheckAllCutsceneTreasures
	jr z, .asm_819a7
	ret ; collected all treasures

.asm_819a7
	xor a ; CUTSCENE_00
	ld [w2d025], a
	ret

; input:
; - a = CUTSCENE_* constant
CheckAllCutsceneTreasures:
	call LoadCutsceneTreasures
	ld c, TRUE
	ld a, [w2dffd]
	call CheckCutsceneTreasure
	ret c
	ld a, [w2dffe]
	call CheckCutsceneTreasure
	ret c
	ld a, [w2dfff]
	call CheckCutsceneTreasure
	ret

; input:
; - a = CUTSCENE_* constant
Func_819c6:
	call CheckAllCutsceneTreasures
	and c
	ret

; returns carry if treasure in a
; is different from wLastTransitionParam
; and has not been collected
CheckCutsceneTreasure:
	cp INVALID_TREASURE
	jr z, .no_carry
	ld hl, wLastTransitionParam
	cp [hl]
	jr z, .equal
	call IsTreasureCollected
	jr nz, .no_carry
	xor a
	scf
	ret
.equal
	ld c, FALSE
.no_carry
	ld a, $01
	and a
	ret

; input:
; - a = CUTSCENE_* constant
LoadCutsceneTreasures:
	ld c, a
	add a
	add c ; *3
	ld e, a
	ld d, $00
	rl d
	ld hl, CutsceneTreasures
	add hl, de
	ld de, w2dfff
	ld a, [hli]
	ld [de], a ; w2dfff
	ld a, [hli]
	dec e
	ld [de], a ; w2dffe
	ld a, [hl]
	dec e
	ld [de], a ; w2dffd
	ret

CutsceneTreasures:
	table_width 3, CutsceneTreasures
	
; CUTSCENE_00
	db INVALID_TREASURE
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_01
	db TREASURE_NONE
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_02
	db AXE
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_03
	db BLUE_TABLET
	db GREEN_TABLET
	db INVALID_TREASURE

; CUTSCENE_04
	db TOP_HALF_OF_SCROLL
	db BOTTOM_HALF_OF_SCROLL
	db INVALID_TREASURE

; CUTSCENE_05
	db LEAD_OVERALLS_T
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_06
	db JAR
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_07
	db GEAR_1
	db GEAR_2
	db INVALID_TREASURE

; CUTSCENE_08
	db YELLOW_MUSIC_BOX
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_09
	db POUCH
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_0A
	db SKULL_RING_RED
	db SKULL_RING_BLUE
	db INVALID_TREASURE

; CUTSCENE_0B
	db SWIMMING_FLIPPERS_T
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_0C
	db ORNAMENTAL_FAN
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_0D
	db FLUTE
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_0E
	db BLUE_BOOK
	db TRIDENT
	db INVALID_TREASURE

; CUTSCENE_0F
	db HEAD_SMASH_HELMET_T
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_10
	db BLUE_MUSIC_BOX
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_11
	db YELLOW_BOOK
	db SKY_KEY
	db INVALID_TREASURE

; CUTSCENE_12
	db GRAB_GLOVE_T
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_13
	db FOOT_OF_STONE
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_14
	db TUSK_BLUE
	db TUSK_RED
	db GREEN_FLOWER

; CUTSCENE_15
	db RIGHT_GLASS_EYE
	db LEFT_GLASS_EYE
	db INVALID_TREASURE

; CUTSCENE_16
	db GARLIC_T
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_17
	db GREEN_MUSIC_BOX
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_18
	db SCEPTER
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_19
	db LANTERN
	db MAGICAL_FLAME
	db INVALID_TREASURE

; CUTSCENE_1A
	db SUPER_JUMP_SLAM_OVERALLS_T
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_1B
	db SUN_MEDALLION_TOP
	db SUN_MEDALLION_BOTTOM
	db INVALID_TREASURE

; CUTSCENE_1C
	db HIGH_JUMP_BOOTS_T
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_1D
	db RED_MUSIC_BOX
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_1E
	db EXPLOSIVE_PLUNGER_BOX
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_1F
	db MAGIC_SEEDS
	db EYE_OF_THE_STORM
	db INVALID_TREASURE

; CUTSCENE_20
	db PRINCE_FROGS_GLOVES_T
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_21
	db STATUE
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_22
	db TREASURE_MAP
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_23
	db SUPER_GRAB_GLOVES_T
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_24
	db GOLD_MAGIC
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_25
	db GOLD_MUSIC_BOX
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_26
	db CRAYON_BLUE_T
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_27
	db TRUCK_WHEEL
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_28
	db BLUE_GEM
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_29
	db CRAYON_CYAN_T
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_2A
	db GOBLET
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_2B
	db CROWN
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_2C
	db CRAYON_PINK_T
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_2D
	db TEAPOT
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_2E
	db POCKET_PET
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_2F
	db MAGNIFYING_GLASS
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_30
	db AIR_PUMP
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_31
	db ROCKET
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_32
	db CRAYON_YELLOW_T
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_33
	db INVALID_TREASURE
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_34
	db SABER
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_35
	db DAY_OR_NIGHT_SPELL
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_36
	db UFO
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_37
	db TORCH
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_38
	db WARP_COMPACT
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_39
	db MYSTERY_HANDLE
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_3A
	db WARP_REMOVAL_APPARATUS
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_3B
	db CRAYON_BROWN_T
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_3C
	db DEMONS_BLOOD
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_3D
	db KEY_CARD_RED
	db KEY_CARD_BLUE
	db INVALID_TREASURE

; CUTSCENE_3E
	db HEART_CREST
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_3F
	db MINICAR
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_40
	db LOCOMOTIVE
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_41
	db TELEPHONE
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_42
	db CRAYON_RED_T
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_43
	db ELECTRIC_FAN_PROPELLER
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_44
	db SAPLING_OF_GROWTH
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_45
	db GREEN_GEM
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_46
	db INVALID_TREASURE
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_47
	db INVALID_TREASURE
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_48
	db FIGHTER_MANNEQUIN
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_49
	db GOLDEN_LEFT_EYE
	db GOLDEN_RIGHT_EYE
	db INVALID_TREASURE

; CUTSCENE_4A
	db MAGIC_WAND
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_4B
	db CRAYON_GREEN_T
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_4C
	db FIRE_DRENCHER
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_4D
	db DIAMONDS_CREST
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_4E
	db CASTLE_BRICK
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_4F
	db RUST_SPRAY
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_50
	db SPADES_CREST
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_51
	db RED_CHEMICAL
	db BLUE_CHEMICAL
	db INVALID_TREASURE

; CUTSCENE_52
	db RED_GEM
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_53
	db CLUBS_CREST
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_54
	db SCISSORS
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_55
	db JACKHAMMER
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_56
	db NIGHT_VISION_SCOPE
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_57
	db FULL_MOON_GONG
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_58
	db PICK_AXE
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_59
	db EARTHEN_FIGURE
	db INVALID_TREASURE
	db INVALID_TREASURE

; CUTSCENE_5A
	db INVALID_TREASURE
	db INVALID_TREASURE
	db INVALID_TREASURE

	assert_table_length NUM_CUTSCENES

	db TREASURES_END

; input:
; - a = CUTSCENE_* constant
GetCutsceneOWParams:
	ld hl, CutsceneOWParams
	call GetPointerFromTableHL
GetCutsceneOWParams_GotPtr:
	ld a, [hli]
	ld [wOWCutsceneAction], a
	cp $80
	ret z ; finished
	ld a, [hli]
	ld [wCutsceneMapSide], a ; map side
	ld a, [hli]
	ld [wCutsceneActionParam], a
	ld a, l
	ld [wCutsceneOWParamsPtr + 0], a
	ld a, h
	ld [wCutsceneOWParamsPtr + 1], a
	ret

; \1 = map side
; \2 = level index
MACRO ow_highlight_level
	db HIGHLIGHT_LEVEL
	db \1
IF \1 == NORTH
	db \2
ELSE
	db (\2) + 1
ENDC
ENDM

; \1 = map side
; \2 = connection
MACRO ow_unlock_level
	db UNLOCK_LEVEL, \1, \2
ENDM

; \1 = map side
; \2 = func index
MACRO ow_func
	db DO_OW_FUNC, \1, \2
ENDM

MACRO ow_scene_end
	db $80
ENDM

CutsceneOWParams:
	dw .cutscene00
	dw .cutscene01
	dw .cutscene02
	dw .cutscene03
	dw .cutscene04
	dw .cutscene05
	dw .cutscene06
	dw .cutscene07
	dw .cutscene08
	dw .cutscene09
	dw .cutscene0a
	dw .cutscene0b
	dw .cutscene0c
	dw .cutscene0d
	dw .cutscene0e
	dw .cutscene0f
	dw .cutscene10
	dw .cutscene11
	dw .cutscene12
	dw .cutscene13
	dw .cutscene14
	dw .cutscene15
	dw .cutscene16
	dw .cutscene17
	dw .cutscene18
	dw .cutscene19
	dw .cutscene1a
	dw .cutscene1b
	dw .cutscene1c
	dw .cutscene1d
	dw .cutscene1e
	dw .cutscene1f
	dw .cutscene20
	dw .cutscene21
	dw .cutscene22
	dw .cutscene23
	dw .cutscene24
	dw .cutscene25
	dw .cutscene26
	dw .cutscene27
	dw .cutscene28
	dw .cutscene29
	dw .cutscene2a
	dw .cutscene2b
	dw .cutscene2c
	dw .cutscene2d
	dw .cutscene2e
	dw .cutscene2f
	dw .cutscene30
	dw .cutscene31
	dw .cutscene32
	dw .cutscene33
	dw .cutscene34
	dw .cutscene35
	dw .cutscene36
	dw .cutscene37
	dw .cutscene38
	dw .cutscene39
	dw .cutscene3a
	dw .cutscene3b
	dw .cutscene3c
	dw .cutscene3d
	dw .cutscene3e
	dw .cutscene3f
	dw .cutscene40
	dw .cutscene41
	dw .cutscene42
	dw .cutscene43
	dw .cutscene44
	dw .cutscene45
	dw .cutscene46
	dw .cutscene47
	dw .cutscene48
	dw .cutscene49
	dw .cutscene4a
	dw .cutscene4b
	dw .cutscene4c
	dw .cutscene4d
	dw .cutscene4e
	dw .cutscene4f
	dw .cutscene50
	dw .cutscene51
	dw .cutscene52
	dw .cutscene53
	dw .cutscene54
	dw .cutscene55
	dw .cutscene56
	dw .cutscene57
	dw .cutscene58
	dw .cutscene59
	dw .cutscene5a

.cutscene00
	ow_scene_end

.cutscene01
	ow_unlock_level NORTH, NORTHCONN_1
	ow_scene_end

.cutscene02
	ow_func NORTH, NOWFUNC_CUT_TREE
	ow_unlock_level NORTH, NORTHCONN_2
	ow_unlock_level NORTH, NORTHCONN_3
	ow_scene_end

.cutscene03
	ow_func NORTH, NOWFUNC_OPEN_GATE
	ow_unlock_level NORTH, NORTHCONN_7
	ow_unlock_level WEST, WESTCONN_7
	ow_scene_end

.cutscene04
	ow_func WEST, WOWFUNC_CLEAR_TORNADO
	ow_unlock_level WEST, WESTCONN_1
	ow_scene_end

.cutscene05
	ow_highlight_level NORTH, OWNORTH_OUT_OF_THE_WOODS
	ow_highlight_level NORTH, OWNORTH_THE_VAST_PLAIN
	ow_scene_end

.cutscene06
	ow_func WEST, WOWFUNC_RAIN
	ow_unlock_level WEST, WESTCONN_2
	ow_unlock_level WEST, WESTCONN_3
	ow_scene_end

.cutscene07
	ow_func WEST, WOWFUNC_ELEVATOR_WORKING
	ow_unlock_level WEST, WESTCONN_6
	ow_unlock_level SOUTH, SOUTHCONN_7
	ow_scene_end

.cutscene08
	ow_func SOUTH, SOWFUNC_YELLOW_MUSIC_BOX
	ow_unlock_level SOUTH, SOUTHCONN_1
	ow_scene_end

.cutscene09
	ow_func SOUTH, SOWFUNC_SEND_SEEDS
	ow_func NORTH, NOWFUNC_MAGIC_SEED
	ow_func WEST, WOWFUNC_MAGIC_SEED
	ow_func SOUTH, SOWFUNC_MAGIC_SEED
	ow_scene_end

.cutscene0a
	ow_func SOUTH, SOWFUNC_RAISE_TOWER
	ow_unlock_level SOUTH, SOUTHCONN_2
	ow_scene_end

.cutscene0b
	ow_highlight_level WEST, OWWEST_THE_POOL_OF_RAIN
	ow_highlight_level SOUTH, OWSOUTH_THE_BIG_BRIDGE
	ow_scene_end

.cutscene0c
	ow_func SOUTH, SOWFUNC_FAN
	ow_unlock_level SOUTH, SOUTHCONN_6
	ow_unlock_level EAST, EASTCONN_8
	ow_scene_end

.cutscene0d
	ow_func SOUTH, SOWFUNC_SUMMON_SNAKE
	ow_func WEST, WOWFUNC_SUMMON_SNAKE
	ow_func NORTH, NOWFUNC_SUMMON_SNAKE
	ow_scene_end

.cutscene0e
	ow_func EAST, EOWFUNC_FREEZE_SEA
	ow_unlock_level EAST, EASTCONN_1
	ow_scene_end

.cutscene0f
	ow_highlight_level WEST, OWWEST_A_TOWN_IN_CHAOS
	ow_highlight_level WEST, OWWEST_DESERT_RUINS
	ow_scene_end

.cutscene10
	ow_func NORTH, NOWFUNC_BLUE_MUSIC_BOX
	ow_unlock_level NORTH, NORTHCONN_4
	ow_unlock_level NORTH, NORTHCONN_5
	ow_scene_end

.cutscene11
	ow_func SOUTH, SOWFUNC_CANYON_THUNDER
	ow_unlock_level SOUTH, SOUTHCONN_3
	ow_scene_end

.cutscene12
	ow_highlight_level NORTH, OWNORTH_THE_TIDAL_COAST
	ow_highlight_level EAST, OWEAST_THE_FRIGID_SEA
	ow_highlight_level SOUTH, OWSOUTH_THE_BIG_BRIDGE
	ow_scene_end

.cutscene13
	ow_func WEST, WOWFUNC_EARTHQUAKE
	ow_func SOUTH, SOWFUNC_EARTHQUAKE
	ow_func EAST, EOWFUNC_EARTHQUAKE
	ow_scene_end

.cutscene14
	ow_func WEST, WOWFUNC_VULCANO_ERUPTION
	ow_func EAST, EOWFUNC_VULCANO_ERUPTION
	ow_unlock_level WEST, WESTCONN_4
	ow_unlock_level EAST, SOUTHCONN_3
	ow_scene_end

.cutscene15
	ow_highlight_level SOUTH, OWSOUTH_TOWER_OF_REVIVAL
	ow_scene_end

.cutscene16
	ow_func NORTH, NOWFUNC_GARLIC
	ow_highlight_level NORTH, OWNORTH_BANK_OF_THE_WILD_RIVER
	ow_highlight_level EAST, OWEAST_THE_COLOSSAL_HOLE
	ow_unlock_level NORTH, NORTHCONN_6
	ow_scene_end

.cutscene17
	ow_func SOUTH, SOWFUNC_GREEN_MUSIC_BOX
	ow_unlock_level SOUTH, SOUTHCONN_4
	ow_scene_end

.cutscene18
	ow_highlight_level SOUTH, OWSOUTH_THE_BIG_BRIDGE
	ow_highlight_level EAST, OWEAST_THE_FRIGID_SEA
	ow_highlight_level NORTH, OWNORTH_SEA_TURTLE_ROCKS
	ow_scene_end

.cutscene19
	ow_func EAST, EOWFUNC_FORM_CASTLE
	ow_unlock_level EAST, EASTCONN_2
	ow_scene_end

.cutscene1a
	ow_highlight_level NORTH, OWNORTH_SEA_TURTLE_ROCKS
	ow_highlight_level WEST, OWWEST_THE_WEST_CRATER
	ow_highlight_level WEST, OWWEST_DESERT_RUINS
	ow_highlight_level NORTH, OWNORTH_THE_PEACEFUL_VILLAGE
	ow_scene_end

.cutscene1b
	ow_func EAST, EOWFUNC_DAYTIME
	ow_highlight_level EAST, OWEAST_THE_COLOSSAL_HOLE
	ow_highlight_level EAST, OWEAST_THE_FRIGID_SEA
	ow_highlight_level EAST, OWEAST_CASTLE_OF_ILLUSIONS
	ow_scene_end

.cutscene1c
	ow_highlight_level SOUTH, OWSOUTH_THE_GRASSLANDS
	ow_highlight_level EAST, OWEAST_THE_STAGNANT_SWAMP
	ow_highlight_level SOUTH, OWSOUTH_CAVE_OF_FLAMES
	ow_scene_end

.cutscene1d
	ow_func WEST, WOWFUNC_RED_MUSIC_BOX
	ow_unlock_level WEST, WESTCONN_5
	ow_scene_end

.cutscene1e
	ow_func SOUTH, SOWFUNC_EXPLOSIVES
	ow_func EAST, EOWFUNC_EXPLOSIVES
	ow_scene_end

.cutscene1f
	ow_func NORTH, NOWFUNC_FALL_LEAVES
	ow_scene_end

.cutscene20
	ow_highlight_level NORTH, OWNORTH_BANK_OF_THE_WILD_RIVER
	ow_highlight_level SOUTH, OWSOUTH_THE_STEEP_CANYON
	ow_highlight_level WEST, OWWEST_BENEATH_THE_WAVES
	ow_scene_end

.cutscene21
	ow_highlight_level SOUTH, OWSOUTH_TOWER_OF_REVIVAL
	ow_highlight_level NORTH, OWNORTH_THE_TIDAL_COAST
	ow_scene_end

.cutscene22
	ow_unlock_level EAST, EASTCONN_6
	ow_scene_end

.cutscene23
	ow_highlight_level WEST, OWWEST_A_TOWN_IN_CHAOS
	ow_highlight_level EAST, OWEAST_CASTLE_OF_ILLUSIONS
	ow_highlight_level EAST, OWEAST_FOREST_OF_FEAR
	ow_scene_end

.cutscene24
	ow_highlight_level NORTH, OWNORTH_OUT_OF_THE_WOODS
	ow_scene_end

.cutscene25
	ow_func NORTH, NOWFUNC_GOLD_MUSIC_BOX
	ow_highlight_level NORTH, OWNORTH_THE_TEMPLE
	ow_scene_end

.cutscene26
	db SPECIAL_ACTION, NORTH, $09
	ow_scene_end

.cutscene27
	ow_highlight_level WEST, OWWEST_THE_VOLCANOS_BASE
	ow_scene_end

.cutscene28
	ow_scene_end

.cutscene29
	db SPECIAL_ACTION, NORTH, $0a
	ow_scene_end

.cutscene2a
	ow_scene_end

.cutscene2b
	ow_scene_end

.cutscene2c
	db SPECIAL_ACTION, NORTH, $0b
	ow_scene_end

.cutscene2d
	ow_scene_end

.cutscene2e
	ow_scene_end

.cutscene2f
	db SPECIAL_ACTION, NORTH, $10
	ow_scene_end

.cutscene30
	ow_highlight_level NORTH, OWNORTH_BANK_OF_THE_WILD_RIVER
	ow_highlight_level WEST, OWWEST_THE_POOL_OF_RAIN
	ow_scene_end

.cutscene31
	ow_scene_end

.cutscene32
	db SPECIAL_ACTION, NORTH, $0c
	ow_scene_end

.cutscene33
	ow_scene_end

.cutscene34
	ow_scene_end

.cutscene35
	db SPECIAL_ACTION, NORTH, $11
	ow_scene_end

.cutscene36
	ow_scene_end

.cutscene37
	ow_func EAST, EOWFUNC_BURN_VINES
	ow_unlock_level EAST, EASTCONN_5
	ow_unlock_level EAST, EASTCONN_7
	ow_unlock_level NORTH, $08
	ow_scene_end

.cutscene38
	ow_func EAST, EOWFUNC_SHOW_WARPED_VOID
	ow_unlock_level EAST, SOUTHCONN_4
	ow_scene_end

.cutscene39
	ow_func EAST, EOWFUNC_RAISE_PIPE
	ow_scene_end

.cutscene3a
	ow_highlight_level EAST, OWEAST_THE_WARPED_VOID
	ow_scene_end

.cutscene3b
	db SPECIAL_ACTION, NORTH, $0d
	ow_scene_end

.cutscene3c
	ow_highlight_level EAST, OWEAST_FOREST_OF_FEAR
	ow_scene_end

.cutscene3d
	ow_highlight_level EAST, OWEAST_THE_WARPED_VOID
	ow_scene_end

.cutscene3e
	ow_scene_end

.cutscene3f
	ow_scene_end

.cutscene40
	ow_scene_end

.cutscene41
	ow_scene_end

.cutscene42
	db SPECIAL_ACTION, NORTH, $0e
	ow_scene_end

.cutscene43
	ow_highlight_level WEST, OWWEST_A_TOWN_IN_CHAOS
	ow_scene_end

.cutscene44
	ow_highlight_level NORTH, OWNORTH_THE_TIDAL_COAST
	ow_highlight_level WEST, OWWEST_BENEATH_THE_WAVES
	ow_scene_end

.cutscene45
	ow_scene_end

.cutscene46
	ow_scene_end

.cutscene47
	ow_scene_end

.cutscene48
	ow_scene_end

.cutscene49
	ow_highlight_level SOUTH, OWSOUTH_TOWER_OF_REVIVAL
	ow_scene_end

.cutscene4a
	ow_unlock_level SOUTH, SOUTHCONN_5
	ow_scene_end

.cutscene4b
	db SPECIAL_ACTION, NORTH, $0f
	ow_scene_end

.cutscene4c
	ow_highlight_level WEST, OWWEST_THE_WEST_CRATER
	ow_highlight_level EAST, OWEAST_THE_EAST_CRATER
	ow_scene_end

.cutscene4d
	ow_scene_end

.cutscene4e
	ow_highlight_level EAST, OWEAST_CASTLE_OF_ILLUSIONS
	ow_scene_end

.cutscene4f
	ow_highlight_level WEST, OWWEST_THE_WEST_CRATER
	ow_highlight_level SOUTH, OWSOUTH_THE_STEEP_CANYON
	ow_highlight_level SOUTH, OWSOUTH_CAVE_OF_FLAMES
	ow_scene_end

.cutscene50
	ow_scene_end

.cutscene51
	ow_highlight_level NORTH, OWNORTH_THE_VAST_PLAIN
	ow_highlight_level WEST, OWWEST_BENEATH_THE_WAVES
	ow_scene_end

.cutscene52
	ow_scene_end

.cutscene53
	ow_scene_end

.cutscene54
	ow_highlight_level SOUTH, OWSOUTH_ABOVE_THE_CLOUDS
	ow_scene_end

.cutscene55
	ow_highlight_level EAST, OWEAST_THE_EAST_CRATER
	ow_scene_end

.cutscene56
	ow_highlight_level NORTH, OWNORTH_SEA_TURTLE_ROCKS
	ow_scene_end

.cutscene57
	ow_func SOUTH, SOWFUNC_FULL_MOON
	ow_highlight_level SOUTH, OWSOUTH_ABOVE_THE_CLOUDS
	ow_scene_end

.cutscene58
	ow_highlight_level EAST, OWEAST_THE_EAST_CRATER
	ow_scene_end

.cutscene59
	ow_scene_end

.cutscene5a
	ow_func NORTH, NOWFUNC_PROLOGUE
	ow_scene_end

Func_81dce:
	ld a, CUTSCENE_01
	ld [wCutscene], a
	ld a, [wLastTransitionParam]
	ld c, a
	dec c
	and a
	jr z, .asm_81de1
	cp TRANSITION_NEW_GAME
	jr nz, .asm_81de5
	ld c, $00
.asm_81de1
	ld a, c
	ld [wLastTransitionParam], a

.asm_81de5
	xor a
	ld [w2d078], a
	ld a, [wCutscene]
	call CheckAllCutsceneTreasures
	ld [w2d065], a
	and a
	jr z, .asm_81dfd
	dec c
	jr z, .asm_81dfd
	ld a, $80
	ld [w2d065], a
.asm_81dfd
	call .Func_81e16
	ld a, [wCutscene]
	inc a
	cp NUM_CUTSCENES
	jr z, .asm_81e0d
	ld [wCutscene], a
	jr .asm_81de5
.asm_81e0d
	ld a, [wLastTransitionParam]
	inc a
	ret nz
	; TRANSITION_NEW_GAME
	ld [wLastTransitionParam], a ; = 0
	ret

.Func_81e16:
	ld a, [wCutscene]
	call GetCutsceneOWParams
	ret z
.loop
	ld a, [wCutsceneMapSide]
	ld b, a
	ld a, [wCurMapSide]
	cp b
	jr nz, .same_side
	call .Func_81e36
.same_side
	ld hl, wCutsceneOWParamsPtr
	call GetByteFromPointerInHL
	call GetCutsceneOWParams_GotPtr
	ret z
	jr .loop

.Func_81e36:
	ld a, [wOWCutsceneAction]
	jumptable

	dw Func_81e44
	dw Func_81e57 ; UNLOCK_LEVEL
	dw Func_81e47 ; DO_OW_FUNC
	dw Func_82c09 ; HIGHLIGHT_LEVEL
	dw Func_81e47 ; SPECIAL_ACTION

Func_81e44:
	debug_nop

Func_81e47:
	farcall Func_b4004
	ret

Func_81e57:
	ld a, [w2d065]
	add a
	ret z
	xor a
	ld [w2d072], a
	call GetUnlockedOWLevelData
	call GetUnlockedLevelArrows
.loop
	call .Func_81e88
	ld hl, w2d072
	inc [hl]
	ld a, [w2d074]
	cp [hl]
	jr nz, .loop

	xor a
	ld [w2d072], a
	xor a ; unnecessary
	ld [wOWTilemapPtr + 0], a
	ld [wOWTilemapPtr + 1], a
	ld [wAttrToPlaceInOW], a
	ld [wTileToPlaceInOW], a
	ld [w2d071], a
	ret

.Func_81e88:
	call IsLeftExitOrJunction
	jr z, .second_connection
	ld a, [wLevelArrowDirections1]
	ld hl, wAttrToPlaceInOW
	call ShowLevelArrowInOW
	ld a, [wLevelArrowDirections1]
	call GetConnectedLevel1ArrowCoord
	call GetConnectedLevel1CoordsInTilemap
	ld a, TRUE
	ld [w2d07f], a
	push hl
	call Func_81feb
	pop hl
	ld a, [wTileToPlaceInOW]
	ld [hl], a
	dec h
	dec h
	dec h
	ld a, [wAttrToPlaceInOW]
	ld [hl], a
	xor a ; FALSE
	ld [w2d07f], a
	ld a, [wLevel2]
	cp OW_EXIT_RIGHT
	ret z

.second_connection
	ld a, [wLevel2XCoord]
	ld [wLevel1XCoord], a
	ld a, [wLevel2YCoord]
	ld [wLevel1YCoord], a
	ld a, [wLevelArrowDirections2]
	ld [wLevelArrowDirections1], a
	ld a, [wLevelArrowDirections1]
	ld hl, wAttrToPlaceInOW
	call ShowLevelArrowInOW
	ld a, [wLevelArrowDirections1]
	call GetConnectedLevel1ArrowCoord
	call GetConnectedLevel1CoordsInTilemap
	ld a, TRUE
	ld [w2d07f], a
	push hl
	call Func_81feb
	pop hl
	ld a, [wTileToPlaceInOW]
	ld [hl], a
	dec h
	dec h
	dec h
	ld a, [wAttrToPlaceInOW]
	ld [hl], a
	xor a ; FALSE
	ld [w2d07f], a

	ld hl, wAttrToPlaceInOW
	call ShowLevelPointInOW
	ld hl, wLevel2Coords
	call GetOWCoordInTilemap
	ld a, TRUE
	ld [w2d07f], a
	push hl
	call Func_81feb
	pop hl
	ld a, [wTileToPlaceInOW]
	ld [hl], a
	dec h
	dec h
	dec h
	ld a, [wAttrToPlaceInOW]
	ld [hl], a
	xor a ; FALSE
	ld [w2d07f], a
	ret

Func_81f21:
	ld a, [w2d07f]
	and a
	jr z, .skip
	ld de, wTileToPlaceInOW
.loop
	ld a, [de] ; wTileToPlaceInOW
	ld c, a
	inc e
	ld a, [de] ; wAttrToPlaceInOW
	ld b, a
	inc e
	ld a, [de] ; wOWTilemapPtr
	ld l, a
	inc e
	ld a, [de]
	ld h, a
	ld [hl], c
	dec h
	dec h
	dec h
	ld [hl], b
	inc e
	ld a, [w2d07f]
	dec a
	ld [w2d07f], a
	and a
	jr nz, .loop
	ld a, TRUE
	ld [wOWPendingTileUpdate], a
.skip
	ret

GetUnlockedOWLevelData:
	ld hl, wCutsceneMapSide
	ld a, [hli]
	ld c, [hl] ; wCutsceneActionParam
	ld hl, UnlockableConnections
	call GetCthWordFromAthTable
	ld a, [hli]
	ld [wLevel1], a
	ld a, [hl]
	ld [wLevel2], a

	ld hl, wCutsceneMapSide
	ld a, [hli]
	ld c, [hl] ; wCutsceneActionParam
	ld hl, UnlockableLevelArrows
	call GetCthWordFromAthTable
	ld a, [hli]
	ld [wUnlockedLevelArrowsPtr + 0], a
	ld a, [hl]
	ld [wUnlockedLevelArrowsPtr + 1], a

	ld a, [wLevel1]
	call GetMapLevelCoords
	ld a, [hli]
	ld [w2d069], a
	ld [wLevel1YCoord], a
	ld a, [hl]
	ld [w2d06a], a
	ld [wLevel1XCoord], a

	ld a, [wLevel2]
	call GetMapLevelCoords
	ld a, [hli]
	ld [wLevel2YCoord], a
	ld a, [hl]
	ld [wLevel2XCoord], a
	ret

GetUnlockedLevelArrows:
	ld a, [wUnlockedLevelArrowsPtr + 0]
	ld l, a
	ld a, [wUnlockedLevelArrowsPtr + 1]
	ld h, a
	ld a, [w2d071]
	call AddOffsetInPointerTable
	ld a, [hli]
	ld [wLevelArrowDirections1], a
	ld a, [hli]
	ld [w2d074], a
	ld a, [hli]
	ld [wLevelArrowDirections2], a
	cp $ff
	ld a, [hl]
	jr nz, .asm_81fb4
	xor a
.asm_81fb4
	ld [w2d076], a
	ret

	ret ; stray ret

GetConnectedLevel1ArrowCoord:
	ld b, a
	ld a, $8
	ld hl, wLevel1XCoord
	bit D_RIGHT_F, b
	jr nz, .right_down
	bit D_LEFT_F, b
	jr nz, .left_up
	ld hl, wLevel1YCoord
	bit D_UP_F, b
	jr nz, .left_up
	bit D_DOWN_F, b
	jr nz, .right_down
	ret
.left_up
	cpl
	inc a ; -$8
.right_down
	add [hl]
	ld [hl], a
	ret

GetConnectedLevel1CoordsInTilemap:
	ld a, [wOWTilemapPtr + 0]
	ld [wTempOWTilemapPtr + 0], a
	ld a, [wOWTilemapPtr + 1]
	ld [wTempOWTilemapPtr + 1], a
	ld hl, wLevel1Coords
	call GetOWCoordInTilemap
	ret

Func_81feb:
	ld a, [w2d07f]
	and a
	ret z
	ld a, [wOWTilemapPtr + 1]
	ld h, a
	ld a, [wOWTilemapPtr + 0]
	ld l, a
	ld a, [hl]
	call .Func_8200f
	ld a, [wAttrToPlaceInOW]
	and $f8
	or c
	or $08
	ld [wAttrToPlaceInOW], a
	ld a, [w2d07f]
	dec a
	ret z
	debug_nop

.Func_8200f:
	ld c, $07
	ret

SetCompassSprite:
	ld a, [wCurMapSide]
	ld c, a
	ld hl, .coords
	ld de, wCompassObj
	ld b, 2
	call CopyHLToDE
	ld a, c
	ld [de], a
	ret

.coords
	; y, x
	db $14, $14

; unreferenced
Data_82026:
	db $14, $14, $14, $14, $14, $14

AddCompassSprite:
	ld hl, wCompassObj
	ld de, OAM_aa580
	ld b, BANK(OAM_aa580)
	call AddOWSpriteWithScroll
	ret

PlaySFX_12A:
	play_sfx SFX_12A
	ret

Func_82041:
	ld a, [wMapSideLevelID]
	ld c, a
	ld a, [w2d068]
	cp c
	jr z, .asm_82064
	ld hl, w2d10d
	ld a, [hl]
	and a
	call z, PlaySFX_12A
	inc [hl]
	ld a, [w2d10e]
	rlca
	ld c, $24
	jr nc, .asm_82060
	srl c
	srl c
.asm_82060
	ld a, [hl]
	cp c
	jr c, .asm_82068
.asm_82064
	xor a
	ld [w2d10d], a
.asm_82068
	ld a, [w2d10c]
	ld b, a
	ld a, [wLevelArrowDirections1]
	cp b
	jr z, Func_8208d
	ld [w2d10c], a
	ld c, OWWARIO_UP
	bit 6, a
	jr nz, .asm_82089
	ld c, OWWARIO_RIGHT
	bit 4, a
	jr nz, .asm_82089
	ld c, OWWARIO_LEFT
	bit 5, a
	jr nz, .asm_82089
	ld c, OWWARIO_DOWN
.asm_82089
	ld a, c
	call SetOWWarioOAM
;	fallthrough
Func_8208d:
	ld a, [w2d106]
	and a
	ret z
	ld hl, w2d109
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, w2d104
	ld b, $2a
	call UpdateOWAnimation
	ld hl, w2d107
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, w2d100
	ld b, $2a
	call AddOWSpriteWithScroll
	ret

; input:
; - a = OWWARIO_* constant
SetOWWarioOAM:
	ld [w2d106], a
	and a
	ret z
	ld bc, OAM_aa329
	cp $05
	jr c, .got_oam
	ld bc, OAM_aa0cf
.got_oam
	dec a
	add a ; *2
	ld e, a
	ld d, $00
	ld hl, .framesets
	add hl, de
	ld de, w2d109
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	ld hl, w2d107
	ld [hl], c
	inc l
	ld [hl], b
	ld hl, w2d104
	xor a
	ld [hli], a
	ld [hl], a
	ret

.framesets
	dw Frameset_aa405
	dw Frameset_aa416
	dw Frameset_aa427
	dw Frameset_aa438
	dw Frameset_aa25e

Func_820e6:
	call Func_82111
	ld a, [wLevelArrowDirections1]
	swap a
	rrca
	jr c, .asm_82100
	inc hl
	rrca
	jr c, .asm_82100
	inc hl
	rrca
	jr c, .asm_82100
	inc hl
	rrca
	jr c, .asm_82100
	debug_nop
.asm_82100
	ld a, [hl]
	ld [w2d068], a
	ld de, $4
	add hl, de
	ld a, [hl]
	ld [w2d071], a
	xor a
	ld [w2d072], a
	ret

Func_82111:
	ld a, [wMapSideLevelID]
	cp OW_EXITS
	jr c, .asm_8211f
	sub OW_EXIT_RIGHT
	ld hl, Data_8031e
	jr .got_table
.asm_8211f
	ld hl, Data_8023e
.got_table
	add a
	add a ; *4
	ld c, a
	ld a, [wNextMapSide]
	call GetCthWordFromAthTable
	ret

Func_8212c:
	ld a, [wMapSideLevelID]
	ld [wLevel1], a
	call GetMapLevelCoords
	ld a, [hli]
	ld [w2d069], a ; level x
	ld b, a
	ld a, [hli]
	ld [w2d06a], a ; level y
	ld c, a
	ld a, [hli]
	add b
	ld [wLevel1YCoord], a
	ld [w2d100], a
	ld a, [hl]
	add c
	ld [wLevel1XCoord], a
	ld [w2d101], a
	ret

; writes to wOWAllowedDPadInput the allowed
; d-pad inputs in the current OW position
GetOWAllowedDPadInput:
	ld a, [wMapSideLevelID]
	cp OWNORTH_JUNCTION
	jr z, .junction
	ld hl, w2d069
	call GetOWCoordInTilemap
	ld c, $00

	inc hl
	ld b, D_RIGHT
	call .CheckAllowedDirection

	dec hl
	dec hl
	ld b, D_LEFT
	call .CheckAllowedDirection

	inc hl
	ld de, -BG_MAP_WIDTH
	add hl, de
	ld b, D_UP
	call .CheckAllowedDirection

	ld de, 2 * BG_MAP_WIDTH
	add hl, de
	ld b, D_DOWN
	call .CheckAllowedDirection

	ld a, c
	ld [wOWAllowedDPadInput], a
	ret

.CheckAllowedDirection
	ld a, [hl]
	cp $02
	jr z, .check
	cp $01
	jr z, .check
	ret

.check
	ld e, l
	ld d, h
	dec d
	dec d
	dec d
	ld a, [de] ; wAttrmap
	bit 3, a
	ret z ; not an arrow
	ld a, c
	or b
	ld c, a
	ret

.junction
	ld a, D_RIGHT | D_UP | D_DOWN
	ld [wOWAllowedDPadInput], a
	ret

Func_821a1:
	xor a
	ld [w2d0a0], a

	ld c, $02
	ld hl, wLevel1YCoord
	ld de, wLevel2YCoord
	call Func_821f9
	ld [w2d0a7], a

	ld c, $04
	ld hl, wLevel1XCoord
	ld de, wLevel2XCoord
	call Func_821f9
	ld [w2d0a8], a

	ld a, [w2d0a0]
	ld b, a
	ld hl, w2d0a7
	ld a, [hli]
	cp [hl] ; w2d0a8
	jr nc, .asm_821cf
	ld a, [hld]
	set 0, b
.asm_821cf
	ld [w2d0a1], a
	ld [w2d0a2], a
	ld a, [hl]
	ld [w2d0a3], a
	ld [w2d0a4], a
	ld a, b
	ld [w2d0a0], a
	lb de, $01, $01
	ld hl, w2d0a0
	bit 1, [hl]
	jr z, .asm_821ec
	ld d, $ff
.asm_821ec
	bit 2, [hl]
	jr z, .asm_821f2
	ld e, $ff
.asm_821f2
	ld hl, w2d0a5
	ld [hl], d
	inc l
	ld [hl], e ; w2d0a6
	ret

; output |[hl] - [de]| in a
; if [hl] >= [de], 'or' c with w2d0a0
Func_821f9:
	ld b, [hl]
	ld a, [de]
	sub b
	ret nc ; exit if [hl] < [de]
	cpl
	inc a
	ld b, a ; = difference between [hl] and [de]
	ld a, c
	ld hl, w2d0a0
	or [hl]
	ld [hl], a
	ld a, b
	ret

Func_82208:
	ld hl, w2d0a1
	ld a, [hl]
	and a
	ret z
	dec a
	ld [hl], a
	ld a, [w2d0a2]
	ld d, a
	ld hl, w2d0a3
	ld a, [w2d0a4]
	add [hl]
	ld [hl], a
	cp d
	call nc, Func_82224
	call Func_8222f
	ret

Func_82224:
	sub d
	ld [hl], a
	ld a, [w2d0a0]
	and $1
	xor $1
	jr Func_82234

Func_8222f:
	ld a, [w2d0a0]
	and $1
;	fallthrough

Func_82234:
	ld hl, wLevel1YCoord
	ld de, w2d0a5
	jr z, .asm_8223e
	inc e
	inc l
.asm_8223e
	ld a, [de]
	add [hl]
	ld [hl], a
	ret

UpdateTopBar:
	ld hl, wTopBarStateCounter
	inc [hl]
	ld a, [wTopBarState]
	and a
	ret z
	dec a
	jumptable

	dw .StartCloseBottomBar     ; TOPBARST_START_CLOSE_BOT_BAR
	dw .HandleBottomBarClose    ; TOPBARST_HANDLE_CLOSE_BOT_BAR
	dw .OpenTopBar              ; TOPBARST_OPEN
	dw .HandleInput             ; TOPBARST_INPUT
	dw .CloseTopBar             ; TOPBARST_CLOSE

	dw .Cutscene                ; TOPBARST_CUTSCENE
	dw .Collection              ; TOPBARST_COLLECTION
	dw .NextMap                 ; TOPBARST_NEXT_MAP

	dw .DayNight                ; TOPBARST_DAY_NIGHT
	dw .DelayDayNightTransition ; TOPBARST_DAY_NIGHT_DELAY
	dw .DoDayNightTransition    ; TOPBARST_DAY_NIGHT_TRANSITION

.StartCloseBottomBar:
	; mark bottom bar as closing
	call DrawBottomBar
	ld a, BOTBAR_CLOSING
	ld [wBottomBarAction], a
	xor a
	ld [wBottomBarState], a
	ld [wMagnifyingGlassCounter], a

	ld hl, wTopBarState
	inc [hl]
	ret

.HandleBottomBarClose:
	; wait until bottom bar is fully closed
	call HandleBottomBar
	call DrawBottomBar
	ld a, [wBottomBarAction]
	and a
	ret nz

	; bottom bar was closed
	play_sfx SFX_0E9

	; init top bar flags
	xor a
	set TOPBAR_COLLECTION_F, a
	ld [wTopBarSelection], a

	call .InitTopBarButtons
	call ApplyTopBarButtonAttributes

	ld a, LOW(rOCPS)
	ld [wPalConfig1Register], a
	ld a, HIGH(wTempPals2 palette 4)
	ld [wPalConfig1SourceHi], a
	ld a, LOW(wTempPals2 palette 4)
	ld [wPalConfig1SourceLo], a
	ld a, OCPSF_AUTOINC | palette 4
	ld [wPalConfig1Index], a
	ld a, 4 ; number of pals
	ld [wPalConfig1Number], a

	ld hl, wTopBarState
	inc [hl]
	ret

.InitTopBarButtons:
	call ShowTopBarSelectedButton
	call LoadTopBarButtonAttributes

	xor a
	ld [wOWUIObj1YCoord], a
	ld [wOWUIObj2YCoord], a
	ld a, $1c
	ld [wOWUIObj2XCoord], a
	call DrawTopBar

	ld hl, Pals_84a20
	ld de, wTempPals2 palette 4
	ld c, 4 palettes
	ld b, BANK(Pals_84a20)
	call CopyFarBytes
	ret

.OpenTopBar:
	ld a, [wSCY]
	dec a
	dec a
	ld [wSCY], a
	cp $ec
	jr nz, .still_opening
	; fully open, advance state
	ld a, [wTransitionParam]
	ld [w2d02c], a
	ld hl, wTopBarState
	inc [hl]
.still_opening
	call DrawTopBar
	ret

.HandleInput:
	call HandleTopBarSelection
	jr c, .done_input
	call HandleTopBarDPad
	jr c, .done_input
	ld a, [wJoypadPressed]
	and B_BUTTON | SELECT
	jr z, .done_input
	play_sfx SFX_0EA
	ld hl, wTopBarState
	inc [hl]
.done_input
	jp DrawTopBar

.CloseTopBar:
	ld a, [wSCY]
	inc a
	inc a
	ld [wSCY], a
	cp $04
	jr nz, .still_closing

	xor a
	ld [w2d013], a
	ld [wTopBarState], a ; TOPBARST_NONE
	ld hl, Pals_84900 palette 4
	ld de, 8 palettes
	ld a, [wCurMapSide]
	inc a
.loop
	dec a
	jr z, .got_pal
	add hl, de
	jr .loop
.got_pal
	ld de, wTempPals2 palette 4
	ld c, 4 palettes
	ld b, BANK(Pals_84900)
	call CopyFarBytes
	ld a, LOW(rOCPS)
	ld [wPalConfig1Register], a
	ld a, HIGH(wTempPals2 palette 4)
	ld [wPalConfig1SourceHi], a
	ld a, LOW(wTempPals2 palette 4)
	ld [wPalConfig1SourceLo], a
	ld a, OCPSF_AUTOINC | palette 4
	ld [wPalConfig1Index], a
	ld a, 4 ; number of pals
	ld [wPalConfig1Number], a

.still_closing
	call DrawTopBar
	ret

.Cutscene:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .skip_cutscene_wait
	ld a, [wTopBarStateCounter]
	cp 30
	jr c, .wait_cutscene
.skip_cutscene_wait
	ld a, [w2d00d]
	ld [wTransitionParam], a
	xor a
	ld [wSubState], a
	xor a
	ld hl, wTopBarStateCounter
	ld [hld], a
	ld a, TOPBARST_INPUT
	ld [hl], a ; wTopBarState
.wait_cutscene
	call DrawTopBar
	ret

.Collection:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .skip_collection_wait
	ld a, [wTopBarStateCounter]
	cp 30
	jr c, .wait_collection
.skip_collection_wait
	xor a
	ld hl, wTopBarStateCounter
	ld [hld], a
	ld a, TOPBARST_INPUT
	ld [hl], a ; wTopBarState
	ld a, SST_OVERWORLD_COLLECTION
	ld [wSubState], a
.wait_collection
	call DrawTopBar
	ret

.NextMap:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .skip_next_map_wait
	ld a, [wTopBarStateCounter]
	cp 30
	jr c, .wait_next_map
.skip_next_map_wait
	xor a
	ld hl, wTopBarStateCounter
	ld [hld], a
	ld a, TOPBARST_INPUT
	ld [hl], a ; wTopBarState
	ld a, [wOWUIObj1State]
	ld b, 1
	cp $0a
	jr nz, .prev_map
	ld b, -1
.prev_map
	ld hl, wNextMapSide
	ld a, b
	add [hl]
	and $3 ; wrap around
	ld [hl], a
	call .GetNextLevelIndex

	stop_music2

	xor a
	ld [w2d013], a
	ld [w2d014], a
	ld a, SST_OVERWORLD_08
	ld [wSubState], a

.wait_next_map
	call DrawTopBar
	ret

.GetNextLevelIndex:
	ld hl, .Indices
	call AddOffsetInPointerTable
	dec b
	jr z, .got_index
	inc hl
.got_index
	ld a, [hl]
	ld [wMapSideLevelID], a
	ld [w2d068], a
	ret

.Indices
	; left, right
	db OWNORTH_THE_PEACEFUL_VILLAGE, OWNORTH_THE_VAST_PLAIN   ; NORTH
	db OWWEST_DESERT_RUINS,          OWWEST_A_TOWN_IN_CHAOS   ; WEST
	db OWSOUTH_THE_GRASSLANDS,       OWSOUTH_TOWER_OF_REVIVAL ; SOUTH
	db OWEAST_THE_STAGNANT_SWAMP,    OWEAST_FOREST_OF_FEAR    ; EAST

.DayNight:
	call DrawTopBar
	ld a, [wOWUIObj1Frame]
	cp $04
	jr z, .do_spell
	cp $06
	ret nz
.do_spell
	call DoDayNightSpell
	call LoadTopBarButtonAttributes
	call ApplyTopBarButtonAttributes
	ld hl, wTopBarState
	inc [hl]
	ret

.DelayDayNightTransition:
	ld a, [wOWUIObj1State]
	cp $05
	jr z, .start_transition
	cp $07
	jr nz, .skip_transition
.start_transition
	ld hl, wTopBarState
	inc [hl]
.skip_transition
	call DrawTopBar
	ret

.DoDayNightTransition:
	farcall DayNightTransition
	ld a, [wOWPalTransitionState]
	and a
	jr nz, .still_transitioning

	di
	call VBlank_Overworld
	ei

	ld a, TOPBARST_INPUT
	ld [wTopBarState], a
.still_transitioning
	call DrawTopBar
	ret

HandleTopBarDPad:
	xor a
	ld a, [wTopBarSelection]
	ld b, a
	ld hl, wTopBarSelection
	ld a, [wJoypadPressed]
	ld c, a
	ld a, [wTopBarSelectableButtons]
	ld d, a
	bit D_RIGHT_F, c
	jr nz, .d_right
	bit D_LEFT_F, c
	jr nz, .d_left
	ret

.d_right
	; find the first item to the right
	; that can be selectable
	ld a, d
	rrc b
	ret c
	and b
	jr z, .d_right

.got_selection
	ld [hl], b
	call ShowTopBarSelectedButton
	call LoadTopBarButtonAttributes
	call ApplyTopBarButtonAttributes
	play_sfx SFX_0E2
	scf
	ret

.d_left
	; find the first item to the left
	; that can be selectable
	ld a, d
	sla b
	bit (TOPBAR_PREV_MAP_F + 1), b
	ret nz
	and b
	jr z, .d_left
	jr .got_selection

ShowTopBarSelectedButton:
	ld a, [wTopBarSelection]
	ld c, $00
	bit TOPBAR_DAY_NIGHT_F, a
	jr nz, .day_night
	inc c
	bit TOPBAR_CUTSCENE_F, a
	jr nz, .got_selection
	inc c
	bit TOPBAR_COLLECTION_F, a
	jr nz, .got_selection
	inc c
	bit TOPBAR_NEXT_MAP_F, a
	jr nz, .got_selection
	inc c
	bit TOPBAR_PREV_MAP_F, a ; unnecessary
.got_selection
	ld a, c
	add a ; *2
	ld e, a
	ld d, $00
	ld hl, .button_data
	add hl, de
	ld a, [hli]
	ld [wOWUIObj1XCoord], a
	ld a, [hl]
	ld hl, wOWUIObj1State
	ld [hld], a
	xor a
	ld [hld], a
	ld [hl], a ; FramesetOffset

	; if either Next Map or Prev Map are selected
	; then show the NEXT MAP indicator
	ld c, $00
	ld a, [wTopBarSelection]
	and TOPBAR_NEXT_MAP | TOPBAR_PREV_MAP
	jr z, .no_next_map
	ld c, $0b ; NEXT MAP indicator
.no_next_map
	ld a, c
	ld hl, wOWUIObj2State
	ld [hld], a
	xor a
	ld [hld], a
	ld [hl], a ; wOWUIObj2Duration
	ret

.day_night
	ld a, [w2d011]
	and a
	jr z, .got_selection
	ld c, $05 ; night spell
	jr .got_selection

.button_data
; x coord, state
	db $60, $07 ; Day Spell
	db $50, $03 ; Cutscene
	db $40, $01 ; Collection
	db $2c, $0d ; Next Map
	db $0c, $09 ; Prev Map
	db $60, $05 ; Night Spell

DrawTopBar:
	call Func_824f1
	call Func_8250a
	ret

Func_824f1:
	xor a
	ld [wOWAnimationFinished], a
	ld a, [wOWUIObj1State]
	ld hl, wOWUIObj1Duration
	call Func_82521
	ld b, BANK(OAM_a9fe2)
	ld de, OAM_a9fe2
	ld hl, wOWUIObj1
	call AddOWSpriteWithScroll
	ret

Func_8250a:
	ld a, [wOWUIObj2State]
	and a
	ret z
	ld hl, wOWUIObj2Duration
	call Func_82521
	ld b, BANK(OAM_a9fe2)
	ld de, OAM_a9fe2
	ld hl, wOWUIObj2
	call AddOWSpriteWithScroll
	ret

Func_82521:
	push hl
	jumptable

	dw .Func_82541
	dw .Func_82543
	dw .Func_82548
	dw .Func_8254d
	dw .Func_82552
	dw .Func_82557
	dw .Func_8255c
	dw .Func_82567
	dw .Func_8256c
	dw .Func_82577
	dw .Func_8257c
	dw .Func_82581
	dw .Func_82586
	dw .Func_8258b
	dw .Func_82590

.Func_82541
	pop hl
	ret

.Func_82543
	ld de, Frameset_aa091
	jr .UpdateAnimation_PopHL

.Func_82548
	ld de, Frameset_aa094
	jr .UpdateAnimation_PopHL

.Func_8254d
	ld de, Frameset_aa097
	jr .UpdateAnimation_PopHL

.Func_82552
	ld de, Frameset_aa09a
	jr .UpdateAnimation_PopHL

.Func_82557
	ld de, Frameset_aa09d
	jr .UpdateAnimation_PopHL

.Func_8255c
	ld de, Frameset_aa0bc
	pop hl
	call .UpdateAnimation
	ld b, $07
	jr .Func_8259a

.Func_82567
	ld de, Frameset_aa0a3
	jr .UpdateAnimation_PopHL

.Func_8256c
	ld de, Frameset_aa0c1
	pop hl
	call .UpdateAnimation
	ld b, $05
	jr .Func_8259a

.Func_82577
	ld de, Frameset_aa0a9
	jr .UpdateAnimation_PopHL

.Func_8257c
	ld de, Frameset_aa0ae
	jr .UpdateAnimation_PopHL

.Func_82581
	ld de, Frameset_aa0b1
	jr .UpdateAnimation_PopHL

.Func_82586
	ld de, Frameset_aa0c6
	jr .UpdateAnimation_PopHL

.Func_8258b
	ld de, Frameset_aa0b4
	jr .UpdateAnimation_PopHL

.Func_82590
	ld de, Frameset_aa0b9
;	fallthrough

.UpdateAnimation_PopHL
	pop hl
;	fallthrough
.UpdateAnimation
	ld b, $2a
	call UpdateOWAnimation
	ret

.Func_8259a
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	set 2, l
	ld d, h
	ld e, l
	xor a
	ld [de], a
	inc e
	ld [de], a
	inc e
	ld a, b
	ld [de], a
	call Func_82521
	ret

; waits for A button, then executes
; the function that is currently selected
; return carry set if selection was done
HandleTopBarSelection:
	xor a ; reset carry flag
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z ; no A button

	ld a, [wTopBarSelection]
	bit TOPBAR_DAY_NIGHT_F, a
	jr nz, .DayNight
	bit TOPBAR_CUTSCENE_F, a
	jr nz, .Cutscene
	bit TOPBAR_COLLECTION_F, a
	jr nz, .Collection
	bit TOPBAR_NEXT_MAP_F, a
	jr nz, .NextMap
	bit TOPBAR_PREV_MAP_F, a
	jr nz, .PrevMap
	xor a
	ret

.DayNight
	call .ShowPressedButton
	debgcoord 11, 19, wAttrmap
	call .ApplyPressedButtonAttrs
	ld a, TOPBARST_DAY_NIGHT
	ld [wTopBarState], a

.play_selection_sfx
	play_sfx SFX_SELECTION
	scf
	ret

.Cutscene
	ld a, [w2d00d]
	and a
	ret z
	call .ShowPressedButton
	debgcoord 9, 19, wAttrmap
	call .ApplyPressedButtonAttrs
	ld a, TOPBARST_CUTSCENE
	ld [wTopBarState], a
	xor a
	ld [wTopBarStateCounter], a
	jr .play_selection_sfx

.Collection
	call .ShowPressedButton
	debgcoord 7, 19, wAttrmap
	call .ApplyPressedButtonAttrs
	ld a, TOPBARST_COLLECTION
	ld [wTopBarState], a
	xor a
	ld [wTopBarStateCounter], a
	ld a, FALSE
	ld [wIsCollectionOpen], a
	jr .play_selection_sfx

.NextMap
	call .ShowPressedButton
	call .ShowNextMapIndicatorFlash
	ld a, TOPBARST_NEXT_MAP
	ld [wTopBarState], a
	xor a
	ld [wTopBarStateCounter], a
	jr .play_selection_sfx

.PrevMap
	call .ShowPressedButton
	call .ShowNextMapIndicatorFlash
	ld a, TOPBARST_NEXT_MAP
	ld [wTopBarState], a
	xor a
	ld [wTopBarStateCounter], a
	jr .play_selection_sfx

.ShowNextMapIndicatorFlash:
	ld hl, wOWUIObj2State
	jr .adv_obj_state

.ShowPressedButton:
	ld hl, wOWUIObj1State
;	fallthrough

.adv_obj_state
	ld a, [hl]
	inc a
	ld [hld], a
	xor a
	ld [hld], a
	ld [hl], a
	ret

.ApplyPressedButtonAttrs:
	ld hl, Data_826ee
	call Func_8269f
	call ApplyTopBarButtonAttributes
	ret

LoadTopBarButtonAttributes:
	ld a, [wTopBarSelectableButtons]
	ld b, a

	; Day/Night Spell
	ld hl, Data_826c6
	debgcoord 11, 19, wAttrmap
	call .LoadSelectableAttrs

	; Cutscene
	ld hl, Data_826ce
	debgcoord 9, 19, wAttrmap
	call .LoadSelectableAttrs

	; Collection
	ld hl, Data_826d6
	debgcoord 7, 19, wAttrmap
	call .LoadSelectableAttrs

	ld a, [wTopBarSelection]
	ld b, a

	; Day/Night Spell
	ld hl, Data_826de
	debgcoord 11, 19, wAttrmap
	call .LoadSelectedAttrs

	; Cutscene
	ld hl, Data_826de
	debgcoord 9, 19, wAttrmap
	call .LoadSelectedAttrs

	; Collection
	ld hl, Data_826e6
	debgcoord 7, 19, wAttrmap
	call .LoadSelectedAttrs ; can be fallthrough
	ret

.LoadSelectedAttrs
	srl b
	ret nc
	jr Func_8269f

.LoadSelectableAttrs
	srl b
	jr c, Func_8269f
	ld hl, Data_826be ; non-selectable
;	fallthrough

Func_8269f:
; loops twice, once for de + (2 * BG_MAP_WIDTH)
; and then for the original de
	push de
	ld a, e
	add 2 * BG_MAP_WIDTH
	ld e, a
	ld a, $00
	adc d
	ld d, a
	ld c, 2
.loop
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	dec e
	ld a, e
	add BG_MAP_WIDTH
	ld e, a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	dec c
	ret z
	pop de
	jr .loop

Data_826be:
	db $3c, $3c, $3d, $3d
	db $0f, $2f, $0f, $2f

Data_826c6:
	db $3e, $3e, $3f, $3f
	db $0f, $2f, $0f, $2f

Data_826ce:
	db $3a, $3a, $3b, $3b
	db $0f, $2f, $0f, $2f

Data_826d6:
	db $38, $38, $39, $39
	db $0f, $2f, $0f, $2f

Data_826de:
	db $34, $35, $36, $37
	db $0f, $0f, $0f, $0f

Data_826e6:
	db $30, $31, $32, $33
	db $0f, $0f, $0f, $0f

Data_826ee:
	db $48, $49, $4a, $4b
	db $0f, $0f, $0f, $0f

ApplyTopBarButtonAttributes:
	ld a, HIGH(wAttrmap tile $2a)
	ld [wHDMASourceHi], a
	ld a, LOW(wAttrmap tile $2a)
	ld [wHDMASourceLo], a
	ld a, $1b
	ld [wHDMADestHi], a
	ld a, $c0
	ld [wHDMADestLo], a
	ld a, $4 dma_tiles
	ld [wHDMAMode], a

	ld a, HIGH(wAttrmap tile $26)
	ld [w2d0b5SourceHi], a
	ld a, LOW(wAttrmap tile $26)
	ld [w2d0b5SourceLo], a
	ld a, $1b
	ld [w2d0b5DestHi], a
	ld a, $c0
	ld [w2d0b5DestLo], a
	ld a, $4 dma_tiles
	ld [w2d0b5Mode], a
	ret

; unreferenced
UnreferencedLCD_82729:
	ld hl, .func
	ld de, wLCDFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
LOAD UNION "LCD Function", WRAM0
	push af
	push bc
	push de
	push hl
	ld a, $02
	ldh [rSVBK], a
	wait_ppu_free
	ld hl, rLCDC
	set LCDCB_BG9C00, [hl]
	ldh [rSCY], a
	ldh [rSCX], a
	xor a
	ldh [rSVBK], a
	pop hl
	pop de
	pop bc
	pop af
	reti
ENDL
.func_end

; unreferenced
UnreferencedLCD_82754:
	ld hl, .func
	ld de, wLCDFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
LOAD UNION "LCD Function", WRAM0
	reti
ENDL
.func_end

HandleBottomBar:
	ld a, [wMapSideLevelID]
	ld c, a
	ld a, [w2d068]
	cp c
	jr nz, .asm_82788
	ld a, [wBottomBarAction]
	cp BOTBAR_CLOSING
	jp z, .CloseBottomBar
	cp BOTBAR_OPENING
	jp z, .OpenBottomBar
	call .CheckBottomBarPossible
	ret c
	ld a, [wBottomBarAction]
	cp BOTBAR_OPENED
	jr z, .HandleOpenedBottomBar
	cp BOTBAR_CLOSED
	jr z, .HandleClosedBottomBar
	ret

.asm_82788
	xor a
	ld [w2d096], a
	ld a, [wBottomBarAction]
	and a
	ret z ; is closed already
	cp BOTBAR_CLOSING
	jp z, .CloseBottomBar

	ld a, BOTBAR_CLOSING
	ld [wBottomBarAction], a
	xor a
	ld [wBottomBarState], a
	ld [wMagnifyingGlassCounter], a
	ret

; returns carry if opening
; the bottom bar is not possible
.CheckBottomBarPossible
	ld a, [wOWLevel]
	add a
	; if it's either $00 (the Temple) or $80 (Junction)
	; then this will set z flag
	jr z, .set_carry
	ld a, [w2d013]
	cp $05
	jr nz, .set_carry
	and a
	ret
.set_carry
	scf
	ret

.HandleClosedBottomBar
	ld a, [wHasMagnifyingGlass]
	and a
	ret z ; no magnifying glass, exit
	ld hl, wMagnifyingGlassCounter
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jr nz, .b_btn_down
	; reset counter
	xor a
	ld [hl], a
	ret
.b_btn_down
	inc [hl]
	ld a, [hl]
	cp 10
	ret c
	ld a, BOTBAR_OPENING
	ld [wBottomBarAction], a
	xor a
	ld [wBottomBarState], a
	ret

.HandleOpenedBottomBar
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	ret nz ; B button still pressed

	; no longer pressing B,
	; begin closing bar
	ld hl, wBottomBarFlags
	res 4, [hl]
	ld a, BOTBAR_CLOSING
	ld [wBottomBarAction], a
	xor a
	ld [wBottomBarState], a
	ret

.OpenBottomBar
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jr z, .no_b_btn
	ld a, [wBottomBarState]
	jumptable

	dw .InitBar
	dw .OpenWindow
	dw .SetVisibleTreasures
	dw .SetBottomBarAsOpen

.no_b_btn
	ld hl, wBottomBarFlags
	res 4, [hl]
	ld a, BOTBAR_CLOSING
	ld [wBottomBarAction], a
	xor a
	ld [wBottomBarState], a
	ret

.InitBar
	ld hl, wBottomBarFlags
	set 4, [hl]
	xor a
	ld [wHDMA], a
	ld [w2d0b5], a
	ld hl, wBottomBarState
	inc [hl]
	ret

.OpenWindow
	ld hl, wWY
	ld b, [hl]
	ld a, $78
	cp b
	jr nc, .cap_min_wy
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret
.cap_min_wy
	ld [hl], a
	xor a
	ld [wMagnifyingGlassCounter], a
	ld hl, wBottomBarState
	inc [hl]
	ret

.SetVisibleTreasures
	ld hl, wMagnifyingGlassCounter
	inc [hl]
	ld a, [hl]
	cp $03
	ret c
	xor a
	ld [hl], a

; here, we use the divider register to
; determine which treasure gfx to load
; so that they appear in "random" time intervals
	ld hl, wBottomBarFlags
.loop_outer ; loop until we set a bit that is unset
	ldh a, [rDIV]
	and $0f
	inc a
	ld c, $00
	scf
.loop_inner
	rl c
	dec a
	jr nz, .loop_inner
	; make it so the set bit is
	; in the bottom nybble
	ld a, $0f
	and c
	jr nz, .bottom_nybble_bit
	swap c
.bottom_nybble_bit
	ld a, c
	and [hl]
	jr nz, .loop_outer ; loop if is already set

	ld a, c
	or [hl]
	ld [hl], a
	and $0f
	cp $0f
	ret nz ; exit if still some unset bits
	; all set, advance
	ld hl, wBottomBarState
	inc [hl]
	ret

.SetBottomBarAsOpen
	ld a, BOTBAR_OPENED
	ld [wBottomBarAction], a
	xor a
	ld [wBottomBarState], a
	ld hl, wBottomBarFlags
	bit 6, [hl]
	ret z
	set 7, [hl]
	ret

.CloseBottomBar
	ld a, [wBottomBarState]
	jumptable

	dw .CloseWindow
	dw .DeinitBar

.CloseWindow
	ld hl, wWY
	ld a, [hl]
	cp SCREEN_HEIGHT_PX
	jr nc, .cap_max_wy
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ret
.cap_max_wy
	ld [hl], SCREEN_HEIGHT_PX
	ld hl, wBottomBarState
	inc [hl]
	ret

.DeinitBar
	ld hl, wBottomBarFlags
	ld a, $1 << 6
	and [hl]
	ld [hl], a
	xor a
	ld [wCompassObjState], a
	ld [wCompassObjUnk7], a
	xor a ; unnecessary
	ld [wBottomBarAction], a
	xor a ; unnecessary
	ld [wBottomBarState], a
	ld [wMagnifyingGlassCounter], a
	ret

DrawBottomBar:
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jp nz, Func_82997

	ld a, [wLevelGreyTreasurePal]
	ld c, a
	ld e, $00
	ld a, [wBottomBarFlags]
	bit 0, a
	jr nz, .has_grey
	ld e, $09
	ld c, $00
.has_grey
	ld d, $20
	call AddSpriteInsideWindow_Low

	ld a, [wLevelRedTreasurePal]
	ld c, a
	ld e, $01
	ld a, [wBottomBarFlags]
	bit 1, a
	jr nz, .has_red
	ld e, $09
	ld c, $00
.has_red
	ld d, $3c
	call AddSpriteInsideWindow_Low

	ld a, [wLevelGreenTreasurePal]
	ld c, a
	ld e, $02
	ld a, [wBottomBarFlags]
	bit 2, a
	jr nz, .has_green
	ld e, $09
	ld c, $00
.has_green
	ld d, $58
	call AddSpriteInsideWindow_Low

	ld a, [wLevelBlueTreasurePal]
	ld c, a
	ld e, $03
	ld a, [wBottomBarFlags]
	bit 3, a
	jr nz, .has_blue
	ld e, $09
	ld c, $00
.has_blue
	ld d, $74
	call AddSpriteInsideWindow_Low

	call DrawBottomBarButtonPrompt
	call DrawBottomBar8Coin
	ret

AddSpriteInsideWindow_High:
	ld b, $20
	jr AddSpriteInsideWindow

AddSpriteInsideWindow_Low:
	ld b, $24
;	fallthrough

; b = y coord
; d = x coord
; e = tile ID
; c = attributes
AddSpriteInsideWindow:
	ld a, [wWY]
	add b
	ld [wCurSpriteYCoord], a
	ld a, [wWX]
	add d
	ld [wCurSpriteXCoord], a
	ld a, e
	ld [wCurSpriteFrame], a
	ld a, c
	ld [wCurSpriteAttributes], a
	ld hl, OAM_aa0cf
	ld b, BANK(OAM_aa0cf)
	call AddOWSpriteWithScroll_GotParams
	ret

DrawBottomBar8Coin:
	ld a, [wBottomBarFlags]
	bit 7, a
	ret z
	ld hl, wCompassObjState
	ld de, Frameset_aa2fb
	ld b, BANK(Frameset_aa2fb)
	call UpdateOWAnimation
	ld d, $90
	ld hl, wCompassObjDuration
	ld a, [hli]
	ld e, a
	ld c, $00
	jr AddSpriteInsideWindow_Low

DrawBottomBarButtonPrompt:
	ld a, [wHasMagnifyingGlass]
	and a
	ret z
	ld b, $04
	ld a, [wOWLevel]
	add a
	jr nz, .asm_8296c
	; wOWLevel == $00 or $80
	ld b, $06
	jr .got_tile
.asm_8296c
	ld a, [wBottomBarFlags]
	bit 4, a
	jr z, .got_tile
	ld b, $05
.got_tile
	ld a, b
	ld [wCurSpriteFrame], a
	ld a, [wWY]
	add $10
	ld [wCurSpriteYCoord], a
	ld a, [wWX]
	add $10
	ld [wCurSpriteXCoord], a
	ld a, $00
	ld [wCurSpriteAttributes], a
	ld hl, OAM_aa580
	ld b, BANK(OAM_aa580)
	call AddOWSpriteWithScroll_GotParams
	ret

Func_82997:
	call Func_829a1
	call DrawBottomBarButtonPrompt
	call DrawBottomBar8Coin
	ret

Func_829a1:
	ld a, [w2d0ee]
	and $f0
	swap a ; top nybble
	add $1e
	ld e, a
	ld c, $00
	ld d, $50
	call AddSpriteInsideWindow_High
	ld a, [w2d0ee]
	and $0f ; bottom nybble
	add $1e
	ld e, a
	ld c, $00
	ld d, $58
	call AddSpriteInsideWindow_High
	ld a, [w2d0ef]
	and $f0
	swap a ; top nybble
	add $1e
	ld e, a
	ld c, $00
	ld d, $68
	call AddSpriteInsideWindow_High
	ld a, [w2d0ef]
	and $0f ; bottom nybbles
	add $1e
	ld e, a
	ld c, $00
	ld d, $70
	call AddSpriteInsideWindow_High
	ret

UnlockLevel:
	ld hl, wOWFuncCounter
	inc [hl]
	ld a, [w2d062]
	jumptable

	dw Func_82a79
	dw Func_82a0a
	dw Func_82a26
	dw Func_82a2f
	dw Func_82a4e
	dw Func_82a62
	dw Func_82a96
	dw Func_82a9b
	dw Func_82aae
	dw Func_82a9b
	dw Func_82aea
	dw Func_82a9b
	dw Func_82b22
	dw Func_82b67
	dw Func_82b7b
	dw Func_82baa

; fade to grey
Func_82a0a:
	farcall OWGreyTransition
	ld a, [wOWPalTransitionState]
	and a
	ret nz
	; done fading
	di
	call VBlank_80cb1
	ei
	jp Func_82a8d

Func_82a26:
	ld a, 20
	ld hl, wOWFuncCounter
	cp [hl]
	ret nc
	jr Func_82a8d

Func_82a2f:
	ld a, [wCutsceneMapSide]
	ld b, a ; map side
	ld a, [wLevel2]
	ld d, a ; map side level index
	cp OW_EXITS
	jr nc, .is_exit
	call LoadLevelName
	xor a
	ld [wPalConfig1TotalSteps], a
	jr Func_82a8d

.is_exit
	; skip name fade in
	ld a, $2
	ld hl, w2d062
	add [hl]
	ld [hld], a
	xor a
	ld [hl], a ; wOWFuncCounter
	ret

Func_82a4e:
	farcall FadeInLevelName
	srl c
	ret c
	jr Func_82a8d

Func_82a62:
	ld a, [wOWFuncCounter]
	cp 16
	ret c
	farcall LoadOWStarIndicatorPals
	jr Func_82a8d

Func_82a79:
	call GetUnlockedOWLevelData
	xor a
	ld [w2d071], a
	ld [w2d072], a
	xor a
	ld hl, wCurSceneObj
	ld bc, $8
	call WriteAToHL_BCTimes
;	fallthrough

Func_82a8d:
	xor a
	ld [wOWFuncCounter], a
	ld hl, w2d062
	inc [hl]
	ret

Func_82a96:
	call GetUnlockedLevelArrows
	jr Func_82a8d

Func_82a9b:
	ld a, [w2d07f]
	and a
	jr z, .asm_82aa6
	xor a
	ld [wOWFuncCounter], a
	ret
.asm_82aa6
	ld a, [wOWFuncCounter]
	cp 4
	ret c
	jr Func_82a8d

Func_82aae:
	call IsLeftExitOrJunction
	jr z, Func_82a8d
	ld a, [wLevelArrowDirections1]
	call GetConnectedLevel1ArrowCoord
	call GetConnectedLevel1CoordsInTilemap
	ld a, [wLevelArrowDirections1]
	ld hl, wAttrToPlaceInOW
	call ShowLevelArrowInOW
	ld a, TRUE
	ld [w2d07f], a
	play_sfx SFX_103
Func_82ad2:
	call Func_81feb
	call Func_81f21
	jr Func_82a8d

; return z if 1st connected level is left exit
; or if it is North's map side junction
IsLeftExitOrJunction:
	ld a, [wLevel1]
	cp OW_EXIT_LEFT
	ret z ; is left exit
	ld c, a
	ld a, [wCutsceneMapSide]
	and a
	ret nz ; not North
	ld a, OWNORTH_JUNCTION
	cp c
	ret

Func_82aea:
	ld a, [wLevel2]
	cp OW_EXIT_RIGHT
	jr z, Func_82a8d
	ld a, [wLevel2XCoord]
	ld [wLevel1XCoord], a
	ld a, [wLevel2YCoord]
	ld [wLevel1YCoord], a
	ld a, [wLevelArrowDirections2]
	ld [wLevelArrowDirections1], a
	call GetConnectedLevel1ArrowCoord
	call GetConnectedLevel1CoordsInTilemap
	ld a, [wLevelArrowDirections1]
	ld hl, wAttrToPlaceInOW
	call ShowLevelArrowInOW
	ld a, $01
	ld [w2d07f], a
	play_sfx SFX_103
	jp Func_82ad2

Func_82b22:
	ld a, [wLevel2]
	cp OW_EXIT_RIGHT
	jp z, Func_82a8d
	ld hl, wLevel2Coords
	call GetOWCoordInTilemap
	ld hl, wAttrToPlaceInOW
	call ShowLevelPointInOW
	ld a, $01
	ld [w2d07f], a
	jp Func_82ad2

ShowLevelPointInOW:
	ld b, a
	xor a
	ld [hld], a ; attribute
	ld a, $00 ; unnecessary
	ld [hl], a ; tile
	ret

ShowLevelArrowInOW:
	ld b, a
	xor a
	ld [hl], a ; attribute
	bit D_RIGHT_F, b
	jr nz, .right
	bit D_LEFT_F, b
	jr nz, .left
	bit D_UP_F, b
	jr nz, .up
	bit D_DOWN_F, b
	jr nz, .down
	ret
.left
	set 5, [hl] ; x-flip
.right
	dec l
	ld a, $02 ; horizontal arrow
	ld [hl], a ; tile
	ret
.down
	set 6, [hl] ; y-flip
.up
	dec l
	ld a, $01 ; vertical arrow
	ld [hl], a ; tile
	ret

Func_82b67:
	ld a, [w2d07f]
	and a
	jr z, .asm_82b72
	xor a
	ld [wOWFuncCounter], a
	ret
.asm_82b72
	ld a, [wOWFuncCounter]
	cp 30
	ret c
	jp Func_82a8d

Func_82b7b:
	ld a, [wOWFuncCounter]
	cp $01
	jr z, .asm_82b88
	cp $40
	ret c
	jp Func_82a8d
.asm_82b88
	ld a, [wLevel2]
	cp OW_EXITS
	jp nc, Func_82a8d
	ld a, [wLevel2YCoord]
	ld [wCurSceneObjYCoord], a
	ld a, [wLevel2XCoord]
	ld [wCurSceneObjXCoord], a
	ld a, $01
	ld [wCurSceneObjState], a
	play_sfx SFX_104
	ret

Func_82baa:
	ld a, [wOWFuncCounter]
	cp 30
	ret c
	xor a
	ld [wCutsceneActionParam], a
	ld [w2d062], a
	ret

Func_82bb8:
	ld a, [wOWCutsceneAction]
	cp UNLOCK_LEVEL
	ret nz
	ld a, [wCurSceneObjState]
	and a
	ret z
	ld de, Frameset_aa544
	ld hl, wCurSceneObjDuration
	ld b, BANK(Frameset_aa544)
	call UpdateOWAnimation
	ld hl, wCurSceneObj
	ld de, OAM_aa445
	ld b, BANK(OAM_aa445)
	call AddOWSpriteWithScroll
	ret

Func_82bda:
	ld a, [wOWCutsceneAction]
	cp HIGHLIGHT_LEVEL
	ret nz
	ld a, [wCurSceneObjState]
	and a
	ret z
	ld hl, wCurSceneObjDuration
	ld de, Frameset_aa555
	ld b, BANK(Frameset_aa555)
	call UpdateOWAnimation
	ld a, [wOWAnimationFinished]
	cp $ff
	jr z, .asm_82c03
	ld hl, wCurSceneObj
	ld de, OAM_aa445
	ld b, BANK(OAM_aa445)
	call AddOWSpriteWithScroll
	ret
.asm_82c03
	ld hl, wCurSceneObjState
	xor a
	ld [hl], a
	ret

Func_82c09:
	ld a, [w2d065]
	cp $80
	ret nz
	ld hl, Pals_848e0
	ld de, wTempPals2 palette 4
	ld c, 2 palettes
	ld b, BANK(Pals_848e0)
	call CopyFarBytes
	ret

Func_82c1d:
	ld hl, wOWFuncCounter
	cp [hl]
	ret nc
Func_82c22:
	xor a
	ld hl, wOWFuncCounter
	ld [hli], a
	inc [hl] ; w2d062
	ret

Func_82c29:
	xor a
	ld [wCutsceneActionParam], a
	ld hl, wOWFuncCounter
	ld [hli], a
	ld [hl], a ; w2d062
	ret

Func_82c33:
	ld hl, wOWFuncCounter
	inc [hl]
	ld a, [w2d062]
	jumptable
	dw .Func_82c55
	dw .Func_82c8f
	dw Func_82a0a
	dw Func_82a26
	dw Func_82a2f
	dw Func_82a4e
	dw Func_82a62
	dw .Func_82c93
	dw .Func_82cb0
	dw .Func_82c51
	dw Func_82c29

.Func_82c51:
	ld a, 30
	jr Func_82c1d

.Func_82c55:
	ld a, [wCurMapSide]
	sub 1
	ccf
	; carry set if not North
	ld a, [wCutsceneActionParam]
	sbc 0
	ld [wLevel2], a
	ld a, [w2d025]
	cp CUTSCENE_25
	jr z, .asm_82c71
	cp CUTSCENE_23
	jr z, .asm_82c78
.asm_82c6e
	jp Func_82c22

.asm_82c71
	ld a, $07
	ld [wCutsceneActionParam], a
	jr .asm_82c6e

.asm_82c78
	ld a, [wCurMapSide]
	cp EAST
	jr nz, .asm_82c6e
	ld a, [wCutsceneActionParam]
	cp $07
	jr nz, .asm_82c6e
	ld a, MYSTERY_HANDLE
	call IsTreasureCollected
	jr nz, .asm_82c6e
	jr Func_82c29

.Func_82c8f:
	ld a, 12
	jr Func_82c1d

.Func_82c93:
	ld a, [wLevel2]
	ld c, a
	ld de, wCurSceneObj
	call SetObjPositionToLevelCoords
	ld a, $02
	ld hl, wCurSceneObjState
	call SetSceneObjState
	play_sfx SFX_104
	jp Func_82c22

.Func_82cb0:
	ld a, [wCurSceneObjState]
	and a
	ret nz
	jp Func_82c22
