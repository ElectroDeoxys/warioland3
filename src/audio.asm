PUSHO Q.8

SECTION "Audio Engine", ROMX

INCLUDE "audio/engine.asm"
INCLUDE "audio/waves.asm"
INCLUDE "audio/sound_headers.asm"


SECTION "Music 1", ROMX

INCLUDE "audio/music/out_of_the_woods_day.asm"
INCLUDE "audio/music/out_of_the_woods_night.asm"
INCLUDE "audio/music/forest_of_fear.asm"
INCLUDE "audio/music/the_warped_void.asm"
INCLUDE "audio/music/desert_ruins.asm"
INCLUDE "audio/music/the_frigid_sea.asm"
INCLUDE "audio/music/the_peaceful_village_day.asm"
INCLUDE "audio/music/the_peaceful_village_night.asm"

	ds $217, $00


SECTION "Music 2", ROMX

INCLUDE "audio/music/above_the_clouds_day.asm"
INCLUDE "audio/music/above_the_clouds_night.asm"
INCLUDE "audio/music/the_volcanos_base_day.asm"
INCLUDE "audio/music/the_volcanos_base_night.asm"
INCLUDE "audio/music/the_west_crater.asm"
INCLUDE "audio/music/the_vast_plain_day.asm"
INCLUDE "audio/music/the_vast_plain_night.asm"
INCLUDE "audio/music/bank_of_the_wild_river.asm"
INCLUDE "audio/music/the_tidal_coast.asm"
INCLUDE "audio/music/cave_of_flames.asm"
INCLUDE "audio/music/the_pool_of_rain_day.asm"
INCLUDE "audio/music/the_pool_of_rain_night.asm"
INCLUDE "audio/music/credits.asm"
INCLUDE "audio/music/hot_wario.asm"
INCLUDE "audio/music/fat_wario.asm"
INCLUDE "audio/music/bouncy_wario.asm"
INCLUDE "audio/music/zombie_wario.asm"
INCLUDE "audio/music/flat_wario.asm"
INCLUDE "audio/music/crazy_wario.asm"
INCLUDE "audio/music/invisible_wario.asm"
INCLUDE "audio/music/snowman_wario.asm"
INCLUDE "audio/music/owl_wario.asm"

	ds $ab, $00


SECTION "Music 3", ROMX

INCLUDE "audio/music/ball_o_string_wario.asm"
INCLUDE "audio/music/vampire_wario.asm"
INCLUDE "audio/music/overworld_day.asm"
INCLUDE "audio/music/overworld_night.asm"
INCLUDE "audio/music/level_clear_no_treasure.asm"
INCLUDE "audio/music/treasure_fanfare.asm"
INCLUDE "audio/music/pause_menu.asm"
INCLUDE "audio/music/golf.asm"
INCLUDE "audio/music/boss_battle.asm"
INCLUDE "audio/music/level_clear_got_treasure.asm"
INCLUDE "audio/music/boss_defeat.asm"
INCLUDE "audio/music/golf_game_over.asm"
INCLUDE "audio/music/golf_clear.asm"
INCLUDE "audio/music/music_boxes.asm"
INCLUDE "audio/music/boss_reveal.asm"
INCLUDE "audio/music/action_help.asm"
INCLUDE "audio/music/golf_lobby.asm"
INCLUDE "audio/music/game_over.asm"
INCLUDE "audio/music/music_box_cave.asm"
INCLUDE "audio/music/the_temple.asm"
INCLUDE "audio/music/title_screen.asm"
INCLUDE "audio/music/intro.asm"
INCLUDE "audio/music/hidden_figure_battle_1.asm"
INCLUDE "audio/music/perfect.asm"
INCLUDE "audio/music/treasure_collection.asm"
INCLUDE "audio/music/epilogue.asm"
INCLUDE "audio/music/hidden_figure_reveal.asm"
INCLUDE "audio/music/hidden_figure_battle_2.asm"


SECTION "SFX 1", ROMX

INCLUDE "audio/sfx/sfx1.asm"

	ds $e, $00


SECTION "SFX 2", ROMX

INCLUDE "audio/sfx/sfx2.asm"

	ds $a6e, $00

SECTION "Audio Miscellaneous", ROMX

INCLUDE "audio/transformation_music.asm"
INCLUDE "audio/level_music.asm"

POPO
