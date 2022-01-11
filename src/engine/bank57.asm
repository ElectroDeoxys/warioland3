	INCROM $15c000, $15e44a

OAM_15e44a: ; 15e44a (57:644a)
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

.frame_0
	frame_oam -16,  -8, $00, 0 | TILE_BANK
	frame_oam -16,   0, $02, 0 | TILE_BANK
	db $80

.frame_1
	frame_oam -16,  -8, $04, 0 | TILE_BANK
	frame_oam -16,   0, $06, 0 | TILE_BANK
	db $80

.frame_2
	frame_oam -16,  -8, $08, 0 | TILE_BANK
	frame_oam -16,   0, $0a, 0 | TILE_BANK
	db $80

.frame_3
	frame_oam -16,  -4, $0c, 2 | TILE_BANK
	db $80

.frame_4
	frame_oam -16,  -8, $12, 1 | TILE_BANK
	frame_oam -15,   0, $12, 1 | TILE_BANK | X_FLIP | Y_FLIP
	db $80

.frame_5
	frame_oam -16,  -8, $14, 1 | TILE_BANK
	frame_oam -15,   0, $14, 1 | TILE_BANK | X_FLIP | Y_FLIP
	db $80

.frame_6
	frame_oam -17,  -8, $16, 1 | TILE_BANK
	frame_oam -14,   0, $16, 1 | TILE_BANK | X_FLIP | Y_FLIP
	db $80

.frame_7
	frame_oam -12,  -8, $10, 0 | TILE_BANK
	frame_oam -20,   0, $10, 0 | TILE_BANK | X_FLIP | Y_FLIP
	db $80

.frame_8
	frame_oam -16,  -4, $0e, 0 | TILE_BANK
	db $80

.frame_9
	frame_oam -16,  -4, $0e, 0 | TILE_BANK | X_FLIP
	db $80

.frame_10
	frame_oam -12,   0, $10, 0 | TILE_BANK | X_FLIP
	frame_oam -20,  -8, $10, 0 | TILE_BANK | Y_FLIP
	db $80

.frame_11
	frame_oam -16,  -8, $18, 2 | TILE_BANK
	frame_oam -16,   0, $1a, 2 | TILE_BANK
	db $80

.frame_12
	frame_oam -16,  -8, $1c, 2 | TILE_BANK
	frame_oam -16,   0, $1e, 2 | TILE_BANK
	db $80

.frame_13
	frame_oam -16,  -6, $20, 0 | TILE_BANK
	frame_oam -16,   2, $22, 0 | TILE_BANK
	db $80

.frame_14
	frame_oam -16,  -4, $24, 2 | TILE_BANK
	db $80

.frame_15
	frame_oam -16,  -4, $26, 2 | TILE_BANK
	db $80

.frame_16
	frame_oam -16,  -4, $28, 2 | TILE_BANK
	db $80

.frame_17
	frame_oam -13,  -4, $2a, 0 | TILE_BANK | Y_FLIP
	db $80

.frame_18
	frame_oam -16,  -8, $2a, 0 | TILE_BANK
	frame_oam -16,   0, $2c, 0 | TILE_BANK
	db $80

.frame_19
	frame_oam -12,  -8, $2e, 0 | TILE_BANK | X_FLIP | Y_FLIP
	frame_oam -28,  -4, $2c, 0 | TILE_BANK | X_FLIP
	db $80

.frame_20
	frame_oam -36,  -4, $2e, 0 | TILE_BANK
	db $80

.frame_21
	frame_oam -16,  -4, $30, 0 | TILE_BANK
	db $80

.frame_22
	frame_oam -18,  -4, $30, 0 | TILE_BANK
	db $80

.frame_23
	frame_oam -19,  -8, $34, 0 | TILE_BANK
	frame_oam -19,   0, $34, 0 | TILE_BANK | X_FLIP
	db $80

.frame_24
	frame_oam -19,  -8, $32, 0 | TILE_BANK
	frame_oam -19,   0, $32, 0 | TILE_BANK | X_FLIP
	db $80

.frame_25
	frame_oam  -8,  -8, $3a, 3 | TILE_BANK
	frame_oam -10,   0, $3c, 2 | TILE_BANK
	frame_oam -15,   8, $3e, 2 | TILE_BANK
	frame_oam -24,  -8, $40, 4 | TILE_BANK
	frame_oam -26,   0, $42, 4 | TILE_BANK
	db $80

.frame_26
	frame_oam -24,  -8, $36, 2 | TILE_BANK
	frame_oam -24,   0, $36, 2 | TILE_BANK | X_FLIP
	frame_oam  -8,  -8, $3a, 3 | TILE_BANK
	frame_oam -10,   0, $3c, 2 | TILE_BANK
	frame_oam -15,   8, $3e, 2 | TILE_BANK
	db $80

.frame_27
	frame_oam -24,  -8, $38, 3 | TILE_BANK
	frame_oam -24,   0, $38, 3 | TILE_BANK | X_FLIP
	frame_oam  -8,  -8, $3a, 3 | TILE_BANK
	frame_oam -10,   0, $3c, 2 | TILE_BANK
	frame_oam -15,   8, $3e, 2 | TILE_BANK
	db $80

.frame_28
	frame_oam -24,  -8, $44, 4 | TILE_BANK
	frame_oam -24,   0, $44, 4 | TILE_BANK | X_FLIP
	frame_oam  -8,  -8, $3a, 5 | TILE_BANK
	frame_oam -10,   0, $3c, 5 | TILE_BANK
	frame_oam -15,   8, $3e, 5 | TILE_BANK
	db $80

.frame_29
	frame_oam  -8,  -8, $3a, 3 | TILE_BANK
	frame_oam -10,   0, $3c, 2 | TILE_BANK
	frame_oam -24,  -8, $40, 4 | TILE_BANK
	frame_oam -26,   0, $42, 4 | TILE_BANK
	frame_oam -15,   8, $3e, 2 | TILE_BANK
	db $80

.frame_30
	frame_oam -24,  -8, $44, 4 | TILE_BANK
	frame_oam -24,   0, $44, 4 | TILE_BANK | X_FLIP
	frame_oam  -8,  -8, $3a, 5 | TILE_BANK
	frame_oam -10,   0, $3c, 5 | TILE_BANK
	frame_oam -15,   8, $3e, 5 | TILE_BANK
	db $80

.frame_31
	frame_oam -24,  -8, $36, 2 | TILE_BANK
	frame_oam -24,   0, $36, 2 | TILE_BANK | X_FLIP
	frame_oam  -8,  -8, $3a, 3 | TILE_BANK
	frame_oam -10,   0, $3c, 2 | TILE_BANK
	frame_oam -15,   8, $3e, 2 | TILE_BANK
	db $80

.frame_32
	frame_oam -24,  -8, $38, 3 | TILE_BANK
	frame_oam -24,   0, $38, 3 | TILE_BANK | X_FLIP
	frame_oam  -8,  -8, $3a, 3 | TILE_BANK
	frame_oam -10,   0, $3c, 2 | TILE_BANK
	frame_oam -15,   8, $3e, 2 | TILE_BANK
	db $80

.frame_33
	frame_oam -28, -13, $4a, 3 | TILE_BANK
	frame_oam   0, -16, $4e, 3 | TILE_BANK | Y_FLIP
	db $80

.frame_34
	frame_oam -28, -13, $4c, 4 | TILE_BANK
	frame_oam   0, -16, $50, 4 | TILE_BANK | Y_FLIP
	db $80

.frame_35
	frame_oam -28, -13, $4e, 3 | TILE_BANK
	frame_oam -16,   4, $4a, 3 | TILE_BANK | Y_FLIP
	db $80

.frame_36
	frame_oam -28, -13, $50, 4 | TILE_BANK
	frame_oam -16,   4, $4c, 4 | TILE_BANK | Y_FLIP
	db $80

.frame_37
	frame_oam -16,   4, $4e, 3 | TILE_BANK | Y_FLIP
	frame_oam   0, -16, $4a, 3 | TILE_BANK | Y_FLIP
	db $80

.frame_38
	frame_oam -16,   4, $50, 4 | TILE_BANK | Y_FLIP
	frame_oam   0, -16, $4c, 4 | TILE_BANK | Y_FLIP
	db $80

.frame_39
	frame_oam  -8,  -4, $60, 1 | TILE_BANK
	db $80

.frame_40
	frame_oam  -8, -12, $68, 1 | TILE_BANK
	frame_oam  -8,   4, $68, 1 | TILE_BANK | X_FLIP
	frame_oam -16,  -4, $6a, 1 | TILE_BANK
	frame_oam   0,  -4, $6a, 1 | TILE_BANK | Y_FLIP
	db $80

.frame_41
	frame_oam  -8,  -4, $62, 1 | TILE_BANK
	db $80

.frame_42
	frame_oam -16, -12, $6c, 1 | TILE_BANK
	frame_oam -16,  -4, $6e, 1 | TILE_BANK
	frame_oam -16, -12, $6c, 1 | TILE_BANK
	frame_oam -16,  -4, $6e, 1 | TILE_BANK
	frame_oam   0, -12, $6c, 1 | TILE_BANK | Y_FLIP
	frame_oam   0,  -4, $6e, 1 | TILE_BANK | Y_FLIP
	frame_oam -16,   4, $6c, 1 | TILE_BANK | X_FLIP
	frame_oam -16,   4, $6c, 1 | TILE_BANK | X_FLIP
	frame_oam   0,   4, $6c, 1 | TILE_BANK | X_FLIP | Y_FLIP
	db $80

.frame_43
	frame_oam  -8,  -8, $64, 1 | TILE_BANK
	frame_oam  -8,   0, $64, 1 | TILE_BANK | X_FLIP
	db $80

.frame_44
	frame_oam -16, -12, $70, 1 | TILE_BANK
	frame_oam -16,  -4, $72, 1 | TILE_BANK
	frame_oam   0, -12, $70, 1 | TILE_BANK | Y_FLIP
	frame_oam   0,  -4, $72, 1 | TILE_BANK | Y_FLIP
	frame_oam -16,   4, $70, 1 | TILE_BANK | X_FLIP
	frame_oam   0,   4, $70, 1 | TILE_BANK | X_FLIP | Y_FLIP
	db $80

.frame_45
	frame_oam  -8,  -8, $66, 1 | TILE_BANK
	frame_oam  -8,   0, $66, 1 | TILE_BANK | X_FLIP
	db $80

.frame_46
	frame_oam -16, -16, $74, 1 | TILE_BANK
	frame_oam -24,  -8, $76, 1 | TILE_BANK
	frame_oam -16,   8, $74, 1 | TILE_BANK | X_FLIP
	frame_oam -24,   0, $76, 1 | TILE_BANK | X_FLIP
	frame_oam   0, -16, $74, 1 | TILE_BANK | Y_FLIP
	frame_oam   8,  -8, $76, 1 | TILE_BANK | Y_FLIP
	frame_oam   0,   8, $74, 1 | TILE_BANK | X_FLIP | Y_FLIP
	frame_oam   8,   0, $76, 1 | TILE_BANK | X_FLIP | Y_FLIP
	db $80

.frame_47
	frame_oam -16, -24, $78, 1 | TILE_BANK
	frame_oam -21, -16, $7a, 1 | TILE_BANK
	frame_oam -30,  -8, $7c, 1 | TILE_BANK
	frame_oam   0, -24, $78, 1 | TILE_BANK | Y_FLIP
	frame_oam   5, -16, $7a, 1 | TILE_BANK | Y_FLIP
	frame_oam  14,  -8, $7c, 1 | TILE_BANK | Y_FLIP
	frame_oam -16,  16, $78, 1 | TILE_BANK | X_FLIP
	frame_oam -21,   8, $7a, 1 | TILE_BANK | X_FLIP
	frame_oam -30,   0, $7c, 1 | TILE_BANK | X_FLIP
	frame_oam   0,  16, $78, 1 | TILE_BANK | X_FLIP | Y_FLIP
	frame_oam   5,   8, $7a, 1 | TILE_BANK | X_FLIP | Y_FLIP
	frame_oam  14,   0, $7c, 1 | TILE_BANK | X_FLIP | Y_FLIP
	db $80

.frame_48
	frame_oam -16,  -4, $7e, 0 | TILE_BANK
	db $80

.frame_49
	frame_oam  -8,  -8, $52, 3 | TILE_BANK
	frame_oam  -8,   8, $54, 3 | TILE_BANK
	frame_oam -16,  16, $56, 3 | TILE_BANK
	frame_oam -16, -24, $56, 3 | TILE_BANK | X_FLIP
	frame_oam -27, -16, $58, 6 | TILE_BANK
	frame_oam -32, -24, $5a, 6 | TILE_BANK
	frame_oam -27,  12, $5c, 7 | TILE_BANK
	db $80

.frame_50
	frame_oam  -8,  -8, $46, 1 | TILE_BANK
	frame_oam  -8,   0, $46, 1 | TILE_BANK | X_FLIP
	db $80

.frame_51
	frame_oam  -8,  -4, $60, 5 | TILE_BANK
	db $80

.frame_52
	frame_oam  -8,  -8, $64, 5 | TILE_BANK
	frame_oam  -8,   0, $64, 5 | TILE_BANK | X_FLIP
	db $80
; 0x15e741

Frameset_15e741: ; 15e741 (57:6741)
	db $02,  3
	db $01,  3
	db $00,  3
	db $ff
; 0x15e748

Frameset_15e748: ; 15e748 (57:6748)
	db $03,  4
	db $ff
; 0x15e74b

Frameset_15e74b: ; 15e74b (57:674b)
	db $04,  5
	db $05,  5
	db $06,  5
	db $05,  5
	db $04,  5
	db $05,  5
	db $06,  5
	db $05,  5
	db $04,  2
	db $05,  2
	db $06,  2
	db $05,  2
	db $04,  2
	db $05,  2
	db $06,  2
	db $05,  2
	db $04,  2
	db $05,  2
	db $06,  2
	db $05,  2
	db $ff
; 0x15e774

Frameset_15e774: ; 15e774 (57:6774)
	db $07,  3
	db $08,  3
	db $09,  3
	db $0a,  3
	db $ff
; 0x15e77d

Frameset_15e77d: ; 15e77d (57:677d)
	db $0b,  4
	db $ff
; 0x15e780

Frameset_15e780: ; 15e780 (57:6780)
	db $0c,  4
	db $ff
; 0x15e783

Frameset_15e783: ; 15e783 (57:6783)
	db $0e,  3
	db $0f,  3
	db $10,  3
	db $ff
; 0x15e78a

Frameset_15e78a: ; 15e78a (57:678a)
	db $11,  9
	db $12,  8
	db $13,  7
	db $14,  7
	db $ff
; 0x15e793

Frameset_15e793: ; 15e793 (57:6793)
	db $0d,  4
	db $ff
; 0x15e796

Frameset_15e796: ; 15e796 (57:6796)
	db $15,  2
	db $16,  2
	db $17,  6
	db $18,  3
	db $17,  6
	db $18,  3
	db $ff
; 0x15e7a3

Frameset_15e7a3: ; 15e7a3 (57:67a3)
	db $19,  4
	db $ff
; 0x15e7a6

Frameset_15e7a6: ; 15e7a6 (57:67a6)
	db $19,  1
	db $1c,  2
	db $1a,  2
	db $1b,  2
	db $1d,  1
	db $1e,  2
	db $1f,  2
	db $20,  2
	db $ff
; 0x15e7b7

Frameset_15e7b7: ; 15e7b7 (57:67b7)
	db $21,  4
	db $22,  4
	db $23,  4
	db $24,  4
	db $25,  4
	db $26,  4
	db $ff
; 0x15e7c4

Frameset_15e7c4: ; 15e7c4 (57:67c4)
	db $27,  2
	db $28,  1
	db $29,  2
	db $2a,  1
	db $2b,  2
	db $2c,  1
	db $2d,  2
	db $2e,  1
	db $29,  2
	db $2f,  1
	db $27,  2
	db $30,  1
	db $29,  2
	db $2e,  1
	db $2b,  2
	db $2c,  1
	db $2d,  1
	db $2a,  1
	db $29,  2
	db $28,  1
	db $ff
; 0x15e7ed

Frameset_15e7ed: ; 15e7ed (57:67ed)
	db $31,  4
	db $ff
; 0x15e7f0

Frameset_15e7f0: ; 15e7f0 (57:67f0)
	db $02,  2
	db $30,  2
	db $ff
; 0x15e7f5

Frameset_15e7f5: ; 15e7f5 (57:67f5)
	db $0c,  2
	db $30,  2
	db $ff
; 0x15e7fa

Frameset_15e7fa: ; 15e7fa (57:67fa)
	db $2c,  2
	db $28,  1
	db $32,  2
	db $ff
; 0x15e801

	INCROM $15e801, $15e80a

Frameset_15e80a: ; 15e80a (57:680a)
	db $29,  2
	db $2d,  1
	db $33,  2
	db $2d,  1
	db $ff
; 0x15e813

	INCROM $15e813, $15ee8d
