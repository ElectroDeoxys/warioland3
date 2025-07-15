SECTION "Clear Level", ROMX

INCLUDE "engine/clear/state_table.asm"
INCLUDE "engine/clear/treasure_clear.asm"
INCLUDE "engine/clear/time_attack_clear.asm"
INCLUDE "engine/clear/musical_coins.asm"
INCLUDE "engine/clear/add_sprite.asm"
INCLUDE "engine/clear/treasure_transition.asm"
INCLUDE "engine/clear/treasure_count.asm"
INCLUDE "engine/clear/vblank.asm"
INCLUDE "engine/clear/musical_coin_flags.asm"
INCLUDE "engine/clear/pencil.asm"
INCLUDE "data/clear/musical_coin_pals.asm"
INCLUDE "data/clear/pencil_offsets.asm"
INCLUDE "data/golf/oam.asm"
INCLUDE "data/golf/framesets.asm"
INCLUDE "data/clear/oam.asm"
INCLUDE "data/clear/framesets.asm"
INCLUDE "data/clear/palettes.asm"

; TODO in its own section to be added to golf.o?
GolfMenuGfx::    INCBIN "gfx/golf/golf_menu.2bpp.rle"
GolfMenuTilemap:: INCBIN "data/bgmaps/golf/menu.tilemap.rle"
GolfMenuAttrmap:: INCBIN "data/bgmaps/golf/menu.attrmap.rle"

INCLUDE "data/clear/pencil_oam.asm"


SECTION "Bank 78", ROMX

INCLUDE "engine/clear/bank78.asm"
