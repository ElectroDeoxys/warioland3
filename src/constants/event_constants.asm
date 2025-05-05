	const_def
	const EVENT_00 ; $00
	const EVENT_01 ; $01
	const EVENT_02 ; $02
	const EVENT_03 ; $03
	const EVENT_04 ; $04
	const EVENT_05 ; $05
	const EVENT_06 ; $06
	const EVENT_07 ; $07
	const EVENT_08 ; $08
	const EVENT_09 ; $09
	const EVENT_0A ; $0a
	const EVENT_0B ; $0b
	const EVENT_0C ; $0c
	const EVENT_0D ; $0d
	const EVENT_0E ; $0e
	const EVENT_0F ; $0f
	const EVENT_10 ; $10
	const EVENT_11 ; $11
	const EVENT_12 ; $12
	const EVENT_13 ; $13
	const EVENT_14 ; $14
	const EVENT_15 ; $15
	const EVENT_16 ; $16
	const EVENT_17 ; $17
	const EVENT_18 ; $18
	const EVENT_19 ; $19
	const EVENT_1A ; $1a
	const EVENT_1B ; $1b
	const EVENT_1C ; $1c
	const EVENT_1D ; $1d
	const EVENT_1E ; $1e
	const EVENT_1F ; $1f
	const EVENT_20 ; $20
	const EVENT_21 ; $21
	const EVENT_22 ; $22
	const EVENT_23 ; $23
	const EVENT_24 ; $24
	const EVENT_25 ; $25
	const EVENT_26 ; $26
	const EVENT_27 ; $27
	const EVENT_28 ; $28
	const EVENT_29 ; $29
	const EVENT_2A ; $2a
	const EVENT_2B ; $2b
	const EVENT_2C ; $2c
	const EVENT_2D ; $2d
	const EVENT_2E ; $2e
	const EVENT_2F ; $2f
	const EVENT_30 ; $30
	const EVENT_31 ; $31
	const EVENT_32 ; $32
	const EVENT_33 ; $33
	const EVENT_34 ; $34
	const EVENT_35 ; $35
	const EVENT_36 ; $36
	const EVENT_37 ; $37
	const EVENT_38 ; $38
	const EVENT_39 ; $39
	const EVENT_3A ; $3a
	const EVENT_3B ; $3b
	const EVENT_3C ; $3c
	const EVENT_3D ; $3d
	const EVENT_3E ; $3e
	const EVENT_3F ; $3f
	const EVENT_40 ; $40
	const EVENT_41 ; $41
	const EVENT_42 ; $42
	const EVENT_43 ; $43
	const EVENT_44 ; $44
	const EVENT_45 ; $45
	const EVENT_46 ; $46
	const EVENT_47 ; $47
	const EVENT_48 ; $48
	const EVENT_49 ; $49
	const EVENT_4A ; $4a
	const EVENT_4B ; $4b
	const EVENT_4C ; $4c
	const EVENT_4D ; $4d
	const EVENT_4E ; $4e
	const EVENT_4F ; $4f
	const EVENT_50 ; $50
	const EVENT_51 ; $51
	const EVENT_52 ; $52
	const EVENT_53 ; $53
	const EVENT_54 ; $54
	const EVENT_55 ; $55
	const EVENT_56 ; $56
	const EVENT_57 ; $57
	const EVENT_58 ; $58
	const EVENT_59 ; $59
	const EVENT_5A ; $5a
DEF NUM_EVENTS EQU const_value

	const_def
; WarioIdleGfx
	const SCENEWARIO_NONE                    ; $00
	const SCENEWARIO_LOOK_FRONT              ; $01
	const SCENEWARIO_LOOK_BACK               ; $02
	const SCENEWARIO_TURN_FRONT_RIGHT        ; $03
	const SCENEWARIO_TURN_FRONT_LEFT         ; $04
	const SCENEWARIO_TURN_BACK_LEFT          ; $05
	const SCENEWARIO_TURN_BACK_RIGHT         ; $06
DEF SCENEWARIO_GROUP_00 EQU const_value
; WarioWalkGfx
	const SCENEWARIO_WALK_LEFT               ; $07
	const SCENEWARIO_WALK_RIGHT              ; $08
	const SCENEWARIO_CARRY_WALK              ; $09
	const SCENEWARIO_CARRY_IDLE              ; $0a
DEF SCENEWARIO_GROUP_01 EQU const_value
; WarioThrowGfx
	const SCENEWARIO_PICKUP                  ; $0b
DEF SCENEWARIO_GROUP_02 EQU const_value
; WarioIdleGfx
	const SCENEWARIO_IDLE_LEFT               ; $0c
	const SCENEWARIO_IDLE_RIGHT              ; $0d
DEF SCENEWARIO_GROUP_03 EQU const_value
; WarioClearGfx
	const SCENEWARIO_NOD                     ; $0e
	const SCENEWARIO_NOD_ONCE                ; $0f
DEF SCENEWARIO_GROUP_04 EQU const_value
; WarioClearGfx
	const SCENEWARIO_LOOK_AROUND             ; $10
	const SCENEWARIO_LOOK_TURN_FORWARD       ; $11
	const SCENEWARIO_LOOK_FORWARD            ; $12
	const SCENEWARIO_LOOK_AROUND_THEN_TURN   ; $13
	const SCENEWARIO_LOOK_TURN_RIGHT         ; $14
DEF SCENEWARIO_GROUP_05 EQU const_value
; WarioUnk2Gfx
	const SCENEWARIO_ON_FIRE                 ; $15
	const SCENEWARIO_CRASH_LAND_RIGHT        ; $16
	const SCENEWARIO_CRASH_TUMBLE            ; $17
	const SCENEWARIO_CRASH_TUMBLE_END        ; $18
	const SCENEWARIO_STUNNED_RIGHT           ; $19
	const SCENEWARIO_LOOK_UP                 ; $1a
	const SCENEWARIO_CRASH_LAND_LEFT         ; $1b
	const SCENEWARIO_STUNNED_LEFT            ; $1c
DEF SCENEWARIO_GROUP_06 EQU const_value
; WarioUnk3Gfx
	const SCENEWARIO_LOOK_MUSIC_BOX          ; $1d
	const SCENEWARIO_PICKUP_MUSIC_BOX        ; $1e
	const SCENEWARIO_HOLD_MUSIC_BOX          ; $1f
	const SCENEWARIO_LOOK_UP_SURPRISED       ; $20
	const SCENEWARIO_CARRY_SNAP_FINGERS      ; $21
DEF SCENEWARIO_GROUP_07 EQU const_value
; WarioSleepGfx
	const SCENEWARIO_SLEEP                   ; $22
	const SCENEWARIO_WAKE_UP                 ; $23
	const SCENEWARIO_SIT_STILL               ; $24
	const SCENEWARIO_SIT_IDLE                ; $25
DEF SCENEWARIO_GROUP_08 EQU const_value
; WarioUnk4Gfx
	const SCENEWARIO_JUMP_AND_BOW            ; $26
	const SCENEWARIO_SNAP_FINGERS            ; $27
	const SCENEWARIO_SHOW_MUSIC_BOXES_1      ; $28
	const SCENEWARIO_SHOW_MUSIC_BOXES_5      ; $29
	const SCENEWARIO_PANIC_JUMP              ; $2a
	const SCENEWARIO_PANIC                   ; $2b
	const SCENEWARIO_BOW                     ; $2c
DEF SCENEWARIO_GROUP_19 EQU const_value
; WarioUnk5Gfx
	const SCENEWARIO_SHOW_MUSIC_BOXES_2      ; $2d
	const SCENEWARIO_SHOW_MUSIC_BOXES_3      ; $2e
	const SCENEWARIO_SHOW_MUSIC_BOXES_4      ; $2f
DEF SCENEWARIO_GROUP_10 EQU const_value
; WarioIdleGfx
	const SCENEWARIO_TURN_FRONT_TO_BACK_RIGHT ; $30
	const SCENEWARIO_TURN_FRONT_TO_BACK_LEFT  ; $31
	const SCENEWARIO_TURN_BACK_TO_RIGHT       ; $32
	const SCENEWARIO_TURN_BACK_TO_LEFT        ; $33
	const SCENEWARIO_TURN_RIGHT_TO_FRONT      ; $34
	const SCENEWARIO_TURN_LEFT_TO_FRONT       ; $35
	const SCENEWARIO_TURN_FRONT_TO_LEFT       ; $36
	const SCENEWARIO_TURN_FRONT_TO_RIGHT      ; $37
	const SCENEWARIO_TURN_LEFT_END            ; $38
	const SCENEWARIO_TURN_RIGHT_END           ; $39
DEF SCENEWARIO_GROUP_11 EQU const_value
; WarioHotGfx
	const SCENEWARIO_PANIC_RUN_LEFT          ; $3a
	const SCENEWARIO_PANIC_RUN_RIGHT         ; $3b
DEF SCENEWARIO_GROUP_12 EQU const_value
; WarioClearGfx
	const SCENEWARIO_IDLE_FRONT              ; $3c
DEF SCENEWARIO_GROUP_13 EQU const_value
DEF NUM_SCENEWARIO_STATES EQU const_value

DEF SCENEWARIO_GROUP_NONE EQU $ff

	const_def
	const TEMPLE_SCENE_ENTERING             ; $00
	const TEMPLE_SCENE_TALKING              ; $01
	const TEMPLE_SCENE_EXITING              ; $02
	const TEMPLE_SCENE_HIDDEN_FIGURE_REVEAL ; $03

; temple rock struct members
RSRESET
DEF TEMPLE_ROCK_ACTION       rb
DEF TEMPLE_ROCK_COUNTER      rb
DEF TEMPLE_ROCK_SIZE         rb
DEF TEMPLE_ROCK_RESPAWN_TIME rb
DEF TEMPLE_ROCK_STRUCT_LENGTH EQU _RS

DEF TEMPLE_ROCK_SIZE_LARGE EQU 2
DEF NUM_FALLING_TEMPLE_ROCKS EQU 6
DEF NUM_TEMPLE_ROCKS EQU 10
