palred   EQUS "(1 << 0) *"
palgreen EQUS "(1 << 5) *"
palblue  EQUS "(1 << 10) *"

palettes EQUS "* PALETTE_SIZE"
palette  EQUS "+ PALETTE_SIZE *"
color    EQUS "+ PAL_COLOR_SIZE *"

update_anim: MACRO
	ld a, BANK("Bank 5")
	ldh [hCallFuncBank], a
	call_hram UpdateAnimation
ENDM

load_frameset_ptr: MACRO
	ld a, HIGH(\1)
	ld [wFramesetPtr + 0], a
	ld a, LOW(\1)
	ld [wFramesetPtr + 1], a
ENDM
