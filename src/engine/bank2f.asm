OAM_bc000: ; bc000 (2f:4000)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6

.frame_0
	frame_oam -32,   8, $20, 2 | TILE_BANK
	frame_oam -32,  16, $22, 2 | TILE_BANK
	db $80

.frame_1
	frame_oam -36,  -6, $16, 2 | TILE_BANK
	frame_oam -48,   2, $18, 2 | TILE_BANK
	frame_oam -48,  10, $1a, 2 | TILE_BANK
	frame_oam -32,  -8, $1c, 2 | TILE_BANK
	frame_oam -32,   0, $1e, 2 | TILE_BANK
	frame_oam -16,  -8, $24, 3 | TILE_BANK
	frame_oam -16,   0, $26, 3 | TILE_BANK
	frame_oam -16,   8, $28, 3 | TILE_BANK
	db $80

.frame_2
	frame_oam -32, -16, $20, 2 | TILE_BANK | X_FLIP
	frame_oam -32, -24, $22, 2 | TILE_BANK | X_FLIP
	db $80

.frame_3
	frame_oam -36,  -2, $16, 2 | TILE_BANK | X_FLIP
	frame_oam -48, -10, $18, 2 | TILE_BANK | X_FLIP
	frame_oam -48, -18, $1a, 2 | TILE_BANK | X_FLIP
	frame_oam -32,   0, $1c, 2 | TILE_BANK | X_FLIP
	frame_oam -32,  -8, $1e, 2 | TILE_BANK | X_FLIP
	frame_oam -16,   0, $24, 3 | TILE_BANK | X_FLIP
	frame_oam -16,  -8, $26, 3 | TILE_BANK | X_FLIP
	frame_oam -16, -16, $28, 3 | TILE_BANK | X_FLIP
	db $80

.frame_4
	frame_oam -36, -30, $16, 2 | TILE_BANK
	frame_oam -48, -22, $18, 2 | TILE_BANK
	frame_oam -48, -14, $1a, 2 | TILE_BANK
	frame_oam -32, -32, $1c, 2 | TILE_BANK
	frame_oam -32, -24, $1e, 2 | TILE_BANK
	frame_oam -16, -32, $24, 3 | TILE_BANK
	frame_oam -16, -24, $26, 3 | TILE_BANK
	frame_oam -16, -16, $28, 3 | TILE_BANK
	frame_oam -32, -16, $20, 2 | TILE_BANK
	frame_oam -32,  -8, $22, 2 | TILE_BANK
	frame_oam -36,  22, $16, 2 | TILE_BANK | X_FLIP
	frame_oam -48,  14, $18, 2 | TILE_BANK | X_FLIP
	frame_oam -48,   6, $1a, 2 | TILE_BANK | X_FLIP
	frame_oam -32,  24, $1c, 2 | TILE_BANK | X_FLIP
	frame_oam -32,  16, $1e, 2 | TILE_BANK | X_FLIP
	frame_oam -16,  24, $24, 3 | TILE_BANK | X_FLIP
	frame_oam -16,  16, $26, 3 | TILE_BANK | X_FLIP
	frame_oam -16,   8, $28, 3 | TILE_BANK | X_FLIP
	frame_oam -32,   8, $20, 2 | TILE_BANK | X_FLIP
	frame_oam -32,   0, $22, 2 | TILE_BANK | X_FLIP
	db $80

.frame_5
	frame_oam -38,   2, $00, 2 | TILE_BANK
	frame_oam -38,  10, $02, 2 | TILE_BANK
	frame_oam -38,  18, $04, 2 | TILE_BANK
	frame_oam -29,   0, $06, 2 | TILE_BANK
	frame_oam -22,   8, $08, 2 | TILE_BANK
	frame_oam -22,  16, $0a, 2 | TILE_BANK
	frame_oam -29,  24, $0c, 2 | TILE_BANK
	frame_oam -12,  16, $0e, 3 | TILE_BANK
	frame_oam -24,  24, $10, 3 | TILE_BANK
	frame_oam  -8,  24, $12, 3 | TILE_BANK
	frame_oam -13,  32, $14, 3 | TILE_BANK
	db $80

.frame_6
	frame_oam -38, -10, $00, 2 | TILE_BANK | X_FLIP
	frame_oam -38, -18, $02, 2 | TILE_BANK | X_FLIP
	frame_oam -38, -26, $04, 2 | TILE_BANK | X_FLIP
	frame_oam -29,  -8, $06, 2 | TILE_BANK | X_FLIP
	frame_oam -22, -16, $08, 2 | TILE_BANK | X_FLIP
	frame_oam -22, -24, $0a, 2 | TILE_BANK | X_FLIP
	frame_oam -29, -32, $0c, 2 | TILE_BANK | X_FLIP
	frame_oam -12, -24, $0e, 3 | TILE_BANK | X_FLIP
	frame_oam -24, -32, $10, 3 | TILE_BANK | X_FLIP
	frame_oam  -8, -32, $12, 3 | TILE_BANK | X_FLIP
	frame_oam -13, -40, $14, 3 | TILE_BANK | X_FLIP
	db $80
; 0xbc10d

	INCROM $bc10d, $bc122

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
	frame_oam -48,  16, $34, 0 | X_FLIP
	frame_oam -48,   8, $36, 0 | X_FLIP
	frame_oam -48,   0, $38, 0 | X_FLIP
	db $80

.frame_2
	frame_oam -48,  16, $3a, 0 | X_FLIP
	frame_oam -48,   8, $3c, 0 | X_FLIP
	frame_oam -48,   0, $3e, 0 | X_FLIP
	frame_oam -48,  -8, $40, 0 | X_FLIP
	frame_oam -32,   0, $42, 0 | X_FLIP
	frame_oam -32,  -8, $44, 0 | X_FLIP
	db $80

.frame_3
	frame_oam -48,  16, $46, 0 | X_FLIP
	frame_oam -48,   8, $48, 0 | X_FLIP
	frame_oam -48,   0, $4a, 0 | X_FLIP
	frame_oam -48,  -8, $4c, 0 | X_FLIP
	frame_oam -32,   0, $4e, 0 | X_FLIP
	frame_oam -32,  -8, $50, 0 | X_FLIP
	frame_oam -16,   0, $52, 0 | X_FLIP
	frame_oam -16,  -8, $54, 0 | X_FLIP
	db $80

.frame_4
	frame_oam -48,   0, $56, 0 | X_FLIP
	frame_oam -48,  -8, $58, 0 | X_FLIP
	frame_oam -32,   0, $5a, 0 | X_FLIP
	frame_oam -32,  -8, $5c, 0 | X_FLIP
	frame_oam -16,   8, $60, 0 | X_FLIP
	frame_oam -16,   0, $62, 0 | X_FLIP
	frame_oam -16,  -8, $64, 0 | X_FLIP
	frame_oam -16,  16, $5e, 0 | X_FLIP
	db $80

.frame_5
	frame_oam -16,  16, $68, 0 | X_FLIP
	frame_oam -16,   8, $6a, 0 | X_FLIP
	frame_oam -16,   0, $6c, 0 | X_FLIP
	frame_oam -16,  -8, $6e, 0 | X_FLIP
	frame_oam -32,  -8, $66, 0 | X_FLIP
	db $80
; 0xbc1e8

	INCROM $bc1e8, $bd1fd

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
	frame_oam -17,   2, $04, 0 | X_FLIP
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
	frame_oam -17,   2, $04, 0 | X_FLIP
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
	frame_oam -28,  -6, $20, 1 | Y_FLIP
	frame_oam -17,  -4, $24, 1
	db $80

.frame_8
	frame_oam  -1,  -7, $2a, 1
	frame_oam -28,  -6, $20, 1 | Y_FLIP
	frame_oam -17,  -4, $24, 1
	frame_oam   7,  -7, $2a, 1
	frame_oam -39,  -8, $2a, 1 | Y_FLIP
	db $80

.frame_9
	frame_oam  -1,  -7, $2a, 1
	frame_oam -28,  -6, $20, 1 | Y_FLIP
	frame_oam -17,  -4, $24, 1
	frame_oam   7,  -7, $2a, 1
	frame_oam -39,  -8, $2a, 1 | Y_FLIP
	frame_oam -47,  -8, $2a, 1 | Y_FLIP
	db $80

.frame_10
	frame_oam  -1,  -7, $2a, 1
	frame_oam -28,  -6, $20, 1 | Y_FLIP
	frame_oam -17,  -4, $24, 1
	frame_oam -39,  -8, $2a, 1 | Y_FLIP
	frame_oam   7,  -7, $2a, 1
	frame_oam -47,  -8, $2a, 1 | Y_FLIP
	frame_oam -55,  -8, $2a, 1 | Y_FLIP
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
	frame_oam -17,   2, $04, 0 | X_FLIP
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
	frame_oam   0,   0, $36, 4 | X_FLIP
	db $80

.frame_2
	frame_oam   0,  -8, $36, 4
	frame_oam   0,   0, $36, 4 | X_FLIP
	frame_oam -16,  -9, $3c, 4
	frame_oam -16,  -1, $3e, 4
	db $80

.frame_3
	frame_oam   0,  -8, $36, 4
	frame_oam   0,   0, $36, 4 | X_FLIP
	frame_oam -16, -14, $40, 4
	frame_oam -16,  -6, $42, 4
	frame_oam -16,   2, $44, 4
	db $80

.frame_4
	frame_oam   0,  -8, $36, 4
	frame_oam   0,   0, $36, 4 | X_FLIP
	frame_oam -16, -17, $46, 4
	frame_oam -16,  -9, $48, 4
	frame_oam -16,  -1, $4a, 4
	frame_oam -16,   7, $4c, 4
	db $80

.frame_5
	frame_oam   0,  -7, $36, 4
	frame_oam   0,  -1, $36, 4 | X_FLIP
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

	INCROM $bd43a, $bd453

OAM_bd453: ; bd453 (2f:5453)
	dw .frame_0
	dw .frame_1

.frame_0
	frame_oam -46,  -5, $9a, 4
	frame_oam -46,   3, $9c, 4
	db $80

.frame_1
	frame_oam -46,  -3, $9a, 5 | X_FLIP
	frame_oam -46, -11, $9c, 5 | X_FLIP
	db $80
; 0xbd469

	INCROM $bd469, $bd46f

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
	frame_oam -32,   4, $7e, 1 | X_FLIP
	frame_oam -16,   4, $80, 1 | X_FLIP
	frame_oam -35,  -8, $7a, 2
	frame_oam -19,  -8, $7c, 3
	frame_oam -35,   0, $7a, 2 | X_FLIP
	frame_oam -19,   0, $7c, 3 | X_FLIP
	db $80

.frame_1
	frame_oam -32, -12, $7e, 5
	frame_oam -16, -12, $80, 5
	frame_oam -45,  -4, $82, 5
	frame_oam  -3,  -4, $84, 5
	frame_oam -32,   4, $7e, 5 | X_FLIP
	frame_oam -16,   4, $80, 5 | X_FLIP
	frame_oam -35,  -8, $7a, 3
	frame_oam -19,  -8, $7c, 4
	frame_oam -35,   0, $7a, 3 | X_FLIP
	frame_oam -19,   0, $7c, 4 | X_FLIP
	db $80

.frame_2
	frame_oam -32, -12, $7e, 5
	frame_oam -16, -12, $80, 5
	frame_oam -45,  -4, $82, 6
	frame_oam  -3,  -4, $84, 6
	frame_oam -32,   4, $7e, 5 | X_FLIP
	frame_oam -16,   4, $80, 5 | X_FLIP
	frame_oam -35,  -8, $7a, 6
	frame_oam -19,  -8, $7c, 6
	frame_oam -35,   0, $7a, 6 | X_FLIP
	frame_oam -19,   0, $7c, 6 | X_FLIP
	db $80

.frame_3
	frame_oam -32, -12, $86, 6
	frame_oam -32,  -4, $88, 6
	frame_oam -16, -12, $86, 6 | Y_FLIP
	frame_oam -16,  -4, $88, 6 | Y_FLIP
	frame_oam -32,   4, $86, 6 | X_FLIP
	frame_oam -16,   4, $86, 6 | X_FLIP | Y_FLIP
	db $80

.frame_4
	frame_oam -32, -12, $8a, 6
	frame_oam -16, -12, $8a, 6 | Y_FLIP
	frame_oam -32,   4, $8a, 6
	frame_oam -16,   4, $8a, 6 | Y_FLIP
	db $80

.frame_5
	frame_oam -32, -12, $8c, 6
	frame_oam -16, -12, $8c, 6 | Y_FLIP
	frame_oam -32,   4, $8c, 6 | X_FLIP
	frame_oam -16,   4, $8c, 6 | X_FLIP | Y_FLIP
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
	frame_oam -28,  -5, $92, 7 | Y_FLIP
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

	INCROM $bd615, $bd971

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

	INCROM $bda01, $bdce6

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
	frame_oam -16,  13, $00, 7 | X_FLIP
	frame_oam -16,   5, $02, 7 | X_FLIP
	frame_oam -16, -17, $04, 6
	frame_oam -16,   9, $04, 6 | X_FLIP
	db $80

.frame_1
	frame_oam -16, -21, $00, 5
	frame_oam -16, -13, $02, 5
	frame_oam -16,  13, $00, 5 | X_FLIP
	frame_oam -16,   5, $02, 5 | X_FLIP
	frame_oam -16, -17, $04, 4
	frame_oam -16,   9, $04, 4 | X_FLIP
	db $80

.frame_2
	frame_oam -16, -21, $00, 3
	frame_oam -16, -13, $02, 3
	frame_oam -16,  13, $00, 3 | X_FLIP
	frame_oam -16,   5, $02, 3 | X_FLIP
	frame_oam -16, -17, $04, 2
	frame_oam -16,   9, $04, 2 | X_FLIP
	db $80

.frame_3
	frame_oam -16, -21, $0e, 1
	frame_oam -16, -13, $10, 1
	frame_oam -16,  13, $0e, 1 | X_FLIP
	frame_oam -16,   5, $10, 1 | X_FLIP
	db $80

.frame_4
	frame_oam -16, -21, $00, 1
	frame_oam -16, -13, $02, 1
	frame_oam -16,  13, $00, 1 | X_FLIP
	frame_oam -16,   5, $02, 1 | X_FLIP
	frame_oam -16, -17, $04, 1
	frame_oam -16,   9, $04, 1 | X_FLIP
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
	frame_oam -16,  13, $00, 7 | X_FLIP
	frame_oam -16,   5, $02, 7 | X_FLIP
	frame_oam -16,   9, $04, 6 | X_FLIP
	db $80

.frame_8
	frame_oam -24,  24, $06, 6 | X_FLIP
	frame_oam -32,  16, $08, 6 | X_FLIP
	frame_oam -16,  16, $0a, 6 | X_FLIP
	frame_oam -16,   8, $0c, 6 | X_FLIP
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

	INCROM $bddcf, $bde69

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
	frame_oam -22,  -6, $50, 1 | TILE_BANK
	frame_oam -16,  -8, $40, 2 | TILE_BANK
	frame_oam -16,   0, $42, 2 | TILE_BANK
	frame_oam -16,   8, $44, 2 | TILE_BANK
	db $80

.frame_1
	frame_oam -22,  -6, $50, 1 | TILE_BANK
	frame_oam -16,  -8, $46, 2 | TILE_BANK
	frame_oam -16,   0, $48, 2 | TILE_BANK
	frame_oam -16,   8, $4a, 2 | TILE_BANK
	db $80

.frame_2
	frame_oam -22,  -6, $50, 1 | TILE_BANK
	frame_oam -16,  -5, $4c, 2 | TILE_BANK
	frame_oam -16,   3, $4e, 2 | TILE_BANK
	db $80

.frame_3
	frame_oam -22,  -6, $52, 1 | TILE_BANK
	frame_oam -16,  -8, $40, 2 | TILE_BANK
	frame_oam -16,   0, $42, 2 | TILE_BANK
	frame_oam -16,   8, $44, 2 | TILE_BANK
	db $80

.frame_4
	frame_oam -22,  -6, $52, 1 | TILE_BANK
	frame_oam -16,  -8, $46, 2 | TILE_BANK
	frame_oam -16,   0, $48, 2 | TILE_BANK
	frame_oam -16,   8, $4a, 2 | TILE_BANK
	db $80

.frame_5
	frame_oam -22,  -6, $52, 1 | TILE_BANK
	frame_oam -16,  -5, $4c, 2 | TILE_BANK
	frame_oam -16,   3, $4e, 2 | TILE_BANK
	db $80

.frame_6
	frame_oam -19, -39, $54, 4 | TILE_BANK
	frame_oam -27, -31, $56, 4 | TILE_BANK
	frame_oam -27, -23, $58, 4 | TILE_BANK
	db $80

.frame_7
	frame_oam -19, -39, $54, 4 | TILE_BANK
	frame_oam -27, -31, $56, 4 | TILE_BANK
	frame_oam -27, -23, $58, 4 | TILE_BANK
	frame_oam -32, -16, $5a, 6 | TILE_BANK
	frame_oam -32,  -8, $5c, 6 | TILE_BANK
	frame_oam -16, -16, $64, 3 | TILE_BANK
	frame_oam -16,  -8, $66, 3 | TILE_BANK
	db $80

.frame_8
	frame_oam -19, -39, $54, 4 | TILE_BANK
	frame_oam -27, -31, $56, 4 | TILE_BANK
	frame_oam -27, -23, $58, 4 | TILE_BANK
	frame_oam -16, -40, $5e, 6 | TILE_BANK
	frame_oam -16, -32, $60, 6 | TILE_BANK
	frame_oam -16, -24, $62, 6 | TILE_BANK
	db $80

.frame_9
	frame_oam -19, -39, $54, 4 | TILE_BANK
	frame_oam -27, -31, $56, 4 | TILE_BANK
	frame_oam -27, -23, $58, 4 | TILE_BANK
	frame_oam -16, -16, $64, 3 | TILE_BANK
	frame_oam -16,  -8, $66, 3 | TILE_BANK
	db $80

.frame_10
	frame_oam -19, -39, $54, 4 | TILE_BANK
	frame_oam -27, -31, $56, 4 | TILE_BANK
	frame_oam -27, -23, $58, 4 | TILE_BANK
	frame_oam -16, -16, $64, 3 | TILE_BANK
	frame_oam -16,  -8, $66, 3 | TILE_BANK
	frame_oam -16, -40, $5e, 6 | TILE_BANK
	frame_oam -16, -32, $60, 6 | TILE_BANK
	frame_oam -16, -24, $62, 6 | TILE_BANK
	frame_oam -32, -16, $5a, 6 | TILE_BANK
	frame_oam -32,  -8, $5c, 6 | TILE_BANK
	db $80

.frame_11
	frame_oam -56, -43, $78, 1 | TILE_BANK
	frame_oam -56, -35, $7a, 1 | TILE_BANK
	frame_oam -40, -47, $96, 1 | TILE_BANK
	frame_oam -40, -39, $98, 1 | TILE_BANK
	frame_oam -40, -31, $9a, 1 | TILE_BANK
	frame_oam -56, -51, $72, 1 | TILE_BANK
	frame_oam -19, -39, $54, 4 | TILE_BANK
	frame_oam -27, -31, $56, 4 | TILE_BANK
	frame_oam -27, -23, $58, 4 | TILE_BANK
	frame_oam -35, -40, $6c, 6 | TILE_BANK
	frame_oam -35, -32, $6e, 6 | TILE_BANK
	frame_oam -35, -24, $70, 6 | TILE_BANK
	frame_oam -51, -32, $68, 6 | TILE_BANK
	frame_oam -51, -24, $6a, 6 | TILE_BANK
	db $80

.frame_12
	frame_oam -56, -43, $78, 1 | TILE_BANK
	frame_oam -40, -47, $96, 1 | TILE_BANK
	frame_oam -40, -39, $98, 1 | TILE_BANK
	frame_oam -56, -35, $7c, 1 | TILE_BANK
	frame_oam -40, -31, $9c, 1 | TILE_BANK
	frame_oam -56, -51, $74, 1 | TILE_BANK
	frame_oam -19, -39, $54, 4 | TILE_BANK
	frame_oam -27, -31, $56, 4 | TILE_BANK
	frame_oam -27, -23, $58, 4 | TILE_BANK
	frame_oam -35, -40, $6c, 6 | TILE_BANK
	frame_oam -35, -32, $6e, 6 | TILE_BANK
	frame_oam -35, -24, $70, 6 | TILE_BANK
	frame_oam -51, -32, $68, 6 | TILE_BANK
	frame_oam -51, -24, $6a, 6 | TILE_BANK
	db $80

.frame_13
	frame_oam -56, -51, $76, 1 | TILE_BANK
	frame_oam -56, -43, $78, 1 | TILE_BANK
	frame_oam -40, -47, $96, 1 | TILE_BANK
	frame_oam -40, -39, $98, 1 | TILE_BANK
	frame_oam -56, -35, $7e, 1 | TILE_BANK
	frame_oam -40, -31, $9e, 1 | TILE_BANK
	frame_oam -35, -40, $6c, 6 | TILE_BANK
	frame_oam -35, -32, $6e, 6 | TILE_BANK
	frame_oam -35, -24, $70, 6 | TILE_BANK
	frame_oam -51, -32, $68, 6 | TILE_BANK
	frame_oam -51, -24, $6a, 6 | TILE_BANK
	frame_oam -19, -39, $54, 4 | TILE_BANK
	frame_oam -27, -31, $56, 4 | TILE_BANK
	frame_oam -27, -23, $58, 4 | TILE_BANK
	db $80

.frame_14
	frame_oam -19, -39, $54, 4 | TILE_BANK
	frame_oam -27, -31, $56, 4 | TILE_BANK
	frame_oam -27, -23, $58, 4 | TILE_BANK
	frame_oam -16, -16, $64, 3 | TILE_BANK
	frame_oam -16,  -8, $66, 3 | TILE_BANK
	frame_oam -16, -38, $5e, 6 | TILE_BANK
	frame_oam -16, -30, $60, 6 | TILE_BANK
	frame_oam -16, -23, $62, 6 | TILE_BANK
	frame_oam -29, -16, $5a, 6 | TILE_BANK
	frame_oam -29,  -8, $5c, 6 | TILE_BANK
	db $80

.frame_15
	frame_oam -19, -39, $54, 4 | TILE_BANK
	frame_oam -27, -31, $56, 4 | TILE_BANK
	frame_oam -27, -23, $58, 4 | TILE_BANK
	frame_oam -29, -16, $5a, 6 | TILE_BANK
	frame_oam -29,  -8, $5c, 6 | TILE_BANK
	frame_oam -16, -16, $64, 3 | TILE_BANK
	frame_oam -16,  -8, $66, 3 | TILE_BANK
	db $80

.frame_16
	frame_oam -19, -39, $54, 4 | TILE_BANK
	frame_oam -27, -31, $56, 4 | TILE_BANK
	frame_oam -27, -23, $58, 4 | TILE_BANK
	frame_oam -16, -38, $5e, 6 | TILE_BANK
	frame_oam -16, -30, $60, 6 | TILE_BANK
	frame_oam -16, -23, $62, 6 | TILE_BANK
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

	INCROM $be206, $be807

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
	frame_oam -48, -16, $80, 1 | TILE_BANK
	frame_oam -48,  -8, $82, 1 | TILE_BANK
	frame_oam -48,   0, $84, 1 | TILE_BANK
	frame_oam -32, -16, $86, 1 | TILE_BANK
	frame_oam -32,  -8, $88, 1 | TILE_BANK
	frame_oam -32,   0, $8a, 1 | TILE_BANK
	frame_oam -16, -16, $8c, 1 | TILE_BANK
	frame_oam -16,  -8, $8e, 1 | TILE_BANK
	frame_oam -16,   0, $90, 1 | TILE_BANK
	frame_oam -16,   8, $92, 1 | TILE_BANK
	frame_oam -48,   8, $80, 1 | TILE_BANK | X_FLIP
	frame_oam -32,   8, $86, 1 | TILE_BANK | X_FLIP
	db $80

.frame_1
	frame_oam -22, -12, $94, 6 | TILE_BANK
	frame_oam -22,  -4, $96, 6 | TILE_BANK
	frame_oam -22,   4, $98, 6 | TILE_BANK
	frame_oam  -6, -12, $a6, 6 | TILE_BANK
	frame_oam  -6,  -4, $a8, 6 | TILE_BANK
	frame_oam  -6,   4, $aa, 6 | TILE_BANK
	frame_oam  -5, -12, $ac, 5 | TILE_BANK
	frame_oam  -5,  -4, $ae, 5 | TILE_BANK
	frame_oam  -5,   4, $ac, 5 | TILE_BANK | X_FLIP
	frame_oam -38, -12, $ac, 5 | TILE_BANK | Y_FLIP
	frame_oam -38,  -4, $ae, 5 | TILE_BANK | Y_FLIP
	frame_oam -38,   4, $ac, 5 | TILE_BANK | X_FLIP | Y_FLIP
	db $80

.frame_2
	frame_oam  -5, -12, $ac, 5 | TILE_BANK
	frame_oam  -5,  -4, $ae, 5 | TILE_BANK
	frame_oam  -5,   4, $ac, 5 | TILE_BANK | X_FLIP
	frame_oam -17, -12, $9a, 6 | TILE_BANK
	frame_oam -17,  -4, $9c, 6 | TILE_BANK
	frame_oam -17,   4, $9e, 6 | TILE_BANK
	frame_oam -33, -12, $ac, 5 | TILE_BANK | Y_FLIP
	frame_oam -33,  -4, $ae, 5 | TILE_BANK | Y_FLIP
	frame_oam -33,   4, $ac, 5 | TILE_BANK | X_FLIP | Y_FLIP
	db $80

.frame_3
	frame_oam  -5, -12, $ac, 5 | TILE_BANK
	frame_oam  -5,  -4, $ae, 5 | TILE_BANK
	frame_oam  -5,   4, $ac, 5 | TILE_BANK | X_FLIP
	frame_oam -14, -12, $a0, 6 | TILE_BANK
	frame_oam -14,  -4, $a2, 6 | TILE_BANK
	frame_oam -14,   4, $a4, 6 | TILE_BANK
	frame_oam -30, -12, $ac, 5 | TILE_BANK | Y_FLIP
	frame_oam -30,  -4, $ae, 5 | TILE_BANK | Y_FLIP
	frame_oam -30,   4, $ac, 5 | TILE_BANK | X_FLIP | Y_FLIP
	db $80

.frame_4
	frame_oam  -8,   0, $b0, 4 | TILE_BANK
	db $80

.frame_5
	frame_oam  -8,   1, $b0, 4 | TILE_BANK
	db $80

.frame_6
	frame_oam  -8,   2, $b0, 4 | TILE_BANK
	db $80

.frame_7
	frame_oam  -8,  -1, $b0, 4 | TILE_BANK
	db $80

.frame_8
	frame_oam  -8,  -2, $b0, 4 | TILE_BANK
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

	INCROM $be8fe, $bea06

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
	frame_oam -12,  -8, $4e, 4 | TILE_BANK
	frame_oam -12,   0, $50, 4 | TILE_BANK
	db $80

.frame_1
	frame_oam -16,  -8, $5a, 1 | TILE_BANK
	frame_oam -16,   0, $5c, 1 | TILE_BANK
	db $80

.frame_2
	frame_oam -16,  -8, $56, 1 | TILE_BANK
	frame_oam -16,   0, $58, 1 | TILE_BANK
	db $80

.frame_3
	frame_oam -16,  -8, $52, 1 | TILE_BANK
	frame_oam -16,   0, $54, 1 | TILE_BANK
	db $80

.frame_4
	frame_oam -16,  -8, $5a, 0 | TILE_BANK
	frame_oam -16,   0, $5c, 0 | TILE_BANK
	db $80

.frame_5
	frame_oam -16,  -8, $56, 0 | TILE_BANK
	frame_oam -16,   0, $58, 0 | TILE_BANK
	db $80

.frame_6
	frame_oam -16,  -8, $52, 0 | TILE_BANK
	frame_oam -16,   0, $54, 0 | TILE_BANK
	db $80

.frame_7
	frame_oam -16,  -8, $38, 2 | TILE_BANK
	frame_oam -16,   0, $38, 2 | TILE_BANK | X_FLIP
	db $80

.frame_8
	frame_oam -16,  -8, $3a, 2 | TILE_BANK
	frame_oam -16,   0, $3a, 2 | TILE_BANK | X_FLIP
	db $80

.frame_9
	frame_oam -16,  -8, $3c, 2 | TILE_BANK
	frame_oam -16,   0, $3c, 2 | TILE_BANK | X_FLIP
	db $80

.frame_10
	frame_oam -16,  -8, $3e, 2 | TILE_BANK
	frame_oam -16,   0, $3e, 2 | TILE_BANK | X_FLIP
	db $80

.frame_11
	frame_oam -16,  -8, $40, 2 | TILE_BANK
	frame_oam -16,   0, $40, 2 | TILE_BANK | X_FLIP
	db $80

.frame_12
	frame_oam -16,  -8, $42, 2 | TILE_BANK
	frame_oam -16,   0, $42, 2 | TILE_BANK | X_FLIP
	db $80

.frame_13
	frame_oam -16,  -8, $44, 2 | TILE_BANK
	frame_oam -16,   0, $44, 2 | TILE_BANK | X_FLIP
	db $80

.frame_14
	frame_oam -16,  -8, $46, 2 | TILE_BANK
	frame_oam -16,   0, $46, 2 | TILE_BANK | X_FLIP
	db $80

.frame_15
	frame_oam -16,  -8, $48, 2 | TILE_BANK
	frame_oam -16,   0, $48, 2 | TILE_BANK | X_FLIP
	db $80

.frame_16
	frame_oam -16,  -8, $4a, 2 | TILE_BANK
	frame_oam -16,   0, $4a, 2 | TILE_BANK | X_FLIP
	db $80

.frame_17
	frame_oam -16,  -8, $4c, 2 | TILE_BANK
	frame_oam -16,   0, $4c, 2 | TILE_BANK | X_FLIP
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

	INCROM $beafc, $becdc

OAM_becdc: ; becdc (2f:6cdc)
	dw .frame_0
	dw .frame_1
	dw .frame_2

.frame_0
	frame_oam -16,  -4, $22, 2 | TILE_BANK
	frame_oam -32,  -8, $20, 1 | TILE_BANK
	frame_oam -32, -16, $1e, 1 | TILE_BANK
	frame_oam -32,   0, $20, 1 | TILE_BANK | X_FLIP
	frame_oam -32,   8, $1e, 1 | TILE_BANK | X_FLIP
	frame_oam -48, -16, $16, 1 | TILE_BANK
	frame_oam -48,  -8, $18, 1 | TILE_BANK
	frame_oam -48,   0, $1a, 1 | TILE_BANK
	frame_oam -48,   8, $1c, 1 | TILE_BANK
	db $80

.frame_1
	frame_oam -12, -10, $2a, 3 | TILE_BANK
	frame_oam -12,  -2, $2c, 5 | TILE_BANK
	frame_oam -12,   6, $2e, 5 | TILE_BANK
	frame_oam  -5,  -8, $32, 6 | TILE_BANK
	frame_oam  -5,   0, $34, 6 | TILE_BANK
	frame_oam  -5,   8, $30, 6 | TILE_BANK
	frame_oam  -5, -16, $30, 6 | TILE_BANK | X_FLIP
	frame_oam  -9,  -4, $36, 4 | TILE_BANK
	db $80

.frame_2
	frame_oam -13,  -4, $24, 3 | TILE_BANK
	frame_oam   3,  -7, $26, 6 | TILE_BANK
	frame_oam   3,   1, $28, 6 | TILE_BANK
	frame_oam  -9,  -4, $36, 4 | TILE_BANK
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

	INCROM $bed42, $bee6e

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
	frame_oam  -1,  24, $6c, 4 | Y_FLIP
	frame_oam  -1,  32, $6e, 4 | Y_FLIP
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
	frame_oam  -1,  20, $6c, 4 | Y_FLIP
	frame_oam  -1,  28, $6e, 4 | Y_FLIP
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
	frame_oam  -1,  12, $6c, 4 | Y_FLIP
	frame_oam  -1,  20, $6e, 4 | Y_FLIP
	frame_oam  -6,  17, $5c, 3
	frame_oam -16,  -8, $44, 5
	frame_oam   0,  -8, $4e, 4
	db $80

.frame_4
	frame_oam   0,  -4, $4c, 4
	frame_oam -16,  -4, $42, 5
	frame_oam -17,   4, $6c, 4
	frame_oam -17,  12, $6e, 4
	frame_oam  -1,   4, $6c, 4 | Y_FLIP
	frame_oam  -1,  12, $6e, 4 | Y_FLIP
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
	frame_oam  -5,   4, $50, 4 | Y_FLIP
	frame_oam  -5,  12, $52, 4 | Y_FLIP
	frame_oam -21,   4, $54, 4 | Y_FLIP
	frame_oam -21,  12, $56, 4 | Y_FLIP
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
	frame_oam -12,   0, $f0, 3 | X_FLIP
	db $80

.frame_1
	frame_oam -28,   1, $ee, 3
	frame_oam -19,  -4, $f6, 5
	frame_oam -28,  -7, $f4, 3
	frame_oam -29,   8, $f8, 1
	frame_oam -12,  -8, $f0, 3
	frame_oam -12,   0, $f0, 3 | X_FLIP
	db $80

.frame_2
	frame_oam -28,   1, $ee, 3
	frame_oam -19,  -4, $f6, 5
	frame_oam -28,  -7, $f4, 3
	frame_oam -29,   8, $f8, 1
	frame_oam -32,  16, $fa, 1
	frame_oam -12,  -8, $f0, 3
	frame_oam -12,   0, $f0, 3 | X_FLIP
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
	frame_oam -12,   0, $f0, 3 | X_FLIP
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
	frame_oam -12,   0, $f0, 3 | X_FLIP
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
	frame_oam -12,   0, $f0, 3 | X_FLIP
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
	frame_oam -12,   0, $f0, 3 | X_FLIP
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
	frame_oam -12,   0, $f0, 3 | X_FLIP
	db $80

.frame_8
	frame_oam -28,   1, $ee, 3
	frame_oam -19,  -4, $f6, 5
	frame_oam -28,  -7, $f4, 3
	frame_oam -12,  -8, $f0, 3
	frame_oam -12,   0, $f0, 3 | X_FLIP
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

	INCROM $bf131, $bf157

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
	frame_oam -16,  -8, $8a, 3 | TILE_BANK
	frame_oam -16,   0, $8c, 3 | TILE_BANK
	frame_oam -32,  -4, $88, 2 | TILE_BANK
	frame_oam -17,  -8, $8e, 4 | TILE_BANK
	frame_oam -17,   0, $90, 4 | TILE_BANK
	db $80

.frame_1
	frame_oam -16,  -8, $8a, 3 | TILE_BANK
	frame_oam -16,   0, $8c, 3 | TILE_BANK
	frame_oam -17,  -8, $8e, 4 | TILE_BANK
	frame_oam -17,   0, $90, 4 | TILE_BANK
	frame_oam -29,   4, $e8, 4 | TILE_BANK
	frame_oam -32,  -4, $92, 2 | TILE_BANK
	db $80

.frame_2
	frame_oam -16,  -8, $8a, 3 | TILE_BANK
	frame_oam -16,   0, $8c, 3 | TILE_BANK
	frame_oam -17,  -8, $8e, 4 | TILE_BANK
	frame_oam -17,   0, $90, 4 | TILE_BANK
	frame_oam -29,   4, $ea, 4 | TILE_BANK
	frame_oam -32,  -4, $92, 2 | TILE_BANK
	db $80

.frame_3
	frame_oam -16,  -8, $8a, 3 | TILE_BANK
	frame_oam -16,   0, $8c, 3 | TILE_BANK
	frame_oam -17,  -8, $8e, 4 | TILE_BANK
	frame_oam -17,   0, $90, 4 | TILE_BANK
	frame_oam -29,   4, $ec, 4 | TILE_BANK
	frame_oam -32,  -4, $92, 2 | TILE_BANK
	db $80

.frame_4
	frame_oam -16,  -8, $8a, 3 | TILE_BANK
	frame_oam -16,   0, $8c, 3 | TILE_BANK
	frame_oam -17,  -8, $8e, 4 | TILE_BANK
	frame_oam -17,   0, $90, 4 | TILE_BANK
	frame_oam -29,   4, $ee, 4 | TILE_BANK
	frame_oam -32,  -4, $92, 2 | TILE_BANK
	db $80

.frame_5
	frame_oam -16,  -8, $e0, 1 | TILE_BANK
	frame_oam -16,   0, $e2, 1 | TILE_BANK
	frame_oam -32,  -8, $e0, 1 | TILE_BANK
	frame_oam -32,   0, $e2, 1 | TILE_BANK
	frame_oam -48,  -8, $e0, 1 | TILE_BANK
	frame_oam -48,   0, $e2, 1 | TILE_BANK
	db $80

.frame_6
	frame_oam -16,  -8, $e0, 1 | TILE_BANK
	frame_oam -16,   0, $e2, 1 | TILE_BANK
	frame_oam -32,  -8, $e0, 1 | TILE_BANK
	frame_oam -32,   0, $e2, 1 | TILE_BANK
	frame_oam -48,  -8, $f0, 5 | TILE_BANK
	frame_oam -48,   0, $f2, 5 | TILE_BANK
	db $80

.frame_7
	frame_oam -16,  -8, $e0, 1 | TILE_BANK
	frame_oam -16,   0, $e2, 1 | TILE_BANK
	frame_oam -32,  -8, $e4, 1 | TILE_BANK
	frame_oam -32,   0, $e6, 1 | TILE_BANK
	frame_oam -32,  -8, $f4, 5 | TILE_BANK
	frame_oam -32,   0, $f6, 5 | TILE_BANK
	frame_oam -48,  -8, $f0, 5 | TILE_BANK
	frame_oam -48,   0, $f2, 5 | TILE_BANK
	db $80

.frame_8
	frame_oam -16,  -8, $e0, 1 | TILE_BANK
	frame_oam -16,   0, $e2, 1 | TILE_BANK
	frame_oam -32,  -8, $f0, 5 | TILE_BANK
	frame_oam -32,   0, $f2, 5 | TILE_BANK
	frame_oam -48,  -8, $f0, 5 | TILE_BANK
	frame_oam -48,   0, $f2, 5 | TILE_BANK
	db $80

.frame_9
	frame_oam -32,  -8, $f0, 5 | TILE_BANK
	frame_oam -32,   0, $f2, 5 | TILE_BANK
	frame_oam -48,  -8, $f0, 5 | TILE_BANK
	frame_oam -48,   0, $f2, 5 | TILE_BANK
	frame_oam -16,  -8, $e4, 1 | TILE_BANK
	frame_oam -16,   0, $e6, 1 | TILE_BANK
	frame_oam -16,  -8, $f4, 5 | TILE_BANK
	frame_oam -16,   0, $f6, 5 | TILE_BANK
	db $80

.frame_10
	frame_oam -16,  -8, $f0, 5 | TILE_BANK
	frame_oam -16,   0, $f2, 5 | TILE_BANK
	frame_oam -32,  -8, $f0, 5 | TILE_BANK
	frame_oam -32,   0, $f2, 5 | TILE_BANK
	frame_oam -48,  -8, $f0, 5 | TILE_BANK
	frame_oam -48,   0, $f2, 5 | TILE_BANK
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
	frame_oam -50,   7, $a6, 3 | X_FLIP
	frame_oam -50,  -1, $a8, 3 | X_FLIP
	db $80

.frame_2
	frame_oam -48, -17, $aa, 2
	frame_oam -48,  -9, $ac, 2
	frame_oam -48,   9, $aa, 3 | X_FLIP
	frame_oam -48,   1, $ac, 3 | X_FLIP
	db $80

.frame_3
	frame_oam -50, -15, $ae, 2
	frame_oam -50,  -7, $b0, 2
	frame_oam -50,   7, $ae, 2 | X_FLIP
	frame_oam -50,  -1, $b0, 2 | X_FLIP
	frame_oam -36,  -5, $b4, 3
	frame_oam -36,  -5, $b2, 2
	db $80

.frame_4
	frame_oam   0,  -8, $b6, 4
	frame_oam   0,   0, $b6, 4 | X_FLIP
	db $80

.frame_5
	frame_oam   0, -16, $b8, 4
	frame_oam   0,  -8, $ba, 4
	frame_oam   0,   8, $b8, 4 | X_FLIP
	frame_oam   0,   0, $ba, 4 | X_FLIP
	db $80

.frame_6
	frame_oam   0, -16, $bc, 4
	frame_oam   0,  -8, $be, 4
	frame_oam   0,   8, $bc, 4 | X_FLIP
	frame_oam   0,   0, $be, 4 | X_FLIP
	db $80

.frame_7
	frame_oam   0, -16, $c0, 4
	frame_oam   0,  -8, $c2, 4
	frame_oam   0,   8, $c0, 4 | X_FLIP
	frame_oam   0,   0, $c2, 4 | X_FLIP
	db $80

.frame_8
	frame_oam   3, -16, $c0, 4
	frame_oam   3,  -8, $c2, 4
	frame_oam   3,   8, $c0, 4 | X_FLIP
	frame_oam   3,   0, $c2, 4 | X_FLIP
	db $80

.frame_9
	frame_oam   6, -16, $c0, 4
	frame_oam   6,  -8, $c2, 4
	frame_oam   6,   8, $c0, 4 | X_FLIP
	frame_oam   6,   0, $c2, 4 | X_FLIP
	db $80

.frame_10
	frame_oam -50, -15, $ae, 2
	frame_oam -50,  -7, $b0, 2
	frame_oam -50,   7, $ae, 2 | X_FLIP
	frame_oam -50,  -1, $b0, 2 | X_FLIP
	frame_oam -33,  -5, $b4, 3
	frame_oam -33,  -5, $b2, 2
	db $80

.frame_11
	frame_oam -50, -15, $ae, 2
	frame_oam -50,  -7, $b0, 2
	frame_oam -50,   7, $ae, 2 | X_FLIP
	frame_oam -50,  -1, $b0, 2 | X_FLIP
	frame_oam -29,  -5, $b4, 3
	frame_oam -29,  -5, $b2, 2
	db $80

.frame_12
	frame_oam -50, -15, $ae, 2
	frame_oam -50,  -7, $b0, 2
	frame_oam -50,   7, $ae, 2 | X_FLIP
	frame_oam -50,  -1, $b0, 2 | X_FLIP
	frame_oam -25,  -5, $b4, 3
	frame_oam -25,  -5, $b2, 2
	db $80

.frame_13
	frame_oam -50, -15, $ae, 2
	frame_oam -50,  -7, $b0, 2
	frame_oam -50,   7, $ae, 2 | X_FLIP
	frame_oam -50,  -1, $b0, 2 | X_FLIP
	frame_oam -21,  -5, $b4, 3
	frame_oam -21,  -5, $b2, 2
	db $80

.frame_14
	frame_oam -50, -15, $ae, 2
	frame_oam -50,  -7, $b0, 2
	frame_oam -50,   7, $ae, 2 | X_FLIP
	frame_oam -50,  -1, $b0, 2 | X_FLIP
	frame_oam -17,  -5, $b4, 3
	frame_oam -17,  -5, $b2, 2
	db $80

.frame_15
	frame_oam -50, -15, $ae, 2
	frame_oam -50,  -7, $b0, 2
	frame_oam -50,   7, $ae, 2 | X_FLIP
	frame_oam -50,  -1, $b0, 2 | X_FLIP
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
	frame_oam -26, -20, $7c, 1 | TILE_BANK
	frame_oam -26,  12, $7c, 1 | TILE_BANK
	db $80

.frame_1
	frame_oam -32, -29, $64, 1 | TILE_BANK
	frame_oam -32, -21, $66, 1 | TILE_BANK
	frame_oam -32, -13, $68, 1 | TILE_BANK
	frame_oam -32,  21, $64, 1 | TILE_BANK | X_FLIP
	frame_oam -32,  13, $66, 1 | TILE_BANK | X_FLIP
	frame_oam -32,   5, $68, 1 | TILE_BANK | X_FLIP
	db $80

.frame_2
	frame_oam -38, -29, $6a, 1 | TILE_BANK
	frame_oam -38, -21, $6c, 1 | TILE_BANK
	frame_oam -38, -13, $6e, 1 | TILE_BANK
	frame_oam -22, -29, $70, 1 | TILE_BANK
	frame_oam -22, -21, $72, 1 | TILE_BANK
	frame_oam -22, -13, $74, 1 | TILE_BANK
	frame_oam -38,  21, $6a, 1 | TILE_BANK | X_FLIP
	frame_oam -38,  13, $6c, 1 | TILE_BANK | X_FLIP
	frame_oam -38,   5, $6e, 1 | TILE_BANK | X_FLIP
	frame_oam -22,  21, $70, 1 | TILE_BANK | X_FLIP
	frame_oam -22,  13, $72, 1 | TILE_BANK | X_FLIP
	frame_oam -22,   5, $74, 1 | TILE_BANK | X_FLIP
	db $80

.frame_3
	frame_oam -38, -29, $6a, 1 | TILE_BANK
	frame_oam -38, -21, $6c, 1 | TILE_BANK
	frame_oam -38, -13, $6e, 1 | TILE_BANK
	frame_oam -38,  21, $6a, 1 | TILE_BANK | X_FLIP
	frame_oam -38,  13, $6c, 1 | TILE_BANK | X_FLIP
	frame_oam -38,   5, $6e, 1 | TILE_BANK | X_FLIP
	frame_oam -22, -29, $76, 1 | TILE_BANK
	frame_oam -22, -21, $78, 1 | TILE_BANK
	frame_oam -22, -13, $7a, 1 | TILE_BANK
	frame_oam -22,  21, $76, 1 | TILE_BANK | X_FLIP
	frame_oam -22,  13, $78, 1 | TILE_BANK | X_FLIP
	frame_oam -22,   5, $7a, 1 | TILE_BANK | X_FLIP
	frame_oam -20, -21, $7e, 1 | TILE_BANK
	frame_oam -20,  12, $7e, 1 | TILE_BANK
	db $80

.frame_4
	frame_oam -38, -29, $6a, 1 | TILE_BANK
	frame_oam -38, -21, $6c, 1 | TILE_BANK
	frame_oam -38, -13, $6e, 1 | TILE_BANK
	frame_oam -38,  21, $6a, 1 | TILE_BANK | X_FLIP
	frame_oam -38,  13, $6c, 1 | TILE_BANK | X_FLIP
	frame_oam -38,   5, $6e, 1 | TILE_BANK | X_FLIP
	frame_oam -22, -29, $76, 1 | TILE_BANK
	frame_oam -22, -21, $78, 1 | TILE_BANK
	frame_oam -22, -13, $7a, 1 | TILE_BANK
	frame_oam -22,  21, $76, 1 | TILE_BANK | X_FLIP
	frame_oam -22,  13, $78, 1 | TILE_BANK | X_FLIP
	frame_oam -22,   5, $7a, 1 | TILE_BANK | X_FLIP
	frame_oam -20, -28, $7e, 1 | TILE_BANK
	frame_oam -20,   5, $7e, 1 | TILE_BANK
	db $80

.frame_5
	frame_oam -38, -29, $6a, 1 | TILE_BANK
	frame_oam -38, -21, $6c, 1 | TILE_BANK
	frame_oam -38, -13, $6e, 1 | TILE_BANK
	frame_oam -38,  21, $6a, 1 | TILE_BANK | X_FLIP
	frame_oam -38,  13, $6c, 1 | TILE_BANK | X_FLIP
	frame_oam -38,   5, $6e, 1 | TILE_BANK | X_FLIP
	frame_oam -22, -29, $76, 1 | TILE_BANK
	frame_oam -22, -21, $78, 1 | TILE_BANK
	frame_oam -22, -13, $7a, 1 | TILE_BANK
	frame_oam -22,  21, $76, 1 | TILE_BANK | X_FLIP
	frame_oam -22,  13, $78, 1 | TILE_BANK | X_FLIP
	frame_oam -22,   5, $7a, 1 | TILE_BANK | X_FLIP
	frame_oam -20, -14, $7e, 1 | TILE_BANK
	frame_oam -20,  19, $7e, 1 | TILE_BANK
	db $80

.frame_6
	frame_oam -38, -29, $6a, 1 | TILE_BANK
	frame_oam -38, -21, $6c, 1 | TILE_BANK
	frame_oam -38, -13, $6e, 1 | TILE_BANK
	frame_oam -38,  21, $6a, 1 | TILE_BANK | X_FLIP
	frame_oam -38,  13, $6c, 1 | TILE_BANK | X_FLIP
	frame_oam -38,   5, $6e, 1 | TILE_BANK | X_FLIP
	frame_oam -22, -29, $76, 1 | TILE_BANK
	frame_oam -22, -21, $78, 1 | TILE_BANK
	frame_oam -22, -13, $7a, 1 | TILE_BANK
	frame_oam -22,  21, $76, 1 | TILE_BANK | X_FLIP
	frame_oam -22,  13, $78, 1 | TILE_BANK | X_FLIP
	frame_oam -22,   5, $7a, 1 | TILE_BANK | X_FLIP
	frame_oam -20, -25, $7e, 1 | TILE_BANK
	frame_oam -20,   8, $7e, 1 | TILE_BANK
	db $80

.frame_7
	frame_oam -38, -29, $6a, 1 | TILE_BANK
	frame_oam -38, -21, $6c, 1 | TILE_BANK
	frame_oam -38, -13, $6e, 1 | TILE_BANK
	frame_oam -38,  21, $6a, 1 | TILE_BANK | X_FLIP
	frame_oam -38,  13, $6c, 1 | TILE_BANK | X_FLIP
	frame_oam -38,   5, $6e, 1 | TILE_BANK | X_FLIP
	frame_oam -22, -29, $76, 1 | TILE_BANK
	frame_oam -22, -21, $78, 1 | TILE_BANK
	frame_oam -22, -13, $7a, 1 | TILE_BANK
	frame_oam -22,  21, $76, 1 | TILE_BANK | X_FLIP
	frame_oam -22,  13, $78, 1 | TILE_BANK | X_FLIP
	frame_oam -22,   5, $7a, 1 | TILE_BANK | X_FLIP
	frame_oam -20, -17, $7e, 1 | TILE_BANK
	frame_oam -20,  16, $7e, 1 | TILE_BANK
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
	frame_oam -30, -12, $62, 3 | X_FLIP
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
	frame_oam   3, -23, $6a, 3 | Y_FLIP
	frame_oam  -3, -16, $76, 2
	frame_oam  -3,  -8, $78, 2
	db $80

.frame_3
	frame_oam  -1, -16, $6e, 2
	frame_oam  -2,  -8, $70, 2
	frame_oam -15, -23, $6a, 3
	frame_oam   1, -24, $6c, 3
	frame_oam   7, -23, $6a, 3 | Y_FLIP
	db $80

.frame_4
	frame_oam -15, -16, $6e, 2 | Y_FLIP
	frame_oam -14,  -8, $70, 2 | Y_FLIP
	frame_oam -23, -23, $6a, 3
	frame_oam  -7, -24, $6c, 3
	frame_oam  -1, -23, $6a, 3 | Y_FLIP
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
	frame_oam -16,   0, $e2, 7 | TILE_BANK
	frame_oam -16,   0, $ec, 2 | TILE_BANK
	db $80

.frame_1
	frame_oam -29,  -4, $e0, 5 | TILE_BANK
	frame_oam -35,  -4, $dc, 4 | TILE_BANK
	frame_oam -35, -12, $de, 3 | TILE_BANK | X_FLIP
	frame_oam -35,   4, $de, 3 | TILE_BANK
	frame_oam -19,  -8, $f0, 4 | TILE_BANK
	frame_oam -19,   0, $f2, 4 | TILE_BANK
	frame_oam -13,  -4, $da, 3 | TILE_BANK
	db $80

.frame_2
	frame_oam -28,  -4, $e0, 5 | TILE_BANK
	frame_oam -34,  -4, $dc, 4 | TILE_BANK
	frame_oam -34, -12, $de, 3 | TILE_BANK | X_FLIP
	frame_oam -34,   4, $de, 3 | TILE_BANK
	frame_oam -18,  -8, $f0, 4 | TILE_BANK
	frame_oam -18,   0, $f2, 4 | TILE_BANK
	frame_oam -14,  -4, $da, 3 | TILE_BANK | X_FLIP
	db $80

.frame_3
	frame_oam -29,  -4, $e0, 5 | TILE_BANK
	frame_oam -35,  -4, $dc, 4 | TILE_BANK
	frame_oam -35, -12, $de, 3 | TILE_BANK | X_FLIP
	frame_oam -35,   4, $de, 3 | TILE_BANK
	frame_oam -19,  -8, $f0, 4 | TILE_BANK
	frame_oam -19,   0, $f2, 4 | TILE_BANK
	frame_oam -13,  -4, $da, 3 | TILE_BANK | X_FLIP
	db $80

.frame_4
	frame_oam -28,  -4, $e0, 5 | TILE_BANK
	frame_oam -34,  -4, $dc, 4 | TILE_BANK
	frame_oam -34, -12, $de, 3 | TILE_BANK | X_FLIP
	frame_oam -34,   4, $de, 3 | TILE_BANK
	frame_oam -18,  -8, $f0, 4 | TILE_BANK
	frame_oam -18,   0, $f2, 4 | TILE_BANK
	frame_oam -14,  -4, $da, 3 | TILE_BANK
	db $80

.frame_5
	frame_oam  -8,  -4, $ee, 7 | TILE_BANK
	db $80

.frame_6
	frame_oam   0,  -8, $e4, 2 | TILE_BANK
	frame_oam   0,   0, $e4, 2 | TILE_BANK
	db $80

.frame_7
	frame_oam   0,  -8, $e6, 2 | TILE_BANK
	frame_oam   0,   0, $e6, 2 | TILE_BANK
	db $80

.frame_8
	frame_oam   0,  -8, $e8, 2 | TILE_BANK
	frame_oam   0,   0, $e8, 2 | TILE_BANK
	db $80

.frame_9
	frame_oam   0,  -8, $ea, 2 | TILE_BANK
	frame_oam   0,   0, $ea, 2 | TILE_BANK
	db $80

.frame_10
	frame_oam   0,  -8, $e4, 2 | TILE_BANK
	frame_oam   0,   0, $e4, 2 | TILE_BANK
	frame_oam -16,   0, $e4, 2 | TILE_BANK
	frame_oam -32,  -8, $e4, 2 | TILE_BANK
	frame_oam -32,   0, $e4, 2 | TILE_BANK
	frame_oam -48,   0, $e4, 2 | TILE_BANK
	frame_oam -48,  -8, $e4, 2 | TILE_BANK
	db $80

.frame_11
	frame_oam   0,  -8, $e6, 2 | TILE_BANK
	frame_oam   0,   0, $e6, 2 | TILE_BANK
	frame_oam -16,   0, $e6, 2 | TILE_BANK
	frame_oam -32,   0, $e6, 2 | TILE_BANK
	frame_oam -32,  -8, $e6, 2 | TILE_BANK
	frame_oam -48,  -8, $e6, 2 | TILE_BANK
	frame_oam -48,   0, $e6, 2 | TILE_BANK
	db $80

.frame_12
	frame_oam   0,  -8, $e8, 2 | TILE_BANK
	frame_oam   0,   0, $e8, 2 | TILE_BANK
	frame_oam -16,   0, $e8, 2 | TILE_BANK
	frame_oam -32,  -8, $e8, 2 | TILE_BANK
	frame_oam -32,   0, $e8, 2 | TILE_BANK
	frame_oam -48,  -8, $e8, 2 | TILE_BANK
	frame_oam -48,   0, $e8, 2 | TILE_BANK
	db $80

.frame_13
	frame_oam   0,  -8, $ea, 2 | TILE_BANK
	frame_oam   0,   0, $ea, 2 | TILE_BANK
	frame_oam -16,   0, $ea, 2 | TILE_BANK
	frame_oam -32,  -8, $ea, 2 | TILE_BANK
	frame_oam -32,   0, $ea, 2 | TILE_BANK
	frame_oam -48,  -8, $ea, 2 | TILE_BANK
	frame_oam -48,   0, $ea, 2 | TILE_BANK
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

	INCROM $bf847, $bf92c
