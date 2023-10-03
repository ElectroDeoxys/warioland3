OAM_180000::
	dw .frame_0

.frame_0
	db $80

OAM_180003::
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

.frame_0
	frame_oam -16,   0, $f8, 2 | OAMF_XFLIP
	frame_oam -16,  -8, $f8, 2
	db $80

.frame_1
.frame_2
	frame_oam -16,  -4, $fa, 2
	db $80

.frame_3
	frame_oam -16,  -4, $fc, 2
	db $80

.frame_4
	frame_oam -16,  -4, $fc, 2 | OAMF_XFLIP
	db $80

.frame_5
.frame_6
	frame_oam -16,  -4, $fa, 2 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -16,   0, $f8, 2 | OAMF_XFLIP
	frame_oam -16,  -8, $f8, 2
	db $80

.frame_8
	frame_oam -16,  -8, $f8, 3
	frame_oam -16,   0, $f8, 3 | OAMF_XFLIP
	frame_oam -33,  -6, $d2, 2 | OAMF_XFLIP
	db $80

.frame_9
.frame_10
	frame_oam -16,  -4, $fa, 3
	db $80

.frame_11
	frame_oam -16,  -4, $fc, 3
	db $80

.frame_12
	frame_oam -16,  -4, $fc, 3 | OAMF_XFLIP
	db $80

.frame_13
.frame_14
	frame_oam -16,  -4, $fa, 3 | OAMF_XFLIP
	frame_oam -32,  -5, $cc, 2
	db $80

.frame_15
	frame_oam -16,  -8, $f8, 3
	frame_oam -16,   0, $f8, 3 | OAMF_XFLIP
	frame_oam -34,  -5, $c4, 2
	db $80

OAM_18007b::
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

.frame_0
	frame_oam -15, -15, $06, 4 | OAMF_BANK1
	frame_oam -16,   0, $04, 4 | OAMF_BANK1
	frame_oam -16,  -8, $02, 4 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,   0, $0a, 4 | OAMF_BANK1
	frame_oam -16,  -8, $08, 4 | OAMF_BANK1
	frame_oam -16, -16, $06, 4 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,   0, $0e, 4 | OAMF_BANK1
	frame_oam -16,  -8, $0c, 4 | OAMF_BANK1
	frame_oam -16, -16, $06, 4 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -15,   7, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -16,  -8, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16,  -8, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -16,  -8, $10, 4 | OAMF_BANK1
	frame_oam -15,   0, $04, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_7
	frame_oam -16,  -8, $12, 4 | OAMF_BANK1
	frame_oam -16,   0, $0a, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_8
	frame_oam -16,  -8, $14, 4 | OAMF_BANK1
	frame_oam -16,   0, $0e, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_9
	frame_oam -16,   0, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -8, $04, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_10
	frame_oam -16,   0, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_11
	frame_oam -16,   0, $14, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_12
	frame_oam -16,   0, $2e, 4 | OAMF_BANK1
	frame_oam -16,  -8, $2c, 4 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -16,   0, $12, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16,  -8, $2e, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $2c, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_15
	frame_oam -16,  -8, $2e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $2c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -16,  -8, $12, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   0, $0a, 4 | OAMF_BANK1
	db $80

.frame_17
	frame_oam -16,   0, $2e, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -8, $2c, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_18
	frame_oam -16,   3, $24, 4 | OAMF_BANK1
	frame_oam -16,  -5, $22, 4 | OAMF_BANK1
	frame_oam -16, -13, $20, 4 | OAMF_BANK1
	db $80

.frame_19
	frame_oam -17,   3, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,  -4, $28, 4 | OAMF_BANK1
	frame_oam -17, -12, $26, 4 | OAMF_BANK1
	db $80

.frame_20
	frame_oam -16, -12, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -31,  -4, $00, 4 | OAMF_BANK1
	frame_oam -15,   3, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -4, $36, 4 | OAMF_BANK1
	frame_oam -15, -12, $34, 4 | OAMF_BANK1
	db $80

.frame_22
	frame_oam -15,   3, $38, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -12, $38, 4 | OAMF_BANK1
	frame_oam -15,  -4, $3a, 4 | OAMF_BANK1
	frame_oam -31,  -4, $1e, 4 | OAMF_BANK1
	db $80

.frame_23
	frame_oam -15, -15, $06, 4 | OAMF_BANK1
	frame_oam -16,  -8, $30, 4 | OAMF_BANK1
	frame_oam -16,   0, $32, 4 | OAMF_BANK1
	db $80

.frame_24
	frame_oam -15,   7, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $30, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $32, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -14, -15, $06, 4 | OAMF_BANK1
	frame_oam -16,  -8, $16, 4 | OAMF_BANK1
	frame_oam -16,   0, $18, 4 | OAMF_BANK1
	db $80

.frame_26
	frame_oam -15, -16, $06, 4 | OAMF_BANK1
	frame_oam -16,  -8, $1a, 4 | OAMF_BANK1
	frame_oam -16,   0, $1c, 4 | OAMF_BANK1
	db $80

.frame_27
	frame_oam -14,   7, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam -15,   8, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_29
	frame_oam -15,   3, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -4, $3e, 4 | OAMF_BANK1
	frame_oam -15, -12, $3c, 4 | OAMF_BANK1
	db $80

.frame_30
	frame_oam -15,   3, $38, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -12, $38, 4 | OAMF_BANK1
	frame_oam -15,  -4, $2a, 4 | OAMF_BANK1
	db $80

.frame_31
	frame_oam -15,   3, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -4, $28, 4 | OAMF_BANK1
	frame_oam -15, -12, $26, 4 | OAMF_BANK1
	db $80

.frame_32
	frame_oam -16,   3, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $3c, 4 | OAMF_BANK1
	frame_oam -16,  -4, $28, 4 | OAMF_BANK1
	db $80

OAM_180242::
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

.frame_0
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $42, 5 | OAMF_BANK1
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,  -5, $44, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $46, 5 | OAMF_BANK1
	frame_oam -16, -20, $44, 5 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,  -5, $48, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $4a, 5 | OAMF_BANK1
	frame_oam -16, -20, $48, 5 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,  -5, $4c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $4e, 5 | OAMF_BANK1
	frame_oam -16, -20, $4c, 5 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -16,  -5, $50, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $52, 5 | OAMF_BANK1
	frame_oam -16, -20, $50, 5 | OAMF_BANK1
	db $80

.frame_5
	frame_oam  -4,  -9, $5a, 5 | OAMF_BANK1
	frame_oam  -4, -17, $58, 5 | OAMF_BANK1
	frame_oam -20,  -9, $56, 5 | OAMF_BANK1
	frame_oam -20, -17, $54, 5 | OAMF_BANK1
	db $80

.frame_6
	frame_oam  -4, -15, $5a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -4,  -7, $58, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -15, $56, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,  -7, $54, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -16, -20, $6e, 5 | OAMF_BANK1
	frame_oam -16, -12, $70, 5 | OAMF_BANK1
	frame_oam -16,  -5, $6e, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -12,   0, $5c, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -12,  -8, $5c, 5 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -12,   0, $5e, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -12,  -8, $5e, 5 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -12,   0, $5c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,  -8, $5c, 5 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_11
	frame_oam -12,   0, $5e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,  -8, $5e, 5 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_12
	frame_oam -16,  -5, $48, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $4a, 5 | OAMF_BANK1
	frame_oam -16, -20, $48, 5 | OAMF_BANK1
	frame_oam -32, -23, $66, 5 | OAMF_BANK1
	frame_oam -32,  -1, $66, 5 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -16,  -5, $48, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $4a, 5 | OAMF_BANK1
	frame_oam -16, -20, $48, 5 | OAMF_BANK1
	frame_oam -32, -23, $68, 5 | OAMF_BANK1
	frame_oam -32,  -1, $68, 5 | OAMF_BANK1
	db $80

.frame_14
	frame_oam -12,  -8, $60, 5 | OAMF_BANK1
	frame_oam -12,   0, $60, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_15
	frame_oam -12,  -8, $62, 5 | OAMF_BANK1
	frame_oam -12,   0, $62, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_16
	frame_oam -12,  -8, $64, 5 | OAMF_BANK1
	frame_oam -12,   0, $64, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_17
	frame_oam -16,  -5, $4c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $4c, 5 | OAMF_BANK1
	frame_oam -16, -12, $6c, 5 | OAMF_BANK1
	db $80

.frame_18
	frame_oam -16, -20, $6a, 5 | OAMF_BANK1
	frame_oam -16, -12, $6c, 5 | OAMF_BANK1
	frame_oam -16,  -5, $6a, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16, -12, $7e, 5 | OAMF_BANK1
	frame_oam -32, -16, $72, 5 | OAMF_BANK1
	frame_oam -32,  -9, $72, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16, -12, $7e, 5 | OAMF_BANK1
	frame_oam -32, -16, $74, 5 | OAMF_BANK1
	frame_oam -32,  -9, $74, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16, -12, $7e, 5 | OAMF_BANK1
	frame_oam -32, -19, $76, 5 | OAMF_BANK1
	frame_oam -32, -11, $78, 5 | OAMF_BANK1
	db $80

.frame_22
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16, -12, $7e, 5 | OAMF_BANK1
	frame_oam -31, -20, $7a, 5 | OAMF_BANK1
	frame_oam -31, -12, $7c, 5 | OAMF_BANK1
	db $80

.frame_23
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16, -12, $7e, 5 | OAMF_BANK1
	frame_oam -32, -21, $76, 5 | OAMF_BANK1
	frame_oam -32, -13, $78, 5 | OAMF_BANK1
	db $80

.frame_24
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16, -12, $7e, 5 | OAMF_BANK1
	frame_oam -32, -22, $7a, 5 | OAMF_BANK1
	frame_oam -32, -14, $7c, 5 | OAMF_BANK1
	db $80

.frame_25
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16, -12, $7e, 5 | OAMF_BANK1
	frame_oam -32, -22, $76, 5 | OAMF_BANK1
	frame_oam -32, -14, $78, 5 | OAMF_BANK1
	db $80

.frame_26
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16, -12, $7e, 5 | OAMF_BANK1
	frame_oam -32, -20, $74, 5 | OAMF_BANK1
	frame_oam -32, -13, $74, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16, -12, $7e, 5 | OAMF_BANK1
	frame_oam -32, -10, $76, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -18, $78, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16, -12, $7e, 5 | OAMF_BANK1
	frame_oam -32,  -9, $7a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -17, $7c, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_29
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16, -12, $7e, 5 | OAMF_BANK1
	frame_oam -32,  -8, $76, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $78, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_30
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16, -12, $7e, 5 | OAMF_BANK1
	frame_oam -32,  -7, $7a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -15, $7c, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_31
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16, -12, $7e, 5 | OAMF_BANK1
	frame_oam -32,  -6, $76, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -14, $78, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_32
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -13, $7e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -5, $7a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31, -13, $7c, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_33
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -13, $7e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -4, $76, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $78, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_34
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -13, $7e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -3, $7a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -11, $7c, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_35
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -13, $7e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -3, $76, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -11, $78, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_36
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -13, $7e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -5, $74, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $74, 5 | OAMF_BANK1
	db $80

.frame_37
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -13, $7e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -15, $76, 5 | OAMF_BANK1
	frame_oam -32,  -7, $78, 5 | OAMF_BANK1
	db $80

.frame_38
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -13, $7e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $7a, 5 | OAMF_BANK1
	frame_oam -32,  -8, $7c, 5 | OAMF_BANK1
	db $80

.frame_39
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -13, $7e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -17, $76, 5 | OAMF_BANK1
	frame_oam -32,  -9, $78, 5 | OAMF_BANK1
	db $80

.frame_40
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -13, $7e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -18, $7a, 5 | OAMF_BANK1
	frame_oam -32, -10, $7c, 5 | OAMF_BANK1
	db $80

.frame_41
	frame_oam -16,  -5, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $40, 5 | OAMF_BANK1
	frame_oam -16, -12, $7e, 5 | OAMF_BANK1
	db $80

OAM_180564::
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
	frame_oam   0,   0, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -8, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 6 | OAMF_BANK1
	frame_oam   0, -24, $84, 6 | OAMF_BANK1
	frame_oam -16, -16, $82, 6 | OAMF_BANK1
	frame_oam -16, -24, $80, 6 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,  -8, $90, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $90, 6 | OAMF_BANK1
	frame_oam   0,   0, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -8, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 6 | OAMF_BANK1
	frame_oam   0, -24, $84, 6 | OAMF_BANK1
	frame_oam -16, -24, $80, 6 | OAMF_BANK1
	db $80

.frame_2
	frame_oam   0,   0, $8e, 6 | OAMF_BANK1
	frame_oam -16,   0, $8c, 6 | OAMF_BANK1
	frame_oam   0, -24, $8a, 6 | OAMF_BANK1
	frame_oam -16, -24, $88, 6 | OAMF_BANK1
	frame_oam   0,  -8, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 6 | OAMF_BANK1
	frame_oam -16, -16, $82, 6 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,  -8, $92, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $92, 6 | OAMF_BANK1
	frame_oam   0, -24, $8e, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -24, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   0, $8a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $88, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 6 | OAMF_BANK1
	frame_oam   0,  -8, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -16,  -8, $92, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $92, 6 | OAMF_BANK1
	frame_oam   0,   0, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -8, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 6 | OAMF_BANK1
	frame_oam   0, -24, $84, 6 | OAMF_BANK1
	frame_oam -16, -24, $80, 6 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16,  -8, $94, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $94, 6 | OAMF_BANK1
	frame_oam   0,   0, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -8, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 6 | OAMF_BANK1
	frame_oam   0, -24, $84, 6 | OAMF_BANK1
	frame_oam -16, -24, $80, 6 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16,  -8, $96, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $96, 6 | OAMF_BANK1
	frame_oam   0,   0, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -8, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 6 | OAMF_BANK1
	frame_oam   0, -24, $84, 6 | OAMF_BANK1
	frame_oam -16, -24, $80, 6 | OAMF_BANK1
	db $80

.frame_7
	frame_oam   0,  -8, $9e, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $9a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   0, $9c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $98, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $9e, 6 | OAMF_BANK1
	frame_oam   0, -24, $9c, 6 | OAMF_BANK1
	frame_oam -16, -16, $9a, 6 | OAMF_BANK1
	frame_oam -16, -24, $98, 6 | OAMF_BANK1
	db $80

.frame_8
	frame_oam   0,   0, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -8, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 6 | OAMF_BANK1
	frame_oam   0, -24, $84, 6 | OAMF_BANK1
	frame_oam -16, -24, $80, 6 | OAMF_BANK1
	frame_oam -16,  -8, $96, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $96, 6 | OAMF_BANK1
	frame_oam -32, -26, $a0, 6 | OAMF_BANK1
	frame_oam -32,   3, $a0, 6 | OAMF_BANK1
	db $80

.frame_9
	frame_oam   0,   0, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -8, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 6 | OAMF_BANK1
	frame_oam   0, -24, $84, 6 | OAMF_BANK1
	frame_oam -16, -24, $80, 6 | OAMF_BANK1
	frame_oam -16, -16, $a4, 6 | OAMF_BANK1
	frame_oam -16,  -8, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -26, $a2, 6 | OAMF_BANK1
	frame_oam -32,   3, $a2, 6 | OAMF_BANK1
	db $80

.frame_10
	frame_oam   0,   0, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -8, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 6 | OAMF_BANK1
	frame_oam   0, -24, $84, 6 | OAMF_BANK1
	frame_oam -16, -24, $80, 6 | OAMF_BANK1
	frame_oam -16, -16, $a4, 6 | OAMF_BANK1
	frame_oam -16,  -8, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -19, -24, $a6, 6 | OAMF_BANK1
	frame_oam -19, -16, $a8, 6 | OAMF_BANK1
	frame_oam -19,   0, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,  -8, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3, -24, $aa, 6 | OAMF_BANK1
	frame_oam  -3, -16, $ac, 6 | OAMF_BANK1
	frame_oam  -3,   0, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3,  -8, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -19, -24, $a6, 6 | OAMF_BANK1
	frame_oam -19,   0, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3, -24, $aa, 6 | OAMF_BANK1
	frame_oam  -3, -16, $ac, 6 | OAMF_BANK1
	frame_oam  -3,   0, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3,  -8, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -16, $ae, 6 | OAMF_BANK1
	frame_oam -19,  -8, $b0, 6 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -19,   0, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -24, $a6, 6 | OAMF_BANK1
	frame_oam  -3,   0, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3,  -8, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3, -24, $aa, 6 | OAMF_BANK1
	frame_oam  -3, -16, $ac, 6 | OAMF_BANK1
	frame_oam -19,  -8, $ae, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -16, $b0, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16,   0, $8c, 6 | OAMF_BANK1
	frame_oam -16, -24, $88, 6 | OAMF_BANK1
	frame_oam   0,  -8, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 6 | OAMF_BANK1
	frame_oam -16, -16, $82, 6 | OAMF_BANK1
	frame_oam   0, -24, $b2, 6 | OAMF_BANK1
	frame_oam   0,   0, $b8, 6 | OAMF_BANK1
	db $80

.frame_15
	frame_oam -16,   0, $8c, 6 | OAMF_BANK1
	frame_oam -16, -24, $88, 6 | OAMF_BANK1
	frame_oam   0,  -8, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 6 | OAMF_BANK1
	frame_oam -16, -16, $82, 6 | OAMF_BANK1
	frame_oam   0, -24, $b4, 6 | OAMF_BANK1
	frame_oam   0,   0, $b6, 6 | OAMF_BANK1
	db $80

.frame_16
	frame_oam -16,  -8, $92, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $92, 6 | OAMF_BANK1
	frame_oam -16, -24, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $88, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 6 | OAMF_BANK1
	frame_oam   0,  -8, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -24, $b6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   0, $b4, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -16,  -8, $92, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $92, 6 | OAMF_BANK1
	frame_oam -16, -24, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $88, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 6 | OAMF_BANK1
	frame_oam   0,  -8, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -24, $b8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   0, $b2, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -19,   0, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -24, $a6, 6 | OAMF_BANK1
	frame_oam  -3,   0, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3,  -8, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3, -24, $aa, 6 | OAMF_BANK1
	frame_oam  -3, -16, $ac, 6 | OAMF_BANK1
	frame_oam -19, -16, $ba, 6 | OAMF_BANK1
	frame_oam -19,  -8, $ba, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,  -8, $ba, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -19,   0, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19, -24, $a6, 6 | OAMF_BANK1
	frame_oam  -3,   0, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3,  -8, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -3, -24, $aa, 6 | OAMF_BANK1
	frame_oam  -3, -16, $ac, 6 | OAMF_BANK1
	frame_oam -19, -16, $bc, 6 | OAMF_BANK1
	frame_oam -19,  -8, $bc, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_180838::
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

.frame_0
	frame_oam -16,  -1, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $c0, 7 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,  -8, $c2, 7 | OAMF_BANK1
	frame_oam -16,  -1, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam  -8,   0, $c4, 7 | OAMF_BANK1
	frame_oam  -8,  -8, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam  -8,   0, $c6, 7 | OAMF_BANK1
	frame_oam  -8,  -8, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam   0,   8, $c8, 7 | OAMF_BANK1
	frame_oam -16,   8, $c8, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16, -16, $c8, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0, -16, $c8, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16, -12, $ca, 7 | OAMF_BANK1
	frame_oam -16,  -4, $cc, 7 | OAMF_BANK1
	frame_oam -16,   3, $ca, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $ce, 7 | OAMF_BANK1
	frame_oam -32,  -1, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -16, -12, $d0, 7 | OAMF_BANK1
	frame_oam -16,  -4, $d2, 7 | OAMF_BANK1
	frame_oam -16,   3, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $d4, 7 | OAMF_BANK1
	frame_oam -32,  -4, $d6, 7 | OAMF_BANK1
	frame_oam -32,   3, $d4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -16, -12, $d8, 7 | OAMF_BANK1
	frame_oam -16,  -4, $da, 7 | OAMF_BANK1
	frame_oam -16,   3, $d8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $dc, 7 | OAMF_BANK1
	frame_oam -32,  -4, $de, 7 | OAMF_BANK1
	frame_oam -32,   3, $dc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -16, -12, $e0, 7 | OAMF_BANK1
	frame_oam -16,  -4, $e2, 7 | OAMF_BANK1
	frame_oam -16,   3, $e0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $e4, 7 | OAMF_BANK1
	frame_oam -32,  -4, $e6, 7 | OAMF_BANK1
	frame_oam -32,   3, $e4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam  -8,  -8, $e8, 7 | OAMF_BANK1
	frame_oam  -8,   0, $e8, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam  -8,  -8, $ea, 7 | OAMF_BANK1
	frame_oam  -8,   0, $ea, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam  -8,  -8, $ec, 7 | OAMF_BANK1
	frame_oam  -8,   0, $ec, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam  -8,  -8, $ee, 7 | OAMF_BANK1
	frame_oam  -8,   0, $ee, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam  -8,   0, $f0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -8, $f0, 7 | OAMF_BANK1
	db $80

OAM_180916::
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
	frame_oam -16,  -4, $00, 4 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,  -4, $02, 4 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,  -8, $04, 4 | OAMF_BANK1
	frame_oam -16,  -1, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam  -8,  -8, $06, 4 | OAMF_BANK1
	frame_oam  -8,  -1, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -4, $08, 4 | OAMF_BANK1
	db $80

.frame_4
	frame_oam  -8,  -8, $06, 4 | OAMF_BANK1
	frame_oam  -8,  -1, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -4, $0a, 4 | OAMF_BANK1
	db $80

.frame_5
	frame_oam  -8,  -8, $06, 4 | OAMF_BANK1
	frame_oam  -8,  -1, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -8, $0c, 4 | OAMF_BANK1
	frame_oam -24,  -1, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam  -8,  -8, $06, 4 | OAMF_BANK1
	frame_oam  -8,  -1, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -8, $12, 4 | OAMF_BANK1
	frame_oam -24,  -1, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -16,  -8, $1a, 4 | OAMF_BANK1
	frame_oam -16,  -1, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -16,  -8, $12, 4 | OAMF_BANK1
	frame_oam -16,  -1, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -16,  -8, $14, 4 | OAMF_BANK1
	frame_oam -16,   0, $16, 4 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -16,  -8, $18, 4 | OAMF_BANK1
	frame_oam -16,  -1, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -15,  -8, $14, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -15,   0, $16, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_12
	frame_oam -16,  -8, $1c, 4 | OAMF_BANK1
	frame_oam -16,  -1, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -16,  -8, $1e, 4 | OAMF_BANK1
	frame_oam -16,  -1, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16,  -8, $20, 4 | OAMF_BANK1
	frame_oam -16,   0, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam  -8,  -4, $22, 4 | OAMF_BANK1
	db $80

.frame_16
	frame_oam  -8,  -4, $24, 4 | OAMF_BANK1
	db $80

.frame_17
	frame_oam  -8,  -8, $06, 4 | OAMF_BANK1
	frame_oam  -8,  -1, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -8, $0e, 4 | OAMF_BANK1
	frame_oam -24,  -1, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam  -8,  -8, $06, 4 | OAMF_BANK1
	frame_oam  -8,  -1, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -8, $10, 4 | OAMF_BANK1
	frame_oam -24,  -1, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_1809ff::
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
	frame_oam -31, -12, $40, 5 | OAMF_BANK1
	frame_oam -31,  -4, $42, 5 | OAMF_BANK1
	frame_oam -15, -12, $60, 5 | OAMF_BANK1
	frame_oam -15,  -4, $62, 5 | OAMF_BANK1
	frame_oam -31,   4, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   4, $60, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -31, -12, $44, 5 | OAMF_BANK1
	frame_oam -31,  -4, $46, 5 | OAMF_BANK1
	frame_oam -15, -12, $64, 5 | OAMF_BANK1
	frame_oam -15,  -4, $66, 5 | OAMF_BANK1
	frame_oam -31,   4, $44, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   4, $64, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -32, -12, $48, 5 | OAMF_BANK1
	frame_oam -32,  -4, $4a, 5 | OAMF_BANK1
	frame_oam -32,   4, $4c, 5 | OAMF_BANK1
	frame_oam -16, -12, $68, 5 | OAMF_BANK1
	frame_oam -16,  -4, $6a, 5 | OAMF_BANK1
	frame_oam -16,   4, $6c, 5 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -32,   4, $48, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -4, $4a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $4c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $68, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $6a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $6c, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -31, -12, $4e, 5 | OAMF_BANK1
	frame_oam -31,  -4, $50, 5 | OAMF_BANK1
	frame_oam -15, -12, $6e, 5 | OAMF_BANK1
	frame_oam -15,  -4, $70, 5 | OAMF_BANK1
	frame_oam -31,   4, $4e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   4, $6e, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -31, -12, $52, 5 | OAMF_BANK1
	frame_oam -31,  -4, $54, 5 | OAMF_BANK1
	frame_oam -15, -12, $72, 5 | OAMF_BANK1
	frame_oam -15,  -4, $74, 5 | OAMF_BANK1
	frame_oam -31,   4, $52, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   4, $72, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam  -9, -12, $52, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -9,  -4, $54, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -25, -12, $72, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -25,  -4, $74, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -9,   4, $52, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -25,   4, $72, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_7
	frame_oam  -9, -12, $40, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -25, -12, $60, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -25,  -4, $62, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -9,   4, $40, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -25,   4, $60, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -9,  -4, $54, 5 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_8
	frame_oam -31, -12, $56, 5 | OAMF_BANK1
	frame_oam -31,  -4, $58, 5 | OAMF_BANK1
	frame_oam -15, -12, $76, 5 | OAMF_BANK1
	frame_oam -15,  -4, $78, 5 | OAMF_BANK1
	frame_oam -31,   4, $56, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   4, $76, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -31, -12, $5a, 5 | OAMF_BANK1
	frame_oam -15, -12, $7a, 5 | OAMF_BANK1
	frame_oam -31,   4, $5a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   4, $7a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -4, $5c, 5 | OAMF_BANK1
	frame_oam -15,  -4, $5e, 5 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -30, -12, $40, 5 | OAMF_BANK1
	frame_oam -14, -12, $60, 5 | OAMF_BANK1
	frame_oam -14,  -4, $62, 5 | OAMF_BANK1
	frame_oam -30,   4, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14,   4, $60, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30,  -4, $54, 5 | OAMF_BANK1
	db $80

.frame_11
	frame_oam -31, -12, $4e, 5 | OAMF_BANK1
	frame_oam -15, -12, $6e, 5 | OAMF_BANK1
	frame_oam -15,  -4, $70, 5 | OAMF_BANK1
	frame_oam -31,   4, $4e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   4, $6e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -4, $46, 5 | OAMF_BANK1
	db $80

OAM_180b43::
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

.frame_0
	frame_oam -16,  -8, $40, 5 | OAMF_BANK1
	frame_oam -16,   0, $42, 5 | OAMF_BANK1
	frame_oam -16, -13, $5c, 3 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,  -8, $44, 5 | OAMF_BANK1
	frame_oam -16,   0, $46, 5 | OAMF_BANK1
	frame_oam -15, -12, $5e, 3 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,  -8, $40, 5 | OAMF_BANK1
	frame_oam -16,   0, $42, 5 | OAMF_BANK1
	frame_oam -16, -13, $60, 3 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,  -8, $48, 5 | OAMF_BANK1
	frame_oam -16,   0, $4a, 5 | OAMF_BANK1
	frame_oam -17, -14, $62, 3 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -16,   0, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $42, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   5, $5c, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16,   0, $44, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $46, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   4, $5e, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -16,   0, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $42, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   5, $60, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -16,   0, $48, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $4a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,   6, $62, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -16,  -8, $40, 5 | OAMF_BANK1
	frame_oam -16,   0, $42, 5 | OAMF_BANK1
	frame_oam -29,  -9, $64, 3 | OAMF_BANK1
	frame_oam -33,  -1, $66, 3 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -16,  -8, $44, 5 | OAMF_BANK1
	frame_oam -16,   0, $46, 5 | OAMF_BANK1
	frame_oam -28,  -8, $68, 3 | OAMF_BANK1
	frame_oam -32,   0, $6a, 3 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -16,  -8, $40, 5 | OAMF_BANK1
	frame_oam -16,   0, $42, 5 | OAMF_BANK1
	frame_oam -29,  -9, $6c, 3 | OAMF_BANK1
	frame_oam -33,  -1, $6e, 3 | OAMF_BANK1
	db $80

.frame_11
	frame_oam -16,  -8, $48, 5 | OAMF_BANK1
	frame_oam -16,   0, $4a, 5 | OAMF_BANK1
	frame_oam -30, -10, $70, 3 | OAMF_BANK1
	frame_oam -34,  -2, $72, 3 | OAMF_BANK1
	db $80

.frame_12
	frame_oam -16,   0, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $42, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   1, $64, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -33,  -7, $66, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -16,   0, $44, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $46, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28,   0, $68, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $6a, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16,   0, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $42, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   1, $6c, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -33,  -7, $6e, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -16,   0, $48, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $4a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30,   2, $70, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -34,  -6, $72, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -16,  -8, $40, 5 | OAMF_BANK1
	frame_oam -16,   0, $42, 5 | OAMF_BANK1
	frame_oam -16, -15, $74, 3 | OAMF_BANK1
	db $80

.frame_17
	frame_oam -16,  -8, $40, 5 | OAMF_BANK1
	frame_oam -16,   0, $42, 5 | OAMF_BANK1
	frame_oam -10, -15, $76, 3 | OAMF_BANK1
	db $80

.frame_18
	frame_oam -16,  -8, $40, 5 | OAMF_BANK1
	frame_oam -16,   0, $42, 5 | OAMF_BANK1
	frame_oam -24, -11, $7e, 3 | OAMF_BANK1
	db $80

.frame_19
	frame_oam -16,  -8, $40, 5 | OAMF_BANK1
	frame_oam -16,   0, $42, 5 | OAMF_BANK1
	frame_oam -25,  -5, $7c, 3 | OAMF_BANK1
	db $80

.frame_20
	frame_oam -16,  -8, $40, 5 | OAMF_BANK1
	frame_oam -16,   0, $42, 5 | OAMF_BANK1
	frame_oam -25,  -5, $7a, 3 | OAMF_BANK1
	db $80

.frame_21
	frame_oam -16,   0, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $42, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   7, $74, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -16,   0, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $42, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,   7, $76, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -16,   0, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $42, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,   3, $7e, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -16,   0, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $42, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -25,  -3, $7c, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -16,   0, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $42, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -25,  -3, $7a, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -16,  -1, $54, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -13,   5, $7c, 3 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $54, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_27
	frame_oam -15,  -7, $56, 5 | OAMF_BANK1
	frame_oam -15,   1, $58, 5 | OAMF_BANK1
	frame_oam   1,  -8, $76, 3 | OAMF_BANK1
	frame_oam   1,   0, $78, 5 | OAMF_BANK1
	db $80

.frame_28
	frame_oam -13,  -8, $54, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -14, $7c, 3 | OAMF_BANK1
	frame_oam -13,  -1, $54, 5 | OAMF_BANK1
	db $80

.frame_29
	frame_oam -14,  -2, $56, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -14, -10, $58, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -30,  -1, $76, 3 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -30,  -9, $78, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_30
	frame_oam -12,  -1, $5a, 5 | OAMF_BANK1
	frame_oam -12,  -8, $5a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,  -4, $7c, 3 | OAMF_BANK1
	db $80

.frame_31
	frame_oam -12,  -1, $5a, 5 | OAMF_BANK1
	frame_oam -12,  -8, $5a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,  -4, $7a, 3 | OAMF_BANK1
	db $80

.frame_32
	frame_oam -12,  -1, $5a, 5 | OAMF_BANK1
	frame_oam -12,  -8, $5a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -27,  -8, $64, 3 | OAMF_BANK1
	frame_oam -31,   0, $66, 3 | OAMF_BANK1
	db $80

.frame_33
	frame_oam -12,  -3, $5a, 5 | OAMF_BANK1
	frame_oam -12, -10, $5a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -2, $6a, 3 | OAMF_BANK1
	frame_oam -27, -10, $68, 3 | OAMF_BANK1
	db $80

.frame_34
	frame_oam -12,  -4, $5a, 5 | OAMF_BANK1
	frame_oam -12, -11, $5a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -3, $6e, 3 | OAMF_BANK1
	frame_oam -27, -11, $6c, 3 | OAMF_BANK1
	db $80

.frame_35
	frame_oam -12,  -3, $5a, 5 | OAMF_BANK1
	frame_oam -12, -10, $5a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,  -2, $72, 3 | OAMF_BANK1
	frame_oam -27, -10, $70, 3 | OAMF_BANK1
	db $80

.frame_36
	frame_oam -17, -15, $74, 3 | OAMF_BANK1
	frame_oam -16,  -8, $48, 5 | OAMF_BANK1
	frame_oam -16,   0, $4a, 5 | OAMF_BANK1
	db $80

.frame_37
	frame_oam -16,  -8, $50, 5 | OAMF_BANK1
	frame_oam -16,   0, $52, 5 | OAMF_BANK1
	frame_oam -16, -15, $5c, 3 | OAMF_BANK1
	db $80

.frame_38
	frame_oam -17,   7, $74, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $48, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $4a, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_39
	frame_oam -16,   0, $50, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $52, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   7, $5c, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_40
	frame_oam -30,  -9, $64, 3 | OAMF_BANK1
	frame_oam -34,  -1, $66, 3 | OAMF_BANK1
	frame_oam -16,  -8, $48, 5 | OAMF_BANK1
	frame_oam -16,   0, $4a, 5 | OAMF_BANK1
	db $80

.frame_41
	frame_oam -16,  -8, $50, 5 | OAMF_BANK1
	frame_oam -16,   0, $52, 5 | OAMF_BANK1
	frame_oam -29, -10, $64, 3 | OAMF_BANK1
	frame_oam -33,  -2, $66, 3 | OAMF_BANK1
	db $80

.frame_42
	frame_oam -30,   1, $64, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -34,  -7, $66, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $48, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $4a, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_43
	frame_oam -16,   0, $50, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $52, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,   2, $64, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -33,  -6, $66, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_44
	frame_oam -16,  -1, $4c, 5 | OAMF_BANK1
	frame_oam -16,  -8, $4c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30,  -8, $64, 3 | OAMF_BANK1
	frame_oam -34,   0, $66, 3 | OAMF_BANK1
	db $80

.frame_45
	frame_oam -16,  -1, $4e, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -8, $54, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -12,   5, $7c, 3 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_46
	frame_oam -16,  -8, $4e, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -1, $54, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -13,   5, $7c, 3 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_47
	frame_oam -16,  -7, $4e, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $54, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -12, -13, $7c, 3 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_48
	frame_oam -16,   0, $4e, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -7, $54, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -13, -13, $7c, 3 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_49
	frame_oam -12,   1, $5a, 5 | OAMF_BANK1
	frame_oam -12,  -6, $5a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,   2, $6a, 3 | OAMF_BANK1
	frame_oam -27,  -6, $68, 3 | OAMF_BANK1
	db $80

.frame_50
	frame_oam -12,   2, $5a, 5 | OAMF_BANK1
	frame_oam -12,  -5, $5a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,   3, $6e, 3 | OAMF_BANK1
	frame_oam -27,  -5, $6c, 3 | OAMF_BANK1
	db $80

.frame_51
	frame_oam -12,   1, $5a, 5 | OAMF_BANK1
	frame_oam -12,  -6, $5a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31,   2, $72, 3 | OAMF_BANK1
	frame_oam -27,  -6, $70, 3 | OAMF_BANK1
	db $80

OAM_180ea7::
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

.frame_0
	frame_oam -16,  -8, $a2, 6 | OAMF_BANK1
	frame_oam -16,   0, $a4, 6 | OAMF_BANK1
	frame_oam -32, -16, $80, 2 | OAMF_BANK1
	frame_oam -32,  -8, $82, 2 | OAMF_BANK1
	frame_oam -16, -13, $86, 6 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,  -8, $a6, 6 | OAMF_BANK1
	frame_oam -16,   0, $a8, 6 | OAMF_BANK1
	frame_oam -33, -15, $80, 2 | OAMF_BANK1
	frame_oam -33,  -7, $82, 2 | OAMF_BANK1
	frame_oam -17, -12, $86, 6 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,  -8, $aa, 6 | OAMF_BANK1
	frame_oam -16,   0, $ac, 6 | OAMF_BANK1
	frame_oam -17, -12, $86, 6 | OAMF_BANK1
	frame_oam -33, -15, $80, 2 | OAMF_BANK1
	frame_oam -33,  -7, $82, 2 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,   0, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   8, $80, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $82, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   5, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -16,   0, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -33,   7, $80, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -33,  -1, $82, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,   4, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16,   0, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,   4, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -33,   7, $80, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -33,  -1, $82, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -16,   0, $a4, 6 | OAMF_BANK1
	frame_oam -16,  -8, $a2, 6 | OAMF_BANK1
	frame_oam -20, -13, $84, 6 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16,   0, $a8, 6 | OAMF_BANK1
	frame_oam -16,  -8, $a6, 6 | OAMF_BANK1
	frame_oam -19, -12, $84, 6 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -16,   0, $ac, 6 | OAMF_BANK1
	frame_oam -16,  -8, $aa, 6 | OAMF_BANK1
	frame_oam -19, -12, $84, 6 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -16,  -8, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,   5, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -16,  -8, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,   4, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -16,  -8, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,   4, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -16,   0, $a4, 6 | OAMF_BANK1
	frame_oam -16,  -8, $8a, 6 | OAMF_BANK1
	frame_oam -21, -16, $88, 6 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -16,   0, $a4, 6 | OAMF_BANK1
	frame_oam -16,  -8, $90, 6 | OAMF_BANK1
	frame_oam -16, -22, $8c, 6 | OAMF_BANK1
	frame_oam -16, -14, $8e, 6 | OAMF_BANK1
	db $80

.frame_14
	frame_oam -16,  -8, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $8a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -21,   8, $88, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -16,  -8, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $90, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  14, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   6, $8e, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -16,   0, $a4, 6 | OAMF_BANK1
	frame_oam -16,  -8, $92, 6 | OAMF_BANK1
	frame_oam -19, -13, $84, 6 | OAMF_BANK1
	db $80

.frame_17
	frame_oam -16,   0, $a4, 6 | OAMF_BANK1
	frame_oam -16,  -8, $94, 6 | OAMF_BANK1
	frame_oam -18, -12, $84, 6 | OAMF_BANK1
	db $80

.frame_18
	frame_oam -16,  -8, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $92, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,   5, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -16,  -8, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $94, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18,   4, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -15,  -7, $96, 6 | OAMF_BANK1
	frame_oam -15,   1, $98, 6 | OAMF_BANK1
	db $80

.frame_21
	frame_oam -15,  -8, $9a, 6 | OAMF_BANK1
	frame_oam -15,   0, $9c, 6 | OAMF_BANK1
	db $80

.frame_22
	frame_oam -15,   0, $9c, 6 | OAMF_BANK1
	frame_oam -15,  -8, $9e, 6 | OAMF_BANK1
	db $80

.frame_23
	frame_oam -15,  -1, $96, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -9, $98, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -15,   0, $9a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,  -8, $9c, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -15,  -8, $9c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   0, $9e, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -16,  -8, $a2, 6 | OAMF_BANK1
	frame_oam -16,   0, $a4, 6 | OAMF_BANK1
	frame_oam -16, -13, $86, 6 | OAMF_BANK1
	frame_oam -32, -16, $ae, 2 | OAMF_BANK1
	frame_oam -32,  -9, $ae, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -16,   0, $a4, 6 | OAMF_BANK1
	frame_oam -16,  -8, $8a, 6 | OAMF_BANK1
	frame_oam -24, -24, $b2, 2 | OAMF_BANK1
	frame_oam -24, -16, $b4, 2 | OAMF_BANK1
	db $80

.frame_28
	frame_oam -16,   0, $a4, 6 | OAMF_BANK1
	frame_oam -16,  -8, $90, 6 | OAMF_BANK1
	frame_oam -16, -14, $8e, 6 | OAMF_BANK1
	frame_oam -16, -22, $b0, 2 | OAMF_BANK1
	db $80

.frame_29
	frame_oam -16,   0, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   5, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   8, $ae, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   1, $ae, 2 | OAMF_BANK1
	db $80

.frame_30
	frame_oam -16,  -8, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $8a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  16, $b2, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,   8, $b4, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_31
	frame_oam -16,  -8, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $90, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   6, $8e, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  14, $b0, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_32
	frame_oam -17,  -8, $80, 2 | OAMF_BANK1
	frame_oam -16,   0, $a0, 2 | OAMF_BANK1
	db $80

.frame_33
	frame_oam -17,   0, $80, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $a0, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_34
	frame_oam -16,  -8, $b6, 6 | OAMF_BANK1
	frame_oam -16,  -1, $b6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $b8, 2 | OAMF_BANK1
	frame_oam -32,  -1, $b8, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_35
	frame_oam -16,  -8, $b6, 6 | OAMF_BANK1
	frame_oam -16,  -1, $b6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -4, $ba, 6 | OAMF_BANK1
	db $80

.frame_36
	frame_oam -17,  -8, $aa, 6 | OAMF_BANK1
	frame_oam -17,   0, $ac, 6 | OAMF_BANK1
	frame_oam -18, -12, $86, 6 | OAMF_BANK1
	frame_oam -34, -15, $80, 2 | OAMF_BANK1
	frame_oam -34,  -7, $82, 2 | OAMF_BANK1
	db $80

.frame_37
	frame_oam -19,  -8, $a2, 6 | OAMF_BANK1
	frame_oam -19,   0, $a4, 6 | OAMF_BANK1
	frame_oam -35, -16, $80, 2 | OAMF_BANK1
	frame_oam -35,  -8, $82, 2 | OAMF_BANK1
	frame_oam -19, -13, $86, 6 | OAMF_BANK1
	db $80

.frame_38
	frame_oam -17,  -8, $a6, 6 | OAMF_BANK1
	frame_oam -17,   0, $a8, 6 | OAMF_BANK1
	frame_oam -34, -15, $80, 2 | OAMF_BANK1
	frame_oam -34,  -7, $82, 2 | OAMF_BANK1
	frame_oam -18, -12, $86, 6 | OAMF_BANK1
	db $80

.frame_39
	frame_oam -17,   0, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,  -8, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18,   4, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -34,   7, $80, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -34,  -1, $82, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_40
	frame_oam -19,   0, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,  -8, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -35,   8, $80, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -35,   0, $82, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -19,   5, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_41
	frame_oam -17,   0, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,  -8, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -34,   7, $80, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -34,  -1, $82, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18,   4, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_181189::
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
	frame_oam -32, -20, $c0, 5 | OAMF_BANK1
	frame_oam -32, -12, $c2, 5 | OAMF_BANK1
	frame_oam -32,  -4, $c0, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $cc, 5 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -16, -16, $cc, 5 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -20, $c4, 5 | OAMF_BANK1
	frame_oam -32,  -4, $c4, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $c6, 5 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -32, -20, $c0, 5 | OAMF_BANK1
	frame_oam -32,  -4, $c0, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 5 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $c8, 5 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -32, -20, $c4, 5 | OAMF_BANK1
	frame_oam -32,  -4, $c4, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 5 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $ca, 5 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -32, -20, $c0, 5 | OAMF_BANK1
	frame_oam -32, -12, $c2, 5 | OAMF_BANK1
	frame_oam -32,  -4, $c0, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 5 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -32, -20, $c4, 5 | OAMF_BANK1
	frame_oam -32, -12, $c6, 5 | OAMF_BANK1
	frame_oam -32,  -4, $c4, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 5 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -32, -20, $c0, 5 | OAMF_BANK1
	frame_oam -32,  -4, $c0, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $d0, 5 | OAMF_BANK1
	frame_oam -16, -16, $cc, 5 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -32, -20, $c4, 5 | OAMF_BANK1
	frame_oam -32,  -4, $c4, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $d2, 5 | OAMF_BANK1
	frame_oam -16, -16, $ce, 5 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -32, -20, $c0, 5 | OAMF_BANK1
	frame_oam -32,  -4, $c0, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $d4, 5 | OAMF_BANK1
	frame_oam -16, -16, $cc, 5 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -32, -12, $d6, 5 | OAMF_BANK1
	frame_oam -32, -20, $c4, 5 | OAMF_BANK1
	frame_oam -32,  -4, $c4, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 5 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -32, -20, $c4, 5 | OAMF_BANK1
	frame_oam -32,  -4, $c4, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $d2, 5 | OAMF_BANK1
	frame_oam -16, -16, $cc, 5 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -32, -20, $d8, 5 | OAMF_BANK1
	frame_oam -32, -12, $da, 5 | OAMF_BANK1
	frame_oam -32,  -4, $d8, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $cc, 5 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -32, -20, $dc, 5 | OAMF_BANK1
	frame_oam -32, -12, $de, 5 | OAMF_BANK1
	frame_oam -32,  -4, $dc, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $cc, 5 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -32, -20, $d8, 5 | OAMF_BANK1
	frame_oam -32, -12, $da, 5 | OAMF_BANK1
	frame_oam -32,  -4, $d8, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 5 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -32, -20, $dc, 5 | OAMF_BANK1
	frame_oam -32, -12, $de, 5 | OAMF_BANK1
	frame_oam -32,  -4, $dc, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 5 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -32, -20, $e0, 5 | OAMF_BANK1
	frame_oam -32, -12, $e2, 5 | OAMF_BANK1
	frame_oam -32,  -4, $e0, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $cc, 5 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -32, -20, $e4, 5 | OAMF_BANK1
	frame_oam -32, -12, $e6, 5 | OAMF_BANK1
	frame_oam -32,  -4, $e4, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $cc, 5 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -32, -20, $e0, 5 | OAMF_BANK1
	frame_oam -32,  -4, $e0, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $cc, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 5 | OAMF_BANK1
	frame_oam -32, -12, $e8, 5 | OAMF_BANK1
	db $80

.frame_18
	frame_oam -32, -20, $e4, 5 | OAMF_BANK1
	frame_oam -32,  -4, $e4, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $cc, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 5 | OAMF_BANK1
	frame_oam -32, -12, $ea, 5 | OAMF_BANK1
	db $80

.frame_19
	frame_oam -16, -20, $ec, 5 | OAMF_BANK1
	frame_oam -16, -12, $ee, 5 | OAMF_BANK1
	frame_oam -16,  -4, $ec, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $cc, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32,  -8, $ce, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_20
	frame_oam -16, -20, $ec, 5 | OAMF_BANK1
	frame_oam -16, -12, $ee, 5 | OAMF_BANK1
	frame_oam -16,  -4, $ec, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $cc, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32, -16, $ce, 5 | OAMF_BANK1 | OAMF_YFLIP
	db $80

OAM_18136c::
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
	frame_oam -32, -20, $c0, 7 | OAMF_BANK1
	frame_oam -32, -12, $c2, 7 | OAMF_BANK1
	frame_oam -32,  -4, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $cc, 7 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -16, -16, $cc, 7 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -20, $c4, 7 | OAMF_BANK1
	frame_oam -32,  -4, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $c6, 7 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -32, -20, $c0, 7 | OAMF_BANK1
	frame_oam -32,  -4, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 7 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $c8, 7 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -32, -20, $c4, 7 | OAMF_BANK1
	frame_oam -32,  -4, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 7 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $ca, 7 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -32, -20, $c0, 7 | OAMF_BANK1
	frame_oam -32, -12, $c2, 7 | OAMF_BANK1
	frame_oam -32,  -4, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 7 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -32, -20, $c4, 7 | OAMF_BANK1
	frame_oam -32, -12, $c6, 7 | OAMF_BANK1
	frame_oam -32,  -4, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 7 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -32, -20, $c0, 7 | OAMF_BANK1
	frame_oam -32,  -4, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $d0, 7 | OAMF_BANK1
	frame_oam -16, -16, $cc, 7 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -32, -20, $c4, 7 | OAMF_BANK1
	frame_oam -32,  -4, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $d2, 7 | OAMF_BANK1
	frame_oam -16, -16, $ce, 7 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -32, -20, $c0, 7 | OAMF_BANK1
	frame_oam -32,  -4, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $d4, 7 | OAMF_BANK1
	frame_oam -16, -16, $cc, 7 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -32, -12, $d6, 7 | OAMF_BANK1
	frame_oam -32, -20, $c4, 7 | OAMF_BANK1
	frame_oam -32,  -4, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 7 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -32, -20, $c4, 7 | OAMF_BANK1
	frame_oam -32,  -4, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $d2, 7 | OAMF_BANK1
	frame_oam -16, -16, $cc, 7 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -32, -20, $d8, 7 | OAMF_BANK1
	frame_oam -32, -12, $da, 7 | OAMF_BANK1
	frame_oam -32,  -4, $d8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $cc, 7 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -32, -20, $dc, 7 | OAMF_BANK1
	frame_oam -32, -12, $de, 7 | OAMF_BANK1
	frame_oam -32,  -4, $dc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $cc, 7 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -32, -20, $d8, 7 | OAMF_BANK1
	frame_oam -32, -12, $da, 7 | OAMF_BANK1
	frame_oam -32,  -4, $d8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 7 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -32, -20, $dc, 7 | OAMF_BANK1
	frame_oam -32, -12, $de, 7 | OAMF_BANK1
	frame_oam -32,  -4, $dc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 7 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -32, -20, $e0, 7 | OAMF_BANK1
	frame_oam -32, -12, $e2, 7 | OAMF_BANK1
	frame_oam -32,  -4, $e0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $cc, 7 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -32, -20, $e4, 7 | OAMF_BANK1
	frame_oam -32, -12, $e6, 7 | OAMF_BANK1
	frame_oam -32,  -4, $e4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $cc, 7 | OAMF_BANK1
	frame_oam -16,  -8, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -32, -20, $e0, 7 | OAMF_BANK1
	frame_oam -32,  -4, $e0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 7 | OAMF_BANK1
	frame_oam -32, -12, $e8, 7 | OAMF_BANK1
	db $80

.frame_18
	frame_oam -32, -20, $e4, 7 | OAMF_BANK1
	frame_oam -32,  -4, $e4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 7 | OAMF_BANK1
	frame_oam -32, -12, $ea, 7 | OAMF_BANK1
	db $80

.frame_19
	frame_oam -16, -20, $ec, 7 | OAMF_BANK1
	frame_oam -16, -12, $ee, 7 | OAMF_BANK1
	frame_oam -16,  -4, $ec, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -16, $cc, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -32,  -8, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_20
	frame_oam -16, -20, $ec, 7 | OAMF_BANK1
	frame_oam -16, -12, $ee, 7 | OAMF_BANK1
	frame_oam -16,  -4, $ec, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32, -16, $ce, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

OAM_18154f::
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6

.frame_0
	frame_oam -16, -20, $80, 6 | OAMF_BANK1
	frame_oam -16, -12, $82, 6 | OAMF_BANK1
	frame_oam -16,  -4, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -20, $84, 6 | OAMF_BANK1
	frame_oam   0, -12, $86, 6 | OAMF_BANK1
	frame_oam   0,  -4, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -16, -20, $88, 6 | OAMF_BANK1
	frame_oam -16, -12, $8a, 6 | OAMF_BANK1
	frame_oam   0, -20, $8c, 6 | OAMF_BANK1
	frame_oam   0, -12, $8e, 6 | OAMF_BANK1
	frame_oam   0,  -4, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $88, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -16, -20, $90, 6 | OAMF_BANK1
	frame_oam -16, -12, $92, 6 | OAMF_BANK1
	frame_oam   0, -20, $94, 6 | OAMF_BANK1
	frame_oam   0, -12, $96, 6 | OAMF_BANK1
	frame_oam -16,  -4, $90, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -4, $94, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -16, -20, $98, 6 | OAMF_BANK1
	frame_oam -16, -12, $9a, 6 | OAMF_BANK1
	frame_oam   0, -20, $9c, 6 | OAMF_BANK1
	frame_oam   0, -12, $9e, 6 | OAMF_BANK1
	frame_oam -16,  -4, $98, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -4, $9c, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -16, -20, $a0, 6 | OAMF_BANK1
	frame_oam -16, -12, $a2, 6 | OAMF_BANK1
	frame_oam   0, -20, $a4, 6 | OAMF_BANK1
	frame_oam   0, -12, $a6, 6 | OAMF_BANK1
	frame_oam -16,  -4, $a0, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -4, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam   0, -20, $84, 6 | OAMF_BANK1
	frame_oam   0, -12, $86, 6 | OAMF_BANK1
	frame_oam   0,  -4, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $a8, 6 | OAMF_BANK1
	frame_oam -16, -12, $aa, 6 | OAMF_BANK1
	frame_oam -16,  -4, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam   0, -20, $84, 6 | OAMF_BANK1
	frame_oam   0, -12, $86, 6 | OAMF_BANK1
	frame_oam   0,  -4, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $ac, 6 | OAMF_BANK1
	frame_oam -16, -12, $ae, 6 | OAMF_BANK1
	frame_oam -16,  -4, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_18160c::
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

.frame_0
	frame_oam -16,   0, $44, 5 | OAMF_BANK1
	frame_oam -16,  -8, $42, 5 | OAMF_BANK1
	frame_oam -16, -16, $40, 5 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16, -16, $40, 5 | OAMF_BANK1
	frame_oam -16,   0, $4a, 5 | OAMF_BANK1
	frame_oam -16,  -8, $48, 5 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,  -8, $44, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $42, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -16,   8, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $4a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $48, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -16,  -1, $4e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $4e, 5 | OAMF_BANK1
	frame_oam -32,  -1, $4c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $4c, 5 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16,  -1, $52, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $52, 5 | OAMF_BANK1
	frame_oam -32,  -1, $4c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $4c, 5 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16,  -8, $4e, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -1, $4e, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0,  -1, $4c, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0,  -8, $4c, 5 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_7
	frame_oam -16,  -8, $52, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -1, $52, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0,  -1, $4c, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0,  -8, $4c, 5 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_8
	frame_oam -16,  -8, $54, 5 | OAMF_BANK1
	frame_oam -16,   0, $44, 5 | OAMF_BANK1
	frame_oam -16, -16, $40, 5 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -16,  -8, $56, 5 | OAMF_BANK1
	frame_oam -16,   0, $4a, 5 | OAMF_BANK1
	frame_oam -16, -16, $46, 5 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -16,   0, $54, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $44, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -16,   0, $56, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $4a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $46, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -16,  -1, $58, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $58, 5 | OAMF_BANK1
	frame_oam -32,  -1, $4c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $4c, 5 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -16,  -1, $5a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $5a, 5 | OAMF_BANK1
	frame_oam -32,  -1, $50, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $50, 5 | OAMF_BANK1
	db $80

.frame_14
	frame_oam   0,  -1, $4c, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0,  -8, $4c, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -1, $58, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $58, 5 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_15
	frame_oam -16,  -1, $5a, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $5a, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,  -1, $50, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0,  -8, $50, 5 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_16
	frame_oam -16,   0, $62, 5 | OAMF_BANK1
	frame_oam -16,  -8, $60, 5 | OAMF_BANK1
	db $80

.frame_17
	frame_oam -16,   0, $66, 5 | OAMF_BANK1
	frame_oam -16,  -8, $64, 5 | OAMF_BANK1
	db $80

.frame_18
	frame_oam -16,  -1, $68, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $68, 5 | OAMF_BANK1
	db $80

.frame_19
	frame_oam -16,  -8, $66, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $64, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -16,  -8, $62, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $60, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -16,   0, $64, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $66, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_22
	frame_oam -16,  -1, $68, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $68, 5 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_23
	frame_oam -16,  -8, $64, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   0, $66, 5 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_24
	frame_oam -14,  -8, $5e, 5 | OAMF_BANK1
	frame_oam -14,  -1, $5e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30,  -8, $5c, 5 | OAMF_BANK1
	frame_oam -30,  -1, $5c, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -16,  -5, $6a, 5 | OAMF_BANK1
	frame_oam -16,   3, $6c, 5 | OAMF_BANK1
	frame_oam -16, -12, $6c, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -16,  -5, $6a, 5 | OAMF_BANK1
	frame_oam -16,   3, $6e, 5 | OAMF_BANK1
	frame_oam -16, -12, $6e, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -16,  -5, $70, 5 | OAMF_BANK1
	frame_oam -16,   3, $72, 5 | OAMF_BANK1
	frame_oam -16, -12, $72, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_1817b4::
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5

.frame_0
	frame_oam -23, -14, $80, 6 | OAMF_BANK1
	frame_oam -23,  -6, $82, 6 | OAMF_BANK1
	frame_oam -23,   2, $84, 6 | OAMF_BANK1
	frame_oam -23,  10, $86, 6 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -23, -16, $88, 6 | OAMF_BANK1
	frame_oam -23,  -8, $8a, 6 | OAMF_BANK1
	frame_oam -23,   0, $8c, 6 | OAMF_BANK1
	frame_oam -23,   8, $8e, 6 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -23,   0, $8a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,  -8, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23, -16, $90, 6 | OAMF_BANK1
	frame_oam -23,   8, $92, 6 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -23, -16, $94, 6 | OAMF_BANK1
	frame_oam -23,  -8, $96, 6 | OAMF_BANK1
	frame_oam -23,   0, $96, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,   8, $94, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -23, -12, $98, 6 | OAMF_BANK1
	frame_oam -23,  -4, $9a, 6 | OAMF_BANK1
	frame_oam -23,   4, $98, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -23, -12, $9c, 6 | OAMF_BANK1
	frame_oam -23,  -4, $9e, 6 | OAMF_BANK1
	frame_oam -23,   4, $9c, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_18181e::
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

.frame_0
	frame_oam -16,   4, $04, 4 | OAMF_BANK1
	frame_oam -16, -12, $00, 4 | OAMF_BANK1
	frame_oam -16,  -4, $02, 4 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,   5, $08, 4 | OAMF_BANK1
	frame_oam -16,  -3, $06, 4 | OAMF_BANK1
	frame_oam -16, -11, $00, 4 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,   6, $0c, 4 | OAMF_BANK1
	frame_oam -16,  -2, $0a, 4 | OAMF_BANK1
	frame_oam -16, -10, $00, 4 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16, -12, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $02, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -16, -13, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -5, $06, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   3, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16, -14, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -6, $0a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   2, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -16,   4, $04, 4 | OAMF_BANK1
	frame_oam -16, -12, $0e, 4 | OAMF_BANK1
	frame_oam -16,  -4, $10, 4 | OAMF_BANK1
	frame_oam -16, -19, $16, 4 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16,   5, $08, 4 | OAMF_BANK1
	frame_oam -16,  -3, $12, 4 | OAMF_BANK1
	frame_oam -16, -11, $20, 4 | OAMF_BANK1
	frame_oam -16, -19, $18, 4 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -16,   6, $0c, 4 | OAMF_BANK1
	frame_oam -16,  -2, $14, 4 | OAMF_BANK1
	frame_oam -16, -10, $20, 4 | OAMF_BANK1
	frame_oam -16, -19, $16, 4 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -16, -12, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $0e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  11, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -16, -13, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -5, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   3, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  11, $18, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -16, -14, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -6, $14, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   2, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  11, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -16, -12, $1a, 4 | OAMF_BANK1
	frame_oam -16,  -4, $1c, 4 | OAMF_BANK1
	frame_oam -16,   4, $1e, 4 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -16,   4, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16,  -8, $22, 4 | OAMF_BANK1
	frame_oam -16,   0, $24, 4 | OAMF_BANK1
	db $80

.frame_15
	frame_oam -16,   0, $24, 4 | OAMF_BANK1
	frame_oam -16,  -8, $26, 4 | OAMF_BANK1
	db $80

.frame_16
	frame_oam -16,   0, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -16,  -8, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -16,  -8, $28, 4 | OAMF_BANK1
	frame_oam -16,   0, $2a, 4 | OAMF_BANK1
	db $80

.frame_19
	frame_oam -15,  -1, $22, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -15,  -9, $24, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_20
	frame_oam -15,  -1, $28, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -15,  -9, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_21
	frame_oam -16,   0, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -15,  -7, $22, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -15,   1, $24, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_23
	frame_oam -15,  -7, $28, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -15,   1, $2a, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_24
	frame_oam -16, -12, $2c, 4 | OAMF_BANK1
	frame_oam -16,  -4, $2e, 4 | OAMF_BANK1
	frame_oam -16,   4, $30, 4 | OAMF_BANK1
	db $80

.frame_25
	frame_oam -16, -12, $32, 4 | OAMF_BANK1
	frame_oam -16,  -4, $34, 4 | OAMF_BANK1
	frame_oam -16,   4, $36, 4 | OAMF_BANK1
	db $80

.frame_26
	frame_oam -16, -12, $38, 4 | OAMF_BANK1
	frame_oam -16,  -4, $3a, 4 | OAMF_BANK1
	frame_oam -20,   4, $30, 4 | OAMF_BANK1
	db $80

.frame_27
	frame_oam -16,   4, $2c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $2e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $30, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam -16,   4, $32, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $36, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_29
	frame_oam -16,   4, $38, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $3a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -12, $30, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_30
	frame_oam -20,  -8, $3c, 4 | OAMF_BANK1
	frame_oam  -4,  -8, $3e, 4 | OAMF_BANK1
	frame_oam -20,  -1, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -4,  -1, $3e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_1819e3::
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
	frame_oam -16,  -4, $42, 5 | OAMF_BANK1
	frame_oam -16,   4, $44, 5 | OAMF_BANK1
	frame_oam -16, -12, $52, 5 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16, -12, $40, 5 | OAMF_BANK1
	frame_oam -16,  -4, $46, 5 | OAMF_BANK1
	frame_oam -16,   4, $48, 5 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,  -4, $42, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $44, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $52, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -16,   4, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $46, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $48, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -16, -12, $40, 5 | OAMF_BANK1
	frame_oam -16,  -4, $4a, 5 | OAMF_BANK1
	frame_oam -16,   4, $4c, 5 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16, -12, $40, 5 | OAMF_BANK1
	frame_oam -16,  -4, $4e, 5 | OAMF_BANK1
	frame_oam -16,   4, $50, 5 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16,   4, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $4a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $4c, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -16,   4, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $4e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $50, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -16, -12, $54, 5 | OAMF_BANK1
	frame_oam -16,  -4, $56, 5 | OAMF_BANK1
	frame_oam -16,   4, $58, 5 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -16,   4, $54, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $56, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $58, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -16, -12, $5c, 5 | OAMF_BANK1
	frame_oam -16,  -4, $5e, 5 | OAMF_BANK1
	frame_oam -16,   3, $5c, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -16,  -4, $5e, 5 | OAMF_BANK1
	frame_oam -16, -12, $5a, 5 | OAMF_BANK1
	frame_oam -16,   3, $5a, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -17, -12, $40, 5 | OAMF_BANK1
	frame_oam -17,  -4, $4a, 5 | OAMF_BANK1
	frame_oam -17,   4, $4c, 5 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -17,  -4, $4e, 5 | OAMF_BANK1
	frame_oam -17,   4, $50, 5 | OAMF_BANK1
	frame_oam -17, -12, $40, 5 | OAMF_BANK1
	db $80

.frame_14
	frame_oam -15,  -4, $4a, 5 | OAMF_BANK1
	frame_oam -15,   4, $4c, 5 | OAMF_BANK1
	frame_oam -15, -12, $52, 5 | OAMF_BANK1
	db $80

.frame_15
	frame_oam -15,  -4, $4e, 5 | OAMF_BANK1
	frame_oam -15,   4, $50, 5 | OAMF_BANK1
	frame_oam -15, -12, $54, 5 | OAMF_BANK1
	db $80

.frame_16
	frame_oam -17,  -4, $4a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17, -12, $4c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,   4, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -17,  -4, $4e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17, -12, $50, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,   4, $40, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -15,  -4, $4a, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -12, $4c, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   4, $52, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -15,  -4, $4e, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15, -12, $50, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -15,   4, $54, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

OAM_181b0f::
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

.frame_0
	frame_oam -16,  -8, $c0, 7 | OAMF_BANK1
	frame_oam -16,   0, $c2, 7 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,  -8, $c4, 7 | OAMF_BANK1
	frame_oam -16,   0, $c6, 7 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,   0, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -16,  -8, $c4, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   0, $c6, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_4
	frame_oam -16,  -8, $c8, 7 | OAMF_BANK1
	frame_oam -16,   0, $ca, 7 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16,  -9, $c8, 7 | OAMF_BANK1
	frame_oam -16,  -1, $ca, 7 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16,  -7, $c8, 7 | OAMF_BANK1
	frame_oam -16,   1, $ca, 7 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -24, -12, $cc, 7 | OAMF_BANK1
	frame_oam -24,  -4, $ce, 7 | OAMF_BANK1
	frame_oam -24,   4, $d0, 7 | OAMF_BANK1
	frame_oam  -8, -12, $cc, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -8,  -4, $ce, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -8,   4, $d0, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_8
	frame_oam -24, -12, $d2, 7 | OAMF_BANK1
	frame_oam -24,  -4, $d4, 7 | OAMF_BANK1
	frame_oam -24,   4, $d6, 7 | OAMF_BANK1
	frame_oam  -8, -12, $d2, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -8,  -4, $d4, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -8,   4, $d6, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_9
	frame_oam -24, -12, $d8, 7 | OAMF_BANK1
	frame_oam -24,  -4, $da, 7 | OAMF_BANK1
	frame_oam -24,   4, $dc, 7 | OAMF_BANK1
	frame_oam  -8, -12, $d8, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -8,  -4, $da, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -8,   4, $dc, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_10
	frame_oam -16,   0, $ca, 7 | OAMF_BANK1
	frame_oam -16,  -8, $de, 7 | OAMF_BANK1
	db $80

.frame_11
	frame_oam -16,  -8, $e0, 7 | OAMF_BANK1
	frame_oam -16,   0, $e2, 7 | OAMF_BANK1
	db $80

.frame_12
	frame_oam -16,  -8, $e4, 7 | OAMF_BANK1
	frame_oam -16,   0, $e6, 7 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -16,  -8, $e8, 7 | OAMF_BANK1
	frame_oam -16,   0, $ea, 7 | OAMF_BANK1
	db $80

.frame_14
	frame_oam -16,   0, $ec, 7 | OAMF_BANK1
	frame_oam -16,  -8, $c8, 7 | OAMF_BANK1
	db $80

OAM_181be4::
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8

.frame_0
	frame_oam -23,   0, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,  -8, $c0, 7 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -23,   0, $c4, 7 | OAMF_BANK1
	frame_oam -23,  -8, $c2, 7 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -23,  -8, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,   0, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -23,   0, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,  -8, $c6, 7 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -23,   0, $c8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,  -8, $c8, 7 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -23,   0, $ca, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,  -8, $ca, 7 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -23,   0, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -23,  -8, $cc, 7 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -24,  -1, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -9, $c0, 7 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -24,   1, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -7, $c0, 7 | OAMF_BANK1
	db $80

OAM_181c47::
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3

.frame_0
	frame_oam -32, -24, $00, 4 | OAMF_BANK1
	frame_oam -32, -16, $02, 4 | OAMF_BANK1
	frame_oam -32,  -8, $04, 4 | OAMF_BANK1
	frame_oam -32,   0, $06, 4 | OAMF_BANK1
	frame_oam -16, -24, $08, 4 | OAMF_BANK1
	frame_oam -16, -16, $0a, 4 | OAMF_BANK1
	frame_oam -16,  -8, $0c, 4 | OAMF_BANK1
	frame_oam -16,   0, $0e, 4 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -32, -24, $40, 5 | OAMF_BANK1
	frame_oam -32, -16, $42, 5 | OAMF_BANK1
	frame_oam -32,  -8, $44, 5 | OAMF_BANK1
	frame_oam -32,   0, $46, 5 | OAMF_BANK1
	frame_oam -16, -24, $48, 5 | OAMF_BANK1
	frame_oam -16, -16, $4a, 5 | OAMF_BANK1
	frame_oam -16,  -8, $4c, 5 | OAMF_BANK1
	frame_oam -16,   0, $4e, 5 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -32, -24, $80, 6 | OAMF_BANK1
	frame_oam -32, -16, $82, 6 | OAMF_BANK1
	frame_oam -32,  -8, $84, 6 | OAMF_BANK1
	frame_oam -32,   0, $86, 6 | OAMF_BANK1
	frame_oam -16, -24, $88, 6 | OAMF_BANK1
	frame_oam -16, -16, $8a, 6 | OAMF_BANK1
	frame_oam -16,  -8, $8c, 6 | OAMF_BANK1
	frame_oam -16,   0, $8e, 6 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -32, -24, $c0, 7 | OAMF_BANK1
	frame_oam -32, -16, $c2, 7 | OAMF_BANK1
	frame_oam -32,  -8, $c4, 7 | OAMF_BANK1
	frame_oam -32,   0, $c6, 7 | OAMF_BANK1
	frame_oam -16, -24, $c8, 7 | OAMF_BANK1
	frame_oam -16, -16, $ca, 7 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 7 | OAMF_BANK1
	frame_oam -16,   0, $ce, 7 | OAMF_BANK1
	db $80

OAM_181cd3::
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

.frame_0
	frame_oam -16,  -4, $c4, 7 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,  -8, $c2, 7 | OAMF_BANK1
	frame_oam -16,   0, $c4, 7 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16, -12, $c0, 7 | OAMF_BANK1
	frame_oam -16,  -4, $c2, 7 | OAMF_BANK1
	frame_oam -16,   4, $c4, 7 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,  -8, $c0, 7 | OAMF_BANK1
	frame_oam -16,   0, $c2, 7 | OAMF_BANK1
	frame_oam -16,   8, $c4, 7 | OAMF_BANK1
	frame_oam -16, -16, $c0, 7 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -16,  -4, $c0, 7 | OAMF_BANK1
	frame_oam -16,   4, $c2, 7 | OAMF_BANK1
	frame_oam -16,  12, $c4, 7 | OAMF_BANK1
	frame_oam -16, -12, $c0, 7 | OAMF_BANK1
	frame_oam -16, -20, $c0, 7 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16,   0, $c0, 7 | OAMF_BANK1
	frame_oam -16,   8, $c2, 7 | OAMF_BANK1
	frame_oam -16,  16, $c4, 7 | OAMF_BANK1
	frame_oam -16,  -8, $c0, 7 | OAMF_BANK1
	frame_oam -16, -16, $c0, 7 | OAMF_BANK1
	frame_oam -16, -24, $c0, 7 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16,   0, $c6, 7 | OAMF_BANK1
	frame_oam -16,   8, $c8, 7 | OAMF_BANK1
	frame_oam -16,  16, $ca, 7 | OAMF_BANK1
	frame_oam -16,  -8, $c6, 7 | OAMF_BANK1
	frame_oam -16, -16, $c6, 7 | OAMF_BANK1
	frame_oam -16, -24, $c6, 7 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16,   0, $cc, 7 | OAMF_BANK1
	frame_oam -16,   8, $ce, 7 | OAMF_BANK1
	frame_oam -16,  16, $d0, 7 | OAMF_BANK1
	frame_oam -16,  -8, $cc, 7 | OAMF_BANK1
	frame_oam -16, -16, $cc, 7 | OAMF_BANK1
	frame_oam -16, -24, $cc, 7 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -16,  -4, $cc, 7 | OAMF_BANK1
	frame_oam -16,   4, $ce, 7 | OAMF_BANK1
	frame_oam -16,  12, $d0, 7 | OAMF_BANK1
	frame_oam -16, -12, $cc, 7 | OAMF_BANK1
	frame_oam -16, -20, $cc, 7 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -16,  -8, $cc, 7 | OAMF_BANK1
	frame_oam -16,   0, $ce, 7 | OAMF_BANK1
	frame_oam -16,   8, $d0, 7 | OAMF_BANK1
	frame_oam -16, -16, $cc, 7 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -16, -12, $cc, 7 | OAMF_BANK1
	frame_oam -16,  -4, $ce, 7 | OAMF_BANK1
	frame_oam -16,   4, $d0, 7 | OAMF_BANK1
	db $80

.frame_11
	frame_oam -16,  -8, $ce, 7 | OAMF_BANK1
	frame_oam -16,   0, $d0, 7 | OAMF_BANK1
	db $80

.frame_12
	frame_oam -16,  -4, $d0, 7 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -16,  -4, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16,   0, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -16,   4, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -16,   0, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -16,  -4, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  12, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -16,  -8, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $c2, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -24, $c4, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  16, $c0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -16,  -8, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $c8, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -24, $ca, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  16, $c6, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -16,  -8, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -24, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  16, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -16,  -4, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -20, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  12, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -16,   0, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -16,   4, $cc, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -16,   0, $ce, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -16,  -4, $d0, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -16,  -4, $d2, 7 | OAMF_BANK1
	db $80

.frame_27
	frame_oam -16,  -4, $d4, 7 | OAMF_BANK1
	db $80

.frame_28
	frame_oam -16,  -4, $d6, 7 | OAMF_BANK1
	db $80
