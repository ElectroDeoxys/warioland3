; b = sprite bank
; de = pointer to sprite
AddOWSpriteWithScroll::
	ld a, [wSCY]
	ld c, a
	ld a, [hli] ; y coord
	sub c
	ld c, $10
	add c
	ld [wCurSpriteYCoord], a
	ld a, [wSCX]
	ld c, a
	ld a, [hli] ; x coord
	sub c
	ld c, $08
	add c
	ld [wCurSpriteXCoord], a
	ld a, [hli] ; tileID
	ld [wCurSpriteFrame], a
	ld a, [hl] ; attributes
	ld [wCurSpriteAttributes], a
	ld h, d
	ld l, e
;	fallthrough

AddOWSpriteWithScroll_GotParams::
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call AddSprite
	pop af
	bankswitch
	ret

; hl = OAM data
; b = sprite bank
; de = pointer to sprite
AddOWSprite::
	ld a, [hli]
	ld c, $10
	add c
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	ld c, $08
	add c
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a

	ld h, d
	ld l, e
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call AddSprite
	pop af
	bankswitch
	ret

; hl = wSceneObjXDuration
; de = frameset pointer
; b = bank
UpdateOWAnimation::
	xor a
	ld [wOWAnimationFinished], a

	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld a, [hl] ; duration
	sub 1
	ld [hli], a
	jr nc, .done
	ld a, [hl] ; frameset offset
	add e
	ld c, a
	ld a, d
	adc 0
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .frameset_end
	ld d, a
	ld a, [hl]

.advance_frameset
	add $2
	ld [hld], a ; frameset offset
	inc bc
	ld a, [bc]
	dec a
	ld [hld], a ; duration
	dec l
	ld [hl], d ; frame

.done
	ld a, $f8
	and l
	ld l, a
	ld b, h
	add $6
	ld c, a
	pop af
	bankswitch
	ret

.frameset_end
	ld [wOWAnimationFinished], a
	ld b, d
	ld c, e
	ld a, [de]
	ld d, a
	xor a
	jr .advance_frameset

; returns TRUE in a and carry set if treasure
; in input a has already been collected
; if not collected returns z set
; a = * constant
IsTreasureCollected::
	ld hl, wTreasuresCollected
	ld e, a
	srl e
	srl e
	srl e ; / 8
	ld d, $00
	add hl, de ; hl = wTreasuresCollected + (a / 8)

	ld e, $01
	bit 2, a
	jr z, .low_nybble
	swap e ; = $10
.low_nybble

	and %11
	ld d, a
	ld a, e
	jr z, .check_obtained
	rla
	dec d
	jr z, .check_obtained
	rla
	dec d
	jr z, .check_obtained
	rla
.check_obtained
	ld d, a
	and [hl]
	ret z ; not obtained
	ld a, TRUE
	scf
	ret

GetOWCoordInTilemap::
	ld a, [hli]
	and %11111000
	rlca
	rlca
	ld c, a
	and $0f
	ld b, a
	ld a, c
	and $f0
	ld c, a
	ld a, [hl]
	and %11111000
	rlca
	swap a
	add c
	ld l, a
	ld [wOWTilemapPtr + 0], a
	ld a, b
	add HIGH(wTilemap)
	ld h, a
	ld [wOWTilemapPtr + 1], a
	ret

; loads source address of tiles
; with the given level's name for HDMA transfer
; writes them to v0Tiles2 + $500
; b = map side constant (NORTH, ...)
; d = level index within that map side
LoadLevelName::
	ld a, BANK(LevelNamesJPGfx)
	ld hl, wLanguage
	add [hl]
	ld [wHDMABank], a
	xor a
	ld [wHDMA], a
	ld hl, LevelNamesJPGfx ; aka LevelNamesENGfx
	ld c, $00
	ld a, b
	swap a ; *$10
	ld b, a
	add hl, bc
	ld a, d
	add a ; *2
	ld d, a
	ld e, $00
	add hl, de
	ld a, h
	ld [w2d0b5SourceHi], a
	ld a, l
	ld [w2d0b5SourceLo], a
	ld a, $15
	ld [w2d0b5DestHi], a
	xor a
	ld [w2d0b5DestLo], a
	ld a, $1f
	ld [w2d0b5Mode], a
	ret

; copies c bytes from b:hl to de
CopyFarBytes::
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld b, c
	call CopyHLToDE
	pop af
	bankswitch
	ret

; copies c * $100 bytes from bank b
; at address hl to de
CopyFarBytes_Long::
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld b, c
	ld c, $00
	call CopyHLToDE_BC
	pop af
	bankswitch
	ret

LoadFarTiles::
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld bc, $80 tiles
	ld de, v0Tiles2
	call CopyHLToDE_BC
	pop af
	bankswitch
	ret

LoadFarBGMap::
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld bc, 18 * BG_MAP_WIDTH
	ld de, v0BGMap0
	call CopyHLToDE_BC
	pop af
	bankswitch
	ret

; sets scene obj's state and
; resets its animation data
; a = state
SetSceneObjState::
	ld [hld], a
	xor a
	ld [hld], a
	ld [hl], a
	ret

PlayOverworldMusic::
	ld a, [w2d011]
	and a
	jr nz, .night
	play_music2 MUSIC_OVERWORLD_DAY
	ret
.night
	play_music2 MUSIC_OVERWORLD_NIGHT
	ret

LoadFarPalsToTempPals1::
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call LoadPalsToTempPals1
	pop af
	bankswitch
	ret

LoadFarPalsToTempPals2::
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call LoadPalsToTempPals2
	pop af
	bankswitch
	ret

ApplyPalConfig::
	ld c, [hl]
	xor a
	ld [hli], a
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld l, [hl]
	ld h, a
.loop
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .loop
	ret

Func_3c03::
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, w2d0b5
	ld a, [hli]
	ld c, LOW(rHDMA1)
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	xor a
	ld [wHDMABank], a
	ret

; same as ApplyOWMovement but the x offsets are mirrored
; hl = OW obj
; de = relative positions
ApplyOWMovement_Mirrored::
	call Func_3c35
	sub e
	jr Func_3c29

; hl = OW obj
; de = relative positions
; returns z if movement has finished
ApplyOWMovement::
	call Func_3c35
	add e
;	fallthrough

Func_3c29::
	ld [bc], a

	; reset if reached the end
	ld a, [hl]
	cp $80
	ret nz

	ld a, $07
	or c
	ld c, a
	xor a
	ld [bc], a ; unk7
	ret

Func_3c35:
	ld c, l
	ld b, h
	ld a, $07
	or l
	ld l, a
	ld a, [hl] ; unk7
	inc [hl]
	add a ; *2
	ld l, a
	ld a, $00
	adc $00
	ld h, a
	add hl, de
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [bc] ; y coord
	add d
	ld [bc], a
	inc c
	ld a, [bc] ; x coord
	ret

AddOffsetInPointerTable::
	add a ; *2
	ld e, a
	ld a, $00
	adc 0
	ld d, a
	add hl, de
	ret

; outputs in hl the pointer corresponding
; to the index given in register a
; from the pointer table given in hl
GetPointerFromTableHL::
	call AddOffsetInPointerTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

; same as GetPointerFromTableHL
; but outputs pointer to de
GetPointerFromTableDE::
	call AddOffsetInPointerTable
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

; outputs in hl the cth word
; contained in the ath table entry
; in the pointer table in hl
GetCthWordFromAthTable::
	call AddOffsetInPointerTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	call AddOffsetInPointerTable
	ret

GetByteFromPointerInHL::
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	ret

Func_3c76::
	xor a
	ld hl, w2d0c0
	ld bc, $10
	call WriteAToHL_BCTimes
	ret
