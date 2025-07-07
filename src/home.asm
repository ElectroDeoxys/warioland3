INCLUDE "home/header.asm"

SECTION "Home 1", ROM0

INCLUDE "home/start.asm"
INCLUDE "home/dpad_repeat.asm"
INCLUDE "home/vblank.asm"
INCLUDE "home/clear_memory.asm"
INCLUDE "home/joypad.asm"
INCLUDE "home/push_oam.asm"
INCLUDE "home/copy.asm"
INCLUDE "home/fade.asm"
INCLUDE "home/disable_lcd.asm"
INCLUDE "home/decompress.asm"
INCLUDE "home/door_transition.asm"
INCLUDE "home/hcall.asm"
INCLUDE "home/decompress_level_data.asm"
INCLUDE "home/level_vblank.asm"
INCLUDE "home/object_pos.asm"
INCLUDE "home/sprite.asm"
INCLUDE "home/load_level.asm"
INCLUDE "home/audio.asm"
INCLUDE "home/clear_transformation.asm"
INCLUDE "home/floor_transition.asm"
INCLUDE "home/room_transition.asm"
INCLUDE "home/move_wario.asm"
INCLUDE "home/backup_vram.asm"
INCLUDE "home/return_level.asm"
INCLUDE "home/object_animation.asm"
INCLUDE "home/wario_mechanics1.asm"
INCLUDE "home/load_wario_gfx.asm"
INCLUDE "home/update_level_music.asm"
INCLUDE "home/clear_save.asm"
INCLUDE "home/wario_mechanics2.asm"
INCLUDE "home/musical_coin.asm"
INCLUDE "home/load_game_over_sprite.asm"
INCLUDE "home/load_credits_sprite.asm"
INCLUDE "gfx/pals/white.asm"
INCLUDE "gfx/pals/black.asm"
INCLUDE "data/levels/jump_vel_tables.asm"
INCLUDE "data/levels/walk_vel_table.asm"
INCLUDE "data/levels/level_treasures.asm"
INCLUDE "home/load_pals.asm"
INCLUDE "home/double_speed.asm"
INCLUDE "home/clear_ram.asm"
INCLUDE "home/bg_ob_pals.asm"


SECTION "Home 2", ROM0

INCLUDE "home/load_room.asm"


SECTION "Home 3", ROM0

INCLUDE "home/far_decompress.asm"
INCLUDE "home/load_golf_sprite.asm"


SECTION "Home 4", ROM0

INCLUDE "home/object_mechanics.asm"


SECTION "Home 5", ROM0

INCLUDE "home/overworld.asm"


SECTION "Audio Home", ROM0

INCLUDE "home/audio_functions.asm"

	ds $3d, $00
