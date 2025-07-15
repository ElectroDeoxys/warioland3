SECTION "Title", ROMX

INCLUDE "engine/title/state_table.asm"
INCLUDE "engine/title/intro.asm"
INCLUDE "engine/title/start_menu.asm"
INCLUDE "engine/title/time_attack_description.asm"


SECTION "Title Gfx Engine 1", ROMX

INCLUDE "engine/title/load_gfx.asm"
INCLUDE "engine/title/vblank.asm"


SECTION "Title Gfx Engine 2", ROMX

INCLUDE "engine/title/load_oam.asm"
INCLUDE "engine/title/start_menu_selection.asm"
INCLUDE "engine/title/intro_animation.asm"
INCLUDE "engine/title/time_attack_jp_adjustment.asm"


SECTION "Title Plane SFX", ROMX

INCLUDE "engine/title/plane_sfx.asm"


SECTION "Title Gfx", ROMX

INCLUDE "data/title/palettes.asm"

TitleScreenGfx: INCBIN "gfx/intro/title_screen.2bpp.rle"
PlaneGfx:       INCBIN "gfx/intro/plane.2bpp.rle"

TitleScreenTilemap:    INCBIN "data/title/bgmaps/title_screen.tilemap.rle"
TitleScreenAttrmap:    INCBIN "data/title/bgmaps/title_screen.attrmap.rle"
TitleScreenBoxTilemap: INCBIN "data/title/bgmaps/title_screen_box.tilemap"

INCLUDE "data/title/oam.asm"


SECTION "Time Attack Gfx", ROMX

INCLUDE "data/title/time_attack/palettes.asm"

TimeAttack1JPTextMap: INCBIN "data/title/time_attack/bgmaps/time_attack_en.tilemap"
TimeAttack2JPTextMap: INCBIN "data/title/time_attack/bgmaps/time_attack_en.attrmap"
TimeAttack1ENTextMap: INCBIN "data/title/time_attack/bgmaps/time_attack_jp.tilemap"
TimeAttack2ENTextMap: INCBIN "data/title/time_attack/bgmaps/time_attack_jp.attrmap"
