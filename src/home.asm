INCLUDE "constants.asm"

INCLUDE "home/header.asm"

SECTION "Home", ROM0

INCLUDE "home/start.asm"
INCLUDE "home/dpad_repeat.asm"
INCLUDE "home/vblank.asm"
INCLUDE "home/clear_memory.asm"
INCLUDE "home/joypad.asm"
INCLUDE "home/copy.asm"
INCLUDE "home/fade.asm"
INCLUDE "home/disable_lcd.asm"
INCLUDE "home/decompress.asm"
INCLUDE "home/door_transition.asm"
INCLUDE "home/hcall.asm"
INCLUDE "home/load_level.asm"
INCLUDE "home/home.asm"
INCLUDE "home/audio.asm"

rept $3d
	db $00
endr
