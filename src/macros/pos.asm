MACRO update_pos_y
	ld hl, hYPosHi
	ld de, wYPosHi
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
ENDM

MACRO get_pos_y
	ld hl, wYPosHi
	ld de, hYPosHi
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
ENDM

MACRO update_pos_x
	ld hl, hXPosHi
	ld de, wXPosHi
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
ENDM

MACRO get_pos_x
	ld hl, wXPosHi
	ld de, hXPosHi
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
ENDM

MACRO update_pos
	ld hl, hPos
	ld de, wPos
REPT 3
	ld a, [hli]
	ld [de], a
	inc de
ENDR
	ld a, [hl]
	ld [de], a
ENDM

MACRO get_pos
	ld hl, wPos
	ld de, hPos
REPT 3
	ld a, [hli]
	ld [de], a
	inc de
ENDR
	ld a, [hl]
	ld [de], a
ENDM
