VBlank_LanguageSelection:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, [wcee4]
	bit 7, a
	jr z, .skip
	and $7f
	dec a
	jr z, .english
; japanese
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	hlbgcoord 5, 7
	ld b, 13
	ld a, $07
	call WriteAToHL_BTimes
	hlbgcoord 5, 9
	ld b, 13
	ld a, $06
	call WriteAToHL_BTimes
	jr .asm_4e29
.english
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	hlbgcoord 5, 7
	ld b, 13
	ld a, $06
	call WriteAToHL_BTimes
	hlbgcoord 5, 9
	ld b, 13
	ld a, $07
	call WriteAToHL_BTimes
.asm_4e29
	ld hl, wcee4
	res 7, [hl]

.skip
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.end
