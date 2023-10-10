OAM_1e697c:
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

.frame_0
	frame_oam -16,  -8, $cc, 6
	frame_oam -16,   0, $ce, 6
	db $80

.frame_1
	frame_oam -16,  -8, $d0, 6
	frame_oam -16,   0, $d2, 6
	db $80

.frame_2
	frame_oam -16,  -8, $d4, 6
	frame_oam -16,   0, $d6, 6
	db $80

.frame_3
	frame_oam -16,  -8, $a8, 7
	frame_oam -16,   0, $aa, 7
	frame_oam -16, -24, $a4, 7
	frame_oam -16, -16, $a6, 7
	db $80

.frame_4
	frame_oam -16,  -8, $ea, 7
	frame_oam -16,   0, $ec, 7
	frame_oam -16, -24, $a4, 7
	frame_oam -16, -16, $a6, 7
	db $80

.frame_5
	frame_oam -16, -24, $e6, 7
	frame_oam -16, -16, $e8, 7
	frame_oam -16,  -8, $a8, 7
	frame_oam -16,   0, $aa, 7
	db $80

.frame_6
	frame_oam -16,  -8, $e2, 7
	frame_oam -16,   0, $e0, 7
	frame_oam -24,  -8, $e4, 7
	frame_oam   0,  -8, $e4, 7 | OAMF_YFLIP
	frame_oam  -8, -16, $e0, 7 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_7
	frame_oam -16,  -8, $e2, 7
	frame_oam -16,   0, $e0, 7
	frame_oam  -8, -16, $e0, 7 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0,  -8, $e4, 7 | OAMF_YFLIP
	frame_oam -24,  -8, $f0, 7
	db $80

.frame_8
	frame_oam -16,  -8, $e2, 7
	frame_oam  -8, -16, $e0, 7 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   0,  -8, $e4, 7 | OAMF_YFLIP
	frame_oam -24,  -8, $e4, 7
	frame_oam -16,   0, $ee, 7
	db $80

.frame_9
	frame_oam -16,  -8, $e2, 7
	frame_oam -16,   0, $e0, 7
	frame_oam  -8, -16, $e0, 7 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -24,  -8, $e4, 7
	frame_oam   0,  -8, $f4, 7
	db $80

.frame_10
	frame_oam -16,  -8, $e2, 7
	frame_oam -16,   0, $e0, 7
	frame_oam   0,  -8, $e4, 7 | OAMF_YFLIP
	frame_oam -24,  -8, $e4, 7
	frame_oam  -8, -16, $f2, 7
	db $80

.frame_11
	frame_oam -16,  -8, $f6, 0
	frame_oam -16,   0, $f6, 0
	frame_oam -32,   0, $f6, 0
	frame_oam -32,  -8, $f6, 0
	db $80

.frame_12
	frame_oam -16,  -8, $f6, 0
	frame_oam -16,   0, $f6, 0
	frame_oam -32,  -8, $f6, 0
	frame_oam -32,   0, $f6, 0
	frame_oam -16,  16, $f6, 0
	frame_oam -32,  16, $f8, 0
	frame_oam -16,  32, $f8, 0
	frame_oam -32,   8, $fa, 0
	frame_oam -16,  24, $fa, 0
	frame_oam -16,   8, $f6, 0
	db $80

.frame_13
	frame_oam   0,  -8, $fc, 0
	frame_oam   0,   0, $fc, 0
	frame_oam   0, -16, $fc, 0
	frame_oam   0,   8, $fc, 0
	frame_oam  16,  -8, $fc, 0
	frame_oam  16,   0, $fc, 0
	frame_oam  16, -16, $fc, 0
	frame_oam  16,   8, $fc, 0
	db $80

.frame_14
	frame_oam -16,  -8, $a0, 7
	frame_oam -16,   0, $a0, 7 | OAMF_XFLIP
	db $80

.frame_15
	frame_oam -16,  -8, $a2, 4
	frame_oam -16,   0, $a2, 4 | OAMF_XFLIP
	db $80

.frame_16
	frame_oam -32,  -8, $cc, 6
	frame_oam -32,   0, $ce, 6
	frame_oam -16,  -8, $d0, 6
	frame_oam -16,   0, $d2, 6
	db $80

.frame_17
	frame_oam -16,  -8, $d0, 6
	frame_oam -16,   0, $d2, 6
	frame_oam -32,  -8, $d0, 6
	frame_oam -32,   0, $d2, 6
	db $80

.frame_18
	frame_oam -16,  -8, $d0, 6
	frame_oam -16,   0, $d2, 6
	frame_oam -32,  -8, $d0, 6
	frame_oam -32,   0, $d2, 6
	frame_oam -48,  -8, $d0, 6
	frame_oam -48,   0, $d2, 6
	db $80

.frame_19
	frame_oam -16,  -8, $cc, 6
	frame_oam -16,   0, $ce, 6
	frame_oam -32,  -8, $cc, 6
	frame_oam -32,   0, $ce, 6
	db $80

.frame_20
	frame_oam -16,  -8, $cc, 6
	frame_oam -16,   0, $ce, 6
	frame_oam -16, -24, $cc, 6
	frame_oam -16, -16, $ce, 6
	db $80

.frame_21
	frame_oam -16,  -8, $d0, 6
	frame_oam -16,   0, $d2, 6
	frame_oam -16, -24, $d0, 6
	frame_oam -16, -16, $d2, 6
	db $80

.frame_22
	frame_oam -16,  -8, $d0, 6
	frame_oam -16,   0, $d2, 6
	frame_oam -16, -24, $cc, 6
	frame_oam -16, -16, $ce, 6
	db $80

.frame_23
	frame_oam -16,  -8, $e2, 7
	frame_oam  -8, -16, $e0, 7 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -24,  -8, $e4, 7
	frame_oam   0,  -8, $f4, 7
	frame_oam -16,   0, $ee, 7
	db $80

Frameset_1e6b64:
	db $00,  4
	db $ff

Frameset_1e6b67:
	db $01,  4
	db $ff

Frameset_1e6b6a:
	db $02,  4
	db $ff

Frameset_1e6b6d:
	db $03,  4
	db $ff

Frameset_1e6b70:
	db $04,  4
	db $ff

Frameset_1e6b73:
	db $05,  4
	db $ff

Frameset_1e6b76:
	db $06,  4
	db $ff

Frameset_1e6b79:
	db $07,  4
	db $ff

Frameset_1e6b7c:
	db $08,  4
	db $ff

Frameset_1e6b7f:
	db $09,  4
	db $ff

Frameset_1e6b82:
	db $0a,  4
	db $ff

Frameset_1e6b85:
	db $0b,  4
	db $ff

Frameset_1e6b88:
	db $0c,  4
	db $ff

Frameset_1e6b8b:
	db $0d,  4
	db $ff

Frameset_1e6b8e:
	db $0e, 10
	db $0f, 10
	db $ff

Frameset_1e6b93:
	db $10,  4
	db $ff

Frameset_1e6b96:
	db $11,  4
	db $ff

Frameset_1e6b99:
	db $12,  4
	db $ff

Frameset_1e6b9c:
	db $13,  4
	db $ff

; unreferenced
; L shaped cracked blocks
Frameset_1e6b9f:
	db $14,  4
	db $ff

Frameset_1e6ba2:
	db $15,  4
	db $ff

Frameset_1e6ba5:
	db $16,  4
	db $ff

Frameset_1e6ba8:
	db $17,  4
	db $ff

OAM_1e6bab:
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
	frame_oam -16,  -8, $00, 5 | OAMF_BANK1
	frame_oam -16,   0, $02, 5 | OAMF_BANK1
	frame_oam -16, -13, $1c, 3 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,  -8, $04, 5 | OAMF_BANK1
	frame_oam -16,   0, $06, 5 | OAMF_BANK1
	frame_oam -15, -12, $1e, 3 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,  -8, $00, 5 | OAMF_BANK1
	frame_oam -16,   0, $02, 5 | OAMF_BANK1
	frame_oam -16, -13, $20, 3 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,  -8, $08, 5 | OAMF_BANK1
	frame_oam -16,   0, $0a, 5 | OAMF_BANK1
	frame_oam -17, -14, $22, 3 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -16,  -1, $14, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -13,   5, $3c, 3 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -8, $14, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_5
	frame_oam -15,  -7, $16, 5 | OAMF_BANK1
	frame_oam -15,   1, $18, 5 | OAMF_BANK1
	frame_oam   1,  -8, $36, 3 | OAMF_BANK1
	frame_oam   1,   0, $38, 5 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -13,  -8, $14, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -14, $3c, 3 | OAMF_BANK1
	frame_oam -13,  -1, $14, 5 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -14,  -2, $16, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -14, -10, $18, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -30,  -1, $36, 3 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -30,  -9, $38, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_8
	frame_oam -16,  -1, $0e, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  -8, $14, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -12,   5, $3c, 3 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_9
	frame_oam -16,  -8, $0e, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -16,  -1, $14, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -13,   5, $3c, 3 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_10
	frame_oam -32, -12, $40, 4 | OAMF_BANK1
	frame_oam -32,   4, $40, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -4, $42, 4 | OAMF_BANK1
	frame_oam -16, -12, $60, 4 | OAMF_BANK1
	frame_oam -16,  -4, $62, 4 | OAMF_BANK1
	frame_oam -16,   4, $60, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -32, -12, $44, 4 | OAMF_BANK1
	frame_oam -32,   4, $44, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -4, $46, 4 | OAMF_BANK1
	frame_oam -16, -12, $64, 4 | OAMF_BANK1
	frame_oam -16,  -4, $66, 4 | OAMF_BANK1
	frame_oam -16,   4, $64, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -32, -12, $4e, 4 | OAMF_BANK1
	frame_oam -32,  -4, $50, 4 | OAMF_BANK1
	frame_oam -32,   4, $4e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $6e, 4 | OAMF_BANK1
	frame_oam -16,  -4, $70, 4 | OAMF_BANK1
	frame_oam -16,   4, $6e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -32, -12, $52, 4 | OAMF_BANK1
	frame_oam -32,  -4, $54, 4 | OAMF_BANK1
	frame_oam -32,   4, $52, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $72, 4 | OAMF_BANK1
	frame_oam -16,  -4, $74, 4 | OAMF_BANK1
	frame_oam -16,   4, $72, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_14
	frame_oam -32, -12, $56, 4 | OAMF_BANK1
	frame_oam -32,  -4, $58, 4 | OAMF_BANK1
	frame_oam -32,   4, $5a, 4 | OAMF_BANK1
	frame_oam -16, -12, $76, 4 | OAMF_BANK1
	frame_oam -16,  -4, $78, 4 | OAMF_BANK1
	frame_oam -16,   4, $7a, 4 | OAMF_BANK1
	db $80

.frame_15
	frame_oam  -8, -12, $52, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -8,  -4, $54, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -8,   4, $52, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -24, -12, $72, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -24,  -4, $74, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -24,   4, $72, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_16
	frame_oam -32,   4, $56, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -4, $58, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -12, $5a, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $76, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $78, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $7a, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_17
	frame_oam  -8, -12, $40, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  -8,   4, $40, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -8,  -4, $54, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -24, -12, $60, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -24,  -4, $62, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -24,   4, $60, 4 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_18
	frame_oam -31,  -4, $42, 4 | OAMF_BANK1
	frame_oam -32, -12, $4e, 4 | OAMF_BANK1
	frame_oam -32,   4, $4e, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $6e, 4 | OAMF_BANK1
	frame_oam -16,  -4, $70, 4 | OAMF_BANK1
	frame_oam -16,   4, $6e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -16, -24, $80, 1 | OAMF_BANK1
	frame_oam -16, -16, $82, 1 | OAMF_BANK1
	frame_oam -16,   0, $80, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $82, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -24, $84, 1 | OAMF_BANK1
	frame_oam   0, -16, $86, 1 | OAMF_BANK1
	frame_oam   0,   0, $84, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -8, $86, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -16, -24, $80, 1 | OAMF_BANK1
	frame_oam -16,   0, $80, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -24, $84, 1 | OAMF_BANK1
	frame_oam   0, -16, $86, 1 | OAMF_BANK1
	frame_oam   0,   0, $84, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  -8, $86, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $90, 1 | OAMF_BANK1
	frame_oam -16,  -8, $90, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_21
	frame_oam -16, -16, $82, 1 | OAMF_BANK1
	frame_oam -16,  -8, $82, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 1 | OAMF_BANK1
	frame_oam   0,  -8, $86, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -24, $88, 1 | OAMF_BANK1
	frame_oam   0, -24, $8a, 1 | OAMF_BANK1
	frame_oam -16,   0, $8c, 1 | OAMF_BANK1
	frame_oam   0,   0, $8e, 1 | OAMF_BANK1
	db $80

.frame_22
	frame_oam   0, -16, $86, 1 | OAMF_BANK1
	frame_oam   0,  -8, $86, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $88, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   0, $8a, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -24, $8c, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -24, $8e, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $92, 1 | OAMF_BANK1
	frame_oam -16,  -8, $92, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -16, -24, $80, 1 | OAMF_BANK1
	frame_oam -16,   0, $80, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 1 | OAMF_BANK1
	frame_oam   0,  -8, $86, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -24, $84, 1 | OAMF_BANK1
	frame_oam   0,   0, $84, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $92, 1 | OAMF_BANK1
	frame_oam -16,  -8, $92, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -16, -24, $80, 1 | OAMF_BANK1
	frame_oam -16,   0, $80, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 1 | OAMF_BANK1
	frame_oam   0,  -8, $86, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -24, $84, 1 | OAMF_BANK1
	frame_oam   0,   0, $84, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $94, 1 | OAMF_BANK1
	frame_oam -16,  -8, $94, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam -16, -24, $80, 1 | OAMF_BANK1
	frame_oam -16,   0, $80, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 1 | OAMF_BANK1
	frame_oam   0,  -8, $86, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -24, $84, 1 | OAMF_BANK1
	frame_oam   0,   0, $84, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $96, 1 | OAMF_BANK1
	frame_oam -16,  -8, $96, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -16, -24, $80, 1 | OAMF_BANK1
	frame_oam -16,   0, $80, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 1 | OAMF_BANK1
	frame_oam   0,  -8, $86, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -24, $84, 1 | OAMF_BANK1
	frame_oam   0,   0, $84, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $96, 1 | OAMF_BANK1
	frame_oam -16,  -8, $96, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -26, $a0, 1 | OAMF_BANK1
	frame_oam -32,   3, $a0, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -16, -24, $80, 1 | OAMF_BANK1
	frame_oam -16,   0, $80, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 1 | OAMF_BANK1
	frame_oam   0,  -8, $86, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -24, $84, 1 | OAMF_BANK1
	frame_oam   0,   0, $84, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32, -26, $a2, 1 | OAMF_BANK1
	frame_oam -32,   3, $a2, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $a4, 1 | OAMF_BANK1
	frame_oam -16,  -8, $a4, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam -16, -24, $80, 1 | OAMF_BANK1
	frame_oam -16,   0, $80, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 1 | OAMF_BANK1
	frame_oam   0,  -8, $86, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -24, $84, 1 | OAMF_BANK1
	frame_oam   0,   0, $84, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $a4, 1 | OAMF_BANK1
	frame_oam -16,  -8, $a4, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_29
	frame_oam -16, -16, $82, 1 | OAMF_BANK1
	frame_oam -16,  -8, $82, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 1 | OAMF_BANK1
	frame_oam   0,  -8, $86, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -24, $88, 1 | OAMF_BANK1
	frame_oam -16,   0, $8c, 1 | OAMF_BANK1
	frame_oam   0, -24, $b2, 1 | OAMF_BANK1
	frame_oam   0,   0, $b8, 1 | OAMF_BANK1
	db $80

.frame_30
	frame_oam -16, -16, $82, 1 | OAMF_BANK1
	frame_oam -16,  -8, $82, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $86, 1 | OAMF_BANK1
	frame_oam   0,  -8, $86, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -24, $88, 1 | OAMF_BANK1
	frame_oam -16,   0, $8c, 1 | OAMF_BANK1
	frame_oam   0, -24, $b4, 1 | OAMF_BANK1
	frame_oam   0,   0, $b6, 1 | OAMF_BANK1
	db $80

.frame_31
	frame_oam   0, -16, $86, 1 | OAMF_BANK1
	frame_oam   0,  -8, $86, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $88, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -24, $8c, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $92, 1 | OAMF_BANK1
	frame_oam -16,  -8, $92, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   0, $b4, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -24, $b6, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_32
	frame_oam   0, -16, $86, 1 | OAMF_BANK1
	frame_oam   0,  -8, $86, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $88, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -24, $8c, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $92, 1 | OAMF_BANK1
	frame_oam -16,  -8, $92, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   0, $b2, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -24, $b8, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

Frameset_1e6f36:
	db $00,  8
	db $01, 12
	db $02,  8
	db $03, 12
	db $ff

Frameset_1e6f3f:
	db $04,  3
	db $05,  3
	db $06,  3
	db $07,  3
	db $ff

Frameset_1e6f48:
	db $08,  8
	db $09,  8
	db $ff

Frameset_1e6f4d:
	db $0a, 10
	db $0b, 10
	db $ff

; unreferenced
; Count Richtertoffen with eyes closed
Frameset_1e6f52:
	db $0c,  4
	db $ff

Frameset_1e6f55:
	db $0d, 12
	db $0e, 12
	db $0f, 12
	db $10, 12
	db $ff

Frameset_1e6f5e:
	db $11, 12
	db $0f, 12
	db $ff

; unreferenced
; Count Richtertoffen with eyes open
Frameset_1e6f63:
	db $12,  4
	db $ff

Frameset_1e6f66:
	db $14, 24
	db $13, 24
	db $ff

Frameset_1e6f6b:
	db $15,  8
	db $1d,  4
	db $1e,  4
	db $16,  8
	db $1f,  4
	db $20,  4
	db $ff

Frameset_1e6f78:
	db $17, 40
	db $18, 40
	db $ff

Frameset_1e6f7d:
	db $19,  6
	db $1a,  4
	db $1b,  4
	db $1c,  6
	db $ff

OAM_1e6f86:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3

.frame_0
	frame_oam -24,  -8, $80, 5 | OAMF_BANK1
	frame_oam -24,   0, $80, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -4, $8a, 5 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -24,  -8, $82, 5 | OAMF_BANK1
	frame_oam -24,   0, $84, 5 | OAMF_BANK1
	frame_oam  -8,  -4, $8a, 5 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -24,  -8, $86, 5 | OAMF_BANK1
	frame_oam -24,   0, $86, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -4, $8a, 5 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -24,   0, $82, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,  -8, $84, 5 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -4, $8a, 5 | OAMF_BANK1
	db $80

Frameset_1e6fc2:
	db $00,  3
	db $01,  3
	db $02,  4
	db $03,  3
	db $ff

Frameset_1e6fcb:
	db $00,  3
	db $03,  3
	db $02,  4
	db $01,  3
	db $ff
