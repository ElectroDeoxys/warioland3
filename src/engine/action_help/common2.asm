LoadActionHelpPalsWithWater:
	xor a
	ld [wActionHelpBlackedOut], a
	ld hl, Pals_1e4e6f
	call LoadActionHelpBGPals
	call LoadActionHelpOBPals
	ret

LoadActionHelpPalsWithoutWater:
	xor a
	ld [wActionHelpBlackedOut], a
	ld hl, Pals_1e4eaf
	call LoadActionHelpBGPals
	call LoadActionHelpOBPals
	ret

Func_1e48bc:
	ld a, TRUE
	ld [wActionHelpBlackedOut], a
	ld hl, Pals_1e4eef
	call LoadActionHelpBGPals
	ret

LoadActionHelpCommonPals:
	ld a, TRUE
	ld [wActionHelpBlackedOut], a
	ld hl, Pals_1e4eef
	call LoadPalsToTempPals1
	ret

LoadActionHelpPowerUpPals:
	ld a, [wActionHelpPowerUp]
	and POWER_UP_MASK
	cp NUM_MAIN_POWER_UPS
	jr c, .main_power_up

; special power-up
	ld hl, Pals_1e4f7f
	call LoadPalsToTempPals2
	ld a, [wActionHelpPowerUp]
	cp POWER_UP_VAMPIRE
	ret nz
	ld hl, Pals_1e4fbf
	ld de, wTempPals2
	ld b, 2 palettes
	call CopyHLToDE_Short
	ret

.main_power_up
	ld hl, Pals_1e4f2f
	call LoadPalsToTempPals2
	ld a, [wActionHelpPowerUp]
	cp GARLIC
	ret c
	ld hl, Pals_1e4f6f
	ld de, wTempPals2
	ld b, 2 palettes
	call CopyHLToDE_Short
	ret

LoadActionHelpGfx:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, ActionHelpObjects1Gfx
	ld a, [wActionHelpPowerUp]
	and POWER_UP_MASK
	cp NUM_MAIN_POWER_UPS
	jr c, .got_tiles
	ld hl, ActionHelpObjects2Gfx
.got_tiles
	ld bc, v1Tiles0
	call Decompress

	xor a
	ldh [rVBK], a
	ld hl, ActionHelpHUDGfx
	ld bc, v0Tiles0
	call Decompress
	ret

LoadActionHelpBGMaps:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, BGMap_1e68bd
	ld bc, v1BGMap1
	call Decompress
	xor a
	ldh [rVBK], a
	ld hl, BGMap_1e6796
	ld bc, v0BGMap1
	call Decompress

	ld a, [wActionHelpPowerUp]
	and POWER_UP_MASK
	cp NUM_MAIN_POWER_UPS
	jr nc, .asm_1e4995
	ld a, [wPowerUpLevel]
	and POWER_UP_MASK
	jr z, .asm_1e4979
	ld c, a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	hlbgcoord 0, 16, v1BGMap1
	ld de, BG_MAP_WIDTH
	ld b, $00
.asm_1e4969
	push hl
	ld a, $03
	ld [hli], a
	ld [hld], a
	add hl, de
	ld [hli], a
	ld [hl], a
	pop hl
	inc l
	inc l
	inc b
	ld a, b
	cp c
	jr c, .asm_1e4969

.asm_1e4979
	xor a
	ldh [rVBK], a
	ld a, [wPowerUpLevel]
	and POWER_UP_MASK
	ld b, a
	ld a, $09
	sub b
	ret z
	ld b, a
	hlbgcoord 18, 16, v0BGMap1
.asm_1e498a
	push hl
	call .Func_1e499c
	pop hl
	dec hl
	dec hl
	dec b
	jr nz, .asm_1e498a
	ret

.asm_1e4995
	ld b, $0a
	hlbgcoord 18, 16, v0BGMap1
	jr .asm_1e498a

.Func_1e499c
	ld de, BG_MAP_WIDTH
	push hl
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, $07
	ld [hli], a
	ld [hld], a
	add hl, de
	ld [hli], a
	ld [hl], a
	pop hl
	xor a
	ldh [rVBK], a
	ld a, $64
	ld [hli], a
	inc a
	ld [hld], a
	add hl, de
	ld a, $74
	ld [hli], a
	inc a
	ld [hl], a
	ret

LoadActionHelpBGPals:
	push hl
	ld de, wTempPals1
	ld b, 8 palettes
	call CopyHLToDE_Short
	pop hl

	ld a, BCPSF_AUTOINC | palette 0
	ldh [rBCPS], a
	ld b, 8
	ld c, LOW(rBCPD)

.loop_copy_bg_pals
	wait_ppu_busy
	wait_ppu_free
REPT 1 palettes
	ld a, [hli]
	ld [$ff00+c], a
ENDR
	dec b
	jr nz, .loop_copy_bg_pals
	ret

LoadActionHelpOBPals:
	ld hl, Pals_1e4f2f
	ld a, [wActionHelpPowerUp]
	cp NUM_MAIN_POWER_UPS
	ret nc ; quit if is a special Power-Up
	ld b, a
	ld a, [wPowerUpLevel]
	and POWER_UP_MASK
	cp b
	jr nc, .has_power_up
	; doesn't have Power-Up,
	; so black out some OB pals
	xor a
	ld hl, wTempPals2
	ld b, 2 palettes
	call WriteAToHL_BTimes
	ld hl, wTempPals2 palette 3
	ld b, 5 palettes
	call WriteAToHL_BTimes
	ld hl, wTempPals2
	jr .apply_palettes
.has_power_up
	push hl
	ld de, wTempPals2
	ld b, 8 palettes
	call CopyHLToDE_Short
	pop hl

.apply_palettes
	ld a, OCPSF_AUTOINC | palette 0
	ldh [rOCPS], a
	ld b, 8
	ld c, LOW(rOCPD)
.loop_copy_ob_pals
	wait_ppu_busy
	wait_ppu_free
REPT 1 palettes
	ld a, [hli]
	ld [$ff00+c], a
ENDR
	dec b
	jr nz, .loop_copy_ob_pals
	ret

Func_1e4a47:
	ld hl, Pals_1e4f2f palette 4
	ld a, [wActionHelpPowerUp]
	cp NUM_MAIN_POWER_UPS
	ret nc

	ld b, a
	ld a, [wPowerUpLevel]
	and POWER_UP_MASK
	cp b
	jr nc, .asm_1e4a6f
	xor a
	ld hl, wTempPals2 palette 4
	ld b, 1 palettes
	call WriteAToHL_BTimes
	ld hl, wTempPals2 palette 7
	ld b, 1 palettes
	call WriteAToHL_BTimes
	ld hl, wTempPals2 palette 4
	jr .asm_1e4a84
.asm_1e4a6f
	push hl
	ld de, wTempPals2 palette 4
	ld b, 1 palettes
	call CopyHLToDE_Short
	ld hl, Pals_1e4f2f palette 7
	ld de, wTempPals2 palette 7
	ld b, 1 palettes
	call CopyHLToDE_Short
	pop hl

.asm_1e4a84
	ld a, OCPSF_AUTOINC | palette 4
	ldh [rOCPS], a
	ld c, LOW(rOCPD)
	ld b, 4
.loop_copy_pals
	wait_ppu_busy
	wait_ppu_free
REPT PALETTE_SIZE
	ld a, [hli]
	ld [$ff00+c], a
ENDR
	dec b
	jr nz, .loop_copy_pals
	ret

AddActionHelpWarioSprite:
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	sub b
	add OAM_Y_OFS
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	add OAM_X_OFS
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld a, [wActionHelpWarioOAMPtr + 0]
	ld h, a
	ld a, [wActionHelpWarioOAMPtr + 1]
	ld l, a
	farcall $05, AddSprite
	ret

AddActionHelpWarioSprite_FromBank:
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	sub b
	add OAM_Y_OFS
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	add OAM_X_OFS
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld a, [wActionHelpWarioOAMPtr + 0]
	ld h, a
	ld a, [wActionHelpWarioOAMPtr + 1]
	ld l, a
	ld a, [wActionHelpWarioOAMBank]
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall AddSprite
	ret

AddActionHelpSprite_Far:
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	sub b
	add OAM_Y_OFS
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	add OAM_X_OFS
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hli]
	ld [wCurSpriteAttributes], a
	inc l
	inc l
	inc l
	inc l
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld [wTempBank], a
	ld h, d
	ld l, e
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall AddSprite
	ret

AddActionHelpSprite:
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	sub b
	add OAM_Y_OFS
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	add OAM_X_OFS
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, OAM_1e697c
	call AddSprite
	ret

; unreferenced
Func_1e4b6d:
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	sub b
	add OAM_Y_OFS
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	add OAM_X_OFS
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, OAM_1e6bab
	call AddSprite
	ret

ActionHelp2_Init:
	farcall ActionHelp_Init
	ret

ActionHelp2_FlashBInput:
	farcall ActionHelp_FlashBInput
	ret

ActionHelp2_FlashAInput:
	farcall ActionHelp_FlashAInput
	ret

ActionHelp2_ClearDPadInput:
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b76)
	ld [hli], a
	ld a, LOW(Frameset_1e6b76)
	ld [hl], a
	ret

ActionHelp2_ShowDLeftInput:
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b82)
	ld [hli], a
	ld a, LOW(Frameset_1e6b82)
	ld [hl], a
	ret

ActionHelp2_ShowDRightInput:
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b7c)
	ld [hli], a
	ld a, LOW(Frameset_1e6b7c)
	ld [hl], a
	ret

ActionHelp2_ShowDUpInput:
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b79)
	ld [hli], a
	ld a, LOW(Frameset_1e6b79)
	ld [hl], a
	ret

ActionHelp2_ClearButtonsInput:
	ld hl, wMenuObj3FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b6d)
	ld [hli], a
	ld a, LOW(Frameset_1e6b6d)
	ld [hl], a
	ret

ActionHelp2_ShowAInput:
	xor a
	ld hl, wMenuObj3FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b70)
	ld [hli], a
	ld a, LOW(Frameset_1e6b70)
	ld [hl], a
	ret

ActionHelp2_ShowBInput:
	xor a
	ld hl, wMenuObj3FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b73)
	ld [hli], a
	ld a, LOW(Frameset_1e6b73)
	ld [hl], a
	ret

ActionHelp_ShowWarioHangVertical:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1fedd0)
	ld [hli], a
	ld a, LOW(Frameset_1fedd0)
	ld [hl], a
	ret

ActionHelp_ShowWarioHangHorizontal:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1fed7c)
	ld [hli], a
	ld a, LOW(Frameset_1fed7c)
	ld [hl], a
	ret

ActionHelp_ShowWarioHangOwlRight:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1fed91)
	ld [hli], a
	ld a, LOW(Frameset_1fed91)
	ld [hl], a
	ret

ActionHelp_ShowWarioOwlMoveHang:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1feda6)
	ld [hli], a
	ld a, LOW(Frameset_1feda6)
	ld [hl], a
	ret

ActionHelp_ShowWarioOwlMoveHangRight:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1fedbb)
	ld [hli], a
	ld a, LOW(Frameset_1fedbb)
	ld [hl], a
	ret

ActionHelp_ShowWarioHangDrop:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1fedfe)
	ld [hli], a
	ld a, LOW(Frameset_1fedfe)
	ld [hl], a
	ret

ActionHelp2_ShowWarioIdle:
	ld a, BANK(WarioIdleGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioIdleGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioIdleGfx)
	ld [wPendingDMASourcePtr + 1], a
	ld a, HIGH(v0Tiles0)
	ld [wPendingDMADestinationPtr + 0], a
	ld a, LOW(v0Tiles0)
	ld [wPendingDMADestinationPtr + 1], a
	ld a, BANK("VRAM0")
	ld [wPendingDMADestinationBank], a
	ld a, $7f
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a

	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1425f)
	ld [hli], a
	ld a, LOW(Frameset_1425f)
	ld [hl], a
	ld a, HIGH(OAM_14000)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_14000)
	ld [wActionHelpWarioOAMPtr + 1], a
	ld a, BANK(OAM_14000)
	ld [wActionHelpWarioOAMBank], a
	ret

ActionHelp2_ShowWarioWalk:
	ld a, BANK(WarioWalkGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioWalkGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioWalkGfx)
	ld [wPendingDMASourcePtr + 1], a
	ld a, HIGH(v0Tiles0)
	ld [wPendingDMADestinationPtr + 0], a
	ld a, LOW(v0Tiles0)
	ld [wPendingDMADestinationPtr + 1], a
	ld a, BANK("VRAM0")
	ld [wPendingDMADestinationBank], a
	ld a, $7f
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a

	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_149c5)
	ld [hli], a
	ld a, LOW(Frameset_149c5)
	ld [hli], a
	ld a, HIGH(OAM_1426c)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1426c)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret

ActionHelp2_ShowWarioJump:
	ld a, BANK(WarioAirborneGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioAirborneGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioAirborneGfx)
	ld [wPendingDMASourcePtr + 1], a
	ld a, HIGH(v0Tiles0)
	ld [wPendingDMADestinationPtr + 0], a
	ld a, LOW(v0Tiles0)
	ld [wPendingDMADestinationPtr + 1], a
	ld a, BANK("VRAM0")
	ld [wPendingDMADestinationBank], a
	ld a, $7f
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a

	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_15f97)
	ld [hli], a
	ld a, LOW(Frameset_15f97)
	ld [hli], a
	xor a
	ld [hl], a
	ld a, HIGH(OAM_15955)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_15955)
	ld [wActionHelpWarioOAMPtr + 1], a
	ld a, BANK(OAM_15955)
	ld [wActionHelpWarioOAMBank], a
	ret

ActionHelp_ShowWarioHangStopped:
	ld a, BANK(WarioHangGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioHangGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioHangGfx)
	ld [wPendingDMASourcePtr + 1], a
	ld a, HIGH(v0Tiles0)
	ld [wPendingDMADestinationPtr + 0], a
	ld a, LOW(v0Tiles0)
	ld [wPendingDMADestinationPtr + 1], a
	ld a, BANK("VRAM0")
	ld [wPendingDMADestinationBank], a
	ld a, $7f
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a

	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1feec4)
	ld [hli], a
	ld a, LOW(Frameset_1feec4)
	ld [hli], a
	xor a
	ld [hl], a
	ld a, HIGH(OAM_1fee05)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1fee05)
	ld [wActionHelpWarioOAMPtr + 1], a
	ld a, BANK(OAM_1fee05)
	ld [wActionHelpWarioOAMBank], a
	ret

ActionHelp_ShowWarioHangRailRight:
	ld a, BANK(WarioHangGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioHangGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioHangGfx)
	ld [wPendingDMASourcePtr + 1], a
	ld a, HIGH(v0Tiles0)
	ld [wPendingDMADestinationPtr + 0], a
	ld a, LOW(v0Tiles0)
	ld [wPendingDMADestinationPtr + 1], a
	ld a, BANK("VRAM0")
	ld [wPendingDMADestinationBank], a
	ld a, $7f
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a

	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1feeb4)
	ld [hli], a
	ld a, LOW(Frameset_1feeb4)
	ld [hli], a
	xor a
	ld [hl], a
	ld a, HIGH(OAM_1fee05)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1fee05)
	ld [wActionHelpWarioOAMPtr + 1], a
	ld a, BANK(OAM_1fee05)
	ld [wActionHelpWarioOAMBank], a
	ret

ActionHelp_ShowWarioBatTransform:
	ld a, BANK(WarioBatGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioBatGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioBatGfx)
	ld [wPendingDMASourcePtr + 1], a
	ld a, HIGH(v0Tiles0)
	ld [wPendingDMADestinationPtr + 0], a
	ld a, LOW(v0Tiles0)
	ld [wPendingDMADestinationPtr + 1], a
	ld a, BANK("VRAM0")
	ld [wPendingDMADestinationBank], a
	ld a, $7f
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a

	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1fd479)
	ld [hli], a
	ld a, LOW(Frameset_1fd479)
	ld [hl], a
	ld a, HIGH(OAM_1fd031)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1fd031)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret

ActionHelp_ShowWarioBatRight:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld [wSFXTimer], a
	ld a, HIGH(Frameset_1fd46c)
	ld [hli], a
	ld a, LOW(Frameset_1fd46c)
	ld [hl], a
	ret

ActionHelp_ShowWarioBatLeft:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld [wSFXTimer], a
	ld a, HIGH(Frameset_1fd42c)
	ld [hli], a
	ld a, LOW(Frameset_1fd42c)
	ld [hl], a
	ret

ActionHelp_ShowWarioVampireTransform:
	play_sfx SFX_045

	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1fd439)
	ld [hli], a
	ld a, LOW(Frameset_1fd439)
	ld [hl], a
	ret

ActionHelp_ShowRailRotateRight:
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6fcb)
	ld [hli], a
	ld a, LOW(Frameset_1e6fcb)
	ld [hli], a
	ret

ActionHelp_ShowRailRotateLeft:
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6fc2)
	ld [hli], a
	ld a, LOW(Frameset_1e6fc2)
	ld [hli], a
	ret

ActionHelp_ShowOwlFlyUp:
	ld hl, wMenuObj4
	ld a, [wActionHelpWarioYCoord]
	sub $20
	ld [hli], a
	ld a, [wActionHelpWarioXCoord]
	sub $08
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d7b4)
	ld [hli], a
	ld a, LOW(Frameset_d7b4)
	ld [hli], a
	ld a, HIGH(OAM_d763)
	ld [hli], a
	ld a, LOW(OAM_d763)
	ld [hli], a
	ld a, BANK(OAM_d763)
	ld [hli], a
	xor a
	ld [hl], a
	ret
