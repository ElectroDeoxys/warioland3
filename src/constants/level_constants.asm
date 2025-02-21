MACRO level
DEF LEVEL_\1 EQU (const_value / 8) + 1
	const \1_DAY_1
	const \1_DAY_2
	const \1_DAY_3
	const \1_DAY_4
	const \1_NIGHT_1
	const \1_NIGHT_2
	const \1_NIGHT_3
	const \1_NIGHT_4
ENDM

	const_def
DEF LEVEL_THE_TEMPLE EQU const_value   ; $00

	; north
	level OUT_OF_THE_WOODS         ; $00
	level THE_PEACEFUL_VILLAGE     ; $08
	level THE_VAST_PLAIN           ; $10
	level BANK_OF_THE_WILD_RIVER   ; $18
	level THE_TIDAL_COAST          ; $20
	level SEA_TURTLE_ROCKS         ; $28
	; west
	level DESERT_RUINS             ; $30
	level THE_VOLCANOS_BASE        ; $38
	level THE_POOL_OF_RAIN         ; $40
	level A_TOWN_IN_CHAOS          ; $48
	level BENEATH_THE_WAVES        ; $50
	level THE_WEST_CRATER          ; $58
	; south
	level THE_GRASSLANDS           ; $60
	level THE_BIG_BRIDGE           ; $68
	level TOWER_OF_REVIVAL         ; $70
	level THE_STEEP_CANYON         ; $78
	level CAVE_OF_FLAMES           ; $80
	level ABOVE_THE_CLOUDS         ; $88
	; east
	level THE_STAGNANT_SWAMP       ; $90
	level THE_FRIGID_SEA           ; $98
	level CASTLE_OF_ILLUSIONS      ; $a0
	level THE_COLOSSAL_HOLE        ; $a8
	level THE_WARPED_VOID          ; $b0
	level THE_EAST_CRATER          ; $b8
	level FOREST_OF_FEAR           ; $c0

DEF NUM_LEVELS EQU (const_value / 8) ; 25

DEF LEVEL_GOLF_BUILDING EQU (const_value / 8) + 1 ; $1a

	const THE_TEMPLE               ; $c8
	const_def $ff
	const GOLF_BUILDING            ; $ff

DEF NUM_LEVEL_TREASURES     EQU 4
DEF NUM_LEVEL_MUSICAL_COINS EQU 8
DEF LEVEL_WIDTH EQU 160 ; blocks
DEF MAX_NUM_COINS EQU $999 ; in hexadecimal

	const_def
	const GREY_KEY_F       ; $0
	const RED_KEY_F        ; $1
	const GREEN_KEY_F      ; $2
	const BLUE_KEY_F       ; $3
	const GREY_TREASURE_F  ; $4
	const RED_TREASURE_F   ; $5
	const GREEN_TREASURE_F ; $6
	const BLUE_TREASURE_F  ; $7

DEF GREY_KEY       EQU (1 << GREY_KEY_F)
DEF RED_KEY        EQU (1 << RED_KEY_F)
DEF GREEN_KEY      EQU (1 << GREEN_KEY_F)
DEF BLUE_KEY       EQU (1 << BLUE_KEY_F)
DEF GREY_TREASURE  EQU (1 << GREY_TREASURE_F)
DEF RED_TREASURE   EQU (1 << RED_TREASURE_F)
DEF GREEN_TREASURE EQU (1 << GREEN_TREASURE_F)
DEF BLUE_TREASURE  EQU (1 << BLUE_TREASURE_F)

DEF KEYS_MASK EQU GREY_KEY | RED_KEY | GREEN_KEY | BLUE_KEY
DEF TREASURES_MASK EQU GREY_TREASURE | RED_TREASURE | GREEN_TREASURE | BLUE_TREASURE

	const_def 1
	const LVLEND_GREY_TREASURE  ; 01
	const LVLEND_RED_TREASURE   ; 02
	const LVLEND_GREEN_TREASURE ; 03
	const LVLEND_BLUE_TREASURE  ; 04
	const LVLEND_NO_TREASURE    ; 05
	const LVLEND_GAME_OVER      ; 06
	const LVLEND_EPILOGUE       ; 07

; constants for wRoomTransitionParam
	const_def
	const ROOMTRANSITION_NONE            ; 0
	const ROOMTRANSITION_PIPE            ; 1
	const ROOMTRANSITION_DOOR            ; 2
	const ROOMTRANSITION_GOLF            ; 3
	const ROOMTRANSITION_4               ; 4
	const ROOMTRANSITION_5               ; 5
	const ROOMTRANSITION_UNDERWATER_DOOR ; 6
	const ROOMTRANSITION_TELEPORT        ; 7
	const ROOMTRANSITION_8               ; 8

	const_def 5
	const ROOMTRANSITIONF_DOOR_F           ; 5
	const ROOMTRANSITIONF_RELOAD_OBJECTS_F ; 6
	const ROOMTRANSITIONF_DELAY_F          ; 7

DEF ROOMTRANSITIONF_DOOR           EQU (1 << ROOMTRANSITIONF_DOOR_F)
DEF ROOMTRANSITIONF_RELOAD_OBJECTS EQU (1 << ROOMTRANSITIONF_RELOAD_OBJECTS_F)
DEF ROOMTRANSITIONF_DELAY          EQU (1 << ROOMTRANSITIONF_DELAY_F)

DEF ROOMTRANSITION_MASK       EQU $0f
DEF ROOMTRANSITION_FLAGS_MASK EQU $10 | ROOMTRANSITIONF_DOOR | ROOMTRANSITIONF_RELOAD_OBJECTS | ROOMTRANSITIONF_DELAY

; wCameraConfigFlags constants
	const_def
	const CAM_FREE_F          ; 0
	const CAM_XSCROLL1_F      ; 1
	const CAM_XSCROLL2_F      ; 2
	const CAM_TRANSITIONS_F   ; 3

	const CAM_BORDER_RIGHT_F  ; 4
	const CAM_BORDER_LEFT_F   ; 5
	const CAM_BORDER_UP_F     ; 6
	const CAM_BORDER_DOWN_F   ; 7

DEF CAM_YSCROLL       EQU 0
DEF CAM_FREE          EQU 1 << CAM_FREE_F
DEF CAM_XSCROLL1      EQU 1 << CAM_XSCROLL1_F
DEF CAM_XSCROLL2      EQU 1 << CAM_XSCROLL2_F
DEF CAM_TRANSITIONS   EQU 1 << CAM_TRANSITIONS_F
DEF CAM_BORDER_RIGHT  EQU 1 << CAM_BORDER_RIGHT_F
DEF CAM_BORDER_LEFT   EQU 1 << CAM_BORDER_LEFT_F
DEF CAM_BORDER_UP     EQU 1 << CAM_BORDER_UP_F
DEF CAM_BORDER_DOWN   EQU 1 << CAM_BORDER_DOWN_F

DEF CAM_SCROLLING_MASK EQU CAM_YSCROLL | CAM_FREE | CAM_XSCROLL1 | CAM_XSCROLL2 | CAM_TRANSITIONS

DEF HIDDEN_FIGURE_CAMCONFIG EQU CAM_XSCROLL2 | CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT

; length in pixels of the spacing between Wario and the edge
; of the level on levels with corresponding CAM_BORDER_* flags set
DEF CAMERA_BORDER_RIGHT_W EQU $20
DEF CAMERA_BORDER_LEFT_W  EQU $20
DEF CAMERA_BORDER_UPPER_H EQU $20
DEF CAMERA_BORDER_LOWER_H EQU $20

; constants for wLevelEdgeUpdateFlags
	const_def
	const LEVEL_EDGE_UPDATE_RIGHT_F ; 0
	const LEVEL_EDGE_UPDATE_LEFT_F  ; 1
	const LEVEL_EDGE_UPDATE_UP_F    ; 2
	const LEVEL_EDGE_UPDATE_DOWN_F  ; 3

DEF LEVEL_EDGE_UPDATE_RIGHT EQU 1 << LEVEL_EDGE_UPDATE_RIGHT_F
DEF LEVEL_EDGE_UPDATE_LEFT  EQU 1 << LEVEL_EDGE_UPDATE_LEFT_F
DEF LEVEL_EDGE_UPDATE_UP    EQU 1 << LEVEL_EDGE_UPDATE_UP_F
DEF LEVEL_EDGE_UPDATE_DOWN  EQU 1 << LEVEL_EDGE_UPDATE_DOWN_F

; number of different types of blocks
; that can fit inside a single room
DEF NUM_ROOM_BLOCK_TYPES EQU $80

; number of frames for a new coin to spawn
; after another coin has spawned
DEF COIN_COOLDOWN EQU 100

; number of torches that need to be lit
; to destroy the Flame Block
DEF NUM_FLAME_BLOCK_TORCHES EQU 3
