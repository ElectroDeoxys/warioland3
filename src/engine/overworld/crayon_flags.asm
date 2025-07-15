; gets from wTreasuresCollected the flags
; related to the crayon treasures
; and saves it in wCrayonFlags
GetCrayonFlags:
	ld hl, wTreasuresCollected + (CRAYON_YELLOW_T / 8)
	ld a, [hld]
	ld c, [hl]
	sla c
	rla
	sla c
	rla
	res 7, a
	ld [wCrayonFlags], a
	ret
