ActionHelp_FlashDDownInput:
	ld a, TRUE
	ld [wActionHelpFrozen], a

	ld a, [wActionHelpCounter]
	and %11
	ret nz
	ld hl, wTimer
	inc [hl]
	bit 0, [hl]
	jr nz, .show_d_down
	call ActionHelp_ClearDPadInput
	ret
.show_d_down
	play_sfx SFX_0EC
	call ActionHelp_ShowDDownInput
	ld a, [wTimer]
	cp $07
	ret c

	xor a
	ld [wTimer], a
	ld [wActionHelpFrozen], a

	ld hl, wActionHelpState
	inc [hl]
	ret

ActionHelp_FlashDUpInput:
	ld a, TRUE
	ld [wActionHelpFrozen], a

	ld a, [wActionHelpCounter]
	and %11
	ret nz
	ld hl, wTimer
	inc [hl]
	bit 0, [hl]
	jr nz, .show_d_up
	call ActionHelp_ClearDPadInput
	ret
.show_d_up
	play_sfx SFX_0EC
	call ActionHelp_ShowDUpInput
	ld a, [wTimer]
	cp $7
	ret c

	xor a
	ld [wTimer], a
	ld [wActionHelpFrozen], a

	ld hl, wActionHelpState
	inc [hl]
	ret

ActionHelp_FlashBInput:
	ld a, TRUE
	ld [wActionHelpFrozen], a

	ld a, [wActionHelpCounter]
	and %11
	ret nz
	ld hl, wTimer
	inc [hl]
	bit 0, [hl]
	jr nz, .show_b_button
	call ActionHelp_ClearButtonsInput
	ret
.show_b_button
	play_sfx SFX_0EC
	call ActionHelp_ShowBInput
	ld a, [wTimer]
	cp $7
	ret c

	xor a
	ld [wTimer], a
	ld [wActionHelpFrozen], a

	ld hl, wActionHelpState
	inc [hl]
	ret

ActionHelp_FlashAInput:
	ld a, TRUE
	ld [wActionHelpFrozen], a

	ld a, [wActionHelpCounter]
	and %11
	ret nz
	ld hl, wTimer
	inc [hl]
	bit 0, [hl]
	jr nz, .show_a_button
	call ActionHelp_ClearButtonsInput
	ret
.show_a_button
	play_sfx SFX_0EC
	call ActionHelp_ShowAInput
	ld a, [wTimer]
	cp $7
	ret c

	xor a
	ld [wTimer], a
	ld [wActionHelpFrozen], a

	ld hl, wActionHelpState
	inc [hl]
	ret

ActionHelp_Init:
	xor a
	ld [wAnimatedTilesFrameDuration], a
	ld [wAnimatedTilesGfx], a
	ld [wAnimatedTilesFrameCount], a
	ld [wAnimatedTilesFrame], a
	ld [wActionHelpFrozen], a
	ld [wRoomAnimatedTilesEnabled], a

	ld a, $04
	ld [wSCY], a

	farcall Func_1e48bc
	farcall Func_1e4a47
	call ActionHelp_ClearDPadInput
	call ActionHelp_ClearButtonsInput

	ld a, $60
	ld [wTimer], a
	ld hl, wActionHelpState
	inc [hl]
	ret

VBlank_1fb6b7:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, [wIsDMATransferPending]
	and a
	jr z, .not_pending
	ld hl, wPendingDMASourceBank
	ld a, [hli]
	ld [rROMB0 + $100], a
	ld c, LOW(rVDMA_SRC_HIGH)
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ldh [rVBK], a
	inc c
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hl]
	ld [$ff00+c], a
	xor a
	ld [wIsDMATransferPending], a
.not_pending
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a

	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.end

Func_1fb6f7:
	ld hl, wActionHelpPowerUp
	ld a, [wJoypadPressed]
	bit B_PAD_RIGHT, a
	jr nz, .d_right
	bit B_PAD_LEFT, a
	jr nz, .d_left
	ret

.d_right
	ld a, [hl]
	cp NUM_MAIN_POWER_UPS - 1
	ret z
	ld e, a
	inc [hl] ; next Power-Up
	xor a
	ld [wActionHelpState], a
	ld a, [wMenuObj1XCoord]
	add $10
	ld [wMenuObj1XCoord], a
	jr .asm_1fb72b

.d_left
	ld a, [hl]
	and a
	ret z
	ld e, a
	dec [hl] ; prev Power-Up
	xor a
	ld [wActionHelpState], a
	ld a, [wMenuObj1XCoord]
	sub $10
	ld [wMenuObj1XCoord], a

.asm_1fb72b
	ld a, TRUE
	ld [wActionHelpBlackedOut], a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [wPowerUpLevel]
	and POWER_UP_MASK
	cp e
	jr c, .asm_1fb750
	hlbgcoord 0, 16, v1BGMap1
	sla e
	ld d, $00
	add hl, de
	ld e, TILEMAP_WIDTH
	call WaitVBlank
	ld a, $03
	ld [hli], a
	ld [hld], a
	add hl, de
	ld [hli], a
	ld [hl], a
.asm_1fb750
	ld a, [wActionHelpPowerUp]
	ld e, a
	ld a, [wPowerUpLevel]
	and POWER_UP_MASK
	cp e
	jr c, .finish
	ld hl, PowerUpOBPals
	ld d, $00
	add hl, de
	ld b, [hl]
	hlbgcoord 0, 16, v1BGMap1
	sla e
	add hl, de
	ld e, TILEMAP_WIDTH
	call WaitVBlank
	ld a, b
	ld [hli], a
	ld [hld], a
	add hl, de
	ld [hli], a
	ld [hl], a

.finish
	xor a
	ldh [rVBK], a
	play_sfx SFX_0E2
	ret

PowerUpOBPals:
	table_width 1
	db OBPAL_POWER_UP_RED    ; NO_POWER_UP
	db OBPAL_POWER_UP_BLUE   ; LEAD_OVERALLS
	db OBPAL_POWER_UP_GREEN  ; SWIMMING_FLIPPERS
	db OBPAL_POWER_UP_GREEN  ; HEAD_SMASH_HELMET
	db OBPAL_POWER_UP_RED    ; GRAB_GLOVE
	db OBPAL_POWER_UP_YELLOW ; GARLIC
	db OBPAL_POWER_UP_RED    ; SUPER_JUMP_SLAM_OVERALLS
	db OBPAL_POWER_UP_BLUE   ; HIGH_JUMP_BOOTS
	db OBPAL_POWER_UP_GREEN  ; PRINCE_FROGS_GLOVES
	db OBPAL_POWER_UP_YELLOW ; SUPER_GRAB_GLOVES
	assert_table_length NUM_MAIN_POWER_UPS

ActionHelp_ClearDPadInput:
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b76)
	ld [hli], a
	ld a, LOW(Frameset_1e6b76)
	ld [hl], a
	ret

ActionHelp_ShowDRightInput:
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b7c)
	ld [hli], a
	ld a, LOW(Frameset_1e6b7c)
	ld [hl], a
	ret

ActionHelp_ShowDLeftInput:
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b82)
	ld [hli], a
	ld a, LOW(Frameset_1e6b82)
	ld [hl], a
	ret

ActionHelp_ShowDDownInput:
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b7f)
	ld [hli], a
	ld a, LOW(Frameset_1e6b7f)
	ld [hl], a
	ret

ActionHelp_ShowDUpInput:
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b79)
	ld [hli], a
	ld a, LOW(Frameset_1e6b79)
	ld [hl], a
	ret

ActionHelp_ShowDRightAndDDownInput:
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6ba8)
	ld [hli], a
	ld a, LOW(Frameset_1e6ba8)
	ld [hl], a
	ret

ActionHelp_ClearButtonsInput:
	ld hl, wMenuObj3FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b6d)
	ld [hli], a
	ld a, LOW(Frameset_1e6b6d)
	ld [hl], a
	ret

ActionHelp_ShowAInput:
	xor a
	ld hl, wMenuObj3FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b70)
	ld [hli], a
	ld a, LOW(Frameset_1e6b70)
	ld [hl], a
	ret

ActionHelp_ShowBInput:
	xor a
	ld hl, wMenuObj3FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b73)
	ld [hli], a
	ld a, LOW(Frameset_1e6b73)
	ld [hl], a
	ret

ActionHelp_HideObj5BlockDebris:
	ld hl, wMenuObj5
ActionHelp_HideBlockDebris:
	ld a, $a0
	ld [hli], a
	ld a, $e8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b64)
	ld [hli], a
	ld a, LOW(Frameset_1e6b64)
	ld [hli], a
	ld a, HIGH(OAM_1e697c)
	ld [hli], a
	ld a, LOW(OAM_1e697c)
	ld [hli], a
	ld a, BANK(OAM_1e697c)
	ld [hli], a
	xor a
	ld [hl], a
	ret

; b = y offset of debris
ActionHelp_ShowBlockDebrisWithYOffset:
	ld hl, wMenuObj5YCoord
	ld c, $00
;	fallthrough

; b = y offset of debris
; c = x offset of debris
ActionHelp_ShowBlockDebris:
	play_sfx SFX_BLOCK_BREAK

	ld a, [wMenuObj4YCoord]
	sub b
	ld [hli], a
	ld a, [wMenuObj4XCoord]
	sub c
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d49a)
	ld [hli], a
	ld a, LOW(Frameset_d49a)
	ld [hli], a
	ld a, HIGH(OAM_d20e)
	ld [hli], a
	ld a, LOW(OAM_d20e)
	ld [hli], a
	ld a, BANK(OAM_d20e)
	ld [hli], a
	xor a
	ld [hl], a
	ret

ActionHelp_ShowInitialWarioWalk:
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
	ld a, $80 dma_tiles
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a

	ld hl, wActionHelpWario
	ld a, $40
	ld [hli], a
	ld a, $40
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_149c5)
	ld [hli], a
	ld a, LOW(Frameset_149c5)
	ld [hli], a
	xor a
	ld [hl], a ; wActionHelpWarioVar
	ld [wSFXTimer], a
	ld a, HIGH(OAM_1426c)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1426c)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret

ActionHelp_ShowWarioJump:
	play_sfx SFX_JUMP

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
	ld a, $80 dma_tiles
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
	ret

ActionHelp_ShowWarioJumpLeft:
	play_sfx SFX_JUMP

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
	ld a, $80 dma_tiles
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a

	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_15f94)
	ld [hli], a
	ld a, LOW(Frameset_15f94)
	ld [hli], a
	xor a
	ld [hl], a
	ld a, HIGH(OAM_15955)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_15955)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret

ActionHelp_ShowWarioSmashAttack:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wActionHelpPowerUp]
	cp SUPER_JUMP_SLAM_OVERALLS
	jr nc, .got_super_jump_slam
	ld a, HIGH(Frameset_15f91)
	ld [hli], a
	ld a, LOW(Frameset_15f91)
	ld [hli], a
	ld a, $18
	ld [hl], a ; wActionHelpWarioVar
	ret

.got_super_jump_slam
	ld a, HIGH(Frameset_16055)
	ld [hli], a
	ld a, LOW(Frameset_16055)
	ld [hli], a
	ld a, $18
	ld [hl], a ; wActionHelpWarioVar
	ret

ActionHelp_ShowWarioGroundPound:
	play_sfx SFX_GROUND_POUND
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_16009)
	ld [hli], a
	ld a, LOW(Frameset_16009)
	ld [hl], a
	ret

ActionHelp_ShowWarioGroundShake:
	play_sfx SFX_GROUND_SHAKE

	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_15fc5)
	ld [hli], a
	ld a, LOW(Frameset_15fc5)
	ld [hl], a
	ret

ActionHelp_ShowWarioLand:
	play_sfx SFX_LAND

	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_15fa1)
	ld [hli], a
	ld a, LOW(Frameset_15fa1)
	ld [hl], a
	ret

ActionHelp_ShowWarioIdle:
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
	ld a, $80 dma_tiles
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
	ret

ActionHelp_ShowWarioWalk:
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
	ld a, $80 dma_tiles
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

ActionHelp_ShowWarioSwim:
	play_sfx SFX_SPLASH

	ld a, BANK(WarioSwimGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioSwimGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioSwimGfx)
	ld [wPendingDMASourcePtr + 1], a
	ld a, HIGH(v0Tiles0)
	ld [wPendingDMADestinationPtr + 0], a
	ld a, LOW(v0Tiles0)
	ld [wPendingDMADestinationPtr + 1], a
	ld a, BANK("VRAM0")
	ld [wPendingDMADestinationBank], a
	ld a, $80 dma_tiles
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a

	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1555b)
	ld [hli], a
	ld a, LOW(Frameset_1555b)
	ld [hli], a
	ld a, HIGH(OAM_15254)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_15254)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret

ActionHelp_ShowWarioSwimLeft:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_15554)
	ld [hli], a
	ld a, LOW(Frameset_15554)
	ld [hli], a
	ret

ActionHelp_ShowWarioSubmerge:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1558b)
	ld [hli], a
	ld a, LOW(Frameset_1558b)
	ld [hli], a

	xor a
	ld [wSFXTimer], a
	ret

ActionHelp_ShowWarioUnderwaterThrust:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_155c5)
	ld [hli], a
	ld a, LOW(Frameset_155c5)
	ld [hli], a

	xor a
	ld [wSFXTimer], a
	ret

ActionHelp_ShowWarioUnderwaterStopped:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1556c)
	ld [hli], a
	ld a, LOW(Frameset_1556c)
	ld [hli], a
	ret

ActionHelp_ShowWarioGrab:
	play_sfx SFX_GRAB

	ld a, BANK(WarioThrowGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioThrowGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioThrowGfx)
	ld [wPendingDMASourcePtr + 1], a
	ld a, HIGH(v0Tiles0)
	ld [wPendingDMADestinationPtr + 0], a
	ld a, LOW(v0Tiles0)
	ld [wPendingDMADestinationPtr + 1], a
	ld a, BANK("VRAM0")
	ld [wPendingDMADestinationBank], a
	ld a, $80 dma_tiles
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a

	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1640c)
	ld [hli], a
	ld a, LOW(Frameset_1640c)
	ld [hli], a
	ld a, HIGH(OAM_1606a)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1606a)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret

ActionHelp_ShowWarioSlowGrab:
	play_sfx SFX_GRAB

	ld a, BANK(WarioThrowGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioThrowGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioThrowGfx)
	ld [wPendingDMASourcePtr + 1], a
	ld a, HIGH(v0Tiles0)
	ld [wPendingDMADestinationPtr + 0], a
	ld a, LOW(v0Tiles0)
	ld [wPendingDMADestinationPtr + 1], a
	ld a, BANK("VRAM0")
	ld [wPendingDMADestinationBank], a
	ld a, $80 dma_tiles
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a

	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_16415)
	ld [hli], a
	ld a, LOW(Frameset_16415)
	ld [hli], a
	ld a, HIGH(OAM_1606a)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1606a)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret

ActionHelp_ShowWarioBeginGrab:
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
	ld a, $80 dma_tiles
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a

	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_14a23)
	ld [hli], a
	ld a, LOW(Frameset_14a23)
	ld [hli], a
	ld a, HIGH(OAM_1426c)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1426c)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret

ActionHelp_ShowWarioGrabWalk:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_14a0f)
	ld [hli], a
	ld a, LOW(Frameset_14a0f)
	ld [hli], a
	ret

ActionHelp_ShowWarioBeginThrow:
	play_sfx SFX_02C

	ld a, BANK(WarioThrowGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioThrowGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioThrowGfx)
	ld [wPendingDMASourcePtr + 1], a
	ld a, HIGH(v0Tiles0)
	ld [wPendingDMADestinationPtr + 0], a
	ld a, LOW(v0Tiles0)
	ld [wPendingDMADestinationPtr + 1], a
	ld a, BANK("VRAM0")
	ld [wPendingDMADestinationBank], a
	ld a, $80 dma_tiles
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a

	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1642f)
	ld [hli], a
	ld a, LOW(Frameset_1642f)
	ld [hli], a
	ld a, HIGH(OAM_1606a)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1606a)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret

ActionHelp_ShowWarioThrow:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1641e)
	ld [hli], a
	ld a, LOW(Frameset_1641e)
	ld [hli], a
	ret

ActionHelp_ShowWarioChargeThrow:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_16435)
	ld [hli], a
	ld a, LOW(Frameset_16435)
	ld [hli], a
	xor a
	ld [wSFXTimer], a
	ret

ActionHelp_ShowWarioFullyChargedGrab:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_16441)
	ld [hli], a
	ld a, LOW(Frameset_16441)
	ld [hli], a
	ret

ActionHelp_ShowWarioFullyChargedThrow:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_16423)
	ld [hli], a
	ld a, LOW(Frameset_16423)
	ld [hli], a
	ret

ActionHelp_ShowWarioAttack:
	ld a, BANK(WarioAttackGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioAttackGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioAttackGfx)
	ld [wPendingDMASourcePtr + 1], a
	ld a, HIGH(v0Tiles0)
	ld [wPendingDMADestinationPtr + 0], a
	ld a, LOW(v0Tiles0)
	ld [wPendingDMADestinationPtr + 1], a
	ld a, BANK("VRAM0")
	ld [wPendingDMADestinationBank], a
	ld a, $80 dma_tiles
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a

	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [wSFXTimer], a
	ld [hli], a
	ld [hli], a
	ld a, [wActionHelpPowerUp]
	cp GARLIC
	jr nc, .has_garlic_power_up
	ld a, HIGH(Frameset_151fd)
	ld [hli], a
	ld a, LOW(Frameset_151fd)
	ld [hli], a
	ld a, HIGH(OAM_14d1b)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_14d1b)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret

.has_garlic_power_up
	ld a, HIGH(Frameset_1522d)
	ld [hli], a
	ld a, LOW(Frameset_1522d)
	ld [hli], a
	ld a, HIGH(OAM_14d1b)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_14d1b)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret

ActionHelp_ShowWarioRoll:
	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_166f7)
	ld [hli], a
	ld a, LOW(Frameset_166f7)
	ld [hli], a
	ret

ActionHelp_ShowWarioBump:
	play_sfx SFX_BUMP

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
	ld a, $80 dma_tiles
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a

	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_15f7f)
	ld [hli], a
	ld a, LOW(Frameset_15f7f)
	ld [hli], a
	ld a, HIGH(OAM_15955)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_15955)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret

ActionHelp_ShowWarioSlide:
	ld a, BANK(WarioSlideGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioSlideGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioSlideGfx)
	ld [wPendingDMASourcePtr + 1], a
	ld a, HIGH(v0Tiles0)
	ld [wPendingDMADestinationPtr + 0], a
	ld a, LOW(v0Tiles0)
	ld [wPendingDMADestinationPtr + 1], a
	ld a, BANK("VRAM0")
	ld [wPendingDMADestinationBank], a
	ld a, $80 dma_tiles
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a

	ld hl, wActionHelpWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1671d)
	ld [hli], a
	ld a, LOW(Frameset_1671d)
	ld [hli], a
	ld a, HIGH(OAM_1644a)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1644a)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret

ActionHelp_ShowParaGoomWalk:
	ld hl, wMenuObj4
	ld a, $40
	ld [hli], a
	ld a, $e8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6f36)
	ld [hli], a
	ld a, LOW(Frameset_1e6f36)
	ld [hli], a
	ld a, HIGH(OAM_1e6bab)
	ld [hli], a
	ld a, LOW(OAM_1e6bab)
	ld [hli], a
	ld a, BANK(OAM_1e6bab)
	ld [hli], a
	xor a
	ld [hl], a
	ret

ActionHelp_ShowParaGoomStun:
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6f48)
	ld [hli], a
	ld a, LOW(Frameset_1e6f48)
	ld [hli], a
	ret

ActionHelp_ShowParaGoomThrown:
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6f3f)
	ld [hli], a
	ld a, LOW(Frameset_1e6f3f)
	ld [hli], a
	ret

ActionHelp_ShowObj4EnemyVanish:
	ld hl, wMenuObj4FramesetOffset
ActionHelp_ShowEnemyVanish:
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d4a5)
	ld [hli], a
	ld a, LOW(Frameset_d4a5)
	ld [hli], a
	ld a, HIGH(OAM_d20e)
	ld [hli], a
	ld a, LOW(OAM_d20e)
	ld [hli], a
	ld a, BANK(OAM_d20e)
	ld [hl], a

	play_sfx SFX_VANISH
	ret

ActionHelp_ShowFutamoguAngry:
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6f78)
	ld [hli], a
	ld a, LOW(Frameset_1e6f78)
	ld [hli], a
	ret

ActionHelp_ShowFutamoguHappy:
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6f66)
	ld [hli], a
	ld a, LOW(Frameset_1e6f66)
	ld [hli], a
	ret

ActionHelp_ShowCountRichtertoffIdle:
	ld hl, wMenuObj4
	ld a, $40
	ld [hli], a
	ld a, $e8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6f4d)
	ld [hli], a
	ld a, LOW(Frameset_1e6f4d)
	ld [hli], a
	ld a, HIGH(OAM_1e6bab)
	ld [hli], a
	ld a, LOW(OAM_1e6bab)
	ld [hli], a
	ld a, BANK(OAM_1e6bab)
	ld [hli], a
	ret

ActionHelp_ShowCountRichtertoffStun:
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6f5e)
	ld [hli], a
	ld a, LOW(Frameset_1e6f5e)
	ld [hli], a
	ret

ActionHelp_ShowCountRichtertoffThrown:
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6f55)
	ld [hli], a
	ld a, LOW(Frameset_1e6f55)
	ld [hli], a
	ret

ActionHelp_ShowSingleSolidBlock:
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b67)
	ld [hli], a
	ld a, LOW(Frameset_1e6b67)
	ld [hli], a
	ret

ActionHelp_ShowVerticalBlockPair:
	ld hl, wMenuObj4
	ld a, $40
	ld [hli], a
	ld a, $e8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b93)
	ld [hli], a
	ld a, LOW(Frameset_1e6b93)
	ld [hli], a
	ld a, HIGH(OAM_1e697c)
	ld [hli], a
	ld a, LOW(OAM_1e697c)
	ld [hli], a
	ld a, BANK(OAM_1e697c)
	ld [hl], a
	ret

ActionHelp_ShowSlide:
	ld hl, wMenuObj4
	ld a, $40
	ld [hli], a
	ld a, $d8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b88)
	ld [hli], a
	ld a, LOW(Frameset_1e6b88)
	ld [hli], a
	ld a, HIGH(OAM_1e697c)
	ld [hli], a
	ld a, LOW(OAM_1e697c)
	ld [hli], a
	ld a, BANK(OAM_1e697c)
	ld [hl], a
	ret

ActionHelp_ShowOverheadPillar:
	ld hl, wMenuObj6
	ld a, $20
	ld [hli], a
	ld a, $e8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b85)
	ld [hli], a
	ld a, LOW(Frameset_1e6b85)
	ld [hli], a
	ld a, HIGH(OAM_1e697c)
	ld [hli], a
	ld a, LOW(OAM_1e697c)
	ld [hli], a
	ld a, BANK(OAM_1e697c)
	ld [hli], a
	ret
