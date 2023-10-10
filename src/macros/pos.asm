MACRO update_pos_y
	ld hl, hYPosHi
	ld de, wWarioYPos
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
ENDM

MACRO get_pos_y
	ld hl, wWarioYPos
	ld de, hYPosHi
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
ENDM

MACRO update_pos_x
	ld hl, hXPosHi
	ld de, wWarioXPos
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
ENDM

MACRO get_pos_x
	ld hl, wWarioXPos
	ld de, hXPosHi
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
ENDM

MACRO update_pos
	ld hl, hPos
	ld de, wWarioPos
REPT 3
	ld a, [hli]
	ld [de], a
	inc de
ENDR
	ld a, [hl]
	ld [de], a
ENDM

MACRO get_pos
	ld hl, wWarioPos
	ld de, hPos
REPT 3
	ld a, [hli]
	ld [de], a
	inc de
ENDR
	ld a, [hl]
	ld [de], a
ENDM
