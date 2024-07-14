SECTION "Main State Table", ROMX

INCLUDE "engine/main_state_table.asm"


SECTION "Title", ROMX

INCLUDE "engine/title/state_table.asm"
INCLUDE "engine/title/intro.asm"
INCLUDE "engine/title/start_menu.asm"
INCLUDE "engine/title/time_attack_description.asm"


SECTION "Common 1", ROMX

INCLUDE "engine/ow/common.asm"
INCLUDE "engine/level/common.asm"
INCLUDE "engine/clear/common.asm"
INCLUDE "engine/pause/common.asm"
INCLUDE "engine/golf/common.asm"
INCLUDE "engine/epilogue/state_table.asm"
INCLUDE "engine/action_help/common.asm"
INCLUDE "engine/level/key_delay.asm"
INCLUDE "engine/credits/common.asm"
INCLUDE "engine/golf_building/common.asm"


SECTION "GB Incompatible", ROMX

INCLUDE "engine/gb_incompatible/state_table.asm"
INCLUDE "engine/gb_incompatible/core.asm"


SECTION "Common 2", ROMX

INCLUDE "engine/game_over/common.asm"
INCLUDE "engine/perfect/common.asm"


SECTION "Language Selection", ROMX

INCLUDE "engine/language_selection/state_table.asm"
INCLUDE "engine/language_selection/init.asm"
INCLUDE "engine/language_selection/core.asm"


SECTION "Title Gfx Engine", ROMX

INCLUDE "engine/title/load_gfx.asm"
INCLUDE "engine/title/vblank.asm"
INCLUDE "engine/print_counts.asm"
INCLUDE "engine/ow/level_select.asm"
INCLUDE "engine/title/load_oam.asm"
INCLUDE "engine/title/start_menu_selection.asm"
INCLUDE "engine/title/intro_animation.asm"
INCLUDE "engine/title/time_attack_jp_adjustment.asm"


SECTION "Language Selection Gfx Engine", ROMX

INCLUDE "engine/language_selection/vblank.asm"
INCLUDE "engine/language_selection/load_oam.asm"
INCLUDE "engine/title/plane_sfx.asm"


SECTION "Level Treasure Requirements", ROMX

INCLUDE "data/levels/treasure_requirements.asm"


SECTION "Level Engine", ROMX

INCLUDE "engine/level/state_table.asm"
INCLUDE "engine/level/init.asm"
INCLUDE "engine/level/update_level.asm"
INCLUDE "engine/level/start_room.asm"
INCLUDE "engine/level/get_bg_ptr.asm"
INCLUDE "engine/level/scroll.asm"
INCLUDE "engine/level/vblank.asm"
INCLUDE "engine/level/camera.asm"
INCLUDE "engine/level/block_queue.asm"
INCLUDE "engine/level/switch.asm"
INCLUDE "engine/level/tick_time.asm"


SECTION "Levels Common Gfx", ROMX

LevelsCommonGfx: INCBIN "gfx/levels/common.2bpp"
LevelsCommonGfxEnd:


SECTION "Wario Palettes", romx

INCLUDE "gfx/pals/wario.asm"


SECTION "Bank 3", ROMX

INCLUDE "engine/level/particles.asm"
INCLUDE "engine/level/spawn_edge.asm"
INCLUDE "data/levels/common/palettes.asm"
INCLUDE "data/levels/common/oam.asm"
INCLUDE "data/levels/common/framesets.asm"


SECTION "Block Functions", ROMX

INCLUDE "engine/level/block_functions.asm"


SECTION "Collision", ROMX

INCLUDE "engine/level/collisions.asm"


SECTION "Wario States 2", ROMX

INCLUDE "engine/level/wario_states_2.asm"


SECTION "Wario States 1", ROMX

INCLUDE "engine/level/wario_states_1.asm"


SECTION "Object Interactions", ROMX

INCLUDE "engine/level/object_interactions.asm"


SECTION "Level Engine Extra", ROMX

INCLUDE "engine/level/row_block_queue.asm"


SECTION "Wario States 3", ROMX

INCLUDE "engine/level/wario_states_3.asm"


SECTION "Object Functions 1", ROMX

; sequence of y-offsets used in Func_42725
Data_40000:
	db  0,  0,  0,  0,  0,  0,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1,  0,  0,  0,  0,  0,  0, -1,  0, -1,  0, -1,  0, -1,  0, -1,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1,  0,  0,  0,  0,  0,  0, -1,  0, -1,  0, -1,  0, -1,  0, -1, $80

INCLUDE "engine/level/objects/spearhead.asm"
INCLUDE "engine/level/objects/futamogu.asm"
INCLUDE "engine/level/objects/webber.asm"
INCLUDE "engine/level/objects/torch.asm"
INCLUDE "engine/level/objects/unused_flower.asm"
INCLUDE "engine/level/objects/count_richtertoffen.asm"
INCLUDE "engine/level/objects/para_goom.asm"
INCLUDE "engine/level/objects/doughnuteer.asm"
INCLUDE "engine/level/objects/omodonmeka.asm"
INCLUDE "engine/level/objects/kushimushi.asm"
INCLUDE "engine/level/objects/big_leaf.asm"
INCLUDE "engine/level/objects/silky.asm"
INCLUDE "engine/level/objects/bird.asm"
INCLUDE "engine/level/objects/barrel.asm"
INCLUDE "engine/level/objects/small_leaf.asm"
INCLUDE "engine/level/objects/clear_gate.asm"
INCLUDE "engine/level/objects/nobiiru.asm"


SECTION "Object Functions 2", ROMX

Data_44000:
	db  0,  0,  0,  0,  0,  0,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1,  0,  0,  0,  0,  0,  0, -1,  0, -1,  0, -1,  0, -1,  0, -1, $80

Data_44020:
	db  0,  0,  0,  0,  0,  0,  0, -1,  0,  0, -1,  0, -1,  0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  0, -1,  0, -1,  0, -1,  0,  0, -1,  0,  0, $80

Data_44050:
	db 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, $80

INCLUDE "engine/level/objects/prince_froggy.asm"
INCLUDE "engine/level/objects/hammer_bot.asm"
INCLUDE "engine/level/objects/teruteru.asm"
INCLUDE "engine/level/objects/mad_scienstein.asm"
INCLUDE "engine/level/objects/seeing_eye_door.asm"
INCLUDE "engine/level/objects/pneumo.asm"
INCLUDE "engine/level/objects/electric_lamp.asm"
INCLUDE "engine/level/objects/zombie.asm"
INCLUDE "engine/level/objects/spear_bot.asm"
INCLUDE "engine/level/objects/beam_bot.asm"
INCLUDE "engine/level/objects/fire_bot.asm"
INCLUDE "engine/level/objects/sun_moon.asm"
INCLUDE "engine/level/objects/kobatto.asm"
INCLUDE "engine/level/objects/hand.asm"
INCLUDE "engine/level/objects/appleby.asm"
INCLUDE "engine/level/objects/bubble.asm"


SECTION "Object Functions 3", ROMX

INCLUDE "engine/level/objects/brrr_bear.asm"
INCLUDE "engine/level/objects/cart.asm"
INCLUDE "engine/level/objects/mizuuo.asm"
INCLUDE "engine/level/objects/robo_mouse.asm"
INCLUDE "engine/level/objects/togeba.asm"
INCLUDE "engine/level/objects/haridama.asm"
INCLUDE "engine/level/objects/owl.asm"
INCLUDE "engine/level/objects/zip_line.asm"
INCLUDE "engine/level/objects/falling_snow.asm"
INCLUDE "engine/level/objects/flame_block.asm"
INCLUDE "engine/level/objects/stove.asm"
INCLUDE "engine/level/objects/snake.asm"
INCLUDE "engine/level/objects/pillar_platform.asm"
INCLUDE "engine/level/objects/water_drop.asm"
INCLUDE "engine/level/objects/tadpole.asm"
INCLUDE "engine/level/objects/hebarii.asm"
INCLUDE "engine/level/objects/water_spark.asm"
INCLUDE "engine/level/objects/octohon.asm"
INCLUDE "engine/level/objects/spark.asm"
INCLUDE "engine/level/objects/rock.asm"
INCLUDE "engine/level/objects/fire.asm"


SECTION "Object Functions 4", ROMX

Data_4c000:
	db  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  1,  1,  2,  2,  2,  2,  2,  2,  2,  2,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -1, -1, -1, -1, -1, -1, -1, -1,  0,  0,  0, $80

Data_4c080:
	db  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -2, -2, -2, -2, -2, -2, -2, -2,  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, $80

Data_4c100:
	db -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  2,  2,  2,  2,  2,  2,  2,  2,  0,  0,  0,  0,  0,  0,  0,  0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, $80

Data_4c180:
	db  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  1,  1,  1,  2,  2,  2,  2,  2,  2,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0, -1, -1, -1, -1, -1, -1,  0, $80

Data_4c200:
	db  0,  0,  0,  0,  0, -1,  0, -1,  0, -1,  0, -1,  0, -1,  0, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  1,  0,  1,  1,  1,  1,  2,  2,  2,  3,  3,  4,  4,  4,  4,  4,  4,  4,  4,  3,  3,  2,  2,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -1, -1, -2, -2, -2, -2, -3, -3, -3, -4, -4, -5, -5, -5, -5,  0, $80

Data_4c280:
	db -1, -1, -2, -2, -3, -3, -2, -2, -1, -1,  0, -1,  0, -1,  0, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1,  1,  2,  2,  2,  2,  2,  3,  3,  3,  3,  3,  3,  3,  3,  2,  2,  2,  2,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -1, -1, -1, -1, -1, -1, -1, -1, -2, -3, -4, -3, -2, -2, -2, -2, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, $80

Data_4c300:
	db  0,  0,  0,  0,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0, -1,  0, -1,  0, -1, -1, -1, -1, -2, -2, -2, -3, -3, -4, -4, -4, -4, -4, -4, -4, -4, -3, -3, -2, -2, -1, -1, -1, -1, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  2,  2,  2,  2,  3,  3,  3,  4,  4,  5,  5,  5,  5,  0, $80

Data_4c380:
	db  0,  0,  0,  0,  0, -1,  0, -1,  0, -1,  0, -1,  0, -1,  0, -1, -1, -1, -1, -1, -1, -1, -1, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -1, -1, -1, -2, -2, -3, -3, -2, -2, -1, -1, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  6,  6,  6,  6,  6,  5,  4,  4,  4,  3,  3,  3,  2,  2,  2,  2,  2,  2,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -1, -1, -1, -1, -1, -1, -1, -1, -2, -2, -2, -3, -3, -3, -4, -4, -4, -4, -4,  0, $80

Data_4c400:
	db -1, -1, -2, -2, -3, -3, -2, -2, -1, -1,  0, -1,  0, -1,  0, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1,  1,  2,  2,  2,  2,  2,  3,  3,  3,  3,  3,  3,  3,  3,  2,  2,  2,  2,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -1, -1, -1, -1, -2, -2, -2, -2, -3, -4, -4, -3, -2, -2, -2, -2, -1,  0,  0,  0,  0,  0,  0, $80

Data_4c480:
	db  0,  0,  0,  0,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  1,  2,  2,  3,  3,  2,  2,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -6, -6, -6, -6, -6, -5, -4, -4, -4, -3, -3, -3, -2, -2, -2, -2, -2, -2, -1, -1, -1, -1, -1, -1, -1, -1, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,  2,  2,  2,  3,  3,  3,  4,  4,  4,  4,  4,  0, $80

Data_4c500:
	db  1,  1,  1,  1,  2,  2,  2,  2,  2,  2,  2,  2,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -1, -1, -1, -1, -2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -1, -1,  0,  0,  0,  0,  0,  0,  0, $80

Data_4c540:
	db  1,  1,  2,  3,  4,  5,  6,  7,  8, 10,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -2, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3,  0, $80

Data_4c580:
	db  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -1, -1, -1, -1, -1, -1,  0, $80

Data_4c600:
	db -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  0, -1,  0, -1,  0, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1,  1,  1,  1,  1,  1,  1,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -1, -1, -1, -1, -1, -2, -2, -2, -2, -3, -3, -2, -2, -2, -2, -2, -1,  0,  0,  0,  0,  0,  0, $80

Data_4c680:
	db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -1, -1, -1, -1, -1, -1, -1, -1, -2, -2, -2, -2, -2, -2, -2, -2, -1, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,  2,  2,  2,  2,  2,  2,  2,  2,  1,  1,  0,  0,  0,  0,  0, $80

	db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, $80
	db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0

Data_4c700:
	db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  5,  5,  4,  3,  2,  2,  2,  2,  2,  2,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -4, -5, -5, -5, -6, -6, -4, -4,  0, $80

Data_4c760:
	db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -5, -5, -4, -3, -2, -2, -2, -2, -2, -2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  4,  5,  5,  5,  6,  6,  4,  4,  0, $80

	db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0

Data_4c800:
	db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -2, -2, -1,  0, $80

INCLUDE "engine/level/objects/stars.asm"
INCLUDE "engine/level/objects/chests.asm"
INCLUDE "engine/level/objects/key.asm"
INCLUDE "engine/level/objects/musical_coin.asm"
INCLUDE "engine/level/objects/muddee_stinger.asm"
INCLUDE "engine/level/objects/wall_crack.asm"
INCLUDE "engine/level/objects/hidden_figure.asm"


SECTION "Object Functions 5", ROMX

INCLUDE "engine/level/objects/anonster.asm"
INCLUDE "engine/level/objects/doll_boy.asm"
INCLUDE "engine/level/objects/yellow_belly.asm"
INCLUDE "engine/level/objects/pesce.asm"


SECTION "Object Functions 6", ROMX

Data_54000:
	db -3, -2, -1,  0,  1,  1,  1,  1,  1,  1,  2,  2,  2,  3,  3, $80

Data_54010:
	db -4, -3, -3, -2, -2, -1, -1, -1,  0, -1,  0, -1,  0, -1,  0, $80

INCLUDE "engine/level/objects/wormwould.asm"
INCLUDE "engine/level/objects/scowler.asm"
INCLUDE "engine/level/objects/jamano.asm"
INCLUDE "engine/level/objects/muddee.asm"
INCLUDE "engine/level/objects/wolfenboss.asm"
INCLUDE "engine/level/objects/shoot.asm"


SECTION "Update Objects", ROMX

INCLUDE "engine/level/update_objects.asm"


SECTION "Object Functions 7", ROMX

INCLUDE "engine/level/objects/dummy.asm"
INCLUDE "engine/level/objects/coin.asm"


SECTION "Object Loading", ROMX

INCLUDE "engine/level/load_objects.asm"


SECTION "Level Headers", ROMX

INCLUDE "engine/level/load_room_gfx.asm"
INCLUDE "data/levels/level_headers.asm"

SECTION "Rooms 1", ROMX

INCLUDE "data/levels/rooms1.asm"


SECTION "Rooms 2", ROMX

INCLUDE "data/levels/rooms2.asm"


SECTION "Block Function Tables 1", ROMX

INCLUDE "data/levels/function_tables1.asm"


SECTION "Update Animated Tiles", ROMX

INCLUDE "engine/level/update_animated_tiles.asm"


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
GolfMenuGfx:: INCBIN "gfx/golf/golf_menu.2bpp.rle"
BGMap_d63fd: INCBIN "gfx/bgmaps/map_d63fd.bin"
BGMap_d6502: INCBIN "gfx/bgmaps/map_d6502.bin"

INCLUDE "data/clear/pencil_oam.asm"


SECTION "Game Over", ROMX

INCLUDE "engine/game_over/state_table.asm"
INCLUDE "engine/game_over/core.asm"
INCLUDE "engine/game_over/load_gfx.asm"
INCLUDE "data/game_over/palettes.asm"

GameOverGfx: INCBIN "gfx/game_over.2bpp.rle"
BGMap_dbaee: INCBIN "gfx/bgmaps/map_dbaee.bin"
BGMap_dbb8f: INCBIN "gfx/bgmaps/map_dbb8f.bin"

INCLUDE "data/game_over/oam.asm"
INCLUDE "data/game_over/framesets.asm"


SECTION "Perfect", ROMX

INCLUDE "engine/perfect/state_table.asm"
INCLUDE "engine/perfect/core.asm"
INCLUDE "data/perfect/palettes.asm"

PerfectGfx: INCBIN "gfx/perfect.2bpp.rle"
BGMap_dd417: INCBIN "gfx/bgmaps/map_dd417.bin"
BGMap_dd5b5: INCBIN "gfx/bgmaps/map_dd5b5.bin"

INCLUDE "data/perfect/oam.asm"
INCLUDE "data/perfect/framesets.asm"


SECTION "Level Data 1", ROMX

OutOfTheWoodsBlockMap:       INCBIN "data/levels/block_map/out_of_the_woods.bin.rle"
ThePeacefulVillage1BlockMap: INCBIN "data/levels/block_map/the_peaceful_village_1.bin.rle"

OutOfTheWoodsObjectMap:       INCBIN "data/levels/object_map/out_of_the_woods.bin.rle"
ThePeacefulVillage1ObjectMap: INCBIN "data/levels/object_map/the_peaceful_village_1.bin.rle"

LevelDataUnk1_e2c0b: INCBIN "data/levels/unknown1/data_e2c0b.bin"
LevelDataUnk2_e2e0b: INCBIN "data/levels/unknown2/data_e2e0b.bin.rle"
LevelDataUnk1_e2eef: INCBIN "data/levels/unknown1/data_e2eef.bin"
LevelDataUnk2_e30ef: INCBIN "data/levels/unknown2/data_e30ef.bin.rle"
LevelDataUnk1_e31cc: INCBIN "data/levels/unknown1/data_e31cc.bin"
LevelDataUnk2_e33cc: INCBIN "data/levels/unknown2/data_e33cc.bin.rle"
LevelDataUnk1_e34b4: INCBIN "data/levels/unknown1/data_e34b4.bin"
LevelDataUnk2_e36b4: INCBIN "data/levels/unknown2/data_e36b4.bin.rle"
LevelDataUnk1_e3739: INCBIN "data/levels/unknown1/data_e3739.bin"
LevelDataUnk2_e3939: INCBIN "data/levels/unknown2/data_e3939.bin.rle"
LevelDataUnk1_e39be: INCBIN "data/levels/unknown1/data_e39be.bin"
LevelDataUnk2_e3bbe: INCBIN "data/levels/unknown2/data_e3bbe.bin.rle"


SECTION "Level Data 2", ROMX

TheVastPlain1BlockMap:   INCBIN "data/levels/block_map/the_vast_plain_1.bin.rle"
TheSteepCanyon1BlockMap: INCBIN "data/levels/block_map/the_steep_canyon_1.bin.rle"

TheVastPlain1ObjectMap:   INCBIN "data/levels/object_map/the_vast_plain_1.bin.rle"
TheSteepCanyon1ObjectMap: INCBIN "data/levels/object_map/the_steep_canyon_1.bin.rle"

LevelDataUnk1_e6cf7: INCBIN "data/levels/unknown1/data_e6cf7.bin"
LevelDataUnk2_e6ef7: INCBIN "data/levels/unknown2/data_e6ef7.bin.rle"
LevelDataUnk1_e6fe5: INCBIN "data/levels/unknown1/data_e6fe5.bin"
LevelDataUnk2_e71e5: INCBIN "data/levels/unknown2/data_e71e5.bin.rle"
LevelDataUnk1_e7281: INCBIN "data/levels/unknown1/data_e7281.bin"
LevelDataUnk2_e7481: INCBIN "data/levels/unknown2/data_e7481.bin.rle"
LevelDataUnk1_e758f: INCBIN "data/levels/unknown1/data_e758f.bin"
LevelDataUnk2_e778f: INCBIN "data/levels/unknown2/data_e778f.bin.rle"
LevelDataUnk1_e7886: INCBIN "data/levels/unknown1/data_e7886.bin"
LevelDataUnk2_e7a86: INCBIN "data/levels/unknown2/data_e7a86.bin.rle"
LevelDataUnk1_e7b99: INCBIN "data/levels/unknown1/data_e7b99.bin"
LevelDataUnk2_e7d99: INCBIN "data/levels/unknown2/data_e7d99.bin.rle"


SECTION "Level Data 3", ROMX

TheTidalCoast1BlockMap: INCBIN "data/levels/block_map/the_tidal_coast_1.bin.rle"
SeaTurtleRocksBlockMap: INCBIN "data/levels/block_map/sea_turtle_rocks.bin.rle"

TheTidalCoast1ObjectMap: INCBIN "data/levels/object_map/the_tidal_coast_1.bin.rle"
SeaTurtleRocksObjectMap: INCBIN "data/levels/object_map/sea_turtle_rocks.bin.rle"

LevelDataUnk1_ea43f: INCBIN "data/levels/unknown1/data_ea43f.bin"
LevelDataUnk2_ea63f: INCBIN "data/levels/unknown2/data_ea63f.bin.rle"
LevelDataUnk1_ea6d1: INCBIN "data/levels/unknown1/data_ea6d1.bin"
LevelDataUnk2_ea8d1: INCBIN "data/levels/unknown2/data_ea8d1.bin.rle"
LevelDataUnk1_ea973: INCBIN "data/levels/unknown1/data_ea973.bin"
LevelDataUnk2_eab73: INCBIN "data/levels/unknown2/data_eab73.bin.rle"
LevelDataUnk1_eac1d: INCBIN "data/levels/unknown1/data_eac1d.bin"
LevelDataUnk2_eae1d: INCBIN "data/levels/unknown2/data_eae1d.bin.rle"
LevelDataUnk1_eaecd: INCBIN "data/levels/unknown1/data_eaecd.bin"
LevelDataUnk2_eb0cd: INCBIN "data/levels/unknown2/data_eb0cd.bin.rle"
LevelDataUnk1_eb1c3: INCBIN "data/levels/unknown1/data_eb1c3.bin"
LevelDataUnk2_eb3c3: INCBIN "data/levels/unknown2/data_eb3c3.bin.rle"


SECTION "Level Data 4", ROMX

DesertRuinsBlockMap:      INCBIN "data/levels/block_map/desert_ruins.bin.rle"
TheVolcanosBase1BlockMap: INCBIN "data/levels/block_map/the_volcanos_base_1.bin.rle"

DesertRuinsObjectMap:      INCBIN "data/levels/object_map/desert_ruins.bin.rle"
TheVolcanosBase1ObjectMap: INCBIN "data/levels/object_map/the_volcanos_base_1.bin.rle"

LevelDataUnk1_eed97: INCBIN "data/levels/unknown1/data_eed97.bin"
LevelDataUnk2_eef97: INCBIN "data/levels/unknown2/data_eef97.bin.rle"
LevelDataUnk1_ef038: INCBIN "data/levels/unknown1/data_ef038.bin"
LevelDataUnk2_ef238: INCBIN "data/levels/unknown2/data_ef238.bin.rle"
LevelDataUnk1_ef32c: INCBIN "data/levels/unknown1/data_ef32c.bin"
LevelDataUnk2_ef52c: INCBIN "data/levels/unknown2/data_ef52c.bin.rle"
LevelDataUnk1_ef664: INCBIN "data/levels/unknown1/data_ef664.bin"
LevelDataUnk2_ef864: INCBIN "data/levels/unknown2/data_ef864.bin.rle"
LevelDataUnk1_ef943: INCBIN "data/levels/unknown1/data_ef943.bin"
LevelDataUnk2_efb43: INCBIN "data/levels/unknown2/data_efb43.bin.rle"
LevelDataUnk1_efbe2: INCBIN "data/levels/unknown1/data_efbe2.bin"
LevelDataUnk2_efde2: INCBIN "data/levels/unknown2/data_efde2.bin.rle"


SECTION "Level Data 5", ROMX

ThePoolOfRain1BlockMap: INCBIN "data/levels/block_map/the_pool_of_rain_1.bin.rle"
ATownInChaosBlockMap:   INCBIN "data/levels/block_map/a_town_in_chaos.bin.rle"

ThePoolOfRain1ObjectMap: INCBIN "data/levels/object_map/the_pool_of_rain_1.bin.rle"
ATownInChaosObjectMap:   INCBIN "data/levels/object_map/a_town_in_chaos.bin.rle"

LevelDataUnk1_f2ab7: INCBIN "data/levels/unknown1/data_f2ab7.bin"
LevelDataUnk2_f2cb7: INCBIN "data/levels/unknown2/data_f2cb7.bin.rle"
LevelDataUnk1_f2d75: INCBIN "data/levels/unknown1/data_f2d75.bin"
LevelDataUnk2_f2f75: INCBIN "data/levels/unknown2/data_f2f75.bin.rle"
LevelDataUnk1_f306a: INCBIN "data/levels/unknown1/data_f306a.bin"
LevelDataUnk2_f326a: INCBIN "data/levels/unknown2/data_f326a.bin.rle"
LevelDataUnk1_f330d: INCBIN "data/levels/unknown1/data_f330d.bin"
LevelDataUnk2_f350d: INCBIN "data/levels/unknown2/data_f350d.bin.rle"
LevelDataUnk1_f35fa: INCBIN "data/levels/unknown1/data_f35fa.bin"
LevelDataUnk2_f37fa: INCBIN "data/levels/unknown2/data_f37fa.bin.rle"
LevelDataUnk1_f38d7: INCBIN "data/levels/unknown1/data_f38d7.bin"
LevelDataUnk2_f3ad7: INCBIN "data/levels/unknown2/data_f3ad7.bin.rle"


SECTION "Level Data 6", ROMX

BeneathTheWavesBlockMap: INCBIN "data/levels/block_map/beneath_the_waves.bin.rle"
TheWestCraterBlockMap:   INCBIN "data/levels/block_map/the_west_crater.bin.rle"

BeneathTheWavesObjectMap: INCBIN "data/levels/object_map/beneath_the_waves.bin.rle"
TheWestCraterObjectMap:   INCBIN "data/levels/object_map/the_west_crater.bin.rle"

LevelDataUnk1_f6759: INCBIN "data/levels/unknown1/data_f6759.bin"
LevelDataUnk2_f6959: INCBIN "data/levels/unknown2/data_f6959.bin.rle"
LevelDataUnk1_f6a29: INCBIN "data/levels/unknown1/data_f6a29.bin"
LevelDataUnk2_f6c29: INCBIN "data/levels/unknown2/data_f6c29.bin.rle"
LevelDataUnk1_f6d24: INCBIN "data/levels/unknown1/data_f6d24.bin"
LevelDataUnk2_f6f24: INCBIN "data/levels/unknown2/data_f6f24.bin.rle"
LevelDataUnk1_f700f: INCBIN "data/levels/unknown1/data_f700f.bin"
LevelDataUnk2_f720f: INCBIN "data/levels/unknown2/data_f720f.bin.rle"
LevelDataUnk1_f72d5: INCBIN "data/levels/unknown1/data_f72d5.bin"
LevelDataUnk2_f74d5: INCBIN "data/levels/unknown2/data_f74d5.bin.rle"
LevelDataUnk1_f7603: INCBIN "data/levels/unknown1/data_f7603.bin"
LevelDataUnk2_f7803: INCBIN "data/levels/unknown2/data_f7803.bin.rle"


SECTION "Level Data 7", ROMX

TheGrasslandsBlockMap: INCBIN "data/levels/block_map/the_grasslands.bin.rle"
TheBigBridgeBlockMap:  INCBIN "data/levels/block_map/the_big_bridge.bin.rle"

TheGrasslandsObjectMap: INCBIN "data/levels/object_map/the_grasslands.bin.rle"
TheBigBridgeObjectMap:  INCBIN "data/levels/object_map/the_big_bridge.bin.rle"

LevelDataUnk1_fa4fe: INCBIN "data/levels/unknown1/data_fa4fe.bin"
LevelDataUnk2_fa6fe: INCBIN "data/levels/unknown2/data_fa6fe.bin.rle"
LevelDataUnk1_fa7e2: INCBIN "data/levels/unknown1/data_fa7e2.bin"
LevelDataUnk2_fa9e2: INCBIN "data/levels/unknown2/data_fa9e2.bin.rle"
LevelDataUnk1_faa74: INCBIN "data/levels/unknown1/data_faa74.bin"
LevelDataUnk2_fac74: INCBIN "data/levels/unknown2/data_fac74.bin.rle"
LevelDataUnk1_fad9f: INCBIN "data/levels/unknown1/data_fad9f.bin"
LevelDataUnk2_faf9f: INCBIN "data/levels/unknown2/data_faf9f.bin.rle"
LevelDataUnk1_fb048: INCBIN "data/levels/unknown1/data_fb048.bin"
LevelDataUnk2_fb248: INCBIN "data/levels/unknown2/data_fb248.bin.rle"
LevelDataUnk1_fb2f0: INCBIN "data/levels/unknown1/data_fb2f0.bin"
LevelDataUnk2_fb4f0: INCBIN "data/levels/unknown2/data_fb4f0.bin.rle"


SECTION "Level Data 8", ROMX

TowerOfRevivalBlockMap:     INCBIN "data/levels/block_map/tower_of_revival.bin.rle"
BankOfTheWildRiverBlockMap: INCBIN "data/levels/block_map/bank_of_the_wild_river.bin.rle"

TowerOfRevivalObjectMap:     INCBIN "data/levels/object_map/tower_of_revival.bin.rle"
BankOfTheWildRiverObjectMap: INCBIN "data/levels/object_map/bank_of_the_wild_river.bin.rle"

LevelDataUnk1_feb90: INCBIN "data/levels/unknown1/data_feb90.bin"
LevelDataUnk2_fed90: INCBIN "data/levels/unknown2/data_fed90.bin.rle"
LevelDataUnk1_fee1d: INCBIN "data/levels/unknown1/data_fee1d.bin"
LevelDataUnk2_ff01d: INCBIN "data/levels/unknown2/data_ff01d.bin.rle"
LevelDataUnk1_ff09f: INCBIN "data/levels/unknown1/data_ff09f.bin"
LevelDataUnk2_ff29f: INCBIN "data/levels/unknown2/data_ff29f.bin.rle"
LevelDataUnk1_ff2e5: INCBIN "data/levels/unknown1/data_ff2e5.bin"
LevelDataUnk2_ff4e5: INCBIN "data/levels/unknown2/data_ff4e5.bin.rle"
LevelDataUnk1_ff598: INCBIN "data/levels/unknown1/data_ff598.bin"
LevelDataUnk2_ff798: INCBIN "data/levels/unknown2/data_ff798.bin.rle"
LevelDataUnk1_ff8a4: INCBIN "data/levels/unknown1/data_ff8a4.bin"
LevelDataUnk2_ffaa4: INCBIN "data/levels/unknown2/data_ffaa4.bin.rle"


SECTION "Level Data 9", ROMX

CaveOfFlamesBlockMap:    INCBIN "data/levels/block_map/cave_of_flames.bin.rle"
AboveTheClouds1BlockMap: INCBIN "data/levels/block_map/above_the_clouds_1.bin.rle"

CaveOfFlamesObjectMap:    INCBIN "data/levels/object_map/cave_of_flames.bin.rle"
AboveTheClouds1ObjectMap: INCBIN "data/levels/object_map/above_the_clouds_1.bin.rle"

LevelDataUnk1_102c8e: INCBIN "data/levels/unknown1/data_102c8e.bin"
LevelDataUnk2_102e8e: INCBIN "data/levels/unknown2/data_102e8e.bin.rle"
LevelDataUnk1_102fb0: INCBIN "data/levels/unknown1/data_102fb0.bin"
LevelDataUnk2_1031b0: INCBIN "data/levels/unknown2/data_1031b0.bin.rle"
LevelDataUnk1_10325c: INCBIN "data/levels/unknown1/data_10325c.bin"
LevelDataUnk2_10345c: INCBIN "data/levels/unknown2/data_10345c.bin.rle"
LevelDataUnk1_10358e: INCBIN "data/levels/unknown1/data_10358e.bin"
LevelDataUnk2_10378e: INCBIN "data/levels/unknown2/data_10378e.bin.rle"
LevelDataUnk1_10386d: INCBIN "data/levels/unknown1/data_10386d.bin"
LevelDataUnk2_103a6d: INCBIN "data/levels/unknown2/data_103a6d.bin.rle"
LevelDataUnk1_103b9c: INCBIN "data/levels/unknown1/data_103b9c.bin"
LevelDataUnk2_103d9c: INCBIN "data/levels/unknown2/data_103d9c.bin.rle"


SECTION "Level Data 10", ROMX

TheStagnantSwamp1BlockMap: INCBIN "data/levels/block_map/the_stagnant_swamp_1.bin.rle"
TheFrigidSeaBlockMap:      INCBIN "data/levels/block_map/the_frigid_sea.bin.rle"

TheStagnantSwamp1ObjectMap: INCBIN "data/levels/object_map/the_stagnant_swamp_1.bin.rle"
TheFrigidSeaObjectMap:      INCBIN "data/levels/object_map/the_frigid_sea.bin.rle"

LevelDataUnk1_1061f4: INCBIN "data/levels/unknown1/data_1061f4.bin"
LevelDataUnk2_1063f4: INCBIN "data/levels/unknown2/data_1063f4.bin.rle"
LevelDataUnk1_1064ae: INCBIN "data/levels/unknown1/data_1064ae.bin"
LevelDataUnk2_1066ae: INCBIN "data/levels/unknown2/data_1066ae.bin.rle"
LevelDataUnk1_1067a3: INCBIN "data/levels/unknown1/data_1067a3.bin"
LevelDataUnk2_1069a3: INCBIN "data/levels/unknown2/data_1069a3.bin.rle"
LevelDataUnk1_106a79: INCBIN "data/levels/unknown1/data_106a79.bin"
LevelDataUnk2_106c79: INCBIN "data/levels/unknown2/data_106c79.bin.rle"
LevelDataUnk1_106d5c: INCBIN "data/levels/unknown1/data_106d5c.bin"
LevelDataUnk2_106f5c: INCBIN "data/levels/unknown2/data_106f5c.bin.rle"
LevelDataUnk1_10703d: INCBIN "data/levels/unknown1/data_10703d.bin"
LevelDataUnk2_10723d: INCBIN "data/levels/unknown2/data_10723d.bin.rle"


SECTION "Level Data 11", ROMX

CastleOfIllusionsBlockMap: INCBIN "data/levels/block_map/castle_of_illusions.bin.rle"
TheColossalHole1BlockMap:  INCBIN "data/levels/block_map/the_colossal_hole_1.bin.rle"

CastleOfIllusionsObjectMap: INCBIN "data/levels/object_map/castle_of_illusions.bin.rle"
TheColossalHole1ObjectMap:  INCBIN "data/levels/object_map/the_colossal_hole_1.bin.rle"

LevelDataUnk1_10ae4f: INCBIN "data/levels/unknown1/data_10ae4f.bin"
LevelDataUnk2_10b04f: INCBIN "data/levels/unknown2/data_10b04f.bin.rle"
LevelDataUnk1_10b0f8: INCBIN "data/levels/unknown1/data_10b0f8.bin"
LevelDataUnk2_10b2f8: INCBIN "data/levels/unknown2/data_10b2f8.bin.rle"
LevelDataUnk1_10b3ac: INCBIN "data/levels/unknown1/data_10b3ac.bin"
LevelDataUnk2_10b5ac: INCBIN "data/levels/unknown2/data_10b5ac.bin.rle"
LevelDataUnk1_10b65c: INCBIN "data/levels/unknown1/data_10b65c.bin"
LevelDataUnk2_10b85c: INCBIN "data/levels/unknown2/data_10b85c.bin.rle"
LevelDataUnk1_10b93d: INCBIN "data/levels/unknown1/data_10b93d.bin"
LevelDataUnk2_10bb3d: INCBIN "data/levels/unknown2/data_10bb3d.bin.rle"
LevelDataUnk1_10bc28: INCBIN "data/levels/unknown1/data_10bc28.bin"
LevelDataUnk2_10be28: INCBIN "data/levels/unknown2/data_10be28.bin.rle"


SECTION "Level Data 12", ROMX

TheWarpedVoidBlockMap: INCBIN "data/levels/block_map/the_warped_void.bin.rle"
TheEastCraterBlockMap: INCBIN "data/levels/block_map/the_east_crater.bin.rle"

TheWarpedVoidObjectMap: INCBIN "data/levels/object_map/the_warped_void.bin.rle"
TheEastCraterObjectMap: INCBIN "data/levels/object_map/the_east_crater.bin.rle"

LevelDataUnk1_10e436: INCBIN "data/levels/unknown1/data_10e436.bin"
LevelDataUnk2_10e636: INCBIN "data/levels/unknown2/data_10e636.bin.rle"
LevelDataUnk1_10e6de: INCBIN "data/levels/unknown1/data_10e6de.bin"
LevelDataUnk2_10e8de: INCBIN "data/levels/unknown2/data_10e8de.bin.rle"
LevelDataUnk1_10e988: INCBIN "data/levels/unknown1/data_10e988.bin"
LevelDataUnk2_10eb88: INCBIN "data/levels/unknown2/data_10eb88.bin.rle"
LevelDataUnk1_10ec3b: INCBIN "data/levels/unknown1/data_10ec3b.bin"
LevelDataUnk2_10ee3b: INCBIN "data/levels/unknown2/data_10ee3b.bin.rle"
LevelDataUnk1_10ef3b: INCBIN "data/levels/unknown1/data_10ef3b.bin"
LevelDataUnk2_10f13b: INCBIN "data/levels/unknown2/data_10f13b.bin.rle"
LevelDataUnk1_10f192: INCBIN "data/levels/unknown1/data_10f192.bin"
LevelDataUnk2_10f392: INCBIN "data/levels/unknown2/data_10f392.bin.rle"


SECTION "Level Data 13", ROMX

ForestOfFearBlockMap:     INCBIN "data/levels/block_map/forest_of_fear.bin.rle"
HiddenFigureRoomBlockMap: INCBIN "data/levels/block_map/hidden_figure_room.bin.rle"

ForestOfFearObjectMap:     INCBIN "data/levels/object_map/forest_of_fear.bin.rle"
HiddenFigureRoomObjectMap: INCBIN "data/levels/object_map/hidden_figure_room.bin.rle"

LevelDataUnk1_1115a5: INCBIN "data/levels/unknown1/data_1115a5.bin"
LevelDataUnk2_1117a5: INCBIN "data/levels/unknown2/data_1117a5.bin.rle"
LevelDataUnk1_11184a: INCBIN "data/levels/unknown1/data_11184a.bin"
LevelDataUnk2_111a4a: INCBIN "data/levels/unknown2/data_111a4a.bin.rle"
LevelDataUnk1_111b7f: INCBIN "data/levels/unknown1/data_111b7f.bin"
LevelDataUnk2_111d7f: INCBIN "data/levels/unknown2/data_111d7f.bin.rle"
LevelDataUnk1_111eb0: INCBIN "data/levels/unknown1/data_111eb0.bin"
LevelDataUnk2_1120b0: INCBIN "data/levels/unknown2/data_1120b0.bin.rle"
LevelDataUnk1_1121dd: INCBIN "data/levels/unknown1/data_1121dd.bin"
LevelDataUnk2_1123dd: INCBIN "data/levels/unknown2/data_1123dd.bin.rle"
LevelDataUnk1_1124a3: INCBIN "data/levels/unknown1/data_1124a3.bin"
LevelDataUnk2_1126a3: INCBIN "data/levels/unknown2/data_1126a3.bin.rle"


SECTION "Level Data 14", ROMX

TheVastPlain2BlockMap:    INCBIN "data/levels/block_map/the_vast_plain_2.bin.rle"
TheVolcanosBase2BlockMap: INCBIN "data/levels/block_map/the_volcanos_base_2.bin.rle"

TheVastPlain2ObjectMap:    INCBIN "data/levels/object_map/the_vast_plain_2.bin.rle"
TheVolcanosBase2ObjectMap: INCBIN "data/levels/object_map/the_volcanos_base_2.bin.rle"

LevelDataUnk1_11699e: INCBIN "data/levels/unknown1/data_11699e.bin"
LevelDataUnk2_116b9e: INCBIN "data/levels/unknown2/data_116b9e.bin.rle"
LevelDataUnk1_116c52: INCBIN "data/levels/unknown1/data_116c52.bin"
LevelDataUnk2_116e52: INCBIN "data/levels/unknown2/data_116e52.bin.rle"
LevelDataUnk1_116f8d: INCBIN "data/levels/unknown1/data_116f8d.bin"
LevelDataUnk2_11718d: INCBIN "data/levels/unknown2/data_11718d.bin.rle"
LevelDataUnk1_1172b2: INCBIN "data/levels/unknown1/data_1172b2.bin"
LevelDataUnk2_1174b2: INCBIN "data/levels/unknown2/data_1174b2.bin.rle"
LevelDataUnk1_117599: INCBIN "data/levels/unknown1/data_117599.bin"
LevelDataUnk2_117799: INCBIN "data/levels/unknown2/data_117799.bin.rle"
LevelDataUnk1_11781c: INCBIN "data/levels/unknown1/data_11781c.bin"
LevelDataUnk2_117a1c: INCBIN "data/levels/unknown2/data_117a1c.bin.rle"


SECTION "Level Data 15", ROMX

ThePoolOfRain2BlockMap:   INCBIN "data/levels/block_map/the_pool_of_rain_2.bin.rle"
TheColossalHole2BlockMap: INCBIN "data/levels/block_map/the_colossal_hole_2.bin.rle"

ThePoolOfRain2ObjectMap:   INCBIN "data/levels/object_map/the_pool_of_rain_2.bin.rle"
TheColossalHole2ObjectMap: INCBIN "data/levels/object_map/the_colossal_hole_2.bin.rle"

LevelDataUnk1_11a7c8: INCBIN "data/levels/unknown1/data_11a7c8.bin"
LevelDataUnk2_11a9c8: INCBIN "data/levels/unknown2/data_11a9c8.bin.rle"
LevelDataUnk1_11aaa5: INCBIN "data/levels/unknown1/data_11aaa5.bin"
LevelDataUnk2_11aca5: INCBIN "data/levels/unknown2/data_11aca5.bin.rle"
LevelDataUnk1_11ad9c: INCBIN "data/levels/unknown1/data_11ad9c.bin"
LevelDataUnk2_11af9c: INCBIN "data/levels/unknown2/data_11af9c.bin.rle"
LevelDataUnk1_11b0e2: INCBIN "data/levels/unknown1/data_11b0e2.bin"
LevelDataUnk2_11b2e2: INCBIN "data/levels/unknown2/data_11b2e2.bin.rle"
LevelDataUnk1_11b424: INCBIN "data/levels/unknown1/data_11b424.bin"
LevelDataUnk2_11b624: INCBIN "data/levels/unknown2/data_11b624.bin.rle"


SECTION "Level Data 16", ROMX

TheTidalCoast2BlockMap:    INCBIN "data/levels/block_map/the_tidal_coast_2.bin.rle"
TheStagnantSwamp2BlockMap: INCBIN "data/levels/block_map/the_stagnant_swamp_2.bin.rle"

TheTidalCoast2ObjectMap:    INCBIN "data/levels/object_map/the_tidal_coast_2.bin.rle"
TheStagnantSwamp2ObjectMap: INCBIN "data/levels/object_map/the_stagnant_swamp_2.bin.rle"


SECTION "Level Data 17", ROMX

AboveTheClouds2BlockMap: INCBIN "data/levels/block_map/above_the_clouds_2.bin.rle"
TheSteepCanyon2BlockMap: INCBIN "data/levels/block_map/the_steep_canyon_2.bin.rle"

AboveTheClouds2ObjectMap: INCBIN "data/levels/object_map/above_the_clouds_2.bin.rle"
TheSteepCanyon2ObjectMap: INCBIN "data/levels/object_map/the_steep_canyon_2.bin.rle"


SECTION "Level Data 18", ROMX

ThePeacefulVillage2BlockMap: INCBIN "data/levels/block_map/the_peaceful_village_2.bin.rle"

ThePeacefulVillage2ObjectMap: INCBIN "data/levels/object_map/the_peaceful_village_2.bin.rle"


SECTION "Room Special Tiles 1", ROMX

INCLUDE "data/levels/special_tiles1.asm"


SECTION "Room Special Tiles 2", ROMX

INCLUDE "data/levels/special_tiles2.asm"


SECTION "Block Function Tables 2", ROMX

INCLUDE "data/levels/function_tables2.asm"


SECTION "Room Main Tiles 1", ROMX

INCLUDE "data/levels/main_tiles1.asm"


SECTION "Room Main Tiles 2", ROMX

INCLUDE "data/levels/main_tiles2.asm"


SECTION "Room Main Tiles 3", ROMX

INCLUDE "data/levels/main_tiles3.asm"


SECTION "Room Main Tiles 4", ROMX

INCLUDE "data/levels/main_tiles4.asm"


SECTION "Room Main Tiles 5", ROMX

INCLUDE "data/levels/main_tiles5.asm"


SECTION "Credits", ROMX

INCLUDE "engine/credits.asm"
INCLUDE "data/credits.asm"

CreditsPalsMap: INCBIN "gfx/pals/credits_pals_map.bin"


SECTION "Bank 78", ROMX

INCLUDE "engine/bank78.asm"


SECTION "Wario States 4", ROMX

INCLUDE "engine/level/wario_states_4.asm"


SECTION "Bank 7C", ROMX

INCLUDE "engine/pause/state_table.asm"
INCLUDE "engine/pause/pause_menu.asm"
INCLUDE "engine/pause/save.asm"
INCLUDE "engine/bank7c.asm"


SECTION "Bank 7D", ROMX

INCLUDE "engine/bank7d.asm"
