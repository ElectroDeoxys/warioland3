	INCROM $ac000, $ac8d4

Func_ac8d4: ; ac8d4 (2b:48d4)
	ld [w2d146], a
	ld b, $00
	cp $07
	jr c, .asm_ac91e
	inc b
	cp $0b
	jr c, .asm_ac91e
	inc b
	cp $0c
	jr c, .asm_ac91e
	inc b
	cp $0e
	jr c, .asm_ac91e
	inc b
	cp $10
	jr c, .asm_ac91e
	inc b
	cp $15
	jr c, .asm_ac91e
	inc b
	cp $1d
	jr c, .asm_ac91e
	inc b
	cp $22
	jr c, .asm_ac91e
	inc b
	cp $26
	jr c, .asm_ac91e
	inc b
	cp $2d
	jr c, .asm_ac91e
	inc b
	cp $30
	jr c, .asm_ac91e
	inc b
	cp $3a
	jr c, .asm_ac91e
	inc b
	cp $3c
	jr c, .asm_ac91e
	inc b
	cp $3d
	jr c, .asm_ac91e ; unnecessary jump

.asm_ac91e
	ld hl, w2d148
	ld a, [hl]
	cp b
	call nz, .Func_ac930
	ld hl, w2d144
	xor a
	ld [hli], a
	ld [hl], a
	ld [w2d14c], a
	ret

.Func_ac930
	ld a, b
	ld [hli], a ; w2d148
	add a ; *2
	ld c, a
	add a ; *4
	add c ; *6
	ld de, .data
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a
	ld a, [de]
	ld [hli], a ; w2d149
	inc de
	ld a, [de]
	ld [hli], a ; w2d14a
	inc de
	ld a, [de]
	ld [hl], a ; w2d14b
	inc de
	ld a, [de]
	ld [w2d079], a

	ld hl, wHDMA
	inc de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld [hli], a
	ld a, b
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, 127
	ld [hl], a

	xor a
	ld [w2d158], a
	ret

data_ac962: MACRO
	dw \1
	db \2
	db \3
	dw \4
ENDM

.data
	data_ac962 $4a82, $05, $04, $4000
	data_ac962 $426c, $05, $04, $4800
	data_ac962 $606a, $05, $04, $7000
	data_ac962 $4000, $05, $04, $4000
	data_ac962 $49cc, $35, $0b, $7000
	data_ac962 $65fe, $2a, $0b, $7000
	data_ac962 $66e7, $2a, $76, $5000
	data_ac962 $6934, $2a, $76, $5800
	data_ac962 $6b5c, $2a, $76, $6800
	data_ac962 $6d1e, $2a, $76, $6000
	data_ac962 $70c5, $2a, $76, $7000
	data_ac962 $431b, $7f, $04, $4000
	data_ac962 $673c, $05, $09, $4000
	data_ac962 $4000, $7f, $0b, $7000
; 0xac9b6

	ret ; stray ret
; 0xac9b7

	INCROM $ac9b7, $acc9a

Func_acc9a: ; acc9a (2b:4c9a)
	ld hl, w2d800
	ld bc, $800
	xor a
	call WriteAToHL_BCTimes
	ret
; 0xacca5

Func_acca5: ; acca5 (2b:4ca5)
	ld hl, w2d140
	ld bc, $c0
	xor a
	call WriteAToHL_BCTimes
	ret
; 0xaccb0

VBlank_accb0: ; accb0 (2b:4cb0)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	ld a, [wTempSCY]
	ldh [rSCY], a
	ld a, [wTempSCX]
	ldh [rSCX], a

	ld a, [w2d079]
	and a
	jr z, .asm_accff
	ld b, a
	xor a
	ld [w2d079], a
	ld a, [wROMBank]
	push af
	ld a, b

	bankswitch
	ld a, [w2d158]
	ldh [rVBK], a
	ld hl, wHDMA
	ld a, [hli]
	ld c, LOW(rHDMA1)
	ld [$ff00+c], a ; rHDMA1
	ld a, [hli]
	inc c
	ld [$ff00+c], a ; rHDMA2
	ld a, [hli]
	inc c
	ld [$ff00+c], a ; rHDMA3
	ld a, [hli]
	inc c
	ld [$ff00+c], a ; rHDMA4
	ld a, [hli]
	inc c
	ld [$ff00+c], a ; rHDMA5
	pop af
	bankswitch

.asm_accff
	ld hl, w2d810 + $4f * $8
	ld a, [hl]
	and a
	jr z, .asm_acd13
	ld e, a
	xor a
	ld [hli], a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [de], a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [hl]
	ld [de], a
.asm_acd13
	xor a
	ldh [rVBK], a
	ld hl, w2d0d0
	ld a, [hl]
	and a
	call nz, Func_3be4

	ld hl, w2d0d6
	ld a, [hl]
	and a
	call nz, Func_3be4

	ld a, [w2d800]
	and a
	jr z, .dma_transfer
	ld hl, rLCDC
	xor [hl]
	ld [hl], a
	xor a
	ld [w2d800], a

.dma_transfer
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.func_end
; 0xacd3a

	INCROM $acd3a, $ace90

Func_ace90: ; ace90 (2b:4e90)
	ld hl, w2db80
	ld a, $7f
	ld bc, $80
	call WriteAToHL_BCTimes
	ret
; 0xace9c

	INCROM $ace9c, $ade49

_InitPrologueSequence: ; ade49 (2b:5e49)
	call Func_acc9a
	call Func_acca5
	call VBlank_accb0

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(BGMap_b34c3)
	ld [wTempBank], a
	ld hl, BGMap_b34c3
	ld bc, v1BGMap1
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	xor a
	ldh [rVBK], a
	ld a, BANK(BGMap_b330c)
	ld [wTempBank], a
	ld hl, BGMap_b330c
	ld bc, v0BGMap1
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	ld hl, Tiles_b0f80
	ld b, BANK(Tiles_b0f80)
	call LoadFarTiles

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(FontGFX)
	ld [wTempBank], a
	ld hl, FontGFX
	ld bc, v1Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	; unnecessary
	xor a
	ldh [rVBK], a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(PrologueGfx)
	ld [wTempBank], a
	ld hl, PrologueGfx
	ld bc, v1Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	; unnecessary
	xor a
	ldh [rVBK], a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(BGMap_b3a5b)
	ld [wTempBank], a
	ld hl, BGMap_b3a5b
	ld bc, v1BGMap0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	xor a
	ldh [rVBK], a
	ld a, BANK(BGMap_b3a03)
	ld [wTempBank], a
	ld hl, BGMap_b3a03
	ld bc, v0BGMap0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	ld hl, MusicBoxGfx
	ld de, v0Tiles1
	ld b, BANK(MusicBoxGfx)
	ld c, $3
	call CopyFarBytes_Long

	ld a, [wLanguage]
	and a
	jr z, .japanese
; english
	ld a, BANK(Data_b37f9)
	ld [wTempBank], a
	ld hl, Data_b37f9
	ld bc, wTreasureTiles
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	jr .asm_adf63
.japanese
	ld a, BANK(Data_b3675)
	ld [wTempBank], a
	ld hl, Data_b3675
	ld bc, wTreasureTiles
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

.asm_adf63
	call Func_ace90

	; clear temp pals
	xor a
	ld hl, wTempPals1
	ld bc, 8 palettes
	call WriteAToHL_BCTimes
	xor a
	ld hl, wTempPals2
	ld bc, 8 palettes
	call WriteAToHL_BCTimes

	ld hl, w2d140
	ld a, $60
	ld [hli], a
	ld a, $60
	ld [hli], a
	ld a, $ff
	ld [w2d148], a
	xor a
	call Func_ac8d4
	ld a, $08
	ld [w2d800], a
	ret
; 0xadf92

	INCROM $adf92, $b0000

