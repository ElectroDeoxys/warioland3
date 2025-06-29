; return nz if level has had all its
; Musical Coins collected already
CheckLevelMusicalCoinFlag::
	farcall _CheckLevelMusicalCoinFlag
	ld a, b
	and a
	ret

Func_1795::
PUSHO Q.4
	ld a, $02
	ld b, 4.0
	ld d, $0f
	ld e, $0f
	call Func_102c
POPO
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
