HandleOverworld:
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	farcall OverworldStateTable
	pop af
	ldh [rSVBK], a

	; if a level has been selected
	; handle the transition
	ld hl, wState
	ld a, [hl]
	cp ST_LEVEL
	ret nz
	play_sfx SFX_SELECTION
	call SelectLevel
	ld a, [wLevel]
	cp GOLF_BUILDING
	jr z, .golf_building
	cp THE_TEMPLE
	jr z, .the_temple
	ret

.golf_building
	ld a, ST_GOLF_BUILDING
	ld [wState], a
	ret

.the_temple
	stop_sfx
	ret
