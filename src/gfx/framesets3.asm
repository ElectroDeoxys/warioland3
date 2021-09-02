	INCROM $1dc000, $1dc3cd

OAM_1dc3cd: ; 1dc3cd (77:43cd)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5

.frame_0
	frame_oam -24,  -8, $78, $00
	frame_oam -24,   0, $7a, $00
	db $80

.frame_1
	frame_oam -24,  -8, $7c, $00
	frame_oam -24,   0, $7e, $00
	db $80

.frame_2
	frame_oam -24,   0, $5e, $00
	frame_oam -24,  -8, $66, $00
	db $80

.frame_3
	frame_oam -24,   0, $78, $20
	frame_oam -24,  -8, $7a, $20
	db $80

.frame_4
	frame_oam -24,   0, $7c, $20
	frame_oam -24,  -8, $7e, $20
	db $80

.frame_5
	frame_oam -24,  -8, $5e, $20
	frame_oam -24,   0, $66, $20
	db $80
; 0x1dc40f

Frameset_1dc40f: ; 1dc40f (77:440f)
	db $00,  6
	db $01,  6
	db $02,  4
	db $01,  4
	db $00,  6
	db $01,  6
	db $02,  2
	db $01,  2
	db $00,  2
	db $01,  2
	db $00,  4
	db $01, 12
	db $02,  8
	db $01, 30
	db $ff
; 0x1dc42c

Frameset_1dc42c: ; 1dc42c (77:442c)
	db $03,  6
	db $04,  6
	db $05,  4
	db $04,  4
	db $03,  6
	db $04,  6
	db $05,  2
	db $04,  2
	db $03,  2
	db $04,  2
	db $03,  4
	db $04, 12
	db $05,  8
	db $04, 30
	db $ff
; 0x1dc449

OAM_1dc449: ; 1dc449 (77:4449)
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

.frame_0
	frame_oam -32, -16, $00, $00
	frame_oam -32,  -8, $02, $00
	frame_oam -32,   0, $04, $00
	frame_oam -32,   8, $06, $00
	frame_oam -16, -16, $20, $00
	frame_oam -16,  -8, $22, $00
	frame_oam -16,   0, $24, $00
	frame_oam -16,   8, $26, $00
	db $80

.frame_1
	frame_oam -32, -16, $08, $00
	frame_oam -32,  -8, $0a, $00
	frame_oam -32,   0, $0c, $00
	frame_oam -32,   8, $0e, $00
	frame_oam -16, -16, $28, $00
	frame_oam -16,  -8, $2a, $00
	frame_oam -16,   0, $2c, $00
	frame_oam -16,   8, $2e, $00
	db $80

.frame_2
	frame_oam -32, -16, $10, $00
	frame_oam -32,  -8, $12, $00
	frame_oam -32,   0, $14, $00
	frame_oam -32,   8, $16, $00
	frame_oam -16, -16, $30, $00
	frame_oam -16,  -8, $32, $00
	frame_oam -16,   0, $34, $00
	frame_oam -16,   8, $36, $00
	db $80

.frame_3
	frame_oam -32, -16, $18, $00
	frame_oam -32,  -8, $1a, $00
	frame_oam -32,   0, $1c, $00
	frame_oam -32,   8, $1e, $00
	frame_oam -16, -16, $38, $00
	frame_oam -16,  -8, $3a, $00
	frame_oam -16,   0, $3c, $00
	frame_oam -16,   8, $3e, $00
	db $80

.frame_4
	frame_oam -32,   8, $00, $20
	frame_oam -32,   0, $02, $20
	frame_oam -32,  -8, $04, $20
	frame_oam -32, -16, $06, $20
	frame_oam -16,   8, $20, $20
	frame_oam -16,   0, $22, $20
	frame_oam -16,  -8, $24, $20
	frame_oam -16, -16, $26, $20
	db $80

.frame_5
	frame_oam -32,   8, $08, $20
	frame_oam -32,   0, $0a, $20
	frame_oam -32,  -8, $0c, $20
	frame_oam -32, -16, $0e, $20
	frame_oam -16,   8, $28, $20
	frame_oam -16,   0, $2a, $20
	frame_oam -16,  -8, $2c, $20
	frame_oam -16, -16, $2e, $20
	db $80

.frame_6
	frame_oam -32,   8, $10, $20
	frame_oam -32,   0, $12, $20
	frame_oam -32,  -8, $14, $20
	frame_oam -32, -16, $16, $20
	frame_oam -16,   8, $30, $20
	frame_oam -16,   0, $32, $20
	frame_oam -16,  -8, $34, $20
	frame_oam -16, -16, $36, $20
	db $80

.frame_7
	frame_oam -32,   8, $18, $20
	frame_oam -32,   0, $1a, $20
	frame_oam -32,  -8, $1c, $20
	frame_oam -32, -16, $1e, $20
	frame_oam -16,   8, $38, $20
	frame_oam -16,   0, $3a, $20
	frame_oam -16,  -8, $3c, $20
	frame_oam -16, -16, $3e, $20
	db $80

.frame_8
	frame_oam -49,  -4, $58, $00
	frame_oam -41,  -9, $5a, $00
	frame_oam -32, -15, $40, $00
	frame_oam -32,  -7, $42, $00
	frame_oam -32,   1, $44, $00
	frame_oam -32,   9, $46, $00
	frame_oam -16, -12, $60, $00
	frame_oam -16,  -4, $62, $00
	frame_oam -16,   4, $64, $00
	db $80

.frame_9
	frame_oam -43, -11, $5c, $00
	frame_oam -58,  -6, $58, $00
	frame_oam -48,  -4, $5a, $00
	frame_oam -32, -17, $40, $00
	frame_oam -32,  -9, $42, $00
	frame_oam -32,  -1, $44, $00
	frame_oam -32,   7, $46, $00
	frame_oam -16, -14, $60, $00
	frame_oam -16,  -6, $62, $00
	frame_oam -16,   2, $64, $00
	db $80

.frame_10
	frame_oam -50, -15, $5c, $00
	frame_oam -59,  -4, $58, $00
	frame_oam -46,  -2, $5a, $00
	frame_oam -32, -15, $40, $00
	frame_oam -32,  -7, $42, $00
	frame_oam -32,   1, $44, $00
	frame_oam -32,   9, $46, $00
	frame_oam -16, -12, $60, $00
	frame_oam -16,  -4, $62, $00
	frame_oam -16,   4, $64, $00
	db $80

.frame_11
	frame_oam -54, -17, $5c, $00
	frame_oam -62,  -3, $58, $00
	frame_oam -49,   0, $5a, $00
	frame_oam -32, -16, $40, $00
	frame_oam -32,  -8, $42, $00
	frame_oam -32,   0, $44, $00
	frame_oam -32,   8, $46, $00
	frame_oam -16, -13, $60, $00
	frame_oam -16,  -5, $62, $00
	frame_oam -16,   3, $64, $00
	db $80

.frame_12
	frame_oam -56, -16, $5c, $00
	frame_oam -65,  -5, $58, $00
	frame_oam -53,   3, $5a, $00
	frame_oam -32, -16, $40, $00
	frame_oam -32,  -8, $42, $00
	frame_oam -32,   0, $44, $00
	frame_oam -32,   8, $46, $00
	frame_oam -16, -13, $60, $00
	frame_oam -16,  -5, $62, $00
	frame_oam -16,   3, $64, $00
	db $80

.frame_13
	frame_oam -59, -17, $5c, $00
	frame_oam -56,   2, $5a, $00
	frame_oam -32, -16, $40, $00
	frame_oam -32,  -8, $42, $00
	frame_oam -32,   0, $44, $00
	frame_oam -32,   8, $46, $00
	frame_oam -16, -13, $60, $00
	frame_oam -16,  -5, $62, $00
	frame_oam -16,   3, $64, $00
	frame_oam -69,  -4, $5a, $00
	db $80

.frame_14
	frame_oam -60, -16, $5c, $00
	frame_oam -32, -16, $40, $00
	frame_oam -32,  -8, $42, $00
	frame_oam -32,   0, $44, $00
	frame_oam -32,   8, $46, $00
	frame_oam -16, -13, $60, $00
	frame_oam -16,  -5, $62, $00
	frame_oam -16,   3, $64, $00
	frame_oam -71,  -5, $5a, $00
	frame_oam -62,   3, $5c, $00
	db $80

.frame_15
	frame_oam -62, -17, $5c, $00
	frame_oam -64,   2, $5c, $00
	frame_oam -78,  -5, $5c, $00
	frame_oam -32, -16, $48, $00
	frame_oam -32,  -8, $4a, $00
	frame_oam -32,   0, $4c, $00
	frame_oam -32,   8, $4e, $00
	frame_oam -16, -16, $68, $00
	frame_oam -16,  -8, $6a, $00
	frame_oam -16,   0, $6c, $00
	frame_oam -16,   8, $6e, $00
	db $80

.frame_16
	frame_oam -64, -18, $5c, $00
	frame_oam -80,  -6, $5c, $00
	frame_oam -32, -16, $48, $00
	frame_oam -32,  -8, $4a, $00
	frame_oam -32,   0, $4c, $00
	frame_oam -32,   8, $4e, $00
	frame_oam -16, -16, $68, $00
	frame_oam -16,  -8, $6a, $00
	frame_oam -16,   0, $6c, $00
	frame_oam -16,   8, $6e, $00
	db $80

.frame_17
	frame_oam -30, -17, $50, $00
	frame_oam -30,  -9, $52, $00
	frame_oam -30,  -1, $54, $00
	frame_oam -30,   7, $56, $00
	frame_oam -14, -17, $70, $00
	frame_oam -14,  -9, $72, $00
	frame_oam -14,  -1, $74, $00
	frame_oam -14,   7, $76, $00
	frame_oam -65, -17, $5c, $00
	db $80

.frame_18
	frame_oam -30, -17, $50, $00
	frame_oam -30,  -9, $52, $00
	frame_oam -30,  -1, $54, $00
	frame_oam -30,   7, $56, $00
	frame_oam -14, -17, $70, $00
	frame_oam -14,  -9, $72, $00
	frame_oam -14,  -1, $74, $00
	frame_oam -14,   7, $76, $00
	db $80

.frame_19
	frame_oam -49,  -4, $58, $20
	frame_oam -41,   1, $5a, $20
	frame_oam -32,   7, $40, $20
	frame_oam -32,  -1, $42, $20
	frame_oam -32,  -9, $44, $20
	frame_oam -32, -17, $46, $20
	frame_oam -16,   4, $60, $20
	frame_oam -16,  -4, $62, $20
	frame_oam -16, -12, $64, $20
	db $80

.frame_20
	frame_oam -43,   3, $5c, $20
	frame_oam -58,  -2, $58, $20
	frame_oam -48,  -4, $5a, $20
	frame_oam -32,   9, $40, $20
	frame_oam -32,   1, $42, $20
	frame_oam -32,  -7, $44, $20
	frame_oam -32, -15, $46, $20
	frame_oam -16,   6, $60, $20
	frame_oam -16,  -2, $62, $20
	frame_oam -16, -10, $64, $20
	db $80

.frame_21
	frame_oam -50,   7, $5c, $20
	frame_oam -59,  -4, $58, $20
	frame_oam -46,  -6, $5a, $20
	frame_oam -32,   7, $40, $20
	frame_oam -32,  -1, $42, $20
	frame_oam -32,  -9, $44, $20
	frame_oam -32, -17, $46, $20
	frame_oam -16,   4, $60, $20
	frame_oam -16,  -4, $62, $20
	frame_oam -16, -12, $64, $20
	db $80

.frame_22
	frame_oam -54,   9, $5c, $20
	frame_oam -62,  -5, $58, $20
	frame_oam -49,  -8, $5a, $20
	frame_oam -32,   8, $40, $20
	frame_oam -32,   0, $42, $20
	frame_oam -32,  -8, $44, $20
	frame_oam -32, -16, $46, $20
	frame_oam -16,   5, $60, $20
	frame_oam -16,  -3, $62, $20
	frame_oam -16, -11, $64, $20
	db $80

.frame_23
	frame_oam -56,   8, $5c, $20
	frame_oam -65,  -3, $58, $20
	frame_oam -53, -11, $5a, $20
	frame_oam -32,   8, $40, $20
	frame_oam -32,   0, $42, $20
	frame_oam -32,  -8, $44, $20
	frame_oam -32, -16, $46, $20
	frame_oam -16,   5, $60, $20
	frame_oam -16,  -3, $62, $20
	frame_oam -16, -11, $64, $20
	db $80

.frame_24
	frame_oam -59,   9, $5c, $20
	frame_oam -56, -10, $5a, $20
	frame_oam -32,   8, $40, $20
	frame_oam -32,   0, $42, $20
	frame_oam -32,  -8, $44, $20
	frame_oam -32, -16, $46, $20
	frame_oam -16,   5, $60, $20
	frame_oam -16,  -3, $62, $20
	frame_oam -16, -11, $64, $20
	frame_oam -69,  -4, $5a, $20
	db $80

.frame_25
	frame_oam -60,   8, $5c, $20
	frame_oam -32,   8, $40, $20
	frame_oam -32,   0, $42, $20
	frame_oam -32,  -8, $44, $20
	frame_oam -32, -16, $46, $20
	frame_oam -16,   5, $60, $20
	frame_oam -16,  -3, $62, $20
	frame_oam -16, -11, $64, $20
	frame_oam -71,  -3, $5a, $20
	frame_oam -62, -11, $5c, $20
	db $80

.frame_26
	frame_oam -62,   9, $5c, $20
	frame_oam -64, -10, $5c, $20
	frame_oam -78,  -3, $5c, $20
	frame_oam -32,   8, $48, $20
	frame_oam -32,   0, $4a, $20
	frame_oam -32,  -8, $4c, $20
	frame_oam -32, -16, $4e, $20
	frame_oam -16,   8, $68, $20
	frame_oam -16,   0, $6a, $20
	frame_oam -16,  -8, $6c, $20
	frame_oam -16, -16, $6e, $20
	db $80

.frame_27
	frame_oam -64,  10, $5c, $20
	frame_oam -80,  -2, $5c, $20
	frame_oam -32,   8, $48, $20
	frame_oam -32,   0, $4a, $20
	frame_oam -32,  -8, $4c, $20
	frame_oam -32, -16, $4e, $20
	frame_oam -16,   8, $68, $20
	frame_oam -16,   0, $6a, $20
	frame_oam -16,  -8, $6c, $20
	frame_oam -16, -16, $6e, $20
	db $80

.frame_28
	frame_oam -30,   9, $50, $20
	frame_oam -30,   1, $52, $20
	frame_oam -30,  -7, $54, $20
	frame_oam -30, -15, $56, $20
	frame_oam -14,   9, $70, $20
	frame_oam -14,   1, $72, $20
	frame_oam -14,  -7, $74, $20
	frame_oam -14, -15, $76, $20
	frame_oam -65,   9, $5c, $20
	db $80

.frame_29
	frame_oam -30,   9, $50, $20
	frame_oam -30,   1, $52, $20
	frame_oam -30,  -7, $54, $20
	frame_oam -30, -15, $56, $20
	frame_oam -14,   9, $70, $20
	frame_oam -14,   1, $72, $20
	frame_oam -14,  -7, $74, $20
	frame_oam -14, -15, $76, $20
	db $80
; 0x1dc8fb

Frameset_1dc8fb: ; 1dc8fb (77:48fb)
	db $00,  3
	db $01,  3
	db $02,  3
	db $03,  3
	db $ff
; 0x1dc904

Frameset_1dc904: ; 1dc904 (77:4904)
	db $04,  3
	db $05,  3
	db $06,  3
	db $07,  3
	db $ff
; 0x1dc90d

	INCROM $1dc90d, $1dc93f

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

	INCROM $1dccd2, $1dcd60

OAM_1dcd60: ; 1dcd60 (77:4d60)
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
	frame_oam -32, -16, $00, $00
	frame_oam -32,  -8, $02, $00
	frame_oam -16, -16, $04, $00
	frame_oam -16,  -8, $06, $00
	frame_oam -32,   8, $00, $20
	frame_oam -32,   0, $02, $20
	frame_oam -16,   8, $04, $20
	frame_oam -16,   0, $06, $20
	db $80

.frame_1
	frame_oam -32, -16, $08, $00
	frame_oam -32,  -8, $0a, $00
	frame_oam -32,   0, $0c, $00
	frame_oam -32,   8, $0e, $00
	frame_oam -16, -16, $28, $00
	frame_oam -16,  -8, $2a, $00
	frame_oam -16,   0, $2c, $00
	frame_oam -16,   8, $2e, $00
	db $80

.frame_2
	frame_oam -32, -16, $10, $00
	frame_oam -32,  -8, $12, $00
	frame_oam -32,   0, $14, $00
	frame_oam -32,   8, $16, $00
	frame_oam -16, -16, $30, $00
	frame_oam -16,  -8, $32, $00
	frame_oam -16,   0, $34, $00
	frame_oam -16,   8, $36, $00
	db $80

.frame_3
	frame_oam -32, -16, $18, $00
	frame_oam -32,  -8, $1a, $00
	frame_oam -32,   0, $1c, $00
	frame_oam -32,   8, $1e, $00
	frame_oam -16, -16, $38, $00
	frame_oam -16,  -8, $3a, $00
	frame_oam -16,   0, $3c, $00
	frame_oam -16,   8, $3e, $00
	db $80

.frame_4
	frame_oam -32, -16, $20, $00
	frame_oam -32,  -8, $22, $00
	frame_oam -32,   0, $24, $00
	frame_oam -32,   8, $26, $00
	frame_oam -32, -16, $20, $00
	frame_oam -32,  -8, $22, $00
	frame_oam -32,   0, $24, $00
	frame_oam -32,   8, $26, $00
	frame_oam -16, -16, $20, $40
	frame_oam -16,  -8, $22, $40
	frame_oam -16,   0, $24, $40
	frame_oam -16,   8, $26, $40
	db $80

.frame_5
	frame_oam -16, -16, $18, $40
	frame_oam -16,  -8, $1a, $40
	frame_oam -16,   0, $1c, $40
	frame_oam -16,   8, $1e, $40
	frame_oam -32, -16, $38, $40
	frame_oam -32,  -8, $3a, $40
	frame_oam -32,   0, $3c, $40
	frame_oam -32,   8, $3e, $40
	db $80

.frame_6
	frame_oam -16, -16, $10, $40
	frame_oam -16,  -8, $12, $40
	frame_oam -16,   0, $14, $40
	frame_oam -16,   8, $16, $40
	frame_oam -32, -16, $30, $40
	frame_oam -32,  -8, $32, $40
	frame_oam -32,   0, $34, $40
	frame_oam -32,   8, $36, $40
	db $80

.frame_7
	frame_oam -16, -16, $08, $40
	frame_oam -16,  -8, $0a, $40
	frame_oam -16,   0, $0c, $40
	frame_oam -16,   8, $0e, $40
	frame_oam -32, -16, $28, $40
	frame_oam -32,  -8, $2a, $40
	frame_oam -32,   0, $2c, $40
	frame_oam -32,   8, $2e, $40
	db $80

.frame_8
	frame_oam -16, -16, $00, $40
	frame_oam -16,  -8, $02, $40
	frame_oam -32, -16, $04, $40
	frame_oam -32,  -8, $06, $40
	frame_oam -16,   8, $00, $60
	frame_oam -16,   0, $02, $60
	frame_oam -32,   8, $04, $60
	frame_oam -32,   0, $06, $60
	db $80

.frame_9
	frame_oam -16,   8, $08, $60
	frame_oam -16,   0, $0a, $60
	frame_oam -16,  -8, $0c, $60
	frame_oam -16, -16, $0e, $60
	frame_oam -32,   8, $28, $60
	frame_oam -32,   0, $2a, $60
	frame_oam -32,  -8, $2c, $60
	frame_oam -32, -16, $2e, $60
	db $80

.frame_10
	frame_oam -16,   8, $10, $60
	frame_oam -16,   0, $12, $60
	frame_oam -16,  -8, $14, $60
	frame_oam -16, -16, $16, $60
	frame_oam -32,   8, $30, $60
	frame_oam -32,   0, $32, $60
	frame_oam -32,  -8, $34, $60
	frame_oam -32, -16, $36, $60
	db $80

.frame_11
	frame_oam -16,   8, $18, $60
	frame_oam -16,   0, $1a, $60
	frame_oam -16,  -8, $1c, $60
	frame_oam -16, -16, $1e, $60
	frame_oam -32,   8, $38, $60
	frame_oam -32,   0, $3a, $60
	frame_oam -32,  -8, $3c, $60
	frame_oam -32, -16, $3e, $60
	db $80

.frame_12
	frame_oam -32,   8, $20, $20
	frame_oam -32,   0, $22, $20
	frame_oam -32,  -8, $24, $20
	frame_oam -32, -16, $26, $20
	frame_oam -32,   8, $20, $20
	frame_oam -32,   0, $22, $20
	frame_oam -32,  -8, $24, $20
	frame_oam -32, -16, $26, $20
	frame_oam -16,   8, $20, $60
	frame_oam -16,   0, $22, $60
	frame_oam -16,  -8, $24, $60
	frame_oam -16, -16, $26, $60
	db $80

.frame_13
	frame_oam -32,   8, $18, $20
	frame_oam -32,   0, $1a, $20
	frame_oam -32,  -8, $1c, $20
	frame_oam -32, -16, $1e, $20
	frame_oam -16,   8, $38, $20
	frame_oam -16,   0, $3a, $20
	frame_oam -16,  -8, $3c, $20
	frame_oam -16, -16, $3e, $20
	db $80

.frame_14
	frame_oam -32,   8, $10, $20
	frame_oam -32,   0, $12, $20
	frame_oam -32,  -8, $14, $20
	frame_oam -32, -16, $16, $20
	frame_oam -16,   8, $30, $20
	frame_oam -16,   0, $32, $20
	frame_oam -16,  -8, $34, $20
	frame_oam -16, -16, $36, $20
	db $80

.frame_15
	frame_oam -32,   8, $08, $20
	frame_oam -32,   0, $0a, $20
	frame_oam -32,  -8, $0c, $20
	frame_oam -32, -16, $0e, $20
	frame_oam -16,   8, $28, $20
	frame_oam -16,   0, $2a, $20
	frame_oam -16,  -8, $2c, $20
	frame_oam -16, -16, $2e, $20
	db $80
; 0x1dcfb0

Frameset_1dcfb0: ; 1dcfb0 (77:4fb0)
	db $00,  4
	db $01,  4
	db $02,  4
	db $03,  4
	db $04,  4
	db $05,  4
	db $06,  4
	db $07,  4
	db $08,  4
	db $09,  4
	db $0a,  4
	db $0b,  4
	db $0c,  4
	db $0d,  4
	db $0e,  4
	db $0f,  4
	db $00,  4
	db $0f,  4
	db $0e,  4
	db $0d,  4
	db $0c,  4
	db $0b,  4
	db $0a,  4
	db $09,  4
	db $08,  4
	db $07,  4
	db $06,  4
	db $05,  4
	db $04,  4
	db $03,  4
	db $02,  4
	db $01,  4
	db $ff
; 0x1dcff1

OAM_1dcff1: ; 1dcff1 (77:4ff1)
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

.frame_0
	frame_oam -32,  -8, $00, $00
	frame_oam -32,   0, $02, $00
	frame_oam -16,  -8, $20, $00
	frame_oam -16,   0, $22, $00
	db $80

.frame_1
	frame_oam -32, -12, $04, $00
	frame_oam -32,  -4, $06, $00
	frame_oam -32,   4, $08, $00
	frame_oam -16, -12, $24, $00
	frame_oam -16,  -4, $26, $00
	frame_oam -16,   4, $28, $00
	db $80

.frame_2
	frame_oam -32, -12, $0a, $00
	frame_oam -32,  -4, $0c, $00
	frame_oam -32,   4, $0e, $00
	frame_oam -16, -12, $2a, $00
	frame_oam -16,  -4, $2c, $00
	frame_oam -16,   4, $2e, $00
	db $80

.frame_3
	frame_oam -16, -12, $10, $00
	frame_oam -16,  -4, $12, $00
	frame_oam -16,   4, $14, $00
	db $80

.frame_4
	frame_oam -16, -16, $30, $00
	frame_oam -16,  -8, $32, $00
	frame_oam -16,   0, $34, $00
	frame_oam -16,   8, $36, $00
	db $80

.frame_5
	frame_oam -16, -16, $16, $00
	frame_oam -16,  -8, $18, $00
	frame_oam -16,   0, $1a, $00
	frame_oam -16,   8, $1c, $00
	db $80

.frame_6
	frame_oam -32,  -5, $38, $00
	frame_oam -32,   3, $3a, $00
	frame_oam -16,  -5, $3c, $00
	frame_oam -16,   3, $3e, $00
	db $80

.frame_7
	frame_oam -32,  -8, $40, $00
	frame_oam -32,   0, $42, $00
	frame_oam -16,  -8, $44, $00
	frame_oam -16,   0, $46, $00
	db $80

.frame_8
	frame_oam -32, -12, $48, $00
	frame_oam -32,  -4, $4a, $00
	frame_oam -16, -12, $4c, $00
	frame_oam -16,  -4, $4e, $00
	frame_oam -16,   4, $50, $00
	frame_oam -32,   4, $48, $20
	db $80

.frame_9
	frame_oam -32,   0, $00, $20
	frame_oam -32,  -8, $02, $20
	frame_oam -16,   0, $20, $20
	frame_oam -16,  -8, $22, $20
	db $80

.frame_10
	frame_oam -32,   4, $04, $20
	frame_oam -32,  -4, $06, $20
	frame_oam -32, -12, $08, $20
	frame_oam -16,   4, $24, $20
	frame_oam -16,  -4, $26, $20
	frame_oam -16, -12, $28, $20
	db $80

.frame_11
	frame_oam -32,   4, $0a, $20
	frame_oam -32,  -4, $0c, $20
	frame_oam -32, -12, $0e, $20
	frame_oam -16,   4, $2a, $20
	frame_oam -16,  -4, $2c, $20
	frame_oam -16, -12, $2e, $20
	db $80

.frame_12
	frame_oam -16,   4, $10, $20
	frame_oam -16,  -4, $12, $20
	frame_oam -16, -12, $14, $20
	db $80

.frame_13
	frame_oam -16,   8, $30, $20
	frame_oam -16,   0, $32, $20
	frame_oam -16,  -8, $34, $20
	frame_oam -16, -16, $36, $20
	db $80

.frame_14
	frame_oam -16,   8, $16, $20
	frame_oam -16,   0, $18, $20
	frame_oam -16,  -8, $1a, $20
	frame_oam -16, -16, $1c, $20
	db $80

.frame_15
	frame_oam -32,  -3, $38, $20
	frame_oam -32, -11, $3a, $20
	frame_oam -16,  -3, $3c, $20
	frame_oam -16, -11, $3e, $20
	db $80

.frame_16
	frame_oam -32,   0, $40, $20
	frame_oam -32,  -8, $42, $20
	frame_oam -16,   0, $44, $20
	frame_oam -16,  -8, $46, $20
	db $80

.frame_17
	frame_oam -32, -12, $52, $00
	frame_oam -32,  -4, $54, $00
	frame_oam -32,   4, $0e, $00
	frame_oam -16, -12, $56, $00
	frame_oam -16,  -4, $58, $00
	frame_oam -16,   4, $5a, $00
	db $80

.frame_18
	frame_oam -32,   4, $52, $20
	frame_oam -32,  -4, $54, $20
	frame_oam -32, -12, $0e, $20
	frame_oam -16,   4, $56, $20
	frame_oam -16,  -4, $58, $20
	frame_oam -16, -12, $5a, $20
	db $80

.frame_19
	frame_oam -32,   4, $0e, $00
	frame_oam -32, -12, $0e, $20
	frame_oam -32,  -4, $1e, $00
	frame_oam -16, -12, $5c, $00
	frame_oam -16,  -4, $5e, $00
	frame_oam -16,   4, $5c, $20
	db $80

.frame_20
	frame_oam -32, -12, $60, $00
	frame_oam -32,  -4, $62, $00
	frame_oam -32,   4, $64, $00
	frame_oam -16, -12, $66, $00
	frame_oam -16,  -4, $68, $00
	frame_oam -16,   4, $6a, $00
	db $80

.frame_21
	frame_oam -32, -12, $6c, $00
	frame_oam -32,  -4, $6e, $00
	frame_oam -32,   4, $70, $00
	frame_oam -16, -12, $72, $00
	frame_oam -16,  -4, $74, $00
	frame_oam -16,   4, $76, $00
	db $80

.frame_22
	frame_oam -32,   4, $60, $20
	frame_oam -32,  -4, $62, $20
	frame_oam -32, -12, $64, $20
	frame_oam -16,   4, $66, $20
	frame_oam -16,  -4, $68, $20
	frame_oam -16, -12, $6a, $20
	db $80

.frame_23
	frame_oam -32,   4, $6c, $20
	frame_oam -32,  -4, $6e, $20
	frame_oam -32, -12, $70, $20
	frame_oam -16,   4, $72, $20
	frame_oam -16,  -4, $74, $20
	frame_oam -16, -12, $76, $20
	db $80

.frame_24
	frame_oam  -9, -12, $7c, $00
	frame_oam  -9,  -4, $7e, $00
	frame_oam  -9,   4, $7c, $20
	frame_oam -25, -16, $78, $00
	frame_oam -25,  -8, $7a, $00
	frame_oam -25,   8, $78, $20
	frame_oam -25,   0, $7a, $20
	db $80
; 0x1dd230

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

	INCROM $1dd2f9, $1dd313

Frameset_1dd313: ; 1dd313 (77:5313)
	db $18,  4
	db $ff
; 0x1dd316

Frameset_1dd316: ; 1dd316 (77:5316)
	db $18,  4
	db $03,  2
	db $04,  2
	db $05,  4
	db $04,  2
	db $03,  2
	db $ff
; 0x1dd323

Frameset_1dd323: ; 1dd323 (77:5323)
	db $18,  4
	db $0c,  2
	db $0d,  2
	db $0e,  4
	db $0d,  2
	db $0c,  2
	db $ff
; 0x1dd330
