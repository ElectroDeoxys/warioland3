; golf price tiers, given in decimal form
DEF GOLF_PRICE_TIER_1 EQU $10
DEF GOLF_PRICE_TIER_2 EQU $30
DEF GOLF_PRICE_TIER_3 EQU $50

; golf treasure tiers, given in decimal form
DEF GOLF_TREASURES_TIER_1 EQU $00
DEF GOLF_TREASURES_TIER_2 EQU $25
DEF GOLF_TREASURES_TIER_3 EQU $50

; price of the courses in the Golf Building
DEF GOLF_BUILDING_PRICE EQU $50

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
DEF NUM_GOLF_COURSES EQU const_value

DEF NUM_GOLF_COURSE_LEVELS EQU 4 ; how many levels in a golf course

; maximum number of strokes over par 
; for golf levels inside the various courses
DEF MAX_GOLF_COURSE_STROKES EQU 19
DEF GOLF_BASE_SCORE EQU MAX_GOLF_COURSE_STROKES + 1
DEF golf_score EQUS "GOLF_BASE_SCORE +"

; golf level constants
	const_def
	const GOLF_LEVEL_00 ; $00
	const GOLF_LEVEL_01 ; $01
	const GOLF_LEVEL_02 ; $02
	const GOLF_LEVEL_03 ; $03
	const GOLF_LEVEL_04 ; $04
	const GOLF_LEVEL_05 ; $05
DEF GOLF_LEVEL_TIER_1 EQU const_value - 1
	const GOLF_LEVEL_06 ; $06
	const GOLF_LEVEL_07 ; $07
	const GOLF_LEVEL_08 ; $08
	const GOLF_LEVEL_09 ; $09
	const GOLF_LEVEL_10 ; $0a
DEF GOLF_LEVEL_TIER_2 EQU const_value - 1
	const GOLF_LEVEL_11 ; $0b
	const GOLF_LEVEL_12 ; $0c
	const GOLF_LEVEL_13 ; $0d
	const GOLF_LEVEL_14 ; $0e
	const GOLF_LEVEL_15 ; $0f
DEF GOLF_LEVEL_TIER_3 EQU const_value - 1
	const GOLF_LEVEL_16 ; $10
	const GOLF_LEVEL_17 ; $11
	const GOLF_LEVEL_18 ; $12
	const GOLF_LEVEL_19 ; $13
DEF NUM_GOLF_LEVELS EQU const_value

; par values of a Golf level
	const_def 3
	const PAR_3 ; $3
	const PAR_4 ; $4
	const PAR_5 ; $5

; wGolfResult constants
	const_def
	const GOLFRESULT_UNDER_PAR        ; $0
	const GOLFRESULT_PAR              ; $1
	const GOLFRESULT_OVER_PAR         ; $2
	const GOLFRESULT_COURSE_UNDER_PAR ; $3
	const GOLFRESULT_COURSE_OVER_PAR  ; $4

; various golf terrains
	const_def
	const GOLF_TERRAIN_TEE_BOX ; $0
	const GOLF_TERRAIN_PLAIN   ; $1
DEF SPECIAL_GOLF_TERRAIN EQU const_value
	const GOLF_TERRAIN_HOLE    ; $2
	const GOLF_TERRAIN_ROUGH   ; $3
	const GOLF_TERRAIN_BUNKER  ; $4
	const GOLF_TERRAIN_WATER   ; $5
	const GOLF_TERRAIN_OB      ; $6
	const GOLF_TERRAIN_TEE_OB  ; $7
	const GOLF_TERRAIN_END     ; $8

; golf terrain flags
	const_def 4
	const GOLF_TERRAIN_EDGE_RIGHT_F ; $4
	const GOLF_TERRAIN_EDGE_LEFT_F  ; $5
	const_skip
	const GOLF_TERRAIN_2ND_WATER_F  ; $7

DEF GOLF_TERRAIN_EDGE_RIGHT EQU 1 << GOLF_TERRAIN_EDGE_RIGHT_F
DEF GOLF_TERRAIN_EDGE_LEFT  EQU 1 << GOLF_TERRAIN_EDGE_LEFT_F
DEF GOLF_TERRAIN_2ND_WATER  EQU 1 << GOLF_TERRAIN_2ND_WATER_F ; flag for differentiating two sets of water

DEF GOLF_TERRAIN_MASK       EQU $0f
DEF GOLF_TERRAIN_FLAGS_MASK EQU $f0

DEF NUM_GOLF_LEVEL_BLOCKS EQU 64 + 1 ; $40 plus end block

DEF BASE_SHOT_POWER EQU 8
DEF MAX_SHOT_POWER EQU 76

; power levels when taking a shot
	const_def
	const SHOT_POWER_0 ; $0
	const SHOT_POWER_1 ; $1
	const SHOT_POWER_2 ; $2
	const SHOT_POWER_3 ; $3
	const SHOT_POWER_4 ; $4
	const SHOT_POWER_5 ; $5
	const SHOT_POWER_6 ; $6
	const SHOT_POWER_7 ; $7
	const SHOT_POWER_8 ; $8
	const SHOT_POWER_9 ; $9

; spin type when taking a shot
	const_def
	const SHOT_MISS     ; $0
	const SHOT_BACKSPIN ; $1
	const SHOT_NORMAL   ; $2
	const SHOT_TOPSPIN  ; $3

; wShotTerrainModifier constants
	const_def
	const SHOT_MODIFIER_NONE   ; $0
	const SHOT_MODIFIER_ROUGH  ; $1
	const SHOT_MODIFIER_BUNKER ; $2

; wGolfDisplayMode constants
	const_def
	const GOLF_DISPLAY_BGMAP0 ; $0
	const GOLF_DISPLAY_SPLIT  ; $1
	const GOLF_DISPLAY_BGMAP1 ; $2

; golf level dimensions
DEF MAX_GOLF_X_SCROLL EQU $160
DEF PARAGOOM_GROUND_LEVEL  EQU $180 ; Y pos considered to be 'ground level' for ParaGoom
DEF PARAGOOM_TEE_BOX_LEVEL EQU PARAGOOM_GROUND_LEVEL - $20

; wGolfWarioState constants
	const_def
	const GOLF_WARIO_IDLING        ; $0
	const GOLF_WARIO_WALKING       ; $1
	const GOLF_WARIO_CHARGING      ; $2
	const GOLF_WARIO_ATTACKING_1   ; $3
	const GOLF_WARIO_ATTACKING_2   ; $4
	const GOLF_WARIO_MISSING       ; $5
	const GOLF_WARIO_CLEARED       ; $6
	const GOLF_WARIO_LOST          ; $7
	const GOLF_WARIO_WAITING       ; $8
	const GOLF_WARIO_ENTERING_DOOR ; $9
	const GOLF_WARIO_GOING_IN_PIPE ; $a
	const GOLF_WARIO_TURNING       ; $b
DEF NUM_GOLF_WARIO_STATES EQU const_value

; wGolfParaGoomState constants
	const_def
	const GOLF_PARAGOOM_0 ; $0
	const GOLF_PARAGOOM_1 ; $1
	const GOLF_PARAGOOM_2 ; $2
	const GOLF_PARAGOOM_3 ; $3
	const GOLF_PARAGOOM_4 ; $4
	const GOLF_PARAGOOM_5 ; $5
	const GOLF_PARAGOOM_6 ; $6
	const GOLF_PARAGOOM_7 ; $7
	const GOLF_PARAGOOM_8 ; $8

; wGolfLobbyState consants
	const_def
	const GOLFLOBBYSTATE_WAIT_INPUT ; $0
	const GOLFLOBBYSTATE_WALK_RIGHT ; $1
	const GOLFLOBBYSTATE_WALK_LEFT  ; $2
	const GOLFLOBBYSTATE_ENTER_PIPE ; $3
	const GOLFLOBBYSTATE_ENTER_DOOR ; $4
	const GOLFLOBBYSTATE_EXIT_PIPE  ; $5

; wGolfLevelState consants
	const_def
	const GOLFLEVELSTATE_WAIT_INPUT        ; $0
	const GOLFLEVELSTATE_SCROLL            ; $1
	const GOLFLEVELSTATE_SELECT_SHOT_POWER ; $2
	const GOLFLEVELSTATE_SELECT_SHOT_SPIN  ; $3
	const GOLFLEVELSTATE_START_SHOT        ; $4
	const GOLFLEVELSTATE_SHOT              ; $5
	const GOLFLEVELSTATE_BOUNCE            ; $6
	const GOLFLEVELSTATE_SPECIAL_TERRAIN   ; $7
	const GOLFLEVELSTATE_WALK              ; $8
	const GOLFLEVELSTATE_BETWEEN_SHOTS     ; $9
	const GOLFLEVELSTATE_CLEARED           ; $a
	const GOLFLEVELSTATE_GAME_OVER         ; $b
	const GOLFLEVELSTATE_PAUSE             ; $c
	const GOLFLEVELSTATE_RESULT            ; $d
