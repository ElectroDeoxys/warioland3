; loads a room's permission map, tilemap
; foreground and background tiles and its palettes
LoadRoom:: ; c0000 (30:4000)
	ld d, $00
	ld a, [wCurRoom]
	add a
	ld e, a
	rl d
	ld hl, PointerTable_c04c5
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	cp $ff
	jr nz, .ok
	jp Init

.ok
	ld a, [hli]
	ld [wRoomPermissionMap], a
	ld a, [hli]
	ld [wRoomTileMap], a
	ld a, [hli]
	ld [wRoomMainTiles], a
	ld a, [hli]
	ld [wRoomSpecialTiles], a
	ld a, [hl]
	ld [wRoomPalettes], a

; divide wRoomPermissionMap by 6
	ld b, 0
	ld a, [wRoomPermissionMap]
.loop
	sub $6
	jr c, .div_done
	inc b
	jr .loop
.div_done
	ld a, $38
	add b
	ld [wc0cf], a
	call Func_298d
	call LoadPermissionMap
	ld a, [wc0cf]
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

	ld a, BANK("Palettes")
	ld [wPaletteBank], a
	call LoadRoomPalettes
	ret
; 0xc0078

InitRoomAnimatedTiles:: ; c0078 (30:4078)
	ld hl, Data_c0ce5
	ld d, $00
	ld a, [wc1ab]
	add a ; *2
	ld e, a
	rl d
	add hl, de
	ld a, [hli]
	ld [wAnimatedTilesFrameDuration], a
	ld a, [hl]
	ld [wAnimatedTilesGroup], a
	xor a
	ld [wAnimatedTilesFrame], a
	ld [wAnimatedTilesFrameCount], a
	ret
; 0xc0095

InitRoomAnimatedPals:: ; c0095 (30:4095)
	ld hl, RoomAnimatedPals
	ld d, $00
	ld a, [wc1b0]
	add a ; *2
	ld e, a
	rl d
	add hl, de
	ld a, [hli]
	ld [wRoomAnimatedPals + 1], a
	ld a, [hld]
	ld [wRoomAnimatedPals + 0], a
	ld l, [hl]
	ld h, a
	ld de, $8
	add hl, de
	ld a, [hl]
	ld [wc1b1], a
	srl a
	ld [wc1b5], a
	xor a
	ld [wCurRoomAnimatedPal], a
	ret
; 0xc00be

LevelHeaders:: ; c00be (30:40be)
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
	dab OutOfTheWoodsLayout
	dw OutOfTheWoodsObjectsMap
.the_peaceful_village_1
	dab ThePeacefulVillage1Layout
	dw ThePeacefulVillage1ObjectsMap
.the_vast_plain_1
	dab TheVastPlain1Layout
	dw TheVastPlain1ObjectsMap
.bank_of_the_wild_river
	dab BankOfTheWildRiverLayout
	dw BankOfTheWildRiverObjectsMap
.the_tidal_coast_1
	dab TheTidalCoast1Layout
	dw TheTidalCoast1ObjectsMap
.sea_turtle_rocks
	dab SeaTurtleRocksLayout
	dw SeaTurtleRocksObjectsMap
.desert_ruins
	dab DesertRuinsLayout
	dw DesertRuinsObjectsMap
.the_volcanos_base_1
	dab TheVolcanosBase1Layout
	dw TheVolcanosBase1ObjectsMap
.the_pool_of_rain_1
	dab ThePoolOfRain1Layout
	dw ThePoolOfRain1ObjectsMap
.a_town_in_chaos
	dab ATownInChaosLayout
	dw ATownInChaosObjectsMap
.beneath_the_waves
	dab BeneathTheWavesLayout
	dw BeneathTheWavesObjectsMap
.the_west_crater
	dab TheWestCraterLayout
	dw TheWestCraterObjectsMap
.the_grasslands
	dab TheGrasslandsLayout
	dw TheGrasslandsObjectsMap
.the_big_bridge
	dab TheBigBridgeLayout
	dw TheBigBridgeObjectsMap
.tower_of_revival
	dab TowerOfRevivalLayout
	dw TowerOfRevivalObjectsMap
.the_steep_canyon_1
	dab TheSteepCanyon1Layout
	dw TheSteepCanyon1ObjectsMap
.cave_of_flames
	dab CaveOfFlamesLayout
	dw CaveOfFlamesObjectsMap
.above_the_clouds_1
	dab AboveTheClouds1Layout
	dw AboveTheClouds1ObjectsMap
.the_stagnant_swamp_1
	dab TheStagnantSwamp1Layout
	dw TheStagnantSwamp1ObjectsMap
.the_frigid_sea
	dab TheFrigidSeaLayout
	dw TheFrigidSeaObjectsMap
.castle_of_illusions
	dab CastleOfIllusionsLayout
	dw CastleOfIllusionsObjectsMap
.the_colossal_hole_1
	dab TheColossalHole1Layout
	dw TheColossalHole1ObjectsMap
.the_warped_void
	dab TheWarpedVoidLayout
	dw TheWarpedVoidObjectsMap
.the_east_crater
	dab TheEastCraterLayout
	dw TheEastCraterObjectsMap
.forest_of_fear
	dab ForestOfFearLayout
	dw ForestOfFearObjectsMap
.the_temple
	dab HiddenFigureRoomLayout
	dw HiddenFigureRoomObjectsMap
.the_vast_plain_2
	dab TheVastPlain2Layout
	dw TheVastPlain2ObjectsMap
.the_volcanos_base_2
	dab TheVolcanosBase2Layout
	dw TheVolcanosBase2ObjectsMap
.the_pool_of_rain_2
	dab ThePoolOfRain2Layout
	dw ThePoolOfRain2ObjectsMap
.the_colossal_hole_2
	dab TheColossalHole2Layout
	dw TheColossalHole2ObjectsMap
.the_tidal_coast_2
	dab TheTidalCoast2Layout
	dw TheTidalCoast2ObjectsMap
.the_stagnant_swamp_2
	dab TheStagnantSwamp2Layout
	dw TheStagnantSwamp2ObjectsMap
.above_the_clouds_2
	dab AboveTheClouds2Layout
	dw AboveTheClouds2ObjectsMap
.the_steep_canyon_2
	dab TheSteepCanyon2Layout
	dw TheSteepCanyon2ObjectsMap
.the_peaceful_village_2
	dab ThePeacefulVillage2Layout
	dw ThePeacefulVillage2ObjectsMap
; 0xc0319

PointerTable_c0319:: ; c0319 (30:4319)
	dw Data_c0d1f ; OUT_OF_THE_WOODS_DAY_1
	dw Data_c0d1f ; OUT_OF_THE_WOODS_DAY_2
	dw Data_c0e03 ; OUT_OF_THE_WOODS_DAY_3
	dw Data_c0ee7 ; OUT_OF_THE_WOODS_DAY_4
	dw Data_c0fcb ; OUT_OF_THE_WOODS_NIGHT_1
	dw Data_c0fcb ; OUT_OF_THE_WOODS_NIGHT_2
	dw Data_c10af ; OUT_OF_THE_WOODS_NIGHT_3
	dw Data_c1193 ; OUT_OF_THE_WOODS_NIGHT_4
	dw Data_c1277 ; THE_PEACEFUL_VILLAGE_DAY_1
	dw Data_c135b ; THE_PEACEFUL_VILLAGE_DAY_2
	dw Data_c135b ; THE_PEACEFUL_VILLAGE_DAY_3
	dw Data_c135b ; THE_PEACEFUL_VILLAGE_DAY_4
	dw Data_c143f ; THE_PEACEFUL_VILLAGE_NIGHT_1
	dw Data_c1523 ; THE_PEACEFUL_VILLAGE_NIGHT_2
	dw Data_c1523 ; THE_PEACEFUL_VILLAGE_NIGHT_3
	dw Data_c1523 ; THE_PEACEFUL_VILLAGE_NIGHT_4
	dw Data_c1607 ; THE_VAST_PLAIN_DAY_1
	dw Data_c1607 ; THE_VAST_PLAIN_DAY_2
	dw Data_c1607 ; THE_VAST_PLAIN_DAY_3
	dw Data_c16c3 ; THE_VAST_PLAIN_DAY_4
	dw Data_c177f ; THE_VAST_PLAIN_NIGHT_1
	dw Data_c177f ; THE_VAST_PLAIN_NIGHT_2
	dw Data_c177f ; THE_VAST_PLAIN_NIGHT_3
	dw Data_c183b ; THE_VAST_PLAIN_NIGHT_4
	dw Data_c18f7 ; BANK_OF_THE_WILD_RIVER_DAY_1
	dw Data_c18f7 ; BANK_OF_THE_WILD_RIVER_DAY_2
	dw Data_c18f7 ; BANK_OF_THE_WILD_RIVER_DAY_3
	dw Data_c19d3 ; BANK_OF_THE_WILD_RIVER_DAY_4
	dw Data_c1aaf ; BANK_OF_THE_WILD_RIVER_NIGHT_1
	dw Data_c1aaf ; BANK_OF_THE_WILD_RIVER_NIGHT_2
	dw Data_c1aaf ; BANK_OF_THE_WILD_RIVER_NIGHT_3
	dw Data_c1b8b ; BANK_OF_THE_WILD_RIVER_NIGHT_4
	dw Data_c1c67 ; THE_TIDAL_COAST_DAY_1
	dw Data_c1c67 ; THE_TIDAL_COAST_DAY_2
	dw Data_c1d2b ; THE_TIDAL_COAST_DAY_3
	dw Data_c1def ; THE_TIDAL_COAST_DAY_4
	dw Data_c1eb3 ; THE_TIDAL_COAST_NIGHT_1
	dw Data_c1eb3 ; THE_TIDAL_COAST_NIGHT_2
	dw Data_c1f77 ; THE_TIDAL_COAST_NIGHT_3
	dw Data_c203b ; THE_TIDAL_COAST_NIGHT_4
	dw Data_c20ff ; SEA_TURTLE_ROCKS_DAY_1
	dw Data_c21c3 ; SEA_TURTLE_ROCKS_DAY_2
	dw Data_c21c3 ; SEA_TURTLE_ROCKS_DAY_3
	dw Data_c2287 ; SEA_TURTLE_ROCKS_DAY_4
	dw Data_c234b ; SEA_TURTLE_ROCKS_NIGHT_1
	dw Data_c240f ; SEA_TURTLE_ROCKS_NIGHT_2
	dw Data_c240f ; SEA_TURTLE_ROCKS_NIGHT_3
	dw Data_c24d3 ; SEA_TURTLE_ROCKS_NIGHT_4
	dw Data_c2597 ; DESERT_RUINS_DAY_1
	dw Data_c2597 ; DESERT_RUINS_DAY_2
	dw Data_c2597 ; DESERT_RUINS_DAY_3
	dw Data_c2597 ; DESERT_RUINS_DAY_4
	dw Data_c267b ; DESERT_RUINS_NIGHT_1
	dw Data_c267b ; DESERT_RUINS_NIGHT_2
	dw Data_c267b ; DESERT_RUINS_NIGHT_3
	dw Data_c267b ; DESERT_RUINS_NIGHT_4
	dw Data_c275f ; THE_VOLCANOS_BASE_DAY_1
	dw Data_c275f ; THE_VOLCANOS_BASE_DAY_2
	dw Data_c283b ; THE_VOLCANOS_BASE_DAY_3
	dw Data_c283b ; THE_VOLCANOS_BASE_DAY_4
	dw Data_c2917 ; THE_VOLCANOS_BASE_NIGHT_1
	dw Data_c2917 ; THE_VOLCANOS_BASE_NIGHT_2
	dw Data_c29f3 ; THE_VOLCANOS_BASE_NIGHT_3
	dw Data_c29f3 ; THE_VOLCANOS_BASE_NIGHT_4
	dw Data_c2acf ; THE_POOL_OF_RAIN_DAY_1
	dw Data_c2acf ; THE_POOL_OF_RAIN_DAY_2
	dw Data_c2acf ; THE_POOL_OF_RAIN_DAY_3
	dw Data_c2b8b ; THE_POOL_OF_RAIN_DAY_4
	dw Data_c2c47 ; THE_POOL_OF_RAIN_NIGHT_1
	dw Data_c2c47 ; THE_POOL_OF_RAIN_NIGHT_2
	dw Data_c2c47 ; THE_POOL_OF_RAIN_NIGHT_3
	dw Data_c2d03 ; THE_POOL_OF_RAIN_NIGHT_4
	dw Data_c2dbf ; A_TOWN_IN_CHAOS_DAY_1
	dw Data_c2dbf ; A_TOWN_IN_CHAOS_DAY_2
	dw Data_c2dbf ; A_TOWN_IN_CHAOS_DAY_3
	dw Data_c2eab ; A_TOWN_IN_CHAOS_DAY_4
	dw Data_c2f97 ; A_TOWN_IN_CHAOS_NIGHT_1
	dw Data_c2f97 ; A_TOWN_IN_CHAOS_NIGHT_2
	dw Data_c2f97 ; A_TOWN_IN_CHAOS_NIGHT_3
	dw Data_c3083 ; A_TOWN_IN_CHAOS_NIGHT_4
	dw Data_c316f ; BENEATH_THE_WAVES_DAY_1
	dw Data_c316f ; BENEATH_THE_WAVES_DAY_2
	dw Data_c325b ; BENEATH_THE_WAVES_DAY_3
	dw Data_c3347 ; BENEATH_THE_WAVES_DAY_4
	dw Data_c3433 ; BENEATH_THE_WAVES_NIGHT_1
	dw Data_c3433 ; BENEATH_THE_WAVES_NIGHT_2
	dw Data_c351f ; BENEATH_THE_WAVES_NIGHT_3
	dw Data_c360b ; BENEATH_THE_WAVES_NIGHT_4
	dw Data_c36f7 ; THE_WEST_CRATER_DAY_1
	dw Data_c36f7 ; THE_WEST_CRATER_DAY_2
	dw Data_c3783 ; THE_WEST_CRATER_DAY_3
	dw Data_c380f ; THE_WEST_CRATER_DAY_4
	dw Data_c389b ; THE_WEST_CRATER_NIGHT_1
	dw Data_c389b ; THE_WEST_CRATER_NIGHT_2
	dw Data_c3927 ; THE_WEST_CRATER_NIGHT_3
	dw Data_c39b3 ; THE_WEST_CRATER_NIGHT_4
	dw Data_c3a3f ; THE_GRASSLANDS_DAY_1
	dw Data_c3b2b ; THE_GRASSLANDS_DAY_2
	dw Data_c3c17 ; THE_GRASSLANDS_DAY_3
	dw Data_c3c17 ; THE_GRASSLANDS_DAY_4
	dw Data_c4000 ; THE_GRASSLANDS_NIGHT_1
	dw Data_c40ec ; THE_GRASSLANDS_NIGHT_2
	dw Data_c41d8 ; THE_GRASSLANDS_NIGHT_3
	dw Data_c41d8 ; THE_GRASSLANDS_NIGHT_4
	dw Data_c42c4 ; THE_BIG_BRIDGE_DAY_1
	dw Data_c42c4 ; THE_BIG_BRIDGE_DAY_2
	dw Data_c42c4 ; THE_BIG_BRIDGE_DAY_3
	dw Data_c4360 ; THE_BIG_BRIDGE_DAY_4
	dw Data_c43fc ; THE_BIG_BRIDGE_NIGHT_1
	dw Data_c43fc ; THE_BIG_BRIDGE_NIGHT_2
	dw Data_c43fc ; THE_BIG_BRIDGE_NIGHT_3
	dw Data_c4498 ; THE_BIG_BRIDGE_NIGHT_4
	dw Data_c4534 ; TOWER_OF_REVIVAL_DAY_1
	dw Data_c45e8 ; TOWER_OF_REVIVAL_DAY_2
	dw Data_c469c ; TOWER_OF_REVIVAL_DAY_3
	dw Data_c4750 ; TOWER_OF_REVIVAL_DAY_4
	dw Data_c4804 ; TOWER_OF_REVIVAL_NIGHT_1
	dw Data_c48b8 ; TOWER_OF_REVIVAL_NIGHT_2
	dw Data_c496c ; TOWER_OF_REVIVAL_NIGHT_3
	dw Data_c4a20 ; TOWER_OF_REVIVAL_NIGHT_4
	dw Data_c4ad4 ; THE_STEEP_CANYON_DAY_1
	dw Data_c4ad4 ; THE_STEEP_CANYON_DAY_2
	dw Data_c4ad4 ; THE_STEEP_CANYON_DAY_3
	dw Data_c4b80 ; THE_STEEP_CANYON_DAY_4
	dw Data_c4c2c ; THE_STEEP_CANYON_NIGHT_1
	dw Data_c4c2c ; THE_STEEP_CANYON_NIGHT_2
	dw Data_c4c2c ; THE_STEEP_CANYON_NIGHT_3
	dw Data_c4cd8 ; THE_STEEP_CANYON_NIGHT_4
	dw Data_c4d84 ; CAVE_OF_FLAMES_DAY_1
	dw Data_c4d84 ; CAVE_OF_FLAMES_DAY_2
	dw Data_c4e58 ; CAVE_OF_FLAMES_DAY_3
	dw Data_c4f2c ; CAVE_OF_FLAMES_DAY_4
	dw Data_c4d84 ; CAVE_OF_FLAMES_NIGHT_1
	dw Data_c4d84 ; CAVE_OF_FLAMES_NIGHT_2
	dw Data_c4e58 ; CAVE_OF_FLAMES_NIGHT_3
	dw Data_c4f2c ; CAVE_OF_FLAMES_NIGHT_4
	dw Data_c5000 ; ABOVE_THE_CLOUDS_DAY_1
	dw Data_c5000 ; ABOVE_THE_CLOUDS_DAY_2
	dw Data_c50c4 ; ABOVE_THE_CLOUDS_DAY_3
	dw Data_c50c4 ; ABOVE_THE_CLOUDS_DAY_4
	dw Data_c5188 ; ABOVE_THE_CLOUDS_NIGHT_1
	dw Data_c5188 ; ABOVE_THE_CLOUDS_NIGHT_2
	dw Data_c524c ; ABOVE_THE_CLOUDS_NIGHT_3
	dw Data_c524c ; ABOVE_THE_CLOUDS_NIGHT_4
	dw Data_c5310 ; THE_STAGNANT_SWAMP_DAY_1
	dw Data_c5310 ; THE_STAGNANT_SWAMP_DAY_2
	dw Data_c5310 ; THE_STAGNANT_SWAMP_DAY_3
	dw Data_c53c4 ; THE_STAGNANT_SWAMP_DAY_4
	dw Data_c5478 ; THE_STAGNANT_SWAMP_NIGHT_1
	dw Data_c5478 ; THE_STAGNANT_SWAMP_NIGHT_2
	dw Data_c5478 ; THE_STAGNANT_SWAMP_NIGHT_3
	dw Data_c552c ; THE_STAGNANT_SWAMP_NIGHT_4
	dw Data_c55e0 ; THE_FRIGID_SEA_DAY_1
	dw Data_c55e0 ; THE_FRIGID_SEA_DAY_2
	dw Data_c56ac ; THE_FRIGID_SEA_DAY_3
	dw Data_c56ac ; THE_FRIGID_SEA_DAY_4
	dw Data_c5778 ; THE_FRIGID_SEA_NIGHT_1
	dw Data_c5778 ; THE_FRIGID_SEA_NIGHT_2
	dw Data_c5844 ; THE_FRIGID_SEA_NIGHT_3
	dw Data_c5844 ; THE_FRIGID_SEA_NIGHT_4
	dw Data_c5910 ; CASTLE_OF_ILLUSIONS_DAY_1
	dw Data_c5910 ; CASTLE_OF_ILLUSIONS_DAY_2
	dw Data_c5910 ; CASTLE_OF_ILLUSIONS_DAY_3
	dw Data_c59f4 ; CASTLE_OF_ILLUSIONS_DAY_4
	dw Data_c5ad8 ; CASTLE_OF_ILLUSIONS_NIGHT_1
	dw Data_c5ad8 ; CASTLE_OF_ILLUSIONS_NIGHT_2
	dw Data_c5ad8 ; CASTLE_OF_ILLUSIONS_NIGHT_3
	dw Data_c5bbc ; CASTLE_OF_ILLUSIONS_NIGHT_4
	dw Data_c5ca0 ; THE_COLOSSAL_HOLE_DAY_1
	dw Data_c5ca0 ; THE_COLOSSAL_HOLE_DAY_2
	dw Data_c5ca0 ; THE_COLOSSAL_HOLE_DAY_3
	dw Data_c5d5c ; THE_COLOSSAL_HOLE_DAY_4
	dw Data_c5e18 ; THE_COLOSSAL_HOLE_NIGHT_1
	dw Data_c5e18 ; THE_COLOSSAL_HOLE_NIGHT_2
	dw Data_c5e18 ; THE_COLOSSAL_HOLE_NIGHT_3
	dw Data_c5ed4 ; THE_COLOSSAL_HOLE_NIGHT_4
	dw Data_c5f90 ; THE_WARPED_VOID_DAY_1
	dw Data_c605c ; THE_WARPED_VOID_DAY_2
	dw Data_c605c ; THE_WARPED_VOID_DAY_3
	dw Data_c6128 ; THE_WARPED_VOID_DAY_4
	dw Data_c5f90 ; THE_WARPED_VOID_NIGHT_1
	dw Data_c605c ; THE_WARPED_VOID_NIGHT_2
	dw Data_c605c ; THE_WARPED_VOID_NIGHT_3
	dw Data_c6128 ; THE_WARPED_VOID_NIGHT_4
	dw Data_c61f4 ; THE_EAST_CRATER_DAY_1
	dw Data_c6298 ; THE_EAST_CRATER_DAY_2
	dw Data_c633c ; THE_EAST_CRATER_DAY_3
	dw Data_c63e0 ; THE_EAST_CRATER_DAY_4
	dw Data_c6484 ; THE_EAST_CRATER_NIGHT_1
	dw Data_c6528 ; THE_EAST_CRATER_NIGHT_2
	dw Data_c65cc ; THE_EAST_CRATER_NIGHT_3
	dw Data_c6670 ; THE_EAST_CRATER_NIGHT_4
	dw Data_c6714 ; FOREST_OF_FEAR_DAY_1
	dw Data_c6714 ; FOREST_OF_FEAR_DAY_2
	dw Data_c67a8 ; FOREST_OF_FEAR_DAY_3
	dw Data_c683c ; FOREST_OF_FEAR_DAY_4
	dw Data_c68d0 ; FOREST_OF_FEAR_NIGHT_1
	dw Data_c68d0 ; FOREST_OF_FEAR_NIGHT_2
	dw Data_c6964 ; FOREST_OF_FEAR_NIGHT_3
	dw Data_c69f8 ; FOREST_OF_FEAR_NIGHT_4
	dw Data_c6a8c ; THE_TEMPLE
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
; 0xc04c5

room: MACRO
	db \1, \1 ; permission and tile maps coincide
	db \2
	db \3
	db \4
ENDM

PointerTable_c04c5: ; c04c5 (30:44c5)
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
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL

.room_001
	room TILE_MAP_00, $00, $00, $00
.room_002
	room TILE_MAP_00, $00, $00, $01
.room_003
	room TILE_MAP_01, $00, $00, $00
.room_004
	room TILE_MAP_01, $00, $00, $01
.room_005
	room TILE_MAP_02, $01, $01, $02
.room_006
	room TILE_MAP_03, $02, $02, $04
.room_007
	room TILE_MAP_03, $02, $02, $05
.room_008
	room TILE_MAP_04, $02, $02, $04
.room_009
	room TILE_MAP_04, $02, $02, $05
.room_010
	room TILE_MAP_05, $03, $03, $06
.room_011
	room TILE_MAP_05, $03, $03, $07
.room_012
	room TILE_MAP_06, $04, $03, $08
.room_013
	room TILE_MAP_10, $04, $03, $0d
.room_014
	room TILE_MAP_09, $26, $03, $09
.room_015
	room TILE_MAP_07, $05, $03, $0b
.room_016
	room TILE_MAP_08, $06, $03, $0c
.room_017
	room TILE_MAP_09, $26, $03, $0a
.room_018
	room TILE_MAP_59, $07, $03, $0e
.room_019
	room TILE_MAP_12, $08, $03, $0f
.room_020
	room TILE_MAP_13, $09, $01, $10
.room_021
	room TILE_MAP_66, $0a, $01, $11
.room_022
	room TILE_MAP_61, $0b, $01, $12
.room_023
	room TILE_MAP_16, $0c, $04, $13
.room_024
	room TILE_MAP_17, $0c, $04, $14
.room_025
	room TILE_MAP_18, $0d, $01, $15
.room_026
	room TILE_MAP_09, $26, $03, $16
.room_027
	room TILE_MAP_19, $0e, $01, $17
.room_028
	room TILE_MAP_19, $0e, $01, $18
.room_029
	room TILE_MAP_52, $0f, $05, $19
.room_030
	room TILE_MAP_50, $0f, $05, $1a
.room_031
	room TILE_MAP_21, $10, $08, $1b
.room_032
	room TILE_MAP_22, $11, $01, $1c
.room_033
	room TILE_MAP_22, $11, $01, $1d
.room_034
	room TILE_MAP_23, $12, $01, $1e
.room_035
	room TILE_MAP_54, $13, $01, $1f
.room_036
	room TILE_MAP_55, $14, $01, $4a
.room_037
	room TILE_MAP_26, $15, $01, $21
.room_038
	room TILE_MAP_56, $16, $01, $22
.room_039
	room TILE_MAP_28, $17, $01, $23
.room_040
	room TILE_MAP_29, $18, $01, $24
.room_041
	room TILE_MAP_30, $19, $07, $25
.room_042
	room TILE_MAP_31, $0c, $04, $26
.room_043
	room TILE_MAP_63, $1a, $01, $27
.room_044
	room TILE_MAP_33, $1b, $01, $28
.room_045
	room TILE_MAP_34, $1c, $01, $29
.room_046
	room TILE_MAP_68, $19, $07, $2a
.room_047
	room TILE_MAP_36, $1d, $01, $2b
.room_048
	room TILE_MAP_81, $1d, $01, $2c
.room_049
	room TILE_MAP_27, $16, $01, $2d
.room_050
	room TILE_MAP_15, $0b, $01, $2e
.room_051
	room TILE_MAP_37, $1e, $01, $2f
.room_052
	room TILE_MAP_38, $1f, $01, $30
.room_053
	room TILE_MAP_39, $20, $01, $31
.room_054
	room TILE_MAP_40, $21, $01, $32
.room_055
	room TILE_MAP_23, $12, $01, $33
.room_056
	room TILE_MAP_41, $22, $01, $34
.room_057
	room TILE_MAP_42, $23, $01, $35
.room_058
	room TILE_MAP_53, $24, $01, $36
.room_059
	room TILE_MAP_44, $25, $01, $37
.room_060
	room TILE_MAP_08, $06, $03, $38
.room_061
	room TILE_MAP_08, $06, $03, $39
.room_062
	room TILE_MAP_45, $0c, $04, $3a
.room_063
	room TILE_MAP_21, $10, $08, $3b
.room_064
	room TILE_MAP_22, $11, $01, $3c
.room_065
	room TILE_MAP_22, $11, $01, $3d
.room_066
	room TILE_MAP_62, $0b, $01, $51
.room_067
	room TILE_MAP_46, $06, $03, $0c
.room_068
	room TILE_MAP_46, $06, $03, $38
.room_069
	room TILE_MAP_36, $1d, $01, $3f
.room_070
	room TILE_MAP_36, $1d, $01, $40
.room_071
	room TILE_MAP_51, $16, $01, $41
.room_072
	room TILE_MAP_47, $1a, $06, $27
.room_073
	room TILE_MAP_24, $13, $01, $42
.room_074
	room TILE_MAP_48, $06, $03, $0c
.room_075
	room TILE_MAP_88, $06, $03, $38
.room_076
	room TILE_MAP_49, $19, $07, $43
.room_077
	room TILE_MAP_37, $1e, $01, $44
.room_078
	room TILE_MAP_37, $1e, $01, $45
.room_079
	room TILE_MAP_37, $1e, $01, $46
.room_080
	room TILE_MAP_85, $0e, $01, $47
.room_081
	room TILE_MAP_52, $0f, $05, $48
.room_082
	room TILE_MAP_20, $0f, $05, $19
.room_083
	room TILE_MAP_20, $0f, $05, $48
.room_084
	room TILE_MAP_21, $10, $08, $3b
.room_085
	room TILE_MAP_22, $11, $01, $3c
.room_086
	room TILE_MAP_22, $11, $01, $3d
.room_087
	room TILE_MAP_43, $24, $01, $36
.room_088
	room TILE_MAP_24, $13, $01, $1f
.room_089
	room TILE_MAP_54, $13, $01, $49
.room_090
	room TILE_MAP_24, $13, $01, $49
.room_091
	room TILE_MAP_25, $14, $01, $20
.room_092
	room TILE_MAP_55, $14, $01, $4b
.room_093
	room TILE_MAP_25, $14, $01, $4c
.room_094
	room TILE_MAP_27, $16, $01, $22
.room_095
	room TILE_MAP_57, $16, $01, $41
.room_096
	room TILE_MAP_58, $16, $01, $41
.room_097
	room TILE_MAP_56, $16, $01, $4d
.room_098
	room TILE_MAP_27, $16, $01, $4d
.room_099
	room TILE_MAP_51, $16, $01, $4e
.room_100
	room TILE_MAP_57, $16, $01, $4e
.room_101
	room TILE_MAP_58, $16, $01, $4e
.room_102
	room TILE_MAP_11, $07, $03, $0e
.room_103
	room TILE_MAP_59, $07, $03, $4f
.room_104
	room TILE_MAP_11, $07, $03, $4f
.room_105
	room TILE_MAP_60, $0b, $01, $2e
.room_106
	room TILE_MAP_15, $0b, $01, $12
.room_107
	room TILE_MAP_15, $0b, $01, $3e
.room_108
	room TILE_MAP_61, $0b, $01, $50
.room_109
	room TILE_MAP_15, $0b, $01, $50
.room_110
	room TILE_MAP_32, $1a, $01, $27
.room_111
	room TILE_MAP_64, $1a, $01, $52
.room_112
	room TILE_MAP_65, $1a, $01, $52
.room_113
	room TILE_MAP_67, $0a, $01, $11
.room_114
	room TILE_MAP_14, $0a, $01, $11
.room_115
	room TILE_MAP_13, $09, $01, $53
.room_116
	room TILE_MAP_30, $19, $07, $54
.room_117
	room TILE_MAP_35, $19, $07, $2a
.room_118
	room TILE_MAP_69, $18, $01, $5a
.room_119
	room TILE_MAP_70, $27, $01, $5d
.room_120
	room TILE_MAP_39, $20, $01, $5e
.room_121
	room TILE_MAP_71, $20, $01, $31
.room_122
	room TILE_MAP_72, $20, $01, $31
.room_123
	room TILE_MAP_73, $12, $01, $1e
.room_124
	room TILE_MAP_74, $12, $01, $1e
.room_125
	room TILE_MAP_23, $12, $01, $61
.room_126
	room TILE_MAP_73, $12, $01, $61
.room_127
	room TILE_MAP_74, $12, $01, $61
.room_128
	room TILE_MAP_75, $1c, $01, $29
.room_129
	room TILE_MAP_34, $1c, $01, $62
.room_130
	room TILE_MAP_75, $1c, $01, $62
.room_131
	room TILE_MAP_76, $1b, $01, $28
.room_132
	room TILE_MAP_77, $1b, $01, $63
.room_133
	room TILE_MAP_78, $1b, $01, $63
.room_134
	room TILE_MAP_42, $23, $01, $64
.room_135
	room TILE_MAP_79, $18, $01, $24
.room_136
	room TILE_MAP_86, $18, $01, $65
.room_137
	room TILE_MAP_87, $18, $01, $65
.room_138
	room TILE_MAP_69, $18, $01, $68
.room_139
	room TILE_MAP_80, $1f, $01, $30
.room_140
	room TILE_MAP_38, $1f, $01, $6b
.room_141
	room TILE_MAP_80, $1f, $01, $6b
.room_142
	room TILE_MAP_81, $1d, $01, $6c
.room_143
	room TILE_MAP_36, $1d, $01, $6d
.room_144
	room TILE_MAP_81, $1d, $01, $6e
.room_145
	room TILE_MAP_81, $1d, $01, $3f
.room_146
	room TILE_MAP_36, $1d, $01, $6f
.room_147
	room TILE_MAP_81, $1d, $01, $6f
.room_148
	room TILE_MAP_81, $1d, $01, $40
.room_149
	room TILE_MAP_82, $1e, $01, $2f
.room_150
	room TILE_MAP_83, $1e, $01, $2f
.room_151
	room TILE_MAP_84, $17, $01, $70
.room_152
	room TILE_MAP_28, $17, $01, $71
.room_153
	room TILE_MAP_84, $17, $01, $72
.room_154
	room TILE_MAP_19, $0e, $01, $75

PointerTable_c090d:: ; c090d (30:490d)
	dw $6c0b ; TILE_MAP_00
	dw $6eef ; TILE_MAP_01
	dw $71cc ; TILE_MAP_02
	dw $74b4 ; TILE_MAP_03
	dw $7739 ; TILE_MAP_04
	dw $79be ; TILE_MAP_05
	dw $6cf7 ; TILE_MAP_06
	dw $6fe5 ; TILE_MAP_07
	dw $7281 ; TILE_MAP_08
	dw $758f ; TILE_MAP_09
	dw $7886 ; TILE_MAP_10
	dw $7b99 ; TILE_MAP_11
	dw $643f ; TILE_MAP_12
	dw $66d1 ; TILE_MAP_13
	dw $6973 ; TILE_MAP_14
	dw $6c1d ; TILE_MAP_15
	dw $6ecd ; TILE_MAP_16
	dw $71c3 ; TILE_MAP_17
	dw $6d97 ; TILE_MAP_18
	dw $7038 ; TILE_MAP_19
	dw $732c ; TILE_MAP_20
	dw $7664 ; TILE_MAP_21
	dw $7943 ; TILE_MAP_22
	dw $7be2 ; TILE_MAP_23
	dw $6ab7 ; TILE_MAP_24
	dw $6d75 ; TILE_MAP_25
	dw $706a ; TILE_MAP_26
	dw $730d ; TILE_MAP_27
	dw $75fa ; TILE_MAP_28
	dw $78d7 ; TILE_MAP_29
	dw $6759 ; TILE_MAP_30
	dw $6a29 ; TILE_MAP_31
	dw $6d24 ; TILE_MAP_32
	dw $700f ; TILE_MAP_33
	dw $72d5 ; TILE_MAP_34
	dw $7603 ; TILE_MAP_35
	dw $64fe ; TILE_MAP_36
	dw $67e2 ; TILE_MAP_37
	dw $6a74 ; TILE_MAP_38
	dw $6d9f ; TILE_MAP_39
	dw $7048 ; TILE_MAP_40
	dw $72f0 ; TILE_MAP_41
	dw $6b90 ; TILE_MAP_42
	dw $6e1d ; TILE_MAP_43
	dw $709f ; TILE_MAP_44
	dw $72e5 ; TILE_MAP_45
	dw $7598 ; TILE_MAP_46
	dw $78a4 ; TILE_MAP_47
	dw $6c8e ; TILE_MAP_48
	dw $6fb0 ; TILE_MAP_49
	dw $725c ; TILE_MAP_50
	dw $758e ; TILE_MAP_51
	dw $786d ; TILE_MAP_52
	dw $7b9c ; TILE_MAP_53
	dw $61f4 ; TILE_MAP_54
	dw $64ae ; TILE_MAP_55
	dw $67a3 ; TILE_MAP_56
	dw $6a79 ; TILE_MAP_57
	dw $6d5c ; TILE_MAP_58
	dw $703d ; TILE_MAP_59
	dw $6e4f ; TILE_MAP_60
	dw $70f8 ; TILE_MAP_61
	dw $73ac ; TILE_MAP_62
	dw $793d ; TILE_MAP_63
	dw $7c28 ; TILE_MAP_64
	dw $765c ; TILE_MAP_65
	dw $6436 ; TILE_MAP_66
	dw $66de ; TILE_MAP_67
	dw $6988 ; TILE_MAP_68
	dw $6c3b ; TILE_MAP_69
	dw $6f3b ; TILE_MAP_70
	dw $7192 ; TILE_MAP_71
	dw $55a5 ; TILE_MAP_72
	dw $584a ; TILE_MAP_73
	dw $5b7f ; TILE_MAP_74
	dw $5eb0 ; TILE_MAP_75
	dw $61dd ; TILE_MAP_76
	dw $64a3 ; TILE_MAP_77
	dw $699e ; TILE_MAP_78
	dw $6c52 ; TILE_MAP_79
	dw $6f8d ; TILE_MAP_80
	dw $72b2 ; TILE_MAP_81
	dw $7599 ; TILE_MAP_82
	dw $781c ; TILE_MAP_83
	dw $67c8 ; TILE_MAP_84
	dw $6aa5 ; TILE_MAP_85
	dw $6d9c ; TILE_MAP_86
	dw $70e2 ; TILE_MAP_87
	dw $7424 ; TILE_MAP_88
	dw NULL  ; TILE_MAP_89
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL

TileMapsPointers:: ; c09d1 (30:49d1)
	dw $6e0b ; TILE_MAP_00
	dw $70ef ; TILE_MAP_01
	dw $73cc ; TILE_MAP_02
	dw $76b4 ; TILE_MAP_03
	dw $7939 ; TILE_MAP_04
	dw $7bbe ; TILE_MAP_05
	dw $6ef7 ; TILE_MAP_06
	dw $71e5 ; TILE_MAP_07
	dw $7481 ; TILE_MAP_08
	dw $778f ; TILE_MAP_09
	dw $7a86 ; TILE_MAP_10
	dw $7d99 ; TILE_MAP_11
	dw $663f ; TILE_MAP_12
	dw $68d1 ; TILE_MAP_13
	dw $6b73 ; TILE_MAP_14
	dw $6e1d ; TILE_MAP_15
	dw $70cd ; TILE_MAP_16
	dw $73c3 ; TILE_MAP_17
	dw $6f97 ; TILE_MAP_18
	dw $7238 ; TILE_MAP_19
	dw $752c ; TILE_MAP_20
	dw $7864 ; TILE_MAP_21
	dw $7b43 ; TILE_MAP_22
	dw $7de2 ; TILE_MAP_23
	dw $6cb7 ; TILE_MAP_24
	dw $6f75 ; TILE_MAP_25
	dw $726a ; TILE_MAP_26
	dw $750d ; TILE_MAP_27
	dw $77fa ; TILE_MAP_28
	dw $7ad7 ; TILE_MAP_29
	dw $6959 ; TILE_MAP_30
	dw $6c29 ; TILE_MAP_31
	dw $6f24 ; TILE_MAP_32
	dw $720f ; TILE_MAP_33
	dw $74d5 ; TILE_MAP_34
	dw $7803 ; TILE_MAP_35
	dw $66fe ; TILE_MAP_36
	dw $69e2 ; TILE_MAP_37
	dw $6c74 ; TILE_MAP_38
	dw $6f9f ; TILE_MAP_39
	dw $7248 ; TILE_MAP_40
	dw $74f0 ; TILE_MAP_41
	dw $6d90 ; TILE_MAP_42
	dw $701d ; TILE_MAP_43
	dw $729f ; TILE_MAP_44
	dw $74e5 ; TILE_MAP_45
	dw $7798 ; TILE_MAP_46
	dw $7aa4 ; TILE_MAP_47
	dw $6e8e ; TILE_MAP_48
	dw $71b0 ; TILE_MAP_49
	dw $745c ; TILE_MAP_50
	dw $778e ; TILE_MAP_51
	dw $7a6d ; TILE_MAP_52
	dw $7d9c ; TILE_MAP_53
	dw $63f4 ; TILE_MAP_54
	dw $66ae ; TILE_MAP_55
	dw $69a3 ; TILE_MAP_56
	dw $6c79 ; TILE_MAP_57
	dw $6f5c ; TILE_MAP_58
	dw $723d ; TILE_MAP_59
	dw $704f ; TILE_MAP_60
	dw $72f8 ; TILE_MAP_61
	dw $75ac ; TILE_MAP_62
	dw $7b3d ; TILE_MAP_63
	dw $7e28 ; TILE_MAP_64
	dw $785c ; TILE_MAP_65
	dw $6636 ; TILE_MAP_66
	dw $68de ; TILE_MAP_67
	dw $6b88 ; TILE_MAP_68
	dw $6e3b ; TILE_MAP_69
	dw $713b ; TILE_MAP_70
	dw $7392 ; TILE_MAP_71
	dw $57a5 ; TILE_MAP_72
	dw $5a4a ; TILE_MAP_73
	dw $5d7f ; TILE_MAP_74
	dw $60b0 ; TILE_MAP_75
	dw $63dd ; TILE_MAP_76
	dw $66a3 ; TILE_MAP_77
	dw $6b9e ; TILE_MAP_78
	dw $6e52 ; TILE_MAP_79
	dw $718d ; TILE_MAP_80
	dw $74b2 ; TILE_MAP_81
	dw $7799 ; TILE_MAP_82
	dw $7a1c ; TILE_MAP_83
	dw $69c8 ; TILE_MAP_84
	dw $6ca5 ; TILE_MAP_85
	dw $6f9c ; TILE_MAP_86
	dw $72e2 ; TILE_MAP_87
	dw $7624 ; TILE_MAP_88
	dw NULL  ; TILE_MAP_89
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL

ForegroundTilesPointers:: ; c0a95 (30:4a95)
	dw ForegroundTiles0
	dw ForegroundTiles1
	dw ForegroundTiles2
	dw ForegroundTiles3
	dw ForegroundTiles4
	dw ForegroundTiles5
	dw ForegroundTiles6
	dw ForegroundTiles7
	dw ForegroundTiles8
	dw ForegroundTiles9
	dw ForegroundTiles10
	dw ForegroundTiles11
	dw ForegroundTiles12
	dw ForegroundTiles13
	dw ForegroundTiles14
	dw ForegroundTiles15
	dw ForegroundTiles16
	dw ForegroundTiles17
	dw ForegroundTiles18
	dw ForegroundTiles19
	dw ForegroundTiles20
	dw ForegroundTiles21
	dw ForegroundTiles22
	dw ForegroundTiles23
	dw ForegroundTiles24
	dw ForegroundTiles25
	dw ForegroundTiles26
	dw ForegroundTiles27
	dw ForegroundTiles28
	dw ForegroundTiles29
	dw ForegroundTiles30
	dw ForegroundTiles31
	dw ForegroundTiles32
	dw ForegroundTiles33
	dw ForegroundTiles34
	dw ForegroundTiles35
	dw ForegroundTiles36
	dw ForegroundTiles37
	dw ForegroundTiles38
	dw ForegroundTiles39
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL

BackgroundTilesPointers:: ; c0af7 (30:4af7)
	dw BackgroundTiles0
	dw BackgroundTiles1
	dw BackgroundTiles2
	dw BackgroundTiles3
	dw BackgroundTiles4
	dw BackgroundTiles5
	dw BackgroundTiles6
	dw BackgroundTiles7
	dw BackgroundTiles8
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL

LevelPals:: ; c0b1b (30:4b1b)
	dw Pals_cc000
	dw Pals_cc040
	dw Pals_cc080
	dw Pals_cc0c0
	dw Pals_cc100
	dw Pals_cc140
	dw Pals_cc180
	dw Pals_cc1c0
	dw Pals_cc200
	dw Pals_cc240
	dw Pals_cc280
	dw Pals_cc2c0
	dw Pals_cc300
	dw Pals_cc340
	dw Pals_cc380
	dw Pals_cc3c0
	dw Pals_cc400
	dw Pals_cc440
	dw Pals_cc480
	dw Pals_cc4c0
	dw Pals_cc500
	dw Pals_cc540
	dw Pals_cc580
	dw Pals_cc5c0
	dw Pals_cc600
	dw Pals_cc640
	dw Pals_cc680
	dw Pals_cc6c0
	dw Pals_cc700
	dw Pals_cc740
	dw Pals_cc780
	dw Pals_cc7c0
	dw Pals_cc800
	dw Pals_cc840
	dw Pals_cc880
	dw Pals_cc8c0
	dw Pals_cc900
	dw Pals_cc940
	dw Pals_cc980
	dw Pals_cc9c0
	dw Pals_cca00
	dw Pals_cca40
	dw Pals_cca80
	dw Pals_ccac0
	dw Pals_ccb00
	dw Pals_ccb40
	dw Pals_ccb80
	dw Pals_ccbc0
	dw Pals_ccc00
	dw Pals_ccc40
	dw Pals_ccc80
	dw Pals_cccc0
	dw Pals_ccd00
	dw Pals_ccd40
	dw Pals_ccd80
	dw Pals_ccdc0
	dw Pals_cce00
	dw Pals_cce40
	dw Pals_cce80
	dw Pals_ccec0
	dw Pals_ccf00
	dw Pals_ccf40
	dw Pals_ccf80
	dw Pals_ccfc0
	dw Pals_cd000
	dw Pals_cd040
	dw Pals_cd080
	dw Pals_cd0c0
	dw Pals_cd100
	dw Pals_cd140
	dw Pals_cd180
	dw Pals_cd1c0
	dw Pals_cd200
	dw Pals_cd240
	dw Pals_cd280
	dw Pals_cd2c0
	dw Pals_cd300
	dw Pals_cd340
	dw Pals_cd380
	dw Pals_cd3c0
	dw Pals_cd400
	dw Pals_cd440
	dw Pals_cd480
	dw Pals_cd4c0
	dw Pals_cd500
	dw Pals_cd540
	dw Pals_cd580
	dw Pals_cd5c0
	dw Pals_cd600
	dw Pals_cd640
	dw Pals_cd680
	dw Pals_cd6c0
	dw Pals_cd700
	dw Pals_cd740
	dw Pals_cd780
	dw Pals_cd7c0
	dw Pals_cd800
	dw Pals_cd840
	dw Pals_cd880
	dw Pals_cd8c0
	dw Pals_cd900
	dw Pals_cd940
	dw Pals_cd980
	dw Pals_cd9c0
	dw Pals_cda00
	dw Pals_cda40
	dw Pals_cda80
	dw Pals_cdac0
	dw Pals_cdb00
	dw Pals_cdb40
	dw Pals_cdb80
	dw Pals_cdbc0
	dw Pals_cdc00
	dw Pals_cdc40
	dw Pals_cdc80
	dw Pals_cdcc0
	dw Pals_cdd00
	dw Pals_cdd40
	dw Pals_cdd80
	dw Pals_cddc0
	dw Pals_cde00
	dw Pals_cde40
	dw Pals_cde80
	dw Pals_cdec0
	dw Pals_cdf00
	dw Pals_cdf40
	dw Pals_cdf80
	dw Pals_cdfc0
	dw Pals_ce000
	dw Pals_ce040
	dw Pals_ce080
	dw Pals_ce0c0
	dw Pals_ce100
	dw Pals_ce140
	dw Pals_ce180
	dw Pals_ce1c0
	dw Pals_ce200
	dw Pals_ce240
	dw Pals_ce280
	dw Pals_ce2c0
	dw Pals_ce300
	dw Pals_ce340
	dw Pals_ce380
	dw Pals_ce3c0
	dw Pals_ce400
	dw Pals_ce440
; 0xc0c3f

rept $12
	db $ff
endr

RoomAnimatedPals:: ; c0c51 (30:4c51)
	dw .data_c0c79
	dw .data_c0c82
	dw .data_c0c8b
	dw .data_c0c94
	dw .data_c0c9d
	dw .data_c0ca6
	dw .data_c0caf
	dw .data_c0cb8
	dw .data_c0cc1
	dw .data_c0cca
	dw .data_c0cd3
	dw .data_c0cdc
	dw .data_c0c79
	dw .data_c0c79
	dw .data_c0c79
	dw .data_c0c79
	dw .data_c0c79
	dw .data_c0c79
	dw .data_c0c79
	dw .data_c0c79

.data_c0c79
	db $00, $00, $00, $00, $00, $00, $00, $00, $00

.data_c0c82
	db $02, $02, $02, $03, $73, $74, $73, $03, $0b

.data_c0c8b
	db $31, $31, $55, $56, $57, $57, $56, $55, $0d

.data_c0c94
	db $24, $24, $24, $58, $59, $59, $59, $58, $16

.data_c0c9d
	db $5a, $5a, $5a, $5b, $5c, $5c, $5c, $5b, $16

.data_c0ca6
	db $57, $57, $5e, $5f, $60, $60, $5f, $5e, $0d

.data_c0caf
	db $65, $65, $65, $66, $67, $67, $67, $66, $16

.data_c0cb8
	db $68, $68, $68, $69, $6a, $6a, $6a, $69, $16

.data_c0cc1
	db $2f, $76, $77, $78, $79, $7a, $7b, $7c, $10

.data_c0cca
	db $44, $7d, $7e, $7f, $80, $81, $82, $83, $10

.data_c0cd3
	db $45, $84, $85, $86, $87, $88, $89, $8a, $10

.data_c0cdc
	db $46, $8b, $8c, $8d, $8e, $8f, $90, $91, $10

Data_c0ce5: ; c0ce5 (30:4ce5)
; frame duration, group
	db  0, $00
	db  2, $00
	db 11, $01
	db  6, $02
	db  5, $03
	db 11, $04
	db  6, $05
	db  6, $06
	db  9, $07
	db  6, $08
	db  6, $09
	db  6, $0a
	db  3, $0b
	db  2, $0c
	db 11, $0d
	db  8, $0e
	db  6, $0f
	db  6, $10
	db  6, $11
	db  5, $12
	db  9, $13
	db  0, $00
	db  0, $00
	db  0, $00
	db  0, $00
	db  0, $00
	db  0, $00
	db  0, $00
	db  0, $00

Data_c0d1f: ; c0d1f (30:4d1f)
	dw .data_c0d5b
	dw NULL
	dw .data_c0d63
	dw .data_c0d6b
	dw .data_c0d73
	dw .data_c0d7b
	dw .data_c0d83
	dw NULL
	dw NULL
	dw NULL
	dw .data_c0d8b
	dw .data_c0d93
	dw .data_c0d9b
	dw .data_c0da3
	dw .data_c0dab
	dw .data_c0db3
	dw .data_c0dbb
	dw .data_c0dc3
	dw .data_c0dcb
	dw .data_c0dd3
	dw NULL
	dw .data_c0ddb
	dw NULL
	dw .data_c0de3
	dw NULL
	dw NULL
	dw .data_c0deb
	dw .data_c0df3
	dw NULL
	dw .data_c0dfb

.data_c0d5b
	db $20, $23, $02, $18, $0a, $01, $00, $01

.data_c0d63
	db $16, $02, $67, $08, $07, $01, $00, $0a

.data_c0d6b
	db $19, $03, $7a, $38, $09, $01, $00, $01

.data_c0d73
	db $22, $03, $23, $08, $07, $01, $00, $0a

.data_c0d7b
	db $10, $12, $01, $21, $14, $01, $00, $01

.data_c0d83
	db $01, $01, $12, $18, $24, $01, $00, $0a

.data_c0d8b
	db $05, $01, $36, $28, $01, $01, $00, $01

.data_c0d93
	db $06, $02, $67, $08, $07, $01, $00, $0a

.data_c0d9b
	db $04, $01, $36, $28, $01, $01, $00, $01

.data_c0da3
	db $27, $03, $7a, $38, $09, $01, $00, $01

.data_c0dab
	db $14, $12, $36, $08, $02, $02, $01, $05

.data_c0db3
	db $29, $03, $7a, $38, $09, $01, $00, $01

.data_c0dbb
	db $02, $03, $23, $08, $07, $01, $00, $0a

.data_c0dc3
	db $21, $23, $02, $18, $0a, $01, $00, $01

.data_c0dcb
	db $23, $23, $37, $01, $03, $03, $00, $06

.data_c0dd3
	db $03, $01, $36, $28, $01, $01, $00, $01

.data_c0ddb
	db $17, $03, $7a, $38, $09, $01, $00, $01

.data_c0de3
	db $18, $03, $7a, $38, $09, $01, $00, $01

.data_c0deb
	db $12, $12, $23, $81, $07, $01, $00, $0a

.data_c0df3
	db $13, $12, $36, $08, $02, $02, $01, $05

.data_c0dfb
	db $15, $12, $36, $08, $02, $02, $01, $05


Data_c0e03: ; c0e03 (30:4e03)
	dw .data_c0e3f
	dw NULL
	dw .data_c0e47
	dw .data_c0e4f
	dw .data_c0e57
	dw .data_c0e5f
	dw .data_c0e67
	dw NULL
	dw NULL
	dw NULL
	dw .data_c0e6f
	dw .data_c0e77
	dw .data_c0e7f
	dw .data_c0e87
	dw .data_c0e8f
	dw .data_c0e97
	dw .data_c0e9f
	dw .data_c0ea7
	dw .data_c0eaf
	dw .data_c0eb7
	dw NULL
	dw .data_c0ebf
	dw NULL
	dw .data_c0ec7
	dw NULL
	dw NULL
	dw .data_c0ecf
	dw .data_c0ed7
	dw NULL
	dw .data_c0edf

.data_c0e3f
	db $20, $23, $02, $18, $0a, $01, $00, $01

.data_c0e47
	db $16, $02, $67, $08, $07, $01, $00, $0a

.data_c0e4f
	db $19, $03, $7a, $38, $09, $01, $00, $01

.data_c0e57
	db $22, $03, $23, $08, $07, $01, $00, $0a

.data_c0e5f
	db $10, $12, $01, $21, $14, $01, $00, $01

.data_c0e67
	db $01, $01, $12, $08, $07, $01, $00, $0a

.data_c0e6f
	db $05, $01, $36, $28, $01, $01, $00, $01

.data_c0e77
	db $06, $02, $67, $08, $24, $01, $00, $0a

.data_c0e7f
	db $04, $01, $36, $28, $01, $01, $00, $01

.data_c0e87
	db $27, $03, $7a, $38, $09, $01, $00, $01

.data_c0e8f
	db $14, $12, $36, $08, $02, $02, $01, $05

.data_c0e97
	db $29, $03, $7a, $38, $09, $01, $00, $01

.data_c0e9f
	db $02, $03, $23, $08, $07, $01, $00, $0a

.data_c0ea7
	db $21, $23, $02, $18, $0a, $01, $00, $01

.data_c0eaf
	db $23, $23, $37, $01, $05, $03, $00, $08

.data_c0eb7
	db $03, $01, $36, $28, $01, $01, $00, $01

.data_c0ebf
	db $17, $03, $7a, $38, $09, $01, $00, $01

.data_c0ec7
	db $18, $03, $7a, $38, $09, $01, $00, $01

.data_c0ecf
	db $12, $12, $23, $81, $07, $01, $00, $0a

.data_c0ed7
	db $13, $12, $36, $08, $02, $02, $01, $05

.data_c0edf
	db $15, $12, $36, $08, $02, $02, $01, $05


Data_c0ee7: ; c0ee7 (30:4ee7)
	dw .data_c0f23
	dw NULL
	dw .data_c0f2b
	dw .data_c0f33
	dw .data_c0f3b
	dw .data_c0f43
	dw .data_c0f4b
	dw NULL
	dw NULL
	dw NULL
	dw .data_c0f53
	dw .data_c0f5b
	dw .data_c0f63
	dw .data_c0f6b
	dw .data_c0f73
	dw .data_c0f7b
	dw .data_c0f83
	dw .data_c0f8b
	dw .data_c0f93
	dw .data_c0f9b
	dw NULL
	dw .data_c0fa3
	dw NULL
	dw .data_c0fab
	dw NULL
	dw NULL
	dw .data_c0fb3
	dw .data_c0fbb
	dw NULL
	dw .data_c0fc3

.data_c0f23
	db $20, $23, $02, $18, $0a, $01, $00, $03

.data_c0f2b
	db $16, $02, $67, $08, $72, $01, $00, $0a

.data_c0f33
	db $19, $03, $7a, $38, $09, $01, $00, $03

.data_c0f3b
	db $22, $03, $23, $08, $72, $01, $00, $0a

.data_c0f43
	db $10, $12, $01, $21, $14, $01, $00, $03

.data_c0f4b
	db $01, $01, $12, $18, $24, $01, $00, $0a

.data_c0f53
	db $05, $01, $36, $28, $01, $01, $00, $03

.data_c0f5b
	db $06, $02, $67, $08, $72, $01, $00, $0a

.data_c0f63
	db $04, $01, $36, $28, $01, $01, $00, $03

.data_c0f6b
	db $27, $03, $7a, $38, $09, $01, $00, $03

.data_c0f73
	db $14, $12, $36, $08, $02, $02, $01, $05

.data_c0f7b
	db $29, $03, $7a, $38, $09, $01, $00, $03

.data_c0f83
	db $02, $03, $23, $08, $72, $01, $00, $0a

.data_c0f8b
	db $21, $23, $02, $18, $0a, $01, $00, $03

.data_c0f93
	db $23, $23, $37, $01, $05, $03, $00, $08

.data_c0f9b
	db $03, $01, $36, $28, $01, $01, $00, $03

.data_c0fa3
	db $17, $03, $7a, $38, $09, $01, $00, $03

.data_c0fab
	db $18, $03, $7a, $38, $09, $01, $00, $03

.data_c0fb3
	db $12, $12, $23, $81, $72, $01, $00, $0a

.data_c0fbb
	db $13, $12, $36, $08, $02, $02, $01, $05

.data_c0fc3
	db $15, $12, $36, $08, $02, $02, $01, $05


Data_c0fcb: ; c0fcb (30:4fcb)
	dw .data_c1007
	dw NULL
	dw .data_c100f
	dw .data_c1017
	dw .data_c101f
	dw .data_c1027
	dw .data_c102f
	dw NULL
	dw NULL
	dw NULL
	dw .data_c1037
	dw .data_c103f
	dw .data_c1047
	dw .data_c104f
	dw .data_c1057
	dw .data_c105f
	dw .data_c1067
	dw .data_c106f
	dw .data_c1077
	dw .data_c107f
	dw NULL
	dw .data_c1087
	dw NULL
	dw .data_c108f
	dw NULL
	dw NULL
	dw .data_c1097
	dw .data_c109f
	dw NULL
	dw .data_c10a7

.data_c1007
	db $20, $23, $02, $18, $0a, $01, $00, $02

.data_c100f
	db $16, $02, $67, $08, $07, $01, $00, $0b

.data_c1017
	db $19, $03, $7a, $38, $09, $01, $00, $02

.data_c101f
	db $22, $03, $23, $08, $07, $01, $00, $02

.data_c1027
	db $10, $12, $01, $21, $14, $01, $00, $02

.data_c102f
	db $01, $01, $12, $08, $24, $01, $00, $0b

.data_c1037
	db $05, $01, $36, $28, $01, $01, $00, $02

.data_c103f
	db $06, $02, $67, $08, $07, $01, $00, $0b

.data_c1047
	db $04, $01, $36, $28, $01, $01, $00, $02

.data_c104f
	db $27, $03, $7a, $38, $09, $01, $00, $02

.data_c1057
	db $14, $12, $36, $08, $02, $02, $01, $05

.data_c105f
	db $29, $03, $7a, $38, $09, $01, $00, $02

.data_c1067
	db $02, $03, $23, $08, $07, $01, $00, $0b

.data_c106f
	db $21, $23, $02, $18, $0a, $01, $00, $02

.data_c1077
	db $23, $23, $37, $01, $04, $03, $00, $07

.data_c107f
	db $03, $01, $36, $28, $01, $01, $00, $02

.data_c1087
	db $17, $03, $7a, $38, $09, $01, $00, $02

.data_c108f
	db $18, $03, $7a, $38, $09, $01, $00, $02

.data_c1097
	db $12, $12, $23, $81, $07, $01, $00, $0b

.data_c109f
	db $13, $12, $36, $08, $02, $02, $01, $05

.data_c10a7
	db $15, $12, $36, $08, $02, $02, $01, $05


Data_c10af: ; c10af (30:50af)
	dw .data_c10eb
	dw NULL
	dw .data_c10f3
	dw .data_c10fb
	dw .data_c1103
	dw .data_c110b
	dw .data_c1113
	dw NULL
	dw NULL
	dw NULL
	dw .data_c111b
	dw .data_c1123
	dw .data_c112b
	dw .data_c1133
	dw .data_c113b
	dw .data_c1143
	dw .data_c114b
	dw .data_c1153
	dw .data_c115b
	dw .data_c1163
	dw NULL
	dw .data_c116b
	dw NULL
	dw .data_c1173
	dw NULL
	dw NULL
	dw .data_c117b
	dw .data_c1183
	dw NULL
	dw .data_c118b

.data_c10eb
	db $20, $23, $02, $18, $0a, $01, $00, $02

.data_c10f3
	db $16, $02, $67, $08, $07, $01, $00, $0b

.data_c10fb
	db $19, $03, $7a, $38, $09, $01, $00, $02

.data_c1103
	db $22, $03, $23, $08, $07, $01, $00, $02

.data_c110b
	db $10, $12, $01, $21, $14, $01, $00, $02

.data_c1113
	db $01, $01, $12, $08, $24, $01, $00, $0b

.data_c111b
	db $05, $01, $36, $28, $01, $01, $00, $02

.data_c1123
	db $06, $02, $67, $08, $07, $01, $00, $0b

.data_c112b
	db $04, $01, $36, $28, $01, $01, $00, $02

.data_c1133
	db $27, $03, $7a, $38, $09, $01, $00, $02

.data_c113b
	db $14, $12, $36, $08, $02, $02, $01, $05

.data_c1143
	db $29, $03, $7a, $38, $09, $01, $00, $02

.data_c114b
	db $02, $03, $23, $08, $07, $01, $00, $0b

.data_c1153
	db $21, $23, $02, $18, $0a, $01, $00, $02

.data_c115b
	db $23, $23, $37, $01, $06, $03, $00, $09

.data_c1163
	db $03, $01, $36, $28, $01, $01, $00, $02

.data_c116b
	db $17, $03, $7a, $38, $09, $01, $00, $02

.data_c1173
	db $18, $03, $7a, $38, $09, $01, $00, $02

.data_c117b
	db $12, $12, $23, $81, $07, $01, $00, $0b

.data_c1183
	db $13, $12, $36, $08, $02, $02, $01, $05

.data_c118b
	db $15, $12, $36, $08, $02, $02, $01, $05


Data_c1193: ; c1193 (30:5193)
	dw $51cf
	dw NULL
	dw $51d7
	dw $51df
	dw $51e7
	dw $51ef
	dw $51f7
	dw NULL
	dw NULL
	dw NULL
	dw $51ff
	dw $5207
	dw $520f
	dw $5217
	dw $521f
	dw $5227
	dw $522f
	dw $5237
	dw $523f
	dw $5247
	dw NULL
	dw $524f
	dw NULL
	dw $5257
	dw NULL
	dw NULL
	dw $525f
	dw $5267
	dw NULL
	dw $526f
	db $20, $23, $02, $18, $0a, $01, $00, $04, $16, $02, $67, $08, $72, $01, $00, $0b, $19, $03, $7a, $38, $09, $01, $00, $04, $22, $03, $23, $08, $72, $01, $00, $0b, $10, $12, $01, $21, $14, $01, $00, $04, $01, $01, $12, $18, $24, $01, $00, $0b, $05, $01, $36, $28, $01, $01, $00, $04, $06, $02, $67, $08, $72, $01, $00, $0b, $04, $01, $36, $28, $01, $01, $00, $04, $27, $03, $7a, $38, $09, $01, $00, $04, $14, $12, $36, $08, $02, $02, $01, $05, $29, $03, $7a, $38, $09, $01, $00, $04, $02, $03, $23, $08, $72, $01, $00, $0b, $21, $23, $02, $18, $0a, $01, $00, $04, $23, $23, $37, $01, $06, $03, $00, $09, $03, $01, $36, $28, $01, $01, $00, $04, $17, $03, $7a, $38, $09, $01, $00, $04, $18, $03, $7a, $38, $09, $01, $00, $04, $12, $12, $23, $81, $72, $01, $00, $0b, $13, $12, $36, $08, $02, $02, $01, $05, $15, $12, $36, $08, $02, $02, $01, $05

Data_c1277: ; c1277 (30:5277)
	dw $52b3
	dw $52bb
	dw $52c3
	dw $52cb
	dw $52d3
	dw $52db
	dw $52e3
	dw NULL
	dw $52eb
	dw $52f3
	dw $52fb
	dw NULL
	dw $5303
	dw $530b
	dw $5313
	dw $531b
	dw $5323
	dw $532b
	dw NULL
	dw $5333
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $533b
	dw $5343
	dw $534b
	dw $5353
	dw NULL
	db $11, $02, $15, $01, $35, $00, $00, $0c, $05, $02, $56, $08, $0b, $00, $00, $0e, $06, $02, $67, $08, $3a, $00, $00, $0e, $26, $23, $67, $28, $35, $03, $00, $0e, $19, $02, $8a, $08, $0f, $00, $00, $0e, $01, $02, $15, $01, $35, $00, $00, $0c, $02, $02, $15, $01, $35, $00, $00, $0c, $27, $23, $78, $08, $23, $03, $00, $0e, $28, $23, $8a, $11, $57, $0b, $00, $0e, $15, $02, $56, $08, $0b, $00, $00, $0e, $16, $02, $67, $08, $3a, $00, $00, $0e, $18, $02, $8a, $08, $0f, $00, $00, $0e, $17, $12, $78, $01, $0d, $03, $00, $0e, $20, $23, $06, $08, $1c, $04, $00, $0f, $12, $02, $15, $01, $35, $00, $00, $0c, $14, $02, $15, $01, $35, $00, $00, $0c, $04, $02, $15, $01, $35, $00, $00, $0c, $13, $02, $15, $01, $35, $00, $00, $0c, $03, $02, $15, $01, $35, $00, $00, $0c, $08, $02, $8a, $08, $0f, $00, $00, $0e, $09, $02, $8a, $08, $0f, $00, $00, $0e

Data_c135b: ; c135b (30:535b)
	dw $5397
	dw $539f
	dw $53a7
	dw $53af
	dw $53b7
	dw $53bf
	dw $53c7
	dw NULL
	dw $53cf
	dw $53d7
	dw $53df
	dw NULL
	dw $53e7
	dw $53ef
	dw $53f7
	dw $53ff
	dw $5407
	dw $540f
	dw NULL
	dw $5417
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $541f
	dw $5427
	dw $542f
	dw $5437
	dw NULL
	db $11, $02, $15, $01, $08, $00, $00, $0c, $05, $02, $56, $08, $0b, $00, $00, $0e, $06, $02, $67, $08, $3a, $00, $00, $0e, $26, $23, $67, $28, $08, $03, $00, $0e, $19, $02, $8a, $08, $0f, $00, $00, $0e, $01, $02, $15, $01, $08, $00, $00, $0c, $02, $02, $15, $01, $08, $00, $00, $0c, $27, $23, $78, $08, $23, $03, $00, $0e, $28, $23, $8a, $11, $57, $0b, $00, $0e, $15, $02, $56, $08, $0b, $00, $00, $0e, $16, $02, $67, $08, $3a, $00, $00, $0e, $18, $02, $8a, $08, $0f, $00, $00, $0e, $17, $12, $78, $01, $0d, $03, $00, $0e, $20, $23, $06, $08, $1c, $04, $00, $0f, $12, $02, $15, $01, $08, $00, $00, $0c, $14, $02, $15, $01, $08, $00, $00, $0c, $04, $02, $15, $01, $08, $00, $00, $0c, $13, $02, $15, $01, $08, $00, $00, $0c, $03, $02, $15, $01, $08, $00, $00, $0c, $08, $02, $8a, $08, $0f, $00, $00, $0e, $09, $02, $8a, $08, $0f, $00, $00, $0e

Data_c143f: ; c143f (30:543f)
	dw $547b
	dw $5483
	dw $548b
	dw $5493
	dw $549b
	dw $54a3
	dw $54ab
	dw NULL
	dw $54b3
	dw $54bb
	dw $54c3
	dw NULL
	dw $54cb
	dw $54d3
	dw $54db
	dw $54e3
	dw $54eb
	dw $54f3
	dw NULL
	dw $54fb
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $5503
	dw $550b
	dw $5513
	dw $551b
	dw NULL
	db $11, $02, $15, $01, $36, $00, $00, $0d, $05, $02, $56, $08, $0b, $00, $00, $11, $06, $02, $67, $08, $3a, $00, $00, $11, $26, $23, $67, $28, $36, $03, $00, $11, $19, $02, $8a, $08, $0f, $00, $00, $11, $01, $02, $15, $01, $36, $00, $00, $0d, $02, $02, $15, $01, $36, $00, $00, $0d, $27, $23, $78, $08, $23, $03, $00, $1a, $28, $23, $8a, $11, $57, $0b, $00, $1a, $15, $02, $56, $08, $0b, $00, $00, $11, $16, $02, $67, $08, $3a, $00, $00, $11, $18, $02, $8a, $08, $0f, $00, $00, $11, $17, $12, $78, $01, $0d, $03, $00, $11, $20, $23, $06, $08, $1c, $04, $00, $0f, $12, $02, $15, $01, $36, $00, $00, $0d, $14, $02, $15, $01, $36, $00, $00, $0d, $04, $02, $15, $01, $36, $00, $00, $0d, $13, $02, $15, $01, $36, $00, $00, $0d, $03, $02, $15, $01, $36, $00, $00, $0d, $08, $02, $8a, $08, $0f, $00, $00, $11, $09, $02, $8a, $08, $0f, $00, $00, $11

Data_c1523: ; c1523 (30:5523)
	dw $555f
	dw $5567
	dw $556f
	dw $5577
	dw $557f
	dw $5587
	dw $558f
	dw NULL
	dw $5597
	dw $559f
	dw $55a7
	dw NULL
	dw $55af
	dw $55b7
	dw $55bf
	dw $55c7
	dw $55cf
	dw $55d7
	dw NULL
	dw $55df
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $55e7
	dw $55ef
	dw $55f7
	dw $55ff
	dw NULL
	db $11, $02, $15, $01, $11, $00, $00, $0d, $05, $02, $56, $08, $0b, $00, $00, $11, $06, $02, $67, $08, $3a, $00, $00, $11, $26, $23, $67, $28, $11, $03, $00, $11, $19, $02, $8a, $08, $0f, $00, $00, $11, $01, $02, $15, $01, $11, $00, $00, $0d, $02, $02, $15, $01, $11, $00, $00, $0d, $27, $23, $78, $08, $23, $03, $00, $1a, $28, $23, $8a, $11, $57, $0b, $00, $1a, $15, $02, $56, $08, $0b, $00, $00, $11, $16, $02, $67, $08, $3a, $00, $00, $11, $18, $02, $8a, $08, $0f, $00, $00, $11, $17, $12, $78, $01, $0d, $03, $00, $11, $20, $23, $06, $08, $1c, $04, $00, $0f, $12, $02, $15, $01, $11, $00, $00, $0d, $14, $02, $15, $01, $11, $00, $00, $0d, $04, $02, $15, $01, $11, $00, $00, $0d, $13, $02, $15, $01, $11, $00, $00, $0d, $03, $02, $15, $01, $11, $00, $00, $0d, $08, $02, $8a, $08, $0f, $00, $00, $11, $09, $02, $8a, $08, $0f, $00, $00, $11

Data_c1607: ; c1607 (30:5607)
	dw $5643
	dw NULL
	dw NULL
	dw $564b
	dw NULL
	dw NULL
	dw NULL
	dw $5653
	dw NULL
	dw $565b
	dw $5663
	dw $566b
	dw NULL
	dw NULL
	dw $5673
	dw $567b
	dw $5683
	dw $5683
	dw $5683
	dw $5683
	dw $568b
	dw $568b
	dw $5693
	dw $569b
	dw NULL
	dw $56a3
	dw $56ab
	dw $56b3
	dw NULL
	dw $56bb
	db $01, $02, $16, $18, $0c, $03, $00, $43, $20, $23, $02, $08, $13, $00, $00, $19, $07, $02, $6a, $81, $15, $00, $00, $4a, $10, $12, $01, $01, $16, $03, $00, $19, $09, $02, $6a, $81, $15, $00, $00, $4a, $22, $23, $25, $08, $0e, $03, $00, $19, $25, $23, $56, $01, $18, $03, $00, $19, $26, $23, $69, $21, $30, $0b, $00, $3d, $04, $02, $16, $18, $0c, $03, $00, $43, $06, $02, $6a, $81, $15, $00, $00, $4a, $11, $02, $16, $18, $0c, $03, $00, $43, $23, $23, $25, $08, $0e, $03, $00, $19, $13, $02, $16, $18, $0c, $03, $00, $43, $15, $02, $16, $18, $0c, $03, $00, $43, $29, $23, $9a, $01, $28, $0b, $00, $19, $27, $23, $69, $21, $30, $0b, $00, $3d

Data_c16c3: ; c16c3 (30:56c3)
	dw $56ff
	dw NULL
	dw NULL
	dw $5707
	dw NULL
	dw NULL
	dw NULL
	dw $570f
	dw NULL
	dw $5717
	dw $571f
	dw $5727
	dw NULL
	dw NULL
	dw $572f
	dw $5737
	dw $573f
	dw $573f
	dw $573f
	dw $573f
	dw $5747
	dw $5747
	dw $574f
	dw $5757
	dw NULL
	dw $575f
	dw $5767
	dw $576f
	dw NULL
	dw $5777
	db $01, $02, $16, $18, $0c, $03, $00, $10, $20, $23, $02, $08, $13, $00, $00, $19, $07, $02, $6a, $81, $15, $00, $00, $4a, $10, $12, $01, $01, $16, $03, $00, $19, $09, $02, $6a, $81, $15, $00, $00, $4a, $22, $23, $25, $08, $0e, $03, $00, $19, $25, $23, $56, $01, $18, $03, $00, $19, $26, $23, $69, $21, $30, $0b, $00, $3d, $04, $02, $16, $18, $0c, $03, $00, $10, $06, $02, $6a, $81, $15, $00, $00, $4a, $11, $02, $16, $18, $0c, $03, $00, $10, $23, $23, $25, $08, $0e, $03, $00, $19, $13, $02, $16, $18, $0c, $03, $00, $10, $15, $02, $16, $18, $0c, $03, $00, $10, $29, $23, $9a, $01, $28, $0b, $00, $19, $27, $23, $69, $21, $30, $0b, $00, $3d

Data_c177f: ; c177f (30:577f)
	dw $57bb
	dw NULL
	dw NULL
	dw $57c3
	dw NULL
	dw NULL
	dw NULL
	dw $57cb
	dw NULL
	dw $57d3
	dw $57db
	dw $57e3
	dw NULL
	dw NULL
	dw $57eb
	dw $57f3
	dw $57fb
	dw $57fb
	dw $57fb
	dw $57fb
	dw $5803
	dw $5803
	dw $580b
	dw $5813
	dw NULL
	dw $581b
	dw $5823
	dw $582b
	dw NULL
	dw $5833
	db $01, $02, $16, $18, $0c, $03, $00, $44, $20, $23, $02, $08, $13, $00, $00, $19, $07, $02, $6a, $81, $38, $00, $00, $4b, $10, $12, $01, $01, $16, $03, $00, $19, $09, $02, $6a, $81, $38, $00, $00, $4b, $22, $23, $25, $08, $0e, $03, $00, $19, $25, $23, $56, $01, $18, $03, $00, $19, $26, $23, $69, $21, $30, $0b, $00, $3d, $04, $02, $16, $18, $0c, $03, $00, $44, $06, $02, $6a, $81, $38, $00, $00, $4b, $11, $02, $16, $18, $0c, $03, $00, $44, $23, $23, $25, $08, $0e, $03, $00, $19, $13, $02, $16, $18, $0c, $03, $00, $44, $15, $02, $16, $18, $0c, $03, $00, $44, $29, $23, $9a, $01, $28, $0b, $00, $19, $27, $23, $69, $21, $30, $0b, $00, $3d

Data_c183b: ; c183b (30:583b)
	dw $5877
	dw NULL
	dw NULL
	dw $587f
	dw NULL
	dw NULL
	dw NULL
	dw $5887
	dw NULL
	dw $588f
	dw $5897
	dw $589f
	dw NULL
	dw NULL
	dw $58a7
	dw $58af
	dw $58b7
	dw $58b7
	dw $58b7
	dw $58b7
	dw $58bf
	dw $58bf
	dw $58c7
	dw $58cf
	dw NULL
	dw $58d7
	dw $58df
	dw $58e7
	dw NULL
	dw $58ef
	db $01, $02, $16, $18, $0c, $03, $00, $3c, $20, $23, $02, $08, $13, $00, $00, $19, $07, $02, $6a, $81, $38, $00, $00, $4b, $10, $12, $01, $01, $16, $03, $00, $19, $09, $02, $6a, $81, $38, $00, $00, $4b, $22, $23, $25, $08, $0e, $03, $00, $19, $25, $23, $56, $01, $18, $03, $00, $19, $26, $23, $69, $21, $30, $0b, $00, $3d, $04, $02, $16, $18, $0c, $03, $00, $3c, $06, $02, $6a, $81, $38, $00, $00, $4b, $11, $02, $16, $18, $0c, $03, $00, $3c, $23, $23, $25, $08, $0e, $03, $00, $19, $13, $02, $16, $18, $0c, $03, $00, $3c, $15, $02, $16, $18, $0c, $03, $00, $3c, $29, $23, $9a, $01, $28, $0b, $00, $19, $27, $23, $69, $21, $30, $0b, $00, $3d

Data_c18f7: ; c18f7 (30:58f7)
	dw $5933
	dw $593b
	dw NULL
	dw $5943
	dw $594b
	dw $5953
	dw NULL
	dw $595b
	dw $5963
	dw $596b
	dw $5973
	dw NULL
	dw NULL
	dw NULL
	dw $597b
	dw $5983
	dw $598b
	dw NULL
	dw $5993
	dw $599b
	dw $59a3
	dw $59ab
	dw $59b3
	dw $59bb
	dw $59c3
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $59cb
	db $02, $01, $19, $11, $58, $06, $00, $12, $24, $23, $36, $21, $4a, $13, $00, $13, $20, $23, $01, $08, $02, $13, $00, $13, $21, $23, $12, $08, $01, $13, $00, $13, $29, $23, $9a, $01, $6a, $13, $00, $13, $22, $23, $23, $08, $02, $13, $00, $13, $10, $12, $05, $21, $03, $06, $00, $12, $16, $12, $58, $11, $03, $0d, $00, $12, $08, $01, $19, $11, $58, $06, $00, $12, $15, $12, $58, $11, $03, $0d, $00, $12, $14, $12, $05, $21, $03, $06, $00, $12, $09, $02, $9a, $38, $45, $0d, $00, $12, $23, $23, $36, $21, $4a, $13, $00, $13, $17, $12, $58, $11, $03, $0d, $00, $12, $03, $01, $19, $11, $58, $06, $00, $12, $04, $01, $19, $11, $58, $06, $00, $12, $07, $01, $19, $11, $58, $06, $00, $12, $18, $13, $89, $11, $8b, $13, $00, $13, $01, $01, $19, $11, $58, $06, $00, $12, $05, $01, $19, $11, $58, $06, $00, $12

Data_c19d3: ; c19d3 (30:59d3)
	dw $5a0f
	dw $5a17
	dw NULL
	dw $5a1f
	dw $5a27
	dw $5a2f
	dw NULL
	dw $5a37
	dw $5a3f
	dw $5a47
	dw $5a4f
	dw NULL
	dw NULL
	dw NULL
	dw $5a57
	dw $5a5f
	dw $5a67
	dw NULL
	dw $5a6f
	dw $5a77
	dw $5a7f
	dw $5a87
	dw $5a8f
	dw $5a97
	dw $5a9f
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $5aa7
	db $02, $01, $19, $11, $58, $06, $00, $66, $24, $23, $36, $21, $4a, $13, $00, $13, $20, $23, $01, $08, $02, $13, $00, $13, $21, $23, $12, $08, $01, $13, $00, $13, $29, $23, $9a, $01, $6a, $13, $00, $13, $22, $23, $23, $08, $02, $13, $00, $13, $10, $12, $05, $21, $03, $06, $00, $66, $16, $12, $58, $11, $03, $0d, $00, $66, $08, $01, $19, $11, $58, $06, $00, $66, $15, $12, $58, $11, $03, $0d, $00, $66, $14, $12, $05, $21, $03, $06, $00, $66, $09, $02, $9a, $38, $45, $0d, $00, $66, $23, $23, $36, $21, $4a, $13, $00, $13, $17, $12, $58, $11, $03, $0d, $00, $66, $03, $01, $19, $11, $58, $06, $00, $66, $04, $01, $19, $11, $58, $06, $00, $66, $07, $01, $19, $11, $58, $06, $00, $66, $18, $13, $89, $11, $8b, $13, $00, $13, $01, $01, $19, $11, $58, $06, $00, $66, $05, $01, $19, $11, $58, $06, $00, $66

Data_c1aaf: ; c1aaf (30:5aaf)
	dw $5aeb
	dw $5af3
	dw NULL
	dw $5afb
	dw $5b03
	dw $5b0b
	dw NULL
	dw $5b13
	dw $5b1b
	dw $5b23
	dw $5b2b
	dw NULL
	dw NULL
	dw NULL
	dw $5b33
	dw $5b3b
	dw $5b43
	dw NULL
	dw $5b4b
	dw $5b53
	dw $5b5b
	dw $5b63
	dw $5b6b
	dw $5b73
	dw $5b7b
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $5b83
	db $02, $01, $19, $11, $58, $06, $00, $67, $24, $23, $36, $21, $4a, $13, $00, $13, $20, $23, $01, $08, $02, $13, $00, $13, $21, $23, $12, $08, $01, $13, $00, $13, $29, $23, $9a, $01, $6a, $13, $00, $13, $22, $23, $23, $08, $02, $13, $00, $13, $10, $12, $05, $21, $03, $06, $00, $67, $16, $12, $58, $11, $03, $0d, $00, $67, $08, $01, $19, $11, $58, $06, $00, $67, $15, $12, $58, $11, $03, $0d, $00, $67, $14, $12, $05, $21, $03, $06, $00, $67, $09, $02, $9a, $38, $45, $0d, $00, $67, $23, $23, $36, $21, $4a, $13, $00, $13, $17, $12, $58, $11, $03, $0d, $00, $67, $03, $01, $19, $11, $58, $06, $00, $67, $04, $01, $19, $11, $58, $06, $00, $67, $07, $01, $19, $11, $58, $06, $00, $67, $18, $13, $89, $11, $8b, $13, $00, $13, $01, $01, $19, $11, $58, $06, $00, $67, $05, $01, $19, $11, $58, $06, $00, $67

Data_c1b8b: ; c1b8b (30:5b8b)
	dw $5bc7
	dw $5bcf
	dw NULL
	dw $5bd7
	dw $5bdf
	dw $5be7
	dw NULL
	dw $5bef
	dw $5bf7
	dw $5bff
	dw $5c07
	dw NULL
	dw NULL
	dw NULL
	dw $5c0f
	dw $5c17
	dw $5c1f
	dw NULL
	dw $5c27
	dw $5c2f
	dw $5c37
	dw $5c3f
	dw $5c47
	dw $5c4f
	dw $5c57
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $5c5f
	db $02, $01, $19, $11, $58, $06, $00, $68, $24, $23, $36, $21, $4a, $13, $00, $13, $20, $23, $01, $08, $02, $13, $00, $13, $21, $23, $12, $08, $01, $13, $00, $13, $29, $23, $9a, $01, $6a, $13, $00, $13, $22, $23, $23, $08, $02, $13, $00, $13, $10, $12, $05, $21, $03, $06, $00, $68, $16, $12, $58, $11, $03, $0d, $00, $68, $08, $01, $19, $11, $58, $06, $00, $68, $15, $12, $58, $11, $03, $0d, $00, $68, $14, $12, $05, $21, $03, $06, $00, $68, $09, $02, $9a, $38, $45, $0d, $00, $68, $23, $23, $36, $21, $4a, $13, $00, $13, $17, $12, $58, $11, $03, $0d, $00, $68, $03, $01, $19, $11, $58, $06, $00, $68, $04, $01, $19, $11, $58, $06, $00, $68, $07, $01, $19, $11, $58, $06, $00, $68, $18, $13, $89, $11, $8b, $13, $00, $13, $01, $01, $19, $11, $58, $06, $00, $68, $05, $01, $19, $11, $58, $06, $00, $68

Data_c1c67: ; c1c67 (30:5c67)
	dw $5ca3
	dw NULL
	dw NULL
	dw NULL
	dw $5cab
	dw NULL
	dw NULL
	dw $5cb3
	dw NULL
	dw $5cbb
	dw $5cc3
	dw NULL
	dw $5ccb
	dw $5cd3
	dw $5cdb
	dw NULL
	dw NULL
	dw $5ce3
	dw NULL
	dw NULL
	dw $5ceb
	dw $5cf3
	dw NULL
	dw $5cfb
	dw NULL
	dw $5d03
	dw $5d0b
	dw $5d13
	dw $5d1b
	dw $5d23
	db $11, $02, $16, $01, $12, $06, $00, $14, $27, $23, $78, $28, $5b, $07, $00, $15, $12, $02, $16, $01, $12, $06, $00, $14, $13, $02, $16, $01, $12, $06, $00, $14, $29, $03, $9a, $01, $5d, $07, $00, $15, $07, $02, $69, $01, $59, $07, $00, $15, $09, $03, $9a, $01, $5d, $07, $00, $15, $20, $23, $04, $01, $03, $04, $00, $15, $28, $23, $89, $01, $5c, $07, $00, $15, $14, $02, $16, $01, $12, $06, $00, $14, $26, $23, $47, $01, $81, $04, $00, $15, $24, $23, $47, $01, $81, $04, $00, $15, $22, $23, $04, $01, $03, $04, $00, $15, $21, $23, $04, $01, $03, $04, $00, $15, $04, $02, $16, $01, $12, $06, $00, $14, $17, $02, $69, $01, $59, $07, $00, $15, $10, $12, $01, $01, $0e, $07, $00, $15

Data_c1d2b: ; c1d2b (30:5d2b)
	dw $5d67
	dw NULL
	dw NULL
	dw NULL
	dw $5d6f
	dw NULL
	dw NULL
	dw $5d77
	dw NULL
	dw $5d7f
	dw $5d87
	dw NULL
	dw $5d8f
	dw $5d97
	dw $5d9f
	dw NULL
	dw NULL
	dw $5da7
	dw NULL
	dw NULL
	dw $5daf
	dw $5db7
	dw NULL
	dw $5dbf
	dw NULL
	dw $5dc7
	dw $5dcf
	dw $5dd7
	dw $5ddf
	dw $5de7
	db $11, $02, $16, $01, $12, $06, $00, $14, $27, $23, $78, $28, $5b, $07, $00, $71, $12, $02, $16, $01, $12, $06, $00, $14, $13, $02, $16, $01, $12, $06, $00, $14, $29, $03, $9a, $01, $5d, $07, $00, $71, $07, $02, $69, $01, $59, $07, $00, $71, $09, $03, $9a, $01, $5d, $07, $00, $71, $20, $23, $04, $01, $03, $04, $00, $71, $28, $23, $89, $01, $5c, $07, $00, $71, $14, $02, $16, $01, $12, $06, $00, $14, $26, $23, $47, $01, $81, $04, $00, $71, $24, $23, $47, $01, $81, $04, $00, $71, $22, $23, $04, $01, $03, $04, $00, $71, $21, $23, $04, $01, $03, $04, $00, $71, $04, $02, $16, $01, $12, $06, $00, $14, $17, $02, $69, $01, $59, $07, $00, $71, $10, $12, $01, $01, $0e, $07, $00, $71

Data_c1def: ; c1def (30:5def)
	dw $5e2b
	dw NULL
	dw NULL
	dw NULL
	dw $5e33
	dw NULL
	dw NULL
	dw $5e3b
	dw NULL
	dw $5e43
	dw $5e4b
	dw NULL
	dw $5e53
	dw $5e5b
	dw $5e63
	dw NULL
	dw NULL
	dw $5e6b
	dw NULL
	dw NULL
	dw $5e73
	dw $5e7b
	dw NULL
	dw $5e83
	dw NULL
	dw $5e8b
	dw $5e93
	dw $5e9b
	dw $5ea3
	dw $5eab
	db $11, $02, $16, $01, $12, $06, $00, $14, $27, $23, $78, $28, $5b, $07, $00, $72, $12, $02, $16, $01, $12, $06, $00, $14, $13, $02, $16, $01, $12, $06, $00, $14, $29, $03, $9a, $01, $5d, $07, $00, $72, $07, $02, $69, $01, $5a, $07, $00, $72, $09, $03, $9a, $01, $5d, $07, $00, $72, $20, $23, $04, $01, $03, $04, $00, $72, $28, $23, $89, $01, $5c, $07, $00, $72, $14, $02, $16, $01, $12, $06, $00, $14, $26, $23, $47, $01, $81, $04, $00, $72, $24, $23, $47, $01, $81, $04, $00, $72, $22, $23, $04, $01, $03, $04, $00, $72, $21, $23, $04, $01, $03, $04, $00, $72, $04, $02, $16, $01, $12, $06, $00, $14, $17, $02, $69, $01, $5a, $07, $00, $72, $10, $12, $01, $01, $0e, $07, $00, $72

Data_c1eb3: ; c1eb3 (30:5eb3)
	dw $5eef
	dw NULL
	dw NULL
	dw NULL
	dw $5ef7
	dw NULL
	dw NULL
	dw $5eff
	dw NULL
	dw $5f07
	dw $5f0f
	dw NULL
	dw $5f17
	dw $5f1f
	dw $5f27
	dw NULL
	dw NULL
	dw $5f2f
	dw NULL
	dw NULL
	dw $5f37
	dw $5f3f
	dw NULL
	dw $5f47
	dw NULL
	dw $5f4f
	dw $5f57
	dw $5f5f
	dw $5f67
	dw $5f6f
	db $11, $02, $16, $01, $12, $06, $00, $73, $27, $23, $78, $28, $5b, $07, $00, $15, $12, $02, $16, $01, $12, $06, $00, $73, $13, $02, $16, $01, $12, $06, $00, $73, $29, $03, $9a, $01, $5d, $07, $00, $15, $07, $02, $69, $01, $59, $07, $00, $15, $09, $03, $9a, $01, $5d, $07, $00, $15, $20, $23, $04, $01, $03, $04, $00, $15, $28, $23, $89, $01, $5c, $07, $00, $15, $14, $02, $16, $01, $12, $06, $00, $73, $26, $23, $47, $01, $81, $04, $00, $15, $24, $23, $47, $01, $81, $04, $00, $15, $22, $23, $04, $01, $03, $04, $00, $15, $21, $23, $04, $01, $03, $04, $00, $15, $04, $02, $16, $01, $12, $06, $00, $73, $17, $02, $69, $01, $59, $07, $00, $15, $10, $12, $01, $01, $0e, $07, $00, $15

Data_c1f77: ; c1f77 (30:5f77)
	dw $5fb3
	dw NULL
	dw NULL
	dw NULL
	dw $5fbb
	dw NULL
	dw NULL
	dw $5fc3
	dw NULL
	dw $5fcb
	dw $5fd3
	dw NULL
	dw $5fdb
	dw $5fe3
	dw $5feb
	dw NULL
	dw NULL
	dw $5ff3
	dw NULL
	dw NULL
	dw $5ffb
	dw $6003
	dw NULL
	dw $600b
	dw NULL
	dw $6013
	dw $601b
	dw $6023
	dw $602b
	dw $6033
	db $11, $02, $16, $01, $12, $06, $00, $73, $27, $23, $78, $28, $5b, $07, $00, $71, $12, $02, $16, $01, $12, $06, $00, $73, $13, $02, $16, $01, $12, $06, $00, $73, $29, $03, $9a, $01, $5d, $07, $00, $71, $07, $02, $69, $01, $59, $07, $00, $71, $09, $03, $9a, $01, $5d, $07, $00, $71, $20, $23, $04, $01, $03, $04, $00, $71, $28, $23, $89, $01, $5c, $07, $00, $71, $14, $02, $16, $01, $12, $06, $00, $73, $26, $23, $47, $01, $81, $04, $00, $71, $24, $23, $47, $01, $81, $04, $00, $71, $22, $23, $04, $01, $03, $04, $00, $71, $21, $23, $04, $01, $03, $04, $00, $71, $04, $02, $16, $01, $12, $06, $00, $73, $17, $02, $69, $01, $59, $07, $00, $71, $10, $12, $01, $01, $0e, $07, $00, $71

Data_c203b: ; c203b (30:603b)
	dw $6077
	dw NULL
	dw NULL
	dw NULL
	dw $607f
	dw NULL
	dw NULL
	dw $6087
	dw NULL
	dw $608f
	dw $6097
	dw NULL
	dw $609f
	dw $60a7
	dw $60af
	dw NULL
	dw NULL
	dw $60b7
	dw NULL
	dw NULL
	dw $60bf
	dw $60c7
	dw NULL
	dw $60cf
	dw NULL
	dw $60d7
	dw $60df
	dw $60e7
	dw $60ef
	dw $60f7
	db $11, $02, $16, $01, $12, $06, $00, $73, $27, $23, $78, $28, $5b, $07, $00, $72, $12, $02, $16, $01, $12, $06, $00, $73, $13, $02, $16, $01, $12, $06, $00, $73, $29, $03, $9a, $01, $5d, $07, $00, $72, $07, $02, $69, $01, $5a, $07, $00, $72, $09, $03, $9a, $01, $5d, $07, $00, $72, $20, $23, $04, $01, $03, $04, $00, $72, $28, $23, $89, $01, $5c, $07, $00, $72, $14, $02, $16, $01, $12, $06, $00, $73, $26, $23, $47, $01, $81, $04, $00, $72, $24, $23, $47, $01, $81, $04, $00, $72, $22, $23, $04, $01, $03, $04, $00, $72, $21, $23, $04, $01, $03, $04, $00, $72, $04, $02, $16, $01, $12, $06, $00, $73, $17, $02, $69, $01, $5a, $07, $00, $72, $10, $12, $01, $01, $0e, $07, $00, $72

Data_c20ff: ; c20ff (30:60ff)
	dw $613b
	dw NULL
	dw NULL
	dw $6143
	dw NULL
	dw $614b
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $6153
	dw $615b
	dw NULL
	dw $6163
	dw NULL
	dw $6153
	dw $616b
	dw NULL
	dw NULL
	dw NULL
	dw $6173
	dw $617b
	dw $6183
	dw $618b
	dw $6193
	dw $619b
	dw $61a3
	dw $61ab
	dw $61b3
	dw $61bb
	db $02, $02, $15, $41, $7f, $11, $00, $16, $22, $23, $05, $01, $1d, $11, $00, $32, $13, $02, $15, $41, $7f, $11, $00, $16, $01, $02, $15, $41, $7f, $11, $00, $16, $28, $23, $8a, $08, $40, $11, $00, $32, $05, $02, $56, $0c, $56, $11, $00, $69, $26, $23, $58, $01, $1d, $11, $00, $42, $24, $23, $05, $01, $1d, $11, $00, $32, $27, $23, $58, $01, $1d, $11, $00, $42, $03, $02, $15, $41, $7f, $11, $00, $16, $25, $23, $58, $01, $1d, $11, $00, $42, $20, $23, $05, $01, $1d, $11, $00, $32, $23, $23, $05, $01, $1d, $11, $00, $32, $16, $02, $69, $01, $3f, $01, $00, $42, $21, $23, $05, $01, $1d, $11, $00, $32, $11, $02, $15, $41, $7f, $11, $00, $16, $29, $23, $8a, $08, $40, $11, $00, $32

Data_c21c3: ; c21c3 (30:61c3)
	dw $61ff
	dw NULL
	dw NULL
	dw $6207
	dw NULL
	dw $620f
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $6217
	dw $621f
	dw NULL
	dw $6227
	dw NULL
	dw $6217
	dw $622f
	dw NULL
	dw NULL
	dw NULL
	dw $6237
	dw $623f
	dw $6247
	dw $624f
	dw $6257
	dw $625f
	dw $6267
	dw $626f
	dw $6277
	dw $627f
	db $02, $02, $15, $41, $7f, $11, $00, $6a, $22, $23, $05, $01, $1d, $11, $00, $32, $13, $02, $15, $41, $7f, $11, $00, $6a, $01, $02, $15, $41, $7f, $11, $00, $6a, $28, $23, $8a, $08, $40, $11, $00, $32, $05, $02, $56, $0c, $56, $11, $00, $69, $26, $23, $58, $01, $1d, $11, $00, $42, $24, $23, $05, $01, $1d, $11, $00, $32, $27, $23, $58, $01, $1d, $11, $00, $42, $03, $02, $15, $41, $7f, $11, $00, $6a, $25, $23, $58, $01, $1d, $11, $00, $42, $20, $23, $05, $01, $1d, $11, $00, $32, $23, $23, $05, $01, $1d, $11, $00, $32, $16, $02, $69, $01, $3f, $01, $00, $42, $21, $23, $05, $01, $1d, $11, $00, $32, $11, $02, $15, $41, $7f, $11, $00, $6a, $29, $23, $8a, $08, $40, $11, $00, $32

Data_c2287: ; c2287 (30:6287)
	dw $62c3
	dw NULL
	dw NULL
	dw $62cb
	dw NULL
	dw $62d3
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $62db
	dw $62e3
	dw NULL
	dw $62eb
	dw NULL
	dw $62db
	dw $62f3
	dw NULL
	dw NULL
	dw NULL
	dw $62fb
	dw $6303
	dw $630b
	dw $6313
	dw $631b
	dw $6323
	dw $632b
	dw $6333
	dw $633b
	dw $6343
	db $02, $02, $15, $41, $7f, $11, $00, $6a, $22, $23, $05, $01, $1d, $11, $00, $32, $13, $02, $15, $41, $7f, $11, $00, $6a, $01, $02, $15, $41, $7f, $11, $00, $6a, $28, $23, $8a, $08, $40, $11, $00, $32, $05, $02, $56, $0c, $56, $11, $00, $69, $26, $23, $58, $01, $1d, $11, $00, $6b, $24, $23, $05, $01, $1d, $11, $00, $32, $27, $23, $58, $01, $1d, $11, $00, $6b, $03, $02, $15, $41, $7f, $11, $00, $6a, $25, $23, $58, $01, $1d, $11, $00, $6b, $20, $23, $05, $01, $1d, $11, $00, $32, $23, $23, $05, $01, $1d, $11, $00, $32, $16, $02, $69, $01, $3f, $01, $00, $6b, $21, $23, $05, $01, $1d, $11, $00, $32, $11, $02, $15, $41, $7f, $11, $00, $6a, $29, $23, $8a, $08, $40, $11, $00, $32

Data_c234b: ; c234b (30:634b)
	dw $6387
	dw NULL
	dw NULL
	dw $638f
	dw NULL
	dw $6397
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $639f
	dw $63a7
	dw NULL
	dw $63af
	dw NULL
	dw $639f
	dw $63b7
	dw NULL
	dw NULL
	dw NULL
	dw $63bf
	dw $63c7
	dw $63cf
	dw $63d7
	dw $63df
	dw $63e7
	dw $63ef
	dw $63f7
	dw $63ff
	dw $6407
	db $02, $02, $15, $41, $7f, $11, $00, $6c, $22, $23, $05, $01, $1d, $11, $00, $32, $13, $02, $15, $41, $7f, $11, $00, $6c, $01, $02, $15, $41, $7f, $11, $00, $6c, $28, $23, $8a, $08, $40, $11, $00, $32, $05, $02, $56, $0c, $56, $11, $00, $69, $26, $23, $58, $01, $1d, $11, $00, $42, $24, $23, $05, $01, $1d, $11, $00, $32, $27, $23, $58, $01, $1d, $11, $00, $42, $03, $02, $15, $41, $7f, $11, $00, $6c, $25, $23, $58, $01, $1d, $11, $00, $42, $20, $23, $05, $01, $1d, $11, $00, $32, $23, $23, $05, $01, $1d, $11, $00, $32, $16, $02, $69, $01, $3f, $01, $00, $42, $21, $23, $05, $01, $1d, $11, $00, $32, $11, $02, $15, $41, $7f, $11, $00, $6c, $29, $23, $8a, $08, $40, $11, $00, $32

Data_c240f: ; c240f (30:640f)
	dw $644b
	dw NULL
	dw NULL
	dw $6453
	dw NULL
	dw $645b
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $6463
	dw $646b
	dw NULL
	dw $6473
	dw NULL
	dw $6463
	dw $647b
	dw NULL
	dw NULL
	dw NULL
	dw $6483
	dw $648b
	dw $6493
	dw $649b
	dw $64a3
	dw $64ab
	dw $64b3
	dw $64bb
	dw $64c3
	dw $64cb
	db $02, $02, $15, $41, $7f, $11, $00, $6d, $22, $23, $05, $01, $1d, $11, $00, $32, $13, $02, $15, $41, $7f, $11, $00, $6d, $01, $02, $15, $41, $7f, $11, $00, $6d, $28, $23, $8a, $08, $40, $11, $00, $32, $05, $02, $56, $0c, $56, $11, $00, $69, $26, $23, $58, $01, $1d, $11, $00, $42, $24, $23, $05, $01, $1d, $11, $00, $32, $27, $23, $58, $01, $1d, $11, $00, $42, $03, $02, $15, $41, $7f, $11, $00, $6d, $25, $23, $58, $01, $1d, $11, $00, $42, $20, $23, $05, $01, $1d, $11, $00, $32, $23, $23, $05, $01, $1d, $11, $00, $32, $16, $02, $69, $01, $3f, $01, $00, $42, $21, $23, $05, $01, $1d, $11, $00, $32, $11, $02, $15, $41, $7f, $11, $00, $6d, $29, $23, $8a, $08, $40, $11, $00, $32

Data_c24d3: ; c24d3 (30:64d3)
	dw $650f
	dw NULL
	dw NULL
	dw $6517
	dw NULL
	dw $651f
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $6527
	dw $652f
	dw NULL
	dw $6537
	dw NULL
	dw $6527
	dw $653f
	dw NULL
	dw NULL
	dw NULL
	dw $6547
	dw $654f
	dw $6557
	dw $655f
	dw $6567
	dw $656f
	dw $6577
	dw $657f
	dw $6587
	dw $658f
	db $02, $02, $15, $41, $7f, $11, $00, $6d, $22, $23, $05, $01, $1d, $11, $00, $32, $13, $02, $15, $41, $7f, $11, $00, $6d, $01, $02, $15, $41, $7f, $11, $00, $6d, $28, $23, $8a, $08, $40, $11, $00, $32, $05, $02, $56, $0c, $56, $11, $00, $69, $26, $23, $58, $01, $1d, $11, $00, $6b, $24, $23, $05, $01, $1d, $11, $00, $32, $27, $23, $58, $01, $1d, $11, $00, $6b, $03, $02, $15, $41, $7f, $11, $00, $6d, $25, $23, $58, $01, $1d, $11, $00, $6b, $20, $23, $05, $01, $1d, $11, $00, $32, $23, $23, $05, $01, $1d, $11, $00, $32, $16, $02, $69, $01, $3f, $01, $00, $6b, $21, $23, $05, $01, $1d, $11, $00, $32, $11, $02, $15, $41, $7f, $11, $00, $6d, $29, $23, $8a, $08, $40, $11, $00, $32

Data_c2597: ; c2597 (30:6597)
	dw $65d3
	dw $65db
	dw NULL
	dw NULL
	dw $65e3
	dw $65eb
	dw $65f3
	dw $65fb
	dw $6603
	dw $660b
	dw $6613
	dw $661b
	dw NULL
	dw NULL
	dw $6623
	dw $662b
	dw NULL
	dw NULL
	dw NULL
	dw $6633
	dw $663b
	dw $6643
	dw $664b
	dw NULL
	dw $6653
	dw $665b
	dw $6663
	dw $666b
	dw $6673
	dw $6633
	db $02, $02, $15, $01, $17, $05, $00, $17, $20, $23, $01, $08, $0d, $05, $00, $18, $10, $12, $01, $08, $0a, $05, $00, $3e, $27, $03, $68, $08, $3c, $05, $00, $18, $21, $23, $12, $08, $02, $05, $00, $18, $07, $03, $68, $08, $3c, $05, $00, $18, $14, $02, $15, $01, $17, $05, $00, $17, $15, $03, $56, $01, $19, $05, $00, $18, $04, $02, $15, $01, $17, $05, $00, $17, $26, $03, $68, $08, $3c, $05, $00, $18, $08, $03, $89, $01, $0b, $05, $00, $3e, $09, $02, $9a, $0c, $37, $05, $00, $18, $17, $03, $68, $08, $3c, $05, $00, $18, $01, $02, $15, $01, $17, $05, $00, $17, $06, $03, $68, $08, $3c, $05, $00, $18, $28, $03, $89, $01, $0b, $05, $00, $3e, $25, $03, $56, $01, $19, $05, $00, $18, $24, $23, $45, $08, $0b, $05, $00, $18, $11, $02, $15, $01, $17, $05, $00, $17, $05, $03, $56, $01, $19, $05, $00, $18, $22, $23, $23, $08, $0b, $05, $00, $3e

Data_c267b: ; c267b (30:667b)
	dw $66b7
	dw $66bf
	dw NULL
	dw NULL
	dw $66c7
	dw $66cf
	dw $66d7
	dw $66df
	dw $66e7
	dw $66ef
	dw $66f7
	dw $66ff
	dw NULL
	dw NULL
	dw $6707
	dw $670f
	dw NULL
	dw NULL
	dw NULL
	dw $6717
	dw $671f
	dw $6727
	dw $672f
	dw NULL
	dw $6737
	dw $673f
	dw $6747
	dw $674f
	dw $6757
	dw $6717
	db $02, $02, $15, $01, $3d, $05, $00, $2a, $20, $23, $01, $08, $0d, $05, $00, $18, $10, $12, $01, $08, $0a, $05, $00, $3e, $27, $03, $68, $08, $3c, $05, $00, $18, $21, $23, $12, $08, $02, $05, $00, $18, $07, $03, $68, $08, $3c, $05, $00, $18, $14, $02, $15, $01, $3d, $05, $00, $2a, $15, $03, $56, $01, $19, $05, $00, $18, $04, $02, $15, $01, $3d, $05, $00, $2a, $26, $03, $68, $08, $3c, $05, $00, $18, $08, $03, $89, $01, $0b, $05, $00, $3e, $09, $02, $9a, $0c, $37, $05, $00, $18, $17, $03, $68, $08, $3c, $05, $00, $18, $01, $02, $15, $01, $3d, $05, $00, $2a, $06, $03, $68, $08, $3c, $05, $00, $18, $28, $03, $89, $01, $0b, $05, $00, $3e, $25, $03, $56, $01, $19, $05, $00, $18, $24, $23, $45, $08, $0b, $05, $00, $18, $11, $02, $15, $01, $3d, $05, $00, $2a, $05, $03, $56, $01, $19, $05, $00, $18, $22, $23, $23, $08, $0b, $05, $00, $3e

Data_c275f: ; c275f (30:675f)
	dw $679b
	dw NULL
	dw $67a3
	dw $67ab
	dw $67b3
	dw NULL
	dw $67bb
	dw $67c3
	dw NULL
	dw $67cb
	dw $67d3
	dw $67db
	dw $67db
	dw $67db
	dw $67db
	dw $67e3
	dw $67eb
	dw $67f3
	dw $67fb
	dw $6803
	dw $680b
	dw $6813
	dw $681b
	dw NULL
	dw NULL
	dw NULL
	dw $6823
	dw NULL
	dw $682b
	dw $6833
	db $21, $23, $07, $81, $0a, $03, $00, $1b, $02, $02, $15, $81, $41, $03, $00, $1b, $10, $12, $01, $01, $1a, $07, $00, $15, $28, $23, $89, $08, $01, $03, $00, $1c, $05, $02, $56, $00, $2c, $03, $00, $1c, $01, $02, $15, $81, $41, $03, $00, $1b, $23, $23, $07, $81, $0a, $03, $00, $1b, $03, $02, $15, $81, $41, $03, $00, $1b, $24, $23, $07, $81, $0a, $03, $00, $1b, $25, $23, $07, $81, $0a, $03, $00, $1b, $15, $02, $56, $00, $2c, $03, $00, $1c, $22, $23, $07, $81, $0a, $03, $00, $1b, $19, $02, $9a, $01, $19, $07, $00, $15, $18, $02, $89, $01, $18, $07, $00, $15, $29, $23, $9a, $08, $07, $03, $00, $1c, $08, $02, $89, $01, $18, $07, $00, $15, $17, $02, $78, $00, $3b, $03, $00, $1c, $16, $02, $67, $0c, $2c, $03, $00, $9a, $04, $02, $15, $81, $41, $03, $00, $1b, $20, $23, $07, $81, $0a, $03, $00, $1b

Data_c283b: ; c283b (30:683b)
	dw $6877
	dw NULL
	dw $687f
	dw $6887
	dw $688f
	dw NULL
	dw $6897
	dw $689f
	dw NULL
	dw $68a7
	dw $68af
	dw $68b7
	dw $68b7
	dw $68b7
	dw $68b7
	dw $68bf
	dw $68c7
	dw $68cf
	dw $68d7
	dw $68df
	dw $68e7
	dw $68ef
	dw $68f7
	dw NULL
	dw NULL
	dw NULL
	dw $68ff
	dw NULL
	dw $6907
	dw $690f
	db $21, $23, $07, $81, $0a, $03, $00, $1b, $02, $02, $15, $81, $43, $03, $00, $1b, $10, $12, $01, $01, $1a, $07, $00, $15, $28, $23, $89, $08, $01, $03, $00, $1c, $05, $02, $56, $00, $2c, $03, $00, $1c, $01, $02, $15, $81, $43, $03, $00, $1b, $23, $23, $07, $81, $0a, $03, $00, $1b, $03, $02, $15, $81, $43, $03, $00, $1b, $24, $23, $07, $81, $0a, $03, $00, $1b, $25, $23, $07, $81, $0a, $03, $00, $1b, $15, $02, $56, $00, $2c, $03, $00, $1c, $22, $23, $07, $81, $0a, $03, $00, $1b, $19, $02, $9a, $01, $19, $07, $00, $15, $18, $02, $89, $01, $18, $07, $00, $15, $29, $23, $9a, $08, $07, $03, $00, $1c, $08, $02, $89, $01, $18, $07, $00, $15, $17, $02, $78, $00, $3b, $03, $00, $1c, $16, $02, $67, $0c, $2c, $03, $00, $9a, $04, $02, $15, $81, $43, $03, $00, $1b, $20, $23, $07, $81, $0a, $03, $00, $1b

Data_c2917: ; c2917 (30:6917)
	dw $6953
	dw NULL
	dw $695b
	dw $6963
	dw $696b
	dw NULL
	dw $6973
	dw $697b
	dw NULL
	dw $6983
	dw $698b
	dw $6993
	dw $6993
	dw $6993
	dw $6993
	dw $699b
	dw $69a3
	dw $69ab
	dw $69b3
	dw $69bb
	dw $69c3
	dw $69cb
	dw $69d3
	dw NULL
	dw NULL
	dw NULL
	dw $69db
	dw NULL
	dw $69e3
	dw $69eb
	db $21, $23, $07, $81, $0a, $03, $00, $50, $02, $02, $15, $81, $41, $03, $00, $50, $10, $12, $01, $01, $1a, $07, $00, $15, $28, $23, $89, $08, $01, $03, $00, $1c, $05, $02, $56, $00, $2c, $03, $00, $1c, $01, $02, $15, $81, $41, $03, $00, $50, $23, $23, $07, $81, $0a, $03, $00, $50, $03, $02, $15, $81, $41, $03, $00, $50, $24, $23, $07, $81, $0a, $03, $00, $50, $25, $23, $07, $81, $0a, $03, $00, $50, $15, $02, $56, $00, $2c, $03, $00, $1c, $22, $23, $07, $81, $0a, $03, $00, $50, $19, $02, $9a, $01, $19, $07, $00, $15, $18, $02, $89, $01, $18, $07, $00, $15, $29, $23, $9a, $08, $07, $03, $00, $1c, $08, $02, $89, $01, $18, $07, $00, $15, $17, $02, $78, $00, $3b, $03, $00, $1c, $16, $02, $67, $0c, $2c, $03, $00, $9a, $04, $02, $15, $81, $41, $03, $00, $50, $20, $23, $07, $81, $0a, $03, $00, $50

Data_c29f3: ; c29f3 (30:69f3)
	dw $6a2f
	dw NULL
	dw $6a37
	dw $6a3f
	dw $6a47
	dw NULL
	dw $6a4f
	dw $6a57
	dw NULL
	dw $6a5f
	dw $6a67
	dw $6a6f
	dw $6a6f
	dw $6a6f
	dw $6a6f
	dw $6a77
	dw $6a7f
	dw $6a87
	dw $6a8f
	dw $6a97
	dw $6a9f
	dw $6aa7
	dw $6aaf
	dw NULL
	dw NULL
	dw NULL
	dw $6ab7
	dw NULL
	dw $6abf
	dw $6ac7
	db $21, $23, $07, $81, $0a, $03, $00, $50, $02, $02, $15, $81, $43, $03, $00, $50, $10, $12, $01, $01, $1a, $07, $00, $15, $28, $23, $89, $08, $01, $03, $00, $1c, $05, $02, $56, $00, $2c, $03, $00, $1c, $01, $02, $15, $81, $43, $03, $00, $50, $23, $23, $07, $81, $0a, $03, $00, $50, $03, $02, $15, $81, $43, $03, $00, $50, $24, $23, $07, $81, $0a, $03, $00, $50, $25, $23, $07, $81, $0a, $03, $00, $50, $15, $02, $56, $00, $2c, $03, $00, $1c, $22, $23, $07, $81, $0a, $03, $00, $50, $19, $02, $9a, $01, $19, $07, $00, $15, $18, $02, $89, $01, $18, $07, $00, $15, $29, $23, $9a, $08, $07, $03, $00, $1c, $08, $02, $89, $01, $18, $07, $00, $15, $17, $02, $78, $00, $3b, $03, $00, $1c, $16, $02, $67, $0c, $2c, $03, $00, $9a, $04, $02, $15, $81, $43, $03, $00, $50, $20, $23, $07, $81, $0a, $03, $00, $50

Data_c2acf: ; c2acf (30:6acf)
	dw $6b0b
	dw $6b13
	dw NULL
	dw NULL
	dw NULL
	dw $6b1b
	dw $6b23
	dw $6b2b
	dw NULL
	dw $6b33
	dw $6b3b
	dw $6b43
	dw NULL
	dw $6b4b
	dw $6b53
	dw NULL
	dw $6b5b
	dw NULL
	dw NULL
	dw $6b63
	dw $6b6b
	dw $6b73
	dw $6b73
	dw $6b73
	dw $6b73
	dw $6b7b
	dw NULL
	dw NULL
	dw $6b83
	dw NULL
	db $02, $02, $16, $08, $34, $03, $00, $1d, $20, $23, $05, $81, $4c, $03, $00, $1d, $25, $23, $56, $08, $08, $03, $00, $1e, $09, $02, $7a, $01, $01, $03, $00, $1e, $13, $02, $16, $08, $34, $03, $00, $1d, $06, $02, $67, $0c, $6c, $03, $00, $1e, $11, $02, $16, $08, $34, $03, $00, $1d, $10, $12, $01, $08, $02, $03, $00, $1e, $07, $02, $7a, $01, $01, $03, $00, $1e, $28, $23, $6a, $08, $4b, $03, $00, $1e, $19, $02, $7a, $01, $01, $03, $00, $1e, $16, $02, $67, $0c, $6c, $03, $00, $1e, $01, $02, $16, $08, $34, $03, $00, $1d, $03, $02, $16, $08, $34, $03, $00, $1d, $05, $02, $16, $08, $34, $03, $00, $1d, $14, $02, $16, $08, $34, $03, $00, $1d

Data_c2b8b: ; c2b8b (30:6b8b)
	dw $6bc7
	dw $6bcf
	dw NULL
	dw NULL
	dw NULL
	dw $6bd7
	dw $6bdf
	dw $6be7
	dw NULL
	dw $6bef
	dw $6bf7
	dw $6bff
	dw NULL
	dw $6c07
	dw $6c0f
	dw NULL
	dw $6c17
	dw NULL
	dw NULL
	dw $6c1f
	dw $6c27
	dw $6c2f
	dw $6c2f
	dw $6c2f
	dw $6c2f
	dw $6c37
	dw NULL
	dw NULL
	dw $6c3f
	dw NULL
	db $02, $02, $16, $08, $34, $03, $00, $52, $20, $23, $05, $81, $4c, $03, $00, $52, $25, $23, $56, $08, $08, $03, $00, $1e, $09, $02, $7a, $01, $01, $03, $00, $1e, $13, $02, $16, $08, $34, $03, $00, $52, $06, $02, $67, $0c, $6c, $03, $00, $1e, $11, $02, $16, $08, $34, $03, $00, $52, $10, $12, $01, $08, $02, $03, $00, $1e, $07, $02, $7a, $01, $01, $03, $00, $1e, $28, $23, $6a, $08, $4b, $03, $00, $1e, $19, $02, $7a, $01, $01, $03, $00, $1e, $16, $02, $67, $0c, $6c, $03, $00, $1e, $01, $02, $16, $08, $34, $03, $00, $52, $03, $02, $16, $08, $34, $03, $00, $52, $05, $02, $16, $08, $34, $03, $00, $52, $14, $02, $16, $08, $34, $03, $00, $52

Data_c2c47: ; c2c47 (30:6c47)
	dw $6c83
	dw $6c8b
	dw NULL
	dw NULL
	dw NULL
	dw $6c93
	dw $6c9b
	dw $6ca3
	dw NULL
	dw $6cab
	dw $6cb3
	dw $6cbb
	dw NULL
	dw $6cc3
	dw $6ccb
	dw NULL
	dw $6cd3
	dw NULL
	dw NULL
	dw $6cdb
	dw $6ce3
	dw $6ceb
	dw $6ceb
	dw $6ceb
	dw $6ceb
	dw $6cf3
	dw NULL
	dw NULL
	dw $6cfb
	dw NULL
	db $02, $02, $16, $08, $34, $03, $00, $51, $20, $23, $05, $81, $4c, $03, $00, $51, $25, $23, $56, $08, $08, $03, $00, $1e, $09, $02, $7a, $01, $01, $03, $00, $1e, $13, $02, $16, $08, $34, $03, $00, $51, $06, $02, $67, $0c, $6c, $03, $00, $1e, $11, $02, $16, $08, $34, $03, $00, $51, $10, $12, $01, $08, $02, $03, $00, $1e, $07, $02, $7a, $01, $01, $03, $00, $1e, $28, $23, $6a, $08, $4b, $03, $00, $1e, $19, $02, $7a, $01, $01, $03, $00, $1e, $16, $02, $67, $0c, $6c, $03, $00, $1e, $01, $02, $16, $08, $34, $03, $00, $51, $03, $02, $16, $08, $34, $03, $00, $51, $05, $02, $16, $08, $34, $03, $00, $51, $14, $02, $16, $08, $34, $03, $00, $51

Data_c2d03: ; c2d03 (30:6d03)
	dw $6d3f
	dw $6d47
	dw NULL
	dw NULL
	dw NULL
	dw $6d4f
	dw $6d57
	dw $6d5f
	dw NULL
	dw $6d67
	dw $6d6f
	dw $6d77
	dw NULL
	dw $6d7f
	dw $6d87
	dw NULL
	dw $6d8f
	dw NULL
	dw NULL
	dw $6d97
	dw $6d9f
	dw $6da7
	dw $6da7
	dw $6da7
	dw $6da7
	dw $6daf
	dw NULL
	dw NULL
	dw $6db7
	dw NULL
	db $02, $02, $16, $08, $34, $03, $00, $53, $20, $23, $05, $81, $4c, $03, $00, $53, $25, $23, $56, $08, $08, $03, $00, $1e, $09, $02, $7a, $01, $01, $03, $00, $1e, $13, $02, $16, $08, $34, $03, $00, $53, $06, $02, $67, $0c, $6c, $03, $00, $1e, $11, $02, $16, $08, $34, $03, $00, $53, $10, $12, $01, $08, $02, $03, $00, $1e, $07, $02, $7a, $01, $01, $03, $00, $1e, $28, $23, $6a, $08, $4b, $03, $00, $1e, $19, $02, $7a, $01, $01, $03, $00, $1e, $16, $02, $67, $0c, $6c, $03, $00, $1e, $01, $02, $16, $08, $34, $03, $00, $53, $03, $02, $16, $08, $34, $03, $00, $53, $05, $02, $16, $08, $34, $03, $00, $53, $14, $02, $16, $08, $34, $03, $00, $53

Data_c2dbf: ; c2dbf (30:6dbf)
	dw $6dfb
	dw NULL
	dw NULL
	dw NULL
	dw $6e03
	dw $6e0b
	dw $6e13
	dw NULL
	dw NULL
	dw $6e1b
	dw $6e23
	dw $6e2b
	dw NULL
	dw NULL
	dw $6e33
	dw $6e3b
	dw $6e43
	dw $6e4b
	dw $6e53
	dw $6e5b
	dw NULL
	dw $6e63
	dw $6e6b
	dw $6e73
	dw $6e7b
	dw $6e83
	dw $6e8b
	dw $6e93
	dw $6e9b
	dw $6ea3
	db $12, $02, $15, $01, $44, $03, $00, $1f, $23, $23, $35, $08, $46, $03, $00, $20, $21, $23, $12, $01, $79, $0c, $00, $20, $28, $23, $89, $01, $1d, $0c, $00, $20, $14, $02, $15, $01, $44, $03, $00, $1f, $27, $23, $58, $08, $47, $03, $00, $21, $16, $02, $57, $01, $39, $0c, $00, $20, $09, $02, $9a, $01, $79, $0c, $00, $21, $22, $23, $23, $01, $91, $0c, $00, $20, $11, $02, $15, $01, $44, $03, $00, $1f, $19, $02, $9a, $01, $79, $0c, $00, $21, $29, $23, $9a, $08, $28, $0c, $00, $20, $17, $02, $79, $01, $28, $0c, $00, $3a, $05, $02, $57, $01, $39, $0c, $00, $20, $15, $02, $57, $01, $39, $0c, $00, $20, $04, $02, $15, $01, $44, $03, $00, $1f, $25, $23, $58, $08, $47, $03, $00, $21, $24, $23, $35, $08, $46, $03, $00, $20, $13, $02, $15, $01, $44, $03, $00, $1f, $20, $13, $01, $08, $6f, $14, $00, $1f, $06, $02, $57, $01, $39, $0c, $00, $20, $18, $02, $79, $01, $28, $0c, $00, $3a

Data_c2eab: ; c2eab (30:6eab)
	dw $6ee7
	dw NULL
	dw NULL
	dw NULL
	dw $6eef
	dw $6ef7
	dw $6eff
	dw NULL
	dw NULL
	dw $6f07
	dw $6f0f
	dw $6f17
	dw NULL
	dw NULL
	dw $6f1f
	dw $6f27
	dw $6f2f
	dw $6f37
	dw $6f3f
	dw $6f47
	dw NULL
	dw $6f4f
	dw $6f57
	dw $6f5f
	dw $6f67
	dw $6f6f
	dw $6f77
	dw $6f7f
	dw $6f87
	dw $6f8f
	db $12, $02, $15, $01, $44, $03, $00, $1f, $23, $23, $35, $08, $46, $03, $00, $20, $21, $23, $12, $01, $79, $0c, $00, $20, $28, $23, $89, $01, $1d, $0c, $00, $20, $14, $02, $15, $01, $44, $03, $00, $1f, $27, $23, $58, $08, $47, $03, $00, $21, $16, $02, $57, $01, $39, $0c, $00, $20, $09, $02, $9a, $01, $79, $0c, $00, $21, $22, $23, $23, $01, $91, $0c, $00, $20, $11, $02, $15, $01, $44, $03, $00, $1f, $19, $02, $9a, $01, $79, $0c, $00, $21, $29, $23, $9a, $08, $28, $0c, $00, $20, $17, $02, $79, $01, $28, $0c, $00, $57, $05, $02, $57, $01, $39, $0c, $00, $20, $15, $02, $57, $01, $39, $0c, $00, $20, $04, $02, $15, $01, $44, $03, $00, $1f, $25, $23, $58, $08, $47, $03, $00, $21, $24, $23, $35, $08, $46, $03, $00, $20, $13, $02, $15, $01, $44, $03, $00, $1f, $20, $13, $01, $08, $6f, $14, $00, $1f, $06, $02, $57, $01, $39, $0c, $00, $20, $18, $02, $79, $01, $28, $0c, $00, $57

Data_c2f97: ; c2f97 (30:6f97)
	dw $6fd3
	dw NULL
	dw NULL
	dw NULL
	dw $6fdb
	dw $6fe3
	dw $6feb
	dw NULL
	dw NULL
	dw $6ff3
	dw $6ffb
	dw $7003
	dw NULL
	dw NULL
	dw $700b
	dw $7013
	dw $701b
	dw $7023
	dw $702b
	dw $7033
	dw NULL
	dw $703b
	dw $7043
	dw $704b
	dw $7053
	dw $705b
	dw $7063
	dw $706b
	dw $7073
	dw $707b
	db $12, $02, $15, $01, $44, $03, $00, $54, $23, $23, $35, $08, $46, $03, $00, $55, $21, $23, $12, $01, $79, $0c, $00, $55, $28, $23, $89, $01, $1d, $0c, $00, $55, $14, $02, $15, $01, $44, $03, $00, $54, $27, $23, $58, $08, $47, $03, $00, $56, $16, $02, $57, $01, $39, $0c, $00, $55, $09, $02, $9a, $01, $79, $0c, $00, $56, $22, $23, $23, $01, $91, $0c, $00, $55, $11, $02, $15, $01, $44, $03, $00, $54, $19, $02, $9a, $01, $79, $0c, $00, $56, $29, $23, $9a, $08, $28, $0c, $00, $55, $17, $02, $79, $01, $28, $0c, $00, $3a, $05, $02, $57, $01, $39, $0c, $00, $55, $15, $02, $57, $01, $39, $0c, $00, $55, $04, $02, $15, $01, $44, $03, $00, $54, $25, $23, $58, $08, $47, $03, $00, $56, $24, $23, $35, $08, $46, $03, $00, $55, $13, $02, $15, $01, $44, $03, $00, $54, $20, $13, $01, $08, $6f, $14, $00, $54, $06, $02, $57, $01, $39, $0c, $00, $55, $18, $02, $79, $01, $28, $0c, $00, $3a

Data_c3083: ; c3083 (30:7083)
	dw $70bf
	dw NULL
	dw NULL
	dw NULL
	dw $70c7
	dw $70cf
	dw $70d7
	dw NULL
	dw NULL
	dw $70df
	dw $70e7
	dw $70ef
	dw NULL
	dw NULL
	dw $70f7
	dw $70ff
	dw $7107
	dw $710f
	dw $7117
	dw $711f
	dw NULL
	dw $7127
	dw $712f
	dw $7137
	dw $713f
	dw $7147
	dw $714f
	dw $7157
	dw $715f
	dw $7167
	db $12, $02, $15, $01, $44, $03, $00, $54, $23, $23, $35, $08, $46, $03, $00, $55, $21, $23, $12, $01, $79, $0c, $00, $55, $28, $23, $89, $01, $1d, $0c, $00, $55, $14, $02, $15, $01, $44, $03, $00, $54, $27, $23, $58, $08, $47, $03, $00, $56, $16, $02, $57, $01, $39, $0c, $00, $55, $09, $02, $9a, $01, $79, $0c, $00, $56, $22, $23, $23, $01, $91, $0c, $00, $55, $11, $02, $15, $01, $44, $03, $00, $54, $19, $02, $9a, $01, $79, $0c, $00, $56, $29, $23, $9a, $08, $28, $0c, $00, $55, $17, $02, $79, $01, $28, $0c, $00, $57, $05, $02, $57, $01, $39, $0c, $00, $55, $15, $02, $57, $01, $39, $0c, $00, $55, $04, $02, $15, $01, $44, $03, $00, $54, $25, $23, $58, $08, $47, $03, $00, $56, $24, $23, $35, $08, $46, $03, $00, $55, $13, $02, $15, $01, $44, $03, $00, $54, $20, $13, $01, $08, $6f, $14, $00, $54, $06, $02, $57, $01, $39, $0c, $00, $55, $18, $02, $79, $01, $28, $0c, $00, $57

Data_c316f: ; c316f (30:716f)
	dw $71ab
	dw NULL
	dw $71b3
	dw $71bb
	dw $71c3
	dw $71cb
	dw $71d3
	dw $71db
	dw NULL
	dw $71e3
	dw $71eb
	dw NULL
	dw $71f3
	dw NULL
	dw $71fb
	dw NULL
	dw NULL
	dw $7203
	dw $720b
	dw $7213
	dw $721b
	dw $7223
	dw $722b
	dw $7233
	dw $723b
	dw $7243
	dw $724b
	dw $7253
	dw NULL
	dw NULL
	db $08, $02, $7a, $b1, $59, $08, $00, $22, $02, $01, $14, $01, $10, $08, $00, $22, $07, $02, $7a, $b1, $59, $08, $00, $22, $24, $23, $45, $08, $07, $0b, $00, $36, $25, $23, $56, $01, $16, $0b, $00, $36, $26, $23, $67, $01, $8e, $0b, $00, $36, $03, $01, $14, $11, $2d, $08, $00, $22, $12, $12, $24, $08, $65, $0b, $00, $36, $17, $02, $7a, $b1, $59, $08, $00, $22, $09, $02, $7a, $b1, $59, $08, $00, $22, $18, $02, $7a, $b1, $59, $08, $00, $22, $10, $13, $02, $41, $1e, $08, $00, $22, $14, $02, $47, $01, $21, $12, $00, $36, $27, $23, $7a, $21, $85, $08, $00, $37, $22, $23, $24, $01, $2f, $0b, $00, $36, $23, $23, $24, $01, $2f, $0b, $00, $36, $20, $13, $02, $41, $1e, $08, $00, $22, $21, $13, $02, $41, $1e, $08, $00, $22, $04, $02, $47, $01, $21, $12, $00, $36, $05, $02, $47, $01, $21, $12, $00, $36, $06, $02, $47, $01, $21, $12, $00, $36, $19, $02, $7a, $b1, $59, $08, $00, $22

Data_c325b: ; c325b (30:725b)
	dw $7297
	dw NULL
	dw $729f
	dw $72a7
	dw $72af
	dw $72b7
	dw $72bf
	dw $72c7
	dw NULL
	dw $72cf
	dw $72d7
	dw NULL
	dw $72df
	dw NULL
	dw $72e7
	dw NULL
	dw NULL
	dw $72ef
	dw $72f7
	dw $72ff
	dw $7307
	dw $730f
	dw $7317
	dw $731f
	dw $7327
	dw $732f
	dw $7337
	dw $733f
	dw NULL
	dw NULL
	db $08, $02, $7a, $b1, $5a, $08, $00, $7b, $02, $01, $14, $01, $10, $08, $00, $7b, $07, $02, $7a, $b1, $5a, $08, $00, $7b, $24, $23, $45, $08, $07, $0b, $00, $36, $25, $23, $56, $01, $16, $0b, $00, $36, $26, $23, $67, $01, $8e, $0b, $00, $36, $03, $01, $14, $11, $2d, $08, $00, $7b, $12, $12, $24, $08, $65, $0b, $00, $36, $17, $02, $7a, $b1, $5a, $08, $00, $7b, $09, $02, $7a, $b1, $5a, $08, $00, $7b, $18, $02, $7a, $b1, $5a, $08, $00, $7b, $10, $13, $02, $41, $1e, $08, $00, $7b, $14, $02, $47, $01, $21, $12, $00, $36, $27, $23, $7a, $21, $85, $08, $00, $37, $22, $23, $24, $01, $2f, $0b, $00, $36, $23, $23, $24, $01, $2f, $0b, $00, $36, $20, $13, $02, $41, $1e, $08, $00, $7b, $21, $13, $02, $41, $1e, $08, $00, $7b, $04, $02, $47, $01, $21, $12, $00, $36, $05, $02, $47, $01, $21, $12, $00, $36, $06, $02, $47, $01, $21, $12, $00, $36, $19, $02, $7a, $b1, $5a, $08, $00, $7b

Data_c3347: ; c3347 (30:7347)
	dw $7383
	dw NULL
	dw $738b
	dw $7393
	dw $739b
	dw $73a3
	dw $73ab
	dw $73b3
	dw NULL
	dw $73bb
	dw $73c3
	dw NULL
	dw $73cb
	dw NULL
	dw $73d3
	dw NULL
	dw NULL
	dw $73db
	dw $73e3
	dw $73eb
	dw $73f3
	dw $73fb
	dw $7403
	dw $740b
	dw $7413
	dw $741b
	dw $7423
	dw $742b
	dw NULL
	dw NULL
	db $08, $02, $7a, $b1, $5a, $08, $00, $7c, $02, $01, $14, $01, $10, $08, $00, $7c, $07, $02, $7a, $b1, $5a, $08, $00, $7c, $24, $23, $45, $08, $07, $0b, $00, $36, $25, $23, $56, $01, $16, $0b, $00, $36, $26, $23, $67, $01, $8e, $0b, $00, $36, $03, $01, $14, $11, $2d, $08, $00, $7c, $12, $12, $24, $08, $65, $0b, $00, $36, $17, $02, $7a, $b1, $5a, $08, $00, $7c, $09, $02, $7a, $b1, $5a, $08, $00, $7c, $18, $02, $7a, $b1, $5a, $08, $00, $7c, $10, $13, $02, $41, $1e, $08, $00, $7c, $14, $02, $47, $01, $21, $12, $00, $36, $27, $23, $7a, $21, $85, $08, $00, $37, $22, $23, $24, $01, $2f, $0b, $00, $36, $23, $23, $24, $01, $2f, $0b, $00, $36, $20, $13, $02, $41, $1e, $08, $00, $7c, $21, $13, $02, $41, $1e, $08, $00, $7c, $04, $02, $47, $01, $21, $12, $00, $36, $05, $02, $47, $01, $21, $12, $00, $36, $06, $02, $47, $01, $21, $12, $00, $36, $19, $02, $7a, $b1, $5a, $08, $00, $7c

Data_c3433: ; c3433 (30:7433)
	dw $746f
	dw NULL
	dw $7477
	dw $747f
	dw $7487
	dw $748f
	dw $7497
	dw $749f
	dw NULL
	dw $74a7
	dw $74af
	dw NULL
	dw $74b7
	dw NULL
	dw $74bf
	dw NULL
	dw NULL
	dw $74c7
	dw $74cf
	dw $74d7
	dw $74df
	dw $74e7
	dw $74ef
	dw $74f7
	dw $74ff
	dw $7507
	dw $750f
	dw $7517
	dw NULL
	dw NULL
	db $08, $02, $7a, $b1, $59, $08, $00, $7d, $02, $01, $14, $01, $10, $08, $00, $7d, $07, $02, $7a, $b1, $59, $08, $00, $7d, $24, $23, $45, $08, $07, $0b, $00, $36, $25, $23, $56, $01, $16, $0b, $00, $36, $26, $23, $67, $01, $8e, $0b, $00, $36, $03, $01, $14, $11, $2d, $08, $00, $7d, $12, $12, $24, $08, $65, $0b, $00, $36, $17, $02, $7a, $b1, $59, $08, $00, $7d, $09, $02, $7a, $b1, $59, $08, $00, $7d, $18, $02, $7a, $b1, $59, $08, $00, $7d, $10, $13, $02, $41, $1e, $08, $00, $7d, $14, $02, $47, $01, $21, $12, $00, $36, $27, $23, $7a, $21, $85, $08, $00, $37, $22, $23, $24, $01, $2f, $0b, $00, $36, $23, $23, $24, $01, $2f, $0b, $00, $36, $20, $13, $02, $41, $1e, $08, $00, $7d, $21, $13, $02, $41, $1e, $08, $00, $7d, $04, $02, $47, $01, $21, $12, $00, $36, $05, $02, $47, $01, $21, $12, $00, $36, $06, $02, $47, $01, $21, $12, $00, $36, $19, $02, $7a, $b1, $59, $08, $00, $7d

Data_c351f: ; c351f (30:751f)
	dw $755b
	dw NULL
	dw $7563
	dw $756b
	dw $7573
	dw $757b
	dw $7583
	dw $758b
	dw NULL
	dw $7593
	dw $759b
	dw NULL
	dw $75a3
	dw NULL
	dw $75ab
	dw NULL
	dw NULL
	dw $75b3
	dw $75bb
	dw $75c3
	dw $75cb
	dw $75d3
	dw $75db
	dw $75e3
	dw $75eb
	dw $75f3
	dw $75fb
	dw $7603
	dw NULL
	dw NULL
	db $08, $02, $7a, $b1, $5a, $08, $00, $7e, $02, $01, $14, $01, $10, $08, $00, $7e, $07, $02, $7a, $b1, $5a, $08, $00, $7e, $24, $23, $45, $08, $07, $0b, $00, $36, $25, $23, $56, $01, $16, $0b, $00, $36, $26, $23, $67, $01, $8e, $0b, $00, $36, $03, $01, $14, $11, $2d, $08, $00, $7e, $12, $12, $24, $08, $65, $0b, $00, $36, $17, $02, $7a, $b1, $5a, $08, $00, $7e, $09, $02, $7a, $b1, $5a, $08, $00, $7e, $18, $02, $7a, $b1, $5a, $08, $00, $7e, $10, $13, $02, $41, $1e, $08, $00, $7e, $14, $02, $47, $01, $21, $12, $00, $36, $27, $23, $7a, $21, $85, $08, $00, $37, $22, $23, $24, $01, $2f, $0b, $00, $36, $23, $23, $24, $01, $2f, $0b, $00, $36, $20, $13, $02, $41, $1e, $08, $00, $7e, $21, $13, $02, $41, $1e, $08, $00, $7e, $04, $02, $47, $01, $21, $12, $00, $36, $05, $02, $47, $01, $21, $12, $00, $36, $06, $02, $47, $01, $21, $12, $00, $36, $19, $02, $7a, $b1, $5a, $08, $00, $7e

Data_c360b: ; c360b (30:760b)
	dw $7647
	dw NULL
	dw $764f
	dw $7657
	dw $765f
	dw $7667
	dw $766f
	dw $7677
	dw NULL
	dw $767f
	dw $7687
	dw NULL
	dw $768f
	dw NULL
	dw $7697
	dw NULL
	dw NULL
	dw $769f
	dw $76a7
	dw $76af
	dw $76b7
	dw $76bf
	dw $76c7
	dw $76cf
	dw $76d7
	dw $76df
	dw $76e7
	dw $76ef
	dw NULL
	dw NULL
	db $08, $02, $7a, $b1, $5a, $08, $00, $7f, $02, $01, $14, $01, $10, $08, $00, $7f, $07, $02, $7a, $b1, $5a, $08, $00, $7f, $24, $23, $45, $08, $07, $0b, $00, $36, $25, $23, $56, $01, $16, $0b, $00, $36, $26, $23, $67, $01, $8e, $0b, $00, $36, $03, $01, $14, $11, $2d, $08, $00, $7f, $12, $12, $24, $08, $65, $0b, $00, $36, $17, $02, $7a, $b1, $5a, $08, $00, $7f, $09, $02, $7a, $b1, $5a, $08, $00, $7f, $18, $02, $7a, $b1, $5a, $08, $00, $7f, $10, $13, $02, $41, $1e, $08, $00, $7f, $14, $02, $47, $01, $21, $12, $00, $36, $27, $23, $7a, $21, $85, $08, $00, $37, $22, $23, $24, $01, $2f, $0b, $00, $36, $23, $23, $24, $01, $2f, $0b, $00, $36, $20, $13, $02, $41, $1e, $08, $00, $7f, $21, $13, $02, $41, $1e, $08, $00, $7f, $04, $02, $47, $01, $21, $12, $00, $36, $05, $02, $47, $01, $21, $12, $00, $36, $06, $02, $47, $01, $21, $12, $00, $36, $19, $02, $7a, $b1, $5a, $08, $00, $7f

Data_c36f7: ; c36f7 (30:76f7)
	dw $7733
	dw $773b
	dw NULL
	dw NULL
	dw $7743
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $774b
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $7753
	dw $775b
	dw $7763
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $776b
	dw $7773
	dw $777b
	db $03, $03, $14, $01, $65, $0a, $00, $2f, $04, $02, $47, $01, $1a, $0a, $00, $30, $01, $03, $14, $01, $65, $0a, $00, $2f, $28, $03, $8a, $01, $62, $0c, $00, $30, $21, $03, $14, $01, $65, $0a, $00, $2f, $20, $13, $01, $11, $02, $0a, $00, $30, $27, $23, $48, $08, $1b, $0a, $00, $30, $22, $03, $14, $01, $65, $0a, $00, $2f, $13, $03, $14, $01, $65, $0a, $00, $2f, $29, $03, $8a, $01, $62, $0c, $00, $30

Data_c3783: ; c3783 (30:7783)
	dw $77bf
	dw $77c7
	dw NULL
	dw NULL
	dw $77cf
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $77d7
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $77df
	dw $77e7
	dw $77ef
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $77f7
	dw $77ff
	dw $7807
	db $03, $03, $14, $01, $88, $0a, $00, $2f, $04, $02, $47, $01, $1a, $0a, $00, $30, $01, $03, $14, $01, $88, $0a, $00, $2f, $28, $03, $8a, $01, $62, $0c, $00, $30, $21, $03, $14, $01, $88, $0a, $00, $2f, $20, $13, $01, $11, $02, $0a, $00, $30, $27, $23, $48, $08, $1b, $0a, $00, $30, $22, $03, $14, $01, $88, $0a, $00, $2f, $13, $03, $14, $01, $88, $0a, $00, $2f, $29, $03, $8a, $01, $62, $0c, $00, $30

Data_c380f: ; c380f (30:780f)
	dw $784b
	dw $7853
	dw NULL
	dw NULL
	dw $785b
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $7863
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $786b
	dw $7873
	dw $787b
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $7883
	dw $788b
	dw $7893
	db $03, $03, $14, $01, $88, $0a, $00, $8e, $04, $02, $47, $01, $1a, $0a, $00, $30, $01, $03, $14, $01, $88, $0a, $00, $8e, $28, $03, $8a, $01, $62, $0c, $00, $30, $21, $03, $14, $01, $88, $0a, $00, $8e, $20, $13, $01, $11, $02, $0a, $00, $30, $27, $23, $48, $08, $1b, $0a, $00, $30, $22, $03, $14, $01, $88, $0a, $00, $8e, $13, $03, $14, $01, $88, $0a, $00, $8e, $29, $03, $8a, $01, $62, $0c, $00, $30

Data_c389b: ; c389b (30:789b)
	dw $78d7
	dw $78df
	dw NULL
	dw NULL
	dw $78e7
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $78ef
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $78f7
	dw $78ff
	dw $7907
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $790f
	dw $7917
	dw $791f
	db $03, $03, $14, $01, $65, $0a, $00, $8f, $04, $02, $47, $01, $1a, $0a, $00, $30, $01, $03, $14, $01, $65, $0a, $00, $8f, $28, $03, $8a, $01, $62, $0c, $00, $30, $21, $03, $14, $01, $65, $0a, $00, $8f, $20, $13, $01, $11, $02, $0a, $00, $30, $27, $23, $48, $08, $1b, $0a, $00, $30, $22, $03, $14, $01, $65, $0a, $00, $8f, $13, $03, $14, $01, $65, $0a, $00, $8f, $29, $03, $8a, $01, $62, $0c, $00, $30

Data_c3927: ; c3927 (30:7927)
	dw $7963
	dw $796b
	dw NULL
	dw NULL
	dw $7973
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $797b
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $7983
	dw $798b
	dw $7993
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $799b
	dw $79a3
	dw $79ab
	db $03, $03, $14, $01, $88, $0a, $00, $8f, $04, $02, $47, $01, $1a, $0a, $00, $30, $01, $03, $14, $01, $88, $0a, $00, $8f, $28, $03, $8a, $01, $62, $0c, $00, $30, $21, $03, $14, $01, $88, $0a, $00, $8f, $20, $13, $01, $11, $02, $0a, $00, $30, $27, $23, $48, $08, $1b, $0a, $00, $30, $22, $03, $14, $01, $88, $0a, $00, $8f, $13, $03, $14, $01, $88, $0a, $00, $8f, $29, $03, $8a, $01, $62, $0c, $00, $30

Data_c39b3: ; c39b3 (30:79b3)
	dw $79ef
	dw $79f7
	dw NULL
	dw NULL
	dw $79ff
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $7a07
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $7a0f
	dw $7a17
	dw $7a1f
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $7a27
	dw $7a2f
	dw $7a37
	db $03, $03, $14, $01, $88, $0a, $00, $90, $04, $02, $47, $01, $1a, $0a, $00, $30, $01, $03, $14, $01, $88, $0a, $00, $90, $28, $03, $8a, $01, $62, $0c, $00, $30, $21, $03, $14, $01, $88, $0a, $00, $90, $20, $13, $01, $11, $02, $0a, $00, $30, $27, $23, $48, $08, $1b, $0a, $00, $30, $22, $03, $14, $01, $88, $0a, $00, $90, $13, $03, $14, $01, $88, $0a, $00, $90, $29, $03, $8a, $01, $62, $0c, $00, $30

Data_c3a3f: ; c3a3f (30:7a3f)
	dw $7a7b
	dw $7a83
	dw $7a8b
	dw NULL
	dw $7a93
	dw $7a9b
	dw $7aa3
	dw NULL
	dw $7aab
	dw $7ab3
	dw NULL
	dw NULL
	dw NULL
	dw $7abb
	dw $7ac3
	dw $7acb
	dw $7ad3
	dw NULL
	dw $7adb
	dw $7ae3
	dw $7aeb
	dw $7af3
	dw NULL
	dw $7afb
	dw $7b03
	dw $7b0b
	dw NULL
	dw $7b13
	dw $7b1b
	dw $7b23
	db $11, $02, $16, $08, $70, $03, $00, $23, $09, $03, $9a, $01, $50, $03, $00, $0a, $19, $03, $9a, $01, $50, $03, $00, $0a, $06, $02, $68, $08, $31, $03, $00, $23, $23, $23, $35, $01, $0e, $13, $00, $13, $04, $02, $16, $08, $70, $03, $00, $23, $25, $23, $56, $01, $64, $03, $00, $49, $01, $02, $16, $08, $48, $03, $00, $23, $16, $02, $68, $08, $31, $03, $00, $23, $21, $23, $13, $08, $13, $13, $00, $13, $18, $03, $89, $21, $63, $03, $00, $49, $13, $02, $16, $08, $70, $03, $00, $23, $15, $02, $16, $08, $70, $03, $00, $23, $02, $02, $16, $08, $70, $03, $00, $23, $29, $03, $9a, $01, $50, $03, $00, $0a, $14, $02, $16, $08, $70, $03, $00, $23, $05, $02, $16, $08, $70, $03, $00, $23, $24, $23, $35, $01, $0e, $13, $00, $13, $08, $03, $89, $21, $63, $03, $00, $49, $28, $03, $89, $21, $63, $03, $00, $49, $27, $23, $68, $18, $5c, $03, $00, $49, $20, $23, $01, $08, $01, $13, $00, $13

Data_c3b2b: ; c3b2b (30:7b2b)
	dw $7b67
	dw $7b6f
	dw $7b77
	dw NULL
	dw $7b7f
	dw $7b87
	dw $7b8f
	dw NULL
	dw $7b97
	dw $7b9f
	dw NULL
	dw NULL
	dw NULL
	dw $7ba7
	dw $7baf
	dw $7bb7
	dw $7bbf
	dw NULL
	dw $7bc7
	dw $7bcf
	dw $7bd7
	dw $7bdf
	dw NULL
	dw $7be7
	dw $7bef
	dw $7bf7
	dw NULL
	dw $7bff
	dw $7c07
	dw $7c0f
	db $11, $02, $16, $08, $70, $03, $00, $58, $09, $03, $9a, $01, $50, $03, $00, $0a, $19, $03, $9a, $01, $50, $03, $00, $0a, $06, $02, $68, $08, $31, $03, $00, $58, $23, $23, $35, $01, $0e, $13, $00, $13, $04, $02, $16, $08, $70, $03, $00, $58, $25, $23, $56, $01, $64, $03, $00, $49, $01, $02, $16, $08, $48, $03, $00, $58, $16, $02, $68, $08, $31, $03, $00, $58, $21, $23, $13, $08, $13, $13, $00, $13, $18, $03, $89, $21, $63, $03, $00, $49, $13, $02, $16, $08, $70, $03, $00, $58, $15, $02, $16, $08, $70, $03, $00, $58, $02, $02, $16, $08, $70, $03, $00, $58, $29, $03, $9a, $01, $50, $03, $00, $0a, $14, $02, $16, $08, $70, $03, $00, $58, $05, $02, $16, $08, $70, $03, $00, $58, $24, $23, $35, $01, $0e, $13, $00, $13, $08, $03, $89, $21, $63, $03, $00, $49, $28, $03, $89, $21, $63, $03, $00, $49, $27, $23, $68, $18, $5c, $03, $00, $49, $20, $23, $01, $08, $01, $13, $00, $13

Data_c3c17: ; c3c17 (30:7c17)
	dw $7c53
	dw $7c5b
	dw $7c63
	dw NULL
	dw $7c6b
	dw $7c73
	dw $7c7b
	dw NULL
	dw $7c83
	dw $7c8b
	dw NULL
	dw NULL
	dw NULL
	dw $7c93
	dw $7c9b
	dw $7ca3
	dw $7cab
	dw NULL
	dw $7cb3
	dw $7cbb
	dw $7cc3
	dw $7ccb
	dw NULL
	dw $7cd3
	dw $7cdb
	dw $7ce3
	dw NULL
	dw $7ceb
	dw $7cf3
	dw $7cfb
	db $11, $02, $16, $08, $48, $03, $00, $58, $09, $03, $9a, $01, $50, $03, $00, $0a, $19, $03, $9a, $01, $50, $03, $00, $0a, $06, $02, $68, $08, $31, $03, $00, $58, $23, $23, $35, $01, $0e, $13, $00, $13, $04, $02, $16, $08, $48, $03, $00, $58, $25, $23, $56, $01, $64, $03, $00, $49, $01, $02, $16, $08, $48, $03, $00, $58, $16, $02, $68, $08, $31, $03, $00, $58, $21, $23, $13, $08, $13, $13, $00, $13, $18, $03, $89, $21, $63, $03, $00, $49, $13, $02, $16, $08, $48, $03, $00, $58, $15, $02, $16, $08, $48, $03, $00, $58, $02, $02, $16, $08, $48, $03, $00, $58, $29, $03, $9a, $01, $50, $03, $00, $0a, $14, $02, $16, $08, $48, $03, $00, $58, $05, $02, $16, $08, $48, $03, $00, $58, $24, $23, $35, $01, $0e, $13, $00, $13, $08, $03, $89, $21, $63, $03, $00, $49, $28, $03, $89, $21, $63, $03, $00, $49, $27, $23, $68, $18, $5c, $03, $00, $49, $20, $23, $01, $08, $01, $13, $00, $13
