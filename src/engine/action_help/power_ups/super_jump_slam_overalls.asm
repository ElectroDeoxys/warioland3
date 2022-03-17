SuperJumpSlamOverallsActionHelp: ; 1fa3ef (7e:63ef)
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
	ld [wMenuObj5AnimationHasFinished], a

	ld hl, wMenuObj4FramesetPtr + 1
	ld a, [wMenuObj4FramesetBank]
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall UpdateObjAnim
	ld a, [wObjAnimWasReset]
	ld [wMenuObj4AnimationHasFinished], a

	ld hl, wActionHelpWarioObjFramesetPtr + 1
	farcall $05, UpdateObjAnim

.action_help_frozen
	ld hl, wMenuObj5
	farcall AddActionHelpSprite_Far
	ld hl, wMenuObj4
	farcall AddActionHelpSprite_Far
	ld hl, wActionHelpWarioObj
	farcall AddActionHelpWarioSprite
.done
	ret

.StateTable
	ld a, [wActionHelpState]
	jumptable

	dw ActionHelp_Init
	dw Func_1fa4e5
	dw Func_1fa526
	dw Func_1fa54c
	dw ActionHelp_FlashDDownInput
	dw Func_1fa574
	dw Func_1fa5a8
	dw Func_1fa602
	dw Func_1fa653
	dw Func_1fa698
	dw Func_1fa6bf
	dw Func_1fa6d2
	dw Func_1fa6ed
	dw Func_1fa735
	dw Func_1fa745
	dw Func_1fa76e
	dw Func_1fa796
	dw Func_1fa7d0
	dw Func_1fa80b
	dw Func_1fa837
; 0x1fa4b2

Func_1fa4b2: ; 1fa4b2 (7e:64b2)
	ld a, [wPowerUpLevel]
	bit ACTION_HELP_UNK_F, a
	jr nz, .asm_1fa4c0
	bit ACTION_HELP_TITLE_SCREEN_F, a
	jr z, .restart_action_help
	jp InitWithoutDemoPowerUpReset
.asm_1fa4c0
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
	jr Func_1fa4ea
; 0x1f94e5

Func_1fa4e5: ; 1fa4e5 (7e:64e5)
	ld hl, wTimer
	dec [hl]
	ret nz
Func_1fa4ea: ; 1fa4ea (7e:64ea)
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
	xor a
	ld [hl], a

	farcall LoadActionHelpPalsWithoutWater

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa526: ; 1fa526 (7e:6526)
	ld hl, wMenuObj5XCoord
	dec [hl]
	ld a, [hl]
	cp $90
	ret nc
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and $01
	jr z, .asm_1fa53a
	dec [hl]
.asm_1fa53a
	ld a, [hl]
	cp $a0
	ret nc

	call ActionHelp_ShowAInput
	call ActionHelp_ClearDPadInput
	call ActionHelp_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa54c: ; 1fa54c (7e:654c)
	ld hl, wMenuObj4XCoord
	dec [hl]
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

	call ActionHelp_ShowWarioSmashAttack
	call ActionHelp_ClearButtonsInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa574: ; 1fa574 (7e:6574)
	ld hl, wMenuObj4XCoord
	dec [hl]
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
	cp $40
	ret c
	ld a, $40
	ld [wActionHelpWarioObjYCoord], a
	call ActionHelp_ShowWarioGroundShake
	call ActionHelp_ShowParaGoomStun
	ld a, $0a
	ld [wActionHelpWarioJumpVelIndex], a
	ld a, $20
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa5a8: ; 1fa5a8 (7e:65a8)
	ld hl, wActionHelpWarioJumpVelIndex
	inc [hl]
	ld a, [hl]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wMenuObj4YCoord]
	add [hl]
	ld [wMenuObj4YCoord], a
	cp $40
	jr nc, .asm_1fa5c1
	jr .asm_1fa5cb
.asm_1fa5c1
	ld a, $26
	ld [wActionHelpWarioJumpVelIndex], a
	ld a, $40
	ld [wMenuObj4YCoord], a
.asm_1fa5cb
	ld hl, wTimer
	dec [hl]
	jr z, .asm_1fa5f3
	ld a, [hl]
	cp $05
	jr nz, .asm_1fa5dc
	call ActionHelp_ShowWarioIdle
	call ActionHelp_ClearDPadInput
.asm_1fa5dc
	ld hl, wSCY
	ld a, [wTimer]
	and $03
	cp $03
	jr z, .asm_1fa5ed
	cp $01
	jr z, .asm_1fa5f0
	ret

.asm_1fa5ed
	inc [hl]
	inc [hl]
	ret

.asm_1fa5f0
	dec [hl]
	dec [hl]
	ret

.asm_1fa5f3
	call ActionHelp_ShowWarioJump
	call ActionHelp_ShowAInput
	xor a
	ld [wActionHelpWarioJumpVelIndex], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa602: ; 1fa602 (7e:6602)
	ld a, [wMenuObj5XCoord]
	cp $40
	jr z, .asm_1fa624
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld hl, wMenuObj5XCoord
	dec [hl]
	ld a, [hl]
	cp $40
	jr nz, .asm_1fa624
	call ActionHelp_ClearButtonsInput
	call ActionHelp_ShowDDownInput
	call ActionHelp_ShowWarioSmashAttack
	ld a, $18
	ld [wActionHelpWarioJumpVelIndex], a
.asm_1fa624
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
	cp $30
	ret c

	ld a, $0a
	ld [wActionHelpWarioJumpVelIndex], a
	ld hl, wMenuObj5FramesetOffset
	call ActionHelp_ShowEnemyVanish

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa653: ; 1fa653 (7e:6653)
	ld hl, wMenuObj4XCoord
	ld a, [hl]
	cp $40
	jr z, .asm_1fa666
	dec [hl]
	ld a, [hl]
	cp $40
	jr nz, .asm_1fa666
	ld a, $18
	ld [wActionHelpWarioJumpVelIndex], a
.asm_1fa666
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
	cp $34
	ret c

	ld a, $0a
	ld [wActionHelpWarioJumpVelIndex], a
	call ActionHelp_ClearDPadInput
	call ActionHelp_HideObj5BlockDebris
	call ActionHelp_ShowObj4EnemyVanish

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa698: ; 1fa698 (7e:6698)
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
	cp $40
	ret c

	ld a, $40
	ld [wActionHelpWarioObjYCoord], a
	xor a
	ld [wActionHelpWarioJumpVelIndex], a
	call ActionHelp_ShowWarioIdle

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa6bf: ; 1fa6bf (7e:66bf)
	ld a, [wMenuObj4AnimationHasFinished]
	and a
	ret z

	call ActionHelp_ShowVerticalBlockPair
	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa6d2: ; 1fa6d2 (7e:66d2)
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and $01
	jr z, .asm_1fa6de
	dec [hl]
.asm_1fa6de
	ld a, [hl]
	cp $60
	ret nc

	call ActionHelp_ShowAInput
	call ActionHelp_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa6ed: ; 1fa6ed (7e:66ed)
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
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and $01
	jr z, .asm_1fa70c
	dec [hl]
.asm_1fa70c
	ld a, [wActionHelpWarioObjXCoord]
	cp [hl]
	ret c
	ld a, [hl]
	ld [wActionHelpWarioObjXCoord], a
	call ActionHelp_ClearDPadInput
	ld hl, wActionHelpWarioObj
	ld a, [hl]
	cp $20
	ret c

	ld [hl], $20
	xor a
	ld [wActionHelpWarioJumpVelIndex], a
	call ActionHelp_ShowWarioIdle
	call ActionHelp_ClearButtonsInput
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa735: ; 1fa735 (7e:6735)
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowAInput
	call ActionHelp_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa745: ; 1fa745 (7e:6745)
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
	cp $0c
	ret nc

	ld a, $18
	ld [wActionHelpWarioJumpVelIndex], a
	call ActionHelp_ShowWarioSmashAttack
	call ActionHelp_ShowDDownInput
	call ActionHelp_ClearButtonsInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa76e: ; 1fa76e (7e:676e)
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
	cp $20
	ret c

	ld a, $20
	ld [wActionHelpWarioObjYCoord], a
	call ActionHelp_ShowSingleSolidBlock
	ld b, $10
	call ActionHelp_ShowBlockDebrisWithYOffset

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa796: ; 1fa796 (7e:6796)
	ld hl, wActionHelpWarioJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp $28
	jr c, .asm_1fa7a2
	ld [hl], $27
	ld a, [hl]
.asm_1fa7a2
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wActionHelpWarioObjYCoord]
	add [hl]
	ld [wActionHelpWarioObjYCoord], a
	cp $30
	ret c

	ld a, $30
	ld [wActionHelpWarioObjYCoord], a
	ld b, $00
	call ActionHelp_ShowBlockDebrisWithYOffset
	ld hl, wMenuObj4
	call ActionHelp_HideBlockDebris
	call ActionHelp_ShowWarioGroundShake
	ld a, $20
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa7d0: ; 1fa7d0 (7e:67d0)
	ld a, [wMenuObj5AnimationHasFinished]
	and a
	jr z, .asm_1fa7d9
	call ActionHelp_HideObj5BlockDebris
.asm_1fa7d9
	ld hl, wTimer
	dec [hl]
	jr z, .asm_1fa801
	ld a, [hl]
	cp $05
	jr nz, .asm_1fa7ea
	call ActionHelp_ShowWarioJump
	call ActionHelp_ClearDPadInput
.asm_1fa7ea
	ld hl, wSCY
	ld a, [wTimer]
	and $03
	cp $03
	jr z, .asm_1fa7fb
	cp $01
	jr z, .asm_1fa7fe
	ret
.asm_1fa7fb
	inc [hl]
	inc [hl]
	ret
.asm_1fa7fe
	dec [hl]
	dec [hl]
	ret
.asm_1fa801
	ld a, $18
	ld [wActionHelpWarioJumpVelIndex], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa80b: ; 1fa80b (7e:680b)
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
	cp $40
	ret c
	ld a, $40
	ld [wActionHelpWarioObjYCoord], a
	call ActionHelp_ShowWarioIdle
	xor a
	ld [wActionHelpWarioJumpVelIndex], a
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fa837: ; 1fa837 (7e:6837)
	ld hl, wTimer
	dec [hl]
	ret nz
	jp Func_1fa4b2
; 0x1fa83f
