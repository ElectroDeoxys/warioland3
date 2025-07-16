OAM_18c000:
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

.frame_0
	frame_oam -32, -16, $80, 3
	frame_oam -32,  -8, $82, 3
	frame_oam -32,   8, $80, 3 | OAM_XFLIP
	frame_oam -32,   0, $82, 3 | OAM_XFLIP
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	db $80

.frame_1
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -32,   8, $84, 3 | OAM_XFLIP
	frame_oam -32,   0, $86, 3 | OAM_XFLIP
	frame_oam -32, -16, $84, 3
	frame_oam -32,  -8, $86, 3
	db $80

.frame_2
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -32, -16, $88, 3
	frame_oam -32,  -8, $8a, 3
	frame_oam -32,   8, $88, 3 | OAM_XFLIP
	frame_oam -32,   0, $8a, 3 | OAM_XFLIP
	db $80

.frame_3
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -23,  -8, $ba, 0
	frame_oam -23,   0, $ba, 0 | OAM_XFLIP
	frame_oam -32, -16, $8c, 2
	frame_oam -32,  -8, $8e, 2
	frame_oam -32,   8, $8c, 2 | OAM_XFLIP
	frame_oam -32,   0, $8e, 2 | OAM_XFLIP
	db $80

.frame_4
	frame_oam -32, -24, $e0, 2
	frame_oam -32, -16, $e2, 2
	frame_oam -32,  -8, $e4, 2
	frame_oam -16, -16, $e6, 2
	frame_oam -16,  -8, $e8, 2
	frame_oam -32,   0, $e0, 2 | OAM_XFLIP
	frame_oam -16, -24, $e0, 2 | OAM_YFLIP
	frame_oam -16,   0, $e0, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam -48,   0, $c4, 2
	db $80

.frame_5
	frame_oam -32, -20, $ea, 2
	frame_oam -16, -20, $ea, 2 | OAM_YFLIP
	frame_oam -40, -12, $ec, 2
	frame_oam -24, -12, $ee, 2
	frame_oam  -8, -12, $ec, 2 | OAM_YFLIP
	frame_oam -32,  -4, $ea, 2 | OAM_XFLIP
	frame_oam -16,  -4, $ea, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam -48,   0, $cc, 2
	db $80

.frame_6
	frame_oam -32, -20, $f0, 2
	frame_oam -16, -20, $f0, 2 | OAM_YFLIP
	frame_oam -40, -12, $f2, 2
	frame_oam  -8, -12, $f2, 2 | OAM_YFLIP
	frame_oam -24, -12, $f4, 2
	frame_oam -32,  -4, $f0, 2 | OAM_XFLIP
	frame_oam -16,  -4, $f0, 2 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_7
	frame_oam -32, -12, $f6, 2
	frame_oam -16, -12, $f6, 2 | OAM_YFLIP
	db $80

.frame_8
	frame_oam -32, -20, $f0, 2
	frame_oam -16, -20, $f0, 2 | OAM_YFLIP
	frame_oam -40, -12, $f2, 2
	frame_oam  -8, -12, $f2, 2 | OAM_YFLIP
	frame_oam -24, -12, $f4, 2 | OAM_XFLIP
	frame_oam -32,  -4, $f0, 2 | OAM_XFLIP
	frame_oam -16,  -4, $f0, 2 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_9
	frame_oam -32, -20, $ea, 2
	frame_oam -16, -20, $ea, 2 | OAM_YFLIP
	frame_oam -40, -12, $ec, 2
	frame_oam -24, -12, $ee, 2 | OAM_XFLIP
	frame_oam  -8, -12, $ec, 2 | OAM_YFLIP
	frame_oam -32,  -4, $ea, 2 | OAM_XFLIP
	frame_oam -16,  -4, $ea, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam -48, -24, $cc, 2
	db $80

.frame_10
	frame_oam -32, -24, $e0, 2
	frame_oam -32,  -8, $e2, 2 | OAM_XFLIP
	frame_oam -32, -16, $e4, 2 | OAM_XFLIP
	frame_oam -16,  -8, $e6, 2 | OAM_XFLIP
	frame_oam -16, -16, $e8, 2 | OAM_XFLIP
	frame_oam -32,   0, $e0, 2 | OAM_XFLIP
	frame_oam -16, -24, $e0, 2 | OAM_YFLIP
	frame_oam -16,   0, $e0, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam -48, -24, $c4, 2
	db $80

.frame_11
	frame_oam -32,  -8, $a4, 3
	frame_oam -32,   0, $a4, 3 | OAM_XFLIP
	frame_oam -16,  -3, $a6, 3
	db $80

.frame_12
	frame_oam -32,  -8, $a8, 3
	frame_oam -32,   0, $a8, 3 | OAM_XFLIP
	frame_oam -16,  -3, $aa, 3
	db $80

.frame_13
	frame_oam -32,  -3, $ac, 3
	frame_oam -16,  -3, $ae, 3
	db $80

.frame_14
	frame_oam -32,   0, $a8, 3 | OAM_XFLIP
	frame_oam -32,  -8, $a8, 3
	frame_oam -16,  -5, $aa, 3 | OAM_XFLIP
	frame_oam -20, -13, $cc, 2
	db $80

.frame_15
	frame_oam -32,   0, $a4, 3 | OAM_XFLIP
	frame_oam -32,  -8, $a4, 3
	frame_oam -16,  -5, $a6, 3 | OAM_XFLIP
	frame_oam -20, -13, $c4, 2
	db $80

.frame_16
	frame_oam -32,  -3, $ac, 3
	frame_oam -16,  -3, $b0, 3
	db $80

.frame_17
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -32,   0, $86, 3 | OAM_XFLIP
	frame_oam -32,  -8, $86, 3
	frame_oam -32, -16, $80, 3
	frame_oam -32,   8, $80, 3 | OAM_XFLIP
	db $80

.frame_18
	frame_oam -16,   0, $c2, 2
	frame_oam -16,  -8, $c2, 2
	db $80

.frame_19
	frame_oam -20, -11, $c2, 2
	frame_oam -20,   3, $c2, 2
	db $80

.frame_20
	frame_oam -28,   5, $c2, 2
	frame_oam -28, -13, $c2, 2
	frame_oam  -8,   4, $c2, 2 | OAM_YFLIP
	frame_oam  -8, -11, $c2, 2 | OAM_YFLIP
	db $80

.frame_21
	frame_oam -37, -17, $c2, 2
	frame_oam -37, -17, $c2, 2
	frame_oam -19,  11, $c2, 2
	frame_oam -19, -19, $c2, 2
	frame_oam -37,   9, $c2, 2
	frame_oam -37,   9, $c2, 2
	db $80

.frame_22
	frame_oam -38,  11, $c2, 2
	frame_oam -38, -19, $c2, 2
	frame_oam -38,  11, $c2, 2
	frame_oam -38, -19, $c2, 2
	frame_oam -18,  18, $c2, 2
	frame_oam -18, -26, $c2, 2
	db $80

.frame_23
	frame_oam -18,  18, $c2, 2
	frame_oam -18, -26, $c2, 2
	db $80

.frame_24
	frame_oam -16,  -8, $f8, 2
	frame_oam -16,   0, $f8, 2 | OAM_XFLIP
	db $80

.frame_25
	frame_oam -16,  -4, $fa, 2
	db $80

.frame_26
	frame_oam -16,  -4, $fc, 2
	db $80

.frame_27
	frame_oam -16,  -4, $fc, 2 | OAM_XFLIP
	db $80

.frame_28
	frame_oam -16,  -4, $fa, 2 | OAM_XFLIP
	db $80

.frame_29
	frame_oam -16,  -8, $f8, 2
	frame_oam -16,   0, $f8, 2 | OAM_XFLIP
	db $80

.frame_30
	frame_oam -13,  -5, $de, 2
	db $80

.frame_31
	frame_oam   1,  -3, $de, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam -15,  -8, $de, 2
	frame_oam -15,   0, $de, 2 | OAM_XFLIP
	db $80

.frame_32
	frame_oam   2,   0, $de, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam -12, -10, $de, 2
	frame_oam -17,  -1, $de, 2 | OAM_XFLIP
	db $80

.frame_33
	frame_oam -19,  -7, $de, 2 | OAM_XFLIP
	frame_oam   0,   5, $de, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam   6,  -3, $de, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam   0, -12, $de, 2 | OAM_YFLIP
	frame_oam -19,   3, $de, 2 | OAM_XFLIP
	db $80

.frame_34
	frame_oam -24,  -3, $de, 2 | OAM_XFLIP
	frame_oam   8, -11, $de, 2 | OAM_YFLIP
	frame_oam   7,   5, $de, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam -17,   8, $de, 2 | OAM_XFLIP
	frame_oam -16, -14, $de, 2
	db $80

.frame_35
	frame_oam -25, -10, $de, 2
	frame_oam   6,   8, $de, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam  13,  -9, $de, 2 | OAM_YFLIP
	frame_oam -11, -18, $de, 2
	frame_oam -20,   7, $de, 2 | OAM_XFLIP
	db $80

.frame_36
	frame_oam -24, -14, $de, 2
	frame_oam   1,  12, $de, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam  14,  -4, $de, 2 | OAM_YFLIP
	frame_oam  -7, -20, $de, 2
	frame_oam -25,   6, $de, 2 | OAM_XFLIP
	db $80

.frame_37
	frame_oam -11,  -3, $c2, 2
	db $80

.frame_38
	frame_oam -14,   1, $c2, 2
	frame_oam -15,  -8, $c2, 2 | OAM_XFLIP
	frame_oam   2,  -5, $c2, 2 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_39
	frame_oam -18,  -2, $c2, 2
	frame_oam -10, -11, $c2, 2 | OAM_XFLIP
	frame_oam   1,   1, $c2, 2 | OAM_YFLIP
	db $80

.frame_40
	frame_oam   2,   5, $c2, 2 | OAM_YFLIP
	frame_oam -21,  -5, $c2, 2 | OAM_XFLIP
	frame_oam   6,  -6, $c2, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam -17,   5, $c2, 2
	frame_oam -11, -13, $c2, 2 | OAM_XFLIP
	db $80

.frame_41
	frame_oam -23,   4, $c2, 2 | OAM_XFLIP
	frame_oam   4,  -4, $c2, 2 | OAM_XFLIP
	frame_oam -22, -14, $c2, 2 | OAM_XFLIP
	frame_oam   0,   9, $c2, 2 | OAM_XFLIP | OAM_YFLIP
	frame_oam   1, -17, $c2, 2 | OAM_YFLIP
	db $80

.frame_42
	frame_oam   0, -16, $c2, 2
	frame_oam -28,  -2, $c2, 2
	frame_oam  11,   5, $c2, 2 | OAM_YFLIP
	frame_oam -19, -19, $c2, 2
	frame_oam -13,  11, $c2, 2 | OAM_XFLIP
	db $80

.frame_43
	frame_oam -31, -11, $c2, 2
	frame_oam  11,  -8, $c2, 2
	frame_oam -25,  13, $c2, 2
	frame_oam  -7, -24, $c2, 2
	frame_oam   8,  13, $c2, 2 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_44
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -32, -16, $88, 0
	frame_oam -32,  -8, $8a, 0
	frame_oam -32,   8, $88, 0 | OAM_XFLIP
	frame_oam -32,   0, $8a, 0 | OAM_XFLIP
	db $80

.frame_45
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -22, -12, $b6, 0
	frame_oam -22,   4, $b6, 0 | OAM_XFLIP
	frame_oam -30,  -4, $b8, 0
	frame_oam -32, -16, $8c, 0
	frame_oam -32,  -8, $8e, 0
	frame_oam -32,   8, $8c, 0 | OAM_XFLIP
	frame_oam -32,   0, $8e, 0 | OAM_XFLIP
	db $80

.frame_46
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -31,  -4, $bc, 0
	frame_oam -23, -12, $ba, 0
	frame_oam -23,   4, $ba, 0 | OAM_XFLIP
	frame_oam -32, -16, $8c, 2
	frame_oam -32,  -8, $8e, 2
	frame_oam -32,   8, $8c, 2 | OAM_XFLIP
	frame_oam -32,   0, $8e, 2 | OAM_XFLIP
	db $80

.frame_47
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -20,  -8, $b6, 0
	frame_oam -20,   0, $b6, 0 | OAM_XFLIP
	frame_oam -32, -16, $88, 0
	frame_oam -32,  -8, $8a, 0
	frame_oam -32,   8, $88, 0 | OAM_XFLIP
	frame_oam -32,   0, $8a, 0 | OAM_XFLIP
	db $80

.frame_48
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -20,  -8, $ba, 0
	frame_oam -20,   0, $ba, 0 | OAM_XFLIP
	frame_oam -32, -16, $88, 3
	frame_oam -32,  -8, $8a, 3
	frame_oam -32,   8, $88, 3 | OAM_XFLIP
	frame_oam -32,   0, $8a, 3 | OAM_XFLIP
	db $80

.frame_49
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -21,  -8, $ba, 0
	frame_oam -21,   0, $ba, 0 | OAM_XFLIP
	frame_oam -32, -16, $88, 3
	frame_oam -32,  -8, $8a, 3
	frame_oam -32,   8, $88, 3 | OAM_XFLIP
	frame_oam -32,   0, $8a, 3 | OAM_XFLIP
	db $80

.frame_50
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -23,  -8, $b6, 0
	frame_oam -23,   0, $b6, 0 | OAM_XFLIP
	frame_oam -32, -16, $88, 0
	frame_oam -32,  -8, $8a, 0
	frame_oam -32,   8, $88, 0 | OAM_XFLIP
	frame_oam -32,   0, $8a, 0 | OAM_XFLIP
	db $80

.frame_51
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -26,  -8, $b6, 0
	frame_oam -26,   0, $b6, 0 | OAM_XFLIP
	frame_oam -32, -16, $8c, 0
	frame_oam -32,  -8, $8e, 0
	frame_oam -32,   8, $8c, 0 | OAM_XFLIP
	frame_oam -32,   0, $8e, 0 | OAM_XFLIP
	db $80

.frame_52
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -33,  -4, $bc, 0
	frame_oam -17,  -4, $bc, 0 | OAM_YFLIP
	frame_oam -25, -12, $ba, 0
	frame_oam -25,   4, $ba, 0 | OAM_XFLIP
	frame_oam -32, -16, $8c, 2
	frame_oam -32,  -8, $8e, 2
	frame_oam -32,   8, $8c, 2 | OAM_XFLIP
	frame_oam -32,   0, $8e, 2 | OAM_XFLIP
	db $80

.frame_53
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -27, -12, $b6, 0
	frame_oam -27,   4, $b6, 0 | OAM_XFLIP
	frame_oam -35,  -4, $b8, 0
	frame_oam -19,  -4, $b8, 0 | OAM_YFLIP
	frame_oam -32, -16, $8c, 2
	frame_oam -32,  -8, $8e, 2
	frame_oam -32,   8, $8c, 2 | OAM_XFLIP
	frame_oam -32,   0, $8e, 2 | OAM_XFLIP
	db $80

.frame_54
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -31,  -8, $ba, 0
	frame_oam -31,   0, $ba, 0 | OAM_XFLIP
	frame_oam -32, -16, $8c, 0
	frame_oam -32,  -8, $8e, 0
	frame_oam -32,   8, $8c, 0 | OAM_XFLIP
	frame_oam -32,   0, $8e, 0 | OAM_XFLIP
	db $80

.frame_55
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -36,  -8, $b6, 0
	frame_oam -36,   0, $b6, 0 | OAM_XFLIP
	frame_oam -32, -16, $8c, 0
	frame_oam -32,  -8, $8e, 0
	frame_oam -32,   8, $8c, 0 | OAM_XFLIP
	frame_oam -32,   0, $8e, 0 | OAM_XFLIP
	db $80

.frame_56
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -46,  -4, $bc, 0
	frame_oam -30,  -4, $bc, 0 | OAM_YFLIP
	frame_oam -38, -12, $ba, 0
	frame_oam -38,   4, $ba, 0 | OAM_XFLIP
	frame_oam -32, -16, $8c, 2
	frame_oam -32,  -8, $8e, 2
	frame_oam -32,   8, $8c, 2 | OAM_XFLIP
	frame_oam -32,   0, $8e, 2 | OAM_XFLIP
	db $80

.frame_57
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -40,  -8, $b6, 0
	frame_oam -40,   0, $b6, 0 | OAM_XFLIP
	frame_oam -32, -16, $8c, 0
	frame_oam -32,  -8, $8e, 0
	frame_oam -32,   8, $8c, 0 | OAM_XFLIP
	frame_oam -32,   0, $8e, 0 | OAM_XFLIP
	db $80

.frame_58
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -51,  -4, $bc, 0
	frame_oam -35,  -4, $bc, 0 | OAM_YFLIP
	frame_oam -43, -12, $ba, 0
	frame_oam -43,   4, $ba, 0 | OAM_XFLIP
	frame_oam -32, -16, $8c, 2
	frame_oam -32,  -8, $8e, 2
	frame_oam -32,   8, $8c, 2 | OAM_XFLIP
	frame_oam -32,   0, $8e, 2 | OAM_XFLIP
	db $80

.frame_59
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -44,  -8, $b6, 0
	frame_oam -44,   0, $b6, 0 | OAM_XFLIP
	frame_oam -32, -16, $8c, 0
	frame_oam -32,  -8, $8e, 0
	frame_oam -32,   8, $8c, 0 | OAM_XFLIP
	frame_oam -32,   0, $8e, 0 | OAM_XFLIP
	db $80

.frame_60
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -59,  -4, $bc, 0
	frame_oam -43,  -4, $bc, 0 | OAM_YFLIP
	frame_oam -51, -12, $ba, 0
	frame_oam -51,   4, $ba, 0 | OAM_XFLIP
	frame_oam -32, -16, $8c, 2
	frame_oam -32,  -8, $8e, 2
	frame_oam -32,   8, $8c, 2 | OAM_XFLIP
	frame_oam -32,   0, $8e, 2 | OAM_XFLIP
	db $80

.frame_61
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -56, -12, $b6, 0
	frame_oam -56,   4, $b6, 0 | OAM_XFLIP
	frame_oam -64,  -4, $b8, 0
	frame_oam -48,  -4, $b8, 0 | OAM_YFLIP
	frame_oam -32, -16, $8c, 0
	frame_oam -32,  -8, $8e, 0
	frame_oam -32,   8, $8c, 0 | OAM_XFLIP
	frame_oam -32,   0, $8e, 0 | OAM_XFLIP
	db $80

.frame_62
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -32, -16, $8c, 3
	frame_oam -32,  -8, $8e, 3
	frame_oam -32,   8, $8c, 3 | OAM_XFLIP
	frame_oam -32,   0, $8e, 3 | OAM_XFLIP
	db $80

.frame_63
	frame_oam -16,   8, $a0, 3 | OAM_XFLIP
	frame_oam -16,   0, $a2, 3 | OAM_XFLIP
	frame_oam -16, -16, $a0, 3
	frame_oam -16,  -8, $a2, 3
	frame_oam -32, -16, $8c, 0
	frame_oam -32,  -8, $8e, 0
	frame_oam -32,   8, $8c, 0 | OAM_XFLIP
	frame_oam -32,   0, $8e, 0 | OAM_XFLIP
	db $80

.frame_64
	frame_oam -24,  -4, $bc, 0
	frame_oam  -8,  -4, $bc, 0 | OAM_YFLIP
	frame_oam -16, -12, $ba, 0
	frame_oam -16,   4, $ba, 0 | OAM_XFLIP
	db $80

.frame_65
	frame_oam -16, -12, $b6, 0
	frame_oam -16,   4, $b6, 0 | OAM_XFLIP
	frame_oam -24,  -4, $b8, 0
	frame_oam  -8,  -4, $b8, 0 | OAM_YFLIP
	db $80

.frame_66
	frame_oam -16,  -8, $90, 4
	frame_oam -16,   0, $92, 4
	frame_oam -24,  -4, $bc, 0
	frame_oam  -8,  -4, $bc, 0 | OAM_YFLIP
	frame_oam -16, -12, $ba, 0
	frame_oam -16,   4, $ba, 0 | OAM_XFLIP
	db $80

.frame_67
	frame_oam -16,  -8, $90, 4
	frame_oam -16,   0, $92, 4
	frame_oam -16, -12, $b6, 0
	frame_oam -16,   4, $b6, 0 | OAM_XFLIP
	frame_oam -24,  -4, $b8, 0
	frame_oam  -8,  -4, $b8, 0 | OAM_YFLIP
	db $80

.frame_68
	frame_oam -16,  -8, $94, 5
	frame_oam -16,   0, $96, 5
	frame_oam -24,  -4, $bc, 0
	frame_oam  -8,  -4, $bc, 0 | OAM_YFLIP
	frame_oam -16, -12, $ba, 0
	frame_oam -16,   4, $ba, 0 | OAM_XFLIP
	db $80

.frame_69
	frame_oam -16,  -8, $94, 5
	frame_oam -16,   0, $96, 5
	frame_oam -16, -12, $b6, 0
	frame_oam -16,   4, $b6, 0 | OAM_XFLIP
	frame_oam -24,  -4, $b8, 0
	frame_oam  -8,  -4, $b8, 0 | OAM_YFLIP
	db $80

.frame_70
	frame_oam -16,  -8, $98, 6
	frame_oam -16,   0, $9a, 6
	frame_oam -24,  -4, $bc, 0
	frame_oam  -8,  -4, $bc, 0 | OAM_YFLIP
	frame_oam -16, -12, $ba, 0
	frame_oam -16,   4, $ba, 0 | OAM_XFLIP
	db $80

.frame_71
	frame_oam -16,  -8, $98, 6
	frame_oam -16,   0, $9a, 6
	frame_oam -16, -12, $b6, 0
	frame_oam -16,   4, $b6, 0 | OAM_XFLIP
	frame_oam -24,  -4, $b8, 0
	frame_oam  -8,  -4, $b8, 0 | OAM_YFLIP
	db $80

.frame_72
	frame_oam -16,  -8, $9c, 7
	frame_oam -16,   0, $9e, 7
	frame_oam -24,  -4, $bc, 0
	frame_oam  -8,  -4, $bc, 0 | OAM_YFLIP
	frame_oam -16, -12, $ba, 0
	frame_oam -16,   4, $ba, 0 | OAM_XFLIP
	db $80

.frame_73
	frame_oam -16,  -8, $9c, 7
	frame_oam -16,   0, $9e, 7
	frame_oam -16, -12, $b6, 0
	frame_oam -16,   4, $b6, 0 | OAM_XFLIP
	frame_oam -24,  -4, $b8, 0
	frame_oam  -8,  -4, $b8, 0 | OAM_YFLIP
	db $80

OAM_18c806::
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

.frame_0
	frame_oam -16,  -8, $80, 6 | OAM_BANK1
	frame_oam -16,   0, $82, 6 | OAM_BANK1
	db $80

.frame_1
	frame_oam -16,  -8, $84, 6 | OAM_BANK1
	frame_oam -16,   0, $86, 6 | OAM_BANK1
	db $80

.frame_2
	frame_oam -16,  -8, $88, 6 | OAM_BANK1
	frame_oam -16,   0, $8a, 6 | OAM_BANK1
	db $80

.frame_3
	frame_oam -16,  -8, $8c, 6 | OAM_BANK1
	frame_oam -16,   0, $8e, 6 | OAM_BANK1
	db $80

.frame_4
	frame_oam -16,  -8, $90, 6 | OAM_BANK1
	frame_oam -16,   0, $92, 6 | OAM_BANK1
	db $80

.frame_5
	frame_oam -16,  -8, $94, 6 | OAM_BANK1
	frame_oam -16,   0, $96, 6 | OAM_BANK1
	db $80

.frame_6
	frame_oam -16,  -8, $a0, 6 | OAM_BANK1
	frame_oam -16,   0, $a2, 6 | OAM_BANK1
	db $80

.frame_7
	frame_oam -16,  -8, $a4, 6 | OAM_BANK1
	frame_oam -16,   0, $a6, 6 | OAM_BANK1
	db $80

.frame_8
	frame_oam -16,  -8, $a8, 6 | OAM_BANK1
	frame_oam -16,   0, $aa, 6 | OAM_BANK1
	db $80

.frame_9
	frame_oam -16,  -8, $ac, 6 | OAM_BANK1
	frame_oam -16,   0, $ae, 6 | OAM_BANK1
	db $80

.frame_10
	frame_oam -16,  -8, $b0, 6 | OAM_BANK1
	frame_oam -16,   0, $b2, 6 | OAM_BANK1
	db $80

.frame_11
	frame_oam -16,  -8, $b4, 6 | OAM_BANK1
	frame_oam -16,   0, $b6, 6 | OAM_BANK1
	db $80

OAM_18c88a::
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

.frame_0
	frame_oam -16, -16, $0c, 4 | OAM_BANK1
	frame_oam -16,  -8, $0e, 4 | OAM_BANK1
	frame_oam -15,   8, $0c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   0, $0e, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -8, $06, 3 | OAM_BANK1
	frame_oam -32,   0, $08, 3 | OAM_BANK1
	frame_oam -48,  -8, $02, 3 | OAM_BANK1
	frame_oam -48,   0, $04, 3 | OAM_BANK1
	frame_oam -37, -16, $00, 3 | OAM_BANK1
	frame_oam -36,   8, $0a, 3 | OAM_BANK1
	db $80

.frame_1
	frame_oam -16,   8, $0c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   0, $0e, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -15, -16, $0c, 4 | OAM_BANK1
	frame_oam -16,  -8, $0e, 4 | OAM_BANK1
	frame_oam -32,   0, $06, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -8, $08, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48,   0, $02, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48,  -8, $04, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -37,   8, $00, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -36, -16, $0a, 3 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_2
	frame_oam -32,  -8, $06, 3 | OAM_BANK1
	frame_oam -32,   0, $08, 3 | OAM_BANK1
	frame_oam -48,  -8, $02, 3 | OAM_BANK1
	frame_oam -48,   0, $04, 3 | OAM_BANK1
	frame_oam -37, -16, $00, 3 | OAM_BANK1
	frame_oam -36,   8, $0a, 3 | OAM_BANK1
	frame_oam -20,  -8, $14, 4 | OAM_BANK1
	frame_oam  -4,  -8, $16, 4 | OAM_BANK1
	frame_oam -10, -16, $12, 4 | OAM_BANK1
	frame_oam -26, -16, $10, 4 | OAM_BANK1
	frame_oam -20,   0, $14, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam  -4,   0, $16, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -10,   8, $12, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -26,   8, $10, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_3
	frame_oam -37,   8, $00, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -36, -16, $0a, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,   0, $20, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -8, $22, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48,   0, $02, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48,  -8, $04, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -23,  -8, $1c, 4 | OAM_BANK1
	frame_oam  -7,  -8, $1e, 4 | OAM_BANK1
	frame_oam  -9, -16, $1a, 4 | OAM_BANK1
	frame_oam -25, -16, $18, 4 | OAM_BANK1
	frame_oam -23,   0, $1c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam  -7,   0, $1e, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam  -9,   8, $1a, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -25,   8, $18, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_4
	frame_oam -32,   0, $06, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -8, $08, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48,   0, $02, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48,  -8, $04, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -37,   8, $00, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -36, -16, $0a, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -20,  -8, $14, 4 | OAM_BANK1
	frame_oam  -4,  -8, $16, 4 | OAM_BANK1
	frame_oam -10, -16, $12, 4 | OAM_BANK1
	frame_oam -26, -16, $10, 4 | OAM_BANK1
	frame_oam -20,   0, $14, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam  -4,   0, $16, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -10,   8, $12, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -26,   8, $10, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_5
	frame_oam -15, -16, $0c, 4 | OAM_BANK1
	frame_oam -16,  -8, $0e, 4 | OAM_BANK1
	frame_oam -16,   8, $0c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   0, $0e, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -8, $c6, 3 | OAM_BANK1
	frame_oam -32,   0, $c8, 3 | OAM_BANK1
	frame_oam -48,  -8, $c2, 3 | OAM_BANK1
	frame_oam -48,   0, $c4, 3 | OAM_BANK1
	frame_oam -36, -16, $c0, 3 | OAM_BANK1
	frame_oam -37,   8, $ca, 3 | OAM_BANK1
	db $80

.frame_6
	frame_oam -16, -16, $0c, 4 | OAM_BANK1
	frame_oam -16,  -8, $0e, 4 | OAM_BANK1
	frame_oam -15,   8, $0c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   0, $0e, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -8, $d2, 3 | OAM_BANK1
	frame_oam -32,   0, $d4, 3 | OAM_BANK1
	frame_oam -48,  -8, $ce, 3 | OAM_BANK1
	frame_oam -48,   0, $d0, 3 | OAM_BANK1
	frame_oam -37, -16, $cc, 3 | OAM_BANK1
	frame_oam -36,   8, $d6, 3 | OAM_BANK1
	db $80

.frame_7
	frame_oam -15,   8, $0c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   0, $0e, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16, -16, $0c, 4 | OAM_BANK1
	frame_oam -16,  -8, $0e, 4 | OAM_BANK1
	frame_oam -32,   0, $c6, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -8, $c8, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48,   0, $c2, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48,  -8, $c4, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -36,   8, $c0, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -37, -16, $ca, 3 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_8
	frame_oam -16,   8, $0c, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   0, $0e, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -15, -16, $0c, 4 | OAM_BANK1
	frame_oam -16,  -8, $0e, 4 | OAM_BANK1
	frame_oam -32,   0, $d2, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -8, $d4, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48,   0, $ce, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48,  -8, $d0, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -37,   8, $cc, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -36, -16, $d6, 3 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_9
	frame_oam -32,  -8, $e2, 3 | OAM_BANK1
	frame_oam -32,   0, $e4, 3 | OAM_BANK1
	frame_oam -36, -16, $e0, 3 | OAM_BANK1
	frame_oam -48,  -8, $f4, 3 | OAM_BANK1
	frame_oam -36,   8, $e0, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48,   0, $f4, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -23,  -8, $ee, 4 | OAM_BANK1
	frame_oam  -7,  -8, $f0, 4 | OAM_BANK1
	frame_oam -14, -16, $ea, 4 | OAM_BANK1
	frame_oam   1, -16, $ec, 4 | OAM_BANK1
	frame_oam -23,   0, $ee, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam  -7,   0, $f0, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -14,   8, $ea, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam   1,   8, $ec, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_10
	frame_oam -35, -16, $e0, 3 | OAM_BANK1
	frame_oam -37,   8, $e0, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam  -8,  -8, $f0, 4 | OAM_BANK1
	frame_oam -15, -16, $ea, 4 | OAM_BANK1
	frame_oam   0, -16, $ec, 4 | OAM_BANK1
	frame_oam  -8,   0, $f0, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -15,   8, $ea, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam   0,   8, $ec, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -34,  -8, $e6, 3 | OAM_BANK1
	frame_oam -36,   0, $e8, 3 | OAM_BANK1
	frame_oam -24,  -8, $f2, 4 | OAM_BANK1
	frame_oam -24,   0, $f2, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_11
	frame_oam -35,   8, $e0, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -37, -16, $e0, 3 | OAM_BANK1
	frame_oam  -8,   0, $f0, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -15,   8, $ea, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam   0,   8, $ec, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam  -8,  -8, $f0, 4 | OAM_BANK1
	frame_oam -15, -16, $ea, 4 | OAM_BANK1
	frame_oam   0, -16, $ec, 4 | OAM_BANK1
	frame_oam -34,   0, $e6, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -36,  -8, $e8, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -24,   0, $f2, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -24,  -8, $f2, 4 | OAM_BANK1
	db $80

.frame_12
	frame_oam -16, -16, $f6, 4 | OAM_BANK1
	frame_oam -16,  -8, $f8, 4 | OAM_BANK1
	frame_oam -15,   8, $f6, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   0, $f8, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -8, $06, 3 | OAM_BANK1
	frame_oam -32,   0, $08, 3 | OAM_BANK1
	frame_oam -48,  -8, $02, 3 | OAM_BANK1
	frame_oam -48,   0, $04, 3 | OAM_BANK1
	frame_oam -37, -16, $00, 3 | OAM_BANK1
	frame_oam -36,   8, $0a, 3 | OAM_BANK1
	db $80

.frame_13
	frame_oam -32,   0, $06, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -8, $08, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48,   0, $02, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48,  -8, $04, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -37,   8, $00, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -36, -16, $0a, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -15, -16, $f6, 4 | OAM_BANK1
	frame_oam -16,  -8, $f8, 4 | OAM_BANK1
	frame_oam -16,   8, $f6, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   0, $f8, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_14
	frame_oam -32,  -8, $c6, 3 | OAM_BANK1
	frame_oam -32,   0, $c8, 3 | OAM_BANK1
	frame_oam -48,  -8, $c2, 3 | OAM_BANK1
	frame_oam -48,   0, $c4, 3 | OAM_BANK1
	frame_oam -36, -16, $c0, 3 | OAM_BANK1
	frame_oam -37,   8, $ca, 3 | OAM_BANK1
	frame_oam -15, -16, $f6, 4 | OAM_BANK1
	frame_oam -16,  -8, $f8, 4 | OAM_BANK1
	frame_oam -16,   8, $f6, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   0, $f8, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_15
	frame_oam -32,  -8, $d2, 3 | OAM_BANK1
	frame_oam -32,   0, $d4, 3 | OAM_BANK1
	frame_oam -48,  -8, $ce, 3 | OAM_BANK1
	frame_oam -48,   0, $d0, 3 | OAM_BANK1
	frame_oam -37, -16, $cc, 3 | OAM_BANK1
	frame_oam -36,   8, $d6, 3 | OAM_BANK1
	frame_oam -16, -16, $f6, 4 | OAM_BANK1
	frame_oam -16,  -8, $f8, 4 | OAM_BANK1
	frame_oam -15,   8, $f6, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   0, $f8, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_16
	frame_oam -32,   0, $c6, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -8, $c8, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48,   0, $c2, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48,  -8, $c4, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -36,   8, $c0, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -37, -16, $ca, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16, -16, $f6, 4 | OAM_BANK1
	frame_oam -16,  -8, $f8, 4 | OAM_BANK1
	frame_oam -15,   8, $f6, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   0, $f8, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_17
	frame_oam -32,   0, $d2, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -8, $d4, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48,   0, $ce, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48,  -8, $d0, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -37,   8, $cc, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -36, -16, $d6, 3 | OAM_BANK1 | OAM_XFLIP
	frame_oam -15, -16, $f6, 4 | OAM_BANK1
	frame_oam -16,  -8, $f8, 4 | OAM_BANK1
	frame_oam -16,   8, $f6, 4 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   0, $f8, 4 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_18
	frame_oam -32, -12, $24, 7 | OAM_BANK1
	frame_oam -32,  -4, $26, 6 | OAM_BANK1
	frame_oam -32,   4, $28, 6 | OAM_BANK1
	frame_oam -16, -12, $44, 7 | OAM_BANK1
	frame_oam -16,  -4, $46, 6 | OAM_BANK1
	frame_oam -16,   4, $48, 6 | OAM_BANK1
	db $80

.frame_19
	frame_oam -32, -16, $a0, 6 | OAM_BANK1
	frame_oam -32,  -8, $a2, 6 | OAM_BANK1
	frame_oam -32,   0, $a4, 6 | OAM_BANK1
	frame_oam -32,   8, $a6, 6 | OAM_BANK1
	frame_oam -16, -16, $a8, 6 | OAM_BANK1
	frame_oam -16,  -8, $aa, 7 | OAM_BANK1
	frame_oam -16,   0, $ac, 7 | OAM_BANK1
	frame_oam -16,   8, $ae, 6 | OAM_BANK1
	db $80

.frame_20
	frame_oam -32, -16, $60, 6 | OAM_BANK1
	frame_oam -32,  -8, $62, 6 | OAM_BANK1
	frame_oam -32,   0, $64, 6 | OAM_BANK1
	frame_oam -32,   8, $66, 6 | OAM_BANK1
	frame_oam -16, -16, $80, 6 | OAM_BANK1
	frame_oam -16,  -8, $82, 6 | OAM_BANK1
	frame_oam -16,   0, $84, 7 | OAM_BANK1
	frame_oam -16,   8, $86, 7 | OAM_BANK1
	db $80

.frame_21
	frame_oam -32, -16, $2a, 6 | OAM_BANK1
	frame_oam -32,  -8, $2c, 6 | OAM_BANK1
	frame_oam -32,   0, $2e, 6 | OAM_BANK1
	frame_oam -32,   8, $30, 7 | OAM_BANK1
	frame_oam -16, -16, $4a, 6 | OAM_BANK1
	frame_oam -16,  -8, $4c, 6 | OAM_BANK1
	frame_oam -16,   0, $4e, 6 | OAM_BANK1
	frame_oam -16,   8, $50, 7 | OAM_BANK1
	db $80

.frame_22
	frame_oam -32, -16, $68, 6 | OAM_BANK1
	frame_oam -32,  -8, $6a, 6 | OAM_BANK1
	frame_oam -32,   0, $6c, 7 | OAM_BANK1
	frame_oam -32,   8, $6e, 7 | OAM_BANK1
	frame_oam -16, -16, $88, 6 | OAM_BANK1
	frame_oam -16,  -8, $8a, 6 | OAM_BANK1
	frame_oam -16,   0, $8c, 6 | OAM_BANK1
	frame_oam -16,   8, $8e, 6 | OAM_BANK1
	db $80

.frame_23
	frame_oam -16,   8, $a0, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,   0, $a2, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,  -8, $a4, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16, -16, $a6, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,   8, $a8, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,   0, $aa, 7 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,  -8, $ac, 7 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32, -16, $ae, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_24
	frame_oam -16,   8, $60, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,   0, $62, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,  -8, $64, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16, -16, $66, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,   8, $80, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,   0, $82, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,  -8, $84, 7 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32, -16, $86, 7 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_25
	frame_oam -16,   8, $2a, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,   0, $2c, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,  -8, $2e, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16, -16, $30, 7 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,   8, $4a, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,   0, $4c, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,  -8, $4e, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32, -16, $50, 7 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_26
	frame_oam -16,   8, $68, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,   0, $6a, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16,  -8, $6c, 7 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -16, -16, $6e, 7 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,   8, $88, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,   0, $8a, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32,  -8, $8c, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	frame_oam -32, -16, $8e, 6 | OAM_BANK1 | OAM_XFLIP | OAM_YFLIP
	db $80

.frame_27
	frame_oam -48,  -8, $3c, 6 | OAM_BANK1
	frame_oam -48,   0, $3e, 6 | OAM_BANK1
	frame_oam -32, -16, $5a, 6 | OAM_BANK1
	frame_oam -32,  -8, $5c, 6 | OAM_BANK1
	frame_oam -32,   0, $5e, 6 | OAM_BANK1
	frame_oam -16, -16, $7a, 6 | OAM_BANK1
	frame_oam -16,  -8, $7c, 6 | OAM_BANK1
	frame_oam -16,   0, $7e, 6 | OAM_BANK1
	db $80

.frame_28
	frame_oam -48,  -4, $bc, 6 | OAM_BANK1
	frame_oam -48,   4, $be, 6 | OAM_BANK1
	frame_oam -32, -12, $da, 7 | OAM_BANK1
	frame_oam -32,  -4, $dc, 6 | OAM_BANK1
	frame_oam -32,   4, $de, 6 | OAM_BANK1
	frame_oam -16, -12, $fa, 7 | OAM_BANK1
	frame_oam -16,  -4, $fc, 6 | OAM_BANK1
	frame_oam -16,   4, $fe, 6 | OAM_BANK1
	db $80

.frame_29
	frame_oam -31, -12, $96, 7 | OAM_BANK1
	frame_oam -31,  -4, $98, 6 | OAM_BANK1
	frame_oam -31,   4, $9a, 6 | OAM_BANK1
	frame_oam -15, -12, $b6, 6 | OAM_BANK1
	frame_oam -15,  -4, $b8, 6 | OAM_BANK1
	frame_oam -15,   4, $ba, 6 | OAM_BANK1
	db $80

.frame_30
	frame_oam -32, -12, $70, 7 | OAM_BANK1
	frame_oam -32,  -4, $72, 6 | OAM_BANK1
	frame_oam -32,   4, $74, 6 | OAM_BANK1
	frame_oam -16, -12, $90, 6 | OAM_BANK1
	frame_oam -16,  -4, $92, 6 | OAM_BANK1
	frame_oam -16,   4, $94, 6 | OAM_BANK1
	db $80

.frame_31
	frame_oam -32, -16, $40, 6 | OAM_BANK1
	frame_oam -32,  -8, $42, 6 | OAM_BANK1
	frame_oam -32,   0, $76, 7 | OAM_BANK1
	frame_oam -32,   8, $78, 7 | OAM_BANK1
	frame_oam -16, -16, $b2, 6 | OAM_BANK1
	frame_oam -16,  -8, $b4, 7 | OAM_BANK1
	frame_oam -16,   0, $9c, 7 | OAM_BANK1
	frame_oam -16,   8, $9e, 6 | OAM_BANK1
	db $80

.frame_32
	frame_oam -28, -16, $32, 7 | OAM_BANK1
	frame_oam -28,  -8, $34, 7 | OAM_BANK1
	frame_oam -28,   0, $36, 7 | OAM_BANK1
	frame_oam -28,   8, $38, 7 | OAM_BANK1
	frame_oam -12, -16, $52, 7 | OAM_BANK1
	frame_oam -12,  -8, $54, 7 | OAM_BANK1
	frame_oam -12,   0, $56, 7 | OAM_BANK1
	frame_oam -12,   8, $58, 7 | OAM_BANK1
	db $80

.frame_33
	frame_oam -32,   4, $24, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -4, $26, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32, -12, $28, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   4, $44, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,  -4, $46, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16, -12, $48, 6 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_34
	frame_oam -32,   8, $a0, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,   0, $a2, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -8, $a4, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32, -16, $a6, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   8, $a8, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   0, $aa, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,  -8, $ac, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16, -16, $ae, 6 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_35
	frame_oam -32,   8, $60, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,   0, $62, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -8, $64, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32, -16, $66, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   8, $80, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   0, $82, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,  -8, $84, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16, -16, $86, 7 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_36
	frame_oam -32,   8, $2a, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,   0, $2c, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -8, $2e, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32, -16, $30, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   8, $4a, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   0, $4c, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,  -8, $4e, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16, -16, $50, 7 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_37
	frame_oam -32,   8, $68, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,   0, $6a, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -8, $6c, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32, -16, $6e, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   8, $88, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   0, $8a, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,  -8, $8c, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16, -16, $8e, 6 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_38
	frame_oam -16, -16, $a0, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -16,  -8, $a2, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -16,   0, $a4, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -16,   8, $a6, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -32, -16, $a8, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -32,  -8, $aa, 7 | OAM_BANK1 | OAM_YFLIP
	frame_oam -32,   0, $ac, 7 | OAM_BANK1 | OAM_YFLIP
	frame_oam -32,   8, $ae, 6 | OAM_BANK1 | OAM_YFLIP
	db $80

.frame_39
	frame_oam -16, -16, $60, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -16,  -8, $62, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -16,   0, $64, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -16,   8, $66, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -32, -16, $80, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -32,  -8, $82, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -32,   0, $84, 7 | OAM_BANK1 | OAM_YFLIP
	frame_oam -32,   8, $86, 7 | OAM_BANK1 | OAM_YFLIP
	db $80

.frame_40
	frame_oam -16, -16, $2a, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -16,  -8, $2c, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -16,   0, $2e, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -16,   8, $30, 7 | OAM_BANK1 | OAM_YFLIP
	frame_oam -32, -16, $4a, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -32,  -8, $4c, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -32,   0, $4e, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -32,   8, $50, 7 | OAM_BANK1 | OAM_YFLIP
	db $80

.frame_41
	frame_oam -16, -16, $68, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -16,  -8, $6a, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -16,   0, $6c, 7 | OAM_BANK1 | OAM_YFLIP
	frame_oam -16,   8, $6e, 7 | OAM_BANK1 | OAM_YFLIP
	frame_oam -32, -16, $88, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -32,  -8, $8a, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -32,   0, $8c, 6 | OAM_BANK1 | OAM_YFLIP
	frame_oam -32,   8, $8e, 6 | OAM_BANK1 | OAM_YFLIP
	db $80

.frame_42
	frame_oam -48,   0, $3c, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48,  -8, $3e, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,   8, $5a, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,   0, $5c, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -8, $5e, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   8, $7a, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   0, $7c, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,  -8, $7e, 6 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_43
	frame_oam -48,  -4, $bc, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -48, -12, $be, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,   4, $da, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -4, $dc, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32, -12, $de, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   4, $fa, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,  -4, $fc, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16, -12, $fe, 6 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_44
	frame_oam -31,   4, $96, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -31,  -4, $98, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -31, -12, $9a, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -15,   4, $b6, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -15,  -4, $b8, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -15, -12, $ba, 6 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_45
	frame_oam -32,   4, $70, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -4, $72, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32, -12, $74, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   4, $90, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,  -4, $92, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16, -12, $94, 6 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_46
	frame_oam -32,   8, $40, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,   0, $42, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32,  -8, $76, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -32, -16, $78, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   8, $b2, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,   0, $b4, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16,  -8, $9c, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -16, -16, $9e, 6 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_47
	frame_oam -28,   8, $32, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -28,   0, $34, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -28,  -8, $36, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -28, -16, $38, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -12,   8, $52, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -12,   0, $54, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -12,  -8, $56, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -12, -16, $58, 7 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_48
	frame_oam -38, -12, $24, 7 | OAM_BANK1
	frame_oam -38,  -4, $26, 6 | OAM_BANK1
	frame_oam -38,   4, $28, 6 | OAM_BANK1
	frame_oam -22, -12, $44, 7 | OAM_BANK1
	frame_oam -22,  -4, $46, 6 | OAM_BANK1
	frame_oam -22,   4, $48, 6 | OAM_BANK1
	db $80

.frame_49
	frame_oam -46, -12, $96, 7 | OAM_BANK1
	frame_oam -46,  -4, $98, 6 | OAM_BANK1
	frame_oam -46,   4, $9a, 6 | OAM_BANK1
	frame_oam -30, -12, $b6, 6 | OAM_BANK1
	frame_oam -30,  -4, $b8, 6 | OAM_BANK1
	frame_oam -30,   4, $ba, 6 | OAM_BANK1
	db $80

.frame_50
	frame_oam -38,   4, $24, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -38,  -4, $26, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -38, -12, $28, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -22,   4, $44, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -22,  -4, $46, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -22, -12, $48, 6 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_51
	frame_oam -46,   4, $96, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -46,  -4, $98, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -46, -12, $9a, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -30,   4, $b6, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -30,  -4, $b8, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -30, -12, $ba, 6 | OAM_BANK1 | OAM_XFLIP
	db $80

.frame_52
	frame_oam -28, -16, $40, 6 | OAM_BANK1
	frame_oam -28,  -8, $42, 6 | OAM_BANK1
	frame_oam -28,   0, $76, 7 | OAM_BANK1
	frame_oam -28,   8, $78, 7 | OAM_BANK1
	frame_oam -12, -16, $b2, 6 | OAM_BANK1
	frame_oam -12,  -8, $b4, 7 | OAM_BANK1
	frame_oam -12,   0, $9c, 7 | OAM_BANK1
	frame_oam -12,   8, $9e, 6 | OAM_BANK1
	db $80

.frame_53
	frame_oam -28,   8, $40, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -28,   0, $42, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -28,  -8, $76, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -28, -16, $78, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -12,   8, $b2, 6 | OAM_BANK1 | OAM_XFLIP
	frame_oam -12,   0, $b4, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -12,  -8, $9c, 7 | OAM_BANK1 | OAM_XFLIP
	frame_oam -12, -16, $9e, 6 | OAM_BANK1 | OAM_XFLIP
	db $80
