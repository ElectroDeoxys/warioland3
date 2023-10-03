OAM_bc000: ; bc000 (2f:4000)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6

.frame_0
	frame_oam -32,   8, $20, 2 | OAMF_BANK1
	frame_oam -32,  16, $22, 2 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -36,  -6, $16, 2 | OAMF_BANK1
	frame_oam -48,   2, $18, 2 | OAMF_BANK1
	frame_oam -48,  10, $1a, 2 | OAMF_BANK1
	frame_oam -32,  -8, $1c, 2 | OAMF_BANK1
	frame_oam -32,   0, $1e, 2 | OAMF_BANK1
	frame_oam -16,  -8, $24, 3 | OAMF_BANK1
	frame_oam -16,   0, $26, 3 | OAMF_BANK1
	frame_oam -16,   8, $28, 3 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -32, -16, $20, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -24, $22, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -36,  -2, $16, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48, -10, $18, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48, -18, $1a, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $1c, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -8, $1e, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $24, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $26, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $28, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -36, -30, $16, 2 | OAMF_BANK1
	frame_oam -48, -22, $18, 2 | OAMF_BANK1
	frame_oam -48, -14, $1a, 2 | OAMF_BANK1
	frame_oam -32, -32, $1c, 2 | OAMF_BANK1
	frame_oam -32, -24, $1e, 2 | OAMF_BANK1
	frame_oam -16, -32, $24, 3 | OAMF_BANK1
	frame_oam -16, -24, $26, 3 | OAMF_BANK1
	frame_oam -16, -16, $28, 3 | OAMF_BANK1
	frame_oam -32, -16, $20, 2 | OAMF_BANK1
	frame_oam -32,  -8, $22, 2 | OAMF_BANK1
	frame_oam -36,  22, $16, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,  14, $18, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48,   6, $1a, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  24, $1c, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  16, $1e, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  24, $24, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  16, $26, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   8, $28, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   8, $20, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   0, $22, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -38,   2, $00, 2 | OAMF_BANK1
	frame_oam -38,  10, $02, 2 | OAMF_BANK1
	frame_oam -38,  18, $04, 2 | OAMF_BANK1
	frame_oam -29,   0, $06, 2 | OAMF_BANK1
	frame_oam -22,   8, $08, 2 | OAMF_BANK1
	frame_oam -22,  16, $0a, 2 | OAMF_BANK1
	frame_oam -29,  24, $0c, 2 | OAMF_BANK1
	frame_oam -12,  16, $0e, 3 | OAMF_BANK1
	frame_oam -24,  24, $10, 3 | OAMF_BANK1
	frame_oam  -8,  24, $12, 3 | OAMF_BANK1
	frame_oam -13,  32, $14, 3 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -38, -10, $00, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -38, -18, $02, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -38, -26, $04, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29,  -8, $06, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22, -16, $08, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22, -24, $0a, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -29, -32, $0c, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12, -24, $0e, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24, -32, $10, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8, -32, $12, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -40, $14, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80
; 0xbc10d

; unreferenced
Frameset_bc10d: ; bc10d (2f:410d)
	db $00,  4
	db $ff
; 0xbc110

; unreferenced
Frameset_bc110: ; bc110 (2f:4110)
	db $01,  4
	db $ff
; 0xbc113

; unreferenced
Frameset_bc113: ; bc113 (2f:4113)
	db $02,  4
	db $ff
; 0xbc116

; unreferenced
Frameset_bc116: ; bc116 (2f:4116)
	db $03,  4
	db $ff
; 0xbc119

; unreferenced
Frameset_bc119: ; bc119 (2f:4119)
	db $04,  4
	db $ff
; 0xbc11c

; unreferenced
Frameset_bc11c: ; bc11c (2f:411c)
	db $05,  4
	db $ff
; 0xbc11f

; unreferenced
Frameset_bc11f: ; bc11f (2f:411f)
	db $06,  4
	db $ff
; 0xbc122

OAM_bc122: ; bc122 (2f:4122)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5

.frame_0
	frame_oam -62,  31, $24, 5
	frame_oam -78,  31, $22, 4
	frame_oam -57,  23, $20, 5
	frame_oam -73,  23, $1e, 4
	frame_oam -56,  15, $1c, 5
	frame_oam -72,  15, $1a, 4
	frame_oam -70,   7, $16, 4
	frame_oam -54,   7, $18, 4
	frame_oam -46,  14, $26, 1
	frame_oam -46,  22, $28, 1
	frame_oam -67,  30, $2a, 1
	frame_oam -51,  30, $2c, 1
	frame_oam -59,  38, $2e, 1
	frame_oam -20,  -4, $30, 1
	frame_oam -20,   4, $32, 1
	db $80

.frame_1
	frame_oam -48,  16, $34, 0 | OAMF_XFLIP
	frame_oam -48,   8, $36, 0 | OAMF_XFLIP
	frame_oam -48,   0, $38, 0 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -48,  16, $3a, 0 | OAMF_XFLIP
	frame_oam -48,   8, $3c, 0 | OAMF_XFLIP
	frame_oam -48,   0, $3e, 0 | OAMF_XFLIP
	frame_oam -48,  -8, $40, 0 | OAMF_XFLIP
	frame_oam -32,   0, $42, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $44, 0 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -48,  16, $46, 0 | OAMF_XFLIP
	frame_oam -48,   8, $48, 0 | OAMF_XFLIP
	frame_oam -48,   0, $4a, 0 | OAMF_XFLIP
	frame_oam -48,  -8, $4c, 0 | OAMF_XFLIP
	frame_oam -32,   0, $4e, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $50, 0 | OAMF_XFLIP
	frame_oam -16,   0, $52, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $54, 0 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -48,   0, $56, 0 | OAMF_XFLIP
	frame_oam -48,  -8, $58, 0 | OAMF_XFLIP
	frame_oam -32,   0, $5a, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $5c, 0 | OAMF_XFLIP
	frame_oam -16,   8, $60, 0 | OAMF_XFLIP
	frame_oam -16,   0, $62, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $64, 0 | OAMF_XFLIP
	frame_oam -16,  16, $5e, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16,  16, $68, 0 | OAMF_XFLIP
	frame_oam -16,   8, $6a, 0 | OAMF_XFLIP
	frame_oam -16,   0, $6c, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $6e, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $66, 0 | OAMF_XFLIP
	db $80
; 0xbc1e8

Frameset_bc1e8:: ; bc1e8 (2f:41e8)
	db $01,  2
	db $02,  2
	db $03,  2
	db $04,  2
	db $05,  2
	db $ff
; 0xbc1f3

Frameset_bc1f3:: ; bc1f3 (2f:41f3)
	db $00,  4
	db $ff
; 0xbc1f6

OAM_bc1f6:: ; bc1f6 (2f:41f6)
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
	frame_oam -39,  -6, $1a, 4
	frame_oam -39,  10, $1e, 4
	frame_oam -55,  -9, $14, 4
	frame_oam -55,  13, $16, 4
	frame_oam -45,  21, $18, 6
	frame_oam -39,   2, $26, 4
	frame_oam -54,  -2, $2a, 5
	frame_oam -54,   6, $2c, 5
	db $80

.frame_1
	frame_oam -39,  10, $1e, 4
	frame_oam -55,  -9, $14, 4
	frame_oam -55,  13, $16, 4
	frame_oam -45,  21, $18, 6
	frame_oam -54,  -2, $2e, 5
	frame_oam -54,   6, $30, 5
	frame_oam -39,   2, $1c, 4
	frame_oam -39,  -6, $20, 4
	db $80

.frame_2
	frame_oam -39,  -6, $1a, 4
	frame_oam -55,  -9, $14, 4
	frame_oam -55,  13, $16, 4
	frame_oam -45,  21, $18, 6
	frame_oam -39,   2, $22, 4
	frame_oam -39,  10, $24, 4
	frame_oam -54,  -2, $32, 5
	frame_oam -54,   6, $34, 5
	db $80

.frame_3
	frame_oam -39,  -6, $1a, 4
	frame_oam -55,  -9, $14, 4
	frame_oam -55,  13, $16, 4
	frame_oam -45,  21, $18, 6
	frame_oam -54,  -2, $36, 5
	frame_oam -54,   6, $38, 5
	frame_oam -39,   2, $1c, 4
	frame_oam -39,  10, $28, 4
	db $80

.frame_4
	frame_oam -38,  -6, $42, 4
	frame_oam -38,   2, $44, 4
	frame_oam -38,  10, $42, 4 | OAMF_XFLIP
	frame_oam -37,  -2, $56, 1
	frame_oam -37,   6, $56, 1 | OAMF_XFLIP
	frame_oam -54,  -6, $3e, 6
	frame_oam -70,  -2, $3a, 6
	frame_oam -70,   6, $3c, 7
	frame_oam -54,  -2, $4e, 0
	frame_oam -54,   6, $4e, 0 | OAMF_XFLIP
	frame_oam -57,  -2, $46, 5
	frame_oam -57,   6, $46, 5 | OAMF_XFLIP
	frame_oam -54,  10, $40, 7
	db $80

.frame_5
	frame_oam -38,  -6, $42, 4
	frame_oam -38,   2, $44, 4
	frame_oam -38,  10, $42, 4 | OAMF_XFLIP
	frame_oam -37,  -2, $56, 1
	frame_oam -37,   6, $56, 1 | OAMF_XFLIP
	frame_oam -54,  -6, $3e, 6
	frame_oam -70,  -2, $3a, 6
	frame_oam -70,   6, $3c, 7
	frame_oam -54,  -2, $4e, 0
	frame_oam -54,   6, $4e, 0 | OAMF_XFLIP
	frame_oam -57,   5, $46, 5 | OAMF_XFLIP
	frame_oam -57,  -1, $46, 5
	frame_oam -54,  10, $40, 7
	db $80

.frame_6
	frame_oam -38,  -6, $42, 4
	frame_oam -38,   2, $44, 4
	frame_oam -38,  10, $42, 4 | OAMF_XFLIP
	frame_oam -37,  -2, $56, 1
	frame_oam -37,   6, $56, 1 | OAMF_XFLIP
	frame_oam -54,  -6, $3e, 6
	frame_oam -70,  -2, $3a, 6
	frame_oam -70,   6, $3c, 7
	frame_oam -54,  -2, $52, 0
	frame_oam -54,   6, $54, 0
	frame_oam -57,  -2, $4a, 5
	frame_oam -57,   6, $4c, 5
	frame_oam -54,  10, $40, 7
	db $80

.frame_7
	frame_oam -38,  -6, $42, 4
	frame_oam -38,   2, $44, 4
	frame_oam -38,  10, $42, 4 | OAMF_XFLIP
	frame_oam -37,  -2, $56, 1
	frame_oam -37,   6, $56, 1 | OAMF_XFLIP
	frame_oam -54,  -6, $3e, 6
	frame_oam -70,  -2, $3a, 6
	frame_oam -70,   6, $3c, 7
	frame_oam -54,  -2, $50, 0
	frame_oam -54,   6, $50, 0 | OAMF_XFLIP
	frame_oam -57,   7, $48, 5 | OAMF_XFLIP
	frame_oam -54,  10, $40, 7
	frame_oam -57,  -1, $48, 5
	db $80

.frame_8
	frame_oam -38,  -6, $42, 4
	frame_oam -38,   2, $44, 4
	frame_oam -38,  10, $42, 4 | OAMF_XFLIP
	frame_oam -37,  -2, $56, 1
	frame_oam -37,   6, $56, 1 | OAMF_XFLIP
	frame_oam -54,  -6, $3e, 6
	frame_oam -70,  -2, $3a, 6
	frame_oam -70,   6, $3c, 7
	frame_oam -54,  -2, $50, 0
	frame_oam -54,   6, $50, 0 | OAMF_XFLIP
	frame_oam -57,  -2, $48, 5
	frame_oam -57,   6, $48, 5 | OAMF_XFLIP
	frame_oam -54,  10, $40, 7
	db $80

.frame_9
	frame_oam -38,  -6, $42, 4
	frame_oam -38,   2, $44, 4
	frame_oam -38,  10, $42, 4 | OAMF_XFLIP
	frame_oam -37,  -2, $56, 1
	frame_oam -37,   6, $56, 1 | OAMF_XFLIP
	frame_oam -54,  -6, $3e, 6
	frame_oam -70,  -2, $3a, 6
	frame_oam -70,   6, $3c, 7
	frame_oam -54,  -2, $50, 0
	frame_oam -54,   6, $50, 0 | OAMF_XFLIP
	frame_oam -57,  -3, $48, 5
	frame_oam -54,  10, $40, 7
	frame_oam -57,   5, $58, 5 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -38,  -6, $42, 4
	frame_oam -38,   2, $44, 4
	frame_oam -38,  10, $42, 4 | OAMF_XFLIP
	frame_oam -37,  -2, $56, 1
	frame_oam -37,   6, $56, 1 | OAMF_XFLIP
	frame_oam -54,  -6, $3e, 6
	frame_oam -70,  -2, $3a, 6
	frame_oam -70,   6, $3c, 7
	frame_oam -54,   6, $52, 0 | OAMF_XFLIP
	frame_oam -54,  -2, $54, 0 | OAMF_XFLIP
	frame_oam -57,   6, $4a, 5 | OAMF_XFLIP
	frame_oam -57,  -2, $4c, 5 | OAMF_XFLIP
	frame_oam -54,  10, $40, 7
	db $80

.frame_11
	frame_oam -38,  -6, $42, 4
	frame_oam -38,   2, $44, 4
	frame_oam -38,  10, $42, 4 | OAMF_XFLIP
	frame_oam -37,  -2, $56, 1
	frame_oam -37,   6, $56, 1 | OAMF_XFLIP
	frame_oam -54,  -6, $3e, 6
	frame_oam -70,  -2, $3a, 6
	frame_oam -70,   6, $3c, 7
	frame_oam -54,  -2, $4e, 0
	frame_oam -54,   6, $4e, 0 | OAMF_XFLIP
	frame_oam -57,  -1, $46, 5
	frame_oam -57,   5, $46, 5 | OAMF_XFLIP
	frame_oam -54,  10, $40, 7
	db $80

.frame_12
	frame_oam -54,   3, $a2, 2
	frame_oam -68,  -5, $84, 6
	frame_oam -68,   3, $86, 6
	frame_oam -68,  11, $88, 6
	frame_oam -68,  -5, $8a, 5
	frame_oam -68,   3, $8c, 5
	frame_oam -68,  11, $8e, 5
	frame_oam -42,  -5, $90, 7
	frame_oam -42,   3, $92, 7
	frame_oam -42,  11, $94, 7
	frame_oam -41, -13, $18, 0 | OAMF_XFLIP
	frame_oam -58,   3, $98, 4
	frame_oam -52,  -5, $96, 4
	frame_oam -52,  11, $96, 4 | OAMF_XFLIP
	frame_oam -54,  -5, $9a, 2
	frame_oam -54,  10, $9a, 2
	db $80

.frame_13
	frame_oam -69,  -5, $84, 6
	frame_oam -69,   3, $86, 6
	frame_oam -69,  11, $88, 6
	frame_oam -69,  -5, $8a, 5
	frame_oam -69,   3, $8c, 5
	frame_oam -69,  11, $8e, 5
	frame_oam -42,  -5, $90, 7
	frame_oam -42,   3, $92, 7
	frame_oam -42,  11, $94, 7
	frame_oam -41, -13, $18, 0 | OAMF_XFLIP
	frame_oam -54,   0, $a0, 2
	frame_oam -58,   3, $98, 4
	frame_oam -52,  -5, $96, 4
	frame_oam -52,  11, $96, 4 | OAMF_XFLIP
	frame_oam -54,  -3, $9c, 2
	frame_oam -54,   9, $9c, 2
	db $80

.frame_14
	frame_oam -70,  -5, $84, 6
	frame_oam -70,   3, $86, 6
	frame_oam -70,  11, $88, 6
	frame_oam -70,  -5, $8a, 5
	frame_oam -70,   3, $8c, 5
	frame_oam -70,  11, $8e, 5
	frame_oam -42,  -5, $90, 7
	frame_oam -42,   3, $92, 7
	frame_oam -42,  11, $94, 7
	frame_oam -41, -13, $18, 0 | OAMF_XFLIP
	frame_oam -58,   3, $98, 4
	frame_oam -52,  -5, $96, 4
	frame_oam -52,  11, $96, 4 | OAMF_XFLIP
	frame_oam -54,  -2, $9e, 2
	frame_oam -54,   8, $9e, 2
	db $80

.frame_15
	frame_oam -71,  -5, $84, 6
	frame_oam -71,   3, $86, 6
	frame_oam -71,  11, $88, 6
	frame_oam -71,  -5, $8a, 5
	frame_oam -71,   3, $8c, 5
	frame_oam -71,  11, $8e, 5
	frame_oam -42,  -5, $90, 7
	frame_oam -42,   3, $92, 7
	frame_oam -42,  11, $94, 7
	frame_oam -41, -13, $18, 0 | OAMF_XFLIP
	frame_oam -54,   6, $a0, 2
	frame_oam -58,   3, $98, 4
	frame_oam -52,  -5, $96, 4
	frame_oam -52,  11, $96, 4 | OAMF_XFLIP
	frame_oam -54,   9, $9c, 2
	frame_oam -54,  -3, $9c, 2
	db $80

.frame_16
	frame_oam -54,   3, $a2, 2
	frame_oam -71,  -5, $84, 6
	frame_oam -71,   3, $86, 6
	frame_oam -71,  11, $88, 6
	frame_oam -71,  -5, $8a, 5
	frame_oam -71,   3, $8c, 5
	frame_oam -71,  11, $8e, 5
	frame_oam -42,  -5, $90, 7
	frame_oam -42,   3, $92, 7
	frame_oam -42,  11, $94, 7
	frame_oam -41, -13, $18, 0 | OAMF_XFLIP
	frame_oam -58,   3, $98, 4
	frame_oam -52,  -5, $96, 4
	frame_oam -52,  11, $96, 4 | OAMF_XFLIP
	frame_oam -54,  -5, $9a, 2
	frame_oam -54,  10, $9a, 2
	db $80

.frame_17
	frame_oam -70,  -5, $84, 6
	frame_oam -70,   3, $86, 6
	frame_oam -70,  11, $88, 6
	frame_oam -70,  -5, $8a, 5
	frame_oam -70,   3, $8c, 5
	frame_oam -70,  11, $8e, 5
	frame_oam -42,  -5, $90, 7
	frame_oam -42,   3, $92, 7
	frame_oam -42,  11, $94, 7
	frame_oam -41, -13, $18, 0 | OAMF_XFLIP
	frame_oam -54,   0, $a0, 2
	frame_oam -58,   3, $98, 4
	frame_oam -52,  -5, $96, 4
	frame_oam -52,  11, $96, 4 | OAMF_XFLIP
	frame_oam -54,  -3, $9c, 2
	frame_oam -54,   9, $9c, 2
	db $80

.frame_18
	frame_oam -69,  -5, $84, 6
	frame_oam -69,   3, $86, 6
	frame_oam -69,  11, $88, 6
	frame_oam -69,  -5, $8a, 5
	frame_oam -69,   3, $8c, 5
	frame_oam -69,  11, $8e, 5
	frame_oam -42,  -5, $90, 7
	frame_oam -42,   3, $92, 7
	frame_oam -42,  11, $94, 7
	frame_oam -41, -13, $18, 0 | OAMF_XFLIP
	frame_oam -58,   3, $98, 4
	frame_oam -52,  -5, $96, 4
	frame_oam -52,  11, $96, 4 | OAMF_XFLIP
	frame_oam -54,  -2, $9e, 2
	frame_oam -54,   8, $9e, 2
	db $80

.frame_19
	frame_oam -68,  -5, $84, 6
	frame_oam -68,   3, $86, 6
	frame_oam -68,  11, $88, 6
	frame_oam -68,  -5, $8a, 5
	frame_oam -68,   3, $8c, 5
	frame_oam -68,  11, $8e, 5
	frame_oam -42,  -5, $90, 7
	frame_oam -42,   3, $92, 7
	frame_oam -42,  11, $94, 7
	frame_oam -41, -13, $18, 0 | OAMF_XFLIP
	frame_oam -54,   6, $a0, 2
	frame_oam -58,   3, $98, 4
	frame_oam -52,  -5, $96, 4
	frame_oam -52,  11, $96, 4 | OAMF_XFLIP
	frame_oam -54,   9, $9c, 2
	frame_oam -54,  -3, $9c, 2
	db $80

.frame_20
	frame_oam -45,  -6, $60, 5
	frame_oam -37,   2, $62, 5
	frame_oam -45,  10, $64, 5
	frame_oam -48,  -6, $5a, 4
	frame_oam -37,   2, $5c, 4
	frame_oam -48,  10, $5e, 4
	frame_oam -53,   2, $74, 1
	frame_oam -61, -13, $68, 4
	frame_oam -61,  -5, $6c, 4
	frame_oam -77,  -5, $6a, 4
	frame_oam -69,   3, $6e, 5
	frame_oam -64,  -8, $70, 1
	frame_oam -70,   0, $72, 1
	frame_oam -48, -22, $76, 0
	frame_oam -48, -14, $78, 0
	frame_oam -61,  12, $66, 2
	frame_oam -61,  -3, $7c, 6
	frame_oam -61,   5, $7e, 6
	frame_oam -64,   5, $7a, 7
	db $80

.frame_21
	frame_oam -45,  -6, $60, 5
	frame_oam -37,   2, $62, 5
	frame_oam -45,  10, $64, 5
	frame_oam -48,  -6, $5a, 4
	frame_oam -37,   2, $5c, 4
	frame_oam -48,  10, $5e, 4
	frame_oam -53,   2, $74, 1
	frame_oam -61, -13, $68, 4
	frame_oam -61,  -5, $6c, 4
	frame_oam -77,  -5, $6a, 4
	frame_oam -69,   3, $6e, 5
	frame_oam -64,  -8, $70, 1
	frame_oam -70,   0, $72, 1
	frame_oam -48, -22, $76, 0
	frame_oam -48, -14, $78, 0
	frame_oam -61,  12, $66, 2
	frame_oam -64,   5, $7a, 7
	frame_oam -61,  -3, $80, 6
	frame_oam -61,   5, $82, 6
	db $80

.frame_22
	frame_oam -45,  -6, $60, 5
	frame_oam -37,   2, $62, 5
	frame_oam -45,  10, $64, 5
	frame_oam -48,  -6, $5a, 4
	frame_oam -37,   2, $5c, 4
	frame_oam -48,  10, $5e, 4
	frame_oam -53,   2, $74, 1
	frame_oam -61, -13, $68, 4
	frame_oam -61,  -5, $6c, 4
	frame_oam -77,  -5, $6a, 4
	frame_oam -69,   3, $6e, 5
	frame_oam -64,  -8, $70, 1
	frame_oam -70,   0, $72, 1
	frame_oam -48, -22, $76, 0
	frame_oam -48, -14, $78, 0
	frame_oam -61,  12, $66, 2
	frame_oam -64,   4, $7a, 7
	frame_oam -61,   5, $80, 6 | OAMF_XFLIP
	frame_oam -61,  -3, $82, 6 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -45,  -6, $60, 5
	frame_oam -37,   2, $62, 5
	frame_oam -45,  10, $64, 5
	frame_oam -48,  -6, $5a, 4
	frame_oam -37,   2, $5c, 4
	frame_oam -48,  10, $5e, 4
	frame_oam -53,   2, $74, 1
	frame_oam -61, -13, $68, 4
	frame_oam -61,  -5, $6c, 4
	frame_oam -77,  -5, $6a, 4
	frame_oam -69,   3, $6e, 5
	frame_oam -64,  -8, $70, 1
	frame_oam -70,   0, $72, 1
	frame_oam -48, -22, $76, 0
	frame_oam -48, -14, $78, 0
	frame_oam -61,  12, $66, 2
	frame_oam -64,   2, $7a, 7
	frame_oam -61,   5, $7c, 6 | OAMF_XFLIP
	frame_oam -61,  -3, $7e, 6 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -45,  -6, $60, 5
	frame_oam -37,   2, $62, 5
	frame_oam -45,  10, $64, 5
	frame_oam -48,  -6, $5a, 4
	frame_oam -37,   2, $5c, 4
	frame_oam -48,  10, $5e, 4
	frame_oam -53,   2, $74, 1
	frame_oam -61, -13, $68, 4
	frame_oam -61,  -5, $6c, 4
	frame_oam -77,  -5, $6a, 4
	frame_oam -69,   3, $6e, 5
	frame_oam -64,  -8, $70, 1
	frame_oam -70,   0, $72, 1
	frame_oam -48, -22, $76, 0
	frame_oam -48, -14, $78, 0
	frame_oam -61,  12, $66, 2
	frame_oam -64,   0, $7a, 7
	frame_oam -61,  -3, $7c, 6
	frame_oam -61,   5, $7e, 6
	db $80

.frame_25
	frame_oam -45,  -6, $60, 5
	frame_oam -37,   2, $62, 5
	frame_oam -45,  10, $64, 5
	frame_oam -48,  -6, $5a, 4
	frame_oam -37,   2, $5c, 4
	frame_oam -48,  10, $5e, 4
	frame_oam -53,   2, $74, 1
	frame_oam -61, -13, $68, 4
	frame_oam -61,  -5, $6c, 4
	frame_oam -77,  -5, $6a, 4
	frame_oam -69,   3, $6e, 5
	frame_oam -64,  -8, $70, 1
	frame_oam -70,   0, $72, 1
	frame_oam -48, -22, $76, 0
	frame_oam -48, -14, $78, 0
	frame_oam -61,  12, $66, 2
	frame_oam -64,  -2, $7a, 7
	frame_oam -61,  -3, $80, 6
	frame_oam -61,   5, $82, 6
	db $80

.frame_26
	frame_oam -45,  -6, $60, 5
	frame_oam -37,   2, $62, 5
	frame_oam -45,  10, $64, 5
	frame_oam -48,  -6, $5a, 4
	frame_oam -37,   2, $5c, 4
	frame_oam -48,  10, $5e, 4
	frame_oam -53,   2, $74, 1
	frame_oam -61, -13, $68, 4
	frame_oam -61,  -5, $6c, 4
	frame_oam -77,  -5, $6a, 4
	frame_oam -69,   3, $6e, 5
	frame_oam -64,  -8, $70, 1
	frame_oam -70,   0, $72, 1
	frame_oam -48, -22, $76, 0
	frame_oam -48, -14, $78, 0
	frame_oam -61,  12, $66, 2
	frame_oam -64,  -4, $7a, 7
	frame_oam -61,   5, $80, 6 | OAMF_XFLIP
	frame_oam -61,  -3, $82, 6 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -45,  -6, $60, 5
	frame_oam -37,   2, $62, 5
	frame_oam -45,  10, $64, 5
	frame_oam -48,  -6, $5a, 4
	frame_oam -37,   2, $5c, 4
	frame_oam -48,  10, $5e, 4
	frame_oam -53,   2, $74, 1
	frame_oam -61, -13, $68, 4
	frame_oam -61,  -5, $6c, 4
	frame_oam -77,  -5, $6a, 4
	frame_oam -69,   3, $6e, 5
	frame_oam -64,  -8, $70, 1
	frame_oam -70,   0, $72, 1
	frame_oam -48, -22, $76, 0
	frame_oam -48, -14, $78, 0
	frame_oam -61,  12, $66, 2
	frame_oam -64,  -5, $7a, 7
	frame_oam -61,   5, $7c, 6 | OAMF_XFLIP
	frame_oam -61,  -3, $7e, 6 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam -45,  -6, $60, 5
	frame_oam -37,   2, $62, 5
	frame_oam -45,  10, $64, 5
	frame_oam -48,  -6, $5a, 4
	frame_oam -37,   2, $5c, 4
	frame_oam -48,  10, $5e, 4
	frame_oam -53,   2, $74, 1
	frame_oam -61, -13, $68, 4
	frame_oam -61,  -5, $6c, 4
	frame_oam -77,  -5, $6a, 4
	frame_oam -69,   3, $6e, 5
	frame_oam -64,  -8, $70, 1
	frame_oam -70,   0, $72, 1
	frame_oam -48, -22, $76, 0
	frame_oam -48, -14, $78, 0
	frame_oam -61,  12, $66, 2
	frame_oam -64,  -5, $7a, 7
	frame_oam -61,  -3, $7c, 6
	frame_oam -61,   5, $7e, 6
	db $80

.frame_29
	frame_oam -45,  -6, $60, 5
	frame_oam -37,   2, $62, 5
	frame_oam -45,  10, $64, 5
	frame_oam -48,  -6, $5a, 4
	frame_oam -37,   2, $5c, 4
	frame_oam -48,  10, $5e, 4
	frame_oam -53,   2, $74, 1
	frame_oam -61, -13, $68, 4
	frame_oam -61,  -5, $6c, 4
	frame_oam -77,  -5, $6a, 4
	frame_oam -69,   3, $6e, 5
	frame_oam -64,  -8, $70, 1
	frame_oam -70,   0, $72, 1
	frame_oam -48, -22, $76, 0
	frame_oam -48, -14, $78, 0
	frame_oam -61,  12, $66, 2
	frame_oam -64,  -5, $7a, 7
	frame_oam -61,  -3, $80, 6
	frame_oam -61,   5, $82, 6
	db $80

.frame_30
	frame_oam -45,  -6, $60, 5
	frame_oam -37,   2, $62, 5
	frame_oam -45,  10, $64, 5
	frame_oam -48,  -6, $5a, 4
	frame_oam -37,   2, $5c, 4
	frame_oam -48,  10, $5e, 4
	frame_oam -53,   2, $74, 1
	frame_oam -61, -13, $68, 4
	frame_oam -61,  -5, $6c, 4
	frame_oam -77,  -5, $6a, 4
	frame_oam -69,   3, $6e, 5
	frame_oam -64,  -8, $70, 1
	frame_oam -70,   0, $72, 1
	frame_oam -48, -22, $76, 0
	frame_oam -48, -14, $78, 0
	frame_oam -61,  12, $66, 2
	frame_oam -64,  -4, $7a, 7
	frame_oam -61,   5, $80, 6 | OAMF_XFLIP
	frame_oam -61,  -3, $82, 6 | OAMF_XFLIP
	db $80

.frame_31
	frame_oam -45,  -6, $60, 5
	frame_oam -37,   2, $62, 5
	frame_oam -45,  10, $64, 5
	frame_oam -48,  -6, $5a, 4
	frame_oam -37,   2, $5c, 4
	frame_oam -48,  10, $5e, 4
	frame_oam -53,   2, $74, 1
	frame_oam -61, -13, $68, 4
	frame_oam -61,  -5, $6c, 4
	frame_oam -77,  -5, $6a, 4
	frame_oam -69,   3, $6e, 5
	frame_oam -64,  -8, $70, 1
	frame_oam -70,   0, $72, 1
	frame_oam -48, -22, $76, 0
	frame_oam -48, -14, $78, 0
	frame_oam -61,  12, $66, 2
	frame_oam -64,  -2, $7a, 7
	frame_oam -61,   5, $7c, 6 | OAMF_XFLIP
	frame_oam -61,  -3, $7e, 6 | OAMF_XFLIP
	db $80

.frame_32
	frame_oam -45,  -6, $60, 5
	frame_oam -37,   2, $62, 5
	frame_oam -45,  10, $64, 5
	frame_oam -48,  -6, $5a, 4
	frame_oam -37,   2, $5c, 4
	frame_oam -48,  10, $5e, 4
	frame_oam -53,   2, $74, 1
	frame_oam -61, -13, $68, 4
	frame_oam -61,  -5, $6c, 4
	frame_oam -77,  -5, $6a, 4
	frame_oam -69,   3, $6e, 5
	frame_oam -64,  -8, $70, 1
	frame_oam -70,   0, $72, 1
	frame_oam -48, -22, $76, 0
	frame_oam -48, -14, $78, 0
	frame_oam -61,  12, $66, 2
	frame_oam -64,   0, $7a, 7
	frame_oam -61,  -3, $7c, 6
	frame_oam -61,   5, $7e, 6
	db $80

.frame_33
	frame_oam -45,  -6, $60, 5
	frame_oam -37,   2, $62, 5
	frame_oam -45,  10, $64, 5
	frame_oam -48,  -6, $5a, 4
	frame_oam -37,   2, $5c, 4
	frame_oam -48,  10, $5e, 4
	frame_oam -53,   2, $74, 1
	frame_oam -61, -13, $68, 4
	frame_oam -61,  -5, $6c, 4
	frame_oam -77,  -5, $6a, 4
	frame_oam -69,   3, $6e, 5
	frame_oam -64,  -8, $70, 1
	frame_oam -70,   0, $72, 1
	frame_oam -48, -22, $76, 0
	frame_oam -48, -14, $78, 0
	frame_oam -61,  12, $66, 2
	frame_oam -64,   2, $7a, 7
	frame_oam -61,  -3, $80, 6
	frame_oam -61,   5, $82, 6
	db $80

.frame_34
	frame_oam -45,  -6, $60, 5
	frame_oam -37,   2, $62, 5
	frame_oam -45,  10, $64, 5
	frame_oam -48,  -6, $5a, 4
	frame_oam -37,   2, $5c, 4
	frame_oam -48,  10, $5e, 4
	frame_oam -53,   2, $74, 1
	frame_oam -61, -13, $68, 4
	frame_oam -61,  -5, $6c, 4
	frame_oam -77,  -5, $6a, 4
	frame_oam -69,   3, $6e, 5
	frame_oam -64,  -8, $70, 1
	frame_oam -70,   0, $72, 1
	frame_oam -48, -22, $76, 0
	frame_oam -48, -14, $78, 0
	frame_oam -61,  12, $66, 2
	frame_oam -64,   4, $7a, 7
	frame_oam -61,   5, $80, 6 | OAMF_XFLIP
	frame_oam -61,  -3, $82, 6 | OAMF_XFLIP
	db $80

.frame_35
	frame_oam -45,  -6, $60, 5
	frame_oam -37,   2, $62, 5
	frame_oam -45,  10, $64, 5
	frame_oam -48,  -6, $5a, 4
	frame_oam -37,   2, $5c, 4
	frame_oam -48,  10, $5e, 4
	frame_oam -53,   2, $74, 1
	frame_oam -61, -13, $68, 4
	frame_oam -61,  -5, $6c, 4
	frame_oam -77,  -5, $6a, 4
	frame_oam -69,   3, $6e, 5
	frame_oam -64,  -8, $70, 1
	frame_oam -70,   0, $72, 1
	frame_oam -48, -22, $76, 0
	frame_oam -48, -14, $78, 0
	frame_oam -61,  12, $66, 2
	frame_oam -64,   5, $7a, 7
	frame_oam -61,   5, $7c, 6 | OAMF_XFLIP
	frame_oam -61,  -3, $7e, 6 | OAMF_XFLIP
	db $80

.frame_36
	frame_oam -45,  -6, $aa, 6
	frame_oam -45,   2, $ac, 6
	frame_oam -45,  10, $ae, 6
	frame_oam -45,  10, $b6, 1
	frame_oam -61, -10, $a4, 7
	frame_oam -61,  -2, $a6, 7
	frame_oam -61,   6, $a8, 7
	frame_oam -61,  14, $a4, 7 | OAMF_XFLIP
	frame_oam -53,  -6, $b0, 2
	frame_oam -53,   2, $b2, 2
	frame_oam -53,  10, $b4, 2
	frame_oam -42,  18, $18, 0
	db $80

.frame_37
	frame_oam -45,  -6, $aa, 6
	frame_oam -45,   2, $ac, 6
	frame_oam -45,  10, $ae, 6
	frame_oam -45,  10, $b6, 1
	frame_oam -61, -10, $a4, 7
	frame_oam -61,  -2, $a6, 7
	frame_oam -61,   6, $a8, 7
	frame_oam -61,  14, $a4, 7 | OAMF_XFLIP
	frame_oam -53,  -6, $b0, 2
	frame_oam -53,   2, $b2, 2
	frame_oam -53,  10, $b4, 2
	frame_oam -70,  -2, $b8, 1
	frame_oam -42,  18, $18, 0
	db $80

.frame_38
	frame_oam -45,  -6, $aa, 6
	frame_oam -45,   2, $ac, 6
	frame_oam -45,  10, $ae, 6
	frame_oam -45,  10, $b6, 1
	frame_oam -61, -10, $a4, 7
	frame_oam -61,  -2, $a6, 7
	frame_oam -61,   6, $a8, 7
	frame_oam -61,  14, $a4, 7 | OAMF_XFLIP
	frame_oam -53,  -6, $b0, 2
	frame_oam -53,   2, $b2, 2
	frame_oam -53,  10, $b4, 2
	frame_oam -73,  -2, $b8, 1
	frame_oam -57,  -2, $ba, 2
	frame_oam -42,  18, $18, 0
	db $80

.frame_39
	frame_oam -45,  -6, $aa, 6
	frame_oam -45,   2, $ac, 6
	frame_oam -45,  10, $ae, 6
	frame_oam -45,  10, $b6, 1
	frame_oam -61, -10, $a4, 7
	frame_oam -61,  -2, $a6, 7
	frame_oam -61,   6, $a8, 7
	frame_oam -61,  14, $a4, 7 | OAMF_XFLIP
	frame_oam -53,  -6, $b0, 2
	frame_oam -53,   2, $b2, 2
	frame_oam -53,  10, $b4, 2
	frame_oam -76,  -2, $b8, 1
	frame_oam -60,  -2, $ba, 2
	frame_oam -42,  18, $18, 0
	db $80

.frame_40
	frame_oam -45,  -6, $aa, 6
	frame_oam -45,   2, $ac, 6
	frame_oam -45,  10, $ae, 6
	frame_oam -45,  10, $b6, 1
	frame_oam -61, -10, $a4, 7
	frame_oam -61,  -2, $a6, 7
	frame_oam -61,   6, $a8, 7
	frame_oam -61,  14, $a4, 7 | OAMF_XFLIP
	frame_oam -53,  -6, $b0, 2
	frame_oam -53,   2, $b2, 2
	frame_oam -53,  10, $b4, 2
	frame_oam -78,  -2, $b8, 1
	frame_oam -62,  -2, $ba, 2
	frame_oam -42,  18, $18, 0
	db $80

.frame_41
	frame_oam -45,  -6, $aa, 6
	frame_oam -45,   2, $ac, 6
	frame_oam -45,  10, $ae, 6
	frame_oam -45,  10, $b6, 1
	frame_oam -61, -10, $a4, 7
	frame_oam -61,  -2, $a6, 7
	frame_oam -61,   6, $a8, 7
	frame_oam -61,  14, $a4, 7 | OAMF_XFLIP
	frame_oam -53,  -6, $b0, 2
	frame_oam -53,   2, $b2, 2
	frame_oam -53,  10, $b4, 2
	frame_oam -79,  -2, $b8, 1
	frame_oam -63,  -2, $ba, 2
	frame_oam -42,  18, $18, 0
	db $80

.frame_42
	frame_oam -45,  -6, $aa, 6
	frame_oam -45,   2, $ac, 6
	frame_oam -45,  10, $ae, 6
	frame_oam -45,  10, $b6, 1
	frame_oam -61, -10, $a4, 7
	frame_oam -61,  -2, $a6, 7
	frame_oam -61,   6, $a8, 7
	frame_oam -61,  14, $a4, 7 | OAMF_XFLIP
	frame_oam -53,  -6, $b0, 2
	frame_oam -53,   2, $b2, 2
	frame_oam -53,  10, $b4, 2
	frame_oam -80,  -2, $b8, 1
	frame_oam -64,  -2, $ba, 2
	frame_oam -42,  18, $18, 0
	db $80

.frame_43
	frame_oam -45,  -6, $aa, 6
	frame_oam -45,   2, $ac, 6
	frame_oam -45,  10, $ae, 6
	frame_oam -45,  10, $b6, 1
	frame_oam -61, -10, $a4, 7
	frame_oam -61,  -2, $a6, 7
	frame_oam -61,   6, $a8, 7
	frame_oam -61,  14, $a4, 7 | OAMF_XFLIP
	frame_oam -53,  -6, $b0, 2
	frame_oam -53,   2, $b2, 2
	frame_oam -53,  10, $b4, 2
	frame_oam -81,  -2, $b8, 1
	frame_oam -64,  -2, $ba, 2
	frame_oam -42,  18, $18, 0
	db $80

.frame_44
	frame_oam -45,  -6, $aa, 6
	frame_oam -45,   2, $ac, 6
	frame_oam -45,  10, $ae, 6
	frame_oam -45,  10, $b6, 1
	frame_oam -61, -10, $a4, 7
	frame_oam -61,  -2, $a6, 7
	frame_oam -61,   6, $a8, 7
	frame_oam -61,  14, $a4, 7 | OAMF_XFLIP
	frame_oam -53,  -6, $b0, 2
	frame_oam -53,   2, $b2, 2
	frame_oam -53,  10, $b4, 2
	frame_oam -82,  -2, $b8, 1
	frame_oam -64,  -2, $ba, 2
	frame_oam -42,  18, $18, 0
	db $80

.frame_45
	frame_oam -45,  -6, $aa, 6
	frame_oam -45,   2, $ac, 6
	frame_oam -45,  10, $ae, 6
	frame_oam -45,  10, $b6, 1
	frame_oam -61, -10, $a4, 7
	frame_oam -61,  -2, $a6, 7
	frame_oam -61,   6, $a8, 7
	frame_oam -61,  14, $a4, 7 | OAMF_XFLIP
	frame_oam -53,  -6, $b0, 2
	frame_oam -53,   2, $b2, 2
	frame_oam -53,  10, $b4, 2
	frame_oam -70,   6, $b8, 1 | OAMF_XFLIP
	frame_oam -42,  18, $18, 0
	db $80

.frame_46
	frame_oam -45,  -6, $aa, 6
	frame_oam -45,   2, $ac, 6
	frame_oam -45,  10, $ae, 6
	frame_oam -45,  10, $b6, 1
	frame_oam -61, -10, $a4, 7
	frame_oam -61,  -2, $a6, 7
	frame_oam -61,   6, $a8, 7
	frame_oam -61,  14, $a4, 7 | OAMF_XFLIP
	frame_oam -53,  -6, $b0, 2
	frame_oam -53,   2, $b2, 2
	frame_oam -53,  10, $b4, 2
	frame_oam -73,   6, $b8, 1 | OAMF_XFLIP
	frame_oam -57,   6, $ba, 2 | OAMF_XFLIP
	frame_oam -42,  18, $18, 0
	db $80

.frame_47
	frame_oam -45,  -6, $aa, 6
	frame_oam -45,   2, $ac, 6
	frame_oam -45,  10, $ae, 6
	frame_oam -45,  10, $b6, 1
	frame_oam -61, -10, $a4, 7
	frame_oam -61,  -2, $a6, 7
	frame_oam -61,   6, $a8, 7
	frame_oam -61,  14, $a4, 7 | OAMF_XFLIP
	frame_oam -53,  -6, $b0, 2
	frame_oam -53,   2, $b2, 2
	frame_oam -53,  10, $b4, 2
	frame_oam -76,   6, $b8, 1 | OAMF_XFLIP
	frame_oam -60,   6, $ba, 2 | OAMF_XFLIP
	frame_oam -42,  18, $18, 0
	db $80

.frame_48
	frame_oam -45,  -6, $aa, 6
	frame_oam -45,   2, $ac, 6
	frame_oam -45,  10, $ae, 6
	frame_oam -45,  10, $b6, 1
	frame_oam -61, -10, $a4, 7
	frame_oam -61,  -2, $a6, 7
	frame_oam -61,   6, $a8, 7
	frame_oam -61,  14, $a4, 7 | OAMF_XFLIP
	frame_oam -53,  -6, $b0, 2
	frame_oam -53,   2, $b2, 2
	frame_oam -53,  10, $b4, 2
	frame_oam -78,   6, $b8, 1 | OAMF_XFLIP
	frame_oam -62,   6, $ba, 2 | OAMF_XFLIP
	frame_oam -42,  18, $18, 0
	db $80

.frame_49
	frame_oam -45,  -6, $aa, 6
	frame_oam -45,   2, $ac, 6
	frame_oam -45,  10, $ae, 6
	frame_oam -45,  10, $b6, 1
	frame_oam -61, -10, $a4, 7
	frame_oam -61,  -2, $a6, 7
	frame_oam -61,   6, $a8, 7
	frame_oam -61,  14, $a4, 7 | OAMF_XFLIP
	frame_oam -53,  -6, $b0, 2
	frame_oam -53,   2, $b2, 2
	frame_oam -53,  10, $b4, 2
	frame_oam -79,   6, $b8, 1 | OAMF_XFLIP
	frame_oam -63,   6, $ba, 2 | OAMF_XFLIP
	frame_oam -42,  18, $18, 0
	db $80

.frame_50
	frame_oam -45,  -6, $aa, 6
	frame_oam -45,   2, $ac, 6
	frame_oam -45,  10, $ae, 6
	frame_oam -45,  10, $b6, 1
	frame_oam -61, -10, $a4, 7
	frame_oam -61,  -2, $a6, 7
	frame_oam -61,   6, $a8, 7
	frame_oam -61,  14, $a4, 7 | OAMF_XFLIP
	frame_oam -53,  -6, $b0, 2
	frame_oam -53,   2, $b2, 2
	frame_oam -53,  10, $b4, 2
	frame_oam -80,   6, $b8, 1 | OAMF_XFLIP
	frame_oam -64,   6, $ba, 2 | OAMF_XFLIP
	frame_oam -42,  18, $18, 0
	db $80

.frame_51
	frame_oam -45,  -6, $aa, 6
	frame_oam -45,   2, $ac, 6
	frame_oam -45,  10, $ae, 6
	frame_oam -45,  10, $b6, 1
	frame_oam -61, -10, $a4, 7
	frame_oam -61,  -2, $a6, 7
	frame_oam -61,   6, $a8, 7
	frame_oam -61,  14, $a4, 7 | OAMF_XFLIP
	frame_oam -53,  -6, $b0, 2
	frame_oam -53,   2, $b2, 2
	frame_oam -53,  10, $b4, 2
	frame_oam -81,   6, $b8, 1 | OAMF_XFLIP
	frame_oam -64,   6, $ba, 2 | OAMF_XFLIP
	frame_oam -42,  18, $18, 0
	db $80

.frame_52
	frame_oam -45,  -6, $aa, 6
	frame_oam -45,   2, $ac, 6
	frame_oam -45,  10, $ae, 6
	frame_oam -45,  10, $b6, 1
	frame_oam -61, -10, $a4, 7
	frame_oam -61,  -2, $a6, 7
	frame_oam -61,   6, $a8, 7
	frame_oam -61,  14, $a4, 7 | OAMF_XFLIP
	frame_oam -53,  -6, $b0, 2
	frame_oam -53,   2, $b2, 2
	frame_oam -53,  10, $b4, 2
	frame_oam -82,   6, $b8, 1 | OAMF_XFLIP
	frame_oam -64,   6, $ba, 2 | OAMF_XFLIP
	frame_oam -42,  18, $18, 0
	db $80
; 0xbcf15

Frameset_bcf15:: ; bcf15 (2f:4f15)
	db $00,  4
	db $ff
; 0xbcf18

Frameset_bcf18:: ; bcf18 (2f:4f18)
	db $00, 12
	db $01, 12
	db $02, 12
	db $03, 12
	db $ff
; 0xbcf21

Frameset_bcf21:: ; bcf21 (2f:4f21)
	db $04,  4
	db $ff
; 0xbcf24

Frameset_bcf24:: ; bcf24 (2f:4f24)
	db $04,  8
	db $05,  8
	db $06,  8
	db $07,  8
	db $08,  8
	db $09,  8
	db $0a,  8
	db $0b,  8
	db $ff
; 0xbcf35

Frameset_bcf35:: ; bcf35 (2f:4f35)
	db $0c,  4
	db $ff
; 0xbcf38

Frameset_bcf38:: ; bcf38 (2f:4f38)
	db $0c, 12
	db $0d, 12
	db $0e, 12
	db $0f, 12
	db $10, 12
	db $11, 12
	db $12, 12
	db $13, 12
	db $ff
; 0xbcf49

Frameset_bcf49:: ; bcf49 (2f:4f49)
	db $14,  4
	db $ff
; 0xbcf4c

Frameset_bcf4c:: ; bcf4c (2f:4f4c)
	db $14,  4
	db $15,  4
	db $16,  4
	db $17,  4
	db $18,  4
	db $19,  4
	db $1a,  4
	db $1b,  4
	db $1c,  4
	db $1d,  4
	db $1e,  4
	db $1f,  4
	db $20,  4
	db $21,  4
	db $22,  4
	db $23,  4
	db $ff
; 0xbcf6d

Frameset_bcf6d:: ; bcf6d (2f:4f6d)
	db $24,  4
	db $ff
; 0xbcf70

Frameset_bcf70:: ; bcf70 (2f:4f70)
	db $24, 20
	db $25,  4
	db $26,  4
	db $27,  4
	db $28,  4
	db $29,  4
	db $2a,  4
	db $2b,  4
	db $2c,  8
	db $2b,  4
	db $2a,  4
	db $29,  4
	db $28,  4
	db $27,  4
	db $26,  4
	db $25,  4
	db $24, 20
	db $2d,  4
	db $2e,  4
	db $2f,  4
	db $30,  4
	db $31,  4
	db $32,  4
	db $33,  4
	db $34,  8
	db $33,  4
	db $32,  4
	db $31,  4
	db $30,  4
	db $2f,  4
	db $2e,  4
	db $2d,  4
	db $24, 20
	db $ff
; 0xbcfb3

OAM_bcfb3:: ; bcfb3 (2f:4fb3)
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
	frame_oam -60,  -6, $bc, 5
	frame_oam -60,   2, $be, 5
	frame_oam -60,  10, $c0, 5
	frame_oam -44,  -6, $c2, 5
	frame_oam -44,   2, $c4, 5
	frame_oam -44,  10, $c6, 5
	frame_oam -60,  -6, $c8, 6
	frame_oam -60,   2, $ca, 6
	frame_oam -60,  10, $cc, 6
	frame_oam -44,  -6, $ce, 6
	frame_oam -44,   2, $d0, 6
	frame_oam -48,  10, $d2, 6
	db $80

.frame_1
	frame_oam -16, -11, $d4, 4
	frame_oam -16,  -3, $d6, 4
	frame_oam -16,   5, $d8, 4
	db $80

.frame_2
	frame_oam -16, -12, $da, 6
	frame_oam -16,  -4, $dc, 6
	frame_oam -16,   4, $de, 6
	db $80

.frame_3
	frame_oam -20, -12, $e0, 5
	frame_oam -20,  -4, $e2, 5
	frame_oam -20,   4, $e4, 5
	frame_oam  -4,  -4, $e6, 5
	db $80

.frame_4
	frame_oam -16,  -8, $e8, 6
	frame_oam -16,   0, $e8, 6 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16,  -8, $ea, 6
	frame_oam -16,   0, $ea, 6 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -16,  -8, $e8, 6
	frame_oam -16,   0, $e8, 6 | OAMF_XFLIP
	frame_oam -32,  -4, $ec, 6
	frame_oam   0,  -3, $ec, 6 | OAMF_YFLIP
	frame_oam -16,   8, $ee, 6
	frame_oam -16,  16, $f0, 6
	frame_oam -16, -16, $ee, 6 | OAMF_XFLIP
	frame_oam -16, -24, $f0, 6 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -24,   0, $f2, 6
	frame_oam  -8,   0, $f4, 6
	frame_oam  -8,   8, $f6, 6
	frame_oam  -8,  -8, $f2, 6 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -24,  -8, $f4, 6 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -24, -16, $f6, 6 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_8
	frame_oam  -8,   0, $f2, 6 | OAMF_YFLIP
	frame_oam -24,   0, $f4, 6 | OAMF_YFLIP
	frame_oam -24,   8, $f6, 6 | OAMF_YFLIP
	frame_oam -24,  -8, $f2, 6 | OAMF_XFLIP
	frame_oam  -8,  -8, $f4, 6 | OAMF_XFLIP
	frame_oam  -8, -16, $f6, 6 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -16,  -8, $f8, 6
	frame_oam -16,   0, $f8, 6 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -16,  -8, $fc, 6
	frame_oam -16,   0, $fc, 6 | OAMF_XFLIP
	frame_oam -24,  -8, $fe, 6
	frame_oam -24,   0, $fe, 6 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -16,  -8, $f8, 6
	frame_oam -16,   0, $f8, 6 | OAMF_XFLIP
	frame_oam -32,  -8, $fa, 6
	frame_oam -32,   0, $fa, 6 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -16,  -8, $fc, 6
	frame_oam -16,   0, $fc, 6 | OAMF_XFLIP
	frame_oam -32,  -8, $fe, 6
	frame_oam -32,   0, $fe, 6 | OAMF_XFLIP
	frame_oam -40,   0, $fe, 6 | OAMF_XFLIP
	frame_oam -40,  -8, $fe, 6
	db $80

.frame_13
	frame_oam -16,  -8, $f8, 6
	frame_oam -16,   0, $f8, 6 | OAMF_XFLIP
	frame_oam -32,  -8, $fa, 6
	frame_oam -48,  -8, $fa, 6
	frame_oam -48,   0, $fa, 6 | OAMF_XFLIP
	frame_oam -32,   0, $fa, 6 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16,  -8, $fc, 6
	frame_oam -16,   0, $fc, 6 | OAMF_XFLIP
	frame_oam -32,  -8, $fe, 6
	frame_oam -48,  -8, $fe, 6
	frame_oam -32,   0, $fe, 6 | OAMF_XFLIP
	frame_oam -48,   0, $fe, 6 | OAMF_XFLIP
	frame_oam -56,  -8, $fe, 6
	frame_oam -56,   0, $fe, 6 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -16,  -8, $f8, 6
	frame_oam -16,   0, $f8, 6 | OAMF_XFLIP
	frame_oam -32,  -8, $fa, 6
	frame_oam -48,  -8, $fa, 6
	frame_oam -48,   0, $fa, 6 | OAMF_XFLIP
	frame_oam -32,   0, $fa, 6 | OAMF_XFLIP
	frame_oam -64,  -8, $fa, 6
	frame_oam -64,   0, $fa, 6 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -16,  -8, $fc, 6
	frame_oam -16,   0, $fc, 6 | OAMF_XFLIP
	frame_oam -32,  -8, $fe, 6
	frame_oam -48,  -8, $fe, 6
	frame_oam -32,   0, $fe, 6 | OAMF_XFLIP
	frame_oam -48,   0, $fe, 6 | OAMF_XFLIP
	frame_oam -64,  -8, $fe, 6
	frame_oam -72,  -8, $fe, 6
	frame_oam -64,   0, $fe, 6 | OAMF_XFLIP
	frame_oam -72,   0, $fe, 6 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -16,  -8, $f8, 6
	frame_oam -16,   0, $f8, 6 | OAMF_XFLIP
	frame_oam -32,  -8, $fa, 6
	frame_oam -48,  -8, $fa, 6
	frame_oam -48,   0, $fa, 6 | OAMF_XFLIP
	frame_oam -32,   0, $fa, 6 | OAMF_XFLIP
	frame_oam -64,  -8, $fa, 6
	frame_oam -64,   0, $fa, 6 | OAMF_XFLIP
	frame_oam -80,  -8, $fa, 6
	frame_oam -80,   0, $fa, 6 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -16,  -8, $fc, 6
	frame_oam -16,   0, $fc, 6 | OAMF_XFLIP
	frame_oam -32,  -8, $fe, 6
	frame_oam -48,  -8, $fe, 6
	frame_oam -32,   0, $fe, 6 | OAMF_XFLIP
	frame_oam -48,   0, $fe, 6 | OAMF_XFLIP
	frame_oam -64,  -8, $fe, 6
	frame_oam -80,  -8, $fe, 6
	frame_oam -64,   0, $fe, 6 | OAMF_XFLIP
	frame_oam -80,   0, $fe, 6 | OAMF_XFLIP
	db $80
; 0xbd1b4

Frameset_bd1b4:: ; bd1b4 (2f:51b4)
	db $00,  4
	db $ff
; 0xbd1b7

Frameset_bd1b7:: ; bd1b7 (2f:51b7)
	db $01,  4
	db $ff
; 0xbd1ba

Frameset_bd1ba:: ; bd1ba (2f:51ba)
	db $02,  4
	db $ff
; 0xbd1bd

Frameset_bd1bd:: ; bd1bd (2f:51bd)
	db $03,  4
	db $ff
; 0xbd1c0

Frameset_bd1c0:: ; bd1c0 (2f:51c0)
	db $04,  2
	db $05,  2
	db $ff
; 0xbd1c5

Frameset_bd1c5:: ; bd1c5 (2f:51c5)
	db $06,  4
	db $07,  4
	db $08,  4
	db $06,  4
	db $07,  4
	db $08,  4
	db $06,  4
	db $07,  4
	db $08,  4
	db $06,  4
	db $07,  4
	db $08,  4
	db $06,  4
	db $07,  4
	db $08,  4
	db $09,  2
	db $0a,  2
	db $0b,  2
	db $0c,  2
	db $0d,  2
	db $0e,  2
	db $0f,  2
	db $10,  2
	db $11,  2
	db $12,  2
	db $ff
; 0xbd1f8

Frameset_bd1f8:: ; bd1f8 (2f:51f8)
	db $11,  2
	db $12,  2
	db $ff
; 0xbd1fd

OAM_bd1fd: ; bd1fd (2f:51fd)
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

.frame_0
	frame_oam -24, -13, $00, 7
	frame_oam -24,  -5, $02, 7
	frame_oam  -8, -13, $08, 7
	frame_oam  -8,  -5, $0a, 7
	frame_oam -17, -12, $04, 0
	frame_oam -18,  -4, $06, 0
	frame_oam  -2, -12, $0c, 0
	frame_oam  -2,  -4, $0e, 0
	db $80

.frame_1
	frame_oam -24,  -4, $10, 6
	frame_oam -24,   4, $12, 6
	frame_oam  -8,  -4, $18, 6
	frame_oam  -8,   4, $1a, 6
	frame_oam -17,  -4, $14, 1
	frame_oam -17,   2, $04, 0 | OAMF_XFLIP
	frame_oam -17,   5, $16, 1
	frame_oam  -1,  -3, $1c, 1
	frame_oam  -1,   5, $1e, 1
	db $80

.frame_2
	frame_oam -24,  -4, $10, 6
	frame_oam -24,   4, $12, 6
	frame_oam  -8,  -4, $18, 6
	frame_oam  -8,   4, $1a, 6
	frame_oam -17,  -4, $14, 1
	frame_oam -17,   2, $04, 0 | OAMF_XFLIP
	frame_oam -17,   5, $16, 1
	frame_oam  -1,  -3, $1c, 1
	frame_oam  -1,   5, $1e, 1
	frame_oam -24, -13, $00, 7
	frame_oam -24,  -5, $02, 7
	frame_oam  -8, -13, $08, 7
	frame_oam  -8,  -5, $0a, 7
	frame_oam -17, -12, $04, 0
	frame_oam  -2, -12, $0c, 0
	frame_oam  -2,  -4, $0e, 0
	db $80

.frame_3
	frame_oam -17,  -4, $20, 1
	db $80

.frame_4
	frame_oam -17,  -4, $22, 1
	db $80

.frame_5
	frame_oam -17,  -4, $24, 1
	db $80

.frame_6
	frame_oam -17,  -5, $26, 1
	db $80

.frame_7
	frame_oam  -1,  -7, $2a, 1
	frame_oam -28,  -6, $20, 1 | OAMF_YFLIP
	frame_oam -17,  -4, $24, 1
	db $80

.frame_8
	frame_oam  -1,  -7, $2a, 1
	frame_oam -28,  -6, $20, 1 | OAMF_YFLIP
	frame_oam -17,  -4, $24, 1
	frame_oam   7,  -7, $2a, 1
	frame_oam -39,  -8, $2a, 1 | OAMF_YFLIP
	db $80

.frame_9
	frame_oam  -1,  -7, $2a, 1
	frame_oam -28,  -6, $20, 1 | OAMF_YFLIP
	frame_oam -17,  -4, $24, 1
	frame_oam   7,  -7, $2a, 1
	frame_oam -39,  -8, $2a, 1 | OAMF_YFLIP
	frame_oam -47,  -8, $2a, 1 | OAMF_YFLIP
	db $80

.frame_10
	frame_oam  -1,  -7, $2a, 1
	frame_oam -28,  -6, $20, 1 | OAMF_YFLIP
	frame_oam -17,  -4, $24, 1
	frame_oam -39,  -8, $2a, 1 | OAMF_YFLIP
	frame_oam   7,  -7, $2a, 1
	frame_oam -47,  -8, $2a, 1 | OAMF_YFLIP
	frame_oam -55,  -8, $2a, 1 | OAMF_YFLIP
	db $80

.frame_11
	frame_oam -32,  -8, $28, 1
	frame_oam  -1,  -7, $2c, 1
	frame_oam -17,  -5, $26, 1
	frame_oam -48,  -8, $2c, 1
	db $80

.frame_12
	frame_oam -24,  -4, $10, 6
	frame_oam -24,   4, $12, 6
	frame_oam  -8,  -4, $18, 6
	frame_oam  -8,   4, $1a, 6
	frame_oam -17,  -4, $14, 1
	frame_oam -17,   2, $04, 0 | OAMF_XFLIP
	frame_oam -24, -13, $00, 7
	frame_oam -24,  -5, $02, 7
	frame_oam  -8, -13, $08, 7
	frame_oam  -8,  -5, $0a, 7
	frame_oam -17, -12, $04, 0
	db $80
; 0xbd348

Frameset_bd348: ; bd348 (2f:5348)
	db $00,  4
	db $ff
; 0xbd34b

Frameset_bd34b: ; bd34b (2f:534b)
	db $01,  4
	db $ff
; 0xbd34e

Frameset_bd34e: ; bd34e (2f:534e)
	db $02,  4
	db $ff
; 0xbd351

Frameset_bd351: ; bd351 (2f:5351)
	db $0c,  4
	db $ff
; 0xbd354

Frameset_bd354: ; bd354 (2f:5354)
	db $03,  4
	db $04,  4
	db $05,  4
	db $06,  4
	db $05,  4
	db $04,  4
	db $03,  4
	db $ff
; 0xbd363

Frameset_bd363: ; bd363 (2f:5363)
	db $03,  2
	db $04,  2
	db $05,  2
	db $07,  2
	db $08,  2
	db $09,  2
	db $0a,  2
	db $ff
; 0xbd372

Frameset_bd372: ; bd372 (2f:5372)
	db $0a,  2
	db $0b,  2
	db $ff
; 0xbd377

OAM_bd377: ; bd377 (2f:5377)
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
	frame_oam -16,  -8, $2e, 5
	frame_oam -16,   0, $30, 5
	frame_oam -16,  -8, $32, 6
	frame_oam -16,   0, $34, 6
	db $80

.frame_1
	frame_oam -16,  -7, $38, 4
	frame_oam -16,   1, $3a, 4
	frame_oam   0,  -8, $36, 4
	frame_oam   0,   0, $36, 4 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam   0,  -8, $36, 4
	frame_oam   0,   0, $36, 4 | OAMF_XFLIP
	frame_oam -16,  -9, $3c, 4
	frame_oam -16,  -1, $3e, 4
	db $80

.frame_3
	frame_oam   0,  -8, $36, 4
	frame_oam   0,   0, $36, 4 | OAMF_XFLIP
	frame_oam -16, -14, $40, 4
	frame_oam -16,  -6, $42, 4
	frame_oam -16,   2, $44, 4
	db $80

.frame_4
	frame_oam   0,  -8, $36, 4
	frame_oam   0,   0, $36, 4 | OAMF_XFLIP
	frame_oam -16, -17, $46, 4
	frame_oam -16,  -9, $48, 4
	frame_oam -16,  -1, $4a, 4
	frame_oam -16,   7, $4c, 4
	db $80

.frame_5
	frame_oam   0,  -7, $36, 4
	frame_oam   0,  -1, $36, 4 | OAMF_XFLIP
	frame_oam -18, -21, $4e, 4
	frame_oam -18, -13, $50, 4
	frame_oam -16,  -5, $52, 4
	frame_oam -16,   3, $54, 4
	frame_oam -16,  11, $56, 4
	db $80

.frame_6
	frame_oam -20, -17, $58, 4
	frame_oam -20,  -9, $5a, 4
	frame_oam -19,  -1, $5c, 4
	frame_oam -19,   7, $5e, 4
	db $80

.frame_7
	frame_oam -19, -17, $60, 4
	frame_oam -19,  -9, $62, 4
	frame_oam -19,  -1, $64, 4
	frame_oam -19,   7, $66, 4
	db $80

.frame_8
	frame_oam -20, -17, $68, 4
	frame_oam -20,  -9, $6a, 4
	frame_oam -19,  -1, $6c, 4
	frame_oam -19,   7, $6e, 4
	db $80
; 0xbd43a

Frameset_bd43a:: ; bd43a (2f:543a)
	db $00,  4
	db $ff
; 0xbd43d

Frameset_bd43d:: ; bd43d (2f:543d)
	db $01,  4
	db $02,  4
	db $03,  4
	db $04,  4
	db $05,  4
	db $06,  4
	db $ff
; 0xbd44a

Frameset_bd44a:: ; bd44a (2f:544a)
	db $06,  8
	db $07,  8
	db $06,  8
	db $08,  8
	db $ff
; 0xbd453

OAM_bd453: ; bd453 (2f:5453)
	dw .frame_0
	dw .frame_1

.frame_0
	frame_oam -46,  -5, $9a, 4
	frame_oam -46,   3, $9c, 4
	db $80

.frame_1
	frame_oam -46,  -3, $9a, 5 | OAMF_XFLIP
	frame_oam -46, -11, $9c, 5 | OAMF_XFLIP
	db $80
; 0xbd469

Frameset_bd469:: ; bd469 (2f:5469)
	db $00,  4
	db $ff
; 0xbd46c

Frameset_bd46c:: ; bd46c (2f:546c)
	db $01,  4
	db $ff
; 0xbd46f

OAM_bd46f: ; bd46f (2f:546f)
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
	frame_oam -29,  -4, $8e, 7
	frame_oam -32, -12, $7e, 1
	frame_oam -16, -12, $80, 1
	frame_oam -45,  -4, $82, 1
	frame_oam  -3,  -4, $84, 1
	frame_oam -32,   4, $7e, 1 | OAMF_XFLIP
	frame_oam -16,   4, $80, 1 | OAMF_XFLIP
	frame_oam -35,  -8, $7a, 2
	frame_oam -19,  -8, $7c, 3
	frame_oam -35,   0, $7a, 2 | OAMF_XFLIP
	frame_oam -19,   0, $7c, 3 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -32, -12, $7e, 5
	frame_oam -16, -12, $80, 5
	frame_oam -45,  -4, $82, 5
	frame_oam  -3,  -4, $84, 5
	frame_oam -32,   4, $7e, 5 | OAMF_XFLIP
	frame_oam -16,   4, $80, 5 | OAMF_XFLIP
	frame_oam -35,  -8, $7a, 3
	frame_oam -19,  -8, $7c, 4
	frame_oam -35,   0, $7a, 3 | OAMF_XFLIP
	frame_oam -19,   0, $7c, 4 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -32, -12, $7e, 5
	frame_oam -16, -12, $80, 5
	frame_oam -45,  -4, $82, 6
	frame_oam  -3,  -4, $84, 6
	frame_oam -32,   4, $7e, 5 | OAMF_XFLIP
	frame_oam -16,   4, $80, 5 | OAMF_XFLIP
	frame_oam -35,  -8, $7a, 6
	frame_oam -19,  -8, $7c, 6
	frame_oam -35,   0, $7a, 6 | OAMF_XFLIP
	frame_oam -19,   0, $7c, 6 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -32, -12, $86, 6
	frame_oam -32,  -4, $88, 6
	frame_oam -16, -12, $86, 6 | OAMF_YFLIP
	frame_oam -16,  -4, $88, 6 | OAMF_YFLIP
	frame_oam -32,   4, $86, 6 | OAMF_XFLIP
	frame_oam -16,   4, $86, 6 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_4
	frame_oam -32, -12, $8a, 6
	frame_oam -16, -12, $8a, 6 | OAMF_YFLIP
	frame_oam -32,   4, $8a, 6
	frame_oam -16,   4, $8a, 6 | OAMF_YFLIP
	db $80

.frame_5
	frame_oam -32, -12, $8c, 6
	frame_oam -16, -12, $8c, 6 | OAMF_YFLIP
	frame_oam -32,   4, $8c, 6 | OAMF_XFLIP
	frame_oam -16,   4, $8c, 6 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_6
	frame_oam -28,  -5, $90, 7
	frame_oam -16,  -8, $78, 1
	db $80

.frame_7
	frame_oam -28,  -5, $92, 7
	frame_oam -15,  -8, $78, 1
	db $80

.frame_8
	frame_oam  -7,  -8, $96, 7
	frame_oam -28,  -5, $94, 7
	frame_oam -16,  -8, $78, 1
	db $80

.frame_9
	frame_oam -28,  -5, $92, 7 | OAMF_YFLIP
	frame_oam -15,  -8, $78, 1
	db $80

.frame_10
	frame_oam -16,  -8, $78, 1
	frame_oam -28,  -5, $98, 4
	db $80

.frame_11
	frame_oam -15,  -8, $78, 1
	frame_oam -28,  -5, $98, 4
	db $80

.frame_12
	frame_oam -16,  -8, $70, 0
	frame_oam -11,  -3, $76, 0
	db $80

.frame_13
	frame_oam -16,  -8, $72, 0
	frame_oam -11,  -3, $74, 0
	db $80

.frame_14
	frame_oam -16,  -8, $74, 0
	frame_oam -11,  -3, $72, 0
	db $80

.frame_15
	frame_oam -16,  -8, $76, 0
	frame_oam -11,  -3, $70, 0
	db $80

.frame_16
	frame_oam -16,  -8, $70, 0
	db $80

.frame_17
	frame_oam -16,  -8, $72, 0
	db $80

.frame_18
	frame_oam -16,  -8, $74, 0
	db $80

.frame_19
	frame_oam -16,  -8, $76, 0
	db $80
; 0xbd5c3

Frameset_bd5c3: ; bd5c3 (2f:55c3)
	db $10,  4
	db $11,  4
	db $12,  4
	db $13,  4
	db $ff
; 0xbd5cc

Frameset_bd5cc: ; bd5cc (2f:55cc)
	db $0c,  4
	db $0d,  4
	db $0e,  4
	db $0f,  4
	db $ff
; 0xbd5d5

Frameset_bd5d5: ; bd5d5 (2f:55d5)
	db $0a,  4
	db $ff
; 0xbd5d8

Frameset_bd5d8: ; bd5d8 (2f:55d8)
	db $0a,  4
	db $0b,  4
	db $ff
; 0xbd5dd

Frameset_bd5dd: ; bd5dd (2f:55dd)
	db $06,  4
	db $07,  4
	db $08,  4
	db $09,  4
	db $ff
; 0xbd5e6

Frameset_bd5e6: ; bd5e6 (2f:55e6)
	db $02,  4
	db $01,  2
	db $00,  2
	db $01,  2
	db $02,  2
	db $01,  2
	db $00,  2
	db $01,  2
	db $02, 10
	db $01,  2
	db $00,  2
	db $01,  2
	db $02, 10
	db $01,  4
	db $00,  4
	db $ff
; 0xbd605

Frameset_bd605: ; bd605 (2f:5605)
	db $00,  4
	db $ff
; 0xbd608

Frameset_bd608: ; bd608 (2f:5608)
	db $03,  4
	db $04,  4
	db $05,  4
	db $ff
; 0xbd60f

Frameset_bd60f: ; bd60f (2f:560f)
	db $02,  4
	db $ff
; 0xbd612

Frameset_bd612: ; bd612 (2f:5612)
	db $03,  4
	db $ff
; 0xbd615

OAM_bd615:: ; bd615 (2f:5615)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4

.frame_0
	frame_oam -15,  -8, $3a, 5
	frame_oam -15,   0, $3c, 5
	frame_oam -57,  -8, $2a, 2
	frame_oam -57,   0, $2a, 2 | OAMF_XFLIP
	frame_oam -41, -12, $2c, 5
	frame_oam -41,  -4, $2e, 5
	frame_oam -41,   4, $30, 5
	frame_oam -41,   0, $32, 6
	frame_oam -25, -12, $34, 7
	frame_oam -25,  -4, $36, 7
	frame_oam -25,   4, $34, 7 | OAMF_XFLIP
	frame_oam -25,  -2, $38, 4
	frame_oam -20,  -2, $3e, 6
	frame_oam -20, -10, $40, 2
	frame_oam -20,   2, $40, 2 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -15,  -8, $3a, 5
	frame_oam -15,   0, $3c, 5
	frame_oam -57,  -8, $2a, 2
	frame_oam -57,   0, $2a, 2 | OAMF_XFLIP
	frame_oam -41, -12, $2c, 5
	frame_oam -41,  -4, $2e, 5
	frame_oam -41,   4, $30, 5
	frame_oam -41,   0, $32, 6
	frame_oam -25, -12, $34, 7
	frame_oam -25,  -4, $36, 7
	frame_oam -25,   4, $34, 7 | OAMF_XFLIP
	frame_oam -25,  -2, $38, 4
	frame_oam -20,  -2, $3e, 6
	frame_oam -20, -10, $40, 2
	frame_oam -20,   2, $40, 2 | OAMF_XFLIP
	frame_oam -37,  -4, $4e, 1
	frame_oam -28, -12, $42, 3
	frame_oam -28,  -4, $44, 3
	frame_oam -28,   4, $42, 3 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -15,  -8, $3a, 5
	frame_oam -15,   0, $3c, 5
	frame_oam -57,  -8, $2a, 2
	frame_oam -57,   0, $2a, 2 | OAMF_XFLIP
	frame_oam -41, -12, $2c, 5
	frame_oam -41,  -4, $2e, 5
	frame_oam -41,   4, $30, 5
	frame_oam -41,   0, $32, 6
	frame_oam -25, -12, $34, 7
	frame_oam -25,  -4, $36, 7
	frame_oam -25,   4, $34, 7 | OAMF_XFLIP
	frame_oam -25,  -2, $38, 4
	frame_oam -20,  -2, $3e, 6
	frame_oam -20, -10, $40, 2
	frame_oam -20,   2, $40, 2 | OAMF_XFLIP
	frame_oam -37,  -4, $50, 1
	frame_oam -28, -12, $46, 3
	frame_oam -28,  -4, $48, 3
	frame_oam -28,   4, $46, 3 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -15,  -8, $3a, 5
	frame_oam -15,   0, $3c, 5
	frame_oam -57,  -8, $2a, 2
	frame_oam -57,   0, $2a, 2 | OAMF_XFLIP
	frame_oam -41, -12, $2c, 5
	frame_oam -41,  -4, $2e, 5
	frame_oam -41,   4, $30, 5
	frame_oam -41,   0, $32, 6
	frame_oam -25, -12, $34, 7
	frame_oam -25,  -4, $36, 7
	frame_oam -25,   4, $34, 7 | OAMF_XFLIP
	frame_oam -25,  -2, $38, 4
	frame_oam -20,  -2, $3e, 6
	frame_oam -20, -10, $40, 2
	frame_oam -20,   2, $40, 2 | OAMF_XFLIP
	frame_oam -37,  -4, $4e, 1
	frame_oam -28, -12, $4a, 3
	frame_oam -28,  -4, $4c, 3
	frame_oam -28,   4, $4a, 3 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -15,  -8, $3a, 5
	frame_oam -15,   0, $3c, 5
	frame_oam -57,  -8, $2a, 2
	frame_oam -57,   0, $2a, 2 | OAMF_XFLIP
	frame_oam -41, -12, $2c, 5
	frame_oam -41,  -4, $2e, 5
	frame_oam -41,   4, $30, 5
	frame_oam -41,   0, $32, 6
	frame_oam -25, -12, $34, 7
	frame_oam -25,  -4, $36, 7
	frame_oam -25,   4, $34, 7 | OAMF_XFLIP
	frame_oam -25,  -2, $38, 4
	frame_oam -20,  -2, $3e, 6
	frame_oam -20, -10, $40, 2
	frame_oam -20,   2, $40, 2 | OAMF_XFLIP
	frame_oam -37,  -4, $50, 1
	frame_oam -28, -12, $4a, 3
	frame_oam -28,  -4, $4c, 3
	frame_oam -28,   4, $4a, 3 | OAMF_XFLIP
	db $80
; 0xbd790

Frameset_bd790:: ; bd790 (2f:5790)
	db $00,  4
	db $ff
; 0xbd793

Frameset_bd793:: ; bd793 (2f:5793)
	db $01,  4
	db $02,  4
	db $03,  4
	db $04,  4
	db $ff
; 0xbd79c

Frameset_bd79c:: ; bd79c (2f:579c)
	db $03,  4
	db $04,  4
	db $ff

OAM_bd7a1:: ; bd7a1 (2f:57a1)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3

.frame_0
	frame_oam -67, -13, $9e, 5
	frame_oam -69, -27, $a0, 1
	frame_oam -69, -19, $a2, 1
	frame_oam -69, -11, $a4, 1
	frame_oam -53, -27, $a8, 1
	frame_oam -53, -19, $aa, 1
	frame_oam -53, -11, $ac, 1
	frame_oam -37, -27, $ae, 4
	frame_oam -37, -19, $b0, 4
	frame_oam -37, -11, $b2, 4
	frame_oam -53, -32, $a6, 4
	frame_oam -69,   5, $a0, 1 | OAMF_XFLIP
	frame_oam -69,  -3, $a2, 1 | OAMF_XFLIP
	frame_oam -53,   5, $a8, 1 | OAMF_XFLIP
	frame_oam -53,  -3, $aa, 1 | OAMF_XFLIP
	frame_oam -37,   5, $ae, 4 | OAMF_XFLIP
	frame_oam -37,  -3, $b0, 4 | OAMF_XFLIP
	frame_oam -53,  10, $a6, 4 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -49,  33, $d6, 5
	frame_oam -54,  28, $d2, 3
	frame_oam -54,  36, $d4, 3
	frame_oam -49,  28, $c6, 4
	frame_oam -45,  12, $c2, 4
	frame_oam -40,  20, $c4, 4
	frame_oam -45,  20, $b4, 1
	frame_oam -53,  28, $b4, 1
	frame_oam -68,  28, $c8, 4
	frame_oam -73,  36, $ca, 4
	frame_oam -57,  36, $cc, 4
	frame_oam -62,  44, $ce, 4
	frame_oam -65,  52, $d0, 4
	frame_oam -70,  25, $b6, 1
	frame_oam -79,  33, $b8, 1
	frame_oam -74,  41, $ba, 1
	frame_oam -63,  33, $bc, 1
	frame_oam -58,  41, $be, 1
	frame_oam -64,  49, $c0, 1
	frame_oam -70,  48, $dc, 7
	frame_oam -75,  48, $da, 6
	frame_oam -19,  -2, $c6, 4
	frame_oam -78,  40, $d8, 6
	frame_oam -23,  -2, $b4, 1
	db $80

.frame_2
	frame_oam -22,  23, $06, 0
	frame_oam -30,  13, $fc, 7
	frame_oam -30,  21, $fe, 7
	frame_oam -30,  29, $00, 7
	frame_oam -14,  21, $02, 7
	frame_oam -14,  29, $04, 7
	frame_oam -20,  16, $c6, 4
	frame_oam -16,   0, $c2, 4
	frame_oam -11,   8, $c4, 4
	frame_oam -16,   8, $b4, 1
	frame_oam -24,  16, $b4, 1
	frame_oam -64,  14, $de, 6
	frame_oam -48,  14, $e0, 6
	frame_oam -56,  22, $e2, 6
	frame_oam -40,  22, $e4, 6
	frame_oam -56,  30, $e6, 6
	frame_oam -46,  30, $e8, 6
	frame_oam -30,  30, $ea, 6
	frame_oam -56,  38, $ec, 6
	frame_oam -40,  38, $ee, 6
	frame_oam -24,  38, $f0, 6
	frame_oam -53,  46, $f2, 6
	frame_oam -29,  46, $f4, 6
	frame_oam -56,  54, $f6, 6
	frame_oam -48,  54, $f8, 6
	frame_oam -32,  54, $fa, 6
	db $80

.frame_3
	frame_oam -75,  30, $2a, 1 | OAMF_BANK1
	frame_oam -75,  38, $2c, 1 | OAMF_BANK1
	frame_oam -75,  46, $2e, 1 | OAMF_BANK1
	frame_oam -75,  54, $30, 1 | OAMF_BANK1
	frame_oam -59,  30, $32, 7 | OAMF_BANK1
	frame_oam -59,  38, $34, 6 | OAMF_BANK1
	frame_oam -67,  38, $3e, 1 | OAMF_BANK1
	frame_oam -59,  46, $36, 1 | OAMF_BANK1
	frame_oam -59,  54, $38, 1 | OAMF_BANK1
	frame_oam -66,  43, $3a, 5 | OAMF_BANK1
	frame_oam -51,  38, $3c, 7 | OAMF_BANK1
	frame_oam -49,  28, $c6, 4
	frame_oam -45,  12, $c2, 4
	frame_oam -40,  20, $c4, 4
	frame_oam -45,  20, $b4, 1
	frame_oam -53,  28, $b4, 1
	frame_oam -19,  -2, $c6, 4
	frame_oam -23,  -2, $b4, 1
	db $80

Frameset_bd905:: ; bd905 (2f:5905)
	db $00,  4
	db $ff
; 0xbd908

Frameset_bd908:: ; bd908 (2f:5908)
	db $01,  4
	db $ff
; 0xbd90b

Frameset_bd90b:: ; bd90b (2f:590b)
	db $02,  4
	db $ff
; 0xbd90e

Frameset_bd90e:: ; bd90e (2f:590e)
	db $03,  4
	db $ff
; 0xbd911

OAM_bd911:: ; bd911 (2f:5911)
	dw .frame_0
	dw .frame_1

.frame_0
	frame_oam -48, -15, $00, 6
	frame_oam -32, -15, $02, 6
	frame_oam -42,  -7, $04, 6
	frame_oam -26,  -7, $06, 6
	frame_oam -48,   1, $08, 6
	frame_oam -32,   1, $0a, 6
	frame_oam -40,   9, $0c, 6
	frame_oam -24, -13, $10, 0
	frame_oam -40, -13, $0e, 7
	frame_oam -32,  -5, $12, 1
	frame_oam -43,  -3, $14, 7
	frame_oam -40,   5, $16, 7
	db $80

.frame_1
	frame_oam -32,   0, $18, 0
	frame_oam -32,   8, $1a, 5
	frame_oam -16, -16, $1c, 6
	frame_oam -16,  -8, $1e, 5
	frame_oam -16,   0, $20, 5
	frame_oam -16,   8, $22, 5
	frame_oam -19,  -8, $24, 3
	frame_oam -22,   1, $26, 4
	frame_oam -24,   8, $28, 3
	db $80
; 0xbd96b

Frameset_bd96b:: ; bd96b (2f:596b)
	db $00,  4
	db $ff
; 0xbd96e

Frameset_bd96e:: ; bd96e (2f:596e)
	db $01,  4
	db $ff
; 0xbd971

OAM_bd971: ; bd971 (2f:5971)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4

.frame_0
	frame_oam -16,  -8, $70, 4
	frame_oam -16,   0, $72, 4
	db $80

.frame_1
	frame_oam -22, -10, $74, 1
	frame_oam -22,  -2, $76, 1
	frame_oam -22,   6, $78, 1
	frame_oam  -6, -10, $7a, 1
	frame_oam  -6,  -2, $7c, 1
	db $80

.frame_2
	frame_oam -22, -10, $74, 6
	frame_oam -22,  -2, $76, 6
	frame_oam -22,   6, $78, 6
	frame_oam  -6, -10, $7a, 6
	frame_oam  -6,  -2, $7c, 6
	frame_oam -19,  -8, $8a, 5
	frame_oam -19,   0, $8c, 5
	db $80

.frame_3
	frame_oam -22, -10, $74, 3
	frame_oam -22,  -2, $76, 3
	frame_oam -22,   6, $78, 3
	frame_oam  -6, -10, $7a, 3
	frame_oam  -6,  -2, $7c, 3
	frame_oam -19,  -8, $8a, 5
	frame_oam -19,   0, $8c, 5
	db $80

.frame_4
	frame_oam -23, -12, $7e, 2
	frame_oam -23,  -4, $80, 2
	frame_oam -23,   4, $82, 2
	frame_oam  -7, -12, $84, 2
	frame_oam  -7,  -4, $86, 2
	frame_oam  -7,   4, $88, 2
	db $80
; 0xbd9ec

Frameset_bd9ec: ; bd9ec (2f:59ec)
	db $01,  4
	db $02,  4
	db $03,  4
	db $02,  4
	db $ff
; 0xbd9f5

Frameset_bd9f5: ; bd9f5 (2f:59f5)
	db $00,  4
	db $ff
; 0xbd9f8

Frameset_bd9f8: ; bd9f8 (2f:59f8)
	db $04,  4
	db $ff
; 0xbd9fb

Frameset_bd9fb: ; bd9fb (2f:59fb)
	db $01,  4
	db $ff
; 0xbd9fe

Frameset_bd9fe: ; bd9fe (2f:59fe)
	db $03,  4
	db $ff
; 0xbda01

OAM_bda01:: ; bda01 (2f:5a01)
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

.frame_0
	frame_oam   0,  -8, $98, 2
	frame_oam -16,  -8, $8e, 2
	db $80

.frame_1
	frame_oam   0,  -8, $98, 2
	frame_oam -16,  -8, $90, 2
	db $80

.frame_2
	frame_oam   0,  -8, $98, 2
	frame_oam -16,  -8, $92, 2
	db $80

.frame_3
	frame_oam   0,  -8, $98, 2
	frame_oam -16,  -8, $94, 2
	db $80

.frame_4
	frame_oam   0,  -8, $98, 2
	frame_oam -16,  -8, $96, 2
	db $80

.frame_5
	frame_oam -26,  -7, $9a, 1
	frame_oam   0,  -8, $98, 2
	frame_oam -16,  -8, $96, 2
	db $80

.frame_6
	frame_oam -26,  -7, $9c, 1
	frame_oam   0,  -8, $98, 2
	frame_oam -16,  -8, $96, 2
	db $80

.frame_7
	frame_oam -26,  -7, $9e, 1
	frame_oam -26,   1, $a0, 1
	frame_oam   0,  -8, $98, 2
	frame_oam -16,  -8, $96, 2
	db $80

.frame_8
	frame_oam -26,  -7, $9e, 1
	frame_oam   0,  -8, $98, 2
	frame_oam -16,  -8, $96, 2
	frame_oam -26,   1, $a2, 1
	db $80

.frame_9
	frame_oam -26,  -7, $9e, 1
	frame_oam   0,  -8, $98, 2
	frame_oam -16,  -8, $96, 2
	frame_oam -26,   1, $a4, 1
	db $80

.frame_10
	frame_oam -26,  -7, $a6, 1
	frame_oam -26,   1, $a8, 1
	frame_oam   0,  -8, $98, 2
	frame_oam -16,  -8, $96, 2
	db $80
; 0xbdaa2

Frameset_bdaa2:: ; bdaa2 (2f:5aa2)
	db $00,  4
	db $01,  4
	db $02,  4
	db $03,  4
	db $04, 50
	db $05,  4
	db $06,  4
	db $07,  4
	db $08,  4
	db $09,  4
	db $0a, 50
	db $ff
; 0xbdab9

Frameset_bdab9:: ; bdab9 (2f:5ab9)
	db $0a,  4
	db $ff
; 0xbdabc

OAM_bdabc:: ; bdabc (2f:5abc)
	dw .frame_0

.frame_0
	frame_oam -29,  41, $66, 0
	frame_oam -60,   9, $66, 0
	frame_oam  27,   5, $8e, 1
	frame_oam  27,  13, $90, 1
	frame_oam -59,  16, $52, 7
	frame_oam -67,  24, $54, 7
	frame_oam -59,  32, $56, 7
	frame_oam -59,  40, $58, 7
	frame_oam -43,  16, $5a, 7
	frame_oam -43,  24, $5c, 7
	frame_oam -43,  32, $5e, 7
	frame_oam -43,  40, $60, 7
	frame_oam -51,  24, $62, 5
	frame_oam -51,  32, $64, 5
	frame_oam -17,   1, $6c, 6
	frame_oam -10,  -4, $68, 0
	frame_oam -10,   4, $6a, 0
	db $80
; 0xbdb03

Frameset_bdb03:: ; bdb03 (2f:5b03)
	db $00,  4
	db $ff
; 0xbdb06

OAM_bdb06:: ; bdb06 (2f:5b06)
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
	frame_oam -32,  -1, $6e, 5
	frame_oam -32,   7, $70, 5
	frame_oam -32,  15, $72, 5
	frame_oam -16,  -5, $74, 5
	frame_oam -16,   3, $76, 5
	frame_oam -42,   6, $7a, 2
	frame_oam -42,  14, $7c, 2
	frame_oam -42,  22, $7e, 2
	frame_oam -49,  10, $80, 1
	frame_oam -49,  18, $82, 1
	frame_oam -57,  14, $84, 3
	frame_oam -57,  22, $86, 3
	frame_oam -56,  18, $78, 5
	frame_oam -48,   8, $88, 4
	frame_oam -48,  16, $8a, 4
	frame_oam -32,   0, $8c, 4
	frame_oam -32,   8, $8e, 4
	frame_oam -16,  -8, $90, 4
	frame_oam -16,   0, $92, 4
	db $80

.frame_1
	frame_oam -16,  -8, $94, 1
	frame_oam -16,   0, $96, 1
	frame_oam  -5,  -8, $9c, 4
	db $80

.frame_2
	frame_oam -18,  -8, $94, 1
	frame_oam -18,   0, $96, 1
	frame_oam  -7,  -8, $9c, 4
	db $80

.frame_3
	frame_oam -20,  -8, $94, 1
	frame_oam -20,   0, $96, 1
	frame_oam  -9,  -8, $9c, 4
	db $80

.frame_4
	frame_oam -21,  -8, $94, 1
	frame_oam -21,   0, $96, 1
	frame_oam -10,  -8, $9c, 4
	db $80

.frame_5
	frame_oam -14,  -8, $94, 1
	frame_oam -14,   0, $96, 1
	frame_oam  -3,  -8, $9c, 4
	db $80

.frame_6
	frame_oam -12,  -8, $94, 1
	frame_oam -12,   0, $96, 1
	frame_oam  -1,  -8, $9c, 4
	db $80

.frame_7
	frame_oam -11,  -8, $94, 1
	frame_oam -11,   0, $96, 1
	frame_oam   0,  -8, $9c, 4
	db $80

.frame_8
	frame_oam -16,  -8, $94, 5
	frame_oam -16,   0, $98, 5
	frame_oam -16,   8, $9a, 5
	frame_oam  -5,  -8, $9c, 4
	frame_oam  -5,   3, $9c, 4
	db $80

.frame_9
	frame_oam -18,  -8, $94, 5
	frame_oam -18,   0, $98, 5
	frame_oam -18,   8, $9a, 5
	frame_oam  -7,  -8, $9c, 4
	frame_oam  -7,   3, $9c, 4
	db $80

.frame_10
	frame_oam -20,  -8, $94, 5
	frame_oam -20,   0, $98, 5
	frame_oam -20,   8, $9a, 5
	frame_oam  -9,  -8, $9c, 4
	frame_oam  -9,   3, $9c, 4
	db $80

.frame_11
	frame_oam -21,  -8, $94, 5
	frame_oam -21,   0, $98, 5
	frame_oam -21,   8, $9a, 5
	frame_oam -10,  -8, $9c, 4
	frame_oam -10,   3, $9c, 4
	db $80

.frame_12
	frame_oam -14,  -8, $94, 5
	frame_oam -14,   0, $98, 5
	frame_oam -14,   8, $9a, 5
	frame_oam  -3,  -8, $9c, 4
	frame_oam  -3,   3, $9c, 4
	db $80

.frame_13
	frame_oam -12,  -8, $94, 5
	frame_oam -12,   0, $98, 5
	frame_oam -12,   8, $9a, 5
	frame_oam  -1,  -8, $9c, 4
	frame_oam  -1,   3, $9c, 4
	db $80

.frame_14
	frame_oam -11,  -8, $94, 5
	frame_oam -11,   0, $98, 5
	frame_oam -11,   8, $9a, 5
	frame_oam   0,  -8, $9c, 4
	frame_oam   0,   3, $9c, 4
	db $80
; 0xbdc5f

Frameset_bdc5f:: ; bdc5f (2f:5c5f)
	db $00,  4
	db $ff
; 0xbdc62

Frameset_bdc62:: ; bdc62 (2f:5c62)
	db $01,  4
	db $02,  4
	db $03,  4
	db $04,  4
	db $04,  4
	db $03,  4
	db $02,  4
	db $01,  4
	db $05,  4
	db $06,  4
	db $07,  4
	db $07,  4
	db $06,  4
	db $05,  4
	db $ff
; 0xbdc7f

Frameset_bdc7f:: ; bdc7f (2f:5c7f)
	db $08,  4
	db $09,  4
	db $0a,  4
	db $0b,  4
	db $0b,  4
	db $0a,  4
	db $09,  4
	db $08,  4
	db $0c,  4
	db $0d,  4
	db $0e,  4
	db $0e,  4
	db $0d,  4
	db $0c,  4
	db $ff
; 0xbdc9c

OAM_bdc9c:: ; bdc9c (2f:5c9c)
	dw .frame_0

.frame_0
	frame_oam -77, -15, $9e, 4
	frame_oam -77,  -7, $a0, 4
	frame_oam -77,   1, $a2, 4
	frame_oam -61, -17, $a4, 4
	frame_oam -61,  -9, $a6, 7
	frame_oam -61,  -1, $a8, 7
	frame_oam -61,   7, $aa, 4
	frame_oam -61,  15, $ac, 4
	frame_oam -45,  -9, $ae, 5
	frame_oam -45,  -1, $b0, 5
	frame_oam -45,   7, $b2, 5
	frame_oam -45,  15, $b4, 5
	frame_oam -77, -15, $b6, 1
	frame_oam -77,  -7, $b8, 1
	frame_oam -77,   1, $ba, 1
	frame_oam -59,  -2, $bc, 1
	frame_oam -52,  13, $bc, 1
	db $80
; 0xbdce3

Frameset_bdce3:: ; bdce3 (2f:5ce3)
	db $00,  4
	db $ff
; 0xbdce6

OAM_bdce6: ; bdce6 (2f:5ce6)
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
	frame_oam -16, -21, $00, 7
	frame_oam -16, -13, $02, 7
	frame_oam -16,  13, $00, 7 | OAMF_XFLIP
	frame_oam -16,   5, $02, 7 | OAMF_XFLIP
	frame_oam -16, -17, $04, 6
	frame_oam -16,   9, $04, 6 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -16, -21, $00, 5
	frame_oam -16, -13, $02, 5
	frame_oam -16,  13, $00, 5 | OAMF_XFLIP
	frame_oam -16,   5, $02, 5 | OAMF_XFLIP
	frame_oam -16, -17, $04, 4
	frame_oam -16,   9, $04, 4 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -16, -21, $00, 3
	frame_oam -16, -13, $02, 3
	frame_oam -16,  13, $00, 3 | OAMF_XFLIP
	frame_oam -16,   5, $02, 3 | OAMF_XFLIP
	frame_oam -16, -17, $04, 2
	frame_oam -16,   9, $04, 2 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -16, -21, $0e, 1
	frame_oam -16, -13, $10, 1
	frame_oam -16,  13, $0e, 1 | OAMF_XFLIP
	frame_oam -16,   5, $10, 1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -16, -21, $00, 1
	frame_oam -16, -13, $02, 1
	frame_oam -16,  13, $00, 1 | OAMF_XFLIP
	frame_oam -16,   5, $02, 1 | OAMF_XFLIP
	frame_oam -16, -17, $04, 1
	frame_oam -16,   9, $04, 1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -24, -32, $06, 6
	frame_oam -32, -24, $08, 6
	frame_oam -16, -24, $0a, 6
	frame_oam -16, -16, $0c, 6
	db $80

.frame_6
	frame_oam -16, -21, $00, 7
	frame_oam -16, -13, $02, 7
	frame_oam -16, -17, $04, 6
	db $80

.frame_7
	frame_oam -16,  13, $00, 7 | OAMF_XFLIP
	frame_oam -16,   5, $02, 7 | OAMF_XFLIP
	frame_oam -16,   9, $04, 6 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -24,  24, $06, 6 | OAMF_XFLIP
	frame_oam -32,  16, $08, 6 | OAMF_XFLIP
	frame_oam -16,  16, $0a, 6 | OAMF_XFLIP
	frame_oam -16,   8, $0c, 6 | OAMF_XFLIP
	db $80
; 0xbdda9

Frameset_bdda9: ; bdda9 (2f:5da9)
	db $00, 50
	db $01,  6
	db $02,  6
	db $03,  4
	db $04,  4
	db $03,  4
	db $04,  4
	db $03,  4
	db $04,  4
	db $02,  6
	db $01,  6
	db $ff
; 0xbddc0

Frameset_bddc0: ; bddc0 (2f:5dc0)
	db $05,  4
	db $ff
; 0xbddc3

Frameset_bddc3: ; bddc3 (2f:5dc3)
	db $06,  4
	db $ff
; 0xbddc6

Frameset_bddc6: ; bddc6 (2f:5dc6)
	db $07,  4
	db $ff
; 0xbddc9

Frameset_bddc9: ; bddc9 (2f:5dc9)
	db $08,  4
	db $ff
; 0xbddcc

Frameset_bddcc: ; bddcc (2f:5dcc)
	db $00,  4
	db $ff
; 0xbddcf

OAM_bddcf:: ; bddcf (2f:5dcf)
	dw .frame_0
	dw .frame_1
	dw .frame_2

.frame_0
	frame_oam -32, -16, $36, 3
	frame_oam -29,  -8, $38, 1
	frame_oam -29,   0, $3a, 1
	frame_oam -32,   8, $3c, 1
	frame_oam -32,  16, $3e, 3
	frame_oam -16, -16, $40, 1
	frame_oam -13,  -8, $42, 1
	frame_oam -13,   0, $44, 1
	frame_oam -16,   8, $46, 1
	frame_oam -16,  16, $48, 1
	frame_oam   0, -24, $4a, 3
	frame_oam   0, -16, $4c, 3
	frame_oam   3,  -8, $4e, 3
	frame_oam   3,   0, $50, 1
	frame_oam   0,   8, $52, 3
	db $80

.frame_1
	frame_oam -32, -16, $36, 3
	frame_oam -29,  -8, $38, 1
	frame_oam -29,   0, $3a, 1
	frame_oam -32,   8, $3c, 1
	frame_oam -32,  16, $3e, 3
	frame_oam -16, -16, $54, 1
	frame_oam -13,  -8, $56, 1
	frame_oam -13,   0, $58, 1
	frame_oam -16,   8, $5a, 1
	frame_oam -16,  16, $48, 1
	db $80

.frame_2
	frame_oam   0, -24, $4a, 3
	frame_oam   0, -16, $4c, 3
	frame_oam   3,  -8, $4e, 3
	frame_oam   3,   0, $50, 1
	frame_oam   0,   8, $52, 3
	frame_oam -16, -16, $5c, 1
	frame_oam -13,  -8, $5e, 1
	frame_oam -13,   0, $60, 1
	frame_oam -16,   8, $62, 1
	db $80
; 0xbde60

Frameset_bde60:: ; bde60 (2f:5e60)
	db $00,  4
	db $ff
; 0xbde63

Frameset_bde63:: ; bde63 (2f:5e63)
	db $01,  4
	db $ff
; 0xbde66

Frameset_bde66:: ; bde66 (2f:5e66)
	db $02,  4
	db $ff
; 0xbde69

OAM_bde69: ; bde69 (2f:5e69)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6

.frame_0
	frame_oam -24, -16, $b2, 3
	frame_oam -24,  -8, $b4, 3
	frame_oam -24,   0, $b6, 3
	frame_oam -24,   8, $b8, 3
	frame_oam -16, -16, $b2, 3
	frame_oam -16,  -8, $b4, 3
	frame_oam -16,   0, $b6, 3
	frame_oam -16,   8, $b8, 3
	db $80

.frame_1
	frame_oam -16, -24, $ba, 6
	frame_oam -16, -16, $bc, 6
	frame_oam -16,  -8, $be, 6
	frame_oam -16,  -2, $ba, 6
	frame_oam -16,   6, $bc, 6
	frame_oam -16,  14, $be, 6
	frame_oam -16, -46, $ba, 6
	frame_oam -16, -38, $bc, 6
	frame_oam -16, -30, $be, 6
	db $80

.frame_2
	frame_oam -16, -24, $c0, 6
	frame_oam -16, -16, $c2, 6
	frame_oam -16,  -8, $c4, 6
	frame_oam -16,  -2, $c0, 6
	frame_oam -16,   6, $c2, 6
	frame_oam -16,  14, $c4, 6
	frame_oam -16, -46, $c0, 6
	frame_oam -16, -38, $c2, 6
	frame_oam -16, -30, $c4, 6
	db $80

.frame_3
	frame_oam -16, -24, $c6, 6
	frame_oam -16, -16, $c8, 6
	frame_oam -16,  -8, $ca, 6
	frame_oam -16,  -2, $c6, 6
	frame_oam -16,   6, $c8, 6
	frame_oam -16,  14, $ca, 6
	frame_oam -16, -46, $c6, 6
	frame_oam -16, -38, $c8, 6
	frame_oam -16, -30, $ca, 6
	db $80

.frame_4
	frame_oam -16, -24, $cc, 6
	frame_oam -16, -16, $ce, 6
	frame_oam -16,  -8, $d0, 6
	frame_oam -16,  -2, $cc, 6
	frame_oam -16,   6, $ce, 6
	frame_oam -16,  14, $d0, 6
	frame_oam -16, -46, $cc, 6
	frame_oam -16, -38, $ce, 6
	frame_oam -16, -30, $d0, 6
	db $80

.frame_5
	frame_oam -16, -24, $d2, 6
	frame_oam -16, -16, $d4, 6
	frame_oam -16,  -8, $d6, 6
	frame_oam -16,  -2, $d2, 6
	frame_oam -16,   6, $d4, 6
	frame_oam -16,  14, $d6, 6
	frame_oam -16, -46, $d2, 6
	frame_oam -16, -38, $d4, 6
	frame_oam -16, -30, $d6, 6
	db $80

.frame_6
	frame_oam -23, -16, $b2, 3
	frame_oam -23,  -8, $b4, 3
	frame_oam -23,   0, $b6, 3
	frame_oam -23,   8, $b8, 3
	frame_oam -15, -16, $b2, 3
	frame_oam -15,  -8, $b4, 3
	frame_oam -15,   0, $b6, 3
	frame_oam -15,   8, $b8, 3
	frame_oam -24, -16, $b2, 3
	frame_oam -24,  -8, $b4, 3
	frame_oam -24,   0, $b6, 3
	frame_oam -24,   8, $b8, 3
	frame_oam -16, -16, $b2, 3
	frame_oam -16,  -8, $b4, 3
	frame_oam -16,   0, $b6, 3
	frame_oam -16,   8, $b8, 3
	db $80
; 0xbdf92

Frameset_bdf92: ; bdf92 (2f:5f92)
	db $00,  4
	db $ff
; 0xbdf95

Frameset_bdf95: ; bdf95 (2f:5f95)
	db $01, 10
	db $02, 10
	db $03, 10
	db $04, 10
	db $05, 10
	db $ff
; 0xbdfa0

Frameset_bdfa0: ; bdfa0 (2f:5fa0)
	db $00,  4
	db $06,  4
	db $ff
; 0xbdfa5

OAM_bdfa5: ; bdfa5 (2f:5fa5)
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
	frame_oam -22,  -6, $50, 1 | OAMF_BANK1
	frame_oam -16,  -8, $40, 2 | OAMF_BANK1
	frame_oam -16,   0, $42, 2 | OAMF_BANK1
	frame_oam -16,   8, $44, 2 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -22,  -6, $50, 1 | OAMF_BANK1
	frame_oam -16,  -8, $46, 2 | OAMF_BANK1
	frame_oam -16,   0, $48, 2 | OAMF_BANK1
	frame_oam -16,   8, $4a, 2 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -22,  -6, $50, 1 | OAMF_BANK1
	frame_oam -16,  -5, $4c, 2 | OAMF_BANK1
	frame_oam -16,   3, $4e, 2 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -22,  -6, $52, 1 | OAMF_BANK1
	frame_oam -16,  -8, $40, 2 | OAMF_BANK1
	frame_oam -16,   0, $42, 2 | OAMF_BANK1
	frame_oam -16,   8, $44, 2 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -22,  -6, $52, 1 | OAMF_BANK1
	frame_oam -16,  -8, $46, 2 | OAMF_BANK1
	frame_oam -16,   0, $48, 2 | OAMF_BANK1
	frame_oam -16,   8, $4a, 2 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -22,  -6, $52, 1 | OAMF_BANK1
	frame_oam -16,  -5, $4c, 2 | OAMF_BANK1
	frame_oam -16,   3, $4e, 2 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -19, -39, $54, 4 | OAMF_BANK1
	frame_oam -27, -31, $56, 4 | OAMF_BANK1
	frame_oam -27, -23, $58, 4 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -19, -39, $54, 4 | OAMF_BANK1
	frame_oam -27, -31, $56, 4 | OAMF_BANK1
	frame_oam -27, -23, $58, 4 | OAMF_BANK1
	frame_oam -32, -16, $5a, 6 | OAMF_BANK1
	frame_oam -32,  -8, $5c, 6 | OAMF_BANK1
	frame_oam -16, -16, $64, 3 | OAMF_BANK1
	frame_oam -16,  -8, $66, 3 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -19, -39, $54, 4 | OAMF_BANK1
	frame_oam -27, -31, $56, 4 | OAMF_BANK1
	frame_oam -27, -23, $58, 4 | OAMF_BANK1
	frame_oam -16, -40, $5e, 6 | OAMF_BANK1
	frame_oam -16, -32, $60, 6 | OAMF_BANK1
	frame_oam -16, -24, $62, 6 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -19, -39, $54, 4 | OAMF_BANK1
	frame_oam -27, -31, $56, 4 | OAMF_BANK1
	frame_oam -27, -23, $58, 4 | OAMF_BANK1
	frame_oam -16, -16, $64, 3 | OAMF_BANK1
	frame_oam -16,  -8, $66, 3 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -19, -39, $54, 4 | OAMF_BANK1
	frame_oam -27, -31, $56, 4 | OAMF_BANK1
	frame_oam -27, -23, $58, 4 | OAMF_BANK1
	frame_oam -16, -16, $64, 3 | OAMF_BANK1
	frame_oam -16,  -8, $66, 3 | OAMF_BANK1
	frame_oam -16, -40, $5e, 6 | OAMF_BANK1
	frame_oam -16, -32, $60, 6 | OAMF_BANK1
	frame_oam -16, -24, $62, 6 | OAMF_BANK1
	frame_oam -32, -16, $5a, 6 | OAMF_BANK1
	frame_oam -32,  -8, $5c, 6 | OAMF_BANK1
	db $80

.frame_11
	frame_oam -56, -43, $78, 1 | OAMF_BANK1
	frame_oam -56, -35, $7a, 1 | OAMF_BANK1
	frame_oam -40, -47, $96, 1 | OAMF_BANK1
	frame_oam -40, -39, $98, 1 | OAMF_BANK1
	frame_oam -40, -31, $9a, 1 | OAMF_BANK1
	frame_oam -56, -51, $72, 1 | OAMF_BANK1
	frame_oam -19, -39, $54, 4 | OAMF_BANK1
	frame_oam -27, -31, $56, 4 | OAMF_BANK1
	frame_oam -27, -23, $58, 4 | OAMF_BANK1
	frame_oam -35, -40, $6c, 6 | OAMF_BANK1
	frame_oam -35, -32, $6e, 6 | OAMF_BANK1
	frame_oam -35, -24, $70, 6 | OAMF_BANK1
	frame_oam -51, -32, $68, 6 | OAMF_BANK1
	frame_oam -51, -24, $6a, 6 | OAMF_BANK1
	db $80

.frame_12
	frame_oam -56, -43, $78, 1 | OAMF_BANK1
	frame_oam -40, -47, $96, 1 | OAMF_BANK1
	frame_oam -40, -39, $98, 1 | OAMF_BANK1
	frame_oam -56, -35, $7c, 1 | OAMF_BANK1
	frame_oam -40, -31, $9c, 1 | OAMF_BANK1
	frame_oam -56, -51, $74, 1 | OAMF_BANK1
	frame_oam -19, -39, $54, 4 | OAMF_BANK1
	frame_oam -27, -31, $56, 4 | OAMF_BANK1
	frame_oam -27, -23, $58, 4 | OAMF_BANK1
	frame_oam -35, -40, $6c, 6 | OAMF_BANK1
	frame_oam -35, -32, $6e, 6 | OAMF_BANK1
	frame_oam -35, -24, $70, 6 | OAMF_BANK1
	frame_oam -51, -32, $68, 6 | OAMF_BANK1
	frame_oam -51, -24, $6a, 6 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -56, -51, $76, 1 | OAMF_BANK1
	frame_oam -56, -43, $78, 1 | OAMF_BANK1
	frame_oam -40, -47, $96, 1 | OAMF_BANK1
	frame_oam -40, -39, $98, 1 | OAMF_BANK1
	frame_oam -56, -35, $7e, 1 | OAMF_BANK1
	frame_oam -40, -31, $9e, 1 | OAMF_BANK1
	frame_oam -35, -40, $6c, 6 | OAMF_BANK1
	frame_oam -35, -32, $6e, 6 | OAMF_BANK1
	frame_oam -35, -24, $70, 6 | OAMF_BANK1
	frame_oam -51, -32, $68, 6 | OAMF_BANK1
	frame_oam -51, -24, $6a, 6 | OAMF_BANK1
	frame_oam -19, -39, $54, 4 | OAMF_BANK1
	frame_oam -27, -31, $56, 4 | OAMF_BANK1
	frame_oam -27, -23, $58, 4 | OAMF_BANK1
	db $80

.frame_14
	frame_oam -19, -39, $54, 4 | OAMF_BANK1
	frame_oam -27, -31, $56, 4 | OAMF_BANK1
	frame_oam -27, -23, $58, 4 | OAMF_BANK1
	frame_oam -16, -16, $64, 3 | OAMF_BANK1
	frame_oam -16,  -8, $66, 3 | OAMF_BANK1
	frame_oam -16, -38, $5e, 6 | OAMF_BANK1
	frame_oam -16, -30, $60, 6 | OAMF_BANK1
	frame_oam -16, -23, $62, 6 | OAMF_BANK1
	frame_oam -29, -16, $5a, 6 | OAMF_BANK1
	frame_oam -29,  -8, $5c, 6 | OAMF_BANK1
	db $80

.frame_15
	frame_oam -19, -39, $54, 4 | OAMF_BANK1
	frame_oam -27, -31, $56, 4 | OAMF_BANK1
	frame_oam -27, -23, $58, 4 | OAMF_BANK1
	frame_oam -29, -16, $5a, 6 | OAMF_BANK1
	frame_oam -29,  -8, $5c, 6 | OAMF_BANK1
	frame_oam -16, -16, $64, 3 | OAMF_BANK1
	frame_oam -16,  -8, $66, 3 | OAMF_BANK1
	db $80

.frame_16
	frame_oam -19, -39, $54, 4 | OAMF_BANK1
	frame_oam -27, -31, $56, 4 | OAMF_BANK1
	frame_oam -27, -23, $58, 4 | OAMF_BANK1
	frame_oam -16, -38, $5e, 6 | OAMF_BANK1
	frame_oam -16, -30, $60, 6 | OAMF_BANK1
	frame_oam -16, -23, $62, 6 | OAMF_BANK1
	db $80
; 0xbe1b0

Frameset_be1b0: ; be1b0 (2f:61b0)
	db $00,  4
	db $01,  4
	db $02,  4
	db $00,  4
	db $01,  4
	db $02,  4
	db $03,  4
	db $04,  4
	db $05,  4
	db $ff
; 0xbe1c3

Frameset_be1c3: ; be1c3 (2f:61c3)
	db $06,  8
	db $0f,  4
	db $07,  8
	db $0f,  4
	db $09,  8
	db $10,  4
	db $08,  8
	db $10,  4
	db $06,  8
	db $0f,  4
	db $07,  8
	db $0f,  4
	db $09,  8
	db $10,  4
	db $08,  8
	db $10,  4
	db $06,  8
	db $0f,  4
	db $07,  8
	db $0f,  4
	db $09,  8
	db $10,  4
	db $08,  8
	db $10,  4
	db $06, 30
	db $0e,  4
	db $0a, 50
	db $0e,  4
	db $ff
; 0xbe1fc

Frameset_be1fc: ; be1fc (2f:61fc)
	db $0b,  4
	db $0c,  4
	db $0d,  4
	db $ff
; 0xbe203

Frameset_be203: ; be203 (2f:6203)
	db $06,  4
	db $ff
; 0xbe206

OAM_be206:: ; be206 (2f:6206)
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
	frame_oam -24,  -8, $d8, 5 | OAMF_BANK1
	frame_oam -24,   0, $da, 2 | OAMF_BANK1
	frame_oam  -8,  -8, $ea, 3 | OAMF_BANK1
	frame_oam  -8,   0, $ea, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -24,  -8, $dc, 5 | OAMF_BANK1
	frame_oam -24,   0, $de, 2 | OAMF_BANK1
	frame_oam  -8,  -8, $e2, 3 | OAMF_BANK1
	frame_oam  -8,   0, $e4, 3 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -24,   0, $dc, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -8, $de, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,   0, $e2, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -8, $e4, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -24,  -8, $dc, 5 | OAMF_BANK1
	frame_oam -24,   0, $de, 2 | OAMF_BANK1
	frame_oam  -8,  -8, $e2, 3 | OAMF_BANK1
	frame_oam  -8,   0, $e4, 3 | OAMF_BANK1
	frame_oam -13,   2, $e0, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -24,   0, $dc, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -8, $de, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,   0, $e2, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -8, $e4, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -13, -10, $e0, 1 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -24,  -8, $dc, 5 | OAMF_BANK1
	frame_oam -24,   0, $de, 2 | OAMF_BANK1
	frame_oam  -8,  -8, $e2, 3 | OAMF_BANK1
	frame_oam  -8,   0, $e4, 3 | OAMF_BANK1
	frame_oam -20,   1, $e0, 1 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_6
	frame_oam -24,   0, $dc, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -8, $de, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,   0, $e2, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -8, $e4, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,  -9, $e0, 1 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_7
	frame_oam -16,  -8, $e6, 4 | OAMF_BANK1
	frame_oam -16,   0, $e8, 4 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -16,  -8, $e6, 4 | OAMF_BANK1
	frame_oam -16,   0, $e8, 4 | OAMF_BANK1
	frame_oam -32,  -8, $e6, 4 | OAMF_BANK1
	frame_oam -32,   0, $e8, 4 | OAMF_BANK1
	db $80
; 0xbe2b9

Frameset_be2b9:: ; be2b9 (2f:62b9)
	db $00,  6
	db $01,  6
	db $00,  6
	db $02,  6
	db $ff
; 0xbe2c2

Frameset_be2c2:: ; be2c2 (2f:62c2)
	db $00,  6
	db $03,  6
	db $00,  6
	db $04,  6
	db $00,  6
	db $05,  6
	db $00,  6
	db $06,  6
	db $ff
; 0xbe2d3

Frameset_be2d3:: ; be2d3 (2f:62d3)
	db $07,  4
	db $ff
; 0xbe2d6

Frameset_be2d6:: ; be2d6 (2f:62d6)
	db $08,  4
	db $ff
; 0xbe2d9

OAM_be2d9:: ; be2d9 (2f:62d9)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3

.frame_0
	frame_oam -88,  36, $ce, 5
	frame_oam -88,  44, $d0, 5
	frame_oam -88,  52, $d2, 5
	frame_oam -72,  36, $d4, 5
	frame_oam -72,  44, $d6, 5
	frame_oam -72,  52, $d8, 5
	frame_oam -38,  14, $be, 4
	frame_oam -51,  22, $c0, 7
	frame_oam -35,  22, $c2, 7
	frame_oam -59,  30, $c4, 7
	frame_oam -43,  30, $c6, 7
	frame_oam -67,  38, $c8, 7
	frame_oam -51,  38, $ca, 7
	frame_oam -67,  46, $cc, 7
	db $80

.frame_1
	frame_oam -88,  36, $da, 5
	frame_oam -88,  44, $dc, 5
	frame_oam -88,  52, $de, 5
	frame_oam -72,  36, $e0, 5
	frame_oam -72,  44, $e2, 5
	frame_oam -72,  52, $e4, 5
	frame_oam -38,  14, $be, 4
	frame_oam -51,  22, $c0, 7
	frame_oam -35,  22, $c2, 7
	frame_oam -59,  30, $c4, 7
	frame_oam -43,  30, $c6, 7
	frame_oam -67,  38, $c8, 7
	frame_oam -51,  38, $ca, 7
	frame_oam -67,  46, $cc, 7
	db $80

.frame_2
	frame_oam -88,  36, $e6, 5
	frame_oam -88,  44, $e8, 5
	frame_oam -88,  52, $ea, 5
	frame_oam -72,  36, $ec, 5
	frame_oam -72,  44, $ee, 5
	frame_oam -72,  52, $f0, 5
	frame_oam -38,  14, $be, 4
	frame_oam -51,  22, $c0, 7
	frame_oam -35,  22, $c2, 7
	frame_oam -59,  30, $c4, 7
	frame_oam -43,  30, $c6, 7
	frame_oam -67,  38, $c8, 7
	frame_oam -51,  38, $ca, 7
	frame_oam -67,  46, $cc, 7
	db $80

.frame_3
	frame_oam -88,  37, $f2, 5
	frame_oam -88,  45, $f4, 5
	frame_oam -88,  53, $f6, 5
	frame_oam -72,  37, $f8, 5
	frame_oam -72,  45, $fa, 5
	frame_oam -72,  53, $fc, 5
	frame_oam -38,  14, $be, 4
	frame_oam -51,  22, $c0, 7
	frame_oam -35,  22, $c2, 7
	frame_oam -59,  30, $c4, 7
	frame_oam -43,  30, $c6, 7
	frame_oam -67,  38, $c8, 7
	frame_oam -51,  38, $ca, 7
	frame_oam -67,  46, $cc, 7
	db $80

Frameset_be3c5:: ; be3c5 (2f:63c5)
	db $00,  6
	db $01,  6
	db $02,  6
	db $03,  6
	db $ff
; 0xbe3ce

OAM_be3ce:: ; be3ce (2f:63ce)
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
	frame_oam -49,  -8, $0c, 4
	frame_oam -41,   0, $0e, 4
	frame_oam -49,  16, $0c, 4 | OAMF_XFLIP
	frame_oam -41,   8, $0e, 4 | OAMF_XFLIP
	frame_oam -57,   0, $08, 4
	frame_oam -57,   8, $0a, 4
	frame_oam -46,  -8, $00, 6
	frame_oam -46,   0, $02, 6
	frame_oam -46,   8, $04, 6
	frame_oam -46,  16, $06, 6
	db $80

.frame_1
	frame_oam -46,  -8, $00, 6
	frame_oam -46,   0, $02, 6
	frame_oam -46,   8, $04, 6
	frame_oam -46,  16, $06, 6
	frame_oam -51,  -4, $2a, 4
	frame_oam -51,   4, $2c, 4
	frame_oam -51,  12, $2e, 4
	frame_oam -62,  -8, $10, 4
	frame_oam -62,   0, $12, 4
	frame_oam -62,  16, $10, 4 | OAMF_XFLIP
	frame_oam -62,   8, $12, 4 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -46,  -8, $00, 6
	frame_oam -46,   0, $02, 6
	frame_oam -46,   8, $04, 6
	frame_oam -46,  16, $06, 6
	frame_oam -51,  -4, $2a, 4
	frame_oam -51,   4, $2c, 4
	frame_oam -51,  12, $2e, 4
	frame_oam -62,  -8, $14, 4
	frame_oam -62,   0, $16, 4
	frame_oam -62,  16, $14, 4 | OAMF_XFLIP
	frame_oam -62,   8, $16, 4 | OAMF_XFLIP
	frame_oam -65,   4, $18, 0
	frame_oam -65,  -4, $18, 0
	frame_oam -65,  12, $18, 0
	db $80

.frame_3
	frame_oam -46,  -8, $00, 6
	frame_oam -46,   0, $02, 6
	frame_oam -46,   8, $04, 6
	frame_oam -46,  16, $06, 6
	frame_oam -51,  -4, $2a, 4
	frame_oam -51,   4, $2c, 4
	frame_oam -51,  12, $2e, 4
	frame_oam -62,  -8, $22, 4
	frame_oam -54,   0, $24, 4
	frame_oam -54,   8, $26, 4
	frame_oam -62,  16, $28, 4
	frame_oam -78,  -8, $1a, 4
	frame_oam -78,  16, $20, 4
	frame_oam -86,   0, $1c, 4
	frame_oam -86,   8, $1e, 4
	frame_oam -62,  -8, $30, 0
	frame_oam -62,   0, $32, 0
	frame_oam -78,  -8, $30, 0 | OAMF_YFLIP
	frame_oam -78,   0, $32, 0 | OAMF_YFLIP
	frame_oam -78,  16, $30, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -78,   8, $32, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -62,  16, $30, 0 | OAMF_XFLIP
	frame_oam -62,   8, $32, 0 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -46,  -8, $00, 6
	frame_oam -46,   0, $02, 6
	frame_oam -46,   8, $04, 6
	frame_oam -46,  16, $06, 6
	frame_oam -51,  -4, $2a, 4
	frame_oam -51,   4, $2c, 4
	frame_oam -51,  12, $2e, 4
	frame_oam -62,  -8, $22, 4
	frame_oam -54,   0, $24, 4
	frame_oam -54,   8, $26, 4
	frame_oam -62,  16, $28, 4
	frame_oam -78,  -8, $1a, 4
	frame_oam -78,  16, $20, 4
	frame_oam -86,   0, $1c, 4
	frame_oam -86,   8, $1e, 4
	frame_oam -71,  -8, $34, 1
	frame_oam -77,   0, $36, 1
	frame_oam -87,   8, $38, 1
	frame_oam -62,  -8, $30, 0
	frame_oam -62,   0, $32, 0
	frame_oam -78,  -8, $30, 0 | OAMF_YFLIP
	frame_oam -78,   0, $32, 0 | OAMF_YFLIP
	frame_oam -78,  16, $30, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -78,   8, $32, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -62,  16, $30, 0 | OAMF_XFLIP
	frame_oam -62,   8, $32, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -46,  -8, $00, 6
	frame_oam -46,   0, $02, 6
	frame_oam -46,   8, $04, 6
	frame_oam -46,  16, $06, 6
	frame_oam -51,  -4, $2a, 4
	frame_oam -51,   4, $2c, 4
	frame_oam -51,  12, $2e, 4
	frame_oam -62,  -8, $22, 4
	frame_oam -54,   0, $24, 4
	frame_oam -54,   8, $26, 4
	frame_oam -62,  16, $28, 4
	frame_oam -78,  -8, $1a, 4
	frame_oam -78,  16, $20, 4
	frame_oam -86,   0, $1c, 4
	frame_oam -86,   8, $1e, 4
	frame_oam -66,  -5, $34, 1
	frame_oam -72,   3, $36, 1
	frame_oam -82,  11, $38, 1
	frame_oam -62,  -8, $30, 0
	frame_oam -62,   0, $32, 0
	frame_oam -78,  -8, $30, 0 | OAMF_YFLIP
	frame_oam -78,   0, $32, 0 | OAMF_YFLIP
	frame_oam -78,  16, $30, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -78,   8, $32, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -62,  16, $30, 0 | OAMF_XFLIP
	frame_oam -62,   8, $32, 0 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -46,  -8, $00, 6
	frame_oam -46,   0, $02, 6
	frame_oam -46,   8, $04, 6
	frame_oam -46,  16, $06, 6
	frame_oam -51,  -4, $2a, 4
	frame_oam -51,   4, $2c, 4
	frame_oam -51,  12, $2e, 4
	frame_oam -62,  -8, $22, 4
	frame_oam -54,   0, $24, 4
	frame_oam -54,   8, $26, 4
	frame_oam -62,  16, $28, 4
	frame_oam -78,  -8, $1a, 4
	frame_oam -78,  16, $20, 4
	frame_oam -86,   0, $1c, 4
	frame_oam -86,   8, $1e, 4
	frame_oam -62,   1, $34, 1
	frame_oam -68,   9, $36, 1
	frame_oam -78,  17, $38, 1
	frame_oam -62,  -8, $30, 0
	frame_oam -62,   0, $32, 0
	frame_oam -78,  -8, $30, 0 | OAMF_YFLIP
	frame_oam -78,   0, $32, 0 | OAMF_YFLIP
	frame_oam -78,  16, $30, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -78,   8, $32, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -62,  16, $30, 0 | OAMF_XFLIP
	frame_oam -62,   8, $32, 0 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -46,  -8, $00, 6
	frame_oam -46,   0, $02, 6
	frame_oam -46,   8, $04, 6
	frame_oam -46,  16, $06, 6
	frame_oam -51,  -4, $2a, 4
	frame_oam -51,   4, $2c, 4
	frame_oam -51,  12, $2e, 4
	frame_oam -62,  -8, $22, 4
	frame_oam -54,   0, $24, 4
	frame_oam -54,   8, $26, 4
	frame_oam -62,  16, $28, 4
	frame_oam -78,  -8, $1a, 4
	frame_oam -78,  16, $20, 4
	frame_oam -86,   0, $1c, 4
	frame_oam -86,   8, $1e, 4
	frame_oam -57,   3, $34, 1
	frame_oam -63,  11, $36, 1
	frame_oam -62,  -8, $30, 0
	frame_oam -62,   0, $32, 0
	frame_oam -78,  -8, $30, 0 | OAMF_YFLIP
	frame_oam -78,   0, $32, 0 | OAMF_YFLIP
	frame_oam -78,  16, $30, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -78,   8, $32, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -62,  16, $30, 0 | OAMF_XFLIP
	frame_oam -62,   8, $32, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -46,  -8, $00, 6
	frame_oam -46,   0, $02, 6
	frame_oam -46,   8, $04, 6
	frame_oam -46,  16, $06, 6
	frame_oam -51,  -4, $2a, 4
	frame_oam -51,   4, $2c, 4
	frame_oam -51,  12, $2e, 4
	frame_oam -62,  -8, $22, 4
	frame_oam -54,   0, $24, 4
	frame_oam -54,   8, $26, 4
	frame_oam -62,  16, $28, 4
	frame_oam -78,  -8, $1a, 4
	frame_oam -78,  16, $20, 4
	frame_oam -86,   0, $1c, 4
	frame_oam -86,   8, $1e, 4
	frame_oam -62,  -8, $30, 1
	frame_oam -62,   0, $32, 1
	frame_oam -78,  -8, $30, 1 | OAMF_YFLIP
	frame_oam -78,   0, $32, 1 | OAMF_YFLIP
	frame_oam -78,  16, $30, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -78,   8, $32, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -62,  16, $30, 1 | OAMF_XFLIP
	frame_oam -62,   8, $32, 1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -46,  -8, $00, 6
	frame_oam -46,   0, $02, 6
	frame_oam -46,   8, $04, 6
	frame_oam -46,  16, $06, 6
	frame_oam -51,  -4, $2a, 4
	frame_oam -51,   4, $2c, 4
	frame_oam -51,  12, $2e, 4
	frame_oam -62,  -8, $22, 4
	frame_oam -54,   0, $24, 4
	frame_oam -54,   8, $26, 4
	frame_oam -62,  16, $28, 4
	frame_oam -78,  -8, $1a, 4
	frame_oam -78,  16, $20, 4
	frame_oam -86,   0, $1c, 4
	frame_oam -86,   8, $1e, 4
	frame_oam -62,  -8, $30, 7
	frame_oam -62,   0, $32, 7
	frame_oam -78,  -8, $30, 7 | OAMF_YFLIP
	frame_oam -78,   0, $32, 7 | OAMF_YFLIP
	frame_oam -78,  16, $30, 7 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -78,   8, $32, 7 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -62,  16, $30, 7 | OAMF_XFLIP
	frame_oam -62,   8, $32, 7 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -46,  -8, $00, 6
	frame_oam -46,   0, $02, 6
	frame_oam -46,   8, $04, 6
	frame_oam -46,  16, $06, 6
	frame_oam -51,  -4, $2a, 4
	frame_oam -51,   4, $2c, 4
	frame_oam -51,  12, $2e, 4
	frame_oam -62,  -8, $22, 4
	frame_oam -54,   0, $24, 4
	frame_oam -54,   8, $26, 4
	frame_oam -62,  16, $28, 4
	frame_oam -78,  -8, $1a, 4
	frame_oam -78,  16, $20, 4
	frame_oam -86,   0, $1c, 4
	frame_oam -86,   8, $1e, 4
	frame_oam -62,  -8, $30, 5
	frame_oam -62,   0, $32, 5
	frame_oam -78,  -8, $30, 5 | OAMF_YFLIP
	frame_oam -78,   0, $32, 5 | OAMF_YFLIP
	frame_oam -78,  16, $30, 5 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -78,   8, $32, 5 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -62,  16, $30, 5 | OAMF_XFLIP
	frame_oam -62,   8, $32, 5 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -62,  -8, $3a, 5
	frame_oam -62,   0, $3c, 5
	frame_oam -62,  16, $3a, 5 | OAMF_XFLIP
	frame_oam -62,   8, $3c, 5 | OAMF_XFLIP
	frame_oam -78,  -8, $3a, 5 | OAMF_YFLIP
	frame_oam -78,   0, $3c, 5 | OAMF_YFLIP
	frame_oam -78,  16, $3a, 5 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -78,   8, $3c, 5 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -46,  -8, $00, 6
	frame_oam -46,   0, $02, 6
	frame_oam -46,   8, $04, 6
	frame_oam -46,  16, $06, 6
	frame_oam -51,  -4, $2a, 4
	frame_oam -51,   4, $2c, 4
	frame_oam -51,  12, $2e, 4
	frame_oam -62,  -8, $22, 4
	frame_oam -54,   0, $24, 4
	frame_oam -54,   8, $26, 4
	frame_oam -62,  16, $28, 4
	frame_oam -78,  -8, $1a, 4
	frame_oam -78,  16, $20, 4
	frame_oam -86,   0, $1c, 4
	frame_oam -86,   8, $1e, 4
	db $80

Frameset_be7e6:: ; be7e6 (2f:67e6)
	db $00,  4
	db $ff
; 0xbe7e9

Frameset_be7e9:: ; be7e9 (2f:67e9)
	db $00, 50
	db $01,  6
	db $02,  6
	db $03, 50
	db $04,  4
	db $05,  4
	db $06,  4
	db $07,  4
	db $03, 50
	db $08,  6
	db $09,  6
	db $0a, 50
	db $ff
; 0xbe802

Frameset_be802:: ; be802 (2f:6802)
	db $0a,  2
	db $0b,  2
	db $ff
; 0xbe807

OAM_be807: ; be807 (2f:6807)
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
	frame_oam -48, -16, $80, 1 | OAMF_BANK1
	frame_oam -48,  -8, $82, 1 | OAMF_BANK1
	frame_oam -48,   0, $84, 1 | OAMF_BANK1
	frame_oam -32, -16, $86, 1 | OAMF_BANK1
	frame_oam -32,  -8, $88, 1 | OAMF_BANK1
	frame_oam -32,   0, $8a, 1 | OAMF_BANK1
	frame_oam -16, -16, $8c, 1 | OAMF_BANK1
	frame_oam -16,  -8, $8e, 1 | OAMF_BANK1
	frame_oam -16,   0, $90, 1 | OAMF_BANK1
	frame_oam -16,   8, $92, 1 | OAMF_BANK1
	frame_oam -48,   8, $80, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   8, $86, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -22, -12, $94, 6 | OAMF_BANK1
	frame_oam -22,  -4, $96, 6 | OAMF_BANK1
	frame_oam -22,   4, $98, 6 | OAMF_BANK1
	frame_oam  -6, -12, $a6, 6 | OAMF_BANK1
	frame_oam  -6,  -4, $a8, 6 | OAMF_BANK1
	frame_oam  -6,   4, $aa, 6 | OAMF_BANK1
	frame_oam  -5, -12, $ac, 5 | OAMF_BANK1
	frame_oam  -5,  -4, $ae, 5 | OAMF_BANK1
	frame_oam  -5,   4, $ac, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -38, -12, $ac, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -38,  -4, $ae, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -38,   4, $ac, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_2
	frame_oam  -5, -12, $ac, 5 | OAMF_BANK1
	frame_oam  -5,  -4, $ae, 5 | OAMF_BANK1
	frame_oam  -5,   4, $ac, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17, -12, $9a, 6 | OAMF_BANK1
	frame_oam -17,  -4, $9c, 6 | OAMF_BANK1
	frame_oam -17,   4, $9e, 6 | OAMF_BANK1
	frame_oam -33, -12, $ac, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -33,  -4, $ae, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -33,   4, $ac, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_3
	frame_oam  -5, -12, $ac, 5 | OAMF_BANK1
	frame_oam  -5,  -4, $ae, 5 | OAMF_BANK1
	frame_oam  -5,   4, $ac, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -14, -12, $a0, 6 | OAMF_BANK1
	frame_oam -14,  -4, $a2, 6 | OAMF_BANK1
	frame_oam -14,   4, $a4, 6 | OAMF_BANK1
	frame_oam -30, -12, $ac, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -30,  -4, $ae, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -30,   4, $ac, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_4
	frame_oam  -8,   0, $b0, 4 | OAMF_BANK1
	db $80

.frame_5
	frame_oam  -8,   1, $b0, 4 | OAMF_BANK1
	db $80

.frame_6
	frame_oam  -8,   2, $b0, 4 | OAMF_BANK1
	db $80

.frame_7
	frame_oam  -8,  -1, $b0, 4 | OAMF_BANK1
	db $80

.frame_8
	frame_oam  -8,  -2, $b0, 4 | OAMF_BANK1
	db $80
; 0xbe8de

Frameset_be8de: ; be8de (2f:68de)
	db $00,  4
	db $ff
; 0xbe8e1

Frameset_be8e1: ; be8e1 (2f:68e1)
	db $01, 20
	db $02,  6
	db $03, 20
	db $02,  6
	db $ff
; 0xbe8ea

Frameset_be8ea: ; be8ea (2f:68ea)
	db $01,  4
	db $ff
; 0xbe8ed

Frameset_be8ed: ; be8ed (2f:68ed)
	db $04,  4
	db $05,  4
	db $06,  8
	db $05,  4
	db $04,  4
	db $07,  4
	db $08,  8
	db $07,  4
	db $ff
; 0xbe8fe

OAM_be8fe:: ; be8fe (2f:68fe)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3

.frame_0
	frame_oam -41,   0, $ba, 6 | OAMF_BANK1
	frame_oam -32, -16, $aa, 5 | OAMF_BANK1
	frame_oam -32,  -8, $ac, 5 | OAMF_BANK1
	frame_oam -32,   0, $aa, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8, -16, $ae, 5 | OAMF_BANK1
	frame_oam  -8,  -8, $b0, 5 | OAMF_BANK1
	frame_oam  -8,   0, $ae, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28, -24, $b2, 5 | OAMF_BANK1
	frame_oam -12, -24, $b4, 5 | OAMF_BANK1
	frame_oam -28,   8, $b2, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,   8, $b4, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $a2, 4 | OAMF_BANK1
	frame_oam -24, -16, $a0, 4 | OAMF_BANK1
	frame_oam -24,   0, $a0, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -40,   1, $bc, 6 | OAMF_BANK1
	frame_oam -32, -16, $aa, 5 | OAMF_BANK1
	frame_oam -32,  -8, $ac, 5 | OAMF_BANK1
	frame_oam -32,   0, $aa, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8, -16, $ae, 5 | OAMF_BANK1
	frame_oam  -8,  -8, $b0, 5 | OAMF_BANK1
	frame_oam  -8,   0, $ae, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28, -24, $b6, 5 | OAMF_BANK1
	frame_oam -12, -24, $b8, 5 | OAMF_BANK1
	frame_oam -28,   8, $b6, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,   8, $b8, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24, -16, $a4, 4 | OAMF_BANK1
	frame_oam -24,  -8, $a6, 4 | OAMF_BANK1
	frame_oam -24,   0, $a8, 4 | OAMF_BANK1
	frame_oam -16, -16, $a4, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -8, $a6, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_2
	frame_oam -41,   0, $ba, 6 | OAMF_BANK1
	frame_oam -32, -16, $aa, 5 | OAMF_BANK1
	frame_oam -32,  -8, $ac, 5 | OAMF_BANK1
	frame_oam -32,   0, $aa, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8, -16, $ae, 5 | OAMF_BANK1
	frame_oam  -8,  -8, $b0, 5 | OAMF_BANK1
	frame_oam  -8,   0, $ae, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28, -24, $b2, 5 | OAMF_BANK1
	frame_oam -12, -24, $b4, 5 | OAMF_BANK1
	frame_oam -28,   8, $b2, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,   8, $b4, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -8, $a2, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16, -16, $a0, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   0, $a0, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_3
	frame_oam -40,   1, $bc, 6 | OAMF_BANK1
	frame_oam -32, -16, $aa, 5 | OAMF_BANK1
	frame_oam -32,  -8, $ac, 5 | OAMF_BANK1
	frame_oam -32,   0, $aa, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8, -16, $ae, 5 | OAMF_BANK1
	frame_oam  -8,  -8, $b0, 5 | OAMF_BANK1
	frame_oam  -8,   0, $ae, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -28, -24, $b6, 5 | OAMF_BANK1
	frame_oam -12, -24, $b8, 5 | OAMF_BANK1
	frame_oam -28,   8, $b6, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,   8, $b8, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,   0, $a4, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -8, $a6, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24, -16, $a8, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $a4, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $a6, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80
; 0xbe9fa

Frameset_be9fa:: ; be9fa (2f:69fa)
	db $00, 20
	db $ff
; 0xbe9fd

Frameset_be9fd:: ; be9fd (2f:69fd)
	db $00, 20
	db $01,  4
	db $02,  4
	db $03,  4
	db $ff
; 0xbea06

OAM_bea06: ; bea06 (2f:6a06)
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

.frame_0
	frame_oam -12,  -8, $4e, 4 | OAMF_BANK1
	frame_oam -12,   0, $50, 4 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,  -8, $5a, 1 | OAMF_BANK1
	frame_oam -16,   0, $5c, 1 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,  -8, $56, 1 | OAMF_BANK1
	frame_oam -16,   0, $58, 1 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,  -8, $52, 1 | OAMF_BANK1
	frame_oam -16,   0, $54, 1 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -16,  -8, $5a, 0 | OAMF_BANK1
	frame_oam -16,   0, $5c, 0 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16,  -8, $56, 0 | OAMF_BANK1
	frame_oam -16,   0, $58, 0 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16,  -8, $52, 0 | OAMF_BANK1
	frame_oam -16,   0, $54, 0 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16,  -8, $38, 2 | OAMF_BANK1
	frame_oam -16,   0, $38, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -16,  -8, $3a, 2 | OAMF_BANK1
	frame_oam -16,   0, $3a, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -16,  -8, $3c, 2 | OAMF_BANK1
	frame_oam -16,   0, $3c, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -16,  -8, $3e, 2 | OAMF_BANK1
	frame_oam -16,   0, $3e, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -16,  -8, $40, 2 | OAMF_BANK1
	frame_oam -16,   0, $40, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -16,  -8, $42, 2 | OAMF_BANK1
	frame_oam -16,   0, $42, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -16,  -8, $44, 2 | OAMF_BANK1
	frame_oam -16,   0, $44, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16,  -8, $46, 2 | OAMF_BANK1
	frame_oam -16,   0, $46, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -16,  -8, $48, 2 | OAMF_BANK1
	frame_oam -16,   0, $48, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -16,  -8, $4a, 2 | OAMF_BANK1
	frame_oam -16,   0, $4a, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -16,  -8, $4c, 2 | OAMF_BANK1
	frame_oam -16,   0, $4c, 2 | OAMF_BANK1 | OAMF_XFLIP
	db $80
; 0xbeacc

Frameset_beacc: ; beacc (2f:6acc)
	db $00,  4
	db $ff
; 0xbeacf

Frameset_beacf: ; beacf (2f:6acf)
	db $01,  4
	db $02,  4
	db $03,  4
	db $04,  4
	db $05,  4
	db $06,  4
	db $05,  4
	db $04,  4
	db $03,  4
	db $02,  4
	db $ff
; 0xbeae4

Frameset_beae4: ; beae4 (2f:6ae4)
	db $07,  4
	db $08,  4
	db $09,  4
	db $0a,  4
	db $ff
; 0xbeaed

Frameset_beaed: ; beaed (2f:6aed)
	db $0b,  4
	db $0c,  4
	db $0d,  4
	db $0e,  4
	db $0f,  4
	db $10,  4
	db $11,  4
	db $ff
; 0xbeafc

OAM_beafc:: ; beafc (2f:6afc)
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
	frame_oam -16,  -8, $16, 5 | OAMF_BANK1
	frame_oam -16,   0, $18, 5 | OAMF_BANK1
	frame_oam -16,  -8, $1a, 4 | OAMF_BANK1
	frame_oam -16,   0, $1c, 4 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -12,  -6, $20, 5 | OAMF_BANK1
	frame_oam -12,   2, $22, 5 | OAMF_BANK1
	frame_oam -12,  10, $24, 5 | OAMF_BANK1
	frame_oam -28,   2, $1e, 5 | OAMF_BANK1
	frame_oam -12,  -4, $26, 4 | OAMF_BANK1
	frame_oam -12,   4, $28, 4 | OAMF_BANK1
	frame_oam -12,  10, $2a, 4 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -12,  -6, $20, 5 | OAMF_BANK1
	frame_oam -12,   2, $22, 5 | OAMF_BANK1
	frame_oam -12,  10, $24, 5 | OAMF_BANK1
	frame_oam -28,   2, $1e, 5 | OAMF_BANK1
	frame_oam -12,  -4, $26, 4 | OAMF_BANK1
	frame_oam -12,   4, $28, 4 | OAMF_BANK1
	frame_oam -12,  10, $2c, 4 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -12,  -6, $20, 5 | OAMF_BANK1
	frame_oam -12,   2, $22, 5 | OAMF_BANK1
	frame_oam -12,  10, $24, 5 | OAMF_BANK1
	frame_oam -28,   2, $1e, 5 | OAMF_BANK1
	frame_oam -12,  -4, $26, 4 | OAMF_BANK1
	frame_oam -12,   4, $28, 4 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -13,  -3, $2e, 4 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16,  -8, $30, 4 | OAMF_BANK1
	frame_oam -16,   0, $30, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -16,  -9, $32, 4 | OAMF_BANK1
	frame_oam -16,   1, $32, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -16, -12, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $34, 4 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -16,  -8, $00, 6 | OAMF_BANK1
	frame_oam -16,   0, $02, 6 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -16,  -8, $0a, 6 | OAMF_BANK1
	frame_oam -16,   0, $0c, 6 | OAMF_BANK1
	db $80

.frame_10
	frame_oam  -8,  -8, $0e, 6 | OAMF_BANK1
	frame_oam  -8,   0, $10, 6 | OAMF_BANK1
	frame_oam -24,  -8, $08, 6 | OAMF_BANK1
	frame_oam -24,   0, $06, 6 | OAMF_BANK1
	db $80

.frame_11
	frame_oam -16,  -8, $12, 6 | OAMF_BANK1
	frame_oam -16,   0, $14, 6 | OAMF_BANK1
	frame_oam -32,  -8, $04, 6 | OAMF_BANK1
	frame_oam -32,   0, $06, 6 | OAMF_BANK1
	db $80

Frameset_bebcc:: ; bebcc (2f:6bcc)
	db $00,  4
	db $01,  4
	db $02,  4
	db $ff
; 0xbebd3

Frameset_bebd3:: ; bebd3 (2f:6bd3)
	db $05,  4
	db $06,  4
	db $07,  4
	db $ff
; 0xbebda

Frameset_bebda:: ; bebda (2f:6bda)
	db $00,  4
	db $ff
; 0xbebdd

Frameset_bebdd:: ; bebdd (2f:6bdd)
	db $03,  4
	db $ff
; 0xbebe0

Frameset_bebe0:: ; bebe0 (2f:6be0)
	db $04,  4
	db $ff
; 0xbebe3

Frameset_bebe3:: ; bebe3 (2f:6be3)
	db $08, 20
	db $09, 10
	db $0a, 10
	db $0b, 50
	db $ff
; 0xbebec

Frameset_bebec:: ; bebec (2f:6bec)
	db $0b,  4
	db $ff
; 0xbebef

OAM_bebef:: ; bebef (2f:6bef)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7

.frame_0
	frame_oam -16, -16, $c0, 4 | OAMF_BANK1
	frame_oam -16,  -8, $c2, 4 | OAMF_BANK1
	frame_oam -16,   0, $c4, 4 | OAMF_BANK1
	frame_oam -16,   8, $c6, 4 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16, -16, $c8, 4 | OAMF_BANK1
	frame_oam -16,  -8, $ca, 4 | OAMF_BANK1
	frame_oam -16,   0, $cc, 4 | OAMF_BANK1
	frame_oam -16,   8, $ce, 4 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16, -16, $d0, 4 | OAMF_BANK1
	frame_oam -16,  -8, $d2, 4 | OAMF_BANK1
	frame_oam -16,   0, $d4, 4 | OAMF_BANK1
	frame_oam -16,   8, $d6, 4 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16, -16, $d8, 4 | OAMF_BANK1
	frame_oam -16,  -8, $da, 4 | OAMF_BANK1
	frame_oam -16,   0, $dc, 4 | OAMF_BANK1
	frame_oam -16,   8, $de, 4 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -16, -16, $80, 5 | OAMF_BANK1
	frame_oam -16,  -8, $80, 5 | OAMF_BANK1
	frame_oam -16,   0, $80, 5 | OAMF_BANK1
	frame_oam -16,   8, $80, 5 | OAMF_BANK1
	frame_oam -32, -16, $80, 5 | OAMF_BANK1
	frame_oam -32,  -8, $80, 5 | OAMF_BANK1
	frame_oam -32,   0, $80, 5 | OAMF_BANK1
	frame_oam -32,   8, $80, 5 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16, -16, $82, 5 | OAMF_BANK1
	frame_oam -16,  -8, $82, 5 | OAMF_BANK1
	frame_oam -16,   0, $82, 5 | OAMF_BANK1
	frame_oam -16,   8, $82, 5 | OAMF_BANK1
	frame_oam -32, -16, $82, 5 | OAMF_BANK1
	frame_oam -32,  -8, $82, 5 | OAMF_BANK1
	frame_oam -32,   0, $82, 5 | OAMF_BANK1
	frame_oam -32,   8, $82, 5 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16, -16, $84, 5 | OAMF_BANK1
	frame_oam -16,  -8, $84, 5 | OAMF_BANK1
	frame_oam -16,   0, $84, 5 | OAMF_BANK1
	frame_oam -16,   8, $84, 5 | OAMF_BANK1
	frame_oam -32, -16, $84, 5 | OAMF_BANK1
	frame_oam -32,  -8, $84, 5 | OAMF_BANK1
	frame_oam -32,   0, $84, 5 | OAMF_BANK1
	frame_oam -32,   8, $84, 5 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16, -16, $86, 5 | OAMF_BANK1
	frame_oam -16,  -8, $86, 5 | OAMF_BANK1
	frame_oam -16,   0, $86, 5 | OAMF_BANK1
	frame_oam -16,   8, $86, 5 | OAMF_BANK1
	frame_oam -32, -16, $86, 5 | OAMF_BANK1
	frame_oam -32,  -8, $86, 5 | OAMF_BANK1
	frame_oam -32,   0, $86, 5 | OAMF_BANK1
	frame_oam -32,   8, $86, 5 | OAMF_BANK1
	db $80
; 0xbecc7

Frameset_becc7:: ; becc7 (2f:6cc7)
	db $00,  4
	db $ff
; 0xbecca

Frameset_becca:: ; becca (2f:6cca)
	db $00,  3
	db $01,  3
	db $02,  3
	db $03,  3
	db $ff
; 0xbecd3

Frameset_becd3:: ; becd3 (2f:6cd3)
	db $04,  3
	db $05,  3
	db $06,  3
	db $07,  3
	db $ff
; 0xbecdc

OAM_becdc: ; becdc (2f:6cdc)
	dw .frame_0
	dw .frame_1
	dw .frame_2

.frame_0
	frame_oam -16,  -4, $22, 2 | OAMF_BANK1
	frame_oam -32,  -8, $20, 1 | OAMF_BANK1
	frame_oam -32, -16, $1e, 1 | OAMF_BANK1
	frame_oam -32,   0, $20, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   8, $1e, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -48, -16, $16, 1 | OAMF_BANK1
	frame_oam -48,  -8, $18, 1 | OAMF_BANK1
	frame_oam -48,   0, $1a, 1 | OAMF_BANK1
	frame_oam -48,   8, $1c, 1 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -12, -10, $2a, 3 | OAMF_BANK1
	frame_oam -12,  -2, $2c, 5 | OAMF_BANK1
	frame_oam -12,   6, $2e, 5 | OAMF_BANK1
	frame_oam  -5,  -8, $32, 6 | OAMF_BANK1
	frame_oam  -5,   0, $34, 6 | OAMF_BANK1
	frame_oam  -5,   8, $30, 6 | OAMF_BANK1
	frame_oam  -5, -16, $30, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -9,  -4, $36, 4 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -13,  -4, $24, 3 | OAMF_BANK1
	frame_oam   3,  -7, $26, 6 | OAMF_BANK1
	frame_oam   3,   1, $28, 6 | OAMF_BANK1
	frame_oam  -9,  -4, $36, 4 | OAMF_BANK1
	db $80
; 0xbed39

Frameset_bed39: ; bed39 (2f:6d39)
	db $00,  4
	db $ff
; 0xbed3c

Frameset_bed3c: ; bed3c (2f:6d3c)
	db $01,  4
	db $ff
; 0xbed3f

Frameset_bed3f: ; bed3f (2f:6d3f)
	db $02,  4
	db $ff
; 0xbed42

OAM_bed42:: ; bed42 (2f:6d42)
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
	frame_oam  -9,  -2, $00, 0
	frame_oam  -9,   6, $02, 0
	frame_oam  -9,  14, $04, 0
	frame_oam  -9,  22, $06, 0
	frame_oam   7,   6, $08, 0
	frame_oam   7,  14, $0a, 0
	frame_oam   7,  22, $0c, 0
	frame_oam   7,  30, $0e, 0
	db $80

.frame_1
	frame_oam   0,  -1, $08, 0
	frame_oam   0,   7, $0a, 0
	frame_oam   0,  15, $0c, 0
	frame_oam   0,  23, $0e, 0
	db $80

.frame_2
	frame_oam  -9,  -2, $00, 1
	frame_oam  -9,   6, $02, 1
	frame_oam  -9,  14, $04, 1
	frame_oam  -9,  22, $06, 1
	frame_oam   7,   6, $08, 1
	frame_oam   7,  14, $0a, 1
	frame_oam   7,  22, $0c, 1
	frame_oam   7,  30, $0e, 1
	db $80

.frame_3
	frame_oam   0,  -1, $08, 1
	frame_oam   0,   7, $0a, 1
	frame_oam   0,  15, $0c, 1
	frame_oam   0,  23, $0e, 0
	db $80

.frame_4
	frame_oam -16, -16, $10, 2
	frame_oam -16,  -8, $12, 2
	frame_oam -16,   0, $12, 2
	frame_oam -16,   8, $12, 2
	frame_oam -16, -16, $14, 4
	frame_oam -16,  -8, $14, 4
	frame_oam -16,   0, $14, 4
	frame_oam -16,   8, $14, 4
	db $80

.frame_5
	frame_oam -16, -16, $10, 2
	frame_oam -16,   8, $12, 2
	frame_oam -16, -16, $14, 4
	frame_oam -16,   8, $14, 4
	frame_oam -16,   2, $12, 2
	frame_oam -16,   2, $14, 4
	frame_oam -16, -10, $12, 2
	frame_oam -16, -10, $14, 4
	db $80

.frame_6
	frame_oam -16, -16, $10, 2
	frame_oam -16,   8, $12, 2
	frame_oam -16, -16, $14, 4
	frame_oam -16,   8, $14, 4
	frame_oam -16,   4, $12, 2
	frame_oam -16,   4, $14, 4
	frame_oam -16, -12, $12, 2
	frame_oam -16, -12, $14, 4
	db $80

.frame_7
	frame_oam -16, -16, $10, 2
	frame_oam -16,   8, $12, 2
	frame_oam -16, -16, $14, 4
	frame_oam -16,   8, $14, 4
	frame_oam -16,   6, $12, 2
	frame_oam -16,   6, $14, 4
	frame_oam -16, -14, $12, 2
	frame_oam -16, -14, $14, 4
	db $80

.frame_8
	frame_oam -16, -16, $10, 2
	frame_oam -16,   8, $12, 2
	frame_oam -16, -16, $14, 4
	frame_oam -16,   8, $14, 4
	db $80
; 0xbee4d

Frameset_bee4d:: ; bee4d (2f:6e4d)
	db $00,  4
	db $ff
; 0xbee50

Frameset_bee50:: ; bee50 (2f:6e50)
	db $00,  4
	db $01, 10
	db $ff
; 0xbee55

Frameset_bee55:: ; bee55 (2f:6e55)
	db $02,  4
	db $ff
; 0xbee58

Frameset_bee58:: ; bee58 (2f:6e58)
	db $02,  4
	db $03, 10
	db $ff
; 0xbee5d

Frameset_bee5d:: ; bee5d (2f:6e5d)
	db $04,  4
	db $ff
; 0xbee60

Frameset_bee60:: ; bee60 (2f:6e60)
	db $04,  4
	db $05,  4
	db $06,  4
	db $07,  4
	db $08,  4
	db $ff
; 0xbee6b

Frameset_bee6b:: ; bee6b (2f:6e6b)
	db $08,  4
	db $ff
; 0xbee6e

OAM_bee6e: ; bee6e (2f:6e6e)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7

.frame_0
	frame_oam -21,  -8, $5e, 1
	frame_oam  -5,  -8, $60, 1
	frame_oam -16,   0, $64, 1
	frame_oam -16,   8, $66, 1
	frame_oam  12,  -8, $62, 1
	frame_oam   0,   0, $68, 1
	frame_oam   0,   8, $6a, 1
	db $80

.frame_1
	frame_oam -16,  -8, $40, 5
	frame_oam -16,   0, $42, 5
	frame_oam   0,  -8, $46, 4
	frame_oam   0,   0, $48, 4
	frame_oam   0,   8, $4a, 4
	frame_oam   0,  16, $4c, 4
	frame_oam -16,   8, $42, 5
	frame_oam -16,  16, $42, 5
	frame_oam -17,  24, $6c, 4
	frame_oam -17,  32, $6e, 4
	frame_oam  -1,  24, $6c, 4 | OAMF_YFLIP
	frame_oam  -1,  32, $6e, 4 | OAMF_YFLIP
	frame_oam  -6,  29, $5c, 3
	db $80

.frame_2
	frame_oam -16,  -4, $42, 5
	frame_oam   0,  -4, $48, 4
	frame_oam   0,   4, $4a, 4
	frame_oam   0,  12, $4c, 4
	frame_oam -16,   4, $42, 5
	frame_oam -16,  12, $42, 5
	frame_oam -17,  20, $6c, 4
	frame_oam -17,  28, $6e, 4
	frame_oam  -1,  20, $6c, 4 | OAMF_YFLIP
	frame_oam  -1,  28, $6e, 4 | OAMF_YFLIP
	frame_oam  -6,  25, $5c, 3
	frame_oam -16,  -8, $44, 5
	frame_oam   0,  -8, $4e, 4
	db $80

.frame_3
	frame_oam   0,  -4, $4a, 4
	frame_oam   0,   4, $4c, 4
	frame_oam -16,  -4, $42, 5
	frame_oam -16,   4, $42, 5
	frame_oam -17,  12, $6c, 4
	frame_oam -17,  20, $6e, 4
	frame_oam  -1,  12, $6c, 4 | OAMF_YFLIP
	frame_oam  -1,  20, $6e, 4 | OAMF_YFLIP
	frame_oam  -6,  17, $5c, 3
	frame_oam -16,  -8, $44, 5
	frame_oam   0,  -8, $4e, 4
	db $80

.frame_4
	frame_oam   0,  -4, $4c, 4
	frame_oam -16,  -4, $42, 5
	frame_oam -17,   4, $6c, 4
	frame_oam -17,  12, $6e, 4
	frame_oam  -1,   4, $6c, 4 | OAMF_YFLIP
	frame_oam  -1,  12, $6e, 4 | OAMF_YFLIP
	frame_oam  -6,   9, $5c, 3
	frame_oam -16,  -8, $44, 5
	frame_oam   0,  -8, $4e, 4
	db $80

.frame_5
	frame_oam   0,  -4, $4c, 4
	frame_oam -16,  -4, $42, 5
	frame_oam -16,  -8, $44, 5
	frame_oam   0,  -8, $4e, 4
	frame_oam -13,   4, $50, 4
	frame_oam -13,  12, $52, 4
	frame_oam   3,   4, $54, 4
	frame_oam   3,  12, $56, 4
	frame_oam  -6,   9, $5c, 3
	db $80

.frame_6
	frame_oam   0,  -4, $4c, 4
	frame_oam -16,  -4, $42, 5
	frame_oam -16,  -8, $44, 5
	frame_oam   0,  -8, $4e, 4
	frame_oam  -9,   4, $58, 4
	frame_oam  -9,  12, $5a, 4
	frame_oam  -6,   9, $5c, 3
	db $80

.frame_7
	frame_oam   0,  -4, $4c, 4
	frame_oam -16,  -4, $42, 5
	frame_oam -16,  -8, $44, 5
	frame_oam   0,  -8, $4e, 4
	frame_oam  -5,   4, $50, 4 | OAMF_YFLIP
	frame_oam  -5,  12, $52, 4 | OAMF_YFLIP
	frame_oam -21,   4, $54, 4 | OAMF_YFLIP
	frame_oam -21,  12, $56, 4 | OAMF_YFLIP
	frame_oam  -6,   9, $5c, 3
	db $80
; 0xbefbe

Frameset_befbe: ; befbe (2f:6fbe)
	db $00,  4
	db $ff
; 0xbefc1

Frameset_befc1: ; befc1 (2f:6fc1)
	db $01,  4
	db $ff
; 0xbefc4

Frameset_befc4: ; befc4 (2f:6fc4)
	db $01,  4
	db $02,  4
	db $03,  4
	db $04, 20
	db $05,  4
	db $06,  4
	db $07,  4
	db $04, 50
	db $ff
; 0xbefd5

OAM_befd5: ; befd5 (2f:6fd5)
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
	frame_oam -28,  -7, $ec, 3
	frame_oam -28,   1, $ee, 3
	frame_oam -19,  -4, $f6, 5
	frame_oam -12,  -8, $f0, 3
	frame_oam -12,   0, $f0, 3 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -28,   1, $ee, 3
	frame_oam -19,  -4, $f6, 5
	frame_oam -28,  -7, $f4, 3
	frame_oam -29,   8, $f8, 1
	frame_oam -12,  -8, $f0, 3
	frame_oam -12,   0, $f0, 3 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -28,   1, $ee, 3
	frame_oam -19,  -4, $f6, 5
	frame_oam -28,  -7, $f4, 3
	frame_oam -29,   8, $f8, 1
	frame_oam -32,  16, $fa, 1
	frame_oam -12,  -8, $f0, 3
	frame_oam -12,   0, $f0, 3 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -28,   1, $ee, 3
	frame_oam -19,  -4, $f6, 5
	frame_oam -28,  -7, $f4, 3
	frame_oam -29,   8, $f8, 1
	frame_oam -32,  16, $fa, 1
	frame_oam -37,  24, $fc, 1
	frame_oam -21,  24, $fe, 1
	frame_oam -12,  -8, $f0, 3
	frame_oam -12,   0, $f0, 3 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -28,   1, $ee, 3
	frame_oam -19,  -4, $f6, 5
	frame_oam -28,  -7, $f4, 3
	frame_oam -29,   8, $f8, 1
	frame_oam -31,  16, $fa, 1
	frame_oam -36,  24, $fc, 1
	frame_oam -20,  24, $fe, 1
	frame_oam -12,  -8, $f0, 3
	frame_oam -12,   0, $f0, 3 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -28,   1, $ee, 3
	frame_oam -19,  -4, $f6, 5
	frame_oam -28,  -7, $f4, 3
	frame_oam -29,   8, $f8, 1
	frame_oam -31,  16, $fa, 1
	frame_oam -35,  24, $fc, 1
	frame_oam -19,  24, $fe, 1
	frame_oam -12,  -8, $f0, 3
	frame_oam -12,   0, $f0, 3 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -28,   1, $ee, 3
	frame_oam -19,  -4, $f6, 5
	frame_oam -28,  -7, $f4, 3
	frame_oam -29,   8, $f8, 1
	frame_oam -33,  16, $fa, 1
	frame_oam -38,  24, $fc, 1
	frame_oam -22,  24, $fe, 1
	frame_oam -12,  -8, $f0, 3
	frame_oam -12,   0, $f0, 3 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -12,  -8, $f0, 3
	frame_oam -28,   1, $ee, 3
	frame_oam -19,  -4, $f6, 5
	frame_oam -28,  -7, $f4, 3
	frame_oam -29,   8, $f8, 1
	frame_oam -33,  16, $fa, 1
	frame_oam -39,  24, $fc, 1
	frame_oam -23,  24, $fe, 1
	frame_oam -12,   0, $f0, 3 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -28,   1, $ee, 3
	frame_oam -19,  -4, $f6, 5
	frame_oam -28,  -7, $f4, 3
	frame_oam -12,  -8, $f0, 3
	frame_oam -12,   0, $f0, 3 | OAMF_XFLIP
	db $80
; 0xbf100

Frameset_bf100: ; bf100 (2f:7100)
	db $00,  4
	db $ff
; 0xbf103

Frameset_bf103: ; bf103 (2f:7103)
	db $01,  1
	db $08,  1
	db $02,  1
	db $08,  1
	db $03,  1
	db $08,  1
	db $ff
; 0xbf110

Frameset_bf110: ; bf110 (2f:7110)
	db $03,  1
	db $08,  1
	db $04,  1
	db $08,  1
	db $05,  1
	db $08,  1
	db $04,  1
	db $08,  1
	db $03,  1
	db $08,  1
	db $06,  1
	db $08,  1
	db $07,  1
	db $08,  1
	db $06,  1
	db $08,  1
	db $ff
; 0xbf131

OAM_bf131:: ; bf131 (2f:7131)
	dw .frame_0

.frame_0
	frame_oam -16, -16, $08, 7 | OAMF_BANK1
	frame_oam -16,  -8, $0a, 7 | OAMF_BANK1
	frame_oam -16,   0, $0a, 7 | OAMF_BANK1
	frame_oam -16,   8, $0c, 7 | OAMF_BANK1
	frame_oam -16, -16, $0e, 5 | OAMF_BANK1
	frame_oam -16,  -8, $0e, 5 | OAMF_BANK1
	frame_oam -16,   0, $0e, 5 | OAMF_BANK1
	frame_oam -16,   8, $0e, 5 | OAMF_BANK1
	db $80
; 0xbf154

Frameset_bf154:: ; bf154 (2f:7154)
	db $00,  4
	db $ff
; 0xbf157

OAM_bf157: ; bf157 (2f:7157)
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

.frame_0
	frame_oam -16,  -8, $8a, 3 | OAMF_BANK1
	frame_oam -16,   0, $8c, 3 | OAMF_BANK1
	frame_oam -32,  -4, $88, 2 | OAMF_BANK1
	frame_oam -17,  -8, $8e, 4 | OAMF_BANK1
	frame_oam -17,   0, $90, 4 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,  -8, $8a, 3 | OAMF_BANK1
	frame_oam -16,   0, $8c, 3 | OAMF_BANK1
	frame_oam -17,  -8, $8e, 4 | OAMF_BANK1
	frame_oam -17,   0, $90, 4 | OAMF_BANK1
	frame_oam -29,   4, $e8, 4 | OAMF_BANK1
	frame_oam -32,  -4, $92, 2 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,  -8, $8a, 3 | OAMF_BANK1
	frame_oam -16,   0, $8c, 3 | OAMF_BANK1
	frame_oam -17,  -8, $8e, 4 | OAMF_BANK1
	frame_oam -17,   0, $90, 4 | OAMF_BANK1
	frame_oam -29,   4, $ea, 4 | OAMF_BANK1
	frame_oam -32,  -4, $92, 2 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,  -8, $8a, 3 | OAMF_BANK1
	frame_oam -16,   0, $8c, 3 | OAMF_BANK1
	frame_oam -17,  -8, $8e, 4 | OAMF_BANK1
	frame_oam -17,   0, $90, 4 | OAMF_BANK1
	frame_oam -29,   4, $ec, 4 | OAMF_BANK1
	frame_oam -32,  -4, $92, 2 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -16,  -8, $8a, 3 | OAMF_BANK1
	frame_oam -16,   0, $8c, 3 | OAMF_BANK1
	frame_oam -17,  -8, $8e, 4 | OAMF_BANK1
	frame_oam -17,   0, $90, 4 | OAMF_BANK1
	frame_oam -29,   4, $ee, 4 | OAMF_BANK1
	frame_oam -32,  -4, $92, 2 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16,  -8, $e0, 1 | OAMF_BANK1
	frame_oam -16,   0, $e2, 1 | OAMF_BANK1
	frame_oam -32,  -8, $e0, 1 | OAMF_BANK1
	frame_oam -32,   0, $e2, 1 | OAMF_BANK1
	frame_oam -48,  -8, $e0, 1 | OAMF_BANK1
	frame_oam -48,   0, $e2, 1 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16,  -8, $e0, 1 | OAMF_BANK1
	frame_oam -16,   0, $e2, 1 | OAMF_BANK1
	frame_oam -32,  -8, $e0, 1 | OAMF_BANK1
	frame_oam -32,   0, $e2, 1 | OAMF_BANK1
	frame_oam -48,  -8, $f0, 5 | OAMF_BANK1
	frame_oam -48,   0, $f2, 5 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16,  -8, $e0, 1 | OAMF_BANK1
	frame_oam -16,   0, $e2, 1 | OAMF_BANK1
	frame_oam -32,  -8, $e4, 1 | OAMF_BANK1
	frame_oam -32,   0, $e6, 1 | OAMF_BANK1
	frame_oam -32,  -8, $f4, 5 | OAMF_BANK1
	frame_oam -32,   0, $f6, 5 | OAMF_BANK1
	frame_oam -48,  -8, $f0, 5 | OAMF_BANK1
	frame_oam -48,   0, $f2, 5 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -16,  -8, $e0, 1 | OAMF_BANK1
	frame_oam -16,   0, $e2, 1 | OAMF_BANK1
	frame_oam -32,  -8, $f0, 5 | OAMF_BANK1
	frame_oam -32,   0, $f2, 5 | OAMF_BANK1
	frame_oam -48,  -8, $f0, 5 | OAMF_BANK1
	frame_oam -48,   0, $f2, 5 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -32,  -8, $f0, 5 | OAMF_BANK1
	frame_oam -32,   0, $f2, 5 | OAMF_BANK1
	frame_oam -48,  -8, $f0, 5 | OAMF_BANK1
	frame_oam -48,   0, $f2, 5 | OAMF_BANK1
	frame_oam -16,  -8, $e4, 1 | OAMF_BANK1
	frame_oam -16,   0, $e6, 1 | OAMF_BANK1
	frame_oam -16,  -8, $f4, 5 | OAMF_BANK1
	frame_oam -16,   0, $f6, 5 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -16,  -8, $f0, 5 | OAMF_BANK1
	frame_oam -16,   0, $f2, 5 | OAMF_BANK1
	frame_oam -32,  -8, $f0, 5 | OAMF_BANK1
	frame_oam -32,   0, $f2, 5 | OAMF_BANK1
	frame_oam -48,  -8, $f0, 5 | OAMF_BANK1
	frame_oam -48,   0, $f2, 5 | OAMF_BANK1
	db $80
; 0xbf28c

Frameset_bf28c: ; bf28c (2f:728c)
	db $00,  4
	db $ff
; 0xbf28f

Frameset_bf28f: ; bf28f (2f:728f)
	db $01,  4
	db $02,  4
	db $03,  4
	db $04,  4
	db $ff
; 0xbf298

Frameset_bf298: ; bf298 (2f:7298)
	db $05,  4
	db $06,  4
	db $07,  4
	db $08,  4
	db $09,  4
	db $0a,  4
	db $ff
; 0xbf2a5

Frameset_bf2a5: ; bf2a5 (2f:72a5)
	db $05,  4
	db $ff
; 0xbf2a8

Frameset_bf2a8: ; bf2a8 (2f:72a8)
	db $0a,  4
	db $ff
; 0xbf2ab

OAM_bf2ab: ; bf2ab (2f:72ab)
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
	frame_oam -32, -16, $96, 5
	frame_oam -32,  -8, $98, 5
	frame_oam -32,   0, $9a, 5
	frame_oam -32,   8, $9c, 5
	frame_oam -16, -16, $9e, 5
	frame_oam -16,  -8, $a0, 5
	frame_oam -16,   0, $a2, 5
	frame_oam -16,   8, $a4, 5
	frame_oam -32, -16, $94, 6
	frame_oam -32,  -8, $94, 6
	frame_oam -32,   0, $94, 6
	frame_oam -32,   8, $94, 6
	frame_oam -16, -16, $94, 6
	frame_oam -16,  -8, $94, 6
	frame_oam -16,   0, $94, 6
	frame_oam -16,   8, $94, 6
	db $80

.frame_1
	frame_oam -50, -15, $a6, 2
	frame_oam -50,  -7, $a8, 2
	frame_oam -50,   7, $a6, 3 | OAMF_XFLIP
	frame_oam -50,  -1, $a8, 3 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -48, -17, $aa, 2
	frame_oam -48,  -9, $ac, 2
	frame_oam -48,   9, $aa, 3 | OAMF_XFLIP
	frame_oam -48,   1, $ac, 3 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -50, -15, $ae, 2
	frame_oam -50,  -7, $b0, 2
	frame_oam -50,   7, $ae, 2 | OAMF_XFLIP
	frame_oam -50,  -1, $b0, 2 | OAMF_XFLIP
	frame_oam -36,  -5, $b4, 3
	frame_oam -36,  -5, $b2, 2
	db $80

.frame_4
	frame_oam   0,  -8, $b6, 4
	frame_oam   0,   0, $b6, 4 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam   0, -16, $b8, 4
	frame_oam   0,  -8, $ba, 4
	frame_oam   0,   8, $b8, 4 | OAMF_XFLIP
	frame_oam   0,   0, $ba, 4 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam   0, -16, $bc, 4
	frame_oam   0,  -8, $be, 4
	frame_oam   0,   8, $bc, 4 | OAMF_XFLIP
	frame_oam   0,   0, $be, 4 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam   0, -16, $c0, 4
	frame_oam   0,  -8, $c2, 4
	frame_oam   0,   8, $c0, 4 | OAMF_XFLIP
	frame_oam   0,   0, $c2, 4 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam   3, -16, $c0, 4
	frame_oam   3,  -8, $c2, 4
	frame_oam   3,   8, $c0, 4 | OAMF_XFLIP
	frame_oam   3,   0, $c2, 4 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam   6, -16, $c0, 4
	frame_oam   6,  -8, $c2, 4
	frame_oam   6,   8, $c0, 4 | OAMF_XFLIP
	frame_oam   6,   0, $c2, 4 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -50, -15, $ae, 2
	frame_oam -50,  -7, $b0, 2
	frame_oam -50,   7, $ae, 2 | OAMF_XFLIP
	frame_oam -50,  -1, $b0, 2 | OAMF_XFLIP
	frame_oam -33,  -5, $b4, 3
	frame_oam -33,  -5, $b2, 2
	db $80

.frame_11
	frame_oam -50, -15, $ae, 2
	frame_oam -50,  -7, $b0, 2
	frame_oam -50,   7, $ae, 2 | OAMF_XFLIP
	frame_oam -50,  -1, $b0, 2 | OAMF_XFLIP
	frame_oam -29,  -5, $b4, 3
	frame_oam -29,  -5, $b2, 2
	db $80

.frame_12
	frame_oam -50, -15, $ae, 2
	frame_oam -50,  -7, $b0, 2
	frame_oam -50,   7, $ae, 2 | OAMF_XFLIP
	frame_oam -50,  -1, $b0, 2 | OAMF_XFLIP
	frame_oam -25,  -5, $b4, 3
	frame_oam -25,  -5, $b2, 2
	db $80

.frame_13
	frame_oam -50, -15, $ae, 2
	frame_oam -50,  -7, $b0, 2
	frame_oam -50,   7, $ae, 2 | OAMF_XFLIP
	frame_oam -50,  -1, $b0, 2 | OAMF_XFLIP
	frame_oam -21,  -5, $b4, 3
	frame_oam -21,  -5, $b2, 2
	db $80

.frame_14
	frame_oam -50, -15, $ae, 2
	frame_oam -50,  -7, $b0, 2
	frame_oam -50,   7, $ae, 2 | OAMF_XFLIP
	frame_oam -50,  -1, $b0, 2 | OAMF_XFLIP
	frame_oam -17,  -5, $b4, 3
	frame_oam -17,  -5, $b2, 2
	db $80

.frame_15
	frame_oam -50, -15, $ae, 2
	frame_oam -50,  -7, $b0, 2
	frame_oam -50,   7, $ae, 2 | OAMF_XFLIP
	frame_oam -50,  -1, $b0, 2 | OAMF_XFLIP
	frame_oam -13,  -5, $b4, 3
	frame_oam -13,  -5, $b2, 2
	db $80
; 0xbf43b

Frameset_bf43b: ; bf43b (2f:743b)
	db $00,  4
	db $ff
; 0xbf43e

Frameset_bf43e: ; bf43e (2f:743e)
	db $01, 50
	db $02,  4
	db $03,  2
	db $0a,  2
	db $0b,  2
	db $0c,  2
	db $0d,  2
	db $0e,  2
	db $0f,  2
	db $04,  6
	db $05,  6
	db $06,  6
	db $07,  6
	db $08,  6
	db $09,  6
	db $ff
; 0xbf45d

Frameset_bf45d: ; bf45d (2f:745d)
	db $01,  2
	db $ff
; 0xbf460

OAM_bf460: ; bf460 (2f:7460)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7

.frame_0
	frame_oam -26, -20, $7c, 1 | OAMF_BANK1
	frame_oam -26,  12, $7c, 1 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -32, -29, $64, 1 | OAMF_BANK1
	frame_oam -32, -21, $66, 1 | OAMF_BANK1
	frame_oam -32, -13, $68, 1 | OAMF_BANK1
	frame_oam -32,  21, $64, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  13, $66, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,   5, $68, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -38, -29, $6a, 1 | OAMF_BANK1
	frame_oam -38, -21, $6c, 1 | OAMF_BANK1
	frame_oam -38, -13, $6e, 1 | OAMF_BANK1
	frame_oam -22, -29, $70, 1 | OAMF_BANK1
	frame_oam -22, -21, $72, 1 | OAMF_BANK1
	frame_oam -22, -13, $74, 1 | OAMF_BANK1
	frame_oam -38,  21, $6a, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -38,  13, $6c, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -38,   5, $6e, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22,  21, $70, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22,  13, $72, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22,   5, $74, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -38, -29, $6a, 1 | OAMF_BANK1
	frame_oam -38, -21, $6c, 1 | OAMF_BANK1
	frame_oam -38, -13, $6e, 1 | OAMF_BANK1
	frame_oam -38,  21, $6a, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -38,  13, $6c, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -38,   5, $6e, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22, -29, $76, 1 | OAMF_BANK1
	frame_oam -22, -21, $78, 1 | OAMF_BANK1
	frame_oam -22, -13, $7a, 1 | OAMF_BANK1
	frame_oam -22,  21, $76, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22,  13, $78, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22,   5, $7a, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -21, $7e, 1 | OAMF_BANK1
	frame_oam -20,  12, $7e, 1 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -38, -29, $6a, 1 | OAMF_BANK1
	frame_oam -38, -21, $6c, 1 | OAMF_BANK1
	frame_oam -38, -13, $6e, 1 | OAMF_BANK1
	frame_oam -38,  21, $6a, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -38,  13, $6c, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -38,   5, $6e, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22, -29, $76, 1 | OAMF_BANK1
	frame_oam -22, -21, $78, 1 | OAMF_BANK1
	frame_oam -22, -13, $7a, 1 | OAMF_BANK1
	frame_oam -22,  21, $76, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22,  13, $78, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22,   5, $7a, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -28, $7e, 1 | OAMF_BANK1
	frame_oam -20,   5, $7e, 1 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -38, -29, $6a, 1 | OAMF_BANK1
	frame_oam -38, -21, $6c, 1 | OAMF_BANK1
	frame_oam -38, -13, $6e, 1 | OAMF_BANK1
	frame_oam -38,  21, $6a, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -38,  13, $6c, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -38,   5, $6e, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22, -29, $76, 1 | OAMF_BANK1
	frame_oam -22, -21, $78, 1 | OAMF_BANK1
	frame_oam -22, -13, $7a, 1 | OAMF_BANK1
	frame_oam -22,  21, $76, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22,  13, $78, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22,   5, $7a, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -14, $7e, 1 | OAMF_BANK1
	frame_oam -20,  19, $7e, 1 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -38, -29, $6a, 1 | OAMF_BANK1
	frame_oam -38, -21, $6c, 1 | OAMF_BANK1
	frame_oam -38, -13, $6e, 1 | OAMF_BANK1
	frame_oam -38,  21, $6a, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -38,  13, $6c, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -38,   5, $6e, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22, -29, $76, 1 | OAMF_BANK1
	frame_oam -22, -21, $78, 1 | OAMF_BANK1
	frame_oam -22, -13, $7a, 1 | OAMF_BANK1
	frame_oam -22,  21, $76, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22,  13, $78, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22,   5, $7a, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -25, $7e, 1 | OAMF_BANK1
	frame_oam -20,   8, $7e, 1 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -38, -29, $6a, 1 | OAMF_BANK1
	frame_oam -38, -21, $6c, 1 | OAMF_BANK1
	frame_oam -38, -13, $6e, 1 | OAMF_BANK1
	frame_oam -38,  21, $6a, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -38,  13, $6c, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -38,   5, $6e, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22, -29, $76, 1 | OAMF_BANK1
	frame_oam -22, -21, $78, 1 | OAMF_BANK1
	frame_oam -22, -13, $7a, 1 | OAMF_BANK1
	frame_oam -22,  21, $76, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22,  13, $78, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -22,   5, $7a, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -17, $7e, 1 | OAMF_BANK1
	frame_oam -20,  16, $7e, 1 | OAMF_BANK1
	db $80
; 0xbf5e0

Frameset_bf5e0: ; bf5e0 (2f:75e0)
	db $00, 40
	db $01,  8
	db $02, 14
	db $01,  8
	db $00,  4
	db $01,  4
	db $02,  8
	db $01,  4
	db $00, 40
	db $01,  4
	db $02,  8
	db $01,  4
	db $03, 40
	db $06,  4
	db $04, 50
	db $06,  4
	db $03,  4
	db $07,  4
	db $05, 50
	db $07,  4
	db $03, 40
	db $01,  4
	db $02, 20
	db $01,  4
	db $ff
; 0xbf611

OAM_bf611: ; bf611 (2f:7611)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3

.frame_0
	frame_oam -20, -12, $c4, 2
	frame_oam -20,  -4, $c6, 2
	frame_oam -18,   4, $c8, 2
	frame_oam  -4, -12, $ca, 2
	frame_oam  -4,  -4, $cc, 2
	db $80

.frame_1
	frame_oam -20, -11, $c4, 2
	frame_oam -20,  -3, $c6, 2
	frame_oam -18,   5, $c8, 2
	frame_oam  -4, -11, $ca, 2
	frame_oam  -4,  -3, $cc, 2
	db $80

.frame_2
	frame_oam   0,   0, $d4, 1
	frame_oam -16,   0, $d6, 1
	frame_oam -16,   8, $d8, 1
	db $80

.frame_3
	frame_oam -19,   6, $d0, 1
	frame_oam -19,  14, $d2, 1
	frame_oam -11,  -2, $ce, 1
	db $80
; 0xbf65d

Frameset_bf65d: ; bf65d (2f:765d)
	db $00,  4
	db $ff
; 0xbf660

Frameset_bf660: ; bf660 (2f:7660)
	db $00,  4
	db $01,  4
	db $ff
; 0xbf665

Frameset_bf665: ; bf665 (2f:7665)
	db $03,  4
	db $ff
; 0xbf668

Frameset_bf668: ; bf668 (2f:7668)
	db $03,  4
	db $02, 20
	db $ff
; 0xbf66d

OAM_bf66d: ; bf66d (2f:766d)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5

.frame_0
	frame_oam -14,  -4, $72, 2
	frame_oam -30,  -4, $60, 4
	frame_oam -30,   4, $62, 3
	frame_oam -30, -12, $62, 3 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -29, -18, $64, 3
	frame_oam -29, -10, $66, 4
	frame_oam -29,  -2, $68, 3
	frame_oam -13,  -6, $74, 2
	db $80

.frame_2
	frame_oam -19, -23, $6a, 3
	frame_oam  -3, -24, $6c, 3
	frame_oam   3, -23, $6a, 3 | OAMF_YFLIP
	frame_oam  -3, -16, $76, 2
	frame_oam  -3,  -8, $78, 2
	db $80

.frame_3
	frame_oam  -1, -16, $6e, 2
	frame_oam  -2,  -8, $70, 2
	frame_oam -15, -23, $6a, 3
	frame_oam   1, -24, $6c, 3
	frame_oam   7, -23, $6a, 3 | OAMF_YFLIP
	db $80

.frame_4
	frame_oam -15, -16, $6e, 2 | OAMF_YFLIP
	frame_oam -14,  -8, $70, 2 | OAMF_YFLIP
	frame_oam -23, -23, $6a, 3
	frame_oam  -7, -24, $6c, 3
	frame_oam  -1, -23, $6a, 3 | OAMF_YFLIP
	db $80

.frame_5
	frame_oam  -8,  -4, $7a, 1
	db $80
; 0xbf6df

Frameset_bf6df: ; bf6df (2f:76df)
	db $00,  4
	db $ff
; 0xbf6e2

Frameset_bf6e2: ; bf6e2 (2f:76e2)
	db $00,  4
	db $01,  4
	db $04,  4
	db $02,  4
	db $03,  4
	db $ff
; 0xbf6ed

Frameset_bf6ed: ; bf6ed (2f:76ed)
	db $05,  4
	db $ff
; 0xbf6f0

OAM_bf6f0: ; bf6f0 (2f:76f0)
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
	frame_oam -16,   0, $e2, 7 | OAMF_BANK1
	frame_oam -16,   0, $ec, 2 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -29,  -4, $e0, 5 | OAMF_BANK1
	frame_oam -35,  -4, $dc, 4 | OAMF_BANK1
	frame_oam -35, -12, $de, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -35,   4, $de, 3 | OAMF_BANK1
	frame_oam -19,  -8, $f0, 4 | OAMF_BANK1
	frame_oam -19,   0, $f2, 4 | OAMF_BANK1
	frame_oam -13,  -4, $da, 3 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -28,  -4, $e0, 5 | OAMF_BANK1
	frame_oam -34,  -4, $dc, 4 | OAMF_BANK1
	frame_oam -34, -12, $de, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -34,   4, $de, 3 | OAMF_BANK1
	frame_oam -18,  -8, $f0, 4 | OAMF_BANK1
	frame_oam -18,   0, $f2, 4 | OAMF_BANK1
	frame_oam -14,  -4, $da, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -29,  -4, $e0, 5 | OAMF_BANK1
	frame_oam -35,  -4, $dc, 4 | OAMF_BANK1
	frame_oam -35, -12, $de, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -35,   4, $de, 3 | OAMF_BANK1
	frame_oam -19,  -8, $f0, 4 | OAMF_BANK1
	frame_oam -19,   0, $f2, 4 | OAMF_BANK1
	frame_oam -13,  -4, $da, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -28,  -4, $e0, 5 | OAMF_BANK1
	frame_oam -34,  -4, $dc, 4 | OAMF_BANK1
	frame_oam -34, -12, $de, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -34,   4, $de, 3 | OAMF_BANK1
	frame_oam -18,  -8, $f0, 4 | OAMF_BANK1
	frame_oam -18,   0, $f2, 4 | OAMF_BANK1
	frame_oam -14,  -4, $da, 3 | OAMF_BANK1
	db $80

.frame_5
	frame_oam  -8,  -4, $ee, 7 | OAMF_BANK1
	db $80

.frame_6
	frame_oam   0,  -8, $e4, 2 | OAMF_BANK1
	frame_oam   0,   0, $e4, 2 | OAMF_BANK1
	db $80

.frame_7
	frame_oam   0,  -8, $e6, 2 | OAMF_BANK1
	frame_oam   0,   0, $e6, 2 | OAMF_BANK1
	db $80

.frame_8
	frame_oam   0,  -8, $e8, 2 | OAMF_BANK1
	frame_oam   0,   0, $e8, 2 | OAMF_BANK1
	db $80

.frame_9
	frame_oam   0,  -8, $ea, 2 | OAMF_BANK1
	frame_oam   0,   0, $ea, 2 | OAMF_BANK1
	db $80

.frame_10
	frame_oam   0,  -8, $e4, 2 | OAMF_BANK1
	frame_oam   0,   0, $e4, 2 | OAMF_BANK1
	frame_oam -16,   0, $e4, 2 | OAMF_BANK1
	frame_oam -32,  -8, $e4, 2 | OAMF_BANK1
	frame_oam -32,   0, $e4, 2 | OAMF_BANK1
	frame_oam -48,   0, $e4, 2 | OAMF_BANK1
	frame_oam -48,  -8, $e4, 2 | OAMF_BANK1
	db $80

.frame_11
	frame_oam   0,  -8, $e6, 2 | OAMF_BANK1
	frame_oam   0,   0, $e6, 2 | OAMF_BANK1
	frame_oam -16,   0, $e6, 2 | OAMF_BANK1
	frame_oam -32,   0, $e6, 2 | OAMF_BANK1
	frame_oam -32,  -8, $e6, 2 | OAMF_BANK1
	frame_oam -48,  -8, $e6, 2 | OAMF_BANK1
	frame_oam -48,   0, $e6, 2 | OAMF_BANK1
	db $80

.frame_12
	frame_oam   0,  -8, $e8, 2 | OAMF_BANK1
	frame_oam   0,   0, $e8, 2 | OAMF_BANK1
	frame_oam -16,   0, $e8, 2 | OAMF_BANK1
	frame_oam -32,  -8, $e8, 2 | OAMF_BANK1
	frame_oam -32,   0, $e8, 2 | OAMF_BANK1
	frame_oam -48,  -8, $e8, 2 | OAMF_BANK1
	frame_oam -48,   0, $e8, 2 | OAMF_BANK1
	db $80

.frame_13
	frame_oam   0,  -8, $ea, 2 | OAMF_BANK1
	frame_oam   0,   0, $ea, 2 | OAMF_BANK1
	frame_oam -16,   0, $ea, 2 | OAMF_BANK1
	frame_oam -32,  -8, $ea, 2 | OAMF_BANK1
	frame_oam -32,   0, $ea, 2 | OAMF_BANK1
	frame_oam -48,  -8, $ea, 2 | OAMF_BANK1
	frame_oam -48,   0, $ea, 2 | OAMF_BANK1
	db $80
; 0xbf826

Frameset_bf826: ; bf826 (2f:7826)
	db $00,  4
	db $ff
; 0xbf829

Frameset_bf829: ; bf829 (2f:7829)
	db $01,  4
	db $02,  4
	db $03,  4
	db $04,  4
	db $ff
; 0xbf832

Frameset_bf832: ; bf832 (2f:7832)
	db $05,  4
	db $ff
; 0xbf835

Frameset_bf835: ; bf835 (2f:7835)
	db $06,  3
	db $07,  3
	db $08,  3
	db $09,  3
	db $ff
; 0xbf83e

Frameset_bf83e: ; bf83e (2f:783e)
	db $0a,  3
	db $0b,  3
	db $0c,  3
	db $0d,  3
	db $ff
; 0xbf847

OAM_bf847:: ; bf847 (2f:7847)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3

.frame_0
	frame_oam -40, -12, $88, 2
	frame_oam -63,  -8, $84, 2
	frame_oam -59,   0, $88, 2
	frame_oam -52,   8, $86, 2
	frame_oam -60,   4, $84, 2
	frame_oam -32,  -8, $70, 5
	frame_oam -32,   0, $72, 5
	frame_oam -32,   8, $74, 5
	frame_oam -16,  -8, $76, 5
	frame_oam -16,   0, $78, 5
	frame_oam -16,   8, $7a, 5
	frame_oam -31,  -6, $7c, 4
	frame_oam -47,   0, $80, 6
	frame_oam -51,   8, $82, 6
	frame_oam -50,  -8, $7e, 6
	frame_oam -72,   0, $86, 2
	db $80

.frame_1
	frame_oam -40, -12, $84, 2
	frame_oam -64,  -8, $86, 2
	frame_oam -59,   0, $84, 2
	frame_oam -52,   8, $88, 2
	frame_oam -60,   4, $86, 2
	frame_oam -32,  -8, $70, 5
	frame_oam -32,   0, $72, 5
	frame_oam -32,   8, $74, 5
	frame_oam -16,  -8, $76, 5
	frame_oam -16,   0, $78, 5
	frame_oam -16,   8, $7a, 5
	frame_oam -31,  -6, $7c, 4
	frame_oam -47,   0, $80, 6
	frame_oam -51,   8, $82, 6
	frame_oam -50,  -8, $7e, 6
	frame_oam -72,   0, $88, 2
	db $80

.frame_2
	frame_oam -40, -12, $86, 2
	frame_oam -64,  -8, $88, 2
	frame_oam -59,   0, $86, 2
	frame_oam -52,   8, $84, 2
	frame_oam -60,   4, $88, 2
	frame_oam -32,  -8, $70, 5
	frame_oam -32,   0, $72, 5
	frame_oam -32,   8, $74, 5
	frame_oam -16,  -8, $76, 5
	frame_oam -16,   0, $78, 5
	frame_oam -16,   8, $7a, 5
	frame_oam -31,  -6, $7c, 4
	frame_oam -47,   0, $80, 6
	frame_oam -51,   8, $82, 6
	frame_oam -50,  -8, $7e, 6
	frame_oam -72,   0, $84, 2
	db $80

.frame_3
	frame_oam -16,  -8, $90, 5
	frame_oam -16,   0, $92, 5
	frame_oam -32,  -8, $8c, 6
	frame_oam -32,   0, $8e, 6
	db $80
; 0xbf923

Frameset_bf923:: ; bf923 (2f:7923)
	db $00,  4
	db $01,  4
	db $02,  4
	db $ff
; 0xbf92a

Frameset_bf92a:: ; bf92a (2f:792a)
	db $03,  4
	db $ff
; 0xbf92d
