; decompresses level layout data pointed
; by wCompressedLevelLayoutPtr to SRAM
DecompressLevelLayout:: ; ab5 (0:ab5)
	ld a, [wceef]
	and $3c
	ret nz

	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld a, [wCompressedLevelLayoutPtr + 0]
	ld h, a
	ld a, [wCompressedLevelLayoutPtr + 1]
	ld l, a
	call .Decompress
	pop af
	bankswitch
	pop af
	sramswitch
	ret
; 0xaee

; decompresses level layout data
; - if bit 7 is not set, repeat the following byte that amount of times
; - if bit 7 is set, copy the next amount of bytes literally
; each row is 160 blocks wide
.Decompress:: ; aee (0:aee)
	ld c, LEVEL_WIDTH
	ld de, s1a000
.loop_data
	ld a, [hli]
	and a
	ret z ; done

	bit 7, a
	jr nz, .literal_copy
	ld b, a
	ld a, [hli]
	ld [wc09f], a
.loop_repeat
	ld a, [wc09f]
	ld [de], a
	inc de
	ld a, e
	cp c
	jr z, .next_row_1
.next_repeat
	dec b
	jr nz, .loop_repeat
	jr .loop_data
.next_row_1
	ld e, LOW($a000)
	inc d
	ld a, d
	cp $c0 ; check if already outside SRAM
	jr nz, .skip_sram_switch ; can be .next_repeat
	ld d, HIGH($a000)
	ld a, [wSRAMBank]
	inc a
	sramswitch
.skip_sram_switch
	jr .next_repeat

.literal_copy
	and %01111111
	ld b, a
.loop_copy
	ld a, [hli]
	ld [de], a
	inc de
	ld a, e
	cp c
	jr z, .next_row_2
.next_copy
	dec b
	jr nz, .loop_copy
	jr .loop_data

.next_row_2
	ld e, LOW($a000)
	inc d
	ld a, d
	cp $c0
	jr nz, .next_copy
	ld d, HIGH($a000)
	ld a, [wSRAMBank]
	inc a
	sramswitch
	jr .next_copy
; 0xb48

DecompressLevelObjectsMap:: ; b48 (0:b48)
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld a, [wCompressedLevelLayoutPtr + 0]
	ld h, a
	ld a, [wCompressedLevelLayoutPtr + 1]
	ld l, a
	call .Decompress
	pop af
	bankswitch
	pop af
	sramswitch
	ret
; 0xb7b

.Decompress:: ; b7b (0:b7b)
	ld a, LEVEL_WIDTH
	srl a ; /2
	add $b0
	dec a
	ld c, a
	ld de, s1a000 + $b0
.loop_data
	ld a, [hli]
	and a
	ret z ; done

	bit 7, a
	jr nz, .literal_copy
	ld b, a
	ld a, [hli]
	ld [wc09f], a
.loop_repeat
	ld a, [wc09f]
	ld [de], a
	ld a, e
	cp c
	jr z, .next_row_1
	inc de
.next_repeat
	dec b
	jr nz, .loop_repeat
	jr .loop_data
.next_row_1
	ld e, $b0
	inc d
	ld a, d
	cp $c0 ; check if already outside SRAM
	jr nz, .skip_sram_switch ; can be .next_repeat
	ld d, HIGH($a000)
	ld a, [wSRAMBank]
	inc a
	sramswitch
.skip_sram_switch
	jr .next_repeat

.literal_copy
	and %01111111
	ld b, a
.loop_copy
	ld a, [hli]
	ld [de], a
	ld a, e
	cp c
	jr z, .next_row_2
	inc de
.next_copy
	dec b
	jr nz, .loop_copy
	jr .loop_data
.next_row_2
	ld e, $b0
	inc d
	ld a, d
	cp $c0
	jr nz, .next_copy
	ld d, HIGH($a000)
	ld a, [wSRAMBank]
	inc a
	sramswitch
	jr .next_copy
; 0xbdb
