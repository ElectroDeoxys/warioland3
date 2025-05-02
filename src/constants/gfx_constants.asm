DEF TILE_WIDTH EQU 8 ; pixels

DEF NUM_PAL_COLORS EQU 4
DEF PAL_COLOR_SIZE EQU 2
DEF PALETTE_SIZE EQU NUM_PAL_COLORS * PAL_COLOR_SIZE

DEF PALRGB_WHITE EQUS "palred 31 + palgreen 31 + palblue 31" ; $7fff

; tile size
DEF TILE_SIZE EQU 16 ; bytes
DEF tiles EQUS "* TILE_SIZE"
DEF tile  EQUS "+ TILE_SIZE *"

; bg flags
DEF BGF_PRI        EQU %10000000 ; Priority
DEF BGF_YFLIP      EQU %01000000 ; Y flip
DEF BGF_XFLIP      EQU %00100000 ; X flip
DEF BGF_BANK0      EQU %00000000 ; Bank number; 0,1
DEF BGF_BANK1      EQU %00001000 ; Bank number; 0,1

DEF BGF_PALMASK    EQU %00000111 ; Palette

DEF BGB_PRI        EQU 7 ; Priority
DEF BGB_YFLIP      EQU 6 ; Y flip
DEF BGB_XFLIP      EQU 5 ; X flip
DEF BGB_BANK1      EQU 3 ; Bank number; 0,1

; fading speed used by wFadeSpeed
	const_def
	const FADE_SPEED_SLOW   ; $00
	const FADE_SPEED_NORMAL ; $01
	const FADE_SPEED_FAST   ; $02

DEF SCREEN_WIDTH  EQU 20 ; tiles
DEF SCREEN_HEIGHT EQU 18 ; tiles
DEF SCREEN_WIDTH_PX  EQU SCREEN_WIDTH  * TILE_WIDTH ; pixels
DEF SCREEN_HEIGHT_PX EQU SCREEN_HEIGHT * TILE_WIDTH ; pixels

DEF BG_MAP_WIDTH  EQU 32 ; tiles
DEF BG_MAP_HEIGHT EQU 32 ; tiles

; sprite_oam_struct members (see macros/wram.asm)
	const_def
	const SPRITEOAMSTRUCT_YCOORD     ; 0
	const SPRITEOAMSTRUCT_XCOORD     ; 1
	const SPRITEOAMSTRUCT_TILE_ID    ; 2
	const SPRITEOAMSTRUCT_ATTRIBUTES ; 3
DEF SPRITEOAMSTRUCT_LENGTH EQU const_value

DEF SPRITE_GFX_LIST_CAPACITY EQU 32 ; see wUsedSprites

; colour_part_fade_struct members (see macros/wram.asm)
	const_def
	const COLOURFADESTRUCT_BASE        ; 0
	const COLOURFADESTRUCT_TARGET      ; 1
	const COLOURFADESTRUCT_SIGN        ; 2
	const COLOURFADESTRUCT_DIFF        ; 3
	const COLOURFADESTRUCT_ACCUMULATOR ; 4
	const COLOURFADESTRUCT_CURRENT     ; 5
	const COLOURFADESTRUCT_UNK_3       ; 6
	const COLOURFADESTRUCT_UNK_4       ; 7
DEF COLOURFADESTRUCT_LENGTH EQU const_value
