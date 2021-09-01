	INCROM $1dc000, $1dc93f

OAM_1dc93f: ; 1dc93f (77:493f)
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

.frame_0
	frame_oam -32, -11, $00, $00
	frame_oam -32,  -3, $02, $00
	frame_oam -32,   5, $04, $00
	frame_oam -16, -16, $06, $00
	frame_oam -16,  -8, $08, $00
	frame_oam -16,   0, $0a, $00
	frame_oam -16,   8, $0c, $00
	db $80

.frame_1
	frame_oam -33, -10, $0e, $00
	frame_oam -33,  -2, $10, $00
	frame_oam -33,   6, $12, $00
	frame_oam -17, -16, $14, $00
	frame_oam -17,  -8, $16, $00
	frame_oam -17,   0, $18, $00
	frame_oam -17,   8, $1a, $00
	db $80

.frame_2
	frame_oam -35, -13, $1c, $00
	frame_oam -35,  -5, $1e, $00
	frame_oam -35,   3, $20, $00
	frame_oam -19, -15, $22, $00
	frame_oam -19,  -7, $24, $00
	frame_oam -19,   1, $26, $00
	frame_oam -19,   9, $28, $00
	db $80

.frame_3
	frame_oam -39, -16, $2a, $00
	frame_oam -39,  -8, $2c, $00
	frame_oam -39,   0, $2e, $00
	frame_oam -39,   8, $30, $00
	frame_oam -23, -16, $32, $00
	frame_oam -23,  -8, $34, $00
	frame_oam -23,   0, $36, $00
	frame_oam -23,   8, $38, $00
	db $80

.frame_4
	frame_oam -39, -16, $3a, $00
	frame_oam -39,  -8, $3c, $00
	frame_oam -39,   0, $3e, $00
	frame_oam -39,   8, $40, $00
	frame_oam -23, -16, $42, $00
	frame_oam -23,  -8, $44, $00
	frame_oam -23,   0, $46, $00
	frame_oam -23,   8, $48, $00
	db $80

.frame_5
	frame_oam -39, -16, $4a, $00
	frame_oam -39,  -8, $4c, $00
	frame_oam -39,   8, $4a, $20
	frame_oam -39,   0, $4c, $20
	frame_oam -23, -16, $4e, $00
	frame_oam -23,  -8, $50, $00
	frame_oam -23,   8, $4e, $20
	frame_oam -23,   0, $50, $20
	db $80

.frame_6
	frame_oam -32,   3, $00, $20
	frame_oam -32,  -5, $02, $20
	frame_oam -32, -13, $04, $20
	frame_oam -16,   8, $06, $20
	frame_oam -16,   0, $08, $20
	frame_oam -16,  -8, $0a, $20
	frame_oam -16, -16, $0c, $20
	db $80

.frame_7
	frame_oam -33,   2, $0e, $20
	frame_oam -33,  -6, $10, $20
	frame_oam -33, -14, $12, $20
	frame_oam -17,   8, $14, $20
	frame_oam -17,   0, $16, $20
	frame_oam -17,  -8, $18, $20
	frame_oam -17, -16, $1a, $20
	db $80

.frame_8
	frame_oam -35,   5, $1c, $20
	frame_oam -35,  -3, $1e, $20
	frame_oam -35, -11, $20, $20
	frame_oam -19,   7, $22, $20
	frame_oam -19,  -1, $24, $20
	frame_oam -19,  -9, $26, $20
	frame_oam -19, -17, $28, $20
	db $80

.frame_9
	frame_oam -39,   8, $2a, $20
	frame_oam -39,   0, $2c, $20
	frame_oam -39,  -8, $2e, $20
	frame_oam -39, -16, $30, $20
	frame_oam -23,   8, $32, $20
	frame_oam -23,   0, $34, $20
	frame_oam -23,  -8, $36, $20
	frame_oam -23, -16, $38, $20
	db $80

.frame_10
	frame_oam -39,   8, $3a, $20
	frame_oam -39,   0, $3c, $20
	frame_oam -39,  -8, $3e, $20
	frame_oam -39, -16, $40, $20
	frame_oam -23,   8, $42, $20
	frame_oam -23,   0, $44, $20
	frame_oam -23,  -8, $46, $20
	frame_oam -23, -16, $48, $20
	db $80

.frame_11
	frame_oam -39, -16, $2a, $00
	frame_oam -39,  -8, $2c, $00
	frame_oam -39,   0, $2e, $00
	frame_oam -39,   8, $30, $00
	frame_oam -23, -16, $32, $00
	frame_oam -23,   0, $36, $00
	frame_oam -23,   8, $38, $00
	frame_oam -23,  -8, $52, $00
	db $80

.frame_12
	frame_oam -39, -16, $2a, $00
	frame_oam -39,  -8, $2c, $00
	frame_oam -39,   0, $2e, $00
	frame_oam -39,   8, $30, $00
	frame_oam -23, -16, $32, $00
	frame_oam -23,   0, $36, $00
	frame_oam -23,   8, $38, $00
	frame_oam -23,  -8, $54, $00
	db $80

.frame_13
	frame_oam -40, -13, $1c, $00
	frame_oam -40,  -5, $1e, $00
	frame_oam -40,   3, $20, $00
	frame_oam -24, -15, $22, $00
	frame_oam -24,   1, $26, $00
	frame_oam -24,   9, $28, $00
	frame_oam -24,  -7, $56, $00
	db $80

.frame_14
	frame_oam -40, -13, $1c, $00
	frame_oam -40,  -5, $1e, $00
	frame_oam -40,   3, $20, $00
	frame_oam -24, -15, $22, $00
	frame_oam -24,  -7, $24, $00
	frame_oam -24,   1, $26, $00
	frame_oam -24,   9, $28, $00
	db $80

.frame_15
	frame_oam -39, -10, $0e, $00
	frame_oam -39,  -2, $10, $00
	frame_oam -39,   6, $12, $00
	frame_oam -23, -16, $14, $00
	frame_oam -23,  -8, $16, $00
	frame_oam -23,   0, $18, $00
	frame_oam -23,   8, $1a, $00
	db $80

.frame_16
	frame_oam -39,   8, $2a, $20
	frame_oam -39,   0, $2c, $20
	frame_oam -39,  -8, $2e, $20
	frame_oam -39, -16, $30, $20
	frame_oam -23,   8, $32, $20
	frame_oam -23,  -8, $36, $20
	frame_oam -23, -16, $38, $20
	frame_oam -23,   0, $52, $20
	db $80

.frame_17
	frame_oam -39,   8, $2a, $20
	frame_oam -39,   0, $2c, $20
	frame_oam -39,  -8, $2e, $20
	frame_oam -39, -16, $30, $20
	frame_oam -23,   8, $32, $20
	frame_oam -23,  -8, $36, $20
	frame_oam -23, -16, $38, $20
	frame_oam -23,   0, $54, $20
	db $80

.frame_18
	frame_oam -40,   5, $1c, $20
	frame_oam -40,  -3, $1e, $20
	frame_oam -40, -11, $20, $20
	frame_oam -24,   7, $22, $20
	frame_oam -24,  -9, $26, $20
	frame_oam -24, -17, $28, $20
	frame_oam -24,  -1, $56, $20
	db $80

.frame_19
	frame_oam -40,   5, $1c, $20
	frame_oam -40,  -3, $1e, $20
	frame_oam -40, -11, $20, $20
	frame_oam -24,   7, $22, $20
	frame_oam -24,  -1, $24, $20
	frame_oam -24,  -9, $26, $20
	frame_oam -24, -17, $28, $20
	db $80

.frame_20
	frame_oam -39,   2, $0e, $20
	frame_oam -39,  -6, $10, $20
	frame_oam -39, -14, $12, $20
	frame_oam -23,   8, $14, $20
	frame_oam -23,   0, $16, $20
	frame_oam -23,  -8, $18, $20
	frame_oam -23, -16, $1a, $20
	db $80

.frame_21
	frame_oam -39, -16, $2a, $00
	frame_oam -39,  -8, $2c, $00
	frame_oam -39,   0, $2e, $00
	frame_oam -39,   8, $30, $00
	frame_oam -23, -16, $60, $00
	frame_oam -23,  -8, $62, $00
	frame_oam -23,   0, $64, $00
	frame_oam -23,   8, $66, $00
	db $80

.frame_22
	frame_oam -38, -16, $2a, $00
	frame_oam -38,  -8, $2c, $00
	frame_oam -38,   0, $2e, $00
	frame_oam -38,   8, $30, $00
	frame_oam -22, -16, $68, $00
	frame_oam -22,  -8, $6a, $00
	frame_oam -22,   0, $6c, $00
	frame_oam -22,   8, $6e, $00
	db $80

.frame_23
	frame_oam -37, -16, $2a, $00
	frame_oam -37,  -8, $2c, $00
	frame_oam -37,   0, $2e, $00
	frame_oam -37,   8, $30, $00
	frame_oam -21, -16, $70, $00
	frame_oam -21,  -8, $72, $00
	frame_oam -21,   0, $74, $00
	frame_oam -21,   8, $76, $00
	db $80

.frame_24
	frame_oam -39,   8, $2a, $20
	frame_oam -39,   0, $2c, $20
	frame_oam -39,  -8, $2e, $20
	frame_oam -39, -16, $30, $20
	frame_oam -23,   8, $60, $20
	frame_oam -23,   0, $62, $20
	frame_oam -23,  -8, $64, $20
	frame_oam -23, -16, $66, $20
	db $80

.frame_25
	frame_oam -38,   8, $2a, $20
	frame_oam -38,   0, $2c, $20
	frame_oam -38,  -8, $2e, $20
	frame_oam -38, -16, $30, $20
	frame_oam -22,   8, $68, $20
	frame_oam -22,   0, $6a, $20
	frame_oam -22,  -8, $6c, $20
	frame_oam -22, -16, $6e, $20
	db $80

.frame_26
	frame_oam -37,   8, $2a, $20
	frame_oam -37,   0, $2c, $20
	frame_oam -37,  -8, $2e, $20
	frame_oam -37, -16, $30, $20
	frame_oam -21,   8, $70, $20
	frame_oam -21,   0, $72, $20
	frame_oam -21,  -8, $74, $20
	frame_oam -21, -16, $76, $20
	db $80
; 0x1dccc0

Frameset_1dccc0: ; 1dccc0 (77:4cc0)
	db $00,  8
	db $01,  9
	db $02,  7
	db $03,  7
	db $ff
; 0x1dccc9

Frameset_1dccc9: ; 1dccc9 (77:4cc9)
	db $06,  8
	db $07,  9
	db $08,  7
	db $09,  7
	db $ff
; 0x1dccd2

	INCROM $1dccd2, $1dd230

Frameset_1dd230: ; 1dd230 (77:5230)
	db $03,  2
	db $04,  1
	db $05,  3
	db $04,  1
	db $03,  2
	db $ff
; 0x1dd23b

	INCROM $1dd23b, $1dd26c

Frameset_1dd26c: ; 1dd26c (77:526c)
	db $08, 60
	db $ff
; 0x1dd26f

	INCROM $1dd26f, $1dd27a

Frameset_1dd27a: ; 1dd27a (77:527a)
	db $08,  1
	db $0b,  1
	db $12,  2
	db $13,  2
	db $11,  2
	db $02,  1
	db $ff
; 0x1dd287

Frameset_1dd287: ; 1dd287 (77:5287)
	db $02,  2
	db $08,  3
	db $0b,  2
	db $ff
; 0x1dd28e

Frameset_1dd28e: ; 1dd28e (77:528e)
	db $0b,  2
	db $08,  3
	db $02,  2
	db $ff
; 0x1dd295

Frameset_1dd295: ; 1dd295 (77:5295)
	db $0c,  2
	db $0d,  1
	db $0e,  3
	db $0d,  1
	db $0c,  2
	db $ff
; 0x1dd2a0

	INCROM $1dd2a0, $1dd2d1

Frameset_1dd2d1: ; 1dd2d1 (77:52d1)
	db $0a,  2
	db $09,  2
	db $0f,  3
	db $10,  5
	db $0a,  2
	db $ff
; 0x1dd2dc

	INCROM $1dd2dc, $1dd2ee

Frameset_1dd2ee: ; 1dd2ee (77:52ee)
	db $16,  7
	db $17,  7
	db $ff
; 0x1dd2f3

Frameset_1dd2f3: ; 1dd2f3 (77:52f3)
	db $02,  2
	db $ff
; 0x1dd2f6

Frameset_1dd2f6: ; 1dd2f6 (77:52f6)
	db $0b,  2
	db $ff
; 0x1dd2f9

	INCROM $1dd2f9, $1dd330

