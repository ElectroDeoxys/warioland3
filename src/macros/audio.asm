MACRO play_music
	ld a, HIGH(\1)
	ldh [hMusicID + 0], a
	ld a, LOW(\1)
	ldh [hMusicID + 1], a
ENDM

MACRO play_music2
	ld a, HIGH(\1)
	ldh [hMusicIDBackup + 0], a
	ldh [hMusicID + 0], a
	ld a, LOW(\1)
	ldh [hMusicIDBackup + 1], a
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
	ldh [hMusicIDBackup + 0], a
	ldh [hMusicID + 0], a
	ld a, $00
	ldh [hMusicIDBackup + 1], a
	ldh [hMusicID + 1], a
ENDM

; plays SFX, optionally pass a condition
MACRO play_sfx
IF _NARG == 2
IF STRCMP("\1", "nz") == 0
	jr z, :+
ELIF STRCMP("\1", "z") == 0
	jr nz, :+
ENDC
SHIFT
ENDC
	ld a, HIGH(\1)
	ldh [hSFXID + 0], a
	ld a, LOW(\1)
	ldh [hSFXID + 1], a
:
ENDM

; repeatedly play a sound
; \1 time between sounds
; \2 SFX_* constant
MACRO play_sfx_rept
	ld a, [wSFXTimer]
	sub 1
	ld [wSFXTimer], a
	jr nc, :+
	ld a, \1
	ld [wSFXTimer], a
	play_sfx \2
:
ENDM

MACRO stop_sfx
	ld a, $ff
	ldh [hSFXID + 0], a
	ld a, $00
	ldh [hSFXID + 1], a
ENDM
