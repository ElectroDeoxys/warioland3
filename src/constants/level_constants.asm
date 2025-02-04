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
	const ROOMTRANSITION_NONE ; 0
	const ROOMTRANSITION_1    ; 1
	const ROOMTRANSITION_2    ; 2
	const ROOMTRANSITION_GOLF    ; 3
	const ROOMTRANSITION_4    ; 4
	const ROOMTRANSITION_5    ; 5
	const ROOMTRANSITION_6    ; 6
	const ROOMTRANSITION_TELEPORT    ; 7
	const ROOMTRANSITION_8    ; 8

	const_def 4
	const ROOMTRANSITIONF_0_F ; 4
	const ROOMTRANSITIONF_DOOR_F ; 5
	const ROOMTRANSITIONF_2_F ; 6
	const ROOMTRANSITIONF_DELAY_F ; 7

DEF ROOMTRANSITIONF_0 EQU (1 << ROOMTRANSITIONF_0_F)
DEF ROOMTRANSITIONF_DOOR EQU (1 << ROOMTRANSITIONF_DOOR_F)
DEF ROOMTRANSITIONF_2 EQU (1 << ROOMTRANSITIONF_2_F)
DEF ROOMTRANSITIONF_DELAY EQU (1 << ROOMTRANSITIONF_DELAY_F)

DEF ROOMTRANSITION_MASK EQU $0f
DEF ROOMTRANSITION_FLAGS_MASK EQU ROOMTRANSITIONF_0 | ROOMTRANSITIONF_DOOR | ROOMTRANSITIONF_2 | ROOMTRANSITIONF_DELAY

; number of frames for a new coin to spawn
; after another coin has spawned
DEF COIN_COOLDOWN EQU 100

; number of torches that need to be lit
; to destroy the Flame Block
DEF NUM_FLAME_BLOCK_TORCHES EQU 3

; number of different types of blocks
; that can fit inside a single room
DEF NUM_ROOM_BLOCK_TYPES EQU $80
