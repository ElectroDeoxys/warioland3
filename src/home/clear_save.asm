; clears some SRAM stuff
ClearSaveData::
	xor a
	ld hl, sCheckVals
	ld b, $8
	call WriteAToHL_BTimes

	ld hl, sBackupCheckVals
	ld b, $8
	call WriteAToHL_BTimes

	ld hl, s0a000
	ld b, $8
	call WriteAToHL_BTimes

	ld hl, s0a800
	ld b, $8
	call WriteAToHL_BTimes

	ld hl, s0a400
	ld b, $8
	call WriteAToHL_BTimes

	ld hl, s0ac00
	ld b, $8
	call WriteAToHL_BTimes

	ld a, $00
	ldh [hUnused_fffd], a
	jp Init
