SECTION "Golf Gfx 1", ROMX

INCLUDE "engine/bank70.asm"


SECTION "Golf Levels", ROMX

INCLUDE "data/golf/levels.asm"


SECTION "Golf Gfx 2", ROMX

WarioGolfMissGfx:: INCBIN "gfx/wario/golf_miss.2bpp"

GolfBuildingCourseScrollingAttrmap: INCBIN "data/bgmaps/golf_building_course_scrolling.attrmap"

GolfBuildingCourse1Tilemap: INCBIN "data/bgmaps/golf_building_course_1.tilemap"
GolfBuildingCourse2Tilemap: INCBIN "data/bgmaps/golf_building_course_2.tilemap"
GolfBuildingCourse3Tilemap: INCBIN "data/bgmaps/golf_building_course_3.tilemap"
GolfBuildingCourse4Tilemap: INCBIN "data/bgmaps/golf_building_course_4.tilemap"

GolfBuildingCoursesLockedTilemap:   INCBIN "data/bgmaps/golf_building_courses_locked.tilemap.rle"
GolfBuildingCoursesUnlockedTilemap: INCBIN "data/bgmaps/golf_building_courses_unlocked.tilemap.rle"
GolfBuildingCoursesAttrmap:         INCBIN "data/bgmaps/golf_building_courses.attrmap.rle"

GolfLobbyGfx: INCBIN "gfx/golf/golf_lobby.2bpp.rle"

GolfLobbyTilemap: INCBIN "data/bgmaps/golf_lobby.tilemap.rle"
GolfLobbyAttrmap: INCBIN "data/bgmaps/golf_lobby.attrmap.rle"

GolfClearTilemap: INCBIN "data/bgmaps/golf_clear.tilemap.rle"
GolfClearAttrmap: INCBIN "data/bgmaps/golf_clear.attrmap.rle"


SECTION "Bank 72", ROMX

INCLUDE "engine/golf/lobby.asm"
INCLUDE "engine/golf/building.asm"
INCLUDE "engine/golf/level.asm"
INCLUDE "gfx/pals/golf.asm"

GolfFlagNumbersGfx:   INCBIN "gfx/golf/golf_flag_numbers.2bpp"
GolfParNumbersGfx:    INCBIN "gfx/golf/golf_par_numbers.2bpp"
GolfStrokeNumbersGfx: INCBIN "gfx/golf/golf_stroke_numbers.2bpp"
GolfHoleFlagGfx:      INCBIN "gfx/golf/golf_hole_flag.2bpp"
UnusedGolfFlagGfx:    INCBIN "gfx/golf/unused_golf_flag.2bpp" ; unreferenced

INCLUDE "gfx/golf/oam.asm"
