; clears whole wVirtualOAM
ClearVirtualOAM::
	ld hl, wVirtualOAM
	ld b, NUM_SPRITE_OAM_STRUCTS * SPRITEOAMSTRUCT_LENGTH
	xor a
	call WriteAToHL_BTimes
	xor a
	ld [wVirtualOAMByteSize], a
	ret

ClearBGMap0::
	ld a, $ff
	jr FillBGMap0

; fills v0BGMap0 and v1BGMap0 with $7f
FillBGMap0_With7f::
	ld a, $7f
	; fallthrough

; fills v0BGMap0 and v1BGMap0 with byte in a
FillBGMap0::
	ld d, a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, v1BGMap0
	ld bc, v1BGMap1 - v1BGMap0
	xor a
	call WriteAToHL_BCTimes

	ldh [rVBK], a ; VRAM0
	ld a, d
	ld hl, v0BGMap0
	ld bc, v0BGMap1 - v0BGMap0
	call WriteAToHL_BCTimes
	ret

ClearBGMap1::
	ld a, $ff
	ld hl, v0BGMap1
	ld bc, v0End - v0BGMap1
	call WriteAToHL_BCTimes
	ret

; clears unused sprites that are in wVirtualOAM
ClearUnusedVirtualOAM::
	ld a, [wVirtualOAMByteSize]
	ld l, a
	ld h, HIGH(wVirtualOAM)
	ld a, NUM_SPRITE_OAM_STRUCTS * SPRITEOAMSTRUCT_LENGTH
	sub l
	jr z, .done
	jr c, .done
	srl a ; a / 2
	srl a ; a / 4
	ld b, a ; number of OAM structs to clear

	xor a
.loop
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec b
	jr nz, .loop
.done
	xor a
	ld [wVirtualOAMByteSize], a
	ret
