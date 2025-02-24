SwimmingFlippersActionHelp:
	call .StateTable

	ld a, [wActionHelpBlackedOut]
	and a
	jr nz, .done
	ld a, [wActionHelpFrozen]
	and a
	jr nz, .action_help_frozen
	ld hl, wActionHelpWarioFramesetPtr + 1
	farcall $5, UpdateObjAnim
.action_help_frozen
	ld hl, wActionHelpWario
	farcall LoadActionHelpWarioSprite
.done
	ret

.StateTable:
	ld a, [wActionHelpState]
	jumptable

	dw ActionHelp_Init
	dw Func_1f8e64
	dw Func_1f8ed9
	dw Func_1f8ee9
	dw Func_1f8efe
	dw Func_1f8f2c
	dw ActionHelp_FlashDDownInput
	dw Func_1f8f39
	dw Func_1f8f6b
	dw Func_1f8fa6
	dw Func_1f8fdc
	dw Func_1f900a
	dw ActionHelp_FlashBInput
	dw Func_1f9043
	dw Func_1f9080
	dw Func_1f90b6
	dw Func_1f90e2
	dw Func_1f910e
	dw Func_1f913c
	dw Func_1f917a
	dw Func_1f9191

Func_1f8e31:
	ld a, [wPowerUpLevel]
	bit ACTION_HELP_LEVEL_CLEAR_F, a
	jr nz, .asm_1f8e3f
	bit ACTION_HELP_TITLE_SCREEN_F, a
	jr z, .restart_action_help
	jp InitWithoutDemoPowerUpReset

.asm_1f8e3f
	and POWER_UP_MASK
	ld [wPowerUpLevel], a
	farcall Func_4628
	call Func_1795
	ret

.restart_action_help
	call ActionHelp_ClearDPadInput
	call ActionHelp_ClearButtonsInput
	ld a, $1
	ld [wActionHelpState], a
	jr Func_1f8e69

Func_1f8e64:
	ld hl, wTimer
	dec [hl]
	ret nz
Func_1f8e69:
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

	ld hl, wActionHelpWario
	ld a, $40
	ld [hli], a
	ld a, $18
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1425f)
	ld [hli], a
	ld a, LOW(Frameset_1425f)
	ld [hli], a
	xor a
	ld [hl], a
	ld a, HIGH(OAM_14000)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_14000)
	ld [wActionHelpWarioOAMPtr + 1], a

	ld a, 6
	ld [wAnimatedTilesFrameDuration], a
	ld a, ANIMATED_TILES_GFX_02
	ld [wAnimatedTilesGfx], a
	ld a, TRUE
	ld [wRoomAnimatedTilesEnabled], a
	ld a, $30
	ld [wTimer], a
	farcall LoadActionHelpPalsWithWater

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8ed9:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8ee9:
	ld hl, wActionHelpWarioXCoord
	inc [hl]
	ld a, [hl]
	cp $2c
	ret c

	call ActionHelp_ShowWarioJump
	ld a, $18
	ld [wActionHelpWarioVar], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8efe:
	ld hl, wActionHelpWarioXCoord
	inc [hl]
	ld hl, wActionHelpWarioVar
	inc [hl]
	ld a, [hl]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wActionHelpWarioYCoord]
	add [hl]
	ld [wActionHelpWarioYCoord], a
	cp $50
	ret c

	xor a
	ld [wActionHelpWarioVar], a
	call ActionHelp_ShowWarioSwim
	call ActionHelp_ClearDPadInput
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8f2c:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioSubmerge

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8f39:
	play_sfx_rept 37, SFX_00E

	ld a, [wActionHelpCounter]
	and %11
	ret nz
	ld hl, wActionHelpWario
	inc [hl]
	ld a, [hl]
	cp $58
	ret c
	call ActionHelp_ShowDRightInput
	ld a, $10
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8f6b:
	play_sfx_rept 37, SFX_00E

	ld hl, wTimer
	ld a, [hl]
	and a
	jr z, .asm_1f8f8b
	dec [hl]
	ret

.asm_1f8f8b
	ld a, [wActionHelpCounter]
	and %1
	ret nz
	ld hl, wActionHelpWarioXCoord
	inc [hl]
	ld a, [hl]
	cp $6c
	ret c
	call ActionHelp_ShowDDownInput
	ld a, $10
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8fa6:
	play_sfx_rept 37, SFX_00E

	ld hl, wTimer
	ld a, [hl]
	and a
	jr z, .asm_1f8fc6
	dec [hl]
	ret

.asm_1f8fc6
	ld a, [wActionHelpCounter]
	and %11
	ret nz
	ld hl, wActionHelpWarioYCoord
	inc [hl]
	ld a, [hl]
	cp $60
	ret c
	call ActionHelp_ClearDPadInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8fdc:
	play_sfx_rept 37, SFX_00E

	ld hl, wActionHelpWarioXCoord
	dec [hl]
	ld a, [hl]
	cp $34
	ret nc
	ld [hl], $34
	call ActionHelp_ShowDUpInput
	ld a, $10
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f900a:
	play_sfx_rept 37, SFX_00E

	ld hl, wTimer
	ld a, [hl]
	and a
	jr z, .asm_1f902a
	dec [hl]
	ret

.asm_1f902a
	ld a, [wActionHelpCounter]
	and %11
	ret nz
	ld hl, wActionHelpWarioYCoord
	dec [hl]
	ld a, [hl]
	cp $58
	ret nc

	call ActionHelp_ShowWarioUnderwaterThrust
	call ActionHelp_ClearDPadInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9043:
	play_sfx_rept 15, SFX_00F

	ld hl, wActionHelpWarioXCoord
	ld a, [hl]
	cp $58
	jr c, .asm_1f9068
	ld a, [wActionHelpCounter]
	and %1
	ret nz
.asm_1f9068
	inc [hl]
	ld a, [hl]
	cp $6c
	ret c

	call ActionHelp_ShowWarioSubmerge
	call ActionHelp_ShowDDownInput
	call ActionHelp_ClearButtonsInput
	ld a, $10
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9080:
	play_sfx_rept 37, SFX_00E

	ld hl, wTimer
	ld a, [hl]
	and a
	jr z, .asm_1f90a0
	dec [hl]
	ret

.asm_1f90a0
	ld a, [wActionHelpCounter]
	and %11
	ret nz
	ld hl, wActionHelpWarioYCoord
	inc [hl]
	ld a, [hl]
	cp $60
	ret c

	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f90b6:
	play_sfx_rept 37, SFX_00E

	ld hl, wActionHelpWarioXCoord
	dec [hl]
	ld a, [hl]
	cp $50
	ret nc
	ld [hl], $50
	call ActionHelp_ShowWarioUnderwaterThrust
	call ActionHelp_ShowBInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f90e2:
	play_sfx_rept 15, SFX_00F

	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp $30
	ret c
	ld [hl], $00

	call ActionHelp_ShowWarioSubmerge
	call ActionHelp_ClearButtonsInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f910e:
	play_sfx_rept 37, SFX_00E

	ld hl, wActionHelpWarioXCoord
	dec [hl]
	ld a, [hl]
	cp $34
	ret nc
	ld [hl], $34

	call ActionHelp_ShowDUpInput
	ld a, $10
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f913c:
	play_sfx_rept 37, SFX_00E

	ld hl, wTimer
	ld a, [hl]
	and a
	jr z, .asm_1f915c
	dec [hl]
	ret

.asm_1f915c
	ld a, [wActionHelpCounter]
	and $03
	ret nz
	ld hl, wActionHelpWarioYCoord
	dec [hl]
	ld a, [hl]
	cp $50
	ret nc

	call ActionHelp_ShowWarioSwimLeft
	call ActionHelp_ClearDPadInput
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f917a:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioJumpLeft
	call ActionHelp_ShowDLeftInput
	call ActionHelp_ShowAInput
	xor a
	ld [wActionHelpWarioVar], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9191:
	ld hl, wActionHelpWarioXCoord
	ld a, [hl]
	cp $18
	jr z, .skip_dec
	dec [hl]
.skip_dec
	ld hl, wActionHelpWarioVar
	inc [hl]
	ld a, [hl]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wActionHelpWarioYCoord]
	add [hl]
	ld [wActionHelpWarioYCoord], a
	ld a, [wActionHelpWarioVar]
	cp $18
	ret c
	ld a, [wActionHelpWarioYCoord]
	cp $40
	ret c

	ld a, $40
	ld [wActionHelpWarioYCoord], a
	xor a
	ld [wActionHelpWarioVar], a
	jp Func_1f8e31
