TickLevelTime:
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	ret z
	ld a, [wLevelEndScreen]
	and a
	ret nz
	ld a, [wLevelTime + 2]
	add 1
	daa
	ld [wLevelTime + 2], a
	cp $60
	ret c
	xor a
	ld [wLevelTime + 2], a
	ld a, [wLevelTime + 1]
	add 1
	daa
	ld [wLevelTime + 1], a
	cp $60
	ret c
	xor a
	ld [wLevelTime + 1], a
	ld a, [wLevelTime + 0]
	add 1
	daa
	ld [wLevelTime + 0], a
	cp $60
	ret c
	ld a, $59
	ld [wLevelTime + 0], a
	ld [wLevelTime + 1], a
	ret
