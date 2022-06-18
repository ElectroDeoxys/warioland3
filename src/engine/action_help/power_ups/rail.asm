RailActionHelp: ; 1e4291 (79:4291)
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
	ld hl, wActionHelpWarioObjFramesetPtr + 1
	ld a, [wActionHelpWarioOAMBank]
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall UpdateObjAnim
	ld a, [wObjAnimWasReset]
	ld [wActionHelpWarioAnimationEnded], a

.action_help_frozen
	ld hl, wActionHelpWarioObj
	call AddActionHelpWarioSprite_FromBank
	ld hl, wMenuObj4
	call AddActionHelpSprite_Far
.done
	ret

.StateTable:
	ld a, [wActionHelpState]
	jumptable

	dw ActionHelp2_Init
	dw Func_1e4324
	dw Func_1e43a0
	dw Func_1e43cb
	dw ActionHelp2_FlashBInput
	dw Func_1e4403
	dw Func_1e4432
	dw Func_1e4442
	dw Func_1e4455
	dw Func_1e4483
	dw Func_1e4490
	dw Func_1e44bb
	dw ActionHelp2_FlashAInput
	dw Func_1e44ee
	dw Func_1e452a
	dw Func_1e453a
	dw Func_1e454d
	dw Func_1e4578
; 0x1e430d

Func_1e430d: ; 1e430d (79:430d)
	ld a, [wPowerUpLevel]
	bit ACTION_HELP_TITLE_SCREEN_F, a
	jr z, .restart_action_help
	jp InitWithoutDemoPowerUpReset

.restart_action_help
	call ActionHelp2_ClearDPadInput
	call ActionHelp2_ClearButtonsInput
	ld a, $1
	ld [wActionHelpState], a
	jr Func_1e4329

Func_1e4324: ; 1e4324 (79:4324)
	ld hl, wTimer
	dec [hl]
	ret nz
Func_1e4329: ; 1e4329 (79:4329)
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

	ld hl, wActionHelpWarioObj
	ld a, $38
	ld [hli], a
	ld a, $50
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1feeb4)
	ld [hli], a
	ld a, LOW(Frameset_1feeb4)
	ld [hli], a
	xor a
	ld [hl], a
	ld [wSFXTimer], a
	ld a, HIGH(OAM_1fee05)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1fee05)
	ld [wActionHelpWarioOAMPtr + 1], a
	ld a, BANK(OAM_1fee05)
	ld [wActionHelpWarioOAMBank], a

	ld hl, wMenuObj4
	ld a, $20
	ld [hli], a
	ld a, $4c
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6fc2)
	ld [hli], a
	ld a, LOW(Frameset_1e6fc2)
	ld [hli], a
	ld a, HIGH(OAM_1e6f86)
	ld [hli], a
	ld a, LOW(OAM_1e6f86)
	ld [hli], a
	ld a, BANK(OAM_1e6f86)
	ld [hli], a
	xor a
	ld [hl], a

	call LoadActionHelpPalsWithoutWater

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e43a0: ; 1e43a0 (79:43a0)
	play_sfx_rept 30, SFX_08C

	ld hl, wActionHelpWarioObjXCoord
	dec [hl]
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [hl]
	cp $1c
	ret nc

	call ActionHelp_ShowRailRotateRight

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e43cb: ; 1e43cb (79:43cb)
	play_sfx_rept 30, SFX_08C

	ld hl, wActionHelpWarioObjXCoord
	inc [hl]
	ld hl, wMenuObj4XCoord
	inc [hl]
	ld a, [hl]
	cp $4c
	ret c

	stop_sfx
	call ActionHelp2_ShowWarioJump
	ld a, $18
	ld [wActionHelpWarioJumpVelIndex], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e4403: ; 1e4403 (79:4403)
	ld hl, wMenuObj4XCoord
	inc [hl]
	ld hl, wActionHelpWarioJumpVelIndex
	ld a, [hl]
	inc [hl]
	ld a, [hl]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wActionHelpWarioObjYCoord]
	add [hl]
	ld [wActionHelpWarioObjYCoord], a
	cp $40
	ret c

	ld a, $40
	ld [wActionHelpWarioObjYCoord], a
	xor a
	ld [wActionHelpWarioJumpVelIndex], a
	call ActionHelp2_ClearButtonsInput
	call ActionHelp2_ShowWarioIdle

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e4432: ; 1e4432 (79:4432)
	ld hl, wMenuObj4XCoord
	inc [hl]
	ld a, [hl]
	cp $7c
	ret c

	call ActionHelp_ShowRailRotateLeft

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e4442: ; 1e4442 (79:4442)
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [hl]
	cp $4c
	ret nc

	call ActionHelp2_ShowAInput
	call ActionHelp2_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e4455: ; 1e4455 (79:4455)
	ld hl, wActionHelpWarioJumpVelIndex
	ld a, [hl]
	inc [hl]
	ld a, [hl]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wActionHelpWarioObjYCoord]
	add [hl]
	ld [wActionHelpWarioObjYCoord], a
	cp $38
	ret nc

	ld a, $38
	ld [wActionHelpWarioObjYCoord], a
	xor a
	ld [wActionHelpWarioJumpVelIndex], a
	ld [wSFXTimer], a
	call ActionHelp2_ClearButtonsInput
	call ActionHelp_ShowWarioHangStopped

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e4483: ; 1e4483 (79:4483)
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	ret z

	call ActionHelp_ShowWarioHangRailRight

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e4490: ; 1e4490 (79:4490)
	play_sfx_rept 30, SFX_08C

	ld hl, wActionHelpWarioObjXCoord
	dec [hl]
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [hl]
	cp $1c
	ret nc

	call ActionHelp_ShowRailRotateRight

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e44bb: ; 1e44bb (79:44bb)
	play_sfx_rept 30, SFX_08C

	ld hl, wActionHelpWarioObjXCoord
	inc [hl]
	ld hl, wMenuObj4XCoord
	inc [hl]
	ld a, [hl]
	cp $4c
	ret c

	stop_sfx
	call ActionHelp2_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e44ee: ; 1e44ee (79:44ee)
	ld hl, wMenuObj4XCoord
	inc [hl]
	ld hl, wActionHelpWarioJumpVelIndex
	ld a, [hl]
	cp $27
	jr z, .asm_1e44fc
	inc [hl]
	ld a, [hl]
.asm_1e44fc
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wActionHelpWarioObjYCoord]
	add [hl]
	ld [wActionHelpWarioObjYCoord], a
	ld a, [wActionHelpWarioJumpVelIndex]
	cp $18
	ret c
	ld a, [wActionHelpWarioObjYCoord]
	cp $40
	ret c

	ld a, $40
	ld [wActionHelpWarioObjYCoord], a
	xor a
	ld [wActionHelpWarioJumpVelIndex], a
	call ActionHelp2_ClearButtonsInput
	call ActionHelp2_ShowWarioIdle

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e452a: ; 1e452a (79:452a)
	ld hl, wMenuObj4XCoord
	inc [hl]
	ld a, [hl]
	cp $7c
	ret c

	call ActionHelp_ShowRailRotateLeft

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e453a: ; 1e453a (79:453a)
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [hl]
	cp $4c
	ret nc

	call ActionHelp2_ShowAInput
	call ActionHelp2_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e454d: ; 1e454d (79:454d)
	ld hl, wActionHelpWarioJumpVelIndex
	ld a, [hl]
	inc [hl]
	ld a, [hl]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wActionHelpWarioObjYCoord]
	add [hl]
	ld [wActionHelpWarioObjYCoord], a
	cp $38
	ret nc

	ld a, $38
	ld [wActionHelpWarioObjYCoord], a
	xor a
	ld [wActionHelpWarioJumpVelIndex], a
	call ActionHelp2_ClearButtonsInput
	call ActionHelp_ShowWarioHangStopped

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e4578: ; 1e4578 (79:4578)
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	ret z
	jp Func_1e430d
; 0x1e4580
