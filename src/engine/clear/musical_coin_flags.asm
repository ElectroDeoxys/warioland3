Func_d47f1:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, wMusicalCoinFlags
	lb bc, (NUM_LEVELS / 8), 8
	debgcoord 8, 9
	ld a, -1
	ldh [hffa0], a
.loop_bits
	ldh a, [hffa0]
	inc a
	ldh [hffa0], a
	rrc [hl]
	call c, .ApplyBGPal
	inc e
	ld a, e
	and $1f
	cp 13
	jr nz, .next_bit
	ld a, e
	add BG_MAP_WIDTH - 5
	ld e, a
.next_bit
	dec c
	jr nz, .loop_bits
	inc hl ; next byte in wMusicalCoinFlags
	ld c, 8
	dec b
	jr nz, .loop_bits
	bit 0, [hl]
	call nz, .ApplyBGPal
	xor a
	ldh [rVBK], a
	ret

.ApplyBGPal:
	push bc
	push hl
	ldh a, [hffa0]
	ld c, a
	ld b, $00
	ld hl, MusicalCoinLevelBGPals
	add hl, bc
	ld a, [hl]
	ld [de], a
	pop hl
	pop bc
	ret

SetMusicalCoinFlag:
	ld a, [wLevel]
	srl a
	srl a
	srl a
	ld c, a
	ld [wAllMusicalCoinsLevel], a ; LEVEL_* constant
	srl a
	srl a
	srl a
	ld e, a ; /8
	ld d, $00
	ld hl, wMusicalCoinFlags
	add hl, de
	ld a, c
	and %111
	ld c, a
	jr z, .got_flag
.rotate_flags_right
	rrc [hl]
	dec c
	jr nz, .rotate_flags_right
.got_flag
	bit 0, [hl]
	jr z, .set_flag
	; already set
	push af
	ld a, $ff
	ld [wAllMusicalCoinsLevel], a
	pop af
	jr .restore_flags
.set_flag
	set 0, [hl]
.restore_flags
	and a
	ret z ; no need to rotate back
.rotate_flags_left
	rlc [hl]
	dec a
	jr nz, .rotate_flags_left
	ret

; check if a bit is set in wMusicalCoinFlags
; for the level in wOWLevel
_CheckLevelMusicalCoinFlag::
	ld hl, wMusicalCoinFlags
	ld a, [wOWLevel]
	dec a
	ld c, a
	srl a
	srl a
	srl a ; /8
	ld e, a
	ld d, $00
	add hl, de
	ld a, c
	and %111
	ld c, a
	jr z, .check_flag
.loop_1
	rrc [hl]
	dec c
	jr nz, .loop_1
.check_flag
	ld c, a
	bit 0, [hl]
	jr nz, .flag_set
	ld b, FALSE
	jr .got_result
.flag_set
	ld b, TRUE
.got_result
	ld a, c
	and a
	ret z
.loop_2
	rlc [hl]
	dec a
	jr nz, .loop_2
	ret
