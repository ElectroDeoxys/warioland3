SelectLevel:
	ldh a, [rSVBK]
	push af
	ld a, 2 ; WRAM2
	ldh [rSVBK], a
	ld a, [wOWLevel]
	and a
	jr z, .the_temple
	cp LEVEL_GOLF_BUILDING
	jr z, .golf_building

	dec a
	add a
	add a
	add a ; *8
	ld [wLevel], a
	ld e, a
	ld d, $00
	ld hl, LevelTreasureRequirements
	add hl, de
	ld a, [hli]

	push hl
	call IsTreasureCollected
	pop hl
	ld c, a
	ld a, [hli]
	push hl
	call IsTreasureCollected
	pop hl
	and c
	jr nz, .variant_4

	ld a, [hli]
	push hl
	call IsTreasureCollected
	pop hl
	ld c, a
	ld a, [hli]
	push hl
	call IsTreasureCollected
	pop hl
	and c
	jr nz, .variant_3

	ld a, [hli]
	push hl
	call IsTreasureCollected
	pop hl
	ld c, a
	ld a, [hli]
	push hl
	call IsTreasureCollected
	pop hl
	and c
	jr nz, .variant_2

.day_night
; all levels have 4 states for day and night respectively
; setting bit 2 yields the night time levels
	ld a, [wDayNight]
	and %1
	add a
	add a ; *4
	ld b, a
	ld a, [wLevel]
	or b
	ld [wLevel], a
	pop af
	ldh [rSVBK], a
	ret

.variant_4
	ld a, [wLevel]
	add 3
	ld [wLevel], a
	jr .day_night

.variant_3
	ld a, [wLevel]
	add 2
	ld [wLevel], a
	jr .day_night

.variant_2
	ld a, [wLevel]
	inc a ; add 1
	ld [wLevel], a
	jr .day_night

.the_temple
	ld a, THE_TEMPLE
	jr .got_level
.golf_building
	ld a, GOLF_BUILDING
.got_level
	ld [wLevel], a
	pop af
	ldh [rSVBK], a
	ret
