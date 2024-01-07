; unreferenced?
Func_1c8957:
	ld a, [wSubState]
	jumptable
	dw FastFadeToWhite
	dw InitGolfLevel
	dw SlowFadeFromWhite
	dw HandleGolfLevel
	dw Func_1c8fb7

InitGolfLevel:
	call DisableLCD
	call ClearVirtualOAM
	xor a
	ld [wRoomAnimatedTilesEnabled], a

	ld hl, wGolfLevelRAMStart
	ld bc, wGolfRAMEnd - wGolfLevelRAMStart
	xor a
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop

	ld hl, .GolfCoursePals
	ld a, [wGolfMenuOption]
	add a ; *2
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call LoadPalsToTempPals1
	ld hl, Pals_1ca18f
	call LoadPalsToTempPals2

	ld a, BANK("Golf Gfx 1")
	ld [wTempBank], a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, GolfFlagGfx
	ld bc, v1Tiles0
	call FarDecompress
	xor a
	ldh [rVBK], a
	ld hl, GolfGfx
	ld bc, v0Tiles1
	call FarDecompress

	ld a, BANK(WarioIdleGfx)
	ld [wTempBank], a
	ld hl, WarioIdleGfx
	ld de, v0Tiles0
	ld bc, $80 tiles
	call FarCopyHLToDE_BC2

	xor a
	ldh [rSCY], a
	ldh [rSCX], a
	ld [wSCY], a
	ld [wSCX], a
	ldh [rWY], a
	ld a, $a6
	ldh [rWX], a
	ld [w1dc25], a

	call .SetUpGolfLevel
	call Func_1c9cf9

	play_music2 MUSIC_GOLF

	; setting the LCDC here is unnecessary since we
	; already set the correct configuration in Func_1c9cf9
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a

	ld hl, wSubState
	inc [hl]
	ret

.GolfCoursePals
	dw Pals_1ca08f
	dw Pals_1ca0cf
	dw Pals_1ca10f
	dw Pals_1ca14f

.SetUpGolfLevel:
	call PickAndLoadGolfLevel
	call ShowGolfLevelFlagAndPar
	jp SetUpGolfLevelObjects

PickAndLoadGolfLevel:
	ld a, BANK("Golf Gfx 1")
	ld [wTempBank], a
	ld a, [wPredeterminedGolfLevel]
	and a
	jr z, .no_predetermined_golf_level
	dec a
	ld c, a
	jr .got_golf_level
.no_predetermined_golf_level
; tier 3
	ld a, GOLF_LEVEL_TIER_3
	ld [w1dc0e], a
	ld a, [wNumCollectedTreasures + 0]
	and a
	jr nz, .got_tier
	ld a, [wNumCollectedTreasures + 1]
	cp GOLF_TREASURES_TIER_3
	jr nc, .got_tier
	cp GOLF_TREASURES_TIER_2
	jr nc, .tier_2
; tier 1
	ld a, GOLF_LEVEL_TIER_1
	ld [w1dc0e], a
	jr .got_tier
.tier_2
	ld a, GOLF_LEVEL_TIER_2
	ld [w1dc0e], a

.got_tier
	ld a, [w1dc0e]
	ld b, a
	ldh a, [rDIV]
	ld c, a
.loop_division
	sub b
	jr c, .got_golf_level
	ld c, a ; remainder
	jr .loop_division

.got_golf_level
	ld hl, .GolfLevels
	ld a, c
	and a
	jr z, .got_golf_level_data
	ld de, GOLF_LEVEL_STRUCT_LENGTH
.loop_get_data
	add hl, de
	dec c
	jr nz, .loop_get_data
.got_golf_level_data
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	bcbgcoord 0, 7
	call FarDecompress
	ld hl, BGMap_1c1651
	ld bc, v1BGMap0
	call FarDecompress
	pop hl
	bcbgcoord 0, 7, v1BGMap1
	call FarDecompress
	ld hl, BGMap_1c1716
	ld bc, v1BGMap1
	call FarDecompress

	xor a
	ldh [rVBK], a
	pop hl
	bcbgcoord 0, 7
	call FarDecompress
	ld hl, BGMap_1c15c5
	ld bc, v0BGMap0
	call FarDecompress
	pop hl
	bcbgcoord 0, 7, v0BGMap1
	call FarDecompress
	ld hl, BGMap_1c168a
	ld bc, v0BGMap1
	call FarDecompress
	pop hl

	ld de, wGolfLevelData
	ld bc, wGolfLevelDataEnd - wGolfLevelData
	call FarCopyHLToDE_BC2
	ld a, [w1db82 + 0]
	ld [wGolfLevelHoleXPos + 0], a
	ld a, [w1db82 + 1]
	ld [wGolfLevelHoleXPos + 1], a
	ret

.GolfLevels
	dw GolfLevel00, BGMap_1c18fd, BGMap_1c1869, BGMap_1c1973, BGMap_1c18be ; GOLF_LEVEL_00
	dw GolfLevel01, BGMap_1c1824, BGMap_1c1756, BGMap_1c1850, BGMap_1c17c6 ; GOLF_LEVEL_01
	dw GolfLevel02, BGMap_1c2287, BGMap_1c21e7, BGMap_1c2303, BGMap_1c224f ; GOLF_LEVEL_02
	dw GolfLevel03, BGMap_1c2819, BGMap_1c277e, BGMap_1c288c, BGMap_1c27cc ; GOLF_LEVEL_03
	dw GolfLevel04, BGMap_1c2aaf, BGMap_1c2a45, BGMap_1c2b03, BGMap_1c2a73 ; GOLF_LEVEL_04
	dw GolfLevel05, BGMap_1c1d24, BGMap_1c1c82, BGMap_1c1d7a, BGMap_1c1cd8 ; GOLF_LEVEL_05
	dw GolfLevel06, BGMap_1c1bc6, BGMap_1c1b2c, BGMap_1c1c2b, BGMap_1c1b78 ; GOLF_LEVEL_06
	dw GolfLevel07, BGMap_1c1e6e, BGMap_1c1dd0, BGMap_1c1ed2, BGMap_1c1e25 ; GOLF_LEVEL_07
	dw GolfLevel08, BGMap_1c1ffd, BGMap_1c1f18, BGMap_1c2047, BGMap_1c1f8f ; GOLF_LEVEL_08
	dw GolfLevel09, BGMap_1c2970, BGMap_1c28e3, BGMap_1c29e1, BGMap_1c292c ; GOLF_LEVEL_09
	dw GolfLevel10, BGMap_1c1a80, BGMap_1c19c5, BGMap_1c1ae5, BGMap_1c1a1c ; GOLF_LEVEL_10
	dw GolfLevel11, BGMap_1c26ad, BGMap_1c25f8, BGMap_1c2725, BGMap_1c2656 ; GOLF_LEVEL_11
	dw GolfLevel12, BGMap_1c2bdd, BGMap_1c2b55, BGMap_1c2c41, BGMap_1c2b9b ; GOLF_LEVEL_12
	dw GolfLevel13, BGMap_1c210b, BGMap_1c2084, BGMap_1c218e, BGMap_1c20c9 ; GOLF_LEVEL_13
	dw GolfLevel14, BGMap_1c2e88, BGMap_1c2ddc, BGMap_1c2efc, BGMap_1c2e39 ; GOLF_LEVEL_14
	dw GolfLevel15, BGMap_1c2ffc, BGMap_1c2f55, BGMap_1c3062, BGMap_1c2fa8 ; GOLF_LEVEL_15
	dw GolfLevel16, BGMap_1c25b6, BGMap_1c24db, BGMap_1c25e5, BGMap_1c254d ; GOLF_LEVEL_16
	dw GolfLevel17, BGMap_1c2d30, BGMap_1c2c9e, BGMap_1c2d93, BGMap_1c2cec ; GOLF_LEVEL_17
	dw GolfLevel18, BGMap_1c2410, BGMap_1c2361, BGMap_1c247d, BGMap_1c23bc ; GOLF_LEVEL_18
	dw GolfLevel19, BGMap_1c316a, BGMap_1c30b7, BGMap_1c31e4, BGMap_1c3119 ; GOLF_LEVEL_19

ShowGolfLevelFlagAndPar:
	ld a, BANK("VRAM1")
	ldh [rVBK], a

; if playing Golf in the Golf Building,
; then the number of strokes can exceed the par
	ld a, [w1d800]
	cp $02
	jr z, .asm_1c8ba3
	ld a, [wGolfPar]
	add MAX_GOLF_COURSE_STROKES
	ld [wGolfMaxStrokes], a
	ld a, [w1d803]
	jr .got_max_strokes
.asm_1c8ba3
	ld a, [wGolfPar]
	ld [wGolfMaxStrokes], a
	ld a, [wGolfPar]
	dec a
.got_max_strokes
	ld hl, GolfFlagNumbersGfx
	swap a ; *$10
	ld b, $00
	ld c, a
	add hl, bc
	ld de, v1Tiles0 tile $01
	ld b, 1 tiles
	call CopyHLToDE

	ld hl, GolfParNumbersGfx
	ld a, [wGolfPar]
	dec a
	swap a ; *$10
	sub 2 tiles
	ld c, a
	add hl, bc
	ld de, v1Tiles0 tile $2b
	ld b, 1 tiles
	call CopyHLToDE
	ld hl, GolfParNumbersGfx
	add hl, bc
	ld de, v1Tiles0 tile $4b
	ld b, 1 tiles
	call CopyHLToDE
	ld hl, GolfParNumbersGfx
	add hl, bc
	ld de, v1Tiles0 tile $6b
	ld b, 1 tiles
	call CopyHLToDE
	ld hl, GolfParNumbersGfx
	add hl, bc
	ld de, v1Tiles0 tile $8b
	ld b, 1 tiles
	call CopyHLToDE

	ld a, [w1d800]
	cp $02
	jr z, .stroke_number
	ld hl, GolfHoleFlagGfx
	ld de, v1Tiles0 tile $20
	ld b, 6 tiles
	call CopyHLToDE
	ld de, v1Tiles0 tile $40
	ld b, 6 tiles
	call CopyHLToDE
	ld de, v1Tiles0 tile $60
	ld b, 6 tiles
	call CopyHLToDE
	ld de, v0Tiles1
	ld b, 6 tiles
	call CopyHLToDE

.stroke_number
	call PrintGolfStrokeNumber
	ld hl, w1db90
	ld de, v1Tiles0 tile $f0
	ld b, 4 tiles
	call CopyHLToDE

	xor a
	ldh [rVBK], a
	ret

SetUpGolfLevelObjects:
	ld a, HIGH(OAM_1ca6cf)
	ld [wGolfOAMPtr + 0], a
	ld a, LOW(OAM_1ca6cf)
	ld [wGolfOAMPtr + 1], a
	ld a, BASE_SHOT_POWER
	ld [wShotPowerGaugeCursor], a

	ld hl, wGolfWarioYPos
	ld a, $58
	ld [hli], a ; wGolfWarioYPos
	xor a
	ld [hli], a
	ld a, $40
	ld [hli], a ; wGolfWarioXPos
	xor a
	ld [hli], a
	ld a, LOW(PARAGOOM_TEE_BOX_LEVEL)
	ld [hli], a ; wGolfParaGoomYPos
	ld a, HIGH(PARAGOOM_TEE_BOX_LEVEL)
	ld [hli], a
	ld a, $80
	ld [hli], a ; wGolfParaGoomXPos
	xor a
	ld [hli], a

	call UpdateGolfLevelUI
	call UpdateGolfParaGoom
	call UpdateGolfWario
	jp ClearUnusedVirtualOAM

PrintGolfStrokeNumber:
	ld hl, GolfStrokeNumbersGfx
	ld a, [wGolfStroke]
	ld d, 0
	ld e, a
.loop_div
	cp 10
	jr c, .done_div
	sub 10
	ld e, a
	inc d
	jr .loop_div
.done_div
	push de
	ld a, d
	and a
	jr z, .got_tens_digit
	ld bc, 2 tiles
.loop_tens_digit
	add hl, bc
	dec d
	jr nz, .loop_tens_digit
.got_tens_digit
	ld de, w1db90
	ld b, 2 tiles
	call CopyHLToDE
	pop de

	ld hl, GolfStrokeNumbersGfx
	ld a, e
	and a
	jr z, .got_ones_digit
	ld bc, 2 tiles
.loop_ones_digit
	add hl, bc
	dec e
	jr nz, .loop_ones_digit
.got_ones_digit
	ld de, w1db90 tile $02
	ld b, 2 tiles
	jp CopyHLToDE

HandleGolfLevel:
	ld a, HIGH(OAM_1ca6cf)
	ld [wGolfOAMPtr + 0], a
	ld a, LOW(OAM_1ca6cf)
	ld [wGolfOAMPtr + 1], a

	call GolfLevelStateTable
	call UpdateGolfLevelUI
	call UpdateGolfParaGoom
	call UpdateGolfWario
	call ClearUnusedVirtualOAM
	call LoadGolfWarioStateGfx
	jp Func_1c9cf9

UpdateGolfLevelUI:
	ld a, $30
	ld [wGolfObj1YCoord], a
	ld a, $0c
	ld [wGolfObj1XCoord], a
	ld de, Frameset_1caf6f
	ld hl, wGolfObj1Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj1CurrentFrame]
	ld [wGolfObj1Frame], a
	ld hl, wGolfObj1Sprite
	call AddGolfSprite

	ld a, $30
	ld [wGolfObj2YCoord], a
	ld a, $08
	ld [wGolfObj2XCoord], a
	ld de, Frameset_1caf81
	ld hl, wGolfObj2Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj2CurrentFrame]
	ld [wGolfObj2Frame], a
	ld hl, wGolfObj2Sprite
	call AddGolfSprite

	ld a, [wGolfLevelState]
	cp GOLFLEVELSTATE_PAUSE
	ret z
	ld a, SCREEN_HEIGHT_PX
	ld [wGolfObj3YCoord], a
	ld a, $58
	ld [wGolfObj3XCoord], a
	ld de, Frameset_1caf8a
	ld hl, wGolfObj3Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj3CurrentFrame]
	ld [wGolfObj3Frame], a
	ld hl, wGolfObj3Sprite
	call AddGolfSprite

	ld a, [wGolfObj4State]
	and a
	ret nz
	ld a, SCREEN_HEIGHT_PX
	ld [wGolfObj4YCoord], a
	ld a, [wShotPowerGaugeCursor]
	add $32
	ld [wGolfObj4XCoord], a
	ld de, Frameset_1caf84
	ld hl, wGolfObj4Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj4CurrentFrame]
	ld [wGolfObj4Frame], a
	ld hl, wGolfObj4Sprite
	call AddGolfSprite

	ld a, [wGolfObj5State]
	and a
	ret z
	ld a, SCREEN_HEIGHT_PX
	ld [wGolfObj5YCoord], a
	ld a, [wSelectedShotPowerGauge]
	add $32
	ld [wGolfObj5XCoord], a
	ld de, Frameset_1caf87
	ld hl, wGolfObj5Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj5CurrentFrame]
	ld [wGolfObj5Frame], a
	ld hl, wGolfObj5Sprite
	jp AddGolfSprite

UpdateGolfParaGoom:
	ld a, [w1dc20]
	and a
	ret nz
	ld a, [wGolfParaGoomState]
	cp GOLF_PARAGOOM_8
	ret nc
	ld hl, wGolfParaGoomXPos
	ld a, [hli]
	ld d, [hl]
	ld e, a
	srl d
	rr e
	srl d
	rr e
	; de / 4
	push de
	call Func_1c8f56
	and a
	jr nz, .asm_1c8d96 ; if true
	pop de
	ret
.asm_1c8d96
	pop de
	; calculate ParaGoom's coordinates in the screen
	ld a, [wSCX]
	ld b, a
	ld a, e
	add OAM_X_OFS
	sub b
	ld [wGolfParaGoomXCoord], a
	ld b, $12
	ld a, [wGolfParaGoomState]
	ld c, a
	cp GOLF_PARAGOOM_8
	ret nc
	cp GOLF_PARAGOOM_5
	jr nz, .asm_1c8db1
	ld b, $13
.asm_1c8db1
	ld hl, wGolfParaGoomYPos
	ld a, [hli]
	ld d, [hl]
	ld e, a
	srl d
	rr e
	srl d
	rr e
	; de / 4
	ld a, e
	add b
	ld [wGolfParaGoomYCoord], a

	ld hl, .Framesets
	ld b, $00
	sla c
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wGolfParaGoomDuration
	call UpdateGolfObjectAnimation

	ld b, FALSE
	bit 0, c
	call nz, HandleGolfParaGoomRespawn
	bit 0, b
	ret nz
	ld a, [wGolfParaGoomState]
	cp $02
	jr nz, .add_sprite
	ld a, [wGolfParaGoomDuration]
	and a
	jr nz, .add_sprite
	ld a, [wGolfParaGoomFramesetOffset]
	cp $1e
	jr z, .asm_1c8e01
	cp $14
	jr nz, .add_sprite
	play_sfx SFX_00F
	jr .add_sprite
.asm_1c8e01
	play_sfx SFX_0E5
.add_sprite
	ld a, [wGolfParaGoomCurrentFrame]
	ld [wGolfParaGoomFrame], a
	ld hl, wGolfParaGoomSprite
	jp AddGolfSprite

.Framesets
	dw Frameset_1cafb1 ; GOLF_PARAGOOM_0
	dw Frameset_1cafb6 ; GOLF_PARAGOOM_1
	dw Frameset_1cafc7 ; GOLF_PARAGOOM_2
	dw Frameset_1cafe8 ; GOLF_PARAGOOM_3
	dw Frameset_1cb005 ; GOLF_PARAGOOM_4
	dw Frameset_1cafb1 ; GOLF_PARAGOOM_5

; unreferenced?
Frameset_1c8e21:
	db $23, 78
	db $20,  4
	db $ff

HandleGolfParaGoomRespawn:
	ld a, [wGolfParaGoomState]
	cp GOLF_PARAGOOM_2
	jr z, .asm_1c8e32
	cp GOLF_PARAGOOM_3
	jr z, .asm_1c8e7c
	ret

.asm_1c8e32
	ld hl, wLastGolfParaGoomYPos
	ld a, LOW(PARAGOOM_GROUND_LEVEL)
	ld [hli], a
	ld [hl], HIGH(PARAGOOM_GROUND_LEVEL)
	ld hl, wGolfParaGoomYPos
	xor a
	ld [hli], a
	ld [hli], a

	ld a, [wGolfTerrain]
	and GOLF_TERRAIN_2ND_WATER
	jr nz, .second_water_set
	ld a, [wGolfWaterSpawn1]
	jr .got_water_spawn_block
.second_water_set
	ld a, [wGolfWaterSpawn2]
.got_water_spawn_block
	ld d, $00
	ld e, a
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	; * 32
	ld a, e
	ld [hli], a ; wGolfParaGoomXPos
	ld [hl], d

	call AlignGolfXScrollWithParaGoom
	call UpdateGolfDisplayMode
	ld b, TRUE
	xor a
	ld [wGolfParaGoomFramesetOffset], a
	ld a, GOLF_PARAGOOM_4
	ld [wGolfParaGoomState], a
	jr SetGolfParaGoomRespawnYPosIfEnoughStrokes

.asm_1c8e7c
	ld hl, wGolfParaGoomYPos
	xor a
	ld [hli], a
	ld [hli], a
	ld de, wLastGolfParaGoomXPos
	ld a, [de]
	ld [hli], a ; wGolfParaGoomXPos
	inc de
	ld a, [de]
	ld [hl], a
	ld b, TRUE
	ld a, GOLF_PARAGOOM_8
	ld [wGolfParaGoomState], a
;	fallthrough

SetGolfParaGoomRespawnYPosIfEnoughStrokes:
	ld a, [wGolfMaxStrokes]
	ld c, a
	ld a, [wGolfStroke]
	cp c
	ret c ; wGolfStroke < wGolfMaxStrokes
	ld hl, wGolfParaGoomYPos
	ld a, LOW(PARAGOOM_GROUND_LEVEL)
	ld [hli], a
	ld [hl], HIGH(PARAGOOM_GROUND_LEVEL)
	ld a, TRUE
	ld [w1dc20], a
	ret

UpdateGolfWario:
	ld hl, wGolfWarioXPos
	ld a, [hli]
	ld d, [hl]
	ld e, a
	srl d
	rr e
	srl d
	rr e
	; de / 2
	push de
	call Func_1c8f56
	and a
	jr nz, .asm_1c8f02
	pop de
	ld a, [w1dc21]
	and a
	ret z
	xor a
	ld [w1dc21], a

	ld a, [wGolfWarioDir]
	and a
	jr nz, .asm_1c8ee5
	ld hl, wGolfXScroll
	ld a, [hli]
	ld d, [hl]
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld a, e
	sub 40
	ld e, a
	ld a, d
	sbc 0
	ld d, a
	jr .asm_1c8efb
.asm_1c8ee5
	ld hl, wGolfXScroll
	ld a, [hli]
	ld d, [hl]
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld a, e
	add LOW(680)
	ld e, a
	ld a, d
	adc HIGH(680)
	ld d, a
.asm_1c8efb
	ld hl, wGolfWarioXPos
	ld a, e
	ld [hli], a
	ld [hl], d
	ret

.asm_1c8f02
	xor a
	ld [w1dc21], a
	pop de
	ld a, [wSCX]
	ld b, a
	ld a, e
	add OAM_X_OFS
	sub b
	ld [wGolfWarioXCoord], a
	ld a, [wGolfWarioYPos]
	add $11
	ld [wGolfWarioYCoord], a
	call UpdateGolfWarioAnimation
	ld a, [wGolfWarioState]
	cp GOLF_WARIO_WALKING
	ret nz
	ld a, [wGolfWarioFramesetOffset]
	cp $2
	ret nz
	ld a, [wGolfWarioDuration]
	and a
	ret nz
	play_sfx SFX_WALK
	ret

; holds the last frame in the animation
; of some states of Golf Wario
; and increments wGolfCounter
HoldGolfWarioLastFrame::
	ld a, [wGolfWarioState]
	cp GOLF_WARIO_CHARGING
	jr z, .ok
	cp GOLF_WARIO_ATTACKING_1
	jr z, .ok
	cp GOLF_WARIO_MISSING
	jr z, .ok
	cp GOLF_WARIO_TURNING
	jr z, .ok
	ret
.ok
	ld hl, wGolfCounter
	inc [hl]
	ld a, [wGolfAnimLastFrame]
	ld [wGolfWarioCurrentFrame], a
	ret

; return (wGolfXScroll - $e0) <= de < (wGolfXScroll + $b0)
Func_1c8f56:
	ld hl, wGolfXScroll
	call Sub16Bit
	ld a, d
	and a
	jr z, .greater_or_equal
	cp -1
	jr z, .less_than
	; > wGolfXScroll + $100 || < wGolfXScroll - $100

.false
	xor a ; FALSE
	ret

.greater_or_equal
	ld a, e
	cp $b0
	jr nc, .false ; >= wGolfXScroll + $b0
	ld a, TRUE
	ret

.less_than
	ld a, e
	cp $e0
	jr c, .false ; < wGolfXScroll - $e0
	ld a, TRUE
	ret

; stores the bank and pointer
; for Golf Wario graphics of his current state
; the graphics will be loaded during VBlank
LoadGolfWarioStateGfx:
	ld hl, .GfxBanks
	ld a, [wGolfWarioState]
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wGolfWarioTilesBank], a
	ld hl, .GfxPointers
	sla c
	add hl, bc
	ld a, [hli]
	ld [wGolfWarioTilesPtr + 1], a
	ld a, [hl]
	ld [wGolfWarioTilesPtr + 0], a
	ret

.GfxBanks
	db BANK(WarioIdleGfx)   ; GOLF_WARIO_IDLING
	db BANK(WarioWalkGfx)   ; GOLF_WARIO_WALKING
	db BANK(WarioAttackGfx) ; GOLF_WARIO_CHARGING
	db BANK(WarioAttackGfx) ; GOLF_WARIO_ATTACKING_1
	db BANK(WarioAttackGfx) ; GOLF_WARIO_ATTACKING_2
	db BANK(WarioGolfMiss)  ; GOLF_WARIO_MISSING
	db BANK(WarioClearGfx)  ; GOLF_WARIO_CLEARED
	db BANK(WarioClearGfx)  ; GOLF_WARIO_LOST
	db BANK(WarioClearGfx)  ; GOLF_WARIO_WAITING
	db BANK(WarioClearGfx)  ; GOLF_WARIO_ENTERING_DOOR
	db BANK(WarioIdleGfx)   ; GOLF_WARIO_GOING_IN_PIPE
	db BANK(WarioIdleGfx)   ; GOLF_WARIO_TURNING

.GfxPointers
	dw WarioIdleGfx   ; GOLF_WARIO_IDLING
	dw WarioWalkGfx   ; GOLF_WARIO_WALKING
	dw WarioAttackGfx ; GOLF_WARIO_CHARGING
	dw WarioAttackGfx ; GOLF_WARIO_ATTACKING_1
	dw WarioAttackGfx ; GOLF_WARIO_ATTACKING_2
	dw WarioGolfMiss  ; GOLF_WARIO_MISSING
	dw WarioClearGfx  ; GOLF_WARIO_CLEARED
	dw WarioClearGfx  ; GOLF_WARIO_LOST
	dw WarioClearGfx  ; GOLF_WARIO_WAITING
	dw WarioClearGfx  ; GOLF_WARIO_ENTERING_DOOR
	dw WarioIdleGfx   ; GOLF_WARIO_GOING_IN_PIPE
	dw WarioIdleGfx   ; GOLF_WARIO_TURNING

Func_1c8fb7:
	ret

GolfLevelStateTable:
	ld a, [wGolfLevelState]
	jumptable
	dw GolfLevelState_WaitInput       ; GOLFLEVELSTATE_WAIT_INPUT
	dw GolfLevelState_Scroll          ; GOLFLEVELSTATE_SCROLL
	dw GolfLevelState_SelectShotPower ; GOLFLEVELSTATE_SELECT_SHOT_POWER
	dw GolfLevelState_SelectShotSpin  ; GOLFLEVELSTATE_SELECT_SHOT_SPIN
	dw GolfLevelState_StartShot       ; GOLFLEVELSTATE_START_SHOT
	dw GolfLevelState_Shot            ; GOLFLEVELSTATE_SHOT
	dw GolfLevelState_Bounce          ; GOLFLEVELSTATE_BOUNCE
	dw GolfLevelState_SpecialTerrain  ; GOLFLEVELSTATE_SPECIAL_TERRAIN
	dw GolfLevelState_Walk            ; GOLFLEVELSTATE_WALK
	dw GolfLevelState_BetweenShots    ; GOLFLEVELSTATE_BETWEEN_SHOTS
	dw GolfLevelState_Cleared         ; GOLFLEVELSTATE_CLEARED
	dw GolfLevelState_GameOver        ; GOLFLEVELSTATE_GAME_OVER
	dw GolfLevelState_Pause           ; GOLFLEVELSTATE_PAUSE
	dw GolfLevelState_Result          ; GOLFLEVELSTATE_RESULT

GolfLevelState_WaitInput:
	ld hl, wGolfXScroll
	ld a, [hli]
	ld d, [hl]
	ld e, a

	ld a, [wJoypadPressed]
	bit SELECT_F, a
	jr nz, .select_btn
	bit A_BUTTON_F, a
	jr nz, .a_btn
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	ret

.select_btn
	play_sfx SFX_0E4
	xor a
	ld [wGolfObj3Duration], a
	ld [wGolfObj3FramesetOffset], a
	ld a, GOLFLEVELSTATE_PAUSE
	ld [wGolfLevelState], a
	ret

.a_btn
	play_sfx SFX_0E9

	; clear wGolfOverlayText
	ld hl, wGolfOverlayText
	xor a
	ld c, $8
.loop_clear_obj
	ld [hli], a
	dec c
	jr nz, .loop_clear_obj
	xor a
	ld [wGolfResult], a
	ld a, GOLFLEVELSTATE_SELECT_SHOT_POWER
	ld [wGolfLevelState], a
	ld a, [wGolfTerrain]
	ld [wStrokeGolfTerrain], a
	ld a, [w1dc47]
	ld [w1dc53], a

	; save ParaGoom's current position
	; for future reference
	ld hl, wGolfParaGoomYPos
	ld de, wLastGolfParaGoomYPos
	ld b, 4
	jp CopyHLToDE

.d_right
	ld a, d
	and a
	jr z, .asm_1c9041
	ld a, e
	cp LOW(MAX_GOLF_X_SCROLL)
	ret nc ; can't scroll right
.asm_1c9041
	xor a ; right
	jr .begin_scroll

.d_left
	ld a, d
	or e
	ret z ; can't scroll left
	ld a, $1 ; left

.begin_scroll
	ld [wGolfLevelScrollingDir], a
	ld hl, wGolfXScroll
	ld a, [hli]
	ld [wTempGolfXScroll + 0], a
	ld a, [hl]
	ld [wTempGolfXScroll + 1], a
	ld a, GOLFLEVELSTATE_SCROLL
	ld [wGolfLevelState], a
	ret

GolfLevelState_Scroll:
	call .HandleDirectionalInputScroll

; handle ParaGoom ghost
	ld hl, wGolfParaGoomXPos
	ld a, [hli]
	ld d, [hl]
	ld e, a
	srl d
	rr e
	srl d
	rr e
	; de / 4

	ld a, [wGolfTerrain]
	cp GOLF_TERRAIN_ROUGH
	jr z, .rough
	cp GOLF_TERRAIN_BUNKER
	jr z, .bunker
	ld b, $a0
	jr .asm_1c9083
.rough
	ld b, $80
	jr .asm_1c9083
.bunker
	ld b, $50
.asm_1c9083
	ld a, [wGolfHoleDirection]
	and a
	jr nz, .asm_1c9092
	ld a, e
	add b
	ld e, a
	ld a, d
	adc 0
	ld d, a
	jr .asm_1c9099
.asm_1c9092
	ld a, e
	sub b
	ld e, a
	ld a, d
	sbc 0
	ld d, a

.asm_1c9099
	push de
	call Func_1c8f56
	and a
	jr nz, .inside_view
	; outside of view
	pop de
	ret
.inside_view
	pop de
	ld a, [wSCX]
	ld b, a
	ld a, e
	add OAM_X_OFS
	sub b
	ld [wGolfParaGoomGhostXCoord], a
	ld a, $72
	ld [wGolfParaGoomGhostYCoord], a
	ld hl, wGolfParaGoomGhostDuration
	ld de, Frameset_1cb0a4
	call UpdateGolfObjectAnimation
	ld a, [wGolfParaGoomGhostCurrentFrame]
	ld [wGolfParaGoomGhostFrame], a
	ld hl, wGolfParaGoomGhostSprite
	jp AddGolfSprite

.HandleDirectionalInputScroll:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .restore_scroll
	bit B_BUTTON_F, a
	jr nz, .restore_scroll

	ld hl, wGolfXScroll
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wGolfLevelScrollingDir]
	and a
	jr nz, .dir_left

; dir right
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr z, .no_directional_input
	ld a, d
	and a
	jr z, .asm_1c90ee
	ld a, e
	cp LOW(MAX_GOLF_X_SCROLL)
	ret nc ; can't scroll right
.asm_1c90ee
	inc de
	jr .apply_scroll

.dir_left
	ld a, [wJoypadDown]
	bit D_LEFT_F, a
	jr z, .no_directional_input
	ld a, d
	or e
	ret z ; can't scroll left
	dec de
.apply_scroll
	ld a, d
	ld [hld], a
	ld a, e
	ld [hl], a
	jr UpdateGolfDisplayMode

.no_directional_input
; auto-scroll to the original position
	ld hl, wGolfXScroll
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wGolfLevelScrollingDir]
	and a
	jr nz, .auto_scroll_right
	dec de
	jr .done_auto_scrolling
.auto_scroll_right
	inc de
.done_auto_scrolling
	ld a, d
	ld [hld], a
	ld a, e
	ld [hl], a
	ld hl, wTempGolfXScroll
	call Sub16Bit
	ld a, d
	or e
	jr nz, UpdateGolfDisplayMode
	; done auto-scrolling
	ld a, GOLFLEVELSTATE_WAIT_INPUT
	ld [wGolfLevelState], a
	jr UpdateGolfDisplayMode

.restore_scroll
	ld a, [wTempGolfXScroll + 0]
	ld [wGolfXScroll + 0], a
	ld a, [wTempGolfXScroll + 1]
	ld [wGolfXScroll + 1], a
	ld a, GOLFLEVELSTATE_WAIT_INPUT
	ld [wGolfLevelState], a
;	fallthrough

UpdateGolfDisplayMode:
	ld hl, wGolfXScroll + 1
	ld a, [hld]
	and a
	jr z, .not_bgmap1
	ld a, [hl]
	ld [wSCX], a
	ld a, GOLF_DISPLAY_BGMAP1
	ld [wGolfDisplayMode], a
	ret
.not_bgmap1
	ld a, [hl]
	ld [wSCX], a
	cp LOW(MAX_GOLF_X_SCROLL)
	jr c, .no_split
; split
	ld a, $a7
	sub [hl]
	add $60
	ld [w1dc25], a
	ld a, GOLF_DISPLAY_SPLIT
	ld [wGolfDisplayMode], a
	ret
.no_split
	xor a ; GOLF_DISPLAY_BGMAP0
	ld [wGolfDisplayMode], a
	ret

GolfLevelState_SelectShotPower:
	ld a, [wIsPowerGaugeFalling]
	and a
	jr nz, .falling

	; if < 16 add 1 to shot power
	; otherwise, add 2 
	ld b, 1
	ld a, [wShotPowerGaugeCursor]
	cp 16
	jr c, .add_1
	ld b, 2
.add_1
	add b
	ld [wShotPowerGaugeCursor], a
	cp MAX_SHOT_POWER
	jr c, .check_a_btn
	play_sfx SFX_0EA
	ld a, TRUE
	ld [wIsPowerGaugeFalling], a
	jr .check_a_btn

.falling
	ld a, [wShotPowerGaugeCursor]
	sub 2
	ld [wShotPowerGaugeCursor], a
	jr nc, .check_a_btn
	; player let the cursor go down to 0
	xor a
	ld [wGolfCounter], a
	ld [wShotPowerGaugeCursor], a
	ld a, GOLFLEVELSTATE_START_SHOT
	ld [wGolfLevelState], a
	ret

.check_a_btn
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z ; no A button
	xor a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	inc a ; $1
	ld [wGolfObj5State], a
	ld a, GOLFLEVELSTATE_SELECT_SHOT_SPIN
	ld [wGolfLevelState], a

	; translate selected power gauge
	; into shot power level
	ld hl, wShotYVel
	ld a, [wShotPowerGaugeCursor]
	ld [wSelectedShotPowerGauge], a
	cp 16
	jr c, .power_lvl_0
	cp 24
	jr c, .power_lvl_1
	cp 32
	jr c, .power_lvl_2
	cp 40
	jr c, .power_lvl_3
	cp 48
	jr c, .power_lvl_4
	cp 56
	jr c, .power_lvl_5
	cp 64
	jr c, .power_lvl_6
	cp 70
	jr c, .power_lvl_7
	cp 74
	jr c, .power_lvl_8
; power lvl 9
	ld a, SHOT_POWER_9
	ld [wShotPowerLevel], a
	jr .got_power_lvl
.power_lvl_0
	xor a ; SHOT_POWER_0
	ld [wShotPowerLevel], a
	jr .got_power_lvl
.power_lvl_1
	ld a, SHOT_POWER_1
	ld [wShotPowerLevel], a
	jr .got_power_lvl
.power_lvl_2
	ld a, SHOT_POWER_2
	ld [wShotPowerLevel], a
	jr .got_power_lvl
.power_lvl_3
	ld a, SHOT_POWER_3
	ld [wShotPowerLevel], a
	jr .got_power_lvl
.power_lvl_4
	ld a, SHOT_POWER_4
	ld [wShotPowerLevel], a
	jr .got_power_lvl
.power_lvl_5
	ld a, SHOT_POWER_5
	ld [wShotPowerLevel], a
	jr .got_power_lvl
.power_lvl_6
	ld a, SHOT_POWER_6
	ld [wShotPowerLevel], a
	jr .got_power_lvl
.power_lvl_7
	ld a, SHOT_POWER_7
	ld [wShotPowerLevel], a
	jr .got_power_lvl
.power_lvl_8
	ld a, SHOT_POWER_8
	ld [wShotPowerLevel], a

.got_power_lvl
	ld hl, .data
	ld de, wShotYVel
	ld a, [wShotPowerLevel]
	sla a ; *2
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hli]
	ld [de], a ; wShotYVel
	inc de
	xor a
	ld [de], a ; w1dc4f
	inc de
	ld a, [hl]
	ld [de], a ; wShotXVel

	ld a, [wGolfTerrain]
	cp GOLF_TERRAIN_ROUGH
	jr z, .rough
	cp GOLF_TERRAIN_BUNKER
	jr z, .bunker
	xor a ; SHOT_MODIFIER_NONE
	ld [wShotTerrainModifier], a
	ret

.rough
	ld hl, wShotYVel
	ld a, [hl]
	add [hl]
	add [hl]
	add $3
	srl a
	srl a
	ld [hli], a ; (a*3 + 3) / 4
	ld a, SHOT_MODIFIER_ROUGH
	ld [wShotTerrainModifier], a
	ret

.bunker
	ld hl, wShotYVel
	ld a, [hl]
	inc a
	srl a
	dec a
	ld [hli], a ; ((a + 1) / 2) - 1
	ld a, SHOT_MODIFIER_BUNKER
	ld [wShotTerrainModifier], a
	ret

.data
	db  4,  4 ; SHOT_POWER_0
	db  6,  6 ; SHOT_POWER_1
	db  8,  8 ; SHOT_POWER_2
	db 10, 10 ; SHOT_POWER_3
	db 12, 11 ; SHOT_POWER_4
	db 16, 12 ; SHOT_POWER_5
	db 18, 13 ; SHOT_POWER_6
	db 20, 14 ; SHOT_POWER_7
	db 22, 15 ; SHOT_POWER_8
	db 24, 16 ; SHOT_POWER_9

GolfLevelState_SelectShotSpin:
	ld a, [wIsPowerGaugeFalling]
	and a
	jr nz, .falling
	ld b, 1
	ld a, [wSelectedShotPowerGauge]
	cp 16
	jr c, .add_1
	ld b, 2
.add_1
	add b
	ld [wSelectedShotPowerGauge], a
	cp MAX_SHOT_POWER
	jr c, .check_a_btn
	play_sfx SFX_0EA
	ld a, TRUE
	ld [wIsPowerGaugeFalling], a
	jr .check_a_btn

.falling
	ld a, [wSelectedShotPowerGauge]
	sub 2
	ld [wSelectedShotPowerGauge], a
	jr nc, .check_a_btn
	xor a
	ld [wSelectedShotPowerGauge], a
	jr .check_spin

.check_a_btn
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z ; no A button

.check_spin
	xor a
	ld [wGolfCounter], a
	ld a, GOLFLEVELSTATE_START_SHOT
	ld [wGolfLevelState], a
	ld a, [wSelectedShotPowerGauge]
	cp 2
	jr c, .missed
	cp 5
	jr c, .backspin
	cp 11
	jr c, .normal_shot
	cp 14
	jr c, .topspin
.missed
	xor a ; SHOT_MISS
	ld [wShotSpin], a
	ret
.backspin
	ld a, SHOT_BACKSPIN
	ld [wShotSpin], a
	ret
.normal_shot
	ld a, SHOT_NORMAL
	ld [wShotSpin], a
	ret
.topspin
	ld a, SHOT_TOPSPIN
	ld [wShotSpin], a
	ret

GolfLevelState_StartShot:
	ld hl, wGolfCounter
	ld a, [hl]
	and a
	jr z, .StartShot
	cp 1
	jr z, .ChargeShot
	cp 3
	jr z, .HitOrMiss
	cp 5
	jr nc, .FinishShot
	ret

.StartShot
	inc [hl]
	ld hl, wGolfStroke
	inc [hl]
	ld a, $03
	ld [wGolfVBlankMode], a
	jp PrintGolfStrokeNumber

.ChargeShot
	inc [hl]
	play_sfx SFX_0ED
	xor a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld a, GOLF_WARIO_CHARGING
	ld [wGolfWarioState], a
	ld a, $02
	ld [wGolfVBlankMode], a
	ret

.HitOrMiss
	inc [hl]
	xor a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld a, [wShotPowerGaugeCursor]
	and a
	jr z, .missed_1 ; SHOT_POWER_0
	ld a, [wShotSpin]
	and a
	jr z, .missed_1 ; SHOT_MISS
; hit
	play_sfx SFX_017
	ld a, GOLF_WARIO_ATTACKING_1
	ld [wGolfWarioState], a
	ret
.missed_1
	play_sfx SFX_0E8
	ld a, GOLF_WARIO_MISSING
	ld [wGolfWarioState], a
	ld a, $02
	ld [wGolfVBlankMode], a
	ret

.FinishShot
	xor a
	ld [wGolfCounter], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a

	ld a, [wGolfWarioState]
	cp GOLF_WARIO_MISSING
	jr z, .missed_2
	ld a, [wGolfHoleDirection]
	ld [wShotDirection], a
	xor a
	ld [wGolfParaGoomFramesetOffset], a
	inc a ; GOLF_PARAGOOM_1
	ld [wGolfParaGoomState], a
	ld a, GOLF_WARIO_ATTACKING_2
	ld [wGolfWarioState], a
	ld a, GOLFLEVELSTATE_BOUNCE
	ld [w1dc01], a
	ld a, GOLFLEVELSTATE_SHOT
	ld [wGolfLevelState], a
	ret

.missed_2
	ld a, $02
	ld [wGolfVBlankMode], a
	ld a, GOLF_WARIO_IDLING
	ld [wGolfWarioState], a
	ld a, GOLFLEVELSTATE_BETWEEN_SHOTS
	ld [wGolfLevelState], a
	ret

GolfLevelState_Shot:
	call UpdateGolfParaGoomXPos
	call UpdateGolfParaGoomYPos
	call AlignGolfXScrollWithParaGoom
	call UpdateGolfDisplayMode

	ld a, [wGolfLevelState]
	cp GOLFLEVELSTATE_SHOT
	ret z

	; being here means we changed the level state
	; and we are doing a bounce
	ld a, GOLFLEVELSTATE_WALK
	ld [w1dc01], a
	ld a, [wShotSpin]
	cp SHOT_NORMAL
	jr z, .normal_shot
	cp SHOT_TOPSPIN
	jr z, .topspin_shot

; backspin shot
	ld a, [wShotDirection]
	xor $1
	ld [wShotDirection], a
.normal_shot
	ld hl, .NormalBounceVels
	jr .got_vel_table
.topspin_shot
	ld hl, .TopspinBounceVels

.got_vel_table
	ld de, wShotYVel
	ld a, [wShotPowerLevel]
	sla a
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hli]
	ld [de], a ; wShotYVel
	inc de
	xor a
	ld [de], a ; w1dc4f
	inc de
	ld a, [hl]
	ld [de], a ; wShotXVel
	ld a, [wShotTerrainModifier]
	cp SHOT_MODIFIER_ROUGH
	jr z, .rough
	cp SHOT_MODIFIER_BUNKER
	jr z, .bunker
	ret
.rough
	ld hl, wShotYVel
	ld a, [hl]
	add [hl]
	add [hl]
	add 3
	srl a
	srl a
	ld [hli], a ; (a*3 + 3) / 4
	ret
.bunker
	ld hl, wShotYVel
	ld a, [hl]
	inc a
	srl a
	ld [hli], a ; (a + 1) / 2
	ret

.NormalBounceVels
	db $01, $01 ; $0
	db $02, $01 ; $1
	db $03, $02 ; $2
	db $04, $02 ; $3
	db $05, $03 ; $4
	db $06, $03 ; $5
	db $07, $03 ; $6
	db $08, $04 ; $7
	db $09, $04 ; $8
	db $0a, $04 ; $9

.TopspinBounceVels
	db $01, $02 ; $0
	db $02, $03 ; $1
	db $03, $04 ; $2
	db $04, $05 ; $3
	db $05, $06 ; $4
	db $06, $06 ; $5
	db $07, $07 ; $6
	db $08, $07 ; $7
	db $09, $08 ; $8
	db $0a, $08 ; $9

UpdateGolfParaGoomXPos:
	ld hl, w1dc51
	inc [hl]
	ld a, [hl]
	and %111
	jr nz, .skip_decr_x_vel
	ld hl, wShotXVel
	dec [hl]
.skip_decr_x_vel
	ld hl, wGolfParaGoomXPos
	ld a, [wShotDirection]
	and a
	jr nz, .going_left
; going right
	ld a, [wShotXVel]
	add [hl]
	ld [hli], a
	ld e, a
	ld a, [hl]
	adc 0
	ld [hl], a
	ld d, a
	jr .calculate_x_pos_block
.going_left
	ld a, [wShotXVel]
	ld b, a
	ld a, [hl]
	sub b
	ld [hli], a
	ld e, a
	ld a, [hl]
	sbc 0
	ld [hl], a
	ld d, a
	cp $ff
	jr nz, .calculate_x_pos_block
	; gone out of bounds to the left
	ld [hl], $00
	ld a, GOLF_TERRAIN_END
	ld [wGolfTerrain], a
	jr .out_of_bounds

.calculate_x_pos_block
	srl d
	rr e
	srl d
	rr e
	srl d
	rr e
	srl d
	rr e
	srl d
	rr e
	; de / 32
	ld a, e
	ld [w1dc3e + 0], a
	ld a, d
	ld [w1dc3e + 1], a

	; store the terrain that is directly below
	ld hl, wGolfTerrainBlocks
	add hl, de
	ld a, [hl]
	ld [wGolfTerrain], a
	and GOLF_TERRAIN_MASK
	jr z, .tee_box
	cp GOLF_TERRAIN_END
	jr z, .out_of_bounds

.set_ground_level
	ld a, LOW(PARAGOOM_GROUND_LEVEL)
	ld [wGroundLevelYPos], a
	ret

.tee_box
	ld a, [w1dc47]
	and a
	jr nz, .check_tee_ob
	ld a, LOW(PARAGOOM_TEE_BOX_LEVEL)
	ld [wGroundLevelYPos], a
	ret
.check_tee_ob
	; some tee boxes have ob areas beneath them
	; set terrain as out of bounds if a Tee Box
	; terrain block is found with any flag
	ld a, [wGolfTerrain]
	and GOLF_TERRAIN_FLAGS_MASK
	jr z, .set_ground_level
	ld c, a
	ld a, GOLF_TERRAIN_TEE_OB
	ld [wGolfTerrain], a
	jr .set_ground_level

.out_of_bounds
	xor a
	ld [wGolfParaGoomDuration], a
	ld [wGolfWarioDuration], a
	ld [wGolfParaGoomFramesetOffset], a
	ld [wGolfWarioFramesetOffset], a
	ld a, GOLF_PARAGOOM_8
	ld [wGolfParaGoomState], a
	ld a, GOLF_WARIO_IDLING
	ld [wGolfWarioState], a
	ld a, $02
	ld [wGolfVBlankMode], a
	ld a, GOLFLEVELSTATE_SPECIAL_TERRAIN
	ld [wGolfLevelState], a

	ld hl, wGolfStroke
	inc [hl]
	ret

UpdateGolfParaGoomYPos:
	; apply gravity
	ld hl, wShotYVel
	ld a, [hli]
	ld d, [hl]
	ld e, a
	dec de
	ld a, d
	ld [hld], a
	ld [hl], e

	; apply y velocity
	ld hl, wGolfParaGoomYPos
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wShotYVel
	call Sub16Bit ; treat wShotYVel as negative
	ld hl, wGolfParaGoomYPos + 1
	ld a, d
	ld [hld], a
	ld [hl], e
	cp HIGH(PARAGOOM_GROUND_LEVEL)
	ret nz
	; y pos >= $100
	ld a, [wGroundLevelYPos]
	ld d, a
	sub e
	ret nc

	; Para-Goom has reached the ground
	; snap its Y position to ground
	ld a, d
	ld [hli], a ; wGolfParaGoomYPos
	ld a, HIGH(PARAGOOM_GROUND_LEVEL)
	ld [hl], a

	ld a, [wGolfTerrain]
	and GOLF_TERRAIN_MASK
	ld d, a
	jr z, .asm_1c9521
	cp GOLF_TERRAIN_OB
	jr nc, .asm_1c9521
	ld [w1dc47], a
.asm_1c9521
	xor a
	ld [w1dc51], a
	ld a, d
	cp SPECIAL_GOLF_TERRAIN
	jr nc, .no_bounce

	; is either GOLF_TERRAIN_TEE_BOX or GOLF_TERRAIN_PLAIN
	play_sfx SFX_BUMP
	ld a, [w1dc01]
	ld [wGolfLevelState], a
	cp GOLFLEVELSTATE_BOUNCE
	ret z
	ld a, GOLFLEVELSTATE_BETWEEN_SHOTS
	ld [w1dc01], a
	call UpdateGolfHoleDirection
	xor a
	ld [wGolfParaGoomDuration], a
	ld [wGolfWarioDuration], a
	ld [wGolfParaGoomFramesetOffset], a
	ld [wGolfWarioFramesetOffset], a
	ld [wGolfParaGoomState], a
	ld a, GOLF_WARIO_IDLING
	ld [wGolfWarioState], a
	ld a, $02
	ld [wGolfVBlankMode], a
	ret

.no_bounce
	ld a, GOLFLEVELSTATE_SPECIAL_TERRAIN
	ld [wGolfLevelState], a
	xor a
	ld [wGolfParaGoomDuration], a
	ld [wGolfWarioDuration], a
	ld [wGolfParaGoomFramesetOffset], a
	ld [wGolfWarioFramesetOffset], a
	ld [wGolfParaGoomState], a
	ld a, GOLF_WARIO_IDLING
	ld [wGolfWarioState], a
	ld a, $02
	ld [wGolfVBlankMode], a

	ld a, [wGolfTerrain]
	ld c, a
	and GOLF_TERRAIN_MASK
	cp GOLF_TERRAIN_HOLE
	jr z, .hole
	cp GOLF_TERRAIN_WATER
	jr z, .water
	cp GOLF_TERRAIN_OB
	jr z, .ob
	cp GOLF_TERRAIN_TEE_OB
	jr z, .tee_ob
	cp GOLF_TERRAIN_BUNKER
	jr z, .bunker

; rough
	play_sfx SFX_0A1
	ret

.bunker
	play_sfx SFX_065
	ld a, GOLF_PARAGOOM_5
	ld [wGolfParaGoomState], a
	ret

.hole
	play_sfx SFX_0EF
	jr .check_edges

.tee_ob
	ld hl, wGolfStroke
	inc [hl]
	ret

.water
	play_sfx SFX_SPLASH
	jr .golf_stroke_penalty
.ob
	play_sfx SFX_073
	ld a, [w1dc53]
	ld [w1dc47], a
.golf_stroke_penalty
	ld a, GOLF_PARAGOOM_6
	ld [wGolfParaGoomState], a
	ld hl, wGolfStroke
	inc [hl]

.check_edges
	ld hl, w1dc3e
	bit GOLF_TERRAIN_EDGE_RIGHT_F, c
	jr nz, .right_edge
	bit GOLF_TERRAIN_EDGE_LEFT_F, c
	jr nz, .left_edge
	ret

.left_edge
	ld a, [hli]
	inc a
	jr .snap_x_pos
.right_edge
	ld a, [hli]
.snap_x_pos
	ld e, a
	ld d, [hl]
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	ld hl, wGolfParaGoomXPos
	ld a, e
	ld [hli], a
	ld [hl], d
	ret

AlignGolfXScrollWithParaGoom:
	ld hl, wGolfParaGoomXPos
	ld a, [hli]
	ld d, [hl]
	ld e, a
	srl d
	rr e
	srl d
	rr e
	; de / 4
	ld hl, wGolfXScroll
	ld a, d
	cp $2
	jr nc, .cap_x_scroll
	and a
	jr nz, .asm_1c9634
	ld a, e
	cp $50
	jr nc, .asm_1c962e
	xor a
	ld [hli], a
	ld [hl], a
	ret
.asm_1c962e
	sub $50
	ld [hli], a
	xor a
	ld [hl], a
	ret
.asm_1c9634
	ld a, e
	cp $b0
	jr c, .asm_1c9640

.cap_x_scroll
	ld a, $60
	ld [hli], a
	ld a, $01
	ld [hl], a
	ret
.asm_1c9640
	sub $50
	ld [hli], a
	ld a, d
	sbc $00
	ld [hl], a
	ret

GolfLevelState_Bounce:
	call UpdateGolfParaGoomXPos
	call UpdateGolfParaGoomYPos
	call AlignGolfXScrollWithParaGoom
	jp UpdateGolfDisplayMode

GolfLevelState_SpecialTerrain:
	ld a, $50
	ld [wGolfOverlayTextYCoord], a
	ld a, $58
	ld [wGolfOverlayTextXCoord], a
	ld [wGolfObj4State], a
	ld a, GOLFLEVELSTATE_BETWEEN_SHOTS
	ld [w1dc01], a

	ld a, [wGolfTerrain]
	and GOLF_TERRAIN_MASK
	cp GOLF_TERRAIN_HOLE
	jp z, .Hole
	cp GOLF_TERRAIN_ROUGH
	jr z, .Rough
	cp GOLF_TERRAIN_BUNKER
	jp z, .Bunker
	cp GOLF_TERRAIN_WATER
	jp z, .Water
	cp GOLF_TERRAIN_OB
	jp z, .Ob

	ld a, [wGolfParaGoomState]
	cp GOLF_PARAGOOM_4
	jp z, .asm_1c9743
	ld de, Frameset_1cb016
	ld hl, wGolfOverlayTextDuration
	call UpdateGolfObjectAnimation
	ld a, c
	and a
	jr nz, .asm_1c96ba
	ld a, [wGolfOverlayTextFramesetOffset]
	cp $2
	jr nz, .asm_1c96ae
	ld a, [wGolfOverlayTextDuration]
	cp 1
	play_sfx z, SFX_0E5
.asm_1c96ae
	ld a, [wGolfOverlayTextCurrentFrame]
	ld [wGolfOverlayTextFrame], a
	ld hl, wGolfOverlayTextSprite
	jp AddGolfSprite

.asm_1c96ba
	ld hl, wGolfParaGoomYPos
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wLastGolfParaGoomXPos + 0]
	ld [hli], a
	ld a, [wLastGolfParaGoomXPos + 1]
	ld [hl], a
	call AlignGolfXScrollWithParaGoom
	call UpdateGolfDisplayMode
	call UpdateGolfHoleDirection
	xor a
	ld [wGolfParaGoomFramesetOffset], a
	ld a, GOLF_PARAGOOM_4
	ld [wGolfParaGoomState], a
	jp SetGolfParaGoomRespawnYPosIfEnoughStrokes

.Rough:
	ld de, Frameset_1cb035
	ld hl, wGolfOverlayTextDuration
	call UpdateGolfObjectAnimation
	ld a, c
	and a
	jp nz, .asm_1c976f
	ld a, [wGolfOverlayTextFramesetOffset]
	cp $0a
	jr nz, .asm_1c9716
	jr .asm_1c9708

.Bunker:
	ld de, Frameset_1cb068
	ld hl, wGolfOverlayTextDuration
	call UpdateGolfObjectAnimation
	ld a, c
	and a
	jr nz, .asm_1c976f
	ld a, [wGolfOverlayTextFramesetOffset]
	cp $06
	jr nz, .asm_1c9716

.asm_1c9708
	ld a, [wGolfOverlayTextDuration]
	and a
	play_sfx z, SFX_0F0
.asm_1c9716
	ld a, [wGolfOverlayTextCurrentFrame]
	ld [wGolfOverlayTextFrame], a
	ld hl, wGolfOverlayTextSprite
	jp AddGolfSprite

.Water:
	ld a, [wGolfParaGoomState]
	cp GOLF_PARAGOOM_4
	jr z, .asm_1c9743
	cp GOLF_PARAGOOM_6
	ret nz
	ld hl, wGolfParaGoomYPos
	ld a, [hl]
	cp $c0
	jr nc, .done_sinking_water
	; sink
	add 4
	ld [hli], a
	ret
.done_sinking_water
	ld a, GOLF_PARAGOOM_2
	ld [wGolfParaGoomState], a
	ld a, GOLF_TERRAIN_PLAIN
	ld [wStrokeGolfTerrain], a
	ret
.asm_1c9743
	ld hl, wGolfParaGoomYPos
	ld a, [hli]
	or [hl]
	play_sfx z, SFX_0EE

	ld hl, wLastGolfParaGoomYPos
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wGolfParaGoomYPos
	ld a, [hl]
	add 2
	ld [hli], a
	ld a, [hl]
	adc 0
	ld [hld], a
	call Compare16Bit
	cp $2
	ret nc
	ld a, [wStrokeGolfTerrain]
	ld [wGolfTerrain], a

.asm_1c976f
	ld a, [wGolfParaGoomState]
	cp GOLF_PARAGOOM_5
	jr z, .asm_1c977a
	xor a ; GOLF_PARAGOOM_0
	ld [wGolfParaGoomState], a
.asm_1c977a
	xor a
	ld [wGolfCounter], a
	ld [wGolfParaGoomDuration], a
	ld [wGolfWarioDuration], a
	ld [wGolfParaGoomFramesetOffset], a
	ld [wGolfWarioFramesetOffset], a
	ld [wGolfOverlayTextFramesetOffset], a
	ld [wGolfOverlayText], a
	call UpdateGolfHoleDirection
	ld a, GOLFLEVELSTATE_WALK
	ld [wGolfLevelState], a
	ret

.Ob:
	ld a, [wGolfParaGoomState]
	cp GOLF_PARAGOOM_4
	jr z, .asm_1c9743
	cp GOLF_PARAGOOM_6
	jr nz, .asm_1c97b5
	ld hl, wGolfParaGoomYPos
	ld a, [hl]
	cp $a0
	jr nc, .done_sinking_ob
	add 4
	ld [hli], a
	ret
.done_sinking_ob
	ld a, GOLF_PARAGOOM_3
	ld [wGolfParaGoomState], a
.asm_1c97b5
	ld de, Frameset_1cb016
	ld hl, wGolfOverlayTextDuration
	call UpdateGolfObjectAnimation
	ld a, c
	and a
	jr nz, .asm_1c97e4
	ld a, [wGolfOverlayTextFramesetOffset]
	cp $2
	jr nz, .asm_1c97d8
	ld a, [wGolfOverlayTextDuration]
	cp 1
	play_sfx z, SFX_0E5
.asm_1c97d8
	ld a, [wGolfOverlayTextCurrentFrame]
	ld [wGolfOverlayTextFrame], a
	ld hl, wGolfOverlayTextSprite
	jp AddGolfSprite
.asm_1c97e4
	ld a, GOLF_PARAGOOM_4
	ld [wGolfParaGoomState], a
	call AlignGolfXScrollWithParaGoom
	call UpdateGolfDisplayMode
	jp UpdateGolfHoleDirection

.Hole:
	ld hl, wGolfCounter
	ld a, [hl]
	cp $30
	jr nc, .done_hole_animation
	cp $18
	jr nc, .inside_delay
	inc [hl]
	ld hl, .HoleXPosOffsetSigns
	ld de, wGolfParaGoomXPos
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .negative_sign
 ; positive sign
	ld hl, .HoleXPosOffsets
	add hl, bc
	ld a, [de]
	add [hl]
	ld [de], a
	inc de
	ld a, [de]
	adc 0
	ld [de], a
	jr .hole_y_pos_offsets
.negative_sign
	ld hl, .HoleXPosOffsets
	add hl, bc
	ld a, [de]
	sub [hl]
	ld [de], a
	inc de
	ld a, [de]
	sbc 0
	ld [de], a
.hole_y_pos_offsets
	ld hl, .HoleYPosOffset
	add hl, bc
	ld a, [wGolfParaGoomYPos]
	add [hl]
	ld [wGolfParaGoomYPos], a
	ret

.inside_delay
	; delay after Para-Goom has already finished
	; the hole animation
	ld hl, wGolfCounter
	inc [hl]
	ret

.done_hole_animation
	ld a, [wGolfPar]
	ld c, a
	ld a, [wGolfStroke]
	cp c
	jr z, .par
	jr nc, .over_par
; under par
	play_music2 MUSIC_GOLF_CLEAR
	jr .asm_1c9863
.par
	play_music2 MUSIC_GOLF_CLEAR
	ld a, GOLFRESULT_PAR
	ld [wGolfResult], a
.asm_1c9863
	ld a, GOLFLEVELSTATE_CLEARED
	ld [w1dc01], a
	jp .asm_1c976f
.over_par
	ld a, GOLFRESULT_OVER_PAR
	ld [wGolfResult], a
	ld a, [w1d800]
	cp $01
	jr z, .asm_1c9863
	ld a, GOLFLEVELSTATE_GAME_OVER
	ld [w1dc01], a
	jp .asm_1c976f

.HoleXPosOffsetSigns
	db $0
	db $0
	db $1
	db $1
	db $0
	db $0
	db $1
	db $1
	db $0
	db $0
	db $1
	db $1
	db $0
	db $0
	db $1
	db $1
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0

.HoleXPosOffsets
	db 2
	db 2
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 2
	db 2
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0

.HoleYPosOffset
	db  4
	db  4
	db  4
	db  4
	db  4
	db  4
	db  4
	db  4
	db  4
	db  4
	db  4
	db  4
	db  4
	db  4
	db -2
	db -2
	db  2
	db  2
	db -1
	db -1
	db  2
	db  2
	db  0
	db  0

GolfLevelState_Walk:
	ld hl, wGolfCounter
	ld a, [hl]
	cp $19
	jr nc, .walk
	cp $18
	jr nc, .asm_1c98e1
	inc [hl]
	and a
	ret nz
	ld a, $03
	ld [wGolfVBlankMode], a
	ld [w1dc21], a
	jp PrintGolfStrokeNumber

.asm_1c98e1
	ld a, [w1dc47]
	and a
	jr z, .move_x_pos
	ld a, [wGolfWarioYPos]
	cp $60
	jr nc, .move_x_pos
	ld hl, wGolfParaGoomYPos
	ld a, [hli]
	ld e, a
	ld d, [hl]
	srl d
	rr e
	srl d
	rr e
	; de / 4
	ld hl, wGolfWarioYPos
	ld a, [hl]
	sub e
	jr nc, .move_x_pos
	; descend tee box
	inc [hl]
	inc [hl]
	ld a, [hl]
	cp $60
	ret c
	ld a, $01
	ld [wGolfVBlankMode], a
	ret

.move_x_pos
	ld hl, wGolfWarioXPos
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wGolfWarioTargetXPos
	call Compare16Bit
	cp $1
	jr nz, .start_walking
	; already in target position
	xor a
	ld [wGolfCounter], a
	ld a, GOLFLEVELSTATE_BETWEEN_SHOTS
	ld [wGolfLevelState], a
	ret
.start_walking
	ld hl, wGolfCounter
	inc [hl]
	xor a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld a, GOLF_WARIO_WALKING
	ld [wGolfWarioState], a
	ld a, $02
	ld [wGolfVBlankMode], a
	ret

.walk
	ld a, [wGolfWarioDir]
	and a
	jr nz, .wario_dir_right
; Wario dir right
	ld hl, wGolfWarioXPos
	ld a, [hli]
	add 4
	ld e, a
	ld a, [hld]
	adc 0
	ld d, a
	push de
	push hl
	ld hl, wGolfWarioTargetXPos
	call Compare16Bit
	and a
	jr nz, .reached_target
	jr .continue_walking
.wario_dir_right
	ld hl, wGolfWarioXPos
	ld a, [hli]
	sub 4
	ld e, a
	ld a, [hld]
	sbc 0
	ld d, a
	push de
	push hl
	ld hl, wGolfWarioTargetXPos
	call Compare16Bit
	cp $2
	jr nz, .reached_target
.continue_walking
	pop hl
	pop de
	ld a, e
	ld [hli], a
	ld [hl], d
	ret

.reached_target
	pop hl
	pop de
	ld de, wGolfWarioTargetXPos
	ld a, [de]
	ld [hli], a ; wGolfWarioXPos
	inc de
	ld a, [de]
	ld [hl], a
	ld a, [wGolfHoleDirection]
	ld [wGolfWarioDir], a
	xor a
	ld [wGolfCounter], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a

	ld hl, w1dc01
	ld a, [hl]
	cp GOLFLEVELSTATE_CLEARED
	jr z, .asm_1c99a4
	cp GOLFLEVELSTATE_GAME_OVER
	jr z, .asm_1c99bb
	ld a, GOLF_WARIO_IDLING
	jr .asm_1c99bd
.asm_1c99a4
	ld a, [wGolfResult]
	cp GOLFRESULT_OVER_PAR
	jr nc, .asm_1c99af
	ld a, GOLF_WARIO_CLEARED
	jr .asm_1c99bd
.asm_1c99af
	play_music2 MUSIC_GOLF_GAME_OVER
.asm_1c99bb
	ld a, GOLF_WARIO_LOST
.asm_1c99bd
	ld [wGolfWarioState], a
	ld a, $02
	ld [wGolfVBlankMode], a
	ld a, [hl]
	ld [wGolfLevelState], a
	ret

; compares Para-Goomba's X position to
; this level's hole X position, and sets
; wGolfHoleDirection accordingly to the left/right
; also sets Wario's target X position to move to
UpdateGolfHoleDirection:
	ld hl, wGolfParaGoomXPos
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	; hl = wGolfLevelHoleXPos
	call Compare16Bit
	cp $2
	jr nc, .right_of_hole

; left of hole
	; wGolfParaGoomXPos <= wGolfLevelHoleXPos
	xor a
	ld [wGolfHoleDirection], a
	ld hl, wGolfParaGoomXPos
	ld de, wGolfWarioTargetXPos
	ld a, [hli]
	sub $40
	ld [de], a
	ld a, [hl]
	sbc 0
	inc de
	ld [de], a
	ret

.right_of_hole
	; wGolfParaGoomXPos > wGolfLevelHoleXPos
	ld a, $1
	ld [wGolfHoleDirection], a
	ld hl, wGolfParaGoomXPos
	ld de, wGolfWarioTargetXPos
	ld a, [hli]
	add $40
	ld [de], a
	ld a, [hl]
	adc 0
	inc de
	ld [de], a
	ret

GolfLevelState_BetweenShots:
	ld a, [wGolfCounter]
	inc a
	ld [wGolfCounter], a
	cp $08
	jr z, .check_exceeded_strokes
	cp $20
	ret c

; continue playing
	ld a, BASE_SHOT_POWER
	ld [wShotPowerGaugeCursor], a
	xor a
	ld [wGolfCounter], a
	ld [w1dc51], a
	ld [wIsPowerGaugeFalling], a
	ld [wGolfObj4State], a
	ld [wGolfObj5], a
	ld [wGolfLevelState], a ; GOLFLEVELSTATE_WAIT_INPUT
	ret

.check_exceeded_strokes
	ld a, [wGolfMaxStrokes]
	ld c, a
	ld a, [wGolfStroke]
	cp c
	ret c

	play_music2 MUSIC_GOLF_GAME_OVER

	xor a
	ld [wGolfCounter], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld [wGolfOverlayTextDuration], a
	ld [wGolfOverlayTextFramesetOffset], a
	ld a, $01
	ld [wGolfObj4State], a
	ld a, GOLF_WARIO_LOST
	ld [wGolfWarioState], a
	ld a, $02
	ld [wGolfVBlankMode], a
	ld a, GOLFLEVELSTATE_GAME_OVER
	ld [wGolfLevelState], a
	ret

GolfLevelState_Cleared:
	ld a, [w1d800]
	cp $01
	jr z, .asm_1c9ac2
	ld a, $50
	ld [wGolfOverlayTextYCoord], a
	ld a, $58
	ld [wGolfOverlayTextXCoord], a
	ld de, Frameset_1caf8d
	ld hl, wGolfOverlayTextDuration
	call UpdateGolfObjectAnimation
	ld a, [wGolfOverlayTextCurrentFrame]
	ld [wGolfOverlayTextFrame], a
	ld hl, wGolfOverlayTextSprite
	call AddGolfSprite

	ld hl, wGolfCounter
	ld a, [hl]
	cp $50
	jr nc, .input_allowed
	inc [hl]
	ret
.input_allowed
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z

	; exit
	stop_music2
	xor a
	ld [w1d800], a
	ld [wGolfMenuOption], a
	ld a, [wIsMinigameCleared]
	and a
	jr nz, .asm_1c9abc
	ld a, TRUE
	ld [wIsMinigameCleared], a
	ld a, SST_GOLF_CLEAR
	ld [wSubState], a
	ret
.asm_1c9abc
	ld a, $08
	ld [wSubState], a
	ret

.asm_1c9ac2
	call ShowGolfResultOverlayText
	call ShowGolfScore
	ld b, $50
	ld a, [wGolfWarioState]
	cp $06
	jr z, .asm_1c9ad3
	ld b, $70
.asm_1c9ad3
	ld hl, wGolfCounter
	ld a, [hl]
	cp b
	jr nc, .asm_1c9adc
	inc [hl]
	ret
.asm_1c9adc
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	ld a, [wGolfStroke]
	ld c, a
	ld a, [wGolfCourseScore]
	add c
	ld [wGolfCourseScore], a
	ld hl, w1d803
	ld a, [hl]
	cp $04
	jr z, .asm_1c9b00
	inc [hl]
	ld hl, wPredeterminedGolfLevel
	inc [hl]
	ld a, $04
	ld [wSubState], a
	ret

.asm_1c9b00
	xor a
	ld [wGolfCounter], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld [wGolfOverlayTextDuration], a
	ld [wGolfOverlayTextFramesetOffset], a
	ld [wGolfParaGoomGhostDuration], a
	ld [wGolfParaGoomGhostFramesetOffset], a

	ld a, [wGolfCourseScore]
	cp golf_score 1
	jr nc, .asm_1c9b24
	ld a, GOLFRESULT_COURSE_UNDER_PAR
	ld [wGolfResult], a
	jr .asm_1c9b29
.asm_1c9b24
	ld a, GOLFRESULT_COURSE_OVER_PAR
	ld [wGolfResult], a
.asm_1c9b29
	ld hl, wGolfBestScores
	ld a, [wGolfCourse]
	ld d, $00
	ld e, a
	add hl, de
	ld a, [wGolfCourseScore]
	cp [hl]
	jr nc, .asm_1c9b48
	play_sfx SFX_0FA
	ld a, GOLF_WARIO_CLEARED
	ld [wGolfWarioState], a
	jr .asm_1c9b4d
.asm_1c9b48
	ld a, GOLF_WARIO_LOST
	ld [wGolfWarioState], a
.asm_1c9b4d
	ld a, GOLFLEVELSTATE_RESULT
	ld [wGolfLevelState], a
	ret

ShowGolfResultOverlayText:
	ld a, $50
	ld [wGolfOverlayTextYCoord], a
	ld a, $58
	ld [wGolfOverlayTextXCoord], a
	ld hl, .Framesets
	ld a, [wGolfResult]
	add a ; *2
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wGolfOverlayTextDuration
	call UpdateGolfObjectAnimation
	ld a, [wGolfOverlayTextCurrentFrame]
	ld [wGolfOverlayTextFrame], a
	ld hl, wGolfOverlayTextSprite
	jp AddGolfSprite

.Framesets
	dw Frameset_1cb0c2 ; GOLFRESULT_UNDER_PAR
	dw Frameset_1cb089 ; GOLFRESULT_PAR
	dw Frameset_1cb0a9 ; GOLFRESULT_OVER_PAR
	dw Frameset_1c9b87 ; GOLFRESULT_COURSE_UNDER_PAR
	dw Frameset_1c9b8a ; GOLFRESULT_COURSE_OVER_PAR

Frameset_1c9b87:
	db $73,  4
	db $ff

Frameset_1c9b8a:
	db $6a,  4
	db $ff

ShowGolfScore:
	ld a, [wGolfResult]
	cp GOLFRESULT_PAR
	ret z
	cp GOLFRESULT_OVER_PAR
	jr z, .over_par
	ld a, [wGolfStroke]
	ld c, a
	ld a, [wGolfPar]
	sub c
	jr .got_ones_digit
.over_par
	ld a, [wGolfPar]
	ld c, a
	ld a, [wGolfStroke]
	sub c
	cp 10
	jr c, .got_ones_digit
	ld hl, wVirtualOAMSprite01Frame
	ld [hl], $82
	sub 10
.got_ones_digit
	add a
	add $80
	ld hl, wVirtualOAMSprite02Frame
	ld [hl], a
	ret

GolfLevelState_GameOver:
	ld a, $50
	ld [wGolfOverlayTextYCoord], a
	ld a, $58
	ld [wGolfOverlayTextXCoord], a
	ld de, Frameset_1cafa0
	ld hl, wGolfOverlayTextDuration
	call UpdateGolfObjectAnimation
	ld a, [wGolfOverlayTextCurrentFrame]
	ld [wGolfOverlayTextFrame], a
	ld hl, wGolfOverlayTextSprite
	call AddGolfSprite

	ld hl, wGolfCounter
	ld a, [hl]
	cp $50
	jr nc, .asm_1c9be5
	inc [hl]
	ret
.asm_1c9be5
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	ld a, [w1d800]
	cp $02
	jr nz, .asm_1c9bf7
	ld a, $01
	ld [wGolfMenuOption], a
.asm_1c9bf7
	xor a
	ld [wSubState], a
	ret

GolfLevelState_Pause:
	ld a, $9c
	ld [wGolfObj3YCoord], a
	ld a, $58
	ld [wGolfObj3XCoord], a
	ld de, Frameset_1cb0da
	ld hl, wGolfObj3Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj3CurrentFrame]
	ld [wGolfObj3Frame], a
	ld hl, wGolfObj3Sprite
	call AddGolfSprite

	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .asm_1c9c27
	bit B_BUTTON_F, a
	jr nz, .asm_1c9c40
	ret
.asm_1c9c27
	ld a, [w1d800]
	cp $01
	jr z, .asm_1c9c33
	ld a, $01
	ld [wGolfMenuOption], a
.asm_1c9c33
	play_sfx SFX_SELECTION
	xor a
	ld [wSubState], a
	ret
.asm_1c9c40
	play_sfx SFX_0E7
	xor a
	ld [wGolfObj3Duration], a
	ld [wGolfObj3FramesetOffset], a
	ld [wGolfLevelState], a ; GOLFLEVELSTATE_WAIT_INPUT
	ret

GolfLevelState_Result:
	call ShowGolfResultOverlayText
	call .SetOverlayTextScore

	; show "TOTAL" text overlay
	ld a, $3c
	ld [wGolfParaGoomGhostYCoord], a
	ld a, $50
	ld [wGolfParaGoomGhostXCoord], a
	ld de, Frameset_1cb0d7
	ld hl, wGolfParaGoomGhostDuration
	call UpdateGolfObjectAnimation
	ld a, [wGolfParaGoomGhostCurrentFrame]
	ld [wGolfParaGoomGhostFrame], a
	ld hl, wGolfParaGoomGhostSprite
	call AddGolfSprite

	ld hl, wGolfCounter
	ld a, [hl]
	cp $20
	jr nc, .input_allowed
	inc [hl]
	ret
.input_allowed
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	ld hl, wGolfBestScores
	ld a, [wGolfCourse]
	ld d, $00
	ld e, a
	add hl, de
	ld a, [wGolfCourseScore]
	cp [hl]
	jr nc, .skip_overwrite_score
	ld [hl], a
.skip_overwrite_score
	xor a
	ld [wSubState], a
	ret

.SetOverlayTextScore:
	ld hl, wVirtualOAMSprite00YCoord
	dec [hl]
	ld d, $00
	ld a, [wGolfCourseScore]
	ld c, a
	cp GOLF_BASE_SCORE + 1
	jr nc, .positive_score
	cp GOLF_BASE_SCORE
	jr c, .negative_score
	dec [hl]
	ld hl, wVirtualOAMSprite00Frame
	ld [hl], $fe
.negative_score
	ld a, GOLF_BASE_SCORE
	sub c
	ld e, a
	jr .loop_get_digits
.positive_score
	sub GOLF_BASE_SCORE
	ld e, a
.loop_get_digits
	cp 10
	jr c, .got_tens_digit
	sub 10
	ld e, a
	inc d
	jr .loop_get_digits
.got_tens_digit
	ld a, d
	and a
	jr z, .got_ones_digit
	add a
	add $80
	ld hl, wVirtualOAMSprite01Frame
	ld [hl], a
.got_ones_digit
	ld a, e
	add a
	add $80
	ld hl, wVirtualOAMSprite02Frame
	ld [hl], a
	ret

; outputs de - *hl word
Sub16Bit:
	ld a, e
	sub [hl]
	ld e, a
	inc hl
	ld a, d
	sbc [hl]
	ld d, a
	ret

; outputs in a:
; - $0 if de <  *hl
; - $1 if de == *hl
; - $2 if de >  *hl
Compare16Bit:
	push de
	call Sub16Bit
	jr c, .less_than
	; de >= *hl
	ld a, d
	or e
	jr z, .equal
	ld a, $2
	jr .done
.less_than
	; de < *hl
	xor a
	jr .done
.equal
	inc a ; $1
.done
	pop de
	ret

Func_1c9cf9:
	ld a, [wGolfDisplayMode]
	cp GOLF_DISPLAY_SPLIT
	jr z, .split
	cp GOLF_DISPLAY_BGMAP1
	jr z, .bgmap1
; bgmap0
	ld a, LCDC_DEFAULT
	jr .got_lcd_config
.split
	ld a, LCDCF_BGON | LCDCF_OBJON | LCDCF_OBJ16 | LCDCF_WINON | LCDCF_WIN9C00 | LCDCF_ON
	jr .got_lcd_config
.bgmap1
	ld a, LCDCF_BGON | LCDCF_OBJON | LCDCF_OBJ16 | LCDCF_BG9C00 | LCDCF_ON
.got_lcd_config
	ld [wGolfLCDConfig], a

	ld a, [wGolfVBlankMode]
	jumptable
	dw VBlank_1c9d1d
	dw VBlank_1c9e8d
	dw VBlank_1c9eb3
	dw VBlank_1c9ef1

VBlank_1c9d1d:
	call .UpdatePinFlagTiles
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	jp CopyHLToDE

.Func:
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	ldh [rVBK], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, [w1dc25]
	ldh [rWX], a
	ld a, [wGolfLCDConfig]
	ldh [rLCDC], a
	ld hl, rHDMA1
	ld a, HIGH(w1d900)
	ld [hli], a
	ld a, LOW(w1d900)
	ld [hli], a
	ld a, $17
	ld [hli], a
	ld a, $40
	ld [hli], a
	ld a, $03
	ld [hl], a
	xor a
	ldh [rVBK], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.end

.UpdatePinFlagTiles
	ld hl, w1dc0b
	ld a, [hl]
	cp $18
	jr nc, .frame_3
	cp $10
	jr nc, .frame_2
	cp $08
	jr nc, .frame_1
; frame 0
	ld hl, GolfPinFlag tile $00
	jr .got_tiles
.frame_1
	ld hl, GolfPinFlag tile $04
	jr .got_tiles
.frame_2
	ld hl, GolfPinFlag tile $08
	jr .got_tiles
.frame_3
	ld hl, GolfPinFlag tile $0c
.got_tiles
	ld de, w1d900
	ld b, 4 tiles
	call CopyHLToDE

	ld hl, w1dc0b
	ld a, [hl]
	inc a
	and $1f
	ld [hl], a
	ret

GolfPinFlag: INCBIN "gfx/golf/golf_pin_flag.2bpp"

VBlank_1c9e8d:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	jp CopyHLToDE

.Func:
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	ldh [rVBK], a
	ld a, $03
	ldbgcoord 5, 10
	ld a, [wGolfLCDConfig]
	ldh [rLCDC], a
	xor a
	ldh [rVBK], a
	ld [wGolfVBlankMode], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.end

VBlank_1c9eb3:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	jp CopyHLToDE

.Func:
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	xor a
	ld [wGolfVBlankMode], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, [w1dc25]
	ldh [rWX], a
	ld a, [wGolfLCDConfig]
	ldh [rLCDC], a
	ld a, [wGolfWarioTilesBank]
	ld [rROMB0], a
	ld hl, rHDMA1
	ld a, [wGolfWarioTilesPtr + 0]
	ld [hli], a
	ld a, [wGolfWarioTilesPtr + 1]
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $7f
	ld [hl], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.end

VBlank_1c9ef1:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	jp CopyHLToDE

.Func:
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	ldh [rVBK], a
	xor a
	ld [wGolfVBlankMode], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, [w1dc25]
	ldh [rWX], a
	ld a, [wGolfLCDConfig]
	ldh [rLCDC], a
	ld hl, rHDMA1
	ld a, HIGH(w1db90)
	ld [hli], a
	ld a, LOW(w1db90)
	ld [hli], a
	ld a, $0f
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $03
	ld [hl], a
	xor a
	ldh [rVBK], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.end

GolfLobbyVBlank:
	ld a, [wGolfVBlankMode]
	jumptable
	dw VBlank_1c9f36
	dw VBlank_1c9f7a

VBlank_1c9f36:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	jp CopyHLToDE

.Func:
	; update the coin number in the Golf Lobby
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	xor a
	ldh [rVBK], a
	ld a, [wGolfNumCoins + 0]
	add a
	add $e0
	ldbgcoord 6, 8
	inc a
	ldbgcoord 6, 9
	ld a, [wGolfNumCoins + 1]
	and $f0
	swap a
	add a
	add $e0
	ldbgcoord 7, 8
	inc a
	ldbgcoord 7, 9
	ld a, [wGolfNumCoins + 1]
	and $0f
	add a
	add $e0
	ldbgcoord 8, 8
	inc a
	ldbgcoord 8, 9
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.end

VBlank_1c9f7a:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	jp CopyHLToDE

.Func:
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	xor a
	ld [wGolfVBlankMode], a
	ld a, [wSCX]
	ldh [rSCX], a

	ld a, [wGolfWarioTilesBank]
	ld [rROMB0], a
	ld hl, rHDMA1
	ld a, [wGolfWarioTilesPtr + 0]
	ld [hli], a
	ld a, [wGolfWarioTilesPtr + 1]
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $7f
	ld [hl], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.end

Func_1c9fae:
	call Func_1c9fbd
	ld a, [wGolfVBlankMode]
	jumptable
	dw VBlank_1c9fe1
	dw VBlank_1c9ffa
	dw VBlank_1ca033
	dw VBlank_1ca056

Func_1c9fbd:
	ld a, [wGolfNumCoins + 0]
	add a
	add $a0
	ld hl, wVirtualOAMSprite00Frame
	ld [hl], a
	ld a, [wGolfNumCoins + 1]
	ld b, a
	and $f0
	swap a
	add a
	add $a0
	ld hl, wVirtualOAMSprite01Frame
	ld [hl], a
	ld a, b
	and $0f
	add a
	add $a0
	ld hl, wVirtualOAMSprite02Frame
	ld [hl], a
	ret

VBlank_1c9fe1:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	jp CopyHLToDE

.Func:
	ld a, $1
	ldh [rSVBK], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.end

VBlank_1c9ffa:
	ld a, $18
	ld [wdc11 + 0], a
	ld a, $c0
	ld [wdc11 + 1], a
	ld a, 14 - 1
	ld [w1dc13], a

	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	jp CopyHLToDE

.Func:
	ld a, $1
	ldh [rSVBK], a
	xor a
	ld [wGolfVBlankMode], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, w1da00
	call Func_2c30
	xor a
	ldh [rVBK], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.end

VBlank_1ca033:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	jp CopyHLToDE

.Func:
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	xor a
	ld [wGolfVBlankMode], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld hl, w1db00
	call Func_2c46
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.end

VBlank_1ca056:
	ld a, $18
	ld [wdc11 + 0], a
	ld a, $c0
	ld [wdc11 + 1], a
	ld a, 14 - 1
	ld [w1dc13], a

	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	jp CopyHLToDE

.Func:
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	xor a
	ld [wGolfVBlankMode], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, w1d900
	call Func_2c30
	xor a
	ldh [rVBK], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.end
