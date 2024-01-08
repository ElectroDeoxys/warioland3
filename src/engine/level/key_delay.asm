; pauses game for 100 ticks
CollectKeyDelay:
	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp 100
	ret c
	ld [hl], 0
	ld a, ST_LEVEL
	ld [wState], a
	ret
