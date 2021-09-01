DIRECTION_LEFT  EQU 0
DIRECTION_RIGHT EQU 1

; number of cycles before Wario falls asleep
; while in the idle state
NUM_SLEEPING_IDLE_CYCLES EQU 7

; power up level constants
	const_def
	const POWER_UP_NONE                     ; 0
	const POWER_UP_LEAD_OVERALLS            ; 1
	const POWER_UP_SWIMMING_FLIPPERS        ; 2
	const POWER_UP_HEAD_SMASH_HELMET        ; 3
	const POWER_UP_GRAB_GLOVE               ; 4
	const POWER_UP_GARLIC                   ; 5
	const POWER_UP_SUPER_JUMP_SLAM_OVERALLS ; 6
	const POWER_UP_HIGH_JUMP_BOOTS          ; 7
	const POWER_UP_PRINCE_FROGS_GLOVES      ; 8
	const POWER_UP_SUPER_GRAB_GLOVES        ; 9

; jump vel constants
MAX_JUMP_VEL_INDEX     EQU $27
FALLING_JUMP_VEL_INDEX EQU $18

	const_def
	const JUMP_VEL_NONE             ; 0
	const JUMP_VEL_KNOCK_BACK       ; 1
	const JUMP_VEL_NORMAL           ; 2
	const JUMP_VEL_HIGH_JUMP        ; 3
	const JUMP_VEL_BOUNCY_JUMP      ; 4
	const JUMP_VEL_BOUNCY_HIGH_JUMP ; 5

; number of times Wario has to wiggle
; to escape being picked up in the duration window
NUM_WIGGLES_TO_ESCAPE EQU 6
; duration window that Wario can decrement
MAX_PICKED_UP_FRAME_COUNTER EQU 32

; transformation constants
	const_def
	const TRANSFORMATION_UNK_00              ; $00
	const TRANSFORMATION_HOT_WARIO           ; $01
	const TRANSFORMATION_FLAT_WARIO          ; $02
	const TRANSFORMATION_BALL_O_STRING_WARIO ; $03
	const TRANSFORMATION_FAT_WARIO           ; $04
	const TRANSFORMATION_ELECTRIC            ; $05
	const TRANSFORMATION_INVISIBLE_WARIO     ; $06
	const TRANSFORMATION_PUFFY_WARIO         ; $07
	const TRANSFORMATION_ZOMBIE_WARIO        ; $08 
	const TRANSFORMATION_BOUNCY_WARIO        ; $09
	const TRANSFORMATION_CRAZY_WARIO         ; $0a
	const TRANSFORMATION_VAMPIRE_WARIO       ; $0b
	const TRANSFORMATION_UNK_0C              ; $0c
	const TRANSFORMATION_UNK_0D              ; $0d
	const TRANSFORMATION_OWL_WARIO           ; $0e
	const TRANSFORMATION_UNK_0F              ; $0f
	const TRANSFORMATION_SNOWMAN_WARIO       ; $10
	const TRANSFORMATION_UNK_11              ; $11
	const TRANSFORMATION_UNK_12              ; $12
	const TRANSFORMATION_UNK_13              ; $13
	const TRANSFORMATION_UNK_14              ; $14
	const TRANSFORMATION_UNK_15              ; $15
	const TRANSFORMATION_UNK_16              ; $16
	const TRANSFORMATION_UNK_17              ; $17
	const TRANSFORMATION_UNK_18              ; $18
	const TRANSFORMATION_UNK_19              ; $19
	const TRANSFORMATION_UNK_1A              ; $1a
	const TRANSFORMATION_UNK_1B              ; $1b
	const TRANSFORMATION_UNK_1C              ; $1c
	const TRANSFORMATION_UNK_1D              ; $1d
	const TRANSFORMATION_UNK_1E              ; $1e
	const TRANSFORMATION_UNK_1F              ; $1f
