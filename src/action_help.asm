INCLUDE "constants.asm"

SECTION "Action Help 1", ROMX

INCLUDE "engine/action_help/core.asm"
INCLUDE "engine/action_help/main_power_ups.asm"
INCLUDE "engine/action_help/power_ups/none.asm"
INCLUDE "engine/action_help/power_ups/lead_overalls.asm"
INCLUDE "engine/action_help/power_ups/swimming_flippers.asm"
INCLUDE "engine/action_help/power_ups/head_smash_helmet.asm"
INCLUDE "engine/action_help/power_ups/grab_gloves.asm"
INCLUDE "engine/action_help/power_ups/garlic.asm"
INCLUDE "engine/action_help/power_ups/super_jump_slam_overalls.asm"
INCLUDE "engine/action_help/power_ups/high_jump_boots.asm"
INCLUDE "engine/action_help/power_ups/prince_frogs_gloves.asm"
INCLUDE "engine/action_help/power_ups/super_grab_gloves.asm"
INCLUDE "engine/action_help/common1.asm"


SECTION "Action Help 2", ROMX

INCLUDE "engine/action_help/special_power_ups.asm"
INCLUDE "engine/action_help/power_ups/owl.asm"
INCLUDE "engine/action_help/power_ups/rail.asm"
INCLUDE "engine/action_help/power_ups/vampire.asm"
INCLUDE "engine/action_help/common2.asm"
INCLUDE "gfx/pals/action_help.asm"

ActionHelpHUDGfx:      INCBIN "gfx/misc/action_help_hud.2bpp.lz"
ActionHelpObjects1Gfx: INCBIN "gfx/misc/action_help_objects1.2bpp.lz"
ActionHelpObjects2Gfx: INCBIN "gfx/misc/action_help_objects2.2bpp.lz"

BGMap_1e6796: INCBIN "gfx/bgmaps/map_1e6796.bin"
BGMap_1e68bd: INCBIN "gfx/bgmaps/map_1e68bd.bin"

INCLUDE "gfx/oam/action_help.asm"
