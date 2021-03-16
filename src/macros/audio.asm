load_sound: MACRO
	ld a, HIGH(\1)
	ldh [hSoundID + 0], a
	ld a, LOW(\1)
	ldh [hSoundID + 1], a
ENDM
