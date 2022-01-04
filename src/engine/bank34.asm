; load 8 animated tiles to v1Tiles2
; these are blocks of tiles with 4 subsets, made of 8 tiles each
; (8 * $10 * 4 = $200 bytes each block)
; wAnimatedTilesGroup determines which of these blocks to load (up to 24)
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
	ld hl, TileData_d0071
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

TileData_d0071: ; d0071 (34:4071)
	INCROM $d0071, $d0271

TileData_d0271: ; d0271 (34:4271)
	INCROM $d0271, $d0471

TileData_d0471: ; d0471 (34:4471)
	INCROM $d0471, $d0671

TileData_d0671: ; d0671 (34:4671)
	INCROM $d0671, $d0871

TileData_d0871: ; d0871 (34:4871)
	INCROM $d0871, $d0a71

TileData_d0a71: ; d0a71 (34:4a71)
	INCROM $d0a71, $d0c71

TileData_d0c71: ; d0c71 (34:4c71)
	INCROM $d0c71, $d0e71

TileData_d0e71: ; d0e71 (34:4e71)
	INCROM $d0e71, $d1071

TileData_d1071: ; d1071 (34:5071)
	INCROM $d1071, $d1271

TileData_d1271: ; d1271 (34:5271)
	INCROM $d1271, $d1471

TileData_d1471: ; d1471 (34:5471)
	INCROM $d1471, $d1671

TileData_d1671: ; d1671 (34:5671)
	INCROM $d1671, $d1871

TileData_d1871: ; d1871 (34:5871)
	INCROM $d1871, $d1a71

TileData_d1a71: ; d1a71 (34:5a71)
	INCROM $d1a71, $d1c71

TileData_d1c71: ; d1c71 (34:5c71)
	INCROM $d1c71, $d1e71

TileData_d1e71: ; d1e71 (34:5e71)
	INCROM $d1e71, $d2071

TileData_d2071: ; d2071 (34:6071)
	INCROM $d2071, $d2271

TileData_d2271: ; d2271 (34:6271)
	INCROM $d2271, $d2471

TileData_d2471: ; d2471 (34:6471)
	INCROM $d2471, $d2671

TileData_d2671: ; d2671 (34:6671)
	INCROM $d2671, $d2871

TileData_d2871: ; d2871 (34:6871)
	INCROM $d2871, $d2a71

TileData_d2a71: ; d2a71 (34:6a71)
	INCROM $d2a71, $d2c71

TileData_d2c71: ; d2c71 (34:6c71)
	INCROM $d2c71, $d2e71

TileData_d2e71: ; d2e71 (34:6e71)
	INCROM $d2e71, $d3071
