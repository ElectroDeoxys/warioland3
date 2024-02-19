	const_def
	const CUTSCENE_00 ; $00
	const CUTSCENE_01 ; $01
	const CUTSCENE_02 ; $02
	const CUTSCENE_03 ; $03
	const CUTSCENE_04 ; $04
	const CUTSCENE_05 ; $05
	const CUTSCENE_06 ; $06
	const CUTSCENE_07 ; $07
	const CUTSCENE_08 ; $08
	const CUTSCENE_09 ; $09
	const CUTSCENE_0A ; $0a
	const CUTSCENE_0B ; $0b
	const CUTSCENE_0C ; $0c
	const CUTSCENE_0D ; $0d
	const CUTSCENE_0E ; $0e
	const CUTSCENE_0F ; $0f
	const CUTSCENE_10 ; $10
	const CUTSCENE_11 ; $11
	const CUTSCENE_12 ; $12
	const CUTSCENE_13 ; $13
	const CUTSCENE_14 ; $14
	const CUTSCENE_15 ; $15
	const CUTSCENE_16 ; $16
	const CUTSCENE_17 ; $17
	const CUTSCENE_18 ; $18
	const CUTSCENE_19 ; $19
	const CUTSCENE_1A ; $1a
	const CUTSCENE_1B ; $1b
	const CUTSCENE_1C ; $1c
	const CUTSCENE_1D ; $1d
	const CUTSCENE_1E ; $1e
	const CUTSCENE_1F ; $1f
	const CUTSCENE_20 ; $20
	const CUTSCENE_21 ; $21
	const CUTSCENE_22 ; $22
	const CUTSCENE_23 ; $23
	const CUTSCENE_24 ; $24
	const CUTSCENE_25 ; $25
	const CUTSCENE_26 ; $26
	const CUTSCENE_27 ; $27
	const CUTSCENE_28 ; $28
	const CUTSCENE_29 ; $29
	const CUTSCENE_2A ; $2a
	const CUTSCENE_2B ; $2b
	const CUTSCENE_2C ; $2c
	const CUTSCENE_2D ; $2d
	const CUTSCENE_2E ; $2e
	const CUTSCENE_2F ; $2f
	const CUTSCENE_30 ; $30
	const CUTSCENE_31 ; $31
	const CUTSCENE_32 ; $32
	const CUTSCENE_33 ; $33
	const CUTSCENE_34 ; $34
	const CUTSCENE_35 ; $35
	const CUTSCENE_36 ; $36
	const CUTSCENE_37 ; $37
	const CUTSCENE_38 ; $38
	const CUTSCENE_39 ; $39
	const CUTSCENE_3A ; $3a
	const CUTSCENE_3B ; $3b
	const CUTSCENE_3C ; $3c
	const CUTSCENE_3D ; $3d
	const CUTSCENE_3E ; $3e
	const CUTSCENE_3F ; $3f
	const CUTSCENE_40 ; $40
	const CUTSCENE_41 ; $41
	const CUTSCENE_42 ; $42
	const CUTSCENE_43 ; $43
	const CUTSCENE_44 ; $44
	const CUTSCENE_45 ; $45
	const CUTSCENE_46 ; $46
	const CUTSCENE_47 ; $47
	const CUTSCENE_48 ; $48
	const CUTSCENE_49 ; $49
	const CUTSCENE_4A ; $4a
	const CUTSCENE_4B ; $4b
	const CUTSCENE_4C ; $4c
	const CUTSCENE_4D ; $4d
	const CUTSCENE_4E ; $4e
	const CUTSCENE_4F ; $4f
	const CUTSCENE_50 ; $50
	const CUTSCENE_51 ; $51
	const CUTSCENE_52 ; $52
	const CUTSCENE_53 ; $53
	const CUTSCENE_54 ; $54
	const CUTSCENE_55 ; $55
	const CUTSCENE_56 ; $56
	const CUTSCENE_57 ; $57
	const CUTSCENE_58 ; $58
	const CUTSCENE_59 ; $59
	const CUTSCENE_5A ; $5a
DEF NUM_CUTSCENES EQU const_value

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
	const TEMPLE_SCENE_ENTERING ; $00
	const TEMPLE_SCENE_TALKING  ; $01
	const TEMPLE_SCENE_EXITING  ; $02
	const TEMPLE_SCENE_HIDDEN_FIGURE_REVEAL       ; $03

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
