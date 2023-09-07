OwlActionHelp: ; 1e400c (79:400c)
	call .StateTable

	ld a, [wActionHelpBlackedOut]
	and a
	jr nz, .done
	ld a, [wActionHelpFrozen]
	and a
	jr nz, .action_help_frozen

	ld hl, wMenuObj4FramesetPtr + 1
	ld a, [wMenuObj4FramesetBank]
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall UpdateObjAnim
	ld a, [wObjAnimWasReset]
	ld [wMenuObj4AnimationEnded], a

	ld hl, wActionHelpWarioFramesetPtr + 1
	ld a, [wActionHelpWarioOAMBank]
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall UpdateObjAnim

.action_help_frozen
	ld hl, wActionHelpWario
	call AddActionHelpWarioSprite_FromBank
	ld hl, wMenuObj4
	call AddActionHelpSprite_Far
.done
	ret
; 0x1e4060

.StateTable:
	ld a, [wActionHelpState]
	jumptable

	dw ActionHelp2_Init
	dw Func_1e4095
	dw Func_1e4104
	dw Func_1e4134
	dw Func_1e4165
	dw Func_1e4195
	dw Func_1e41c9
	dw Func_1e41fd
	dw Func_1e4227
	dw ActionHelp2_FlashBInput
	dw Func_1e4254
	dw Func_1e4271
	dw Func_1e4286
; 0x1e407e

Func_1e407e: ; 1e407e (79:407e)
	ld a, [wPowerUpLevel]
	bit ACTION_HELP_TITLE_SCREEN_F, a
	jr z, .restart_action_help
	jp InitWithoutDemoPowerUpReset

.restart_action_help
	call ActionHelp2_ClearDPadInput
	call ActionHelp2_ClearButtonsInput
	ld a, $1
	ld [wActionHelpState], a
	jr Func_1e409a

Func_1e4095: ; 1e4095 (79:4095)
	ld hl, wTimer
	dec [hl]
	ret nz
Func_1e409a: ; 1e409a (79:409a)
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

	ld hl, wActionHelpWario
	ld a, $38
	ld [hli], a
	ld a, $c0
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1fed7c)
	ld [hli], a
	ld a, LOW(Frameset_1fed7c)
	ld [hli], a
	xor a
	ld [hl], a
	ld [wSFXTimer], a
	ld a, HIGH(OAM_1fddb4)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1fddb4)
	ld [wActionHelpWarioOAMPtr + 1], a
	ld a, BANK(OAM_1fddb4)
	ld [wActionHelpWarioOAMBank], a

	ld hl, wMenuObj4
	farcall ActionHelp_HideBlockDebris
	call LoadActionHelpPalsWithoutWater

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e4104: ; 1e4104 (79:4104)
	play_sfx_rept 32, SFX_071

	ld a, [wActionHelpCounter]
	and %1
	ret nz
	ld hl, wActionHelpWarioXCoord
	dec [hl]
	ld a, [hl]
	cp $60
	ret nc

	call ActionHelp2_ShowDUpInput
	call ActionHelp_ShowWarioHangVertical

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e4134: ; 1e4134 (79:4134)
	play_sfx_rept 32, SFX_071

	ld a, [wActionHelpCounter]
	and %1
	ret nz

	ld hl, wActionHelpWario
	dec [hl]
	ld a, [hl]
	cp $34
	jr z, .asm_1e4162
	cp $20
	ret nc

	ld hl, wActionHelpState
	inc [hl]
	ret

.asm_1e4162
	jp ActionHelp2_ClearDPadInput

Func_1e4165: ; 1e4165 (79:4165)
	play_sfx_rept 32, SFX_071

	ld a, [wActionHelpCounter]
	and %1
	ret nz
	ld hl, wActionHelpWario
	inc [hl]
	ld a, [hl]
	cp $38
	ret c

	call ActionHelp2_ShowDLeftInput
	call ActionHelp_ShowWarioHangHorizontal

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e4195: ; 1e4195 (79:4195)
	play_sfx_rept 32, SFX_071

	ld a, [wActionHelpCounter]
	and %1
	ret nz
	ld hl, wActionHelpWarioXCoord
	dec [hl]
	ld a, [hl]
	cp $5c
	jr z, .asm_1e41c6
	cp $10
	ret nc

	call ActionHelp_ShowWarioHangOwlRight

	ld hl, wActionHelpState
	inc [hl]
	ret

.asm_1e41c6
	jp ActionHelp2_ClearDPadInput

Func_1e41c9: ; 1e41c9 (79:41c9)
	play_sfx_rept 32, SFX_071

	ld a, [wActionHelpCounter]
	and %1
	ret nz
	ld hl, wActionHelpWarioXCoord
	inc [hl]
	ld a, [hl]
	cp $60
	ret c

	xor a
	ld [wSFXTimer], a
	call ActionHelp2_ShowDLeftInput
	call ActionHelp_ShowWarioOwlMoveHang

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e41fd: ; 1e41fd (79:41fd)
	play_sfx_rept 16, SFX_071

	ld hl, wActionHelpWarioXCoord
	dec [hl]
	ld a, [hl]
	cp $20
	ret nc

	call ActionHelp2_ShowDRightInput
	call ActionHelp_ShowWarioOwlMoveHangRight

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e4227: ; 1e4227 (79:4227)
	play_sfx_rept 16, SFX_071

	ld hl, wActionHelpWarioXCoord
	inc [hl]
	ld a, [hl]
	cp $80
	ret c

	call ActionHelp2_ClearDPadInput
	call ActionHelp_ShowWarioHangDrop
	call ActionHelp_ShowOwlFlyUp

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e4254: ; 1e4254 (79:4254)
	ld hl, wMenuObj4YCoord
	dec [hl]
	dec [hl]
	ld hl, wActionHelpWario
	inc [hl]
	ld a, [hl]
	cp $40
	ret c

	call ActionHelp2_ClearButtonsInput
	call ActionHelp2_ShowWarioIdle
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e4271: ; 1e4271 (79:4271)
	ld hl, wMenuObj4YCoord
	dec [hl]
	dec [hl]
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp2_ShowDRightInput
	call ActionHelp2_ShowWarioWalk

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e4286: ; 1e4286 (79:4286)
	ld hl, wActionHelpWarioXCoord
	inc [hl]
	ld a, [hl]
	cp $b0
	ret c
	jp Func_1e407e
; 0x1e4291
