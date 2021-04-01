update_pos_y: MACRO
	ld hl, hYPosHi
	ld de, wYPosHi
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
ENDM

get_pos_y: MACRO
	ld hl, wYPosHi
	ld de, hYPosHi
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
ENDM

update_pos_x: MACRO
	ld hl, hXPosHi
	ld de, wXPosHi
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
ENDM

get_pos_x: MACRO
	ld hl, wXPosHi
	ld de, hXPosHi
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
ENDM

update_pos: MACRO
	ld hl, hPos
	ld de, wPos
rept 3
	ld a, [hli]
	ld [de], a
	inc de
endr
	ld a, [hl]
	ld [de], a
ENDM

get_pos: MACRO
	ld hl, wPos
	ld de, hPos
rept 3
	ld a, [hli]
	ld [de], a
	inc de
endr
	ld a, [hl]
	ld [de], a
ENDM
