SECTION "GB Incompatible", ROMX

INCLUDE "engine/gb_incompatible/state_table.asm"
INCLUDE "engine/gb_incompatible/core.asm"


SECTION "GB Incompatible Gfx", ROMX

GBIncompatibleGfx::     INCBIN "gfx/gb_incompatible.2bpp.rle"
GBIncompatibleTilemap:: INCBIN "data/bgmaps/gb_incompatible.tilemap.rle"
GBIncompatibleAttrmap:: INCBIN "data/bgmaps/gb_incompatible.attrmap.rle" ; unreferenced
