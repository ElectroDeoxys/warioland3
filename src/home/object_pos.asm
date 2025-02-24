; input:
; - hl = hPos
; output:
; - l = x block
; - h = y block
; - b = ?
Func_cc0::
	; [hl] = y pos
	ld a, [hli]
	ld d, a
	ld a, [hli]
	swap a
	and $0f
	ld c, a
	ld a, d
	and $0f
	swap a
	add c
	; a = [hl] >> 4
	add HIGH(STARTOF(SRAM))
	ld c, a
	ld [wObjectSpawnBlockY], a

	; [hl] = x pos
	ld a, [hli]
	ld d, a
	ld a, [hl]
	swap a
	and $0f
	ld l, a
	ld a, d
	and $0f
	swap a
	add l
	srl a
	; a = [hl] >> 5
	ld l, a
	ld a, $00
	adc $00
	xor $01
	ld [wUnused_ccef], a
	ld b, a

	ld a, l
	add $b0
	ld l, a
	ld [wObjectSpawnBlockX], a
	ld h, c
	ret

Func_cf8::
	push hl
	ld a, h
	sub HIGH(STARTOF(SRAM))
	ld h, a
	and $f0
	swap a
	ld d, a
	ld a, [wccec]
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
	adc 0
	ldh [hYPosHi], a

	ld a, b
	xor $01
	add a
	add a
	add a
	add a ; *16
	add $08
	ld d, a
	ld a, l
	sub $b0
	add a
	ld l, a
	and $f0
	swap a
	ldh [hXPosHi], a
	ld a, l
	and $0f
	swap a
	add d
	ldh [hXPosLo], a
	ldh a, [hXPosHi]
	adc 0
	ldh [hXPosHi], a
	pop hl
	ret

Func_d3e::
	ld a, h
	sub HIGH(STARTOF(SRAM))
	ld d, a
	and $f0
	swap a
	ld b, a
	ld a, [wBlockPtrBank]
	dec a
	add a
	add b
	ldh [hYPosHi], a
	ld a, d
	and $0f
	swap a
	add $10
	ldh [hYPosLo], a
	ldh a, [hYPosHi]
	adc $00
	ldh [hYPosHi], a
	ld a, l
	sub $00
	ld e, a
	and $f0
	swap a
	ldh [hXPosHi], a
	ld a, e
	and $0f
	swap a
	add $08
	ldh [hXPosLo], a
	ldh a, [hXPosHi]
	adc $00
	ldh [hXPosHi], a
	ld a, l
	and $01
	xor $01
	ld b, a
	ld [wUnused_ccef], a
	ret

Func_d81::
	ld a, l
	sub $b0
	add a
	ld l, a
	ld a, b
	xor $1
	add l
	ld l, a
	ret

Func_d8c::
	ld a, [wBlockPtrBank]
	ld [wccec], a
	ld b, $01
	ld a, l
	srl a
	jr nc, .asm_d9a
	dec b
.asm_d9a
	add $b0
	ld l, a
	ret
