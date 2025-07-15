SECTION "Language Selection", ROMX

INCLUDE "engine/language_selection/state_table.asm"
INCLUDE "engine/language_selection/init.asm"
INCLUDE "engine/language_selection/core.asm"


SECTION "Language Selection Gfx Engine", ROMX

INCLUDE "engine/language_selection/vblank.asm"
INCLUDE "engine/language_selection/load_oam.asm"


SECTION "Language Selection BG Maps", ROMX

LanguageSelection1TextMap:: INCBIN "data/bgmaps/text/language_selection1.tilemap"
LanguageSelection2TextMap:: INCBIN "data/bgmaps/text/language_selection2.tilemap"


