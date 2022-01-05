INCLUDE "constants.asm"


SECTION "Bank 1", ROMX

INCLUDE "engine/bank1.asm"


SECTION "Bank 2", ROMX

INCLUDE "engine/bank2.asm"


SECTION "Levels Common Gfx", ROMX

LevelsCommonGfx: INCBIN "gfx/levels/common.2bpp"


SECTION "Wario Palettes", romx

INCLUDE "gfx/wario_palettes.asm"


SECTION "Bank 3", ROMX

INCLUDE "engine/bank3.asm"


SECTION "Framesets 1", ROMX

INCLUDE "gfx/framesets1.asm"


SECTION "Bank 6", ROMX

INCLUDE "engine/bank6.asm"


SECTION "Bank 7", ROMX

INCLUDE "engine/bank7.asm"


SECTION "Bank 8", ROMX

INCLUDE "engine/bank8.asm"


SECTION "Bank A", ROMX

INCLUDE "engine/banka.asm"


SECTION "Bank D", ROMX

	INCROM $34000, $38000


SECTION "Bank E", ROMX

	INCROM $38000, $3c000


SECTION "Bank F", ROMX

INCLUDE "engine/bankf.asm"


SECTION "Bank 10", ROMX

INCLUDE "engine/bank10.asm"


SECTION "Bank 11", ROMX

	INCROM $44000, $47db3


SECTION "Bank 12", ROMX

	INCROM $48000, $4ab1e


SECTION "Bank 13", ROMX

	INCROM $4c000, $4d8fa


SECTION "Bank 14", ROMX

	INCROM $50000, $52665


SECTION "Bank 15", ROMX

	INCROM $54000, $57300


SECTION "Bank 18", ROMX

INCLUDE "engine/bank18.asm"


SECTION "Bank 19", ROMX

INCLUDE "engine/bank19.asm"


SECTION "Object Framesets", ROMX

INCLUDE "engine/bank1a.asm"


SECTION "Bank 20", ROMX

INCLUDE "engine/bank20.asm"


SECTION "Bank 21", ROMX

INCLUDE "engine/bank21.asm"


SECTION "Bank 22", ROMX

Overworld1Gfx:: INCBIN "gfx/overworld/overworld1.2bpp.lz"
Overworld2Gfx:: INCBIN "gfx/overworld/overworld2.2bpp.lz"
Overworld3Gfx:: INCBIN "gfx/overworld/overworld3.2bpp.lz"
Overworld4Gfx:: INCBIN "gfx/overworld/overworld4.2bpp.lz"
OverworldRocksGfx:: INCBIN "gfx/overworld/overworld_rocks.2bpp.lz"
OverworldCommonGfx:: INCBIN "gfx/overworld/overworld_common.2bpp.lz"
OverworldArrowsGfx:: INCBIN "gfx/overworld/overworld_arrows.2bpp.lz"
OverworldGlowGfx:: INCBIN "gfx/overworld/overworld_glow.2bpp.lz"
OverworldNumbersGfx:: INCBIN "gfx/overworld/overworld_numbers.2bpp.lz"

	INCROM $8b91e, $8c000


SECTION "Bank 23", ROMX

Overworld5Gfx:: INCBIN "gfx/overworld/overworld5.2bpp.lz"
OverworldThunderGfx:: INCBIN "gfx/overworld/overworld_thunder.2bpp.lz"
OverworldTowerGfx:: INCBIN "gfx/overworld/overworld_tower.2bpp.lz"
OverworldFanGfx:: INCBIN "gfx/overworld/overworld_fan.2bpp.lz"
OverworldExplosion1Gfx:: INCBIN "gfx/overworld/overworld_explosion1.2bpp.lz"
Overworld6Gfx:: INCBIN "gfx/overworld/overworld6.2bpp.lz"
OverworldExplosion2Gfx:: INCBIN "gfx/overworld/overworld_explosion2.2bpp.lz"
OverworldFireGfx:: INCBIN "gfx/overworld/overworld_fire.2bpp.lz"
OverworldTorchGfx:: INCBIN "gfx/overworld/overworld_torch.2bpp.lz"
OverworldExplosion3Gfx:: INCBIN "gfx/overworld/overworld_explosion3.2bpp.lz"
OverworldSmokeGfx:: INCBIN "gfx/overworld/overworld_smoke.2bpp.lz"


SECTION "Bank 24", ROMX

LevelNamesJPGfx::
LevelNamesNorthJPGfx:: INCBIN "gfx/gui/level_names_north_jp.2bpp"
LevelNamesWestJPGfx::  INCBIN "gfx/gui/level_names_west_jp.2bpp"
LevelNamesSouthJPGfx:: INCBIN "gfx/gui/level_names_south_jp.2bpp"
LevelNamesEastJPGfx::  INCBIN "gfx/gui/level_names_east_jp.2bpp"


SECTION "Bank 25", ROMX

LevelNamesENGfx::
LevelNamesNorthENGfx:: INCBIN "gfx/gui/level_names_north_en.2bpp"
LevelNamesWestENGfx::  INCBIN "gfx/gui/level_names_west_en.2bpp"
LevelNamesSouthENGfx:: INCBIN "gfx/gui/level_names_south_en.2bpp"
LevelNamesEastENGfx::  INCBIN "gfx/gui/level_names_east_en.2bpp"


SECTION "Bank 26", ROMX

INCLUDE "engine/bank26.asm"


SECTION "Bank 27", ROMX

INCLUDE "engine/bank27.asm"


SECTION "Cutscenes Gfx 1", ROMX

Cutscenes1Gfx:: INCBIN "gfx/cutscenes/cutscenes1.2bpp.lz"
Cutscenes2Gfx:: INCBIN "gfx/cutscenes/cutscenes2.2bpp.lz"
Cutscenes3Gfx:: INCBIN "gfx/cutscenes/cutscenes3.2bpp.lz"
Cutscenes4Gfx:: INCBIN "gfx/cutscenes/cutscenes4.2bpp.lz"
Cutscenes5Gfx:: INCBIN "gfx/cutscenes/cutscenes5.2bpp.lz"

rept $932
	db $00
endr


SECTION "Cutscenes Gfx 2", ROMX

Cutscenes6Gfx:: INCBIN "gfx/cutscenes/cutscenes6.2bpp.lz"
Cutscenes7Gfx:: INCBIN "gfx/cutscenes/cutscenes7.2bpp.lz"
Cutscenes8Gfx:: INCBIN "gfx/cutscenes/cutscenes8.2bpp.lz"
Cutscenes9Gfx:: INCBIN "gfx/cutscenes/cutscenes9.2bpp.lz"
Cutscenes10Gfx:: INCBIN "gfx/cutscenes/cutscenes10.2bpp.lz"


SECTION "Bank 2A", ROMX

INCLUDE "engine/bank2a.asm"


SECTION "Bank 2B", ROMX

INCLUDE "engine/bank2b.asm"


SECTION "Bank 2C", ROMX

INCLUDE "engine/bank2c.asm"


SECTION "Bank 2D", ROMX

INCLUDE "engine/bank2d.asm"


SECTION "Bank 2E", ROMX

INCLUDE "engine/bank2e.asm"


SECTION "Bank 2F", ROMX

INCLUDE "engine/bank2f.asm"


SECTION "Bank 30", ROMX

INCLUDE "engine/bank30.asm"


SECTION "Bank 31", ROMX

INCLUDE "engine/bank31.asm"


SECTION "Permission Maps 1", ROMX

INCLUDE "data/levels/permission_maps1.asm"


SECTION "Palettes", ROMX

INCLUDE "gfx/palettes.asm"


SECTION "Bank 34", ROMX

INCLUDE "engine/bank34.asm"


SECTION "Bank 35", ROMX

INCLUDE "engine/bank35.asm"


SECTION "Bank 36", ROMX

INCLUDE "engine/bank36.asm"


SECTION "Bank 37", ROMX

INCLUDE "engine/bank37.asm"


SECTION "Level Data 1", ROMX

OutOfTheWoodsLayout::       INCBIN "data/levels/layouts/out_of_the_woods.bin"
ThePeacefulVillage1Layout:: INCBIN "data/levels/layouts/the_peaceful_village_1.bin"

OutOfTheWoodsObjectsMap::       INCBIN "data/levels/objects_map/out_of_the_woods.bin"
ThePeacefulVillage1ObjectsMap:: INCBIN "data/levels/objects_map/the_peaceful_village_1.bin"

	INCROM $e2c0b, $e3d04


SECTION "Level Data 2", ROMX

TheVastPlain1Layout::   INCBIN "data/levels/layouts/the_vast_plain_1.bin"
TheSteepCanyon1Layout:: INCBIN "data/levels/layouts/the_steep_canyon_1.bin"

TheVastPlain1ObjectsMap::   INCBIN "data/levels/objects_map/the_vast_plain_1.bin"
TheSteepCanyon1ObjectsMap:: INCBIN "data/levels/objects_map/the_steep_canyon_1.bin"

	INCROM $e6cf7, $e7e76


SECTION "Level Data 3", ROMX

TheTidalCoast1Layout:: INCBIN "data/levels/layouts/the_tidal_coast_1.bin"
SeaTurtleRocksLayout:: INCBIN "data/levels/layouts/sea_turtle_rocks.bin"

TheTidalCoast1ObjectsMap:: INCBIN "data/levels/objects_map/the_tidal_coast_1.bin"
SeaTurtleRocksObjectsMap:: INCBIN "data/levels/objects_map/sea_turtle_rocks.bin"

	INCROM $ea43f, $eb478


SECTION "Level Data 4", ROMX

DesertRuinsLayout::      INCBIN "data/levels/layouts/desert_ruins.bin"
TheVolcanosBase1Layout:: INCBIN "data/levels/layouts/the_volcanos_base_1.bin"

DesertRuinsObjectsMap::      INCBIN "data/levels/objects_map/desert_ruins.bin"
TheVolcanosBase1ObjectsMap:: INCBIN "data/levels/objects_map/the_volcanos_base_1.bin"

	INCROM $eed97, $eff0d


SECTION "Level Data 5", ROMX

ThePoolOfRain1Layout:: INCBIN "data/levels/layouts/the_pool_of_rain_1.bin"
ATownInChaosLayout::   INCBIN "data/levels/layouts/a_town_in_chaos.bin"

ThePoolOfRain1ObjectsMap:: INCBIN "data/levels/objects_map/the_pool_of_rain_1.bin"
ATownInChaosObjectsMap::   INCBIN "data/levels/objects_map/a_town_in_chaos.bin"

	INCROM $f2ab7, $f3c16


SECTION "Level Data 6", ROMX

BeneathTheWavesLayout:: INCBIN "data/levels/layouts/beneath_the_waves.bin"
TheWestCraterLayout::   INCBIN "data/levels/layouts/the_west_crater.bin"

BeneathTheWavesObjectsMap:: INCBIN "data/levels/objects_map/beneath_the_waves.bin"
TheWestCraterObjectsMap::   INCBIN "data/levels/objects_map/the_west_crater.bin"

	INCROM $f6759, $f78b4


SECTION "Level Data 7", ROMX

TheGrasslandsLayout:: INCBIN "data/levels/layouts/the_grasslands.bin"
TheBigBridgeLayout::  INCBIN "data/levels/layouts/the_big_bridge.bin"

TheGrasslandsObjectsMap:: INCBIN "data/levels/objects_map/the_grasslands.bin"
TheBigBridgeObjectsMap::  INCBIN "data/levels/objects_map/the_big_bridge.bin"

	INCROM $fa4fe, $fb5b0


SECTION "Level Data 8", ROMX

TowerOfRevivalLayout::     INCBIN "data/levels/layouts/tower_of_revival.bin"
BankOfTheWildRiverLayout:: INCBIN "data/levels/layouts/bank_of_the_wild_river.bin"

TowerOfRevivalObjectsMap::     INCBIN "data/levels/objects_map/tower_of_revival.bin"
BankOfTheWildRiverObjectsMap:: INCBIN "data/levels/objects_map/bank_of_the_wild_river.bin"

	INCROM $feb90, $ffb97


SECTION "Level Data 9", ROMX

CaveOfFlamesLayout::    INCBIN "data/levels/layouts/cave_of_flames.bin"
AboveTheClouds1Layout:: INCBIN "data/levels/layouts/above_the_clouds_1.bin"

CaveOfFlamesObjectsMap::    INCBIN "data/levels/objects_map/cave_of_flames.bin"
AboveTheClouds1ObjectsMap:: INCBIN "data/levels/objects_map/above_the_clouds_1.bin"

	INCROM $102c8e, $103e21


SECTION "Level Data 10", ROMX

TheStagnantSwamp1Layout:: INCBIN "data/levels/layouts/the_stagnant_swamp_1.bin"
TheFrigidSeaLayout::      INCBIN "data/levels/layouts/the_frigid_sea.bin"

TheStagnantSwamp1ObjectsMap:: INCBIN "data/levels/objects_map/the_stagnant_swamp_1.bin"
TheFrigidSeaObjectsMap::      INCBIN "data/levels/objects_map/the_frigid_sea.bin"

	INCROM $1061f4, $107322


SECTION "Level Data 11", ROMX

CastleOfIllusionsLayout:: INCBIN "data/levels/layouts/castle_of_illusions.bin"
TheColossalHole1Layout::  INCBIN "data/levels/layouts/the_colossal_hole_1.bin"

CastleOfIllusionsObjectsMap:: INCBIN "data/levels/objects_map/castle_of_illusions.bin"
TheColossalHole1ObjectsMap::  INCBIN "data/levels/objects_map/the_colossal_hole_1.bin"

	INCROM $10ae4f, $10bf09


SECTION "Level Data 12", ROMX

TheWarpedVoidLayout:: INCBIN "data/levels/layouts/the_warped_void.bin"
TheEastCraterLayout:: INCBIN "data/levels/layouts/the_east_crater.bin"

TheWarpedVoidObjectsMap:: INCBIN "data/levels/objects_map/the_warped_void.bin"
TheEastCraterObjectsMap:: INCBIN "data/levels/objects_map/the_east_crater.bin"

	INCROM $10e436, $10f437


SECTION "Level Data 13", ROMX

ForestOfFearLayout::     INCBIN "data/levels/layouts/forest_of_fear.bin"
HiddenFigureRoomLayout:: INCBIN "data/levels/layouts/hidden_figure_room.bin"

ForestOfFearObjectsMap::     INCBIN "data/levels/objects_map/forest_of_fear.bin"
HiddenFigureRoomObjectsMap:: INCBIN "data/levels/objects_map/hidden_figure_room.bin"

	INCROM $1115a5, $112757


SECTION "Level Data 14", ROMX

TheVastPlain2Layout::    INCBIN "data/levels/layouts/the_vast_plain_2.bin"
TheVolcanosBase2Layout:: INCBIN "data/levels/layouts/the_volcanos_base_2.bin"

TheVastPlain2ObjectsMap::    INCBIN "data/levels/objects_map/the_vast_plain_2.bin"
TheVolcanosBase2ObjectsMap:: INCBIN "data/levels/objects_map/the_volcanos_base_2.bin"

	INCROM $11699e, $117aa6


SECTION "Level Data 15", ROMX

ThePoolOfRain2Layout::   INCBIN "data/levels/layouts/the_pool_of_rain_2.bin"
TheColossalHole2Layout:: INCBIN "data/levels/layouts/the_colossal_hole_2.bin"

ThePoolOfRain2ObjectsMap::   INCBIN "data/levels/objects_map/the_pool_of_rain_2.bin"
TheColossalHole2ObjectsMap:: INCBIN "data/levels/objects_map/the_colossal_hole_2.bin"

	INCROM $11a7c8, $11b746


SECTION "Level Data 16", ROMX

TheTidalCoast2Layout::    INCBIN "data/levels/layouts/the_tidal_coast_2.bin"
TheStagnantSwamp2Layout:: INCBIN "data/levels/layouts/the_stagnant_swamp_2.bin"

TheTidalCoast2ObjectsMap::    INCBIN "data/levels/objects_map/the_tidal_coast_2.bin"
TheStagnantSwamp2ObjectsMap:: INCBIN "data/levels/objects_map/the_stagnant_swamp_2.bin"


SECTION "Level Data 17", ROMX

AboveTheClouds2Layout:: INCBIN "data/levels/layouts/above_the_clouds_2.bin"
TheSteepCanyon2Layout:: INCBIN "data/levels/layouts/the_steep_canyon_2.bin"

AboveTheClouds2ObjectsMap:: INCBIN "data/levels/objects_map/above_the_clouds_2.bin"
TheSteepCanyon2ObjectsMap:: INCBIN "data/levels/objects_map/the_steep_canyon_2.bin"


SECTION "Level Data 18", ROMX

ThePeacefulVillage2Layout:: INCBIN "data/levels/layouts/the_peaceful_village_2.bin"

ThePeacefulVillage2ObjectsMap:: INCBIN "data/levels/objects_map/the_peaceful_village_2.bin"


SECTION "Room Special Tiles 1", ROMX

INCLUDE "data/levels/special_tiles1.asm"


SECTION "Room Special Tiles 2", ROMX

INCLUDE "data/levels/special_tiles2.asm"


SECTION "Permission Maps 2", ROMX

INCLUDE "data/levels/permission_maps2.asm"


SECTION "Room Main Tiles 1", ROMX

INCLUDE "data/levels/main_tiles1.asm"


SECTION "Room Main Tiles 2", ROMX

INCLUDE "data/levels/main_tiles2.asm"


SECTION "Room Main Tiles 3", ROMX

INCLUDE "data/levels/main_tiles3.asm"


SECTION "Room Main Tiles 4", ROMX

INCLUDE "data/levels/main_tiles4.asm"


SECTION "Room Main Tiles 5", ROMX

INCLUDE "data/levels/main_tiles5.asm"


SECTION "Bank 56", ROMX

	INCROM $158000, $158ba3


SECTION "Bank 57", ROMX

INCLUDE "engine/bank57.asm"


SECTION "Bank 58", ROMX

INCLUDE "engine/bank58.asm"


SECTION "Bank 60", ROMX

	INCROM $180000, $181eb6


SECTION "Bank 61", ROMX

	INCROM $184000, $185ce5


SECTION "Bank 62", ROMX

INCLUDE "engine/bank62.asm"


SECTION "Bank 63", ROMX

INCLUDE "engine/bank63.asm"


SECTION "Bank 64", ROMX

	INCROM $190000, $193134


SECTION "Bank 65", ROMX

	INCROM $194000, $196fa6


SECTION "Bank 70", ROMX

	INCROM $1c0000, $1c37cc


SECTION "Bank 71", ROMX

	INCROM $1c4000, $1c5e07


SECTION "Bank 72", ROMX

INCLUDE "engine/bank72.asm"


SECTION "Bank 76", ROMX

INCLUDE "engine/bank76.asm"


SECTION "Framesets 3", ROMX

INCLUDE "gfx/framesets3.asm"


SECTION "Bank 78", ROMX

	INCROM $1e0000, $1e1dd1


SECTION "Bank 79", ROMX

	INCROM $1e4000, $1e6fd3


SECTION "Bank 7B", ROMX

INCLUDE "engine/bank7b.asm"


SECTION "Bank 7C", ROMX

INCLUDE "engine/bank7c.asm"


SECTION "Bank 7D", ROMX

INCLUDE "engine/bank7d.asm"


SECTION "Bank 7E", ROMX

INCLUDE "engine/bank7e.asm"


SECTION "Framesets 2", ROMX

INCLUDE "gfx/framesets2.asm"
