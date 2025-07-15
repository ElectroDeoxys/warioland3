SECTION "Perfect", ROMX

INCLUDE "engine/perfect/state_table.asm"
INCLUDE "engine/perfect/core.asm"
INCLUDE "data/perfect/palettes.asm"

PerfectGfx:     INCBIN "gfx/perfect.2bpp.rle"
PerfectTilemap: INCBIN "data/bgmaps/perfect.tilemap.rle"
PerfectAttrmap: INCBIN "data/bgmaps/perfect.attrmap.rle"

INCLUDE "data/perfect/oam.asm"
INCLUDE "data/perfect/framesets.asm"
