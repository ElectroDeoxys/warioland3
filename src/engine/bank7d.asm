Func_1f4000: ; 1f4000 (7d:4000)
	ld hl, Pals_1f4182
	call LoadPalsToTempPals1
	ld hl, Pals_1f41c2
	call LoadPalsToTempPals2
	ret
; 0x1f400d

Func_1f400d: ; 1f400d (7d:400d)
	ld hl, $4202
	ld bc, v0Tiles0
	call Decompress
	ld a, [wTransformation]
	cp TRANFORMATION_OWL_WARIO
	jr z, .asm_1f4026
	cp TRANFORMATION_UNK_0F
	jr z, .asm_1f402b
	cp (1 << 6) | TRANFORMATION_VAMPIRE_WARIO
	jr z, .asm_1f4030
	ret
.asm_1f4026
	ld hl, $57e1
	jr .asm_1f4035
.asm_1f402b
	ld hl, $59e1
	jr .asm_1f4035
.asm_1f4030
	ld hl, $5be1
	jr .asm_1f4035
.asm_1f4035
	ld de, v0Tiles0
	ld bc, $200
	call CopyHLToDE_BC
	ret
; 0x1f403f

Func_1f403f: ; 1f403f (7d:403f)
	ld a, [wca3d]
	bit 1, a
	jr nz, .asm_1f4060
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, BGMap_1f5f49
	ld bc, v1BGMap1
	call Decompress
	xor a
	ldh [rVBK], a
	ld hl, BGMap_1f5de1
	ld bc, v1BGMap1
	call Decompress
	ret

.asm_1f4060
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, BGMap_1f6194
	ld bc, v0BGMap1
	call Decompress
	xor a
	ldh [rVBK], a
	ld hl, BGMap_1f603a
	ld bc, v0BGMap1
	call Decompress

	ld a, [wLevel]
	srl a
	srl a
	srl a
	add a
	ld e, a
	ld d, $00
	ld hl, wca07
	add hl, de
	ld a, [hli]
	ld [$d511], a
	ld a, [hl]
	ld [$d512], a
	ld hl, $9c44
	ld bc, $ffe0
	ld de, $20
	ld a, [$d511]
	swap a
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [$d511]
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	inc l
	ld a, [$d512]
	swap a
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [$d512]
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld hl, $9c4b
	ld bc, $ffe0
	ld de, $20
	ld a, [wc0e2]
	swap a
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [wc0e2]
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	inc l
	ld a, [wc0e3]
	swap a
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [wc0e3]
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ret
; 0x1f4117

	INCROM $1f4117, $1f4182

Pals_1f4182: ; 1f4182 (7d:4182)
	rgb 31, 31, 31
	rgb 21, 21, 19
	rgb 10, 10,  8
	rgb  0,  0,  0

	rgb 27, 31, 18
	rgb 16, 26,  8
	rgb  4, 18,  2
	rgb  0, 14,  0

	rgb 31, 17, 17
	rgb 29, 14, 12
	rgb 27,  7,  5
	rgb 10,  2,  0

	rgb 31, 31, 31
	rgb  9, 10, 31
	rgb  7,  2, 23
	rgb  0,  0,  0

	rgb 31, 27,  0
	rgb 26, 11,  1
	rgb 11,  0,  1
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 23,  0
	rgb 31,  0,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 13, 30, 31
	rgb 11, 19, 31
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 11, 19, 31
	rgb  9, 10, 31
	rgb  0,  0,  0
; 0x1f41c2

Pals_1f41c2: ; 1f41c2 (7d:41c2)
	rgb  0, 22, 16
	rgb 21, 21, 19
	rgb 10, 10,  8
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb  0, 27, 31
	rgb 31,  0, 12
	rgb  5,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 20
	rgb 31, 27,  0
	rgb  9,  5,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 16, 16, 16
	rgb 31,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb  0, 20,  0
	rgb  0, 12, 31

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 30, 15, 31
	rgb 17,  0, 18
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0
; 0x1f4202

	INCROM $1f4202, $1f5de1

BGMap_1f5de1: ; 1f5de1 (7d:5de1)
INCBIN "gfx/bgmaps/map_1f5de1.bin"

BGMap_1f5f49: ; 1f5f49 (7d:5f49)
INCBIN "gfx/bgmaps/map_1f5f49.bin"

BGMap_1f603a: ; 1f603a (7d:603a)
INCBIN "gfx/bgmaps/map_1f603a.bin"

BGMap_1f6194: ; 1f6194 (7d:6194)
INCBIN "gfx/bgmaps/map_1f6194.bin"
; 0x1f628c

	INCROM $1f628c, $1f6af3
