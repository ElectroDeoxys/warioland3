level: MACRO
LEVEL_\1 EQU const_value / 8
	const \1_DAY_1
	const \1_DAY_2
	const \1_DAY_3
	const \1_DAY_4
	const \1_NIGHT_1
	const \1_NIGHT_2
	const \1_NIGHT_3
	const \1_NIGHT_4
ENDM

	const_def
	; north
	level OUT_OF_THE_WOODS       ; 00
	level THE_PEACEFUL_VILLAGE   ; 08
	level THE_VAST_PLAIN_VILLAGE ; 10
	level BANK_OF_THE_WILD_RIVER ; 18
	level THE_TIDAL_COAST        ; 20
	level SEA_TURTLE_ROCKS       ; 28
	; west
	level DESERT_RUINS           ; 30
	level THE_VOLCANOS_BASE      ; 38
	level THE_POOL_OF_RAIN       ; 40
	level A_TOWN_IN_CHAOS        ; 48
	level BENEATH_THE_WAVES      ; 50
	level THE_WEST_CRATER        ; 58
	; south
	level THE_GRASSLANDS         ; 60
	level THE_BIG_BRIDGE         ; 68
	level TOWER_OF_REVIVAL       ; 70
	level THE_STEEP_CANYON       ; 78
	level CAVE_OF_FLAMES         ; 80
	level ABOVE_THE_CLOUDS       ; 88
	; east
	level THE_STAGNANT_SWAMP     ; 90
	level THE_FRIGID_SEA         ; 98
	level CASTLE_OF_ILLUSIONS    ; a0
	level THE_COLOSSAL_HOLE      ; a8
	level THE_WARPED_VOID        ; b0
	level THE_EAST_CRATER        ; b8
	level FOREST_OF_FEAR         ; c0

	; final boss battle
	const LEVEL_HIDDEN_FIGURE_BATTLE ; c8

NUM_TREASURES_PER_LEVEL EQU 4

	const_def
	const PERMISSION_MAP_00 ; 00
	const PERMISSION_MAP_01 ; 01
	const PERMISSION_MAP_02 ; 02
	const PERMISSION_MAP_03 ; 03
	const PERMISSION_MAP_04 ; 04
	const PERMISSION_MAP_05 ; 05
	const PERMISSION_MAP_06 ; 06
	const PERMISSION_MAP_07 ; 07
	const PERMISSION_MAP_08 ; 08
	const PERMISSION_MAP_09 ; 09
	const PERMISSION_MAP_10 ; 0a
	const PERMISSION_MAP_11 ; 0b
	const PERMISSION_MAP_12 ; 0c
	const PERMISSION_MAP_13 ; 0d
	const PERMISSION_MAP_14 ; 0e
	const PERMISSION_MAP_15 ; 0f
	const PERMISSION_MAP_16 ; 10
	const PERMISSION_MAP_17 ; 11
	const PERMISSION_MAP_18 ; 12
	const PERMISSION_MAP_19 ; 13
	const PERMISSION_MAP_20 ; 14
	const PERMISSION_MAP_21 ; 15
	const PERMISSION_MAP_22 ; 16
	const PERMISSION_MAP_23 ; 17
	const PERMISSION_MAP_24 ; 18
	const PERMISSION_MAP_25 ; 19
	const PERMISSION_MAP_26 ; 1a
	const PERMISSION_MAP_27 ; 1b
	const PERMISSION_MAP_28 ; 1c
	const PERMISSION_MAP_29 ; 1d
	const PERMISSION_MAP_30 ; 1e
	const PERMISSION_MAP_31 ; 1f
	const PERMISSION_MAP_32 ; 20
	const PERMISSION_MAP_33 ; 21
	const PERMISSION_MAP_34 ; 22
	const PERMISSION_MAP_35 ; 23
	const PERMISSION_MAP_36 ; 24
	const PERMISSION_MAP_37 ; 25
	const PERMISSION_MAP_38 ; 26
	const PERMISSION_MAP_39 ; 27
	const PERMISSION_MAP_40 ; 28
	const PERMISSION_MAP_41 ; 29
	const PERMISSION_MAP_42 ; 2a
	const PERMISSION_MAP_43 ; 2b
	const PERMISSION_MAP_44 ; 2c
	const PERMISSION_MAP_45 ; 2d
	const PERMISSION_MAP_46 ; 2e
	const PERMISSION_MAP_47 ; 2f
	const PERMISSION_MAP_48 ; 30
	const PERMISSION_MAP_49 ; 31
	const PERMISSION_MAP_50 ; 32
	const PERMISSION_MAP_51 ; 33
	const PERMISSION_MAP_52 ; 34
	const PERMISSION_MAP_53 ; 35
	const PERMISSION_MAP_54 ; 36
	const PERMISSION_MAP_55 ; 37
	const PERMISSION_MAP_56 ; 38
	const PERMISSION_MAP_57 ; 39
	const PERMISSION_MAP_58 ; 3a
	const PERMISSION_MAP_59 ; 3b
	const PERMISSION_MAP_60 ; 3c
	const PERMISSION_MAP_61 ; 3d
	const PERMISSION_MAP_62 ; 3e
	const PERMISSION_MAP_63 ; 3f
NUM_PERMISSION_MAPS_GROUP_1 EQU const_value

	const PERMISSION_MAP_64 ; 40
	const PERMISSION_MAP_65 ; 41
	const PERMISSION_MAP_66 ; 42
	const PERMISSION_MAP_67 ; 43
	const PERMISSION_MAP_68 ; 44
	const PERMISSION_MAP_69 ; 45
	const PERMISSION_MAP_70 ; 46
	const PERMISSION_MAP_71 ; 47
	const PERMISSION_MAP_72 ; 48
	const PERMISSION_MAP_73 ; 49
	const PERMISSION_MAP_74 ; 4a
	const PERMISSION_MAP_75 ; 4b
	const PERMISSION_MAP_76 ; 4c
	const PERMISSION_MAP_77 ; 4d
	const PERMISSION_MAP_78 ; 4e
	const PERMISSION_MAP_79 ; 4f
	const PERMISSION_MAP_80 ; 50
	const PERMISSION_MAP_81 ; 51
	const PERMISSION_MAP_82 ; 52
	const PERMISSION_MAP_83 ; 53
	const PERMISSION_MAP_84 ; 54
	const PERMISSION_MAP_85 ; 55
	const PERMISSION_MAP_86 ; 56
	const PERMISSION_MAP_87 ; 57
	const PERMISSION_MAP_88 ; 58
	const PERMISSION_MAP_89 ; 59
