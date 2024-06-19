PrinceFrogsGlovesActionHelp:
	call .StateTable
	ld a, [wActionHelpBlackedOut]
	and a
	jr nz, .done
	ld a, [wActionHelpFrozen]
	and a
	jr nz, .action_help_frozen
	ld hl, wActionHelpWarioFramesetPtr + 1
	farcall $05, UpdateObjAnim
.action_help_frozen
	ld hl, wActionHelpWario
	farcall AddActionHelpWarioSprite
.done
	ret

.StateTable:
	ld a, [wActionHelpState]
	jumptable

	dw ActionHelp_Init
	dw Func_1fad75
	dw Func_1fadea
	dw Func_1fadfa
	dw Func_1fae0f
	dw Func_1fae3d
	dw Func_1fae4d
	dw Func_1fae7f
	dw Func_1faeba
	dw Func_1faef0
	dw ActionHelp_FlashBInput
	dw Func_1faf19
	dw Func_1faf4e
	dw Func_1faf7a
	dw Func_1fafb1
	dw Func_1faff5
	dw Func_1fb023
	dw Func_1fb061
	dw Func_1fb078

Func_1fad42:
	ld a, [wPowerUpLevel]
	bit ACTION_HELP_LEVEL_CLEAR_F, a
	jr nz, .asm_1fad50
	bit ACTION_HELP_TITLE_SCREEN_F, a
	jr z, .restart_action_help
	jp InitWithoutDemoPowerUpReset

.asm_1fad50
	and $3f
	ld [wPowerUpLevel], a
	farcall Func_4628
	call Func_1795
	ret

.restart_action_help
	call ActionHelp_ClearDPadInput
	call ActionHelp_ClearButtonsInput
	ld a, $01
	ld [wActionHelpState], a
	jr Func_1fad7a

Func_1fad75:
	ld hl, wTimer
	dec [hl]
	ret nz
Func_1fad7a:
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

Func_1fadea:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fadfa:
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

Func_1fae0f:
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

Func_1fae3d:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowDDownInput
	call ActionHelp_ShowWarioSubmerge

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fae4d:
	play_sfx_rept 37, SFX_00E

	ld a, [wActionHelpCounter]
	and %11
	ret nz
	ld hl, wActionHelpWarioYCoord
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

Func_1fae7f:
	play_sfx_rept 37, SFX_00E

	ld hl, wTimer
	ld a, [hl]
	and a
	jr z, .asm_1fae9f
	dec [hl]
	ret

.asm_1fae9f
	ld a, [wActionHelpCounter]
	and $01
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

Func_1faeba:
	play_sfx_rept 37, SFX_00E

	ld hl, wTimer
	ld a, [hl]
	and a
	jr z, .asm_1faeda
	dec [hl]
	ret
.asm_1faeda
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

Func_1faef0:
	play_sfx_rept 37, SFX_00E

	ld hl, wActionHelpWarioXCoord
	dec [hl]
	ld a, [hl]
	cp $50
	ret nc

	ld [hl], $50
	call ActionHelp_ShowWarioUnderwaterStopped

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1faf19:
	play_sfx_rept 15, SFX_00F

	ld hl, wActionHelpWarioXCoord
	ld a, [hl]
	cp $58
	jr c, .asm_1faf3e
	ld a, [wActionHelpCounter]
	and $01
	ret nz
.asm_1faf3e
	inc [hl]
	ld a, [hl]
	cp $6c
	ret c

	call ActionHelp_ShowWarioSubmerge
	call ActionHelp_ClearButtonsInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1faf4e:
	play_sfx_rept 37, SFX_00E

	ld hl, wActionHelpWarioXCoord
	dec [hl]
	ld a, [hl]
	cp $34
	ret nc

	ld [hl], $34
	call ActionHelp_ShowWarioUnderwaterStopped
	call ActionHelp_ShowBInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1faf7a:
	play_sfx_rept 15, SFX_00F

	ld hl, wActionHelpWarioXCoord
	ld a, [hl]
	cp $3c
	jr c, .asm_1faf9f
	ld a, [wActionHelpCounter]
	and $01
	ret nz
.asm_1faf9f
	inc [hl]
	ld a, [hl]
	cp $4c
	ret c

	call ActionHelp_ClearButtonsInput
	ld a, $0c
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fafb1:
	play_sfx_rept 15, SFX_00F

	ld hl, wTimer
	ld a, [hl]
	and a
	jr z, .asm_1fafd7
	dec [hl]
	ret nz
	call ActionHelp_ShowWarioUnderwaterStopped
	call ActionHelp_ShowBInput
.asm_1fafd7
	ld hl, wActionHelpWarioXCoord
	ld a, [hl]
	cp $58
	jr c, .asm_1fafe5
	ld a, [wActionHelpCounter]
	and $01
	ret nz
.asm_1fafe5
	inc [hl]
	ld a, [hl]
	cp $6c
	ret c

	call ActionHelp_ShowWarioSubmerge
	call ActionHelp_ClearButtonsInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1faff5:
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

Func_1fb023:
	play_sfx_rept 37, SFX_00E

	ld hl, wTimer
	ld a, [hl]
	and a
	jr z, .asm_1fb043
	dec [hl]
	ret
.asm_1fb043
	ld a, [wActionHelpCounter]
	and %11
	ret nz
	ld hl, wActionHelpWario
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

Func_1fb061:
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

Func_1fb078:
	ld hl, wActionHelpWarioXCoord
	ld a, [hl]
	cp $18
	jr z, .asm_1fb081
	dec [hl]
.asm_1fb081
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
	jp Func_1fad42
