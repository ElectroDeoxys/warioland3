OldMan2Gfx: INCBIN "gfx/cutscenes/old_man2.2bpp"
EpilogueStarGfx: INCBIN "gfx/epilogue_star.2bpp"
OldMan1Gfx: INCBIN "gfx/cutscenes/old_man1.2bpp"

BGMap_15cd00: INCBIN "gfx/bgmaps/map_15cd00.bin"
BGMap_15ce81: INCBIN "gfx/bgmaps/map_15ce81.bin"
BGMap_15cf40: INCBIN "gfx/bgmaps/map_15cf40.bin" ; unreferenced
BGMap_15cfe1: INCBIN "gfx/bgmaps/map_15cfe1.bin" ; unreferenced
EpilogueGfx: INCBIN "gfx/epilogue.2bpp.lz"

BGMap_15df9b: INCBIN "gfx/bgmaps/map_15df9b.bin"
BGMap_15dff8: INCBIN "gfx/bgmaps/map_15dff8.bin"

Text_15e06b: INCBIN "text/text_15e06b.bin"
Text_15e212: INCBIN "text/text_15e212.bin" ; unreferenced
Text_15e225: INCBIN "text/text_15e225.bin"
Text_15e437: INCBIN "text/text_15e437.bin" ; unreferenced

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

Frameset_15e801: ; 15e801 (57:6801)
	db $34,  2
	db $32,  1
	db $29,  2
	db $32,  1
	db $ff
; 0x15e80a

Frameset_15e80a: ; 15e80a (57:680a)
	db $29,  2
	db $2d,  1
	db $33,  2
	db $2d,  1
	db $ff
; 0x15e813

OAM_15e813: ; 15e813 (57:6813)
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
; 0x15e88d

Frameset_15e88d: ; 15e88d (57:688d)
	db $00,  4
	db $ff
; 0x15e890

Frameset_15e890: ; 15e890 (57:6890)
	db $01,  4
	db $ff
; 0x15e893

Frameset_15e893: ; 15e893 (57:6893)
	db $02,  4
	db $ff
; 0x15e896

Frameset_15e896: ; 15e896 (57:6896)
	db $03,  4
	db $ff
; 0x15e899

Frameset_15e899: ; 15e899 (57:6899)
	db $04,  4
	db $ff
; 0x15e89c

Frameset_15e89c: ; 15e89c (57:689c)
	db $05,  4
	db $ff
; 0x15e89f

Frameset_15e89f: ; 15e89f (57:689f)
	db $06,  4
	db $ff
; 0x15e8a2

Frameset_15e8a2: ; 15e8a2 (57:68a2)
	db $07,  4
	db $ff
; 0x15e8a5

Frameset_15e8a5: ; 15e8a5 (57:68a5)
	db $08,  4
	db $ff
; 0x15e8a8

Frameset_15e8a8: ; 15e8a8 (57:68a8)
	db $09,  4
	db $ff
; 0x15e8ab

Frameset_15e8ab: ; 15e8ab (57:68ab)
	db $00, 20
	db $01, 20
	db $ff
; 0x15e8b0

Frameset_15e8b0: ; 15e8b0 (57:68b0)
	db $00, 10
	db $02,  4
	db $03, 10
	db $04,  4
	db $ff
; 0x15e8b9

; unreferenced
Frameset_15e8b9: ; 15e8b9 (57:68b9)
	db $05, 20
	db $06, 20
	db $ff
; 0x15e8be

; unreferenced
Frameset_15e8be: ; 15e8be (57:68be)
	db $07, 20
	db $08, 20
	db $ff
; 0x15e8c3

; unreferenced
Frameset_15e8c3: ; 15e8c3 (57:68c3)
	db $09,  4
	db $0a,  4
	db $09,  4
	db $0b,  4
	db $ff
; 0x15e8cc

; unreferenced
Frameset_15e8cc: ; 15e8cc (57:68cc)
	db $0c, 15
	db $0d, 15
	db $ff
; 0x15e8d1

; unreferenced
Frameset_15e8d1: ; 15e8d1 (57:68d1)
	db $0e, 15
	db $0f, 15
	db $ff
; 0x15e8d6

; unreferenced
Frameset_15e8d6: ; 15e8d6 (57:68d6)
	db $10, 15
	db $11, 15
	db $ff
; 0x15e8db

; unreferenced
Frameset_15e8db: ; 15e8db (57:68db)
	db $15,  7
	db $16,  7
	db $17,  7
	db $18,  7
	db $19,  7
	db $ff
; 0x15e8e6

; unreferenced
Frameset_15e8e6: ; 15e8e6 (57:68e6)
	db $24,  7
	db $25,  7
	db $26,  7
	db $27,  7
	db $28,  7
	db $ff
; 0x15e8f1

; unreferenced
Frameset_15e8f1: ; 15e8f1 (57:68f1)
	db $34,  4
	db $20,  4
	db $ff
; 0x15e8f6

; unreferenced
Frameset_15e8f6: ; 15e8f6 (57:68f6)
	db $35,  4
	db $2f,  4
	db $ff
; 0x15e8fb

; unreferenced
Frameset_15e8fb: ; 15e8fb (57:68fb)
	db $12, 10
	db $1c,  6
	db $1b, 10
	db $ff
; 0x15e902

; unreferenced
Frameset_15e902: ; 15e902 (57:6902)
	db $1b, 10
	db $1c,  6
	db $12, 10
	db $ff
; 0x15e909

; unreferenced
Frameset_15e909: ; 15e909 (57:6909)
	db $21, 10
	db $2b,  6
	db $2a, 10
	db $ff
; 0x15e910

; unreferenced
Frameset_15e910: ; 15e910 (57:6910)
	db $2a, 10
	db $2b,  6
	db $21, 10
	db $ff
; 0x15e917

; unreferenced
Frameset_15e917: ; 15e917 (57:6917)
	db $12,  4
	db $ff
; 0x15e91a

; unreferenced
Frameset_15e91a: ; 15e91a (57:691a)
	db $13,  4
	db $ff
; 0x15e91d

; unreferenced
Frameset_15e91d: ; 15e91d (57:691d)
	db $14,  4
	db $ff
; 0x15e920

; unreferenced
Frameset_15e920: ; 15e920 (57:6920)
	db $15,  4
	db $ff
; 0x15e923

; unreferenced
Frameset_15e923: ; 15e923 (57:6923)
	db $16,  4
	db $ff
; 0x15e926

; unreferenced
Frameset_15e926: ; 15e926 (57:6926)
	db $17,  4
	db $ff
; 0x15e929

; unreferenced
Frameset_15e929: ; 15e929 (57:6929)
	db $18,  4
	db $ff
; 0x15e92c

; unreferenced
Frameset_15e92c: ; 15e92c (57:692c)
	db $19,  4
	db $ff
; 0x15e92f

; unreferenced
Frameset_15e92f: ; 15e92f (57:692f)
	db $1a,  4
	db $ff
; 0x15e932

Frameset_15e932: ; 15e932 (57:6932)
	db $1b,  4
	db $ff
; 0x15e935

; unreferenced
Frameset_15e935: ; 15e935 (57:6935)
	db $1c,  4
	db $ff
; 0x15e938

; unreferenced
Frameset_15e938: ; 15e938 (57:6938)
	db $1d,  4
	db $ff
; 0x15e93b

; unreferenced
Frameset_15e93b: ; 15e93b (57:693b)
	db $1e,  4
	db $ff
; 0x15e93e

; unreferenced
Frameset_15e93e: ; 15e93e (57:693e)
	db $1f,  4
	db $ff
; 0x15e941

; unreferenced
Frameset_15e941: ; 15e941 (57:6941)
	db $21,  4
	db $ff
; 0x15e944

; unreferenced
Frameset_15e944: ; 15e944 (57:6944)
	db $22,  4
	db $ff
; 0x15e947

; unreferenced
Frameset_15e947: ; 15e947 (57:6947)
	db $23,  4
	db $ff
; 0x15e94a

; unreferenced
Frameset_15e94a: ; 15e94a (57:694a)
	db $24,  4
	db $ff
; 0x15e94d

; unreferenced
Frameset_15e94d: ; 15e94d (57:694d)
	db $25,  4
	db $ff
; 0x15e950

; unreferenced
Frameset_15e950: ; 15e950 (57:6950)
	db $26,  4
	db $ff
; 0x15e953

; unreferenced
Frameset_15e953: ; 15e953 (57:6953)
	db $27,  4
	db $ff
; 0x15e956

; unreferenced
Frameset_15e956: ; 15e956 (57:6956)
	db $28,  4
	db $ff
; 0x15e959

; unreferenced
Frameset_15e959: ; 15e959 (57:6959)
	db $29,  4
	db $ff
; 0x15e95c

Frameset_15e95c: ; 15e95c (57:695c)
	db $2a,  4
	db $ff
; 0x15e95f

; unreferenced
Frameset_15e95f: ; 15e95f (57:695f)
	db $2b,  4
	db $ff
; 0x15e962

; unreferenced
Frameset_15e962: ; 15e962 (57:6962)
	db $2c,  4
	db $ff
; 0x15e965

; unreferenced
Frameset_15e965: ; 15e965 (57:6965)
	db $2d,  4
	db $ff
; 0x15e968

; unreferenced
Frameset_15e968: ; 15e968 (57:6968)
	db $2e,  4
	db $ff
; 0x15e96b

; unreferenced
Frameset_15e96b: ; 15e96b (57:696b)
	db $12, 10
	db $30,  6
	db $31, 10
	db $30,  6
	db $ff
; 0x15e974

; unreferenced
Frameset_15e974: ; 15e974 (57:6974)
	db $33, 10
	db $32,  6
	db $21, 10
	db $32,  6
	db $ff
; 0x15e97d

OAM_15e97d: ; 15e97d (57:697d)
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
; 0x15ed91

Frameset_15ed91: ; 15ed91 (57:6d91)
	db $00,  4
	db $ff
; 0x15ed94

Frameset_15ed94: ; 15ed94 (57:6d94)
	db $01,  4
	db $ff
; 0x15ed97

Frameset_15ed97: ; 15ed97 (57:6d97)
	db $02,  4
	db $ff
; 0x15ed9a

Frameset_15ed9a: ; 15ed9a (57:6d9a)
	db $03,  4
	db $ff
; 0x15ed9d

Frameset_15ed9d: ; 15ed9d (57:6d9d)
	db $07,  4
	db $06,  4
	db $05,  4
	db $04,  4
	db $ff
; 0x15eda6

Frameset_15eda6: ; 15eda6 (57:6da6)
	db $08,  5
	db $09,  5
	db $0a,  5
	db $0b,  5
	db $0c,  5
	db $0d,  5
	db $ff
; 0x15edb3

Frameset_15edb3: ; 15edb3 (57:6db3)
	db $08,  7
	db $09,  7
	db $0a,  7
	db $0b,  7
	db $0c,  7
	db $0d,  7
	db $ff
; 0x15edc0

Frameset_15edc0: ; 15edc0 (57:6dc0)
	db $06,  4
	db $ff
; 0x15edc3

Frameset_15edc3: ; 15edc3 (57:6dc3)
	db $04,  4
	db $ff
; 0x15edc6

Frameset_15edc6: ; 15edc6 (57:6dc6)
	db $04,  4
	db $0e,  4
	db $04, 20
	db $0e,  4
	db $0f,  3
	db $04,  4
	db $0e,  4
	db $0f,  8
	db $04, 60
	db $04,  2
	db $0e,  2
	db $04,  2
	db $0e,  2
	db $0f,  6
	db $0e,  8
	db $04, 60
	db $05, 30
	db $ff
; 0x15ede9

Frameset_15ede9: ; 15ede9 (57:6de9)
	db $04,  4
	db $10,  8
	db $11, 14
	db $14,  3
	db $ff
; 0x15edf2

Frameset_15edf2: ; 15edf2 (57:6df2)
	db $04,  4
	db $14,  9
	db $15,  9
	db $12,  6
	db $13,  2
	db $12, 60
	db $10,  8
	db $14,  9
	db $11,  8
	db $14,  9
	db $04,  4
	db $0e,  4
	db $04,  4
	db $0e,  4
	db $ff
; 0x15ee0f

Frameset_15ee0f: ; 15ee0f (57:6e0f)
	db $04,  4
	db $03,  5
	db $16, 10
	db $03,  4
	db $05,  5
	db $06, 10
	db $05,  5
	db $ff
; 0x15ee1e

Frameset_15ee1e: ; 15ee1e (57:6e1e)
	db $0f, 20
	db $10,  4
	db $17, 10
	db $18,  6
	db $19,  2
	db $1a,  2
	db $19,  2
	db $1a,  2
	db $19,  2
	db $1a,  2
	db $19,  2
	db $1a,  2
	db $19,  2
	db $1a,  2
	db $ff
; 0x15ee3b

Frameset_15ee3b: ; 15ee3b (57:6e3b)
	db $07,  4
	db $1b, 14
	db $1c, 24
	db $1b, 16
	db $ff
; 0x15ee44

Frameset_15ee44: ; 15ee44 (57:6e44)
	db $1d,  2
	db $1e,  2
	db $1f,  1
	db $21,  2
	db $22,  2
	db $23,  1
	db $25,  2
	db $26,  2
	db $27,  1
	db $ff
; 0x15ee57

Frameset_15ee57: ; 15ee57 (57:6e57)
	db $1f,  2
	db $1d,  2
	db $23,  2
	db $21,  2
	db $27,  2
	db $25,  2
	db $ff
; 0x15ee64

Frameset_15ee64: ; 15ee64 (57:6e64)
	db $29,  4
	db $ff
; 0x15ee67

Frameset_15ee67: ; 15ee67 (57:6e67)
	db $2a,  4
	db $2b,  4
	db $2c,  4
	db $2d,  4
	db $ff
; 0x15ee70

Frameset_15ee70: ; 15ee70 (57:6e70)
	db $2e,  4
	db $2f,  4
	db $30,  4
	db $31,  4
	db $ff
; 0x15ee79

Frameset_15ee79: ; 15ee79 (57:6e79)
	db $32,  4
	db $33,  4
	db $34,  4
	db $35,  4
	db $ff
; 0x15ee82

Frameset_15ee82: ; 15ee82 (57:6e82)
	db $19,  2
	db $1a,  2
	db $ff
; 0x15ee87

Frameset_15ee87: ; 15ee87 (57:6e87)
	db $36,  4
	db $ff
; 0x15ee8a

Frameset_15ee8a: ; 15ee8a (57:6e8a)
	db $37,  4
	db $ff
; 0x15ee8d
