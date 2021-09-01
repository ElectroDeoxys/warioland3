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
	const TRANFORMATION_UNK_00              ; $00
	const TRANFORMATION_HOT_WARIO           ; $01
	const TRANFORMATION_FLAT_WARIO          ; $02
	const TRANFORMATION_BALL_O_STRING_WARIO ; $03
	const TRANFORMATION_FAT_WARIO           ; $04
	const TRANFORMATION_UNK_05              ; $05
	const TRANFORMATION_INVISIBLE_WARIO     ; $06
	const TRANFORMATION_UNK_07              ; $07
	const TRANFORMATION_ZOMBIE_WARIO        ; $08 
	const TRANFORMATION_BOUNCY_WARIO        ; $09
	const TRANFORMATION_CRAZY_WARIO         ; $0a
	const TRANFORMATION_VAMPIRE_WARIO       ; $0b
	const TRANFORMATION_UNK_0C              ; $0c
	const TRANFORMATION_UNK_0D              ; $0d
	const TRANFORMATION_OWL_WARIO           ; $0e
	const TRANFORMATION_UNK_0F              ; $0f
	const TRANFORMATION_SNOWMAN_WARIO       ; $10
	const TRANFORMATION_UNK_11              ; $11
	const TRANFORMATION_UNK_12              ; $12
	const TRANFORMATION_UNK_13              ; $13
	const TRANFORMATION_UNK_14              ; $14
	const TRANFORMATION_UNK_15              ; $15
	const TRANFORMATION_UNK_16              ; $16
	const TRANFORMATION_UNK_17              ; $17
	const TRANFORMATION_UNK_18              ; $18
	const TRANFORMATION_UNK_19              ; $19
	const TRANFORMATION_UNK_1A              ; $1a
	const TRANFORMATION_UNK_1B              ; $1b
	const TRANFORMATION_UNK_1C              ; $1c
	const TRANFORMATION_UNK_1D              ; $1d
	const TRANFORMATION_UNK_1E              ; $1e
	const TRANFORMATION_UNK_1F              ; $1f
