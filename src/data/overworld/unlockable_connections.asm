UnlockableConnections:
	table_width 2
	dw .North ; NORTH
	dw .West  ; WEST
	dw .South ; SOUTH
	dw .East  ; EAST
	assert_table_length NUM_CARDINAL_DIRECTIONS

.North:
	table_width 2
	db $ff, $ff
	db OWNORTH_THE_TEMPLE,             OWNORTH_OUT_OF_THE_WOODS       ; NORTHCONN_1
	db OWNORTH_OUT_OF_THE_WOODS,       OWNORTH_THE_PEACEFUL_VILLAGE   ; NORTHCONN_2
	db OWNORTH_JUNCTION,               OWNORTH_THE_VAST_PLAIN         ; NORTHCONN_3
	db OWNORTH_THE_VAST_PLAIN,         OWNORTH_BANK_OF_THE_WILD_RIVER ; NORTHCONN_4
	db OWNORTH_BANK_OF_THE_WILD_RIVER, OWNORTH_THE_TIDAL_COAST        ; NORTHCONN_5
	db OWNORTH_THE_TIDAL_COAST,        OWNORTH_SEA_TURTLE_ROCKS       ; NORTHCONN_6
	db OWNORTH_THE_VAST_PLAIN,         OW_EXIT_RIGHT                  ; NORTHCONN_7
	db OW_EXIT_LEFT,                   OWNORTH_THE_PEACEFUL_VILLAGE   ; NORTHCONN_8
	assert_table_length NUM_NORTH_CONNECTIONS + 1

.West:
	table_width 2
	db $ff, $ff
	db OWWEST_DESERT_RUINS,      OWWEST_THE_VOLCANOS_BASE ; WESTCONN_1
	db OWWEST_THE_VOLCANOS_BASE, OWWEST_THE_POOL_OF_RAIN  ; WESTCONN_2
	db OWWEST_THE_POOL_OF_RAIN,  OWWEST_A_TOWN_IN_CHAOS   ; WESTCONN_3
	db OWWEST_THE_VOLCANOS_BASE, OWWEST_THE_WEST_CRATER   ; WESTCONN_4
	db OWWEST_THE_POOL_OF_RAIN,  OWWEST_BENEATH_THE_WAVES ; WESTCONN_5
	db OWWEST_A_TOWN_IN_CHAOS,   OW_EXIT_RIGHT            ; WESTCONN_6
	db OW_EXIT_LEFT,             OWWEST_DESERT_RUINS      ; WESTCONN_7
	assert_table_length NUM_WEST_CONNECTIONS + 1

.South:
	table_width 2
	db $ff, $ff
	db OWSOUTH_THE_GRASSLANDS,   OWSOUTH_THE_BIG_BRIDGE   ; SOUTHCONN_1
	db OWSOUTH_THE_BIG_BRIDGE,   OWSOUTH_TOWER_OF_REVIVAL ; SOUTHCONN_2
	db OWSOUTH_THE_BIG_BRIDGE,   OWSOUTH_THE_STEEP_CANYON ; SOUTHCONN_3
	db OWSOUTH_THE_BIG_BRIDGE,   OWSOUTH_CAVE_OF_FLAMES   ; SOUTHCONN_4
	db OWSOUTH_TOWER_OF_REVIVAL, OWSOUTH_ABOVE_THE_CLOUDS ; SOUTHCONN_5
	db OWSOUTH_TOWER_OF_REVIVAL, OW_EXIT_RIGHT            ; SOUTHCONN_6
	db OW_EXIT_LEFT,             OWSOUTH_THE_GRASSLANDS   ; SOUTHCONN_7
	assert_table_length NUM_SOUTH_CONNECTIONS + 1

.East:
	table_width 2
	db $ff, $ff
	db OWEAST_THE_STAGNANT_SWAMP,  OWEAST_THE_FRIGID_SEA      ; EASTCONN_1
	db OWEAST_THE_STAGNANT_SWAMP,  OWEAST_CASTLE_OF_ILLUSIONS ; EASTCONN_2
	db OWEAST_THE_FRIGID_SEA,      OWEAST_THE_COLOSSAL_HOLE   ; EASTCONN_3
	db OWEAST_FOREST_OF_FEAR,      OWEAST_THE_WARPED_VOID     ; EASTCONN_4
	db OWEAST_THE_COLOSSAL_HOLE,   OWEAST_FOREST_OF_FEAR      ; EASTCONN_5
	db OWEAST_CASTLE_OF_ILLUSIONS, OWEAST_THE_EAST_CRATER     ; EASTCONN_6
	db OWEAST_FOREST_OF_FEAR,      OW_EXIT_RIGHT              ; EASTCONN_7
	db OW_EXIT_LEFT,               OWEAST_THE_STAGNANT_SWAMP  ; EASTCONN_8
	assert_table_length NUM_EAST_CONNECTIONS + 1

UnlockableLevelArrows:
	table_width 2
	dw .North ; NORTH
	dw .West  ; WEST
	dw .South ; SOUTH
	dw .East  ; EAST
	assert_table_length NUM_CARDINAL_DIRECTIONS

.North:
	table_width 2
	dw .InvalidNorthConnection
	dw .NorthConnection1 ; NORTHCONN_1
	dw .NorthConnection2 ; NORTHCONN_2
	dw .NorthConnection3 ; NORTHCONN_3
	dw .NorthConnection4 ; NORTHCONN_4
	dw .NorthConnection5 ; NORTHCONN_5
	dw .NorthConnection6 ; NORTHCONN_6
	dw .NorthConnection7 ; NORTHCONN_7
	dw .NorthConnection8 ; NORTHCONN_8
	assert_table_length NUM_NORTH_CONNECTIONS + 1

.West:
	table_width 2
	dw .InvalidWestConnection
	dw .WestConnection1 ; WESTCONN_1
	dw .WestConnection2 ; WESTCONN_2
	dw .WestConnection3 ; WESTCONN_3
	dw .WestConnection4 ; WESTCONN_4
	dw .WestConnection5 ; WESTCONN_5
	dw .WestConnection6 ; WESTCONN_6
	dw .WestConnection7 ; WESTCONN_7
	assert_table_length NUM_WEST_CONNECTIONS + 1

.South:
	table_width 2
	dw .InvalidSouthConnection
	dw .SouthConnection1 ; SOUTHCONN_1
	dw .SouthConnection2 ; SOUTHCONN_2
	dw .SouthConnection3 ; SOUTHCONN_3
	dw .SouthConnection4 ; SOUTHCONN_4
	dw .SouthConnection5 ; SOUTHCONN_5
	dw .SouthConnection6 ; SOUTHCONN_6
	dw .SouthConnection7 ; SOUTHCONN_7
	assert_table_length NUM_SOUTH_CONNECTIONS + 1

.East:
	table_width 2
	dw .InvalidEastConnection
	dw .EastConnection1 ; EASTCONN_1
	dw .EastConnection2 ; EASTCONN_2
	dw .EastConnection3 ; EASTCONN_3
	dw .EastConnection4 ; EASTCONN_4
	dw .EastConnection5 ; EASTCONN_5
	dw .EastConnection6 ; EASTCONN_6
	dw .EastConnection7 ; EASTCONN_7
	dw .EastConnection8 ; EASTCONN_8
	assert_table_length NUM_EAST_CONNECTIONS + 1

.InvalidNorthConnection
	db $ff, $ff

.NorthConnection1:
	db D_LEFT,  1
	db D_RIGHT, 1
	db $ff

.NorthConnection2:
	db D_DOWN,  1
	db D_UP,    1
	db $ff

.NorthConnection3:
	db D_RIGHT, 1
	db D_LEFT,  1
	db $ff

.NorthConnection4:
	db D_DOWN,  1
	db D_RIGHT, 1
	db $ff

.NorthConnection5:
	db D_DOWN,  1
	db D_LEFT,  1
	db $ff

.NorthConnection6:
	db D_RIGHT, 1
	db D_LEFT,  1
	db $ff

.NorthConnection7:
	db D_RIGHT, 1
	db D_LEFT,  1
	db $ff

.NorthConnection8:
	db D_RIGHT, 1
	db D_LEFT,  1
	db $ff

.InvalidWestConnection:
	db $ff, $ff

.WestConnection1:
	db D_UP,    1
	db D_LEFT,  1
	db $ff

.WestConnection2:
	db D_DOWN,  1
	db D_LEFT,  1
	db $ff

.WestConnection3:
	db D_RIGHT, 1
	db D_DOWN,  1
	db $ff

.WestConnection4:
	db D_UP,    1
	db D_LEFT,  1
	db $ff

.WestConnection5:
	db D_DOWN,  1
	db D_UP,    1
	db $ff

.WestConnection6:
	db D_UP,    1
	db D_LEFT,  1
	db $ff

.WestConnection7:
	db D_RIGHT, 1
	db D_LEFT,  1
	db $ff

.InvalidSouthConnection:
	db $ff, $ff

.SouthConnection1:
	db D_RIGHT, 1
	db D_LEFT,  1
	db $ff

.SouthConnection2:
	db D_RIGHT, 1
	db D_LEFT,  1
	db $ff

.SouthConnection3:
	db D_DOWN,  1
	db D_LEFT,  1
	db $ff

.SouthConnection4:
	db D_UP,    1
	db D_LEFT,  1
	db $ff

.SouthConnection5:
	db D_UP,    1
	db D_LEFT,  1
	db $ff

.SouthConnection6:
	db D_RIGHT, 1
	db D_LEFT,  1
	db $ff

.SouthConnection7:
	db D_RIGHT, 1
	db D_LEFT,  1
	db $ff

.InvalidEastConnection:
	db $ff, $ff

.EastConnection1:
	db D_DOWN,  1
	db D_LEFT,  1
	db $ff

.EastConnection2:
	db D_UP,    1
	db D_LEFT,  1
	db $ff

.EastConnection3:
	db D_UP,    1
	db D_DOWN,  1
	db $ff

.EastConnection4:
	db D_DOWN,  1
	db D_UP,    1
	db $ff

.EastConnection5:
	db D_UP,    1
	db D_LEFT,  1
	db $ff

.EastConnection6:
	db D_UP,    1
	db D_DOWN,  1
	db $ff

.EastConnection7:
	db D_RIGHT, 1
	db D_LEFT,  1
	db $ff

.EastConnection8:
	db D_RIGHT, 1
	db D_LEFT,  1
	db $ff
