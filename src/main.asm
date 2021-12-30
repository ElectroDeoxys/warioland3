INCLUDE "macros.asm"
INCLUDE "constants.asm"

INCLUDE "engine/home.asm"


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


SECTION "Bank 4", ROMX

WarioIdleGfx::     INCBIN "gfx/wario/idle.2bpp"
WarioWalkGfx::     INCBIN "gfx/wario/walk.2bpp"
WarioDizzyGfx::    INCBIN "gfx/wario/dizzy.2bpp"
WarioAttackGfx::   INCBIN "gfx/wario/attack.2bpp"
WarioSwimGfx::     INCBIN "gfx/wario/swim.2bpp"
WarioLadderGfx::   INCBIN "gfx/wario/ladder.2bpp"
WarioThrowGfx::    INCBIN "gfx/wario/throw.2bpp"
WarioAirborneGfx:: INCBIN "gfx/wario/airborne.2bpp"


SECTION "Framesets 1", ROMX

INCLUDE "gfx/framesets1.asm"


SECTION "Bank 6", ROMX

INCLUDE "engine/bank6.asm"


SECTION "Bank 7", ROMX

INCLUDE "engine/bank7.asm"


SECTION "Bank 8", ROMX

INCLUDE "engine/bank8.asm"


SECTION "Bank 9", ROMX

WarioHotGfx::      INCBIN "gfx/wario/hot.2bpp"
WarioBurntGfx::    INCBIN "gfx/wario/burnt.2bpp"
WarioSlideGfx::    INCBIN "gfx/wario/slide.2bpp"
WarioStringGfx::   INCBIN "gfx/wario/string.2bpp"
WarioFatGfx::      INCBIN "gfx/wario/fat.2bpp"
WarioElectricGfx:: INCBIN "gfx/wario/electric.2bpp"
WarioPuffyGfx::    INCBIN "gfx/wario/puffy.2bpp"


SECTION "Bank A", ROMX

INCLUDE "engine/banka.asm"


SECTION "Bank B", ROMX

WarioZombieGfx::  INCBIN "gfx/wario/zombie.2bpp"
WarioBouncyGfx::  INCBIN "gfx/wario/bouncy.2bpp"
WarioCrazyGfx::   INCBIN "gfx/wario/crazy.2bpp"
WarioBatGfx::     INCBIN "gfx/wario/bat.2bpp"
WarioVampireGfx:: INCBIN "gfx/wario/vampire.2bpp"
WarioBubbleGfx::  INCBIN "gfx/wario/bubble.2bpp"
WarioUnk1Gfx::    INCBIN "gfx/wario/unk1.2bpp"
WarioHangGfx::    INCBIN "gfx/wario/hang.2bpp"


SECTION "Audio Engine", ROMX

INCLUDE "audio/engine.asm"


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

	INCROM $15c000, $15ee8d


SECTION "Bank 58", ROMX

INCLUDE "engine/bank58.asm"


SECTION "Bank 60", ROMX

	INCROM $180000, $181eb6


SECTION "Bank 61", ROMX

	INCROM $184000, $185ce5


SECTION "Bank 62", ROMX

	INCROM $188000, $18ac38


SECTION "Bank 63", ROMX

	INCROM $18c000, $18d07c


SECTION "Bank 64", ROMX

	INCROM $190000, $193134


SECTION "Bank 65", ROMX

	INCROM $194000, $196fa6


SECTION "Enemy Gfx 1", ROMX

SpearheadGfx::     INCBIN "gfx/enemies/spearhead.2bpp.lz"
UnusedFlowerGfx::  INCBIN "gfx/enemies/unused_flower.2bpp.lz"
MizuuoGfx::        INCBIN "gfx/enemies/mizuuo.2bpp.lz"
SilkyGfx::         INCBIN "gfx/enemies/silky.2bpp.lz"
SnakeGfx::         INCBIN "gfx/enemies/snake.2bpp.lz"
PrinceFroggyGfx::  INCBIN "gfx/enemies/prince_froggy.2bpp.lz"
MadSciensteinGfx:: INCBIN "gfx/enemies/mad_scienstein.2bpp.lz"
Sun1Gfx::          INCBIN "gfx/enemies/sun1.2bpp.lz"
Moon1Gfx::         INCBIN "gfx/enemies/moon1.2bpp.lz"
RoboMouse1Gfx::    INCBIN "gfx/enemies/robo_mouse1.2bpp.lz"
HaridamaGfx::      INCBIN "gfx/enemies/haridama.2bpp.lz"
OwlGfx::           INCBIN "gfx/enemies/owl.2bpp.lz"
StoveGfx::         INCBIN "gfx/enemies/stove.2bpp.lz"
WaterSparkGfx::    INCBIN "gfx/enemies/water_spark.2bpp.lz"


SECTION "Enemy Gfx 2", ROMX

WebberGfx::             INCBIN "gfx/enemies/webber.2bpp.lz"
CountRichtertoffenGfx:: INCBIN "gfx/enemies/count_richtertoffen.2bpp.lz"
ParaGoomGfx::           INCBIN "gfx/enemies/para_goom.2bpp.lz"
KushimushiGfx::         INCBIN "gfx/enemies/kushimushi.2bpp.lz"
BirdGfx::               INCBIN "gfx/enemies/bird.2bpp.lz"
ApplebyGfx::            INCBIN "gfx/enemies/appleby.2bpp.lz"
HammerBotGfx::          INCBIN "gfx/enemies/hammer_bot.2bpp.lz"
PneumoGfx::             INCBIN "gfx/enemies/pneumo.2bpp.lz"
Sun2Gfx::               INCBIN "gfx/enemies/sun2.2bpp.lz"
Moon2Gfx::              INCBIN "gfx/enemies/moon2.2bpp.lz"
RoboMouse2Gfx::         INCBIN "gfx/enemies/robo_mouse2.2bpp.lz"
ClearGate1Gfx::         INCBIN "gfx/enemies/clear_gate1.2bpp.lz"


SECTION "Enemy Gfx 3", ROMX

FutamoguGfx::    INCBIN "gfx/enemies/futamogu.2bpp.lz"
HebariiGfx::     INCBIN "gfx/enemies/hebarii.2bpp.lz"
DoughnuteerGfx:: INCBIN "gfx/enemies/doughnuteer.2bpp.lz"
BigLeafGfx::     INCBIN "gfx/enemies/big_leaf.2bpp.lz"
ZombieGfx::      INCBIN "gfx/enemies/zombie.2bpp.lz"
SpearBotGfx::    INCBIN "gfx/enemies/spear_bot.2bpp.lz"
OmodonGfx::      INCBIN "gfx/enemies/omodon.2bpp.lz"
KobattoGfx::     INCBIN "gfx/enemies/kobatto.2bpp.lz"
HandGfx::        INCBIN "gfx/enemies/hand.2bpp.lz"
BubbleGfx::      INCBIN "gfx/enemies/bubble.2bpp.lz"
CartGfx::        INCBIN "gfx/enemies/cart.2bpp.lz"
ZipLineGfx::     INCBIN "gfx/enemies/zip_line.2bpp.lz"
FlameBlockGfx::  INCBIN "gfx/enemies/flame_block.2bpp.lz"
ClearGate2Gfx::  INCBIN "gfx/enemies/clear_gate2.2bpp.lz"
TadpoleGfx::     INCBIN "gfx/enemies/tadpole.2bpp.lz"
RockGfx::        INCBIN "gfx/enemies/rock.2bpp.lz"
FireGfx::        INCBIN "gfx/enemies/fire.2bpp.lz"
WallCrackGfx::   INCBIN "gfx/enemies/wall_crack.2bpp.lz"


SECTION "Enemy Gfx 4", ROMX

TorchGfx::          INCBIN "gfx/enemies/torch.2bpp.lz"
FireBotGfx::        INCBIN "gfx/enemies/fire_bot.2bpp.lz"
BeamBotGfx::        INCBIN "gfx/enemies/beam_bot.2bpp.lz"
BarrelGfx::         INCBIN "gfx/enemies/barrel.2bpp.lz"
SmallLeafGfx::      INCBIN "gfx/enemies/small_leaf.2bpp.lz"
ElectricLampGfx::   INCBIN "gfx/enemies/electric_lamp.2bpp.lz"
TeruteruGfx::       INCBIN "gfx/enemies/teruteru.2bpp.lz"
OmodonmekaGfx::     INCBIN "gfx/enemies/omodonmeka.2bpp.lz"
BrrrBearGfx::       INCBIN "gfx/enemies/brrr_bear.2bpp.lz"
TogebaGfx::         INCBIN "gfx/enemies/togeba.2bpp.lz"
FallingSnowGfx::    INCBIN "gfx/enemies/falling_snow.2bpp.lz"
PillarPlatformGfx:: INCBIN "gfx/enemies/pillar_platform.2bpp.lz"
WaterDropGfx::      INCBIN "gfx/enemies/water_drop.2bpp.lz"
NobiiruGfx::        INCBIN "gfx/enemies/nobiiru.2bpp.lz"
ClearGate3Gfx::     INCBIN "gfx/enemies/clear_gate3.2bpp.lz"
OctohonGfx::        INCBIN "gfx/enemies/octohon.2bpp.lz"
SparkGfx::          INCBIN "gfx/enemies/spark.2bpp.lz"


SECTION "Enemy Gfx 5", ROMX

Anonster1Gfx::    INCBIN "gfx/enemies/anonster1.2bpp.lz"
DollBoy1Gfx::     INCBIN "gfx/enemies/doll_boy1.2bpp.lz"
Wormwould1Gfx::   INCBIN "gfx/enemies/wormwould1_matching.2bpp.lz"
YellowBelly1Gfx:: INCBIN "gfx/enemies/yellow_belly1.2bpp.lz"
Pesce1Gfx::       INCBIN "gfx/enemies/pesce1.2bpp.lz"
Scowler1Gfx::     INCBIN "gfx/enemies/scowler1.2bpp.lz"
Jamano1Gfx::      INCBIN "gfx/enemies/jamano1.2bpp.lz"
Muddee1Gfx::      INCBIN "gfx/enemies/muddee1.2bpp.lz"
Wolfenboss1Gfx::  INCBIN "gfx/enemies/wolfenboss1.2bpp.lz"
Shoot1Gfx::       INCBIN "gfx/enemies/shoot1.2bpp.lz"


SECTION "Enemy Gfx 6", ROMX

Anonster2Gfx::    INCBIN "gfx/enemies/anonster2_matching.2bpp.lz"
DollBoy2Gfx::     INCBIN "gfx/enemies/doll_boy2.2bpp.lz"
Wormwould2Gfx::   INCBIN "gfx/enemies/wormwould2.2bpp.lz"
YellowBelly2Gfx:: INCBIN "gfx/enemies/yellow_belly2.2bpp.lz"
Pesce2Gfx::       INCBIN "gfx/enemies/pesce2.2bpp.lz"
Scowler2Gfx::     INCBIN "gfx/enemies/scowler2_matching.2bpp.lz"
Jamano2Gfx::      INCBIN "gfx/enemies/jamano2.2bpp.lz"
Muddee2Gfx::      INCBIN "gfx/enemies/muddee2_matching.2bpp.lz"
Wolfenboss2Gfx::  INCBIN "gfx/enemies/wolfenboss2.2bpp.lz"
Shoot2Gfx::       INCBIN "gfx/enemies/shoot2.2bpp.lz"


SECTION "Enemy Gfx 7", ROMX

Anonster3Gfx::    INCBIN "gfx/enemies/anonster3.2bpp.lz"
DollBoy3Gfx::     INCBIN "gfx/enemies/doll_boy3.2bpp.lz"
Wormwould3Gfx::   INCBIN "gfx/enemies/wormwould3.2bpp.lz"
YellowBelly3Gfx:: INCBIN "gfx/enemies/yellow_belly3.2bpp.lz"
Pesce3Gfx::       INCBIN "gfx/enemies/pesce3.2bpp.lz"
Scowler3Gfx::     INCBIN "gfx/enemies/scowler3.2bpp.lz"
Jamano3Gfx::      INCBIN "gfx/enemies/jamano3.2bpp.lz"
Muddee3Gfx::      INCBIN "gfx/enemies/muddee3.2bpp.lz"
Wolfenboss3Gfx::  INCBIN "gfx/enemies/wolfenboss3.2bpp.lz"
Shoot3Gfx::       INCBIN "gfx/enemies/shoot3.2bpp.lz"


SECTION "Enemy Gfx 8", ROMX

Anonster4Gfx::    INCBIN "gfx/enemies/anonster4.2bpp.lz"
DollBoy4Gfx::     INCBIN "gfx/enemies/doll_boy4.2bpp.lz"
Wormwould4Gfx::   INCBIN "gfx/enemies/wormwould4.2bpp.lz"
YellowBelly4Gfx:: INCBIN "gfx/enemies/yellow_belly4.2bpp.lz"
Pesce4Gfx::       INCBIN "gfx/enemies/pesce4.2bpp.lz"
Scowler4Gfx::     INCBIN "gfx/enemies/scowler4.2bpp.lz"
Jamano4Gfx::      INCBIN "gfx/enemies/jamano4.2bpp.lz"
Muddee4Gfx::      INCBIN "gfx/enemies/muddee4.2bpp.lz"
Wolfenboss4Gfx::  INCBIN "gfx/enemies/wolfenboss4.2bpp.lz"
Shoot4Gfx::       INCBIN "gfx/enemies/shoot4.2bpp.lz"


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


SECTION "Bank 7A", ROMX

WarioSnowmanGfx::  INCBIN "gfx/wario/snowman.2bpp"
WarioSnowballGfx:: INCBIN "gfx/wario/snowball.2bpp"
WarioFanGfx::      INCBIN "gfx/wario/fan.2bpp"
WarioLaunchGfx::   INCBIN "gfx/wario/launch.2bpp"
WarioMagicGfx::    INCBIN "gfx/wario/magic.2bpp"
WarioBallGfx::     INCBIN "gfx/wario/ball.2bpp"


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
