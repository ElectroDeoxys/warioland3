; if wSwitchStateUpdated is set, then update blocks
; this update revolves around the assumption that
; if $8 is added to the block, then it corresponds
; to a new block for its off state, and subtracting $8
; will revert it to a block corresponding to on state
UpdateSwitchableBlocks:
	ld a, [wSwitchStateUpdated]
	and a
	ret z
	xor a
	ld [wSwitchStateUpdated], a
	ld a, [wSwitchState]
	cp $68
	jr z, .switch_on

; switch off
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	ld hl, sLevelBlockObjectMap
.loop_1
	ld a, [hli]
	and $7f
	cp $60
	jr c, .next_block_1
	cp $68
	jr nc, .next_block_1
	; between $60 and $67
	dec l
	ld a, [hl]
	add $08
	ld [hli], a
.next_block_1
	ld a, l
	cp LEVEL_WIDTH
	jr c, .loop_1
	ld l, $00
	inc h
	ld a, h
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, .loop_1
	pop af
	sramswitch

	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM2")
	sramswitch
	ld hl, s2a000
.loop_2
	ld a, [hli]
	and $7f
	cp $60
	jr c, .next_block_2
	cp $68
	jr nc, .next_block_2
	dec l
	ld a, [hl]
	add $08
	ld [hli], a
.next_block_2
	ld a, l
	cp LEVEL_WIDTH
	jr c, .loop_2
	ld l, $00
	inc h
	ld a, h
	cp $b0
	jr nz, .loop_2
	pop af
	sramswitch
	ret

.switch_on
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	ld hl, sLevelBlockObjectMap
.loop_3
	ld a, [hli]
	and $7f
	cp $68
	jr c, .next_block_3
	cp $70
	jr nc, .next_block_3
	dec l
	ld a, [hl]
	sub $08
	ld [hli], a
.next_block_3
	ld a, l
	cp LEVEL_WIDTH
	jr c, .loop_3
	ld l, $00
	inc h
	ld a, h
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr nz, .loop_3
	pop af
	sramswitch

	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM2")
	sramswitch
	ld hl, s2a000
.loop_4
	ld a, [hli]
	and $7f
	cp $68
	jr c, .next_block_4
	cp $70
	jr nc, .next_block_4
	dec l
	ld a, [hl]
	sub $08
	ld [hli], a
.next_block_4
	ld a, l
	cp LEVEL_WIDTH
	jr c, .loop_4
	ld l, $00
	inc h
	ld a, h
	cp $b0
	jr nz, .loop_4
	pop af
	sramswitch
	ret
