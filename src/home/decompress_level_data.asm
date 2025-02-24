; decompresses level block mao data pointed
; by wCompressedLevelBlockMapPtr to SRAM
DecompressLevelBlockMap::
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
	ld a, [wCompressedLevelBlockMapPtr + 0]
	ld h, a
	ld a, [wCompressedLevelBlockMapPtr + 1]
	ld l, a
	call .Decompress
	pop af
	bankswitch
	pop af
	sramswitch
	ret

; decompresses level block map data
; - if bit 7 is not set, repeat the following byte that amount of times
; - if bit 7 is set, copy the next amount of bytes literally
; each row is 160 blocks wide
.Decompress:
	ld c, LEVEL_WIDTH
	ld de, sLevelBlockObjectMap
.loop_data
	ld a, [hli]
	and a
	ret z ; done

	bit 7, a
	jr nz, .literal_copy

	; repeat for given number of rows
	ld b, a ; num rows
	ld a, [hli]
	ld [wRepeatByte], a
.loop_repeat
	ld a, [wRepeatByte]
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
	ld e, LOW(STARTOF(SRAM))
	inc d
	ld a, d
	cp $c0 ; check if already outside SRAM
	jr nz, .skip_sram_switch ; can be .next_repeat
	ld d, HIGH(STARTOF(SRAM))
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
	ld e, LOW(STARTOF(SRAM))
	inc d
	ld a, d
	cp $c0
	jr nz, .next_copy
	ld d, HIGH(STARTOF(SRAM))
	ld a, [wSRAMBank]
	inc a
	sramswitch
	jr .next_copy

DecompressLevelObjectMap::
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld a, [wCompressedLevelBlockMapPtr + 0]
	ld h, a
	ld a, [wCompressedLevelBlockMapPtr + 1]
	ld l, a
	call .Decompress
	pop af
	bankswitch
	pop af
	sramswitch
	ret

.Decompress::
	ld a, LEVEL_WIDTH
	srl a ; /2
	add $b0
	dec a
	ld c, a ; (LEVEL_WIDTH / 2) + $b0 - 1
	ld de, sLevelBlockObjectMap + $b0
.loop_data
	ld a, [hli]
	and a
	ret z ; done

	bit 7, a
	jr nz, .literal_copy
	ld b, a
	ld a, [hli]
	ld [wRepeatByte], a
.loop_repeat
	ld a, [wRepeatByte]
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
	ld e, LOW(STARTOF(SRAM)) + $b0
	inc d
	ld a, d
	cp $c0 ; check if already outside SRAM
	jr nz, .skip_sram_switch ; can be .next_repeat
	ld d, HIGH(STARTOF(SRAM))
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
	ld e, LOW(STARTOF(SRAM)) + $b0
	inc d
	ld a, d
	cp $c0
	jr nz, .next_copy
	ld d, HIGH(STARTOF(SRAM))
	ld a, [wSRAMBank]
	inc a
	sramswitch
	jr .next_copy

GetBlockPtr::
; y position
	; computes value, given 2-byte y coordinate in [hl]
	; transforms 2-byte value 0xXWYZ into 1-byte value 0xWY
	ld a, [hli] ; hi
	ld d, a
	ld a, [hli] ; lo
	swap a
	and $0f ; high nybble
	ld b, a
	ld a, d
	and $0f ; low nybble
	swap a
	add b

	ld b, BANK("SRAM1")
	add HIGH(sLevelBlockObjectMap)
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr c, .got_sram_bank
	inc b
	sub $20
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr c, .got_sram_bank
	inc b
	sub $20
.got_sram_bank
	ld [wBlockPtr + 0], a
	ld a, b
	ld [wBlockPtrBank], a

; x position
	; computes value, given 2-byte x coordinate in [hl]
	; transforms 2-byte value 0xXWYZ into 1-byte value 0xWY
	ld a, [hli] ; hi
	ld d, a
	ld a, [hl] ; lo
	swap a
	and $0f ; high nybble
	ld l, a
	ld a, d
	and $0f ; low nybble
	swap a
	add l
	ld l, a
	ld [wBlockPtr + 1], a

	ld a, [wBlockPtr + 0]
	ld h, a
	ret

; hl = block ptr
GetBlockPtrBGMapAddress::
	ld a, h
	sub HIGH(STARTOF(SRAM))
	ld e, a
	ld d, $00
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d ; *$40
	ld a, d
	and $03
	ld d, a
	ld a, l
	and $0f
	add a
	ld l, a
	ld h, HIGH(v0BGMap0)
	add hl, de
	ld a, h
	ld [wBGPtr + 0], a
	ld a, l
	ld [wBGPtr + 1], a
	ret
