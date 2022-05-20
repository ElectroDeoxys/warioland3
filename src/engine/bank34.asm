; load 8 animated tiles to v1Tiles2
; these are blocks of tiles with 4 subsets, made of 8 tiles each
; (8 * $10 * 4 = $200 bytes each block)
; wAnimatedTilesGfx determines which of these blocks to load
; wAnimatedTilesFrame determines which of the subset (frame) to load
UpdateRoomAnimatedTiles:: ; d0000 (34:4000)
	ldh a, [rLY]
	cp $7c
	jr nc, .done
	jr .useless_jump ; can be fallthrough

.useless_jump
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
	ld a, [wAnimatedTilesGfx]
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

REPT 8
	ld a, [hli]
	ld [de], a
	inc e
ENDR

	dec b
	jr nz, .wait_lcd_on
	xor a ; VRAM0
	ldh [rVBK], a
.done
	ret
; 0xd0071

AnimatedTilesGfx:
AnimatedTiles1Gfx:  INCBIN "gfx/levels/animated/animated_tiles1.2bpp"  ; ANIMATED_TILES_GFX_00
AnimatedTiles2Gfx:  INCBIN "gfx/levels/animated/animated_tiles2.2bpp"  ; ANIMATED_TILES_GFX_01
AnimatedTiles3Gfx:  INCBIN "gfx/levels/animated/animated_tiles3.2bpp"  ; ANIMATED_TILES_GFX_02
AnimatedTiles4Gfx:  INCBIN "gfx/levels/animated/animated_tiles4.2bpp"  ; ANIMATED_TILES_GFX_03
AnimatedTiles5Gfx:  INCBIN "gfx/levels/animated/animated_tiles5.2bpp"  ; ANIMATED_TILES_GFX_04
AnimatedTiles6Gfx:  INCBIN "gfx/levels/animated/animated_tiles6.2bpp"  ; ANIMATED_TILES_GFX_05
AnimatedTiles7Gfx:  INCBIN "gfx/levels/animated/animated_tiles7.2bpp"  ; ANIMATED_TILES_GFX_06
AnimatedTiles8Gfx:  INCBIN "gfx/levels/animated/animated_tiles8.2bpp"  ; ANIMATED_TILES_GFX_07
AnimatedTiles9Gfx:  INCBIN "gfx/levels/animated/animated_tiles9.2bpp"  ; ANIMATED_TILES_GFX_08
AnimatedTiles10Gfx: INCBIN "gfx/levels/animated/animated_tiles10.2bpp" ; ANIMATED_TILES_GFX_09
AnimatedTiles11Gfx: INCBIN "gfx/levels/animated/animated_tiles11.2bpp" ; ANIMATED_TILES_GFX_10
AnimatedTiles12Gfx: INCBIN "gfx/levels/animated/animated_tiles12.2bpp" ; ANIMATED_TILES_GFX_11
AnimatedTiles13Gfx: INCBIN "gfx/levels/animated/animated_tiles13.2bpp" ; ANIMATED_TILES_GFX_12
AnimatedTiles14Gfx: INCBIN "gfx/levels/animated/animated_tiles14.2bpp" ; ANIMATED_TILES_GFX_13
AnimatedTiles15Gfx: INCBIN "gfx/levels/animated/animated_tiles15.2bpp" ; ANIMATED_TILES_GFX_14
AnimatedTiles16Gfx: INCBIN "gfx/levels/animated/animated_tiles16.2bpp" ; ANIMATED_TILES_GFX_15
AnimatedTiles17Gfx: INCBIN "gfx/levels/animated/animated_tiles17.2bpp" ; ANIMATED_TILES_GFX_16
AnimatedTiles18Gfx: INCBIN "gfx/levels/animated/animated_tiles18.2bpp" ; ANIMATED_TILES_GFX_17
AnimatedTiles19Gfx: INCBIN "gfx/levels/animated/animated_tiles19.2bpp" ; ANIMATED_TILES_GFX_18
AnimatedTiles20Gfx: INCBIN "gfx/levels/animated/animated_tiles20.2bpp" ; ANIMATED_TILES_GFX_19
AnimatedTiles21Gfx: INCBIN "gfx/levels/animated/animated_tiles21.2bpp" ; ANIMATED_TILES_GFX_20
AnimatedTiles22Gfx: INCBIN "gfx/levels/animated/animated_tiles22.2bpp" ; ANIMATED_TILES_GFX_21
AnimatedTiles23Gfx: INCBIN "gfx/levels/animated/animated_tiles23.2bpp" ; ANIMATED_TILES_GFX_22
AnimatedTiles24Gfx: INCBIN "gfx/levels/animated/animated_tiles24.2bpp" ; ANIMATED_TILES_GFX_23
