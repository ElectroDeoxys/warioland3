INCLUDE "home/header.asm"

SECTION "Home 1", ROM0

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
INCLUDE "home/home1.asm"

SECTION "Home 2", ROM0

INCLUDE "home/home2.asm"

SECTION "Home 3", ROM0

INCLUDE "home/home3.asm"

SECTION "Home 4", ROM0

INCLUDE "home/home4.asm"

SECTION "Home 5", ROM0

INCLUDE "home/home5.asm"

SECTION "Audio Home", ROM0
INCLUDE "home/audio.asm"

REPT $3d
	db $00
ENDR
