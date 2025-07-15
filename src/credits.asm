SECTION "Credits", ROMX

INCLUDE "engine/credits/state_table.asm"
INCLUDE "engine/credits/credits.asm"
INCLUDE "data/credits.asm"

CreditsPalsMap: INCBIN "gfx/pals/credits_pals_map.bin"


SECTION "Credits OAM", ROMX

INCLUDE "data/credits/oam.asm"
