	const_def
	const MAP_NORTH ; $0
	const MAP_WEST  ; $1
	const MAP_SOUTH ; $2
	const MAP_EAST  ; $3

	const_def
	const CRAYON_RED_F    ; 0
	const CRAYON_BROWN_F  ; 1
	const CRAYON_YELLOW_F ; 2
	const CRAYON_GREEN_F  ; 3
	const CRAYON_CYAN_F   ; 4
	const CRAYON_BLUE_F   ; 5
	const CRAYON_PINK_F   ; 6

CRAYON_RED    EQU 1 << CRAYON_RED_F    ; $01
CRAYON_BROWN  EQU 1 << CRAYON_BROWN_F  ; $02
CRAYON_YELLOW EQU 1 << CRAYON_YELLOW_F ; $04
CRAYON_GREEN  EQU 1 << CRAYON_GREEN_F  ; $08
CRAYON_CYAN   EQU 1 << CRAYON_CYAN_F   ; $10
CRAYON_BLUE   EQU 1 << CRAYON_BLUE_F   ; $20
CRAYON_PINK   EQU 1 << CRAYON_PINK_F   ; $40

ALL_CRAYONS EQU CRAYON_RED | CRAYON_BROWN | CRAYON_YELLOW | CRAYON_GREEN | CRAYON_CYAN | CRAYON_BLUE | CRAYON_PINK

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

OW_EXIT_RIGHT EQU $0e
OW_EXIT_LEFT  EQU $0f

; OW bottom bar action
	const_def
	const BOTBAR_CLOSED          ; $0
	const BOTBAR_OPENED          ; $1
	const BOTBAR_CLOSING         ; $2
	const BOTBAR_OPENING         ; $3
