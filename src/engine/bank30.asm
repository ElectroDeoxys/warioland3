; loads a room's function table, tilemap
; main and special tiles and its palettes
LoadRoomGfx::
	ld d, $00
	ld a, [wRoom]
	add a
	ld e, a
	rl d
	ld hl, RoomBlockAndGfxData
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	debug_assert_not $ff
	ld a, [hli]
	ld [wRoomBlockFunctionTable], a
	ld a, [hli]
	ld [wRoomTileMap], a
	ld a, [hli]
	ld [wRoomMainTiles], a
	ld a, [hli]
	ld [wRoomSpecialTiles], a
	ld a, [hl]
	ld [wRoomPalettes], a

; divide wRoomBlockFunctionTable by 6
	ld b, 0
	ld a, [wRoomBlockFunctionTable]
.loop
	sub $6
	jr c, .div_done
	inc b
	jr .loop
.div_done
	ld a, BANK("Level Data 1")
	add b
	ld [wRoomBlockFunctionTableBank], a
	call Func_298d
	call LoadBlockFunctionTable
	ld a, [wRoomBlockFunctionTableBank]
	ld [wc0d0], a
	call LoadRoomTileMap

	ld a, [wRoomMainTiles]
	srl a
	srl a
	srl a ; /8
	add BANK("Room Main Tiles 1")
	ld [wRoomMainTilesBank], a
	call LoadRoomMainTiles

	ld a, [wRoomSpecialTiles]
	srl a
	srl a
	srl a ; /8
	add BANK("Room Special Tiles 1")
	ld [wRoomSpecialTilesBank], a
	call LoadRoomSpecialTiles

	ld a, BANK("Level Palettes")
	ld [wPaletteBank], a
	call LoadRoomPalettes
	ret

InitRoomAnimatedTiles::
	ld hl, AnimatedTilesGroups
	ld d, $00
	ld a, [wAnimatedTilesGroup]
	add a ; *2
	ld e, a
	rl d
	add hl, de
	ld a, [hli]
	ld [wAnimatedTilesFrameDuration], a
	ld a, [hl]
	ld [wAnimatedTilesGfx], a
	xor a
	ld [wAnimatedTilesFrame], a
	ld [wAnimatedTilesFrameCount], a
	ret

InitRoomAnimatedPals::
	ld hl, RoomPalCycles
	ld d, $00
	ld a, [wRoomPalCycle]
	add a ; *2
	ld e, a
	rl d
	add hl, de
	ld a, [hli]
	ld [wRoomPalCyclePtr + 1], a
	ld a, [hld]
	ld [wRoomPalCyclePtr + 0], a
	ld l, [hl]
	ld h, a
	ld de, ROOM_PAL_CYCLE_LENGTH
	add hl, de
	ld a, [hl]
	ld [wRoomPalCycleDuration], a
	srl a ; /2
	ld [wRoomPalCycleCounter], a
	xor a
	ld [wRoomPalCycleIndex], a
	ret

LevelHeaders::
	dw .out_of_the_woods       ; OUT_OF_THE_WOODS_DAY_1
	dw .out_of_the_woods       ; OUT_OF_THE_WOODS_DAY_2
	dw .out_of_the_woods       ; OUT_OF_THE_WOODS_DAY_3
	dw .out_of_the_woods       ; OUT_OF_THE_WOODS_DAY_4
	dw .out_of_the_woods       ; OUT_OF_THE_WOODS_NIGHT_1
	dw .out_of_the_woods       ; OUT_OF_THE_WOODS_NIGHT_2
	dw .out_of_the_woods       ; OUT_OF_THE_WOODS_NIGHT_3
	dw .out_of_the_woods       ; OUT_OF_THE_WOODS_NIGHT_4
	dw .the_peaceful_village_1 ; THE_PEACEFUL_VILLAGE_DAY_1
	dw .the_peaceful_village_1 ; THE_PEACEFUL_VILLAGE_DAY_2
	dw .the_peaceful_village_1 ; THE_PEACEFUL_VILLAGE_DAY_3
	dw .the_peaceful_village_1 ; THE_PEACEFUL_VILLAGE_DAY_4
	dw .the_peaceful_village_2 ; THE_PEACEFUL_VILLAGE_NIGHT_1
	dw .the_peaceful_village_1 ; THE_PEACEFUL_VILLAGE_NIGHT_2
	dw .the_peaceful_village_1 ; THE_PEACEFUL_VILLAGE_NIGHT_3
	dw .the_peaceful_village_1 ; THE_PEACEFUL_VILLAGE_NIGHT_4
	dw .the_vast_plain_1       ; THE_VAST_PLAIN_DAY_1
	dw .the_vast_plain_1       ; THE_VAST_PLAIN_DAY_2
	dw .the_vast_plain_2       ; THE_VAST_PLAIN_DAY_3
	dw .the_vast_plain_2       ; THE_VAST_PLAIN_DAY_4
	dw .the_vast_plain_1       ; THE_VAST_PLAIN_NIGHT_1
	dw .the_vast_plain_1       ; THE_VAST_PLAIN_NIGHT_2
	dw .the_vast_plain_2       ; THE_VAST_PLAIN_NIGHT_3
	dw .the_vast_plain_2       ; THE_VAST_PLAIN_NIGHT_4
	dw .bank_of_the_wild_river ; BANK_OF_THE_WILD_RIVER_DAY_1
	dw .bank_of_the_wild_river ; BANK_OF_THE_WILD_RIVER_DAY_2
	dw .bank_of_the_wild_river ; BANK_OF_THE_WILD_RIVER_DAY_3
	dw .bank_of_the_wild_river ; BANK_OF_THE_WILD_RIVER_DAY_4
	dw .bank_of_the_wild_river ; BANK_OF_THE_WILD_RIVER_NIGHT_1
	dw .bank_of_the_wild_river ; BANK_OF_THE_WILD_RIVER_NIGHT_2
	dw .bank_of_the_wild_river ; BANK_OF_THE_WILD_RIVER_NIGHT_3
	dw .bank_of_the_wild_river ; BANK_OF_THE_WILD_RIVER_NIGHT_4
	dw .the_tidal_coast_1      ; THE_TIDAL_COAST_DAY_1
	dw .the_tidal_coast_1      ; THE_TIDAL_COAST_DAY_2
	dw .the_tidal_coast_1      ; THE_TIDAL_COAST_DAY_3
	dw .the_tidal_coast_1      ; THE_TIDAL_COAST_DAY_4
	dw .the_tidal_coast_2      ; THE_TIDAL_COAST_NIGHT_1
	dw .the_tidal_coast_2      ; THE_TIDAL_COAST_NIGHT_2
	dw .the_tidal_coast_2      ; THE_TIDAL_COAST_NIGHT_3
	dw .the_tidal_coast_2      ; THE_TIDAL_COAST_NIGHT_4
	dw .sea_turtle_rocks       ; SEA_TURTLE_ROCKS_DAY_1
	dw .sea_turtle_rocks       ; SEA_TURTLE_ROCKS_DAY_2
	dw .sea_turtle_rocks       ; SEA_TURTLE_ROCKS_DAY_3
	dw .sea_turtle_rocks       ; SEA_TURTLE_ROCKS_DAY_4
	dw .sea_turtle_rocks       ; SEA_TURTLE_ROCKS_NIGHT_1
	dw .sea_turtle_rocks       ; SEA_TURTLE_ROCKS_NIGHT_2
	dw .sea_turtle_rocks       ; SEA_TURTLE_ROCKS_NIGHT_3
	dw .sea_turtle_rocks       ; SEA_TURTLE_ROCKS_NIGHT_4
	dw .desert_ruins           ; DESERT_RUINS_DAY_1
	dw .desert_ruins           ; DESERT_RUINS_DAY_2
	dw .desert_ruins           ; DESERT_RUINS_DAY_3
	dw .desert_ruins           ; DESERT_RUINS_DAY_4
	dw .desert_ruins           ; DESERT_RUINS_NIGHT_1
	dw .desert_ruins           ; DESERT_RUINS_NIGHT_2
	dw .desert_ruins           ; DESERT_RUINS_NIGHT_3
	dw .desert_ruins           ; DESERT_RUINS_NIGHT_4
	dw .the_volcanos_base_1    ; THE_VOLCANOS_BASE_DAY_1
	dw .the_volcanos_base_1    ; THE_VOLCANOS_BASE_DAY_2
	dw .the_volcanos_base_1    ; THE_VOLCANOS_BASE_DAY_3
	dw .the_volcanos_base_2    ; THE_VOLCANOS_BASE_DAY_4
	dw .the_volcanos_base_1    ; THE_VOLCANOS_BASE_NIGHT_1
	dw .the_volcanos_base_1    ; THE_VOLCANOS_BASE_NIGHT_2
	dw .the_volcanos_base_1    ; THE_VOLCANOS_BASE_NIGHT_3
	dw .the_volcanos_base_2    ; THE_VOLCANOS_BASE_NIGHT_4
	dw .the_pool_of_rain_1     ; THE_POOL_OF_RAIN_DAY_1
	dw .the_pool_of_rain_2     ; THE_POOL_OF_RAIN_DAY_2
	dw .the_pool_of_rain_2     ; THE_POOL_OF_RAIN_DAY_3
	dw .the_pool_of_rain_2     ; THE_POOL_OF_RAIN_DAY_4
	dw .the_pool_of_rain_1     ; THE_POOL_OF_RAIN_NIGHT_1
	dw .the_pool_of_rain_2     ; THE_POOL_OF_RAIN_NIGHT_2
	dw .the_pool_of_rain_2     ; THE_POOL_OF_RAIN_NIGHT_3
	dw .the_pool_of_rain_2     ; THE_POOL_OF_RAIN_NIGHT_4
	dw .a_town_in_chaos        ; A_TOWN_IN_CHAOS_DAY_1
	dw .a_town_in_chaos        ; A_TOWN_IN_CHAOS_DAY_2
	dw .a_town_in_chaos        ; A_TOWN_IN_CHAOS_DAY_3
	dw .a_town_in_chaos        ; A_TOWN_IN_CHAOS_DAY_4
	dw .a_town_in_chaos        ; A_TOWN_IN_CHAOS_NIGHT_1
	dw .a_town_in_chaos        ; A_TOWN_IN_CHAOS_NIGHT_2
	dw .a_town_in_chaos        ; A_TOWN_IN_CHAOS_NIGHT_3
	dw .a_town_in_chaos        ; A_TOWN_IN_CHAOS_NIGHT_4
	dw .beneath_the_waves      ; BENEATH_THE_WAVES_DAY_1
	dw .beneath_the_waves      ; BENEATH_THE_WAVES_DAY_2
	dw .beneath_the_waves      ; BENEATH_THE_WAVES_DAY_3
	dw .beneath_the_waves      ; BENEATH_THE_WAVES_DAY_4
	dw .beneath_the_waves      ; BENEATH_THE_WAVES_NIGHT_1
	dw .beneath_the_waves      ; BENEATH_THE_WAVES_NIGHT_2
	dw .beneath_the_waves      ; BENEATH_THE_WAVES_NIGHT_3
	dw .beneath_the_waves      ; BENEATH_THE_WAVES_NIGHT_4
	dw .the_west_crater        ; THE_WEST_CRATER_DAY_1
	dw .the_west_crater        ; THE_WEST_CRATER_DAY_2
	dw .the_west_crater        ; THE_WEST_CRATER_DAY_3
	dw .the_west_crater        ; THE_WEST_CRATER_DAY_4
	dw .the_west_crater        ; THE_WEST_CRATER_NIGHT_1
	dw .the_west_crater        ; THE_WEST_CRATER_NIGHT_2
	dw .the_west_crater        ; THE_WEST_CRATER_NIGHT_3
	dw .the_west_crater        ; THE_WEST_CRATER_NIGHT_4
	dw .the_grasslands         ; THE_GRASSLANDS_DAY_1
	dw .the_grasslands         ; THE_GRASSLANDS_DAY_2
	dw .the_grasslands         ; THE_GRASSLANDS_DAY_3
	dw .the_grasslands         ; THE_GRASSLANDS_DAY_4
	dw .the_grasslands         ; THE_GRASSLANDS_NIGHT_1
	dw .the_grasslands         ; THE_GRASSLANDS_NIGHT_2
	dw .the_grasslands         ; THE_GRASSLANDS_NIGHT_3
	dw .the_grasslands         ; THE_GRASSLANDS_NIGHT_4
	dw .the_big_bridge         ; THE_BIG_BRIDGE_DAY_1
	dw .the_big_bridge         ; THE_BIG_BRIDGE_DAY_2
	dw .the_big_bridge         ; THE_BIG_BRIDGE_DAY_3
	dw .the_big_bridge         ; THE_BIG_BRIDGE_DAY_4
	dw .the_big_bridge         ; THE_BIG_BRIDGE_NIGHT_1
	dw .the_big_bridge         ; THE_BIG_BRIDGE_NIGHT_2
	dw .the_big_bridge         ; THE_BIG_BRIDGE_NIGHT_3
	dw .the_big_bridge         ; THE_BIG_BRIDGE_NIGHT_4
	dw .tower_of_revival       ; TOWER_OF_REVIVAL_DAY_1
	dw .tower_of_revival       ; TOWER_OF_REVIVAL_DAY_2
	dw .tower_of_revival       ; TOWER_OF_REVIVAL_DAY_3
	dw .tower_of_revival       ; TOWER_OF_REVIVAL_DAY_4
	dw .tower_of_revival       ; TOWER_OF_REVIVAL_NIGHT_1
	dw .tower_of_revival       ; TOWER_OF_REVIVAL_NIGHT_2
	dw .tower_of_revival       ; TOWER_OF_REVIVAL_NIGHT_3
	dw .tower_of_revival       ; TOWER_OF_REVIVAL_NIGHT_4
	dw .the_steep_canyon_1     ; THE_STEEP_CANYON_DAY_1
	dw .the_steep_canyon_2     ; THE_STEEP_CANYON_DAY_2
	dw .the_steep_canyon_2     ; THE_STEEP_CANYON_DAY_3
	dw .the_steep_canyon_2     ; THE_STEEP_CANYON_DAY_4
	dw .the_steep_canyon_1     ; THE_STEEP_CANYON_NIGHT_1
	dw .the_steep_canyon_2     ; THE_STEEP_CANYON_NIGHT_2
	dw .the_steep_canyon_2     ; THE_STEEP_CANYON_NIGHT_3
	dw .the_steep_canyon_2     ; THE_STEEP_CANYON_NIGHT_4
	dw .cave_of_flames         ; CAVE_OF_FLAMES_DAY_1
	dw .cave_of_flames         ; CAVE_OF_FLAMES_DAY_2
	dw .cave_of_flames         ; CAVE_OF_FLAMES_DAY_3
	dw .cave_of_flames         ; CAVE_OF_FLAMES_DAY_4
	dw .cave_of_flames         ; CAVE_OF_FLAMES_NIGHT_1
	dw .cave_of_flames         ; CAVE_OF_FLAMES_NIGHT_2
	dw .cave_of_flames         ; CAVE_OF_FLAMES_NIGHT_3
	dw .cave_of_flames         ; CAVE_OF_FLAMES_NIGHT_4
	dw .above_the_clouds_1     ; ABOVE_THE_CLOUDS_DAY_1
	dw .above_the_clouds_1     ; ABOVE_THE_CLOUDS_DAY_2
	dw .above_the_clouds_1     ; ABOVE_THE_CLOUDS_DAY_3
	dw .above_the_clouds_1     ; ABOVE_THE_CLOUDS_DAY_4
	dw .above_the_clouds_1     ; ABOVE_THE_CLOUDS_NIGHT_1
	dw .above_the_clouds_1     ; ABOVE_THE_CLOUDS_NIGHT_2
	dw .above_the_clouds_1     ; ABOVE_THE_CLOUDS_NIGHT_3
	dw .above_the_clouds_2     ; ABOVE_THE_CLOUDS_NIGHT_4
	dw .the_stagnant_swamp_1   ; THE_STAGNANT_SWAMP_DAY_1
	dw .the_stagnant_swamp_2   ; THE_STAGNANT_SWAMP_DAY_2
	dw .the_stagnant_swamp_2   ; THE_STAGNANT_SWAMP_DAY_3
	dw .the_stagnant_swamp_2   ; THE_STAGNANT_SWAMP_DAY_4
	dw .the_stagnant_swamp_1   ; THE_STAGNANT_SWAMP_NIGHT_1
	dw .the_stagnant_swamp_2   ; THE_STAGNANT_SWAMP_NIGHT_2
	dw .the_stagnant_swamp_2   ; THE_STAGNANT_SWAMP_NIGHT_3
	dw .the_stagnant_swamp_2   ; THE_STAGNANT_SWAMP_NIGHT_4
	dw .the_frigid_sea         ; THE_FRIGID_SEA_DAY_1
	dw .the_frigid_sea         ; THE_FRIGID_SEA_DAY_2
	dw .the_frigid_sea         ; THE_FRIGID_SEA_DAY_3
	dw .the_frigid_sea         ; THE_FRIGID_SEA_DAY_4
	dw .the_frigid_sea         ; THE_FRIGID_SEA_NIGHT_1
	dw .the_frigid_sea         ; THE_FRIGID_SEA_NIGHT_2
	dw .the_frigid_sea         ; THE_FRIGID_SEA_NIGHT_3
	dw .the_frigid_sea         ; THE_FRIGID_SEA_NIGHT_4
	dw .castle_of_illusions    ; CASTLE_OF_ILLUSIONS_DAY_1
	dw .castle_of_illusions    ; CASTLE_OF_ILLUSIONS_DAY_2
	dw .castle_of_illusions    ; CASTLE_OF_ILLUSIONS_DAY_3
	dw .castle_of_illusions    ; CASTLE_OF_ILLUSIONS_DAY_4
	dw .castle_of_illusions    ; CASTLE_OF_ILLUSIONS_NIGHT_1
	dw .castle_of_illusions    ; CASTLE_OF_ILLUSIONS_NIGHT_2
	dw .castle_of_illusions    ; CASTLE_OF_ILLUSIONS_NIGHT_3
	dw .castle_of_illusions    ; CASTLE_OF_ILLUSIONS_NIGHT_4
	dw .the_colossal_hole_1    ; THE_COLOSSAL_HOLE_DAY_1
	dw .the_colossal_hole_1    ; THE_COLOSSAL_HOLE_DAY_2
	dw .the_colossal_hole_1    ; THE_COLOSSAL_HOLE_DAY_3
	dw .the_colossal_hole_1    ; THE_COLOSSAL_HOLE_DAY_4
	dw .the_colossal_hole_2    ; THE_COLOSSAL_HOLE_NIGHT_1
	dw .the_colossal_hole_2    ; THE_COLOSSAL_HOLE_NIGHT_2
	dw .the_colossal_hole_2    ; THE_COLOSSAL_HOLE_NIGHT_3
	dw .the_colossal_hole_2    ; THE_COLOSSAL_HOLE_NIGHT_4
	dw .the_warped_void        ; THE_WARPED_VOID_DAY_1
	dw .the_warped_void        ; THE_WARPED_VOID_DAY_2
	dw .the_warped_void        ; THE_WARPED_VOID_DAY_3
	dw .the_warped_void        ; THE_WARPED_VOID_DAY_4
	dw .the_warped_void        ; THE_WARPED_VOID_NIGHT_1
	dw .the_warped_void        ; THE_WARPED_VOID_NIGHT_2
	dw .the_warped_void        ; THE_WARPED_VOID_NIGHT_3
	dw .the_warped_void        ; THE_WARPED_VOID_NIGHT_4
	dw .the_east_crater        ; THE_EAST_CRATER_DAY_1
	dw .the_east_crater        ; THE_EAST_CRATER_DAY_2
	dw .the_east_crater        ; THE_EAST_CRATER_DAY_3
	dw .the_east_crater        ; THE_EAST_CRATER_DAY_4
	dw .the_east_crater        ; THE_EAST_CRATER_NIGHT_1
	dw .the_east_crater        ; THE_EAST_CRATER_NIGHT_2
	dw .the_east_crater        ; THE_EAST_CRATER_NIGHT_3
	dw .the_east_crater        ; THE_EAST_CRATER_NIGHT_4
	dw .forest_of_fear         ; FOREST_OF_FEAR_DAY_1
	dw .forest_of_fear         ; FOREST_OF_FEAR_DAY_2
	dw .forest_of_fear         ; FOREST_OF_FEAR_DAY_3
	dw .forest_of_fear         ; FOREST_OF_FEAR_DAY_4
	dw .forest_of_fear         ; FOREST_OF_FEAR_NIGHT_1
	dw .forest_of_fear         ; FOREST_OF_FEAR_NIGHT_2
	dw .forest_of_fear         ; FOREST_OF_FEAR_NIGHT_3
	dw .forest_of_fear         ; FOREST_OF_FEAR_NIGHT_4
	dw .the_temple             ; THE_TEMPLE
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL

.out_of_the_woods
	dab OutOfTheWoodsBlockMap
	dw OutOfTheWoodsObjectMap
.the_peaceful_village_1
	dab ThePeacefulVillage1BlockMap
	dw ThePeacefulVillage1ObjectMap
.the_vast_plain_1
	dab TheVastPlain1BlockMap
	dw TheVastPlain1ObjectMap
.bank_of_the_wild_river
	dab BankOfTheWildRiverBlockMap
	dw BankOfTheWildRiverObjectMap
.the_tidal_coast_1
	dab TheTidalCoast1BlockMap
	dw TheTidalCoast1ObjectMap
.sea_turtle_rocks
	dab SeaTurtleRocksBlockMap
	dw SeaTurtleRocksObjectMap
.desert_ruins
	dab DesertRuinsBlockMap
	dw DesertRuinsObjectMap
.the_volcanos_base_1
	dab TheVolcanosBase1BlockMap
	dw TheVolcanosBase1ObjectMap
.the_pool_of_rain_1
	dab ThePoolOfRain1BlockMap
	dw ThePoolOfRain1ObjectMap
.a_town_in_chaos
	dab ATownInChaosBlockMap
	dw ATownInChaosObjectMap
.beneath_the_waves
	dab BeneathTheWavesBlockMap
	dw BeneathTheWavesObjectMap
.the_west_crater
	dab TheWestCraterBlockMap
	dw TheWestCraterObjectMap
.the_grasslands
	dab TheGrasslandsBlockMap
	dw TheGrasslandsObjectMap
.the_big_bridge
	dab TheBigBridgeBlockMap
	dw TheBigBridgeObjectMap
.tower_of_revival
	dab TowerOfRevivalBlockMap
	dw TowerOfRevivalObjectMap
.the_steep_canyon_1
	dab TheSteepCanyon1BlockMap
	dw TheSteepCanyon1ObjectMap
.cave_of_flames
	dab CaveOfFlamesBlockMap
	dw CaveOfFlamesObjectMap
.above_the_clouds_1
	dab AboveTheClouds1BlockMap
	dw AboveTheClouds1ObjectMap
.the_stagnant_swamp_1
	dab TheStagnantSwamp1BlockMap
	dw TheStagnantSwamp1ObjectMap
.the_frigid_sea
	dab TheFrigidSeaBlockMap
	dw TheFrigidSeaObjectMap
.castle_of_illusions
	dab CastleOfIllusionsBlockMap
	dw CastleOfIllusionsObjectMap
.the_colossal_hole_1
	dab TheColossalHole1BlockMap
	dw TheColossalHole1ObjectMap
.the_warped_void
	dab TheWarpedVoidBlockMap
	dw TheWarpedVoidObjectMap
.the_east_crater
	dab TheEastCraterBlockMap
	dw TheEastCraterObjectMap
.forest_of_fear
	dab ForestOfFearBlockMap
	dw ForestOfFearObjectMap
.the_temple
	dab HiddenFigureRoomBlockMap
	dw HiddenFigureRoomObjectMap
.the_vast_plain_2
	dab TheVastPlain2BlockMap
	dw TheVastPlain2ObjectMap
.the_volcanos_base_2
	dab TheVolcanosBase2BlockMap
	dw TheVolcanosBase2ObjectMap
.the_pool_of_rain_2
	dab ThePoolOfRain2BlockMap
	dw ThePoolOfRain2ObjectMap
.the_colossal_hole_2
	dab TheColossalHole2BlockMap
	dw TheColossalHole2ObjectMap
.the_tidal_coast_2
	dab TheTidalCoast2BlockMap
	dw TheTidalCoast2ObjectMap
.the_stagnant_swamp_2
	dab TheStagnantSwamp2BlockMap
	dw TheStagnantSwamp2ObjectMap
.above_the_clouds_2
	dab AboveTheClouds2BlockMap
	dw AboveTheClouds2ObjectMap
.the_steep_canyon_2
	dab TheSteepCanyon2BlockMap
	dw TheSteepCanyon2ObjectMap
.the_peaceful_village_2
	dab ThePeacefulVillage2BlockMap
	dw ThePeacefulVillage2ObjectMap

PointerTable_c0319::
	dw LevelRooms_c0d1f ; OUT_OF_THE_WOODS_DAY_1
	dw LevelRooms_c0d1f ; OUT_OF_THE_WOODS_DAY_2
	dw LevelRooms_c0e03 ; OUT_OF_THE_WOODS_DAY_3
	dw LevelRooms_c0ee7 ; OUT_OF_THE_WOODS_DAY_4
	dw LevelRooms_c0fcb ; OUT_OF_THE_WOODS_NIGHT_1
	dw LevelRooms_c0fcb ; OUT_OF_THE_WOODS_NIGHT_2
	dw LevelRooms_c10af ; OUT_OF_THE_WOODS_NIGHT_3
	dw LevelRooms_c1193 ; OUT_OF_THE_WOODS_NIGHT_4
	dw LevelRooms_c1277 ; THE_PEACEFUL_VILLAGE_DAY_1
	dw LevelRooms_c135b ; THE_PEACEFUL_VILLAGE_DAY_2
	dw LevelRooms_c135b ; THE_PEACEFUL_VILLAGE_DAY_3
	dw LevelRooms_c135b ; THE_PEACEFUL_VILLAGE_DAY_4
	dw LevelRooms_c143f ; THE_PEACEFUL_VILLAGE_NIGHT_1
	dw LevelRooms_c1523 ; THE_PEACEFUL_VILLAGE_NIGHT_2
	dw LevelRooms_c1523 ; THE_PEACEFUL_VILLAGE_NIGHT_3
	dw LevelRooms_c1523 ; THE_PEACEFUL_VILLAGE_NIGHT_4
	dw LevelRooms_c1607 ; THE_VAST_PLAIN_DAY_1
	dw LevelRooms_c1607 ; THE_VAST_PLAIN_DAY_2
	dw LevelRooms_c1607 ; THE_VAST_PLAIN_DAY_3
	dw LevelRooms_c16c3 ; THE_VAST_PLAIN_DAY_4
	dw LevelRooms_c177f ; THE_VAST_PLAIN_NIGHT_1
	dw LevelRooms_c177f ; THE_VAST_PLAIN_NIGHT_2
	dw LevelRooms_c177f ; THE_VAST_PLAIN_NIGHT_3
	dw LevelRooms_c183b ; THE_VAST_PLAIN_NIGHT_4
	dw LevelRooms_c18f7 ; BANK_OF_THE_WILD_RIVER_DAY_1
	dw LevelRooms_c18f7 ; BANK_OF_THE_WILD_RIVER_DAY_2
	dw LevelRooms_c18f7 ; BANK_OF_THE_WILD_RIVER_DAY_3
	dw LevelRooms_c19d3 ; BANK_OF_THE_WILD_RIVER_DAY_4
	dw LevelRooms_c1aaf ; BANK_OF_THE_WILD_RIVER_NIGHT_1
	dw LevelRooms_c1aaf ; BANK_OF_THE_WILD_RIVER_NIGHT_2
	dw LevelRooms_c1aaf ; BANK_OF_THE_WILD_RIVER_NIGHT_3
	dw LevelRooms_c1b8b ; BANK_OF_THE_WILD_RIVER_NIGHT_4
	dw LevelRooms_c1c67 ; THE_TIDAL_COAST_DAY_1
	dw LevelRooms_c1c67 ; THE_TIDAL_COAST_DAY_2
	dw LevelRooms_c1d2b ; THE_TIDAL_COAST_DAY_3
	dw LevelRooms_c1def ; THE_TIDAL_COAST_DAY_4
	dw LevelRooms_c1eb3 ; THE_TIDAL_COAST_NIGHT_1
	dw LevelRooms_c1eb3 ; THE_TIDAL_COAST_NIGHT_2
	dw LevelRooms_c1f77 ; THE_TIDAL_COAST_NIGHT_3
	dw LevelRooms_c203b ; THE_TIDAL_COAST_NIGHT_4
	dw LevelRooms_c20ff ; SEA_TURTLE_ROCKS_DAY_1
	dw LevelRooms_c21c3 ; SEA_TURTLE_ROCKS_DAY_2
	dw LevelRooms_c21c3 ; SEA_TURTLE_ROCKS_DAY_3
	dw LevelRooms_c2287 ; SEA_TURTLE_ROCKS_DAY_4
	dw LevelRooms_c234b ; SEA_TURTLE_ROCKS_NIGHT_1
	dw LevelRooms_c240f ; SEA_TURTLE_ROCKS_NIGHT_2
	dw LevelRooms_c240f ; SEA_TURTLE_ROCKS_NIGHT_3
	dw LevelRooms_c24d3 ; SEA_TURTLE_ROCKS_NIGHT_4
	dw LevelRooms_c2597 ; DESERT_RUINS_DAY_1
	dw LevelRooms_c2597 ; DESERT_RUINS_DAY_2
	dw LevelRooms_c2597 ; DESERT_RUINS_DAY_3
	dw LevelRooms_c2597 ; DESERT_RUINS_DAY_4
	dw LevelRooms_c267b ; DESERT_RUINS_NIGHT_1
	dw LevelRooms_c267b ; DESERT_RUINS_NIGHT_2
	dw LevelRooms_c267b ; DESERT_RUINS_NIGHT_3
	dw LevelRooms_c267b ; DESERT_RUINS_NIGHT_4
	dw LevelRooms_c275f ; THE_VOLCANOS_BASE_DAY_1
	dw LevelRooms_c275f ; THE_VOLCANOS_BASE_DAY_2
	dw LevelRooms_c283b ; THE_VOLCANOS_BASE_DAY_3
	dw LevelRooms_c283b ; THE_VOLCANOS_BASE_DAY_4
	dw LevelRooms_c2917 ; THE_VOLCANOS_BASE_NIGHT_1
	dw LevelRooms_c2917 ; THE_VOLCANOS_BASE_NIGHT_2
	dw LevelRooms_c29f3 ; THE_VOLCANOS_BASE_NIGHT_3
	dw LevelRooms_c29f3 ; THE_VOLCANOS_BASE_NIGHT_4
	dw LevelRooms_c2acf ; THE_POOL_OF_RAIN_DAY_1
	dw LevelRooms_c2acf ; THE_POOL_OF_RAIN_DAY_2
	dw LevelRooms_c2acf ; THE_POOL_OF_RAIN_DAY_3
	dw LevelRooms_c2b8b ; THE_POOL_OF_RAIN_DAY_4
	dw LevelRooms_c2c47 ; THE_POOL_OF_RAIN_NIGHT_1
	dw LevelRooms_c2c47 ; THE_POOL_OF_RAIN_NIGHT_2
	dw LevelRooms_c2c47 ; THE_POOL_OF_RAIN_NIGHT_3
	dw LevelRooms_c2d03 ; THE_POOL_OF_RAIN_NIGHT_4
	dw LevelRooms_c2dbf ; A_TOWN_IN_CHAOS_DAY_1
	dw LevelRooms_c2dbf ; A_TOWN_IN_CHAOS_DAY_2
	dw LevelRooms_c2dbf ; A_TOWN_IN_CHAOS_DAY_3
	dw LevelRooms_c2eab ; A_TOWN_IN_CHAOS_DAY_4
	dw LevelRooms_c2f97 ; A_TOWN_IN_CHAOS_NIGHT_1
	dw LevelRooms_c2f97 ; A_TOWN_IN_CHAOS_NIGHT_2
	dw LevelRooms_c2f97 ; A_TOWN_IN_CHAOS_NIGHT_3
	dw LevelRooms_c3083 ; A_TOWN_IN_CHAOS_NIGHT_4
	dw LevelRooms_c316f ; BENEATH_THE_WAVES_DAY_1
	dw LevelRooms_c316f ; BENEATH_THE_WAVES_DAY_2
	dw LevelRooms_c325b ; BENEATH_THE_WAVES_DAY_3
	dw LevelRooms_c3347 ; BENEATH_THE_WAVES_DAY_4
	dw LevelRooms_c3433 ; BENEATH_THE_WAVES_NIGHT_1
	dw LevelRooms_c3433 ; BENEATH_THE_WAVES_NIGHT_2
	dw LevelRooms_c351f ; BENEATH_THE_WAVES_NIGHT_3
	dw LevelRooms_c360b ; BENEATH_THE_WAVES_NIGHT_4
	dw LevelRooms_c36f7 ; THE_WEST_CRATER_DAY_1
	dw LevelRooms_c36f7 ; THE_WEST_CRATER_DAY_2
	dw LevelRooms_c3783 ; THE_WEST_CRATER_DAY_3
	dw LevelRooms_c380f ; THE_WEST_CRATER_DAY_4
	dw LevelRooms_c389b ; THE_WEST_CRATER_NIGHT_1
	dw LevelRooms_c389b ; THE_WEST_CRATER_NIGHT_2
	dw LevelRooms_c3927 ; THE_WEST_CRATER_NIGHT_3
	dw LevelRooms_c39b3 ; THE_WEST_CRATER_NIGHT_4
	dw LevelRooms_c3a3f ; THE_GRASSLANDS_DAY_1
	dw LevelRooms_c3b2b ; THE_GRASSLANDS_DAY_2
	dw LevelRooms_c3c17 ; THE_GRASSLANDS_DAY_3
	dw LevelRooms_c3c17 ; THE_GRASSLANDS_DAY_4
	dw LevelRooms_c4000 ; THE_GRASSLANDS_NIGHT_1
	dw LevelRooms_c40ec ; THE_GRASSLANDS_NIGHT_2
	dw LevelRooms_c41d8 ; THE_GRASSLANDS_NIGHT_3
	dw LevelRooms_c41d8 ; THE_GRASSLANDS_NIGHT_4
	dw LevelRooms_c42c4 ; THE_BIG_BRIDGE_DAY_1
	dw LevelRooms_c42c4 ; THE_BIG_BRIDGE_DAY_2
	dw LevelRooms_c42c4 ; THE_BIG_BRIDGE_DAY_3
	dw LevelRooms_c4360 ; THE_BIG_BRIDGE_DAY_4
	dw LevelRooms_c43fc ; THE_BIG_BRIDGE_NIGHT_1
	dw LevelRooms_c43fc ; THE_BIG_BRIDGE_NIGHT_2
	dw LevelRooms_c43fc ; THE_BIG_BRIDGE_NIGHT_3
	dw LevelRooms_c4498 ; THE_BIG_BRIDGE_NIGHT_4
	dw LevelRooms_c4534 ; TOWER_OF_REVIVAL_DAY_1
	dw LevelRooms_c45e8 ; TOWER_OF_REVIVAL_DAY_2
	dw LevelRooms_c469c ; TOWER_OF_REVIVAL_DAY_3
	dw LevelRooms_c4750 ; TOWER_OF_REVIVAL_DAY_4
	dw LevelRooms_c4804 ; TOWER_OF_REVIVAL_NIGHT_1
	dw LevelRooms_c48b8 ; TOWER_OF_REVIVAL_NIGHT_2
	dw LevelRooms_c496c ; TOWER_OF_REVIVAL_NIGHT_3
	dw LevelRooms_c4a20 ; TOWER_OF_REVIVAL_NIGHT_4
	dw LevelRooms_c4ad4 ; THE_STEEP_CANYON_DAY_1
	dw LevelRooms_c4ad4 ; THE_STEEP_CANYON_DAY_2
	dw LevelRooms_c4ad4 ; THE_STEEP_CANYON_DAY_3
	dw LevelRooms_c4b80 ; THE_STEEP_CANYON_DAY_4
	dw LevelRooms_c4c2c ; THE_STEEP_CANYON_NIGHT_1
	dw LevelRooms_c4c2c ; THE_STEEP_CANYON_NIGHT_2
	dw LevelRooms_c4c2c ; THE_STEEP_CANYON_NIGHT_3
	dw LevelRooms_c4cd8 ; THE_STEEP_CANYON_NIGHT_4
	dw LevelRooms_c4d84 ; CAVE_OF_FLAMES_DAY_1
	dw LevelRooms_c4d84 ; CAVE_OF_FLAMES_DAY_2
	dw LevelRooms_c4e58 ; CAVE_OF_FLAMES_DAY_3
	dw LevelRooms_c4f2c ; CAVE_OF_FLAMES_DAY_4
	dw LevelRooms_c4d84 ; CAVE_OF_FLAMES_NIGHT_1
	dw LevelRooms_c4d84 ; CAVE_OF_FLAMES_NIGHT_2
	dw LevelRooms_c4e58 ; CAVE_OF_FLAMES_NIGHT_3
	dw LevelRooms_c4f2c ; CAVE_OF_FLAMES_NIGHT_4
	dw LevelRooms_c5000 ; ABOVE_THE_CLOUDS_DAY_1
	dw LevelRooms_c5000 ; ABOVE_THE_CLOUDS_DAY_2
	dw LevelRooms_c50c4 ; ABOVE_THE_CLOUDS_DAY_3
	dw LevelRooms_c50c4 ; ABOVE_THE_CLOUDS_DAY_4
	dw LevelRooms_c5188 ; ABOVE_THE_CLOUDS_NIGHT_1
	dw LevelRooms_c5188 ; ABOVE_THE_CLOUDS_NIGHT_2
	dw LevelRooms_c524c ; ABOVE_THE_CLOUDS_NIGHT_3
	dw LevelRooms_c524c ; ABOVE_THE_CLOUDS_NIGHT_4
	dw LevelRooms_c5310 ; THE_STAGNANT_SWAMP_DAY_1
	dw LevelRooms_c5310 ; THE_STAGNANT_SWAMP_DAY_2
	dw LevelRooms_c5310 ; THE_STAGNANT_SWAMP_DAY_3
	dw LevelRooms_c53c4 ; THE_STAGNANT_SWAMP_DAY_4
	dw LevelRooms_c5478 ; THE_STAGNANT_SWAMP_NIGHT_1
	dw LevelRooms_c5478 ; THE_STAGNANT_SWAMP_NIGHT_2
	dw LevelRooms_c5478 ; THE_STAGNANT_SWAMP_NIGHT_3
	dw LevelRooms_c552c ; THE_STAGNANT_SWAMP_NIGHT_4
	dw LevelRooms_c55e0 ; THE_FRIGID_SEA_DAY_1
	dw LevelRooms_c55e0 ; THE_FRIGID_SEA_DAY_2
	dw LevelRooms_c56ac ; THE_FRIGID_SEA_DAY_3
	dw LevelRooms_c56ac ; THE_FRIGID_SEA_DAY_4
	dw LevelRooms_c5778 ; THE_FRIGID_SEA_NIGHT_1
	dw LevelRooms_c5778 ; THE_FRIGID_SEA_NIGHT_2
	dw LevelRooms_c5844 ; THE_FRIGID_SEA_NIGHT_3
	dw LevelRooms_c5844 ; THE_FRIGID_SEA_NIGHT_4
	dw LevelRooms_c5910 ; CASTLE_OF_ILLUSIONS_DAY_1
	dw LevelRooms_c5910 ; CASTLE_OF_ILLUSIONS_DAY_2
	dw LevelRooms_c5910 ; CASTLE_OF_ILLUSIONS_DAY_3
	dw LevelRooms_c59f4 ; CASTLE_OF_ILLUSIONS_DAY_4
	dw LevelRooms_c5ad8 ; CASTLE_OF_ILLUSIONS_NIGHT_1
	dw LevelRooms_c5ad8 ; CASTLE_OF_ILLUSIONS_NIGHT_2
	dw LevelRooms_c5ad8 ; CASTLE_OF_ILLUSIONS_NIGHT_3
	dw LevelRooms_c5bbc ; CASTLE_OF_ILLUSIONS_NIGHT_4
	dw LevelRooms_c5ca0 ; THE_COLOSSAL_HOLE_DAY_1
	dw LevelRooms_c5ca0 ; THE_COLOSSAL_HOLE_DAY_2
	dw LevelRooms_c5ca0 ; THE_COLOSSAL_HOLE_DAY_3
	dw LevelRooms_c5d5c ; THE_COLOSSAL_HOLE_DAY_4
	dw LevelRooms_c5e18 ; THE_COLOSSAL_HOLE_NIGHT_1
	dw LevelRooms_c5e18 ; THE_COLOSSAL_HOLE_NIGHT_2
	dw LevelRooms_c5e18 ; THE_COLOSSAL_HOLE_NIGHT_3
	dw LevelRooms_c5ed4 ; THE_COLOSSAL_HOLE_NIGHT_4
	dw LevelRooms_c5f90 ; THE_WARPED_VOID_DAY_1
	dw LevelRooms_c605c ; THE_WARPED_VOID_DAY_2
	dw LevelRooms_c605c ; THE_WARPED_VOID_DAY_3
	dw LevelRooms_c6128 ; THE_WARPED_VOID_DAY_4
	dw LevelRooms_c5f90 ; THE_WARPED_VOID_NIGHT_1
	dw LevelRooms_c605c ; THE_WARPED_VOID_NIGHT_2
	dw LevelRooms_c605c ; THE_WARPED_VOID_NIGHT_3
	dw LevelRooms_c6128 ; THE_WARPED_VOID_NIGHT_4
	dw LevelRooms_c61f4 ; THE_EAST_CRATER_DAY_1
	dw LevelRooms_c6298 ; THE_EAST_CRATER_DAY_2
	dw LevelRooms_c633c ; THE_EAST_CRATER_DAY_3
	dw LevelRooms_c63e0 ; THE_EAST_CRATER_DAY_4
	dw LevelRooms_c6484 ; THE_EAST_CRATER_NIGHT_1
	dw LevelRooms_c6528 ; THE_EAST_CRATER_NIGHT_2
	dw LevelRooms_c65cc ; THE_EAST_CRATER_NIGHT_3
	dw LevelRooms_c6670 ; THE_EAST_CRATER_NIGHT_4
	dw LevelRooms_c6714 ; FOREST_OF_FEAR_DAY_1
	dw LevelRooms_c6714 ; FOREST_OF_FEAR_DAY_2
	dw LevelRooms_c67a8 ; FOREST_OF_FEAR_DAY_3
	dw LevelRooms_c683c ; FOREST_OF_FEAR_DAY_4
	dw LevelRooms_c68d0 ; FOREST_OF_FEAR_NIGHT_1
	dw LevelRooms_c68d0 ; FOREST_OF_FEAR_NIGHT_2
	dw LevelRooms_c6964 ; FOREST_OF_FEAR_NIGHT_3
	dw LevelRooms_c69f8 ; FOREST_OF_FEAR_NIGHT_4
	dw LevelRooms_c6a8c ; THE_TEMPLE
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL

MACRO room
	db \1 ; function table
	db \2 ; tile maps
	db \3 ; main tiles
	db \4 ; special tiles
	db \5 ; palettes
ENDM

RoomBlockAndGfxData:
	table_width 2, RoomBlockAndGfxData
	dw NULL      ; ROOM_000
	dw .room_001 ; ROOM_001
	dw .room_002 ; ROOM_002
	dw .room_003 ; ROOM_003
	dw .room_004 ; ROOM_004
	dw .room_005 ; ROOM_005
	dw .room_006 ; ROOM_006
	dw .room_007 ; ROOM_007
	dw .room_008 ; ROOM_008
	dw .room_009 ; ROOM_009
	dw .room_010 ; ROOM_010
	dw .room_011 ; ROOM_011
	dw .room_012 ; ROOM_012
	dw .room_013 ; ROOM_013
	dw .room_014 ; ROOM_014
	dw .room_015 ; ROOM_015
	dw .room_016 ; ROOM_016
	dw .room_017 ; ROOM_017
	dw .room_018 ; ROOM_018
	dw .room_019 ; ROOM_019
	dw .room_020 ; ROOM_020
	dw .room_021 ; ROOM_021
	dw .room_022 ; ROOM_022
	dw .room_023 ; ROOM_023
	dw .room_024 ; ROOM_024
	dw .room_025 ; ROOM_025
	dw .room_026 ; ROOM_026
	dw .room_027 ; ROOM_027
	dw .room_028 ; ROOM_028
	dw .room_029 ; ROOM_029
	dw .room_030 ; ROOM_030
	dw .room_031 ; ROOM_031
	dw .room_032 ; ROOM_032
	dw .room_033 ; ROOM_033
	dw .room_034 ; ROOM_034
	dw .room_035 ; ROOM_035
	dw .room_036 ; ROOM_036
	dw .room_037 ; ROOM_037
	dw .room_038 ; ROOM_038
	dw .room_039 ; ROOM_039
	dw .room_040 ; ROOM_040
	dw .room_041 ; ROOM_041
	dw .room_042 ; ROOM_042
	dw .room_043 ; ROOM_043
	dw .room_044 ; ROOM_044
	dw .room_045 ; ROOM_045
	dw .room_046 ; ROOM_046
	dw .room_047 ; ROOM_047
	dw .room_048 ; ROOM_048
	dw .room_049 ; ROOM_049
	dw .room_050 ; ROOM_050
	dw .room_051 ; ROOM_051
	dw .room_052 ; ROOM_052
	dw .room_053 ; ROOM_053
	dw .room_054 ; ROOM_054
	dw .room_055 ; ROOM_055
	dw .room_056 ; ROOM_056
	dw .room_057 ; ROOM_057
	dw .room_058 ; ROOM_058
	dw .room_059 ; ROOM_059
	dw .room_060 ; ROOM_060
	dw .room_061 ; ROOM_061
	dw .room_062 ; ROOM_062
	dw .room_063 ; ROOM_063
	dw .room_064 ; ROOM_064
	dw .room_065 ; ROOM_065
	dw .room_066 ; ROOM_066
	dw .room_067 ; ROOM_067
	dw .room_068 ; ROOM_068
	dw .room_069 ; ROOM_069
	dw .room_070 ; ROOM_070
	dw .room_071 ; ROOM_071
	dw .room_072 ; ROOM_072
	dw .room_073 ; ROOM_073
	dw .room_074 ; ROOM_074
	dw .room_075 ; ROOM_075
	dw .room_076 ; ROOM_076
	dw .room_077 ; ROOM_077
	dw .room_078 ; ROOM_078
	dw .room_079 ; ROOM_079
	dw .room_080 ; ROOM_080
	dw .room_081 ; ROOM_081
	dw .room_082 ; ROOM_082
	dw .room_083 ; ROOM_083
	dw .room_084 ; ROOM_084
	dw .room_085 ; ROOM_085
	dw .room_086 ; ROOM_086
	dw .room_087 ; ROOM_087
	dw .room_088 ; ROOM_088
	dw .room_089 ; ROOM_089
	dw .room_090 ; ROOM_090
	dw .room_091 ; ROOM_091
	dw .room_092 ; ROOM_092
	dw .room_093 ; ROOM_093
	dw .room_094 ; ROOM_094
	dw .room_095 ; ROOM_095
	dw .room_096 ; ROOM_096
	dw .room_097 ; ROOM_097
	dw .room_098 ; ROOM_098
	dw .room_099 ; ROOM_099
	dw .room_100 ; ROOM_100
	dw .room_101 ; ROOM_101
	dw .room_102 ; ROOM_102
	dw .room_103 ; ROOM_103
	dw .room_104 ; ROOM_104
	dw .room_105 ; ROOM_105
	dw .room_106 ; ROOM_106
	dw .room_107 ; ROOM_107
	dw .room_108 ; ROOM_108
	dw .room_109 ; ROOM_109
	dw .room_110 ; ROOM_110
	dw .room_111 ; ROOM_111
	dw .room_112 ; ROOM_112
	dw .room_113 ; ROOM_113
	dw .room_114 ; ROOM_114
	dw .room_115 ; ROOM_115
	dw .room_116 ; ROOM_116
	dw .room_117 ; ROOM_117
	dw .room_118 ; ROOM_118
	dw .room_119 ; ROOM_119
	dw .room_120 ; ROOM_120
	dw .room_121 ; ROOM_121
	dw .room_122 ; ROOM_122
	dw .room_123 ; ROOM_123
	dw .room_124 ; ROOM_124
	dw .room_125 ; ROOM_125
	dw .room_126 ; ROOM_126
	dw .room_127 ; ROOM_127
	dw .room_128 ; ROOM_128
	dw .room_129 ; ROOM_129
	dw .room_130 ; ROOM_130
	dw .room_131 ; ROOM_131
	dw .room_132 ; ROOM_132
	dw .room_133 ; ROOM_133
	dw .room_134 ; ROOM_134
	dw .room_135 ; ROOM_135
	dw .room_136 ; ROOM_136
	dw .room_137 ; ROOM_137
	dw .room_138 ; ROOM_138
	dw .room_139 ; ROOM_139
	dw .room_140 ; ROOM_140
	dw .room_141 ; ROOM_141
	dw .room_142 ; ROOM_142
	dw .room_143 ; ROOM_143
	dw .room_144 ; ROOM_144
	dw .room_145 ; ROOM_145
	dw .room_146 ; ROOM_146
	dw .room_147 ; ROOM_147
	dw .room_148 ; ROOM_148
	dw .room_149 ; ROOM_149
	dw .room_150 ; ROOM_150
	dw .room_151 ; ROOM_151
	dw .room_152 ; ROOM_152
	dw .room_153 ; ROOM_153
	dw .room_154 ; ROOM_154
	dw NULL      ; ROOM_UNUSED_155
	dw NULL      ; ROOM_UNUSED_156
	dw NULL      ; ROOM_UNUSED_157
	dw NULL      ; ROOM_UNUSED_158
	dw NULL      ; ROOM_UNUSED_159
	dw NULL      ; ROOM_UNUSED_160
	dw NULL      ; ROOM_UNUSED_161
	dw NULL      ; ROOM_UNUSED_162
	assert_table_length NUM_ROOMS

.room_001
	room BLOCK_FUNCTION_TABLE_00, TILE_MAP_00, MAIN_TILES_00, SPECIAL_TILES_0, ROOM_PAL_000
.room_002
	room BLOCK_FUNCTION_TABLE_00, TILE_MAP_00, MAIN_TILES_00, SPECIAL_TILES_0, ROOM_PAL_001
.room_003
	room BLOCK_FUNCTION_TABLE_01, TILE_MAP_01, MAIN_TILES_00, SPECIAL_TILES_0, ROOM_PAL_000
.room_004
	room BLOCK_FUNCTION_TABLE_01, TILE_MAP_01, MAIN_TILES_00, SPECIAL_TILES_0, ROOM_PAL_001
.room_005
	room BLOCK_FUNCTION_TABLE_02, TILE_MAP_02, MAIN_TILES_01, SPECIAL_TILES_1, ROOM_PAL_002
.room_006
	room BLOCK_FUNCTION_TABLE_03, TILE_MAP_03, MAIN_TILES_02, SPECIAL_TILES_2, ROOM_PAL_004
.room_007
	room BLOCK_FUNCTION_TABLE_03, TILE_MAP_03, MAIN_TILES_02, SPECIAL_TILES_2, ROOM_PAL_005
.room_008
	room BLOCK_FUNCTION_TABLE_04, TILE_MAP_04, MAIN_TILES_02, SPECIAL_TILES_2, ROOM_PAL_004
.room_009
	room BLOCK_FUNCTION_TABLE_04, TILE_MAP_04, MAIN_TILES_02, SPECIAL_TILES_2, ROOM_PAL_005
.room_010
	room BLOCK_FUNCTION_TABLE_05, TILE_MAP_05, MAIN_TILES_03, SPECIAL_TILES_3, ROOM_PAL_006
.room_011
	room BLOCK_FUNCTION_TABLE_05, TILE_MAP_05, MAIN_TILES_03, SPECIAL_TILES_3, ROOM_PAL_007
.room_012
	room BLOCK_FUNCTION_TABLE_06, TILE_MAP_06, MAIN_TILES_04, SPECIAL_TILES_3, ROOM_PAL_008
.room_013
	room BLOCK_FUNCTION_TABLE_10, TILE_MAP_10, MAIN_TILES_04, SPECIAL_TILES_3, ROOM_PAL_013
.room_014
	room BLOCK_FUNCTION_TABLE_09, TILE_MAP_09, MAIN_TILES_38, SPECIAL_TILES_3, ROOM_PAL_009
.room_015
	room BLOCK_FUNCTION_TABLE_07, TILE_MAP_07, MAIN_TILES_05, SPECIAL_TILES_3, ROOM_PAL_011
.room_016
	room BLOCK_FUNCTION_TABLE_08, TILE_MAP_08, MAIN_TILES_06, SPECIAL_TILES_3, ROOM_PAL_012
.room_017
	room BLOCK_FUNCTION_TABLE_09, TILE_MAP_09, MAIN_TILES_38, SPECIAL_TILES_3, ROOM_PAL_010
.room_018
	room BLOCK_FUNCTION_TABLE_59, TILE_MAP_59, MAIN_TILES_07, SPECIAL_TILES_3, ROOM_PAL_014
.room_019
	room BLOCK_FUNCTION_TABLE_12, TILE_MAP_12, MAIN_TILES_08, SPECIAL_TILES_3, ROOM_PAL_015
.room_020
	room BLOCK_FUNCTION_TABLE_13, TILE_MAP_13, MAIN_TILES_09, SPECIAL_TILES_1, ROOM_PAL_016
.room_021
	room BLOCK_FUNCTION_TABLE_66, TILE_MAP_66, MAIN_TILES_10, SPECIAL_TILES_1, ROOM_PAL_017
.room_022
	room BLOCK_FUNCTION_TABLE_61, TILE_MAP_61, MAIN_TILES_11, SPECIAL_TILES_1, ROOM_PAL_018
.room_023
	room BLOCK_FUNCTION_TABLE_16, TILE_MAP_16, MAIN_TILES_12, SPECIAL_TILES_4, ROOM_PAL_019
.room_024
	room BLOCK_FUNCTION_TABLE_17, TILE_MAP_17, MAIN_TILES_12, SPECIAL_TILES_4, ROOM_PAL_020
.room_025
	room BLOCK_FUNCTION_TABLE_18, TILE_MAP_18, MAIN_TILES_13, SPECIAL_TILES_1, ROOM_PAL_021
.room_026
	room BLOCK_FUNCTION_TABLE_09, TILE_MAP_09, MAIN_TILES_38, SPECIAL_TILES_3, ROOM_PAL_022
.room_027
	room BLOCK_FUNCTION_TABLE_19, TILE_MAP_19, MAIN_TILES_14, SPECIAL_TILES_1, ROOM_PAL_023
.room_028
	room BLOCK_FUNCTION_TABLE_19, TILE_MAP_19, MAIN_TILES_14, SPECIAL_TILES_1, ROOM_PAL_024
.room_029
	room BLOCK_FUNCTION_TABLE_52, TILE_MAP_52, MAIN_TILES_15, SPECIAL_TILES_5, ROOM_PAL_025
.room_030
	room BLOCK_FUNCTION_TABLE_50, TILE_MAP_50, MAIN_TILES_15, SPECIAL_TILES_5, ROOM_PAL_026
.room_031
	room BLOCK_FUNCTION_TABLE_21, TILE_MAP_21, MAIN_TILES_16, SPECIAL_TILES_8, ROOM_PAL_027
.room_032
	room BLOCK_FUNCTION_TABLE_22, TILE_MAP_22, MAIN_TILES_17, SPECIAL_TILES_1, ROOM_PAL_028
.room_033
	room BLOCK_FUNCTION_TABLE_22, TILE_MAP_22, MAIN_TILES_17, SPECIAL_TILES_1, ROOM_PAL_029
.room_034
	room BLOCK_FUNCTION_TABLE_23, TILE_MAP_23, MAIN_TILES_18, SPECIAL_TILES_1, ROOM_PAL_030
.room_035
	room BLOCK_FUNCTION_TABLE_54, TILE_MAP_54, MAIN_TILES_19, SPECIAL_TILES_1, ROOM_PAL_031
.room_036
	room BLOCK_FUNCTION_TABLE_55, TILE_MAP_55, MAIN_TILES_20, SPECIAL_TILES_1, ROOM_PAL_074
.room_037
	room BLOCK_FUNCTION_TABLE_26, TILE_MAP_26, MAIN_TILES_21, SPECIAL_TILES_1, ROOM_PAL_033
.room_038
	room BLOCK_FUNCTION_TABLE_56, TILE_MAP_56, MAIN_TILES_22, SPECIAL_TILES_1, ROOM_PAL_034
.room_039
	room BLOCK_FUNCTION_TABLE_28, TILE_MAP_28, MAIN_TILES_23, SPECIAL_TILES_1, ROOM_PAL_035
.room_040
	room BLOCK_FUNCTION_TABLE_29, TILE_MAP_29, MAIN_TILES_24, SPECIAL_TILES_1, ROOM_PAL_036
.room_041
	room BLOCK_FUNCTION_TABLE_30, TILE_MAP_30, MAIN_TILES_25, SPECIAL_TILES_7, ROOM_PAL_037
.room_042
	room BLOCK_FUNCTION_TABLE_31, TILE_MAP_31, MAIN_TILES_12, SPECIAL_TILES_4, ROOM_PAL_038
.room_043
	room BLOCK_FUNCTION_TABLE_63, TILE_MAP_63, MAIN_TILES_26, SPECIAL_TILES_1, ROOM_PAL_039
.room_044
	room BLOCK_FUNCTION_TABLE_33, TILE_MAP_33, MAIN_TILES_27, SPECIAL_TILES_1, ROOM_PAL_040
.room_045
	room BLOCK_FUNCTION_TABLE_34, TILE_MAP_34, MAIN_TILES_28, SPECIAL_TILES_1, ROOM_PAL_041
.room_046
	room BLOCK_FUNCTION_TABLE_68, TILE_MAP_68, MAIN_TILES_25, SPECIAL_TILES_7, ROOM_PAL_042
.room_047
	room BLOCK_FUNCTION_TABLE_36, TILE_MAP_36, MAIN_TILES_29, SPECIAL_TILES_1, ROOM_PAL_043
.room_048
	room BLOCK_FUNCTION_TABLE_81, TILE_MAP_81, MAIN_TILES_29, SPECIAL_TILES_1, ROOM_PAL_044
.room_049
	room BLOCK_FUNCTION_TABLE_27, TILE_MAP_27, MAIN_TILES_22, SPECIAL_TILES_1, ROOM_PAL_045
.room_050
	room BLOCK_FUNCTION_TABLE_15, TILE_MAP_15, MAIN_TILES_11, SPECIAL_TILES_1, ROOM_PAL_046
.room_051
	room BLOCK_FUNCTION_TABLE_37, TILE_MAP_37, MAIN_TILES_30, SPECIAL_TILES_1, ROOM_PAL_047
.room_052
	room BLOCK_FUNCTION_TABLE_38, TILE_MAP_38, MAIN_TILES_31, SPECIAL_TILES_1, ROOM_PAL_048
.room_053
	room BLOCK_FUNCTION_TABLE_39, TILE_MAP_39, MAIN_TILES_32, SPECIAL_TILES_1, ROOM_PAL_049
.room_054
	room BLOCK_FUNCTION_TABLE_40, TILE_MAP_40, MAIN_TILES_33, SPECIAL_TILES_1, ROOM_PAL_050
.room_055
	room BLOCK_FUNCTION_TABLE_23, TILE_MAP_23, MAIN_TILES_18, SPECIAL_TILES_1, ROOM_PAL_051
.room_056
	room BLOCK_FUNCTION_TABLE_41, TILE_MAP_41, MAIN_TILES_34, SPECIAL_TILES_1, ROOM_PAL_052
.room_057
	room BLOCK_FUNCTION_TABLE_42, TILE_MAP_42, MAIN_TILES_35, SPECIAL_TILES_1, ROOM_PAL_053
.room_058
	room BLOCK_FUNCTION_TABLE_53, TILE_MAP_53, MAIN_TILES_36, SPECIAL_TILES_1, ROOM_PAL_054
.room_059
	room BLOCK_FUNCTION_TABLE_44, TILE_MAP_44, MAIN_TILES_37, SPECIAL_TILES_1, ROOM_PAL_055
.room_060
	room BLOCK_FUNCTION_TABLE_08, TILE_MAP_08, MAIN_TILES_06, SPECIAL_TILES_3, ROOM_PAL_056
.room_061
	room BLOCK_FUNCTION_TABLE_08, TILE_MAP_08, MAIN_TILES_06, SPECIAL_TILES_3, ROOM_PAL_057
.room_062
	room BLOCK_FUNCTION_TABLE_45, TILE_MAP_45, MAIN_TILES_12, SPECIAL_TILES_4, ROOM_PAL_058
.room_063
	room BLOCK_FUNCTION_TABLE_21, TILE_MAP_21, MAIN_TILES_16, SPECIAL_TILES_8, ROOM_PAL_059
.room_064
	room BLOCK_FUNCTION_TABLE_22, TILE_MAP_22, MAIN_TILES_17, SPECIAL_TILES_1, ROOM_PAL_060
.room_065
	room BLOCK_FUNCTION_TABLE_22, TILE_MAP_22, MAIN_TILES_17, SPECIAL_TILES_1, ROOM_PAL_061
.room_066
	room BLOCK_FUNCTION_TABLE_62, TILE_MAP_62, MAIN_TILES_11, SPECIAL_TILES_1, ROOM_PAL_081
.room_067
	room BLOCK_FUNCTION_TABLE_46, TILE_MAP_46, MAIN_TILES_06, SPECIAL_TILES_3, ROOM_PAL_012
.room_068
	room BLOCK_FUNCTION_TABLE_46, TILE_MAP_46, MAIN_TILES_06, SPECIAL_TILES_3, ROOM_PAL_056
.room_069
	room BLOCK_FUNCTION_TABLE_36, TILE_MAP_36, MAIN_TILES_29, SPECIAL_TILES_1, ROOM_PAL_063
.room_070
	room BLOCK_FUNCTION_TABLE_36, TILE_MAP_36, MAIN_TILES_29, SPECIAL_TILES_1, ROOM_PAL_064
.room_071
	room BLOCK_FUNCTION_TABLE_51, TILE_MAP_51, MAIN_TILES_22, SPECIAL_TILES_1, ROOM_PAL_065
.room_072
	room BLOCK_FUNCTION_TABLE_47, TILE_MAP_47, MAIN_TILES_26, SPECIAL_TILES_6, ROOM_PAL_039
.room_073
	room BLOCK_FUNCTION_TABLE_24, TILE_MAP_24, MAIN_TILES_19, SPECIAL_TILES_1, ROOM_PAL_066
.room_074
	room BLOCK_FUNCTION_TABLE_48, TILE_MAP_48, MAIN_TILES_06, SPECIAL_TILES_3, ROOM_PAL_012
.room_075
	room BLOCK_FUNCTION_TABLE_88, TILE_MAP_88, MAIN_TILES_06, SPECIAL_TILES_3, ROOM_PAL_056
.room_076
	room BLOCK_FUNCTION_TABLE_49, TILE_MAP_49, MAIN_TILES_25, SPECIAL_TILES_7, ROOM_PAL_067
.room_077
	room BLOCK_FUNCTION_TABLE_37, TILE_MAP_37, MAIN_TILES_30, SPECIAL_TILES_1, ROOM_PAL_068
.room_078
	room BLOCK_FUNCTION_TABLE_37, TILE_MAP_37, MAIN_TILES_30, SPECIAL_TILES_1, ROOM_PAL_069
.room_079
	room BLOCK_FUNCTION_TABLE_37, TILE_MAP_37, MAIN_TILES_30, SPECIAL_TILES_1, ROOM_PAL_070
.room_080
	room BLOCK_FUNCTION_TABLE_85, TILE_MAP_85, MAIN_TILES_14, SPECIAL_TILES_1, ROOM_PAL_071
.room_081
	room BLOCK_FUNCTION_TABLE_52, TILE_MAP_52, MAIN_TILES_15, SPECIAL_TILES_5, ROOM_PAL_072
.room_082
	room BLOCK_FUNCTION_TABLE_20, TILE_MAP_20, MAIN_TILES_15, SPECIAL_TILES_5, ROOM_PAL_025
.room_083
	room BLOCK_FUNCTION_TABLE_20, TILE_MAP_20, MAIN_TILES_15, SPECIAL_TILES_5, ROOM_PAL_072
.room_084
	room BLOCK_FUNCTION_TABLE_21, TILE_MAP_21, MAIN_TILES_16, SPECIAL_TILES_8, ROOM_PAL_059
.room_085
	room BLOCK_FUNCTION_TABLE_22, TILE_MAP_22, MAIN_TILES_17, SPECIAL_TILES_1, ROOM_PAL_060
.room_086
	room BLOCK_FUNCTION_TABLE_22, TILE_MAP_22, MAIN_TILES_17, SPECIAL_TILES_1, ROOM_PAL_061
.room_087
	room BLOCK_FUNCTION_TABLE_43, TILE_MAP_43, MAIN_TILES_36, SPECIAL_TILES_1, ROOM_PAL_054
.room_088
	room BLOCK_FUNCTION_TABLE_24, TILE_MAP_24, MAIN_TILES_19, SPECIAL_TILES_1, ROOM_PAL_031
.room_089
	room BLOCK_FUNCTION_TABLE_54, TILE_MAP_54, MAIN_TILES_19, SPECIAL_TILES_1, ROOM_PAL_073
.room_090
	room BLOCK_FUNCTION_TABLE_24, TILE_MAP_24, MAIN_TILES_19, SPECIAL_TILES_1, ROOM_PAL_073
.room_091
	room BLOCK_FUNCTION_TABLE_25, TILE_MAP_25, MAIN_TILES_20, SPECIAL_TILES_1, ROOM_PAL_032
.room_092
	room BLOCK_FUNCTION_TABLE_55, TILE_MAP_55, MAIN_TILES_20, SPECIAL_TILES_1, ROOM_PAL_075
.room_093
	room BLOCK_FUNCTION_TABLE_25, TILE_MAP_25, MAIN_TILES_20, SPECIAL_TILES_1, ROOM_PAL_076
.room_094
	room BLOCK_FUNCTION_TABLE_27, TILE_MAP_27, MAIN_TILES_22, SPECIAL_TILES_1, ROOM_PAL_034
.room_095
	room BLOCK_FUNCTION_TABLE_57, TILE_MAP_57, MAIN_TILES_22, SPECIAL_TILES_1, ROOM_PAL_065
.room_096
	room BLOCK_FUNCTION_TABLE_58, TILE_MAP_58, MAIN_TILES_22, SPECIAL_TILES_1, ROOM_PAL_065
.room_097
	room BLOCK_FUNCTION_TABLE_56, TILE_MAP_56, MAIN_TILES_22, SPECIAL_TILES_1, ROOM_PAL_077
.room_098
	room BLOCK_FUNCTION_TABLE_27, TILE_MAP_27, MAIN_TILES_22, SPECIAL_TILES_1, ROOM_PAL_077
.room_099
	room BLOCK_FUNCTION_TABLE_51, TILE_MAP_51, MAIN_TILES_22, SPECIAL_TILES_1, ROOM_PAL_078
.room_100
	room BLOCK_FUNCTION_TABLE_57, TILE_MAP_57, MAIN_TILES_22, SPECIAL_TILES_1, ROOM_PAL_078
.room_101
	room BLOCK_FUNCTION_TABLE_58, TILE_MAP_58, MAIN_TILES_22, SPECIAL_TILES_1, ROOM_PAL_078
.room_102
	room BLOCK_FUNCTION_TABLE_11, TILE_MAP_11, MAIN_TILES_07, SPECIAL_TILES_3, ROOM_PAL_014
.room_103
	room BLOCK_FUNCTION_TABLE_59, TILE_MAP_59, MAIN_TILES_07, SPECIAL_TILES_3, ROOM_PAL_079
.room_104
	room BLOCK_FUNCTION_TABLE_11, TILE_MAP_11, MAIN_TILES_07, SPECIAL_TILES_3, ROOM_PAL_079
.room_105
	room BLOCK_FUNCTION_TABLE_60, TILE_MAP_60, MAIN_TILES_11, SPECIAL_TILES_1, ROOM_PAL_046
.room_106
	room BLOCK_FUNCTION_TABLE_15, TILE_MAP_15, MAIN_TILES_11, SPECIAL_TILES_1, ROOM_PAL_018
.room_107
	room BLOCK_FUNCTION_TABLE_15, TILE_MAP_15, MAIN_TILES_11, SPECIAL_TILES_1, ROOM_PAL_062
.room_108
	room BLOCK_FUNCTION_TABLE_61, TILE_MAP_61, MAIN_TILES_11, SPECIAL_TILES_1, ROOM_PAL_080
.room_109
	room BLOCK_FUNCTION_TABLE_15, TILE_MAP_15, MAIN_TILES_11, SPECIAL_TILES_1, ROOM_PAL_080
.room_110
	room BLOCK_FUNCTION_TABLE_32, TILE_MAP_32, MAIN_TILES_26, SPECIAL_TILES_1, ROOM_PAL_039
.room_111
	room BLOCK_FUNCTION_TABLE_64, TILE_MAP_64, MAIN_TILES_26, SPECIAL_TILES_1, ROOM_PAL_082
.room_112
	room BLOCK_FUNCTION_TABLE_65, TILE_MAP_65, MAIN_TILES_26, SPECIAL_TILES_1, ROOM_PAL_082
.room_113
	room BLOCK_FUNCTION_TABLE_67, TILE_MAP_67, MAIN_TILES_10, SPECIAL_TILES_1, ROOM_PAL_017
.room_114
	room BLOCK_FUNCTION_TABLE_14, TILE_MAP_14, MAIN_TILES_10, SPECIAL_TILES_1, ROOM_PAL_017
.room_115
	room BLOCK_FUNCTION_TABLE_13, TILE_MAP_13, MAIN_TILES_09, SPECIAL_TILES_1, ROOM_PAL_083
.room_116
	room BLOCK_FUNCTION_TABLE_30, TILE_MAP_30, MAIN_TILES_25, SPECIAL_TILES_7, ROOM_PAL_084
.room_117
	room BLOCK_FUNCTION_TABLE_35, TILE_MAP_35, MAIN_TILES_25, SPECIAL_TILES_7, ROOM_PAL_042
.room_118
	room BLOCK_FUNCTION_TABLE_69, TILE_MAP_69, MAIN_TILES_24, SPECIAL_TILES_1, ROOM_PAL_090
.room_119
	room BLOCK_FUNCTION_TABLE_70, TILE_MAP_70, MAIN_TILES_39, SPECIAL_TILES_1, ROOM_PAL_093
.room_120
	room BLOCK_FUNCTION_TABLE_39, TILE_MAP_39, MAIN_TILES_32, SPECIAL_TILES_1, ROOM_PAL_094
.room_121
	room BLOCK_FUNCTION_TABLE_71, TILE_MAP_71, MAIN_TILES_32, SPECIAL_TILES_1, ROOM_PAL_049
.room_122
	room BLOCK_FUNCTION_TABLE_72, TILE_MAP_72, MAIN_TILES_32, SPECIAL_TILES_1, ROOM_PAL_049
.room_123
	room BLOCK_FUNCTION_TABLE_73, TILE_MAP_73, MAIN_TILES_18, SPECIAL_TILES_1, ROOM_PAL_030
.room_124
	room BLOCK_FUNCTION_TABLE_74, TILE_MAP_74, MAIN_TILES_18, SPECIAL_TILES_1, ROOM_PAL_030
.room_125
	room BLOCK_FUNCTION_TABLE_23, TILE_MAP_23, MAIN_TILES_18, SPECIAL_TILES_1, ROOM_PAL_097
.room_126
	room BLOCK_FUNCTION_TABLE_73, TILE_MAP_73, MAIN_TILES_18, SPECIAL_TILES_1, ROOM_PAL_097
.room_127
	room BLOCK_FUNCTION_TABLE_74, TILE_MAP_74, MAIN_TILES_18, SPECIAL_TILES_1, ROOM_PAL_097
.room_128
	room BLOCK_FUNCTION_TABLE_75, TILE_MAP_75, MAIN_TILES_28, SPECIAL_TILES_1, ROOM_PAL_041
.room_129
	room BLOCK_FUNCTION_TABLE_34, TILE_MAP_34, MAIN_TILES_28, SPECIAL_TILES_1, ROOM_PAL_098
.room_130
	room BLOCK_FUNCTION_TABLE_75, TILE_MAP_75, MAIN_TILES_28, SPECIAL_TILES_1, ROOM_PAL_098
.room_131
	room BLOCK_FUNCTION_TABLE_76, TILE_MAP_76, MAIN_TILES_27, SPECIAL_TILES_1, ROOM_PAL_040
.room_132
	room BLOCK_FUNCTION_TABLE_77, TILE_MAP_77, MAIN_TILES_27, SPECIAL_TILES_1, ROOM_PAL_099
.room_133
	room BLOCK_FUNCTION_TABLE_78, TILE_MAP_78, MAIN_TILES_27, SPECIAL_TILES_1, ROOM_PAL_099
.room_134
	room BLOCK_FUNCTION_TABLE_42, TILE_MAP_42, MAIN_TILES_35, SPECIAL_TILES_1, ROOM_PAL_100
.room_135
	room BLOCK_FUNCTION_TABLE_79, TILE_MAP_79, MAIN_TILES_24, SPECIAL_TILES_1, ROOM_PAL_036
.room_136
	room BLOCK_FUNCTION_TABLE_86, TILE_MAP_86, MAIN_TILES_24, SPECIAL_TILES_1, ROOM_PAL_101
.room_137
	room BLOCK_FUNCTION_TABLE_87, TILE_MAP_87, MAIN_TILES_24, SPECIAL_TILES_1, ROOM_PAL_101
.room_138
	room BLOCK_FUNCTION_TABLE_69, TILE_MAP_69, MAIN_TILES_24, SPECIAL_TILES_1, ROOM_PAL_104
.room_139
	room BLOCK_FUNCTION_TABLE_80, TILE_MAP_80, MAIN_TILES_31, SPECIAL_TILES_1, ROOM_PAL_048
.room_140
	room BLOCK_FUNCTION_TABLE_38, TILE_MAP_38, MAIN_TILES_31, SPECIAL_TILES_1, ROOM_PAL_107
.room_141
	room BLOCK_FUNCTION_TABLE_80, TILE_MAP_80, MAIN_TILES_31, SPECIAL_TILES_1, ROOM_PAL_107
.room_142
	room BLOCK_FUNCTION_TABLE_81, TILE_MAP_81, MAIN_TILES_29, SPECIAL_TILES_1, ROOM_PAL_108
.room_143
	room BLOCK_FUNCTION_TABLE_36, TILE_MAP_36, MAIN_TILES_29, SPECIAL_TILES_1, ROOM_PAL_109
.room_144
	room BLOCK_FUNCTION_TABLE_81, TILE_MAP_81, MAIN_TILES_29, SPECIAL_TILES_1, ROOM_PAL_110
.room_145
	room BLOCK_FUNCTION_TABLE_81, TILE_MAP_81, MAIN_TILES_29, SPECIAL_TILES_1, ROOM_PAL_063
.room_146
	room BLOCK_FUNCTION_TABLE_36, TILE_MAP_36, MAIN_TILES_29, SPECIAL_TILES_1, ROOM_PAL_111
.room_147
	room BLOCK_FUNCTION_TABLE_81, TILE_MAP_81, MAIN_TILES_29, SPECIAL_TILES_1, ROOM_PAL_111
.room_148
	room BLOCK_FUNCTION_TABLE_81, TILE_MAP_81, MAIN_TILES_29, SPECIAL_TILES_1, ROOM_PAL_064
.room_149
	room BLOCK_FUNCTION_TABLE_82, TILE_MAP_82, MAIN_TILES_30, SPECIAL_TILES_1, ROOM_PAL_047
.room_150
	room BLOCK_FUNCTION_TABLE_83, TILE_MAP_83, MAIN_TILES_30, SPECIAL_TILES_1, ROOM_PAL_047
.room_151
	room BLOCK_FUNCTION_TABLE_84, TILE_MAP_84, MAIN_TILES_23, SPECIAL_TILES_1, ROOM_PAL_112
.room_152
	room BLOCK_FUNCTION_TABLE_28, TILE_MAP_28, MAIN_TILES_23, SPECIAL_TILES_1, ROOM_PAL_113
.room_153
	room BLOCK_FUNCTION_TABLE_84, TILE_MAP_84, MAIN_TILES_23, SPECIAL_TILES_1, ROOM_PAL_114
.room_154
	room BLOCK_FUNCTION_TABLE_19, TILE_MAP_19, MAIN_TILES_14, SPECIAL_TILES_1, ROOM_PAL_117

PointerTable_c090d::
	dw LevelDataUnk1_e2c0b  ; TILE_MAP_00
	dw LevelDataUnk1_e2eef  ; TILE_MAP_01
	dw LevelDataUnk1_e31cc  ; TILE_MAP_02
	dw LevelDataUnk1_e34b4  ; TILE_MAP_03
	dw LevelDataUnk1_e3739  ; TILE_MAP_04
	dw LevelDataUnk1_e39be  ; TILE_MAP_05
	dw LevelDataUnk1_e6cf7  ; TILE_MAP_06
	dw LevelDataUnk1_e6fe5  ; TILE_MAP_07
	dw LevelDataUnk1_e7281  ; TILE_MAP_08
	dw LevelDataUnk1_e758f  ; TILE_MAP_09
	dw LevelDataUnk1_e7886  ; TILE_MAP_10
	dw LevelDataUnk1_e7b99  ; TILE_MAP_11
	dw LevelDataUnk1_ea43f  ; TILE_MAP_12
	dw LevelDataUnk1_ea6d1  ; TILE_MAP_13
	dw LevelDataUnk1_ea973  ; TILE_MAP_14
	dw LevelDataUnk1_eac1d  ; TILE_MAP_15
	dw LevelDataUnk1_eaecd  ; TILE_MAP_16
	dw LevelDataUnk1_eb1c3  ; TILE_MAP_17
	dw LevelDataUnk1_eed97  ; TILE_MAP_18
	dw LevelDataUnk1_ef038  ; TILE_MAP_19
	dw LevelDataUnk1_ef32c  ; TILE_MAP_20
	dw LevelDataUnk1_ef664  ; TILE_MAP_21
	dw LevelDataUnk1_ef943  ; TILE_MAP_22
	dw LevelDataUnk1_efbe2  ; TILE_MAP_23
	dw LevelDataUnk1_f2ab7  ; TILE_MAP_24
	dw LevelDataUnk1_f2d75  ; TILE_MAP_25
	dw LevelDataUnk1_f306a  ; TILE_MAP_26
	dw LevelDataUnk1_f330d  ; TILE_MAP_27
	dw LevelDataUnk1_f35fa  ; TILE_MAP_28
	dw LevelDataUnk1_f38d7  ; TILE_MAP_29
	dw LevelDataUnk1_f6759  ; TILE_MAP_30
	dw LevelDataUnk1_f6a29  ; TILE_MAP_31
	dw LevelDataUnk1_f6d24  ; TILE_MAP_32
	dw LevelDataUnk1_f700f  ; TILE_MAP_33
	dw LevelDataUnk1_f72d5  ; TILE_MAP_34
	dw LevelDataUnk1_f7603  ; TILE_MAP_35
	dw LevelDataUnk1_fa4fe  ; TILE_MAP_36
	dw LevelDataUnk1_fa7e2  ; TILE_MAP_37
	dw LevelDataUnk1_faa74  ; TILE_MAP_38
	dw LevelDataUnk1_fad9f  ; TILE_MAP_39
	dw LevelDataUnk1_fb048  ; TILE_MAP_40
	dw LevelDataUnk1_fb2f0  ; TILE_MAP_41
	dw LevelDataUnk1_feb90  ; TILE_MAP_42
	dw LevelDataUnk1_fee1d  ; TILE_MAP_43
	dw LevelDataUnk1_ff09f  ; TILE_MAP_44
	dw LevelDataUnk1_ff2e5  ; TILE_MAP_45
	dw LevelDataUnk1_ff598  ; TILE_MAP_46
	dw LevelDataUnk1_ff8a4  ; TILE_MAP_47
	dw LevelDataUnk1_102c8e ; TILE_MAP_48
	dw LevelDataUnk1_102fb0 ; TILE_MAP_49
	dw LevelDataUnk1_10325c ; TILE_MAP_50
	dw LevelDataUnk1_10358e ; TILE_MAP_51
	dw LevelDataUnk1_10386d ; TILE_MAP_52
	dw LevelDataUnk1_103b9c ; TILE_MAP_53
	dw LevelDataUnk1_1061f4 ; TILE_MAP_54
	dw LevelDataUnk1_1064ae ; TILE_MAP_55
	dw LevelDataUnk1_1067a3 ; TILE_MAP_56
	dw LevelDataUnk1_106a79 ; TILE_MAP_57
	dw LevelDataUnk1_106d5c ; TILE_MAP_58
	dw LevelDataUnk1_10703d ; TILE_MAP_59
	dw LevelDataUnk1_10ae4f ; TILE_MAP_60
	dw LevelDataUnk1_10b0f8 ; TILE_MAP_61
	dw LevelDataUnk1_10b3ac ; TILE_MAP_62
	dw LevelDataUnk1_10b93d ; TILE_MAP_63
	dw LevelDataUnk1_10bc28 ; TILE_MAP_64
	dw LevelDataUnk1_10b65c ; TILE_MAP_65
	dw LevelDataUnk1_10e436 ; TILE_MAP_66
	dw LevelDataUnk1_10e6de ; TILE_MAP_67
	dw LevelDataUnk1_10e988 ; TILE_MAP_68
	dw LevelDataUnk1_10ec3b ; TILE_MAP_69
	dw LevelDataUnk1_10ef3b ; TILE_MAP_70
	dw LevelDataUnk1_10f192 ; TILE_MAP_71
	dw LevelDataUnk1_1115a5 ; TILE_MAP_72
	dw LevelDataUnk1_11184a ; TILE_MAP_73
	dw LevelDataUnk1_111b7f ; TILE_MAP_74
	dw LevelDataUnk1_111eb0 ; TILE_MAP_75
	dw LevelDataUnk1_1121dd ; TILE_MAP_76
	dw LevelDataUnk1_1124a3 ; TILE_MAP_77
	dw LevelDataUnk1_11699e ; TILE_MAP_78
	dw LevelDataUnk1_116c52 ; TILE_MAP_79
	dw LevelDataUnk1_116f8d ; TILE_MAP_80
	dw LevelDataUnk1_1172b2 ; TILE_MAP_81
	dw LevelDataUnk1_117599 ; TILE_MAP_82
	dw LevelDataUnk1_11781c ; TILE_MAP_83
	dw LevelDataUnk1_11a7c8 ; TILE_MAP_84
	dw LevelDataUnk1_11aaa5 ; TILE_MAP_85
	dw LevelDataUnk1_11ad9c ; TILE_MAP_86
	dw LevelDataUnk1_11b0e2 ; TILE_MAP_87
	dw LevelDataUnk1_11b424 ; TILE_MAP_88
	dw NULL  ; TILE_MAP_89
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL

TileMapsPointers::
	dw LevelDataUnk2_e2e0b  ; TILE_MAP_00
	dw LevelDataUnk2_e30ef  ; TILE_MAP_01
	dw LevelDataUnk2_e33cc  ; TILE_MAP_02
	dw LevelDataUnk2_e36b4  ; TILE_MAP_03
	dw LevelDataUnk2_e3939  ; TILE_MAP_04
	dw LevelDataUnk2_e3bbe  ; TILE_MAP_05
	dw LevelDataUnk2_e6ef7  ; TILE_MAP_06
	dw LevelDataUnk2_e71e5  ; TILE_MAP_07
	dw LevelDataUnk2_e7481  ; TILE_MAP_08
	dw LevelDataUnk2_e778f  ; TILE_MAP_09
	dw LevelDataUnk2_e7a86  ; TILE_MAP_10
	dw LevelDataUnk2_e7d99  ; TILE_MAP_11
	dw LevelDataUnk2_ea63f  ; TILE_MAP_12
	dw LevelDataUnk2_ea8d1  ; TILE_MAP_13
	dw LevelDataUnk2_eab73  ; TILE_MAP_14
	dw LevelDataUnk2_eae1d  ; TILE_MAP_15
	dw LevelDataUnk2_eb0cd  ; TILE_MAP_16
	dw LevelDataUnk2_eb3c3  ; TILE_MAP_17
	dw LevelDataUnk2_eef97  ; TILE_MAP_18
	dw LevelDataUnk2_ef238  ; TILE_MAP_19
	dw LevelDataUnk2_ef52c  ; TILE_MAP_20
	dw LevelDataUnk2_ef864  ; TILE_MAP_21
	dw LevelDataUnk2_efb43  ; TILE_MAP_22
	dw LevelDataUnk2_efde2  ; TILE_MAP_23
	dw LevelDataUnk2_f2cb7  ; TILE_MAP_24
	dw LevelDataUnk2_f2f75  ; TILE_MAP_25
	dw LevelDataUnk2_f326a  ; TILE_MAP_26
	dw LevelDataUnk2_f350d  ; TILE_MAP_27
	dw LevelDataUnk2_f37fa  ; TILE_MAP_28
	dw LevelDataUnk2_f3ad7  ; TILE_MAP_29
	dw LevelDataUnk2_f6959  ; TILE_MAP_30
	dw LevelDataUnk2_f6c29  ; TILE_MAP_31
	dw LevelDataUnk2_f6f24  ; TILE_MAP_32
	dw LevelDataUnk2_f720f  ; TILE_MAP_33
	dw LevelDataUnk2_f74d5  ; TILE_MAP_34
	dw LevelDataUnk2_f7803  ; TILE_MAP_35
	dw LevelDataUnk2_fa6fe  ; TILE_MAP_36
	dw LevelDataUnk2_fa9e2  ; TILE_MAP_37
	dw LevelDataUnk2_fac74  ; TILE_MAP_38
	dw LevelDataUnk2_faf9f  ; TILE_MAP_39
	dw LevelDataUnk2_fb248  ; TILE_MAP_40
	dw LevelDataUnk2_fb4f0  ; TILE_MAP_41
	dw LevelDataUnk2_fed90  ; TILE_MAP_42
	dw LevelDataUnk2_ff01d  ; TILE_MAP_43
	dw LevelDataUnk2_ff29f  ; TILE_MAP_44
	dw LevelDataUnk2_ff4e5  ; TILE_MAP_45
	dw LevelDataUnk2_ff798  ; TILE_MAP_46
	dw LevelDataUnk2_ffaa4  ; TILE_MAP_47
	dw LevelDataUnk2_102e8e ; TILE_MAP_48
	dw LevelDataUnk2_1031b0 ; TILE_MAP_49
	dw LevelDataUnk2_10345c ; TILE_MAP_50
	dw LevelDataUnk2_10378e ; TILE_MAP_51
	dw LevelDataUnk2_103a6d ; TILE_MAP_52
	dw LevelDataUnk2_103d9c ; TILE_MAP_53
	dw LevelDataUnk2_1063f4 ; TILE_MAP_54
	dw LevelDataUnk2_1066ae ; TILE_MAP_55
	dw LevelDataUnk2_1069a3 ; TILE_MAP_56
	dw LevelDataUnk2_106c79 ; TILE_MAP_57
	dw LevelDataUnk2_106f5c ; TILE_MAP_58
	dw LevelDataUnk2_10723d ; TILE_MAP_59
	dw LevelDataUnk2_10b04f ; TILE_MAP_60
	dw LevelDataUnk2_10b2f8 ; TILE_MAP_61
	dw LevelDataUnk2_10b5ac ; TILE_MAP_62
	dw LevelDataUnk2_10bb3d ; TILE_MAP_63
	dw LevelDataUnk2_10be28 ; TILE_MAP_64
	dw LevelDataUnk2_10b85c ; TILE_MAP_65
	dw LevelDataUnk2_10e636 ; TILE_MAP_66
	dw LevelDataUnk2_10e8de ; TILE_MAP_67
	dw LevelDataUnk2_10eb88 ; TILE_MAP_68
	dw LevelDataUnk2_10ee3b ; TILE_MAP_69
	dw LevelDataUnk2_10f13b ; TILE_MAP_70
	dw LevelDataUnk2_10f392 ; TILE_MAP_71
	dw LevelDataUnk2_1117a5 ; TILE_MAP_72
	dw LevelDataUnk2_111a4a ; TILE_MAP_73
	dw LevelDataUnk2_111d7f ; TILE_MAP_74
	dw LevelDataUnk2_1120b0 ; TILE_MAP_75
	dw LevelDataUnk2_1123dd ; TILE_MAP_76
	dw LevelDataUnk2_1126a3 ; TILE_MAP_77
	dw LevelDataUnk2_116b9e ; TILE_MAP_78
	dw LevelDataUnk2_116e52 ; TILE_MAP_79
	dw LevelDataUnk2_11718d ; TILE_MAP_80
	dw LevelDataUnk2_1174b2 ; TILE_MAP_81
	dw LevelDataUnk2_117799 ; TILE_MAP_82
	dw LevelDataUnk2_117a1c ; TILE_MAP_83
	dw LevelDataUnk2_11a9c8 ; TILE_MAP_84
	dw LevelDataUnk2_11aca5 ; TILE_MAP_85
	dw LevelDataUnk2_11af9c ; TILE_MAP_86
	dw LevelDataUnk2_11b2e2 ; TILE_MAP_87
	dw LevelDataUnk2_11b624 ; TILE_MAP_88
	dw NULL  ; TILE_MAP_89
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL

LevelMainTilesPointers::
	dw LevelMainTiles0  ; MAIN_TILES_00
	dw LevelMainTiles1  ; MAIN_TILES_01
	dw LevelMainTiles2  ; MAIN_TILES_02
	dw LevelMainTiles3  ; MAIN_TILES_03
	dw LevelMainTiles4  ; MAIN_TILES_04
	dw LevelMainTiles5  ; MAIN_TILES_05
	dw LevelMainTiles6  ; MAIN_TILES_06
	dw LevelMainTiles7  ; MAIN_TILES_07
	dw LevelMainTiles8  ; MAIN_TILES_08
	dw LevelMainTiles9  ; MAIN_TILES_09
	dw LevelMainTiles10 ; MAIN_TILES_10
	dw LevelMainTiles11 ; MAIN_TILES_11
	dw LevelMainTiles12 ; MAIN_TILES_12
	dw LevelMainTiles13 ; MAIN_TILES_13
	dw LevelMainTiles14 ; MAIN_TILES_14
	dw LevelMainTiles15 ; MAIN_TILES_15
	dw LevelMainTiles16 ; MAIN_TILES_16
	dw LevelMainTiles17 ; MAIN_TILES_17
	dw LevelMainTiles18 ; MAIN_TILES_18
	dw LevelMainTiles19 ; MAIN_TILES_19
	dw LevelMainTiles20 ; MAIN_TILES_20
	dw LevelMainTiles21 ; MAIN_TILES_21
	dw LevelMainTiles22 ; MAIN_TILES_22
	dw LevelMainTiles23 ; MAIN_TILES_23
	dw LevelMainTiles24 ; MAIN_TILES_24
	dw LevelMainTiles25 ; MAIN_TILES_25
	dw LevelMainTiles26 ; MAIN_TILES_26
	dw LevelMainTiles27 ; MAIN_TILES_27
	dw LevelMainTiles28 ; MAIN_TILES_28
	dw LevelMainTiles29 ; MAIN_TILES_29
	dw LevelMainTiles30 ; MAIN_TILES_30
	dw LevelMainTiles31 ; MAIN_TILES_31
	dw LevelMainTiles32 ; MAIN_TILES_32
	dw LevelMainTiles33 ; MAIN_TILES_33
	dw LevelMainTiles34 ; MAIN_TILES_34
	dw LevelMainTiles35 ; MAIN_TILES_35
	dw LevelMainTiles36 ; MAIN_TILES_36
	dw LevelMainTiles37 ; MAIN_TILES_37
	dw LevelMainTiles38 ; MAIN_TILES_38
	dw LevelMainTiles39 ; MAIN_TILES_39
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL

SpecialTilesPointers::
	dw SpecialTiles0 ; SPECIAL_TILES_0
	dw SpecialTiles1 ; SPECIAL_TILES_1
	dw SpecialTiles2 ; SPECIAL_TILES_2
	dw SpecialTiles3 ; SPECIAL_TILES_3
	dw SpecialTiles4 ; SPECIAL_TILES_4
	dw SpecialTiles5 ; SPECIAL_TILES_5
	dw SpecialTiles6 ; SPECIAL_TILES_6
	dw SpecialTiles7 ; SPECIAL_TILES_7
	dw SpecialTiles8 ; SPECIAL_TILES_8
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL

RoomPals::
	dw Pals_cc000 ; ROOM_PAL_000
	dw Pals_cc040 ; ROOM_PAL_001
	dw Pals_cc080 ; ROOM_PAL_002
	dw Pals_cc0c0 ; ROOM_PAL_003
	dw Pals_cc100 ; ROOM_PAL_004
	dw Pals_cc140 ; ROOM_PAL_005
	dw Pals_cc180 ; ROOM_PAL_006
	dw Pals_cc1c0 ; ROOM_PAL_007
	dw Pals_cc200 ; ROOM_PAL_008
	dw Pals_cc240 ; ROOM_PAL_009
	dw Pals_cc280 ; ROOM_PAL_010
	dw Pals_cc2c0 ; ROOM_PAL_011
	dw Pals_cc300 ; ROOM_PAL_012
	dw Pals_cc340 ; ROOM_PAL_013
	dw Pals_cc380 ; ROOM_PAL_014
	dw Pals_cc3c0 ; ROOM_PAL_015
	dw Pals_cc400 ; ROOM_PAL_016
	dw Pals_cc440 ; ROOM_PAL_017
	dw Pals_cc480 ; ROOM_PAL_018
	dw Pals_cc4c0 ; ROOM_PAL_019
	dw Pals_cc500 ; ROOM_PAL_020
	dw Pals_cc540 ; ROOM_PAL_021
	dw Pals_cc580 ; ROOM_PAL_022
	dw Pals_cc5c0 ; ROOM_PAL_023
	dw Pals_cc600 ; ROOM_PAL_024
	dw Pals_cc640 ; ROOM_PAL_025
	dw Pals_cc680 ; ROOM_PAL_026
	dw Pals_cc6c0 ; ROOM_PAL_027
	dw Pals_cc700 ; ROOM_PAL_028
	dw Pals_cc740 ; ROOM_PAL_029
	dw Pals_cc780 ; ROOM_PAL_030
	dw Pals_cc7c0 ; ROOM_PAL_031
	dw Pals_cc800 ; ROOM_PAL_032
	dw Pals_cc840 ; ROOM_PAL_033
	dw Pals_cc880 ; ROOM_PAL_034
	dw Pals_cc8c0 ; ROOM_PAL_035
	dw Pals_cc900 ; ROOM_PAL_036
	dw Pals_cc940 ; ROOM_PAL_037
	dw Pals_cc980 ; ROOM_PAL_038
	dw Pals_cc9c0 ; ROOM_PAL_039
	dw Pals_cca00 ; ROOM_PAL_040
	dw Pals_cca40 ; ROOM_PAL_041
	dw Pals_cca80 ; ROOM_PAL_042
	dw Pals_ccac0 ; ROOM_PAL_043
	dw Pals_ccb00 ; ROOM_PAL_044
	dw Pals_ccb40 ; ROOM_PAL_045
	dw Pals_ccb80 ; ROOM_PAL_046
	dw Pals_ccbc0 ; ROOM_PAL_047
	dw Pals_ccc00 ; ROOM_PAL_048
	dw Pals_ccc40 ; ROOM_PAL_049
	dw Pals_ccc80 ; ROOM_PAL_050
	dw Pals_cccc0 ; ROOM_PAL_051
	dw Pals_ccd00 ; ROOM_PAL_052
	dw Pals_ccd40 ; ROOM_PAL_053
	dw Pals_ccd80 ; ROOM_PAL_054
	dw Pals_ccdc0 ; ROOM_PAL_055
	dw Pals_cce00 ; ROOM_PAL_056
	dw Pals_cce40 ; ROOM_PAL_057
	dw Pals_cce80 ; ROOM_PAL_058
	dw Pals_ccec0 ; ROOM_PAL_059
	dw Pals_ccf00 ; ROOM_PAL_060
	dw Pals_ccf40 ; ROOM_PAL_061
	dw Pals_ccf80 ; ROOM_PAL_062
	dw Pals_ccfc0 ; ROOM_PAL_063
	dw Pals_cd000 ; ROOM_PAL_064
	dw Pals_cd040 ; ROOM_PAL_065
	dw Pals_cd080 ; ROOM_PAL_066
	dw Pals_cd0c0 ; ROOM_PAL_067
	dw Pals_cd100 ; ROOM_PAL_068
	dw Pals_cd140 ; ROOM_PAL_069
	dw Pals_cd180 ; ROOM_PAL_070
	dw Pals_cd1c0 ; ROOM_PAL_071
	dw Pals_cd200 ; ROOM_PAL_072
	dw Pals_cd240 ; ROOM_PAL_073
	dw Pals_cd280 ; ROOM_PAL_074
	dw Pals_cd2c0 ; ROOM_PAL_075
	dw Pals_cd300 ; ROOM_PAL_076
	dw Pals_cd340 ; ROOM_PAL_077
	dw Pals_cd380 ; ROOM_PAL_078
	dw Pals_cd3c0 ; ROOM_PAL_079
	dw Pals_cd400 ; ROOM_PAL_080
	dw Pals_cd440 ; ROOM_PAL_081
	dw Pals_cd480 ; ROOM_PAL_082
	dw Pals_cd4c0 ; ROOM_PAL_083
	dw Pals_cd500 ; ROOM_PAL_084
	dw Pals_cd540 ; ROOM_PAL_085
	dw Pals_cd580 ; ROOM_PAL_086
	dw Pals_cd5c0 ; ROOM_PAL_087
	dw Pals_cd600 ; ROOM_PAL_088
	dw Pals_cd640 ; ROOM_PAL_089
	dw Pals_cd680 ; ROOM_PAL_090
	dw Pals_cd6c0 ; ROOM_PAL_091
	dw Pals_cd700 ; ROOM_PAL_092
	dw Pals_cd740 ; ROOM_PAL_093
	dw Pals_cd780 ; ROOM_PAL_094
	dw Pals_cd7c0 ; ROOM_PAL_095
	dw Pals_cd800 ; ROOM_PAL_096
	dw Pals_cd840 ; ROOM_PAL_097
	dw Pals_cd880 ; ROOM_PAL_098
	dw Pals_cd8c0 ; ROOM_PAL_099
	dw Pals_cd900 ; ROOM_PAL_100
	dw Pals_cd940 ; ROOM_PAL_101
	dw Pals_cd980 ; ROOM_PAL_102
	dw Pals_cd9c0 ; ROOM_PAL_103
	dw Pals_cda00 ; ROOM_PAL_104
	dw Pals_cda40 ; ROOM_PAL_105
	dw Pals_cda80 ; ROOM_PAL_106
	dw Pals_cdac0 ; ROOM_PAL_107
	dw Pals_cdb00 ; ROOM_PAL_108
	dw Pals_cdb40 ; ROOM_PAL_109
	dw Pals_cdb80 ; ROOM_PAL_110
	dw Pals_cdbc0 ; ROOM_PAL_111
	dw Pals_cdc00 ; ROOM_PAL_112
	dw Pals_cdc40 ; ROOM_PAL_113
	dw Pals_cdc80 ; ROOM_PAL_114
	dw Pals_cdcc0 ; ROOM_PAL_115
	dw Pals_cdd00 ; ROOM_PAL_116
	dw Pals_cdd40 ; ROOM_PAL_117
	dw Pals_cdd80 ; ROOM_PAL_118
	dw Pals_cddc0 ; ROOM_PAL_119
	dw Pals_cde00 ; ROOM_PAL_120
	dw Pals_cde40 ; ROOM_PAL_121
	dw Pals_cde80 ; ROOM_PAL_122
	dw Pals_cdec0 ; ROOM_PAL_123
	dw Pals_cdf00 ; ROOM_PAL_124
	dw Pals_cdf40 ; ROOM_PAL_125
	dw Pals_cdf80 ; ROOM_PAL_126
	dw Pals_cdfc0 ; ROOM_PAL_127
	dw Pals_ce000 ; ROOM_PAL_128
	dw Pals_ce040 ; ROOM_PAL_129
	dw Pals_ce080 ; ROOM_PAL_130
	dw Pals_ce0c0 ; ROOM_PAL_131
	dw Pals_ce100 ; ROOM_PAL_132
	dw Pals_ce140 ; ROOM_PAL_133
	dw Pals_ce180 ; ROOM_PAL_134
	dw Pals_ce1c0 ; ROOM_PAL_135
	dw Pals_ce200 ; ROOM_PAL_136
	dw Pals_ce240 ; ROOM_PAL_137
	dw Pals_ce280 ; ROOM_PAL_138
	dw Pals_ce2c0 ; ROOM_PAL_139
	dw Pals_ce300 ; ROOM_PAL_140
	dw Pals_ce340 ; ROOM_PAL_141
	dw Pals_ce380 ; ROOM_PAL_142
	dw Pals_ce3c0 ; ROOM_PAL_143
	dw Pals_ce400 ; ROOM_PAL_144
	dw Pals_ce440 ; ROOM_PAL_145

REPT $12
	db $ff
ENDR

RoomPalCycles::
	dw .PalCycle0  ; ROOM_PAL_CYCLE_00
	dw .PalCycle1  ; ROOM_PAL_CYCLE_01
	dw .PalCycle2  ; ROOM_PAL_CYCLE_02
	dw .PalCycle3  ; ROOM_PAL_CYCLE_03
	dw .PalCycle4  ; ROOM_PAL_CYCLE_04
	dw .PalCycle5  ; ROOM_PAL_CYCLE_05
	dw .PalCycle6  ; ROOM_PAL_CYCLE_06
	dw .PalCycle7  ; ROOM_PAL_CYCLE_07
	dw .PalCycle8  ; ROOM_PAL_CYCLE_08
	dw .PalCycle9  ; ROOM_PAL_CYCLE_09
	dw .PalCycle10 ; ROOM_PAL_CYCLE_10
	dw .PalCycle11 ; ROOM_PAL_CYCLE_11
	dw .PalCycle0  ; ROOM_PAL_CYCLE_12
	dw .PalCycle0  ; ROOM_PAL_CYCLE_13
	dw .PalCycle0  ; ROOM_PAL_CYCLE_14
	dw .PalCycle0  ; ROOM_PAL_CYCLE_15
	dw .PalCycle0  ; ROOM_PAL_CYCLE_16
	dw .PalCycle0  ; ROOM_PAL_CYCLE_17
	dw .PalCycle0  ; ROOM_PAL_CYCLE_18
	dw .PalCycle0  ; ROOM_PAL_CYCLE_19

.PalCycle0
	db ROOM_PAL_000
	db ROOM_PAL_000
	db ROOM_PAL_000
	db ROOM_PAL_000
	db ROOM_PAL_000
	db ROOM_PAL_000
	db ROOM_PAL_000
	db ROOM_PAL_000
	db 0 ; duration

.PalCycle1
	db ROOM_PAL_002
	db ROOM_PAL_002
	db ROOM_PAL_002
	db ROOM_PAL_003
	db ROOM_PAL_115
	db ROOM_PAL_116
	db ROOM_PAL_115
	db ROOM_PAL_003
	db 11 ; duration

.PalCycle2
	db ROOM_PAL_049
	db ROOM_PAL_049
	db ROOM_PAL_085
	db ROOM_PAL_086
	db ROOM_PAL_087
	db ROOM_PAL_087
	db ROOM_PAL_086
	db ROOM_PAL_085
	db 13 ; duration

.PalCycle3
	db ROOM_PAL_036
	db ROOM_PAL_036
	db ROOM_PAL_036
	db ROOM_PAL_088
	db ROOM_PAL_089
	db ROOM_PAL_089
	db ROOM_PAL_089
	db ROOM_PAL_088
	db 22 ; duration

.PalCycle4
	db ROOM_PAL_090
	db ROOM_PAL_090
	db ROOM_PAL_090
	db ROOM_PAL_091
	db ROOM_PAL_092
	db ROOM_PAL_092
	db ROOM_PAL_092
	db ROOM_PAL_091
	db 22 ; duration

.PalCycle5
	db ROOM_PAL_087
	db ROOM_PAL_087
	db ROOM_PAL_094
	db ROOM_PAL_095
	db ROOM_PAL_096
	db ROOM_PAL_096
	db ROOM_PAL_095
	db ROOM_PAL_094
	db 13 ; duration

.PalCycle6
	db ROOM_PAL_101
	db ROOM_PAL_101
	db ROOM_PAL_101
	db ROOM_PAL_102
	db ROOM_PAL_103
	db ROOM_PAL_103
	db ROOM_PAL_103
	db ROOM_PAL_102
	db 22 ; duration

.PalCycle7
	db ROOM_PAL_104
	db ROOM_PAL_104
	db ROOM_PAL_104
	db ROOM_PAL_105
	db ROOM_PAL_106
	db ROOM_PAL_106
	db ROOM_PAL_106
	db ROOM_PAL_105
	db 22 ; duration

.PalCycle8
	db ROOM_PAL_047
	db ROOM_PAL_118
	db ROOM_PAL_119
	db ROOM_PAL_120
	db ROOM_PAL_121
	db ROOM_PAL_122
	db ROOM_PAL_123
	db ROOM_PAL_124
	db 16 ; duration

.PalCycle9
	db ROOM_PAL_068
	db ROOM_PAL_125
	db ROOM_PAL_126
	db ROOM_PAL_127
	db ROOM_PAL_128
	db ROOM_PAL_129
	db ROOM_PAL_130
	db ROOM_PAL_131
	db 16 ; duration

.PalCycle10
	db ROOM_PAL_069
	db ROOM_PAL_132
	db ROOM_PAL_133
	db ROOM_PAL_134
	db ROOM_PAL_135
	db ROOM_PAL_136
	db ROOM_PAL_137
	db ROOM_PAL_138
	db 16 ; duration

.PalCycle11
	db ROOM_PAL_070
	db ROOM_PAL_139
	db ROOM_PAL_140
	db ROOM_PAL_141
	db ROOM_PAL_142
	db ROOM_PAL_143
	db ROOM_PAL_144
	db ROOM_PAL_145
	db 16 ; duration

AnimatedTilesGroups:
	; frame duration, group
	db  0, ANIMATED_TILES_GFX_00 ; ANIMATED_TILES_GROUP_00
	db  2, ANIMATED_TILES_GFX_00 ; ANIMATED_TILES_GROUP_01
	db 11, ANIMATED_TILES_GFX_01 ; ANIMATED_TILES_GROUP_02
	db  6, ANIMATED_TILES_GFX_02 ; ANIMATED_TILES_GROUP_03
	db  5, ANIMATED_TILES_GFX_03 ; ANIMATED_TILES_GROUP_04
	db 11, ANIMATED_TILES_GFX_04 ; ANIMATED_TILES_GROUP_05
	db  6, ANIMATED_TILES_GFX_05 ; ANIMATED_TILES_GROUP_06
	db  6, ANIMATED_TILES_GFX_06 ; ANIMATED_TILES_GROUP_07
	db  9, ANIMATED_TILES_GFX_07 ; ANIMATED_TILES_GROUP_08
	db  6, ANIMATED_TILES_GFX_08 ; ANIMATED_TILES_GROUP_09
	db  6, ANIMATED_TILES_GFX_09 ; ANIMATED_TILES_GROUP_10
	db  6, ANIMATED_TILES_GFX_10 ; ANIMATED_TILES_GROUP_11
	db  3, ANIMATED_TILES_GFX_11 ; ANIMATED_TILES_GROUP_12
	db  2, ANIMATED_TILES_GFX_12 ; ANIMATED_TILES_GROUP_13
	db 11, ANIMATED_TILES_GFX_13 ; ANIMATED_TILES_GROUP_14
	db  8, ANIMATED_TILES_GFX_14 ; ANIMATED_TILES_GROUP_15
	db  6, ANIMATED_TILES_GFX_15 ; ANIMATED_TILES_GROUP_16
	db  6, ANIMATED_TILES_GFX_16 ; ANIMATED_TILES_GROUP_17
	db  6, ANIMATED_TILES_GFX_17 ; ANIMATED_TILES_GROUP_18
	db  5, ANIMATED_TILES_GFX_18 ; ANIMATED_TILES_GROUP_19
	db  9, ANIMATED_TILES_GFX_19 ; ANIMATED_TILES_GROUP_20
	db  0, ANIMATED_TILES_GFX_00 ; ANIMATED_TILES_GROUP_21
	db  0, ANIMATED_TILES_GFX_00 ; ANIMATED_TILES_GROUP_22
	db  0, ANIMATED_TILES_GFX_00 ; ANIMATED_TILES_GROUP_23
	db  0, ANIMATED_TILES_GFX_00 ; ANIMATED_TILES_GROUP_24
	db  0, ANIMATED_TILES_GFX_00 ; ANIMATED_TILES_GROUP_25
	db  0, ANIMATED_TILES_GFX_00 ; ANIMATED_TILES_GROUP_26
	db  0, ANIMATED_TILES_GFX_00 ; ANIMATED_TILES_GROUP_27
	db  0, ANIMATED_TILES_GFX_00 ; ANIMATED_TILES_GROUP_28

LevelRooms_c0d1f:
	dw .room_00
	dw NULL
	dw .room_02
	dw .room_03
	dw .room_04
	dw .room_05
	dw .room_06
	dw NULL
	dw NULL
	dw NULL
	dw .room_10
	dw .room_11
	dw .room_12
	dw .room_13
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw .room_18
	dw .room_19
	dw NULL
	dw .room_21
	dw NULL
	dw .room_23
	dw NULL
	dw NULL
	dw .room_26
	dw .room_27
	dw NULL
	dw .room_29

.room_00
	room_data  0,  2, $3, $2, $2, $0, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_02
	room_data  6,  1, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_010
.room_03
	room_data  9,  1, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_04
	room_data  2,  2, $3, $0, $3, $2, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_010
.room_05
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_020, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_06
	room_data  1,  0, $1, $0, $2, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_036, ANIMATED_TILES_GROUP_01,  0, ROOM_010
.room_10
	room_data  5,  0, $1, $0, $6, $3, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_11
	room_data  6,  0, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_010
.room_12
	room_data  4,  0, $1, $0, $6, $3, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_13
	room_data  7,  2, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_14
	room_data  4,  1, $2, $1, $6, $3, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_02,  1, ROOM_005
.room_15
	room_data  9,  2, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_16
	room_data  2,  0, $3, $0, $3, $2, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_010
.room_17
	room_data  1,  2, $3, $2, $2, $0, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_18
	room_data  3,  2, $3, $2, $7, $3, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_03,  0, ROOM_006
.room_19
	room_data  3,  0, $1, $0, $6, $3, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_21
	room_data  7,  1, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_23
	room_data  8,  1, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_26
	room_data  2,  1, $2, $1, $3, $2, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_010
.room_27
	room_data  3,  1, $2, $1, $6, $3, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_02,  1, ROOM_005
.room_29
	room_data  5,  1, $2, $1, $6, $3, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_02,  1, ROOM_005

LevelRooms_c0e03:
	dw .room_00
	dw NULL
	dw .room_02
	dw .room_03
	dw .room_04
	dw .room_05
	dw .room_06
	dw NULL
	dw NULL
	dw NULL
	dw .room_10
	dw .room_11
	dw .room_12
	dw .room_13
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw .room_18
	dw .room_19
	dw NULL
	dw .room_21
	dw NULL
	dw .room_23
	dw NULL
	dw NULL
	dw .room_26
	dw .room_27
	dw NULL
	dw .room_29

.room_00
	room_data  0,  2, $3, $2, $2, $0, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_02
	room_data  6,  1, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_010
.room_03
	room_data  9,  1, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_04
	room_data  2,  2, $3, $0, $3, $2, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_010
.room_05
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_020, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_06
	room_data  1,  0, $1, $0, $2, $1, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_010
.room_10
	room_data  5,  0, $1, $0, $6, $3, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_11
	room_data  6,  0, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_036, ANIMATED_TILES_GROUP_01,  0, ROOM_010
.room_12
	room_data  4,  0, $1, $0, $6, $3, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_13
	room_data  7,  2, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_14
	room_data  4,  1, $2, $1, $6, $3, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_02,  1, ROOM_005
.room_15
	room_data  9,  2, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_16
	room_data  2,  0, $3, $0, $3, $2, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_010
.room_17
	room_data  1,  2, $3, $2, $2, $0, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_18
	room_data  3,  2, $3, $2, $7, $3, CAM_FREE, OBJECT_GROUP_005, ANIMATED_TILES_GROUP_03,  0, ROOM_008
.room_19
	room_data  3,  0, $1, $0, $6, $3, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_21
	room_data  7,  1, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_23
	room_data  8,  1, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_001
.room_26
	room_data  2,  1, $2, $1, $3, $2, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_010
.room_27
	room_data  3,  1, $2, $1, $6, $3, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_02,  1, ROOM_005
.room_29
	room_data  5,  1, $2, $1, $6, $3, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_02,  1, ROOM_005

LevelRooms_c0ee7:
	dw .room_00
	dw NULL
	dw .room_02
	dw .room_03
	dw .room_04
	dw .room_05
	dw .room_06
	dw NULL
	dw NULL
	dw NULL
	dw .room_10
	dw .room_11
	dw .room_12
	dw .room_13
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw .room_18
	dw .room_19
	dw NULL
	dw .room_21
	dw NULL
	dw .room_23
	dw NULL
	dw NULL
	dw .room_26
	dw .room_27
	dw NULL
	dw .room_29

.room_00
	room_data  0,  2, $3, $2, $2, $0, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_01,  0, ROOM_003
.room_02
	room_data  6,  1, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_114, ANIMATED_TILES_GROUP_01,  0, ROOM_010
.room_03
	room_data  9,  1, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_003
.room_04
	room_data  2,  2, $3, $0, $3, $2, CAM_TRANSITIONS, OBJECT_GROUP_114, ANIMATED_TILES_GROUP_01,  0, ROOM_010
.room_05
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_020, ANIMATED_TILES_GROUP_01,  0, ROOM_003
.room_06
	room_data  1,  0, $1, $0, $2, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_036, ANIMATED_TILES_GROUP_01,  0, ROOM_010
.room_10
	room_data  5,  0, $1, $0, $6, $3, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_01,  0, ROOM_003
.room_11
	room_data  6,  0, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_114, ANIMATED_TILES_GROUP_01,  0, ROOM_010
.room_12
	room_data  4,  0, $1, $0, $6, $3, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_01,  0, ROOM_003
.room_13
	room_data  7,  2, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_003
.room_14
	room_data  4,  1, $2, $1, $6, $3, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_02,  1, ROOM_005
.room_15
	room_data  9,  2, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_003
.room_16
	room_data  2,  0, $3, $0, $3, $2, CAM_TRANSITIONS, OBJECT_GROUP_114, ANIMATED_TILES_GROUP_01,  0, ROOM_010
.room_17
	room_data  1,  2, $3, $2, $2, $0, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_01,  0, ROOM_003
.room_18
	room_data  3,  2, $3, $2, $7, $3, CAM_FREE, OBJECT_GROUP_005, ANIMATED_TILES_GROUP_03,  0, ROOM_008
.room_19
	room_data  3,  0, $1, $0, $6, $3, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_01,  0, ROOM_003
.room_21
	room_data  7,  1, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_003
.room_23
	room_data  8,  1, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_003
.room_26
	room_data  2,  1, $2, $1, $3, $2, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_114, ANIMATED_TILES_GROUP_01,  0, ROOM_010
.room_27
	room_data  3,  1, $2, $1, $6, $3, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_02,  1, ROOM_005
.room_29
	room_data  5,  1, $2, $1, $6, $3, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_02,  1, ROOM_005

LevelRooms_c0fcb:
	dw .room_00
	dw NULL
	dw .room_02
	dw .room_03
	dw .room_04
	dw .room_05
	dw .room_06
	dw NULL
	dw NULL
	dw NULL
	dw .room_10
	dw .room_11
	dw .room_12
	dw .room_13
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw .room_18
	dw .room_19
	dw NULL
	dw .room_21
	dw NULL
	dw .room_23
	dw NULL
	dw NULL
	dw .room_26
	dw .room_27
	dw NULL
	dw .room_29

.room_00
	room_data  0,  2, $3, $2, $2, $0, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_02
	room_data  6,  1, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_011
.room_03
	room_data  9,  1, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_04
	room_data  2,  2, $3, $0, $3, $2, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_05
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_020, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_06
	room_data  1,  0, $1, $0, $2, $1, CAM_TRANSITIONS, OBJECT_GROUP_036, ANIMATED_TILES_GROUP_01,  0, ROOM_011
.room_10
	room_data  5,  0, $1, $0, $6, $3, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_11
	room_data  6,  0, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_011
.room_12
	room_data  4,  0, $1, $0, $6, $3, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_13
	room_data  7,  2, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_14
	room_data  4,  1, $2, $1, $6, $3, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_02,  1, ROOM_005
.room_15
	room_data  9,  2, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_16
	room_data  2,  0, $3, $0, $3, $2, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_011
.room_17
	room_data  1,  2, $3, $2, $2, $0, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_18
	room_data  3,  2, $3, $2, $7, $3, CAM_FREE, OBJECT_GROUP_004, ANIMATED_TILES_GROUP_03,  0, ROOM_007
.room_19
	room_data  3,  0, $1, $0, $6, $3, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_21
	room_data  7,  1, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_23
	room_data  8,  1, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_26
	room_data  2,  1, $2, $1, $3, $2, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_011
.room_27
	room_data  3,  1, $2, $1, $6, $3, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_02,  1, ROOM_005
.room_29
	room_data  5,  1, $2, $1, $6, $3, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_02,  1, ROOM_005

LevelRooms_c10af:
	dw .room_00
	dw NULL
	dw .room_02
	dw .room_03
	dw .room_04
	dw .room_05
	dw .room_06
	dw NULL
	dw NULL
	dw NULL
	dw .room_10
	dw .room_11
	dw .room_12
	dw .room_13
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw .room_18
	dw .room_19
	dw NULL
	dw .room_21
	dw NULL
	dw .room_23
	dw NULL
	dw NULL
	dw .room_26
	dw .room_27
	dw NULL
	dw .room_29

.room_00
	room_data  0,  2, $3, $2, $2, $0, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_02
	room_data  6,  1, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_011
.room_03
	room_data  9,  1, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_04
	room_data  2,  2, $3, $0, $3, $2, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_05
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_020, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_06
	room_data  1,  0, $1, $0, $2, $1, CAM_TRANSITIONS, OBJECT_GROUP_036, ANIMATED_TILES_GROUP_01,  0, ROOM_011
.room_10
	room_data  5,  0, $1, $0, $6, $3, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_11
	room_data  6,  0, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_011
.room_12
	room_data  4,  0, $1, $0, $6, $3, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_13
	room_data  7,  2, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_14
	room_data  4,  1, $2, $1, $6, $3, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_02,  1, ROOM_005
.room_15
	room_data  9,  2, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_16
	room_data  2,  0, $3, $0, $3, $2, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_011
.room_17
	room_data  1,  2, $3, $2, $2, $0, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_18
	room_data  3,  2, $3, $2, $7, $3, CAM_FREE, OBJECT_GROUP_006, ANIMATED_TILES_GROUP_03,  0, ROOM_009
.room_19
	room_data  3,  0, $1, $0, $6, $3, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_21
	room_data  7,  1, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_23
	room_data  8,  1, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_002
.room_26
	room_data  2,  1, $2, $1, $3, $2, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_01,  0, ROOM_011
.room_27
	room_data  3,  1, $2, $1, $6, $3, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_02,  1, ROOM_005
.room_29
	room_data  5,  1, $2, $1, $6, $3, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_02,  1, ROOM_005

LevelRooms_c1193:
	dw .room_00
	dw NULL
	dw .room_02
	dw .room_03
	dw .room_04
	dw .room_05
	dw .room_06
	dw NULL
	dw NULL
	dw NULL
	dw .room_10
	dw .room_11
	dw .room_12
	dw .room_13
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw .room_18
	dw .room_19
	dw NULL
	dw .room_21
	dw NULL
	dw .room_23
	dw NULL
	dw NULL
	dw .room_26
	dw .room_27
	dw NULL
	dw .room_29

.room_00
	room_data  0,  2, $3, $2, $2, $0, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_01,  0, ROOM_004
.room_02
	room_data  6,  1, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_114, ANIMATED_TILES_GROUP_01,  0, ROOM_011
.room_03
	room_data  9,  1, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_004
.room_04
	room_data  2,  2, $3, $0, $3, $2, CAM_TRANSITIONS, OBJECT_GROUP_114, ANIMATED_TILES_GROUP_01,  0, ROOM_011
.room_05
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_020, ANIMATED_TILES_GROUP_01,  0, ROOM_004
.room_06
	room_data  1,  0, $1, $0, $2, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_036, ANIMATED_TILES_GROUP_01,  0, ROOM_011
.room_10
	room_data  5,  0, $1, $0, $6, $3, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_01,  0, ROOM_004
.room_11
	room_data  6,  0, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_114, ANIMATED_TILES_GROUP_01,  0, ROOM_011
.room_12
	room_data  4,  0, $1, $0, $6, $3, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_01,  0, ROOM_004
.room_13
	room_data  7,  2, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_004
.room_14
	room_data  4,  1, $2, $1, $6, $3, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_02,  1, ROOM_005
.room_15
	room_data  9,  2, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_004
.room_16
	room_data  2,  0, $3, $0, $3, $2, CAM_TRANSITIONS, OBJECT_GROUP_114, ANIMATED_TILES_GROUP_01,  0, ROOM_011
.room_17
	room_data  1,  2, $3, $2, $2, $0, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_01,  0, ROOM_004
.room_18
	room_data  3,  2, $3, $2, $7, $3, CAM_FREE, OBJECT_GROUP_006, ANIMATED_TILES_GROUP_03,  0, ROOM_009
.room_19
	room_data  3,  0, $1, $0, $6, $3, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_01,  0, ROOM_004
.room_21
	room_data  7,  1, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_004
.room_23
	room_data  8,  1, $3, $0, $a, $7, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_009, ANIMATED_TILES_GROUP_01,  0, ROOM_004
.room_26
	room_data  2,  1, $2, $1, $3, $2, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_114, ANIMATED_TILES_GROUP_01,  0, ROOM_011
.room_27
	room_data  3,  1, $2, $1, $6, $3, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_02,  1, ROOM_005
.room_29
	room_data  5,  1, $2, $1, $6, $3, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_02,  1, ROOM_005

LevelRooms_c1277:
	dw .room_00
	dw .room_01
	dw .room_02
	dw .room_03
	dw .room_04
	dw .room_05
	dw .room_06
	dw NULL
	dw .room_08
	dw .room_09
	dw .room_10
	dw NULL
	dw .room_12
	dw .room_13
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw NULL
	dw .room_19
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw NULL

.room_00
	room_data  1,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_053, ANIMATED_TILES_GROUP_00,  0, ROOM_012
.room_01
	room_data  5,  0, $2, $0, $6, $5, CAM_TRANSITIONS, OBJECT_GROUP_011, ANIMATED_TILES_GROUP_00,  0, ROOM_014
.room_02
	room_data  6,  0, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_058, ANIMATED_TILES_GROUP_00,  0, ROOM_014
.room_03
	room_data  6,  2, $3, $2, $7, $6, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_053, ANIMATED_TILES_GROUP_03,  0, ROOM_014
.room_04
	room_data  9,  1, $2, $0, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_015, ANIMATED_TILES_GROUP_00,  0, ROOM_014
.room_05
	room_data  1,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_053, ANIMATED_TILES_GROUP_00,  0, ROOM_012
.room_06
	room_data  2,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_053, ANIMATED_TILES_GROUP_00,  0, ROOM_012
.room_08
	room_data  7,  2, $3, $2, $8, $7, CAM_TRANSITIONS, OBJECT_GROUP_035, ANIMATED_TILES_GROUP_03,  0, ROOM_014
.room_09
	room_data  8,  2, $3, $2, $a, $8, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_087, ANIMATED_TILES_GROUP_11,  0, ROOM_014
.room_10
	room_data  5,  1, $2, $0, $6, $5, CAM_TRANSITIONS, OBJECT_GROUP_011, ANIMATED_TILES_GROUP_00,  0, ROOM_014
.room_12
	room_data  6,  1, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_058, ANIMATED_TILES_GROUP_00,  0, ROOM_014
.room_13
	room_data  8,  1, $2, $0, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_015, ANIMATED_TILES_GROUP_00,  0, ROOM_014
.room_14
	room_data  7,  1, $2, $1, $8, $7, CAM_FREE, OBJECT_GROUP_013, ANIMATED_TILES_GROUP_03,  0, ROOM_014
.room_15
	room_data  0,  2, $3, $2, $6, $0, CAM_TRANSITIONS, OBJECT_GROUP_028, ANIMATED_TILES_GROUP_04,  0, ROOM_015
.room_16
	room_data  2,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_053, ANIMATED_TILES_GROUP_00,  0, ROOM_012
.room_17
	room_data  4,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_053, ANIMATED_TILES_GROUP_00,  0, ROOM_012
.room_19
	room_data  4,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_053, ANIMATED_TILES_GROUP_00,  0, ROOM_012
.room_25
	room_data  3,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_053, ANIMATED_TILES_GROUP_00,  0, ROOM_012
.room_26
	room_data  3,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_053, ANIMATED_TILES_GROUP_00,  0, ROOM_012
.room_27
	room_data  8,  0, $2, $0, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_015, ANIMATED_TILES_GROUP_00,  0, ROOM_014
.room_28
	room_data  9,  0, $2, $0, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_015, ANIMATED_TILES_GROUP_00,  0, ROOM_014

LevelRooms_c135b:
	dw .room_00
	dw .room_01
	dw .room_02
	dw .room_03
	dw .room_04
	dw .room_05
	dw .room_06
	dw NULL
	dw .room_08
	dw .room_09
	dw .room_10
	dw NULL
	dw .room_12
	dw .room_13
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw NULL
	dw .room_19
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw NULL

.room_00
	room_data  1,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_008, ANIMATED_TILES_GROUP_00,  0, ROOM_012
.room_01
	room_data  5,  0, $2, $0, $6, $5, CAM_TRANSITIONS, OBJECT_GROUP_011, ANIMATED_TILES_GROUP_00,  0, ROOM_014
.room_02
	room_data  6,  0, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_058, ANIMATED_TILES_GROUP_00,  0, ROOM_014
.room_03
	room_data  6,  2, $3, $2, $7, $6, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_008, ANIMATED_TILES_GROUP_03,  0, ROOM_014
.room_04
	room_data  9,  1, $2, $0, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_015, ANIMATED_TILES_GROUP_00,  0, ROOM_014
.room_05
	room_data  1,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_008, ANIMATED_TILES_GROUP_00,  0, ROOM_012
.room_06
	room_data  2,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_008, ANIMATED_TILES_GROUP_00,  0, ROOM_012
.room_08
	room_data  7,  2, $3, $2, $8, $7, CAM_TRANSITIONS, OBJECT_GROUP_035, ANIMATED_TILES_GROUP_03,  0, ROOM_014
.room_09
	room_data  8,  2, $3, $2, $a, $8, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_087, ANIMATED_TILES_GROUP_11,  0, ROOM_014
.room_10
	room_data  5,  1, $2, $0, $6, $5, CAM_TRANSITIONS, OBJECT_GROUP_011, ANIMATED_TILES_GROUP_00,  0, ROOM_014
.room_12
	room_data  6,  1, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_058, ANIMATED_TILES_GROUP_00,  0, ROOM_014
.room_13
	room_data  8,  1, $2, $0, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_015, ANIMATED_TILES_GROUP_00,  0, ROOM_014
.room_14
	room_data  7,  1, $2, $1, $8, $7, CAM_FREE, OBJECT_GROUP_013, ANIMATED_TILES_GROUP_03,  0, ROOM_014
.room_15
	room_data  0,  2, $3, $2, $6, $0, CAM_TRANSITIONS, OBJECT_GROUP_028, ANIMATED_TILES_GROUP_04,  0, ROOM_015
.room_16
	room_data  2,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_008, ANIMATED_TILES_GROUP_00,  0, ROOM_012
.room_17
	room_data  4,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_008, ANIMATED_TILES_GROUP_00,  0, ROOM_012
.room_19
	room_data  4,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_008, ANIMATED_TILES_GROUP_00,  0, ROOM_012
.room_25
	room_data  3,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_008, ANIMATED_TILES_GROUP_00,  0, ROOM_012
.room_26
	room_data  3,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_008, ANIMATED_TILES_GROUP_00,  0, ROOM_012
.room_27
	room_data  8,  0, $2, $0, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_015, ANIMATED_TILES_GROUP_00,  0, ROOM_014
.room_28
	room_data  9,  0, $2, $0, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_015, ANIMATED_TILES_GROUP_00,  0, ROOM_014

LevelRooms_c143f:
	dw .room_00
	dw .room_01
	dw .room_02
	dw .room_03
	dw .room_04
	dw .room_05
	dw .room_06
	dw NULL
	dw .room_08
	dw .room_09
	dw .room_10
	dw NULL
	dw .room_12
	dw .room_13
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw NULL
	dw .room_19
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw NULL

.room_00
	room_data  1,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_054, ANIMATED_TILES_GROUP_00,  0, ROOM_013
.room_01
	room_data  5,  0, $2, $0, $6, $5, CAM_TRANSITIONS, OBJECT_GROUP_011, ANIMATED_TILES_GROUP_00,  0, ROOM_017
.room_02
	room_data  6,  0, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_058, ANIMATED_TILES_GROUP_00,  0, ROOM_017
.room_03
	room_data  6,  2, $3, $2, $7, $6, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_054, ANIMATED_TILES_GROUP_03,  0, ROOM_017
.room_04
	room_data  9,  1, $2, $0, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_015, ANIMATED_TILES_GROUP_00,  0, ROOM_017
.room_05
	room_data  1,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_054, ANIMATED_TILES_GROUP_00,  0, ROOM_013
.room_06
	room_data  2,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_054, ANIMATED_TILES_GROUP_00,  0, ROOM_013
.room_08
	room_data  7,  2, $3, $2, $8, $7, CAM_TRANSITIONS, OBJECT_GROUP_035, ANIMATED_TILES_GROUP_03,  0, ROOM_026
.room_09
	room_data  8,  2, $3, $2, $a, $8, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_087, ANIMATED_TILES_GROUP_11,  0, ROOM_026
.room_10
	room_data  5,  1, $2, $0, $6, $5, CAM_TRANSITIONS, OBJECT_GROUP_011, ANIMATED_TILES_GROUP_00,  0, ROOM_017
.room_12
	room_data  6,  1, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_058, ANIMATED_TILES_GROUP_00,  0, ROOM_017
.room_13
	room_data  8,  1, $2, $0, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_015, ANIMATED_TILES_GROUP_00,  0, ROOM_017
.room_14
	room_data  7,  1, $2, $1, $8, $7, CAM_FREE, OBJECT_GROUP_013, ANIMATED_TILES_GROUP_03,  0, ROOM_017
.room_15
	room_data  0,  2, $3, $2, $6, $0, CAM_TRANSITIONS, OBJECT_GROUP_028, ANIMATED_TILES_GROUP_04,  0, ROOM_015
.room_16
	room_data  2,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_054, ANIMATED_TILES_GROUP_00,  0, ROOM_013
.room_17
	room_data  4,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_054, ANIMATED_TILES_GROUP_00,  0, ROOM_013
.room_19
	room_data  4,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_054, ANIMATED_TILES_GROUP_00,  0, ROOM_013
.room_25
	room_data  3,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_054, ANIMATED_TILES_GROUP_00,  0, ROOM_013
.room_26
	room_data  3,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_054, ANIMATED_TILES_GROUP_00,  0, ROOM_013
.room_27
	room_data  8,  0, $2, $0, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_015, ANIMATED_TILES_GROUP_00,  0, ROOM_017
.room_28
	room_data  9,  0, $2, $0, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_015, ANIMATED_TILES_GROUP_00,  0, ROOM_017

LevelRooms_c1523:
	dw .room_00
	dw .room_01
	dw .room_02
	dw .room_03
	dw .room_04
	dw .room_05
	dw .room_06
	dw NULL
	dw .room_08
	dw .room_09
	dw .room_10
	dw NULL
	dw .room_12
	dw .room_13
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw NULL
	dw .room_19
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw NULL

.room_00
	room_data  1,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_017, ANIMATED_TILES_GROUP_00,  0, ROOM_013
.room_01
	room_data  5,  0, $2, $0, $6, $5, CAM_TRANSITIONS, OBJECT_GROUP_011, ANIMATED_TILES_GROUP_00,  0, ROOM_017
.room_02
	room_data  6,  0, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_058, ANIMATED_TILES_GROUP_00,  0, ROOM_017
.room_03
	room_data  6,  2, $3, $2, $7, $6, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_017, ANIMATED_TILES_GROUP_03,  0, ROOM_017
.room_04
	room_data  9,  1, $2, $0, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_015, ANIMATED_TILES_GROUP_00,  0, ROOM_017
.room_05
	room_data  1,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_017, ANIMATED_TILES_GROUP_00,  0, ROOM_013
.room_06
	room_data  2,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_017, ANIMATED_TILES_GROUP_00,  0, ROOM_013
.room_08
	room_data  7,  2, $3, $2, $8, $7, CAM_TRANSITIONS, OBJECT_GROUP_035, ANIMATED_TILES_GROUP_03,  0, ROOM_026
.room_09
	room_data  8,  2, $3, $2, $a, $8, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_087, ANIMATED_TILES_GROUP_11,  0, ROOM_026
.room_10
	room_data  5,  1, $2, $0, $6, $5, CAM_TRANSITIONS, OBJECT_GROUP_011, ANIMATED_TILES_GROUP_00,  0, ROOM_017
.room_12
	room_data  6,  1, $2, $0, $7, $6, CAM_TRANSITIONS, OBJECT_GROUP_058, ANIMATED_TILES_GROUP_00,  0, ROOM_017
.room_13
	room_data  8,  1, $2, $0, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_015, ANIMATED_TILES_GROUP_00,  0, ROOM_017
.room_14
	room_data  7,  1, $2, $1, $8, $7, CAM_FREE, OBJECT_GROUP_013, ANIMATED_TILES_GROUP_03,  0, ROOM_017
.room_15
	room_data  0,  2, $3, $2, $6, $0, CAM_TRANSITIONS, OBJECT_GROUP_028, ANIMATED_TILES_GROUP_04,  0, ROOM_015
.room_16
	room_data  2,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_017, ANIMATED_TILES_GROUP_00,  0, ROOM_013
.room_17
	room_data  4,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_017, ANIMATED_TILES_GROUP_00,  0, ROOM_013
.room_19
	room_data  4,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_017, ANIMATED_TILES_GROUP_00,  0, ROOM_013
.room_25
	room_data  3,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_017, ANIMATED_TILES_GROUP_00,  0, ROOM_013
.room_26
	room_data  3,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_017, ANIMATED_TILES_GROUP_00,  0, ROOM_013
.room_27
	room_data  8,  0, $2, $0, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_015, ANIMATED_TILES_GROUP_00,  0, ROOM_017
.room_28
	room_data  9,  0, $2, $0, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_015, ANIMATED_TILES_GROUP_00,  0, ROOM_017

LevelRooms_c1607:
	dw .room_00
	dw NULL
	dw NULL
	dw .room_03
	dw NULL
	dw NULL
	dw NULL
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw .room_11
	dw NULL
	dw NULL
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw NULL
	dw .room_25
	dw .room_26
	dw .room_27
	dw NULL
	dw .room_29

.room_00
	room_data  1,  0, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_067
.room_03
	room_data  0,  2, $3, $2, $2, $0, CAM_TRANSITIONS, OBJECT_GROUP_019, ANIMATED_TILES_GROUP_00,  0, ROOM_025
.room_07
	room_data  7,  0, $2, $0, $a, $6, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_021, ANIMATED_TILES_GROUP_00,  0, ROOM_074
.room_09
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE, OBJECT_GROUP_022, ANIMATED_TILES_GROUP_03,  0, ROOM_025
.room_10
	room_data  9,  0, $2, $0, $a, $6, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_021, ANIMATED_TILES_GROUP_00,  0, ROOM_074
.room_11
	room_data  2,  2, $3, $2, $5, $2, CAM_TRANSITIONS, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_03,  0, ROOM_025
.room_14
	room_data  5,  2, $3, $2, $6, $5, CAM_FREE, OBJECT_GROUP_024, ANIMATED_TILES_GROUP_03,  0, ROOM_025
.room_15
	room_data  6,  2, $3, $2, $9, $6, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_048, ANIMATED_TILES_GROUP_11,  0, ROOM_061
.room_16
.room_17
.room_18
.room_19
	room_data  4,  0, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_067
.room_20
.room_21
	room_data  6,  0, $2, $0, $a, $6, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_021, ANIMATED_TILES_GROUP_00,  0, ROOM_074
.room_22
	room_data  1,  1, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_067
.room_23
	room_data  3,  2, $3, $2, $5, $2, CAM_TRANSITIONS, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_03,  0, ROOM_025
.room_25
	room_data  3,  1, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_067
.room_26
	room_data  5,  1, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_067
.room_27
	room_data  9,  2, $3, $2, $a, $9, CAM_FREE, OBJECT_GROUP_040, ANIMATED_TILES_GROUP_11,  0, ROOM_025
.room_29
	room_data  7,  2, $3, $2, $9, $6, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_048, ANIMATED_TILES_GROUP_11,  0, ROOM_061

LevelRooms_c16c3:
	dw .room_00
	dw NULL
	dw NULL
	dw .room_03
	dw NULL
	dw NULL
	dw NULL
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw .room_11
	dw NULL
	dw NULL
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw NULL
	dw .room_25
	dw .room_26
	dw .room_27
	dw NULL
	dw .room_29

.room_00
	room_data  1,  0, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_016
.room_03
	room_data  0,  2, $3, $2, $2, $0, CAM_TRANSITIONS, OBJECT_GROUP_019, ANIMATED_TILES_GROUP_00,  0, ROOM_025
.room_07
	room_data  7,  0, $2, $0, $a, $6, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_021, ANIMATED_TILES_GROUP_00,  0, ROOM_074
.room_09
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE, OBJECT_GROUP_022, ANIMATED_TILES_GROUP_03,  0, ROOM_025
.room_10
	room_data  9,  0, $2, $0, $a, $6, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_021, ANIMATED_TILES_GROUP_00,  0, ROOM_074
.room_11
	room_data  2,  2, $3, $2, $5, $2, CAM_TRANSITIONS, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_03,  0, ROOM_025
.room_14
	room_data  5,  2, $3, $2, $6, $5, CAM_FREE, OBJECT_GROUP_024, ANIMATED_TILES_GROUP_03,  0, ROOM_025
.room_15
	room_data  6,  2, $3, $2, $9, $6, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_048, ANIMATED_TILES_GROUP_11,  0, ROOM_061
.room_16
.room_17
.room_18
.room_19
	room_data  4,  0, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_016
.room_20
.room_21
	room_data  6,  0, $2, $0, $a, $6, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_021, ANIMATED_TILES_GROUP_00,  0, ROOM_074
.room_22
	room_data  1,  1, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_016
.room_23
	room_data  3,  2, $3, $2, $5, $2, CAM_TRANSITIONS, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_03,  0, ROOM_025
.room_25
	room_data  3,  1, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_016
.room_26
	room_data  5,  1, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_016
.room_27
	room_data  9,  2, $3, $2, $a, $9, CAM_FREE, OBJECT_GROUP_040, ANIMATED_TILES_GROUP_11,  0, ROOM_025
.room_29
	room_data  7,  2, $3, $2, $9, $6, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_048, ANIMATED_TILES_GROUP_11,  0, ROOM_061

LevelRooms_c177f:
	dw .room_00
	dw NULL
	dw NULL
	dw .room_03
	dw NULL
	dw NULL
	dw NULL
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw .room_11
	dw NULL
	dw NULL
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw NULL
	dw .room_25
	dw .room_26
	dw .room_27
	dw NULL
	dw .room_29

.room_00
	room_data  1,  0, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_068
.room_03
	room_data  0,  2, $3, $2, $2, $0, CAM_TRANSITIONS, OBJECT_GROUP_019, ANIMATED_TILES_GROUP_00,  0, ROOM_025
.room_07
	room_data  7,  0, $2, $0, $a, $6, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_056, ANIMATED_TILES_GROUP_00,  0, ROOM_075
.room_09
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE, OBJECT_GROUP_022, ANIMATED_TILES_GROUP_03,  0, ROOM_025
.room_10
	room_data  9,  0, $2, $0, $a, $6, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_056, ANIMATED_TILES_GROUP_00,  0, ROOM_075
.room_11
	room_data  2,  2, $3, $2, $5, $2, CAM_TRANSITIONS, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_03,  0, ROOM_025
.room_14
	room_data  5,  2, $3, $2, $6, $5, CAM_FREE, OBJECT_GROUP_024, ANIMATED_TILES_GROUP_03,  0, ROOM_025
.room_15
	room_data  6,  2, $3, $2, $9, $6, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_048, ANIMATED_TILES_GROUP_11,  0, ROOM_061
.room_16
.room_17
.room_18
.room_19
	room_data  4,  0, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_068
.room_20
.room_21
	room_data  6,  0, $2, $0, $a, $6, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_056, ANIMATED_TILES_GROUP_00,  0, ROOM_075
.room_22
	room_data  1,  1, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_068
.room_23
	room_data  3,  2, $3, $2, $5, $2, CAM_TRANSITIONS, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_03,  0, ROOM_025
.room_25
	room_data  3,  1, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_068
.room_26
	room_data  5,  1, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_068
.room_27
	room_data  9,  2, $3, $2, $a, $9, CAM_FREE, OBJECT_GROUP_040, ANIMATED_TILES_GROUP_11,  0, ROOM_025
.room_29
	room_data  7,  2, $3, $2, $9, $6, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_048, ANIMATED_TILES_GROUP_11,  0, ROOM_061

LevelRooms_c183b:
	dw .room_00
	dw NULL
	dw NULL
	dw .room_03
	dw NULL
	dw NULL
	dw NULL
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw .room_11
	dw NULL
	dw NULL
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw NULL
	dw .room_25
	dw .room_26
	dw .room_27
	dw NULL
	dw .room_29

.room_00
	room_data  1,  0, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_060
.room_03
	room_data  0,  2, $3, $2, $2, $0, CAM_TRANSITIONS, OBJECT_GROUP_019, ANIMATED_TILES_GROUP_00,  0, ROOM_025
.room_07
	room_data  7,  0, $2, $0, $a, $6, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_056, ANIMATED_TILES_GROUP_00,  0, ROOM_075
.room_09
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE, OBJECT_GROUP_022, ANIMATED_TILES_GROUP_03,  0, ROOM_025
.room_10
	room_data  9,  0, $2, $0, $a, $6, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_056, ANIMATED_TILES_GROUP_00,  0, ROOM_075
.room_11
	room_data  2,  2, $3, $2, $5, $2, CAM_TRANSITIONS, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_03,  0, ROOM_025
.room_14
	room_data  5,  2, $3, $2, $6, $5, CAM_FREE, OBJECT_GROUP_024, ANIMATED_TILES_GROUP_03,  0, ROOM_025
.room_15
	room_data  6,  2, $3, $2, $9, $6, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_048, ANIMATED_TILES_GROUP_11,  0, ROOM_061
.room_16
.room_17
.room_18
.room_19
	room_data  4,  0, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_060
.room_20
.room_21
	room_data  6,  0, $2, $0, $a, $6, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_056, ANIMATED_TILES_GROUP_00,  0, ROOM_075
.room_22
	room_data  1,  1, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_060
.room_23
	room_data  3,  2, $3, $2, $5, $2, CAM_TRANSITIONS, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_03,  0, ROOM_025
.room_25
	room_data  3,  1, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_060
.room_26
	room_data  5,  1, $2, $0, $6, $1, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_012, ANIMATED_TILES_GROUP_03,  0, ROOM_060
.room_27
	room_data  9,  2, $3, $2, $a, $9, CAM_FREE, OBJECT_GROUP_040, ANIMATED_TILES_GROUP_11,  0, ROOM_025
.room_29
	room_data  7,  2, $3, $2, $9, $6, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_048, ANIMATED_TILES_GROUP_11,  0, ROOM_061

LevelRooms_c18f7:
	dw .room_00
	dw .room_01
	dw NULL
	dw .room_03
	dw .room_04
	dw .room_05
	dw NULL
	dw .room_07
	dw .room_08
	dw .room_09
	dw .room_10
	dw NULL
	dw NULL
	dw NULL
	dw .room_14
	dw .room_15
	dw .room_16
	dw NULL
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_29

.room_00
	room_data  2,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_018
.room_01
	room_data  4,  2, $3, $2, $6, $3, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_074, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_03
	room_data  0,  2, $3, $2, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_04
	room_data  1,  2, $3, $2, $2, $1, CAM_TRANSITIONS, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_05
	room_data  9,  2, $3, $2, $a, $9, CAM_FREE, OBJECT_GROUP_106, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_07
	room_data  2,  2, $3, $2, $3, $2, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_08
	room_data  0,  1, $2, $1, $5, $0, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_06,  0, ROOM_018
.room_09
	room_data  6,  1, $2, $1, $8, $5, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_13,  0, ROOM_018
.room_10
	room_data  8,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_018
.room_14
	room_data  5,  1, $2, $1, $8, $5, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_13,  0, ROOM_018
.room_15
	room_data  4,  1, $2, $1, $5, $0, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_06,  0, ROOM_018
.room_16
	room_data  9,  0, $2, $0, $a, $9, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_069, ANIMATED_TILES_GROUP_13,  0, ROOM_018
.room_18
	room_data  3,  2, $3, $2, $6, $3, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_074, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_19
	room_data  7,  1, $2, $1, $8, $5, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_13,  0, ROOM_018
.room_20
	room_data  3,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_018
.room_21
	room_data  4,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_018
.room_22
	room_data  7,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_018
.room_23
	room_data  8,  1, $3, $1, $9, $8, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_139, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_24
	room_data  1,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_018
.room_29
	room_data  5,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_018

LevelRooms_c19d3:
	dw .room_00
	dw .room_01
	dw NULL
	dw .room_03
	dw .room_04
	dw .room_05
	dw NULL
	dw .room_07
	dw .room_08
	dw .room_09
	dw .room_10
	dw NULL
	dw NULL
	dw NULL
	dw .room_14
	dw .room_15
	dw .room_16
	dw NULL
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_29

.room_00
	room_data  2,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_102
.room_01
	room_data  4,  2, $3, $2, $6, $3, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_074, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_03
	room_data  0,  2, $3, $2, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_04
	room_data  1,  2, $3, $2, $2, $1, CAM_TRANSITIONS, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_05
	room_data  9,  2, $3, $2, $a, $9, CAM_FREE, OBJECT_GROUP_106, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_07
	room_data  2,  2, $3, $2, $3, $2, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_08
	room_data  0,  1, $2, $1, $5, $0, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_06,  0, ROOM_102
.room_09
	room_data  6,  1, $2, $1, $8, $5, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_13,  0, ROOM_102
.room_10
	room_data  8,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_102
.room_14
	room_data  5,  1, $2, $1, $8, $5, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_13,  0, ROOM_102
.room_15
	room_data  4,  1, $2, $1, $5, $0, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_06,  0, ROOM_102
.room_16
	room_data  9,  0, $2, $0, $a, $9, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_069, ANIMATED_TILES_GROUP_13,  0, ROOM_102
.room_18
	room_data  3,  2, $3, $2, $6, $3, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_074, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_19
	room_data  7,  1, $2, $1, $8, $5, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_13,  0, ROOM_102
.room_20
	room_data  3,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_102
.room_21
	room_data  4,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_102
.room_22
	room_data  7,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_102
.room_23
	room_data  8,  1, $3, $1, $9, $8, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_139, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_24
	room_data  1,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_102
.room_29
	room_data  5,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_102

LevelRooms_c1aaf:
	dw .room_00
	dw .room_01
	dw NULL
	dw .room_03
	dw .room_04
	dw .room_05
	dw NULL
	dw .room_07
	dw .room_08
	dw .room_09
	dw .room_10
	dw NULL
	dw NULL
	dw NULL
	dw .room_14
	dw .room_15
	dw .room_16
	dw NULL
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_29

.room_00
	room_data  2,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_103
.room_01
	room_data  4,  2, $3, $2, $6, $3, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_074, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_03
	room_data  0,  2, $3, $2, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_04
	room_data  1,  2, $3, $2, $2, $1, CAM_TRANSITIONS, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_05
	room_data  9,  2, $3, $2, $a, $9, CAM_FREE, OBJECT_GROUP_106, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_07
	room_data  2,  2, $3, $2, $3, $2, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_08
	room_data  0,  1, $2, $1, $5, $0, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_06,  0, ROOM_103
.room_09
	room_data  6,  1, $2, $1, $8, $5, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_13,  0, ROOM_103
.room_10
	room_data  8,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_103
.room_14
	room_data  5,  1, $2, $1, $8, $5, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_13,  0, ROOM_103
.room_15
	room_data  4,  1, $2, $1, $5, $0, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_06,  0, ROOM_103
.room_16
	room_data  9,  0, $2, $0, $a, $9, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_069, ANIMATED_TILES_GROUP_13,  0, ROOM_103
.room_18
	room_data  3,  2, $3, $2, $6, $3, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_074, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_19
	room_data  7,  1, $2, $1, $8, $5, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_13,  0, ROOM_103
.room_20
	room_data  3,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_103
.room_21
	room_data  4,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_103
.room_22
	room_data  7,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_103
.room_23
	room_data  8,  1, $3, $1, $9, $8, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_139, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_24
	room_data  1,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_103
.room_29
	room_data  5,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_103

LevelRooms_c1b8b:
	dw .room_00
	dw .room_01
	dw NULL
	dw .room_03
	dw .room_04
	dw .room_05
	dw NULL
	dw .room_07
	dw .room_08
	dw .room_09
	dw .room_10
	dw NULL
	dw NULL
	dw NULL
	dw .room_14
	dw .room_15
	dw .room_16
	dw NULL
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_29

.room_00
	room_data  2,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_104
.room_01
	room_data  4,  2, $3, $2, $6, $3, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_074, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_03
	room_data  0,  2, $3, $2, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_04
	room_data  1,  2, $3, $2, $2, $1, CAM_TRANSITIONS, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_05
	room_data  9,  2, $3, $2, $a, $9, CAM_FREE, OBJECT_GROUP_106, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_07
	room_data  2,  2, $3, $2, $3, $2, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_08
	room_data  0,  1, $2, $1, $5, $0, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_06,  0, ROOM_104
.room_09
	room_data  6,  1, $2, $1, $8, $5, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_13,  0, ROOM_104
.room_10
	room_data  8,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_104
.room_14
	room_data  5,  1, $2, $1, $8, $5, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_13,  0, ROOM_104
.room_15
	room_data  4,  1, $2, $1, $5, $0, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_06,  0, ROOM_104
.room_16
	room_data  9,  0, $2, $0, $a, $9, CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT, OBJECT_GROUP_069, ANIMATED_TILES_GROUP_13,  0, ROOM_104
.room_18
	room_data  3,  2, $3, $2, $6, $3, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_074, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_19
	room_data  7,  1, $2, $1, $8, $5, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_13,  0, ROOM_104
.room_20
	room_data  3,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_104
.room_21
	room_data  4,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_104
.room_22
	room_data  7,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_104
.room_23
	room_data  8,  1, $3, $1, $9, $8, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_139, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_24
	room_data  1,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_104
.room_29
	room_data  5,  0, $1, $0, $9, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_088, ANIMATED_TILES_GROUP_06,  0, ROOM_104

LevelRooms_c1c67:
	dw .room_00
	dw NULL
	dw NULL
	dw NULL
	dw .room_04
	dw NULL
	dw NULL
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw NULL
	dw .room_12
	dw .room_13
	dw .room_14
	dw NULL
	dw NULL
	dw .room_17
	dw NULL
	dw NULL
	dw .room_20
	dw .room_21
	dw NULL
	dw .room_23
	dw NULL
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  1,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_020
.room_04
	room_data  7,  2, $3, $2, $8, $7, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_091, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_07
	room_data  2,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_020
.room_09
	room_data  3,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_020
.room_10
	room_data  9,  2, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_093, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_12
	room_data  7,  0, $2, $0, $9, $6, CAM_FREE, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_13
	room_data  9,  0, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_093, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_14
	room_data  0,  2, $3, $2, $4, $0, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_04,  0, ROOM_021
.room_17
	room_data  8,  2, $3, $2, $9, $8, CAM_FREE, OBJECT_GROUP_092, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_20
	room_data  4,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_020
.room_21
	room_data  6,  2, $3, $2, $7, $4, CAM_FREE, OBJECT_GROUP_129, ANIMATED_TILES_GROUP_04,  0, ROOM_021
.room_23
	room_data  4,  2, $3, $2, $7, $4, CAM_FREE, OBJECT_GROUP_129, ANIMATED_TILES_GROUP_04,  0, ROOM_021
.room_25
	room_data  2,  2, $3, $2, $4, $0, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_04,  0, ROOM_021
.room_26
	room_data  1,  2, $3, $2, $4, $0, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_04,  0, ROOM_021
.room_27
	room_data  4,  0, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_020
.room_28
	room_data  7,  1, $2, $0, $9, $6, CAM_FREE, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_29
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_07,  0, ROOM_021

LevelRooms_c1d2b:
	dw .room_00
	dw NULL
	dw NULL
	dw NULL
	dw .room_04
	dw NULL
	dw NULL
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw NULL
	dw .room_12
	dw .room_13
	dw .room_14
	dw NULL
	dw NULL
	dw .room_17
	dw NULL
	dw NULL
	dw .room_20
	dw .room_21
	dw NULL
	dw .room_23
	dw NULL
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  1,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_020
.room_04
	room_data  7,  2, $3, $2, $8, $7, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_091, ANIMATED_TILES_GROUP_07,  0, ROOM_113
.room_07
	room_data  2,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_020
.room_09
	room_data  3,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_020
.room_10
	room_data  9,  2, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_093, ANIMATED_TILES_GROUP_07,  0, ROOM_113
.room_12
	room_data  7,  0, $2, $0, $9, $6, CAM_FREE, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_07,  0, ROOM_113
.room_13
	room_data  9,  0, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_093, ANIMATED_TILES_GROUP_07,  0, ROOM_113
.room_14
	room_data  0,  2, $3, $2, $4, $0, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_04,  0, ROOM_113
.room_17
	room_data  8,  2, $3, $2, $9, $8, CAM_FREE, OBJECT_GROUP_092, ANIMATED_TILES_GROUP_07,  0, ROOM_113
.room_20
	room_data  4,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_020
.room_21
	room_data  6,  2, $3, $2, $7, $4, CAM_FREE, OBJECT_GROUP_129, ANIMATED_TILES_GROUP_04,  0, ROOM_113
.room_23
	room_data  4,  2, $3, $2, $7, $4, CAM_FREE, OBJECT_GROUP_129, ANIMATED_TILES_GROUP_04,  0, ROOM_113
.room_25
	room_data  2,  2, $3, $2, $4, $0, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_04,  0, ROOM_113
.room_26
	room_data  1,  2, $3, $2, $4, $0, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_04,  0, ROOM_113
.room_27
	room_data  4,  0, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_020
.room_28
	room_data  7,  1, $2, $0, $9, $6, CAM_FREE, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_07,  0, ROOM_113
.room_29
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_07,  0, ROOM_113

LevelRooms_c1def:
	dw .room_00
	dw NULL
	dw NULL
	dw NULL
	dw .room_04
	dw NULL
	dw NULL
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw NULL
	dw .room_12
	dw .room_13
	dw .room_14
	dw NULL
	dw NULL
	dw .room_17
	dw NULL
	dw NULL
	dw .room_20
	dw .room_21
	dw NULL
	dw .room_23
	dw NULL
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  1,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_020
.room_04
	room_data  7,  2, $3, $2, $8, $7, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_091, ANIMATED_TILES_GROUP_07,  0, ROOM_114
.room_07
	room_data  2,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_020
.room_09
	room_data  3,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_020
.room_10
	room_data  9,  2, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_093, ANIMATED_TILES_GROUP_07,  0, ROOM_114
.room_12
	room_data  7,  0, $2, $0, $9, $6, CAM_FREE, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_07,  0, ROOM_114
.room_13
	room_data  9,  0, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_093, ANIMATED_TILES_GROUP_07,  0, ROOM_114
.room_14
	room_data  0,  2, $3, $2, $4, $0, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_04,  0, ROOM_114
.room_17
	room_data  8,  2, $3, $2, $9, $8, CAM_FREE, OBJECT_GROUP_092, ANIMATED_TILES_GROUP_07,  0, ROOM_114
.room_20
	room_data  4,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_020
.room_21
	room_data  6,  2, $3, $2, $7, $4, CAM_FREE, OBJECT_GROUP_129, ANIMATED_TILES_GROUP_04,  0, ROOM_114
.room_23
	room_data  4,  2, $3, $2, $7, $4, CAM_FREE, OBJECT_GROUP_129, ANIMATED_TILES_GROUP_04,  0, ROOM_114
.room_25
	room_data  2,  2, $3, $2, $4, $0, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_04,  0, ROOM_114
.room_26
	room_data  1,  2, $3, $2, $4, $0, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_04,  0, ROOM_114
.room_27
	room_data  4,  0, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_020
.room_28
	room_data  7,  1, $2, $0, $9, $6, CAM_FREE, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_07,  0, ROOM_114
.room_29
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_07,  0, ROOM_114

LevelRooms_c1eb3:
	dw .room_00
	dw NULL
	dw NULL
	dw NULL
	dw .room_04
	dw NULL
	dw NULL
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw NULL
	dw .room_12
	dw .room_13
	dw .room_14
	dw NULL
	dw NULL
	dw .room_17
	dw NULL
	dw NULL
	dw .room_20
	dw .room_21
	dw NULL
	dw .room_23
	dw NULL
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  1,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_115
.room_04
	room_data  7,  2, $3, $2, $8, $7, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_091, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_07
	room_data  2,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_115
.room_09
	room_data  3,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_115
.room_10
	room_data  9,  2, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_093, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_12
	room_data  7,  0, $2, $0, $9, $6, CAM_FREE, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_13
	room_data  9,  0, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_093, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_14
	room_data  0,  2, $3, $2, $4, $0, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_04,  0, ROOM_021
.room_17
	room_data  8,  2, $3, $2, $9, $8, CAM_FREE, OBJECT_GROUP_092, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_20
	room_data  4,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_115
.room_21
	room_data  6,  2, $3, $2, $7, $4, CAM_FREE, OBJECT_GROUP_129, ANIMATED_TILES_GROUP_04,  0, ROOM_021
.room_23
	room_data  4,  2, $3, $2, $7, $4, CAM_FREE, OBJECT_GROUP_129, ANIMATED_TILES_GROUP_04,  0, ROOM_021
.room_25
	room_data  2,  2, $3, $2, $4, $0, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_04,  0, ROOM_021
.room_26
	room_data  1,  2, $3, $2, $4, $0, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_04,  0, ROOM_021
.room_27
	room_data  4,  0, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_115
.room_28
	room_data  7,  1, $2, $0, $9, $6, CAM_FREE, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_29
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_07,  0, ROOM_021

LevelRooms_c1f77:
	dw .room_00
	dw NULL
	dw NULL
	dw NULL
	dw .room_04
	dw NULL
	dw NULL
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw NULL
	dw .room_12
	dw .room_13
	dw .room_14
	dw NULL
	dw NULL
	dw .room_17
	dw NULL
	dw NULL
	dw .room_20
	dw .room_21
	dw NULL
	dw .room_23
	dw NULL
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  1,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_115
.room_04
	room_data  7,  2, $3, $2, $8, $7, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_091, ANIMATED_TILES_GROUP_07,  0, ROOM_113
.room_07
	room_data  2,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_115
.room_09
	room_data  3,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_115
.room_10
	room_data  9,  2, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_093, ANIMATED_TILES_GROUP_07,  0, ROOM_113
.room_12
	room_data  7,  0, $2, $0, $9, $6, CAM_FREE, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_07,  0, ROOM_113
.room_13
	room_data  9,  0, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_093, ANIMATED_TILES_GROUP_07,  0, ROOM_113
.room_14
	room_data  0,  2, $3, $2, $4, $0, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_04,  0, ROOM_113
.room_17
	room_data  8,  2, $3, $2, $9, $8, CAM_FREE, OBJECT_GROUP_092, ANIMATED_TILES_GROUP_07,  0, ROOM_113
.room_20
	room_data  4,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_115
.room_21
	room_data  6,  2, $3, $2, $7, $4, CAM_FREE, OBJECT_GROUP_129, ANIMATED_TILES_GROUP_04,  0, ROOM_113
.room_23
	room_data  4,  2, $3, $2, $7, $4, CAM_FREE, OBJECT_GROUP_129, ANIMATED_TILES_GROUP_04,  0, ROOM_113
.room_25
	room_data  2,  2, $3, $2, $4, $0, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_04,  0, ROOM_113
.room_26
	room_data  1,  2, $3, $2, $4, $0, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_04,  0, ROOM_113
.room_27
	room_data  4,  0, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_115
.room_28
	room_data  7,  1, $2, $0, $9, $6, CAM_FREE, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_07,  0, ROOM_113
.room_29
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_07,  0, ROOM_113

LevelRooms_c203b:
	dw .room_00
	dw NULL
	dw NULL
	dw NULL
	dw .room_04
	dw NULL
	dw NULL
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw NULL
	dw .room_12
	dw .room_13
	dw .room_14
	dw NULL
	dw NULL
	dw .room_17
	dw NULL
	dw NULL
	dw .room_20
	dw .room_21
	dw NULL
	dw .room_23
	dw NULL
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  1,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_115
.room_04
	room_data  7,  2, $3, $2, $8, $7, CAM_TRANSITIONS | CAM_BORDER_LEFT, OBJECT_GROUP_091, ANIMATED_TILES_GROUP_07,  0, ROOM_114
.room_07
	room_data  2,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_115
.room_09
	room_data  3,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_115
.room_10
	room_data  9,  2, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_093, ANIMATED_TILES_GROUP_07,  0, ROOM_114
.room_12
	room_data  7,  0, $2, $0, $9, $6, CAM_FREE, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_07,  0, ROOM_114
.room_13
	room_data  9,  0, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_093, ANIMATED_TILES_GROUP_07,  0, ROOM_114
.room_14
	room_data  0,  2, $3, $2, $4, $0, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_04,  0, ROOM_114
.room_17
	room_data  8,  2, $3, $2, $9, $8, CAM_FREE, OBJECT_GROUP_092, ANIMATED_TILES_GROUP_07,  0, ROOM_114
.room_20
	room_data  4,  1, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_115
.room_21
	room_data  6,  2, $3, $2, $7, $4, CAM_FREE, OBJECT_GROUP_129, ANIMATED_TILES_GROUP_04,  0, ROOM_114
.room_23
	room_data  4,  2, $3, $2, $7, $4, CAM_FREE, OBJECT_GROUP_129, ANIMATED_TILES_GROUP_04,  0, ROOM_114
.room_25
	room_data  2,  2, $3, $2, $4, $0, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_04,  0, ROOM_114
.room_26
	room_data  1,  2, $3, $2, $4, $0, CAM_FREE, OBJECT_GROUP_003, ANIMATED_TILES_GROUP_04,  0, ROOM_114
.room_27
	room_data  4,  0, $2, $0, $6, $1, CAM_FREE, OBJECT_GROUP_018, ANIMATED_TILES_GROUP_06,  0, ROOM_115
.room_28
	room_data  7,  1, $2, $0, $9, $6, CAM_FREE, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_07,  0, ROOM_114
.room_29
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_07,  0, ROOM_114

LevelRooms_c20ff:
	dw .room_00
	dw NULL
	dw NULL
	dw .room_03
	dw NULL
	dw .room_05
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_10
	dw .room_11
	dw NULL
	dw .room_13
	dw NULL
	dw .room_15
	dw .room_16
	dw NULL
	dw NULL
	dw NULL
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  2,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_022
.room_03
	room_data  2,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_05
	room_data  3,  1, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_022
.room_10
.room_15
	room_data  1,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_022
.room_11
	room_data  8,  2, $3, $2, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_064, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_13
	room_data  5,  0, $2, $0, $6, $5, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_086, ANIMATED_TILES_GROUP_17,  0, ROOM_105
.room_16
	room_data  6,  2, $3, $2, $8, $5, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_066
.room_20
	room_data  4,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_21
	room_data  7,  2, $3, $2, $8, $5, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_066
.room_22
	room_data  3,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_022
.room_23
	room_data  5,  2, $3, $2, $8, $5, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_066
.room_24
	room_data  0,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_25
	room_data  3,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_26
	room_data  6,  1, $2, $0, $9, $6, CAM_FREE, OBJECT_GROUP_063, ANIMATED_TILES_GROUP_01,  0, ROOM_066
.room_27
	room_data  1,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_28
	room_data  1,  1, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_022
.room_29
	room_data  9,  2, $3, $2, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_064, ANIMATED_TILES_GROUP_17,  0, ROOM_050

LevelRooms_c21c3:
	dw .room_00
	dw NULL
	dw NULL
	dw .room_03
	dw NULL
	dw .room_05
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_10
	dw .room_11
	dw NULL
	dw .room_13
	dw NULL
	dw .room_15
	dw .room_16
	dw NULL
	dw NULL
	dw NULL
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  2,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_106
.room_03
	room_data  2,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_05
	room_data  3,  1, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_106
.room_10
.room_15
	room_data  1,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_106
.room_11
	room_data  8,  2, $3, $2, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_064, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_13
	room_data  5,  0, $2, $0, $6, $5, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_086, ANIMATED_TILES_GROUP_17,  0, ROOM_105
.room_16
	room_data  6,  2, $3, $2, $8, $5, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_066
.room_20
	room_data  4,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_21
	room_data  7,  2, $3, $2, $8, $5, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_066
.room_22
	room_data  3,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_106
.room_23
	room_data  5,  2, $3, $2, $8, $5, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_066
.room_24
	room_data  0,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_25
	room_data  3,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_26
	room_data  6,  1, $2, $0, $9, $6, CAM_FREE, OBJECT_GROUP_063, ANIMATED_TILES_GROUP_01,  0, ROOM_066
.room_27
	room_data  1,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_28
	room_data  1,  1, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_106
.room_29
	room_data  9,  2, $3, $2, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_064, ANIMATED_TILES_GROUP_17,  0, ROOM_050

LevelRooms_c2287:
	dw .room_00
	dw NULL
	dw NULL
	dw .room_03
	dw NULL
	dw .room_05
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_10
	dw .room_11
	dw NULL
	dw .room_13
	dw NULL
	dw .room_15
	dw .room_16
	dw NULL
	dw NULL
	dw NULL
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  2,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_106
.room_03
	room_data  2,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_05
	room_data  3,  1, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_106
.room_10
.room_15
	room_data  1,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_106
.room_11
	room_data  8,  2, $3, $2, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_064, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_13
	room_data  5,  0, $2, $0, $6, $5, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_086, ANIMATED_TILES_GROUP_17,  0, ROOM_105
.room_16
	room_data  6,  2, $3, $2, $8, $5, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_107
.room_20
	room_data  4,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_21
	room_data  7,  2, $3, $2, $8, $5, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_107
.room_22
	room_data  3,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_106
.room_23
	room_data  5,  2, $3, $2, $8, $5, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_107
.room_24
	room_data  0,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_25
	room_data  3,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_26
	room_data  6,  1, $2, $0, $9, $6, CAM_FREE, OBJECT_GROUP_063, ANIMATED_TILES_GROUP_01,  0, ROOM_107
.room_27
	room_data  1,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_28
	room_data  1,  1, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_106
.room_29
	room_data  9,  2, $3, $2, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_064, ANIMATED_TILES_GROUP_17,  0, ROOM_050

LevelRooms_c234b:
	dw .room_00
	dw NULL
	dw NULL
	dw .room_03
	dw NULL
	dw .room_05
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_10
	dw .room_11
	dw NULL
	dw .room_13
	dw NULL
	dw .room_15
	dw .room_16
	dw NULL
	dw NULL
	dw NULL
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  2,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_108
.room_03
	room_data  2,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_05
	room_data  3,  1, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_108
.room_10
.room_15
	room_data  1,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_108
.room_11
	room_data  8,  2, $3, $2, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_064, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_13
	room_data  5,  0, $2, $0, $6, $5, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_086, ANIMATED_TILES_GROUP_17,  0, ROOM_105
.room_16
	room_data  6,  2, $3, $2, $8, $5, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_066
.room_20
	room_data  4,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_21
	room_data  7,  2, $3, $2, $8, $5, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_066
.room_22
	room_data  3,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_108
.room_23
	room_data  5,  2, $3, $2, $8, $5, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_066
.room_24
	room_data  0,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_25
	room_data  3,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_26
	room_data  6,  1, $2, $0, $9, $6, CAM_FREE, OBJECT_GROUP_063, ANIMATED_TILES_GROUP_01,  0, ROOM_066
.room_27
	room_data  1,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_28
	room_data  1,  1, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_108
.room_29
	room_data  9,  2, $3, $2, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_064, ANIMATED_TILES_GROUP_17,  0, ROOM_050

LevelRooms_c240f:
	dw .room_00
	dw NULL
	dw NULL
	dw .room_03
	dw NULL
	dw .room_05
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_10
	dw .room_11
	dw NULL
	dw .room_13
	dw NULL
	dw .room_15
	dw .room_16
	dw NULL
	dw NULL
	dw NULL
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  2,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_109
.room_03
	room_data  2,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_05
	room_data  3,  1, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_109
.room_10
.room_15
	room_data  1,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_109
.room_11
	room_data  8,  2, $3, $2, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_064, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_13
	room_data  5,  0, $2, $0, $6, $5, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_086, ANIMATED_TILES_GROUP_17,  0, ROOM_105
.room_16
	room_data  6,  2, $3, $2, $8, $5, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_066
.room_20
	room_data  4,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_21
	room_data  7,  2, $3, $2, $8, $5, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_066
.room_22
	room_data  3,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_109
.room_23
	room_data  5,  2, $3, $2, $8, $5, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_066
.room_24
	room_data  0,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_25
	room_data  3,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_26
	room_data  6,  1, $2, $0, $9, $6, CAM_FREE, OBJECT_GROUP_063, ANIMATED_TILES_GROUP_01,  0, ROOM_066
.room_27
	room_data  1,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_28
	room_data  1,  1, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_109
.room_29
	room_data  9,  2, $3, $2, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_064, ANIMATED_TILES_GROUP_17,  0, ROOM_050

LevelRooms_c24d3:
	dw .room_00
	dw NULL
	dw NULL
	dw .room_03
	dw NULL
	dw .room_05
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_10
	dw .room_11
	dw NULL
	dw .room_13
	dw NULL
	dw .room_15
	dw .room_16
	dw NULL
	dw NULL
	dw NULL
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  2,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_109
.room_03
	room_data  2,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_05
	room_data  3,  1, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_109
.room_10
.room_15
	room_data  1,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_109
.room_11
	room_data  8,  2, $3, $2, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_064, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_13
	room_data  5,  0, $2, $0, $6, $5, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_086, ANIMATED_TILES_GROUP_17,  0, ROOM_105
.room_16
	room_data  6,  2, $3, $2, $8, $5, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_107
.room_20
	room_data  4,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_21
	room_data  7,  2, $3, $2, $8, $5, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_107
.room_22
	room_data  3,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_109
.room_23
	room_data  5,  2, $3, $2, $8, $5, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_107
.room_24
	room_data  0,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_25
	room_data  3,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_26
	room_data  6,  1, $2, $0, $9, $6, CAM_FREE, OBJECT_GROUP_063, ANIMATED_TILES_GROUP_01,  0, ROOM_107
.room_27
	room_data  1,  2, $3, $2, $5, $0, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_17,  0, ROOM_050
.room_28
	room_data  1,  1, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_127, ANIMATED_TILES_GROUP_17,  0, ROOM_109
.room_29
	room_data  9,  2, $3, $2, $a, $8, CAM_TRANSITIONS, OBJECT_GROUP_064, ANIMATED_TILES_GROUP_17,  0, ROOM_050

LevelRooms_c2597:
	dw .room_00
	dw .room_01
	dw NULL
	dw NULL
	dw .room_04
	dw .room_05
	dw .room_06
	dw .room_07
	dw .room_08
	dw .room_09
	dw .room_10
	dw .room_11
	dw NULL
	dw NULL
	dw .room_14
	dw .room_15
	dw NULL
	dw NULL
	dw NULL
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw NULL
	dw .room_24
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  2,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_023, ANIMATED_TILES_GROUP_05,  0, ROOM_023
.room_01
	room_data  0,  2, $3, $2, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_013, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_04
	room_data  0,  1, $2, $1, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_05,  0, ROOM_062
.room_05
	room_data  7,  2, $3, $0, $8, $6, CAM_TRANSITIONS, OBJECT_GROUP_060, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_06
	room_data  1,  2, $3, $2, $2, $1, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_07
	room_data  7,  0, $3, $0, $8, $6, CAM_TRANSITIONS, OBJECT_GROUP_060, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_08
	room_data  4,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_023, ANIMATED_TILES_GROUP_05,  0, ROOM_023
.room_09
	room_data  5,  1, $3, $0, $6, $5, CAM_FREE, OBJECT_GROUP_025, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_10
	room_data  4,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_023, ANIMATED_TILES_GROUP_05,  0, ROOM_023
.room_11
	room_data  6,  2, $3, $0, $8, $6, CAM_TRANSITIONS, OBJECT_GROUP_060, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_14
	room_data  8,  0, $3, $0, $9, $8, CAM_FREE, OBJECT_GROUP_011, ANIMATED_TILES_GROUP_05,  0, ROOM_062
.room_15
	room_data  9,  0, $2, $0, $a, $9, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_055, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_19
.room_29
	room_data  7,  1, $3, $0, $8, $6, CAM_TRANSITIONS, OBJECT_GROUP_060, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_20
	room_data  1,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_023, ANIMATED_TILES_GROUP_05,  0, ROOM_023
.room_21
	room_data  6,  0, $3, $0, $8, $6, CAM_TRANSITIONS, OBJECT_GROUP_060, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_22
	room_data  8,  2, $3, $0, $9, $8, CAM_FREE, OBJECT_GROUP_011, ANIMATED_TILES_GROUP_05,  0, ROOM_062
.room_24
	room_data  5,  2, $3, $0, $6, $5, CAM_FREE, OBJECT_GROUP_025, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_25
	room_data  4,  2, $3, $2, $5, $4, CAM_TRANSITIONS, OBJECT_GROUP_011, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_26
	room_data  1,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_023, ANIMATED_TILES_GROUP_05,  0, ROOM_023
.room_27
	room_data  5,  0, $3, $0, $6, $5, CAM_FREE, OBJECT_GROUP_025, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_28
	room_data  2,  2, $3, $2, $3, $2, CAM_TRANSITIONS, OBJECT_GROUP_011, ANIMATED_TILES_GROUP_05,  0, ROOM_062

LevelRooms_c267b:
	dw .room_00
	dw .room_01
	dw NULL
	dw NULL
	dw .room_04
	dw .room_05
	dw .room_06
	dw .room_07
	dw .room_08
	dw .room_09
	dw .room_10
	dw .room_11
	dw NULL
	dw NULL
	dw .room_14
	dw .room_15
	dw NULL
	dw NULL
	dw NULL
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw NULL
	dw .room_24
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  2,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_061, ANIMATED_TILES_GROUP_05,  0, ROOM_042
.room_01
	room_data  0,  2, $3, $2, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_013, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_04
	room_data  0,  1, $2, $1, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_05,  0, ROOM_062
.room_05
	room_data  7,  2, $3, $0, $8, $6, CAM_TRANSITIONS, OBJECT_GROUP_060, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_06
	room_data  1,  2, $3, $2, $2, $1, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_07
	room_data  7,  0, $3, $0, $8, $6, CAM_TRANSITIONS, OBJECT_GROUP_060, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_08
	room_data  4,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_061, ANIMATED_TILES_GROUP_05,  0, ROOM_042
.room_09
	room_data  5,  1, $3, $0, $6, $5, CAM_FREE, OBJECT_GROUP_025, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_10
	room_data  4,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_061, ANIMATED_TILES_GROUP_05,  0, ROOM_042
.room_11
	room_data  6,  2, $3, $0, $8, $6, CAM_TRANSITIONS, OBJECT_GROUP_060, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_14
	room_data  8,  0, $3, $0, $9, $8, CAM_FREE, OBJECT_GROUP_011, ANIMATED_TILES_GROUP_05,  0, ROOM_062
.room_15
	room_data  9,  0, $2, $0, $a, $9, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_055, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_19
.room_29
	room_data  7,  1, $3, $0, $8, $6, CAM_TRANSITIONS, OBJECT_GROUP_060, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_20
	room_data  1,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_061, ANIMATED_TILES_GROUP_05,  0, ROOM_042
.room_21
	room_data  6,  0, $3, $0, $8, $6, CAM_TRANSITIONS, OBJECT_GROUP_060, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_22
	room_data  8,  2, $3, $0, $9, $8, CAM_FREE, OBJECT_GROUP_011, ANIMATED_TILES_GROUP_05,  0, ROOM_062
.room_24
	room_data  5,  2, $3, $0, $6, $5, CAM_FREE, OBJECT_GROUP_025, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_25
	room_data  4,  2, $3, $2, $5, $4, CAM_TRANSITIONS, OBJECT_GROUP_011, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_26
	room_data  1,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_061, ANIMATED_TILES_GROUP_05,  0, ROOM_042
.room_27
	room_data  5,  0, $3, $0, $6, $5, CAM_FREE, OBJECT_GROUP_025, ANIMATED_TILES_GROUP_05,  0, ROOM_024
.room_28
	room_data  2,  2, $3, $2, $3, $2, CAM_TRANSITIONS, OBJECT_GROUP_011, ANIMATED_TILES_GROUP_05,  0, ROOM_062

LevelRooms_c275f:
	dw .room_00
	dw NULL
	dw .room_02
	dw .room_03
	dw .room_04
	dw NULL
	dw .room_06
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw .room_11
	dw .room_12
	dw .room_13
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw NULL
	dw NULL
	dw NULL
	dw .room_26
	dw NULL
	dw .room_28
	dw .room_29

.room_00
	room_data  1,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_027
.room_02
	room_data  2,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_065, ANIMATED_TILES_GROUP_03,  0, ROOM_027
.room_03
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE, OBJECT_GROUP_026, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_04
	room_data  8,  2, $3, $2, $9, $8, CAM_TRANSITIONS, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_06
	room_data  5,  0, $2, $0, $6, $5, CAM_YSCROLL, OBJECT_GROUP_044, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_07
	room_data  1,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_065, ANIMATED_TILES_GROUP_03,  0, ROOM_027
.room_09
	room_data  3,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_027
.room_10
	room_data  3,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_065, ANIMATED_TILES_GROUP_03,  0, ROOM_027
.room_11
.room_12
.room_13
.room_14
	room_data  4,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_027
.room_15
	room_data  5,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_027
.room_16
	room_data  5,  1, $2, $0, $6, $5, CAM_YSCROLL, OBJECT_GROUP_044, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_17
	room_data  2,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_027
.room_18
	room_data  9,  1, $2, $0, $a, $9, CAM_FREE, OBJECT_GROUP_025, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_19
	room_data  8,  1, $2, $0, $9, $8, CAM_FREE, OBJECT_GROUP_024, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_20
	room_data  9,  2, $3, $2, $a, $9, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_21
	room_data  8,  0, $2, $0, $9, $8, CAM_FREE, OBJECT_GROUP_024, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_22
	room_data  7,  1, $2, $0, $8, $7, CAM_YSCROLL, OBJECT_GROUP_059, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_26
	room_data  6,  1, $2, $0, $7, $6, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_044, ANIMATED_TILES_GROUP_03,  0, ROOM_154
.room_28
	room_data  4,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_065, ANIMATED_TILES_GROUP_03,  0, ROOM_027
.room_29
	room_data  0,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_027

LevelRooms_c283b:
	dw .room_00
	dw NULL
	dw .room_02
	dw .room_03
	dw .room_04
	dw NULL
	dw .room_06
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw .room_11
	dw .room_12
	dw .room_13
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw NULL
	dw NULL
	dw NULL
	dw .room_26
	dw NULL
	dw .room_28
	dw .room_29

.room_00
	room_data  1,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_027
.room_02
	room_data  2,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_067, ANIMATED_TILES_GROUP_03,  0, ROOM_027
.room_03
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE, OBJECT_GROUP_026, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_04
	room_data  8,  2, $3, $2, $9, $8, CAM_TRANSITIONS, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_06
	room_data  5,  0, $2, $0, $6, $5, CAM_YSCROLL, OBJECT_GROUP_044, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_07
	room_data  1,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_067, ANIMATED_TILES_GROUP_03,  0, ROOM_027
.room_09
	room_data  3,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_027
.room_10
	room_data  3,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_067, ANIMATED_TILES_GROUP_03,  0, ROOM_027
.room_11
.room_12
.room_13
.room_14
	room_data  4,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_027
.room_15
	room_data  5,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_027
.room_16
	room_data  5,  1, $2, $0, $6, $5, CAM_YSCROLL, OBJECT_GROUP_044, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_17
	room_data  2,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_027
.room_18
	room_data  9,  1, $2, $0, $a, $9, CAM_FREE, OBJECT_GROUP_025, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_19
	room_data  8,  1, $2, $0, $9, $8, CAM_FREE, OBJECT_GROUP_024, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_20
	room_data  9,  2, $3, $2, $a, $9, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_21
	room_data  8,  0, $2, $0, $9, $8, CAM_FREE, OBJECT_GROUP_024, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_22
	room_data  7,  1, $2, $0, $8, $7, CAM_YSCROLL, OBJECT_GROUP_059, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_26
	room_data  6,  1, $2, $0, $7, $6, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_044, ANIMATED_TILES_GROUP_03,  0, ROOM_154
.room_28
	room_data  4,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_067, ANIMATED_TILES_GROUP_03,  0, ROOM_027
.room_29
	room_data  0,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_027

LevelRooms_c2917:
	dw .room_00
	dw NULL
	dw .room_02
	dw .room_03
	dw .room_04
	dw NULL
	dw .room_06
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw .room_11
	dw .room_12
	dw .room_13
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw NULL
	dw NULL
	dw NULL
	dw .room_26
	dw NULL
	dw .room_28
	dw .room_29

.room_00
	room_data  1,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_080
.room_02
	room_data  2,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_065, ANIMATED_TILES_GROUP_03,  0, ROOM_080
.room_03
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE, OBJECT_GROUP_026, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_04
	room_data  8,  2, $3, $2, $9, $8, CAM_TRANSITIONS, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_06
	room_data  5,  0, $2, $0, $6, $5, CAM_YSCROLL, OBJECT_GROUP_044, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_07
	room_data  1,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_065, ANIMATED_TILES_GROUP_03,  0, ROOM_080
.room_09
	room_data  3,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_080
.room_10
	room_data  3,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_065, ANIMATED_TILES_GROUP_03,  0, ROOM_080
.room_11
.room_12
.room_13
.room_14
	room_data  4,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_080
.room_15
	room_data  5,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_080
.room_16
	room_data  5,  1, $2, $0, $6, $5, CAM_YSCROLL, OBJECT_GROUP_044, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_17
	room_data  2,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_080
.room_18
	room_data  9,  1, $2, $0, $a, $9, CAM_FREE, OBJECT_GROUP_025, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_19
	room_data  8,  1, $2, $0, $9, $8, CAM_FREE, OBJECT_GROUP_024, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_20
	room_data  9,  2, $3, $2, $a, $9, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_21
	room_data  8,  0, $2, $0, $9, $8, CAM_FREE, OBJECT_GROUP_024, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_22
	room_data  7,  1, $2, $0, $8, $7, CAM_YSCROLL, OBJECT_GROUP_059, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_26
	room_data  6,  1, $2, $0, $7, $6, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_044, ANIMATED_TILES_GROUP_03,  0, ROOM_154
.room_28
	room_data  4,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_065, ANIMATED_TILES_GROUP_03,  0, ROOM_080
.room_29
	room_data  0,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_080

LevelRooms_c29f3:
	dw .room_00
	dw NULL
	dw .room_02
	dw .room_03
	dw .room_04
	dw NULL
	dw .room_06
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw .room_11
	dw .room_12
	dw .room_13
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw NULL
	dw NULL
	dw NULL
	dw .room_26
	dw NULL
	dw .room_28
	dw .room_29

.room_00
	room_data  1,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_080
.room_02
	room_data  2,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_067, ANIMATED_TILES_GROUP_03,  0, ROOM_080
.room_03
	room_data  0,  1, $2, $1, $1, $0, CAM_FREE, OBJECT_GROUP_026, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_04
	room_data  8,  2, $3, $2, $9, $8, CAM_TRANSITIONS, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_06
	room_data  5,  0, $2, $0, $6, $5, CAM_YSCROLL, OBJECT_GROUP_044, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_07
	room_data  1,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_067, ANIMATED_TILES_GROUP_03,  0, ROOM_080
.room_09
	room_data  3,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_080
.room_10
	room_data  3,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_067, ANIMATED_TILES_GROUP_03,  0, ROOM_080
.room_11
.room_12
.room_13
.room_14
	room_data  4,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_080
.room_15
	room_data  5,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_080
.room_16
	room_data  5,  1, $2, $0, $6, $5, CAM_YSCROLL, OBJECT_GROUP_044, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_17
	room_data  2,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_080
.room_18
	room_data  9,  1, $2, $0, $a, $9, CAM_FREE, OBJECT_GROUP_025, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_19
	room_data  8,  1, $2, $0, $9, $8, CAM_FREE, OBJECT_GROUP_024, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_20
	room_data  9,  2, $3, $2, $a, $9, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_21
	room_data  8,  0, $2, $0, $9, $8, CAM_FREE, OBJECT_GROUP_024, ANIMATED_TILES_GROUP_07,  0, ROOM_021
.room_22
	room_data  7,  1, $2, $0, $8, $7, CAM_YSCROLL, OBJECT_GROUP_059, ANIMATED_TILES_GROUP_03,  0, ROOM_028
.room_26
	room_data  6,  1, $2, $0, $7, $6, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_044, ANIMATED_TILES_GROUP_03,  0, ROOM_154
.room_28
	room_data  4,  0, $2, $0, $5, $1, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_067, ANIMATED_TILES_GROUP_03,  0, ROOM_080
.room_29
	room_data  0,  2, $3, $2, $7, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_010, ANIMATED_TILES_GROUP_03,  0, ROOM_080

LevelRooms_c2acf:
	dw .room_00
	dw .room_01
	dw NULL
	dw NULL
	dw NULL
	dw .room_05
	dw .room_06
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw .room_11
	dw NULL
	dw .room_13
	dw .room_14
	dw NULL
	dw .room_16
	dw NULL
	dw NULL
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw NULL
	dw NULL
	dw .room_28
	dw NULL

.room_00
	room_data  2,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_029
.room_01
	room_data  0,  2, $3, $2, $5, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_076, ANIMATED_TILES_GROUP_03,  0, ROOM_029
.room_05
	room_data  5,  2, $3, $2, $6, $5, CAM_TRANSITIONS, OBJECT_GROUP_008, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_06
	room_data  9,  0, $2, $0, $a, $7, CAM_FREE, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_07
	room_data  3,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_029
.room_09
	room_data  6,  0, $2, $0, $7, $6, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_108, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_10
	room_data  1,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_029
.room_11
	room_data  0,  1, $2, $1, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_13
	room_data  7,  0, $2, $0, $a, $7, CAM_FREE, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_14
	room_data  8,  2, $3, $2, $a, $6, CAM_TRANSITIONS, OBJECT_GROUP_075, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_16
	room_data  9,  1, $2, $0, $a, $7, CAM_FREE, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_19
	room_data  6,  1, $2, $0, $7, $6, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_108, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_20
	room_data  1,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_029
.room_21
.room_22
.room_23
.room_24
	room_data  3,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_029
.room_25
	room_data  5,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_029
.room_28
	room_data  4,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_029

LevelRooms_c2b8b:
	dw .room_00
	dw .room_01
	dw NULL
	dw NULL
	dw NULL
	dw .room_05
	dw .room_06
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw .room_11
	dw NULL
	dw .room_13
	dw .room_14
	dw NULL
	dw .room_16
	dw NULL
	dw NULL
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw NULL
	dw NULL
	dw .room_28
	dw NULL

.room_00
	room_data  2,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_082
.room_01
	room_data  0,  2, $3, $2, $5, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_076, ANIMATED_TILES_GROUP_03,  0, ROOM_082
.room_05
	room_data  5,  2, $3, $2, $6, $5, CAM_TRANSITIONS, OBJECT_GROUP_008, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_06
	room_data  9,  0, $2, $0, $a, $7, CAM_FREE, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_07
	room_data  3,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_082
.room_09
	room_data  6,  0, $2, $0, $7, $6, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_108, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_10
	room_data  1,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_082
.room_11
	room_data  0,  1, $2, $1, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_13
	room_data  7,  0, $2, $0, $a, $7, CAM_FREE, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_14
	room_data  8,  2, $3, $2, $a, $6, CAM_TRANSITIONS, OBJECT_GROUP_075, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_16
	room_data  9,  1, $2, $0, $a, $7, CAM_FREE, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_19
	room_data  6,  1, $2, $0, $7, $6, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_108, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_20
	room_data  1,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_082
.room_21
.room_22
.room_23
.room_24
	room_data  3,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_082
.room_25
	room_data  5,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_082
.room_28
	room_data  4,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_082

LevelRooms_c2c47:
	dw .room_00
	dw .room_01
	dw NULL
	dw NULL
	dw NULL
	dw .room_05
	dw .room_06
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw .room_11
	dw NULL
	dw .room_13
	dw .room_14
	dw NULL
	dw .room_16
	dw NULL
	dw NULL
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw NULL
	dw NULL
	dw .room_28
	dw NULL

.room_00
	room_data  2,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_081
.room_01
	room_data  0,  2, $3, $2, $5, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_076, ANIMATED_TILES_GROUP_03,  0, ROOM_081
.room_05
	room_data  5,  2, $3, $2, $6, $5, CAM_TRANSITIONS, OBJECT_GROUP_008, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_06
	room_data  9,  0, $2, $0, $a, $7, CAM_FREE, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_07
	room_data  3,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_081
.room_09
	room_data  6,  0, $2, $0, $7, $6, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_108, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_10
	room_data  1,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_081
.room_11
	room_data  0,  1, $2, $1, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_13
	room_data  7,  0, $2, $0, $a, $7, CAM_FREE, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_14
	room_data  8,  2, $3, $2, $a, $6, CAM_TRANSITIONS, OBJECT_GROUP_075, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_16
	room_data  9,  1, $2, $0, $a, $7, CAM_FREE, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_19
	room_data  6,  1, $2, $0, $7, $6, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_108, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_20
	room_data  1,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_081
.room_21
.room_22
.room_23
.room_24
	room_data  3,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_081
.room_25
	room_data  5,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_081
.room_28
	room_data  4,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_081

LevelRooms_c2d03:
	dw .room_00
	dw .room_01
	dw NULL
	dw NULL
	dw NULL
	dw .room_05
	dw .room_06
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw .room_11
	dw NULL
	dw .room_13
	dw .room_14
	dw NULL
	dw .room_16
	dw NULL
	dw NULL
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw NULL
	dw NULL
	dw .room_28
	dw NULL

.room_00
	room_data  2,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_083
.room_01
	room_data  0,  2, $3, $2, $5, $0, CAM_FREE | CAM_BORDER_DOWN, OBJECT_GROUP_076, ANIMATED_TILES_GROUP_03,  0, ROOM_083
.room_05
	room_data  5,  2, $3, $2, $6, $5, CAM_TRANSITIONS, OBJECT_GROUP_008, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_06
	room_data  9,  0, $2, $0, $a, $7, CAM_FREE, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_07
	room_data  3,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_083
.room_09
	room_data  6,  0, $2, $0, $7, $6, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_108, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_10
	room_data  1,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_083
.room_11
	room_data  0,  1, $2, $1, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_13
	room_data  7,  0, $2, $0, $a, $7, CAM_FREE, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_14
	room_data  8,  2, $3, $2, $a, $6, CAM_TRANSITIONS, OBJECT_GROUP_075, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_16
	room_data  9,  1, $2, $0, $a, $7, CAM_FREE, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_19
	room_data  6,  1, $2, $0, $7, $6, CAM_XSCROLL2 | CAM_TRANSITIONS, OBJECT_GROUP_108, ANIMATED_TILES_GROUP_03,  0, ROOM_030
.room_20
	room_data  1,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_083
.room_21
.room_22
.room_23
.room_24
	room_data  3,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_083
.room_25
	room_data  5,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_083
.room_28
	room_data  4,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_052, ANIMATED_TILES_GROUP_03,  0, ROOM_083

LevelRooms_c2dbf:
	dw .room_00
	dw NULL
	dw NULL
	dw NULL
	dw .room_04
	dw .room_05
	dw .room_06
	dw NULL
	dw NULL
	dw .room_09
	dw .room_10
	dw .room_11
	dw NULL
	dw NULL
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw .room_18
	dw .room_19
	dw NULL
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  2,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_031
.room_04
	room_data  3,  2, $3, $2, $5, $3, CAM_TRANSITIONS, OBJECT_GROUP_070, ANIMATED_TILES_GROUP_03,  0, ROOM_032
.room_05
	room_data  1,  2, $3, $2, $2, $1, CAM_FREE, OBJECT_GROUP_121, ANIMATED_TILES_GROUP_12,  0, ROOM_032
.room_06
	room_data  8,  2, $3, $2, $9, $8, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_12,  0, ROOM_032
.room_09
	room_data  4,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_031
.room_10
	room_data  7,  2, $3, $2, $8, $5, CAM_TRANSITIONS, OBJECT_GROUP_071, ANIMATED_TILES_GROUP_03,  0, ROOM_033
.room_11
	room_data  6,  1, $2, $0, $7, $5, CAM_FREE, OBJECT_GROUP_057, ANIMATED_TILES_GROUP_12,  0, ROOM_032
.room_14
	room_data  9,  0, $2, $0, $a, $9, CAM_FREE, OBJECT_GROUP_121, ANIMATED_TILES_GROUP_12,  0, ROOM_033
.room_15
	room_data  2,  2, $3, $2, $3, $2, CAM_FREE, OBJECT_GROUP_145, ANIMATED_TILES_GROUP_12,  0, ROOM_032
.room_16
	room_data  1,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_031
.room_17
	room_data  9,  1, $2, $0, $a, $9, CAM_FREE, OBJECT_GROUP_121, ANIMATED_TILES_GROUP_12,  0, ROOM_033
.room_18
	room_data  9,  2, $3, $2, $a, $9, CAM_TRANSITIONS, OBJECT_GROUP_040, ANIMATED_TILES_GROUP_12,  0, ROOM_032
.room_19
	room_data  7,  1, $2, $0, $9, $7, CAM_FREE, OBJECT_GROUP_040, ANIMATED_TILES_GROUP_12,  0, ROOM_058
.room_21
	room_data  5,  0, $2, $0, $7, $5, CAM_FREE, OBJECT_GROUP_057, ANIMATED_TILES_GROUP_12,  0, ROOM_032
.room_22
	room_data  5,  1, $2, $0, $7, $5, CAM_FREE, OBJECT_GROUP_057, ANIMATED_TILES_GROUP_12,  0, ROOM_032
.room_23
	room_data  4,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_031
.room_24
	room_data  5,  2, $3, $2, $8, $5, CAM_TRANSITIONS, OBJECT_GROUP_071, ANIMATED_TILES_GROUP_03,  0, ROOM_033
.room_25
	room_data  4,  2, $3, $2, $5, $3, CAM_TRANSITIONS, OBJECT_GROUP_070, ANIMATED_TILES_GROUP_03,  0, ROOM_032
.room_26
	room_data  3,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_031
.room_27
	room_data  0,  2, $3, $1, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_111, ANIMATED_TILES_GROUP_20,  0, ROOM_031
.room_28
	room_data  6,  0, $2, $0, $7, $5, CAM_FREE, OBJECT_GROUP_057, ANIMATED_TILES_GROUP_12,  0, ROOM_032
.room_29
	room_data  8,  1, $2, $0, $9, $7, CAM_FREE, OBJECT_GROUP_040, ANIMATED_TILES_GROUP_12,  0, ROOM_058

LevelRooms_c2eab:
	dw .room_00
	dw NULL
	dw NULL
	dw NULL
	dw .room_04
	dw .room_05
	dw .room_06
	dw NULL
	dw NULL
	dw .room_09
	dw .room_10
	dw .room_11
	dw NULL
	dw NULL
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw .room_18
	dw .room_19
	dw NULL
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  2,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_031
.room_04
	room_data  3,  2, $3, $2, $5, $3, CAM_TRANSITIONS, OBJECT_GROUP_070, ANIMATED_TILES_GROUP_03,  0, ROOM_032
.room_05
	room_data  1,  2, $3, $2, $2, $1, CAM_FREE, OBJECT_GROUP_121, ANIMATED_TILES_GROUP_12,  0, ROOM_032
.room_06
	room_data  8,  2, $3, $2, $9, $8, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_12,  0, ROOM_032
.room_09
	room_data  4,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_031
.room_10
	room_data  7,  2, $3, $2, $8, $5, CAM_TRANSITIONS, OBJECT_GROUP_071, ANIMATED_TILES_GROUP_03,  0, ROOM_033
.room_11
	room_data  6,  1, $2, $0, $7, $5, CAM_FREE, OBJECT_GROUP_057, ANIMATED_TILES_GROUP_12,  0, ROOM_032
.room_14
	room_data  9,  0, $2, $0, $a, $9, CAM_FREE, OBJECT_GROUP_121, ANIMATED_TILES_GROUP_12,  0, ROOM_033
.room_15
	room_data  2,  2, $3, $2, $3, $2, CAM_FREE, OBJECT_GROUP_145, ANIMATED_TILES_GROUP_12,  0, ROOM_032
.room_16
	room_data  1,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_031
.room_17
	room_data  9,  1, $2, $0, $a, $9, CAM_FREE, OBJECT_GROUP_121, ANIMATED_TILES_GROUP_12,  0, ROOM_033
.room_18
	room_data  9,  2, $3, $2, $a, $9, CAM_TRANSITIONS, OBJECT_GROUP_040, ANIMATED_TILES_GROUP_12,  0, ROOM_032
.room_19
	room_data  7,  1, $2, $0, $9, $7, CAM_FREE, OBJECT_GROUP_040, ANIMATED_TILES_GROUP_12,  0, ROOM_087
.room_21
	room_data  5,  0, $2, $0, $7, $5, CAM_FREE, OBJECT_GROUP_057, ANIMATED_TILES_GROUP_12,  0, ROOM_032
.room_22
	room_data  5,  1, $2, $0, $7, $5, CAM_FREE, OBJECT_GROUP_057, ANIMATED_TILES_GROUP_12,  0, ROOM_032
.room_23
	room_data  4,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_031
.room_24
	room_data  5,  2, $3, $2, $8, $5, CAM_TRANSITIONS, OBJECT_GROUP_071, ANIMATED_TILES_GROUP_03,  0, ROOM_033
.room_25
	room_data  4,  2, $3, $2, $5, $3, CAM_TRANSITIONS, OBJECT_GROUP_070, ANIMATED_TILES_GROUP_03,  0, ROOM_032
.room_26
	room_data  3,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_031
.room_27
	room_data  0,  2, $3, $1, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_111, ANIMATED_TILES_GROUP_20,  0, ROOM_031
.room_28
	room_data  6,  0, $2, $0, $7, $5, CAM_FREE, OBJECT_GROUP_057, ANIMATED_TILES_GROUP_12,  0, ROOM_032
.room_29
	room_data  8,  1, $2, $0, $9, $7, CAM_FREE, OBJECT_GROUP_040, ANIMATED_TILES_GROUP_12,  0, ROOM_087

LevelRooms_c2f97:
	dw .room_00
	dw NULL
	dw NULL
	dw NULL
	dw .room_04
	dw .room_05
	dw .room_06
	dw NULL
	dw NULL
	dw .room_09
	dw .room_10
	dw .room_11
	dw NULL
	dw NULL
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw .room_18
	dw .room_19
	dw NULL
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  2,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_084
.room_04
	room_data  3,  2, $3, $2, $5, $3, CAM_TRANSITIONS, OBJECT_GROUP_070, ANIMATED_TILES_GROUP_03,  0, ROOM_085
.room_05
	room_data  1,  2, $3, $2, $2, $1, CAM_FREE, OBJECT_GROUP_121, ANIMATED_TILES_GROUP_12,  0, ROOM_085
.room_06
	room_data  8,  2, $3, $2, $9, $8, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_12,  0, ROOM_085
.room_09
	room_data  4,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_084
.room_10
	room_data  7,  2, $3, $2, $8, $5, CAM_TRANSITIONS, OBJECT_GROUP_071, ANIMATED_TILES_GROUP_03,  0, ROOM_086
.room_11
	room_data  6,  1, $2, $0, $7, $5, CAM_FREE, OBJECT_GROUP_057, ANIMATED_TILES_GROUP_12,  0, ROOM_085
.room_14
	room_data  9,  0, $2, $0, $a, $9, CAM_FREE, OBJECT_GROUP_121, ANIMATED_TILES_GROUP_12,  0, ROOM_086
.room_15
	room_data  2,  2, $3, $2, $3, $2, CAM_FREE, OBJECT_GROUP_145, ANIMATED_TILES_GROUP_12,  0, ROOM_085
.room_16
	room_data  1,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_084
.room_17
	room_data  9,  1, $2, $0, $a, $9, CAM_FREE, OBJECT_GROUP_121, ANIMATED_TILES_GROUP_12,  0, ROOM_086
.room_18
	room_data  9,  2, $3, $2, $a, $9, CAM_TRANSITIONS, OBJECT_GROUP_040, ANIMATED_TILES_GROUP_12,  0, ROOM_085
.room_19
	room_data  7,  1, $2, $0, $9, $7, CAM_FREE, OBJECT_GROUP_040, ANIMATED_TILES_GROUP_12,  0, ROOM_058
.room_21
	room_data  5,  0, $2, $0, $7, $5, CAM_FREE, OBJECT_GROUP_057, ANIMATED_TILES_GROUP_12,  0, ROOM_085
.room_22
	room_data  5,  1, $2, $0, $7, $5, CAM_FREE, OBJECT_GROUP_057, ANIMATED_TILES_GROUP_12,  0, ROOM_085
.room_23
	room_data  4,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_084
.room_24
	room_data  5,  2, $3, $2, $8, $5, CAM_TRANSITIONS, OBJECT_GROUP_071, ANIMATED_TILES_GROUP_03,  0, ROOM_086
.room_25
	room_data  4,  2, $3, $2, $5, $3, CAM_TRANSITIONS, OBJECT_GROUP_070, ANIMATED_TILES_GROUP_03,  0, ROOM_085
.room_26
	room_data  3,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_084
.room_27
	room_data  0,  2, $3, $1, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_111, ANIMATED_TILES_GROUP_20,  0, ROOM_084
.room_28
	room_data  6,  0, $2, $0, $7, $5, CAM_FREE, OBJECT_GROUP_057, ANIMATED_TILES_GROUP_12,  0, ROOM_085
.room_29
	room_data  8,  1, $2, $0, $9, $7, CAM_FREE, OBJECT_GROUP_040, ANIMATED_TILES_GROUP_12,  0, ROOM_058

LevelRooms_c3083:
	dw .room_00
	dw NULL
	dw NULL
	dw NULL
	dw .room_04
	dw .room_05
	dw .room_06
	dw NULL
	dw NULL
	dw .room_09
	dw .room_10
	dw .room_11
	dw NULL
	dw NULL
	dw .room_14
	dw .room_15
	dw .room_16
	dw .room_17
	dw .room_18
	dw .room_19
	dw NULL
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw .room_26
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  2,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_084
.room_04
	room_data  3,  2, $3, $2, $5, $3, CAM_TRANSITIONS, OBJECT_GROUP_070, ANIMATED_TILES_GROUP_03,  0, ROOM_085
.room_05
	room_data  1,  2, $3, $2, $2, $1, CAM_FREE, OBJECT_GROUP_121, ANIMATED_TILES_GROUP_12,  0, ROOM_085
.room_06
	room_data  8,  2, $3, $2, $9, $8, CAM_FREE, OBJECT_GROUP_029, ANIMATED_TILES_GROUP_12,  0, ROOM_085
.room_09
	room_data  4,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_084
.room_10
	room_data  7,  2, $3, $2, $8, $5, CAM_TRANSITIONS, OBJECT_GROUP_071, ANIMATED_TILES_GROUP_03,  0, ROOM_086
.room_11
	room_data  6,  1, $2, $0, $7, $5, CAM_FREE, OBJECT_GROUP_057, ANIMATED_TILES_GROUP_12,  0, ROOM_085
.room_14
	room_data  9,  0, $2, $0, $a, $9, CAM_FREE, OBJECT_GROUP_121, ANIMATED_TILES_GROUP_12,  0, ROOM_086
.room_15
	room_data  2,  2, $3, $2, $3, $2, CAM_FREE, OBJECT_GROUP_145, ANIMATED_TILES_GROUP_12,  0, ROOM_085
.room_16
	room_data  1,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_084
.room_17
	room_data  9,  1, $2, $0, $a, $9, CAM_FREE, OBJECT_GROUP_121, ANIMATED_TILES_GROUP_12,  0, ROOM_086
.room_18
	room_data  9,  2, $3, $2, $a, $9, CAM_TRANSITIONS, OBJECT_GROUP_040, ANIMATED_TILES_GROUP_12,  0, ROOM_085
.room_19
	room_data  7,  1, $2, $0, $9, $7, CAM_FREE, OBJECT_GROUP_040, ANIMATED_TILES_GROUP_12,  0, ROOM_087
.room_21
	room_data  5,  0, $2, $0, $7, $5, CAM_FREE, OBJECT_GROUP_057, ANIMATED_TILES_GROUP_12,  0, ROOM_085
.room_22
	room_data  5,  1, $2, $0, $7, $5, CAM_FREE, OBJECT_GROUP_057, ANIMATED_TILES_GROUP_12,  0, ROOM_085
.room_23
	room_data  4,  0, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_084
.room_24
	room_data  5,  2, $3, $2, $8, $5, CAM_TRANSITIONS, OBJECT_GROUP_071, ANIMATED_TILES_GROUP_03,  0, ROOM_086
.room_25
	room_data  4,  2, $3, $2, $5, $3, CAM_TRANSITIONS, OBJECT_GROUP_070, ANIMATED_TILES_GROUP_03,  0, ROOM_085
.room_26
	room_data  3,  1, $2, $0, $5, $1, CAM_FREE, OBJECT_GROUP_068, ANIMATED_TILES_GROUP_03,  0, ROOM_084
.room_27
	room_data  0,  2, $3, $1, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_111, ANIMATED_TILES_GROUP_20,  0, ROOM_084
.room_28
	room_data  6,  0, $2, $0, $7, $5, CAM_FREE, OBJECT_GROUP_057, ANIMATED_TILES_GROUP_12,  0, ROOM_085
.room_29
	room_data  8,  1, $2, $0, $9, $7, CAM_FREE, OBJECT_GROUP_040, ANIMATED_TILES_GROUP_12,  0, ROOM_087

LevelRooms_c316f:
	dw .room_00
	dw NULL
	dw .room_02
	dw .room_03
	dw .room_04
	dw .room_05
	dw .room_06
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw NULL
	dw .room_12
	dw NULL
	dw .room_14
	dw NULL
	dw NULL
	dw .room_17
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw .room_26
	dw .room_27
	dw NULL
	dw NULL

.room_00
	room_data  8,  0, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_08,  0, ROOM_034
.room_02
	room_data  2,  0, $1, $0, $4, $1, CAM_FREE, OBJECT_GROUP_016, ANIMATED_TILES_GROUP_08,  0, ROOM_034
.room_03
	room_data  7,  0, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_08,  0, ROOM_034
.room_04
	room_data  4,  2, $3, $2, $5, $4, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_05
	room_data  5,  2, $3, $2, $6, $5, CAM_FREE, OBJECT_GROUP_022, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_06
	room_data  6,  2, $3, $2, $7, $6, CAM_FREE, OBJECT_GROUP_142, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_07
	room_data  3,  0, $1, $0, $4, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_045, ANIMATED_TILES_GROUP_08,  0, ROOM_034
.room_09
	room_data  2,  1, $2, $1, $4, $2, CAM_TRANSITIONS, OBJECT_GROUP_101, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_10
	room_data  7,  1, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_08,  0, ROOM_034
.room_12
	room_data  9,  0, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_08,  0, ROOM_034
.room_14
	room_data  8,  1, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_08,  0, ROOM_034
.room_17
	room_data  0,  1, $3, $1, $2, $0, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_030, ANIMATED_TILES_GROUP_08,  0, ROOM_034
.room_18
	room_data  4,  1, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_19
	room_data  7,  2, $3, $2, $a, $7, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_133, ANIMATED_TILES_GROUP_08,  0, ROOM_055
.room_20
	room_data  2,  2, $3, $2, $4, $2, CAM_FREE, OBJECT_GROUP_047, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_21
	room_data  3,  2, $3, $2, $4, $2, CAM_FREE, OBJECT_GROUP_047, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_22
	room_data  0,  2, $3, $1, $2, $0, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_030, ANIMATED_TILES_GROUP_08,  0, ROOM_034
.room_23
	room_data  1,  2, $3, $1, $2, $0, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_030, ANIMATED_TILES_GROUP_08,  0, ROOM_034
.room_24
	room_data  4,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_25
	room_data  5,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_26
	room_data  6,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_27
	room_data  9,  1, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_08,  0, ROOM_034

LevelRooms_c325b:
	dw .room_00
	dw NULL
	dw .room_02
	dw .room_03
	dw .room_04
	dw .room_05
	dw .room_06
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw NULL
	dw .room_12
	dw NULL
	dw .room_14
	dw NULL
	dw NULL
	dw .room_17
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw .room_26
	dw .room_27
	dw NULL
	dw NULL

.room_00
	room_data  8,  0, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_123
.room_02
	room_data  2,  0, $1, $0, $4, $1, CAM_FREE, OBJECT_GROUP_016, ANIMATED_TILES_GROUP_08,  0, ROOM_123
.room_03
	room_data  7,  0, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_123
.room_04
	room_data  4,  2, $3, $2, $5, $4, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_05
	room_data  5,  2, $3, $2, $6, $5, CAM_FREE, OBJECT_GROUP_022, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_06
	room_data  6,  2, $3, $2, $7, $6, CAM_FREE, OBJECT_GROUP_142, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_07
	room_data  3,  0, $1, $0, $4, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_045, ANIMATED_TILES_GROUP_08,  0, ROOM_123
.room_09
	room_data  2,  1, $2, $1, $4, $2, CAM_TRANSITIONS, OBJECT_GROUP_101, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_10
	room_data  7,  1, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_123
.room_12
	room_data  9,  0, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_123
.room_14
	room_data  8,  1, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_123
.room_17
	room_data  0,  1, $3, $1, $2, $0, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_030, ANIMATED_TILES_GROUP_08,  0, ROOM_123
.room_18
	room_data  4,  1, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_19
	room_data  7,  2, $3, $2, $a, $7, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_133, ANIMATED_TILES_GROUP_08,  0, ROOM_055
.room_20
	room_data  2,  2, $3, $2, $4, $2, CAM_FREE, OBJECT_GROUP_047, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_21
	room_data  3,  2, $3, $2, $4, $2, CAM_FREE, OBJECT_GROUP_047, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_22
	room_data  0,  2, $3, $1, $2, $0, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_030, ANIMATED_TILES_GROUP_08,  0, ROOM_123
.room_23
	room_data  1,  2, $3, $1, $2, $0, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_030, ANIMATED_TILES_GROUP_08,  0, ROOM_123
.room_24
	room_data  4,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_25
	room_data  5,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_26
	room_data  6,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_27
	room_data  9,  1, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_123

LevelRooms_c3347:
	dw .room_00
	dw NULL
	dw .room_02
	dw .room_03
	dw .room_04
	dw .room_05
	dw .room_06
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw NULL
	dw .room_12
	dw NULL
	dw .room_14
	dw NULL
	dw NULL
	dw .room_17
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw .room_26
	dw .room_27
	dw NULL
	dw NULL

.room_00
	room_data  8,  0, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_124
.room_02
	room_data  2,  0, $1, $0, $4, $1, CAM_FREE, OBJECT_GROUP_016, ANIMATED_TILES_GROUP_08,  0, ROOM_124
.room_03
	room_data  7,  0, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_124
.room_04
	room_data  4,  2, $3, $2, $5, $4, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_05
	room_data  5,  2, $3, $2, $6, $5, CAM_FREE, OBJECT_GROUP_022, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_06
	room_data  6,  2, $3, $2, $7, $6, CAM_FREE, OBJECT_GROUP_142, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_07
	room_data  3,  0, $1, $0, $4, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_045, ANIMATED_TILES_GROUP_08,  0, ROOM_124
.room_09
	room_data  2,  1, $2, $1, $4, $2, CAM_TRANSITIONS, OBJECT_GROUP_101, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_10
	room_data  7,  1, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_124
.room_12
	room_data  9,  0, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_124
.room_14
	room_data  8,  1, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_124
.room_17
	room_data  0,  1, $3, $1, $2, $0, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_030, ANIMATED_TILES_GROUP_08,  0, ROOM_124
.room_18
	room_data  4,  1, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_19
	room_data  7,  2, $3, $2, $a, $7, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_133, ANIMATED_TILES_GROUP_08,  0, ROOM_055
.room_20
	room_data  2,  2, $3, $2, $4, $2, CAM_FREE, OBJECT_GROUP_047, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_21
	room_data  3,  2, $3, $2, $4, $2, CAM_FREE, OBJECT_GROUP_047, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_22
	room_data  0,  2, $3, $1, $2, $0, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_030, ANIMATED_TILES_GROUP_08,  0, ROOM_124
.room_23
	room_data  1,  2, $3, $1, $2, $0, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_030, ANIMATED_TILES_GROUP_08,  0, ROOM_124
.room_24
	room_data  4,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_25
	room_data  5,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_26
	room_data  6,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_27
	room_data  9,  1, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_124

LevelRooms_c3433:
	dw .room_00
	dw NULL
	dw .room_02
	dw .room_03
	dw .room_04
	dw .room_05
	dw .room_06
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw NULL
	dw .room_12
	dw NULL
	dw .room_14
	dw NULL
	dw NULL
	dw .room_17
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw .room_26
	dw .room_27
	dw NULL
	dw NULL

.room_00
	room_data  8,  0, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_08,  0, ROOM_125
.room_02
	room_data  2,  0, $1, $0, $4, $1, CAM_FREE, OBJECT_GROUP_016, ANIMATED_TILES_GROUP_08,  0, ROOM_125
.room_03
	room_data  7,  0, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_08,  0, ROOM_125
.room_04
	room_data  4,  2, $3, $2, $5, $4, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_05
	room_data  5,  2, $3, $2, $6, $5, CAM_FREE, OBJECT_GROUP_022, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_06
	room_data  6,  2, $3, $2, $7, $6, CAM_FREE, OBJECT_GROUP_142, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_07
	room_data  3,  0, $1, $0, $4, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_045, ANIMATED_TILES_GROUP_08,  0, ROOM_125
.room_09
	room_data  2,  1, $2, $1, $4, $2, CAM_TRANSITIONS, OBJECT_GROUP_101, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_10
	room_data  7,  1, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_08,  0, ROOM_125
.room_12
	room_data  9,  0, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_08,  0, ROOM_125
.room_14
	room_data  8,  1, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_08,  0, ROOM_125
.room_17
	room_data  0,  1, $3, $1, $2, $0, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_030, ANIMATED_TILES_GROUP_08,  0, ROOM_125
.room_18
	room_data  4,  1, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_19
	room_data  7,  2, $3, $2, $a, $7, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_133, ANIMATED_TILES_GROUP_08,  0, ROOM_055
.room_20
	room_data  2,  2, $3, $2, $4, $2, CAM_FREE, OBJECT_GROUP_047, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_21
	room_data  3,  2, $3, $2, $4, $2, CAM_FREE, OBJECT_GROUP_047, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_22
	room_data  0,  2, $3, $1, $2, $0, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_030, ANIMATED_TILES_GROUP_08,  0, ROOM_125
.room_23
	room_data  1,  2, $3, $1, $2, $0, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_030, ANIMATED_TILES_GROUP_08,  0, ROOM_125
.room_24
	room_data  4,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_25
	room_data  5,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_26
	room_data  6,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_27
	room_data  9,  1, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_089, ANIMATED_TILES_GROUP_08,  0, ROOM_125

LevelRooms_c351f:
	dw .room_00
	dw NULL
	dw .room_02
	dw .room_03
	dw .room_04
	dw .room_05
	dw .room_06
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw NULL
	dw .room_12
	dw NULL
	dw .room_14
	dw NULL
	dw NULL
	dw .room_17
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw .room_26
	dw .room_27
	dw NULL
	dw NULL

.room_00
	room_data  8,  0, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_126
.room_02
	room_data  2,  0, $1, $0, $4, $1, CAM_FREE, OBJECT_GROUP_016, ANIMATED_TILES_GROUP_08,  0, ROOM_126
.room_03
	room_data  7,  0, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_126
.room_04
	room_data  4,  2, $3, $2, $5, $4, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_05
	room_data  5,  2, $3, $2, $6, $5, CAM_FREE, OBJECT_GROUP_022, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_06
	room_data  6,  2, $3, $2, $7, $6, CAM_FREE, OBJECT_GROUP_142, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_07
	room_data  3,  0, $1, $0, $4, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_045, ANIMATED_TILES_GROUP_08,  0, ROOM_126
.room_09
	room_data  2,  1, $2, $1, $4, $2, CAM_TRANSITIONS, OBJECT_GROUP_101, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_10
	room_data  7,  1, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_126
.room_12
	room_data  9,  0, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_126
.room_14
	room_data  8,  1, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_126
.room_17
	room_data  0,  1, $3, $1, $2, $0, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_030, ANIMATED_TILES_GROUP_08,  0, ROOM_126
.room_18
	room_data  4,  1, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_19
	room_data  7,  2, $3, $2, $a, $7, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_133, ANIMATED_TILES_GROUP_08,  0, ROOM_055
.room_20
	room_data  2,  2, $3, $2, $4, $2, CAM_FREE, OBJECT_GROUP_047, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_21
	room_data  3,  2, $3, $2, $4, $2, CAM_FREE, OBJECT_GROUP_047, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_22
	room_data  0,  2, $3, $1, $2, $0, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_030, ANIMATED_TILES_GROUP_08,  0, ROOM_126
.room_23
	room_data  1,  2, $3, $1, $2, $0, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_030, ANIMATED_TILES_GROUP_08,  0, ROOM_126
.room_24
	room_data  4,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_25
	room_data  5,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_26
	room_data  6,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_27
	room_data  9,  1, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_126

LevelRooms_c360b:
	dw .room_00
	dw NULL
	dw .room_02
	dw .room_03
	dw .room_04
	dw .room_05
	dw .room_06
	dw .room_07
	dw NULL
	dw .room_09
	dw .room_10
	dw NULL
	dw .room_12
	dw NULL
	dw .room_14
	dw NULL
	dw NULL
	dw .room_17
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw .room_22
	dw .room_23
	dw .room_24
	dw .room_25
	dw .room_26
	dw .room_27
	dw NULL
	dw NULL

.room_00
	room_data  8,  0, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_127
.room_02
	room_data  2,  0, $1, $0, $4, $1, CAM_FREE, OBJECT_GROUP_016, ANIMATED_TILES_GROUP_08,  0, ROOM_127
.room_03
	room_data  7,  0, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_127
.room_04
	room_data  4,  2, $3, $2, $5, $4, CAM_TRANSITIONS, OBJECT_GROUP_007, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_05
	room_data  5,  2, $3, $2, $6, $5, CAM_FREE, OBJECT_GROUP_022, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_06
	room_data  6,  2, $3, $2, $7, $6, CAM_FREE, OBJECT_GROUP_142, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_07
	room_data  3,  0, $1, $0, $4, $1, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_045, ANIMATED_TILES_GROUP_08,  0, ROOM_127
.room_09
	room_data  2,  1, $2, $1, $4, $2, CAM_TRANSITIONS, OBJECT_GROUP_101, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_10
	room_data  7,  1, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_127
.room_12
	room_data  9,  0, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_127
.room_14
	room_data  8,  1, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_127
.room_17
	room_data  0,  1, $3, $1, $2, $0, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_030, ANIMATED_TILES_GROUP_08,  0, ROOM_127
.room_18
	room_data  4,  1, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_19
	room_data  7,  2, $3, $2, $a, $7, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_133, ANIMATED_TILES_GROUP_08,  0, ROOM_055
.room_20
	room_data  2,  2, $3, $2, $4, $2, CAM_FREE, OBJECT_GROUP_047, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_21
	room_data  3,  2, $3, $2, $4, $2, CAM_FREE, OBJECT_GROUP_047, ANIMATED_TILES_GROUP_11,  0, ROOM_054
.room_22
	room_data  0,  2, $3, $1, $2, $0, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_030, ANIMATED_TILES_GROUP_08,  0, ROOM_127
.room_23
	room_data  1,  2, $3, $1, $2, $0, CAM_FREE | CAM_BORDER_UP, OBJECT_GROUP_030, ANIMATED_TILES_GROUP_08,  0, ROOM_127
.room_24
	room_data  4,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_25
	room_data  5,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_26
	room_data  6,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_033, ANIMATED_TILES_GROUP_18,  0, ROOM_054
.room_27
	room_data  9,  1, $2, $0, $a, $7, CAM_FREE | CAM_BORDER_RIGHT | CAM_BORDER_LEFT | CAM_BORDER_DOWN, OBJECT_GROUP_090, ANIMATED_TILES_GROUP_08,  0, ROOM_127

LevelRooms_c36f7:
	dw .room_00
	dw .room_01
	dw NULL
	dw NULL
	dw .room_04
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_13
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_20
	dw .room_21
	dw .room_22
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  3,  0, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_101, ANIMATED_TILES_GROUP_10,  0, ROOM_047
.room_01
	room_data  4,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_026, ANIMATED_TILES_GROUP_10,  0, ROOM_048
.room_04
	room_data  1,  0, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_101, ANIMATED_TILES_GROUP_10,  0, ROOM_047
.room_13
	room_data  8,  2, $3, $0, $a, $8, CAM_FREE, OBJECT_GROUP_098, ANIMATED_TILES_GROUP_12,  0, ROOM_048
.room_20
	room_data  1,  2, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_101, ANIMATED_TILES_GROUP_10,  0, ROOM_047
.room_21
	room_data  0,  2, $3, $1, $1, $0, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_10,  0, ROOM_048
.room_22
	room_data  7,  2, $3, $2, $8, $4, CAM_TRANSITIONS, OBJECT_GROUP_027, ANIMATED_TILES_GROUP_10,  0, ROOM_048
.room_27
	room_data  2,  2, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_101, ANIMATED_TILES_GROUP_10,  0, ROOM_047
.room_28
	room_data  3,  1, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_101, ANIMATED_TILES_GROUP_10,  0, ROOM_047
.room_29
	room_data  9,  2, $3, $0, $a, $8, CAM_FREE, OBJECT_GROUP_098, ANIMATED_TILES_GROUP_12,  0, ROOM_048

LevelRooms_c3783:
	dw .room_00
	dw .room_01
	dw NULL
	dw NULL
	dw .room_04
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_13
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_20
	dw .room_21
	dw .room_22
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  3,  0, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_047
.room_01
	room_data  4,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_026, ANIMATED_TILES_GROUP_10,  0, ROOM_048
.room_04
	room_data  1,  0, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_047
.room_13
	room_data  8,  2, $3, $0, $a, $8, CAM_FREE, OBJECT_GROUP_098, ANIMATED_TILES_GROUP_12,  0, ROOM_048
.room_20
	room_data  1,  2, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_047
.room_21
	room_data  0,  2, $3, $1, $1, $0, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_10,  0, ROOM_048
.room_22
	room_data  7,  2, $3, $2, $8, $4, CAM_TRANSITIONS, OBJECT_GROUP_027, ANIMATED_TILES_GROUP_10,  0, ROOM_048
.room_27
	room_data  2,  2, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_047
.room_28
	room_data  3,  1, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_047
.room_29
	room_data  9,  2, $3, $0, $a, $8, CAM_FREE, OBJECT_GROUP_098, ANIMATED_TILES_GROUP_12,  0, ROOM_048

LevelRooms_c380f:
	dw .room_00
	dw .room_01
	dw NULL
	dw NULL
	dw .room_04
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_13
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_20
	dw .room_21
	dw .room_22
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  3,  0, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_142
.room_01
	room_data  4,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_026, ANIMATED_TILES_GROUP_10,  0, ROOM_048
.room_04
	room_data  1,  0, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_142
.room_13
	room_data  8,  2, $3, $0, $a, $8, CAM_FREE, OBJECT_GROUP_098, ANIMATED_TILES_GROUP_12,  0, ROOM_048
.room_20
	room_data  1,  2, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_142
.room_21
	room_data  0,  2, $3, $1, $1, $0, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_10,  0, ROOM_048
.room_22
	room_data  7,  2, $3, $2, $8, $4, CAM_TRANSITIONS, OBJECT_GROUP_027, ANIMATED_TILES_GROUP_10,  0, ROOM_048
.room_27
	room_data  2,  2, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_142
.room_28
	room_data  3,  1, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_142
.room_29
	room_data  9,  2, $3, $0, $a, $8, CAM_FREE, OBJECT_GROUP_098, ANIMATED_TILES_GROUP_12,  0, ROOM_048

LevelRooms_c389b:
	dw .room_00
	dw .room_01
	dw NULL
	dw NULL
	dw .room_04
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_13
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_20
	dw .room_21
	dw .room_22
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  3,  0, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_101, ANIMATED_TILES_GROUP_10,  0, ROOM_143
.room_01
	room_data  4,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_026, ANIMATED_TILES_GROUP_10,  0, ROOM_048
.room_04
	room_data  1,  0, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_101, ANIMATED_TILES_GROUP_10,  0, ROOM_143
.room_13
	room_data  8,  2, $3, $0, $a, $8, CAM_FREE, OBJECT_GROUP_098, ANIMATED_TILES_GROUP_12,  0, ROOM_048
.room_20
	room_data  1,  2, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_101, ANIMATED_TILES_GROUP_10,  0, ROOM_143
.room_21
	room_data  0,  2, $3, $1, $1, $0, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_10,  0, ROOM_048
.room_22
	room_data  7,  2, $3, $2, $8, $4, CAM_TRANSITIONS, OBJECT_GROUP_027, ANIMATED_TILES_GROUP_10,  0, ROOM_048
.room_27
	room_data  2,  2, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_101, ANIMATED_TILES_GROUP_10,  0, ROOM_143
.room_28
	room_data  3,  1, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_101, ANIMATED_TILES_GROUP_10,  0, ROOM_143
.room_29
	room_data  9,  2, $3, $0, $a, $8, CAM_FREE, OBJECT_GROUP_098, ANIMATED_TILES_GROUP_12,  0, ROOM_048

LevelRooms_c3927:
	dw .room_00
	dw .room_01
	dw NULL
	dw NULL
	dw .room_04
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_13
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_20
	dw .room_21
	dw .room_22
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  3,  0, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_143
.room_01
	room_data  4,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_026, ANIMATED_TILES_GROUP_10,  0, ROOM_048
.room_04
	room_data  1,  0, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_143
.room_13
	room_data  8,  2, $3, $0, $a, $8, CAM_FREE, OBJECT_GROUP_098, ANIMATED_TILES_GROUP_12,  0, ROOM_048
.room_20
	room_data  1,  2, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_143
.room_21
	room_data  0,  2, $3, $1, $1, $0, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_10,  0, ROOM_048
.room_22
	room_data  7,  2, $3, $2, $8, $4, CAM_TRANSITIONS, OBJECT_GROUP_027, ANIMATED_TILES_GROUP_10,  0, ROOM_048
.room_27
	room_data  2,  2, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_143
.room_28
	room_data  3,  1, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_143
.room_29
	room_data  9,  2, $3, $0, $a, $8, CAM_FREE, OBJECT_GROUP_098, ANIMATED_TILES_GROUP_12,  0, ROOM_048

LevelRooms_c39b3:
	dw .room_00
	dw .room_01
	dw NULL
	dw NULL
	dw .room_04
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_13
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_20
	dw .room_21
	dw .room_22
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  3,  0, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_144
.room_01
	room_data  4,  0, $2, $0, $7, $4, CAM_FREE, OBJECT_GROUP_026, ANIMATED_TILES_GROUP_10,  0, ROOM_048
.room_04
	room_data  1,  0, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_144
.room_13
	room_data  8,  2, $3, $0, $a, $8, CAM_FREE, OBJECT_GROUP_098, ANIMATED_TILES_GROUP_12,  0, ROOM_048
.room_20
	room_data  1,  2, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_144
.room_21
	room_data  0,  2, $3, $1, $1, $0, CAM_FREE | CAM_BORDER_RIGHT, OBJECT_GROUP_002, ANIMATED_TILES_GROUP_10,  0, ROOM_048
.room_22
	room_data  7,  2, $3, $2, $8, $4, CAM_TRANSITIONS, OBJECT_GROUP_027, ANIMATED_TILES_GROUP_10,  0, ROOM_048
.room_27
	room_data  2,  2, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_144
.room_28
	room_data  3,  1, $3, $0, $4, $1, CAM_FREE, OBJECT_GROUP_136, ANIMATED_TILES_GROUP_10,  0, ROOM_144
.room_29
	room_data  9,  2, $3, $0, $a, $8, CAM_FREE, OBJECT_GROUP_098, ANIMATED_TILES_GROUP_12,  0, ROOM_048

LevelRooms_c3a3f:
	dw .room_00
	dw .room_01
	dw .room_02
	dw NULL
	dw .room_04
	dw .room_05
	dw .room_06
	dw NULL
	dw .room_08
	dw .room_09
	dw NULL
	dw NULL
	dw NULL
	dw .room_13
	dw .room_14
	dw .room_15
	dw .room_16
	dw NULL
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw NULL
	dw .room_23
	dw .room_24
	dw .room_25
	dw NULL
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  1,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_112, ANIMATED_TILES_GROUP_03,  0, ROOM_035
.room_01
	room_data  9,  0, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_080, ANIMATED_TILES_GROUP_03,  0, ROOM_010
.room_02
	room_data  9,  1, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_080, ANIMATED_TILES_GROUP_03,  0, ROOM_010
.room_04
	room_data  6,  0, $2, $0, $8, $6, CAM_TRANSITIONS, OBJECT_GROUP_049, ANIMATED_TILES_GROUP_03,  0, ROOM_035
.room_05
	room_data  3,  2, $3, $2, $5, $3, CAM_FREE, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_06
	room_data  4,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_112, ANIMATED_TILES_GROUP_03,  0, ROOM_035
.room_08
	room_data  5,  2, $3, $2, $6, $5, CAM_FREE, OBJECT_GROUP_100, ANIMATED_TILES_GROUP_03,  0, ROOM_073
.room_09
	room_data  1,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_072, ANIMATED_TILES_GROUP_03,  0, ROOM_035
.room_13
	room_data  6,  1, $2, $0, $8, $6, CAM_TRANSITIONS, OBJECT_GROUP_049, ANIMATED_TILES_GROUP_03,  0, ROOM_035
.room_14
	room_data  1,  2, $3, $2, $3, $1, CAM_TRANSITIONS, OBJECT_GROUP_019, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_15
	room_data  8,  1, $3, $0, $9, $8, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_099, ANIMATED_TILES_GROUP_03,  0, ROOM_073
.room_16
	room_data  3,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_112, ANIMATED_TILES_GROUP_03,  0, ROOM_035
.room_18
	room_data  5,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_112, ANIMATED_TILES_GROUP_03,  0, ROOM_035
.room_19
	room_data  2,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_112, ANIMATED_TILES_GROUP_03,  0, ROOM_035
.room_20
	room_data  9,  2, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_080, ANIMATED_TILES_GROUP_03,  0, ROOM_010
.room_21
	room_data  4,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_112, ANIMATED_TILES_GROUP_03,  0, ROOM_035
.room_23
	room_data  5,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_112, ANIMATED_TILES_GROUP_03,  0, ROOM_035
.room_24
	room_data  4,  2, $3, $2, $5, $3, CAM_FREE, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_25
	room_data  8,  0, $3, $0, $9, $8, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_099, ANIMATED_TILES_GROUP_03,  0, ROOM_073
.room_27
	room_data  8,  2, $3, $0, $9, $8, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_099, ANIMATED_TILES_GROUP_03,  0, ROOM_073
.room_28
	room_data  7,  2, $3, $2, $8, $6, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_092, ANIMATED_TILES_GROUP_03,  0, ROOM_073
.room_29
	room_data  0,  2, $3, $2, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_19,  0, ROOM_019

LevelRooms_c3b2b:
	dw .room_00
	dw .room_01
	dw .room_02
	dw NULL
	dw .room_04
	dw .room_05
	dw .room_06
	dw NULL
	dw .room_08
	dw .room_09
	dw NULL
	dw NULL
	dw NULL
	dw .room_13
	dw .room_14
	dw .room_15
	dw .room_16
	dw NULL
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw NULL
	dw .room_23
	dw .room_24
	dw .room_25
	dw NULL
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  1,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_112, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_01
	room_data  9,  0, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_080, ANIMATED_TILES_GROUP_03,  0, ROOM_010
.room_02
	room_data  9,  1, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_080, ANIMATED_TILES_GROUP_03,  0, ROOM_010
.room_04
	room_data  6,  0, $2, $0, $8, $6, CAM_TRANSITIONS, OBJECT_GROUP_049, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_05
	room_data  3,  2, $3, $2, $5, $3, CAM_FREE, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_06
	room_data  4,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_112, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_08
	room_data  5,  2, $3, $2, $6, $5, CAM_FREE, OBJECT_GROUP_100, ANIMATED_TILES_GROUP_03,  0, ROOM_073
.room_09
	room_data  1,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_072, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_13
	room_data  6,  1, $2, $0, $8, $6, CAM_TRANSITIONS, OBJECT_GROUP_049, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_14
	room_data  1,  2, $3, $2, $3, $1, CAM_TRANSITIONS, OBJECT_GROUP_019, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_15
	room_data  8,  1, $3, $0, $9, $8, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_099, ANIMATED_TILES_GROUP_03,  0, ROOM_073
.room_16
	room_data  3,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_112, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_18
	room_data  5,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_112, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_19
	room_data  2,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_112, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_20
	room_data  9,  2, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_080, ANIMATED_TILES_GROUP_03,  0, ROOM_010
.room_21
	room_data  4,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_112, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_23
	room_data  5,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_112, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_24
	room_data  4,  2, $3, $2, $5, $3, CAM_FREE, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_25
	room_data  8,  0, $3, $0, $9, $8, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_099, ANIMATED_TILES_GROUP_03,  0, ROOM_073
.room_27
	room_data  8,  2, $3, $0, $9, $8, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_099, ANIMATED_TILES_GROUP_03,  0, ROOM_073
.room_28
	room_data  7,  2, $3, $2, $8, $6, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_092, ANIMATED_TILES_GROUP_03,  0, ROOM_073
.room_29
	room_data  0,  2, $3, $2, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_19,  0, ROOM_019

LevelRooms_c3c17:
	dw .room_00
	dw .room_01
	dw .room_02
	dw NULL
	dw .room_04
	dw .room_05
	dw .room_06
	dw NULL
	dw .room_08
	dw .room_09
	dw NULL
	dw NULL
	dw NULL
	dw .room_13
	dw .room_14
	dw .room_15
	dw .room_16
	dw NULL
	dw .room_18
	dw .room_19
	dw .room_20
	dw .room_21
	dw NULL
	dw .room_23
	dw .room_24
	dw .room_25
	dw NULL
	dw .room_27
	dw .room_28
	dw .room_29

.room_00
	room_data  1,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_072, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_01
	room_data  9,  0, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_080, ANIMATED_TILES_GROUP_03,  0, ROOM_010
.room_02
	room_data  9,  1, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_080, ANIMATED_TILES_GROUP_03,  0, ROOM_010
.room_04
	room_data  6,  0, $2, $0, $8, $6, CAM_TRANSITIONS, OBJECT_GROUP_049, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_05
	room_data  3,  2, $3, $2, $5, $3, CAM_FREE, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_06
	room_data  4,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_072, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_08
	room_data  5,  2, $3, $2, $6, $5, CAM_FREE, OBJECT_GROUP_100, ANIMATED_TILES_GROUP_03,  0, ROOM_073
.room_09
	room_data  1,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_072, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_13
	room_data  6,  1, $2, $0, $8, $6, CAM_TRANSITIONS, OBJECT_GROUP_049, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_14
	room_data  1,  2, $3, $2, $3, $1, CAM_TRANSITIONS, OBJECT_GROUP_019, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_15
	room_data  8,  1, $3, $0, $9, $8, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_099, ANIMATED_TILES_GROUP_03,  0, ROOM_073
.room_16
	room_data  3,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_072, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_18
	room_data  5,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_072, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_19
	room_data  2,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_072, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_20
	room_data  9,  2, $3, $0, $a, $9, CAM_FREE, OBJECT_GROUP_080, ANIMATED_TILES_GROUP_03,  0, ROOM_010
.room_21
	room_data  4,  1, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_072, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_23
	room_data  5,  0, $2, $0, $6, $1, CAM_TRANSITIONS, OBJECT_GROUP_072, ANIMATED_TILES_GROUP_03,  0, ROOM_088
.room_24
	room_data  4,  2, $3, $2, $5, $3, CAM_FREE, OBJECT_GROUP_014, ANIMATED_TILES_GROUP_19,  0, ROOM_019
.room_25
	room_data  8,  0, $3, $0, $9, $8, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_099, ANIMATED_TILES_GROUP_03,  0, ROOM_073
.room_27
	room_data  8,  2, $3, $0, $9, $8, CAM_FREE | CAM_BORDER_LEFT, OBJECT_GROUP_099, ANIMATED_TILES_GROUP_03,  0, ROOM_073
.room_28
	room_data  7,  2, $3, $2, $8, $6, CAM_TRANSITIONS | CAM_BORDER_RIGHT, OBJECT_GROUP_092, ANIMATED_TILES_GROUP_03,  0, ROOM_073
.room_29
	room_data  0,  2, $3, $2, $1, $0, CAM_TRANSITIONS, OBJECT_GROUP_001, ANIMATED_TILES_GROUP_19,  0, ROOM_019
