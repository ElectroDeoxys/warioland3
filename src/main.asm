SECTION "Main State Table", ROMX

INCLUDE "engine/main_state_table.asm"


SECTION "Title", ROMX

INCLUDE "engine/title/state_table.asm"
INCLUDE "engine/title/intro.asm"
INCLUDE "engine/title/start_menu.asm"
INCLUDE "engine/title/time_attack_description.asm"


SECTION "Common 1", ROMX

INCLUDE "engine/overworld/common.asm"
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
INCLUDE "engine/overworld/level_select.asm"
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

INCLUDE "data/levels/function_table_pointers.asm"
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
GolfMenuGfx::    INCBIN "gfx/golf/golf_menu.2bpp.rle"
GolfMenuTilemap: INCBIN "data/bgmaps/golf/menu.tilemap.rle"
GolfMenuAttrmap: INCBIN "data/bgmaps/golf/menu.attrmap.rle"

INCLUDE "data/clear/pencil_oam.asm"


SECTION "Game Over", ROMX

INCLUDE "engine/game_over/state_table.asm"
INCLUDE "engine/game_over/core.asm"
INCLUDE "engine/game_over/load_gfx.asm"
INCLUDE "data/game_over/palettes.asm"

GameOverGfx:     INCBIN "gfx/game_over.2bpp.rle"
GameOverTilemap: INCBIN "data/bgmaps/game_over.tilemap.rle"
GameOverAttrmap: INCBIN "data/bgmaps/game_over.attrmap.rle"

INCLUDE "data/game_over/oam.asm"
INCLUDE "data/game_over/framesets.asm"


SECTION "Perfect", ROMX

INCLUDE "engine/perfect/state_table.asm"
INCLUDE "engine/perfect/core.asm"
INCLUDE "data/perfect/palettes.asm"

PerfectGfx:     INCBIN "gfx/perfect.2bpp.rle"
PerfectTilemap: INCBIN "data/bgmaps/perfect.tilemap.rle"
PerfectAttrmap: INCBIN "data/bgmaps/perfect.attrmap.rle"

INCLUDE "data/perfect/oam.asm"
INCLUDE "data/perfect/framesets.asm"


SECTION "Level Data 1", ROMX

OutOfTheWoodsBlockMap:       INCBIN "data/levels/block_map/out_of_the_woods.bin.rle"
ThePeacefulVillage1BlockMap: INCBIN "data/levels/block_map/the_peaceful_village_1.bin.rle"

OutOfTheWoodsObjectMap:       INCBIN "data/levels/object_map/out_of_the_woods.bin.rle"
ThePeacefulVillage1ObjectMap: INCBIN "data/levels/object_map/the_peaceful_village_1.bin.rle"

BlocksetTiles00: INCBIN "data/levels/blocksets/blockset_tiles_00.bin"
BlocksetAttributes00: INCBIN "data/levels/blocksets/blockset_attributes_00.bin.rle"
BlocksetTiles01: INCBIN "data/levels/blocksets/blockset_tiles_01.bin"
BlocksetAttributes01: INCBIN "data/levels/blocksets/blockset_attributes_01.bin.rle"
BlocksetTiles02: INCBIN "data/levels/blocksets/blockset_tiles_02.bin"
BlocksetAttributes02: INCBIN "data/levels/blocksets/blockset_attributes_02.bin.rle"
BlocksetTiles03: INCBIN "data/levels/blocksets/blockset_tiles_03.bin"
BlocksetAttributes03: INCBIN "data/levels/blocksets/blockset_attributes_03.bin.rle"
BlocksetTiles04: INCBIN "data/levels/blocksets/blockset_tiles_04.bin"
BlocksetAttributes04: INCBIN "data/levels/blocksets/blockset_attributes_04.bin.rle"
BlocksetTiles05: INCBIN "data/levels/blocksets/blockset_tiles_05.bin"
BlocksetAttributes05: INCBIN "data/levels/blocksets/blockset_attributes_05.bin.rle"


SECTION "Level Data 2", ROMX

TheVastPlain1BlockMap:   INCBIN "data/levels/block_map/the_vast_plain_1.bin.rle"
TheSteepCanyon1BlockMap: INCBIN "data/levels/block_map/the_steep_canyon_1.bin.rle"

TheVastPlain1ObjectMap:   INCBIN "data/levels/object_map/the_vast_plain_1.bin.rle"
TheSteepCanyon1ObjectMap: INCBIN "data/levels/object_map/the_steep_canyon_1.bin.rle"

BlocksetTiles06: INCBIN "data/levels/blocksets/blockset_tiles_06.bin"
BlocksetAttributes06: INCBIN "data/levels/blocksets/blockset_attributes_06.bin.rle"
BlocksetTiles07: INCBIN "data/levels/blocksets/blockset_tiles_07.bin"
BlocksetAttributes07: INCBIN "data/levels/blocksets/blockset_attributes_07.bin.rle"
BlocksetTiles08: INCBIN "data/levels/blocksets/blockset_tiles_08.bin"
BlocksetAttributes08: INCBIN "data/levels/blocksets/blockset_attributes_08.bin.rle"
BlocksetTiles09: INCBIN "data/levels/blocksets/blockset_tiles_09.bin"
BlocksetAttributes09: INCBIN "data/levels/blocksets/blockset_attributes_09.bin.rle"
BlocksetTiles10: INCBIN "data/levels/blocksets/blockset_tiles_10.bin"
BlocksetAttributes10: INCBIN "data/levels/blocksets/blockset_attributes_10.bin.rle"
BlocksetTiles11: INCBIN "data/levels/blocksets/blockset_tiles_11.bin"
BlocksetAttributes11: INCBIN "data/levels/blocksets/blockset_attributes_11.bin.rle"


SECTION "Level Data 3", ROMX

TheTidalCoast1BlockMap: INCBIN "data/levels/block_map/the_tidal_coast_1.bin.rle"
SeaTurtleRocksBlockMap: INCBIN "data/levels/block_map/sea_turtle_rocks.bin.rle"

TheTidalCoast1ObjectMap: INCBIN "data/levels/object_map/the_tidal_coast_1.bin.rle"
SeaTurtleRocksObjectMap: INCBIN "data/levels/object_map/sea_turtle_rocks.bin.rle"

BlocksetTiles12: INCBIN "data/levels/blocksets/blockset_tiles_12.bin"
BlocksetAttributes12: INCBIN "data/levels/blocksets/blockset_attributes_12.bin.rle"
BlocksetTiles13: INCBIN "data/levels/blocksets/blockset_tiles_13.bin"
BlocksetAttributes13: INCBIN "data/levels/blocksets/blockset_attributes_13.bin.rle"
BlocksetTiles14: INCBIN "data/levels/blocksets/blockset_tiles_14.bin"
BlocksetAttributes14: INCBIN "data/levels/blocksets/blockset_attributes_14.bin.rle"
BlocksetTiles15: INCBIN "data/levels/blocksets/blockset_tiles_15.bin"
BlocksetAttributes15: INCBIN "data/levels/blocksets/blockset_attributes_15.bin.rle"
BlocksetTiles16: INCBIN "data/levels/blocksets/blockset_tiles_16.bin"
BlocksetAttributes16: INCBIN "data/levels/blocksets/blockset_attributes_16.bin.rle"
BlocksetTiles17: INCBIN "data/levels/blocksets/blockset_tiles_17.bin"
BlocksetAttributes17: INCBIN "data/levels/blocksets/blockset_attributes_17.bin.rle"


SECTION "Level Data 4", ROMX

DesertRuinsBlockMap:      INCBIN "data/levels/block_map/desert_ruins.bin.rle"
TheVolcanosBase1BlockMap: INCBIN "data/levels/block_map/the_volcanos_base_1.bin.rle"

DesertRuinsObjectMap:      INCBIN "data/levels/object_map/desert_ruins.bin.rle"
TheVolcanosBase1ObjectMap: INCBIN "data/levels/object_map/the_volcanos_base_1.bin.rle"

BlocksetTiles18: INCBIN "data/levels/blocksets/blockset_tiles_18.bin"
BlocksetAttributes18: INCBIN "data/levels/blocksets/blockset_attributes_18.bin.rle"
BlocksetTiles19: INCBIN "data/levels/blocksets/blockset_tiles_19.bin"
BlocksetAttributes19: INCBIN "data/levels/blocksets/blockset_attributes_19.bin.rle"
BlocksetTiles20: INCBIN "data/levels/blocksets/blockset_tiles_20.bin"
BlocksetAttributes20: INCBIN "data/levels/blocksets/blockset_attributes_20.bin.rle"
BlocksetTiles21: INCBIN "data/levels/blocksets/blockset_tiles_21.bin"
BlocksetAttributes21: INCBIN "data/levels/blocksets/blockset_attributes_21.bin.rle"
BlocksetTiles22: INCBIN "data/levels/blocksets/blockset_tiles_22.bin"
BlocksetAttributes22: INCBIN "data/levels/blocksets/blockset_attributes_22.bin.rle"
BlocksetTiles23: INCBIN "data/levels/blocksets/blockset_tiles_23.bin"
BlocksetAttributes23: INCBIN "data/levels/blocksets/blockset_attributes_23.bin.rle"


SECTION "Level Data 5", ROMX

ThePoolOfRain1BlockMap: INCBIN "data/levels/block_map/the_pool_of_rain_1.bin.rle"
ATownInChaosBlockMap:   INCBIN "data/levels/block_map/a_town_in_chaos.bin.rle"

ThePoolOfRain1ObjectMap: INCBIN "data/levels/object_map/the_pool_of_rain_1.bin.rle"
ATownInChaosObjectMap:   INCBIN "data/levels/object_map/a_town_in_chaos.bin.rle"

BlocksetTiles24: INCBIN "data/levels/blocksets/blockset_tiles_24.bin"
BlocksetAttributes24: INCBIN "data/levels/blocksets/blockset_attributes_24.bin.rle"
BlocksetTiles25: INCBIN "data/levels/blocksets/blockset_tiles_25.bin"
BlocksetAttributes25: INCBIN "data/levels/blocksets/blockset_attributes_25.bin.rle"
BlocksetTiles26: INCBIN "data/levels/blocksets/blockset_tiles_26.bin"
BlocksetAttributes26: INCBIN "data/levels/blocksets/blockset_attributes_26.bin.rle"
BlocksetTiles27: INCBIN "data/levels/blocksets/blockset_tiles_27.bin"
BlocksetAttributes27: INCBIN "data/levels/blocksets/blockset_attributes_27.bin.rle"
BlocksetTiles28: INCBIN "data/levels/blocksets/blockset_tiles_28.bin"
BlocksetAttributes28: INCBIN "data/levels/blocksets/blockset_attributes_28.bin.rle"
BlocksetTiles29: INCBIN "data/levels/blocksets/blockset_tiles_29.bin"
BlocksetAttributes29: INCBIN "data/levels/blocksets/blockset_attributes_29.bin.rle"


SECTION "Level Data 6", ROMX

BeneathTheWavesBlockMap: INCBIN "data/levels/block_map/beneath_the_waves.bin.rle"
TheWestCraterBlockMap:   INCBIN "data/levels/block_map/the_west_crater.bin.rle"

BeneathTheWavesObjectMap: INCBIN "data/levels/object_map/beneath_the_waves.bin.rle"
TheWestCraterObjectMap:   INCBIN "data/levels/object_map/the_west_crater.bin.rle"

BlocksetTiles30: INCBIN "data/levels/blocksets/blockset_tiles_30.bin"
BlocksetAttributes30: INCBIN "data/levels/blocksets/blockset_attributes_30.bin.rle"
BlocksetTiles31: INCBIN "data/levels/blocksets/blockset_tiles_31.bin"
BlocksetAttributes31: INCBIN "data/levels/blocksets/blockset_attributes_31.bin.rle"
BlocksetTiles32: INCBIN "data/levels/blocksets/blockset_tiles_32.bin"
BlocksetAttributes32: INCBIN "data/levels/blocksets/blockset_attributes_32.bin.rle"
BlocksetTiles33: INCBIN "data/levels/blocksets/blockset_tiles_33.bin"
BlocksetAttributes33: INCBIN "data/levels/blocksets/blockset_attributes_33.bin.rle"
BlocksetTiles34: INCBIN "data/levels/blocksets/blockset_tiles_34.bin"
BlocksetAttributes34: INCBIN "data/levels/blocksets/blockset_attributes_34.bin.rle"
BlocksetTiles35: INCBIN "data/levels/blocksets/blockset_tiles_35.bin"
BlocksetAttributes35: INCBIN "data/levels/blocksets/blockset_attributes_35.bin.rle"


SECTION "Level Data 7", ROMX

TheGrasslandsBlockMap: INCBIN "data/levels/block_map/the_grasslands.bin.rle"
TheBigBridgeBlockMap:  INCBIN "data/levels/block_map/the_big_bridge.bin.rle"

TheGrasslandsObjectMap: INCBIN "data/levels/object_map/the_grasslands.bin.rle"
TheBigBridgeObjectMap:  INCBIN "data/levels/object_map/the_big_bridge.bin.rle"

BlocksetTiles36: INCBIN "data/levels/blocksets/blockset_tiles_36.bin"
BlocksetAttributes36: INCBIN "data/levels/blocksets/blockset_attributes_36.bin.rle"
BlocksetTiles37: INCBIN "data/levels/blocksets/blockset_tiles_37.bin"
BlocksetAttributes37: INCBIN "data/levels/blocksets/blockset_attributes_37.bin.rle"
BlocksetTiles38: INCBIN "data/levels/blocksets/blockset_tiles_38.bin"
BlocksetAttributes38: INCBIN "data/levels/blocksets/blockset_attributes_38.bin.rle"
BlocksetTiles39: INCBIN "data/levels/blocksets/blockset_tiles_39.bin"
BlocksetAttributes39: INCBIN "data/levels/blocksets/blockset_attributes_39.bin.rle"
BlocksetTiles40: INCBIN "data/levels/blocksets/blockset_tiles_40.bin"
BlocksetAttributes40: INCBIN "data/levels/blocksets/blockset_attributes_40.bin.rle"
BlocksetTiles41: INCBIN "data/levels/blocksets/blockset_tiles_41.bin"
BlocksetAttributes41: INCBIN "data/levels/blocksets/blockset_attributes_41.bin.rle"


SECTION "Level Data 8", ROMX

TowerOfRevivalBlockMap:     INCBIN "data/levels/block_map/tower_of_revival.bin.rle"
BankOfTheWildRiverBlockMap: INCBIN "data/levels/block_map/bank_of_the_wild_river.bin.rle"

TowerOfRevivalObjectMap:     INCBIN "data/levels/object_map/tower_of_revival.bin.rle"
BankOfTheWildRiverObjectMap: INCBIN "data/levels/object_map/bank_of_the_wild_river.bin.rle"

BlocksetTiles42: INCBIN "data/levels/blocksets/blockset_tiles_42.bin"
BlocksetAttributes42: INCBIN "data/levels/blocksets/blockset_attributes_42.bin.rle"
BlocksetTiles43: INCBIN "data/levels/blocksets/blockset_tiles_43.bin"
BlocksetAttributes43: INCBIN "data/levels/blocksets/blockset_attributes_43.bin.rle"
BlocksetTiles44: INCBIN "data/levels/blocksets/blockset_tiles_44.bin"
BlocksetAttributes44: INCBIN "data/levels/blocksets/blockset_attributes_44.bin.rle"
BlocksetTiles45: INCBIN "data/levels/blocksets/blockset_tiles_45.bin"
BlocksetAttributes45: INCBIN "data/levels/blocksets/blockset_attributes_45.bin.rle"
BlocksetTiles46: INCBIN "data/levels/blocksets/blockset_tiles_46.bin"
BlocksetAttributes46: INCBIN "data/levels/blocksets/blockset_attributes_46.bin.rle"
BlocksetTiles47: INCBIN "data/levels/blocksets/blockset_tiles_47.bin"
BlocksetAttributes47: INCBIN "data/levels/blocksets/blockset_attributes_47.bin.rle"


SECTION "Level Data 9", ROMX

CaveOfFlamesBlockMap:    INCBIN "data/levels/block_map/cave_of_flames.bin.rle"
AboveTheClouds1BlockMap: INCBIN "data/levels/block_map/above_the_clouds_1.bin.rle"

CaveOfFlamesObjectMap:    INCBIN "data/levels/object_map/cave_of_flames.bin.rle"
AboveTheClouds1ObjectMap: INCBIN "data/levels/object_map/above_the_clouds_1.bin.rle"

BlocksetTiles48: INCBIN "data/levels/blocksets/blockset_tiles_48.bin"
BlocksetAttributes48: INCBIN "data/levels/blocksets/blockset_attributes_48.bin.rle"
BlocksetTiles49: INCBIN "data/levels/blocksets/blockset_tiles_49.bin"
BlocksetAttributes49: INCBIN "data/levels/blocksets/blockset_attributes_49.bin.rle"
BlocksetTiles50: INCBIN "data/levels/blocksets/blockset_tiles_50.bin"
BlocksetAttributes50: INCBIN "data/levels/blocksets/blockset_attributes_50.bin.rle"
BlocksetTiles51: INCBIN "data/levels/blocksets/blockset_tiles_51.bin"
BlocksetAttributes51: INCBIN "data/levels/blocksets/blockset_attributes_51.bin.rle"
BlocksetTiles52: INCBIN "data/levels/blocksets/blockset_tiles_52.bin"
BlocksetAttributes52: INCBIN "data/levels/blocksets/blockset_attributes_52.bin.rle"
BlocksetTiles53: INCBIN "data/levels/blocksets/blockset_tiles_53.bin"
BlocksetAttributes53: INCBIN "data/levels/blocksets/blockset_attributes_53.bin.rle"


SECTION "Level Data 10", ROMX

TheStagnantSwamp1BlockMap: INCBIN "data/levels/block_map/the_stagnant_swamp_1.bin.rle"
TheFrigidSeaBlockMap:      INCBIN "data/levels/block_map/the_frigid_sea.bin.rle"

TheStagnantSwamp1ObjectMap: INCBIN "data/levels/object_map/the_stagnant_swamp_1.bin.rle"
TheFrigidSeaObjectMap:      INCBIN "data/levels/object_map/the_frigid_sea.bin.rle"

BlocksetTiles54: INCBIN "data/levels/blocksets/blockset_tiles_54.bin"
BlocksetAttributes54: INCBIN "data/levels/blocksets/blockset_attributes_54.bin.rle"
BlocksetTiles55: INCBIN "data/levels/blocksets/blockset_tiles_55.bin"
BlocksetAttributes55: INCBIN "data/levels/blocksets/blockset_attributes_55.bin.rle"
BlocksetTiles56: INCBIN "data/levels/blocksets/blockset_tiles_56.bin"
BlocksetAttributes56: INCBIN "data/levels/blocksets/blockset_attributes_56.bin.rle"
BlocksetTiles57: INCBIN "data/levels/blocksets/blockset_tiles_57.bin"
BlocksetAttributes57: INCBIN "data/levels/blocksets/blockset_attributes_57.bin.rle"
BlocksetTiles58: INCBIN "data/levels/blocksets/blockset_tiles_58.bin"
BlocksetAttributes58: INCBIN "data/levels/blocksets/blockset_attributes_58.bin.rle"
BlocksetTiles59: INCBIN "data/levels/blocksets/blockset_tiles_59.bin"
BlocksetAttributes59: INCBIN "data/levels/blocksets/blockset_attributes_59.bin.rle"


SECTION "Level Data 11", ROMX

CastleOfIllusionsBlockMap: INCBIN "data/levels/block_map/castle_of_illusions.bin.rle"
TheColossalHole1BlockMap:  INCBIN "data/levels/block_map/the_colossal_hole_1.bin.rle"

CastleOfIllusionsObjectMap: INCBIN "data/levels/object_map/castle_of_illusions.bin.rle"
TheColossalHole1ObjectMap:  INCBIN "data/levels/object_map/the_colossal_hole_1.bin.rle"

BlocksetTiles60: INCBIN "data/levels/blocksets/blockset_tiles_60.bin"
BlocksetAttributes60: INCBIN "data/levels/blocksets/blockset_attributes_60.bin.rle"
BlocksetTiles61: INCBIN "data/levels/blocksets/blockset_tiles_61.bin"
BlocksetAttributes61: INCBIN "data/levels/blocksets/blockset_attributes_61.bin.rle"
BlocksetTiles62: INCBIN "data/levels/blocksets/blockset_tiles_62.bin"
BlocksetAttributes62: INCBIN "data/levels/blocksets/blockset_attributes_62.bin.rle"
BlocksetTiles65: INCBIN "data/levels/blocksets/blockset_tiles_65.bin"
BlocksetAttributes65: INCBIN "data/levels/blocksets/blockset_attributes_65.bin.rle"
BlocksetTiles63: INCBIN "data/levels/blocksets/blockset_tiles_63.bin"
BlocksetAttributes63: INCBIN "data/levels/blocksets/blockset_attributes_63.bin.rle"
BlocksetTiles64: INCBIN "data/levels/blocksets/blockset_tiles_64.bin"
BlocksetAttributes64: INCBIN "data/levels/blocksets/blockset_attributes_64.bin.rle"


SECTION "Level Data 12", ROMX

TheWarpedVoidBlockMap: INCBIN "data/levels/block_map/the_warped_void.bin.rle"
TheEastCraterBlockMap: INCBIN "data/levels/block_map/the_east_crater.bin.rle"

TheWarpedVoidObjectMap: INCBIN "data/levels/object_map/the_warped_void.bin.rle"
TheEastCraterObjectMap: INCBIN "data/levels/object_map/the_east_crater.bin.rle"

BlocksetTiles66: INCBIN "data/levels/blocksets/blockset_tiles_66.bin"
BlocksetAttributes66: INCBIN "data/levels/blocksets/blockset_attributes_66.bin.rle"
BlocksetTiles67: INCBIN "data/levels/blocksets/blockset_tiles_67.bin"
BlocksetAttributes67: INCBIN "data/levels/blocksets/blockset_attributes_67.bin.rle"
BlocksetTiles68: INCBIN "data/levels/blocksets/blockset_tiles_68.bin"
BlocksetAttributes68: INCBIN "data/levels/blocksets/blockset_attributes_68.bin.rle"
BlocksetTiles69: INCBIN "data/levels/blocksets/blockset_tiles_69.bin"
BlocksetAttributes69: INCBIN "data/levels/blocksets/blockset_attributes_69.bin.rle"
BlocksetTiles70: INCBIN "data/levels/blocksets/blockset_tiles_70.bin"
BlocksetAttributes70: INCBIN "data/levels/blocksets/blockset_attributes_70.bin.rle"
BlocksetTiles71: INCBIN "data/levels/blocksets/blockset_tiles_71.bin"
BlocksetAttributes71: INCBIN "data/levels/blocksets/blockset_attributes_71.bin.rle"


SECTION "Level Data 13", ROMX

ForestOfFearBlockMap:     INCBIN "data/levels/block_map/forest_of_fear.bin.rle"
HiddenFigureRoomBlockMap: INCBIN "data/levels/block_map/hidden_figure_room.bin.rle"

ForestOfFearObjectMap:     INCBIN "data/levels/object_map/forest_of_fear.bin.rle"
HiddenFigureRoomObjectMap: INCBIN "data/levels/object_map/hidden_figure_room.bin.rle"

BlocksetTiles72: INCBIN "data/levels/blocksets/blockset_tiles_72.bin"
BlocksetAttributes72: INCBIN "data/levels/blocksets/blockset_attributes_72.bin.rle"
BlocksetTiles73: INCBIN "data/levels/blocksets/blockset_tiles_73.bin"
BlocksetAttributes73: INCBIN "data/levels/blocksets/blockset_attributes_73.bin.rle"
BlocksetTiles74: INCBIN "data/levels/blocksets/blockset_tiles_74.bin"
BlocksetAttributes74: INCBIN "data/levels/blocksets/blockset_attributes_74.bin.rle"
BlocksetTiles75: INCBIN "data/levels/blocksets/blockset_tiles_75.bin"
BlocksetAttributes75: INCBIN "data/levels/blocksets/blockset_attributes_75.bin.rle"
BlocksetTiles76: INCBIN "data/levels/blocksets/blockset_tiles_76.bin"
BlocksetAttributes76: INCBIN "data/levels/blocksets/blockset_attributes_76.bin.rle"
BlocksetTiles77: INCBIN "data/levels/blocksets/blockset_tiles_77.bin"
BlocksetAttributes77: INCBIN "data/levels/blocksets/blockset_attributes_77.bin.rle"


SECTION "Level Data 14", ROMX

TheVastPlain2BlockMap:    INCBIN "data/levels/block_map/the_vast_plain_2.bin.rle"
TheVolcanosBase2BlockMap: INCBIN "data/levels/block_map/the_volcanos_base_2.bin.rle"

TheVastPlain2ObjectMap:    INCBIN "data/levels/object_map/the_vast_plain_2.bin.rle"
TheVolcanosBase2ObjectMap: INCBIN "data/levels/object_map/the_volcanos_base_2.bin.rle"

BlocksetTiles78: INCBIN "data/levels/blocksets/blockset_tiles_78.bin"
BlocksetAttributes78: INCBIN "data/levels/blocksets/blockset_attributes_78.bin.rle"
BlocksetTiles79: INCBIN "data/levels/blocksets/blockset_tiles_79.bin"
BlocksetAttributes79: INCBIN "data/levels/blocksets/blockset_attributes_79.bin.rle"
BlocksetTiles80: INCBIN "data/levels/blocksets/blockset_tiles_80.bin"
BlocksetAttributes80: INCBIN "data/levels/blocksets/blockset_attributes_80.bin.rle"
BlocksetTiles81: INCBIN "data/levels/blocksets/blockset_tiles_81.bin"
BlocksetAttributes81: INCBIN "data/levels/blocksets/blockset_attributes_81.bin.rle"
BlocksetTiles82: INCBIN "data/levels/blocksets/blockset_tiles_82.bin"
BlocksetAttributes82: INCBIN "data/levels/blocksets/blockset_attributes_82.bin.rle"
BlocksetTiles83: INCBIN "data/levels/blocksets/blockset_tiles_83.bin"
BlocksetAttributes83: INCBIN "data/levels/blocksets/blockset_attributes_83.bin.rle"


SECTION "Level Data 15", ROMX

ThePoolOfRain2BlockMap:   INCBIN "data/levels/block_map/the_pool_of_rain_2.bin.rle"
TheColossalHole2BlockMap: INCBIN "data/levels/block_map/the_colossal_hole_2.bin.rle"

ThePoolOfRain2ObjectMap:   INCBIN "data/levels/object_map/the_pool_of_rain_2.bin.rle"
TheColossalHole2ObjectMap: INCBIN "data/levels/object_map/the_colossal_hole_2.bin.rle"

BlocksetTiles84: INCBIN "data/levels/blocksets/blockset_tiles_84.bin"
BlocksetAttributes84: INCBIN "data/levels/blocksets/blockset_attributes_84.bin.rle"
BlocksetTiles85: INCBIN "data/levels/blocksets/blockset_tiles_85.bin"
BlocksetAttributes85: INCBIN "data/levels/blocksets/blockset_attributes_85.bin.rle"
BlocksetTiles86: INCBIN "data/levels/blocksets/blockset_tiles_86.bin"
BlocksetAttributes86: INCBIN "data/levels/blocksets/blockset_attributes_86.bin.rle"
BlocksetTiles87: INCBIN "data/levels/blocksets/blockset_tiles_87.bin"
BlocksetAttributes87: INCBIN "data/levels/blocksets/blockset_attributes_87.bin.rle"
BlocksetTiles88: INCBIN "data/levels/blocksets/blockset_tiles_88.bin"
BlocksetAttributes88: INCBIN "data/levels/blocksets/blockset_attributes_88.bin.rle"


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
INCLUDE "engine/pause/pause_menu_1.asm"
INCLUDE "engine/pause/save/save.asm"
INCLUDE "engine/load_font.asm"
INCLUDE "engine/pause/pause_menu_2.asm"
INCLUDE "engine/pause/save/checksum.asm"
INCLUDE "engine/pause/save/vblank.asm"
INCLUDE "engine/pause/save/validate_save.asm"
INCLUDE "data/pause/oam.asm"

FontGfx:: INCBIN "gfx/font.2bpp.rle"

GBIncompatibleGfx:     INCBIN "gfx/gb_incompatible.2bpp.rle"
GBIncompatibleTilemap: INCBIN "data/bgmaps/gb_incompatible.tilemap.rle"
GBIncompatibleAttrmap: INCBIN "data/bgmaps/gb_incompatible.attrmap.rle" ; unreferenced

INCLUDE "data/pause/palettes.asm"

LanguageSelection1TextMap:
INCBIN "data/bgmaps/text/language_selection1.tilemap"

LanguageSelection2TextMap:
INCBIN "data/bgmaps/text/language_selection2.tilemap"


SECTION "Bank 7D", ROMX

INCLUDE "engine/bank7d.asm"
