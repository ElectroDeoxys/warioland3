level: MACRO
LEVEL_\1 EQU (const_value / 8) + 1
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
LEVEL_THE_TEMPLE EQU const_value   ; $00

	; north
	level OUT_OF_THE_WOODS         ; $00
	level THE_PEACEFUL_VILLAGE     ; $08
	level THE_VAST_PLAIN           ; $10
	level BANK_OF_THE_WILD_RIVER   ; $18
	level THE_TIDAL_COAST          ; $20
	level SEA_TURTLE_ROCKS         ; $28
	; west
	level DESERT_RUINS             ; $30
	level THE_VOLCANOS_BASE        ; $38
	level THE_POOL_OF_RAIN         ; $40
	level A_TOWN_IN_CHAOS          ; $48
	level BENEATH_THE_WAVES        ; $50
	level THE_WEST_CRATER          ; $58
	; south
	level THE_GRASSLANDS           ; $60
	level THE_BIG_BRIDGE           ; $68
	level TOWER_OF_REVIVAL         ; $70
	level THE_STEEP_CANYON         ; $78
	level CAVE_OF_FLAMES           ; $80
	level ABOVE_THE_CLOUDS         ; $88
	; east
	level THE_STAGNANT_SWAMP       ; $90
	level THE_FRIGID_SEA           ; $98
	level CASTLE_OF_ILLUSIONS      ; $a0
	level THE_COLOSSAL_HOLE        ; $a8
	level THE_WARPED_VOID          ; $b0
	level THE_EAST_CRATER          ; $b8
	level FOREST_OF_FEAR           ; $c0

LEVEL_GOLF_BUILDING EQU (const_value / 8) + 1 ; $1a

NUM_LEVELS EQU (const_value / 8)

	const THE_TEMPLE               ; $c8
const_value = $ff
	const GOLF_BUILDING            ; $ff


NUM_LEVEL_TREASURES     EQU 4
NUM_LEVEL_MUSICAL_COINS EQU 8
LEVEL_WIDTH EQU 160
MAX_NUM_COINS EQU $999 ; in hexadecimal

	const_def
	const GREY_KEY_F       ; $0
	const RED_KEY_F        ; $1
	const GREEN_KEY_F      ; $2
	const BLUE_KEY_F       ; $3
	const GREY_TREASURE_F  ; $4
	const RED_TREASURE_F   ; $5
	const GREEN_TREASURE_F ; $6
	const BLUE_TREASURE_F  ; $7

KEYS_MASK EQU (1 << GREY_KEY_F) | (1 << RED_KEY_F) | (1 << GREEN_KEY_F) | (1 << BLUE_KEY_F)
TREASURES_MASK EQU (1 << GREY_TREASURE_F) | (1 << RED_TREASURE_F) | (1 << GREEN_TREASURE_F) | (1 << BLUE_TREASURE_F)

	const_def 1
	const LVLEND_GREY_TREASURE  ; 01
	const LVLEND_RED_TREASURE   ; 02
	const LVLEND_GREEN_TREASURE ; 03
	const LVLEND_BLUE_TREASURE  ; 04
	const LVLEND_NO_TREASURE    ; 05
	const LVLEND_GAME_OVER      ; 06
	const LVLEND_EPILOGUE       ; 07

	const_def
	const ROOM_000 ; 00
	const ROOM_001 ; 01
	const ROOM_002 ; 02
	const ROOM_003 ; 03
	const ROOM_004 ; 04
	const ROOM_005 ; 05
	const ROOM_006 ; 06
	const ROOM_007 ; 07
	const ROOM_008 ; 08
	const ROOM_009 ; 09
	const ROOM_010 ; 0a
	const ROOM_011 ; 0b
	const ROOM_012 ; 0c
	const ROOM_013 ; 0d
	const ROOM_014 ; 0e
	const ROOM_015 ; 0f
	const ROOM_016 ; 10
	const ROOM_017 ; 11
	const ROOM_018 ; 12
	const ROOM_019 ; 13
	const ROOM_020 ; 14
	const ROOM_021 ; 15
	const ROOM_022 ; 16
	const ROOM_023 ; 17
	const ROOM_024 ; 18
	const ROOM_025 ; 19
	const ROOM_026 ; 1a
	const ROOM_027 ; 1b
	const ROOM_028 ; 1c
	const ROOM_029 ; 1d
	const ROOM_030 ; 1e
	const ROOM_031 ; 1f
	const ROOM_032 ; 20
	const ROOM_033 ; 21
	const ROOM_034 ; 22
	const ROOM_035 ; 23
	const ROOM_036 ; 24
	const ROOM_037 ; 25
	const ROOM_038 ; 26
	const ROOM_039 ; 27
	const ROOM_040 ; 28
	const ROOM_041 ; 29
	const ROOM_042 ; 2a
	const ROOM_043 ; 2b
	const ROOM_044 ; 2c
	const ROOM_045 ; 2d
	const ROOM_046 ; 2e
	const ROOM_047 ; 2f
	const ROOM_048 ; 30
	const ROOM_049 ; 31
	const ROOM_050 ; 32
	const ROOM_051 ; 33
	const ROOM_052 ; 34
	const ROOM_053 ; 35
	const ROOM_054 ; 36
	const ROOM_055 ; 37
	const ROOM_056 ; 38
	const ROOM_057 ; 39
	const ROOM_058 ; 3a
	const ROOM_059 ; 3b
	const ROOM_060 ; 3c
	const ROOM_061 ; 3d
	const ROOM_062 ; 3e
	const ROOM_063 ; 3f
	const ROOM_064 ; 40
	const ROOM_065 ; 41
	const ROOM_066 ; 42
	const ROOM_067 ; 43
	const ROOM_068 ; 44
	const ROOM_069 ; 45
	const ROOM_070 ; 46
	const ROOM_071 ; 47
	const ROOM_072 ; 48
	const ROOM_073 ; 49
	const ROOM_074 ; 4a
	const ROOM_075 ; 4b
	const ROOM_076 ; 4c
	const ROOM_077 ; 4d
	const ROOM_078 ; 4e
	const ROOM_079 ; 4f
	const ROOM_080 ; 50
	const ROOM_081 ; 51
	const ROOM_082 ; 52
	const ROOM_083 ; 53
	const ROOM_084 ; 54
	const ROOM_085 ; 55
	const ROOM_086 ; 56
	const ROOM_087 ; 57
	const ROOM_088 ; 58
	const ROOM_089 ; 59
	const ROOM_090 ; 5a
	const ROOM_091 ; 5b
	const ROOM_092 ; 5c
	const ROOM_093 ; 5d
	const ROOM_094 ; 5e
	const ROOM_095 ; 5f
	const ROOM_096 ; 60
	const ROOM_097 ; 61
	const ROOM_098 ; 62
	const ROOM_099 ; 63
	const ROOM_100 ; 64
	const ROOM_101 ; 65
	const ROOM_102 ; 66
	const ROOM_103 ; 67
	const ROOM_104 ; 68
	const ROOM_105 ; 69
	const ROOM_106 ; 6a
	const ROOM_107 ; 6b
	const ROOM_108 ; 6c
	const ROOM_109 ; 6d
	const ROOM_110 ; 6e
	const ROOM_111 ; 6f
	const ROOM_112 ; 70
	const ROOM_113 ; 71
	const ROOM_114 ; 72
	const ROOM_115 ; 73
	const ROOM_116 ; 74
	const ROOM_117 ; 75
	const ROOM_118 ; 76
	const ROOM_119 ; 77
	const ROOM_120 ; 78
	const ROOM_121 ; 79
	const ROOM_122 ; 7a
	const ROOM_123 ; 7b
	const ROOM_124 ; 7c
	const ROOM_125 ; 7d
	const ROOM_126 ; 7e
	const ROOM_127 ; 7f
	const ROOM_128 ; 80
	const ROOM_129 ; 81
	const ROOM_130 ; 82
	const ROOM_131 ; 83
	const ROOM_132 ; 84
	const ROOM_133 ; 85
	const ROOM_134 ; 86
	const ROOM_135 ; 87
	const ROOM_136 ; 88
	const ROOM_137 ; 89
	const ROOM_138 ; 8a
	const ROOM_139 ; 8b
	const ROOM_140 ; 8c
	const ROOM_141 ; 8d
	const ROOM_142 ; 8e
	const ROOM_143 ; 8f
	const ROOM_144 ; 90
	const ROOM_145 ; 91
	const ROOM_146 ; 92
	const ROOM_147 ; 93
	const ROOM_148 ; 94
	const ROOM_149 ; 95
	const ROOM_150 ; 96
	const ROOM_151 ; 97
	const ROOM_152 ; 98
	const ROOM_153 ; 99
	const ROOM_154 ; 9a

	const_def
	const TILE_MAP_00 ; 00
	const TILE_MAP_01 ; 01
	const TILE_MAP_02 ; 02
	const TILE_MAP_03 ; 03
	const TILE_MAP_04 ; 04
	const TILE_MAP_05 ; 05
	const TILE_MAP_06 ; 06
	const TILE_MAP_07 ; 07
	const TILE_MAP_08 ; 08
	const TILE_MAP_09 ; 09
	const TILE_MAP_10 ; 0a
	const TILE_MAP_11 ; 0b
	const TILE_MAP_12 ; 0c
	const TILE_MAP_13 ; 0d
	const TILE_MAP_14 ; 0e
	const TILE_MAP_15 ; 0f
	const TILE_MAP_16 ; 10
	const TILE_MAP_17 ; 11
	const TILE_MAP_18 ; 12
	const TILE_MAP_19 ; 13
	const TILE_MAP_20 ; 14
	const TILE_MAP_21 ; 15
	const TILE_MAP_22 ; 16
	const TILE_MAP_23 ; 17
	const TILE_MAP_24 ; 18
	const TILE_MAP_25 ; 19
	const TILE_MAP_26 ; 1a
	const TILE_MAP_27 ; 1b
	const TILE_MAP_28 ; 1c
	const TILE_MAP_29 ; 1d
	const TILE_MAP_30 ; 1e
	const TILE_MAP_31 ; 1f
	const TILE_MAP_32 ; 20
	const TILE_MAP_33 ; 21
	const TILE_MAP_34 ; 22
	const TILE_MAP_35 ; 23
	const TILE_MAP_36 ; 24
	const TILE_MAP_37 ; 25
	const TILE_MAP_38 ; 26
	const TILE_MAP_39 ; 27
	const TILE_MAP_40 ; 28
	const TILE_MAP_41 ; 29
	const TILE_MAP_42 ; 2a
	const TILE_MAP_43 ; 2b
	const TILE_MAP_44 ; 2c
	const TILE_MAP_45 ; 2d
	const TILE_MAP_46 ; 2e
	const TILE_MAP_47 ; 2f
	const TILE_MAP_48 ; 30
	const TILE_MAP_49 ; 31
	const TILE_MAP_50 ; 32
	const TILE_MAP_51 ; 33
	const TILE_MAP_52 ; 34
	const TILE_MAP_53 ; 35
	const TILE_MAP_54 ; 36
	const TILE_MAP_55 ; 37
	const TILE_MAP_56 ; 38
	const TILE_MAP_57 ; 39
	const TILE_MAP_58 ; 3a
	const TILE_MAP_59 ; 3b
	const TILE_MAP_60 ; 3c
	const TILE_MAP_61 ; 3d
	const TILE_MAP_62 ; 3e
	const TILE_MAP_63 ; 3f
NUM_TILE_MAPS_GROUP_1 EQU const_value
	const TILE_MAP_64 ; 40
	const TILE_MAP_65 ; 41
	const TILE_MAP_66 ; 42
	const TILE_MAP_67 ; 43
	const TILE_MAP_68 ; 44
	const TILE_MAP_69 ; 45
	const TILE_MAP_70 ; 46
	const TILE_MAP_71 ; 47
	const TILE_MAP_72 ; 48
	const TILE_MAP_73 ; 49
	const TILE_MAP_74 ; 4a
	const TILE_MAP_75 ; 4b
	const TILE_MAP_76 ; 4c
	const TILE_MAP_77 ; 4d
	const TILE_MAP_78 ; 4e
	const TILE_MAP_79 ; 4f
	const TILE_MAP_80 ; 50
	const TILE_MAP_81 ; 51
	const TILE_MAP_82 ; 52
	const TILE_MAP_83 ; 53
	const TILE_MAP_84 ; 54
	const TILE_MAP_85 ; 55
	const TILE_MAP_86 ; 56
	const TILE_MAP_87 ; 57
	const TILE_MAP_88 ; 58
	const TILE_MAP_89 ; 59
