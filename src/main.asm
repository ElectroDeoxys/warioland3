SECTION "Main State Table", ROMX

INCLUDE "engine/main_state_table.asm"


SECTION "Common 1", ROMX

INCLUDE "engine/overworld/common.asm"
INCLUDE "engine/level/common.asm"
INCLUDE "engine/clear/common.asm"
INCLUDE "engine/pause/common.asm"
INCLUDE "engine/golf/common.asm"
INCLUDE "engine/epilogue/state_table.asm"
INCLUDE "engine/action_help/common.asm"
INCLUDE "engine/level/key_delay.asm"
INCLUDE "engine/credits/common.asm"
INCLUDE "engine/golf_building/common.asm"


SECTION "GB Incompatible", ROMX

INCLUDE "engine/gb_incompatible/state_table.asm"
INCLUDE "engine/gb_incompatible/core.asm"


SECTION "Common 2", ROMX

INCLUDE "engine/game_over/common.asm"
INCLUDE "engine/perfect/common.asm"


SECTION "Language Selection", ROMX

INCLUDE "engine/language_selection/state_table.asm"
INCLUDE "engine/language_selection/init.asm"
INCLUDE "engine/language_selection/core.asm"


SECTION "Print Counts", ROMX

INCLUDE "engine/print_counts.asm"
INCLUDE "engine/overworld/level_select.asm"


SECTION "Language Selection Gfx Engine", ROMX

INCLUDE "engine/language_selection/vblank.asm"
INCLUDE "engine/language_selection/load_oam.asm"


SECTION "Level Treasure Requirements", ROMX

INCLUDE "data/levels/treasure_requirements.asm"


SECTION "Wario Palettes", romx

INCLUDE "gfx/pals/wario.asm"


SECTION "Game Over", ROMX

INCLUDE "engine/game_over/state_table.asm"
INCLUDE "engine/game_over/core.asm"
INCLUDE "engine/game_over/load_gfx.asm"
INCLUDE "data/game_over/palettes.asm"

GameOverGfx:     INCBIN "gfx/game_over.2bpp.rle"
GameOverTilemap: INCBIN "data/bgmaps/game_over.tilemap.rle"
GameOverAttrmap: INCBIN "data/bgmaps/game_over.attrmap.rle"

INCLUDE "data/game_over/oam.asm"
INCLUDE "data/game_over/framesets.asm"


SECTION "Perfect", ROMX

INCLUDE "engine/perfect/state_table.asm"
INCLUDE "engine/perfect/core.asm"
INCLUDE "data/perfect/palettes.asm"

PerfectGfx:     INCBIN "gfx/perfect.2bpp.rle"
PerfectTilemap: INCBIN "data/bgmaps/perfect.tilemap.rle"
PerfectAttrmap: INCBIN "data/bgmaps/perfect.attrmap.rle"

INCLUDE "data/perfect/oam.asm"
INCLUDE "data/perfect/framesets.asm"


SECTION "Credits", ROMX

INCLUDE "engine/credits.asm"
INCLUDE "data/credits.asm"

CreditsPalsMap: INCBIN "gfx/pals/credits_pals_map.bin"


SECTION "Load Font", ROMX

INCLUDE "engine/load_font.asm"


SECTION "Font", ROMX

FontGfx:: INCBIN "gfx/font.2bpp.rle"


SECTION "GB Incompatible Gfx", ROMX

GBIncompatibleGfx:     INCBIN "gfx/gb_incompatible.2bpp.rle"
GBIncompatibleTilemap: INCBIN "data/bgmaps/gb_incompatible.tilemap.rle"
GBIncompatibleAttrmap: INCBIN "data/bgmaps/gb_incompatible.attrmap.rle" ; unreferenced


SECTION "Language Selection BG Maps", ROMX

LanguageSelection1TextMap:: INCBIN "data/bgmaps/text/language_selection1.tilemap"
LanguageSelection2TextMap:: INCBIN "data/bgmaps/text/language_selection2.tilemap"


SECTION "Action Help 1", ROMX

INCLUDE "engine/action_help/core.asm"
INCLUDE "engine/action_help/main_power_ups.asm"
INCLUDE "engine/action_help/power_ups/none.asm"
INCLUDE "engine/action_help/power_ups/lead_overalls.asm"
INCLUDE "engine/action_help/power_ups/swimming_flippers.asm"
INCLUDE "engine/action_help/power_ups/head_smash_helmet.asm"
INCLUDE "engine/action_help/power_ups/grab_gloves.asm"
INCLUDE "engine/action_help/power_ups/garlic.asm"
INCLUDE "engine/action_help/power_ups/super_jump_slam_overalls.asm"
INCLUDE "engine/action_help/power_ups/high_jump_boots.asm"
INCLUDE "engine/action_help/power_ups/prince_frogs_gloves.asm"
INCLUDE "engine/action_help/power_ups/super_grab_gloves.asm"
INCLUDE "engine/action_help/common1.asm"


SECTION "Action Help 2", ROMX

INCLUDE "engine/action_help/special_power_ups.asm"
INCLUDE "engine/action_help/power_ups/owl.asm"
INCLUDE "engine/action_help/power_ups/rail.asm"
INCLUDE "engine/action_help/power_ups/vampire.asm"
INCLUDE "engine/action_help/common2.asm"
INCLUDE "gfx/pals/action_help.asm"

ActionHelpHUDGfx:      INCBIN "gfx/misc/action_help_hud.2bpp.rle"
ActionHelpObjects1Gfx: INCBIN "gfx/misc/action_help_objects1.2bpp.rle"
ActionHelpObjects2Gfx: INCBIN "gfx/misc/action_help_objects2.2bpp.rle"

ActionHelpTilemap: INCBIN "data/bgmaps/action_help.tilemap.rle"
ActionHelpAttrmap: INCBIN "data/bgmaps/action_help.attrmap.rle"

INCLUDE "gfx/oam/action_help.asm"


SECTION "Epilogue Gfx", ROMX

INCLUDE "data/overworld/epilogue/oam.asm"
INCLUDE "data/overworld/epilogue/framesets.asm"


SECTION "Wario Gfx 1", ROMX

WarioIdleGfx::     INCBIN "gfx/wario/idle.2bpp"
WarioWalkGfx::     INCBIN "gfx/wario/walk.2bpp"
WarioDizzyGfx::    INCBIN "gfx/wario/dizzy.2bpp"
WarioAttackGfx::   INCBIN "gfx/wario/attack.2bpp"
WarioSwimGfx::     INCBIN "gfx/wario/swim.2bpp"
WarioLadderGfx::   INCBIN "gfx/wario/ladder.2bpp"
WarioThrowGfx::    INCBIN "gfx/wario/throw.2bpp"
WarioAirborneGfx:: INCBIN "gfx/wario/airborne.2bpp"


SECTION "Wario Gfx 2", ROMX

WarioHotGfx::      INCBIN "gfx/wario/hot.2bpp"
WarioBurntGfx::    INCBIN "gfx/wario/burnt.2bpp"
WarioSlideGfx::    INCBIN "gfx/wario/slide.2bpp"
WarioStringGfx::   INCBIN "gfx/wario/string.2bpp"
WarioFatGfx::      INCBIN "gfx/wario/fat.2bpp"
WarioElectricGfx:: INCBIN "gfx/wario/electric.2bpp"
WarioPuffyGfx::    INCBIN "gfx/wario/puffy.2bpp"


SECTION "Wario Gfx 3", ROMX

WarioZombieGfx::  INCBIN "gfx/wario/zombie.2bpp"
WarioBouncyGfx::  INCBIN "gfx/wario/bouncy.2bpp"
WarioCrazyGfx::   INCBIN "gfx/wario/crazy.2bpp"
WarioBatGfx::     INCBIN "gfx/wario/bat.2bpp"
WarioVampireGfx:: INCBIN "gfx/wario/vampire.2bpp"
WarioBubbleGfx::  INCBIN "gfx/wario/bubble.2bpp"
WarioClearGfx::   INCBIN "gfx/wario/clear.2bpp"
WarioHangGfx::    INCBIN "gfx/wario/hang.2bpp"


SECTION "Wario Gfx 4", ROMX

WarioSnowmanGfx::  INCBIN "gfx/wario/snowman.2bpp"
WarioSnowballGfx:: INCBIN "gfx/wario/snowball.2bpp"
WarioFanGfx::      INCBIN "gfx/wario/fan.2bpp"
WarioLaunchGfx::   INCBIN "gfx/wario/launch.2bpp"
WarioMagicGfx::    INCBIN "gfx/wario/magic.2bpp"
WarioBallGfx::     INCBIN "gfx/wario/ball.2bpp"


SECTION "Hidden Figure Gfx", ROMX

HiddenFigure1Gfx:: INCBIN "gfx/enemies/hidden_figure1.2bpp"
HiddenFigure2Gfx:: INCBIN "gfx/enemies/hidden_figure2.2bpp"

Pals_db000::
	rgb  1,  4,  9
	rgb 31,  0,  0
	rgb  6, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb  0, 30, 31
	rgb  6, 10, 10
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb  0, 31, 18
	rgb  6, 10, 10
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb 28, 20,  6
	rgb  6, 10, 10
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb  0, 11, 21
	rgb 31, 25,  0
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb 15,  0,  0
	rgb 31, 25,  0
	rgb  0,  0,  0

	rgb 31, 19, 23
	rgb 21,  8, 17
	rgb 12,  2,  6
	rgb  0,  0,  0

	rgb 27, 23, 11
	rgb 22, 13,  2
	rgb 13,  6,  1
	rgb  5,  2,  0

Pals_db040::
	rgb 21, 21, 21
	rgb 31, 31, 31
	rgb 31,  0,  0
	rgb  0,  0,  0

	rgb 21, 21, 21
	rgb  4, 24, 12
	rgb  4, 11, 12
	rgb  0,  0,  0

	rgb 21, 21, 21
	rgb 15,  0,  0
	rgb 31, 25,  0
	rgb  0,  0,  0

	rgb 21, 21, 21
	rgb 25, 10,  0
	rgb 31, 25,  0
	rgb  0,  0,  0

	rgb 21, 21, 21
	rgb  0, 21, 31
	rgb 31, 25,  0
	rgb  0,  0,  0

HiddenFigure1Map: INCBIN "data/bgmaps/hidden_figure1.tilemap.rle"
HiddenFigure2Map: INCBIN "data/bgmaps/hidden_figure1.attrmap.rle"
HiddenFigure3Map: INCBIN "data/bgmaps/hidden_figure2.tilemap.rle"
HiddenFigure4Map: INCBIN "data/bgmaps/hidden_figure2.attrmap.rle"


SECTION "Golf Gfx 1", ROMX

GolfGfx:     INCBIN "gfx/golf/golf.2bpp.rle"
GolfFlagGfx: INCBIN "gfx/golf/golf_flag.2bpp.rle"


SECTION "Golf Hole BGMaps", ROMX

GolfBackground1Tilemap: INCBIN "data/bgmaps/golf/background_1.tilemap.rle"
GolfBackground1Attrmap: INCBIN "data/bgmaps/golf/background_1.attrmap.rle"
GolfBackground2Tilemap: INCBIN "data/bgmaps/golf/background_2.tilemap.rle"
GolfBackground2Attrmap: INCBIN "data/bgmaps/golf/background_2.attrmap.rle"

GolfHole01_1Tilemap: INCBIN "data/golf/holes/01_1.tilemap.rle"
GolfHole01_1Attrmap: INCBIN "data/golf/holes/01_1.attrmap.rle"
GolfHole01_2Tilemap: INCBIN "data/golf/holes/01_2.tilemap.rle"
GolfHole01_2Attrmap: INCBIN "data/golf/holes/01_2.attrmap.rle"

GolfHole00_1Tilemap: INCBIN "data/golf/holes/00_1.tilemap.rle"
GolfHole00_1Attrmap: INCBIN "data/golf/holes/00_1.attrmap.rle"
GolfHole00_2Tilemap: INCBIN "data/golf/holes/00_2.tilemap.rle"
GolfHole00_2Attrmap: INCBIN "data/golf/holes/00_2.attrmap.rle"

GolfHole10_1Tilemap: INCBIN "data/golf/holes/10_1.tilemap.rle"
GolfHole10_1Attrmap: INCBIN "data/golf/holes/10_1.attrmap.rle"
GolfHole10_2Tilemap: INCBIN "data/golf/holes/10_2.tilemap.rle"
GolfHole10_2Attrmap: INCBIN "data/golf/holes/10_2.attrmap.rle"

GolfHole06_1Tilemap: INCBIN "data/golf/holes/06_1.tilemap.rle"
GolfHole06_1Attrmap: INCBIN "data/golf/holes/06_1.attrmap.rle"
GolfHole06_2Tilemap: INCBIN "data/golf/holes/06_2.tilemap.rle"
GolfHole06_2Attrmap: INCBIN "data/golf/holes/06_2.attrmap.rle"

GolfHole05_1Tilemap: INCBIN "data/golf/holes/05_1.tilemap.rle"
GolfHole05_1Attrmap: INCBIN "data/golf/holes/05_1.attrmap.rle"
GolfHole05_2Tilemap: INCBIN "data/golf/holes/05_2.tilemap.rle"
GolfHole05_2Attrmap: INCBIN "data/golf/holes/05_2.attrmap.rle"

GolfHole07_1Tilemap: INCBIN "data/golf/holes/07_1.tilemap.rle"
GolfHole07_1Attrmap: INCBIN "data/golf/holes/07_1.attrmap.rle"
GolfHole07_2Tilemap: INCBIN "data/golf/holes/07_2.tilemap.rle"
GolfHole07_2Attrmap: INCBIN "data/golf/holes/07_2.attrmap.rle"

GolfHole08_1Tilemap: INCBIN "data/golf/holes/08_1.tilemap.rle"
GolfHole08_1Attrmap: INCBIN "data/golf/holes/08_1.attrmap.rle"
GolfHole08_2Tilemap: INCBIN "data/golf/holes/08_2.tilemap.rle"
GolfHole08_2Attrmap: INCBIN "data/golf/holes/08_2.attrmap.rle"

GolfHole13_1Tilemap: INCBIN "data/golf/holes/13_1.tilemap.rle"
GolfHole13_1Attrmap: INCBIN "data/golf/holes/13_1.attrmap.rle"
GolfHole13_2Tilemap: INCBIN "data/golf/holes/13_2.tilemap.rle"
GolfHole13_2Attrmap: INCBIN "data/golf/holes/13_2.attrmap.rle"

GolfHole02_1Tilemap: INCBIN "data/golf/holes/02_1.tilemap.rle"
GolfHole02_1Attrmap: INCBIN "data/golf/holes/02_1.attrmap.rle"
GolfHole02_2Tilemap: INCBIN "data/golf/holes/02_2.tilemap.rle"
GolfHole02_2Attrmap: INCBIN "data/golf/holes/02_2.attrmap.rle"

GolfHole18_1Tilemap: INCBIN "data/golf/holes/18_1.tilemap.rle"
GolfHole18_1Attrmap: INCBIN "data/golf/holes/18_1.attrmap.rle"
GolfHole18_2Tilemap: INCBIN "data/golf/holes/18_2.tilemap.rle"
GolfHole18_2Attrmap: INCBIN "data/golf/holes/18_2.attrmap.rle"

GolfHole16_1Tilemap: INCBIN "data/golf/holes/16_1.tilemap.rle"
GolfHole16_1Attrmap: INCBIN "data/golf/holes/16_1.attrmap.rle"
GolfHole16_2Tilemap: INCBIN "data/golf/holes/16_2.tilemap.rle"
GolfHole16_2Attrmap: INCBIN "data/golf/holes/16_2.attrmap.rle"

GolfHole11_1Tilemap: INCBIN "data/golf/holes/11_1.tilemap.rle"
GolfHole11_1Attrmap: INCBIN "data/golf/holes/11_1.attrmap.rle"
GolfHole11_2Tilemap: INCBIN "data/golf/holes/11_2.tilemap.rle"
GolfHole11_2Attrmap: INCBIN "data/golf/holes/11_2.attrmap.rle"

GolfHole03_1Tilemap: INCBIN "data/golf/holes/03_1.tilemap.rle"
GolfHole03_1Attrmap: INCBIN "data/golf/holes/03_1.attrmap.rle"
GolfHole03_2Tilemap: INCBIN "data/golf/holes/03_2.tilemap.rle"
GolfHole03_2Attrmap: INCBIN "data/golf/holes/03_2.attrmap.rle"

GolfHole09_1Tilemap: INCBIN "data/golf/holes/09_1.tilemap.rle"
GolfHole09_1Attrmap: INCBIN "data/golf/holes/09_1.attrmap.rle"
GolfHole09_2Tilemap: INCBIN "data/golf/holes/09_2.tilemap.rle"
GolfHole09_2Attrmap: INCBIN "data/golf/holes/09_2.attrmap.rle"

GolfHole04_1Tilemap: INCBIN "data/golf/holes/04_1.tilemap.rle"
GolfHole04_1Attrmap: INCBIN "data/golf/holes/04_1.attrmap.rle"
GolfHole04_2Tilemap: INCBIN "data/golf/holes/04_2.tilemap.rle"
GolfHole04_2Attrmap: INCBIN "data/golf/holes/04_2.attrmap.rle"

GolfHole12_1Tilemap: INCBIN "data/golf/holes/12_1.tilemap.rle"
GolfHole12_1Attrmap: INCBIN "data/golf/holes/12_1.attrmap.rle"
GolfHole12_2Tilemap: INCBIN "data/golf/holes/12_2.tilemap.rle"
GolfHole12_2Attrmap: INCBIN "data/golf/holes/12_2.attrmap.rle"

GolfHole17_1Tilemap: INCBIN "data/golf/holes/17_1.tilemap.rle"
GolfHole17_1Attrmap: INCBIN "data/golf/holes/17_1.attrmap.rle"
GolfHole17_2Tilemap: INCBIN "data/golf/holes/17_2.tilemap.rle"
GolfHole17_2Attrmap: INCBIN "data/golf/holes/17_2.attrmap.rle"

GolfHole14_1Tilemap: INCBIN "data/golf/holes/14_1.tilemap.rle"
GolfHole14_1Attrmap: INCBIN "data/golf/holes/14_1.attrmap.rle"
GolfHole14_2Tilemap: INCBIN "data/golf/holes/14_2.tilemap.rle"
GolfHole14_2Attrmap: INCBIN "data/golf/holes/14_2.attrmap.rle"

GolfHole15_1Tilemap: INCBIN "data/golf/holes/15_1.tilemap.rle"
GolfHole15_1Attrmap: INCBIN "data/golf/holes/15_1.attrmap.rle"
GolfHole15_2Tilemap: INCBIN "data/golf/holes/15_2.tilemap.rle"
GolfHole15_2Attrmap: INCBIN "data/golf/holes/15_2.attrmap.rle"

GolfHole19_1Tilemap: INCBIN "data/golf/holes/19_1.tilemap.rle"
GolfHole19_1Attrmap: INCBIN "data/golf/holes/19_1.attrmap.rle"
GolfHole19_2Tilemap: INCBIN "data/golf/holes/19_2.tilemap.rle"
GolfHole19_2Attrmap: INCBIN "data/golf/holes/19_2.attrmap.rle"


SECTION "Golf Holes", ROMX

INCLUDE "data/golf/holes.asm"


SECTION "Golf Gfx 2", ROMX

WarioGolfMissGfx: INCBIN "gfx/wario/golf_miss.2bpp"

GolfBuildingCourseScrollingAttrmap: INCBIN "data/bgmaps/golf/building_course_scrolling.attrmap"

GolfBuildingCourse1Tilemap: INCBIN "data/bgmaps/golf/building_course_1.tilemap"
GolfBuildingCourse2Tilemap: INCBIN "data/bgmaps/golf/building_course_2.tilemap"
GolfBuildingCourse3Tilemap: INCBIN "data/bgmaps/golf/building_course_3.tilemap"
GolfBuildingCourse4Tilemap: INCBIN "data/bgmaps/golf/building_course_4.tilemap"

GolfBuildingCoursesLockedTilemap:   INCBIN "data/bgmaps/golf/building_courses_locked.tilemap.rle"
GolfBuildingCoursesUnlockedTilemap: INCBIN "data/bgmaps/golf/building_courses_unlocked.tilemap.rle"
GolfBuildingCoursesAttrmap:         INCBIN "data/bgmaps/golf/building_courses.attrmap.rle"

GolfLobbyGfx: INCBIN "gfx/golf/golf_lobby.2bpp.rle"

GolfLobbyTilemap: INCBIN "data/bgmaps/golf/lobby.tilemap.rle"
GolfLobbyAttrmap: INCBIN "data/bgmaps/golf/lobby.attrmap.rle"

GolfClearTilemap: INCBIN "data/bgmaps/golf/clear.tilemap.rle"
GolfClearAttrmap: INCBIN "data/bgmaps/golf/clear.attrmap.rle"


SECTION "Bank 72", ROMX

INCLUDE "engine/golf/lobby.asm"
INCLUDE "engine/golf/building.asm"
INCLUDE "engine/golf/hole.asm"
INCLUDE "gfx/pals/golf.asm"

GolfFlagNumbersGfx:   INCBIN "gfx/golf/golf_flag_numbers.2bpp"
GolfParNumbersGfx:    INCBIN "gfx/golf/golf_par_numbers.2bpp"
GolfStrokeNumbersGfx: INCBIN "gfx/golf/golf_stroke_numbers.2bpp"
GolfHoleFlagGfx:      INCBIN "gfx/golf/golf_hole_flag.2bpp"
UnusedGolfFlagGfx:    INCBIN "gfx/golf/unused_golf_flag.2bpp" ; unreferenced

INCLUDE "gfx/golf/oam.asm"


SECTION "Credits OAM", ROMX

INCLUDE "data/credits/oam.asm"
