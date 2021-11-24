DIRECTION_LEFT  EQU 0
DIRECTION_RIGHT EQU 1

; number of cycles before Wario falls asleep
; while in the idle state
NUM_SLEEPING_IDLE_CYCLES EQU 7

; number of attack frames on the ground
MAX_ATTACK_COUNTER EQU $30
; after wAttackCounter reaches this value
; Wario will start to charge 
CHARGE_ATTACK_COUNTER EQU $2b

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
	const_def 1
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
	const TRANSFORMATION_BUBBLE              ; $0c
	const TRANSFORMATION_ICE_SKATIN          ; $0d
	const TRANSFORMATION_OWL_WARIO           ; $0e
	const TRANSFORMATION_RAIL                ; $0f
	const TRANSFORMATION_SNOWMAN_WARIO       ; $10
	const TRANSFORMATION_SPLIT               ; $11
	const TRANSFORMATION_UNK_12              ; $12
	const TRANSFORMATION_BLIND               ; $13
	const TRANSFORMATION_UNK_14              ; $14
	const TRANSFORMATION_MAGIC               ; $15
	const TRANSFORMATION_BALL                ; $16
	const TRANSFORMATION_UNK_17              ; $17
	const TRANSFORMATION_UNK_18              ; $18
	const TRANSFORMATION_UNK_19              ; $19
	const TRANSFORMATION_UNK_1A              ; $1a
	const TRANSFORMATION_UNK_1B              ; $1b
	const TRANSFORMATION_UNK_1C              ; $1c
	const TRANSFORMATION_UNK_1D              ; $1d
	const TRANSFORMATION_UNK_1E              ; $1e
	const TRANSFORMATION_UNK_1F              ; $1f

HOT_WARIO_DURATION    EQU 600
FAT_WARIO_DURATION    EQU 420
BOUNCY_WARIO_DURATION EQU 900

; after this value is reached in the
; Hot Wario transformation duration,
; switch from OnFire to Hot state
HOT_WARIO_TRANSITION_DURATION EQU 300

; grab constants used for wGrabState
	const_def
	const GRAB_NONE                ; $0
	const GRAB_PICK_UP             ; $1
	const GRAB_UNK_02              ; $2
	const GRAB_IDLE                ; $3
	const GRAB_CHARGE_THROW        ; $4
	const GRAB_THROW_FULLY_CHARGED ; $5
	const GRAB_HOLD_FULL_CHARGE    ; $6
	const GRAB_THROW               ; $7

	const_def 4
	const GRAB_UNUSED_0_F    ; 4
	const GRAB_UNUSED_1_F    ; 5
	const GRAB_FULL_CHARGE_F ; 6
	const GRAB_HEAVY_F       ; 7

GRAB_FLAGS_MASK EQU (1 << GRAB_UNUSED_0_F) | (1 << GRAB_UNUSED_1_F) | (1 << GRAB_FULL_CHARGE_F) | (1 << GRAB_HEAVY_F)

; number of frames to reach fully charged throw
; with a light and heavy object
THROW_CHARGE_FRAMES_LIGHT EQU $1e
THROW_CHARGE_FRAMES_HEAVY EQU $3c

; touch state constants for wTouchState
	const_def
	const TOUCH_NONE         ; $0
	const TOUCH_VULNERABLE   ; $1
	const TOUCH_BUMP         ; $2
	const TOUCH_ATTACK       ; $3
	const TOUCH_VANISH       ; $4
	const TOUCH_PASS_THROUGH ; $5

; Wario states
	const_def
	const WST_IDLING                        ; 00
	const WST_WALKING                       ; 01
	const WST_TURNING                       ; 02
	const WST_UNUSED_03                     ; 03
	const WST_AIRBORNE                      ; 04
	const WST_LANDING                       ; 05
	const WST_CROUCH_SLIDING                ; 06
	const WST_ATTACKING                     ; 07
	const WST_ATTACKING_AIRBORNE            ; 08
	const WST_BUMPING                       ; 09
	const WST_DIVING                        ; 0a
	const WST_SUBMERGED                     ; 0b
	const WST_WATER_SURFACE_IDLING          ; 0c
	const WST_WATER_SURFACE_MOVING          ; 0d
	const WST_UNDERWATER_THRUSTING          ; 0e
	const WST_SWIM_KNOCK_BACK               ; 0f
	const WST_WATER_STUNG                   ; 10
	const WST_TRYING_SUBMERGE               ; 11
	const WST_CROUCHING                     ; 12
	const WST_CROUCH_WALKING                ; 13
	const WST_CROUCH_AIRBORNE               ; 14
	const WST_STUNG                         ; 15
	const WST_STUNG_RECOVERY                ; 16
	const WST_PIPE_GOING_DOWN               ; 17
	const WST_PIPE_GOING_UP                 ; 18
	const WST_ENEMY_BUMPING                 ; 19
	const WST_SMASH_ATTACKING               ; 1a
	const WST_UNUSED_1B                     ; 1b
	const WST_UNUSED_1C                     ; 1c
	const WST_UNUSED_1D                     ; 1d
	const WST_PICKING_UP                    ; 1e
	const WST_GRAB_IDLING                   ; 1f
	const WST_GRAB_WALKING                  ; 20
	const WST_GRAB_AIRBORNE                 ; 21
	const WST_THROW_CHARGING                ; 22
	const WST_THROW_FULLY_CHARGED           ; 23
	const WST_THROWING                      ; 24
	const WST_THROWING_AIRBORNE             ; 25
	const WST_GRAB_SMASH_ATTACKING          ; 26
	const WST_SLIDING                       ; 27
	const WST_ROLLING                       ; 28
	const WST_ROLLING_AIRBORNE              ; 29
	const WST_PICKED_UP                     ; 2a
	const WST_GROUND_SHAKE_STUNNED          ; 2b
	const WST_ENTERING_DOOR                 ; 2c
	const WST_UNUSED_2D                     ; 2d
	const WST_UNUSED_2E                     ; 2e
	const WST_UNUSED_2F                     ; 2f
	const WST_SLIPPING                      ; 30
	const WST_CROUCH_SLIPPING               ; 31
	const WST_DRAGGED_DOWN                  ; 32
	const WST_TELEPORTING                   ; 33
	const WST_TELEPORTING_WATER             ; 34
	const WST_SAND_FALLING                  ; 35
	const WST_SAND_JUMPING                  ; 36
	const WST_SAND_IDLING                   ; 37
	const WST_SAND_WALKING                  ; 38
	const WST_SAND_TURNING                  ; 39
	const WST_LADDER_CLIMBING               ; 3a
	const WST_LADDER_IDLING                 ; 3b
	const WST_LADDER_SHAKE_SLIDING          ; 3c
	const WST_GETTING_OFF_LADDER            ; 3d
	const WST_LADDER_SLIDING                ; 3e
	const WST_GRAB_SLIPPING                 ; 3f
	const WST_UNKNOWN_40                    ; 40
	const WST_UNKNOWN_41                    ; 41
	const WST_UNKNOWN_42                    ; 42
	const WST_UNKNOWN_43                    ; 43
	const WST_UNKNOWN_44                    ; 44
	const WST_UNKNOWN_45                    ; 45
	const WST_UNKNOWN_46                    ; 46
	const WST_UNKNOWN_47                    ; 47
	const WST_UNKNOWN_48                    ; 48
	const WST_UNKNOWN_49                    ; 49
	const WST_UNKNOWN_4A                    ; 4a
	const WST_SLEEPING                      ; 4b
	const WST_LADDER_SCRATCHING             ; 4c
	const WST_FENCE_SHAKE_SLIDING           ; 4d
	const WST_FENCE_MOVING_VERTICAL         ; 4e
	const WST_FENCE_IDLING                  ; 4f
	const WST_FENCE_MOVING_HORIZONTAL       ; 50
	const WST_FENCE_SLIDING                 ; 51
	const WST_UNUSED_52                     ; 52
	const WST_UNUSED_53                     ; 53
	const WST_UNUSED_54                     ; 54
	const WST_UNUSED_55                     ; 55
	const WST_UNUSED_56                     ; 56
	const WST_UNUSED_57                     ; 57
	const WST_UNUSED_58                     ; 58
	const WST_UNUSED_59                     ; 59
	const WST_UNUSED_5A                     ; 5a
	const WST_UNUSED_5B                     ; 5b
	const WST_UNUSED_5C                     ; 5c
	const WST_UNUSED_5D                     ; 5d
	const WST_UNUSED_5E                     ; 5e
	const WST_UNUSED_5F                     ; 5f
	const WST_ON_FIRE                       ; 60
	const WST_ON_FIRE_AIRBORNE              ; 61
	const WST_HOT                           ; 62
	const WST_HOT_AIRBORNE                  ; 63
	const WST_BURNT                         ; 64
	const WST_GETTING_FLAT_AIRBORNE         ; 65
	const WST_GETTING_FLAT                  ; 66
	const WST_FLAT_IDLING                   ; 67
	const WST_FLAT_WALKING                  ; 68
	const WST_FLAT_JUMPING                  ; 69
	const WST_FLAT_FALLING                  ; 6a
	const WST_FLAT_STRETCHING               ; 6b
	const WST_FLAT_SINKING                  ; 6c
	const WST_FLAT_STRETCHING_UNDERWATER    ; 6d
	const WST_FLAT_SQUISHED                 ; 6e
	const WST_FLAT_SQUISHED_LIFTING         ; 6f
	const WST_GETTING_WRAPPED_IN_STRING     ; 70
	const WST_BALL_O_STRING                 ; 71
	const WST_BALL_O_STRING_AIRBORNE        ; 72
	const WST_BALL_O_STRING_KNOCK_BACK      ; 73
	const WST_GETTING_UNWRAPPED_IN_STRING   ; 74
	const WST_BALL_O_STRING_DIZZY           ; 75
	const WST_FAT_BUMPING                   ; 76
	const WST_FAT_EATING                    ; 77
	const WST_FAT_IDLING                    ; 78
	const WST_FAT_WALKING                   ; 79
	const WST_FAT_TURNING                   ; 7a
	const WST_FAT_AIRBORNE                  ; 7b
	const WST_FAT_LANDING                   ; 7c
	const WST_FAT_SINKING                   ; 7d
	const WST_FAT_RECOVERING                ; 7e
	const WST_ELECTRIC_START                ; 7f
	const WST_ELECTRIC                      ; 80
	const WST_ELECTRIC_DIZZY                ; 81
	const WST_TURNING_INVISIBLE             ; 82
	const WST_PUFFY_INFLATING               ; 83
	const WST_PUFFY_RISING                  ; 84
	const WST_PUFFY_TURNING                 ; 85
	const WST_PUFFY_DEFLATING               ; 86
	const WST_ZOMBIE_IDLING                 ; 87
	const WST_ZOMBIE_WALKING                ; 88
	const WST_ZOMBIE_TURNING                ; 89
	const WST_ZOMBIE_AIRBORNE               ; 8a
	const WST_ZOMBIE_LANDING                ; 8b
	const WST_ZOMBIE_SLIPPING_THROUGH_FLOOR ; 8c
	const WST_ZOMBIE_RECOVERING             ; 8d
	const WST_ZOMBIE_KNOCK_BACK             ; 8e
	const WST_ZOMBIE_WRITHING               ; 8f
	const WST_BOUNCY_START                  ; 90
	const WST_BOUNCY_FLOOR                  ; 91
	const WST_BOUNCY_AIRBORNE               ; 92
	const WST_BOUNCY_CEILING                ; 93
	const WST_BOUNCY_UPSIDE_DOWN            ; 94
	const WST_BOUNCY_UPSIDE_DOWN_LANDING    ; 95
	const WST_BOUNCY_LAST_BOUNCE            ; 96
	const WST_CRAZY_SPINNING                ; 97
	const WST_CRAZY_DIZZY                   ; 98
	const WST_CRAZY                         ; 99
	const WST_CRAZY_TURNING                 ; 9a
	const WST_CRAZY_AIRBORNE                ; 9b
	const WST_VAMPIRE_IDLING                ; 9c
	const WST_VAMPIRE_WALKING               ; 9d
	const WST_VAMPIRE_TURNING               ; 9e
	const WST_VAMPIRE_AIRBORNE              ; 9f
	const WST_BAT_TRANSFORMING              ; a0
	const WST_BAT_IDLING                    ; a1
	const WST_VAMPIRE_TRANSFORMING          ; a2
	const WST_BAT_FLYING                    ; a3
	const WST_BAT_FALLING                   ; a4
	const WST_IN_BUBBLE                     ; a5
	const WST_UNUSED_A6                     ; a6
	const WST_UNUSED_A7                     ; a7
	const WST_UNUSED_A8                     ; a8
	const WST_UNUSED_A9                     ; a9
	const WST_UNUSED_AA                     ; aa
	const WST_UNUSED_AB                     ; ab
	const WST_UNUSED_AC                     ; ac
	const WST_UNUSED_AD                     ; ad
	const WST_UNUSED_AE                     ; ae
	const WST_UNUSED_AF                     ; af
	const WST_ICE_SKATIN_START              ; b0
	const WST_ICE_SKATIN                    ; b1
	const WST_ICE_SKATIN_AIRBORNE           ; b2
	const WST_ICE_SKATIN_CRASH              ; b3
	const WST_UNUSED_B4                     ; b4
	const WST_UNUSED_B5                     ; b5
	const WST_UNUSED_B6                     ; b6
	const WST_UNUSED_B7                     ; b7
	const WST_UNKNOWN_B8                    ; b8
	const WST_UNKNOWN_B9                    ; b9
	const WST_UNKNOWN_BA                    ; ba
	const WST_UNKNOWN_BB                    ; bb
	const WST_UNKNOWN_BC                    ; bc
	const WST_UNUSED_BD                     ; bd
	const WST_UNUSED_BE                     ; be
	const WST_UNUSED_BF                     ; bf
	const WST_HANGING_RAIL                  ; c0
	const WST_UNUSED_C1                     ; c1
	const WST_UNUSED_C2                     ; c2
	const WST_UNUSED_C3                     ; c3
	const WST_UNKNOWN_C4                    ; c4
	const WST_UNKNOWN_C5                    ; c5
	const WST_UNKNOWN_C6                    ; c6
	const WST_UNKNOWN_C7                    ; c7
	const WST_UNKNOWN_C8                    ; c8
	const WST_UNKNOWN_C9                    ; c9
	const WST_UNKNOWN_CA                    ; ca
	const WST_UNKNOWN_CB                    ; cb
	const WST_UNKNOWN_CC                    ; cc
	const WST_UNKNOWN_CD                    ; cd
	const WST_UNUSED_CE                     ; ce
	const WST_UNUSED_CF                     ; cf
	const WST_SPLIT_HIT                     ; d0
	const WST_SPLIT_KNOCKED_BACK            ; d1
	const WST_SPLITTING                     ; d2
	const WST_UNKNOWN_D3                    ; d3
	const WST_UNKNOWN_D4                    ; d4
	const WST_UNKNOWN_D5                    ; d5
	const WST_UNKNOWN_D6                    ; d6
	const WST_UNKNOWN_D7                    ; d7
	const WST_UNKNOWN_D8                    ; d8
	const WST_UNUSED_D9                     ; d9
	const WST_UNUSED_DA                     ; da
	const WST_UNUSED_DB                     ; db
	const WST_BLIND_IDLING                  ; dc
	const WST_BLIND_WALKING                 ; dd
	const WST_BLIND_TURNING                 ; de
	const WST_BLIND_AIRBORNE                ; df
	const WST_UNKNOWN_E0                    ; e0
	const WST_UNKNOWN_E1                    ; e1
	const WST_UNKNOWN_E2                    ; e2
	const WST_UNUSED_E3                     ; e3
	const WST_MAGIC_RISING                  ; e4
	const WST_MAGIC_STOPPING                ; e5
	const WST_UNKNOWN_E6                    ; e6
	const WST_UNUSED_E7                     ; e7
	const WST_BALL_START                    ; e8
	const WST_BALL_BOUNCING                 ; e9
	const WST_BALL_AIRBORNE                 ; ea
	const WST_BALL_SHOT                     ; eb
	const WST_BALL_THROWN                   ; ec
	const WST_BALL_SENT_UPWARDS             ; ed
	const WST_BALL_TURNING                  ; ee
	const WST_UNUSED_EF                     ; ef
	const WST_UNUSED_F0                     ; f0
	const WST_UNUSED_F1                     ; f1
	const WST_UNUSED_F2                     ; f2
