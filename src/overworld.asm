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

Cutscene01Tilemap: INCBIN "data/bgmaps/cutscene_01.tilemap.rle"
Cutscene01Attrmap: INCBIN "data/bgmaps/cutscene_01.attrmap.rle"

Cutscene02Tilemap: INCBIN "data/bgmaps/cutscene_02.tilemap.rle"
Cutscene02Attrmap: INCBIN "data/bgmaps/cutscene_02.attrmap.rle"

Cutscene03Tilemap: INCBIN "data/bgmaps/cutscene_03.tilemap.rle"
Cutscene03Attrmap: INCBIN "data/bgmaps/cutscene_03.attrmap.rle"

Cutscene04Tilemap: INCBIN "data/bgmaps/cutscene_04.tilemap.rle"
Cutscene04Attrmap: INCBIN "data/bgmaps/cutscene_04.attrmap.rle"

Cutscene05Tilemap: INCBIN "data/bgmaps/cutscene_05.tilemap.rle"
Cutscene05Attrmap: INCBIN "data/bgmaps/cutscene_05.attrmap.rle"

Cutscene06Tilemap: INCBIN "data/bgmaps/cutscene_06.tilemap.rle"
Cutscene06Attrmap: INCBIN "data/bgmaps/cutscene_06.attrmap.rle"

Cutscene07Tilemap: INCBIN "data/bgmaps/cutscene_07.tilemap.rle"
Cutscene07Attrmap: INCBIN "data/bgmaps/cutscene_07.attrmap.rle"

Cutscene08Tilemap: INCBIN "data/bgmaps/cutscene_08.tilemap.rle"
Cutscene08Attrmap: INCBIN "data/bgmaps/cutscene_08.attrmap.rle"

Cutscene09Tilemap: INCBIN "data/bgmaps/cutscene_09.tilemap.rle"
Cutscene09Attrmap: INCBIN "data/bgmaps/cutscene_09.attrmap.rle"

Cutscene10Tilemap: INCBIN "data/bgmaps/cutscene_10.tilemap.rle"
Cutscene10Attrmap: INCBIN "data/bgmaps/cutscene_10.attrmap.rle"

Cutscene11Tilemap: INCBIN "data/bgmaps/cutscene_11.tilemap.rle"
Cutscene11Attrmap: INCBIN "data/bgmaps/cutscene_11.attrmap.rle"

Cutscene12Tilemap: INCBIN "data/bgmaps/cutscene_12.tilemap.rle"
Cutscene12Attrmap: INCBIN "data/bgmaps/cutscene_12.attrmap.rle"

Cutscene13Tilemap: INCBIN "data/bgmaps/cutscene_13.tilemap.rle"
Cutscene13Attrmap: INCBIN "data/bgmaps/cutscene_13.attrmap.rle"

Cutscene14Tilemap: INCBIN "data/bgmaps/cutscene_14.tilemap.rle"
Cutscene14Attrmap: INCBIN "data/bgmaps/cutscene_14.attrmap.rle"

Cutscene15Tilemap: INCBIN "data/bgmaps/cutscene_15.tilemap.rle"
Cutscene15Attrmap: INCBIN "data/bgmaps/cutscene_15.attrmap.rle"

Cutscene16Tilemap: INCBIN "data/bgmaps/cutscene_16.tilemap.rle"
Cutscene16Attrmap: INCBIN "data/bgmaps/cutscene_16.attrmap.rle"

Cutscene17Tilemap: INCBIN "data/bgmaps/cutscene_17.tilemap.rle"
Cutscene17Attrmap: INCBIN "data/bgmaps/cutscene_17.attrmap.rle"

Cutscene18Tilemap: INCBIN "data/bgmaps/cutscene_18.tilemap.rle"
Cutscene18Attrmap: INCBIN "data/bgmaps/cutscene_18.attrmap.rle"

Cutscene19Tilemap: INCBIN "data/bgmaps/cutscene_19.tilemap.rle"
Cutscene19Attrmap: INCBIN "data/bgmaps/cutscene_19.attrmap.rle"

Cutscene20Tilemap: INCBIN "data/bgmaps/cutscene_20.tilemap.rle"
Cutscene20Attrmap: INCBIN "data/bgmaps/cutscene_20.attrmap.rle"

Cutscene21Tilemap: INCBIN "data/bgmaps/cutscene_21.tilemap.rle"
Cutscene21Attrmap: INCBIN "data/bgmaps/cutscene_21.attrmap.rle"

Cutscene22Tilemap: INCBIN "data/bgmaps/cutscene_22.tilemap.rle"
Cutscene22Attrmap: INCBIN "data/bgmaps/cutscene_22.attrmap.rle"

Cutscene23Tilemap: INCBIN "data/bgmaps/cutscene_23.tilemap.rle"
Cutscene23Attrmap: INCBIN "data/bgmaps/cutscene_23.attrmap.rle"

Cutscene24Tilemap: INCBIN "data/bgmaps/cutscene_24.tilemap.rle"
Cutscene24Attrmap: INCBIN "data/bgmaps/cutscene_24.attrmap.rle"

Cutscene25Tilemap: INCBIN "data/bgmaps/cutscene_25.tilemap.rle"
Cutscene25Attrmap: INCBIN "data/bgmaps/cutscene_25.attrmap.rle"

Cutscene26Tilemap: INCBIN "data/bgmaps/cutscene_26.tilemap.rle"
Cutscene26Attrmap: INCBIN "data/bgmaps/cutscene_26.attrmap.rle"

Cutscene27Tilemap: INCBIN "data/bgmaps/cutscene_27.tilemap.rle"
Cutscene27Attrmap: INCBIN "data/bgmaps/cutscene_27.attrmap.rle"

Cutscene28Tilemap: INCBIN "data/bgmaps/cutscene_28.tilemap.rle"
Cutscene28Attrmap: INCBIN "data/bgmaps/cutscene_28.attrmap.rle"

Cutscene29Tilemap: INCBIN "data/bgmaps/cutscene_29.tilemap.rle"
Cutscene29Attrmap: INCBIN "data/bgmaps/cutscene_29.attrmap.rle"

Cutscene30Tilemap: INCBIN "data/bgmaps/cutscene_30.tilemap.rle"
Cutscene30Attrmap: INCBIN "data/bgmaps/cutscene_30.attrmap.rle"

Cutscene31Tilemap: INCBIN "data/bgmaps/cutscene_31.tilemap.rle"
Cutscene31Attrmap: INCBIN "data/bgmaps/cutscene_31.attrmap.rle"

Cutscene32Tilemap: INCBIN "data/bgmaps/cutscene_32.tilemap.rle"
Cutscene32Attrmap: INCBIN "data/bgmaps/cutscene_32.attrmap.rle"

Cutscene33Tilemap: INCBIN "data/bgmaps/cutscene_33.tilemap.rle"
Cutscene33Attrmap: INCBIN "data/bgmaps/cutscene_33.attrmap.rle"

Cutscene34Tilemap: INCBIN "data/bgmaps/cutscene_34.tilemap.rle"
Cutscene34Attrmap: INCBIN "data/bgmaps/cutscene_34.attrmap.rle"

Cutscene35Tilemap: INCBIN "data/bgmaps/cutscene_35.tilemap.rle"
Cutscene35Attrmap: INCBIN "data/bgmaps/cutscene_35.attrmap.rle"

Cutscene36Tilemap: INCBIN "data/bgmaps/cutscene_36.tilemap.rle"
Cutscene36Attrmap: INCBIN "data/bgmaps/cutscene_36.attrmap.rle"

Cutscene37Tilemap: INCBIN "data/bgmaps/cutscene_37.tilemap.rle"
Cutscene37Attrmap: INCBIN "data/bgmaps/cutscene_37.attrmap.rle"

Cutscene38Tilemap: INCBIN "data/bgmaps/cutscene_38.tilemap.rle"
Cutscene38Attrmap: INCBIN "data/bgmaps/cutscene_38.attrmap.rle"

Cutscene39Tilemap: INCBIN "data/bgmaps/cutscene_39.tilemap.rle"
Cutscene39Attrmap: INCBIN "data/bgmaps/cutscene_39.attrmap.rle"

Cutscene40Tilemap: INCBIN "data/bgmaps/cutscene_40.tilemap.rle"
Cutscene40Attrmap: INCBIN "data/bgmaps/cutscene_40.attrmap.rle"


SECTION "Bank 2F", ROMX

INCLUDE "engine/bank2f.asm"


SECTION "Bank 56", ROMX

INCLUDE "engine/bank56.asm"


SECTION "Bank 57", ROMX

INCLUDE "engine/bank57.asm"


SECTION "Bank 76", ROMX

INCLUDE "engine/bank76.asm"
