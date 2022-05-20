MACRO play_music
	ld a, HIGH(\1)
	ldh [hMusicID + 0], a
	ld a, LOW(\1)
	ldh [hMusicID + 1], a
ENDM

MACRO play_music2
	ld a, HIGH(\1)
	ldh [hffb3], a
	ldh [hMusicID + 0], a
	ld a, LOW(\1)
	ldh [hffb4], a
	ldh [hMusicID + 1], a
ENDM

MACRO stop_music
	ld a, $ff
	ldh [hMusicID + 0], a
	ld a, $00
	ldh [hMusicID + 1], a
ENDM

MACRO stop_music2
	ld a, $ff
	ldh [hffb3], a
	ldh [hMusicID + 0], a
	ld a, $00
	ldh [hffb4], a
	ldh [hMusicID + 1], a
ENDM

MACRO play_sfx
	ld a, HIGH(\1)
	ldh [hSFXID + 0], a
	ld a, LOW(\1)
	ldh [hSFXID + 1], a
ENDM

MACRO stop_sfx
	ld a, $ff
	ldh [hSFXID + 0], a
	ld a, $00
	ldh [hSFXID + 1], a
ENDM
