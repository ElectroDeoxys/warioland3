LoadCreditsMusicBoxSprite::
	ld a, [hli]
	add OAM_Y_OFS
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	add OAM_X_OFS
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld a, [wCreditsMusicBoxOAMBank]
	ld [wTempBank], a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld a, [wCreditsMusicBoxOAMPtr + 0]
	ld h, a
	ld a, [wCreditsMusicBoxOAMPtr + 1]
	ld l, a
	call LoadSprite
	pop af
	bankswitch
	ret

EmptyOAMFrame::
	db $80
