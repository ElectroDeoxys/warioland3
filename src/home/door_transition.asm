DoorTransition::
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [w3d506]
	ld c, a
	ld a, [wPalFadeCounter]
	or c
	jr nz, .asm_95e

	ld a, $01
	ld [wUnused_c186], a
	call VBlank_9cb
	ld a, [w3d506]
	xor $1
	ld [w3d506], a
	ld a, $01
	ld [w3d503], a
	ld a, [w3d507 + 0]
	ld [w3d504 + 0], a
	ld a, [w3d507 + 1]
	ld [w3d504 + 1], a

.done
	pop af
	ldh [rSVBK], a
	ret

.asm_95e
	ld a, [w3d506]
	xor $1
	ld [w3d506], a
	jr z, .asm_96d
	call .Func_9a3
	jr .done
.asm_96d
	ld hl, wPalFadeCounter
	inc [hl]
	ld a, [hl]
	cp $11
	jr c, .done

	di
	ld hl, wBackupVBlankFunc
	ld de, wVBlankFunc
	ld b, 3
	call CopyHLToDE
	ei

	xor a
	ld [wPalFadeCounter], a
	ld [wUnused_c186], a
	ld [w3d506], a
	stop_music
	stop_sfx
	ld hl, wSubState
	inc [hl]
	jr .done

.Func_9a3:
	ld a, [wPalFadeCounter]
	cp $10
	ret nc
	ld hl, w3d503
	ld a, [hl]
	add $02
	ld [hli], a
	ld a, [hl] ; w3d504
	add $20
	ld [hli], a
	ld a, [hl]
	adc $00
	cp $9c
	jr c, .asm_9bd
	sub $04
.asm_9bd
	ld [hld], a
	ld a, [hl]
	dec a
	ld [hl], a
	and $1f
	cp $1f
	ret nz
	ld a, [hl]
	add $20
	ld [hl], a
	ret

VBlank_9cb::
	di
	ld hl, wVBlankFunc
	ld de, wBackupVBlankFunc
	ld b, 3
	call CopyHLToDE

	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ei
	ret

.Func:
	jp .asm_9e7
.end

.asm_9e7
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a

	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld de, -BG_MAP_WIDTH
	ld a, [w3d506]
	and a
	jr z, .asm_a49
	ld hl, w3d503
	ld a, [hli]
	ld b, a
	ld c, a
	ld a, [hli] ; w3d504
	ld h, [hl]
	ld l, a
.asm_a0a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [hl]
	and $7f
	or $0f
	ld [hl], a
	xor a
	ldh [rVBK], a
	ld [hl], $7f
	add hl, de
	ld a, h
	cp HIGH(v0BGMap0)
	jr nc, .asm_a22
	add $4
	ld h, a
.asm_a22
	dec b
	jr nz, .asm_a0a
	ld b, c
	inc b
.asm_a27
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [hl]
	and $7f
	or $0f
	ld [hl], a
	xor a
	ldh [rVBK], a
	ld a, $7f
	ld [hli], a
	ld a, l
	and $1f
	jr nz, .asm_a44
	ld a, l
	sub BG_MAP_WIDTH
	ld l, a
	ld a, h
	sbc $00
	ld h, a
.asm_a44
	dec b
	jr nz, .asm_a27
	jr .asm_a8e

.asm_a49
	ld hl, w3d503
	ld a, [hli]
	ld b, a
	ld c, a
	ld a, [hli] ; w3d504
	ld h, [hl]
	ld l, a
.asm_a52
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [hl]
	and $7f
	or $0f
	ld [hl], a
	xor a
	ldh [rVBK], a
	ld a, $7f
	ld [hli], a
	ld a, l
	and $1f
	jr nz, .asm_a6f
	ld a, l
	sub BG_MAP_WIDTH
	ld l, a
	ld a, h
	sbc $00
	ld h, a
.asm_a6f
	dec b
	jr nz, .asm_a52
	ld b, c
.asm_a73
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [hl]
	and $7f
	or $0f
	ld [hl], a
	xor a
	ldh [rVBK], a
	ld [hl], $7f
	add hl, de
	ld a, h
	cp HIGH(v0BGMap0)
	jr nc, .asm_a8b
	add $4
	ld h, a
.asm_a8b
	dec b
	jr nz, .asm_a73
.asm_a8e
	pop af
	ldh [rSVBK], a
	ret
