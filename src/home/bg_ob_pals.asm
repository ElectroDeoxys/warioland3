; copies all BG pals to wTempBGPals
StoreBGPals::
	xor a
	ld e, a
	ld hl, wTempBGPals
	ld b, 8 palettes
	ld c, LOW(rBCPD)
.loop
	ld a, e
	ldh [rBCPS], a
	ld a, [$ff00+c]
	ld [hli], a
	inc e
	dec b
	jr nz, .loop
	ret

; copies all OB pals to wTempOBPals
StoreOBPals::
	xor a
	ld e, a
	ld hl, wTempOBPals
	ld b, 8 palettes
	ld c, LOW(rOCPD)
.loop
	ld a, e
	ldh [rOCPS], a
	ld a, [$ff00+c]
	ld [hli], a
	inc e
	dec b
	jr nz, .loop
	ret

; fills BG palette with just white
FillWhiteBGPal::
	ld hl, PalsWhite
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

; fills OB palette with just white
FillWhiteOBPal::
	ld hl, PalsWhite
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

; unreferenced
Func_1ae2:
	ld hl, PalsWhite
	ld de, wTempBGPals
	ld b, 8 palettes
	call CopyHLToDE
	ld hl, PalsWhite
	ld b, 8 palettes
	call CopyHLToDE
	ret

; hl = palette to copy from Wario Palettes
SetWarioPal::
	ld a, h
	ld [wWarioPalsPtr + 0], a
	ld a, l
	ld [wWarioPalsPtr + 1], a
	ld a, [wROMBank]
	push af
	ld a, BANK("Wario Palettes")
	bankswitch
	push hl
	ld de, wTempPals2
	ld b, 2 palettes
	ld a, BANK("Wario Palettes")
	ldh [hCallFuncBank], a
	hcall CopyHLToDE_Short
	pop hl

	ld a, OCPSF_AUTOINC | palette 0
	ldh [rOCPS], a
	ld b, 2
	ld c, LOW(rOCPD)

; apply OBJ palette
.loop_copy
	wait_ppu_busy
	wait_ppu_free
REPT 1 palettes
	ld a, [hli]
	ld [$ff00+c], a
ENDR
	dec b
	jr nz, .loop_copy

	pop af
	bankswitch
	ret

; loads the palette for the treasure
; that was collected in the level
LoadCollectedTreasurePal_Level::
	push_wram BANK(wLevelTreasurePals)
	ld hl, wLevelEndScreen
	ld a, [hl]
	and $7f
	dec a
	ld c, a
	ld b, $00
	ld hl, wLevelTreasurePals
	add hl, bc
	ld a, [hl]
	sub OBPAL_TREASURE_YELLOW
	add a
	add a
	add a ; *8
	ld e, a
	ld d, b
	ld hl, TreasurePals
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(TreasurePals)
	bankswitch
	push hl
	ld de, wTempPals2 palette 4
	ld a, c
	add a
	add a
	add a
	ld c, a
	add e
	ld e, a
	ld b, 1 palettes
	farcall BANK(TreasurePals), CopyHLToDE_Short ; unneeded farcall
	pop hl
	ld a, OCPSF_AUTOINC | palette 4
	or c
	ldh [rOCPS], a
	ld c, LOW(rOCPD)
	wait_ppu_busy
	wait_ppu_free
; apply OBJ palette
REPT 1 palettes
	ld a, [hli]
	ld [$ff00+c], a
ENDR
	pop af
	bankswitch
	pop_wram
	ret

LoadCollectedTreasurePal_ClearScreen::
	push_wram BANK(wLevelTreasurePals)
	ld hl, wLevelEndScreen
	ld a, [hl]
	and $7f
	dec a
	ld c, a
	ld b, $00
	ld hl, wLevelTreasurePals
	add hl, bc
	ld a, [hl]
	sub OBPAL_TREASURE_YELLOW
	add a
	add a
	add a ; *8
	ld e, a
	ld d, b ; $00
	ld hl, TreasurePals
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(TreasurePals)
	bankswitch
	ld de, wTempPals2 palette 7
	ld b, 1 palettes
	farcall BANK(TreasurePals), CopyHLToDE_Short ; unneeded farcall
	pop af
	bankswitch
	pop_wram
	ret

; b = number of pals
; c = OB palette number
; hl = palette source
; de = OB pals dest
CopyAndApplyOBPals::
	push bc
	push hl
	sla b
	sla b
	sla b ; *8
	call CopyHLToDE_Short
	pop hl
	pop bc
	ld a, c
	add a
	add a
	add a ; *8
	or OCPSF_AUTOINC
	ldh [rOCPS], a
	ld c, LOW(rOCPD)

.loop_copy
	wait_ppu_busy
	wait_ppu_free
REPT 1 palettes
	ld a, [hli]
	ld [$ff00+c], a
ENDR
	dec b
	jr nz, .loop_copy
	ret

ApplyTempPals1ToBGPals::
	ld hl, wTempPals1
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

ApplyTempPals2ToOBPals::
	ld hl, wTempPals2
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
