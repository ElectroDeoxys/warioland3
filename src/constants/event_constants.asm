	const_def
	const EVENT_00                        ; $00
	const EVENT_PROLOGUE                  ; $01
	const EVENT_CUT_TREE                  ; $02
	const EVENT_OPEN_NORTH_GATE           ; $03
	const EVENT_EXPEL_TORNADO             ; $04
	const EVENT_LEAD_OVERALLS             ; $05
	const EVENT_RAINSTORM                 ; $06
	const EVENT_FIX_ELEVATOR              ; $07
	const EVENT_YELLOW_MUSIC_BOX          ; $08
	const EVENT_PLANT_SEEDS               ; $09
	const EVENT_RAISE_TOWER               ; $0a
	const EVENT_SWIMMING_FLIPPERS         ; $0b
	const EVENT_BLOW_MIST                 ; $0c
	const EVENT_SUMMON_SNAKES             ; $0d
	const EVENT_FREEZE_SEA                ; $0e
	const EVENT_HEAD_SMASH_HELMET         ; $0f
	const EVENT_BLUE_MUSIC_BOX            ; $10
	const EVENT_SUMMON_LIGHTNING          ; $11
	const EVENT_GRAB_GLOVE                ; $12
	const EVENT_FOOT_STONE                ; $13
	const EVENT_VOLCANO_ERUPTION          ; $14
	const EVENT_OPEN_BLUE_SNAKE_DOOR      ; $15
	const EVENT_GARLIC                    ; $16
	const EVENT_GREEN_MUSIC_BOX           ; $17
	const EVENT_PURIFY_WATER              ; $18
	const EVENT_REVEAL_CASTLE             ; $19
	const EVENT_SUPER_JUMP_SLAM_OVERALLS  ; $1a
	const EVENT_SUMMON_SUN                ; $1b
	const EVENT_HIGH_JUMP_BOOTS           ; $1c
	const EVENT_RED_MUSIC_BOX             ; $1d
	const EVENT_EXPLODE_BOMBS             ; $1e
	const EVENT_LEAVES_FALL               ; $1f
	const EVENT_PRINCE_FROGS_GLOVES       ; $20
	const EVENT_MAKE_WIRE                 ; $21
	const EVENT_TREASURE_MAP              ; $22
	const EVENT_SUPER_GRAB_GLOVES         ; $23
	const EVENT_OPEN_TREE_MOUTH           ; $24
	const EVENT_GOLD_MUSIC_BOX            ; $25
	const EVENT_BLUE_CRAYON               ; $26
	const EVENT_PLACE_CART_WHEELS         ; $27
	const EVENT_COLLECT_BLUE_GEM          ; $28
	const EVENT_CYAN_CRAYON               ; $29
	const EVENT_COLLECT_GOBLET            ; $2a
	const EVENT_COLLECT_CROWN             ; $2b
	const EVENT_PINK_CRAYON               ; $2c
	const EVENT_COLLECT_TEAPOT            ; $2d
	const EVENT_COLLECT_POCKET_PET        ; $2e
	const EVENT_MAGNIFYING_GLASS          ; $2f
	const EVENT_RAISE_ICE_BLOCKS          ; $30
	const EVENT_COLLECT_ROCKET            ; $31
	const EVENT_YELLOW_CRAYON             ; $32
	const EVENT_UNUSED_33                 ; $33
	const EVENT_COLLECT_SABER             ; $34
	const EVENT_DAY_OR_NIGHT_SPELL        ; $35
	const EVENT_COLLECT_UFO               ; $36
	const EVENT_TORCH_FOREST              ; $37
	const EVENT_REVEAL_WARPED_VOID        ; $38
	const EVENT_RAISE_PIPE                ; $39
	const EVENT_REMOVE_WARPS              ; $3a
	const EVENT_BROWN_CRAYON              ; $3b
	const EVENT_COLLECT_DEMONS_BLOOD      ; $3c
	const EVENT_OPEN_PARAGOOM_CAGE        ; $3d
	const EVENT_COLLECT_HEART_CREST       ; $3e
	const EVENT_COLLECT_MINICAR           ; $3f
	const EVENT_COLLECT_LOCOMOTIVE        ; $40
	const EVENT_COLLECT_TELEPHONE         ; $41
	const EVENT_RED_CRAYON                ; $42
	const EVENT_PLACE_PROPELLER           ; $43
	const EVENT_FEED_OCTOHON              ; $44
	const EVENT_COLLECT_GREEN_GEM         ; $45
	const EVENT_UNUSED_46                 ; $46
	const EVENT_UNUSED_47                 ; $47
	const EVENT_COLLECT_FIGHTER_MANNEQUIN ; $48
	const EVENT_OPEN_GOLDEN_SNAKE_DOOR    ; $49
	const EVENT_OPEN_SKY_DOOR             ; $4a
	const EVENT_GREEN_CRAYON              ; $4b
	const EVENT_EXTINGUISH_FIRE           ; $4c
	const EVENT_COLLECT_DIAMONDS_CREST    ; $4d
	const EVENT_PLACE_BRICK               ; $4e
	const EVENT_SPRAY_IRON_WALL           ; $4f
	const EVENT_COLLECT_SPADES_CREST      ; $50
	const EVENT_MIX_CHEMICALS             ; $51
	const EVENT_COLLECT_RED_GEM           ; $52
	const EVENT_COLLECT_CLUBS_CREST       ; $53
	const EVENT_CUT_BALOON                ; $54
	const EVENT_DRILL_HOLES               ; $55
	const EVENT_REVEAL_DARK_ROOM          ; $56
	const EVENT_SUMMON_MOON               ; $57
	const EVENT_OPEN_CRATER_HOLE          ; $58
	const EVENT_COLLECT_EARTHEN_FIGURE    ; $59
	const EVENT_EPILOGUE                  ; $5a
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
