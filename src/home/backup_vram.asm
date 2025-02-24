SaveBackupVRAM::
	push_wram BANK("GFX RAM")
	ld a, [wSCY]
	ld [w3d500], a
	ld a, [wSCX]
	ld [w3d501], a
	ld hl, wTempPals1
	ld de, w3d280
	ld b, 16 palettes
	call CopyHLToDE
	pop_wram

	xor a ; VRAM0
	ldh [rVBK], a
	push_wram BANK("WRAM4")
	ld hl, v0Tiles0
	ld de, w4d000
	ld bc, v0Tiles2 - v0Tiles0
	call CopyHLToDE_BC
	pop_wram

	push_wram BANK("WRAM5")
	ld hl, v0Tiles2
	ld de, w5d000
	ld bc, v0End - v0Tiles2
	call CopyHLToDE_BC
	pop_wram

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	push_wram BANK("WRAM6")
	ld hl, v1Tiles0
	ld de, w6d000
	ld bc, v1Tiles2 - v1Tiles0
	call CopyHLToDE_BC
	pop_wram

	push_wram BANK("WRAM7")
	ld hl, v1Tiles2
	ld de, w7d000
	ld bc, v1End - v1Tiles2
	call CopyHLToDE_BC
	pop_wram

	xor a ; VRAM0
	ldh [rVBK], a
	ret

LoadBackupVRAM::
	push_wram $03
	ld a, [w3d500]
	ld [wSCY], a
	ld a, [w3d501]
	ld [wSCX], a
	ld hl, w3d280
	ld de, wTempPals1
	ld b, 16 palettes
	call CopyHLToDE
	pop_wram
	xor a
	ldh [rVBK], a

	push_wram BANK("WRAM4")
	ld hl, w4d000
	ld de, v0Tiles0
	ld bc, $1000
	call CopyHLToDE_BC
	pop_wram

	push_wram BANK("WRAM5")
	ld hl, w5d000
	ld de, v0Tiles2
	ld bc, $1000
	call CopyHLToDE_BC
	pop_wram

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	push_wram BANK("WRAM6")
	ld hl, w6d000
	ld de, v1Tiles0
	ld bc, $1000
	call CopyHLToDE_BC
	pop_wram

	push_wram BANK("WRAM7")
	ld hl, w7d000
	ld de, v1Tiles2
	ld bc, $1000
	call CopyHLToDE_BC
	pop_wram
	xor a
	ldh [rVBK], a
	ret
