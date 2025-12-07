; \1 = bg y coord
; \2 = bg x coord
; \3 = unknown 1
; \4 = unknown 2
MACRO ow_coord
	IF (\1) != -1
	DEF x = \2 + (\1 * TILEMAP_WIDTH)
		db ((x & $1e0) >> 2) ; y coord in px
		db ((x & $01f) << 3) ; x coord in px
	ELSE
		db -1
		db -1
	ENDC

	db \3
	db \4
ENDM

MapLevelCoords:
	dw .North
	dw .West
	dw .South
	dw .East

.North:
	ow_coord  5,  7, 8,  8 ; OWNORTH_THE_TEMPLE
	ow_coord  5,  3, 8, -4 ; OWNORTH_OUT_OF_THE_WOODS
	ow_coord 10,  3, 4, -4 ; OWNORTH_THE_PEACEFUL_VILLAGE
	ow_coord  8, 10, 4,  4 ; OWNORTH_THE_VAST_PLAIN
	ow_coord 10,  8, 4,  4 ; OWNORTH_BANK_OF_THE_WILD_RIVER
	ow_coord 12, 11, 4,  4 ; OWNORTH_THE_TIDAL_COAST
	ow_coord 12, 17, 4,  4 ; OWNORTH_SEA_TURTLE_ROCKS
	ow_coord  8,  3, 4, -4 ; OWNORTH_JUNCTION
	ow_coord -1, -1, 0,  0
	ow_coord -1, -1, 0,  0
	ow_coord -1, -1, 0,  0
	ow_coord -1, -1, 0,  0
	ow_coord -1, -1, 0,  0
	ow_coord -1, -1, 0,  0
	ow_coord  7, 19, 0,  0 ; OW_EXIT_RIGHT
	ow_coord 10,  0, 4,  0 ; OW_EXIT_LEFT

.West:
	ow_coord 10,  2,  8, 12 ; OWWEST_DESERT_RUINS
	ow_coord  7,  7,  8, 12 ; OWWEST_THE_VOLCANOS_BASE
	ow_coord 10,  9,  4, 12 ; OWWEST_THE_POOL_OF_RAIN
	ow_coord  8, 15,  8, -4 ; OWWEST_A_TOWN_IN_CHAOS
	ow_coord 14,  9,  4, 12 ; OWWEST_BENEATH_THE_WAVES
	ow_coord  2,  9, 12, 12 ; OWWEST_THE_WEST_CRATER
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord  5, 19, -1,  0 ; OW_EXIT_RIGHT
	ow_coord 10,  0,  8,  0 ; OW_EXIT_LEFT

.South:
	ow_coord  8,  2,  4,  4 ; OWSOUTH_THE_GRASSLANDS
	ow_coord  8,  6,  4, 12 ; OWSOUTH_THE_BIG_BRIDGE
	ow_coord  8, 13,  4, 12 ; OWSOUTH_TOWER_OF_REVIVAL
	ow_coord 11, 10,  4,  4 ; OWSOUTH_THE_STEEP_CANYON
	ow_coord  3,  8,  8, 12 ; OWSOUTH_CAVE_OF_FLAMES
	ow_coord  2, 17, 12,  4 ; OWSOUTH_ABOVE_THE_CLOUDS
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord  8, 19,  4,  0 ; OW_EXIT_RIGHT
	ow_coord  8,  0,  4,  0 ; OW_EXIT_LEFT

.East:
	ow_coord 10,  2,  8, 12 ; OWEAST_THE_STAGNANT_SWAMP
	ow_coord 13, 11,  4, 12 ; OWEAST_THE_FRIGID_SEA
	ow_coord  7,  7,  4, 12 ; OWEAST_CASTLE_OF_ILLUSIONS
	ow_coord  9, 11,  8, 12 ; OWEAST_THE_COLOSSAL_HOLE
	ow_coord 11, 16,  4, 12 ; OWEAST_THE_WARPED_VOID
	ow_coord  2,  7, 12, 12 ; OWEAST_THE_EAST_CRATER
	ow_coord  7, 16,  4, 12 ; OWEAST_FOREST_OF_FEAR
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord -1, -1,  0,  0
	ow_coord  7, 19,  4,  0 ; OW_EXIT_RIGHT
	ow_coord 10,  0,  8,  0 ; OW_EXIT_LEFT
