DEF PALRGB_WHITE EQUS "palred 31 + palgreen 31 + palblue 31" ; $7fff

; tile size
DEF tiles EQUS "* TILE_SIZE"
DEF tile  EQUS "+ TILE_SIZE *"

DEF BG_PALMASK    EQU %00000111 ; Palette

; fading speed used by wFadeSpeed
	const_def
	const FADE_SPEED_SLOW   ; $00
	const FADE_SPEED_NORMAL ; $01
	const FADE_SPEED_FAST   ; $02

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
