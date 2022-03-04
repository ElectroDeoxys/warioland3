_GolfBuildingStateTable:: ; 1c8570 (72:4570)
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw Func_1c8586
	dw SlowFadeFromWhite
	dw Func_1c86dd
	dw FastFadeToWhite
	dw InitGolfLevel
	dw SlowFadeFromWhite
	dw HandleGolfLevel
	dw ReturnToMap
; 0x1c8586

Func_1c8586: ; 1c8586 (72:4586)
	call DisableLCD
	call ClearVirtualOAM
	ld a, $08
	ld [wAnimatedTilesFrameDuration], a
	ld a, $0f
	ld [wAnimatedTilesGfx], a
	xor a
	ld [wAnimatedTilesFrameCount], a
	ld [wAnimatedTilesFrame], a
	inc a
	ld [wRoomAnimatedTilesEnabled], a
	ld a, [w1d800]
	and a
	call z, SaveBackupVRAM

	ld a, [wGolfMenuOption]
	and a
	jr nz, .asm_1c85b3
	ld a, $01
	ld [w1d800], a
.asm_1c85b3
	ld hl, wPredeterminedGolfLevel
	ld bc, $7fe
.loop
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .loop

	call CheckHasAllMusicalCoinFlags
	ld [wHasAllMusicalCoinFlags], a

	call Func_1c8604
	ld hl, w1db00
	call LoadPalsToTempPals1
	ld hl, Pals_1ca34f
	call LoadPalsToTempPals2

	ld a, [wNumCoins + 0]
	ld [wGolfNumCoins + 0], a
	ld a, [wNumCoins + 1]
	ld [wGolfNumCoins + 1], a

	call Func_1c86f8
	call Func_1c9fae

	ld bc, MUSIC_GOLF_MENU
	call Func_fe6

	xor a
	ldh [rSCY], a
	ld [wSCY], a
	ld a, [wGolfMenuTargetSCX]
	ldh [rSCX], a
	ld [wSCX], a
	ld a, LCDC_BGON | LCDC_OBJON | LCDC_OBJ16 | LCDC_ON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x1c8604

Func_1c8604: ; 1c8604 (72:4604)
	ld a, BANK(GolfMenuGfx)
	ld [wTempBank], a
	xor a
	ldh [rVBK], a
	ld hl, GolfMenuGfx
	ld bc, v0Tiles0
	call FarDecompress

	ld a, BANK("Golf Gfx 2")
	ld [wTempBank], a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, BGMaps_1c4ea8
	ld bc, v1BGMap0
	call FarDecompress

	ld a, [wGolfMenuOption]
	ld [wGolfCourse], a
	call Func_1c87db
	call GetGolfCourseTargetSCX
	ld hl, w1d900
	ld de, v1BGMap0 + $c0
	ld b, $e0
	call CopyHLToDE

	xor a
	ldh [rVBK], a
	ld a, [wHasAllMusicalCoinFlags]
	and a
	jr nz, .has_all_musical_coins
	ld hl, BGMaps_1c4c60
	jr .asm_1c864f
.has_all_musical_coins
	ld hl, BGMaps_1c4d83
.asm_1c864f
	ld bc, v0BGMap0
	call FarDecompress

	ld hl, wGolfBestScores
	ld de, v0BGMap0 + $1a2
.loop_courses
	ld a, [hl]
	cp golf_score 100
	jp nc, .invalid_score ; score >= 100
	cp golf_score 1
	jr nc, .positive_score ; score > 0
	cp golf_score 0
	jr z, .zero_score

; negative score
	ld a, $d4
	ld [de], a
	ld a, e
	add BG_MAP_WIDTH
	ld e, a
	ld a, $d5
	ld [de], a
	ld a, GOLF_BASE_SCORE
	sub [hl]
	ld c, a
	jr .calculate_digits

.positive_score
	ld a, $d2
	ld [de], a
	ld a, e
	add BG_MAP_WIDTH
	ld e, a
	ld a, $d3
	ld [de], a
	ld a, [hl]
	sub $14
	ld c, a

.calculate_digits
	ld b, 0
.loop
	cp 10
	jr c, .got_digits
	sub 10
	ld c, a
	inc b
	jr .loop

.got_digits
	; b = tens digit
	; c = ones digit
	ld a, e
	sub BG_MAP_WIDTH - 1
	ld e, a
	ld a, b
	add a ; *2
	add $a0
	ld b, a
	ld [de], a
	ld a, e
	add BG_MAP_WIDTH
	ld e, a
	ld a, b
	inc a
	ld [de], a
	ld a, e
	sub BG_MAP_WIDTH - 1
	ld e, a
	ld a, c
	add a ; *2
	add $a0
	ld c, a
	ld [de], a
	ld a, e
	add BG_MAP_WIDTH
	ld e, a
	ld a, c
	inc a
	ld [de], a

	; next course
	ld a, l
	cp LOW(wGolfBestScores) + NUM_GOLF_COURSES - 1
	ret z
	inc hl
	ld a, e
	sub $1a
	ld e, a
	jp .loop_courses

.zero_score
	lb bc, 0, 0
	ld a, $be
	ld [de], a
	ld a, e
	add BG_MAP_WIDTH
	ld e, a
	ld a, $bf
	ld [de], a
	jr .got_digits

.invalid_score
	lb bc, 10, 10
	xor a
	ld [de], a
	ld a, e
	add BG_MAP_WIDTH
	ld e, a
	xor a
	ld [de], a
	jr .got_digits
; 0x1c86dd

Func_1c86dd: ; 1c86dd (72:46dd)
	call Func_1c882b
	call Func_1c86f8
	call ClearUnusedVirtualOAM
	ld a, [wSubState]
	cp $08
	jp nz, Func_1c9fae
	xor a
	ld [w1d800], a
	ld [wGolfMenuOption], a
	jp Func_1c9fae
; 0x1c86f8

Func_1c86f8: ; 1c86f8 (72:46f8)
	ld a, HIGH(OAM_1cb3e0)
	ld [wGolfOAMPtr + 0], a
	ld a, LOW(OAM_1cb3e0)
	ld [wGolfOAMPtr + 1], a
	ld a, $42
	ld [wGolfObj1YCoord], a
	ld a, $58
	ld [wGolfObj1XCoord], a
	ld de, Frameset_1cb59b
	ld hl, wGolfObj1Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj1CurrentFrame]
	ld [wGolfObj1Frame], a
	ld hl, wGolfObj1Sprite
	call AddGolfSprite

	ld a, $2a
	ld [wGolfObj3YCoord], a
	ld a, $58
	ld [wGolfObj3XCoord], a
	ld de, Frameset_1cb598
	ld hl, wGolfObj3Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj3CurrentFrame]
	ld [wGolfObj3Frame], a
	ld hl, wGolfObj3Sprite
	call AddGolfSprite
	ld a, $a0
	ld [wGolfObj4YCoord], a
	ld a, $58
	ld [wGolfObj4XCoord], a
	ld de, Frameset_1cb59e
	ld hl, wGolfObj4Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj4CurrentFrame]
	ld [wGolfObj4Frame], a
	ld hl, wGolfObj4Sprite
	call AddGolfSprite

	ld a, [w1dc00]
	and a
	ret nz
	ld a, $76
	ld [wGolfObj5YCoord], a
	ld a, $6c
	ld [wGolfObj5XCoord], a
	ld de, Frameset_1cb5a1
	ld hl, wGolfObj5Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj5CurrentFrame]
	ld [wGolfObj5Frame], a
	ld hl, wGolfObj5Sprite
	call AddGolfSprite

	xor a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld a, $76
	ld [wGolfWarioYCoord], a
	ld a, $6c
	ld [wGolfWarioXCoord], a
	ld hl, .framesets
	ld a, [wGolfMenuOption]
	add a
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wGolfWarioDuration
	call UpdateGolfObjectAnimation

	ld a, [wGolfWarioCurrentFrame]
	ld [wGolfWarioFrame], a
	ld hl, wGolfWarioSprite
	call AddGolfSprite

	ld a, $50
	ld [wGolfParaGoomYCoord], a
	ld a, $55
	ld [wGolfParaGoomXCoord], a
	ld de, Frameset_1cb5c3
	ld hl, wGolfParaGoomDuration
	call UpdateGolfObjectAnimation
	ld a, [wGolfParaGoomCurrentFrame]
	ld [wGolfParaGoomFrame], a
	ld hl, wGolfParaGoomSprite
	jp AddGolfSprite

.framesets
	dw Frameset_1cb5d8
	dw Frameset_1cb5db
	dw Frameset_1cb5de
	dw Frameset_1cb5e1
; 0x1c87db

; loads attribute map to w1d900
; and palettes to w1db00
; depending on value in wGolfCourse
Func_1c87db: ; 1c87db (72:47db)
	ld a, BANK("Golf Gfx 2")
	ld [wTempBank], a
	ld hl, .data
	ld a, [wGolfCourse]
	add a
	add a ; *4
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld h, d
	ld l, e
	ld de, w1d900
	ld bc, $e0
	call FarCopyHLToDE_BC2
	pop hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, w1db00
	ld b, 8 palettes
	jp CopyHLToDE

.data
	dw BGMaps_1c48e0, Pals_1ca24f ; GOLF_COURSE_1
	dw BGMaps_1c49c0, Pals_1ca28f ; GOLF_COURSE_2
	dw BGMaps_1c4aa0, Pals_1ca2cf ; GOLF_COURSE_3
	dw BGMaps_1c4b80, Pals_1ca30f ; GOLF_COURSE_4
; 0x1c8818

; gets the golf course scroll X value
; and writes it as the target SCX
GetGolfCourseTargetSCX: ; 1c8818 (72:4818)
	ld hl, .scroll_x
	ld a, [wGolfCourse]
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wGolfMenuTargetSCX], a
	ret

.scroll_x
	db $cc ; GOLF_COURSE_1
	db $0c ; GOLF_COURSE_2
	db $4c ; GOLF_COURSE_3
	db $8c ; GOLF_COURSE_4
; 0x1c882b

Func_1c882b: ; 1c882b (72:482b)
	ld a, [w1dc00]
	jumptable
	dw Func_1c8837
	dw Func_1c88dc
	dw Func_1c8907
	dw Func_1c8911
; 0x1C8837

Func_1c8837: ; 1c8837 (72:4837)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .a_btn
	bit B_BUTTON_F, a
	jr nz, .b_btn
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	ret

.a_btn
	ld a, [wNumCoins + 0]
	and a
	jr nz, .enough_coins
	ld a, [wNumCoins + 1]
	cp GOLF_BUILDING_PRICE
	jr nc, .enough_coins
	play_sfx SFX_0E5
	ret
.enough_coins
	ld a, [wNumCoins + 1]
	sub GOLF_BUILDING_PRICE
	daa
	ld [wNumCoins + 1], a
	ld a, [wNumCoins + 0]
	sbc 0
	ld [wNumCoins + 0], a
	ld a, $03
	ld [w1dc00], a
	ret

.b_btn
	ld a, $08
	ld [wSubState], a
	ret

.d_right
	xor a
	ld [wGolfMenuScrollingDir], a
	ld hl, wGolfMenuOption
	ld a, [hl]
	cp GOLF_COURSE_4
	jr z, .wrap_around_right
	cp GOLF_COURSE_3
	jr nz, .scroll_right
	ld a, [wHasAllMusicalCoinFlags]
	and a
	jr nz, .scroll_right
.wrap_around_right
	ld [hl], GOLF_COURSE_1
	jr .scrolling
.scroll_right
	inc [hl]
	jr .scrolling

.d_left
	ld a, $1 ; left
	ld [wGolfMenuScrollingDir], a
	ld hl, wGolfMenuOption
	ld a, [hl]
	and a
	jr nz, .scroll_left
	ld a, [wHasAllMusicalCoinFlags]
	and a
	jr nz, .wrap_around_left
	ld [hl], GOLF_COURSE_3
	jr .scrolling
.wrap_around_left
	ld [hl], GOLF_COURSE_4
	jr .scrolling
.scroll_left
	dec [hl]

.scrolling
	play_sfx SFX_0E2
	ld a, $01
	ld [w1dc00], a
	ld [wGolfVBlankMode], a
	ld a, [hl]
	ld [wGolfCourse], a
	call Func_1c87db
	ld hl, BGMaps_1c4800
	ld de, w1da00
	ld bc, $e0
	call FarCopyHLToDE_BC2
	jp GetGolfCourseTargetSCX
; 0x1c88dc

Func_1c88dc: ; 1c88dc (72:48dc)
	ld a, [wGolfMenuTargetSCX]
	ld c, a
	ld a, [wGolfMenuScrollingDir]
	and a
	jr nz, .left
; right
	ld a, [wSCX]
	cp c
	jr z, .reached_target_scx
	add $4
	ld [wSCX], a
	ret
.left
	ld a, [wSCX]
	cp c
	jr z, .reached_target_scx
	sub $4
	ld [wSCX], a
	ret

.reached_target_scx
	ld a, $02
	ld [w1dc00], a
	ld [wGolfVBlankMode], a
	ret
; 0x1c8907

Func_1c8907: ; 1c8907 (72:4907)
	xor a
	ld [w1dc00], a
	ld a, $03
	ld [wGolfVBlankMode], a
	ret
; 0x1c8911

Func_1c8911: ; 1c8911 (72:4911)
	ld hl, wGolfCounter
	ld a, [hl]
	cp $32 ; aka GOLF_BUILDING_PRICE in hex
	jr nc, .done_subtracting
	inc [hl]
	and $03
	jr nz, .skip_sfx
	play_sfx SFX_12B
.skip_sfx
	ld hl, wGolfNumCoins + 1
	ld a, [hl]
	sub 1
	daa
	ld [hld], a
	ld a, [hl]
	sbc 0
	ld [hl], a
	ret
.done_subtracting
	play_sfx SFX_0E3
	call .Func_1c8944
	ld a, $04
	ld [wSubState], a
	ret

.Func_1c8944
	ld hl, .first_golf_levels
	ld a, [wGolfMenuOption]
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wPredeterminedGolfLevel], a
	ret

.first_golf_levels
	db GOLF_LEVEL_00 + $1 ; GOLF_COURSE_1
	db GOLF_LEVEL_05 + $1 ; GOLF_COURSE_2
	db GOLF_LEVEL_10 + $1 ; GOLF_COURSE_3
	db GOLF_LEVEL_15 + $1 ; GOLF_COURSE_4
; 0x1c8957
