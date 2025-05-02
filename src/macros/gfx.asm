DEF palred   EQUS "(1 << 0) *"
DEF palgreen EQUS "(1 << 5) *"
DEF palblue  EQUS "(1 << 10) *"

DEF palettes EQUS "* PALETTE_SIZE"
DEF palette  EQUS "+ PALETTE_SIZE *"
DEF color    EQUS "+ PAL_COLOR_SIZE *"

MACRO frame_oam
; ycoord, xcoord, tile ID, attributes
	db \1, \2, \3, \4
ENDM

MACRO decompress_tiles0
	ld a, BANK(\1)
	ld [wTempBank], a
	ld hl, \1
IF _NARG == 3
	ld bc, \2 tile \3
ELSE
	ld bc, \2 tile $00
ENDC
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
ENDM

MACRO decompress_tiles1
	ld a, BANK("VRAM1")
	ldh [rVBK], a
IF _NARG == 3
	decompress_tiles0 \1, \2, \3
ELSE
	decompress_tiles0 \1, \2
ENDC
	xor a
	ldh [rVBK], a
ENDM

MACRO decompress_bgmap0
	ld a, BANK(\1)
	ld [wTempBank], a
	ld hl, \1
IF _NARG == 3
	ld bc, \2 + (\3 * SCRN_VX_B)
ELSE
	ld bc, \2
ENDC
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
ENDM

MACRO decompress_bgmap1
	ld a, BANK("VRAM1")
	ldh [rVBK], a
IF _NARG == 3
	decompress_bgmap0 \1, \2, \3
ELSE
	decompress_bgmap0 \1, \2
ENDC
	xor a
	ldh [rVBK], a
ENDM

DEF dma_tiles EQUS " - 1" ; number in tiles
