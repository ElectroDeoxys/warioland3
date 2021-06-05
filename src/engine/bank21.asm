	INCROM $84000, $854c7

Func_854c7: ; 854c7 (21:54c7)
	ld hl, w2d0d6
	jr Func_854cf

Func_854cc: ; 854cc (21:54cc)
	ld hl, w2d0d0
;	fallthrough

Func_854cf: ; 854cf (21:54cf)
	ld c, [hl]
	xor a
	ld [hli], a
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld l, [hl]
	ld h, a
.loop
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .loop
	ret
; 0x854ee

	INCROM $854ee, $86b5d
