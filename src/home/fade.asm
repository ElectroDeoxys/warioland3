FadeBGToWhite_Normal:: ; 46d (0:46d)
	ld a, FADE_SPEED_NORMAL
	ld [wFadeSpeed], a
	jr FadeBGToWhite

SlowFadeBGToWhite:: ; 474 (0:474)
	ld a, FADE_SPEED_FAST
	ld [wFadeSpeed], a
	jr FadeBGToWhite

FastFadeToWhite:: ; 47b (0:47b)
	xor a ; FADE_SPEED_SLOW
	ld [wFadeSpeed], a
	; fallthrough

FadeBGToWhite:: ; 47f (0:47f)
	ld a, [wPalFadeCounter]
	cp 2
	jr nc, .lighten
	dec a
	jr z, .asm_496
	ld a, $01
	ld [wc186], a
	call VBlank_88d
	ld hl, wPalFadeCounter
	inc [hl]
	ret

.asm_496
	call VBlank_8bf

.lighten
	ld hl, wCurRGB
	ld de, wTempBGPals
	ld b, 8 palettes

.loop_colors
	ld a, [de]
	and %00011111
	ld [hli], a ; wCurRed
	ld a, [de]
	and %11100000
	rrca
	rrca
	rrca
	rrca
	rrca
	ld [hl], a
	inc e
	ld a, [de]
	and %00000011
	rlca
	rlca
	rlca
	or [hl]
	ld [hli], a ; wCurGreen
	ld a, [de]
	and %01111100
	rrca
	rrca
	ld [hl], a ; wCurBlue

; inc blue
	inc [hl]
	ld a, [wFadeSpeed]
	and a
	jr z, .cap_blue ; FADE_SPEED_SLOW
	inc [hl]
	dec a
	jr z, .cap_blue ; FADE_SPEED_NORMAL
	inc [hl]
	inc [hl]

.cap_blue
	ld a, [hl]
	cp $1f
	jr c, .inc_green
	ld [hl], $1f

.inc_green
	dec l
	inc [hl]
	ld a, [wFadeSpeed]
	and a
	jr z, .cap_green ; FADE_SPEED_SLOW
	inc [hl]
	dec a
	jr z, .cap_green ; FADE_SPEED_NORMAL
	inc [hl]
	inc [hl]
.cap_green
	ld a, [hl]
	cp $1f
	jr c, .inc_red
	ld [hl], $1f

.inc_red
	dec l
	inc [hl]
	ld a, [wFadeSpeed]
	and a
	jr z, .cap_red ; FADE_SPEED_SLOW
	inc [hl]
	dec a
	jr z, .cap_red ; FADE_SPEED_NORMAL
	inc [hl]
	inc [hl]
.cap_red
	ld a, [hl]
	cp $1f
	jr c, .convert_rgb
	ld [hl], $1f

.convert_rgb
	ld a, [hli]
	ld c, a
	ld a, [hl]
	and %00000111
	rlca
	rlca
	rlca
	rlca
	rlca
	or c
	dec e
	ld [de], a
	ld a, [hli]
	and %00011000
	rrca
	rrca
	rrca
	ld c, a
	ld a, [hld]
	rlca
	rlca
	or c
	inc e
	ld [de], a
	inc e
	dec l
	dec b
	jr nz, .loop_colors

	ld hl, wPalFadeCounter
	inc [hl]
	ld b, 33
	ld a, [wFadeSpeed]
	and a
	jr z, .asm_52d ; FADE_SPEED_SLOW
	ld b, 18
	dec a
	jr z, .asm_52d ; FADE_SPEED_NORMAL
	ld b, 10
.asm_52d
	ld a, [hl]
	cp b
	ret c

	di
	ld hl, wBackupVBlankFunc
	ld b, $07 ; useless
	ld de, wVBlankFunc
	ld b, 3
	call CopyHLToDE
	ei

	xor a
	ld [wFadeSpeed], a
	ld [wPalFadeCounter], a
	ld [wc186], a
	ld hl, wSubState
	inc [hl]
	ret

; unreferenced
Func_54e: ; 54e (0:54e)
	ld a, [wPalFadeCounter]
	cp $02
	jr nc, .asm_568
	dec a
	jr z, .asm_565
	ld a, $01
	ld [wc186], a
	call VBlank_88d
	ld hl, wPalFadeCounter
	inc [hl]
	ret
.asm_565
	call VBlank_8bf
.asm_568
	ld hl, wCurRGB
	ld de, wTempBGPals
	ld b, 8 palettes
.asm_570
	ld a, [de]
	and $1f
	ld [hli], a
	ld a, [de]
	and $e0
	rrca
	rrca
	rrca
	rrca
	rrca
	ld [hl], a
	inc e
	ld a, [de]
	and $03
	rlca
	rlca
	rlca
	or [hl]
	ld [hli], a
	ld a, [de]
	and $7c
	rrca
	rrca
	ld [hl], a
	ld a, [hl]
	and a
	jr z, .asm_591
	dec [hl]
.asm_591
	dec l
	ld a, [hl]
	and a
	jr z, .asm_597
	dec [hl]
.asm_597
	dec l
	ld a, [hl]
	and a
	jr z, .asm_59d
	dec [hl]
.asm_59d
	ld a, [hli]
	ld c, a
	ld a, [hl]
	and $07
	rlca
	rlca
	rlca
	rlca
	rlca
	or c
	dec e
	ld [de], a
	ld a, [hli]
	and $18
	rrca
	rrca
	rrca
	ld c, a
	ld a, [hld]
	rlca
	rlca
	or c
	inc e
	ld [de], a
	inc e
	dec l
	dec b
	jr nz, .asm_570
	ld hl, wPalFadeCounter
	inc [hl]
	ld a, [hl]
	cp $21
	ret c
	di
	ld hl, wBackupVBlankFunc
	ld b, $07 ; unused
	ld de, wVBlankFunc
	ld b, $03
	call CopyHLToDE
	ei
	xor a
	ld [wPalFadeCounter], a
	ld [wc186], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x5df

DarkenBGToPal_Normal:: ; 5df (0:5df)
	ld a, FADE_SPEED_NORMAL
	ld [wFadeSpeed], a
	jr DarkenBGToPal

DarkenBGToPal_Fast:: ; 5e6 (0:5e6)
	ld a, FADE_SPEED_FAST
	ld [wFadeSpeed], a
	jr DarkenBGToPal

SlowFadeFromWhite:: ; 5ed (0:5ed)
	xor a ; FADE_SPEED_SLOW
	ld [wFadeSpeed], a
	; fallthrough

; fades BG palettes to wTempPals1
; gradually darkens up to wTempPals1
DarkenBGToPal:: ; 5f1 (0:5f1)
	ld a, [wPalFadeCounter]
	cp 2
	jr nc, .asm_60b
	dec a
	jr z, .asm_608
	ld a, $01
	ld [wc186], a
	call VBlank_88d
	ld hl, wPalFadeCounter
	inc [hl] ; set up to begin fade
	ret

.asm_608
	call VBlank_8bf

.asm_60b
	ld hl, wTargetRGB
	ld de, wTempPals1
	ld b, 8 palettes

.loop_colors
; convert rgb values from wTempPals1
	ld a, [de]
	and %00011111
	ld [hli], a ; red
	ld a, [de]
	and %11100000
	rrca
	rrca
	rrca
	rrca
	rrca
	ld [hl], a
	inc e
	ld a, [de]
	and %00000011
	rlca
	rlca
	rlca
	or [hl]
	ld [hli], a ; green
	ld a, [de]
	and %01111100
	rrca
	rrca
	ld [hli], a ; blue

; convert rgb values from wTempBGPals
	dec e
	ld d, HIGH(wTempBGPals)
	ld a, [de]
	and %00011111
	ld [hli], a ; red
	ld a, [de]
	and %11100000
	rrca
	rrca
	rrca
	rrca
	rrca
	ld [hl], a
	inc e
	ld a, [de]
	and %00000011
	rlca
	rlca
	rlca
	or [hl]
	ld [hli], a ; green
	ld a, [de]
	and %01111100
	rrca
	rrca
	ld [hl], a ; blue

; reduce blue
	ld a, [wTargetBlue]
	ld c, a
	dec [hl]
	jr z, .cap_blue
	ld a, [wFadeSpeed]
	and a
	jr z, .cap_blue ; FADE_SPEED_SLOW
	dec [hl]
	jr z, .cap_blue
	dec a
	jr z, .cap_blue ; FADE_SPEED_NORMAL
	dec [hl]
	jr z, .cap_blue
	dec [hl]
.cap_blue
	ld a, [hl]
	cp c
	jr nc, .reduce_green
	ld [hl], c

.reduce_green
	dec l
	ld a, [wTargetGreen]
	ld c, a
	dec [hl]
	jr z, .cap_green
	ld a, [wFadeSpeed]
	and a
	jr z, .cap_green ; FADE_SPEED_SLOW
	dec [hl]
	jr z, .cap_green
	dec a
	jr z, .cap_green ; FADE_SPEED_NORMAL
	dec [hl]
	jr z, .cap_green
	dec [hl]
.cap_green
	ld a, [hl]
	cp c
	jr nc, .reduce_red
	ld [hl], c

.reduce_red
	dec l
	ld a, [wTargetRed]
	ld c, a
	dec [hl]
	jr z, .cap_red
	ld a, [wFadeSpeed]
	and a
	jr z, .cap_red ; FADE_SPEED_SLOW
	dec [hl]
	jr z, .cap_red
	dec a
	jr z, .cap_red ; FADE_SPEED_NORMAL
	dec [hl]
	jr z, .cap_red
	dec [hl]
.cap_red
	ld a, [hl]
	cp c
	jr nc, .convert_rgb
	ld [hl], c

.convert_rgb
	ld a, [hli]
	ld c, a
	ld a, [hl]
	and %00000111
	rlca
	rlca
	rlca
	rlca
	rlca
	or c
	dec e
	ld [de], a
	ld a, [hli]
	and %00011000
	rrca
	rrca
	rrca
	ld c, a
	ld a, [hld]
	rlca
	rlca
	or c
	inc e
	ld [de], a

	inc e
	ld d, HIGH(wTempPals1)
	ld hl, wTargetRGB
	dec b
	jp nz, .loop_colors

	ld hl, wPalFadeCounter
	inc [hl]
	ld b, 33
	ld a, [wFadeSpeed]
	and a
	jr z, .asm_6db ; FADE_SPEED_SLOW
	ld b, 18
	dec a
	jr z, .asm_6db ; FADE_SPEED_NORMAL
	ld b, 10
.asm_6db
	ld a, [hl]
	cp b
	ret c

	di
	ld hl, wBackupVBlankFunc
	ld de, wVBlankFunc
	ld b, 3
	call CopyHLToDE
	ei

	xor a
	ld [wFadeSpeed], a
	ld [wPalFadeCounter], a
	ld [wc186], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x6fa

; fades BG palettes to wTempPals1
; gradually lightens up to wTempPals1
; when fading is complete, advances wSubState
SlowFadeInScreen:: ; 6fa (0:6fa)
	ld a, [wPalFadeCounter]
	cp 2
	jr nc, .fade ; jump if in middle of fade
	dec a
	jr z, .begin_fade

	ld a, $01
	ld [wc186], a
	call VBlank_88d
	ld hl, wPalFadeCounter
	inc [hl] ; set up to begin fade
	ret

.begin_fade
	call VBlank_8bf

.fade
	ld hl, wTargetRGB
	ld de, wTempPals1
	ld b, 8 palettes

.loop_colors
; convert rgb values from wTempPals1
	ld a, [de]
	and %00011111
	ld [hli], a ; red
	ld a, [de]
	and %11100000
	rlca
	rlca
	rlca
	ld [hl], a
	inc e
	ld a, [de]
	and %00000011
	rlca
	rlca
	rlca
	or [hl]
	ld [hli], a ; green
	ld a, [de]
	and %01111100
	rrca
	rrca
	ld [hli], a ; blue

; convert rgb values from wTempBGPals
	dec e
	ld d, HIGH(wTempBGPals)
	ld a, [de]
	and %00011111
	ld [hli], a ; red
	ld a, [de]
	and %11100000
	rlca
	rlca
	rlca
	ld [hl], a
	inc e
	ld a, [de]
	and %00000011
	rlca
	rlca
	rlca
	or [hl]
	ld [hli], a ; green
	ld a, [de]
	and %01111100
	rrca
	rrca
	ld [hl], a ; blue

; compare blue
	ld a, [wTargetBlue]
	ld c, a
	cp [hl]
	jr z, .compare_green
	jr nc, .inc_blue
	dec [hl]
	ld a, [hl]
	cp c ; useless
	jr .compare_green
.inc_blue
	inc [hl]
	ld a, [hl]
	cp c ; useless

.compare_green
	dec l
	ld a, [wTargetGreen]
	ld c, a
	cp [hl]
	jr z, .compare_red
	jr nc, .inc_green
	dec [hl]
	ld a, [hl]
	cp c ; useless
	jr .compare_red
.inc_green
	inc [hl]
	ld a, [hl]
	cp c ; useless

.compare_red
	dec l
	ld a, [wTargetRed]
	ld c, a
	cp [hl]
	jr z, .convert_rgb
	jr nc, .inc_red
	dec [hl]
	ld a, [hl]
	cp c ; useless
	jr .convert_rgb
.inc_red
	inc [hl]
	ld a, [hl]
	cp c ; useless

.convert_rgb
	ld a, [hli]
	ld c, a
	ld a, [hl]
	and %00000111
	rrca
	rrca
	rrca
	or c
	dec e
	ld [de], a
	ld a, [hli]
	and %00011000
	rrca
	rrca
	rrca
	ld c, a
	ld a, [hld]
	rlca
	rlca
	or c
	inc e
	ld [de], a

	inc e
	ld d, HIGH(wTempPals1)
	ld hl, wTargetRGB
	dec b
	jp nz, .loop_colors

	ld hl, wPalFadeCounter
	inc [hl]
	ld b, 33
	ld a, [hl]
	cp b
	ret c

	di
	ld hl, wBackupVBlankFunc
	ld de, wVBlankFunc
	ld b, 3
	call CopyHLToDE
	ei

	xor a
	ld [wFadeSpeed], a
	ld [wPalFadeCounter], a
	ld [wc186], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x7cf

; unreferenced
Func_7cf: ; 7cf (0:7cf)
	ld a, [wPalFadeCounter]
	cp $02
	jr nc, .asm_7e9
	dec a
	jr z, .asm_7e6
	ld a, $01
	ld [wc186], a
	call VBlank_88d
	ld hl, wPalFadeCounter
	inc [hl]
	ret
.asm_7e6
	call VBlank_8bf
.asm_7e9
	ld hl, wTargetRed
	ld de, wTempPals1
	ld b, $40
.asm_7f1
	ld a, [de]
	and $1f
	ld [hli], a
	ld a, [de]
	and $e0
	rrca
	rrca
	rrca
	rrca
	rrca
	ld [hl], a
	inc e
	ld a, [de]
	and $03
	rlca
	rlca
	rlca
	or [hl]
	ld [hli], a
	ld a, [de]
	and $7c
	rrca
	rrca
	ld [hli], a
	dec e
	ld d, $c1
	ld a, [de]
	and $1f
	ld [hli], a
	ld a, [de]
	and $e0
	rrca
	rrca
	rrca
	rrca
	rrca
	ld [hl], a
	inc e
	ld a, [de]
	and $03
	rlca
	rlca
	rlca
	or [hl]
	ld [hli], a
	ld a, [de]
	and $7c
	rrca
	rrca
	ld [hl], a
	ld a, [wTargetBlue]
	ld c, a
	ld a, [hl]
	cp c
	jr z, .asm_835
	inc [hl]
.asm_835
	dec l
	ld a, [wTargetGreen]
	ld c, a
	ld a, [hl]
	cp c
	jr z, .asm_83f
	inc [hl]
.asm_83f
	dec l
	ld a, [wTargetRed]
	ld c, a
	ld a, [hl]
	cp c
	jr z, .asm_849
	inc [hl]
.asm_849
	ld a, [hli]
	ld c, a
	ld a, [hl]
	and $07
	rlca
	rlca
	rlca
	rlca
	rlca
	or c
	dec e
	ld [de], a
	ld a, [hli]
	and $18
	rrca
	rrca
	rrca
	ld c, a
	ld a, [hld]
	rlca
	rlca
	or c
	inc e
	ld [de], a
	inc e
	ld d, $c0
	ld hl, wTargetRed
	dec b
	jr nz, .asm_7f1
	ld hl, wPalFadeCounter
	inc [hl]
	ld a, [hl]
	cp $21
	ret c
	di
	ld hl, wBackupVBlankFunc
	ld de, wVBlankFunc
	ld b, $03
	call CopyHLToDE
	ei
	xor a
	ld [wPalFadeCounter], a
	ld [wc186], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x88d

VBlank_88d:: ; 88d (0:88d)
	di
	ld hl, wVBlankFunc
	ld de, wBackupVBlankFunc
	ld b, 3
	call CopyHLToDE

	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ei
	ret

.Func:
	jp .asm_8a9
.end

.asm_8a9
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	call StoreBGPals
	call StoreOBPals
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
; 0x8bf

VBlank_8bf:: ; 8bf (0:8bf)
	di
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ei
	ret

.Func:
	jp .asm_8d0
.end

.asm_8d0
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	call LoadBGPalettesFromWRAM
	call LoadOBPalettesFromWRAM
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
; 0x8e6
