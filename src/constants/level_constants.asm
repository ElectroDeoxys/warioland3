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

DEF NUM_LEVELS EQU (const_value / 8)

DEF LEVEL_GOLF_BUILDING EQU (const_value / 8) + 1 ; $1a


	const THE_TEMPLE               ; $c8
const_value = $ff
	const GOLF_BUILDING            ; $ff


DEF NUM_LEVEL_TREASURES     EQU 4
DEF NUM_LEVEL_MUSICAL_COINS EQU 8
DEF LEVEL_WIDTH EQU 160
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

DEF KEYS_MASK EQU (1 << GREY_KEY_F) | (1 << RED_KEY_F) | (1 << GREEN_KEY_F) | (1 << BLUE_KEY_F)
DEF TREASURES_MASK EQU (1 << GREY_TREASURE_F) | (1 << RED_TREASURE_F) | (1 << GREEN_TREASURE_F) | (1 << BLUE_TREASURE_F)

	const_def 1
	const LVLEND_GREY_TREASURE  ; 01
	const LVLEND_RED_TREASURE   ; 02
	const LVLEND_GREEN_TREASURE ; 03
	const LVLEND_BLUE_TREASURE  ; 04
	const LVLEND_NO_TREASURE    ; 05
	const LVLEND_GAME_OVER      ; 06
	const LVLEND_EPILOGUE       ; 07
