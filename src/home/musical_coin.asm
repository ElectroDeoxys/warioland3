; return nz if level has had all its
; Musical Coins collected already
CheckLevelMusicalCoinFlag::
	farcall _CheckLevelMusicalCoinFlag
	ld a, b
	and a
	ret

ResumeNormalVolume::
	; resume normal volume level
	ld a, AUDIOMOD_VOLUME
	ld b, 1.0q6 ; volume modifier
	ld d, SFX_CHANNELS ; sfx channels
	ld e, MUSIC_CHANNELS >> 4 ; music channels
	call ExecuteAudioMod
	call UpdateAudio
	ret

; returns nz if has all the levels
; with their corresponding Musical Coin flag set
CheckHasAllMusicalCoinFlags::
	ld hl, wMusicalCoinFlags
	ld c, 3
.loop_bytes
	ld b, 8
	ld a, [hli]
.loop_flags
	rrca
	jr nc, .false
	dec b
	jr nz, .loop_flags
	dec c
	jr nz, .loop_bytes
	; 1 bit still missing
	ld a, [hl]
	rrca
	jr nc, .false
	ld a, TRUE
	ret
.false
	xor a ; FALSE
	ret
