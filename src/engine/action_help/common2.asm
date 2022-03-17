LoadActionHelpPalsWithWater: ; 1e48a0 (79:48a0)
	xor a
	ld [wActionHelpBlackedOut], a
	ld hl, Pals_1e4e6f
	call LoadActionHelpBGPals
	call LoadActionHelpOBPals
	ret
; 0x1e48ae

LoadActionHelpPalsWithoutWater: ; 1e48ae (79:48ae)
	xor a
	ld [wActionHelpBlackedOut], a
	ld hl, Pals_1e4eaf
	call LoadActionHelpBGPals
	call LoadActionHelpOBPals
	ret
; 0x1e48bc

Func_1e48bc: ; 1e48bc (79:48bc)
	ld a, TRUE
	ld [wActionHelpBlackedOut], a
	ld hl, Pals_1e4eef
	call LoadActionHelpBGPals
	ret
; 0x1e48c8

LoadActionHelpCommonPals: ; 1e48c8 (79:48c8)
	ld a, TRUE
	ld [wActionHelpBlackedOut], a
	ld hl, Pals_1e4eef
	call LoadPalsToTempPals1
	ret
; 0x1e48d4

LoadActionHelpPowerUpPals: ; 1e48d4 (79:48d4)
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
	cp POWER_UP_GARLIC
	ret c
	ld hl, Pals_1e4f6f
	ld de, wTempPals2
	ld b, 2 palettes
	call CopyHLToDE_Short
	ret
; 0x1e490d

LoadActionHelpGfx: ; 1e490d (79:490d)
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
; 0x1e4933

LoadActionHelpBGMaps: ; 1e4933 (79:4933)
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
	ld hl, v1BGMap1 + $200
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
	ld hl, v0BGMap1 + $212
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
	ld hl, v0BGMap1 + $212
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
; 0x1e49bb

LoadActionHelpBGPals: ; 1e49bb (79:49bb)
	push hl
	ld de, wTempPals1
	ld b, 8 palettes
	call CopyHLToDE_Short
	pop hl

	ld a, 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld b, 8
	ld c, LOW(rBGPD)

.wait_lcd_off
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr z, .wait_lcd_off
.wait_lcd_on
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr nz, .wait_lcd_on

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
	jr nz, .wait_lcd_off
	ret
; 0x1e49ed

LoadActionHelpOBPals: ; 1e49ed (79:49ed)
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
	ld a, (1 << rOBPI_AUTO_INCREMENT)
	ldh [rOBPI], a
	ld b, 8
	ld c, LOW(rOBPD)
.wait_lcd_off
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr z, .wait_lcd_off
.wait_lcd_on
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr nz, .wait_lcd_on

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
	jr nz, .wait_lcd_off
	ret
; 0x1e4a47

Func_1e4a47: ; 1e4a47 (79:4a47)
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
	ld a, (1 << rOBPI_AUTO_INCREMENT) | $20
	ldh [rOBPI], a
	ld c, LOW(rOBPD)
	ld b, 4
.wait_lcd_off
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr z, .wait_lcd_off
.wait_lcd_on
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr nz, .wait_lcd_on

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
	jr nz, .wait_lcd_off
	ret
; 0x1e4aac

AddActionHelpWarioSprite: ; 1e4aac (79:4aac)
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	sub b
	add $10
	ld [wCurSprite], a
	ld a, [hli]
	add $08
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld a, [wActionHelpWarioOAMPtr + 0]
	ld h, a
	ld a, [wActionHelpWarioOAMPtr + 1]
	ld l, a
	farcall $05, TryAddSprite
	ret
; 0x1e4add

AddActionHelpWarioSprite_FromBank: ; 1e4add (79:4add)
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	sub b
	add $10
	ld [wCurSprite], a
	ld a, [hli]
	add $08
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
	hcall TryAddSprite
	ret
; 0x1e4b15

AddActionHelpSprite_Far: ; 1e4b15 (79:4b15)
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	sub b
	add $10
	ld [wCurSprite], a
	ld a, [hli]
	add $08
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
	hcall TryAddSprite
	ret
; 0x1e4b4d

AddActionHelpSprite: ; 1e4b4d (79:4b4d)
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	sub b
	add $10
	ld [wCurSprite], a
	ld a, [hli]
	add $08
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, OAM_1e697c
	call TryAddSprite
	ret
; 0x1e4b6d

; unreferenced
Func_1e4b6d: ; 1e4b6d (79:4b6d)
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	sub b
	add $10
	ld [wCurSprite], a
	ld a, [hli]
	add $08
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, OAM_1e6bab
	call TryAddSprite
	ret
; 0x1e4b8d

ActionHelp2_Init: ; 1e4b8d (79:4b8d)
	farcall ActionHelp_Init
	ret
; 0x1e4b9d

ActionHelp2_FlashBInput: ; 1e4b9d (79:4b9d)
	farcall ActionHelp_FlashBInput
	ret
; 0x1e4bad

ActionHelp2_FlashAInput: ; 1e4bad (79:4bad)
	farcall ActionHelp_FlashAInput
	ret
; 0x1e4bbd

ActionHelp2_ClearDPadInput: ; 1e4bbd (79:4bbd)
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b76)
	ld [hli], a
	ld a, LOW(Frameset_1e6b76)
	ld [hl], a
	ret
; 0x1e4bca

ActionHelp2_ShowDLeftInput: ; 1e4bca (79:4bca)
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b82)
	ld [hli], a
	ld a, LOW(Frameset_1e6b82)
	ld [hl], a
	ret
; 0x1e4bd7

ActionHelp2_ShowDRightInput: ; 1e4bd7 (79:4bd7)
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b7c)
	ld [hli], a
	ld a, LOW(Frameset_1e6b7c)
	ld [hl], a
	ret
; 0x1e4be4

ActionHelp2_ShowDUpInput: ; 1e4be4 (79:4be4)
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b79)
	ld [hli], a
	ld a, LOW(Frameset_1e6b79)
	ld [hl], a
	ret
; 0x1e4bf1

ActionHelp2_ClearButtonsInput: ; 1e4bf1 (79:4bf1)
	ld hl, wMenuObj3FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b6d)
	ld [hli], a
	ld a, LOW(Frameset_1e6b6d)
	ld [hl], a
	ret
; 0x1e4bfe

ActionHelp2_ShowAInput: ; 1e4bfe (79:4bfe)
	xor a
	ld hl, wMenuObj3FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b70)
	ld [hli], a
	ld a, LOW(Frameset_1e6b70)
	ld [hl], a
	ret
; 0x1e4c0b

ActionHelp2_ShowBInput: ; 1e4c0b (79:4c0b)
	xor a
	ld hl, wMenuObj3FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b73)
	ld [hli], a
	ld a, LOW(Frameset_1e6b73)
	ld [hl], a
	ret
; 0x1e4c18

ActionHelp_ShowWarioHangVertical: ; 1e4c18 (79:4c18)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1fedd0)
	ld [hli], a
	ld a, LOW(Frameset_1fedd0)
	ld [hl], a
	ret
; 0x1e4c25

ActionHelp_ShowWarioHangHorizontal: ; 1e4c25 (79:4c25)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1fed7c)
	ld [hli], a
	ld a, LOW(Frameset_1fed7c)
	ld [hl], a
	ret
; 0x1e4c32

ActionHelp_ShowWarioHangOwlRight: ; 1e4c32 (79:4c32)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1fed91)
	ld [hli], a
	ld a, LOW(Frameset_1fed91)
	ld [hl], a
	ret
; 0x1e4c3f

ActionHelp_ShowWarioOwlMoveHang: ; 1e4c3f (79:4c3f)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1feda6)
	ld [hli], a
	ld a, LOW(Frameset_1feda6)
	ld [hl], a
	ret
; 0x1e4c4c

ActionHelp_ShowWarioOwlMoveHangRight: ; 1e4c4c (79:4c4c)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1fedbb)
	ld [hli], a
	ld a, LOW(Frameset_1fedbb)
	ld [hl], a
	ret
; 0x1e4c59

ActionHelp_ShowWarioHangDrop: ; 1e4c59 (79:4c59)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1fedfe)
	ld [hli], a
	ld a, LOW(Frameset_1fedfe)
	ld [hl], a
	ret
; 0x1e4c66

ActionHelp2_ShowWarioIdle: ; 1e4c66 (79:4c66)
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

	ld hl, wActionHelpWarioObjFramesetOffset
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
; 0x1e4caa

ActionHelp2_ShowWarioWalk: ; 1e4caa (79:4caa)
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

	ld hl, wActionHelpWarioObjFramesetOffset
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
; 0x1e4ce9

ActionHelp2_ShowWarioJump: ; 1e4ce9 (79:4ce9)
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

	ld hl, wActionHelpWarioObjFramesetOffset
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
; 0x1e4d2f

ActionHelp_ShowWarioHangStopped: ; 1e4d2f (79:4d2f)
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

	ld hl, wActionHelpWarioObjFramesetOffset
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
; 0x1e4d75

ActionHelp_ShowWarioHangRailRight: ; 1e4d75 (79:4d75)
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

	ld hl, wActionHelpWarioObjFramesetOffset
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
; 0x1e4dbb

ActionHelp_ShowWarioBatTransform: ; 1e4dbb (79:4dbb)
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

	ld hl, wActionHelpWarioObjFramesetOffset
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
; 0x1e4dfa

ActionHelp_ShowWarioBatRight: ; 1e4dfa (79:4dfa)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld [wSFXTimer], a
	ld a, HIGH(Frameset_1fd46c)
	ld [hli], a
	ld a, LOW(Frameset_1fd46c)
	ld [hl], a
	ret
; 0x1e4e0a

ActionHelp_ShowWarioBatLeft: ; 1e4e0a (79:4e0a)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld [wSFXTimer], a
	ld a, HIGH(Frameset_1fd42c)
	ld [hli], a
	ld a, LOW(Frameset_1fd42c)
	ld [hl], a
	ret
; 0x1e4e1a

ActionHelp_ShowWarioVampireTransform: ; 1e4e1a (79:4e1a)
	play_sfx SFX_045

	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1fd439)
	ld [hli], a
	ld a, LOW(Frameset_1fd439)
	ld [hl], a
	ret
; 0x1e4e2f

ActionHelp_ShowRailRotateRight: ; 1e4e2f (79:4e2f)
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6fcb)
	ld [hli], a
	ld a, LOW(Frameset_1e6fcb)
	ld [hli], a
	ret
; 0x1e4e3c

ActionHelp_ShowRailRotateLeft: ; 1e4e3c (79:4e3c)
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6fc2)
	ld [hli], a
	ld a, LOW(Frameset_1e6fc2)
	ld [hli], a
	ret
; 0x1e4e49

ActionHelp_ShowOwlFlyUp: ; 1e4e49 (79:4e49)
	ld hl, wMenuObj4
	ld a, [wActionHelpWarioObjYCoord]
	sub $20
	ld [hli], a
	ld a, [wActionHelpWarioObjXCoord]
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
; 0x1e4e6f
