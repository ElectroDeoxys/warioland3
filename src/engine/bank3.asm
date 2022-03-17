; unreferenced?
Func_c9f0: ; c9f0 (3:49f0)
	call Func_ce3e
;	fallthrough

Func_c9f3:: ; c9f3 (3:49f3)
	ld a, [wcce1]
	add a
	add a
	add a
	add a ; *16
	ld e, a
	ld d, $00
	ld a, [wcce1]
	inc a
	and $03
	ld [wcce1], a

	ld hl, wcca0
	add hl, de
	ld a, [hl]
	and a
	jr nz, .asm_ca15
	ld a, [wcce0]
	inc a
	ld [wcce0], a
.asm_ca15
	ld [hl], b
	inc l
	xor a
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hXPosHi]
	ld [hli], a
	ldh a, [hXPosLo]
	ld [hli], a
	ret
; 0xca26

Func_ca26: ; ca26 (3:4a26)
	ld a, [wcce0]
	and a
	ret z

	ld hl, wcca0
	ld a, [hl]
	and a
	jr z, .asm_ca35
	call Func_ca54
.asm_ca35
	ld hl, wccb0
	ld a, [hl]
	and a
	jr z, .asm_ca3f
	call Func_ca54
.asm_ca3f
	ld hl, wccc0
	ld a, [hl]
	and a
	jr z, .asm_ca49
	call Func_ca54
.asm_ca49
	ld hl, wccd0
	ld a, [hl]
	and a
	jr z, .asm_ca53
	call Func_ca54
.asm_ca53
	ret
; 0xca54

Func_ca54: ; ca54 (3:4a54)
	ld b, h
	ld c, l
	ld a, [hl]
	jumptable

	dw $4a86
	dw $4a87
	dw $4ab8
	dw $4ae1
	dw $4b0a
	dw $4b33
	dw $4b82
	dw $4bd1
	dw $4bfa
	dw $4c23
	dw $4c4c
	dw $4c99
	dw $4cc2
	dw $4ceb
	dw $4d09
	dw $4d3d
	dw $4d66
	dw $4daf
	dw $4df8
	dw $4a86
	dw $4a86
	dw $4a86
	dw $4a86
; 0xca86

	INCROM $ca86, $ce3e

Func_ce3e: ; ce3e (3:4e3e)
	ld a, h
	sub $a0
	ld h, a
	and $f0
	swap a
	ld d, a
	ld a, [wFloorSRAMBank]
	dec a
	add a
	add d
	ldh [hYPosHi], a
	ld a, h
	and $0f
	swap a
	add $10
	ldh [hYPosLo], a
	ldh a, [hYPosHi]
	adc $00
	ldh [hYPosHi], a
	ld a, l
	and $f0
	swap a
	ldh [hXPosHi], a
	ld a, l
	and $0f
	swap a
	add $08
	ldh [hXPosLo], a
	ldh a, [hXPosHi]
	adc $00
	ldh [hXPosHi], a
	ret
; 0xce75

	INCROM $ce75, $d11a

Func_d11a: ; d11a (3:511a)
	ld a, [wLevelEndScreen]
	and a
	ret nz
	ld hl, wc0a3
	call GetCell
	ld a, [wFloorSRAMBank]
	sramswitch
	call Func_d132
	ret
; 0xd132

Func_d132: ; d132 (3:5132)
	ld e, $0c
.asm_d134
	bit 7, [hl]
	jr z, .asm_d16d
	push hl
	call Func_d8c
	ld a, [hl]
	bit 0, b
	jr z, .asm_d143
	swap a
.asm_d143
	and $0f
	ld c, a
	pop hl
	jr z, .asm_d16d
	push de
	push bc
	call Func_d3e
	ld d, h
	ld e, l
	push hl
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	farcall Func_640e5
	pop af
	ldh [rSVBK], a
	pop hl
	pop bc
	pop de
.asm_d16d
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_d182
	ld h, $a0
	ld a, [wFloorSRAMBank]
	inc a
	ld [wFloorSRAMBank], a
	sramswitch
.asm_d182
	dec e
	jr nz, .asm_d134
	ret
; 0xd186

Func_d186: ; d186 (3:5186)
	ld a, [wLevelEndScreen]
	and a
	ret nz
	ld hl, wc0a3
	call GetCell
	ld a, [wFloorSRAMBank]
	sramswitch
	call Func_d19e
	ret
; 0xd19e

Func_d19e: ; d19e (3:519e)
	ld e, $0d
.asm_d1a0
	bit 7, [hl]
	jr z, .asm_d1d9
	push hl
	call Func_d8c
	ld a, [hl]
	bit 0, b
	jr z, .asm_d1af
	swap a
.asm_d1af
	and $0f
	ld c, a
	pop hl
	jr z, .asm_d1d9
	push de
	push bc
	call Func_d3e
	ld d, h
	ld e, l
	push hl
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	farcall Func_640e5
	pop af
	ldh [rSVBK], a
	pop hl
	pop bc
	pop de
.asm_d1d9
	ld a, b
	xor $01
	ld b, a
	inc l
	dec e
	jr nz, .asm_d1a0
	ret
; 0xd1e2

LoadLevelCommonGfxAndTreasures: ; d1e2 (3:51e2)
	ld hl, LevelsCommonGfx
	ld de, v0Tiles1
	ld bc, $800
	call CopyHLToDE_BC

	farcall LoadLevelTreasureData
	ret
; 0xd1fe

Pals_d1fe: ; d1fe (3:51fe)
	rgb  0, 22, 16
	rgb 28, 31, 29
	rgb 30, 23,  0
	rgb  4,  5,  0
; 0xd206

	INCROM $d206, $d20e

OAM_d20e:: ; d20e (03:520e)
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

.frame_0
	frame_oam -16,  -8, $c0, 0
	frame_oam -16,   0, $c0, 0
	db $80

.frame_1
	frame_oam -26, -17, $c0, 0
	frame_oam -26,   9, $c0, 0
	db $80

.frame_2
	frame_oam -29, -31, $c0, 0
	frame_oam -29,  23, $c0, 0
	db $80

.frame_3
	frame_oam -16,   0, $c2, 2
	frame_oam -16,  -8, $c2, 2
	db $80

.frame_4
	frame_oam -20, -11, $c2, 2
	frame_oam -20,   3, $c2, 2
	db $80

.frame_5
	frame_oam -28,   5, $c2, 2
	frame_oam -28, -13, $c2, 2
	frame_oam  -8,   4, $c2, 2 | Y_FLIP
	frame_oam  -8, -11, $c2, 2 | Y_FLIP
	db $80

.frame_6
	frame_oam -37, -17, $c2, 2
	frame_oam -37, -17, $c2, 2
	frame_oam -19,  11, $c2, 2
	frame_oam -19, -19, $c2, 2
	frame_oam -37,   9, $c2, 2
	frame_oam -37,   9, $c2, 2
	db $80

.frame_7
	frame_oam -38,  11, $c2, 2
	frame_oam -38, -19, $c2, 2
	frame_oam -38,  11, $c2, 2
	frame_oam -38, -19, $c2, 2
	frame_oam -18,  18, $c2, 2
	frame_oam -18, -26, $c2, 2
	db $80

.frame_8
	frame_oam -18,  18, $c2, 2
	frame_oam -18, -26, $c2, 2
	db $80

.frame_9
	frame_oam -24, -47, $c0, 0
	frame_oam -24,  39, $c0, 0
	db $80

.frame_10
	frame_oam  -8, -56, $c0, 0
	frame_oam  -8,  48, $c0, 0
	db $80

.frame_11
	frame_oam -16,  -4, $c6, 0
	db $80

.frame_12
	frame_oam -16,  -8, $c8, 0
	frame_oam -16,   0, $ca, 0
	frame_oam -32,  -4, $c6, 0
	db $80

.frame_13
	frame_oam -32,  -4, $c6, 0
	frame_oam -48,  -4, $c4, 0
	db $80

.frame_14
	frame_oam -40,  -4, $c4, 0
	db $80

.frame_15
	frame_oam -34,  -4, $c4, 0
	db $80

.frame_16
	frame_oam -16,  -4, $d2, 2 | X_FLIP
	db $80

.frame_17
	frame_oam -16,  -4, $ce, 2
	db $80

.frame_18
	frame_oam -16,  -4, $d0, 2
	db $80

.frame_19
	frame_oam -16,  -4, $d2, 2
	db $80

.frame_20
	frame_oam -48,  12, $d4, 2
	db $80

.frame_21
	frame_oam -48,  12, $d6, 2
	db $80

.frame_22
	frame_oam -48,  12, $d4, 2 | X_FLIP | Y_FLIP
	db $80

.frame_23
	frame_oam -32,  12, $d4, 2
	db $80

.frame_24
	frame_oam -32,  12, $d6, 2
	db $80

.frame_25
	frame_oam -32,  12, $d4, 2 | X_FLIP | Y_FLIP
	db $80

.frame_26
	frame_oam -48, -20, $d4, 2 | X_FLIP
	db $80

.frame_27
	frame_oam -48, -20, $d6, 2 | X_FLIP
	db $80

.frame_28
	frame_oam -48, -20, $d4, 2 | Y_FLIP
	db $80

.frame_29
	frame_oam -32, -20, $d4, 2 | X_FLIP
	db $80

.frame_30
	frame_oam -32, -20, $d6, 2 | X_FLIP
	db $80

.frame_31
	frame_oam -32, -20, $d4, 2 | Y_FLIP
	db $80

.frame_32
	frame_oam -12,  -4, $d8, 0 | Y_FLIP
	db $80

.frame_33
	frame_oam -16,  -8, $d8, 0
	frame_oam -16,   0, $da, 0
	db $80

.frame_34
	frame_oam -28,  -4, $da, 0 | X_FLIP
	frame_oam -12,  -8, $dc, 0 | X_FLIP | Y_FLIP
	db $80

.frame_35
	frame_oam -36,  -4, $dc, 0
	db $80

.frame_36
	frame_oam -32,  -4, $c6, 0
	frame_oam -48,  -4, $c4, 0
	frame_oam -12,  -4, $d8, 0 | Y_FLIP
	db $80

.frame_37
	frame_oam -40,  -4, $c4, 0
	frame_oam -16,  -8, $d8, 0
	frame_oam -16,   0, $da, 0
	db $80

.frame_38
	frame_oam -34,  -4, $c4, 0
	frame_oam -12,  -8, $dc, 0 | X_FLIP | Y_FLIP
	frame_oam -18,   0, $da, 0
	db $80

.frame_39
	frame_oam -16,  -4, $fe, 0
	db $80

.frame_40
	frame_oam -24,  -4, $fe, 0 | X_FLIP
	db $80

.frame_41
	frame_oam -29,  -5, $fe, 0
	db $80

.frame_42
	frame_oam -35,  -8, $fe, 0 | X_FLIP
	db $80

.frame_43
	frame_oam -16,  -4, $fe, 0 | X_FLIP
	db $80

.frame_44
	frame_oam -24,  -4, $fe, 0
	db $80

.frame_45
	frame_oam -29,  -3, $fe, 0 | X_FLIP
	db $80

.frame_46
	frame_oam -35,   0, $fe, 0
	db $80

.frame_47
	frame_oam -16, -12, $b6, 0
	frame_oam -16,   4, $b6, 0 | X_FLIP
	frame_oam -24,  -4, $b8, 0
	frame_oam  -8,  -4, $b8, 0 | Y_FLIP
	db $80

.frame_48
	frame_oam -24,  -4, $bc, 0
	frame_oam  -8,  -4, $bc, 0 | Y_FLIP
	frame_oam -16, -12, $ba, 0
	frame_oam -16,   4, $ba, 0 | X_FLIP
	db $80

.frame_49
	frame_oam -16,  -8, $90, 0
	frame_oam -16,   0, $92, 0
	db $80

.frame_50
	frame_oam -16,  -8, $94, 0
	frame_oam -16,   0, $96, 0
	db $80

.frame_51
	frame_oam -16,  -8, $98, 0
	frame_oam -16,   0, $9a, 0
	db $80

.frame_52
	frame_oam -16,  -8, $9c, 0
	frame_oam -16,   0, $9e, 0
	db $80

.frame_53
	frame_oam   1,  -3, $de, 2 | X_FLIP | Y_FLIP
	frame_oam -15,  -8, $de, 2
	frame_oam -15,   0, $de, 2 | X_FLIP
	db $80

.frame_54
	frame_oam   2,   0, $de, 2 | X_FLIP | Y_FLIP
	frame_oam -12, -10, $de, 2
	frame_oam -17,  -1, $de, 2 | X_FLIP
	db $80

.frame_55
	frame_oam -19,  -7, $de, 2 | X_FLIP
	frame_oam   0,   5, $de, 2 | X_FLIP | Y_FLIP
	frame_oam   6,  -3, $de, 2 | X_FLIP | Y_FLIP
	frame_oam   0, -12, $de, 2 | Y_FLIP
	frame_oam -19,   3, $de, 2 | X_FLIP
	db $80

.frame_56
	frame_oam -11,  -3, $c2, 2
	db $80

.frame_57
	frame_oam -14,   1, $c2, 2
	frame_oam -15,  -8, $c2, 2 | X_FLIP
	frame_oam   2,  -5, $c2, 2 | X_FLIP | Y_FLIP
	db $80

.frame_58
	frame_oam -18,  -2, $c2, 2
	frame_oam -10, -11, $c2, 2 | X_FLIP
	frame_oam   1,   1, $c2, 2 | Y_FLIP
	db $80

.frame_59
	frame_oam   2,   5, $c2, 2 | Y_FLIP
	frame_oam -21,  -5, $c2, 2 | X_FLIP
	frame_oam   6,  -6, $c2, 2 | X_FLIP | Y_FLIP
	frame_oam -17,   5, $c2, 2
	frame_oam -11, -13, $c2, 2 | X_FLIP
	db $80
; 0xd49a

Frameset_d49a:: ; d49a (03:549a)
	db $00,  2
	db $01,  3
	db $02,  3
	db $09,  2
	db $0a,  2
	db $ff
; 0xd4a5

Frameset_d4a5:: ; d4a5 (03:54a5)
	db $35,  2
	db $36,  1
	db $37,  2
	db $38,  3
	db $39,  2
	db $3a,  2
	db $38,  3
	db $39,  2
	db $3a,  2
	db $3b,  2
	db $ff
; 0xd4ba

	INCROM $d4ba, $d763

OAM_d763:: ; d763 (03:5763)
	dw .frame_0
	dw .frame_1
	dw .frame_2

.frame_0
	frame_oam -26,  -8, $10, 4 | TILE_BANK
	frame_oam -26,   0, $12, 4 | TILE_BANK
	frame_oam -10,  -8, $18, 0 | TILE_BANK
	frame_oam -10,   0, $18, 0 | TILE_BANK | X_FLIP
	frame_oam -19, -16, $22, 4 | TILE_BANK
	frame_oam -18,   8, $1e, 4 | TILE_BANK | X_FLIP
	db $80

.frame_1
	frame_oam -26,   0, $10, 4 | TILE_BANK | X_FLIP
	frame_oam -26,  -8, $12, 4 | TILE_BANK | X_FLIP
	frame_oam -10,  -8, $18, 0 | TILE_BANK
	frame_oam -10,   0, $18, 0 | TILE_BANK | X_FLIP
	frame_oam -19,   8, $22, 4 | TILE_BANK | X_FLIP
	frame_oam -18, -16, $1e, 4 | TILE_BANK
	db $80

.frame_2
	frame_oam -25,  -8, $12, 4 | TILE_BANK | X_FLIP
	frame_oam  -9,  -8, $18, 0 | TILE_BANK
	frame_oam  -9,   0, $18, 0 | TILE_BANK | X_FLIP
	frame_oam -18, -16, $20, 4 | TILE_BANK
	frame_oam -18,   8, $20, 4 | TILE_BANK | X_FLIP
	frame_oam -25,   0, $12, 4 | TILE_BANK
	db $80
; 0xd7b4

Frameset_d7b4:: ; d7b4 (03:57b4)
	db $00,  2
	db $02,  2
	db $01,  2
	db $02,  2
	db $ff
; 0xd7bd

	INCROM $d7bd, $d912
