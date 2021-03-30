DIRECTION_LEFT  EQU 0
DIRECTION_RIGHT EQU 1

; number of cycles before Wario falls asleep
;while in the idle state
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