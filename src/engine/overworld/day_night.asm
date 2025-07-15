; switches day/night in the overworld
; except if it's the East side and
; the Sun Medallion hasn't been collected yet
DoDayNightSpell:
	ld a, [wCurMapSide]
	cp EAST
	jr nz, SwitchDayNight
	; east side
	ld a, [wGotSunMedallion]
	and a
	jr nz, SwitchDayNight
	ld hl, wDayNight
	res 4, [hl]
	ret

; flips bit 4 of wDayNight
SwitchDayNight:
	ld hl, wDayNight
	ld a, $1 << 4
	xor [hl]
	ld [hl], a
	ret
