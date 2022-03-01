; load 8 animated tiles to v1Tiles2
; these are blocks of tiles with 4 subsets, made of 8 tiles each
; (8 * $10 * 4 = $200 bytes each block)
; wAnimatedTilesGroup determines which of these blocks to load
; wAnimatedTilesFrame determines which of the subset (frame) to load
UpdateRoomAnimatedTiles:: ; d0000 (34:4000)
	ldh a, [rLY]
	cp $7c
	jr nc, .done
	jr .asm_d0008 ; can be fallthrough

.asm_d0008
; check whether to advance frame
	ld a, [wAnimatedTilesFrameDuration]
	and a
	jr z, .done
	ld b, a
	ld a, [wAnimatedTilesFrameCount]
	inc a
	ld [wAnimatedTilesFrameCount], a
	cp b
	jr c, .done

; do frame
	xor a
	ld [wAnimatedTilesFrameCount], a
	ld hl, AnimatedTilesGfx
	ld a, [wAnimatedTilesGroup]
	add a
	add h
	ld h, a
	ld a, [wAnimatedTilesFrame]
	inc a
	cp $4
	jr nz, .ok
	xor a ; reset to 0
.ok
	ld [wAnimatedTilesFrame], a
	swap a
	add a
	add a
	add a ; *$80
	ld e, a
	ld d, $00
	rl d
	add hl, de

	ld de, v1Tiles2 + $700
	ld b, $10
	ld a, BANK("VRAM1")
	ldh [rVBK], a

.wait_lcd_on
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr z, .wait_lcd_on

.wait_ld_off
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr nz, .wait_ld_off

rept 8
	ld a, [hli]
	ld [de], a
	inc e
endr

	dec b
	jr nz, .wait_lcd_on
	xor a ; VRAM0
	ldh [rVBK], a
.done
	ret
; 0xd0071

AnimatedTilesGfx:
AnimatedTiles1Gfx:  INCBIN "gfx/levels/animated/animated_tiles1.2bpp"
AnimatedTiles2Gfx:  INCBIN "gfx/levels/animated/animated_tiles2.2bpp"
AnimatedTiles3Gfx:  INCBIN "gfx/levels/animated/animated_tiles3.2bpp"
AnimatedTiles4Gfx:  INCBIN "gfx/levels/animated/animated_tiles4.2bpp"
AnimatedTiles5Gfx:  INCBIN "gfx/levels/animated/animated_tiles5.2bpp"
AnimatedTiles6Gfx:  INCBIN "gfx/levels/animated/animated_tiles6.2bpp"
AnimatedTiles7Gfx:  INCBIN "gfx/levels/animated/animated_tiles7.2bpp"
AnimatedTiles8Gfx:  INCBIN "gfx/levels/animated/animated_tiles8.2bpp"
AnimatedTiles9Gfx:  INCBIN "gfx/levels/animated/animated_tiles9.2bpp"
AnimatedTiles10Gfx: INCBIN "gfx/levels/animated/animated_tiles10.2bpp"
AnimatedTiles11Gfx: INCBIN "gfx/levels/animated/animated_tiles11.2bpp"
AnimatedTiles12Gfx: INCBIN "gfx/levels/animated/animated_tiles12.2bpp"
AnimatedTiles13Gfx: INCBIN "gfx/levels/animated/animated_tiles13.2bpp"
AnimatedTiles14Gfx: INCBIN "gfx/levels/animated/animated_tiles14.2bpp"
AnimatedTiles15Gfx: INCBIN "gfx/levels/animated/animated_tiles15.2bpp"
AnimatedTiles16Gfx: INCBIN "gfx/levels/animated/animated_tiles16.2bpp"
AnimatedTiles17Gfx: INCBIN "gfx/levels/animated/animated_tiles17.2bpp"
AnimatedTiles18Gfx: INCBIN "gfx/levels/animated/animated_tiles18.2bpp"
AnimatedTiles19Gfx: INCBIN "gfx/levels/animated/animated_tiles19.2bpp"
AnimatedTiles20Gfx: INCBIN "gfx/levels/animated/animated_tiles20.2bpp"
AnimatedTiles21Gfx: INCBIN "gfx/levels/animated/animated_tiles21.2bpp"
AnimatedTiles22Gfx: INCBIN "gfx/levels/animated/animated_tiles22.2bpp"
AnimatedTiles23Gfx: INCBIN "gfx/levels/animated/animated_tiles23.2bpp"
AnimatedTiles24Gfx: INCBIN "gfx/levels/animated/animated_tiles24.2bpp"
