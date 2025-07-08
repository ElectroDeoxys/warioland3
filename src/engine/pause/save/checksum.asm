; increments 4-byte counter in wSaveCounter
IncrementSaveCounter:
	ld a, [wSaveCounter + 3]
	add 1
	ld [wSaveCounter + 3], a
	ld a, [wSaveCounter + 2]
	adc 0
	ld [wSaveCounter + 2], a
	ld a, [wSaveCounter + 1]
	adc 0
	ld [wSaveCounter + 1], a
	ld a, [wSaveCounter + 0]
	adc 0
	ld [wSaveCounter + 0], a
	ret

Func_1f0b5b:
	ld de, 0
	ld b, $ca
	call CalculateChecksum
	push_wram $02
	ld b, $11
	call CalculateChecksum
	pop_wram
	push_wram BANK("Level Objects WRAM")
	ld bc, SIZEOF("Level Objects WRAM")
	call CalculateChecksumLong
	pop_wram
	ret

; sums b bytes starting at hl
; result is added in de
CalculateChecksum:
.start
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc $00
	ld d, a
	dec b
	jr nz, .start
	ret

; same as CalculateChecksum but
; does checksum for bc bytes instead
; buggy, doesn't loop properly
CalculateChecksumLong:
.start
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc $00
	ld d, a
	dec bc
	ld a, b
	or c
	jr nz, CalculateChecksum ; should be .start
	ret

CalculateWRAMDataChecksum:
	ld de, 0
	ld hl, STARTOF("Progress WRAM")
	ld b, SIZEOF("Progress WRAM") + SIZEOF("Level WRAM")
	call CalculateChecksum

	push_wram BANK("WRAM2")
	ld hl, wTreasuresCollected
	ld b, (wOWLevel - wTreasuresCollected) + 2
	call CalculateChecksum
	pop_wram

	push_wram BANK("Level Objects WRAM")
	ld hl, STARTOF("Level Objects WRAM")
	ld bc, SIZEOF("Level Objects WRAM")
	call CalculateChecksumLong
	pop_wram
	ret

; calculates checksum for SRAM1 and first half of SRAM2
; outputs result in de
CalculateBackupSRAMChecksum1:
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	ld hl, sLevelBlockObjectMap
	ld de, 0
	ld bc, SIZEOF(SRAM)
.loop_sram_1
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a
	dec c
	jr nz, .loop_sram_1
	dec b
	jr nz, .loop_sram_1
	pop af
	sramswitch
	ld a, [wSRAMBank]
	push af

	ld a, BANK("SRAM2")
	sramswitch
	ld hl, s2a000
	ld bc, $1000
.loop_sram_2
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc $00
	ld d, a
	dec c
	jr nz, .loop_sram_2
	dec b
	jr nz, .loop_sram_2
	pop af
	sramswitch
	ret

; calculates checksum for SRAM3 and second half of SRAM2
; outputs result in de
CalculateBackupSRAMChecksum2:
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM3")
	sramswitch
	ld hl, s3a000
	ld de, 0
	ld bc, SIZEOF(SRAM)
.loop_sram_3
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a
	dec c
	jr nz, .loop_sram_3
	dec b
	jr nz, .loop_sram_3
	pop af
	sramswitch
	ld a, [wSRAMBank]
	push af

	ld a, BANK("SRAM2")
	sramswitch
	ld hl, s2b000
	ld bc, $1000
.loop_sram_2
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc $00
	ld d, a
	dec c
	jr nz, .loop_sram_2
	dec b
	jr nz, .loop_sram_2
	pop af
	sramswitch
	ret
