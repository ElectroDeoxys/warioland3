SuperGrabGloveActionHelp:
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
	ld a, [wObjAnimWasReset]
	ld [wActionHelpWarioAnimationEnded], a

.action_help_frozen
	ld hl, wMenuObj4YCoord
	farcall LoadActionHelpSprite_Far
	ld hl, wActionHelpWario
	farcall LoadActionHelpWarioSprite

	ld hl, wMenuObj6FramesetPtr + 1
	ld a, [wMenuObj6FramesetBank]
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall UpdateObjAnim
	ld hl, wMenuObj6
	farcall LoadActionHelpSprite_Far
.done
	ret

.StateTable:
	ld a, [wActionHelpState]
	jumptable

	dw ActionHelp_Init
	dw Func_1fb1ac
	dw Func_1fb1d4
	dw Func_1fb1f6
	dw Func_1fb248
	dw Func_1fb25d
	dw Func_1fb270
	dw Func_1fb2f2
	dw Func_1fb302
	dw Func_1fb324
	dw Func_1fb376
	dw Func_1fb385
	dw Func_1fb397
	dw Func_1fb3aa
	dw Func_1fb43e
	dw Func_1fb44e
	dw Func_1fb470
	dw Func_1fb4c2
	dw Func_1fb4d2
	dw Func_1fb4ed
	dw Func_1fb4fa
	dw Func_1fb52b
	dw Func_1fb555
	dw Func_1fb579
	dw Func_1fb58e

Func_1fb179:
	ld a, [wPowerUpLevel]
	bit ACTION_HELP_LEVEL_CLEAR_F, a
	jr nz, .asm_1fb187
	bit ACTION_HELP_TITLE_SCREEN_F, a
	jr z, .restart_action_help
	jp InitWithoutDemoPowerUpReset

.asm_1fb187
	and POWER_UP_MASK
	ld [wPowerUpLevel], a
	farcall Func_4628
	call Func_1795
	ret

.restart_action_help
	call ActionHelp_ClearDPadInput
	call ActionHelp_ClearButtonsInput
	ld a, $01
	ld [wActionHelpState], a
	jr Func_1fb1b1

Func_1fb1ac:
	ld hl, wTimer
	dec [hl]
	ret nz
Func_1fb1b1:
	call ActionHelp_ShowInitialWarioWalk
	call ActionHelp_ShowDRightInput
	call ActionHelp_ShowCountRichtertoffIdle
	call ActionHelp_ShowCountRichtertoffStun
	call ActionHelp_ShowOverheadPillar
	farcall LoadActionHelpPalsWithoutWater

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb1d4:
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [hl]
	cp $48
	ret nc

	ld hl, wActionHelpWarioYCoord
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $05
	ld [de], a
	inc de
	ld a, [hl]
	add $10
	ld [de], a
	call ActionHelp_ShowWarioSlowGrab
	call ActionHelp_ClearDPadInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb1f6:
	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp $07
	jr z, .asm_1fb20e
	cp $0d
	jr z, .asm_1fb21e
	cp $0f
	jr z, .asm_1fb22e
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	jr nz, .asm_1fb23e
	ret

.asm_1fb20e
	ld hl, wActionHelpWarioYCoord
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $04
	ld [de], a
	inc de
	ld a, [hl]
	add $10
	ld [de], a
	ret

.asm_1fb21e
	ld hl, wActionHelpWarioYCoord
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $14
	ld [de], a
	inc de
	ld a, [hl]
	add $10
	ld [de], a
	ret

.asm_1fb22e
	ld hl, wActionHelpWarioYCoord
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $1c
	ld [de], a
	inc de
	ld a, [hl]
	add $06
	ld [de], a
	ret

.asm_1fb23e
	ld [hl], $30
	call ActionHelp_ShowWarioBeginGrab

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb248:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioBeginThrow
	call ActionHelp_ShowBInput
	ld a, $20
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb25d:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioThrow
	call ActionHelp_ShowCountRichtertoffThrown
	call ActionHelp_ClearButtonsInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb270:
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	jr z, .asm_1fb279
	call ActionHelp_ShowWarioIdle
.asm_1fb279
	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp $10
	jr nc, .asm_1fb2ad
	ld a, [wMenuObj4XCoord]
	add $02
	ld [wMenuObj4XCoord], a
	ld a, [hl]
	cp $03
	ret c
	ld hl, wMenuObj4YCoord
	cp $06
	jr c, .asm_1fb29c
	cp $0a
	jr c, .asm_1fb29b
	jr .asm_1fb29e

.asm_1fb29b
	inc [hl]
.asm_1fb29c
	inc [hl]
	ret

.asm_1fb29e
	ld a, [hl]
	add $03
	ld [hl], a
	cp $40
	ret c
	ld [hl], $40
	ld a, $10
	ld [wTimer], a
	ret

.asm_1fb2ad
	ld a, [wMenuObj4XCoord]
	add $01
	ld [wMenuObj4XCoord], a
	ld a, [hl]
	ld hl, wMenuObj4YCoord
	cp $12
	jr c, .asm_1fb2cf
	cp $14
	jr c, .asm_1fb2d0
	cp $15
	jr c, .asm_1fb2d1
	cp $16
	jr c, .asm_1fb2d3
	cp $27
	jr c, .asm_1fb29c
	jr .asm_1fb2d9
.asm_1fb2cf
	dec [hl]
.asm_1fb2d0
	dec [hl]
.asm_1fb2d1
	dec [hl]
	ret

.asm_1fb2d3
	ld a, $20
	ld [wTimer], a
	ret

.asm_1fb2d9
	ld a, [hl]
	add $02
	ld [hl], a
	cp $40
	ret c

	ld [hl], $40
	call ActionHelp_ShowWarioIdle
	call ActionHelp_ShowCountRichtertoffStun
	ld a, $20
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb2f2:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb302:
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [hl]
	cp $48
	ret nc

	ld hl, wActionHelpWarioYCoord
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $05
	ld [de], a
	inc de
	ld a, [hl]
	add $10
	ld [de], a
	call ActionHelp_ShowWarioSlowGrab
	call ActionHelp_ClearDPadInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb324:
	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp $07
	jr z, .asm_1fb33c
	cp $0d
	jr z, .asm_1fb34c
	cp $0f
	jr z, .asm_1fb35c
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	jr nz, .asm_1fb36c
	ret

.asm_1fb33c
	ld hl, wActionHelpWarioYCoord
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $04
	ld [de], a
	inc de
	ld a, [hl]
	add $10
	ld [de], a
	ret

.asm_1fb34c
	ld hl, wActionHelpWarioYCoord
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $14
	ld [de], a
	inc de
	ld a, [hl]
	add $10
	ld [de], a
	ret

.asm_1fb35c
	ld hl, wActionHelpWarioYCoord
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $1c
	ld [de], a
	inc de
	ld a, [hl]
	add $06
	ld [de], a
	ret

.asm_1fb36c
	ld [hl], $30
	call ActionHelp_ShowWarioBeginGrab

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb376:
	ld hl, wTimer
	dec [hl]
	ret nz

	ld [hl], $20
	call ActionHelp_ShowDUpInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb385:
	ld hl, wTimer
	dec [hl]
	ret nz

	ld [hl], $30
	call ActionHelp_ShowWarioBeginThrow
	call ActionHelp_ShowBInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb397:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioThrow
	call ActionHelp_ShowCountRichtertoffThrown
	call ActionHelp_ClearButtonsInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb3aa:
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	jr z, .asm_1fb3b3
	call ActionHelp_ShowWarioIdle
.asm_1fb3b3
	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp $30
	jr nc, .asm_1fb401
	ld a, [wMenuObj4XCoord]
	add $01
	ld [wMenuObj4XCoord], a
	ld a, [hl]
	ld hl, wMenuObj4YCoord
	cp $07
	jr c, .asm_1fb3e9
	cp $0d
	jr c, .asm_1fb3ea
	cp $0f
	jr c, .asm_1fb3eb
	cp $11
	jr c, .asm_1fb3ec
	cp $14
	ret c
	cp $17
	jr c, .asm_1fb3f0
	cp $1a
	jr c, .asm_1fb3ef
	cp $1d
	jr c, .asm_1fb3ee
	jr .asm_1fb3f2
.asm_1fb3e9
	dec [hl]
.asm_1fb3ea
	dec [hl]
.asm_1fb3eb
	dec [hl]
.asm_1fb3ec
	dec [hl]
	ret

.asm_1fb3ee
	inc [hl]
.asm_1fb3ef
	inc [hl]
.asm_1fb3f0
	inc [hl]
	ret

.asm_1fb3f2
	ld a, [hl]
	add $04
	ld [hl], a
	cp $40
	ret c
	ld [hl], $40
	ld a, $30
	ld [wTimer], a
	ret

.asm_1fb401
	ld a, [hl]
	ld hl, wMenuObj4YCoord
	cp $32
	jr c, .asm_1fb41b
	cp $34
	jr c, .asm_1fb41c
	cp $35
	jr c, .asm_1fb41d
	cp $36
	jr c, .asm_1fb41f
	cp $47
	jr c, .asm_1fb3f0
	jr .asm_1fb425

.asm_1fb41b
	dec [hl]
.asm_1fb41c
	dec [hl]
.asm_1fb41d
	dec [hl]
	ret

.asm_1fb41f
	ld a, $40
	ld [wTimer], a
	ret

.asm_1fb425
	ld a, [hl]
	add $02
	ld [hl], a
	cp $40
	ret c

	ld [hl], $40
	call ActionHelp_ShowWarioIdle
	call ActionHelp_ShowCountRichtertoffStun
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb43e:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb44e:
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [hl]
	cp $48
	ret nc

	ld hl, wActionHelpWarioYCoord
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $05
	ld [de], a
	inc de
	ld a, [hl]
	add $10
	ld [de], a
	call ActionHelp_ShowWarioSlowGrab
	call ActionHelp_ClearDPadInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb470:
	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp $07
	jr z, .asm_1fb488
	cp $0d
	jr z, .asm_1fb498
	cp $0f
	jr z, .asm_1fb4a8
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	jr nz, .asm_1fb4b8
	ret

.asm_1fb488
	ld hl, wActionHelpWarioYCoord
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $04
	ld [de], a
	inc de
	ld a, [hl]
	add $10
	ld [de], a
	ret

.asm_1fb498
	ld hl, wActionHelpWarioYCoord
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $14
	ld [de], a
	inc de
	ld a, [hl]
	add $10
	ld [de], a
	ret

.asm_1fb4a8
	ld hl, wActionHelpWarioYCoord
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $1c
	ld [de], a
	inc de
	ld a, [hl]
	add $06
	ld [de], a
	ret

.asm_1fb4b8
	ld [hl], $30
	call ActionHelp_ShowWarioBeginGrab

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb4c2:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioGrabWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb4d2:
	ld hl, wMenuObj6XCoord
	dec [hl]
	ld a, [hl]
	cp $80
	ret nc

	call ActionHelp_ShowWarioBeginThrow
	call ActionHelp_ClearDPadInput
	call ActionHelp_ShowBInput
	ld a, $50
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb4ed:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioChargeThrow

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb4fa:
	play_sfx_rept 30, SFX_FULLY_CHARGED_THROW

	ld a, [wActionHelpWarioAnimationEnded]
	and a
	ret z

	call ActionHelp_ShowWarioFullyChargedGrab
	ld a, [wMenuObj4XCoord]
	sub $08
	ld [wMenuObj4XCoord], a
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb52b:
	play_sfx_rept 30, SFX_FULLY_CHARGED_THROW

	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioFullyChargedThrow
	call ActionHelp_ShowCountRichtertoffThrown
	call ActionHelp_ClearButtonsInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb555:
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	jr z, .asm_1fb55e
	call ActionHelp_ShowWarioIdle
.asm_1fb55e
	ld a, [wMenuObj6XCoord]
	sub $10
	ld b, a
	ld a, [wMenuObj4XCoord]
	add $04
	ld [wMenuObj4XCoord], a
	cp b
	ret c

	call ActionHelp_ShowWarioIdle
	call ActionHelp_ShowObj4EnemyVanish

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb579:
	ld a, [wMenuObj4AnimationEnded]
	and a
	ret z
	ld a, $e8
	ld [wMenuObj4XCoord], a
	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1fb58e:
	ld hl, wMenuObj6XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .asm_1fb59a
	dec [hl]
.asm_1fb59a
	ld a, [hl]
	cp $e8
	ret c
	jp Func_1fb179
