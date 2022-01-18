INCLUDE "constants.asm"


SECTION "Golf Gfx 1", ROMX

INCLUDE "engine/bank70.asm"


SECTION "Golf Levels", ROMX

INCLUDE "data/golf/levels.asm"


SECTION "Golf Gfx 2", ROMX

WarioGolfMiss:: INCBIN "gfx/wario/golf_miss.2bpp"

BGMaps_1c4800: INCBIN "gfx/bgmaps/map_1c4800.bin"
BGMaps_1c48e0: INCBIN "gfx/bgmaps/map_1c48e0.bin"
BGMaps_1c49c0: INCBIN "gfx/bgmaps/map_1c49c0.bin"
BGMaps_1c4aa0: INCBIN "gfx/bgmaps/map_1c4aa0.bin"
BGMaps_1c4b80: INCBIN "gfx/bgmaps/map_1c4b80.bin"

BGMaps_1c4c60: INCBIN "gfx/bgmaps/map_1c4c60.bin"
BGMaps_1c4d83: INCBIN "gfx/bgmaps/map_1c4d83.bin"

BGMaps_1c4ea8: INCBIN "gfx/bgmaps/map_1c4ea8.bin"

GolfLobbyGfx: INCBIN "gfx/golf/golf_lobby.2bpp.lz"

BGMaps_1c5b4e: INCBIN "gfx/bgmaps/map_1c5b4e.bin"
BGMaps_1c5cbe: INCBIN "gfx/bgmaps/map_1c5cbe.bin"

BGMaps_1c5d6c: INCBIN "gfx/bgmaps/map_1c5d6c.bin"
BGMaps_1c5dc6: INCBIN "gfx/bgmaps/map_1c5dc6.bin"


SECTION "Bank 72", ROMX

INCLUDE "engine/golf/lobby.asm"
INCLUDE "engine/golf/building.asm"
INCLUDE "engine/golf/level.asm"
INCLUDE "gfx/pals/golf.asm"

GolfFlagNumbersGfx:   INCBIN "gfx/golf/golf_flag_numbers.2bpp"
GolfParNumbersGfx:    INCBIN "gfx/golf/golf_par_numbers.2bpp"
GolfStrokeNumbersGfx: INCBIN "gfx/golf/golf_stroke_numbers.2bpp"
GolfHoleFlagGfx:      INCBIN "gfx/golf/golf_hole_flag.2bpp"

	INCROM $1ca66f, $1ca6cf

INCLUDE "gfx/golf/oam.asm"
