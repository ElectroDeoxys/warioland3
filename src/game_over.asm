SECTION "Game Over", ROMX

INCLUDE "engine/game_over/state_table.asm"
INCLUDE "engine/game_over/core.asm"
INCLUDE "engine/game_over/load_gfx.asm"
INCLUDE "data/game_over/palettes.asm"

GameOverGfx:     INCBIN "gfx/game_over.2bpp.rle"
GameOverTilemap: INCBIN "data/bgmaps/game_over.tilemap.rle"
GameOverAttrmap: INCBIN "data/bgmaps/game_over.attrmap.rle"

INCLUDE "data/game_over/oam.asm"
INCLUDE "data/game_over/framesets.asm"
