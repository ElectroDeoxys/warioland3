; de = scene obj
; c = level index in wCurMapSide
SetObjPositionToLevelCoords:
	ld a, c
	push de
	call GetMapLevelCoords
	pop de
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	ret

InitTreasureCollection:
	farcall _InitTreasureCollection
	ret

TreasureCollection:
	farcall _TreasureCollection
	ret
