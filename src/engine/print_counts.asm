; hl = BG map address
PrintNumberCoins::
	ld bc, -BG_MAP_WIDTH
	ld de, BG_MAP_WIDTH
	ld a, [wNumCoins]
	and $0f ; hundreds
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [wNumCoins + 1]
	swap a
	and $0f ; tens
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [wNumCoins + 1]
	and $0f ; ones
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ret

; sets flags in wKeyAndTreasureFlags
; corresponding to the collected treasures
; in wOWLevel
GetOWLevelCollectedTreasures::
	xor a
	ld [wKeyAndTreasureFlags], a
	push_wram BANK(wOWLevel)
	ld a, [wOWLevel]
	dec a
	call .SetFlags
	pop_wram
	ret

.SetFlags:
	add a
	add a ; *4
	ld e, a
	ld d, $00
	ld hl, LevelTreasureIDs + NUM_LEVEL_TREASURES
	add hl, de
	ld a, [hli]
	push hl
	call IsTreasureCollected
	jr z, .red
	ld hl, wKeyAndTreasureFlags
	set GREY_TREASURE_F, [hl]
.red
	pop hl
	ld a, [hli]
	push hl
	call IsTreasureCollected
	jr z, .green
	ld hl, wKeyAndTreasureFlags
	set RED_TREASURE_F, [hl]
.green
	pop hl
	ld a, [hli]
	push hl
	call IsTreasureCollected
	jr z, .blue
	ld hl, wKeyAndTreasureFlags
	set GREEN_TREASURE_F, [hl]
.blue
	pop hl
	ld a, [hli]
	push hl
	call IsTreasureCollected
	jr z, .done
	ld hl, wKeyAndTreasureFlags
	set BLUE_TREASURE_F, [hl]
.done
	pop hl
	ret

PrintNumCollectedTreasures::
	ld bc, -BG_MAP_WIDTH
	ld de, BG_MAP_WIDTH

	; hundreds
	ld a, [wNumCollectedTreasures + 0]
	and $0f
	add a ; *2
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc

	; tens
	ld a, [wNumCollectedTreasures + 1]
	swap a
	and $0f
	add a ; *2
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc

	; ones
	ld a, [wNumCollectedTreasures + 1]
	and $0f
	add a ; *2
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ret
