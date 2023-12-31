DEF DIRECTION_LEFT  EQU 0
DEF DIRECTION_RIGHT EQU 1

; jump vel constants
DEF MAX_JUMP_VEL_INDEX     EQU $27
DEF FALLING_JUMP_VEL_INDEX EQU $18

	const_def
	const JUMP_VEL_NONE             ; 0
	const JUMP_VEL_KNOCK_BACK       ; 1
	const JUMP_VEL_NORMAL           ; 2
	const JUMP_VEL_HIGH_JUMP        ; 3
	const JUMP_VEL_BOUNCY_JUMP      ; 4
	const JUMP_VEL_BOUNCY_HIGH_JUMP ; 5

; number of times Wario has to wiggle
; to escape being picked up in the duration window
DEF NUM_WIGGLES_TO_ESCAPE EQU 6
; duration window that Wario can decrement
DEF MAX_PICKED_UP_FRAME_COUNTER EQU 32

; wFloorTransitionDir flags
DEF FLOOR_TRANSITION_DOWN_F EQU 2
DEF FLOOR_TRANSITION_UP_F   EQU 3

DEF FLOOR_TRANSITION_DOWN  EQU 1 << FLOOR_TRANSITION_DOWN_F
DEF FLOOR_TRANSITION_UP    EQU 1 << FLOOR_TRANSITION_UP_F

; wCameraConfigFlags constants
	const_def
	const CAM_FREE_F        ; 0
	const CAM_XSCROLL1_F    ; 1
	const CAM_XSCROLL2_F    ; 2
	const CAM_TRANSITIONS_F ; 3

	const CAM_EDGE_RIGHT_F  ; 4
	const CAM_EDGE_LEFT_F   ; 5
	const CAM_EDGE_UP_F     ; 6
	const CAM_EDGE_DOWN_F   ; 7

DEF CAM_YSCROLL     EQU 0
DEF CAM_FREE        EQU 1 << CAM_FREE_F
DEF CAM_XSCROLL1    EQU 1 << CAM_XSCROLL1_F
DEF CAM_XSCROLL2    EQU 1 << CAM_XSCROLL2_F
DEF CAM_TRANSITIONS EQU 1 << CAM_TRANSITIONS_F
DEF CAM_EDGE_RIGHT  EQU 1 << CAM_EDGE_RIGHT_F
DEF CAM_EDGE_LEFT   EQU 1 << CAM_EDGE_LEFT_F
DEF CAM_EDGE_UP     EQU 1 << CAM_EDGE_UP_F
DEF CAM_EDGE_DOWN   EQU 1 << CAM_EDGE_DOWN_F

DEF CAM_SCROLLING_MASK EQU $0f

DEF HIDDEN_FIGURE_CAMCONFIG EQU CAM_XSCROLL2 | CAM_TRANSITIONS | CAM_EDGE_RIGHT | CAM_EDGE_LEFT

; flags set for wWaterCurrent
	const_def
	const CURRENT_RIGHT_F ; 0
	const CURRENT_LEFT_F  ; 1
	const CURRENT_UP_F    ; 2
	const CURRENT_DOWN_F  ; 3

DEF CURRENT_RIGHT EQU 1 << CURRENT_RIGHT_F
DEF CURRENT_LEFT  EQU 1 << CURRENT_LEFT_F
DEF CURRENT_UP    EQU 1 << CURRENT_UP_F
DEF CURRENT_DOWN  EQU 1 << CURRENT_DOWN_F
