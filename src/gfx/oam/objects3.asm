	INCROM $188000, $188279

OAM_188279:: ; 188279 (62:4279)
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
	frame_oam -16, -16, $80, 6 | OAMF_BANK1
	frame_oam -16,  -8, $82, 6 | OAMF_BANK1
	frame_oam -16,   8, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -16, -16, $84, 6 | OAMF_BANK1
	frame_oam -16,  -8, $86, 6 | OAMF_BANK1
	frame_oam -16,   0, $88, 6 | OAMF_BANK1
	frame_oam -16,   8, $8a, 6 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -16,   8, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,   0, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -8, $88, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $8a, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -17, -16, $8c, 6 | OAMF_BANK1
	frame_oam -17,   8, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -17,  -8, $8e, 6 | OAMF_BANK1
	frame_oam -17,   0, $8e, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -20, -16, $a0, 6 | OAMF_BANK1
	frame_oam -20,  -8, $a2, 6 | OAMF_BANK1
	frame_oam -20,   8, $a0, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,   0, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -20, -16, $90, 6 | OAMF_BANK1
	frame_oam -20,  -8, $92, 6 | OAMF_BANK1
	frame_oam -20,   8, $90, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,   0, $92, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -20, -16, $98, 6 | OAMF_BANK1
	frame_oam -20,  -8, $9a, 6 | OAMF_BANK1
	frame_oam -20,   0, $9c, 6 | OAMF_BANK1
	frame_oam -20,   8, $9e, 6 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -20, -16, $94, 6 | OAMF_BANK1
	frame_oam -20,  -8, $96, 6 | OAMF_BANK1
	frame_oam -20,   8, $94, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,   0, $96, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_8
	frame_oam -20,   8, $98, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,   0, $9a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,  -8, $9c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -16, $9e, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -20, -16, $a0, 6 | OAMF_BANK1
	frame_oam -20,  -8, $a2, 6 | OAMF_BANK1
	frame_oam -20,   8, $90, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,   0, $92, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -20, -16, $a4, 6 | OAMF_BANK1
	frame_oam -20,  -8, $a6, 6 | OAMF_BANK1
	frame_oam -20,   8, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20,   0, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80
; 0x18834a

	INCROM $18834a, $1895ec

OAM_1895ec:: ; 1895ec (62:55ec)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6

.frame_0
	frame_oam -32, -16, $80, 6 | OAMF_BANK1
	frame_oam -32,  -8, $82, 6 | OAMF_BANK1
	frame_oam -32,   7, $80, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -1, $82, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $84, 6 | OAMF_BANK1
	frame_oam -16,  -8, $86, 6 | OAMF_BANK1
	frame_oam -16,   7, $84, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -1, $86, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -32, -16, $88, 6 | OAMF_BANK1
	frame_oam -32,  -8, $8a, 6 | OAMF_BANK1
	frame_oam -32,   7, $88, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -1, $8a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $8c, 6 | OAMF_BANK1
	frame_oam -16,  -8, $8e, 6 | OAMF_BANK1
	frame_oam -16,   7, $8c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -1, $8e, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -32, -16, $90, 6 | OAMF_BANK1
	frame_oam -32,  -8, $92, 6 | OAMF_BANK1
	frame_oam -32,   7, $90, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -1, $92, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $94, 6 | OAMF_BANK1
	frame_oam -16,  -8, $96, 6 | OAMF_BANK1
	frame_oam -16,   7, $94, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -1, $96, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -32, -16, $b0, 6 | OAMF_BANK1
	frame_oam -32,  -8, $b2, 6 | OAMF_BANK1
	frame_oam -32,   7, $b0, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -1, $b2, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $b4, 6 | OAMF_BANK1
	frame_oam -16,  -8, $b6, 6 | OAMF_BANK1
	frame_oam -16,   7, $b4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -1, $b6, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -32, -16, $98, 6 | OAMF_BANK1
	frame_oam -32,  -8, $9a, 6 | OAMF_BANK1
	frame_oam -32,   7, $98, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -1, $9a, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $9c, 6 | OAMF_BANK1
	frame_oam -16,  -8, $9e, 6 | OAMF_BANK1
	frame_oam -16,   7, $9c, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -1, $9e, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -32, -16, $a0, 6 | OAMF_BANK1
	frame_oam -32,  -8, $a2, 6 | OAMF_BANK1
	frame_oam -32,   7, $a0, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -1, $a2, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $a4, 6 | OAMF_BANK1
	frame_oam -16,  -8, $a6, 6 | OAMF_BANK1
	frame_oam -16,   7, $a4, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -1, $a6, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -32, -16, $a8, 6 | OAMF_BANK1
	frame_oam -32,  -8, $aa, 6 | OAMF_BANK1
	frame_oam -32,   7, $a8, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -32,  -1, $aa, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -16, $ac, 6 | OAMF_BANK1
	frame_oam -16,  -8, $ae, 6 | OAMF_BANK1
	frame_oam -16,   7, $ac, 6 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16,  -1, $ae, 6 | OAMF_BANK1 | OAMF_XFLIP
	db $80
; 0x1896e1

OAM_1896e1:: ; 1896e1 (62:56e1)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5

.frame_0
	frame_oam -32, -12, $00, 4 | OAMF_BANK1
	frame_oam -32,  -4, $02, 4 | OAMF_BANK1
	frame_oam -32,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -16, -12, $04, 4 | OAMF_BANK1
	frame_oam -16,  -4, $06, 4 | OAMF_BANK1
	frame_oam -16,   4, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_1
	frame_oam -34, -12, $00, 4 | OAMF_BANK1
	frame_oam -34,  -4, $02, 4 | OAMF_BANK1
	frame_oam -34,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -18, -12, $04, 4 | OAMF_BANK1
	frame_oam -18,  -4, $06, 4 | OAMF_BANK1
	frame_oam -18,   4, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_2
	frame_oam -36, -12, $00, 4 | OAMF_BANK1
	frame_oam -36,  -4, $02, 4 | OAMF_BANK1
	frame_oam -36,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -20, -12, $04, 4 | OAMF_BANK1
	frame_oam -20,  -4, $06, 4 | OAMF_BANK1
	frame_oam -20,   4, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -37, -12, $00, 4 | OAMF_BANK1
	frame_oam -37,  -4, $02, 4 | OAMF_BANK1
	frame_oam -37,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -21, -12, $04, 4 | OAMF_BANK1
	frame_oam -21,  -4, $06, 4 | OAMF_BANK1
	frame_oam -21,   4, $04, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -15, -12, $08, 4 | OAMF_BANK1
	frame_oam -15,  -4, $0a, 4 | OAMF_BANK1
	frame_oam -15,   4, $08, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -31, -12, $00, 4 | OAMF_BANK1
	frame_oam -31,  -4, $02, 4 | OAMF_BANK1
	frame_oam -31,   4, $00, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -14, -12, $10, 4 | OAMF_BANK1
	frame_oam -14,  -4, $12, 4 | OAMF_BANK1
	frame_oam -14,   4, $10, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -30, -12, $0c, 4 | OAMF_BANK1
	frame_oam -30,  -4, $0e, 4 | OAMF_BANK1
	frame_oam -30,   4, $0c, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80
; 0x189783

	INCROM $189783, $18aba0

OAM_18aba0:: ; 18aba0 (62:6ba0)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7

.frame_0
	frame_oam -32, -12, $80, 6 | OAMF_BANK1
	frame_oam -32,  -4, $82, 6 | OAMF_BANK1
	frame_oam -32,   4, $84, 6 | OAMF_BANK1
	frame_oam -16, -12, $a0, 6 | OAMF_BANK1
	frame_oam -16,  -4, $a2, 6 | OAMF_BANK1
	frame_oam -16,   4, $a4, 6 | OAMF_BANK1
	db $80

.frame_1
	frame_oam -32, -12, $86, 6 | OAMF_BANK1
	frame_oam -32,  -4, $88, 6 | OAMF_BANK1
	frame_oam -32,   4, $8a, 6 | OAMF_BANK1
	frame_oam -16, -12, $a6, 6 | OAMF_BANK1
	frame_oam -16,  -4, $a8, 6 | OAMF_BANK1
	frame_oam -16,   4, $aa, 6 | OAMF_BANK1
	db $80

.frame_2
	frame_oam -32, -12, $8c, 6 | OAMF_BANK1
	frame_oam -32,  -4, $8e, 6 | OAMF_BANK1
	frame_oam -32,   4, $90, 6 | OAMF_BANK1
	frame_oam -16, -12, $ac, 6 | OAMF_BANK1
	frame_oam -16,  -4, $ae, 6 | OAMF_BANK1
	frame_oam -16,   4, $b0, 6 | OAMF_BANK1
	db $80

.frame_3
	frame_oam -32, -12, $92, 6 | OAMF_BANK1
	frame_oam -32,  -4, $94, 6 | OAMF_BANK1
	frame_oam -32,   4, $96, 6 | OAMF_BANK1
	frame_oam -16, -12, $b2, 6 | OAMF_BANK1
	frame_oam -16,  -4, $b4, 6 | OAMF_BANK1
	frame_oam -16,   4, $b6, 6 | OAMF_BANK1
	db $80

.frame_4
	frame_oam -16,  -8, $98, 6 | OAMF_BANK1
	frame_oam -16,   0, $9a, 6 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16,  -8, $9c, 6 | OAMF_BANK1
	frame_oam -16,   0, $9e, 6 | OAMF_BANK1
	db $80

.frame_6
	frame_oam -16,  -8, $b8, 6 | OAMF_BANK1
	frame_oam -16,   0, $ba, 6 | OAMF_BANK1
	db $80

.frame_7
	frame_oam -16,  -8, $bc, 6 | OAMF_BANK1
	frame_oam -16,   0, $be, 6 | OAMF_BANK1
	db $80
; 0x18ac38
