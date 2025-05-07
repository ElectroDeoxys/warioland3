; number of cycles before Wario falls asleep
; while in the idle state
DEF NUM_SLEEPING_IDLE_CYCLES EQU 7

; number of attack frames on the ground
DEF MAX_ATTACK_COUNTER EQU $30
; after wAttackCounter reaches this value
; Wario will start to charge
DEF CHARGE_ATTACK_COUNTER EQU $2b

; power up level constants
	const_def
	const NO_POWER_UP              ; 0
	const LEAD_OVERALLS            ; 1
	const SWIMMING_FLIPPERS        ; 2
	const HEAD_SMASH_HELMET        ; 3
	const GRAB_GLOVE               ; 4
	const GARLIC                   ; 5
	const SUPER_JUMP_SLAM_OVERALLS ; 6
	const HIGH_JUMP_BOOTS          ; 7
	const PRINCE_FROGS_GLOVES      ; 8
	const SUPER_GRAB_GLOVES        ; 9
DEF NUM_MAIN_POWER_UPS EQU const_value

	; special power-ups for Action Help
	const POWER_UP_OWL             ; a
	const POWER_UP_RAIL            ; b
	const POWER_UP_VAMPIRE         ; c
DEF NUM_SPECIAL_POWER_UPS EQU const_value - NUM_MAIN_POWER_UPS
DEF NUM_TOTAL_POWER_UPS EQU const_value

DEF POWER_UP_MASK EQU %111111

; transformation constants
	const_def
	const TRANSFORMATION_NONE_ID                ; $00
	const TRANSFORMATION_HOT_WARIO_ID           ; $01
	const TRANSFORMATION_FLAT_WARIO_ID          ; $02
	const TRANSFORMATION_BALL_O_STRING_WARIO_ID ; $03
	const TRANSFORMATION_FAT_WARIO_ID           ; $04
	const TRANSFORMATION_ELECTRIC_ID            ; $05
	const TRANSFORMATION_INVISIBLE_WARIO_ID     ; $06
	const TRANSFORMATION_PUFFY_WARIO_ID         ; $07
	const TRANSFORMATION_ZOMBIE_WARIO_ID        ; $08
	const TRANSFORMATION_BOUNCY_WARIO_ID        ; $09
	const TRANSFORMATION_CRAZY_WARIO_ID         ; $0a
	const TRANSFORMATION_VAMPIRE_WARIO_ID       ; $0b
	const TRANSFORMATION_BUBBLE_ID              ; $0c
	const TRANSFORMATION_ICE_SKATIN_ID          ; $0d
	const TRANSFORMATION_OWL_WARIO_ID           ; $0e
	const TRANSFORMATION_RAIL_ID                ; $0f
	const TRANSFORMATION_SNOWMAN_WARIO_ID       ; $10
	const TRANSFORMATION_SPLIT_ID               ; $11
	const TRANSFORMATION_FAN_ID                 ; $12
	const TRANSFORMATION_BLIND_ID               ; $13
	const TRANSFORMATION_LAUNCHED_ID            ; $14
	const TRANSFORMATION_MAGIC_ID               ; $15
	const TRANSFORMATION_BALL_ID                ; $16
	const TRANSFORMATION_UNUSED_17_ID           ; $17
	const TRANSFORMATION_UNUSED_18_ID           ; $18
	const TRANSFORMATION_UNUSED_19_ID           ; $19
	const TRANSFORMATION_UNUSED_1A_ID           ; $1a
	const TRANSFORMATION_UNUSED_1B_ID           ; $1b
	const TRANSFORMATION_UNUSED_1C_ID           ; $1c
	const TRANSFORMATION_UNUSED_1D_ID           ; $1d
	const TRANSFORMATION_UNUSED_1E_ID           ; $1e
	const TRANSFORMATION_UNUSED_1F_ID           ; $1f
DEF NUM_TRANSFORMATIONS EQU const_value

; flags that give a transformation some more properties:
; - persistent flag which makes Wario immune to other transformations,
; - Super Smash flag which gives him the power to smash through blocks underneath
	const_def 6
	const TRANSFORMATIONF_PERSISTENT_F  ; 6
	const TRANSFORMATIONF_SUPER_SMASH_F ; 7

DEF TRANSFORMATIONF_PERSISTENT  EQU 1 << TRANSFORMATIONF_PERSISTENT_F
DEF TRANSFORMATIONF_SUPER_SMASH EQU 1 << TRANSFORMATIONF_SUPER_SMASH_F

DEF TRANSFORMATION_NONE                EQU TRANSFORMATION_NONE_ID
DEF TRANSFORMATION_HOT_WARIO           EQU TRANSFORMATION_HOT_WARIO_ID | TRANSFORMATIONF_PERSISTENT | TRANSFORMATIONF_SUPER_SMASH
DEF TRANSFORMATION_FLAT_WARIO          EQU TRANSFORMATION_FLAT_WARIO_ID | TRANSFORMATIONF_PERSISTENT
DEF TRANSFORMATION_BALL_O_STRING_WARIO EQU TRANSFORMATION_BALL_O_STRING_WARIO_ID | TRANSFORMATIONF_PERSISTENT | TRANSFORMATIONF_SUPER_SMASH
DEF TRANSFORMATION_FAT_WARIO           EQU TRANSFORMATION_FAT_WARIO_ID | TRANSFORMATIONF_SUPER_SMASH
DEF TRANSFORMATION_ELECTRIC            EQU TRANSFORMATION_ELECTRIC_ID | TRANSFORMATIONF_SUPER_SMASH
DEF TRANSFORMATION_INVISIBLE_WARIO     EQU TRANSFORMATION_INVISIBLE_WARIO_ID
DEF TRANSFORMATION_PUFFY_WARIO         EQU TRANSFORMATION_PUFFY_WARIO_ID
DEF TRANSFORMATION_ZOMBIE_WARIO        EQU TRANSFORMATION_ZOMBIE_WARIO_ID | TRANSFORMATIONF_PERSISTENT
DEF TRANSFORMATION_BOUNCY_WARIO        EQU TRANSFORMATION_BOUNCY_WARIO_ID
DEF TRANSFORMATION_CRAZY_WARIO         EQU TRANSFORMATION_CRAZY_WARIO_ID
DEF TRANSFORMATION_VAMPIRE_WARIO       EQU TRANSFORMATION_VAMPIRE_WARIO_ID | TRANSFORMATIONF_PERSISTENT
DEF TRANSFORMATION_BUBBLE              EQU TRANSFORMATION_BUBBLE_ID | TRANSFORMATIONF_PERSISTENT
DEF TRANSFORMATION_ICE_SKATIN          EQU TRANSFORMATION_ICE_SKATIN_ID | TRANSFORMATIONF_PERSISTENT
DEF TRANSFORMATION_OWL_WARIO           EQU TRANSFORMATION_OWL_WARIO_ID
DEF TRANSFORMATION_RAIL                EQU TRANSFORMATION_RAIL_ID
DEF TRANSFORMATION_SNOWMAN_WARIO       EQU TRANSFORMATION_SNOWMAN_WARIO_ID | TRANSFORMATIONF_PERSISTENT
DEF TRANSFORMATION_SPLIT               EQU TRANSFORMATION_SPLIT_ID | TRANSFORMATIONF_PERSISTENT
DEF TRANSFORMATION_FAN                 EQU TRANSFORMATION_FAN_ID
DEF TRANSFORMATION_BLIND               EQU TRANSFORMATION_BLIND_ID | TRANSFORMATIONF_PERSISTENT
DEF TRANSFORMATION_LAUNCHED            EQU TRANSFORMATION_LAUNCHED_ID | TRANSFORMATIONF_PERSISTENT
DEF TRANSFORMATION_MAGIC               EQU TRANSFORMATION_MAGIC_ID | TRANSFORMATIONF_PERSISTENT
DEF TRANSFORMATION_BALL                EQU TRANSFORMATION_BALL_ID | TRANSFORMATIONF_PERSISTENT

DEF HOT_WARIO_DURATION    EQU 600
DEF FAT_WARIO_DURATION    EQU 420
DEF BOUNCY_WARIO_DURATION EQU 900

; after this value is reached in the
; Hot Wario transformation duration,
; switch from OnFire to Hot state
DEF HOT_WARIO_TRANSITION_DURATION EQU 300

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

DEF GRAB_FLAGS_MASK EQU (1 << GRAB_UNUSED_0_F) | (1 << GRAB_UNUSED_1_F) | (1 << GRAB_FULL_CHARGE_F) | (1 << GRAB_HEAVY_F)
DEF GRAB_STATE_MASK EQU $ff ^ GRAB_FLAGS_MASK

; number of frames to reach fully charged throw
; with a light and heavy object
DEF THROW_CHARGE_FRAMES_LIGHT EQU $1e
DEF THROW_CHARGE_FRAMES_HEAVY EQU $3c

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
	const WST_IDLING                        ; $00
	const WST_WALKING                       ; $01
	const WST_TURNING                       ; $02
	const WST_UNUSED_03                     ; $03
	const WST_AIRBORNE                      ; $04
	const WST_LANDING                       ; $05
	const WST_CROUCH_SLIDING                ; $06
	const WST_ATTACKING                     ; $07
	const WST_ATTACKING_AIRBORNE            ; $08
	const WST_BUMPING                       ; $09
	const WST_DIVING                        ; $0a
	const WST_SUBMERGED                     ; $0b
	const WST_WATER_SURFACE_IDLING          ; $0c
	const WST_WATER_SURFACE_MOVING          ; $0d
	const WST_UNDERWATER_THRUSTING          ; $0e
	const WST_SWIM_KNOCK_BACK               ; $0f
	const WST_WATER_STUNG                   ; $10
	const WST_TRYING_SUBMERGE               ; $11
	const WST_CROUCHING                     ; $12
	const WST_CROUCH_WALKING                ; $13
	const WST_CROUCH_AIRBORNE               ; $14
	const WST_STUNG                         ; $15
	const WST_STUNG_RECOVERY                ; $16
	const WST_PIPE_GOING_DOWN               ; $17
	const WST_PIPE_GOING_UP                 ; $18
	const WST_ENEMY_BUMPING                 ; $19
	const WST_SMASH_ATTACKING               ; $1a
	const WST_UNUSED_1B                     ; $1b
	const WST_UNUSED_1C                     ; $1c
	const WST_UNUSED_1D                     ; $1d
	const WST_PICKING_UP                    ; $1e
	const WST_GRAB_IDLING                   ; $1f
	const WST_GRAB_WALKING                  ; $20
	const WST_GRAB_AIRBORNE                 ; $21
	const WST_THROW_CHARGING                ; $22
	const WST_THROW_FULLY_CHARGED           ; $23
	const WST_THROWING                      ; $24
	const WST_THROWING_AIRBORNE             ; $25
	const WST_GRAB_SMASH_ATTACKING          ; $26
	const WST_SLIDING                       ; $27
	const WST_ROLLING                       ; $28
	const WST_ROLLING_AIRBORNE              ; $29
	const WST_PICKED_UP                     ; $2a
	const WST_GROUND_SHAKE_STUNNED          ; $2b
	const WST_ENTERING_DOOR                 ; $2c
	const WST_UNUSED_2D                     ; $2d
	const WST_UNUSED_2E                     ; $2e
	const WST_UNUSED_2F                     ; $2f
DEF WARIO_STATES_GROUP_1 EQU const_value
	const WST_SLIPPING                      ; $30
	const WST_CROUCH_SLIPPING               ; $31
	const WST_DRAGGED_DOWN                  ; $32
	const WST_TELEPORTING                   ; $33
	const WST_WATER_TELEPORTING             ; $34
	const WST_SAND_FALLING                  ; $35
	const WST_SAND_JUMPING                  ; $36
	const WST_SAND_IDLING                   ; $37
	const WST_SAND_WALKING                  ; $38
	const WST_SAND_TURNING                  ; $39
	const WST_LADDER_CLIMBING               ; $3a
	const WST_LADDER_IDLING                 ; $3b
	const WST_LADDER_SHAKE_SLIDING          ; $3c
	const WST_GETTING_OFF_LADDER            ; $3d
	const WST_LADDER_SLIDING                ; $3e
	const WST_GRAB_SLIPPING                 ; $3f
	const WST_GET_TREASURE_START            ; $40
	const WST_GET_TREASURE_WALK_1           ; $41
	const WST_GET_TREASURE_TURN_FRONT_1     ; $42
	const WST_GET_TREASURE_LAUGH            ; $43
	const WST_GET_TREASURE_TURN_BACK        ; $44
	const WST_GET_TREASURE_OPEN             ; $45
	const WST_GET_TREASURE_TURN_WALK        ; $46
	const WST_GET_TREASURE_WALK_2           ; $47
	const WST_GET_TREASURE_TURN_FRONT_2     ; $48
	const WST_GET_TREASURE_LOOK_FRONT       ; $49
	const WST_GET_TREASURE_CLEAR            ; $4a
	const WST_SLEEPING                      ; $4b
	const WST_LADDER_SCRATCHING             ; $4c
	const WST_FENCE_SHAKE_SLIDING           ; $4d
	const WST_FENCE_MOVING_VERTICAL         ; $4e
	const WST_FENCE_IDLING                  ; $4f
	const WST_FENCE_MOVING_HORIZONTAL       ; $50
	const WST_FENCE_SLIDING                 ; $51
	const WST_UNUSED_52                     ; $52
	const WST_UNUSED_53                     ; $53
	const WST_UNUSED_54                     ; $54
	const WST_UNUSED_55                     ; $55
	const WST_UNUSED_56                     ; $56
	const WST_UNUSED_57                     ; $57
	const WST_UNUSED_58                     ; $58
	const WST_UNUSED_59                     ; $59
	const WST_UNUSED_5A                     ; $5a
	const WST_UNUSED_5B                     ; $5b
	const WST_UNUSED_5C                     ; $5c
	const WST_UNUSED_5D                     ; $5d
	const WST_UNUSED_5E                     ; $5e
	const WST_UNUSED_5F                     ; $5f
DEF WARIO_STATES_GROUP_2 EQU const_value
	const WST_ON_FIRE                       ; $60
	const WST_ON_FIRE_AIRBORNE              ; $61
	const WST_HOT                           ; $62
	const WST_HOT_AIRBORNE                  ; $63
	const WST_BURNT                         ; $64
	const WST_GETTING_FLAT_AIRBORNE         ; $65
	const WST_GETTING_FLAT                  ; $66
	const WST_FLAT_IDLING                   ; $67
	const WST_FLAT_WALKING                  ; $68
	const WST_FLAT_JUMPING                  ; $69
	const WST_FLAT_FALLING                  ; $6a
	const WST_FLAT_STRETCHING               ; $6b
	const WST_FLAT_SINKING                  ; $6c
	const WST_FLAT_STRETCHING_UNDERWATER    ; $6d
	const WST_FLAT_SQUISHED                 ; $6e
	const WST_FLAT_SQUISHED_LIFTING         ; $6f
	const WST_GETTING_WRAPPED_IN_STRING     ; $70
	const WST_BALL_O_STRING                 ; $71
	const WST_BALL_O_STRING_AIRBORNE        ; $72
	const WST_BALL_O_STRING_KNOCK_BACK      ; $73
	const WST_GETTING_UNWRAPPED_IN_STRING   ; $74
	const WST_BALL_O_STRING_DIZZY           ; $75
	const WST_FAT_BUMPING                   ; $76
	const WST_FAT_EATING                    ; $77
	const WST_FAT_IDLING                    ; $78
	const WST_FAT_WALKING                   ; $79
	const WST_FAT_TURNING                   ; $7a
	const WST_FAT_AIRBORNE                  ; $7b
	const WST_FAT_LANDING                   ; $7c
	const WST_FAT_SINKING                   ; $7d
	const WST_FAT_RECOVERING                ; $7e
	const WST_ELECTRIC_START                ; $7f
	const WST_ELECTRIC                      ; $80
	const WST_ELECTRIC_DIZZY                ; $81
	const WST_TURNING_INVISIBLE             ; $82
	const WST_PUFFY_INFLATING               ; $83
	const WST_PUFFY_RISING                  ; $84
	const WST_PUFFY_TURNING                 ; $85
	const WST_PUFFY_DEFLATING               ; $86
	const WST_ZOMBIE_IDLING                 ; $87
	const WST_ZOMBIE_WALKING                ; $88
	const WST_ZOMBIE_TURNING                ; $89
	const WST_ZOMBIE_AIRBORNE               ; $8a
	const WST_ZOMBIE_LANDING                ; $8b
	const WST_ZOMBIE_SLIPPING_THROUGH_FLOOR ; $8c
	const WST_ZOMBIE_RECOVERING             ; $8d
	const WST_ZOMBIE_KNOCK_BACK             ; $8e
	const WST_ZOMBIE_WRITHING               ; $8f
	const WST_BOUNCY_START                  ; $90
	const WST_BOUNCY_FLOOR                  ; $91
	const WST_BOUNCY_AIRBORNE               ; $92
	const WST_BOUNCY_CEILING                ; $93
	const WST_BOUNCY_UPSIDE_DOWN            ; $94
	const WST_BOUNCY_UPSIDE_DOWN_LANDING    ; $95
	const WST_BOUNCY_LAST_BOUNCE            ; $96
	const WST_CRAZY_SPINNING                ; $97
	const WST_CRAZY_DIZZY                   ; $98
	const WST_CRAZY                         ; $99
	const WST_CRAZY_TURNING                 ; $9a
	const WST_CRAZY_AIRBORNE                ; $9b
	const WST_VAMPIRE_IDLING                ; $9c
	const WST_VAMPIRE_WALKING               ; $9d
	const WST_VAMPIRE_TURNING               ; $9e
	const WST_VAMPIRE_AIRBORNE              ; $9f
	const WST_BAT_TRANSFORMING              ; $a0
	const WST_BAT_IDLING                    ; $a1
	const WST_VAMPIRE_TRANSFORMING          ; $a2
	const WST_BAT_FLYING                    ; $a3
	const WST_BAT_FALLING                   ; $a4
	const WST_IN_BUBBLE                     ; $a5
	const WST_UNUSED_A6                     ; $a6
	const WST_UNUSED_A7                     ; $a7
	const WST_UNUSED_A8                     ; $a8
	const WST_UNUSED_A9                     ; $a9
	const WST_UNUSED_AA                     ; $aa
	const WST_UNUSED_AB                     ; $ab
	const WST_UNUSED_AC                     ; $ac
	const WST_UNUSED_AD                     ; $ad
	const WST_UNUSED_AE                     ; $ae
	const WST_UNUSED_AF                     ; $af
DEF WARIO_STATES_GROUP_3 EQU const_value
	const WST_ICE_SKATIN_START              ; $b0
	const WST_ICE_SKATIN                    ; $b1
	const WST_ICE_SKATIN_AIRBORNE           ; $b2
	const WST_ICE_SKATIN_CRASH              ; $b3
	const WST_UNUSED_B4                     ; $b4
	const WST_UNUSED_B5                     ; $b5
	const WST_UNUSED_B6                     ; $b6
	const WST_UNUSED_B7                     ; $b7
	const WST_GRABBING_OWL                  ; $b8
	const WST_OWL_SLOW                      ; $b9
	const WST_OWL_FAST                      ; $ba
	const WST_RELEASING_OWL                 ; $bb
	const WST_FALLING_FROM_OWL              ; $bc
	const WST_UNUSED_BD                     ; $bd
	const WST_UNUSED_BE                     ; $be
	const WST_UNUSED_BF                     ; $bf
	const WST_HANGING_RAIL                  ; $c0
	const WST_UNUSED_C1                     ; $c1
	const WST_UNUSED_C2                     ; $c2
	const WST_UNUSED_C3                     ; $c3
	const WST_SNOWMAN_START                 ; $c4
	const WST_SNOWMAN_IDLE                  ; $c5
	const WST_SNOWMAN_WALKING               ; $c6
	const WST_SNOWMAN_TURNING               ; $c7
	const WST_SNOWMAN_AIRBORNE              ; $c8
	const WST_SNOWMAN_LANDING               ; $c9
	const WST_SNOWMAN_BUMPED                ; $ca
	const WST_SNOWBALL_ROLLING              ; $cb
	const WST_SNOWBALL_AIRBORNE             ; $cc
	const WST_SNOWBALL_CRASH                ; $cd
	const WST_UNUSED_CE                     ; $ce
	const WST_UNUSED_CF                     ; $cf
	const WST_SPLIT_HIT                     ; $d0
	const WST_SPLIT_KNOCKED_BACK            ; $d1
	const WST_SPLITTING                     ; $d2
	const WST_SPLITTING_AIRBORNE            ; $d3
	const WST_FAN_START                     ; $d4
	const WST_FAN_LIFTING                   ; $d5
	const WST_FAN_TURNING                   ; $d6
	const WST_FAN_SPINNING                  ; $d7
	const WST_FAN_RECOVERING                ; $d8
	const WST_UNUSED_D9                     ; $d9
	const WST_UNUSED_DA                     ; $da
	const WST_UNUSED_DB                     ; $db
	const WST_BLIND_IDLING                  ; $dc
	const WST_BLIND_WALKING                 ; $dd
	const WST_BLIND_TURNING                 ; $de
	const WST_BLIND_AIRBORNE                ; $df
	const WST_SWALLOWED                     ; $e0
	const WST_LAUNCHED                      ; $e1
	const WST_LAUCH_CRASH                   ; $e2
	const WST_UNUSED_E3                     ; $e3
	const WST_MAGIC_RISING                  ; $e4
	const WST_MAGIC_STOPPING                ; $e5
	const WST_MAGIC_RECOVERING              ; $e6
	const WST_UNUSED_E7                     ; $e7
	const WST_BALL_START                    ; $e8
	const WST_BALL_BOUNCING                 ; $e9
	const WST_BALL_AIRBORNE                 ; $ea
	const WST_BALL_SHOT                     ; $eb
	const WST_BALL_THROWN                   ; $ec
	const WST_BALL_SENT_UPWARDS             ; $ed
	const WST_BALL_TURNING                  ; $ee
	const WST_UNUSED_EF                     ; $ef
	const WST_UNUSED_F0                     ; $f0
	const WST_UNUSED_F1                     ; $f1
	const WST_UNUSED_F2                     ; $f2
