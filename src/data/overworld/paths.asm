OWLevelPaths:
	dw .North
	dw .West
	dw .South
	dw .East

;   right,                           left,                           up,                         down
.North:
; OWNORTH_THE_TEMPLE
	db OW_NONE,                      OWNORTH_OUT_OF_THE_WOODS,       OW_NONE,                    OW_NONE
	db PATH_NONE,                    PATH_BEELINE,                   PATH_NONE,                  PATH_NONE

; OWNORTH_OUT_OF_THE_WOODS
	db OWNORTH_THE_TEMPLE,           OW_NONE,                        OW_NONE,                    OWNORTH_JUNCTION
	db PATH_BEELINE,                 PATH_NONE,                      PATH_NONE,                  PATH_BEELINE

; OWNORTH_THE_PEACEFUL_VILLAGE
	db OW_NONE,                      OW_EXIT_LEFT,                   OWNORTH_JUNCTION,           OW_NONE
	db PATH_NONE,                    PATH_BEELINE,                   PATH_BEELINE,               PATH_NONE

; OWNORTH_THE_VAST_PLAIN
	db OW_EXIT_RIGHT,                OWNORTH_JUNCTION,               OW_NONE,                    OWNORTH_BANK_OF_THE_WILD_RIVER
	db PATH_S_SHAPE,                 PATH_BEELINE,                   PATH_NONE,                  PATH_Y_THEN_X

; OWNORTH_BANK_OF_THE_WILD_RIVER
	db OWNORTH_THE_VAST_PLAIN,       OW_NONE,                        OW_NONE,                    OWNORTH_THE_TIDAL_COAST
	db PATH_X_THEN_Y,                PATH_NONE,                      PATH_NONE,                  PATH_Y_THEN_X

; OWNORTH_THE_TIDAL_COAST
	db OWNORTH_SEA_TURTLE_ROCKS,     OWNORTH_BANK_OF_THE_WILD_RIVER, OW_NONE,                    OW_NONE
	db PATH_BEELINE,                 PATH_X_THEN_Y,                  PATH_NONE,                  PATH_NONE

; OWNORTH_SEA_TURTLE_ROCKS
	db OW_NONE,                      OWNORTH_THE_TIDAL_COAST,        OW_NONE,                    OW_NONE
	db PATH_NONE,                    PATH_BEELINE,                   PATH_NONE,                  PATH_NONE

; OWNORTH_JUNCTION
	db OWNORTH_THE_VAST_PLAIN,       OW_NONE,                        OWNORTH_OUT_OF_THE_WOODS,   OWNORTH_THE_PEACEFUL_VILLAGE
	db PATH_BEELINE,                 PATH_NONE,                      PATH_BEELINE,               PATH_BEELINE

.West:
; OWWEST_DESERT_RUINS
	db OW_NONE,                      OW_EXIT_LEFT,                   OWWEST_THE_VOLCANOS_BASE,   OW_NONE
	db PATH_NONE,                    PATH_BEELINE,                   PATH_Y_THEN_X,              PATH_NONE

; OWWEST_THE_VOLCANOS_BASE
	db OW_NONE,                      OWWEST_DESERT_RUINS,            OWWEST_THE_WEST_CRATER,     OWWEST_THE_POOL_OF_RAIN
	db PATH_NONE,                    PATH_X_THEN_Y,                  PATH_Y_THEN_X,              PATH_Y_THEN_X

; OWWEST_THE_POOL_OF_RAIN
	db OWWEST_A_TOWN_IN_CHAOS,       OWWEST_THE_VOLCANOS_BASE,       OW_NONE,                    OWWEST_BENEATH_THE_WAVES
	db PATH_X_THEN_Y,                PATH_X_THEN_Y,                  PATH_NONE,                  PATH_BEELINE

; OWWEST_A_TOWN_IN_CHAOS
	db OW_NONE,                      OW_NONE,                        OW_EXIT_RIGHT,              OWWEST_THE_POOL_OF_RAIN
	db PATH_NONE,                    PATH_NONE,                      PATH_Y_THEN_X,              PATH_Y_THEN_X

; OWWEST_BENEATH_THE_WAVES
	db OW_NONE,                      OW_NONE,                        OWWEST_THE_POOL_OF_RAIN,    OW_NONE
	db PATH_NONE,                    PATH_NONE,                      PATH_BEELINE,               PATH_NONE

; OWWEST_THE_WEST_CRATER
	db OW_NONE,                      OWWEST_THE_VOLCANOS_BASE,       OW_NONE,                    OW_NONE
	db PATH_NONE,                    PATH_X_THEN_Y,                  PATH_NONE,                  PATH_NONE

.South:
; OWSOUTH_THE_GRASSLANDS
	db OWSOUTH_THE_BIG_BRIDGE,       OW_EXIT_LEFT,                   OW_NONE,                    OW_NONE
	db PATH_BEELINE,                 PATH_BEELINE,                   PATH_NONE,                  PATH_NONE

; OWSOUTH_THE_BIG_BRIDGE
	db OWSOUTH_TOWER_OF_REVIVAL,     OWSOUTH_THE_GRASSLANDS,         OWSOUTH_CAVE_OF_FLAMES,     OWSOUTH_THE_STEEP_CANYON
	db PATH_BEELINE,                 PATH_BEELINE,                   PATH_Y_THEN_X,              PATH_Y_THEN_X

; OWSOUTH_TOWER_OF_REVIVAL
	db OW_EXIT_RIGHT,                OWSOUTH_THE_BIG_BRIDGE,         OWSOUTH_ABOVE_THE_CLOUDS,   OW_NONE
	db PATH_BEELINE,                 PATH_BEELINE,                   PATH_Y_THEN_X,              PATH_NONE

; OWSOUTH_THE_STEEP_CANYON
	db OW_NONE,                      OWSOUTH_THE_BIG_BRIDGE,         OW_NONE,                    OW_NONE
	db PATH_NONE,                    PATH_X_THEN_Y,                  PATH_NONE,                  PATH_NONE

; OWSOUTH_CAVE_OF_FLAMES
	db OW_NONE,                      OWSOUTH_THE_BIG_BRIDGE,         OW_NONE,                    OW_NONE
	db PATH_NONE,                    PATH_X_THEN_Y,                  PATH_NONE,                  PATH_NONE

; OWSOUTH_ABOVE_THE_CLOUDS
	db OW_NONE,                      OWSOUTH_TOWER_OF_REVIVAL,       OW_NONE,                    OW_NONE
	db PATH_NONE,                    PATH_X_THEN_Y,                  PATH_NONE,                  PATH_NONE

.East:
; OWEAST_THE_STAGNANT_SWAMP
	db OW_NONE,                      OW_EXIT_LEFT,                   OWEAST_CASTLE_OF_ILLUSIONS, OWEAST_THE_FRIGID_SEA
	db PATH_NONE,                    PATH_BEELINE,                   PATH_Y_THEN_X,              PATH_Y_THEN_X

; OWEAST_THE_FRIGID_SEA
	db OW_NONE,                      OWEAST_THE_STAGNANT_SWAMP,      OWEAST_THE_COLOSSAL_HOLE,   OW_NONE
	db PATH_NONE,                    PATH_X_THEN_Y,                  PATH_BEELINE,               PATH_NONE

; OWEAST_CASTLE_OF_ILLUSIONS
	db OW_NONE,                      OWEAST_THE_STAGNANT_SWAMP,      OWEAST_THE_EAST_CRATER,     OW_NONE
	db PATH_NONE,                    PATH_X_THEN_Y,                  PATH_BEELINE,               PATH_NONE

; OWEAST_THE_COLOSSAL_HOLE
	db OW_NONE,                      OW_NONE,                        OWEAST_FOREST_OF_FEAR,      OWEAST_THE_FRIGID_SEA
	db PATH_NONE,                    PATH_NONE,                      PATH_Y_THEN_X,              PATH_BEELINE

; OWEAST_THE_WARPED_VOID
	db OW_NONE,                      OW_NONE,                        OWEAST_FOREST_OF_FEAR,      OW_NONE
	db PATH_NONE,                    PATH_NONE,                      PATH_BEELINE,               PATH_NONE

; OWEAST_THE_EAST_CRATER
	db OW_NONE,                      OW_NONE,                        OW_NONE,                    OWEAST_CASTLE_OF_ILLUSIONS
	db PATH_NONE,                    PATH_NONE,                      PATH_NONE,                  PATH_BEELINE

; OWEAST_FOREST_OF_FEAR
	db OW_EXIT_RIGHT,                OWEAST_THE_COLOSSAL_HOLE,       OW_NONE,                    OWEAST_THE_WARPED_VOID
	db PATH_BEELINE,                 PATH_X_THEN_Y,                  PATH_NONE,                  PATH_BEELINE

OWExitPaths:
	dw .North ; NORTH
	dw .West ; WEST
	dw .South ; SOUTH
	dw .East ; EAST

;   right,                           left,                           up,                         down
.North:
; OW_EXIT_RIGHT
	db OW_NONE,                      OWNORTH_THE_VAST_PLAIN,         OW_NONE,                    OW_NONE
	db PATH_NONE,                    PATH_S_SHAPE,                   PATH_NONE,                  PATH_NONE

; OW_EXIT_LEFT
	db OWNORTH_THE_PEACEFUL_VILLAGE, OW_NONE,                        OW_NONE,                    OW_NONE
	db PATH_BEELINE,                 PATH_NONE,                      PATH_NONE,                  PATH_NONE

.West:
; OW_EXIT_RIGHT
	db OW_NONE,                      OWWEST_A_TOWN_IN_CHAOS,         OW_NONE,                    OW_NONE
	db PATH_NONE,                    PATH_X_THEN_Y,                  PATH_NONE,                  PATH_NONE

; OW_EXIT_LEFT
	db OWWEST_DESERT_RUINS,          OW_NONE,                        OW_NONE,                    OW_NONE
	db PATH_BEELINE,                 PATH_NONE,                      PATH_NONE,                  PATH_NONE

.South:
; OW_EXIT_RIGHT
	db OW_NONE,                      OWSOUTH_TOWER_OF_REVIVAL,       OW_NONE,                    OW_NONE
	db PATH_NONE,                    PATH_BEELINE,                   PATH_NONE,                  PATH_NONE

; OW_EXIT_LEFT
	db OWSOUTH_THE_GRASSLANDS,       OW_NONE,                        OW_NONE,                    OW_NONE
	db PATH_BEELINE,                 PATH_NONE,                      PATH_NONE,                  PATH_NONE

.East:
; OW_EXIT_RIGHT
	db OW_NONE,                      OWEAST_FOREST_OF_FEAR,          OW_NONE,                    OW_NONE
	db PATH_NONE,                    PATH_BEELINE,                   PATH_NONE,                  PATH_NONE

; OW_EXIT_LEFT
	db OWEAST_THE_STAGNANT_SWAMP,    OW_NONE,                        OW_NONE,                    OW_NONE
	db PATH_BEELINE,                 PATH_NONE,                      PATH_NONE,                  PATH_NONE
