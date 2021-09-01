	INCROM $1fc000, $1fc48b

OAM_1fc48b: ; 1fc48b (7f:448b)
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

.frame_0
	frame_oam -32, -13, $00, $00
	frame_oam -32,  -5, $02, $00
	frame_oam -32,   3, $04, $00
	frame_oam -16, -13, $20, $00
	frame_oam -16,  -5, $22, $00
	frame_oam -16,   3, $24, $00
	db $80

.frame_1
	frame_oam -32, -13, $06, $00
	frame_oam -32,  -5, $08, $00
	frame_oam -32,   3, $0a, $00
	frame_oam -16, -13, $26, $00
	frame_oam -16,  -5, $28, $00
	frame_oam -16,   3, $2a, $00
	db $80

.frame_2
	frame_oam -32, -13, $0c, $00
	frame_oam -32,  -5, $0e, $00
	frame_oam -32,   3, $10, $00
	frame_oam -16, -13, $2c, $00
	frame_oam -16,  -5, $2e, $00
	frame_oam -16,   3, $30, $00
	db $80

.frame_3
	frame_oam -32, -13, $12, $00
	frame_oam -32,  -5, $14, $00
	frame_oam -32,   3, $16, $00
	frame_oam -16, -13, $32, $00
	frame_oam -16,  -5, $34, $00
	frame_oam -16,   3, $36, $00
	db $80

.frame_4
	frame_oam -32,   5, $00, $20
	frame_oam -32,  -3, $02, $20
	frame_oam -32, -11, $04, $20
	frame_oam -16,   5, $20, $20
	frame_oam -16,  -3, $22, $20
	frame_oam -16, -11, $24, $20
	db $80

.frame_5
	frame_oam -32,   5, $06, $20
	frame_oam -32,  -3, $08, $20
	frame_oam -32, -11, $0a, $20
	frame_oam -16,   5, $26, $20
	frame_oam -16,  -3, $28, $20
	frame_oam -16, -11, $2a, $20
	db $80

.frame_6
	frame_oam -32,   5, $0c, $20
	frame_oam -32,  -3, $0e, $20
	frame_oam -32, -11, $10, $20
	frame_oam -16,   5, $2c, $20
	frame_oam -16,  -3, $2e, $20
	frame_oam -16, -11, $30, $20
	db $80

.frame_7
	frame_oam -32,   5, $12, $20
	frame_oam -32,  -3, $14, $20
	frame_oam -32, -11, $16, $20
	frame_oam -16,   5, $32, $20
	frame_oam -16,  -3, $34, $20
	frame_oam -16, -11, $36, $20
	db $80

.frame_8
	frame_oam -32, -13, $00, $00
	frame_oam -32,  -5, $02, $00
	frame_oam -32,   3, $04, $00
	frame_oam -16, -13, $1e, $00
	frame_oam -16,   3, $3e, $00
	frame_oam -16,  -5, $22, $00
	db $80

.frame_9
	frame_oam -32, -13, $06, $00
	frame_oam -32,  -5, $08, $00
	frame_oam -32,   3, $0a, $00
	frame_oam -16, -13, $40, $00
	frame_oam -16,  -5, $42, $00
	frame_oam -16,   3, $44, $00
	db $80

.frame_10
	frame_oam -32, -13, $0c, $00
	frame_oam -32,  -5, $0e, $00
	frame_oam -32,   3, $10, $00
	frame_oam -16, -13, $46, $00
	frame_oam -16,  -5, $48, $00
	frame_oam -16,   3, $4a, $00
	db $80

.frame_11
	frame_oam -32, -13, $12, $00
	frame_oam -32,  -5, $14, $00
	frame_oam -32,   3, $16, $00
	frame_oam -16, -13, $4c, $00
	frame_oam -16,  -5, $4e, $00
	frame_oam -16,   3, $50, $00
	db $80

.frame_12
	frame_oam -32,   5, $00, $20
	frame_oam -32,  -3, $02, $20
	frame_oam -32, -11, $04, $20
	frame_oam -16,   5, $1e, $20
	frame_oam -16, -11, $3e, $20
	frame_oam -16,  -3, $22, $20
	db $80

.frame_13
	frame_oam -32,   5, $06, $20
	frame_oam -32,  -3, $08, $20
	frame_oam -32, -11, $0a, $20
	frame_oam -16,   5, $40, $20
	frame_oam -16,  -3, $42, $20
	frame_oam -16, -11, $44, $20
	db $80

.frame_14
	frame_oam -32,   5, $0c, $20
	frame_oam -32,  -3, $0e, $20
	frame_oam -32, -11, $10, $20
	frame_oam -16,   5, $46, $20
	frame_oam -16,  -3, $48, $20
	frame_oam -16, -11, $4a, $20
	db $80

.frame_15
	frame_oam -32,   5, $12, $20
	frame_oam -32,  -3, $14, $20
	frame_oam -32, -11, $16, $20
	frame_oam -16,   5, $4c, $20
	frame_oam -16,  -3, $4e, $20
	frame_oam -16, -11, $50, $20
	db $80

.frame_16
	frame_oam -32, -12, $52, $00
	frame_oam -32,  -4, $54, $00
	frame_oam -32,   4, $56, $00
	frame_oam -16, -12, $58, $00
	frame_oam -16,  -4, $5a, $00
	frame_oam -16,   4, $5c, $00
	db $80

.frame_17
	frame_oam -32, -12, $5e, $00
	frame_oam -32,  -4, $60, $00
	frame_oam -32,   4, $5e, $20
	frame_oam -16, -12, $62, $00
	frame_oam -16,  -4, $64, $00
	frame_oam -16,   4, $62, $20
	db $80

.frame_18
	frame_oam -32,   4, $52, $20
	frame_oam -32,  -4, $54, $20
	frame_oam -32, -12, $56, $20
	frame_oam -16,   4, $58, $20
	frame_oam -16,  -4, $5a, $20
	frame_oam -16, -12, $5c, $20
	db $80

.frame_19
	frame_oam -32, -13, $18, $00
	frame_oam -32,  -5, $1a, $00
	frame_oam -32,   3, $1c, $00
	frame_oam -16, -13, $38, $00
	frame_oam -16,  -5, $3a, $00
	frame_oam -16,   3, $3c, $00
	db $80

.frame_20
	frame_oam -32,   5, $18, $20
	frame_oam -32,  -3, $1a, $20
	frame_oam -32, -11, $1c, $20
	frame_oam -16,   5, $38, $20
	frame_oam -16,  -3, $3a, $20
	frame_oam -16, -11, $3c, $20
	db $80

.frame_21
	frame_oam -16, -13, $6a, $00
	frame_oam -16,  -5, $6c, $00
	frame_oam -16,   3, $6e, $00
	frame_oam -32,  -9, $66, $00
	frame_oam -32,  -1, $68, $00
	db $80

.frame_22
	frame_oam -16,   3, $74, $00
	frame_oam -16, -13, $76, $00
	frame_oam -16,  -5, $78, $00
	db $80

.frame_23
	frame_oam -16, -13, $70, $00
	frame_oam -16,  -5, $72, $00
	frame_oam -16,   3, $74, $00
	db $80

.frame_24
	frame_oam -16,  -5, $7c, $20
	frame_oam -16, -13, $7e, $20
	frame_oam -16,   3, $7e, $00
	frame_oam -28, -11, $66, $00
	frame_oam -28,  -3, $68, $00
	db $80

.frame_25
	frame_oam -17, -13, $7a, $00
	frame_oam -15,  -5, $7c, $00
	frame_oam -16,   3, $7a, $20
	frame_oam -34, -11, $66, $00
	frame_oam -34,  -3, $68, $00
	db $80

.frame_26
	frame_oam -16, -13, $7a, $00
	frame_oam -16,  -5, $7c, $20
	frame_oam -17,   3, $7a, $20
	frame_oam -39, -10, $66, $00
	frame_oam -39,  -2, $68, $00
	db $80

.frame_27
	frame_oam -31,  -1, $66, $20
	frame_oam -31,  -9, $68, $20
	db $80

.frame_28
	frame_oam -25,   1, $66, $20
	frame_oam -25,  -7, $68, $20
	db $80

.frame_29
	frame_oam -21,  -1, $66, $20
	frame_oam -21,  -9, $68, $20
	db $80

.frame_30
	frame_oam -19, -10, $66, $00
	frame_oam -19,  -2, $68, $00
	db $80

.frame_31
	frame_oam -16, -11, $66, $00
	frame_oam -16,  -3, $68, $00
	db $80

.frame_32
	frame_oam -16,   5, $6a, $20
	frame_oam -16,  -3, $6c, $20
	frame_oam -16, -11, $6e, $20
	frame_oam -32,   1, $66, $20
	frame_oam -32,  -7, $68, $20
	db $80

.frame_33
	frame_oam -16, -11, $74, $20
	frame_oam -16,   5, $76, $20
	frame_oam -16,  -3, $78, $20
	db $80

.frame_34
	frame_oam -16,   5, $70, $20
	frame_oam -16,  -3, $72, $20
	frame_oam -16, -11, $74, $20
	db $80

.frame_35
	frame_oam -16,  -3, $7c, $00
	frame_oam -16,   5, $7e, $00
	frame_oam -16, -11, $7e, $20
	frame_oam -28,   3, $66, $20
	frame_oam -28,  -5, $68, $20
	db $80

.frame_36
	frame_oam -17,   5, $7a, $20
	frame_oam -15,  -3, $7c, $20
	frame_oam -16, -11, $7a, $00
	frame_oam -34,   3, $66, $20
	frame_oam -34,  -5, $68, $20
	db $80

.frame_37
	frame_oam -16,   5, $7a, $20
	frame_oam -16,  -3, $7c, $00
	frame_oam -17, -11, $7a, $00
	frame_oam -39,   2, $66, $20
	frame_oam -39,  -6, $68, $20
	db $80

.frame_38
	frame_oam -31,  -7, $66, $00
	frame_oam -31,   1, $68, $00
	db $80

.frame_39
	frame_oam -25,  -9, $66, $00
	frame_oam -25,  -1, $68, $00
	db $80

.frame_40
	frame_oam -21,  -7, $66, $00
	frame_oam -21,   1, $68, $00
	db $80

.frame_41
	frame_oam -19,   2, $66, $20
	frame_oam -19,  -6, $68, $20
	db $80

.frame_42
	frame_oam -16,   3, $66, $20
	frame_oam -16,  -5, $68, $20
	db $80

.frame_43
	frame_oam -18, -11, $66, $00
	frame_oam -18,  -3, $68, $00
	db $80

.frame_44
	frame_oam -18,   3, $66, $20
	frame_oam -18,  -5, $68, $20
	db $80

.frame_45
	frame_oam -33, -14, $18, $00
	frame_oam -33,  -6, $1a, $00
	frame_oam -33,   2, $1c, $00
	frame_oam -17, -14, $38, $00
	frame_oam -17,  -6, $3a, $00
	frame_oam -17,   2, $3c, $00
	db $80

.frame_46
	frame_oam -33,   6, $18, $20
	frame_oam -33,  -2, $1a, $20
	frame_oam -33, -10, $1c, $20
	frame_oam -17,   6, $38, $20
	frame_oam -17,  -2, $3a, $20
	frame_oam -17, -10, $3c, $20
	db $80
; 0x1fc870

Frameset_1fc870: ; 1fc870 (7f:4870)
	db $01,  9
	db $02, 15
	db $03, 12
	db $00, 11
	db $ff
; 0x1fc879

Frameset_1fc879: ; 1fc879 (7f:4879)
	db $05,  9
	db $06, 15
	db $07, 12
	db $04, 11
	db $ff
; 0x1fc882

Frameset_1fc882: ; 1fc882 (7f:4882)
	db $08, 12
	db $09, 12
	db $0a, 12
	db $0b, 12
	db $ff
; 0x1fc88b

Frameset_1fc88b: ; 1fc88b (7f:488b)
	db $0c, 12
	db $0d, 12
	db $0e, 12
	db $0f, 12
	db $ff
; 0x1fc894

Frameset_1fc894: ; 1fc894 (7f:4894)
	db $00,  1
	db $10,  8
	db $11,  8
	db $12,  8
	db $ff
; 0x1fc89d

Frameset_1fc89d: ; 1fc89d (7f:489d)
	db $04,  1
	db $12,  8
	db $11,  8
	db $10,  8
	db $ff
; 0x1fc8a6

Frameset_1fc8a6: ; 1fc8a6 (7f:48a6)
	db $00,  6
	db $01,  8
	db $ff
; 0x1fc8ab

Frameset_1fc8ab: ; 1fc8ab (7f:48ab)
	db $04,  6
	db $05,  8
	db $ff
; 0x1fc8b0

Frameset_1fc8b0: ; 1fc8b0 (7f:48b0)
	db $13,  4
	db $ff
; 0x1fc8b3

Frameset_1fc8b3: ; 1fc8b3 (7f:48b3)
	db $14,  4
	db $ff
; 0x1fc8b6

Frameset_1fc8b6: ; 1fc8b6 (7f:48b6)
	db $00,  4
	db $ff
; 0x1fc8b9

Frameset_1fc8b9: ; 1fc8b9 (7f:48b9)
	db $04,  4
	db $ff
; 0x1fc8bc

Frameset_1fc8bc: ; 1fc8bc (7f:48bc)
	db $01,  7
	db $15,  6
	db $17,  2
	db $16,  2
	db $18,  2
	db $19,  1
	db $1a,  2
	db $18,  3
	db $1b,  5
	db $1c,  5
	db $1d,  5
	db $1e,  5
	db $ff
; 0x1fc8d5

Frameset_1fc8d5: ; 1fc8d5 (7f:48d5)
	db $05,  7
	db $20,  6
	db $22,  2
	db $21,  2
	db $23,  2
	db $24,  1
	db $25,  2
	db $23,  3
	db $26,  5
	db $27,  5
	db $28,  5
	db $29,  5
	db $ff
; 0x1fc8ee

Frameset_1fc8ee: ; 1fc8ee (7f:48ee)
	db $1f,  2
	db $2b,  2
	db $1f,  2
	db $2b,  3
	db $1f,  2
	db $2b,  3
	db $16,  2
	db $17,  4
	db $15,  6
	db $08,  5
	db $09,  5
	db $0a,  5
	db $0b,  5
	db $00, 10
	db $ff
; 0x1fc90b

Frameset_1fc90b: ; 1fc90b (7f:490b)
	db $2a,  2
	db $2c,  2
	db $2a,  2
	db $2c,  3
	db $2a,  2
	db $2c,  3
	db $21,  2
	db $21,  4
	db $20,  6
	db $0c,  5
	db $0d,  5
	db $0e,  5
	db $0f,  5
	db $04, 10
	db $ff
; 0x1fc928

Frameset_1fc928: ; 1fc928 (7f:4928)
	db $1f,  4
	db $ff
; 0x1fc92b

Frameset_1fc92b: ; 1fc92b (7f:492b)
	db $2a,  4
	db $ff
; 0x1fc92e

Frameset_1fc92e: ; 1fc92e (7f:492e)
	db $00,  1
	db $09,  3
	db $2d,  5
	db $13,  2
	db $0a,  3
	db $08,  3
	db $ff
; 0x1fc93b

Frameset_1fc93b: ; 1fc93b (7f:493b)
	db $04,  1
	db $0d,  3
	db $2e,  5
	db $14,  2
	db $0e,  3
	db $0c,  3
	db $ff
; 0x1fc948

Frameset_1fc948: ; 1fc948 (7f:4948)
	db $01,  6
	db $15,  4
	db $17,  3
	db $16,  4
	db $15,  8
	db $ff
; 0x1fc953

Frameset_1fc953: ; 1fc953 (7f:4953)
	db $05,  6
	db $20,  4
	db $22,  3
	db $21,  4
	db $20,  8
	db $ff
; 0x1fc95e

OAM_1fc95e: ; 1fc95e (7f:495e)
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
	frame_oam -16, -16, $00, $00
	frame_oam -16,  -8, $02, $00
	frame_oam -16,   8, $00, $20
	frame_oam -16,   0, $02, $20
	db $80

.frame_1
	frame_oam -16,   8, $04, $20
	frame_oam -16,   0, $06, $20
	frame_oam -16, -16, $04, $00
	frame_oam -16,  -8, $06, $00
	db $80

.frame_2
	frame_oam -21, -16, $08, $00
	frame_oam -21,  -8, $0a, $00
	frame_oam -21,   8, $08, $20
	frame_oam -21,   0, $0a, $20
	frame_oam  -5,  -8, $0c, $00
	frame_oam  -5,   0, $0c, $20
	db $80

.frame_3
	frame_oam -28, -16, $0e, $00
	frame_oam -28,   8, $0e, $20
	frame_oam -28,  -8, $12, $00
	frame_oam -28,   0, $12, $20
	frame_oam -12,  -8, $14, $00
	frame_oam -12,   0, $14, $20
	db $80

.frame_4
	frame_oam -30, -16, $10, $00
	frame_oam -30,  -8, $12, $00
	frame_oam -30,   8, $10, $20
	frame_oam -30,   0, $12, $20
	frame_oam -14,  -8, $16, $00
	frame_oam -14,   0, $16, $20
	db $80

.frame_5
	frame_oam -32, -16, $10, $00
	frame_oam -32,  -8, $12, $00
	frame_oam -32,   8, $10, $20
	frame_oam -32,   0, $12, $20
	frame_oam -16,  -8, $18, $00
	frame_oam -16,   0, $18, $20
	db $80

.frame_6
	frame_oam -32, -16, $10, $00
	frame_oam -32,  -8, $12, $00
	frame_oam -32,   8, $10, $20
	frame_oam -32,   0, $12, $20
	frame_oam -16,  -8, $16, $00
	frame_oam -16,   0, $16, $20
	db $80

.frame_7
	frame_oam -32, -16, $0e, $00
	frame_oam -32,   8, $0e, $20
	frame_oam -32,  -8, $12, $00
	frame_oam -32,   0, $12, $20
	frame_oam -16,  -8, $14, $00
	frame_oam -16,   0, $14, $20
	db $80

.frame_8
	frame_oam -32, -16, $08, $00
	frame_oam -32,  -8, $0a, $00
	frame_oam -32,   8, $08, $20
	frame_oam -32,   0, $0a, $20
	frame_oam -16,  -8, $0c, $00
	frame_oam -16,   0, $0c, $20
	db $80

.frame_9
	frame_oam -36,   8, $04, $20
	frame_oam -36,   0, $06, $20
	frame_oam -36, -16, $04, $00
	frame_oam -36,  -8, $06, $00
	db $80

.frame_10
	frame_oam -38, -16, $00, $00
	frame_oam -38,  -8, $02, $00
	frame_oam -38,   8, $00, $20
	frame_oam -38,   0, $02, $20
	db $80

.frame_11
	frame_oam -48,  -6, $1a, $00
	frame_oam -48,   2, $1c, $00
	frame_oam -32, -17, $1e, $00
	frame_oam -32,  -9, $20, $00
	frame_oam -32,  -1, $22, $00
	frame_oam -32,   7, $24, $00
	frame_oam -16,  -9, $26, $00
	frame_oam -16,  -1, $28, $00
	frame_oam -16,   7, $2a, $00
	db $80

.frame_12
	frame_oam -48,  -6, $1a, $00
	frame_oam -48,   2, $1c, $00
	frame_oam -32, -17, $1e, $00
	frame_oam -32,  -9, $20, $00
	frame_oam -32,   7, $24, $00
	frame_oam -16,   7, $2a, $00
	frame_oam -16,  -9, $2e, $00
	frame_oam -16,  -1, $30, $00
	frame_oam -32,  -1, $2c, $00
	db $80

.frame_13
	frame_oam -36, -12, $32, $00
	frame_oam -36,  -4, $34, $00
	frame_oam -36,   4, $36, $00
	frame_oam -36,  12, $38, $00
	frame_oam -20,  -9, $3a, $00
	frame_oam -20,  -1, $3c, $00
	frame_oam -20,   7, $3e, $00
	frame_oam  -4, -12, $40, $00
	db $80

.frame_14
	frame_oam -15, -20, $42, $00
	frame_oam -24, -12, $44, $00
	frame_oam -32,  -4, $46, $00
	frame_oam -32,   4, $48, $00
	frame_oam -21,  12, $4a, $00
	frame_oam -16,  -4, $4c, $00
	frame_oam -16,   4, $4e, $00
	db $80

.frame_15
	frame_oam -31, -16, $50, $00
	frame_oam -31,  -8, $52, $00
	frame_oam -31,   0, $54, $00
	frame_oam -31,   8, $56, $00
	frame_oam -15, -13, $58, $00
	frame_oam -15,  -5, $5a, $00
	frame_oam -15,   3, $5c, $00
	frame_oam -15,  11, $5e, $00
	db $80

.frame_16
	frame_oam -16, -16, $10, $40
	frame_oam -16,  -8, $12, $40
	frame_oam -16,   8, $10, $60
	frame_oam -16,   0, $12, $60
	frame_oam -32,  -8, $18, $40
	frame_oam -32,   0, $18, $60
	db $80

.frame_17
	frame_oam -48,  -2, $1a, $20
	frame_oam -48, -10, $1c, $20
	frame_oam -32,   9, $1e, $20
	frame_oam -32,   1, $20, $20
	frame_oam -32,  -7, $22, $20
	frame_oam -32, -15, $24, $20
	frame_oam -16,   1, $26, $20
	frame_oam -16,  -7, $28, $20
	frame_oam -16, -15, $2a, $20
	db $80

.frame_18
	frame_oam -48,  -2, $1a, $20
	frame_oam -48, -10, $1c, $20
	frame_oam -32,   9, $1e, $20
	frame_oam -32,   1, $20, $20
	frame_oam -32, -15, $24, $20
	frame_oam -16, -15, $2a, $20
	frame_oam -16,   1, $2e, $20
	frame_oam -16,  -7, $30, $20
	frame_oam -32,  -7, $2c, $20
	db $80

.frame_19
	frame_oam -36,   4, $32, $20
	frame_oam -36,  -4, $34, $20
	frame_oam -36, -12, $36, $20
	frame_oam -36, -20, $38, $20
	frame_oam -20,   1, $3a, $20
	frame_oam -20,  -7, $3c, $20
	frame_oam -20, -15, $3e, $20
	frame_oam  -4,   4, $40, $20
	db $80

.frame_20
	frame_oam -15,  12, $42, $20
	frame_oam -24,   4, $44, $20
	frame_oam -32,  -4, $46, $20
	frame_oam -32, -12, $48, $20
	frame_oam -21, -20, $4a, $20
	frame_oam -16,  -4, $4c, $20
	frame_oam -16, -12, $4e, $20
	db $80

.frame_21
	frame_oam -31,   8, $50, $20
	frame_oam -31,   0, $52, $20
	frame_oam -31,  -8, $54, $20
	frame_oam -31, -16, $56, $20
	frame_oam -15,   5, $58, $20
	frame_oam -15,  -3, $5a, $20
	frame_oam -15, -11, $5c, $20
	frame_oam -15, -19, $5e, $20
	db $80

.frame_22
	frame_oam -16, -16, $10, $40
	frame_oam -16,  -8, $12, $40
	frame_oam -16,   8, $10, $60
	frame_oam -16,   0, $12, $60
	frame_oam -32,  -8, $16, $40
	frame_oam -32,   0, $16, $60
	db $80

.frame_23
	frame_oam -16, -16, $0e, $40
	frame_oam -16,   8, $0e, $60
	frame_oam -16,  -8, $12, $40
	frame_oam -16,   0, $12, $60
	frame_oam -32,  -8, $14, $40
	frame_oam -32,   0, $14, $60
	db $80

.frame_24
	frame_oam -16, -16, $08, $40
	frame_oam -16,  -8, $0a, $40
	frame_oam -16,   8, $08, $60
	frame_oam -16,   0, $0a, $60
	frame_oam -32,  -8, $0c, $40
	frame_oam -32,   0, $0c, $60
	db $80

.frame_25
	frame_oam -12,   8, $04, $60
	frame_oam -12,   0, $06, $60
	frame_oam -12, -16, $04, $40
	frame_oam -12,  -8, $06, $40
	db $80

.frame_26
	frame_oam -10, -16, $00, $40
	frame_oam -10,  -8, $02, $40
	frame_oam -10,   8, $00, $60
	frame_oam -10,   0, $02, $60
	db $80
; 0x1fcc5f

Frameset_1fcc5f: ; 1fcc5f (7f:4c5f)
	db $04,  1
	db $03,  1
	db $02,  1
	db $01,  2
	db $00,  7
	db $01,  2
	db $ff
; 0x1fcc6c

Frameset_1fcc6c: ; 1fcc6c (7f:4c6c)
	db $02,  1
	db $03,  1
	db $04,  1
	db $05,  2
	db $ff
; 0x1fcc75

Frameset_1fcc75: ; 1fcc75 (7f:4c75)
	db $06,  1
	db $07,  1
	db $08,  1
	db $09,  2
	db $0a,  7
	db $09,  2
	db $ff
; 0x1fcc82

Frameset_1fcc82: ; 1fcc82 (7f:4c82)
	db $10,  4
	db $ff
; 0x1fcc85

Frameset_1fcc85: ; 1fcc85 (7f:4c85)
	db $16,  1
	db $17,  1
	db $18,  1
	db $19,  2
	db $1a,  7
	db $19,  2
	db $18,  1
	db $17,  1
	db $16,  1
	db $ff
; 0x1fcc98

Frameset_1fcc98: ; 1fcc98 (7f:4c98)
	db $10,  1
	db $15,  4
	db $14,  4
	db $13,  6
	db $11,  4
	db $12,  3
	db $ff
; 0x1fcca5

Frameset_1fcca5: ; 1fcca5 (7f:4ca5)
	db $10,  1
	db $0f,  4
	db $0e,  4
	db $0d,  6
	db $0b,  4
	db $0c,  3
	db $ff
; 0x1fccb2

Frameset_1fccb2: ; 1fccb2 (7f:4cb2)
	db $0b,  3
	db $0c,  4
	db $0d,  6
	db $0e,  4
	db $0f,  4
	db $10,  1
	db $ff
; 0x1fccbf

Frameset_1fccbf: ; 1fccbf (7f:4cbf)
	db $11,  3
	db $12,  4
	db $13,  6
	db $14,  4
	db $15,  4
	db $10,  1
	db $ff
; 0x1fcccc

	INCROM $1fcccc, $1fccd5

OAM_1fccd5: ; 1fccd5 (7f:4cd5)
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
	frame_oam -32, -16, $00, $00
	frame_oam -32,  -8, $02, $00
	frame_oam -32,   0, $04, $00
	frame_oam -32,   8, $06, $00
	frame_oam -16,  -8, $08, $00
	frame_oam -16,   0, $0a, $00
	frame_oam -16,   8, $0c, $00
	frame_oam -16,  16, $0e, $00
	db $80

.frame_1
	frame_oam -32, -16, $10, $00
	frame_oam -32,  -8, $12, $00
	frame_oam -32,   0, $14, $00
	frame_oam -32,   8, $16, $00
	frame_oam -16,  -8, $18, $00
	frame_oam -16,   0, $1a, $00
	frame_oam -16,   8, $1c, $00
	frame_oam -16,  16, $1e, $00
	db $80

.frame_2
	frame_oam -32, -15, $20, $00
	frame_oam -32,  -7, $22, $00
	frame_oam -32,   1, $24, $00
	frame_oam -32,   9, $26, $00
	frame_oam -16,  -9, $28, $00
	frame_oam -16,  -1, $2a, $00
	frame_oam -16,   7, $2c, $00
	frame_oam -16,  15, $2e, $00
	db $80

.frame_3
	frame_oam -32, -16, $30, $00
	frame_oam -32,  -8, $32, $00
	frame_oam -32,   0, $34, $00
	frame_oam -32,   8, $36, $00
	frame_oam -16,  -8, $38, $00
	frame_oam -16,   0, $3a, $00
	frame_oam -16,   8, $3c, $00
	frame_oam -18,  16, $3e, $00
	db $80

.frame_4
	frame_oam -32, -16, $00, $00
	frame_oam -32,   8, $06, $00
	frame_oam -16,  -8, $08, $00
	frame_oam -16,   0, $0a, $00
	frame_oam -16,   8, $0c, $00
	frame_oam -16,  16, $0e, $00
	frame_oam -32,  -8, $40, $00
	frame_oam -32,   0, $42, $00
	db $80

.frame_5
	frame_oam -32, -16, $10, $00
	frame_oam -32,   8, $16, $00
	frame_oam -16,  -8, $18, $00
	frame_oam -16,   0, $1a, $00
	frame_oam -16,   8, $1c, $00
	frame_oam -16,  16, $1e, $00
	frame_oam -32,  -8, $44, $00
	frame_oam -32,   0, $46, $00
	db $80

.frame_6
	frame_oam -32, -15, $20, $00
	frame_oam -32,   9, $26, $00
	frame_oam -16,  -9, $28, $00
	frame_oam -16,  -1, $2a, $00
	frame_oam -16,   7, $2c, $00
	frame_oam -16,  15, $2e, $00
	frame_oam -32,  -7, $48, $00
	frame_oam -32,   1, $4a, $00
	db $80

.frame_7
	frame_oam -32, -16, $30, $00
	frame_oam -32,   8, $36, $00
	frame_oam -16,  -8, $38, $00
	frame_oam -16,   0, $3a, $00
	frame_oam -16,   8, $3c, $00
	frame_oam -18,  16, $3e, $00
	frame_oam -32,  -8, $4c, $00
	frame_oam -32,   0, $4e, $00
	db $80

.frame_8
	frame_oam -32, -16, $50, $00
	frame_oam -32,  -8, $52, $00
	frame_oam -16, -16, $54, $00
	frame_oam -16,  -8, $56, $00
	frame_oam -32,   8, $50, $20
	frame_oam -32,   0, $52, $20
	frame_oam -16,   8, $54, $20
	frame_oam -16,   0, $56, $20
	db $80

.frame_9
	frame_oam -32,   8, $00, $20
	frame_oam -32,   0, $02, $20
	frame_oam -32,  -8, $04, $20
	frame_oam -32, -16, $06, $20
	frame_oam -16,   0, $08, $20
	frame_oam -16,  -8, $0a, $20
	frame_oam -16, -16, $0c, $20
	frame_oam -16, -24, $0e, $20
	db $80

.frame_10
	frame_oam -32,   8, $10, $20
	frame_oam -32,   0, $12, $20
	frame_oam -32,  -8, $14, $20
	frame_oam -32, -16, $16, $20
	frame_oam -16,   0, $18, $20
	frame_oam -16,  -8, $1a, $20
	frame_oam -16, -16, $1c, $20
	frame_oam -16, -24, $1e, $20
	db $80

.frame_11
	frame_oam -32,   7, $20, $20
	frame_oam -32,  -1, $22, $20
	frame_oam -32,  -9, $24, $20
	frame_oam -32, -17, $26, $20
	frame_oam -16,   1, $28, $20
	frame_oam -16,  -7, $2a, $20
	frame_oam -16, -15, $2c, $20
	frame_oam -16, -23, $2e, $20
	db $80

.frame_12
	frame_oam -32,   8, $30, $20
	frame_oam -32,   0, $32, $20
	frame_oam -32,  -8, $34, $20
	frame_oam -32, -16, $36, $20
	frame_oam -16,   0, $38, $20
	frame_oam -16,  -8, $3a, $20
	frame_oam -16, -16, $3c, $20
	frame_oam -18, -24, $3e, $20
	db $80

.frame_13
	frame_oam -32,   8, $00, $20
	frame_oam -32, -16, $06, $20
	frame_oam -16,   0, $08, $20
	frame_oam -16,  -8, $0a, $20
	frame_oam -16, -16, $0c, $20
	frame_oam -16, -24, $0e, $20
	frame_oam -32,   0, $40, $20
	frame_oam -32,  -8, $42, $20
	db $80

.frame_14
	frame_oam -32,   8, $10, $20
	frame_oam -32, -16, $16, $20
	frame_oam -16,   0, $18, $20
	frame_oam -16,  -8, $1a, $20
	frame_oam -16, -16, $1c, $20
	frame_oam -16, -24, $1e, $20
	frame_oam -32,   0, $44, $20
	frame_oam -32,  -8, $46, $20
	db $80

.frame_15
	frame_oam -32,   7, $20, $20
	frame_oam -32, -17, $26, $20
	frame_oam -16,   1, $28, $20
	frame_oam -16,  -7, $2a, $20
	frame_oam -16, -15, $2c, $20
	frame_oam -16, -23, $2e, $20
	frame_oam -32,  -1, $48, $20
	frame_oam -32,  -9, $4a, $20
	db $80

.frame_16
	frame_oam -32,   8, $30, $20
	frame_oam -32, -16, $36, $20
	frame_oam -16,   0, $38, $20
	frame_oam -16,  -8, $3a, $20
	frame_oam -16, -16, $3c, $20
	frame_oam -18, -24, $3e, $20
	frame_oam -32,   0, $4c, $20
	frame_oam -32,  -8, $4e, $20
	db $80

.frame_17
	frame_oam -26, -20, $58, $00
	frame_oam -32, -12, $5a, $00
	frame_oam -32,  -4, $5c, $00
	frame_oam -32,   4, $5e, $00
	frame_oam -16, -12, $60, $00
	frame_oam -16,  -4, $62, $00
	frame_oam -16,   4, $64, $00
	frame_oam -16,  12, $66, $00
	db $80

.frame_18
	frame_oam -26,  12, $58, $20
	frame_oam -32,   4, $5a, $20
	frame_oam -32,  -4, $5c, $20
	frame_oam -32, -12, $5e, $20
	frame_oam -16,   4, $60, $20
	frame_oam -16,  -4, $62, $20
	frame_oam -16, -12, $64, $20
	frame_oam -16, -20, $66, $20
	db $80
; 0x1fcf6e

Frameset_1fcf6e: ; 1fcf6e (7f:4f6e)
	db $00,  3
	db $01,  3
	db $02,  3
	db $03,  3
	db $00,  3
	db $01,  3
	db $02,  3
	db $03,  3
	db $00,  3
	db $04,  2
	db $01,  3
	db $05,  2
	db $02,  3
	db $06,  2
	db $03,  3
	db $07,  2
	db $00,  3
	db $04,  2
	db $01,  3
	db $05,  2
	db $02,  3
	db $06,  2
	db $03,  3
	db $07,  2
	db $ff
; 0x1fcf9f

Frameset_1fcf9f: ; 1fcf9f (7f:4f9f)
	db $09,  3
	db $0a,  3
	db $0b,  3
	db $0c,  3
	db $09,  3
	db $0a,  3
	db $0b,  3
	db $0c,  3
	db $09,  3
	db $0d,  2
	db $0a,  3
	db $0e,  2
	db $0b,  3
	db $0f,  2
	db $0c,  3
	db $10,  2
	db $09,  3
	db $0d,  2
	db $0a,  3
	db $0e,  2
	db $0b,  3
	db $0f,  2
	db $0c,  3
	db $10,  2
	db $ff
; 0x1fcfd0

Frameset_1fcfd0: ; 1fcfd0 (7f:4fd0)
	db $11,  3
	db $08,  3
	db $12,  3
	db $ff
; 0x1fcfd7

Frameset_1fcfd7: ; 1fcfd7 (7f:4fd7)
	db $12,  3
	db $08,  3
	db $11,  3
	db $ff
; 0x1fcfde

	INCROM $1fcfde, $1fd40a

Frameset_1fd40a: ; 1fd40a (7f:540a)
	db $00,  1
	db $01,  8
	db $02,  8
	db $03,  6
	db $04,  6
	db $05,  4
	db $06,  4
	db $07,  6
	db $08,  7
	db $09, 10
	db $0a, 10
	db $0b,  8
	db $0c,  8
	db $0d,  8
	db $0e,  1
	db $ff
; 0x1fd429

	INCROM $1fd429, $1fd42c

Frameset_1fd42c: ; 1fd42c (7f:542c)
	db $0e,  3
	db $0f,  4
	db $ff
; 0x1fd431

	INCROM $1fd431, $1fd434

Frameset_1fd434: ; 1fd434 (7f:5434)
	db $10,  3
	db $11,  4
	db $ff
; 0x1fd439

Frameset_1fd439: ; 1fd439 (7f:5439)
	db $13,  4
	db $14,  6
	db $08,  7
	db $09, 10
	db $15, 10
	db $0b,  2
	db $16,  1
	db $0b,  2
	db $16,  1
	db $0b,  2
	db $16,  1
	db $17,  6
	db $18,  5
	db $19,  3
	db $02, 12
	db $19, 10
	db $00,  1
	db $ff
; 0x1fd45c

	INCROM $1fd45c, $1fd45f

Frameset_1fd45f: ; 1fd45f (7f:545f)
	db $1a,  8
	db $0e,  5
	db $1b,  3
	db $1a,  2
	db $0e,  5
	db $1b,  4
	db $ff
; 0x1fd46c

Frameset_1fd46c: ; 1fd46c (7f:546c)
	db $1c,  8
	db $10,  5
	db $1d,  3
	db $1c,  2
	db $10,  5
	db $1d,  4
	db $ff
; 0x1fd479

Frameset_1fd479: ; 1fd479 (7f:5479)
	db $00,  1
	db $01,  8
	db $02,  8
	db $03,  6
	db $04,  6
	db $05,  4
	db $06,  4
	db $07,  6
	db $08,  7
	db $09, 10
	db $0a, 10
	db $0b,  8
	db $0c,  8
	db $1e,  8
	db $10,  1
	db $ff
; 0x1fd498

	INCROM $1fd498, $1fd81c

Frameset_1fd81c: ; 1fd81c (7f:581c)
	db $00,  6
	db $01,  6
	db $02,  6
	db $03,  6
	db $ff
; 0x1fd825

Frameset_1fd825: ; 1fd825 (7f:5825)
	db $07,  6
	db $04,  6
	db $05,  6
	db $06,  6
	db $ff
; 0x1fd82e

Frameset_1fd82e: ; 1fd82e (7f:582e)
	db $0b,  6
	db $08,  6
	db $09,  6
	db $0a,  6
	db $ff
; 0x1fd837

	INCROM $1fd837, $1fd83a

Frameset_1fd83a: ; 1fd83a (7f:583a)
	db $0c,  2
	db $00,  1
	db $0d,  2
	db $ff
; 0x1fd841

Frameset_1fd841: ; 1fd841 (7f:5841)
	db $0d,  2
	db $00,  1
	db $0c,  2
	db $ff
; 0x1fd848

	INCROM $1fd848, $1fdd94

Frameset_1fdd94: ; 1fdd94 (7f:5d94)
	db $04,  4
	db $ff
; 0x1fdd97

Frameset_1fdd97: ; 1fdd97 (7f:5d97)
	db $09,  4
	db $ff
; 0x1fdd9a

Frameset_1fdd9a: ; 1fdd9a (7f:5d9a)
	db $0d,  3
	db $0b,  3
	db $0d,  3
	db $0a,  2
	db $0c,  3
	db $0e,  1
	db $ff
; 0x1fdda7

Frameset_1fdda7: ; 1fdda7 (7f:5da7)
	db $12,  3
	db $10,  3
	db $12,  3
	db $0f,  2
	db $11,  3
	db $0e,  1
	db $ff
; 0x1fddb4

	INCROM $1fddb4, $1feeb4

Frameset_1feeb4: ; 1feeb4 (7f:6eb4)
	db $00,  4
	db $01,  6
	db $02,  4
	db $01,  6
	db $ff
; 0x1feebd

	INCROM $1feebd, $1ff628

Frameset_1ff628: ; 1ff628 (7f:7628)
	db $35,  2
	db $36,  1
	db $35,  2
	db $36,  1
	db $37,  2
	db $35,  2
	db $36,  1
	db $37,  2
	db $ff
; 0x1ff639

Frameset_1ff639: ; 1ff639 (7f:7639)
	db $38,  2
	db $39,  1
	db $38,  2
	db $39,  1
	db $3a,  2
	db $38,  2
	db $39,  1
	db $3a,  2
	db $ff
; 0x1ff64a

	INCROM $1ff64a, $1ffc8e

Frameset_1ffc8e: ; 1ffc8e (7f:7c8e)
	db $00,  3
	db $01,  3
	db $02,  2
	db $03,  2
	db $02,  2
	db $03,  2
	db $02,  2
	db $04,  5
	db $05,  4
	db $06,  4
	db $07,  4
	db $08,  3
	db $09,  3
	db $0a,  3
	db $0b, 30
	db $0c,  2
	db $0b,  2
	db $0c,  2
	db $0b,  2
	db $0c,  2
	db $0b,  2
	db $0c,  2
	db $0b,  2
	db $0c,  2
	db $0b,  2
	db $0a,  2
	db $09,  2
	db $08,  2
	db $07,  2
	db $06,  3
	db $05,  4
	db $04,  5
	db $ff
; 0x1ffccf

Frameset_1ffccf: ; 1ffccf (7f:7ccf)
	db $0d,  3
	db $0e,  3
	db $0f,  2
	db $10,  2
	db $0f,  2
	db $10,  2
	db $0f,  2
	db $11,  5
	db $12,  4
	db $13,  4
	db $14,  4
	db $15,  3
	db $16,  3
	db $17,  3
	db $18, 30
	db $19,  2
	db $18,  2
	db $19,  2
	db $18,  2
	db $19,  2
	db $18,  2
	db $19,  2
	db $18,  2
	db $19,  2
	db $18,  2
	db $17,  2
	db $16,  2
	db $15,  2
	db $14,  2
	db $13,  3
	db $12,  4
	db $11,  5
	db $ff
; 0x1ffd10

	INCROM $1ffd10, $1ffd13

Frameset_1ffd13: ; 1ffd13 (7f:7d13)
	db $00,  4
	db $ff
; 0x1ffd16

	INCROM $1ffd16, $1ffd19

Frameset_1ffd19: ; 1ffd19 (7f:7d19)
	db $0d,  4
	db $ff
; 0x1ffd1c
