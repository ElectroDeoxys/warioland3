palred   EQUS "(1 << 0) *"
palgreen EQUS "(1 << 5) *"
palblue  EQUS "(1 << 10) *"

palettes EQUS "* PALETTE_SIZE"
palette  EQUS "+ PALETTE_SIZE *"
color    EQUS "+ PAL_COLOR_SIZE *"

MACRO update_anim_1
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
ENDM

MACRO update_anim_2
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
ENDM

MACRO update_anim_3
	ld a, BANK("Wario OAM 3")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
ENDM

MACRO load_frameset
	ld a, HIGH(\1)
	ld [wFramesetPtr + 0], a
	ld a, LOW(\1)
	ld [wFramesetPtr + 1], a
ENDM

MACRO frame_oam
; ycoord, xcoord, tile ID, attributes
	db \1, \2, \3, \4
ENDM

MACRO load_oam
	ld a, BANK(\1)
	ld [wOAMBank], a
	ld a, HIGH(\1)
	ld [wOAMPtr + 0], a
	ld a, LOW(\1)
	ld [wOAMPtr + 1], a
ENDM

MACRO load_gfx
	ld a, BANK(\1)
	ld [wDMASourceBank], a
	ld a, HIGH(\1)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(\1)
	ld [wDMASourcePtr + 1], a
ENDM

MACRO decompress
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

DEF hdma EQUS "(-1) + "
