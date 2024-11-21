UpdateNumCollectedTreasures:
	push_wram BANK(wTreasuresCollected)
	xor a
	ld [wNumCollectedTreasures + 1], a
	ld [wNumCollectedTreasures + 0], a
	ld a, NUM_TREASURES - 1
.loop_treasures
	push af
	call IsTreasureCollected
	and a
	jr z, .next_treasure
	ld a, [wNumCollectedTreasures + 1]
	add 1
	daa
	ld [wNumCollectedTreasures + 1], a
	ld a, [wNumCollectedTreasures + 0]
	adc 0
	daa
	ld [wNumCollectedTreasures + 0], a
.next_treasure
	pop af
	dec a
	jr nz, .loop_treasures
	pop_wram
	ret
