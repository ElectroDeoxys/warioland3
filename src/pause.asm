SECTION "Pause Engine 1", ROMX

INCLUDE "engine/pause/state_table.asm"
INCLUDE "engine/pause/pause_menu_1.asm"
INCLUDE "engine/pause/save/save.asm"


SECTION "Pause Engine 2", ROMX

INCLUDE "engine/pause/pause_menu_2.asm"
INCLUDE "engine/pause/save/checksum.asm"
INCLUDE "engine/pause/save/vblank.asm"
INCLUDE "engine/pause/save/validate_save.asm"
INCLUDE "data/pause/oam.asm"


SECTION "Pause Palettes", ROMX

INCLUDE "data/pause/palettes.asm"


SECTION "Bank 7D", ROMX

INCLUDE "engine/bank7d.asm"
