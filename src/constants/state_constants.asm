; game state constants
	const_def
	const ST_TITLE              ; $00
	const ST_OVERWORLD          ; $01
	const ST_LEVEL              ; $02
	const ST_CLEAR              ; $03
	const ST_PAUSE_MENU         ; $04
	const ST_GOLF               ; $05
	const ST_06                 ; $06
	const ST_07                 ; $07
	const ST_COLLECT_KEY        ; $08
	const ST_CREDITS            ; $09
	const ST_GOLF_BUILDING      ; $0a
	const ST_GB_INCOMPATIBLE    ; $0b
	const ST_GAME_OVER          ; $0c
	const ST_PERFECT            ; $0d
	const ST_LANGUAGE_SELECTION ; $0e
	const ST_0f                 ; $0f
	const ST_10                 ; $10
	const ST_11                 ; $11

; ST_OVERWORLD substates
DEF SST_OVERWORLD_05 EQU $05
DEF SST_OVERWORLD_08 EQU $08
DEF SST_OVERWORLD_09 EQU $09
DEF SST_OVERWORLD_0B EQU $0b
DEF SST_OVERWORLD_0C EQU $0c
DEF SST_OVERWORLD_11 EQU $11
DEF SST_OVERWORLD_16 EQU $16
DEF SST_OVERWORLD_1A EQU $1a
DEF SST_OVERWORLD_1E EQU $1e
DEF SST_OVERWORLD_20 EQU $20
DEF SST_OVERWORLD_23 EQU $23

; ST_CLEAR substates
DEF SST_CLEAR_TIME_ATTACK   EQU $04
DEF SST_CLEAR_MUSICAL_COINS EQU $08
DEF SST_CLEAR_EXIT          EQU $0e

; ST_PAUSE_MENU substates
DEF SST_PAUSE_INIT_MENU EQU $01
DEF SST_PAUSE_MENU_SAVE EQU $08
DEF SST_PAUSE_18        EQU $18
DEF SST_PAUSE_28        EQU $28

; ST_GOLF substates
DEF SST_GOLF_LEVEL EQU $4
DEF SST_GOLF_EXIT  EQU $8
DEF SST_GOLF_CLEAR EQU $a
