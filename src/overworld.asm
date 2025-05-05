SECTION "Bank 20", ROMX

INCLUDE "data/overworld/unlockable_connections.asm"
INCLUDE "engine/bank20.asm"


SECTION "Bank 21", ROMX

INCLUDE "engine/bank21.asm"


SECTION "Bank 22", ROMX

Overworld1Gfx: INCBIN "gfx/overworld/overworld1.2bpp.rle"
Overworld2Gfx: INCBIN "gfx/overworld/overworld2.2bpp.rle"
Overworld3Gfx: INCBIN "gfx/overworld/overworld3.2bpp.rle"
Overworld4Gfx: INCBIN "gfx/overworld/overworld4.2bpp.rle"
OverworldRocksGfx: INCBIN "gfx/overworld/overworld_rocks.2bpp.rle"
OverworldCommonGfx: INCBIN "gfx/overworld/overworld_common.2bpp.rle"
OverworldArrowsGfx: INCBIN "gfx/overworld/overworld_arrows.2bpp.rle"
OverworldGlowGfx: INCBIN "gfx/overworld/overworld_glow.2bpp.rle"
OverworldNumbersGfx: INCBIN "gfx/overworld/overworld_numbers.2bpp.rle"

DebugUnknownTextGfx: INCBIN "gfx/debug_unknown_text.2bpp"

	ds $2, $0


SECTION "Bank 23", ROMX

Overworld5Gfx: INCBIN "gfx/overworld/overworld5.2bpp.rle"
OverworldThunderGfx: INCBIN "gfx/overworld/overworld_thunder.2bpp.rle"
OverworldTowerGfx: INCBIN "gfx/overworld/overworld_tower.2bpp.rle"
OverworldFanGfx: INCBIN "gfx/overworld/overworld_fan.2bpp.rle"
OverworldExplosion1Gfx: INCBIN "gfx/overworld/overworld_explosion1.2bpp.rle"
Overworld6Gfx: INCBIN "gfx/overworld/overworld6.2bpp.rle"
OverworldExplosion2Gfx: INCBIN "gfx/overworld/overworld_explosion2.2bpp.rle"
OverworldFireGfx: INCBIN "gfx/overworld/overworld_fire.2bpp.rle"
OverworldTorchGfx: INCBIN "gfx/overworld/overworld_torch.2bpp.rle"
OverworldExplosion3Gfx: INCBIN "gfx/overworld/overworld_explosion3.2bpp.rle"
OverworldSmokeGfx: INCBIN "gfx/overworld/overworld_smoke.2bpp.rle"


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

Cutscenes6Gfx: INCBIN "gfx/cutscenes/cutscenes6.2bpp.rle"
Cutscenes7Gfx: INCBIN "gfx/cutscenes/cutscenes7.2bpp.rle"
Cutscenes8Gfx: INCBIN "gfx/cutscenes/cutscenes8.2bpp.rle"
Cutscenes9Gfx: INCBIN "gfx/cutscenes/cutscenes9.2bpp.rle"
Cutscenes10Gfx: INCBIN "gfx/cutscenes/cutscenes10.2bpp.rle"


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


SECTION "Bank 56", ROMX

INCLUDE "engine/bank56.asm"


SECTION "Bank 57", ROMX

INCLUDE "engine/bank57.asm"


SECTION "Bank 76", ROMX

INCLUDE "engine/bank76.asm"
