; golf price tiers, given in decimal form
GOLF_PRICE_TIER_1 EQU $10
GOLF_PRICE_TIER_2 EQU $30
GOLF_PRICE_TIER_3 EQU $50

; golf treasure tiers, given in decimal form
GOLF_TREASURES_TIER_1 EQU $00
GOLF_TREASURES_TIER_2 EQU $25
GOLF_TREASURES_TIER_3 EQU $50

; price of the courses in the Golf Building
GOLF_BUILDING_PRICE EQU $50

; wGolfObj4State constants
	const_def
	const COININFO_ENOUGH_COINS     ; $0
	const COININFO_NOT_ENOUGH_COINS ; $1
	const COININFO_SHOW_MESSAGE     ; $2

; wGolfCourse constants
	const_def
	const GOLF_COURSE_1 ; $0
	const GOLF_COURSE_2 ; $1
	const GOLF_COURSE_3 ; $2
	const GOLF_COURSE_4 ; $3
NUM_GOLF_COURSES EQU const_value

GOLF_BASE_SCORE EQU 20
golf_score EQUS "GOLF_BASE_SCORE +"

; maximum number of strokes over par 
; for golf levels inside the various courses
MAX_GOLF_COURSE_STROKES EQU 19

; golf level constants
	const_def
	const GOLF_LEVEL_00 ; $00
	const GOLF_LEVEL_01 ; $01
	const GOLF_LEVEL_02 ; $02
	const GOLF_LEVEL_03 ; $03
	const GOLF_LEVEL_04 ; $04
	const GOLF_LEVEL_05 ; $05
GOLF_LEVEL_TIER_1 EQU const_value - 1
	const GOLF_LEVEL_06 ; $06
	const GOLF_LEVEL_07 ; $07
	const GOLF_LEVEL_08 ; $08
	const GOLF_LEVEL_09 ; $09
	const GOLF_LEVEL_10 ; $0a
GOLF_LEVEL_TIER_2 EQU const_value - 1
	const GOLF_LEVEL_11 ; $0b
	const GOLF_LEVEL_12 ; $0c
	const GOLF_LEVEL_13 ; $0d
	const GOLF_LEVEL_14 ; $0e
	const GOLF_LEVEL_15 ; $0f
GOLF_LEVEL_TIER_3 EQU const_value - 1
	const GOLF_LEVEL_16 ; $10
	const GOLF_LEVEL_17 ; $11
	const GOLF_LEVEL_18 ; $12
	const GOLF_LEVEL_19 ; $13
NUM_GOLF_LEVELS EQU const_value

; wGolfLevel struct constants
rsreset
GOLF_LEVEL_UNK00 rw ; $00
GOLF_LEVEL_UNK01 rw ; $01
GOLF_LEVEL_UNK02 rw ; $02
GOLF_LEVEL_UNK03 rw ; $03
GOLF_LEVEL_UNK04 rw ; $04
GOLF_LEVEL_STRUCT_LENGTH EQU _RS

; wGolfDisplayMode constants
	const_def
	const GOLF_DISPLAY_BGMAP0 ; $0
	const GOLF_DISPLAY_SPLIT  ; $1
	const GOLF_DISPLAY_BGMAP1 ; $2
