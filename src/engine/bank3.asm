LevelsCommonGfx:
INCBIN "gfx/levels/common.2bpp"

Pals_c800: ; c800 (3:4800)
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 30,  0,  3
	rgb 31, 30, 12
	rgb  6,  5, 26
; 0xc810

	INCROM $c810, $c9f3

Func_c9f3: ; c9f3 (3:49f3)
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
	ldh a, [hffa8]
	ld [hli], a
	ldh a, [hffa9]
	ld [hli], a
	ldh a, [hffaa]
	ld [hli], a
	ldh a, [hffab]
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

	INCROM $ca86, $d11a

Func_d11a: ; d11a (3:511a)
	ld a, [wced4]
	and a
	ret nz
	ld hl, wc0a3
	call Func_bdb
	ld a, [wcce9]
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
	ld a, $19
	ldh [hCallFuncBank], a
	ld a, $e5
	ldh [hCallFuncPointer], a
	ld a, $40
	ldh [$ff8e], a
	call hCallFunc
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
	ld a, [wcce9]
	inc a
	ld [wcce9], a
	sramswitch
.asm_d182
	dec e
	jr nz, .asm_d134
	ret
; 0xd186

Func_d186: ; d186 (3:5186)
	ld a, [wced4]
	and a
	ret nz
	ld hl, wc0a3
	call Func_bdb
	ld a, [wcce9]
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
	ld a, $19
	ldh [hCallFuncBank], a
	ld a, $e5
	ldh [hCallFuncPointer], a
	ld a, $40
	ldh [$ff8e], a
	call hCallFunc
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

Func_d1e2: ; d1e2 (3:51e2)
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

	INCROM $d206, $10000
