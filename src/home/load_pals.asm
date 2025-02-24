LoadBGPalettesFromWRAM::
	ld hl, wTempBGPals
	ld a, BCPSF_AUTOINC | palette 0
	ldh [rBCPS], a
	ld b, 8 palettes
	ld c, LOW(rBCPD)
.loop
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .loop
	ret

LoadOBPalettesFromWRAM::
	ld hl, wTempOBPals
	ld a, OCPSF_AUTOINC | palette 0
	ldh [rOCPS], a
	ld b, 8 palettes
	ld c, LOW(rOCPD)
.loop
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .loop
	ret

; copies hl to wTempPals1
LoadPalsToTempPals1::
	ld de, wTempPals1
	ld b, 8 palettes
.loop
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, .loop
	ret

; copies hl to wTempPals2
LoadPalsToTempPals2::
	ld de, wTempPals2
	ld b, 8 palettes
.loop
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, .loop
	ret

; copies b bytes from hl to de
; given that e doesn't overflow
CopyHLToDE_Short::
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, CopyHLToDE_Short
	ret

; copies hl to wTempPals2
LoadObjPals::
	ld de, wTempPals2 palette 4
	ld b, 4 palettes
.loop
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, .loop
	ret
