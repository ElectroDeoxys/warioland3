SECTION "Main State Table", ROMX

INCLUDE "engine/main_state_table.asm"


SECTION "Common 1", ROMX

INCLUDE "engine/overworld/common.asm"
INCLUDE "engine/level/common.asm"
INCLUDE "engine/clear/common.asm"
INCLUDE "engine/pause/common.asm"
INCLUDE "engine/golf/common.asm"
INCLUDE "engine/overworld/epilogue/state_table.asm"
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


SECTION "Credits OAM", ROMX

INCLUDE "data/credits/oam.asm"
