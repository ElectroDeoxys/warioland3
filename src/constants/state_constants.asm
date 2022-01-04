; game state constants
	const_def
	const ST_TITLE              ; $00
	const ST_OVERWORLD          ; $01
	const ST_LEVEL              ; $02
	const ST_03                 ; $03
	const ST_PAUSE_MENU         ; $04
	const ST_05                 ; $05
	const ST_06                 ; $06
	const ST_07                 ; $07
	const ST_COLLECT_KEY        ; $08
	const ST_CREDITS                 ; $09
	const ST_0a                 ; $0a
	const ST_GB_INCOMPATIBLE    ; $0b
	const ST_0c                 ; $0c
	const ST_0d                 ; $0d
	const ST_LANGUAGE_SELECTION ; $0e
	const ST_0f                 ; $0f
	const ST_10                 ; $10
	const ST_11                 ; $11

; ST_OVERWORLD substates
SST_OVERWORLD_05 EQU $05
SST_OVERWORLD_08 EQU $08
SST_OVERWORLD_09 EQU $09
SST_OVERWORLD_0B EQU $0b
SST_OVERWORLD_0C EQU $0c
SST_OVERWORLD_11 EQU $11
SST_OVERWORLD_16 EQU $16
SST_OVERWORLD_1A EQU $1a
SST_OVERWORLD_1E EQU $1e
SST_OVERWORLD_20 EQU $20
SST_OVERWORLD_23 EQU $23

; ST_PAUSE_MENU substates
SST_PAUSE_MENU_SAVE EQU $08
SST_PAUSE_18 EQU $18
