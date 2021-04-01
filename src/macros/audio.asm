load_music: MACRO
	ld a, HIGH(\1)
	ldh [hMusicID + 0], a
	ld a, LOW(\1)
	ldh [hMusicID + 1], a
ENDM

stop_music: MACRO
	ld a, $ff
	ldh [hMusicID + 0], a
	ld a, $00
	ldh [hMusicID + 1], a
ENDM

load_sfx: MACRO
	ld a, HIGH(\1)
	ldh [hSFXID + 0], a
	ld a, LOW(\1)
	ldh [hSFXID + 1], a
ENDM

stop_sfx: MACRO
	ld a, $ff
	ldh [hSFXID + 0], a
	ld a, $00
	ldh [hSFXID + 1], a
ENDM
