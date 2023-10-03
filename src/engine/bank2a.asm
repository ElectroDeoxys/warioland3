OAM_a8000:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23
	dw .frame_24
	dw .frame_25
	dw .frame_26
	dw .frame_27
	dw .frame_28
	dw .frame_29
	dw .frame_30
	dw .frame_31
	dw .frame_32
	dw .frame_33
	dw .frame_34
	dw .frame_35
	dw .frame_36
	dw .frame_37
	dw .frame_38
	dw .frame_39
	dw .frame_40
	dw .frame_41
	dw .frame_42
	dw .frame_43
	dw .frame_44
	dw .frame_45
	dw .frame_46
	dw .frame_47
	dw .frame_48
	dw .frame_49
	dw .frame_50
	dw .frame_51
	dw .frame_52
	dw .frame_53
	dw .frame_54
	dw .frame_55
	dw .frame_56
	dw .frame_57
	dw .frame_58
	dw .frame_59
	dw .frame_60
	dw .frame_61
	dw .frame_62
	dw .frame_63
	dw .frame_64
	dw .frame_65
	dw .frame_66
	dw .frame_67
	dw .frame_68
	dw .frame_69
	dw .frame_70
	dw .frame_71
	dw .frame_72
	dw .frame_73
	dw .frame_74
	dw .frame_75
	dw .frame_76
	dw .frame_77
	dw .frame_78
	dw .frame_79
	dw .frame_80
	dw .frame_81
	dw .frame_82
	dw .frame_83
	dw .frame_84
	dw .frame_85
	dw .frame_86
	dw .frame_87
	dw .frame_88
	dw .frame_89
	dw .frame_90
	dw .frame_91
	dw .frame_92
	dw .frame_93
	dw .frame_94
	dw .frame_95
	dw .frame_96
	dw .frame_97
	dw .frame_98
	dw .frame_99
	dw .frame_100
	dw .frame_101
	dw .frame_102
	dw .frame_103
	dw .frame_104
	dw .frame_105
	dw .frame_106
	dw .frame_107
	dw .frame_108
	dw .frame_109
	dw .frame_110
	dw .frame_111
	dw .frame_112
	dw .frame_113
	dw .frame_114
	dw .frame_115
	dw .frame_116
	dw .frame_117
	dw .frame_118
	dw .frame_119
	dw .frame_120
	dw .frame_121
	dw .frame_122
	dw .frame_123
	dw .frame_124
	dw .frame_125
	dw .frame_126
	dw .frame_127

.frame_0
	frame_oam -16,  -8, $00, 3
	frame_oam -16,   0, $00, 3 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -16,  -7, $00, 3
	frame_oam -16,   1, $00, 3 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -15,  -8, $02, 3
	frame_oam -14,   0, $04, 3
	db $80

.frame_3
	frame_oam -11,  -7, $06, 3
	frame_oam -11,   1, $08, 3
	db $80

.frame_4
	frame_oam -10,  -7, $06, 3
	frame_oam  -9,   1, $08, 3
	db $80

.frame_5
	frame_oam  -6,  -6, $06, 3
	frame_oam  -7,   2, $08, 3
	db $80

.frame_6
	frame_oam  -9,  -3, $0a, 3
	frame_oam  -9,   5, $0c, 3
	db $80

.frame_7
	frame_oam  -8,  -3, $0a, 3
	frame_oam  -7,   5, $0c, 3
	db $80

.frame_8
	frame_oam  -8,  -4, $06, 3 | OAMF_YFLIP
	frame_oam  -7,   4, $08, 3 | OAMF_YFLIP
	db $80

.frame_9
	frame_oam -16,  -4, $fe, 7
	db $80

.frame_10
	frame_oam -16,  -8, $0e, 2
	frame_oam -16,   0, $0e, 2 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -16,  -8, $10, 2
	frame_oam -16,   0, $10, 2 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -16,  -8, $14, 0
	frame_oam -16,   0, $14, 0 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -16,  -8, $16, 0
	frame_oam -16,   0, $16, 0 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -17,  -8, $10, 2
	frame_oam -17,   0, $10, 2 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -16, -11, $10, 2
	frame_oam -16,   3, $10, 2 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -17, -11, $10, 2
	frame_oam -17,   3, $10, 2 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -16, -13, $10, 2
	frame_oam -16,   5, $10, 2 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -17, -14, $10, 2
	frame_oam -17,   6, $10, 2 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -16, -15, $10, 2
	frame_oam -16,   7, $10, 2 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -17, -15, $10, 2
	frame_oam -17,   7, $10, 2 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -16, -16, $10, 2
	frame_oam -16,   8, $10, 2 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -16,  -8, $12, 0
	frame_oam -16,   0, $12, 0 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -16,  -8, $16, 0
	frame_oam -16,   0, $16, 0 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -16,  -8, $18, 2
	frame_oam -16,   0, $1a, 2
	db $80

.frame_25
	frame_oam -16,  -4, $40, 0
	db $80

.frame_26
	frame_oam -16,  -4, $42, 0
	db $80

.frame_27
	frame_oam -16,  -4, $44, 0
	db $80

.frame_28
	frame_oam -16,  -4, $46, 0
	db $80

.frame_29
	frame_oam -16,  -4, $48, 0
	db $80

.frame_30
	frame_oam -16,  -4, $4a, 0
	db $80

.frame_31
	frame_oam -18,  -4, $48, 0
	db $80

.frame_32
	frame_oam -16,  -4, $4a, 0 | OAMF_XFLIP
	db $80

.frame_33
	frame_oam -16,  -4, $4c, 3
	db $80

.frame_34
	frame_oam -16,  -4, $4e, 3
	db $80

.frame_35
	frame_oam -16,  -4, $50, 3
	db $80

.frame_36
	frame_oam -16,  -4, $52, 3
	db $80

.frame_37
	frame_oam -16,  -4, $54, 3
	db $80

.frame_38
	frame_oam -16,  -5, $56, 3
	db $80

.frame_39
	frame_oam -16,  -8, $1c, 2
	frame_oam -16,   0, $1c, 2
	frame_oam -28,  -5, $1e, 2 | OAMF_YFLIP
	db $80

.frame_40
	frame_oam -30,  -6, $1e, 2
	frame_oam -19, -16, $1c, 2
	frame_oam -27,   4, $1c, 2
	frame_oam  -7,  -1, $1e, 2
	db $80

.frame_41
	frame_oam -48, -15, $1e, 2
	frame_oam -23, -25, $1e, 2
	frame_oam -40,   2, $1e, 2
	frame_oam -16,   5, $1e, 2
	db $80

.frame_42
	frame_oam -54, -25, $1e, 2
	frame_oam -16, -40, $1e, 2
	frame_oam -46,   8, $1e, 2
	frame_oam -19,  18, $1e, 2 | OAMF_YFLIP
	db $80

.frame_43
	frame_oam -54, -35, $1e, 2
	frame_oam -38,  18, $1e, 2
	db $80

.frame_44
	frame_oam -15,  -8, $18, 2
	frame_oam -15,   0, $1a, 2
	db $80

.frame_45
	frame_oam -16,  -8, $2a, 2
	frame_oam -16,   0, $2a, 2 | OAMF_XFLIP
	db $80

.frame_46
	frame_oam -16,  -8, $2c, 2
	frame_oam -16,   0, $2c, 2 | OAMF_XFLIP
	db $80

.frame_47
	frame_oam -16,  -8, $2e, 2
	frame_oam -16,   0, $2e, 2 | OAMF_XFLIP
	db $80

.frame_48
	frame_oam -17,  -8, $2e, 2
	frame_oam -17,   0, $2e, 2 | OAMF_XFLIP
	db $80

.frame_49
	frame_oam -25,  -4, $30, 5
	frame_oam -16,  -8, $2c, 2
	frame_oam -16,   0, $2c, 2 | OAMF_XFLIP
	db $80

.frame_50
	frame_oam -25,  -4, $32, 5
	frame_oam -16,  -8, $2c, 2
	frame_oam -16,   0, $2c, 2 | OAMF_XFLIP
	db $80

.frame_51
	frame_oam -25,  -5, $34, 5
	frame_oam -16,  -8, $2c, 2
	frame_oam -16,   0, $2c, 2 | OAMF_XFLIP
	db $80

.frame_52
	frame_oam -25,  -5, $36, 5
	frame_oam -16,  -8, $2c, 2
	frame_oam -16,   0, $2c, 2 | OAMF_XFLIP
	db $80

.frame_53
	frame_oam -25,  -5, $38, 5
	frame_oam -16,  -8, $2c, 2
	frame_oam -16,   0, $2c, 2 | OAMF_XFLIP
	db $80

.frame_54
	frame_oam -25,  -5, $3a, 5
	frame_oam -16,  -8, $2c, 2
	frame_oam -16,   0, $2c, 2 | OAMF_XFLIP
	db $80

.frame_55
	frame_oam -25,  -4, $3c, 5
	frame_oam -16,  -8, $2c, 2
	frame_oam -16,   0, $2c, 2 | OAMF_XFLIP
	db $80

.frame_56
	frame_oam -25,  -4, $3e, 5
	frame_oam -16,  -8, $2c, 2
	frame_oam -16,   0, $2c, 2 | OAMF_XFLIP
	db $80

.frame_57
	frame_oam -25,  -4, $20, 5
	frame_oam -16,  -8, $2c, 2
	frame_oam -16,   0, $2c, 2 | OAMF_XFLIP
	db $80

.frame_58
	frame_oam -25,  -5, $3e, 5 | OAMF_XFLIP
	frame_oam -16,  -8, $2c, 2
	frame_oam -16,   0, $2c, 2 | OAMF_XFLIP
	db $80

.frame_59
	frame_oam -25,  -5, $20, 5 | OAMF_XFLIP
	frame_oam -16,  -8, $2c, 2
	frame_oam -16,   0, $2c, 2 | OAMF_XFLIP
	db $80

.frame_60
	frame_oam  -8,  -4, $22, 0
	db $80

.frame_61
	frame_oam -12,  -8, $24, 0
	frame_oam -12,   0, $24, 0 | OAMF_XFLIP
	db $80

.frame_62
	frame_oam -12,  -8, $26, 0
	frame_oam -12,   0, $26, 0 | OAMF_XFLIP
	db $80

.frame_63
	frame_oam -19,   0, $28, 1
	frame_oam -16,   7, $28, 1
	frame_oam -19,  16, $28, 1
	db $80

.frame_64
	frame_oam -21,   0, $28, 0
	frame_oam -18,   7, $28, 0
	frame_oam -16,  16, $28, 0
	db $80

.frame_65
	frame_oam -18,   0, $28, 0
	frame_oam -20,   7, $28, 0
	frame_oam -17,  16, $28, 0
	db $80

.frame_66
	frame_oam -16,   0, $28, 0
	frame_oam -21,   7, $28, 0
	frame_oam -20,  16, $28, 0
	db $80

.frame_67
	frame_oam -17,   0, $28, 0
	frame_oam -18,   7, $28, 0
	frame_oam -22,  16, $28, 0
	db $80

.frame_68
	frame_oam -16,  -6, $60, 3
	db $80

.frame_69
	frame_oam -16, -10, $62, 3
	frame_oam -16,  -2, $64, 3
	db $80

.frame_70
	frame_oam -16,  -8, $62, 3
	frame_oam -16,   0, $64, 3
	db $80

.frame_71
	frame_oam -16,  -8, $66, 3
	frame_oam -16,   0, $68, 3
	db $80

.frame_72
	frame_oam -17,  -6, $66, 3
	frame_oam -17,   2, $68, 3
	db $80

.frame_73
	frame_oam -16,  -8, $6a, 3
	frame_oam -16,   0, $6c, 3
	db $80

.frame_74
	frame_oam -22,  -8, $6a, 3 | OAMF_YFLIP
	frame_oam -22,   1, $6c, 3 | OAMF_YFLIP
	db $80

.frame_75
	frame_oam -22,  -8, $6a, 3 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -10,  -1, $6c, 3
	db $80

.frame_76
	frame_oam -20,  -9, $6a, 3 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -11,  -1, $6c, 3
	db $80

.frame_77
	frame_oam -18,  -9, $6a, 3 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -20,  -1, $6c, 3 | OAMF_YFLIP
	db $80

.frame_78
	frame_oam  -4, -16, $58, 3
	frame_oam  -4,   8, $58, 3
	frame_oam -20,  -1, $5a, 3
	db $80

.frame_79
	frame_oam -16, -16, $5c, 3
	frame_oam -16,   9, $5c, 3
	db $80

.frame_80
	frame_oam -16, -16, $5e, 3
	frame_oam -16,   9, $5e, 3
	db $80

.frame_81
	frame_oam  -4, -16, $58, 3
	db $80

.frame_82
	frame_oam -16,  -5, $7e, 3
	db $80

.frame_83
	frame_oam  -4, -16, $58, 3
	frame_oam -20,  -1, $5a, 3
	db $80

.frame_84
	frame_oam -16,  -4, $6a, 3
	db $80

.frame_85
	frame_oam -16,  -4, $6e, 3
	db $80

.frame_86
	frame_oam -16,  -5, $70, 3
	db $80

.frame_87
	frame_oam -16,  -5, $6a, 3 | OAMF_XFLIP
	db $80

.frame_88
	frame_oam -17,  -6, $6e, 3 | OAMF_XFLIP
	db $80

.frame_89
	frame_oam   1,   3, $ae, 2
	db $80

.frame_90
	frame_oam   1,   3, $b0, 2
	db $80

.frame_91
	frame_oam   1,  -2, $aa, 2
	frame_oam   1,   3, $b0, 2
	db $80

.frame_92
	frame_oam   1,  -2, $aa, 2
	frame_oam  27,   0, $b4, 3
	frame_oam   1,   3, $b2, 3
	frame_oam   1,  -1, $ae, 2
	db $80

.frame_93
	frame_oam   1,  -2, $aa, 2
	frame_oam   1,   3, $ae, 2
	frame_oam   1,  -1, $b2, 3
	db $80

.frame_94
	frame_oam   1,  -2, $ac, 3
	frame_oam   1,   3, $b0, 2
	db $80

.frame_95
	frame_oam  -9,   3, $a4, 5
	frame_oam   1,  -2, $aa, 2
	frame_oam   1,  -1, $ae, 2
	db $80

.frame_96
	frame_oam  -9,   4, $a6, 5
	frame_oam  -9,  -4, $a4, 5
	frame_oam   1,  -5, $aa, 2
	db $80

.frame_97
	frame_oam  -9,  -1, $a6, 5
	frame_oam  -9,   7, $a8, 5
	frame_oam  -9,  -9, $a4, 5
	db $80

.frame_98
	frame_oam  -9,  -1, $a6, 5
	frame_oam  -9,   7, $a8, 3
	frame_oam  -9,  -9, $a4, 5
	db $80

.frame_99
	frame_oam  -9,  -1, $a6, 3
	frame_oam  -9,   7, $a8, 1
	frame_oam  -9,  -9, $a4, 5
	db $80

.frame_100
	frame_oam  -9,  -1, $a6, 1
	frame_oam  -9,   7, $a8, 1
	frame_oam  -9,  -9, $a4, 3
	db $80

.frame_101
	frame_oam  -9,  -1, $a6, 1
	frame_oam  -9,  -9, $a4, 1
	db $80

.frame_102
	frame_oam  -9,  -9, $a4, 1
	db $80

.frame_103
	frame_oam  -9,  -9, $ae, 5
	frame_oam  -9,  -1, $b0, 5
	frame_oam  -9,   7, $b2, 5
	db $80

.frame_104
	frame_oam  -9,  -9, $b4, 5
	frame_oam  -9,  -1, $b6, 5
	frame_oam  -9,   7, $b8, 5
	db $80

.frame_105
	frame_oam  -9,  -9, $ba, 5
	frame_oam  -9,  -1, $bc, 5
	frame_oam  -9,   7, $be, 5
	db $80

.frame_106
	frame_oam  -9,  -1, $a6, 2
	frame_oam  -9,   7, $a8, 2
	frame_oam  -9,  -9, $a4, 2
	db $80

.frame_107
	frame_oam  -9,  -1, $a6, 3
	frame_oam  -9,   7, $a8, 3
	frame_oam  -9,  -9, $a4, 3
	db $80

.frame_108
	frame_oam  -9,  -1, $a6, 1
	frame_oam  -9,   7, $a8, 1
	frame_oam  -9,  -9, $a4, 1
	db $80

.frame_109
	frame_oam -16,  -8, $72, 7
	frame_oam -16,   0, $74, 7
	db $80

.frame_110
	frame_oam -18,  -8, $76, 7
	frame_oam -18,   0, $78, 7
	db $80

.frame_111
	frame_oam -20,  -8, $7a, 7
	frame_oam -20,   0, $7c, 7
	db $80

.frame_112
	frame_oam -16,   0, $c0, 0
	db $80

.frame_113
	frame_oam -16,   0, $c2, 0
	db $80

.frame_114
	frame_oam -16,   0, $c4, 0
	db $80

.frame_115
	frame_oam -16,   0, $c6, 0
	db $80

.frame_116
	frame_oam -16,  -4, $cc, 5
	db $80

.frame_117
	frame_oam -17,  -4, $ce, 3
	db $80

.frame_118
	frame_oam  -8,  -4, $cc, 5 | OAMF_YFLIP
	db $80

.frame_119
	frame_oam -17,  -5, $ce, 3 | OAMF_XFLIP
	db $80

.frame_120
	frame_oam -16,  -8, $d0, 5
	frame_oam -16,   0, $d0, 5 | OAMF_XFLIP
	db $80

.frame_121
	frame_oam -16,  -8, $d2, 3
	frame_oam -16,   0, $d4, 3
	db $80

.frame_122
	frame_oam -16,  -8, $d0, 5 | OAMF_YFLIP
	frame_oam -16,   0, $d0, 5 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_123
	frame_oam -16,   0, $d2, 3 | OAMF_XFLIP
	frame_oam -16,  -8, $d4, 3 | OAMF_XFLIP
	db $80

.frame_124
	frame_oam -16,  -8, $d6, 5
	frame_oam -16,   0, $d6, 5 | OAMF_XFLIP
	db $80

.frame_125
	frame_oam -16,  -8, $d8, 3
	frame_oam -16,   0, $da, 3
	db $80

.frame_126
	frame_oam -16,  -8, $d6, 5 | OAMF_YFLIP
	frame_oam -16,   0, $d6, 5 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_127
	frame_oam -16,   0, $d8, 3 | OAMF_XFLIP
	frame_oam -16,  -8, $da, 3 | OAMF_XFLIP
	db $80

Frameset_a8590:
	db $01,  2
	db $00,  2
	db $01,  2
	db $00,  2
	db $01,  2
	db $00,  2
	db $01,  2
	db $00,  2
	db $01,  2
	db $00,  2
	db $01,  2
	db $00, 30
	db $02,  8
	db $03,  4
	db $04,  2
	db $05,  2
	db $06,  2
	db $07,  5
	db $08, 60
	db $09,  1
	db $08,  2
	db $09,  1
	db $08,  2
	db $09,  1
	db $08,  2
	db $09,  2
	db $08,  1
	db $09,  2
	db $08,  1
	db $09, 60
	db $ff

Frameset_a85cd:
	db $00,  2
	db $ff

Frameset_a85d0:
	db $0a,  4
	db $ff

Frameset_a85d3:
	db $0c,  2
	db $16,  4
	db $0d, 30
	db $0e,  1
	db $0d,  2
	db $0e,  1
	db $0d,  2
	db $0e,  1
	db $0d,  2
	db $0e,  1
	db $0d,  2
	db $0e,  1
	db $0d,  2
	db $0e,  1
	db $0d,  2
	db $0b,  1
	db $0d,  2
	db $0b,  1
	db $17,  2
	db $0b,  1
	db $17,  1
	db $0b,  2
	db $17,  1
	db $0b,  2
	db $17,  1
	db $0b, 60
	db $0e,  1
	db $0b,  2
	db $0e,  1
	db $0b,  1
	db $0e,  2
	db $0b,  1
	db $0e,  2
	db $0b,  1
	db $0e,  2
	db $0b,  1
	db $0f,  3
	db $10,  2
	db $11,  3
	db $12,  2
	db $13,  3
	db $14,  2
	db $15, 60
	db $ff

Frameset_a862a:
	db $18,  4
	db $ff

Frameset_a862d:
	db $19,  4
	db $1a,  4
	db $1b,  4
	db $1c,  4
	db $ff

Frameset_a8636:
	db $1d,  4
	db $ff

Frameset_a8639:
	db $1e,  2
	db $1f,  3
	db $20,  2
	db $1d,  2
	db $1e,  2
	db $1d, 20
	db $ff

Frameset_a8646:
	db $21,  8
	db $22,  8
	db $23,  8
	db $24,  8
	db $25,  8
	db $26, 60
	db $ff

Frameset_a8653:
	db $2c,  1
	db $18,  1
	db $2c,  2
	db $18,  2
	db $2c,  2
	db $18,  2
	db $2c,  3
	db $18,  5
	db $27,  3
	db $28,  3
	db $29,  3
	db $2a,  2
	db $2b,  2
	db $ff

Frameset_a866e:
	db $26, 60
	db $52,  2
	db $26,  3
	db $52,  2
	db $26,  2
	db $52,  4
	db $26,  2
	db $52, 30
	db $ff

Frameset_a867f:
	db $3c,  4
	db $3d,  4
	db $3e,  4
	db $30,  6
	db $2f,  7
	db $2e,  6
	db $2d,  5
	db $2e,  6
	db $2f,  4
	db $2e, 80
	db $31,  2
	db $32,  6
	db $33, 30
	db $34,  7
	db $35,  8
	db $36,  9
	db $37,  9
	db $38, 10
	db $39, 10
	db $38, 10
	db $39, 10
	db $38, 10
	db $39, 10
	db $37, 11
	db $3a, 10
	db $3b, 10
	db $3a, 10
	db $3b, 10
	db $3a, 10
	db $3b, 10
	db $37,  7
	db $36,  6
	db $35,  5
	db $34,  4
	db $33,  3
	db $32,  3
	db $31,  3
	db $2e,  7
	db $2d,  7
	db $2e,  6
	db $2f,  4
	db $2e,  6
	db $2d,  7
	db $2e,  6
	db $2d,  7
	db $ff

Frameset_a86da:
	db $2e,  6
	db $2d,  5
	db $2e,  6
	db $2d,  5
	db $2e,  6
	db $2d,  5
	db $2e, 80
	db $31,  2
	db $32,  6
	db $33,  6
	db $34,  7
	db $35,  8
	db $36,  9
	db $37,  9
	db $38, 10
	db $39, 10
	db $38, 10
	db $39, 10
	db $38, 10
	db $39, 10
	db $37, 11
	db $3a, 10
	db $3b, 10
	db $3a, 10
	db $3b, 10
	db $3a, 10
	db $3b, 10
	db $37,  7
	db $36,  6
	db $35,  5
	db $34,  4
	db $33,  3
	db $32,  3
	db $31,  3
	db $2e,  7
	db $2d,  7
	db $2e,  6
	db $2f,  4
	db $2e,  6
	db $2d,  7
	db $2e,  6
	db $2d,  7
	db $ff

Frameset_a872f:
	db $2e,  4
	db $ff

Frameset_a8732:
	db $3f,  5
	db $40,  5
	db $41,  5
	db $42,  5
	db $43,  5
	db $ff

Frameset_a873d:
	db $2d,  5
	db $2e,  4
	db $2f,  4
	db $2e,  4
	db $2d,  5
	db $2e,  4
	db $2f,  4
	db $2e,  4
	db $2d,  5
	db $ff

Frameset_a8750:
	db $44,  6
	db $45,  4
	db $46,  4
	db $47,  4
	db $48,  6
	db $47,  4
	db $46,  4
	db $45,  4
	db $ff

Frameset_a8761:
	db $46,  4
	db $ff

Frameset_a8764:
	db $49,  4
	db $4a,  4
	db $4b,  6
	db $4c,  4
	db $4d,  4
	db $ff

Frameset_a876f:
	db $54,  5
	db $55,  5
	db $56,  5
	db $57,  5
	db $58,  5
	db $ff

Frameset_a877a:
	db $4e,  4
	db $ff

Frameset_a877d:
	db $4f,  2
	db $50,  1
	db $ff

Frameset_a8782:
	db $51,  4
	db $09,  4
	db $51,  4
	db $09,  4
	db $53,  4
	db $51,  4
	db $53,  4
	db $51,  4
	db $ff

Frameset_a8793:
	db $53,  6
	db $51,  4
	db $09, 60
	db $ff

Frameset_a879a:
	db $46,  3
	db $09,  2
	db $ff

Frameset_a879f:
	db $59,  6
	db $5a,  6
	db $5b,  6
	db $5c,  6
	db $5d,  6
	db $5e,  6
	db $5b, 20
	db $5c,  6
	db $5d,  6
	db $5e,  6
	db $5f,  6
	db $60,  6
	db $61, 60
	db $6a,  8
	db $6b,  7
	db $6c,  6
	db $6b,  7
	db $6a,  8
	db $6b,  7
	db $6c,  6
	db $6b,  7
	db $6a,  8
	db $6b,  7
	db $6c,  6
	db $09, 60
	db $ff

Frameset_a87d2:
	db $6d,  6
	db $6e,  6
	db $6f,  6
	db $ff

Frameset_a87d9:
	db $6d,  4
	db $ff

Frameset_a87dc:
	db $6f,  4
	db $ff

Frameset_a87df:
	db $70,  4
	db $71,  4
	db $72,  4
	db $73,  4
	db $ff

Frameset_a87e8:
	db $74,  4
	db $75,  4
	db $76,  4
	db $77,  4
	db $ff

Frameset_a87f1:
	db $78,  4
	db $79,  4
	db $7a,  4
	db $7b,  4
	db $ff

OAM_a87fa:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6

.frame_0
	frame_oam  -8,  -4, $e0, 0
	db $80

.frame_1
	frame_oam -16,  -8, $e2, 0
	frame_oam -16,   0, $e4, 0
	db $80

.frame_2
	frame_oam -14,  -8, $e6, 0
	frame_oam -14,   0, $e8, 0
	db $80

.frame_3
	frame_oam -14,  -9, $ea, 0
	frame_oam -14,   1, $ec, 0
	db $80

.frame_4
	frame_oam -17,   2, $ea, 0 | OAMF_XFLIP
	frame_oam -17, -11, $ec, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -24,  -4, $ee, 0
	db $80

.frame_6
	frame_oam -27,  -4, $ee, 0 | OAMF_XFLIP
	db $80

Frameset_a883b:
	db $00,  3
	db $01,  4
	db $02,  6
	db $03,  5
	db $04,  5
	db $05,  5
	db $06,  5
	db $ff

OAM_a884a:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23
	dw .frame_24
	dw .frame_25
	dw .frame_26
	dw .frame_27
	dw .frame_28
	dw .frame_29
	dw .frame_30
	dw .frame_31
	dw .frame_32
	dw .frame_33
	dw .frame_34
	dw .frame_35
	dw .frame_36
	dw .frame_37
	dw .frame_38
	dw .frame_39
	dw .frame_40
	dw .frame_41
	dw .frame_42
	dw .frame_43
	dw .frame_44
	dw .frame_45
	dw .frame_46
	dw .frame_47
	dw .frame_48
	dw .frame_49
	dw .frame_50
	dw .frame_51
	dw .frame_52
	dw .frame_53
	dw .frame_54
	dw .frame_55
	dw .frame_56
	dw .frame_57
	dw .frame_58
	dw .frame_59
	dw .frame_60
	dw .frame_61
	dw .frame_62
	dw .frame_63
	dw .frame_64
	dw .frame_65
	dw .frame_66
	dw .frame_67
	dw .frame_68
	dw .frame_69
	dw .frame_70
	dw .frame_71
	dw .frame_72
	dw .frame_73
	dw .frame_74
	dw .frame_75
	dw .frame_76
	dw .frame_77
	dw .frame_78
	dw .frame_79
	dw .frame_80
	dw .frame_81
	dw .frame_82
	dw .frame_83
	dw .frame_84
	dw .frame_85
	dw .frame_86
	dw .frame_87
	dw .frame_88
	dw .frame_89
	dw .frame_90
	dw .frame_91
	dw .frame_92
	dw .frame_93
	dw .frame_94
	dw .frame_95
	dw .frame_96
	dw .frame_97
	dw .frame_98
	dw .frame_99
	dw .frame_100
	dw .frame_101
	dw .frame_102
	dw .frame_103
	dw .frame_104
	dw .frame_105
	dw .frame_106
	dw .frame_107
	dw .frame_108

.frame_0
	frame_oam -16, -10, $02, 2
	frame_oam -16,  -2, $04, 2
	frame_oam -16,   6, $06, 2
	frame_oam -20, -18, $06, 2 | OAMF_XFLIP
	frame_oam   6, -12, $00, 0
	frame_oam   8,   2, $00, 0 | OAMF_YFLIP
	frame_oam   8, -12, $24, 1
	frame_oam   4,   0, $24, 1
	db $80

.frame_1
	frame_oam -16,  -9, $02, 2
	frame_oam -16,  -1, $04, 2
	frame_oam -16,   7, $06, 2
	frame_oam -20, -17, $06, 2 | OAMF_XFLIP
	frame_oam   8,   2, $00, 0
	frame_oam   0, -12, $00, 0 | OAMF_YFLIP
	frame_oam   8, -12, $26, 1 | OAMF_XFLIP
	frame_oam   4,  -3, $26, 1 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -16,  -8, $02, 2
	frame_oam -16,   0, $04, 2
	frame_oam -16,   8, $06, 2
	frame_oam -20, -16, $06, 2 | OAMF_XFLIP
	frame_oam   0,  -6, $00, 0
	frame_oam   5,   5, $00, 0 | OAMF_YFLIP
	frame_oam   6,  -3, $24, 1
	db $80

.frame_3
	frame_oam -16,  -7, $02, 2
	frame_oam -16,   1, $04, 2
	frame_oam -16,   9, $06, 2
	frame_oam -20, -15, $06, 2 | OAMF_XFLIP
	frame_oam   1,   5, $00, 0
	frame_oam   5, -10, $00, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   7,   5, $26, 1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -16,  -6, $02, 2
	frame_oam -16,   2, $04, 2
	frame_oam -16,  10, $06, 2
	frame_oam -20, -14, $06, 2 | OAMF_XFLIP
	frame_oam   0,  -6, $00, 0
	frame_oam   5,   4, $00, 0
	frame_oam   9,   6, $24, 1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -32, -12, $08, 1
	frame_oam -32,  -4, $0a, 1
	frame_oam -32,   4, $0c, 1
	frame_oam -16,  -6, $0e, 1
	frame_oam -16,   2, $10, 1
	db $80

.frame_6
	frame_oam -33, -12, $12, 1
	frame_oam -33,  -4, $14, 1
	frame_oam -33,   4, $16, 1
	frame_oam -17,  -6, $18, 1
	frame_oam -17,   2, $1a, 1
	db $80

.frame_7
	frame_oam -32,  -3, $1e, 1
	frame_oam -30, -11, $1c, 1
	frame_oam -32,   5, $20, 1
	frame_oam -16,  -3, $22, 1
	db $80

.frame_8
	frame_oam -14,  -8, $28, 7
	frame_oam -14,   0, $2a, 7
	db $80

.frame_9
	frame_oam -14, -10, $28, 7
	frame_oam -14,  -4, $2c, 7
	frame_oam -14,   2, $2a, 7
	db $80

.frame_10
	frame_oam -14, -11, $28, 7
	frame_oam -14,   3, $2a, 7
	frame_oam -14,  -4, $2c, 7
	db $80

.frame_11
	frame_oam -16, -11, $2e, 7
	frame_oam -16,  -4, $30, 7
	frame_oam -16,   3, $2e, 7 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -16, -12, $2e, 7
	frame_oam -16,  -4, $30, 7
	frame_oam -16,   4, $2e, 7 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -16, -12, $32, 1
	frame_oam -16,  -4, $34, 1
	frame_oam -16,   4, $32, 1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -18, -16, $36, 1
	frame_oam -18,  -8, $38, 1
	frame_oam -18,   8, $36, 1 | OAMF_XFLIP
	frame_oam -18,   0, $38, 1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -16,  -4, $60, 0
	db $80

.frame_16
	frame_oam -16,  -4, $62, 0
	db $80

.frame_17
	frame_oam -16,  -4, $64, 0
	db $80

.frame_18
	frame_oam -16,  -4, $66, 0
	db $80

.frame_19
	frame_oam -16,  -4, $68, 0
	db $80

.frame_20
	frame_oam -16,  -4, $6a, 0
	db $80

.frame_21
	frame_oam -18,  -4, $68, 0
	db $80

.frame_22
	frame_oam -16,  -4, $6a, 0 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -16,  -4, $6c, 3
	db $80

.frame_24
	frame_oam -16,  -4, $6e, 3
	db $80

.frame_25
	frame_oam -16,  -4, $70, 3
	db $80

.frame_26
	frame_oam -16,  -4, $72, 3
	db $80

.frame_27
	frame_oam -16,  -4, $74, 3
	db $80

.frame_28
	frame_oam -16,  -5, $76, 3
	db $80

.frame_29
	frame_oam -16, -10, $02, 2
	frame_oam -16,  -2, $04, 2
	frame_oam -16,   6, $06, 2
	frame_oam -20, -18, $06, 2 | OAMF_XFLIP
	db $80

.frame_30
	frame_oam -16, -20, $3a, 2
	frame_oam -16, -12, $3c, 2
	frame_oam -13,   9, $3a, 2 | OAMF_XFLIP
	frame_oam -13,   1, $3c, 2 | OAMF_XFLIP
	frame_oam -27,  -6, $7e, 2
	db $80

.frame_31
	frame_oam -11,   4, $3e, 2 | OAMF_YFLIP
	frame_oam -17, -20, $78, 2
	frame_oam -15, -12, $7a, 2
	frame_oam -29,  -5, $3e, 2
	frame_oam -30, -13, $7c, 2 | OAMF_XFLIP
	db $80

.frame_32
	frame_oam -26,  -8, $3e, 2
	frame_oam -10,   6, $7c, 2 | OAMF_YFLIP
	frame_oam -29, -17, $7c, 2 | OAMF_XFLIP
	db $80

.frame_33
	frame_oam -17,  -6, $7c, 2 | OAMF_YFLIP
	db $80

.frame_34
	frame_oam  -8,   0, $c0, 7
	db $80

.frame_35
	frame_oam  -9,   0, $c0, 7
	db $80

.frame_36
	frame_oam -10,   0, $c0, 7
	db $80

.frame_37
	frame_oam -11,   0, $c0, 7
	db $80

.frame_38
	frame_oam -12,   0, $c0, 7
	db $80

.frame_39
	frame_oam -13,   0, $c0, 7
	db $80

.frame_40
	frame_oam -14,   0, $c0, 7
	db $80

.frame_41
	frame_oam -15,   0, $c0, 7
	db $80

.frame_42
	frame_oam -16,   0, $c0, 7
	db $80

.frame_43
	frame_oam -17,   0, $c0, 7
	db $80

.frame_44
	frame_oam -18,   0, $c0, 7
	db $80

.frame_45
	frame_oam -19,   0, $c0, 7
	db $80

.frame_46
	frame_oam -20,   0, $c0, 7
	db $80

.frame_47
	frame_oam -19,   0, $c2, 3
	db $80

.frame_48
	frame_oam  -8,   0, $c4, 1
	frame_oam -19,   0, $c2, 3
	db $80

.frame_49
	frame_oam  -9,   0, $c4, 1
	frame_oam -19,   0, $c2, 3
	db $80

.frame_50
	frame_oam -10,   0, $c4, 1
	frame_oam -19,   0, $c2, 3
	db $80

.frame_51
	frame_oam -11,   0, $c4, 1
	frame_oam -19,   0, $c2, 3
	db $80

.frame_52
	frame_oam -12,   0, $c4, 1
	frame_oam -19,   0, $c2, 3
	db $80

.frame_53
	frame_oam -13,   0, $c4, 1
	frame_oam -19,   0, $c2, 3
	db $80

.frame_54
	frame_oam -14,   0, $c4, 1
	frame_oam -19,   0, $c2, 3
	db $80

.frame_55
	frame_oam -15,   0, $c4, 1
	frame_oam -19,   0, $c2, 3
	db $80

.frame_56
	frame_oam -32,  -8, $58, 2
	db $80

.frame_57
	frame_oam -31,  -8, $5a, 2
	db $80

.frame_58
	frame_oam -21,  -8, $58, 2 | OAMF_YFLIP
	db $80

.frame_59
	frame_oam -16,  -8, $5a, 2 | OAMF_YFLIP
	db $80

.frame_60
	frame_oam -16,  -8, $5c, 2
	frame_oam -13,   0, $5e, 2
	db $80

.frame_61
	frame_oam -22, -12, $5c, 2 | OAMF_YFLIP
	frame_oam -18,   6, $5e, 2 | OAMF_YFLIP
	db $80

.frame_62
	frame_oam -27, -14, $5e, 2
	db $80

.frame_63
	frame_oam -19,  -2, $3e, 4 | OAMF_YFLIP
	frame_oam  -8,  10, $7c, 4 | OAMF_YFLIP
	frame_oam -26, -11, $7c, 4 | OAMF_XFLIP
	db $80

.frame_64
	frame_oam -10,   8, $3e, 4 | OAMF_YFLIP
	frame_oam -14,  -6, $7a, 4
	frame_oam -28,  -1, $3e, 4
	frame_oam -29,  -9, $7c, 4 | OAMF_XFLIP
	db $80

.frame_65
	frame_oam -33,  -8, $7c, 4 | OAMF_XFLIP
	frame_oam -15,  -9, $3e, 4 | OAMF_YFLIP
	frame_oam -30,   3, $7c, 4
	frame_oam -13,   9, $78, 4 | OAMF_XFLIP
	db $80

.frame_66
	frame_oam -27,   8, $7c, 4
	frame_oam -15,  -6, $7c, 4 | OAMF_YFLIP
	db $80

.frame_67
	frame_oam -27,  -5, $7c, 4 | OAMF_XFLIP
	db $80

.frame_68
	frame_oam -16, -28, $b4, 5
	frame_oam -16, -20, $b6, 5
	frame_oam -16, -12, $b8, 5
	frame_oam -16,  -4, $ba, 5
	frame_oam -16,   4, $bc, 5
	frame_oam -16,  12, $be, 5
	frame_oam -16,  20, $b4, 5 | OAMF_XFLIP
	db $80

.frame_69
	frame_oam -14, -28, $b4, 5
	frame_oam -14, -20, $b6, 5
	frame_oam -14, -12, $b8, 5
	frame_oam -14,  -4, $ba, 5
	frame_oam -14,   4, $bc, 5
	frame_oam -14,  12, $be, 5
	frame_oam -14,  20, $b4, 5 | OAMF_XFLIP
	db $80

.frame_70
	frame_oam -16, -13, $a0, 1
	frame_oam -16,   5, $a0, 1 | OAMF_XFLIP
	frame_oam -16, -10, $a2, 7
	frame_oam -16,   2, $a2, 7 | OAMF_XFLIP
	db $80

.frame_71
	frame_oam -16,  -8, $a4, 7
	frame_oam -16,   0, $a4, 7 | OAMF_XFLIP
	db $80

.frame_72
	frame_oam -16,  -8, $a6, 7
	frame_oam -16,   0, $a6, 7 | OAMF_XFLIP
	db $80

.frame_73
	frame_oam -16, -15, $a0, 1
	frame_oam -16,   7, $a0, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $a8, 7
	db $80

.frame_74
	frame_oam -16, -20, $0c, 5
	frame_oam -16, -12, $0e, 5
	frame_oam -16,  -4, $10, 5
	frame_oam -16,   4, $12, 5
	frame_oam -16,  12, $14, 5
	db $80

.frame_75
	frame_oam -16, -20, $16, 5
	frame_oam -16, -12, $18, 5
	frame_oam -16,  -4, $1a, 5
	frame_oam -16,   4, $1c, 5
	frame_oam -16,  12, $1e, 5
	db $80

.frame_76
	frame_oam -16,  12, $16, 5 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   4, $18, 5 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -4, $1a, 5 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -12, $1c, 5 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -20, $1e, 5 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_77
	frame_oam -16,  -8, $00, 5
	frame_oam -16,   0, $02, 5
	db $80

.frame_78
	frame_oam -16,  -8, $04, 5
	frame_oam -16,   0, $06, 5
	db $80

.frame_79
	frame_oam -16,  -8, $08, 5
	frame_oam -16,   0, $0a, 5
	db $80

.frame_80
	frame_oam -16,   0, $00, 5 | OAMF_XFLIP
	frame_oam -16,  -8, $02, 5 | OAMF_XFLIP
	db $80

.frame_81
	frame_oam -16,   0, $04, 5 | OAMF_XFLIP
	frame_oam -16,  -8, $06, 5 | OAMF_XFLIP
	db $80

.frame_82
	frame_oam -16,   0, $08, 5 | OAMF_XFLIP
	frame_oam -16,  -8, $0a, 5 | OAMF_XFLIP
	db $80

.frame_83
	frame_oam -16, -20, $b0, 0
	db $80

.frame_84
	frame_oam -16,  -4, $b2, 0
	frame_oam -16, -20, $b0, 0
	db $80

.frame_85
	frame_oam -16,   5, $b2, 0 | OAMF_XFLIP
	frame_oam -16,  20, $ae, 0 | OAMF_XFLIP
	frame_oam -16, -13, $b2, 0
	db $80

.frame_86
	frame_oam -16,  28, $ac, 0 | OAMF_XFLIP
	frame_oam -16, -20, $b0, 0
	frame_oam -16,  36, $aa, 0 | OAMF_XFLIP
	db $80

.frame_87
	frame_oam -16,  -4, $fe, 7
	db $80

.frame_88
	frame_oam  -9,   8, $c0, 1 | OAMF_XFLIP
	frame_oam  -9,   0, $c2, 1 | OAMF_XFLIP
	frame_oam  -9,  -8, $c4, 1 | OAMF_XFLIP
	frame_oam  -9, -16, $c6, 1 | OAMF_XFLIP
	db $80

.frame_89
	frame_oam  -8, -12, $00, 1
	frame_oam  -8,  -4, $02, 1
	frame_oam  -8,   4, $04, 1
	db $80

.frame_90
	frame_oam  -8, -12, $06, 1
	frame_oam  -8,  -4, $08, 1
	frame_oam  -8,   4, $0a, 1
	db $80

.frame_91
	frame_oam  -8, -12, $0c, 1
	frame_oam  -8,  -4, $0e, 1
	frame_oam  -8,   4, $10, 1
	db $80

.frame_92
	frame_oam  -8, -12, $12, 1
	frame_oam  -8,  -4, $14, 1
	frame_oam  -8,   4, $16, 1
	db $80

.frame_93
	frame_oam  -8, -12, $18, 1
	frame_oam  -8,  -4, $1a, 1
	frame_oam  -8,   4, $1c, 1
	db $80

.frame_94
	frame_oam  -8, -12, $1e, 1
	frame_oam  -8,  -4, $20, 1
	frame_oam  -8,   4, $22, 1
	db $80

.frame_95
	frame_oam  -8,  -8, $24, 1
	frame_oam  -8,   0, $26, 1
	db $80

.frame_96
	frame_oam  -8,  -8, $28, 1
	frame_oam  -8,   0, $2a, 1
	db $80

.frame_97
	frame_oam  -8,   0, $24, 1 | OAMF_XFLIP
	frame_oam  -8,  -8, $26, 1 | OAMF_XFLIP
	db $80

.frame_98
	frame_oam  -8,  -8, $2c, 1
	frame_oam  -8,   0, $2e, 1
	db $80

.frame_99
	frame_oam  -8, -12, $30, 1
	frame_oam  -8,  -4, $32, 1
	frame_oam -16,   4, $30, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_100
	frame_oam  -8, -12, $34, 1
	frame_oam  -8,  -4, $36, 1
	frame_oam  -8,   4, $34, 1 | OAMF_XFLIP
	db $80

.frame_101
	frame_oam  -8,   4, $30, 1 | OAMF_XFLIP
	frame_oam  -8,  -4, $32, 1 | OAMF_XFLIP
	frame_oam -16, -12, $30, 1 | OAMF_YFLIP
	db $80

.frame_102
	frame_oam  -8, -12, $38, 1
	frame_oam  -8,  -4, $3a, 1
	frame_oam  -8,   4, $38, 1 | OAMF_XFLIP
	db $80

.frame_103
	frame_oam -16,   0, $c4, 1
	frame_oam -19,   0, $c2, 3
	db $80

.frame_104
	frame_oam -17,   0, $c4, 1
	frame_oam -19,   0, $c2, 3
	db $80

.frame_105
	frame_oam -18,   0, $c4, 1
	frame_oam -19,   0, $c2, 3
	db $80

.frame_106
	frame_oam -19,   0, $c4, 1
	frame_oam -19,   0, $c2, 3
	db $80

.frame_107
	frame_oam -20,   0, $c4, 1
	frame_oam -19,   0, $c2, 3
	db $80

.frame_108
	frame_oam -16,  -5, $c6, 3
	db $80

Frameset_a8dd1:
	db $00, 14
	db $01, 14
	db $02, 14
	db $03, 14
	db $04, 14
	db $03, 14
	db $02, 14
	db $01, 14
	db $ff

Frameset_a8de2:
	db $05,  2
	db $06,  2
	db $07,  2
	db $ff

Frameset_a8de9:
	db $08,  9
	db $09,  9
	db $0a,  9
	db $0b,  8
	db $0c,  6
	db $0d,  5
	db $0e,  3
	db $ff

Frameset_a8df8:
	db $0f,  4
	db $10,  4
	db $11,  4
	db $12,  4
	db $ff

Frameset_a8e01:
	db $13,  4
	db $ff

Frameset_a8e04:
	db $14,  2
	db $15,  3
	db $16,  2
	db $13,  2
	db $14,  2
	db $13, 20
	db $ff

Frameset_a8e11:
	db $17,  8
	db $18,  8
	db $19,  8
	db $1a,  8
	db $1b,  8
	db $1c, 60
	db $ff

Frameset_a8e1e:
	db $1d, 11
	db $1e, 11
	db $1f,  8
	db $20,  7
	db $21,  7
	db $ff

Frameset_a8e29:
	db $22,  4
	db $ff

Frameset_a8e2c:
	db $22, 60
	db $23,  6
	db $24,  4
	db $25,  3
	db $26,  2
	db $27,  2
	db $28,  2
	db $29,  3
	db $2a,  4
	db $2b,  6
	db $2c,  7
	db $2d,  7
	db $2e, 40
	db $2d,  6
	db $2c,  4
	db $2b,  3
	db $2a,  2
	db $29,  2
	db $28,  2
	db $27,  3
	db $26,  4
	db $25,  6
	db $24,  7
	db $23,  7
	db $ff

Frameset_a8e5d:
	db $2f,  6
	db $57,  3
	db $2f,  4
	db $57,  3
	db $2f,  4
	db $57,  7
	db $2f, 60
	db $ff

Frameset_a8e6c:
	db $30, 60
	db $31,  6
	db $32,  4
	db $33,  3
	db $34,  2
	db $35,  2
	db $36,  2
	db $37,  3
	db $67,  4
	db $68,  6
	db $69,  7
	db $6a,  7
	db $6b, 40
	db $6a,  6
	db $69,  4
	db $68,  3
	db $67,  2
	db $37,  2
	db $36,  2
	db $35,  3
	db $34,  4
	db $33,  6
	db $32,  7
	db $31,  7
	db $ff

Frameset_a8e9d:
	db $38,  3
	db $39,  3
	db $3a,  3
	db $3b,  5
	db $3c,  5
	db $3d,  5
	db $3e,  8
	db $ff

Frameset_a8eac:
	db $3a,  3
	db $3b,  5
	db $3c,  5
	db $3d,  5
	db $3e,  8
	db $ff

Frameset_a8eb7:
	db $3f,  7
	db $40,  7
	db $41,  8
	db $42,  8
	db $43,  8
	db $ff

Frameset_a8ec2:
	db $44,  2
	db $45,  2
	db $ff

Frameset_a8ec7:
	db $44,  4
	db $ff

Frameset_a8eca:
	db $46,  3
	db $47,  3
	db $48,  3
	db $49,  3
	db $ff

Frameset_a8ed3:
	db $4a,  4
	db $4b,  4
	db $4c,  4
	db $ff

Frameset_a8eda:
	db $4d,  5
	db $4e,  5
	db $4f,  5
	db $ff

Frameset_a8ee1:
	db $50,  5
	db $51,  5
	db $52,  5
	db $ff

Frameset_a8ee8:
	db $53,  1
	db $57,  1
	db $54,  1
	db $57,  1
	db $55,  1
	db $57,  1
	db $56,  1
	db $57,  1
	db $53,  2
	db $57,  2
	db $54,  2
	db $57,  2
	db $55,  2
	db $57,  2
	db $56,  2
	db $57,  3
	db $53,  3
	db $57,  3
	db $54,  3
	db $57,  3
	db $55,  3
	db $57,  3
	db $56,  3
	db $ff

Frameset_a8f17:
	db $1c, 60
	db $6c,  2
	db $1c,  3
	db $6c,  2
	db $1c,  2
	db $6c,  4
	db $1c,  2
	db $6c, 30
	db $ff

Frameset_a8f28:
	db $5f,  4
	db $60,  4
	db $61,  4
	db $62,  4
	db $ff

Frameset_a8f31:
	db $63,  4
	db $64,  4
	db $65,  4
	db $66,  4
	db $ff

Frameset_a8f3a:
	db $59,  3
	db $5a,  3
	db $5b,  3
	db $5c,  3
	db $5d,  3
	db $5e,  3
	db $ff

Frameset_a8f47:
	db $59,  2
	db $5a,  2
	db $5b,  2
	db $5c,  2
	db $5d,  2
	db $5e,  2
	db $ff

; unreferenced
Frameset_a8f54:
	db $30,  4
	db $ff

OAM_a8f57:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22

.frame_0
	frame_oam -16,  -8, $40, 0
	frame_oam -16,   0, $40, 0 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -16,  -8, $42, 0
	frame_oam -16,   0, $42, 0 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -16,  -8, $44, 0
	frame_oam -16,   0, $44, 0 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -17,  -8, $44, 0
	frame_oam -17,   0, $44, 0 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -25,  -4, $46, 3
	frame_oam -16,  -8, $42, 0
	frame_oam -16,   0, $42, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -25,  -4, $48, 3
	frame_oam -16,  -8, $42, 0
	frame_oam -16,   0, $42, 0 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -25,  -5, $4a, 3
	frame_oam -16,  -8, $42, 0
	frame_oam -16,   0, $42, 0 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -25,  -5, $4c, 3
	frame_oam -16,  -8, $42, 0
	frame_oam -16,   0, $42, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -25,  -5, $4e, 3
	frame_oam -16,  -8, $42, 0
	frame_oam -16,   0, $42, 0 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -25,  -5, $50, 3
	frame_oam -16,  -8, $42, 0
	frame_oam -16,   0, $42, 0 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -25,  -4, $52, 3
	frame_oam -16,  -8, $42, 0
	frame_oam -16,   0, $42, 0 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -25,  -4, $54, 3
	frame_oam -16,  -8, $42, 0
	frame_oam -16,   0, $42, 0 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -25,  -4, $56, 3
	frame_oam -16,  -8, $42, 0
	frame_oam -16,   0, $42, 0 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -25,  -5, $54, 3 | OAMF_XFLIP
	frame_oam -16,  -8, $42, 0
	frame_oam -16,   0, $42, 0 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -25,  -5, $56, 3 | OAMF_XFLIP
	frame_oam -16,  -8, $42, 0
	frame_oam -16,   0, $42, 0 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam  -8,  -4, $58, 0
	db $80

.frame_16
	frame_oam -12,  -8, $5a, 0
	frame_oam -12,   0, $5a, 0 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -12,  -8, $5c, 0
	frame_oam -12,   0, $5c, 0 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -19,   0, $5e, 1
	frame_oam -16,   7, $5e, 1
	frame_oam -19,  16, $5e, 1
	db $80

.frame_19
	frame_oam -21,   0, $5e, 0
	frame_oam -18,   7, $5e, 0
	frame_oam -16,  16, $5e, 0
	db $80

.frame_20
	frame_oam -18,   0, $5e, 0
	frame_oam -20,   7, $5e, 0
	frame_oam -17,  16, $5e, 0
	db $80

.frame_21
	frame_oam -16,   0, $5e, 0
	frame_oam -21,   7, $5e, 0
	frame_oam -20,  16, $5e, 0
	db $80

.frame_22
	frame_oam -17,   0, $5e, 0
	frame_oam -18,   7, $5e, 0
	frame_oam -22,  16, $5e, 0
	db $80

Frameset_a9090:
	db $0f,  4
	db $10,  4
	db $11,  4
	db $03,  6
	db $02,  7
	db $01,  6
	db $00,  5
	db $01,  6
	db $02,  4
	db $01, 80
	db $04,  2
	db $05,  6
	db $06, 30
	db $07,  7
	db $08,  8
	db $09,  9
	db $0a,  9
	db $0b, 10
	db $0c, 10
	db $0b, 10
	db $0c, 10
	db $0b, 10
	db $0c, 10
	db $0a, 11
	db $0d, 10
	db $0e, 10
	db $0d, 10
	db $0e, 10
	db $0d, 10
	db $0e, 10
	db $0a,  7
	db $09,  6
	db $08,  5
	db $07,  4
	db $06,  3
	db $05,  3
	db $04,  3
	db $01,  7
	db $00,  7
	db $01,  6
	db $02,  4
	db $01,  6
	db $00,  7
	db $01,  6
	db $00,  7
	db $ff

Frameset_a90eb:
	db $01,  6
	db $00,  5
	db $01,  6
	db $00,  5
	db $01,  6
	db $00,  5
	db $01, 80
	db $04,  2
	db $05,  6
	db $06,  6
	db $07,  7
	db $08,  8
	db $09,  9
	db $0a,  9
	db $0b, 10
	db $0c, 10
	db $0b, 10
	db $0c, 10
	db $0b, 10
	db $0c, 10
	db $0a, 11
	db $0d, 10
	db $0e, 10
	db $0d, 10
	db $0e, 10
	db $0d, 10
	db $0e, 10
	db $0a,  7
	db $09,  6
	db $08,  5
	db $07,  4
	db $06,  3
	db $05,  3
	db $04,  3
	db $01,  7
	db $00,  7
	db $01,  6
	db $02,  4
	db $01,  6
	db $00,  7
	db $01,  6
	db $00,  7
	db $ff

Frameset_a9140:
	db $01,  4
	db $ff

Frameset_a9143:
	db $12,  5
	db $13,  5
	db $14,  5
	db $15,  5
	db $16,  5
	db $ff

Frameset_a914e:
	db $00,  5
	db $01,  4
	db $02,  4
	db $01,  4
	db $00,  5
	db $01,  4
	db $02,  4
	db $01,  4
	db $00,  5
	db $ff

OAM_a9161:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23
	dw .frame_24
	dw .frame_25
	dw .frame_26
	dw .frame_27
	dw .frame_28
	dw .frame_29
	dw .frame_30
	dw .frame_31
	dw .frame_32
	dw .frame_33
	dw .frame_34
	dw .frame_35
	dw .frame_36
	dw .frame_37
	dw .frame_38
	dw .frame_39
	dw .frame_40
	dw .frame_41
	dw .frame_42
	dw .frame_43
	dw .frame_44
	dw .frame_45
	dw .frame_46
	dw .frame_47
	dw .frame_48
	dw .frame_49
	dw .frame_50
	dw .frame_51
	dw .frame_52
	dw .frame_53
	dw .frame_54
	dw .frame_55
	dw .frame_56
	dw .frame_57
	dw .frame_58
	dw .frame_59
	dw .frame_60
	dw .frame_61
	dw .frame_62
	dw .frame_63
	dw .frame_64
	dw .frame_65
	dw .frame_66
	dw .frame_67
	dw .frame_68
	dw .frame_69
	dw .frame_70
	dw .frame_71
	dw .frame_72
	dw .frame_73
	dw .frame_74
	dw .frame_75
	dw .frame_76
	dw .frame_77
	dw .frame_78
	dw .frame_79
	dw .frame_80
	dw .frame_81
	dw .frame_82
	dw .frame_83
	dw .frame_84
	dw .frame_85
	dw .frame_86
	dw .frame_87
	dw .frame_88
	dw .frame_89
	dw .frame_90
	dw .frame_91
	dw .frame_92
	dw .frame_93
	dw .frame_94
	dw .frame_95
	dw .frame_96

.frame_0
	frame_oam -16,  -4, $60, 0
	db $80

.frame_1
	frame_oam -16,  -4, $62, 0
	db $80

.frame_2
	frame_oam -16,  -4, $64, 0
	db $80

.frame_3
	frame_oam -16,  -4, $66, 0
	db $80

.frame_4
	frame_oam -16,  -4, $68, 0
	db $80

.frame_5
	frame_oam -16,  -4, $6a, 0
	db $80

.frame_6
	frame_oam -18,  -4, $68, 0
	db $80

.frame_7
	frame_oam -16,  -4, $6a, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -16,  -4, $6c, 3
	db $80

.frame_9
	frame_oam -16,  -4, $6e, 3
	db $80

.frame_10
	frame_oam -16,  -4, $70, 3
	db $80

.frame_11
	frame_oam -16,  -4, $72, 3
	db $80

.frame_12
	frame_oam -16,  -4, $74, 3
	db $80

.frame_13
	frame_oam -16,  -5, $30, 3
	db $80

.frame_14
	frame_oam -11,  -8, $68, 2
	frame_oam -11,   0, $6a, 2
	db $80

.frame_15
	frame_oam -12, -12, $6c, 2
	frame_oam -12,  -4, $6e, 2
	frame_oam -12,   4, $70, 2
	db $80

.frame_16
	frame_oam  -8, -12, $72, 2
	frame_oam  -8,  -4, $74, 2
	frame_oam  -8,   4, $76, 2
	db $80

.frame_17
	frame_oam  -8, -12, $78, 2
	frame_oam  -8,  -4, $7a, 2
	frame_oam  -8,   4, $7c, 2
	db $80

.frame_18
	frame_oam -16,  -8, $60, 0
	frame_oam -16,   0, $60, 0 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -32,  -8, $60, 0
	frame_oam -16,  -8, $62, 0
	frame_oam -32,   0, $60, 0 | OAMF_XFLIP
	frame_oam -16,   0, $62, 0 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -48,  -8, $60, 0
	frame_oam -32,  -8, $62, 0
	frame_oam -16,  -8, $64, 0
	frame_oam -48,   0, $60, 0 | OAMF_XFLIP
	frame_oam -32,   0, $62, 0 | OAMF_XFLIP
	frame_oam -16,   0, $64, 0 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -64,  -8, $60, 0
	frame_oam -48,  -8, $62, 0
	frame_oam -32,  -8, $64, 0
	frame_oam -64,   0, $60, 0 | OAMF_XFLIP
	frame_oam -48,   0, $62, 0 | OAMF_XFLIP
	frame_oam -32,   0, $64, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $66, 0
	frame_oam -16,   0, $66, 0 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -16, -16, $28, 5
	frame_oam -16,  -8, $76, 3
	frame_oam -16,   0, $7a, 3
	frame_oam -16,   8, $2e, 5
	db $80

.frame_23
	frame_oam -16, -16, $28, 5
	frame_oam -16,  -8, $78, 3
	frame_oam -16,   0, $7c, 3
	frame_oam -16,   8, $2e, 5
	db $80

.frame_24
	frame_oam -16, -16, $28, 5
	frame_oam -16,  -8, $2a, 3
	frame_oam -16,   0, $2c, 3
	frame_oam -16,   8, $2e, 5
	db $80

.frame_25
	frame_oam -16, -16, $28, 5
	frame_oam -15,  -8, $2a, 3
	frame_oam -15,   0, $2c, 3
	frame_oam -16,   8, $2e, 5
	db $80

.frame_26
	frame_oam -16, -16, $20, 5
	frame_oam -16,  -8, $22, 3
	frame_oam -16,   0, $24, 3
	frame_oam -16,   8, $26, 5
	db $80

.frame_27
	frame_oam -32,  -4, $32, 1
	frame_oam -16,  -4, $34, 1
	db $80

.frame_28
	frame_oam -32,  -4, $36, 1
	frame_oam -16,  -4, $38, 1
	db $80

.frame_29
	frame_oam -32,  -4, $3a, 1
	frame_oam -16,  -4, $3c, 1
	db $80

.frame_30
	frame_oam -16,  -8, $00, 0
	frame_oam -16,   0, $02, 0
	frame_oam   0,   0, $04, 0
	frame_oam   0,   8, $06, 0
	db $80

.frame_31
	frame_oam -16,  -8, $08, 0
	frame_oam -16,   0, $0a, 0
	frame_oam   0,   0, $0c, 0
	frame_oam   0,   8, $0e, 0
	db $80

.frame_32
	frame_oam -16,  -8, $10, 0
	frame_oam -16,   0, $12, 0
	frame_oam   0,   0, $14, 0
	frame_oam   0,   8, $16, 0
	db $80

.frame_33
	frame_oam -16,  -8, $18, 0
	frame_oam -16,   0, $1a, 0
	frame_oam   0,   0, $1c, 0
	frame_oam   0,   8, $1e, 0
	db $80

.frame_34
	frame_oam -16,  -6, $a0, 0
	frame_oam -16,   2, $a2, 0
	frame_oam   0,   2, $a4, 0
	frame_oam   0,  10, $a6, 0
	db $80

.frame_35
	frame_oam -16,  -4, $a8, 0
	frame_oam -16,   4, $aa, 0
	frame_oam   0,   4, $ac, 0
	frame_oam   0,  12, $ae, 0
	db $80

.frame_36
	frame_oam -16,   6, $b0, 0
	frame_oam  -8,  14, $b2, 0
	db $80

.frame_37
	frame_oam -80,   0, $00, 1
	frame_oam -64,   0, $02, 1
	frame_oam -48,   0, $02, 1
	frame_oam -32,   0, $02, 1
	frame_oam -16,   0, $02, 1
	db $80

.frame_38
	frame_oam -80,   0, $04, 1
	frame_oam -64,   0, $06, 1
	frame_oam -48,   0, $06, 1
	frame_oam -32,   0, $06, 1
	frame_oam -16,   0, $06, 1
	db $80

.frame_39
	frame_oam -16,  -8, $40, 2
	frame_oam -16,   0, $40, 2 | OAMF_XFLIP
	db $80

.frame_40
	frame_oam -16,  -8, $42, 2
	frame_oam -16,   0, $42, 2 | OAMF_XFLIP
	db $80

.frame_41
	frame_oam -16,  -8, $44, 2
	frame_oam -16,   0, $44, 2 | OAMF_XFLIP
	db $80

.frame_42
	frame_oam -17,  -8, $44, 2
	frame_oam -17,   0, $44, 2 | OAMF_XFLIP
	db $80

.frame_43
	frame_oam -25,  -4, $46, 4
	frame_oam -16,  -8, $42, 2
	frame_oam -16,   0, $42, 2 | OAMF_XFLIP
	db $80

.frame_44
	frame_oam -25,  -4, $48, 1
	frame_oam -16,  -8, $42, 2
	frame_oam -16,   0, $42, 2 | OAMF_XFLIP
	db $80

.frame_45
	frame_oam -25,  -5, $4a, 1
	frame_oam -16,  -8, $42, 2
	frame_oam -16,   0, $42, 2 | OAMF_XFLIP
	db $80

.frame_46
	frame_oam -25,  -5, $4c, 1
	frame_oam -16,  -8, $42, 2
	frame_oam -16,   0, $42, 2 | OAMF_XFLIP
	db $80

.frame_47
	frame_oam -25,  -5, $4e, 1
	frame_oam -16,  -8, $42, 2
	frame_oam -16,   0, $42, 2 | OAMF_XFLIP
	db $80

.frame_48
	frame_oam -25,  -5, $50, 1
	frame_oam -16,  -8, $42, 2
	frame_oam -16,   0, $42, 2 | OAMF_XFLIP
	db $80

.frame_49
	frame_oam -25,  -4, $52, 1
	frame_oam -16,  -8, $42, 2
	frame_oam -16,   0, $42, 2 | OAMF_XFLIP
	db $80

.frame_50
	frame_oam -25,  -4, $54, 1
	frame_oam -16,  -8, $42, 2
	frame_oam -16,   0, $42, 2 | OAMF_XFLIP
	db $80

.frame_51
	frame_oam -25,  -4, $56, 1
	frame_oam -16,  -8, $42, 2
	frame_oam -16,   0, $42, 2 | OAMF_XFLIP
	db $80

.frame_52
	frame_oam -25,  -5, $54, 1 | OAMF_XFLIP
	frame_oam -16,  -8, $42, 2
	frame_oam -16,   0, $42, 2 | OAMF_XFLIP
	db $80

.frame_53
	frame_oam -25,  -5, $56, 1 | OAMF_XFLIP
	frame_oam -16,  -8, $42, 2
	frame_oam -16,   0, $42, 2 | OAMF_XFLIP
	db $80

.frame_54
	frame_oam  -8,  -4, $58, 0
	db $80

.frame_55
	frame_oam -12,  -8, $5a, 0
	frame_oam -12,   0, $5a, 0 | OAMF_XFLIP
	db $80

.frame_56
	frame_oam -12,  -8, $5c, 0
	frame_oam -12,   0, $5c, 0 | OAMF_XFLIP
	db $80

.frame_57
	frame_oam -19,   0, $5e, 1
	frame_oam -16,   7, $5e, 1
	frame_oam -19,  16, $5e, 1
	db $80

.frame_58
	frame_oam -21,   0, $5e, 0
	frame_oam -18,   7, $5e, 0
	frame_oam -16,  16, $5e, 0
	db $80

.frame_59
	frame_oam -18,   0, $5e, 0
	frame_oam -20,   7, $5e, 0
	frame_oam -17,  16, $5e, 0
	db $80

.frame_60
	frame_oam -16,   0, $5e, 0
	frame_oam -21,   7, $5e, 0
	frame_oam -20,  16, $5e, 0
	db $80

.frame_61
	frame_oam -17,   0, $5e, 0
	frame_oam -18,   7, $5e, 0
	frame_oam -22,  16, $5e, 0
	db $80

.frame_62
	frame_oam -80,   0, $08, 1
	frame_oam -64,   0, $08, 1
	frame_oam -48,   0, $08, 1
	frame_oam -32,   0, $08, 1
	frame_oam -16,   0, $08, 1
	db $80

.frame_63
	frame_oam -80,   0, $0a, 1 | OAMF_XFLIP
	frame_oam -64,   0, $0a, 1 | OAMF_XFLIP
	frame_oam -48,   0, $0a, 1 | OAMF_XFLIP
	frame_oam -32,   0, $0a, 1 | OAMF_XFLIP
	frame_oam -16,   0, $0a, 1 | OAMF_XFLIP
	db $80

.frame_64
	frame_oam -16,  -8, $0c, 2
	frame_oam -16,   0, $0e, 2
	db $80

.frame_65
	frame_oam -14,  -8, $10, 2
	frame_oam -14,   0, $12, 2
	db $80

.frame_66
	frame_oam -14,  -8, $14, 2
	frame_oam -14,   0, $16, 2
	db $80

.frame_67
	frame_oam -16,  -1, $14, 2 | OAMF_XFLIP
	frame_oam -16,  -9, $16, 2 | OAMF_XFLIP
	db $80

.frame_68
	frame_oam -23,  -4, $18, 2
	db $80

.frame_69
	frame_oam -26,  -4, $18, 2 | OAMF_XFLIP
	db $80

.frame_70
	frame_oam -16,  -8, $60, 5
	frame_oam -16,   0, $62, 5
	db $80

.frame_71
	frame_oam -15,  -7, $64, 5
	frame_oam -15,   1, $66, 5
	db $80

.frame_72
	frame_oam -15,  -7, $68, 5
	frame_oam -15,   1, $6a, 5
	db $80

.frame_73
	frame_oam -15,   1, $6a, 5
	frame_oam -15,  -7, $70, 5
	db $80

.frame_74
	frame_oam -15,  -7, $6c, 5
	frame_oam -15,   1, $6e, 5
	db $80

.frame_75
	frame_oam -17,  -9, $60, 5
	frame_oam -17,  -1, $62, 5
	db $80

.frame_76
	frame_oam -35,  -4, $72, 0
	db $80

.frame_77
	frame_oam -36,  -4, $74, 0
	db $80

.frame_78
	frame_oam -11,  -4, $aa, 0
	db $80

.frame_79
	frame_oam -12,  -4, $72, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_80
	frame_oam -20,  -5, $72, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -15,  -2, $72, 0
	db $80

.frame_81
	frame_oam -24,  -1, $74, 0 | OAMF_YFLIP
	frame_oam -16,  -5, $74, 0
	db $80

.frame_82
	frame_oam -27,  -2, $74, 0
	db $80

.frame_83
	frame_oam -16,  -4, $7e, 5
	db $80

.frame_84
	frame_oam -16,  -4, $00, 2
	db $80

.frame_85
	frame_oam -16,  -8, $02, 0
	frame_oam -16,   0, $02, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_86
	frame_oam -22,  -4, $06, 5
	frame_oam -14, -12, $04, 5 | OAMF_YFLIP
	frame_oam  -6,  -4, $06, 5 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -14,   4, $04, 5 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_87
	frame_oam -23, -16, $08, 5
	frame_oam -24,  -8, $0a, 0
	frame_oam -24,   0, $0c, 0
	frame_oam -23,   8, $0e, 0
	frame_oam  -7, -16, $10, 0
	frame_oam  -8,   0, $0a, 2 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -8,  -8, $0c, 2 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -7,   8, $08, 5 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_88
	frame_oam -28,  11, $16, 0
	frame_oam  -2,  -5, $18, 0
	frame_oam -28, -13, $14, 0
	frame_oam  -8, -13, $14, 0 | OAMF_YFLIP
	frame_oam -31,   3, $14, 0 | OAMF_XFLIP
	frame_oam -12,   9, $10, 0 | OAMF_XFLIP
	frame_oam -19, -21, $12, 5
	frame_oam  -4,   3, $1a, 0
	db $80

.frame_89
	frame_oam -32, -22, $1c, 0 | OAMF_YFLIP
	frame_oam   0, -18, $1c, 2
	frame_oam -24,  14, $1e, 0
	frame_oam -12, -23, $1e, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   2,  13, $1c, 2 | OAMF_XFLIP
	db $80

.frame_90
	frame_oam -36,  19, $1c, 2 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   4,  16, $1c, 2 | OAMF_XFLIP
	frame_oam  -3, -27, $1c, 2
	db $80

.frame_91
	frame_oam -16,  -4, $b4, 3
	frame_oam   6,  -4, $b6, 0
	db $80

.frame_92
	frame_oam -15,  -4, $b8, 3
	frame_oam  11,  -4, $ba, 0
	db $80

.frame_93
	frame_oam -16,   0, $bc, 3 | OAMF_XFLIP | OAMF_PRI
	frame_oam -16,  -8, $be, 3 | OAMF_XFLIP | OAMF_PRI
	db $80

.frame_94
	frame_oam -16,  -8, $bc, 3 | OAMF_PRI
	frame_oam -16,   0, $be, 3 | OAMF_PRI
	db $80

.frame_95
	frame_oam -16,  -8, $bc, 3 | OAMF_PRI
	frame_oam -16,   0, $bc, 3 | OAMF_XFLIP | OAMF_PRI
	db $80

.frame_96
	frame_oam -16,  -5, $3e, 3
	db $80

Frameset_a9674:
	db $00,  4
	db $01,  4
	db $02,  4
	db $03,  4
	db $ff

Frameset_a967d:
	db $04,  4
	db $ff

Frameset_a9680:
	db $05,  2
	db $06,  3
	db $07,  2
	db $04,  2
	db $05,  2
	db $04, 20
	db $ff

Frameset_a968d:
	db $08,  8
	db $09,  8
	db $0a,  8
	db $0b,  8
	db $0c,  8
	db $0d, 60
	db $ff

Frameset_a969a:
	db $0e,  3
	db $0f,  3
	db $10,  3
	db $11,  3
	db $ff

Frameset_a96a3:
	db $12,  4
	db $ff

Frameset_a96a6:
	db $13,  4
	db $ff

Frameset_a96a9:
	db $14,  4
	db $ff

Frameset_a96ac:
	db $15,  4
	db $ff

Frameset_a96af:
	db $1a,  8
	db $ff

Frameset_a96b2:
	db $16, 16
	db $17, 14
	db $18, 10
	db $19,  1
	db $18, 60
	db $ff

Frameset_a96bd:
	db $18,  4
	db $ff

Frameset_a96c0:
	db $0d, 60
	db $60,  2
	db $0d,  3
	db $60,  2
	db $0d,  2
	db $60,  4
	db $0d,  2
	db $60, 30
	db $ff

Frameset_a96d1:
	db $1b,  2
	db $1c,  2
	db $1d,  2
	db $ff

Frameset_a96d8:
	db $1e, 20
	db $1f, 20
	db $20, 20
	db $21, 20
	db $ff

Frameset_a96e1:
	db $21,  9
	db $22,  9
	db $23,  9
	db $24,  9
	db $ff

Frameset_a96ea:
	db $25,  4
	db $26,  4
	db $ff

Frameset_a96ef:
	db $36,  4
	db $37,  4
	db $38,  4
	db $2a,  6
	db $29,  7
	db $28,  6
	db $27,  5
	db $28,  6
	db $29,  4
	db $28, 80
	db $2b,  2
	db $2c,  6
	db $2d, 30
	db $2e,  7
	db $2f,  8
	db $30,  9
	db $31,  9
	db $32, 10
	db $33, 10
	db $32, 10
	db $33, 10
	db $32, 10
	db $33, 10
	db $31, 11
	db $34, 10
	db $35, 10
	db $34, 10
	db $35, 10
	db $34, 10
	db $35, 10
	db $31,  7
	db $30,  6
	db $2f,  5
	db $2e,  4
	db $2d,  3
	db $2c,  3
	db $2b,  3
	db $28,  7
	db $27,  7
	db $28,  6
	db $29,  4
	db $28,  6
	db $27,  7
	db $28,  6
	db $27,  7
	db $ff

Frameset_a974a:
	db $28,  6
	db $27,  5
	db $28,  6
	db $27,  5
	db $28,  6
	db $27,  5
	db $28, 80
	db $2b,  2
	db $2c,  6
	db $2d,  6
	db $2e,  7
	db $2f,  8
	db $30,  9
	db $31,  9
	db $32, 10
	db $33, 10
	db $32, 10
	db $33, 10
	db $32, 10
	db $33, 10
	db $31, 11
	db $34, 10
	db $35, 10
	db $34, 10
	db $35, 10
	db $34, 10
	db $35, 10
	db $31,  7
	db $30,  6
	db $2f,  5
	db $2e,  4
	db $2d,  3
	db $2c,  3
	db $2b,  3
	db $28,  7
	db $27,  7
	db $28,  6
	db $29,  4
	db $28,  6
	db $27,  7
	db $28,  6
	db $27,  7
	db $ff

Frameset_a979f:
	db $28,  4
	db $ff

Frameset_a97a2:
	db $39,  5
	db $3a,  5
	db $3b,  5
	db $3c,  5
	db $3d,  5
	db $ff

Frameset_a97ad:
	db $3e,  4
	db $3f,  4
	db $ff

Frameset_a97b2:
	db $27,  5
	db $28,  4
	db $29,  4
	db $28,  4
	db $27,  5
	db $28,  4
	db $29,  4
	db $28,  4
	db $27,  5
	db $ff

Frameset_a97c5:
	db $36,  3
	db $40,  4
	db $41,  6
	db $42,  5
	db $43,  5
	db $44,  5
	db $45,  5
	db $ff

Frameset_a97d4:
	db $4b,  2
	db $46,  4
	db $47,  4
	db $48,  3
	db $49,  4
	db $4a,  4
	db $ff

Frameset_a97e1:
	db $4f,  3
	db $50,  3
	db $51,  4
	db $52,  4
	db $53,  4
	db $ff

Frameset_a97ec:
	db $4a,  4
	db $ff

Frameset_a97ef:
	db $54,  2
	db $55,  2
	db $56,  2
	db $57,  2
	db $58,  2
	db $59,  2
	db $5a,  2
	db $ff

Frameset_a97fe:
	db $5b,  2
	db $5c,  1
	db $ff

Frameset_a9803:
	db $5d,  1
	db $5f,  1
	db $5e,  1
	db $5f,  1
	db $ff

OAM_a980c:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23
	dw .frame_24
	dw .frame_25
	dw .frame_26
	dw .frame_27
	dw .frame_28
	dw .frame_29
	dw .frame_30
	dw .frame_31
	dw .frame_32
	dw .frame_33
	dw .frame_34
	dw .frame_35
	dw .frame_36
	dw .frame_37
	dw .frame_38
	dw .frame_39
	dw .frame_40
	dw .frame_41
	dw .frame_42
	dw .frame_43
	dw .frame_44
	dw .frame_45
	dw .frame_46
	dw .frame_47
	dw .frame_48
	dw .frame_49
	dw .frame_50
	dw .frame_51
	dw .frame_52
	dw .frame_53
	dw .frame_54
	dw .frame_55
	dw .frame_56
	dw .frame_57
	dw .frame_58
	dw .frame_59
	dw .frame_60
	dw .frame_61
	dw .frame_62
	dw .frame_63
	dw .frame_64
	dw .frame_65
	dw .frame_66
	dw .frame_67
	dw .frame_68
	dw .frame_69
	dw .frame_70
	dw .frame_71
	dw .frame_72
	dw .frame_73
	dw .frame_74
	dw .frame_75
	dw .frame_76
	dw .frame_77
	dw .frame_78
	dw .frame_79
	dw .frame_80
	dw .frame_81
	dw .frame_82
	dw .frame_83
	dw .frame_84
	dw .frame_85
	dw .frame_86
	dw .frame_87
	dw .frame_88
	dw .frame_89
	dw .frame_90
	dw .frame_91
	dw .frame_92
	dw .frame_93
	dw .frame_94
	dw .frame_95
	dw .frame_96
	dw .frame_97
	dw .frame_98
	dw .frame_99
	dw .frame_100
	dw .frame_101
	dw .frame_102

.frame_0
	frame_oam -16,  -8, $20, 1
	frame_oam -16,   0, $20, 1 | OAMF_XFLIP
	frame_oam  -5,  -6, $28, 4
	frame_oam   4, -16, $28, 4
	db $80

.frame_1
	frame_oam -16,  -8, $22, 1
	frame_oam -16,   0, $22, 1 | OAMF_XFLIP
	frame_oam  -5,  -6, $28, 4
	frame_oam   4, -16, $28, 4
	db $80

.frame_2
	frame_oam -16,  -8, $24, 1
	frame_oam -16,   0, $24, 1 | OAMF_XFLIP
	frame_oam  -5,  -6, $2a, 4
	frame_oam   4, -16, $2a, 4
	db $80

.frame_3
	frame_oam -16,  -8, $26, 1
	frame_oam -16,   0, $26, 1 | OAMF_XFLIP
	frame_oam  -5,  -6, $2a, 4
	frame_oam   4, -16, $2a, 4
	db $80

.frame_4
	frame_oam -16,  -8, $20, 1
	frame_oam -16,   0, $20, 1 | OAMF_XFLIP
	frame_oam  -5,  -6, $2c, 4
	frame_oam   4, -16, $2c, 4
	db $80

.frame_5
	frame_oam -16,  -8, $22, 1
	frame_oam -16,   0, $22, 1 | OAMF_XFLIP
	frame_oam  -5,  -6, $2c, 4
	frame_oam   4, -16, $2c, 4
	db $80

.frame_6
	frame_oam -16,  -8, $24, 1
	frame_oam -16,   0, $24, 1 | OAMF_XFLIP
	frame_oam  -5,  -6, $2e, 4
	frame_oam   4, -16, $2e, 4
	db $80

.frame_7
	frame_oam -16,  -8, $26, 1
	frame_oam -16,   0, $26, 1 | OAMF_XFLIP
	frame_oam  -5,  -6, $2e, 4
	frame_oam   4, -16, $2e, 4
	db $80

.frame_8
	frame_oam -16, -16, $00, 2
	frame_oam -16,  -8, $02, 2
	frame_oam -16,   0, $04, 2
	frame_oam -16,   8, $06, 2
	db $80

.frame_9
	frame_oam -16, -16, $08, 2
	frame_oam -16,  -8, $0a, 2
	frame_oam -16,   0, $0c, 2
	frame_oam -16,   8, $0e, 2
	db $80

.frame_10
	frame_oam -15, -16, $10, 2
	frame_oam -15,  -8, $12, 2
	frame_oam -15,   0, $14, 2
	frame_oam -15,   8, $16, 2
	db $80

.frame_11
	frame_oam -16, -16, $18, 2
	frame_oam -16,  -8, $1a, 2
	frame_oam -16,   0, $1c, 2
	frame_oam -16,   8, $1e, 2
	db $80

.frame_12
	frame_oam -19,   0, $30, 1
	frame_oam -16,   7, $30, 1
	frame_oam -19,  16, $30, 1
	db $80

.frame_13
	frame_oam -21,   0, $30, 0
	frame_oam -18,   7, $30, 0
	frame_oam -16,  16, $30, 0
	db $80

.frame_14
	frame_oam -18,   0, $30, 0
	frame_oam -20,   7, $30, 0
	frame_oam -17,  16, $30, 0
	db $80

.frame_15
	frame_oam -16,   0, $30, 0
	frame_oam -21,   7, $30, 0
	frame_oam -19,  16, $30, 0
	db $80

.frame_16
	frame_oam -17,   0, $30, 0
	frame_oam -18,   7, $30, 0
	frame_oam -22,  16, $30, 0
	db $80

.frame_17
	frame_oam -16, -28, $34, 5
	frame_oam -16, -20, $36, 5
	frame_oam -16, -12, $38, 5
	frame_oam -16,  -4, $3a, 5
	frame_oam -16,   4, $3c, 5
	frame_oam -16,  12, $3e, 5
	frame_oam -16,  20, $34, 5 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -14, -28, $34, 5
	frame_oam -14, -20, $36, 5
	frame_oam -14, -12, $38, 5
	frame_oam -14,  -4, $3a, 5
	frame_oam -14,   4, $3c, 5
	frame_oam -14,  12, $3e, 5
	frame_oam -14,  20, $34, 5 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -12,  -8, $20, 0
	frame_oam -12,   0, $20, 0 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -16,  -8, $32, 0
	frame_oam -16,   0, $34, 0
	db $80

.frame_21
	frame_oam -14,  -8, $36, 0
	frame_oam -14,   0, $38, 0
	db $80

.frame_22
	frame_oam -14,  -8, $3a, 0
	frame_oam -14,   0, $3c, 0
	db $80

.frame_23
	frame_oam -16,   0, $3a, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $3c, 0 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -23,  -4, $3e, 0
	db $80

.frame_25
	frame_oam -26,  -4, $3e, 0 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -16,  -4, $7e, 5
	db $80

.frame_27
	frame_oam -16,  -8, $40, 5
	frame_oam -16,   0, $42, 5
	db $80

.frame_28
	frame_oam -16,  -8, $44, 5
	frame_oam -16,   0, $46, 5
	frame_oam -16,  -8, $4c, 5
	frame_oam -16,   0, $4e, 5
	db $80

.frame_29
	frame_oam -16,  -8, $48, 5
	frame_oam -16,   0, $4a, 5
	db $80

.frame_30
	frame_oam -16,  -8, $4c, 5
	frame_oam -16,   0, $4e, 5
	db $80

.frame_31
	frame_oam -16,  -4, $50, 5
	db $80

.frame_32
	frame_oam -16,  -4, $52, 5
	db $80

.frame_33
	frame_oam -16,  -4, $54, 5
	db $80

.frame_34
	frame_oam -16,  -4, $56, 5
	db $80

.frame_35
	frame_oam -16,  -4, $58, 5
	db $80

.frame_36
	frame_oam -16,  -4, $5a, 5
	db $80

.frame_37
	frame_oam -16,  -4, $5c, 5
	db $80

.frame_38
	frame_oam -16,  -4, $5e, 5
	db $80

.frame_39
	frame_oam -18,  -8, $a0, 3
	frame_oam -16,   0, $a2, 3
	db $80

.frame_40
	frame_oam -24,  -4, $6e, 0
	db $80

.frame_41
	frame_oam -28,  -4, $6c, 0 | OAMF_XFLIP
	db $80

.frame_42
	frame_oam -16, -16, $70, 2
	frame_oam -16,  -4, $72, 2
	frame_oam  -6,   4, $74, 2
	frame_oam   0,  -4, $76, 2
	db $80

.frame_43
	frame_oam   0, -12, $78, 0
	frame_oam   0,  -4, $7a, 0
	frame_oam   0,   4, $7c, 0
	db $80

.frame_44
	frame_oam -24,  -4, $66, 3
	frame_oam -16,  -8, $60, 5
	frame_oam -16,   0, $62, 5
	frame_oam  -6, -24, $64, 5
	db $80

.frame_45
	frame_oam -24,  -4, $68, 3
	frame_oam -16,  -8, $60, 5
	frame_oam -16,   0, $62, 5
	frame_oam  -6, -24, $64, 5
	db $80

.frame_46
	frame_oam -24,  -4, $6a, 3
	frame_oam -16,  -8, $60, 0
	frame_oam -16,   0, $62, 0
	frame_oam  -6, -24, $64, 5
	db $80

.frame_47
	frame_oam -24,  -4, $66, 3
	frame_oam -16,  -8, $60, 0
	frame_oam -16,   0, $62, 0
	frame_oam  -6, -24, $64, 5
	db $80

.frame_48
	frame_oam -24,  -4, $68, 3
	frame_oam -16,  -8, $60, 5
	frame_oam -16,   0, $62, 5
	frame_oam  -6, -24, $64, 5
	db $80

.frame_49
	frame_oam -24,  -4, $6a, 3
	frame_oam -16,  -8, $60, 5
	frame_oam -16,   0, $62, 5
	frame_oam  -6, -24, $64, 5
	db $80

.frame_50
	frame_oam  -7,  -4, $64, 5
	db $80

.frame_51
	frame_oam  -7,  -4, $64, 5
	frame_oam -17,  -4, $66, 3
	db $80

.frame_52
	frame_oam  -7,  -4, $64, 0
	frame_oam -17,  -4, $68, 3
	db $80

.frame_53
	frame_oam  -7,  -4, $64, 5
	frame_oam -17,  -4, $6a, 3
	db $80

.frame_54
	frame_oam -16,  -8, $60, 5
	frame_oam -16,   0, $62, 5
	frame_oam  -6, -24, $64, 5
	frame_oam -31,  -9, $6c, 0
	frame_oam -27,   1, $6e, 0
	db $80

.frame_55
	frame_oam -16,  -8, $60, 5
	frame_oam -16,   0, $62, 5
	frame_oam  -6, -24, $64, 5
	frame_oam -33, -10, $6c, 0 | OAMF_XFLIP
	frame_oam -32,   0, $6c, 0
	db $80

.frame_56
	frame_oam -16,  -8, $60, 5
	frame_oam -16,   0, $62, 5
	frame_oam  -6, -24, $64, 5
	db $80

.frame_57
	frame_oam  -7,  -4, $64, 5
	frame_oam -18,  -6, $6e, 0 | OAMF_XFLIP
	db $80

.frame_58
	frame_oam  -7,  -4, $64, 5
	frame_oam -24,  -5, $6c, 0
	db $80

.frame_59
	frame_oam  -8,  -4, $00, 1
	db $80

.frame_60
	frame_oam  -8,  -4, $02, 1
	db $80

.frame_61
	frame_oam  -8,  -8, $04, 1
	frame_oam  -8,   0, $04, 1 | OAMF_XFLIP
	db $80

.frame_62
	frame_oam  -8,  -8, $06, 1
	frame_oam  -8,   0, $06, 1 | OAMF_XFLIP
	db $80

.frame_63
	frame_oam  -8, -12, $08, 1
	frame_oam -16,  -4, $0a, 1
	frame_oam   0,  -4, $0a, 1 | OAMF_YFLIP
	frame_oam  -8,   4, $08, 1 | OAMF_XFLIP
	db $80

.frame_64
	frame_oam -16, -12, $0c, 1
	frame_oam -16,  -4, $0e, 1
	frame_oam -16,   4, $0c, 1 | OAMF_XFLIP
	frame_oam   0, -12, $0c, 1 | OAMF_YFLIP
	frame_oam   0,  -4, $0e, 1 | OAMF_YFLIP
	frame_oam   0,   4, $0c, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_65
	frame_oam -16, -12, $10, 1
	frame_oam -16,  -4, $12, 1
	frame_oam -16,   4, $10, 1 | OAMF_XFLIP
	frame_oam   0, -12, $10, 1 | OAMF_YFLIP
	frame_oam   0,  -4, $12, 1 | OAMF_YFLIP
	frame_oam   0,   4, $10, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_66
	frame_oam -16, -16, $14, 1
	frame_oam -24,  -8, $16, 1
	frame_oam -16,   8, $14, 1 | OAMF_XFLIP
	frame_oam -24,   0, $16, 1 | OAMF_XFLIP
	frame_oam   0, -16, $14, 1 | OAMF_YFLIP
	frame_oam   8,  -8, $16, 1 | OAMF_YFLIP
	frame_oam   0,   8, $14, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   8,   0, $16, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_67
	frame_oam   0,  16, $18, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   5,   8, $1a, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  14,   0, $1c, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0, -24, $18, 1 | OAMF_YFLIP
	frame_oam   5, -16, $1a, 1 | OAMF_YFLIP
	frame_oam  14,  -8, $1c, 1 | OAMF_YFLIP
	frame_oam -16,  16, $18, 1 | OAMF_XFLIP
	frame_oam -21,   8, $1a, 1 | OAMF_XFLIP
	frame_oam -30,   0, $1c, 1 | OAMF_XFLIP
	frame_oam -16, -24, $18, 1
	frame_oam -21, -16, $1a, 1
	frame_oam -30,  -8, $1c, 1
	db $80

.frame_68
	frame_oam   0, -12, $44, 7
	frame_oam   0,  -4, $46, 7
	frame_oam   0,   4, $44, 7 | OAMF_XFLIP
	frame_oam -16, -12, $40, 7
	frame_oam -16,  -4, $42, 7
	frame_oam -16,   4, $40, 7 | OAMF_XFLIP
	db $80

.frame_69
	frame_oam   0, -12, $4a, 7
	frame_oam   0,  -4, $4c, 7
	frame_oam   0,   4, $4a, 7 | OAMF_XFLIP
	frame_oam -16,  -4, $42, 7
	frame_oam -16, -12, $48, 7
	frame_oam -16,   4, $48, 7 | OAMF_XFLIP
	db $80

.frame_70
	frame_oam -16, -12, $44, 7 | OAMF_YFLIP
	frame_oam -16,  -4, $46, 7 | OAMF_YFLIP
	frame_oam -16,   4, $44, 7 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0, -12, $40, 7 | OAMF_YFLIP
	frame_oam   0,  -4, $42, 7 | OAMF_YFLIP
	frame_oam   0,   4, $40, 7 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_71
	frame_oam   0, -12, $50, 7
	frame_oam   0,   4, $50, 7 | OAMF_XFLIP
	frame_oam -16, -12, $4e, 7
	frame_oam -16,   4, $4e, 7 | OAMF_XFLIP
	frame_oam   0,  -4, $46, 7
	frame_oam -16,  -4, $42, 7
	db $80

.frame_72
	frame_oam -14,  -8, $52, 3
	frame_oam -14,   0, $52, 3 | OAMF_XFLIP
	frame_oam  -2,  -8, $52, 3
	frame_oam  -2,   0, $52, 3 | OAMF_XFLIP
	db $80

.frame_73
	frame_oam -14,  -8, $54, 3
	frame_oam -14,   0, $54, 3 | OAMF_XFLIP
	frame_oam  -2,  -8, $54, 3
	frame_oam  -2,   0, $54, 3 | OAMF_XFLIP
	db $80

.frame_74
	frame_oam -14,  -8, $54, 3 | OAMF_YFLIP
	frame_oam -14,   0, $54, 3 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -2,  -8, $54, 3 | OAMF_YFLIP
	frame_oam  -2,   0, $54, 3 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_75
	frame_oam -14,  -8, $56, 3
	frame_oam -14,   0, $56, 3 | OAMF_XFLIP
	frame_oam  -2,  -8, $56, 3
	frame_oam  -2,   0, $56, 3 | OAMF_XFLIP
	db $80

.frame_76
	frame_oam  -8,  -8, $52, 3
	frame_oam  -8,   0, $52, 3 | OAMF_XFLIP
	db $80

.frame_77
	frame_oam  -8,  -8, $54, 3
	frame_oam  -8,   0, $54, 3 | OAMF_XFLIP
	db $80

.frame_78
	frame_oam  -8,  -8, $54, 3 | OAMF_YFLIP
	frame_oam  -8,   0, $54, 3 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_79
	frame_oam  -8,  -8, $56, 3
	frame_oam  -8,   0, $56, 3 | OAMF_XFLIP
	db $80

.frame_80
	frame_oam -16,  -8, $a4, 3
	frame_oam -16,   0, $a4, 3 | OAMF_XFLIP
	db $80

.frame_81
	frame_oam  -8,  -8, $a4, 3
	frame_oam  -8,   0, $a4, 3 | OAMF_XFLIP
	db $80

.frame_82
	frame_oam -10,  -8, $a4, 3
	frame_oam -10,   0, $a4, 3 | OAMF_XFLIP
	db $80

.frame_83
	frame_oam -12,  -8, $a4, 3
	frame_oam -12,   0, $a4, 3 | OAMF_XFLIP
	db $80

.frame_84
	frame_oam -14,  -8, $a4, 3
	frame_oam -14,   0, $a4, 3 | OAMF_XFLIP
	db $80

.frame_85
	frame_oam -15,  -8, $a4, 3
	frame_oam -15,   0, $a4, 3 | OAMF_XFLIP
	db $80

.frame_86
	frame_oam -16,  -8, $00, 5
	frame_oam -16,   0, $02, 5
	db $80

.frame_87
	frame_oam -16,  -8, $04, 5
	frame_oam -16,   0, $06, 5
	db $80

.frame_88
	frame_oam -16,  -8, $08, 5
	frame_oam -16,   0, $0a, 5
	db $80

.frame_89
	frame_oam -16,   0, $00, 5 | OAMF_XFLIP
	frame_oam -16,  -8, $02, 5 | OAMF_XFLIP
	db $80

.frame_90
	frame_oam -16,   0, $04, 5 | OAMF_XFLIP
	frame_oam -16,  -8, $06, 5 | OAMF_XFLIP
	db $80

.frame_91
	frame_oam -16,   0, $08, 5 | OAMF_XFLIP
	frame_oam -16,  -8, $0a, 5 | OAMF_XFLIP
	db $80

.frame_92
	frame_oam -16, -20, $0c, 5
	frame_oam -16, -12, $0e, 5
	frame_oam -16,  -4, $10, 5
	frame_oam -16,   4, $12, 5
	frame_oam -16,  12, $14, 5
	db $80

.frame_93
	frame_oam -16, -20, $16, 5
	frame_oam -16, -12, $18, 5
	frame_oam -16,  -4, $1a, 5
	frame_oam -16,   4, $1c, 5
	frame_oam -16,  12, $1e, 5
	db $80

.frame_94
	frame_oam -16,  12, $16, 5 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   4, $18, 5 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -4, $1a, 5 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -12, $1c, 5 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -20, $1e, 5 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_95
	frame_oam -16,  -4, $00, 0
	db $80

.frame_96
	frame_oam -16,  -8, $02, 0
	frame_oam -16,   0, $02, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_97
	frame_oam -22,  -4, $06, 5
	frame_oam -14, -12, $04, 5 | OAMF_YFLIP
	frame_oam  -6,  -4, $06, 5 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -14,   4, $04, 5 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_98
	frame_oam -23, -16, $08, 5
	frame_oam -24,  -8, $0a, 0
	frame_oam -24,   0, $0c, 0
	frame_oam -23,   8, $0e, 0
	frame_oam  -7, -16, $10, 0
	frame_oam  -8,   0, $0a, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -8,  -8, $0c, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -7,   8, $08, 5 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_99
	frame_oam -28,  11, $16, 0
	frame_oam  -2,  -5, $18, 0
	frame_oam -28, -13, $14, 0
	frame_oam  -8, -13, $14, 0 | OAMF_YFLIP
	frame_oam -31,   3, $14, 0 | OAMF_XFLIP
	frame_oam -12,   9, $10, 0 | OAMF_XFLIP
	frame_oam -19, -21, $12, 5
	frame_oam  -4,   3, $1a, 0
	db $80

.frame_100
	frame_oam -32, -22, $1c, 0 | OAMF_YFLIP
	frame_oam   0, -18, $1c, 0
	frame_oam -24,  14, $1e, 0
	frame_oam -12, -23, $1e, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   2,  13, $1c, 0 | OAMF_XFLIP
	db $80

.frame_101
	frame_oam -36,  19, $1c, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   4,  16, $1c, 0 | OAMF_XFLIP
	frame_oam  -3, -27, $1c, 0
	db $80

.frame_102
	frame_oam  -8,  -4, $a6, 0
	db $80

Frameset_a9e61:
	db $00,  2
	db $01,  2
	db $02,  2
	db $03,  2
	db $04,  2
	db $05,  2
	db $06,  2
	db $07,  2
	db $ff

Frameset_a9e72:
	db $08,  4
	db $ff

Frameset_a9e75:
	db $09,  5
	db $0a,  5
	db $ff

Frameset_a9e7a:
	db $0b, 10
	db $08, 10
	db $09, 10
	db $ff

; unreferenced
Frameset_a9e81:
	db $0c,  5
	db $0d,  5
	db $0e,  5
	db $0f,  5
	db $10,  5
	db $ff

Frameset_a9e8c:
	db $11,  2
	db $12,  2
	db $ff

Frameset_a9e91:
	db $11,  4
	db $ff

Frameset_a9e94:
	db $09,  4
	db $0a,  4
	db $ff

Frameset_a9e99:
	db $13,  3
	db $14,  4
	db $15,  6
	db $16,  5
	db $17,  5
	db $18,  5
	db $19,  5
	db $1a, 60
	db $ff

Frameset_a9eaa:
	db $1b,  4
	db $1c,  4
	db $1d,  4
	db $1e,  4
	db $ff

Frameset_a9eb3:
	db $1f,  5
	db $20,  5
	db $21,  5
	db $22,  5
	db $ff

Frameset_a9ebc:
	db $23,  4
	db $24,  4
	db $25,  4
	db $26,  4
	db $ff

Frameset_a9ec5:
	db $27,  4
	db $ff

Frameset_a9ec8:
	db $28,  4
	db $29,  4
	db $ff

Frameset_a9ecd:
	db $2a,  4
	db $ff

Frameset_a9ed0:
	db $2b,  4
	db $ff

Frameset_a9ed3:
	db $2c,  4
	db $2d,  4
	db $2e,  4
	db $2f,  4
	db $30,  4
	db $31,  4
	db $ff

Frameset_a9ee0:
	db $32,  4
	db $ff

Frameset_a9ee3:
	db $33,  4
	db $34,  4
	db $35,  4
	db $ff

Frameset_a9eea:
	db $36,  4
	db $37,  4
	db $38, 30
	db $ff

Frameset_a9ef1:
	db $38,  2
	db $1a,  2
	db $ff

Frameset_a9ef6:
	db $39,  4
	db $3a,  4
	db $32, 30
	db $ff

Frameset_a9efd:
	db $32,  2
	db $1a,  2
	db $ff

Frameset_a9f02:
	db $3b,  3
	db $3c,  2
	db $3d,  2
	db $3e,  1
	db $3c,  2
	db $ff

Frameset_a9f0d:
	db $3b,  2
	db $3f,  1
	db $3c,  2
	db $40,  1
	db $3d,  2
	db $41,  1
	db $3e,  1
	db $42,  1
	db $3c,  2
	db $43,  1
	db $3b,  2
	db $1a,  1
	db $3c,  2
	db $42,  1
	db $3d,  2
	db $41,  1
	db $3e,  1
	db $40,  1
	db $3c,  2
	db $3f,  1
	db $ff

Frameset_a9f36:
	db $44,  3
	db $1a,  1
	db $45,  3
	db $1a,  1
	db $46,  3
	db $1a,  1
	db $47,  3
	db $1a,  1
	db $ff

Frameset_a9f47:
	db $48,  1
	db $1a,  1
	db $48,  1
	db $1a,  1
	db $49,  1
	db $1a,  1
	db $49,  1
	db $1a,  1
	db $4a,  1
	db $1a,  1
	db $4a,  1
	db $1a,  1
	db $4b,  1
	db $1a,  1
	db $4b,  1
	db $1a,  1
	db $4e,  1
	db $1a,  1
	db $4f,  1
	db $1a,  1
	db $4c,  1
	db $1a,  1
	db $4d,  1
	db $ff

Frameset_a9f76:
	db $4e,  1
	db $1a,  1
	db $4f,  1
	db $1a,  1
	db $4c,  1
	db $1a,  1
	db $4d,  1
	db $1a,  1
	db $48,  1
	db $1a,  1
	db $48,  1
	db $1a,  1
	db $49,  1
	db $1a,  1
	db $49,  1
	db $1a,  1
	db $4a,  1
	db $1a,  1
	db $4a,  1
	db $1a,  1
	db $4b,  1
	db $1a,  1
	db $4b,  1
	db $1a,  1
	db $ff

Frameset_a9fa7:
	db $50,  4
	db $ff

Frameset_a9faa:
	db $51, 12
	db $52,  2
	db $53,  2
	db $54,  3
	db $50,  2
	db $55,  2
	db $50,  2
	db $55,  2
	db $ff

Frameset_a9fbb:
	db $56,  5
	db $57,  5
	db $58,  5
	db $ff

Frameset_a9fc2:
	db $59,  5
	db $5a,  5
	db $5b,  5
	db $ff

Frameset_a9fc9:
	db $5c,  4
	db $5d,  4
	db $5e,  4
	db $ff

Frameset_a9fd0:
	db $5f,  2
	db $60,  2
	db $61,  3
	db $62,  2
	db $63,  3
	db $64,  2
	db $65,  1
	db $ff

Frameset_a9fdf:
	db $66,  4
	db $ff

OAM_a9fe2:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16

.frame_0
	frame_oam -16,   0, $22, 7 | OAMF_BANK1
	frame_oam -16,  -8, $20, 7 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,   0, $24, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $24, 7 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,   0, $28, 5 | OAMF_BANK1
	frame_oam -16,  -8, $26, 5 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,   0, $2a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $2a, 5 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -16,   0, $2e, 5 | OAMF_BANK1
	frame_oam -16,  -8, $2c, 5 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16,   0, $32, 5 | OAMF_BANK1
	frame_oam -16,  -8, $30, 5 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16,   0, $36, 4 | OAMF_BANK1
	frame_oam -16,  -8, $34, 4 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16,   0, $3a, 4 | OAMF_BANK1
	frame_oam -16,  -8, $38, 4 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -16,  -5, $3c, 5 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -16,  -5, $3e, 0 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -16,   4, $44, 4 | OAMF_BANK1
	frame_oam -16,  -4, $42, 4 | OAMF_BANK1
	frame_oam -16, -12, $40, 4 | OAMF_BANK1
	db $80

.frame_11
	frame_oam -16,  -3, $3c, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -16,  -3, $3e, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -16,  -5, $3c, 4 | OAMF_BANK1
	db $80

.frame_14
	frame_oam -16,  -3, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -16,   4, $44, 5 | OAMF_BANK1
	frame_oam -16,  -4, $42, 5 | OAMF_BANK1
	frame_oam -16, -12, $40, 5 | OAMF_BANK1
	db $80

.frame_16
	frame_oam -16,   4, $44, 6 | OAMF_BANK1
	frame_oam -16,  -4, $42, 6 | OAMF_BANK1
	frame_oam -16, -12, $40, 6 | OAMF_BANK1
	db $80

Frameset_aa091:
	db $00,  4
	db $ff

Frameset_aa094:
	db $01,  4
	db $ff

Frameset_aa097:
	db $02,  4
	db $ff

Frameset_aa09a:
	db $03,  4
	db $ff

Frameset_aa09d:
	db $04,  4
	db $ff

; unreferenced
Frameset_aa0a0:
	db $05,  4
	db $ff

Frameset_aa0a3:
	db $06,  4
	db $ff

; unreferenced
Frameset_aa0a6:
	db $07,  4
	db $ff

Frameset_aa0a9:
	db $08, 10
	db $0d, 10
	db $ff

Frameset_aa0ae:
	db $09,  4
	db $ff

Frameset_aa0b1:
	db $0a,  4
	db $ff

Frameset_aa0b4:
	db $0b, 10
	db $0e, 10
	db $ff

Frameset_aa0b9:
	db $0c,  4
	db $ff

Frameset_aa0bc:
	db $05,  8
	db $06,  8
	db $ff

Frameset_aa0c1:
	db $07,  8
	db $04,  8
	db $ff

Frameset_aa0c6:
	db $0f,  4
	db $10,  1
	db $0a,  4
	db $10,  1
	db $ff

OAM_aa0cf:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23
	dw .frame_24
	dw .frame_25
	dw .frame_26
	dw .frame_27
	dw .frame_28
	dw .frame_29
	dw .frame_30
	dw .frame_31
	dw .frame_32
	dw .frame_33
	dw .frame_34
	dw .frame_35
	dw .frame_36
	dw .frame_37
	dw .frame_38
	dw .frame_39
	dw .frame_40

.frame_0
	frame_oam -16,  -8, $90, 0
	frame_oam -16,   0, $92, 0
	db $80

.frame_1
	frame_oam -16,  -8, $94, 0
	frame_oam -16,   0, $96, 0
	db $80

.frame_2
	frame_oam -16,  -8, $98, 0
	frame_oam -16,   0, $9a, 0
	db $80

.frame_3
	frame_oam -16,  -8, $9c, 0
	frame_oam -16,   0, $9e, 0
	db $80

.frame_4
	frame_oam   0,   0, $80, 5
	db $80

.frame_5
	frame_oam   0,   0, $82, 5
	db $80

.frame_6
	frame_oam  -8,   0, $82, 5 | OAMF_YFLIP
	db $80

.frame_7
	frame_oam   0,   0, $84, 5
	db $80

.frame_8
	frame_oam   0,   0, $84, 5 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -16,  -8, $86, 0
	frame_oam -16,   0, $88, 0
	db $80

.frame_10
	frame_oam -16,  -8, $60, 0 | OAMF_BANK1
	frame_oam -16,   0, $62, 0 | OAMF_BANK1
	db $80

.frame_11
	frame_oam -16,  -8, $64, 0 | OAMF_BANK1
	frame_oam -16,   0, $66, 0 | OAMF_BANK1
	db $80

.frame_12
	frame_oam -16,  -8, $68, 0 | OAMF_BANK1
	frame_oam -16,   0, $6a, 0 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -16,  -8, $6c, 0 | OAMF_BANK1
	frame_oam -16,   0, $6e, 0 | OAMF_BANK1
	db $80

.frame_14
	frame_oam -16,  -8, $70, 0 | OAMF_BANK1
	frame_oam -16,   0, $72, 0 | OAMF_BANK1
	db $80

.frame_15
	frame_oam -16,   0, $70, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $72, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -16,   0, $6c, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $6e, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -16,   0, $68, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $6a, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -16,   0, $64, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $66, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -16,  -8, $78, 4 | OAMF_BANK1
	frame_oam -16,   0, $7a, 4 | OAMF_BANK1
	db $80

.frame_20
	frame_oam -16,   0, $78, 1 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $7a, 1 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_21
	frame_oam -16,  -8, $7c, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   0, $7e, 5 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_22
	frame_oam -16,   0, $7c, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $7e, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -16,  -8, $74, 0 | OAMF_BANK1
	frame_oam -16,   0, $76, 0 | OAMF_BANK1
	db $80

.frame_24
	frame_oam -16,  -8, $50, 4 | OAMF_BANK1
	frame_oam -16,   0, $52, 4 | OAMF_BANK1
	db $80

.frame_25
	frame_oam -16,  -8, $54, 4 | OAMF_BANK1
	frame_oam -16,   0, $56, 4 | OAMF_BANK1
	db $80

.frame_26
	frame_oam -16,  -8, $58, 4 | OAMF_BANK1
	frame_oam -16,   0, $5a, 4 | OAMF_BANK1
	db $80

.frame_27
	frame_oam -16,  -8, $5c, 4 | OAMF_BANK1
	frame_oam -16,   0, $5e, 4 | OAMF_BANK1
	db $80

.frame_28
	frame_oam -16,   0, $58, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $5a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_29
	frame_oam -16,   0, $54, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $56, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_30
	frame_oam -16,   0, $a0, 1 | OAMF_BANK1
	db $80

.frame_31
	frame_oam -16,   0, $a2, 1 | OAMF_BANK1
	db $80

.frame_32
	frame_oam -16,   0, $a4, 1 | OAMF_BANK1
	db $80

.frame_33
	frame_oam -16,   0, $a6, 1 | OAMF_BANK1
	db $80

.frame_34
	frame_oam -16,   0, $a8, 1 | OAMF_BANK1
	db $80

.frame_35
	frame_oam -16,   0, $aa, 1 | OAMF_BANK1
	db $80

.frame_36
	frame_oam -16,   0, $ac, 1 | OAMF_BANK1
	db $80

.frame_37
	frame_oam -16,   0, $ae, 1 | OAMF_BANK1
	db $80

.frame_38
	frame_oam -16,   0, $b0, 1 | OAMF_BANK1
	db $80

.frame_39
	frame_oam -16,   0, $b2, 1 | OAMF_BANK1
	db $80

.frame_40
	frame_oam -16,   0, $b4, 1 | OAMF_BANK1
	db $80

Frameset_aa252:
	db $00,  4
	db $ff

; unreferenced
Frameset_aa255:
	db $01,  4
	db $ff

; unreferenced
Frameset_aa258:
	db $02,  4
	db $ff

; unreferenced
Frameset_aa25b:
	db $03,  4
	db $ff

Frameset_aa25e:
	db $04,  4
	db $ff

Frameset_aa261::
	db $05,  4
	db $ff

Frameset_aa264::
	db $06,  4
	db $ff

Frameset_aa267::
	db $07,  4
	db $ff

Frameset_aa26a::
	db $08,  4
	db $ff

; unreferenced
Frameset_aa26d:
	db $09,  4
	db $ff

; unreferenced
Frameset_aa270:
	db $0a,  8
	db $0b,  8
	db $0c,  8
	db $0d,  8
	db $0e,  8
	db $0f,  8
	db $10,  8
	db $11,  8
	db $12,  8
	db $0a,  8
	db $0b,  8
	db $0c,  8
	db $0d,  8
	db $0e,  8
	db $0f,  8
	db $10,  8
	db $11,  8
	db $12,  8
	db $0a,  8
	db $17,  3
	db $0a,  3
	db $17,  3
	db $0a,  3
	db $17,  3
	db $0a,  3
	db $17,  3
	db $0a,  3
	db $17,  3
	db $ff

; unreferenced
Frameset_aa2a9:
	db $13,  8
	db $16,  8
	db $14,  8
	db $15,  8
	db $ff

; unreferenced
Frameset_aa2b2:
	db $13,  8
	db $16,  8
	db $14,  8
	db $15,  8
	db $13,  8
	db $16,  8
	db $14,  8
	db $15,  8
	db $13,  8
	db $16,  8
	db $14,  8
	db $15,  8
	db $13,  8
	db $16,  8
	db $14,  8
	db $15,  8
	db $0a,  8
	db $0b,  8
	db $0c,  8
	db $0d,  8
	db $0e,  8
	db $0f,  8
	db $10,  8
	db $11,  8
	db $12,  8
	db $0a,  8
	db $17,  3
	db $0a,  3
	db $17,  3
	db $0a,  3
	db $17,  3
	db $0a,  3
	db $17,  3
	db $0a,  3
	db $17,  3
	db $0a, 12
	db $ff

Frameset_aa2fb:
	db $18,  9
	db $19,  9
	db $1a,  7
	db $1b,  6
	db $1c,  7
	db $1d,  9
	db $ff

; unreferenced
Frameset_aa308:
	db $1e,  4
	db $ff

; unreferenced
Frameset_aa30b:
	db $1f,  4
	db $ff

; unreferenced
Frameset_aa30e:
	db $20,  4
	db $ff

; unreferenced
Frameset_aa311:
	db $21,  4
	db $ff

; unreferenced
Frameset_aa314:
	db $22,  4
	db $ff

; unreferenced
Frameset_aa317:
	db $23,  4
	db $ff

; unreferenced
Frameset_aa31a:
	db $24,  4
	db $ff

; unreferenced
Frameset_aa31d:
	db $25,  4
	db $ff

; unreferenced
Frameset_aa320:
	db $26,  4
	db $ff

; unreferenced
Frameset_aa323:
	db $27,  4
	db $ff

; unreferenced
Frameset_aa326:
	db $28,  4
	db $ff

OAM_aa329:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19

.frame_0
	frame_oam -16,   0, $00, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $00, 0 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -17,   0, $04, 0 | OAMF_BANK1
	frame_oam -17,  -8, $02, 0 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -18,   0, $08, 0 | OAMF_BANK1
	frame_oam -18,  -8, $06, 0 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -17,  -8, $04, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,   0, $02, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -18,  -8, $08, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18,   0, $06, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16,   0, $0c, 0 | OAMF_BANK1
	frame_oam -16,  -8, $0a, 0 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -17,   0, $10, 0 | OAMF_BANK1
	frame_oam -17,  -8, $0e, 0 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -18,   0, $12, 0 | OAMF_BANK1
	frame_oam -18,  -8, $0e, 0 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -17,   0, $16, 0 | OAMF_BANK1
	frame_oam -17,  -8, $14, 0 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -18,   0, $18, 0 | OAMF_BANK1
	frame_oam -18,  -8, $14, 0 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -16,   0, $1e, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $1e, 0 | OAMF_BANK1
	db $80

.frame_11
	frame_oam -17,   0, $1c, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,  -8, $1e, 0 | OAMF_BANK1
	db $80

.frame_12
	frame_oam -18,  -8, $1e, 0 | OAMF_BANK1
	frame_oam -18,   0, $1a, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -17,  -8, $1c, 0 | OAMF_BANK1
	frame_oam -17,   0, $1e, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -18,   0, $1e, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18,  -8, $1a, 0 | OAMF_BANK1
	db $80

.frame_15
	frame_oam -16,  -8, $0c, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $0a, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -17,  -8, $10, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,   0, $0e, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -18,  -8, $12, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18,   0, $0e, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -17,  -8, $16, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,   0, $14, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -18,  -8, $18, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18,   0, $14, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

Frameset_aa405:
	db $00,  6
	db $01,  4
	db $02,  3
	db $01,  4
	db $00,  6
	db $03,  4
	db $04,  3
	db $03,  4
	db $ff

Frameset_aa416:
	db $05,  6
	db $06,  4
	db $07,  3
	db $06,  4
	db $05,  6
	db $08,  4
	db $09,  3
	db $08,  4
	db $ff

Frameset_aa427:
	db $0f,  6
	db $10,  4
	db $11,  3
	db $10,  4
	db $0f,  6
	db $12,  4
	db $13,  3
	db $12,  4
	db $ff

Frameset_aa438:
	db $0b,  5
	db $0c,  5
	db $0b,  5
	db $0d,  5
	db $0e,  5
	db $0d,  5
	db $ff

OAM_aa445:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16

.frame_0
	frame_oam -15,   0, $2a, 4 | OAMF_BANK1
	frame_oam  -4,  -4, $20, 5 | OAMF_BANK1
	frame_oam  -4,   4, $20, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -15,   0, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -4,  -4, $22, 5 | OAMF_BANK1
	frame_oam  -4,   4, $22, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -15,   0, $2a, 4 | OAMF_BANK1
	frame_oam  -4,  -4, $24, 0 | OAMF_BANK1
	frame_oam  -4,   4, $24, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -15,   0, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -4,  -4, $26, 4 | OAMF_BANK1
	frame_oam  -4,   4, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -15,   0, $28, 4 | OAMF_BANK1
	frame_oam  -4,  -4, $20, 4 | OAMF_BANK1
	frame_oam  -4,   4, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam  -7,   0, $28, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -4,  -4, $22, 5 | OAMF_BANK1
	frame_oam  -4,   4, $22, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -15,   0, $28, 4 | OAMF_BANK1
	frame_oam  -4,  -4, $24, 0 | OAMF_BANK1
	frame_oam  -4,   4, $24, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam  -7,   0, $28, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -4,  -4, $26, 0 | OAMF_BANK1
	frame_oam  -4,   4, $26, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam  -8,   0, $28, 5 | OAMF_BANK1
	frame_oam -15,   0, $2a, 4 | OAMF_BANK1
	frame_oam   7,   0, $2a, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_9
	frame_oam  -8,   0, $2a, 4 | OAMF_BANK1
	frame_oam  -6,   3, $28, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   6,  -3, $28, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_10
	frame_oam   0,   0, $28, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -10,   6, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -6,  -6, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam  -8,   0, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,   7, $28, 4 | OAMF_BANK1
	frame_oam  -8,  -7, $28, 4 | OAMF_BANK1
	db $80

.frame_12
	frame_oam  -8,   0, $28, 5 | OAMF_BANK1
	frame_oam   2,   6, $2a, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -10,  -6, $2a, 4 | OAMF_BANK1
	db $80

.frame_13
	frame_oam  -8,   0, $2a, 4 | OAMF_BANK1
	frame_oam  -6,  -3, $28, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   6,   3, $28, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_14
	frame_oam  -8,   0, $28, 5 | OAMF_BANK1
	frame_oam -19,   0, $2a, 4 | OAMF_BANK1
	frame_oam  11,   0, $2a, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_15
	frame_oam  -8,   0, $2a, 4 | OAMF_BANK1
	frame_oam -15,   4, $28, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  15,  -4, $28, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_16
	frame_oam   0,   0, $28, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -27,   8, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  19,  -8, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

Frameset_aa544:
	db $04,  2
	db $00,  2
	db $05,  2
	db $01,  2
	db $06,  2
	db $02,  2
	db $07,  2
	db $03,  2
	db $ff

Frameset_aa555:
	db $08,  3
	db $09,  3
	db $0a,  3
	db $0b,  3
	db $0c,  3
	db $0d,  3
	db $08,  2
	db $09,  2
	db $0a,  2
	db $0b,  2
	db $0c,  2
	db $0d,  2
	db $08,  2
	db $09,  2
	db $0a,  2
	db $0b,  1
	db $0c,  1
	db $0d,  1
	db $0e,  1
	db $0f,  1
	db $10,  1
	db $ff

OAM_aa580:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6

.frame_0
	frame_oam  -8,  -4, $48, 5 | OAMF_BANK1 | OAMF_PRI
	frame_oam  -8,  -8, $46, 1 | OAMF_BANK1 | OAMF_PRI
	frame_oam  -8,   0, $46, 1 | OAMF_BANK1 | OAMF_XFLIP | OAMF_PRI
	db $80

.frame_1
	frame_oam -12,  -8, $4a, 5 | OAMF_BANK1 | OAMF_PRI
	frame_oam  -8,  -8, $46, 1 | OAMF_BANK1 | OAMF_PRI
	frame_oam  -8,   0, $46, 1 | OAMF_BANK1 | OAMF_XFLIP | OAMF_PRI
	db $80

.frame_2
	frame_oam  -8,  -4, $4c, 5 | OAMF_BANK1 | OAMF_PRI
	frame_oam  -8,  -8, $46, 1 | OAMF_BANK1 | OAMF_PRI
	frame_oam  -8,   0, $46, 1 | OAMF_BANK1 | OAMF_XFLIP | OAMF_PRI
	db $80

.frame_3
	frame_oam -12,   0, $4e, 5 | OAMF_BANK1 | OAMF_PRI
	frame_oam  -8,  -8, $46, 1 | OAMF_BANK1 | OAMF_PRI
	frame_oam  -8,   0, $46, 1 | OAMF_BANK1 | OAMF_XFLIP | OAMF_PRI
	db $80

.frame_4
	frame_oam -16,  -8, $96, 0 | OAMF_BANK1
	frame_oam -16,   0, $98, 0 | OAMF_BANK1
	frame_oam -16,   8, $9a, 0 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16,  -8, $b6, 5 | OAMF_BANK1
	frame_oam -16,   0, $b8, 5 | OAMF_BANK1
	frame_oam -16,   8, $ba, 5 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16,   8, $9a, 0 | OAMF_BANK1
	frame_oam -16,  -8, $9c, 0 | OAMF_BANK1
	frame_oam -16,   0, $9e, 0 | OAMF_BANK1
	db $80

; unreferenced
Frameset_aa5e9:
	db $00,  4
	db $ff

; unreferenced
Frameset_aa5ec:
	db $01,  4
	db $ff

; unreferenced
Frameset_aa5ef:
	db $02,  4
	db $ff

; unreferenced
Frameset_aa5f2:
	db $03,  4
	db $ff

Frameset_aa5f5:
	db $04,  4
	db $ff

Frameset_aa5f8:
	db $05,  4
	db $ff

; unreferenced
Frameset_aa5fb:
	db $06,  4
	db $ff

OAM_aa5fe:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4

.frame_0
	frame_oam -32,   6, $0e, 0 | OAMF_XFLIP
	frame_oam -32,  -1, $10, 0 | OAMF_XFLIP
	frame_oam -32,  -9, $12, 0 | OAMF_XFLIP
	frame_oam -16,   7, $2e, 0 | OAMF_XFLIP
	frame_oam -16,  -1, $30, 0 | OAMF_XFLIP
	frame_oam -16,  -9, $32, 0 | OAMF_XFLIP
	frame_oam -21, -17, $14, 0 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -16,  -8, $36, 0
	frame_oam -16,   0, $36, 0 | OAMF_XFLIP
	frame_oam -16, -16, $34, 0
	frame_oam -16,   8, $34, 0 | OAMF_XFLIP
	frame_oam -32,   0, $18, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $1a, 0 | OAMF_XFLIP
	frame_oam -32,   7, $0e, 0 | OAMF_XFLIP
	frame_oam -32, -16, $0e, 0
	db $80

.frame_2
	frame_oam -32,  -8, $16, 0
	frame_oam -16,  -8, $36, 0
	frame_oam -32,   0, $16, 0 | OAMF_XFLIP
	frame_oam -16,   0, $36, 0 | OAMF_XFLIP
	frame_oam -16, -16, $34, 0
	frame_oam -16,   8, $34, 0 | OAMF_XFLIP
	frame_oam -32, -16, $00, 0
	frame_oam -32,   8, $00, 0 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -16,   0, $36, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $36, 0
	frame_oam -16,   8, $34, 0 | OAMF_XFLIP
	frame_oam -16, -16, $34, 0
	frame_oam -32,  -8, $18, 0
	frame_oam -32,   0, $1a, 0
	frame_oam -32, -15, $0e, 0
	frame_oam -32,   8, $0e, 0 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -32, -14, $0e, 0
	frame_oam -32,  -7, $10, 0
	frame_oam -32,   1, $12, 0
	frame_oam -16, -15, $2e, 0
	frame_oam -16,  -7, $30, 0
	frame_oam -16,   1, $32, 0
	frame_oam -21,   9, $14, 0
	db $80

Frameset_aa6a5::
	db $01,  5
	db $00, 30
	db $01,  5
	db $02,  4
	db $03,  5
	db $04, 40
	db $03,  5
	db $02,  4
	db $01,  5
	db $00,  8
	db $01,  5
	db $02,  4
	db $03,  5
	db $04,  8
	db $ff

Frameset_aa6c2::
	db $03,  5
	db $02,  4
	db $ff

Frameset_aa6c7::
	db $02,  4
	db $ff

Frameset_aa6ca::
	db $03,  5
	db $04, 30
	db $03,  5
	db $02,  4
	db $01,  5
	db $00, 40
	db $01,  5
	db $02,  4
	db $03,  5
	db $04,  8
	db $03,  5
	db $02,  4
	db $01,  5
	db $00,  8
	db $ff

OAM_aa6e7:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18

.frame_0
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32,   4, $04, 0
	frame_oam -16, -12, $20, 0
	frame_oam -16,  -4, $22, 0
	frame_oam -16,   4, $24, 0
	frame_oam -20, -16, $0a, 2
	db $80

.frame_1
	frame_oam -32, -12, $06, 0
	frame_oam -32,  -4, $08, 0
	frame_oam -16, -12, $26, 0
	frame_oam -16,  -4, $28, 0
	frame_oam -16,   4, $2a, 0
	frame_oam -32,   4, $04, 0
	frame_oam -20, -16, $10, 2
	db $80

.frame_2
	frame_oam -32, -12, $0c, 0
	frame_oam -32,  -4, $0e, 0
	frame_oam -16, -12, $2c, 0
	frame_oam -16,  -4, $2e, 0
	frame_oam -16,   4, $30, 0
	frame_oam -32,   4, $04, 0
	frame_oam -20, -16, $1e, 2
	db $80

.frame_3
	frame_oam -32, -12, $0c, 0
	frame_oam -32,  -4, $0e, 0
	frame_oam -16, -12, $2c, 0
	frame_oam -16,  -4, $2e, 0
	frame_oam -16,   4, $30, 0
	frame_oam -32,   4, $04, 0
	frame_oam -20, -16, $3e, 2
	db $80

.frame_4
	frame_oam -30, -13, $12, 0
	frame_oam -30,  -5, $14, 0
	frame_oam -30,   3, $16, 0
	frame_oam -14, -13, $32, 0
	frame_oam -14,  -5, $34, 0
	frame_oam -14,   3, $36, 0
	db $80

.frame_5
	frame_oam -33, -13, $12, 0
	frame_oam -33,  -5, $14, 0
	frame_oam -33,   3, $16, 0
	frame_oam -17, -13, $32, 0
	frame_oam -17,  -5, $34, 0
	frame_oam -17,   3, $36, 0
	db $80

.frame_6
	frame_oam -32, -13, $18, 0
	frame_oam -32,  -5, $1a, 0
	frame_oam -32,   3, $1c, 0
	frame_oam -16, -13, $38, 0
	frame_oam -16,  -5, $3a, 0
	frame_oam -16,   3, $3c, 0
	db $80

.frame_7
	frame_oam -36, -12, $40, 0
	frame_oam -36,  -4, $42, 0
	frame_oam -27,   4, $44, 0
	frame_oam -20, -12, $46, 0
	frame_oam -20,  -4, $48, 0
	db $80

.frame_8
	frame_oam -28, -16, $54, 0
	frame_oam -36,  -8, $56, 0
	frame_oam -36,   0, $58, 0
	frame_oam -28,   8, $5a, 0
	frame_oam -20,  -8, $5c, 0
	frame_oam -20,   0, $5e, 0
	db $80

.frame_9
	frame_oam -24,  -5, $4c, 0
	frame_oam -24,   3, $4e, 0
	frame_oam -24, -13, $4a, 0
	frame_oam  -8,  -5, $50, 0
	frame_oam  -8,   3, $52, 0
	db $80

.frame_10
	frame_oam -11,   4, $40, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -11,  -4, $42, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -20, -12, $44, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -27,   4, $46, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -27,  -4, $48, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_11
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32,   4, $04, 0
	frame_oam -16, -12, $20, 0
	frame_oam -16,  -4, $22, 0
	frame_oam -16,   4, $24, 0
	db $80

.frame_12
	frame_oam -32, -12, $72, 0
	frame_oam -32,  -4, $74, 0
	frame_oam -32,   4, $76, 0
	frame_oam -16, -12, $6c, 0
	frame_oam -16,  -4, $78, 0
	frame_oam -16,   4, $7a, 0
	db $80

.frame_13
	frame_oam -32, -12, $60, 0
	frame_oam -32,  -4, $62, 0
	frame_oam -32,   4, $64, 0
	frame_oam -16, -12, $6c, 0
	frame_oam -16,  -4, $6e, 0
	frame_oam -16,   4, $70, 0
	db $80

.frame_14
	frame_oam -16, -12, $6c, 0
	frame_oam -16,  -4, $6e, 0
	frame_oam -16,   4, $70, 0
	frame_oam -32,   4, $68, 0
	frame_oam -32, -12, $60, 0
	frame_oam -32,  -4, $6a, 0
	db $80

.frame_15
	frame_oam -16, -12, $6c, 0
	frame_oam -16,  -4, $6e, 0
	frame_oam -16,   4, $70, 0
	frame_oam -32,   4, $68, 0
	frame_oam -32, -12, $60, 0
	frame_oam -32,  -4, $66, 0
	db $80

.frame_16
	frame_oam -30,   5, $12, 0 | OAMF_XFLIP
	frame_oam -30,  -3, $14, 0 | OAMF_XFLIP
	frame_oam -30, -11, $16, 0 | OAMF_XFLIP
	frame_oam -14,   5, $32, 0 | OAMF_XFLIP
	frame_oam -14,  -3, $34, 0 | OAMF_XFLIP
	frame_oam -14, -11, $36, 0 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -33,   5, $12, 0 | OAMF_XFLIP
	frame_oam -33,  -3, $14, 0 | OAMF_XFLIP
	frame_oam -33, -11, $16, 0 | OAMF_XFLIP
	frame_oam -17,   5, $32, 0 | OAMF_XFLIP
	frame_oam -17,  -3, $34, 0 | OAMF_XFLIP
	frame_oam -17, -11, $36, 0 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -32,   5, $18, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $1a, 0 | OAMF_XFLIP
	frame_oam -32, -11, $1c, 0 | OAMF_XFLIP
	frame_oam -16,   5, $38, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $3a, 0 | OAMF_XFLIP
	frame_oam -16, -11, $3c, 0 | OAMF_XFLIP
	db $80

Frameset_aa8ec::
	db $00,  2
	db $01,  2
	db $02,  2
	db $03,  2
	db $ff

Frameset_aa8f5::
	db $04,  2
	db $05,  2
	db $04,  2
	db $05,  2
	db $04,  2
	db $06,  4
	db $ff

Frameset_aa902::
	db $07,  3
	db $08,  5
	db $09,  3
	db $0a,  3
	db $0b,  6
	db $ff

Frameset_aa90d::
	db $06,  4
	db $ff

; unreferenced
Frameset_aa910:
	db $0c,  4
	db $ff

Frameset_aa913::
	db $0d, 12
	db $0e,  4
	db $0f,  2
	db $0e,  2
	db $0f, 40
	db $0c, 20
	db $0d, 12
	db $0c, 40
	db $ff

Frameset_aa924::
	db $10,  2
	db $11,  2
	db $10,  2
	db $11,  2
	db $10,  2
	db $12,  4
	db $ff

Frameset_aa931::
	db $12,  4
	db $ff

OAM_aa934:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16

.frame_0
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32,   4, $04, 0
	frame_oam -16, -12, $06, 0
	frame_oam -16,  -4, $08, 0
	frame_oam -16,   4, $0a, 0
	db $80

.frame_1
	frame_oam -31, -12, $0c, 0
	frame_oam -31,  -4, $0e, 0
	frame_oam -31,   4, $10, 0
	frame_oam -15, -12, $12, 0
	frame_oam -15,  -4, $14, 0
	frame_oam -15,   4, $16, 0
	db $80

.frame_2
	frame_oam -31,  -9, $18, 0
	frame_oam -31,  -1, $1a, 0
	frame_oam -31,   7, $1c, 0
	frame_oam -15,  -3, $1e, 0
	frame_oam -15,   5, $20, 0
	frame_oam -15, -11, $12, 0
	db $80

.frame_3
	frame_oam -32, -10, $22, 0
	frame_oam -32,  -2, $24, 0
	frame_oam -32,   6, $1c, 0
	frame_oam -16, -10, $26, 0
	frame_oam -16,  -2, $28, 0
	frame_oam -16,   6, $2a, 0
	db $80

.frame_4
	frame_oam -32,  -9, $2c, 0
	frame_oam -32,  -1, $2e, 0
	frame_oam -32,   7, $30, 0
	frame_oam -16,  -9, $32, 0
	frame_oam -16,  -1, $34, 0
	frame_oam -16,   7, $36, 0
	db $80

.frame_5
	frame_oam -32,  -9, $2c, 0
	frame_oam -32,   7, $30, 0
	frame_oam -16,  -9, $32, 0
	frame_oam -16,  -1, $34, 0
	frame_oam -16,   7, $36, 0
	frame_oam -32,  -1, $38, 0
	db $80

.frame_6
	frame_oam -32,  -9, $3a, 0
	frame_oam -32,  -1, $3c, 0
	frame_oam -23,   7, $3e, 0
	frame_oam -16,  -9, $40, 0
	frame_oam -16,  -1, $42, 0
	db $80

.frame_7
	frame_oam -32,  -9, $3a, 0
	frame_oam -32,  -1, $3c, 0
	frame_oam -16,  -9, $44, 0
	frame_oam -16,  -1, $46, 0
	frame_oam -21,   7, $48, 0
	db $80

.frame_8
	frame_oam -32, -12, $60, 0
	frame_oam -32,  -4, $62, 0
	frame_oam -32,   4, $64, 0
	frame_oam -16, -12, $66, 0
	frame_oam -16,  -4, $68, 0
	frame_oam -16,   4, $6a, 0
	db $80

.frame_9
	frame_oam -32,   4, $64, 0
	frame_oam -32, -12, $6c, 0
	frame_oam -32,  -4, $6e, 0
	frame_oam -16, -12, $70, 0
	frame_oam -16,  -4, $72, 0
	frame_oam -16,   4, $74, 0
	db $80

.frame_10
	frame_oam -32,   4, $64, 0
	frame_oam -32, -12, $6c, 0
	frame_oam -16, -12, $70, 0
	frame_oam -32,  -4, $76, 0
	frame_oam -16,  -4, $78, 0
	frame_oam -16,   4, $7a, 0
	db $80

.frame_11
	frame_oam -36,  -2, $4e, 2
	frame_oam -32, -12, $6c, 0
	frame_oam -16, -12, $70, 0
	frame_oam -32,  -4, $7c, 0
	frame_oam -32,   4, $7e, 0
	frame_oam -16,  -4, $4a, 0
	frame_oam -16,   4, $4c, 0
	db $80

.frame_12
	frame_oam -41,  -5, $50, 2
	frame_oam -40,   7, $4e, 2
	frame_oam -32, -12, $6c, 0
	frame_oam -16, -12, $70, 0
	frame_oam -32,  -4, $7c, 0
	frame_oam -32,   4, $7e, 0
	frame_oam -16,  -4, $4a, 0
	frame_oam -16,   4, $4c, 0
	db $80

.frame_13
	frame_oam -36,  -8, $4e, 2 | OAMF_YFLIP
	frame_oam -42,   9, $50, 2
	frame_oam -46,   2, $4e, 2
	frame_oam -32, -12, $6c, 0
	frame_oam -16, -12, $70, 0
	frame_oam -32,  -4, $7c, 0
	frame_oam -32,   4, $7e, 0
	frame_oam -16,  -4, $4a, 0
	frame_oam -16,   4, $4c, 0
	db $80

.frame_14
	frame_oam -38,  12, $4e, 2 | OAMF_YFLIP
	frame_oam -50, -12, $50, 2 | OAMF_XFLIP
	frame_oam -32, -12, $6c, 0
	frame_oam -16, -12, $70, 0
	frame_oam -32,  -4, $7c, 0
	frame_oam -32,   4, $7e, 0
	frame_oam -16,  -4, $4a, 0
	frame_oam -16,   4, $4c, 0
	frame_oam -52,   3, $50, 2
	db $80

.frame_15
	frame_oam -48,   3, $4e, 2 | OAMF_YFLIP
	frame_oam -32, -12, $6c, 0
	frame_oam -16, -12, $70, 0
	frame_oam -32,  -4, $7c, 0
	frame_oam -32,   4, $7e, 0
	frame_oam -16,  -4, $4a, 0
	frame_oam -16,   4, $4c, 0
	frame_oam -47,  15, $50, 2 | OAMF_XFLIP
	frame_oam -52, -14, $4e, 2
	db $80

.frame_16
	frame_oam -32, -12, $6c, 0
	frame_oam -16, -12, $70, 0
	frame_oam -32,  -4, $7c, 0
	frame_oam -32,   4, $7e, 0
	frame_oam -16,  -4, $4a, 0
	frame_oam -16,   4, $4c, 0
	db $80

Frameset_aab27::
	db $00, 20
	db $01,  6
	db $02,  2
	db $03,  4
	db $04,  3
	db $ff

Frameset_aab32::
	db $04,  3
	db $05,  5
	db $04,  3
	db $05, 60
	db $06, 10
	db $07, 60
	db $ff

Frameset_aab3f::
	db $04,  4
	db $ff

Frameset_aab42::
	db $07,  4
	db $ff

Frameset_aab45::
	db $08,  4
	db $09,  5
	db $0a, 10
	db $0b,  2
	db $0c,  2
	db $0d,  2
	db $0e,  2
	db $0f,  2
	db $10, 30
	db $09,  8
	db $08,  6
	db $ff

OAM_aab5c::
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20

.frame_0
	frame_oam -16,   8, $00, 0 | OAMF_XFLIP
	frame_oam -16, -16, $06, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $08, 0 | OAMF_XFLIP
	frame_oam -16,   0, $02, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $04, 0 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -16, -16, $06, 0 | OAMF_XFLIP
	frame_oam -16,   8, $00, 0 | OAMF_XFLIP
	frame_oam -16,   0, $0a, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $0c, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $0e, 0 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -18,   0, $20, 0 | OAMF_XFLIP
	frame_oam -17, -16, $06, 0 | OAMF_XFLIP
	frame_oam -17,   8, $1e, 0 | OAMF_XFLIP
	frame_oam -17,  -8, $22, 0 | OAMF_XFLIP
	frame_oam -33,  -8, $24, 0 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -33,   8, $26, 0 | OAMF_XFLIP
	frame_oam -33,   0, $28, 0 | OAMF_XFLIP
	frame_oam -33,  -8, $2a, 0 | OAMF_XFLIP
	frame_oam -23, -16, $2c, 0 | OAMF_XFLIP
	frame_oam -17,   8, $2e, 0 | OAMF_XFLIP
	frame_oam -17,   0, $30, 0 | OAMF_XFLIP
	frame_oam -17,  -8, $32, 0 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -16,   0, $20, 0 | OAMF_XFLIP
	frame_oam -16, -16, $06, 0 | OAMF_XFLIP
	frame_oam -16,   8, $1e, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $22, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $40, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16,   8, $10, 0 | OAMF_XFLIP
	frame_oam -32,   0, $12, 0 | OAMF_XFLIP
	frame_oam -16,   0, $14, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $16, 0 | OAMF_XFLIP
	frame_oam -16, -16, $18, 0 | OAMF_XFLIP
	frame_oam -32,  -9, $1c, 0 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -16,   0, $02, 0 | OAMF_XFLIP
	frame_oam -16,   8, $10, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $16, 0 | OAMF_XFLIP
	frame_oam -16, -16, $18, 0 | OAMF_XFLIP
	frame_oam -32,  -9, $1a, 0 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -17,   4, $46, 0 | OAMF_XFLIP
	frame_oam -17,  -4, $48, 0 | OAMF_XFLIP
	frame_oam -17, -12, $4a, 0 | OAMF_XFLIP
	frame_oam -33,  -1, $42, 0 | OAMF_XFLIP
	frame_oam -33,  -9, $44, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -32,   4, $34, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $36, 0 | OAMF_XFLIP
	frame_oam -32, -12, $38, 0 | OAMF_XFLIP
	frame_oam -16,   4, $3a, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $3c, 0 | OAMF_XFLIP
	frame_oam -16, -12, $3e, 0 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -32, -12, $38, 0 | OAMF_XFLIP
	frame_oam -16, -12, $3e, 0 | OAMF_XFLIP
	frame_oam -32,   4, $4c, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $4e, 0 | OAMF_XFLIP
	frame_oam -16,   4, $54, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $56, 0 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -32, -12, $38, 0 | OAMF_XFLIP
	frame_oam -16, -12, $3e, 0 | OAMF_XFLIP
	frame_oam -32,   4, $4c, 0 | OAMF_XFLIP
	frame_oam -16,   4, $54, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $56, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $50, 0 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -32, -12, $38, 0 | OAMF_XFLIP
	frame_oam -16, -12, $3e, 0 | OAMF_XFLIP
	frame_oam -32,   4, $4c, 0 | OAMF_XFLIP
	frame_oam -16,   4, $54, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $56, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $52, 0 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -40,  -8, $58, 0
	db $80

.frame_13
	frame_oam -43,  -7, $58, 0
	db $80

.frame_14
	frame_oam -45,  -6, $58, 0
	db $80

.frame_15
	frame_oam -47,  -6, $5a, 2
	db $80

.frame_16
	frame_oam -48,  -8, $5c, 2
	db $80

.frame_17
	frame_oam -50,  -9, $5a, 2
	db $80

.frame_18
	frame_oam -52, -11, $58, 0
	db $80

.frame_19
	frame_oam -54, -10, $58, 0
	db $80

.frame_20
	frame_oam -56, -10, $58, 0
	db $80

Frameset_aaccb::
	db $05,  3
	db $06,  2
	db $05,  3
	db $06,  2
	db $05, 24
	db $00, 12
	db $01, 24
	db $00, 10
	db $06,  4
	db $05,  3
	db $06,  2
	db $ff

Frameset_aace2::
	db $05,  4
	db $06,  3
	db $00,  4
	db $01, 10
	db $02,  3
	db $04,  2
	db $03,  6
	db $04,  6
	db $07,  4
	db $08, 30
	db $ff

Frameset_aacf7::
	db $08,  4
	db $ff

Frameset_aacfa::
	db $09, 24
	db $0a,  3
	db $0b,  4
	db $0a,  2
	db $09,  4
	db $0a,  3
	db $0b,  4
	db $0a,  2
	db $ff

Frameset_aad0b:
	db $0c,  8
	db $0d,  8
	db $0e,  8
	db $0f,  8
	db $10,  8
	db $11,  8
	db $12,  8
	db $13,  8
	db $14,  8
	db $ff

OAM_aad1e:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21

.frame_0
	frame_oam -32, -16, $00, 0
	frame_oam -32,  -8, $02, 0
	frame_oam -32,   8, $00, 0 | OAMF_XFLIP
	frame_oam -32,   0, $02, 0 | OAMF_XFLIP
	frame_oam -16, -16, $04, 0
	frame_oam -16,  -8, $06, 0
	frame_oam -16,   8, $04, 0 | OAMF_XFLIP
	frame_oam -16,   0, $06, 0 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -32, -16, $08, 0
	frame_oam -32,  -8, $0a, 0
	frame_oam -32,   8, $08, 0 | OAMF_XFLIP
	frame_oam -32,   0, $0a, 0 | OAMF_XFLIP
	frame_oam -16, -16, $0c, 0
	frame_oam -16,  -8, $0e, 0
	frame_oam -16,   8, $0c, 0 | OAMF_XFLIP
	frame_oam -16,   0, $0e, 0 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -32, -16, $10, 0
	frame_oam -32,  -8, $12, 0
	frame_oam -32,   8, $10, 0 | OAMF_XFLIP
	frame_oam -32,   0, $12, 0 | OAMF_XFLIP
	frame_oam -16, -16, $14, 0
	frame_oam -16,  -8, $16, 0
	frame_oam -16,   8, $14, 0 | OAMF_XFLIP
	frame_oam -16,   0, $16, 0 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -32, -16, $18, 0
	frame_oam -32,  -8, $1a, 0
	frame_oam -16, -16, $1c, 0
	frame_oam -16,  -8, $1e, 0
	frame_oam -32,   8, $18, 0 | OAMF_XFLIP
	frame_oam -32,   0, $1a, 0 | OAMF_XFLIP
	frame_oam -16,   8, $1c, 0 | OAMF_XFLIP
	frame_oam -16,   0, $1e, 0 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -36, -16, $18, 0
	frame_oam -36,  -8, $1a, 0
	frame_oam -20, -16, $1c, 0
	frame_oam -20,  -8, $1e, 0
	frame_oam -36,   8, $18, 0 | OAMF_XFLIP
	frame_oam -36,   0, $1a, 0 | OAMF_XFLIP
	frame_oam -20,   8, $1c, 0 | OAMF_XFLIP
	frame_oam -20,   0, $1e, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -35, -16, $18, 0
	frame_oam -35,  -8, $1a, 0
	frame_oam -35,   0, $20, 0
	frame_oam -35,   8, $22, 0
	frame_oam -19, -16, $24, 0
	frame_oam -19,  -8, $26, 0
	frame_oam -19,   0, $28, 0
	frame_oam -19,   8, $2a, 0
	db $80

.frame_6
	frame_oam -35,   8, $18, 0 | OAMF_XFLIP
	frame_oam -35,   0, $1a, 0 | OAMF_XFLIP
	frame_oam -35,  -8, $20, 0 | OAMF_XFLIP
	frame_oam -35, -16, $22, 0 | OAMF_XFLIP
	frame_oam -19,   8, $24, 0 | OAMF_XFLIP
	frame_oam -19,   0, $26, 0 | OAMF_XFLIP
	frame_oam -19,  -8, $28, 0 | OAMF_XFLIP
	frame_oam -19, -16, $2a, 0 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -32, -16, $2c, 0
	frame_oam -32,  -8, $2e, 0
	frame_oam -32,   8, $2c, 0 | OAMF_XFLIP
	frame_oam -32,   0, $2e, 0 | OAMF_XFLIP
	frame_oam -16, -16, $30, 0
	frame_oam -16,  -8, $32, 0
	frame_oam -16,   8, $30, 0 | OAMF_XFLIP
	frame_oam -16,   0, $32, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -32, -12, $34, 0
	frame_oam -32,  -4, $36, 0
	frame_oam -32,   4, $34, 0 | OAMF_XFLIP
	frame_oam -16, -16, $38, 0
	frame_oam -16,  -8, $3a, 0
	frame_oam -16,   8, $38, 0 | OAMF_XFLIP
	frame_oam -16,   0, $3a, 0 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -32, -12, $3c, 0
	frame_oam -32,  -4, $3e, 0
	frame_oam -32,   4, $3c, 0 | OAMF_XFLIP
	frame_oam -16, -16, $40, 0
	frame_oam -16,  -8, $42, 0
	frame_oam -16,   8, $40, 0 | OAMF_XFLIP
	frame_oam -16,   0, $42, 0 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -32, -12, $44, 0
	frame_oam -32,  -4, $46, 0
	frame_oam -32,   4, $48, 0
	frame_oam -16, -15, $4a, 0
	frame_oam -16,  -7, $4c, 0
	frame_oam -16,   1, $4e, 0
	frame_oam -16,   9, $50, 0
	db $80

.frame_11
	frame_oam -32, -11, $52, 0
	frame_oam -32,  -3, $54, 0
	frame_oam -32,   5, $56, 0
	frame_oam -16, -14, $58, 0
	frame_oam -16,  -6, $5a, 0
	frame_oam -16,   2, $5c, 0
	frame_oam -16,  10, $5e, 0
	db $80

.frame_12
	frame_oam -32, -11, $52, 0
	frame_oam -32,  -3, $54, 0
	frame_oam -16, -14, $58, 0
	frame_oam -16,  -6, $5a, 0
	frame_oam -16,   2, $64, 0
	frame_oam -16,  10, $66, 0
	frame_oam -32,   5, $60, 0
	frame_oam -32,  13, $62, 0
	db $80

.frame_13
	frame_oam -32, -11, $52, 0
	frame_oam -16, -14, $58, 0
	frame_oam -16,  -6, $5a, 0
	frame_oam -32,  -3, $68, 0
	frame_oam -32,   5, $6a, 0
	frame_oam -32,  13, $6c, 0
	frame_oam -16,   2, $6e, 0
	frame_oam -16,  10, $70, 0
	db $80

.frame_14
	frame_oam -32, -11, $52, 0
	frame_oam -16, -14, $58, 0
	frame_oam -16,  -6, $5a, 0
	frame_oam -32,  -3, $68, 0
	frame_oam -16,   2, $6e, 0
	frame_oam -16,  10, $70, 0
	frame_oam -32,   5, $72, 0
	frame_oam -32,  13, $74, 0
	db $80

.frame_15
	frame_oam -32, -11, $52, 0
	frame_oam -16, -14, $58, 0
	frame_oam -16,  -6, $5a, 0
	frame_oam -32,  -3, $68, 0
	frame_oam -16,   2, $6e, 0
	frame_oam -16,  10, $70, 0
	frame_oam -32,   5, $76, 0
	frame_oam -32,  13, $78, 0
	frame_oam -48,  13, $7a, 2
	db $80

.frame_16
	frame_oam -32, -11, $52, 0
	frame_oam -16, -14, $58, 0
	frame_oam -16,  -6, $5a, 0
	frame_oam -32,  -3, $68, 0
	frame_oam -16,   2, $6e, 0
	frame_oam -16,  10, $70, 0
	frame_oam -32,   5, $76, 0
	frame_oam -32,  13, $78, 0
	frame_oam -51,  14, $7c, 2
	frame_oam -47,   5, $7a, 2
	db $80

.frame_17
	frame_oam -32, -11, $52, 0
	frame_oam -16, -14, $58, 0
	frame_oam -16,  -6, $5a, 0
	frame_oam -32,  -3, $68, 0
	frame_oam -16,   2, $6e, 0
	frame_oam -16,  10, $70, 0
	frame_oam -32,   5, $76, 0
	frame_oam -32,  13, $78, 0
	frame_oam -49,   2, $7c, 2
	frame_oam -49,  17, $7a, 2 | OAMF_YFLIP
	db $80

.frame_18
	frame_oam -32, -11, $52, 0
	frame_oam -16, -14, $58, 0
	frame_oam -16,  -6, $5a, 0
	frame_oam -32,  -3, $68, 0
	frame_oam -16,   2, $6e, 0
	frame_oam -16,  10, $70, 0
	frame_oam -32,   5, $76, 0
	frame_oam -32,  13, $78, 0
	frame_oam -45,  -3, $7a, 2 | OAMF_YFLIP
	frame_oam -63,  19, $7c, 2 | OAMF_XFLIP
	frame_oam -49,  10, $7a, 2
	db $80

.frame_19
	frame_oam -32, -11, $52, 0
	frame_oam -16, -14, $58, 0
	frame_oam -16,  -6, $5a, 0
	frame_oam -32,  -3, $68, 0
	frame_oam -16,   2, $6e, 0
	frame_oam -16,  10, $70, 0
	frame_oam -32,   5, $76, 0
	frame_oam -32,  13, $78, 0
	frame_oam -56,  -6, $7c, 2 | OAMF_XFLIP
	frame_oam -53,  10, $7c, 2
	db $80

.frame_20
	frame_oam -32, -11, $52, 0
	frame_oam -16, -14, $58, 0
	frame_oam -16,  -6, $5a, 0
	frame_oam -32,  -3, $68, 0
	frame_oam -16,   2, $6e, 0
	frame_oam -16,  10, $70, 0
	frame_oam -32,   5, $76, 0
	frame_oam -32,  13, $78, 0
	frame_oam -52,  10, $7a, 2 | OAMF_YFLIP
	db $80

.frame_21
	frame_oam -32, -11, $52, 0
	frame_oam -16, -14, $58, 0
	frame_oam -16,  -6, $5a, 0
	frame_oam -32,  -3, $68, 0
	frame_oam -16,   2, $6e, 0
	frame_oam -16,  10, $70, 0
	frame_oam -32,   5, $76, 0
	frame_oam -32,  13, $78, 0
	db $80

Frameset_ab03c::
	db $00, 20
	db $01,  8
	db $02, 10
	db $03,  2
	db $04,  4
	db $05,  2
	db $06,  3
	db $05,  3
	db $03,  4
	db $04,  2
	db $07,  4
	db $00, 10
	db $08,  8
	db $09,  9
	db $08,  6
	db $00,  4
	db $08,  6
	db $09,  6
	db $08,  5
	db $00,  4
	db $08,  5
	db $09,  5
	db $08,  5
	db $ff

Frameset_ab06b::
	db $00, 60
	db $0a,  5
	db $0b,  3
	db $0c,  6
	db $0d, 24
	db $0e,  2
	db $0f,  2
	db $10,  2
	db $11,  2
	db $12,  2
	db $13,  2
	db $14,  2
	db $15, 42
	db $0c,  2
	db $0b,  1
	db $0a, 30
	db $ff

Frameset_ab08c::
	db $08, 14
	db $09, 26
	db $08, 12
	db $07,  6
	db $ff

; unreferenced
Frameset_ab095:
	db $00, 60
	db $ff

Frameset_ab098::
	db $07,  8
	db $00, 60
	db $ff

Frameset_ab09d::
	db $03,  2
	db $04,  4
	db $05,  2
	db $06,  3
	db $05,  3
	db $03,  4
	db $04,  2
	db $ff

Frameset_ab0ac::
	db $00, 10
	db $08,  8
	db $09,  9
	db $08,  6
	db $00,  4
	db $08,  6
	db $09,  6
	db $08,  5
	db $00,  4
	db $08,  5
	db $09,  5
	db $08,  5
	db $ff

OAM_ab0c5:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3

.frame_0
	frame_oam -32, -16, $00, 0
	frame_oam -32,  -8, $02, 0
	frame_oam -16, -16, $04, 0
	frame_oam -16,  -8, $06, 0
	frame_oam -32,   8, $00, 0 | OAMF_XFLIP
	frame_oam -32,   0, $02, 0 | OAMF_XFLIP
	frame_oam -16,   8, $04, 0 | OAMF_XFLIP
	frame_oam -16,   0, $06, 0 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -32, -16, $08, 0
	frame_oam -32,   8, $08, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $06, 0
	frame_oam -16,   0, $06, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $02, 0
	frame_oam -32,   0, $02, 0 | OAMF_XFLIP
	frame_oam -16, -16, $0a, 0
	frame_oam -16,   8, $0a, 0 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -32, -16, $0c, 0
	frame_oam -32,  -8, $0e, 0
	frame_oam -32,   8, $0c, 0 | OAMF_XFLIP
	frame_oam -32,   0, $0e, 0 | OAMF_XFLIP
	frame_oam -16, -12, $10, 0
	frame_oam -16,  -4, $12, 0
	frame_oam -16,   4, $10, 0 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -32, -20, $14, 0
	frame_oam -32, -12, $16, 0
	frame_oam -32,  12, $14, 0 | OAMF_XFLIP
	frame_oam -32,   4, $16, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $18, 0
	frame_oam -16, -12, $1a, 0
	frame_oam -16,  -4, $1c, 0
	frame_oam -16,   4, $1a, 0 | OAMF_XFLIP
	db $80

Frameset_ab14d::
	db $00,  4
	db $01,  2
	db $00,  3
	db $01,  2
	db $00,  3
	db $01,  2
	db $02,  3
	db $01,  2
	db $02,  3
	db $ff

Frameset_ab160::
	db $03, 60
	db $ff

Frameset_ab163::
	db $02,  4
	db $01,  2
	db $00,  3
	db $ff
