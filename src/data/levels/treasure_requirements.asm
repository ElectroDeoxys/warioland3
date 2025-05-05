; the treasure requirements for each variant of a level
; if both treasures are collected, then that variant is unlocked
LevelTreasureRequirements:
	; LEVEL_OUT_OF_THE_WOODS
	db GOLD_MAGIC,                 TREASURE_NONE ; variant 4
	db POUCH,                EYE_OF_THE_STORM ; variant 3
	db LEAD_OVERALLS_T,            TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_PEACEFUL_VILLAGE
	db SUPER_JUMP_SLAM_OVERALLS_T, TREASURE_NONE ; variant 4
	db FLUTE,                      TREASURE_NONE ; variant 3
	db FLUTE,                      TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_VAST_PLAIN
	db BLUE_CHEMICAL,              RED_CHEMICAL ; variant 4
	db MAGIC_SEEDS,                      TREASURE_NONE ; variant 3
	db LEAD_OVERALLS_T,            TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_BANK_OF_THE_WILD_RIVER
	db AIR_PUMP,                   TREASURE_NONE ; variant 4
	db PRINCE_FROGS_GLOVES_T,      TREASURE_NONE ; variant 3
	db GARLIC_T,                   TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_TIDAL_COAST
	db SAPLING_OF_GROWTH,          TREASURE_NONE ; variant 4
	db STATUE,                     TREASURE_NONE ; variant 3
	db GRAB_GLOVE_T,               TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_SEA_TURTLE_ROCKS
	db NIGHT_VISION_SCOPE,         TREASURE_NONE ; variant 4
	db SUPER_JUMP_SLAM_OVERALLS_T, TREASURE_NONE ; variant 3
	db SCEPTER,                    TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_DESERT_RUINS
	db SUPER_JUMP_SLAM_OVERALLS_T, TREASURE_NONE ; variant 4
	db HEAD_SMASH_HELMET_T,        TREASURE_NONE ; variant 3
	db BLUE_TABLET,                GREEN_TABLET ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_VOLCANOS_BASE
	db FOOT_OF_STONE,              TREASURE_NONE ; variant 4
	db FLUTE,                      TREASURE_NONE ; variant 3
	db TRUCK_WHEEL,                TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_POOL_OF_RAIN
	db AIR_PUMP,                   TREASURE_NONE ; variant 4
	db SWIMMING_FLIPPERS_T,        TREASURE_NONE ; variant 3
	db MAGIC_SEEDS,                      TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_A_TOWN_IN_CHAOS
	db ELECTRIC_FAN_PROPELLER,     TREASURE_NONE ; variant 4
	db SUPER_GRAB_GLOVES_T,        TREASURE_NONE ; variant 3
	db HEAD_SMASH_HELMET_T,        TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_BENEATH_THE_WAVES
	db BLUE_CHEMICAL,              RED_CHEMICAL ; variant 4
	db SAPLING_OF_GROWTH,          TREASURE_NONE ; variant 3
	db PRINCE_FROGS_GLOVES_T,      TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_WEST_CRATER
	db RUST_SPRAY,                 TREASURE_NONE ; variant 4
	db FIRE_DRENCHER,              TREASURE_NONE ; variant 3
	db SUPER_JUMP_SLAM_OVERALLS_T, TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_GRASSLANDS
	db HIGH_JUMP_BOOTS_T,          TREASURE_NONE ; variant 4
	db FLUTE,                      TREASURE_NONE ; variant 3
	db MAGIC_SEEDS,                      TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_BIG_BRIDGE
	db SCEPTER,                    TREASURE_NONE ; variant 4
	db GRAB_GLOVE_T,               TREASURE_NONE ; variant 3
	db SWIMMING_FLIPPERS_T,        TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_TOWER_OF_REVIVAL
	db GOLDEN_LEFT_EYE,            GOLDEN_RIGHT_EYE ; variant 4
	db STATUE,                     TREASURE_NONE ; variant 3
	db RIGHT_GLASS_EYE,            LEFT_GLASS_EYE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_STEEP_CANYON
	db RUST_SPRAY,                 TREASURE_NONE ; variant 4
	db PRINCE_FROGS_GLOVES_T,      TREASURE_NONE ; variant 3
	db FOOT_OF_STONE,              TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_CAVE_OF_FLAMES
	db RUST_SPRAY,                 TREASURE_NONE ; variant 4
	db EXPLOSIVE_PLUNGER_BOX,      TREASURE_NONE ; variant 3
	db HIGH_JUMP_BOOTS_T,          TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_ABOVE_THE_CLOUDS
	db FULL_MOON_GONG,             TREASURE_NONE ; variant 4
	db SCISSORS,                   TREASURE_NONE ; variant 3
	db SKY_KEY,                 TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_STAGNANT_SWAMP
	db EXPLOSIVE_PLUNGER_BOX,      TREASURE_NONE ; variant 4
	db HIGH_JUMP_BOOTS_T,          TREASURE_NONE ; variant 3
	db FOOT_OF_STONE,              TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_FRIGID_SEA
	db SUN_MEDALLION_TOP,          SUN_MEDALLION_BOTTOM ; variant 4
	db SCEPTER,                    TREASURE_NONE ; variant 3
	db GRAB_GLOVE_T,               TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_CASTLE_OF_ILLUSIONS
	db CASTLE_BRICK,               TREASURE_NONE ; variant 4
	db SUPER_GRAB_GLOVES_T,        TREASURE_NONE ; variant 3
	db SUN_MEDALLION_TOP,          SUN_MEDALLION_BOTTOM ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_COLOSSAL_HOLE
	db EXPLOSIVE_PLUNGER_BOX,      TREASURE_NONE ; variant 4
	db SUN_MEDALLION_TOP,          SUN_MEDALLION_BOTTOM ; variant 3
	db GARLIC_T,                   TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_WARPED_VOID
	db KEY_CARD_RED,               KEY_CARD_BLUE ; variant 4
	db WARP_REMOVAL_APPARATUS,     TREASURE_NONE ; variant 3
	db WARP_REMOVAL_APPARATUS,     TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_EAST_CRATER
	db PICK_AXE,                   TREASURE_NONE ; variant 4
	db JACKHAMMER,                 TREASURE_NONE ; variant 3
	db FIRE_DRENCHER,              TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_FOREST_OF_FEAR
	db DEMONS_BLOOD,               TREASURE_NONE ; variant 4
	db MYSTERY_HANDLE,             TREASURE_NONE ; variant 3
	db SUPER_GRAB_GLOVES_T,        TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1
