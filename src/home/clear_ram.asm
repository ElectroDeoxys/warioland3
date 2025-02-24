; clear VRAM if hCGB != 0
ClearVRAM::
	ldh a, [hCGB]
	and a
	ret z

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	xor a
	ld hl, STARTOF("VRAM1")
	ld bc, SIZEOF("VRAM1")
	call WriteAToHL_BCTimes

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, STARTOF("VRAM0")
	ld bc, SIZEOF("VRAM0")
	jp WriteAToHL_BCTimes

ClearWRAM::
	ld e, 1 ; WRAM1
.loop
	ld a, e
	ldh [rSVBK], a
	xor a
	ld hl, $d000
	ld bc, $1000
	call WriteAToHL_BCTimes
	inc e
	bit 3, e
	jr z, .loop
	xor a ; WRAM0
	ldh [rSVBK], a
	ret
