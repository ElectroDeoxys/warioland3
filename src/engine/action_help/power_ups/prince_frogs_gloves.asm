PrinceFrogsGlovesActionHelp: ; 1face4 (7e:6ce4)
	call .StateTable
	ld a, [wActionHelpBlackedOut]
	and a
	jr nz, .done
	ld a, [wActionHelpFrozen]
	and a
	jr nz, .action_help_frozen
	ld hl, wActionHelpWarioObjFramesetPtr + 1
	farcall $05, UpdateObjAnim
.action_help_frozen
	ld hl, wActionHelpWarioObj
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
; 0x1fad42

Func_1fad42: ; 1fad42 (7e:6d42)
	ld a, [wPowerUpLevel]
	bit ACTION_HELP_UNK_F, a
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
; 0x1fad75

Func_1fad75: ; 1fad75 (7e:6d75)
	ld hl, wTimer
	dec [hl]
	ret nz
Func_1fad7a: ; 1fad7a (7e:6d7a)
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

	ld hl, wActionHelpWarioObj
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

Func_1fadea: ; 1fadea (7e:6dea)
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fadfa: ; 1fadfa (7e:6dfa)
	ld hl, wActionHelpWarioObjXCoord
	inc [hl]
	ld a, [hl]
	cp $2c
	ret c

	call ActionHelp_ShowWarioJump
	ld a, $18
	ld [wActionHelpWarioJumpVelIndex], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fae0f: ; 1fae0f (7e:6e0f)
	ld hl, wActionHelpWarioObjXCoord
	inc [hl]
	ld hl, wActionHelpWarioJumpVelIndex
	inc [hl]
	ld a, [hl]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wActionHelpWarioObjYCoord]
	add [hl]
	ld [wActionHelpWarioObjYCoord], a
	cp $50
	ret c

	xor a
	ld [wActionHelpWarioJumpVelIndex], a
	call ActionHelp_ShowWarioSwim
	call ActionHelp_ClearDPadInput
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fae3d: ; 1fae3d (7e:6e3d)
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowDDownInput
	call ActionHelp_ShowWarioSubmerge

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fae4d: ; 1fae4d (7e:6e4d)
	ld a, [wSFXTimer]
	sub $1
	ld [wSFXTimer], a
	jr nc, .skip_sfx
	ld a, $25
	ld [wSFXTimer], a
	play_sfx SFX_00E
.skip_sfx
	ld a, [wActionHelpCounter]
	and %11
	ret nz
	ld hl, wActionHelpWarioObjYCoord
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

Func_1fae7f: ; 1fae7f (7e:6e7f)
	ld a, [wSFXTimer]
	sub $1
	ld [wSFXTimer], a
	jr nc, .skip_sfx
	ld a, $25
	ld [wSFXTimer], a
	play_sfx SFX_00E
.skip_sfx
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
	ld hl, wActionHelpWarioObjXCoord
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

Func_1faeba: ; 1faeba (7e:6eba)
	ld a, [wSFXTimer]
	sub $1
	ld [wSFXTimer], a
	jr nc, .skip_sfx
	ld a, $25
	ld [wSFXTimer], a
	play_sfx SFX_00E
.skip_sfx
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
	ld hl, wActionHelpWarioObjYCoord
	inc [hl]
	ld a, [hl]
	cp $60
	ret c

	call ActionHelp_ClearDPadInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1faef0: ; 1faef0 (7e:6ef0)
	ld a, [wSFXTimer]
	sub $1
	ld [wSFXTimer], a
	jr nc, .skip_sfx
	ld a, $25
	ld [wSFXTimer], a
	play_sfx SFX_00E
.skip_sfx
	ld hl, wActionHelpWarioObjXCoord
	dec [hl]
	ld a, [hl]
	cp $50
	ret nc

	ld [hl], $50
	call ActionHelp_ShowWarioUnderwaterStopped

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1faf19: ; 1faf19 (7e:6f19)
	ld a, [wSFXTimer]
	sub $1
	ld [wSFXTimer], a
	jr nc, .skip_sfx
	ld a, $0f
	ld [wSFXTimer], a
	play_sfx SFX_00F
.skip_sfx
	ld hl, wActionHelpWarioObjXCoord
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

Func_1faf4e: ; 1faf4e (7e:6f4e)
	ld a, [wSFXTimer]
	sub $1
	ld [wSFXTimer], a
	jr nc, .skip_sfx
	ld a, $25
	ld [wSFXTimer], a
	play_sfx SFX_00E
.skip_sfx
	ld hl, wActionHelpWarioObjXCoord
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

Func_1faf7a: ; 1faf7a (7e:6f7a)
	ld a, [wSFXTimer]
	sub $1
	ld [wSFXTimer], a
	jr nc, .skip_sfx
	ld a, $0f
	ld [wSFXTimer], a
	play_sfx SFX_00F
.skip_sfx
	ld hl, wActionHelpWarioObjXCoord
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

Func_1fafb1: ; 1fafb1 (7e:6fb1)
	ld a, [wSFXTimer]
	sub $1
	ld [wSFXTimer], a
	jr nc, .skip_sfx
	ld a, $0f
	ld [wSFXTimer], a
	play_sfx SFX_00F
.skip_sfx
	ld hl, wTimer
	ld a, [hl]
	and a
	jr z, .asm_1fafd7
	dec [hl]
	ret nz
	call ActionHelp_ShowWarioUnderwaterStopped
	call ActionHelp_ShowBInput
.asm_1fafd7
	ld hl, wActionHelpWarioObjXCoord
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

Func_1faff5: ; 1faff5 (7e:6ff5)
	ld a, [wSFXTimer]
	sub $1
	ld [wSFXTimer], a
	jr nc, .skip_sfx
	ld a, $25
	ld [wSFXTimer], a
	play_sfx SFX_00E
.skip_sfx
	ld hl, wActionHelpWarioObjXCoord
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

Func_1fb023: ; 1fb023 (7e:7023)
	ld a, [wSFXTimer]
	sub $1
	ld [wSFXTimer], a
	jr nc, .skip_sfx
	ld a, $25
	ld [wSFXTimer], a
	play_sfx SFX_00E
.skip_sfx
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
	ld hl, wActionHelpWarioObj
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

Func_1fb061: ; 1fb061 (7e:7061)
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioJumpLeft
	call ActionHelp_ShowDLeftInput
	call ActionHelp_ShowAInput
	xor a
	ld [wActionHelpWarioJumpVelIndex], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb078: ; 1fb078 (7e:7078)
	ld hl, wActionHelpWarioObjXCoord
	ld a, [hl]
	cp $18
	jr z, .asm_1fb081
	dec [hl]
.asm_1fb081
	ld hl, wActionHelpWarioJumpVelIndex
	inc [hl]
	ld a, [hl]
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
	jp Func_1fad42
; 0x1fb0ac