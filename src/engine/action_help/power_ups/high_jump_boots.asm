HighJumpBootsActionHelp: ; 1fa83f (7e:683f)
	call .StateTable
	ld a, [wActionHelpBlackedOut]
	and a
	jp nz, .done
	ld a, [wActionHelpFrozen]
	and a
	jr nz, .action_help_frozen

	ld hl, wMenuObj5FramesetPtr + 1
	ld a, [wMenuObj5FramesetBank]
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall UpdateObjAnim
	ld a, [wObjAnimWasReset]
	ld [wMenuObj5AnimationEnded], a

	ld hl, wMenuObj4FramesetPtr + 1
	ld a, [wMenuObj4FramesetBank]
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall UpdateObjAnim
	ld a, [wObjAnimWasReset]
	ld [wMenuObj4AnimationEnded], a

	ld hl, wActionHelpWarioFramesetPtr + 1
	farcall $05, UpdateObjAnim
	ld a, [wObjAnimWasReset]
	ld [wActionHelpWarioAnimationEnded], a

.action_help_frozen
	ld hl, wMenuObj5
	farcall AddActionHelpSprite_Far
	ld hl, wMenuObj4
	farcall AddActionHelpSprite_Far
	ld hl, wActionHelpWario
	farcall AddActionHelpWarioSprite
.done
	ret

.StateTable:
	ld a, [wActionHelpState]
	jumptable

	dw ActionHelp_Init
	dw Func_1fa945
	dw Func_1fa984
	dw ActionHelp_FlashDUpInput
	dw Func_1fa994
	dw Func_1fa9a9
	dw Func_1fa9d3
	dw Func_1faa07
	dw Func_1faa1c
	dw Func_1faa51
	dw Func_1faa64
	dw Func_1faa99
	dw Func_1faacc
	dw Func_1faafb
	dw Func_1fab19
	dw Func_1fab55
	dw Func_1fab83
	dw Func_1fabb2
	dw Func_1fabf8
	dw Func_1fac08
	dw Func_1fac3c
	dw Func_1fac4c
	dw Func_1fac71
	dw Func_1faca5
	dw Func_1facb8
; 0x1fa912

Func_1fa912: ; 1fa912 (7e:6912)
	ld a, [wPowerUpLevel]
	bit ACTION_HELP_LEVEL_CLEAR_F, a
	jr nz, .asm_1fa920
	bit ACTION_HELP_TITLE_SCREEN_F, a
	jr z, .restart_action_help
	jp InitWithoutDemoPowerUpReset

.asm_1fa920
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
	jr Func_1fa94a
; 0x1fa945

Func_1fa945: ; 1fa945 (7e:6945)
	ld hl, wTimer
	dec [hl]
	ret nz
Func_1fa94a: ; 1fa94a (7e:694a)
	call ActionHelp_ShowInitialWarioWalk
	call ActionHelp_ShowDRightInput
	call ActionHelp_ShowParaGoomWalk

	ld hl, wMenuObj5
	ld a, $40
	ld [hli], a
	ld a, $e8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b99)
	ld [hli], a
	ld a, LOW(Frameset_1e6b99)
	ld [hli], a
	ld a, HIGH(OAM_1e697c)
	ld [hli], a
	ld a, LOW(OAM_1e697c)
	ld [hli], a
	ld a, BANK(OAM_1e697c)
	ld [hli], a

	farcall LoadActionHelpPalsWithoutWater

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa984: ; 1fa984 (7e:6984)
	ld hl, wMenuObj5XCoord
	dec [hl]
	ld a, [hl]
	cp $58
	ret nc

	call ActionHelp_ShowWarioIdle

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa994: ; 1fa994 (7e:6994)
	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp $30
	ret c

	ld [hl], $00
	call ActionHelp_ShowAInput
	call ActionHelp_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa9a9: ; 1fa9a9 (7e:69a9)
	ld hl, wMenuObj5XCoord
	dec [hl]
	ld hl, wActionHelpWarioVar
	inc [hl]
	ld a, [hl]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_HighJump
	add hl, de
	ld a, [wActionHelpWarioYCoord]
	add [hl]
	ld [wActionHelpWarioYCoord], a
	ld a, [wActionHelpWarioVar]
	cp $18
	ret c

	call ActionHelp_ClearButtonsInput
	ld a, $18
	ld [wActionHelpWarioVar], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa9d3: ; 1fa9d3 (7e:69d3)
	ld hl, wMenuObj5XCoord
	dec [hl]
	dec [hl]
	ld hl, wActionHelpWarioVar
	ld a, [hl]
	inc [hl]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_HighJump
	add hl, de
	ld a, [wActionHelpWarioYCoord]
	add [hl]
	ld [wActionHelpWarioYCoord], a
	cp $10
	ret c

	ld a, $10
	ld [wActionHelpWarioYCoord], a
	call ActionHelp_ClearDPadInput
	call ActionHelp_ShowWarioIdle
	xor a
	ld [wActionHelpWarioVar], a
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1faa07: ; 1faa07 (7e:6a07)
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowDRightInput
	call ActionHelp_ShowWarioJump
	ld a, $18
	ld [wActionHelpWarioVar], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1faa1c: ; 1faa1c (7e:6a1c)
	ld hl, wMenuObj5XCoord
	dec [hl]
	ld hl, wActionHelpWarioVar
	inc [hl]
	ld a, [hl]
	cp $28
	jr c, .asm_1faa2c
	ld [hl], $27
	ld a, [hl]
.asm_1faa2c
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_HighJump
	add hl, de
	ld a, [wActionHelpWarioYCoord]
	add [hl]
	ld [wActionHelpWarioYCoord], a
	cp $40
	ret c

	ld a, $40
	ld [wActionHelpWarioYCoord], a
	call ActionHelp_ClearDPadInput
	call ActionHelp_ShowWarioIdle
	xor a
	ld [wActionHelpWarioVar], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1faa51: ; 1faa51 (7e:6a51)
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [hl]
	cp $68
	ret nc

	call ActionHelp_ShowAInput
	call ActionHelp_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1faa64: ; 1faa64 (7e:6a64)
	ld hl, wMenuObj4XCoord
	dec [hl]
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
	cp $34
	ret c

	call ActionHelp_ShowDLeftInput
	call ActionHelp_ShowParaGoomStun
	call ActionHelp_ShowWarioJumpLeft
	xor a
	ld [wActionHelpWarioVar], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1faa99: ; 1faa99 (7e:6a99)
	ld hl, wMenuObj5XCoord
	ld a, [hl]
	cp $3c
	jr nc, .asm_1faaa6
	inc [hl]
	ld hl, wMenuObj4XCoord
	inc [hl]
.asm_1faaa6
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

	call ActionHelp_ClearButtonsInput
	ld a, $18
	ld [wActionHelpWarioVar], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1faacc: ; 1faacc (7e:6acc)
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
	cp $10
	ret c

	ld a, $10
	ld [wActionHelpWarioYCoord], a
	call ActionHelp_ShowDRightInput
	call ActionHelp_ShowWarioIdle
	xor a
	ld [wActionHelpWarioVar], a
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1faafb: ; 1faafb (7e:6afb)
	call ActionHelp_ClearDPadInput
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowAInput
	call ActionHelp_ShowDRightAndDDownInput
	call ActionHelp_ShowWarioJump
	call ActionHelp_ShowWarioSmashAttack
	ld a, $18
	ld [wActionHelpWarioVar], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fab19: ; 1fab19 (7e:6b19)
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld hl, wMenuObj5XCoord
	dec [hl]
	ld hl, wActionHelpWarioVar
	inc [hl]
	ld a, [hl]
	cp $28
	jr c, .asm_1fab2d
	ld [hl], $27
	ld a, [hl]
.asm_1fab2d
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wActionHelpWarioYCoord]
	add [hl]
	ld [wActionHelpWarioYCoord], a
	cp $34
	ret c

	ld a, $30
	ld [wActionHelpWarioYCoord], a
	call ActionHelp_ShowDLeftInput
	call ActionHelp_ShowObj4EnemyVanish
	call ActionHelp_ShowWarioJumpLeft
	xor a
	ld [wActionHelpWarioVar], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fab55: ; 1fab55 (7e:6b55)
	ld hl, wMenuObj4XCoord
	inc [hl]
	ld hl, wMenuObj5XCoord
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
	ld a, [wActionHelpWarioVar]
	cp $18
	ret c

	call ActionHelp_ClearButtonsInput
	ld a, $18
	ld [wActionHelpWarioVar], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fab83: ; 1fab83 (7e:6b83)
	ld hl, wMenuObj4XCoord
	inc [hl]
	inc [hl]
	ld hl, wMenuObj5XCoord
	inc [hl]
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
	cp $10
	ret c

	ld a, $10
	ld [wActionHelpWarioYCoord], a
	ld a, $0e
	ld [wActionHelpWarioVar], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fabb2: ; 1fabb2 (7e:6bb2)
	ld a, [wMenuObj4AnimationEnded]
	and a
	jr z, .asm_1fabbe
	ld hl, wMenuObj4
	call ActionHelp_HideBlockDebris
.asm_1fabbe
	ld hl, wMenuObj5XCoord
	inc [hl]
	ld hl, wActionHelpWarioVar
	inc [hl]
	ld a, [hl]
	cp $28
	jr c, .asm_1fabce
	ld [hl], $27
	ld a, [hl]
.asm_1fabce
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
	call ActionHelp_ClearDPadInput
	call ActionHelp_ShowWarioIdle
	xor a
	ld [wActionHelpWarioVar], a
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fabf8: ; 1fabf8 (7e:6bf8)
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowAInput
	call ActionHelp_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fac08: ; 1fac08 (7e:6c08)
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
	jr z, .asm_1fac38
	ret c
	ld a, [wActionHelpWarioYCoord]
	cp $40
	ret c
	call ActionHelp_ShowAInput
	xor a
	ld [wActionHelpWarioVar], a
	call ActionHelp_ShowWarioLand

	ld hl, wActionHelpState
	inc [hl]
	ret

.asm_1fac38
	call ActionHelp_ClearButtonsInput
	ret

Func_1fac3c: ; 1fac3c (7e:6c3c)
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	ret z

	call ActionHelp_ShowDRightInput
	call ActionHelp_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fac4c: ; 1fac4c (7e:6c4c)
	ld hl, wMenuObj5XCoord
	dec [hl]
	ld hl, wActionHelpWarioVar
	inc [hl]
	ld a, [hl]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_HighJump
	add hl, de
	ld a, [wActionHelpWarioYCoord]
	add [hl]
	ld [wActionHelpWarioYCoord], a
	ld a, [wActionHelpWarioVar]
	cp $18
	ret c

	call ActionHelp_ClearButtonsInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fac71: ; 1fac71 (7e:6c71)
	ld hl, wMenuObj5XCoord
	dec [hl]
	dec [hl]
	ld hl, wActionHelpWarioVar
	ld a, [hl]
	inc [hl]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_HighJump
	add hl, de
	ld a, [wActionHelpWarioYCoord]
	add [hl]
	ld [wActionHelpWarioYCoord], a
	cp $10
	ret c

	ld a, $10
	ld [wActionHelpWarioYCoord], a
	call ActionHelp_ClearDPadInput
	call ActionHelp_ShowWarioIdle
	xor a
	ld [wActionHelpWarioVar], a
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1faca5: ; 1faca5 (7e:6ca5)
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowAInput
	call ActionHelp_ShowDRightInput
	call ActionHelp_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1facb8: ; 1facb8 (7e:6cb8)
	ld hl, wMenuObj5XCoord
	dec [hl]
	dec [hl]
	ld hl, wActionHelpWarioVar
	inc [hl]
	ld a, [hl]
	cp $28
	jr c, .asm_1facc9
	ld [hl], $27
	ld a, [hl]
.asm_1facc9
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wActionHelpWarioYCoord]
	add [hl]
	ld [wActionHelpWarioYCoord], a
	add $20
	cp $60
	ret c
	ld a, $40
	ld [wActionHelpWarioYCoord], a
	jp Func_1fa912
; 0x1face4
