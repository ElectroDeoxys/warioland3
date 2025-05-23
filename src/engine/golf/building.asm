_GolfBuildingStateTable::
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

Func_1c8586:
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
	; clear all Golf RAM starting from wPredeterminedGolfLevel onwards
	ld hl, wPredeterminedGolfLevel
	ld bc, SIZEOF("Golf RAM") - (wPredeterminedGolfLevel - STARTOF("Golf RAM"))
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

	ld bc, MUSIC_GOLF_LOBBY
	call PlayNewMusic

	xor a
	ldh [rSCY], a
	ld [wSCY], a
	ld a, [wGolfMenuTargetSCX]
	ldh [rSCX], a
	ld [wSCX], a
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret

Func_1c8604:
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
	ld hl, GolfBuildingCoursesAttrmap
	ld bc, v1BGMap0
	call FarDecompress

	ld a, [wGolfMenuOption]
	ld [wGolfCourse], a
	call Func_1c87db
	call GetGolfCourseTargetSCX
	ld hl, wGolfCourseTileMap
	debgcoord 0, 6
	ld b, 7 * BG_MAP_WIDTH
	call CopyHLToDE

	xor a
	ldh [rVBK], a
	ld a, [wHasAllMusicalCoinFlags]
	and a
	jr nz, .has_all_musical_coins
	ld hl, GolfBuildingCoursesLockedTilemap
	jr .got_tilemap
.has_all_musical_coins
	ld hl, GolfBuildingCoursesUnlockedTilemap
.got_tilemap
	ld bc, v0BGMap0
	call FarDecompress

	ld hl, wGolfBestScores
	debgcoord 2, 13
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

Func_1c86dd:
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

Func_1c86f8:
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
	call LoadGolfSprite

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
	call LoadGolfSprite
	ld a, SCREEN_WIDTH_PX
	ld [wGolfObj4YCoord], a
	ld a, $58
	ld [wGolfObj4XCoord], a
	ld de, Frameset_1cb59e
	ld hl, wGolfObj4Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj4CurrentFrame]
	ld [wGolfObj4Frame], a
	ld hl, wGolfObj4Sprite
	call LoadGolfSprite

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
	call LoadGolfSprite

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
	call LoadGolfSprite

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
	jp LoadGolfSprite

.framesets
	dw Frameset_1cb5d8
	dw Frameset_1cb5db
	dw Frameset_1cb5de
	dw Frameset_1cb5e1

; loads attribute map to wGolfCourseTileMap
; and palettes to w1db00
; depending on value in wGolfCourse
Func_1c87db:
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
	ld de, wGolfCourseTileMap
	ld bc, 7 * BG_MAP_WIDTH
	call FarCopyHLToDE_BC2
	pop hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, w1db00
	ld b, 8 palettes
	jp CopyHLToDE

.data
	dw GolfBuildingCourse1Tilemap, Pals_1ca24f ; GOLF_COURSE_1
	dw GolfBuildingCourse2Tilemap, Pals_1ca28f ; GOLF_COURSE_2
	dw GolfBuildingCourse3Tilemap, Pals_1ca2cf ; GOLF_COURSE_3
	dw GolfBuildingCourse4Tilemap, Pals_1ca30f ; GOLF_COURSE_4

; gets the golf course scroll X value
; and writes it as the target SCX
GetGolfCourseTargetSCX:
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

Func_1c882b:
	ld a, [w1dc00]
	jumptable
	dw Func_1c8837
	dw Func_1c88dc
	dw Func_1c8907
	dw Func_1c8911

Func_1c8837:
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
	ld hl, GolfBuildingCourseScrollingAttrmap
	ld de, wGoldBuildingCourseAttrMap
	ld bc, 7 * BG_MAP_WIDTH
	call FarCopyHLToDE_BC2
	jp GetGolfCourseTargetSCX

Func_1c88dc:
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

Func_1c8907:
	xor a
	ld [w1dc00], a
	ld a, $03
	ld [wGolfVBlankMode], a
	ret

Func_1c8911:
	ld hl, wGolfCounter
	ld a, [hl]
	cp $32 ; aka GOLF_BUILDING_PRICE in hex
	jr nc, .done_subtracting
	inc [hl]
	and $03
	play_sfx z, SFX_12B

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
	play_sfx SFX_SELECTION
	call .SetGolfLevel
	ld a, $04
	ld [wSubState], a
	ret

.SetGolfLevel:
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
