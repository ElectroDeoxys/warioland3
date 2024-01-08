PlayIntroSFXPlane_Close:
	ld a, [wPlaneWarioXCoord]
	cp SCREEN_WIDTH_PX
	jr nc, PlayIntroSFXPlane3
	cp 112
	jr nc, PlayIntroSFXPlane2
	play_sfx_rept 12, SFX_PLANE1
	ret

PlayIntroSFXPlane2:
	play_sfx_rept 12, SFX_PLANE2
	ret

PlayIntroSFXPlane3:
	play_sfx_rept 12, SFX_PLANE3
	ret

PlayIntroSFXPlane_Far:
	ld a, [wPlaneWarioXCoord]
	cp SCREEN_WIDTH_PX
	jr nc, PlayIntroSFXPlane3
	jr PlayIntroSFXPlane2
