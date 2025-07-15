SECTION "Bank 20", ROMX

INCLUDE "data/overworld/unlockable_connections.asm"
INCLUDE "data/overworld/level_coordinates.asm"
INCLUDE "data/overworld/paths.asm"
INCLUDE "engine/overworld/crayon_flags.asm"
INCLUDE "engine/overworld/day_night.asm"
INCLUDE "engine/overworld/state_table.asm"
INCLUDE "engine/overworld/init.asm"
INCLUDE "engine/overworld/vblank.asm"
INCLUDE "engine/overworld/unreferenced_treasure_collection.asm"
INCLUDE "engine/overworld/cutscene/common.asm"
INCLUDE "engine/overworld/treasure_collection/common.asm"
INCLUDE "engine/overworld/best_times/common.asm"
INCLUDE "engine/overworld/temple/common.asm"
INCLUDE "engine/overworld/bank20.asm"


SECTION "Bank 21", ROMX

INCLUDE "data/overworld/palettes.asm"
INCLUDE "engine/overworld/bank21.asm"


SECTION "Bank 22", ROMX

Overworld1Gfx:       INCBIN "gfx/overworld/overworld1.2bpp.rle"
Overworld2Gfx:       INCBIN "gfx/overworld/overworld2.2bpp.rle"
Overworld3Gfx:       INCBIN "gfx/overworld/overworld3.2bpp.rle"
Overworld4Gfx:       INCBIN "gfx/overworld/overworld4.2bpp.rle"
OverworldRocksGfx:   INCBIN "gfx/overworld/rocks.2bpp.rle"
OverworldCommonGfx:  INCBIN "gfx/overworld/common.2bpp.rle"
OverworldArrowsGfx:  INCBIN "gfx/overworld/arrows.2bpp.rle"
OverworldGlowGfx:    INCBIN "gfx/overworld/glow.2bpp.rle"
OverworldNumbersGfx: INCBIN "gfx/overworld/numbers.2bpp.rle"

DebugUnknownTextGfx: INCBIN "gfx/debug_unknown_text.2bpp"

	ds $2, $0


SECTION "Bank 23", ROMX

Overworld5Gfx:          INCBIN "gfx/overworld/overworld5.2bpp.rle"
OverworldThunderGfx:    INCBIN "gfx/overworld/thunder.2bpp.rle"
OverworldTowerGfx:      INCBIN "gfx/overworld/tower.2bpp.rle"
OverworldFanGfx:        INCBIN "gfx/overworld/fan.2bpp.rle"
OverworldExplosion1Gfx: INCBIN "gfx/overworld/explosion1.2bpp.rle"
Overworld6Gfx:          INCBIN "gfx/overworld/overworld6.2bpp.rle"
OverworldExplosion2Gfx: INCBIN "gfx/overworld/explosion2.2bpp.rle"
OverworldFireGfx:       INCBIN "gfx/overworld/fire.2bpp.rle"
OverworldTorchGfx:      INCBIN "gfx/overworld/torch.2bpp.rle"
OverworldExplosion3Gfx: INCBIN "gfx/overworld/explosion3.2bpp.rle"
OverworldSmokeGfx:      INCBIN "gfx/overworld/smoke.2bpp.rle"


SECTION "Bank 24", ROMX

LevelNamesJPGfx::
LevelNamesNorthJPGfx: INCBIN "gfx/gui/level_names_north_jp.2bpp"
LevelNamesWestJPGfx:  INCBIN "gfx/gui/level_names_west_jp.2bpp"
LevelNamesSouthJPGfx: INCBIN "gfx/gui/level_names_south_jp.2bpp"
LevelNamesEastJPGfx:  INCBIN "gfx/gui/level_names_east_jp.2bpp"


SECTION "Bank 25", ROMX

LevelNamesENGfx:
LevelNamesNorthENGfx: INCBIN "gfx/gui/level_names_north_en.2bpp"
LevelNamesWestENGfx:  INCBIN "gfx/gui/level_names_west_en.2bpp"
LevelNamesSouthENGfx: INCBIN "gfx/gui/level_names_south_en.2bpp"
LevelNamesEastENGfx:  INCBIN "gfx/gui/level_names_east_en.2bpp"


SECTION "Bank 26", ROMX

INCLUDE "engine/overworld/bank26.asm"


SECTION "Bank 27", ROMX

INCLUDE "engine/overworld/bank27.asm"


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


SECTION "Overworld OAM 1", ROMX

INCLUDE "data/overworld/oam_1.asm"


SECTION "Bank 2B", ROMX

INCLUDE "engine/overworld/bank2b.asm"


SECTION "Temple/Prologue Gfx", ROMX

MusicBoxGfx:: INCBIN "gfx/music_box.2bpp"

TempleTilemap: INCBIN "data/overworld/bgmaps/temple.tilemap"
TempleAttrmap: INCBIN "data/overworld/bgmaps/temple.attrmap"
TempleGfx:     INCBIN "gfx/temple.2bpp"

PrologueBackgroundGfx:: INCBIN "gfx/cutscenes/prologue_background.2bpp"
PrologueGfx::           INCBIN "gfx/cutscenes/prologue.2bpp.rle"

TempleMusicBoxSceneGfx: INCBIN "gfx/temple_music_box_scene.2bpp.rle"


SECTION "Hidden Figure Text 1", ROMX

TextJP_HiddenFigureHeadFor:
INCBIN "text/jp/hidden_figure_head_for.tilemap.rle"

; unreferenced
Text_b2107:
	db "@グ@グ@グ@グ@グ@グ@グ@グ"
	db "ギグ:"

TextEN_HiddenFigureHeadFor:
INCBIN "text/en/hidden_figure_head_for.tilemap.rle"

; unreferenced
Text_b231c:
	db "@グ@グ@グ@グ@グ@グ@グ@グ"
	db "ギグ:"

TextJP_HiddenFigureReplenishPower:
INCBIN "text/jp/hidden_figure_replenish_power.tilemap.rle"

; unreferenced
Text_b2411:
	db "@グ@グ@グ@グ@グ@グ@グ@グ"
	db "ギグ:"

TextEN_HiddenFigureReplenishPower:
INCBIN "text/en/hidden_figure_replenish_power.tilemap.rle"

; unreferenced
Text_b2533:
	db "@グ@グ@グ@グ@グ@グ@グ@グ"
	db "ギグ:"


SECTION "OW BG Maps 1", ROMX

GolfBuildingTilemap: INCBIN "data/overworld/bgmaps/golf_building.tilemap.rle"
GolfBuildingAttrmap: INCBIN "data/overworld/bgmaps/golf_building.attrmap.rle"

BestTimeListGfx:     INCBIN "gfx/best_time_list.2bpp.rle"
BestTimeListTilemap: INCBIN "data/overworld/bgmaps/best_time_list.tilemap.rle"
BestTimeListAttrmap: INCBIN "data/overworld/bgmaps/best_time_list.attrmap.rle"

PrologueTilemap: INCBIN "data/overworld/bgmaps/prologue.tilemap.rle"
PrologueAttrmap: INCBIN "data/overworld/bgmaps/prologue.attrmap.rle"


SECTION "Hidden Figure Text 2", ROMX

TextJP_HiddenFigureAreYouAware:
INCBIN "text/jp/hidden_figure_are_you_aware.tilemap.rle"

; unreferenced
Text_b37e6:
	db "@グ@グ@グ@グ@グ@グ@グ@グ"
	db "ギグ:"

TextEN_HiddenFigureAreYouAware:
INCBIN "text/en/hidden_figure_are_you_aware.tilemap.rle"

; unreferenced
Text_b39f0:
	db "@グ@グ@グ@グ@グ@グ@グ@グ"
	db "ギグ:"


SECTION "OW BG Maps 2", ROMX

MusicBoxTilemap: INCBIN "data/overworld/bgmaps/music_box.tilemap.rle"
MusicBoxAttrmap: INCBIN "data/overworld/bgmaps/music_box.attrmap.rle"

HiddenFigureCutsceneTilemap: INCBIN "data/overworld/bgmaps/hidden_figure_cutscene.tilemap.rle"
HiddenFigureCutsceneAttrmap: INCBIN "data/overworld/bgmaps/hidden_figure_cutscene.attrmap.rle"


SECTION "Bank 2D", ROMX

INCLUDE "engine/overworld/bank2d.asm"


SECTION "Cutscene Palettes", ROMX

INCLUDE "data/overworld/cutscene/palettes.asm"


SECTION "Cutscene BG Maps", ROMX

Cutscene01Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_01.tilemap.rle"
Cutscene01Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_01.attrmap.rle"

Cutscene02Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_02.tilemap.rle"
Cutscene02Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_02.attrmap.rle"

Cutscene03Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_03.tilemap.rle"
Cutscene03Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_03.attrmap.rle"

Cutscene04Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_04.tilemap.rle"
Cutscene04Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_04.attrmap.rle"

Cutscene05Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_05.tilemap.rle"
Cutscene05Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_05.attrmap.rle"

Cutscene06Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_06.tilemap.rle"
Cutscene06Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_06.attrmap.rle"

Cutscene07Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_07.tilemap.rle"
Cutscene07Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_07.attrmap.rle"

Cutscene08Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_08.tilemap.rle"
Cutscene08Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_08.attrmap.rle"

Cutscene09Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_09.tilemap.rle"
Cutscene09Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_09.attrmap.rle"

Cutscene10Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_10.tilemap.rle"
Cutscene10Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_10.attrmap.rle"

Cutscene11Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_11.tilemap.rle"
Cutscene11Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_11.attrmap.rle"

Cutscene12Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_12.tilemap.rle"
Cutscene12Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_12.attrmap.rle"

Cutscene13Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_13.tilemap.rle"
Cutscene13Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_13.attrmap.rle"

Cutscene14Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_14.tilemap.rle"
Cutscene14Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_14.attrmap.rle"

Cutscene15Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_15.tilemap.rle"
Cutscene15Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_15.attrmap.rle"

Cutscene16Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_16.tilemap.rle"
Cutscene16Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_16.attrmap.rle"

Cutscene17Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_17.tilemap.rle"
Cutscene17Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_17.attrmap.rle"

Cutscene18Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_18.tilemap.rle"
Cutscene18Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_18.attrmap.rle"

Cutscene19Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_19.tilemap.rle"
Cutscene19Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_19.attrmap.rle"

Cutscene20Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_20.tilemap.rle"
Cutscene20Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_20.attrmap.rle"

Cutscene21Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_21.tilemap.rle"
Cutscene21Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_21.attrmap.rle"

Cutscene22Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_22.tilemap.rle"
Cutscene22Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_22.attrmap.rle"

Cutscene23Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_23.tilemap.rle"
Cutscene23Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_23.attrmap.rle"

Cutscene24Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_24.tilemap.rle"
Cutscene24Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_24.attrmap.rle"

Cutscene25Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_25.tilemap.rle"
Cutscene25Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_25.attrmap.rle"

Cutscene26Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_26.tilemap.rle"
Cutscene26Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_26.attrmap.rle"

Cutscene27Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_27.tilemap.rle"
Cutscene27Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_27.attrmap.rle"

Cutscene28Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_28.tilemap.rle"
Cutscene28Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_28.attrmap.rle"

Cutscene29Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_29.tilemap.rle"
Cutscene29Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_29.attrmap.rle"

Cutscene30Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_30.tilemap.rle"
Cutscene30Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_30.attrmap.rle"

Cutscene31Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_31.tilemap.rle"
Cutscene31Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_31.attrmap.rle"

Cutscene32Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_32.tilemap.rle"
Cutscene32Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_32.attrmap.rle"

Cutscene33Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_33.tilemap.rle"
Cutscene33Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_33.attrmap.rle"

Cutscene34Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_34.tilemap.rle"
Cutscene34Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_34.attrmap.rle"

Cutscene35Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_35.tilemap.rle"
Cutscene35Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_35.attrmap.rle"

Cutscene36Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_36.tilemap.rle"
Cutscene36Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_36.attrmap.rle"

Cutscene37Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_37.tilemap.rle"
Cutscene37Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_37.attrmap.rle"

Cutscene38Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_38.tilemap.rle"
Cutscene38Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_38.attrmap.rle"

Cutscene39Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_39.tilemap.rle"
Cutscene39Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_39.attrmap.rle"

Cutscene40Tilemap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_40.tilemap.rle"
Cutscene40Attrmap: INCBIN "data/overworld/cutscene/bgmaps/cutscene_40.attrmap.rle"


SECTION "Overworld OAM 2", ROMX

INCLUDE "data/overworld/oam_2.asm"


SECTION "Bank 56", ROMX

INCLUDE "engine/overworld/bank56.asm"


SECTION "Bank 76", ROMX

INCLUDE "engine/overworld/bank76.asm"


SECTION "Epilogue Gfx", ROMX

INCLUDE "data/overworld/epilogue/oam.asm"
INCLUDE "data/overworld/epilogue/framesets.asm"


SECTION "Bank 57", ROMX

OldMan2Gfx:      INCBIN "gfx/cutscenes/old_man2.2bpp"
EpilogueStarGfx: INCBIN "gfx/epilogue_star.2bpp"
OldMan1Gfx:      INCBIN "gfx/cutscenes/old_man1.2bpp"

EpilogueCrowdTilemap:          INCBIN "data/overworld/epilogue/bgmaps/epilogue_crowd.tilemap"
EpilogueCrowdAttrmap:          INCBIN "data/overworld/epilogue/bgmaps/epilogue_crowd.attrmap"
EpilogueGfx:                   INCBIN "gfx/epilogue.2bpp.rle"
EpilogueTransformationTilemap: INCBIN "data/overworld/epilogue/bgmaps/epilogue_transformation.tilemap.rle"
EpilogueTransformationAttrmap: INCBIN "data/overworld/epilogue/bgmaps/epilogue_transformation.attrmap.rle"

TextJP_OldManThankYou: INCBIN "text/jp/old_man_thank_you.tilemap.rle"

; unreferenced
Text_15e212:
	db "@グ@グ@グ@グ@グ@グ@グ@グ"
	db "ギグ:"

TextEN_OldManThankYou: INCBIN "text/en/old_man_thank_you.tilemap.rle"

; unreferenced
Text_15e437:
	db "@グ@グ@グ@グ@グ@グ@グ@グ"
	db "ギグ:"
