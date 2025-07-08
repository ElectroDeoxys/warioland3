SECTION "Main State Table", ROMX

INCLUDE "engine/main_state_table.asm"


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


SECTION "Print Counts", ROMX

INCLUDE "engine/print_counts.asm"
INCLUDE "engine/overworld/level_select.asm"


SECTION "Language Selection Gfx Engine", ROMX

INCLUDE "engine/language_selection/vblank.asm"
INCLUDE "engine/language_selection/load_oam.asm"


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
GolfMenuGfx:    INCBIN "gfx/golf/golf_menu.2bpp.rle"
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

FontGfx: INCBIN "gfx/font.2bpp.rle"

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

ActionHelpHUDGfx:      INCBIN "gfx/misc/action_help_hud.2bpp.rle"
ActionHelpObjects1Gfx: INCBIN "gfx/misc/action_help_objects1.2bpp.rle"
ActionHelpObjects2Gfx: INCBIN "gfx/misc/action_help_objects2.2bpp.rle"

ActionHelpTilemap: INCBIN "data/bgmaps/action_help.tilemap.rle"
ActionHelpAttrmap: INCBIN "data/bgmaps/action_help.attrmap.rle"

INCLUDE "gfx/oam/action_help.asm"


SECTION "Epilogue Gfx", ROMX

INCLUDE "data/overworld/epilogue/oam.asm"
INCLUDE "data/overworld/epilogue/framesets.asm"


SECTION "Wario Gfx 1", ROMX

WarioIdleGfx:     INCBIN "gfx/wario/idle.2bpp"
WarioWalkGfx:     INCBIN "gfx/wario/walk.2bpp"
WarioDizzyGfx:    INCBIN "gfx/wario/dizzy.2bpp"
WarioAttackGfx:   INCBIN "gfx/wario/attack.2bpp"
WarioSwimGfx:     INCBIN "gfx/wario/swim.2bpp"
WarioLadderGfx:   INCBIN "gfx/wario/ladder.2bpp"
WarioThrowGfx:    INCBIN "gfx/wario/throw.2bpp"
WarioAirborneGfx: INCBIN "gfx/wario/airborne.2bpp"


SECTION "Wario Gfx 2", ROMX

WarioHotGfx:      INCBIN "gfx/wario/hot.2bpp"
WarioBurntGfx:    INCBIN "gfx/wario/burnt.2bpp"
WarioSlideGfx:    INCBIN "gfx/wario/slide.2bpp"
WarioStringGfx:   INCBIN "gfx/wario/string.2bpp"
WarioFatGfx:      INCBIN "gfx/wario/fat.2bpp"
WarioElectricGfx: INCBIN "gfx/wario/electric.2bpp"
WarioPuffyGfx:    INCBIN "gfx/wario/puffy.2bpp"


SECTION "Wario Gfx 3", ROMX

WarioZombieGfx:  INCBIN "gfx/wario/zombie.2bpp"
WarioBouncyGfx:  INCBIN "gfx/wario/bouncy.2bpp"
WarioCrazyGfx:   INCBIN "gfx/wario/crazy.2bpp"
WarioBatGfx:     INCBIN "gfx/wario/bat.2bpp"
WarioVampireGfx: INCBIN "gfx/wario/vampire.2bpp"
WarioBubbleGfx:  INCBIN "gfx/wario/bubble.2bpp"
WarioClearGfx:   INCBIN "gfx/wario/clear.2bpp"
WarioHangGfx:    INCBIN "gfx/wario/hang.2bpp"


SECTION "Wario Gfx 4", ROMX

WarioSnowmanGfx:  INCBIN "gfx/wario/snowman.2bpp"
WarioSnowballGfx: INCBIN "gfx/wario/snowball.2bpp"
WarioFanGfx:      INCBIN "gfx/wario/fan.2bpp"
WarioLaunchGfx:   INCBIN "gfx/wario/launch.2bpp"
WarioMagicGfx:    INCBIN "gfx/wario/magic.2bpp"
WarioBallGfx:     INCBIN "gfx/wario/ball.2bpp"


SECTION "Enemy Gfx 1 Slot 1", ROMX

SpearheadGfx:     INCBIN "gfx/enemies/spearhead.2bpp.rle"
UnusedFlowerGfx:  INCBIN "gfx/enemies/unused_flower.2bpp.rle"
MizuuoGfx:        INCBIN "gfx/enemies/mizuuo.2bpp.rle"
SilkyGfx:         INCBIN "gfx/enemies/silky.2bpp.rle"
SnakeGfx:         INCBIN "gfx/enemies/snake.2bpp.rle"
PrinceFroggyGfx:  INCBIN "gfx/enemies/prince_froggy.2bpp.rle"
MadSciensteinGfx: INCBIN "gfx/enemies/mad_scienstein.2bpp.rle"
Sun1Gfx:          INCBIN "gfx/enemies/sun1.2bpp.rle"
Moon1Gfx:         INCBIN "gfx/enemies/moon1.2bpp.rle"
RoboMouse1Gfx:    INCBIN "gfx/enemies/robo_mouse1.2bpp.rle"
HaridamaGfx:      INCBIN "gfx/enemies/haridama.2bpp.rle"
OwlGfx:           INCBIN "gfx/enemies/owl.2bpp.rle"
StoveGfx:         INCBIN "gfx/enemies/stove.2bpp.rle"
WaterSparkGfx:    INCBIN "gfx/enemies/water_spark.2bpp.rle"


SECTION "Enemy Gfx 1 Slot 2", ROMX

WebberGfx:             INCBIN "gfx/enemies/webber.2bpp.rle"
CountRichtertoffenGfx: INCBIN "gfx/enemies/count_richtertoffen.2bpp.rle"
ParaGoomGfx:           INCBIN "gfx/enemies/para_goom.2bpp.rle"
KushimushiGfx:         INCBIN "gfx/enemies/kushimushi.2bpp.rle"
BirdGfx:               INCBIN "gfx/enemies/bird.2bpp.rle"
ApplebyGfx:            INCBIN "gfx/enemies/appleby.2bpp.rle"
HammerBotGfx:          INCBIN "gfx/enemies/hammer_bot.2bpp.rle"
PneumoGfx:             INCBIN "gfx/enemies/pneumo.2bpp.rle"
Sun2Gfx:               INCBIN "gfx/enemies/sun2.2bpp.rle"
Moon2Gfx:              INCBIN "gfx/enemies/moon2.2bpp.rle"
RoboMouse2Gfx:         INCBIN "gfx/enemies/robo_mouse2.2bpp.rle"
ClearGate1Gfx:         INCBIN "gfx/enemies/clear_gate.2bpp.rle"


SECTION "Enemy Gfx 1 Slot 3", ROMX

FutamoguGfx:    INCBIN "gfx/enemies/futamogu.2bpp.rle"
HebariiGfx:     INCBIN "gfx/enemies/hebarii.2bpp.rle"
DoughnuteerGfx: INCBIN "gfx/enemies/doughnuteer.2bpp.rle"
BigLeafGfx:     INCBIN "gfx/enemies/big_leaf.2bpp.rle"
ZombieGfx:      INCBIN "gfx/enemies/zombie.2bpp.rle"
SpearBotGfx:    INCBIN "gfx/enemies/spear_bot.2bpp.rle"
OmodonGfx:      INCBIN "gfx/enemies/omodon.2bpp.rle"
KobattoGfx:     INCBIN "gfx/enemies/kobatto.2bpp.rle"
HandGfx:        INCBIN "gfx/enemies/hand.2bpp.rle"
BubbleGfx:      INCBIN "gfx/enemies/bubble.2bpp.rle"
CartGfx:        INCBIN "gfx/enemies/cart.2bpp.rle"
ZipLineGfx:     INCBIN "gfx/enemies/zip_line.2bpp.rle"
FlameBlockGfx:  INCBIN "gfx/enemies/flame_block.2bpp.rle"
ClearGate2Gfx:  INCBIN "gfx/enemies/clear_gate.2bpp.rle"
TadpoleGfx:     INCBIN "gfx/enemies/tadpole.2bpp.rle"
RockGfx:        INCBIN "gfx/enemies/rock.2bpp.rle"
FireGfx:        INCBIN "gfx/enemies/fire.2bpp.rle"
WallCrackGfx:   INCBIN "gfx/enemies/wall_crack.2bpp.rle"


SECTION "Enemy Gfx 1 Slot 4", ROMX

TorchGfx:          INCBIN "gfx/enemies/torch.2bpp.rle"
FireBotGfx:        INCBIN "gfx/enemies/fire_bot.2bpp.rle"
BeamBotGfx:        INCBIN "gfx/enemies/beam_bot.2bpp.rle"
BarrelGfx:         INCBIN "gfx/enemies/barrel.2bpp.rle"
SmallLeafGfx:      INCBIN "gfx/enemies/small_leaf.2bpp.rle"
ElectricLampGfx:   INCBIN "gfx/enemies/electric_lamp.2bpp.rle"
TeruteruGfx:       INCBIN "gfx/enemies/teruteru.2bpp.rle"
OmodonmekaGfx:     INCBIN "gfx/enemies/omodonmeka.2bpp.rle"
BrrrBearGfx:       INCBIN "gfx/enemies/brrr_bear.2bpp.rle"
TogebaGfx:         INCBIN "gfx/enemies/togeba.2bpp.rle"
FallingSnowGfx:    INCBIN "gfx/enemies/falling_snow.2bpp.rle"
PillarPlatformGfx: INCBIN "gfx/enemies/pillar_platform.2bpp.rle"
WaterDropGfx:      INCBIN "gfx/enemies/water_drop.2bpp.rle"
NobiiruGfx:        INCBIN "gfx/enemies/nobiiru.2bpp.rle"
ClearGate3Gfx:     INCBIN "gfx/enemies/clear_gate.2bpp.rle"
OctohonGfx:        INCBIN "gfx/enemies/octohon.2bpp.rle"
SparkGfx:          INCBIN "gfx/enemies/spark.2bpp.rle"


SECTION "Enemy Gfx 2 Slot 1", ROMX

Anonster1Gfx:    INCBIN "gfx/enemies/anonster1.2bpp.rle"
DollBoy1Gfx:     INCBIN "gfx/enemies/doll_boy1.2bpp.rle"
Wormwould1Gfx:   INCBIN "gfx/enemies/wormwould1.2bpp.rle"
YellowBelly1Gfx: INCBIN "gfx/enemies/yellow_belly1.2bpp.rle"
Pesce1Gfx:       INCBIN "gfx/enemies/pesce1.2bpp.rle"
Scowler1Gfx:     INCBIN "gfx/enemies/scowler1.2bpp.rle"
Jamano1Gfx:      INCBIN "gfx/enemies/jamano1.2bpp.rle"
Muddee1Gfx:      INCBIN "gfx/enemies/muddee1.2bpp.rle"
Wolfenboss1Gfx:  INCBIN "gfx/enemies/wolfenboss1.2bpp.rle"
Shoot1Gfx:       INCBIN "gfx/enemies/shoot1.2bpp.rle"


SECTION "Enemy Gfx 2 Slot 2", ROMX

Anonster2Gfx:    INCBIN "gfx/enemies/anonster2.2bpp.rle"
DollBoy2Gfx:     INCBIN "gfx/enemies/doll_boy2.2bpp.rle"
Wormwould2Gfx:   INCBIN "gfx/enemies/wormwould2.2bpp.rle"
YellowBelly2Gfx: INCBIN "gfx/enemies/yellow_belly2.2bpp.rle"
Pesce2Gfx:       INCBIN "gfx/enemies/pesce2.2bpp.rle"
Scowler2Gfx:     INCBIN "gfx/enemies/scowler2.2bpp.rle"
Jamano2Gfx:      INCBIN "gfx/enemies/jamano2.2bpp.rle"
Muddee2Gfx:      INCBIN "gfx/enemies/muddee2.2bpp.rle"
Wolfenboss2Gfx:  INCBIN "gfx/enemies/wolfenboss2.2bpp.rle"
Shoot2Gfx:       INCBIN "gfx/enemies/shoot2.2bpp.rle"


SECTION "Enemy Gfx 2 Slot 3", ROMX

Anonster3Gfx:    INCBIN "gfx/enemies/anonster3.2bpp.rle"
DollBoy3Gfx:     INCBIN "gfx/enemies/doll_boy3.2bpp.rle"
Wormwould3Gfx:   INCBIN "gfx/enemies/wormwould3.2bpp.rle"
YellowBelly3Gfx: INCBIN "gfx/enemies/yellow_belly3.2bpp.rle"
Pesce3Gfx:       INCBIN "gfx/enemies/pesce3.2bpp.rle"
Scowler3Gfx:     INCBIN "gfx/enemies/scowler3.2bpp.rle"
Jamano3Gfx:      INCBIN "gfx/enemies/jamano3.2bpp.rle"
Muddee3Gfx:      INCBIN "gfx/enemies/muddee3.2bpp.rle"
Wolfenboss3Gfx:  INCBIN "gfx/enemies/wolfenboss3.2bpp.rle"
Shoot3Gfx:       INCBIN "gfx/enemies/shoot3.2bpp.rle"


SECTION "Enemy Gfx 2 Slot 4", ROMX

Anonster4Gfx:    INCBIN "gfx/enemies/anonster4.2bpp.rle"
DollBoy4Gfx:     INCBIN "gfx/enemies/doll_boy4.2bpp.rle"
Wormwould4Gfx:   INCBIN "gfx/enemies/wormwould4.2bpp.rle"
YellowBelly4Gfx: INCBIN "gfx/enemies/yellow_belly4.2bpp.rle"
Pesce4Gfx:       INCBIN "gfx/enemies/pesce4.2bpp.rle"
Scowler4Gfx:     INCBIN "gfx/enemies/scowler4.2bpp.rle"
Jamano4Gfx:      INCBIN "gfx/enemies/jamano4.2bpp.rle"
Muddee4Gfx:      INCBIN "gfx/enemies/muddee4.2bpp.rle"
Wolfenboss4Gfx:  INCBIN "gfx/enemies/wolfenboss4.2bpp.rle"
Shoot4Gfx:       INCBIN "gfx/enemies/shoot4.2bpp.rle"


SECTION "Wario OAM 1", ROMX

INCLUDE "gfx/oam/wario1.asm"


SECTION "Wario OAM 2", ROMX

INCLUDE "gfx/oam/wario2.asm"


SECTION "Wario OAM 3", ROMX

INCLUDE "gfx/oam/wario3.asm"


SECTION "Object Framesets", ROMX

INCLUDE "gfx/oam/object_framesets.asm"


SECTION "Objects OAM 1", ROMX

INCLUDE "gfx/oam/objects1.asm"


SECTION "Objects OAM 2", ROMX

INCLUDE "gfx/oam/objects2.asm"


SECTION "Objects OAM 3", ROMX

INCLUDE "gfx/oam/objects3.asm"


SECTION "Objects OAM 4", ROMX

INCLUDE "gfx/oam/objects4.asm"


SECTION "Objects OAM 5", ROMX

INCLUDE "gfx/oam/objects5.asm"


SECTION "Objects OAM 6", ROMX

INCLUDE "gfx/oam/objects6.asm"


SECTION "Level Palettes", ROMX

INCLUDE "data/levels/palettes.asm"


SECTION "Animated Tile Gfx", ROMX

AnimatedTilesGfx:
AnimatedTiles1Gfx:  INCBIN "gfx/levels/animated/animated_tiles1.2bpp"  ; ANIMATED_TILES_GFX_00
AnimatedTiles2Gfx:  INCBIN "gfx/levels/animated/animated_tiles2.2bpp"  ; ANIMATED_TILES_GFX_01
AnimatedTiles3Gfx:  INCBIN "gfx/levels/animated/animated_tiles3.2bpp"  ; ANIMATED_TILES_GFX_02
AnimatedTiles4Gfx:  INCBIN "gfx/levels/animated/animated_tiles4.2bpp"  ; ANIMATED_TILES_GFX_03
AnimatedTiles5Gfx:  INCBIN "gfx/levels/animated/animated_tiles5.2bpp"  ; ANIMATED_TILES_GFX_04
AnimatedTiles6Gfx:  INCBIN "gfx/levels/animated/animated_tiles6.2bpp"  ; ANIMATED_TILES_GFX_05
AnimatedTiles7Gfx:  INCBIN "gfx/levels/animated/animated_tiles7.2bpp"  ; ANIMATED_TILES_GFX_06
AnimatedTiles8Gfx:  INCBIN "gfx/levels/animated/animated_tiles8.2bpp"  ; ANIMATED_TILES_GFX_07
AnimatedTiles9Gfx:  INCBIN "gfx/levels/animated/animated_tiles9.2bpp"  ; ANIMATED_TILES_GFX_08
AnimatedTiles10Gfx: INCBIN "gfx/levels/animated/animated_tiles10.2bpp" ; ANIMATED_TILES_GFX_09
AnimatedTiles11Gfx: INCBIN "gfx/levels/animated/animated_tiles11.2bpp" ; ANIMATED_TILES_GFX_10
AnimatedTiles12Gfx: INCBIN "gfx/levels/animated/animated_tiles12.2bpp" ; ANIMATED_TILES_GFX_11
AnimatedTiles13Gfx: INCBIN "gfx/levels/animated/animated_tiles13.2bpp" ; ANIMATED_TILES_GFX_12
AnimatedTiles14Gfx: INCBIN "gfx/levels/animated/animated_tiles14.2bpp" ; ANIMATED_TILES_GFX_13
AnimatedTiles15Gfx: INCBIN "gfx/levels/animated/animated_tiles15.2bpp" ; ANIMATED_TILES_GFX_14
AnimatedTiles16Gfx: INCBIN "gfx/levels/animated/animated_tiles16.2bpp" ; ANIMATED_TILES_GFX_15
AnimatedTiles17Gfx: INCBIN "gfx/levels/animated/animated_tiles17.2bpp" ; ANIMATED_TILES_GFX_16
AnimatedTiles18Gfx: INCBIN "gfx/levels/animated/animated_tiles18.2bpp" ; ANIMATED_TILES_GFX_17
AnimatedTiles19Gfx: INCBIN "gfx/levels/animated/animated_tiles19.2bpp" ; ANIMATED_TILES_GFX_18
AnimatedTiles20Gfx: INCBIN "gfx/levels/animated/animated_tiles20.2bpp" ; ANIMATED_TILES_GFX_19
AnimatedTiles21Gfx: INCBIN "gfx/levels/animated/animated_tiles21.2bpp" ; ANIMATED_TILES_GFX_20
AnimatedTiles22Gfx: INCBIN "gfx/levels/animated/animated_tiles22.2bpp" ; ANIMATED_TILES_GFX_21
AnimatedTiles23Gfx: INCBIN "gfx/levels/animated/animated_tiles23.2bpp" ; ANIMATED_TILES_GFX_22
AnimatedTiles24Gfx: INCBIN "gfx/levels/animated/animated_tiles24.2bpp" ; ANIMATED_TILES_GFX_23


SECTION "Hidden Figure Gfx", ROMX

HiddenFigure1Gfx: INCBIN "gfx/enemies/hidden_figure1.2bpp"
HiddenFigure2Gfx: INCBIN "gfx/enemies/hidden_figure2.2bpp"

Pals_db000:
	rgb  1,  4,  9
	rgb 31,  0,  0
	rgb  6, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb  0, 30, 31
	rgb  6, 10, 10
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb  0, 31, 18
	rgb  6, 10, 10
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb 28, 20,  6
	rgb  6, 10, 10
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb  0, 11, 21
	rgb 31, 25,  0
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb 15,  0,  0
	rgb 31, 25,  0
	rgb  0,  0,  0

	rgb 31, 19, 23
	rgb 21,  8, 17
	rgb 12,  2,  6
	rgb  0,  0,  0

	rgb 27, 23, 11
	rgb 22, 13,  2
	rgb 13,  6,  1
	rgb  5,  2,  0

Pals_db040:
	rgb 21, 21, 21
	rgb 31, 31, 31
	rgb 31,  0,  0
	rgb  0,  0,  0

	rgb 21, 21, 21
	rgb  4, 24, 12
	rgb  4, 11, 12
	rgb  0,  0,  0

	rgb 21, 21, 21
	rgb 15,  0,  0
	rgb 31, 25,  0
	rgb  0,  0,  0

	rgb 21, 21, 21
	rgb 25, 10,  0
	rgb 31, 25,  0
	rgb  0,  0,  0

	rgb 21, 21, 21
	rgb  0, 21, 31
	rgb 31, 25,  0
	rgb  0,  0,  0

HiddenFigure1Map: INCBIN "data/bgmaps/hidden_figure1.tilemap.rle"
HiddenFigure2Map: INCBIN "data/bgmaps/hidden_figure1.attrmap.rle"
HiddenFigure3Map: INCBIN "data/bgmaps/hidden_figure2.tilemap.rle"
HiddenFigure4Map: INCBIN "data/bgmaps/hidden_figure2.attrmap.rle"

SECTION "Golf Gfx 1", ROMX

GolfGfx:     INCBIN "gfx/golf/golf.2bpp.rle"
GolfFlagGfx: INCBIN "gfx/golf/golf_flag.2bpp.rle"


SECTION "Golf Hole BGMaps", ROMX

GolfBackground1Tilemap: INCBIN "data/bgmaps/golf/background_1.tilemap.rle"
GolfBackground1Attrmap: INCBIN "data/bgmaps/golf/background_1.attrmap.rle"
GolfBackground2Tilemap: INCBIN "data/bgmaps/golf/background_2.tilemap.rle"
GolfBackground2Attrmap: INCBIN "data/bgmaps/golf/background_2.attrmap.rle"

GolfHole01_1Tilemap: INCBIN "data/golf/holes/01_1.tilemap.rle"
GolfHole01_1Attrmap: INCBIN "data/golf/holes/01_1.attrmap.rle"
GolfHole01_2Tilemap: INCBIN "data/golf/holes/01_2.tilemap.rle"
GolfHole01_2Attrmap: INCBIN "data/golf/holes/01_2.attrmap.rle"

GolfHole00_1Tilemap: INCBIN "data/golf/holes/00_1.tilemap.rle"
GolfHole00_1Attrmap: INCBIN "data/golf/holes/00_1.attrmap.rle"
GolfHole00_2Tilemap: INCBIN "data/golf/holes/00_2.tilemap.rle"
GolfHole00_2Attrmap: INCBIN "data/golf/holes/00_2.attrmap.rle"

GolfHole10_1Tilemap: INCBIN "data/golf/holes/10_1.tilemap.rle"
GolfHole10_1Attrmap: INCBIN "data/golf/holes/10_1.attrmap.rle"
GolfHole10_2Tilemap: INCBIN "data/golf/holes/10_2.tilemap.rle"
GolfHole10_2Attrmap: INCBIN "data/golf/holes/10_2.attrmap.rle"

GolfHole06_1Tilemap: INCBIN "data/golf/holes/06_1.tilemap.rle"
GolfHole06_1Attrmap: INCBIN "data/golf/holes/06_1.attrmap.rle"
GolfHole06_2Tilemap: INCBIN "data/golf/holes/06_2.tilemap.rle"
GolfHole06_2Attrmap: INCBIN "data/golf/holes/06_2.attrmap.rle"

GolfHole05_1Tilemap: INCBIN "data/golf/holes/05_1.tilemap.rle"
GolfHole05_1Attrmap: INCBIN "data/golf/holes/05_1.attrmap.rle"
GolfHole05_2Tilemap: INCBIN "data/golf/holes/05_2.tilemap.rle"
GolfHole05_2Attrmap: INCBIN "data/golf/holes/05_2.attrmap.rle"

GolfHole07_1Tilemap: INCBIN "data/golf/holes/07_1.tilemap.rle"
GolfHole07_1Attrmap: INCBIN "data/golf/holes/07_1.attrmap.rle"
GolfHole07_2Tilemap: INCBIN "data/golf/holes/07_2.tilemap.rle"
GolfHole07_2Attrmap: INCBIN "data/golf/holes/07_2.attrmap.rle"

GolfHole08_1Tilemap: INCBIN "data/golf/holes/08_1.tilemap.rle"
GolfHole08_1Attrmap: INCBIN "data/golf/holes/08_1.attrmap.rle"
GolfHole08_2Tilemap: INCBIN "data/golf/holes/08_2.tilemap.rle"
GolfHole08_2Attrmap: INCBIN "data/golf/holes/08_2.attrmap.rle"

GolfHole13_1Tilemap: INCBIN "data/golf/holes/13_1.tilemap.rle"
GolfHole13_1Attrmap: INCBIN "data/golf/holes/13_1.attrmap.rle"
GolfHole13_2Tilemap: INCBIN "data/golf/holes/13_2.tilemap.rle"
GolfHole13_2Attrmap: INCBIN "data/golf/holes/13_2.attrmap.rle"

GolfHole02_1Tilemap: INCBIN "data/golf/holes/02_1.tilemap.rle"
GolfHole02_1Attrmap: INCBIN "data/golf/holes/02_1.attrmap.rle"
GolfHole02_2Tilemap: INCBIN "data/golf/holes/02_2.tilemap.rle"
GolfHole02_2Attrmap: INCBIN "data/golf/holes/02_2.attrmap.rle"

GolfHole18_1Tilemap: INCBIN "data/golf/holes/18_1.tilemap.rle"
GolfHole18_1Attrmap: INCBIN "data/golf/holes/18_1.attrmap.rle"
GolfHole18_2Tilemap: INCBIN "data/golf/holes/18_2.tilemap.rle"
GolfHole18_2Attrmap: INCBIN "data/golf/holes/18_2.attrmap.rle"

GolfHole16_1Tilemap: INCBIN "data/golf/holes/16_1.tilemap.rle"
GolfHole16_1Attrmap: INCBIN "data/golf/holes/16_1.attrmap.rle"
GolfHole16_2Tilemap: INCBIN "data/golf/holes/16_2.tilemap.rle"
GolfHole16_2Attrmap: INCBIN "data/golf/holes/16_2.attrmap.rle"

GolfHole11_1Tilemap: INCBIN "data/golf/holes/11_1.tilemap.rle"
GolfHole11_1Attrmap: INCBIN "data/golf/holes/11_1.attrmap.rle"
GolfHole11_2Tilemap: INCBIN "data/golf/holes/11_2.tilemap.rle"
GolfHole11_2Attrmap: INCBIN "data/golf/holes/11_2.attrmap.rle"

GolfHole03_1Tilemap: INCBIN "data/golf/holes/03_1.tilemap.rle"
GolfHole03_1Attrmap: INCBIN "data/golf/holes/03_1.attrmap.rle"
GolfHole03_2Tilemap: INCBIN "data/golf/holes/03_2.tilemap.rle"
GolfHole03_2Attrmap: INCBIN "data/golf/holes/03_2.attrmap.rle"

GolfHole09_1Tilemap: INCBIN "data/golf/holes/09_1.tilemap.rle"
GolfHole09_1Attrmap: INCBIN "data/golf/holes/09_1.attrmap.rle"
GolfHole09_2Tilemap: INCBIN "data/golf/holes/09_2.tilemap.rle"
GolfHole09_2Attrmap: INCBIN "data/golf/holes/09_2.attrmap.rle"

GolfHole04_1Tilemap: INCBIN "data/golf/holes/04_1.tilemap.rle"
GolfHole04_1Attrmap: INCBIN "data/golf/holes/04_1.attrmap.rle"
GolfHole04_2Tilemap: INCBIN "data/golf/holes/04_2.tilemap.rle"
GolfHole04_2Attrmap: INCBIN "data/golf/holes/04_2.attrmap.rle"

GolfHole12_1Tilemap: INCBIN "data/golf/holes/12_1.tilemap.rle"
GolfHole12_1Attrmap: INCBIN "data/golf/holes/12_1.attrmap.rle"
GolfHole12_2Tilemap: INCBIN "data/golf/holes/12_2.tilemap.rle"
GolfHole12_2Attrmap: INCBIN "data/golf/holes/12_2.attrmap.rle"

GolfHole17_1Tilemap: INCBIN "data/golf/holes/17_1.tilemap.rle"
GolfHole17_1Attrmap: INCBIN "data/golf/holes/17_1.attrmap.rle"
GolfHole17_2Tilemap: INCBIN "data/golf/holes/17_2.tilemap.rle"
GolfHole17_2Attrmap: INCBIN "data/golf/holes/17_2.attrmap.rle"

GolfHole14_1Tilemap: INCBIN "data/golf/holes/14_1.tilemap.rle"
GolfHole14_1Attrmap: INCBIN "data/golf/holes/14_1.attrmap.rle"
GolfHole14_2Tilemap: INCBIN "data/golf/holes/14_2.tilemap.rle"
GolfHole14_2Attrmap: INCBIN "data/golf/holes/14_2.attrmap.rle"

GolfHole15_1Tilemap: INCBIN "data/golf/holes/15_1.tilemap.rle"
GolfHole15_1Attrmap: INCBIN "data/golf/holes/15_1.attrmap.rle"
GolfHole15_2Tilemap: INCBIN "data/golf/holes/15_2.tilemap.rle"
GolfHole15_2Attrmap: INCBIN "data/golf/holes/15_2.attrmap.rle"

GolfHole19_1Tilemap: INCBIN "data/golf/holes/19_1.tilemap.rle"
GolfHole19_1Attrmap: INCBIN "data/golf/holes/19_1.attrmap.rle"
GolfHole19_2Tilemap: INCBIN "data/golf/holes/19_2.tilemap.rle"
GolfHole19_2Attrmap: INCBIN "data/golf/holes/19_2.attrmap.rle"


SECTION "Golf Holes", ROMX

INCLUDE "data/golf/holes.asm"


SECTION "Golf Gfx 2", ROMX

WarioGolfMissGfx: INCBIN "gfx/wario/golf_miss.2bpp"

GolfBuildingCourseScrollingAttrmap: INCBIN "data/bgmaps/golf/building_course_scrolling.attrmap"

GolfBuildingCourse1Tilemap: INCBIN "data/bgmaps/golf/building_course_1.tilemap"
GolfBuildingCourse2Tilemap: INCBIN "data/bgmaps/golf/building_course_2.tilemap"
GolfBuildingCourse3Tilemap: INCBIN "data/bgmaps/golf/building_course_3.tilemap"
GolfBuildingCourse4Tilemap: INCBIN "data/bgmaps/golf/building_course_4.tilemap"

GolfBuildingCoursesLockedTilemap:   INCBIN "data/bgmaps/golf/building_courses_locked.tilemap.rle"
GolfBuildingCoursesUnlockedTilemap: INCBIN "data/bgmaps/golf/building_courses_unlocked.tilemap.rle"
GolfBuildingCoursesAttrmap:         INCBIN "data/bgmaps/golf/building_courses.attrmap.rle"

GolfLobbyGfx: INCBIN "gfx/golf/golf_lobby.2bpp.rle"

GolfLobbyTilemap: INCBIN "data/bgmaps/golf/lobby.tilemap.rle"
GolfLobbyAttrmap: INCBIN "data/bgmaps/golf/lobby.attrmap.rle"

GolfClearTilemap: INCBIN "data/bgmaps/golf/clear.tilemap.rle"
GolfClearAttrmap: INCBIN "data/bgmaps/golf/clear.attrmap.rle"


SECTION "Bank 72", ROMX

INCLUDE "engine/golf/lobby.asm"
INCLUDE "engine/golf/building.asm"
INCLUDE "engine/golf/hole.asm"
INCLUDE "gfx/pals/golf.asm"

GolfFlagNumbersGfx:   INCBIN "gfx/golf/golf_flag_numbers.2bpp"
GolfParNumbersGfx:    INCBIN "gfx/golf/golf_par_numbers.2bpp"
GolfStrokeNumbersGfx: INCBIN "gfx/golf/golf_stroke_numbers.2bpp"
GolfHoleFlagGfx:      INCBIN "gfx/golf/golf_hole_flag.2bpp"
UnusedGolfFlagGfx:    INCBIN "gfx/golf/unused_golf_flag.2bpp" ; unreferenced

INCLUDE "gfx/golf/oam.asm"

SECTION "Bank 20", ROMX

INCLUDE "data/overworld/unlockable_connections.asm"
INCLUDE "engine/bank20.asm"


SECTION "Bank 21", ROMX

INCLUDE "data/overworld/palettes.asm"
INCLUDE "engine/bank21.asm"


SECTION "Bank 22", ROMX

Overworld1Gfx:       INCBIN "gfx/overworld/overworld1.2bpp.rle"
Overworld2Gfx:       INCBIN "gfx/overworld/overworld2.2bpp.rle"
Overworld3Gfx:       INCBIN "gfx/overworld/overworld3.2bpp.rle"
Overworld4Gfx:       INCBIN "gfx/overworld/overworld4.2bpp.rle"
OverworldRocksGfx:   INCBIN "gfx/overworld/rocks.2bpp.rle"
OverworldCommonGfx:  INCBIN "gfx/overworld/common.2bpp.rle"
OverworldArrowsGfx:  INCBIN "gfx/overworld/arrows.2bpp.rle"
OverworldGlowGfx:    INCBIN "gfx/overworld/glow.2bpp.rle"
OverworldNumbersGfx: INCBIN "gfx/overworld/numbers.2bpp.rle"

DebugUnknownTextGfx: INCBIN "gfx/debug_unknown_text.2bpp"

	ds $2, $0


SECTION "Bank 23", ROMX

Overworld5Gfx:          INCBIN "gfx/overworld/overworld5.2bpp.rle"
OverworldThunderGfx:    INCBIN "gfx/overworld/thunder.2bpp.rle"
OverworldTowerGfx:      INCBIN "gfx/overworld/tower.2bpp.rle"
OverworldFanGfx:        INCBIN "gfx/overworld/fan.2bpp.rle"
OverworldExplosion1Gfx: INCBIN "gfx/overworld/explosion1.2bpp.rle"
Overworld6Gfx:          INCBIN "gfx/overworld/overworld6.2bpp.rle"
OverworldExplosion2Gfx: INCBIN "gfx/overworld/explosion2.2bpp.rle"
OverworldFireGfx:       INCBIN "gfx/overworld/fire.2bpp.rle"
OverworldTorchGfx:      INCBIN "gfx/overworld/torch.2bpp.rle"
OverworldExplosion3Gfx: INCBIN "gfx/overworld/explosion3.2bpp.rle"
OverworldSmokeGfx:      INCBIN "gfx/overworld/smoke.2bpp.rle"


SECTION "Bank 24", ROMX

LevelNamesJPGfx::
LevelNamesNorthJPGfx: INCBIN "gfx/gui/level_names_north_jp.2bpp"
LevelNamesWestJPGfx:  INCBIN "gfx/gui/level_names_west_jp.2bpp"
LevelNamesSouthJPGfx: INCBIN "gfx/gui/level_names_south_jp.2bpp"
LevelNamesEastJPGfx:  INCBIN "gfx/gui/level_names_east_jp.2bpp"


SECTION "Bank 25", ROMX

LevelNamesENGfx:
LevelNamesNorthENGfx: INCBIN "gfx/gui/level_names_north_en.2bpp"
LevelNamesWestENGfx:  INCBIN "gfx/gui/level_names_west_en.2bpp"
LevelNamesSouthENGfx: INCBIN "gfx/gui/level_names_south_en.2bpp"
LevelNamesEastENGfx:  INCBIN "gfx/gui/level_names_east_en.2bpp"


SECTION "Bank 26", ROMX

INCLUDE "engine/bank26.asm"


SECTION "Bank 27", ROMX

INCLUDE "engine/bank27.asm"


SECTION "Cutscenes Gfx 1", ROMX

Cutscenes1Gfx: INCBIN "gfx/cutscenes/cutscenes1.2bpp.rle"
Cutscenes2Gfx: INCBIN "gfx/cutscenes/cutscenes2.2bpp.rle"
Cutscenes3Gfx: INCBIN "gfx/cutscenes/cutscenes3.2bpp.rle"
Cutscenes4Gfx: INCBIN "gfx/cutscenes/cutscenes4.2bpp.rle"
Cutscenes5Gfx: INCBIN "gfx/cutscenes/cutscenes5.2bpp.rle"

	ds $932, $00


SECTION "Cutscenes Gfx 2", ROMX

Cutscenes6Gfx:  INCBIN "gfx/cutscenes/cutscenes6.2bpp.rle"
Cutscenes7Gfx:  INCBIN "gfx/cutscenes/cutscenes7.2bpp.rle"
Cutscenes8Gfx:  INCBIN "gfx/cutscenes/cutscenes8.2bpp.rle"
Cutscenes9Gfx:  INCBIN "gfx/cutscenes/cutscenes9.2bpp.rle"
Cutscenes10Gfx: INCBIN "gfx/cutscenes/cutscenes10.2bpp.rle"


SECTION "Overworld OAM 1", ROMX

INCLUDE "data/overworld/oam_1.asm"


SECTION "Bank 2B", ROMX

INCLUDE "engine/bank2b.asm"


SECTION "Bank 2C", ROMX

MusicBoxGfx: INCBIN "gfx/music_box.2bpp"

TempleTilemap: INCBIN "data/bgmaps/temple.tilemap"
TempleAttrmap: INCBIN "data/bgmaps/temple.attrmap"
TempleGfx:     INCBIN "gfx/temple.2bpp"

PrologueBackgroundGfx:: INCBIN "gfx/cutscenes/prologue_background.2bpp"
PrologueGfx:            INCBIN "gfx/cutscenes/prologue.2bpp.rle"

TempleMusicBoxSceneGfx: INCBIN "gfx/temple_music_box_scene.2bpp.rle"

TextJP_HiddenFigureHeadFor:
INCBIN "text/jp/hidden_figure_head_for.tilemap.rle"

; unreferenced
Text_b2107:
	db "@グ@グ@グ@グ@グ@グ@グ@グ"
	db "ギグ:"

TextEN_HiddenFigureHeadFor:
INCBIN "text/en/hidden_figure_head_for.tilemap.rle"

; unreferenced
Text_b231c:
	db "@グ@グ@グ@グ@グ@グ@グ@グ"
	db "ギグ:"

TextJP_HiddenFigureReplenishPower:
INCBIN "text/jp/hidden_figure_replenish_power.tilemap.rle"

; unreferenced
Text_b2411:
	db "@グ@グ@グ@グ@グ@グ@グ@グ"
	db "ギグ:"

TextEN_HiddenFigureReplenishPower:
INCBIN "text/en/hidden_figure_replenish_power.tilemap.rle"

; unreferenced
Text_b2533:
	db "@グ@グ@グ@グ@グ@グ@グ@グ"
	db "ギグ:"

GolfBuildingTilemap: INCBIN "data/bgmaps/golf/building.tilemap.rle"
GolfBuildingAttrmap: INCBIN "data/bgmaps/golf/building.attrmap.rle"

BestTimeListGfx:     INCBIN "gfx/best_time_list.2bpp.rle"
BestTimeListTilemap: INCBIN "data/bgmaps/best_time_list.tilemap.rle"
BestTimeListAttrmap: INCBIN "data/bgmaps/best_time_list.attrmap.rle"

PrologueTilemap: INCBIN "data/bgmaps/prologue.tilemap.rle"
PrologueAttrmap: INCBIN "data/bgmaps/prologue.attrmap.rle"

TextJP_HiddenFigureAreYouAware:
INCBIN "text/jp/hidden_figure_are_you_aware.tilemap.rle"

; unreferenced
Text_b37e6:
	db "@グ@グ@グ@グ@グ@グ@グ@グ"
	db "ギグ:"

TextEN_HiddenFigureAreYouAware:
INCBIN "text/en/hidden_figure_are_you_aware.tilemap.rle"

; unreferenced
Text_b39f0:
	db "@グ@グ@グ@グ@グ@グ@グ@グ"
	db "ギグ:"

MusicBoxTilemap: INCBIN "data/bgmaps/music_box.tilemap.rle"
MusicBoxAttrmap: INCBIN "data/bgmaps/music_box.attrmap.rle"

HiddenFigureCutsceneTilemap: INCBIN "data/bgmaps/hidden_figure_cutscene.tilemap.rle"
HiddenFigureCutsceneAttrmap: INCBIN "data/bgmaps/hidden_figure_cutscene.attrmap.rle"


SECTION "Bank 2D", ROMX

INCLUDE "engine/bank2d.asm"


SECTION "Cutscene Palettes", ROMX

INCLUDE "data/overworld/cutscene/palettes.asm"


SECTION "Cutscene BG Maps", ROMX

Cutscene01Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_01.tilemap.rle"
Cutscene01Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_01.attrmap.rle"

Cutscene02Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_02.tilemap.rle"
Cutscene02Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_02.attrmap.rle"

Cutscene03Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_03.tilemap.rle"
Cutscene03Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_03.attrmap.rle"

Cutscene04Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_04.tilemap.rle"
Cutscene04Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_04.attrmap.rle"

Cutscene05Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_05.tilemap.rle"
Cutscene05Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_05.attrmap.rle"

Cutscene06Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_06.tilemap.rle"
Cutscene06Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_06.attrmap.rle"

Cutscene07Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_07.tilemap.rle"
Cutscene07Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_07.attrmap.rle"

Cutscene08Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_08.tilemap.rle"
Cutscene08Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_08.attrmap.rle"

Cutscene09Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_09.tilemap.rle"
Cutscene09Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_09.attrmap.rle"

Cutscene10Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_10.tilemap.rle"
Cutscene10Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_10.attrmap.rle"

Cutscene11Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_11.tilemap.rle"
Cutscene11Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_11.attrmap.rle"

Cutscene12Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_12.tilemap.rle"
Cutscene12Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_12.attrmap.rle"

Cutscene13Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_13.tilemap.rle"
Cutscene13Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_13.attrmap.rle"

Cutscene14Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_14.tilemap.rle"
Cutscene14Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_14.attrmap.rle"

Cutscene15Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_15.tilemap.rle"
Cutscene15Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_15.attrmap.rle"

Cutscene16Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_16.tilemap.rle"
Cutscene16Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_16.attrmap.rle"

Cutscene17Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_17.tilemap.rle"
Cutscene17Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_17.attrmap.rle"

Cutscene18Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_18.tilemap.rle"
Cutscene18Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_18.attrmap.rle"

Cutscene19Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_19.tilemap.rle"
Cutscene19Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_19.attrmap.rle"

Cutscene20Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_20.tilemap.rle"
Cutscene20Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_20.attrmap.rle"

Cutscene21Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_21.tilemap.rle"
Cutscene21Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_21.attrmap.rle"

Cutscene22Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_22.tilemap.rle"
Cutscene22Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_22.attrmap.rle"

Cutscene23Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_23.tilemap.rle"
Cutscene23Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_23.attrmap.rle"

Cutscene24Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_24.tilemap.rle"
Cutscene24Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_24.attrmap.rle"

Cutscene25Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_25.tilemap.rle"
Cutscene25Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_25.attrmap.rle"

Cutscene26Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_26.tilemap.rle"
Cutscene26Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_26.attrmap.rle"

Cutscene27Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_27.tilemap.rle"
Cutscene27Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_27.attrmap.rle"

Cutscene28Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_28.tilemap.rle"
Cutscene28Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_28.attrmap.rle"

Cutscene29Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_29.tilemap.rle"
Cutscene29Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_29.attrmap.rle"

Cutscene30Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_30.tilemap.rle"
Cutscene30Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_30.attrmap.rle"

Cutscene31Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_31.tilemap.rle"
Cutscene31Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_31.attrmap.rle"

Cutscene32Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_32.tilemap.rle"
Cutscene32Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_32.attrmap.rle"

Cutscene33Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_33.tilemap.rle"
Cutscene33Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_33.attrmap.rle"

Cutscene34Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_34.tilemap.rle"
Cutscene34Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_34.attrmap.rle"

Cutscene35Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_35.tilemap.rle"
Cutscene35Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_35.attrmap.rle"

Cutscene36Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_36.tilemap.rle"
Cutscene36Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_36.attrmap.rle"

Cutscene37Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_37.tilemap.rle"
Cutscene37Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_37.attrmap.rle"

Cutscene38Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_38.tilemap.rle"
Cutscene38Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_38.attrmap.rle"

Cutscene39Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_39.tilemap.rle"
Cutscene39Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_39.attrmap.rle"

Cutscene40Tilemap: INCBIN "data/bgmaps/cutscenes/cutscene_40.tilemap.rle"
Cutscene40Attrmap: INCBIN "data/bgmaps/cutscenes/cutscene_40.attrmap.rle"


SECTION "Overworld OAM 2", ROMX

INCLUDE "data/overworld/oam_2.asm"


SECTION "Bank 56", ROMX

INCLUDE "engine/bank56.asm"


SECTION "Bank 57", ROMX

OldMan2Gfx:      INCBIN "gfx/cutscenes/old_man2.2bpp"
EpilogueStarGfx: INCBIN "gfx/epilogue_star.2bpp"
OldMan1Gfx:      INCBIN "gfx/cutscenes/old_man1.2bpp"

EpilogueCrowdTilemap:          INCBIN "data/bgmaps/epilogue_crowd.tilemap"
EpilogueCrowdAttrmap:          INCBIN "data/bgmaps/epilogue_crowd.attrmap"
EpilogueGfx:                   INCBIN "gfx/epilogue.2bpp.rle"
EpilogueTransformationTilemap: INCBIN "data/bgmaps/epilogue_transformation.tilemap.rle"
EpilogueTransformationAttrmap: INCBIN "data/bgmaps/epilogue_transformation.attrmap.rle"

TextJP_OldManThankYou: INCBIN "text/jp/old_man_thank_you.tilemap.rle"

; unreferenced
Text_15e212:
	db "@グ@グ@グ@グ@グ@グ@グ@グ"
	db "ギグ:"

TextEN_OldManThankYou: INCBIN "text/en/old_man_thank_you.tilemap.rle"

; unreferenced
Text_15e437:
	db "@グ@グ@グ@グ@グ@グ@グ@グ"
	db "ギグ:"


SECTION "Credits OAM", ROMX

INCLUDE "data/credits/oam.asm"


SECTION "Bank 76", ROMX

INCLUDE "engine/bank76.asm"
