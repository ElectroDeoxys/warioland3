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

MACRO decompress_vram0
	ld a, BANK(\1)
	ld [wTempBank], a
	ld hl, \1
	ld bc, \2
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
ENDM

MACRO decompress_vram1
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(\1)
	ld [wTempBank], a
	ld hl, \1
	ld bc, \2
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	xor a
	ldh [rVBK], a
ENDM

DEF dma_tiles EQUS " - 1" ; number in tiles
