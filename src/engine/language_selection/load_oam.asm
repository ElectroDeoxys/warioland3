LoadLanguageSelectionSprite:
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	add OAM_Y_OFS
	sub b
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	add OAM_X_OFS
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, OAM_75c3
	call LoadSprite
	ret
