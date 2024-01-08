LoadTitleScreenPals:
	ld a, [wceef]
	and a
	jr nz, .asm_492a
	ld hl, Pals_4f82
	call LoadPalsToTempPals1
	ld hl, Pals_4fc2
	call LoadPalsToTempPals2
	ret

.asm_492a
	ld hl, Pals_5002
	call LoadPalsToTempPals1
	ld hl, Pals_5042
	call LoadPalsToTempPals2
	ret

LoadTitleScreenTiles:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, PlaneGfx
	ld bc, v1Tiles0
	call Decompress

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, TitleScreenGfx
	ld bc, v0Tiles0
	call Decompress
	ret

LoadTitleScreenTileMap:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, BGMap_6ae7
	ld bc, v1BGMap0
	call Decompress

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, BGMap_697a
	ld bc, v0BGMap0
	call Decompress
	ret

LoadTimeAttackDescriptionPals:
	ld hl, Pal_71b0
	call LoadPalsToTempPals1
	ret

LoadTimeAttackDescriptionTiles:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	farcall LoadFontTiles

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, PrologueBackgroundGfx
	ld de, v0Tiles2
	ld bc, $80 tiles
	ld a, BANK(PrologueBackgroundGfx)
	ldh [hCallFuncBank], a
	hcall CopyHLToDE_BC
	ret

LoadTimeAttackText:
	ld a, [wLanguage]
	and a
	jr nz, .english

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, TimeAttack2JPTextMap
	ld bc, v1BGMap0
	call Decompress

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, TimeAttack1JPTextMap
	ld bc, v0BGMap0
	call Decompress
	ret

.english
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, TimeAttack2ENTextMap
	ld bc, v1BGMap0
	call Decompress

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, TimeAttack1ENTextMap
	ld bc, v0BGMap0
	call Decompress
	ret

VBlank_Title:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, [wROMBank]
	push af
	ld a, BANK(Data_6b47)
	bankswitch
	ld a, [wcee4]
	bit 7, a
	jr z, .skip
	ld hl, Data_6b47
	xor a ; VRAM0
	ldh [rVBK], a
	debgcoord 4, 14
	push de
	ld b, 12
	call CopyHLToDE
	pop de
	ld a, e
	add BG_MAP_WIDTH
	ld e, a
	ld a, d
	adc 0
	ld d, a
	ld b, 12
	call CopyHLToDE
	ld hl, wcee4
	res 7, [hl]
.skip
	pop af
	bankswitch
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.end

; hl = BG map address
PrintNumberCoins:
	ld bc, -BG_MAP_WIDTH
	ld de, BG_MAP_WIDTH
	ld a, [wNumCoins]
	and $0f ; hundreds
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [wNumCoins + 1]
	swap a
	and $0f ; tens
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [wNumCoins + 1]
	and $0f ; ones
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ret

; sets flags in wKeyAndTreasureFlags
; corresponding to the collected treasures
; in wOWLevel
GetOWLevelCollectedTreasures:
	xor a
	ld [wKeyAndTreasureFlags], a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOWLevel)
	ldh [rSVBK], a
	ld a, [wOWLevel]
	dec a
	call .SetFlags
	pop af
	ldh [rSVBK], a
	ret

.SetFlags
	add a
	add a ; *4
	ld e, a
	ld d, $00
	ld hl, LevelTreasureIDs + NUM_LEVEL_TREASURES
	add hl, de
	ld a, [hli]
	push hl
	call IsTreasureCollected
	jr z, .red
	ld hl, wKeyAndTreasureFlags
	set GREY_TREASURE_F, [hl]
.red
	pop hl
	ld a, [hli]
	push hl
	call IsTreasureCollected
	jr z, .green
	ld hl, wKeyAndTreasureFlags
	set RED_TREASURE_F, [hl]
.green
	pop hl
	ld a, [hli]
	push hl
	call IsTreasureCollected
	jr z, .blue
	ld hl, wKeyAndTreasureFlags
	set GREEN_TREASURE_F, [hl]
.blue
	pop hl
	ld a, [hli]
	push hl
	call IsTreasureCollected
	jr z, .done
	ld hl, wKeyAndTreasureFlags
	set BLUE_TREASURE_F, [hl]
.done
	pop hl
	ret

PrintNumCollectedTreasures:
	ld bc, -BG_MAP_WIDTH
	ld de, BG_MAP_WIDTH

	; hundreds
	ld a, [wNumCollectedTreasures + 0]
	and $0f
	add a ; *2
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc

	; tens
	ld a, [wNumCollectedTreasures + 1]
	swap a
	and $0f
	add a ; *2
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc

	; ones
	ld a, [wNumCollectedTreasures + 1]
	and $0f
	add a ; *2
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ret

SelectLevel:
	ldh a, [rSVBK]
	push af
	ld a, 2 ; WRAM2
	ldh [rSVBK], a
	ld a, [wOWLevel]
	and a
	jr z, .the_temple
	cp LEVEL_GOLF_BUILDING
	jr z, .golf_building

	dec a
	add a
	add a
	add a ; *8
	ld [wLevel], a
	ld e, a
	ld d, $00
	ld hl, LevelTreasureRequisites
	add hl, de
	ld a, [hli]

	push hl
	call IsTreasureCollected
	pop hl
	ld c, a
	ld a, [hli]
	push hl
	call IsTreasureCollected
	pop hl
	and c
	jr nz, .variant_4

	ld a, [hli]
	push hl
	call IsTreasureCollected
	pop hl
	ld c, a
	ld a, [hli]
	push hl
	call IsTreasureCollected
	pop hl
	and c
	jr nz, .variant_3

	ld a, [hli]
	push hl
	call IsTreasureCollected
	pop hl
	ld c, a
	ld a, [hli]
	push hl
	call IsTreasureCollected
	pop hl
	and c
	jr nz, .variant_2

.day_night
; all levels have 4 states for day and night respectively
; setting bit 2 yields the night time levels
	ld a, [wca3b]
	and %1
	add a
	add a ; *4
	ld b, a
	ld a, [wLevel]
	or b
	ld [wLevel], a
	pop af
	ldh [rSVBK], a
	ret

.variant_4
	ld a, [wLevel]
	add 3
	ld [wLevel], a
	jr .day_night

.variant_3
	ld a, [wLevel]
	add 2
	ld [wLevel], a
	jr .day_night

.variant_2
	ld a, [wLevel]
	inc a ; add 1
	ld [wLevel], a
	jr .day_night

.the_temple
	ld a, THE_TEMPLE
	jr .got_level
.golf_building
	ld a, GOLF_BUILDING
.got_level
	ld [wLevel], a
	pop af
	ldh [rSVBK], a
	ret

Func_4b73:
	; y coord
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	add OAM_Y_OFS
	sub b
	ld [wCurSpriteYCoord], a
	; x coord
	ld a, [hli]
	add OAM_X_OFS
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a

	ld hl, OAM_6b5f
	call TryAddSprite
	ret

Func_4b93:
	; y coord
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	add OAM_Y_OFS
	sub b
	ld [wCurSpriteYCoord], a
	; x coord
	ld a, [hli]
	add OAM_X_OFS
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a

	ld hl, OAM_6d21
	call TryAddSprite
	ret

HandleStartMenuSelection:
	ld a, [wStartMenuSelection]
	bit STARTMENUF_SCROLLING_F, a
	jp nz, .MoveVertical
	bit STARTMENUF_ANIM1_F, a
	jp nz, .UpdateAnim1
	bit STARTMENUF_ANIM2_F, a
	jp nz, .UpdateAnim2

	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .a_btn
	bit D_DOWN_F, a
	jr nz, .d_down
	bit D_UP_F, a
	jr nz, .d_up
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	ret

.a_btn
	play_sfx SFX_SELECTION
	ld hl, wStartMenuSelection
	ld a, [hl]
	and $f
	cp STARTMENU_CLEAR_DATA_NO
	jr z, .asm_4bfa
	cp STARTMENU_CLEAR_DATA_YES
	jr z, .asm_4c01
	set STARTMENUF_ANIM2_F, [hl]
	xor a
	ld [wMenuObj1FramesetOffset], a
	ret

.asm_4bfa
	ld bc, Frameset_6cf2
	ld a, $23
	jr .update_obj
.asm_4c01
	ld bc, Frameset_6d05
	ld a, $24
	jr .update_obj

.d_down
	ld a, [wStartMenuSelection]
	cp STARTMENU_CONTINUE
	ret nz
	ld a, STARTMENU_CLEAR_DATA | STARTMENUF_SCROLLING
	ld [wStartMenuSelection], a
	jr .asm_4c20

.d_up
	ld a, [wStartMenuSelection]
	cp STARTMENU_CLEAR_DATA
	ret nz
	ld a, STARTMENU_CONTINUE | STARTMENUF_SCROLLING
	ld [wStartMenuSelection], a

.asm_4c20
	play_sfx SFX_0E2
	ret

.d_left
	ld a, [wStartMenuSelection]
	cp STARTMENU_CLEAR_DATA_NO
	ret nz
	call .asm_4c20
	ld bc, Frameset_6cef
	ld a, STARTMENU_CLEAR_DATA_YES
	jr .update_obj

.d_right
	ld a, [wStartMenuSelection]
	cp STARTMENU_CLEAR_DATA_YES
	ret nz
	call .asm_4c20
	ld bc, Frameset_6cec
	ld a, STARTMENU_CLEAR_DATA_NO

.update_obj
	ld [wStartMenuSelection], a
	ld hl, wMenuObj1FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hl], a
	call UpdateObjAnim
	ret

.MoveVertical
	ld a, [wStartMenuSelection]
	cp STARTMENU_CLEAR_DATA | STARTMENUF_SCROLLING
	jr z, .move_up

; move down
	ld hl, wMenuObj1YCoord
	inc [hl]
	ld a, [hl]
	cp 130
	ret nz
	ld a, 134
	ld [wMenuObj2YCoord], a
	jr .reset_move_vertical_flag

.move_up
	ld hl, wMenuObj1YCoord
	dec [hl]
	ld a, [hl]
	cp 116
	ret nz
	ld a, 118
	ld [wMenuObj2YCoord], a

.reset_move_vertical_flag
	ld hl, wStartMenuSelection
	res STARTMENUF_SCROLLING_F, [hl]
	ret

.UpdateAnim1
	ld hl, wMenuObj1End - 1
	call UpdateObjAnim
	ld a, [wObjAnimWasReset]
	and a
	ret z

.set_select_flag
	ld hl, wStartMenuSelection
	set STARTMENUF_SELECT_F, [hl]
	xor a
	ld [wMenuObj1FramesetOffset], a
	ret

.UpdateAnim2
	ld a, [wGlobalCounter]
	and %1
	ret nz
	ld hl, wMenuObj1FramesetOffset
	ld a, [hl]
	cp $10
	jr z, .set_select_flag
	inc [hl]
	and $03
	jr z, .asm_4cb2
	dec a
	jr z, .asm_4caf
	dec a
	jr z, .asm_4cb6
.asm_4caf
	xor a
	jr .asm_4cb8
.asm_4cb2
	ld a, $03
	jr .asm_4cb8
.asm_4cb6
	ld a, $01
.asm_4cb8
	dec l
	ld [hl], a
	ret

; decreases wIntroBGXOffsetFar every 4 ticks
; decreases wIntroBGXOffsetCentre by 1
; decreases wIntroBGXOffsetNear by 2
ScrollIntroBackgroundLayers:
	ld a, [wGlobalCounter]
	and %11
	jr nz, .asm_4cc6
	ld hl, wIntroBGXOffsetFar
	dec [hl]
.asm_4cc6
	ld hl, wIntroBGXOffsetCentre
	dec [hl]
	ld hl, wIntroBGXOffsetNear
	dec [hl]
	dec [hl]
	ret

; scrolls the intro background layers
; until they align to the centre
FinishIntroBackgroundScroll:
; only update far layer evert 4 ticks
	ld a, [wGlobalCounter]
	and %11
	jr nz, .centre_layer
	ld hl, wIntroBGXOffsetFar
	ld a, [hl]
	and %11111
	jr nz, .scroll_far
	ld a, [wSCX]
	ld [hl], a
	jr .centre_layer
.scroll_far
	dec [hl]

.centre_layer
	ld hl, wIntroBGXOffsetCentre
	ld a, [hl]
	and %11111
	jr nz, .scroll_centre
	ld a, [wSCX]
	ld [hl], a
	jr .far_layer
.scroll_centre
	dec [hl]

.far_layer
	ld hl, wIntroBGXOffsetNear
	ld a, [hl]
	cp 224
	jr z, .asm_4cff
	jr .scroll_near
.asm_4cff
	ld a, 224
	ld [hl], a
	jr .done
.scroll_near
	dec [hl]
	dec [hl]
.done
	ret

; pans the background of the intro airplane scene
; each horizontal layer scrolls at different speed
PanIntroBackgroundLayers:
	ld a, [wceef]
	and a
	ret nz
.sky
	ldh a, [rLY]
	cp $5b
	jr c, .sky
	call WaitVBlank

	ld a, [wIntroBGXOffsetFar]
	ldh [rSCX], a
.far_layer
	ldh a, [rLY]
	cp $63
	jr c, .far_layer
	call WaitVBlank

	ld a, [wIntroBGXOffsetCentre]
	ldh [rSCX], a
.centre_layer
	ldh a, [rLY]
	cp $73
	jr c, .centre_layer
	call WaitVBlank

	ld a, [wIntroBGXOffsetNear]
	ldh [rSCX], a
.near_layer
	ldh a, [rLY]
	cp $83
	jr c, .near_layer
	call WaitVBlank

	ld a, [wSCX]
	ldh [rSCX], a
	ret

Func_4d45:
	ld a, [wGlobalCounter]
	and %1
	jr z, .asm_4d66

	ld hl, wMenuObj5XCoord
	ld a, [hl]
	cp 176
	jr c, .incr_x1
	ld a, [wSubState]
	cp $05
	jr nc, .asm_4d66
	cp $04
	jr c, .incr_x1
	ld a, [wPlaneWarioVar]
	and a
	jr nz, .asm_4d66
.incr_x1
	inc [hl]

.asm_4d66
	ld hl, wMenuObj4XCoord
	ld a, [hl]
	cp 176
	jr c, .incr_x2
	ld a, [wSubState]
	cp $05
	ret nc
	cp $04
	jr c, .incr_x2
	ld a, [wPlaneWarioVar]
	and a
	ret nz
.incr_x2
	inc [hl]
	ret

AdjustJapaneseTimeAttackDescriptionWindow:
	ld a, [wLanguage]
	and a
	ret nz ; return if English

.asm_4d84
	ldh a, [rLY]
	cp $2f
	jr c, .asm_4d84
	call WaitVBlank
	ldh a, [rSCY]
	add $07
	ldh [rSCY], a
.asm_4d93
	ldh a, [rLY]
	cp $38
	jr c, .asm_4d93
	call WaitVBlank
	ldh a, [rSCY]
	add $07
	ldh [rSCY], a
.asm_4da2
	ldh a, [rLY]
	cp $41
	jr c, .asm_4da2
	call WaitVBlank
	ldh a, [rSCY]
	add $07
	ldh [rSCY], a
.asm_4db1
	ldh a, [rLY]
	cp $5a
	jr c, .asm_4db1
	call WaitVBlank
	ldh a, [rSCY]
	add $07
	ldh [rSCY], a
.asm_4dc0
	ldh a, [rLY]
	cp $63
	jr c, .asm_4dc0
	call WaitVBlank
	ldh a, [rSCY]
	add $07
	ldh [rSCY], a
.asm_4dcf
	ldh a, [rLY]
	cp $6c
	jr c, .asm_4dcf
	call WaitVBlank
	ldh a, [rSCY]
	add $07
	ldh [rSCY], a
	ret

VBlank_LanguageSelection:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, [wcee4]
	bit 7, a
	jr z, .skip
	and $7f
	dec a
	jr z, .english
; japanese
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	hlbgcoord 5, 7
	ld b, 13
	ld a, $07
	call WriteAToHL_BTimes
	hlbgcoord 5, 9
	ld b, 13
	ld a, $06
	call WriteAToHL_BTimes
	jr .asm_4e29
.english
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	hlbgcoord 5, 7
	ld b, 13
	ld a, $06
	call WriteAToHL_BTimes
	hlbgcoord 5, 9
	ld b, 13
	ld a, $07
	call WriteAToHL_BTimes
.asm_4e29
	ld hl, wcee4
	res 7, [hl]

.skip
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.end

Func_4e3e:
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	add OAM_Y_OFS
	sub b
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	add OAM_X_OFS
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, OAM_75c3
	call TryAddSprite
	ret

PlayIntroSFXPlane_Close:
	ld a, [wPlaneWarioXCoord]
	cp SCREEN_WIDTH_PX
	jr nc, PlayIntroSFXPlane3
	cp 112
	jr nc, PlayIntroSFXPlane2
	play_sfx_rept 12, SFX_PLANE1
	ret

PlayIntroSFXPlane2:
	play_sfx_rept 12, SFX_PLANE2
	ret

PlayIntroSFXPlane3:
	play_sfx_rept 12, SFX_PLANE3
	ret

PlayIntroSFXPlane_Far:
	ld a, [wPlaneWarioXCoord]
	cp SCREEN_WIDTH_PX
	jr nc, PlayIntroSFXPlane3
	jr PlayIntroSFXPlane2

; the treasure requistes for each variant of a level
; if both treasures are collected, then that variant is unlocked
LevelTreasureRequisites:
	; LEVEL_OUT_OF_THE_WOODS
	db GOLD_MAGIC,                 TREASURE_NONE ; variant 4
	db MAGIC_SEEDS,                EYE_OF_THE_STORM ; variant 3
	db LEAD_OVERALLS_T,            TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_PEACEFUL_VILLAGE
	db SUPER_JUMP_SLAM_OVERALLS_T, TREASURE_NONE ; variant 4
	db FLUTE,                      TREASURE_NONE ; variant 3
	db FLUTE,                      TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_VAST_PLAIN
	db BLUE_CHEMICAL,              RED_CHEMICAL ; variant 4
	db POUCH,                      TREASURE_NONE ; variant 3
	db LEAD_OVERALLS_T,            TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_BANK_OF_THE_WILD_RIVER
	db AIR_PUMP,                   TREASURE_NONE ; variant 4
	db PRINCE_FROGS_GLOVES_T,      TREASURE_NONE ; variant 3
	db GARLIC_T,                   TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_TIDAL_COAST
	db SAPLING_OF_GROWTH,          TREASURE_NONE ; variant 4
	db STATUE,                     TREASURE_NONE ; variant 3
	db GRAB_GLOVE_T,               TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_SEA_TURTLE_ROCKS
	db NIGHT_VISION_SCOPE,         TREASURE_NONE ; variant 4
	db SUPER_JUMP_SLAM_OVERALLS_T, TREASURE_NONE ; variant 3
	db SCEPTER,                    TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_DESERT_RUINS
	db SUPER_JUMP_SLAM_OVERALLS_T, TREASURE_NONE ; variant 4
	db HEAD_SMASH_HELMET_T,        TREASURE_NONE ; variant 3
	db BLUE_TABLET,                GREEN_TABLET ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_VOLCANOS_BASE
	db FOOT_OF_STONE,              TREASURE_NONE ; variant 4
	db FLUTE,                      TREASURE_NONE ; variant 3
	db TRUCK_WHEEL,                TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_POOL_OF_RAIN
	db AIR_PUMP,                   TREASURE_NONE ; variant 4
	db SWIMMING_FLIPPERS_T,        TREASURE_NONE ; variant 3
	db POUCH,                      TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_A_TOWN_IN_CHAOS
	db ELECTRIC_FAN_PROPELLER,     TREASURE_NONE ; variant 4
	db SUPER_GRAB_GLOVES_T,        TREASURE_NONE ; variant 3
	db HEAD_SMASH_HELMET_T,        TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_BENEATH_THE_WAVES
	db BLUE_CHEMICAL,              RED_CHEMICAL ; variant 4
	db SAPLING_OF_GROWTH,          TREASURE_NONE ; variant 3
	db PRINCE_FROGS_GLOVES_T,      TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_WEST_CRATER
	db RUST_SPRAY,                 TREASURE_NONE ; variant 4
	db FIRE_DRENCHER,              TREASURE_NONE ; variant 3
	db SUPER_JUMP_SLAM_OVERALLS_T, TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_GRASSLANDS
	db HIGH_JUMP_BOOTS_T,          TREASURE_NONE ; variant 4
	db FLUTE,                      TREASURE_NONE ; variant 3
	db POUCH,                      TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_BIG_BRIDGE
	db SCEPTER,                    TREASURE_NONE ; variant 4
	db GRAB_GLOVE_T,               TREASURE_NONE ; variant 3
	db SWIMMING_FLIPPERS_T,        TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_TOWER_OF_REVIVAL
	db GOLDEN_LEFT_EYE,            GOLDEN_RIGHT_EYE ; variant 4
	db STATUE,                     TREASURE_NONE ; variant 3
	db RIGHT_GLASS_EYE,            LEFT_GLASS_EYE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_STEEP_CANYON
	db RUST_SPRAY,                 TREASURE_NONE ; variant 4
	db PRINCE_FROGS_GLOVES_T,      TREASURE_NONE ; variant 3
	db FOOT_OF_STONE,              TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_CAVE_OF_FLAMES
	db RUST_SPRAY,                 TREASURE_NONE ; variant 4
	db EXPLOSIVE_PLUNGER_BOX,      TREASURE_NONE ; variant 3
	db HIGH_JUMP_BOOTS_T,          TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_ABOVE_THE_CLOUDS
	db FULL_MOON_GONG,             TREASURE_NONE ; variant 4
	db SCISSORS,                   TREASURE_NONE ; variant 3
	db MAGIC_WAND,                 TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_STAGNANT_SWAMP
	db EXPLOSIVE_PLUNGER_BOX,      TREASURE_NONE ; variant 4
	db HIGH_JUMP_BOOTS_T,          TREASURE_NONE ; variant 3
	db FOOT_OF_STONE,              TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_FRIGID_SEA
	db SUN_MEDALLION_TOP,          SUN_MEDALLION_BOTTOM ; variant 4
	db SCEPTER,                    TREASURE_NONE ; variant 3
	db GRAB_GLOVE_T,               TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_CASTLE_OF_ILLUSIONS
	db CASTLE_BRICK,               TREASURE_NONE ; variant 4
	db SUPER_GRAB_GLOVES_T,        TREASURE_NONE ; variant 3
	db SUN_MEDALLION_TOP,          SUN_MEDALLION_BOTTOM ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_COLOSSAL_HOLE
	db EXPLOSIVE_PLUNGER_BOX,      TREASURE_NONE ; variant 4
	db SUN_MEDALLION_TOP,          SUN_MEDALLION_BOTTOM ; variant 3
	db GARLIC_T,                   TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_WARPED_VOID
	db KEY_CARD_RED,               KEY_CARD_BLUE ; variant 4
	db WARP_REMOVAL_APPARATUS,     TREASURE_NONE ; variant 3
	db WARP_REMOVAL_APPARATUS,     TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_THE_EAST_CRATER
	db PICK_AXE,                   TREASURE_NONE ; variant 4
	db JACKHAMMER,                 TREASURE_NONE ; variant 3
	db FIRE_DRENCHER,              TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

	; LEVEL_FOREST_OF_FEAR
	db DEMONS_BLOOD,               TREASURE_NONE ; variant 4
	db MYSTERY_HANDLE,             TREASURE_NONE ; variant 3
	db SUPER_GRAB_GLOVES_T,        TREASURE_NONE ; variant 2
	db TREASURE_NONE,              TREASURE_NONE ; variant 1

Pals_4f82:
	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31

	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31

	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31

	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31

	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31

	rgb 16, 30, 31
	rgb  8, 19, 31
	rgb  5, 14, 23
	rgb  8, 19, 31

	rgb 31, 31, 31
	rgb  8, 19, 31
	rgb  0,  8,  0
	rgb  0,  4,  0

	rgb  0,  4, 0
	rgb 10, 15, 0
	rgb  0,  8, 0
	rgb 14, 23, 0

Pals_4fc2:
	rgb 21, 30, 31
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb 21, 30, 31
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb 21, 30, 31
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb 21, 30, 31
	rgb 31, 27,  2
	rgb 27,  0,  2
	rgb  7,  0, 13

	rgb 21, 30, 31
	rgb 30, 23, 19
	rgb 31,  4, 11
	rgb  7,  0, 13

	rgb 21, 30, 31
	rgb 31, 31, 31
	rgb 21, 30, 31
	rgb 13, 18, 30

	rgb 21, 30, 31
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  7,  0, 13

	rgb 21, 30, 31
	rgb 31, 31, 31
	rgb 31, 22,  0
	rgb 13,  7, 10

Pals_5002:
	rgb 16, 30, 31
	rgb 31, 31, 31
	rgb 18,  3, 31
	rgb  0,  0,  0

	rgb 31, 25, 2
	rgb 29, 12, 7
	rgb 27,  0, 2
	rgb  0,  0, 0

	rgb 18,  3, 31
	rgb 31, 25,  2
	rgb 27,  0,  2
	rgb  0,  0,  0

	rgb 29, 12,  7
	rgb 31, 25,  2
	rgb 18,  3, 31
	rgb  0,  0,  0

	rgb 31, 31, 19
	rgb 31, 25,  2
	rgb 18,  3, 31
	rgb  0,  0,  0

	rgb 16, 30, 31
	rgb  8, 19, 31
	rgb  5, 14, 23
	rgb  8, 19, 31

	rgb 31, 31, 31
	rgb  8, 19, 31
	rgb  0,  8,  0
	rgb  0,  4,  0

	rgb  0,  4, 0
	rgb 10, 15, 0
	rgb  0,  8, 0
	rgb 14, 23, 0

Pals_5042:
	rgb  0, 20, 15
	rgb  0,  0,  0
	rgb 31, 27,  2
	rgb 30,  0, 14

	rgb 16, 30, 31
	rgb  0,  0,  0
	rgb 10,  0, 18
	rgb  4, 15, 31

	rgb  0, 20, 15
	rgb  0,  0,  0
	rgb 27,  0,  2
	rgb 31, 31, 31

	rgb  0, 20, 15
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb  0,  0,  0

	rgb  0, 20, 15
	rgb 21, 21, 21
	rgb  0,  0,  0
	rgb 31, 31, 31

	rgb  0, 20, 15
	rgb 31, 31, 31
	rgb 21, 30, 31
	rgb 13, 18, 30

	rgb  0,  0,  0
	rgb 21, 30, 31
	rgb 27, 30, 31
	rgb  0,  0,  0

	rgb 21, 30, 31
	rgb 31, 31, 31
	rgb 31, 22,  0
	rgb 13,  7, 10

TitleScreenGfx:
INCBIN "gfx/intro/title_screen.2bpp.rle"

PlaneGfx:
INCBIN "gfx/intro/plane.2bpp.rle"

BGMap_697a:
INCBIN "gfx/bgmaps/map_697a.bin"

BGMap_6ae7:
INCBIN "gfx/bgmaps/map_6ae7.bin"

Data_6b47:
	db $7c, $7c, $7c, $7c, $7c, $7c, $7c, $7c, $7c, $7c, $7c, $7c
	db $10, $11, $12, $1f, $10, $11, $12, $1f, $10, $11, $12, $1f

OAM_6b5f:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8

.frame_0
	frame_oam -16, -22, $00, 0
	frame_oam -16, -14, $02, 0
	frame_oam -16,  -6, $04, 0
	frame_oam -16,   2, $06, 0
	frame_oam -16,  10, $08, 0
	frame_oam -16,  18, $0a, 0
	db $80

.frame_1
	frame_oam -21, -24, $0c, 0
	frame_oam -21, -16, $0e, 0
	frame_oam -21,  -8, $10, 0
	frame_oam -21,   0, $12, 0
	frame_oam -21,   8, $14, 0
	frame_oam -21,  16, $16, 0
	frame_oam   0, -28, $18, 0
	frame_oam   0, -20, $1a, 0
	frame_oam   0, -12, $1c, 0
	frame_oam   0,  -4, $1e, 0
	frame_oam   0,   5, $20, 0
	frame_oam   0,  13, $22, 0
	frame_oam   0,  21, $24, 0
	db $80

.frame_2
	frame_oam   0,   6, $3c, 0
	frame_oam   0,  16, $48, 0
	frame_oam   0,  24, $4a, 0
	frame_oam   0, -32, $42, 1
	frame_oam   0, -24, $44, 1
	frame_oam   0, -16, $46, 1
	frame_oam -16, -27, $52, 4
	frame_oam -16, -19, $54, 4
	frame_oam -16, -11, $56, 4
	frame_oam -16,  -3, $58, 4
	frame_oam -16,   5, $5a, 4
	frame_oam -16,  13, $5c, 4
	frame_oam -16,  21, $5e, 4
	db $80

.frame_3
	frame_oam   0, -42, $3c, 0
	frame_oam   0,  16, $48, 1
	frame_oam   0,  24, $4a, 1
	frame_oam   0, -32, $42, 0
	frame_oam   0, -24, $44, 0
	frame_oam   0, -16, $46, 0
	frame_oam -16, -27, $52, 4
	frame_oam -16, -19, $54, 4
	frame_oam -16, -11, $56, 4
	frame_oam -16,  -3, $58, 4
	frame_oam -16,   5, $5a, 4
	frame_oam -16,  13, $5c, 4
	frame_oam -16,  21, $5e, 4
	db $80

.frame_4
	frame_oam   0,   6, $3e, 0
	frame_oam   0,  16, $48, 2
	frame_oam   0,  24, $4a, 2
	frame_oam   0, -32, $42, 1
	frame_oam   0, -24, $44, 1
	frame_oam   0, -16, $46, 1
	frame_oam -16, -27, $52, 4
	frame_oam -16, -19, $54, 4
	frame_oam -16, -11, $56, 4
	frame_oam -16,  -3, $58, 4
	frame_oam -16,   5, $5a, 4
	frame_oam -16,  13, $5c, 4
	frame_oam -16,  21, $5e, 4
	db $80

.frame_5
	frame_oam   0, -42, $3e, 0
	frame_oam   0, -32, $42, 2
	frame_oam   0, -24, $44, 2
	frame_oam   0, -16, $46, 2
	frame_oam   0,  16, $48, 1
	frame_oam   0,  24, $4a, 1
	frame_oam -16, -27, $52, 4
	frame_oam -16, -19, $54, 4
	frame_oam -16, -11, $56, 4
	frame_oam -16,  -3, $58, 4
	frame_oam -16,   5, $5a, 4
	frame_oam -16,  13, $5c, 4
	frame_oam -16,  21, $5e, 4
	db $80

.frame_6
	frame_oam   0,   2, $4e, 2
	frame_oam  28, -56, $4c, 2
	frame_oam -20,  21, $50, 2
	frame_oam   0,  -6, $60, 2
	db $80

.frame_7
	frame_oam -16, -24, $40, 2
	db $80

.frame_8
	frame_oam   0,   5, $20, 0
	frame_oam   0,  13, $22, 0
	frame_oam   0,  21, $24, 0
	frame_oam   0, -28, $18, 0
	frame_oam   0, -20, $1a, 0
	frame_oam   0, -12, $1c, 0
	frame_oam   0,  -4, $1e, 0
	frame_oam -21, -32, $2c, 0
	frame_oam -21, -24, $2e, 0
	frame_oam -21,  -8, $30, 0
	frame_oam -21,   0, $32, 0
	frame_oam -21,   8, $34, 0
	frame_oam -21,  16, $36, 0
	frame_oam -21,  24, $38, 0
	frame_oam -18, -16, $0a, 0
	db $80

Frameset_6ce6:
	db 0, 4
	db $ff

Frameset_6ce9:
	db 1, 4
	db $ff

Frameset_6cec:
	db 2, 4
	db $ff

Frameset_6cef:
	db 3, 4
	db $ff

Frameset_6cf2:
	db 4, 30
	db 2,  3
	db 4,  3
	db 2,  3
	db 4,  3
	db 2,  3
	db 4,  3
	db 2,  3
	db 4,  3
	db $ff

Frameset_6d05:
	db 5, 30
	db 3,  3
	db 5,  3
	db 3,  3
	db 5,  3
	db 3,  3
	db 5,  3
	db 3,  3
	db 5,  3
	db $ff

Frameset_6d18:
	db 6, 4
	db $ff

Frameset_6d1b:
	db 7, 4
	db $ff

Frameset_6d1e:
	db 8, 4
	db $ff

OAM_6d21:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23
	dw .frame_24
	dw .frame_25
	dw .frame_26
	dw .frame_27
	dw .frame_28
	dw .frame_29
	dw .frame_30
	dw .frame_31
	dw .frame_32
	dw .frame_33
	dw .frame_34
	dw .frame_35
	dw .frame_36
	dw .frame_37
	dw .frame_38
	dw .frame_39
	dw .frame_40

.frame_0
	frame_oam   0,  27, $12, 6 | OAMF_BANK1
	frame_oam   0,  35, $14, 6 | OAMF_BANK1
	frame_oam   0,   8, $00, 3 | OAMF_BANK1
	frame_oam   0,  16, $02, 3 | OAMF_BANK1
	frame_oam   0,  24, $04, 3 | OAMF_BANK1
	frame_oam   0,  40, $08, 3 | OAMF_BANK1
	frame_oam  16,   8, $0a, 3 | OAMF_BANK1
	frame_oam  16,  16, $0c, 3 | OAMF_BANK1
	frame_oam  16,  24, $0e, 3 | OAMF_BANK1
	frame_oam  16,  40, $10, 3 | OAMF_BANK1
	frame_oam   7,  32, $06, 3 | OAMF_BANK1
	frame_oam   0,   0, $16, 6 | OAMF_BANK1
	frame_oam  16,   0, $18, 6 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_1
	frame_oam   0,  27, $12, 6 | OAMF_BANK1
	frame_oam   0,  35, $14, 6 | OAMF_BANK1
	frame_oam   0,   8, $00, 3 | OAMF_BANK1
	frame_oam   0,  16, $02, 3 | OAMF_BANK1
	frame_oam   0,  24, $04, 3 | OAMF_BANK1
	frame_oam   0,  40, $08, 3 | OAMF_BANK1
	frame_oam  16,   8, $0a, 3 | OAMF_BANK1
	frame_oam  16,  16, $0c, 3 | OAMF_BANK1
	frame_oam  16,  24, $0e, 3 | OAMF_BANK1
	frame_oam  16,  40, $10, 3 | OAMF_BANK1
	frame_oam   7,  32, $06, 3 | OAMF_BANK1
	frame_oam  16,   0, $16, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,   0, $18, 6 | OAMF_BANK1
	db $80

.frame_2
	frame_oam   0,  27, $12, 6 | OAMF_BANK1
	frame_oam   0,  35, $14, 6 | OAMF_BANK1
	frame_oam   0,   8, $00, 3 | OAMF_BANK1
	frame_oam   0,  16, $02, 3 | OAMF_BANK1
	frame_oam   0,  24, $04, 3 | OAMF_BANK1
	frame_oam   0,  40, $08, 3 | OAMF_BANK1
	frame_oam  16,   8, $0a, 3 | OAMF_BANK1
	frame_oam  16,  16, $0c, 3 | OAMF_BANK1
	frame_oam  16,  24, $0e, 3 | OAMF_BANK1
	frame_oam  16,  40, $10, 3 | OAMF_BANK1
	frame_oam   7,  32, $06, 3 | OAMF_BANK1
	frame_oam   0,   0, $1a, 6 | OAMF_BANK1
	frame_oam  16,   0, $1c, 6 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_3
	frame_oam   0,  27, $12, 6 | OAMF_BANK1
	frame_oam   0,  35, $14, 6 | OAMF_BANK1
	frame_oam   0,   8, $00, 3 | OAMF_BANK1
	frame_oam   0,  16, $02, 3 | OAMF_BANK1
	frame_oam   0,  24, $04, 3 | OAMF_BANK1
	frame_oam   0,  40, $08, 3 | OAMF_BANK1
	frame_oam  16,   8, $0a, 3 | OAMF_BANK1
	frame_oam  16,  16, $0c, 3 | OAMF_BANK1
	frame_oam  16,  24, $0e, 3 | OAMF_BANK1
	frame_oam  16,  40, $10, 3 | OAMF_BANK1
	frame_oam   7,  32, $06, 3 | OAMF_BANK1
	frame_oam  16,   0, $1a, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,   0, $1c, 6 | OAMF_BANK1
	db $80

.frame_4
	frame_oam   1,  27, $12, 6 | OAMF_BANK1
	frame_oam   1,  35, $14, 6 | OAMF_BANK1
	frame_oam   1,   8, $00, 3 | OAMF_BANK1
	frame_oam   1,  16, $02, 3 | OAMF_BANK1
	frame_oam   1,  24, $04, 3 | OAMF_BANK1
	frame_oam   1,  40, $08, 3 | OAMF_BANK1
	frame_oam  17,   8, $0a, 3 | OAMF_BANK1
	frame_oam  17,  16, $0c, 3 | OAMF_BANK1
	frame_oam  17,  24, $0e, 3 | OAMF_BANK1
	frame_oam  17,  40, $10, 3 | OAMF_BANK1
	frame_oam   8,  32, $06, 3 | OAMF_BANK1
	frame_oam   1,   0, $16, 6 | OAMF_BANK1
	frame_oam  17,   0, $18, 6 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_5
	frame_oam   1,  27, $12, 6 | OAMF_BANK1
	frame_oam   1,  35, $14, 6 | OAMF_BANK1
	frame_oam   1,   8, $00, 3 | OAMF_BANK1
	frame_oam   1,  16, $02, 3 | OAMF_BANK1
	frame_oam   1,  24, $04, 3 | OAMF_BANK1
	frame_oam   1,  40, $08, 3 | OAMF_BANK1
	frame_oam  17,   8, $0a, 3 | OAMF_BANK1
	frame_oam  17,  16, $0c, 3 | OAMF_BANK1
	frame_oam  17,  24, $0e, 3 | OAMF_BANK1
	frame_oam  17,  40, $10, 3 | OAMF_BANK1
	frame_oam   8,  32, $06, 3 | OAMF_BANK1
	frame_oam  17,   0, $16, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   1,   0, $18, 6 | OAMF_BANK1
	db $80

.frame_6
	frame_oam   1,  27, $12, 6 | OAMF_BANK1
	frame_oam   1,  35, $14, 6 | OAMF_BANK1
	frame_oam   1,   8, $00, 3 | OAMF_BANK1
	frame_oam   1,  16, $02, 3 | OAMF_BANK1
	frame_oam   1,  24, $04, 3 | OAMF_BANK1
	frame_oam   1,  40, $08, 3 | OAMF_BANK1
	frame_oam  17,   8, $0a, 3 | OAMF_BANK1
	frame_oam  17,  16, $0c, 3 | OAMF_BANK1
	frame_oam  17,  24, $0e, 3 | OAMF_BANK1
	frame_oam  17,  40, $10, 3 | OAMF_BANK1
	frame_oam   8,  32, $06, 3 | OAMF_BANK1
	frame_oam   1,   0, $1a, 6 | OAMF_BANK1
	frame_oam  17,   0, $1c, 6 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_7
	frame_oam   1,  27, $12, 6 | OAMF_BANK1
	frame_oam   1,  35, $14, 6 | OAMF_BANK1
	frame_oam   1,   8, $00, 3 | OAMF_BANK1
	frame_oam   1,  16, $02, 3 | OAMF_BANK1
	frame_oam   1,  24, $04, 3 | OAMF_BANK1
	frame_oam   1,  40, $08, 3 | OAMF_BANK1
	frame_oam  17,   8, $0a, 3 | OAMF_BANK1
	frame_oam  17,  16, $0c, 3 | OAMF_BANK1
	frame_oam  17,  24, $0e, 3 | OAMF_BANK1
	frame_oam  17,  40, $10, 3 | OAMF_BANK1
	frame_oam   8,  32, $06, 3 | OAMF_BANK1
	frame_oam  17,   0, $1a, 6 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   1,   0, $1c, 6 | OAMF_BANK1
	db $80

.frame_8
	frame_oam   0,   0, $20, 4 | OAMF_BANK1
	frame_oam   0,   8, $1e, 4 | OAMF_BANK1
	db $80

.frame_9
	frame_oam   0,   0, $22, 4 | OAMF_BANK1
	frame_oam   0,   8, $1e, 4 | OAMF_BANK1
	db $80

.frame_10
	frame_oam   0,   0, $24, 4 | OAMF_BANK1
	frame_oam   0,   8, $1e, 4 | OAMF_BANK1
	db $80

.frame_11
	frame_oam   1,   0, $26, 4 | OAMF_BANK1
	frame_oam   1,   8, $28, 4 | OAMF_BANK1
	db $80

.frame_12
	frame_oam   2,   0, $2a, 4 | OAMF_BANK1
	frame_oam   2,   8, $2c, 4 | OAMF_BANK1
	db $80

.frame_13
	frame_oam  -4,   8, $38, 7 | OAMF_BANK1
	frame_oam  -4,  16, $3a, 7 | OAMF_BANK1
	frame_oam   1,   8, $1e, 4 | OAMF_BANK1
	frame_oam   1,   0, $22, 4 | OAMF_BANK1
	db $80

.frame_14
	frame_oam  -6,   8, $3c, 7 | OAMF_BANK1
	frame_oam  -6,  16, $3e, 7 | OAMF_BANK1
	frame_oam  -6,  24, $40, 7 | OAMF_BANK1
	frame_oam   1,   0, $24, 4 | OAMF_BANK1
	frame_oam   1,   8, $1e, 4 | OAMF_BANK1
	db $80

.frame_15
	frame_oam  -8,   9, $42, 7 | OAMF_BANK1
	frame_oam  -8,  23, $44, 7 | OAMF_BANK1
	frame_oam   5,  21, $46, 7 | OAMF_BANK1
	frame_oam   0,   0, $2a, 4 | OAMF_BANK1
	frame_oam   0,   8, $2c, 4 | OAMF_BANK1
	db $80

.frame_16
	frame_oam   0,   0, $48, 4 | OAMF_BANK1
	frame_oam   0,   8, $4a, 4 | OAMF_BANK1
	db $80

.frame_17
	frame_oam -10,  10, $30, 7 | OAMF_BANK1
	frame_oam  -4,  18, $36, 7 | OAMF_BANK1
	frame_oam   0,   0, $48, 4 | OAMF_BANK1
	frame_oam   0,   8, $4a, 4 | OAMF_BANK1
	db $80

.frame_18
	frame_oam -10,  10, $2e, 7 | OAMF_BANK1
	frame_oam  -9,  16, $34, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -14,  26, $36, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,   0, $48, 4 | OAMF_BANK1
	frame_oam   0,   8, $4a, 4 | OAMF_BANK1
	db $80

.frame_19
	frame_oam -10,  10, $30, 7 | OAMF_BANK1
	frame_oam -15,  20, $32, 7 | OAMF_BANK1
	frame_oam -13,  31, $36, 7 | OAMF_BANK1
	frame_oam   0,   0, $48, 4 | OAMF_BANK1
	frame_oam   0,   8, $4a, 4 | OAMF_BANK1
	db $80

.frame_20
	frame_oam -10,  10, $2e, 7 | OAMF_BANK1
	frame_oam -16,  33, $36, 7 | OAMF_BANK1
	frame_oam -12,  18, $32, 7 | OAMF_BANK1
	frame_oam   0,   0, $48, 4 | OAMF_BANK1
	frame_oam   0,   8, $4a, 4 | OAMF_BANK1
	db $80

.frame_21
	frame_oam -10,  10, $30, 7 | OAMF_BANK1
	frame_oam  -4,  18, $36, 7 | OAMF_BANK1
	frame_oam   0,   0, $4c, 4 | OAMF_BANK1
	frame_oam   0,   8, $4e, 4 | OAMF_BANK1
	db $80

.frame_22
	frame_oam -10,  10, $2e, 3 | OAMF_BANK1
	frame_oam -12,  16, $34, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -18,  25, $36, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   0,   0, $4c, 4 | OAMF_BANK1
	frame_oam   0,   8, $4e, 4 | OAMF_BANK1
	db $80

.frame_23
	frame_oam -10,  10, $30, 7 | OAMF_BANK1
	frame_oam -18,  19, $32, 7 | OAMF_BANK1
	frame_oam -21,  29, $36, 7 | OAMF_BANK1
	frame_oam   0,   0, $4c, 4 | OAMF_BANK1
	frame_oam   0,   8, $4e, 4 | OAMF_BANK1
	db $80

.frame_24
	frame_oam -10,  10, $2e, 7 | OAMF_BANK1
	frame_oam -24,  32, $36, 7 | OAMF_BANK1
	frame_oam -17,  18, $32, 7 | OAMF_BANK1
	frame_oam   0,   0, $4c, 4 | OAMF_BANK1
	frame_oam   0,   8, $4e, 4 | OAMF_BANK1
	db $80

.frame_25
	frame_oam -10,   9, $30, 7 | OAMF_BANK1
	frame_oam  -4,  17, $36, 7 | OAMF_BANK1
	frame_oam   1,   9, $4c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   1,   1, $4e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_26
	frame_oam -10,   9, $2e, 7 | OAMF_BANK1
	frame_oam -12,  15, $34, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -18,  24, $36, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam   1,   9, $4c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   1,   1, $4e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_27
	frame_oam -10,   9, $30, 7 | OAMF_BANK1
	frame_oam -18,  18, $32, 7 | OAMF_BANK1
	frame_oam -21,  28, $36, 7 | OAMF_BANK1
	frame_oam   1,   9, $4c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   1,   1, $4e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_28
	frame_oam -10,   9, $2e, 7 | OAMF_BANK1
	frame_oam -24,  31, $36, 7 | OAMF_BANK1
	frame_oam -17,  17, $32, 7 | OAMF_BANK1
	frame_oam   1,   9, $4c, 4 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam   1,   1, $4e, 4 | OAMF_BANK1 | OAMF_XFLIP
	db $80

.frame_29
	frame_oam   0,   0, $3c, 7 | OAMF_BANK1
	frame_oam   0,   8, $3e, 7 | OAMF_BANK1
	db $80

.frame_30
	frame_oam -16,   2, $60, 7 | OAMF_BANK1
	frame_oam   0,   2, $62, 7 | OAMF_BANK1
	frame_oam  -3,  10, $64, 7 | OAMF_BANK1
	db $80

.frame_31
	frame_oam -16,   2, $66, 7 | OAMF_BANK1
	frame_oam   0,   2, $68, 7 | OAMF_BANK1
	frame_oam  -6,  10, $6a, 7 | OAMF_BANK1
	db $80

.frame_32
	frame_oam  -8,  10, $70, 7 | OAMF_BANK1
	frame_oam   8,   6, $74, 7 | OAMF_BANK1
	frame_oam   0,  14, $76, 7 | OAMF_BANK1
	frame_oam  -8,  -2, $72, 7 | OAMF_BANK1
	db $80

.frame_33
	frame_oam -20,  11, $70, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -9,  10, $6e, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam  -8,  -2, $6c, 7 | OAMF_BANK1
	frame_oam   1,  15, $6c, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam   8,   5, $70, 7 | OAMF_BANK1
	db $80

.frame_34
	frame_oam  -8,   6, $6e, 7 | OAMF_BANK1
	frame_oam -13,  14, $70, 7 | OAMF_BANK1
	frame_oam   8,   6, $74, 7 | OAMF_BANK1
	frame_oam -19,  24, $36, 7 | OAMF_BANK1
	db $80

.frame_35
	frame_oam -27,  30, $36, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -25,  19, $32, 7 | OAMF_BANK1
	frame_oam -19,  11, $6e, 7 | OAMF_BANK1
	frame_oam   1,   6, $70, 7 | OAMF_BANK1
	db $80

.frame_36
	frame_oam   8,   6, $74, 7 | OAMF_BANK1
	frame_oam -28,  28, $32, 7 | OAMF_BANK1 | OAMF_XFLIP
	frame_oam -25,  14, $6c, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -30,  20, $44, 7 | OAMF_BANK1
	frame_oam  -2,   9, $76, 7 | OAMF_BANK1
	db $80

.frame_37
	frame_oam  -8,   9, $70, 7 | OAMF_BANK1 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -13,  17, $34, 7 | OAMF_BANK1
	frame_oam -37,  24, $36, 7 | OAMF_BANK1 | OAMF_YFLIP
	frame_oam -30,  36, $36, 7 | OAMF_BANK1 | OAMF_YFLIP
	db $80

.frame_38
	frame_oam   2,   0, $26, 4 | OAMF_BANK1
	frame_oam   2,   8, $28, 4 | OAMF_BANK1
	db $80

.frame_39
	frame_oam   0,   0, $56, 5 | OAMF_BANK1
	frame_oam   0,   8, $58, 5 | OAMF_BANK1
	frame_oam   0,  16, $5a, 5 | OAMF_BANK1
	db $80

.frame_40
	frame_oam   0,   0, $5c, 5 | OAMF_BANK1
	frame_oam   0,   8, $5e, 5 | OAMF_BANK1
	db $80

Frameset_712c:
	db 0, 2
	db 1, 2
	db 2, 2
	db 3, 2
	db 4, 2
	db 5, 2
	db 6, 2
	db 7, 2
	db $ff

Frameset_713d:
	db  8, 3
	db  9, 3
	db 10, 3
	db $ff

Frameset_7144:
	db  8, 3
	db  9, 3
	db 10, 3
	db  8, 3
	db  9, 3
	db 10, 3
	db  8, 3
	db  9, 3
	db 10, 3
	db  8, 3
	db  9, 3
	db 10, 3
	db 11, 4
	db 12, 7
	db 38, 5
	db 11, 4
	db $ff

Frameset_7165:
	db 13,  6
	db 14,  6
	db 13,  6
	db 14,  6
	db 15,  6
	db 16, 40
	db $ff

Frameset_7172:
	db 17, 2
	db 18, 2
	db 19, 2
	db 20, 2
	db $ff

Frameset_717b:
	db 21, 2
	db 22, 2
	db 23, 2
	db 24, 2
	db $ff

Frameset_7184:
	db 25, 2
	db 26, 2
	db 27, 2
	db 28, 2
	db $ff

Frameset_718d:
	db 29, 9
	db 30, 9
	db 31, 9
	db 32, 9
	db 33, 9
	db $ff

Frameset_7198:
	db 34, 9
	db 35, 9
	db 36, 9
	db 37, 9
	db $ff

Frameset_71a1:
	db 39, 4
	db $ff

Frameset_71a4:
	db 40, 4
	db $ff

Frameset_71a7:
	db 0, 2
	db 1, 2
	db 2, 2
	db 3, 2
	db $ff

Pal_71b0:
	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  7,  0

	rgb 31, 25, 9
	rgb 21, 15, 4
	rgb 13,  8, 1
	rgb 0,   0, 0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

TimeAttack1JPTextMap:
INCBIN "gfx/bgmaps/text/time_attack1_en.bin"

TimeAttack2JPTextMap:
INCBIN "gfx/bgmaps/text/time_attack2_en.bin"

TimeAttack1ENTextMap:
INCBIN "gfx/bgmaps/text/time_attack1_jp.bin"

TimeAttack2ENTextMap:
INCBIN "gfx/bgmaps/text/time_attack2_jp.bin"

OAM_75c3:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13

.frame_0
	frame_oam -16,  -4, $18, 3
	frame_oam -16,  -8, $20, 4
	frame_oam -16,   0, $22, 4
	frame_oam -16,  -8, $00, 2
	frame_oam -16,   0, $02, 2
	db $80

.frame_1
	frame_oam  -6,  -5, $e0, 0 | OAMF_BANK1
	db $80

.frame_2
	frame_oam  -6,  -5, $e4, 0 | OAMF_BANK1
	db $80

.frame_3
	frame_oam  -6,  -5, $e6, 0 | OAMF_BANK1
	db $80

.frame_4
	frame_oam  -6,  -5, $ea, 0 | OAMF_BANK1
	db $80

.frame_5
	frame_oam -16,  -8, $1a, 3
	frame_oam -16,  -8, $24, 4
	frame_oam -16,   0, $26, 4
	frame_oam -16,  -8, $04, 2
	frame_oam -16,   0, $06, 2
	db $80

.frame_6
	frame_oam -16,  -8, $1c, 3
	frame_oam -16,  -8, $28, 4
	frame_oam -16,   0, $2a, 4
	frame_oam -16,  -8, $08, 2
	frame_oam -16,   0, $0a, 2
	db $80

.frame_7
	frame_oam -16,  -8, $2c, 4
	frame_oam -16,   0, $2e, 4
	frame_oam -16,  -8, $0c, 2
	frame_oam -16,   0, $0e, 2
	db $80

.frame_8
	frame_oam -16,  -8, $30, 4
	frame_oam -16,   0, $32, 4
	frame_oam -16,  -8, $10, 2
	frame_oam -16,   0, $12, 2
	db $80

.frame_9
	frame_oam -16,   0, $30, 4 | OAMF_XFLIP
	frame_oam -16,  -8, $32, 4 | OAMF_XFLIP
	frame_oam -16,   0, $10, 2 | OAMF_XFLIP
	frame_oam -16,  -8, $12, 2 | OAMF_XFLIP
	db $80

.frame_10
	frame_oam -16,   0, $2c, 4 | OAMF_XFLIP
	frame_oam -16,  -8, $2e, 4 | OAMF_XFLIP
	frame_oam -16,   0, $0c, 2 | OAMF_XFLIP
	frame_oam -16,  -8, $0e, 2 | OAMF_XFLIP
	db $80

.frame_11
	frame_oam -16,   0, $28, 4 | OAMF_XFLIP
	frame_oam -16,  -8, $2a, 4 | OAMF_XFLIP
	frame_oam -16,   0, $1c, 3 | OAMF_XFLIP
	frame_oam -16,   0, $08, 2 | OAMF_XFLIP
	frame_oam -16,  -8, $0a, 2 | OAMF_XFLIP
	db $80

.frame_12
	frame_oam -16,   0, $24, 4 | OAMF_XFLIP
	frame_oam -16,  -8, $26, 4 | OAMF_XFLIP
	frame_oam -16,   0, $1a, 3 | OAMF_XFLIP
	frame_oam -16,   0, $04, 2 | OAMF_XFLIP
	frame_oam -16,  -8, $06, 2 | OAMF_XFLIP
	db $80

.frame_13
	frame_oam -16,  -4, $18, 3 | OAMF_XFLIP
	frame_oam -16,   0, $20, 4 | OAMF_XFLIP
	frame_oam -16,  -8, $22, 4 | OAMF_XFLIP
	frame_oam -16,   0, $00, 2 | OAMF_XFLIP
	frame_oam -16,  -8, $02, 2 | OAMF_XFLIP
	db $80

Frameset_76b5:
	db $00,  8
	db $05,  8
	db $06,  8
	db $07,  8
	db $08,  8
	db $09,  8
	db $0a,  8
	db $0b,  8
	db $0c,  8
	db $0d,  8
	db $ff

Frameset_76ca:
	db $01,  4
	db $02,  4
	db $03,  4
	db $04,  4
	db $03,  4
	db $02,  4
	db $ff
