; wEnemies structs constants
rsreset
ENEMY_UNK_00 rb ; $00
ENEMY_UNK_01 rb ; $01
ENEMY_UNK_02 rb ; $02
ENEMY_Y_POS  rw ; $03
ENEMY_X_POS  rw ; $05
ENEMY_UNK_07 rb ; $07
ENEMY_INTERACTION_TYPE rb ; $08
ENEMY_UNK_09 rb ; $09
ENEMY_UNK_0A rb ; $0a
ENEMY_UNK_0B rb ; $0b
ENEMY_UNK_0C rb ; $0c
ENEMY_UNK_0D rb ; $0d
ENEMY_UNK_0E rb ; $0e
ENEMY_UNK_0F rb ; $0f
ENEMY_UNK_10 rw ; $10
ENEMY_UNK_12 rb ; $12
ENEMY_UNK_13 rb ; $13
ENEMY_UNK_14 rb ; $14
ENEMY_UNK_15 rb ; $15
ENEMY_UNK_16 rb ; $16
ENEMY_UNK_17 rb ; $17
ENEMY_UNK_18 rb ; $18
ENEMY_UNK_19 rb ; $19
ENEMY_UNK_1A rb ; $1a
ENEMY_UNK_1B rb ; $1b
ENEMY_UNK_1C rb ; $1c
ENEMY_UNK_1D rb ; $1d
ENEMY_UNK_1E rw ; $1e
ENEMY_STRUCT_LENGTH EQU _RS

; enemies with InteractionType with
; this flag set are considered heavy
HEAVY_ENEMY_TYPE_F EQU 7
HEAVY_ENEMY_TYPE EQU (1 << HEAVY_ENEMY_TYPE_F)

	const_def
	const ENEMY_GROUP_000 ; $00
	const ENEMY_GROUP_001 ; $01
	const ENEMY_GROUP_002 ; $02
	const ENEMY_GROUP_003 ; $03
	const ENEMY_GROUP_004 ; $04
	const ENEMY_GROUP_005 ; $05
	const ENEMY_GROUP_006 ; $06
	const ENEMY_GROUP_007 ; $07
	const ENEMY_GROUP_008 ; $08
	const ENEMY_GROUP_009 ; $09
	const ENEMY_GROUP_010 ; $0a
	const ENEMY_GROUP_011 ; $0b
	const ENEMY_GROUP_012 ; $0c
	const ENEMY_GROUP_013 ; $0d
	const ENEMY_GROUP_014 ; $0e
	const ENEMY_GROUP_015 ; $0f
	const ENEMY_GROUP_016 ; $10
	const ENEMY_GROUP_017 ; $11
	const ENEMY_GROUP_018 ; $12
	const ENEMY_GROUP_019 ; $13
	const ENEMY_GROUP_020 ; $14
	const ENEMY_GROUP_021 ; $15
	const ENEMY_GROUP_022 ; $16
	const ENEMY_GROUP_023 ; $17
	const ENEMY_GROUP_024 ; $18
	const ENEMY_GROUP_025 ; $19
	const ENEMY_GROUP_026 ; $1a
	const ENEMY_GROUP_027 ; $1b
	const ENEMY_GROUP_028 ; $1c
	const ENEMY_GROUP_029 ; $1d
	const ENEMY_GROUP_030 ; $1e
	const ENEMY_GROUP_031 ; $1f
	const ENEMY_GROUP_032 ; $20
	const ENEMY_GROUP_033 ; $21
	const ENEMY_GROUP_034 ; $22
	const ENEMY_GROUP_035 ; $23
	const ENEMY_GROUP_036 ; $24
	const ENEMY_GROUP_037 ; $25
	const ENEMY_GROUP_038 ; $26
	const ENEMY_GROUP_039 ; $27
	const ENEMY_GROUP_040 ; $28
	const ENEMY_GROUP_041 ; $29
	const ENEMY_GROUP_042 ; $2a
	const ENEMY_GROUP_043 ; $2b
	const ENEMY_GROUP_044 ; $2c
	const ENEMY_GROUP_045 ; $2d
	const ENEMY_GROUP_046 ; $2e
	const ENEMY_GROUP_047 ; $2f
	const ENEMY_GROUP_048 ; $30
	const ENEMY_GROUP_049 ; $31
	const ENEMY_GROUP_050 ; $32
	const ENEMY_GROUP_051 ; $33
	const ENEMY_GROUP_052 ; $34
	const ENEMY_GROUP_053 ; $35
	const ENEMY_GROUP_054 ; $36
	const ENEMY_GROUP_055 ; $37
	const ENEMY_GROUP_056 ; $38
	const ENEMY_GROUP_057 ; $39
	const ENEMY_GROUP_058 ; $3a
	const ENEMY_GROUP_059 ; $3b
	const ENEMY_GROUP_060 ; $3c
	const ENEMY_GROUP_061 ; $3d
	const ENEMY_GROUP_062 ; $3e
	const ENEMY_GROUP_063 ; $3f
	const ENEMY_GROUP_064 ; $40
	const ENEMY_GROUP_065 ; $41
	const ENEMY_GROUP_066 ; $42
	const ENEMY_GROUP_067 ; $43
	const ENEMY_GROUP_068 ; $44
	const ENEMY_GROUP_069 ; $45
	const ENEMY_GROUP_070 ; $46
	const ENEMY_GROUP_071 ; $47
	const ENEMY_GROUP_072 ; $48
	const ENEMY_GROUP_073 ; $49
	const ENEMY_GROUP_074 ; $4a
	const ENEMY_GROUP_075 ; $4b
	const ENEMY_GROUP_076 ; $4c
	const ENEMY_GROUP_077 ; $4d
	const ENEMY_GROUP_078 ; $4e
	const ENEMY_GROUP_079 ; $4f
	const ENEMY_GROUP_080 ; $50
	const ENEMY_GROUP_081 ; $51
	const ENEMY_GROUP_082 ; $52
	const ENEMY_GROUP_083 ; $53
	const ENEMY_GROUP_084 ; $54
	const ENEMY_GROUP_085 ; $55
	const ENEMY_GROUP_086 ; $56
	const ENEMY_GROUP_087 ; $57
	const ENEMY_GROUP_088 ; $58
	const ENEMY_GROUP_089 ; $59
	const ENEMY_GROUP_090 ; $5a
	const ENEMY_GROUP_091 ; $5b
	const ENEMY_GROUP_092 ; $5c
	const ENEMY_GROUP_093 ; $5d
	const ENEMY_GROUP_094 ; $5e
	const ENEMY_GROUP_095 ; $5f
	const ENEMY_GROUP_096 ; $60
	const ENEMY_GROUP_097 ; $61
	const ENEMY_GROUP_098 ; $62
	const ENEMY_GROUP_099 ; $63
	const ENEMY_GROUP_100 ; $64
	const ENEMY_GROUP_101 ; $65
	const ENEMY_GROUP_102 ; $66
	const ENEMY_GROUP_103 ; $67
	const ENEMY_GROUP_104 ; $68
	const ENEMY_GROUP_105 ; $69
	const ENEMY_GROUP_106 ; $6a
	const ENEMY_GROUP_107 ; $6b
	const ENEMY_GROUP_108 ; $6c
	const ENEMY_GROUP_109 ; $6d
	const ENEMY_GROUP_110 ; $6e
	const ENEMY_GROUP_111 ; $6f
	const ENEMY_GROUP_112 ; $70
	const ENEMY_GROUP_113 ; $71
	const ENEMY_GROUP_114 ; $72
	const ENEMY_GROUP_115 ; $73
	const ENEMY_GROUP_116 ; $74
	const ENEMY_GROUP_117 ; $75
	const ENEMY_GROUP_118 ; $76
	const ENEMY_GROUP_119 ; $77
	const ENEMY_GROUP_120 ; $78
	const ENEMY_GROUP_121 ; $79
	const ENEMY_GROUP_122 ; $7a
	const ENEMY_GROUP_123 ; $7b
	const ENEMY_GROUP_124 ; $7c
	const ENEMY_GROUP_125 ; $7d
	const ENEMY_GROUP_126 ; $7e
	const ENEMY_GROUP_127 ; $7f
	const ENEMY_GROUP_128 ; $80
	const ENEMY_GROUP_129 ; $81
	const ENEMY_GROUP_130 ; $82
	const ENEMY_GROUP_131 ; $83
	const ENEMY_GROUP_132 ; $84
	const ENEMY_GROUP_133 ; $85
	const ENEMY_GROUP_134 ; $86
	const ENEMY_GROUP_135 ; $87
	const ENEMY_GROUP_136 ; $88
	const ENEMY_GROUP_137 ; $89
	const ENEMY_GROUP_138 ; $8a
	const ENEMY_GROUP_139 ; $8b
	const ENEMY_GROUP_140 ; $8c
	const ENEMY_GROUP_141 ; $8d
	const ENEMY_GROUP_142 ; $8e
	const ENEMY_GROUP_143 ; $8f
	const ENEMY_GROUP_144 ; $90
	const ENEMY_GROUP_145 ; $91

; enemy interaction types
	const_def
	const ENEMY_INTERACTION_00 ; 00
	const ENEMY_INTERACTION_01 ; 01
	const ENEMY_INTERACTION_02 ; 02
	const ENEMY_INTERACTION_03 ; 03
	const ENEMY_INTERACTION_04 ; 04
	const ENEMY_INTERACTION_05 ; 05
	const ENEMY_INTERACTION_06 ; 06
	const ENEMY_INTERACTION_07 ; 07
	const ENEMY_INTERACTION_08 ; 08
	const ENEMY_INTERACTION_09 ; 09
	const ENEMY_INTERACTION_0A ; 0a
	const ENEMY_INTERACTION_0B ; 0b
	const ENEMY_INTERACTION_0C ; 0c
	const ENEMY_INTERACTION_0D ; 0d
	const ENEMY_INTERACTION_0E ; 0e
	const ENEMY_INTERACTION_0F ; 0f
	const ENEMY_INTERACTION_10 ; 10
	const ENEMY_INTERACTION_11 ; 11
	const ENEMY_INTERACTION_12 ; 12
	const ENEMY_INTERACTION_13 ; 13
	const ENEMY_INTERACTION_14 ; 14
	const ENEMY_INTERACTION_15 ; 15
	const ENEMY_INTERACTION_16 ; 16
	const ENEMY_INTERACTION_17 ; 17
	const ENEMY_INTERACTION_18 ; 18
	const ENEMY_INTERACTION_19 ; 19
	const ENEMY_INTERACTION_1A ; 1a
	const ENEMY_INTERACTION_1B ; 1b
	const ENEMY_INTERACTION_1C ; 1c
	const ENEMY_INTERACTION_1D ; 1d
	const ENEMY_INTERACTION_1E ; 1e
	const ENEMY_INTERACTION_1F ; 1f
	const ENEMY_INTERACTION_20 ; 20
	const ENEMY_INTERACTION_21 ; 21
	const ENEMY_INTERACTION_22 ; 22
	const ENEMY_INTERACTION_23 ; 23
	const ENEMY_INTERACTION_24 ; 24
	const ENEMY_INTERACTION_25 ; 25
	const ENEMY_INTERACTION_26 ; 26
	const ENEMY_INTERACTION_27 ; 27
	const ENEMY_INTERACTION_28 ; 28
	const ENEMY_INTERACTION_29 ; 29
	const ENEMY_INTERACTION_2A ; 2a
	const ENEMY_INTERACTION_2B ; 2b
	const ENEMY_INTERACTION_2C ; 2c
	const ENEMY_INTERACTION_2D ; 2d
	const ENEMY_INTERACTION_2E ; 2e
	const ENEMY_INTERACTION_2F ; 2f
	const ENEMY_INTERACTION_30 ; 30
	const ENEMY_INTERACTION_31 ; 31
	const ENEMY_INTERACTION_32 ; 32
	const ENEMY_INTERACTION_33 ; 33
	const ENEMY_INTERACTION_34 ; 34
	const ENEMY_INTERACTION_35 ; 35
	const ENEMY_INTERACTION_36 ; 36
	const ENEMY_INTERACTION_37 ; 37
	const ENEMY_INTERACTION_38 ; 38
	const ENEMY_INTERACTION_39 ; 39
	const ENEMY_INTERACTION_3A ; 3a
	const ENEMY_INTERACTION_3B ; 3b
	const ENEMY_INTERACTION_3C ; 3c
	const ENEMY_INTERACTION_3D ; 3d
	const ENEMY_INTERACTION_3E ; 3e
	const ENEMY_INTERACTION_3F ; 3f
	const ENEMY_INTERACTION_40 ; 40
	const ENEMY_INTERACTION_41 ; 41
	const ENEMY_INTERACTION_42 ; 42
	const ENEMY_INTERACTION_43 ; 43
	const ENEMY_INTERACTION_44 ; 44
	const ENEMY_INTERACTION_45 ; 45
	const ENEMY_INTERACTION_46 ; 46
	const ENEMY_INTERACTION_47 ; 47
	const ENEMY_INTERACTION_48 ; 48
	const ENEMY_INTERACTION_49 ; 49
	const ENEMY_INTERACTION_4A ; 4a
	const ENEMY_INTERACTION_4B ; 4b
	const ENEMY_INTERACTION_4C ; 4c
	const ENEMY_INTERACTION_4D ; 4d
	const ENEMY_INTERACTION_4E ; 4e
	const ENEMY_INTERACTION_4F ; 4f
	const ENEMY_INTERACTION_50 ; 50
	const ENEMY_INTERACTION_51 ; 51
	const ENEMY_INTERACTION_52 ; 52
	const ENEMY_INTERACTION_53 ; 53
	const ENEMY_INTERACTION_54 ; 54
	const ENEMY_INTERACTION_55 ; 55
	const ENEMY_INTERACTION_56 ; 56
	const ENEMY_INTERACTION_57 ; 57
	const ENEMY_INTERACTION_58 ; 58
