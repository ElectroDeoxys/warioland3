SECTION "Bank 20", ROMX

INCLUDE "data/overworld/unlockable_connections.asm"
INCLUDE "engine/bank20.asm"


SECTION "Bank 21", ROMX

INCLUDE "engine/bank21.asm"


SECTION "Bank 22", ROMX

Overworld1Gfx:       INCBIN "gfx/overworld/overworld1.2bpp.rle"
Overworld2Gfx:       INCBIN "gfx/overworld/overworld2.2bpp.rle"
Overworld3Gfx:       INCBIN "gfx/overworld/overworld3.2bpp.rle"
Overworld4Gfx:       INCBIN "gfx/overworld/overworld4.2bpp.rle"
OverworldRocksGfx:   INCBIN "gfx/overworld/overworld_rocks.2bpp.rle"
OverworldCommonGfx:  INCBIN "gfx/overworld/overworld_common.2bpp.rle"
OverworldArrowsGfx:  INCBIN "gfx/overworld/overworld_arrows.2bpp.rle"
OverworldGlowGfx:    INCBIN "gfx/overworld/overworld_glow.2bpp.rle"
OverworldNumbersGfx: INCBIN "gfx/overworld/overworld_numbers.2bpp.rle"

DebugUnknownTextGfx: INCBIN "gfx/debug_unknown_text.2bpp"

	ds $2, $0


SECTION "Bank 23", ROMX

Overworld5Gfx:          INCBIN "gfx/overworld/overworld5.2bpp.rle"
OverworldThunderGfx:    INCBIN "gfx/overworld/overworld_thunder.2bpp.rle"
OverworldTowerGfx:      INCBIN "gfx/overworld/overworld_tower.2bpp.rle"
OverworldFanGfx:        INCBIN "gfx/overworld/overworld_fan.2bpp.rle"
OverworldExplosion1Gfx: INCBIN "gfx/overworld/overworld_explosion1.2bpp.rle"
Overworld6Gfx:          INCBIN "gfx/overworld/overworld6.2bpp.rle"
OverworldExplosion2Gfx: INCBIN "gfx/overworld/overworld_explosion2.2bpp.rle"
OverworldFireGfx:       INCBIN "gfx/overworld/overworld_fire.2bpp.rle"
OverworldTorchGfx:      INCBIN "gfx/overworld/overworld_torch.2bpp.rle"
OverworldExplosion3Gfx: INCBIN "gfx/overworld/overworld_explosion3.2bpp.rle"
OverworldSmokeGfx:      INCBIN "gfx/overworld/overworld_smoke.2bpp.rle"


SECTION "Bank 24", ROMX

LevelNamesJPGfx::
LevelNamesNorthJPGfx: INCBIN "gfx/gui/level_names_north_jp.2bpp"
LevelNamesWestJPGfx:  INCBIN "gfx/gui/level_names_west_jp.2bpp"
LevelNamesSouthJPGfx: INCBIN "gfx/gui/level_names_south_jp.2bpp"
LevelNamesEastJPGfx:  INCBIN "gfx/gui/level_names_east_jp.2bpp"


SECTION "Bank 25", ROMX

LevelNamesENGfx::
LevelNamesNorthENGfx: INCBIN "gfx/gui/level_names_north_en.2bpp"
LevelNamesWestENGfx:  INCBIN "gfx/gui/level_names_west_en.2bpp"
LevelNamesSouthENGfx: INCBIN "gfx/gui/level_names_south_en.2bpp"
LevelNamesEastENGfx:  INCBIN "gfx/gui/level_names_east_en.2bpp"


SECTION "Bank 26", ROMX

INCLUDE "engine/bank26.asm"


SECTION "Bank 27", ROMX

INCLUDE "engine/bank27.asm"


SECTION "Cutscenes Gfx 1", ROMX

Cutscenes1Gfx: INCBIN "gfx/cutscenes/cutscenes1.2bpp.rle"
Cutscenes2Gfx: INCBIN "gfx/cutscenes/cutscenes2.2bpp.rle"
Cutscenes3Gfx: INCBIN "gfx/cutscenes/cutscenes3.2bpp.rle"
Cutscenes4Gfx: INCBIN "gfx/cutscenes/cutscenes4.2bpp.rle"
Cutscenes5Gfx: INCBIN "gfx/cutscenes/cutscenes5.2bpp.rle"

	ds $932, $00


SECTION "Cutscenes Gfx 2", ROMX

Cutscenes6Gfx:  INCBIN "gfx/cutscenes/cutscenes6.2bpp.rle"
Cutscenes7Gfx:  INCBIN "gfx/cutscenes/cutscenes7.2bpp.rle"
Cutscenes8Gfx:  INCBIN "gfx/cutscenes/cutscenes8.2bpp.rle"
Cutscenes9Gfx:  INCBIN "gfx/cutscenes/cutscenes9.2bpp.rle"
Cutscenes10Gfx: INCBIN "gfx/cutscenes/cutscenes10.2bpp.rle"


SECTION "Bank 2A", ROMX

INCLUDE "engine/bank2a.asm"


SECTION "Bank 2B", ROMX

INCLUDE "engine/bank2b.asm"


SECTION "Bank 2C", ROMX

INCLUDE "engine/bank2c.asm"


SECTION "Bank 2D", ROMX

INCLUDE "engine/bank2d.asm"


SECTION "Cutscene Palettes", ROMX

INCLUDE "data/overworld/cutscene/palettes.asm"


SECTION "Cutscene BG Maps", ROMX

BGMap_b9100: INCBIN "gfx/bgmaps/map_b9100.tilemap.rle"
BGMap_b9113: INCBIN "gfx/bgmaps/map_b9113.attrmap.rle"

BGMap_b914a: INCBIN "gfx/bgmaps/map_b914a.tilemap.rle"
BGMap_b919b: INCBIN "gfx/bgmaps/map_b919b.attrmap.rle"

BGMap_b91e7: INCBIN "gfx/bgmaps/map_b91e7.tilemap.rle"
BGMap_b9235: INCBIN "gfx/bgmaps/map_b9235.attrmap.rle"

BGMap_b926d: INCBIN "gfx/bgmaps/map_b926d.tilemap.rle"
BGMap_b92c2: INCBIN "gfx/bgmaps/map_b92c2.attrmap.rle"

BGMap_b9310: INCBIN "gfx/bgmaps/map_b9310.tilemap.rle"
BGMap_b936c: INCBIN "gfx/bgmaps/map_b936c.attrmap.rle"

BGMap_b93c8: INCBIN "gfx/bgmaps/map_b93c8.tilemap.rle"
BGMap_b9424: INCBIN "gfx/bgmaps/map_b9424.attrmap.rle"

BGMap_b9475: INCBIN "gfx/bgmaps/map_b9475.tilemap.rle"
BGMap_b94d1: INCBIN "gfx/bgmaps/map_b94d1.attrmap.rle"

BGMap_b951f: INCBIN "gfx/bgmaps/map_b951f.tilemap.rle"
BGMap_b956d: INCBIN "gfx/bgmaps/map_b956d.attrmap.rle"

BGMap_b9635: INCBIN "gfx/bgmaps/map_b9635.tilemap.rle"
BGMap_b9691: INCBIN "gfx/bgmaps/map_b9691.attrmap.rle"

BGMap_b9768: INCBIN "gfx/bgmaps/map_b9768.tilemap.rle"
BGMap_b97c4: INCBIN "gfx/bgmaps/map_b97c4.attrmap.rle"

BGMap_b9816: INCBIN "gfx/bgmaps/map_b9816.tilemap.rle"
BGMap_b9859: INCBIN "gfx/bgmaps/map_b9859.attrmap.rle"

BGMap_b989c: INCBIN "gfx/bgmaps/map_b989c.tilemap.rle"
BGMap_b98d7: INCBIN "gfx/bgmaps/map_b98d7.attrmap.rle"

BGMap_b9920: INCBIN "gfx/bgmaps/map_b9920.tilemap.rle"
BGMap_b996e: INCBIN "gfx/bgmaps/map_b996e.attrmap.rle"

BGMap_b99aa: INCBIN "gfx/bgmaps/map_b99aa.tilemap.rle"
BGMap_b99e8: INCBIN "gfx/bgmaps/map_b99e8.attrmap.rle"

BGMap_b9a22: INCBIN "gfx/bgmaps/map_b9a22.tilemap.rle"
BGMap_b9a8c: INCBIN "gfx/bgmaps/map_b9a8c.attrmap.rle"

BGMap_b9ae0: INCBIN "gfx/bgmaps/map_b9ae0.tilemap.rle"
BGMap_b9b2d: INCBIN "gfx/bgmaps/map_b9b2d.attrmap.rle"

BGMap_b9b84: INCBIN "gfx/bgmaps/map_b9b84.tilemap.rle"
BGMap_b9be0: INCBIN "gfx/bgmaps/map_b9be0.attrmap.rle"

BGMap_b9c2c: INCBIN "gfx/bgmaps/map_b9c2c.tilemap.rle"
BGMap_b9c75: INCBIN "gfx/bgmaps/map_b9c75.attrmap.rle"

BGMap_b9cb8: INCBIN "gfx/bgmaps/map_b9cb8.tilemap.rle"
BGMap_b9d01: INCBIN "gfx/bgmaps/map_b9d01.attrmap.rle"

BGMap_b9d48: INCBIN "gfx/bgmaps/map_b9d48.tilemap.rle"
BGMap_b9da3: INCBIN "gfx/bgmaps/map_b9da3.attrmap.rle"

BGMap_b9dea: INCBIN "gfx/bgmaps/map_b9dea.tilemap.rle"
BGMap_b9e3b: INCBIN "gfx/bgmaps/map_b9e3b.attrmap.rle"

BGMap_b9e7b: INCBIN "gfx/bgmaps/map_b9e7b.tilemap.rle"
BGMap_b9ed5: INCBIN "gfx/bgmaps/map_b9ed5.attrmap.rle"

BGMap_b9f1e: INCBIN "gfx/bgmaps/map_b9f1e.tilemap.rle"
BGMap_b9f73: INCBIN "gfx/bgmaps/map_b9f73.attrmap.rle"

BGMap_b9fb1: INCBIN "gfx/bgmaps/map_b9fb1.tilemap.rle"
BGMap_b9fe6: INCBIN "gfx/bgmaps/map_b9fe6.attrmap.rle"

BGMap_ba02a: INCBIN "gfx/bgmaps/map_ba02a.tilemap.rle"
BGMap_ba07d: INCBIN "gfx/bgmaps/map_ba07d.attrmap.rle"

BGMap_ba0b4: INCBIN "gfx/bgmaps/map_ba0b4.tilemap.rle"
BGMap_ba0e6: INCBIN "gfx/bgmaps/map_ba0e6.attrmap.rle"

BGMap_ba143: INCBIN "gfx/bgmaps/map_ba143.tilemap.rle"
BGMap_ba19c: INCBIN "gfx/bgmaps/map_ba19c.attrmap.rle"

BGMap_ba221: INCBIN "gfx/bgmaps/map_ba221.tilemap.rle"
BGMap_ba286: INCBIN "gfx/bgmaps/map_ba286.attrmap.rle"

BGMap_ba31f: INCBIN "gfx/bgmaps/map_ba31f.tilemap.rle"
BGMap_ba37b: INCBIN "gfx/bgmaps/map_ba37b.attrmap.rle"

BGMap_ba3d3: INCBIN "gfx/bgmaps/map_ba3d3.tilemap.rle"
BGMap_ba425: INCBIN "gfx/bgmaps/map_ba425.attrmap.rle"

BGMap_ba46a: INCBIN "gfx/bgmaps/map_ba46a.tilemap.rle"
BGMap_ba4c4: INCBIN "gfx/bgmaps/map_ba4c4.attrmap.rle"

BGMap_ba544: INCBIN "gfx/bgmaps/map_ba544.tilemap.rle"
BGMap_ba5a0: INCBIN "gfx/bgmaps/map_ba5a0.attrmap.rle"

BGMap_ba5fd: INCBIN "gfx/bgmaps/map_ba5fd.tilemap.rle"
BGMap_ba64e: INCBIN "gfx/bgmaps/map_ba64e.attrmap.rle"

BGMap_ba685: INCBIN "gfx/bgmaps/map_ba685.tilemap.rle"
BGMap_ba6e1: INCBIN "gfx/bgmaps/map_ba6e1.attrmap.rle"

BGMap_ba740: INCBIN "gfx/bgmaps/map_ba740.tilemap.rle"
BGMap_ba79c: INCBIN "gfx/bgmaps/map_ba79c.attrmap.rle"

BGMap_ba7f9: INCBIN "gfx/bgmaps/map_ba7f9.tilemap.rle"
BGMap_ba82d: INCBIN "gfx/bgmaps/map_ba82d.attrmap.rle"

BGMap_ba865: INCBIN "gfx/bgmaps/map_ba865.tilemap.rle"
BGMap_ba8a6: INCBIN "gfx/bgmaps/map_ba8a6.attrmap.rle"

BGMap_ba8d2: INCBIN "gfx/bgmaps/map_ba8d2.tilemap.rle"
BGMap_ba925: INCBIN "gfx/bgmaps/map_ba925.attrmap.rle"

BGMap_ba958: INCBIN "gfx/bgmaps/map_ba958.tilemap.rle"
BGMap_ba9b4: INCBIN "gfx/bgmaps/map_ba9b4.attrmap.rle"

BGMap_baa12: INCBIN "gfx/bgmaps/map_baa12.tilemap.rle"
BGMap_baa6e: INCBIN "gfx/bgmaps/map_baa6e.attrmap.rle"


SECTION "Bank 2F", ROMX

INCLUDE "engine/bank2f.asm"


SECTION "Bank 56", ROMX

INCLUDE "engine/bank56.asm"


SECTION "Bank 57", ROMX

INCLUDE "engine/bank57.asm"


SECTION "Bank 76", ROMX

INCLUDE "engine/bank76.asm"
