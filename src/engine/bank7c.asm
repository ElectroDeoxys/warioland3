Func_1f0000: ; 1f0000 (7c:4000)
	ld a, [wSubSequence]
	jumptable

	dw SlowFadeBGToWhite
	dw Func_1f0087
	dw DarkenBGToPal_Fast
	dw $42a2
	dw SlowFadeBGToWhite
	dw $433c
	dw DarkenBGToPal_Fast
	dw $141a
	dw SlowFadeBGToWhite
	dw $4370
	dw DarkenBGToPal_Fast
	dw $43d1
	dw SlowFadeBGToWhite
	dw $43fa
	dw DarkenBGToPal_Fast
	dw $46e1
	dw $46fe
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw SlowFadeBGToWhite
	dw $4701
	dw DarkenBGToPal_Fast
	dw $43d1
	dw SlowFadeBGToWhite
	dw $4768
	dw DarkenBGToPal_Fast
	dw $46e1
	dw SlowFadeBGToWhite
	dw $48af
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw SlowFadeBGToWhite
	dw $4701
	dw DarkenBGToPal_Fast
	dw $43d1
	dw SlowFadeBGToWhite
	dw $4768
	dw DarkenBGToPal_Fast
	dw $46e1
	dw SlowFadeBGToWhite
	dw $48f4
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
; 0x1f007a

	INCROM $1f007a, $1f0087

Func_1f0087: ; 1f0087 (7c:4087)
	call DisableLCD
	call CopyVRAMToWRAM
	ld a, [wAnimatedTilesFrameDuration]
	ld [$d50f], a
	ld a, [wAnimatedTilesGroup]
	ld [$d510], a
	stop_sfx
	load_music MUSIC_PAUSE_MENU
	xor a
	ld [wStartMenuSelection], a
	xor a
	ld [wRoomAnimatedTilesEnabled], a
	call ClearBGMap0
	call ClearWholeVirtualOAM

	farcall Func_1f4000
	farcall Func_1f400d
	farcall Func_1f403f

	call Func_1f095b
	ld hl, $9dee
	farcall Func_4a33
	call VBlank_354

	xor a
	ldh [rSCY], a
	ldh [rSCX], a
	ld [wTempSCY], a
	ld [wTempSCX], a

	ld hl, wIntroObj1
	ld a, $38
	ld [hli], a
	ld a, $20
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $5c
	ld [hli], a
	ld a, $b8
	ld [hl], a
	call UpdateObjAnim
	ld hl, wIntroObj1
	call Func_1f0940

	ld hl, wIntroObj2
	ld a, $8c
	ld [hli], a
	ld a, $20
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $5c
	ld [hli], a
	ld a, $d4
	ld [hl], a
	call UpdateObjAnim
	ld hl, wIntroObj2
	call Func_1f0940

	ld a, [wKeys]
	bit GREY_KEY_F, a
	jr z, .asm_1f0168
	ld hl, wIntroObj3
	ld a, $54
	ld [hli], a
	ld a, $38
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $03
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $5c
	ld [hli], a
	ld a, $4a
	ld [hl], a
	call UpdateObjAnim
	ld hl, wIntroObj3
	call Func_1f0940

.asm_1f0168
	ld a, [wKeys]
	bit RED_KEY_F, a
	jr z, .asm_1f018f
	ld hl, wIntroObj4
	ld a, $54
	ld [hli], a
	ld a, $48
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $03
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $5c
	ld [hli], a
	ld a, $4d
	ld [hl], a
	call UpdateObjAnim
	ld hl, wIntroObj4
	call Func_1f0940

.asm_1f018f
	ld a, [wKeys]
	bit GREEN_KEY_F, a
	jr z, .asm_1f01b6
	ld hl, $d553
	ld a, $54
	ld [hli], a
	ld a, $58
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $04
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $5c
	ld [hli], a
	ld a, $4a
	ld [hl], a
	call UpdateObjAnim
	ld hl, $d553
	call Func_1f0940

.asm_1f01b6
	ld a, [wKeys]
	bit BLUE_KEY_F, a
	jr z, .asm_1f01dd
	ld hl, $d55e
	ld a, $54
	ld [hli], a
	ld a, $68
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $04
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $5c
	ld [hli], a
	ld a, $4d
	ld [hl], a
	call UpdateObjAnim
	ld hl, $d55e
	call Func_1f0940

.asm_1f01dd
	ld hl, $d56a
	ld a, $64
	ld [hli], a
	ld a, $38
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $03
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wKeys]
	bit 4, a
	jr z, .asm_1f01fd
	ld a, $5c
	ld [hli], a
	ld a, $f0
	ld [hl], a
	jr .asm_1f0203
.asm_1f01fd
	ld a, $5c
	ld [hli], a
	ld a, $ed
	ld [hl], a
.asm_1f0203
	call UpdateObjAnim
	ld hl, $d56a
	call Func_1f0940
	ld hl, $d572
	ld a, $64
	ld [hli], a
	ld a, $48
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $03
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wKeys]
	bit 5, a
	jr z, .asm_1f022c
	ld a, $5c
	ld [hli], a
	ld a, $f6
	ld [hl], a
	jr .asm_1f0232
.asm_1f022c
	ld a, $5c
	ld [hli], a
	ld a, $f3
	ld [hl], a
.asm_1f0232
	call UpdateObjAnim
	ld hl, $d572
	call Func_1f0940
	ld hl, $d57a
	ld a, $64
	ld [hli], a
	ld a, $58
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $04
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wKeys]
	bit 6, a
	jr z, .asm_1f025b
	ld a, $5c
	ld [hli], a
	ld a, $f0
	ld [hl], a
	jr .asm_1f0261
.asm_1f025b
	ld a, $5c
	ld [hli], a
	ld a, $ed
	ld [hl], a
.asm_1f0261
	call UpdateObjAnim
	ld hl, $d57a
	call Func_1f0940
	ld hl, $d582
	ld a, $64
	ld [hli], a
	ld a, $68
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $04
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wKeys]
	bit 7, a
	jr z, .asm_1f028a
	ld a, $5c
	ld [hli], a
	ld a, $f6
	ld [hl], a
	jr .asm_1f0290
.asm_1f028a
	ld a, $5c
	ld [hli], a
	ld a, $f3
	ld [hl], a
.asm_1f0290
	call UpdateObjAnim
	ld hl, $d582
	call Func_1f0940
	ld a, $8f
	ldh [rLCDC], a
	ld hl, wSubSequence
	inc [hl]
	ret
; 0x1f02a2

	INCROM $1f02a2, $1f08f7

LoadFontTiles: ; 1f08f7 (7c:48f7)
	ld hl, FontGFX
	ld bc, v0Tiles0
	call Decompress
	ret
; 0x1f0901

LoadGBIncompatibleScreenGfx: ; 1f0901 (7c:4901)
	ld hl, $6bc2
	ld bc, v0Tiles0
	call Decompress
	ret
; 0x1f090b

LoadGBIncompatibleScreenMap: ; 1f090b (7c:490b)
	ld hl, $74d6
	ld bc, v0BGMap0
	call Decompress
	ld a, %11100100
	ldh [rBGP], a
	ret
; 0x1f0919

LoadFontPals: ; 1f0919 (7c:4919)
	ld hl, Pals_1f3610
	call LoadPalsToTempPals1
	ld hl, Pals_1f3610
	call LoadPalsToTempPals2
	ret
; 0x1f0926

LoadLanguageSelectionText: ; 1f0926 (7c:4926)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, LanguageSelection2TextMap
	ld bc, v1BGMap0
	call Decompress

	xor a
	ldh [rVBK], a
	ld hl, LanguageSelection1TextMap
	ld bc, v0BGMap0
	call Decompress
	ret
; 0x1f0940

Func_1f0940: ; 1f0940 (7c:4940)
	ld a, [hli]
	add $10
	ld [wCurSpriteYOffset], a
	ld a, [hli]
	add $08
	ld [wCurSpriteXOffset], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, $556c
	call TryAddSprite
	ret
; 0x1f095b

Func_1f095b: ; 1f095b (7c:495b)
	ld a, [wNumMusicalCoins]
	add a
	add $a0
	ld [$9de7], a
	inc a
	ld [$9e07], a
	ret
; 0x1f0969

	INCROM $1f0969, $1f0b5b

Func_1f0b5b: ; 1f0b5b (7c:4b5b)
	ld de, $0
	ld b, $ca
	call SumBytesFromHL
	ldh a, [rSVBK]
	push af
	ld a, $02
	ldh [rSVBK], a
	ld b, $11
	call SumBytesFromHL
	pop af
	ldh [rSVBK], a
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	ld bc, $14a
	call Func_1f0b8e
	pop af
	ldh [rSVBK], a
	ret
; 0x1f0b83

; sums b bytes starting at hl
; result is added in de
SumBytesFromHL: ; 1f0b83 (7c:4b83)
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc $00
	ld d, a
	dec b
	jr nz, SumBytesFromHL
	ret
; 0x1f0b8e

Func_1f0b8e: ; 1f0b8e (7c:4b8e)
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc $00
	ld d, a
	dec bc
	ld a, b
	or c
	jr nz, SumBytesFromHL ; should be Func_1f0b8e?
	ret
; 0x1f0b9b

	INCROM $1f0b9b, $1f0bcc

Func_1f0bcc: ; 1f0bcc (7c:4bcc)
	ld a, [wSRAMBank]
	push af
	ld a, $01
	sramswitch
	ld hl, s0a000
	ld de, $0
	ld bc, $2000
.asm_1f0be1
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc $00
	ld d, a
	dec c
	jr nz, .asm_1f0be1
	dec b
	jr nz, .asm_1f0be1
	pop af
	sramswitch
	ld a, [wSRAMBank]
	push af
	ld a, $02
	sramswitch
	ld hl, s0a000
	ld bc, $1000
.asm_1f0c07
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc $00
	ld d, a
	dec c
	jr nz, .asm_1f0c07
	dec b
	jr nz, .asm_1f0c07
	pop af
	sramswitch
	ret
; 0x1f0c1c

Func_1f0c1c: ; 1f0c1c (7c:4c1c)
	ld a, [wSRAMBank]
	push af
	ld a, $03
	sramswitch
	ld hl, s0a000
	ld de, $0
	ld bc, $2000
.asm_1f0c31
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc $00
	ld d, a
	dec c
	jr nz, .asm_1f0c31
	dec b
	jr nz, .asm_1f0c31
	pop af
	sramswitch
	ld a, [wSRAMBank]
	push af
	ld a, $02
	sramswitch
	ld hl, $b000
	ld bc, $1000
.asm_1f0c57
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc $00
	ld d, a
	dec c
	jr nz, .asm_1f0c57
	dec b
	jr nz, .asm_1f0c57
	pop af
	sramswitch
	ret
; 0x1f0c6c

	INCROM $1f0c6c, $1f0cad

Func_1f0cad: ; 1f0cad (7c:4cad)
	ld a, [wSRAMBank]
	push af
	ld a, $00
	sramswitch

	ld hl, s0a380
	call Func_1f0d2e
	jr nc, .asm_1f0cec
	ld hl, s0a000
	call Func_1f0d47
	jr nc, .asm_1f0cec
	ld hl, s0a400
	call Func_1f0d47
	jr nc, .asm_1f0cec
	ld hl, s0ab80
	call Func_1f0d2e
	jr nc, .asm_1f0cec
	ld hl, s0a800
	call Func_1f0d47
	jr nc, .asm_1f0cec
	ld hl, s0ac00
	call Func_1f0d47
	jr nc, .asm_1f0cec
	jp .asm_1f0d0f

.asm_1f0cec
	ld a, [s0a790]
	ld b, a
	ld a, [s0a7e0]
	ld c, a
	ld a, [s0afa0]
	ld d, a
	cp b
	jr nz, .asm_1f0d08
	cp c
	jr z, .asm_1f0d03
	ld [wcef1], a
	jr .asm_1f0d20
.asm_1f0d03
	ld [wcef1], a
	jr .asm_1f0d20

.asm_1f0d08
	cp c
	jr z, .asm_1f0d16
	ld a, b
	cp c
	jr z, .asm_1f0d1b

.asm_1f0d0f
	ld a, $ff
	ld [wcef1], a
	jr .asm_1f0d20

.asm_1f0d16
	ld [wcef1], a
	jr .asm_1f0d20

.asm_1f0d1b
	ld [wcef1], a
	jr .asm_1f0d20

.asm_1f0d20
	call Func_1f0d60
	call Func_1f1246
	pop af
	sramswitch
	ret

Func_1f0d2e: ; 1f0d2e (7c:4d2e)
	ld a, [hli]
	cp $77
	jr nz, .set_carry
	ld a, [hli]
	cp $61
	jr nz, .set_carry
	ld a, [hli]
	cp $72
	jr nz, .set_carry
	ld a, [hli]
	cp $33
	jr nz, .set_carry
	scf
	ccf
	ret
.set_carry
	scf
	ret

Func_1f0d47: ; 1f0d47 (7c:4d47)
	ld a, [hli]
	cp $57
	jr nz, .set_carry
	ld a, [hli]
	cp $41
	jr nz, .set_carry
	ld a, [hli]
	cp $52
	jr nz, .set_carry
	ld a, [hli]
	cp $33
	jr nz, .set_carry
	scf
	ccf
	ret
.set_carry
	scf
	ret
; 0x1f0d60

Func_1f0d60: ; 1f0d60 (7c:4d60)
	xor a
	ld [wceee], a
	ld hl, s0a380
	call Func_1f0d2e
	jr c, .asm_1f0dcc

	ld a, [$a791]
	ld b, a
	ld a, [$a792]
	ld c, a
	ld a, [$a7e1]
	ld d, a
	ld a, [$a7e2]
	ld e, a
	ld a, [$afa1]
	ld h, a
	ld a, [$afa2]
	ld l, a
	call Func_1f1153
	ld hl, $a384
	call Func_1f1210
	ld a, [wcee7]
	cp d
	jr nz, .asm_1f0d9b
	ld a, [wcee8]
	cp e
	jr nz, .asm_1f0d9b
	jr .asm_1f0dc2

.asm_1f0d9b
	ld a, [wcef0]
	and a
	jr z, .asm_1f0dcc
	ld a, [wcee9]
	cp d
	jr nz, .asm_1f0daf
	ld a, [wceea]
	cp e
	jr nz, .asm_1f0daf
	jr .asm_1f0dc2

.asm_1f0daf
	ld a, [wcef0]
	cp $07
	jr nz, .asm_1f0dcc
	ld a, [wceeb]
	cp d
	jr nz, .asm_1f0dcc
	ld a, [wceec]
	cp e
	jr nz, .asm_1f0dcc

.asm_1f0dc2
	ld hl, $a384
	ld hl, wceee
	set 0, [hl]
	jr .asm_1f0de9

.asm_1f0dcc
	ld a, $10
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0a380
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

.asm_1f0de9
	ld hl, s0ab80
	call Func_1f0d2e
	jr c, .asm_1f0e51
	ld a, [$a793]
	ld b, a
	ld a, [$a794]
	ld c, a
	ld a, [$a7e3]
	ld d, a
	ld a, [$a7e4]
	ld e, a
	ld a, [$afa3]
	ld h, a
	ld a, [$afa4]
	ld l, a
	call Func_1f1153
	ld hl, $ab84
	call Func_1f1210
	ld a, [wcee7]
	cp d
	jr nz, .asm_1f0e20
	ld a, [wcee8]
	cp e
	jr nz, .asm_1f0e20
	jr .asm_1f0e47

.asm_1f0e20
	ld a, [wcef0]
	and a
	jr z, .asm_1f0e51
	ld a, [wcee9]
	cp d
	jr nz, .asm_1f0e34
	ld a, [wceea]
	cp e
	jr nz, .asm_1f0e34
	jr .asm_1f0e47

.asm_1f0e34
	ld a, [wcef0]
	cp $07
	jr nz, .asm_1f0e51
	ld a, [wceeb]
	cp d
	jr nz, .asm_1f0e51
	ld a, [wceec]
	cp e
	jr nz, .asm_1f0e51
.asm_1f0e47
	ld hl, $ab84
	ld hl, wceee
	set 1, [hl]
	jr .asm_1f0e6e

.asm_1f0e51
	ld a, $20
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0ab80
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

.asm_1f0e6e
	ld a, [$a79d]
	ld b, a
	ld a, [$a79e]
	ld c, a
	ld a, [$a7ed]
	ld d, a
	ld a, [$a7ee]
	ld e, a
	ld a, [$afad]
	ld h, a
	ld a, [$afae]
	ld l, a
	call Func_1f1153
	call Func_1f0bcc
	ld a, [wcee7]
	cp d
	jr nz, .asm_1f0e9a
	ld a, [wcee8]
	cp e
	jr nz, .asm_1f0e9a
	jr .asm_1f0ec1

.asm_1f0e9a
	ld a, [wcef0]
	and a
	jr z, .asm_1f0efd
	ld a, [wcee9]
	cp d
	jr nz, .asm_1f0eae
	ld a, [wceea]
	cp e
	jr nz, .asm_1f0eae
	jr .asm_1f0ec1

.asm_1f0eae
	ld a, [wcef0]
	cp $07
	jr nz, .asm_1f0efd
	ld a, [wceeb]
	cp d
	jr nz, .asm_1f0efd
	ld a, [wceec]
	cp e
	jr nz, .asm_1f0efd
.asm_1f0ec1
	ld hl, wceee
	set 6, [hl]
	ld hl, s0a000
	call Func_1f0d47
	jr c, .asm_1f0f2f
	ld a, [$a795]
	ld b, a
	ld a, [$a796]
	ld c, a
	ld a, [$a7e5]
	ld d, a
	ld a, [$a7e6]
	ld e, a
	ld a, [$afa5]
	ld h, a
	ld a, [$afa6]
	ld l, a
	call Func_1f1153
	ld hl, $a004
	call Func_1f0b5b
	ld a, [wcee7]
	cp d
	jr nz, .asm_1f0f00
	ld a, [wcee8]
	cp e
	jr nz, .asm_1f0f00
	jr .asm_1f0f27

.asm_1f0efd
	jp .asm_1f0fb2

.asm_1f0f00
	ld a, [wcef0]
	and a
	jr z, .asm_1f0f2f
	ld a, [wcee9]
	cp d
	jr nz, .asm_1f0f14
	ld a, [wceea]
	cp e
	jr nz, .asm_1f0f14
	jr .asm_1f0f27
.asm_1f0f14
	ld a, [wcef0]
	cp $07
	jr nz, .asm_1f0f2f
	ld a, [wceeb]
	cp d
	jr nz, .asm_1f0f2f
	ld a, [wceec]
	cp e
	jr nz, .asm_1f0f2f
.asm_1f0f27
	ld hl, wceee
	set 2, [hl]
	jp .asm_1f0fe2
.asm_1f0f2f
	ld a, $30
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0a000
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld hl, s0a800
	call Func_1f0d47
	jr c, .asm_1f0fb2
	ld a, [$a797]
	ld b, a
	ld a, [$a798]
	ld c, a
	ld a, [$a7e7]
	ld d, a
	ld a, [$a7e8]
	ld e, a
	ld a, [$afa7]
	ld h, a
	ld a, [$afa8]
	ld l, a
	call Func_1f1153
	ld hl, $a804
	call Func_1f0b5b
	ld a, [wcee7]
	cp d
	jr nz, .asm_1f0f83
	ld a, [wcee8]
	cp e
	jr nz, .asm_1f0f83
	jr .asm_1f0faa
.asm_1f0f83
	ld a, [wcef0]
	and a
	jr z, .asm_1f0fb2
	ld a, [wcee9]
	cp d
	jr nz, .asm_1f0f97
	ld a, [wceea]
	cp e
	jr nz, .asm_1f0f97
	jr .asm_1f0faa
.asm_1f0f97
	ld a, [wcef0]
	cp $07
	jr nz, .asm_1f0fb2
	ld a, [wceeb]
	cp d
	jr nz, .asm_1f0fb2
	ld a, [wceec]
	cp e
	jr nz, .asm_1f0fb2
.asm_1f0faa
	ld hl, wceee
	set 3, [hl]
	jp .asm_1f0fe2
.asm_1f0fb2
	ld a, $30
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0a000
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	ld a, $50
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0a800
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

.asm_1f0fe2
	ld a, [$a79f]
	ld b, a
	ld a, [$a7a0]
	ld c, a
	ld a, [$a7ef]
	ld d, a
	ld a, [$a7f0]
	ld e, a
	ld a, [$afaf]
	ld h, a
	ld a, [$afb0]
	ld l, a
	call Func_1f1153
	call Func_1f0c1c
	ld a, [wcee7]
	cp d
	jr nz, .asm_1f100e
	ld a, [wcee8]
	cp e
	jr nz, .asm_1f100e
	jr .asm_1f1035
.asm_1f100e
	ld a, [wcef0]
	and a
	jr z, .asm_1f1071
	ld a, [wcee9]
	cp d
	jr nz, .asm_1f1022
	ld a, [wceea]
	cp e
	jr nz, .asm_1f1022
	jr .asm_1f1035
.asm_1f1022
	ld a, [wcef0]
	cp $07
	jr nz, .asm_1f1071
	ld a, [wceeb]
	cp d
	jr nz, .asm_1f1071
	ld a, [wceec]
	cp e
	jr nz, .asm_1f1071
.asm_1f1035
	ld hl, wceee
	set 7, [hl]
	ld hl, s0a400
	call Func_1f0d47
	jr c, .asm_1f10a1
	ld a, [$a799]
	ld b, a
	ld a, [$a79a]
	ld c, a
	ld a, [$a7e9]
	ld d, a
	ld a, [$a7ea]
	ld e, a
	ld a, [$afa9]
	ld h, a
	ld a, [$afaa]
	ld l, a
	call Func_1f1153
	ld hl, $a404
	call Func_1f0b5b
	ld a, [wcee7]
	cp d
	jr nz, .asm_1f1074
	ld a, [wcee8]
	cp e
	jr nz, .asm_1f1074
	jr .asm_1f109b
.asm_1f1071
	jp .asm_1f1122
.asm_1f1074
	ld a, [wcef0]
	and a
	jr z, .asm_1f10a1
	ld a, [wcee9]
	cp d
	jr nz, .asm_1f1088
	ld a, [wceea]
	cp e
	jr nz, .asm_1f1088
	jr .asm_1f109b
.asm_1f1088
	ld a, [wcef0]
	cp $07
	jr nz, .asm_1f10a1
	ld a, [wceeb]
	cp d
	jr nz, .asm_1f10a1
	ld a, [wceec]
	cp e
	jr nz, .asm_1f10a1
.asm_1f109b
	ld hl, wceee
	set 4, [hl]
	ret

.asm_1f10a1
	ld a, $60
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0a400
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld hl, s0ac00
	call Func_1f0d47
	jr c, .asm_1f1122
	ld a, [$a79b]
	ld b, a
	ld a, [$a79c]
	ld c, a
	ld a, [$a7eb]
	ld d, a
	ld a, [$a7ec]
	ld e, a
	ld a, [$afab]
	ld h, a
	ld a, [$afac]
	ld l, a
	call Func_1f1153
	ld hl, $ac04
	call Func_1f0b5b
	ld a, [wcee7]
	cp d
	jr nz, .asm_1f10f5
	ld a, [wcee8]
	cp e
	jr nz, .asm_1f10f5
	jr .asm_1f111c
.asm_1f10f5
	ld a, [wcef0]
	and a
	jr z, .asm_1f1122
	ld a, [wcee9]
	cp d
	jr nz, .asm_1f1109
	ld a, [wceea]
	cp e
	jr nz, .asm_1f1109
	jr .asm_1f111c
.asm_1f1109
	ld a, [wcef0]
	cp $07
	jr nz, .asm_1f1122
	ld a, [wceeb]
	cp d
	jr nz, .asm_1f1122
	ld a, [wceec]
	cp e
	jr nz, .asm_1f1122
.asm_1f111c
	ld hl, wceee
	set 5, [hl]
	ret

.asm_1f1122
	ld a, $60
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0a400
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	ld a, $80
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0ac00
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ret
; 0x1f1153

Func_1f1153: ; 1f1153 (7c:5153)
	ld a, h
	cp b
	jr nz, .asm_1f1160
	cp d
	jr z, .asm_1f1175
	ld a, c
	cp l
	jr nz, .asm_1f1185
	jr .asm_1f11bf

.asm_1f1160
	cp d
	jr z, .asm_1f1169
	ld a, b
	cp d
	jr z, .asm_1f116f
	jr .asm_1f1185

.asm_1f1169
	ld a, e
	cp l
	jr nz, .asm_1f1185
	jr .asm_1f11db

.asm_1f116f
	ld a, c
	cp e
	jr nz, .asm_1f1185
	jr .asm_1f11a3

.asm_1f1175
	ld a, l
	cp c
	jr nz, .asm_1f117e
	cp e
	jr z, .asm_1f11f7
	jr .asm_1f11bf

.asm_1f117e
	cp e
	jr z, .asm_1f11db
	ld a, c
	cp e
	jr z, .asm_1f11a3
.asm_1f1185
	ld a, $07
	ld [wcef0], a
	ld a, b
	ld [wcee7], a
	ld a, d
	ld [wcee9], a
	ld a, h
	ld [wceeb], a
	ld a, c
	ld [wcee8], a
	ld a, e
	ld [wceea], a
	ld a, l
	ld [wceec], a
	ret

.asm_1f11a3
	ld a, $04
	ld [wcef0], a
	ld a, b
	ld [wcee7], a
	ld [wceeb], a
	ld a, h
	ld [wcee9], a
	ld a, c
	ld [wcee8], a
	ld [wceec], a
	ld a, l
	ld [wceea], a
	ret

.asm_1f11bf
	ld a, $02
	ld [wcef0], a
	ld a, b
	ld [wcee7], a
	ld [wceeb], a
	ld a, d
	ld [wcee9], a
	ld a, c
	ld [wcee8], a
	ld [wceec], a
	ld a, e
	ld [wceea], a
	ret

.asm_1f11db
	ld a, $01
	ld [wcef0], a
	ld a, d
	ld [wcee7], a
	ld [wceeb], a
	ld a, b
	ld [wcee9], a
	ld a, e
	ld [wcee8], a
	ld [wceec], a
	ld a, c
	ld [wceea], a
	ret

.asm_1f11f7
	xor a
	ld [wcef0], a
	ld a, b
	ld [wcee7], a
	ld [wcee9], a
	ld [wceeb], a
	ld a, c
	ld [wcee8], a
	ld [wceea], a
	ld [wceec], a
	ret
; 0x1f1210

Func_1f1210: ; 1f1210 (7c:5210)
	ld de, $0
	ld b, $5b
	call SumBytesFromHL
	ldh a, [rSVBK]
	push af
	ld a, $02
	ldh [rSVBK], a
	ld b, $11
	call SumBytesFromHL
	pop af
	ldh [rSVBK], a
	ret
; 0x1f1228

	INCROM $1f1228, $1f1246

Func_1f1246: ; 1f1246 (7c:5246)
	xor a
	ld [wceef], a
	ld a, [wceee]
	and $3f
	jr nz, .asm_1f1266
.asm_1f1251
	ld hl, wca07
	ld b, $32
	ld a, $aa
	call WriteAToHL_BTimes
	ld hl, wca42
	ld b, $4
	ld a, $aa
	call WriteAToHL_BTimes
	ret

.asm_1f1266
	ld b, a
	ld a, $3f
	and b
	ld [wceef], a
	ld bc, $600
.asm_1f1270
	rrca
	jr nc, .asm_1f1274
	inc c
.asm_1f1274
	dec b
	jr nz, .asm_1f1270
	ld a, c
	dec a
	jp z, .asm_1f1389

	ld hl, s0a380 + $4
	ld de, s0afe0
	ld b, $4
	call CopyHLToDE

	ld hl, s0ab80 + $4
	ld de, s0afe4
	ld b, $4
	call CopyHLToDE

	ld hl, s0a000 + $4
	ld de, s0afe8
	ld b, $4
	call CopyHLToDE

	ld hl, s0a800 + $4
	ld de, s0afec
	ld b, $4
	call CopyHLToDE

	ld hl, s0a400 + $4
	ld de, s0aff0
	ld b, $4
	call CopyHLToDE

	ld hl, s0ac00 + $4
	ld de, s0aff4
	ld b, $4
	call CopyHLToDE

	ld e, $21
.asm_1f12c0
	dec e
	jp z, .asm_1f1389
	xor a
	ld [s0aff8], a
	ld a, [wceef]
	bit 0, a
	jr z, .asm_1f12e4
	ld hl, $afe3
	sla [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	jr nc, .asm_1f12e4
	ld hl, s0aff8
	set 0, [hl]
.asm_1f12e4
	ld a, [wceef]
	bit 1, a
	jr z, .asm_1f1300
	ld hl, $afe7
	sla [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	jr nc, .asm_1f1300
	ld hl, s0aff8
	set 1, [hl]
.asm_1f1300
	ld a, [wceef]
	bit 2, a
	jr z, .asm_1f131c
	ld hl, $afeb
	sla [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	jr nc, .asm_1f131c
	ld hl, s0aff8
	set 2, [hl]
.asm_1f131c
	ld a, [wceef]
	bit 3, a
	jr z, .asm_1f1338
	ld hl, $afef
	sla [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	jr nc, .asm_1f1338
	ld hl, s0aff8
	set 3, [hl]
.asm_1f1338
	ld a, [wceef]
	bit 4, a
	jr z, .asm_1f1354
	ld hl, $aff3
	sla [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	jr nc, .asm_1f1354
	ld hl, s0aff8
	set 4, [hl]
.asm_1f1354
	ld a, [wceef]
	bit 5, a
	jr z, .asm_1f1370
	ld hl, $aff7
	sla [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	jr nc, .asm_1f1370
	ld hl, s0aff8
	set 5, [hl]

.asm_1f1370
	ld a, [s0aff8]
	and a
	jp z, .asm_1f12c0
	ld [wceef], a
	ld bc, $600
.asm_1f137d
	rrca
	jr nc, .asm_1f1381
	inc c
.asm_1f1381
	dec b
	jr nz, .asm_1f137d
	ld a, c
	dec a
	jp nz, .asm_1f12c0
.asm_1f1389
	ld a, [wceef]
	bit 0, a
	jr nz, .asm_1f13a7
	bit 1, a
	jr nz, .asm_1f13ae
	bit 2, a
	jr nz, .asm_1f13b5
	bit 3, a
	jr nz, .asm_1f13bc
	bit 4, a
	jr nz, .asm_1f13c3
	bit 5, a
	jr nz, .asm_1f13cd
	jp .asm_1f1251
.asm_1f13a7
	ld hl, s0a380 + $4
	call Func_1f13d7
	ret
.asm_1f13ae
	ld hl, s0ab80 + $4
	call Func_1f13d7
	ret
.asm_1f13b5
	ld hl, s0a000 + $4
	call Func_1f13f2
	ret
.asm_1f13bc
	ld hl, s0a800 + $4
	call Func_1f13f2
	ret
.asm_1f13c3
	ld hl, s0a400 + $4
	call Func_1f13f2
	call Func_1f1420
	ret
.asm_1f13cd
	ld hl, s0ac00 + $4
	call Func_1f13f2
	call Func_1f1420
	ret
; 0x1f13d7

Func_1f13d7: ; 1f13d7 (7c:53d7)
	ld de, wca00
	ld b, $5b
	call CopyHLToDE
	ldh a, [rSVBK]
	push af
	ld a, 2 ; WRAM2
	ldh [rSVBK], a
	ld de, wTreasuresCollected
	ld b, $11
	call CopyHLToDE
	pop af
	ldh [rSVBK], a
	ret
; 0x1f13f2

Func_1f13f2: ; 1f13f2 (7c:53f2)
	ld de, wca00
	ld b, $ca
	call CopyHLToDE
	ldh a, [rSVBK]
	push af
	ld a, 2 ; WRAM2
	ldh [rSVBK], a
	ld de, wTreasuresCollected
	ld b, $11
	call CopyHLToDE
	pop af
	ldh [rSVBK], a
	ldh a, [rSVBK]
	push af
	ld a, 1 ; WRAM1
	ldh [rSVBK], a
	ld de, wObjects
	ld bc, $14a
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a
	ret
; 0x1f1420

Func_1f1420: ; 1f1420 (7c:5420)
	ld a, $40
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, [wSRAMBank]
	push af
	ld a, $02
	sramswitch
	ld hl, $b000
	ld de, s0a000
	ld bc, $1000
	call CopyHLToDE_BC
	pop af
	sramswitch
	ld hl, s0a000
	ld bc, $2000
.asm_1f1450
	ld a, [wSRAMBank]
	push af
	ld a, $03
	sramswitch
	ld d, [hl]
	ld a, [wSRAMBank]
	push af
	ld a, $01
	sramswitch
	ld a, d
	ld [hli], a
	pop af
	sramswitch
	pop af
	sramswitch
	dec c
	jr nz, .asm_1f1450
	dec b
	jr nz, .asm_1f1450

	ld a, $41
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	call Func_1f0bcc
	ld a, d
	ld [$a79d], a
	ld a, e
	ld [$a79e], a

	ld a, $42
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, d
	ld [$a7ed], a
	ld a, e
	ld [$a7ee], a

	ld a, $43
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, d
	ld [$afad], a
	ld a, e
	ld [$afae], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ret
; 0x1f14c6

	INCROM $1f14c6, $1f1d5d

FontGFX: ; 1f1d5d (2c:5d5d)
INCBIN "gfx/font.2bpp.lz"
; 0x1f2bc2

	INCROM $1f2bc2, $1f3610

Pals_1f3610: ; 1f3610 (2c:7610)
	rgb  0, 22, 16
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 21, 21, 21
	rgb 31, 31, 31
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 26, 15
	rgb 31,  0, 11
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 30, 28,  0
	rgb 30, 15,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31,  0
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 10, 10, 10
	rgb  0,  0,  0
; 0x1f3650

LanguageSelection1TextMap: ; 1f3650 (2c:7650)
INCBIN "gfx/bgmaps/text/language_selection1.bin"

LanguageSelection2TextMap: ; 1f367f (2c:767f)
INCBIN "gfx/bgmaps/text/language_selection2.bin"
