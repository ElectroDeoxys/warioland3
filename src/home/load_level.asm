InvalidLevelData::
	jp Init

; loads data related to the level block and object map
; and stores them in SRAM
LoadLevelBlockMapAndObjects::
	ld d, $00
	ld a, [wLevel]
	add a ; *2
	ld e, a
	rl d
	ld hl, LevelHeaders
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(LevelHeaders)
	bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	inc a
	jr z, InvalidLevelData ; null

	ld a, [hli]
	ld [wCompressedLevelBlockMapPtr + 1], a
	ld a, [hli]
	ld [wCompressedLevelBlockMapPtr + 0], a
	ld a, [hl]
	ld [wTempBank], a
	push hl
	call DecompressLevelBlockMap
	pop hl

	ld a, [hli]
	ld [wTempBank], a
	ld a, [hli]
	ld [wCompressedLevelBlockMapPtr + 1], a
	ld a, [hl]
	ld [wCompressedLevelBlockMapPtr + 0], a
	pop af
	bankswitch
	push hl
	ld a, [wceef]
	and %111100
	jr nz, .skip_loading_objects
	call DecompressLevelObjectMap
.skip_loading_objects
	pop hl
	ret

ReloadLevelObjects::
	ld d, $00
	ld a, [wLevel]
	add a ; *2
	ld e, a
	rl d
	ld hl, LevelHeaders
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(LevelHeaders)
	bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	inc a
	jp z, InvalidLevelData ; null

	ld a, [hli]
	ld [wCompressedLevelBlockMapPtr + 1], a
	ld a, [hli]
	ld [wCompressedLevelBlockMapPtr + 0], a
	ld a, [hl]
	ld [wTempBank], a
	pop af
	bankswitch
	call .DecompressLevelBlockMap_OnlyHighBit
	ret

; almost identical to DecompressLevelBlockMap
; but instead only copies over the highest bit
.DecompressLevelBlockMap_OnlyHighBit:
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
	ld d, a
	ld a, [wCompressedLevelBlockMapPtr + 1]
	ld e, a
	call .Decompress
	pop af
	bankswitch
	pop af
	sramswitch
	ret

.Decompress
	ld c, LEVEL_WIDTH
	ld hl, sLevelBlockObjectMap
.loop_data
	ld a, [de]
	and a
	ret z ; done
	bit 7, a
	jr nz, .asm_f85

	ld b, a ; num rows
	inc de
	ld a, [de]
	and $80
	ld [wRepeatByte], a
	inc de
.asm_f61
	ld a, [wRepeatByte]
	or [hl]
	ld [hli], a
	ld a, l
	cp c
	jr z, .next_row_1
.next_repeat
	dec b
	jr nz, .asm_f61
	jr .loop_data
.next_row_1
	ld l, LOW(STARTOF(SRAM))
	inc h
	ld a, h
	cp $c0 ; check if already outside SRAM
	jr nz, .skip_sram_switch
	ld h, HIGH(STARTOF(SRAM))
	ld a, [wSRAMBank]
	inc a
	sramswitch
.skip_sram_switch
	jr .next_repeat

.asm_f85
	and %01111111
	ld b, a
	inc de
.loop_copy
	ld a, [de]
	and $80
	or [hl]
	ld [hli], a
	inc de
	ld a, l
	cp c
	jr z, .asm_f98
.asm_f93
	dec b
	jr nz, .loop_copy
	jr .loop_data
.asm_f98
	ld l, LOW(STARTOF(SRAM))
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_f93
	ld h, HIGH(STARTOF(SRAM))
	ld a, [wSRAMBank]
	inc a
	sramswitch
	jr .asm_f93
