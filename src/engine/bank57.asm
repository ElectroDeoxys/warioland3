OldMan2Gfx: INCBIN "gfx/cutscenes/old_man2.2bpp"
EpilogueStarGfx: INCBIN "gfx/epilogue_star.2bpp"
OldMan1Gfx: INCBIN "gfx/cutscenes/old_man1.2bpp"

EpilogueCrowdTilemap:          INCBIN "data/bgmaps/epilogue_crowd.tilemap"
EpilogueCrowdAttrmap:          INCBIN "data/bgmaps/epilogue_crowd.attrmap"
EpilogueGfx:                   INCBIN "gfx/epilogue.2bpp.rle"
EpilogueTransformationTilemap: INCBIN "data/bgmaps/epilogue_transformation.tilemap.rle"
EpilogueTransformationAttrmap: INCBIN "data/bgmaps/epilogue_transformation.attrmap.rle"

TextJP_OldManThankYou: INCBIN "text/text_15e06b.tilemap.rle"
Text_15e212: INCBIN "text/text_15e212.tilemap" ; unreferenced
TextEN_OldManThankYou: INCBIN "text/en/old_man_thank_you.tilemap.rle"
Text_15e437: INCBIN "text/text_15e437.tilemap" ; unreferenced

OAM_15e44a::
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
	frame_oam -16,  -8, $00, 0 | OAMF_BANK1
	frame_oam -16,   0, $02, 0 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -16,  -8, $04, 0 | OAMF_BANK1
	frame_oam -16,   0, $06, 0 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,  -8, $08, 0 | OAMF_BANK1
	frame_oam -16,   0, $0a, 0 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,  -4, $0c, 2 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -16,  -8, $12, 1 | OAMF_BANK1
	frame_oam -15,   0, $12, 1 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_5
	frame_oam -16,  -8, $14, 1 | OAMF_BANK1
	frame_oam -15,   0, $14, 1 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_6
	frame_oam -17,  -8, $16, 1 | OAMF_BANK1
	frame_oam -14,   0, $16, 1 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_7
	frame_oam -12,  -8, $10, 0 | OAMF_BANK1
	frame_oam -20,   0, $10, 0 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_8
	frame_oam -16,  -4, $0e, 0 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -16,  -4, $0e, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -12,   0, $10, 0 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,  -8, $10, 0 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_11
	frame_oam -16,  -8, $18, 2 | OAMF_BANK1
	frame_oam -16,   0, $1a, 2 | OAMF_BANK1
	db $80

.frame_12
	frame_oam -16,  -8, $1c, 2 | OAMF_BANK1
	frame_oam -16,   0, $1e, 2 | OAMF_BANK1
	db $80

.frame_13
	frame_oam -16,  -6, $20, 0 | OAMF_BANK1
	frame_oam -16,   2, $22, 0 | OAMF_BANK1
	db $80

.frame_14
	frame_oam -16,  -4, $24, 2 | OAMF_BANK1
	db $80

.frame_15
	frame_oam -16,  -4, $26, 2 | OAMF_BANK1
	db $80

.frame_16
	frame_oam -16,  -4, $28, 2 | OAMF_BANK1
	db $80

.frame_17
	frame_oam -13,  -4, $2a, 0 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_18
	frame_oam -16,  -8, $2a, 0 | OAMF_BANK1
	frame_oam -16,   0, $2c, 0 | OAMF_BANK1
	db $80

.frame_19
	frame_oam -12,  -8, $2e, 0 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -28,  -4, $2c, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -36,  -4, $2e, 0 | OAMF_BANK1
	db $80

.frame_21
	frame_oam -16,  -4, $30, 0 | OAMF_BANK1
	db $80

.frame_22
	frame_oam -18,  -4, $30, 0 | OAMF_BANK1
	db $80

.frame_23
	frame_oam -19,  -8, $34, 0 | OAMF_BANK1
	frame_oam -19,   0, $34, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_24
	frame_oam -19,  -8, $32, 0 | OAMF_BANK1
	frame_oam -19,   0, $32, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_25
	frame_oam  -8,  -8, $3a, 3 | OAMF_BANK1
	frame_oam -10,   0, $3c, 2 | OAMF_BANK1
	frame_oam -15,   8, $3e, 2 | OAMF_BANK1
	frame_oam -24,  -8, $40, 4 | OAMF_BANK1
	frame_oam -26,   0, $42, 4 | OAMF_BANK1
	db $80

.frame_26
	frame_oam -24,  -8, $36, 2 | OAMF_BANK1
	frame_oam -24,   0, $36, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -8, $3a, 3 | OAMF_BANK1
	frame_oam -10,   0, $3c, 2 | OAMF_BANK1
	frame_oam -15,   8, $3e, 2 | OAMF_BANK1
	db $80

.frame_27
	frame_oam -24,  -8, $38, 3 | OAMF_BANK1
	frame_oam -24,   0, $38, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -8, $3a, 3 | OAMF_BANK1
	frame_oam -10,   0, $3c, 2 | OAMF_BANK1
	frame_oam -15,   8, $3e, 2 | OAMF_BANK1
	db $80

.frame_28
	frame_oam -24,  -8, $44, 4 | OAMF_BANK1
	frame_oam -24,   0, $44, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -8, $3a, 5 | OAMF_BANK1
	frame_oam -10,   0, $3c, 5 | OAMF_BANK1
	frame_oam -15,   8, $3e, 5 | OAMF_BANK1
	db $80

.frame_29
	frame_oam  -8,  -8, $3a, 3 | OAMF_BANK1
	frame_oam -10,   0, $3c, 2 | OAMF_BANK1
	frame_oam -24,  -8, $40, 4 | OAMF_BANK1
	frame_oam -26,   0, $42, 4 | OAMF_BANK1
	frame_oam -15,   8, $3e, 2 | OAMF_BANK1
	db $80

.frame_30
	frame_oam -24,  -8, $44, 4 | OAMF_BANK1
	frame_oam -24,   0, $44, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -8, $3a, 5 | OAMF_BANK1
	frame_oam -10,   0, $3c, 5 | OAMF_BANK1
	frame_oam -15,   8, $3e, 5 | OAMF_BANK1
	db $80

.frame_31
	frame_oam -24,  -8, $36, 2 | OAMF_BANK1
	frame_oam -24,   0, $36, 2 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -8, $3a, 3 | OAMF_BANK1
	frame_oam -10,   0, $3c, 2 | OAMF_BANK1
	frame_oam -15,   8, $3e, 2 | OAMF_BANK1
	db $80

.frame_32
	frame_oam -24,  -8, $38, 3 | OAMF_BANK1
	frame_oam -24,   0, $38, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam  -8,  -8, $3a, 3 | OAMF_BANK1
	frame_oam -10,   0, $3c, 2 | OAMF_BANK1
	frame_oam -15,   8, $3e, 2 | OAMF_BANK1
	db $80

.frame_33
	frame_oam -28, -13, $4a, 3 | OAMF_BANK1
	frame_oam   0, -16, $4e, 3 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_34
	frame_oam -28, -13, $4c, 4 | OAMF_BANK1
	frame_oam   0, -16, $50, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_35
	frame_oam -28, -13, $4e, 3 | OAMF_BANK1
	frame_oam -16,   4, $4a, 3 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_36
	frame_oam -28, -13, $50, 4 | OAMF_BANK1
	frame_oam -16,   4, $4c, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_37
	frame_oam -16,   4, $4e, 3 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0, -16, $4a, 3 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_38
	frame_oam -16,   4, $50, 4 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0, -16, $4c, 4 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_39
	frame_oam  -8,  -4, $60, 1 | OAMF_BANK1
	db $80

.frame_40
	frame_oam  -8, -12, $68, 1 | OAMF_BANK1
	frame_oam  -8,   4, $68, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -4, $6a, 1 | OAMF_BANK1
	frame_oam   0,  -4, $6a, 1 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_41
	frame_oam  -8,  -4, $62, 1 | OAMF_BANK1
	db $80

.frame_42
	frame_oam -16, -12, $6c, 1 | OAMF_BANK1
	frame_oam -16,  -4, $6e, 1 | OAMF_BANK1
	frame_oam -16, -12, $6c, 1 | OAMF_BANK1
	frame_oam -16,  -4, $6e, 1 | OAMF_BANK1
	frame_oam   0, -12, $6c, 1 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,  -4, $6e, 1 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   4, $6c, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   4, $6c, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   4, $6c, 1 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_43
	frame_oam  -8,  -8, $64, 1 | OAMF_BANK1
	frame_oam  -8,   0, $64, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_44
	frame_oam -16, -12, $70, 1 | OAMF_BANK1
	frame_oam -16,  -4, $72, 1 | OAMF_BANK1
	frame_oam   0, -12, $70, 1 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,  -4, $72, 1 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   4, $70, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,   4, $70, 1 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_45
	frame_oam  -8,  -8, $66, 1 | OAMF_BANK1
	frame_oam  -8,   0, $66, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_46
	frame_oam -16, -16, $74, 1 | OAMF_BANK1
	frame_oam -24,  -8, $76, 1 | OAMF_BANK1
	frame_oam -16,   8, $74, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -24,   0, $76, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0, -16, $74, 1 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   8,  -8, $76, 1 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,   8, $74, 1 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   8,   0, $76, 1 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_47
	frame_oam -16, -24, $78, 1 | OAMF_BANK1
	frame_oam -21, -16, $7a, 1 | OAMF_BANK1
	frame_oam -30,  -8, $7c, 1 | OAMF_BANK1
	frame_oam   0, -24, $78, 1 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   5, -16, $7a, 1 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam  14,  -8, $7c, 1 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,  16, $78, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -21,   8, $7a, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30,   0, $7c, 1 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   0,  16, $78, 1 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   5,   8, $7a, 1 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  14,   0, $7c, 1 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_48
	frame_oam -16,  -4, $7e, 0 | OAMF_BANK1
	db $80

.frame_49
	frame_oam  -8,  -8, $52, 3 | OAMF_BANK1
	frame_oam  -8,   8, $54, 3 | OAMF_BANK1
	frame_oam -16,  16, $56, 3 | OAMF_BANK1
	frame_oam -16, -24, $56, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -27, -16, $58, 6 | OAMF_BANK1
	frame_oam -32, -24, $5a, 6 | OAMF_BANK1
	frame_oam -27,  12, $5c, 7 | OAMF_BANK1
	db $80

.frame_50
	frame_oam  -8,  -8, $46, 1 | OAMF_BANK1
	frame_oam  -8,   0, $46, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_51
	frame_oam  -8,  -4, $60, 5 | OAMF_BANK1
	db $80

.frame_52
	frame_oam  -8,  -8, $64, 5 | OAMF_BANK1
	frame_oam  -8,   0, $64, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

Frameset_15e741:
	db   2,  3
	db   1,  3
	db   0,  3
	db $ff

Frameset_15e748:
	db   3,  4
	db $ff

Frameset_15e74b:
	db   4,  5
	db   5,  5
	db   6,  5
	db   5,  5
	db   4,  5
	db   5,  5
	db   6,  5
	db   5,  5
	db   4,  2
	db   5,  2
	db   6,  2
	db   5,  2
	db   4,  2
	db   5,  2
	db   6,  2
	db   5,  2
	db   4,  2
	db   5,  2
	db   6,  2
	db   5,  2
	db $ff

Frameset_15e774:
	db   7,  3
	db   8,  3
	db   9,  3
	db  10,  3
	db $ff

Frameset_15e77d:
	db  11,  4
	db $ff

Frameset_15e780:
	db  12,  4
	db $ff

Frameset_15e783:
	db  14,  3
	db  15,  3
	db  16,  3
	db $ff

Frameset_15e78a:
	db  17,  9
	db  18,  8
	db  19,  7
	db  20,  7
	db $ff

Frameset_15e793:
	db  13,  4
	db $ff

Frameset_15e796:
	db  21,  2
	db  22,  2
	db  23,  6
	db  24,  3
	db  23,  6
	db  24,  3
	db $ff

Frameset_15e7a3:
	db  25,  4
	db $ff

Frameset_15e7a6:
	db  25,  1
	db  28,  2
	db  26,  2
	db  27,  2
	db  29,  1
	db  30,  2
	db  31,  2
	db  32,  2
	db $ff

Frameset_15e7b7:
	db  33,  4
	db  34,  4
	db  35,  4
	db  36,  4
	db  37,  4
	db  38,  4
	db $ff

Frameset_15e7c4:
	db  39,  2
	db  40,  1
	db  41,  2
	db  42,  1
	db  43,  2
	db  44,  1
	db  45,  2
	db  46,  1
	db  41,  2
	db  47,  1
	db  39,  2
	db  48,  1
	db  41,  2
	db  46,  1
	db  43,  2
	db  44,  1
	db  45,  1
	db  42,  1
	db  41,  2
	db  40,  1
	db $ff

Frameset_15e7ed::
	db  49,  4
	db $ff

Frameset_15e7f0:
	db   2,  2
	db  48,  2
	db $ff

Frameset_15e7f5:
	db  12,  2
	db  48,  2
	db $ff

Frameset_15e7fa:
	db  44,  2
	db  40,  1
	db  50,  2
	db $ff

Frameset_15e801:
	db  52,  2
	db  50,  1
	db  41,  2
	db  50,  1
	db $ff

Frameset_15e80a:
	db  41,  2
	db  45,  1
	db  51,  2
	db  45,  1
	db $ff

OAM_15e813:
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
	frame_oam -16,  -8, $00, 0 | OAMF_BANK1
	frame_oam -16,   0, $00, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -16,  -8, $02, 0 | OAMF_BANK1
	frame_oam -16,   0, $04, 0 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,  -8, $36, 0 | OAMF_BANK1
	frame_oam -16,   0, $38, 0 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -16,  -4, $3a, 0 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -16,  -4, $06, 0 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16,  -8, $10, 4 | OAMF_BANK1
	frame_oam -16,   0, $12, 4 | OAMF_BANK1
	frame_oam  -9,  -4, $24, 0 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16,  -8, $14, 7 | OAMF_BANK1
	frame_oam -16,   0, $16, 7 | OAMF_BANK1
	frame_oam -16,  -3, $26, 0 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16,  -8, $18, 6 | OAMF_BANK1
	frame_oam -16,   0, $1a, 6 | OAMF_BANK1
	frame_oam -16,  -4, $28, 0 | OAMF_BANK1
	db $80

.frame_8
	frame_oam -16,  -8, $1c, 5 | OAMF_BANK1
	frame_oam -16,   0, $1e, 5 | OAMF_BANK1
	frame_oam -16,  -4, $2a, 0 | OAMF_BANK1
	db $80

.frame_9
	frame_oam -16,  -8, $20, 4 | OAMF_BANK1
	frame_oam -16,   0, $22, 4 | OAMF_BANK1
	frame_oam -20,   0, $2c, 0 | OAMF_BANK1
	db $80

Frameset_15e88d:
	db   0,  4
	db $ff

Frameset_15e890:
	db   1,  4
	db $ff

Frameset_15e893:
	db   2,  4
	db $ff

Frameset_15e896:
	db   3,  4
	db $ff

Frameset_15e899:
	db   4,  4
	db $ff

Frameset_15e89c:
	db   5,  4
	db $ff

Frameset_15e89f:
	db   6,  4
	db $ff

Frameset_15e8a2:
	db   7,  4
	db $ff

Frameset_15e8a5:
	db   8,  4
	db $ff

Frameset_15e8a8:
	db   9,  4
	db $ff

Frameset_15e8ab:
	db   0, 20
	db   1, 20
	db $ff

Frameset_15e8b0:
	db   0, 10
	db   2,  4
	db   3, 10
	db   4,  4
	db $ff

; unreferenced
Frameset_15e8b9:
	db   5, 20
	db   6, 20
	db $ff

; unreferenced
Frameset_15e8be:
	db   7, 20
	db   8, 20
	db $ff

; unreferenced
Frameset_15e8c3:
	db   9,  4
	db  10,  4
	db   9,  4
	db  11,  4
	db $ff

; unreferenced
Frameset_15e8cc:
	db  12, 15
	db  13, 15
	db $ff

; unreferenced
Frameset_15e8d1:
	db  14, 15
	db  15, 15
	db $ff

; unreferenced
Frameset_15e8d6:
	db  16, 15
	db  17, 15
	db $ff

; unreferenced
Frameset_15e8db:
	db  21,  7
	db  22,  7
	db  23,  7
	db  24,  7
	db  25,  7
	db $ff

; unreferenced
Frameset_15e8e6:
	db  36,  7
	db  37,  7
	db  38,  7
	db  39,  7
	db  40,  7
	db $ff

; unreferenced
Frameset_15e8f1:
	db  52,  4
	db  32,  4
	db $ff

; unreferenced
Frameset_15e8f6:
	db  53,  4
	db  47,  4
	db $ff

; unreferenced
Frameset_15e8fb:
	db  18, 10
	db  28,  6
	db  27, 10
	db $ff

; unreferenced
Frameset_15e902:
	db  27, 10
	db  28,  6
	db  18, 10
	db $ff

; unreferenced
Frameset_15e909:
	db  33, 10
	db  43,  6
	db  42, 10
	db $ff

; unreferenced
Frameset_15e910:
	db  42, 10
	db  43,  6
	db  33, 10
	db $ff

; unreferenced
Frameset_15e917:
	db  18,  4
	db $ff

; unreferenced
Frameset_15e91a:
	db  19,  4
	db $ff

; unreferenced
Frameset_15e91d:
	db  20,  4
	db $ff

; unreferenced
Frameset_15e920:
	db  21,  4
	db $ff

; unreferenced
Frameset_15e923:
	db  22,  4
	db $ff

; unreferenced
Frameset_15e926:
	db  23,  4
	db $ff

; unreferenced
Frameset_15e929:
	db  24,  4
	db $ff

; unreferenced
Frameset_15e92c:
	db  25,  4
	db $ff

; unreferenced
Frameset_15e92f:
	db  26,  4
	db $ff

Frameset_15e932:
	db  27,  4
	db $ff

; unreferenced
Frameset_15e935:
	db  28,  4
	db $ff

; unreferenced
Frameset_15e938:
	db  29,  4
	db $ff

; unreferenced
Frameset_15e93b:
	db  30,  4
	db $ff

; unreferenced
Frameset_15e93e:
	db  31,  4
	db $ff

; unreferenced
Frameset_15e941:
	db  33,  4
	db $ff

; unreferenced
Frameset_15e944:
	db  34,  4
	db $ff

; unreferenced
Frameset_15e947:
	db  35,  4
	db $ff

; unreferenced
Frameset_15e94a:
	db  36,  4
	db $ff

; unreferenced
Frameset_15e94d:
	db  37,  4
	db $ff

; unreferenced
Frameset_15e950:
	db  38,  4
	db $ff

; unreferenced
Frameset_15e953:
	db  39,  4
	db $ff

; unreferenced
Frameset_15e956:
	db  40,  4
	db $ff

; unreferenced
Frameset_15e959:
	db  41,  4
	db $ff

Frameset_15e95c:
	db  42,  4
	db $ff

; unreferenced
Frameset_15e95f:
	db  43,  4
	db $ff

; unreferenced
Frameset_15e962:
	db  44,  4
	db $ff

; unreferenced
Frameset_15e965:
	db  45,  4
	db $ff

; unreferenced
Frameset_15e968:
	db  46,  4
	db $ff

; unreferenced
Frameset_15e96b:
	db  18, 10
	db  48,  6
	db  49, 10
	db  48,  6
	db $ff

; unreferenced
Frameset_15e974:
	db  51, 10
	db  50,  6
	db  33, 10
	db  50,  6
	db $ff

OAM_15e97d:
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

.frame_0
	frame_oam -40, -12, $80, 1
	frame_oam -40,  -4, $82, 1
	frame_oam -32,   4, $84, 1
	frame_oam -24, -12, $86, 2
	frame_oam -24,  -4, $88, 2
	frame_oam -11,  -5, $90, 5
	frame_oam -11,   3, $92, 5
	frame_oam  -8, -12, $8c, 2
	frame_oam  -8,  -4, $8e, 2
	frame_oam -16,   4, $8a, 2
	db $80

.frame_1
	frame_oam -16,  -9, $b8, 7
	frame_oam -16,  -1, $ba, 7
	frame_oam -32,  -7, $94, 4
	frame_oam -32,   1, $96, 4
	frame_oam -16, -10, $98, 4
	frame_oam -16,  -2, $9a, 4
	frame_oam -16,   6, $9c, 4
	db $80

.frame_2
	frame_oam -40,  -8, $a6, 0
	frame_oam -40,   0, $a8, 0
	frame_oam -24, -12, $aa, 0
	frame_oam -24,  -4, $ac, 0
	frame_oam -24,   4, $ae, 0
	frame_oam -24,  12, $b0, 1
	frame_oam  -8, -12, $b2, 5
	frame_oam  -8,  -4, $b4, 5
	frame_oam  -8,   4, $b6, 5
	db $80

.frame_3
	frame_oam -32, -11, $b4, 0
	frame_oam -32,  -3, $b6, 0
	frame_oam -32,   5, $b8, 0
	frame_oam -16, -11, $ba, 6
	frame_oam -16,  -3, $80, 6
	frame_oam -16,   5, $82, 6
	db $80

.frame_4
	frame_oam -32,   3, $b4, 0 | OAMF_XFLIP
	frame_oam -32,  -5, $b6, 0 | OAMF_XFLIP
	frame_oam -32, -13, $b8, 0 | OAMF_XFLIP
	frame_oam -16,   3, $ba, 6 | OAMF_XFLIP
	frame_oam -16,  -5, $80, 6 | OAMF_XFLIP
	frame_oam -16, -13, $82, 6 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -32,  -8, $8c, 0
	frame_oam -32,   0, $8e, 0
	frame_oam -16, -13, $90, 6
	frame_oam -16,  -5, $92, 6
	frame_oam -16,   3, $94, 6
	db $80

.frame_6
	frame_oam -32,  -7, $84, 0
	frame_oam -32,   1, $86, 0
	frame_oam -16,  -9, $88, 6
	frame_oam -16,  -1, $8a, 6
	db $80

.frame_7
	frame_oam -32,  -7, $84, 0
	frame_oam -32,   1, $86, 0
	frame_oam -16,  -9, $96, 6
	frame_oam -16,  -1, $98, 6
	db $80

.frame_8
	frame_oam -16,  -8, $9a, 6
	frame_oam -16,   0, $9c, 6
	frame_oam -32,  -7, $84, 0
	frame_oam -32,   1, $86, 0
	db $80

.frame_9
	frame_oam -33,  -7, $84, 0
	frame_oam -33,   1, $86, 0
	frame_oam -17,  -1, $a0, 6
	frame_oam -17,   7, $a2, 6
	frame_oam -17,  -9, $9e, 6
	db $80

.frame_10
	frame_oam -32,  -7, $84, 0
	frame_oam -32,   1, $86, 0
	frame_oam -16,  -9, $a4, 6
	frame_oam -16,  -1, $a6, 6
	db $80

.frame_11
	frame_oam -32,  -7, $84, 0
	frame_oam -32,   1, $86, 0
	frame_oam -16,  -9, $a8, 6
	frame_oam -16,  -1, $aa, 6
	db $80

.frame_12
	frame_oam -33,  -7, $84, 0
	frame_oam -33,   1, $86, 0
	frame_oam -17,  -8, $ac, 6
	frame_oam -17,   0, $ae, 6
	db $80

.frame_13
	frame_oam -32,  -7, $84, 0
	frame_oam -32,   1, $86, 0
	frame_oam -16,  -9, $b0, 6
	frame_oam -16,  -1, $b2, 6
	db $80

.frame_14
	frame_oam -32, -13, $b8, 0 | OAMF_XFLIP
	frame_oam -32,  -5, $bc, 0
	frame_oam -32,   3, $b4, 0 | OAMF_XFLIP
	frame_oam -16, -13, $82, 6 | OAMF_XFLIP
	frame_oam -16,  -5, $be, 6
	frame_oam -16,   3, $c0, 6
	db $80

.frame_15
	frame_oam -32, -13, $b8, 0 | OAMF_XFLIP
	frame_oam -32,  -5, $c2, 0
	frame_oam -32,   3, $c4, 0
	frame_oam -16, -13, $82, 6 | OAMF_XFLIP
	frame_oam -16,  -5, $be, 6
	frame_oam -16,   3, $c0, 6
	db $80

.frame_16
	frame_oam -32, -13, $b8, 0 | OAMF_XFLIP
	frame_oam -32,  -5, $bc, 0
	frame_oam -32,   3, $b4, 0 | OAMF_XFLIP
	frame_oam -16, -13, $c6, 6
	frame_oam -16,  -5, $c8, 6
	frame_oam -16,   3, $ca, 6
	db $80

.frame_17
	frame_oam -32, -13, $b8, 0 | OAMF_XFLIP
	frame_oam -32,  -5, $c2, 0
	frame_oam -32,   3, $c4, 0
	frame_oam -16, -16, $cc, 6
	frame_oam -16,  -8, $ce, 6
	frame_oam -16,   0, $d0, 6
	frame_oam -16,   8, $d2, 6
	db $80

.frame_18
	frame_oam -16, -13, $d4, 6
	frame_oam -16,  -5, $d6, 6
	frame_oam -16,   3, $d8, 6
	frame_oam -18,   6, $da, 6
	frame_oam -32,  -5, $b6, 0 | OAMF_XFLIP
	frame_oam -32, -13, $b8, 0 | OAMF_XFLIP
	frame_oam -32,   3, $b4, 0 | OAMF_XFLIP
	db $80

.frame_19
	frame_oam -16, -13, $d4, 6
	frame_oam -16,  -5, $d6, 6
	frame_oam -16,   3, $d8, 6
	frame_oam -17,   6, $da, 6
	frame_oam -32,  -5, $b6, 0 | OAMF_XFLIP
	frame_oam -32, -13, $b8, 0 | OAMF_XFLIP
	frame_oam -32,   3, $b4, 0 | OAMF_XFLIP
	db $80

.frame_20
	frame_oam -32, -13, $b8, 0 | OAMF_XFLIP
	frame_oam -32,  -5, $c2, 0
	frame_oam -32,   3, $c4, 0
	frame_oam -16, -12, $de, 6
	frame_oam -16,  -4, $e0, 6
	frame_oam -16,   4, $e2, 6
	db $80

.frame_21
	frame_oam -32, -13, $b8, 0 | OAMF_XFLIP
	frame_oam -32,  -5, $c2, 0
	frame_oam -32,   3, $c4, 0
	frame_oam -16,   0, $d0, 6
	frame_oam -16,   8, $d2, 6
	frame_oam -16, -13, $c6, 6
	frame_oam -16,  -5, $c8, 6
	db $80

.frame_22
	frame_oam -32,   0, $8c, 0 | OAMF_XFLIP
	frame_oam -32,  -8, $8e, 0 | OAMF_XFLIP
	frame_oam -16,   5, $90, 6 | OAMF_XFLIP
	frame_oam -16,  -3, $92, 6 | OAMF_XFLIP
	frame_oam -16, -11, $94, 6 | OAMF_XFLIP
	db $80

.frame_23
	frame_oam -32, -13, $b8, 0 | OAMF_XFLIP
	frame_oam -32,   3, $c4, 0
	frame_oam -16,  -4, $e0, 6
	frame_oam -32,  -5, $e4, 0
	frame_oam -16, -12, $e6, 6
	frame_oam -16,   4, $e8, 6
	db $80

.frame_24
	frame_oam -25, -16, $ea, 6
	frame_oam -32,  -8, $ec, 0
	frame_oam -32,   0, $ee, 0
	frame_oam  -9, -16, $f0, 6
	frame_oam -16,  -8, $f2, 6
	frame_oam -16,   0, $f4, 6
	frame_oam -24,   8, $f6, 6
	db $80

.frame_25
	frame_oam -32, -15, $f8, 6
	frame_oam -32,  -7, $fa, 0
	frame_oam -32,   1, $fc, 0
	frame_oam -24,   8, $fe, 6
	frame_oam -16, -16, $00, 6 | OAMF_BANK1
	frame_oam -16,  -8, $02, 6 | OAMF_BANK1
	frame_oam -16,   0, $04, 6 | OAMF_BANK1
	db $80

.frame_26
	frame_oam -32, -15, $f8, 1
	frame_oam -32,  -7, $fa, 1
	frame_oam -32,   1, $fc, 1
	frame_oam -24,   8, $fe, 1
	frame_oam -16, -16, $00, 1 | OAMF_BANK1
	frame_oam -16,  -8, $02, 1 | OAMF_BANK1
	frame_oam -16,   0, $04, 1 | OAMF_BANK1
	db $80

.frame_27
	frame_oam -32,  -7, $06, 0 | OAMF_BANK1
	frame_oam -40,   1, $08, 0 | OAMF_BANK1
	frame_oam -40,   9, $0a, 0 | OAMF_BANK1
	frame_oam -24,   1, $0c, 0 | OAMF_BANK1
	frame_oam -24,   9, $0e, 0 | OAMF_BANK1
	frame_oam -16,  -7, $10, 6 | OAMF_BANK1
	frame_oam  -8,   1, $12, 6 | OAMF_BANK1
	db $80

.frame_28
	frame_oam -24,   0, $16, 0 | OAMF_BANK1
	frame_oam -24,   8, $18, 0 | OAMF_BANK1
	frame_oam -40,   7, $14, 0 | OAMF_BANK1
	frame_oam -16,  -8, $1a, 6 | OAMF_BANK1
	frame_oam  -8,   0, $1c, 6 | OAMF_BANK1
	db $80

.frame_29
	frame_oam -16,  -8, $66, 1 | OAMF_BANK1
	frame_oam -16,   0, $66, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_30
	frame_oam -16,  -8, $64, 1 | OAMF_BANK1
	frame_oam -16,   0, $64, 1 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_31
	frame_oam -20,  -4, $1e, 1 | OAMF_BANK1
	db $80

.frame_32
	frame_oam -16,  -4, $60, 1 | OAMF_BANK1
	db $80

.frame_33
	frame_oam -16,  -8, $66, 7 | OAMF_BANK1
	frame_oam -16,   0, $66, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_34
	frame_oam -16,  -8, $64, 7 | OAMF_BANK1
	frame_oam -16,   0, $64, 7 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_35
	frame_oam -20,  -4, $1e, 7 | OAMF_BANK1
	db $80

.frame_36
	frame_oam -16,  -4, $60, 7 | OAMF_BANK1
	db $80

.frame_37
	frame_oam -16,  -8, $66, 5 | OAMF_BANK1
	frame_oam -16,   0, $66, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_38
	frame_oam -16,  -8, $64, 5 | OAMF_BANK1
	frame_oam -16,   0, $64, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_39
	frame_oam -20,  -4, $1e, 5 | OAMF_BANK1
	db $80

.frame_40
	frame_oam -16,  -4, $60, 5 | OAMF_BANK1
	db $80

.frame_41
	frame_oam -24, -12, $20, 4 | OAMF_BANK1
	frame_oam -24,  -4, $22, 4 | OAMF_BANK1
	frame_oam -24,   4, $24, 3 | OAMF_BANK1
	frame_oam  -8, -12, $26, 4 | OAMF_BANK1
	frame_oam  -8,  -4, $28, 4 | OAMF_BANK1
	frame_oam  -8,   4, $2a, 5 | OAMF_BANK1
	db $80

.frame_42
	frame_oam -16,  -4, $c0, 5 | OAMF_BANK1
	db $80

.frame_43
	frame_oam -17,  -4, $c2, 3 | OAMF_BANK1
	db $80

.frame_44
	frame_oam  -8,  -4, $c0, 5 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_45
	frame_oam -17,  -5, $c2, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_46
	frame_oam -16,  -8, $c4, 5 | OAMF_BANK1
	frame_oam -16,   0, $c4, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_47
	frame_oam -16,  -8, $c6, 3 | OAMF_BANK1
	frame_oam -16,   0, $c8, 3 | OAMF_BANK1
	db $80

.frame_48
	frame_oam -16,  -8, $c4, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   0, $c4, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_49
	frame_oam -16,   0, $c6, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $c8, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_50
	frame_oam -16,  -8, $ca, 5 | OAMF_BANK1
	frame_oam -16,   0, $ca, 5 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_51
	frame_oam -16,  -8, $cc, 3 | OAMF_BANK1
	frame_oam -16,   0, $ce, 3 | OAMF_BANK1
	db $80

.frame_52
	frame_oam -16,  -8, $ca, 5 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -16,   0, $ca, 5 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_53
	frame_oam -16,   0, $cc, 3 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $ce, 3 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_54
	frame_oam -16,  -8, $2c, 0 | OAMF_BANK1
	frame_oam -16,   0, $2c, 0 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_55
	frame_oam -16,  -4, $30, 0 | OAMF_BANK1
	db $80

Frameset_15ed91:
	db   0,  4
	db $ff

Frameset_15ed94:
	db   1,  4
	db $ff

Frameset_15ed97:
	db   2,  4
	db $ff

Frameset_15ed9a:
	db   3,  4
	db $ff

Frameset_15ed9d:
	db   7,  4
	db   6,  4
	db   5,  4
	db   4,  4
	db $ff

Frameset_15eda6:
	db   8,  5
	db   9,  5
	db  10,  5
	db  11,  5
	db  12,  5
	db  13,  5
	db $ff

Frameset_15edb3:
	db   8,  7
	db   9,  7
	db  10,  7
	db  11,  7
	db  12,  7
	db  13,  7
	db $ff

Frameset_15edc0:
	db   6,  4
	db $ff

Frameset_15edc3:
	db   4,  4
	db $ff

Frameset_15edc6:
	db   4,  4
	db  14,  4
	db   4, 20
	db  14,  4
	db  15,  3
	db   4,  4
	db  14,  4
	db  15,  8
	db   4, 60
	db   4,  2
	db  14,  2
	db   4,  2
	db  14,  2
	db  15,  6
	db  14,  8
	db   4, 60
	db   5, 30
	db $ff

Frameset_15ede9:
	db   4,  4
	db  16,  8
	db  17, 14
	db  20,  3
	db $ff

Frameset_15edf2:
	db   4,  4
	db  20,  9
	db  21,  9
	db  18,  6
	db  19,  2
	db  18, 60
	db  16,  8
	db  20,  9
	db  17,  8
	db  20,  9
	db   4,  4
	db  14,  4
	db   4,  4
	db  14,  4
	db $ff

Frameset_15ee0f:
	db   4,  4
	db   3,  5
	db  22, 10
	db   3,  4
	db   5,  5
	db   6, 10
	db   5,  5
	db $ff

Frameset_15ee1e:
	db  15, 20
	db  16,  4
	db  23, 10
	db  24,  6
	db  25,  2
	db  26,  2
	db  25,  2
	db  26,  2
	db  25,  2
	db  26,  2
	db  25,  2
	db  26,  2
	db  25,  2
	db  26,  2
	db $ff

Frameset_15ee3b:
	db   7,  4
	db  27, 14
	db  28, 24
	db  27, 16
	db $ff

Frameset_15ee44:
	db  29,  2
	db  30,  2
	db  31,  1
	db  33,  2
	db  34,  2
	db  35,  1
	db  37,  2
	db  38,  2
	db  39,  1
	db $ff

Frameset_15ee57:
	db  31,  2
	db  29,  2
	db  35,  2
	db  33,  2
	db  39,  2
	db  37,  2
	db $ff

Frameset_15ee64:
	db  41,  4
	db $ff

Frameset_15ee67:
	db  42,  4
	db  43,  4
	db  44,  4
	db  45,  4
	db $ff

Frameset_15ee70:
	db  46,  4
	db  47,  4
	db  48,  4
	db  49,  4
	db $ff

Frameset_15ee79:
	db  50,  4
	db  51,  4
	db  52,  4
	db  53,  4
	db $ff

Frameset_15ee82:
	db  25,  2
	db  26,  2
	db $ff

Frameset_15ee87:
	db  54,  4
	db $ff

Frameset_15ee8a:
	db  55,  4
	db $ff
