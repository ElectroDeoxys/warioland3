VampireActionHelp: ; 1e4580 (79:4580)
	call .StateTable

	ld a, [wActionHelpBlackedOut]
	and a
	jr nz, .done
	ld a, [wActionHelpFrozen]
	and a
	jr nz, .action_help_frozen

	ld hl, wActionHelpWarioObjFramesetPtr + 1
	farcall $7f, UpdateObjAnim
	ld a, [wObjAnimWasReset]
	ld [wActionHelpWarioAnimationEnded], a

.action_help_frozen
	ld hl, wActionHelpWarioObj
	call AddActionHelpWarioSprite_FromBank
	ld hl, wMenuObj4 ; unnecessary
.done
	ret

.StateTable:
	ld a, [wActionHelpState]
	jumptable

	dw ActionHelp2_Init
	dw Func_1e45ee
	dw Func_1e464b
	dw ActionHelp2_FlashBInput
	dw Func_1e465e
	dw Func_1e4684
	dw ActionHelp2_FlashAInput
	dw Func_1e46ab
	dw Func_1e46e8
	dw Func_1e471c
	dw Func_1e4759
	dw Func_1e478d
	dw Func_1e47ca
	dw Func_1e47fe
	dw Func_1e483d
	dw Func_1e4871
	dw Func_1e4898
; 0x1e45d7


Func_1e45d7: ; 1e45d7 (79:45d7)
	ld a, [wPowerUpLevel]
	bit ACTION_HELP_TITLE_SCREEN_F, a
	jr z, .restart_action_help
	jp InitWithoutDemoPowerUpReset

.restart_action_help
	call ActionHelp2_ClearDPadInput
	call ActionHelp2_ClearButtonsInput
	ld a, $1
	ld [wActionHelpState], a
	jr Func_1e45f3

Func_1e45ee: ; 1e45ee (79:45ee)
	ld hl, wTimer
	dec [hl]
	ret nz
Func_1e45f3: ; 1e45f3 (79:45f3)
	call ActionHelp2_ShowDRightInput

	ld a, BANK(WarioVampireGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioVampireGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioVampireGfx)
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
	ld a, $40
	ld [hli], a
	ld a, $30
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1fd82e)
	ld [hli], a
	ld a, LOW(Frameset_1fd82e)
	ld [hli], a
	xor a
	ld [hl], a
	ld a, HIGH(OAM_1fd498)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1fd498)
	ld [wActionHelpWarioOAMPtr + 1], a
	ld a, BANK(OAM_1fd498)
	ld [wActionHelpWarioOAMBank], a

	call LoadActionHelpPalsWithoutWater

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e464b: ; 1e464b (79:464b)
	ld hl, wActionHelpWarioObjXCoord
	inc [hl]
	ld a, [hl]
	cp $80
	ret c

	call ActionHelp2_ClearDPadInput
	call ActionHelp_ShowWarioBatTransform

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e465e: ; 1e465e (79:465e)
	ld a, [wTimer]
	and a
	jr z, .asm_1e4676
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	ret z

	call ActionHelp_ShowWarioBatRight
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

.asm_1e4676
	play_sfx SFX_046
	ld a, $01
	ld [wTimer], a
	ret

Func_1e4684: ; 1e4684 (79:4684)
	ld a, [wSFXTimer]
	sub $1
	ld [wSFXTimer], a
	jr nc, .skip_sfx
	ld a, $20
	ld [wSFXTimer], a
	play_sfx SFX_071
.skip_sfx
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp2_ShowDLeftInput
	call ActionHelp_ShowWarioBatLeft

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e46ab: ; 1e46ab (79:46ab)
	ld a, [wSFXTimer]
	sub $1
	ld [wSFXTimer], a
	jr nc, .skip_sfx
	ld a, $10
	ld [wSFXTimer], a
	play_sfx SFX_071
.skip_sfx
	ld a, [wActionHelpCounter]
	and %1
	jr z, .asm_1e46cd
	ld hl, wActionHelpWarioObjXCoord
	dec [hl]
.asm_1e46cd
	ld hl, wActionHelpWarioObj
	ld a, [hl]
	cp $30
	jr c, .asm_1e46d6
	dec [hl]
.asm_1e46d6
	dec [hl]
	ld a, [hl]
	cp $20
	ret nc

	call ActionHelp2_ClearButtonsInput
	ld a, $18
	ld [wActionHelpWarioJumpVelIndex], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e46e8: ; 1e46e8 (79:46e8)
	ld a, [wActionHelpCounter]
	and %1
	jr z, .asm_1e46f3
	ld hl, wActionHelpWarioObjXCoord
	dec [hl]
.asm_1e46f3
	ld hl, wActionHelpWarioJumpVelIndex
	ld a, [hl]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wActionHelpWarioObjYCoord]
	add [hl]
	ld [wActionHelpWarioObjYCoord], a
	ld hl, wActionHelpWarioJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp $27
	ret c

	xor a
	ld [wActionHelpWarioJumpVelIndex], a
	ld [wSFXTimer], a
	call ActionHelp2_ShowAInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e471c: ; 1e471c (79:471c)
	ld a, [wSFXTimer]
	sub $1
	ld [wSFXTimer], a
	jr nc, .skip_sfx
	ld a, $10
	ld [wSFXTimer], a
	play_sfx SFX_071
.skip_sfx
	ld a, [wActionHelpCounter]
	and %1
	jr z, .asm_1e473e
	ld hl, wActionHelpWarioObjXCoord
	dec [hl]
.asm_1e473e
	ld hl, wActionHelpWarioObj
	ld a, [hl]
	cp $2c
	jr c, .asm_1e4747
	dec [hl]
.asm_1e4747
	dec [hl]
	ld a, [hl]
	cp $1c
	ret nc

	call ActionHelp2_ClearButtonsInput
	ld a, $18
	ld [wActionHelpWarioJumpVelIndex], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e4759: ; 1e4759 (79:4759)
	ld a, [wActionHelpCounter]
	and %1
	jr z, .asm_1e4764
	ld hl, wActionHelpWarioObjXCoord
	dec [hl]
.asm_1e4764
	ld hl, wActionHelpWarioJumpVelIndex
	ld a, [hl]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wActionHelpWarioObjYCoord]
	add [hl]
	ld [wActionHelpWarioObjYCoord], a
	ld hl, wActionHelpWarioJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp $27
	ret c

	xor a
	ld [wActionHelpWarioJumpVelIndex], a
	ld [wSFXTimer], a
	call ActionHelp2_ShowAInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e478d: ; 1e478d (79:478d)
	ld a, [wSFXTimer]
	sub $1
	ld [wSFXTimer], a
	jr nc, .skip_sfx
	ld a, $10
	ld [wSFXTimer], a
	play_sfx SFX_071
.skip_sfx
	ld a, [wActionHelpCounter]
	and %1
	jr z, .asm_1e47af
	ld hl, wActionHelpWarioObjXCoord
	dec [hl]
.asm_1e47af
	ld hl, wActionHelpWarioObj
	ld a, [hl]
	cp $28
	jr c, .asm_1e47b8
	dec [hl]
.asm_1e47b8
	dec [hl]
	ld a, [hl]
	cp $18
	ret nc

	call ActionHelp2_ClearButtonsInput
	ld a, $18
	ld [wActionHelpWarioJumpVelIndex], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e47ca: ; 1e47ca (79:47ca)
	ld a, [wActionHelpCounter]
	and %1
	jr z, .asm_1e47d5
	ld hl, wActionHelpWarioObjXCoord
	dec [hl]
.asm_1e47d5
	ld hl, wActionHelpWarioJumpVelIndex
	ld a, [hl]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wActionHelpWarioObjYCoord]
	add [hl]
	ld [wActionHelpWarioObjYCoord], a
	ld hl, wActionHelpWarioJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp $27
	ret c

	xor a
	ld [wActionHelpWarioJumpVelIndex], a
	ld [wSFXTimer], a
	call ActionHelp2_ShowAInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e47fe: ; 1e47fe (79:47fe)
	ld a, [wSFXTimer]
	sub $1
	ld [wSFXTimer], a
	jr nc, .skip_sfx
	ld a, $10
	ld [wSFXTimer], a
	play_sfx SFX_071
.skip_sfx
	ld hl, wActionHelpWarioObj
	ld a, [hl]
	cp $20
	jr c, .asm_1e481e
	dec [hl]
.asm_1e481e
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	ret z
	ld hl, wActionHelpWarioObjXCoord
	dec [hl]
	ld a, [hl]
	cp $30
	ret nz

	call ActionHelp2_ClearButtonsInput
	call ActionHelp2_ClearDPadInput
	ld a, $18
	ld [wActionHelpWarioJumpVelIndex], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e483d: ; 1e483d (79:483d)
	ld hl, wActionHelpWarioJumpVelIndex
	ld a, [hl]
	cp $27
	jr z, .asm_1e4847
	inc [hl]
	ld a, [hl]
.asm_1e4847
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wActionHelpWarioObjYCoord]
	add [hl]
	ld [wActionHelpWarioObjYCoord], a
	ld a, [wActionHelpWarioObjYCoord]
	cp $40
	ret c

	ld a, $40
	ld [wActionHelpWarioObjYCoord], a
	xor a
	ld [wActionHelpWarioJumpVelIndex], a
	call ActionHelp_ShowWarioBatRight
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e4871: ; 1e4871 (79:4871)
	ld a, [wSFXTimer]
	sub $1
	ld [wSFXTimer], a
	jr nc, .skip_sfx
	ld a, $20
	ld [wSFXTimer], a
	play_sfx SFX_071
.skip_sfx
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp2_ShowBInput
	call ActionHelp_ShowWarioVampireTransform

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1e4898: ; 1e4898 (79:4898)
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	ret z
	jp Func_1e45d7
; 0x1e48a0
