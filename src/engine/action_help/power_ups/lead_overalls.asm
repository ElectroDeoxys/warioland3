LeadOverallsActionHelp:
	call .StateTable

	ld a, [wActionHelpBlackedOut]
	and a
	jp nz, .done
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
	farcall $5, UpdateObjAnim

.action_help_frozen
	ld hl, wMenuObj4
	farcall LoadActionHelpSprite_Far

	ld hl, wActionHelpWario
	farcall LoadActionHelpWarioSprite

	ld hl, wMenuObj5FramesetPtr + 1
	ld a, [wMenuObj5FramesetBank]
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall UpdateObjAnim
	ld a, [wObjAnimWasReset]
	ld [wMenuObj5AnimationEnded], a
	ld hl, wMenuObj5
	farcall LoadActionHelpSprite_Far

.done
	ret

.StateTable:
	ld a, [wActionHelpState]
	jumptable

	dw ActionHelp_Init
	dw Func_1f89bb
	dw Func_1f89e0
	dw Func_1f89fb
	dw ActionHelp_FlashDDownInput
	dw Func_1f8a2a
	dw Func_1f8a52
	dw Func_1f8a79
	dw Func_1f8a91
	dw Func_1f8aa1
	dw Func_1f8abc
	dw Func_1f8b04
	dw Func_1f8b14
	dw Func_1f8b3d
	dw Func_1f8b71
	dw Func_1f8b86
	dw Func_1f8bb2
	dw Func_1f8bc7
	dw Func_1f8bda
	dw Func_1f8c59
	dw Func_1f8c81
	dw Func_1f8c94
	dw Func_1f8cbb
	dw Func_1f8cf7
	dw Func_1f8d04
	dw Func_1f8d34
	dw Func_1f8d49
	dw Func_1f8d72
	dw Func_1f8d88
	dw Func_1f8da4
	dw Func_1f8db7

Func_1f8988:
	ld a, [wPowerUpLevel]
	bit ACTION_HELP_LEVEL_CLEAR_F, a
	jr nz, .asm_1f8996
	bit ACTION_HELP_TITLE_SCREEN_F, a
	jr z, .restart_action_help
	jp InitWithoutDemoPowerUpReset

.asm_1f8996
	and POWER_UP_MASK
	ld [wPowerUpLevel], a
	farcall Func_4628
	call ResumeNormalVolume
	ret

.restart_action_help
	call ActionHelp_ClearDPadInput
	call ActionHelp_ClearButtonsInput
	ld a, $1
	ld [wActionHelpState], a
	jr Func_1f89c0

Func_1f89bb:
	ld hl, wTimer
	dec [hl]
	ret nz
Func_1f89c0:
	call ActionHelp_ShowInitialWarioWalk
	call ActionHelp_ShowDRightInput
	call ActionHelp_ShowParaGoomWalk
	call ActionHelp_HideObj5BlockDebris
	farcall LoadActionHelpPalsWithoutWater

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f89e0:
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .skip_dec
	dec [hl]
.skip_dec
	ld a, [hl]
	cp $60
	ret nc

	call ActionHelp_ShowAInput
	call ActionHelp_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f89fb:
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

	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .skip_dec
	dec [hl]
.skip_dec
	ld a, [wActionHelpWarioXCoord]
	cp [hl]
	ret c

	call ActionHelp_ShowWarioSmashAttack
	call ActionHelp_ClearButtonsInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8a2a:
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
	cp $34
	ret c
	ld a, $34
	ld [wActionHelpWarioYCoord], a
	ld a, $0a
	ld [wActionHelpWarioVar], a

	call ActionHelp_ShowObj4EnemyVanish

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8a52:
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
	cp $40
	ret c
	ld a, $40
	ld [wActionHelpWarioYCoord], a
	xor a
	ld [wActionHelpWarioVar], a

	call ActionHelp_ShowWarioGroundPound

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8a79:
	ld a, [wMenuObj4AnimationEnded]
	and a
	ret z

	call ActionHelp_ShowVerticalBlockPair
	call ActionHelp_ShowWarioIdle
	call ActionHelp_ClearDPadInput
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8a91:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8aa1:
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .skip_dec
	dec [hl]
.skip_dec
	ld a, [hl]
	cp $60
	ret nc

	call ActionHelp_ShowAInput
	call ActionHelp_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8abc:
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
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .asm_1f8adb
	dec [hl]
.asm_1f8adb
	ld a, [wActionHelpWarioXCoord]
	cp [hl]
	ret c
	ld a, [hl]
	ld [wActionHelpWarioXCoord], a
	call ActionHelp_ClearDPadInput
	ld hl, wActionHelpWarioYCoord
	ld a, [hl]
	cp $20
	ret c

	ld [hl], $20
	xor a
	ld [wActionHelpWarioVar], a
	call ActionHelp_ShowWarioIdle
	call ActionHelp_ClearButtonsInput
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8b04:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowAInput
	call ActionHelp_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8b14:
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
	cp $0c
	ret nc

	ld a, $18
	ld [wActionHelpWarioVar], a
	call ActionHelp_ShowWarioSmashAttack
	call ActionHelp_ShowDDownInput
	call ActionHelp_ClearButtonsInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8b3d:
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
	cp $20
	ret c
	ld a, $20
	ld [wActionHelpWarioYCoord], a

	xor a
	ld [wActionHelpWarioVar], a
	call ActionHelp_ShowWarioGroundPound
	call ActionHelp_ShowSingleSolidBlock
	ld b, $10
	call ActionHelp_ShowBlockDebrisWithYOffset
	ld a, $10
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8b71:
	ld hl, wTimer
	dec [hl]
	ret nz

	ld a, $18
	ld [wActionHelpWarioVar], a
	call ActionHelp_ShowWarioSmashAttack
	call ActionHelp_HideObj5BlockDebris

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8b86:
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
	cp $30
	ret c
	ld a, $30
	ld [wActionHelpWarioYCoord], a

	xor a
	ld [wActionHelpWarioVar], a
	call ActionHelp_ShowWarioGroundPound
	ld a, $10
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8bb2:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioIdle
	call ActionHelp_ClearDPadInput
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8bc7:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowDRightInput
	call ActionHelp_ShowAInput
	call ActionHelp_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8bda:
	ld hl, wActionHelpWarioVar
	ld a, [hl]
	cp $27
	jr z, .skip_inc
	inc [hl]
.skip_inc
	ld a, [hl]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wActionHelpWarioYCoord]
	add [hl]
	ld [wActionHelpWarioYCoord], a

	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .skip_dec
	dec [hl]
.skip_dec
	ld a, [wActionHelpWarioYCoord]
	cp $40
	ret c
	ld a, $40
	ld [wActionHelpWarioYCoord], a

	xor a
	ld [wActionHelpWarioVar], a
	call ActionHelp_ClearButtonsInput
	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	; Futamogu sprite
	ld hl, wMenuObj4
	ld a, $50
	ld [hli], a
	ld a, $c0
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6f66)
	ld [hli], a
	ld a, LOW(Frameset_1e6f66)
	ld [hli], a
	ld a, HIGH(OAM_1e6bab)
	ld [hli], a
	ld a, LOW(OAM_1e6bab)
	ld [hli], a
	ld a, BANK(OAM_1e6bab)
	ld [hli], a
	xor a
	ld [hl], a

	ld hl, wMenuObj5
	ld a, $40
	ld [hli], a
	ld a, $b8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b8b)
	ld [hli], a
	ld a, LOW(Frameset_1e6b8b)
	ld [hli], a
	ld a, HIGH(OAM_1e697c)
	ld [hli], a
	ld a, LOW(OAM_1e697c)
	ld [hli], a
	ld a, BANK(OAM_1e697c)
	ld [hli], a
	xor a
	ld [hl], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8c59:
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .skip_dec
	dec [hl]
.skip_dec
	ld a, [hl]
	add -$8
	ld [wMenuObj5XCoord], a
	cp $40
	ret nc

	call ActionHelp_ShowWarioIdle
	call ActionHelp_ShowFutamoguAngry
	call ActionHelp_ClearDPadInput
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8c81:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowAInput
	call ActionHelp_ShowWarioJump
	call ActionHelp_ShowFutamoguHappy

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8c94:
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

	call ActionHelp_ShowWarioSmashAttack
	call ActionHelp_ShowDDownInput
	call ActionHelp_ClearButtonsInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8cbb:
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
	cp $40
	ret c
	ld a, $40
	ld [wActionHelpWarioYCoord], a

	call ActionHelp_ShowWarioGroundPound

	; show Futamogu dropping
	ld a, [wMenuObj4YCoord]
	add $04
	ld [wMenuObj4YCoord], a
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6f7d)
	ld [hli], a
	ld a, LOW(Frameset_1e6f7d)
	ld [hli], a
	ld a, $10
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8cf7:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioSmashAttack

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8d04:
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
	cp $44
	ret c
	ld a, $44
	ld [wActionHelpWarioYCoord], a

	call ActionHelp_ShowWarioGroundPound

	ld a, [wMenuObj4YCoord]
	add $4
	ld [wMenuObj4YCoord], a
	ld a, $10
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8d34:
	ld hl, wTimer
	dec [hl]
	ret nz

	ld a, $18
	ld [wActionHelpWarioVar], a
	call ActionHelp_ShowWarioIdle
	call ActionHelp_ClearDPadInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8d49:
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
	cp $48
	ret c
	ld a, $48
	ld [wActionHelpWarioYCoord], a
	xor a
	ld [wActionHelpWarioVar], a
	ld a, $20
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8d72:
	ld hl, wTimer
	dec [hl]
	ret nz

	; show Futamogu climbing
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6f6b)
	ld [hli], a
	ld a, LOW(Frameset_1e6f6b)

	ld [hli], a
	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8d88:
	ld hl, wMenuObj4YCoord
	dec [hl]
	ld hl, wActionHelpWarioYCoord
	dec [hl]
	ld a, [hl]
	cp $40
	ret nz

	call ActionHelp_ShowWarioIdle
	call ActionHelp_ShowFutamoguAngry
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8da4:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowDRightInput
	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowFutamoguHappy

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f8db7:
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .skip_dec
	dec [hl]
.skip_dec
	ld a, [hl]
	add -$8
	ld [wMenuObj5XCoord], a
	cp $f0
	ret c
	jp Func_1f8988
