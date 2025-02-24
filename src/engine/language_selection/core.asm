LanguageSelection:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, StartOverworldStateAndNewGameParam
	bit D_DOWN_F, a
	jr nz, .d_down
	bit D_UP_F, a
	jr nz, .d_up
	jr .update_anim

.d_down
	ld a, [wLanguage]
	and a
	ret z ; can't go down
	ld a, 86
	ld [wMenuObj1YCoord], a
	xor a
	jr .got_language

.d_up
	ld a, [wLanguage]
	dec a
	ret z ; can't go up
	ld hl, wMenuObj1
	ld a, 70
	ld [wMenuObj1YCoord], a
	ld a, $01

.got_language
	ld [wLanguage], a
	add $80
	ld [wcee4], a
	play_sfx SFX_0E2

.update_anim
	ld hl, wMenuObj1End - 1
	call UpdateObjAnim
	ld hl, wMenuObj1
	call LoadLanguageSelectionSprite
	call ClearUnusedVirtualOAM
	ret
