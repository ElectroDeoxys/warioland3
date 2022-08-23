	const_def
	const NORTH ; $0
	const WEST  ; $1
	const SOUTH ; $2
	const EAST  ; $3

	const_def
	const CRAYON_RED_F    ; 0
	const CRAYON_BROWN_F  ; 1
	const CRAYON_YELLOW_F ; 2
	const CRAYON_GREEN_F  ; 3
	const CRAYON_CYAN_F   ; 4
	const CRAYON_BLUE_F   ; 5
	const CRAYON_PINK_F   ; 6

DEF CRAYON_RED    EQU 1 << CRAYON_RED_F    ; $01
DEF CRAYON_BROWN  EQU 1 << CRAYON_BROWN_F  ; $02
DEF CRAYON_YELLOW EQU 1 << CRAYON_YELLOW_F ; $04
DEF CRAYON_GREEN  EQU 1 << CRAYON_GREEN_F  ; $08
DEF CRAYON_CYAN   EQU 1 << CRAYON_CYAN_F   ; $10
DEF CRAYON_BLUE   EQU 1 << CRAYON_BLUE_F   ; $20
DEF CRAYON_PINK   EQU 1 << CRAYON_PINK_F   ; $40

DEF ALL_CRAYONS EQU CRAYON_RED | CRAYON_BROWN | CRAYON_YELLOW | CRAYON_GREEN | CRAYON_CYAN | CRAYON_BLUE | CRAYON_PINK

; north side level indices
	const_def
	const OWNORTH_THE_TEMPLE             ; $0
	const OWNORTH_OUT_OF_THE_WOODS       ; $1
	const OWNORTH_THE_PEACEFUL_VILLAGE   ; $2
	const OWNORTH_THE_VAST_PLAIN         ; $3
	const OWNORTH_BANK_OF_THE_WILD_RIVER ; $4
	const OWNORTH_THE_TIDAL_COAST        ; $5
	const OWNORTH_SEA_TURTLE_ROCKS       ; $6
	const OWNORTH_JUNCTION               ; $7

; west side level indices
	const_def
	const OWWEST_DESERT_RUINS      ; $0
	const OWWEST_THE_VOLCANOS_BASE ; $1
	const OWWEST_THE_POOL_OF_RAIN  ; $2
	const OWWEST_A_TOWN_IN_CHAOS   ; $3
	const OWWEST_BENEATH_THE_WAVES ; $4
	const OWWEST_THE_WEST_CRATER   ; $5

; south side level indices
	const_def
	const OWSOUTH_THE_GRASSLANDS   ; $0
	const OWSOUTH_THE_BIG_BRIDGE   ; $1
	const OWSOUTH_TOWER_OF_REVIVAL ; $2
	const OWSOUTH_THE_STEEP_CANYON ; $3
	const OWSOUTH_CAVE_OF_FLAMES   ; $4
	const OWSOUTH_ABOVE_THE_CLOUDS ; $5

; east side level indices
	const_def
	const OWEAST_THE_STAGNANT_SWAMP  ; $0
	const OWEAST_THE_FRIGID_SEA      ; $1
	const OWEAST_CASTLE_OF_ILLUSIONS ; $2
	const OWEAST_THE_COLOSSAL_HOLE   ; $3
	const OWEAST_THE_WARPED_VOID     ; $4
	const OWEAST_THE_EAST_CRATER     ; $5
	const OWEAST_FOREST_OF_FEAR      ; $6

	const_def $e
DEF OW_EXITS EQU const_value
	const OW_EXIT_RIGHT ; $e
	const OW_EXIT_LEFT  ; $f

; OW bottom bar action
	const_def
	const BOTBAR_CLOSED  ; $0
	const BOTBAR_OPENED  ; $1
	const BOTBAR_CLOSING ; $2
	const BOTBAR_OPENING ; $3

; OW top bar selection
	const_def
	const TOPBAR_DAY_NIGHT_F  ; $0
	const TOPBAR_CUTSCENE_F   ; $1
	const TOPBAR_COLLECTION_F ; $2
	const TOPBAR_NEXT_MAP_F   ; $3
	const TOPBAR_PREV_MAP_F   ; $4

DEF TOPBAR_DAY_NIGHT  EQU (1 << TOPBAR_DAY_NIGHT_F)
DEF TOPBAR_CUTSCENE   EQU (1 << TOPBAR_CUTSCENE_F)
DEF TOPBAR_COLLECTION EQU (1 << TOPBAR_COLLECTION_F)
DEF TOPBAR_NEXT_MAP   EQU (1 << TOPBAR_NEXT_MAP_F)
DEF TOPBAR_PREV_MAP   EQU (1 << TOPBAR_PREV_MAP_F)

; wTopBarState constants
	const_def
	const TOPBARST_NONE                 ; $0
	const TOPBARST_START_CLOSE_BOT_BAR  ; $1
	const TOPBARST_HANDLE_CLOSE_BOT_BAR ; $2
	const TOPBARST_OPEN                 ; $3
	const TOPBARST_INPUT                ; $4
	const TOPBARST_CLOSE                ; $5
	const TOPBARST_CUTSCENE             ; $6
	const TOPBARST_COLLECTION           ; $7
	const TOPBARST_NEXT_MAP             ; $8
	const TOPBARST_DAY_NIGHT            ; $9
	const TOPBARST_DAY_NIGHT_DELAY      ; $a
	const TOPBARST_DAY_NIGHT_TRANSITION ; $b

DEF DAYNIGHT_TRANSITION_STEPS EQU 32

; wOWCutsceneAction constants
	const_def 1
	const UNLOCK_LEVEL    ; $1
	const DO_OW_FUNC      ; $2
	const HIGHLIGHT_LEVEL ; $3
	const SPECIAL_ACTION  ; $4

; OW cutscene functions
	const_def 1
	const NOWFUNC_CUT_TREE  ; $1
	const NOWFUNC_OPEN_GATE ; $2

; north connections
	const_def 1
	const NORTHCONN_1 ; $1
	const NORTHCONN_2 ; $2
	const NORTHCONN_3 ; $3
	const NORTHCONN_4 ; $4
	const NORTHCONN_5 ; $5
	const NORTHCONN_6 ; $6
	const NORTHCONN_7 ; $7
	const NORTHCONN_8 ; $8

; west connections
	const_def 1
	const WESTCONN_1 ; $1
	const WESTCONN_2 ; $2
	const WESTCONN_3 ; $3
	const WESTCONN_4 ; $4
	const WESTCONN_5 ; $5
	const WESTCONN_6 ; $6
	const WESTCONN_7 ; $7

; south connections
	const_def 1
	const SOUTHCONN_1 ; $1
	const SOUTHCONN_2 ; $2
	const SOUTHCONN_3 ; $3
	const SOUTHCONN_4 ; $4
	const SOUTHCONN_5 ; $5
	const SOUTHCONN_6 ; $6
	const SOUTHCONN_7 ; $7
	const SOUTHCONN_8 ; $8

; east connections
	const_def 1
	const EASTCONN_1 ; $1
	const EASTCONN_2 ; $2
	const EASTCONN_3 ; $3
	const EASTCONN_4 ; $4
	const EASTCONN_5 ; $5
	const EASTCONN_6 ; $6
	const EASTCONN_7 ; $7
	const EASTCONN_8 ; $8
