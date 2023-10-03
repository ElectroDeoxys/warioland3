OAM_1fc000:: ; 1fc000 (7f:4000)
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
	frame_oam -32, -16, $00, 0
	frame_oam -32,  -8, $02, 0
	frame_oam -16, -16, $20, 0
	frame_oam -16,  -8, $22, 0
	frame_oam -32,   8, $00, 0 | OAMF_XFLIP
	frame_oam -32,   0, $02, 0 | OAMF_XFLIP
	frame_oam -16,   8, $20, 0 | OAMF_XFLIP
	frame_oam -16,   0, $22, 0 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -16, -16, $24, 0
	frame_oam -16,  -8, $26, 0
	frame_oam -32, -12, $04, 0
	frame_oam -32,  -4, $06, 0
	frame_oam -32,   4, $04, 0 | OAMF_XFLIP
	frame_oam -16,   8, $24, 0 | OAMF_XFLIP
	frame_oam -16,   0, $26, 0 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -16,   0, $08, 0
	frame_oam -16,   8, $0a, 0
	frame_oam -32, -12, $04, 0
	frame_oam -32,  -4, $06, 0
	frame_oam -32,   4, $04, 0 | OAMF_XFLIP
	frame_oam -16, -16, $20, 0
	frame_oam -16,  -8, $22, 0
	db $80

.frame_3
	frame_oam -16,  -8, $08, 0 | OAMF_XFLIP
	frame_oam -16, -16, $0a, 0 | OAMF_XFLIP
	frame_oam -32,   4, $04, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $06, 0 | OAMF_XFLIP
	frame_oam -32, -12, $04, 0
	frame_oam -16,   8, $20, 0 | OAMF_XFLIP
	frame_oam -16,   0, $22, 0 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -32,   6, $0e, 0 | OAMF_XFLIP
	frame_oam -32,  -1, $10, 0 | OAMF_XFLIP
	frame_oam -32,  -9, $12, 0 | OAMF_XFLIP
	frame_oam -16,   7, $2e, 0 | OAMF_XFLIP
	frame_oam -16,  -1, $30, 0 | OAMF_XFLIP
	frame_oam -16,  -9, $32, 0 | OAMF_XFLIP
	frame_oam -21, -17, $14, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16,  -8, $36, 0
	frame_oam -16,   0, $36, 0 | OAMF_XFLIP
	frame_oam -16, -16, $34, 0
	frame_oam -16,   8, $34, 0 | OAMF_XFLIP
	frame_oam -32,   0, $18, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $1a, 0 | OAMF_XFLIP
	frame_oam -32,   7, $0e, 0 | OAMF_XFLIP
	frame_oam -32, -16, $0e, 0
	db $80

.frame_6
	frame_oam -32,  -8, $16, 0
	frame_oam -16,  -8, $36, 0
	frame_oam -32,   0, $16, 0 | OAMF_XFLIP
	frame_oam -16,   0, $36, 0 | OAMF_XFLIP
	frame_oam -16, -16, $34, 0
	frame_oam -16,   8, $34, 0 | OAMF_XFLIP
	frame_oam -32, -16, $00, 0
	frame_oam -32,   8, $00, 0 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -16,   0, $36, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $36, 0
	frame_oam -16,   8, $34, 0 | OAMF_XFLIP
	frame_oam -16, -16, $34, 0
	frame_oam -32,  -8, $18, 0
	frame_oam -32,   0, $1a, 0
	frame_oam -32, -15, $0e, 0
	frame_oam -32,   8, $0e, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -32, -14, $0e, 0
	frame_oam -32,  -7, $10, 0
	frame_oam -32,   1, $12, 0
	frame_oam -16, -15, $2e, 0
	frame_oam -16,  -7, $30, 0
	frame_oam -16,   1, $32, 0
	frame_oam -21,   9, $14, 0
	db $80

.frame_9
	frame_oam -16, -16, $3c, 0
	frame_oam -16,   8, $3c, 0 | OAMF_XFLIP
	frame_oam -32, -12, $38, 0
	frame_oam -32,  -4, $3a, 0
	frame_oam -32,   4, $38, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $1c, 0
	frame_oam -16,   0, $1c, 0 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -16,  -8, $3e, 0
	frame_oam -16,   8, $3c, 0 | OAMF_XFLIP
	frame_oam -16,   0, $3e, 0 | OAMF_XFLIP
	frame_oam -32, -12, $40, 0
	frame_oam -32,  -4, $42, 0
	frame_oam -32,   4, $40, 0 | OAMF_XFLIP
	frame_oam -16, -16, $1e, 0
	db $80

.frame_11
	frame_oam -16,   0, $3e, 0 | OAMF_XFLIP
	frame_oam -16, -16, $3c, 0
	frame_oam -16,  -8, $3e, 0
	frame_oam -32,   4, $40, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $42, 0
	frame_oam -32, -12, $40, 0
	frame_oam -16,   8, $1e, 0 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -42,   2, $44, 0
	frame_oam -32, -12, $38, 0
	frame_oam -32,  -4, $3a, 0
	frame_oam -32,   4, $38, 0 | OAMF_XFLIP
	frame_oam -16, -16, $3c, 0
	frame_oam -16,   8, $3c, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $1c, 0
	frame_oam -16,   0, $1c, 0 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -16,  -8, $3e, 0
	frame_oam -16,   0, $3e, 0 | OAMF_XFLIP
	frame_oam -16, -16, $4c, 0
	frame_oam -16,   8, $4c, 0 | OAMF_XFLIP
	frame_oam -32, -12, $40, 0
	frame_oam -32,  -4, $42, 0
	frame_oam -32,   4, $40, 0 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16, -16, $50, 0
	frame_oam -16,   8, $50, 0 | OAMF_XFLIP
	frame_oam -32, -12, $38, 0
	frame_oam -32,  -4, $3a, 0
	frame_oam -32,   4, $38, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $1c, 0
	frame_oam -16,   0, $1c, 0 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -44,   2, $44, 0
	frame_oam -32, -12, $38, 0
	frame_oam -32,  -4, $3a, 0
	frame_oam -32,   4, $38, 0 | OAMF_XFLIP
	frame_oam -16,   8, $1e, 0 | OAMF_XFLIP
	frame_oam -16, -16, $1e, 0
	frame_oam -16,  -8, $1c, 0
	frame_oam -16,   0, $1c, 0 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -32, -12, $54, 0
	frame_oam -32,  -4, $56, 0
	frame_oam -16, -16, $5c, 0
	frame_oam -16,  -8, $5e, 0
	frame_oam -16,   0, $28, 0
	db $80

.frame_17
	frame_oam -45,  -2, $48, 0
	frame_oam -45,   6, $48, 0 | OAMF_XFLIP
	frame_oam -16,   8, $1e, 0 | OAMF_XFLIP
	frame_oam -16, -16, $1e, 0
	frame_oam -32, -12, $38, 0
	frame_oam -32,   4, $38, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $52, 0
	frame_oam -16,  -8, $1c, 0
	frame_oam -16,   0, $1c, 0 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -45,  -2, $46, 0
	frame_oam -45,   6, $46, 0 | OAMF_XFLIP
	frame_oam -16,   8, $1e, 0 | OAMF_XFLIP
	frame_oam -16, -16, $1e, 0
	frame_oam -32, -12, $38, 0
	frame_oam -32,   4, $38, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $52, 0
	frame_oam -16,  -8, $1c, 0
	frame_oam -16,   0, $1c, 0 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -32, -12, $38, 0
	frame_oam -32,  -4, $3a, 0
	frame_oam -32,   4, $38, 0 | OAMF_XFLIP
	frame_oam -16,   8, $1e, 0 | OAMF_XFLIP
	frame_oam -16, -16, $1e, 0
	frame_oam -16,  -8, $3e, 0
	frame_oam -16,   0, $3e, 0 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -16,   8, $1e, 0 | OAMF_XFLIP
	frame_oam -16, -16, $1e, 0
	frame_oam -32, -12, $38, 0
	frame_oam -32,   4, $38, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $52, 0
	frame_oam -16,  -8, $1c, 0
	frame_oam -16,   0, $1c, 0 | OAMF_XFLIP
	db $80
; 0x1fc2ab

Frameset_1fc2ab:: ; 1fc2ab (7f:42ab)
	db $00, 30
	db $01, 18
	db $00,  4
	db $01,  3
	db $00,  4
	db $01,  3
	db $00,  4
	db $01,  3
	db $00,  4
	db $01,  3
	db $00,  4
	db $01,  3
	db $ff
; 0x1fc2c4

Frameset_1fc2c4:: ; 1fc2c4 (7f:42c4)
	db $06, 10
	db $05,  3
	db $04,  8
	db $05,  3
	db $06,  6
	db $07,  3
	db $08,  8
	db $07,  3
	db $06, 30
	db $09, 14
	db $13,  8
	db $0d,  8
	db $0a,  5
	db $0b,  5
	db $0a,  5
	db $0b,  5
	db $09,  5
	db $0a,  5
	db $0b,  5
	db $0a,  5
	db $0b,  5
	db $09,  5
	db $0a,  5
	db $0b,  5
	db $0a,  6
	db $0b,  8
	db $0c,  2
	db $0f,  2
	db $11,  6
	db $12,  3
	db $11,  6
	db $12,  3
	db $14, 30
	db $13, 30
	db $0e,  8
	db $06,  1
	db $ff
; 0x1fc30d

Frameset_1fc30d:: ; 1fc30d (7f:430d)
	db $00, 60
	db $01,  8
	db $02,  8
	db $10,  1
	db $ff
; 0x1fc316

Frameset_1fc316:: ; 1fc316 (7f:4316)
	db $00, 20
	db $01, 20
	db $ff
; 0x1fc31b

OAM_1fc31b:: ; 1fc31b (7f:431b)
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

.frame_0
	frame_oam -31,   4, $00, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -31, -12, $04, 0 | OAMF_XFLIP
	frame_oam -15,   4, $20, 0 | OAMF_XFLIP
	frame_oam -15,  -4, $22, 0 | OAMF_XFLIP
	frame_oam -15, -12, $24, 0 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -32,   4, $46, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $48, 0 | OAMF_XFLIP
	frame_oam -32, -12, $4a, 0 | OAMF_XFLIP
	frame_oam -16,   4, $66, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $68, 0 | OAMF_XFLIP
	frame_oam -16, -12, $6a, 0 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -32, -16, $4c, 0
	frame_oam -32,  -8, $4e, 0
	frame_oam -16, -16, $6c, 0
	frame_oam -16,  -8, $6e, 0
	frame_oam -32,   8, $4c, 0 | OAMF_XFLIP
	frame_oam -32,   0, $4e, 0 | OAMF_XFLIP
	frame_oam -16,   8, $6c, 0 | OAMF_XFLIP
	frame_oam -16,   0, $6e, 0 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -32, -12, $46, 0
	frame_oam -32,  -4, $48, 0
	frame_oam -32,   4, $4a, 0
	frame_oam -16, -12, $66, 0
	frame_oam -16,  -4, $68, 0
	frame_oam -16,   4, $6a, 0
	db $80

.frame_4
	frame_oam -31, -12, $00, 0
	frame_oam -31,  -4, $02, 0
	frame_oam -31,   4, $04, 0
	frame_oam -15, -12, $20, 0
	frame_oam -15,  -4, $22, 0
	frame_oam -15,   4, $24, 0
	db $80

.frame_5
	frame_oam -32,  -4, $5c, 0
	frame_oam -32,   4, $5e, 0
	frame_oam -16, -12, $7a, 0
	frame_oam -16,  -4, $7c, 0
	frame_oam -16,   4, $7e, 0
	frame_oam -31, -12, $40, 0
	db $80

.frame_6
	frame_oam -32, -12, $54, 0
	frame_oam -32,  -4, $56, 0
	frame_oam -32,   4, $58, 0
	frame_oam -16, -12, $74, 0
	frame_oam -16,  -4, $76, 0
	frame_oam -16,   4, $78, 0
	db $80

.frame_7
	frame_oam -32,   0, $50, 0
	frame_oam -16,   0, $70, 0
	frame_oam -16,   8, $72, 0
	frame_oam -32,   8, $4c, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $50, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $70, 0 | OAMF_XFLIP
	frame_oam -16, -16, $72, 0 | OAMF_XFLIP
	frame_oam -32, -16, $4c, 0
	db $80

.frame_8
	frame_oam -32,   4, $54, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $56, 0 | OAMF_XFLIP
	frame_oam -32, -12, $58, 0 | OAMF_XFLIP
	frame_oam -16,   4, $74, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $76, 0 | OAMF_XFLIP
	frame_oam -16, -12, $78, 0 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -32,  -4, $5c, 0 | OAMF_XFLIP
	frame_oam -32, -12, $5e, 0 | OAMF_XFLIP
	frame_oam -16,   4, $7a, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $7c, 0 | OAMF_XFLIP
	frame_oam -16, -12, $7e, 0 | OAMF_XFLIP
	frame_oam -31,   4, $40, 0 | OAMF_XFLIP
	db $80
; 0x1fc439

Frameset_1fc439:: ; 1fc439 (7f:4439)
	db $02,  2
	db $01,  1
	db $00,  1
	db $09,  1
	db $08,  1
	db $07,  2
	db $ff
; 0x1fc446

Frameset_1fc446:: ; 1fc446 (7f:4446)
	db $02,  2
	db $03,  1
	db $04,  1
	db $05,  1
	db $06,  1
	db $07,  2
	db $ff
; 0x1fc453

Frameset_1fc453:: ; 1fc453 (7f:4453)
	db $07,  4
	db $08,  2
	db $09,  4
	db $ff
; 0x1fc45a

Frameset_1fc45a:: ; 1fc45a (7f:445a)
	db $07,  4
	db $06,  2
	db $05,  4
	db $ff
; 0x1fc461

Frameset_1fc461:: ; 1fc461 (7f:4461)
	db $09,  2
	db $00,  1
	db $01,  1
	db $02,  2
	db $ff
; 0x1fc46a

Frameset_1fc46a:: ; 1fc46a (7f:446a)
	db $05,  2
	db $04,  1
	db $03,  1
	db $02,  2
	db $ff
; 0x1fc473

Frameset_1fc473:: ; 1fc473 (7f:4473)
	db $02,  2
	db $03,  1
	db $04,  1
	db $05,  2
	db $ff
; 0x1fc47c

Frameset_1fc47c:: ; 1fc47c (7f:447c)
	db $02,  2
	db $01,  1
	db $00,  1
	db $09,  2
	db $ff
; 0x1fc485

Frameset_1fc485:: ; 1fc485 (7f:4485)
	db $09,  4
	db $ff
; 0x1fc488

Frameset_1fc488:: ; 1fc488 (7f:4488)
	db $05,  4
	db $ff
; 0x1fc48b

OAM_1fc48b:: ; 1fc48b (7f:448b)
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
	frame_oam -32, -13, $00, 0
	frame_oam -32,  -5, $02, 0
	frame_oam -32,   3, $04, 0
	frame_oam -16, -13, $20, 0
	frame_oam -16,  -5, $22, 0
	frame_oam -16,   3, $24, 0
	db $80

.frame_1
	frame_oam -32, -13, $06, 0
	frame_oam -32,  -5, $08, 0
	frame_oam -32,   3, $0a, 0
	frame_oam -16, -13, $26, 0
	frame_oam -16,  -5, $28, 0
	frame_oam -16,   3, $2a, 0
	db $80

.frame_2
	frame_oam -32, -13, $0c, 0
	frame_oam -32,  -5, $0e, 0
	frame_oam -32,   3, $10, 0
	frame_oam -16, -13, $2c, 0
	frame_oam -16,  -5, $2e, 0
	frame_oam -16,   3, $30, 0
	db $80

.frame_3
	frame_oam -32, -13, $12, 0
	frame_oam -32,  -5, $14, 0
	frame_oam -32,   3, $16, 0
	frame_oam -16, -13, $32, 0
	frame_oam -16,  -5, $34, 0
	frame_oam -16,   3, $36, 0
	db $80

.frame_4
	frame_oam -32,   5, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $02, 0 | OAMF_XFLIP
	frame_oam -32, -11, $04, 0 | OAMF_XFLIP
	frame_oam -16,   5, $20, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $22, 0 | OAMF_XFLIP
	frame_oam -16, -11, $24, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -32,   5, $06, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $08, 0 | OAMF_XFLIP
	frame_oam -32, -11, $0a, 0 | OAMF_XFLIP
	frame_oam -16,   5, $26, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $28, 0 | OAMF_XFLIP
	frame_oam -16, -11, $2a, 0 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -32,   5, $0c, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $0e, 0 | OAMF_XFLIP
	frame_oam -32, -11, $10, 0 | OAMF_XFLIP
	frame_oam -16,   5, $2c, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $2e, 0 | OAMF_XFLIP
	frame_oam -16, -11, $30, 0 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -32,   5, $12, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $14, 0 | OAMF_XFLIP
	frame_oam -32, -11, $16, 0 | OAMF_XFLIP
	frame_oam -16,   5, $32, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $34, 0 | OAMF_XFLIP
	frame_oam -16, -11, $36, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -32, -13, $00, 0
	frame_oam -32,  -5, $02, 0
	frame_oam -32,   3, $04, 0
	frame_oam -16, -13, $1e, 0
	frame_oam -16,   3, $3e, 0
	frame_oam -16,  -5, $22, 0
	db $80

.frame_9
	frame_oam -32, -13, $06, 0
	frame_oam -32,  -5, $08, 0
	frame_oam -32,   3, $0a, 0
	frame_oam -16, -13, $40, 0
	frame_oam -16,  -5, $42, 0
	frame_oam -16,   3, $44, 0
	db $80

.frame_10
	frame_oam -32, -13, $0c, 0
	frame_oam -32,  -5, $0e, 0
	frame_oam -32,   3, $10, 0
	frame_oam -16, -13, $46, 0
	frame_oam -16,  -5, $48, 0
	frame_oam -16,   3, $4a, 0
	db $80

.frame_11
	frame_oam -32, -13, $12, 0
	frame_oam -32,  -5, $14, 0
	frame_oam -32,   3, $16, 0
	frame_oam -16, -13, $4c, 0
	frame_oam -16,  -5, $4e, 0
	frame_oam -16,   3, $50, 0
	db $80

.frame_12
	frame_oam -32,   5, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $02, 0 | OAMF_XFLIP
	frame_oam -32, -11, $04, 0 | OAMF_XFLIP
	frame_oam -16,   5, $1e, 0 | OAMF_XFLIP
	frame_oam -16, -11, $3e, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $22, 0 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -32,   5, $06, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $08, 0 | OAMF_XFLIP
	frame_oam -32, -11, $0a, 0 | OAMF_XFLIP
	frame_oam -16,   5, $40, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $42, 0 | OAMF_XFLIP
	frame_oam -16, -11, $44, 0 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -32,   5, $0c, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $0e, 0 | OAMF_XFLIP
	frame_oam -32, -11, $10, 0 | OAMF_XFLIP
	frame_oam -16,   5, $46, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $48, 0 | OAMF_XFLIP
	frame_oam -16, -11, $4a, 0 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -32,   5, $12, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $14, 0 | OAMF_XFLIP
	frame_oam -32, -11, $16, 0 | OAMF_XFLIP
	frame_oam -16,   5, $4c, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $4e, 0 | OAMF_XFLIP
	frame_oam -16, -11, $50, 0 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -32, -12, $52, 0
	frame_oam -32,  -4, $54, 0
	frame_oam -32,   4, $56, 0
	frame_oam -16, -12, $58, 0
	frame_oam -16,  -4, $5a, 0
	frame_oam -16,   4, $5c, 0
	db $80

.frame_17
	frame_oam -32, -12, $5e, 0
	frame_oam -32,  -4, $60, 0
	frame_oam -32,   4, $5e, 0 | OAMF_XFLIP
	frame_oam -16, -12, $62, 0
	frame_oam -16,  -4, $64, 0
	frame_oam -16,   4, $62, 0 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -32,   4, $52, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $54, 0 | OAMF_XFLIP
	frame_oam -32, -12, $56, 0 | OAMF_XFLIP
	frame_oam -16,   4, $58, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $5a, 0 | OAMF_XFLIP
	frame_oam -16, -12, $5c, 0 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -32, -13, $18, 0
	frame_oam -32,  -5, $1a, 0
	frame_oam -32,   3, $1c, 0
	frame_oam -16, -13, $38, 0
	frame_oam -16,  -5, $3a, 0
	frame_oam -16,   3, $3c, 0
	db $80

.frame_20
	frame_oam -32,   5, $18, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $1a, 0 | OAMF_XFLIP
	frame_oam -32, -11, $1c, 0 | OAMF_XFLIP
	frame_oam -16,   5, $38, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $3a, 0 | OAMF_XFLIP
	frame_oam -16, -11, $3c, 0 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -16, -13, $6a, 0
	frame_oam -16,  -5, $6c, 0
	frame_oam -16,   3, $6e, 0
	frame_oam -32,  -9, $66, 0
	frame_oam -32,  -1, $68, 0
	db $80

.frame_22
	frame_oam -16,   3, $74, 0
	frame_oam -16, -13, $76, 0
	frame_oam -16,  -5, $78, 0
	db $80

.frame_23
	frame_oam -16, -13, $70, 0
	frame_oam -16,  -5, $72, 0
	frame_oam -16,   3, $74, 0
	db $80

.frame_24
	frame_oam -16,  -5, $7c, 0 | OAMF_XFLIP
	frame_oam -16, -13, $7e, 0 | OAMF_XFLIP
	frame_oam -16,   3, $7e, 0
	frame_oam -28, -11, $66, 0
	frame_oam -28,  -3, $68, 0
	db $80

.frame_25
	frame_oam -17, -13, $7a, 0
	frame_oam -15,  -5, $7c, 0
	frame_oam -16,   3, $7a, 0 | OAMF_XFLIP
	frame_oam -34, -11, $66, 0
	frame_oam -34,  -3, $68, 0
	db $80

.frame_26
	frame_oam -16, -13, $7a, 0
	frame_oam -16,  -5, $7c, 0 | OAMF_XFLIP
	frame_oam -17,   3, $7a, 0 | OAMF_XFLIP
	frame_oam -39, -10, $66, 0
	frame_oam -39,  -2, $68, 0
	db $80

.frame_27
	frame_oam -31,  -1, $66, 0 | OAMF_XFLIP
	frame_oam -31,  -9, $68, 0 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam -25,   1, $66, 0 | OAMF_XFLIP
	frame_oam -25,  -7, $68, 0 | OAMF_XFLIP
	db $80

.frame_29
	frame_oam -21,  -1, $66, 0 | OAMF_XFLIP
	frame_oam -21,  -9, $68, 0 | OAMF_XFLIP
	db $80

.frame_30
	frame_oam -19, -10, $66, 0
	frame_oam -19,  -2, $68, 0
	db $80

.frame_31
	frame_oam -16, -11, $66, 0
	frame_oam -16,  -3, $68, 0
	db $80

.frame_32
	frame_oam -16,   5, $6a, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $6c, 0 | OAMF_XFLIP
	frame_oam -16, -11, $6e, 0 | OAMF_XFLIP
	frame_oam -32,   1, $66, 0 | OAMF_XFLIP
	frame_oam -32,  -7, $68, 0 | OAMF_XFLIP
	db $80

.frame_33
	frame_oam -16, -11, $74, 0 | OAMF_XFLIP
	frame_oam -16,   5, $76, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $78, 0 | OAMF_XFLIP
	db $80

.frame_34
	frame_oam -16,   5, $70, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $72, 0 | OAMF_XFLIP
	frame_oam -16, -11, $74, 0 | OAMF_XFLIP
	db $80

.frame_35
	frame_oam -16,  -3, $7c, 0
	frame_oam -16,   5, $7e, 0
	frame_oam -16, -11, $7e, 0 | OAMF_XFLIP
	frame_oam -28,   3, $66, 0 | OAMF_XFLIP
	frame_oam -28,  -5, $68, 0 | OAMF_XFLIP
	db $80

.frame_36
	frame_oam -17,   5, $7a, 0 | OAMF_XFLIP
	frame_oam -15,  -3, $7c, 0 | OAMF_XFLIP
	frame_oam -16, -11, $7a, 0
	frame_oam -34,   3, $66, 0 | OAMF_XFLIP
	frame_oam -34,  -5, $68, 0 | OAMF_XFLIP
	db $80

.frame_37
	frame_oam -16,   5, $7a, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $7c, 0
	frame_oam -17, -11, $7a, 0
	frame_oam -39,   2, $66, 0 | OAMF_XFLIP
	frame_oam -39,  -6, $68, 0 | OAMF_XFLIP
	db $80

.frame_38
	frame_oam -31,  -7, $66, 0
	frame_oam -31,   1, $68, 0
	db $80

.frame_39
	frame_oam -25,  -9, $66, 0
	frame_oam -25,  -1, $68, 0
	db $80

.frame_40
	frame_oam -21,  -7, $66, 0
	frame_oam -21,   1, $68, 0
	db $80

.frame_41
	frame_oam -19,   2, $66, 0 | OAMF_XFLIP
	frame_oam -19,  -6, $68, 0 | OAMF_XFLIP
	db $80

.frame_42
	frame_oam -16,   3, $66, 0 | OAMF_XFLIP
	frame_oam -16,  -5, $68, 0 | OAMF_XFLIP
	db $80

.frame_43
	frame_oam -18, -11, $66, 0
	frame_oam -18,  -3, $68, 0
	db $80

.frame_44
	frame_oam -18,   3, $66, 0 | OAMF_XFLIP
	frame_oam -18,  -5, $68, 0 | OAMF_XFLIP
	db $80

.frame_45
	frame_oam -33, -14, $18, 0
	frame_oam -33,  -6, $1a, 0
	frame_oam -33,   2, $1c, 0
	frame_oam -17, -14, $38, 0
	frame_oam -17,  -6, $3a, 0
	frame_oam -17,   2, $3c, 0
	db $80

.frame_46
	frame_oam -33,   6, $18, 0 | OAMF_XFLIP
	frame_oam -33,  -2, $1a, 0 | OAMF_XFLIP
	frame_oam -33, -10, $1c, 0 | OAMF_XFLIP
	frame_oam -17,   6, $38, 0 | OAMF_XFLIP
	frame_oam -17,  -2, $3a, 0 | OAMF_XFLIP
	frame_oam -17, -10, $3c, 0 | OAMF_XFLIP
	db $80
; 0x1fc870

Frameset_1fc870:: ; 1fc870 (7f:4870)
	db $01,  9
	db $02, 15
	db $03, 12
	db $00, 11
	db $ff
; 0x1fc879

Frameset_1fc879:: ; 1fc879 (7f:4879)
	db $05,  9
	db $06, 15
	db $07, 12
	db $04, 11
	db $ff
; 0x1fc882

Frameset_1fc882:: ; 1fc882 (7f:4882)
	db $08, 12
	db $09, 12
	db $0a, 12
	db $0b, 12
	db $ff
; 0x1fc88b

Frameset_1fc88b:: ; 1fc88b (7f:488b)
	db $0c, 12
	db $0d, 12
	db $0e, 12
	db $0f, 12
	db $ff
; 0x1fc894

Frameset_1fc894:: ; 1fc894 (7f:4894)
	db $00,  1
	db $10,  8
	db $11,  8
	db $12,  8
	db $ff
; 0x1fc89d

Frameset_1fc89d:: ; 1fc89d (7f:489d)
	db $04,  1
	db $12,  8
	db $11,  8
	db $10,  8
	db $ff
; 0x1fc8a6

Frameset_1fc8a6:: ; 1fc8a6 (7f:48a6)
	db $00,  6
	db $01,  8
	db $ff
; 0x1fc8ab

Frameset_1fc8ab:: ; 1fc8ab (7f:48ab)
	db $04,  6
	db $05,  8
	db $ff
; 0x1fc8b0

Frameset_1fc8b0:: ; 1fc8b0 (7f:48b0)
	db $13,  4
	db $ff
; 0x1fc8b3

Frameset_1fc8b3:: ; 1fc8b3 (7f:48b3)
	db $14,  4
	db $ff
; 0x1fc8b6

Frameset_1fc8b6:: ; 1fc8b6 (7f:48b6)
	db $00,  4
	db $ff
; 0x1fc8b9

Frameset_1fc8b9:: ; 1fc8b9 (7f:48b9)
	db $04,  4
	db $ff
; 0x1fc8bc

Frameset_1fc8bc:: ; 1fc8bc (7f:48bc)
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

Frameset_1fc8d5:: ; 1fc8d5 (7f:48d5)
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

Frameset_1fc8ee:: ; 1fc8ee (7f:48ee)
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

Frameset_1fc90b:: ; 1fc90b (7f:490b)
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

Frameset_1fc928:: ; 1fc928 (7f:4928)
	db $1f,  4
	db $ff
; 0x1fc92b

Frameset_1fc92b:: ; 1fc92b (7f:492b)
	db $2a,  4
	db $ff
; 0x1fc92e

Frameset_1fc92e:: ; 1fc92e (7f:492e)
	db $00,  1
	db $09,  3
	db $2d,  5
	db $13,  2
	db $0a,  3
	db $08,  3
	db $ff
; 0x1fc93b

Frameset_1fc93b:: ; 1fc93b (7f:493b)
	db $04,  1
	db $0d,  3
	db $2e,  5
	db $14,  2
	db $0e,  3
	db $0c,  3
	db $ff
; 0x1fc948

Frameset_1fc948:: ; 1fc948 (7f:4948)
	db $01,  6
	db $15,  4
	db $17,  3
	db $16,  4
	db $15,  8
	db $ff
; 0x1fc953

Frameset_1fc953:: ; 1fc953 (7f:4953)
	db $05,  6
	db $20,  4
	db $22,  3
	db $21,  4
	db $20,  8
	db $ff
; 0x1fc95e

OAM_1fc95e:: ; 1fc95e (7f:495e)
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
	frame_oam -16, -16, $00, 0
	frame_oam -16,  -8, $02, 0
	frame_oam -16,   8, $00, 0 | OAMF_XFLIP
	frame_oam -16,   0, $02, 0 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -16,   8, $04, 0 | OAMF_XFLIP
	frame_oam -16,   0, $06, 0 | OAMF_XFLIP
	frame_oam -16, -16, $04, 0
	frame_oam -16,  -8, $06, 0
	db $80

.frame_2
	frame_oam -21, -16, $08, 0
	frame_oam -21,  -8, $0a, 0
	frame_oam -21,   8, $08, 0 | OAMF_XFLIP
	frame_oam -21,   0, $0a, 0 | OAMF_XFLIP
	frame_oam  -5,  -8, $0c, 0
	frame_oam  -5,   0, $0c, 0 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -28, -16, $0e, 0
	frame_oam -28,   8, $0e, 0 | OAMF_XFLIP
	frame_oam -28,  -8, $12, 0
	frame_oam -28,   0, $12, 0 | OAMF_XFLIP
	frame_oam -12,  -8, $14, 0
	frame_oam -12,   0, $14, 0 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -30, -16, $10, 0
	frame_oam -30,  -8, $12, 0
	frame_oam -30,   8, $10, 0 | OAMF_XFLIP
	frame_oam -30,   0, $12, 0 | OAMF_XFLIP
	frame_oam -14,  -8, $16, 0
	frame_oam -14,   0, $16, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -32, -16, $10, 0
	frame_oam -32,  -8, $12, 0
	frame_oam -32,   8, $10, 0 | OAMF_XFLIP
	frame_oam -32,   0, $12, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $18, 0
	frame_oam -16,   0, $18, 0 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -32, -16, $10, 0
	frame_oam -32,  -8, $12, 0
	frame_oam -32,   8, $10, 0 | OAMF_XFLIP
	frame_oam -32,   0, $12, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $16, 0
	frame_oam -16,   0, $16, 0 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -32, -16, $0e, 0
	frame_oam -32,   8, $0e, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $12, 0
	frame_oam -32,   0, $12, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $14, 0
	frame_oam -16,   0, $14, 0 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -32, -16, $08, 0
	frame_oam -32,  -8, $0a, 0
	frame_oam -32,   8, $08, 0 | OAMF_XFLIP
	frame_oam -32,   0, $0a, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $0c, 0
	frame_oam -16,   0, $0c, 0 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -36,   8, $04, 0 | OAMF_XFLIP
	frame_oam -36,   0, $06, 0 | OAMF_XFLIP
	frame_oam -36, -16, $04, 0
	frame_oam -36,  -8, $06, 0
	db $80

.frame_10
	frame_oam -38, -16, $00, 0
	frame_oam -38,  -8, $02, 0
	frame_oam -38,   8, $00, 0 | OAMF_XFLIP
	frame_oam -38,   0, $02, 0 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -48,  -6, $1a, 0
	frame_oam -48,   2, $1c, 0
	frame_oam -32, -17, $1e, 0
	frame_oam -32,  -9, $20, 0
	frame_oam -32,  -1, $22, 0
	frame_oam -32,   7, $24, 0
	frame_oam -16,  -9, $26, 0
	frame_oam -16,  -1, $28, 0
	frame_oam -16,   7, $2a, 0
	db $80

.frame_12
	frame_oam -48,  -6, $1a, 0
	frame_oam -48,   2, $1c, 0
	frame_oam -32, -17, $1e, 0
	frame_oam -32,  -9, $20, 0
	frame_oam -32,   7, $24, 0
	frame_oam -16,   7, $2a, 0
	frame_oam -16,  -9, $2e, 0
	frame_oam -16,  -1, $30, 0
	frame_oam -32,  -1, $2c, 0
	db $80

.frame_13
	frame_oam -36, -12, $32, 0
	frame_oam -36,  -4, $34, 0
	frame_oam -36,   4, $36, 0
	frame_oam -36,  12, $38, 0
	frame_oam -20,  -9, $3a, 0
	frame_oam -20,  -1, $3c, 0
	frame_oam -20,   7, $3e, 0
	frame_oam  -4, -12, $40, 0
	db $80

.frame_14
	frame_oam -15, -20, $42, 0
	frame_oam -24, -12, $44, 0
	frame_oam -32,  -4, $46, 0
	frame_oam -32,   4, $48, 0
	frame_oam -21,  12, $4a, 0
	frame_oam -16,  -4, $4c, 0
	frame_oam -16,   4, $4e, 0
	db $80

.frame_15
	frame_oam -31, -16, $50, 0
	frame_oam -31,  -8, $52, 0
	frame_oam -31,   0, $54, 0
	frame_oam -31,   8, $56, 0
	frame_oam -15, -13, $58, 0
	frame_oam -15,  -5, $5a, 0
	frame_oam -15,   3, $5c, 0
	frame_oam -15,  11, $5e, 0
	db $80

.frame_16
	frame_oam -16, -16, $10, 0 | OAMF_YFLIP
	frame_oam -16,  -8, $12, 0 | OAMF_YFLIP
	frame_oam -16,   8, $10, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $12, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,  -8, $18, 0 | OAMF_YFLIP
	frame_oam -32,   0, $18, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_17
	frame_oam -48,  -2, $1a, 0 | OAMF_XFLIP
	frame_oam -48, -10, $1c, 0 | OAMF_XFLIP
	frame_oam -32,   9, $1e, 0 | OAMF_XFLIP
	frame_oam -32,   1, $20, 0 | OAMF_XFLIP
	frame_oam -32,  -7, $22, 0 | OAMF_XFLIP
	frame_oam -32, -15, $24, 0 | OAMF_XFLIP
	frame_oam -16,   1, $26, 0 | OAMF_XFLIP
	frame_oam -16,  -7, $28, 0 | OAMF_XFLIP
	frame_oam -16, -15, $2a, 0 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -48,  -2, $1a, 0 | OAMF_XFLIP
	frame_oam -48, -10, $1c, 0 | OAMF_XFLIP
	frame_oam -32,   9, $1e, 0 | OAMF_XFLIP
	frame_oam -32,   1, $20, 0 | OAMF_XFLIP
	frame_oam -32, -15, $24, 0 | OAMF_XFLIP
	frame_oam -16, -15, $2a, 0 | OAMF_XFLIP
	frame_oam -16,   1, $2e, 0 | OAMF_XFLIP
	frame_oam -16,  -7, $30, 0 | OAMF_XFLIP
	frame_oam -32,  -7, $2c, 0 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -36,   4, $32, 0 | OAMF_XFLIP
	frame_oam -36,  -4, $34, 0 | OAMF_XFLIP
	frame_oam -36, -12, $36, 0 | OAMF_XFLIP
	frame_oam -36, -20, $38, 0 | OAMF_XFLIP
	frame_oam -20,   1, $3a, 0 | OAMF_XFLIP
	frame_oam -20,  -7, $3c, 0 | OAMF_XFLIP
	frame_oam -20, -15, $3e, 0 | OAMF_XFLIP
	frame_oam  -4,   4, $40, 0 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -15,  12, $42, 0 | OAMF_XFLIP
	frame_oam -24,   4, $44, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $46, 0 | OAMF_XFLIP
	frame_oam -32, -12, $48, 0 | OAMF_XFLIP
	frame_oam -21, -20, $4a, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $4c, 0 | OAMF_XFLIP
	frame_oam -16, -12, $4e, 0 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -31,   8, $50, 0 | OAMF_XFLIP
	frame_oam -31,   0, $52, 0 | OAMF_XFLIP
	frame_oam -31,  -8, $54, 0 | OAMF_XFLIP
	frame_oam -31, -16, $56, 0 | OAMF_XFLIP
	frame_oam -15,   5, $58, 0 | OAMF_XFLIP
	frame_oam -15,  -3, $5a, 0 | OAMF_XFLIP
	frame_oam -15, -11, $5c, 0 | OAMF_XFLIP
	frame_oam -15, -19, $5e, 0 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -16, -16, $10, 0 | OAMF_YFLIP
	frame_oam -16,  -8, $12, 0 | OAMF_YFLIP
	frame_oam -16,   8, $10, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $12, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,  -8, $16, 0 | OAMF_YFLIP
	frame_oam -32,   0, $16, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_23
	frame_oam -16, -16, $0e, 0 | OAMF_YFLIP
	frame_oam -16,   8, $0e, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $12, 0 | OAMF_YFLIP
	frame_oam -16,   0, $12, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,  -8, $14, 0 | OAMF_YFLIP
	frame_oam -32,   0, $14, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_24
	frame_oam -16, -16, $08, 0 | OAMF_YFLIP
	frame_oam -16,  -8, $0a, 0 | OAMF_YFLIP
	frame_oam -16,   8, $08, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $0a, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,  -8, $0c, 0 | OAMF_YFLIP
	frame_oam -32,   0, $0c, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_25
	frame_oam -12,   8, $04, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -12,   0, $06, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -12, -16, $04, 0 | OAMF_YFLIP
	frame_oam -12,  -8, $06, 0 | OAMF_YFLIP
	db $80

.frame_26
	frame_oam -10, -16, $00, 0 | OAMF_YFLIP
	frame_oam -10,  -8, $02, 0 | OAMF_YFLIP
	frame_oam -10,   8, $00, 0 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -10,   0, $02, 0 | OAMF_XFLIP | OAMF_YFLIP
	db $80
; 0x1fcc5f

Frameset_1fcc5f:: ; 1fcc5f (7f:4c5f)
	db $04,  1
	db $03,  1
	db $02,  1
	db $01,  2
	db $00,  7
	db $01,  2
	db $ff
; 0x1fcc6c

Frameset_1fcc6c:: ; 1fcc6c (7f:4c6c)
	db $02,  1
	db $03,  1
	db $04,  1
	db $05,  2
	db $ff
; 0x1fcc75

Frameset_1fcc75:: ; 1fcc75 (7f:4c75)
	db $06,  1
	db $07,  1
	db $08,  1
	db $09,  2
	db $0a,  7
	db $09,  2
	db $ff
; 0x1fcc82

Frameset_1fcc82:: ; 1fcc82 (7f:4c82)
	db $10,  4
	db $ff
; 0x1fcc85

Frameset_1fcc85:: ; 1fcc85 (7f:4c85)
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

Frameset_1fcc98:: ; 1fcc98 (7f:4c98)
	db $10,  1
	db $15,  4
	db $14,  4
	db $13,  6
	db $11,  4
	db $12,  3
	db $ff
; 0x1fcca5

Frameset_1fcca5:: ; 1fcca5 (7f:4ca5)
	db $10,  1
	db $0f,  4
	db $0e,  4
	db $0d,  6
	db $0b,  4
	db $0c,  3
	db $ff
; 0x1fccb2

Frameset_1fccb2:: ; 1fccb2 (7f:4cb2)
	db $0b,  3
	db $0c,  4
	db $0d,  6
	db $0e,  4
	db $0f,  4
	db $10,  1
	db $ff
; 0x1fccbf

Frameset_1fccbf:: ; 1fccbf (7f:4cbf)
	db $11,  3
	db $12,  4
	db $13,  6
	db $14,  4
	db $15,  4
	db $10,  1
	db $ff
; 0x1fcccc

; unreferenced
Frameset_1fcccc: ; 1fcccc (7f:4ccc)
	db $08,  2
	db $07,  1
	db $06,  1
	db $05,  4
	db $ff
; 0x1fccd5

OAM_1fccd5:: ; 1fccd5 (7f:4cd5)
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
	frame_oam -32, -16, $00, 0
	frame_oam -32,  -8, $02, 0
	frame_oam -32,   0, $04, 0
	frame_oam -32,   8, $06, 0
	frame_oam -16,  -8, $08, 0
	frame_oam -16,   0, $0a, 0
	frame_oam -16,   8, $0c, 0
	frame_oam -16,  16, $0e, 0
	db $80

.frame_1
	frame_oam -32, -16, $10, 0
	frame_oam -32,  -8, $12, 0
	frame_oam -32,   0, $14, 0
	frame_oam -32,   8, $16, 0
	frame_oam -16,  -8, $18, 0
	frame_oam -16,   0, $1a, 0
	frame_oam -16,   8, $1c, 0
	frame_oam -16,  16, $1e, 0
	db $80

.frame_2
	frame_oam -32, -15, $20, 0
	frame_oam -32,  -7, $22, 0
	frame_oam -32,   1, $24, 0
	frame_oam -32,   9, $26, 0
	frame_oam -16,  -9, $28, 0
	frame_oam -16,  -1, $2a, 0
	frame_oam -16,   7, $2c, 0
	frame_oam -16,  15, $2e, 0
	db $80

.frame_3
	frame_oam -32, -16, $30, 0
	frame_oam -32,  -8, $32, 0
	frame_oam -32,   0, $34, 0
	frame_oam -32,   8, $36, 0
	frame_oam -16,  -8, $38, 0
	frame_oam -16,   0, $3a, 0
	frame_oam -16,   8, $3c, 0
	frame_oam -18,  16, $3e, 0
	db $80

.frame_4
	frame_oam -32, -16, $00, 0
	frame_oam -32,   8, $06, 0
	frame_oam -16,  -8, $08, 0
	frame_oam -16,   0, $0a, 0
	frame_oam -16,   8, $0c, 0
	frame_oam -16,  16, $0e, 0
	frame_oam -32,  -8, $40, 0
	frame_oam -32,   0, $42, 0
	db $80

.frame_5
	frame_oam -32, -16, $10, 0
	frame_oam -32,   8, $16, 0
	frame_oam -16,  -8, $18, 0
	frame_oam -16,   0, $1a, 0
	frame_oam -16,   8, $1c, 0
	frame_oam -16,  16, $1e, 0
	frame_oam -32,  -8, $44, 0
	frame_oam -32,   0, $46, 0
	db $80

.frame_6
	frame_oam -32, -15, $20, 0
	frame_oam -32,   9, $26, 0
	frame_oam -16,  -9, $28, 0
	frame_oam -16,  -1, $2a, 0
	frame_oam -16,   7, $2c, 0
	frame_oam -16,  15, $2e, 0
	frame_oam -32,  -7, $48, 0
	frame_oam -32,   1, $4a, 0
	db $80

.frame_7
	frame_oam -32, -16, $30, 0
	frame_oam -32,   8, $36, 0
	frame_oam -16,  -8, $38, 0
	frame_oam -16,   0, $3a, 0
	frame_oam -16,   8, $3c, 0
	frame_oam -18,  16, $3e, 0
	frame_oam -32,  -8, $4c, 0
	frame_oam -32,   0, $4e, 0
	db $80

.frame_8
	frame_oam -32, -16, $50, 0
	frame_oam -32,  -8, $52, 0
	frame_oam -16, -16, $54, 0
	frame_oam -16,  -8, $56, 0
	frame_oam -32,   8, $50, 0 | OAMF_XFLIP
	frame_oam -32,   0, $52, 0 | OAMF_XFLIP
	frame_oam -16,   8, $54, 0 | OAMF_XFLIP
	frame_oam -16,   0, $56, 0 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -32,   8, $00, 0 | OAMF_XFLIP
	frame_oam -32,   0, $02, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $04, 0 | OAMF_XFLIP
	frame_oam -32, -16, $06, 0 | OAMF_XFLIP
	frame_oam -16,   0, $08, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $0a, 0 | OAMF_XFLIP
	frame_oam -16, -16, $0c, 0 | OAMF_XFLIP
	frame_oam -16, -24, $0e, 0 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -32,   8, $10, 0 | OAMF_XFLIP
	frame_oam -32,   0, $12, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $14, 0 | OAMF_XFLIP
	frame_oam -32, -16, $16, 0 | OAMF_XFLIP
	frame_oam -16,   0, $18, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $1a, 0 | OAMF_XFLIP
	frame_oam -16, -16, $1c, 0 | OAMF_XFLIP
	frame_oam -16, -24, $1e, 0 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -32,   7, $20, 0 | OAMF_XFLIP
	frame_oam -32,  -1, $22, 0 | OAMF_XFLIP
	frame_oam -32,  -9, $24, 0 | OAMF_XFLIP
	frame_oam -32, -17, $26, 0 | OAMF_XFLIP
	frame_oam -16,   1, $28, 0 | OAMF_XFLIP
	frame_oam -16,  -7, $2a, 0 | OAMF_XFLIP
	frame_oam -16, -15, $2c, 0 | OAMF_XFLIP
	frame_oam -16, -23, $2e, 0 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -32,   8, $30, 0 | OAMF_XFLIP
	frame_oam -32,   0, $32, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $34, 0 | OAMF_XFLIP
	frame_oam -32, -16, $36, 0 | OAMF_XFLIP
	frame_oam -16,   0, $38, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $3a, 0 | OAMF_XFLIP
	frame_oam -16, -16, $3c, 0 | OAMF_XFLIP
	frame_oam -18, -24, $3e, 0 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -32,   8, $00, 0 | OAMF_XFLIP
	frame_oam -32, -16, $06, 0 | OAMF_XFLIP
	frame_oam -16,   0, $08, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $0a, 0 | OAMF_XFLIP
	frame_oam -16, -16, $0c, 0 | OAMF_XFLIP
	frame_oam -16, -24, $0e, 0 | OAMF_XFLIP
	frame_oam -32,   0, $40, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $42, 0 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -32,   8, $10, 0 | OAMF_XFLIP
	frame_oam -32, -16, $16, 0 | OAMF_XFLIP
	frame_oam -16,   0, $18, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $1a, 0 | OAMF_XFLIP
	frame_oam -16, -16, $1c, 0 | OAMF_XFLIP
	frame_oam -16, -24, $1e, 0 | OAMF_XFLIP
	frame_oam -32,   0, $44, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $46, 0 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -32,   7, $20, 0 | OAMF_XFLIP
	frame_oam -32, -17, $26, 0 | OAMF_XFLIP
	frame_oam -16,   1, $28, 0 | OAMF_XFLIP
	frame_oam -16,  -7, $2a, 0 | OAMF_XFLIP
	frame_oam -16, -15, $2c, 0 | OAMF_XFLIP
	frame_oam -16, -23, $2e, 0 | OAMF_XFLIP
	frame_oam -32,  -1, $48, 0 | OAMF_XFLIP
	frame_oam -32,  -9, $4a, 0 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -32,   8, $30, 0 | OAMF_XFLIP
	frame_oam -32, -16, $36, 0 | OAMF_XFLIP
	frame_oam -16,   0, $38, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $3a, 0 | OAMF_XFLIP
	frame_oam -16, -16, $3c, 0 | OAMF_XFLIP
	frame_oam -18, -24, $3e, 0 | OAMF_XFLIP
	frame_oam -32,   0, $4c, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $4e, 0 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -26, -20, $58, 0
	frame_oam -32, -12, $5a, 0
	frame_oam -32,  -4, $5c, 0
	frame_oam -32,   4, $5e, 0
	frame_oam -16, -12, $60, 0
	frame_oam -16,  -4, $62, 0
	frame_oam -16,   4, $64, 0
	frame_oam -16,  12, $66, 0
	db $80

.frame_18
	frame_oam -26,  12, $58, 0 | OAMF_XFLIP
	frame_oam -32,   4, $5a, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $5c, 0 | OAMF_XFLIP
	frame_oam -32, -12, $5e, 0 | OAMF_XFLIP
	frame_oam -16,   4, $60, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $62, 0 | OAMF_XFLIP
	frame_oam -16, -12, $64, 0 | OAMF_XFLIP
	frame_oam -16, -20, $66, 0 | OAMF_XFLIP
	db $80
; 0x1fcf6e

Frameset_1fcf6e:: ; 1fcf6e (7f:4f6e)
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

Frameset_1fcf9f:: ; 1fcf9f (7f:4f9f)
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

Frameset_1fcfd0:: ; 1fcfd0 (7f:4fd0)
	db $11,  3
	db $08,  3
	db $12,  3
	db $ff
; 0x1fcfd7

Frameset_1fcfd7:: ; 1fcfd7 (7f:4fd7)
	db $12,  3
	db $08,  3
	db $11,  3
	db $ff
; 0x1fcfde

; unreferenced
Frameset_1fcfde: ; 1fcfde (7f:4fde)
	db $00,  3
	db $04,  2
	db $01,  3
	db $05,  2
	db $02,  3
	db $06,  2
	db $03,  3
	db $07,  2
	db $ff
; 0x1fcfef

; unreferenced
Frameset_1fcfef: ; 1fcfef (7f:4fef)
	db $09,  3
	db $0d,  2
	db $0a,  3
	db $0e,  2
	db $0b,  3
	db $0f,  2
	db $0c,  3
	db $10,  2
	db $ff
; 0x1fd000

; unreferenced
Frameset_1fd000: ; 1fd000 (7f:5000)
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
; 0x1fd031

OAM_1fd031:: ; 1fd031 (7f:5031)
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
	frame_oam -29, -16, $64, 0
	frame_oam -13, -16, $66, 0
	frame_oam -29,   8, $64, 0 | OAMF_XFLIP
	frame_oam -13,   8, $66, 0 | OAMF_XFLIP
	frame_oam -29,  -8, $42, 0
	frame_oam -29,   0, $42, 0 | OAMF_XFLIP
	frame_oam -13,  -8, $68, 0
	frame_oam -13,   0, $68, 0 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -29, -16, $64, 0
	frame_oam -13, -16, $66, 0
	frame_oam -29,  -8, $42, 0
	frame_oam -13,  -8, $68, 0
	frame_oam -29,   8, $64, 0 | OAMF_XFLIP
	frame_oam -29,   0, $42, 0 | OAMF_XFLIP
	frame_oam -13,   0, $72, 0
	frame_oam -13,   8, $74, 1
	frame_oam -13,  16, $76, 1
	db $80

.frame_2
	frame_oam -29, -16, $64, 0
	frame_oam -13, -16, $66, 0
	frame_oam -29,  -8, $42, 0
	frame_oam -29,   0, $42, 0 | OAMF_XFLIP
	frame_oam -13,  -8, $68, 0
	frame_oam -30,   8, $6a, 0
	frame_oam -13,   0, $6c, 1
	frame_oam -14,   8, $6e, 1
	frame_oam -25,  16, $70, 1
	db $80

.frame_3
	frame_oam -26, -16, $40, 0
	frame_oam -26,  -8, $42, 0
	frame_oam -26,   0, $42, 0 | OAMF_XFLIP
	frame_oam -10, -16, $44, 0
	frame_oam -10,  -8, $46, 0
	frame_oam -32,   8, $48, 0
	frame_oam -21,  16, $4e, 1
	frame_oam -10,   0, $4a, 1
	frame_oam -16,   8, $4c, 1
	db $80

.frame_4
	frame_oam -32, -16, $50, 0
	frame_oam -24,  -8, $42, 0
	frame_oam -24,   0, $42, 0 | OAMF_XFLIP
	frame_oam -25,   8, $58, 0
	frame_oam -16, -16, $54, 0
	frame_oam  -8,  -8, $56, 0
	frame_oam  -8,   0, $5a, 1
	frame_oam  -9,   8, $5c, 1
	frame_oam -16,  16, $5e, 1
	db $80

.frame_5
	frame_oam -32, -16, $50, 0
	frame_oam -24,  -8, $42, 0
	frame_oam -32,   0, $52, 0 | OAMF_XFLIP
	frame_oam -16, -16, $54, 0
	frame_oam  -8,  -8, $56, 0
	frame_oam -32,   8, $50, 0 | OAMF_XFLIP
	frame_oam -16,   0, $60, 0
	frame_oam -16,   8, $62, 0
	db $80

.frame_6
	frame_oam -16,  -8, $00, 1
	frame_oam -16,   0, $00, 1 | OAMF_XFLIP
	frame_oam -32, -16, $50, 0
	frame_oam -32,  -8, $52, 0
	frame_oam -32,   0, $52, 0 | OAMF_XFLIP
	frame_oam -16, -16, $54, 0
	frame_oam -32,   8, $50, 0 | OAMF_XFLIP
	frame_oam -16,   8, $62, 0
	db $80

.frame_7
	frame_oam -16, -12, $02, 1
	frame_oam -16,  -4, $04, 1
	frame_oam -16,   4, $02, 1 | OAMF_XFLIP
	frame_oam -32, -16, $50, 0
	frame_oam -32,  -8, $52, 0
	frame_oam -32,   0, $52, 0 | OAMF_XFLIP
	frame_oam -16, -16, $54, 0
	frame_oam -32,   8, $50, 0 | OAMF_XFLIP
	frame_oam -16,   8, $62, 0
	db $80

.frame_8
	frame_oam -16,  -6, $0a, 1
	frame_oam -16,   2, $0c, 1
	frame_oam -16,  10, $0e, 1
	frame_oam -32,  -6, $06, 1
	frame_oam -32,   2, $06, 1 | OAMF_XFLIP
	frame_oam -16, -14, $08, 1
	db $80

.frame_9
	frame_oam -32,  -4, $12, 1
	frame_oam -32,   4, $14, 1
	frame_oam -16,   4, $1a, 1
	frame_oam -32, -12, $10, 1
	frame_oam -32,  12, $0e, 1
	frame_oam -16, -12, $16, 1
	frame_oam -16,  -4, $18, 1
	frame_oam -14,  12, $0e, 1
	db $80

.frame_10
	frame_oam -37, -11, $1c, 1
	frame_oam -37,  -3, $1e, 1
	frame_oam -37,   5, $20, 1
	frame_oam -13, -12, $22, 1
	frame_oam -21,  -4, $24, 1
	frame_oam -13,   6, $26, 1
	db $80

.frame_11
	frame_oam -44,   4, $26, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -41, -12, $28, 1
	frame_oam -41,  -4, $2a, 1
	frame_oam -42,  12, $2c, 1
	frame_oam -25,  -8, $2c, 1
	frame_oam -25,   6, $2e, 1
	frame_oam -16,  -8, $32, 1
	frame_oam -16,   0, $32, 1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -26,  -8, $2c, 1
	frame_oam -26,   6, $2e, 1
	frame_oam -16,  -8, $34, 1
	frame_oam -16,   0, $34, 1 | OAMF_XFLIP
	frame_oam -42,   4, $2a, 1 | OAMF_XFLIP
	frame_oam -44,  -4, $2e, 1 | OAMF_XFLIP
	frame_oam -42, -12, $2e, 1 | OAMF_YFLIP
	db $80

.frame_13
	frame_oam -20, -14, $36, 0
	frame_oam -20,  -6, $38, 0
	frame_oam -20,   2, $3a, 0
	frame_oam -20,  10, $3c, 0
	frame_oam  -4,   2, $3e, 0 | OAMF_XFLIP
	frame_oam  -4,  -6, $3e, 0
	frame_oam -38,   4, $2c, 1 | OAMF_YFLIP
	frame_oam -52,  -4, $2e, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -38, -12, $30, 1
	frame_oam -54,   6, $30, 1
	db $80

.frame_14
	frame_oam -20, -14, $36, 0
	frame_oam -20,  -6, $38, 0
	frame_oam -20,   2, $3a, 0
	frame_oam -20,  10, $3c, 0
	frame_oam  -4,  -6, $3e, 0
	frame_oam  -4,   2, $3e, 0 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -22,  -6, $38, 0
	frame_oam -22,   2, $3a, 0
	frame_oam  -6,  -6, $3e, 0
	frame_oam  -6,   2, $3e, 0 | OAMF_XFLIP
	frame_oam -12,  10, $7a, 0
	frame_oam -12, -14, $78, 0
	db $80

.frame_16
	frame_oam -20,   6, $36, 0 | OAMF_XFLIP
	frame_oam -20,  -2, $38, 0 | OAMF_XFLIP
	frame_oam -20, -10, $3a, 0 | OAMF_XFLIP
	frame_oam -20, -18, $3c, 0 | OAMF_XFLIP
	frame_oam  -4,  -2, $3e, 0 | OAMF_XFLIP
	frame_oam  -4, -10, $3e, 0
	db $80

.frame_17
	frame_oam -22,  -2, $38, 0 | OAMF_XFLIP
	frame_oam -22, -10, $3a, 0 | OAMF_XFLIP
	frame_oam  -6,  -2, $3e, 0 | OAMF_XFLIP
	frame_oam  -6, -10, $3e, 0
	frame_oam -12, -18, $7a, 0 | OAMF_XFLIP
	frame_oam -12,   6, $78, 0 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -16,  -8, $34, 1
	frame_oam -16,   0, $34, 1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -16,  -8, $7c, 1
	frame_oam -16,   0, $7c, 1 | OAMF_XFLIP
	frame_oam -16, -16, $36, 0
	frame_oam -16,   8, $3c, 0
	db $80

.frame_20
	frame_oam -16, -12, $02, 1
	frame_oam -16,  -4, $04, 1
	frame_oam -16,   4, $02, 1 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -16,  -8, $34, 1
	frame_oam -16,   0, $34, 1 | OAMF_XFLIP
	frame_oam -37, -11, $1c, 1
	frame_oam -37,  -3, $1e, 1
	frame_oam -37,   5, $20, 1
	frame_oam -13, -12, $22, 1
	frame_oam -13,   6, $26, 1
	frame_oam -21,  -3, $7e, 1
	db $80

.frame_22
	frame_oam -32, -16, $50, 1
	frame_oam -24,  -8, $42, 1
	frame_oam -32,   0, $52, 1 | OAMF_XFLIP
	frame_oam -16, -16, $54, 1
	frame_oam  -8,  -8, $56, 1
	frame_oam -32,   8, $50, 1 | OAMF_XFLIP
	frame_oam -16,   0, $60, 1
	frame_oam -16,   8, $62, 1
	frame_oam -44,   4, $26, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -41, -12, $28, 1
	frame_oam -41,  -4, $2a, 1
	frame_oam -42,  12, $2c, 1
	db $80

.frame_23
	frame_oam -42,   4, $2a, 1 | OAMF_XFLIP
	frame_oam -44,  -4, $2e, 1 | OAMF_XFLIP
	frame_oam -42, -12, $2e, 1 | OAMF_YFLIP
	frame_oam -32, -16, $50, 0
	frame_oam -24,  -8, $42, 0
	frame_oam -32,   0, $52, 0 | OAMF_XFLIP
	frame_oam -16, -16, $54, 0
	frame_oam  -8,  -8, $56, 0
	frame_oam -32,   8, $50, 0 | OAMF_XFLIP
	frame_oam -16,   0, $60, 0
	frame_oam -16,   8, $62, 0
	db $80

.frame_24
	frame_oam -52,  -4, $2e, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -54,   6, $30, 1
	frame_oam -32, -16, $50, 0
	frame_oam -24,  -8, $42, 0
	frame_oam -32,   0, $52, 0 | OAMF_XFLIP
	frame_oam -16, -16, $54, 0
	frame_oam  -8,  -8, $56, 0
	frame_oam -32,   8, $50, 0 | OAMF_XFLIP
	frame_oam -16,   0, $60, 0
	frame_oam -16,   8, $62, 0
	db $80

.frame_25
	frame_oam -29, -16, $64, 0
	frame_oam -13, -16, $66, 0
	frame_oam -29,  -8, $42, 0
	frame_oam -13,  -8, $68, 0
	frame_oam -29,   8, $64, 0 | OAMF_XFLIP
	frame_oam -29,   0, $42, 0 | OAMF_XFLIP
	frame_oam -13,   0, $72, 0
	frame_oam -13,   8, $74, 1
	frame_oam -24,  15, $76, 1 | OAMF_YFLIP
	db $80

.frame_26
	frame_oam -17,  -6, $38, 0
	frame_oam -17,   2, $3a, 0
	frame_oam -16,  10, $40, 0 | OAMF_XFLIP
	frame_oam -16, -14, $40, 0
	db $80

.frame_27
	frame_oam -16,  -6, $38, 0
	frame_oam -16,   2, $3a, 0
	frame_oam -10,  10, $44, 0 | OAMF_XFLIP
	frame_oam -10, -14, $44, 0
	db $80

.frame_28
	frame_oam -17,  -2, $38, 0 | OAMF_XFLIP
	frame_oam -17, -10, $3a, 0 | OAMF_XFLIP
	frame_oam -16, -18, $40, 0
	frame_oam -16,   6, $40, 0 | OAMF_XFLIP
	db $80

.frame_29
	frame_oam -16,  -2, $38, 0 | OAMF_XFLIP
	frame_oam -16, -10, $3a, 0 | OAMF_XFLIP
	frame_oam -10, -18, $44, 0
	frame_oam -10,   6, $44, 0 | OAMF_XFLIP
	db $80

.frame_30
	frame_oam -20,   6, $36, 0 | OAMF_XFLIP
	frame_oam -20,  -2, $38, 0 | OAMF_XFLIP
	frame_oam -20, -10, $3a, 0 | OAMF_XFLIP
	frame_oam -20, -18, $3c, 0 | OAMF_XFLIP
	frame_oam  -4, -10, $3e, 0
	frame_oam  -4,  -2, $3e, 0 | OAMF_XFLIP
	frame_oam -38,   4, $2c, 1 | OAMF_YFLIP
	frame_oam -52,  -4, $2e, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -38, -12, $30, 1
	frame_oam -54,   6, $30, 1
	db $80
; 0x1fd40a

Frameset_1fd40a:: ; 1fd40a (7f:540a)
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

; unreferenced
Frameset_1fd429: ; 1fd429 (7f:5429)
	db $0e,  4
	db $ff
; 0x1fd42c

Frameset_1fd42c:: ; 1fd42c (7f:542c)
	db $0e,  3
	db $0f,  4
	db $ff
; 0x1fd431

; unreferenced
Frameset_1fd431: ; 1fd431 (7f:5431)
	db $10,  4
	db $ff
; 0x1fd434

Frameset_1fd434:: ; 1fd434 (7f:5434)
	db $10,  3
	db $11,  4
	db $ff
; 0x1fd439

Frameset_1fd439:: ; 1fd439 (7f:5439)
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

; unreferenced
Frameset_1fd45c: ; 1fd45c (7f:545c)
	db $00,  4
	db $ff
; 0x1fd45f

Frameset_1fd45f:: ; 1fd45f (7f:545f)
	db $1a,  8
	db $0e,  5
	db $1b,  3
	db $1a,  2
	db $0e,  5
	db $1b,  4
	db $ff
; 0x1fd46c

Frameset_1fd46c:: ; 1fd46c (7f:546c)
	db $1c,  8
	db $10,  5
	db $1d,  3
	db $1c,  2
	db $10,  5
	db $1d,  4
	db $ff
; 0x1fd479

Frameset_1fd479:: ; 1fd479 (7f:5479)
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

OAM_1fd498:: ; 1fd498 (7f:5498)
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
	frame_oam  -8,  -8, $08, 0
	frame_oam  -8,   0, $0a, 0
	frame_oam -40, -12, $00, 0
	frame_oam -40,  -4, $02, 0
	frame_oam -24, -12, $04, 0
	frame_oam -24,  -4, $06, 0
	frame_oam -40,   4, $00, 0 | OAMF_XFLIP
	frame_oam -24,   4, $04, 0 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam  -9,  -8, $0c, 0
	frame_oam  -9,   0, $0e, 0
	frame_oam -41, -12, $00, 0
	frame_oam -41,  -4, $02, 0
	frame_oam -25, -12, $04, 0
	frame_oam -25,  -4, $06, 0
	frame_oam -41,   4, $00, 0 | OAMF_XFLIP
	frame_oam -25,   4, $04, 0 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -10,  -8, $10, 0
	frame_oam -10,   0, $12, 0
	frame_oam -42, -12, $00, 0
	frame_oam -42,  -4, $02, 0
	frame_oam -26, -12, $04, 0
	frame_oam -26,  -4, $06, 0
	frame_oam -42,   4, $00, 0 | OAMF_XFLIP
	frame_oam -26,   4, $04, 0 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam  -9,  -8, $14, 0
	frame_oam  -9,   0, $16, 0
	frame_oam -41, -12, $00, 0
	frame_oam -41,  -4, $02, 0
	frame_oam -25, -12, $04, 0
	frame_oam -25,  -4, $06, 0
	frame_oam -41,   4, $00, 0 | OAMF_XFLIP
	frame_oam -25,   4, $04, 0 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -40,  -9, $18, 0
	frame_oam -40,  -1, $1a, 0
	frame_oam -24, -12, $1c, 0
	frame_oam -24,  -4, $1e, 0
	frame_oam -24,   4, $20, 0
	frame_oam  -8,  -8, $08, 0
	frame_oam  -8,   0, $0a, 0
	db $80

.frame_5
	frame_oam -41,  -9, $18, 0
	frame_oam -41,  -1, $1a, 0
	frame_oam -25, -12, $1c, 0
	frame_oam -25,  -4, $1e, 0
	frame_oam -25,   4, $20, 0
	frame_oam  -9,  -8, $0c, 0
	frame_oam  -9,   0, $0e, 0
	db $80

.frame_6
	frame_oam -42,  -9, $18, 0
	frame_oam -42,  -1, $1a, 0
	frame_oam -26, -12, $1c, 0
	frame_oam -26,  -4, $1e, 0
	frame_oam -26,   4, $20, 0
	frame_oam -10,  -8, $10, 0
	frame_oam -10,   0, $12, 0
	db $80

.frame_7
	frame_oam -41,  -9, $18, 0
	frame_oam -41,  -1, $1a, 0
	frame_oam -25, -12, $1c, 0
	frame_oam -25,  -4, $1e, 0
	frame_oam -25,   4, $20, 0
	frame_oam  -9,  -8, $14, 0
	frame_oam  -9,   0, $16, 0
	db $80

.frame_8
	frame_oam -40,   1, $18, 0 | OAMF_XFLIP
	frame_oam -40,  -7, $1a, 0 | OAMF_XFLIP
	frame_oam -24,   4, $1c, 0 | OAMF_XFLIP
	frame_oam -24,  -4, $1e, 0 | OAMF_XFLIP
	frame_oam -24, -12, $20, 0 | OAMF_XFLIP
	frame_oam  -8,  -8, $08, 0
	frame_oam  -8,   0, $0a, 0
	db $80

.frame_9
	frame_oam -41,   1, $18, 0 | OAMF_XFLIP
	frame_oam -41,  -7, $1a, 0 | OAMF_XFLIP
	frame_oam -25,   4, $1c, 0 | OAMF_XFLIP
	frame_oam -25,  -4, $1e, 0 | OAMF_XFLIP
	frame_oam -25, -12, $20, 0 | OAMF_XFLIP
	frame_oam  -9,  -8, $0c, 0
	frame_oam  -9,   0, $0e, 0
	db $80

.frame_10
	frame_oam -42,   1, $18, 0 | OAMF_XFLIP
	frame_oam -42,  -7, $1a, 0 | OAMF_XFLIP
	frame_oam -26,   4, $1c, 0 | OAMF_XFLIP
	frame_oam -26,  -4, $1e, 0 | OAMF_XFLIP
	frame_oam -26, -12, $20, 0 | OAMF_XFLIP
	frame_oam -10,  -8, $10, 0
	frame_oam -10,   0, $12, 0
	db $80

.frame_11
	frame_oam -41,   1, $18, 0 | OAMF_XFLIP
	frame_oam -41,  -7, $1a, 0 | OAMF_XFLIP
	frame_oam -25,   4, $1c, 0 | OAMF_XFLIP
	frame_oam -25,  -4, $1e, 0 | OAMF_XFLIP
	frame_oam -25, -12, $20, 0 | OAMF_XFLIP
	frame_oam  -9,  -8, $14, 0
	frame_oam  -9,   0, $16, 0
	db $80

.frame_12
	frame_oam -40, -12, $22, 0
	frame_oam -40,  -4, $24, 0
	frame_oam -40,   4, $26, 0
	frame_oam -24, -12, $28, 0
	frame_oam -24,  -4, $2a, 0
	frame_oam -24,   4, $2c, 0
	frame_oam  -8,  -8, $08, 0
	frame_oam  -8,   0, $0a, 0
	db $80

.frame_13
	frame_oam -40,   4, $22, 0 | OAMF_XFLIP
	frame_oam -40,  -4, $24, 0 | OAMF_XFLIP
	frame_oam -40, -12, $26, 0 | OAMF_XFLIP
	frame_oam -24,   4, $28, 0 | OAMF_XFLIP
	frame_oam -24,  -4, $2a, 0 | OAMF_XFLIP
	frame_oam -24, -12, $2c, 0 | OAMF_XFLIP
	frame_oam  -8,  -8, $08, 0
	frame_oam  -8,   0, $0a, 0
	db $80

.frame_14
	frame_oam -40, -12, $2e, 0
	frame_oam -40,  -4, $30, 0
	frame_oam -40,   4, $32, 0
	frame_oam -24, -12, $34, 0
	frame_oam -24,  -4, $36, 0
	frame_oam -24,   4, $38, 0
	frame_oam  -8,  -8, $08, 0
	frame_oam  -8,   0, $0a, 0
	db $80

.frame_15
	frame_oam -41, -12, $2e, 0
	frame_oam -41,  -4, $30, 0
	frame_oam -41,   4, $32, 0
	frame_oam -25, -12, $34, 0
	frame_oam -25,  -4, $36, 0
	frame_oam -25,   4, $38, 0
	frame_oam  -9,  -8, $0c, 0
	frame_oam  -9,   0, $0e, 0
	db $80

.frame_16
	frame_oam -42, -12, $2e, 0
	frame_oam -42,  -4, $30, 0
	frame_oam -42,   4, $32, 0
	frame_oam -26, -12, $34, 0
	frame_oam -26,  -4, $36, 0
	frame_oam -26,   4, $38, 0
	frame_oam -10,  -8, $10, 0
	frame_oam -10,   0, $12, 0
	db $80

.frame_17
	frame_oam -41, -12, $2e, 0
	frame_oam -41,  -4, $30, 0
	frame_oam -41,   4, $32, 0
	frame_oam -25, -12, $34, 0
	frame_oam -25,  -4, $36, 0
	frame_oam -25,   4, $38, 0
	frame_oam  -9,  -8, $14, 0
	frame_oam  -9,   0, $16, 0
	db $80

.frame_18
	frame_oam -40,   4, $2e, 0 | OAMF_XFLIP
	frame_oam -40,  -4, $30, 0 | OAMF_XFLIP
	frame_oam -40, -12, $32, 0 | OAMF_XFLIP
	frame_oam -24,   4, $34, 0 | OAMF_XFLIP
	frame_oam -24,  -4, $36, 0 | OAMF_XFLIP
	frame_oam -24, -12, $38, 0 | OAMF_XFLIP
	frame_oam  -8,  -8, $08, 0
	frame_oam  -8,   0, $0a, 0
	db $80

.frame_19
	frame_oam -41,   4, $2e, 0 | OAMF_XFLIP
	frame_oam -41,  -4, $30, 0 | OAMF_XFLIP
	frame_oam -41, -12, $32, 0 | OAMF_XFLIP
	frame_oam -25,   4, $34, 0 | OAMF_XFLIP
	frame_oam -25,  -4, $36, 0 | OAMF_XFLIP
	frame_oam -25, -12, $38, 0 | OAMF_XFLIP
	frame_oam  -9,  -8, $0c, 0
	frame_oam  -9,   0, $0e, 0
	db $80

.frame_20
	frame_oam -42,   4, $2e, 0 | OAMF_XFLIP
	frame_oam -42,  -4, $30, 0 | OAMF_XFLIP
	frame_oam -42, -12, $32, 0 | OAMF_XFLIP
	frame_oam -26,   4, $34, 0 | OAMF_XFLIP
	frame_oam -26,  -4, $36, 0 | OAMF_XFLIP
	frame_oam -26, -12, $38, 0 | OAMF_XFLIP
	frame_oam -10,  -8, $10, 0
	frame_oam -10,   0, $12, 0
	db $80

.frame_21
	frame_oam -41,   4, $2e, 0 | OAMF_XFLIP
	frame_oam -41,  -4, $30, 0 | OAMF_XFLIP
	frame_oam -41, -12, $32, 0 | OAMF_XFLIP
	frame_oam -25,   4, $34, 0 | OAMF_XFLIP
	frame_oam -25,  -4, $36, 0 | OAMF_XFLIP
	frame_oam -25, -12, $38, 0 | OAMF_XFLIP
	frame_oam  -9,  -8, $14, 0
	frame_oam  -9,   0, $16, 0
	db $80

.frame_22
	frame_oam -24, -12, $3a, 0
	frame_oam -24,  -4, $3c, 0
	frame_oam -24,   4, $3e, 0
	frame_oam  -8, -12, $40, 0
	frame_oam  -8,  -4, $42, 0
	frame_oam  -8,   4, $44, 0
	db $80

.frame_23
	frame_oam -23, -12, $3a, 0
	frame_oam -23,  -4, $3c, 0
	frame_oam  -7,  -3, $42, 0
	frame_oam -23,   4, $46, 0
	frame_oam  -7, -11, $48, 0
	frame_oam  -7,   5, $4a, 0
	db $80

.frame_24
	frame_oam -23, -13, $3a, 0
	frame_oam -23,  -5, $3c, 0
	frame_oam  -7,  -3, $42, 0
	frame_oam -23,   3, $46, 0
	frame_oam  -7,   5, $4e, 0
	frame_oam  -7, -11, $4c, 0
	db $80

.frame_25
	frame_oam -24,   4, $3a, 0 | OAMF_XFLIP
	frame_oam -24,  -4, $3c, 0 | OAMF_XFLIP
	frame_oam -24, -12, $3e, 0 | OAMF_XFLIP
	frame_oam  -8,   4, $40, 0 | OAMF_XFLIP
	frame_oam  -8,  -4, $42, 0 | OAMF_XFLIP
	frame_oam  -8, -12, $44, 0 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -23,   4, $3a, 0 | OAMF_XFLIP
	frame_oam -23,  -4, $3c, 0 | OAMF_XFLIP
	frame_oam  -7,  -5, $42, 0 | OAMF_XFLIP
	frame_oam -23, -12, $46, 0 | OAMF_XFLIP
	frame_oam  -7,   3, $48, 0 | OAMF_XFLIP
	frame_oam  -7, -13, $4a, 0 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -23,   5, $3a, 0 | OAMF_XFLIP
	frame_oam -23,  -3, $3c, 0 | OAMF_XFLIP
	frame_oam  -7,  -5, $42, 0 | OAMF_XFLIP
	frame_oam -23, -11, $46, 0 | OAMF_XFLIP
	frame_oam  -7, -13, $4e, 0 | OAMF_XFLIP
	frame_oam  -7,   3, $4c, 0 | OAMF_XFLIP
	db $80
; 0x1fd81c

Frameset_1fd81c:: ; 1fd81c (7f:581c)
	db $00,  6
	db $01,  6
	db $02,  6
	db $03,  6
	db $ff
; 0x1fd825

Frameset_1fd825:: ; 1fd825 (7f:5825)
	db $07,  6
	db $04,  6
	db $05,  6
	db $06,  6
	db $ff
; 0x1fd82e

Frameset_1fd82e:: ; 1fd82e (7f:582e)
	db $0b,  6
	db $08,  6
	db $09,  6
	db $0a,  6
	db $ff
; 0x1fd837

; unreferenced
Frameset_1fd837: ; 1fd837 (7f:5837)
	db $00,  4
	db $ff
; 0x1fd83a

Frameset_1fd83a:: ; 1fd83a (7f:583a)
	db $0c,  2
	db $00,  1
	db $0d,  2
	db $ff
; 0x1fd841

Frameset_1fd841:: ; 1fd841 (7f:5841)
	db $0d,  2
	db $00,  1
	db $0c,  2
	db $ff
; 0x1fd848

; unreferenced
Frameset_1fd848: ; 1fd848 (7f:5848)
	db $0e,  6
	db $0f,  6
	db $10,  6
	db $11,  6
	db $ff
; 0x1fd851

; unreferenced
Frameset_1fd851: ; 1fd851 (7f:5851)
	db $12,  6
	db $13,  6
	db $14,  6
	db $15,  6
	db $ff
; 0x1fd85a

; unreferenced
Frameset_1fd85a: ; 1fd85a (7f:585a)
	db $16,  4
	db $ff
; 0x1fd85d

; unreferenced
Frameset_1fd85d: ; 1fd85d (7f:585d)
	db $19,  4
	db $ff
; 0x1fd860

; unreferenced
Frameset_1fd860: ; 1fd860 (7f:5860)
	db $16,  4
	db $17,  4
	db $18,  6
	db $17,  4
	db $ff
; 0x1fd869

; unreferenced
Frameset_1fd869: ; 1fd869 (7f:5869)
	db $19,  4
	db $1a,  4
	db $1b,  6
	db $1a,  4
	db $ff
; 0x1fd872

; unreferenced
Frameset_1fd872: ; 1fd872 (7f:5872)
	db $00,  1
	db $0c,  2
	db $ff
; 0x1fd877

; unreferenced
Frameset_1fd877: ; 1fd877 (7f:5877)
	db $00,  1
	db $0d,  2
	db $ff
; 0x1fd87c

OAM_1fd87c:: ; 1fd87c (7f:587c)
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
	frame_oam -27, -11, $90, 6 | OAMF_BANK1
	frame_oam -12,   3, $94, 0 | OAMF_BANK1
	frame_oam -32, -16, $00, 1
	frame_oam -32,  -8, $02, 1
	frame_oam -16, -16, $04, 1
	frame_oam -16,  -8, $06, 1
	frame_oam -32,   8, $00, 1 | OAMF_XFLIP
	frame_oam -32,   0, $02, 1 | OAMF_XFLIP
	frame_oam -16,   8, $04, 1 | OAMF_XFLIP
	frame_oam -16,   0, $06, 1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -12,   2, $94, 0 | OAMF_BANK1
	frame_oam -27, -10, $90, 6 | OAMF_BANK1
	frame_oam -32, -16, $08, 1
	frame_oam -32,  -8, $0a, 1
	frame_oam -32,   0, $0c, 1
	frame_oam -32,   8, $0e, 1
	frame_oam -16, -16, $28, 1
	frame_oam -16,  -8, $2a, 1
	frame_oam -16,   0, $2c, 1
	frame_oam -16,   8, $2e, 1
	db $80

.frame_2
	frame_oam -26, -10, $90, 6 | OAMF_BANK1
	frame_oam -13,   2, $94, 0 | OAMF_BANK1
	frame_oam -32, -16, $10, 1
	frame_oam -32,  -8, $12, 1
	frame_oam -32,   0, $14, 1
	frame_oam -32,   8, $16, 1
	frame_oam -16, -16, $30, 1
	frame_oam -16,  -8, $32, 1
	frame_oam -16,   0, $34, 1
	frame_oam -16,   8, $36, 1
	db $80

.frame_3
	frame_oam -13,   3, $94, 0 | OAMF_BANK1
	frame_oam -26, -10, $90, 6 | OAMF_BANK1
	frame_oam -32, -16, $18, 1
	frame_oam -32,  -8, $1a, 1
	frame_oam -32,   0, $1c, 1
	frame_oam -32,   8, $1e, 1
	frame_oam -16, -16, $38, 1
	frame_oam -16,  -8, $3a, 1
	frame_oam -16,   0, $3c, 1
	frame_oam -16,   8, $3e, 1
	db $80

.frame_4
	frame_oam -27, -10, $90, 6 | OAMF_BANK1
	frame_oam -12,   3, $94, 0 | OAMF_BANK1
	frame_oam -32, -16, $20, 1
	frame_oam -32,  -8, $22, 1
	frame_oam -32,   0, $24, 1
	frame_oam -32,   8, $26, 1
	frame_oam -16, -16, $20, 1 | OAMF_YFLIP
	frame_oam -16,  -8, $22, 1 | OAMF_YFLIP
	frame_oam -16,   0, $24, 1 | OAMF_YFLIP
	frame_oam -16,   8, $26, 1 | OAMF_YFLIP
	db $80

.frame_5
	frame_oam -13,   3, $94, 0 | OAMF_BANK1
	frame_oam -26, -10, $90, 6 | OAMF_BANK1
	frame_oam -16, -16, $18, 1 | OAMF_YFLIP
	frame_oam -16,  -8, $1a, 1 | OAMF_YFLIP
	frame_oam -16,   0, $1c, 1 | OAMF_YFLIP
	frame_oam -16,   8, $1e, 1 | OAMF_YFLIP
	frame_oam -32, -16, $38, 1 | OAMF_YFLIP
	frame_oam -32,  -8, $3a, 1 | OAMF_YFLIP
	frame_oam -32,   0, $3c, 1 | OAMF_YFLIP
	frame_oam -32,   8, $3e, 1 | OAMF_YFLIP
	db $80

.frame_6
	frame_oam -26,  -9, $90, 6 | OAMF_BANK1
	frame_oam -13,   2, $94, 0 | OAMF_BANK1
	frame_oam -16, -16, $10, 1 | OAMF_YFLIP
	frame_oam -16,  -8, $12, 1 | OAMF_YFLIP
	frame_oam -16,   0, $14, 1 | OAMF_YFLIP
	frame_oam -16,   8, $16, 1 | OAMF_YFLIP
	frame_oam -32, -16, $30, 1 | OAMF_YFLIP
	frame_oam -32,  -8, $32, 1 | OAMF_YFLIP
	frame_oam -32,   0, $34, 1 | OAMF_YFLIP
	frame_oam -32,   8, $36, 1 | OAMF_YFLIP
	db $80

.frame_7
	frame_oam -12,   2, $94, 0 | OAMF_BANK1
	frame_oam -27,  -9, $90, 6 | OAMF_BANK1
	frame_oam -16, -16, $08, 1 | OAMF_YFLIP
	frame_oam -16,  -8, $0a, 1 | OAMF_YFLIP
	frame_oam -16,   0, $0c, 1 | OAMF_YFLIP
	frame_oam -16,   8, $0e, 1 | OAMF_YFLIP
	frame_oam -32, -16, $28, 1 | OAMF_YFLIP
	frame_oam -32,  -8, $2a, 1 | OAMF_YFLIP
	frame_oam -32,   0, $2c, 1 | OAMF_YFLIP
	frame_oam -32,   8, $2e, 1 | OAMF_YFLIP
	db $80

.frame_8
	frame_oam -27, -10, $90, 6 | OAMF_BANK1
	frame_oam -12,   3, $94, 0 | OAMF_BANK1
	frame_oam -16, -16, $00, 1 | OAMF_YFLIP
	frame_oam -16,  -8, $02, 1 | OAMF_YFLIP
	frame_oam -32, -16, $04, 1 | OAMF_YFLIP
	frame_oam -32,  -8, $06, 1 | OAMF_YFLIP
	frame_oam -16,   8, $00, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $02, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   8, $04, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   0, $06, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_9
	frame_oam -12,   2, $94, 0 | OAMF_BANK1
	frame_oam -27,  -9, $90, 6 | OAMF_BANK1
	frame_oam -16,   8, $08, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $0a, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $0c, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -16, $0e, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   8, $28, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   0, $2a, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,  -8, $2c, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32, -16, $2e, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_10
	frame_oam -26,  -9, $90, 6 | OAMF_BANK1
	frame_oam -13,   2, $94, 0 | OAMF_BANK1
	frame_oam -16,   8, $10, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $12, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $14, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -16, $16, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   8, $30, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   0, $32, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,  -8, $34, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32, -16, $36, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_11
	frame_oam -13,   3, $94, 0 | OAMF_BANK1
	frame_oam -26, -10, $90, 6 | OAMF_BANK1
	frame_oam -16,   8, $18, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $1a, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $1c, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -16, $1e, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   8, $38, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,   0, $3a, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32,  -8, $3c, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32, -16, $3e, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_12
	frame_oam -27, -10, $90, 6 | OAMF_BANK1
	frame_oam -12,   3, $94, 0 | OAMF_BANK1
	frame_oam -32,   8, $20, 1 | OAMF_XFLIP
	frame_oam -32,   0, $22, 1 | OAMF_XFLIP
	frame_oam -32,  -8, $24, 1 | OAMF_XFLIP
	frame_oam -32, -16, $26, 1 | OAMF_XFLIP
	frame_oam -16,   8, $20, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $22, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $24, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -16, $26, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_13
	frame_oam -13,   3, $94, 0 | OAMF_BANK1
	frame_oam -26, -10, $90, 6 | OAMF_BANK1
	frame_oam -32,   8, $18, 1 | OAMF_XFLIP
	frame_oam -32,   0, $1a, 1 | OAMF_XFLIP
	frame_oam -32,  -8, $1c, 1 | OAMF_XFLIP
	frame_oam -32, -16, $1e, 1 | OAMF_XFLIP
	frame_oam -16,   8, $38, 1 | OAMF_XFLIP
	frame_oam -16,   0, $3a, 1 | OAMF_XFLIP
	frame_oam -16,  -8, $3c, 1 | OAMF_XFLIP
	frame_oam -16, -16, $3e, 1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -26,  -9, $90, 6 | OAMF_BANK1
	frame_oam -13,   2, $94, 0 | OAMF_BANK1
	frame_oam -32,   8, $10, 1 | OAMF_XFLIP
	frame_oam -32,   0, $12, 1 | OAMF_XFLIP
	frame_oam -32,  -8, $14, 1 | OAMF_XFLIP
	frame_oam -32, -16, $16, 1 | OAMF_XFLIP
	frame_oam -16,   8, $30, 1 | OAMF_XFLIP
	frame_oam -16,   0, $32, 1 | OAMF_XFLIP
	frame_oam -16,  -8, $34, 1 | OAMF_XFLIP
	frame_oam -16, -16, $36, 1 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -11,   2, $94, 0 | OAMF_BANK1
	frame_oam -27,  -9, $90, 6 | OAMF_BANK1
	frame_oam -32,   8, $08, 1 | OAMF_XFLIP
	frame_oam -32,   0, $0a, 1 | OAMF_XFLIP
	frame_oam -32,  -8, $0c, 1 | OAMF_XFLIP
	frame_oam -32, -16, $0e, 1 | OAMF_XFLIP
	frame_oam -16,   8, $28, 1 | OAMF_XFLIP
	frame_oam -16,   0, $2a, 1 | OAMF_XFLIP
	frame_oam -16,  -8, $2c, 1 | OAMF_XFLIP
	frame_oam -16, -16, $2e, 1 | OAMF_XFLIP
	db $80
; 0x1fdb2c

Frameset_1fdb2c:: ; 1fdb2c (7f:5b2c)
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
; 0x1fdb6d

OAM_1fdb6d:: ; 1fdb6d (7f:5b6d)
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
	frame_oam -32, -16, $40, 0
	frame_oam -32,  -8, $42, 0
	frame_oam -32,   0, $44, 0
	frame_oam -32,   8, $46, 0
	frame_oam -16, -16, $48, 0
	frame_oam -16,  -8, $4a, 0
	frame_oam -16,   0, $4c, 0
	frame_oam -16,   8, $4e, 0
	db $80

.frame_1
	frame_oam -33,   0, $44, 0
	frame_oam -33,   8, $46, 0
	frame_oam -17, -16, $48, 0
	frame_oam -17,  -8, $4a, 0
	frame_oam -17,   0, $4c, 0
	frame_oam -17,   8, $4e, 0
	frame_oam -33, -16, $50, 1
	frame_oam -33,  -8, $58, 1
	db $80

.frame_2
	frame_oam -32,   7, $46, 0
	frame_oam -16,  -1, $4c, 0
	frame_oam -16,   7, $4e, 0
	frame_oam -32, -17, $50, 1
	frame_oam -32,  -9, $58, 1
	frame_oam -16, -17, $5e, 1
	frame_oam -16,  -9, $52, 1
	frame_oam -32,  -1, $5a, 1
	db $80

.frame_3
	frame_oam -16,   9, $4e, 0
	frame_oam -32, -15, $50, 1
	frame_oam -32,  -7, $58, 1
	frame_oam -16, -15, $5e, 1
	frame_oam -16,  -7, $52, 1
	frame_oam -32,   1, $5a, 1
	frame_oam -32,   9, $5c, 1
	frame_oam -16,   1, $54, 1
	db $80

.frame_4
	frame_oam -32, -16, $56, 1
	frame_oam -32,  -8, $58, 1
	frame_oam -32,   0, $5a, 1
	frame_oam -32,   8, $5c, 1
	frame_oam -16, -16, $5e, 1
	frame_oam -16,  -8, $60, 1
	frame_oam -16,   0, $62, 1
	frame_oam -16,   8, $64, 1
	db $80

.frame_5
	frame_oam -32,   8, $40, 0 | OAMF_XFLIP
	frame_oam -32,   0, $42, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $44, 0 | OAMF_XFLIP
	frame_oam -32, -16, $46, 0 | OAMF_XFLIP
	frame_oam -16,   8, $48, 0 | OAMF_XFLIP
	frame_oam -16,   0, $4a, 0 | OAMF_XFLIP
	frame_oam -16,  -8, $4c, 0 | OAMF_XFLIP
	frame_oam -16, -16, $4e, 0 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -33,  -8, $44, 0 | OAMF_XFLIP
	frame_oam -33, -16, $46, 0 | OAMF_XFLIP
	frame_oam -17,   8, $48, 0 | OAMF_XFLIP
	frame_oam -17,   0, $4a, 0 | OAMF_XFLIP
	frame_oam -17,  -8, $4c, 0 | OAMF_XFLIP
	frame_oam -17, -16, $4e, 0 | OAMF_XFLIP
	frame_oam -33,   8, $50, 1 | OAMF_XFLIP
	frame_oam -33,   0, $58, 1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -32, -15, $46, 0 | OAMF_XFLIP
	frame_oam -16,  -7, $4c, 0 | OAMF_XFLIP
	frame_oam -16, -15, $4e, 0 | OAMF_XFLIP
	frame_oam -32,   9, $50, 1 | OAMF_XFLIP
	frame_oam -32,   1, $58, 1 | OAMF_XFLIP
	frame_oam -16,   9, $5e, 1 | OAMF_XFLIP
	frame_oam -16,   1, $52, 1 | OAMF_XFLIP
	frame_oam -32,  -7, $5a, 1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -16, -17, $4e, 0 | OAMF_XFLIP
	frame_oam -32,   7, $50, 1 | OAMF_XFLIP
	frame_oam -32,  -1, $58, 1 | OAMF_XFLIP
	frame_oam -16,   7, $5e, 1 | OAMF_XFLIP
	frame_oam -16,  -1, $52, 1 | OAMF_XFLIP
	frame_oam -32,  -9, $5a, 1 | OAMF_XFLIP
	frame_oam -32, -17, $5c, 1 | OAMF_XFLIP
	frame_oam -16,  -9, $54, 1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -32,   8, $56, 1 | OAMF_XFLIP
	frame_oam -32,   0, $58, 1 | OAMF_XFLIP
	frame_oam -32,  -8, $5a, 1 | OAMF_XFLIP
	frame_oam -32, -16, $5c, 1 | OAMF_XFLIP
	frame_oam -16,   8, $5e, 1 | OAMF_XFLIP
	frame_oam -16,   0, $60, 1 | OAMF_XFLIP
	frame_oam -16,  -8, $62, 1 | OAMF_XFLIP
	frame_oam -16, -16, $64, 1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -25,  -8, $78, 2
	frame_oam -25,   0, $7a, 2
	db $80

.frame_11
	frame_oam -32, -16, $66, 2
	frame_oam -32,  -8, $68, 2
	frame_oam -32,   0, $6a, 2
	frame_oam -16, -16, $6c, 2
	frame_oam -16,  -8, $6e, 2
	frame_oam -16,   0, $70, 2
	frame_oam -16,   8, $72, 2
	db $80

.frame_12
	frame_oam -40, -16, $76, 2
	frame_oam -19, -18, $76, 2 | OAMF_YFLIP
	frame_oam -41,   7, $76, 1
	frame_oam -18,   0, $76, 2 | OAMF_XFLIP
	frame_oam -31, -26, $76, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -10, $6a, 1 | OAMF_YFLIP
	frame_oam -40,  -4, $6a, 2 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -17,   9, $74, 1
	db $80

.frame_13
	frame_oam -24,  -7, $7c, 2
	frame_oam -24,   1, $7c, 2 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -16,  -4, $7e, 2
	db $80

.frame_15
	frame_oam -25,   0, $78, 2 | OAMF_XFLIP
	frame_oam -25,  -8, $7a, 2 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -32,   8, $66, 2 | OAMF_XFLIP
	frame_oam -32,   0, $68, 2 | OAMF_XFLIP
	frame_oam -32,  -8, $6a, 2 | OAMF_XFLIP
	frame_oam -16,   8, $6c, 2 | OAMF_XFLIP
	frame_oam -16,   0, $6e, 2 | OAMF_XFLIP
	frame_oam -16,  -8, $70, 2 | OAMF_XFLIP
	frame_oam -16, -16, $72, 2 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -40,   8, $76, 2 | OAMF_XFLIP
	frame_oam -19,  10, $76, 2 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -41, -15, $76, 1 | OAMF_XFLIP
	frame_oam -18,  -8, $76, 2
	frame_oam -31,  18, $76, 1 | OAMF_YFLIP
	frame_oam -16,   2, $6a, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -40,  -4, $6a, 2 | OAMF_YFLIP
	frame_oam -17, -17, $74, 1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -24,  -1, $7c, 2 | OAMF_XFLIP
	frame_oam -24,  -9, $7c, 2
	db $80
; 0x1fdd82

Frameset_1fdd82:: ; 1fdd82 (7f:5d82)
	db $00,  2
	db $01,  2
	db $02,  2
	db $03,  2
	db $ff
; 0x1fdd8b

Frameset_1fdd8b:: ; 1fdd8b (7f:5d8b)
	db $05,  2
	db $06,  2
	db $07,  2
	db $08,  2
	db $ff
; 0x1fdd94

Frameset_1fdd94:: ; 1fdd94 (7f:5d94)
	db $04,  4
	db $ff
; 0x1fdd97

Frameset_1fdd97:: ; 1fdd97 (7f:5d97)
	db $09,  4
	db $ff
; 0x1fdd9a

Frameset_1fdd9a:: ; 1fdd9a (7f:5d9a)
	db $0d,  3
	db $0b,  3
	db $0d,  3
	db $0a,  2
	db $0c,  3
	db $0e,  1
	db $ff
; 0x1fdda7

Frameset_1fdda7:: ; 1fdda7 (7f:5da7)
	db $12,  3
	db $10,  3
	db $12,  3
	db $0f,  2
	db $11,  3
	db $0e,  1
	db $ff
; 0x1fddb4

OAM_1fddb4:: ; 1fddb4 (7f:5db4)
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

.frame_0
	frame_oam -33,   5, $04, 0
	frame_oam -27,  13, $0e, 0
	frame_oam -17, -11, $14, 0
	frame_oam -17,  -3, $2a, 0
	frame_oam -17,   5, $2c, 0
	frame_oam -33,  -3, $42, 0
	frame_oam -33, -11, $40, 0
	frame_oam -60, -11, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -44, -11, $18, 0 | OAMF_BANK1
	frame_oam -44,  -3, $18, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -53, -19, $20, 4 | OAMF_BANK1
	frame_oam -53,   5, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -60,  -3, $12, 4 | OAMF_BANK1
	frame_oam -11,  13, $58, 0
	db $80

.frame_1
	frame_oam -17,  14, $2e, 0
	frame_oam -33,   6, $04, 0
	frame_oam -33,  14, $06, 0
	frame_oam -17, -10, $16, 0
	frame_oam -17,  -2, $18, 0
	frame_oam -17,   6, $1a, 0
	frame_oam -33,  -2, $42, 0
	frame_oam -33, -10, $40, 0
	frame_oam -61,  -2, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -61, -10, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -45, -10, $18, 0 | OAMF_BANK1
	frame_oam -45,  -2, $18, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -54,   6, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -53, -18, $1e, 4 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -17,  13, $2e, 0
	frame_oam -33,   5, $04, 0
	frame_oam -33,  13, $06, 0
	frame_oam -17, -11, $16, 0
	frame_oam -17,  -3, $18, 0
	frame_oam -17,   5, $1a, 0
	frame_oam -33,  -3, $42, 0
	frame_oam -33, -11, $40, 0
	frame_oam -60, -11, $12, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -44, -11, $18, 0 | OAMF_BANK1
	frame_oam -44,  -3, $18, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -53, -19, $20, 4 | OAMF_BANK1
	frame_oam -53,   5, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -60,  -3, $12, 4 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -33,   4, $04, 0
	frame_oam -27,  12, $0e, 0
	frame_oam -17, -12, $14, 0
	frame_oam -17,  -4, $2a, 0
	frame_oam -17,   4, $2c, 0
	frame_oam -33,  -4, $42, 0
	frame_oam -33, -12, $40, 0
	frame_oam -61, -12, $10, 4 | OAMF_BANK1
	frame_oam -61,  -4, $12, 4 | OAMF_BANK1
	frame_oam -45, -12, $18, 0 | OAMF_BANK1
	frame_oam -45,  -4, $18, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -54, -20, $22, 4 | OAMF_BANK1
	frame_oam -53,   4, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,  12, $58, 0
	db $80

.frame_4
	frame_oam -33,   5, $04, 0
	frame_oam -27,  13, $0e, 0
	frame_oam -17, -11, $14, 0
	frame_oam -17,  -3, $2a, 0
	frame_oam -17,   5, $2c, 0
	frame_oam -33,  -3, $42, 0
	frame_oam -33, -11, $40, 0
	frame_oam -50,   4, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $28, 4 | OAMF_BANK1
	frame_oam -59,  -3, $2a, 4 | OAMF_BANK1
	frame_oam -43, -11, $2c, 0 | OAMF_BANK1
	frame_oam -43,  -3, $2e, 0 | OAMF_BANK1
	frame_oam -50, -19, $3e, 4 | OAMF_BANK1
	frame_oam -11,  13, $58, 0
	db $80

.frame_5
	frame_oam -34,  -8, $10, 0
	frame_oam -34,   0, $12, 0
	frame_oam -18,  -8, $30, 0
	frame_oam -18,   0, $32, 0
	frame_oam -34,   8, $04, 0
	frame_oam -18,   8, $0c, 0
	frame_oam -28,  16, $0e, 0
	frame_oam -46,   4, $3a, 4 | OAMF_BANK1
	frame_oam -60, -11, $28, 4 | OAMF_BANK1
	frame_oam -60,  -3, $2a, 4 | OAMF_BANK1
	frame_oam -44, -11, $2c, 0 | OAMF_BANK1
	frame_oam -44,  -3, $2e, 0 | OAMF_BANK1
	frame_oam -46, -18, $1c, 4 | OAMF_BANK1
	frame_oam -12,  16, $58, 0
	db $80

.frame_6
	frame_oam -32,   6, $04, 0
	frame_oam -26,  14, $0e, 0
	frame_oam -16, -10, $14, 0
	frame_oam -16,  -2, $2a, 0
	frame_oam -16,   6, $2c, 0
	frame_oam -32,  -2, $42, 0
	frame_oam -32, -10, $40, 0
	frame_oam -50,   4, $3c, 4 | OAMF_BANK1
	frame_oam -59, -11, $28, 4 | OAMF_BANK1
	frame_oam -59,  -3, $2a, 4 | OAMF_BANK1
	frame_oam -43, -11, $2c, 0 | OAMF_BANK1
	frame_oam -43,  -3, $2e, 0 | OAMF_BANK1
	frame_oam -50, -18, $1e, 4 | OAMF_BANK1
	frame_oam -10,  14, $58, 0
	db $80

.frame_7
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50,   4, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $28, 4 | OAMF_BANK1
	frame_oam -59,  -3, $2a, 4 | OAMF_BANK1
	frame_oam -43, -11, $2c, 0 | OAMF_BANK1
	frame_oam -43,  -3, $2e, 0 | OAMF_BANK1
	frame_oam -50, -18, $20, 4 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50,   4, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -58, -11, $28, 4 | OAMF_BANK1
	frame_oam -58,  -3, $2a, 4 | OAMF_BANK1
	frame_oam -42, -11, $2c, 0 | OAMF_BANK1
	frame_oam -42,  -3, $2e, 0 | OAMF_BANK1
	frame_oam -50, -18, $22, 4 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -17,  -7, $3a, 0
	frame_oam -17,   1, $3c, 0
	frame_oam -17,   9, $3e, 0
	frame_oam -17, -15, $38, 0
	frame_oam -33, -15, $1c, 0
	frame_oam -33,  -7, $1e, 0
	frame_oam -33,   1, $04, 0
	frame_oam -33,   9, $06, 0
	frame_oam -50,   4, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $28, 4 | OAMF_BANK1
	frame_oam -59,  -3, $2a, 4 | OAMF_BANK1
	frame_oam -43, -11, $2c, 0 | OAMF_BANK1
	frame_oam -43,  -3, $2e, 0 | OAMF_BANK1
	frame_oam -50, -19, $3e, 4 | OAMF_BANK1
	db $80

.frame_10
	frame_oam -18, -15, $38, 0
	frame_oam -18,  -7, $3a, 0
	frame_oam -18,   1, $3c, 0
	frame_oam -34, -15, $1c, 0
	frame_oam -34,  -7, $1e, 0
	frame_oam -18,   9, $3e, 0
	frame_oam -34,   1, $04, 0
	frame_oam -34,   9, $06, 0
	frame_oam -46,   4, $3a, 4 | OAMF_BANK1
	frame_oam -60, -11, $28, 4 | OAMF_BANK1
	frame_oam -60,  -3, $2a, 4 | OAMF_BANK1
	frame_oam -44, -11, $2c, 0 | OAMF_BANK1
	frame_oam -44,  -3, $2e, 0 | OAMF_BANK1
	frame_oam -46, -18, $1c, 4 | OAMF_BANK1
	db $80

.frame_11
	frame_oam -16,  -7, $3a, 0
	frame_oam -16,   1, $3c, 0
	frame_oam -16,   9, $3e, 0
	frame_oam -16, -15, $38, 0
	frame_oam -32, -15, $1c, 0
	frame_oam -32,  -7, $1e, 0
	frame_oam -32,   1, $04, 0
	frame_oam -32,   9, $06, 0
	frame_oam -50,   4, $3c, 4 | OAMF_BANK1
	frame_oam -59, -11, $28, 4 | OAMF_BANK1
	frame_oam -59,  -3, $2a, 4 | OAMF_BANK1
	frame_oam -43, -11, $2c, 0 | OAMF_BANK1
	frame_oam -43,  -3, $2e, 0 | OAMF_BANK1
	frame_oam -50, -18, $1e, 4 | OAMF_BANK1
	db $80

.frame_12
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50,   4, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $28, 4 | OAMF_BANK1
	frame_oam -59,  -3, $2a, 4 | OAMF_BANK1
	frame_oam -43, -11, $2c, 0 | OAMF_BANK1
	frame_oam -43,  -3, $2e, 0 | OAMF_BANK1
	frame_oam -50, -18, $20, 4 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50,   4, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -58, -11, $28, 4 | OAMF_BANK1
	frame_oam -58,  -3, $2a, 4 | OAMF_BANK1
	frame_oam -42, -11, $2c, 0 | OAMF_BANK1
	frame_oam -42,  -3, $2e, 0 | OAMF_BANK1
	frame_oam -50, -18, $22, 4 | OAMF_BANK1
	db $80

.frame_14
	frame_oam -33,   5, $04, 0
	frame_oam -27,  13, $0e, 0
	frame_oam -17, -11, $14, 0
	frame_oam -17,  -3, $2a, 0
	frame_oam -17,   5, $2c, 0
	frame_oam -33,  -3, $42, 0
	frame_oam -33, -11, $40, 0
	frame_oam -50, -18, $24, 4 | OAMF_BANK1
	frame_oam -59,  -3, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43,  -3, $2c, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43, -11, $2e, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50,   5, $3e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,  13, $58, 0
	db $80

.frame_15
	frame_oam -34,  -8, $10, 0
	frame_oam -34,   0, $12, 0
	frame_oam -18,  -8, $30, 0
	frame_oam -18,   0, $32, 0
	frame_oam -34,   8, $04, 0
	frame_oam -18,   8, $0c, 0
	frame_oam -28,  16, $0e, 0
	frame_oam -46, -18, $3a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -60,  -3, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -60, -11, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -44,  -3, $2c, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -44, -11, $2e, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -46,   4, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -12,  16, $58, 0
	db $80

.frame_16
	frame_oam -32,   6, $04, 0
	frame_oam -26,  14, $0e, 0
	frame_oam -16, -10, $14, 0
	frame_oam -16,  -2, $2a, 0
	frame_oam -16,   6, $2c, 0
	frame_oam -32,  -2, $42, 0
	frame_oam -32, -10, $40, 0
	frame_oam -50, -18, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59,  -3, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43,  -3, $2c, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43, -11, $2e, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50,   4, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -10,  14, $58, 0
	db $80

.frame_17
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50, -18, $20, 4 | OAMF_BANK1
	frame_oam -59,  -3, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43,  -3, $2c, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43, -11, $2e, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50,   4, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50, -18, $22, 4 | OAMF_BANK1
	frame_oam -58,  -3, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -58, -11, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -42,  -3, $2c, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -42, -11, $2e, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50,   4, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -17,  -7, $3a, 0
	frame_oam -17,   1, $3c, 0
	frame_oam -17,   9, $3e, 0
	frame_oam -17, -15, $38, 0
	frame_oam -33, -15, $1c, 0
	frame_oam -33,  -7, $1e, 0
	frame_oam -33,   1, $04, 0
	frame_oam -33,   9, $06, 0
	frame_oam -50, -18, $24, 4 | OAMF_BANK1
	frame_oam -59,  -3, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43,  -3, $2c, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43, -11, $2e, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50,   5, $3e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -18, -15, $38, 0
	frame_oam -18,  -7, $3a, 0
	frame_oam -18,   1, $3c, 0
	frame_oam -34, -15, $1c, 0
	frame_oam -34,  -7, $1e, 0
	frame_oam -18,   9, $3e, 0
	frame_oam -34,   1, $04, 0
	frame_oam -34,   9, $06, 0
	frame_oam -46, -18, $3a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -60,  -3, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -60, -11, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -44,  -3, $2c, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -44, -11, $2e, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -46,   4, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -16,  -7, $3a, 0
	frame_oam -16,   1, $3c, 0
	frame_oam -16,   9, $3e, 0
	frame_oam -16, -15, $38, 0
	frame_oam -32, -15, $1c, 0
	frame_oam -32,  -7, $1e, 0
	frame_oam -32,   1, $04, 0
	frame_oam -32,   9, $06, 0
	frame_oam -50, -18, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59,  -3, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43,  -3, $2c, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43, -11, $2e, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50,   4, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_22
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50, -18, $20, 4 | OAMF_BANK1
	frame_oam -59,  -3, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43,  -3, $2c, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43, -11, $2e, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50,   4, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50, -18, $22, 4 | OAMF_BANK1
	frame_oam -58,  -3, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -58, -11, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -42,  -3, $2c, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -42, -11, $2e, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50,   4, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -33,   5, $04, 0
	frame_oam -27,  13, $0e, 0
	frame_oam -17, -11, $14, 0
	frame_oam -17,  -3, $2a, 0
	frame_oam -17,   5, $2c, 0
	frame_oam -33,  -3, $42, 0
	frame_oam -33, -11, $40, 0
	frame_oam -50,   4, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $28, 4 | OAMF_BANK1
	frame_oam -59,  -3, $2a, 4 | OAMF_BANK1
	frame_oam -43, -11, $2c, 0 | OAMF_BANK1
	frame_oam -43,  -3, $2e, 0 | OAMF_BANK1
	frame_oam -50, -19, $3e, 4 | OAMF_BANK1
	frame_oam -11,  13, $58, 0
	db $80

.frame_25
	frame_oam -34,  -8, $10, 0
	frame_oam -34,   0, $12, 0
	frame_oam -18,  -8, $30, 0
	frame_oam -18,   0, $32, 0
	frame_oam -34,   8, $04, 0
	frame_oam -18,   8, $0c, 0
	frame_oam -28,  16, $0e, 0
	frame_oam -12,  16, $58, 0
	frame_oam -46,   4, $3a, 4 | OAMF_BANK1
	frame_oam -59, -11, $16, 4 | OAMF_BANK1
	frame_oam -43, -11, $36, 0 | OAMF_BANK1
	frame_oam -59,  -3, $34, 4 | OAMF_BANK1
	frame_oam -43,  -3, $38, 0 | OAMF_BANK1
	frame_oam -46, -18, $1c, 4 | OAMF_BANK1
	db $80

.frame_26
	frame_oam -32,   6, $04, 0
	frame_oam -26,  14, $0e, 0
	frame_oam -16, -10, $14, 0
	frame_oam -16,  -2, $2a, 0
	frame_oam -16,   6, $2c, 0
	frame_oam -32,  -2, $42, 0
	frame_oam -32, -10, $40, 0
	frame_oam -10,  14, $58, 0
	frame_oam -50,   4, $3c, 4 | OAMF_BANK1
	frame_oam -59, -11, $28, 4 | OAMF_BANK1
	frame_oam -59,  -3, $2a, 4 | OAMF_BANK1
	frame_oam -43, -11, $30, 0 | OAMF_BANK1
	frame_oam -43,  -3, $32, 0 | OAMF_BANK1
	frame_oam -50, -18, $1e, 4 | OAMF_BANK1
	db $80

.frame_27
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50,   4, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $28, 4 | OAMF_BANK1
	frame_oam -59,  -3, $2a, 4 | OAMF_BANK1
	frame_oam -43, -11, $30, 0 | OAMF_BANK1
	frame_oam -43,  -3, $32, 0 | OAMF_BANK1
	frame_oam -50, -18, $20, 4 | OAMF_BANK1
	db $80

.frame_28
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50,   4, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -58, -11, $28, 4 | OAMF_BANK1
	frame_oam -58,  -3, $2a, 4 | OAMF_BANK1
	frame_oam -42, -11, $2c, 0 | OAMF_BANK1
	frame_oam -42,  -3, $2e, 0 | OAMF_BANK1
	frame_oam -50, -18, $22, 4 | OAMF_BANK1
	db $80

.frame_29
	frame_oam -17,  -7, $3a, 0
	frame_oam -17,   1, $3c, 0
	frame_oam -17,   9, $3e, 0
	frame_oam -17, -15, $38, 0
	frame_oam -33, -15, $1c, 0
	frame_oam -33,  -7, $1e, 0
	frame_oam -33,   1, $04, 0
	frame_oam -33,   9, $06, 0
	frame_oam -50,   4, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -58, -11, $16, 4 | OAMF_BANK1
	frame_oam -42, -11, $36, 0 | OAMF_BANK1
	frame_oam -58,  -3, $34, 4 | OAMF_BANK1
	frame_oam -42,  -3, $38, 0 | OAMF_BANK1
	frame_oam -50, -19, $3e, 4 | OAMF_BANK1
	db $80

.frame_30
	frame_oam -18, -15, $38, 0
	frame_oam -18,  -7, $3a, 0
	frame_oam -18,   1, $3c, 0
	frame_oam -34, -15, $1c, 0
	frame_oam -34,  -7, $1e, 0
	frame_oam -18,   9, $3e, 0
	frame_oam -34,   1, $04, 0
	frame_oam -34,   9, $06, 0
	frame_oam -46,   4, $3a, 4 | OAMF_BANK1
	frame_oam -59, -11, $16, 4 | OAMF_BANK1
	frame_oam -43, -11, $36, 0 | OAMF_BANK1
	frame_oam -59,  -3, $34, 4 | OAMF_BANK1
	frame_oam -43,  -3, $38, 0 | OAMF_BANK1
	frame_oam -46, -18, $1c, 4 | OAMF_BANK1
	db $80

.frame_31
	frame_oam -16,  -7, $3a, 0
	frame_oam -16,   1, $3c, 0
	frame_oam -16,   9, $3e, 0
	frame_oam -16, -15, $38, 0
	frame_oam -32, -15, $1c, 0
	frame_oam -32,  -7, $1e, 0
	frame_oam -32,   1, $04, 0
	frame_oam -32,   9, $06, 0
	frame_oam -50,   4, $3c, 4 | OAMF_BANK1
	frame_oam -59, -11, $28, 4 | OAMF_BANK1
	frame_oam -59,  -3, $2a, 4 | OAMF_BANK1
	frame_oam -43, -11, $30, 0 | OAMF_BANK1
	frame_oam -43,  -3, $32, 0 | OAMF_BANK1
	frame_oam -50, -18, $1e, 4 | OAMF_BANK1
	db $80

.frame_32
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50,   4, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $28, 4 | OAMF_BANK1
	frame_oam -59,  -3, $2a, 4 | OAMF_BANK1
	frame_oam -43, -11, $30, 0 | OAMF_BANK1
	frame_oam -43,  -3, $32, 0 | OAMF_BANK1
	frame_oam -50, -18, $20, 4 | OAMF_BANK1
	db $80

.frame_33
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50,   4, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -58, -11, $28, 4 | OAMF_BANK1
	frame_oam -58,  -3, $2a, 4 | OAMF_BANK1
	frame_oam -42, -11, $2c, 0 | OAMF_BANK1
	frame_oam -42,  -3, $2e, 0 | OAMF_BANK1
	frame_oam -50, -18, $22, 4 | OAMF_BANK1
	db $80

.frame_34
	frame_oam -33,   5, $04, 0
	frame_oam -27,  13, $0e, 0
	frame_oam -17, -11, $14, 0
	frame_oam -17,  -3, $2a, 0
	frame_oam -17,   5, $2c, 0
	frame_oam -33,  -3, $42, 0
	frame_oam -33, -11, $40, 0
	frame_oam -50, -18, $24, 4 | OAMF_BANK1
	frame_oam -59,  -3, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43,  -3, $2c, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43, -11, $2e, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50,   5, $3e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -11,  13, $58, 0
	db $80

.frame_35
	frame_oam -34,  -8, $10, 0
	frame_oam -34,   0, $12, 0
	frame_oam -18,  -8, $30, 0
	frame_oam -18,   0, $32, 0
	frame_oam -34,   8, $04, 0
	frame_oam -18,   8, $0c, 0
	frame_oam -28,  16, $0e, 0
	frame_oam -12,  16, $58, 0
	frame_oam -46, -18, $3a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59,  -3, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43,  -3, $36, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43, -11, $38, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -46,   4, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_36
	frame_oam -32,   6, $04, 0
	frame_oam -26,  14, $0e, 0
	frame_oam -16, -10, $14, 0
	frame_oam -16,  -2, $2a, 0
	frame_oam -16,   6, $2c, 0
	frame_oam -32,  -2, $42, 0
	frame_oam -32, -10, $40, 0
	frame_oam -10,  14, $58, 0
	frame_oam -50, -18, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59,  -3, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43,  -3, $30, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43, -11, $32, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50,   4, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_37
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50, -18, $20, 4 | OAMF_BANK1
	frame_oam -59,  -3, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43,  -3, $30, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43, -11, $32, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50,   4, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_38
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50, -18, $22, 4 | OAMF_BANK1
	frame_oam -58,  -3, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -58, -11, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -42,  -3, $2c, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -42, -11, $2e, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50,   4, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_39
	frame_oam -17,  -7, $3a, 0
	frame_oam -17,   1, $3c, 0
	frame_oam -17,   9, $3e, 0
	frame_oam -17, -15, $38, 0
	frame_oam -33, -15, $1c, 0
	frame_oam -33,  -7, $1e, 0
	frame_oam -33,   1, $04, 0
	frame_oam -33,   9, $06, 0
	frame_oam -50, -18, $24, 4 | OAMF_BANK1
	frame_oam -58,  -3, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -42,  -3, $36, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -58, -11, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -42, -11, $38, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50,   5, $3e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_40
	frame_oam -18, -15, $38, 0
	frame_oam -18,  -7, $3a, 0
	frame_oam -18,   1, $3c, 0
	frame_oam -34, -15, $1c, 0
	frame_oam -34,  -7, $1e, 0
	frame_oam -18,   9, $3e, 0
	frame_oam -34,   1, $04, 0
	frame_oam -34,   9, $06, 0
	frame_oam -46, -18, $3a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59,  -3, $16, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43,  -3, $36, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $34, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43, -11, $38, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -46,   4, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_41
	frame_oam -16,  -7, $3a, 0
	frame_oam -16,   1, $3c, 0
	frame_oam -16,   9, $3e, 0
	frame_oam -16, -15, $38, 0
	frame_oam -32, -15, $1c, 0
	frame_oam -32,  -7, $1e, 0
	frame_oam -32,   1, $04, 0
	frame_oam -32,   9, $06, 0
	frame_oam -50, -18, $3c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59,  -3, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43,  -3, $30, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43, -11, $32, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50,   4, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_42
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50, -18, $20, 4 | OAMF_BANK1
	frame_oam -59,  -3, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -59, -11, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43,  -3, $30, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43, -11, $32, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50,   4, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_43
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50, -18, $22, 4 | OAMF_BANK1
	frame_oam -58,  -3, $28, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -58, -11, $2a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -42,  -3, $2c, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -42, -11, $2e, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50,   4, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_44
	frame_oam -33,   5, $04, 0
	frame_oam -27,  13, $0e, 0
	frame_oam -17, -11, $14, 0
	frame_oam -17,  -3, $2a, 0
	frame_oam -17,   5, $2c, 0
	frame_oam -33,  -3, $42, 0
	frame_oam -33, -11, $40, 0
	frame_oam -11,  13, $58, 0
	frame_oam -50, -19, $24, 4 | OAMF_BANK1
	frame_oam -50,   5, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -56, -11, $26, 4 | OAMF_BANK1
	frame_oam -40, -11, $08, 0 | OAMF_BANK1
	frame_oam -56,  -3, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -40,  -3, $08, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_45
	frame_oam -34,  -8, $10, 0
	frame_oam -34,   0, $12, 0
	frame_oam -18,  -8, $30, 0
	frame_oam -18,   0, $32, 0
	frame_oam -34,   8, $04, 0
	frame_oam -18,   8, $0c, 0
	frame_oam -28,  16, $0e, 0
	frame_oam -12,  16, $58, 0
	frame_oam -46, -19, $1c, 4 | OAMF_BANK1
	frame_oam -46,   5, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -57, -11, $26, 4 | OAMF_BANK1
	frame_oam -41, -11, $08, 0 | OAMF_BANK1
	frame_oam -57,  -3, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -41,  -3, $08, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_46
	frame_oam -32,   6, $04, 0
	frame_oam -26,  14, $0e, 0
	frame_oam -16, -10, $14, 0
	frame_oam -16,  -2, $2a, 0
	frame_oam -16,   6, $2c, 0
	frame_oam -32,  -2, $42, 0
	frame_oam -32, -10, $40, 0
	frame_oam -10,  14, $58, 0
	frame_oam -50, -19, $1e, 4 | OAMF_BANK1
	frame_oam -50,   5, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -56, -11, $26, 4 | OAMF_BANK1
	frame_oam -40, -11, $08, 0 | OAMF_BANK1
	frame_oam -56,  -3, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -40,  -3, $08, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_47
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50, -19, $20, 4 | OAMF_BANK1
	frame_oam -50,   5, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -56, -11, $26, 4 | OAMF_BANK1
	frame_oam -40, -11, $08, 0 | OAMF_BANK1
	frame_oam -56,  -3, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -40,  -3, $08, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_48
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50, -19, $22, 4 | OAMF_BANK1
	frame_oam -50,   5, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -55, -11, $26, 4 | OAMF_BANK1
	frame_oam -39, -11, $08, 0 | OAMF_BANK1
	frame_oam -55,  -3, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -39,  -3, $08, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_49
	frame_oam -17,  -7, $3a, 0
	frame_oam -17,   1, $3c, 0
	frame_oam -17,   9, $3e, 0
	frame_oam -17, -15, $38, 0
	frame_oam -33, -15, $1c, 0
	frame_oam -33,  -7, $1e, 0
	frame_oam -33,   1, $04, 0
	frame_oam -33,   9, $06, 0
	frame_oam -50, -19, $24, 4 | OAMF_BANK1
	frame_oam -50,   5, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -56, -11, $26, 4 | OAMF_BANK1
	frame_oam -40, -11, $08, 0 | OAMF_BANK1
	frame_oam -56,  -3, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -40,  -3, $08, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_50
	frame_oam -18, -15, $38, 0
	frame_oam -18,  -7, $3a, 0
	frame_oam -18,   1, $3c, 0
	frame_oam -34, -15, $1c, 0
	frame_oam -34,  -7, $1e, 0
	frame_oam -18,   9, $3e, 0
	frame_oam -34,   1, $04, 0
	frame_oam -34,   9, $06, 0
	frame_oam -46, -19, $1c, 4 | OAMF_BANK1
	frame_oam -46,   5, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -57, -11, $26, 4 | OAMF_BANK1
	frame_oam -41, -11, $08, 0 | OAMF_BANK1
	frame_oam -57,  -3, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -41,  -3, $08, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_51
	frame_oam -16,  -7, $3a, 0
	frame_oam -16,   1, $3c, 0
	frame_oam -16,   9, $3e, 0
	frame_oam -16, -15, $38, 0
	frame_oam -32, -15, $1c, 0
	frame_oam -32,  -7, $1e, 0
	frame_oam -32,   1, $04, 0
	frame_oam -32,   9, $06, 0
	frame_oam -50, -19, $1e, 4 | OAMF_BANK1
	frame_oam -50,   5, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -56, -11, $26, 4 | OAMF_BANK1
	frame_oam -40, -11, $08, 0 | OAMF_BANK1
	frame_oam -56,  -3, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -40,  -3, $08, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_52
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -50, -19, $20, 4 | OAMF_BANK1
	frame_oam -50,   5, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -56, -11, $26, 4 | OAMF_BANK1
	frame_oam -40, -11, $08, 0 | OAMF_BANK1
	frame_oam -56,  -3, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -40,  -3, $08, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_53
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -50, -19, $22, 4 | OAMF_BANK1
	frame_oam -50,   5, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -55, -11, $26, 4 | OAMF_BANK1
	frame_oam -39, -11, $08, 0 | OAMF_BANK1
	frame_oam -55,  -3, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -39,  -3, $08, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_54
	frame_oam -33,   5, $04, 0
	frame_oam -27,  13, $0e, 0
	frame_oam -17, -11, $14, 0
	frame_oam -17,  -3, $2a, 0
	frame_oam -17,   5, $2c, 0
	frame_oam -33,  -3, $42, 0
	frame_oam -33, -11, $40, 0
	frame_oam -11,  13, $58, 0
	frame_oam -50, -19, $24, 4 | OAMF_BANK1
	frame_oam -50,   5, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -56, -11, $26, 4 | OAMF_BANK1
	frame_oam -40, -11, $08, 0 | OAMF_BANK1
	frame_oam -56,  -3, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -40,  -3, $08, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_55
	frame_oam -34,  -8, $10, 0
	frame_oam -34,   0, $12, 0
	frame_oam -18,  -8, $30, 0
	frame_oam -18,   0, $32, 0
	frame_oam -34,   8, $04, 0
	frame_oam -18,   8, $0c, 0
	frame_oam -28,  16, $0e, 0
	frame_oam -12,  16, $58, 0
	frame_oam -59, -11, $1a, 4 | OAMF_BANK1
	frame_oam -59,  -3, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -46, -19, $1c, 4 | OAMF_BANK1
	frame_oam -46,   5, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43, -11, $14, 0 | OAMF_BANK1
	frame_oam -43,  -3, $14, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_56
	frame_oam -32,   6, $04, 0
	frame_oam -26,  14, $0e, 0
	frame_oam -16, -10, $14, 0
	frame_oam -16,  -2, $2a, 0
	frame_oam -16,   6, $2c, 0
	frame_oam -32,  -2, $42, 0
	frame_oam -32, -10, $40, 0
	frame_oam -10,  14, $58, 0
	frame_oam -58, -11, $1a, 4 | OAMF_BANK1
	frame_oam -42, -11, $18, 0 | OAMF_BANK1
	frame_oam -58,  -3, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -42,  -3, $18, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50, -19, $1e, 4 | OAMF_BANK1
	frame_oam -50,   5, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_57
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -58, -11, $1a, 4 | OAMF_BANK1
	frame_oam -42, -11, $18, 0 | OAMF_BANK1
	frame_oam -58,  -3, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -42,  -3, $18, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50, -19, $20, 4 | OAMF_BANK1
	frame_oam -50,   5, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_58
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -57, -11, $1a, 4 | OAMF_BANK1
	frame_oam -57,  -3, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50, -19, $22, 4 | OAMF_BANK1
	frame_oam -50,   5, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -41, -11, $14, 0 | OAMF_BANK1
	frame_oam -41,  -3, $14, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_59
	frame_oam -17,  -7, $3a, 0
	frame_oam -17,   1, $3c, 0
	frame_oam -17,   9, $3e, 0
	frame_oam -17, -15, $38, 0
	frame_oam -33, -15, $1c, 0
	frame_oam -33,  -7, $1e, 0
	frame_oam -33,   1, $04, 0
	frame_oam -33,   9, $06, 0
	frame_oam -50, -19, $24, 4 | OAMF_BANK1
	frame_oam -50,   5, $24, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -56, -11, $26, 4 | OAMF_BANK1
	frame_oam -40, -11, $08, 0 | OAMF_BANK1
	frame_oam -56,  -3, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -40,  -3, $08, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_60
	frame_oam -18, -15, $38, 0
	frame_oam -18,  -7, $3a, 0
	frame_oam -18,   1, $3c, 0
	frame_oam -34, -15, $1c, 0
	frame_oam -34,  -7, $1e, 0
	frame_oam -18,   9, $3e, 0
	frame_oam -34,   1, $04, 0
	frame_oam -34,   9, $06, 0
	frame_oam -59, -11, $1a, 4 | OAMF_BANK1
	frame_oam -59,  -3, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -46, -19, $1c, 4 | OAMF_BANK1
	frame_oam -46,   5, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -43, -11, $14, 0 | OAMF_BANK1
	frame_oam -43,  -3, $14, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_61
	frame_oam -16,  -7, $3a, 0
	frame_oam -16,   1, $3c, 0
	frame_oam -16,   9, $3e, 0
	frame_oam -16, -15, $38, 0
	frame_oam -32, -15, $1c, 0
	frame_oam -32,  -7, $1e, 0
	frame_oam -32,   1, $04, 0
	frame_oam -32,   9, $06, 0
	frame_oam -58, -11, $1a, 4 | OAMF_BANK1
	frame_oam -42, -11, $18, 0 | OAMF_BANK1
	frame_oam -58,  -3, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -42,  -3, $18, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50, -19, $1e, 4 | OAMF_BANK1
	frame_oam -50,   5, $1e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_62
	frame_oam -31, -14, $1c, 0
	frame_oam -31,  -6, $1e, 0
	frame_oam -15,   2, $34, 0
	frame_oam -15,  10, $36, 0
	frame_oam -15,  -6, $18, 0
	frame_oam -31,   2, $04, 0
	frame_oam -31,  10, $06, 0
	frame_oam -15, -14, $20, 0
	frame_oam -58, -11, $1a, 4 | OAMF_BANK1
	frame_oam -42, -11, $18, 0 | OAMF_BANK1
	frame_oam -58,  -3, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -42,  -3, $18, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50, -19, $20, 4 | OAMF_BANK1
	frame_oam -50,   5, $20, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_63
	frame_oam -15,  13, $2e, 0
	frame_oam -31,   5, $04, 0
	frame_oam -31,  13, $06, 0
	frame_oam -15, -11, $16, 0
	frame_oam -15,  -3, $18, 0
	frame_oam -15,   5, $1a, 0
	frame_oam -31,  -3, $42, 0
	frame_oam -31, -11, $40, 0
	frame_oam -57, -11, $1a, 4 | OAMF_BANK1
	frame_oam -57,  -3, $1a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -50, -19, $22, 4 | OAMF_BANK1
	frame_oam -50,   5, $22, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -41, -11, $14, 0 | OAMF_BANK1
	frame_oam -41,  -3, $14, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_64
	frame_oam -34,  -8, $10, 0
	frame_oam -34,   0, $12, 0
	frame_oam -18,  -8, $30, 0
	frame_oam -18,   0, $32, 0
	frame_oam -34,   8, $04, 0
	frame_oam -18,   8, $0c, 0
	frame_oam -28,  16, $0e, 0
	frame_oam -12,  16, $58, 0
	frame_oam -46, -19, $1c, 4 | OAMF_BANK1
	frame_oam -46,   5, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -57, -11, $26, 4 | OAMF_BANK1
	frame_oam -41, -11, $08, 0 | OAMF_BANK1
	frame_oam -57,  -3, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -41,  -3, $08, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_65
	frame_oam -18, -15, $38, 0
	frame_oam -18,  -7, $3a, 0
	frame_oam -18,   1, $3c, 0
	frame_oam -34, -15, $1c, 0
	frame_oam -34,  -7, $1e, 0
	frame_oam -18,   9, $3e, 0
	frame_oam -34,   1, $04, 0
	frame_oam -34,   9, $06, 0
	frame_oam -46, -19, $1c, 4 | OAMF_BANK1
	frame_oam -46,   5, $1c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -57, -11, $26, 4 | OAMF_BANK1
	frame_oam -41, -11, $08, 0 | OAMF_BANK1
	frame_oam -57,  -3, $26, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -41,  -3, $08, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_66
	frame_oam -16, -14, $14, 0
	frame_oam -16,  -6, $2a, 0
	frame_oam -32, -14, $08, 0
	frame_oam -32,  -6, $0a, 0
	frame_oam -16,  10, $2e, 0
	frame_oam -32,   2, $04, 0
	frame_oam -32,  10, $06, 0
	frame_oam -16,   2, $1a, 0
	db $80

.frame_67
	frame_oam -16, -15, $16, 0
	frame_oam -16,  -7, $18, 0
	frame_oam -32, -15, $44, 0
	frame_oam -32,  -7, $46, 0
	frame_oam -32,   1, $04, 0
	frame_oam -26,   9, $0e, 0
	frame_oam -16,   1, $2c, 0
	frame_oam -10,   9, $58, 0
	db $80

.frame_68
	frame_oam -32, -15, $48, 0
	frame_oam -32,  -7, $4a, 0
	frame_oam -32,   1, $4c, 0
	frame_oam -32,   9, $4e, 0
	frame_oam -16, -15, $50, 0
	frame_oam -16,  -7, $52, 0
	frame_oam -16,   1, $54, 0
	frame_oam -16,   9, $56, 0
	db $80
; 0x1fed53

Frameset_1fed53:: ; 1fed53 (7f:6d53)
	db $00,  2
	db $01,  2
	db $02,  2
	db $03,  2
	db $00,  2
	db $01,  2
	db $02,  2
	db $03,  2
	db $00,  2
	db $01,  2
	db $02,  2
	db $03,  2
	db $00,  2
	db $01,  2
	db $02,  2
	db $03,  2
	db $00,  2
	db $01,  2
	db $02,  2
	db $03,  2
	db $ff
; 0x1fed7c

Frameset_1fed7c:: ; 1fed7c (7f:6d7c)
	db $04,  5
	db $05,  5
	db $06,  5
	db $07,  5
	db $08,  5
	db $09,  5
	db $0a,  5
	db $0b,  5
	db $0c,  5
	db $0d,  5
	db $ff
; 0x1fed91

Frameset_1fed91:: ; 1fed91 (7f:6d91)
	db $0e,  5
	db $0f,  5
	db $10,  5
	db $11,  5
	db $12,  5
	db $13,  5
	db $14,  5
	db $15,  5
	db $16,  5
	db $17,  5
	db $ff
; 0x1feda6

Frameset_1feda6:: ; 1feda6 (7f:6da6)
	db $18,  3
	db $19,  3
	db $1a,  3
	db $1b,  3
	db $1c,  3
	db $1d,  3
	db $1e,  3
	db $1f,  3
	db $20,  3
	db $21,  3
	db $ff
; 0x1fedbb

Frameset_1fedbb:: ; 1fedbb (7f:6dbb)
	db $22,  3
	db $23,  3
	db $24,  3
	db $25,  3
	db $26,  3
	db $27,  3
	db $28,  3
	db $29,  3
	db $2a,  3
	db $2b,  3
	db $ff
; 0x1fedd0

Frameset_1fedd0:: ; 1fedd0 (7f:6dd0)
	db $2e,  5
	db $2f,  5
	db $30,  5
	db $31,  5
	db $32,  5
	db $33,  5
	db $34,  5
	db $35,  5
	db $2c,  5
	db $2d,  5
	db $ff
; 0x1fede5

Frameset_1fede5:: ; 1fede5 (7f:6de5)
	db $38,  3
	db $39,  3
	db $3a,  3
	db $3b,  3
	db $41,  1
	db $3c,  2
	db $3d,  3
	db $3e,  3
	db $3f,  3
	db $36,  3
	db $40,  1
	db $37,  2
	db $ff
; 0x1fedfe

Frameset_1fedfe:: ; 1fedfe (7f:6dfe)
	db $42,  2
	db $43,  3
	db $44,  4
	db $ff
; 0x1fee05

OAM_1fee05:: ; 1fee05 (7f:6e05)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4

.frame_0
	frame_oam -19,  13, $2e, 0
	frame_oam -35,   5, $04, 0
	frame_oam -35,  13, $06, 0
	frame_oam -35,  -3, $42, 0
	frame_oam -35, -11, $40, 0
	frame_oam -19, -11, $38, 0
	frame_oam -19,  -3, $3a, 0
	frame_oam -19,   5, $5a, 0
	db $80

.frame_1
	frame_oam -18,  12, $2e, 0
	frame_oam -34,   4, $04, 0
	frame_oam -34,  12, $06, 0
	frame_oam -34,  -4, $42, 0
	frame_oam -34, -12, $40, 0
	frame_oam -18, -12, $20, 0
	frame_oam -18,  -4, $2a, 0
	frame_oam -18,   4, $2c, 0
	db $80

.frame_2
	frame_oam -35, -14, $1c, 0
	frame_oam -35,  -6, $1e, 0
	frame_oam -19,   2, $34, 0
	frame_oam -19,  10, $36, 0
	frame_oam -35,   2, $04, 0
	frame_oam -35,  10, $06, 0
	frame_oam -19,  -6, $18, 0
	frame_oam -19, -14, $20, 0
	db $80

.frame_3
	frame_oam -19, -10, $14, 0
	frame_oam -19,  -2, $2a, 0
	frame_oam -35, -10, $08, 0
	frame_oam -35,  -2, $0a, 0
	frame_oam -19,  14, $2e, 0
	frame_oam -35,   6, $04, 0
	frame_oam -35,  14, $06, 0
	frame_oam -19,   6, $1a, 0
	db $80

.frame_4
	frame_oam -17, -11, $16, 0
	frame_oam -17,  -3, $18, 0
	frame_oam -33, -11, $44, 0
	frame_oam -33,  -3, $46, 0
	frame_oam -33,   5, $04, 0
	frame_oam -27,  13, $0e, 0
	frame_oam -17,   5, $2c, 0
	frame_oam -11,  13, $58, 0
	db $80
; 0x1feeb4

Frameset_1feeb4:: ; 1feeb4 (7f:6eb4)
	db $00,  4
	db $01,  6
	db $02,  4
	db $01,  6
	db $ff
; 0x1feebd

; unreferenced
Frameset_1feebd: ; 1feebd (7f:6ebd)
	db $00,  1
	db $03,  8
	db $04,  8
	db $ff
; 0x1feec4

Frameset_1feec4:: ; 1feec4 (7f:6ec4)
	db $01,  2
	db $ff
; 0x1feec7

OAM_1feec7:: ; 1feec7 (7f:6ec7)
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

.frame_0
	frame_oam -41,  -4, $12, 1
	frame_oam -41, -11, $10, 1
	frame_oam -41,   3, $10, 1 | OAMF_XFLIP
	frame_oam -57,   0, $0e, 1
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -32,   4, $04, 0
	frame_oam -57,  -8, $0c, 1
	frame_oam -16, -12, $06, 0
	frame_oam -16,  -4, $08, 0
	frame_oam -16,   4, $0a, 0
	db $80

.frame_1
	frame_oam -52,   0, $0e, 1
	frame_oam -36, -12, $10, 1
	frame_oam -36,  -4, $12, 1
	frame_oam -36,   4, $10, 1 | OAMF_XFLIP
	frame_oam -32, -12, $00, 0
	frame_oam -32,  -4, $02, 0
	frame_oam -52,  -8, $0c, 1
	frame_oam -32,   4, $04, 0
	frame_oam -16, -12, $06, 0
	frame_oam -16,  -4, $08, 0
	frame_oam -16,   4, $0a, 0
	db $80

.frame_2
	frame_oam -30, -12, $10, 1
	frame_oam -30,  -4, $12, 1
	frame_oam -30,   4, $10, 1 | OAMF_XFLIP
	frame_oam -46,  -8, $0c, 1
	frame_oam -46,   0, $0e, 1
	frame_oam -16, -12, $06, 0
	frame_oam -16,  -4, $08, 0
	frame_oam -16,   4, $0a, 0
	db $80

.frame_3
	frame_oam -49,  -8, $4c, 0
	frame_oam -49,   0, $4e, 0
	frame_oam -32, -12, $14, 1
	frame_oam -32,  -4, $16, 1
	frame_oam -32,   4, $18, 1
	frame_oam -16, -12, $1a, 1
	frame_oam -16,  -4, $1c, 1
	frame_oam -16,   4, $1e, 1
	frame_oam -29, -22, $38, 1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -68,  -8, $4c, 0
	frame_oam -68,   0, $4e, 0
	frame_oam -32,  -8, $0c, 1
	frame_oam -30,   0, $0e, 1
	frame_oam -16,   4, $22, 1
	frame_oam -42,  13, $38, 1
	frame_oam -32, -36, $38, 1 | OAMF_XFLIP
	frame_oam -16, -12, $10, 1
	frame_oam -16,  -4, $20, 1
	db $80

.frame_5
	frame_oam -62,  -8, $4c, 0
	frame_oam -63,   0, $4e, 0
	frame_oam -16,  -4, $28, 1
	frame_oam -43,  29, $38, 1
	frame_oam -16, -12, $24, 1
	frame_oam -16,   4, $24, 1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -57,   0, $4c, 0 | OAMF_XFLIP
	frame_oam -57,  -8, $4e, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $28, 1
	frame_oam -16, -12, $26, 1
	frame_oam -16,   4, $26, 1 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -51,  -8, $4c, 0
	frame_oam -51,   0, $4e, 0
	frame_oam -16, -12, $2a, 1
	frame_oam -16,   4, $2a, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $2c, 1
	db $80

.frame_8
	frame_oam -29,  -8, $4e, 0 | OAMF_XFLIP
	frame_oam -29,   0, $4c, 0 | OAMF_XFLIP
	frame_oam -16, -12, $2a, 1
	frame_oam -16,   4, $2a, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $2c, 1
	db $80

.frame_9
	frame_oam -30,   0, $4e, 0
	frame_oam -29,  -8, $4c, 0
	frame_oam -16,  -4, $28, 1
	frame_oam -16, -12, $26, 1
	frame_oam -16,   4, $26, 1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -29,   0, $4e, 0
	frame_oam -29,  -8, $4c, 0
	frame_oam -16, -12, $2e, 1
	frame_oam -16,   4, $2e, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $30, 1
	db $80

.frame_11
	frame_oam -30,  -8, $4c, 0
	frame_oam -30,   0, $4e, 0
	frame_oam -17, -12, $2e, 1
	frame_oam -17,   4, $2e, 1 | OAMF_XFLIP
	frame_oam -17,  -4, $30, 1
	db $80

.frame_12
	frame_oam -31,  -8, $4c, 0
	frame_oam -32,   0, $4e, 0
	frame_oam -16, -12, $2e, 1
	frame_oam -16,   4, $2e, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $30, 1
	db $80

.frame_13
	frame_oam -20, -12, $3a, 1
	frame_oam -20,  -4, $3c, 1
	frame_oam -20,   4, $3e, 1
	frame_oam -36, -13, $34, 0
	frame_oam -36,  -5, $36, 0
	frame_oam -36,   3, $04, 0
	db $80

.frame_14
	frame_oam -38, -13, $34, 0
	frame_oam -38,  -5, $36, 0
	frame_oam -22, -12, $3a, 1
	frame_oam -22,  -4, $3c, 1
	frame_oam -22,   4, $3e, 1
	frame_oam -38,   3, $04, 0
	db $80

.frame_15
	frame_oam -24,  -4, $48, 1
	frame_oam -24,   4, $4a, 1
	frame_oam -24, -12, $46, 1
	frame_oam -40, -12, $00, 0
	frame_oam -40,  -4, $02, 0
	frame_oam -40,   4, $04, 0
	db $80

.frame_16
	frame_oam -18,  -4, $48, 1
	frame_oam -18,   4, $4a, 1
	frame_oam -18, -12, $46, 1
	frame_oam -34, -12, $40, 0
	frame_oam -34,  -4, $42, 0
	frame_oam -34,   4, $44, 0
	db $80

.frame_17
	frame_oam -15,  -4, $48, 1
	frame_oam -15,   4, $4a, 1
	frame_oam -15, -12, $46, 1
	frame_oam -31, -11, $00, 0
	frame_oam -31,  -3, $02, 0
	frame_oam -31,   5, $04, 0
	db $80

.frame_18
	frame_oam -29, -12, $40, 0
	frame_oam -29,  -4, $42, 0
	frame_oam -29,   4, $44, 0
	frame_oam -13, -12, $50, 1
	frame_oam -13,  -4, $52, 1
	frame_oam -13,   4, $54, 1
	db $80

.frame_19
	frame_oam -27, -12, $40, 0
	frame_oam -27,  -4, $42, 0
	frame_oam -27,   4, $44, 0
	frame_oam -11, -12, $68, 1
	frame_oam -11,  -4, $6a, 1
	frame_oam -11,   4, $6c, 1
	db $80

.frame_20
	frame_oam -32, -12, $40, 0
	frame_oam -32,  -4, $42, 0
	frame_oam -32,   4, $44, 0
	frame_oam -16, -12, $46, 1
	frame_oam -16,  -4, $5c, 1
	frame_oam -16,   4, $5e, 1
	db $80

.frame_21
	frame_oam -17, -12, $60, 1
	frame_oam -17,  -4, $5c, 1
	frame_oam -17,   4, $62, 1
	frame_oam -33, -12, $40, 0
	frame_oam -33,  -4, $42, 0
	frame_oam -33,   4, $44, 0
	db $80

.frame_22
	frame_oam -32, -12, $40, 0
	frame_oam -32,  -4, $42, 0
	frame_oam -32,   4, $44, 0
	frame_oam -16, -12, $64, 1
	frame_oam -16,  -4, $58, 1
	frame_oam -16,   4, $66, 1
	db $80

.frame_23
	frame_oam -15, -12, $56, 1
	frame_oam -15,  -4, $58, 1
	frame_oam -15,   4, $5a, 1
	frame_oam -31, -12, $40, 0
	frame_oam -31,  -4, $42, 0
	frame_oam -31,   4, $44, 0
	db $80

.frame_24
	frame_oam -41,  -4, $12, 1 | OAMF_XFLIP
	frame_oam -41,   3, $10, 1 | OAMF_XFLIP
	frame_oam -41, -11, $10, 1
	frame_oam -57,  -8, $0e, 1 | OAMF_XFLIP
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	frame_oam -57,   0, $0c, 1 | OAMF_XFLIP
	frame_oam -16,   4, $06, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -16, -12, $0a, 0 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -52,  -8, $0e, 1 | OAMF_XFLIP
	frame_oam -36,   4, $10, 1 | OAMF_XFLIP
	frame_oam -36,  -4, $12, 1 | OAMF_XFLIP
	frame_oam -36, -12, $10, 1
	frame_oam -32,   4, $00, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -52,   0, $0c, 1 | OAMF_XFLIP
	frame_oam -32, -12, $04, 0 | OAMF_XFLIP
	frame_oam -16,   4, $06, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -16, -12, $0a, 0 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -30,   4, $10, 1 | OAMF_XFLIP
	frame_oam -30,  -4, $12, 1 | OAMF_XFLIP
	frame_oam -30, -12, $10, 1
	frame_oam -46,   0, $0c, 1 | OAMF_XFLIP
	frame_oam -46,  -8, $0e, 1 | OAMF_XFLIP
	frame_oam -16,   4, $06, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $08, 0 | OAMF_XFLIP
	frame_oam -16, -12, $0a, 0 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -49,   0, $4c, 0 | OAMF_XFLIP
	frame_oam -49,  -8, $4e, 0 | OAMF_XFLIP
	frame_oam -32,   4, $14, 1 | OAMF_XFLIP
	frame_oam -32,  -4, $16, 1 | OAMF_XFLIP
	frame_oam -32, -12, $18, 1 | OAMF_XFLIP
	frame_oam -16,   4, $1a, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $1c, 1 | OAMF_XFLIP
	frame_oam -16, -12, $1e, 1 | OAMF_XFLIP
	frame_oam -29,  14, $38, 1
	db $80

.frame_28
	frame_oam -68,   0, $4c, 0 | OAMF_XFLIP
	frame_oam -68,  -8, $4e, 0 | OAMF_XFLIP
	frame_oam -32,   0, $0c, 1 | OAMF_XFLIP
	frame_oam -30,  -8, $0e, 1 | OAMF_XFLIP
	frame_oam -16, -12, $22, 1 | OAMF_XFLIP
	frame_oam -42, -21, $38, 1 | OAMF_XFLIP
	frame_oam -32,  28, $38, 1
	frame_oam -16,   4, $10, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $20, 1 | OAMF_XFLIP
	db $80

.frame_29
	frame_oam -62,   0, $4c, 0 | OAMF_XFLIP
	frame_oam -63,  -8, $4e, 0 | OAMF_XFLIP
	frame_oam -16,   4, $26, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $28, 1 | OAMF_XFLIP
	frame_oam -16, -12, $26, 1
	frame_oam -43, -37, $38, 1 | OAMF_XFLIP
	db $80

.frame_30
	frame_oam -57,  -8, $4c, 0
	frame_oam -57,   0, $4e, 0
	frame_oam -16,  -4, $28, 1 | OAMF_XFLIP
	frame_oam -16,   4, $26, 1 | OAMF_XFLIP
	frame_oam -16, -12, $26, 1
	db $80

.frame_31
	frame_oam -51,   0, $4c, 0 | OAMF_XFLIP
	frame_oam -51,  -8, $4e, 0 | OAMF_XFLIP
	frame_oam -16, -12, $2a, 1
	frame_oam -16,   4, $2a, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $2c, 1
	db $80

.frame_32
	frame_oam -29,   0, $4e, 0
	frame_oam -29,  -8, $4c, 0
	frame_oam -16, -12, $2a, 1
	frame_oam -16,   4, $2a, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $2c, 1
	db $80

.frame_33
	frame_oam -30,  -8, $4e, 0 | OAMF_XFLIP
	frame_oam -29,   0, $4c, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $28, 1 | OAMF_XFLIP
	frame_oam -16,   4, $26, 1 | OAMF_XFLIP
	frame_oam -16, -12, $26, 1
	db $80

.frame_34
	frame_oam -29,  -8, $4e, 0 | OAMF_XFLIP
	frame_oam -29,   0, $4c, 0 | OAMF_XFLIP
	frame_oam -16, -12, $2e, 1
	frame_oam -16,   4, $2e, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $30, 1
	db $80

.frame_35
	frame_oam -30,   0, $4c, 0 | OAMF_XFLIP
	frame_oam -30,  -8, $4e, 0 | OAMF_XFLIP
	frame_oam -17, -12, $2e, 1
	frame_oam -17,   4, $2e, 1 | OAMF_XFLIP
	frame_oam -17,  -4, $30, 1
	db $80

.frame_36
	frame_oam -31,   0, $4c, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $4e, 0 | OAMF_XFLIP
	frame_oam -16, -12, $2e, 1
	frame_oam -16,   4, $2e, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $30, 1
	db $80

.frame_37
	frame_oam -20,   4, $3a, 1 | OAMF_XFLIP
	frame_oam -20,  -4, $3c, 1 | OAMF_XFLIP
	frame_oam -20, -12, $3e, 1 | OAMF_XFLIP
	frame_oam -36,   5, $34, 0 | OAMF_XFLIP
	frame_oam -36,  -3, $36, 0 | OAMF_XFLIP
	frame_oam -36, -11, $04, 0 | OAMF_XFLIP
	db $80

.frame_38
	frame_oam -38,   5, $34, 0 | OAMF_XFLIP
	frame_oam -38,  -3, $36, 0 | OAMF_XFLIP
	frame_oam -22,   4, $3a, 1 | OAMF_XFLIP
	frame_oam -22,  -4, $3c, 1 | OAMF_XFLIP
	frame_oam -22, -12, $3e, 1 | OAMF_XFLIP
	frame_oam -38, -11, $04, 0 | OAMF_XFLIP
	db $80

.frame_39
	frame_oam -24,  -4, $48, 1 | OAMF_XFLIP
	frame_oam -24, -12, $4a, 1 | OAMF_XFLIP
	frame_oam -24,   4, $46, 1 | OAMF_XFLIP
	frame_oam -40,   4, $00, 0 | OAMF_XFLIP
	frame_oam -40,  -4, $02, 0 | OAMF_XFLIP
	frame_oam -40, -12, $04, 0 | OAMF_XFLIP
	db $80

.frame_40
	frame_oam -18,  -4, $48, 1 | OAMF_XFLIP
	frame_oam -18, -12, $4a, 1 | OAMF_XFLIP
	frame_oam -18,   4, $46, 1 | OAMF_XFLIP
	frame_oam -34,   4, $40, 0 | OAMF_XFLIP
	frame_oam -34,  -4, $42, 0 | OAMF_XFLIP
	frame_oam -34, -12, $44, 0 | OAMF_XFLIP
	db $80

.frame_41
	frame_oam -15,  -4, $48, 1 | OAMF_XFLIP
	frame_oam -15, -12, $4a, 1 | OAMF_XFLIP
	frame_oam -15,   4, $46, 1 | OAMF_XFLIP
	frame_oam -31,   3, $00, 0 | OAMF_XFLIP
	frame_oam -31,  -5, $02, 0 | OAMF_XFLIP
	frame_oam -31, -13, $04, 0 | OAMF_XFLIP
	db $80

.frame_42
	frame_oam -29,   4, $40, 0 | OAMF_XFLIP
	frame_oam -29,  -4, $42, 0 | OAMF_XFLIP
	frame_oam -29, -12, $44, 0 | OAMF_XFLIP
	frame_oam -13,   4, $50, 1 | OAMF_XFLIP
	frame_oam -13,  -4, $52, 1 | OAMF_XFLIP
	frame_oam -13, -12, $54, 1 | OAMF_XFLIP
	db $80

.frame_43
	frame_oam -27,   4, $40, 0 | OAMF_XFLIP
	frame_oam -27,  -4, $42, 0 | OAMF_XFLIP
	frame_oam -27, -12, $44, 0 | OAMF_XFLIP
	frame_oam -11,   4, $68, 1 | OAMF_XFLIP
	frame_oam -11,  -4, $6a, 1 | OAMF_XFLIP
	frame_oam -11, -12, $6c, 1 | OAMF_XFLIP
	db $80

.frame_44
	frame_oam -32,   4, $40, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $42, 0 | OAMF_XFLIP
	frame_oam -32, -12, $44, 0 | OAMF_XFLIP
	frame_oam -16,   4, $46, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $5c, 1 | OAMF_XFLIP
	frame_oam -16, -12, $5e, 1 | OAMF_XFLIP
	db $80

.frame_45
	frame_oam -17,   4, $60, 1 | OAMF_XFLIP
	frame_oam -17,  -4, $5c, 1 | OAMF_XFLIP
	frame_oam -17, -12, $62, 1 | OAMF_XFLIP
	frame_oam -33,   4, $40, 0 | OAMF_XFLIP
	frame_oam -33,  -4, $42, 0 | OAMF_XFLIP
	frame_oam -33, -12, $44, 0 | OAMF_XFLIP
	db $80

.frame_46
	frame_oam -32,   4, $40, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $42, 0 | OAMF_XFLIP
	frame_oam -32, -12, $44, 0 | OAMF_XFLIP
	frame_oam -16,   4, $64, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $58, 1 | OAMF_XFLIP
	frame_oam -16, -12, $66, 1 | OAMF_XFLIP
	db $80

.frame_47
	frame_oam -15,   4, $56, 1 | OAMF_XFLIP
	frame_oam -15,  -4, $58, 1 | OAMF_XFLIP
	frame_oam -15, -12, $5a, 1 | OAMF_XFLIP
	frame_oam -31,   4, $40, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $42, 0 | OAMF_XFLIP
	frame_oam -31, -12, $44, 0 | OAMF_XFLIP
	db $80

.frame_48
	frame_oam -32, -12, $6e, 0
	frame_oam -32,  -4, $70, 0
	frame_oam -32,   4, $72, 0
	frame_oam -16, -12, $74, 1
	frame_oam -16,  -4, $76, 1
	frame_oam -16,   4, $78, 1
	db $80

.frame_49
	frame_oam -32, -16, $7a, 0
	frame_oam -32,  -8, $7c, 0
	frame_oam -16, -16, $32, 1
	frame_oam -16,  -8, $7e, 1
	frame_oam -32,   8, $7a, 0 | OAMF_XFLIP
	frame_oam -32,   0, $7c, 0 | OAMF_XFLIP
	frame_oam -16,   8, $32, 1 | OAMF_XFLIP
	frame_oam -16,   0, $7e, 1 | OAMF_XFLIP
	db $80

.frame_50
	frame_oam -32,   4, $6e, 0 | OAMF_XFLIP
	frame_oam -32,  -4, $70, 0 | OAMF_XFLIP
	frame_oam -32, -12, $72, 0 | OAMF_XFLIP
	frame_oam -16,   4, $74, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $76, 1 | OAMF_XFLIP
	frame_oam -16, -12, $78, 1 | OAMF_XFLIP
	db $80

.frame_51
	frame_oam -26, -12, $40, 0
	frame_oam -26,  -4, $42, 0
	frame_oam -26,   4, $44, 0
	frame_oam -16, -12, $2e, 1
	frame_oam -16,   4, $2e, 1 | OAMF_XFLIP
	frame_oam -16,  -4, $30, 1
	db $80

.frame_52
	frame_oam -26,   4, $40, 0 | OAMF_XFLIP
	frame_oam -26,  -4, $42, 0 | OAMF_XFLIP
	frame_oam -26, -12, $44, 0 | OAMF_XFLIP
	frame_oam -16,   4, $2e, 1 | OAMF_XFLIP
	frame_oam -16, -12, $2e, 1
	frame_oam -16,  -4, $30, 1 | OAMF_XFLIP
	db $80

.frame_53
	frame_oam -15, -13, $46, 1
	frame_oam -15,  -5, $48, 1
	frame_oam -15,   3, $4a, 1
	frame_oam -31, -12, $40, 0
	frame_oam -31,  -4, $42, 0
	frame_oam -31,   4, $44, 0
	db $80

.frame_54
	frame_oam -15,  -3, $48, 1
	frame_oam -15,   5, $4a, 1
	frame_oam -15, -11, $46, 1
	frame_oam -31, -11, $00, 0
	frame_oam -31,  -3, $02, 0
	frame_oam -31,   5, $04, 0
	db $80

.frame_55
	frame_oam -15, -11, $46, 1
	frame_oam -15,  -4, $48, 1
	frame_oam -15,   4, $4a, 1
	frame_oam -31, -12, $40, 0
	frame_oam -31,  -4, $42, 0
	frame_oam -31,   4, $44, 0
	db $80

.frame_56
	frame_oam -15,   5, $46, 1 | OAMF_XFLIP
	frame_oam -15,  -3, $48, 1 | OAMF_XFLIP
	frame_oam -15, -11, $4a, 1 | OAMF_XFLIP
	frame_oam -31,   4, $40, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $42, 0 | OAMF_XFLIP
	frame_oam -31, -12, $44, 0 | OAMF_XFLIP
	db $80

.frame_57
	frame_oam -15,  -5, $48, 1 | OAMF_XFLIP
	frame_oam -15, -13, $4a, 1 | OAMF_XFLIP
	frame_oam -15,   3, $46, 1 | OAMF_XFLIP
	frame_oam -31,   3, $00, 0 | OAMF_XFLIP
	frame_oam -31,  -5, $02, 0 | OAMF_XFLIP
	frame_oam -31, -13, $04, 0 | OAMF_XFLIP
	db $80

.frame_58
	frame_oam -15,   3, $46, 1 | OAMF_XFLIP
	frame_oam -15,  -4, $48, 1 | OAMF_XFLIP
	frame_oam -15, -12, $4a, 1 | OAMF_XFLIP
	frame_oam -31,   4, $40, 0 | OAMF_XFLIP
	frame_oam -31,  -4, $42, 0 | OAMF_XFLIP
	frame_oam -31, -12, $44, 0 | OAMF_XFLIP
	db $80
; 0x1ff560

Frameset_1ff560:: ; 1ff560 (7f:7560)
	db $00,  1
	db $01,  1
	db $02,  2
	db $03,  5
	db $04,  3
	db $05,  2
	db $06,  2
	db $07,  2
	db $08,  4
	db $09,  4
	db $08,  4
	db $0a, 16
	db $0b,  2
	db $0c,  2
	db $0a,  2
	db $0b,  2
	db $0c,  2
	db $0a,  2
	db $0b,  2
	db $0c,  2
	db $0a,  2
	db $0b,  2
	db $0c,  2
	db $0d,  4
	db $0e,  6
	db $0f,  8
	db $10,  6
	db $11,  4
	db $12,  4
	db $13,  8
	db $12,  4
	db $11,  4
	db $10,  6
	db $ff
; 0x1ff5a3

Frameset_1ff5a3:: ; 1ff5a3 (7f:75a3)
	db $18,  1
	db $19,  1
	db $1a,  2
	db $1b,  5
	db $1c,  3
	db $1d,  2
	db $1e,  2
	db $1f,  2
	db $20,  4
	db $21,  4
	db $20,  4
	db $22, 16
	db $23,  2
	db $24,  2
	db $22,  2
	db $23,  2
	db $24,  2
	db $22,  2
	db $23,  2
	db $24,  2
	db $22,  2
	db $23,  2
	db $24,  2
	db $25,  4
	db $26,  6
	db $27,  8
	db $28,  6
	db $29,  4
	db $2a,  4
	db $2b,  8
	db $2a,  4
	db $29,  4
	db $28,  6
	db $ff
; 0x1ff5e6

Frameset_1ff5e6:: ; 1ff5e6 (7f:75e6)
	db $15,  6
	db $16,  6
	db $17,  6
	db $14,  6
	db $ff
; 0x1ff5ef

Frameset_1ff5ef:: ; 1ff5ef (7f:75ef)
	db $2d,  6
	db $2e,  6
	db $2f,  6
	db $2c,  6
	db $ff
; 0x1ff5f8

Frameset_1ff5f8:: ; 1ff5f8 (7f:75f8)
	db $14,  4
	db $ff
; 0x1ff5fb

Frameset_1ff5fb:: ; 1ff5fb (7f:75fb)
	db $2c,  4
	db $ff
; 0x1ff5fe

Frameset_1ff5fe:: ; 1ff5fe (7f:75fe)
	db $30,  2
	db $31,  2
	db $32,  2
	db $ff
; 0x1ff605

Frameset_1ff605:: ; 1ff605 (7f:7605)
	db $32,  2
	db $30,  2
	db $31,  2
	db $ff
; 0x1ff60c

Frameset_1ff60c:: ; 1ff60c (7f:760c)
	db $12,  1
	db $13,  2
	db $33,  3
	db $13,  1
	db $12,  1
	db $ff
; 0x1ff617

Frameset_1ff617:: ; 1ff617 (7f:7617)
	db $2a,  1
	db $2b,  2
	db $34,  3
	db $2b,  1
	db $2a,  1
	db $ff
; 0x1ff622

Frameset_1ff622:: ; 1ff622 (7f:7622)
	db $11,  4
	db $ff
; 0x1ff625

Frameset_1ff625:: ; 1ff625 (7f:7625)
	db $29,  4
	db $ff
; 0x1ff628

Frameset_1ff628:: ; 1ff628 (7f:7628)
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

Frameset_1ff639:: ; 1ff639 (7f:7639)
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

OAM_1ff64a:: ; 1ff64a (7f:764a)
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
	frame_oam -26, -12, $00, 1
	frame_oam -26,  -4, $02, 1
	frame_oam -26,   4, $04, 1
	frame_oam -10, -12, $00, 1 | OAMF_YFLIP
	frame_oam -10,  -4, $22, 1
	frame_oam -10,   4, $24, 1
	db $80

.frame_1
	frame_oam -10, -12, $00, 1 | OAMF_YFLIP
	frame_oam -10,  -4, $02, 1 | OAMF_YFLIP
	frame_oam -10,   4, $04, 1 | OAMF_YFLIP
	frame_oam -26, -12, $00, 1
	frame_oam -26,  -4, $22, 1 | OAMF_YFLIP
	frame_oam -26,   4, $24, 1 | OAMF_YFLIP
	db $80

.frame_2
	frame_oam  -6, -12, $06, 1 | OAMF_YFLIP
	frame_oam  -6,  -4, $08, 1 | OAMF_YFLIP
	frame_oam -22, -12, $26, 1 | OAMF_YFLIP
	frame_oam -22,  -4, $28, 1 | OAMF_YFLIP
	frame_oam  -6,   4, $06, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -22,   4, $26, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_3
	frame_oam -10,   4, $00, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -10,  -4, $02, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -10, -12, $04, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -26,   4, $00, 1 | OAMF_XFLIP
	frame_oam -26,  -4, $22, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -26, -12, $24, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_4
	frame_oam -26,   4, $00, 1 | OAMF_XFLIP
	frame_oam -26,  -4, $02, 1 | OAMF_XFLIP
	frame_oam -26, -12, $04, 1 | OAMF_XFLIP
	frame_oam -10,   4, $00, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -10,  -4, $22, 1 | OAMF_XFLIP
	frame_oam -10, -12, $24, 1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -33, -12, $06, 1
	frame_oam -33,  -4, $08, 1
	frame_oam -17, -12, $26, 1
	frame_oam -17,  -4, $28, 1
	frame_oam -33,   4, $06, 1 | OAMF_XFLIP
	frame_oam -17,   4, $26, 1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -29, -12, $20, 1
	frame_oam -13, -12, $20, 1 | OAMF_YFLIP
	frame_oam -29,  -4, $0a, 1
	frame_oam -29,   4, $0c, 1
	frame_oam -13,  -4, $2a, 1
	frame_oam -13,   4, $2c, 1
	db $80

.frame_7
	frame_oam -29, -12, $20, 1
	frame_oam -13, -12, $20, 1 | OAMF_YFLIP
	frame_oam -13,  -4, $0a, 1 | OAMF_YFLIP
	frame_oam -13,   4, $0c, 1 | OAMF_YFLIP
	frame_oam -29,  -4, $2a, 1 | OAMF_YFLIP
	frame_oam -29,   4, $2c, 1 | OAMF_YFLIP
	db $80

.frame_8
	frame_oam -12, -12, $0e, 1 | OAMF_YFLIP
	frame_oam -12,  -4, $10, 1 | OAMF_YFLIP
	frame_oam -28, -12, $2e, 1 | OAMF_YFLIP
	frame_oam -28,  -4, $30, 1 | OAMF_YFLIP
	frame_oam -12,   4, $0e, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -28,   4, $2e, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_9
	frame_oam -29,   4, $20, 1 | OAMF_XFLIP
	frame_oam -13,   4, $20, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -13,  -4, $0a, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -13, -12, $0c, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -29,  -4, $2a, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -29, -12, $2c, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_10
	frame_oam -29,   4, $20, 1 | OAMF_XFLIP
	frame_oam -13,   4, $20, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -29,  -4, $0a, 1 | OAMF_XFLIP
	frame_oam -29, -12, $0c, 1 | OAMF_XFLIP
	frame_oam -13,  -4, $2a, 1 | OAMF_XFLIP
	frame_oam -13, -12, $2c, 1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -33, -12, $0e, 1
	frame_oam -33,  -4, $10, 1
	frame_oam -17, -12, $2e, 1
	frame_oam -17,  -4, $30, 1
	frame_oam -33,   4, $0e, 1 | OAMF_XFLIP
	frame_oam -17,   4, $2e, 1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -33, -16, $12, 1
	frame_oam -33,  -8, $14, 1
	frame_oam -33,   0, $16, 1
	frame_oam -33,   8, $12, 1 | OAMF_XFLIP
	frame_oam -17, -16, $12, 1 | OAMF_YFLIP
	frame_oam -17,  -8, $14, 1 | OAMF_YFLIP
	frame_oam -17,   0, $18, 1
	frame_oam -17,   8, $1a, 1
	db $80

.frame_13
	frame_oam -16, -16, $12, 1 | OAMF_YFLIP
	frame_oam -16,  -8, $14, 1 | OAMF_YFLIP
	frame_oam -16,   0, $16, 1 | OAMF_YFLIP
	frame_oam -16,   8, $12, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32, -16, $12, 1
	frame_oam -32,  -8, $14, 1
	frame_oam -32,   0, $18, 1 | OAMF_YFLIP
	frame_oam -32,   8, $1a, 1 | OAMF_YFLIP
	db $80

.frame_14
	frame_oam -15, -16, $32, 1
	frame_oam -15,  -8, $34, 1
	frame_oam -31, -16, $1c, 1
	frame_oam -31,  -8, $1e, 1
	frame_oam -31,   8, $1c, 1 | OAMF_XFLIP
	frame_oam -31,   0, $1e, 1 | OAMF_XFLIP
	frame_oam -15,   0, $36, 1
	frame_oam -15,   8, $38, 1
	db $80

.frame_15
	frame_oam -15,   8, $32, 1 | OAMF_XFLIP
	frame_oam -15,   0, $34, 1 | OAMF_XFLIP
	frame_oam -31, -16, $1c, 1
	frame_oam -31,  -8, $1e, 1
	frame_oam -31,   8, $1c, 1 | OAMF_XFLIP
	frame_oam -31,   0, $1e, 1 | OAMF_XFLIP
	frame_oam -15,  -8, $36, 1 | OAMF_XFLIP
	frame_oam -15, -16, $38, 1 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -16,   8, $12, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,   0, $14, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $16, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -16, $12, 1 | OAMF_YFLIP
	frame_oam -32,   8, $12, 1 | OAMF_XFLIP
	frame_oam -32,   0, $14, 1 | OAMF_XFLIP
	frame_oam -32,  -8, $18, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -32, -16, $1a, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_17
	frame_oam -33,   8, $12, 1 | OAMF_XFLIP
	frame_oam -33,   0, $14, 1 | OAMF_XFLIP
	frame_oam -33,  -8, $16, 1 | OAMF_XFLIP
	frame_oam -33, -16, $12, 1
	frame_oam -17,   8, $12, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -17,   0, $14, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -17,  -8, $18, 1 | OAMF_XFLIP
	frame_oam -17, -16, $1a, 1 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -31,   8, $32, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -31,   0, $34, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -15, -16, $1c, 1 | OAMF_YFLIP
	frame_oam -15,  -8, $1e, 1 | OAMF_YFLIP
	frame_oam -15,   8, $1c, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -15,   0, $1e, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -31,  -8, $36, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -31, -16, $38, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_19
	frame_oam -31, -16, $32, 1 | OAMF_YFLIP
	frame_oam -31,  -8, $34, 1 | OAMF_YFLIP
	frame_oam -15, -16, $1c, 1 | OAMF_YFLIP
	frame_oam -15,  -8, $1e, 1 | OAMF_YFLIP
	frame_oam -15,   8, $1c, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -15,   0, $1e, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -31,   0, $36, 1 | OAMF_YFLIP
	frame_oam -31,   8, $38, 1 | OAMF_YFLIP
	db $80

.frame_20
	frame_oam -20, -14, $3a, 1
	frame_oam -20,  -6, $3a, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -11,  -6, $3a, 1
	frame_oam -11,   2, $3a, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -28,  -2, $3a, 1
	frame_oam -28,   6, $3a, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -36, -10, $3a, 1
	frame_oam -36,  -2, $3a, 1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_21
	frame_oam -33, -21, $3a, 1
	frame_oam -33, -13, $3a, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -20,   3, $3a, 1
	frame_oam -20,  11, $3a, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16, -11, $3c, 1
	frame_oam  -8, -20, $3c, 1
	frame_oam -51,  -5, $3c, 1 | OAMF_YFLIP
	frame_oam -40,  15, $3c, 1 | OAMF_YFLIP
	frame_oam -45,  11, $3c, 1 | OAMF_XFLIP
	frame_oam -58,  19, $3e, 1 | OAMF_YFLIP
	db $80

.frame_22
	frame_oam -18, -17, $3c, 1
	frame_oam -24,   9, $3c, 1
	frame_oam  -3,   4, $3c, 1
	frame_oam -44, -18, $3c, 1
	frame_oam -43, -30, $3c, 1 | OAMF_YFLIP
	frame_oam -18, -31, $3e, 1
	frame_oam -15,  18, $3e, 1 | OAMF_YFLIP
	frame_oam -37,  25, $3e, 1 | OAMF_YFLIP
	frame_oam -63, -26, $3e, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -66,  -9, $3e, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -51,   0, $3e, 1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -61,  24, $3e, 1
	frame_oam -44,  14, $3e, 1
	db $80
; 0x1ff92b

Frameset_1ff92b:: ; 1ff92b (7f:792b)
	db $00,  3
	db $01,  3
	db $02,  4
	db $03,  3
	db $04,  3
	db $05,  4
	db $ff
; 0x1ff938

Frameset_1ff938:: ; 1ff938 (7f:7938)
	db $06,  3
	db $07,  3
	db $08,  4
	db $09,  3
	db $0a,  3
	db $0b,  4
	db $ff
; 0x1ff945

Frameset_1ff945:: ; 1ff945 (7f:7945)
	db $13,  3
	db $0c,  2
	db $0d,  2
	db $0e,  3
	db $0f,  3
	db $10,  2
	db $11,  2
	db $12,  3
	db $ff
; 0x1ff956

Frameset_1ff956:: ; 1ff956 (7f:7956)
	db $04,  3
	db $03,  3
	db $02,  4
	db $01,  3
	db $00,  3
	db $05,  4
	db $ff
; 0x1ff963

Frameset_1ff963:: ; 1ff963 (7f:7963)
	db $0a,  3
	db $09,  3
	db $08,  4
	db $07,  3
	db $06,  3
	db $0b,  4
	db $ff
; 0x1ff970

Frameset_1ff970:: ; 1ff970 (7f:7970)
	db $12,  3
	db $11,  2
	db $10,  2
	db $0f,  3
	db $0e,  3
	db $0d,  2
	db $0c,  2
	db $13,  3
	db $ff
; 0x1ff981

Frameset_1ff981:: ; 1ff981 (7f:7981)
	db $14,  4
	db $15,  4
	db $16,  4
	db $ff
; 0x1ff988

; unreferenced
Frameset_1ff988: ; 1ff988 (7f:7988)
	db $00,  3
	db $01,  3
	db $02,  4
	db $03,  3
	db $04,  3
	db $05,  4
	db $00,  3
	db $01,  3
	db $02,  4
	db $03,  3
	db $04,  3
	db $05,  4
	db $06,  3
	db $07,  3
	db $08,  4
	db $09,  3
	db $0a,  3
	db $0b,  4
	db $13,  3
	db $0c,  2
	db $0d,  2
	db $0e,  3
	db $0f,  3
	db $10,  2
	db $11,  2
	db $12,  3
	db $13,  3
	db $0c,  2
	db $0d,  2
	db $0e,  3
	db $0f,  3
	db $10,  2
	db $11,  2
	db $12,  3
	db $ff
; 0x1ff9cd

; unreferenced
Frameset_1ff9cd: ; 1ff9cd (7f:79cd)
	db $04,  3
	db $03,  3
	db $02,  4
	db $01,  3
	db $00,  3
	db $05,  4
	db $04,  3
	db $03,  3
	db $02,  4
	db $01,  3
	db $00,  3
	db $05,  4
	db $0a,  3
	db $09,  3
	db $08,  4
	db $07,  3
	db $06,  3
	db $0b,  4
	db $12,  3
	db $11,  2
	db $10,  2
	db $0f,  3
	db $0e,  3
	db $0d,  2
	db $0c,  2
	db $13,  3
	db $12,  3
	db $11,  2
	db $10,  2
	db $0f,  3
	db $0e,  3
	db $0d,  2
	db $0c,  2
	db $13,  3
	db $ff
; 0x1ffa12

OAM_1ffa12:: ; 1ffa12 (7f:7a12)
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
	frame_oam -33, -13, $40, 0
	frame_oam -33,  -5, $42, 0
	frame_oam -33,   3, $44, 0
	frame_oam -17,   4, $4a, 0
	frame_oam -17, -12, $4c, 0
	frame_oam -17,  -4, $4e, 0
	db $80

.frame_1
	frame_oam -34, -13, $40, 0
	frame_oam -34,  -5, $42, 0
	frame_oam -34,   3, $44, 0
	frame_oam -18, -12, $46, 0
	frame_oam -18,  -4, $48, 0
	frame_oam -18,   4, $4a, 0
	db $80

.frame_2
	frame_oam -32,  -4, $42, 0
	frame_oam -32,   4, $44, 0
	frame_oam -16,   4, $4a, 0
	frame_oam -32, -12, $50, 0
	frame_oam -16, -12, $52, 0
	frame_oam -16,  -4, $54, 0
	db $80

.frame_3
	frame_oam -32,  -3, $42, 0
	frame_oam -32,   5, $44, 0
	frame_oam -16,   5, $4a, 0
	frame_oam -32, -11, $50, 0
	frame_oam -16, -11, $52, 0
	frame_oam -16,  -3, $54, 0
	db $80

.frame_4
	frame_oam -32,   3, $44, 0
	frame_oam -32, -13, $56, 0
	frame_oam -32,  -5, $58, 0
	frame_oam -16, -13, $5a, 0
	frame_oam -16,  -5, $5c, 0
	frame_oam -16,   3, $5e, 0
	db $80

.frame_5
	frame_oam -32,   3, $44, 0
	frame_oam -16, -13, $5a, 0
	frame_oam -16,  -5, $5c, 0
	frame_oam -16,   3, $5e, 0
	frame_oam -32, -13, $60, 0
	frame_oam -32,  -5, $62, 0
	db $80

.frame_6
	frame_oam -16,  -5, $5c, 0
	frame_oam -16,   3, $5e, 0
	frame_oam -32, -13, $64, 0
	frame_oam -32,  -5, $66, 0
	frame_oam -32,   3, $68, 0
	frame_oam -16, -13, $6a, 0
	db $80

.frame_7
	frame_oam -16, -13, $6c, 0
	frame_oam -16,  -5, $6e, 0
	frame_oam -16,   3, $70, 0
	db $80

.frame_8
	frame_oam -16, -12, $78, 0
	frame_oam -16,  -4, $7a, 0
	frame_oam -16,   4, $78, 0 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -16, -12, $7c, 0
	frame_oam -16,  -4, $7e, 0
	frame_oam -16,   4, $7c, 0 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -17,  -8, $74, 0
	frame_oam -17,   0, $76, 0
	frame_oam  -9, -13, $72, 0
	frame_oam  -9,   5, $72, 0 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam  -8, -17, $72, 0
	frame_oam  -8,  -9, $72, 0 | OAMF_XFLIP
	frame_oam  -8,   0, $72, 0
	frame_oam  -8,   8, $72, 0 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam  -9, -17, $72, 0
	frame_oam  -9,  -9, $72, 0 | OAMF_XFLIP
	frame_oam  -9,   0, $72, 0
	frame_oam  -9,   8, $72, 0 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -33,   5, $40, 0 | OAMF_XFLIP
	frame_oam -33,  -3, $42, 0 | OAMF_XFLIP
	frame_oam -33, -11, $44, 0 | OAMF_XFLIP
	frame_oam -17, -12, $4a, 0 | OAMF_XFLIP
	frame_oam -17,   4, $4c, 0 | OAMF_XFLIP
	frame_oam -17,  -4, $4e, 0 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -34,   5, $40, 0 | OAMF_XFLIP
	frame_oam -34,  -3, $42, 0 | OAMF_XFLIP
	frame_oam -34, -11, $44, 0 | OAMF_XFLIP
	frame_oam -18,   4, $46, 0 | OAMF_XFLIP
	frame_oam -18,  -4, $48, 0 | OAMF_XFLIP
	frame_oam -18, -12, $4a, 0 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -32,  -4, $42, 0 | OAMF_XFLIP
	frame_oam -32, -12, $44, 0 | OAMF_XFLIP
	frame_oam -16, -12, $4a, 0 | OAMF_XFLIP
	frame_oam -32,   4, $50, 0 | OAMF_XFLIP
	frame_oam -16,   4, $52, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $54, 0 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -32,  -5, $42, 0 | OAMF_XFLIP
	frame_oam -32, -13, $44, 0 | OAMF_XFLIP
	frame_oam -16, -13, $4a, 0 | OAMF_XFLIP
	frame_oam -32,   3, $50, 0 | OAMF_XFLIP
	frame_oam -16,   3, $52, 0 | OAMF_XFLIP
	frame_oam -16,  -5, $54, 0 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam -32, -11, $44, 0 | OAMF_XFLIP
	frame_oam -32,   5, $56, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $58, 0 | OAMF_XFLIP
	frame_oam -16,   5, $5a, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $5c, 0 | OAMF_XFLIP
	frame_oam -16, -11, $5e, 0 | OAMF_XFLIP
	db $80

.frame_18
	frame_oam -32, -11, $44, 0 | OAMF_XFLIP
	frame_oam -16,   5, $5a, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $5c, 0 | OAMF_XFLIP
	frame_oam -16, -11, $5e, 0 | OAMF_XFLIP
	frame_oam -32,   5, $60, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $62, 0 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -16,  -3, $5c, 0 | OAMF_XFLIP
	frame_oam -16, -11, $5e, 0 | OAMF_XFLIP
	frame_oam -32,   5, $64, 0 | OAMF_XFLIP
	frame_oam -32,  -3, $66, 0 | OAMF_XFLIP
	frame_oam -32, -11, $68, 0 | OAMF_XFLIP
	frame_oam -16,   5, $6a, 0 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -16,   5, $6c, 0 | OAMF_XFLIP
	frame_oam -16,  -3, $6e, 0 | OAMF_XFLIP
	frame_oam -16, -11, $70, 0 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -16,   4, $78, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $7a, 0 | OAMF_XFLIP
	frame_oam -16, -12, $78, 0
	db $80

.frame_22
	frame_oam -16,   4, $7c, 0 | OAMF_XFLIP
	frame_oam -16,  -4, $7e, 0 | OAMF_XFLIP
	frame_oam -16, -12, $7c, 0
	db $80

.frame_23
	frame_oam -17,   0, $74, 0 | OAMF_XFLIP
	frame_oam -17,  -8, $76, 0 | OAMF_XFLIP
	frame_oam  -9,   5, $72, 0 | OAMF_XFLIP
	frame_oam  -9, -13, $72, 0
	db $80

.frame_24
	frame_oam  -8,   9, $72, 0 | OAMF_XFLIP
	frame_oam  -8,   1, $72, 0
	frame_oam  -8,  -8, $72, 0 | OAMF_XFLIP
	frame_oam  -8, -16, $72, 0
	db $80

.frame_25
	frame_oam  -9,   9, $72, 0 | OAMF_XFLIP
	frame_oam  -9,   1, $72, 0
	frame_oam  -9,  -8, $72, 0 | OAMF_XFLIP
	frame_oam  -9, -16, $72, 0
	db $80

.frame_26
	frame_oam -33, -13, $40, 1
	frame_oam -33,  -5, $42, 1
	frame_oam -33,   3, $44, 1
	frame_oam -17,   4, $4a, 1
	frame_oam -17, -12, $4c, 1
	frame_oam -17,  -4, $4e, 1
	db $80

.frame_27
	frame_oam -33,   5, $40, 1 | OAMF_XFLIP
	frame_oam -33,  -3, $42, 1 | OAMF_XFLIP
	frame_oam -33, -11, $44, 1 | OAMF_XFLIP
	frame_oam -17, -12, $4a, 1 | OAMF_XFLIP
	frame_oam -17,   4, $4c, 1 | OAMF_XFLIP
	frame_oam -17,  -4, $4e, 1 | OAMF_XFLIP
	db $80
; 0x1ffc8e

Frameset_1ffc8e:: ; 1ffc8e (7f:7c8e)
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

Frameset_1ffccf:: ; 1ffccf (7f:7ccf)
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

Frameset_1ffd10:: ; 1ffd10 (7f:7d10)
	db $1a,  2
	db $ff
; 0x1ffd13

Frameset_1ffd13:: ; 1ffd13 (7f:7d13)
	db $00,  4
	db $ff
; 0x1ffd16

Frameset_1ffd16:: ; 1ffd16 (7f:7d16)
	db $1b,  2
	db $ff
; 0x1ffd19

Frameset_1ffd19:: ; 1ffd19 (7f:7d19)
	db $0d,  4
	db $ff
; 0x1ffd1c
